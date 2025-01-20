@interface HMDNetworkRouterFirewallRuleWANAddressRange
- (BOOL)isEqual:(id)a3;
- (HMDNetworkRouterFirewallRuleWANAddressRange)initWithAddressStart:(id)a3 addressEnd:(id)a4;
- (HMFNetAddress)addressEnd;
- (HMFNetAddress)addressStart;
- (id)attributeDescriptions;
- (id)prettyJSONDictionary;
- (unint64_t)hash;
@end

@implementation HMDNetworkRouterFirewallRuleWANAddressRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressEnd, 0);
  objc_storeStrong((id *)&self->_addressStart, 0);
}

- (HMFNetAddress)addressEnd
{
  return self->_addressEnd;
}

- (HMFNetAddress)addressStart
{
  return self->_addressStart;
}

- (id)prettyJSONDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = @"addressStart";
  v3 = [(HMDNetworkRouterFirewallRuleWANAddressRange *)self addressStart];
  v4 = [v3 addressString];
  v9[1] = @"addressEnd";
  v10[0] = v4;
  v5 = [(HMDNetworkRouterFirewallRuleWANAddressRange *)self addressEnd];
  v6 = [v5 addressString];
  v10[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  return v7;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDNetworkRouterFirewallRuleWANAddressRange *)self addressStart];
  v5 = (void *)[v3 initWithName:@"AddressStart" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDNetworkRouterFirewallRuleWANAddressRange *)self addressEnd];
  v8 = (void *)[v6 initWithName:@"AddressEnd" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return v9;
}

- (unint64_t)hash
{
  id v3 = [(HMDNetworkRouterFirewallRuleWANAddressRange *)self addressStart];
  uint64_t v4 = [v3 hash];

  v5 = [(HMDNetworkRouterFirewallRuleWANAddressRange *)self addressEnd];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDNetworkRouterFirewallRuleWANAddressRange *)a3;
  if (self == v4)
  {
    char v11 = 1;
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
    unint64_t v6 = v5;
    if (v6)
    {
      v7 = [(HMDNetworkRouterFirewallRuleWANAddressRange *)self addressStart];
      v8 = [(HMDNetworkRouterFirewallRuleWANAddressRange *)v6 addressStart];
      if ([v7 isEqual:v8])
      {
        v9 = [(HMDNetworkRouterFirewallRuleWANAddressRange *)self addressEnd];
        v10 = [(HMDNetworkRouterFirewallRuleWANAddressRange *)v6 addressEnd];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

- (HMDNetworkRouterFirewallRuleWANAddressRange)initWithAddressStart:(id)a3 addressEnd:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDNetworkRouterFirewallRuleWANAddressRange;
  v9 = [(HMDNetworkRouterFirewallRuleWANAddressRange *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_addressStart, a3);
    objc_storeStrong((id *)&v10->_addressEnd, a4);
    char v11 = v10;
  }

  return v10;
}

@end