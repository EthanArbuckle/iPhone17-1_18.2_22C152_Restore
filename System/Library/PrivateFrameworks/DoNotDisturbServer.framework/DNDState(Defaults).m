@interface DNDState(Defaults)
+ (id)fallbackState;
@end

@implementation DNDState(Defaults)

+ (id)fallbackState
{
  id v0 = objc_alloc(MEMORY[0x1E4F5F750]);
  v1 = [MEMORY[0x1E4F1C9C8] distantPast];
  v2 = [MEMORY[0x1E4F1C9C8] distantFuture];
  v3 = (void *)[v0 initWithSuppressionState:0 activeModeAssertionMetadata:MEMORY[0x1E4F1CBF0] startDate:v1 userVisibleTransitionDate:v2 userVisibleTransitionLifetimeType:0 activeModeConfiguration:0];

  return v3;
}

@end