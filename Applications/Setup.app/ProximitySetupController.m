@interface ProximitySetupController
+ (BOOL)_supportsDependentSetup:(id)a3;
- (BOOL)_allowedToPair;
- (BOOL)_isWaitingForReconnection;
- (BOOL)hasAppliedSettings;
- (BOOL)hasConnection;
- (BOOL)hasResumed;
- (BOOL)hasValidatedPasscode;
- (BOOL)intentToMigrate;
- (BOOL)isDisconnecting;
- (BOOL)reconnecting;
- (BOOL)shouldApplySettings;
- (BOOL)shouldEnableProximity;
- (BOOL)signedIniCloudAccount;
- (BOOL)skipExpressRestore;
- (BOOL)supportsIntent;
- (BOOL)userSkippedProximity;
- (BOOL)validatePasscode:(id)a3;
- (BYAnalyticsManager)analyticsManager;
- (BYBackupMetadata)backupMetadata;
- (BYBackupMetadata)backupMetadataFromTerminatedConnection;
- (BYBuddyDaemonProximityTargetClient)client;
- (BYExpressSetupDataSource)expressDataSource;
- (BYPreferencesController)buddyPreferences;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyFeatureFlags)featureFlags;
- (BuddyMiscState)miscState;
- (BuddyProximitySetupDependentController)dependentController;
- (BuddySetupMethod)setupMethod;
- (CUMessageSession)sharingMessageSession;
- (NSArray)preferredLanguages;
- (NSArray)receivedLanguages;
- (NSData)accessibilitySettings;
- (NSMutableArray)observers;
- (NSString)deviceClass;
- (NSString)deviceName;
- (NSString)model;
- (NSString)productVersion;
- (NSString)receivedLocale;
- (OS_dispatch_queue)observerQueue;
- (ProximitySetupController)initWithMiscState:(id)a3 buddyPreferences:(id)a4 buddyPreferencesExcludedFromBackup:(id)a5 featureFlags:(id)a6 analyticsManager:(id)a7 setupMethod:(id)a8;
- (ProximitySetupControllerDelegate)delegate;
- (SASProximityHandshake)handshake;
- (SASProximityInformation)information;
- (SASProximitySession)session;
- (id)createSignInTask;
- (id)createTargetDeviceMigrationManagerWithPrepareForMigrationRebootBlock:(id)a3 passcodeCacheManager:(id)a4 analyticsManager:(id)a5 lockdownModeProvider:(id)a6;
- (id)performHandshake;
- (id)resumeBlock;
- (void)_setConnected:(BOOL)a3;
- (void)_setSetupIntent;
- (void)_updatedMessageSession:(id)a3;
- (void)addObserver:(id)a3;
- (void)applySettings;
- (void)beginAdvertisingProximitySetup;
- (void)beginDeviceToDeviceMigration;
- (void)cloudConfigDidChange:(id)a3;
- (void)didApplySettings;
- (void)dismissProximityPinCode;
- (void)displayProximityPinCode:(id)a3 visual:(BOOL)a4;
- (void)endAdvertisingProximitySetup;
- (void)endDeviceToDeviceMigration;
- (void)endPairing;
- (void)languageChangeCompleted;
- (void)needsToResume:(id)a3;
- (void)notifyObserversConnectionTerminated;
- (void)pairingEndedByUser;
- (void)prepareForDependentSetup;
- (void)prepareForReboot;
- (void)proximityConnectionInitiated;
- (void)proximityConnectionPreparing:(id)a3;
- (void)proximityConnectionReconnected;
- (void)proximityConnectionTerminated;
- (void)proximitySetupCompleted:(id)a3;
- (void)ready;
- (void)readyForInformation;
- (void)receivedBackupAction:(id)a3;
- (void)receivedLanguages:(id)a3 locale:(id)a4 model:(id)a5 deviceClass:(id)a6 accessibilitySettings:(id)a7;
- (void)removeObserver:(id)a3;
- (void)resetInformation;
- (void)resumeSession;
- (void)setAccessibilitySettings:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setBackupMetadataFromTerminatedConnection:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setClient:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDependentController:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDisconnecting:(BOOL)a3;
- (void)setExpressDataSource:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setHandshake:(id)a3;
- (void)setHasAppliedSettings:(BOOL)a3;
- (void)setHasResumed:(BOOL)a3;
- (void)setHasValidatedPasscode:(BOOL)a3;
- (void)setInformation:(id)a3;
- (void)setIntentToMigrate:(BOOL)a3;
- (void)setMiscState:(id)a3;
- (void)setModel:(id)a3;
- (void)setObserverQueue:(id)a3;
- (void)setObservers:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setReceivedLanguages:(id)a3;
- (void)setReceivedLocale:(id)a3;
- (void)setReconnecting:(BOOL)a3;
- (void)setResumeBlock:(id)a3;
- (void)setSession:(id)a3;
- (void)setSetupMethod:(id)a3;
- (void)setShouldApplySettings:(BOOL)a3;
- (void)setSignedIniCloudAccount:(BOOL)a3;
- (void)setSkipExpressRestore:(BOOL)a3;
- (void)setSourceProxCardVisibliityForSIMSetupExternalAuthentication:(BOOL)a3;
- (void)setUserSkippedProximity:(BOOL)a3;
- (void)setupFinished;
- (void)showMigrationInterfaceOnSource;
- (void)skippedApplySettings;
- (void)startOver;
- (void)startReconnecting;
- (void)startiCloudBackup;
- (void)stopReconnecting;
- (void)suspendConnectionForSoftwareUpdate:(id)a3;
- (void)updateInformation:(id)a3;
- (void)waitForIntent:(id)a3;
- (void)waitForSessionReconnection:(id)a3;
- (void)willApplySettings:(id)a3;
@end

@implementation ProximitySetupController

- (ProximitySetupController)initWithMiscState:(id)a3 buddyPreferences:(id)a4 buddyPreferencesExcludedFromBackup:(id)a5 featureFlags:(id)a6 analyticsManager:(id)a7 setupMethod:(id)a8
{
  id v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  id v29 = 0;
  objc_storeStrong(&v29, a6);
  id v28 = 0;
  objc_storeStrong(&v28, a7);
  id v27 = 0;
  objc_storeStrong(&v27, a8);
  id v13 = v33;
  id v33 = 0;
  v26.receiver = v13;
  v26.super_class = (Class)ProximitySetupController;
  v14 = [(ProximitySetupController *)&v26 init];
  id v33 = v14;
  objc_storeStrong(&v33, v14);
  if (v14)
  {
    [v33 setMiscState:location[0]];
    [v33 setBuddyPreferences:v31];
    [v33 setBuddyPreferencesExcludedFromBackup:v30];
    [v33 setFeatureFlags:v29];
    [v33 setSetupMethod:v27];
    id v15 = objc_alloc_init((Class)BYBuddyDaemonProximityTargetClient);
    [v33 setClient:v15];

    id v16 = v33;
    id v17 = [v33 client];
    [v17 setDelegate:v16];

    [v33 setShouldApplySettings:1];
    id v18 = objc_alloc_init((Class)SASProximitySession);
    [v33 setSession:v18];

    id v19 = v33;
    id v20 = [v33 session];
    [v20 setDelegate:v19];

    id v21 = objc_alloc_init((Class)NSMutableArray);
    [v33 setObservers:v21];

    dispatch_queue_t v22 = dispatch_queue_create("Proximity Setup Termination Observer Queue", 0);
    [v33 setObserverQueue:v22];

    [v33 setAnalyticsManager:v28];
    v23 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v23 addObserver:v33 selector:"cloudConfigDidChange:" name:MCCloudConfigurationDidChangeNotification object:0];
  }
  v24 = (ProximitySetupController *)v33;
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v33, 0);
  return v24;
}

