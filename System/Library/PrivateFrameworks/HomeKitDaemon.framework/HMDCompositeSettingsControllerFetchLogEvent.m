@interface HMDCompositeSettingsControllerFetchLogEvent
- (HMDCompositeSettingsControllerFetchLogEvent)initWithStartTime:(double)a3 keyPath:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)keyPath;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDCompositeSettingsControllerFetchLogEvent

- (void).cxx_destruct
{
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMDCompositeSettingsControllerFetchLogEvent *)self keyPath];
  [v3 setObject:v4 forKeyedSubscript:@"keyPath"];

  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  [v3 setObject:v5 forKeyedSubscript:@"latency"];

  v6 = (void *)[v3 copy];
  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.CompositeSettingsController.FetchLogEvent";
}

- (HMDCompositeSettingsControllerFetchLogEvent)initWithStartTime:(double)a3 keyPath:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDCompositeSettingsControllerFetchLogEvent;
  v8 = [(HMMLogEvent *)&v11 initWithStartTime:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_keyPath, a4);
  }

  return v9;
}

@end