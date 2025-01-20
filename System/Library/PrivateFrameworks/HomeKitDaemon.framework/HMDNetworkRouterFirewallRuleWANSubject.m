@interface HMDNetworkRouterFirewallRuleWANSubject
- (BOOL)isEqual:(id)a3;
- (HMDNetworkRouterFirewallRuleWANAddressRange)addressRange;
- (HMDNetworkRouterFirewallRuleWANSubject)initWithHostnames:(id)a3 addresses:(id)a4 addressRange:(id)a5;
- (NSArray)addresses;
- (NSArray)hostnames;
- (id)attributeDescriptions;
- (id)prettyJSONDictionary;
- (unint64_t)hash;
@end

@implementation HMDNetworkRouterFirewallRuleWANSubject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressRange, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_hostnames, 0);
}

- (HMDNetworkRouterFirewallRuleWANAddressRange)addressRange
{
  return self->_addressRange;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (NSArray)hostnames
{
  return self->_hostnames;
}

- (id)prettyJSONDictionary
{
  v17[1] = *MEMORY[0x263EF8340];
  v3 = [(HMDNetworkRouterFirewallRuleWANSubject *)self hostnames];

  if (v3)
  {
    v16 = @"hostnames";
    v4 = [(HMDNetworkRouterFirewallRuleWANSubject *)self hostnames];
    v17[0] = v4;
    v5 = NSDictionary;
    v6 = (void **)v17;
    v7 = &v16;
LABEL_5:
    uint64_t v10 = [v5 dictionaryWithObjects:v6 forKeys:v7 count:1];
LABEL_6:
    v11 = (void *)v10;

    goto LABEL_7;
  }
  v8 = [(HMDNetworkRouterFirewallRuleWANSubject *)self addresses];

  if (v8)
  {
    v9 = [(HMDNetworkRouterFirewallRuleWANSubject *)self addresses];
    v4 = objc_msgSend(v9, "na_map:", &__block_literal_global_205120);

    v14 = @"addresses";
    v15 = v4;
    v5 = NSDictionary;
    v6 = &v15;
    v7 = &v14;
    goto LABEL_5;
  }
  v13 = [(HMDNetworkRouterFirewallRuleWANSubject *)self addressRange];

  if (v13)
  {
    v4 = [(HMDNetworkRouterFirewallRuleWANSubject *)self addressRange];
    uint64_t v10 = [v4 prettyJSONDictionary];
    goto LABEL_6;
  }
  v11 = (void *)MEMORY[0x263EFFA78];
LABEL_7:
  return v11;
}

uint64_t __62__HMDNetworkRouterFirewallRuleWANSubject_prettyJSONDictionary__block_invoke(uint64_t a1, void *a2)
{
  return [a2 addressString];
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDNetworkRouterFirewallRuleWANSubject *)self hostnames];
  v5 = (void *)[v3 initWithName:@"Hostnames" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDNetworkRouterFirewallRuleWANSubject *)self addresses];
  v8 = (void *)[v6 initWithName:@"Addresses" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v10 = [(HMDNetworkRouterFirewallRuleWANSubject *)self addressRange];
  v11 = (void *)[v9 initWithName:@"AddressRange" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(HMDNetworkRouterFirewallRuleWANSubject *)self hostnames];
  uint64_t v4 = [v3 hash];

  v5 = [(HMDNetworkRouterFirewallRuleWANSubject *)self addresses];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMDNetworkRouterFirewallRuleWANSubject *)self addressRange];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDNetworkRouterFirewallRuleWANSubject *)a3;
  if (self == v4)
  {
    char v15 = 1;
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
    uint64_t v6 = v5;
    if (!v6) {
      goto LABEL_9;
    }
    v7 = [(HMDNetworkRouterFirewallRuleWANSubject *)self hostnames];
    unint64_t v8 = [(HMDNetworkRouterFirewallRuleWANSubject *)v6 hostnames];
    int v9 = HMFEqualObjects();

    if (!v9) {
      goto LABEL_9;
    }
    uint64_t v10 = [(HMDNetworkRouterFirewallRuleWANSubject *)self addresses];
    v11 = [(HMDNetworkRouterFirewallRuleWANSubject *)v6 addresses];
    int v12 = HMFEqualObjects();

    if (v12)
    {
      v13 = [(HMDNetworkRouterFirewallRuleWANSubject *)self addressRange];
      v14 = [(HMDNetworkRouterFirewallRuleWANSubject *)v6 addressRange];
      char v15 = HMFEqualObjects();
    }
    else
    {
LABEL_9:
      char v15 = 0;
    }
  }
  return v15;
}

- (HMDNetworkRouterFirewallRuleWANSubject)initWithHostnames:(id)a3 addresses:(id)a4 addressRange:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDNetworkRouterFirewallRuleWANSubject;
  int v12 = [(HMDNetworkRouterFirewallRuleWANSubject *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_hostnames, a3);
    objc_storeStrong((id *)&v13->_addresses, a4);
    objc_storeStrong((id *)&v13->_addressRange, a5);
    v14 = v13;
  }

  return v13;
}

@end