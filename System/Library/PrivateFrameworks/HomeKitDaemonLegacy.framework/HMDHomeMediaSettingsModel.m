@interface HMDHomeMediaSettingsModel
+ (id)defaultModelForHomeUUID:(id)a3;
+ (id)modelIDForHomeUUID:(id)a3;
+ (id)modelNamespace;
+ (id)properties;
@end

@implementation HMDHomeMediaSettingsModel

+ (id)properties
{
  if (properties_onceToken_266 != -1) {
    dispatch_once(&properties_onceToken_266, &__block_literal_global_269);
  }
  v2 = (void *)properties__properties_267;
  return v2;
}

void __39__HMDHomeMediaSettingsModel_properties__block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"minimumMediaUserPrivilege";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[0] = v0;
  v5[1] = @"mediaPeerToPeerEnabled";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[1] = v1;
  v5[2] = @"mediaPassword";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  v4 = (void *)properties__properties_267;
  properties__properties_267 = v3;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v4 = a3;
  v5 = [HMDHomeMediaSettingsModel alloc];
  v6 = [a1 modelIDForHomeUUID:v4];
  v7 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:1 uuid:v6 parentUUID:v4];

  [(HMDHomeMediaSettingsModel *)v7 setMinimumMediaUserPrivilege:&unk_1F2DC80E0];
  [(HMDHomeMediaSettingsModel *)v7 setMediaPeerToPeerEnabled:MEMORY[0x1E4F1CC28]];
  [(HMDHomeMediaSettingsModel *)v7 setMediaPassword:0];
  return v7;
}

+ (id)modelIDForHomeUUID:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA58];
  id v4 = a3;
  id v5 = [v3 dataWithLength:16];
  objc_msgSend(v4, "getUUIDBytes:", objc_msgSend(v5, "mutableBytes"));

  id v6 = objc_alloc(MEMORY[0x1E4F29128]);
  v7 = +[HMDHomeMediaSettingsModel modelNamespace];
  v8 = (void *)[v6 initWithNamespace:v7 data:v5];

  return v8;
}

+ (id)modelNamespace
{
  if (modelNamespace_onceToken_261 != -1) {
    dispatch_once(&modelNamespace_onceToken_261, &__block_literal_global_263);
  }
  v2 = (void *)modelNamespace_namespace_260;
  return v2;
}

uint64_t __43__HMDHomeMediaSettingsModel_modelNamespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"CF85C76F-270E-41CF-8984-258A00E81134"];
  uint64_t v1 = modelNamespace_namespace_260;
  modelNamespace_namespace_260 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end