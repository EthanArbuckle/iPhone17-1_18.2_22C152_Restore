@interface HMDHomeSettingsModel
+ (id)defaultModelForHomeUUID:(id)a3;
+ (id)modelIDForHomeUUID:(id)a3;
+ (id)modelNamespace;
+ (id)properties;
@end

@implementation HMDHomeSettingsModel

+ (id)properties
{
  if (properties_onceToken_244 != -1) {
    dispatch_once(&properties_onceToken_244, &__block_literal_global_247_80174);
  }
  v2 = (void *)properties__properties_245;
  return v2;
}

void __34__HMDHomeSettingsModel_properties__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"automaticSoftwareUpdateEnabled";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[1] = @"automaticThirdPartyAccessorySoftwareUpdateEnabled";
  v5[0] = v0;
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)properties__properties_245;
  properties__properties_245 = v2;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v4 = a3;
  v5 = [HMDHomeSettingsModel alloc];
  v6 = [a1 modelIDForHomeUUID:v4];
  v7 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:1 uuid:v6 parentUUID:v4];

  [(HMDHomeSettingsModel *)v7 setAutomaticSoftwareUpdateEnabled:MEMORY[0x1E4F1CC38]];
  [(HMDHomeSettingsModel *)v7 setAutomaticThirdPartyAccessorySoftwareUpdateEnabled:MEMORY[0x1E4F1CC28]];
  return v7;
}

+ (id)modelIDForHomeUUID:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1CA58];
  id v4 = a3;
  id v5 = [v3 dataWithLength:16];
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  id v6 = objc_alloc(MEMORY[0x1E4F29128]);
  v7 = +[HMDHomeSettingsModel modelNamespace];
  v8 = (void *)[v6 initWithNamespace:v7 data:v5];

  return v8;
}

+ (id)modelNamespace
{
  if (modelNamespace_onceToken != -1) {
    dispatch_once(&modelNamespace_onceToken, &__block_literal_global_240_80185);
  }
  uint64_t v2 = (void *)modelNamespace_namespace;
  return v2;
}

uint64_t __38__HMDHomeSettingsModel_modelNamespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"56E19F0B-2058-4E17-998F-75A96A576767"];
  uint64_t v1 = modelNamespace_namespace;
  modelNamespace_namespace = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end