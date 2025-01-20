@interface HMDMediaGroupsParticipantData
- (BOOL)isEqual:(id)a3;
- (HMDMediaGroupsParticipantData)initWithDestination:(id)a3 destinationControllerData:(id)a4 backedUpGroups:(id)a5;
- (HMDMediaGroupsParticipantData)initWithProtoBufferData:(id)a3;
- (HMMediaDestination)destination;
- (HMMediaDestinationControllerData)destinationControllerData;
- (NSArray)backedUpGroups;
- (id)description;
- (id)encodeToProtoBufferData;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setBackedUpGroups:(id)a3;
- (void)setDestination:(id)a3;
- (void)setDestinationControllerData:(id)a3;
@end

@implementation HMDMediaGroupsParticipantData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backedUpGroups, 0);
  objc_storeStrong((id *)&self->_destinationControllerData, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

- (void)setBackedUpGroups:(id)a3
{
}

- (NSArray)backedUpGroups
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDestinationControllerData:(id)a3
{
}

- (HMMediaDestinationControllerData)destinationControllerData
{
  return (HMMediaDestinationControllerData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDestination:(id)a3
{
}

- (HMMediaDestination)destination
{
  return (HMMediaDestination *)objc_getProperty(self, a2, 8, 1);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [HMDMutableMediaGroupsParticipantData alloc];
  v5 = [(HMDMediaGroupsParticipantData *)self destination];
  v6 = [(HMDMediaGroupsParticipantData *)self destinationControllerData];
  v7 = [(HMDMediaGroupsParticipantData *)self backedUpGroups];
  v8 = [(HMDMediaGroupsParticipantData *)v4 initWithDestination:v5 destinationControllerData:v6 backedUpGroups:v7];

  return v8;
}

- (unint64_t)hash
{
  v3 = [(HMDMediaGroupsParticipantData *)self destination];

  if (v3)
  {
    v4 = [(HMDMediaGroupsParticipantData *)self destination];
    v5 = [v4 uniqueIdentifier];
  }
  else
  {
    v6 = [(HMDMediaGroupsParticipantData *)self destinationControllerData];

    if (!v6)
    {
      v4 = [(HMDMediaGroupsParticipantData *)self backedUpGroups];
      unint64_t v8 = [v4 count];
      goto LABEL_6;
    }
    v4 = [(HMDMediaGroupsParticipantData *)self destinationControllerData];
    v5 = [v4 identifier];
  }
  v7 = v5;
  unint64_t v8 = [v5 hash];

LABEL_6:
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDMediaGroupsParticipantData *)a3;
  if (self == v4)
  {
    char v19 = 1;
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
    if (!v6) {
      goto LABEL_9;
    }
    v7 = [(HMDMediaGroupsParticipantData *)self destination];
    unint64_t v8 = [(HMDMediaGroupsParticipantData *)v6 destination];
    int v9 = HMFEqualObjects();

    if (!v9) {
      goto LABEL_9;
    }
    v10 = [(HMDMediaGroupsParticipantData *)self destinationControllerData];
    v11 = [(HMDMediaGroupsParticipantData *)v6 destinationControllerData];
    int v12 = HMFEqualObjects();

    if (v12)
    {
      v13 = (void *)MEMORY[0x263EFFA08];
      v14 = [(HMDMediaGroupsParticipantData *)self backedUpGroups];
      v15 = [v13 setWithArray:v14];
      v16 = (void *)MEMORY[0x263EFFA08];
      v17 = [(HMDMediaGroupsParticipantData *)v6 backedUpGroups];
      v18 = [v16 setWithArray:v17];
      char v19 = [v15 isEqual:v18];
    }
    else
    {
LABEL_9:
      char v19 = 0;
    }
  }
  return v19;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(HMDMediaGroupsParticipantData *)self destination];
  v5 = (void *)v4;
  if (v4) {
    v6 = (__CFString *)v4;
  }
  else {
    v6 = @"none";
  }
  uint64_t v7 = [(HMDMediaGroupsParticipantData *)self destinationControllerData];
  unint64_t v8 = (void *)v7;
  if (v7) {
    int v9 = (__CFString *)v7;
  }
  else {
    int v9 = @"none";
  }
  v10 = NSNumber;
  v11 = [(HMDMediaGroupsParticipantData *)self backedUpGroups];
  int v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  v13 = [v3 stringWithFormat:@"<HMDMediaGroupsParticipantData destination: %@ destinationControllerData: %@ groups count: %@>", v6, v9, v12];

  return v13;
}

- (HMDMediaGroupsParticipantData)initWithProtoBufferData:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x263F0E500];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithData:v5];

  if ([v6 hasDestination])
  {
    id v7 = objc_alloc(MEMORY[0x263F0E4C0]);
    unint64_t v8 = [v6 destination];
    int v9 = [v8 data];
    v10 = (void *)[v7 initWithProtoBufferData:v9];
  }
  else
  {
    v10 = 0;
  }
  if ([v6 hasDestinationController])
  {
    id v11 = objc_alloc(MEMORY[0x263F0E4D0]);
    int v12 = [v6 destinationController];
    v13 = [v12 data];
    v14 = (void *)[v11 initWithProtoBufferData:v13];
  }
  else
  {
    v14 = 0;
  }
  if ([v6 backupGroupsCount])
  {
    v15 = [v6 backupGroups];
    v16 = [(HMDMediaGroupsParticipantData *)self initWithDestination:v10 destinationControllerData:v14 backedUpGroups:v15];
  }
  else
  {
    v16 = [(HMDMediaGroupsParticipantData *)self initWithDestination:v10 destinationControllerData:v14 backedUpGroups:MEMORY[0x263EFFA68]];
  }

  return v16;
}

- (id)encodeToProtoBufferData
{
  id v3 = objc_alloc_init(MEMORY[0x263F0E500]);
  uint64_t v4 = [(HMDMediaGroupsParticipantData *)self destination];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F0E4E0]);
    v6 = [(HMDMediaGroupsParticipantData *)self destination];
    id v7 = [v6 encodeToProtoBufferData];
    unint64_t v8 = (void *)[v5 initWithData:v7];
    [v3 setDestination:v8];
  }
  int v9 = [(HMDMediaGroupsParticipantData *)self destinationControllerData];

  if (v9)
  {
    id v10 = objc_alloc(MEMORY[0x263F0E4F0]);
    id v11 = [(HMDMediaGroupsParticipantData *)self destinationControllerData];
    int v12 = [v11 encodeToProtoBufferData];
    v13 = (void *)[v10 initWithData:v12];
    [v3 setDestinationController:v13];
  }
  v14 = [(HMDMediaGroupsParticipantData *)self backedUpGroups];
  v15 = (void *)[v14 mutableCopy];
  [v3 setBackupGroups:v15];

  v16 = [v3 data];

  return v16;
}

- (HMDMediaGroupsParticipantData)initWithDestination:(id)a3 destinationControllerData:(id)a4 backedUpGroups:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    int v12 = v11;
    v19.receiver = self;
    v19.super_class = (Class)HMDMediaGroupsParticipantData;
    v13 = [(HMDMediaGroupsParticipantData *)&v19 init];
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_destination, a3);
      objc_storeStrong((id *)&v14->_destinationControllerData, a4);
      objc_storeStrong((id *)&v14->_backedUpGroups, a5);
    }

    return v14;
  }
  else
  {
    v16 = (HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)_HMFPreconditionFailure();
    [(HMDNetworkRouterFirewallRuleManagerBackingStoreMirror *)v16 __updateChangeTokenWithFetchInfo:v18];
  }
  return result;
}

@end