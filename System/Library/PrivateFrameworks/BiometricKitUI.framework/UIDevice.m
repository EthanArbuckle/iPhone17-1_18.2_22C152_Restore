@interface UIDevice
@end

@implementation UIDevice

uint64_t __45__UIDevice_sfHelpers__bkui_IsInternalInstall__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  bkui_IsInternalInstall___internalInstall = result;
  return result;
}

@end