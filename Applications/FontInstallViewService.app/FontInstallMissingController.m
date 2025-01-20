@interface FontInstallMissingController
- (NSArray)input;
- (NSMutableArray)output;
- (void)configureControllersForInput;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)connectToEndpoint:(id)a3;
- (void)doneWithMissingFonts:(id)a3 withDismissAnimated:(BOOL)a4;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)setInput:(id)a3;
- (void)setOutput:(id)a3;
- (void)setupWithUserInfo:(id)a3 xpcEndpoint:(id)a4 dismissHandler:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FontInstallMissingController

- (void)viewDidAppear:(BOOL)a3
{
  v44 = self;
  SEL v43 = a2;
  BOOL v42 = a3;
  v41.receiver = self;
  v41.super_class = (Class)FontInstallMissingController;
  [(FontInstallMissingController *)&v41 viewDidAppear:a3];
  id location = @"Main_iPhone";
  id v45 = 0;
  v19 = +[UIDevice currentDevice];
  id v20 = [(UIDevice *)v19 userInterfaceIdiom];

  id v45 = v20;
  BOOL v21 = 1;
  if (v20 != (id)1) {
    BOOL v21 = v45 == (id)5;
  }
  if (v21) {
    objc_storeStrong(&location, @"Main");
  }
  id v15 = [(FontInstallMissingController *)v44 view];
  id v14 = [v15 window];
  id v13 = [v14 _rootSheetPresentationController];
  [v13 _setShouldScaleDownBehindDescendantSheets:0];

  v3 = +[UIStoryboard storyboardWithName:location bundle:0];
  storyboard = v44->_storyboard;
  v44->_storyboard = v3;

  v5 = [(UIStoryboard *)v44->_storyboard instantiateViewControllerWithIdentifier:@"MissingFontsNavigation"];
  detailPresentationController = v44->_detailPresentationController;
  v44->_detailPresentationController = v5;

  v16 = +[UIScreen mainScreen];
  [(UIScreen *)v16 scale];
  v7 = (UIImage *)+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.FontInstallViewService", 2);
  mainIcon = v44->_mainIcon;
  v44->_mainIcon = v7;

  id v39 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v44->_alertTitle, v44->_messageText);
  id v17 = [v39 view];
  [v17 setAccessibilityIdentifier:@"MISSING_FONTS"];

  objc_initWeak(&v38, v44);
  cancelTitle = v44->_cancelTitle;
  v31 = _NSConcreteStackBlock;
  int v32 = -1073741824;
  int v33 = 0;
  v34 = __46__FontInstallMissingController_viewDidAppear___block_invoke;
  v35 = &unk_100014318;
  objc_copyWeak(&v36, &v38);
  id v37 = +[UIAlertAction actionWithTitle:cancelTitle style:1 handler:&v31];
  noncancelTitle = v44->_noncancelTitle;
  v23 = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  v26 = __46__FontInstallMissingController_viewDidAppear___block_invoke_2;
  v27 = &unk_100014340;
  objc_copyWeak(&v29, &v38);
  v28 = v44;
  id v30 = +[UIAlertAction actionWithTitle:noncancelTitle style:0 handler:&v23];
  [v39 addAction:v37];
  [v39 addAction:v30];
  id v10 = v39;
  v11 = [IconAndSubIconHeaderViewController alloc];
  v9 = [(IconAndSubIconHeaderViewController *)v11 initWithIconImage:v44->_mainIcon andSubIconImage:v44->_subIcon];
  [v10 _setHeaderContentViewController:v9];

  objc_storeStrong((id *)&v44->_initialViewController, v39);
  [(FontInstallMissingController *)v44 presentViewController:v44->_initialViewController animated:1 completion:0];
  id v22 = [(FontInstallMissingController *)v44 _remoteViewControllerProxy];
  [v22 setWallpaperTunnelActive:1];
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong((id *)&v28, 0);
  objc_destroyWeak(&v29);
  objc_storeStrong(&v37, 0);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&location, 0);
}

void __46__FontInstallMissingController_viewDidAppear___block_invoke(id *a1, void *a2)
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
    [v2 doneWithMissingFonts:&__NSArray0__struct withDismissAnimated:1];
  }
  objc_destroyWeak(to);
  objc_storeStrong(location, 0);
}

