@interface BuddyExpressWelcomeController
+ (BOOL)_isSettingsFeature:(unint64_t)a3;
+ (BOOL)hiddenFromMultiUser;
+ (id)_accessoryViewForFeature:(unint64_t)a3;
+ (id)_createFeatureCardForDataTransferMethod:(unint64_t)a3 deviceName:(id)a4 lastBackupDate:(id)a5;
+ (id)_determineIfFeatureIsInExpress:(unint64_t)a3 withDataSource:(id)a4;
+ (id)_localizedDescriptionForFeature:(unint64_t)a3;
+ (id)_localizedNameForFeature:(unint64_t)a3;
+ (id)_privacyIdentifiersForFeature:(unint64_t)a3;
+ (id)_privacyIdentifiersForFeatures:(id)a3;
+ (id)_stateStringForFeature:(unint64_t)a3 withDataSource:(id)a4 withFeatureState:(id)a5;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFBackupDeviceController)backupDeviceController;
- (BFFSettingsManager)settingsManager;
- (BOOL)controllerNeedsToRun;
- (BYAnalyticsManager)analyticsManager;
- (BYCapabilities)capabilities;
- (BYChronicle)chronicle;
- (BYDeviceProvider)deviceProvider;
- (BYExpressSettingsSetupCache)expressSettingsCache;
- (BYExpressSetupDataProvider)expressSetupDataProvider;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPreferencesController)buddyPreferences;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyDisplayZoomExecutor)displayZoomExecutor;
- (BuddyExistingSettings)existingSettings;
- (BuddyExpressWelcomeController)init;
- (BuddyMiscState)miscState;
- (BuddyPendingRestoreState)pendingRestoreState;
- (BuddySetupMethod)setupMethod;
- (MCProfileConnection)managedConfiguration;
- (NSArray)privacyIdentifiers;
- (NSDictionary)expressSettingsStateCacheInDataSource;
- (ProximitySetupController)proximitySetupController;
- (id)_createFeatureCardForApplePay:(id)a3;
- (id)_createFeatureCardForConnections:(id)a3;
- (id)_createFeatureCardForSettings:(id)a3 withDataSource:(id)a4;
- (id)_detailForDataSourceDeviceClass:(id)a3;
- (id)dateForChosenBackup;
- (id)deviceNameForChosenBackup;
- (unint64_t)dataTransferMethod;
- (void)_addFeatureCardsForFeatures:(id)a3;
- (void)_addLearnMoreButton;
- (void)_learnMoreTapped;
- (void)_populateDataSourcesForDataProvider:(id)a3 completion:(id)a4;
- (void)_recordAnalyticsEventForDataProvider:(id)a3 presented:(BOOL)a4 customized:(BOOL)a5;
- (void)continueTapped;
- (void)controllerWasPopped;
- (void)createBackupDataSource:(id)a3;
- (void)createCloudDataSource:(id)a3;
- (void)createDataProvider:(id)a3;
- (void)createDataProviderWithCustomization:(id)a3 completion:(id)a4;
- (void)createWalletProvisionalContextUsingDataProvider:(id)a3 completion:(id)a4;
- (void)customizeTapped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)prepareStateForExpressFeatures:(id)a3 withDataSource:(id)a4;
- (void)setAnalyticsManager:(id)a3;
- (void)setBackupDeviceController:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setChronicle:(id)a3;
- (void)setDeviceProvider:(id)a3;
- (void)setDisplayZoomExecutor:(id)a3;
- (void)setExistingSettings:(id)a3;
- (void)setExpressSettingsCache:(id)a3;
- (void)setExpressSettingsStateCacheInDataSource:(id)a3;
- (void)setExpressSetupDataProvider:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setPendingRestoreState:(id)a3;
- (void)setPrivacyIdentifiers:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)setSetupMethod:(id)a3;
- (void)startOver;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BuddyExpressWelcomeController

- (BuddyExpressWelcomeController)init
{
  id location = self;
  v11[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"EXPRESS_SETUP_TITLE"];
  v11[0] = [(NSBundle *)v2 localizedStringForKey:v3 value:&stru_1002B4E18 table:@"Localizable"];

  v4 = +[NSBundle mainBundle];
  id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"EXPRESS_SETUP_DETAIL"];
  id v10 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"Localizable"];

  id v6 = location;
  id location = 0;
  v9.receiver = v6;
  v9.super_class = (Class)BuddyExpressWelcomeController;
  id location = [(BuddyExpressWelcomeController *)&v9 initWithTitle:v11[0] detailText:v10 icon:0];
  objc_storeStrong(&location, location);
  v7 = (BuddyExpressWelcomeController *)location;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)viewDidLoad
{
  v21 = self;
  SEL v20 = a2;
  v19.receiver = self;
  v19.super_class = (Class)BuddyExpressWelcomeController;
  [(BuddyExpressWelcomeController *)&v19 viewDidLoad];
  v2 = v21;
  id v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v2 addBoldButton:v4 action:"continueTapped"];

  id v5 = v21;
  id v6 = +[NSBundle mainBundle];
  v7 = [(NSBundle *)v6 localizedStringForKey:@"CUSTOMIZE" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v5 addLinkButton:v7 action:"customizeTapped"];

  id v8 = [(BuddyExpressWelcomeController *)v21 headerView];
  objc_super v9 = v21;
  id v10 = [(BuddyExpressWelcomeController *)v21 expressSetupDataProvider];
  v11 = [(BYExpressSetupDataProvider *)v10 resolvedDataSource];
  id v12 = [(BYExpressSetupDataSource *)v11 sourceDeviceClass];
  id v13 = [(BuddyExpressWelcomeController *)v9 _detailForDataSourceDeviceClass:v12];
  [v8 setDetailText:v13];

  v14 = [(BuddyExpressWelcomeController *)v21 privacyIdentifiers];
  NSUInteger v15 = [(NSArray *)v14 count];

  if (v15) {
    [(BuddyExpressWelcomeController *)v21 _addLearnMoreButton];
  }
  v16 = v21;
  v17 = [(BuddyExpressWelcomeController *)v21 expressSetupDataProvider];
  id v18 = [(BYExpressSetupDataProvider *)v17 expressSetupFeatures];
  [(BuddyExpressWelcomeController *)v16 _addFeatureCardsForFeatures:v18];
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BuddyExpressWelcomeController;
  [(BuddyExpressWelcomeController *)&v6 viewDidAppear:a3];
  id v3 = [(BuddyExpressWelcomeController *)v9 miscState];
  [(BuddyMiscState *)v3 setUserChoseExpress:0];

  v4 = [(BuddyExpressWelcomeController *)v9 expressSettingsCache];
  [(BYExpressSettingsSetupCache *)v4 resetHandlers];

  id v5 = [(BuddyExpressWelcomeController *)v9 pendingRestoreState];
  [(BuddyPendingRestoreState *)v5 setAttemptedBackupItem:0];
}

- (void)continueTapped
{
  NSUInteger v15 = self;
  v14[1] = (id)a2;
  id v2 = [(BuddyExpressWelcomeController *)self view];
  id v3 = [v2 window];
  [v3 setUserInteractionEnabled:0];

  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v15 identifier:v5];

  objc_super v6 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = sub_1000AD1D0;
  id v13 = &unk_1002B0D20;
  v14[0] = v15;
  dispatch_async(v6, &block);

  BOOL v7 = v15;
  SEL v8 = [(BuddyExpressWelcomeController *)v15 expressSetupDataProvider];
  [(BuddyExpressWelcomeController *)v7 _recordAnalyticsEventForDataProvider:v8 presented:1 customized:0];

  objc_storeStrong(v14, 0);
}

