@interface BuddyCloudConfigInstallationController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)_isEscrowMissingError:(id)a3;
- (BOOL)cloudConfigurationChangedDuringInstallation;
- (BOOL)controllerNeedsToRun;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BuddyCloudConfigInstallationController)init;
- (BuddyEnrollmentCoordinator)enrollmentCoordinator;
- (MCProfileConnection)managedConfiguration;
- (NSString)lastErrorDescription;
- (UIActivityIndicatorView)spinnerView;
- (UILabel)activityLabel;
- (id)_clearImage;
- (id)deviceConfiguredCompletionBlock;
- (id)devicePasscodeCompletion;
- (int)state;
- (void)_cancelDevicePasscodePicker:(id)a3;
- (void)_createUnlockEscrowAndRetryProfileInstallationWithCompletion:(id)a3;
- (void)_setupForState;
- (void)_tryToInstallStoredProfileShouldCreateEscrowIfNeeded:(BOOL)a3 completion:(id)a4;
- (void)cloudConfigDidChange:(id)a3;
- (void)controllerDone;
- (void)dealloc;
- (void)loadView;
- (void)nextButtonPressed:(id)a3;
- (void)passcodeEntryController:(id)a3 didEnterPasscode:(id)a4;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setActivityLabel:(id)a3;
- (void)setCloudConfigurationChangedDuringInstallation:(BOOL)a3;
- (void)setDeviceConfiguredCompletionBlock:(id)a3;
- (void)setDevicePasscodeCompletion:(id)a3;
- (void)setEnrollmentCoordinator:(id)a3;
- (void)setLastErrorDescription:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setSpinnerView:(id)a3;
- (void)setState:(int)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyCloudConfigInstallationController

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyCloudConfigInstallationController *)self managedConfiguration];
  unsigned __int8 v3 = [(MCProfileConnection *)v2 shouldInstallStoredProfile];

  if ((v3 & 1) == 0)
  {
    v4 = [(BuddyCloudConfigInstallationController *)self managedConfiguration];
    [(MCProfileConnection *)v4 markStoredProfileAsInstalled];
  }
  char v10 = 0;
  char v8 = 0;
  unsigned __int8 v5 = 1;
  if ((v3 & 1) == 0)
  {
    v11 = [(BuddyCloudConfigInstallationController *)self managedConfiguration];
    char v10 = 1;
    unsigned __int8 v6 = [(MCProfileConnection *)v11 wasCloudConfigurationApplied];
    unsigned __int8 v5 = 0;
    if (v6)
    {
      v9 = [(BuddyCloudConfigInstallationController *)self managedConfiguration];
      char v8 = 1;
      unsigned __int8 v5 = [(MCProfileConnection *)v9 isAwaitingDeviceConfigured];
    }
  }
  BOOL v12 = v5 & 1;
  if (v8) {

  }
  if (v10) {
  return v12;
  }
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (BuddyCloudConfigInstallationController)init
{
  id location = self;
  SEL v11 = a2;
  unsigned __int8 v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"CLOUD_CONFIG_CONFIGURING"];
  unsigned __int8 v5 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];
  id v6 = [location _clearImage];
  id location = 0;
  v10.receiver = self;
  v10.super_class = (Class)BuddyCloudConfigInstallationController;
  id location = [(BuddyCloudConfigInstallationController *)&v10 initWithTitle:v5 detailText:0 icon:v6];
  objc_storeStrong(&location, location);

  if (location)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v7 addObserver:location selector:"cloudConfigDidChange:" name:MCCloudConfigurationDidChangeNotification object:0];

    [location setState:0];
  }
  char v8 = (BuddyCloudConfigInstallationController *)location;
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)dealloc
{
  unsigned __int8 v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)BuddyCloudConfigInstallationController;
  [(BuddyCloudConfigInstallationController *)&v3 dealloc];
}

