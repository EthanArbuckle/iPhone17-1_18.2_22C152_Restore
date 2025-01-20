@interface DTSettings
- (BOOL)cachedAdAttributionKitDeveloperModeEnabled;
- (BOOL)classKitAppInstalled;
- (BOOL)isAdAttributionKitSupported;
- (BOOL)isClassKitAppInstalled;
- (BOOL)isImmersiveExperienceSupported;
- (BOOL)isNCOSupported;
- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5;
- (DTSettings)init;
- (NCOData)ncoData;
- (NSString)cachedNCOStatus;
- (id)getAdAttributionKitDeveloperMode:(id)a3;
- (id)getCredentialExchangeEnabled:(id)a3;
- (id)getDisplayRecentDonations:(id)a3;
- (id)getSWCDeveloperMode:(id)a3;
- (id)getShowBTCarAudioOutput:(id)a3;
- (id)getUseRouteSharingPolicyForAirPlayRouting:(id)a3;
- (id)getWidgetKitDeveloperModeEnabled:(id)a3;
- (id)hangDetectionEnablementStatus:(id)a3;
- (id)isL4SEnabled:(id)a3;
- (id)multipathNetworking:(id)a3;
- (id)ncoStatus:(id)a3;
- (id)nlcStatus:(id)a3;
- (id)specifiers;
- (void)_manageSandboxAccount:(id)a3;
- (void)_signIntoSandboxAccount:(id)a3;
- (void)_updateSandboxSpecifier:(id)a3;
- (void)clearAppClipsCaches:(id)a3;
- (void)clearTrustedComputers:(id)a3;
- (void)dealloc;
- (void)didSelectAlertAction:(id)a3;
- (void)postNotification:(id)a3;
- (void)refreshAdAttributionKitDeveloperModeEnabled;
- (void)resetAudioServices:(id)a3;
- (void)resetCaptureServices:(id)a3;
- (void)resetCodecServices:(id)a3;
- (void)resetMediaServices:(id)a3;
- (void)resetPlaybackAndExportServices:(id)a3;
- (void)setAdAttributionKitDeveloperMode:(id)a3 specifier:(id)a4;
- (void)setCachedAdAttributionKitDeveloperModeEnabled:(BOOL)a3;
- (void)setCachedNCOStatus:(id)a3;
- (void)setClassKitAppInstalled:(BOOL)a3;
- (void)setCredentialExchangeEnabled:(id)a3 specifier:(id)a4;
- (void)setDisplayRecentDonations:(id)a3 specifier:(id)a4;
- (void)setL4SEnabled:(id)a3 specifier:(id)a4;
- (void)setNcoData:(id)a3;
- (void)setSWCDeveloperMode:(id)a3 specifier:(id)a4;
- (void)setShowBTCarAudioOutput:(id)a3 specifier:(id)a4;
- (void)setUseRouteSharingPolicyForAirPlayRouting:(id)a3 specifier:(id)a4;
- (void)setWidgetKitDeveloperModeEnabled:(id)a3 specifier:(id)a4;
- (void)showResetMediaServices:(id)a3;
- (void)syncRecentDonations:(id)a3;
- (void)updateAndReloadNCOStatusIfNeeded;
- (void)updateHangDetection;
- (void)updateNLC;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5;
- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
@end

@implementation DTSettings

