@interface HMDMediaPlaybackActionModel
+ (Class)cd_entityClass;
+ (id)properties;
+ (id)schemaHashRoot;
- (BOOL)validForStorage;
- (id)_profilesFromManagedObject:(id)a3;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
- (id)dependentUUIDs;
- (id)validate;
- (void)loadModelWithActionInformation:(id)a3;
@end

@implementation HMDMediaPlaybackActionModel

- (id)dependentUUIDs
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v28.receiver = self;
  v28.super_class = (Class)HMDMediaPlaybackActionModel;
  v3 = [(HMDBackingStoreModelObject *)&v28 dependentUUIDs];
  v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDBackingStoreModelObject *)self parentUUID];

  if (v5)
  {
    v6 = [(HMDBackingStoreModelObject *)self parentUUID];
    [v4 addObject:v6];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v7 = [(HMDMediaPlaybackActionModel *)self accessories];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        [v4 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v9);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v13 = [(HMDMediaPlaybackActionModel *)self services];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(*((void *)&v20 + 1) + 8 * j)];
        [v4 addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v15);
  }

  return v4;
}

- (id)validate
{
  v3 = [(HMDMediaPlaybackActionModel *)self profiles];
  v4 = [(HMDMediaPlaybackActionModel *)self state];
  uint64_t v5 = [v4 integerValue];
  v6 = [(HMDMediaPlaybackActionModel *)self volume];
  BOOL v7 = +[HMDMediaPlaybackAction isPlaybackActionValidWithProfiles:v3 state:v5 volume:v6];

  if (v7)
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
  }
  return v8;
}

- (BOOL)validForStorage
{
  v3 = [(HMDMediaPlaybackActionModel *)self profiles];
  if ([v3 count])
  {
    v4 = [(HMDMediaPlaybackActionModel *)self accessories];
    if ([v4 count])
    {
      uint64_t v5 = [(HMDMediaPlaybackActionModel *)self state];
      if ([v5 integerValue])
      {
        BOOL v6 = 1;
      }
      else
      {
        BOOL v7 = [(HMDMediaPlaybackActionModel *)self volume];
        if (v7)
        {
          BOOL v6 = 1;
        }
        else
        {
          uint64_t v8 = [(HMDMediaPlaybackActionModel *)self encodedPlaybackArchive];
          BOOL v6 = v8 != 0;
        }
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)loadModelWithActionInformation:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDMediaPlaybackActionModel;
  [(HMDActionModel *)&v11 loadModelWithActionInformation:v4];
  uint64_t v5 = objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x263F0D120]);
  [(HMDMediaPlaybackActionModel *)self setState:v5];

  BOOL v6 = objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x263F0D130]);
  [(HMDMediaPlaybackActionModel *)self setVolume:v6];

  BOOL v7 = objc_msgSend(v4, "hmf_arrayForKey:", *MEMORY[0x263F0D110]);
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFFA08] setWithArray:v7];
    [(HMDMediaPlaybackActionModel *)self setProfiles:v8];
  }
  uint64_t v9 = objc_msgSend(v4, "hmf_dataForKey:", *MEMORY[0x263F0D100]);
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:0];
    if (v10) {
      [(HMDMediaPlaybackActionModel *)self setEncodedPlaybackArchive:v10];
    }
  }
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__HMDMediaPlaybackActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_247992 != -1) {
    dispatch_once(&properties_onceToken_247992, block);
  }
  v2 = (void *)properties__properties_247993;
  return v2;
}

void __41__HMDMediaPlaybackActionModel_properties__block_invoke(uint64_t a1)
{
  v23[6] = *MEMORY[0x263EF8340];
  v18.receiver = *(id *)(a1 + 32);
  v18.super_class = (Class)&OBJC_METACLASS___HMDMediaPlaybackActionModel;
  v1 = objc_msgSendSuper2(&v18, sel_properties);
  uint64_t v2 = [v1 mutableCopy];
  v3 = (void *)properties__properties_247993;
  properties__properties_247993 = v2;

  v17 = (void *)properties__properties_247993;
  v22[0] = @"accessories";
  uint64_t v4 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v21 count:1];
  uint64_t v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:v4 additionalDecodeClasses:v16];
  v23[0] = v5;
  v22[1] = @"state";
  BOOL v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v23[1] = v6;
  v22[2] = @"volume";
  BOOL v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v23[2] = v7;
  v22[3] = @"profiles";
  uint64_t v8 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v20 count:1];
  uint64_t v10 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:v8 additionalDecodeClasses:v9];
  v23[3] = v10;
  v22[4] = @"encodedPlaybackArchive";
  objc_super v11 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v23[4] = v11;
  v22[5] = @"services";
  uint64_t v12 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v19 count:1];
  uint64_t v14 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:v12 additionalDecodeClasses:v13];
  v23[5] = v14;
  uint64_t v15 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:6];
  [v17 addEntriesFromDictionary:v15];
}

