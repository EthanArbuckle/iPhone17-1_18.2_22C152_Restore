@interface HMDBackgroundTaskLogEvent
- (BOOL)didFire;
- (HMDBackgroundTaskLogEvent)initWithTask:(id)a3 didFire:(BOOL)a4 now:(id)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)description;
- (double)fireDelay;
- (double)scheduledToExpectedFireInterval;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDBackgroundTaskLogEvent

- (BOOL)didFire
{
  return self->_didFire;
}

- (double)scheduledToExpectedFireInterval
{
  return self->_scheduledToExpectedFireInterval;
}

- (double)fireDelay
{
  return self->_fireDelay;
}

- (NSString)description
{
  v3 = NSString;
  [(HMDBackgroundTaskLogEvent *)self fireDelay];
  uint64_t v5 = v4;
  [(HMDBackgroundTaskLogEvent *)self scheduledToExpectedFireInterval];
  uint64_t v7 = v6;
  [(HMDBackgroundTaskLogEvent *)self didFire];
  v8 = HMFBooleanToString();
  v9 = [v3 stringWithFormat:@"<HMDBackgroundTaskLogEvent fireDelay: %fs scheduledToExpectedFireInterval: %fs didFire: %@>", v5, v7, v8];

  return (NSString *)v9;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v11[3] = *MEMORY[0x263EF8340];
  v10[0] = @"fireDelay";
  v3 = NSNumber;
  [(HMDBackgroundTaskLogEvent *)self fireDelay];
  uint64_t v4 = objc_msgSend(v3, "numberWithDouble:");
  v11[0] = v4;
  v10[1] = @"scheduledToExpectedFireInterval";
  uint64_t v5 = NSNumber;
  [(HMDBackgroundTaskLogEvent *)self scheduledToExpectedFireInterval];
  uint64_t v6 = objc_msgSend(v5, "numberWithDouble:");
  v11[1] = v6;
  v10[2] = @"didFire";
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDBackgroundTaskLogEvent didFire](self, "didFire"));
  v11[2] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return (NSDictionary *)v8;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.BTMLogEvent";
}

- (HMDBackgroundTaskLogEvent)initWithTask:(id)a3 didFire:(BOOL)a4 now:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDBackgroundTaskLogEvent;
  v10 = [(HMMLogEvent *)&v18 init];
  v11 = v10;
  if (v10)
  {
    v10->_didFire = a4;
    if (a4)
    {
      v12 = [v8 expectedFireDate];
      [v9 timeIntervalSinceDate:v12];
      v11->_fireDelay = v13;
    }
    else
    {
      v10->_fireDelay = 0.0;
    }
    v14 = [v8 expectedFireDate];
    v15 = [v8 scheduledDate];
    [v14 timeIntervalSinceDate:v15];
    v11->_scheduledToExpectedFireInterval = v16;
  }
  return v11;
}

@end