- (BOOL)shouldEnableProximity
{
  id v2 = +[BuddyCloudConfigManager sharedManager];
  char v15 = 0;
  char v13 = 0;
  unsigned __int8 v3 = 1;
  if (([v2 isMultiUser] & 1) == 0)
  {
    id v16 = +[BuddyCloudConfigManager sharedManager];
    char v15 = 1;
    unsigned __int8 v3 = 1;
    if (([v16 hasCloudConfiguration] & 1) == 0)
    {
      id v14 = +[MCProfileConnection sharedConnection];
      char v13 = 1;
      unsigned __int8 v3 = [v14 shouldShowCloudConfigurationUI];
    }
  }
  if (v13) {

  }
  if (v15) {
  char v17 = v3 & 1;
  }
  id v4 = +[BuddyDeviceManagementSupport sharedSupport];
  unsigned __int8 v5 = [v4 shouldDisallowProximityAdvertisement];

  if (v17 & 1) != 0 || (v5) {
    return 0;
  }
  v6 = [(ProximitySetupController *)self buddyPreferences];
  unsigned __int8 v7 = +[BuddyRestoreState hasStateFromPreferences:v6];

  if (v7) {
    return 0;
  }
  char v12 = BYSetupAssistantHasCompletedInitialRun() & 1;
  unsigned __int8 v8 = [(ProximitySetupController *)self userSkippedProximity];
  char v9 = 1;
  if ((v8 & 1) == 0)
  {
    unsigned __int8 v10 = [(ProximitySetupController *)self hasAppliedSettings];
    char v9 = 1;
    if ((v10 & 1) == 0) {
      char v9 = v12;
    }
  }
  return (v9 ^ 1) & 1;
}

- (BOOL)hasConnection
{
  id v2 = [(ProximitySetupController *)self session];
  unsigned __int8 v3 = [(SASProximitySession *)v2 isConnected];

  if (v3) {
    return ![(ProximitySetupController *)self isDisconnecting];
  }
  else {
    return 0;
  }
}

- (void)needsToResume:(id)a3
{
  char v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    if ([(ProximitySetupController *)v13 hasConnection]
      || [(ProximitySetupController *)v13 hasResumed])
    {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    }
    else
    {
      unsigned __int8 v3 = [(ProximitySetupController *)v13 client];
      id v4 = _NSConcreteStackBlock;
      int v5 = -1073741824;
      int v6 = 0;
      unsigned __int8 v7 = sub_10017B3E0;
      unsigned __int8 v8 = &unk_1002B0CF8;
      char v9 = v13;
      id v10 = location[0];
      [(BYBuddyDaemonProximityTargetClient *)v3 hasConnection:&v4];

      objc_storeStrong(&v10, 0);
      objc_storeStrong((id *)&v9, 0);
    }
    int v11 = 0;
  }
  else
  {
    int v11 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)resumeSession
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = location[0];
    os_log_type_t v3 = v12;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Resuming existing proximity setup session...", buf, 2u);
  }
  objc_storeStrong(location, 0);
  id v4 = [(ProximitySetupController *)v14 client];
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  unsigned __int8 v8 = sub_10017B570;
  char v9 = &unk_1002B4010;
  id v10 = v14;
  [(BYBuddyDaemonProximityTargetClient *)v4 resumeProximitySetup:&v5];

  objc_storeStrong((id *)&v10, 0);
}

- (void)beginAdvertisingProximitySetup
{
  if (![(ProximitySetupController *)self hasConnection])
  {
    id v2 = [(ProximitySetupController *)self client];
    [(BYBuddyDaemonProximityTargetClient *)v2 beginAdvertisingProximitySetup];
  }
}

- (void)endAdvertisingProximitySetup
{
  unsigned __int8 v8 = self;
  oslog[1] = (os_log_t)a2;
  if (![(ProximitySetupController *)self hasConnection])
  {
    if ([(ProximitySetupController *)v8 reconnecting])
    {
      oslog[0] = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
      {
        id v2 = oslog[0];
        os_log_type_t v3 = v6;
        sub_10004B24C(v5);
        _os_log_impl((void *)&_mh_execute_header, v2, v3, "Not ending advertising for proximity setup as we're waiting for reconnection...", (uint8_t *)v5, 2u);
      }
      objc_storeStrong((id *)oslog, 0);
    }
    else
    {
      id v4 = [(ProximitySetupController *)v8 client];
      [(BYBuddyDaemonProximityTargetClient *)v4 endAdvertisingProximitySetup];
    }
  }
}

- (void)endPairing
{
  -[ProximitySetupController setResumeBlock:](self, "setResumeBlock:", 0, a2);
  id v2 = [(ProximitySetupController *)self client];
  [(BYBuddyDaemonProximityTargetClient *)v2 endPairing];
}

- (void)resetInformation
{
}

- (void)updateInformation:(id)a3
{
  char v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ProximitySetupController *)v15 setInformation:location[0]];
  [(ProximitySetupController *)v15 setBackupMetadataFromTerminatedConnection:0];
  os_log_type_t v3 = [(ProximitySetupController *)v15 information];
  id v4 = [(SASProximityInformation *)v3 deviceName];
  [(ProximitySetupController *)v15 setDeviceName:v4];

  int v5 = [(ProximitySetupController *)v15 information];
  id v6 = [(SASProximityInformation *)v5 deviceModel];
  [(ProximitySetupController *)v15 setModel:v6];

  int v7 = [(ProximitySetupController *)v15 information];
  id v8 = [(SASProximityInformation *)v7 deviceClass];
  [(ProximitySetupController *)v15 setDeviceClass:v8];

  char v9 = [(ProximitySetupController *)v15 information];
  id v10 = [(SASProximityInformation *)v9 productVersion];
  [(ProximitySetupController *)v15 setProductVersion:v10];

  int v11 = [BYExpressSetupProximityDataSource alloc];
  os_log_type_t v12 = [(ProximitySetupController *)v15 information];
  char v13 = [(BYExpressSetupProximityDataSource *)v11 initWithInformation:v12];
  [(ProximitySetupController *)v15 setExpressDataSource:v13];

  objc_storeStrong(location, 0);
}