+ (id)schemaHashRoot
{
  return @"4E0EC9BD-7632-4738-82B4-5DC5E759C40E";
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"accessories_"])
  {
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"accessories"])
    {
      uint64_t v18 = 0;
      uint64_t v19 = &v18;
      uint64_t v20 = 0x3032000000;
      uint64_t v21 = __Block_byref_object_copy__250674;
      long long v22 = __Block_byref_object_dispose__250675;
      objc_super v11 = (void *)MEMORY[0x263EFF9C0];
      uint64_t v12 = [(HMDMediaPlaybackActionModel *)self accessories];
      objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      v13 = [(HMDMediaPlaybackActionModel *)self accessories];
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __96__HMDMediaPlaybackActionModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke;
      v17[3] = &unk_264A2C898;
      v17[4] = self;
      v17[5] = &v18;
      objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);

      id v14 = (id)v19[5];
      _Block_object_dispose(&v18, 8);
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDMediaPlaybackActionModel;
    id v14 = [(HMDBackingStoreModelObject *)&v16 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v14;
}

void __96__HMDMediaPlaybackActionModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = +[HMDAccessoryTransaction cd_getMKFAccessoryFromAccessoryUUID:v3];
  if (v4)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x230FBD990]();
    id v6 = *(id *)(a1 + 32);
    BOOL v7 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      id v8 = HMFGetLogIdentifier();
      int v9 = 138543362;
      id v10 = v8;
      _os_log_impl(&dword_22F52A000, v7, OS_LOG_TYPE_FAULT, "%{public}@The found NSManagedObject is not of type MKFAccessory", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (id)_profilesFromManagedObject:(id)a3
{
  id v3 = (void *)MEMORY[0x263EFF9C0];
  id v4 = a3;
  uint64_t v5 = [v4 accessories];
  id v6 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v5, "count"));

  BOOL v7 = [v4 accessories];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__HMDMediaPlaybackActionModel_CoreData___profilesFromManagedObject___block_invoke;
  v11[3] = &unk_264A2C870;
  id v12 = v6;
  id v8 = v6;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

  int v9 = (void *)[v8 copy];
  return v9;
}

void __68__HMDMediaPlaybackActionModel_CoreData___profilesFromManagedObject___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = [a2 modelID];
  id v3 = +[HMDMediaProfile uniqueIdentifierFromAccessoryUUID:v5];
  id v4 = [v3 UUIDString];
  [v2 addObject:v4];
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"accessories"])
  {
    uint64_t v19 = 0;
    uint64_t v20 = &v19;
    uint64_t v21 = 0x3032000000;
    long long v22 = __Block_byref_object_copy__250674;
    id v23 = __Block_byref_object_dispose__250675;
    uint64_t v11 = (void *)MEMORY[0x263EFF9C0];
    id v12 = [v8 accessories];
    objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    v13 = [v8 accessories];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __121__HMDMediaPlaybackActionModel_CoreData__cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo___block_invoke;
    v18[3] = &unk_264A2C848;
    v18[4] = &v19;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);

    id v14 = (id)v20[5];
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    if ([v9 isEqualToString:@"profiles"])
    {
      uint64_t v15 = [(HMDMediaPlaybackActionModel *)self _profilesFromManagedObject:v8];
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)HMDMediaPlaybackActionModel;
      uint64_t v15 = [(HMDBackingStoreModelObject *)&v17 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
    }
    id v14 = (id)v15;
  }

  return v14;
}

void __121__HMDMediaPlaybackActionModel_CoreData__cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v4 = [a2 modelID];
  id v3 = [v4 UUIDString];
  [v2 addObject:v3];
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end