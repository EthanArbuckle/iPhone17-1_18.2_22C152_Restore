@interface HMIFaceprint
+ (BOOL)supportsSecureCoding;
+ (id)sentinelFaceprintWithUUID:(id)a3 modelUUID:(id)a4 faceCropUUID:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSentinelFaceprint;
- (HMIFaceprint)initWithCoder:(id)a3;
- (HMIFaceprint)initWithUUID:(id)a3 data:(id)a4 modelUUID:(id)a5 faceCropUUID:(id)a6;
- (NSData)data;
- (NSUUID)UUID;
- (NSUUID)faceCropUUID;
- (NSUUID)modelUUID;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMIFaceprint

+ (id)sentinelFaceprintWithUUID:(id)a3 modelUUID:(id)a4 faceCropUUID:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [HMIFaceprint alloc];
  v11 = [MEMORY[0x263EFF8F8] data];
  v12 = [(HMIFaceprint *)v10 initWithUUID:v9 data:v11 modelUUID:v8 faceCropUUID:v7];

  return v12;
}

- (HMIFaceprint)initWithUUID:(id)a3 data:(id)a4 modelUUID:(id)a5 faceCropUUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v11)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v12)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v14 = v13;
  if (!v13)
  {
LABEL_11:
    v25 = (HMIFaceprint *)_HMFPreconditionFailure();
    return (HMIFaceprint *)[(HMIFaceprint *)v25 attributeDescriptions];
  }
  v27.receiver = self;
  v27.super_class = (Class)HMIFaceprint;
  v15 = [(HMIFaceprint *)&v27 init];
  if (v15)
  {
    uint64_t v16 = [v10 copy];
    UUID = v15->_UUID;
    v15->_UUID = (NSUUID *)v16;

    uint64_t v18 = [v11 copy];
    data = v15->_data;
    v15->_data = (NSData *)v18;

    uint64_t v20 = [v12 copy];
    modelUUID = v15->_modelUUID;
    v15->_modelUUID = (NSUUID *)v20;

    uint64_t v22 = [v14 copy];
    faceCropUUID = v15->_faceCropUUID;
    v15->_faceCropUUID = (NSUUID *)v22;
  }
  return v15;
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMIFaceprint *)self UUID];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  id v7 = [(HMIFaceprint *)self data];
  id v8 = (void *)[v6 initWithName:@"Data" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  id v10 = [(HMIFaceprint *)self modelUUID];
  id v11 = (void *)[v9 initWithName:@"Model UUID" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  id v13 = [(HMIFaceprint *)self faceCropUUID];
  v14 = (void *)[v12 initWithName:@"Face Crop UUID" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];

  return v15;
}

- (BOOL)isSentinelFaceprint
{
  v2 = [(HMIFaceprint *)self data];
  id v3 = [MEMORY[0x263EFF8F8] data];
  char v4 = [v2 isEqualToData:v3];

  return v4;
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
    id v7 = [(HMIFaceprint *)self UUID];
    id v8 = [v6 UUID];
    if ([v7 isEqual:v8])
    {
      id v9 = [(HMIFaceprint *)self data];
      id v10 = [v6 data];
      if ([v9 isEqualToData:v10])
      {
        id v11 = [(HMIFaceprint *)self modelUUID];
        id v12 = [v6 modelUUID];
        if ([v11 isEqual:v12])
        {
          uint64_t v16 = [(HMIFaceprint *)self faceCropUUID];
          id v13 = [v6 faceCropUUID];
          char v14 = [v16 isEqual:v13];
        }
        else
        {
          char v14 = 0;
        }
      }
      else
      {
        char v14 = 0;
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  v2 = [(HMIFaceprint *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMIFaceprint *)self UUID];
  [v4 encodeObject:v5 forKey:@"HMIFP.ck.u"];

  id v6 = [(HMIFaceprint *)self data];
  [v4 encodeObject:v6 forKey:@"HMIFP.ck.d"];

  id v7 = [(HMIFaceprint *)self modelUUID];
  [v4 encodeObject:v7 forKey:@"HMIFP.ck.mu"];

  id v8 = [(HMIFaceprint *)self faceCropUUID];
  [v4 encodeObject:v8 forKey:@"HMIFP.ck.fcu"];
}

- (HMIFaceprint)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFP.ck.u"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFP.ck.d"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFP.ck.mu"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMIFP.ck.fcu"];
  id v9 = (void *)v8;
  if (v5) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v6 == 0 || v7 == 0)
  {
    id v13 = (void *)MEMORY[0x22A641C70]();
    uint64_t v16 = self;
    char v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v19 = 138544386;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      uint64_t v22 = v5;
      __int16 v23 = 2112;
      v24 = v6;
      __int16 v25 = 2112;
      SEL v26 = v7;
      __int16 v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_225DC6000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@ data: %@ modelUUID: %@ faceCropUUID: %@", (uint8_t *)&v19, 0x34u);
    }
    v17 = 0;
  }
  else
  {
    uint64_t v16 = [(HMIFaceprint *)self initWithUUID:v5 data:v6 modelUUID:v7 faceCropUUID:v8];
    v17 = v16;
  }

  return v17;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)modelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)faceCropUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCropUUID, 0);
  objc_storeStrong((id *)&self->_modelUUID, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end