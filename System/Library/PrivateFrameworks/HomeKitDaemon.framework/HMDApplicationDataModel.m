@interface HMDApplicationDataModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)cd_modelWithMKFHomeManager:(id)a3;
+ (id)properties;
+ (id)schemaHashRoot;
- (BOOL)cd_updateManagedObjectInContext:(id)a3 error:(id *)a4;
- (id)cd_childrenExcluding:(id)a3 fromContext:(id)a4 error:(id *)a5;
- (id)cd_currentManagedObjectInContext:(id)a3 error:(id *)a4;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
@end

@implementation HMDApplicationDataModel

+ (id)properties
{
  if (properties_onceToken_15566 != -1) {
    dispatch_once(&properties_onceToken_15566, &__block_literal_global_127);
  }
  v2 = (void *)properties__properties_15567;
  return v2;
}

void __37__HMDApplicationDataModel_properties__block_invoke()
{
  v4[1] = *MEMORY[0x263EF8340];
  v3 = @"appDataDictionary";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v4[0] = v0;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v2 = (void *)properties__properties_15567;
  properties__properties_15567 = v1;
}

+ (id)schemaHashRoot
{
  return @"3510B4A9-09DF-435C-B6C8-2B7A90888CE7";
}

- (id)cd_childrenExcluding:(id)a3 fromContext:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "set", a3, a4, a5);
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  if ([v8 isEqualToString:@"appDataDictionary"])
  {
    v11 = [v10 appDataDictionary];

    uint64_t v12 = wrapAppDataDictionary(v11);
    v13 = (void *)v12;
    v14 = (void *)*MEMORY[0x263EFFD08];
    if (v12) {
      v14 = (void *)v12;
    }
    id v15 = v14;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDApplicationDataModel;
    id v15 = [(HMDBackingStoreModelObject *)&v17 cd_generateValueForModelObjectFromManagedObject:v10 modelObjectField:v8 modelFieldInfo:v9];
  }
  return v15;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x263EFF940];
  uint64_t v12 = *MEMORY[0x263EFF498];
  v13 = NSString;
  v14 = NSStringFromSelector(a2);
  id v15 = [v13 stringWithFormat:@"%@ is unavailable", v14];
  id v16 = [v11 exceptionWithName:v12 reason:v15 userInfo:0];

  objc_exception_throw(v16);
}

- (BOOL)cd_updateManagedObjectInContext:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  id v8 = [(HMDBackingStoreModelObject *)self parentUUID];
  int v9 = [v8 isEqual:v7];

  if (v9)
  {
    id v10 = +[_MKFModel modelWithModelID:v7 context:v6];
    v11 = [(HMDApplicationDataModel *)self appDataDictionary];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"com.apple.homekit-entitledclient.identifer"];
    [v10 setAppDataDictionary:v12];

    BOOL v13 = 1;
  }
  else
  {
    v41.receiver = self;
    v41.super_class = (Class)HMDApplicationDataModel;
    v14 = [(HMDBackingStoreModelObject *)&v41 cd_currentManagedObjectInContext:v6 error:a4];
    BOOL v13 = v14 != 0;
    if (v14)
    {
      v36 = a4;
      id v15 = [(HMDApplicationDataModel *)self appDataDictionary];
      id v16 = [v15 objectForKeyedSubscript:@"com.apple.homekit-entitledclient.identifer"];
      [v14 setAppDataDictionary:v16];

      objc_super v17 = [(HMDBackingStoreModelObject *)self parentUUID];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id obj = +[_MKFApplicationData hmd_parentAttributeKeyPaths];
      uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v38;
        v33 = v7;
        id v34 = v6;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v38 != v20) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void *)(*((void *)&v37 + 1) + 8 * i);
            uint64_t v23 = [v14 valueForKeyPath:v22];
            if (v23)
            {
              v26 = (void *)v23;
LABEL_18:

              v7 = v33;
              id v6 = v34;
              BOOL v13 = v14 != 0;
              goto LABEL_19;
            }
            v24 = [v14 entity];
            v25 = [v24 relationshipsByName];
            v26 = [v25 objectForKeyedSubscript:v22];

            if (!v26)
            {
              _HMFPreconditionFailure();
LABEL_23:
              _HMFPreconditionFailure();
            }
            v27 = [v26 destinationEntity];
            v28 = [v27 managedObjectClassName];
            Class v29 = NSClassFromString(v28);

            if (!v29) {
              goto LABEL_23;
            }
            uint64_t v30 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v17 ofManagedObjectType:v29 error:v36];
            if (v30)
            {
              v31 = (void *)v30;
              [v14 setValue:v30 forKey:v22];

              goto LABEL_18;
            }
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
          v7 = v33;
          id v6 = v34;
          BOOL v13 = v14 != 0;
          if (v19) {
            continue;
          }
          break;
        }
      }
LABEL_19:
    }
  }

  return v13;
}

- (id)cd_currentManagedObjectInContext:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(HMDBackingStoreModelObject *)self parentUUID];
  id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"];
  char v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)HMDApplicationDataModel;
    id v10 = [(HMDBackingStoreModelObject *)&v12 cd_currentManagedObjectInContext:v6 error:a4];
  }

  return v10;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return 0;
}

+ (id)cd_modelWithMKFHomeManager:(id)a3
{
  id v3 = a3;
  v4 = [v3 appDataDictionary];
  if ([v4 count])
  {
    v5 = [v3 modelID];
    id v6 = +[_MKFApplicationData modelIDForContainerUUID:v5];
    v7 = [(HMDBackingStoreModelObject *)[HMDApplicationDataModel alloc] initWithUUID:v6 parentUUID:v5];
    id v8 = wrapAppDataDictionary(v4);
    [(HMDApplicationDataModel *)v7 setAppDataDictionary:v8];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end