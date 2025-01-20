@interface HMDUserAccessCodeModel
+ (id)modelUUIDWithUUID:(id)a3;
+ (id)properties;
- (HMDUserAccessCodeModel)initWithUserUUID:(id)a3;
@end

@implementation HMDUserAccessCodeModel

+ (id)modelUUIDWithUUID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F29128];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUIDString:@"9DB6E60C-3E4F-44A3-94F6-14DB51D3E800"];
  v6 = (void *)MEMORY[0x1E4F29128];
  v7 = objc_msgSend(v4, "hm_convertToData");

  v8 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v7);

  return v8;
}

+ (id)properties
{
  if (properties_onceToken_132164 != -1) {
    dispatch_once(&properties_onceToken_132164, &__block_literal_global_132165);
  }
  v2 = (void *)properties__properties_132166;
  return v2;
}

void __36__HMDUserAccessCodeModel_properties__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"value";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class() logging:3];
  v4[1] = @"changedByUserUUID";
  v5[0] = v0;
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)properties__properties_132166;
  properties__properties_132166 = v2;
}

- (HMDUserAccessCodeModel)initWithUserUUID:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() modelUUIDWithUUID:v4];
  v6 = [(HMDBackingStoreModelObject *)self initWithObjectChangeType:1 uuid:v5 parentUUID:v4];

  return v6;
}

@end