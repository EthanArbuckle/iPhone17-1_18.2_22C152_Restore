@interface DeleteAppFontsMainController
- (NSArray)registeredFonts;
- (NSString)applicationName;
- (UIImage)applicationIconImage;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)connectToEndpoint:(id)a3;
- (void)doneWithDeleteAppFonts:(BOOL)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setupWithUserInfo:(id)a3 xpcEndpoint:(id)a4 dismissHandler:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DeleteAppFontsMainController

- (void)viewDidAppear:(BOOL)a3
{
  v18 = self;
  SEL v17 = a2;
  BOOL v16 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DeleteAppFontsMainController;
  [(DeleteAppFontsMainController *)&v15 viewDidAppear:a3];
  id location = @"Main_iPhone";
  id v19 = 0;
  v10 = +[UIDevice currentDevice];
  id v11 = [(UIDevice *)v10 userInterfaceIdiom];

  id v19 = v11;
  BOOL v12 = 1;
  if (v11 != (id)1) {
    BOOL v12 = v19 == (id)5;
  }
  if (v12) {
    objc_storeStrong(&location, @"Main");
  }
  id v9 = [(DeleteAppFontsMainController *)v18 view];
  id v8 = [v9 window];
  id v7 = [v8 _rootSheetPresentationController];
  [v7 _setShouldScaleDownBehindDescendantSheets:0];

  v3 = +[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", location);
  storyboard = v18->_storyboard;
  v18->_storyboard = v3;

  v5 = [(UIStoryboard *)v18->_storyboard instantiateViewControllerWithIdentifier:@"DeleteAppFontsDialog"];
  vcNav = v18->_vcNav;
  v18->_vcNav = v5;

  [(DeleteAppFontsViewController *)v18->_vcNav setModalTransitionStyle:2];
  [(DeleteAppFontsViewController *)v18->_vcNav setModalPresentationStyle:5];
  [(DeleteAppFontsViewController *)v18->_vcNav setMainController:v18];
  [(DeleteAppFontsMainController *)v18 presentViewController:v18->_vcNav animated:1 completion:0];
  id v13 = [(DeleteAppFontsMainController *)v18 _remoteViewControllerProxy];
  [v13 setWallpaperTunnelActive:1];
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)DeleteAppFontsMainController;
  [(DeleteAppFontsMainController *)&v4 viewWillAppear:a3];
  id v3 = [(DeleteAppFontsMainController *)v7 _remoteViewControllerProxy];
  [v3 setStatusBarHidden:1 withDuration:0.0];
  [v3 setAllowsAlertItems:1];
  objc_storeStrong(&v3, 0);
}

- (void)connectToEndpoint:(id)a3
{
  SEL v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = objc_alloc_init((Class)NSXPCListenerEndpoint);
  [v15 _setEndpoint:location[0]];
  id v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v15];
  connection = v17->_connection;
  v17->_connection = v3;

  BOOL v5 = v17->_connection;
  SEL v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FontInstallViewServiceProtocol];
  -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:");

  objc_initWeak(&v14, v17);
  id v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = __50__DeleteAppFontsMainController_connectToEndpoint___block_invoke;
  id v11 = &unk_100014228;
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

void __50__DeleteAppFontsMainController_connectToEndpoint___block_invoke(id *a1)
{
  id location[2] = a1;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0]) {
    NSLog(@"DeleteAppFontsViewController invalidated.");
  }
  objc_storeStrong(location, 0);
}

