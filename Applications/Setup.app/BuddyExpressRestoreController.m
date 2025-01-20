@interface BuddyExpressRestoreController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)_ableToBackupBeforeRestore:(id)a3 softwareUpdateRequired:(BOOL *)a4;
- (BOOL)_isBackupFromProximityDevice:(id)a3;
- (BOOL)controllerNeedsToRun;
- (BOOL)forceSoftwareUpdateRequiredForNewBackup;
- (BOOL)isAbleToBackupBeforeRestore;
- (BYAnalyticsExpressRestore)expressRestoreAnalytics;
- (BYAnalyticsManager)analyticsManager;
- (BYSoftwareUpdateCache)softwareUpdateCache;
- (BuddyBetaEnrollmentStateManager)betaEnrollmentStateManager;
- (BuddyNetworkProvider)networkProvider;
- (NSString)deviceName;
- (ProximitySetupController)proximitySetupController;
- (RestorableBackupItem)backupItem;
- (id)dateForChosenBackup;
- (id)deviceNameForChosenBackup;
- (id)showModalWiFiSettingsBlock;
- (unint64_t)dataTransferMethod;
- (void)_presentNetworkWarning:(id)a3;
- (void)_suggestedBackupToRestore:(id)a3;
- (void)_validateBackupIsCompatible:(id)a3 completion:(id)a4;
- (void)continueTapped;
- (void)createBackupDataSource:(id)a3;
- (void)createCloudDataSource:(id)a3;
- (void)createDataProviderWithCustomization:(id)a3 completion:(id)a4;
- (void)customizeTapped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAbleToBackupBeforeRestore:(BOOL)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setBackupItem:(id)a3;
- (void)setBetaEnrollmentStateManager:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setExpressRestoreAnalytics:(id)a3;
- (void)setForceSoftwareUpdateRequiredForNewBackup:(BOOL)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setShowModalWiFiSettingsBlock:(id)a3;
- (void)setSoftwareUpdateCache:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyExpressRestoreController

- (void)viewWillAppear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyExpressRestoreController;
  [(BuddyExpressRestoreController *)&v4 viewWillAppear:a3];
  v3 = [(BuddyExpressWelcomeController *)v7 buddyPreferences];
  [(BYPreferencesController *)v3 setObject:&__kCFBooleanFalse forKey:@"RestoreChoice"];
}

- (void)continueTapped
{
  v8[2] = self;
  v8[1] = (id)a2;
  v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  SEL v6 = sub_100144358;
  v7 = &unk_1002B0EC0;
  v8[0] = self;
  [(BuddyExpressRestoreController *)self _presentNetworkWarning:&v3];
  objc_storeStrong(v8, 0);
}

- (void)customizeTapped
{
  v12 = self;
  v11[1] = (id)a2;
  v2 = [(BuddyExpressWelcomeController *)self pendingRestoreState];
  [(BuddyPendingRestoreState *)v2 clearBackupItem];

  v3 = [(BuddyExpressRestoreController *)v12 expressRestoreAnalytics];
  [(BYAnalyticsExpressRestore *)v3 setRestoreChoice:3];

  int v4 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_1001448D0;
  v10 = &unk_1002B0D20;
  v11[0] = v12;
  dispatch_async(v4, &block);

  v5.receiver = v12;
  v5.super_class = (Class)BuddyExpressRestoreController;
  [(BuddyExpressWelcomeController *)&v5 customizeTapped];
  objc_storeStrong(v11, 0);
}

- (void)createDataProviderWithCustomization:(id)a3 completion:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  objc_super v5 = v15;
  int v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_100144A9C;
  v11 = &unk_1002B39A0;
  id v12 = v13;
  v6.receiver = v5;
  v6.super_class = (Class)BuddyExpressRestoreController;
  [(BuddyExpressWelcomeController *)&v6 createDataProviderWithCustomization:&stru_1002B3978 completion:&v7];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)createBackupDataSource:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(BuddyExpressRestoreController *)v16 isAbleToBackupBeforeRestore]
    || (v3 = [(BuddyExpressRestoreController *)v16 backupItem],
        int v4 = [(RestorableBackupItem *)v3 backupUDID],
        BOOL v5 = v4 == 0,
        v4,
        v3,
        v5))
  {
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    int v14 = 1;
  }
  else
  {
    objc_super v6 = dispatch_get_global_queue(25, 0);
    int v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_100144C98;
    v11 = &unk_1002B0CD0;
    id v12 = v16;
    id v13 = location[0];
    dispatch_async(v6, &v7);

    objc_storeStrong(&v13, 0);
    objc_storeStrong((id *)&v12, 0);
    int v14 = 0;
  }
  objc_storeStrong(location, 0);
}

