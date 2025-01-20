@interface HMDCloudPairedMetadataVersionConfiguration
+ (id)logCategory;
- (HMDCloudPairedMetadataDiagnostics)diagnostics;
- (HMDCloudPairedMetadataVersionConfiguration)initWithAccessoryIdentifier:(id)a3 diagnostics:(id)a4;
- (HMDCloudPairedMetadataVersionConfiguration)initWithAccessoryIdentifier:(id)a3 jsonDictionary:(id)a4;
- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)accessoryIdentifier;
- (NSDictionary)prettyJSONDictionary;
- (id)attributeDescriptions;
@end

@implementation HMDCloudPairedMetadataVersionConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
}

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (HMDCloudPairedMetadataDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (NSDictionary)prettyJSONDictionary
{
  v7[1] = *MEMORY[0x263EF8340];
  v6 = @"versionConfiguration";
  v2 = [(HMDCloudPairedMetadataVersionConfiguration *)self diagnostics];
  v3 = [v2 description];
  v7[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return (NSDictionary *)v4;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDCloudPairedMetadataVersionConfiguration *)self accessoryIdentifier];
  v5 = (void *)[v3 initWithName:@"accessoryIdentifier" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDCloudPairedMetadataVersionConfiguration *)self diagnostics];
  v8 = (void *)[v6 initWithName:@"diagnosticsConfiguration" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDCloudPairedMetadataVersionConfiguration)initWithAccessoryIdentifier:(id)a3 jsonDictionary:(id)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = (__CFString *)a3;
  id v7 = a4;
  v8 = [(__CFString *)v6 firmwareVersion];

  if (v8)
  {
    v9 = [v7 objectForKeyedSubscript:@"d"];
    v10 = v9;
    if (v9)
    {
      id v11 = v9;
      objc_opt_class();
      int v12 = objc_opt_isKindOfClass() & 1;
      if (v12) {
        v13 = v11;
      }
      else {
        v13 = 0;
      }
      id v14 = v13;

      if (v12)
      {
        v15 = [[HMDCloudPairedMetadataDiagnostics alloc] initWithAccessoryIdentifier:v6 jsonDictionary:v11];
        if (v15)
        {
          v16 = [(HMDCloudPairedMetadataVersionConfiguration *)self initWithAccessoryIdentifier:v6 diagnostics:v15];
          v17 = v16;
        }
        else
        {
          v27 = (void *)MEMORY[0x230FBD990]();
          v16 = self;
          v28 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = HMFGetLogIdentifier();
            int v31 = 138543874;
            v32 = v29;
            __int16 v33 = 2112;
            v34 = @"d";
            __int16 v35 = 2112;
            id v36 = v7;
            _os_log_impl(&dword_22F52A000, v28, OS_LOG_TYPE_ERROR, "%{public}@JSON contains an invalid '%@' value: %@", (uint8_t *)&v31, 0x20u);
          }
          v17 = 0;
        }
      }
      else
      {
        v24 = (void *)MEMORY[0x230FBD990]();
        v16 = self;
        v25 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = HMFGetLogIdentifier();
          int v31 = 138543874;
          v32 = v26;
          __int16 v33 = 2112;
          v34 = @"d";
          __int16 v35 = 2112;
          id v36 = v7;
          _os_log_impl(&dword_22F52A000, v25, OS_LOG_TYPE_ERROR, "%{public}@JSON contains an invalid '%@' value: %@", (uint8_t *)&v31, 0x20u);
        }
        v17 = 0;
      }
    }
    else
    {
      v21 = (void *)MEMORY[0x230FBD990]();
      v16 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = HMFGetLogIdentifier();
        int v31 = 138543874;
        v32 = v23;
        __int16 v33 = 2112;
        v34 = @"d";
        __int16 v35 = 2112;
        id v36 = v7;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@JSON contains no '%@' value: %@", (uint8_t *)&v31, 0x20u);
      }
      v17 = 0;
    }
  }
  else
  {
    v18 = (void *)MEMORY[0x230FBD990]();
    v16 = self;
    v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      int v31 = 138543618;
      v32 = v20;
      __int16 v33 = 2112;
      v34 = v6;
      _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Version configuration must contain firmware version: %@", (uint8_t *)&v31, 0x16u);
    }
    v17 = 0;
  }

  return v17;
}

- (HMDCloudPairedMetadataVersionConfiguration)initWithAccessoryIdentifier:(id)a3 diagnostics:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDCloudPairedMetadataVersionConfiguration;
  v9 = [(HMDCloudPairedMetadataVersionConfiguration *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessoryIdentifier, a3);
    objc_storeStrong((id *)&v10->_diagnostics, a4);
    id v11 = v10;
  }

  return v10;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_195191 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_195191, &__block_literal_global_195192);
  }
  v2 = (void *)logCategory__hmf_once_v1_195193;
  return v2;
}

void __57__HMDCloudPairedMetadataVersionConfiguration_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_195193;
  logCategory__hmf_once_v1_195193 = v0;
}

@end