- (void)customizeTapped
{
  int v11 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v9;
    sub_10004B24C(v8);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Customize express settings", (uint8_t *)v8, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  v4 = [(BuddyExpressWelcomeController *)v11 expressSettingsCache];
  [(BYExpressSettingsSetupCache *)v4 resetHandlers];

  id v5 = v11;
  objc_super v6 = [(BuddyExpressWelcomeController *)v11 expressSetupDataProvider];
  [(BuddyExpressWelcomeController *)v5 _recordAnalyticsEventForDataProvider:v6 presented:1 customized:1];

  BOOL v7 = [(BuddyWelcomeController *)v11 delegate];
  [(BFFFlowItemDelegate *)v7 flowItemDone:v11];
}

- (void)createDataProvider:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyExpressWelcomeController *)v4 createDataProviderWithCustomization:0 completion:location[0]];
  objc_storeStrong(location, 0);
}

- (void)createDataProviderWithCustomization:(id)a3 completion:(id)a4
{
  v42 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v40 = 0;
  objc_storeStrong(&v40, a4);
  id v5 = [BYExpressSetupDataProvider alloc];
  objc_super v6 = [(BuddyExpressWelcomeController *)v42 chronicle];
  BOOL v7 = [(BuddyExpressWelcomeController *)v42 displayZoomExecutor];
  SEL v8 = [(BuddyExpressWelcomeController *)v42 capabilities];
  os_log_type_t v9 = [(BuddyExpressWelcomeController *)v42 settingsManager];
  int v10 = [(BuddyExpressWelcomeController *)v42 buddyPreferences];
  int v11 = [(BuddyExpressWelcomeController *)v42 buddyPreferencesExcludedFromBackup];
  id v12 = [(BuddyExpressWelcomeController *)v42 managedConfiguration];
  id v13 = [(BuddyExpressWelcomeController *)v42 deviceProvider];
  v14 = [(BuddyExpressWelcomeController *)v42 expressSettingsCache];
  id v39 = [(BYExpressSetupDataProvider *)v5 initWithChronicle:v6 displayZoomExecutor:v7 capabilities:v8 settingsManager:v9 buddyPreferences:v10 buddyPreferencesExcludedFromBackup:v11 managedConfiguration:v12 deviceProvider:v13 expressSettingsCache:v14];

  NSUInteger v15 = [(BuddyExpressWelcomeController *)v42 miscState];
  [v39 setMiscState:v15];

  v16 = [(BuddyExpressWelcomeController *)v42 pendingRestoreState];
  v17 = [(BuddyPendingRestoreState *)v16 backupItem];
  char v37 = 0;
  char v35 = 0;
  unsigned __int8 v18 = 1;
  if (!v17)
  {
    id v38 = [(BuddyExpressWelcomeController *)v42 miscState];
    char v37 = 1;
    id v36 = [v38 migrationManager];
    char v35 = 1;
    unsigned __int8 v18 = [v36 migrationInProgressOrCompleted];
  }
  [v39 setWillRestoreOrMigrate:v18 & 1];
  if (v35) {

  }
  if (v37) {
  objc_super v19 = [(BuddyExpressWelcomeController *)v42 pendingRestoreState];
  }
  SEL v20 = [(BuddyPendingRestoreState *)v19 backupItem];
  char v33 = 0;
  char v31 = 0;
  unsigned __int8 v21 = 1;
  if (!v20)
  {
    id v34 = [(BuddyExpressWelcomeController *)v42 miscState];
    char v33 = 1;
    id v32 = [v34 migrationManager];
    char v31 = 1;
    unsigned __int8 v21 = [v32 willMigrate];
  }
  [v39 setWillRestoreOrReallyMigrate:v21 & 1];
  if (v31) {

  }
  if (v33) {
  if (location[0])
  }
    (*((void (**)(id, id))location[0] + 2))(location[0], v39);
  v22 = v42;
  v23 = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  v26 = sub_1000AD9A8;
  v27 = &unk_1002B1758;
  id v28 = v39;
  v29 = v42;
  id v30 = v40;
  [(BuddyExpressWelcomeController *)v22 _populateDataSourcesForDataProvider:v39 completion:&v23];
  objc_storeStrong(&v30, 0);
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(location, 0);
}

- (void)createBackupDataSource:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v3 = [(BuddyExpressWelcomeController *)v16 pendingRestoreState];
  v4 = [(BuddyPendingRestoreState *)v3 backupItem];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    int v14 = 1;
  }
  else
  {
    objc_super v6 = dispatch_get_global_queue(25, 0);
    BOOL v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    int v10 = sub_1000ADCB0;
    int v11 = &unk_1002B0CD0;
    id v12 = v16;
    id v13 = location[0];
    dispatch_async(v6, &v7);

    objc_storeStrong(&v13, 0);
    objc_storeStrong((id *)&v12, 0);
    int v14 = 0;
  }
  objc_storeStrong(location, 0);
}

- (unint64_t)dataTransferMethod
{
  id v2 = [(BuddyExpressWelcomeController *)self setupMethod];
  unint64_t v3 = [(BuddySetupMethod *)v2 dataTransferMethod];

  switch(v3)
  {
    case 0uLL:
      unint64_t v5 = 0;
      break;
    case 1uLL:
      unint64_t v5 = 1;
      break;
    case 2uLL:
      unint64_t v5 = 3;
      break;
    case 3uLL:
      unint64_t v5 = 4;
      break;
    default:
      return v5;
  }
  return v5;
}

- (void)createWalletProvisionalContextUsingDataProvider:(id)a3 completion:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v5 = [location[0] resolvedDataSource];
  id v13 = [v5 walletMetadata];

  id v6 = [sub_1000ADFD4() sharedInstance];
  [v6 setBackupMetadata:v13];

  BOOL v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  int v10 = sub_1000AE0EC;
  int v11 = &unk_1002B21F8;
  id v12 = v14;
  +[BuddyPaymentController setupAssistantExpressProvisioningContext:&v7];
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)createCloudDataSource:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = objc_alloc_init((Class)SASExpressCloudSettings);
  unint64_t v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_1000AE2BC;
  BOOL v7 = &unk_1002B2220;
  id v8 = location[0];
  [v9 fetchSettingsWithCompletion:&v3];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)dateForChosenBackup
{
  id v2 = [(BuddyExpressWelcomeController *)self pendingRestoreState];
  unint64_t v3 = [(BuddyPendingRestoreState *)v2 backupItem];
  BOOL v4 = v3 == 0;

  if (v4)
  {
    id v12 = 0;
  }
  else
  {
    int v5 = [(BuddyExpressWelcomeController *)self backupDeviceController];
    id v6 = [(BFFBackupDeviceController *)v5 completionDate];

    if (v6)
    {
      BOOL v7 = [(BuddyExpressWelcomeController *)self backupDeviceController];
      id v12 = [(BFFBackupDeviceController *)v7 completionDate];
    }
    else
    {
      BOOL v7 = [(BuddyExpressWelcomeController *)self pendingRestoreState];
      id v8 = [(BFFBackupDeviceController *)v7 backupItem];
      id v9 = [v8 snapshot];
      id v12 = (NSDate *)[v9 date];
    }
  }

  return v12;
}

- (id)deviceNameForChosenBackup
{
  id v2 = [(BuddyExpressWelcomeController *)self pendingRestoreState];
  unint64_t v3 = [(BuddyPendingRestoreState *)v2 backupItem];
  BOOL v4 = v3 == 0;

  if (v4)
  {
    id v10 = 0;
  }
  else
  {
    int v5 = [(BuddyExpressWelcomeController *)self pendingRestoreState];
    id v6 = [(BuddyPendingRestoreState *)v5 backupItem];
    BOOL v7 = [(RestorableBackupItem *)v6 snapshot];
    id v10 = [(MBSnapshot *)v7 deviceName];
  }

  return v10;
}

