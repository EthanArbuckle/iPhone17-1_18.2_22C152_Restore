@interface HPRFMindBreatheRateController
+ (id)mindBreatheRate;
- (HPRFMindBreatheRateController)init;
- (id)applicationBundleIdentifier;
- (id)bundle;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)dealloc;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HPRFMindBreatheRateController

+ (id)mindBreatheRate
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"BreathRate", kNLMindPreferencesDomain, &keyExistsAndHasValidFormat);
  uint64_t v3 = 7;
  if (keyExistsAndHasValidFormat) {
    uint64_t v3 = AppIntegerValue;
  }
  v4 = +[NSString stringWithFormat:@"%@%ld", @"ID_BPM_", v3];
  v5 = sub_4BA4(v4, 1);

  return v5;
}

- (HPRFMindBreatheRateController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFMindBreatheRateController;
  v2 = [(HPRFMindBreatheRateController *)&v6 init];
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
  v9.receiver = self;
  v9.super_class = (Class)HPRFMindBreatheRateController;
  [(HPRFMindBreatheRateController *)&v9 viewDidLoad];
  uint64_t v3 = [(HPRFMindBreatheRateController *)self localizedPaneTitle];
  [(HPRFMindBreatheRateController *)self setTitle:v3];

  objc_initWeak(&location, self);
  v4 = (const char *)kNLMindPreferencesChangedNotification;
  id v5 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4E78;
  v6[3] = &unk_149A0;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v4, &self->_notifyToken, (dispatch_queue_t)&_dispatch_main_q, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)dealloc
{
  int notifyToken = self->_notifyToken;
  if (notifyToken != -1) {
    notify_cancel(notifyToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)HPRFMindBreatheRateController;
  [(HPRFMindBreatheRateController *)&v4 dealloc];
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"PANE_TITLE" value:&stru_150C8 table:@"MindBreathingBreathRate"];

  return v3;
}

- (id)specifiers
{
  uint64_t v2 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v3 = *(void **)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    objc_super v6 = +[PSSpecifier groupSpecifierWithID:@"MIND_BREATHE_RATE_GROUP_ID"];
    [v6 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    id v7 = sub_54C8();
    v8 = objc_msgSend(v7, "hk_map:", &stru_14BA8);

    objc_super v9 = objc_msgSend(v8, "hk_map:", &stru_14B40);
    v21 = v6;
    v10 = +[NSArray arrayWithObjects:&v21 count:1];
    v11 = [v10 arrayByAddingObjectsFromArray:v9];

    v12 = *(void **)&self->BPSNotificationAppController_opaque[v2];
    *(void *)&self->BPSNotificationAppController_opaque[v2] = v11;
    id v13 = v11;

    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"BreathRate", kNLMindPreferencesDomain, &keyExistsAndHasValidFormat);
    uint64_t v15 = 7;
    if (keyExistsAndHasValidFormat) {
      uint64_t v15 = AppIntegerValue;
    }
    v16 = *(void **)&self->BPSNotificationAppController_opaque[v2];
    v17 = +[NSString stringWithFormat:@"%@%ld", @"ID_BPM_", v15];
    v18 = [v16 specifierForID:v17];

    [v6 setProperty:v18 forKey:PSRadioGroupCheckedSpecifierKey];
    id v4 = *(id *)&self->BPSNotificationAppController_opaque[v2];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HPRFMindBreatheRateController *)self indexForIndexPath:v6];
  objc_super v9 = [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  v10 = sub_54C8();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_5548;
  v22[3] = &unk_14B68;
  id v11 = v9;
  id v23 = v11;
  v12 = objc_msgSend(v10, "hk_firstObjectPassingTest:", v22);
  id v13 = v12;
  if (v12)
  {
    v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 integerValue]);
    CFStringRef v15 = (const __CFString *)kNLMindPreferencesDomain;
    CFPreferencesSetAppValue(@"BreathRate", v14, kNLMindPreferencesDomain);
    CFPreferencesAppSynchronize(v15);
    syncManager = self->_syncManager;
    CFStringRef v24 = @"BreathRate";
    v17 = +[NSArray arrayWithObjects:&v24 count:1];
    v18 = +[NSSet setWithArray:v17];
    [(NPSManager *)syncManager synchronizeUserDefaultsDomain:v15 keys:v18];
  }
  [(HPRFMindBreatheRateController *)self reloadSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSViewController__parentController]);
  v20 = [(HPRFMindBreatheRateController *)self specifier];
  [WeakRetained reloadSpecifier:v20];

  v21.receiver = self;
  v21.super_class = (Class)HPRFMindBreatheRateController;
  [(HPRFMindBreatheRateController *)&v21 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFMindBreatheRateController *)self bundle];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (void).cxx_destruct
{
}

@end