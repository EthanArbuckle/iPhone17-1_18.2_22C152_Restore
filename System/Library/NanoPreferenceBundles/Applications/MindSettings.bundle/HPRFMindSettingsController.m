@interface HPRFMindSettingsController
- (BOOL)suppressMirrorOption;
- (BOOL)suppressNotificationCoalescingOptions;
- (BOOL)suppressSendToNotificationCenterOption;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (HPRFMindSettingsController)init;
- (id)_customReminderSpecifiers;
- (id)_subtitleForCustomReminder:(id)a3;
- (id)applicationBundleIdentifier;
- (id)applicationGroupSpecifiers;
- (id)getGuidedMeditationPrefetchEnabled:(id)a3;
- (id)getMindBreathingBreathRate:(id)a3;
- (id)getMindBreathingHapticLevel:(id)a3;
- (id)getMuteForToday:(id)a3;
- (id)localizedPaneTitle;
- (id)notificationApplicationSpecifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_addReminderTapped;
- (void)_manageStateOfMindSettings;
- (void)_mutePreferencesDidChange:(id)a3;
- (void)_reminderTapped:(id)a3;
- (void)_remindersDidChange:(id)a3;
- (void)dealloc;
- (void)setGuidedMeditationPrefetchEnabled:(id)a3 specifier:(id)a4;
- (void)setMuteForToday:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HPRFMindSettingsController

- (HPRFMindSettingsController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFMindSettingsController;
  v2 = [(HPRFMindSettingsController *)&v6 init];
  if (v2)
  {
    v3 = (FIMindfulnessCustomReminderProvider *)objc_alloc_init((Class)FIMindfulnessCustomReminderProvider);
    customReminderProvider = v2->_customReminderProvider;
    v2->_customReminderProvider = v3;
  }
  return v2;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)HPRFMindSettingsController;
  [(HPRFMindSettingsController *)&v18 viewDidLoad];
  v3 = [(HPRFMindSettingsController *)self localizedPaneTitle];
  [(HPRFMindSettingsController *)self setTitle:v3];

  objc_initWeak(&location, self);
  v4 = (const char *)kNLMindPreferencesChangedNotification;
  id v5 = &_dispatch_main_q;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_2674;
  v15 = &unk_149A0;
  objc_copyWeak(&v16, &location);
  notify_register_dispatch(v4, &self->_notifyToken, (dispatch_queue_t)&_dispatch_main_q, &v12);

  objc_super v6 = objc_alloc_init(HPRFSeymourSubscriptionProvider);
  seymourSubscriptionProvider = self->_seymourSubscriptionProvider;
  self->_seymourSubscriptionProvider = v6;

  self->_isSubscribed = 0;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_2718, @"GuidedMeditationPreferencesChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"_mutePreferencesDidChange:" name:BPSNotificationMuteSettingsMutedForTodayChangedNotification object:0];

  v10 = +[NSNotificationCenter defaultCenter];
  v11 = +[HPRFMindReminderViewController remindersDidChangeNotification];
  [v10 addObserver:self selector:"_remindersDidChange:" name:v11 object:0];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFMindSettingsController;
  [(HPRFMindSettingsController *)&v6 viewWillAppear:a3];
  seymourSubscriptionProvider = self->_seymourSubscriptionProvider;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2840;
  v5[3] = &unk_149C8;
  v5[4] = self;
  [(HPRFSeymourSubscriptionProvider *)seymourSubscriptionProvider fetchSubscriptionStatusWithCompletion:v5];
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)HPRFMindSettingsController;
  [(HPRFMindSettingsController *)&v5 dealloc];
}

- (void)_mutePreferencesDidChange:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  objc_super v5 = (void *)HKLogDeepBreathing;
  if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = v5;
    v7 = [v4 name];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Did receive %@; reloading specifiers", (uint8_t *)&v8, 0xCu);
  }
  [(HPRFMindSettingsController *)self reloadSpecifiers];
}

- (void)_remindersDidChange:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  objc_super v5 = (void *)HKLogDeepBreathing;
  if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = v5;
    v7 = [v4 name];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Did receive %@; reloading specifiers", (uint8_t *)&v8, 0xCu);
  }
  [(HPRFMindSettingsController *)self reloadSpecifiers];
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"PANE_TITLE" value:&stru_150C8 table:@"MindSettings"];

  return v3;
}

- (id)applicationBundleIdentifier
{
  return @"com.apple.Mind";
}

