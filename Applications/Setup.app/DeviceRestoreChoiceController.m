@interface DeviceRestoreChoiceController
+ (BOOL)hiddenFromMultiUser;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)_useCompactMode;
- (BOOL)controllerNeedsToRun;
- (BYPreferencesController)buddyPreferences;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BYRunState)runState;
- (BuddyChoice)cloudRestoreChoice;
- (BuddyChoice)iTunesRestoreChoice;
- (BuddyChoice)migrateFromAndroidChoice;
- (BuddyChoice)migrateFromiOSChoice;
- (BuddyChoice)setUpAsNewChoice;
- (BuddyEnrollmentCoordinator)enrollmentCoordinator;
- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider;
- (BuddyNetworkProvider)networkProvider;
- (BuddyPendingRestoreState)pendingRestoreState;
- (BuddySetupMethod)setupMethod;
- (BuddySuspendTask)suspendTask;
- (BuddyTableChoiceManager)choiceManager;
- (DeviceRestoreChoiceController)init;
- (MCProfileConnection)managedConfiguration;
- (NSLayoutConstraint)tableHeightAnchor;
- (NSMutableDictionary)choiceMap;
- (OBAnimationController)animationController;
- (ProximitySetupController)proximitySetupController;
- (UITableView)choiceTable;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (void)_migrateFromiOSSelected;
- (void)_populateRestoreChoices;
- (void)didSelectChoice:(id)a3;
- (void)flowItemDidAppear:(BOOL)a3;
- (void)selectChoiceForIdentifier:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setChoiceManager:(id)a3;
- (void)setChoiceMap:(id)a3;
- (void)setChoiceTable:(id)a3;
- (void)setCloudRestoreChoice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnrollmentCoordinator:(id)a3;
- (void)setFlowItemDispositionProvider:(id)a3;
- (void)setITunesRestoreChoice:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMigrateFromAndroidChoice:(id)a3;
- (void)setMigrateFromiOSChoice:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setPendingRestoreState:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRunState:(id)a3;
- (void)setSetUpAsNewChoice:(id)a3;
- (void)setSetupMethod:(id)a3;
- (void)setSuspendTask:(id)a3;
- (void)setTableHeightAnchor:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DeviceRestoreChoiceController

