@interface HMDPersonModel
+ (NSUUID)sentinelParentUUID;
+ (id)hmbProperties;
- (HMDPersonModel)initWithPerson:(id)a3;
- (NSSet)personLinks;
- (id)createPerson;
- (void)setPersonLinks:(id)a3;
@end

@implementation HMDPersonModel

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_149996 != -1) {
    dispatch_once(&sentinelParentUUID_onceToken_149996, &__block_literal_global_10_149997);
  }
  v2 = (void *)sentinelParentUUID_sentinelParentUUID_149998;
  return (NSUUID *)v2;
}

void __36__HMDPersonModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"0F42F4A3-0819-4FE2-AF6C-498767A95771"];
  v1 = (void *)sentinelParentUUID_sentinelParentUUID_149998;
  sentinelParentUUID_sentinelParentUUID_149998 = v0;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_150004 != -1) {
    dispatch_once(&hmbProperties_onceToken_150004, &__block_literal_global_150005);
  }
  v2 = (void *)hmbProperties_properties_150006;
  return v2;
}

void __31__HMDPersonModel_hmbProperties__block_invoke()
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F49310] fieldWithClass:objc_opt_class()];
  v1 = (void *)[v0 mutableCopy];

  [v1 setLoggingVisibility:1];
  v6[0] = @"name";
  v2 = (void *)[v1 copy];
  v6[1] = @"personLinksData";
  v7[0] = v2;
  v3 = [MEMORY[0x263F492C0] fieldWithClass:objc_opt_class()];
  v7[1] = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  v5 = (void *)hmbProperties_properties_150006;
  hmbProperties_properties_150006 = v4;
}

- (id)createPerson
{
  id v3 = objc_alloc(MEMORY[0x263F0E5C0]);
  uint64_t v4 = [(HMBModel *)self hmbModelID];
  v5 = (void *)[v3 initWithUUID:v4];

  v6 = [(HMDPersonModel *)self name];
  [v5 setName:v6];

  v7 = [(HMDPersonModel *)self personLinks];
  [v5 setPersonLinks:v7];

  v8 = (void *)[v5 copy];
  return v8;
}

- (HMDPersonModel)initWithPerson:(id)a3
{
  id v4 = a3;
  v5 = [v4 UUID];
  v6 = [(id)objc_opt_class() sentinelParentUUID];
  v7 = [(HMBModel *)self initWithModelID:v5 parentModelID:v6];

  v8 = [v4 name];
  [(HMDPersonModel *)v7 setName:v8];

  v9 = [v4 personLinks];

  [(HMDPersonModel *)v7 setPersonLinks:v9];
  return v7;
}

- (void)setPersonLinks:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v11 = 0;
  v5 = [MEMORY[0x263F08910] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v11];
  id v6 = v11;
  if (v5)
  {
    [(HMDPersonModel *)self setPersonLinksData:v5];
  }
  else
  {
    v7 = (void *)MEMORY[0x230FBD990]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_22F52A000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to encode person links: %@", buf, 0x16u);
    }
  }
}

- (NSSet)personLinks
{
  v22[2] = *MEMORY[0x263EF8340];
  id v3 = [(HMDPersonModel *)self personLinksData];
  if (v3)
  {
    id v4 = (void *)MEMORY[0x263F08928];
    v5 = (void *)MEMORY[0x263EFFA08];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:2];
    v7 = [v5 setWithArray:v6];
    id v17 = 0;
    v8 = [v4 unarchivedObjectOfClasses:v7 fromData:v3 error:&v17];
    id v9 = v17;

    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      v12 = (void *)MEMORY[0x230FBD990]();
      v13 = self;
      __int16 v14 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v19 = v15;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode person links: %@", buf, 0x16u);
      }
      id v10 = [MEMORY[0x263EFFA08] set];
    }
    id v11 = v10;
  }
  else
  {
    id v11 = [MEMORY[0x263EFFA08] set];
  }

  return (NSSet *)v11;
}

@end