@interface HMDCloudGroupRootRecordModelObject
+ (id)properties;
@end

@implementation HMDCloudGroupRootRecordModelObject

+ (id)properties
{
  if (properties_onceToken_16945 != -1) {
    dispatch_once(&properties_onceToken_16945, &__block_literal_global_77_16946);
  }
  v2 = (void *)properties__properties_16947;
  return v2;
}

void __48__HMDCloudGroupRootRecordModelObject_properties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"objectIDToRecordNameMap";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_16947;
  properties__properties_16947 = v1;
}

@end