- (void)loadView
{
  v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)BuddyCloudConfigInstallationController;
  [(BuddyCloudConfigInstallationController *)&v11 loadView];
  v2 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  activityLabel = v13->_activityLabel;
  v13->_activityLabel = v2;

  id v4 = +[BFFStyle sharedStyle];
  [v4 applyThemeToLabel:v13->_activityLabel];

  [(UILabel *)v13->_activityLabel setTextAlignment:1];
  unsigned __int8 v5 = v13->_activityLabel;
  id v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [(UILabel *)v5 setFont:v6];

  [(UILabel *)v13->_activityLabel setLineBreakMode:0];
  [(UILabel *)v13->_activityLabel setNumberOfLines:0];
  id v7 = [(BuddyCloudConfigInstallationController *)v13 contentView];
  [v7 addSubview:v13->_activityLabel];

  char v8 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  spinnerView = v13->_spinnerView;
  v13->_spinnerView = v8;

  id v10 = [(BuddyCloudConfigInstallationController *)v13 view];
  [v10 addSubview:v13->_spinnerView];
}

- (void)viewWillAppear:(BOOL)a3
{
  v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BuddyCloudConfigInstallationController;
  [(BuddyCloudConfigInstallationController *)&v10 viewWillAppear:a3];
  objc_super v3 = [(BuddyCloudConfigInstallationController *)v13 managedConfiguration];
  id v9 = [(MCProfileConnection *)v3 cloudConfigurationDetails];

  id location = [v9 objectForKeyedSubscript:kMCCCOrganizationNameKey];
  id v4 = [(BuddyCloudConfigInstallationController *)v13 headerView];
  unsigned __int8 v5 = +[NSBundle mainBundle];
  id v6 = [(NSBundle *)v5 localizedStringForKey:@"CLOUD_CONFIG_INSTALLING_DESCRIPTION_%@" value:&stru_1002B4E18 table:@"Localizable"];
  id v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, location);
  [v4 setDetailText:v7];

  if (![(BuddyCloudConfigInstallationController *)v13 state])
  {
    [(BuddyCloudConfigInstallationController *)v13 setState:1];
    [(BuddyCloudConfigInstallationController *)v13 _setupForState];
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v9, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  self->_controllerDoneCalled = 0;
  v3.receiver = v6;
  v3.super_class = (Class)BuddyCloudConfigInstallationController;
  [(BuddyCloudConfigInstallationController *)&v3 viewDidAppear:v4];
  if ([(BuddyCloudConfigInstallationController *)v6 state] == 1)
  {
    [(BuddyCloudConfigInstallationController *)v6 setState:2];
    [(BuddyCloudConfigInstallationController *)v6 _setupForState];
  }
}

- (void)controllerDone
{
  v13 = self;
  oslog[1] = (os_log_t)a2;
  if (self->_controllerDoneCalled)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)v13);
      _os_log_impl((void *)&_mh_execute_header, oslog[0], v11, "CloudConfig controller %@ is sending buddyControllerDone multiple times", buf, 0xCu);
    }
    objc_storeStrong((id *)oslog, 0);
    os_log_t v10 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id location = +[NSThread callStackSymbols];
      sub_10004B238((uint64_t)v15, (uint64_t)location);
      _os_log_impl((void *)&_mh_execute_header, v10, v9, "Call stack: %@", v15, 0xCu);

      objc_storeStrong(&location, 0);
    }
    objc_storeStrong((id *)&v10, 0);
    os_log_t v7 = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(BuddyCloudConfigInstallationController *)v13 navigationController];
      id v6 = [v5 viewControllers];
      sub_10004B238((uint64_t)v14, (uint64_t)v6);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "VC stack: %@", v14, 0xCu);
    }
    objc_storeStrong((id *)&v7, 0);
  }
  else
  {
    v13->_controllerDoneCalled = 1;
    [(BuddyCloudConfigInstallationController *)v13 setState:6];
    v2 = [(BuddyWelcomeController *)v13 delegate];
    v17 = v13;
    objc_super v3 = +[NSArray arrayWithObjects:&v17 count:1];
    [(BFFFlowItemDelegate *)v2 removeViewControllersOnNextPush:v3];

    BOOL v4 = [(BuddyWelcomeController *)v13 delegate];
    [(BFFFlowItemDelegate *)v4 flowItemDone:v13];
  }
}

