@interface EMPPerformanceSupport
+ (BOOL)shouldSkipUnlockAnimationForCurrentDevice;
@end

@implementation EMPPerformanceSupport

+ (BOOL)shouldSkipUnlockAnimationForCurrentDevice
{
  if (shouldSkipUnlockAnimationForCurrentDevice_onceToken[0] != -1) {
    dispatch_once(shouldSkipUnlockAnimationForCurrentDevice_onceToken, &__block_literal_global_0);
  }
  return shouldSkipUnlockAnimationForCurrentDevice_shouldSkip;
}

uint64_t __66__EMPPerformanceSupport_shouldSkipUnlockAnimationForCurrentDevice__block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  if (result) {
    shouldSkipUnlockAnimationForCurrentDevice_shouldSkip = 1;
  }
  return result;
}

@end