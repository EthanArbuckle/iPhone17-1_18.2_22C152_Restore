@interface HMDHomeNetworkRouterSettingsModel
+ (Class)cd_entityClass;
+ (id)defaultModelForHomeUUID:(id)a3;
+ (id)modelIDForHomeUUID:(id)a3;
+ (id)modelNamespace;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)dependentUUIDs;
@end

@implementation HMDHomeNetworkRouterSettingsModel

- (id)dependentUUIDs
{
  v3 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
  v4 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v4)
  {
    v5 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v3 addObject:v5];
  }
  v6 = [(HMDHomeNetworkRouterSettingsModel *)self activeNetworkRouterAccessoryUUID];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F08C38]);
    v8 = [(HMDHomeNetworkRouterSettingsModel *)self activeNetworkRouterAccessoryUUID];
    v9 = (void *)[v7 initWithUUIDString:v8];
    [v3 addObject:v9];
  }
  v10 = (void *)[v3 copy];

  return v10;
}

+ (id)properties
{
  if (properties_onceToken_347 != -1) {
    dispatch_once(&properties_onceToken_347, &__block_literal_global_350);
  }
  v2 = (void *)properties__properties_348;
  return v2;
}

void __47__HMDHomeNetworkRouterSettingsModel_properties__block_invoke()
{
  v7[4] = *MEMORY[0x263EF8340];
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
  uint64_t v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];
  v5 = (void *)properties__properties_348;
  properties__properties_348 = v4;
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
  v3 = (void *)MEMORY[0x263EFF990];
  id v4 = a3;
  id v5 = [v3 dataWithLength:16];
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  v6 = (void *)MEMORY[0x263F08C38];
  id v7 = [(id)objc_opt_class() modelNamespace];
  v8 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v7, v5);

  return v8;
}

+ (id)modelNamespace
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"F71A2DE4-C7D9-411D-B156-88C2E88A9673"];
  return v2;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"networkAccessory"])
  {
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"activeNetworkRouterAccessoryUUID"])
    {
      v15 = 0;
      goto LABEL_12;
    }
    v11 = [(HMDHomeNetworkRouterSettingsModel *)self activeNetworkRouterAccessoryUUID];

    if (v11)
    {
      v12 = [(HMDHomeNetworkRouterSettingsModel *)self activeNetworkRouterAccessoryUUID];
      uint64_t v13 = +[HMDAccessoryTransaction cd_getMKFAccessoryFromAccessoryUUID:v12];
LABEL_7:
      v15 = (void *)v13;

      goto LABEL_12;
    }
    uint64_t v16 = [MEMORY[0x263EFF9D0] null];
  }
  else
  {
    if ([v9 isEqualToString:@"home"])
    {
      v14 = objc_opt_class();
      v12 = [(HMDBackingStoreModelObject *)self parentUUID];
      uint64_t v13 = objc_msgSend(v14, "cd_getHomeFromUUID:", v12);
      goto LABEL_7;
    }
    v18.receiver = self;
    v18.super_class = (Class)HMDHomeNetworkRouterSettingsModel;
    uint64_t v16 = [(HMDBackingStoreModelObject *)&v18 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }
  v15 = (void *)v16;
LABEL_12:

  return v15;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([v8 isEqualToString:@"activeNetworkRouterAccessoryUUID"])
  {
    v11 = [v10 networkAccessory];

    v12 = [v11 modelID];
    uint64_t v13 = [v12 UUIDString];
    v14 = (void *)v13;
    v15 = (void *)*MEMORY[0x263EFFD08];
    if (v13) {
      v15 = (void *)v13;
    }
    id v16 = v15;
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)HMDHomeNetworkRouterSettingsModel;
    id v16 = [(HMDBackingStoreModelObject *)&v18 cd_generateValueForModelObjectFromManagedObject:v10 modelObjectField:v8 modelFieldInfo:v9];
  }
  return v16;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end