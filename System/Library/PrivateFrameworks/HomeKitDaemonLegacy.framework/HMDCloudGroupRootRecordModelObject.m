@interface HMDCloudGroupRootRecordModelObject
+ (id)properties;
@end

@implementation HMDCloudGroupRootRecordModelObject

+ (id)properties
{
  if (properties_onceToken_58153 != -1) {
    dispatch_once(&properties_onceToken_58153, &__block_literal_global_58154);
  }
  v2 = (void *)properties__properties_58155;
  return v2;
}

void __48__HMDCloudGroupRootRecordModelObject_properties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"objectIDToRecordNameMap";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_58155;
  properties__properties_58155 = v1;
}

@end