@interface HMDMediaAccessoryModel
+ (Class)cd_entityClass;
+ (id)cd_getMKFMediaAccessoryFromAccessory:(id)a3;
+ (id)cd_getMKFMediaAccessoryFromAccessoryUUID:(id)a3;
+ (id)properties;
@end

@implementation HMDMediaAccessoryModel

+ (id)properties
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__HMDMediaAccessoryModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_92833 != -1) {
    dispatch_once(&properties_onceToken_92833, block);
  }
  v2 = (void *)properties__properties_92834;
  return v2;
}

void __36__HMDMediaAccessoryModel_properties__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263EFF9A0];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___HMDMediaAccessoryModel;
  v2 = objc_msgSendSuper2(&v5, sel_properties);
  uint64_t v3 = [v1 dictionaryWithDictionary:v2];
  v4 = (void *)properties__properties_92834;
  properties__properties_92834 = v3;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)cd_getMKFMediaAccessoryFromAccessory:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!v4) {
    _HMFPreconditionFailure();
  }
  objc_super v5 = v4;
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
      _os_log_impl(&dword_22F52A000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find mkfMediaAccessory for accessory with UUID %@: %@", buf, 0x20u);
    }
    id v14 = 0;
  }

  return v14;
}

+ (id)cd_getMKFMediaAccessoryFromAccessoryUUID:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v3];

  v6 = objc_msgSend(v4, "cd_getMKFMediaAccessoryFromAccessory:", v5);

  return v6;
}

@end