@interface BuddyRestoreUpdateController
- (BFFBackupDeviceController)backupDeviceController;
- (BFFSettingsManager)settingsManager;
- (BOOL)ableToRestoreWithUpdate;
- (BOOL)softwareUpdateDidOccur;
- (BYChronicle)chronicle;
- (BYPreferencesController)buddyPreferences;
- (BuddyPendingRestoreState)pendingRestoreState;
- (BuddyRestoreUpdateController)init;
- (RestorableBackupItem)backupItem;
- (id)willPerformSoftwareUpdateBlock;
- (void)_prepareForSoftwareUpdateToBuild:(id)a3 completion:(id)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAbleToRestoreWithUpdate:(BOOL)a3;
- (void)setBackupDeviceController:(id)a3;
- (void)setBackupItem:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setChronicle:(id)a3;
- (void)setPendingRestoreState:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)setSoftwareUpdateDidOccur:(BOOL)a3;
- (void)setWillPerformSoftwareUpdateBlock:(id)a3;
- (void)softwareUpdateController:(id)a3 didFailToInstallUpdateWithError:(id)a4;
- (void)softwareUpdateController:(id)a3 didStartInstallForUpdate:(id)a4;
- (void)softwareUpdateController:(id)a3 prepareToInstallUpdate:(id)a4 completion:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation BuddyRestoreUpdateController

