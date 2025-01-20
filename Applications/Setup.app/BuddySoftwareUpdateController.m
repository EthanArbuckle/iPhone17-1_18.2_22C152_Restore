@interface BuddySoftwareUpdateController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)allowUserToInstallTonight;
- (BOOL)allowUserToSkip;
- (BOOL)scannedForUpdate;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BuddySoftwareUpdateController)init;
- (BuddySoftwareUpdateControllerDelegate)softwareUpdateDelegate;
- (SUDescriptor)update;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)createBoldButtonWithTitle:(id)a3 action:(SEL)a4;
- (id)createLinkButtonWithTitle:(id)a3 action:(SEL)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_allButtonsSetEnabled:(BOOL)a3;
- (void)_cancelDevicePasscodePicker:(id)a3;
- (void)_installFailedWithError:(id)a3;
- (void)beginDownloadingUpdate;
- (void)dealloc;
- (void)detailedReleaseNotesDonePressed;
- (void)didBecomeActive:(id)a3;
- (void)downloadAndInstallPressed;
- (void)downloadAndInstallTonightPressed;
- (void)installNowPressed;
- (void)installTonightPressed;
- (void)manager:(id)a3 didTransitionToState:(int)a4 fromState:(int)a5;
- (void)manager:(id)a3 downloadFinished:(id)a4;
- (void)manager:(id)a3 downloadProgressChanged:(id)a4 displayStyle:(int)a5;
- (void)manager:(id)a3 installFailedWithError:(id)a4;
- (void)manager:(id)a3 installStartedForUpdate:(id)a4;
- (void)manager:(id)a3 promptForDevicePasscodeWithDescriptorCompletion:(id)a4;
- (void)passcodeEntryController:(id)a3 didEnterPasscode:(id)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)resetButtonState:(id)a3 andEventHandlers:(BOOL)a4;
- (void)resumePressed;
- (void)scanForUpdateCompletion:(id)a3;
- (void)setAllowUserToInstallTonight:(BOOL)a3;
- (void)setAllowUserToSkip:(BOOL)a3;
- (void)setButtonTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setScannedForUpdate:(BOOL)a3;
- (void)setSoftwareUpdateDelegate:(id)a3;
- (void)setUpdate:(id)a3;
- (void)showErrorWithContent:(id)a3;
- (void)skipPressed;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddySoftwareUpdateController

