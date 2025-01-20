@interface HMDAccessoryAllowedHost
+ (BOOL)supportsSecureCoding;
+ (id)allowedHostForFullWANAccess;
+ (id)allowedHostsFromFirewallRuleConfiguration:(id)a3;
+ (id)allowedHostsFromJSONFirewallWANRules:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMDAccessoryAllowedHost)initWithCoder:(id)a3;
- (HMDAccessoryAllowedHost)initWithJSONFirewallWANRule:(id)a3;
- (HMDAccessoryAllowedHost)initWithWANRule:(id)a3;
- (HMDNetworkRouterFirewallRuleWAN)wanRule;
- (NSSet)addresses;
- (NSString)jsonWANRule;
- (NSString)name;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (unint64_t)purpose;
- (void)_encodeForSPIEntitledXPCTransportWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDAccessoryAllowedHost

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonWANRule, 0);
  objc_destroyWeak((id *)&self->_cachedWANRule);
}

- (NSString)jsonWANRule
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDAccessoryAllowedHost *)self name];
  v5 = (void *)[v3 initWithName:@"Name" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDAccessoryAllowedHost *)self addresses];
  v8 = (void *)[v6 initWithName:@"Addresses" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[HMDAccessoryAllowedHost purpose](self, "purpose"));
  v11 = (void *)[v9 initWithName:@"Purpose" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDAccessoryAllowedHost *)a3;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;
    v7 = v6;
    if (v6)
    {
      if (v6 == self)
      {
        char v10 = 1;
      }
      else
      {
        v8 = [(HMDAccessoryAllowedHost *)self jsonWANRule];
        id v9 = [(HMDAccessoryAllowedHost *)v7 jsonWANRule];
        char v10 = [v8 isEqualToString:v9];
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  v2 = [(HMDAccessoryAllowedHost *)self jsonWANRule];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)_encodeForSPIEntitledXPCTransportWithCoder:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(HMDAccessoryAllowedHost *)self wanRule];
  id v6 = [v5 name];
  [v4 encodeObject:v6 forKey:*MEMORY[0x263F0AF60]];

  v7 = NSNumber;
  unint64_t v8 = [v5 purpose];
  if (!v8)
  {
    uint64_t v11 = 0;
    goto LABEL_42;
  }
  unint64_t v9 = v8;
  char v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 1;
  do
  {
    while (1)
    {
      if ((v12 & v8) == 0) {
        goto LABEL_33;
      }
      if (v12 > 127) {
        break;
      }
      if (v12 <= 15)
      {
        switch(v12)
        {
          case 1:
            v11 |= 1uLL;
            goto LABEL_33;
          case 2:
            v11 |= 2uLL;
            goto LABEL_33;
          case 4:
            v11 |= 4uLL;
            goto LABEL_33;
          case 8:
            v11 |= 8uLL;
            goto LABEL_33;
          default:
            goto LABEL_35;
        }
      }
      switch(v12)
      {
        case 16:
          v11 |= 0x10uLL;
          goto LABEL_33;
        case 32:
          v11 |= 0x20uLL;
          goto LABEL_33;
        case 64:
          v11 |= 0x40uLL;
          goto LABEL_33;
      }
LABEL_35:
      v11 |= 1uLL;
      v12 *= 2;
      char v10 = 1;
      if (v12 - 1 >= v8) {
        goto LABEL_38;
      }
    }
    if (v12 <= 1023)
    {
      switch(v12)
      {
        case 128:
          v11 |= 0x80uLL;
          break;
        case 256:
          v11 |= 0x100uLL;
          break;
        case 512:
          v11 |= 0x200uLL;
          break;
        default:
          goto LABEL_35;
      }
    }
    else if (v12 > 4095)
    {
      if (v12 == 4096)
      {
        v11 |= 0x1000uLL;
      }
      else
      {
        if (v12 != 0x2000) {
          goto LABEL_35;
        }
        v11 |= 0x2000uLL;
      }
    }
    else
    {
      if (v12 != 1024)
      {
        if (v12 == 2048)
        {
          v11 |= 0x800uLL;
          goto LABEL_33;
        }
        goto LABEL_35;
      }
      v11 |= 0x400uLL;
    }
LABEL_33:
    v12 *= 2;
  }
  while (v12 - 1 < v8);
  if ((v10 & 1) == 0) {
    goto LABEL_42;
  }
LABEL_38:
  v13 = (void *)MEMORY[0x230FBD990]();
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = HMFGetLogIdentifier();
    int v22 = 138543618;
    v23 = v15;
    __int16 v24 = 2048;
    unint64_t v25 = v9;
    _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@HMDNetworkRouterFirewallRuleWANPurpose value 0x%lx contains flags with no explicit mapping to HMAccessoryAllowedHostPurpose", (uint8_t *)&v22, 0x16u);
  }
