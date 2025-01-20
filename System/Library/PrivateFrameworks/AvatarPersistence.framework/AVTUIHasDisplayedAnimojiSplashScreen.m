@interface AVTUIHasDisplayedAnimojiSplashScreen
@end

@implementation AVTUIHasDisplayedAnimojiSplashScreen

uint64_t __AVTUIHasDisplayedAnimojiSplashScreen_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTAvatarHasDisplayedAnimojiSplashScreen", 0);
  AVTUIHasDisplayedAnimojiSplashScreen_once_enabled = result;
  return result;
}

@end