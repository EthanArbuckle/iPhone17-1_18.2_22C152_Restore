@interface BuddyMandatoryUpdateProgressController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)errorIndicatesUpdateNotFound:(id)a3;
- (BOOL)failedToFindMDMRequiredUpdate;
- (BOOL)hasSpecificVersionRequired;
- (BOOL)manager:(id)a3 shouldShowAlertForScanError:(id)a4;
- (BOOL)shouldAllowStartOver;
- (BYDeviceProvider)deviceProvider;
- (BuddyMandatoryUpdateProgressController)initWithAllowCellularOverride:(BOOL)a3 bypassTermsAndConditions:(BOOL)a4 updateOptions:(id)a5;
- (OBAnimationController)animationController;
- (SUDescriptor)update;
- (SUSUISoftwareUpdateManager)updateManager;
- (SUScanOptions)updateOptions;
- (void)_handleScanResults:(id)a3 error:(id)a4;
- (void)handleDownload:(BOOL)a3 error:(id)a4;
- (void)loadView;
- (void)manager:(id)a3 didTransitionToState:(int)a4 fromState:(int)a5;
- (void)manager:(id)a3 download:(id)a4 failedWithError:(id)a5;
- (void)manager:(id)a3 downloadFinished:(id)a4;
- (void)manager:(id)a3 downloadProgressChanged:(id)a4 displayStyle:(int)a5;
- (void)manager:(id)a3 installFailedWithError:(id)a4;
- (void)manager:(id)a3 installStartedForUpdate:(id)a4;
- (void)manager:(id)a3 promptForDevicePasscodeWithCompletion:(id)a4;
- (void)manager:(id)a3 promptForDevicePasscodeWithDescriptorCompletion:(id)a4;
- (void)manager:(id)a3 scanFoundUpdates:(id)a4 error:(id)a5;
- (void)resetProgress;
- (void)setAnimationController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceProvider:(id)a3;
- (void)setFailedToFindMDMRequiredUpdate:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setUpdate:(id)a3;
- (void)setUpdateManager:(id)a3;
- (void)setUpdateOptions:(id)a3;
- (void)showAlertForError:(id)a3;
- (void)showAlertForMDMMissingUpdate:(id)a3;
- (void)startDownload;
- (void)startInstall;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyMandatoryUpdateProgressController

- (BuddyMandatoryUpdateProgressController)initWithAllowCellularOverride:(BOOL)a3 bypassTermsAndConditions:(BOOL)a4 updateOptions:(id)a5
{
  id v25 = self;
  SEL v24 = a2;
  BOOL v23 = a3;
  BOOL v22 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  id v5 = v25;
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [(NSBundle *)v6 localizedStringForKey:@"MANDATORY_UPDATE_PROGRESS_TITLE" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  id v25 = 0;
  v20.receiver = v5;
  v20.super_class = (Class)BuddyMandatoryUpdateProgressController;
  v8 = [(BuddyMandatoryUpdateProgressController *)&v20 initWithTitle:v7 detailText:0 icon:0];
  id v25 = v8;
  objc_storeStrong(&v25, v8);

  if (v8)
  {
    [v25 setUpdateOptions:location];
    id v9 = objc_alloc((Class)sub_1000EEF9C());
    id v10 = [v9 initWithDelegate:v25 hostController:v25];
    [v25 setUpdateManager:v10];

    BOOL v11 = v23;
    id v12 = [v25 updateManager];
    [v12 setAllowCellularOverride:v11];

    BOOL v13 = v22;
    id v14 = [v25 updateManager];
    [v14 setBypassTermsAndConditions:v13];

    id v15 = [v25 updateManager];
    [v15 setClientIsBuddy:1];

    id v16 = [v25 updateManager];
    id v17 = +[RUIStyle setupAssistantModalStyle];
    [v16 setServerFlowStyle:v17];
  }
  v18 = (BuddyMandatoryUpdateProgressController *)v25;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v25, 0);
  return v18;
}

- (void)loadView
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMandatoryUpdateProgressController;
  [(BuddyMandatoryUpdateProgressController *)&v3 loadView];
  [(BuddyMandatoryUpdateProgressController *)v5 resetProgress];
  id v2 = [(BuddyMandatoryUpdateProgressController *)v5 navigationItem];
  [v2 setHidesBackButton:1];
}

