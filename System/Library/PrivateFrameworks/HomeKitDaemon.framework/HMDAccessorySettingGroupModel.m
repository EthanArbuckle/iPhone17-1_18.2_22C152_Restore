@interface HMDAccessorySettingGroupModel
+ (id)properties;
+ (id)schemaHashRoot;
@end

@implementation HMDAccessorySettingGroupModel

+ (id)properties
{
  if (properties_onceToken_211320 != -1) {
    dispatch_once(&properties_onceToken_211320, &__block_literal_global_187);
  }
  v2 = (void *)properties__properties_211321;
  return v2;
}

void __43__HMDAccessorySettingGroupModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"name";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_211321;
  properties__properties_211321 = v1;
}

+ (id)schemaHashRoot
{
  v2 = (void *)[@"4E347E70-4576-4D21-B00D-A0054A1889A4" copy];
  return v2;
}

@end