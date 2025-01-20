@interface BuddyiCloudQuotaController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)controllerNeedsToRun;
- (BYPreferencesController)buddyPreferences;
- (id)viewController;
- (void)cancelHostedPresentation;
- (void)controllerWasPopped;
- (void)manager:(id)a3 loadDidFailWithError:(id)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)presentHostedViewControllerOnNavigationController:(id)a3 completion:(id)a4;
- (void)setBuddyPreferences:(id)a3;
- (void)setDelegate:(id)a3;
- (void)upgradeFlowManager:(id)a3 didPresentViewController:(id)a4;
- (void)upgradeFlowManagerDidCancel:(id)a3;
- (void)upgradeFlowManagerDidComplete:(id)a3;
@end

@implementation BuddyiCloudQuotaController

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyiCloudQuotaController *)self buddyPreferences];
  char v3 = [(BYPreferencesController *)v2 BOOLForKey:@"iCloudQuotaPresented"] ^ 1;

  return v3 & 1;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupCloudStorage;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = sub_10006DCC4();
  v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_10006DDDC;
  v8 = &unk_1002B0C80;
  id v9 = location[0];
  [v3 needsToRunWithCompletion:&v4];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)presentHostedViewControllerOnNavigationController:(id)a3 completion:(id)a4
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  objc_storeStrong(&v16, a4);
  id v5 = [sub_10006E1BC() sharedOfferManager];
  id v15 = [v5 currentOffer];

  if (v15)
  {
    id v6 = [v16 copy];
    id pushCompletion = v18->_pushCompletion;
    v18->_id pushCompletion = v6;

    v8 = (ICQUpgradeFlowManager *)[objc_alloc((Class)sub_10006DCC4()) initWithOffer:v15];
    flowManager = v18->_flowManager;
    v18->_flowManager = v8;

    [(ICQUpgradeFlowManager *)v18->_flowManager setDelegate:v18];
    [(ICQUpgradeFlowManager *)v18->_flowManager presentFlowHostedInNavigationController:location[0]];
  }
  else if (v16)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = oslog;
      os_log_type_t v11 = v13;
      sub_10004B24C(v12);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "iCloudQuota: Skipping due to nil offer", (uint8_t *)v12, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    (*((void (**)(id, void))v16 + 2))(v16, 0);
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

- (void)cancelHostedPresentation
{
  v8 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    os_log_type_t v3 = v6;
    sub_10004B24C(v5);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Canceling iCloud Quota presenation. Please take a sysdiagnose and file a radar against PEP Setup Assistant.", (uint8_t *)v5, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  id pushCompletion = v8->_pushCompletion;
  v8->_id pushCompletion = 0;

  [(ICQUpgradeFlowManager *)v8->_flowManager setHostingNavigationController:0];
  [(ICQUpgradeFlowManager *)v8->_flowManager _cancelFlow];
  [(ICQUpgradeFlowManager *)v8->_flowManager setDelegate:0];
  objc_storeStrong((id *)&v8->_flowManager, 0);
}

- (id)viewController
{
  return self->_viewController;
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (void)controllerWasPopped
{
  v2 = [(BuddyiCloudQuotaController *)self buddyPreferences];
  [(BYPreferencesController *)v2 removeObjectForKey:@"iCloudQuotaPresented"];
}

- (void)upgradeFlowManager:(id)a3 didPresentViewController:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id obj = 0;
  objc_storeStrong(&obj, a4);
  if (v8->_pushCompletion)
  {
    objc_storeStrong((id *)&v8->_viewController, obj);
    (*((void (**)(void))v8->_pushCompletion + 2))();
    id pushCompletion = v8->_pushCompletion;
    v8->_id pushCompletion = 0;
  }
  objc_storeStrong(&obj, 0);
  objc_storeStrong(location, 0);
}

- (void)manager:(id)a3 loadDidFailWithError:(id)a4
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v7 = 0;
  objc_storeStrong(&v7, a4);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)v7);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "iCloudQuota load failed: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v9->_pushCompletion)
  {
    (*((void (**)(void))v9->_pushCompletion + 2))();
    id pushCompletion = v9->_pushCompletion;
    v9->_id pushCompletion = 0;
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  os_log_type_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_type_t v3 = oslog;
    os_log_type_t v4 = v8;
    sub_10004B24C(v7);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "iCloudQuota cancelled", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v5 = [(BuddyiCloudQuotaController *)v11 buddyPreferences];
  [(BYPreferencesController *)v5 setObject:&__kCFBooleanTrue forKey:@"iCloudQuotaPresented"];

  os_log_type_t v6 = [(BuddyiCloudQuotaController *)v11 delegate];
  [(BFFFlowItemDelegate *)v6 flowItemDone:v11];

  objc_storeStrong(location, 0);
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  os_log_type_t v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    os_log_type_t v3 = oslog;
    os_log_type_t v4 = v8;
    sub_10004B24C(v7);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "iCloudQuota Complete!", (uint8_t *)v7, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  id v5 = [(BuddyiCloudQuotaController *)v11 buddyPreferences];
  [(BYPreferencesController *)v5 setObject:&__kCFBooleanTrue forKey:@"iCloudQuotaPresented"];

  os_log_type_t v6 = [(BuddyiCloudQuotaController *)v11 delegate];
  [(BFFFlowItemDelegate *)v6 flowItemDone:v11];

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

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end