- (void)viewDidLoad
{
  id v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMandatoryUpdateProgressController;
  [(BuddyMandatoryUpdateProgressController *)&v3 viewDidLoad];
  id v2 = [(BuddyMandatoryUpdateProgressController *)v5 buddy_animationController:@"Update"];
  [(BuddyMandatoryUpdateProgressController *)v5 setAnimationController:v2];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyMandatoryUpdateProgressController;
  [(BuddyMandatoryUpdateProgressController *)&v4 viewWillAppear:a3];
  objc_super v3 = [(BuddyMandatoryUpdateProgressController *)v7 animationController];
  [(OBAnimationController *)v3 startAnimation];
}

- (void)viewDidAppear:(BOOL)a3
{
  v27 = self;
  SEL v26 = a2;
  BOOL v25 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BuddyMandatoryUpdateProgressController;
  [(BuddyMandatoryUpdateProgressController *)&v24 viewDidAppear:a3];
  if ([(BuddyMandatoryUpdateProgressController *)v27 isMovingToParentViewController])
  {
    id location = (id)_BYLoggingFacility();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v3 = location;
      os_log_type_t v4 = v22;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Scanning for update...", buf, 2u);
    }
    objc_storeStrong(&location, 0);
    BOOL v5 = [(BuddyMandatoryUpdateProgressController *)v27 updateOptions];

    if (v5)
    {
      SEL v6 = [(BuddyMandatoryUpdateProgressController *)v27 updateManager];
      v7 = [(BuddyMandatoryUpdateProgressController *)v27 updateOptions];
      id v15 = _NSConcreteStackBlock;
      int v16 = -1073741824;
      int v17 = 0;
      v18 = sub_1000EF4B4;
      v19 = &unk_1002B2D00;
      objc_super v20 = v27;
      [(SUSUISoftwareUpdateManager *)v6 scanForUpdatesWithOptions:v7 andCompletion:&v15];

      objc_storeStrong((id *)&v20, 0);
    }
    else
    {
      v8 = [(BuddyMandatoryUpdateProgressController *)v27 updateManager];
      id v9 = _NSConcreteStackBlock;
      int v10 = -1073741824;
      int v11 = 0;
      id v12 = sub_1000EF52C;
      BOOL v13 = &unk_1002B2D00;
      id v14 = v27;
      [(SUSUISoftwareUpdateManager *)v8 scanForUpdatesCompletion:&v9];

      objc_storeStrong((id *)&v14, 0);
    }
  }
}

- (void)setProgress:(double)a3
{
  v7 = self;
  SEL v6 = a2;
  double v5 = a3;
  if (a3 <= 0.02) {
    double v3 = 0.02;
  }
  else {
    double v3 = v5;
  }
  v4.receiver = self;
  v4.super_class = (Class)BuddyMandatoryUpdateProgressController;
  [(BuddyMandatoryUpdateProgressController *)&v4 setProgress:v3];
}

