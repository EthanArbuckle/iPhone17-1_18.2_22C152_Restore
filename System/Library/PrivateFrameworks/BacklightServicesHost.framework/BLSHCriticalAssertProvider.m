@interface BLSHCriticalAssertProvider
- (void)didDetectSignificantUserInteraction;
@end

@implementation BLSHCriticalAssertProvider

- (void)didDetectSignificantUserInteraction
{
  if (didDetectSignificantUserInteraction_onceToken_0 != -1) {
    dispatch_once(&didDetectSignificantUserInteraction_onceToken_0, &__block_literal_global_107);
  }
}

BOOL __65__BLSHCriticalAssertProvider_didDetectSignificantUserInteraction__block_invoke()
{
  return BLSHCheckForCriticalAssertFailureAndPrompt(1, 0);
}

@end