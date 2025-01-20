@interface HMDNetworkRouterFirewallRuleConfiguration
+ (BOOL)__decodeFullAccessFromNetworkDeclarations:(id)a3 key:(id)a4 fullAccess:(BOOL *)a5;
+ (BOOL)__decodeNetworkDeclarationsFromJSONDictionary:(id)a3 networkDeclarations:(id *)a4;
+ (id)__decodeRulesFromNetworkDeclarations:(id)a3 key:(id)a4 class:(Class)a5 required:(BOOL)a6;
+ (id)logCategory;
- (BOOL)hasAirplayRules;
- (BOOL)hasFullAccessToLAN;
- (BOOL)hasFullAccessToWAN;
- (BOOL)isEqual:(id)a3;
- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)accessoryIdentifier;
- (HMDNetworkRouterFirewallRuleConfiguration)initWithAccessoryIdentifier:(id)a3 jsonDictionary:(id)a4;
- (HMDNetworkRouterFirewallRuleConfiguration)initWithAccessoryIdentifier:(id)a3 lastModifiedTime:(id)a4 fullAccessLAN:(BOOL)a5 lanRules:(id)a6 fullAccessWAN:(BOOL)a7 wanRules:(id)a8;
- (NSArray)lanRules;
- (NSArray)wanRules;
- (NSDate)lastModifiedTime;
- (NSDictionary)prettyJSONDictionary;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation HMDNetworkRouterFirewallRuleConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wanRules, 0);
  objc_storeStrong((id *)&self->_lanRules, 0);
  objc_storeStrong((id *)&self->_lastModifiedTime, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
}

- (BOOL)hasFullAccessToWAN
{
  return self->_fullAccessWAN;
}

- (NSArray)wanRules
{
  return self->_wanRules;
}

- (BOOL)hasFullAccessToLAN
{
  return self->_fullAccessLAN;
}

- (NSArray)lanRules
{
  return self->_lanRules;
}

- (NSDate)lastModifiedTime
{
  return self->_lastModifiedTime;
}

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (BOOL)hasAirplayRules
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = [(HMDNetworkRouterFirewallRuleConfiguration *)self lanRules];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v7 = v6;
        }
        else {
          v7 = 0;
        }
        id v8 = v7;

        if (v8)
        {
          int v9 = [v8 direction];
          int v10 = [v8 advertisingProtocol];
          v11 = [v8 serviceType];
          int v12 = [v11 isEqual:@"airplay"];

          BOOL v13 = v9 == 1 && v10 == 0;
          if (v13 && v12 != 0)
          {

            LOBYTE(v3) = 1;
            goto LABEL_20;
          }
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v3);
  }
LABEL_20:

  return v3;
}

- (NSDictionary)prettyJSONDictionary
{
  v24[6] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[HMDNetworkRouterClientConfiguration configurationForFirewallConfiguration:self hapAccessory:1 airplayAccessory:0 withClientIdentifier:0];
  uint64_t v4 = [v3 fingerprint];

  v23[0] = @"lastModifiedTime";
  v22 = [(HMDNetworkRouterFirewallRuleConfiguration *)self lastModifiedTime];
  uint64_t v21 = [v22 description];
  v24[0] = v21;
  v23[1] = @"lanRules";
  v20 = [(HMDNetworkRouterFirewallRuleConfiguration *)self lanRules];
  long long v19 = objc_msgSend(v20, "na_map:", &__block_literal_global_51_181047);
  uint64_t v5 = [v19 copy];
  id v6 = (void *)v5;
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[1] = v5;
  v23[2] = @"hasFullAccessToLAN";
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToLAN](self, "hasFullAccessToLAN", v5));
  v24[2] = v7;
  v23[3] = @"wanRules";
  id v8 = [(HMDNetworkRouterFirewallRuleConfiguration *)self wanRules];
  int v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_61);
  int v10 = (void *)[v9 copy];
  v11 = v10;
  if (!v10)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[3] = v11;
  v23[4] = @"hasFullAccessToWAN";
  int v12 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToWAN](self, "hasFullAccessToWAN"));
  v24[4] = v12;
  v23[5] = @"fingerprint";
  BOOL v13 = v4;
  v14 = [v4 UUIDString];
  v15 = v14;
  if (!v14)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v24[5] = v15;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:6];
  if (!v14) {

  }
  if (!v10) {
  if (!v6)
  }

  return (NSDictionary *)v18;
}

uint64_t __65__HMDNetworkRouterFirewallRuleConfiguration_prettyJSONDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 prettyJSONDictionary];
}

uint64_t __65__HMDNetworkRouterFirewallRuleConfiguration_prettyJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 prettyJSONDictionary];
}

