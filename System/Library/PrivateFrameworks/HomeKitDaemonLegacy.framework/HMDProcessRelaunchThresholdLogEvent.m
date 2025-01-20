@interface HMDProcessRelaunchThresholdLogEvent
- (HMDProcessRelaunchThresholdLogEvent)initWithTimeSincePreviousLaunch:(id)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)timeIntervalSincePreviousProcessLaunch;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDProcessRelaunchThresholdLogEvent

- (void).cxx_destruct
{
}

- (NSNumber)timeIntervalSincePreviousProcessLaunch
{
  return self->_timeIntervalSincePreviousProcessLaunch;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8 = @"timeIntervalSincePreviousProcessLaunch";
  v3 = +[HMDLogEventHistograms latencyHistogram];
  v4 = [(HMDProcessRelaunchThresholdLogEvent *)self timeIntervalSincePreviousProcessLaunch];
  v5 = objc_msgSend(v3, "intervalIndexForValue:", 1000 * objc_msgSend(v4, "unsignedIntegerValue"));
  v9[0] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.processLaunch.relaunchThresholdLogEvent";
}

- (HMDProcessRelaunchThresholdLogEvent)initWithTimeSincePreviousLaunch:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDProcessRelaunchThresholdLogEvent;
  v6 = [(HMMLogEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_timeIntervalSincePreviousProcessLaunch, a3);
  }

  return v7;
}

@end