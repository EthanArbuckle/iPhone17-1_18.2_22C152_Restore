@interface HMDDeviceModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
+ (id)schemaHashRoot;
- (BOOL)diff:(id)a3 differingFields:(id *)a4;
- (id)cd_childrenExcluding:(id)a3 fromContext:(id)a4 error:(id *)a5;
@end

@implementation HMDDeviceModel

- (BOOL)diff:(id)a3 differingFields:(id *)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HMDDeviceModel;
  id v21 = 0;
  unsigned int v7 = [(HMDBackingStoreModelObject *)&v20 diff:v6 differingFields:&v21];
  id v8 = v21;
  v9 = v8;
  if (v7 && [v8 containsObject:@"handles"])
  {
    id v10 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      v13 = [(HMDDeviceModel *)self deviceHandles];
      v14 = [v12 deviceHandles];
      int v15 = isEqualDeepCompare(v13, v14);

      if (v15)
      {
        v16 = (void *)[v9 mutableCopy];
        [v16 removeObject:@"handles"];
        uint64_t v17 = [v16 copy];

        v9 = (void *)v17;
      }
    }
  }
  if (a4) {
    *a4 = v9;
  }
  BOOL v18 = [v9 count] != 0;

  return v18;
}

+ (id)properties
{
  if (properties_onceToken_168285 != -1) {
    dispatch_once(&properties_onceToken_168285, &__block_literal_global_599);
  }
  v2 = (void *)properties__properties_168286;
  return v2;
}

void __28__HMDDeviceModel_properties__block_invoke()
{
  v9[6] = *MEMORY[0x263EF8340];
  v8[0] = @"identifier";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[0] = v0;
  v8[1] = @"handles";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[1] = v1;
  v8[2] = @"name";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[2] = v2;
  v8[3] = @"version";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[3] = v3;
  v8[4] = @"productInfo";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[4] = v4;
  v8[5] = @"rpIdentity";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v9[5] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:6];
  unsigned int v7 = (void *)properties__properties_168286;
  properties__properties_168286 = v6;
}

+ (id)schemaHashRoot
{
  v2 = (void *)[@"6D8998A8-13E4-4269-83B8-672645AE2D15" copy];
  return v2;
}

- (id)cd_childrenExcluding:(id)a3 fromContext:(id)a4 error:(id *)a5
{
  v5 = [(HMDBackingStoreModelObject *)self cd_fetchManagedObjectInContext:a4 error:a5];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFFA08] set];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"account";
}

@end