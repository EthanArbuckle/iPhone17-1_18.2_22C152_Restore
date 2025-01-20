@interface HFCalendarEventBuilder
- (HFCalendarEventBuilder)initWithEvent:(id)a3;
- (NSDate)effectiveFireDate;
- (NSDate)fireDate;
- (NSDateComponents)fireTimeComponents;
- (NSString)description;
- (id)_fireDateForTimeComponents:(id)a3;
- (id)buildNewEventsFromCurrentState;
- (id)compareToObject:(id)a3;
- (id)comparisonKey;
- (id)effectiveFireTimeComponents;
- (id)eventType;
- (id)naturalLanguageNameOfType:(unint64_t)a3 withHome:(id)a4 recurrences:(id)a5;
- (id)naturalLanguageNameWithOptions:(id)a3;
- (id)naturalLanguageNameWithOptions:(id)a3 recurrences:(id)a4;
- (id)performValidation;
- (void)setFireDate:(id)a3;
- (void)setFireTimeComponents:(id)a3;
- (void)updateBaseFireDateForTrigger;
@end

@implementation HFCalendarEventBuilder

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFCalendarEventBuilder;
  v5 = [(HFEventBuilder *)&v13 compareToObject:v4];
  if (([v5 containsCriticalDifference] & 1) == 0)
  {
    v6 = [(HFCalendarEventBuilder *)self fireDate];
    v7 = [v4 fireDate];
    v8 = +[HFPropertyDifference compareObjectA:v6 toObjectB:v7 key:@"fireDate" priority:3];
    [v5 add:v8];

    v9 = [(HFCalendarEventBuilder *)self fireTimeComponents];
    v10 = [v4 fireTimeComponents];
    v11 = +[HFPropertyDifference compareObjectA:v9 toObjectB:v10 key:@"fireTimeComponents" priority:3];
    [v5 add:v11];
  }
  return v5;
}

- (HFCalendarEventBuilder)initWithEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFCalendarEventBuilder;
  v5 = [(HFEventBuilder *)&v8 initWithEvent:v4];
  if (v5)
  {
    v6 = [v4 fireDateComponents];
    [(HFCalendarEventBuilder *)v5 setFireTimeComponents:v6];
  }
  return v5;
}

- (id)buildNewEventsFromCurrentState
{
  v3 = [(HFCalendarEventBuilder *)self effectiveFireTimeComponents];
  if (!v3) {
    NSLog(&cfstr_AttemptingToCr.isa, self);
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x263F0E170]) initWithFireDateComponents:v3];
  v5 = [MEMORY[0x263EFFA08] setWithObject:v4];

  return v5;
}

- (id)naturalLanguageNameOfType:(unint64_t)a3 withHome:(id)a4 recurrences:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [[HFTriggerNaturalLanguageOptions alloc] initWithHome:v9 nameType:a3];

  v11 = [(HFCalendarEventBuilder *)self naturalLanguageNameWithOptions:v10 recurrences:v8];

  return v11;
}

- (id)naturalLanguageNameWithOptions:(id)a3 recurrences:(id)a4
{
  v6 = (void *)MEMORY[0x263F0E860];
  id v7 = a4;
  id v8 = a3;
  id v9 = [(HFCalendarEventBuilder *)self effectiveFireDate];
  v10 = objc_msgSend(v6, "hf_naturalLanguageNameWithOptions:fireDate:recurrences:", v8, v9, v7);

  return v10;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  return [(HFCalendarEventBuilder *)self naturalLanguageNameWithOptions:a3 recurrences:MEMORY[0x263EFFA68]];
}

- (id)performValidation
{
  v2 = [(HFCalendarEventBuilder *)self effectiveFireDate];

  v3 = (void *)MEMORY[0x263F58190];
  if (v2)
  {
    id v4 = [MEMORY[0x263F58190] futureWithNoResult];
  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x263F087E8], "hf_errorWithCode:", 33);
    id v4 = [v3 futureWithError:v5];
  }
  return v4;
}

