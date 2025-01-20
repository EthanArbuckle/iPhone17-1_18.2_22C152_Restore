@interface HMBoundedIntegerSetting
- (BOOL)isEqual:(id)a3;
- (HMBoundedIntegerSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 integerValue:(int64_t)a5 maxValue:(int64_t)a6 minValue:(int64_t)a7 valueStepSize:(int64_t)a8;
- (HMBoundedIntegerSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5;
- (HMBoundedIntegerSetting)initWithProtoPayload:(id)a3;
- (HMBoundedIntegerSetting)settingWithSettingValue:(id)a3;
- (id)attributeDescriptions;
- (id)payloadCopy;
- (id)protoPayload;
- (id)settingValue;
- (int64_t)integerValue;
- (int64_t)maxValue;
- (int64_t)minValue;
- (int64_t)valueStepSize;
@end

@implementation HMBoundedIntegerSetting

- (int64_t)valueStepSize
{
  return self->_valueStepSize;
}

- (int64_t)minValue
{
  return self->_minValue;
}

- (int64_t)maxValue
{
  return self->_maxValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMBoundedIntegerSetting *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
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
      && (v13.receiver = self,
          v13.super_class = (Class)HMBoundedIntegerSetting,
          [(HMImmutableSetting *)&v13 isEqual:v6])
      && (int64_t v7 = [(HMBoundedIntegerSetting *)self integerValue],
          v7 == [(HMBoundedIntegerSetting *)v6 integerValue])
      && (int64_t v8 = [(HMBoundedIntegerSetting *)self maxValue],
          v8 == [(HMBoundedIntegerSetting *)v6 maxValue])
      && (int64_t v9 = [(HMBoundedIntegerSetting *)self minValue],
          v9 == [(HMBoundedIntegerSetting *)v6 minValue]))
    {
      int64_t v10 = [(HMBoundedIntegerSetting *)self valueStepSize];
      BOOL v11 = v10 == [(HMBoundedIntegerSetting *)v6 valueStepSize];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  return v11;
}

- (id)attributeDescriptions
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)HMBoundedIntegerSetting;
  v17 = [(HMImmutableSetting *)&v19 attributeDescriptions];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v18 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMBoundedIntegerSetting integerValue](self, "integerValue"));
  v4 = (void *)[v3 initWithName:@"integerValue" value:v18];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMBoundedIntegerSetting maxValue](self, "maxValue"));
  int64_t v7 = (void *)[v5 initWithName:@"maxValue" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x1E4F653F8]);
  int64_t v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMBoundedIntegerSetting minValue](self, "minValue"));
  int64_t v10 = (void *)[v8 initWithName:@"minValue" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x1E4F653F8]);
  v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMBoundedIntegerSetting valueStepSize](self, "valueStepSize"));
  objc_super v13 = (void *)[v11 initWithName:@"valueStepSize" value:v12];
  v20[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  v15 = [v17 arrayByAddingObjectsFromArray:v14];

  return v15;
}

- (HMBoundedIntegerSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v27 = 0;
  uint64_t v10 = objc_msgSend(v9, "hmf_integerForKey:error:", @"HMImmutableSettingValuePayloadKey", &v27);
  id v11 = v27;
  id v26 = v11;
  uint64_t v12 = objc_msgSend(v9, "hmf_integerForKey:error:", @"HMBoundedIntegerSettingMaxValuePayloadKey", &v26);
  id v13 = v26;

  id v25 = v13;
  uint64_t v14 = objc_msgSend(v9, "hmf_integerForKey:error:", @"HMBoundedIntegerSettingMinValuePayloadKey", &v25);
  id v15 = v25;

  id v24 = v15;
  uint64_t v16 = objc_msgSend(v9, "hmf_integerForKey:error:", @"HMBoundedIntegerSettingValueStepSizePayloadKey", &v24);
  id v17 = v24;

  if (v17)
  {
    v18 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v19 = self;
    v20 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v29 = v21;
      __int16 v30 = 2112;
      id v31 = v9;
      __int16 v32 = 2112;
      id v33 = v17;
      _os_log_impl(&dword_19D1A8000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode bounded integer setting due to invalid payload: %@ error: %@", buf, 0x20u);
    }
    v22 = 0;
  }
  else
  {
    objc_super v19 = [(HMBoundedIntegerSetting *)self initWithKeyPath:v8 readOnly:v6 integerValue:v10 maxValue:v12 minValue:v14 valueStepSize:v16];
    v22 = v19;
  }

  return v22;
}

- (id)payloadCopy
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)HMBoundedIntegerSetting;
  id v3 = [(HMImmutableSetting *)&v12 payloadCopy];
  v4 = (void *)[v3 mutableCopy];

  v14[0] = &unk_1EEF07A88;
  v13[0] = @"HMImmutableSettingTypePayloadKey";
  v13[1] = @"HMImmutableSettingValuePayloadKey";
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMBoundedIntegerSetting integerValue](self, "integerValue"));
  v14[1] = v5;
  v13[2] = @"HMBoundedIntegerSettingMaxValuePayloadKey";
  BOOL v6 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMBoundedIntegerSetting maxValue](self, "maxValue"));
  v14[2] = v6;
  v13[3] = @"HMBoundedIntegerSettingMinValuePayloadKey";
  int64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMBoundedIntegerSetting minValue](self, "minValue"));
  v14[3] = v7;
  v13[4] = @"HMBoundedIntegerSettingValueStepSizePayloadKey";
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMBoundedIntegerSetting valueStepSize](self, "valueStepSize"));
  v14[4] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];
  [v4 addEntriesFromDictionary:v9];

  uint64_t v10 = (void *)[v4 copy];

  return v10;
}