- (void)setupFinished
{
  if ([(ProximitySetupController *)self hasConnection])
  {
    [(ProximitySetupController *)self setDisconnecting:1];
    id v2 = [(ProximitySetupController *)self session];
    id v3 = objc_alloc_init((Class)SASProximityFinishedAction);
    id v4 = [(SASProximitySession *)v2 sendAction:v3];

    [(ProximitySetupController *)self _setConnected:0];
    [(ProximitySetupController *)self notifyObserversConnectionTerminated];
  }
  [(ProximitySetupController *)self endAdvertisingProximitySetup];
  int v5 = [(ProximitySetupController *)self miscState];
  id v6 = [(BuddyMiscState *)v5 migrationManager];
  [(BuddyTargetDeviceMigrationManager *)v6 cancelWithCause:9];
}

- (void)cloudConfigDidChange:(id)a3
{
  int v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[BuddyCloudConfigManager sharedManager];
  id v4 = [v3 cloudConfigurationDetails];

  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = oslog;
      os_log_type_t v6 = v8;
      sub_10004B24C(v7);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Ending proximity setup advertising due to cloud configuration...", (uint8_t *)v7, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(ProximitySetupController *)v11 endAdvertisingProximitySetup];
  }
  objc_storeStrong(location, 0);
}

- (BYBackupMetadata)backupMetadata
{
  id v2 = [(ProximitySetupController *)self information];
  id v3 = [(SASProximityInformation *)v2 backupMetadata];
  id v4 = (id)BYMetadataFromDataArchive();

  return (BYBackupMetadata *)v4;
}

- (NSArray)preferredLanguages
{
  id v2 = [(ProximitySetupController *)self information];
  id v3 = [(SASProximityInformation *)v2 localePreferences];
  id v4 = [v3 objectForKeyedSubscript:@"AppleLanguages"];

  return (NSArray *)v4;
}

- (void)languageChangeCompleted
{
  id v10 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v8;
    sub_10004B24C(v7);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Applying settings from proximity setup after a language reboot..", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  id v4 = [(ProximitySetupController *)v10 backupMetadata];
  unsigned __int8 v5 = [(BYBackupMetadata *)v4 hasUserInterfaceStyleMode];

  if (v5)
  {
    os_log_type_t v6 = [(ProximitySetupController *)v10 buddyPreferences];
    [(BYPreferencesController *)v6 setObject:&__kCFBooleanTrue forKey:@"UserInterfaceStyleModePresented"];
  }
}

- (CUMessageSession)sharingMessageSession
{
  id v2 = [(ProximitySetupController *)self session];
  id v3 = [(SASProximitySession *)v2 sharingMessageSession];

  return (CUMessageSession *)v3;
}

- (id)createTargetDeviceMigrationManagerWithPrepareForMigrationRebootBlock:(id)a3 passcodeCacheManager:(id)a4 analyticsManager:(id)a5 lockdownModeProvider:(id)a6
{
  dispatch_queue_t v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v18 = 0;
  objc_storeStrong(&v18, a6);
  char v9 = [(ProximitySetupController *)v22 client];
  id v17 = [(BYBuddyDaemonProximityTargetClient *)v9 fileTransferSessionTemplate];

  id v10 = [BuddyTargetDeviceMigrationManager alloc];
  int v11 = v22;
  id v12 = location[0];
  id v13 = v20;
  id v14 = [(ProximitySetupController *)v22 buddyPreferencesExcludedFromBackup];
  char v15 = [(BuddyTargetDeviceMigrationManager *)v10 initWithFileTranferSession:v17 proximitySetupController:v11 prepareForMigrationRebootBlock:v12 passcodeCacheManager:v13 buddyPreferencesExcludedFromBackup:v14 analyticsManager:v19 lockdownModeProvider:v18];

  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);

  return v15;
}

- (void)beginDeviceToDeviceMigration
{
  int v11 = self;
  v10[1] = (id)a2;
  id v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  os_log_type_t v8 = sub_10017C1A0;
  char v9 = &unk_1002B0D20;
  v10[0] = v11;
  dispatch_async(v2, &block);

  id v3 = [(ProximitySetupController *)v11 miscState];
  id v4 = [(BuddyMiscState *)v3 migrationManager];
  [(BuddyTargetDeviceMigrationManager *)v4 start];

  objc_storeStrong(v10, 0);
}

- (void)endDeviceToDeviceMigration
{
  id v2 = [(ProximitySetupController *)self client];
  [(BYBuddyDaemonProximityTargetClient *)v2 endDeviceToDeviceMigration];
}

- (void)showMigrationInterfaceOnSource
{
  int v7 = self;
  v6[1] = (id)a2;
  v6[0] = objc_alloc_init((Class)SASProximityMigrationTransferPreparationAction);
  id v8 = (id)MGCopyAnswer();
  id v2 = v8;
  [v6[0] setDeviceName:v2];

  id v3 = [(ProximitySetupController *)v7 session];
  id v4 = [(SASProximitySession *)v3 sendAction:v6[0]];

  unsigned __int8 v5 = [(ProximitySetupController *)v7 client];
  [(BYBuddyDaemonProximityTargetClient *)v5 showMigrationInterfaceOnSource];

  objc_storeStrong(v6, 0);
}

- (void)suspendConnectionForSoftwareUpdate:(id)a3
{
  unsigned __int8 v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(ProximitySetupController *)v5 client];
  [(BYBuddyDaemonProximityTargetClient *)v3 suspendConnectionForSoftwareUpdate:location[0]];

  objc_storeStrong(location, 0);
}

- (void)setSourceProxCardVisibliityForSIMSetupExternalAuthentication:(BOOL)a3
{
  if (a3)
  {
    id v3 = [(ProximitySetupController *)self client];
    [(BYBuddyDaemonProximityTargetClient *)v3 endSIMSetupExternalAuthentication];
  }
  else
  {
    id v3 = [(ProximitySetupController *)self client];
    [(BYBuddyDaemonProximityTargetClient *)v3 beginSIMSetupExternalAuthentication];
  }
}

- (void)startReconnecting
{
}

- (void)stopReconnecting
{
}

- (void)waitForSessionReconnection:(id)a3
{
  int v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v4 = 0;
  BOOL v3 = 0;
  if ([(ProximitySetupController *)v7 hasConnection])
  {
    unsigned __int8 v5 = [(ProximitySetupController *)v7 information];
    char v4 = 1;
    BOOL v3 = v5 != 0;
  }
  if (v4) {

  }
  if (v3)
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
    [(ProximitySetupController *)v7 setResumeBlock:0];
  }
  else
  {
    [(ProximitySetupController *)v7 setResumeBlock:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)prepareForDependentSetup
{
  char v15 = self;
  oslog[1] = (os_log_t)a2;
  uint64_t v2 = objc_opt_class();
  BOOL v3 = [(ProximitySetupController *)v15 information];
  LOBYTE(v2) = [(id)v2 _supportsDependentSetup:v3];

  if (v2)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      char v4 = oslog[0];
      os_log_type_t v5 = v13;
      sub_10004B24C(v12);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Preparing for dependent setup...", (uint8_t *)v12, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    int v6 = [BuddyProximitySetupDependentController alloc];
    int v7 = [(ProximitySetupController *)v15 sharingMessageSession];
    id v8 = [(ProximitySetupController *)v15 featureFlags];
    char v9 = [(BuddyProximitySetupDependentController *)v6 initWithMessageSession:v7 featureFlags:v8];
    [(ProximitySetupController *)v15 setDependentController:v9];

    id v10 = v15;
    int v11 = [(ProximitySetupController *)v15 dependentController];
    [(ProximitySetupController *)v10 addObserver:v11];
  }
  else
  {
    [(ProximitySetupController *)v15 setDependentController:0];
  }
}