void __46__FontInstallMissingController_viewDidAppear___block_invoke_2(id *a1, void *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  to[1] = a1;
  objc_copyWeak(to, a1 + 5);
  id WeakRetained = objc_loadWeakRetained(to);

  if (WeakRetained)
  {
    [*((id *)a1[4] + 10) setModalTransitionStyle:0];
    [*((id *)a1[4] + 10) setModalPresentationStyle:2];
    [*((id *)a1[4] + 10) setRemoteController:a1[4]];
    [a1[4] presentViewController:*((void *)a1[4] + 10) animated:1 completion:0];
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
  v4.super_class = (Class)FontInstallMissingController;
  [(FontInstallMissingController *)&v4 viewWillAppear:a3];
  id v3 = [(FontInstallMissingController *)v7 _remoteViewControllerProxy];
  [v3 setStatusBarHidden:1 withDuration:0.0];
  [v3 setAllowsAlertItems:1];
  objc_storeStrong(&v3, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v11 = self;
  SEL v10 = a2;
  BOOL v9 = a3;
  if (self->_connection)
  {
    id location = &_os_log_default;
    char v7 = 2;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      log = location;
      os_log_type_t type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_debug_impl((void *)&_mh_execute_header, log, type, "Missing Font Dialog must have been forcibly dismissed.", v6, 2u);
    }
    objc_storeStrong(&location, 0);
    [(FontInstallMissingController *)v11 doneWithMissingFonts:&__NSArray0__struct withDismissAnimated:1];
  }
  v5.receiver = v11;
  v5.super_class = (Class)FontInstallMissingController;
  [(FontInstallMissingController *)&v5 viewDidDisappear:v9];
}

- (void)connectToEndpoint:(id)a3
{
  id v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = objc_alloc_init((Class)NSXPCListenerEndpoint);
  [v15 _setEndpoint:location[0]];
  id v3 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v15];
  connection = v17->_connection;
  v17->_connection = v3;

  objc_super v5 = v17->_connection;
  SEL v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___FontInstallViewServiceProtocol];
  -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:");

  objc_initWeak(&v14, v17);
  char v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  SEL v10 = __50__FontInstallMissingController_connectToEndpoint___block_invoke;
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

void __50__FontInstallMissingController_connectToEndpoint___block_invoke(id *a1)
{
  v6[2] = a1;
  v6[1] = a1;
  v6[0] = objc_loadWeakRetained(a1 + 4);
  if (v6[0])
  {
    id location = &_os_log_default;
    char v4 = 2;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      log = location;
      os_log_type_t type = v4;
      __os_log_helper_16_0_0(v3);
      _os_log_debug_impl((void *)&_mh_execute_header, log, type, "FontInstallMissingController invalidated.", v3, 2u);
    }
    objc_storeStrong(&location, 0);
  }
  objc_storeStrong(v6, 0);
}

- (void)setupWithUserInfo:(id)a3 xpcEndpoint:(id)a4 dismissHandler:(id)a5
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v11 = 0;
  objc_storeStrong(&v11, a4);
  id v10 = 0;
  objc_storeStrong(&v10, a5);
  id v9 = [location[0] objectForKey:@"fonts"];
  -[FontInstallMissingController setInput:](v13, "setInput:");

  [(FontInstallMissingController *)v13 configureControllersForInput];
  id v5 = objc_retainBlock(v10);
  id dismissHandler = v13->_dismissHandler;
  v13->_id dismissHandler = v5;

  [(FontInstallMissingController *)v13 connectToEndpoint:v11];
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v15 = [(FontInstallMissingController *)v18 _remoteViewControllerProxyWithErrorHandler:&__block_literal_global_1];
  id v11 = [(FontInstallMissingController *)v18 view];
  id v10 = [v11 window];
  id v9 = [v10 windowScene];
  [v15 setLaunchingInterfaceOrientation:[v9 interfaceOrientation]];

  [v15 setReachabilityDisabled:1];
  [v15 setAllowsAlertStacking:0];
  id v14 = &_os_log_default;
  char v13 = 2;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
  {
    log = v14;
    os_log_type_t type = v13;
    __os_log_helper_16_0_0(v12);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "FontInstall configureWithContext", v12, 2u);
  }
  objc_storeStrong(&v14, 0);
  char v4 = v18;
  id v5 = [location[0] xpcEndpoint];
  -[FontInstallMissingController connectToEndpoint:](v4, "connectToEndpoint:");

  if (v16) {
    (*((void (**)(void))v16 + 2))();
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __64__FontInstallMissingController_configureWithContext_completion___block_invoke(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)&_os_log_default;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v5, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "FontInstall configureWithContext - error - %@", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong(location, 0);
}

