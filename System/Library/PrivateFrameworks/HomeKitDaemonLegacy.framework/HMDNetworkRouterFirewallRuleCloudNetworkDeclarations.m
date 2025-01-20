@interface HMDNetworkRouterFirewallRuleCloudNetworkDeclarations
+ (id)__decodeRuleConfigurationWithVersionString:(id)a3 ruleConfigurationValue:(id)a4 baseAccessoryIdentifier:(id)a5;
+ (id)__decodeRuleConfigurationsFromJSONDictionary:(id)a3 baseAccessoryIdentifier:(id)a4 allowUnzippedData:(BOOL)a5;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)baseAccessoryIdentifier;
- (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations)initWithBaseAccessoryIdentifier:(id)a3 data:(id)a4;
- (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations)initWithBaseAccessoryIdentifier:(id)a3 data:(id)a4 allowUnzippedData:(BOOL)a5;
- (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations)initWithBaseAccessoryIdentifier:(id)a3 name:(id)a4 lastModifiedTime:(id)a5 ruleConfigurationsByVersionString:(id)a6;
- (NSArray)ruleConfigurations;
- (NSDate)lastModifiedTime;
- (NSDictionary)prettyJSONDictionary;
- (NSDictionary)ruleConfigurationsByVersionString;
- (NSString)name;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation HMDNetworkRouterFirewallRuleCloudNetworkDeclarations

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ruleConfigurationsByVersionString, 0);
  objc_storeStrong((id *)&self->_ruleConfigurations, 0);
  objc_storeStrong((id *)&self->_lastModifiedTime, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_baseAccessoryIdentifier, 0);
}

- (NSDictionary)ruleConfigurationsByVersionString
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSDate)lastModifiedTime
{
  return self->_lastModifiedTime;
}

- (NSString)name
{
  return self->_name;
}

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)baseAccessoryIdentifier
{
  return self->_baseAccessoryIdentifier;
}

- (NSDictionary)prettyJSONDictionary
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self ruleConfigurations];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v10 = [v9 accessoryIdentifier];
        v11 = [v10 firmwareVersion];
        v12 = [v11 versionString];

        v13 = [v9 prettyJSONDictionary];
        [v3 setObject:v13 forKeyedSubscript:v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v6);
  }

  v24[0] = @"name";
  v14 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self name];
  v25[0] = v14;
  v24[1] = @"lastModifiedTime";
  v15 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self lastModifiedTime];
  v16 = [v15 description];
  v25[1] = v16;
  v24[2] = @"ruleConfigurations";
  v17 = (void *)[v3 copy];
  v25[2] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

  return (NSDictionary *)v18;
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self baseAccessoryIdentifier];
  uint64_t v5 = (void *)[v3 initWithName:@"BaseAccessoryIdentifier" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v7 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self name];
  v8 = (void *)[v6 initWithName:@"Name" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self lastModifiedTime];
  v11 = (void *)[v9 initWithName:@"LastModifiedTime" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  v13 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self ruleConfigurations];
  v14 = (void *)[v12 initWithName:@"RuleConfigurations" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:4];

  return v15;
}

- (unint64_t)hash
{
  id v3 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self name];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self lastModifiedTime];
  uint64_t v6 = [v5 hash] ^ v4;

  uint64_t v7 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self ruleConfigurations];
  uint64_t v8 = [v7 hash];

  id v9 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self baseAccessoryIdentifier];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)a3;
  if (self == v4)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6)
    {
      uint64_t v7 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self name];
      uint64_t v8 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)v6 name];
      if ([v7 isEqualToString:v8])
      {
        id v9 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self lastModifiedTime];
        unint64_t v10 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)v6 lastModifiedTime];
        if ([v9 isEqual:v10])
        {
          v11 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self ruleConfigurationsByVersionString];
          id v12 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)v6 ruleConfigurationsByVersionString];
          if ([v11 isEqualToDictionary:v12])
          {
            v16 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self baseAccessoryIdentifier];
            v13 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)v6 baseAccessoryIdentifier];
            char v14 = [v16 isEqual:v13];
          }
          else
          {
            char v14 = 0;
          }
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  return v14;
}