- (DeviceRestoreChoiceController)init
{
  id location = self;
  v28[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"DEVICE_RESTORE_APPS_DATA"];
  v28[0] = [(NSBundle *)v2 localizedStringForKey:v3 value:&stru_1002B4E18 table:@"Localizable"];

  id v4 = location;
  v5 = +[NSBundle mainBundle];
  v6 = [(NSBundle *)v5 localizedStringForKey:@"DEVICE_RESTORE_DETAIL" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v27.receiver = v4;
  v27.super_class = (Class)DeviceRestoreChoiceController;
  id location = [(DeviceRestoreChoiceController *)&v27 initWithTitle:v28[0] detailText:v6 icon:0 adoptTableViewScrollView:1];
  objc_storeStrong(&location, location);

  if (location)
  {
    v7 = [BuddyTableChoiceManager alloc];
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_1000DF1DC;
    v25 = &unk_1002B2A98;
    id v26 = location;
    v8 = [(BuddyTableChoiceManager *)v7 initWithCellConstructor:&v22 allowManualRowHeight:1];
    v9 = (void *)*((void *)location + 18);
    *((void *)location + 18) = v8;

    [*((id *)location + 18) setChooseableDelegate:];
    id v10 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    v11 = (void *)*((void *)location + 20);
    *((void *)location + 20) = v10;

    id v12 = [*((id *)location + 18) tableViewDelegate];
    [*((id *)location + 20) setDelegate:v12];

    id v13 = [*((id *)location + 18) tableViewDataSource];
    [*((id *)location + 20) setDataSource:v13];

    [*((id *)location + 20) setEstimatedRowHeight:0.0];
    double v14 = sub_1000DF524();
    [*(void *)&v14, *(void *)&v15, *(void *)&v16, *(void *)&v17, v22, v23, v24, v25];
    id v18 = +[NSMutableDictionary dictionary];
    v19 = (void *)*((void *)location + 21);
    *((void *)location + 21) = v18;

    objc_storeStrong(&v26, 0);
  }
  v20 = (DeviceRestoreChoiceController *)location;
  objc_storeStrong(v28, 0);
  objc_storeStrong(&location, 0);
  return v20;
}

- (BOOL)controllerNeedsToRun
{
  v24 = self;
  SEL v23 = a2;
  v2 = [(DeviceRestoreChoiceController *)self suspendTask];
  [(BuddySuspendTask *)v2 preheat];

  id v3 = [(DeviceRestoreChoiceController *)v24 buddyPreferencesExcludedFromBackup];
  id v4 = [(DeviceRestoreChoiceController *)v24 runState];
  id v5 = +[BuddyMigrationStateProvider validateAndResolveMigrationStateUsingPreferences:v3 didCompleteInitialRun:(unint64_t)[(BYRunState *)v4 hasCompletedInitialRun] & 1];
  LOBYTE(v2) = v5 != 0;

  char v22 = v2 & 1;
  if (v2)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v6 = oslog;
      os_log_type_t v7 = v20;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "DeviceRestoreChoiceController migration state found", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    return 1;
  }
  else
  {
    v8 = [(DeviceRestoreChoiceController *)v24 buddyPreferences];
    unsigned __int8 v9 = [(BYPreferencesController *)v8 BOOLForKey:@"RestoreChoice"];

    char v18 = v9 & 1;
    char v17 = BYSetupAssistantHasCompletedInitialRun() & 1;
    id v10 = [(DeviceRestoreChoiceController *)v24 buddyPreferences];
    unsigned __int8 v11 = [(BYPreferencesController *)v10 BOOLForKey:BYBuddyDoneKey];

    char v16 = v11 & 1;
    char v15 = 0;
    char v12 = 0;
    if ((v18 & 1) == 0)
    {
      char v12 = 0;
      if ((v17 & 1) == 0) {
        char v12 = v16 ^ 1;
      }
    }
    char v15 = v12 & 1;
    os_log_t v14 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      sub_100076C7C((uint64_t)v26, v15 & 1, v18 & 1, v17 & 1, v16 & 1);
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "DeviceRestoreChoiceController needsToRun: %d. hasRestoreChoice: %d, hasCompletedInitialSetup: %d, setupDone: %d", v26, 0x1Au);
    }
    objc_storeStrong((id *)&v14, 0);
    return v15 & 1;
  }
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupRestore;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (void)_populateRestoreChoices
{
  v119 = self;
  SEL v118 = a2;
  v2 = [(DeviceRestoreChoiceController *)self flowItemDispositionProvider];
  unint64_t v3 = ([(BuddyFlowItemDispositionProvider *)v2 dispositions] >> 4) & 1;

  char v117 = v3 & 1;
  id v116 = +[NSMutableArray array];
  id v4 = [(DeviceRestoreChoiceController *)v119 managedConfiguration];
  LOBYTE(v3) = [(MCProfileConnection *)v4 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed] != 2;

  char v115 = v3 & 1;
  if (v3)
  {
    id v5 = [BuddyChoice alloc];
    v6 = +[NSBundle mainBundle];
    os_log_type_t v7 = [(NSBundle *)v6 localizedStringForKey:@"RESTORE_FROM_OTA_BACKUP" value:&stru_1002B4E18 table:@"Localizable"];
    v8 = [(BuddyChoice *)v5 initWithTitle:v7 nextItemClass:0];
    [(DeviceRestoreChoiceController *)v119 setCloudRestoreChoice:v8];

    unsigned __int8 v9 = +[UIImage imageNamed:@"Cloud"];
    id v10 = [(UIImage *)v9 imageWithRenderingMode:2];
    unsigned __int8 v11 = [(DeviceRestoreChoiceController *)v119 cloudRestoreChoice];
    [(BuddyChoice *)v11 setIcon:v10];

    char v12 = [(DeviceRestoreChoiceController *)v119 cloudRestoreChoice];
    id v13 = [(DeviceRestoreChoiceController *)v119 choiceMap];
    [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:@"restoreFromiCloudBackup"];

    os_log_t v14 = [(DeviceRestoreChoiceController *)v119 networkProvider];
    id v114 = +[BuddyRestoreNetworkAlertController alertControllerForUnsupportedNetworkWithCellularRestoreSupport:[(BuddyNetworkProvider *)v14 deviceSupportsCellularRestore]];

    objc_initWeak(&location, v119);
    v107 = _NSConcreteStackBlock;
    int v108 = -1073741824;
    int v109 = 0;
    v110 = sub_1000E0B7C;
    v111 = &unk_1002B0CA8;
    objc_copyWeak(&v112, &location);
    [v114 setPresentWiFiSettings:&v107];
    char v15 = [(DeviceRestoreChoiceController *)v119 cloudRestoreChoice];
    id v16 = v114;
    v101 = _NSConcreteStackBlock;
    int v102 = -1073741824;
    int v103 = 0;
    v104 = sub_1000E0C20;
    v105 = &unk_1002B0D98;
    objc_copyWeak(&v106, &location);
    [(BuddyChoice *)v15 setConfirmationAlert:v16 condition:&v101];

    id v17 = v116;
    char v18 = [(DeviceRestoreChoiceController *)v119 cloudRestoreChoice];
    [v17 addObject:v18];

    objc_destroyWeak(&v106);
    objc_destroyWeak(&v112);
    objc_destroyWeak(&location);
    objc_storeStrong(&v114, 0);
  }
  if (+[BuddyMigrationCapability currentDeviceShouldOfferMigration]&& (v117 & 1) == 0)
  {
    v19 = [BuddyChoice alloc];
    os_log_type_t v20 = +[NSBundle mainBundle];
    id v21 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"TRANSFER_DIRECTLY"];
    char v22 = [(NSBundle *)v20 localizedStringForKey:v21 value:&stru_1002B4E18 table:@"Localizable"];
    SEL v23 = [(BuddyChoice *)v19 initWithTitle:v22 nextItemClass:0];
    [(DeviceRestoreChoiceController *)v119 setMigrateFromiOSChoice:v23];

    id v100 = @"iPhone";
    id v121 = 0;
    v24 = +[UIDevice currentDevice];
    id v25 = [(UIDevice *)v24 userInterfaceIdiom];

    id v121 = v25;
    BOOL v26 = 1;
    if (v25 != (id)1) {
      BOOL v26 = v121 == (id)5;
    }
    if (v26) {
      objc_storeStrong(&v100, @"iPad");
    }
    objc_super v27 = +[UIImage imageNamed:v100];
    v28 = [(UIImage *)v27 imageWithRenderingMode:2];
    v29 = [(DeviceRestoreChoiceController *)v119 migrateFromiOSChoice];
    [(BuddyChoice *)v29 setIcon:v28];

    v30 = [(DeviceRestoreChoiceController *)v119 migrateFromiOSChoice];
    v31 = [(DeviceRestoreChoiceController *)v119 choiceMap];
    [(NSMutableDictionary *)v31 setObject:v30 forKeyedSubscript:@"migrateFromiOS"];

    id v32 = v116;
    v33 = [(DeviceRestoreChoiceController *)v119 migrateFromiOSChoice];
    [v32 addObject:v33];

    objc_storeStrong(&v100, 0);
  }
  v34 = [(DeviceRestoreChoiceController *)v119 enrollmentCoordinator];
  BOOL v35 = (id)[(BuddyEnrollmentCoordinator *)v34 mdmEnrollmentChannel] == (id)2;

  BOOL v99 = v35;
  char v98 = 0;
  char v36 = 0;
  if (!v35) {
    char v36 = v117 ^ 1;
  }
  char v98 = v36 & 1;
  if (v36)
  {
    v37 = [BuddyChoice alloc];
    v38 = +[NSBundle mainBundle];
    v39 = [(NSBundle *)v38 localizedStringForKey:@"RESTORE_FROM_MAC_OR_PC" value:&stru_1002B4E18 table:@"Localizable"];
    v40 = [(BuddyChoice *)v37 initWithTitle:v39 nextItemClass:objc_opt_class()];
    [(DeviceRestoreChoiceController *)v119 setITunesRestoreChoice:v40];

    v41 = +[UIImage imageNamed:@"Mac"];
    v42 = [(UIImage *)v41 imageWithRenderingMode:2];
    v43 = [(DeviceRestoreChoiceController *)v119 iTunesRestoreChoice];
    [(BuddyChoice *)v43 setIcon:v42];

    v44 = [(DeviceRestoreChoiceController *)v119 iTunesRestoreChoice];
    v45 = [(DeviceRestoreChoiceController *)v119 choiceMap];
    [(NSMutableDictionary *)v45 setObject:v44 forKeyedSubscript:@"restoreFromiTunesBackup"];

    v46 = +[NSBundle mainBundle];
    v47 = [(NSBundle *)v46 localizedStringForKey:@"RESTORE_FROM_ITUNES_VERSION_WARNING_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    v48 = +[NSBundle mainBundle];
    id v49 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"RESTORE_FROM_ITUNES_VERSION_WARNING_MESSAGE"];
    v50 = [(NSBundle *)v48 localizedStringForKey:v49 value:&stru_1002B4E18 table:@"Localizable"];
    id v97 = +[UIAlertController alertControllerWithTitle:v47 message:v50 preferredStyle:1];

    v51 = [(DeviceRestoreChoiceController *)v119 iTunesRestoreChoice];
    v52 = +[NSBundle mainBundle];
    v53 = [(NSBundle *)v52 localizedStringForKey:@"OK" value:&stru_1002B4E18 table:@"Localizable"];
    id v54 = [(BuddyChoice *)v51 confirmationAcceptActionWithTitle:v53 style:0 action:0];
    [v97 addAction:v54];

    v55 = [(DeviceRestoreChoiceController *)v119 iTunesRestoreChoice];
    v56 = +[NSBundle mainBundle];
    v57 = [(NSBundle *)v56 localizedStringForKey:@"CANCEL" value:&stru_1002B4E18 table:@"Localizable"];
    id v58 = [(BuddyChoice *)v55 confirmationCancelActionWithTitle:v57 style:1 action:0];
    [v97 addAction:v58];

    id v96 = [(DeviceRestoreChoiceController *)v119 proximitySetupController];
    v59 = [(DeviceRestoreChoiceController *)v119 iTunesRestoreChoice];
    v90 = _NSConcreteStackBlock;
    int v91 = -1073741824;
    int v92 = 0;
    v93 = sub_1000E0C90;
    v94 = &unk_1002B2AC0;
    id v95 = v96;
    [(BuddyChoice *)v59 setConfirmationAlert:v97 condition:&v90];

    id v60 = v116;
    v61 = [(DeviceRestoreChoiceController *)v119 iTunesRestoreChoice];
    [v60 addObject:v61];

    objc_storeStrong(&v95, 0);
    objc_storeStrong(&v96, 0);
    objc_storeStrong(&v97, 0);
  }
  if (+[BuddyMoveFromAndroidController showMoveFromAndroidRestoreChoice]&& !v99)
  {
    v62 = [BuddyChoice alloc];
    v63 = +[NSBundle mainBundle];
    v64 = [(NSBundle *)v63 localizedStringForKey:@"MIGRATE_FROM_ANDROID_DEVICE" value:&stru_1002B4E18 table:@"Localizable"];
    v65 = [(BuddyChoice *)v62 initWithTitle:v64 nextItemClass:objc_opt_class()];
    [(DeviceRestoreChoiceController *)v119 setMigrateFromAndroidChoice:v65];

    v66 = +[UIImage imageNamed:@"Android"];
    v67 = [(UIImage *)v66 imageWithRenderingMode:2];
    v68 = [(DeviceRestoreChoiceController *)v119 migrateFromAndroidChoice];
    [(BuddyChoice *)v68 setIcon:v67];

    v69 = [(DeviceRestoreChoiceController *)v119 migrateFromAndroidChoice];
    v70 = [(DeviceRestoreChoiceController *)v119 choiceMap];
    [(NSMutableDictionary *)v70 setObject:v69 forKeyedSubscript:@"migrateFromAndroid"];

    id v71 = v116;
    v72 = [(DeviceRestoreChoiceController *)v119 migrateFromAndroidChoice];
    [v71 addObject:v72];
  }
  v73 = [BuddyChoice alloc];
  v74 = +[NSBundle mainBundle];
  v75 = [(NSBundle *)v74 localizedStringForKey:@"DONT_TRANSFER_APPS_DATA" value:&stru_1002B4E18 table:@"Localizable"];
  v76 = [(BuddyChoice *)v73 initWithTitle:v75 nextItemClass:0];
  [(DeviceRestoreChoiceController *)v119 setSetUpAsNewChoice:v76];

  id v89 = @"Don_t_Transfer";
  id v120 = 0;
  v77 = +[UIDevice currentDevice];
  id v78 = [(UIDevice *)v77 userInterfaceIdiom];

  id v120 = v78;
  BOOL v79 = 1;
  if (v78 != (id)1) {
    BOOL v79 = v120 == (id)5;
  }
  if (v79) {
    objc_storeStrong(&v89, @"Don_t_Transfer_iPad");
  }
  v80 = +[UIImage imageNamed:v89];
  v81 = [(UIImage *)v80 imageWithRenderingMode:2];
  v82 = [(DeviceRestoreChoiceController *)v119 setUpAsNewChoice];
  [(BuddyChoice *)v82 setIcon:v81];

  v83 = [(DeviceRestoreChoiceController *)v119 setUpAsNewChoice];
  v84 = [(DeviceRestoreChoiceController *)v119 choiceMap];
  [(NSMutableDictionary *)v84 setObject:v83 forKeyedSubscript:@"setUpAsNew"];

  v85 = [(DeviceRestoreChoiceController *)v119 choiceManager];
  v123[0] = v116;
  v86 = [(DeviceRestoreChoiceController *)v119 setUpAsNewChoice];
  v122 = v86;
  v87 = +[NSArray arrayWithObjects:&v122 count:1];
  v123[1] = v87;
  v88 = +[NSArray arrayWithObjects:v123 count:2];
  [(BuddyTableChoiceManager *)v85 setChoices:v88];

  objc_storeStrong(&v89, 0);
  objc_storeStrong(&v116, 0);
}

