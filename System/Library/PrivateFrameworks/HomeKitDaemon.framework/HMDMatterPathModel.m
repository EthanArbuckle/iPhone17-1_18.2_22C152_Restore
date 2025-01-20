@interface HMDMatterPathModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
- (void)cd_populateParentRelationshipInContext:(id)a3 error:(id *)a4;
@end

@implementation HMDMatterPathModel

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__HMDMatterPathModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_153242 != -1) {
    dispatch_once(&properties_onceToken_153242, block);
  }
  v2 = (void *)properties__properties_153243;
  return v2;
}

void __32__HMDMatterPathModel_properties__block_invoke(uint64_t a1)
{
  v14[5] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)&OBJC_METACLASS___HMDMatterPathModel;
  v2 = objc_msgSendSuper2(&v12, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_153243;
  properties__properties_153243 = v3;

  v5 = (void *)properties__properties_153243;
  v13[0] = @"endpointID";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v14[0] = v6;
  v13[1] = @"clusterID";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v14[1] = v7;
  v13[2] = @"attributeID";
  v8 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v14[2] = v8;
  v13[3] = @"commandID";
  v9 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v14[3] = v9;
  v13[4] = @"eventID";
  v10 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v14[4] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5];
  [v5 addEntriesFromDictionary:v11];
}

- (void)cd_populateParentRelationshipInContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[HMDCoreData featuresDataSource];
  char v8 = [v7 isRVCEnabled];

  if (v8)
  {
    v13.receiver = self;
    v13.super_class = (Class)HMDMatterPathModel;
    uint64_t v9 = [(HMDBackingStoreModelObject *)&v13 cd_fetchParentForManagedObjectUsingParentReferenceName:@"accessory" error:a4];
    if (v9
      || (v12.receiver = self,
          v12.super_class = (Class)HMDMatterPathModel,
          [(HMDBackingStoreModelObject *)&v12 cd_fetchParentForManagedObjectUsingParentReferenceName:@"accessory" error:a4], (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v10 = (void *)v9;
      v11 = [(HMDBackingStoreModelObject *)self managedObject];
      [v11 setValue:v10 forKey:@"accessory"];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDMatterPathModel;
    [(HMDBackingStoreModelObject *)&v14 cd_populateParentRelationshipInContext:v6 error:a4];
  }
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"accessory";
}

@end