@interface HPRFDeepBreathingBreathRateController
+ (id)deepBreathingBreathRate;
- (HPRFDeepBreathingBreathRateController)init;
- (NPSManager)syncManager;
- (id)applicationBundleIdentifier;
- (id)bundle;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)dealloc;
- (void)setSyncManager:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HPRFDeepBreathingBreathRateController

+ (id)deepBreathingBreathRate
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"BreathRate", kNLDeepBreathingPreferencesDomain, &keyExistsAndHasValidFormat);
  uint64_t v3 = 7;
  if (keyExistsAndHasValidFormat) {
    uint64_t v3 = AppIntegerValue;
  }
  v4 = +[NSString stringWithFormat:@"%@%ld", @"ID_BPM_", v3];
  v5 = sub_4228(v4, 1);

  return v5;
}

- (HPRFDeepBreathingBreathRateController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFDeepBreathingBreathRateController;
  v2 = [(HPRFDeepBreathingBreathRateController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v3;
  }
  return v2;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)HPRFDeepBreathingBreathRateController;
  [(HPRFDeepBreathingBreathRateController *)&v4 viewDidLoad];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)deepBreathingBreathRateDidChange, kNLDeepBreathingPreferencesChangedNotification, 0, (CFNotificationSuspensionBehavior)0);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)HPRFDeepBreathingBreathRateController;
  [(HPRFDeepBreathingBreathRateController *)&v4 dealloc];
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"PANE_TITLE" value:&stru_8298 table:@"DeepBreathingBreathRate"];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v20 = OBJC_IVAR___PSListController__specifiers;
    objc_super v4 = +[NSMutableArray array];
    v5 = +[PSSpecifier groupSpecifierWithID:@"DEEP_BREATHING_BREATH_RATE_GROUP_ID"];
    [v5 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v19 = v5;
    [v4 addObject:v5];
    for (uint64_t i = 4; i != 11; ++i)
    {
      v7 = +[NSString stringWithFormat:@"%@%ld", @"ID_BPM_", i];
      v8 = sub_4228(v7, 0);
      v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:0 set:0 get:0 detail:0 cell:3 edit:0];

      [v9 setIdentifier:v7];
      [v4 addObject:v9];
    }
    v10 = *(void **)&self->BPSNotificationAppController_opaque[v20];
    *(void *)&self->BPSNotificationAppController_opaque[v20] = v4;
    id v11 = v4;

    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"BreathRate", kNLDeepBreathingPreferencesDomain, &keyExistsAndHasValidFormat);
    uint64_t v13 = 7;
    if (keyExistsAndHasValidFormat) {
      uint64_t v13 = AppIntegerValue;
    }
    v14 = *(void **)&self->BPSNotificationAppController_opaque[v20];
    v15 = +[NSString stringWithFormat:@"%@%ld", @"ID_BPM_", v13];
    v16 = [v14 specifierForID:v15];

    [v19 setProperty:v16 forKey:PSRadioGroupCheckedSpecifierKey];
    v17 = [(HPRFDeepBreathingBreathRateController *)self localizedPaneTitle];
    [(HPRFDeepBreathingBreathRateController *)self setTitle:v17];

    uint64_t v3 = *(void **)&self->BPSNotificationAppController_opaque[v20];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  id v7 = [(HPRFDeepBreathingBreathRateController *)self indexForIndexPath:v6];
  v8 = [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v7];
  uint64_t v9 = 4;
  while (1)
  {
    v10 = +[NSString stringWithFormat:@"%@%ld", @"ID_BPM_", v9];
    id v11 = [v8 identifier];
    unsigned __int8 v12 = [v10 isEqualToString:v11];

    if (v12) {
      break;
    }
    if (++v9 == 11) {
      goto LABEL_6;
    }
  }
  uint64_t v13 = +[NSNumber numberWithInteger:v9];
  CFStringRef v14 = (const __CFString *)kNLDeepBreathingPreferencesDomain;
  CFPreferencesSetAppValue(@"BreathRate", v13, kNLDeepBreathingPreferencesDomain);
  CFPreferencesAppSynchronize(v14);
  syncManager = self->_syncManager;
  CFStringRef v22 = @"BreathRate";
  v16 = +[NSArray arrayWithObjects:&v22 count:1];
  v17 = +[NSSet setWithArray:v16];
  [(NPSManager *)syncManager synchronizeUserDefaultsDomain:v14 keys:v17];

LABEL_6:
  [(HPRFDeepBreathingBreathRateController *)self reloadSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSViewController__parentController]);
  v19 = [(HPRFDeepBreathingBreathRateController *)self specifier];
  [WeakRetained reloadSpecifier:v19];

  v21.receiver = self;
  v21.super_class = (Class)HPRFDeepBreathingBreathRateController;
  [(HPRFDeepBreathingBreathRateController *)&v21 tableView:v20 didSelectRowAtIndexPath:v6];
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFDeepBreathingBreathRateController *)self bundle];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end