- (BOOL)supportsIntent
{
  uint64_t v2 = [(ProximitySetupController *)self dependentController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)waitForIntent:(id)a3
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(ProximitySetupController *)v12 supportsIntent])
  {
    BOOL v3 = [(ProximitySetupController *)v12 dependentController];
    char v4 = _NSConcreteStackBlock;
    int v5 = -1073741824;
    int v6 = 0;
    int v7 = sub_10017C874;
    id v8 = &unk_1002B4038;
    id v9 = location[0];
    [(BuddyProximitySetupDependentController *)v3 waitForSelectedAccountType:&v4];

    objc_storeStrong(&v9, 0);
    int v10 = 0;
  }
  else
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
    int v10 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)startOver
{
  int v11 = self;
  v10[1] = (id)a2;
  [(ProximitySetupController *)self setHasAppliedSettings:0];
  [(ProximitySetupController *)v11 setHasValidatedPasscode:0];
  [(ProximitySetupController *)v11 setSignedIniCloudAccount:0];
  [(ProximitySetupController *)v11 setSkipExpressRestore:0];
  uint64_t v2 = [(ProximitySetupController *)v11 miscState];
  BOOL v3 = [(BuddyMiscState *)v2 migrationManager];
  [(BuddyTargetDeviceMigrationManager *)v3 reset];

  char v4 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_10017CA20;
  id v9 = &unk_1002B0D20;
  v10[0] = v11;
  dispatch_async(v4, &block);

  objc_storeStrong(v10, 0);
}

- (id)createSignInTask
{
  int v11 = self;
  location[1] = (id)a2;
  uint64_t v2 = [BuddyProximityAppleIDSignInTask alloc];
  BOOL v3 = [(ProximitySetupController *)v11 session];
  char v4 = [(ProximitySetupController *)v11 analyticsManager];
  int v5 = [(ProximitySetupController *)v11 featureFlags];
  location[0] = [(BuddyProximityAppleIDSignInTask *)v2 initWithSession:v3 analyticsManager:v4 featureFlags:v5];

  int v6 = [(ProximitySetupController *)v11 sharingMessageSession];
  [location[0] setMessageSession:v6];

  int v7 = [(ProximitySetupController *)v11 information];
  [location[0] setMakeStoreServiceActive:[SASProximityInformation usesSameAccountForiTunes] & 1];

  id v8 = location[0];
  objc_storeStrong(location, 0);
  return v8;
}

- (void)prepareForReboot
{
  char v15 = self;
  SEL v14 = a2;
  char v12 = 0;
  BOOL v2 = 1;
  if ([(ProximitySetupController *)self hasAppliedSettings])
  {
    id v13 = [(ProximitySetupController *)v15 information];
    char v12 = 1;
    BOOL v2 = v13 == 0;
  }
  if (v12) {

  }
  if (!v2)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v3 = oslog;
      os_log_type_t v4 = v10;
      sub_10004B24C(v9);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Saving proximity state for language/locale reboot...", (uint8_t *)v9, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v5 = [(ProximitySetupController *)v15 client];
    int v6 = [(ProximitySetupController *)v15 information];
    [(BYBuddyDaemonProximityTargetClient *)v5 storeInformation:v6];

    int v7 = [(ProximitySetupController *)v15 client];
    id v8 = [(ProximitySetupController *)v15 handshake];
    [(BYBuddyDaemonProximityTargetClient *)v7 storeHandshake:v8];
  }
}

- (BOOL)validatePasscode:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = objc_alloc_init((Class)SASProximityPasscodeValidationAction);
  [v6 setPasscode:location[0]];
  BOOL v3 = [(ProximitySetupController *)v8 session];
  id v4 = [(SASProximitySession *)v3 sendAction:v6];

  LOBYTE(v3) = [v6 passcodeValid];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)willApplySettings:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [(ProximitySetupController *)v5 delegate];
  [(ProximitySetupControllerDelegate *)v3 willApplyProximitySettingsWithCompletion:location[0]];

  objc_storeStrong(location, 0);
}

- (void)didApplySettings
{
  id v9 = self;
  v8[1] = (id)a2;
  BOOL v2 = [(ProximitySetupController *)self delegate];
  BOOL v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_10017CF04;
  int v7 = &unk_1002B0EC0;
  v8[0] = v9;
  [(ProximitySetupControllerDelegate *)v2 didApplyProximitySettingsWithWillReboot:&v3];

  objc_storeStrong(v8, 0);
}

- (void)skippedApplySettings
{
  BOOL v2 = [(ProximitySetupController *)self delegate];
  [(ProximitySetupControllerDelegate *)v2 skippedApplyProximitySettings];
}

