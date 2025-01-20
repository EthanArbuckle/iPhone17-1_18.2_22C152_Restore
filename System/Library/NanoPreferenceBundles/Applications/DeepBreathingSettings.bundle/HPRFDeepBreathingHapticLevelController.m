@interface HPRFDeepBreathingHapticLevelController
+ (id)deepBreathingHapticLevel;
- (HPRFDeepBreathingHapticLevelController)init;
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

@implementation HPRFDeepBreathingHapticLevelController

+ (id)deepBreathingHapticLevel
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"HapticLevel", kNLDeepBreathingPreferencesDomain, &keyExistsAndHasValidFormat);
  uint64_t v3 = 2;
  if (keyExistsAndHasValidFormat) {
    uint64_t v3 = AppIntegerValue;
  }
  CFStringRef v4 = @"PROMINENT_ID";
  if (v3 == 3) {
    CFStringRef v4 = @"MINIMAL_ID";
  }
  if (v3 == 1) {
    v5 = @"NONE_ID";
  }
  else {
    v5 = (__CFString *)v4;
  }
  v6 = sub_4B3C(v5);

  return v6;
}

- (HPRFDeepBreathingHapticLevelController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFDeepBreathingHapticLevelController;
  v2 = [(HPRFDeepBreathingHapticLevelController *)&v6 init];
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
  v4.super_class = (Class)HPRFDeepBreathingHapticLevelController;
  [(HPRFDeepBreathingHapticLevelController *)&v4 viewDidLoad];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)deepBreathingHapticLevelDidChange, kNLDeepBreathingPreferencesChangedNotification, 0, (CFNotificationSuspensionBehavior)0);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)HPRFDeepBreathingHapticLevelController;
  [(HPRFDeepBreathingHapticLevelController *)&v4 dealloc];
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"PANE_TITLE" value:&stru_8298 table:@"DeepBreathingHapticLevel"];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v24 = OBJC_IVAR___PSListController__specifiers;
    objc_super v4 = +[NSMutableArray array];
    v5 = +[PSSpecifier groupSpecifierWithID:@"DEEP_BREATHING_HAPTIC_LEVEL_GROUP_ID"];
    [v5 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v23 = v5;
    [v4 addObject:v5];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v30[0] = @"NONE_ID";
    v30[1] = @"MINIMAL_ID";
    v30[2] = @"PROMINENT_ID";
    objc_super v6 = +[NSArray arrayWithObjects:v30 count:3];
    id v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          v12 = sub_4B3C(v11);
          v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          [v13 setIdentifier:v11];
          [v4 addObject:v13];
        }
        id v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v8);
    }

    v14 = *(void **)&self->BPSNotificationAppController_opaque[v24];
    *(void *)&self->BPSNotificationAppController_opaque[v24] = v4;
    id v15 = v4;

    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"HapticLevel", kNLDeepBreathingPreferencesDomain, &keyExistsAndHasValidFormat);
    uint64_t v17 = 2;
    if (keyExistsAndHasValidFormat) {
      uint64_t v17 = AppIntegerValue;
    }
    CFStringRef v18 = @"MINIMAL_ID";
    if (v17 != 3) {
      CFStringRef v18 = @"PROMINENT_ID";
    }
    if (v17 == 1) {
      CFStringRef v19 = @"NONE_ID";
    }
    else {
      CFStringRef v19 = v18;
    }
    v20 = [*(id *)&self->BPSNotificationAppController_opaque[v24] specifierForID:v19];

    [v23 setProperty:v20 forKey:PSRadioGroupCheckedSpecifierKey];
    v21 = [(HPRFDeepBreathingHapticLevelController *)self localizedPaneTitle];
    [(HPRFDeepBreathingHapticLevelController *)self setTitle:v21];

    uint64_t v3 = *(void **)&self->BPSNotificationAppController_opaque[v24];
  }

  return v3;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HPRFDeepBreathingHapticLevelController *)self indexForIndexPath:v7];
  uint64_t v9 = [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v34[0] = @"NONE_ID";
  v34[1] = @"MINIMAL_ID";
  v34[2] = @"PROMINENT_ID";
  v10 = +[NSArray arrayWithObjects:v34 count:3];
  id v11 = [v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    id v27 = v6;
    uint64_t v13 = *(void *)v30;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v16 = [v9 identifier];
        unsigned int v17 = [v15 isEqualToString:v16];

        if (v17)
        {
          id v18 = v15;
          if ([v18 isEqualToString:@"NONE_ID"])
          {
            uint64_t v19 = 1;
            id v6 = v27;
            v20 = &CFNotificationCenterAddObserver_ptr;
          }
          else
          {
            id v6 = v27;
            v20 = &CFNotificationCenterAddObserver_ptr;
            if ([v18 isEqualToString:@"MINIMAL_ID"])
            {
              uint64_t v19 = 3;
            }
            else
            {
              [v18 isEqualToString:@"PROMINENT_ID"];
              uint64_t v19 = 2;
            }
          }

          v21 = +[NSNumber numberWithInteger:v19];
          CFStringRef v22 = (const __CFString *)kNLDeepBreathingPreferencesDomain;
          CFPreferencesSetAppValue(@"HapticLevel", v21, kNLDeepBreathingPreferencesDomain);

          CFPreferencesAppSynchronize(v22);
          syncManager = self->_syncManager;
          CFStringRef v33 = @"HapticLevel";
          v10 = [v20[45] arrayWithObjects:&v33 count:1];
          uint64_t v24 = +[NSSet setWithArray:v10];
          [(NPSManager *)syncManager synchronizeUserDefaultsDomain:v22 keys:v24];

          goto LABEL_16;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    id v6 = v27;
  }
LABEL_16:

  [(HPRFDeepBreathingHapticLevelController *)self reloadSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSViewController__parentController]);
  long long v26 = [(HPRFDeepBreathingHapticLevelController *)self specifier];
  [WeakRetained reloadSpecifier:v26];

  v28.receiver = self;
  v28.super_class = (Class)HPRFDeepBreathingHapticLevelController;
  [(HPRFDeepBreathingHapticLevelController *)&v28 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFDeepBreathingHapticLevelController *)self bundle];
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