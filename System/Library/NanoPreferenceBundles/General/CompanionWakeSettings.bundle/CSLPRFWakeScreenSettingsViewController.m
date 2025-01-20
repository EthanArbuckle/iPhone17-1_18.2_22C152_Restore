@interface CSLPRFWakeScreenSettingsViewController
- (BOOL)isWakeSetToShort;
- (CSLPRFWakeScreenSettingsViewController)init;
- (NPSDomainAccessor)systemPrefsDomainAccessor;
- (NPSManager)syncManager;
- (id)_onTapGroup;
- (id)specifiers;
- (void)_synchronizeDomainWithAccessor:(id)a3 keys:(id)a4 withCompletion:(id)a5;
- (void)dealloc;
- (void)handleDidUnpair;
- (void)setBacklightExtendValue:(int64_t)a3;
- (void)setSyncManager:(id)a3;
- (void)setSystemPrefsDomainAccessor:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation CSLPRFWakeScreenSettingsViewController

- (CSLPRFWakeScreenSettingsViewController)init
{
  v12.receiver = self;
  v12.super_class = (Class)CSLPRFWakeScreenSettingsViewController;
  v2 = [(CSLPRFWakeScreenSettingsViewController *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    syncManager = v2->_syncManager;
    v2->_syncManager = (NPSManager *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_2CD8, @"com.apple.Carousel.gizmoAutoScreenOffSecondsDidChange", 0, (CFNotificationSuspensionBehavior)0);
    v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v2, (CFNotificationCallback)sub_2CD8, @"CSLOnWakeTimeoutPreferenceChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, v2, (CFNotificationCallback)sub_2CD8, @"com.apple.Carousel.EnableRotateToWakeChangedNotification", 0, (CFNotificationSuspensionBehavior)0);
    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v8, v2, (CFNotificationCallback)sub_2CD8, @"com.apple.Carousel.kDisallowWakeGestureSetting", 0, (CFNotificationSuspensionBehavior)0);
    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"handleDidUnpair" name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

    v10 = [(CSLPRFWakeScreenSettingsViewController *)v2 systemPrefsDomainAccessor];
    [(CSLPRFWakeScreenSettingsViewController *)v2 _synchronizeDomainWithAccessor:v10 keys:0 withCompletion:0];
  }
  return v2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSLPRFWakeScreenSettingsViewController *)self indexForIndexPath:v7];
  v9 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
  v10 = [v9 identifier];
  unsigned __int8 v11 = [v10 isEqualToString:@"SHORT_WAKE_ID"];

  if (v11)
  {
    uint64_t v12 = 15;
LABEL_5:
    [(CSLPRFWakeScreenSettingsViewController *)self setBacklightExtendValue:v12];
    goto LABEL_6;
  }
  v13 = [v9 identifier];
  unsigned int v14 = [v13 isEqualToString:@"LONG_WAKE_ID"];

  if (v14)
  {
    uint64_t v12 = 70;
    goto LABEL_5;
  }
LABEL_6:
  v15.receiver = self;
  v15.super_class = (Class)CSLPRFWakeScreenSettingsViewController;
  [(CSLPRFWakeScreenSettingsViewController *)&v15 tableView:v6 didSelectRowAtIndexPath:v7];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  v5.receiver = self;
  v5.super_class = (Class)CSLPRFWakeScreenSettingsViewController;
  [(CSLPRFWakeScreenSettingsViewController *)&v5 dealloc];
}

- (void)handleDidUnpair
{
  self->_systemPrefsDomainAccessor = 0;
  _objc_release_x1();
}

- (NPSDomainAccessor)systemPrefsDomainAccessor
{
  systemPrefsDomainAccessor = self->_systemPrefsDomainAccessor;
  if (!systemPrefsDomainAccessor)
  {
    v4 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.system.prefs"];
    objc_super v5 = self->_systemPrefsDomainAccessor;
    self->_systemPrefsDomainAccessor = v4;

    systemPrefsDomainAccessor = self->_systemPrefsDomainAccessor;
  }

  return systemPrefsDomainAccessor;
}

