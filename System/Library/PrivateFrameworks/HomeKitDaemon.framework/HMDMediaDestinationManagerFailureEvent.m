@interface HMDMediaDestinationManagerFailureEvent
- (HMDMediaDestinationManagerFailureEvent)initWithFailureCode:(unint64_t)a3 error:(id)a4;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)errorCode;
- (NSNumber)failureCode;
- (NSString)coreAnalyticsEventName;
- (NSString)errorDomain;
- (id)attributeDescriptions;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDMediaDestinationManagerFailureEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureCode, 0);
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
}

- (NSNumber)failureCode
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)errorCode
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)errorDomain
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDMediaDestinationManagerFailureEvent *)self failureCode];
  v5 = HMDMediaDestinationManagerFailureCodeAsString([v4 integerValue]);
  v6 = (void *)[v3 initWithName:@"failureCode" value:v5];
  id v7 = objc_alloc(MEMORY[0x263F424F8]);
  v8 = [(HMDMediaDestinationManagerFailureEvent *)self errorDomain];
  v9 = (void *)[v7 initWithName:@"errorDomain" value:v8];
  v15[1] = v9;
  id v10 = objc_alloc(MEMORY[0x263F424F8]);
  v11 = [(HMDMediaDestinationManagerFailureEvent *)self errorCode];
  v12 = (void *)[v10 initWithName:@"errorCode" value:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:3];

  return v13;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"errorDomain";
  id v3 = [(HMDMediaDestinationManagerFailureEvent *)self errorDomain];
  v9[0] = v3;
  v8[1] = @"errorCode";
  v4 = [(HMDMediaDestinationManagerFailureEvent *)self errorCode];
  v9[1] = v4;
  v8[2] = @"failureCode";
  v5 = [(HMDMediaDestinationManagerFailureEvent *)self failureCode];
  v9[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.HMDMediaDestinationManagerFailureEvent";
}

- (HMDMediaDestinationManagerFailureEvent)initWithFailureCode:(unint64_t)a3 error:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = v6;
    v18.receiver = self;
    v18.super_class = (Class)HMDMediaDestinationManagerFailureEvent;
    v8 = [(HMMLogEvent *)&v18 init];
    if (v8)
    {
      uint64_t v9 = [v7 domain];
      errorDomain = v8->_errorDomain;
      v8->_errorDomain = (NSString *)v9;

      uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "code"));
      errorCode = v8->_errorCode;
      v8->_errorCode = (NSNumber *)v11;

      uint64_t v13 = [NSNumber numberWithUnsignedInteger:a3];
      failureCode = v8->_failureCode;
      v8->_failureCode = (NSNumber *)v13;
    }
    return v8;
  }
  else
  {
    v16 = (void *)_HMFPreconditionFailure();
    return (HMDMediaDestinationManagerFailureEvent *)+[_MKFNotificationRegistrationCharacteristic backingModelProtocol];
  }
}

@end