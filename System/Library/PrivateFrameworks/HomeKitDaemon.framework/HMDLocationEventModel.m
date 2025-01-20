@interface HMDLocationEventModel
+ (Class)cd_entityClass;
+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
@end

@implementation HMDLocationEventModel

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = objc_msgSend(v9, "hm_regionFromDataForKey:", @"kLocationEventRegionKey");
  if (HMIsValidRegion())
  {
    v14 = +[HMDEventModel eventModelWithDictionary:v9 home:v10 eventTriggerUUID:v11 className:objc_opt_class() message:v12];
    v15 = encodeRootObject();
    [v14 setRegion:v15];
  }
  else
  {
    v16 = (void *)MEMORY[0x230FBD990]();
    v17 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = HMFGetLogIdentifier();
      int v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_ERROR, "%{public}@Provided region is invalid", (uint8_t *)&v20, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__HMDLocationEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_18477 != -1) {
    dispatch_once(&properties_onceToken_18477, block);
  }
  v2 = (void *)properties__properties_18478;
  return v2;
}

void __35__HMDLocationEventModel_properties__block_invoke(uint64_t a1)
{
  v11[2] = *MEMORY[0x263EF8340];
  v1 = (void *)MEMORY[0x263EFF9A0];
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)&OBJC_METACLASS___HMDLocationEventModel;
  v2 = objc_msgSendSuper2(&v9, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_18478;
  properties__properties_18478 = v3;

  v5 = (void *)properties__properties_18478;
  v10[0] = @"region";
  v6 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v10[1] = @"userUUID";
  v11[0] = v6;
  v7 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v11[1] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v5 addEntriesFromDictionary:v8];
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 isEqualToString:@"region"])
  {
    if (![v9 isEqualToString:@"user"])
    {
      v27.receiver = self;
      v27.super_class = (Class)HMDLocationEventModel;
      id v12 = [(HMDBackingStoreModelObject *)&v27 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
      goto LABEL_22;
    }
    if ([(HMDBackingStoreModelObject *)self propertyWasSet:@"userUUID"])
    {
      v15 = [(HMDLocationEventModel *)self userUUID];
      id v28 = 0;
      id v12 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v15 ofManagedObjectType:objc_opt_class() error:&v28];
      id v11 = v28;

      if (v12)
      {
        id v16 = v12;
      }
      else
      {
        v21 = (void *)MEMORY[0x230FBD990]();
        uint64_t v22 = self;
        v23 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = HMFGetLogIdentifier();
          v25 = [(HMDLocationEventModel *)v22 userUUID];
          *(_DWORD *)buf = 138543874;
          v31 = v24;
          __int16 v32 = 2112;
          id v33 = v25;
          __int16 v34 = 2112;
          id v35 = v11;
          _os_log_impl(&dword_22F52A000, v23, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFUser with UUID %@: %@", buf, 0x20u);
        }
      }

      goto LABEL_21;
    }
LABEL_10:
    id v12 = 0;
    goto LABEL_22;
  }
  if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"region"]) {
    goto LABEL_10;
  }
  id v11 = [(HMDLocationEventModel *)self region];
  if (v11)
  {
    id v29 = 0;
    id v12 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v11 error:&v29];
    id v13 = v29;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      v17 = (void *)MEMORY[0x230FBD990]();
      v18 = self;
      v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        int v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543618;
        v31 = v20;
        __int16 v32 = 2112;
        id v33 = v13;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode region: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v12 = [MEMORY[0x263EFF9D0] null];
  }
LABEL_21:

LABEL_22:
  return v12;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"region"])
  {
    id v11 = [v8 region];
    if (v11) {
      [MEMORY[0x263F08910] archivedDataWithRootObject:v11 requiringSecureCoding:1 error:0];
    }
    else {
    id v15 = [MEMORY[0x263EFF9D0] null];
    }
  }
  else
  {
    if (![v9 isEqualToString:@"userUUID"])
    {
      v17.receiver = self;
      v17.super_class = (Class)HMDLocationEventModel;
      id v15 = [(HMDBackingStoreModelObject *)&v17 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
      goto LABEL_12;
    }
    id v11 = [v8 user];
    uint64_t v12 = [v11 modelID];
    id v13 = (void *)v12;
    id v14 = (void *)*MEMORY[0x263EFFD08];
    if (v12) {
      id v14 = (void *)v12;
    }
    id v15 = v14;
  }
LABEL_12:

  return v15;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end