- (BuddyRestoreUpdateController)init
{
  SEL v6 = a2;
  id location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyRestoreUpdateController;
  v2 = [(BuddySoftwareUpdateController *)&v5 init];
  id location = v2;
  objc_storeStrong(&location, v2);
  if (v2) {
    [location setSoftwareUpdateDelegate:location];
  }
  v3 = (BuddyRestoreUpdateController *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BuddyRestoreUpdateController;
  [(BuddySoftwareUpdateController *)&v11 viewDidAppear:a3];
  if (![(BuddyRestoreUpdateController *)v14 ableToRestoreWithUpdate])
  {
    v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    v7 = sub_1000CF934;
    v8 = &unk_1002B0D20;
    v9 = v14;
    id location = +[BuddyRestoreHelpers alertForBackupError:0 okButtonAction:&v4];
    id v3 = [(BuddyRestoreUpdateController *)v14 navigationController];
    [v3 presentViewController:location animated:1 completion:0];

    objc_storeStrong(&location, 0);
    objc_storeStrong((id *)&v9, 0);
  }
}

- (void)_prepareForSoftwareUpdateToBuild:(id)a3 completion:(id)a4
{
  v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v56 = 0;
  objc_storeStrong(&v56, a4);
  id v55 = (id)_BYLoggingFacility();
  os_log_type_t v54 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v55, v54, "Preparing to install update to build %@...", buf, 0xCu);
  }
  objc_storeStrong(&v55, 0);
  id v5 = [(BuddyRestoreUpdateController *)v58 willPerformSoftwareUpdateBlock];

  if (v5)
  {
    int v6 = (void (**)(void))[(BuddyRestoreUpdateController *)v58 willPerformSoftwareUpdateBlock];
    v6[2](v6);
  }
  char v53 = 0;
  v7 = [(BuddyRestoreUpdateController *)v58 backupDeviceController];
  char v51 = 0;
  char v49 = 0;
  unsigned __int8 v8 = 1;
  if (![(BFFBackupDeviceController *)v7 isBackingUp])
  {
    v52 = [(BuddyRestoreUpdateController *)v58 backupDeviceController];
    char v51 = 1;
    unsigned __int8 v8 = 1;
    if (![(BFFBackupDeviceController *)v52 backupStateUnknown])
    {
      v50 = [(BuddyRestoreUpdateController *)v58 backupDeviceController];
      char v49 = 1;
      unsigned __int8 v8 = [(BFFBackupDeviceController *)v50 backupFinished];
    }
  }
  if (v49) {

  }
  if (v51) {
  char v53 = v8 & 1;
  }
  v9 = [BuddyRestoreState alloc];
  id v10 = location[0];
  objc_super v11 = [(BuddyRestoreUpdateController *)v58 backupItem];
  BOOL v12 = [(RestorableBackupItem *)v11 backup];
  SEL v13 = [(BuddyRestoreUpdateController *)v58 backupItem];
  v14 = [(RestorableBackupItem *)v13 snapshot];
  v15 = [(BuddyRestoreUpdateController *)v58 pendingRestoreState];
  id v48 = [(BuddyRestoreState *)v9 initWithProductBuild:v10 backup:v12 snapshot:v14 useLatestSnapshot:v53 & 1 allowCellularNetwork:[(BuddyPendingRestoreState *)v15 allowCellularNetwork]];

  id v47 = (id)_BYLoggingFacility();
  os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v47, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v47;
    os_log_type_t v17 = v46;
    sub_10004B24C(v45);
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Persisting restore state to disk...", v45, 2u);
  }
  objc_storeStrong(&v47, 0);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v43 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)v60, (uint64_t)v48);
    _os_log_impl((void *)&_mh_execute_header, oslog, v43, "%@", v60, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v18 = v48;
  v19 = [(BuddyRestoreUpdateController *)v58 buddyPreferences];
  [v18 persistUsingPreferences:v19];

  v20 = [(BuddyRestoreUpdateController *)v58 buddyPreferences];
  v21 = [(BuddyRestoreUpdateController *)v58 chronicle];
  id v22 = [(BYChronicle *)v21 dictionaryRepresentation];
  [(BYPreferencesController *)v20 setObject:v22 forKey:BYChronicleKey];

  +[BYPreferencesController persistEverything];
  id v42 = [(BuddyRestoreUpdateController *)v58 buddyPreferences];
  id v41 = [v42 preferences];
  memset(__b, 0, sizeof(__b));
  id v23 = [v41 allKeys];
  id v24 = [v23 countByEnumeratingWithState:__b objects:v59 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v24; ++i)
      {
        if (*(void *)__b[2] != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v40 = *(void *)(__b[1] + 8 * i);
        v27 = [(BuddyRestoreUpdateController *)v58 settingsManager];
        id v28 = [v41 objectForKeyedSubscript:v40];
        id v29 = [v42 domain];
        [(BFFSettingsManager *)v27 setObject:v28 forDomain:v29 key:v40];
      }
      id v24 = [v23 countByEnumeratingWithState:__b objects:v59 count:16];
    }
    while (v24);
  }

  v30 = [(BuddyRestoreUpdateController *)v58 settingsManager];
  [(BFFSettingsManager *)v30 hideStashInSafeHavenAsProvisional:1];

  if ((os_variant_has_internal_ui() & 1) == 0) {
    goto LABEL_30;
  }
  v31 = [(BuddyRestoreUpdateController *)v58 buddyPreferences];
  id v38 = +[BuddyRestoreState loadFromPreferences:v31];

  id v32 = [v38 backupUDID];
  BOOL v33 = 1;
  if (v32) {
    BOOL v33 = [v38 snapshotID] == 0;
  }

  if (v33)
  {
    id v37 = +[UIAlertController alertControllerWithTitle:@"Unable to Restore Post-Update" message:@"File a Radar to Setup Assistant | iOS." preferredStyle:1];
    v34 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:0];
    [v37 addAction:v34];

    id v35 = [(BuddyRestoreUpdateController *)v58 navigationController];
    [v35 presentViewController:v37 animated:1 completion:v56];

    int v36 = 1;
    objc_storeStrong(&v37, 0);
  }
  else
  {
    int v36 = 0;
  }
  objc_storeStrong(&v38, 0);
  if (!v36)
  {
LABEL_30:
    if (v56) {
      (*((void (**)(void))v56 + 2))();
    }
  }
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(location, 0);
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyRestoreUpdateController *)v30 pendingRestoreState];
  unsigned __int8 v4 = [(BuddyPendingRestoreState *)v3 forceSoftwareUpdateRestore];

  char v28 = v4 & 1;
  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v26 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = oslog;
      os_log_type_t v6 = v26;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Forcing software update for restore...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v7 = [(BuddyRestoreUpdateController *)v30 backupItem];
  char v8 = 0;
  if ([(RestorableBackupItem *)v7 isCompatible]) {
    char v8 = v28 ^ 1;
  }

  if (v8)
  {
    if (location[0]) {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    }
    int v24 = 1;
  }
  else
  {
    v9 = [(BuddyRestoreUpdateController *)v30 backupItem];
    id v10 = [(BuddySoftwareUpdateController *)v30 update];
    id v11 = [(SUDescriptor *)v10 productVersion];
    unsigned __int8 v12 = [(RestorableBackupItem *)v9 isCompatibleWithUpdateToSystemVersion:v11];
    [(BuddyRestoreUpdateController *)v30 setAbleToRestoreWithUpdate:v12 & 1];

    if (v28)
    {
      SEL v13 = [(BuddySoftwareUpdateController *)v30 update];
      [(BuddyRestoreUpdateController *)v30 setAbleToRestoreWithUpdate:v13 != 0];
    }
    id v14 = +[BYPreferencesController buddyPreferencesInternal];
    unsigned __int8 v15 = [v14 BOOLForKey:@"FakeSoftwareUpdate"];

    if (v15)
    {
      [(BuddyRestoreUpdateController *)v30 _prepareForSoftwareUpdateToBuild:@"1A1" completion:&stru_1002B2828];
      int v24 = 1;
    }
    else if ([(BuddySoftwareUpdateController *)v30 scannedForUpdate] {
           && [(BuddyRestoreUpdateController *)v30 ableToRestoreWithUpdate])
    }
    {
      if (location[0]) {
        (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
      }
      int v24 = 1;
    }
    else
    {
      v16 = v30;
      os_log_type_t v17 = _NSConcreteStackBlock;
      int v18 = -1073741824;
      int v19 = 0;
      v20 = sub_1000D0614;
      v21 = &unk_1002B2850;
      id v22 = v30;
      id v23 = location[0];
      [(BuddySoftwareUpdateController *)v16 scanForUpdateCompletion:&v17];
      objc_storeStrong(&v23, 0);
      objc_storeStrong((id *)&v22, 0);
      int v24 = 0;
    }
  }
  objc_storeStrong(location, 0);
}

