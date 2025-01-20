@interface WGABridgeDoubleTapSettingsViewController
- (id)_doubleTapSettingSpecifiers;
- (id)_getIgnoreGesturesWhileVisionProDonned:(id)a3;
- (id)_ignoreWhileVisionProDonnedSettingSpecifiers;
- (id)_phoneSettings;
- (id)_playbackSettingSpecifiers;
- (id)_smartStackSettingSpecifiers;
- (id)getEltonEnabled:(id)a3;
- (id)specifiers;
- (unint64_t)_gestureMode;
- (unint64_t)getNowPlayingType;
- (unint64_t)getSmartStackPrimaryActionType;
- (void)_setIgnoreGesturesWhileVisionProDonned:(id)a3 specifier:(id)a4;
- (void)openTipsPage;
- (void)setEltonEnabled:(id)a3 specifier:(id)a4;
- (void)setNowPlayingTypeForSpecifier:(id)a3;
- (void)setSmartStackPrimaryActionTypeForSpecifier:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WGABridgeDoubleTapSettingsViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)WGABridgeDoubleTapSettingsViewController;
  [(WGABridgeDoubleTapSettingsViewController *)&v7 viewDidLoad];
  id v3 = objc_alloc((Class)NPSDomainAccessor);
  v4 = (NPSDomainAccessor *)[v3 initWithDomain:WAGPreferencesDomain];
  eltonAccessor = self->_eltonAccessor;
  self->_eltonAccessor = v4;

  id v6 = [(NPSDomainAccessor *)self->_eltonAccessor synchronize];
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WGABridgeDoubleTapSettingsViewController;
  [(WGABridgeDoubleTapSettingsViewController *)&v9 viewWillAppear:a3];
  [(WGABridgeDoubleTapSettingsViewController *)self reloadSpecifiers];
  objc_initWeak(&location, self);
  v4 = (const char *)[@"WAGPreferencesSyncDidChangeInternalNotification" UTF8String];
  id v5 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4B34;
  v6[3] = &unk_82D0;
  objc_copyWeak(&v7, &location);
  notify_register_dispatch(v4, &self->_eltonPreferencesSyncToken, (dispatch_queue_t)&_dispatch_main_q, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGABridgeDoubleTapSettingsViewController;
  [(WGABridgeDoubleTapSettingsViewController *)&v4 viewWillDisappear:a3];
  notify_cancel(self->_eltonPreferencesSyncToken);
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = [(WGABridgeDoubleTapSettingsViewController *)self _doubleTapSettingSpecifiers];
    [v5 addObjectsFromArray:v6];

    id v7 = [(WGABridgeDoubleTapSettingsViewController *)self _playbackSettingSpecifiers];
    [v5 addObjectsFromArray:v7];

    v8 = [(WGABridgeDoubleTapSettingsViewController *)self _smartStackSettingSpecifiers];
    [v5 addObjectsFromArray:v8];

    objc_super v9 = [(WGABridgeDoubleTapSettingsViewController *)self _ignoreWhileVisionProDonnedSettingSpecifiers];
    [v5 addObjectsFromArray:v9];

    v10 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v5;

    objc_super v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (id)_doubleTapSettingSpecifiers
{
  uint64_t v3 = +[NSMutableArray array];
  objc_super v4 = +[PSSpecifier groupSpecifierWithID:@"ELTON_LEARN_MORE_FOOTER_GROUP_ID"];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"ELTON_LEARN_MORE" value:&stru_84A0 table:@"Localizable"];

  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"ELTON_FOOTER" value:&stru_84A0 table:@"Localizable"];
  objc_super v9 = +[NSString stringWithFormat:@"%@ %@", v8, v6];

  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v4 setProperty:v11 forKey:PSFooterCellClassGroupKey];

  [v4 setProperty:v9 forKey:PSFooterHyperlinkViewTitleKey];
  v20.id location = (NSUInteger)[v9 rangeOfString:v6];
  v12 = NSStringFromRange(v20);
  [v4 setProperty:v12 forKey:PSFooterHyperlinkViewLinkRangeKey];

  v13 = +[NSValue valueWithNonretainedObject:self];
  [v4 setProperty:v13 forKey:PSFooterHyperlinkViewTargetKey];

  v14 = NSStringFromSelector("openTipsPage");
  [v4 setProperty:v14 forKey:PSFooterHyperlinkViewActionKey];

  [v3 addObject:v4];
  v15 = +[NSBundle bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"ELTON_DOUBLE_TAP_STATE" value:&stru_84A0 table:@"Localizable"];
  v17 = +[PSSpecifier preferenceSpecifierNamed:v16 target:self set:"setEltonEnabled:specifier:" get:"getEltonEnabled:" detail:0 cell:6 edit:0];

  [v3 addObject:v17];

  return v3;
}

