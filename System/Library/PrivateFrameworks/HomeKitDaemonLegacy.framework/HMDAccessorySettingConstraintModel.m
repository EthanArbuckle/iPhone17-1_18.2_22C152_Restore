@interface HMDAccessorySettingConstraintModel
+ (id)properties;
+ (id)schemaHashRoot;
@end

@implementation HMDAccessorySettingConstraintModel

+ (id)properties
{
  if (properties_onceToken_42956 != -1) {
    dispatch_once(&properties_onceToken_42956, &__block_literal_global_42957);
  }
  v2 = (void *)properties__properties_42958;
  return v2;
}

void __48__HMDAccessorySettingConstraintModel_properties__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"type";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[1] = @"value";
  v5[0] = v0;
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)properties__properties_42958;
  properties__properties_42958 = v2;
}

+ (id)schemaHashRoot
{
  uint64_t v2 = (void *)[@"DAE24BE8-9E89-4F27-AFBB-B40F7C0FE2A2" copy];
  return v2;
}

@end