@interface FontInstallMainController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (NSString)applicationName;
- (UIImage)applicationIconImage;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)connectToEndpoint:(id)a3;
- (void)doneWithInstallFonts:(BOOL)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setupWithUserInfo:(id)a3 xpcEndpoint:(id)a4 dismissHandler:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FontInstallMainController

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___FontInstallViewServiceProtocol, a2, a1);
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___FontInstallUISceneProtocol, a2, a1);
}

- (void)viewDidAppear:(BOOL)a3
{
  v43 = self;
  SEL v42 = a2;
  BOOL v41 = a3;
  v40.receiver = self;
  v40.super_class = (Class)FontInstallMainController;
  [(FontInstallMainController *)&v40 viewDidAppear:a3];
  v9 = +[UIScreen mainScreen];
  [(UIScreen *)v9 scale];
  id v39 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.FontInstallViewService", 2);

  v10 = +[NSBundle mainBundle];
  id v38 = -[NSBundle localizedStringForKey:value:table:](v10, "localizedStringForKey:value:table:", @"FONT_INSTALL_NOTE");

  v11 = [(FontInstallMainController *)v43 applicationName];
  id v37 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v38, v11);

  v12 = +[NSBundle mainBundle];
  id v36 = [(NSBundle *)v12 localizedStringForKey:@"FONT_INSTALL_TITLE" value:&stru_100014650 table:0];

  v13 = +[NSBundle mainBundle];
  id v35 = [(NSBundle *)v13 localizedStringForKey:@"DONT_INSTALL_BUTTON" value:&stru_100014650 table:0];

  v14 = +[NSBundle mainBundle];
  id v34 = [(NSBundle *)v14 localizedStringForKey:@"INSTALL_BUTTON" value:&stru_100014650 table:0];

  id v33 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v36, v37);
  id v15 = [v33 view];
  [v15 setAccessibilityIdentifier:@"FONT_INSTALL"];

  objc_initWeak(&location, v43);
  id v16 = v35;
  v25 = _NSConcreteStackBlock;
  int v26 = -1073741824;
  int v27 = 0;
  v28 = __43__FontInstallMainController_viewDidAppear___block_invoke;
  v29 = &unk_100014318;
  objc_copyWeak(&v30, &location);
  id v31 = +[UIAlertAction actionWithTitle:v16 style:1 handler:&v25];
  id v8 = v34;
  v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  v21 = __43__FontInstallMainController_viewDidAppear___block_invoke_2;
  v22 = &unk_100014318;
  objc_copyWeak(&v23, &location);
  id v24 = +[UIAlertAction actionWithTitle:v8 style:0 handler:&v18];
  [v33 addAction:v31];
  [v33 addAction:v24];
  id v6 = v33;
  v7 = [IconAndSubIconHeaderViewController alloc];
  id v5 = v39;
  v3 = [(FontInstallMainController *)v43 applicationIconImage];
  v4 = -[IconAndSubIconHeaderViewController initWithIconImage:andSubIconImage:](v7, "initWithIconImage:andSubIconImage:", v5);
  [v6 _setHeaderContentViewController:v4];

  objc_storeStrong((id *)&v43->_vcNav, v33);
  [(FontInstallMainController *)v43 presentViewController:v43->_vcNav animated:1 completion:0];
  id v17 = [(FontInstallMainController *)v43 _remoteViewControllerProxy];
  [v17 setWallpaperTunnelActive:1];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v24, 0);
  objc_destroyWeak(&v23);
  objc_storeStrong(&v31, 0);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
}

void __43__FontInstallMainController_viewDidAppear___block_invoke(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  to[1] = a1;
  objc_copyWeak(to, a1 + 4);
  id WeakRetained = objc_loadWeakRetained(to);

  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained(to);
    [v2 doneWithInstallFonts:0];
  }
  objc_destroyWeak(to);
  objc_storeStrong(location, 0);
}

void __43__FontInstallMainController_viewDidAppear___block_invoke_2(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  to[1] = a1;
  objc_copyWeak(to, a1 + 4);
  id WeakRetained = objc_loadWeakRetained(to);

  if (WeakRetained)
  {
    id v2 = objc_loadWeakRetained(to);
    [v2 doneWithInstallFonts:1];
  }
  objc_destroyWeak(to);
  objc_storeStrong(location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)FontInstallMainController;
  [(FontInstallMainController *)&v4 viewWillAppear:a3];
  id v3 = [(FontInstallMainController *)v7 _remoteViewControllerProxy];
  [v3 setStatusBarHidden:1 withDuration:0.0];
  [v3 setAllowsAlertItems:1];
  objc_storeStrong(&v3, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  SEL v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  if (self->_connection)
  {
    NSLog(@"Install Font Dialog must have been forcibly dismissed.");
    [(FontInstallMainController *)v6 doneWithInstallFonts:0];
  }
  v3.receiver = v6;
  v3.super_class = (Class)FontInstallMainController;
  [(FontInstallMainController *)&v3 viewDidDisappear:v4];
}

- (void)connectToEndpoint:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = objc_alloc_init((Class)NSXPCListenerEndpoint);
  [v15 _setEndpoint:location[0]];
  objc_super v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v15];
  connection = v17->_connection;
  v17->_connection = v3;

  SEL v5 = v17->_connection;
  SEL v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FontInstallViewServiceProtocol];
  -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:");

  objc_initWeak(&v14, v17);
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = __47__FontInstallMainController_connectToEndpoint___block_invoke;
  v11 = &unk_100014228;
  objc_copyWeak(&v12, &v14);
  id v13 = objc_retainBlock(&v7);
  [(NSXPCConnection *)v17->_connection setInvalidationHandler:v13];
  [(NSXPCConnection *)v17->_connection setInterruptionHandler:v13];
  [(NSXPCConnection *)v17->_connection resume];
  objc_storeStrong(&v13, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
}

