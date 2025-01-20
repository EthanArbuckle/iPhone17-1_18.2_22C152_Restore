@interface HMDMatterAttributeEventModel
+ (Class)cd_entityClass;
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6 error:(id *)a7;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
@end

@implementation HMDMatterAttributeEventModel

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6 error:(id *)a7
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = +[HMDMatterAttributeEventBaseModel eventModelWithDictionary:v12 home:v13 eventTriggerUUID:v14 className:objc_opt_class() message:v15];
  if (v16)
  {
    v17 = [v12 objectForKeyedSubscript:*MEMORY[0x263F0BA88]];
    [v16 setEventValue:v17];

    id v18 = v16;
  }
  else
  {
    v19 = (void *)MEMORY[0x230FBD990]();
    id v20 = a1;
    v21 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      int v24 = 138543618;
      v25 = v22;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl(&dword_22F52A000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to create HMDMatterAttributeEventBaseModel from dictionary %@", (uint8_t *)&v24, 0x16u);
    }
    if (a7)
    {
      *a7 = [MEMORY[0x263F087E8] hmErrorWithCode:3];
    }
  }

  return v16;
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HMDMatterAttributeEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_100495 != -1) {
    dispatch_once(&properties_onceToken_100495, block);
  }
  v2 = (void *)properties__properties_100496;
  return v2;
}

void __42__HMDMatterAttributeEventModel_properties__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDMatterAttributeEventModel;
  v2 = objc_msgSendSuper2(&v8, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_100496;
  properties__properties_100496 = v3;

  v5 = (void *)properties__properties_100496;
  v9 = @"eventValue";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [v5 addEntriesFromDictionary:v7];
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"matterPath"])
  {
    v11 = [(HMDMatterAttributeEventModel *)self matterPathUUID];

    if (v11)
    {
      id v12 = [(HMDMatterAttributeEventModel *)self matterPathUUID];
      id v28 = 0;
      id v13 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v12 ofManagedObjectType:objc_opt_class() error:&v28];
      id v14 = v28;

      id v15 = v13;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v16 = v15;
      }
      else {
        v16 = 0;
      }
      id v17 = v16;

      if (v17)
      {
        id v18 = v17;
        v19 = v15;
      }
      else
      {
        id v20 = (void *)MEMORY[0x230FBD990]();
        v21 = self;
        v22 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = HMFGetLogIdentifier();
          [(HMDMatterAttributeEventModel *)v21 matterPathUUID];
          int v24 = v26 = v20;
          *(_DWORD *)buf = 138543874;
          v30 = v23;
          __int16 v31 = 2112;
          v32 = v24;
          __int16 v33 = 2112;
          id v34 = v14;
          _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_ERROR, "%{public}@Unable to find mkfMatterPath with UUID %@: %@", buf, 0x20u);

          id v20 = v26;
        }

        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)HMDMatterAttributeEventModel;
    v19 = [(HMDBackingStoreModelObject *)&v27 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
  }

  return v19;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"matterPathUUID"])
  {
    v11 = [v8 matterPath];

    if (v11)
    {
      id v12 = [v8 matterPath];
      v11 = [v12 modelID];
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDMatterAttributeEventModel;
    v11 = [(HMDBackingStoreModelObject *)&v14 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
  }

  return v11;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end