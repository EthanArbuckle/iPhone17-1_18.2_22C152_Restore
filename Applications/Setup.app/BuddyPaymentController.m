@interface BuddyPaymentController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)setupAssistantExpressProvisioningContext:(id)a3;
- (BFFFlowItemDelegate)delegate;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)controllerNeedsToRun;
- (BOOL)shouldSuppressExtendedInitializationActivityIndicator;
- (BOOL)shouldSuppressSpinner;
- (BYCapabilities)capabilities;
- (BYChronicle)chronicle;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPreferencesController)buddyPreferences;
- (BuddyExistingSettings)existingSettings;
- (BuddyMiscState)miscState;
- (PKPaymentSetupAssistantController)paymentController;
- (PKPaymentSetupAssistantExpressController)expressController;
- (PKPaymentSetupAssistantProvisioningContext)setupProvisioningContext;
- (UIViewController)initialViewController;
- (id)_createPaymentControllerWithContext:(id)a3;
- (id)viewController;
- (void)controllerWasPopped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setChronicle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExistingSettings:(id)a3;
- (void)setExpressController:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setPaymentController:(id)a3;
- (void)setSetupProvisioningContext:(id)a3;
- (void)setShouldSuppressSpinner:(BOOL)a3;
- (void)viewControllerDidTerminateSetupFlow:(id)a3;
@end

@implementation BuddyPaymentController

- (id)_createPaymentControllerWithContext:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = objc_alloc((Class)sub_100178330());
  id v4 = [v3 initWithSetupAssistantContext:location[0]];
  objc_storeStrong(location, 0);

  return v4;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupPayment;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (BOOL)controllerNeedsToRun
{
  v18 = self;
  oslog[1] = (os_log_t)a2;
  v2 = [(BuddyPaymentController *)self capabilities];
  char v3 = [(BYCapabilities *)v2 supportsApplePay] ^ 1;

  if (v3)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = oslog[0];
      os_log_type_t v5 = v16;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Hardware does not support Apple Pay, skipping", buf, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    return 0;
  }
  else
  {
    v6 = [(BuddyPaymentController *)v18 buddyPreferences];
    unsigned __int8 v7 = [(BYPreferencesController *)v6 BOOLForKey:@"Payment2Presented"];

    char v14 = v7 & 1;
    v8 = [(BuddyPaymentController *)v18 chronicle];
    id v9 = [(BYChronicle *)v8 entryForFeature:1];
    char v10 = [v9 createdOnCurrentMajorVersion] ^ 1;

    char v13 = v10 & 1;
    if (v14 & 1) == 0 || (v13)
    {
      return 1;
    }
    else
    {
      os_log_t v12 = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        sub_10004F3FC((uint64_t)v20, v14 & 1, v13 & 1);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Skipping Apple Pay because it was already presented (%d) and we did not cross a major OS boundary (%d)", v20, 0xEu);
      }
      objc_storeStrong((id *)&v12, 0);
      return 0;
    }
  }
}

- (id)viewController
{
  return [(BuddyPaymentController *)self initialViewController];
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  os_log_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v3 = dispatch_get_global_queue(25, 0);
  block = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  unsigned __int8 v7 = sub_1001787FC;
  v8 = &unk_1002B0CD0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(v3, &block);

  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)controllerWasPopped
{
  v2 = [(BuddyPaymentController *)self buddyPreferences];
  [(BYPreferencesController *)v2 removeObjectForKey:@"Payment2Presented"];
}

- (BOOL)controllerAllowsNavigatingBack
{
  return 0;
}

- (BOOL)shouldSuppressExtendedInitializationActivityIndicator
{
  return [(BuddyPaymentController *)self shouldSuppressSpinner];
}

- (void)viewControllerDidTerminateSetupFlow:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  sub_100179900();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(BuddyPaymentController *)v11 setShouldSuppressSpinner:1];
  }
  char v3 = [(BuddyPaymentController *)v11 paymentController];
  unsigned __int8 v4 = [(PKPaymentSetupAssistantController *)v3 isFollowupNeededReturningRequirements:0];

  int v5 = [(BuddyPaymentController *)v11 flowSkipController];
  if (v4)
  {
    [(BYFlowSkipController *)v5 didSkipFlow:BYFlowSkipIdentifierApplePay];

    int v6 = [(BuddyPaymentController *)v11 paneFeatureAnalyticsManager];
    [(BYPaneFeatureAnalyticsManager *)v6 recordActionWithValue:&__kCFBooleanFalse forFeature:15];
  }
  else
  {
    [(BYFlowSkipController *)v5 didCompleteFlow:BYFlowSkipIdentifierApplePay];

    int v6 = [(BuddyPaymentController *)v11 paneFeatureAnalyticsManager];
    [(BYPaneFeatureAnalyticsManager *)v6 recordActionWithValue:&__kCFBooleanTrue forFeature:15];
  }

  unsigned __int8 v7 = [(BuddyPaymentController *)v11 buddyPreferences];
  [(BYPreferencesController *)v7 setObject:&__kCFBooleanTrue forKey:@"Payment2Presented"];

  v8 = [(BuddyPaymentController *)v11 buddyPreferences];
  [(BYPreferencesController *)v8 setObject:&__kCFBooleanTrue forKey:@"ApplePayOnBoardingPresented"];

  id v9 = [(BuddyPaymentController *)v11 delegate];
  [(BFFFlowItemDelegate *)v9 flowItemDone:v11];

  objc_storeStrong(location, 0);
}

+ (void)setupAssistantExpressProvisioningContext:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = objc_alloc_init((Class)BYBuddyDaemonGeneralClient);
  id v3 = [v13 fetchAuthenticationContextForApplePay];
  id v12 = [v3 externalizedContext];

  id v11 = [objc_alloc((Class)sub_100178C24()) initWithSetupAssistant:1];
  [v11 setExternalizedContext:v12];
  id v10 = [objc_alloc((Class)sub_10017930C()) initWithSetupAssistantContext:v11];
  unsigned __int8 v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  unsigned __int8 v7 = sub_100179B8C;
  v8 = &unk_1002B3FB8;
  id v9 = location[0];
  [v10 expressSetupProvisioningContext:&v4];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
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

- (BuddyExistingSettings)existingSettings
{
  return self->_existingSettings;
}

- (void)setExistingSettings:(id)a3
{
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BYChronicle)chronicle
{
  return self->_chronicle;
}

- (void)setChronicle:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYFlowSkipController)flowSkipController
{
  return self->_flowSkipController;
}

- (void)setFlowSkipController:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (PKPaymentSetupAssistantExpressController)expressController
{
  return self->_expressController;
}

- (void)setExpressController:(id)a3
{
}

- (PKPaymentSetupAssistantProvisioningContext)setupProvisioningContext
{
  return self->_setupProvisioningContext;
}

- (void)setSetupProvisioningContext:(id)a3
{
}

- (BOOL)shouldSuppressSpinner
{
  return self->_shouldSuppressSpinner;
}

- (void)setShouldSuppressSpinner:(BOOL)a3
{
  self->_shouldSuppressSpinner = a3;
}

- (PKPaymentSetupAssistantController)paymentController
{
  return self->_paymentController;
}

- (void)setPaymentController:(id)a3
{
}

- (UIViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end