- (void)_populateDataSourcesForDataProvider:(id)a3 completion:(id)a4
{
  v67 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v65 = 0;
  objc_storeStrong(&v65, a4);
  int v5 = [(BuddyExpressWelcomeController *)v67 proximitySetupController];
  id v6 = [(ProximitySetupController *)v5 expressDataSource];
  [location[0] setProximitySetupDataSource:v6];

  id v64 = dispatch_group_create();
  dispatch_group_enter((dispatch_group_t)v64);
  long long v63 = 0uLL;
  id v7 = (id)_BYSignpostSubsystem();
  uint64_t v8 = _BYSignpostCreate();
  *((void *)&v62 + 1) = v9;
  *(void *)&long long v62 = v8;

  id v61 = (id)_BYSignpostSubsystem();
  char v60 = 1;
  os_signpost_id_t v59 = v62;
  if ((void)v62 && v59 != -1 && os_signpost_enabled((os_log_t)v61))
  {
    id v10 = v61;
    os_signpost_type_t v11 = v60;
    os_signpost_id_t v12 = v59;
    sub_10004B24C(&buf);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, v11, v12, "ExpressSetupBackupDataSource", "", (uint8_t *)&buf, 2u);
  }
  objc_storeStrong(&v61, 0);
  id v57 = (id)_BYSignpostSubsystem();
  os_log_type_t v56 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)v69, v62);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v57, v56, "BEGIN [%lld]: ExpressSetupBackupDataSource ", v69, 0xCu);
  }
  objc_storeStrong(&v57, 0);
  long long v63 = v62;
  id v13 = v67;
  v48 = _NSConcreteStackBlock;
  int v49 = -1073741824;
  int v50 = 0;
  v51 = sub_1000AEC74;
  v52 = &unk_1002B2248;
  id v53 = location[0];
  long long v55 = v63;
  id v54 = v64;
  [(BuddyExpressWelcomeController *)v13 createBackupDataSource:&v48];
  dispatch_group_enter((dispatch_group_t)v64);
  v47 = 0;
  v46 = 0;
  id v14 = (id)_BYSignpostSubsystem();
  uint64_t v15 = _BYSignpostCreate();
  v45 = v16;
  v44 = (void *)v15;

  os_log_t log = (os_log_t)(id)_BYSignpostSubsystem();
  char v42 = 1;
  uint64_t v41 = (uint64_t)v44;
  if (v44 && v41 != -1 && os_signpost_enabled(log))
  {
    v17 = log;
    os_signpost_type_t v18 = v42;
    os_signpost_id_t v19 = v41;
    sub_10004B24C(&v40);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, v18, v19, "ExpressSetupCloudDataSource", "", (uint8_t *)&v40, 2u);
  }
  objc_storeStrong((id *)&log, 0);
  os_log_t oslog = (os_log_t)(id)_BYSignpostSubsystem();
  os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)v68, (uint64_t)v44);
    _os_log_impl((void *)&_mh_execute_header, oslog, v38, "BEGIN [%lld]: ExpressSetupCloudDataSource ", v68, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v46 = v44;
  v47 = v45;
  SEL v20 = v67;
  char v31 = _NSConcreteStackBlock;
  int v32 = -1073741824;
  int v33 = 0;
  id v34 = sub_1000AEE3C;
  char v35 = &unk_1002B2270;
  id v36 = location[0];
  v37[1] = v46;
  v37[2] = v47;
  v37[0] = v64;
  [(BuddyExpressWelcomeController *)v20 createCloudDataSource:&v31];
  unsigned __int8 v21 = v64;
  v22 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  v26 = sub_1000AF004;
  v27 = &unk_1002B1758;
  id v28 = v67;
  id v29 = location[0];
  id v30 = v65;
  dispatch_group_notify(v21, (dispatch_queue_t)v22, &block);

  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong((id *)&v28, 0);
  objc_storeStrong(v37, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v53, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong(location, 0);
}

- (id)_detailForDataSourceDeviceClass:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = (id)MGCopyAnswer();
  if ([v10 isEqualToString:location[0]])
  {
    unint64_t v3 = +[NSBundle mainBundle];
    id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"EXPRESS_SETUP_DETAIL_OTHER"];
    os_signpost_id_t v12 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];
  }
  else if ([location[0] isEqualToString:@"iPhone"])
  {
    int v5 = +[NSBundle mainBundle];
    os_signpost_id_t v12 = [(NSBundle *)v5 localizedStringForKey:@"EXPRESS_SETUP_DETAIL_IPHONE" value:&stru_1002B4E18 table:@"Localizable"];
  }
  else if ([location[0] isEqualToString:@"iPad"])
  {
    id v6 = +[NSBundle mainBundle];
    os_signpost_id_t v12 = [(NSBundle *)v6 localizedStringForKey:@"EXPRESS_SETUP_DETAIL_IPAD" value:&stru_1002B4E18 table:@"Localizable"];
  }
  else
  {
    if ([location[0] isEqualToString:@"iPod"])
    {
      id v7 = +[NSBundle mainBundle];
      os_signpost_id_t v12 = [(NSBundle *)v7 localizedStringForKey:@"EXPRESS_SETUP_DETAIL_IPOD" value:&stru_1002B4E18 table:@"Localizable"];
    }
    else
    {
      id v7 = +[NSBundle mainBundle];
      os_signpost_id_t v12 = [(NSBundle *)v7 localizedStringForKey:@"EXPRESS_SETUP_DETAIL_MAC" value:&stru_1002B4E18 table:@"Localizable"];
    }
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  uint64_t v8 = v12;

  return v8;
}

- (void)_addLearnMoreButton
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = +[OBHeaderAccessoryButton accessoryButton];
  id v2 = +[NSBundle mainBundle];
  unint64_t v3 = [(NSBundle *)v2 localizedStringForKey:@"LEARN_MORE_ELLIPSIS" value:&stru_1002B4E18 table:@"Localizable"];
  [location[0] setTitle:v3 forState:0];

  [location[0] addTarget:v6 action:"_learnMoreTapped" forControlEvents:0x2000];
  id v4 = [(BuddyExpressWelcomeController *)v6 headerView];
  [v4 addAccessoryButton:location[0]];

  objc_storeStrong(location, 0);
}

+ (id)_privacyIdentifiersForFeatures:(id)a3
{
  id v14 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = objc_alloc_init((Class)NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id v3 = location[0];
  id v4 = [v3 countByEnumeratingWithState:__b objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(v3);
        }
        id v11 = *(id *)(__b[1] + 8 * i);
        id v9 = [v14 _privacyIdentifiersForFeature:[v11 unsignedIntegerValue]];
        if (v9) {
          [v12 addObjectsFromArray:v9];
        }
        objc_storeStrong(&v9, 0);
      }
      id v4 = [v3 countByEnumeratingWithState:__b objects:v15 count:16];
    }
    while (v4);
  }

  id v7 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v7;
}

+ (id)_privacyIdentifiersForFeature:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      uint64_t v11 = BYPrivacyLocationServicesIdentifier;
      id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1, a3, a2, a1);
      break;
    case 2uLL:
      uint64_t v10 = BYPrivacyAnalyticsDeviceIdentifier;
      id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1, a3, a2, a1);
      break;
    case 3uLL:
      uint64_t v9 = BYPrivacyAnalyticsAppIdentifier;
      id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1, a3, a2, a1);
      break;
    case 4uLL:
      v8[0] = BYPrivacyAnalyticsDeviceIdentifier;
      v8[1] = BYPrivacyAnalyticsAppIdentifier;
      id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2, a3, a2, a1);
      break;
    case 5uLL:
      uint64_t v7 = BYPrivacySiriIdentifier;
      id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1, a3, a2, a1);
      break;
    case 6uLL:
      uint64_t v6 = BYPrivacyImproveSiriIdentifier;
      id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1, a3, a2, a1);
      break;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xCuLL:
    case 0xDuLL:
      id v4 = 0;
      break;
    case 0xBuLL:
      v5[0] = BYPrivacyAppleCard;
      v5[1] = BYPrivacyApplePay;
      v5[2] = BYPrivacyApplePayCash;
      v5[3] = BYPrivacyAppleWallet;
      id v4 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 4, a3, a2, a1);
      break;
    default:
      break;
  }

  return v4;
}