- (id)protoPayload
{
  v17.receiver = self;
  v17.super_class = (Class)HMBoundedIntegerSetting;
  id v3 = [(HMImmutableSetting *)&v17 protoPayload];
  v4 = objc_alloc_init(HMImmutableSettingsProtoBoundedIntegerSettingEvent);
  [v3 setBoundedIntegerSetting:v4];

  int64_t v5 = [(HMBoundedIntegerSetting *)self minValue];
  BOOL v6 = [v3 boundedIntegerSetting];
  [v6 setMinValue:v5];

  int64_t v7 = [(HMBoundedIntegerSetting *)self maxValue];
  id v8 = [v3 boundedIntegerSetting];
  [v8 setMaxValue:v7];

  int64_t v9 = [(HMBoundedIntegerSetting *)self valueStepSize];
  uint64_t v10 = [v3 boundedIntegerSetting];
  [v10 setStepValue:v9];

  id v11 = objc_alloc_init(HMImmutableSettingsProtoIntegerValueEvent);
  objc_super v12 = [v3 boundedIntegerSetting];
  [v12 setValue:v11];

  int64_t v13 = [(HMBoundedIntegerSetting *)self integerValue];
  uint64_t v14 = [v3 boundedIntegerSetting];
  id v15 = [v14 value];
  [v15 setValue:v13];

  return v3;
}

- (HMBoundedIntegerSetting)initWithProtoPayload:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 hasKeyPath] & 1) == 0)
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v19 = self;
    v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v23;
    __int16 v30 = 2112;
    id v31 = v4;
    id v24 = "%{public}@Failed to decode setting missing keyPath: %@";
LABEL_17:
    _os_log_impl(&dword_19D1A8000, v22, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);

    goto LABEL_18;
  }
  if (([v4 hasReadOnly] & 1) == 0)
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v19 = self;
    v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v23;
    __int16 v30 = 2112;
    id v31 = v4;
    id v24 = "%{public}@Failed to decode setting missing readOnly: %@";
    goto LABEL_17;
  }
  if (![v4 hasBoundedIntegerSetting]) {
    goto LABEL_15;
  }
  int64_t v5 = [v4 boundedIntegerSetting];
  if (![v5 hasMinValue]) {
    goto LABEL_14;
  }
  BOOL v6 = [v4 boundedIntegerSetting];
  if (([v6 hasMaxValue] & 1) == 0)
  {

LABEL_14:
LABEL_15:
    v21 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v19 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v29 = v23;
      __int16 v30 = 2112;
      id v31 = v4;
      id v24 = "%{public}@Failed to decode setting missing integer setting required attributes: %@";
      goto LABEL_17;
    }
LABEL_18:

    v20 = 0;
    goto LABEL_19;
  }
  int64_t v7 = [v4 boundedIntegerSetting];
  char v8 = [v7 hasStepValue];

  if ((v8 & 1) == 0) {
    goto LABEL_15;
  }
  int64_t v9 = [v4 boundedIntegerSetting];
  char v10 = [v9 hasValue];

  if ((v10 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x19F3A64A0]();
    objc_super v19 = self;
    v22 = HMFGetOSLogHandle();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    v23 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v29 = v23;
    __int16 v30 = 2112;
    id v31 = v4;
    id v24 = "%{public}@Failed to decode setting missing integer value: %@";
    goto LABEL_17;
  }
  id v11 = [v4 keyPath];
  unsigned int v26 = [v4 readOnly];
  id v27 = [v4 boundedIntegerSetting];
  objc_super v12 = [v27 value];
  uint64_t v13 = [v12 value];
  uint64_t v14 = [v4 boundedIntegerSetting];
  uint64_t v15 = [v14 maxValue];
  uint64_t v16 = [v4 boundedIntegerSetting];
  uint64_t v17 = [v16 minValue];
  v18 = [v4 boundedIntegerSetting];
  objc_super v19 = -[HMBoundedIntegerSetting initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:](self, "initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:", v11, v26, v13, v15, v17, [v18 stepValue]);

  v20 = v19;
LABEL_19:

  return v20;
}

- (id)settingValue
{
  v2 = [[HMSettingIntegerValue alloc] initWithIntegerValue:[(HMBoundedIntegerSetting *)self integerValue]];

  return v2;
}

- (HMBoundedIntegerSetting)settingWithSettingValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v5 = v4;
  }
  else {
    int64_t v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    int64_t v7 = [HMBoundedIntegerSetting alloc];
    char v8 = [(HMImmutableSetting *)self keyPath];
    int64_t v9 = -[HMBoundedIntegerSetting initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:](v7, "initWithKeyPath:readOnly:integerValue:maxValue:minValue:valueStepSize:", v8, -[HMImmutableSetting isReadOnly](self, "isReadOnly"), [v6 integerValue], -[HMBoundedIntegerSetting maxValue](self, "maxValue"), -[HMBoundedIntegerSetting minValue](self, "minValue"), -[HMBoundedIntegerSetting valueStepSize](self, "valueStepSize"));
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (HMBoundedIntegerSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 integerValue:(int64_t)a5 maxValue:(int64_t)a6 minValue:(int64_t)a7 valueStepSize:(int64_t)a8
{
  v13.receiver = self;
  v13.super_class = (Class)HMBoundedIntegerSetting;
  result = [(HMImmutableSetting *)&v13 initWithKeyPath:a3 readOnly:a4];
  if (result)
  {
    result->_integerValue = a5;
    result->_maxValue = a6;
    result->_minValue = a7;
    result->_valueStepSize = a8;
  }
  return result;
}

@end