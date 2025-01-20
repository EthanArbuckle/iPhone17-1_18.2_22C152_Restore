@interface HMDRoomModel
+ (id)properties;
@end

@implementation HMDRoomModel

+ (id)properties
{
  if (properties_onceToken_101441 != -1) {
    dispatch_once(&properties_onceToken_101441, &__block_literal_global_188);
  }
  v2 = (void *)properties__properties_101442;
  return v2;
}

void __26__HMDRoomModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"name";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_101442;
  properties__properties_101442 = v1;
}

@end