- (void)softwareUpdateController:(id)a3 prepareToInstallUpdate:(id)a4 completion:(id)a5
{
  unsigned __int8 v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  v7 = v12;
  id v8 = [v10 productBuildVersion];
  [(BuddyRestoreUpdateController *)v7 _prepareForSoftwareUpdateToBuild:v8 completion:v9];

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
  id v5 = [(BuddyRestoreUpdateController *)v20 buddyPreferences];
  LOBYTE(a4) = !+[BuddyRestoreState hasStateFromPreferences:v5];

  if (a4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v6 = oslog;
      os_log_type_t v7 = v16;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Software update for restore did begin!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v8 = v20;
    id v9 = [v18 productBuildVersion];
    [(BuddyRestoreUpdateController *)v8 _prepareForSoftwareUpdateToBuild:v9 completion:0];
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
      _os_log_error_impl((void *)&_mh_execute_header, v10, v11, "Software update for restore did begin with restore state on disk!", (uint8_t *)v12, 2u);
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
      id v5 = (NSString *)v12;
    }
    else if (v12)
    {
      id v10 = [v12 domain];
      char v9 = 1;
      id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v10, [v12 code]);
      id v8 = v5;
      char v7 = 1;
    }
    else
    {
      id v5 = 0;
    }
    sub_10004BB7C((uint64_t)buf, (uint64_t)v5);
    _os_log_error_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_ERROR, "Software update failed, cancelling iCloud Restore launch: %{public}@", buf, 0xCu);
    if (v7) {

    }
    if (v9) {
  }
    }
  objc_storeStrong((id *)&oslog, 0);
  os_log_type_t v6 = [(BuddyRestoreUpdateController *)v14 buddyPreferences];
  +[BuddyRestoreState removeFromPreferences:v6];

  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (BYChronicle)chronicle
{
  return self->chronicle;
}

- (void)setChronicle:(id)a3
{
}

- (BFFBackupDeviceController)backupDeviceController
{
  return self->backupDeviceController;
}

- (void)setBackupDeviceController:(id)a3
{
}

- (BOOL)softwareUpdateDidOccur
{
  return self->softwareUpdateDidOccur;
}

- (void)setSoftwareUpdateDidOccur:(BOOL)a3
{
  self->softwareUpdateDidOccur = a3;
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

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
}

- (RestorableBackupItem)backupItem
{
  return self->backupItem;
}

- (void)setBackupItem:(id)a3
{
}

- (BOOL)ableToRestoreWithUpdate
{
  return self->_ableToRestoreWithUpdate;
}

- (void)setAbleToRestoreWithUpdate:(BOOL)a3
{
  self->_ableToRestoreWithUpdate = a3;
}

- (void).cxx_destruct
{
}

@end