- (id)attributeDescriptions
{
  void v23[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v22 = [(HMDNetworkRouterFirewallRuleConfiguration *)self accessoryIdentifier];
  uint64_t v21 = (void *)[v3 initWithName:@"AccessoryIdentifier" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v20 = [(HMDNetworkRouterFirewallRuleConfiguration *)self lastModifiedTime];
  uint64_t v5 = (void *)[v4 initWithName:@"LastModifiedTime" value:v20];
  v23[1] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToLAN](self, "hasFullAccessToLAN"));
  id v8 = (void *)[v6 initWithName:@"FullAccessLAN" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v10 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDNetworkRouterFirewallRuleConfiguration hasFullAccessToWAN](self, "hasFullAccessToWAN"));
  v11 = (void *)[v9 initWithName:@"FullAccessWAN" value:v10];
  v23[3] = v11;
  id v12 = objc_alloc(MEMORY[0x1E4F653F8]);
  BOOL v13 = [(HMDNetworkRouterFirewallRuleConfiguration *)self lanRules];
  v14 = (void *)[v12 initWithName:@"LANRules" value:v13];
  v23[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  long long v16 = [(HMDNetworkRouterFirewallRuleConfiguration *)self wanRules];
  long long v17 = (void *)[v15 initWithName:@"WANRules" value:v16];
  v23[5] = v17;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:6];

  return v18;
}

- (unint64_t)hash
{
  id v3 = [(HMDNetworkRouterFirewallRuleConfiguration *)self accessoryIdentifier];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = [(HMDNetworkRouterFirewallRuleConfiguration *)self lanRules];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMDNetworkRouterFirewallRuleConfiguration *)self wanRules];
  uint64_t v8 = v6 ^ [v7 hash];

  uint64_t v9 = [(HMDNetworkRouterFirewallRuleConfiguration *)self hasFullAccessToLAN];
  uint64_t v10 = v8 ^ v9 ^ [(HMDNetworkRouterFirewallRuleConfiguration *)self hasFullAccessToWAN];
  v11 = [(HMDNetworkRouterFirewallRuleConfiguration *)self lastModifiedTime];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDNetworkRouterFirewallRuleConfiguration *)a3;
  if (self == v4)
  {
    char v15 = 1;
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
      v7 = [(HMDNetworkRouterFirewallRuleConfiguration *)self accessoryIdentifier];
      uint64_t v8 = [(HMDNetworkRouterFirewallRuleConfiguration *)v6 accessoryIdentifier];
      if ([v7 isEqual:v8])
      {
        uint64_t v9 = [(HMDNetworkRouterFirewallRuleConfiguration *)self lanRules];
        uint64_t v10 = [(HMDNetworkRouterFirewallRuleConfiguration *)v6 lanRules];
        if ([v9 isEqualToArray:v10])
        {
          v11 = [(HMDNetworkRouterFirewallRuleConfiguration *)self wanRules];
          unint64_t v12 = [(HMDNetworkRouterFirewallRuleConfiguration *)v6 wanRules];
          if ([v11 isEqualToArray:v12]
            && (BOOL v13 = [(HMDNetworkRouterFirewallRuleConfiguration *)self hasFullAccessToLAN],
                v13 == [(HMDNetworkRouterFirewallRuleConfiguration *)v6 hasFullAccessToLAN])
            && (BOOL v14 = [(HMDNetworkRouterFirewallRuleConfiguration *)self hasFullAccessToWAN],
                v14 == [(HMDNetworkRouterFirewallRuleConfiguration *)v6 hasFullAccessToWAN]))
          {
            id v18 = [(HMDNetworkRouterFirewallRuleConfiguration *)self lastModifiedTime];
            long long v17 = [(HMDNetworkRouterFirewallRuleConfiguration *)v6 lastModifiedTime];
            char v15 = [v18 isEqual:v17];
          }
          else
          {
            char v15 = 0;
          }
        }
        else
        {
          char v15 = 0;
        }
      }
      else
      {
        char v15 = 0;
      }
    }
    else
    {
      char v15 = 0;
    }
  }
  return v15;
}

