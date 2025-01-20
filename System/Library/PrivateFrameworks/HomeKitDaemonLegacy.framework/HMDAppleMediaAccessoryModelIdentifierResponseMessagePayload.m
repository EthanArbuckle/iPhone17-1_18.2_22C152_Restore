@interface HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload)initWithModelIdentifier:(id)a3;
- (HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload)initWithPayload:(id)a3;
- (NSUUID)modelIdentifier;
- (id)attributeDescriptions;
- (id)payloadCopy;
- (unint64_t)hash;
@end

@implementation HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload

- (void).cxx_destruct
{
}

- (NSUUID)modelIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)self modelIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)a3;
  if (v4 == self)
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
      v7 = [(HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)self modelIdentifier];
      v8 = [(HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)v6 modelIdentifier];
      char v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);
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
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)self modelIdentifier];
  v5 = (void *)[v3 initWithName:@"modelIdentifier" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)payloadCopy
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F2C878];
  v2 = [(HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)self modelIdentifier];
  id v3 = [v2 UUIDString];
  v7[0] = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload)initWithPayload:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_UUIDForKey:", *MEMORY[0x1E4F2C878]);
  if (v5)
  {
    uint64_t v6 = [(HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)self initWithModelIdentifier:v5];
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x1D9452090]();
    uint64_t v6 = self;
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive message due to no model identifier in payload: %@", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload)initWithModelIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload;
    v7 = [(HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)&v12 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_modelIdentifier, a3);
    }

    return v8;
  }
  else
  {
    v10 = (void *)_HMFPreconditionFailure();
    return (HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload *)+[HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_51406 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_51406, &__block_literal_global_51407);
  }
  v2 = (void *)logCategory__hmf_once_v2_51408;
  return v2;
}

uint64_t __74__HMDAppleMediaAccessoryModelIdentifierResponseMessagePayload_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_51408;
  logCategory__hmf_once_v2_51408 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end