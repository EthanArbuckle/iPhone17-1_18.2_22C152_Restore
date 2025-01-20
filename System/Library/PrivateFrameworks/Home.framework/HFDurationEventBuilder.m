@interface HFDurationEventBuilder
- (HFDurationEventBuilder)initWithEvent:(id)a3;
- (double)duration;
- (id)buildNewEventsFromCurrentState;
- (id)compareToObject:(id)a3;
- (id)comparisonKey;
- (id)description;
- (id)eventType;
- (void)setDuration:(double)a3;
@end

@implementation HFDurationEventBuilder

- (HFDurationEventBuilder)initWithEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFDurationEventBuilder;
  v5 = [(HFEventBuilder *)&v8 initWithEvent:v4];
  if (v5)
  {
    [v4 duration];
    v5->_duration = v6;
  }

  return v5;
}

- (id)buildNewEventsFromCurrentState
{
  v3 = (void *)MEMORY[0x263EFFA08];
  id v4 = objc_alloc(MEMORY[0x263F0E2D0]);
  [(HFDurationEventBuilder *)self duration];
  v5 = objc_msgSend(v4, "initWithDuration:");
  double v6 = [v3 setWithObject:v5];

  return v6;
}

- (id)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  [(HFDurationEventBuilder *)self duration];
  id v4 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"duration", 1);
  v5 = [v3 build];

  return v5;
}

- (id)eventType
{
  return @"HFEventTypeDuration";
}

- (id)comparisonKey
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HFDurationEventBuilder;
  id v4 = [(HFEventBuilder *)&v8 comparisonKey];
  [(HFDurationEventBuilder *)self duration];
  double v6 = [v3 stringWithFormat:@"%@-%f", v4, v5];

  return v6;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFDurationEventBuilder;
  uint64_t v5 = [(HFEventBuilder *)&v12 compareToObject:v4];
  if (([v5 containsCriticalDifference] & 1) == 0)
  {
    double v6 = NSNumber;
    [(HFDurationEventBuilder *)self duration];
    v7 = objc_msgSend(v6, "numberWithDouble:");
    objc_super v8 = NSNumber;
    [v4 duration];
    v9 = objc_msgSend(v8, "numberWithDouble:");
    v10 = +[HFPropertyDifference compareObjectA:v7 toObjectB:v9 key:@"duration" priority:3];
    [v5 add:v10];
  }
  return v5;
}

@end