- (HMDNetworkRouterFirewallRuleConfiguration)initWithAccessoryIdentifier:(id)a3 jsonDictionary:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 firmwareVersion];

  if (v8)
  {
    id v24 = 0;
    int v9 = decodeTimeFromJSONDictionary(v7, @"t", &v24);
    id v10 = v24;
    if (v9)
    {
      id v23 = 0;
      int v11 = objc_msgSend((id)objc_opt_class(), "__decodeNetworkDeclarationsFromJSONDictionary:networkDeclarations:", v7, &v23);
      id v12 = v23;
      if (v11
        && (buf[0] = 0,
            objc_msgSend((id)objc_opt_class(), "__decodeFullAccessFromNetworkDeclarations:key:fullAccess:", v12, @"l", buf)))
      {
        BOOL v13 = objc_opt_class();
        BOOL v14 = objc_msgSend(v13, "__decodeRulesFromNetworkDeclarations:key:class:required:", v12, @"m", objc_opt_class(), buf[0] == 0);
        if (v14
          && (unsigned __int8 v22 = 0,
              objc_msgSend((id)objc_opt_class(), "__decodeFullAccessFromNetworkDeclarations:key:fullAccess:", v12, @"w", &v22)))
        {
          char v15 = objc_opt_class();
          long long v16 = objc_msgSend(v15, "__decodeRulesFromNetworkDeclarations:key:class:required:", v12, @"x", objc_opt_class(), v22 == 0);
          if (v16)
          {
            self = [(HMDNetworkRouterFirewallRuleConfiguration *)self initWithAccessoryIdentifier:v6 lastModifiedTime:v10 fullAccessLAN:buf[0] lanRules:v14 fullAccessWAN:v22 wanRules:v16];
            long long v17 = self;
          }
          else
          {
            long long v17 = 0;
          }
        }
        else
        {
          long long v17 = 0;
        }
      }
      else
      {
        long long v17 = 0;
      }
    }
    else
    {
      long long v17 = 0;
    }
  }
  else
  {
    id v18 = (void *)MEMORY[0x1D9452090]();
    self = self;
    long long v19 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Network declaration must contain firmware version: %@", buf, 0x16u);
    }
    long long v17 = 0;
  }

  return v17;
}

- (HMDNetworkRouterFirewallRuleConfiguration)initWithAccessoryIdentifier:(id)a3 lastModifiedTime:(id)a4 fullAccessLAN:(BOOL)a5 lanRules:(id)a6 fullAccessWAN:(BOOL)a7 wanRules:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDNetworkRouterFirewallRuleConfiguration;
  id v18 = [(HMDNetworkRouterFirewallRuleConfiguration *)&v23 init];
  long long v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accessoryIdentifier, a3);
    objc_storeStrong((id *)&v19->_lastModifiedTime, a4);
    v19->_fullAccessLAN = a5;
    objc_storeStrong((id *)&v19->_lanRules, a6);
    v19->_fullAccessWAN = a7;
    objc_storeStrong((id *)&v19->_wanRules, a8);
    v20 = v19;
  }

  return v19;
}

+ (id)__decodeRulesFromNetworkDeclarations:(id)a3 key:(id)a4 class:(Class)a5 required:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 objectForKeyedSubscript:v11];
  BOOL v13 = v12;
  if (v12)
  {
    id v14 = v12;
    objc_opt_class();
    int v15 = objc_opt_isKindOfClass() & 1;
    if (v15) {
      id v16 = v14;
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;

    if (v15)
    {
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      uint64_t v18 = [v14 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        id v46 = a1;
        v47 = v13;
        v20 = 0;
        uint64_t v21 = *(void *)v52;
        id v48 = v11;
        id v49 = v10;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v52 != v21) {
              objc_enumerationMutation(v17);
            }
            id v23 = *(id *)(*((void *)&v51 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              id v24 = v23;
            }
            else {
              id v24 = 0;
            }
            id v25 = v24;

            if (!v25)
            {
              v41 = (void *)MEMORY[0x1D9452090]();
              id v42 = v46;
              v43 = HMFGetOSLogHandle();
              id v11 = v48;
              id v10 = v49;
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                v44 = HMFGetLogIdentifier();
                *(_DWORD *)buf = 138543874;
                v57 = v44;
                __int16 v58 = 2112;
                id v59 = v48;
                __int16 v60 = 2112;
                id v61 = v49;
                _os_log_impl(&dword_1D49D5000, v43, OS_LOG_TYPE_ERROR, "%{public}@Network declaration contains an invalid rule in '%@' value: %@", buf, 0x20u);
              }
              id v33 = 0;
              v39 = v17;
              goto LABEL_41;
            }
            id v50 = 0;
            v26 = [(objc_class *)a5 createWithJSONDictionary:v25 error:&v50];
            id v27 = v50;
            id v28 = v27;
            if (v26)
            {
              if (v20)
              {
                [v20 addObject:v26];
              }
              else
              {
                v20 = [MEMORY[0x1E4F1CA48] arrayWithObject:v26];
              }
            }
            else if (![v27 isHMError] || objc_msgSend(v28, "code") != 1070)
            {

              id v33 = 0;
              v39 = v17;
              id v11 = v48;
              id v10 = v49;
LABEL_41:
              BOOL v13 = v47;
              goto LABEL_42;
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v51 objects:v55 count:16];
          id v11 = v48;
          id v10 = v49;
          BOOL v13 = v47;
          if (v19) {
            continue;
          }
          break;
        }
      }
      else
      {
        v20 = 0;
      }

      uint64_t v38 = [v20 copy];
      v39 = (void *)v38;
      v40 = (void *)MEMORY[0x1E4F1CBF0];
      if (v38) {
        v40 = (void *)v38;
      }
      id v33 = v40;
LABEL_42:
    }
    else
    {
      v34 = (void *)MEMORY[0x1D9452090]();
      id v35 = a1;
      v36 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v57 = v37;
        __int16 v58 = 2112;
        id v59 = v11;
        __int16 v60 = 2112;
        id v61 = v10;
        _os_log_impl(&dword_1D49D5000, v36, OS_LOG_TYPE_ERROR, "%{public}@Network declaration contains an invalid '%@' value: %@", buf, 0x20u);
      }
      id v33 = 0;
    }
  }
  else if (v6)
  {
    uint64_t v29 = (void *)MEMORY[0x1D9452090]();
    id v30 = a1;
    v31 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v57 = v32;
      __int16 v58 = 2112;
      id v59 = v11;
      __int16 v60 = 2112;
      id v61 = v10;
      _os_log_impl(&dword_1D49D5000, v31, OS_LOG_TYPE_ERROR, "%{public}@Network declaration contains no '%@' value: %@", buf, 0x20u);
    }
    id v33 = 0;
  }
  else
  {
    id v33 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v33;
}

