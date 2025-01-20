@interface HMDTriggerModel
+ (id)properties;
- (id)createPayload;
- (id)dependentUUIDs;
@end

@implementation HMDTriggerModel

- (id)dependentUUIDs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA80];
  v4 = [(HMDTriggerModel *)self currentActionSets];
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
  v8 = [(HMDTriggerModel *)self currentActionSets];
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

- (id)createPayload
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(HMDBackingStoreModelObject *)self uuid];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:@"kTriggerUUID"];

  v6 = [(HMDTriggerModel *)self name];
  [v3 setObject:v6 forKeyedSubscript:@"kTriggerName"];

  v7 = [(HMDTriggerModel *)self configuredName];
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F2E1E0]];

  v8 = [(HMDTriggerModel *)self active];
  [v3 setObject:v8 forKeyedSubscript:@"kTriggerActivate"];

  uint64_t v9 = [(HMDTriggerModel *)self autoDelete];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F2E1F0]];

  uint64_t v10 = [(HMDTriggerModel *)self currentActionSets];
  [v3 setObject:v10 forKeyedSubscript:@"kTriggerActionSetUUIDKey"];

  uint64_t v11 = (void *)[v3 copy];
  return v11;
}

+ (id)properties
{
  if (properties_onceToken_618 != -1) {
    dispatch_once(&properties_onceToken_618, &__block_literal_global_376);
  }
  v2 = (void *)properties__properties_619;
  return v2;
}

void __29__HMDTriggerModel_properties__block_invoke()
{
  v11[8] = *MEMORY[0x1E4F143B8];
  v10[0] = @"name";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[0] = v0;
  v10[1] = @"configuredName";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[1] = v1;
  v10[2] = @"currentActionSets";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[2] = v2;
  v10[3] = @"active";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[3] = v3;
  v10[4] = @"mostRecentFireDate";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[4] = v4;
  v10[5] = @"owner";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[5] = v5;
  v10[6] = @"owningDevice";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[6] = v6;
  v10[7] = @"autoDelete";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[7] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:8];
  uint64_t v9 = (void *)properties__properties_619;
  properties__properties_619 = v8;
}

@end