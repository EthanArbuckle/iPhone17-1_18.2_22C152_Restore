@interface HMDCompositeSettingsOwnerToDatabaseAdapterRegistry
- (HMDCompositeSettingsOwnerToDatabaseAdapterRegistry)init;
- (id)databaseAdapterForUUID:(id)a3;
- (void)createDatabaseAdapterIfNotExistForUUID:(id)a3 homeUUID:(id)a4 accessory:(id)a5 workQueue:(id)a6 zoneName:(id)a7;
@end

@implementation HMDCompositeSettingsOwnerToDatabaseAdapterRegistry

- (void).cxx_destruct
{
}

- (void)createDatabaseAdapterIfNotExistForUUID:(id)a3 homeUUID:(id)a4 accessory:(id)a5 workQueue:(id)a6 zoneName:(id)a7
{
  id v27 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  settingOwnerToDatabaseAdapterTable = self->_settingOwnerToDatabaseAdapterTable;
  v18 = (void *)[v27 copy];
  v19 = [(NSMapTable *)settingOwnerToDatabaseAdapterTable objectForKey:v18];

  if (!v19)
  {
    v20 = +[HMDCoreData sharedInstance];
    v21 = [v20 contextWithHomeUUID:v12];

    v22 = [HMDCompositeSettingsHH2DatabaseAdapter alloc];
    v23 = [MEMORY[0x263F08A00] defaultCenter];
    v24 = [(HMDCompositeSettingsHH2DatabaseAdapter *)v22 initWithAccessory:v13 homeID:v12 workingManagedObjectContext:v21 queue:v14 notificationCenter:v23];

    id v26 = objc_getProperty(self, v25, 16, 1);
    [v26 setObject:v24 forKey:v27];
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
  v9 = (void *)[v4 copy];
  v10 = [v8 objectForKey:v9];

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (HMDCompositeSettingsOwnerToDatabaseAdapterRegistry)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDCompositeSettingsOwnerToDatabaseAdapterRegistry;
  v2 = [(HMDCompositeSettingsOwnerToDatabaseAdapterRegistry *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    settingOwnerToDatabaseAdapterTable = v2->_settingOwnerToDatabaseAdapterTable;
    v2->_settingOwnerToDatabaseAdapterTable = (NSMapTable *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

@end