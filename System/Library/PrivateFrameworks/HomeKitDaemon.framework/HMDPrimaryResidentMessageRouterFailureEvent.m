@interface HMDPrimaryResidentMessageRouterFailureEvent
- (HMDPrimaryResidentMessageRouterFailureEvent)initWithMessageName:(id)a3 failureType:(int64_t)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)failureType;
- (NSString)coreAnalyticsEventName;
- (NSString)messageName;
- (id)attributeDescriptions;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDPrimaryResidentMessageRouterFailureEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureType, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
}

- (NSNumber)failureType
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)messageName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v14[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDPrimaryResidentMessageRouterFailureEvent *)self messageName];
  v5 = (void *)[v3 initWithName:@"messageName" value:v4];
  v14[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDPrimaryResidentMessageRouterFailureEvent *)self failureType];
  uint64_t v8 = [v7 integerValue];
  if ((unint64_t)(v8 - 1) > 4) {
    v9 = @"UnknownValue";
  }
  else {
    v9 = off_264A14AF0[v8 - 1];
  }
  v10 = v9;
  v11 = (void *)[v6 initWithName:@"failureType" value:v10];
  v14[1] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:2];

  return v12;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"messageName";
  id v3 = [(HMDPrimaryResidentMessageRouterFailureEvent *)self messageName];
  v7[1] = @"failureType";
  v8[0] = v3;
  v4 = [(HMDPrimaryResidentMessageRouterFailureEvent *)self failureType];
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.HMDPrimaryResidentMessageRouterFailureEvent";
}

- (HMDPrimaryResidentMessageRouterFailureEvent)initWithMessageName:(id)a3 failureType:(int64_t)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDPrimaryResidentMessageRouterFailureEvent;
  uint64_t v8 = [(HMMLogEvent *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_messageName, a3);
    uint64_t v10 = [NSNumber numberWithInteger:a4];
    failureType = v9->_failureType;
    v9->_failureType = (NSNumber *)v10;
  }
  return v9;
}

@end