- (void)createCloudDataSource:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  (*((void (**)(id, void))location[0] + 2))(location[0], 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)dataTransferMethod
{
  if ([(BuddyExpressRestoreController *)self isAbleToBackupBeforeRestore]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (id)dateForChosenBackup
{
  v2 = [(BuddyExpressRestoreController *)self backupItem];
  v3 = [(RestorableBackupItem *)v2 snapshot];
  id v4 = [(MBSnapshot *)v3 date];

  return v4;
}

- (id)deviceNameForChosenBackup
{
  v2 = [(BuddyExpressRestoreController *)self backupItem];
  v3 = [(RestorableBackupItem *)v2 snapshot];
  id v4 = [(MBSnapshot *)v3 deviceName];

  return v4;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)controllerNeedsToRun
{
  v25 = self;
  SEL v24 = a2;
  v23.receiver = self;
  v23.super_class = (Class)BuddyExpressRestoreController;
  if (![(BuddyExpressWelcomeController *)&v23 controllerNeedsToRun]) {
    return 0;
  }
  id v2 = +[ACAccountStore defaultStore];
  id v3 = [v2 aa_primaryAppleAccount];
  BOOL v4 = v3 != 0;

  BOOL v22 = v4;
  BOOL v5 = [(BuddyExpressWelcomeController *)v25 miscState];
  objc_super v6 = [(BuddyMiscState *)v5 migrationManager];
  unsigned __int8 v7 = [(BuddyTargetDeviceMigrationManager *)v6 willMigrate];

  char v21 = v7 & 1;
  int v8 = [(BuddyExpressRestoreController *)v25 proximitySetupController];
  LOBYTE(v6) = [(ProximitySetupController *)v8 skipExpressRestore];

  char v20 = v6 & 1;
  if ((v7 & 1) == 0 && (v20 & 1) == 0 && v22) {
    return 1;
  }
  int v9 = [(BuddyExpressRestoreController *)v25 proximitySetupController];
  unsigned __int8 v10 = [(ProximitySetupController *)v9 hasConnection];

  char v19 = v10 & 1;
  if ((v10 & 1) != 0 && (v21 & 1) == 0)
  {
    v11 = dispatch_get_global_queue(0, 0);
    block = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    v16 = sub_100145210;
    v17 = &unk_1002B0D20;
    v18 = v25;
    dispatch_async(v11, &block);

    objc_storeStrong((id *)&v18, 0);
  }
  return 0;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  unsigned __int8 v7 = sub_100145370;
  int v8 = &unk_1002B0CD0;
  int v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_suggestedBackupToRestore:(id)a3
{
  v74 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v72 = 0;
  id v71 = objc_alloc_init((Class)MBManager);
  id v70 = (id)_BYLoggingFacility();
  os_log_type_t v69 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = v70;
    os_log_type_t v4 = v69;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Fetching backup list...", buf, 2u);
  }
  objc_storeStrong(&v70, 0);
  id v66 = v72;
  id v5 = +[BuddyBackupUtilities getBackupListWithFiltering:0 manager:v71 retries:3 error:&v66];
  objc_storeStrong(&v72, v66);
  id v67 = v5;
  if (v72)
  {
    id v65 = (id)_BYLoggingFacility();
    os_log_type_t v64 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
    {
      char v62 = 0;
      char v60 = 0;
      if (_BYIsInternalInstall())
      {
        int v6 = (NSString *)v72;
      }
      else if (v72)
      {
        id v63 = [v72 domain];
        char v62 = 1;
        int v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v63, [v72 code]);
        id v61 = v6;
        char v60 = 1;
      }
      else
      {
        int v6 = 0;
      }
      sub_10004BB7C((uint64_t)v78, (uint64_t)v6);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v65, v64, "Failed to get backups: %{public}@", v78, 0xCu);
      if (v60) {

      }
      if (v62) {
    }
      }
    objc_storeStrong(&v65, 0);
    if (location[0]) {
      (*((void (**)(id, void, void))location[0] + 2))(location[0], 0, 0);
    }
    int v59 = 1;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v57 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v7 = oslog;
      os_log_type_t v8 = v57;
      sub_10004B24C(v56);
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Searching for backup from source device...", v56, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v55 = (id)MGCopyAnswer();
    int v9 = [(BuddyExpressRestoreController *)v74 proximitySetupController];
    id v10 = [(ProximitySetupController *)v9 information];
    id obj = v72;
    id v11 = +[BuddyBackupUtilities suggestedBackupForProximity:v10 deviceClass:v55 withManager:v71 error:&obj];
    objc_storeStrong(&v72, obj);
    id v54 = v11;

    id v52 = 0;
    if (v54)
    {
      os_log_t v51 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        sub_10004B238((uint64_t)v77, (uint64_t)v54);
        _os_log_impl((void *)&_mh_execute_header, v51, v50, "Found backup from source device: %@", v77, 0xCu);
      }
      objc_storeStrong((id *)&v51, 0);
      id v12 = [(BuddyExpressRestoreController *)v74 proximitySetupController];
      id v13 = [(ProximitySetupController *)v12 information];
      id v14 = [(SASProximityInformation *)v13 deviceName];
      id v15 = v52;
      id v52 = v14;
    }
    else
    {
      if (v72)
      {
        os_log_t v49 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v48 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          char v46 = 0;
          char v44 = 0;
          if (_BYIsInternalInstall())
          {
            v16 = (NSString *)v72;
          }
          else if (v72)
          {
            id v47 = [v72 domain];
            char v46 = 1;
            v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v47, [v72 code]);
            id v45 = v16;
            char v44 = 1;
          }
          else
          {
            v16 = 0;
          }
          sub_10004BB7C((uint64_t)v76, (uint64_t)v16);
          _os_log_error_impl((void *)&_mh_execute_header, v49, v48, "Failed to find backup from proximity: %{public}@", v76, 0xCu);
          if (v44) {

          }
          if (v46) {
        }
          }
        objc_storeStrong((id *)&v49, 0);
      }
      os_log_t v43 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v43;
        os_log_type_t v18 = v42;
        sub_10004B24C(v41);
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Searching for latest backup for current device...", v41, 2u);
      }
      objc_storeStrong((id *)&v43, 0);
      id v19 = +[BuddyBackupUtilities suggestedBackupForCurrentDeviceWithBackups:v67];
      id v20 = v54;
      id v54 = v19;

      id v21 = [v54 snapshot];
      id v22 = [v21 deviceName];
      id v23 = v52;
      id v52 = v22;

      if (v54)
      {
        os_log_t v40 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          sub_10004B238((uint64_t)v75, (uint64_t)v54);
          _os_log_impl((void *)&_mh_execute_header, v40, v39, "Found backup: %@", v75, 0xCu);
        }
        objc_storeStrong((id *)&v40, 0);
      }
      else
      {
        os_log_t v38 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          SEL v24 = v38;
          os_log_type_t v25 = v37;
          sub_10004B24C(v36);
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "No appropriate backups found", v36, 2u);
        }
        objc_storeStrong((id *)&v38, 0);
      }
    }
    if (v54)
    {
      v26 = v74;
      id v27 = v54;
      v28 = _NSConcreteStackBlock;
      int v29 = -1073741824;
      int v30 = 0;
      v31 = sub_100146288;
      v32 = &unk_1002B39F0;
      id v35 = location[0];
      id v33 = v54;
      id v34 = v52;
      [(BuddyExpressRestoreController *)v26 _validateBackupIsCompatible:v27 completion:&v28];
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v33, 0);
      objc_storeStrong(&v35, 0);
      int v59 = 0;
    }
    else
    {
      if (location[0]) {
        (*((void (**)(id, void, void))location[0] + 2))(location[0], 0, 0);
      }
      int v59 = 1;
    }
    objc_storeStrong(&v52, 0);
    objc_storeStrong(&v54, 0);
    objc_storeStrong(&v55, 0);
  }
  objc_storeStrong(&v67, 0);
  objc_storeStrong(&v71, 0);
  objc_storeStrong(&v72, 0);
  objc_storeStrong(location, 0);
}

