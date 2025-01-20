@interface HMDNetworkRouterFirewallRuleICMPType
+ (id)createListWithJSONDictionary:(id)a3 key:(id)a4;
+ (id)createWithJSONDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMDNetworkRouterFirewallRuleICMPType)initWithJSONDictionary:(id)a3 protocol:(unsigned __int8)a4 typeValue:(id)a5;
- (NSDictionary)jsonDictionary;
- (NSDictionary)prettyJSONDictionary;
- (NSNumber)typeValue;
- (id)description;
- (unint64_t)hash;
- (unsigned)protocol;
@end

@implementation HMDNetworkRouterFirewallRuleICMPType

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonDictionary, 0);
  objc_storeStrong((id *)&self->_typeValue, 0);
}

- (NSDictionary)jsonDictionary
{
  return self->_jsonDictionary;
}

- (NSNumber)typeValue
{
  return self->_typeValue;
}

- (unsigned)protocol
{
  return self->_protocol;
}

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:8];
  int v4 = [(HMDNetworkRouterFirewallRuleICMPType *)self protocol];
  if (v4 == 1)
  {
    v5 = @"v6:";
    goto LABEL_5;
  }
  if (!v4)
  {
    v5 = @"v4:";
LABEL_5:
    [v3 appendString:v5];
    goto LABEL_7;
  }
  objc_msgSend(v3, "appendFormat:", @"%d:", -[HMDNetworkRouterFirewallRuleICMPType protocol](self, "protocol"));
LABEL_7:
  v6 = [(HMDNetworkRouterFirewallRuleICMPType *)self typeValue];

  if (v6)
  {
    v7 = [(HMDNetworkRouterFirewallRuleICMPType *)self typeValue];
    objc_msgSend(v3, "appendFormat:", @"%d", objc_msgSend(v7, "unsignedIntValue"));
  }
  else
  {
    [v3 appendString:@"*"];
  }
  v8 = (void *)[v3 copy];

  return v8;
}

- (NSDictionary)prettyJSONDictionary
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
  unsigned int v4 = [(HMDNetworkRouterFirewallRuleICMPType *)self protocol];
  if (v4)
  {
    if (v4 == 1)
    {
      v5 = @"IPv6";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%d)", v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = @"IPv4";
  }
  [v3 setObject:v5 forKeyedSubscript:@"protocol"];

  v6 = [(HMDNetworkRouterFirewallRuleICMPType *)self typeValue];

  if (v6)
  {
    v7 = [(HMDNetworkRouterFirewallRuleICMPType *)self typeValue];
    [v3 setObject:v7 forKeyedSubscript:@"type"];
  }
  v8 = (void *)[v3 copy];

  return (NSDictionary *)v8;
}

- (unint64_t)hash
{
  int v3 = [(HMDNetworkRouterFirewallRuleICMPType *)self protocol];
  unsigned int v4 = [(HMDNetworkRouterFirewallRuleICMPType *)self typeValue];
  uint64_t v5 = [v4 unsignedIntValue] ^ v3;

  v6 = [(HMDNetworkRouterFirewallRuleICMPType *)self jsonDictionary];
  unint64_t v7 = [v6 hash] ^ v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v4 = (HMDNetworkRouterFirewallRuleICMPType *)a3;
  if (self == v4)
  {
    char v13 = 1;
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
    v6 = v5;
    if (!v6) {
      goto LABEL_9;
    }
    int v7 = [(HMDNetworkRouterFirewallRuleICMPType *)self protocol];
    if (v7 != [(HMDNetworkRouterFirewallRuleICMPType *)v6 protocol]) {
      goto LABEL_9;
    }
    v8 = [(HMDNetworkRouterFirewallRuleICMPType *)self typeValue];
    v9 = [(HMDNetworkRouterFirewallRuleICMPType *)v6 typeValue];
    int v10 = HMFEqualObjects();

    if (v10)
    {
      v11 = [(HMDNetworkRouterFirewallRuleICMPType *)self jsonDictionary];
      v12 = [(HMDNetworkRouterFirewallRuleICMPType *)v6 jsonDictionary];
      char v13 = HMFEqualObjects();
    }
    else
    {
LABEL_9:
      char v13 = 0;
    }
  }
  return v13;
}

