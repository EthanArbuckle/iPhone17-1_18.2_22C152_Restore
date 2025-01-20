@interface MTSDevicePairing
+ (BOOL)supportsSecureCoding;
+ (id)UUIDFromNodeID:(id)a3 fabric:(id)a4;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (MTRSetupPayload)setupPayload;
- (MTSDevicePairing)initWithCoder:(id)a3;
- (MTSDevicePairing)initWithNodeID:(id)a3 fabric:(id)a4;
- (MTSDevicePairing)initWithUUID:(id)a3 nodeID:(id)a4 serialNumber:(id)a5 vendorID:(id)a6 productID:(id)a7 deviceType:(id)a8 name:(id)a9 setupPayload:(id)a10;
- (MTSDevicePairingFabric)fabric;
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

@implementation MTSDevicePairing

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupPayload, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_fabric, 0);
  objc_storeStrong((id *)&self->_nodeID, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (MTRSetupPayload)setupPayload
{
  return (MTRSetupPayload *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (NSNumber)deviceType
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (NSNumber)productID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (NSNumber)vendorID
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (MTSDevicePairingFabric)fabric
{
  return (MTSDevicePairingFabric *)objc_getProperty(self, a2, 24, 1);
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
  v14[3] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(MTSDevicePairing *)self uuid];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(MTSDevicePairing *)self nodeID];
  v8 = (void *)[v6 initWithName:@"Node ID" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(MTSDevicePairing *)self fabric];
  v11 = (void *)[v9 initWithName:@"Fabric" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];

  return (NSArray *)v12;
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

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MTSDevicePairing *)self nodeID];
  [v4 encodeObject:v5 forKey:@"MTSDP.nodeID"];

  id v6 = [(MTSDevicePairing *)self fabric];
  [v4 encodeObject:v6 forKey:@"MTSDP.fabric"];
}

- (MTSDevicePairing)initWithCoder:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDP.nodeID"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MTSDP.fabric"];
  v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = (void *)MEMORY[0x245697870]();
    v12 = self;
    v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v15 = 138543874;
      v16 = v11;
      __int16 v17 = 2112;
      v18 = v5;
      __int16 v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2450FD000, v10, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from nodeID: %@, fabric: %@", (uint8_t *)&v15, 0x20u);
    }
    v13 = 0;
  }
  else
  {
    v12 = [(MTSDevicePairing *)self initWithNodeID:v5 fabric:v6];
    v13 = v12;
  }

  return v13;
}

- (unint64_t)hash
{
  v2 = [(MTSDevicePairing *)self uuid];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(MTSDevicePairing *)self nodeID];
    BOOL v8 = [v6 nodeID];
    if ([v7 isEqual:v8])
    {
      id v9 = [(MTSDevicePairing *)self fabric];
      v10 = [v6 fabric];
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

  return v11;
}

- (MTSDevicePairing)initWithUUID:(id)a3 nodeID:(id)a4 serialNumber:(id)a5 vendorID:(id)a6 productID:(id)a7 deviceType:(id)a8 name:(id)a9 setupPayload:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  id v24 = a3;
  v25 = [[MTSSystemCommissionerPairing alloc] initWithUUID:v24 nodeID:v23 vendorID:v21 productID:v20 deviceType:v19 serialNumber:v22 name:v18 setupPayload:v17];

  return (MTSDevicePairing *)v25;
}

- (MTSDevicePairing)initWithNodeID:(id)a3 fabric:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  id v9 = v8;
  if (!v8)
  {
LABEL_7:
    id v17 = (void *)_HMFPreconditionFailure();
    return (MTSDevicePairing *)+[MTSDevicePairing shortDescription];
  }
  v19.receiver = self;
  v19.super_class = (Class)MTSDevicePairing;
  v10 = [(MTSDevicePairing *)&v19 init];
  char v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_nodeID, a3);
    uint64_t v12 = [v9 copy];
    fabric = v11->_fabric;
    v11->_fabric = (MTSDevicePairingFabric *)v12;

    uint64_t v14 = +[MTSDevicePairing UUIDFromNodeID:v7 fabric:v9];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v14;
  }
  return v11;
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

+ (id)UUIDFromNodeID:(id)a3 fabric:(id)a4
{
  id v5 = a4;
  uint64_t v11 = [a3 integerValue];
  id v6 = [MEMORY[0x263EFF8F8] dataWithBytes:&v11 length:8];
  id v7 = (void *)MEMORY[0x263F08C38];
  id v8 = [v5 uuid];

  id v9 = objc_msgSend(v7, "hmf_UUIDWithNamespace:data:", v8, v6);

  return v9;
}

@end