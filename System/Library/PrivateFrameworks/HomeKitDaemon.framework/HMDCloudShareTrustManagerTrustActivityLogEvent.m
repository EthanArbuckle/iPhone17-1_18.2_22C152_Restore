@interface HMDCloudShareTrustManagerTrustActivityLogEvent
- (HMDCloudShareTrustManagerTrustActivityLogEvent)initWithTrustActivityType:(int64_t)a3 privilege:(unint64_t)a4 isPrimaryResident:(BOOL)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSNumber)isPrimaryResident;
- (NSNumber)privilege;
- (NSNumber)trustActivityType;
- (NSString)coreAnalyticsEventName;
- (unint64_t)coreAnalyticsEventOptions;
@end

@implementation HMDCloudShareTrustManagerTrustActivityLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isPrimaryResident, 0);
  objc_storeStrong((id *)&self->_privilege, 0);
  objc_storeStrong((id *)&self->_trustActivityType, 0);
}

- (NSNumber)isPrimaryResident
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)privilege
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)trustActivityType
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"trustActivityType";
  v3 = [(HMDCloudShareTrustManagerTrustActivityLogEvent *)self trustActivityType];
  v9[0] = v3;
  v8[1] = @"userPrivilege";
  v4 = [(HMDCloudShareTrustManagerTrustActivityLogEvent *)self privilege];
  v9[1] = v4;
  v8[2] = @"isPrimaryResident";
  v5 = [(HMDCloudShareTrustManagerTrustActivityLogEvent *)self isPrimaryResident];
  v9[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return (NSDictionary *)v6;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.trustManager.activity";
}

- (HMDCloudShareTrustManagerTrustActivityLogEvent)initWithTrustActivityType:(int64_t)a3 privilege:(unint64_t)a4 isPrimaryResident:(BOOL)a5
{
  BOOL v5 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDCloudShareTrustManagerTrustActivityLogEvent;
  v8 = [(HMMLogEvent *)&v16 init];
  if (v8)
  {
    uint64_t v9 = [NSNumber numberWithInteger:a3];
    trustActivityType = v8->_trustActivityType;
    v8->_trustActivityType = (NSNumber *)v9;

    uint64_t v11 = [NSNumber numberWithUnsignedInteger:a4];
    privilege = v8->_privilege;
    v8->_privilege = (NSNumber *)v11;

    uint64_t v13 = [NSNumber numberWithBool:v5];
    isPrimaryResident = v8->_isPrimaryResident;
    v8->_isPrimaryResident = (NSNumber *)v13;
  }
  return v8;
}

@end