@interface HMDDeviceModel
+ (id)properties;
+ (id)schemaHashRoot;
- (BOOL)diff:(id)a3 differingFields:(id *)a4;
- (NSArray)deviceHandles;
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

- (NSArray)deviceHandles
{
  v2 = self;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v3 = [(HMDDeviceModel *)self handles];
  v4 = (void *)[v3 copy];

  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v6 = v4;
  uint64_t v26 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v26)
  {
    uint64_t v7 = *(void *)v29;
    id v24 = v6;
    uint64_t v25 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v10 = (void *)MEMORY[0x1E4F28DC0];
        uint64_t v11 = objc_opt_class();
        id v27 = 0;
        id v12 = [v10 unarchivedObjectOfClass:v11 fromData:v9 error:&v27];
        id v13 = v27;
        id v14 = v12;
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          int v15 = v14;
        }
        else {
          int v15 = 0;
        }
        id v16 = v15;

        if (v16)
        {
          [v5 addObject:v16];
        }
        else
        {
          uint64_t v17 = (void *)MEMORY[0x1D9452090]();
          BOOL v18 = v2;
          v19 = HMFGetOSLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            objc_super v20 = v5;
            v22 = id v21 = v2;
            *(_DWORD *)buf = 138543618;
            v33 = v22;
            __int16 v34 = 2112;
            id v35 = v13;
            _os_log_impl(&dword_1D49D5000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive device handle from handle array: %@", buf, 0x16u);

            v2 = v21;
            v5 = v20;
            id v6 = v24;
          }

          uint64_t v7 = v25;
        }
      }
      uint64_t v26 = [v6 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v26);
  }

  return (NSArray *)v5;
}

+ (id)properties
{
  if (properties_onceToken_116100 != -1) {
    dispatch_once(&properties_onceToken_116100, &__block_literal_global_364);
  }
  v2 = (void *)properties__properties_116101;
  return v2;
}

void __28__HMDDeviceModel_properties__block_invoke()
{
  v9[6] = *MEMORY[0x1E4F143B8];
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
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:6];
  uint64_t v7 = (void *)properties__properties_116101;
  properties__properties_116101 = v6;
}

+ (id)schemaHashRoot
{
  v2 = (void *)[@"6D8998A8-13E4-4269-83B8-672645AE2D15" copy];
  return v2;
}

@end