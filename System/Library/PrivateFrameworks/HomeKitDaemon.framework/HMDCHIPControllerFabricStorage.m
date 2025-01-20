@interface HMDCHIPControllerFabricStorage
+ (id)logCategory;
- (BOOL)isEqual:(id)a3;
- (BOOL)updateUsingHomeModel:(id)a3;
- (NSDictionary)debugDictionaryRepresentation;
- (NSDictionary)keyValueStore;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)logIdentifier;
- (unint64_t)hash;
- (void)setKeyValueStore:(id)a3;
- (void)updateHomeModel:(id)a3;
@end

@implementation HMDCHIPControllerFabricStorage

- (void).cxx_destruct
{
}

- (void)setKeyValueStore:(id)a3
{
}

- (NSDictionary)keyValueStore
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(HMDCHIPControllerFabricStorage *)self keyValueStore];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F424F8]);
    v7 = NSNumber;
    v8 = [(HMDCHIPControllerFabricStorage *)self keyValueStore];
    v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v10 = (void *)[v6 initWithName:@"Key-Value Store Count" value:v9];
    [v3 addObject:v10];
  }
  v11 = (void *)[v3 copy];

  return v11;
}

- (id)logIdentifier
{
  v2 = NSString;
  v3 = [(HMDCHIPControllerFabricStorage *)self keyValueStore];
  v4 = objc_msgSend(v2, "stringWithFormat:", @"%zu", objc_msgSend(v3, "count"));

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[HMDCHIPControllerFabricStorage allocWithZone:a3] init];
  uint64_t v5 = [(HMDCHIPControllerFabricStorage *)self keyValueStore];
  [(HMDCHIPControllerFabricStorage *)v4 setKeyValueStore:v5];

  return v4;
}

- (unint64_t)hash
{
  v2 = [(HMDCHIPControllerFabricStorage *)self keyValueStore];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMDCHIPControllerFabricStorage *)self keyValueStore];
    v8 = [v6 keyValueStore];
    char v9 = HMFEqualObjects();
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (void)updateHomeModel:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    int v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Not implemented", (uint8_t *)&v9, 0xCu);
  }
}

- (BOOL)updateUsingHomeModel:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x230FBD990]();
  id v6 = self;
  v7 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = HMFGetLogIdentifier();
    int v10 = 138543362;
    uint64_t v11 = v8;
    _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_ERROR, "%{public}@Not implemented", (uint8_t *)&v10, 0xCu);
  }

  return 0;
}

- (NSDictionary)debugDictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = [(HMDCHIPControllerFabricStorage *)self keyValueStore];
  [v3 setObject:v4 forKeyedSubscript:@"Key-Value Store"];

  uint64_t v5 = (void *)[v3 copy];
  return (NSDictionary *)v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_268061 != -1) {
    dispatch_once(&logCategory__hmf_once_t3_268061, &__block_literal_global_268062);
  }
  v2 = (void *)logCategory__hmf_once_v4_268063;
  return v2;
}

void __45__HMDCHIPControllerFabricStorage_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v4_268063;
  logCategory__hmf_once_v4_268063 = v0;
}

@end