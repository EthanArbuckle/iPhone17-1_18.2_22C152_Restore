@interface HMSiriEndpointDeleteSiriHistoryMessagePayload
+ (NSString)messageName;
+ (id)logCategory;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMSiriEndpointDeleteSiriHistoryMessagePayload)initWithAccessoryUUID:(id)a3;
- (HMSiriEndpointDeleteSiriHistoryMessagePayload)initWithPayload:(id)a3;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSUUID)accessoryUUID;
- (id)payloadCopy;
- (unint64_t)hash;
@end

@implementation HMSiriEndpointDeleteSiriHistoryMessagePayload

- (void).cxx_destruct
{
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMSiriEndpointDeleteSiriHistoryMessagePayload *)self accessoryUUID];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMSiriEndpointDeleteSiriHistoryMessagePayload *)a3;
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
      v7 = [(HMSiriEndpointDeleteSiriHistoryMessagePayload *)self accessoryUUID];
      v8 = [(HMSiriEndpointDeleteSiriHistoryMessagePayload *)v6 accessoryUUID];
      char v9 = objc_msgSend(v7, "hmf_isEqualToUUID:", v8);
    }
    else
    {
      char v9 = 0;
    }
  }
  return v9;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSArray)attributeDescriptions
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = [(HMSiriEndpointDeleteSiriHistoryMessagePayload *)self accessoryUUID];
  v5 = (void *)[v3 initWithName:@"accessoryUUID" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

  return (NSArray *)v6;
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMSiriEndpointDeleteSiriHistoryMessagePayload)initWithPayload:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(v4, "hmf_UUIDForKey:", @"HMAccessoryUUIDPayloadKey");
  if (v5)
  {
    v6 = [(HMSiriEndpointDeleteSiriHistoryMessagePayload *)self initWithAccessoryUUID:v5];
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x19F3A64A0]();
    v6 = self;
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to decode delete siri history payload: %@", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (id)payloadCopy
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v6 = @"HMAccessoryUUIDPayloadKey";
  v2 = [(HMSiriEndpointDeleteSiriHistoryMessagePayload *)self accessoryUUID];
  id v3 = [v2 UUIDString];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];

  return v4;
}

- (HMSiriEndpointDeleteSiriHistoryMessagePayload)initWithAccessoryUUID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMSiriEndpointDeleteSiriHistoryMessagePayload;
  v6 = [(HMSiriEndpointDeleteSiriHistoryMessagePayload *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_accessoryUUID, a3);
  }

  return v7;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_20084 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_20084, &__block_literal_global_20085);
  }
  v2 = (void *)logCategory__hmf_once_v2_20086;

  return v2;
}

uint64_t __60__HMSiriEndpointDeleteSiriHistoryMessagePayload_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v2_20086;
  logCategory__hmf_once_v2_20086 = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (NSString)messageName
{
  return (NSString *)@"HMSiriEndpointDeleteSiriHistoryMessage";
}

@end