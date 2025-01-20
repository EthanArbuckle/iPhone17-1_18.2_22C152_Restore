@interface BuddyAssociationController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (AMSUIDynamicViewController)dynamicViewController;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerNeedsToRun;
- (BYAnalyticsManager)analyticsManager;
- (BYRunState)runState;
- (BuddyFeatureFlags)featureFlags;
- (BuddyMediaServicesBag)bag;
- (ProximitySetupController)proximitySetupController;
- (UINavigationController)navigationController;
- (id)viewController;
- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setBag:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDynamicViewController:(id)a3;
- (void)setFeatureFlags:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)setRunState:(id)a3;
@end

@implementation BuddyAssociationController

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (BOOL)controllerNeedsToRun
{
  v9 = self;
  location[1] = (id)a2;
  if (+[AMSDevice deviceIsBundle])
  {
    v2 = [(BuddyAssociationController *)v9 runState];
    unsigned __int8 v3 = [(BYRunState *)v2 hasCompletedInitialRun];

    if (v3)
    {
      char v10 = 0;
    }
    else
    {
      id v4 = +[ACAccountStore ams_sharedAccountStore];
      location[0] = [v4 ams_activeiTunesAccount];

      if (location[0])
      {
        id v5 = [location[0] ams_isBundleOwner];
        unsigned __int8 v6 = 1;
        if (v5) {
          unsigned __int8 v6 = +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:BYPrivacySubscriptionBundleIdentifier account:location[0]];
        }
        char v10 = v6 & 1;
      }
      else
      {
        char v10 = 1;
      }
      objc_storeStrong(location, 0);
    }
  }
  else
  {
    char v10 = 0;
  }
  return v10 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = objc_alloc_init(BuddyMediaServicesBag);
  [(BuddyAssociationController *)v24 setBag:v3];

  id v4 = objc_alloc((Class)AMSUIDynamicViewController);
  id v5 = [(BuddyAssociationController *)v24 bag];
  unsigned __int8 v6 = [(BuddyMediaServicesBag *)v5 underlyingBag];
  v7 = [(BuddyAssociationController *)v24 bag];
  id v8 = [(BuddyMediaServicesBag *)v7 getBundleURL];
  id v9 = [v4 initWithBag:v6 bagValue:v8];
  [(BuddyAssociationController *)v24 setDynamicViewController:v9];

  id v10 = +[ACAccountStore ams_sharedAccountStore];
  id v11 = [v10 ams_activeiTunesAccount];
  v12 = [(BuddyAssociationController *)v24 dynamicViewController];
  [(AMSUIDynamicViewController *)v12 setAccount:v11];

  v13 = v24;
  v14 = [(BuddyAssociationController *)v24 dynamicViewController];
  [(AMSUIDynamicViewController *)v14 setDelegate:v13];

  v15 = [(BuddyAssociationController *)v24 dynamicViewController];
  id v16 = [(AMSUIDynamicViewController *)v15 preload];
  v17 = _NSConcreteStackBlock;
  int v18 = -1073741824;
  int v19 = 0;
  v20 = sub_100044DE4;
  v21 = &unk_1002B0C80;
  id v22 = location[0];
  [v16 resultWithCompletion:&v17];

  objc_storeStrong(&v22, 0);
  objc_storeStrong(location, 0);
}

- (id)viewController
{
  return [(BuddyAssociationController *)self dynamicViewController];
}

- (void)dynamicViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  id v17 = 0;
  objc_storeStrong(&v17, a5);
  id v7 = [v18 objectForKeyedSubscript:@"action"];
  LOBYTE(a4) = [v7 isEqualToString:@"erase"];

  if (a4)
  {
    id v8 = [(BuddyAssociationController *)v20 dynamicViewController];
    id v9 = [(AMSUIDynamicViewController *)v8 view];
    id v10 = [v9 window];
    id v11 = [(BuddyAssociationController *)v20 navigationController];
    v12 = [(BuddyAssociationController *)v20 proximitySetupController];
    v13 = [(BuddyAssociationController *)v20 analyticsManager];
    id v16 = +[BuddyEraseAlertController alertControllerWithWindow:v10 navigationController:v11 proximitySetupController:v12 analyticsManager:v13];

    v14 = [(BuddyAssociationController *)v20 navigationController];
    [(UINavigationController *)v14 presentViewController:v16 animated:1 completion:0];

    objc_storeStrong((id *)&v16, 0);
  }
  else
  {
    v15 = [(BuddyAssociationController *)v20 delegate];
    [(BFFFlowItemDelegate *)v15 flowItemDone:v20];
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
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

- (BuddyFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BYRunState)runState
{
  return self->_runState;
}

- (void)setRunState:(id)a3
{
}

- (BuddyMediaServicesBag)bag
{
  return self->_bag;
}

- (void)setBag:(id)a3
{
}

- (AMSUIDynamicViewController)dynamicViewController
{
  return self->_dynamicViewController;
}

- (void)setDynamicViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end