- (void)setupWithUserInfo:(id)a3 xpcEndpoint:(id)a4 dismissHandler:(id)a5
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  id v19 = 0;
  objc_storeStrong(&v19, a5);
  id v18 = [location[0] objectForKey:@"deleteAppIdentifier"];
  if (!v18)
  {
    id v18 = [location[0] objectForKey:@"identifier"];
  }
  id v17 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v18 allowPlaceholder:0 error:0];
  id v13 = v18;
  id v14 = +[UIScreen mainScreen];
  [(UIScreen *)v14 scale];
  BOOL v5 = (UIImage *)+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v13, 0);
  applicationIconImage = v22->_applicationIconImage;
  v22->_applicationIconImage = v5;

  id v7 = (NSString *)[v17 localizedName];
  applicationName = v22->_applicationName;
  v22->_applicationName = v7;

  int v9 = (NSArray *)[location[0] objectForKey:@"registeredFonts"];
  registeredFonts = v22->_registeredFonts;
  v22->_registeredFonts = v9;

  id v11 = objc_retainBlock(v19);
  id dismissHandler = v22->_dismissHandler;
  v22->_id dismissHandler = v11;

  [(DeleteAppFontsMainController *)v22 connectToEndpoint:v20];
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
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
  id v10 = [(DeleteAppFontsMainController *)v13 _remoteViewControllerProxyWithErrorHandler:&__block_literal_global];
  id v7 = [(DeleteAppFontsMainController *)v13 view];
  id v6 = [v7 window];
  id v5 = [v6 windowScene];
  [v10 setLaunchingInterfaceOrientation:[v5 interfaceOrientation]];

  [v10 setReachabilityDisabled:1];
  [v10 setAllowsAlertStacking:0];
  int v8 = v13;
  id v9 = [location[0] xpcEndpoint];
  -[DeleteAppFontsMainController connectToEndpoint:](v8, "connectToEndpoint:");

  if (v11) {
    (*((void (**)(void))v11 + 2))();
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

void __64__DeleteAppFontsMainController_configureWithContext_completion___block_invoke(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(@"DeleteAppFonts configureWithContext - error - %@", location[0]);
  objc_storeStrong(location, 0);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = [(DeleteAppFontsMainController *)v20 _remoteViewControllerProxyWithErrorHandler:&__block_literal_global_83];
  [v17 setStatusBarHidden:1 withDuration:0.4];
  id v14 = [location[0] userInfo];
  id v16 = [v14 objectForKey:@"deleteAppIdentifier"];

  if (!v16)
  {
    id v12 = [location[0] userInfo];
    id v16 = [v12 objectForKey:@"identifier"];
  }
  id v15 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v16 allowPlaceholder:0 error:0];
  id v10 = +[UIScreen mainScreen];
  [(UIScreen *)v10 scale];
  objc_super v4 = (UIImage *)+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v16, 0);
  applicationIconImage = v20->_applicationIconImage;
  v20->_applicationIconImage = v4;

  id v6 = (NSString *)[v15 localizedName];
  applicationName = v20->_applicationName;
  v20->_applicationName = v6;

  id v11 = [location[0] userInfo];
  int v8 = (NSArray *)[v11 objectForKey:@"registeredFonts"];
  registeredFonts = v20->_registeredFonts;
  v20->_registeredFonts = v8;

  if (v18) {
    (*((void (**)(void))v18 + 2))();
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

void __75__DeleteAppFontsMainController_prepareForActivationWithContext_completion___block_invoke(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(@"DeleteAppFonts prepareForActivationWithContext - error - %@", location[0]);
  objc_storeStrong(location, 0);
}

- (void)doneWithDeleteAppFonts:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  NSLog(@"DeleteAppFonts doneWithDeleteAppFonts:%d", a3);
  id v10 = [(NSXPCConnection *)v13->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_91];
  [v10 doneWithDeleteAppFonts:v11];
  id v3 = v13;
  objc_super v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = __55__DeleteAppFontsMainController_doneWithDeleteAppFonts___block_invoke_2;
  int v8 = &unk_1000142D0;
  id v9 = v13;
  -[DeleteAppFontsMainController dismissViewControllerAnimated:completion:](v3, "dismissViewControllerAnimated:completion:", 1);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
}

void __55__DeleteAppFontsMainController_doneWithDeleteAppFonts___block_invoke(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(@"FontInstallViewService connection error - %@", location[0]);
  objc_storeStrong(location, 0);
}

void __55__DeleteAppFontsMainController_doneWithDeleteAppFonts___block_invoke_2(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  [*((id *)a1[4] + 3) invalidate];
  objc_storeStrong((id *)a1[4] + 3, 0);
  if (*((void *)a1[4] + 4)) {
    (*(void (**)(void))(*((void *)a1[4] + 4) + 16))();
  }
  v2[0] = [a1[4] _remoteViewControllerProxy];
  [v2[0] deactivate];
  [v2[0] invalidate];
  objc_storeStrong((id *)a1[4] + 2, 0);
  objc_storeStrong((id *)a1[4] + 1, 0);
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

- (NSArray)registeredFonts
{
  return self->_registeredFonts;
}

- (void).cxx_destruct
{
}

@end