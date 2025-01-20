@interface AVTUIHasDisplayedSplashScreen
@end

@implementation AVTUIHasDisplayedSplashScreen

uint64_t __AVTUIHasDisplayedSplashScreen_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTAvatarHasDisplayedSplashScreen", 0);
  AVTUIHasDisplayedSplashScreen_once_enabled = result;
  return result;
}

@end