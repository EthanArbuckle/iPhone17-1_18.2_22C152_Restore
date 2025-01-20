@interface HMDRemoteDeviceReachabilityChangeLogEvent
- (BOOL)reachable;
- (BOOL)targetSupportsIDSPresence;
- (HMDRemoteDeviceReachabilityChangeLogEvent)initWithReason:(unint64_t)a3 reachable:(BOOL)a4 targetSupportsIDSPresence:(BOOL)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)reason;
@end

@implementation HMDRemoteDeviceReachabilityChangeLogEvent

- (BOOL)targetSupportsIDSPresence
{
  return self->_targetSupportsIDSPresence;
}

- (BOOL)reachable
{
  return self->_reachable;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v9[0] = @"reachable";
  v3 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDRemoteDeviceReachabilityChangeLogEvent reachable](self, "reachable"));
  v10[0] = v3;
  v9[1] = @"reason";
  unint64_t v4 = [(HMDRemoteDeviceReachabilityChangeLogEvent *)self reason];
  if (v4 > 6) {
    v5 = @"unknown";
  }
  else {
    v5 = off_1E6A0C5C0[v4];
  }
  v10[1] = v5;
  v9[2] = @"targetSupportsIDSPresence";
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDRemoteDeviceReachabilityChangeLogEvent targetSupportsIDSPresence](self, "targetSupportsIDSPresence"));
  v10[2] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:3];

  return (NSDictionary *)v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.remoteDevice.reachability";
}

- (HMDRemoteDeviceReachabilityChangeLogEvent)initWithReason:(unint64_t)a3 reachable:(BOOL)a4 targetSupportsIDSPresence:(BOOL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)HMDRemoteDeviceReachabilityChangeLogEvent;
  result = [(HMMLogEvent *)&v9 init];
  if (result)
  {
    result->_reason = a3;
    result->_reachable = a4;
    result->_targetSupportsIDSPresence = a5;
  }
  return result;
}

@end