@interface HMDNetworkRouterFirewallRuleAccessoryIdentifier
+ (id)createWithProductData:(id)a3 firmwareVersion:(id)a4;
+ (id)identifierFromRecordID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)initWithProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5;
- (HMFVersion)firmwareVersion;
- (NSString)productGroup;
- (NSString)productNumber;
- (id)attributeDescriptions;
- (id)cloudKitRecordID;
- (unint64_t)hash;
@end

@implementation HMDNetworkRouterFirewallRuleAccessoryIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_productNumber, 0);
  objc_storeStrong((id *)&self->_productGroup, 0);
}

- (HMFVersion)firmwareVersion
{
  return self->_firmwareVersion;
}

- (NSString)productNumber
{
  return self->_productNumber;
}

- (NSString)productGroup
{
  return self->_productGroup;
}

- (id)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)self productGroup];
  v5 = (void *)[v3 initWithName:@"ProductGroup" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)self productNumber];
  v8 = (void *)[v6 initWithName:@"ProductNumber" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)self firmwareVersion];
  v11 = (void *)[v9 initWithName:@"FirmwareVersion" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return v12;
}

- (unint64_t)hash
{
  id v3 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)self productGroup];
  uint64_t v4 = [v3 hash];

  v5 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)self productNumber];
  unint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)self firmwareVersion];

  if (v7)
  {
    v8 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)self firmwareVersion];
    v6 ^= [v8 hash];
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDNetworkRouterFirewallRuleAccessoryIdentifier *)a3;
  if (self != v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    unint64_t v6 = v5;
    if (!v6) {
      goto LABEL_13;
    }
    v7 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)self productGroup];
    v8 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v6 productGroup];
    if ([v7 isEqualToString:v8])
    {
      id v9 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)self productNumber];
      v10 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v6 productNumber];
      if ([v9 isEqualToString:v10])
      {
        v11 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)self firmwareVersion];
        v12 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)v6 firmwareVersion];
        char v13 = HMFEqualObjects();

        if (v13)
        {
          BOOL v14 = 1;
LABEL_14:

          goto LABEL_15;
        }
LABEL_13:
        BOOL v14 = 0;
        goto LABEL_14;
      }
    }
    goto LABEL_13;
  }
  BOOL v14 = 1;
LABEL_15:

  return v14;
}

- (HMDNetworkRouterFirewallRuleAccessoryIdentifier)initWithProductGroup:(id)a3 productNumber:(id)a4 firmwareVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HMDNetworkRouterFirewallRuleAccessoryIdentifier;
  v11 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 lowercaseString];
    productGroup = v11->_productGroup;
    v11->_productGroup = (NSString *)v12;

    uint64_t v14 = [v9 lowercaseString];
    productNumber = v11->_productNumber;
    v11->_productNumber = (NSString *)v14;

    objc_storeStrong((id *)&v11->_firmwareVersion, a5);
    v16 = v11;
  }

  return v11;
}

+ (id)createWithProductData:(id)a3 firmwareVersion:(id)a4
{
  id v6 = a4;
  id v12 = 0;
  id v13 = 0;
  BOOL v7 = +[HMDAccessory splitProductDataIntoProductGroupAndProductNumber:a3 productGroup:&v13 productNumber:&v12];
  id v8 = v13;
  id v9 = v12;
  id v10 = 0;
  if (v7) {
    id v10 = (void *)[objc_alloc((Class)a1) initWithProductGroup:v8 productNumber:v9 firmwareVersion:v6];
  }

  return v10;
}

- (id)cloudKitRecordID
{
  id v3 = objc_alloc(MEMORY[0x1E4F1A320]);
  uint64_t v4 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)self cloudKitZoneName];
  v5 = (void *)[v3 initWithZoneName:v4 ownerName:*MEMORY[0x1E4F19C08]];

  id v6 = objc_alloc(MEMORY[0x1E4F1A2F8]);
  BOOL v7 = [(HMDNetworkRouterFirewallRuleAccessoryIdentifier *)self cloudKitRecordName];
  id v8 = (void *)[v6 initWithRecordName:v7 zoneID:v5];

  return v8;
}

+ (id)identifierFromRecordID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  id v6 = [v4 zoneID];
  BOOL v7 = [v6 zoneName];
  id v8 = [v4 recordName];

  id v9 = (void *)[v5 initWithProductGroup:v7 productNumber:v8 firmwareVersion:0];
  return v9;
}

@end