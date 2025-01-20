@interface HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload
+ (NSString)messageName;
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload)initWithAccessoryIdentifier:(id)a3;
- (HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload)initWithPayload:(id)a3;
- (NSString)accessoryIdentifier;
- (id)attributeDescriptions;
- (id)payloadCopy;
- (unint64_t)hash;
@end

@implementation HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload

- (void).cxx_destruct
{
}

- (NSString)accessoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)hash
{
  v2 = [(HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)self accessoryIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)a3;
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
      v7 = [(HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)self accessoryIdentifier];
      v8 = [(HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)v6 accessoryIdentifier];
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
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)self accessoryIdentifier];
  v5 = (void *)[v3 initWithName:@"accessoryIdentifier" value:v4];
  v8[0] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];

  return v6;
}

- (id)payloadCopy
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *MEMORY[0x263F0B440];
  v2 = [(HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)self accessoryIdentifier];
  v6[0] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload)initWithPayload:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "hmf_stringForKey:", *MEMORY[0x263F0B440]);
  if (v5)
  {
    v6 = [(HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)self initWithAccessoryIdentifier:v5];
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x230FBD990]();
    v6 = self;
    char v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = HMFGetLogIdentifier();
      int v12 = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_ERROR, "%{public}@Failed to derive message due to no accessory identifier in payload: %@", (uint8_t *)&v12, 0x16u);
    }
    v7 = 0;
  }

  return v7;
}

- (HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload)initWithAccessoryIdentifier:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = v5;
    v12.receiver = self;
    v12.super_class = (Class)HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload;
    v7 = [(HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)&v12 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_accessoryIdentifier, a3);
    }

    return v8;
  }
  else
  {
    v10 = (void *)_HMFPreconditionFailure();
    return (HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload *)+[HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload logCategory];
  }
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_109363 != -1) {
    dispatch_once(&logCategory__hmf_once_t1_109363, &__block_literal_global_109364);
  }
  v2 = (void *)logCategory__hmf_once_v2_109365;
  return v2;
}

void __73__HMDAppleMediaAccessoryModelIdentifierRequestMessagePayload_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v2_109365;
  logCategory__hmf_once_v2_109365 = v0;
}

+ (NSString)messageName
{
  return (NSString *)@"HMDAppleMediaAccessoryModelIdentiferRequestMessage";
}

@end