- (DTSettings)init
{
  v9.receiver = self;
  v9.super_class = (Class)DTSettings;
  v2 = [(DTSettings *)&v9 init];
  if (v2)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:v2 selector:"updateNLC" name:@"com.apple.Preferences.nlcChanges" object:0];

    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"updateHangDetection" name:@"com.apple.Preferences.hangTracerStateChanged" object:0];

    v2->_classKitAppInstalled = [(DTSettings *)v2 isClassKitAppInstalled];
    cachedNCOStatus = v2->_cachedNCOStatus;
    v2->_cachedNCOStatus = (NSString *)&stru_35910;

    uint64_t v6 = objc_opt_new();
    ncoData = v2->_ncoData;
    v2->_ncoData = (NCOData *)v6;

    v2->_cachedAdAttributionKitDeveloperModeEnabled = 0;
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)DTSettings;
  [(DTSettings *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (v4) {
    goto LABEL_31;
  }
  v5 = [(DTSettings *)self loadSpecifiersFromPlistName:@"DTSettings" target:self];
  uint64_t v6 = [v5 specifierForID:@"NLC"];
  [v6 setTarget:self];
  if (![(DTSettings *)self isNCOSupported])
  {
    v7 = [v5 specifierForID:@"NCO"];
    [v5 removeObject:v7];
  }
  if (![(DTSettings *)self isAdAttributionKitSupported])
  {
    v8 = [v5 specifierForID:@"ADATTRIBUTIONKIT_GROUP"];
    [v5 removeObject:v8];

    objc_super v9 = [v5 specifierForID:@"ADATTRIBUTIONKIT_DEVELOPER_MODE_ENABLED"];
    [v5 removeObject:v9];
  }
  if (![(DTSettings *)self classKitAppInstalled])
  {
    v10 = [v5 specifierForID:@"ClassKitSettingsGroup"];
    [v5 removeObject:v10];

    v11 = [v5 specifierForID:@"ClassKitSettings"];
    [v5 removeObject:v11];
  }
  if (!+[DTAppClipSettings isAvailable])
  {
    v12 = [v5 specifierForID:@"APP_CLIPS_GROUP"];
    [v5 removeObject:v12];

    v13 = [v5 specifierForID:@"APP_CLIPS_LOCAL_EXPERIENCES"];
    [v5 removeObject:v13];

    v14 = [v5 specifierForID:@"APP_CLIPS_DIAGNOSTICS"];
    [v5 removeObject:v14];

    v15 = [v5 specifierForID:@"APP_CLIPS_CLEAR_CACHES"];
    [v5 removeObject:v15];
  }
  if (!+[DTAppClipSettings isAvailable]
    || (_os_feature_enabled_impl() & 1) == 0)
  {
    v16 = [v5 specifierForID:@"APP_CLIPS_DIAGNOSTICS"];
    [v5 removeObject:v16];

    v17 = [v5 specifierForID:@"UNIVERSAL_LINKS_DIAGNOSTICS"];
    [v5 removeObject:v17];
  }
  v18 = [v5 specifierForID:@"UNIVERSAL_LINKS_DIAGNOSTICS"];
  if ([v5 containsObject:v18]) {
    goto LABEL_16;
  }
  v19 = [v5 specifierForID:@"DEVELOPER_SWC"];
  unsigned __int8 v20 = [v5 containsObject:v19];

  if ((v20 & 1) == 0)
  {
    v18 = [v5 specifierForID:@"UNIVERSAL_LINKS_GROUP"];
    [v5 removeObject:v18];
LABEL_16:
  }
  v21 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v22 = [v21 BOOLForKey:@"ENDeveloperEnabled"];

  if ((v22 & 1) == 0)
  {
    v23 = [v5 specifierForID:@"ExposureNotificationGroup"];
    [v5 removeObject:v23];

    v24 = [v5 specifierForID:@"ExposureNotificationSettings"];
    [v5 removeObject:v24];
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v25 = [&off_383A8 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v40;
    do
    {
      v28 = 0;
      do
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(&off_383A8);
        }
        v29 = [v5 specifierForID:*(void *)(*((void *)&v39 + 1) + 8 * (void)v28)];
        [v5 removeObject:v29];

        v28 = (char *)v28 + 1;
      }
      while (v26 != v28);
      id v26 = [&off_383A8 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v26);
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v30 = [v5 specifierForID:@"PERFORMANCE_GROUP"];
    [v5 removeObject:v30];

    v31 = [v5 specifierForID:@"HANGTRACER_EXTERNAL_CONFIGURE"];
    [v5 removeObject:v31];
  }
  if (!+[DTDMCESSOSettings isAvailable])
  {
    v32 = [v5 specifierForID:@"DEVICE_MANAGEMENT_GROUP"];
    [v5 removeObject:v32];

    v33 = [v5 specifierForID:@"DEVICE_MANAGEMENT_ESSO"];
    [v5 removeObject:v33];
  }
  [(DTSettings *)self _updateSandboxSpecifier:v5];
  id v34 = [v5 copy];
  v35 = *(void **)&self->PSListController_opaque[v3];
  *(void *)&self->PSListController_opaque[v3] = v34;

  v36 = [(DTSettings *)self loadSpecifiersFromPlistName:@"ResetMediaServices" target:self];
  mediaServiceSpecifiers = self->_mediaServiceSpecifiers;
  self->_mediaServiceSpecifiers = v36;

  objc_super v4 = *(void **)&self->PSListController_opaque[v3];
LABEL_31:

  return v4;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)DTSettings;
  [(DTSettings *)&v5 viewDidLoad];
  uint64_t v3 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v4 = [v3 localizedStringForKey:@"DEVELOPER" value:&stru_35910 table:@"DTSettings"];
  [(DTSettings *)self setTitle:v4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DTSettings;
  [(DTSettings *)&v4 viewWillAppear:a3];
  [(DTSettings *)self reloadSpecifierID:@"MULTI_PATH_AGG"];
  [(DTSettings *)self updateAndReloadNCOStatusIfNeeded];
  [(DTSettings *)self refreshAdAttributionKitDeveloperModeEnabled];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DTSettings;
  [(DTSettings *)&v10 viewDidAppear:a3];
  objc_super v4 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v5 = [v4 bundleURL];

  id v6 = objc_alloc((Class)_NSLocalizedStringResource);
  v7 = +[NSLocale currentLocale];
  id v8 = [v6 initWithKey:@"DEVELOPER" table:@"DTSettings" locale:v7 bundleURL:v5];

  objc_super v9 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Developer/"];
  [(DTSettings *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.developer-tools" title:v8 localizedNavigationComponents:&__NSArray0__struct deepLink:v9];
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"com.apple.Preferences.DTNetQualViewWillDisappear" object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)DTSettings;
  [(DTSettings *)&v3 viewDidDisappear:a3];
}

- (BOOL)isNCOSupported
{
  v2 = [(DTSettings *)self ncoData];
  unsigned __int8 v3 = [v2 isHighDataModeSupported];

  return v3;
}

- (void)updateAndReloadNCOStatusIfNeeded
{
  if ([(DTSettings *)self indexOfSpecifierID:@"NCO"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v5[0] = 0;
    v5[1] = v5;
    v5[2] = 0x3042000000;
    v5[3] = sub_1D038;
    v5[4] = sub_1D044;
    objc_initWeak(&v6, self);
    unsigned __int8 v3 = [(DTSettings *)self ncoData];
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_1D04C;
    v4[3] = &unk_352A8;
    v4[4] = v5;
    [v3 fetchNCOStatusWithCompletion:v4];

    _Block_object_dispose(v5, 8);
    objc_destroyWeak(&v6);
  }
}

- (id)ncoStatus:(id)a3
{
  return [(DTSettings *)self cachedNCOStatus];
}

- (BOOL)isAdAttributionKitSupported
{
  return 1;
}

- (id)getAdAttributionKitDeveloperMode:(id)a3
{
  return +[NSNumber numberWithBool:self->_cachedAdAttributionKitDeveloperModeEnabled];
}

- (void)setAdAttributionKitDeveloperMode:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 BOOLValue];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v8;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[AdAttributionKit] Setting developer mode enabled: %d", buf, 8u);
  }
  *(void *)buf = 0;
  v11 = buf;
  uint64_t v12 = 0x3042000000;
  v13 = sub_1D038;
  v14 = sub_1D044;
  objc_initWeak(v15, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1D398;
  v9[3] = &unk_34E40;
  v9[4] = buf;
  +[AdAttributionKitBridge setDeveloperModeEnabled:v8 completion:v9];
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(v15);
}

- (void)refreshAdAttributionKitDeveloperModeEnabled
{
  if ([(DTSettings *)self indexOfSpecifierID:@"ADATTRIBUTIONKIT_DEVELOPER_MODE_ENABLED"] != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v4[0] = 0;
    v4[1] = v4;
    v4[2] = 0x3042000000;
    v4[3] = sub_1D038;
    v4[4] = sub_1D044;
    objc_initWeak(&v5, self);
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1D5C4;
    v3[3] = &unk_352A8;
    v3[4] = v4;
    +[AdAttributionKitBridge getDeveloperModeEnabledWithCompletion:v3];
    _Block_object_dispose(v4, 8);
    objc_destroyWeak(&v5);
  }
}

- (void)updateNLC
{
}

- (id)nlcStatus:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.network.prefPaneSimulate");
  if (CFPreferencesGetAppBooleanValue(@"SimulatorIsRunning", @"com.apple.network.prefPaneSimulate", 0) == 1)
  {
    unsigned __int8 v3 = (void *)CFPreferencesCopyAppValue(@"TimeAtLastRun", @"com.apple.network.prefPaneSimulate");
    double v4 = (double)(uint64_t)[v3 longValue];

    id v5 = +[NSProcessInfo processInfo];
    [v5 systemUptime];
    double v7 = v6;

    id v8 = +[NSDate date];
    [v8 timeIntervalSince1970];
    double v10 = v9 - v4;

    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v12 = v11;
    if (v10 <= v7) {
      CFStringRef v13 = @"ON";
    }
    else {
      CFStringRef v13 = @"OFF";
    }
  }
  else
  {
    v11 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v12 = v11;
    CFStringRef v13 = @"OFF";
  }
  v14 = [v11 localizedStringForKey:v13 value:&stru_35910 table:@"DTSettings"];

  return v14;
}

