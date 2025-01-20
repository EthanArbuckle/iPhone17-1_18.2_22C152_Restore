@interface WGAEltonBridgeSettingsController
- (BOOL)_pairedDeviceIsTinker;
- (BOOL)_pairedDeviceSupportsElton;
- (id)_coverToMuteSpecifiers;
- (id)_eltonGroupSpecifiers;
- (id)_getCoverToMuteEnableState:(id)a3;
- (id)getEltonStateDescription:(id)a3;
- (id)specifiers;
- (unint64_t)_gestureMode;
- (void)_setCoverToMuteEnabled:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WGAEltonBridgeSettingsController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)WGAEltonBridgeSettingsController;
  [(WGAEltonBridgeSettingsController *)&v10 viewDidLoad];
  id v3 = objc_alloc((Class)NPSDomainAccessor);
  v4 = (NPSDomainAccessor *)[v3 initWithDomain:WAGPreferencesDomain];
  eltonAccessor = self->_eltonAccessor;
  self->_eltonAccessor = v4;

  id v6 = [(NPSDomainAccessor *)self->_eltonAccessor synchronize];
  v7 = (NPSDomainAccessor *)[objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.Carousel"];
  cslAccessor = self->_cslAccessor;
  self->_cslAccessor = v7;

  id v9 = [(NPSDomainAccessor *)self->_cslAccessor synchronize];
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)WGAEltonBridgeSettingsController;
  [(WGAEltonBridgeSettingsController *)&v12 viewWillAppear:a3];
  [(WGAEltonBridgeSettingsController *)self reloadSpecifiers];
  objc_initWeak(&location, self);
  v4 = (const char *)[@"WAGPreferencesSyncDidChangeInternalNotification" UTF8String];
  id v5 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_4098;
  handler[3] = &unk_82D0;
  objc_copyWeak(&v10, &location);
  notify_register_dispatch(v4, &self->_eltonPreferencesSyncToken, (dispatch_queue_t)&_dispatch_main_q, handler);

  id v6 = (const char *)[@"CSLCoverToMuteChangedNotification" UTF8String];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_4118;
  v7[3] = &unk_82D0;
  objc_copyWeak(&v8, &location);
  notify_register_dispatch(v6, &self->_cslPreferencesSyncToken, (dispatch_queue_t)&_dispatch_main_q, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGAEltonBridgeSettingsController;
  [(WGAEltonBridgeSettingsController *)&v4 viewDidAppear:a3];
  [(WGAEltonBridgeSettingsController *)self reloadSpecifiers];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WGAEltonBridgeSettingsController;
  [(WGAEltonBridgeSettingsController *)&v4 viewWillDisappear:a3];
  notify_cancel(self->_eltonPreferencesSyncToken);
  notify_cancel(self->_cslPreferencesSyncToken);
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    id v6 = [(WGAEltonBridgeSettingsController *)self _eltonGroupSpecifiers];
    [v5 addObjectsFromArray:v6];

    v7 = [(WGAEltonBridgeSettingsController *)self _coverToMuteSpecifiers];
    [v5 addObjectsFromArray:v7];

    id v8 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v5;

    objc_super v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (id)_eltonGroupSpecifiers
{
  unsigned int v3 = [(WGAEltonBridgeSettingsController *)self _pairedDeviceSupportsElton];
  unsigned __int8 v4 = [(WGAEltonBridgeSettingsController *)self _pairedDeviceIsTinker];
  id v5 = &__NSArray0__struct;
  if (v3 && (v4 & 1) == 0)
  {
    id v5 = +[NSMutableArray array];
    id v6 = +[PSSpecifier groupSpecifierWithID:@"ELTON_SETTINGS_GROUP_ID"];
    [v5 addObject:v6];

    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"ELTON_DOUBLE_TAP_STATE" value:&stru_84A0 table:@"Localizable"];
    id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:0 get:"getEltonStateDescription:" detail:objc_opt_class() cell:2 edit:0];

    [v5 addObject:v9];
  }

  return v5;
}

- (id)_coverToMuteSpecifiers
{
  unsigned int v3 = +[NSMutableArray array];
  unsigned __int8 v4 = +[PSSpecifier groupSpecifierWithID:@"COVER_TO_MUTE_GROUP_ID"];
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"COVER_TO_MUTE_FOOTER" value:&stru_84A0 table:@"Localizable"];
  [v4 setProperty:v6 forKey:PSFooterTextGroupKey];

  [v3 addObject:v4];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 localizedStringForKey:@"COVER_TO_MUTE" value:&stru_84A0 table:@"Localizable"];
  id v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"_setCoverToMuteEnabled:specifier:" get:"_getCoverToMuteEnableState:" detail:0 cell:6 edit:0];

  [v3 addObject:v9];

  return v3;
}

- (void)_setCoverToMuteEnabled:(id)a3 specifier:(id)a4
{
  -[NPSDomainAccessor setBool:forKey:](self->_cslAccessor, "setBool:forKey:", [a3 BOOLValue], @"CSLCoverToMute");
  id v5 = [(NPSDomainAccessor *)self->_cslAccessor synchronize];
  id v6 = objc_opt_new();
  CFStringRef v9 = @"CSLCoverToMute";
  v7 = +[NSArray arrayWithObjects:&v9 count:1];
  id v8 = +[NSSet setWithArray:v7];
  [v6 synchronizeNanoDomain:@"com.apple.Carousel" keys:v8];
}

- (id)_getCoverToMuteEnableState:(id)a3
{
  char v7 = 0;
  unsigned int v3 = [(NPSDomainAccessor *)self->_cslAccessor BOOLForKey:@"CSLCoverToMute" keyExistsAndHasValidFormat:&v7];
  if (v7) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = 1;
  }
  id v5 = +[NSNumber numberWithBool:v4];

  return v5;
}

- (id)getEltonStateDescription:(id)a3
{
  unint64_t v3 = [(WGAEltonBridgeSettingsController *)self _gestureMode];
  uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3 == 1) {
    CFStringRef v6 = @"ELTON_DOUBLE_TAP_STATE_ON";
  }
  else {
    CFStringRef v6 = @"ELTON_DOUBLE_TAP_STATE_OFF";
  }
  char v7 = [v4 localizedStringForKey:v6 value:&stru_84A0 table:@"Localizable"];

  return v7;
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

- (BOOL)_pairedDeviceSupportsElton
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  char v3 = [v2 getActivePairedDevice];

  id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"0E581E21-36BA-4770-9408-0467585E8495"];
  unsigned __int8 v5 = [v3 supportsCapability:v4];

  return v5;
}

- (BOOL)_pairedDeviceIsTinker
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  char v3 = [v2 getActivePairedDevice];

  id v4 = [v3 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cslAccessor, 0);

  objc_storeStrong((id *)&self->_eltonAccessor, 0);
}

@end