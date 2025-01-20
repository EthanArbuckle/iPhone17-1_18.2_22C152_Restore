@interface BuddySoftwareUpdateRestoreFlow
+ (BOOL)controllerNeedsToRunWithPendingRestoreState:(id)a3 buddyPreferences:(id)a4;
+ (id)allowedFlowItems;
- (BFFSettingsManager)settingsManager;
- (BYSeedProgramManager)seedProgramManager;
- (BuddyRestoreSilentRenewController)silentRenewController;
- (BuddySoftwareUpdateRestoreFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6;
- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4;
- (id)firstItem;
- (id)precedingItemsClasses;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setSeedProgramManager:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)setSilentRenewController:(id)a3;
- (void)startFlowAnimated:(BOOL)a3;
@end

@implementation BuddySoftwareUpdateRestoreFlow

- (BuddySoftwareUpdateRestoreFlow)initWithNavigationController:(id)a3 flowDelegate:(id)a4 flowStarter:(id)a5 dependencyInjector:(id)a6
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id v15 = 0;
  objc_storeStrong(&v15, a6);
  id v9 = v19;
  id v19 = 0;
  v14.receiver = v9;
  v14.super_class = (Class)BuddySoftwareUpdateRestoreFlow;
  v10 = [(BuddyRestoreFlow *)&v14 initWithNavigationController:location[0] flowDelegate:v17 flowStarter:v16 dependencyInjector:v15];
  id v19 = v10;
  objc_storeStrong(&v19, v10);
  if (v10)
  {
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    v20[2] = objc_opt_class();
    v20[3] = objc_opt_class();
    v11 = +[NSArray arrayWithObjects:v20 count:4];
    [v19 setClassList:v11];
  }
  v12 = (BuddySoftwareUpdateRestoreFlow *)v19;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v19, 0);
  return v12;
}

- (id)precedingItemsClasses
{
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  v5[2] = objc_opt_class();
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 3, a2, self);
}

- (void)startFlowAnimated:(BOOL)a3
{
  v22 = self;
  SEL v21 = a2;
  BOOL v20 = a3;
  v3 = [(BuddySoftwareUpdateRestoreFlow *)self seedProgramManager];
  id v19 = [(BYSeedProgramManager *)v3 currentEnrollmentMetadata];

  id v18 = [v19 bySeedProgramManager_valueForProgramKey];
  id v17 = [v19 bySeedProgramManager_valueForAssetAudienceKey];
  id location = [v19 bySeedProgramManager_valueForProgramIDKey];
  if (v18 && v17)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v14 = 2;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      v4 = oslog;
      os_log_type_t v5 = v14;
      sub_10004B24C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v4, v5, "Beta Re-Enroll: Post-software update stashing enrollment info", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    v6 = [(BuddySoftwareUpdateRestoreFlow *)v22 settingsManager];
    [(BFFSettingsManager *)v6 setSeedEnrollmentProgramName:v18 assetAudience:v17 programID:location];
  }
  else
  {
    os_log_t v12 = (os_log_t)(id)_BYLoggingFacility();
    char v11 = 2;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v7 = v12;
      os_log_type_t v8 = v11;
      sub_10004B24C(v10);
      _os_log_debug_impl((void *)&_mh_execute_header, v7, v8, "Beta Re-Enroll: Post-software update found no seed enrollment info", v10, 2u);
    }
    objc_storeStrong((id *)&v12, 0);
  }
  v9.receiver = v22;
  v9.super_class = (Class)BuddySoftwareUpdateRestoreFlow;
  [(BuddySoftwareUpdateRestoreFlow *)&v9 startFlowAnimated:v20];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
}

- (id)firstItem
{
  v6 = self;
  location[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)BuddySoftwareUpdateRestoreFlow;
  location[0] = [(BuddyRestoreFlow *)&v4 firstItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(BuddySoftwareUpdateRestoreFlow *)v6 setSilentRenewController:location[0]];
  }
  id v2 = location[0];
  objc_storeStrong(location, 0);
  return v2;
}