- (id)getUseRouteSharingPolicyForAirPlayRouting:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.coremedia");
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"honorRouteSharingPolicyForAirPlayRouting", @"com.apple.coremedia", 0) != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)setUseRouteSharingPolicyForAirPlayRouting:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"honorRouteSharingPolicyForAirPlayRouting", a3, @"com.apple.coremedia");

  CFPreferencesAppSynchronize(@"com.apple.coremedia");
}

- (void)showResetMediaServices:(id)a3
{
  double v4 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_mediaServiceSpecifiers;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v10 cellType] == (char *)&dword_C + 1)
        {
          v11 = [v10 name];
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          id v15[2] = sub_1DBBC;
          v15[3] = &unk_35128;
          v15[4] = self;
          v15[5] = v10;
          uint64_t v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v15];
          [v4 addAction:v12];
        }
      }
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  CFStringRef v13 = sub_1A0F4(@"RESET_CONFIRMATION_CANCEL");
  v14 = +[UIAlertAction actionWithTitle:v13 style:1 handler:0];
  [v4 addAction:v14];

  [(DTSettings *)self presentViewController:v4 animated:1 completion:0];
}

- (void)didSelectAlertAction:(id)a3
{
}

- (void)resetMediaServices:(id)a3
{
}

- (void)resetAudioServices:(id)a3
{
}

