@interface HMMTRPairing
- (BOOL)isEqual:(id)a3;
- (HMMTRPairing)initWithFabricDescriptor:(id)a3 vendorName:(id)a4;
- (HMMTRPairing)initWithNodeID:(id)a3 fabricID:(id)a4 fabricLabel:(id)a5 rootPublicKey:(id)a6 vendorID:(id)a7 vendorName:(id)a8;
- (NSData)rootPublicKey;
- (NSNumber)fabricID;
- (NSNumber)nodeID;
- (NSNumber)vendorID;
- (NSString)fabricLabel;
- (NSString)vendorName;
- (id)attributeDescriptions;
- (unint64_t)hash;
@end

@implementation HMMTRPairing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorName, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
  objc_storeStrong((id *)&self->_fabricLabel, 0);
  objc_storeStrong((id *)&self->_fabricID, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);
}

- (NSString)vendorName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)rootPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)fabricLabel
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)fabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v28[7] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v27 = [(HMMTRPairing *)self nodeID];
  v26 = (void *)[v3 initWithName:@"Node ID" value:v27];
  v28[0] = v26;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v25 = [(HMMTRPairing *)self fabricID];
  v24 = (void *)[v4 initWithName:@"Fabric ID" value:v25];
  v28[1] = v24;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v23 = [(HMMTRPairing *)self fabricLabel];
  v22 = (void *)[v5 initWithName:@"Fabric Label" value:v23];
  v28[2] = v22;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMMTRPairing *)self rootPublicKey];
  v8 = (void *)[v6 initWithName:@"Root Public Key" value:v7];
  v28[3] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = NSNumber;
  v11 = [(HMMTRPairing *)self rootPublicKey];
  v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "hash"));
  v13 = (void *)[v9 initWithName:@"Root Public Key (Hash)" value:v12];
  v28[4] = v13;
  id v14 = objc_alloc(MEMORY[0x263F424F8]);
  v15 = [(HMMTRPairing *)self vendorID];
  v16 = (void *)[v14 initWithName:@"Vendor ID" value:v15];
  v28[5] = v16;
  id v17 = objc_alloc(MEMORY[0x263F424F8]);
  v18 = [(HMMTRPairing *)self vendorName];
  v19 = (void *)[v17 initWithName:@"Vendor Name" value:v18];
  v28[6] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:7];

  return v20;
}

- (unint64_t)hash
{
  v2 = [(HMMTRPairing *)self nodeID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
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
    v7 = [(HMMTRPairing *)self nodeID];
    v8 = [v6 nodeID];
    if ([v7 isEqualToNumber:v8])
    {
      id v9 = [(HMMTRPairing *)self fabricID];
      v10 = [v6 fabricID];
      if ([v9 isEqualToNumber:v10])
      {
        v11 = [(HMMTRPairing *)self fabricLabel];
        v12 = [v6 fabricLabel];
        if ([v11 isEqualToString:v12])
        {
          v13 = [(HMMTRPairing *)self rootPublicKey];
          v23 = [v6 rootPublicKey];
          v24 = v13;
          if ([v13 isEqualToData:v23])
          {
            uint64_t v14 = [(HMMTRPairing *)self vendorID];
            uint64_t v15 = [v6 vendorID];
            v22 = (void *)v14;
            v16 = (void *)v14;
            id v17 = (void *)v15;
            if ([v16 isEqualToNumber:v15])
            {
              v21 = [(HMMTRPairing *)self vendorName];
              v20 = [v6 vendorName];
              char v18 = [v21 isEqualToString:v20];
            }
            else
            {
              char v18 = 0;
            }
          }
          else
          {
            char v18 = 0;
          }
        }
        else
        {
          char v18 = 0;
        }
      }
      else
      {
        char v18 = 0;
      }
    }
    else
    {
      char v18 = 0;
    }
  }
  else
  {
    char v18 = 0;
  }

  return v18;
}

- (HMMTRPairing)initWithFabricDescriptor:(id)a3 vendorName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = v7;
    id v9 = [v6 nodeId];
    v10 = [v6 fabricId];
    v11 = [v6 label];
    v12 = [v6 rootPublicKey];
    v13 = [v6 vendorId];
    uint64_t v14 = [(HMMTRPairing *)self initWithNodeID:v9 fabricID:v10 fabricLabel:v11 rootPublicKey:v12 vendorID:v13 vendorName:v8];

    return v14;
  }
  else
  {
    v16 = (HMMTRPairing *)_HMFPreconditionFailure();
    return [(HMMTRPairing *)v16 initWithNodeID:v18 fabricID:v19 fabricLabel:v20 rootPublicKey:v21 vendorID:v22 vendorName:v23];
  }
}

- (HMMTRPairing)initWithNodeID:(id)a3 fabricID:(id)a4 fabricLabel:(id)a5 rootPublicKey:(id)a6 vendorID:(id)a7 vendorName:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v28 = a5;
  id v17 = a6;
  id obj = a7;
  id v18 = a7;
  id v27 = a8;
  id v19 = a8;
  if (!v15)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v16)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v18)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  id v20 = v19;
  if (!v19)
  {
LABEL_13:
    v24 = (HMMTRReportDescription *)_HMFPreconditionFailure();
    [(HMMTRReportDescription *)v24 .cxx_destruct];
    return result;
  }
  v29.receiver = self;
  v29.super_class = (Class)HMMTRPairing;
  id v21 = [(HMMTRPairing *)&v29 init];
  id v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_nodeID, a3);
    objc_storeStrong((id *)&v22->_fabricLabel, a5);
    objc_storeStrong((id *)&v22->_fabricID, a4);
    objc_storeStrong((id *)&v22->_rootPublicKey, a6);
    objc_storeStrong((id *)&v22->_vendorID, obj);
    objc_storeStrong((id *)&v22->_vendorName, v27);
  }

  return v22;
}

@end