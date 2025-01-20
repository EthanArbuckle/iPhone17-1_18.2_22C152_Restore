@interface HMSettingVersionValue
- (BOOL)isEqual:(id)a3;
- (HMFVersion)version;
- (HMSettingVersionValue)initWithPayload:(id)a3;
- (HMSettingVersionValue)initWithVersion:(id)a3 type:(int64_t)a4;
- (id)attributeDescriptions;
- (id)payloadCopy;
- (int64_t)type;
- (unint64_t)hash;
@end

@implementation HMSettingVersionValue

- (void).cxx_destruct
{
}

- (int64_t)type
{
  return self->_type;
}

- (HMFVersion)version
{
  return (HMFVersion *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMSettingVersionValue *)self version];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMSettingVersionValue *)a3;
  if (self == v4)
  {
    char v10 = 1;
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
    if (v6 && (int64_t v7 = [(HMSettingVersionValue *)self type], v7 == [(HMSettingVersionValue *)v6 type]))
    {
      v8 = [(HMSettingVersionValue *)self version];
      v9 = [(HMSettingVersionValue *)v6 version];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
}

- (id)attributeDescriptions
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)HMSettingVersionValue;
  unint64_t v3 = [(HMImmutableSettingValue *)&v13 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = HMSettingVersionValueTypeAsString([(HMSettingVersionValue *)self type]);
  v6 = (void *)[v4 initWithName:@"type" value:v5];
  v14[0] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HMSettingVersionValue *)self version];
  v9 = (void *)[v7 initWithName:@"version" value:v8];
  v14[1] = v9;
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  v11 = [v3 arrayByAddingObjectsFromArray:v10];

  return v11;
}

- (id)payloadCopy
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v9[0] = &unk_1EEF07AA0;
  v8[0] = @"HMImmutableSettingValueTypePayloadKey";
  v8[1] = @"HMSettingVersionValueTypePayloadKey";
  unint64_t v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMSettingVersionValue type](self, "type"));
  v9[1] = v3;
  v8[2] = @"HMSettingVersionValueVersionPayloadKey";
  id v4 = [(HMSettingVersionValue *)self version];
  v5 = [v4 versionString];
  v9[2] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (HMSettingVersionValue)initWithPayload:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v17 = 0;
  uint64_t v5 = objc_msgSend(v4, "hmf_integerForKey:error:", @"HMSettingVersionValueTypePayloadKey", &v17);
  id v6 = v17;
  id v7 = objc_msgSend(v4, "hmf_stringForKey:", @"HMSettingVersionValueVersionPayloadKey");
  uint64_t v8 = [objc_alloc(MEMORY[0x1E4F65590]) initWithVersionString:v7];
  v9 = (void *)v8;
  if (v6) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v8 == 0;
  }
  if (v10)
  {
    v11 = (void *)MEMORY[0x19F3A64A0]();
    v14 = self;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v19 = v13;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode payload: %@", buf, 0x16u);
    }
    v15 = 0;
  }
  else
  {
    v14 = [(HMSettingVersionValue *)self initWithVersion:v8 type:v5];
    v15 = v14;
  }

  return v15;
}

- (HMSettingVersionValue)initWithVersion:(id)a3 type:(int64_t)a4
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = v7;
    v14.receiver = self;
    v14.super_class = (Class)HMSettingVersionValue;
    v9 = [(HMImmutableSettingValue *)&v14 initSettingValue];
    BOOL v10 = v9;
    if (v9)
    {
      v9->_type = a4;
      objc_storeStrong((id *)&v9->_version, a3);
    }

    return v10;
  }
  else
  {
    v12 = (HMCameraClipEncryptedDataContext *)_HMFPreconditionFailure();
    [(HMCameraClipEncryptedDataContext *)v12 .cxx_destruct];
  }
  return result;
}

@end