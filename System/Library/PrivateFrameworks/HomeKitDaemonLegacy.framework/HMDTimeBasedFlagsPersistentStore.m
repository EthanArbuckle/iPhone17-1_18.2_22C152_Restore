@interface HMDTimeBasedFlagsPersistentStore
- (HMDPersistentStore)persistentStore;
- (HMDTimeBasedFlagsPersistentStore)initWithPersistentStore:(id)a3;
- (id)unarchive;
- (id)unarchiveLegacyEventFlags;
- (void)archiveDictionary:(id)a3;
@end

@implementation HMDTimeBasedFlagsPersistentStore

- (void).cxx_destruct
{
}

- (HMDPersistentStore)persistentStore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_persistentStore);
  return (HMDPersistentStore *)WeakRetained;
}

- (id)unarchiveLegacyEventFlags
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = (id)eventFlagsDataStorePath;
  v4 = [(HMDTimeBasedFlagsPersistentStore *)self persistentStore];
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:3];
  v7 = objc_msgSend(v5, "setWithArray:", v6, v10, v11);
  v8 = [v4 unarchiveDictionaryWithPath:v3 allowedClasses:v7 forKey:@"HMDEventFlagsDataStoreKey"];

  return v8;
}

- (id)unarchive
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v3 = (id)eventFlagsDataStorePath;
  v4 = +[HMDTimeBasedFlagsManager allowedSpecifierClasses];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  v21[2] = objc_opt_class();
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  v6 = [v4 setByAddingObjectsFromArray:v5];

  v7 = [(HMDTimeBasedFlagsPersistentStore *)self persistentStore];
  v8 = [v7 unarchiveDictionaryWithPath:v3 allowedClasses:v6 forKey:@"HMDTimeBasedFlagsDataStore"];

  v9 = (void *)MEMORY[0x1D9452090]();
  uint64_t v10 = self;
  uint64_t v11 = HMFGetOSLogHandle();
  uint64_t v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = HMFGetLogIdentifier();
      int v17 = 138543618;
      v18 = v13;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Unarchived flags store: %@", (uint8_t *)&v17, 0x16u);
    }
    v14 = [v8 objectForKeyedSubscript:@"HMDTimeBasedFlagsArchivedFlagsKey"];
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v15 = HMFGetLogIdentifier();
      int v17 = 138543362;
      v18 = v15;
      _os_log_impl(&dword_1D49D5000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@No time-based flag archive found", (uint8_t *)&v17, 0xCu);
    }
    v14 = 0;
  }

  return v14;
}

- (void)archiveDictionary:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v10 = [v4 dictionary];
  v6 = (void *)[v5 copy];

  [v10 setObject:v6 forKeyedSubscript:@"HMDTimeBasedFlagsArchivedFlagsKey"];
  id v7 = (id)eventFlagsDataStorePath;
  v8 = [(HMDTimeBasedFlagsPersistentStore *)self persistentStore];
  id v9 = (id)[v8 archiveDictionary:v10 withPath:v7 forKey:@"HMDTimeBasedFlagsDataStore"];
}

- (HMDTimeBasedFlagsPersistentStore)initWithPersistentStore:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDTimeBasedFlagsPersistentStore;
  id v5 = [(HMDTimeBasedFlagsPersistentStore *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_persistentStore, v4);
  }

  return v6;
}

@end