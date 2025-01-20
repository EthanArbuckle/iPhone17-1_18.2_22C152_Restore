@interface SUSUIRemoteEmergencyCallContainerViewController
+ (BOOL)_isSecureForRemoteViewService;
- (SUSUIRemoteEmergencyCallContainerViewController)init;
- (unint64_t)supportedInterfaceOrientations;
- (void)_fireActionWithResponseIfNecessary:(BOOL)a3;
- (void)_setRootViewController:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)dismissEmergencyCallViewController:(id)a3;
- (void)emergencyCallViewController:(id)a3 didExitWithError:(id)a4;
- (void)handleLockButtonPressed;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUSUIRemoteEmergencyCallContainerViewController

- (SUSUIRemoteEmergencyCallContainerViewController)init
{
  SEL v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  v4 = [(SUSUIRemoteEmergencyCallContainerViewController *)&v6 init];
  v8 = v4;
  objc_storeStrong((id *)&v8, v4);
  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)SUSUILogEmergencyCallUI();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000765C((uint64_t)v9, (uint64_t)v8);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Created SUSUIRemoteEmergencyCallContainerViewController: %@", v9, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  v3 = v8;
  objc_storeStrong((id *)&v8, 0);
  return v3;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)loadView
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = (id)SUSUILogEmergencyCallUI();
  os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t v13 = v16;
    sub_100005A54(v15);
    _os_log_impl((void *)&_mh_execute_header, log, v13, "Creating view for SUSUIRemoteEmergencyCallContainerViewController", v15, 2u);
  }
  objc_storeStrong(location, 0);
  id v6 = objc_alloc((Class)UIView);
  SEL v7 = +[UIScreen mainScreen];
  [(UIScreen *)v7 bounds];
  id v14 = [v6 initWithFrame:v2, v3, v4, v5];

  id v8 = v14;
  v9 = +[UIColor clearColor];
  [v8 setBackgroundColor:];

  [v14 setAutoresizingMask:18];
  [v14 setOpaque:0];
  id v10 = [v14 layer];
  [v10 setAllowsGroupBlending:0];

  id v11 = [v14 layer];
  [v11 setAllowsGroupOpacity:0];

  [(SUSUIRemoteEmergencyCallContainerViewController *)v18 setView:v14];
  objc_storeStrong(&v14, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  [(SUSUIRemoteEmergencyCallContainerViewController *)&v5 viewWillAppear:a3];
  os_log_t oslog = (os_log_t)(id)SUSUILogEmergencyCallUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000A54C((uint64_t)v9, (uint64_t)"-[SUSUIRemoteEmergencyCallContainerViewController viewWillAppear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s:%@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  [(SUSUIRemoteEmergencyCallContainerViewController *)&v5 viewDidAppear:a3];
  os_log_t oslog = (os_log_t)(id)SUSUILogEmergencyCallUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000A54C((uint64_t)v9, (uint64_t)"-[SUSUIRemoteEmergencyCallContainerViewController viewDidAppear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s:%@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  [(SUSUIRemoteEmergencyCallContainerViewController *)&v5 viewWillDisappear:a3];
  os_log_t oslog = (os_log_t)(id)SUSUILogEmergencyCallUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000A54C((uint64_t)v9, (uint64_t)"-[SUSUIRemoteEmergencyCallContainerViewController viewWillDisappear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s:%@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  os_log_t oslog = (os_log_t)(id)SUSUILogEmergencyCallUI();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000A54C((uint64_t)v10, (uint64_t)"-[SUSUIRemoteEmergencyCallContainerViewController viewDidDisappear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, type, "%s:%@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4.receiver = v9;
  v4.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  [(SUSUIRemoteEmergencyCallContainerViewController *)&v4 viewDidDisappear:v7];
  [(SUSUIRemoteEmergencyCallContainerViewController *)v9 _fireActionWithResponseIfNecessary:0];
}

- (void)viewDidLoad
{
  objc_super v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  [(SUSUIRemoteEmergencyCallContainerViewController *)&v2 viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  objc_super v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSUIRemoteEmergencyCallContainerViewController;
  [(SUSUIRemoteEmergencyCallContainerViewController *)&v2 didReceiveMemoryWarning];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  objc_super v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  SEL v8 = sub_10000C290;
  v9 = &unk_100018A68;
  id v10 = v14;
  id v11 = v12;
  +[SUSUIRemoteEmergencyCallViewController requestEmergencyCallControllerWithCompletion:](SUSUIRemoteEmergencyCallViewController, "requestEmergencyCallControllerWithCompletion:");
  objc_storeStrong(&v11, 0);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)handleLockButtonPressed
{
  v9 = self;
  v8[1] = (id)a2;
  dispatch_queue_t queue = &_dispatch_main_q;
  SEL v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_10000C568;
  int v7 = &unk_100018530;
  v8[0] = v9;
  dispatch_async(queue, &v3);

  objc_storeStrong(v8, 0);
}

- (void)dismissEmergencyCallViewController:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = (id)SUSUILogEmergencyCallUI();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
  {
    sub_100009DA8((uint64_t)v19, (uint64_t)"-[SUSUIRemoteEmergencyCallContainerViewController dismissEmergencyCallViewController:]");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, v15, "%s", v19, 0xCu);
  }
  objc_storeStrong(&v16, 0);
  v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  id v12 = sub_10000C7FC;
  os_log_type_t v13 = &unk_100018530;
  id v14 = v18;
  SEL v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_10000C85C;
  int v7 = &unk_100018580;
  SEL v8 = v18;
  +[UIView animateWithDuration:&v9 animations:&v3 completion:0.4];
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)emergencyCallViewController:(id)a3 didExitWithError:(id)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  os_log_t oslog = (os_log_t)(id)SUSUILogEmergencyCallUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100009DA8((uint64_t)v10, (uint64_t)"-[SUSUIRemoteEmergencyCallContainerViewController emergencyCallViewController:didExitWithError:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s", v10, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(SUSUIRemoteEmergencyCallContainerViewController *)v9 _fireActionWithResponseIfNecessary:0];
  id v4 = [(SUSUIRemoteEmergencyCallContainerViewController *)v9 _remoteViewControllerProxy];
  [v4 dismiss];

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (unint64_t)supportedInterfaceOrientations
{
  SEL v3 = +[UIDevice currentDevice];
  BOOL v4 = (id)[(UIDevice *)v3 userInterfaceIdiom] != (id)1;

  if (v4) {
    return 2;
  }
  else {
    return 30;
  }
}

- (void)_fireActionWithResponseIfNecessary:(BOOL)a3
{
  if (self->_action)
  {
    [(SUSUIRemoteEmergencyCallAlertAction *)self->_action fireCompletionIfNecessaryForResult:a3];
    objc_storeStrong((id *)&self->_action, 0);
  }
}

- (void)_setRootViewController:(id)a3
{
  os_log_type_t v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = [(SUSUIRemoteEmergencyCallContainerViewController *)v13 view];
  [v7 bounds];
  *(void *)&long long v10 = v3;
  *((void *)&v10 + 1) = v4;
  *(void *)&long long v11 = v5;
  *((void *)&v11 + 1) = v6;

  id v9 = [location[0] view];
  [v9 setFrame:v10, v11];
  [v9 setAutoresizingMask:18];
  [location[0] willMoveToParentViewController:v13];
  id v8 = [(SUSUIRemoteEmergencyCallContainerViewController *)v13 view];
  [v8 addSubview:v9];

  [(SUSUIRemoteEmergencyCallContainerViewController *)v13 addChildViewController:location[0]];
  [location[0] didMoveToParentViewController:v13];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void).cxx_destruct
{
}

@end