@interface HFNetworkConfigurationAllowedHostGroup
+ (id)groupsForNetworkConfigurationProfiles:(id)a3;
- (HFNetworkConfigurationAllowedHostGroup)initWithName:(id)a3;
- (NSMutableSet)mutableAddresses;
- (NSMutableSet)mutableAllowedHosts;
- (NSString)name;
- (NSString)purposeLocalizedDescription;
- (unint64_t)purpose;
- (void)addAllowedHost:(id)a3;
- (void)setMutableAddresses:(id)a3;
- (void)setMutableAllowedHosts:(id)a3;
- (void)setPurpose:(unint64_t)a3;
@end

@implementation HFNetworkConfigurationAllowedHostGroup

- (HFNetworkConfigurationAllowedHostGroup)initWithName:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HFNetworkConfigurationAllowedHostGroup;
  v6 = [(HFNetworkConfigurationAllowedHostGroup *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = [MEMORY[0x263EFF9C0] set];
    mutableAddresses = v7->_mutableAddresses;
    v7->_mutableAddresses = (NSMutableSet *)v8;

    v7->_purpose = 0;
    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    mutableAllowedHosts = v7->_mutableAllowedHosts;
    v7->_mutableAllowedHosts = (NSMutableSet *)v10;
  }
  return v7;
}

+ (id)groupsForNetworkConfigurationProfiles:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = [v3 dictionary];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__HFNetworkConfigurationAllowedHostGroup_groupsForNetworkConfigurationProfiles___block_invoke;
  v11[3] = &unk_264094438;
  id v12 = v5;
  id v6 = v5;
  objc_msgSend(v4, "na_each:", v11);

  v7 = (void *)MEMORY[0x263EFFA08];
  uint64_t v8 = [v6 allValues];
  v9 = [v7 setWithArray:v8];

  return v9;
}

void __80__HFNetworkConfigurationAllowedHostGroup_groupsForNetworkConfigurationProfiles___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 allowedHosts];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __80__HFNetworkConfigurationAllowedHostGroup_groupsForNetworkConfigurationProfiles___block_invoke_2;
  v4[3] = &unk_264094410;
  id v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "na_each:", v4);
}

void __80__HFNetworkConfigurationAllowedHostGroup_groupsForNetworkConfigurationProfiles___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = [v3 name];
  id v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = [[HFNetworkConfigurationAllowedHostGroup alloc] initWithName:v8];
  }
  v7 = v6;

  [(HFNetworkConfigurationAllowedHostGroup *)v7 addAllowedHost:v3];
  [*(id *)(a1 + 32) setObject:v7 forKey:v8];
}

- (NSString)purposeLocalizedDescription
{
  v2 = (void *)MEMORY[0x263F0E5F8];
  unint64_t v3 = [(HFNetworkConfigurationAllowedHostGroup *)self purpose];
  return (NSString *)objc_msgSend(v2, "hf_localizedDescriptionForAllowedHostPurpose:", v3);
}

- (void)addAllowedHost:(id)a3
{
  id v12 = a3;
  id v4 = [v12 name];
  id v5 = [(HFNetworkConfigurationAllowedHostGroup *)self name];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    v7 = [v12 name];
    id v8 = [(HFNetworkConfigurationAllowedHostGroup *)self name];
    NSLog(&cfstr_AllowedhostNam.isa, v7, v8);
  }
  v9 = [(HFNetworkConfigurationAllowedHostGroup *)self mutableAddresses];
  uint64_t v10 = [v12 addresses];
  [v9 unionSet:v10];

  -[HFNetworkConfigurationAllowedHostGroup setPurpose:](self, "setPurpose:", -[HFNetworkConfigurationAllowedHostGroup purpose](self, "purpose") | [v12 purpose]);
  v11 = [(HFNetworkConfigurationAllowedHostGroup *)self mutableAllowedHosts];
  [v11 addObject:v12];
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)purpose
{
  return self->_purpose;
}

- (void)setPurpose:(unint64_t)a3
{
  self->_purpose = a3;
}

- (NSMutableSet)mutableAddresses
{
  return self->_mutableAddresses;
}

- (void)setMutableAddresses:(id)a3
{
}

- (NSMutableSet)mutableAllowedHosts
{
  return self->_mutableAllowedHosts;
}

- (void)setMutableAllowedHosts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAllowedHosts, 0);
  objc_storeStrong((id *)&self->_mutableAddresses, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end