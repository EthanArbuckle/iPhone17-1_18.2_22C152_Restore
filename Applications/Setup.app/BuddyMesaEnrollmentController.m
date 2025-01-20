@interface BuddyMesaEnrollmentController
+ (BOOL)hiddenFromMultiUser;
+ (BOOL)hiddenFromStoreDemoMode;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BKIdentity)identity;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)controllerNeedsToRun;
- (BOOL)isEphemeral;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAllowStartOver;
- (BYCapabilities)capabilities;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BYPreferencesController)buddyPreferences;
- (BiometricKitUIEnrollViewController)enrollController;
- (BuddyMesaEnrollmentController)init;
- (LAContext)authContext;
- (MCProfileConnection)managedConfiguration;
- (id)cancelLeftNavigationItem;
- (id)menuButtonPressedBlock;
- (void)beginEnrollment;
- (void)completeMesaController;
- (void)contextEvaluatePolicy;
- (void)controllerWasPopped;
- (void)dealloc;
- (void)deleteIdentity;
- (void)didBecomeActive:(id)a3;
- (void)didResignActive:(id)a3;
- (void)endEnrollment;
- (void)enrollResult:(int)a3 bkIdentity:(id)a4;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)generateAuthToken;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)resetAuthContext;
- (void)resetLeftNavigationItem;
- (void)restartEnrollment;
- (void)setAuthContext:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnrollController:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMenuButtonPressedBlock:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyMesaEnrollmentController

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  [(BiometricKitUIEnrollViewController *)self->_enrollController setDelegate:0];
  v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)BuddyMesaEnrollmentController;
  [(BuddyMesaEnrollmentController *)&v3 dealloc];
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyMesaEnrollmentController *)self managedConfiguration];
  unsigned int v3 = [(MCProfileConnection *)v2 effectiveBoolValueForSetting:MCFeatureFingerprintModificationAllowed];

  if (v3 == 2) {
    return 0;
  }
  SEL v4 = [(BuddyMesaEnrollmentController *)self capabilities];
  char v13 = 0;
  char v5 = 0;
  if ([(BYCapabilities *)v4 supportsTouchID])
  {
    v14 = [(BuddyMesaEnrollmentController *)self capabilities];
    char v13 = 1;
    char v5 = [(BYCapabilities *)v14 isTouchIDEnrolled] ^ 1;
  }
  if (v13) {

  }
  BOOL v15 = v5 & 1;
  v6 = [(BuddyMesaEnrollmentController *)self buddyPreferences];
  char v7 = 0;
  if (([(BYPreferencesController *)v6 BOOLForKey:@"Payment2Presented"] & 1) == 0) {
    char v7 = MGGetBoolAnswer() & 1;
  }

  char v11 = 0;
  if ((v7 & 1) != 0
    || (v12 = [(BuddyMesaEnrollmentController *)self buddyPreferences],
        char v11 = 1,
        unsigned __int8 v8 = [(BYPreferencesController *)v12 BOOLForKey:@"Mesa2Presented"],
        BOOL v9 = 0,
        (v8 & 1) == 0))
  {
    BOOL v9 = v15;
  }
  BOOL v17 = v9;
  if (v11) {

  }
  return v17;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v3 = [(BuddyMesaEnrollmentController *)v16 managedConfiguration];
  unsigned __int8 v4 = [(MCProfileConnection *)v3 isPasscodeSet];

  if ((v4 & 1) == 0)
  {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
    goto LABEL_6;
  }
  char v5 = [(BuddyMesaEnrollmentController *)v16 passcodeCacheManager];
  id v6 = [(BYPasscodeCacheManager *)v5 cachedPasscode];

  if (!v6)
  {
    char v7 = dispatch_get_global_queue(25, 0);
    block = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    char v11 = sub_100095864;
    v12 = &unk_1002B0D70;
    id v13 = location[0];
    dispatch_async(v7, &block);

    objc_storeStrong(&v13, 0);
LABEL_6:
    int v14 = 0;
    goto LABEL_7;
  }
  (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  int v14 = 1;
LABEL_7:
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupBiometric;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

+ (BOOL)hiddenFromStoreDemoMode
{
  return 1;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BuddyMesaEnrollmentController)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMesaEnrollmentController;
  id location = [(BuddyMesaEnrollmentController *)&v6 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    v2 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v2 addObserver:location selector:"didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    unsigned int v3 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v3 addObserver:location selector:"didResignActive:" name:UIApplicationWillResignActiveNotification object:0];
  }
  unsigned __int8 v4 = (BuddyMesaEnrollmentController *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BOOL)controllerAllowsNavigatingBack
{
  v2 = [(BuddyMesaEnrollmentController *)self capabilities];
  char v3 = [(BYCapabilities *)v2 isTouchIDEnrolled] ^ 1;

  return v3 & 1;
}

- (BOOL)isEphemeral
{
  v2 = [(BuddyMesaEnrollmentController *)self capabilities];
  unsigned __int8 v3 = [(BYCapabilities *)v2 supportsTouchID];
  char v6 = 0;
  unsigned __int8 v4 = 0;
  if (v3)
  {
    SEL v7 = [(BuddyMesaEnrollmentController *)self capabilities];
    char v6 = 1;
    unsigned __int8 v4 = [(BYCapabilities *)v7 isTouchIDEnrolled];
  }
  char v9 = v4 & 1;
  if (v6) {

  }
  return v9 & 1;
}

- (BOOL)shouldAllowStartOver
{
  return 0;
}

- (void)controllerWasPopped
{
  v2 = [(BuddyMesaEnrollmentController *)self buddyPreferences];
  [(BYPreferencesController *)v2 removeObjectForKey:@"Mesa2Presented"];
}

- (void)didBecomeActive:(id)a3
{
  int v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100095D98((uint64_t)buf, (uint64_t)"-[BuddyMesaEnrollmentController didBecomeActive:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "BuddyMesaController: %s", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  char v6 = 0;
  char v4 = 0;
  BOOL v3 = 0;
  if (!v10->_enrollController)
  {
    id v7 = [(BuddyMesaEnrollmentController *)v10 navigationController];
    char v6 = 1;
    char v5 = (BuddyMesaEnrollmentController *)[v7 topViewController];
    char v4 = 1;
    BOOL v3 = v5 == v10;
  }
  if (v4) {

  }
  if (v6) {
  if (v3)
  }
    [(BuddyMesaEnrollmentController *)v10 beginEnrollment];
  objc_storeStrong(location, 0);
}

- (void)didResignActive:(id)a3
{
  int v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100095D98((uint64_t)buf, (uint64_t)"-[BuddyMesaEnrollmentController didResignActive:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "BuddyMesaController: %s", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  char v6 = 0;
  char v4 = 0;
  BOOL v3 = 0;
  if (!v10->_enrollComplete)
  {
    id v7 = [(BuddyMesaEnrollmentController *)v10 navigationController];
    char v6 = 1;
    char v5 = (BuddyMesaEnrollmentController *)[v7 topViewController];
    char v4 = 1;
    BOOL v3 = v5 == v10;
  }
  if (v4) {

  }
  if (v6) {
  if (v3)
  }
    [(BuddyMesaEnrollmentController *)v10 deleteIdentity];
  [(BuddyMesaEnrollmentController *)v10 endEnrollment];
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  unsigned __int8 v8 = self;
  SEL v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)BuddyMesaEnrollmentController;
  [(BuddyMesaEnrollmentController *)&v6 viewDidLoad];
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [(NSBundle *)v2 localizedStringForKey:@"TOUCH_ID" value:&stru_1002B4E18 table:@"Localizable"];
  id v4 = [(BuddyMesaEnrollmentController *)v8 navigationItem];
  [v4 setBackButtonTitle:v3];

  id v5 = [(BuddyMesaEnrollmentController *)v8 navigationItem];
  [v5 setLeftItemsSupplementBackButton:0];
}

- (BOOL)prefersStatusBarHidden
{
  v2 = [(BuddyMesaEnrollmentController *)self enrollController];
  unsigned __int8 v3 = [(BiometricKitUIEnrollViewController *)v2 prefersStatusBarHidden];

  return v3 & 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100095D98((uint64_t)buf, (uint64_t)"-[BuddyMesaEnrollmentController viewWillAppear:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, v9, "BuddyMesaController: %s", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v8.receiver = v13;
  v8.super_class = (Class)BuddyMesaEnrollmentController;
  [(BuddyMesaEnrollmentController *)&v8 viewWillAppear:v11];
  unsigned __int8 v3 = [(BuddyMesaEnrollmentController *)v13 paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v3 clearActionForFeature:12];

  id v4 = [(BuddyMesaEnrollmentController *)v13 view];
  id v5 = [v4 window];
  id v6 = [v5 windowScene];
  id v7 = [v6 activationState];

  if (!v7) {
    [(BuddyMesaEnrollmentController *)v13 beginEnrollment];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)BuddyMesaEnrollmentController;
  [(BuddyMesaEnrollmentController *)&v3 viewDidDisappear:a3];
  [(BuddyMesaEnrollmentController *)v6 endEnrollment];
}

- (void)beginEnrollment
{
  v19 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    os_log_type_t v3 = v17;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "BuddyMesaController: Beginning enrollment", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  id v15 = [sub_100096584() sharedInstance];
  id v14 = [v15 getEnrollUIViewController:1 bundleName:0];
  if (v14)
  {
    [(BuddyMesaEnrollmentController *)v19 resetAuthContext];
    BOOL v4 = [(BuddyMesaEnrollmentController *)v19 authContext];
    id location = [(LAContext *)v4 externalizedContext];

    if (location) {
      [v14 setProperty:location forKey:@"credset"];
    }
    id v5 = [(BuddyMesaEnrollmentController *)v19 menuButtonPressedBlock];
    id v6 = objc_retainBlock(v5);
    [v14 setProperty:v6 forKey:@"MENU_ACTION"];

    [v14 setProperty:&__kCFBooleanTrue forKey:@"IN_BUDDY"];
    id v7 = [sub_10009669C() manager];
    [v14 setBiometricKit:v7];

    [v14 setDelegate:v19];
    [(BuddyMesaEnrollmentController *)v19 addChildViewController:v14];
    id v8 = [v14 view];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v9 = [(BuddyMesaEnrollmentController *)v19 view];
    id v10 = [v14 view];
    [v9 addSubview:v10];

    id v11 = [v14 view];
    id v12 = [(BuddyMesaEnrollmentController *)v19 view];
    [v11 pinToEdges:v12];

    [v14 didMoveToParentViewController:v19];
    [(BuddyMesaEnrollmentController *)v19 setEnrollController:v14];
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
}

- (void)endEnrollment
{
  BOOL v4 = self;
  location[1] = (id)a2;
  location[0] = [(BuddyMesaEnrollmentController *)self enrollController];
  [location[0] beginAppearanceTransition:0 animated:1];
  [location[0] willMoveToParentViewController:0];
  id v2 = [location[0] view];
  [v2 removeFromSuperview];

  [location[0] removeFromParentViewController];
  [location[0] endAppearanceTransition];
  [location[0] setDelegate:0];
  [(BuddyMesaEnrollmentController *)v4 setEnrollController:0];
  objc_storeStrong(location, 0);
}

- (void)restartEnrollment
{
  id v6 = self;
  location[1] = (id)a2;
  [(BuddyMesaEnrollmentController *)self deleteIdentity];
  [(BuddyMesaEnrollmentController *)v6 resetAuthContext];
  id v2 = [(BuddyMesaEnrollmentController *)v6 authContext];
  location[0] = [(LAContext *)v2 externalizedContext];

  if (location[0])
  {
    os_log_type_t v3 = [(BuddyMesaEnrollmentController *)v6 enrollController];
    [(BiometricKitUIEnrollViewController *)v3 setProperty:location[0] forKey:@"credset"];
  }
  BOOL v4 = [(BuddyMesaEnrollmentController *)v6 enrollController];
  [(BiometricKitUIEnrollViewController *)v4 restartEnroll];

  [(BuddyMesaEnrollmentController *)v6 resetLeftNavigationItem];
  objc_storeStrong(location, 0);
}

- (void)deleteIdentity
{
  id v6 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_100095D98((uint64_t)buf, (uint64_t)"-[BuddyMesaEnrollmentController deleteIdentity]");
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "BuddyMesaController: %s", buf, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  id v2 = [(BuddyMesaEnrollmentController *)v6 identity];

  if (v2)
  {
    os_log_type_t v3 = +[PKBiometrics sharedInstance];
    BOOL v4 = [(BuddyMesaEnrollmentController *)v6 identity];
    [(PKBiometrics *)v3 removeIdentity:v4];

    [(BuddyMesaEnrollmentController *)v6 setIdentity:0];
  }
}

- (id)cancelLeftNavigationItem
{
  if (!self->_cancelLeftNavigationItem)
  {
    id v2 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:@"restartEnrollment"];
    cancelLeftNavigationItem = self->_cancelLeftNavigationItem;
    self->_cancelLeftNavigationItem = v2;
  }
  BOOL v4 = self->_cancelLeftNavigationItem;

  return v4;
}

- (void)resetLeftNavigationItem
{
  id v2 = [(BuddyMesaEnrollmentController *)self navigationItem];
  id v3 = [v2 leftBarButtonItem];
  id v4 = [(BuddyMesaEnrollmentController *)self cancelLeftNavigationItem];
  unsigned __int8 v5 = [v3 isEqual:v4];

  if (v5)
  {
    id v6 = [(BuddyMesaEnrollmentController *)self navigationItem];
    [v6 performSelector:"setLeftBarButtonItem:animated:" withObject:0 withObject:&__kCFBooleanTrue];

    id v7 = [(BuddyMesaEnrollmentController *)self navigationItem];
    [v7 setHidesBackButton:0];
  }
}

- (void)completeMesaController
{
  id v14 = self;
  SEL v13 = a2;
  self->_enrollComplete = 1;
  id v2 = [(BuddyMesaEnrollmentController *)v14 buddyPreferences];
  [(BYPreferencesController *)v2 setObject:&__kCFBooleanTrue forKey:@"Mesa2Presented"];

  id v3 = [(BuddyMesaEnrollmentController *)v14 capabilities];
  unsigned __int8 v4 = [(BYCapabilities *)v3 isTouchIDEnrolled];

  char v12 = v4 & 1;
  if (v4)
  {
    unsigned __int8 v5 = [(BuddyMesaEnrollmentController *)v14 flowSkipController];
    [(BYFlowSkipController *)v5 didCompleteFlow:BYFlowSkipIdentifierTouchID];

    id v6 = [(BuddyMesaEnrollmentController *)v14 passcodeCacheManager];
    id v11 = [(BYPasscodeCacheManager *)v6 cachedPasscode];

    id v7 = [(BuddyMesaEnrollmentController *)v14 managedConfiguration];
    [(MCProfileConnection *)v7 setFingerprintUnlockAllowed:1 passcode:v11 completion:0];

    objc_storeStrong(&v11, 0);
  }
  id v8 = [(BuddyMesaEnrollmentController *)v14 paneFeatureAnalyticsManager];
  id v9 = +[NSNumber numberWithBool:v12 & 1];
  [(BYPaneFeatureAnalyticsManager *)v8 recordActionWithValue:v9 forFeature:12];

  id v10 = [(BuddyMesaEnrollmentController *)v14 delegate];
  [(BFFFlowItemDelegate *)v10 flowItemDone:v14];
}

- (void)enrollResult:(int)a3 bkIdentity:(id)a4
{
  v18 = self;
  SEL v17 = a2;
  int v16 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10005A060(buf, v16);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "BuddyMesaController: Enroll result: %d", buf, 8u);
  }
  objc_storeStrong((id *)&oslog, 0);
  switch(v16)
  {
    case 0:
      v18->_enrollComplete = 0;
      [(BuddyMesaEnrollmentController *)v18 resetLeftNavigationItem];
      break;
    case 1:
      if (location)
      {
        [(BuddyMesaEnrollmentController *)v18 setIdentity:location];
        unsigned __int8 v4 = +[PKBiometrics sharedInstance];
        id v5 = +[PSBiometricIdentity nextIdentityName];
        [(PKBiometrics *)v4 setName:v5 forIdentity:location];
      }
      break;
    case 3:
      if (location)
      {
        id v6 = +[PKBiometrics sharedInstance];
        [(PKBiometrics *)v6 removeIdentity:location];

        [(BuddyMesaEnrollmentController *)v18 setIdentity:0];
      }
      id v7 = [(BuddyMesaEnrollmentController *)v18 flowSkipController];
      [(BYFlowSkipController *)v7 didSkipFlow:BYFlowSkipIdentifierTouchID];

      [(BuddyMesaEnrollmentController *)v18 completeMesaController];
      break;
    case 4:
      [(BuddyMesaEnrollmentController *)v18 completeMesaController];
      break;
    case 9:
      if (location)
      {
        id v8 = +[PKBiometrics sharedInstance];
        [(PKBiometrics *)v8 removeIdentity:location];

        [(BuddyMesaEnrollmentController *)v18 setIdentity:0];
      }
      id v9 = [(BuddyMesaEnrollmentController *)v18 enrollController];
      [(BiometricKitUIEnrollViewController *)v9 restartEnroll];

      break;
    case 10:
      [(BuddyMesaEnrollmentController *)v18 setIdentity:0];
      id v10 = [(BuddyMesaEnrollmentController *)v18 navigationItem];
      +[NSObject cancelPreviousPerformRequestsWithTarget:v10 selector:"setLeftBarButtonItem:" object:0];

      id v11 = [(BuddyMesaEnrollmentController *)v18 navigationItem];
      [v11 setHidesBackButton:1];

      id v12 = [(BuddyMesaEnrollmentController *)v18 navigationItem];
      id v13 = [(BuddyMesaEnrollmentController *)v18 cancelLeftNavigationItem];
      [v12 setLeftBarButtonItem:v13 animated:1];

      break;
    default:
      break;
  }
  objc_storeStrong(&location, 0);
}

- (void)generateAuthToken
{
  id v5 = self;
  location[1] = (id)a2;
  [(BuddyMesaEnrollmentController *)self resetAuthContext];
  id v2 = [(BuddyMesaEnrollmentController *)v5 authContext];
  location[0] = [(LAContext *)v2 externalizedContext];

  if (location[0])
  {
    id v3 = [(BuddyMesaEnrollmentController *)v5 enrollController];
    [(BiometricKitUIEnrollViewController *)v3 setProperty:location[0] forKey:@"credset"];
  }
  objc_storeStrong(location, 0);
}

- (void)resetAuthContext
{
  id v12 = self;
  location[1] = (id)a2;
  [(BuddyMesaEnrollmentController *)self setAuthContext:0];
  id v2 = [(BuddyMesaEnrollmentController *)v12 managedConfiguration];
  char v3 = [(MCProfileConnection *)v2 isPasscodeSet] ^ 1;

  if ((v3 & 1) == 0)
  {
    unsigned __int8 v4 = [(BuddyMesaEnrollmentController *)v12 passcodeCacheManager];
    id v5 = [(BYPasscodeCacheManager *)v4 cachedPasscode];
    BOOL v6 = v5 == 0;

    if (v6)
    {
      location[0] = objc_alloc_init((Class)BYBuddyDaemonGeneralClient);
      id v7 = [location[0] fetchAuthenticationContextForBiometric];
      [(BuddyMesaEnrollmentController *)v12 setAuthContext:v7];

      id v8 = [(BuddyMesaEnrollmentController *)v12 authContext];
      [(LAContext *)v8 setUiDelegate:v12];

      objc_storeStrong(location, 0);
    }
    else
    {
      id v9 = objc_alloc_init((Class)LAContext);
      [(BuddyMesaEnrollmentController *)v12 setAuthContext:v9];

      id v10 = [(BuddyMesaEnrollmentController *)v12 authContext];
      [(LAContext *)v10 setUiDelegate:v12];

      [(BuddyMesaEnrollmentController *)v12 contextEvaluatePolicy];
    }
  }
}

- (void)contextEvaluatePolicy
{
  id v15 = self;
  location[1] = (id)a2;
  id v2 = [(BuddyMesaEnrollmentController *)self authContext];
  BOOL v3 = v2 == 0;

  if (!v3)
  {
    location[0] = 0;
    unsigned __int8 v4 = [(BuddyMesaEnrollmentController *)v15 authContext];
    SEL v17 = &off_1002C1688;
    v18 = &off_1002C16A0;
    id v5 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    id obj = 0;
    id v6 = [(LAContext *)v4 evaluatePolicy:1007 options:v5 error:&obj];
    objc_storeStrong(location, obj);

    if (location[0])
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        char v10 = 0;
        char v8 = 0;
        if (_BYIsInternalInstall())
        {
          id v7 = (NSString *)location[0];
        }
        else if (location[0])
        {
          id v11 = [location[0] domain];
          char v10 = 1;
          id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v11, [location[0] code]);
          id v9 = v7;
          char v8 = 1;
        }
        else
        {
          id v7 = 0;
        }
        sub_10004BB7C((uint64_t)buf, (uint64_t)v7);
        _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Evaluate policy failed: %{public}@", buf, 0xCu);
        if (v8) {

        }
        if (v10) {
      }
        }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_storeStrong(location, 0);
  }
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
  v25 = self;
  SEL v24 = a2;
  int64_t v23 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v21 = 0;
  objc_storeStrong(&v21, a5);
  if (v23 == 2)
  {
    id v6 = [location objectForKey:&off_1002C16B8];
    unsigned __int8 v7 = [v6 BOOLValue];

    if (v7)
    {
      char v8 = [(BuddyMesaEnrollmentController *)v25 passcodeCacheManager];
      id v9 = [(BYPasscodeCacheManager *)v8 cachedPasscode];

      if (v9)
      {
        char v10 = [(BuddyMesaEnrollmentController *)v25 authContext];
        id v11 = [(BuddyMesaEnrollmentController *)v25 passcodeCacheManager];
        id v12 = [(BYPasscodeCacheManager *)v11 cachedPasscode];
        id v13 = [v12 dataUsingEncoding:4];
        int64_t v14 = v23;
        id v15 = _NSConcreteStackBlock;
        int v16 = -1073741824;
        int v17 = 0;
        v18 = sub_100097868;
        v19 = &unk_1002B0C80;
        id v20 = v21;
        [(LAContext *)v10 setCredential:v13 forProcessedEvent:v14 credentialType:-1 reply:&v15];

        objc_storeStrong(&v20, 0);
      }
      else
      {
        (*((void (**)(id, void, void))v21 + 2))(v21, 0, 0);
      }
    }
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&location, 0);
}

- (id)menuButtonPressedBlock
{
  return self->_menuButtonPressedBlock;
}

- (void)setMenuButtonPressedBlock:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
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

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (BFFFlowItemDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BFFFlowItemDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BiometricKitUIEnrollViewController)enrollController
{
  return self->_enrollController;
}

- (void)setEnrollController:(id)a3
{
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (BKIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end