- (void)_addFeatureCardsForFeatures:(id)a3
{
  v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v44 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v44 setAxis:1];
  [v44 setSpacing:10.0];
  if ([location[0] containsObject:&off_1002C16D0])
  {
    id v3 = v46;
    id v4 = [(BuddyExpressWelcomeController *)v46 expressSetupDataProvider];
    uint64_t v5 = [(BYExpressSetupDataProvider *)v4 walletProvisioningContext];
    id v43 = [(BuddyExpressWelcomeController *)v3 _createFeatureCardForApplePay:v5];

    [v44 addArrangedSubview:v43];
    objc_storeStrong(&v43, 0);
  }
  if ([location[0] containsObject:&off_1002C16E8])
  {
    uint64_t v6 = v46;
    uint64_t v7 = [(BuddyExpressWelcomeController *)v46 expressSetupDataProvider];
    id v8 = [(BYExpressSetupDataProvider *)v7 pairedWatches];
    id v42 = [(BuddyExpressWelcomeController *)v6 _createFeatureCardForConnections:v8];

    [v44 addArrangedSubview:v42];
    objc_storeStrong(&v42, 0);
  }
  id v41 = [location[0] mutableCopy];
  [v41 removeObject:&off_1002C16E8];
  if ([v41 count])
  {
    uint64_t v9 = v46;
    uint64_t v10 = [(BuddyExpressWelcomeController *)v46 expressSetupDataProvider];
    uint64_t v11 = [(BYExpressSetupDataProvider *)v10 resolvedDataSource];
    id v40 = [(BuddyExpressWelcomeController *)v9 _createFeatureCardForSettings:v41 withDataSource:v11];

    [v44 insertArrangedSubview:v40 atIndex:0];
    objc_storeStrong(&v40, 0);
  }
  id v12 = objc_opt_class();
  id v13 = [(BuddyExpressWelcomeController *)v46 dataTransferMethod];
  id v14 = [(BuddyExpressWelcomeController *)v46 deviceNameForChosenBackup];
  id v15 = [(BuddyExpressWelcomeController *)v46 dateForChosenBackup];
  id v39 = [v12 _createFeatureCardForDataTransferMethod:v13 deviceName:v14 lastBackupDate:v15];

  if (v39) {
    [v44 insertArrangedSubview:v39 atIndex:0];
  }
  id v16 = [(BuddyExpressWelcomeController *)v46 contentView];
  [v16 addSubview:v44];

  id v17 = [v44 arrangedSubviews];
  id v18 = [v17 count];

  if (v18 == (id)1)
  {
    id v19 = [v44 arrangedSubviews];
    id v38 = [v19 firstObject];

    [v38 setExpanded:1];
    objc_storeStrong(&v38, 0);
  }
  id v20 = [(BuddyExpressWelcomeController *)v46 contentView];
  id v37 = [(BuddyExpressWelcomeController *)v46 contentView];
  id v36 = [v37 topAnchor];
  id v35 = [v44 topAnchor];
  id v34 = [v36 constraintEqualToAnchor:];
  v47[0] = v34;
  id v33 = [(BuddyExpressWelcomeController *)v46 contentView];
  id v32 = [v33 leadingAnchor];
  id v31 = [v44 leadingAnchor];
  id v30 = [v32 constraintEqualToAnchor:];
  v47[1] = v30;
  id v21 = [(BuddyExpressWelcomeController *)v46 contentView];
  id v22 = [v21 trailingAnchor];
  id v23 = [v44 trailingAnchor];
  id v24 = [v22 constraintEqualToAnchor:v23];
  v47[2] = v24;
  id v25 = [(BuddyExpressWelcomeController *)v46 contentView];
  id v26 = [v25 bottomAnchor];
  id v27 = [v44 bottomAnchor];
  id v28 = [v26 constraintEqualToAnchor:v27];
  v47[3] = v28;
  id v29 = +[NSArray arrayWithObjects:v47 count:4];
  [v20 addConstraints:v29];

  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
}

- (id)_createFeatureCardForConnections:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v39 = +[UIImage systemImageNamed:@"applewatch.watchface"];
  id v38 = objc_alloc_init((Class)NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id v3 = location[0];
  id v4 = [v3 countByEnumeratingWithState:__b objects:v42 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(v3);
        }
        id v37 = *(id *)(__b[1] + 8 * i);
        id v35 = [v37 valueForProperty:NRDevicePropertyName];
        if (v35)
        {
          id v7 = v38;
          id v8 = +[NSBundle mainBundle];
          uint64_t v9 = [(NSBundle *)v8 localizedStringForKey:@"EXPRESS_FEATURE_CONNECTION_NAME" value:&stru_1002B4E18 table:@"Localizable"];
          uint64_t v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v35);
          [v7 addObject:v10];
        }
        objc_storeStrong(&v35, 0);
      }
      id v4 = [v3 countByEnumeratingWithState:__b objects:v42 count:16];
    }
    while (v4);
  }

  id v34 = +[NSListFormatter localizedStringByJoiningStrings:v38];
  uint64_t v11 = [BuddyExpressSetupFeatureCardView alloc];
  id v12 = +[NSBundle mainBundle];
  id v13 = [(NSBundle *)v12 localizedStringForKey:@"EXPRESS_FEATURE_CONNECTIONS" value:&stru_1002B4E18 table:@"Localizable"];
  id v33 = [(BuddyExpressSetupFeatureCardView *)v11 initWithTitle:v13 subtitle:v34 icon:v39];

  memset(v31, 0, sizeof(v31));
  id v14 = location[0];
  id v15 = [v14 countByEnumeratingWithState:v31 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v31[2];
    do
    {
      for (unint64_t j = 0; j < (unint64_t)v15; ++j)
      {
        if (*(void *)v31[2] != v16) {
          objc_enumerationMutation(v14);
        }
        id v32 = *(id *)(v31[1] + 8 * j);
        id v18 = +[NSBundle mainBundle];
        id v19 = [(NSBundle *)v18 localizedStringForKey:@"EXPRESS_FEATURE_CONNECTION_NAME" value:&stru_1002B4E18 table:@"Localizable"];
        id v20 = [v32 valueForProperty:NRDevicePropertyName];
        id v30 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v19, v20);

        id v29 = [v32 valueForProperty:NRDevicePropertyMarketingProductName];
        id v28 = [(id)objc_opt_class() _accessoryViewForFeature:10];
        if (!v29)
        {
          id v21 = +[NSBundle mainBundle];
          id v22 = [(NSBundle *)v21 localizedStringForKey:@"EXPRESS_FEATURE_APPLE_WATCH" value:&stru_1002B4E18 table:@"Localizable"];
          id v23 = v29;
          id v29 = v22;
        }
        id v24 = [BuddyExpressSetupFeatureCardCell alloc];
        id v27 = [(BuddyExpressSetupFeatureCardCell *)v24 initWithTitle:v29 subtitle:v30 state:0 accessoryView:v28];
        [v33 addCardCell:v27];
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v30, 0);
      }
      id v15 = [v14 countByEnumeratingWithState:v31 objects:v41 count:16];
    }
    while (v15);
  }

  id v25 = v33;
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(location, 0);
  return v25;
}