+ (BOOL)__decodeFullAccessFromNetworkDeclarations:(id)a3 key:(id)a4 fullAccess:(BOOL *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v20 = 0;
  int v10 = decodeUnsignedIntegerFromJSONDictionary(v8, v9, 1, 0xFFuLL, &v20);
  id v11 = v20;
  id v12 = v11;
  if (!v10)
  {
LABEL_9:
    BOOL v14 = 0;
    goto LABEL_10;
  }
  uint64_t v13 = [v11 unsignedIntegerValue];
  if (v13 == 1)
  {
    *a5 = 0;
    BOOL v14 = 1;
    goto LABEL_10;
  }
  if (v13)
  {
    int v15 = (void *)MEMORY[0x1D9452090]();
    id v16 = a1;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      unsigned __int8 v22 = v18;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_1D49D5000, v17, OS_LOG_TYPE_ERROR, "%{public}@Network declaration contains an invalid '%@' value: %@", buf, 0x20u);
    }
    goto LABEL_9;
  }
  BOOL v14 = 1;
  *a5 = 1;
LABEL_10:

  return v14;
}

+ (BOOL)__decodeNetworkDeclarationsFromJSONDictionary:(id)a3 networkDeclarations:(id *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 objectForKeyedSubscript:@"n"];
  id v8 = v7;
  if (!v7)
  {
    BOOL v14 = (void *)MEMORY[0x1D9452090]();
    id v15 = a1;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      int v21 = 138543874;
      unsigned __int8 v22 = v17;
      __int16 v23 = 2112;
      id v24 = @"n";
      __int16 v25 = 2112;
      id v26 = v6;
      uint64_t v18 = "%{public}@JSON contains no '%@' value: %@";
LABEL_11:
      _os_log_impl(&dword_1D49D5000, v16, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v21, 0x20u);
    }
LABEL_12:

    BOOL v13 = 0;
    goto LABEL_13;
  }
  id v9 = v7;
  objc_opt_class();
  int v10 = objc_opt_isKindOfClass() & 1;
  if (v10) {
    id v11 = v9;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  *a4 = v12;
  if (!v10)
  {
    BOOL v14 = (void *)MEMORY[0x1D9452090]();
    id v19 = a1;
    id v16 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v17 = HMFGetLogIdentifier();
      int v21 = 138543874;
      unsigned __int8 v22 = v17;
      __int16 v23 = 2112;
      id v24 = @"n";
      __int16 v25 = 2112;
      id v26 = v6;
      uint64_t v18 = "%{public}@JSON contains an invalid '%@' value: %@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v13 = 1;
LABEL_13:

  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_181133 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_181133, &__block_literal_global_181134);
  }
  v2 = (void *)logCategory__hmf_once_v1_181135;
  return v2;
}

uint64_t __56__HMDNetworkRouterFirewallRuleConfiguration_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v1_181135;
  logCategory__hmf_once_v1_181135 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end