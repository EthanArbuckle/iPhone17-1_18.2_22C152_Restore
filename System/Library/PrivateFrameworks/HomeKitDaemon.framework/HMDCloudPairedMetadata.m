@interface HMDCloudPairedMetadata
+ (id)__decodeVersionConfigurationWithVersionString:(id)a3 versionConfigurationValue:(id)a4 baseAccessoryIdentifier:(id)a5;
+ (id)_decodeVersionConfigurationsFromJSONDictionary:(id)a3 baseAccessoryIdentifier:(id)a4 allowUnzippedData:(BOOL)a5;
+ (id)logCategory;
- (HMDCloudPairedMetadata)initWithBaseAccessoryIdentifier:(id)a3 data:(id)a4;
- (HMDCloudPairedMetadata)initWithBaseAccessoryIdentifier:(id)a3 data:(id)a4 allowUnzippedData:(BOOL)a5;
- (HMDCloudPairedMetadata)initWithBaseAccessoryIdentifier:(id)a3 versionConfigurations:(id)a4;
- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)baseAccessoryIdentifier;
- (NSArray)versionConfigurations;
- (NSDictionary)prettyJSONDictionary;
- (id)attributeDescriptions;
@end

@implementation HMDCloudPairedMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionConfigurations, 0);
  objc_storeStrong((id *)&self->_baseAccessoryIdentifier, 0);
}

- (NSArray)versionConfigurations
{
  return self->_versionConfigurations;
}

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)baseAccessoryIdentifier
{
  return self->_baseAccessoryIdentifier;
}

- (NSDictionary)prettyJSONDictionary
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v4 = [(HMDCloudPairedMetadata *)self versionConfigurations];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v10 = [v9 accessoryIdentifier];
        v11 = [v10 firmwareVersion];
        v12 = [v11 versionString];

        v13 = [v9 prettyJSONDictionary];
        [v3 setObject:v13 forKeyedSubscript:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }

  v21 = @"versionConfigurations";
  v14 = (void *)[v3 copy];
  v22 = v14;
  v15 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];

  return (NSDictionary *)v15;
}

- (id)attributeDescriptions
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDCloudPairedMetadata *)self versionConfigurations];
  uint64_t v5 = (void *)[v3 initWithName:@"VersionConfigurations" value:v4];
  v8[0] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (HMDCloudPairedMetadata)initWithBaseAccessoryIdentifier:(id)a3 data:(id)a4 allowUnzippedData:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v27 = 0;
  v10 = [MEMORY[0x263F08900] JSONObjectWithData:v9 options:0 error:&v27];
  id v11 = v27;
  v12 = v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13)
  {
    id v18 = v10;
    objc_opt_class();
    int v19 = objc_opt_isKindOfClass() & 1;
    if (v19) {
      long long v20 = v18;
    }
    else {
      long long v20 = 0;
    }
    id v21 = v20;

    if (v19)
    {
      v22 = [(id)objc_opt_class() _decodeVersionConfigurationsFromJSONDictionary:v18 baseAccessoryIdentifier:v8 allowUnzippedData:v5];
      if (v22)
      {
        self = [(HMDCloudPairedMetadata *)self initWithBaseAccessoryIdentifier:v8 versionConfigurations:v22];
        long long v17 = self;
      }
      else
      {
        long long v17 = 0;
      }
    }
    else
    {
      v23 = (void *)MEMORY[0x230FBD990]();
      self = self;
      uint64_t v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v29 = v25;
        __int16 v30 = 2112;
        id v31 = v18;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@JSON is not a dictionary: %@", buf, 0x16u);
      }
      long long v17 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x230FBD990]();
    self = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v16;
      __int16 v30 = 2112;
      id v31 = v12;
      _os_log_impl(&dword_22F52A000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse JSON: %@", buf, 0x16u);
    }
    long long v17 = 0;
  }

  return v17;
}

- (HMDCloudPairedMetadata)initWithBaseAccessoryIdentifier:(id)a3 data:(id)a4
{
  return [(HMDCloudPairedMetadata *)self initWithBaseAccessoryIdentifier:a3 data:a4 allowUnzippedData:0];
}

- (HMDCloudPairedMetadata)initWithBaseAccessoryIdentifier:(id)a3 versionConfigurations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDCloudPairedMetadata;
  id v9 = [(HMDCloudPairedMetadata *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseAccessoryIdentifier, a3);
    objc_storeStrong((id *)&v10->_versionConfigurations, a4);
    id v11 = v10;
  }

  return v10;
}