- (void)didSelectChoice:(id)a3
{
  char v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v3 = (BuddyChoice *)location[0];
  id v4 = [(DeviceRestoreChoiceController *)v15 migrateFromiOSChoice];

  if (v3 == v4)
  {
    [(DeviceRestoreChoiceController *)v15 _migrateFromiOSSelected];
  }
  else
  {
    id v5 = (BuddyChoice *)location[0];
    v6 = [(DeviceRestoreChoiceController *)v15 cloudRestoreChoice];

    if (v5 == v6)
    {
      os_log_type_t v7 = [(DeviceRestoreChoiceController *)v15 setupMethod];
      [(BuddySetupMethod *)v7 setIntendedDataTransferMethod:1];
    }
    else
    {
      v8 = (BuddyChoice *)location[0];
      unsigned __int8 v9 = [(DeviceRestoreChoiceController *)v15 setUpAsNewChoice];

      if (v8 == v9)
      {
        id v10 = [(DeviceRestoreChoiceController *)v15 setupMethod];
        [(BuddySetupMethod *)v10 setDataTransferMethod:0];
      }
      unsigned __int8 v11 = [(DeviceRestoreChoiceController *)v15 pendingRestoreState];
      [(BuddyPendingRestoreState *)v11 clearBackupItem];
    }
    char v12 = [(DeviceRestoreChoiceController *)v15 buddyPreferences];
    [(BYPreferencesController *)v12 setObject:&__kCFBooleanTrue forKey:@"RestoreChoice"];

    id v13 = [(DeviceRestoreChoiceController *)v15 delegate];
    -[BFFFlowItemDelegate flowItemDone:nextItemClass:](v13, "flowItemDone:nextItemClass:", v15, [location[0] nextControllerClass]);
  }
  objc_storeStrong(location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DeviceRestoreChoiceController;
  [(DeviceRestoreChoiceController *)&v5 viewWillAppear:a3];
  if ([(DeviceRestoreChoiceController *)v8 _useCompactMode])
  {
    unint64_t v3 = [(DeviceRestoreChoiceController *)v8 choiceManager];
    [(BuddyTableChoiceManager *)v3 setFixedRowHeight:44.0];
  }
  else
  {
    unint64_t v3 = [(DeviceRestoreChoiceController *)v8 choiceManager];
    [(BuddyTableChoiceManager *)v3 setFixedRowHeight:52.0];
  }

  id v4 = [(DeviceRestoreChoiceController *)v8 choiceTable];
  [(UITableView *)v4 reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  SEL v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)DeviceRestoreChoiceController;
  [(DeviceRestoreChoiceController *)&v4 viewDidAppear:a3];
  [(DeviceRestoreChoiceController *)v7 flowItemDidAppear:v5];
  unint64_t v3 = [(DeviceRestoreChoiceController *)v7 animationController];
  [(OBAnimationController *)v3 startAnimation];
}

- (void)viewDidLoad
{
  v24 = self;
  SEL v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)DeviceRestoreChoiceController;
  [(DeviceRestoreChoiceController *)&v22 viewDidLoad];
  [(DeviceRestoreChoiceController *)v24 _populateRestoreChoices];
  v2 = [(DeviceRestoreChoiceController *)v24 choiceTable];
  [(UITableView *)v2 setTranslatesAutoresizingMaskIntoConstraints:0];

  unint64_t v3 = v24;
  objc_super v4 = [(DeviceRestoreChoiceController *)v24 choiceTable];
  [(DeviceRestoreChoiceController *)v3 setTableView:v4];

  BOOL v5 = [(DeviceRestoreChoiceController *)v24 choiceTable];
  [(UITableView *)v5 reloadData];

  SEL v6 = [(DeviceRestoreChoiceController *)v24 choiceTable];
  [(UITableView *)v6 layoutIfNeeded];

  SEL v7 = [(DeviceRestoreChoiceController *)v24 choiceTable];
  id v8 = [(UITableView *)v7 heightAnchor];
  unsigned __int8 v9 = [(DeviceRestoreChoiceController *)v24 choiceTable];
  [(UITableView *)v9 contentSize];
  location[1] = v10;
  id location[2] = v11;
  id v12 = [v8 constraintEqualToConstant:*(double *)&v11];
  [(DeviceRestoreChoiceController *)v24 setTableHeightAnchor:v12];

  id v13 = [(DeviceRestoreChoiceController *)v24 tableHeightAnchor];
  [(NSLayoutConstraint *)v13 setActive:1];

  id v14 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"Start" transitionDuration:0.01 transitionSpeed:1.0];
  v26[0] = v14;
  id v15 = [objc_alloc((Class)OBAnimationState) initWithStateName:@"Light" darkStateName:@"Dark" transitionDuration:1.0 transitionSpeed:1.0];
  v26[1] = v15;
  location[0] = +[NSArray arrayWithObjects:v26 count:2];

  os_log_type_t v20 = @"TransferAppsAndData";
  id v25 = 0;
  id v16 = +[UIDevice currentDevice];
  id v17 = [(UIDevice *)v16 userInterfaceIdiom];

  id v25 = v17;
  BOOL v18 = 1;
  if (v17 != (id)1) {
    BOOL v18 = v25 == (id)5;
  }
  if (v18) {
    objc_storeStrong((id *)&v20, @"TransferAppsandData-Pad");
  }
  id v19 = [(DeviceRestoreChoiceController *)v24 buddy_animationController:v20 animatedStates:location[0] startAtFirstState:1];
  [(DeviceRestoreChoiceController *)v24 setAnimationController:v19];

  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidLayoutSubviews
{
  id v13 = self;
  SEL v12 = a2;
  id v2 = [(DeviceRestoreChoiceController *)self tableView];
  [v2 reloadData];

  id v3 = [(DeviceRestoreChoiceController *)v13 view];
  [v3 layoutIfNeeded];

  id v4 = [(DeviceRestoreChoiceController *)v13 tableView];
  [v4 contentSize];
  uint64_t v10 = v5;
  double v11 = v6;
  double v7 = v6;
  id v8 = [(DeviceRestoreChoiceController *)v13 tableHeightAnchor];
  [(NSLayoutConstraint *)v8 setConstant:v7];

  v9.receiver = v13;
  v9.super_class = (Class)DeviceRestoreChoiceController;
  [(DeviceRestoreChoiceController *)&v9 viewDidLayoutSubviews];
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8.receiver = v10;
  v8.super_class = (Class)DeviceRestoreChoiceController;
  [(DeviceRestoreChoiceController *)&v8 traitCollectionDidChange:location[0]];
  id v3 = [(DeviceRestoreChoiceController *)v10 choiceTable];
  [(UITableView *)v3 layoutIfNeeded];

  id v4 = [(DeviceRestoreChoiceController *)v10 choiceTable];
  [(UITableView *)v4 contentSize];
  double v6 = v5;
  double v7 = [(DeviceRestoreChoiceController *)v10 tableHeightAnchor];
  [(NSLayoutConstraint *)v7 setConstant:v6];

  objc_storeStrong(location, 0);
}

