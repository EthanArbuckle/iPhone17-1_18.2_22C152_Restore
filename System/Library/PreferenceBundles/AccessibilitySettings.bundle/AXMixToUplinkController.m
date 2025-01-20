@interface AXMixToUplinkController
- (id)_appSupportsUplink:(id)a3;
- (id)mixToUplink:(id)a3;
- (id)specifiers;
- (void)_generateAppSpecifiers;
- (void)_setAppSupportsUplink:(id)a3 specifier:(id)a4;
- (void)setMixToUplink:(id)a3 specifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation AXMixToUplinkController

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->super.AXUISettingsListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = [objc_allocWithZone((Class)NSMutableArray) init];
    v6 = +[PSSpecifier emptyGroupSpecifier];
    v7 = settingsLocString(@"MIX_TO_UPLINK_FOOTER", @"Accessibility");
    [v6 setProperty:v7 forKey:PSFooterTextGroupKey];

    [v5 addObject:v6];
    v8 = settingsLocString(@"MIX_TO_UPLINK_SUB_TITLE", @"Accessibility");
    v9 = +[PSSpecifier preferenceSpecifierNamed:v8 target:self set:"setMixToUplink:specifier:" get:"mixToUplink:" detail:objc_opt_class() cell:6 edit:0];

    [v9 setProperty:@"MIX_TO_UPLINK" forKey:PSIDKey];
    [v5 addObject:v9];
    if ([(NSMutableArray *)self->_appSpecifiers count])
    {
      v10 = settingsLocString(@"ALLOWED_APPS", @"Accessibility");
      v11 = +[PSSpecifier groupSpecifierWithName:v10];

      [v5 addObject:v11];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      v12 = self->_appSpecifiers;
      id v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          v16 = 0;
          do
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            [v5 addObject:*(void *)(*((void *)&v19 + 1) + 8 * (void)v16)];
            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v14);
      }
    }
    v17 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
    *(void *)&self->super.AXUISettingsListController_opaque[v3] = v5;

    v4 = *(void **)&self->super.AXUISettingsListController_opaque[v3];
  }

  return v4;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)AXMixToUplinkController;
  [(AXMixToUplinkController *)&v8 viewDidLoad];
  AXPerformBlockAsynchronouslyOnMainThread();
  TCCAccessCopyBundleIdentifiersForService();
  uint64_t v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  supportedApps = self->_supportedApps;
  self->_supportedApps = v3;

  TCCAccessCopyBundleIdentifiersDisabledForService();
  id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  deniedApps = self->_deniedApps;
  self->_deniedApps = v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_accessibilitySettingsChanged_1, kAXSAllowsMixToUplinkDidChangeNotification, 0, (CFNotificationSuspensionBehavior)1028);
}

id __38__AXMixToUplinkController_viewDidLoad__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _generateAppSpecifiers];
}

- (void)_generateAppSpecifiers
{
  uint64_t v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  appSpecifiers = self->_appSpecifiers;
  self->_appSpecifiers = v3;

  AXInstalledApps();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    uint64_t v27 = PSIDKey;
    uint64_t v25 = PSLazyIconAppID;
    uint64_t v24 = PSLazyIconLoading;
    uint64_t v23 = PSIconImageKey;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        deniedApps = self->_deniedApps;
        v11 = [v9 bundleIdentifier];
        if ([(NSArray *)deniedApps containsObject:v11])
        {
        }
        else
        {
          supportedApps = self->_supportedApps;
          id v13 = [v9 bundleIdentifier];
          LODWORD(supportedApps) = [(NSArray *)supportedApps containsObject:v13];

          if (!supportedApps) {
            continue;
          }
        }
        id v14 = [v9 localizedName];
        uint64_t v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:self set:"_setAppSupportsUplink:specifier:" get:"_appSupportsUplink:" detail:0 cell:6 edit:0];

        v16 = [v9 bundleIdentifier];
        [v15 setProperty:v16 forKey:v27];

        v17 = [v9 bundleIdentifier];
        [v15 setProperty:v17 forKey:@"BundleIdentifier"];

        v18 = [v9 bundleContainerURL];
        [v15 setProperty:v18 forKey:@"url"];

        long long v19 = [v9 bundleIdentifier];
        LODWORD(v14) = AXFlipsIconRightToLeftForAppID(v19);

        long long v20 = [v9 bundleIdentifier];
        long long v21 = v20;
        if (v14)
        {
          long long v22 = AXImageIconForAppID(v20);
          [v15 setProperty:v22 forKey:v23];
        }
        else
        {
          [v15 setProperty:v20 forKey:v25];

          [v15 setProperty:&__kCFBooleanTrue forKey:v24];
        }
        [(NSMutableArray *)self->_appSpecifiers addObject:v15];
      }
      id v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }
  [(AXMixToUplinkController *)self reloadSpecifiers];
}

- (id)_appSupportsUplink:(id)a3
{
  v4 = [a3 propertyForKey:@"BundleIdentifier"];
  id v5 = +[NSNumber numberWithBool:[(NSArray *)self->_supportedApps containsObject:v4]];

  return v5;
}

- (void)_setAppSupportsUplink:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = [a4 propertyForKey:@"BundleIdentifier"];
  if (v6)
  {
    [v5 BOOLValue];
    int v7 = TCCAccessSetForBundleId();
    objc_super v8 = AXLogCommon();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = +[NSNumber numberWithBool:v7 != 0];
      int v10 = 138412802;
      v11 = v6;
      __int16 v12 = 2112;
      id v13 = v5;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Setting TCC microphone for %@=%@ result=%@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)setMixToUplink:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  __AXSSetAllowsMixToUplink(v4);
}

- (id)mixToUplink:(id)a3
{
  uint64_t v3 = _AXSAllowsMixToUplink();

  return +[NSNumber numberWithUnsignedChar:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedApps, 0);
  objc_storeStrong((id *)&self->_supportedApps, 0);

  objc_storeStrong((id *)&self->_appSpecifiers, 0);
}

@end