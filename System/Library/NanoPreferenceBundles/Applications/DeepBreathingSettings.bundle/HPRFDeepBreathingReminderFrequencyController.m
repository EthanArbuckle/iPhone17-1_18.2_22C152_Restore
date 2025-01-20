@interface HPRFDeepBreathingReminderFrequencyController
+ (id)deepBreathingReminderFrequency;
+ (int64_t)_selectedReminderFrequency;
+ (int64_t)_selectedRemindersPerDay;
- (HPRFDeepBreathingReminderFrequencyController)init;
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

@implementation HPRFDeepBreathingReminderFrequencyController

+ (id)deepBreathingReminderFrequency
{
  if (+[_HKBehavior activePairedWatchHasSmartFitnessCoaching](_HKBehavior, "activePairedWatchHasSmartFitnessCoaching"))id v3 = [a1 _selectedRemindersPerDay]; {
  else
  }
    id v3 = [a1 _selectedReminderFrequency];
  v4 = +[NSNumber numberWithInteger:v3];
  v5 = +[NSString stringWithFormat:@"%@", v4];
  v6 = sub_5CE0(v5, 1);

  return v6;
}

+ (int64_t)_selectedReminderFrequency
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"ReminderFrequency", kNLDeepBreathingPreferencesDomain, &keyExistsAndHasValidFormat);
  id v3 = FIUIDeepBreathingReminderFrequencyOptions();
  v4 = +[NSNumber numberWithInteger:AppIntegerValue];
  unsigned int v5 = [v3 containsObject:v4];

  if (v5) {
    int64_t v6 = AppIntegerValue;
  }
  else {
    int64_t v6 = 18000;
  }
  if (keyExistsAndHasValidFormat) {
    return v6;
  }
  else {
    return 18000;
  }
}

+ (int64_t)_selectedRemindersPerDay
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"RemindersPerDay", kNLDeepBreathingPreferencesDomain, &keyExistsAndHasValidFormat);
  id v3 = FIUIDeepBreathingRemindersPerDayOptions();
  v4 = +[NSNumber numberWithInteger:AppIntegerValue];
  unsigned int v5 = [v3 containsObject:v4];

  if (v5) {
    int64_t v6 = AppIntegerValue;
  }
  else {
    int64_t v6 = 2;
  }
  if (keyExistsAndHasValidFormat) {
    return v6;
  }
  else {
    return 2;
  }
}

- (HPRFDeepBreathingReminderFrequencyController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFDeepBreathingReminderFrequencyController;
  v2 = [(HPRFDeepBreathingReminderFrequencyController *)&v6 init];
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
  v4.super_class = (Class)HPRFDeepBreathingReminderFrequencyController;
  [(HPRFDeepBreathingReminderFrequencyController *)&v4 viewDidLoad];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)deepBreathingReminderFrequencyDidChange, kNLDeepBreathingPreferencesChangedNotification, 0, (CFNotificationSuspensionBehavior)0);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)HPRFDeepBreathingReminderFrequencyController;
  [(HPRFDeepBreathingReminderFrequencyController *)&v4 dealloc];
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"DEEP_BREATHING_REMINDER_PANE_TITLE" value:&stru_8298 table:@"DeepBreathingReminderFrequency"];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = (id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = *v3;
  if (!*v3)
  {
    v24 = self;
    unsigned int v5 = +[NSMutableArray array];
    objc_super v6 = +[PSSpecifier groupSpecifierWithID:@"DEEP_BREATHING_REMINDER_GROUP_ID"];
    [v6 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    v23 = v6;
    [v5 addObject:v6];
    if (+[_HKBehavior activePairedWatchHasSmartFitnessCoaching])FIUIDeepBreathingRemindersPerDayOptions(); {
    else
    }
      FIUIDeepBreathingReminderFrequencyOptions();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(obj);
          }
          v11 = +[NSString stringWithFormat:@"%@", *(void *)(*((void *)&v26 + 1) + 8 * i)];
          v12 = sub_5CE0(v11, 0);
          v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:0 set:0 get:0 detail:0 cell:3 edit:0];

          [v13 setIdentifier:v11];
          [v5 addObject:v13];
        }
        id v8 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v8);
    }

    objc_storeStrong(v3, v5);
    unsigned int v14 = +[_HKBehavior activePairedWatchHasSmartFitnessCoaching];
    v15 = objc_opt_class();
    if (v14) {
      id v16 = [v15 _selectedRemindersPerDay];
    }
    else {
      id v16 = [v15 _selectedReminderFrequency];
    }
    id v17 = *v3;
    v18 = +[NSNumber numberWithInteger:v16];
    v19 = +[NSString stringWithFormat:@"%@", v18];
    v20 = [v17 specifierForID:v19];

    [v23 setProperty:v20 forKey:PSRadioGroupCheckedSpecifierKey];
    v21 = [(HPRFDeepBreathingReminderFrequencyController *)v24 localizedPaneTitle];
    [(HPRFDeepBreathingReminderFrequencyController *)v24 setTitle:v21];

    id v4 = *v3;
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HPRFDeepBreathingReminderFrequencyController *)self indexForIndexPath:v7];
  uint64_t v9 = [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  if (!+[_HKBehavior activePairedWatchHasSmartFitnessCoaching])
  {
    long long v41 = 0uLL;
    long long v42 = 0uLL;
    long long v39 = 0uLL;
    long long v40 = 0uLL;
    FIUIDeepBreathingReminderFrequencyOptions();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v19 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v19)
    {
      id v20 = v19;
      v34 = self;
      id v35 = v7;
      id v36 = v6;
      uint64_t v21 = *(void *)v40;
      while (2)
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(obj);
          }
          unsigned int v14 = *(const void **)(*((void *)&v39 + 1) + 8 * i);
          v23 = +[NSString stringWithFormat:@"%@", v14];
          v24 = [v9 identifier];
          unsigned int v25 = [v23 isEqualToString:v24];

          if (v25)
          {
            CFStringRef v27 = (const __CFString *)kNLDeepBreathingPreferencesDomain;
            CFStringRef v26 = @"ReminderFrequency";
LABEL_23:
            CFPreferencesSetAppValue(v26, v14, v27);
            char v18 = 0;
            goto LABEL_24;
          }
        }
        id v20 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
        char v18 = 1;
        if (v20) {
          continue;
        }
        goto LABEL_19;
      }
    }
