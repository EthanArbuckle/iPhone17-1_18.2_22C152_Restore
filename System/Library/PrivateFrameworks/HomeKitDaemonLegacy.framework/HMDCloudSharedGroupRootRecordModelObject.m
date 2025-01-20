@interface HMDCloudSharedGroupRootRecordModelObject
+ (id)properties;
@end

@implementation HMDCloudSharedGroupRootRecordModelObject

+ (id)properties
{
  if (properties_onceToken_4 != -1) {
    dispatch_once(&properties_onceToken_4, &__block_literal_global_7);
  }
  v2 = (void *)properties__properties_5;
  return v2;
}

void __54__HMDCloudSharedGroupRootRecordModelObject_properties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"recordNames";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_5;
  properties__properties_5 = v1;
}

@end