@interface HMDTriggerModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)createPayload;
- (id)dependentUUIDs;
@end

@implementation HMDTriggerModel

- (id)dependentUUIDs
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263EFF9C0];
  v4 = [(HMDTriggerModel *)self currentActionSets];
  v5 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count") + 1);

  v6 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v6)
  {
    v7 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v5 addObject:v7];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = [(HMDTriggerModel *)self currentActionSets];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        [v5 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v5;
}

- (id)createPayload
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [(HMDBackingStoreModelObject *)self uuid];
  v5 = [v4 UUIDString];
  [v3 setObject:v5 forKeyedSubscript:@"kTriggerUUID"];

  v6 = [(HMDTriggerModel *)self name];
  [v3 setObject:v6 forKeyedSubscript:@"kTriggerName"];

  v7 = [(HMDTriggerModel *)self configuredName];
  [v3 setObject:v7 forKeyedSubscript:*MEMORY[0x263F0DB68]];

  v8 = [(HMDTriggerModel *)self active];
  [v3 setObject:v8 forKeyedSubscript:@"kTriggerActivate"];

  uint64_t v9 = [(HMDTriggerModel *)self autoDelete];
  [v3 setObject:v9 forKeyedSubscript:*MEMORY[0x263F0DB78]];

  uint64_t v10 = [(HMDTriggerModel *)self currentActionSets];
  [v3 setObject:v10 forKeyedSubscript:@"kTriggerActionSetUUIDKey"];

  uint64_t v11 = (void *)[v3 copy];
  return v11;
}

+ (id)properties
{
  if (properties_onceToken != -1) {
    dispatch_once(&properties_onceToken, &__block_literal_global_363);
  }
  v2 = (void *)properties__properties;
  return v2;
}

void __29__HMDTriggerModel_properties__block_invoke()
{
  v11[8] = *MEMORY[0x263EF8340];
  v10[0] = @"name";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[0] = v0;
  v10[1] = @"configuredName";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[1] = v1;
  v10[2] = @"currentActionSets";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[2] = v2;
  v10[3] = @"active";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[3] = v3;
  v10[4] = @"mostRecentFireDate";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[4] = v4;
  v10[5] = @"owner";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[5] = v5;
  v10[6] = @"owningDevice";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[6] = v6;
  v10[7] = @"autoDelete";
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[7] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:8];
  uint64_t v9 = (void *)properties__properties;
  properties__properties = v8;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"actionSets_"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"currentActionSets"])
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v30 = __Block_byref_object_copy__36637;
      v31 = __Block_byref_object_dispose__36638;
      uint64_t v11 = (void *)MEMORY[0x263EFF9C0];
      v12 = [(HMDTriggerModel *)self currentActionSets];
      objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));
      id v32 = (id)objc_claimAutoreleasedReturnValue();

      v13 = [(HMDTriggerModel *)self currentActionSets];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __84__HMDTriggerModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke;
      v28[3] = &unk_264A2C450;
      v28[4] = buf;
      objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v28);

      v14 = (void *)[*(id *)(*(void *)&buf[8] + 40) copy];
      _Block_object_dispose(buf, 8);
    }
    else
    {
      v14 = 0;
    }
  }
  else if ([v9 isEqualToString:@"owner"])
  {
    v14 = [(HMDTriggerModel *)self owner];

    if (v14)
    {
      long long v15 = [(HMDTriggerModel *)self owner];
      long long v16 = [v15 uuid];
      id v27 = 0;
      v14 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v16 ofManagedObjectType:objc_opt_class() error:&v27];
      long long v17 = (uint64_t (*)(uint64_t, uint64_t))v27;

      if (v14)
      {
        id v18 = v14;
      }
      else
      {
        context = (void *)MEMORY[0x230FBD990]();
        v19 = self;
        uint64_t v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = HMFGetLogIdentifier();
          v22 = [(HMDTriggerModel *)v19 owner];
          v23 = [v22 uuid];
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v21;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v23;
          *(_WORD *)&buf[22] = 2112;
          v30 = v17;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFUser with UUID %@: %@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)HMDTriggerModel;
    v14 = [(HMDBackingStoreModelObject *)&v26 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v14;
}

void __84__HMDTriggerModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend((id)objc_opt_class(), "cd_getMKFActionSetFromActionSetUUID:", v3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (v5)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
    v4 = v5;
  }
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"currentActionSets"])
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__36637;
    v23 = __Block_byref_object_dispose__36638;
    uint64_t v11 = (void *)MEMORY[0x263EFF980];
    v12 = [v8 actionSets];
    objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    v13 = [v8 actionSets];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __109__HMDTriggerModel_CoreData__cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo___block_invoke;
    v18[3] = &unk_264A190A0;
    v18[4] = &v19;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);

    v14 = (void *)[(id)v20[5] copy];
    _Block_object_dispose(&v19, 8);
  }
  else if ([v9 isEqualToString:@"owner"])
  {
    v14 = [v8 owner];

    if (v14)
    {
      long long v15 = [v8 owner];
      v14 = +[HMDUserModel cd_getHMDUserFromMKFUser:v15];
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDTriggerModel;
    v14 = [(HMDBackingStoreModelObject *)&v17 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
  }

  return v14;
}

void __109__HMDTriggerModel_CoreData__cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [a2 modelID];
  id v3 = [v4 UUIDString];
  [v2 addObject:v3];
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"home";
}

@end