- (id)_createFeatureCardForApplePay:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v41 = +[UIImage _systemImageNamed:@"wallet"];
  id v40 = objc_alloc_init((Class)NSMutableArray);
  id v3 = [location[0] setupAssistantCredentials];
  id v4 = [location[0] selectedIndices];
  id v39 = [v3 objectsAtIndexes:v4];

  memset(__b, 0, sizeof(__b));
  id v5 = v39;
  id v6 = [v5 countByEnumeratingWithState:__b objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v6; ++i)
      {
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(v5);
        }
        id v38 = *(id *)(__b[1] + 8 * i);
        id v36 = [v38 title];
        if (v36)
        {
          id v9 = v40;
          uint64_t v10 = +[NSBundle mainBundle];
          uint64_t v11 = [(NSBundle *)v10 localizedStringForKey:@"EXPRESS_FEATURE_TITLE_APPLE_WALLET_NAME" value:&stru_1002B4E18 table:@"Localizable"];
          id v12 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, v36);
          [v9 addObject:v12];
        }
        objc_storeStrong(&v36, 0);
      }
      id v6 = [v5 countByEnumeratingWithState:__b objects:v44 count:16];
    }
    while (v6);
  }

  id v13 = +[NSBundle mainBundle];
  id v14 = [(NSBundle *)v13 localizedStringForKey:@"WALLET_ITEMS" value:&stru_1002B4E18 table:@"Localizable"];
  id v35 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, [v39 count]);

  id v15 = [BuddyExpressWalletFeatureCardView alloc];
  uint64_t v16 = +[NSBundle mainBundle];
  id v17 = [(NSBundle *)v16 localizedStringForKey:@"EXPRESS_FEATURE_TITLE_APPLE_WALLET" value:&stru_1002B4E18 table:@"Localizable"];
  id v34 = [(BuddyExpressWalletFeatureCardView *)v15 initWithTitle:v17 subtitle:v35 icon:v41];

  [location[0] setDelegate:v34];
  memset(v32, 0, sizeof(v32));
  id v18 = v39;
  id v19 = [v18 countByEnumeratingWithState:v32 objects:v43 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v32[2];
    do
    {
      for (unint64_t j = 0; j < (unint64_t)v19; ++j)
      {
        if (*(void *)v32[2] != v20) {
          objc_enumerationMutation(v18);
        }
        id v33 = *(id *)(v32[1] + 8 * j);
        id v22 = objc_alloc((Class)UIImageView);
        id v23 = [location[0] passSnapshotForCredential:v33];
        id v31 = [v22 initWithImage:v23];

        [v31 setContentMode:1];
        [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
        id v24 = [BuddyExpressWalletFeatureCardCell alloc];
        id v25 = [v33 title];
        id v26 = [v33 subtitle];
        id v30 = [(BuddyExpressSetupFeatureCardCell *)v24 initWithTitle:v25 subtitle:v26 state:0 accessoryView:v31];

        id v27 = [v33 uniqueIdentifier];
        [v30 setUniqueIdentifier:v27];

        [v34 addCardCell:v30];
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
      }
      id v19 = [v18 countByEnumeratingWithState:v32 objects:v43 count:16];
    }
    while (v19);
  }

  id v28 = v34;
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  return v28;
}

- (id)_createFeatureCardForSettings:(id)a3 withDataSource:(id)a4
{
  id v58 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v56 = 0;
  objc_storeStrong(&v56, a4);
  id v5 = location[0];
  int v49 = _NSConcreteStackBlock;
  int v50 = -1073741824;
  int v51 = 0;
  v52 = sub_1000B13DC;
  id v53 = &unk_1002B22C0;
  id v54 = v58;
  id v6 = +[NSPredicate predicateWithBlock:&v49];
  id v55 = [v5 filteredArrayUsingPredicate:v6];

  id v7 = v55;
  id v43 = _NSConcreteStackBlock;
  int v44 = -1073741824;
  int v45 = 0;
  v46 = sub_1000B146C;
  v47 = &unk_1002B22E8;
  id v48 = v58;
  id v8 = [v7 sortedArrayUsingComparator:&v43];
  id v9 = v55;
  id v55 = v8;

  id v42 = objc_alloc_init((Class)NSMutableArray);
  memset(__b, 0, sizeof(__b));
  id v10 = v55;
  id v11 = [v10 countByEnumeratingWithState:__b objects:v60 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v11; ++i)
      {
        if (*(void *)__b[2] != v12) {
          objc_enumerationMutation(v10);
        }
        id v41 = *(id *)(__b[1] + 8 * i);
        id v14 = v42;
        id v15 = [objc_opt_class() _localizedNameForFeature:[v41 unsignedIntegerValue]];
        [v14 addObject:v15];
      }
      id v11 = [v10 countByEnumeratingWithState:__b objects:v60 count:16];
    }
    while (v11);
  }

  id v39 = +[UIImage systemImageNamed:@"gear"];
  id v16 = [v42 copy];
  id v38 = +[BuddyExpressSetupFeatureCardView formattedSubtitleStringForComponents:v16];

  id v17 = [BuddyExpressSetupFeatureCardView alloc];
  id v18 = +[NSBundle mainBundle];
  id v19 = [(NSBundle *)v18 localizedStringForKey:@"EXPRESS_FEATURE_SETTINGS" value:&stru_1002B4E18 table:@"Localizable"];
  id v37 = [(BuddyExpressSetupFeatureCardView *)v17 initWithTitle:v19 subtitle:v38 icon:v39];

  memset(v35, 0, sizeof(v35));
  id v20 = v55;
  id v21 = [v20 countByEnumeratingWithState:v35 objects:v59 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v35[2];
    do
    {
      for (unint64_t j = 0; j < (unint64_t)v21; ++j)
      {
        if (*(void *)v35[2] != v22) {
          objc_enumerationMutation(v20);
        }
        id v36 = *(id *)(v35[1] + 8 * j);
        id v34 = 0;
        id v34 = [v36 unsignedIntegerValue];
        id v33 = [(id)objc_opt_class() _localizedNameForFeature:v34];
        id v32 = [(id)objc_opt_class() _localizedDescriptionForFeature:v34];
        id v24 = [v58 expressSettingsStateCacheInDataSource];
        id v31 = [v24 objectForKeyedSubscript:v36];

        id v30 = [(id)objc_opt_class() _stateStringForFeature:v34 withDataSource:v56 withFeatureState:v31];
        id v29 = [(id)objc_opt_class() _accessoryViewForFeature:v34];
        id v25 = [BuddyExpressSetupFeatureCardCell alloc];
        id v28 = [(BuddyExpressSetupFeatureCardCell *)v25 initWithTitle:v33 subtitle:v32 state:v30 accessoryView:v29];
        [v37 addCardCell:v28];
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v29, 0);
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v31, 0);
        objc_storeStrong(&v32, 0);
        objc_storeStrong(&v33, 0);
      }
      id v21 = [v20 countByEnumeratingWithState:v35 objects:v59 count:16];
    }
    while (v21);
  }

  id v26 = v37;
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v48, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(location, 0);
  return v26;
}

