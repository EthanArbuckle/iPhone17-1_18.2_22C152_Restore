@interface BuddyMoveFromAndroidController
+ (BOOL)showMoveFromAndroidRestoreChoice;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BFFNavigationController)navigationController;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)responsibleForViewController:(id)a3;
- (BYAnalyticsManager)analyticsManager;
- (BYPreferencesController)buddyPreferences;
- (BuddyDisplayZoomExecutor)displayZoomExecutor;
- (BuddyMoveFromAndroidController)init;
- (BuddySetupMethod)setupMethod;
- (ProximitySetupController)proximitySetupController;
- (id)viewController;
- (void)_eraseDevice;
- (void)_welcomeKitDidFinishWithSuccess:(BOOL)a3 settings:(id)a4;
- (void)setAnalyticsManager:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayZoomExecutor:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setSetupMethod:(id)a3;
@end

@implementation BuddyMoveFromAndroidController

+ (BOOL)showMoveFromAndroidRestoreChoice
{
  id v2 = +[BuddyCloudConfigManager sharedManager];
  char v3 = [v2 cloudConfigWantsToSkipControllerClass:objc_opt_class()] ^ 1;

  return v3 & 1;
}

- (BuddyMoveFromAndroidController)init
{
  SEL v21 = a2;
  id location = 0;
  v20.receiver = self;
  v20.super_class = (Class)BuddyMoveFromAndroidController;
  id v2 = [(BuddyMoveFromAndroidController *)&v20 init];
  id location = v2;
  objc_storeStrong(&location, v2);
  if (v2)
  {
    id v3 = objc_alloc_init((Class)sub_1000AB6C0());
    v4 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v3;

    objc_initWeak(&from, location);
    v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    v16 = sub_1000AB7D8;
    v17 = &unk_1002B21B8;
    objc_copyWeak(&v18, &from);
    [*((id *)location + 1) setCompletionHandler:&v13];
    v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    v10 = sub_1000AB854;
    v11 = &unk_1002B0CA8;
    objc_copyWeak(&v12, &from);
    [*((id *)location + 1) setResetHandler:&v7];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&from);
  }
  v5 = (BuddyMoveFromAndroidController *)location;
  objc_storeStrong(&location, 0);
  return v5;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupAndroid;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (id)viewController
{
  return self->_welcomeViewController;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (BOOL)responsibleForViewController:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v5 = [(NSBundle *)v3 isEqual:v4];

  objc_storeStrong(location, 0);
  return v5 & 1;
}

- (void)_welcomeKitDidFinishWithSuccess:(BOOL)a3 settings:(id)a4
{
  id v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  if (v10)
  {
    if (v9)
    {
      if ([v9 enableDisplayZoom])
      {
        v4 = [(BuddyMoveFromAndroidController *)v12 displayZoomExecutor];
        [(BuddyDisplayZoomExecutor *)v4 setPendingOption:1 chosenByUser:0];
      }
      else
      {
        v4 = [(BuddyMoveFromAndroidController *)v12 displayZoomExecutor];
        [(BuddyDisplayZoomExecutor *)v4 setPendingOption:0 chosenByUser:0];
      }
    }
    unsigned __int8 v5 = [(BuddyMoveFromAndroidController *)v12 setupMethod];
    [(BuddySetupMethod *)v5 setDataTransferMethod:3];

    v6 = [(BuddyMoveFromAndroidController *)v12 delegate];
    [(BFFFlowItemDelegate *)v6 flowItemDone:v12];
  }
  else
  {
    v7 = [(BuddyMoveFromAndroidController *)v12 delegate];
    id v8 = [(BFFFlowItemDelegate *)v7 popToBuddyControllerWithClass:objc_opt_class() withOffset:1 animated:1];
  }
  objc_storeStrong(&v9, 0);
}

- (void)_eraseDevice
{
  BOOL v10 = self;
  location[1] = (id)a2;
  id v2 = [(BuddyMoveFromAndroidController *)self navigationController];
  id v3 = [(BFFNavigationController *)v2 view];
  id v4 = [v3 window];
  unsigned __int8 v5 = [(BuddyMoveFromAndroidController *)v10 navigationController];
  v6 = [(BuddyMoveFromAndroidController *)v10 proximitySetupController];
  v7 = [(BuddyMoveFromAndroidController *)v10 analyticsManager];
  location[0] = +[BuddyEraseAlertController alertControllerWithWindow:v4 navigationController:v5 proximitySetupController:v6 analyticsManager:v7];

  id v8 = [(BuddyMoveFromAndroidController *)v10 navigationController];
  [(BFFNavigationController *)v8 presentViewController:location[0] animated:1 completion:0];

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

- (BFFNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (BuddyDisplayZoomExecutor)displayZoomExecutor
{
  return self->_displayZoomExecutor;
}

- (void)setDisplayZoomExecutor:(id)a3
{
}

- (BuddySetupMethod)setupMethod
{
  return self->_setupMethod;
}

- (void)setSetupMethod:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end