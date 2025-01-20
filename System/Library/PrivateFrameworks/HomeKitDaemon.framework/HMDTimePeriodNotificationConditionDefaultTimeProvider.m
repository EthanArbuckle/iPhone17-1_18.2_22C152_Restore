@interface HMDTimePeriodNotificationConditionDefaultTimeProvider
- (id)currentDate;
@end

@implementation HMDTimePeriodNotificationConditionDefaultTimeProvider

- (id)currentDate
{
  return (id)[MEMORY[0x263EFF910] now];
}

@end