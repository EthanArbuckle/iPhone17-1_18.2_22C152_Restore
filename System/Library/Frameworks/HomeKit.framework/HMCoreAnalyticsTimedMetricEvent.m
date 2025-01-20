@interface HMCoreAnalyticsTimedMetricEvent
- (NSDate)finishedDate;
- (NSDate)startedDate;
- (NSNumber)duration;
- (id)durationData;
- (id)eventPayload;
- (void)finish;
- (void)setFinishedDate:(id)a3;
- (void)setStartedDate:(id)a3;
- (void)start;
@end

@implementation HMCoreAnalyticsTimedMetricEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedDate, 0);

  objc_storeStrong((id *)&self->_startedDate, 0);
}

- (void)setFinishedDate:(id)a3
{
}

- (NSDate)finishedDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStartedDate:(id)a3
{
}

- (NSDate)startedDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (id)durationData
{
  v2 = [(HMCoreAnalyticsTimedMetricEvent *)self duration];
  if (v2) {
    v3 = -[HMCoreAnalyticsIntegerFieldData initWithName:integerValue:]([HMCoreAnalyticsIntegerFieldData alloc], "initWithName:integerValue:", @"eventDuration", [v2 integerValue]);
  }
  else {
    v3 = [[HMCoreAnalyticsFieldData alloc] initWithName:@"eventDuration"];
  }
  v4 = v3;

  return v4;
}

- (NSNumber)duration
{
  v3 = [(HMCoreAnalyticsTimedMetricEvent *)self startedDate];
  v4 = [(HMCoreAnalyticsTimedMetricEvent *)self finishedDate];
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    [v4 timeIntervalSinceDate:v3];
    v6 = [NSNumber numberWithInt:(int)(v7 * 1000.0)];
  }

  return (NSNumber *)v6;
}

- (id)eventPayload
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v3 = [(HMCoreAnalyticsTimedMetricEvent *)self durationData];
  v11.receiver = self;
  v11.super_class = (Class)HMCoreAnalyticsTimedMetricEvent;
  v4 = [(HMCoreAnalyticsMetricEvent *)&v11 eventPayload];
  v5 = (void *)[v4 mutableCopy];

  v6 = [v3 name];
  v12 = v6;
  double v7 = [v3 value];
  v13[0] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v5 addEntriesFromDictionary:v8];

  v9 = (void *)[v5 copy];

  return v9;
}

- (void)finish
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(HMCoreAnalyticsTimedMetricEvent *)self setFinishedDate:v3];
}

- (void)start
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(HMCoreAnalyticsTimedMetricEvent *)self setStartedDate:v3];
}

@end