- (void)configureControllersForInput
{
  v97 = self;
  SEL v96 = a2;
  v77 = [(FontInstallMissingController *)self input];
  NSUInteger v78 = [(NSArray *)v77 count];

  unint64_t v95 = v78;
  id v94 = (id)objc_opt_new();
  uint64_t v93 = 0;
  memset(__b, 0, sizeof(__b));
  obj = [(FontInstallMissingController *)v97 input];
  id v80 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v99 count:16];
  if (v80)
  {
    uint64_t v74 = *(void *)__b[2];
    uint64_t v75 = 0;
    id v76 = v80;
    while (1)
    {
      uint64_t v73 = v75;
      if (*(void *)__b[2] != v74) {
        objc_enumerationMutation(obj);
      }
      id v92 = *(id *)(__b[1] + 8 * v75);
      id v90 = [v92 objectForKeyedSubscript:@"providers"];
      [v94 addObjectsFromArray:v90];
      id v2 = [v90 count];
      v93 += v2 != 0;
      objc_storeStrong(&v90, 0);
      ++v75;
      if (v73 + 1 >= (unint64_t)v76)
      {
        uint64_t v75 = 0;
        id v76 = [(NSArray *)obj countByEnumeratingWithState:__b objects:v99 count:16];
        if (!v76) {
          break;
        }
      }
    }
  }

  id v89 = [v94 count];
  BOOL v88 = v95 <= 3;
  if (v93)
  {
    if (v88 && v89 == (id)1 && v93 == v95)
    {
      id v87 = (id)objc_opt_new();
      memset(v85, 0, sizeof(v85));
      v65 = [(FontInstallMissingController *)v97 input];
      id v66 = [(NSArray *)v65 countByEnumeratingWithState:v85 objects:v98 count:16];
      if (v66)
      {
        uint64_t v62 = *(void *)v85[2];
        uint64_t v63 = 0;
        id v64 = v66;
        while (1)
        {
          uint64_t v61 = v63;
          if (*(void *)v85[2] != v62) {
            objc_enumerationMutation(v65);
          }
          id v86 = *(id *)(v85[1] + 8 * v63);
          id v56 = v87;
          v60 = +[NSBundle mainBundle];
          v59 = [(NSBundle *)v60 localizedStringForKey:@"QUOTE_FONT_NAME_IN_LIST" value:&stru_100014650 table:0];
          id v58 = [v86 objectForKeyedSubscript:@"displayName"];
          v57 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v59, v58);
          [v56 addObject:];

          ++v63;
          if (v61 + 1 >= (unint64_t)v64)
          {
            uint64_t v63 = 0;
            id v64 = [(NSArray *)v65 countByEnumeratingWithState:v85 objects:v98 count:16];
            if (!v64) {
              break;
            }
          }
        }
      }

      id v84 = [v94 anyObject];
      v47 = +[UIScreen mainScreen];
      [(UIScreen *)v47 scale];
      id v83 = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v84, 2);

      id v48 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v84 allowPlaceholder:0 error:];
      id v82 = [v48 localizedName];

      id v81 = [v87 count];
      objc_storeStrong((id *)&v97->_subIcon, v83);
      id v17 = +[NSBundle mainBundle];
      v50 = v17;
      if (v81 == (id)1) {
        CFStringRef v18 = @"INSTALL_TITLE_SINGULAR";
      }
      else {
        CFStringRef v18 = @"INSTALL_TITLE_PLURAL";
      }
      v49 = -[NSBundle localizedStringForKey:value:table:](v17, "localizedStringForKey:value:table:", v18);
      v19 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:");
      alertTitle = v97->_alertTitle;
      v97->_alertTitle = v19;

      BOOL v21 = +[NSBundle mainBundle];
      v53 = v21;
      if (v81 == (id)1) {
        CFStringRef v22 = @"MISSING_SIMPLE_AVAILABLE_SINGULAR";
      }
      else {
        CFStringRef v22 = @"MISSING_SIMPLE_AVAILABLE_PLURAL";
      }
      v52 = [(NSBundle *)v21 localizedStringForKey:v22 value:&stru_100014650 table:0];
      v51 = +[NSListFormatter localizedStringByJoiningStrings:v87];
      v23 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v52, v51, v82);
      messageText = v97->_messageText;
      v97->_messageText = v23;

      v54 = +[NSBundle mainBundle];
      int v25 = [(NSBundle *)v54 localizedStringForKey:@"IGNORE_BUTTON" value:&stru_100014650 table:0];
      cancelTitle = v97->_cancelTitle;
      v97->_cancelTitle = v25;

      v55 = +[NSBundle mainBundle];
      v27 = [(NSBundle *)v55 localizedStringForKey:@"DETAILS_BUTTON" value:&stru_100014650 table:0];
      noncancelTitle = v97->_noncancelTitle;
      v97->_noncancelTitle = v27;

      objc_storeStrong(&v82, 0);
      objc_storeStrong(&v83, 0);
      objc_storeStrong(&v84, 0);
      objc_storeStrong(&v87, 0);
    }
    else
    {
      objc_storeStrong((id *)&v97->_subIcon, 0);
      id v29 = +[NSBundle mainBundle];
      BOOL v42 = v29;
      if (v93 == 1) {
        CFStringRef v30 = @"INSTALL_TITLE_SINGULAR";
      }
      else {
        CFStringRef v30 = @"INSTALL_TITLE_PLURAL";
      }
      objc_super v41 = -[NSBundle localizedStringForKey:value:table:](v29, "localizedStringForKey:value:table:", v30);
      v31 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:");
      int v32 = v97->_alertTitle;
      v97->_alertTitle = v31;

      int v33 = +[NSBundle mainBundle];
      v44 = v33;
      if (v93 == 1) {
        CFStringRef v34 = @"MISSING_AVAILABLE_SINGULAR";
      }
      else {
        CFStringRef v34 = @"MISSING_AVAILABLE_PLURAL";
      }
      SEL v43 = [(NSBundle *)v33 localizedStringForKey:v34 value:&stru_100014650 table:0];
      v35 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:");
      id v36 = v97->_messageText;
      v97->_messageText = v35;

      id v45 = +[NSBundle mainBundle];
      id v37 = [(NSBundle *)v45 localizedStringForKey:@"IGNORE_BUTTON" value:&stru_100014650 table:0];
      id v38 = v97->_cancelTitle;
      v97->_cancelTitle = v37;

      v46 = +[NSBundle mainBundle];
      id v39 = [(NSBundle *)v46 localizedStringForKey:@"DETAILS_BUTTON" value:&stru_100014650 table:0];
      v40 = v97->_noncancelTitle;
      v97->_noncancelTitle = v39;
    }
  }
  else
  {
    id v3 = +[NSBundle mainBundle];
    v68 = v3;
    if (v95 == 1) {
      CFStringRef v4 = @"CANT_INSTALL_TITLE_SINGULAR";
    }
    else {
      CFStringRef v4 = @"CANT_INSTALL_TITLE_PLURAL";
    }
    v67 = -[NSBundle localizedStringForKey:value:table:](v3, "localizedStringForKey:value:table:", v4);
    id v5 = +[NSString localizedStringWithFormat:v95];
    SEL v6 = v97->_alertTitle;
    v97->_alertTitle = v5;

    char v7 = +[NSBundle mainBundle];
    v70 = v7;
    if (v95 == 1) {
      CFStringRef v8 = @"MISSING_UNAVAILABLE_SINGULAR";
    }
    else {
      CFStringRef v8 = @"MISSING_UNAVAILABLE_PLURAL";
    }
    v69 = [(NSBundle *)v7 localizedStringForKey:v8 value:&stru_100014650 table:0];
    id v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:");
    id v10 = v97->_messageText;
    v97->_messageText = v9;

    id v11 = +[UIImage imageNamed:@"Caution"];
    subIcon = v97->_subIcon;
    v97->_subIcon = v11;

    v71 = +[NSBundle mainBundle];
    char v13 = [(NSBundle *)v71 localizedStringForKey:@"OK_BUTTON" value:&stru_100014650 table:0];
    id v14 = v97->_cancelTitle;
    v97->_cancelTitle = v13;

    v72 = +[NSBundle mainBundle];
    id v15 = [(NSBundle *)v72 localizedStringForKey:@"DETAILS_BUTTON" value:&stru_100014650 table:0];
    id v16 = v97->_noncancelTitle;
    v97->_noncancelTitle = v15;
  }
  objc_storeStrong(&v94, 0);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v12 = [(FontInstallMissingController *)v15 _remoteViewControllerProxyWithErrorHandler:&__block_literal_global_151];
  id v11 = &_os_log_default;
  char v10 = 2;
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
  {
    log = v11;
    os_log_type_t type = v10;
    __os_log_helper_16_0_0(v9);
    _os_log_debug_impl((void *)&_mh_execute_header, log, type, "FontInstall prepareForActivationWithContext", v9, 2u);
  }
  objc_storeStrong(&v11, 0);
  [v12 setStatusBarHidden:1 withDuration:0.4];
  id v5 = [location[0] userInfo];
  id v4 = [v5 objectForKey:@"fonts"];
  -[FontInstallMissingController setInput:](v15, "setInput:");

  [(FontInstallMissingController *)v15 configureControllersForInput];
  if (v13) {
    (*((void (**)(void))v13 + 2))();
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __75__FontInstallMissingController_prepareForActivationWithContext_completion___block_invoke(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)&_os_log_default;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v5, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "FontInstall prepareForActivationWithContext - error - %@", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong(location, 0);
}