- (NSArray)ruleConfigurations
{
  v2 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self ruleConfigurationsByVersionString];
  id v3 = [v2 allValues];

  return (NSArray *)v3;
}

- (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations)initWithBaseAccessoryIdentifier:(id)a3 data:(id)a4 allowUnzippedData:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v35 = 0;
  unint64_t v10 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v9 options:0 error:&v35];
  id v11 = v35;
  id v12 = v11;
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
    id v32 = v20;

    if (v19)
    {
      id v34 = 0;
      int v22 = decodeStringFromJSONDictionary(v18, @"n", 1, &v34);
      id v23 = v34;
      if (v22)
      {
        id v33 = 0;
        int v24 = decodeTimeFromJSONDictionary(v18, @"t", &v33);
        id v25 = v33;
        if (v24)
        {
          id v26 = v25;
          uint64_t v27 = objc_msgSend((id)objc_opt_class(), "__decodeRuleConfigurationsFromJSONDictionary:baseAccessoryIdentifier:allowUnzippedData:", v18, v8, v5, v32);
          if (v27)
          {
            self = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self initWithBaseAccessoryIdentifier:v8 name:v23 lastModifiedTime:v26 ruleConfigurationsByVersionString:v27];
            v17 = self;
          }
          else
          {
            v17 = 0;
          }

          id v25 = v26;
        }
        else
        {
          v17 = 0;
        }
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      v28 = (void *)MEMORY[0x1D9452090](v21);
      self = self;
      v29 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v37 = v30;
        __int16 v38 = 2112;
        id v39 = v18;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@JSON is not a dictionary: %@", buf, 0x16u);
      }
      v17 = 0;
    }
  }
  else
  {
    char v14 = (void *)MEMORY[0x1D9452090]();
    self = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v37 = v16;
      __int16 v38 = 2112;
      id v39 = v12;
      _os_log_impl(&dword_1D49D5000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse JSON: %@", buf, 0x16u);
    }
    v17 = 0;
  }

  return v17;
}

- (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations)initWithBaseAccessoryIdentifier:(id)a3 data:(id)a4
{
  return [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)self initWithBaseAccessoryIdentifier:a3 data:a4 allowUnzippedData:0];
}

- (HMDNetworkRouterFirewallRuleCloudNetworkDeclarations)initWithBaseAccessoryIdentifier:(id)a3 name:(id)a4 lastModifiedTime:(id)a5 ruleConfigurationsByVersionString:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDNetworkRouterFirewallRuleCloudNetworkDeclarations;
  v15 = [(HMDNetworkRouterFirewallRuleCloudNetworkDeclarations *)&v21 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_baseAccessoryIdentifier, a3);
    objc_storeStrong((id *)&v16->_name, a4);
    objc_storeStrong((id *)&v16->_lastModifiedTime, a5);
    uint64_t v17 = [v14 copy];
    ruleConfigurationsByVersionString = v16->_ruleConfigurationsByVersionString;
    v16->_ruleConfigurationsByVersionString = (NSDictionary *)v17;

    int v19 = v16;
  }

  return v16;
}

+ (id)__decodeRuleConfigurationWithVersionString:(id)a3 ruleConfigurationValue:(id)a4 baseAccessoryIdentifier:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v8];
  if (v11)
  {
    id v12 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }
    id v14 = v13;

    if (v14)
    {
      v15 = [HMDNetworkRouterFirewallRuleAccessoryIdentifier alloc];
      v16 = [v10 productGroup];
      uint64_t v17 = [v10 productNumber];
      id v18 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v15 initWithProductGroup:v16 productNumber:v17 firmwareVersion:v11];

      int v19 = [[HMDNetworkRouterFirewallRuleConfiguration alloc] initWithAccessoryIdentifier:v18 jsonDictionary:v14];
    }
    else
    {
      int v24 = (void *)MEMORY[0x1D9452090]();
      id v25 = a1;
      id v26 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = HMFGetLogIdentifier();
        int v29 = 138543874;
        v30 = v27;
        __int16 v31 = 2112;
        id v32 = v8;
        __int16 v33 = 2112;
        id v34 = v12;
        _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@Rule configuration for version '%@' is not a dictionary: %@", (uint8_t *)&v29, 0x20u);
      }
      int v19 = 0;
    }
  }
  else
  {
    long long v20 = (void *)MEMORY[0x1D9452090]();
    id v21 = a1;
    int v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      id v23 = HMFGetLogIdentifier();
      int v29 = 138543618;
      v30 = v23;
      __int16 v31 = 2112;
      id v32 = v8;
      _os_log_impl(&dword_1D49D5000, v22, OS_LOG_TYPE_ERROR, "%{public}@Rule configuration contains an invalid version string: %@", (uint8_t *)&v29, 0x16u);
    }
    int v19 = 0;
  }

  return v19;
}