- (BOOL)suppressMirrorOption
{
  return 1;
}

- (BOOL)suppressSendToNotificationCenterOption
{
  return 0;
}

- (BOOL)suppressNotificationCoalescingOptions
{
  return 1;
}

- (id)notificationApplicationSpecifiers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v5 = +[PSSpecifierDataSource loadSpecifiersFromPlist:@"MindReminderSettings" inBundle:v4 target:self stringsTable:@"MindSettings"];

  [v3 addObjectsFromArray:v5];
  objc_super v6 = [(HPRFMindSettingsController *)self _customReminderSpecifiers];
  [v3 addObjectsFromArray:v6];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  int v8 = [v7 localizedStringForKey:@"ADD_REMINDER_LABEL" value:&stru_150C8 table:@"MindSettings"];
  v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v9 setButtonAction:"_addReminderTapped"];
  [v3 addObject:v9];
  if (_os_feature_enabled_impl())
  {
    v10 = +[PSSpecifier preferenceSpecifierNamed:&stru_150C8 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    [v3 addObject:v10];
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"MANAGE_STATE_OF_MIND_LABEL" value:&stru_150C8 table:@"MindSettings-Chamomile"];
    uint64_t v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v13 setIdentifier:@"ManageStateOfMindSettings"];
    [v13 setButtonAction:"_manageStateOfMindSettings"];
    [v13 setAccessibilityIdentifier:@"ManageStateOfMindSettingsButton"];
    [v3 addObject:v13];
  }
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = +[PSSpecifierDataSource loadSpecifiersFromPlist:@"MindNotificationSettings" inBundle:v14 target:self stringsTable:@"MindSettings"];

  [v3 addObjectsFromArray:v15];

  return v3;
}

- (id)applicationGroupSpecifiers
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = +[PSSpecifierDataSource loadSpecifiersFromPlist:@"MindAppSettings" inBundle:v3 target:self stringsTable:@"MindSettings"];
  id v5 = [v4 mutableCopy];

  LODWORD(v4) = self->_isSubscribed;
  objc_super v6 = [v5 specifierForID:@"GUIDED_MEDITATION_PREFETCH_FOOTER_ID"];
  if (v4)
  {
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    int v8 = [v7 localizedStringForKey:@"GUIDED_MEDITATION_PREFETCH_FOOTER" value:&stru_150C8 table:@"MindSettings-Huckleberry"];
    [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"GUIDED_MEDITATION_PREFETCH_TITLE" value:&stru_150C8 table:@"MindSettings-Huckleberry"];
    [v6 setName:v10];

    v11 = [v5 specifierForID:@"GUIDED_MEDITATION_PREFETCH_LABEL_ID"];
    v12 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v13 = [v12 localizedStringForKey:@"GUIDED_MEDITATION_PREFETCH_LABEL" value:&stru_150C8 table:@"MindSettings-Huckleberry"];
    [v11 setName:v13];

    [v11 setProperty:&__kCFBooleanTrue forKey:PSAllowMultilineTitleKey];
  }
  else
  {
    [v5 removeObject:v6];

    objc_super v6 = [v5 specifierForID:@"GUIDED_MEDITATION_PREFETCH_LABEL_ID"];
    [v5 removeObject:v6];
  }

  return v5;
}

- (id)getGuidedMeditationPrefetchEnabled:(id)a3
{
  uint64_t v3 = FIUIIsGuidedMeditationPrefetchEnabled();

  return +[NSNumber numberWithBool:v3];
}

- (void)setGuidedMeditationPrefetchEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  _FIUISetGuidedMeditationPrefetchEnabled(v4);
}

- (id)getMindBreathingHapticLevel:(id)a3
{
  return +[HPRFMindHapticLevelController mindHapticLevel];
}

- (id)getMindBreathingBreathRate:(id)a3
{
  return +[HPRFMindBreatheRateController mindBreatheRate];
}

- (id)getMuteForToday:(id)a3
{
  uint64_t v3 = +[BPSNotificationMuteSettingsManager sharedNotificationMuteSettingsManager];
  id v4 = [v3 isMutedForTodaySectionIdentifier:@"com.apple.Mind"];

  return +[NSNumber numberWithBool:v4];
}