+ (id)_decodeVersionConfigurationsFromJSONDictionary:(id)a3 baseAccessoryIdentifier:(id)a4 allowUnzippedData:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    id v10 = [v8 objectForKeyedSubscript:@"v"];
    objc_opt_class();
    id v11 = (objc_opt_isKindOfClass() & 1) != 0 ? v10 : 0;
    id v12 = v11;

    if (v12) {
      goto LABEL_31;
    }
  }
  id v49 = 0;
  char v13 = decodeStringFromJSONDictionary(v8, @"v", 1, &v49);
  id v14 = v49;
  v15 = v14;
  if (v13)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v14 options:0];
    if (v16)
    {
      long long v17 = v16;
      id v18 = objc_msgSend(v16, "hmd_uncompressedData");
      if (!v18)
      {
        contexta = (void *)MEMORY[0x230FBD990]();
        id v28 = a1;
        v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          __int16 v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = @"v";
          *(_WORD *)&buf[22] = 2112;
          id v51 = v8;
          _os_log_impl(&dword_22F52A000, v29, OS_LOG_TYPE_ERROR, "%{public}@JSON contains '%@' value that is not compressed properly: %@", buf, 0x20u);
        }
        id v10 = 0;
        int v23 = 1;
LABEL_29:

        if (v23) {
          goto LABEL_30;
        }
LABEL_31:
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        LOBYTE(v51) = 0;
        v37 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count", v40));
        v43[0] = MEMORY[0x263EF8330];
        v43[1] = 3221225472;
        v43[2] = __115__HMDCloudPairedMetadata__decodeVersionConfigurationsFromJSONDictionary_baseAccessoryIdentifier_allowUnzippedData___block_invoke;
        v43[3] = &unk_264A29A80;
        id v47 = a1;
        id v44 = v9;
        v46 = buf;
        id v38 = v37;
        id v45 = v38;
        [v10 enumerateKeysAndObjectsUsingBlock:v43];
        if (*(unsigned char *)(*(void *)&buf[8] + 24)) {
          v36 = 0;
        }
        else {
          v36 = (void *)[v38 copy];
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_35;
      }
      id v48 = 0;
      int v19 = [MEMORY[0x263F08900] JSONObjectWithData:v18 options:0 error:&v48];
      id context = v48;
      if (v19)
      {
        id v10 = v19;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        if (isKindOfClass) {
          id v21 = v10;
        }
        else {
          id v21 = 0;
        }
        id v22 = v21;

        if (isKindOfClass)
        {
          int v23 = 0;
LABEL_28:

          goto LABEL_29;
        }
        v40 = (void *)MEMORY[0x230FBD990]();
        id v34 = a1;
        uint64_t v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v35;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = @"v";
          *(_WORD *)&buf[22] = 2112;
          id v51 = v8;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@JSON contains a '%@' value that is not a dictionary: %@", buf, 0x20u);
        }
      }
      else
      {
        v40 = (void *)MEMORY[0x230FBD990]();
        id v31 = a1;
        uint64_t v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v33;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = @"v";
          *(_WORD *)&buf[22] = 2112;
          id v51 = v8;
          __int16 v52 = 2112;
          id v53 = context;
          _os_log_impl(&dword_22F52A000, v32, OS_LOG_TYPE_ERROR, "%{public}@JSON contains '%@' value that is not valid JSON: %@: %@", buf, 0x2Au);
        }
      }

      id v10 = 0;
      int v23 = 1;
      goto LABEL_28;
    }
    uint64_t v24 = (void *)MEMORY[0x230FBD990]();
    id v25 = a1;
    v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = @"v";
      *(_WORD *)&buf[22] = 2112;
      id v51 = v8;
      _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@JSON contains '%@' value that is not valid base64: %@", buf, 0x20u);
    }
  }
  else
  {
  }
  id v10 = 0;
LABEL_30:
  v36 = 0;
LABEL_35:

  return v36;
}

void __115__HMDCloudPairedMetadata__decodeVersionConfigurationsFromJSONDictionary_baseAccessoryIdentifier_allowUnzippedData___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  id v8 = a2;
  objc_msgSend((id)objc_opt_class(), "__decodeVersionConfigurationWithVersionString:versionConfigurationValue:baseAccessoryIdentifier:", v8, v7, *(void *)(a1 + 32));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = v10;
  if (v10)
  {
    [*(id *)(a1 + 40) addObject:v10];
    id v9 = v10;
  }
  else
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

+ (id)__decodeVersionConfigurationWithVersionString:(id)a3 versionConfigurationValue:(id)a4 baseAccessoryIdentifier:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:v8];
  if (v11)
  {
    id v12 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v13 = v12;
    }
    else {
      char v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      v15 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
      v16 = [v10 productGroup];
      long long v17 = [v10 productNumber];
      id v18 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v15 initWithProductGroup:v16 productNumber:v17 firmwareVersion:v11];

      int v19 = [[HMDCloudPairedMetadataVersionConfiguration alloc] initWithAccessoryIdentifier:v18 jsonDictionary:v14];
    }
    else
    {
      uint64_t v24 = (void *)MEMORY[0x230FBD990]();
      id v25 = a1;
      v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = HMFGetLogIdentifier();
        int v29 = 138543874;
        __int16 v30 = v27;
        __int16 v31 = 2112;
        id v32 = v8;
        __int16 v33 = 2112;
        id v34 = v12;
        _os_log_impl(&dword_22F52A000, v26, OS_LOG_TYPE_ERROR, "%{public}@Version configuration for version '%@' is not a dictionary: %@", (uint8_t *)&v29, 0x20u);
      }
      int v19 = 0;
    }
  }
  else
  {
    long long v20 = (void *)MEMORY[0x230FBD990]();
    id v21 = a1;
    id v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v23 = HMFGetLogIdentifier();
      int v29 = 138543618;
      __int16 v30 = v23;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Version configuration contains an invalid version string: %@", (uint8_t *)&v29, 0x16u);
    }
    int v19 = 0;
  }

  return v19;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_181801 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_181801, &__block_literal_global_181802);
  }
  v2 = (void *)logCategory__hmf_once_v1_181803;
  return v2;
}

void __37__HMDCloudPairedMetadata_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_181803;
  logCategory__hmf_once_v1_181803 = v0;
}

@end