- (void)_validateBackupIsCompatible:(id)a3 completion:(id)a4
{
  id v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  if (v20)
  {
    if (location[0])
    {
      if ([location[0] isCompatible])
      {
        (*((void (**)(id, uint64_t))v20 + 2))(v20, 1);
        int v19 = 1;
      }
      else
      {
        os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          id v5 = oslog;
          os_log_type_t v6 = v17;
          sub_10004B24C(buf);
          _os_log_impl((void *)&_mh_execute_header, v5, v6, "Backup is not compatible, checking to see if a Software Update is available...", buf, 2u);
        }
        objc_storeStrong((id *)&oslog, 0);
        unsigned __int8 v7 = [(BuddyExpressRestoreController *)v22 softwareUpdateCache];
        os_log_type_t v8 = _NSConcreteStackBlock;
        int v9 = -1073741824;
        int v10 = 0;
        id v11 = sub_1001465AC;
        id v12 = &unk_1002B2008;
        id v13 = v22;
        id v14 = location[0];
        id v15 = v20;
        [(BYSoftwareUpdateCache *)v7 scanUsingCache:1 withCompletion:&v8];

        objc_storeStrong(&v15, 0);
        objc_storeStrong(&v14, 0);
        objc_storeStrong((id *)&v13, 0);
        int v19 = 0;
      }
    }
    else
    {
      (*((void (**)(id, void))v20 + 2))(v20, 0);
      int v19 = 1;
    }
  }
  else
  {
    int v19 = 1;
  }
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_ableToBackupBeforeRestore:(id)a3 softwareUpdateRequired:(BOOL *)a4
{
  v85 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v83 = a4;
  id v5 = +[BYPreferencesController buddyPreferencesInternal];
  unsigned __int8 v6 = [v5 BOOLForKey:@"AlwaysAttemptBackupAndRestore"];

  if (v6)
  {
    char v86 = 1;
    int v82 = 1;
  }
  else
  {
    unsigned __int8 v7 = [(BuddyExpressRestoreController *)v85 proximitySetupController];
    int v8 = [(ProximitySetupController *)v7 hasConnection];

    if (v8)
    {
      if ([(BuddyExpressRestoreController *)v85 _isBackupFromProximityDevice:location[0]])
      {
        id v13 = [(BuddyExpressRestoreController *)v85 proximitySetupController];
        id v14 = [(ProximitySetupController *)v13 information];
        unsigned __int8 v15 = [(SASProximityInformation *)v14 isRestoring];

        if (v15)
        {
          id v75 = (id)_BYLoggingFacility();
          os_log_type_t v74 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v75;
            os_log_type_t v17 = v74;
            sub_10004B24C(v73);
            _os_log_impl((void *)&_mh_execute_header, v16, v17, "Not offering Guide User to Backup as source device is restoring", v73, 2u);
          }
          objc_storeStrong(&v75, 0);
          char v86 = 0;
          int v82 = 1;
        }
        else
        {
          os_log_type_t v18 = [(BuddyExpressRestoreController *)v85 proximitySetupController];
          int v19 = [(ProximitySetupController *)v18 information];
          char v20 = [(SASProximityInformation *)v19 isBackupEnabled] ^ 1;

          if (v20)
          {
            id v72 = (id)_BYLoggingFacility();
            os_log_type_t v71 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_DEFAULT))
            {
              id v21 = v72;
              os_log_type_t v22 = v71;
              sub_10004B24C(v70);
              _os_log_impl((void *)&_mh_execute_header, v21, v22, "Not offering Guide User to Backup as source device has backup disabled", v70, 2u);
            }
            objc_storeStrong(&v72, 0);
            char v86 = 0;
            int v82 = 1;
          }
          else
          {
            id v23 = [(BuddyExpressRestoreController *)v85 proximitySetupController];
            SEL v24 = [(ProximitySetupController *)v23 information];
            id v69 = [(SASProximityInformation *)v24 connectedToWiFi];

            os_log_type_t v25 = [(BuddyExpressRestoreController *)v85 proximitySetupController];
            v26 = [(ProximitySetupController *)v25 information];
            id v68 = [(SASProximityInformation *)v26 supportsCellularBackup];

            id v27 = [(BuddyExpressRestoreController *)v85 proximitySetupController];
            v28 = [(ProximitySetupController *)v27 information];
            id v67 = [(SASProximityInformation *)v28 hasInexpensiveCellularNetwork];

            char v66 = 0;
            unsigned __int8 v29 = 0;
            if (v69) {
              unsigned __int8 v29 = [v69 BOOLValue];
            }
            char v66 = v29 & 1;
            if ((v29 & 1) == 0)
            {
              unsigned __int8 v30 = [v68 BOOLValue];
              unsigned __int8 v31 = 0;
              if (v30) {
                unsigned __int8 v31 = [v67 BOOLValue];
              }
              char v66 = v31 & 1;
            }
            if (v66)
            {
              id v62 = +[NSCalendar currentCalendar];
              id v61 = objc_alloc_init((Class)NSDateComponents);
              id v60 = +[NSDate date];
              [v61 setMonth:-1];
              id v34 = [location[0] snapshot];
              id v35 = [v34 date];
              id v36 = [v62 dateByAddingComponents:v61 toDate:v60 options:0];
              BOOL v37 = [v35 compare:v36] == (id)1;

              BOOL v59 = v37;
              if (v37)
              {
                os_log_t v40 = [(BuddyExpressRestoreController *)v85 proximitySetupController];
                v41 = [(ProximitySetupController *)v40 information];
                id v56 = [(SASProximityInformation *)v41 productVersion];

                os_log_type_t v42 = +[UIDevice currentDevice];
                id v55 = [(UIDevice *)v42 systemVersion];

                if (+[BuddyBackupUtilities canRestoreBackupMadeOnVersion:v56 toSystemVersion:v55])
                {
                  goto LABEL_46;
                }
                os_log_t v43 = [(BuddyExpressRestoreController *)v85 softwareUpdateCache];
                id v54 = [(BYSoftwareUpdateCache *)v43 latestUpdate];

                if (v54)
                {
                  id v46 = [v54 productVersion];
                  char v47 = !+[BuddyBackupUtilities canRestoreBackupMadeOnVersion:v56 toSystemVersion:v46];

                  if (v47)
                  {
                    os_log_t v50 = (os_log_t)(id)_BYLoggingFacility();
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
                    {
                      id v48 = [v54 productVersion];
                      sub_100051470((uint64_t)v87, (uint64_t)v56, (uint64_t)v48);
                      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "Not offering Guide User to Backup as source device is on a newer version of iOS that this device cannot update to (%@ vs %@)", v87, 0x16u);
                    }
                    objc_storeStrong((id *)&v50, 0);
                    char v86 = 0;
                    int v82 = 1;
                  }
                  else
                  {
                    if (v83) {
                      BOOL *v83 = 1;
                    }
                    int v82 = 0;
                  }
                }
                else
                {
                  os_log_t v53 = (os_log_t)(id)_BYLoggingFacility();
                  os_log_type_t v52 = OS_LOG_TYPE_DEFAULT;
                  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                  {
                    char v44 = v53;
                    os_log_type_t v45 = v52;
                    sub_10004B24C(v51);
                    _os_log_impl((void *)&_mh_execute_header, v44, v45, "Not offering Guide User to Backup as source device is on a newer version of iOS that this device cannot update to (no update found)", v51, 2u);
                  }
                  objc_storeStrong((id *)&v53, 0);
                  char v86 = 0;
                  int v82 = 1;
                }
                objc_storeStrong(&v54, 0);
                if (!v82)
                {
LABEL_46:
                  char v86 = 1;
                  int v82 = 1;
                }
                objc_storeStrong(&v55, 0);
                objc_storeStrong(&v56, 0);
              }
              else
              {
                os_log_t v58 = (os_log_t)(id)_BYLoggingFacility();
                os_log_type_t v57 = OS_LOG_TYPE_DEFAULT;
                if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                {
                  id v38 = [location[0] snapshot];
                  id v39 = [v38 date];
                  sub_10004B238((uint64_t)v88, (uint64_t)v39);
                  _os_log_impl((void *)&_mh_execute_header, v58, v57, "Not offering Guide User to Backup as backup is not new enough (created on %@)", v88, 0xCu);
                }
                objc_storeStrong((id *)&v58, 0);
                char v86 = 0;
                int v82 = 1;
              }
              objc_storeStrong(&v60, 0);
              objc_storeStrong(&v61, 0);
              objc_storeStrong(&v62, 0);
            }
            else
            {
              os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
              os_log_type_t v64 = OS_LOG_TYPE_DEFAULT;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                v32 = oslog;
                os_log_type_t v33 = v64;
                sub_10004B24C(v63);
                _os_log_impl((void *)&_mh_execute_header, v32, v33, "Not offering Guide User to Backup as source device is not connected to Wi-Fi or an inexpensive cellular network", v63, 2u);
              }
              objc_storeStrong((id *)&oslog, 0);
              char v86 = 0;
              int v82 = 1;
            }
            objc_storeStrong(&v67, 0);
            objc_storeStrong(&v68, 0);
            objc_storeStrong(&v69, 0);
          }
        }
      }
      else
      {
        id v78 = (id)_BYLoggingFacility();
        os_log_type_t v77 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = v78;
          os_log_type_t v12 = v77;
          sub_10004B24C(v76);
          _os_log_impl((void *)&_mh_execute_header, v11, v12, "Not offering Guide User to Backup as chosen backup is not for source device", v76, 2u);
        }
        objc_storeStrong(&v78, 0);
        char v86 = 0;
        int v82 = 1;
      }
    }
    else
    {
      id v81 = (id)_BYLoggingFacility();
      os_log_type_t v80 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v81, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = v81;
        os_log_type_t v10 = v80;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Not offering Guide User to Backup as no connection to source device", buf, 2u);
      }
      objc_storeStrong(&v81, 0);
      char v86 = 0;
      int v82 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v86 & 1;
}