- (void)selectChoiceForIdentifier:(id)a3
{
  uint64_t v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(DeviceRestoreChoiceController *)v10 choiceMap];
  id v4 = [(NSMutableDictionary *)v3 objectForKey:location[0]];

  if (v4)
  {
    double v5 = v10;
    double v6 = [(DeviceRestoreChoiceController *)v10 choiceMap];
    id v7 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:location[0]];
    [(DeviceRestoreChoiceController *)v5 didSelectChoice:v7];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100051470((uint64_t)buf, (uint64_t)v10, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%@ cannot finish with controller identifier choice %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_migrateFromiOSSelected
{
  double v11 = self;
  v10[1] = (id)a2;
  id v2 = [(DeviceRestoreChoiceController *)self view];
  id v3 = [v2 window];
  [v3 setUserInteractionEnabled:0];

  +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v11 identifier:@"com.apple.buddy.migrateFromiOSChoice.spinner"];
  id v4 = +[BuddyAccountTools sharedBuddyAccountTools];
  double v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  objc_super v8 = sub_1000E18A0;
  objc_super v9 = &unk_1002B15C8;
  v10[0] = v11;
  [v4 removeAccountsCreatedByProximityWithCompletion:&v5];

  objc_storeStrong(v10, 0);
}

- (BOOL)_useCompactMode
{
  id v2 = [(DeviceRestoreChoiceController *)self view];
  [v2 bounds];
  BOOL v4 = v3 < 760.0;

  return v4;
}

