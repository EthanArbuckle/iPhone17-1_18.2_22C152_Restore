@interface HMDCompositeSettingsControllerUpdateLogEvent
- (HMDCompositeSettingsControllerUpdateLogEvent)initWithStartTime:(double)a3 keyPath:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDCompositeSettingsControllerUpdateLogEvent

- (void).cxx_destruct
{
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self) {
    id Property = objc_getProperty(self, v3, 40, 1);
  }
  else {
    id Property = 0;
  }
  [v4 setObject:Property forKeyedSubscript:@"keyPath"];
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMMLogEvent durationMilliseconds](self, "durationMilliseconds"));
  [v4 setObject:v6 forKeyedSubscript:@"latency"];

  v7 = (void *)[v4 copy];
  return (NSDictionary *)v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.CompositeSettingsController.UpdateLogEvent";
}

- (HMDCompositeSettingsControllerUpdateLogEvent)initWithStartTime:(double)a3 keyPath:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HMDCompositeSettingsControllerUpdateLogEvent;
  v8 = [(HMMLogEvent *)&v11 initWithStartTime:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_keyPath, a4);
  }

  return v9;
}

@end