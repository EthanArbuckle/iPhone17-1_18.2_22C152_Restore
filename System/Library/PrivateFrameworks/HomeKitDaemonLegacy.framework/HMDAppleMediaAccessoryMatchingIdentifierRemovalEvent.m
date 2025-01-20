@interface HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent
- (HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent)initWithRemovalCount:(int64_t)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)removalCount;
- (NSString)coreAnalyticsEventName;
- (id)attributeDescriptions;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent

- (void).cxx_destruct
{
}

- (NSNumber)removalCount
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent *)self removalCount];
  v5 = (void *)[v3 initWithName:@"removalCount" value:v4];
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
  v5 = @"removalCount";
  v2 = [(HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent *)self removalCount];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent";
}

- (HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent)initWithRemovalCount:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HMDAppleMediaAccessoryMatchingIdentifierRemovalEvent;
  v4 = [(HMMLogEvent *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [NSNumber numberWithInteger:a3];
    removalCount = v4->_removalCount;
    v4->_removalCount = (NSNumber *)v5;
  }
  return v4;
}

@end