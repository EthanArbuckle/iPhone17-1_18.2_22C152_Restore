@interface HMDHomeMediaSettingsModel
+ (Class)cd_entityClass;
+ (id)defaultModelForHomeUUID:(id)a3;
+ (id)modelIDForHomeUUID:(id)a3;
+ (id)modelNamespace;
+ (id)properties;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
@end

@implementation HMDHomeMediaSettingsModel

+ (id)properties
{
  if (properties_onceToken_313 != -1) {
    dispatch_once(&properties_onceToken_313, &__block_literal_global_316_118755);
  }
  v2 = (void *)properties__properties_314;
  return v2;
}

void __39__HMDHomeMediaSettingsModel_properties__block_invoke()
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"minimumMediaUserPrivilege";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[0] = v0;
  v5[1] = @"mediaPeerToPeerEnabled";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[1] = v1;
  v5[2] = @"mediaPassword";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[2] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  v4 = (void *)properties__properties_314;
  properties__properties_314 = v3;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v4 = a3;
  v5 = [HMDHomeMediaSettingsModel alloc];
  v6 = [a1 modelIDForHomeUUID:v4];
  v7 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:1 uuid:v6 parentUUID:v4];

  [(HMDHomeMediaSettingsModel *)v7 setMinimumMediaUserPrivilege:&unk_26E471890];
  [(HMDHomeMediaSettingsModel *)v7 setMediaPeerToPeerEnabled:MEMORY[0x263EFFA80]];
  [(HMDHomeMediaSettingsModel *)v7 setMediaPassword:0];
  return v7;
}

+ (id)modelIDForHomeUUID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263EFF990];
  id v4 = a3;
  id v5 = [v3 dataWithLength:16];
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  id v6 = objc_alloc(MEMORY[0x263F08C38]);
  v7 = +[HMDHomeMediaSettingsModel modelNamespace];
  v8 = (void *)[v6 initWithNamespace:v7 data:v5];

  return v8;
}

+ (id)modelNamespace
{
  if (modelNamespace_onceToken_308 != -1) {
    dispatch_once(&modelNamespace_onceToken_308, &__block_literal_global_310_118770);
  }
  v2 = (void *)modelNamespace_namespace_307;
  return v2;
}

void __43__HMDHomeMediaSettingsModel_modelNamespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"CF85C76F-270E-41CF-8984-258A00E81134"];
  v1 = (void *)modelNamespace_namespace_307;
  modelNamespace_namespace_307 = v0;
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
    v15.super_class = (Class)HMDHomeMediaSettingsModel;
    v13 = [(HMDBackingStoreModelObject *)&v15 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v13;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end