@interface HMDActionSetModel
+ (Class)cd_entityClass;
+ (NSString)cd_parentReferenceName;
+ (id)cd_getMKFActionSetFromActionSet:(id)a3;
+ (id)cd_getMKFActionSetFromActionSetUUID:(id)a3;
+ (id)properties;
@end

@implementation HMDActionSetModel

+ (id)properties
{
  if (properties_onceToken_30523 != -1) {
    dispatch_once(&properties_onceToken_30523, &__block_literal_global_478);
  }
  v2 = (void *)properties__properties_30524;
  return v2;
}

void __31__HMDActionSetModel_properties__block_invoke()
{
  v6[3] = *MEMORY[0x263EF8340];
  v5[0] = @"name";
  v0 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[0] = v0;
  v5[1] = @"type";
  v1 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[1] = v1;
  v5[2] = @"lastExecutionDate";
  v2 = +[HMDBackingStoreModelObjectStorageInfo infoWithClass:objc_opt_class()];
  v6[2] = v2;
  uint64_t v3 = [NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];
  v4 = (void *)properties__properties_30524;
  properties__properties_30524 = v3;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)@"home";
}

+ (id)cd_getMKFActionSetFromActionSet:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  v5 = v4;
  id v16 = 0;
  v6 = +[HMDBackingStore cdlsFetchManagedObjectWithUUID:v4 ofManagedObjectType:objc_opt_class() error:&v16];
  id v7 = v16;
  v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v14 = v6;
  }
  else
  {
    v10 = (void *)MEMORY[0x230FBD990]();
    id v11 = a1;
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      __int16 v19 = 2112;
      v20 = v5;
      __int16 v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFActionSet for actionSet UUID %@: %@", buf, 0x20u);
    }
    id v14 = 0;
  }

  return v14;
}

+ (id)cd_getMKFActionSetFromActionSetUUID:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];

  v6 = objc_msgSend(v4, "cd_getMKFActionSetFromActionSet:", v5);

  return v6;
}

@end