LABEL_20:
    CFStringRef v26 = 0;
    char v18 = 1;
    goto LABEL_25;
  }
  long long v45 = 0uLL;
  long long v46 = 0uLL;
  long long v43 = 0uLL;
  long long v44 = 0uLL;
  FIUIDeepBreathingRemindersPerDayOptions();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (!v10) {
    goto LABEL_20;
  }
  id v11 = v10;
  v34 = self;
  id v35 = v7;
  id v36 = v6;
  uint64_t v12 = *(void *)v44;
  while (2)
  {
    for (j = 0; j != v11; j = (char *)j + 1)
    {
      if (*(void *)v44 != v12) {
        objc_enumerationMutation(obj);
      }
      unsigned int v14 = *(const void **)(*((void *)&v43 + 1) + 8 * (void)j);
      v15 = +[NSString stringWithFormat:@"%@", v14];
      id v16 = [v9 identifier];
      unsigned int v17 = [v15 isEqualToString:v16];

      if (v17)
      {
        CFStringRef v27 = (const __CFString *)kNLDeepBreathingPreferencesDomain;
        CFStringRef v26 = @"RemindersPerDay";
        goto LABEL_23;
      }
    }
    id v11 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    char v18 = 1;
    if (v11) {
      continue;
    }
    break;
  }
LABEL_19:
  CFStringRef v26 = 0;
LABEL_24:
  id v7 = v35;
  id v6 = v36;
  self = v34;
LABEL_25:

  if ((v18 & 1) == 0)
  {
    uint64_t v28 = kNLDeepBreathingPreferencesDomain;
    CFPreferencesAppSynchronize(kNLDeepBreathingPreferencesDomain);
    syncManager = self->_syncManager;
    CFStringRef v47 = v26;
    v30 = +[NSArray arrayWithObjects:&v47 count:1];
    v31 = +[NSSet setWithArray:v30];
    [(NPSManager *)syncManager synchronizeUserDefaultsDomain:v28 keys:v31];
  }
  [(HPRFDeepBreathingReminderFrequencyController *)self reloadSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSViewController__parentController]);
  v33 = [(HPRFDeepBreathingReminderFrequencyController *)self specifier];
  [WeakRetained reloadSpecifier:v33];

  v38.receiver = self;
  v38.super_class = (Class)HPRFDeepBreathingReminderFrequencyController;
  [(HPRFDeepBreathingReminderFrequencyController *)&v38 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFDeepBreathingReminderFrequencyController *)self bundle];
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