- (void)viewDidLayoutSubviews
{
  v33 = self;
  SEL v32 = a2;
  id v2 = [(BuddyCloudConfigInstallationController *)self contentView];
  [v2 bounds];
  uint64_t v30 = v3;
  uint64_t v29 = v4;
  *((void *)&v31 + 1) = v5;
  *(void *)&long long v31 = v6;

  os_log_t v7 = [(BuddyCloudConfigInstallationController *)v33 activityLabel];
  [(UILabel *)v7 sizeThatFits:v31];
  uint64_t v27 = v8;
  uint64_t v28 = v9;

  sub_1001D374C();
  *((void *)&v25 + 1) = v10;
  *(void *)&long long v25 = v11;
  *((void *)&v26 + 1) = v12;
  *(void *)&long long v26 = v13;
  long long v24 = v26;
  long long v23 = v25;
  v14 = [(BuddyCloudConfigInstallationController *)v33 activityLabel];
  long long v22 = v26;
  long long v21 = v25;
  -[UILabel setFrame:](v14, "setFrame:", v25, v26);

  id v15 = [(BuddyCloudConfigInstallationController *)v33 view];
  [v15 center];
  v20.receiver = v16;
  v20.super_class = v17;
  v18 = [(BuddyCloudConfigInstallationController *)v33 spinnerView];
  v19[1] = v20;
  [(UIActivityIndicatorView *)v18 setCenter:v20];

  v19[0].receiver = v33;
  v19[0].super_class = (Class)BuddyCloudConfigInstallationController;
  [(objc_super *)v19 viewDidLayoutSubviews];
}

- (BOOL)_isEscrowMissingError:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v9 = 0;
  while (location[0])
  {
    id v3 = [location[0] domain];
    unsigned __int8 v4 = [v3 isEqualToString:MCInstallationErrorDomain];

    if ((v4 & 1) == 0) {
      break;
    }
    if ([location[0] code] == (id)4042)
    {
      char v9 = 1;
      break;
    }
    id v5 = [location[0] userInfo];
    id v6 = [v5 objectForKeyedSubscript:NSUnderlyingErrorKey];
    id v7 = location[0];
    location[0] = v6;
  }
  objc_storeStrong(location, 0);
  return v9 & 1;
}

