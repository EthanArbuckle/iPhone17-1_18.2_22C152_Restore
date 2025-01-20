@interface HMDDeviceAssociationInfoProto
- (BOOL)isEqual:(id)a3;
- (HMDDeviceAssociationInfoProto)initWithAccessoryUUID:(id)a3 idsIdentifier:(id)a4 idsDestination:(id)a5;
- (HMDDeviceAssociationInfoProto)initWithProtoData:(id)a3;
- (HMDDeviceAssociationInfoProto)initWithProtoPayload:(id)a3;
- (NSString)idsDestination;
- (NSUUID)accessoryUUID;
- (NSUUID)idsIdentifier;
- (id)description;
- (id)protoData;
- (id)protoPayload;
- (unint64_t)hash;
@end

@implementation HMDDeviceAssociationInfoProto

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDestination, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (NSString)idsDestination
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)idsIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (id)protoData
{
  v2 = [(HMDDeviceAssociationInfoProto *)self protoPayload];
  v3 = [v2 data];

  return v3;
}

- (id)protoPayload
{
  v3 = objc_alloc_init(HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo);
  v4 = [(HMDDeviceAssociationInfoProto *)self accessoryUUID];
  v5 = [v4 UUIDString];
  [(HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo *)v3 setAccessoryUUID:v5];

  v6 = [(HMDDeviceAssociationInfoProto *)self idsIdentifier];
  v7 = [v6 UUIDString];
  [(HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo *)v3 setIdsIdentifier:v7];

  v8 = [(HMDDeviceAssociationInfoProto *)self idsDestination];
  [(HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo *)v3 setIdsDestination:v8];

  return v3;
}

- (unint64_t)hash
{
  v3 = [(HMDDeviceAssociationInfoProto *)self accessoryUUID];
  uint64_t v4 = [v3 hash];

  v5 = [(HMDDeviceAssociationInfoProto *)self idsIdentifier];
  uint64_t v6 = [v5 hash] ^ v4;

  v7 = [(HMDDeviceAssociationInfoProto *)self idsDestination];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HMDDeviceAssociationInfoProto *)a3;
  if (self == v4)
  {
    char v13 = 1;
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
    if (v6)
    {
      v7 = [(HMDDeviceAssociationInfoProto *)self accessoryUUID];
      unint64_t v8 = [(HMDDeviceAssociationInfoProto *)v6 accessoryUUID];
      if (HMFEqualObjects())
      {
        v9 = [(HMDDeviceAssociationInfoProto *)self idsIdentifier];
        v10 = [(HMDDeviceAssociationInfoProto *)v6 idsIdentifier];
        if (HMFEqualObjects())
        {
          v11 = [(HMDDeviceAssociationInfoProto *)self idsDestination];
          v12 = [(HMDDeviceAssociationInfoProto *)v6 idsDestination];
          char v13 = HMFEqualObjects();
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(HMDDeviceAssociationInfoProto *)self accessoryUUID];
  v5 = [(HMDDeviceAssociationInfoProto *)self idsIdentifier];
  uint64_t v6 = [(HMDDeviceAssociationInfoProto *)self idsDestination];
  v7 = [v3 stringWithFormat:@"accessory uuid: %@ ids identifier: %@ ids destination: %@", v4, v5, v6];

  return v7;
}

- (HMDDeviceAssociationInfoProto)initWithProtoData:(id)a3
{
  id v4 = a3;
  v5 = [[HMDAppleMediaDeviceAssociationInfoDeviceAssociationInfo alloc] initWithData:v4];

  uint64_t v6 = [(HMDDeviceAssociationInfoProto *)self initWithProtoPayload:v5];
  return v6;
}

- (HMDDeviceAssociationInfoProto)initWithProtoPayload:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 accessoryUUID];
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    uint64_t v7 = [v4 idsIdentifier];
    if (v7)
    {
      unint64_t v8 = (void *)v7;
      v9 = [v4 idsDestination];

      if (v9)
      {
        id v10 = objc_alloc(MEMORY[0x263F08C38]);
        v11 = [v4 accessoryUUID];
        v12 = (void *)[v10 initWithUUIDString:v11];
        id v13 = objc_alloc(MEMORY[0x263F08C38]);
        v14 = [v4 idsIdentifier];
        v15 = (void *)[v13 initWithUUIDString:v14];
        v16 = [v4 idsDestination];
        v17 = [(HMDDeviceAssociationInfoProto *)self initWithAccessoryUUID:v12 idsIdentifier:v15 idsDestination:v16];

        v18 = v17;
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  v19 = (void *)MEMORY[0x230FBD990]();
  v17 = self;
  v20 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = HMFGetLogIdentifier();
    v22 = [v4 accessoryUUID];
    v23 = [v4 idsIdentifier];
    v24 = [v4 idsDestination];
    int v26 = 138544130;
    v27 = v21;
    __int16 v28 = 2112;
    v29 = v22;
    __int16 v30 = 2112;
    v31 = v23;
    __int16 v32 = 2112;
    v33 = v24;
    _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Proto payload is missing some fields, accessoryUUID: %@ idsIdentifier: %@ idsDestination: %@", (uint8_t *)&v26, 0x2Au);
  }
  v18 = 0;
LABEL_9:

  return v18;
}

- (HMDDeviceAssociationInfoProto)initWithAccessoryUUID:(id)a3 idsIdentifier:(id)a4 idsDestination:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDDeviceAssociationInfoProto;
  v12 = [(HMDDeviceAssociationInfoProto *)&v15 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accessoryUUID, a3);
    objc_storeStrong((id *)&v13->_idsIdentifier, a4);
    objc_storeStrong((id *)&v13->_idsDestination, a5);
  }

  return v13;
}

@end