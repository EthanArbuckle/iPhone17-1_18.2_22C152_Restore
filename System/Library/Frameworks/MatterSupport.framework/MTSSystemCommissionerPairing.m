@interface MTSSystemCommissionerPairing
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (MTRSetupPayload)setupPayload;
- (MTSSystemCommissionerPairing)initWithCoder:(id)a3;
- (MTSSystemCommissionerPairing)initWithUUID:(id)a3 nodeID:(id)a4 vendorID:(id)a5 productID:(id)a6 deviceType:(id)a7 serialNumber:(id)a8 name:(id)a9 setupPayload:(id)a10;
- (NSArray)attributeDescriptions;
- (NSNumber)deviceType;
- (NSNumber)nodeID;
- (NSNumber)productID;
- (NSNumber)vendorID;
- (NSString)description;
- (NSString)name;
- (NSString)serialNumber;
- (NSString)shortDescription;
- (NSUUID)uuid;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MTSSystemCommissionerPairing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupPayload, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (MTRSetupPayload)setupPayload
{
  return (MTRSetupPayload *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)deviceType
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v29[8] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v28 = [(MTSSystemCommissionerPairing *)self uuid];
  v27 = (void *)[v3 initWithName:@"UUID" value:v28];
  v29[0] = v27;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v26 = [(MTSSystemCommissionerPairing *)self nodeID];
  v25 = (void *)[v4 initWithName:@"Node ID" value:v26];
  v29[1] = v25;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  v24 = [(MTSSystemCommissionerPairing *)self vendorID];
  v23 = (void *)[v5 initWithName:@"Vendor ID" value:v24];
  v29[2] = v23;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = [(MTSSystemCommissionerPairing *)self productID];
  v7 = (void *)[v6 initWithName:@"Product ID" value:v22];
  v29[3] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = [(MTSSystemCommissionerPairing *)self deviceType];
  v10 = (void *)[v8 initWithName:@"Device Type" value:v9];
  v29[4] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  v12 = [(MTSSystemCommissionerPairing *)self serialNumber];
  v13 = (void *)[v11 initWithName:@"Serial Number" value:v12];
  v29[5] = v13;
  id v14 = objc_alloc(MEMORY[0x263F424F8]);
  v15 = [(MTSSystemCommissionerPairing *)self name];
  v16 = (void *)[v14 initWithName:@"Name" value:v15];
  v29[6] = v16;
  id v17 = objc_alloc(MEMORY[0x263F424F8]);
  v18 = [(MTSSystemCommissionerPairing *)self setupPayload];
  v19 = (void *)[v17 initWithName:@"Setup Payload" value:v18];
  v29[7] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:8];

  return (NSArray *)v20;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x270F30880](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (MTSSystemCommissionerPairing)initWithCoder:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSSCP.uuid"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSSCP.nodeID"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSSCP.vendorID"];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSSCP.productID"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSSCP.deviceType"];
  v10 = (void *)v9;
  if (v5 && v6 && v7 && v8 && v9)
  {
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSSCP.serialNumber"];
    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSSCP.name"];
    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSSCP.setupPayload"];
    id v14 = [(MTSSystemCommissionerPairing *)self initWithUUID:v5 nodeID:v6 vendorID:v7 productID:v8 deviceType:v10 serialNumber:v11 name:v12 setupPayload:v13];

    v15 = v14;
  }
  else
  {
    v16 = (void *)MEMORY[0x245697870]();
    id v14 = self;
    id v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138544642;
      v21 = v18;
      __int16 v22 = 2112;
      v23 = v5;
      __int16 v24 = 2112;
      v25 = v6;
      __int16 v26 = 2112;
      v27 = v7;
      __int16 v28 = 2112;
      v29 = v8;
      __int16 v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_2450FD000, v17, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded uuid: %@, nodeID: %@, vendorID: %@, productID: %@, deviceType: %@", buf, 0x3Eu);
    }
    v15 = 0;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(MTSSystemCommissionerPairing *)self uuid];
  [v4 encodeObject:v5 forKey:@"MTSSCP.uuid"];

  id v6 = [(MTSSystemCommissionerPairing *)self nodeID];
  [v4 encodeObject:v6 forKey:@"MTSSCP.nodeID"];

  v7 = [(MTSSystemCommissionerPairing *)self vendorID];
  [v4 encodeObject:v7 forKey:@"MTSSCP.vendorID"];

  id v8 = [(MTSSystemCommissionerPairing *)self productID];
  [v4 encodeObject:v8 forKey:@"MTSSCP.productID"];

  uint64_t v9 = [(MTSSystemCommissionerPairing *)self deviceType];
  [v4 encodeObject:v9 forKey:@"MTSSCP.deviceType"];

  v10 = [(MTSSystemCommissionerPairing *)self serialNumber];
  [v4 encodeObject:v10 forKey:@"MTSSCP.serialNumber"];

  id v11 = [(MTSSystemCommissionerPairing *)self name];
  [v4 encodeObject:v11 forKey:@"MTSSCP.name"];

  id v12 = [(MTSSystemCommissionerPairing *)self setupPayload];
  [v4 encodeObject:v12 forKey:@"MTSSCP.setupPayload"];
}