- (HMDNetworkRouterFirewallRuleICMPType)initWithJSONDictionary:(id)a3 protocol:(unsigned __int8)a4 typeValue:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDNetworkRouterFirewallRuleICMPType;
  v11 = [(HMDNetworkRouterFirewallRuleICMPType *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_jsonDictionary, a3);
    v12->_protocol = a4;
    objc_storeStrong((id *)&v12->_typeValue, a5);
  }

  return v12;
}

+ (id)createListWithJSONDictionary:(id)a3 key:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  if (v10 && !objc_msgSend(v10, "hmf_isEmpty"))
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v17 = v10;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v34;
      id v32 = v7;
LABEL_11:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        id v22 = *(id *)(*((void *)&v33 + 1) + 8 * v21);
        objc_opt_class();
        id v23 = (objc_opt_isKindOfClass() & 1) != 0 ? v22 : 0;
        id v24 = v23;

        if (!v24) {
          break;
        }
        uint64_t v25 = +[HMDNetworkRouterFirewallRuleICMPType createWithJSONDictionary:v24];
        if (!v25)
        {

          id v7 = v32;
LABEL_26:

          v15 = 0;
          goto LABEL_27;
        }
        v26 = (void *)v25;
        [v16 addObject:v25];

        if (v19 == ++v21)
        {
          uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
          id v7 = v32;
          if (v19) {
            goto LABEL_11;
          }
          goto LABEL_21;
        }
      }
      v27 = (void *)MEMORY[0x1D9452090]();
      id v28 = a1;
      v29 = HMFGetOSLogHandle();
      id v7 = v32;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v39 = v30;
        __int16 v40 = 2112;
        id v41 = v32;
        __int16 v42 = 2112;
        id v43 = v6;
        _os_log_impl(&dword_1D49D5000, v29, OS_LOG_TYPE_ERROR, "%{public}@Rule contains an invalid '%@' value: %@", buf, 0x20u);
      }
      goto LABEL_26;
    }
LABEL_21:

    v15 = (void *)[v16 copy];
LABEL_27:
  }
  else
  {
    v11 = (void *)MEMORY[0x1D9452090]();
    id v12 = a1;
    char v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_super v14 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v39 = v14;
      __int16 v40 = 2112;
      id v41 = v7;
      __int16 v42 = 2112;
      id v43 = v6;
      _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_ERROR, "%{public}@Rule contains an invalid '%@' value: %@", buf, 0x20u);
    }
    v15 = 0;
  }

  return v15;
}

+ (id)createWithJSONDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v18 = 0;
  int v5 = decodeUnsignedIntegerFromJSONDictionary(v4, @"p", 1, 0xFFuLL, &v18);
  id v6 = v18;
  id v7 = v6;
  v8 = 0;
  if (v5)
  {
    if ([v6 unsignedCharValue] > 1)
    {
      id v12 = (void *)MEMORY[0x1D9452090]();
      char v13 = objc_opt_class();
      objc_super v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        uint64_t v20 = v15;
        __int16 v21 = 2112;
        id v22 = @"p";
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl(&dword_1D49D5000, v14, OS_LOG_TYPE_ERROR, "%{public}@JSON contains an invalid '%@' value: %@", buf, 0x20u);
      }
      v8 = 0;
    }
    else
    {
      uint64_t v9 = [v7 unsignedCharValue];
      id v17 = 0;
      char v10 = decodeUnsignedIntegerFromJSONDictionary(v4, @"t", 0, 0xFFuLL, &v17);
      id v11 = v17;
      v8 = 0;
      if (v10) {
        v8 = (void *)[objc_alloc((Class)a1) initWithJSONDictionary:v4 protocol:v9 typeValue:v11];
      }
    }
  }

  return v8;
}

@end