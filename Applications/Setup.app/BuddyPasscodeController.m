@interface BuddyPasscodeController
+ (BOOL)hiddenFromMultiUser;
+ (BOOL)hiddenFromStoreDemoMode;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BFFFlowItemDelegate)delegate;
- (BOOL)allowsSkip;
- (BOOL)controllerAllowsNavigatingBack;
- (BOOL)controllerNeedsToRun;
- (BOOL)hasPrivacyLink;
- (BOOL)isEphemeral;
- (BYCapabilities)capabilities;
- (BYFlowSkipController)flowSkipController;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPasscodeCacheManager)passcodeCacheManager;
- (BYPreferencesController)buddyPreferences;
- (BuddyMiscState)miscState;
- (BuddyPasscodeController)init;
- (MCProfileConnection)managedConfiguration;
- (ProximitySetupController)proximitySetupController;
- (void)controllerWasPopped;
- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4;
- (void)passcodeViewController:(id)a3 didSetPasscode:(id)a4;
- (void)setBuddyPreferences:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlowSkipController:(id)a3;
- (void)setHasPrivacyLink:(BOOL)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setPasscodeCacheManager:(id)a3;
- (void)setProximitySetupController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyPasscodeController

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyPasscodeController *)self managedConfiguration];
  unsigned int v3 = [(MCProfileConnection *)v2 effectiveBoolValueForSetting:MCFeaturePasscodeModificationAllowed];

  if (v3 == 2) {
    return 0;
  }
  v4 = [(BuddyPasscodeController *)self managedConfiguration];
  unsigned __int8 v5 = [(MCProfileConnection *)v4 isPasscodeSet];

  char v14 = v5 & 1;
  char v13 = 0;
  v6 = [(BuddyPasscodeController *)self buddyPreferences];
  char v7 = 0;
  if (([(BYPreferencesController *)v6 BOOLForKey:@"Payment2Presented"] & 1) == 0) {
    char v7 = MGGetBoolAnswer() & 1;
  }

  if (v7) {
    char v13 = 1;
  }
  char v11 = 0;
  if ((v13 & 1) != 0
    || (v12 = [(BuddyPasscodeController *)self buddyPreferences],
        char v11 = 1,
        unsigned __int8 v8 = [(BYPreferencesController *)v12 BOOLForKey:@"Passcode4Presented"],
        char v9 = 0,
        (v8 & 1) == 0))
  {
    char v9 = v14 ^ 1;
  }
  BOOL v16 = v9 & 1;
  if (v11) {

  }
  return v16;
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSetupPasscode;
}

