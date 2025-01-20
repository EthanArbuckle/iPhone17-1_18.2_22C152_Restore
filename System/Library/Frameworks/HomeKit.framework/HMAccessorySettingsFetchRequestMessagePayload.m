@interface HMAccessorySettingsFetchRequestMessagePayload
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessorySettingsFetchRequestMessagePayload)initWithAccessoryUUID:(id)a3 keyPaths:(id)a4;
- (HMAccessorySettingsFetchRequestMessagePayload)initWithPayload:(id)a3;
- (NSArray)attributeDescriptions;
- (NSArray)keyPaths;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)accessoryUUID;
- (id)payloadCopy;
- (unint64_t)hash;
@end

@implementation HMAccessorySettingsFetchRequestMessagePayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPaths, 0);

  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (NSArray)keyPaths
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMAccessorySettingsFetchRequestMessagePayload *)self accessoryUUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMAccessorySettingsFetchRequestMessagePayload *)a3;
  if (v4 == self)
  {
    char v13 = 1;
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
      v7 = [(HMAccessorySettingsFetchRequestMessagePayload *)self accessoryUUID];
      v8 = [(HMAccessorySettingsFetchRequestMessagePayload *)v6 accessoryUUID];
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        v9 = [(HMAccessorySettingsFetchRequestMessagePayload *)self keyPaths];
        uint64_t v10 = [v9 count];
        v11 = [(HMAccessorySettingsFetchRequestMessagePayload *)v6 keyPaths];
        if (v10 == [v11 count])
        {
          v12 = [(HMAccessorySettingsFetchRequestMessagePayload *)self keyPaths];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __57__HMAccessorySettingsFetchRequestMessagePayload_isEqual___block_invoke;
          v15[3] = &unk_1E593FE78;
          v16 = v6;
          char v13 = objc_msgSend(v12, "na_allObjectsPassTest:", v15);
        }
        else
        {
          char v13 = 0;
        }
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }
  return v13;
}

uint64_t __57__HMAccessorySettingsFetchRequestMessagePayload_isEqual___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 keyPaths];
  uint64_t v5 = [v4 containsObject:v3];

  return v5;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSArray)attributeDescriptions
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessorySettingsFetchRequestMessagePayload *)self accessoryUUID];
  uint64_t v5 = (void *)[v3 initWithName:@"accessoryUUID" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessorySettingsFetchRequestMessagePayload *)self keyPaths];
  v8 = (void *)[v6 initWithName:@"keyPaths" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

  return (NSArray *)v9;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)payloadCopy
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"HMAccessoryUUIDPayloadKey";
  id v3 = [(HMAccessorySettingsFetchRequestMessagePayload *)self accessoryUUID];
  v4 = [v3 UUIDString];
  v8[1] = @"HMImmutableSettingKeyPathsPayloadKey";
  v9[0] = v4;
  uint64_t v5 = [(HMAccessorySettingsFetchRequestMessagePayload *)self keyPaths];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

- (HMAccessorySettingsFetchRequestMessagePayload)initWithPayload:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmf_UUIDForKey:", @"HMAccessoryUUIDPayloadKey");
  uint64_t v6 = objc_msgSend(v4, "hmf_arrayForKey:", @"HMImmutableSettingKeyPathsPayloadKey");
  v7 = (void *)v6;
  if (v5 && v6)
  {
    v8 = [(HMAccessorySettingsFetchRequestMessagePayload *)self initWithAccessoryUUID:v5 keyPaths:v6];
    v9 = v8;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x19F3A64A0]();
    v8 = self;
    v11 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = HMFGetLogIdentifier();
      int v14 = 138543618;
      v15 = v12;
      __int16 v16 = 2112;
      id v17 = v4;
      _os_log_impl(&dword_19D1A8000, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings fetch request message payload: %@", (uint8_t *)&v14, 0x16u);
    }
    v9 = 0;
  }

  return v9;
}

- (HMAccessorySettingsFetchRequestMessagePayload)initWithAccessoryUUID:(id)a3 keyPaths:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    char v13 = (void *)_HMFPreconditionFailure();
    return (HMAccessorySettingsFetchRequestMessagePayload *)+[HMAccessorySettingsFetchRequestMessagePayload logCategory];
  }
  v15.receiver = self;
  v15.super_class = (Class)HMAccessorySettingsFetchRequestMessagePayload;
  uint64_t v10 = [(HMAccessorySettingsFetchRequestMessagePayload *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accessoryUUID, a3);
    objc_storeStrong((id *)&v11->_keyPaths, a4);
  }

  return v11;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_18161 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_18161, &__block_literal_global_18162);
  }
  v2 = (void *)logCategory__hmf_once_v2_18163;

  return v2;
}

uint64_t __60__HMAccessorySettingsFetchRequestMessagePayload_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_18163;
  logCategory__hmf_once_v2_18163 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end