+ (id)_createFeatureCardForDataTransferMethod:(unint64_t)a3 deviceName:(id)a4 lastBackupDate:(id)a5
{
  id v42 = a1;
  SEL v41 = a2;
  unint64_t v40 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v38 = 0;
  objc_storeStrong(&v38, a5);
  id v37 = +[UIImage _systemImageNamed:@"app.3.stack.3d"];
  id v6 = +[NSBundle mainBundle];
  id v36 = [(NSBundle *)v6 localizedStringForKey:@"APPS_AND_DATA" value:&stru_1002B4E18 table:@"Localizable"];

  id v35 = 0;
  id v34 = 0;
  switch(v40)
  {
    case 0uLL:
      id v7 = +[NSBundle mainBundle];
      id v8 = [(NSBundle *)v7 localizedStringForKey:@"DONT_TRANSFER_APPS_DATA" value:&stru_1002B4E18 table:@"Localizable"];
      id v9 = v35;
      id v35 = v8;

      break;
    case 1uLL:
    case 2uLL:
      id v10 = +[NSBundle mainBundle];
      id v11 = [(NSBundle *)v10 localizedStringForKey:@"EXPRESS_RESTORE_METHOD_CLOUD" value:&stru_1002B4E18 table:@"Localizable"];
      id v12 = v35;
      id v35 = v11;

      id v33 = 0;
      if (v40 == 2)
      {
        id v13 = +[NSBundle mainBundle];
        id v14 = [(NSBundle *)v13 localizedStringForKey:@"EXPRESS_RESTORE_METHOD_CELL_DESCRIPTION_CLOUD_WITH_BACKUP" value:&stru_1002B4E18 table:@"Localizable"];
        id v15 = v33;
        id v33 = v14;
      }
      else
      {
        id v32 = objc_alloc_init((Class)NSDateFormatter);
        [v32 setDateStyle:3];
        [v32 setTimeStyle:1];
        [v32 setDoesRelativeDateFormatting:1];
        id v16 = [v32 stringFromDate:v38];
        id v17 = v33;
        id v33 = v16;

        objc_storeStrong(&v32, 0);
      }
      id v18 = [BuddyExpressSetupFeatureCardCell alloc];
      id v19 = [(BuddyExpressSetupFeatureCardCell *)v18 initWithTitle:location subtitle:v33 state:0 accessoryView:0];
      id v20 = v34;
      id v34 = v19;

      objc_storeStrong(&v33, 0);
      break;
    case 3uLL:
      id v21 = +[NSBundle mainBundle];
      id v22 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"TRANSFER_DIRECTLY"];
      id v23 = [(NSBundle *)v21 localizedStringForKey:v22 value:&stru_1002B4E18 table:@"Localizable"];
      id v24 = v35;
      id v35 = v23;

      break;
    case 4uLL:
      id v25 = +[NSBundle mainBundle];
      id v26 = [(NSBundle *)v25 localizedStringForKey:@"MIGRATE_FROM_ANDROID_DEVICE" value:&stru_1002B4E18 table:@"Localizable"];
      id v27 = v35;
      id v35 = v26;

      break;
    default:
      break;
  }
  id v28 = [BuddyExpressSetupFeatureCardView alloc];
  id v31 = [(BuddyExpressSetupFeatureCardView *)v28 initWithTitle:v36 subtitle:v35 icon:v37];
  [v31 setNumberOfLinesForSubtitle:0];
  if (v34) {
    [v31 addCardCell:v34];
  }
  id v29 = v31;
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&location, 0);
  return v29;
}

+ (BOOL)_isSettingsFeature:(unint64_t)a3
{
  if (a3 - 1 < 5) {
    goto LABEL_8;
  }
  switch(a3)
  {
    case 6uLL:
      goto LABEL_9;
    case 7uLL:
LABEL_8:
      char v4 = 1;
      return v4 & 1;
    case 8uLL:
LABEL_9:
      char v4 = 0;
      return v4 & 1;
    case 9uLL:
      goto LABEL_8;
  }
  if (a3 - 10 < 2) {
    goto LABEL_9;
  }
  if (a3 - 12 <= 1) {
    goto LABEL_8;
  }
  return v4 & 1;
}