- (BuddySoftwareUpdateController)init
{
  SEL v17 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"SOFTWARE_UPDATE" value:&stru_1002B4E18 table:@"SoftwareUpdate"];
  id location = 0;
  v16.receiver = self;
  v16.super_class = (Class)BuddySoftwareUpdateController;
  v5 = [(BuddySoftwareUpdateController *)&v16 initWithTitle:v4 detailText:0 icon:0 adoptTableViewScrollView:1];
  id location = v5;
  objc_storeStrong(&location, v5);

  if (v5)
  {
    id v6 = objc_alloc((Class)sub_100159DCC());
    id v7 = [v6 initWithDelegate:location hostController:location];
    v8 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v7;

    v9 = (void *)*((void *)location + 1);
    id v10 = +[RUIStyle setupAssistantModalStyle];
    [v9 setServerFlowStyle:v10];

    id v11 = [objc_alloc((Class)sub_100159EE4()) initWithStyle:3 reuseIdentifier:0 specifier:0];
    v12 = (void *)*((void *)location + 2);
    *((void *)location + 2) = v11;

    [*((id *)location + 2) setSeparatorInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
    v13 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v13 addObserver:location selector:"didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];
  }
  v14 = (BuddySoftwareUpdateController *)location;
  objc_storeStrong(&location, 0);
  return v14;
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)BuddySoftwareUpdateController;
  [(BuddySoftwareUpdateController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v53 = self;
  SEL v52 = a2;
  v51.receiver = self;
  v51.super_class = (Class)BuddySoftwareUpdateController;
  [(BuddySoftwareUpdateController *)&v51 viewDidLoad];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [(SUSUISoftwareUpdateManager *)v53->_manager preferredUpdate];
    char v48 = 0;
    char v46 = 0;
    if (v2)
    {
      id v49 = [(SUSUISoftwareUpdateManager *)v53->_manager preferredUpdate];
      char v48 = 1;
      CFStringRef v3 = (const __CFString *)[v49 humanReadableUpdateName];
      v47 = (__CFString *)v3;
      char v46 = 1;
    }
    else
    {
      CFStringRef v3 = @"N/A";
    }
    id v4 = [(SUSUISoftwareUpdateManager *)v53->_manager preferredUpdate];
    id v5 = [(SUSUISoftwareUpdateManager *)v53->_manager preferredUpdateError];
    id v6 = [(SUSUISoftwareUpdateManager *)v53->_manager alternateUpdate];
    char v44 = 0;
    char v42 = 0;
    if (v6)
    {
      id v45 = [(SUSUISoftwareUpdateManager *)v53->_manager alternateUpdate];
      char v44 = 1;
      CFStringRef v7 = (const __CFString *)[v45 humanReadableUpdateName];
      v43 = (__CFString *)v7;
      char v42 = 1;
    }
    else
    {
      CFStringRef v7 = @"N/A";
    }
    id v8 = [(SUSUISoftwareUpdateManager *)v53->_manager alternateUpdate];
    id v9 = [(SUSUISoftwareUpdateManager *)v53->_manager alternateUpdateError];
    if ([(SUSUISoftwareUpdateManager *)v53->_manager isDelayingUpdates]) {
      id v10 = "YES";
    }
    else {
      id v10 = "NO";
    }
    unsigned __int8 v11 = [(SUSUISoftwareUpdateManager *)v53->_manager automaticUpdateScheduled];
    v12 = "YES";
    if ((v11 & 1) == 0) {
      v12 = "NO";
    }
    sub_10015A8B8((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController viewDidLoad]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if (v42) {
    if (v44)
    }

    if (v46) {
    if (v48)
    }
  }
  objc_storeStrong((id *)&oslog, 0);
  id v13 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(BuddySoftwareUpdateController *)v53 setTableView:v13];

  v14 = v53;
  id v15 = [(BuddySoftwareUpdateController *)v53 tableView];
  [v15 setDelegate:v14];

  objc_super v16 = v53;
  id v17 = [(BuddySoftwareUpdateController *)v53 tableView];
  [v17 setDataSource:v16];

  id v18 = [(BuddySoftwareUpdateController *)v53 tableView];
  [v18 setRowHeight:UITableViewAutomaticDimension];

  id v19 = [(BuddySoftwareUpdateController *)v53 tableView];
  [v19 setEstimatedRowHeight:0.0];

  id v20 = [(BuddySoftwareUpdateController *)v53 tableView];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v21 = [(BuddySoftwareUpdateController *)v53 tableView];
  [v21 setAlwaysBounceVertical:0];

  v22 = (SUSSoftwareUpdateTitleCell *)[objc_alloc((Class)sub_100159EE4()) initWithStyle:3 reuseIdentifier:0 specifier:0];
  titleCell = v53->_titleCell;
  v53->_titleCell = v22;

  -[SUSSoftwareUpdateTitleCell setSeparatorInset:](v53->_titleCell, "setSeparatorInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v24 = v53;
  v25 = +[NSBundle mainBundle];
  v26 = [(NSBundle *)v25 localizedStringForKey:@"DOWNLOAD_AND_INSTALL" value:&stru_1002B4E18 table:@"SoftwareUpdate"];
  v27 = (OBBoldTrayButton *)[(BuddySoftwareUpdateController *)v24 createBoldButtonWithTitle:v26 action:"beginDownloadingUpdate"];
  updateNowButton = v53->_updateNowButton;
  v53->_updateNowButton = v27;

  id v29 = [(BuddySoftwareUpdateController *)v53 buttonTray];
  [v29 addButton:v53->_updateNowButton];

  if ([(BuddySoftwareUpdateController *)v53 allowUserToInstallTonight])
  {
    v30 = v53;
    v31 = +[NSBundle mainBundle];
    v32 = [(NSBundle *)v31 localizedStringForKey:@"INSTALL_TONIGHT" value:&stru_1002B4E18 table:@"SoftwareUpdate"];
    v33 = (OBLinkTrayButton *)[(BuddySoftwareUpdateController *)v30 createLinkButtonWithTitle:v32 action:"installTonightPressed"];
    updateTonightButton = v53->_updateTonightButton;
    v53->_updateTonightButton = v33;

    id v35 = [(BuddySoftwareUpdateController *)v53 buttonTray];
    [v35 addButton:v53->_updateTonightButton];
  }
  if ([(BuddySoftwareUpdateController *)v53 allowUserToSkip])
  {
    v36 = v53;
    v37 = +[NSBundle mainBundle];
    v38 = [(NSBundle *)v37 localizedStringForKey:@"SKIP" value:&stru_1002B4E18 table:@"SoftwareUpdate"];
    v39 = (OBLinkTrayButton *)[(BuddySoftwareUpdateController *)v36 createLinkButtonWithTitle:v38 action:"skipPressed"];
    skipButton = v53->_skipButton;
    v53->_skipButton = v39;

    id v41 = [(BuddySoftwareUpdateController *)v53 buttonTray];
    [v41 addButton:v53->_skipButton];
  }
}

- (void)scanForUpdateCompletion:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_initWeak(&from, v14);
  manager = v14->_manager;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  CFStringRef v7 = sub_10015AA58;
  id v8 = &unk_1002B3B90;
  objc_copyWeak(&v11, &from);
  id v9 = v14;
  id v10 = location[0];
  [(SUSUISoftwareUpdateManager *)manager scanForUpdatesCompletion:&v4];
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_storeStrong(location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BuddySoftwareUpdateController;
  [(BuddySoftwareUpdateController *)&v7 viewWillAppear:a3];
  id v3 = [(BuddySoftwareUpdateController *)v10 tableView];
  [v3 reloadData];

  if ([(BuddySoftwareUpdateController *)v10 isMovingToParentViewController])
  {
    id v4 = v10;
    manager = v10->_manager;
    id v6 = [(SUSUISoftwareUpdateManager *)manager state];
    [(BuddySoftwareUpdateController *)v4 manager:manager didTransitionToState:v6 fromState:[(SUSUISoftwareUpdateManager *)v10->_manager state]];
    [(SUSUISoftwareUpdateManager *)v10->_manager refreshState];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  id v29 = self;
  SEL v28 = a2;
  BOOL v27 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BuddySoftwareUpdateController;
  [(BuddySoftwareUpdateController *)&v26 viewDidAppear:a3];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(SUSUISoftwareUpdateManager *)v29->_manager preferredUpdate];
    char v23 = 0;
    char v21 = 0;
    if (v3)
    {
      id v24 = [(SUSUISoftwareUpdateManager *)v29->_manager preferredUpdate];
      char v23 = 1;
      CFStringRef v4 = (const __CFString *)[v24 humanReadableUpdateName];
      v22 = (__CFString *)v4;
      char v21 = 1;
    }
    else
    {
      CFStringRef v4 = @"N/A";
    }
    id v5 = [(SUSUISoftwareUpdateManager *)v29->_manager preferredUpdate];
    id v6 = [(SUSUISoftwareUpdateManager *)v29->_manager preferredUpdateError];
    id v7 = [(SUSUISoftwareUpdateManager *)v29->_manager alternateUpdate];
    char v19 = 0;
    char v17 = 0;
    if (v7)
    {
      id v20 = [(SUSUISoftwareUpdateManager *)v29->_manager alternateUpdate];
      char v19 = 1;
      CFStringRef v8 = (const __CFString *)[v20 humanReadableUpdateName];
      id v18 = (__CFString *)v8;
      char v17 = 1;
    }
    else
    {
      CFStringRef v8 = @"N/A";
    }
    id v9 = [(SUSUISoftwareUpdateManager *)v29->_manager alternateUpdate];
    id v10 = [(SUSUISoftwareUpdateManager *)v29->_manager alternateUpdateError];
    if ([(SUSUISoftwareUpdateManager *)v29->_manager isDelayingUpdates]) {
      id v11 = "YES";
    }
    else {
      id v11 = "NO";
    }
    unsigned __int8 v12 = [(SUSUISoftwareUpdateManager *)v29->_manager automaticUpdateScheduled];
    id v13 = "YES";
    if ((v12 & 1) == 0) {
      id v13 = "NO";
    }
    sub_10015A8B8((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController viewDidAppear:]", (uint64_t)v4, (uint64_t)v5, (uint64_t)v6, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v13);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if (v17) {
    if (v19)
    }

    if (v21) {
    if (v23)
    }
  }
  objc_storeStrong((id *)&oslog, 0);
  [(SUSSoftwareUpdateTitleCell *)v29->_titleCell setAnimatingGearView:[(SUSUISoftwareUpdateManager *)v29->_manager state] == 12];
  id v14 = [(BuddySoftwareUpdateController *)v29 tableView];
  id v15 = [(BuddySoftwareUpdateController *)v29 tableView];
  id v16 = [v15 indexPathForSelectedRow];
  [v14 deselectRowAtIndexPath:v16 animated:1];
}

