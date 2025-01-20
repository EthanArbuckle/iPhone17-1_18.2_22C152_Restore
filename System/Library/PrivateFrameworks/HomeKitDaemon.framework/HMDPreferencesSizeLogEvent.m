@interface HMDPreferencesSizeLogEvent
- (HMDPreferencesSizeLogEvent)initWithApplicationID:(id)a3 preferencesKey:(id)a4 preferencesSize:(unint64_t)a5 eventTrigger:(unint64_t)a6;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)applicationID;
- (NSString)coreAnalyticsEventName;
- (NSString)preferencesKey;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)eventTrigger;
- (unint64_t)preferencesSize;
@end

@implementation HMDPreferencesSizeLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferencesKey, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
}

- (unint64_t)eventTrigger
{
  return self->_eventTrigger;
}

- (unint64_t)preferencesSize
{
  return self->_preferencesSize;
}

- (NSString)preferencesKey
{
  return self->_preferencesKey;
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMDPreferencesSizeLogEvent *)self applicationID];
  [v3 setObject:v4 forKeyedSubscript:@"applicationID"];

  v5 = [(HMDPreferencesSizeLogEvent *)self preferencesKey];
  [v3 setObject:v5 forKeyedSubscript:@"preferencesKey"];

  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDPreferencesSizeLogEvent preferencesSize](self, "preferencesSize"));
  [v3 setObject:v6 forKeyedSubscript:@"preferencesSize"];

  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDPreferencesSizeLogEvent eventTrigger](self, "eventTrigger"));
  [v3 setObject:v7 forKeyedSubscript:@"eventTrigger"];

  v8 = (void *)[v3 copy];
  return (NSDictionary *)v8;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.preferences.size";
}

- (HMDPreferencesSizeLogEvent)initWithApplicationID:(id)a3 preferencesKey:(id)a4 preferencesSize:(unint64_t)a5 eventTrigger:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDPreferencesSizeLogEvent;
  v13 = [(HMMLogEvent *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_applicationID, a3);
    objc_storeStrong((id *)&v14->_preferencesKey, a4);
    v14->_preferencesSize = a5;
    v14->_eventTrigger = a6;
  }

  return v14;
}

@end