LABEL_42:
  v16 = [v7 numberWithUnsignedInteger:v11];
  [v4 encodeObject:v16 forKey:*MEMORY[0x263F0AF68]];

  v17 = (void *)MEMORY[0x263EFFA08];
  v18 = addressesFromWANRule(v5);
  v19 = [v17 setWithArray:v18];
  [v4 encodeObject:v19 forKey:*MEMORY[0x263F0AF58]];

  v20 = [(HMDAccessoryAllowedHost *)self jsonWANRule];
  uint64_t v21 = [v20 isEqualToString:@"{\"f\":0,\"n\":\"Any Internet Destination\",\"r\":{\"i\":\"*\",\"it\":[{\"p\":1,\"t\":0}]},\"t\":5,\"u\":1}"];

  [v4 encodeBool:v21 forKey:*MEMORY[0x263F0AF70]];
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(HMDAccessoryAllowedHost *)self wanRule];
  if (v4)
  {
    if (objc_msgSend(v6, "hmd_isForXPCTransport"))
    {
      if (objc_msgSend(v6, "hmd_isForXPCTransportEntitledForSPIAccess")) {
        [(HMDAccessoryAllowedHost *)self _encodeForSPIEntitledXPCTransportWithCoder:v6];
      }
    }
    else if ((objc_msgSend(v6, "hmd_isForLocalStore") & 1) != 0 {
           || objc_msgSend(v6, "hmd_isForRemoteTransport")
    }
           && (objc_msgSend(v6, "hmd_isForRemoteTransportOnSameAccount") & 1) == 0
           && (objc_msgSend(v6, "hmd_isForRemoteUserAdministrator") & 1) != 0
           || objc_msgSend(v6, "hmd_isForRemoteTransportOnSameAccount")
           && (objc_msgSend(v6, "hmd_isForRemoteGatewayCoder") & 1) == 0)
    {
      v5 = [(HMDAccessoryAllowedHost *)self jsonWANRule];
      [v6 encodeObject:v5 forKey:@"HMDAAH.jsonWANRule"];
    }
  }
}

- (HMDAccessoryAllowedHost)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDAAH.jsonWANRule"];

  if (v5)
  {
    self = [(HMDAccessoryAllowedHost *)self initWithJSONFirewallWANRule:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (unint64_t)purpose
{
  v2 = [(HMDAccessoryAllowedHost *)self wanRule];
  unint64_t v3 = [v2 purpose];

  return v3;
}

- (NSSet)addresses
{
  v2 = [(HMDAccessoryAllowedHost *)self wanRule];
  unint64_t v3 = addressesFromWANRule(v2);

  return (NSSet *)v3;
}

- (NSString)name
{
  v2 = [(HMDAccessoryAllowedHost *)self wanRule];
  unint64_t v3 = [v2 name];

  return (NSString *)v3;
}

- (HMDNetworkRouterFirewallRuleWAN)wanRule
{
  p_cachedWANRule = &self->_cachedWANRule;
  WeakRetained = objc_loadWeakRetained((id *)&self->_cachedWANRule);
  if (!WeakRetained)
  {
    v5 = [(HMDAccessoryAllowedHost *)self jsonWANRule];
    WeakRetained = wanRuleFromJSONRule(v5);
    objc_storeWeak((id *)p_cachedWANRule, WeakRetained);
  }
  return (HMDNetworkRouterFirewallRuleWAN *)WeakRetained;
}

- (HMDAccessoryAllowedHost)initWithWANRule:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDAccessoryAllowedHost;
  v5 = [(HMDAccessoryAllowedHost *)&v11 init];
  id v6 = v5;
  if (v5
    && (objc_storeWeak((id *)&v5->_cachedWANRule, v4),
        [v4 jsonString],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        jsonWANRule = v6->_jsonWANRule,
        v6->_jsonWANRule = (NSString *)v7,
        jsonWANRule,
        !v6->_jsonWANRule))
  {
    unint64_t v9 = 0;
  }
  else
  {
    unint64_t v9 = v6;
  }

  return v9;
}

- (HMDAccessoryAllowedHost)initWithJSONFirewallWANRule:(id)a3
{
  id v4 = wanRuleFromJSONRule(a3);
  if (v4)
  {
    self = [(HMDAccessoryAllowedHost *)self initWithWANRule:v4];
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)allowedHostsFromFirewallRuleConfiguration:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    v5 = [v3 wanRules];
    id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count") + 1);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v13 = [HMDAccessoryAllowedHost alloc];
          v14 = -[HMDAccessoryAllowedHost initWithWANRule:](v13, "initWithWANRule:", v12, (void)v18);
          [v6 addObject:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    if ([v4 hasFullAccessToWAN])
    {
      v15 = +[HMDAccessoryAllowedHost allowedHostForFullWANAccess];
      [v6 addObject:v15];
    }
    v16 = objc_msgSend(v6, "copy", (void)v18);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)allowedHostsFromJSONFirewallWANRules:(id)a3
{
  id v3 = objc_msgSend(a3, "na_map:", &__block_literal_global_137840);
  id v4 = v3;
  if (!v3) {
    id v3 = (void *)MEMORY[0x263EFFA68];
  }
  id v5 = v3;

  return v5;
}

HMDAccessoryAllowedHost *__64__HMDAccessoryAllowedHost_allowedHostsFromJSONFirewallWANRules___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[HMDAccessoryAllowedHost alloc] initWithJSONFirewallWANRule:v2];

  return v3;
}

+ (id)allowedHostForFullWANAccess
{
  id v2 = [[HMDAccessoryAllowedHost alloc] initWithJSONFirewallWANRule:@"{\"f\":0,\"n\":\"Any Internet Destination\",\"r\":{\"i\":\"*\",\"it\":[{\"p\":1,\"t\":0}]},\"t\":5,\"u\":1}"];
  return v2;
}

@end