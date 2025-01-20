@interface HMDHAPMetricsReachabilityTimerLateEvent
- (HMDHAPMetricsReachabilityTimerLateEvent)initWithAccessory:(id)a3 actualDuration:(id)a4 expectedDuration:(id)a5;
- (NSNumber)actualDuration;
- (NSNumber)expectedDuration;
- (id)coreAnalyticsEventDictionary;
- (id)coreAnalyticsEventName;
@end

@implementation HMDHAPMetricsReachabilityTimerLateEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedDuration, 0);
  objc_storeStrong((id *)&self->_actualDuration, 0);
}

- (NSNumber)expectedDuration
{
  return self->_expectedDuration;
}

- (NSNumber)actualDuration
{
  return self->_actualDuration;
}

- (id)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMDHAPMetricsReachabilityTimerLateEvent *)self actualDuration];

  if (v4)
  {
    v5 = NSNumber;
    v6 = [(HMDHAPMetricsReachabilityTimerLateEvent *)self actualDuration];
    v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "integerValue"));
    [v3 setObject:v7 forKeyedSubscript:@"duration"];
  }
  v8 = [(HMDHAPMetricsReachabilityTimerLateEvent *)self expectedDuration];
  [v3 setObject:v8 forKeyedSubscript:@"expectedDuration"];

  v9 = (void *)[v3 copy];
  return v9;
}

- (id)coreAnalyticsEventName
{
  return @"com.apple.HomeKit.daemon.reachability.timerlate";
}

- (HMDHAPMetricsReachabilityTimerLateEvent)initWithAccessory:(id)a3 actualDuration:(id)a4 expectedDuration:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDHAPMetricsReachabilityTimerLateEvent;
  v11 = [(HMDHAPMetrics *)&v14 initWithHMDAccessory:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_actualDuration, a4);
    objc_storeStrong((id *)&v12->_expectedDuration, a5);
  }

  return v12;
}

@end