@interface HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID
+ (id)sharedInstance;
- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID)initWithToken:(id)a3;
- (NSData)token;
- (NSString)name;
- (id)attributeDescriptions;
- (id)labels;
@end

@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID

- (void).cxx_destruct
{
}

- (NSData)token
{
  return self->_token;
}

- (NSString)name
{
  v2 = objc_opt_class();
  return (NSString *)[v2 shortDescription];
}

- (id)labels
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID *)self name];
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID *)self name];
  v5 = (void *)[v3 initWithName:@"Name" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID *)self token];
  v8 = (void *)[v6 initWithName:@"Token" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID)initWithToken:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID;
  id v6 = [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_token, a3);
    v8 = v7;
  }

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_146466 != -1) {
    dispatch_once(&sharedInstance_onceToken_146466, &__block_literal_global_146467);
  }
  v2 = (void *)sharedInstance_sharedInstance_146468;
  return v2;
}

void __82__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID_sharedInstance__block_invoke()
{
  id v2 = [@"6270b380-05e5-4f4d-b453-9c48242b1611" dataUsingEncoding:4];
  if (v2)
  {
    v0 = [[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorLocalZoneID alloc] initWithToken:v2];
    v1 = (void *)sharedInstance_sharedInstance_146468;
    sharedInstance_sharedInstance_146468 = (uint64_t)v0;
  }
}

@end