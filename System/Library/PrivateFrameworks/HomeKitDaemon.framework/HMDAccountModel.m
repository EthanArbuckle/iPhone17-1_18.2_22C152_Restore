@interface HMDAccountModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
+ (id)schemaHashRoot;
@end

@implementation HMDAccountModel

+ (id)properties
{
  if (properties_onceToken_88161 != -1) {
    dispatch_once(&properties_onceToken_88161, &__block_literal_global_529_88162);
  }
  v2 = (void *)properties__properties_88163;
  return v2;
}

void __29__HMDAccountModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"identifier";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_88163;
  properties__properties_88163 = v1;
}

+ (id)schemaHashRoot
{
  v2 = (void *)[@"95E13552-1E95-4C7E-B2EE-3A010CB17DE9" copy];
  return v2;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"homeManager";
}

@end