- (void)_synchronizeDomainWithAccessor:(id)a3 keys:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = cslprf_sessions_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v12 = [v8 domain];
    *(_DWORD *)buf = 138412546;
    v22 = v12;
    __int16 v23 = 2112;
    id v24 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "synchronizing %@ %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_30C0;
  v16[3] = &unk_8268;
  objc_copyWeak(&v20, (id *)buf);
  id v13 = v8;
  id v17 = v13;
  id v14 = v9;
  id v18 = v14;
  id v15 = v10;
  id v19 = v15;
  [v13 synchronizeWithCompletionHandler:v16];

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (id)specifiers
{
  uint64_t v3 = +[NSMutableArray array];
  v4 = [(CSLPRFWakeScreenSettingsViewController *)self _onTapGroup];
  [v3 addObjectsFromArray:v4];

  id v5 = [v3 copy];
  id v6 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  *(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] = v5;

  return v3;
}

- (void)setBacklightExtendValue:(int64_t)a3
{
  id v10 = [(CSLPRFWakeScreenSettingsViewController *)self specifierForID:@"ON_TAP_GROUP_ID"];
  if (a3 >= 16) {
    CFStringRef v5 = @"LONG_WAKE_ID";
  }
  else {
    CFStringRef v5 = @"SHORT_WAKE_ID";
  }
  id v6 = [(CSLPRFWakeScreenSettingsViewController *)self specifierForID:v5];
  [v10 setProperty:v6 forKey:PSRadioGroupCheckedSpecifierKey];
  [(CSLPRFWakeScreenSettingsViewController *)self reloadSpecifier:v10 animated:0];
  id v7 = [(CSLPRFWakeScreenSettingsViewController *)self systemPrefsDomainAccessor];
  [v7 setInteger:a3 forKey:@"AutoScreenOffSeconds"];

  id v8 = [(CSLPRFWakeScreenSettingsViewController *)self systemPrefsDomainAccessor];
  id v9 = +[NSSet setWithObject:@"AutoScreenOffSeconds"];
  [(CSLPRFWakeScreenSettingsViewController *)self _synchronizeDomainWithAccessor:v8 keys:v9 withCompletion:0];
}

- (BOOL)isWakeSetToShort
{
  char v6 = 0;
  v2 = [(CSLPRFWakeScreenSettingsViewController *)self systemPrefsDomainAccessor];
  id v3 = [v2 integerForKey:@"AutoScreenOffSeconds" keyExistsAndHasValidFormat:&v6];

  return !v6 || (uint64_t)v3 < 16;
}

- (id)_onTapGroup
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"ON_TAP_HEADER" value:&stru_8440 table:@"CompanionWakeSettings"];
  CFStringRef v5 = +[PSSpecifier groupSpecifierWithID:@"ON_TAP_GROUP_ID" name:v4];

  char v6 = +[NSBundle bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"ON_TAP_FOOTER" value:&stru_8440 table:@"CompanionWakeSettings"];
  [v5 setProperty:v7 forKey:PSFooterTextGroupKey];

  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"WAKE_SHORT_INTERVAL" value:&stru_8440 table:@"CompanionWakeSettings"];
  id v10 = +[PSSpecifier preferenceSpecifierNamed:v9 target:self set:0 get:0 detail:0 cell:3 edit:0];

  uint64_t v11 = PSIDKey;
  [v10 setProperty:@"SHORT_WAKE_ID" forKey:PSIDKey];
  uint64_t v12 = +[NSBundle bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"WAKE_LONG_INTERVAL" value:&stru_8440 table:@"CompanionWakeSettings"];
  id v14 = +[PSSpecifier preferenceSpecifierNamed:v13 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v14 setProperty:@"LONG_WAKE_ID" forKey:v11];
  if ([(CSLPRFWakeScreenSettingsViewController *)self isWakeSetToShort]) {
    id v15 = v10;
  }
  else {
    id v15 = v14;
  }
  [v5 setProperty:v15 forKey:PSRadioGroupCheckedSpecifierKey];
  v18[0] = v5;
  v18[1] = v10;
  v18[2] = v14;
  v16 = +[NSArray arrayWithObjects:v18 count:3];

  return v16;
}

- (void)setSystemPrefsDomainAccessor:(id)a3
{
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
  objc_storeStrong((id *)&self->_syncManager, 0);

  objc_storeStrong((id *)&self->_systemPrefsDomainAccessor, 0);
}

@end