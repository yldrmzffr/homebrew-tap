cask "humon" do
  version "0.1.6"
  sha256 "9c9783b6a4ef210055ab65163119424f124ee3a326e44027e79d20e77373700a"

  url "https://github.com/yldrmzffr/humon/releases/download/v#{version}/humon-#{version}-macos-universal.zip"
  name "humon"
  desc "Small, fast MongoDB client"
  homepage "https://github.com/yldrmzffr/humon"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "humon.app"

  zap trash: "~/Library/Application Support/dev.muzaffer.humon"

  caveats <<~EOS
    humon is not notarized by Apple yet, so macOS blocks its first launch.
    Open System Settings → Privacy & Security and click "Open Anyway", or run:
      xattr -dr com.apple.quarantine #{appdir}/humon.app

    Saved passwords live in the Keychain under "dev.muzaffer.humon";
    `brew uninstall --zap` leaves them, remove them in Keychain Access.
  EOS
end
