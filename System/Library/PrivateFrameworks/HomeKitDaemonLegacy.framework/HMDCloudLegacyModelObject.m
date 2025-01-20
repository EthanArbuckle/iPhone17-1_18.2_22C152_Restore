@interface HMDCloudLegacyModelObject
+ (id)properties;
@end

@implementation HMDCloudLegacyModelObject

+ (id)properties
{
  if (properties_onceToken_153265 != -1) {
    dispatch_once(&properties_onceToken_153265, &__block_literal_global_124);
  }
  v2 = (void *)properties__properties_153266;
  return v2;
}

void __39__HMDCloudLegacyModelObject_properties__block_invoke()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v5[0] = @"legacyRecordType";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[0] = v0;
  v5[1] = @"data1";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[1] = v1;
  v5[2] = @"data2";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
  v4 = (void *)properties__properties_153266;
  properties__properties_153266 = v3;
}

@end