- (void)resetPlaybackAndExportServices:(id)a3
{
}

- (void)resetCaptureServices:(id)a3
{
}

- (void)resetCodecServices:(id)a3
{
}

- (id)getSWCDeveloperMode:(id)a3
{
  id v3 = +[_SWCServiceDetails isDeveloperModeEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)setSWCDeveloperMode:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  +[_SWCServiceDetails setDeveloperModeEnabled:v4 completionHandler:0];
}

- (BOOL)isImmersiveExperienceSupported
{
  return 0;
}

- (id)isL4SEnabled:(id)a3
{
  uint64_t l4s_enabled = network_config_get_l4s_enabled();

  return +[NSNumber numberWithBool:l4s_enabled];
}

- (void)setL4SEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  _network_config_set_l4s_enabled(v4);
}

- (void)updateHangDetection
{
}

- (id)hangDetectionEnablementStatus:(id)a3
{
  id v3 = objc_opt_new();
  unsigned int v4 = [v3 isEnabled];

  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = v5;
  if (v4) {
    CFStringRef v7 = @"ON";
  }
  else {
    CFStringRef v7 = @"OFF";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_35910 table:@"DTSettings"];

  return v8;
}

- (void)clearTrustedComputers:(id)a3
{
  uint64_t v3 = lockdown_delete_pair_records();
  if (v3) {
    NSLog(@"clearTrustedComputers: failed to remove all lockdown pairing records with error %d", v3);
  }
  else {
    NSLog(@"clearTrustedComputers: removed all lockdown pairing records");
  }
}

