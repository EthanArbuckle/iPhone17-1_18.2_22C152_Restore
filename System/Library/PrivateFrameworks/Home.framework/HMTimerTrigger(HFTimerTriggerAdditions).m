@interface HMTimerTrigger(HFTimerTriggerAdditions)
- (uint64_t)hf_triggerType;
@end

@implementation HMTimerTrigger(HFTimerTriggerAdditions)

- (uint64_t)hf_triggerType
{
  return 1;
}

@end