- (void)didBecomeActive:(id)a3
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateManager *)v24->_manager refreshState];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(SUSUISoftwareUpdateManager *)v24->_manager preferredUpdate];
    char v20 = 0;
    char v18 = 0;
    if (v3)
    {
      id v21 = [(SUSUISoftwareUpdateManager *)v24->_manager preferredUpdate];
      char v20 = 1;
      CFStringRef v4 = (const __CFString *)[v21 humanReadableUpdateName];
      char v19 = (__CFString *)v4;
      char v18 = 1;
    }
    else
    {
      CFStringRef v4 = @"N/A";
    }
    id v5 = [(SUSUISoftwareUpdateManager *)v24->_manager preferredUpdate];
    id v6 = [(SUSUISoftwareUpdateManager *)v24->_manager preferredUpdateError];
    id v7 = [(SUSUISoftwareUpdateManager *)v24->_manager alternateUpdate];
    char v16 = 0;
    char v14 = 0;
    if (v7)
    {
      id v17 = [(SUSUISoftwareUpdateManager *)v24->_manager alternateUpdate];
      char v16 = 1;
      CFStringRef v8 = (const __CFString *)[v17 humanReadableUpdateName];
      id v15 = (__CFString *)v8;
      char v14 = 1;
    }
    else
    {
      CFStringRef v8 = @"N/A";
    }
    id v9 = [(SUSUISoftwareUpdateManager *)v24->_manager alternateUpdate];
    id v10 = [(SUSUISoftwareUpdateManager *)v24->_manager alternateUpdateError];
    if ([(SUSUISoftwareUpdateManager *)v24->_manager isDelayingUpdates]) {
      id v11 = "YES";
    }
    else {
      id v11 = "NO";
    }
    unsigned __int8 v12 = [(SUSUISoftwareUpdateManager *)v24->_manager automaticUpdateScheduled];
    id v13 = "YES";
    if ((v12 & 1) == 0) {
      id v13 = "NO";
    }
    sub_10015B9E4((uint64_t)buf, (uint64_t)v4, (uint64_t)v5, (uint64_t)v6, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v13, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\nNotification: %@", buf, 0x66u);

    if (v14) {
    if (v16)
    }

    if (v18) {
    if (v20)
    }
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_storeStrong(location, 0);
}

- (void)beginDownloadingUpdate
{
  id val = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*((id *)val + 1) preferredUpdate];
    char v32 = 0;
    char v30 = 0;
    if (v2)
    {
      id v33 = [*((id *)val + 1) preferredUpdate];
      char v32 = 1;
      CFStringRef v3 = (const __CFString *)[v33 humanReadableUpdateName];
      v31 = (__CFString *)v3;
      char v30 = 1;
    }
    else
    {
      CFStringRef v3 = @"N/A";
    }
    id v4 = [*((id *)val + 1) preferredUpdate];
    id v5 = [*((id *)val + 1) preferredUpdateError];
    id v6 = [*((id *)val + 1) alternateUpdate];
    char v28 = 0;
    char v26 = 0;
    if (v6)
    {
      id v7 = v6;
      id v29 = [*((id *)val + 1) alternateUpdate];
      char v28 = 1;
      CFStringRef v8 = (const __CFString *)[v29 humanReadableUpdateName];
      BOOL v27 = (__CFString *)v8;
      char v26 = 1;
    }
    else
    {
      id v7 = 0;
      CFStringRef v8 = @"N/A";
    }
    id v9 = [*((id *)val + 1) alternateUpdate];
    id v10 = [*((id *)val + 1) alternateUpdateError];
    unsigned __int8 v11 = [*((id *)val + 1) isDelayingUpdates];
    unsigned __int8 v12 = "NO";
    if (v11) {
      unsigned __int8 v12 = "YES";
    }
    uint64_t v17 = (uint64_t)v12;
    unsigned __int8 v13 = [*((id *)val + 1) automaticUpdateScheduled];
    char v14 = "NO";
    if (v13) {
      char v14 = "YES";
    }
    sub_10015A8B8((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController beginDownloadingUpdate]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, v17, (uint64_t)v14);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], v34, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if (v26) {
    if (v28)
    }

    if (v30) {
    if (v32)
    }
  }
  objc_storeStrong((id *)oslog, 0);
  [*((id *)val + 3) showsBusyIndicator];
  [val _allButtonsSetEnabled:0];
  objc_initWeak(&location, val);
  id v15 = (void *)*((void *)val + 1);
  id v16 = [val update];
  char v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  id v21 = sub_10015BFB8;
  v22 = &unk_1002B3150;
  objc_copyWeak(v24, &location);
  id v23 = val;
  [v15 startDownloadAndInstall:1 update:v16 withHandler:&v18];

  objc_storeStrong(&v23, 0);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
}

- (void)downloadAndInstallPressed
{
  v22 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [(SUSUISoftwareUpdateManager *)v22->_manager preferredUpdate];
    char v19 = 0;
    char v17 = 0;
    if (v2)
    {
      id v20 = [(SUSUISoftwareUpdateManager *)v22->_manager preferredUpdate];
      char v19 = 1;
      CFStringRef v3 = (const __CFString *)[v20 humanReadableUpdateName];
      char v18 = (__CFString *)v3;
      char v17 = 1;
    }
    else
    {
      CFStringRef v3 = @"N/A";
    }
    id v4 = [(SUSUISoftwareUpdateManager *)v22->_manager preferredUpdate];
    id v5 = [(SUSUISoftwareUpdateManager *)v22->_manager preferredUpdateError];
    id v6 = [(SUSUISoftwareUpdateManager *)v22->_manager alternateUpdate];
    char v15 = 0;
    char v13 = 0;
    if (v6)
    {
      id v16 = [(SUSUISoftwareUpdateManager *)v22->_manager alternateUpdate];
      char v15 = 1;
      CFStringRef v7 = (const __CFString *)[v16 humanReadableUpdateName];
      char v14 = (__CFString *)v7;
      char v13 = 1;
    }
    else
    {
      CFStringRef v7 = @"N/A";
    }
    id v8 = [(SUSUISoftwareUpdateManager *)v22->_manager alternateUpdate];
    id v9 = [(SUSUISoftwareUpdateManager *)v22->_manager alternateUpdateError];
    if ([(SUSUISoftwareUpdateManager *)v22->_manager isDelayingUpdates]) {
      id v10 = "YES";
    }
    else {
      id v10 = "NO";
    }
    unsigned __int8 v11 = [(SUSUISoftwareUpdateManager *)v22->_manager automaticUpdateScheduled];
    unsigned __int8 v12 = "YES";
    if ((v11 & 1) == 0) {
      unsigned __int8 v12 = "NO";
    }
    sub_10015A8B8((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController downloadAndInstallPressed]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if (v13) {
    if (v15)
    }

    if (v17) {
    if (v19)
    }
  }
  objc_storeStrong((id *)oslog, 0);
  v22->_userChoice = 1;
  [(BuddySoftwareUpdateController *)v22 beginDownloadingUpdate];
}

