@interface BuddySettingsDataUsageController
- (BOOL)controllerNeedsToRun;
- (BuddySettingsDataUsageController)init;
- (void)_learnMoreTapped:(id)a3;
- (void)continueTapped:(id)a3;
- (void)viewDidLoad;
@end

@implementation BuddySettingsDataUsageController

- (BuddySettingsDataUsageController)init
{
  id location = self;
  v18[1] = (id)a2;
  v2 = +[UIScreen mainScreen];
  [(UIScreen *)v2 scale];
  v18[0] = +[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", @"com.apple.Preferences", 2);

  if (+[PDCPreflightManager isPreflightFeatureEnabled])
  {
    id v3 = location;
    v4 = +[NSBundle mainBundle];
    v5 = [(NSBundle *)v4 localizedStringForKey:@"SETTINGS_DATA_USAGE_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    v6 = +[NSBundle mainBundle];
    id v7 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"SETTINGS_DATA_USAGE_DETAIL"];
    v8 = [(NSBundle *)v6 localizedStringForKey:v7 value:&stru_1002B4E18 table:@"Localizable"];
    id location = 0;
    v17.receiver = v3;
    v17.super_class = (Class)BuddySettingsDataUsageController;
    id location = [(BuddySettingsDataUsageController *)&v17 initWithTitle:v5 detailText:v8 icon:v18[0]];
    objc_storeStrong(&location, location);
  }
  else
  {
    id v9 = location;
    v10 = +[NSBundle mainBundle];
    v11 = [(NSBundle *)v10 localizedStringForKey:@"SETTINGS_CONTACTS_TITLE" value:&stru_1002B4E18 table:@"Localizable"];
    v12 = +[NSBundle mainBundle];
    v13 = [(NSBundle *)v12 localizedStringForKey:@"SETTINGS_CONTACTS_DETAIL" value:&stru_1002B4E18 table:@"Localizable"];
    id location = 0;
    v16.receiver = v9;
    v16.super_class = (Class)BuddySettingsDataUsageController;
    id location = [(BuddySettingsDataUsageController *)&v16 initWithTitle:v11 detailText:v13 icon:v18[0]];
    objc_storeStrong(&location, location);
  }
  v14 = (BuddySettingsDataUsageController *)location;
  objc_storeStrong(v18, 0);
  objc_storeStrong(&location, 0);
  return v14;
}

- (void)viewDidLoad
{
  id v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddySettingsDataUsageController;
  [(BuddyDataUsageController *)&v5 viewDidLoad];
  if (+[PDCPreflightManager isPreflightFeatureEnabled])
  {
    v2 = v7;
    id v3 = +[NSBundle mainBundle];
    v4 = [(NSBundle *)v3 localizedStringForKey:@"LEARN_MORE" value:&stru_1002B4E18 table:@"Localizable"];
    [(BuddyWelcomeController *)v2 addLinkButton:v4 action:"_learnMoreTapped:"];
  }
}

- (void)continueTapped:(id)a3
{
  SEL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (+[PDCPreflightManager isPreflightFeatureEnabled])
  {
    id v3 = +[BYPreferencesController buddyPreferences];
    [v3 setObject:&__kCFBooleanTrue forKey:@"SettingsDataUsagePresented"];
  }
  else
  {
    id v3 = +[BYPreferencesController buddyPreferences];
    [v3 setObject:&__kCFBooleanTrue forKey:@"SettingsContactsPresented"];
  }

  v4.receiver = v6;
  v4.super_class = (Class)BuddySettingsDataUsageController;
  [(BuddyDataUsageController *)&v4 continueTapped:v6];
  objc_storeStrong(location, 0);
}

- (BOOL)controllerNeedsToRun
{
  id v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)BuddySettingsDataUsageController;
  if ([(BuddyDataUsageController *)&v5 controllerNeedsToRun])
  {
    if (+[PDCPreflightManager isPreflightFeatureEnabled])
    {
      v2 = [(BuddyDataUsageController *)v7 existingSettings];
      id v3 = [(BuddyExistingSettings *)v2 backupMetadata];
      char v8 = ([v3 settingsDataUsagePresented] ^ 1) & 1;
    }
    else
    {
      v2 = [(BuddyDataUsageController *)v7 existingSettings];
      id v3 = [(BuddyExistingSettings *)v2 backupMetadata];
      char v8 = ([v3 settingsContactsPresented] ^ 1) & 1;
    }
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

- (void)_learnMoreTapped:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v16 = 0;
  id obj = 0;
  id v3 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.Preferences" allowPlaceholder:0 error:&obj];
  objc_storeStrong(&v16, obj);
  id v15 = v3;
  if (v16)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      char v10 = 0;
      char v8 = 0;
      if (_BYIsInternalInstall())
      {
        objc_super v4 = (NSString *)v16;
      }
      else if (v16)
      {
        id v11 = [v16 domain];
        char v10 = 1;
        objc_super v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v11, [v16 code]);
        id v9 = v4;
        char v8 = 1;
      }
      else
      {
        objc_super v4 = 0;
      }
      sub_10004BB7C((uint64_t)buf, (uint64_t)v4);
      _os_log_error_impl((void *)&_mh_execute_header, oslog, v12, "Failed to retrieve application record: %{public}@", buf, 0xCu);
      if (v8) {

      }
      if (v10) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v5 = [v15 identities];
  id v7 = [v5 firstObject];

  id v6 = (id)PDUDisclosureReviewViewControllerForApplicationWithVariant();
  [(BuddySettingsDataUsageController *)v18 presentViewController:v6 animated:1 completion:0];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

@end