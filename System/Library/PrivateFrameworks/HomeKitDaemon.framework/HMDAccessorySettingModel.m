@interface HMDAccessorySettingModel
+ (id)properties;
+ (id)schemaHashRoot;
@end

@implementation HMDAccessorySettingModel

+ (id)properties
{
  if (properties_onceToken_251275 != -1) {
    dispatch_once(&properties_onceToken_251275, &__block_literal_global_252_251276);
  }
  v2 = (void *)properties__properties_251277;
  return v2;
}

void __38__HMDAccessorySettingModel_properties__block_invoke()
{
  v8[5] = *MEMORY[0x263EF8340];
  v7[0] = @"type";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v8[0] = v0;
  v7[1] = @"properties";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v8[1] = v1;
  v7[2] = @"name";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v8[2] = v2;
  v7[3] = @"value";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v8[3] = v3;
  v7[4] = @"configurationVersion";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v8[4] = v4;
  uint64_t v5 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];
  v6 = (void *)properties__properties_251277;
  properties__properties_251277 = v5;
}

+ (id)schemaHashRoot
{
  v2 = (void *)[@"C405A892-9917-4445-9F23-21BB5BAEAD2F" copy];
  return v2;
}

@end