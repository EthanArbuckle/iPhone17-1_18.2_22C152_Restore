@interface HMDRoomModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
@end

@implementation HMDRoomModel

+ (id)properties
{
  if (properties_onceToken_148781 != -1) {
    dispatch_once(&properties_onceToken_148781, &__block_literal_global_188);
  }
  v2 = (void *)properties__properties_148782;
  return v2;
}

void __26__HMDRoomModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"name";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_148782;
  properties__properties_148782 = v1;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"home";
}

@end