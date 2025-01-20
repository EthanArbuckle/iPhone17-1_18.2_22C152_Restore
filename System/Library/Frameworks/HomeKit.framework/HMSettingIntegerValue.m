@interface HMSettingIntegerValue
- (BOOL)isEqual:(id)a3;
- (HMSettingIntegerValue)initWithIntegerValue:(int64_t)a3;
- (HMSettingIntegerValue)initWithPayload:(id)a3;
- (HMSettingIntegerValue)initWithProtoPayload:(id)a3;
- (id)attributeDescriptions;
- (id)payloadCopy;
- (id)protoPayload;
- (int64_t)integerValue;
@end

@implementation HMSettingIntegerValue

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMSettingIntegerValue *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
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
      int64_t v7 = [(HMSettingIntegerValue *)self integerValue];
      BOOL v8 = v7 == [(HMSettingIntegerValue *)v6 integerValue];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HMSettingIntegerValue;
  v3 = [(HMImmutableSettingValue *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMSettingIntegerValue integerValue](self, "integerValue"));
  v6 = (void *)[v4 initWithName:@"integerValue" value:v5];
  v11[0] = v6;
  int64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  BOOL v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (HMSettingIntegerValue)initWithProtoPayload:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hasIntegerValueEvent])
  {
    v5 = [v4 integerValueEvent];
    if ([v5 hasValue])
    {
      v6 = -[HMSettingIntegerValue initWithIntegerValue:](self, "initWithIntegerValue:", [v5 value]);
      int64_t v7 = v6;
    }
    else
    {
      v11 = (void *)MEMORY[0x19F3A64A0]();
      v6 = self;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = HMFGetLogIdentifier();
        int v15 = 138543618;
        v16 = v13;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_impl(&dword_19D1A8000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to no integer value in integer value event in proto payload: %@", (uint8_t *)&v15, 0x16u);
      }
      int64_t v7 = 0;
    }
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x19F3A64A0]();
    v6 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_super v10 = HMFGetLogIdentifier();
      int v15 = 138543618;
      v16 = v10;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting value due to no integer value event type in proto payload: %@", (uint8_t *)&v15, 0x16u);
    }
    int64_t v7 = 0;
  }

  return v7;
}

- (id)protoPayload
{
  v3 = objc_alloc_init(HMImmutableSettingsProtoValueEvent);
  id v4 = objc_alloc_init(HMImmutableSettingsProtoIntegerValueEvent);
  [(HMImmutableSettingsProtoIntegerValueEvent *)v4 setValue:[(HMSettingIntegerValue *)self integerValue]];
  [(HMImmutableSettingsProtoValueEvent *)v3 setIntegerValueEvent:v4];

  return v3;
}

- (HMSettingIntegerValue)initWithPayload:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v13 = 0;
  uint64_t v5 = objc_msgSend(v4, "hmf_integerForKey:error:", @"HMImmutableSettingValuePayloadKey", &v13);
  id v6 = v13;
  if (v6)
  {
    int64_t v7 = (void *)MEMORY[0x19F3A64A0]();
    BOOL v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_super v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      int v15 = v10;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode setting integer value due to no integer value in payload: %@", buf, 0x16u);
    }
    v11 = 0;
  }
  else
  {
    BOOL v8 = [(HMSettingIntegerValue *)self initWithIntegerValue:v5];
    v11 = v8;
  }

  return v11;
}

- (id)payloadCopy
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)HMSettingIntegerValue;
  v3 = [(HMImmutableSettingValue *)&v9 payloadCopy];
  id v4 = (void *)[v3 mutableCopy];

  v10[0] = @"HMImmutableSettingValueTypePayloadKey";
  v10[1] = @"HMImmutableSettingValuePayloadKey";
  v11[0] = &unk_1EEF080E8;
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMSettingIntegerValue integerValue](self, "integerValue"));
  v11[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 addEntriesFromDictionary:v6];

  int64_t v7 = (void *)[v4 copy];

  return v7;
}

- (HMSettingIntegerValue)initWithIntegerValue:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMSettingIntegerValue;
  result = [(HMImmutableSettingValue *)&v5 initSettingValue];
  if (result) {
    result->_integerValue = a3;
  }
  return result;
}

@end