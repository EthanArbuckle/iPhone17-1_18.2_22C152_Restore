@interface HAPMetricsBonjourIncorrrectStateLogEvent
- (HAPMetricsBonjourIncorrrectStateLogEvent)initWithDeviceID:(id)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)deviceID;
- (unint64_t)coreAnalyticsEventOptions;
- (void)setDeviceID:(id)a3;
@end

@implementation HAPMetricsBonjourIncorrrectStateLogEvent

- (void).cxx_destruct
{
}

- (void)setDeviceID:(id)a3
{
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"accessoryID_STRING";
  v2 = [(HAPMetricsBonjourIncorrrectStateLogEvent *)self deviceID];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.bonjourIncorrectState";
}

- (HAPMetricsBonjourIncorrrectStateLogEvent)initWithDeviceID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAPMetricsBonjourIncorrrectStateLogEvent;
  v6 = [(HMMLogEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_deviceID, a3);
  }

  return v7;
}

@end