+ (id)__decodeRuleConfigurationsFromJSONDictionary:(id)a3 baseAccessoryIdentifier:(id)a4 allowUnzippedData:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
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
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v14 options:0];
    if (v16)
    {
      uint64_t v17 = v16;
      id v18 = objc_msgSend(v16, "hmd_uncompressedData");
      if (!v18)
      {
        contexta = (void *)MEMORY[0x1D9452090]();
        id v28 = a1;
        int v29 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = @"v";
          *(_WORD *)&buf[22] = 2112;
          id v51 = v8;
          _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@JSON contains '%@' value that is not compressed properly: %@", buf, 0x20u);
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
        v37 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v10, "count", v40));
        v43[0] = MEMORY[0x1E4F143A8];
        v43[1] = 3221225472;
        v43[2] = __143__HMDNetworkRouterFirewallRuleCloudNetworkDeclarations___decodeRuleConfigurationsFromJSONDictionary_baseAccessoryIdentifier_allowUnzippedData___block_invoke;
        v43[3] = &unk_1E6A14EB8;
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
      int v19 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v18 options:0 error:&v48];
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
        uint64_t v40 = (void *)MEMORY[0x1D9452090]();
        id v34 = a1;
        id v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          uint64_t v35 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v35;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = @"v";
          *(_WORD *)&buf[22] = 2112;
          id v51 = v8;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@JSON contains a '%@' value that is not a dictionary: %@", buf, 0x20u);
        }
      }
      else
      {
        uint64_t v40 = (void *)MEMORY[0x1D9452090]();
        id v31 = a1;
        id v32 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          __int16 v33 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138544130;
          *(void *)&uint8_t buf[4] = v33;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = @"v";
          *(_WORD *)&buf[22] = 2112;
          id v51 = v8;
          __int16 v52 = 2112;
          id v53 = context;
          _os_log_impl(&dword_1D49D5000, v32, OS_LOG_TYPE_ERROR, "%{public}@JSON contains '%@' value that is not valid JSON: %@: %@", buf, 0x2Au);
        }
      }

      id v10 = 0;
      int v23 = 1;
      goto LABEL_28;
    }
    int v24 = (void *)MEMORY[0x1D9452090]();
    id v25 = a1;
    id v26 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v27;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = @"v";
      *(_WORD *)&buf[22] = 2112;
      id v51 = v8;
      _os_log_impl(&dword_1D49D5000, v26, OS_LOG_TYPE_ERROR, "%{public}@JSON contains '%@' value that is not valid base64: %@", buf, 0x20u);
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

void __143__HMDNetworkRouterFirewallRuleCloudNetworkDeclarations___decodeRuleConfigurationsFromJSONDictionary_baseAccessoryIdentifier_allowUnzippedData___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = objc_msgSend((id)objc_opt_class(), "__decodeRuleConfigurationWithVersionString:ruleConfigurationValue:baseAccessoryIdentifier:", v9, v7, *(void *)(a1 + 32));

  if (v8)
  {
    [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v9];
  }
  else
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_162312 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_162312, &__block_literal_global_162313);
  }
  v2 = (void *)logCategory__hmf_once_v1_162314;
  return v2;
}

uint64_t __67__HMDNetworkRouterFirewallRuleCloudNetworkDeclarations_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_162314;
  logCategory__hmf_once_v1_162314 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end