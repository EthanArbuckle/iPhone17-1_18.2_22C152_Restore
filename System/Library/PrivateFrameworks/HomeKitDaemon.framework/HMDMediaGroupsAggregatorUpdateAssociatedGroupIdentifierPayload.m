@interface HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload
+ (NSString)messageName;
- (BOOL)isEqual:(id)a3;
- (HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload)initWithGroupIdentifier:(id)a3 associatedGroupIdentifier:(id)a4;
- (HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload)initWithPayload:(id)a3;
- (NSUUID)associatedGroupIdentifier;
- (NSUUID)groupIdentifier;
- (id)attributeDescriptions;
- (id)payloadCopy;
- (unint64_t)hash;
@end

@implementation HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

- (NSUUID)associatedGroupIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)groupIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)a3;
  if (v4 == self)
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
    v6 = v5;
    if (v6)
    {
      v7 = [(HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)self groupIdentifier];
      v8 = [(HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)v6 groupIdentifier];
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        v9 = [(HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)self associatedGroupIdentifier];
        v10 = [(HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)v6 associatedGroupIdentifier];
        char v11 = HMFEqualObjects();
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

- (unint64_t)hash
{
  v2 = [(HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)self groupIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)payloadCopy
{
  v12[2] = *MEMORY[0x263EF8340];
  v11[0] = @"groupIdentifier";
  unint64_t v3 = [(HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)self groupIdentifier];
  v4 = [v3 UUIDString];
  v11[1] = @"associatedGroupIdentifier";
  v12[0] = v4;
  v5 = [(HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)self associatedGroupIdentifier];
  uint64_t v6 = [v5 UUIDString];
  v7 = (void *)v6;
  v8 = &stru_26E2EB898;
  if (v6) {
    v8 = (__CFString *)v6;
  }
  v12[1] = v8;
  v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload)initWithPayload:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_UUIDForKey:", @"groupIdentifier");
  uint64_t v6 = objc_msgSend(v4, "hmf_UUIDForKey:", @"associatedGroupIdentifier");
  if (v5)
  {
    v7 = [(HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)self initWithGroupIdentifier:v5 associatedGroupIdentifier:v6];
    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x230FBD990]();
    v7 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      char v11 = HMFGetLogIdentifier();
      int v13 = 138543874;
      v14 = v11;
      __int16 v15 = 2112;
      uint64_t v16 = 0;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_22F52A000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to get decode dependencies group identifier: %@ payload: %@ due", (uint8_t *)&v13, 0x20u);
    }
    v8 = 0;
  }

  return v8;
}

- (id)attributeDescriptions
{
  v13[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  id v4 = [(HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)self groupIdentifier];
  v5 = (void *)[v3 initWithName:@"groupIdentifier" value:v4];
  v13[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  uint64_t v7 = [(HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)self associatedGroupIdentifier];
  v8 = (void *)v7;
  if (v7) {
    v9 = (__CFString *)v7;
  }
  else {
    v9 = @"nil";
  }
  v10 = (void *)[v6 initWithName:@"associatedGroupIdentifier" value:v9];
  v13[1] = v10;
  char v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:2];

  return v11;
}

- (HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload)initWithGroupIdentifier:(id)a3 associatedGroupIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v9 = v8;
    v15.receiver = self;
    v15.super_class = (Class)HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload;
    v10 = [(HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)&v15 init];
    char v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_groupIdentifier, a3);
      objc_storeStrong((id *)&v11->_associatedGroupIdentifier, a4);
    }

    return v11;
  }
  else
  {
    int v13 = (void *)_HMFPreconditionFailure();
    return (HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *)+[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload messageName];
  }
}

+ (NSString)messageName
{
  return (NSString *)@"HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierRequestMessage";
}

@end