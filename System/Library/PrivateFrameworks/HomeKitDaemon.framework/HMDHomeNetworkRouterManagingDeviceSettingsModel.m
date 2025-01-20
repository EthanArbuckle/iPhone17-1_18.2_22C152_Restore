@interface HMDHomeNetworkRouterManagingDeviceSettingsModel
+ (Class)cd_entityClass;
+ (id)defaultModelForHomeUUID:(id)a3;
+ (id)modelIDForHomeUUID:(id)a3;
+ (id)modelNamespace;
+ (id)properties;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)dependentUUIDs;
@end

@implementation HMDHomeNetworkRouterManagingDeviceSettingsModel

- (id)dependentUUIDs
{
  v3 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
  v4 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v4)
  {
    v5 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v3 addObject:v5];
  }
  v6 = [(HMDHomeNetworkRouterManagingDeviceSettingsModel *)self primaryNetworkRouterManagingDeviceUUID];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263F08C38]);
    v8 = [(HMDHomeNetworkRouterManagingDeviceSettingsModel *)self primaryNetworkRouterManagingDeviceUUID];
    v9 = (void *)[v7 initWithUUIDString:v8];
    [v3 addObject:v9];
  }
  v10 = (void *)[v3 copy];

  return v10;
}

+ (id)properties
{
  if (properties_onceToken_335 != -1) {
    dispatch_once(&properties_onceToken_335, &__block_literal_global_338_118782);
  }
  v2 = (void *)properties__properties_336;
  return v2;
}

void __61__HMDHomeNetworkRouterManagingDeviceSettingsModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"primaryNetworkRouterManagingDeviceUUID";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_336;
  properties__properties_336 = v1;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v4 = a3;
  v5 = [HMDHomeNetworkRouterManagingDeviceSettingsModel alloc];
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
  v2 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"EAB77D3E-35C9-4473-8ACE-C2AFC1895F9E"];
  return v2;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"home"])
  {
    v11 = objc_opt_class();
    v12 = [(HMDBackingStoreModelObject *)self parentUUID];
    v13 = objc_msgSend(v11, "cd_getHomeFromUUID:", v12);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDHomeNetworkRouterManagingDeviceSettingsModel;
    v13 = [(HMDBackingStoreModelObject *)&v15 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v13;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end