- (BOOL)isClassKitAppInstalled
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1DF90;
  v4[3] = &unk_352D0;
  v4[4] = &v5;
  [v2 enumerateApplicationsOfType:0 block:v4];

  LOBYTE(v2) = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (void)postNotification:(id)a3
{
  name = [a3 propertyForKey:PSValueChangedNotificationKey];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, name, 0, 0, 1u);
}

- (id)multipathNetworking:(id)a3
{
  int default_multipath_service_type = network_config_get_default_multipath_service_type();
  unsigned int v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v5 = v4;
  if (default_multipath_service_type) {
    CFStringRef v6 = @"ON";
  }
  else {
    CFStringRef v6 = @"OFF";
  }
  uint64_t v7 = [v4 localizedStringForKey:v6 value:&stru_35910 table:@"DTSettings"];

  return v7;
}

- (void)setDisplayRecentDonations:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"displayRecentDonations", a3, @"com.apple.duetexpertd");
  CFPreferencesAppSynchronize(@"com.apple.duetexpertd");
  unsigned int v4 = objc_opt_new();
  CFStringRef v7 = @"displayRecentDonations";
  uint64_t v5 = +[NSArray arrayWithObjects:&v7 count:1];
  CFStringRef v6 = +[NSSet setWithArray:v5];
  [v4 synchronizeUserDefaultsDomain:@"com.apple.duetexpertd" keys:v6];
}

- (id)getDisplayRecentDonations:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.duetexpertd");
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"displayRecentDonations", @"com.apple.duetexpertd", 0) != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)setWidgetKitDeveloperModeEnabled:(id)a3 specifier:(id)a4
{
  CFPreferencesSetAppValue(@"widgetKitDeveloperModeEnabled", a3, @"com.apple.duetexpertd");
  CFPreferencesAppSynchronize(@"com.apple.duetexpertd");
  unsigned int v4 = objc_opt_new();
  CFStringRef v7 = @"widgetKitDeveloperModeEnabled";
  uint64_t v5 = +[NSArray arrayWithObjects:&v7 count:1];
  CFStringRef v6 = +[NSSet setWithArray:v5];
  [v4 synchronizeUserDefaultsDomain:@"com.apple.duetexpertd" keys:v6];
}

- (id)getWidgetKitDeveloperModeEnabled:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.duetexpertd");
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"widgetKitDeveloperModeEnabled", @"com.apple.duetexpertd", 0) != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)syncRecentDonations:(id)a3
{
  CFPreferencesSetAppValue(@"lastRequestedDeveloperDonationSyncDate", +[NSDate date], @"com.apple.duetexpertd");
  CFPreferencesAppSynchronize(@"com.apple.duetexpertd");
  BOOL v3 = objc_opt_new();
  CFStringRef v6 = @"lastRequestedDeveloperDonationSyncDate";
  unsigned int v4 = +[NSArray arrayWithObjects:&v6 count:1];
  uint64_t v5 = +[NSSet setWithArray:v4];
  [v3 synchronizeUserDefaultsDomain:@"com.apple.duetexpertd" keys:v5];
}

- (void)clearAppClipsCaches:(id)a3
{
  id v3 = objc_alloc_init((Class)BCSBusinessQueryService);
  [v3 clearCachesForType:2 completion:&stru_35310];
  SFKillProcessNamed();
}

- (void)setCredentialExchangeEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.AuthenticationServices.Developer"];
  id v5 = [v4 BOOLValue];

  [v6 setBool:v5 forKey:@"CredentialExchangeEnabled"];
}

- (id)getCredentialExchangeEnabled:(id)a3
{
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.AuthenticationServices.Developer"];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 BOOLForKey:@"CredentialExchangeEnabled"]);

  return v4;
}

- (void)setShowBTCarAudioOutput:(id)a3 specifier:(id)a4
{
  id value = a3;
  if ([value isEqualToNumber:&off_38310]) {
    CFPreferencesSetAppValue(@"preferredOutputRoute_v2", @"HFP", @"com.apple.siri.CarBluetooth");
  }
  CFPreferencesSetAppValue(@"showBTAudioRouteSetting", value, @"com.apple.siri.CarBluetooth");
  CFPreferencesAppSynchronize(@"com.apple.siri.CarBluetooth");
}

