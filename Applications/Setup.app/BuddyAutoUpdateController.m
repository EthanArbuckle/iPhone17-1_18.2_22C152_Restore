@interface BuddyAutoUpdateController
+ (BOOL)hiddenFromMultiUser;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
+ (void)clearAutoDownloadWithUpdateSetting:(id)a3;
+ (void)setAutoDownloadWithUpdateEnabled:(BOOL)a3 presented:(BOOL)a4 buddyPreferences:(id)a5;
- (BFFSettingsManager)settingsManager;
- (BOOL)controllerNeedsToRun;
- (BYCapabilities)capabilities;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYPreferencesController)buddyPreferences;
- (BuddyAutoUpdateController)init;
- (BuddyPendingRestoreState)pendingRestoreState;
- (OBAnimationController)animationController;
- (void)_enableAutomaticDownload:(BOOL)a3 enableAutomaticUpdate:(BOOL)a4;
- (void)_updateAutomaticallyPressed:(id)a3;
- (void)_updateManuallyPressed:(id)a3;
- (void)controllerWasPopped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnimationController:(id)a3;
- (void)setBuddyPreferences:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setPendingRestoreState:(id)a3;
- (void)setSettingsManager:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BuddyAutoUpdateController

- (BuddyAutoUpdateController)init
{
  id location = self;
  v10[1] = (id)a2;
  v2 = +[NSBundle mainBundle];
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"AUTO_UPDATE_TITLE"];
  v10[0] = [(NSBundle *)v2 localizedStringForKey:v3 value:&stru_1002B4E18 table:@"Localizable"];

  v4 = +[NSBundle mainBundle];
  id v9 = [(NSBundle *)v4 localizedStringForKey:@"AUTO_UPDATE_DESCRIPTION" value:&stru_1002B4E18 table:@"Localizable"];

  id v5 = location;
  id location = 0;
  v8.receiver = v5;
  v8.super_class = (Class)BuddyAutoUpdateController;
  id location = [(BuddyAutoUpdateController *)&v8 initWithTitle:v10[0] detailText:v9 symbolName:0 contentLayout:2];
  objc_storeStrong(&location, location);
  v6 = (BuddyAutoUpdateController *)location;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(v10, 0);
  objc_storeStrong(&location, 0);
  return v6;
}

- (void)viewDidLoad
{
  id v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)BuddyAutoUpdateController;
  [(BuddyAutoUpdateController *)&v7 viewDidLoad];
  v2 = +[NSBundle mainBundle];
  id v3 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"AUTO_UPDATE_BACK_TITLE"];
  v4 = [(NSBundle *)v2 localizedStringForKey:v3 value:&stru_1002B4E18 table:@"Localizable"];
  id v5 = [(BuddyAutoUpdateController *)v9 navigationItem];
  [v5 setBackButtonTitle:v4];

  id v6 = [(BuddyAutoUpdateController *)v9 buddy_animationController:@"Update"];
  [(BuddyAutoUpdateController *)v9 setAnimationController:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v7 = self;
  SEL v6 = a2;
  BOOL v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)BuddyAutoUpdateController;
  [(BuddyAutoUpdateController *)&v4 viewWillAppear:a3];
  id v3 = [(BuddyAutoUpdateController *)v7 animationController];
  [(OBAnimationController *)v3 startAnimation];
}

+ (void)setAutoDownloadWithUpdateEnabled:(BOOL)a3 presented:(BOOL)a4 buddyPreferences:(id)a5
{
  id v12 = a1;
  SEL v11 = a2;
  BOOL v10 = a3;
  BOOL v9 = a4;
  id location = 0;
  objc_storeStrong(&location, a5);
  id v5 = location;
  SEL v6 = +[NSNumber numberWithBool:v9];
  [v5 setObject:v6 forKey:@"AutoUpdatePresented"];

  id v7 = [objc_alloc((Class)SUManagerClient) initWithDelegate:0 clientType:1];
  [v7 enableAutomaticDownload:v10];
  [v7 enableAutomaticUpdateV2:v10];
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&location, 0);
}

+ (void)clearAutoDownloadWithUpdateSetting:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(id)objc_opt_class() setAutoDownloadWithUpdateEnabled:0 presented:0 buddyPreferences:location[0]];
  objc_storeStrong(location, 0);
}

- (void)_enableAutomaticDownload:(BOOL)a3 enableAutomaticUpdate:(BOOL)a4
{
  v14 = self;
  SEL v13 = a2;
  BOOL v12 = a3;
  BOOL v11 = a4;
  id v10 = [objc_alloc((Class)SUManagerClient) initWithDelegate:0 clientType:1];
  [v10 enableAutomaticDownload:v12];
  [v10 enableAutomaticUpdateV2:v11];
  objc_super v4 = [(BuddyAutoUpdateController *)v14 settingsManager];
  [(BFFSettingsManager *)v4 setAutoDownloadEnabled:v12];

  id v5 = [(BuddyAutoUpdateController *)v14 settingsManager];
  [(BFFSettingsManager *)v5 setAutoUpdateEnabled:v11];

  SEL v6 = [(BuddyAutoUpdateController *)v14 paneFeatureAnalyticsManager];
  id v7 = +[NSNumber numberWithBool:v12];
  [(BYPaneFeatureAnalyticsManager *)v6 recordActionWithValue:v7 forFeature:2];

  SEL v8 = [(BuddyAutoUpdateController *)v14 paneFeatureAnalyticsManager];
  BOOL v9 = +[NSNumber numberWithBool:v11];
  [(BYPaneFeatureAnalyticsManager *)v8 recordActionWithValue:v9 forFeature:1];

  objc_storeStrong(&v10, 0);
}

