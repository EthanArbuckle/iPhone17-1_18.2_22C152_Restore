@interface HMDUserAccessCodeModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)modelUUIDWithUUID:(id)a3;
+ (id)properties;
- (HMDUserAccessCodeModel)initWithUserUUID:(id)a3;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (void)cd_populateParentRelationshipInContext:(id)a3 error:(id *)a4;
@end

@implementation HMDUserAccessCodeModel

- (void)cd_populateParentRelationshipInContext:(id)a3 error:(id *)a4
{
  v13.receiver = self;
  v13.super_class = (Class)HMDUserAccessCodeModel;
  uint64_t v6 = -[HMDBackingStoreModelObject cd_fetchParentForManagedObjectUsingParentReferenceName:error:](&v13, sel_cd_fetchParentForManagedObjectUsingParentReferenceName_error_, @"user");
  if (v6)
  {
    v7 = (void *)v6;
    v8 = [(HMDBackingStoreModelObject *)self managedObject];
    v9 = v8;
    v10 = @"user";
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDUserAccessCodeModel;
    uint64_t v11 = [(HMDBackingStoreModelObject *)&v12 cd_fetchParentForManagedObjectUsingParentReferenceName:@"guest" error:a4];
    if (!v11) {
      return;
    }
    v7 = (void *)v11;
    v8 = [(HMDBackingStoreModelObject *)self managedObject];
    v9 = v8;
    v10 = @"guest";
  }
  [v8 setValue:v7 forKey:v10];
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"accessCode"])
  {
    if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"value"])
    {
      v14 = 0;
      goto LABEL_11;
    }
    uint64_t v11 = [(HMDUserAccessCodeModel *)self value];
  }
  else
  {
    if ([v9 isEqualToString:@"home"])
    {
      objc_super v12 = [(HMDBackingStoreModelObject *)self parentUUID];
      objc_super v13 = +[HMDUserModel cd_getMKFUserFromUUID:v12];

      v14 = [v13 home];

      goto LABEL_11;
    }
    if ([v9 isEqualToString:@"modelID"])
    {
      uint64_t v11 = [(HMDBackingStoreModelObject *)self uuid];
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)HMDUserAccessCodeModel;
      uint64_t v11 = [(HMDBackingStoreModelObject *)&v16 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
    }
  }
  v14 = (void *)v11;
LABEL_11:

  return v14;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([v8 isEqualToString:@"value"])
  {
    uint64_t v11 = [v10 accessCode];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDUserAccessCodeModel;
    uint64_t v11 = [(HMDBackingStoreModelObject *)&v14 cd_generateValueForModelObjectFromManagedObject:v10 modelObjectField:v8 modelFieldInfo:v9];
  }
  objc_super v12 = (void *)v11;

  return v12;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"user";
}

+ (id)modelUUIDWithUUID:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithUUIDString:@"9DB6E60C-3E4F-44A3-94F6-14DB51D3E800"];
  uint64_t v6 = (void *)MEMORY[0x263F08C38];
  v7 = objc_msgSend(v4, "hm_convertToData");

  id v8 = objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v7);

  return v8;
}

+ (id)properties
{
  if (properties_onceToken_190932 != -1) {
    dispatch_once(&properties_onceToken_190932, &__block_literal_global_190933);
  }
  v2 = (void *)properties__properties_190934;
  return v2;
}

void __36__HMDUserAccessCodeModel_properties__block_invoke()
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"value";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class() logging:3];
  v6[0] = v0;
  v5[1] = @"changedByUserUUID";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[1] = v1;
  v5[2] = @"hh2ModelID";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[2] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  id v4 = (void *)properties__properties_190934;
  properties__properties_190934 = v3;
}

- (HMDUserAccessCodeModel)initWithUserUUID:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() modelUUIDWithUUID:v4];
  uint64_t v6 = [MEMORY[0x263F08C38] UUID];
  [(HMDUserAccessCodeModel *)self setHh2ModelID:v6];

  v7 = [(HMDBackingStoreModelObject *)self initWithObjectChangeType:1 uuid:v5 parentUUID:v4];
  return v7;
}

@end