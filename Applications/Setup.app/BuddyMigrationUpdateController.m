@interface BuddyMigrationUpdateController
- (BFFSettingsManager)settingsManager;
- (BOOL)ableToMigrateWithUpdate;
- (BYPreferencesController)buddyPreferences;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyMigrationUpdateController)init;
- (BuddyMiscState)miscState;
- (ProximitySetupController)proximitySetupController;
- (id)willPerformSoftwareUpdateBlock;
- (void)_prepareForSoftwareUpdateToBuild:(id)a3 completion:(id)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAbleToMigrateWithUpdate:(BOOL)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)setWillPerformSoftwareUpdateBlock:(id)a3;
- (void)softwareUpdateController:(id)a3 didFailToInstallUpdateWithError:(id)a4;
- (void)softwareUpdateController:(id)a3 didStartInstallForUpdate:(id)a4;
- (void)softwareUpdateController:(id)a3 prepareToInstallUpdate:(id)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BuddyMigrationUpdateController

- (BuddyMigrationUpdateController)init
{
  SEL v6 = a2;
  id location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyMigrationUpdateController;
  v2 = [(BuddySoftwareUpdateController *)&v5 init];
  id location = v2;
  objc_storeStrong(&location, v2);
  if (v2) {
    [location setSoftwareUpdateDelegate:location];
  }
  v3 = (BuddyMigrationUpdateController *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BuddyMigrationUpdateController;
  [(BuddySoftwareUpdateController *)&v11 viewDidAppear:a3];
  if (![(BuddyMigrationUpdateController *)v14 ableToMigrateWithUpdate])
  {
    v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    v7 = sub_10009145C;
    v8 = &unk_1002B0D20;
    v9 = v14;
    id location = +[BuddyRestoreHelpers alertForBackupError:0 okButtonAction:&v4];
    id v3 = [(BuddyMigrationUpdateController *)v14 navigationController];
    [v3 presentViewController:location animated:1 completion:0];

    objc_storeStrong(&location, 0);
    objc_storeStrong((id *)&v9, 0);
  }
}

- (void)_prepareForSoftwareUpdateToBuild:(id)a3 completion:(id)a4
{
  v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v34 = 0;
  objc_storeStrong(&v34, a4);
  id v33 = (id)_BYLoggingFacility();
  os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v33, v32, "Preparing to install update to build %@...", buf, 0xCu);
  }
  objc_storeStrong(&v33, 0);
  id v5 = [(BuddyMigrationUpdateController *)v36 willPerformSoftwareUpdateBlock];

  if (v5)
  {
    int v6 = (void (**)(void))[(BuddyMigrationUpdateController *)v36 willPerformSoftwareUpdateBlock];
    v6[2](v6);
  }
  v7 = [BuddyMigrationState alloc];
  id v31 = [(BuddyMigrationState *)v7 initWithProductBuild:location[0] intent:0];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = oslog;
    os_log_type_t v9 = v29;
    sub_10004B24C(v28);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Persisting migration state to disk...", v28, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  os_log_t v27 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)v37, (uint64_t)v31);
    _os_log_impl((void *)&_mh_execute_header, v27, v26, "%@", v37, 0xCu);
  }
  objc_storeStrong((id *)&v27, 0);
  id v10 = v31;
  objc_super v11 = [(BuddyMigrationUpdateController *)v36 buddyPreferencesExcludedFromBackup];
  [v10 persistUsingPreferences:v11];

  BOOL v12 = [(BuddyMigrationUpdateController *)v36 buddyPreferences];
  [(BYPreferencesController *)v12 persist];

  SEL v13 = [(BuddyMigrationUpdateController *)v36 settingsManager];
  [(BFFSettingsManager *)v13 hideStashInSafeHavenAsProvisional:1];

  os_log_t v25 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v25;
    os_log_type_t v15 = v24;
    sub_10004B24C(v23);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Suspending proximity connection...", v23, 2u);
  }
  objc_storeStrong((id *)&v25, 0);
  v16 = [(BuddyMigrationUpdateController *)v36 proximitySetupController];
  v17 = _NSConcreteStackBlock;
  int v18 = -1073741824;
  int v19 = 0;
  v20 = sub_10009189C;
  v21 = &unk_1002B0D70;
  id v22 = v34;
  [(ProximitySetupController *)v16 suspendConnectionForSoftwareUpdate:&v17];

  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(location, 0);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyMigrationUpdateController *)v43 miscState];
  v4 = [(BuddyMiscState *)v3 migrationManager];
  unsigned __int8 v5 = [(BuddyTargetDeviceMigrationManager *)v4 forceUpdateToMigrate];

  char v41 = v5 & 1;
  if (v5)
  {
    id v40 = (id)_BYLoggingFacility();
    os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = v40;
      os_log_type_t v7 = v39;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Forcing software update for migration...", buf, 2u);
    }
    objc_storeStrong(&v40, 0);
    id v8 = +[BYPreferencesController buddyPreferencesInternal];
    [v8 setObject:&__kCFBooleanFalse forKey:@"RequireSoftwareUpdateForMigration"];
  }
  os_log_type_t v9 = [(BuddyMigrationUpdateController *)v43 miscState];
  id v10 = [(BuddyMiscState *)v9 migrationManager];
  unsigned __int8 v11 = [(BuddyTargetDeviceMigrationManager *)v10 requiresUpdateToMigrate];

  char v37 = v11 & 1;
  if (v11 & 1) != 0 || (v41)
  {
    BOOL v12 = [(BuddyMigrationUpdateController *)v43 proximitySetupController];
    id v35 = [(ProximitySetupController *)v12 productVersion];

    SEL v13 = [(BuddySoftwareUpdateController *)v43 update];
    id v14 = [(SUDescriptor *)v13 productBuildVersion];
    BOOL v15 = +[SASSystemInformation compareProductVersion:v35 toProductVersion:v14] != (id)1;
    [(BuddyMigrationUpdateController *)v43 setAbleToMigrateWithUpdate:v15];

    if (v41)
    {
      v16 = [(BuddySoftwareUpdateController *)v43 update];
      [(BuddyMigrationUpdateController *)v43 setAbleToMigrateWithUpdate:v16 != 0];
    }
    id v17 = +[BYPreferencesController buddyPreferencesInternal];
    unsigned __int8 v18 = [v17 BOOLForKey:@"FakeSoftwareUpdate"];

    if (v18)
    {
      [(BuddyMigrationUpdateController *)v43 _prepareForSoftwareUpdateToBuild:@"1A1" completion:&stru_1002B1E58];
      int v36 = 1;
    }
    else
    {
      v28 = _NSConcreteStackBlock;
      int v29 = -1073741824;
      int v30 = 0;
      id v31 = sub_100091F70;
      os_log_type_t v32 = &unk_1002B0D70;
      id v33 = location[0];
      id v34 = objc_retainBlock(&v28);
      if ([(BuddySoftwareUpdateController *)v43 scannedForUpdate]
        && [(BuddyMigrationUpdateController *)v43 ableToMigrateWithUpdate])
      {
        (*((void (**)(void))v34 + 2))();
        int v36 = 1;
      }
      else
      {
        int v19 = v43;
        v20 = _NSConcreteStackBlock;
        int v21 = -1073741824;
        int v22 = 0;
        v23 = sub_1000922AC;
        os_log_type_t v24 = &unk_1002B1E80;
        os_log_t v25 = v43;
        id v26 = v35;
        id v27 = v34;
        [(BuddySoftwareUpdateController *)v19 scanForUpdateCompletion:&v20];
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v26, 0);
        objc_storeStrong((id *)&v25, 0);
        int v36 = 0;
      }
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v33, 0);
    }
    objc_storeStrong(&v35, 0);
  }
  else
  {
    if (location[0]) {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    }
    int v36 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)softwareUpdateController:(id)a3 prepareToInstallUpdate:(id)a4 completion:(id)a5
{
  BOOL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  os_log_type_t v7 = v12;
  id v8 = [v10 productBuildVersion];
  [(BuddyMigrationUpdateController *)v7 _prepareForSoftwareUpdateToBuild:v8 completion:v9];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)softwareUpdateController:(id)a3 didStartInstallForUpdate:(id)a4
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  unsigned __int8 v5 = [(BuddyMigrationUpdateController *)v20 buddyPreferencesExcludedFromBackup];
  LOBYTE(a4) = !+[BuddyMigrationState hasStateFromPreferences:v5];

  if (a4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = oslog;
      os_log_type_t v7 = v16;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Software update for migration did begin!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v8 = v20;
    id v9 = [v18 productBuildVersion];
    [(BuddyMigrationUpdateController *)v8 _prepareForSoftwareUpdateToBuild:v9 completion:0];
  }
  else
  {
    os_log_t v14 = (os_log_t)(id)_BYLoggingFacility();
    char v13 = 16;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v10 = v14;
      os_log_type_t v11 = v13;
      sub_10004B24C(v12);
      _os_log_error_impl((void *)&_mh_execute_header, v10, v11, "Software update for migration did begin with migration state on disk!", (uint8_t *)v12, 2u);
    }
    objc_storeStrong((id *)&v14, 0);
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)softwareUpdateController:(id)a3 didFailToInstallUpdateWithError:(id)a4
{
  os_log_t v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    char v9 = 0;
    char v7 = 0;
    if (_BYIsInternalInstall())
    {
      unsigned __int8 v5 = (NSString *)v12;
    }
    else if (v12)
    {
      id v10 = [v12 domain];
      char v9 = 1;
      unsigned __int8 v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v10, [v12 code]);
      id v8 = v5;
      char v7 = 1;
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
    sub_10004BB7C((uint64_t)buf, (uint64_t)v5);
    _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Software update failed, cancelling iCloud Restore launch: %{public}@", buf, 0xCu);
    if (v7) {

    }
    if (v9) {
  }
    }
  objc_storeStrong((id *)&oslog, 0);
  int v6 = [(BuddyMigrationUpdateController *)v14 buddyPreferencesExcludedFromBackup];
  +[BuddyMigrationState removeFromPreferences:v6];

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (ProximitySetupController)proximitySetupController
{
  return self->proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->miscState;
}

- (void)setMiscState:(id)a3
{
}

- (id)willPerformSoftwareUpdateBlock
{
  return self->willPerformSoftwareUpdateBlock;
}

- (void)setWillPerformSoftwareUpdateBlock:(id)a3
{
}

- (BFFSettingsManager)settingsManager
{
  return self->settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (BOOL)ableToMigrateWithUpdate
{
  return self->_ableToMigrateWithUpdate;
}

- (void)setAbleToMigrateWithUpdate:(BOOL)a3
{
  self->_ableToMigrateWithUpdate = a3;
}

- (void).cxx_destruct
{
}

@end