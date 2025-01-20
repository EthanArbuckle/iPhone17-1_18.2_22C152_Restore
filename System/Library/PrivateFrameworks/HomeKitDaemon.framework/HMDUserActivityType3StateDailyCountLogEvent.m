@interface HMDUserActivityType3StateDailyCountLogEvent
- (HMDUserActivityType3StateDailyCountLogEvent)initWithTotalManualScheduleUpdateCount:(unint64_t)a3 totalAutomaticScheduleStateUpdateCount:(unint64_t)a4 totalManualFocusUpdateCount:(unint64_t)a5 enterType5ByManualScheduleUpdateCount:(unint64_t)a6 enterType5ByAutomaticScheduleStateUpdateCount:(unint64_t)a7 enterType5ByManualFocusUpdateCount:(unint64_t)a8 enterTransitionByManualScheduleUpdateCount:(unint64_t)a9 enterTransitionByAutomaticScheduleStateUpdateCount:(unint64_t)a10 enterTransitionByManualFocusUpdateCount:(unint64_t)a11;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)enterTransitionByAutomaticScheduleStateUpdateCount;
- (unint64_t)enterTransitionByManualFocusUpdateCount;
- (unint64_t)enterTransitionByManualScheduleUpdateCount;
- (unint64_t)enterType5ByAutomaticScheduleStateUpdateCount;
- (unint64_t)enterType5ByManualFocusUpdateCount;
- (unint64_t)enterType5ByManualScheduleUpdateCount;
- (unint64_t)totalAutomaticScheduleStateUpdateCount;
- (unint64_t)totalManualFocusUpdateCount;
- (unint64_t)totalManualScheduleUpdateCount;
@end

@implementation HMDUserActivityType3StateDailyCountLogEvent

- (unint64_t)enterTransitionByManualFocusUpdateCount
{
  return self->_enterTransitionByManualFocusUpdateCount;
}

- (unint64_t)enterTransitionByAutomaticScheduleStateUpdateCount
{
  return self->_enterTransitionByAutomaticScheduleStateUpdateCount;
}

- (unint64_t)enterTransitionByManualScheduleUpdateCount
{
  return self->_enterTransitionByManualScheduleUpdateCount;
}

- (unint64_t)enterType5ByManualFocusUpdateCount
{
  return self->_enterType5ByManualFocusUpdateCount;
}

- (unint64_t)enterType5ByAutomaticScheduleStateUpdateCount
{
  return self->_enterType5ByAutomaticScheduleStateUpdateCount;
}

- (unint64_t)enterType5ByManualScheduleUpdateCount
{
  return self->_enterType5ByManualScheduleUpdateCount;
}

- (unint64_t)totalManualFocusUpdateCount
{
  return self->_totalManualFocusUpdateCount;
}

- (unint64_t)totalAutomaticScheduleStateUpdateCount
{
  return self->_totalAutomaticScheduleStateUpdateCount;
}

- (unint64_t)totalManualScheduleUpdateCount
{
  return self->_totalManualScheduleUpdateCount;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v15[9] = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent totalManualScheduleUpdateCount](self, "totalManualScheduleUpdateCount", @"totalManualScheduleUpdateCount"));
  v15[0] = v3;
  v14[1] = @"totalAutomaticScheduleStateUpdateCount";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent totalAutomaticScheduleStateUpdateCount](self, "totalAutomaticScheduleStateUpdateCount"));
  v15[1] = v4;
  v14[2] = @"totalManualFocusUpdateCount";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent totalManualFocusUpdateCount](self, "totalManualFocusUpdateCount"));
  v15[2] = v5;
  v14[3] = @"enterType5ByManualScheduleUpdateCount";
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent enterType5ByManualScheduleUpdateCount](self, "enterType5ByManualScheduleUpdateCount"));
  v15[3] = v6;
  v14[4] = @"enterType5ByAutomaticScheduleStateUpdateCount";
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent enterType5ByAutomaticScheduleStateUpdateCount](self, "enterType5ByAutomaticScheduleStateUpdateCount"));
  v15[4] = v7;
  v14[5] = @"enterType5ByManualFocusUpdateCount";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent enterType5ByManualFocusUpdateCount](self, "enterType5ByManualFocusUpdateCount"));
  v15[5] = v8;
  v14[6] = @"enterTransitionByManualScheduleUpdateCount";
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent enterTransitionByManualScheduleUpdateCount](self, "enterTransitionByManualScheduleUpdateCount"));
  v15[6] = v9;
  v14[7] = @"enterTransitionByAutomaticScheduleStateUpdateCount";
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent enterTransitionByAutomaticScheduleStateUpdateCount](self, "enterTransitionByAutomaticScheduleStateUpdateCount"));
  v15[7] = v10;
  v14[8] = @"enterTransitionByManualFocusUpdateCount";
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDUserActivityType3StateDailyCountLogEvent enterTransitionByManualFocusUpdateCount](self, "enterTransitionByManualFocusUpdateCount"));
  v15[8] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:9];

  return (NSDictionary *)v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.homed.HomeAS.HMDUserActivityType3StateDailyCountLogEvent";
}

- (HMDUserActivityType3StateDailyCountLogEvent)initWithTotalManualScheduleUpdateCount:(unint64_t)a3 totalAutomaticScheduleStateUpdateCount:(unint64_t)a4 totalManualFocusUpdateCount:(unint64_t)a5 enterType5ByManualScheduleUpdateCount:(unint64_t)a6 enterType5ByAutomaticScheduleStateUpdateCount:(unint64_t)a7 enterType5ByManualFocusUpdateCount:(unint64_t)a8 enterTransitionByManualScheduleUpdateCount:(unint64_t)a9 enterTransitionByAutomaticScheduleStateUpdateCount:(unint64_t)a10 enterTransitionByManualFocusUpdateCount:(unint64_t)a11
{
  v18.receiver = self;
  v18.super_class = (Class)HMDUserActivityType3StateDailyCountLogEvent;
  result = [(HMMLogEvent *)&v18 init];
  if (result)
  {
    result->_totalManualScheduleUpdateCount = a3;
    result->_totalAutomaticScheduleStateUpdateCount = a4;
    result->_totalManualFocusUpdateCount = a5;
    result->_enterType5ByManualScheduleUpdateCount = a6;
    result->_enterType5ByAutomaticScheduleStateUpdateCount = a7;
    result->_enterType5ByManualFocusUpdateCount = a8;
    result->_enterTransitionByManualScheduleUpdateCount = a9;
    result->_enterTransitionByAutomaticScheduleStateUpdateCount = a10;
    result->_enterTransitionByManualFocusUpdateCount = a11;
  }
  return result;
}

@end