@interface HMDHomeNetworkRouterSettingsModel
+ (id)defaultModelForHomeUUID:(id)a3;
+ (id)modelIDForHomeUUID:(id)a3;
+ (id)modelNamespace;
+ (id)properties;
- (id)dependentUUIDs;
@end

@implementation HMDHomeNetworkRouterSettingsModel

- (id)dependentUUIDs
{
  v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
  v4 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v4)
  {
    v5 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v3 addObject:v5];
  }
  v6 = [(HMDHomeNetworkRouterSettingsModel *)self activeNetworkRouterAccessoryUUID];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F29128]);
    v8 = [(HMDHomeNetworkRouterSettingsModel *)self activeNetworkRouterAccessoryUUID];
    v9 = (void *)[v7 initWithUUIDString:v8];
    [v3 addObject:v9];
  }
  v10 = (void *)[v3 copy];

  return v10;
}

+ (id)properties
{
  if (properties_onceToken_300 != -1) {
    dispatch_once(&properties_onceToken_300, &__block_literal_global_303);
  }
  v2 = (void *)properties__properties_301;
  return v2;
}

void __47__HMDHomeNetworkRouterSettingsModel_properties__block_invoke()
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"activeNetworkRouterAccessoryUUID";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v7[0] = v0;
  v6[1] = @"activeNetworkRouterInitialSetupNeededUUID";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v7[1] = v1;
  v6[2] = @"minimumNetworkRouterSupportHomeKitVersion";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v7[2] = v2;
  v6[3] = @"minHomeKitVersionForAccessoryNetworkProtectionChange";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v7[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:4];
  v5 = (void *)properties__properties_301;
  properties__properties_301 = v4;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v4 = a3;
  v5 = [HMDHomeNetworkRouterSettingsModel alloc];
  v6 = [a1 modelIDForHomeUUID:v4];
  id v7 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:1 uuid:v6 parentUUID:v4];

  return v7;
}

+ (id)modelIDForHomeUUID:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA58];
  id v4 = a3;
  id v5 = [v3 dataWithLength:16];
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  v6 = (void *)MEMORY[0x1E4F29128];
  id v7 = [(id)objc_opt_class() modelNamespace];
  v8 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v7, v5);

  return v8;
}

+ (id)modelNamespace
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"F71A2DE4-C7D9-411D-B156-88C2E88A9673"];
  return v2;
}

@end