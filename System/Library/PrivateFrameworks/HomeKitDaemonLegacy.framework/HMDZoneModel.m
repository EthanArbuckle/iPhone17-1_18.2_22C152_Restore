@interface HMDZoneModel
+ (id)properties;
- (id)dependentUUIDs;
@end

@implementation HMDZoneModel

- (id)dependentUUIDs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA80];
  v4 = [(HMDZoneModel *)self roomUUIDs];
  v5 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count") + 1);

  v6 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v6)
  {
    v7 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v5 addObject:v7];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = [(HMDZoneModel *)self roomUUIDs];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v5 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

+ (id)properties
{
  if (properties_onceToken_68273 != -1) {
    dispatch_once(&properties_onceToken_68273, &__block_literal_global_68274);
  }
  v2 = (void *)properties__properties_68275;
  return v2;
}

void __26__HMDZoneModel_properties__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"name";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[1] = @"roomUUIDs";
  v5[0] = v0;
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)properties__properties_68275;
  properties__properties_68275 = v2;
}

@end