- (void)updateBaseFireDateForTrigger
{
  v3 = [(HFCalendarEventBuilder *)self fireTimeComponents];
  if (v3)
  {
  }
  else
  {
    id v4 = [(HFCalendarEventBuilder *)self fireDate];

    if (v4)
    {
      v5 = [(HFCalendarEventBuilder *)self effectiveFireTimeComponents];
      [(HFCalendarEventBuilder *)self setFireTimeComponents:v5];

      [(HFCalendarEventBuilder *)self setFireDate:0];
    }
  }
}

- (id)effectiveFireTimeComponents
{
  v3 = [(HFCalendarEventBuilder *)self fireTimeComponents];

  if (v3)
  {
    id v4 = [(HFCalendarEventBuilder *)self fireTimeComponents];
  }
  else
  {
    v5 = [(HFCalendarEventBuilder *)self fireDate];

    if (v5)
    {
      v6 = [MEMORY[0x263EFF8F0] currentCalendar];
      id v7 = [(HFCalendarEventBuilder *)self fireDate];
      id v4 = [v6 components:96 fromDate:v7];
    }
    else
    {
      id v4 = 0;
    }
  }
  return v4;
}

- (NSDate)effectiveFireDate
{
  v3 = [(HFCalendarEventBuilder *)self fireDate];
  id v4 = [(HFCalendarEventBuilder *)self fireTimeComponents];

  if (v4)
  {
    v5 = [(HFCalendarEventBuilder *)self fireTimeComponents];
    uint64_t v6 = [(HFCalendarEventBuilder *)self _fireDateForTimeComponents:v5];

    v3 = (void *)v6;
  }
  return (NSDate *)v3;
}

- (id)_fireDateForTimeComponents:(id)a3
{
  if (a3)
  {
    v3 = (void *)MEMORY[0x263EFF8F0];
    id v4 = a3;
    v5 = [v3 currentCalendar];
    uint64_t v6 = [MEMORY[0x263EFF910] date];
    id v7 = [v5 startOfDayForDate:v6];

    uint64_t v8 = [v4 hour];
    uint64_t v9 = [v4 minute];
    uint64_t v10 = [v4 second];

    v11 = [v5 dateBySettingHour:v8 minute:v9 second:v10 ofDate:v7 options:0];
    v12 = [MEMORY[0x263EFF910] date];
    objc_super v13 = [v12 dateByAddingTimeInterval:60.0];

    v14 = [v13 earlierDate:v11];

    if (v14 == v11)
    {
      uint64_t v15 = [v5 dateByAddingUnit:16 value:1 toDate:v11 options:0];

      v11 = (void *)v15;
    }
    v16 = [v5 dateBySettingUnit:128 value:0 ofDate:v11 options:0];

    v17 = [v5 dateBySettingUnit:0x8000 value:0 ofDate:v16 options:0];
  }
  else
  {
    v17 = 0;
  }
  return v17;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HFCalendarEventBuilder *)self fireDate];
  id v5 = (id)[v3 appendObject:v4 withName:@"fireDate"];

  uint64_t v6 = [(HFCalendarEventBuilder *)self fireTimeComponents];
  id v7 = (id)[v3 appendObject:v6 withName:@"fireTimeComponents"];

  uint64_t v8 = [v3 build];

  return (NSString *)v8;
}

- (id)eventType
{
  return @"HFEventTypeTime";
}

- (id)comparisonKey
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)HFCalendarEventBuilder;
  id v4 = [(HFEventBuilder *)&v9 comparisonKey];
  id v5 = [(HFCalendarEventBuilder *)self effectiveFireDate];
  uint64_t v6 = [(HFCalendarEventBuilder *)self fireTimeComponents];
  id v7 = [v3 stringWithFormat:@"%@-%@:%@", v4, v5, v6];

  return v7;
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
}

- (NSDateComponents)fireTimeComponents
{
  return self->_fireTimeComponents;
}

- (void)setFireTimeComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fireTimeComponents, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
}

@end