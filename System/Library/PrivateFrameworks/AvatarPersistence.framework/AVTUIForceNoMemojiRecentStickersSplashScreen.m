@interface AVTUIForceNoMemojiRecentStickersSplashScreen
@end

@implementation AVTUIForceNoMemojiRecentStickersSplashScreen

uint64_t __AVTUIForceNoMemojiRecentStickersSplashScreen_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesForceNoMemojiStickerRecentsSplashScreen", 0);
  AVTUIForceNoMemojiRecentStickersSplashScreen_once_enabled = result;
  return result;
}

@end