- (void)applySettings
{
  v133 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v131 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v2 = location[0];
    os_log_type_t v3 = v131;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Applying settings from proximity setup...", buf, 2u);
  }
  objc_storeStrong((id *)location, 0);
  id v129 = (id)_BYLoggingFacility();
  os_log_type_t v128 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v129, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(ProximitySetupController *)v133 information];
    id v5 = [(SASProximityInformation *)v4 localePreferences];
    sub_10004B238((uint64_t)v143, (uint64_t)v5);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v129, v128, "Setting the locale preferences to %@", v143, 0xCu);
  }
  objc_storeStrong(&v129, 0);
  id v6 = [(ProximitySetupController *)v133 information];
  id v7 = [(SASProximityInformation *)v6 localePreferences];

  if (v7)
  {
    id v8 = [(ProximitySetupController *)v133 information];
    id v9 = [(SASProximityInformation *)v8 localePreferences];
    +[NSLocale setArchivedPreferences:v9];

    id v127 = (id)CFPreferencesCopyValue(@"AppleLocale", kCFPreferencesAnyApplication, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    id v126 = (id)_BYLoggingFacility();
    os_log_type_t v125 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v126, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)v142, (uint64_t)v127);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v126, v125, "Setting the locale to %@", v142, 0xCu);
    }
    objc_storeStrong(&v126, 0);
    id v10 = +[UIKeyboardPreferencesController sharedPreferencesController];
    [v10 setValue:v127 forKey:3];

    int v11 = [(ProximitySetupController *)v133 buddyPreferences];
    [(BYPreferencesController *)v11 setObject:v127 forKey:@"Locale"];

    objc_storeStrong(&v127, 0);
  }
  else
  {
    id v124 = (id)_BYLoggingFacility();
    os_log_type_t v123 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v124, OS_LOG_TYPE_DEFAULT))
    {
      char v12 = v124;
      os_log_type_t v13 = v123;
      sub_10004B24C(v122);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "No data received for locale preferences. Proximity data source obsolete.", v122, 2u);
    }
    objc_storeStrong(&v124, 0);
  }
  SEL v14 = [(ProximitySetupController *)v133 information];
  id v15 = [(SASProximityInformation *)v14 keyboards];

  if (v15)
  {
    id v121 = (id)_BYLoggingFacility();
    os_log_type_t v120 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v121, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [(ProximitySetupController *)v133 information];
      id v17 = [(SASProximityInformation *)v16 keyboards];
      sub_10004B238((uint64_t)v141, (uint64_t)v17);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v121, v120, "Setting the keyboards to %@", v141, 0xCu);
    }
    objc_storeStrong(&v121, 0);
    id v18 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v19 = [(ProximitySetupController *)v133 information];
    id v20 = [(SASProximityInformation *)v19 keyboards];
    [v18 saveInputModes:v20];
  }
  else
  {
    id v119 = (id)_BYLoggingFacility();
    os_log_type_t v118 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v119, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v119;
      os_log_type_t v22 = v118;
      sub_10004B24C(v117);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "No data received for keyboards...", v117, 2u);
    }
    objc_storeStrong(&v119, 0);
  }
  v23 = [(ProximitySetupController *)v133 information];
  id v24 = [(SASProximityInformation *)v23 timeZone];

  if (v24)
  {
    v25 = [(ProximitySetupController *)v133 information];
    id v26 = [(SASProximityInformation *)v25 timeZone];
    [v26 UTF8String];
    int v27 = tzlink();

    int v116 = v27;
    if (v27)
    {
      id v111 = (id)_BYLoggingFacility();
      os_log_type_t v110 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v111, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [(ProximitySetupController *)v133 information];
        id v36 = [(SASProximityInformation *)v35 timeZone];
        v37 = strerror(v116);
        sub_10017E150((uint64_t)v138, (uint64_t)v36, (uint64_t)v37);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v111, v110, "Failed to change time zone to %@ - %s", v138, 0x16u);
      }
      objc_storeStrong(&v111, 0);
    }
    else
    {
      id v115 = (id)_BYLoggingFacility();
      os_log_type_t v114 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v115, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [(ProximitySetupController *)v133 information];
        if ([(SASProximityInformation *)v28 automaticTimeZoneEnabled]) {
          CFStringRef v29 = @"enabled";
        }
        else {
          CFStringRef v29 = @"disabled";
        }
        sub_10004B238((uint64_t)v140, (uint64_t)v29);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v115, v114, "Setting automatic time zone setting to %@", v140, 0xCu);
      }
      objc_storeStrong(&v115, 0);
      id v30 = [(ProximitySetupController *)v133 information];
      [(SASProximityInformation *)v30 automaticTimeZoneEnabled];
      TMSetAutomaticTimeZoneEnabled();

      id v113 = (id)_BYLoggingFacility();
      os_log_type_t v112 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v113, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [(ProximitySetupController *)v133 information];
        id v32 = [(SASProximityInformation *)v31 timeZone];
        sub_10004B238((uint64_t)v139, (uint64_t)v32);
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v113, v112, "Setting the time zone to %@...", v139, 0xCu);
      }
      objc_storeStrong(&v113, 0);
      id v33 = [(ProximitySetupController *)v133 information];
      id v34 = [(SASProximityInformation *)v33 timeZone];
      CFPreferencesSetAppValue(@"timezone", v34, @"com.apple.preferences.datetime");

      CFPreferencesSetAppValue(@"timezoneset", kCFBooleanTrue, @"com.apple.preferences.datetime");
      CFPreferencesAppSynchronize(@"com.apple.preferences.datetime");
      +[NSTimeZone resetSystemTimeZone];
    }
  }
  else
  {
    id v109 = (id)_BYLoggingFacility();
    os_log_type_t v108 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v109, OS_LOG_TYPE_DEFAULT))
    {
      v38 = v109;
      os_log_type_t v39 = v108;
      sub_10004B24C(v107);
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "No data received for time zone...", v107, 2u);
    }
    objc_storeStrong(&v109, 0);
  }
  v40 = [(ProximitySetupController *)v133 backupMetadata];
  unsigned __int8 v41 = [(BYBackupMetadata *)v40 hasUserInterfaceStyleMode];

  if (v41)
  {
    id v106 = (id)_BYLoggingFacility();
    os_log_type_t v105 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v106, OS_LOG_TYPE_DEFAULT))
    {
      v42 = [(ProximitySetupController *)v133 backupMetadata];
      sub_100046588((uint64_t)v137, (uint64_t)[(BYBackupMetadata *)v42 userInterfaceStyleMode]);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v106, v105, "Applying settings from proximity setup for appearance %lli ...", v137, 0xCu);
    }
    objc_storeStrong(&v106, 0);
    id v43 = [objc_alloc((Class)UISUserInterfaceStyleMode) initWithDelegate:0];
    v44 = [(ProximitySetupController *)v133 backupMetadata];
    [v43 setModeValue:[v44 userInterfaceStyleMode]];

    v45 = [(ProximitySetupController *)v133 buddyPreferences];
    [(BYPreferencesController *)v45 setObject:&__kCFBooleanTrue forKey:@"UserInterfaceStyleModePresented"];
  }
  else
  {
    id v104 = (id)_BYLoggingFacility();
    os_log_type_t v103 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v104, OS_LOG_TYPE_DEFAULT))
    {
      v46 = v104;
      os_log_type_t v47 = v103;
      sub_10004B24C(v102);
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "No data received for appearance settings...", v102, 2u);
    }
    objc_storeStrong(&v104, 0);
  }
  v48 = [(ProximitySetupController *)v133 information];
  id v49 = [(SASProximityInformation *)v48 accessibilitySettings];

  if (v49)
  {
    id v101 = (id)_BYLoggingFacility();
    os_log_type_t v100 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v101, OS_LOG_TYPE_DEFAULT))
    {
      v50 = v101;
      os_log_type_t v51 = v100;
      sub_10004B24C(v99);
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "Applying accessibility settings...", v99, 2u);
    }
    objc_storeStrong(&v101, 0);
    v52 = [(ProximitySetupController *)v133 information];
    id v53 = [(SASProximityInformation *)v52 accessibilitySettings];
    _AXSRestoreSettingsFromDataBlobForBuddy();
  }
  else
  {
    id v98 = (id)_BYLoggingFacility();
    os_log_type_t v97 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v98, OS_LOG_TYPE_DEFAULT))
    {
      v54 = v98;
      os_log_type_t v55 = v97;
      sub_10004B24C(v96);
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "No data received for accessibility settings...", v96, 2u);
    }
    objc_storeStrong(&v98, 0);
  }
  v56 = [(ProximitySetupController *)v133 information];
  id v57 = [(SASProximityInformation *)v56 allowMoreOn5G];
  unsigned __int8 v58 = [v57 BOOLValue];

  if (v58)
  {
    id v95 = (id)_BYLoggingFacility();
    os_log_type_t v94 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v95, OS_LOG_TYPE_DEFAULT))
    {
      v59 = v95;
      os_log_type_t v60 = v94;
      sub_10004B24C(v93);
      _os_log_impl((void *)&_mh_execute_header, v59, v60, "Enabling Allow More on 5G...", v93, 2u);
    }
    objc_storeStrong(&v95, 0);
    id v61 = objc_alloc((Class)CoreTelephonyClient);
    v62 = dispatch_get_global_queue(0, 0);
    id v92 = [v61 initWithQueue:v62];

    id v91 = 0;
    id v89 = 0;
    id v63 = [v92 getCurrentDataSubscriptionContextSync:&v89];
    objc_storeStrong(&v91, v89);
    id v90 = v63;
    if (v91)
    {
      id v88 = (id)_BYLoggingFacility();
      os_log_type_t v87 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v88, OS_LOG_TYPE_ERROR))
      {
        char v85 = 0;
        char v83 = 0;
        if (_BYIsInternalInstall())
        {
          v64 = (NSString *)v91;
        }
        else if (v91)
        {
          id v86 = [v91 domain];
          char v85 = 1;
          v64 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v86, [v91 code]);
          id v84 = v64;
          char v83 = 1;
        }
        else
        {
          v64 = 0;
        }
        sub_10004BB7C((uint64_t)v136, (uint64_t)v64);
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v88, v87, "Failed to get data subscription context: %{public}@", v136, 0xCu);
        if (v83) {

        }
        if (v85) {
      }
        }
      objc_storeStrong(&v88, 0);
    }
    id v82 = +[CTServiceDescriptor descriptorWithSubscriptionContext:v90];
    id v65 = [v92 setLowDataMode:v82 enable:0];
    id v66 = v91;
    id v91 = v65;

    if (v91)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v80 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        char v78 = 0;
        char v76 = 0;
        if (_BYIsInternalInstall())
        {
          v67 = (NSString *)v91;
        }
        else if (v91)
        {
          id v79 = [v91 domain];
          char v78 = 1;
          v67 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v79, [v91 code]);
          id v77 = v67;
          char v76 = 1;
        }
        else
        {
          v67 = 0;
        }
        sub_10004BB7C((uint64_t)v135, (uint64_t)v67);
        _os_log_error_impl((void *)&_mh_execute_header, oslog, v80, "Failed to set low data mode: %{public}@", v135, 0xCu);
        if (v76) {

        }
        if (v78) {
      }
        }
      objc_storeStrong((id *)&oslog, 0);
    }
    id v68 = [v92 setInterfaceCost:v82 expensive:0];
    id v69 = v91;
    id v91 = v68;

    if (v91)
    {
      os_log_t v75 = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
      {
        char v73 = 0;
        char v71 = 0;
        if (_BYIsInternalInstall())
        {
          v70 = (NSString *)v91;
        }
        else if (v91)
        {
          id v74 = [v91 domain];
          char v73 = 1;
          v70 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v74, [v91 code]);
          v72 = v70;
          char v71 = 1;
        }
        else
        {
          v70 = 0;
        }
        sub_10004BB7C((uint64_t)v134, (uint64_t)v70);
        _os_log_error_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "Failed to set interface cost: %{public}@", v134, 0xCu);
        if (v71) {

        }
        if (v73) {
      }
        }
      objc_storeStrong((id *)&v75, 0);
    }
    objc_storeStrong(&v82, 0);
    objc_storeStrong(&v90, 0);
    objc_storeStrong(&v91, 0);
    objc_storeStrong(&v92, 0);
  }
  [(ProximitySetupController *)v133 setHasAppliedSettings:1];
  [(ProximitySetupController *)v133 didApplySettings];
}

