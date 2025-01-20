@interface SUSUIRemoteLaggardsUIHostingController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)allowCancel;
- (BOOL)enableSwipeToCancel;
- (BOOL)useNavigationController;
- (Class)laggardsUIActionClass;
- (SUSUILaggardsUIAlertAction)action;
- (SUSUIRemoteLaggardsUIHostingController)init;
- (id)laggardsUIViewControllerForAction:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_configureWithAction:(id)a3 completion:(id)a4;
- (void)_fireActionWithResponseIfNecessary:(BOOL)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didReceiveMemoryWarning;
- (void)handleCancelButtonTapped:(id)a3;
- (void)loadView;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setAllowCancel:(BOOL)a3;
- (void)setEnableSwipeToCancel:(BOOL)a3;
- (void)setUseNavigationController:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SUSUIRemoteLaggardsUIHostingController

- (SUSUIRemoteLaggardsUIHostingController)init
{
  SEL v7 = a2;
  v8 = 0;
  v6.receiver = self;
  v6.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  v4 = [(SUSUIRemoteLaggardsUIHostingController *)&v6 init];
  v8 = v4;
  objc_storeStrong((id *)&v8, v4);
  if (v4)
  {
    os_log_t oslog = (os_log_t)(id)SUSUILogLaggardsUI();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10000765C((uint64_t)v9, (uint64_t)v8);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Created SUSUIRemoteLaggardsUIHostingController: %@", v9, 0xCu);
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
  v15 = self;
  location[1] = (id)a2;
  location[0] = (id)SUSUILogLaggardsUI();
  os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_100009DA8((uint64_t)v16, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController loadView]");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)location[0], v13, "%s: Creating view for SUSUIRemoteLaggardsUIHostingController", v16, 0xCu);
  }
  objc_storeStrong(location, 0);
  id v6 = objc_alloc((Class)UIView);
  SEL v7 = +[UIScreen mainScreen];
  [(UIScreen *)v7 bounds];
  id v12 = [v6 initWithFrame:v2, v3, v4, v5];

  id v8 = v12;
  v9 = +[UIColor clearColor];
  [v8 setBackgroundColor:];

  [v12 setAutoresizingMask:18];
  [v12 setOpaque:0];
  id v10 = [v12 layer];
  [v10 setAllowsGroupBlending:0];

  id v11 = [v12 layer];
  [v11 setAllowsGroupOpacity:0];

  [(SUSUIRemoteLaggardsUIHostingController *)v15 setView:v12];
  objc_storeStrong(&v12, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  [(SUSUIRemoteLaggardsUIHostingController *)&v5 viewWillAppear:a3];
  os_log_t oslog = (os_log_t)(id)SUSUILogLaggardsUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000A54C((uint64_t)v9, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController viewWillAppear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  [(SUSUIRemoteLaggardsUIHostingController *)&v5 viewDidAppear:a3];
  os_log_t oslog = (os_log_t)(id)SUSUILogLaggardsUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000A54C((uint64_t)v9, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController viewDidAppear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v8 = self;
  SEL v7 = a2;
  BOOL v6 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  [(SUSUIRemoteLaggardsUIHostingController *)&v5 viewWillDisappear:a3];
  os_log_t oslog = (os_log_t)(id)SUSUILogLaggardsUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000A54C((uint64_t)v9, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController viewWillDisappear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  os_log_t oslog = (os_log_t)(id)SUSUILogLaggardsUI();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_10000A54C((uint64_t)v10, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController viewDidDisappear:]", (uint64_t)v3);
    _os_log_impl((void *)&_mh_execute_header, oslog, type, "%s: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4.receiver = v9;
  v4.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  [(SUSUIRemoteLaggardsUIHostingController *)&v4 viewDidDisappear:v7];
  [(SUSUIRemoteLaggardsUIHostingController *)v9 _fireActionWithResponseIfNecessary:0];
}

- (void)viewDidLoad
{
  objc_super v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  [(SUSUIRemoteLaggardsUIHostingController *)&v2 viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  objc_super v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSUIRemoteLaggardsUIHostingController;
  [(SUSUIRemoteLaggardsUIHostingController *)&v2 didReceiveMemoryWarning];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = (id)SUSUILogLaggardsUI();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    os_log_type_t type = v12;
    objc_super v5 = v16;
    id v8 = [location[0] actions];
    id v11 = v8;
    sub_100006F34((uint64_t)v17, (uint64_t)v5, (uint64_t)v11);
    _os_log_impl((void *)&_mh_execute_header, log, type, "%@ - configure with context: %@", v17, 0x16u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  id v4 = [location[0] actions];
  id v10 = [v4 anyObject];

  [(SUSUIRemoteLaggardsUIHostingController *)v16 _configureWithAction:v10 completion:v14];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v14, 0);
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

- (id)laggardsUIViewControllerForAction:(id)a3
{
  BOOL v7 = self;
  SEL v6 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  os_log_t oslog = (os_log_t)(id)SUSUILogLaggardsUI();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100009DA8((uint64_t)v8, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController laggardsUIViewControllerForAction:]");
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "%s: Should implement this method in each inheriting class.", v8, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(SUSUIRemoteLaggardsUIHostingController *)v7 doesNotRecognizeSelector:v6];
  objc_storeStrong(&location, 0);
  return 0;
}

- (Class)laggardsUIActionClass
{
  return (Class)objc_opt_class();
}

- (void)_configureWithAction:(id)a3 completion:(id)a4
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v27 = 0;
  objc_storeStrong(&v27, a4);
  id v26 = (id)SUSUILogLaggardsUI();
  os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
  {
    sub_10000A54C((uint64_t)v30, (uint64_t)"-[SUSUIRemoteLaggardsUIHostingController _configureWithAction:completion:]", (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v26, v25, "%s: configuring with action - %@", v30, 0x16u);
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong((id *)&v29->_action, location[0]);
  if ([(SUSUIRemoteLaggardsUIHostingController *)v29 useNavigationController])
  {
    BOOL v4 = (UIViewController *)[(SUSUIRemoteLaggardsUIHostingController *)v29 laggardsUIViewControllerForAction:location[0]];
    rootViewController = v29->_rootViewController;
    v29->_rootViewController = v4;

    id v6 = objc_alloc((Class)OBNavigationController);
    BOOL v7 = (UIViewController *)[v6 initWithRootViewController:v29->_rootViewController];
    presentingViewController = v29->_presentingViewController;
    v29->_presentingViewController = v7;

    if ([(SUSUIRemoteLaggardsUIHostingController *)v29 allowCancel])
    {
      id v9 = objc_alloc((Class)UIBarButtonItem);
      id v24 = [v9 initWithBarButtonSystemItem:1 target:v29 action:"handleCancelButtonTapped:"];
      id v16 = [(UIViewController *)v29->_presentingViewController navigationBar];
      id v15 = [v16 topItem];
      [v15 setRightBarButtonItem:v24];

      objc_storeStrong(&v24, 0);
    }
  }
  else
  {
    id v10 = (UIViewController *)[(SUSUIRemoteLaggardsUIHostingController *)v29 laggardsUIViewControllerForAction:location[0]];
    id v11 = v29->_presentingViewController;
    v29->_presentingViewController = v10;

    objc_storeStrong((id *)&v29->_rootViewController, v29->_presentingViewController);
  }
  if (![(SUSUIRemoteLaggardsUIHostingController *)v29 enableSwipeToCancel]) {
    [(UIViewController *)v29->_presentingViewController setModalInPresentation:1];
  }
  os_log_type_t v12 = [(UIViewController *)v29->_presentingViewController presentationController];
  [(UIPresentationController *)v12 setDelegate:v29];

  id v14 = v29;
  id v13 = v29->_presentingViewController;
  v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  v21 = sub_10000F958;
  v22 = &unk_100018AB8;
  id v23 = v27;
  [(SUSUIRemoteLaggardsUIHostingController *)v14 presentViewController:v13 animated:1 completion:&v18];
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
}

- (void)_fireActionWithResponseIfNecessary:(BOOL)a3
{
  if (self->_action) {
    objc_storeStrong((id *)&self->_action, 0);
  }
}

- (void)handleCancelButtonTapped:(id)a3
{
  int v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_type_t v12 = _NSConcreteStackBlock;
  int v13 = -1073741824;
  int v14 = 0;
  id v15 = sub_10000FBF8;
  id v16 = &unk_100018530;
  v17 = v20;
  id v18 = objc_retainBlock(&v12);
  id v11 = v20->_rootViewController;
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = v11;
    SEL v3 = v20;
    objc_super v5 = _NSConcreteStackBlock;
    int v6 = -1073741824;
    int v7 = 0;
    id v8 = sub_10000FED0;
    id v9 = &unk_100018AE0;
    id v10 = v18;
    [v4 remoteLaggardsUIHostingControllerWillCancelOperation:v3 withCompletionBlock:&v5];
    objc_storeStrong(&v10, 0);
  }
  else
  {
    (*((void (**)(void))v18 + 2))();
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(location, 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_queue_t queue = &_dispatch_main_q;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_100010100;
  id v8 = &unk_100018530;
  id v9 = v11;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (SUSUILaggardsUIAlertAction)action
{
  return self->_action;
}

- (BOOL)useNavigationController
{
  return self->_useNavigationController;
}

- (void)setUseNavigationController:(BOOL)a3
{
  self->_useNavigationController = a3;
}

- (BOOL)enableSwipeToCancel
{
  return self->_enableSwipeToCancel;
}

- (void)setEnableSwipeToCancel:(BOOL)a3
{
  self->_enableSwipeToCancel = a3;
}

- (BOOL)allowCancel
{
  return self->_allowCancel;
}

- (void)setAllowCancel:(BOOL)a3
{
  self->_allowCancel = a3;
}

- (void).cxx_destruct
{
}

@end