- (void)flowItemDidAppear:(BOOL)a3
{
  double v3 = [(DeviceRestoreChoiceController *)self buddyPreferences];
  [(BYPreferencesController *)v3 setObject:&__kCFBooleanFalse forKey:@"RestoreChoice"];
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  SEL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  double v5 = [(DeviceRestoreChoiceController *)v12 choiceManager];
  id v6 = [(BuddyTableChoiceManager *)v5 tableViewDelegate];
  [v6 tableView:location[0] estimatedHeightForRowAtIndexPath:v10];
  double v8 = v7;

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  SEL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  double v5 = [(DeviceRestoreChoiceController *)v12 choiceManager];
  id v6 = [(BuddyTableChoiceManager *)v5 tableViewDelegate];
  [v6 tableView:location[0] heightForRowAtIndexPath:v10];
  double v8 = v7;

  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_super v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  double v5 = [(DeviceRestoreChoiceController *)v9 choiceManager];
  id v6 = [(BuddyTableChoiceManager *)v5 tableViewDelegate];
  [v6 tableView:location[0] didSelectRowAtIndexPath:v7];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(DeviceRestoreChoiceController *)v6 _useCompactMode]) {
    double v7 = 10.0;
  }
  else {
    double v7 = UITableViewAutomaticDimension;
  }
  objc_storeStrong(location, 0);
  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 0;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(DeviceRestoreChoiceController *)v6 _useCompactMode]) {
    double v7 = 0.0;
  }
  else {
    double v7 = UITableViewAutomaticDimension;
  }
  objc_storeStrong(location, 0);
  return v7;
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BuddySuspendTask)suspendTask
{
  return self->_suspendTask;
}