- (void)_handleScanResults:(id)a3 error:(id)a4
{
  SEL v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = 0;
  objc_storeStrong(&v24, a4);
  if (location[0] && !v24)
  {
    if (![(BuddyMandatoryUpdateProgressController *)v26 hasSpecificVersionRequired]) {
      goto LABEL_11;
    }
    id v20 = [location[0] preferredDescriptor];
    if (v20)
    {
      [(BuddyMandatoryUpdateProgressController *)v26 setUpdate:v20];
      int v21 = 0;
    }
    else
    {
      double v5 = v26;
      SEL v6 = [(BuddyMandatoryUpdateProgressController *)v26 updateOptions];
      [(BuddyMandatoryUpdateProgressController *)v5 showAlertForMDMMissingUpdate:v6];

      int v21 = 1;
    }
    objc_storeStrong(&v20, 0);
    if (!v21)
    {
LABEL_11:
      os_log_t v19 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v19;
        os_log_type_t v8 = v18;
        sub_10004B24C(v17);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Checking to see if we have an existing download in progress...", v17, 2u);
      }
      objc_storeStrong((id *)&v19, 0);
      id v9 = [(BuddyMandatoryUpdateProgressController *)v26 updateManager];
      id v10 = [(SUSUISoftwareUpdateManager *)v9 SUManager];
      int v11 = _NSConcreteStackBlock;
      int v12 = -1073741824;
      int v13 = 0;
      id v14 = sub_1000EF900;
      id v15 = &unk_1002B15C8;
      int v16 = v26;
      [v10 isDownloading:&v11];

      objc_storeStrong((id *)&v16, 0);
      int v21 = 0;
    }
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100051470((uint64_t)buf, (uint64_t)location[0], (uint64_t)v24);
      _os_log_impl((void *)&_mh_execute_header, oslog, v22, "Failed to scan for update (%@): %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v21 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)hasSpecificVersionRequired
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = [(BuddyMandatoryUpdateProgressController *)self updateOptions];
  id v2 = [location[0] requestedPMV];
  char v5 = 0;
  BOOL v3 = 1;
  if (!v2)
  {
    id v6 = [location[0] requestedBuild];
    char v5 = 1;
    BOOL v3 = v6 != 0;
  }
  BOOL v8 = v3;
  if (v5) {

  }
  objc_storeStrong(location, 0);
  return v8;
}

- (BOOL)errorIndicatesUpdateNotFound:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  uint64_t v11 = 0;
  int v12 = &v11;
  int v13 = 0x20000000;
  int v14 = 32;
  char v15 = 0;
  char v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  BOOL v8 = sub_1000EFF5C;
  id v9 = &unk_1002B2D28;
  id v10 = &v11;
  [location[0] buddy_enumerateErrorTreeWithHandler:&v5];
  char v3 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(location, 0);
  return v3 & 1;
}

- (void)resetProgress
{
  char v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(), a2);
  objc_super v4 = [(NSBundle *)v3 localizedStringForKey:@"MANDATORY_UPDATE_PROGRESS_INITIAL_STATUS" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  [(BuddyMandatoryUpdateProgressController *)self setProgressText:v4];

  [(BuddyMandatoryUpdateProgressController *)self setProgress:0.0];
}