- (void)setEltonEnabled:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 BOOLValue];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_53B0;
  v31[3] = &unk_82F8;
  v31[4] = self;
  id v9 = v6;
  id v32 = v9;
  v10 = objc_retainBlock(v31);
  v11 = +[WatchControlSettings sharedInstance];
  unsigned int v12 = [v11 hasGreySupportFeatureEnabled];

  if (v8 && v12)
  {
    v24 = v7;
    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"ASSISTIVE_TOUCH_WARNING_TITLE" value:&stru_84A0 table:@"Localizable"];
    v15 = +[NSBundle bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"ASSISTIVE_TOUCH_WARNING_DESCRIPTION" value:&stru_84A0 table:@"Localizable"];
    v17 = +[UIAlertController alertControllerWithTitle:v14 message:v16 preferredStyle:1];

    v18 = +[NSBundle bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"ASSISTIVE_TOUCH_WARNING_TURN_OFF_ASSISTIVE_TOUCH_BUTTON" value:&stru_84A0 table:@"Localizable"];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_54B8;
    v29[3] = &unk_8348;
    v30 = v10;
    NSRange v20 = +[UIAlertAction actionWithTitle:v19 style:0 handler:v29];
    [v17 addAction:v20];

    objc_initWeak(&location, self);
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"ASSISTIVE_TOUCH_WARNING_CANCEL_BUTTON" value:&stru_84A0 table:@"Localizable"];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_558C;
    v25[3] = &unk_8370;
    id v7 = v24;
    id v26 = v24;
    objc_copyWeak(&v27, &location);
    v23 = +[UIAlertAction actionWithTitle:v22 style:1 handler:v25];
    [v17 addAction:v23];

    [(WGABridgeDoubleTapSettingsViewController *)self presentViewController:v17 animated:1 completion:0];
    objc_destroyWeak(&v27);

    objc_destroyWeak(&location);
  }
  else
  {
    ((void (*)(void *))v10[2])(v10);
  }
}

- (id)getEltonEnabled:(id)a3
{
  BOOL v3 = (char *)[(WGABridgeDoubleTapSettingsViewController *)self _gestureMode] == (char *)&dword_0 + 1;

  return +[NSNumber numberWithBool:v3];
}

- (unint64_t)_gestureMode
{
  char v3 = 0;
  unint64_t result = (unint64_t)[(NPSDomainAccessor *)self->_eltonAccessor integerForKey:@"gestureMode" keyExistsAndHasValidFormat:&v3];
  if (!v3) {
    return 1;
  }
  return result;
}

- (id)_playbackSettingSpecifiers
{
  char v3 = +[NSMutableArray array];
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"ELTON_DOUBLE_TAP_PLAYBACK_SECTION" value:&stru_84A0 table:@"Localizable"];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:0 edit:0];

  [v6 setIdentifier:@"playbackSettingsGroup"];
  [v6 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  [v3 addObject:v6];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v8 = [v7 localizedStringForKey:@"ELTON_DOUBLE_TAP_PLAYBACK_SECTION_PLAY_PAUSE" value:&stru_84A0 table:@"Localizable"];
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v9 setIdentifier:@"playbackSettingsPlayPause"];
  [v9 setButtonAction:"setNowPlayingTypeForSpecifier:"];
  uint64_t v10 = PSValueKey;
  [v9 setProperty:&off_8A28 forKey:PSValueKey];
  [v3 addObject:v9];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v12 = [v11 localizedStringForKey:@"ELTON_DOUBLE_TAP_PLAYBACK_SECTION_SKIP" value:&stru_84A0 table:@"Localizable"];
  v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v13 setIdentifier:@"playbackSettingsSkip"];
  [v13 setButtonAction:"setNowPlayingTypeForSpecifier:"];
  [v13 setProperty:&off_8A40 forKey:v10];
  [v3 addObject:v13];
  if ([(WGABridgeDoubleTapSettingsViewController *)self getNowPlayingType]) {
    v14 = v13;
  }
  else {
    v14 = v9;
  }
  [v6 setProperty:v14 forKey:PSRadioGroupCheckedSpecifierKey];

  return v3;
}