- (void)installTonightPressed
{
  id v35 = self;
  location[1] = (os_log_t)a2;
  location[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(location[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [(SUSUISoftwareUpdateManager *)v35->_manager preferredUpdate];
    char v31 = 0;
    char v29 = 0;
    if (v2)
    {
      id v32 = [(SUSUISoftwareUpdateManager *)v35->_manager preferredUpdate];
      char v31 = 1;
      CFStringRef v3 = (const __CFString *)[v32 humanReadableUpdateName];
      char v30 = (__CFString *)v3;
      char v29 = 1;
    }
    else
    {
      CFStringRef v3 = @"N/A";
    }
    id v4 = [(SUSUISoftwareUpdateManager *)v35->_manager preferredUpdate];
    id v5 = [(SUSUISoftwareUpdateManager *)v35->_manager preferredUpdateError];
    id v6 = [(SUSUISoftwareUpdateManager *)v35->_manager alternateUpdate];
    char v27 = 0;
    char v25 = 0;
    if (v6)
    {
      id v28 = [(SUSUISoftwareUpdateManager *)v35->_manager alternateUpdate];
      char v27 = 1;
      CFStringRef v7 = (const __CFString *)[v28 humanReadableUpdateName];
      char v26 = (__CFString *)v7;
      char v25 = 1;
    }
    else
    {
      CFStringRef v7 = @"N/A";
    }
    id v8 = [(SUSUISoftwareUpdateManager *)v35->_manager alternateUpdate];
    id v17 = [(SUSUISoftwareUpdateManager *)v35->_manager alternateUpdateError];
    unsigned __int8 v9 = [(SUSUISoftwareUpdateManager *)v35->_manager isDelayingUpdates];
    id v10 = "NO";
    if (v9) {
      id v10 = "YES";
    }
    uint64_t v16 = (uint64_t)v10;
    unsigned __int8 v11 = [(SUSUISoftwareUpdateManager *)v35->_manager automaticUpdateScheduled];
    unsigned __int8 v12 = "NO";
    if (v11) {
      unsigned __int8 v12 = "YES";
    }
    sub_10015A8B8((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController installTonightPressed]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v17, v16, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, location[0], v33, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if (v25) {
    if (v27)
    }

    if (v29) {
    if (v31)
    }
  }
  objc_storeStrong((id *)location, 0);
  v35->_userChoice = 2;
  [(OBBoldTrayButton *)v35->_updateNowButton showsBusyIndicator];
  [(BuddySoftwareUpdateController *)v35 _allButtonsSetEnabled:0];
  id v13 = [(BuddySoftwareUpdateController *)v35 navigationItem];
  [v13 setHidesBackButton:1];

  id v14 = [(BuddySoftwareUpdateController *)v35 view];
  [v14 setUserInteractionEnabled:0];

  objc_initWeak(&from, v35);
  manager = v35->_manager;
  char v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  id v21 = sub_10015CE14;
  v22 = &unk_1002B3BB8;
  objc_copyWeak(&v23, &from);
  [(SUSUISoftwareUpdateManager *)manager setAutoInstall:&v18];
  objc_destroyWeak(&v23);
  objc_destroyWeak(&from);
}

- (void)skipPressed
{
  id v23 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [(SUSUISoftwareUpdateManager *)v23->_manager preferredUpdate];
    char v20 = 0;
    char v18 = 0;
    if (v2)
    {
      id v21 = [(SUSUISoftwareUpdateManager *)v23->_manager preferredUpdate];
      char v20 = 1;
      CFStringRef v3 = (const __CFString *)[v21 humanReadableUpdateName];
      int v19 = (__CFString *)v3;
      char v18 = 1;
    }
    else
    {
      CFStringRef v3 = @"N/A";
    }
    id v4 = [(SUSUISoftwareUpdateManager *)v23->_manager preferredUpdate];
    id v5 = [(SUSUISoftwareUpdateManager *)v23->_manager preferredUpdateError];
    id v6 = [(SUSUISoftwareUpdateManager *)v23->_manager alternateUpdate];
    char v16 = 0;
    char v14 = 0;
    if (v6)
    {
      id v17 = [(SUSUISoftwareUpdateManager *)v23->_manager alternateUpdate];
      char v16 = 1;
      CFStringRef v7 = (const __CFString *)[v17 humanReadableUpdateName];
      char v15 = (__CFString *)v7;
      char v14 = 1;
    }
    else
    {
      CFStringRef v7 = @"N/A";
    }
    id v8 = [(SUSUISoftwareUpdateManager *)v23->_manager alternateUpdate];
    id v9 = [(SUSUISoftwareUpdateManager *)v23->_manager alternateUpdateError];
    if ([(SUSUISoftwareUpdateManager *)v23->_manager isDelayingUpdates]) {
      id v10 = "YES";
    }
    else {
      id v10 = "NO";
    }
    unsigned __int8 v11 = [(SUSUISoftwareUpdateManager *)v23->_manager automaticUpdateScheduled];
    unsigned __int8 v12 = "YES";
    if ((v11 & 1) == 0) {
      unsigned __int8 v12 = "NO";
    }
    sub_10015A8B8((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController skipPressed]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if (v14) {
    if (v16)
    }

    if (v18) {
    if (v20)
    }
  }
  objc_storeStrong((id *)oslog, 0);
  id v13 = [(BuddySoftwareUpdateController *)v23 delegate];
  [(BFFFlowItemDelegate *)v13 flowItemDone:v23];
}

- (void)installNowPressed
{
  id v37 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [*((id *)v37 + 1) preferredUpdate];
    char v33 = 0;
    char v31 = 0;
    if (v2)
    {
      id v34 = [*((id *)v37 + 1) preferredUpdate];
      char v33 = 1;
      CFStringRef v3 = (__CFString *)[v34 humanReadableUpdateName];
      id v32 = v3;
      char v31 = 1;
    }
    else
    {
      CFStringRef v3 = @"N/A";
    }
    id v4 = [*((id *)v37 + 1) preferredUpdate];
    id v5 = [*((id *)v37 + 1) preferredUpdateError];
    id v6 = [*((id *)v37 + 1) alternateUpdate];
    char v29 = 0;
    char v27 = 0;
    if (v6)
    {
      id v30 = [*((id *)v37 + 1) alternateUpdate];
      char v29 = 1;
      CFStringRef v7 = (__CFString *)[v30 humanReadableUpdateName];
      id v28 = v7;
      char v27 = 1;
    }
    else
    {
      CFStringRef v7 = @"N/A";
    }
    id v8 = [*((id *)v37 + 1) alternateUpdate];
    id v9 = [*((id *)v37 + 1) alternateUpdateError];
    if ([*((id *)v37 + 1) isDelayingUpdates]) {
      id v10 = "YES";
    }
    else {
      id v10 = "NO";
    }
    unsigned __int8 v11 = [*((id *)v37 + 1) automaticUpdateScheduled];
    unsigned __int8 v12 = "YES";
    if ((v11 & 1) == 0) {
      unsigned __int8 v12 = "NO";
    }
    sub_10015A8B8((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController installNowPressed]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], v35, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if (v27) {
    if (v29)
    }

    if (v31) {
    if (v33)
    }
  }
  objc_storeStrong((id *)oslog, 0);
  *((void *)v37 + 7) = 1;
  [*((id *)v37 + 3) showsBusyIndicator];
  [v37 _allButtonsSetEnabled:0];
  id v13 = [v37 navigationItem];
  [v13 setHidesBackButton:1];

  id v14 = [v37 view];
  [v14 setUserInteractionEnabled:0];

  id v15 = [v37 passcodeCacheManager];
  [v15 persistPasscodeStash];

  char v20 = _NSConcreteStackBlock;
  int v21 = -1073741824;
  int v22 = 0;
  id v23 = sub_10015DC2C;
  id v24 = &unk_1002B0D20;
  id v25 = v37;
  id location = objc_retainBlock(&v20);
  id v16 = [v37 softwareUpdateDelegate];

  if (v16)
  {
    id v17 = [v37 softwareUpdateDelegate];
    id v18 = v37;
    id v19 = [v37 update];
    [v17 softwareUpdateController:v18 prepareToInstallUpdate:v19 completion:location];
  }
  else
  {
    (*((void (**)(void))location + 2))();
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v25, 0);
}

- (void)resumePressed
{
  int v22 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [(SUSUISoftwareUpdateManager *)v22->_manager preferredUpdate];
    char v19 = 0;
    char v17 = 0;
    if (v2)
    {
      id v20 = [(SUSUISoftwareUpdateManager *)v22->_manager preferredUpdate];
      char v19 = 1;
      CFStringRef v3 = (const __CFString *)[v20 humanReadableUpdateName];
      id v18 = (__CFString *)v3;
      char v17 = 1;
    }
    else
    {
      CFStringRef v3 = @"N/A";
    }
    id v4 = [(SUSUISoftwareUpdateManager *)v22->_manager preferredUpdate];
    id v5 = [(SUSUISoftwareUpdateManager *)v22->_manager preferredUpdateError];
    id v6 = [(SUSUISoftwareUpdateManager *)v22->_manager alternateUpdate];
    char v15 = 0;
    char v13 = 0;
    if (v6)
    {
      id v16 = [(SUSUISoftwareUpdateManager *)v22->_manager alternateUpdate];
      char v15 = 1;
      CFStringRef v7 = (const __CFString *)[v16 humanReadableUpdateName];
      id v14 = (__CFString *)v7;
      char v13 = 1;
    }
    else
    {
      CFStringRef v7 = @"N/A";
    }
    id v8 = [(SUSUISoftwareUpdateManager *)v22->_manager alternateUpdate];
    id v9 = [(SUSUISoftwareUpdateManager *)v22->_manager alternateUpdateError];
    if ([(SUSUISoftwareUpdateManager *)v22->_manager isDelayingUpdates]) {
      id v10 = "YES";
    }
    else {
      id v10 = "NO";
    }
    unsigned __int8 v11 = [(SUSUISoftwareUpdateManager *)v22->_manager automaticUpdateScheduled];
    unsigned __int8 v12 = "YES";
    if ((v11 & 1) == 0) {
      unsigned __int8 v12 = "NO";
    }
    sub_10015A8B8((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController resumePressed]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if (v13) {
    if (v15)
    }

    if (v17) {
    if (v19)
    }
  }
  objc_storeStrong((id *)oslog, 0);
  [(SUSUISoftwareUpdateManager *)v22->_manager resumeDownload];
}

- (void)downloadAndInstallTonightPressed
{
  int v22 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = [(SUSUISoftwareUpdateManager *)v22->_manager preferredUpdate];
    char v19 = 0;
    char v17 = 0;
    if (v2)
    {
      id v20 = [(SUSUISoftwareUpdateManager *)v22->_manager preferredUpdate];
      char v19 = 1;
      CFStringRef v3 = (const __CFString *)[v20 humanReadableUpdateName];
      id v18 = (__CFString *)v3;
      char v17 = 1;
    }
    else
    {
      CFStringRef v3 = @"N/A";
    }
    id v4 = [(SUSUISoftwareUpdateManager *)v22->_manager preferredUpdate];
    id v5 = [(SUSUISoftwareUpdateManager *)v22->_manager preferredUpdateError];
    id v6 = [(SUSUISoftwareUpdateManager *)v22->_manager alternateUpdate];
    char v15 = 0;
    char v13 = 0;
    if (v6)
    {
      id v16 = [(SUSUISoftwareUpdateManager *)v22->_manager alternateUpdate];
      char v15 = 1;
      CFStringRef v7 = (const __CFString *)[v16 humanReadableUpdateName];
      id v14 = (__CFString *)v7;
      char v13 = 1;
    }
    else
    {
      CFStringRef v7 = @"N/A";
    }
    id v8 = [(SUSUISoftwareUpdateManager *)v22->_manager alternateUpdate];
    id v9 = [(SUSUISoftwareUpdateManager *)v22->_manager alternateUpdateError];
    if ([(SUSUISoftwareUpdateManager *)v22->_manager isDelayingUpdates]) {
      id v10 = "YES";
    }
    else {
      id v10 = "NO";
    }
    unsigned __int8 v11 = [(SUSUISoftwareUpdateManager *)v22->_manager automaticUpdateScheduled];
    unsigned __int8 v12 = "YES";
    if ((v11 & 1) == 0) {
      unsigned __int8 v12 = "NO";
    }
    sub_10015A8B8((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController downloadAndInstallTonightPressed]", (uint64_t)v3, (uint64_t)v4, (uint64_t)v5, (uint64_t)v7, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v12);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if (v13) {
    if (v15)
    }

    if (v17) {
    if (v19)
    }
  }
  objc_storeStrong((id *)oslog, 0);
  v22->_userChoice = 2;
  [(BuddySoftwareUpdateController *)v22 beginDownloadingUpdate];
}

- (void)_installFailedWithError:(id)a3
{
  os_log_type_t v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [(SUSUISoftwareUpdateManager *)v35->_manager preferredUpdate];
    char v30 = 0;
    char v28 = 0;
    if (v3)
    {
      id v31 = [(SUSUISoftwareUpdateManager *)v35->_manager preferredUpdate];
      char v30 = 1;
      id v4 = (__CFString *)[v31 humanReadableUpdateName];
      id v29 = v4;
      char v28 = 1;
    }
    else
    {
      id v4 = @"N/A";
    }
    id v5 = [(SUSUISoftwareUpdateManager *)v35->_manager preferredUpdate];
    id v6 = [(SUSUISoftwareUpdateManager *)v35->_manager preferredUpdateError];
    id v7 = [(SUSUISoftwareUpdateManager *)v35->_manager alternateUpdate];
    char v26 = 0;
    char v24 = 0;
    if (v7)
    {
      id v27 = [(SUSUISoftwareUpdateManager *)v35->_manager alternateUpdate];
      char v26 = 1;
      id v8 = (__CFString *)[v27 humanReadableUpdateName];
      id v25 = v8;
      char v24 = 1;
    }
    else
    {
      id v8 = @"N/A";
    }
    id v9 = [(SUSUISoftwareUpdateManager *)v35->_manager alternateUpdate];
    id v10 = [(SUSUISoftwareUpdateManager *)v35->_manager alternateUpdateError];
    if ([(SUSUISoftwareUpdateManager *)v35->_manager isDelayingUpdates]) {
      unsigned __int8 v11 = "YES";
    }
    else {
      unsigned __int8 v11 = "NO";
    }
    unsigned __int8 v12 = [(SUSUISoftwareUpdateManager *)v35->_manager automaticUpdateScheduled];
    char v13 = "YES";
    if ((v12 & 1) == 0) {
      char v13 = "NO";
    }
    sub_10015EB48((uint64_t)buf, (uint64_t)v4, (uint64_t)v5, (uint64_t)v6, (uint64_t)v8, (uint64_t)v9, (uint64_t)v10, (uint64_t)v11, (uint64_t)v13, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, oslog, v32, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\nError: %{public}@", buf, 0x66u);

    if (v24) {
    if (v26)
    }

    if (v28) {
    if (v30)
    }
  }
  objc_storeStrong((id *)&oslog, 0);
  id v14 = [location[0] domain];
  BOOL v15 = 0;
  if ([v14 isEqualToString:@"com.apple.softwareupdateservices.error"]) {
    BOOL v15 = [location[0] code] == (id)14;
  }

  if (v15)
  {
    os_log_t v23 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v23;
      os_log_type_t v17 = v22;
      sub_10004B24C(v21);
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Software Update install in progress. Ignore error...", v21, 2u);
    }
    objc_storeStrong((id *)&v23, 0);
  }
  else
  {
    id v18 = [(BuddySoftwareUpdateController *)v35 navigationItem];
    [v18 setHidesBackButton:0];

    id v19 = [(BuddySoftwareUpdateController *)v35 view];
    [v19 setUserInteractionEnabled:1];

    [(OBBoldTrayButton *)v35->_updateNowButton hidesBusyIndicator];
    [(BuddySoftwareUpdateController *)v35 _allButtonsSetEnabled:1];
    id v20 = [(BuddySoftwareUpdateController *)v35 softwareUpdateDelegate];
    [(BuddySoftwareUpdateControllerDelegate *)v20 softwareUpdateController:v35 didFailToInstallUpdateWithError:location[0]];
  }
  objc_storeStrong(location, 0);
}

