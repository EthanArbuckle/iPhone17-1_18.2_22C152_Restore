@interface HMDHomeNetworkRouterManagingDeviceSettingsModel
+ (id)defaultModelForHomeUUID:(id)a3;
+ (id)modelIDForHomeUUID:(id)a3;
+ (id)modelNamespace;
+ (id)properties;
- (id)dependentUUIDs;
@end

@implementation HMDHomeNetworkRouterManagingDeviceSettingsModel

- (id)dependentUUIDs
{
  v3 = [MEMORY[0x1E4F1CA80] setWithCapacity:2];
  v4 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v4)
  {
    v5 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v3 addObject:v5];
  }
  v6 = [(HMDHomeNetworkRouterManagingDeviceSettingsModel *)self primaryNetworkRouterManagingDeviceUUID];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F29128]);
    v8 = [(HMDHomeNetworkRouterManagingDeviceSettingsModel *)self primaryNetworkRouterManagingDeviceUUID];
    v9 = (void *)[v7 initWithUUIDString:v8];
    [v3 addObject:v9];
  }
  v10 = (void *)[v3 copy];

  return v10;
}

+ (id)properties
{
  if (properties_onceToken_288 != -1) {
    dispatch_once(&properties_onceToken_288, &__block_literal_global_291_80218);
  }
  v2 = (void *)properties__properties_289;
  return v2;
}

void __61__HMDHomeNetworkRouterManagingDeviceSettingsModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"primaryNetworkRouterManagingDeviceUUID";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_289;
  properties__properties_289 = v1;
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
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"EAB77D3E-35C9-4473-8ACE-C2AFC1895F9E"];
  return v2;
}

@end