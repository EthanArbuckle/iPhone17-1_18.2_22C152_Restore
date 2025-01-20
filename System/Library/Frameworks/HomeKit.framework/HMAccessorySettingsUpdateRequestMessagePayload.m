@interface HMAccessorySettingsUpdateRequestMessagePayload
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessorySettingsUpdateRequestMessagePayload)initWithAccessoryUUID:(id)a3 keyPath:(id)a4 settingValue:(id)a5;
- (HMAccessorySettingsUpdateRequestMessagePayload)initWithPayload:(id)a3;
- (HMImmutableSettingValue)settingValue;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)keyPath;
- (NSString)shortDescription;
- (NSUUID)accessoryUUID;
- (id)payloadCopy;
- (unint64_t)hash;
@end

@implementation HMAccessorySettingsUpdateRequestMessagePayload

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingValue, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);

  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

- (HMImmutableSettingValue)settingValue
{
  return (HMImmutableSettingValue *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMAccessorySettingsUpdateRequestMessagePayload *)self accessoryUUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMAccessorySettingsUpdateRequestMessagePayload *)a3;
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
      v7 = [(HMAccessorySettingsUpdateRequestMessagePayload *)self accessoryUUID];
      v8 = [(HMAccessorySettingsUpdateRequestMessagePayload *)v6 accessoryUUID];
      if (objc_msgSend(v7, "hmf_isEqualToUUID:", v8))
      {
        v9 = [(HMAccessorySettingsUpdateRequestMessagePayload *)self keyPath];
        v10 = [(HMAccessorySettingsUpdateRequestMessagePayload *)v6 keyPath];
        if ([v9 isEqual:v10])
        {
          v11 = [(HMAccessorySettingsUpdateRequestMessagePayload *)self settingValue];
          v12 = [(HMAccessorySettingsUpdateRequestMessagePayload *)v6 settingValue];
          char v13 = [v11 isEqual:v12];
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

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSArray)attributeDescriptions
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMAccessorySettingsUpdateRequestMessagePayload *)self keyPath];
  v5 = (void *)[v3 initWithName:@"keyPath" value:v4];
  id v6 = objc_alloc(MEMORY[0x1E4F653F8]);
  v7 = [(HMAccessorySettingsUpdateRequestMessagePayload *)self accessoryUUID];
  v8 = (void *)[v6 initWithName:@"accessoryUUID" value:v7];
  v14[1] = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMAccessorySettingsUpdateRequestMessagePayload *)self settingValue];
  v11 = (void *)[v9 initWithName:@"settingValue" value:v10];
  v14[2] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];

  return (NSArray *)v12;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (id)payloadCopy
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v10[0] = @"HMAccessoryUUIDPayloadKey";
  id v3 = [(HMAccessorySettingsUpdateRequestMessagePayload *)self accessoryUUID];
  v4 = [v3 UUIDString];
  v11[0] = v4;
  v10[1] = @"HMImmutableSettingKeyPathPayloadKey";
  v5 = [(HMAccessorySettingsUpdateRequestMessagePayload *)self keyPath];
  v11[1] = v5;
  v10[2] = @"HMImmutableSettingValuePayloadKey";
  id v6 = [(HMAccessorySettingsUpdateRequestMessagePayload *)self settingValue];
  v7 = [v6 payloadCopy];
  v11[2] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

- (HMAccessorySettingsUpdateRequestMessagePayload)initWithPayload:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_UUIDForKey:", @"HMAccessoryUUIDPayloadKey");
  id v6 = objc_msgSend(v4, "hmf_stringForKey:", @"HMImmutableSettingKeyPathPayloadKey");
  uint64_t v7 = objc_msgSend(v4, "hmf_dictionaryForKey:", @"HMImmutableSettingValuePayloadKey");
  v8 = (void *)v7;
  if (v5 && v6 && v7)
  {
    id v9 = [[HMImmutableSettingValue alloc] initWithPayload:v7];
    if (v9)
    {
      v10 = [(HMAccessorySettingsUpdateRequestMessagePayload *)self initWithAccessoryUUID:v5 keyPath:v6 settingValue:v9];
      v11 = v10;
    }
    else
    {
      v15 = (void *)MEMORY[0x19F3A64A0]();
      v10 = self;
      v16 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = HMFGetLogIdentifier();
        int v19 = 138543618;
        v20 = v17;
        __int16 v21 = 2112;
        id v22 = v8;
        _os_log_impl(&dword_19D1A8000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings update request message due to invalid setting value payload: %@", (uint8_t *)&v19, 0x16u);
      }
      v11 = 0;
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x19F3A64A0]();
    v10 = self;
    char v13 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = HMFGetLogIdentifier();
      int v19 = 138543618;
      v20 = v14;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_19D1A8000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode accessory settings update request message payload: %@", (uint8_t *)&v19, 0x16u);
    }
    v11 = 0;
  }

  return v11;
}

- (HMAccessorySettingsUpdateRequestMessagePayload)initWithAccessoryUUID:(id)a3 keyPath:(id)a4 settingValue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v16 = (void *)_HMFPreconditionFailure();
    return (HMAccessorySettingsUpdateRequestMessagePayload *)+[HMAccessorySettingsUpdateRequestMessagePayload logCategory];
  }
  v18.receiver = self;
  v18.super_class = (Class)HMAccessorySettingsUpdateRequestMessagePayload;
  char v13 = [(HMAccessorySettingsUpdateRequestMessagePayload *)&v18 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accessoryUUID, a3);
    objc_storeStrong((id *)&v14->_keyPath, a4);
    objc_storeStrong((id *)&v14->_settingValue, a5);
  }

  return v14;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_31647 != -1) {
    dispatch_once(&logCategory__hmf_once_t2_31647, &__block_literal_global_31648);
  }
  v2 = (void *)logCategory__hmf_once_v3_31649;

  return v2;
}

uint64_t __61__HMAccessorySettingsUpdateRequestMessagePayload_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v3_31649;
  logCategory__hmf_once_v3_31649 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end