@interface AVTUIAlwaysShowSplashScreen
@end

@implementation AVTUIAlwaysShowSplashScreen

uint64_t __AVTUIAlwaysShowSplashScreen_once_block_invoke()
{
  uint64_t result = _AVTUIBoolForInternalSettingKey(@"AVTAvatarAlwaysShowSplashScreen", 0);
  AVTUIAlwaysShowSplashScreen_once_enabled = result;
  return result;
}

@end