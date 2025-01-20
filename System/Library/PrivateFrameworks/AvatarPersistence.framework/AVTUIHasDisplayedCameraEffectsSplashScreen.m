@interface AVTUIHasDisplayedCameraEffectsSplashScreen
@end

@implementation AVTUIHasDisplayedCameraEffectsSplashScreen

uint64_t __AVTUIHasDisplayedCameraEffectsSplashScreen_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTAvatarHasDisplayedCameraEffectsSplashScreen", 0);
  AVTUIHasDisplayedCameraEffectsSplashScreen_once_enabled = result;
  return result;
}

@end