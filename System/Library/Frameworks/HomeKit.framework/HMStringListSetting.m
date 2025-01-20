@interface HMStringListSetting
- (BOOL)isEqual:(id)a3;
- (HMStringListSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5;
- (HMStringListSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 stringListValue:(id)a5;
- (NSArray)stringListValue;
- (id)attributeDescriptions;
- (id)payloadCopy;
@end

@implementation HMStringListSetting

- (void).cxx_destruct
{
}

- (NSArray)stringListValue
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMStringListSetting *)a3;
  if (self == v4)
  {
    char v11 = 1;
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
      && (v15.receiver = self,
          v15.super_class = (Class)HMStringListSetting,
          [(HMImmutableSetting *)&v15 isEqual:v6]))
    {
      v7 = [(HMStringListSetting *)self stringListValue];
      uint64_t v8 = [v7 count];
      v9 = [(HMStringListSetting *)v6 stringListValue];
      if (v8 == [v9 count])
      {
        v10 = [(HMStringListSetting *)self stringListValue];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __31__HMStringListSetting_isEqual___block_invoke;
        v13[3] = &unk_1E593FE78;
        v14 = v6;
        char v11 = objc_msgSend(v10, "na_allObjectsPassTest:", v13);
      }
      else
      {
        char v11 = 0;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  return v11;
}

uint64_t __31__HMStringListSetting_isEqual___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 stringListValue];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (id)attributeDescriptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)HMStringListSetting;
  id v3 = [(HMImmutableSetting *)&v10 attributeDescriptions];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  uint64_t v5 = [(HMStringListSetting *)self stringListValue];
  v6 = (void *)[v4 initWithName:@"stringListValue" value:v5];
  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  uint64_t v8 = [v3 arrayByAddingObjectsFromArray:v7];

  return v8;
}

- (HMStringListSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 payload:(id)a5
{
  BOOL v6 = a4;
  v24[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = (void *)MEMORY[0x1E4F1CAD0];
  v24[0] = objc_opt_class();
  char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  v12 = [v10 setWithArray:v11];
  v13 = objc_msgSend(v9, "hmf_arrayForKey:ofClasses:", @"HMImmutableSettingValuePayloadKey", v12);

  if (v13)
  {
    v14 = [(HMStringListSetting *)self initWithKeyPath:v8 readOnly:v6 stringListValue:v13];
    objc_super v15 = v14;
  }
  else
  {
    v16 = (void *)MEMORY[0x19F3A64A0]();
    v14 = self;
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v20 = 138543618;
      v21 = v18;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_19D1A8000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode string list setting due to invalid payload: %@", (uint8_t *)&v20, 0x16u);
    }
    objc_super v15 = 0;
  }

  return v15;
}

- (id)payloadCopy
{
  void v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)HMStringListSetting;
  id v3 = [(HMImmutableSetting *)&v9 payloadCopy];
  id v4 = (void *)[v3 mutableCopy];

  v10[0] = @"HMImmutableSettingTypePayloadKey";
  v10[1] = @"HMImmutableSettingValuePayloadKey";
  v11[0] = &unk_1EEF07AD0;
  uint64_t v5 = [(HMStringListSetting *)self stringListValue];
  v11[1] = v5;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v4 addEntriesFromDictionary:v6];

  v7 = (void *)[v4 copy];

  return v7;
}

- (HMStringListSetting)initWithKeyPath:(id)a3 readOnly:(BOOL)a4 stringListValue:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    objc_super v10 = v9;
    v17.receiver = self;
    v17.super_class = (Class)HMStringListSetting;
    char v11 = [(HMImmutableSetting *)&v17 initWithKeyPath:v8 readOnly:v6];
    if (v11)
    {
      uint64_t v12 = [v10 copy];
      stringListValue = v11->_stringListValue;
      v11->_stringListValue = (NSArray *)v12;
    }
    return v11;
  }
  else
  {
    objc_super v15 = (HMAccessoryInfoProtoNetworkServiceEvent *)_HMFPreconditionFailure();
    [(HMAccessoryInfoProtoNetworkServiceEvent *)v15 .cxx_destruct];
  }
  return result;
}

@end