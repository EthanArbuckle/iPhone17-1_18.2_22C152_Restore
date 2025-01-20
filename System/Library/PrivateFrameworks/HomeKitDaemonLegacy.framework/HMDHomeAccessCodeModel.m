@interface HMDHomeAccessCodeModel
+ (id)modelUUIDForHomeUUID:(id)a3 accessCodeValue:(id)a4;
+ (id)properties;
- (HMDHomeAccessCodeModel)initWithHomeUUID:(id)a3 value:(id)a4 label:(id)a5;
@end

@implementation HMDHomeAccessCodeModel

- (HMDHomeAccessCodeModel)initWithHomeUUID:(id)a3 value:(id)a4 label:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  v11 = +[HMDHomeAccessCodeModel modelUUIDForHomeUUID:v10 accessCodeValue:v8];
  v12 = [(HMDBackingStoreModelObject *)self initWithObjectChangeType:1 uuid:v11 parentUUID:v10];

  if (v12)
  {
    [(HMDHomeAccessCodeModel *)v12 setValue:v8];
    [(HMDHomeAccessCodeModel *)v12 setLabel:v9];
  }

  return v12;
}

+ (id)modelUUIDForHomeUUID:(id)a3 accessCodeValue:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F29128];
  id v6 = a3;
  v7 = [a4 dataUsingEncoding:4];
  id v8 = objc_msgSend(v5, "hmf_UUIDWithNamespace:data:", v6, v7);

  return v8;
}

+ (id)properties
{
  if (properties_onceToken_108366 != -1) {
    dispatch_once(&properties_onceToken_108366, &__block_literal_global_108367);
  }
  v2 = (void *)properties__properties_108368;
  return v2;
}

void __36__HMDHomeAccessCodeModel_properties__block_invoke()
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"label";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class() logging:3];
  v4[1] = @"value";
  v5[0] = v0;
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class() logging:3];
  v5[1] = v1;
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:2];
  v3 = (void *)properties__properties_108368;
  properties__properties_108368 = v2;
}

@end