- (id)getShowBTCarAudioOutput:(id)a3
{
  CFPreferencesAppSynchronize(@"com.apple.siri.CarBluetooth");
  BOOL v3 = CFPreferencesGetAppBooleanValue(@"showBTAudioRouteSetting", @"com.apple.siri.CarBluetooth", 0) != 0;

  return +[NSNumber numberWithBool:v3];
}

- (void)_manageSandboxAccount:(id)a3
{
  BOOL v3 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeAppStoreSandbox];
  long long v19 = objc_msgSend(v3, "ams_activeiTunesAccount");

  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"SANDBOX_APPLE_ACCOUNT" value:&stru_35910 table:@"DTSettings"];
  id v6 = [v19 username];
  CFStringRef v7 = +[UIAlertController alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  char v8 = +[NSBundle bundleForClass:objc_opt_class()];
  double v9 = [v8 localizedStringForKey:@"MANAGE_ACCOUNT" value:&stru_35910 table:@"DTSettings"];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1EA78;
  v21[3] = &unk_35010;
  v21[4] = self;
  double v10 = +[UIAlertAction actionWithTitle:v9 style:0 handler:v21];

  [v7 addAction:v10];
  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v12 = [v11 localizedStringForKey:@"SIGN_OUT" value:&stru_35910 table:@"DTSettings"];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1EE2C;
  v20[3] = &unk_35010;
  v20[4] = self;
  CFStringRef v13 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v20];

  [v7 addAction:v13];
  v14 = +[NSBundle bundleForClass:objc_opt_class()];
  v15 = [v14 localizedStringForKey:@"CANCEL" value:&stru_35910 table:@"DTSettings"];
  long long v16 = +[UIAlertAction actionWithTitle:v15 style:0 handler:0];

  [v7 addAction:v16];
  long long v17 = [v7 popoverPresentationController];
  [v17 setPermittedArrowDirections:0];
  [v17 setSourceView:0];
  [v17 _setCentersPopoverIfSourceViewNotSet:1];
  [(DTSettings *)self presentViewController:v7 animated:1 completion:0];
}

