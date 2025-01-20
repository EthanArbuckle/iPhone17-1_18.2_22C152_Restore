@interface MusicSettingsCellularDataController
- (BOOL)cellularDataEnabled;
- (BOOL)cellularHighDataModeEnabled;
- (BOOL)cellularSettingsAvailable;
- (BOOL)wifiDataEnabled;
- (MusicSettingsCellularDataController)init;
- (NSNumber)appCellularDataModificationDisabled;
- (NSNumber)systemAllowCellularEnabled;
- (NSString)cellularDataStateDescription;
- (PSSpecifier)musicCellularDataSpecifier;
- (id)stringsTable;
- (id)systemAllowMusicCellularDataEnabledForSpecifier:(id)a3;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setSystemAllowMusicCellularDataEnabled:(id)a3 forSpecifier:(id)a4;
@end

@implementation MusicSettingsCellularDataController

- (MusicSettingsCellularDataController)init
{
  v21.receiver = self;
  v21.super_class = (Class)MusicSettingsCellularDataController;
  v2 = [(MusicSettingsCellularDataController *)&v21 init];
  if (v2)
  {
    uint64_t v3 = +[MCProfileConnection sharedConnection];
    connection = v2->_connection;
    v2->_connection = (MCProfileConnection *)v3;

    [(MCProfileConnection *)v2->_connection addObserver:v2];
    v5 = [(MusicSettingsCellularDataController *)v2 loadSpecifiersFromPlistName:@"MusicSettingsCellularData" target:v2];
    id v6 = [v5 mutableCopy];

    v7 = (PSSystemPolicyForApp *)[objc_alloc((Class)PSSystemPolicyForApp) initWithBundleIdentifier:@"com.apple.Music"];
    appPolicy = v2->_appPolicy;
    v2->_appPolicy = v7;

    v9 = [(PSSystemPolicyForApp *)v2->_appPolicy specifiersForPolicyOptions:0x8000 force:0];
    uint64_t v10 = [v9 lastObject];
    musicCellularDataSpecifier = v2->_musicCellularDataSpecifier;
    v2->_musicCellularDataSpecifier = (PSSpecifier *)v10;

    v12 = v2->_musicCellularDataSpecifier;
    if (v12)
    {
      id WeakRetained = objc_loadWeakRetained((id *)((char *)v12 + OBJC_IVAR___PSSpecifier_target));
      objc_storeWeak(&v2->_musicCellularDataSpecifierTarget, WeakRetained);

      v2->_musicCellularDataSpecifierSetter = *(SEL *)((char *)v2->_musicCellularDataSpecifier
                                                     + OBJC_IVAR___PSSpecifier_setter);
      v2->_musicCellularDataSpecifierGetter = *(SEL *)((char *)v2->_musicCellularDataSpecifier
                                                     + OBJC_IVAR___PSSpecifier_getter);
      objc_storeWeak((id *)((char *)v2->_musicCellularDataSpecifier + OBJC_IVAR___PSSpecifier_target), v2);
      *(void *)((char *)v2->_musicCellularDataSpecifier + OBJC_IVAR___PSSpecifier_getter) = "systemAllowMusicCellularDa"
                                                                                              "taEnabledForSpecifier:";
      *(void *)((char *)v2->_musicCellularDataSpecifier + OBJC_IVAR___PSSpecifier_setter) = "setSystemAllowMusicCellula"
                                                                                              "rDataEnabled:forSpecifier:";
      v14 = [(MusicSettingsCellularDataController *)v2 appCellularDataModificationDisabled];
      unsigned int v15 = [v14 BOOLValue];

      if (v15) {
        [(PSSpecifier *)v2->_musicCellularDataSpecifier setObject:&__kCFBooleanFalse forKeyedSubscript:PSEnabledKey];
      }
      objc_msgSend(v6, "insertObject:atIndex:", v2->_musicCellularDataSpecifier, (char *)objc_msgSend(v6, "indexOfSpecifierWithID:", @"com.apple.Music:SystemCellularGroup") + 1);
      v16 = (CoreTelephonyClient *)objc_alloc_init((Class)CoreTelephonyClient);
      ctClient = v2->_ctClient;
      v2->_ctClient = v16;

      uint64_t v18 = [(CoreTelephonyClient *)v2->_ctClient getCurrentDataServiceDescriptorSync:0];
      serviceDescriptor = v2->_serviceDescriptor;
      v2->_serviceDescriptor = (CTServiceDescriptor *)v18;
    }
    [(MusicSettingsCellularDataController *)v2 setAllSpecifiers:v6];
  }
  return v2;
}

