@interface HMDBackingStoreSingleton
+ (HMFVersion)dataVersion;
+ (id)logCategory;
+ (id)sharedInstance;
+ (void)start;
- (HMDBackingStoreLocal)local;
- (HMDBackingStoreSingleton)init;
- (HMDHomeManager)homeManager;
- (NSMapTable)classToNameTransform;
- (NSMapTable)nameToClassTransform;
- (NSMapTable)objectLookup;
- (NSMapTable)objectPropertyHashLookup;
- (NSOperationQueue)queue;
- (id)flushBackingStore;
- (id)logIdentifier;
- (id)resetBackingStore;
- (id)schemaHashForObject:(id)a3;
- (void)setHomeManager:(id)a3;
- (void)setLocal:(id)a3;
@end

@implementation HMDBackingStoreSingleton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_local, 0);
  objc_destroyWeak((id *)&self->_homeManager);
  objc_storeStrong((id *)&self->_objectPropertyHashLookup, 0);
  objc_storeStrong((id *)&self->_nameToClassTransform, 0);
  objc_storeStrong((id *)&self->_classToNameTransform, 0);
  objc_storeStrong((id *)&self->_objectLookup, 0);
}

- (NSOperationQueue)queue
{
  return self->_queue;
}

- (void)setLocal:(id)a3
{
}

- (HMDBackingStoreLocal)local
{
  return self->_local;
}

- (HMDHomeManager)homeManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);
  return (HMDHomeManager *)WeakRetained;
}

- (NSMapTable)objectPropertyHashLookup
{
  return self->_objectPropertyHashLookup;
}

- (NSMapTable)nameToClassTransform
{
  return self->_nameToClassTransform;
}

- (NSMapTable)classToNameTransform
{
  return self->_classToNameTransform;
}

- (NSMapTable)objectLookup
{
  return self->_objectLookup;
}

- (id)logIdentifier
{
  return @"BackingStoreSingleton";
}

- (void)setHomeManager:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = (void *)MEMORY[0x230FBD990]();
  v7 = self;
  v8 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = HMFGetLogIdentifier();
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    v12 = NSStringFromSelector(a2);
    int v13 = 138543874;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v11;
    __int16 v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_22F52A000, v8, OS_LOG_TYPE_INFO, "%{public}@-[%@ %@] no-op because CoreData storage is enabled", (uint8_t *)&v13, 0x20u);
  }
}

- (id)resetBackingStore
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990]();
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    int v10 = 138543874;
    v11 = v5;
    __int16 v12 = 2112;
    int v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v8;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@+[%@ %@] no-op because CoreData storage is enabled", (uint8_t *)&v10, 0x20u);
  }
  return 0;
}

- (id)flushBackingStore
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x230FBD990]();
  v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = HMFGetLogIdentifier();
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    int v10 = 138543874;
    v11 = v5;
    __int16 v12 = 2112;
    int v13 = v7;
    __int16 v14 = 2112;
    __int16 v15 = v8;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@+[%@ %@] no-op because CoreData storage is enabled", (uint8_t *)&v10, 0x20u);
  }
  return 0;
}

- (id)schemaHashForObject:(id)a3
{
  id v4 = a3;
  id v5 = [(HMDBackingStoreSingleton *)self objectPropertyHashLookup];
  v6 = [v4 bsoType];
  v7 = [v5 objectForKey:v6];

  if (!v7)
  {
    v7 = [(id)objc_opt_class() bsoSchemaHash];
    v8 = [(HMDBackingStoreSingleton *)self objectPropertyHashLookup];
    v9 = [v4 bsoType];
    [v8 setObject:v7 forKey:v9];
  }
  id v10 = v7;

  return v10;
}

- (HMDBackingStoreSingleton)init
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v23.receiver = self;
  v23.super_class = (Class)HMDBackingStoreSingleton;
  v2 = [(HMDBackingStoreSingleton *)&v23 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    objectLookup = v2->_objectLookup;
    v2->_objectLookup = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    classToNameTransform = v2->_classToNameTransform;
    v2->_classToNameTransform = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    nameToClassTransform = v2->_nameToClassTransform;
    v2->_nameToClassTransform = (NSMapTable *)v7;

    uint64_t v9 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    objectPropertyHashLookup = v2->_objectPropertyHashLookup;
    v2->_objectPropertyHashLookup = (NSMapTable *)v9;

    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    queue = v2->_queue;
    v2->_queue = v11;

    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    isWatch();
    int v13 = [HMDBackingStoreLocal alloc];
    id v14 = (id)sqlitePath;
    uint64_t v15 = [(HMDBackingStoreLocal *)v13 initWithDatastore:v14];
    local = v2->_local;
    v2->_local = (HMDBackingStoreLocal *)v15;

    if (!v2->_local)
    {
      __int16 v17 = (void *)MEMORY[0x230FBD990]();
      v18 = v2;
      uint64_t v19 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = HMFGetLogIdentifier();
        *(_DWORD *)buf = 138543362;
        v25 = v20;
        _os_log_impl(&dword_22F52A000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unable to create our local storage.", buf, 0xCu);
      }
    }
    v21 = v2;
  }

  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t25_231116 != -1) {
    dispatch_once(&logCategory__hmf_once_t25_231116, &__block_literal_global_270_231117);
  }
  v2 = (void *)logCategory__hmf_once_v26_231118;
  return v2;
}

void __39__HMDBackingStoreSingleton_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  v1 = (void *)logCategory__hmf_once_v26_231118;
  logCategory__hmf_once_v26_231118 = v0;
}

+ (id)sharedInstance
{
  return 0;
}

+ (void)start
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x230FBD990]();
  id v4 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = HMFGetLogIdentifier();
    v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    v8 = NSStringFromSelector(a2);
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    __int16 v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_22F52A000, v4, OS_LOG_TYPE_INFO, "%{public}@+[%@ %@] no-op because CoreData storage is enabled", (uint8_t *)&v9, 0x20u);
  }
}

+ (HMFVersion)dataVersion
{
  return (HMFVersion *)+[HMDHomeKitVersion currentVersion];
}

@end