- (void)startiCloudBackup
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init((Class)SASProximityBackupAction);
  [location[0] setShouldStartBackup:1];
  BOOL v2 = [(ProximitySetupController *)v5 session];
  id v3 = [(SASProximitySession *)v2 sendAction:location[0]];

  objc_storeStrong(location, 0);
}

- (void)addObserver:(id)a3
{
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(ProximitySetupController *)v12 observerQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_10017E308;
  id v8 = &unk_1002B12F0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)removeObserver:(id)a3
{
  char v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(ProximitySetupController *)v12 observerQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_10017E46C;
  id v8 = &unk_1002B12F0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)notifyObserversConnectionTerminated
{
  id v9 = self;
  v8[1] = (id)a2;
  BOOL v2 = [(ProximitySetupController *)self observerQueue];
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_10017E58C;
  id v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async((dispatch_queue_t)v2, &block);

  objc_storeStrong(v8, 0);
}

- (BOOL)_allowedToPair
{
  int v5 = self;
  v4[1] = (id)a2;
  if ([(ProximitySetupController *)self intentToMigrate])
  {
    v4[0] = (id)MGCopyAnswer();
    BOOL v2 = [(ProximitySetupController *)v5 deviceClass];
    char v6 = +[BuddyMigrationCapability isMigrationSupportedFromDeviceClass:v2 toDeviceClass:v4[0] reason:0];

    objc_storeStrong(v4, 0);
  }
  else
  {
    char v6 = 1;
  }
  return v6 & 1;
}

- (void)_updatedMessageSession:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = location[0];
  int v4 = [(ProximitySetupController *)v7 session];
  [(SASProximitySession *)v4 setSharingMessageSession:v3];

  int v5 = [(ProximitySetupController *)v7 session];
  [(SASProximitySession *)v5 activate];

  objc_storeStrong(location, 0);
}

- (void)_setConnected:(BOOL)a3
{
  [(ProximitySetupController *)self setDisconnecting:0];
  id v3 = [(ProximitySetupController *)self session];
  [(SASProximitySession *)v3 setConnected:a3];

  if (!a3)
  {
    int v4 = [(ProximitySetupController *)self session];
    [(SASProximitySession *)v4 setSharingMessageSession:0];
  }
}

+ (BOOL)_supportsDependentSetup:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [location[0] productVersion];
  id v4 = [v3 compare:@"16" options:64];
  char v7 = 0;
  BOOL v5 = 0;
  if (v4 != (id)-1)
  {
    id v8 = [location[0] appleID];
    char v7 = 1;
    BOOL v5 = v8 != 0;
  }
  BOOL v10 = v5;
  if (v7) {

  }
  objc_storeStrong(location, 0);
  return v10;
}

- (void)_setSetupIntent
{
  BOOL v2 = [(ProximitySetupController *)self setupMethod];
  [(BuddySetupMethod *)v2 setIntent:1];
}