- (void)_createUnlockEscrowAndRetryProfileInstallationWithCompletion:(id)a3
{
  long long v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  v18 = sub_1001DE16C;
  v19 = &unk_1002B4A70;
  objc_super v20 = v24;
  id v21 = location[0];
  id v22 = objc_retainBlock(&v15);
  id v3 = [(BuddyCloudConfigInstallationController *)v24 passcodeCacheManager];
  id v14 = [(BYPasscodeCacheManager *)v3 cachedPasscode];

  if (v14 && location[0])
  {
    (*((void (**)(id, id))v22 + 2))(v22, v14);
    int v13 = 1;
  }
  else
  {
    id v4 = [v22 copy];
    id devicePasscodeCompletion = v24->_devicePasscodeCompletion;
    v24->_id devicePasscodeCompletion = v4;

    id v6 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    uint64_t v10 = sub_1001DE460;
    uint64_t v11 = &unk_1002B0D20;
    uint64_t v12 = v24;
    dispatch_async((dispatch_queue_t)v6, &block);

    objc_storeStrong((id *)&v12, 0);
    int v13 = 0;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong((id *)&v20, 0);
  objc_storeStrong(location, 0);
}

- (void)_tryToInstallStoredProfileShouldCreateEscrowIfNeeded:(BOOL)a3 completion:(id)a4
{
  long long v23 = self;
  SEL v22 = a2;
  BOOL v21 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v19 = [(BuddyCloudConfigInstallationController *)v23 managedConfiguration];
  id v18 = 0;
  id v4 = +[BuddyCloudConfigManager sharedManager];
  id v5 = [v4 cloudConfigurationDetails];
  id v17 = [v5 objectForKeyedSubscript:kCCRemoteManagementAccountIdentifierKey];

  if ([v17 length])
  {
    uint64_t v24 = kMCInstallProfileOptionRMAccountIdentifier;
    id v25 = v17;
    id v6 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v7 = v18;
    id v18 = v6;
  }
  int v8 = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  uint64_t v11 = sub_1001DE8F0;
  uint64_t v12 = &unk_1002B4AC0;
  BOOL v16 = v21;
  int v13 = v23;
  id v15 = location;
  id v14 = v19;
  [v19 installStoredProfileDataWithExtraOptions:v18 completion:&v8];
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong((id *)&v13, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&location, 0);
}

- (void)_setupForState
{
  v40 = self;
  location[1] = (id)a2;
  location[0] = (id)_BYLoggingFacility();
  os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_10005A060(buf, [(BuddyCloudConfigInstallationController *)v40 state]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)location[0], v38, "Setting up for state %d", buf, 8u);
  }
  objc_storeStrong(location, 0);
  switch([(BuddyCloudConfigInstallationController *)v40 state])
  {
    case 1:
      [(BuddyCloudConfigInstallationController *)v40 setDeviceConfiguredCompletionBlock:0];
      [(BuddyCloudConfigInstallationController *)v40 setLastErrorDescription:0];
      id v2 = [(BuddyCloudConfigInstallationController *)v40 navigationItem];
      id v3 = [v2 leftBarButtonItem];
      [v3 setEnabled:0];

      id v4 = [(BuddyCloudConfigInstallationController *)v40 spinnerView];
      [(UIActivityIndicatorView *)v4 startAnimating];

      id v5 = [(BuddyCloudConfigInstallationController *)v40 activityLabel];
      [(UILabel *)v5 setHidden:1];

      break;
    case 2:
      [(BuddyCloudConfigInstallationController *)v40 setState:3];
      [(BuddyCloudConfigInstallationController *)v40 _setupForState];
      id v37 = [(BuddyCloudConfigInstallationController *)v40 managedConfiguration];
      uint64_t v29 = _NSConcreteStackBlock;
      int v30 = -1073741824;
      int v31 = 0;
      SEL v32 = sub_1001DF2AC;
      v33 = &unk_1002B12F0;
      id v34 = v37;
      v35 = v40;
      id v36 = objc_retainBlock(&v29);
      id v6 = [v37 installedMDMProfileIdentifier];

      if (v6) {
        (*((void (**)(void))v36 + 2))();
      }
      else {
        [(BuddyCloudConfigInstallationController *)v40 _tryToInstallStoredProfileShouldCreateEscrowIfNeeded:1 completion:v36];
      }
      objc_storeStrong(&v36, 0);
      objc_storeStrong((id *)&v35, 0);
      objc_storeStrong(&v34, 0);
      objc_storeStrong(&v37, 0);
      break;
    case 3:
      id v7 = [(BuddyCloudConfigInstallationController *)v40 spinnerView];
      [(UIActivityIndicatorView *)v7 startAnimating];

      id v8 = [(BuddyCloudConfigInstallationController *)v40 navigationItem];
      [v8 setHidesBackButton:1];

      id v9 = [(BuddyCloudConfigInstallationController *)v40 view];
      [v9 setNeedsLayout];

      break;
    case 4:
      int v10 = [(BuddyCloudConfigInstallationController *)v40 spinnerView];
      [(UIActivityIndicatorView *)v10 startAnimating];

      uint64_t v11 = [(BuddyCloudConfigInstallationController *)v40 managedConfiguration];
      id v28 = [(MCProfileConnection *)v11 cloudConfigurationDetails];

      id v27 = [v28 objectForKeyedSubscript:kMCCCOrganizationNameKey];
      id v12 = [(BuddyCloudConfigInstallationController *)v40 headerView];
      int v13 = +[NSBundle mainBundle];
      id v14 = [(NSBundle *)v13 localizedStringForKey:@"CLOUD_CONFIG_GETTING_CONFIGURATION_DESCRIPTION_%@" value:&stru_1002B4E18 table:@"Localizable"];
      id v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v14, v27);
      [v12 setDetailText:v15];

      id v16 = [(BuddyCloudConfigInstallationController *)v40 navigationItem];
      [v16 setHidesBackButton:1];

      objc_storeStrong(&v27, 0);
      objc_storeStrong(&v28, 0);
      break;
    case 5:
      id v17 = [(BuddyCloudConfigInstallationController *)v40 spinnerView];
      [(UIActivityIndicatorView *)v17 stopAnimating];

      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        id v18 = [(BuddyCloudConfigInstallationController *)v40 lastErrorDescription];
        sub_10004B238((uint64_t)v41, (uint64_t)v18);
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Last error description: %@", v41, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v19 = [(BuddyCloudConfigInstallationController *)v40 lastErrorDescription];

      if (v19)
      {
        objc_super v20 = [(BuddyCloudConfigInstallationController *)v40 lastErrorDescription];
        BOOL v21 = [(BuddyCloudConfigInstallationController *)v40 activityLabel];
        [(UILabel *)v21 setText:v20];

        SEL v22 = [(BuddyCloudConfigInstallationController *)v40 activityLabel];
        [(UILabel *)v22 setHidden:0];

        id v23 = [(BuddyCloudConfigInstallationController *)v40 navigationItem];
        [v23 setHidesBackButton:0];

        uint64_t v24 = (BuddyEnrollmentCoordinator *)[(BuddyCloudConfigInstallationController *)v40 navigationItem];
        id v25 = [(BuddyEnrollmentCoordinator *)v24 rightBarButtonItem];
        [v25 setEnabled:0];
      }
      else
      {
        [(BuddyCloudConfigInstallationController *)v40 controllerDone];
        uint64_t v24 = [(BuddyCloudConfigInstallationController *)v40 enrollmentCoordinator];
        [(BuddyEnrollmentCoordinator *)v24 profileInstallationDone];
      }

      break;
    default:
      return;
  }
}