- (void)doneWithMissingFonts:(id)a3 withDismissAnimated:(BOOL)a4
{
  CFStringRef v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v16 = a4;
  id v15 = &_os_log_default;
  os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v19, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)v15, v14, "FontInstall doneWithMissingFonts:%@", v19, 0xCu);
  }
  objc_storeStrong(&v15, 0);
  id v13 = [(NSXPCConnection *)v18->_connection remoteObjectProxyWithErrorHandler:&__block_literal_global_153];
  [v13 doneWithMissingFonts:location[0]];
  id v5 = v18;
  BOOL v4 = v16;
  char v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  char v10 = __73__FontInstallMissingController_doneWithMissingFonts_withDismissAnimated___block_invoke_154;
  id v11 = &unk_1000142D0;
  id v12 = v18;
  [(FontInstallMissingController *)v5 dismissViewControllerAnimated:v4 completion:&v7];
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __73__FontInstallMissingController_doneWithMissingFonts_withDismissAnimated___block_invoke(id a1, NSError *a2)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  oslog[1] = (os_log_t)a1;
  oslog[0] = (os_log_t)&_os_log_default;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v5, (uint64_t)location[0]);
    _os_log_debug_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEBUG, "FontInstallViewService connection error - %@", v5, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
  objc_storeStrong(location, 0);
}

void __73__FontInstallMissingController_doneWithMissingFonts_withDismissAnimated___block_invoke_154(id *a1)
{
  v2[2] = a1;
  v2[1] = a1;
  [*((id *)a1[4] + 3) invalidate];
  objc_storeStrong((id *)a1[4] + 3, 0);
  if (*((void *)a1[4] + 11)) {
    (*(void (**)(void))(*((void *)a1[4] + 11) + 16))();
  }
  v2[0] = [a1[4] _remoteViewControllerProxy];
  [v2[0] deactivate];
  [v2[0] invalidate];
  objc_storeStrong((id *)a1[4] + 2, 0);
  objc_storeStrong((id *)a1[4] + 1, 0);
  objc_storeStrong((id *)a1[4] + 10, 0);
  objc_storeStrong((id *)a1[4] + 8, 0);
  objc_storeStrong((id *)a1[4] + 9, 0);
  objc_storeStrong(v2, 0);
}

- (NSArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (NSMutableArray)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (void).cxx_destruct
{
}

@end