- (unint64_t)getNowPlayingType
{
  char v3 = 0;
  unint64_t result = (unint64_t)[(NPSDomainAccessor *)self->_eltonAccessor integerForKey:@"NowPlayingPrimaryAction" keyExistsAndHasValidFormat:&v3];
  if (!v3) {
    return 0;
  }
  return result;
}

- (void)setNowPlayingTypeForSpecifier:(id)a3
{
  eltonAccessor = self->_eltonAccessor;
  id v5 = [a3 propertyForKey:PSValueKey];
  [(NPSDomainAccessor *)eltonAccessor setObject:v5 forKey:@"NowPlayingPrimaryAction"];

  id v6 = [(NPSDomainAccessor *)self->_eltonAccessor synchronize];
  id v7 = objc_opt_new();
  unsigned int v8 = WAGPreferencesDomain;
  CFStringRef v11 = @"NowPlayingPrimaryAction";
  id v9 = +[NSArray arrayWithObjects:&v11 count:1];
  uint64_t v10 = +[NSSet setWithArray:v9];
  [v7 synchronizeNanoDomain:v8 keys:v10];

  [(WGABridgeDoubleTapSettingsViewController *)self reloadSpecifiers];
}

- (id)_smartStackSettingSpecifiers
{
  char v3 = +[NSMutableArray array];
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"ELTON_DOUBLE_TAP_SMART_STACK_SECTION" value:&stru_84A0 table:@"Localizable"];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:0 edit:0];

  [v6 setIdentifier:@"smartStackGroup"];
  [v6 setProperty:&__kCFBooleanTrue forKey:PSIsRadioGroupKey];
  [v3 addObject:v6];
  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v8 = [v7 localizedStringForKey:@"ELTON_DOUBLE_TAP_SMART_STACK_SECTION_PLAY_PAUSE" value:&stru_84A0 table:@"Localizable"];
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v9 setIdentifier:@"smartStackSettingsAdvance"];
  uint64_t v10 = PSValueKey;
  [v9 setProperty:&off_8A40 forKey:PSValueKey];
  [v9 setButtonAction:"setSmartStackPrimaryActionTypeForSpecifier:"];
  [v3 addObject:v9];
  CFStringRef v11 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v12 = [v11 localizedStringForKey:@"ELTON_DOUBLE_TAP_SMART_STACK_SECTION_SELECT" value:&stru_84A0 table:@"Localizable"];
  v13 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v13 setIdentifier:@"smartStackSettingsSelect"];
  [v13 setProperty:&off_8A58 forKey:v10];
  [v13 setButtonAction:"setSmartStackPrimaryActionTypeForSpecifier:"];
  [v3 addObject:v13];
  if ((char *)[(WGABridgeDoubleTapSettingsViewController *)self getSmartStackPrimaryActionType] == (char *)&dword_0 + 1)v14 = v9; {
  else
  }
    v14 = v13;
  [v6 setProperty:v14 forKey:PSRadioGroupCheckedSpecifierKey];

  return v3;
}

- (unint64_t)getSmartStackPrimaryActionType
{
  char v3 = 0;
  unint64_t result = (unint64_t)[(NPSDomainAccessor *)self->_eltonAccessor integerForKey:@"smartStackPrimaryAction_v1" keyExistsAndHasValidFormat:&v3];
  if (!v3) {
    return 1;
  }
  return result;
}

