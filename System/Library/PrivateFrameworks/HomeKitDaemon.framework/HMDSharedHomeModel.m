@interface HMDSharedHomeModel
+ (id)properties;
- (BOOL)isReplayable;
@end

@implementation HMDSharedHomeModel

+ (id)properties
{
  if (properties_onceToken_262 != -1) {
    dispatch_once(&properties_onceToken_262, &__block_literal_global_265_118711);
  }
  v2 = (void *)properties__properties_263;
  return v2;
}

void __32__HMDSharedHomeModel_properties__block_invoke()
{
  v5[2] = *MEMORY[0x263EF8340];
  v4[0] = @"homeData";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[1] = @"configurationVersion";
  v5[0] = v0;
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)properties__properties_263;
  properties__properties_263 = v2;
}

- (BOOL)isReplayable
{
  return 0;
}

@end