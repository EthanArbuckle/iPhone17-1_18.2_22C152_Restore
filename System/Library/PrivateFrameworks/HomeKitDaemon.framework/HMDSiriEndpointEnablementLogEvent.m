@interface HMDSiriEndpointEnablementLogEvent
+ (id)logCategory;
- (HMDSiriEndpointEnablementLogEvent)initWithConfigurationDataSource:(id)a3;
- (HMDSiriEndpointEnablementLogEvent)initWithDictionary:(id)a3;
- (HMDSiriEndpointEnablementLogEvent)initWithHomeUUID:(id)a3 numCapableSiriEndpoints:(unint64_t)a4 numEnabledSiriEndpoints:(unint64_t)a5;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (id)serializedMetric;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)numCapableSiriEndpointAccessories;
- (unint64_t)numEnabledSiriEndpointAccessories;
@end

@implementation HMDSiriEndpointEnablementLogEvent

- (unint64_t)numEnabledSiriEndpointAccessories
{
  return self->_numEnabledSiriEndpointAccessories;
}

- (unint64_t)numCapableSiriEndpointAccessories
{
  return self->_numCapableSiriEndpointAccessories;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v8[2] = *MEMORY[0x263EF8340];
  v7[0] = @"numCapableSiriEndpointAccessories";
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSiriEndpointEnablementLogEvent numCapableSiriEndpointAccessories](self, "numCapableSiriEndpointAccessories"));
  v7[1] = @"numEnabledSiriEndpointAccessories";
  v8[0] = v3;
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSiriEndpointEnablementLogEvent numEnabledSiriEndpointAccessories](self, "numEnabledSiriEndpointAccessories"));
  v8[1] = v4;
  v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];

  return (NSDictionary *)v5;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.siri.endpoint.enablement";
}

- (id)serializedMetric
{
  v9[3] = *MEMORY[0x263EF8340];
  v8[0] = @"homeUUID";
  v3 = [(HMMHomeLogEvent *)self homeUUIDString];
  v9[0] = v3;
  v8[1] = @"numCapableEndpoints";
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSiriEndpointEnablementLogEvent numCapableSiriEndpointAccessories](self, "numCapableSiriEndpointAccessories"));
  v9[1] = v4;
  v8[2] = @"numEnabledEndpoints";
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDSiriEndpointEnablementLogEvent numEnabledSiriEndpointAccessories](self, "numEnabledSiriEndpointAccessories"));
  v9[2] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (HMDSiriEndpointEnablementLogEvent)initWithDictionary:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"homeUUID"];
  v6 = [v4 objectForKeyedSubscript:@"numCapableEndpoints"];
  v7 = [v4 objectForKeyedSubscript:@"numEnabledEndpoints"];
  v8 = v7;
  if (v5 && v6 && v7)
  {
    v9 = -[HMDSiriEndpointEnablementLogEvent initWithHomeUUID:numCapableSiriEndpoints:numEnabledSiriEndpoints:](self, "initWithHomeUUID:numCapableSiriEndpoints:numEnabledSiriEndpoints:", v5, [v6 unsignedIntValue], objc_msgSend(v7, "unsignedIntValue"));
    v10 = v9;
  }
  else
  {
    v11 = (void *)MEMORY[0x230FBD990]();
    v9 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v13;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Could not init HMDSiriEndpointEnablementLogEvent with dictionary %@", (uint8_t *)&v15, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

- (HMDSiriEndpointEnablementLogEvent)initWithHomeUUID:(id)a3 numCapableSiriEndpoints:(unint64_t)a4 numEnabledSiriEndpoints:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)HMDSiriEndpointEnablementLogEvent;
  result = [(HMMHomeLogEvent *)&v8 initWithHomeUUID:a3];
  if (result)
  {
    result->_numCapableSiriEndpointAccessories = a4;
    result->_numEnabledSiriEndpointAccessories = a5;
  }
  return result;
}

- (HMDSiriEndpointEnablementLogEvent)initWithConfigurationDataSource:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v21 = a3;
  v3 = [v21 accessories];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v22 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(id *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v10 = v9;
        }
        else {
          v10 = 0;
        }
        id v11 = v10;

        if (v11)
        {
          v12 = [v11 hostAccessory];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0 || !v12)
          {
            unsigned int v14 = [v11 hasSiriEndpointService];
            int v15 = [v11 siriEndpointProfile];
            v16 = v15;
            if (v15 && ([v15 siriTouchToUse] == 1 || objc_msgSend(v16, "siriListening") == 1)) {
              ++v22;
            }
            v6 += v14;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v22 = 0;
    uint64_t v6 = 0;
  }

  __int16 v17 = [v21 uuid];
  id v18 = [(HMDSiriEndpointEnablementLogEvent *)self initWithHomeUUID:v17 numCapableSiriEndpoints:v6 numEnabledSiriEndpoints:v22];

  return v18;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_274184 != -1) {
    dispatch_once(&logCategory__hmf_once_t11_274184, &__block_literal_global_63_274185);
  }
  v2 = (void *)logCategory__hmf_once_v12_274186;
  return v2;
}

void __48__HMDSiriEndpointEnablementLogEvent_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v12_274186;
  logCategory__hmf_once_v12_274186 = v0;
}

@end