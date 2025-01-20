@interface AVTUIAlwaysShowRecentStickersSplashScreen
@end

@implementation AVTUIAlwaysShowRecentStickersSplashScreen

uint64_t __AVTUIAlwaysShowRecentStickersSplashScreen_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTUIGlobalPreferencesAlwaysShowStickerRecentsSplashScreen", 0);
  AVTUIAlwaysShowRecentStickersSplashScreen_once_enabled = result;
  return result;
}

@end