- (void)cloudConfigDidChange:(id)a3
{
  uint64_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1001DF72C;
  id v8 = &unk_1002B0D20;
  id v9 = v11;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)nextButtonPressed:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyCloudConfigInstallationController *)v4 controllerDone];
  objc_storeStrong(location, 0);
}

- (void)_cancelDevicePasscodePicker:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyCloudConfigInstallationController *)v5 dismissViewControllerAnimated:1 completion:0];
  (*((void (**)(void))v5->_devicePasscodeCompletion + 2))();
  id devicePasscodeCompletion = v5->_devicePasscodeCompletion;
  v5->_id devicePasscodeCompletion = 0;

  objc_storeStrong(location, 0);
}

- (id)_clearImage
{
  id v9 = self;
  SEL v8 = a2;
  sub_1001D3718();
  CGSize size = v10;
  UIGraphicsBeginImageContextWithOptions(v10, 1, 0.0);
  id v2 = +[UIColor systemBackgroundColor];
  [(UIColor *)v2 setFill];

  sub_1001D374C();
  CGRect rect = v11;
  UIRectFill(v11);
  id location = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v3 = location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)passcodeEntryController:(id)a3 didEnterPasscode:(id)a4
{
  SEL v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  if ([v6 length])
  {
    [(BuddyCloudConfigInstallationController *)v8 dismissViewControllerAnimated:1 completion:0];
    if (v8->_devicePasscodeCompletion)
    {
      (*((void (**)(void))v8->_devicePasscodeCompletion + 2))();
      id devicePasscodeCompletion = v8->_devicePasscodeCompletion;
      v8->_id devicePasscodeCompletion = 0;
    }
  }
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  CGSize v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = oslog;
    os_log_type_t v4 = v7;
    sub_10004B24C(v6);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Passcode entry was dismissed with a swipe", (uint8_t *)v6, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v10->_devicePasscodeCompletion)
  {
    (*((void (**)(void))v10->_devicePasscodeCompletion + 2))();
    id devicePasscodeCompletion = v10->_devicePasscodeCompletion;
    v10->_id devicePasscodeCompletion = 0;
  }
  objc_storeStrong(location, 0);
}

- (BuddyEnrollmentCoordinator)enrollmentCoordinator
{
  return self->enrollmentCoordinator;
}

- (void)setEnrollmentCoordinator:(id)a3
{
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (UILabel)activityLabel
{
  return self->_activityLabel;
}

- (void)setActivityLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
}

- (NSString)lastErrorDescription
{
  return self->_lastErrorDescription;
}

- (void)setLastErrorDescription:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (id)deviceConfiguredCompletionBlock
{
  return self->_deviceConfiguredCompletionBlock;
}

- (void)setDeviceConfiguredCompletionBlock:(id)a3
{
}

- (BOOL)cloudConfigurationChangedDuringInstallation
{
  return self->_cloudConfigurationChangedDuringInstallation;
}

- (void)setCloudConfigurationChangedDuringInstallation:(BOOL)a3
{
  self->_cloudConfigurationChangedDuringInstallation = a3;
}

- (id)devicePasscodeCompletion
{
  return self->_devicePasscodeCompletion;
}

- (void)setDevicePasscodeCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end