+ (id)_localizedNameForFeature:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id v3 = +[NSBundle mainBundle];
      id v16 = [(NSBundle *)v3 localizedStringForKey:@"EXPRESS_FEATURE_TITLE_LOCATION_SERVICES" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 2uLL:
      char v4 = +[NSBundle mainBundle];
      id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"EXPRESS_FEATURE_TITLE_DEVICE_ANALYTICS"];
      id v16 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 3uLL:
      id v6 = +[NSBundle mainBundle];
      id v16 = [(NSBundle *)v6 localizedStringForKey:@"EXPRESS_FEATURE_TITLE_APP_ANALYTICS" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 4uLL:
      id v7 = +[NSBundle mainBundle];
      id v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"EXPRESS_FEATURE_TITLE_DEVICE_AND_APP_ANALYTICS"];
      id v16 = [(NSBundle *)v7 localizedStringForKey:v8 value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 5uLL:
      id v9 = +[NSBundle mainBundle];
      id v16 = [(NSBundle *)v9 localizedStringForKey:@"EXPRESS_FEATURE_TITLE_SIRI" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 6uLL:
    case 8uLL:
    case 0xAuLL:
      id v16 = 0;
      break;
    case 7uLL:
      id v10 = +[NSBundle mainBundle];
      id v16 = [(NSBundle *)v10 localizedStringForKey:@"EXPRESS_FEATURE_TITLE_SCREEN_TIME" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 9uLL:
      id v11 = +[NSBundle mainBundle];
      id v16 = [(NSBundle *)v11 localizedStringForKey:@"EXPRESS_FEATURE_TITLE_APPEARANCE" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 0xBuLL:
      id v12 = +[NSBundle mainBundle];
      id v16 = [(NSBundle *)v12 localizedStringForKey:@"EXPRESS_FEATURE_TITLE_APPLE_WALLET" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 0xCuLL:
      id v13 = +[NSBundle mainBundle];
      id v16 = [(NSBundle *)v13 localizedStringForKey:@"EXPRESS_FEATURE_TITLE_APPLE_ACTION_BUTTON" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 0xDuLL:
      id v14 = +[NSBundle mainBundle];
      id v16 = [(NSBundle *)v14 localizedStringForKey:@"EXPRESS_FEATURE_TITLE_STOLEN_DEVICE_PROTECTION" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    default:
      break;
  }

  return v16;
}

+ (id)_localizedDescriptionForFeature:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id v3 = +[NSBundle mainBundle];
      id v17 = [(NSBundle *)v3 localizedStringForKey:@"EXPRESS_FEATURE_DESCRIPTION_LOCATION_SERVICES" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 2uLL:
      char v4 = +[NSBundle mainBundle];
      id v5 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"EXPRESS_FEATURE_DESCRIPTION_DEVICE_ANALYTICS"];
      id v17 = [(NSBundle *)v4 localizedStringForKey:v5 value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 3uLL:
      id v6 = +[NSBundle mainBundle];
      id v17 = [(NSBundle *)v6 localizedStringForKey:@"EXPRESS_FEATURE_DESCRIPTION_APP_ANALYTICS" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 4uLL:
      id v7 = +[NSBundle mainBundle];
      id v8 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"EXPRESS_FEATURE_DESCRIPTION_DEVICE_AND_APP_ANALYTICS"];
      id v17 = [(NSBundle *)v7 localizedStringForKey:v8 value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 5uLL:
      id v9 = +[NSBundle mainBundle];
      id v17 = [(NSBundle *)v9 localizedStringForKey:@"EXPRESS_FEATURE_DESCRIPTION_SIRI" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 6uLL:
    case 8uLL:
    case 0xAuLL:
      id v17 = 0;
      break;
    case 7uLL:
      id v10 = +[NSBundle mainBundle];
      id v17 = [(NSBundle *)v10 localizedStringForKey:@"EXPRESS_FEATURE_DESCRIPTION_SCREEN_TIME" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 9uLL:
      id v11 = +[NSBundle mainBundle];
      id v12 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"EXPRESS_FEATURE_DESCRIPTION_APPEARANCE"];
      id v17 = [(NSBundle *)v11 localizedStringForKey:v12 value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 0xBuLL:
      id v17 = 0;
      break;
    case 0xCuLL:
      id v13 = +[NSBundle mainBundle];
      id v14 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"EXPRESS_FEATURE_DESCRIPTION_ACTION_BUTTON"];
      id v17 = [(NSBundle *)v13 localizedStringForKey:v14 value:&stru_1002B4E18 table:@"Localizable"];

      break;
    case 0xDuLL:
      id v15 = +[NSBundle mainBundle];
      id v17 = [(NSBundle *)v15 localizedStringForKey:@"EXPRESS_FEATURE_DESCRIPTION_STOLEN_DEVICE_PROTECTION" value:&stru_1002B4E18 table:@"Localizable"];

      break;
    default:
      break;
  }

  return v17;
}

+ (id)_accessoryViewForFeature:(unint64_t)a3
{
  id v47 = a1;
  SEL v46 = a2;
  unint64_t v45 = a3;
  id v44 = 0;
  id location = 0;
  id v42 = 0;
  id v41 = +[UIColor systemBlueColor];
  switch(v45)
  {
    case 1uLL:
      objc_storeStrong(&location, @"location.fill");
      goto LABEL_11;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      objc_storeStrong(&location, @"chart.bar.xaxis");
      goto LABEL_11;
    case 5uLL:
      id v3 = +[UIImage imageNamed:@"Siri"];
      id v4 = v44;
      id v44 = v3;

      goto LABEL_11;
    case 6uLL:
    case 8uLL:
      id v48 = 0;
      int v40 = 1;
      goto LABEL_20;
    case 7uLL:
      objc_storeStrong(&location, @"hourglass");
      id v5 = +[UIColor systemIndigoColor];
      id v6 = v41;
      id v41 = v5;

      goto LABEL_11;
    case 9uLL:
      objc_storeStrong(&location, @"textformat.size");
      goto LABEL_11;
    case 0xAuLL:
      objc_storeStrong(&location, @"applewatch.side.right");
      id v7 = +[UIColor systemGray4Color];
      id v8 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:2];
      id v9 = [(UIColor *)v7 resolvedColorWithTraitCollection:v8];
      id v10 = v41;
      id v41 = v9;

      goto LABEL_11;
    case 0xCuLL:
      objc_storeStrong(&location, @"button.vertical.left.press");
      goto LABEL_11;
    case 0xDuLL:
      objc_storeStrong(&v42, @"com.apple.graphic-icon.stolen-device-protection");
      goto LABEL_11;
    default:
LABEL_11:
      if (v42)
      {
        id v39 = +[ISImageDescriptor imageDescriptorNamed:kISImageDescriptorTableUIName];
        id v11 = +[UIScreen mainScreen];
        [(UIScreen *)v11 scale];
        [v39 setScale:];

        [v39 setDrawBorder:1];
        if (v41)
        {
          id v12 = [objc_alloc((Class)IFColor) initWithCGColor:[v41 CGColor]];
          [v39 setTintColor:v12];
        }
        id v13 = objc_alloc((Class)ISIcon);
        id v38 = [v13 initWithType:v42];
        id v37 = [v38 imageForDescriptor:v39];
        if ([v37 placeholder])
        {
          id v14 = [v38 prepareImageForDescriptor:v39];
          id v15 = [v38 imageForDescriptor:v39];
          id v16 = v37;
          id v37 = v15;
        }
        id v36 = [v37 CGImage];
        id v17 = [objc_alloc((Class)UIImage) initWithCGImage:v36];
        id v18 = v44;
        id v44 = v17;

        objc_storeStrong(&v37, 0);
        objc_storeStrong(&v38, 0);
        objc_storeStrong(&v39, 0);
      }
      if (v44)
      {
        id v19 = objc_alloc((Class)UIImageView);
        id v48 = [v19 initWithImage:v44];
        int v40 = 1;
      }
      else
      {
        id v20 = +[UIImage systemImageNamed:location];
        id v21 = v44;
        id v44 = v20;

        id v22 = objc_alloc((Class)UIImageView);
        id v35 = [v22 initWithImage:v44];
        [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v35 setContentMode:4];
        id v23 = +[UIImageSymbolConfiguration configurationWithPointSize:17.0];
        [v35 setPreferredSymbolConfiguration:v23];

        id v24 = +[UIColor whiteColor];
        [v35 setTintColor:v24];

        id v34 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
        [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
        [v34 setBackgroundColor:v41];
        [v34 _setContinuousCornerRadius:8.0];
        [v34 addSubview:v35];
        id v25 = [v35 centerXAnchor];
        id v26 = [v34 centerXAnchor];
        id v27 = [v25 constraintEqualToAnchor:v26];
        v49[0] = v27;
        id v28 = [v35 centerYAnchor];
        id v29 = [v34 centerYAnchor];
        id v30 = [v28 constraintEqualToAnchor:v29];
        v49[1] = v30;
        id v31 = +[NSArray arrayWithObjects:v49 count:2];
        +[NSLayoutConstraint activateConstraints:v31];

        id v48 = v34;
        int v40 = 1;
        objc_storeStrong(&v34, 0);
        objc_storeStrong(&v35, 0);
      }
LABEL_20:
      objc_storeStrong(&v41, 0);
      objc_storeStrong(&v42, 0);
      objc_storeStrong(&location, 0);
      objc_storeStrong(&v44, 0);
      id v32 = v48;
      return v32;
  }
}

+ (id)_determineIfFeatureIsInExpress:(unint64_t)a3 withDataSource:(id)a4
{
  id v30 = a1;
  SEL v29 = a2;
  unint64_t v28 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v26 = 0;
  switch(v28)
  {
    case 1uLL:
      id v4 = [location locationServicesOptIn];
      id v5 = v26;
      id v26 = v4;

      break;
    case 2uLL:
    case 4uLL:
      id v9 = [location deviceAnalyticsOptIn];
      id v10 = v26;
      id v26 = v9;

      break;
    case 3uLL:
      id v11 = [location appAnalyticsOptIn];
      id v12 = v26;
      id v26 = v11;

      break;
    case 5uLL:
      id v13 = [location siriOptIn];
      id v14 = v26;
      id v26 = v13;

      break;
    case 6uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
      goto LABEL_19;
    case 7uLL:
      id v6 = [location screenTimeEnabled];
      id v7 = v26;
      id v26 = v6;

      break;
    case 8uLL:
      id v15 = [location softwareUpdateAutoDownloadEnabled];
      unsigned __int8 v16 = [v15 BOOLValue];
      char v24 = 0;
      unsigned __int8 v17 = 0;
      if (v16)
      {
        id v25 = [location softwareUpdateAutoUpdateEnabled];
        char v24 = 1;
        unsigned __int8 v17 = [v25 BOOLValue];
      }
      id v18 = +[NSNumber numberWithInt:v17 & 1];
      id v19 = v26;
      id v26 = v18;

      if (v24) {
      break;
      }
    case 9uLL:
      id v8 = (char *)[location userInterfaceStyleModeValue];
      if (v8)
      {
        if ((unint64_t)(v8 - 1) < 2 || v8 == (char *)100 || v8 == (char *)102) {
          objc_storeStrong(&v26, &__kCFBooleanTrue);
        }
      }
      else
      {
LABEL_19:
        objc_storeStrong(&v26, 0);
      }
      break;
    case 0xDuLL:
      id v20 = [location stolenDeviceProtectionEnabled];
      id v21 = v26;
      id v26 = v20;

      break;
    default:
      break;
  }
  id v22 = v26;
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&location, 0);
  return v22;
}

+ (id)_stateStringForFeature:(unint64_t)a3 withDataSource:(id)a4 withFeatureState:(id)a5
{
  id v17 = a1;
  SEL v16 = a2;
  unint64_t v15 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  switch(v15)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
    case 0xCuLL:
    case 0xDuLL:
      if (!v13) {
        goto LABEL_17;
      }
      if ([v13 BOOLValue])
      {
        id v10 = +[NSBundle mainBundle];
        id v18 = [(NSBundle *)v10 localizedStringForKey:@"EXPRESS_FEATURE_STATE_ON" value:&stru_1002B4E18 table:@"Localizable"];
      }
      else
      {
        id v10 = +[NSBundle mainBundle];
        id v18 = [(NSBundle *)v10 localizedStringForKey:@"EXPRESS_FEATURE_STATE_OFF" value:&stru_1002B4E18 table:@"Localizable"];
      }

      break;
    case 9uLL:
      id v6 = [location userInterfaceStyleModeValue];
      if (!v6) {
        goto LABEL_17;
      }
      if (v6 == (id)1)
      {
        id v7 = +[NSBundle mainBundle];
        id v18 = [(NSBundle *)v7 localizedStringForKey:@"EXPRESS_FEATURE_STATE_LIGHT" value:&stru_1002B4E18 table:@"Localizable"];
      }
      else if (v6 == (id)2)
      {
        id v8 = +[NSBundle mainBundle];
        id v18 = [(NSBundle *)v8 localizedStringForKey:@"EXPRESS_FEATURE_STATE_DARK" value:&stru_1002B4E18 table:@"Localizable"];
      }
      else
      {
        if (v6 != (id)100 && v6 != (id)102) {
          goto LABEL_17;
        }
        id v9 = +[NSBundle mainBundle];
        id v18 = [(NSBundle *)v9 localizedStringForKey:@"EXPRESS_FEATURE_STATE_AUTO" value:&stru_1002B4E18 table:@"Localizable"];
      }
      break;
    default:
LABEL_17:
      id v18 = 0;
      break;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
  id v11 = v18;

  return v11;
}

- (void)_learnMoreTapped
{
  id v4 = self;
  location[1] = (id)a2;
  id v2 = [(BuddyExpressWelcomeController *)self privacyIdentifiers];
  location[0] = +[OBPrivacyPresenter presenterForPrivacyUnifiedAboutWithIdentifiers:v2];

  [location[0] setPresentingViewController:v4];
  [location[0] present];
  objc_storeStrong(location, 0);
}

- (void)_recordAnalyticsEventForDataProvider:(id)a3 presented:(BOOL)a4 customized:(BOOL)a5
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v18 = a4;
  BOOL v17 = a5;
  id v7 = dispatch_get_global_queue(-128, 0);
  id v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_1000B3158;
  id v12 = &unk_1002B0E98;
  id v13 = location[0];
  id v14 = v20;
  BOOL v15 = a4;
  BOOL v16 = v17;
  dispatch_async(v7, &v8);

  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)prepareStateForExpressFeatures:(id)a3 withDataSource:(id)a4
{
  BOOL v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = objc_alloc_init((Class)NSMutableDictionary);
  memset(__b, 0, sizeof(__b));
  id v5 = location[0];
  id v6 = [v5 countByEnumeratingWithState:__b objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v6; ++i)
      {
        if (*(void *)__b[2] != v7) {
          objc_enumerationMutation(v5);
        }
        id v13 = *(id *)(__b[1] + 8 * i);
        id v11 = 0;
        id v11 = [v13 unsignedIntegerValue];
        id v10 = [(id)objc_opt_class() _determineIfFeatureIsInExpress:v11 withDataSource:v15];
        if (v10) {
          [v14 setObject:v10 forKeyedSubscript:v13];
        }
        objc_storeStrong(&v10, 0);
      }
      id v6 = [v5 countByEnumeratingWithState:__b objects:v18 count:16];
    }
    while (v6);
  }

  id v9 = [v14 copy];
  [(BuddyExpressWelcomeController *)v17 setExpressSettingsStateCacheInDataSource:v9];

  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (void)controllerWasPopped
{
  id v2 = [(BuddyExpressWelcomeController *)self expressSettingsCache];
  [(BYExpressSettingsSetupCache *)v2 resetCache];
}

- (BOOL)controllerNeedsToRun
{
  id v19 = self;
  v18[1] = (id)a2;
  id v2 = [(BuddyExpressWelcomeController *)self miscState];
  unsigned __int8 v3 = [(BuddyMiscState *)v2 userChoseExpress];

  if (v3)
  {
    char v20 = 0;
  }
  else
  {
    v18[0] = +[AKAccountManager sharedInstance];
    id location = [v18[0] primaryAuthKitAccount];
    if (location && ([v18[0] isBeneficiaryForAccount:location] & 1) != 0)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = oslog;
        os_log_type_t v5 = v15;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "Skipping express as the current account is a beneficiary", buf, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      char v20 = 0;
    }
    else
    {
      id v6 = [(BuddyExpressWelcomeController *)v19 pendingRestoreState];
      uint64_t v7 = [(BuddyPendingRestoreState *)v6 backupItem];
      id v8 = [(BuddyExpressWelcomeController *)v19 pendingRestoreState];
      id v9 = [(BuddyPendingRestoreState *)v8 attemptedBackupItem];
      char v13 = [(RestorableBackupItem *)v7 isEqual:v9];

      char HasCompletedInitialRun = BYSetupAssistantHasCompletedInitialRun();
      char v11 = 0;
      if ((HasCompletedInitialRun & 1) == 0) {
        char v11 = v13 ^ 1;
      }
      char v20 = v11 & 1;
    }
    objc_storeStrong(&location, 0);
    objc_storeStrong(v18, 0);
  }
  return v20 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  int v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v33[0] = 0;
  v33[1] = v33;
  int v34 = 838860800;
  int v35 = 48;
  id v36 = sub_1000B3CE8;
  id v37 = sub_1000B3D2C;
  id v38 = 0;
  v27[0] = 0;
  v27[1] = v27;
  int v28 = 838860800;
  int v29 = 48;
  id v30 = sub_1000B3CE8;
  id v31 = sub_1000B3D2C;
  id v32 = 0;
  dispatch_group_t group = dispatch_group_create();
  dispatch_group_enter(group);
  unsigned __int8 v3 = v40;
  char v20 = _NSConcreteStackBlock;
  int v21 = -1073741824;
  int v22 = 0;
  id v23 = sub_1000B3D38;
  char v24 = &unk_1002B2338;
  v25[1] = v33;
  v25[0] = group;
  [(BuddyExpressWelcomeController *)v3 createDataProvider:&v20];
  id v19 = objc_alloc_init((Class)AAUIProfilePictureStore);
  if (v19)
  {
    dispatch_group_enter(group);
    char v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    BOOL v16 = sub_1000B3E2C;
    BOOL v17 = &unk_1002B2388;
    v18[1] = v27;
    v18[0] = group;
    [v19 fetchProfilePictureForAccountOwner:&v13];
    objc_storeStrong(v18, 0);
  }
  id v4 = group;
  os_log_type_t v5 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_1000B3FB0;
  id v10 = &unk_1002B23D8;
  v12[1] = v33;
  char v11 = v40;
  v12[0] = location[0];
  v12[2] = v27;
  dispatch_group_notify(v4, (dispatch_queue_t)v5, &block);

  objc_storeStrong(v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(v25, 0);
  objc_storeStrong((id *)&group, 0);
  _Block_object_dispose(v27, 8);
  objc_storeStrong(&v32, 0);
  _Block_object_dispose(v33, 8);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

- (void)startOver
{
  id v2 = [(BuddyExpressWelcomeController *)self miscState];
  [(BuddyMiscState *)v2 setUserChoseExpress:0];

  unsigned __int8 v3 = [(BuddyExpressWelcomeController *)self miscState];
  [(BuddyMiscState *)v3 setWalletProvisioningContext:0];

  id v4 = [(BuddyExpressWelcomeController *)self paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v4 setExpressDataSource:0 features:0];
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
}

- (BFFBackupDeviceController)backupDeviceController
{
  return self->_backupDeviceController;
}

- (void)setBackupDeviceController:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BYChronicle)chronicle
{
  return self->_chronicle;
}

- (void)setChronicle:(id)a3
{
}

- (BuddyDisplayZoomExecutor)displayZoomExecutor
{
  return self->_displayZoomExecutor;
}

- (void)setDisplayZoomExecutor:(id)a3
{
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
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

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
}

- (BYExpressSettingsSetupCache)expressSettingsCache
{
  return self->_expressSettingsCache;
}

- (void)setExpressSettingsCache:(id)a3
{
}

- (BYExpressSetupDataProvider)expressSetupDataProvider
{
  return self->_expressSetupDataProvider;
}

- (void)setExpressSetupDataProvider:(id)a3
{
}

- (NSArray)privacyIdentifiers
{
  return self->_privacyIdentifiers;
}

- (void)setPrivacyIdentifiers:(id)a3
{
}

- (NSDictionary)expressSettingsStateCacheInDataSource
{
  return self->_expressSettingsStateCacheInDataSource;
}

- (void)setExpressSettingsStateCacheInDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end