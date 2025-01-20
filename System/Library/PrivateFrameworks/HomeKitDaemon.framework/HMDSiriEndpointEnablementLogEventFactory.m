@interface HMDSiriEndpointEnablementLogEventFactory
+ (id)logCategory;
- (HMDHouseholdMetricsDataSource)dataSource;
- (HMDSiriEndpointEnablementLogEventFactory)initWithDataSource:(id)a3;
- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4;
- (id)logEventsFromDictionary:(id)a3;
- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4;
- (id)serializeLogEvents:(id)a3;
@end

@implementation HMDSiriEndpointEnablementLogEventFactory

- (void).cxx_destruct
{
}

- (HMDHouseholdMetricsDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDHouseholdMetricsDataSource *)WeakRetained;
}

- (id)coalescedLogEventsFromLogEvents:(id)a3 homeUUID:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v5);
        }
        id v13 = *(id *)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v14 = v13;
        }
        else {
          v14 = 0;
        }
        id v15 = v14;

        if (v15)
        {
          unint64_t v16 = [v15 numCapableSiriEndpointAccessories];
          if (v10 <= v16) {
            unint64_t v10 = v16;
          }
          unint64_t v17 = [v15 numEnabledSiriEndpointAccessories];
          if (v9 <= v17) {
            unint64_t v9 = v17;
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }
  else
  {
    unint64_t v9 = 0;
    unint64_t v10 = 0;
  }
  v18 = [[HMDSiriEndpointEnablementLogEvent alloc] initWithHomeUUID:v6 numCapableSiriEndpoints:v10 numEnabledSiriEndpoints:v9];
  v25 = v18;
  v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];

  return v19;
}

- (id)logEventsFromDictionary:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [[HMDSiriEndpointEnablementLogEvent alloc] initWithDictionary:v3];

  if (v4)
  {
    v7[0] = v4;
    id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)serializeLogEvents:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count] == 1)
  {
    id v5 = [v4 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = [v7 serializedMetric];
  }
  else
  {
    if ([v4 count])
    {
      unint64_t v9 = (void *)MEMORY[0x230FBD990]();
      unint64_t v10 = self;
      uint64_t v11 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = HMFGetLogIdentifier();
        int v14 = 138543618;
        id v15 = v12;
        __int16 v16 = 2048;
        uint64_t v17 = [v4 count];
        _os_log_impl(&dword_22F52A000, v11, OS_LOG_TYPE_ERROR, "%{public}@We are trying to serialize %lu HMDSiriEndpointEnablementLogEvent objects, which is impossible", (uint8_t *)&v14, 0x16u);
      }
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)logEventsPopulatedForHomeWithUUID:(id)a3 associatedWithDate:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v8 = [(HMDSiriEndpointEnablementLogEventFactory *)self dataSource];
  unint64_t v9 = [v8 homeDataSources];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v15 = [v14 uuid];
        char v16 = [v15 isEqual:v6];

        if (v16)
        {
          long long v22 = [[HMDSiriEndpointEnablementLogEvent alloc] initWithConfigurationDataSource:v14];
          v32 = v22;
          long long v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];

          goto LABEL_13;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v17 = (void *)MEMORY[0x230FBD990]();
  uint64_t v18 = self;
  v19 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v20;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@No home found with UUID %@", buf, 0x16u);
  }
  long long v21 = 0;
LABEL_13:

  return v21;
}

- (HMDSiriEndpointEnablementLogEventFactory)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDSiriEndpointEnablementLogEventFactory;
  id v5 = [(HMDSiriEndpointEnablementLogEventFactory *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_274198 != -1) {
    dispatch_once(&logCategory__hmf_once_t6_274198, &__block_literal_global_274199);
  }
  v2 = (void *)logCategory__hmf_once_v7_274200;
  return v2;
}

void __55__HMDSiriEndpointEnablementLogEventFactory_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v7_274200;
  logCategory__hmf_once_v7_274200 = v0;
}

@end