@interface HMFaceprint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HMFaceprint)initWithCoder:(id)a3;
- (HMFaceprint)initWithUUID:(id)a3 data:(id)a4 modelUUID:(id)a5 faceCropUUID:(id)a6;
- (NSData)data;
- (NSUUID)UUID;
- (NSUUID)faceCropUUID;
- (NSUUID)modelUUID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMFaceprint

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceCropUUID, 0);
  objc_storeStrong((id *)&self->_modelUUID, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_UUID, 0);
}

- (NSUUID)faceCropUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSUUID)modelUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMFaceprint)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFP.ck.u"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFP.ck.d"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFP.ck.mu"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMFP.ck.fcu"];
  v9 = (void *)v8;
  if (v5) {
    BOOL v10 = v6 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v7 == 0 || v8 == 0)
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    v16 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v19 = 138544386;
      v20 = v15;
      __int16 v21 = 2112;
      v22 = v5;
      __int16 v23 = 2112;
      v24 = v6;
      __int16 v25 = 2112;
      v26 = v7;
      __int16 v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@ data: %@ modelUUID: %@ faceCropUUID: %@", (uint8_t *)&v19, 0x34u);
    }
    v17 = 0;
  }
  else
  {
    v16 = [(HMFaceprint *)self initWithUUID:v5 data:v6 modelUUID:v7 faceCropUUID:v8];
    v17 = v16;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMFaceprint *)self UUID];
  [v4 encodeObject:v5 forKey:@"HMFP.ck.u"];

  v6 = [(HMFaceprint *)self data];
  [v4 encodeObject:v6 forKey:@"HMFP.ck.d"];

  v7 = [(HMFaceprint *)self modelUUID];
  [v4 encodeObject:v7 forKey:@"HMFP.ck.mu"];

  id v8 = [(HMFaceprint *)self faceCropUUID];
  [v4 encodeObject:v8 forKey:@"HMFP.ck.fcu"];
}

- (unint64_t)hash
{
  v2 = [(HMFaceprint *)self UUID];
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
    v7 = [(HMFaceprint *)self UUID];
    id v8 = [v6 UUID];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMFaceprint *)self data];
      BOOL v10 = [v6 data];
      if ([v9 isEqualToData:v10])
      {
        v11 = [(HMFaceprint *)self modelUUID];
        v12 = [v6 modelUUID];
        if ([v11 isEqual:v12])
        {
          v16 = [(HMFaceprint *)self faceCropUUID];
          v13 = [v6 faceCropUUID];
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

- (id)description
{
  unint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  id v4 = [(HMFaceprint *)self UUID];
  [v3 appendFormat:@" UUID: %@", v4];

  v5 = [(HMFaceprint *)self data];
  objc_msgSend(v3, "appendFormat:", @" data: <%lu bytes>", objc_msgSend(v5, "length"));

  id v6 = [(HMFaceprint *)self modelUUID];
  [v3 appendFormat:@" modelUUID: %@", v6];

  v7 = [(HMFaceprint *)self faceCropUUID];
  [v3 appendFormat:@" faceCropUUID: %@", v7];

  [v3 appendString:@">"];
  id v8 = (void *)[v3 copy];

  return v8;
}

- (HMFaceprint)initWithUUID:(id)a3 data:(id)a4 modelUUID:(id)a5 faceCropUUID:(id)a6
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
  char v14 = v13;
  if (!v13)
  {
LABEL_11:
    __int16 v25 = (void *)_HMFPreconditionFailure();
    return (HMFaceprint *)+[HMFaceprint supportsSecureCoding];
  }
  v27.receiver = self;
  v27.super_class = (Class)HMFaceprint;
  v15 = [(HMFaceprint *)&v27 init];
  if (v15)
  {
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F654F0], "hmf_cachedInstanceForNSUUID:", v10);
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end