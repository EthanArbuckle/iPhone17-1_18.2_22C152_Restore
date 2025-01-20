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
  v3 = (objc_class *)MEMORY[0x263F08C38];
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
  if (properties_onceToken_30250 != -1) {
    dispatch_once(&properties_onceToken_30250, &__block_literal_global_3);
  }
  v2 = (void *)properties__properties_30251;
  return v2;
}

void __42__HMDAnnounceUserSettingsModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"announceNotificationModeForCurrentDevice";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_30251;
  properties__properties_30251 = v1;
}

+ (id)modelIDNamespace
{
  if (modelIDNamespace_onceToken != -1) {
    dispatch_once(&modelIDNamespace_onceToken, &__block_literal_global_30258);
  }
  v2 = (void *)modelIDNamespace_modelIDNamespace;
  return v2;
}

void __48__HMDAnnounceUserSettingsModel_modelIDNamespace__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"cf5e2c56-ea81-4471-88d4-0a0a0063000c"];
  uint64_t v1 = (void *)modelIDNamespace_modelIDNamespace;
  modelIDNamespace_modelIDNamespace = v0;
}

@end