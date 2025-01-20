@interface BuddyIntelligenceController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)hasBlackBackground;
- (BOOL)responsibleForViewController:(id)a3;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyNetworkProvider)networkProvider;
- (IntelligenceProvider)intelligenceProvider;
- (UIViewController)intelligenceController;
- (id)viewController;
- (id)viewControllerProviderBlock;
- (void)controllerCompleted;
- (void)controllerWasPopped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIntelligenceController:(id)a3;
- (void)setIntelligenceProvider:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setViewControllerProviderBlock:(id)a3;
- (void)siriGMIntroViewControllerContinuePressed:(id)a3;
- (void)siriGMIntroViewControllerNotNowPressed:(id)a3;
@end

@implementation BuddyIntelligenceController

- (id)viewController
{
  v2 = [(BuddyIntelligenceController *)self intelligenceController];

  if (v2)
  {
    v8 = [(BuddyIntelligenceController *)self intelligenceController];
  }
  else
  {
    id v3 = [(BuddyIntelligenceController *)self viewControllerProviderBlock];

    if (v3)
    {
      v4 = (uint64_t (**)(void))[(BuddyIntelligenceController *)self viewControllerProviderBlock];
      id v5 = (id)v4[2](v4);
      [(BuddyIntelligenceController *)self setIntelligenceController:v5];
    }
    else
    {
      v4 = (uint64_t (**)(void))[objc_alloc((Class)sub_1001252D8()) initWithDelegate:self];
      [(BuddyIntelligenceController *)self setIntelligenceController:v4];
    }

    v8 = [(BuddyIntelligenceController *)self intelligenceController];
  }

  return v8;
}

- (void)controllerCompleted
{
  v2 = [(BuddyIntelligenceController *)self buddyPreferencesExcludedFromBackup];
  [(BYPreferencesController *)v2 setObject:&__kCFBooleanTrue forKey:@"IntelligencePresented"];

  id v3 = [(BuddyIntelligenceController *)self delegate];
  [(BFFFlowItemDelegate *)v3 flowItemDone:self];
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

+ (id)cloudConfigSkipKey
{
  return kCCSkipKeyIntelligence;
}

- (void)controllerWasPopped
{
  v2 = [(BuddyIntelligenceController *)self buddyPreferencesExcludedFromBackup];
  [(BYPreferencesController *)v2 removeObjectForKey:@"IntelligencePresented"];
}

- (BOOL)hasBlackBackground
{
  v2 = [(BuddyIntelligenceController *)self intelligenceProvider];
  unsigned __int8 v3 = [(IntelligenceProvider *)v2 canEnableIntelligence];
  char v8 = 0;
  char v6 = 0;
  BOOL v4 = 0;
  if (v3)
  {
    id v9 = [(BuddyIntelligenceController *)self viewController];
    char v8 = 1;
    id v7 = [v9 traitCollection];
    char v6 = 1;
    BOOL v4 = [v7 userInterfaceStyle] == (id)2;
  }
  BOOL v11 = v4;
  if (v6) {

  }
  if (v8) {
  return v11;
  }
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = [(BuddyIntelligenceController *)v15 networkProvider];
  unsigned __int8 v4 = [(BuddyNetworkProvider *)v3 networkReachable];

  char v13 = v4 & 1;
  id v5 = [(BuddyIntelligenceController *)v15 intelligenceProvider];
  char v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = sub_100125734;
  v10 = &unk_1002B0CF8;
  BOOL v11 = v15;
  id v12 = location[0];
  [(IntelligenceProvider *)v5 shouldShowIntelligenceWithServerCheck:v4 & 1 completionHandler:&v6];

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)responsibleForViewController:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned __int8 v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [(BuddyIntelligenceController *)v14 viewController];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v6 = [(NSBundle *)v3 isEqual:v5];
  char v11 = 0;
  char v9 = 0;
  unsigned __int8 v7 = 1;
  if ((v6 & 1) == 0)
  {
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    char v11 = 1;
    v10 = [(NSBundle *)v12 bundleIdentifier];
    char v9 = 1;
    unsigned __int8 v7 = [(NSString *)v10 containsString:@"UserNotifications"];
  }
  char v15 = v7 & 1;
  if (v9) {

  }
  if (v11) {
  objc_storeStrong(location, 0);
  }
  return v15 & 1;
}

- (void)siriGMIntroViewControllerContinuePressed:(id)a3
{
  char v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v3 = oslog;
    os_log_type_t v4 = v6;
    sub_10004B24C(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Apple Intelligence continue button pressed", (uint8_t *)v5, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyIntelligenceController *)v9 controllerCompleted];
  objc_storeStrong(location, 0);
}

- (void)siriGMIntroViewControllerNotNowPressed:(id)a3
{
  char v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v3 = oslog;
    os_log_type_t v4 = v6;
    sub_10004B24C(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Apple Intelligence not now button pressed", (uint8_t *)v5, 2u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyIntelligenceController *)v9 controllerCompleted];
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

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (IntelligenceProvider)intelligenceProvider
{
  return self->_intelligenceProvider;
}

- (void)setIntelligenceProvider:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (UIViewController)intelligenceController
{
  return (UIViewController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIntelligenceController:(id)a3
{
}

- (id)viewControllerProviderBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setViewControllerProviderBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end