- (void)dealloc
{
  [(MCProfileConnection *)self->_connection removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)MusicSettingsCellularDataController;
  [(MusicSettingsCellularDataController *)&v3 dealloc];
}

- (id)stringsTable
{
  return @"MusicSettings";
}

- (BOOL)cellularSettingsAvailable
{
  v2 = [(PSSystemPolicyForApp *)self->_appPolicy specifiersForPolicyOptions:0x8000 force:0];
  objc_super v3 = [v2 lastObject];

  return v3 != 0;
}

- (BOOL)cellularDataEnabled
{
  v2 = [(PSSystemPolicyForApp *)self->_appPolicy specifiersForPolicyOptions:0x8000 force:0];
  objc_super v3 = [v2 lastObject];

  v4 = objc_msgSend(v3, "music_getValue");
  v5 = sub_3658(v4);
  unsigned __int8 v6 = [v5 BOOLValue];

  return v6;
}

- (BOOL)wifiDataEnabled
{
  v2 = [(PSSystemPolicyForApp *)self->_appPolicy specifiersForPolicyOptions:0x8000 force:0];
  objc_super v3 = [v2 lastObject];

  v4 = objc_msgSend(v3, "music_getValue");
  v5 = +[UIDevice currentDevice];
  unsigned int v6 = objc_msgSend(v5, "sf_isChinaRegionCellularDevice");

  v7 = &__kCFBooleanTrue;
  if (v6 && ([v4 intValue] & 1) == 0) {
    v7 = &__kCFBooleanFalse;
  }
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (BOOL)cellularHighDataModeEnabled
{
  unsigned __int8 v3 = [(CoreTelephonyClient *)self->_ctClient isHighDataModeSupported:self->_serviceDescriptor error:0];
  unsigned __int8 v4 = [(CoreTelephonyClient *)self->_ctClient interfaceCostExpensive:self->_serviceDescriptor error:0];
  return v3 & ((v4 | [(CoreTelephonyClient *)self->_ctClient lowDataMode:self->_serviceDescriptor error:0]) ^ 1);
}

- (NSString)cellularDataStateDescription
{
  unsigned int v2 = [(MusicSettingsCellularDataController *)self cellularDataEnabled];
  unsigned __int8 v3 = +[NSBundle bundleForClass:objc_opt_class()];
  unsigned __int8 v4 = v3;
  if (v2) {
    CFStringRef v5 = @"ON";
  }
  else {
    CFStringRef v5 = @"OFF";
  }
  unsigned int v6 = [v3 localizedStringForKey:v5 value:&stru_18CF0 table:@"MusicSettings"];

  return (NSString *)v6;
}

- (void)setSystemAllowMusicCellularDataEnabled:(id)a3 forSpecifier:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained(&self->_musicCellularDataSpecifierTarget);
  id v8 = (id)MusicSettingsPerformSelector2();

  id v9 = objc_loadWeakRetained((id *)&self->MusicSettingsListViewController_opaque[OBJC_IVAR___PSViewController__parentController]);
  [v9 reloadSpecifiers];

  [(MusicSettingsCellularDataController *)self updateVisibleSpecifiers];
}

- (id)systemAllowMusicCellularDataEnabledForSpecifier:(id)a3
{
  p_musicCellularDataSpecifierTarget = &self->_musicCellularDataSpecifierTarget;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(p_musicCellularDataSpecifierTarget);
  id v6 = MusicSettingsPerformSelector();

  return v6;
}

- (NSNumber)systemAllowCellularEnabled
{
  unsigned int v2 = [(PSSpecifier *)self->_musicCellularDataSpecifier music_getValue];
  unsigned __int8 v3 = sub_3658(v2);

  return (NSNumber *)v3;
}

- (NSNumber)appCellularDataModificationDisabled
{
  BOOL v2 = [(MCProfileConnection *)self->_connection effectiveBoolValueForSetting:MCFeatureAppCellularDataModificationAllowed] == 2;

  return +[NSNumber numberWithBool:v2];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3BB0;
  block[3] = &unk_186F8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (PSSpecifier)musicCellularDataSpecifier
{
  return self->_musicCellularDataSpecifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicCellularDataSpecifier, 0);
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak(&self->_musicCellularDataSpecifierTarget);

  objc_storeStrong((id *)&self->_appPolicy, 0);
}

@end