- (void)proximitySetupCompleted:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      char v6 = 0;
      char v4 = 0;
      if (_BYIsInternalInstall())
      {
        id v3 = (NSString *)location[0];
      }
      else if (location[0])
      {
        id v7 = [location[0] domain];
        char v6 = 1;
        id v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v7, [location[0] code]);
        BOOL v5 = v3;
        char v4 = 1;
      }
      else
      {
        id v3 = 0;
      }
      sub_10004BB7C((uint64_t)buf, (uint64_t)v3);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Proximity setup failed with error: %{public}@", buf, 0xCu);
      if (v4) {

      }
      if (v6) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)displayProximityPinCode:(id)a3 visual:(BOOL)a4
{
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v33 = a4;
  if ([(ProximitySetupController *)v35 _isWaitingForReconnection])
  {
    id v32 = (id)_BYLoggingFacility();
    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = v32;
      os_log_type_t v6 = v31;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "DisplayProximityPinCode called while reconnecting session. Abort proximity setup...", buf, 2u);
    }
    objc_storeStrong(&v32, 0);
    id v7 = (void (**)(id, void))[(ProximitySetupController *)v35 resumeBlock];
    v7[2](v7, 0);

    [(ProximitySetupController *)v35 endPairing];
    int v29 = 1;
  }
  else if ([(ProximitySetupController *)v35 _allowedToPair])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = oslog;
      os_log_type_t v10 = v21;
      sub_10004B24C(v20);
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Displaying pairing code to user...", v20, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v11 = &_dispatch_main_q;
    char v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    id v15 = sub_10017EF08;
    id v16 = &unk_1002B15A0;
    id v17 = v35;
    id v18 = location[0];
    BOOL v19 = v33;
    dispatch_async((dispatch_queue_t)v11, &v12);

    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v17, 0);
    int v29 = 0;
  }
  else
  {
    id v8 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v24 = -1073741824;
    int v25 = 0;
    id v26 = sub_10017EE94;
    int v27 = &unk_1002B0D20;
    id v28 = v35;
    dispatch_async((dispatch_queue_t)v8, &block);

    [(ProximitySetupController *)v35 endPairing];
    int v29 = 1;
    objc_storeStrong((id *)&v28, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)dismissProximityPinCode
{
  int v14 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v2 = location[0];
    os_log_type_t v3 = v12;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Dismissing pairing code...", buf, 2u);
  }
  objc_storeStrong(location, 0);
  [(ProximitySetupController *)v14 resetInformation];
  char v4 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_10017F218;
  id v9 = &unk_1002B0D20;
  os_log_type_t v10 = v14;
  dispatch_async((dispatch_queue_t)v4, &block);

  objc_storeStrong((id *)&v10, 0);
}

- (void)proximityConnectionPreparing:(id)a3
{
  char v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(ProximitySetupController *)v4 _updatedMessageSession:location[0]];
  objc_storeStrong(location, 0);
}

- (void)proximityConnectionInitiated
{
  int v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v2 = oslog[0];
    os_log_type_t v3 = v5;
    sub_10004B24C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Proximity connection initiated...", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(ProximitySetupController *)v7 _setConnected:1];
}

- (id)performHandshake
{
  os_log_type_t v22 = self;
  v21[1] = (id)a2;
  v21[0] = 0;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v2 = oslog;
    os_log_type_t v3 = v19;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Handshaking with source device...", buf, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id location = objc_alloc_init((Class)SASProximityHandshakeAction);
  char v4 = [(ProximitySetupController *)v22 session];
  id v5 = [(SASProximitySession *)v4 sendAction:location];
  id v6 = v21[0];
  v21[0] = v5;

  if (v21[0])
  {
    os_log_t v16 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)v23, (uint64_t)v21[0]);
      _os_log_impl((void *)&_mh_execute_header, v16, v15, "Failed to handshake - %@", v23, 0xCu);
    }
    objc_storeStrong((id *)&v16, 0);
  }
  else
  {
    id v7 = [location handshake];
    [(ProximitySetupController *)v22 setHandshake:v7];

    os_log_t v14 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v14;
      os_log_type_t v9 = v13;
      sub_10004B24C(v12);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Handshake complete!", (uint8_t *)v12, 2u);
    }
    objc_storeStrong((id *)&v14, 0);
  }
  id v10 = v21[0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(v21, 0);
  return v10;
}

- (void)readyForInformation
{
  v46 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility();
  os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v2 = location[0];
    os_log_type_t v3 = v44;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Requesting information from source device...", buf, 2u);
  }
  objc_storeStrong(location, 0);
  char v4 = [(ProximitySetupController *)v46 session];
  int v5 = [(SASProximitySession *)v4 isConnected] & 1;

  if (!v5)
  {
    id v42 = (id)_BYLoggingFacility();
    char v41 = 16;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
    {
      id v6 = v42;
      os_log_type_t v7 = v41;
      sub_10004B24C(v40);
      _os_log_error_impl((void *)&_mh_execute_header, v6, v7, "ProximitySetupController should have valid connection since we are ready for information.", v40, 2u);
    }
    objc_storeStrong(&v42, 0);
  }
  [(ProximitySetupController *)v46 _setSetupIntent];
  id v39 = objc_alloc_init((Class)SASProximityInformationAction);
  id v8 = [(ProximitySetupController *)v46 session];
  id v9 = [(SASProximitySession *)v8 sendAction:v39];

  if (![(ProximitySetupController *)v46 intentToMigrate]) {
    goto LABEL_10;
  }
  id v10 = [v39 information];
  int v11 = [(ProximitySetupController *)v46 productVersion];
  os_log_type_t v12 = [(ProximitySetupController *)v46 deviceClass];
  unsigned __int8 v13 = +[BuddyMigrationCapability sourceDeviceSupportsMigration:v10 productVersion:v11 deviceClass:v12 softwareUpdateRequired:0 reason:0];

  char v38 = v13 & 1;
  if (v13)
  {
LABEL_10:
    os_log_type_t v15 = v46;
    id v16 = [v39 information];
    [(ProximitySetupController *)v15 updateInformation:v16];

    id v17 = [(ProximitySetupController *)v46 resumeBlock];
    if (v17)
    {
      id v18 = (void (**)(id, uint64_t))[(ProximitySetupController *)v46 resumeBlock];
      v18[2](v18, 1);

      [(ProximitySetupController *)v46 setResumeBlock:0];
    }
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v19 = oslog;
      os_log_type_t v20 = v29;
      sub_10004B24C(v28);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Received information from source device!", v28, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if ([(ProximitySetupController *)v46 shouldApplySettings])
    {
      os_log_type_t v21 = v46;
      os_log_type_t v22 = _NSConcreteStackBlock;
      int v23 = -1073741824;
      int v24 = 0;
      int v25 = sub_10017FA84;
      id v26 = &unk_1002B0D20;
      int v27 = v46;
      [(ProximitySetupController *)v21 willApplySettings:&v22];
      objc_storeStrong((id *)&v27, 0);
    }
    else
    {
      [(ProximitySetupController *)v46 skippedApplySettings];
    }
    int v31 = 0;
  }
  else
  {
    [(ProximitySetupController *)v46 setupFinished];
    os_log_t v14 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v33 = -1073741824;
    int v34 = 0;
    v35 = sub_10017FA34;
    id v36 = &unk_1002B0D20;
    v37 = v46;
    dispatch_async((dispatch_queue_t)v14, &block);

    int v31 = 1;
    objc_storeStrong((id *)&v37, 0);
  }
  objc_storeStrong(&v39, 0);
}

