@interface HMDObsoleteUserModel
+ (id)properties;
@end

@implementation HMDObsoleteUserModel

+ (id)properties
{
  if (properties_onceToken_159788 != -1) {
    dispatch_once(&properties_onceToken_159788, &__block_literal_global_159789);
  }
  v2 = (void *)properties__properties_159790;
  return v2;
}

void __34__HMDObsoleteUserModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"changeTag";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_159790;
  properties__properties_159790 = v1;
}

@end