@interface HMSettingStringValue
- (BOOL)isEqual:(id)a3;
- (HMSettingStringValue)initWithPayload:(id)a3;
- (HMSettingStringValue)initWithProtoPayload:(id)a3;
- (HMSettingStringValue)initWithStringValue:(id)a3;
- (NSString)stringValue;
- (id)attributeDescriptions;
- (id)payloadCopy;
- (id)protoPayload;
- (unint64_t)hash;
@end

@implementation HMSettingStringValue

- (void).cxx_destruct
{
}

- (NSString)stringValue
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMSettingStringValue *)self stringValue];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMSettingStringValue *)a3;
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
    if (v6)
    {
      v7 = [(HMSettingStringValue *)self stringValue];
      v8 = [(HMSettingStringValue *)v6 stringValue];
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
  v10.super_class = (Class)HMSettingStringValue;
  unint64_t v3 = [(HMImmutableSettingValue *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = [(HMSettingStringValue *)self stringValue];
  v6 = (void *)[v4 initWithName:@"stringValue" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (HMSettingStringValue)initWithProtoPayload:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasStringValueEvent])
  {
    v5 = [v4 stringValueEvent];
    if ([v5 hasValue])
    {
      v6 = [v5 value];
      v7 = [(HMSettingStringValue *)self initWithStringValue:v6];

      v8 = v7;
    }
    else
    {
      v12 = (void *)MEMORY[0x19F3A64A0]();
      v7 = self;
      v13 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = HMFGetLogIdentifier();
        int v16 = 138543618;
        v17 = v14;
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to no string value in string value event in proto payload: %@", (uint8_t *)&v16, 0x16u);
      }
      v8 = 0;
    }
  }
  else
  {
    char v9 = (void *)MEMORY[0x19F3A64A0]();
    v7 = self;
    objc_super v10 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = HMFGetLogIdentifier();
      int v16 = 138543618;
      v17 = v11;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_19D1A8000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to no string value event type in proto payload: %@", (uint8_t *)&v16, 0x16u);
    }
    v8 = 0;
  }

  return v8;
}

- (id)protoPayload
{
  unint64_t v3 = objc_alloc_init(HMImmutableSettingsProtoValueEvent);
  id v4 = objc_alloc_init(HMImmutableSettingsProtoStringValueEvent);
  v5 = [(HMSettingStringValue *)self stringValue];
  [(HMImmutableSettingsProtoStringValueEvent *)v4 setValue:v5];

  [(HMImmutableSettingsProtoValueEvent *)v3 setStringValueEvent:v4];

  return v3;
}

- (HMSettingStringValue)initWithPayload:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_stringForKey:", @"HMImmutableSettingValuePayloadKey");
  if (v5)
  {
    v6 = [(HMSettingStringValue *)self initWithStringValue:v5];
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v6 = self;
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_super v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting string value due to no string value in payload: %@", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)payloadCopy
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)HMSettingStringValue;
  unint64_t v3 = [(HMImmutableSettingValue *)&v9 payloadCopy];
  id v4 = (void *)[v3 mutableCopy];

  v10[0] = @"HMImmutableSettingValueTypePayloadKey";
  v10[1] = @"HMImmutableSettingValuePayloadKey";
  v11[0] = &unk_1EEF07FC8;
  v5 = [(HMSettingStringValue *)self stringValue];
  v11[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 addEntriesFromDictionary:v6];

  v7 = (void *)[v4 copy];

  return v7;
}

- (HMSettingStringValue)initWithStringValue:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v12.receiver = self;
    v12.super_class = (Class)HMSettingStringValue;
    v6 = [(HMImmutableSettingValue *)&v12 initSettingValue];
    if (v6)
    {
      uint64_t v7 = [v5 copy];
      stringValue = v6->_stringValue;
      v6->_stringValue = (NSString *)v7;
    }
    return v6;
  }
  else
  {
    objc_super v10 = (HMCameraSnapshotControl *)_HMFPreconditionFailure();
    [(HMCameraSnapshotControl *)v10 .cxx_destruct];
  }
  return result;
}

@end