+ (BOOL)hiddenFromStoreDemoMode
{
  return 1;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

- (BuddyPasscodeController)init
{
  SEL v5 = a2;
  id location = 0;
  v4.receiver = self;
  v4.super_class = (Class)BuddyPasscodeController;
  id location = [(BuddyPasscodeBaseViewController *)&v4 init];
  objc_storeStrong(&location, location);
  if (location) {
    [location setPasscodeCreationDelegate:location];
  }
  v2 = (BuddyPasscodeController *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)viewDidLoad
{
  char v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  v2 = [(BuddyPasscodeController *)self proximitySetupController];
  unsigned int v3 = [(ProximitySetupController *)v2 information];
  id v4 = [(SASProximityInformation *)v3 appleID];

  if (v4) {
    objc_storeStrong(location, BYPrivacyAppleIDIdentifier);
  }
  [(BuddyPasscodeBaseViewController *)v9 setIncludeHeaderAnimation:location[0] == 0];
  v7.receiver = v9;
  v7.super_class = (Class)BuddyPasscodeController;
  [(BuddyPasscodeBaseViewController *)&v7 viewDidLoad];
  if (location[0])
  {
    id v6 = +[OBPrivacyLinkController linkWithBundleIdentifier:location[0]];
    [v6 setDisplayCaptionText:0];
    id v5 = [(BuddyPasscodeController *)v9 buttonTray];
    [v5 setPrivacyLinkController:v6];

    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BuddyPasscodeController;
  [(BuddyPasscodeBaseViewController *)&v7 viewWillAppear:a3];
  unsigned int v3 = [(BuddyPasscodeBaseViewController *)v10 flowItemDispositionProvider];
  unint64_t v4 = [(BuddyFlowItemDispositionProvider *)v3 dispositions] & 8;

  if (v4 == 8)
  {
    id v5 = [(BuddyPasscodeController *)v10 miscState];
    [(BuddyMiscState *)v5 setHasPresentedPasscodeFlow:0];
  }
  id v6 = [(BuddyPasscodeController *)v10 paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v6 clearActionForFeature:11];
}

- (BOOL)allowsSkip
{
  return +[BuddyPasscodeBaseViewController allowSkip];
}

- (BOOL)isEphemeral
{
  return ![(BuddyPasscodeController *)self allowsSkip];
}

- (BOOL)controllerAllowsNavigatingBack
{
  v2 = [(BuddyPasscodeController *)self managedConfiguration];
  char v3 = [(MCProfileConnection *)v2 isPasscodeSet] ^ 1;

  return v3 & 1;
}

- (void)controllerWasPopped
{
  v2 = [(BuddyPasscodeController *)self buddyPreferences];
  [(BYPreferencesController *)v2 removeObjectForKey:@"Passcode4Presented"];
}

- (void)passcodeViewController:(id)a3 didFinishWithPasscodeCreation:(id)a4
{
  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  if (v13)
  {
    v10 = [(BuddyPasscodeController *)v15 paneFeatureAnalyticsManager];
    [(BYPaneFeatureAnalyticsManager *)v10 recordActionWithValue:&__kCFBooleanTrue forFeature:11];
  }
  else
  {
    id v5 = [(BuddyPasscodeBaseViewController *)v15 flowItemDispositionProvider];
    unint64_t v6 = [(BuddyFlowItemDispositionProvider *)v5 dispositions] & 8;

    if (v6 == 8)
    {
      objc_super v7 = [(BuddyPasscodeController *)v15 miscState];
      [(BuddyMiscState *)v7 setHasPresentedPasscodeFlow:1];
    }
    BOOL v8 = [(BuddyPasscodeController *)v15 flowSkipController];
    [(BYFlowSkipController *)v8 didSkipFlow:BYFlowSkipIdentifierPasscode];

    SEL v9 = [(BuddyPasscodeController *)v15 paneFeatureAnalyticsManager];
    [(BYPaneFeatureAnalyticsManager *)v9 recordActionWithValue:&__kCFBooleanFalse forFeature:11];
  }
  char v11 = [(BuddyPasscodeController *)v15 buddyPreferences];
  [(BYPreferencesController *)v11 setObject:&__kCFBooleanTrue forKey:@"Passcode4Presented"];

  v12 = [(BuddyPasscodeController *)v15 delegate];
  [(BFFFlowItemDelegate *)v12 flowItemDone:v15 nextItemClass:0];

  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)passcodeViewController:(id)a3 didSetPasscode:(id)a4
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  id v5 = [(BuddyPasscodeBaseViewController *)v10 flowItemDispositionProvider];
  unint64_t v6 = [(BuddyFlowItemDispositionProvider *)v5 dispositions] & 8;

  objc_super v7 = [(BuddyPasscodeController *)v10 passcodeCacheManager];
  if (v6 == 8) {
    [(BYPasscodeCacheManager *)v7 cachePasscode:v8 retrievable:1];
  }
  else {
    [(BYPasscodeCacheManager *)v7 cachePasscode:v8];
  }

  BYSetupAssistantCreateAuthContext();
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (ProximitySetupController)proximitySetupController
{
  return self->_proximitySetupController;
}

- (void)setProximitySetupController:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (BYPasscodeCacheManager)passcodeCacheManager
{
  return self->_passcodeCacheManager;
}

- (void)setPasscodeCacheManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
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

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
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

- (BOOL)hasPrivacyLink
{
  return self->_hasPrivacyLink;
}

- (void)setHasPrivacyLink:(BOOL)a3
{
  self->_hasPrivacyLink = a3;
}

- (void).cxx_destruct
{
}

@end