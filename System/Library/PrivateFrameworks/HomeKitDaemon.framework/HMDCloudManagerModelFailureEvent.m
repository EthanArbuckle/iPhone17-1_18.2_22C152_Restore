@interface HMDCloudManagerModelFailureEvent
- (HMDCloudManagerModelFailureEvent)initWithModel:(id)a3 failureCode:(unint64_t)a4 error:(id)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)errorCode;
- (NSNumber)failureCode;
- (NSString)coreAnalyticsEventName;
- (NSString)errorDomain;
- (NSString)model;
- (id)attributeDescriptions;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDCloudManagerModelFailureEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorCode, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_failureCode, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (NSNumber)errorCode
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)errorDomain
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)failureCode
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDCloudManagerModelFailureEvent *)self model];
  v5 = (void *)[v3 initWithName:@"model" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDCloudManagerModelFailureEvent *)self failureCode];
  v8 = (void *)[v6 initWithName:@"failureCode" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMDCloudManagerModelFailureEvent *)self errorDomain];
  v11 = (void *)[v9 initWithName:@"errorDomain" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMDCloudManagerModelFailureEvent *)self errorCode];
  v14 = (void *)[v12 initWithName:@"errorCode" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];

  return v15;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v10[4] = *MEMORY[0x263EF8340];
  v9[0] = @"modelClass";
  id v3 = [(HMDCloudManagerModelFailureEvent *)self model];
  v10[0] = v3;
  v9[1] = @"failureCode";
  v4 = [(HMDCloudManagerModelFailureEvent *)self failureCode];
  v10[1] = v4;
  v9[2] = @"errorDomain";
  v5 = [(HMDCloudManagerModelFailureEvent *)self errorDomain];
  v10[2] = v5;
  v9[3] = @"errorCode";
  id v6 = [(HMDCloudManagerModelFailureEvent *)self errorCode];
  v10[3] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];

  return (NSDictionary *)v7;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.HMDCloudManagerModelFailureEvent";
}

- (HMDCloudManagerModelFailureEvent)initWithModel:(id)a3 failureCode:(unint64_t)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v11 = v10;
  if (!v10)
  {
LABEL_7:
    v21 = (HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)_HMFPreconditionFailure();
    [(HMDAccessoryFirmwareUpdateConcurrencyLogEventManager *)v21 .cxx_destruct];
    return result;
  }
  v23.receiver = self;
  v23.super_class = (Class)HMDCloudManagerModelFailureEvent;
  id v12 = [(HMMLogEvent *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_model, a3);
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:a4];
    failureCode = v13->_failureCode;
    v13->_failureCode = (NSNumber *)v14;

    uint64_t v16 = [v11 domain];
    errorDomain = v13->_errorDomain;
    v13->_errorDomain = (NSString *)v16;

    uint64_t v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "code"));
    errorCode = v13->_errorCode;
    v13->_errorCode = (NSNumber *)v18;
  }
  return v13;
}

@end