- (void)detailedReleaseNotesDonePressed
{
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 28;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  unsigned __int8 v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (BYSetupAssistantHasCompletedInitialRun()) {
    (*((void (**)(id, void))location[0] + 2))(location[0], 0);
  }
  id v3 = v11;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_10015ED0C;
  id v8 = &unk_1002B3BE0;
  id v9 = location[0];
  [(BuddySoftwareUpdateController *)v3 scanForUpdateCompletion:&v4];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)passcodeEntryController:(id)a3 didEnterPasscode:(id)a4
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(SUSUISoftwareUpdateManager *)v31->_manager preferredUpdate];
    char v26 = 0;
    char v24 = 0;
    if (v5)
    {
      id v27 = [(SUSUISoftwareUpdateManager *)v31->_manager preferredUpdate];
      char v26 = 1;
      CFStringRef v6 = (const __CFString *)[v27 humanReadableUpdateName];
      id v25 = (__CFString *)v6;
      char v24 = 1;
    }
    else
    {
      CFStringRef v6 = @"N/A";
    }
    id v7 = [(SUSUISoftwareUpdateManager *)v31->_manager preferredUpdate];
    id v8 = [(SUSUISoftwareUpdateManager *)v31->_manager preferredUpdateError];
    id v9 = [(SUSUISoftwareUpdateManager *)v31->_manager alternateUpdate];
    char v22 = 0;
    char v20 = 0;
    if (v9)
    {
      id v23 = [(SUSUISoftwareUpdateManager *)v31->_manager alternateUpdate];
      char v22 = 1;
      CFStringRef v10 = (const __CFString *)[v23 humanReadableUpdateName];
      int v21 = (__CFString *)v10;
      char v20 = 1;
    }
    else
    {
      CFStringRef v10 = @"N/A";
    }
    id v11 = [(SUSUISoftwareUpdateManager *)v31->_manager alternateUpdate];
    id v12 = [(SUSUISoftwareUpdateManager *)v31->_manager alternateUpdateError];
    if ([(SUSUISoftwareUpdateManager *)v31->_manager isDelayingUpdates]) {
      char v13 = "YES";
    }
    else {
      char v13 = "NO";
    }
    unsigned __int8 v14 = [(SUSUISoftwareUpdateManager *)v31->_manager automaticUpdateScheduled];
    BOOL v15 = "YES";
    if ((v14 & 1) == 0) {
      BOOL v15 = "NO";
    }
    sub_10015A8B8((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController passcodeEntryController:didEnterPasscode:]", (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, (uint64_t)v15);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\n", buf, 0x5Cu);

    if (v20) {
    if (v22)
    }

    if (v24) {
    if (v26)
    }
  }
  objc_storeStrong((id *)&oslog, 0);
  if ([v29 length])
  {
    [(BuddySoftwareUpdateController *)v31 dismissViewControllerAnimated:1 completion:0];
    if (v31->_devicePasscodeCompletion)
    {
      devicePasscodeCompletion = (void (**)(id, id, SUDescriptor *))v31->_devicePasscodeCompletion;
      id v17 = v29;
      id v18 = [(BuddySoftwareUpdateController *)v31 update];
      devicePasscodeCompletion[2](devicePasscodeCompletion, v17, v18);

      id v19 = v31->_devicePasscodeCompletion;
      v31->_devicePasscodeCompletion = 0;
    }
  }
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)_cancelDevicePasscodePicker:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddySoftwareUpdateController *)v5 dismissViewControllerAnimated:1 completion:0];
  id devicePasscodeCompletion = v5->_devicePasscodeCompletion;
  v5->_id devicePasscodeCompletion = 0;

  [(BuddySoftwareUpdateController *)v5 _installFailedWithError:0];
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 promptForDevicePasscodeWithDescriptorCompletion:(id)a4
{
  id val = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v41 = 0;
  objc_storeStrong(&v41, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*((id *)val + 1) preferredUpdate];
    char v37 = 0;
    char v35 = 0;
    if (v5)
    {
      id v38 = [*((id *)val + 1) preferredUpdate];
      char v37 = 1;
      CFStringRef v6 = (__CFString *)[v38 humanReadableUpdateName];
      id v36 = v6;
      char v35 = 1;
    }
    else
    {
      CFStringRef v6 = @"N/A";
    }
    id v7 = [*((id *)val + 1) preferredUpdate];
    id v8 = [*((id *)val + 1) preferredUpdateError];
    id v9 = [*((id *)val + 1) alternateUpdate];
    char v33 = 0;
    char v31 = 0;
    if (v9)
    {
      id v34 = [*((id *)val + 1) alternateUpdate];
      char v33 = 1;
      CFStringRef v10 = (__CFString *)[v34 humanReadableUpdateName];
      id v32 = v10;
      char v31 = 1;
    }
    else
    {
      CFStringRef v10 = @"N/A";
    }
    id v11 = [*((id *)val + 1) alternateUpdate];
    id v12 = [*((id *)val + 1) alternateUpdateError];
    if ([*((id *)val + 1) isDelayingUpdates]) {
      char v13 = "YES";
    }
    else {
      char v13 = "NO";
    }
    unsigned __int8 v14 = [*((id *)val + 1) automaticUpdateScheduled];
    BOOL v15 = "YES";
    if ((v14 & 1) == 0) {
      BOOL v15 = "NO";
    }
    sub_10015A8B8((uint64_t)buf, (uint64_t)"-[BuddySoftwareUpdateController manager:promptForDevicePasscodeWithDescriptorCompletion:]", (uint64_t)v6, (uint64_t)v7, (uint64_t)v8, (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, (uint64_t)v15);
    _os_log_impl((void *)&_mh_execute_header, oslog, v39, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\nBuddy SU asked for device passcode", buf, 0x5Cu);

    if (v31) {
    if (v33)
    }

    if (v35) {
    if (v37)
    }
  }
  objc_storeStrong((id *)&oslog, 0);
  id v16 = [val passcodeCacheManager];
  id v30 = [v16 cachedPasscode];

  if (v30 && v41)
  {
    id v17 = (void (**)(id, id, id))v41;
    id v18 = [val update];
    v17[2](v17, v30, v18);

    int v29 = 1;
  }
  else
  {
    id v19 = [v41 copy];
    char v20 = (void *)*((void *)val + 6);
    *((void *)val + 6) = v19;

    objc_initWeak(&from, val);
    int v21 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v23 = -1073741824;
    int v24 = 0;
    id v25 = sub_10015F834;
    char v26 = &unk_1002B0CA8;
    objc_copyWeak(&v27, &from);
    dispatch_async((dispatch_queue_t)v21, &block);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&from);
    int v29 = 0;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
}

- (void)setButtonTitle:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(OBBoldTrayButton *)v4->_updateNowButton setTitle:location[0] forState:0];
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 didTransitionToState:(int)a4 fromState:(int)a5
{
  v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int v53 = a4;
  int v52 = a5;
  id v51 = 0;
  id v7 = [(BuddySoftwareUpdateController *)v55 update];
  id v8 = [location[0] preferredUpdate];
  unsigned __int8 v9 = [(SUDescriptor *)v7 isEqual:v8];

  if (v9)
  {
    id v10 = [location[0] preferredUpdateError];
    id v11 = v51;
    id v51 = v10;
  }
  else
  {
    id v12 = [(BuddySoftwareUpdateController *)v55 update];
    id v13 = [location[0] alternateUpdate];
    unsigned __int8 v14 = [(SUDescriptor *)v12 isEqual:v13];

    if (v14)
    {
      id v15 = [location[0] alternateUpdateError];
      id v16 = v51;
      id v51 = v15;
    }
  }
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [(SUSUISoftwareUpdateManager *)v55->_manager preferredUpdate];
    char v47 = 0;
    char v45 = 0;
    id v28 = v17;
    if (v17)
    {
      id v48 = [(SUSUISoftwareUpdateManager *)v55->_manager preferredUpdate];
      char v47 = 1;
      char v26 = (__CFString *)[v48 humanReadableUpdateName];
      id v46 = v26;
      char v45 = 1;
    }
    else
    {
      char v26 = @"N/A";
    }
    id v27 = [(SUSUISoftwareUpdateManager *)v55->_manager preferredUpdate];
    id v18 = [(SUSUISoftwareUpdateManager *)v55->_manager preferredUpdateError];
    id v19 = [(SUSUISoftwareUpdateManager *)v55->_manager alternateUpdate];
    char v43 = 0;
    char v41 = 0;
    if (v19)
    {
      id v44 = [(SUSUISoftwareUpdateManager *)v55->_manager alternateUpdate];
      char v43 = 1;
      char v20 = (__CFString *)[v44 humanReadableUpdateName];
      id v42 = v20;
      char v41 = 1;
    }
    else
    {
      char v20 = @"N/A";
    }
    id v21 = [(SUSUISoftwareUpdateManager *)v55->_manager alternateUpdate];
    id v22 = [(SUSUISoftwareUpdateManager *)v55->_manager alternateUpdateError];
    if ([(SUSUISoftwareUpdateManager *)v55->_manager isDelayingUpdates]) {
      int v23 = "YES";
    }
    else {
      int v23 = "NO";
    }
    if ([(SUSUISoftwareUpdateManager *)v55->_manager automaticUpdateScheduled])int v24 = "YES"; {
    else
    }
      int v24 = "NO";
    id v40 = (id)sub_100160124(v52);
    id v39 = (id)sub_100160124(v53);
    sub_100160234((uint64_t)buf, (uint64_t)v26, (uint64_t)v27, (uint64_t)v18, (uint64_t)v20, (uint64_t)v21, (uint64_t)v22, (uint64_t)v23, (uint64_t)v24, (uint64_t)v40, v52, (uint64_t)v39, v53, (uint64_t)v51);
    _os_log_impl((void *)&_mh_execute_header, oslog, v49, "%s: Software Update Buddy Checkpoint -\n\tmanager preferredUpdate: %{public}@ (%p)\n\tmanager preferredUpdateError: %{public}@\n\tmanager alternateDescriptor: %{public}@ (%p)\n\tmanager alternateUpdateError: %{public}@\n\tmanager isDelayingUpdates: %{public}s\n\tmanager automaticUpdateScheduled: %{public}s\n\nPerforming SU transition: %{public}@ (%lu) -> %{public}@ (%lu), error: %@", buf, 0x8Eu);

    if (v41) {
    if (v43)
    }

    if (v45) {
    if (v47)
    }

    objc_storeStrong(&v39, 0);
    objc_storeStrong(&v40, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  objc_initWeak(&from, v55);
  id v25 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v30 = -1073741824;
  int v31 = 0;
  id v32 = sub_1001602D4;
  char v33 = &unk_1002B3C08;
  objc_copyWeak(&v36, &from);
  id v34 = v55;
  id v35 = v51;
  unsigned int v37 = v53;
  dispatch_async((dispatch_queue_t)v25, &block);

  objc_storeStrong(&v35, 0);
  objc_storeStrong((id *)&v34, 0);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&from);
  objc_storeStrong(&v51, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 downloadProgressChanged:(id)a4 displayStyle:(int)a5
{
  char v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  int v17 = a5;
  objc_initWeak(&from, v20);
  id v7 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  id v11 = sub_100160F94;
  id v12 = &unk_1002B3C30;
  objc_copyWeak(&v14, &from);
  id v13 = v18;
  int v15 = v17;
  dispatch_async((dispatch_queue_t)v7, &block);

  objc_storeStrong(&v13, 0);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 downloadFinished:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  objc_initWeak(&from, v16);
  id v5 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_100161388;
  int v10 = &unk_1002B1408;
  objc_copyWeak(&v12, &from);
  id v11 = v16;
  dispatch_async((dispatch_queue_t)v5, &block);

  objc_storeStrong((id *)&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 installStartedForUpdate:(id)a4
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  id v5 = [(BuddySoftwareUpdateController *)v8 softwareUpdateDelegate];
  [(BuddySoftwareUpdateControllerDelegate *)v5 softwareUpdateController:v8 didStartInstallForUpdate:v6];

  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 installFailedWithError:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  objc_initWeak(&from, v16);
  id v5 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_1001620AC;
  int v10 = &unk_1002B1408;
  objc_copyWeak(&v12, &from);
  id v11 = v14;
  dispatch_async((dispatch_queue_t)v5, &block);

  objc_storeStrong(&v11, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&from);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(BuddySoftwareUpdateController *)v17 update];
  BOOL v5 = v4 == 0;

  if (v5)
  {
    int64_t v18 = 0;
  }
  else
  {
    id v6 = [(BuddySoftwareUpdateController *)v17 update];
    id v7 = [(SUDescriptor *)v6 documentation];
    char v14 = 0;
    char v12 = 0;
    char v10 = 0;
    BOOL v8 = 0;
    if (v7)
    {
      int v15 = [(BuddySoftwareUpdateController *)v17 update];
      char v14 = 1;
      id v13 = [(SUDescriptor *)v15 documentation];
      char v12 = 1;
      id v11 = [v13 releaseNotes];
      char v10 = 1;
      BOOL v8 = v11 != 0;
    }
    if (v10) {

    }
    if (v12) {
    if (v14)
    }

    if (v8) {
      int64_t v18 = 2;
    }
    else {
      int64_t v18 = 1;
    }
  }
  objc_storeStrong(location, 0);
  return v18;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  if ([v17 row])
  {
    if ([v17 row] == (id)1)
    {
      id v15 = [location[0] dequeueReusableCellWithIdentifier:@"LearnMoreCellIdentifier"];
      if (!v15)
      {
        id v15 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"LearnMoreCellIdentifier"];

        id v5 = [v15 textLabel];
        id v6 = +[NSBundle mainBundle];
        id v7 = [(NSBundle *)v6 localizedStringForKey:@"LEARN_MORE" value:&stru_1002B4E18 table:@"SoftwareUpdate"];
        [v5 setText:v7];

        id v8 = [v15 textLabel];
        id v9 = +[BFFStyle sharedStyle];
        id v10 = [v9 tableCellFont];
        [v8 setFont:v10];

        id v11 = [v15 textLabel];
        id v12 = +[UIColor _labelColor];
        [v11 setTextColor:v12];

        [v15 setSeparatorInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
        [v15 setAccessoryType:1];
      }
      char v20 = (SUSSoftwareUpdateTitleCell *)v15;
      int v16 = 1;
      objc_storeStrong(&v15, 0);
    }
    else
    {
      int v16 = 0;
    }
  }
  else
  {
    char v20 = v19->_titleCell;
    int v16 = 1;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  id v13 = v20;

  return v13;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  if ([v7 row])
  {
    if ([v7 row] == (id)1) {
      double v10 = 60.0;
    }
  }
  else
  {
    [(SUSSoftwareUpdateTitleCell *)v9->_titleCell preferredHeightWithTable:location[0]];
    double v10 = v5;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  int64_t v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  if ([v16 row] == (id)1)
  {
    id v15 = [objc_alloc((Class)sub_100162874()) initWithNibName:0 bundle:0];
    id v5 = objc_alloc((Class)NSString);
    id v6 = [(BuddySoftwareUpdateController *)v18 update];
    id v7 = [(SUDescriptor *)v6 documentation];
    id v8 = [v7 releaseNotes];
    id v9 = [v5 initWithData:v8 encoding:4];
    [v15 setReleaseNotes:v9];

    if (BFFIsiPad())
    {
      id v14 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v15];
      [v14 setModalPresentationStyle:2];
      id v10 = objc_alloc((Class)UIBarButtonItem);
      id v13 = [v10 initWithBarButtonSystemItem:0 target:v18 action:"detailedReleaseNotesDonePressed"];
      id v11 = [v15 navigationItem];
      [v11 setRightBarButtonItem:v13];

      [(BuddySoftwareUpdateController *)v18 presentViewController:v14 animated:1 completion:0];
      objc_storeStrong(&v13, 0);
      objc_storeStrong(&v14, 0);
    }
    else
    {
      id v12 = [(BuddySoftwareUpdateController *)v18 navigationController];
      [v12 pushViewController:v15 animated:1];
    }
    objc_storeStrong(&v15, 0);
  }
  [location[0] deselectRowAtIndexPath:v16 animated:1];
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (id)createBoldButtonWithTitle:(id)a3 action:(SEL)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = (id)a4;
  v7[0] = +[OBBoldTrayButton boldButton];
  [v7[0] setTitle:location[0] forState:0];
  [v7[0] addTarget:v9 action:a4 forControlEvents:64];
  id v5 = v7[0];
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)createLinkButtonWithTitle:(id)a3 action:(SEL)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = (id)a4;
  v7[0] = +[OBLinkTrayButton linkButton];
  [v7[0] setTitle:location[0] forState:0];
  [v7[0] addTarget:v9 action:a4 forControlEvents:64];
  id v5 = v7[0];
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (void)_allButtonsSetEnabled:(BOOL)a3
{
}

- (void)showErrorWithContent:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(OBBoldTrayButton *)v4->_updateNowButton setTitle:location[0] forState:0];
  [(OBBoldTrayButton *)v4->_updateNowButton setEnabled:0];
  if (v4->_updateTonightButton) {
    [(OBLinkTrayButton *)v4->_updateTonightButton setHidden:1];
  }
  objc_storeStrong(location, 0);
}

- (void)resetButtonState:(id)a3 andEventHandlers:(BOOL)a4
{
  id v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] setEnabled:1];
  [location[0] setHidden:0];
  if (a4) {
    [location[0] removeTarget:v6 action:0 forControlEvents:64];
  }
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BuddySoftwareUpdateControllerDelegate)softwareUpdateDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_softwareUpdateDelegate);

  return (BuddySoftwareUpdateControllerDelegate *)WeakRetained;
}

- (void)setSoftwareUpdateDelegate:(id)a3
{
}

- (BOOL)allowUserToSkip
{
  return self->_allowUserToSkip;
}

- (void)setAllowUserToSkip:(BOOL)a3
{
  self->_allowUserToSkip = a3;
}

- (BOOL)allowUserToInstallTonight
{
  return self->_allowUserToInstallTonight;
}

- (void)setAllowUserToInstallTonight:(BOOL)a3
{
  self->_allowUserToInstallTonight = a3;
}

- (BOOL)scannedForUpdate
{
  return self->_scannedForUpdate;
}

- (void)setScannedForUpdate:(BOOL)a3
{
  self->_scannedForUpdate = a3;
}

- (SUDescriptor)update
{
  return (SUDescriptor *)objc_getProperty(self, a2, 88, 1);
}

- (void)setUpdate:(id)a3
{
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end