@interface HMDAssistantAccessControlModel
+ (id)properties;
- (id)dependentUUIDs;
@end

@implementation HMDAssistantAccessControlModel

- (id)dependentUUIDs
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)HMDAssistantAccessControlModel;
  v3 = [(HMDBackingStoreModelObject *)&v27 dependentUUIDs];
  v4 = (void *)[v3 mutableCopy];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = [(HMDAssistantAccessControlModel *)self accessoryModelIDs];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v7);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v11 = [(HMDAssistantAccessControlModel *)self siriEndpointAccessoryModelUUIDs];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:*(void *)(*((void *)&v19 + 1) + 8 * j)];
        if (v16) {
          [v4 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v13);
  }

  v17 = (void *)[v4 copy];
  return v17;
}

+ (id)properties
{
  if (properties_onceToken_177331 != -1) {
    dispatch_once(&properties_onceToken_177331, &__block_literal_global_224_177332);
  }
  v2 = (void *)properties__properties_177333;
  return v2;
}

void __44__HMDAssistantAccessControlModel_properties__block_invoke()
{
  v9[6] = *MEMORY[0x1E4F143B8];
  v8[0] = @"enabled";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[0] = v0;
  v8[1] = @"options";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[1] = v1;
  v8[2] = @"activityNotificationsEnabledForPersonalRequests";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[2] = v2;
  v8[3] = @"accessoryModelIDs";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[3] = v3;
  v8[4] = @"siriEndpointAccessoryModelUUIDs";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[4] = v4;
  v8[5] = @"changeTag";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[5] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:6];
  uint64_t v7 = (void *)properties__properties_177333;
  properties__properties_177333 = v6;
}

@end