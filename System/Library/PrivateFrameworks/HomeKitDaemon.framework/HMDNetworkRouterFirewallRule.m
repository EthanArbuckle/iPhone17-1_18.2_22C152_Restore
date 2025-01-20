@interface HMDNetworkRouterFirewallRule
+ (id)__transportProtocolToString:(unsigned __int8)a3;
+ (id)logCategory;
- (BOOL)isCritical;
- (BOOL)isEqual:(id)a3;
- (HMDNetworkRouterFirewallRule)initWithJSONDictionary:(id)a3 critical:(BOOL)a4;
- (HMDNetworkRouterFirewallRule)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5;
- (NSDictionary)jsonDictionary;
- (NSDictionary)prettyJSONDictionary;
- (NSString)jsonString;
- (NSString)name;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation HMDNetworkRouterFirewallRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonDictionary, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSDictionary)jsonDictionary
{
  return self->_jsonDictionary;
}

- (BOOL)isCritical
{
  return self->_critical;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)jsonString
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = [(HMDNetworkRouterFirewallRule *)self jsonDictionary];
  if (v3)
  {
    id v14 = 0;
    v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:2 error:&v14];
    id v5 = v14;
    if (v4)
    {
      v6 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
    }
    else
    {
      v7 = (void *)MEMORY[0x230FBD990]();
      v8 = self;
      v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        v10 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v16 = v10;
        __int16 v17 = 2112;
        v18 = v8;
        __int16 v19 = 2112;
        id v20 = v5;
        _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Failed to convert firewall WAN rule %@ to JSON: %@", buf, 0x20u);
      }
      v11 = [[HMDAssertionLogEvent alloc] initWithReason:@"Failed to convert firewall WAN rule %@ to JSON: %@", v8, v5];
      v12 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v12 submitLogEvent:v11];

      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSDictionary)prettyJSONDictionary
{
  v6[1] = *MEMORY[0x263EF8340];
  id v5 = @"name";
  v2 = [(HMDNetworkRouterFirewallRule *)self name];
  v6[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDNetworkRouterFirewallRule *)self name];
  id v5 = (void *)[v3 initWithName:@"Name" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDNetworkRouterFirewallRule isCritical](self, "isCritical"));
  v8 = (void *)[v6 initWithName:@"IsCritical" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (unint64_t)hash
{
  id v3 = [(HMDNetworkRouterFirewallRule *)self name];
  uint64_t v4 = [v3 hash];

  return v4 ^ [(HMDNetworkRouterFirewallRule *)self isCritical];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDNetworkRouterFirewallRule *)a3;
  if (self == v4)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    if (v6)
    {
      v7 = [(HMDNetworkRouterFirewallRule *)self name];
      v8 = [(HMDNetworkRouterFirewallRule *)v6 name];
      if ([v7 isEqualToString:v8])
      {
        BOOL v9 = [(HMDNetworkRouterFirewallRule *)self isCritical];
        BOOL v10 = v9 ^ [(HMDNetworkRouterFirewallRule *)v6 isCritical] ^ 1;
      }
      else
      {
        LOBYTE(v10) = 0;
      }
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (HMDNetworkRouterFirewallRule)initWithJSONDictionary:(id)a3 critical:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v11 = 0;
  int v7 = decodeStringFromJSONDictionary(v6, @"n", 1, &v11);
  id v8 = v11;
  if (v7)
  {
    self = [(HMDNetworkRouterFirewallRule *)self initWithJSONDictionary:v6 name:v8 critical:v4];
    BOOL v9 = self;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (HMDNetworkRouterFirewallRule)initWithJSONDictionary:(id)a3 name:(id)a4 critical:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HMDNetworkRouterFirewallRule;
  id v11 = [(HMDNetworkRouterFirewallRule *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a4);
    v12->_critical = a5;
    objc_storeStrong((id *)&v12->_jsonDictionary, a3);
    v13 = v12;
  }

  return v12;
}

+ (id)__transportProtocolToString:(unsigned __int8)a3
{
  if (a3 >= 3u)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown (%d)", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_264A205F8[a3];
  }
  return v3;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_129322 != -1) {
    dispatch_once(&logCategory__hmf_once_t0_129322, &__block_literal_global_129323);
  }
  v2 = (void *)logCategory__hmf_once_v1_129324;
  return v2;
}

void __43__HMDNetworkRouterFirewallRule_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v1_129324;
  logCategory__hmf_once_v1_129324 = v0;
}

@end