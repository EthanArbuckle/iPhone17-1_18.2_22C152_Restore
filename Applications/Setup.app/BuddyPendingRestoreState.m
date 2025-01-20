@interface BuddyPendingRestoreState
- (BOOL)allowCellularNetwork;
- (BOOL)forceSoftwareUpdateRestore;
- (BOOL)useLatestSnapshot;
- (BuddyExistingSettings)existingSettings;
- (BuddyPendingRestoreState)initWithExistingSettings:(id)a3 setupMethod:(id)a4;
- (BuddySetupMethod)setupMethod;
- (NSDate)snapshotDate;
- (RestorableBackupItem)attemptedBackupItem;
- (RestorableBackupItem)backupItem;
- (void)clearBackupItem;
- (void)setAllowCellularNetwork:(BOOL)a3;
- (void)setAttemptedBackupItem:(id)a3;
- (void)setBackupItem:(id)a3;
- (void)setBackupItem:(id)a3 updateBackupMetadata:(BOOL)a4 prefetchAccounts:(BOOL)a5;
- (void)setExistingSettings:(id)a3;
- (void)setForceSoftwareUpdateRestore:(BOOL)a3;
- (void)setSetupMethod:(id)a3;
- (void)setSnapshotDate:(id)a3;
- (void)setUseLatestSnapshot:(BOOL)a3;
@end

@implementation BuddyPendingRestoreState

- (BuddyPendingRestoreState)initWithExistingSettings:(id)a3 setupMethod:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  id v5 = v12;
  id v12 = 0;
  v9.receiver = v5;
  v9.super_class = (Class)BuddyPendingRestoreState;
  v6 = [(BuddyPendingRestoreState *)&v9 init];
  id v12 = v6;
  objc_storeStrong(&v12, v6);
  if (v6)
  {
    objc_storeStrong((id *)v12 + 5, location[0]);
    objc_storeStrong((id *)v12 + 6, obj);
  }
  v7 = (BuddyPendingRestoreState *)v12;
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v7;
}

- (void)setBackupItem:(id)a3 updateBackupMetadata:(BOOL)a4 prefetchAccounts:(BOOL)a5
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v29 = a4;
  BOOL v28 = a5;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [location[0] snapshot];
    id v8 = [v7 systemVersion];
    sub_10004BB7C((uint64_t)buf, (uint64_t)v8);
    _os_log_impl((void *)&_mh_execute_header, oslog, v26, "Set pending backup item from OS: %{public}@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [v31 setBackupItem:location[0]];
  id v9 = [v31 setupMethod];
  [v9 setDataTransferMethod:1];

  id v10 = [location[0] snapshot];
  id v11 = [v10 date];
  [v31 setSnapshotDate:v11];

  [v31 setUseLatestSnapshot:0];
  [v31 setForceSoftwareUpdateRestore:0];
  if (location[0])
  {
    if (v28)
    {
      id v12 = [v31 backupItem];
      [v12 prefetchAccounts];
    }
    if (v29)
    {
      id v13 = [location[0] backupUDID];
      BOOL v14 = 0;
      if (v13) {
        BOOL v14 = [location[0] snapshotID] != 0;
      }

      if (v14)
      {
        v15 = dispatch_get_global_queue(25, 0);
        block = _NSConcreteStackBlock;
        int v19 = -1073741824;
        int v20 = 0;
        v21 = sub_1001751E4;
        v22 = &unk_1002B12F0;
        id v23 = v31;
        id v24 = location[0];
        dispatch_async(v15, &block);

        objc_storeStrong(&v24, 0);
        objc_storeStrong(&v23, 0);
      }
      else
      {
        os_log_t v17 = (os_log_t)(id)_BYLoggingFacility();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          id v16 = [location[0] backupUDID];
          sub_100063D38((uint64_t)v32, (uint64_t)v16, (uint64_t)[location[0] snapshotID]);
          _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Unable to fetch backup metadata for backup UDID %@ and snapshot ID %ld", v32, 0x16u);
        }
        objc_storeStrong((id *)&v17, 0);
      }
    }
    int v25 = 0;
  }
  else
  {
    int v25 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)clearBackupItem
{
  id v10 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    os_log_type_t v3 = v8;
    sub_10004B24C(v7);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Clearing pending backup item...", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(BuddyPendingRestoreState *)v10 setBackupItem:0];
  [(BuddyPendingRestoreState *)v10 setSnapshotDate:0];
  [(BuddyPendingRestoreState *)v10 setUseLatestSnapshot:0];
  [(BuddyPendingRestoreState *)v10 setForceSoftwareUpdateRestore:0];
  [(BuddyPendingRestoreState *)v10 setAllowCellularNetwork:0];
  v4 = [(BuddyPendingRestoreState *)v10 setupMethod];
  id v5 = [(BuddySetupMethod *)v4 dataTransferMethod];

  if (v5 == (id)1)
  {
    v6 = [(BuddyPendingRestoreState *)v10 setupMethod];
    [(BuddySetupMethod *)v6 setDataTransferMethod:0];
  }
}

- (void)setAttemptedBackupItem:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v4->_attemptedBackupItem, location[0]);
  objc_storeStrong(location, 0);
}

- (RestorableBackupItem)attemptedBackupItem
{
  return self->_attemptedBackupItem;
}

- (RestorableBackupItem)backupItem
{
  return self->_backupItem;
}

- (void)setBackupItem:(id)a3
{
}

- (NSDate)snapshotDate
{
  return self->_snapshotDate;
}

- (void)setSnapshotDate:(id)a3
{
}

- (BOOL)useLatestSnapshot
{
  return self->_useLatestSnapshot;
}

- (void)setUseLatestSnapshot:(BOOL)a3
{
  self->_useLatestSnapshot = a3;
}

- (BOOL)forceSoftwareUpdateRestore
{
  return self->_forceSoftwareUpdateRestore;
}

- (void)setForceSoftwareUpdateRestore:(BOOL)a3
{
  self->_forceSoftwareUpdateRestore = a3;
}

- (BOOL)allowCellularNetwork
{
  return self->_allowCellularNetwork;
}

- (void)setAllowCellularNetwork:(BOOL)a3
{
  self->_allowCellularNetwork = a3;
}

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
}

- (void).cxx_destruct
{
}

@end