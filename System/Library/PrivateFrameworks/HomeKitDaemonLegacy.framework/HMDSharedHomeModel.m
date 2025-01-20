@interface HMDSharedHomeModel
+ (id)properties;
- (BOOL)isReplayable;
@end

@implementation HMDSharedHomeModel

+ (id)properties
{
  if (properties_onceToken_215 != -1) {
    dispatch_once(&properties_onceToken_215, &__block_literal_global_218_80150);
  }
  v2 = (void *)properties__properties_216;
  return v2;
}

void __32__HMDSharedHomeModel_properties__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"homeData";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[1] = @"configurationVersion";
  v5[0] = v0;
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)properties__properties_216;
  properties__properties_216 = v2;
}

- (BOOL)isReplayable
{
  return 0;
}

@end