@interface HMDAnnounceUserSettingsModel
+ (id)modelIDNamespace;
+ (id)properties;
- (HMDAnnounceUserSettingsModel)initWithUserUUID:(id)a3;
- (id)modelIDForUser:(id)a3;
@end

@implementation HMDAnnounceUserSettingsModel

- (HMDAnnounceUserSettingsModel)initWithUserUUID:(id)a3
{
  id v4 = a3;
  v5 = [HMDAnnounceUserSettingsModel alloc];
  v6 = [(HMDAnnounceUserSettingsModel *)self modelIDForUser:v4];
  v7 = [(HMDBackingStoreModelObject *)v5 initWithUUID:v6 parentUUID:v4];

  return v7;
}

- (id)modelIDForUser:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = +[HMDAnnounceUserSettingsModel modelIDNamespace];
  v7 = [v4 UUIDString];

  v8 = [v7 dataUsingEncoding:4];
  v9 = (void *)[v5 initWithNamespace:v6 data:v8];

  return v9;
}

+ (id)properties
{
  if (properties_onceToken_21802 != -1) {
    dispatch_once(&properties_onceToken_21802, &__block_literal_global_3_21803);
  }
  v2 = (void *)properties__properties_21804;
  return v2;
}

void __42__HMDAnnounceUserSettingsModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"announceNotificationModeForCurrentDevice";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_21804;
  properties__properties_21804 = v1;
}

+ (id)modelIDNamespace
{
  if (modelIDNamespace_onceToken != -1) {
    dispatch_once(&modelIDNamespace_onceToken, &__block_literal_global_21812);
  }
  v2 = (void *)modelIDNamespace_modelIDNamespace;
  return v2;
}

uint64_t __48__HMDAnnounceUserSettingsModel_modelIDNamespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"cf5e2c56-ea81-4471-88d4-0a0a0063000c"];
  uint64_t v1 = modelIDNamespace_modelIDNamespace;
  modelIDNamespace_modelIDNamespace = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end