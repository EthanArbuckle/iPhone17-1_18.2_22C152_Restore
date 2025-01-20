@interface HMITorsoprint
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)lowQuality;
- (BOOL)unrecognizable;
- (HMITorsoprint)initWithCoder:(id)a3;
- (HMITorsoprint)initWithUUID:(id)a3 data:(id)a4;
- (HMITorsoprint)initWithUUID:(id)a3 data:(id)a4 lowQuality:(BOOL)a5 unrecognizable:(BOOL)a6;
- (NSData)data;
- (NSUUID)UUID;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMITorsoprint

- (HMITorsoprint)initWithUUID:(id)a3 data:(id)a4
{
  return [(HMITorsoprint *)self initWithUUID:a3 data:a4 lowQuality:0 unrecognizable:0];
}

- (HMITorsoprint)initWithUUID:(id)a3 data:(id)a4 lowQuality:(BOOL)a5 unrecognizable:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  if (v11)
  {
    v12 = v11;
    v21.receiver = self;
    v21.super_class = (Class)HMITorsoprint;
    v13 = [(HMITorsoprint *)&v21 init];
    if (v13)
    {
      uint64_t v14 = [v10 copy];
      UUID = v13->_UUID;
      v13->_UUID = (NSUUID *)v14;

      uint64_t v16 = [v12 copy];
      data = v13->_data;
      v13->_data = (NSData *)v16;

      v13->_lowQuality = a5;
      v13->_unrecognizable = a6;
    }

    return v13;
  }
  else
  {
    v19 = (HMITorsoprint *)_HMFPreconditionFailure();
    return (HMITorsoprint *)[(HMITorsoprint *)v19 attributeDescriptions];
  }
}

- (id)attributeDescriptions
{
  v17[4] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMITorsoprint *)self UUID];
  v5 = (void *)[v3 initWithName:@"UUID" value:v4];
  v17[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMITorsoprint *)self data];
  v8 = (void *)[v6 initWithName:@"Data" value:v7];
  v17[1] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMITorsoprint *)self lowQuality];
  id v10 = HMFBooleanToString();
  id v11 = (void *)[v9 initWithName:@"Bad Torso" value:v10];
  v17[2] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMITorsoprint *)self unrecognizable];
  v13 = HMFBooleanToString();
  uint64_t v14 = (void *)[v12 initWithName:@"ROI Boundary" value:v13];
  v17[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:4];

  return v15;
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
    v7 = [(HMITorsoprint *)self UUID];
    v8 = [v6 UUID];
    if ([v7 isEqual:v8])
    {
      id v9 = [(HMITorsoprint *)self data];
      id v10 = [v6 data];
      if ([v9 isEqualToData:v10]
        && (int v11 = -[HMITorsoprint lowQuality](self, "lowQuality"), v11 == [v6 lowQuality]))
      {
        BOOL v13 = [(HMITorsoprint *)self unrecognizable];
        int v12 = v13 ^ [v6 unrecognizable] ^ 1;
      }
      else
      {
        LOBYTE(v12) = 0;
      }
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  v2 = [(HMITorsoprint *)self UUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(HMITorsoprint *)self UUID];
  [v6 encodeObject:v4 forKey:@"HMITP.ck.u"];

  v5 = [(HMITorsoprint *)self data];
  [v6 encodeObject:v5 forKey:@"HMITP.ck.d"];

  objc_msgSend(v6, "encodeBool:forKey:", -[HMITorsoprint lowQuality](self, "lowQuality"), @"HMITP.ck.lq");
  objc_msgSend(v6, "encodeBool:forKey:", -[HMITorsoprint unrecognizable](self, "unrecognizable"), @"HMITP.ck.ur");
}

- (HMITorsoprint)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMITP.ck.u"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMITP.ck.d"];
  int v7 = [v4 containsValueForKey:@"HMITP.ck.lq"];
  int v8 = [v4 containsValueForKey:@"HMITP.ck.ur"];
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0 || v8 == 0)
  {
    int v12 = (void *)MEMORY[0x22A641C70]();
    v17 = self;
    BOOL v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = HMFGetLogIdentifier();
      v15 = HMFBooleanToString();
      uint64_t v16 = HMFBooleanToString();
      int v20 = 138544386;
      objc_super v21 = v14;
      __int16 v22 = 2112;
      v23 = v5;
      __int16 v24 = 2112;
      v25 = v6;
      __int16 v26 = 2112;
      v27 = v15;
      __int16 v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_225DC6000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded UUID: %@ data: %@ hasLowQualityKey: %@, hasUnrecognizableKey: %@", (uint8_t *)&v20, 0x34u);
    }
    v18 = 0;
  }
  else
  {
    v17 = -[HMITorsoprint initWithUUID:data:lowQuality:unrecognizable:](self, "initWithUUID:data:lowQuality:unrecognizable:", v5, v6, [v4 decodeBoolForKey:@"HMITP.ck.lq"], objc_msgSend(v4, "decodeBoolForKey:", @"HMITP.ck.ur"));
    v18 = v17;
  }

  return v18;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)lowQuality
{
  return self->_lowQuality;
}

- (BOOL)unrecognizable
{
  return self->_unrecognizable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end