- (void)proximityConnectionTerminated
{
  id v8 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v2 = oslog[0];
    os_log_type_t v3 = v6;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Proximity connection has disconnected", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(ProximitySetupController *)v8 _setConnected:0];
  [(ProximitySetupController *)v8 notifyObserversConnectionTerminated];
  id location = [(ProximitySetupController *)v8 backupMetadata];
  [(ProximitySetupController *)v8 resetInformation];
  [(ProximitySetupController *)v8 setBackupMetadataFromTerminatedConnection:location];
  [(ProximitySetupController *)v8 endAdvertisingProximitySetup];
  objc_storeStrong(&location, 0);
}

- (void)proximityConnectionReconnected
{
  os_log_type_t v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v2 = oslog[0];
    os_log_type_t v3 = v5;
    sub_10004B24C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Proximity connection has reconnected", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(ProximitySetupController *)v7 setShouldApplySettings:0];
  [(ProximitySetupController *)v7 stopReconnecting];
  [(ProximitySetupController *)v7 _setConnected:1];
}

- (void)receivedLanguages:(id)a3 locale:(id)a4 model:(id)a5 deviceClass:(id)a6 accessibilitySettings:(id)a7
{
  os_log_type_t v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  id v16 = 0;
  objc_storeStrong(&v16, a5);
  id v15 = 0;
  objc_storeStrong(&v15, a6);
  id v14 = 0;
  objc_storeStrong(&v14, a7);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100051470((uint64_t)buf, (uint64_t)location[0], (uint64_t)v17);
    _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Received language and locale: %@ and %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  os_log_t v11 = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    sub_100051470((uint64_t)v20, (uint64_t)v16, (uint64_t)v15);
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Source device is %@ (%@)", v20, 0x16u);
  }
  objc_storeStrong((id *)&v11, 0);
  [(ProximitySetupController *)v19 setReceivedLanguages:location[0]];
  [(ProximitySetupController *)v19 setReceivedLocale:v17];
  [(ProximitySetupController *)v19 setModel:v16];
  [(ProximitySetupController *)v19 setDeviceClass:v15];
  [(ProximitySetupController *)v19 setAccessibilitySettings:v14];
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)_isWaitingForReconnection
{
  id v2 = [(ProximitySetupController *)self resumeBlock];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)ready
{
  id v9 = self;
  v8[1] = (id)a2;
  id v2 = dispatch_get_global_queue(0, 0);
  block = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  os_log_type_t v6 = sub_10017FF90;
  os_log_type_t v7 = &unk_1002B0D20;
  v8[0] = v9;
  dispatch_async(v2, &block);

  objc_storeStrong(v8, 0);
}

- (void)receivedBackupAction:(id)a3
{
  os_log_type_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v3 = [(ProximitySetupController *)v12 observerQueue];
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  os_log_type_t v7 = sub_100180148;
  id v8 = &unk_1002B12F0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_sync(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)pairingEndedByUser
{
}

- (ProximitySetupControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ProximitySetupControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)userSkippedProximity
{
  return self->_userSkippedProximity;
}

- (void)setUserSkippedProximity:(BOOL)a3
{
  self->_userSkippedProximity = a3;
}

- (SASProximityInformation)information
{
  return (SASProximityInformation *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInformation:(id)a3
{
}

- (BOOL)hasAppliedSettings
{
  return self->_hasAppliedSettings;
}

- (void)setHasAppliedSettings:(BOOL)a3
{
  self->_hasAppliedSettings = a3;
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setModel:(id)a3
{
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
}

- (NSArray)receivedLanguages
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setReceivedLanguages:(id)a3
{
}

- (NSString)receivedLocale
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setReceivedLocale:(id)a3
{
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProductVersion:(id)a3
{
}

- (SASProximityHandshake)handshake
{
  return (SASProximityHandshake *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHandshake:(id)a3
{
}

- (BOOL)hasValidatedPasscode
{
  return self->_hasValidatedPasscode;
}

- (void)setHasValidatedPasscode:(BOOL)a3
{
  self->_hasValidatedPasscode = a3;
}

- (BOOL)signedIniCloudAccount
{
  return self->_signedIniCloudAccount;
}

- (void)setSignedIniCloudAccount:(BOOL)a3
{
  self->_signedIniCloudAccount = a3;
}

- (BYBackupMetadata)backupMetadataFromTerminatedConnection
{
  return (BYBackupMetadata *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBackupMetadataFromTerminatedConnection:(id)a3
{
}

- (BOOL)skipExpressRestore
{
  return self->_skipExpressRestore;
}

- (void)setSkipExpressRestore:(BOOL)a3
{
  self->_skipExpressRestore = a3;
}

- (BOOL)intentToMigrate
{
  return self->_intentToMigrate;
}

- (void)setIntentToMigrate:(BOOL)a3
{
  self->_intentToMigrate = a3;
}

- (BYExpressSetupDataSource)expressDataSource
{
  return self->_expressDataSource;
}

- (void)setExpressDataSource:(id)a3
{
}

- (BuddyProximitySetupDependentController)dependentController
{
  return self->_dependentController;
}

- (void)setDependentController:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (NSData)accessibilitySettings
{
  return self->_accessibilitySettings;
}

- (void)setAccessibilitySettings:(id)a3
{
}

- (BYBuddyDaemonProximityTargetClient)client
{
  return (BYBuddyDaemonProximityTargetClient *)objc_getProperty(self, a2, 136, 1);
}

- (void)setClient:(id)a3
{
}

- (SASProximitySession)session
{
  return (SASProximitySession *)objc_getProperty(self, a2, 144, 1);
}

- (void)setSession:(id)a3
{
}

- (BOOL)hasResumed
{
  return self->_hasResumed;
}

- (void)setHasResumed:(BOOL)a3
{
  self->_hasResumed = a3;
}

- (NSMutableArray)observers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setObservers:(id)a3
{
}

- (OS_dispatch_queue)observerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 160, 1);
}

- (void)setObserverQueue:(id)a3
{
}

- (BOOL)isDisconnecting
{
  return self->_disconnecting;
}

- (void)setDisconnecting:(BOOL)a3
{
  self->_disconnecting = a3;
}

- (BOOL)reconnecting
{
  return self->_reconnecting;
}

- (void)setReconnecting:(BOOL)a3
{
  self->_reconnecting = a3;
}

- (BOOL)shouldApplySettings
{
  return self->_shouldApplySettings;
}

- (void)setShouldApplySettings:(BOOL)a3
{
  self->_shouldApplySettings = a3;
}

- (id)resumeBlock
{
  return self->_resumeBlock;
}

- (void)setResumeBlock:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
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