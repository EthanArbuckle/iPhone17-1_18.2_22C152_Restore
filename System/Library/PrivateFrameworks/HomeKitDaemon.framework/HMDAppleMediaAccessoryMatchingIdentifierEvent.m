@interface HMDAppleMediaAccessoryMatchingIdentifierEvent
- (HMDAppleMediaAccessoryMatchingIdentifierEvent)initWithMatchingIdentifiersCount:(int64_t)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)expectedRemovalCount;
- (NSNumber)matchingIdentifiersCount;
- (NSString)coreAnalyticsEventName;
- (id)attributeDescriptions;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDAppleMediaAccessoryMatchingIdentifierEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expectedRemovalCount, 0);
  objc_storeStrong((id *)&self->_matchingIdentifiersCount, 0);
}

- (NSNumber)expectedRemovalCount
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)matchingIdentifiersCount
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDAppleMediaAccessoryMatchingIdentifierEvent *)self matchingIdentifiersCount];
  v5 = (void *)[v3 initWithName:@"matchingIdentifiersCount" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDAppleMediaAccessoryMatchingIdentifierEvent *)self expectedRemovalCount];
  v8 = (void *)[v6 initWithName:@"expectedRemovalCount" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"matchingIdentifiersCount";
  id v3 = [(HMDAppleMediaAccessoryMatchingIdentifierEvent *)self matchingIdentifiersCount];
  v7[1] = @"expectedRemovalCount";
  v8[0] = v3;
  v4 = [(HMDAppleMediaAccessoryMatchingIdentifierEvent *)self expectedRemovalCount];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.HMDAppleMediaAccessoryMatchingIdentifierEvent";
}

- (HMDAppleMediaAccessoryMatchingIdentifierEvent)initWithMatchingIdentifiersCount:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)HMDAppleMediaAccessoryMatchingIdentifierEvent;
  v4 = [(HMMLogEvent *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [NSNumber numberWithInteger:a3];
    matchingIdentifiersCount = v4->_matchingIdentifiersCount;
    v4->_matchingIdentifiersCount = (NSNumber *)v5;

    uint64_t v7 = [NSNumber numberWithInteger:a3 - 1];
    expectedRemovalCount = v4->_expectedRemovalCount;
    v4->_expectedRemovalCount = (NSNumber *)v7;
  }
  return v4;
}

@end