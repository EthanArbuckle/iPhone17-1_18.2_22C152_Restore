@interface ACUIRemoteDeviceSettingsController
- (ACUIRemoteDeviceSettingsController)initWithRemoteDevice:(id)a3;
- (NPSDomainAccessor)domainAccessor;
- (NPSManager)manager;
- (id)_keyToSync;
- (int)_pollIntervalReturningExists:(BOOL *)a3;
- (int)pollInterval;
- (int)syncStyle;
- (void)_synchronizeDomain:(id)a3 forKey:(id)a4;
- (void)_synchronizeDomain:(id)a3 forKeys:(id)a4;
- (void)setDefaultPollIntervalIfNeeded;
- (void)setDomainAccessor:(id)a3;
- (void)setManager:(id)a3;
- (void)setPollInterval:(int)a3;
- (void)setSyncStyle:(int)a3;
@end

@implementation ACUIRemoteDeviceSettingsController

- (id)_keyToSync
{
  v4 = self;
  SEL v3 = a2;
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", off_1E8A0[0], off_1E898[0], off_1E8A8, 0);
}

- (ACUIRemoteDeviceSettingsController)initWithRemoteDevice:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  SEL v3 = v13;
  v13 = 0;
  v11.receiver = v3;
  v11.super_class = (Class)ACUIRemoteDeviceSettingsController;
  v13 = [(ACUIRemoteDeviceSettingsController *)&v11 init];
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    uint64_t v4 = objc_opt_new();
    manager = v13->_manager;
    v13->_manager = (NPSManager *)v4;

    id v6 = objc_alloc((Class)NPSDomainAccessor);
    v7 = (NPSDomainAccessor *)[v6 initWithDomain:off_1E890[0] pairedDevice:location[0]];
    domainAccessor = v13->_domainAccessor;
    v13->_domainAccessor = v7;
  }
  v10 = v13;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v10;
}

- (int)syncStyle
{
  return -[NPSDomainAccessor integerForKey:](self->_domainAccessor, "integerForKey:", off_1E898[0], a2, self);
}

- (void)setSyncStyle:(int)a3
{
}

- (int)_pollIntervalReturningExists:(BOOL *)a3
{
  return [(NPSDomainAccessor *)self->_domainAccessor integerForKey:off_1E8A0[0] keyExistsAndHasValidFormat:a3];
}

- (int)pollInterval
{
  return -[ACUIRemoteDeviceSettingsController _pollIntervalReturningExists:](self, "_pollIntervalReturningExists:", 0, a2, self);
}

- (void)setPollInterval:(int)a3
{
}

- (void)setDefaultPollIntervalIfNeeded
{
  v5 = self;
  SEL v4 = a2;
  char v3 = 0;
  [(ACUIRemoteDeviceSettingsController *)self _pollIntervalReturningExists:&v3];
  if ((v3 & 1) == 0)
  {
    os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_27FC((uint64_t)v6, (uint64_t)"-[ACUIRemoteDeviceSettingsController setDefaultPollIntervalIfNeeded]", 70, dword_1E8B0);
      _os_log_impl(&def_10DA8, oslog, OS_LOG_TYPE_DEFAULT, "%s (%d) \"No fetch setting for device yet, syncing default value: %d\"", v6, 0x18u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(ACUIRemoteDeviceSettingsController *)v5 setPollInterval:dword_1E8B0];
  }
}

- (void)_synchronizeDomain:(id)a3 forKey:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v6 = v10;
  id v5 = location[0];
  v7 = +[NSSet setWithObject:v8];
  -[ACUIRemoteDeviceSettingsController _synchronizeDomain:forKeys:](v6, "_synchronizeDomain:forKeys:", v5);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (void)_synchronizeDomain:(id)a3 forKeys:(id)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = [(NPSDomainAccessor *)v14->_domainAccessor synchronize];
  if (v11)
  {
    os_log_t oslog = (os_log_t)(id)_ACUILogSystem();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      id v4 = [(NPSDomainAccessor *)v14->_domainAccessor domain];
      sub_2C04((uint64_t)v17, (uint64_t)"-[ACUIRemoteDeviceSettingsController _synchronizeDomain:forKeys:]", 82, (uint64_t)v4, (uint64_t)off_1E8A0[0]);
      _os_log_error_impl(&def_10DA8, oslog, type, "%s (%d) @\"Failed to synchronize domain: %{public}@ key: %{public}@\"", v17, 0x26u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    os_log_t v8 = (os_log_t)(id)_ACUILogSystem();
    os_log_type_t v7 = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      sub_2C04((uint64_t)v16, (uint64_t)"-[ACUIRemoteDeviceSettingsController _synchronizeDomain:forKeys:]", 84, (uint64_t)location[0], (uint64_t)v12);
      _os_log_debug_impl(&def_10DA8, v8, v7, "%s (%d) @\"Successfully synched domain %{public}@ for keys: %{public}@\"", v16, 0x26u);
    }
    objc_storeStrong((id *)&v8, 0);
    os_log_t v6 = (os_log_t)(id)_ACUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      sub_2C84((uint64_t)v15, (uint64_t)"-[ACUIRemoteDeviceSettingsController _synchronizeDomain:forKeys:]", 85);
      _os_log_debug_impl(&def_10DA8, v6, OS_LOG_TYPE_DEBUG, "%s (%d) @\"Synchronizing NanoDomain to device...\"", v15, 0x12u);
    }
    objc_storeStrong((id *)&v6, 0);
    [(NPSManager *)v14->_manager synchronizeNanoDomain:location[0] keys:v12];
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (NPSManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
}

- (NPSDomainAccessor)domainAccessor
{
  return self->_domainAccessor;
}

- (void)setDomainAccessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end