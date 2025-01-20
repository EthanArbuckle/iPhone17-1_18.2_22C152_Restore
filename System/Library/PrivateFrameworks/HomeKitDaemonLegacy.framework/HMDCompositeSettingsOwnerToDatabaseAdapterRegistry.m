@interface HMDCompositeSettingsOwnerToDatabaseAdapterRegistry
- (HMDCompositeSettingsOwnerToDatabaseAdapterRegistry)init;
- (id)databaseAdapterForUUID:(id)a3;
- (void)createDatabaseAdapterIfNotExistForUUID:(id)a3 homeUUID:(id)a4 accessory:(id)a5 workQueue:(id)a6 zoneName:(id)a7;
- (void)removeZoneWithZoneName:(id)a3 uuid:(id)a4 workQueue:(id)a5;
@end

@implementation HMDCompositeSettingsOwnerToDatabaseAdapterRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingOwnerToZoneManagerTable, 0);
  objc_storeStrong((id *)&self->_settingOwnerToDatabaseAdapterTable, 0);
}

- (void)removeZoneWithZoneName:(id)a3 uuid:(id)a4 workQueue:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1D9452090]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v19 = 138543618;
    v20 = v14;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_impl(&dword_1D49D5000, v13, OS_LOG_TYPE_INFO, "%{public}@Asked to remove zone:%@", (uint8_t *)&v19, 0x16u);
  }
  p_lock = &v12->_lock;
  os_unfair_lock_lock_with_options();
  v16 = [(NSMapTable *)v12->_settingOwnerToZoneManagerTable objectForKey:v9];
  os_unfair_lock_unlock(p_lock);
  if (!v16)
  {
    v17 = [HMDCompositeSettingsZoneManager alloc];
    v18 = +[HMDDatabase defaultDatabase];
    v16 = [(HMDCompositeSettingsZoneManager *)v17 initWithDatabase:v18 workQueue:v10 zoneName:v8 createZoneIfNotExists:0];
  }
  [(HMDCompositeSettingsZoneManager *)v16 remove];
}

- (void)createDatabaseAdapterIfNotExistForUUID:(id)a3 homeUUID:(id)a4 accessory:(id)a5 workQueue:(id)a6 zoneName:(id)a7
{
  id v28 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  settingOwnerToDatabaseAdapterTable = self->_settingOwnerToDatabaseAdapterTable;
  v18 = (void *)[v28 copy];
  int v19 = [(NSMapTable *)settingOwnerToDatabaseAdapterTable objectForKey:v18];

  id v21 = objc_getProperty(self, v20, 24, 1);
  id v22 = [v21 objectForKey:v12];

  if (!v22)
  {
    uint64_t v23 = [HMDCompositeSettingsZoneManager alloc];
    v24 = +[HMDDatabase defaultDatabase];
    id v22 = [(HMDCompositeSettingsZoneManager *)v23 initWithDatabase:v24 workQueue:v14 zoneName:v15 createZoneIfNotExists:1];

    [(NSMapTable *)self->_settingOwnerToZoneManagerTable setObject:v22 forKey:v12];
  }
  if (!v19)
  {
    v25 = [[HMDCompositeSettingsLegacyDatabaseAdapter alloc] initWithZoneManager:v22 modelClass:objc_opt_class()];
    id v27 = objc_getProperty(self, v26, 16, 1);
    [v27 setObject:v25 forKey:v28];
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)databaseAdapterForUUID:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (self) {
    id Property = objc_getProperty(self, v6, 16, 1);
  }
  else {
    id Property = 0;
  }
  id v8 = Property;
  id v9 = (void *)[v4 copy];
  id v10 = [v8 objectForKey:v9];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (HMDCompositeSettingsOwnerToDatabaseAdapterRegistry)init
{
  v8.receiver = self;
  v8.super_class = (Class)HMDCompositeSettingsOwnerToDatabaseAdapterRegistry;
  v2 = [(HMDCompositeSettingsOwnerToDatabaseAdapterRegistry *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    settingOwnerToDatabaseAdapterTable = v2->_settingOwnerToDatabaseAdapterTable;
    v2->_settingOwnerToDatabaseAdapterTable = (NSMapTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    settingOwnerToZoneManagerTable = v2->_settingOwnerToZoneManagerTable;
    v2->_settingOwnerToZoneManagerTable = (NSMapTable *)v5;
  }
  return v2;
}

@end