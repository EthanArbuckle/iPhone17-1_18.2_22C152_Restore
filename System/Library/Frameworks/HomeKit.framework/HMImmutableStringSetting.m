@interface HMImmutableStringSetting
- (BOOL)isEqual:(id)a3;
- (HMImmutableStringSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5;
- (HMImmutableStringSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 stringValue:(id)a5;
- (HMImmutableStringSetting)initWithProtoPayload:(id)a3;
- (HMImmutableStringSetting)settingWithSettingValue:(id)a3;
- (NSString)stringValue;
- (id)attributeDescriptions;
- (id)payloadCopy;
- (id)protoPayload;
- (id)settingValue;
@end

@implementation HMImmutableStringSetting

- (void).cxx_destruct
{
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMImmutableStringSetting *)a3;
  if (self == v4)
  {
    char v9 = 1;
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
      && (v11.receiver = self,
          v11.super_class = (Class)HMImmutableStringSetting,
          [(HMImmutableSetting *)&v11 isEqual:v6]))
    {
      v7 = [(HMImmutableStringSetting *)self stringValue];
      v8 = [(HMImmutableStringSetting *)v6 stringValue];
      char v9 = [v7 isEqualToString:v8];
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HMImmutableStringSetting;
  v3 = [(HMImmutableSetting *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMImmutableStringSetting *)self stringValue];
  v6 = (void *)[v4 initWithName:@"stringValue" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (HMImmutableStringSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = objc_msgSend(v9, "hmf_stringForKey:", @"HMImmutableSettingValuePayloadKey");
  if (v10)
  {
    objc_super v11 = [(HMImmutableStringSetting *)self initWithKeyPath:v8 readOnly:v6 stringValue:v10];
    v12 = v11;
  }
  else
  {
    v13 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v11 = self;
    v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138543618;
      v18 = v15;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_19D1A8000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode string setting due to no string value in payload: %@", (uint8_t *)&v17, 0x16u);
    }
    v12 = 0;
  }

  return v12;
}

- (id)payloadCopy
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)HMImmutableStringSetting;
  v3 = [(HMImmutableSetting *)&v9 payloadCopy];
  id v4 = (void *)[v3 mutableCopy];

  v10[0] = @"HMImmutableSettingTypePayloadKey";
  v10[1] = @"HMImmutableSettingValuePayloadKey";
  v11[0] = &unk_1EEF080D0;
  v5 = [(HMImmutableStringSetting *)self stringValue];
  v11[1] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 addEntriesFromDictionary:v6];

  v7 = (void *)[v4 copy];

  return v7;
}

- (id)protoPayload
{
  v11.receiver = self;
  v11.super_class = (Class)HMImmutableStringSetting;
  v3 = [(HMImmutableSetting *)&v11 protoPayload];
  id v4 = objc_alloc_init(HMImmutableSettingsProtoStringSettingEvent);
  [v3 setStringSetting:v4];

  v5 = objc_alloc_init(HMImmutableSettingsProtoStringValueEvent);
  BOOL v6 = [v3 stringSetting];
  [v6 setValue:v5];

  v7 = [(HMImmutableStringSetting *)self stringValue];
  id v8 = [v3 stringSetting];
  objc_super v9 = [v8 value];
  [v9 setValue:v7];

  return v3;
}

- (HMImmutableStringSetting)initWithProtoPayload:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 hasKeyPath] & 1) == 0)
  {
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    v15 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v16 = HMFGetLogIdentifier();
    int v19 = 138543618;
    id v20 = v16;
    __int16 v21 = 2112;
    id v22 = v4;
    int v17 = "%{public}@Failed to decode setting missing keyPath: %@";
LABEL_12:
    _os_log_impl(&dword_19D1A8000, v15, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v19, 0x16u);

    goto LABEL_13;
  }
  if (([v4 hasReadOnly] & 1) == 0)
  {
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    v15 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    v16 = HMFGetLogIdentifier();
    int v19 = 138543618;
    id v20 = v16;
    __int16 v21 = 2112;
    id v22 = v4;
    int v17 = "%{public}@Failed to decode setting missing readOnly: %@";
    goto LABEL_12;
  }
  if (![v4 hasStringSetting]
    || ([v4 stringSetting],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v5 value],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    v14 = (void *)MEMORY[0x19F3A64A0]();
    v12 = self;
    v15 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = HMFGetLogIdentifier();
      int v19 = 138543618;
      id v20 = v16;
      __int16 v21 = 2112;
      id v22 = v4;
      int v17 = "%{public}@Failed to decode setting missing string value: %@";
      goto LABEL_12;
    }
LABEL_13:

    v13 = 0;
    goto LABEL_14;
  }
  v7 = [v4 keyPath];
  uint64_t v8 = [v4 readOnly];
  objc_super v9 = [v4 stringSetting];
  objc_super v10 = [v9 value];
  objc_super v11 = [v10 value];
  v12 = [(HMImmutableStringSetting *)self initWithKeyPath:v7 readOnly:v8 stringValue:v11];

  v13 = v12;
LABEL_14:

  return v13;
}

- (id)settingValue
{
  v3 = [HMSettingStringValue alloc];
  id v4 = [(HMImmutableStringSetting *)self stringValue];
  v5 = [(HMSettingStringValue *)v3 initWithStringValue:v4];

  return v5;
}

- (HMImmutableStringSetting)settingWithSettingValue:(id)a3
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
    v7 = [HMImmutableStringSetting alloc];
    uint64_t v8 = [(HMImmutableSetting *)self keyPath];
    BOOL v9 = [(HMImmutableSetting *)self isReadOnly];
    objc_super v10 = [v6 stringValue];
    objc_super v11 = [(HMImmutableStringSetting *)v7 initWithKeyPath:v8 readOnly:v9 stringValue:v10];
  }
  else
  {
    objc_super v11 = 0;
  }

  return v11;
}

- (HMImmutableStringSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 stringValue:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    objc_super v10 = v9;
    v17.receiver = self;
    v17.super_class = (Class)HMImmutableStringSetting;
    objc_super v11 = [(HMImmutableSetting *)&v17 initWithKeyPath:v8 readOnly:v6];
    if (v11)
    {
      uint64_t v12 = [v10 copy];
      stringValue = v11->_stringValue;
      v11->_stringValue = (NSString *)v12;
    }
    return v11;
  }
  else
  {
    v15 = (HMAccessoryDiagnosticsMetadata *)_HMFPreconditionFailure();
    [(HMAccessoryDiagnosticsMetadata *)v15 .cxx_destruct];
  }
  return result;
}

@end