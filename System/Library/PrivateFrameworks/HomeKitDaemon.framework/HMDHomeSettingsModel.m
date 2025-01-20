@interface HMDHomeSettingsModel
+ (Class)cd_entityClass;
+ (id)defaultModelForHomeUUID:(id)a3;
+ (id)modelIDForHomeUUID:(id)a3;
+ (id)modelNamespace;
+ (id)properties;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
@end

@implementation HMDHomeSettingsModel

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
    v15.super_class = (Class)HMDHomeSettingsModel;
    v13 = [(HMDBackingStoreModelObject *)&v15 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v13;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)properties
{
  if (properties_onceToken_291 != -1) {
    dispatch_once(&properties_onceToken_291, &__block_literal_global_294);
  }
  v2 = (void *)properties__properties_292;
  return v2;
}

void __34__HMDHomeSettingsModel_properties__block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"automaticSoftwareUpdateEnabled";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[1] = @"automaticThirdPartyAccessorySoftwareUpdateEnabled";
  v5[0] = v0;
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)properties__properties_292;
  properties__properties_292 = v2;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v4 = a3;
  v5 = [HMDHomeSettingsModel alloc];
  v6 = [a1 modelIDForHomeUUID:v4];
  v7 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:1 uuid:v6 parentUUID:v4];

  [(HMDHomeSettingsModel *)v7 setAutomaticSoftwareUpdateEnabled:MEMORY[0x263EFFA88]];
  [(HMDHomeSettingsModel *)v7 setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:MEMORY[0x263EFFA80]];
  return v7;
}

+ (id)modelIDForHomeUUID:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF990];
  id v4 = a3;
  id v5 = [v3 dataWithLength:16];
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  id v6 = objc_alloc(MEMORY[0x263F08C38]);
  v7 = +[HMDHomeSettingsModel modelNamespace];
  id v8 = (void *)[v6 initWithNamespace:v7 data:v5];

  return v8;
}

+ (id)modelNamespace
{
  if (modelNamespace_onceToken != -1) {
    dispatch_once(&modelNamespace_onceToken, &__block_literal_global_287);
  }
  uint64_t v2 = (void *)modelNamespace_namespace;
  return v2;
}

void __38__HMDHomeSettingsModel_modelNamespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"56E19F0B-2058-4E17-998F-75A96A576767"];
  v1 = (void *)modelNamespace_namespace;
  modelNamespace_namespace = v0;
}

@end