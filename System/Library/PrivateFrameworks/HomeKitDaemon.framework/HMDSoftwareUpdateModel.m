@interface HMDSoftwareUpdateModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
- (id)cd_fetchManagedObjectInContext:(id)a3 error:(id *)a4;
@end

@implementation HMDSoftwareUpdateModel

+ (id)properties
{
  if (properties_onceToken_125430 != -1) {
    dispatch_once(&properties_onceToken_125430, &__block_literal_global_252_125431);
  }
  v2 = (void *)properties__properties_125432;
  return v2;
}

void __36__HMDSoftwareUpdateModel_properties__block_invoke()
{
  v10[7] = *MEMORY[0x263EF8340];
  v9[0] = @"softwareVersion";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[0] = v0;
  v9[1] = @"displayableSoftwareVersion";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[1] = v1;
  v9[2] = @"state";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[2] = v2;
  v9[3] = @"downloadSize";
  v3 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[3] = v3;
  v9[4] = @"installDuration";
  v4 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[4] = v4;
  v9[5] = @"documentationMetadata";
  v5 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[5] = v5;
  v9[6] = @"releaseDate";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[6] = v6;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:7];
  v8 = (void *)properties__properties_125432;
  properties__properties_125432 = v7;
}

- (id)cd_fetchManagedObjectInContext:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [(HMDBackingStoreModelObject *)self managedObject];
  if (v7)
  {
    v8 = v7;
    v9 = [v7 managedObjectContext];

    if (!v9)
    {
      v10 = (void *)MEMORY[0x230FBD990]();
      v11 = self;
      v12 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        v13 = HMFGetLogIdentifier();
        v14 = [(HMDBackingStoreModelObject *)v11 uuid];
        v15 = [(HMDBackingStoreModelObject *)v11 parentUUID];
        *(_DWORD *)buf = 138544130;
        v30 = v13;
        __int16 v31 = 2112;
        v32 = v8;
        __int16 v33 = 2112;
        id v34 = v14;
        __int16 v35 = 2112;
        v36 = v15;
        _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_FAULT, "%{public}@Managed object context appears to be reset on this object %@, someone did something very bad: %@/%@", buf, 0x2Au);
      }
    }
  }
  else
  {
    v16 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "cd_entityClass"), "fetchRequest");
    v17 = (void *)MEMORY[0x263F08A98];
    v18 = [(HMDBackingStoreModelObject *)self parentUUID];
    v19 = [v17 predicateWithFormat:@"%K.%K == %@", @"accessory", @"modelID", v18];
    [v16 setPredicate:v19];

    v20 = [v16 execute:a4];
    if (v20)
    {
      v21 = v20;
      if ((unint64_t)[v20 count] >= 2) {
        _HMFPreconditionFailure();
      }
      v8 = [v21 firstObject];
      [(HMDBackingStoreModelObject *)self setManagedObject:v8];
    }
    else
    {
      v22 = (void *)MEMORY[0x230FBD990]();
      v23 = self;
      v24 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = HMFGetLogIdentifier();
        v26 = [(HMDBackingStoreModelObject *)v23 parentUUID];
        id v27 = *a4;
        *(_DWORD *)buf = 138543874;
        v30 = v25;
        __int16 v31 = 2112;
        v32 = v26;
        __int16 v33 = 2112;
        id v34 = v27;
        _os_log_impl(&dword_22F52A000, v24, OS_LOG_TYPE_ERROR, "%{public}@Fetch of software update model with parent UUID : %@ failed: %@", buf, 0x20u);
      }

      v8 = 0;
    }
  }

  return v8;
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