@interface HMDMediaSystemModel
+ (id)properties;
+ (id)schemaHashRoot;
- (id)dependentUUIDs;
@end

@implementation HMDMediaSystemModel

- (id)dependentUUIDs
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9C0] set];
  v4 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v4)
  {
    v5 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v3 addObject:v5];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v6 = [(HMDMediaSystemModel *)self mediaSystemComponents];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v26;
    *(void *)&long long v8 = 138543618;
    long long v22 = v8;
    uint64_t v23 = *(void *)v26;
    do
    {
      uint64_t v11 = 0;
      uint64_t v24 = v9;
      do
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "hmf_UUIDForKey:", @"kAccessoryUUID", v22);
        if (v13)
        {
          [v3 addObject:v13];
        }
        else
        {
          v14 = (void *)MEMORY[0x230FBD990]();
          v15 = self;
          v16 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v17 = v6;
            v18 = self;
            v20 = v19 = v3;
            *(_DWORD *)buf = v22;
            v30 = v20;
            __int16 v31 = 2112;
            v32 = v12;
            _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_INFO, "%{public}@Accessory UUID is nil for media component: %@", buf, 0x16u);

            v3 = v19;
            self = v18;
            v6 = v17;
            uint64_t v10 = v23;
          }

          uint64_t v9 = v24;
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
    }
    while (v9);
  }

  return v3;
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__HMDMediaSystemModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_141323 != -1) {
    dispatch_once(&properties_onceToken_141323, block);
  }
  v2 = (void *)properties__properties_141324;
  return v2;
}

void __33__HMDMediaSystemModel_properties__block_invoke(uint64_t a1)
{
  v12[3] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDMediaSystemModel;
  v2 = objc_msgSendSuper2(&v10, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_141324;
  properties__properties_141324 = v3;

  v5 = (void *)properties__properties_141324;
  v11[0] = @"name";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[0] = v6;
  v11[1] = @"configuredName";
  uint64_t v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[1] = v7;
  v11[2] = @"mediaSystemComponents";
  long long v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v12[2] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v5 addEntriesFromDictionary:v9];
}

+ (id)schemaHashRoot
{
  v2 = (void *)[@"12903D5D-7E96-48C1-AD0D-BC4431A81FD1" copy];
  return v2;
}

@end