- (void)_signIntoSandboxAccount:(id)a3
{
  id v4 = a3;
  id v5 = [(DTSettings *)self firstResponder];
  [v5 resignFirstResponder];

  self->_isRunningSandboxAuthentication = 1;
  id v6 = objc_alloc_init((Class)AMSAuthenticateOptions);
  CFStringRef v7 = [v6 clientInfo];
  [v7 setAccountMediaType:AMSAccountMediaTypeAppStoreSandbox];

  id v8 = [objc_alloc((Class)AMSUIAuthenticateTask) initWithAccount:0 presentingViewController:self options:v6];
  double v9 = [v8 performAuthentication];
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1F118;
  v10[3] = &unk_35388;
  v10[4] = self;
  objc_copyWeak(&v11, &location);
  [v9 addFinishBlock:v10];
  [(DTSettings *)self _updateSandboxSpecifier:0];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_updateSandboxSpecifier:(id)a3
{
  unsigned __int8 v22 = (DTSettings *)a3;
  id v4 = +[ACAccountStore ams_sharedAccountStoreForMediaType:AMSAccountMediaTypeAppStoreSandbox];
  id v5 = objc_msgSend(v4, "ams_activeiTunesAccount");
  id v6 = v22;
  if (!v22) {
    id v6 = self;
  }
  CFStringRef v7 = [(DTSettings *)v6 specifierForID:@"SANDBOX_ACCOUNT_BUTTON"];
  if (v5)
  {
    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    double v9 = [v8 localizedStringForKey:@"APPLE_ACCOUNT_FORMAT" value:&stru_35910 table:@"DTSettings"];
    double v10 = [v5 username];
    id v11 = +[AKUsernameFormatter formattedUsernameFromUsername:v10];
    uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v11);

    [v7 setButtonAction:"_manageSandboxAccount:"];
    [v7 setName:v12];
    uint64_t v13 = PSEnabledKey;
    v14 = &__kCFBooleanTrue;
    v15 = v7;
  }
  else
  {
    long long v16 = +[MCProfileConnection sharedConnection];
    unsigned int v17 = [v16 effectiveBoolValueForSetting:MCFeatureAccountModificationAllowed];

    BOOL v19 = !self->_isRunningSandboxAuthentication && v17 != 2;
    uint64_t v12 = +[NSNumber numberWithInt:v19];
    [v7 setButtonAction:"_signIntoSandboxAccount:"];
    unsigned __int8 v20 = +[NSBundle bundleForClass:objc_opt_class()];
    v21 = [v20 localizedStringForKey:@"SIGN_IN_BUTTON" value:&stru_35910 table:@"DTSettings"];
    [v7 setName:v21];

    uint64_t v13 = PSEnabledKey;
    v15 = v7;
    v14 = v12;
  }
  [v15 setProperty:v14 forKey:v13];

  if (!v22) {
    [(DTSettings *)self reloadSpecifierID:@"SANDBOX_ACCOUNT_BUTTON"];
  }
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  double v10 = +[AMSLogConfig sharedAccountsConfig];
  if (!v10)
  {
    double v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = AMSLogKey();
    v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    uint64_t v23 = v12;
    __int16 v24 = 2114;
    id v25 = v13;
    __int16 v26 = 2114;
    uint64_t v27 = v14;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }
  id v15 = objc_alloc((Class)AMSUIAuthenticateTask);
  if (self->_sandboxNavController) {
    sandboxNavController = self->_sandboxNavController;
  }
  else {
    sandboxNavController = self;
  }
  id v17 = [v15 initWithRequest:v9 presentingViewController:sandboxNavController];

  long long v18 = [v17 performAuthentication];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1F6A0;
  v20[3] = &unk_353B0;
  id v21 = v8;
  id v19 = v8;
  [v18 addFinishBlock:v20];
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  id v6 = +[AMSLogConfig sharedAccountsConfig];
  if (!v6)
  {
    id v6 = +[AMSLogConfig sharedConfig];
  }
  CFStringRef v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = AMSLogKey();
    double v10 = NSStringFromSelector(a2);
    int v12 = 138543874;
    uint64_t v13 = v8;
    __int16 v14 = 2114;
    id v15 = v9;
    __int16 v16 = 2114;
    id v17 = v10;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@", (uint8_t *)&v12, 0x20u);
  }
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  double v10 = +[AMSLogConfig sharedAccountsConfig];
  if (!v10)
  {
    double v10 = +[AMSLogConfig sharedConfig];
  }
  id v11 = [v10 OSLogObject];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = AMSLogKey();
    __int16 v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v12;
    __int16 v22 = 2114;
    uint64_t v23 = v13;
    __int16 v24 = 2114;
    id v25 = v14;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] %{public}@", buf, 0x20u);
  }
  id v15 = [objc_alloc((Class)AMSUIAlertDialogTask) initWithRequest:v9 presentingViewController:self];

  __int16 v16 = [v15 present];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1F9CC;
  v18[3] = &unk_353D8;
  id v19 = v8;
  id v17 = v8;
  [v16 addFinishBlock:v18];
}

- (BOOL)classKitAppInstalled
{
  return self->_classKitAppInstalled;
}

- (void)setClassKitAppInstalled:(BOOL)a3
{
  self->_classKitAppInstalled = a3;
}

- (NSString)cachedNCOStatus
{
  return self->_cachedNCOStatus;
}

- (void)setCachedNCOStatus:(id)a3
{
}

- (NCOData)ncoData
{
  return self->_ncoData;
}

- (void)setNcoData:(id)a3
{
}

- (BOOL)cachedAdAttributionKitDeveloperModeEnabled
{
  return self->_cachedAdAttributionKitDeveloperModeEnabled;
}

- (void)setCachedAdAttributionKitDeveloperModeEnabled:(BOOL)a3
{
  self->_cachedAdAttributionKitDeveloperModeEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ncoData, 0);
  objc_storeStrong((id *)&self->_cachedNCOStatus, 0);
  objc_storeStrong((id *)&self->_sandboxNavController, 0);

  objc_storeStrong((id *)&self->_mediaServiceSpecifiers, 0);
}

@end