- (BOOL)_isBackupFromProximityDevice:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyExpressRestoreController *)v11 proximitySetupController];
  os_log_type_t v4 = [(ProximitySetupController *)v3 information];
  id v9 = [(SASProximityInformation *)v4 backupUUID];

  id v5 = [location[0] backup];
  id v6 = [v5 backupUUID];
  unsigned __int8 v7 = [v6 isEqualToString:v9];

  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v7 & 1;
}

- (void)_presentNetworkWarning:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyExpressRestoreController *)v16 networkProvider];
  os_log_type_t v4 = [(BuddyExpressRestoreController *)v16 backupItem];
  id v5 = [(RestorableBackupItem *)v4 snapshot];
  id v14 = +[BuddyRestoreNetworkAlertController alertControllerForNetworkConnectionWithProvider:v3 estimatedRestoreSize:[(MBSnapshot *)v5 estimatedRestoreSize]];

  if (v14)
  {
    int v8 = _NSConcreteStackBlock;
    uint64_t v9 = 3221225472;
    os_log_type_t v10 = sub_1001476A8;
    id v11 = &unk_1002B0D70;
    id v12 = location[0];
    [v14 setRestoreOverCellular:&v8];
    id v6 = [(BuddyExpressRestoreController *)v16 showModalWiFiSettingsBlock];
    [v14 setPresentWiFiSettings:v6];

    id v7 = [(BuddyExpressRestoreController *)v16 navigationController];
    [v7 presentViewController:v14 animated:1 completion:0];

    objc_storeStrong(&v12, 0);
    int v13 = 0;
  }
  else
  {
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    int v13 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (BuddyNetworkProvider)networkProvider
{
  return self->networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (id)showModalWiFiSettingsBlock
{
  return self->showModalWiFiSettingsBlock;
}

- (void)setShowModalWiFiSettingsBlock:(id)a3
{
}

- (BuddyBetaEnrollmentStateManager)betaEnrollmentStateManager
{
  return self->betaEnrollmentStateManager;
}

- (void)setBetaEnrollmentStateManager:(id)a3
{
}

- (BYSoftwareUpdateCache)softwareUpdateCache
{
  return self->softwareUpdateCache;
}

- (void)setSoftwareUpdateCache:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (RestorableBackupItem)backupItem
{
  return self->_backupItem;
}

- (void)setBackupItem:(id)a3
{
}

- (BOOL)isAbleToBackupBeforeRestore
{
  return self->_ableToBackupBeforeRestore;
}

- (void)setAbleToBackupBeforeRestore:(BOOL)a3
{
  self->_ableToBackupBeforeRestore = a3;
}

- (BOOL)forceSoftwareUpdateRequiredForNewBackup
{
  return self->_forceSoftwareUpdateRequiredForNewBackup;
}

- (void)setForceSoftwareUpdateRequiredForNewBackup:(BOOL)a3
{
  self->_forceSoftwareUpdateRequiredForNewBackup = a3;
}

- (BYAnalyticsExpressRestore)expressRestoreAnalytics
{
  return self->_expressRestoreAnalytics;
}

- (void)setExpressRestoreAnalytics:(id)a3
{
}

- (void).cxx_destruct
{
}

@end