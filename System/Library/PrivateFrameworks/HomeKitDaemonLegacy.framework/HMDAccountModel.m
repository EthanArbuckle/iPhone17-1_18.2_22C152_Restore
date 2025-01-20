@interface HMDAccountModel
+ (id)properties;
+ (id)schemaHashRoot;
@end

@implementation HMDAccountModel

+ (id)properties
{
  if (properties_onceToken_57950 != -1) {
    dispatch_once(&properties_onceToken_57950, &__block_literal_global_278);
  }
  v2 = (void *)properties__properties_57951;
  return v2;
}

void __29__HMDAccountModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"identifier";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_57951;
  properties__properties_57951 = v1;
}

+ (id)schemaHashRoot
{
  v2 = (void *)[@"95E13552-1E95-4C7E-B2EE-3A010CB17DE9" copy];
  return v2;
}

@end