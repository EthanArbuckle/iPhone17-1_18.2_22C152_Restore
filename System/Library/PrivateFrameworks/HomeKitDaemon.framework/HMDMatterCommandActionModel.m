@interface HMDMatterCommandActionModel
+ (Class)cd_entityClass;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)decodeSerializedMatterCommands:(id)a3 home:(id)a4;
- (id)dependentUUIDs;
- (void)loadModelWithActionInformation:(id)a3;
@end

@implementation HMDMatterCommandActionModel

- (id)dependentUUIDs
{
  v12.receiver = self;
  v12.super_class = (Class)HMDMatterCommandActionModel;
  v3 = [(HMDBackingStoreModelObject *)&v12 dependentUUIDs];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v5)
  {
    v6 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v4 addObject:v6];
  }
  v7 = [(HMDMatterCommandActionModel *)self matterPathUUIDs];

  if (v7)
  {
    v8 = [(HMDMatterCommandActionModel *)self matterPathUUIDs];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __45__HMDMatterCommandActionModel_dependentUUIDs__block_invoke;
    v10[3] = &unk_264A2AC40;
    id v11 = v4;
    [v8 enumerateObjectsUsingBlock:v10];
  }
  return v4;
}

uint64_t __45__HMDMatterCommandActionModel_dependentUUIDs__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)decodeSerializedMatterCommands:(id)a3 home:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v27 = [MEMORY[0x263EFF980] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v30;
    v26 = self;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          v13 = v12;
        }
        else {
          v13 = 0;
        }
        id v14 = v13;

        if (v14)
        {
          v15 = [[HMDMatterCommand alloc] initWithDictionary:v14 home:v7];
          if (v15)
          {
            [v27 addObject:v15];
          }
          else
          {
            v20 = (void *)MEMORY[0x230FBD990]();
            v21 = self;
            v22 = HMFGetOSLogHandle();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              v23 = HMFGetLogIdentifier();
              *(_DWORD *)buf = 138543618;
              v34 = v23;
              __int16 v35 = 2112;
              id v36 = v14;
              _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Invalid serialized command %@", buf, 0x16u);

              self = v26;
            }
          }
        }
        else
        {
          v16 = (void *)MEMORY[0x230FBD990]();
          v17 = self;
          v18 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = HMFGetLogIdentifier();
            *(_DWORD *)buf = 138543618;
            v34 = v19;
            __int16 v35 = 2112;
            id v36 = v12;
            _os_log_impl(&dword_22F52A000, v18, OS_LOG_TYPE_ERROR, "%{public}@Invalid command dictionary %@", buf, 0x16u);

            self = v26;
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v9);
  }

  v24 = (void *)[v27 copy];
  return v24;
}

- (void)loadModelWithActionInformation:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HMDMatterCommandActionModel;
  [(HMDActionModel *)&v3 loadModelWithActionInformation:a3];
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__HMDMatterCommandActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_118272 != -1) {
    dispatch_once(&properties_onceToken_118272, block);
  }
  v2 = (void *)properties__properties_118273;
  return v2;
}

void __41__HMDMatterCommandActionModel_properties__block_invoke(uint64_t a1)
{
  v11[3] = *MEMORY[0x263EF8340];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMDMatterCommandActionModel;
  v1 = objc_msgSendSuper2(&v9, sel_properties);
  uint64_t v2 = [v1 mutableCopy];
  objc_super v3 = (void *)properties__properties_118273;
  properties__properties_118273 = v2;

  v4 = (void *)properties__properties_118273;
  v10[0] = @"matterPathUUIDs";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[0] = v5;
  v10[1] = @"commands";
  id v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[1] = v6;
  v10[2] = @"enforceExecutionOrder";
  id v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[2] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
  [v4 addEntriesFromDictionary:v8];
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"matterPaths_"])
  {
    id v11 = [(HMDMatterCommandActionModel *)self matterPathUUIDs];

    if (v11)
    {
      uint64_t v25 = 0;
      v26 = &v25;
      uint64_t v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__234406;
      long long v29 = __Block_byref_object_dispose__234407;
      id v12 = (void *)MEMORY[0x263EFF9C0];
      v13 = [(HMDMatterCommandActionModel *)self matterPathUUIDs];
      objc_msgSend(v12, "setWithCapacity:", objc_msgSend(v13, "count"));
      id v30 = (id)objc_claimAutoreleasedReturnValue();

      id v14 = [(HMDMatterCommandActionModel *)self matterPathUUIDs];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __96__HMDMatterCommandActionModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke;
      v24[3] = &unk_264A29CA0;
      v24[4] = self;
      v24[5] = &v25;
      [v14 enumerateObjectsUsingBlock:v24];

      uint64_t v15 = [(id)v26[5] count];
      v16 = [(HMDMatterCommandActionModel *)self matterPathUUIDs];
      LOBYTE(v15) = v15 == [v16 count];

      if (v15)
      {
        v17 = (void *)[(id)v26[5] copy];
      }
      else
      {
        v18 = (void *)MEMORY[0x230FBD990]();
        v19 = self;
        HMFGetOSLogHandle();
        v20 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          long long v32 = v21;
          _os_log_impl(&dword_22F52A000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to find all mkfMatterPaths", buf, 0xCu);
        }
        v17 = 0;
      }
      _Block_object_dispose(&v25, 8);
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)HMDMatterCommandActionModel;
    v17 = [(HMDBackingStoreModelObject *)&v23 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v17;
}

void __96__HMDMatterCommandActionModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v17 = 0;
  id v7 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v6 ofManagedObjectType:objc_opt_class() error:&v17];
  id v8 = v17;
  id v9 = v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }
  id v11 = v10;

  if (v11)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v11];
  }
  else
  {
    id v12 = (void *)MEMORY[0x230FBD990]();
    id v13 = *(id *)(a1 + 32);
    id v14 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = HMFGetLogIdentifier();
      v16 = [*(id *)(a1 + 32) matterPathUUIDs];
      *(_DWORD *)buf = 138543874;
      v19 = v15;
      __int16 v20 = 2112;
      v21 = v16;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl(&dword_22F52A000, v14, OS_LOG_TYPE_ERROR, "%{public}@Unable to find mkfMatterPath with UUID %@: %@", buf, 0x20u);
    }
    *a4 = 1;
  }
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"matterPathUUIDs"])
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__234406;
    __int16 v22 = __Block_byref_object_dispose__234407;
    id v11 = (void *)MEMORY[0x263EFF980];
    id v12 = [v8 matterPaths];
    objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    id v13 = [v8 matterPaths];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __121__HMDMatterCommandActionModel_CoreData__cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo___block_invoke;
    v17[3] = &unk_264A29C78;
    v17[4] = &v18;
    [v13 enumerateObjectsUsingBlock:v17];

    id v14 = (void *)[(id)v19[5] copy];
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDMatterCommandActionModel;
    id v14 = [(HMDBackingStoreModelObject *)&v16 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
  }

  return v14;
}

void __121__HMDMatterCommandActionModel_CoreData__cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [a2 modelID];
  objc_super v3 = [v4 UUIDString];
  [v2 addObject:v3];
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end