- (void)showAlertForError:(id)a3
{
  v39 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v37 = 0;
  char v3 = [(BuddyMandatoryUpdateProgressController *)v39 updateManager];
  id v36 = [(SUSUISoftwareUpdateManager *)v3 humanReadableDescriptionForError:location[0] enableButton:&v37];

  if (![v36 length])
  {
    objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
    char v5 = [(NSBundle *)v4 localizedStringForKey:@"MANDATORY_UPDATE_GENERIC_ERROR_DETAIL" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
    id v6 = v36;
    id v36 = v5;
  }
  int v7 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v8 = [(NSBundle *)v7 localizedStringForKey:@"MANDATORY_UPDATE_GENERIC_ERROR_TITLE" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  id v35 = +[UIAlertController alertControllerWithTitle:v8 message:v36 preferredStyle:1];

  char v33 = 0;
  char v31 = 0;
  char v29 = 0;
  if ((v37 & 1) != 0
    || (v34 = [(BuddyMandatoryUpdateProgressController *)v39 updateManager],
        char v33 = 1,
        unsigned __int8 v9 = 0,
        [(SUSUISoftwareUpdateManager *)v34 state] == 14))
  {
    id v32 = [(BuddyMandatoryUpdateProgressController *)v39 updateManager];
    char v31 = 1;
    unsigned __int8 v9 = 1;
    if (([v32 readyToResume] & 1) == 0)
    {
      id v30 = [(BuddyMandatoryUpdateProgressController *)v39 updateManager];
      char v29 = 1;
      unsigned __int8 v9 = [v30 readyToDownloadPreferredUpdate];
    }
  }
  if (v29) {

  }
  if (v31) {
  if (v33)
  }

  if (v9)
  {
    id v10 = v35;
    uint64_t v11 = [(BuddyMandatoryUpdateProgressController *)v39 updateManager];
    id v12 = [(SUSUISoftwareUpdateManager *)v11 actionString];
    BOOL v23 = _NSConcreteStackBlock;
    int v24 = -1073741824;
    int v25 = 0;
    SEL v26 = sub_1000F05B0;
    v27 = &unk_1002B1040;
    v28 = v39;
    int v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:&v23];
    [v10 addAction:v13];

    objc_storeStrong((id *)&v28, 0);
  }
  id v14 = v35;
  char v15 = +[NSBundle bundleForClass:objc_opt_class()];
  int v16 = [(NSBundle *)v15 localizedStringForKey:@"MANDATORY_UPDATE_ERROR_CANCEL_BUTTON" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  os_log_type_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  id v20 = sub_1000F0858;
  int v21 = &unk_1002B1040;
  os_log_type_t v22 = v39;
  int v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:&v18];
  [v14 addAction:v17, v18, v19, v20, v21];

  [(BuddyMandatoryUpdateProgressController *)v39 presentViewController:v35 animated:1 completion:0];
  objc_storeStrong((id *)&v22, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(location, 0);
}

- (void)showAlertForMDMMissingUpdate:(id)a3
{
  int v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = +[BuddyMandatoryUpdateUtilities humanReadableCurrentOSVersion];
  id v22 = +[BuddyMandatoryUpdateUtilities humanReadableOSVersionFromScanOptions:location[0]];
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v20 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    sub_10004CECC((uint64_t)buf, (uint64_t)v22, (uint64_t)v23);
    _os_log_error_impl((void *)&_mh_execute_header, oslog, v20, "Failed to find update for the specified version %{public}@. Current version: %{public}@", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  char v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"MANDATORY_UPDATE_MISSING_MDM_UPDATE_ERROR_DETAIL"];
  char v5 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  id v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v23, v22);

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  int v7 = [(NSBundle *)v6 localizedStringForKey:@"MANDATORY_UPDATE_GENERIC_ERROR_TITLE" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  id v18 = +[UIAlertController alertControllerWithTitle:v7 message:v19 preferredStyle:1];

  id v8 = v18;
  unsigned __int8 v9 = +[NSBundle bundleForClass:objc_opt_class()];
  id v10 = [(NSBundle *)v9 localizedStringForKey:@"MANDATORY_UPDATE_MISSING_MDM_UPDATE_ERROR_OK_BUTTON" value:&stru_1002B4E18 table:@"MandatorySoftwareUpdate"];
  id v12 = _NSConcreteStackBlock;
  int v13 = -1073741824;
  int v14 = 0;
  char v15 = sub_1000F0CE8;
  int v16 = &unk_1002B1040;
  int v17 = v25;
  uint64_t v11 = +[UIAlertAction actionWithTitle:v10 style:1 handler:&v12];
  [v8 addAction:v11];

  [(BuddyMandatoryUpdateProgressController *)v25 presentViewController:v18 animated:1 completion:0];
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)startDownload
{
  id v18 = self;
  v17[1] = (id)a2;
  id v2 = [(BuddyMandatoryUpdateProgressController *)self update];

  if (v2)
  {
    char v3 = [(BuddyMandatoryUpdateProgressController *)v18 updateManager];
    id v4 = [(BuddyMandatoryUpdateProgressController *)v18 update];
    id v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    char v15 = sub_1000F0F30;
    int v16 = &unk_1002B15C8;
    v17[0] = v18;
    [(SUSUISoftwareUpdateManager *)v3 startDownloadAndInstall:0 update:v4 withHandler:&v12];

    objc_storeStrong(v17, 0);
  }
  else
  {
    char v5 = [(BuddyMandatoryUpdateProgressController *)v18 updateManager];
    id v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    unsigned __int8 v9 = sub_1000F0F94;
    id v10 = &unk_1002B15C8;
    uint64_t v11 = v18;
    [(SUSUISoftwareUpdateManager *)v5 startDownloadAndInstall:0 withHandler:&v6];

    objc_storeStrong((id *)&v11, 0);
  }
}

- (void)handleDownload:(BOOL)a3 error:(id)a4
{
  v57 = self;
  SEL v56 = a2;
  BOOL v55 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  if (v55)
  {
    if (location)
    {
      os_log_t v26 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        char v23 = 0;
        char v21 = 0;
        if (_BYIsInternalInstall())
        {
          uint64_t v11 = (NSString *)location;
        }
        else if (location)
        {
          id v24 = [location domain];
          char v23 = 1;
          uint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v24, [location code]);
          id v22 = v11;
          char v21 = 1;
        }
        else
        {
          uint64_t v11 = 0;
        }
        sub_10004BB7C((uint64_t)v58, (uint64_t)v11);
        _os_log_error_impl((void *)&_mh_execute_header, v26, v25, "Failed to start download of update: %{public}@", v58, 0xCu);
        if (v21) {

        }
        if (v23) {
      }
        }
      objc_storeStrong((id *)&v26, 0);
    }
    else
    {
      id v12 = [(BuddyMandatoryUpdateProgressController *)v57 updateManager];
      id v13 = [(SUSUISoftwareUpdateManager *)v12 download];
      id v14 = [v13 progress];
      unsigned __int8 v15 = [v14 isDone];

      if (v15)
      {
        os_log_t v20 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = v20;
          os_log_type_t v17 = v19;
          sub_10004B24C(v18);
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "Update already downloaded; starting install...", v18, 2u);
        }
        objc_storeStrong((id *)&v20, 0);
        [(BuddyMandatoryUpdateProgressController *)v57 startInstall];
      }
    }
  }
  else
  {
    id v4 = [location domain];
    unsigned __int8 v5 = [v4 isEqualToString:SUErrorDomain];

    if (v5)
    {
      if ([location code] == (id)41)
      {
        id v53 = (id)_BYLoggingFacility();
        os_log_type_t v52 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = v53;
          os_log_type_t v7 = v52;
          sub_10004B24C(buf);
          _os_log_impl((void *)&_mh_execute_header, v6, v7, "Update already downloaded; starting install...", buf, 2u);
        }
        objc_storeStrong(&v53, 0);
        [(BuddyMandatoryUpdateProgressController *)v57 startInstall];
      }
      else if ([location code] != (id)11)
      {
        id v50 = (id)_BYLoggingFacility();
        os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_DEFAULT))
        {
          sub_10004B238((uint64_t)v60, (uint64_t)location);
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v50, v49, "Failed to start download of update: %@", v60, 0xCu);
        }
        objc_storeStrong(&v50, 0);
        int v8 = &_dispatch_main_q;
        block = _NSConcreteStackBlock;
        int v43 = -1073741824;
        int v44 = 0;
        v45 = sub_1000F169C;
        v46 = &unk_1002B12F0;
        v47 = v57;
        id v48 = location;
        dispatch_async((dispatch_queue_t)v8, &block);

        objc_storeStrong(&v48, 0);
        objc_storeStrong((id *)&v47, 0);
      }
    }
    else if (location)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_10004B238((uint64_t)v59, (uint64_t)location);
        _os_log_impl((void *)&_mh_execute_header, oslog, v40, "Failed to start download of update: %@", v59, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      unsigned __int8 v9 = &_dispatch_main_q;
      char v33 = _NSConcreteStackBlock;
      int v34 = -1073741824;
      int v35 = 0;
      id v36 = sub_1000F16D0;
      char v37 = &unk_1002B12F0;
      v38 = v57;
      id v39 = location;
      dispatch_async((dispatch_queue_t)v9, &v33);

      objc_storeStrong(&v39, 0);
      objc_storeStrong((id *)&v38, 0);
    }
    else
    {
      id v10 = &_dispatch_main_q;
      v27 = _NSConcreteStackBlock;
      int v28 = -1073741824;
      int v29 = 0;
      id v30 = sub_1000F1704;
      char v31 = &unk_1002B0D20;
      id v32 = v57;
      dispatch_async((dispatch_queue_t)v10, &v27);

      objc_storeStrong((id *)&v32, 0);
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)startInstall
{
  unsigned __int8 v9 = self;
  v8[1] = (id)a2;
  +[BYPreferencesController persistEverything];
  id v2 = [(BuddyMandatoryUpdateProgressController *)v9 updateManager];
  char v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  id v6 = sub_1000F188C;
  os_log_type_t v7 = &unk_1002B15C8;
  v8[0] = v9;
  [(SUSUISoftwareUpdateManager *)v2 startInstallWithHandler:&v3];

  objc_storeStrong(v8, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (void)manager:(id)a3 didTransitionToState:(int)a4 fromState:(int)a5
{
  os_log_t v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v18 = a4;
  unsigned int v17 = a5;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000A0448((uint64_t)buf, v17, v18);
    _os_log_impl((void *)&_mh_execute_header, oslog, v15, "Software update state transitioned from %lu to %lu", buf, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  os_log_type_t v7 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = sub_1000F1CDC;
  id v12 = &unk_1002B2D50;
  unsigned int v14 = v18;
  id v13 = v20;
  dispatch_async((dispatch_queue_t)v7, &block);

  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 downloadProgressChanged:(id)a4 displayStyle:(int)a5
{
  os_log_type_t v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  int v16 = a5;
  if ([location[0] state] == 8
    || [location[0] state] == 6
    || [location[0] state] == 9)
  {
    int v15 = 1;
  }
  else
  {
    os_log_type_t v7 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    uint64_t v11 = sub_1000F1F68;
    id v12 = &unk_1002B12F0;
    id v13 = v19;
    id v14 = v17;
    dispatch_async((dispatch_queue_t)v7, &block);

    objc_storeStrong(&v14, 0);
    objc_storeStrong((id *)&v13, 0);
    int v15 = 0;
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 promptForDevicePasscodeWithCompletion:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 promptForDevicePasscodeWithDescriptorCompletion:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 downloadFinished:(id)a4
{
  os_log_type_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v5 = 0;
  objc_storeStrong(&v5, a4);
  [(BuddyMandatoryUpdateProgressController *)v7 startInstall];
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 download:(id)a4 failedWithError:(id)a5
{
  unsigned int v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = 0;
  objc_storeStrong(&v15, a5);
  os_log_type_t v7 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = sub_1000F2344;
  id v12 = &unk_1002B12F0;
  id v13 = v15;
  id v14 = v18;
  dispatch_async((dispatch_queue_t)v7, &block);

  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 installStartedForUpdate:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v5 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_1000F2530;
  int v10 = &unk_1002B0D20;
  uint64_t v11 = v14;
  dispatch_async((dispatch_queue_t)v5, &block);

  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 installFailedWithError:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v5 = &_dispatch_main_q;
  id v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  int v9 = sub_1000F2784;
  int v10 = &unk_1002B12F0;
  id v11 = v13;
  id v12 = v15;
  dispatch_async((dispatch_queue_t)v5, &v6);

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)manager:(id)a3 shouldShowAlertForScanError:(id)a4
{
  int v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  unsigned __int8 v5 = [(BuddyMandatoryUpdateProgressController *)v10 hasSpecificVersionRequired];
  unsigned __int8 v6 = 0;
  if (v5) {
    unsigned __int8 v6 = [(BuddyMandatoryUpdateProgressController *)v10 errorIndicatesUpdateNotFound:v8];
  }
  if (v6)
  {
    [(BuddyMandatoryUpdateProgressController *)v10 setFailedToFindMDMRequiredUpdate:1];
    char v11 = 0;
  }
  else
  {
    char v11 = 1;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (void)manager:(id)a3 scanFoundUpdates:(id)a4 error:(id)a5
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = 0;
  objc_storeStrong(&v15, a4);
  id v14 = 0;
  objc_storeStrong(&v14, a5);
  if (!v15 || v14)
  {
    int v7 = &_dispatch_main_q;
    id v8 = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    char v11 = sub_1000F2A7C;
    id v12 = &unk_1002B0D20;
    id v13 = v17;
    dispatch_async((dispatch_queue_t)v7, &v8);

    objc_storeStrong((id *)&v13, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BYDeviceProvider)deviceProvider
{
  return self->_deviceProvider;
}

- (void)setDeviceProvider:(id)a3
{
}

- (SUSUISoftwareUpdateManager)updateManager
{
  return (SUSUISoftwareUpdateManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUpdateManager:(id)a3
{
}

- (SUScanOptions)updateOptions
{
  return (SUScanOptions *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUpdateOptions:(id)a3
{
}

- (SUDescriptor)update
{
  return (SUDescriptor *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUpdate:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (BOOL)failedToFindMDMRequiredUpdate
{
  return self->_failedToFindMDMRequiredUpdate;
}

- (void)setFailedToFindMDMRequiredUpdate:(BOOL)a3
{
  self->_failedToFindMDMRequiredUpdate = a3;
}

- (void).cxx_destruct
{
}

@end