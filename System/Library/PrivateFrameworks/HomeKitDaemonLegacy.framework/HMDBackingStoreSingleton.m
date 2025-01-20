@interface HMDBackingStoreSingleton
+ (HMFVersion)dataVersion;
+ (id)logCategory;
+ (id)sharedInstance;
+ (void)resetClassMappings;
+ (void)resetSchemaHash;
+ (void)setClass:(Class)a3 forClassName:(id)a4;
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

- (NSMapTable)classToNameTransform
{
  return self->_classToNameTransform;
}

+ (id)sharedInstance
{
  return (id)_sharedInstance;
}

+ (HMFVersion)dataVersion
{
  return (HMFVersion *)+[HMDHomeKitVersion currentVersion];
}

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
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_homeManager = &self->_homeManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_homeManager);

  if (WeakRetained)
  {
    v7 = (void *)MEMORY[0x1D9452090]();
    v8 = self;
    v9 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10 = HMFGetLogIdentifier();
      int v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1D49D5000, v9, OS_LOG_TYPE_FAULT, "%{public}@HMDBackingStoreSingleton's homeManager is being set more than once per process lifecycle", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_storeWeak((id *)p_homeManager, v4);
}

- (id)resetBackingStore
{
  v2 = [(HMDBackingStoreSingleton *)self local];
  v3 = [v2 flush:1];

  return v3;
}

- (id)flushBackingStore
{
  v2 = [(HMDBackingStoreSingleton *)self local];
  v3 = [v2 flush:0];

  return v3;
}

- (id)schemaHashForObject:(id)a3
{
  id v4 = a3;
  v5 = [(HMDBackingStoreSingleton *)self objectPropertyHashLookup];
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
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)HMDBackingStoreSingleton;
  v2 = [(HMDBackingStoreSingleton *)&v24 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    objectLookup = v2->_objectLookup;
    v2->_objectLookup = (NSMapTable *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    classToNameTransform = v2->_classToNameTransform;
    v2->_classToNameTransform = (NSMapTable *)v5;

    uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    nameToClassTransform = v2->_nameToClassTransform;
    v2->_nameToClassTransform = (NSMapTable *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    objectPropertyHashLookup = v2->_objectPropertyHashLookup;
    v2->_objectPropertyHashLookup = (NSMapTable *)v9;

    int v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v2->_queue;
    v2->_queue = v11;

    [(NSOperationQueue *)v2->_queue setMaxConcurrentOperationCount:1];
    if (isWatch())
    {
      id v13 = (id)sqlitePath;
      +[HMDBackingStoreLocal cleanDatastoreFilesAt:v13 everything:1];
    }
    else
    {
      v14 = [HMDBackingStoreLocal alloc];
      id v15 = (id)sqlitePath;
      uint64_t v16 = [(HMDBackingStoreLocal *)v14 initWithDatastore:v15];
      local = v2->_local;
      v2->_local = (HMDBackingStoreLocal *)v16;

      if (!v2->_local)
      {
        v18 = (void *)MEMORY[0x1D9452090]();
        v19 = v2;
        v20 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          v21 = HMFGetLogIdentifier();
          *(_DWORD *)buf = 138543362;
          v26 = v21;
          _os_log_impl(&dword_1D49D5000, v20, OS_LOG_TYPE_ERROR, "%{public}@Unable to create our local storage.", buf, 0xCu);
        }
      }
    }
    v22 = v2;
  }

  return v2;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t50_161665 != -1) {
    dispatch_once(&logCategory__hmf_once_t50_161665, &__block_literal_global_275_161666);
  }
  v2 = (void *)logCategory__hmf_once_v51_161667;
  return v2;
}

uint64_t __39__HMDBackingStoreSingleton_logCategory__block_invoke()
{
  uint64_t v0 = HMFCreateOSLogHandle();
  uint64_t v1 = logCategory__hmf_once_v51_161667;
  logCategory__hmf_once_v51_161667 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (void)resetSchemaHash
{
  id v3 = +[HMDBackingStoreSingleton sharedInstance];
  v2 = [v3 objectPropertyHashLookup];
  [v2 removeAllObjects];
}

+ (void)resetClassMappings
{
  id v4 = +[HMDBackingStoreSingleton sharedInstance];
  v2 = [v4 nameToClassTransform];
  [v2 removeAllObjects];

  id v3 = [v4 classToNameTransform];
  [v3 removeAllObjects];
}

+ (void)setClass:(Class)a3 forClassName:(id)a4
{
  id v14 = a4;
  uint64_t v5 = +[HMDBackingStoreSingleton sharedInstance];
  v6 = [v5 nameToClassTransform];
  uint64_t v7 = [v6 objectForKey:v14];

  if (v7)
  {
    id v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3B8];
    v12 = [NSString stringWithFormat:@"Only one class name transformation for %@ may be specified in the BackingStore", v14];
    id v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

    objc_exception_throw(v13);
  }
  v8 = [v5 nameToClassTransform];
  [v8 setObject:a3 forKey:v14];

  uint64_t v9 = [v5 classToNameTransform];
  [v9 setObject:v14 forKey:a3];
}

+ (void)start
{
  if (start_onceToken != -1) {
    dispatch_once(&start_onceToken, &__block_literal_global_261);
  }
}

void __33__HMDBackingStoreSingleton_start__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1D9452090]();
  uint64_t v1 = (void *)[objc_alloc(MEMORY[0x1E4F654E0]) initWithName:@"com.apple.homed.sqlite3-init."];
  v2 = objc_alloc_init(HMDBackingStoreSingleton);
  id v3 = (void *)_sharedInstance;
  _sharedInstance = (uint64_t)v2;
}

@end