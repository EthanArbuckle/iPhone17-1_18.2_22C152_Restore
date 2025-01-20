@interface HMDHomeThreadNetworkModel
+ (id)defaultModelForHome:(id)a3;
+ (id)defaultModelForHomeUUID:(id)a3;
+ (id)modelIDForHome:(id)a3;
+ (id)modelIDForHomeUUID:(id)a3;
+ (id)properties;
@end

@implementation HMDHomeThreadNetworkModel

+ (id)properties
{
  if (properties_onceToken_322 != -1) {
    dispatch_once(&properties_onceToken_322, &__block_literal_global_325_80248);
  }
  v2 = (void *)properties__properties_323;
  return v2;
}

void __39__HMDHomeThreadNetworkModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v3 = @"threadNetworkID";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_323;
  properties__properties_323 = v1;
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
  v5 = objc_msgSend(MEMORY[0x1E4F29128], "hmf_UUIDWithNamespace:data:", v3, v4);

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