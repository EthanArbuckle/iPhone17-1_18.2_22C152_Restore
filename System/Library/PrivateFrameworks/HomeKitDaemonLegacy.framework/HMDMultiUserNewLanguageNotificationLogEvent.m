@interface HMDMultiUserNewLanguageNotificationLogEvent
- (HMDMultiUserNewLanguageNotificationLogEvent)initWithLanguage:(id)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)language;
- (id)attributeDescriptions;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDMultiUserNewLanguageNotificationLogEvent

- (void).cxx_destruct
{
}

- (NSString)language
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDMultiUserNewLanguageNotificationLogEvent *)self language];
  v5 = (void *)[v3 initWithName:@"language" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v5 = @"language";
  v2 = [(HMDMultiUserNewLanguageNotificationLogEvent *)self language];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.HMDMultiUserNewLanguageNotificationLogEvent";
}

- (HMDMultiUserNewLanguageNotificationLogEvent)initWithLanguage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDMultiUserNewLanguageNotificationLogEvent;
  v6 = [(HMMLogEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_language, a3);
  }

  return v7;
}

@end