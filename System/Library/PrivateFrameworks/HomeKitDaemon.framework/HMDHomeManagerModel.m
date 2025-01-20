@interface HMDHomeManagerModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)properties;
- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5;
- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5;
@end

@implementation HMDHomeManagerModel

+ (id)properties
{
  if (properties_onceToken_143275 != -1) {
    dispatch_once(&properties_onceToken_143275, &__block_literal_global_143276);
  }
  v2 = (void *)properties__properties_143277;
  return v2;
}

void __33__HMDHomeManagerModel_properties__block_invoke()
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"controllerKeyIdentifier";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[0] = v0;
  v5[1] = @"primaryHomeUUID";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[1] = v1;
  v5[2] = @"cloudZoneInformation";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[2] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  v4 = (void *)properties__properties_143277;
  properties__properties_143277 = v3;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![v9 isEqualToString:@"primaryHome"])
  {
    v26.receiver = self;
    v26.super_class = (Class)HMDHomeManagerModel;
    uint64_t v18 = [(HMDBackingStoreModelObject *)&v26 cd_generateValueForProperty:v8 managedObjectField:v9 context:v10];
LABEL_9:
    v16 = (void *)v18;
    goto LABEL_14;
  }
  if (![(HMDBackingStoreModelObject *)self propertyWasSet:@"primaryHomeUUID"])
  {
    v16 = 0;
    goto LABEL_14;
  }
  v11 = [(HMDHomeManagerModel *)self primaryHomeUUID];

  if (!v11)
  {
    uint64_t v18 = [MEMORY[0x263EFF9D0] null];
    goto LABEL_9;
  }
  id v12 = objc_alloc(MEMORY[0x263F08C38]);
  v13 = [(HMDHomeManagerModel *)self primaryHomeUUID];
  v14 = (void *)[v12 initWithUUIDString:v13];

  if (v14)
  {
    v15 = +[HMDHomeManagerHomeModel deriveUUIDFromHomeUUID:v14];
    id v27 = 0;
    v16 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v15 ofModelType:objc_opt_class() error:&v27];
    id v17 = v27;

    if (!v16 || v17)
    {
      v20 = (void *)MEMORY[0x230FBD990]();
      v21 = self;
      v22 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        v23 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543874;
        v29 = v23;
        __int16 v30 = 2112;
        v31 = v14;
        __int16 v32 = 2112;
        id v33 = v17;
        _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_FAULT, "%{public}@Submitting ABC event for failure: Unable to find NSManagedObject for home manager home with UUID %@: %@", buf, 0x20u);
      }
      v24 = [[HMDAssertionLogEvent alloc] initWithReason:@"Unable to find NSManagedObject for home manager home with UUID %@: %@", v14, v17];
      v25 = +[HMDMetricsManager sharedLogEventSubmitter];
      [v25 submitLogEvent:v24];
    }
  }
  else
  {
    v16 = 0;
  }

LABEL_14:
  return v16;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 isEqualToString:@"primaryHomeUUID"])
  {
    v11 = [v8 primaryHome];
    id v12 = [v11 handle];
    v13 = [v12 homeUUID];
    uint64_t v14 = [v13 UUIDString];
    v15 = (void *)v14;
    v16 = (void *)*MEMORY[0x263EFFD08];
    if (v14) {
      v16 = (void *)v14;
    }
    id v17 = v16;
  }
  else if ([v9 isEqualToString:@"cloudZoneInformation"])
  {
    id v17 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDHomeManagerModel;
    id v17 = [(HMDBackingStoreModelObject *)&v19 cd_generateValueForModelObjectFromManagedObject:v8 modelObjectField:v9 modelFieldInfo:v10];
  }

  return v17;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return 0;
}

@end