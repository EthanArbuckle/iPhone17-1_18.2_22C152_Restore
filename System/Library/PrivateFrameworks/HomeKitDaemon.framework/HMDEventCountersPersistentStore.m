@interface HMDEventCountersPersistentStore
- (HMDEventCountersPersistentStore)initWithPersistentStore:(id)a3;
- (HMDPersistentStore)persistentStore;
- (id)unarchive;
- (void)archiveDictionary:(id)a3;
@end

@implementation HMDEventCountersPersistentStore

- (void).cxx_destruct
{
}

- (HMDPersistentStore)persistentStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistentStore);
  return (HMDPersistentStore *)WeakRetained;
}

- (id)unarchive
{
  v30[3] = *MEMORY[0x263EF8340];
  id v3 = (id)eventCountersDataStoreLegacyPath;
  v4 = [MEMORY[0x263F08850] defaultManager];
  int v5 = [v4 fileExistsAtPath:v3];

  if (v5)
  {
    v6 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v25 = 0;
    [v6 removeItemAtPath:v3 error:&v25];
  }
  id v7 = (id)eventCountersDataStorePath;
  v8 = +[HMDEventCountersManager allowedSpecifierClasses];
  v30[0] = objc_opt_class();
  v30[1] = objc_opt_class();
  v30[2] = objc_opt_class();
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:3];
  v10 = [v8 setByAddingObjectsFromArray:v9];

  v11 = [(HMDEventCountersPersistentStore *)self persistentStore];
  v12 = [v11 unarchiveDictionaryWithPath:v7 allowedClasses:v10 forKey:@"HMDEventCountersDataStoreKey"];

  v13 = (void *)MEMORY[0x230FBD990]();
  v14 = self;
  v15 = HMFGetOSLogHandle();
  v16 = v15;
  if (!v12)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v22 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Archived event counters not found", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v17 = HMFGetLogIdentifier();
    *(_DWORD *)buf = 138543618;
    v27 = v17;
    __int16 v28 = 2112;
    v29 = v12;
    _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_DEBUG, "%{public}@Unarchived event counters: %@", buf, 0x16u);
  }
  v18 = [v12 objectForKeyedSubscript:@"HMDEventCountersArchivedEventCountersModifiedDateKey"];
  v19 = [MEMORY[0x263EFF910] date];
  [v19 timeIntervalSinceDate:v18];
  double v21 = v20;

  if (v21 > 86400.0)
  {

LABEL_11:
    v23 = 0;
    goto LABEL_13;
  }
  v23 = [v12 objectForKeyedSubscript:@"HMDEventCountersArchivedEventCountersKey"];

LABEL_13:
  return v23;
}

- (void)archiveDictionary:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v11 = [v4 dictionary];
  v6 = (void *)[v5 copy];

  [v11 setObject:v6 forKeyedSubscript:@"HMDEventCountersArchivedEventCountersKey"];
  id v7 = [MEMORY[0x263EFF910] date];
  [v11 setObject:v7 forKeyedSubscript:@"HMDEventCountersArchivedEventCountersModifiedDateKey"];

  id v8 = (id)eventCountersDataStorePath;
  v9 = [(HMDEventCountersPersistentStore *)self persistentStore];
  id v10 = (id)[v9 archiveDictionary:v11 withPath:v8 forKey:@"HMDEventCountersDataStoreKey"];
}

- (HMDEventCountersPersistentStore)initWithPersistentStore:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDEventCountersPersistentStore;
  id v5 = [(HMDEventCountersPersistentStore *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_persistentStore, v4);
  }

  return v6;
}

@end