- (void)setSuspendTask:(id)a3
{
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  return self->_enrollmentCoordinator;
}

- (void)setEnrollmentCoordinator:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
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

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return self->_flowItemDispositionProvider;
}

- (void)setFlowItemDispositionProvider:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (BuddyChoice)cloudRestoreChoice
{
  return self->_cloudRestoreChoice;
}

- (void)setCloudRestoreChoice:(id)a3
{
}

- (BuddyChoice)iTunesRestoreChoice
{
  return self->_iTunesRestoreChoice;
}

- (void)setITunesRestoreChoice:(id)a3
{
}

- (BuddyChoice)setUpAsNewChoice
{
  return self->_setUpAsNewChoice;
}

- (void)setSetUpAsNewChoice:(id)a3
{
}

- (BuddyChoice)migrateFromAndroidChoice
{
  return self->_migrateFromAndroidChoice;
}

- (void)setMigrateFromAndroidChoice:(id)a3
{
}

- (BuddyChoice)migrateFromiOSChoice
{
  return self->_migrateFromiOSChoice;
}

- (void)setMigrateFromiOSChoice:(id)a3
{
}

- (BuddyTableChoiceManager)choiceManager
{
  return self->_choiceManager;
}

- (void)setChoiceManager:(id)a3
{
}

- (NSLayoutConstraint)tableHeightAnchor
{
  return self->_tableHeightAnchor;
}

- (void)setTableHeightAnchor:(id)a3
{
}

- (UITableView)choiceTable
{
  return self->_choiceTable;
}

- (void)setChoiceTable:(id)a3
{
}

- (NSMutableDictionary)choiceMap
{
  return self->_choiceMap;
}

- (void)setChoiceMap:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end