- (id)controllerFollowingControllerClass:(Class)a3 requestedNext:(Class)a4
{
  v10 = self;
  location[3] = (id)a2;
  id location[2] = a3;
  location[1] = a4;
  v8.receiver = self;
  v8.super_class = (Class)BuddySoftwareUpdateRestoreFlow;
  location[0] = [(BuddyRestoreFlow *)&v8 controllerFollowingControllerClass:a3 requestedNext:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v4 = [(BuddySoftwareUpdateRestoreFlow *)v10 silentRenewController];
    unsigned __int8 v5 = [(BuddyRestoreSilentRenewController *)v4 renewSucceeded];
    [location[0] setForceReauthentication:(v5 ^ 1) & 1];
  }
  if ([location[0] conformsToProtocol:&OBJC_PROTOCOL___BuddyRestoreFlowItem]) {
    [location[0] setSoftwareUpdateDidOccur:1];
  }
  id v6 = location[0];
  objc_storeStrong(location, 0);
  return v6;
}

+ (id)allowedFlowItems
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  return +[NSArray arrayWithObjects:v3 count:4];
}

+ (BOOL)controllerNeedsToRunWithPendingRestoreState:(id)a3 buddyPreferences:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v25 = 0;
  objc_storeStrong(&v25, a4);
  id v24 = +[BuddyRestoreState loadFromPreferences:v25];
  if (v24)
  {
    id v7 = +[BYDeviceConfiguration currentConfiguration];
    id v19 = [v7 buildVersion];

    id v8 = [v24 productBuild];
    char v9 = [v8 isEqualToString:v19] ^ 1;

    if (v9)
    {
      os_log_t v18 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v17 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v10 = [v24 productBuild];
        sub_100051470((uint64_t)v28, (uint64_t)v10, (uint64_t)v19);
        _os_log_error_impl((void *)&_mh_execute_header, v18, v17, "Expected update to %@, but currently running %@!", v28, 0x16u);
      }
      objc_storeStrong((id *)&v18, 0);
      +[BuddyRestoreState removeFromPreferences:v25];
      BOOL v27 = 0;
      int v20 = 1;
    }
    else
    {
      id v11 = [v24 backupUDID];
      id v12 = [v24 backupUUID];
      id v16 = +[RestorableBackupItem restorableBackupItemWithPendingBackupUDID:backupUUID:snapshotID:](RestorableBackupItem, "restorableBackupItemWithPendingBackupUDID:backupUUID:snapshotID:", v11, v12, [v24 snapshotID]);

      [location[0] setBackupItem:v16 updateBackupMetadata:1 prefetchAccounts:1];
      id v13 = location[0];
      id v14 = [v24 snapshotDate];
      [v13 setSnapshotDate:v14];

      [location[0] setUseLatestSnapshot:[v24 useLatestSnapshot]];
      [location[0] setAllowCellularNetwork:((unint64_t)[v24 allowCellularNetwork]) & 1];
      BOOL v27 = v16 != 0;
      int v20 = 1;
      objc_storeStrong(&v16, 0);
    }
    objc_storeStrong(&v19, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v22 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v5 = oslog;
      os_log_type_t v6 = v22;
      sub_10004B24C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v5, v6, "No restore state found on disk!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    +[BuddyRestoreState removeFromPreferences:v25];
    BOOL v27 = 0;
    int v20 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(location, 0);
  return v27;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void (**)(id, unint64_t))location[0];
  objc_super v4 = [(BuddyRestoreFlow *)v7 pendingRestoreState];
  unsigned __int8 v5 = [(BuddyRestoreFlow *)v7 buddyPreferences];
  v3[2](v3, +[BuddySoftwareUpdateRestoreFlow controllerNeedsToRunWithPendingRestoreState:v4 buddyPreferences:v5]);

  objc_storeStrong(location, 0);
}

- (BYSeedProgramManager)seedProgramManager
{
  return self->seedProgramManager;
}

- (void)setSeedProgramManager:(id)a3
{
}

- (BFFSettingsManager)settingsManager
{
  return self->settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (BuddyRestoreSilentRenewController)silentRenewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_silentRenewController);

  return (BuddyRestoreSilentRenewController *)WeakRetained;
}

- (void)setSilentRenewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end