@interface HPRFMindHapticLevelController
+ (id)mindHapticLevel;
- (HPRFMindHapticLevelController)init;
- (id)applicationBundleIdentifier;
- (id)bundle;
- (id)localizedPaneTitle;
- (id)specifiers;
- (void)dealloc;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation HPRFMindHapticLevelController

+ (id)mindHapticLevel
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"HapticLevel", kNLMindPreferencesDomain, &keyExistsAndHasValidFormat);
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
  v6 = sub_3F80(v5);

  return v6;
}

- (HPRFMindHapticLevelController)init
{
  v6.receiver = self;
  v6.super_class = (Class)HPRFMindHapticLevelController;
  v2 = [(HPRFMindHapticLevelController *)&v6 init];
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
  v9.super_class = (Class)HPRFMindHapticLevelController;
  [(HPRFMindHapticLevelController *)&v9 viewDidLoad];
  uint64_t v3 = [(HPRFMindHapticLevelController *)self localizedPaneTitle];
  [(HPRFMindHapticLevelController *)self setTitle:v3];

  objc_initWeak(&location, self);
  CFStringRef v4 = (const char *)kNLMindPreferencesChangedNotification;
  id v5 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4308;
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
  v4.super_class = (Class)HPRFMindHapticLevelController;
  [(HPRFMindHapticLevelController *)&v4 dealloc];
}

- (id)localizedPaneTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"PANE_TITLE" value:&stru_150C8 table:@"MindBreathingHapticLevel"];

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
    objc_super v6 = +[PSSpecifier groupSpecifierWithID:@"MIND_HAPTIC_LEVEL_GROUP_ID"];
    [v6 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
    id v7 = sub_4644();
    v8 = objc_msgSend(v7, "hk_map:", &stru_14AD8);
    v20 = v6;
    objc_super v9 = +[NSArray arrayWithObjects:&v20 count:1];
    v10 = [v9 arrayByAddingObjectsFromArray:v8];

    v11 = *(void **)&self->BPSNotificationAppController_opaque[v2];
    *(void *)&self->BPSNotificationAppController_opaque[v2] = v10;
    id v12 = v10;

    Boolean keyExistsAndHasValidFormat = 0;
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"HapticLevel", kNLMindPreferencesDomain, &keyExistsAndHasValidFormat);
    uint64_t v14 = 2;
    if (keyExistsAndHasValidFormat) {
      uint64_t v14 = AppIntegerValue;
    }
    CFStringRef v15 = @"PROMINENT_ID";
    if (v14 == 3) {
      CFStringRef v15 = @"MINIMAL_ID";
    }
    if (v14 == 1) {
      CFStringRef v16 = @"NONE_ID";
    }
    else {
      CFStringRef v16 = v15;
    }
    v17 = [*(id *)&self->BPSNotificationAppController_opaque[v2] specifierForID:v16];
    [v6 setProperty:v17 forKey:PSRadioGroupCheckedSpecifierKey];
    id v4 = *(id *)&self->BPSNotificationAppController_opaque[v2];
  }

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HPRFMindHapticLevelController *)self indexForIndexPath:v6];
  objc_super v9 = [*(id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  v10 = sub_4644();
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_4A04;
  v24[3] = &unk_14B00;
  id v11 = v9;
  id v25 = v11;
  id v12 = objc_msgSend(v10, "hk_firstObjectPassingTest:", v24);
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
    if ([v14 isEqualToString:@"NONE_ID"])
    {
      uint64_t v15 = 1;
    }
    else if ([v14 isEqualToString:@"MINIMAL_ID"])
    {
      uint64_t v15 = 3;
    }
    else
    {
      [v14 isEqualToString:@"PROMINENT_ID"];
      uint64_t v15 = 2;
    }

    CFStringRef v16 = +[NSNumber numberWithInteger:v15];
    CFStringRef v17 = (const __CFString *)kNLMindPreferencesDomain;
    CFPreferencesSetAppValue(@"HapticLevel", v16, kNLMindPreferencesDomain);
    CFPreferencesAppSynchronize(v17);
    syncManager = self->_syncManager;
    CFStringRef v26 = @"HapticLevel";
    v19 = +[NSArray arrayWithObjects:&v26 count:1];
    v20 = +[NSSet setWithArray:v19];
    [(NPSManager *)syncManager synchronizeUserDefaultsDomain:v17 keys:v20];
  }
  [(HPRFMindHapticLevelController *)self reloadSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)&self->BPSNotificationAppController_opaque[OBJC_IVAR___PSViewController__parentController]);
  v22 = [(HPRFMindHapticLevelController *)self specifier];
  [WeakRetained reloadSpecifier:v22];

  v23.receiver = self;
  v23.super_class = (Class)HPRFMindHapticLevelController;
  [(HPRFMindHapticLevelController *)&v23 tableView:v7 didSelectRowAtIndexPath:v6];
}

- (id)bundle
{
  uint64_t v2 = objc_opt_class();

  return +[NSBundle bundleForClass:v2];
}

- (id)applicationBundleIdentifier
{
  uint64_t v2 = [(HPRFMindHapticLevelController *)self bundle];
  uint64_t v3 = [v2 bundleIdentifier];

  return v3;
}

- (void).cxx_destruct
{
}

@end