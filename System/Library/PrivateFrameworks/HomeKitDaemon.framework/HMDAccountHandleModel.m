@interface HMDAccountHandleModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
+ (id)schemaHashRoot;
@end

@implementation HMDAccountHandleModel

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"account";
}

+ (id)properties
{
  v7[2] = *MEMORY[0x263EF8340];
  v6[0] = @"idsURI";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[1] = @"local";
  v7[0] = v2;
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v7[1] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

+ (id)schemaHashRoot
{
  v2 = (void *)[@"538177E8-3459-4DE2-BE82-B72A8633498C" copy];
  return v2;
}

@end