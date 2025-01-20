@interface HMDActionSetModel
+ (id)properties;
@end

@implementation HMDActionSetModel

+ (id)properties
{
  if (properties_onceToken_22069 != -1) {
    dispatch_once(&properties_onceToken_22069, &__block_literal_global_449);
  }
  v2 = (void *)properties__properties_22070;
  return v2;
}

void __31__HMDActionSetModel_properties__block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"name";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[0] = v0;
  v5[1] = @"type";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[1] = v1;
  v5[2] = @"lastExecutionDate";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  v4 = (void *)properties__properties_22070;
  properties__properties_22070 = v3;
}

@end