- (void)setSmartStackPrimaryActionTypeForSpecifier:(id)a3
{
  eltonAccessor = self->_eltonAccessor;
  id v5 = [a3 propertyForKey:PSValueKey];
  [(NPSDomainAccessor *)eltonAccessor setObject:v5 forKey:@"smartStackPrimaryAction_v1"];

  id v6 = [(NPSDomainAccessor *)self->_eltonAccessor synchronize];
  id v7 = objc_opt_new();
  unsigned int v8 = WAGPreferencesDomain;
  CFStringRef v11 = @"smartStackPrimaryAction_v1";
  id v9 = +[NSArray arrayWithObjects:&v11 count:1];
  uint64_t v10 = +[NSSet setWithArray:v9];
  [v7 synchronizeNanoDomain:v8 keys:v10];

  [(WGABridgeDoubleTapSettingsViewController *)self reloadSpecifiers];
}

- (id)_ignoreWhileVisionProDonnedSettingSpecifiers
{
  char v3 = +[NSMutableArray array];
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"IGNORE_WHILE_VISION_PRO_DONNED_HEADER" value:&stru_84A0 table:@"Localizable"];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:0 edit:0];

  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned int v8 = [v7 localizedStringForKey:@"IGNORE_WHILE_VISION_PRO_DONNED_FOOTER" value:&stru_84A0 table:@"Localizable"];
  [v6 setProperty:v8 forKey:PSFooterTextGroupKey];

  [v6 setIdentifier:@"ignoreWhileVisionProDonned"];
  [v3 addObject:v6];
  id v9 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v10 = [v9 localizedStringForKey:@"IGNORE_DOUBLE_TAP" value:&stru_84A0 table:@"Localizable"];
  CFStringRef v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:self set:"_setIgnoreGesturesWhileVisionProDonned:specifier:" get:"_getIgnoreGesturesWhileVisionProDonned:" detail:0 cell:6 edit:0];

  [v11 setIdentifier:@"ignoreDoubleTap"];
  [v3 addObject:v11];

  return v3;
}

- (void)_setIgnoreGesturesWhileVisionProDonned:(id)a3 specifier:(id)a4
{
  [(NPSDomainAccessor *)self->_eltonAccessor setObject:a3 forKey:@"ignoreGesturesWhileVisionProDonned"];
  id v5 = [(NPSDomainAccessor *)self->_eltonAccessor synchronize];
  id v6 = objc_opt_new();
  id v7 = WAGPreferencesDomain;
  CFStringRef v10 = @"ignoreGesturesWhileVisionProDonned";
  unsigned int v8 = +[NSArray arrayWithObjects:&v10 count:1];
  id v9 = +[NSSet setWithArray:v8];
  [v6 synchronizeNanoDomain:v7 keys:v9];
}

- (id)_getIgnoreGesturesWhileVisionProDonned:(id)a3
{
  id v3 = [(NPSDomainAccessor *)self->_eltonAccessor BOOLForKey:@"ignoreGesturesWhileVisionProDonned"];

  return +[NSNumber numberWithBool:v3];
}

- (void)openTipsPage
{
  id v3 = [(WGABridgeDoubleTapSettingsViewController *)self _phoneSettings];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v9 = 138412546;
    CFStringRef v10 = v5;
    __int16 v11 = 2080;
    unsigned int v12 = "-[WGABridgeDoubleTapSettingsViewController openTipsPage]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%@ %s", (uint8_t *)&v9, 0x16u);
  }
  id v6 = [(WGABridgeDoubleTapSettingsViewController *)self _phoneSettings];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    CFStringRef v10 = @"x-apple-tips://open?tip=TouchFreeWatch&referrer=com.apple.Bridge";
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Will open url %@", (uint8_t *)&v9, 0xCu);
  }

  id v7 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned int v8 = +[NSURL URLWithString:@"x-apple-tips://open?tip=TouchFreeWatch&referrer=com.apple.Bridge"];
  [v7 openSensitiveURL:v8 withOptions:0];
}

- (id)_phoneSettings
{
  if (qword_C500 != -1) {
    dispatch_once(&qword_C500, &stru_83B0);
  }
  v2 = (void *)qword_C4F8;

  return v2;
}

- (void).cxx_destruct
{
}

@end