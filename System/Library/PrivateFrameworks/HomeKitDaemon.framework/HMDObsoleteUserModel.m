@interface HMDObsoleteUserModel
+ (id)properties;
@end

@implementation HMDObsoleteUserModel

+ (id)properties
{
  if (properties_onceToken_228956 != -1) {
    dispatch_once(&properties_onceToken_228956, &__block_literal_global_228957);
  }
  v2 = (void *)properties__properties_228958;
  return v2;
}

void __34__HMDObsoleteUserModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"changeTag";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_228958;
  properties__properties_228958 = v1;
}

@end