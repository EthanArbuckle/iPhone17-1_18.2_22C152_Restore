@interface HMDHomeThreadNetworkModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)defaultModelForHome:(id)a3;
+ (id)defaultModelForHomeUUID:(id)a3;
+ (id)modelIDForHome:(id)a3;
+ (id)modelIDForHomeUUID:(id)a3;
+ (id)properties;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
@end

@implementation HMDHomeThreadNetworkModel

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"home"])
  {
    v11 = objc_opt_class();
    v12 = [(HMDBackingStoreModelObject *)self parentUUID];
    v13 = objc_msgSend(v11, "cd_getHomeFromUUID:", v12);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HMDHomeThreadNetworkModel;
    v13 = [(HMDBackingStoreModelObject *)&v15 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v13;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"home";
}

+ (id)properties
{
  if (properties_onceToken_369 != -1) {
    dispatch_once(&properties_onceToken_369, &__block_literal_global_372);
  }
  v2 = (void *)properties__properties_370;
  return v2;
}

void __39__HMDHomeThreadNetworkModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"threadNetworkID";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_370;
  properties__properties_370 = v1;
}

+ (id)defaultModelForHomeUUID:(id)a3
{
  id v4 = a3;
  v5 = [HMDHomeThreadNetworkModel alloc];
  v6 = [a1 modelIDForHomeUUID:v4];
  v7 = [(HMDBackingStoreModelObject *)v5 initWithObjectChangeType:1 uuid:v6 parentUUID:v4];

  return v7;
}

+ (id)defaultModelForHome:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  v5 = [v3 uuid];

  v6 = [v4 defaultModelForHomeUUID:v5];

  return v6;
}

+ (id)modelIDForHomeUUID:(id)a3
{
  id v3 = a3;
  id v4 = [@"HMDHomeThreadNetworkModel" dataUsingEncoding:4];
  v5 = objc_msgSend(MEMORY[0x263F08C38], "hmf_UUIDWithNamespace:data:", v3, v4);

  return v5;
}

+ (id)modelIDForHome:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  v5 = [v3 uuid];

  v6 = [v4 modelIDForHomeUUID:v5];

  return v6;
}

@end