- (unint64_t)hash
{
  v2 = [(MTSSystemCommissionerPairing *)self name];
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
    v7 = [(MTSSystemCommissionerPairing *)self uuid];
    id v8 = [v6 uuid];
    if (![v7 isEqual:v8])
    {
      char v20 = 0;
LABEL_27:

      goto LABEL_28;
    }
    uint64_t v9 = [(MTSSystemCommissionerPairing *)self nodeID];
    v10 = [v6 nodeID];
    if (![v9 isEqual:v10])
    {
      char v20 = 0;
LABEL_26:

      goto LABEL_27;
    }
    id v11 = [(MTSSystemCommissionerPairing *)self vendorID];
    id v12 = [v6 vendorID];
    if (![v11 isEqual:v12])
    {
      char v20 = 0;
LABEL_25:

      goto LABEL_26;
    }
    v13 = [(MTSSystemCommissionerPairing *)self productID];
    v29 = [v6 productID];
    if (!objc_msgSend(v13, "isEqual:"))
    {
      char v20 = 0;
LABEL_24:

      goto LABEL_25;
    }
    __int16 v26 = v11;
    id v14 = [(MTSSystemCommissionerPairing *)self deviceType];
    v27 = [v6 deviceType];
    __int16 v28 = v14;
    if (objc_msgSend(v14, "isEqual:"))
    {
      v25 = v13;
      v15 = [(MTSSystemCommissionerPairing *)self serialNumber];
      v16 = [v6 serialNumber];
      int v22 = HMFEqualObjects();

      if (v22)
      {
        id v17 = [(MTSSystemCommissionerPairing *)self name];
        v18 = [v6 name];
        int v23 = HMFEqualObjects();

        id v11 = v26;
        if (v23)
        {
          __int16 v24 = [(MTSSystemCommissionerPairing *)self setupPayload];
          v19 = [v6 setupPayload];
          char v20 = HMFEqualObjects();
        }
        else
        {
          char v20 = 0;
        }
        v13 = v25;
        goto LABEL_23;
      }
      char v20 = 0;
      v13 = v25;
    }
    else
    {
      char v20 = 0;
    }
    id v11 = v26;
LABEL_23:

    goto LABEL_24;
  }
  char v20 = 0;
LABEL_28:

  return v20;
}

- (MTSSystemCommissionerPairing)initWithUUID:(id)a3 nodeID:(id)a4 vendorID:(id)a5 productID:(id)a6 deviceType:(id)a7 serialNumber:(id)a8 name:(id)a9 setupPayload:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  if (!v16)
  {
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v17)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  if (!v18)
  {
LABEL_11:
    _HMFPreconditionFailure();
    goto LABEL_12;
  }
  if (!v19)
  {
LABEL_12:
    _HMFPreconditionFailure();
    goto LABEL_13;
  }
  if (!v20)
  {
LABEL_13:
    v41 = (void *)_HMFPreconditionFailure();
    return (MTSSystemCommissionerPairing *)+[MTSSystemCommissionerPairing shortDescription];
  }
  __int16 v24 = v23;
  v43.receiver = self;
  v43.super_class = (Class)MTSSystemCommissionerPairing;
  v25 = [(MTSSystemCommissionerPairing *)&v43 init];
  if (v25)
  {
    uint64_t v26 = [v16 copy];
    uuid = v25->_uuid;
    v25->_uuid = (NSUUID *)v26;

    uint64_t v28 = [v17 copy];
    nodeID = v25->_nodeID;
    v25->_nodeID = (NSNumber *)v28;

    uint64_t v30 = [v18 copy];
    vendorID = v25->_vendorID;
    v25->_vendorID = (NSNumber *)v30;

    uint64_t v32 = [v19 copy];
    productID = v25->_productID;
    v25->_productID = (NSNumber *)v32;

    uint64_t v34 = [v20 copy];
    deviceType = v25->_deviceType;
    v25->_deviceType = (NSNumber *)v34;

    uint64_t v36 = [v21 copy];
    serialNumber = v25->_serialNumber;
    v25->_serialNumber = (NSString *)v36;

    uint64_t v38 = [v22 copy];
    name = v25->_name;
    v25->_name = (NSString *)v38;

    objc_storeStrong((id *)&v25->_setupPayload, a10);
  }

  return v25;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end