@interface PearlSplashController
+ (BOOL)hiddenFromStoreDemoMode;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (MCProfileConnection)managedConfiguration;
- (PearlSplashController)init;
- (id)passcodeForFaceIDViewController:(id)a3;
- (void)controllerWasPopped;
- (void)faceIDViewController:(id)a3 didCompleteWithResult:(unint64_t)a4 pushedViewControllers:(id)a5;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)startOver;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PearlSplashController

- (PearlSplashController)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)PearlSplashController;
  id location = [(PearlSplashController *)&v4 init];
  objc_storeStrong(&location, location);
  if (location) {
    [location setFaceIDViewControllerDelegate:location];
  }
  v2 = (PearlSplashController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)PearlSplashController;
  [(PearlSplashController *)&v4 viewWillAppear:a3];
  v3 = [(PearlSplashController *)v7 paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v3 clearActionForFeature:13];
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

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(PearlSplashController *)v22 capabilities];
  unsigned __int8 v4 = [v3 supportsPearl];

  char v20 = v4 & 1;
  if (v4)
  {
    v7 = dispatch_get_global_queue(25, 0);
    block = _NSConcreteStackBlock;
    int v9 = -1073741824;
    int v10 = 0;
    v11 = sub_100127780;
    v12 = &unk_1002B14A8;
    v13 = v22;
    char v15 = v20 & 1;
    id v14 = location[0];
    dispatch_async(v7, &block);

    objc_storeStrong(&v14, 0);
    objc_storeStrong((id *)&v13, 0);
    int v16 = 0;
  }
  else
  {
    if (location[0]) {
      (*((void (**)(id, void))location[0] + 2))(location[0], 0);
    }
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v18 = 2;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
    {
      BOOL v5 = oslog;
      os_log_type_t v6 = v18;
      sub_10004B24C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v5, v6, "PearlSplashController: Hardware does not support Face ID", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v16 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)startOver
{
}

- (void)controllerWasPopped
{
  unsigned __int8 v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)PearlSplashController;
  [(PearlSplashController *)&v2 controllerWasPopped];
}

- (id)passcodeForFaceIDViewController:(id)a3
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(PearlSplashController *)v7 passcodeCacheManager];
  id v4 = [v3 cachedPasscode];

  objc_storeStrong(location, 0);

  return v4;
}

- (void)faceIDViewController:(id)a3 didCompleteWithResult:(unint64_t)a4 pushedViewControllers:(id)a5
{
  v29 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v27 = a4;
  id v26 = 0;
  objc_storeStrong(&v26, a5);
  if ([(PearlSplashController *)v29 enrollmentConfiguration] == (id)3
    || [(PearlSplashController *)v29 enrollmentConfiguration] == (id)1)
  {
    id v7 = [(PearlSplashController *)v29 buddyPreferences];
    [v7 setObject:&__kCFBooleanTrue forKey:@"FaceIDPeriocularPresented"];
  }
  id v25 = [v26 mutableCopy];
  if (v27 && v27 != 3)
  {
    if (v27 == 1)
    {
      if ([(PearlSplashController *)v29 enrollmentConfiguration] != (id)3)
      {
        id v14 = [(PearlSplashController *)v29 flowSkipController];
        [(BYFlowSkipController *)v14 didSkipFlow:BYFlowSkipIdentifierFaceID];
      }
      [v25 removeObject:v29];
      char v15 = [(PearlSplashController *)v29 delegate];
      [(BFFFlowItemDelegate *)v15 removeViewControllersOnNextPush:v25];
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_100046588((uint64_t)buf, v27);
        _os_log_impl((void *)&_mh_execute_header, oslog, v22, "PearlSplashController got unexpected BFFFaceIDViewController completion result %lu", buf, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
  else
  {
    v8 = [(PearlSplashController *)v29 flowSkipController];
    [(BYFlowSkipController *)v8 didCompleteFlow:BYFlowSkipIdentifierFaceID];

    id v9 = [(PearlSplashController *)v29 navigationController];
    id v10 = [v9 viewControllers];
    v11 = +[NSPredicate predicateWithBlock:&stru_1002B35E0];
    id v12 = [v10 filteredArrayUsingPredicate:v11];
    id v24 = [v12 firstObject];

    if (v24) {
      [v25 addObject:v24];
    }
    v13 = [(PearlSplashController *)v29 delegate];
    [(BFFFlowItemDelegate *)v13 removeViewControllersOnNextPush:v25];

    objc_storeStrong(&v24, 0);
  }
  id v21 = &off_1002C17A8;
  if ([(PearlSplashController *)v29 enrollmentConfiguration] == (id)3) {
    objc_storeStrong(&v21, &off_1002C17C0);
  }
  id v20 = v21;
  if (!v27)
  {
    int v16 = +[NSNumber numberWithUnsignedInteger:(char *)[(PearlSplashController *)v29 enrollmentConfiguration] + 1000];
    id v17 = v20;
    id v20 = v16;
  }
  char v18 = [(PearlSplashController *)v29 paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v18 recordActionWithValue:v20 previousValue:v21 forFeature:13];

  v19 = [(PearlSplashController *)v29 delegate];
  [(BFFFlowItemDelegate *)v19 flowItemDone:v29];

  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
}

- (MCProfileConnection)managedConfiguration
{
  return self->managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BYFlowSkipController)flowSkipController
{
  return self->flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->paneFeatureAnalyticsManager;
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

- (void).cxx_destruct
{
}

@end