- (void)setMuteForToday:(id)a3
{
  unsigned int v3 = [a3 BOOLValue];
  id v4 = objc_alloc((Class)NSSet);
  CFStringRef v9 = @"com.apple.Mind";
  id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  id v6 = [v4 initWithArray:v5];

  v7 = +[BPSNotificationMuteSettingsManager sharedNotificationMuteSettingsManager];
  int v8 = v7;
  if (v3) {
    [v7 addSectionIdentifiers:v6];
  }
  else {
    [v7 removeSectionIdentifiers:v6];
  }
}

- (void)_addReminderTapped
{
  _HKInitializeLogging();
  unsigned int v3 = HKLogDeepBreathing;
  if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Adding new reminder", v6, 2u);
  }
  id v4 = [[HPRFMindReminderViewController alloc] initWithReminderProvider:self->_customReminderProvider currentReminder:0];
  id v5 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v4];
  [(HPRFMindSettingsController *)self presentViewController:v5 animated:1 completion:0];
}

- (void)_reminderTapped:(id)a3
{
  id v4 = [a3 propertyForKey:@"HPRFMindSubtitleCellReminderSpecifierKey"];
  _HKInitializeLogging();
  id v5 = HKLogDeepBreathing;
  if (os_log_type_enabled(HKLogDeepBreathing, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Editing reminder %@", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [[HPRFMindReminderViewController alloc] initWithReminderProvider:self->_customReminderProvider currentReminder:v4];
  id v7 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
  int v8 = [(HPRFMindSettingsController *)self navigationController];
  [v8 presentViewController:v7 animated:1 completion:0];
}

- (void)_manageStateOfMindSettings
{
  id v3 = +[MindfulnessRouting HPRFMindfulnessRoutingStateOfMindOptionsRoute];
  v2 = +[UIApplication sharedApplication];
  [v2 openURL:v3 withCompletionHandler:&stru_14A08];
}

- (id)_customReminderSpecifiers
{
  id v3 = [(FIMindfulnessCustomReminderProvider *)self->_customReminderProvider reminders];
  id v4 = [v3 allObjects];

  id v5 = [v4 sortedArrayUsingComparator:&stru_14A48];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_38BC;
  v10[3] = &unk_14A70;
  v10[4] = self;
  id v6 = objc_msgSend(v5, "hk_map:", v10);
  id v7 = v6;
  if (!v6) {
    id v6 = &__NSArray0__struct;
  }
  id v8 = v6;

  return v8;
}

- (id)_subtitleForCustomReminder:(id)a3
{
  id v3 = a3;
  if ([v3 enabled])
  {
    if ([v3 customWeekdaySelection])
    {
      [v3 customWeekdaySelection];
      id v4 = +[NSCalendar currentCalendar];
      uint64_t v5 = FIUIMindfulnessLocalizedWeekdaySelection();
      goto LABEL_7;
    }
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = v6;
    CFStringRef v7 = @"REMINDER_NON_REPEATING_LABEL";
  }
  else
  {
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = v6;
    CFStringRef v7 = @"REMINDER_OFF_LABEL";
  }
  uint64_t v5 = [v6 localizedStringForKey:v7 value:&stru_150C8 table:@"MindSettings"];
LABEL_7:
  id v8 = (void *)v5;

  return v8;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v4 = [(HPRFMindSettingsController *)self specifierAtIndexPath:a4];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"HPRFMindSubtitleCellReminderSpecifierKey"];
  BOOL v6 = v5 != 0;

  return v6;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v4 = [(HPRFMindSettingsController *)self specifierAtIndexPath:a4];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"HPRFMindSubtitleCellReminderSpecifierKey"];
  int64_t v6 = v5 != 0;

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    id v12 = [(HPRFMindSettingsController *)self specifierAtIndexPath:a5];
    CFStringRef v7 = [v12 objectForKeyedSubscript:@"HPRFMindSubtitleCellReminderSpecifierKey"];
    if (v7)
    {
      self->_shouldSkipNextReload = 1;
      id v8 = [(FIMindfulnessCustomReminderProvider *)self->_customReminderProvider reminders];
      id v9 = [v8 mutableCopy];

      [v9 removeObject:v7];
      customReminderProvider = self->_customReminderProvider;
      id v11 = [v9 copy];
      [(FIMindfulnessCustomReminderProvider *)customReminderProvider updateReminders:v11];

      [(HPRFMindSettingsController *)self removeSpecifier:v12 animated:1];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seymourSubscriptionProvider, 0);

  objc_storeStrong((id *)&self->_customReminderProvider, 0);
}

@end