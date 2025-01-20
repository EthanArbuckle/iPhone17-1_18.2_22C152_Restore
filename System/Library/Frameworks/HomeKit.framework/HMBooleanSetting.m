@interface HMBooleanSetting
- (BOOL)BOOLValue;
- (BOOL)isEqual:(id)a3;
- (HMBooleanSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 BOOLValue:(BOOL)a5;
- (HMBooleanSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5;
- (HMBooleanSetting)initWithProtoPayload:(id)a3;
- (HMBooleanSetting)settingWithSettingValue:(id)a3;
- (id)attributeDescriptions;
- (id)payloadCopy;
- (id)protoPayload;
- (id)settingValue;
@end

@implementation HMBooleanSetting

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMBooleanSetting *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
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
    if (v6
      && (v10.receiver = self,
          v10.super_class = (Class)HMBooleanSetting,
          [(HMImmutableSetting *)&v10 isEqual:v6]))
    {
      BOOL v7 = [(HMBooleanSetting *)self BOOLValue];
      BOOL v8 = v7 ^ [(HMBooleanSetting *)v6 BOOLValue] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HMBooleanSetting;
  v3 = [(HMImmutableSetting *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMBooleanSetting *)self BOOLValue];
  v5 = HMFBooleanToString();
  v6 = (void *)[v4 initWithName:@"BOOLValue" value:v5];
  v11[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  BOOL v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (HMBooleanSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v18 = 0;
  uint64_t v10 = objc_msgSend(v9, "hmf_BOOLForKey:error:", @"HMImmutableSettingValuePayloadKey", &v18);
  id v11 = v18;
  if (v11)
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v13 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v20 = v15;
      __int16 v21 = 2112;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode BOOLean setting due to no BOOL value in payload: %@ error: %@", buf, 0x20u);
    }
    v16 = 0;
  }
  else
  {
    v13 = [(HMBooleanSetting *)self initWithKeyPath:v8 readOnly:v6 BOOLValue:v10];
    v16 = v13;
  }

  return v16;
}

- (id)payloadCopy
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)HMBooleanSetting;
  v3 = [(HMImmutableSetting *)&v9 payloadCopy];
  id v4 = (void *)[v3 mutableCopy];

  v10[0] = @"HMImmutableSettingTypePayloadKey";
  v10[1] = @"HMImmutableSettingValuePayloadKey";
  v11[0] = &unk_1EEF08148;
  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[HMBooleanSetting BOOLValue](self, "BOOLValue"));
  v11[1] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 addEntriesFromDictionary:v6];

  BOOL v7 = (void *)[v4 copy];

  return v7;
}

- (id)protoPayload
{
  v11.receiver = self;
  v11.super_class = (Class)HMBooleanSetting;
  v3 = [(HMImmutableSetting *)&v11 protoPayload];
  id v4 = objc_alloc_init(HMImmutableSettingsProtoBoolSettingEvent);
  [v3 setBoolSetting:v4];

  v5 = objc_alloc_init(HMImmutableSettingsProtoBoolValueEvent);
  BOOL v6 = [v3 BOOLSetting];
  [v6 setValue:v5];

  BOOL v7 = [(HMBooleanSetting *)self BOOLValue];
  id v8 = [v3 BOOLSetting];
  objc_super v9 = [v8 value];
  [v9 setValue:v7];

  return v3;
}

- (HMBooleanSetting)initWithProtoPayload:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 hasKeyPath] & 1) == 0)
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v11 = self;
    v14 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v15 = HMFGetLogIdentifier();
    int v18 = 138543618;
    v19 = v15;
    __int16 v20 = 2112;
    id v21 = v4;
    v16 = "%{public}@Failed to decode setting missing keyPath: %@";
LABEL_12:
    _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v18, 0x16u);

    goto LABEL_13;
  }
  if (([v4 hasReadOnly] & 1) == 0)
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v11 = self;
    v14 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v15 = HMFGetLogIdentifier();
    int v18 = 138543618;
    v19 = v15;
    __int16 v20 = 2112;
    id v21 = v4;
    v16 = "%{public}@Failed to decode setting missing readOnly: %@";
    goto LABEL_12;
  }
  if (![v4 hasBoolSetting]
    || ([v4 BOOLSetting],
        v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 hasValue],
        v5,
        (v6 & 1) == 0))
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v11 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v18 = 138543618;
      v19 = v15;
      __int16 v20 = 2112;
      id v21 = v4;
      v16 = "%{public}@Failed to decode setting missing BOOL value: %@";
      goto LABEL_12;
    }
LABEL_13:

    v12 = 0;
    goto LABEL_14;
  }
  BOOL v7 = [v4 keyPath];
  uint64_t v8 = [v4 readOnly];
  objc_super v9 = [v4 BOOLSetting];
  uint64_t v10 = [v9 value];
  objc_super v11 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:](self, "initWithKeyPath:readOnly:BOOLValue:", v7, v8, [v10 value]);

  v12 = v11;
LABEL_14:

  return v12;
}

- (id)settingValue
{
  v2 = [[HMSettingBooleanValue alloc] initWithBoolValue:[(HMBooleanSetting *)self BOOLValue]];

  return v2;
}

- (HMBooleanSetting)settingWithSettingValue:(id)a3
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
    BOOL v7 = [HMBooleanSetting alloc];
    uint64_t v8 = [(HMImmutableSetting *)self keyPath];
    objc_super v9 = -[HMBooleanSetting initWithKeyPath:readOnly:BOOLValue:](v7, "initWithKeyPath:readOnly:BOOLValue:", v8, -[HMImmutableSetting isReadOnly](self, "isReadOnly"), [v6 BOOLValue]);
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (HMBooleanSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 BOOLValue:(BOOL)a5
{
  v7.receiver = self;
  v7.super_class = (Class)HMBooleanSetting;
  result = [(HMImmutableSetting *)&v7 initWithKeyPath:a3 readOnly:a4];
  if (result) {
    result->_BOOLValue = a5;
  }
  return result;
}

@end