@interface HMDHomeManagerHomeModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)deriveUUIDFromHomeUUID:(id)a3;
+ (id)modelForHomeUUID:(id)a3;
+ (id)properties;
@end

@implementation HMDHomeManagerHomeModel

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"homeManager";
}

+ (id)modelForHomeUUID:(id)a3
{
  id v3 = a3;
  v4 = [HMDHomeManagerHomeModel alloc];
  v5 = +[HMDHomeManagerHomeModel deriveUUIDFromHomeUUID:v3];
  v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  v7 = [(HMDBackingStoreModelObject *)v4 initWithUUID:v5 parentUUID:v6];

  v8 = [HMDHomeManagerHomeHandle alloc];
  v9 = [MEMORY[0x263F08C38] UUID];
  v10 = [(HMDHomeManagerHomeHandle *)v8 initWithBackingStoreUUID:v9 homeUUID:v3];

  [(HMDHomeManagerHomeModel *)v7 setHandle:v10];
  return v7;
}

+ (id)properties
{
  if (properties_onceToken_79995 != -1) {
    dispatch_once(&properties_onceToken_79995, &__block_literal_global_79996);
  }
  v2 = (void *)properties__properties_79997;
  return v2;
}

void __37__HMDHomeManagerHomeModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  id v3 = @"handle";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_79997;
  properties__properties_79997 = v1;
}

+ (id)deriveUUIDFromHomeUUID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x263F08C38], "hm_deriveUUIDFromBaseUUID:withSalts:", a3, &unk_26E474008);
}

@end