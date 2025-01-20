@interface BuddyAppStoreController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BYPreferencesController)buddyPreferencesExcludedFromBackup;
- (BuddyAppStoreController)init;
- (BuddySuspendTask)suspendTask;
- (unint64_t)allowedTerminationSources;
- (void)_continuePressed:(id)a3;
- (void)setBuddyPreferencesExcludedFromBackup:(id)a3;
- (void)setSuspendTask:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddyAppStoreController

- (BuddyAppStoreController)init
{
  id location = self;
  v11[1] = (id)a2;
  v2 = +[UIScreen mainScreen];
  [(UIScreen *)v2 scale];
  v11[0] = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.AppStore", 2);

  id v3 = location;
  v4 = +[NSBundle mainBundle];
  v5 = [(NSBundle *)v4 localizedStringForKey:@"APP_STORE_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
  v6 = +[NSBundle mainBundle];
  v7 = [(NSBundle *)v6 localizedStringForKey:@"APP_STORE_DETAIL" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v10.receiver = v3;
  v10.super_class = (Class)BuddyAppStoreController;
  id location = [(BuddyAppStoreController *)&v10 initWithTitle:v5 detailText:v7 icon:v11[0]];
  objc_storeStrong(&location, location);

  v8 = (BuddyAppStoreController *)location;
  objc_storeStrong(v11, 0);
  objc_storeStrong(&location, 0);
  return v8;
}

- (void)viewDidLoad
{
  v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)BuddyAppStoreController;
  [(BuddyAppStoreController *)&v11 viewDidLoad];
  id v2 = [(BuddyAppStoreController *)v13 navigationItem];
  [v2 setHidesBackButton:1];

  id v3 = [(BuddyAppStoreController *)v13 suspendTask];
  v4 = [(BuddySuspendTask *)v3 message];

  if (v4)
  {
    id v5 = [(BuddyAppStoreController *)v13 headerView];
    v6 = [(BuddyAppStoreController *)v13 suspendTask];
    v7 = [(BuddySuspendTask *)v6 message];
    [v5 setDetailText:v7];
  }
  v8 = v13;
  v9 = +[NSBundle mainBundle];
  objc_super v10 = [(NSBundle *)v9 localizedStringForKey:@"CONTINUE" value:&stru_1002B4E18 table:@"Localizable"];
  [(BuddyWelcomeController *)v8 addBoldButton:v10 action:"_continuePressed:"];
}

+ (id)cloudConfigSkipKey
{
  return kMCCCSkipAppStore;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (unint64_t)allowedTerminationSources
{
  return 2;
}

- (void)_continuePressed:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(BuddyAppStoreController *)v6 buddyPreferencesExcludedFromBackup];
  [(BYPreferencesController *)v3 setObject:&__kCFBooleanTrue forKey:@"AppStorePresented"];

  v4 = [(BuddyWelcomeController *)v6 delegate];
  [(BFFFlowItemDelegate *)v4 flowItemDone:v6];

  objc_storeStrong(location, 0);
}

- (BuddySuspendTask)suspendTask
{
  return self->_suspendTask;
}

- (void)setSuspendTask:(id)a3
{
}

- (BYPreferencesController)buddyPreferencesExcludedFromBackup
{
  return self->_buddyPreferencesExcludedFromBackup;
}

- (void)setBuddyPreferencesExcludedFromBackup:(id)a3
{
}

- (void).cxx_destruct
{
}

@end