- (void)_updateAutomaticallyPressed:(id)a3
{
  SEL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyAutoUpdateController *)v6 _enableAutomaticDownload:1 enableAutomaticUpdate:1];
  id v3 = [(BuddyAutoUpdateController *)v6 buddyPreferences];
  [(BYPreferencesController *)v3 setObject:&__kCFBooleanTrue forKey:@"AutoUpdatePresented"];

  objc_super v4 = [(BuddyWelcomeController *)v6 delegate];
  [(BFFFlowItemDelegate *)v4 flowItemDone:v6];

  objc_storeStrong(location, 0);
}

- (void)_updateManuallyPressed:(id)a3
{
  SEL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(BuddyAutoUpdateController *)v6 _enableAutomaticDownload:1 enableAutomaticUpdate:0];
  id v3 = [(BuddyAutoUpdateController *)v6 buddyPreferences];
  [(BYPreferencesController *)v3 setObject:&__kCFBooleanTrue forKey:@"AutoUpdatePresented"];

  objc_super v4 = [(BuddyWelcomeController *)v6 delegate];
  [(BFFFlowItemDelegate *)v4 flowItemDone:v6];

  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipSoftwareUpdate;
}

+ (unint64_t)applicableDispositions
{
  return 12;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (BOOL)controllerNeedsToRun
{
  v2 = [(BuddyAutoUpdateController *)self buddyPreferences];
  char v3 = [(BYPreferencesController *)v2 BOOLForKey:@"AutoUpdatePresented"] ^ 1;

  return v3 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v3 = [(BuddyAutoUpdateController *)v17 capabilities];
  unsigned __int8 v4 = [(BYCapabilities *)v3 mgHasGreenTea];

  id v5 = v17;
  if (v4)
  {
    SEL v6 = +[NSBundle mainBundle];
    id v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"AUTO_UPDATE_INSTALL_UPDATES_AUTOMATICALLY"];
    SEL v8 = [(NSBundle *)v6 localizedStringForKey:v7 value:&stru_1002B4E18 table:@"Localizable"];
    [(BuddyWelcomeController *)v5 addBoldButton:v8 action:"_updateAutomaticallyPressed:"];

    BOOL v9 = v17;
    id v10 = +[NSBundle mainBundle];
    BOOL v11 = (NSString *)+[UIDevice modelSpecificLocalizedStringKeyForKey:@"AUTO_UPDATE_DOWNLOAD_IOS_UPDATES_AUTOMATICALLY"];
    BOOL v12 = [(NSBundle *)v10 localizedStringForKey:v11 value:&stru_1002B4E18 table:@"Localizable"];
    [(BuddyWelcomeController *)v9 addLinkButton:v12 action:"_updateManuallyPressed:"];
  }
  else
  {
    SEL v13 = +[NSBundle mainBundle];
    v14 = [(NSBundle *)v13 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
    [(BuddyWelcomeController *)v5 addBoldButton:v14 action:"_updateAutomaticallyPressed:"];

    v15 = v17;
    id v10 = +[NSBundle mainBundle];
    BOOL v11 = [(NSBundle *)v10 localizedStringForKey:@"AUTO_UPDATE_DOWNLOAD_UPDATES_AUTOMATICALLY" value:&stru_1002B4E18 table:@"Localizable"];
    [(BuddyWelcomeController *)v15 addLinkButton:v11 action:"_updateManuallyPressed:"];
  }

  if (location[0]) {
    (*((void (**)(id, uint64_t))location[0] + 2))(location[0], 1);
  }
  objc_storeStrong(location, 0);
}

- (void)controllerWasPopped
{
  v2 = [(BuddyAutoUpdateController *)self buddyPreferences];
  [(BYPreferencesController *)v2 removeObjectForKey:@"AutoUpdatePresented"];

  char v3 = [(BuddyAutoUpdateController *)self paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v3 clearActionForFeature:1];

  unsigned __int8 v4 = [(BuddyAutoUpdateController *)self paneFeatureAnalyticsManager];
  [(BYPaneFeatureAnalyticsManager *)v4 clearActionForFeature:2];
}

- (BuddyPendingRestoreState)pendingRestoreState
{
  return self->_pendingRestoreState;
}

- (void)setPendingRestoreState:(id)a3
{
}

- (BFFSettingsManager)settingsManager
{
  return self->_settingsManager;
}

- (void)setSettingsManager:(id)a3
{
}

- (BYPreferencesController)buddyPreferences
{
  return self->_buddyPreferences;
}

- (void)setBuddyPreferences:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return self->_paneFeatureAnalyticsManager;
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
}

- (BYCapabilities)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end