void __47__FontInstallMainController_connectToEndpoint___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0]) {
    NSLog(@"FontInstallMainController invalidated.");
  }
  objc_storeStrong(location, 0);
}

- (void)setupWithUserInfo:(id)a3 xpcEndpoint:(id)a4 dismissHandler:(id)a5
{
  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v19 = 0;
  objc_storeStrong(&v19, a4);
  id v18 = 0;
  objc_storeStrong(&v18, a5);
  id v17 = [location[0] objectForKey:@"identifier"];
  id v5 = objc_alloc((Class)LSApplicationRecord);
  id v16 = [v5 initWithBundleIdentifier:v17 allowPlaceholder:0 error:0];
  id v14 = v17;
  id v15 = +[UIScreen mainScreen];
  [(UIScreen *)v15 scale];
  SEL v6 = (UIImage *)+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v14, 0);
  applicationIconImage = v21->_applicationIconImage;
  v21->_applicationIconImage = v6;

  int v8 = (NSString *)[v16 localizedName];
  applicationName = v21->_applicationName;
  v21->_applicationName = v8;

  id v10 = objc_retainBlock(v18);
  id dismissHandler = v21->_dismissHandler;
  v21->_id dismissHandler = v10;

  [(FontInstallMainController *)v21 connectToEndpoint:v19];
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = [(FontInstallMainController *)v13 _remoteViewControllerProxyWithErrorHandler:&__block_literal_global_2];
  id v7 = [(FontInstallMainController *)v13 view];
  id v6 = [v7 window];
  id v5 = [v6 windowScene];
  [v10 setLaunchingInterfaceOrientation:[v5 interfaceOrientation]];

  [v10 setReachabilityDisabled:1];
  [v10 setAllowsAlertStacking:0];
  int v8 = v13;
  id v9 = [location[0] xpcEndpoint];
  -[FontInstallMainController connectToEndpoint:](v8, "connectToEndpoint:");

  if (v11) {
    (*((void (**)(void))v11 + 2))();
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

void __61__FontInstallMainController_configureWithContext_completion___block_invoke(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(@"FontInstall configureWithContext - error - %@", location[0]);
  objc_storeStrong(location, 0);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = [(FontInstallMainController *)v16 _remoteViewControllerProxyWithErrorHandler:&__block_literal_global_134];
  [v13 setStatusBarHidden:1 withDuration:0.4];
  id v9 = [location[0] userInfo];
  id v12 = [v9 objectForKey:@"identifier"];

  id v11 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v12 allowPlaceholder:0 error:0];
  id v10 = +[UIScreen mainScreen];
  [(UIScreen *)v10 scale];
  BOOL v4 = (UIImage *)+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v12, 0);
  applicationIconImage = v16->_applicationIconImage;
  v16->_applicationIconImage = v4;

  id v6 = (NSString *)[v11 localizedName];
  applicationName = v16->_applicationName;
  v16->_applicationName = v6;

  if (v14) {
    (*((void (**)(void))v14 + 2))();
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __72__FontInstallMainController_prepareForActivationWithContext_completion___block_invoke(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(@"FontInstall prepareForActivationWithContext - error - %@", location[0]);
  objc_storeStrong(location, 0);
}

- (void)doneWithInstallFonts:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  NSLog(@"FontInstall doneWithInstallFonts:%d", a3);
  id v10 = [(NSXPCConnection *)v13->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_142];
  [v10 doneWithInstallFonts:v11];
  objc_super v3 = v13;
  BOOL v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __50__FontInstallMainController_doneWithInstallFonts___block_invoke_2;
  int v8 = &unk_1000142D0;
  id v9 = v13;
  -[FontInstallMainController dismissViewControllerAnimated:completion:](v3, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
}

void __50__FontInstallMainController_doneWithInstallFonts___block_invoke(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(@"FontInstallViewService connection error - %@", location[0]);
  objc_storeStrong(location, 0);
}

void __50__FontInstallMainController_doneWithInstallFonts___block_invoke_2(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  [*((id *)a1[4] + 2) invalidate];
  objc_storeStrong((id *)a1[4] + 2, 0);
  if (*((void *)a1[4] + 3)) {
    (*(void (**)(void))(*((void *)a1[4] + 3) + 16))();
  }
  v2[0] = [a1[4] _remoteViewControllerProxy];
  [v2[0] deactivate];
  [v2[0] invalidate];
  objc_storeStrong((id *)a1[4] + 1, 0);
  objc_storeStrong((id *)a1[4] + 4, 0);
  objc_storeStrong(v2, 0);
}

- (UIImage)applicationIconImage
{
  return self->_applicationIconImage;
}

- (NSString)applicationName
{
  return self->_applicationName;
}

- (void).cxx_destruct
{
}

@end