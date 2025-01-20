@interface CSLPRFNanoAppRegistryApplicationSource
- (CSLPRFNanoAppRegistryApplicationSource)init;
- (CSLPRFNanoAppRegistryApplicationSourceDelegate)delegate;
- (void)_appsDidChange;
- (void)allApplicationsWithCompletion:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation CSLPRFNanoAppRegistryApplicationSource

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_workspace, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CSLPRFNanoAppRegistryApplicationSourceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSLPRFNanoAppRegistryApplicationSourceDelegate *)WeakRetained;
}

- (void)_appsDidChange
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__CSLPRFNanoAppRegistryApplicationSource__appsDidChange__block_invoke;
  v2[3] = &unk_264A0B290;
  v2[4] = self;
  [(CSLPRFNanoAppRegistryApplicationSource *)self allApplicationsWithCompletion:v2];
}

void __56__CSLPRFNanoAppRegistryApplicationSource__appsDidChange__block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(*(void *)(a1 + 32) + 16);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained nanoRegistrySource:*(void *)(a1 + 32) updatedWithAllApplications:v4];
}

- (void)allApplicationsWithCompletion:(id)a3
{
  id v4 = a3;
  workspace = self->_workspace;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__CSLPRFNanoAppRegistryApplicationSource_allApplicationsWithCompletion___block_invoke;
  v7[3] = &unk_264A0AFC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(NARApplicationWorkspace *)workspace getWorkspaceInfoIncludingHiddenApps:1 completion:v7];
}

void __72__CSLPRFNanoAppRegistryApplicationSource_allApplicationsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 applications];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __72__CSLPRFNanoAppRegistryApplicationSource_allApplicationsWithCompletion___block_invoke_2;
  v6[3] = &unk_264A0AF98;
  v6[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "bs_mapNoNulls:", v6);

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
  }
}

id __72__CSLPRFNanoAppRegistryApplicationSource_allApplicationsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = v5;
  if (!v4) {
    goto LABEL_5;
  }
  int v7 = [v5 isHidden];
  id v8 = [v6 appTags];
  int v9 = [v8 containsObject:@"showInDockSettings"];

  if (v7)
  {
    if (!v9) {
      goto LABEL_5;
    }
  }
  v10 = [v6 appState];
  char v11 = [v10 isRestricted];

  if (v11)
  {
LABEL_5:
    v12 = 0;
    v13 = 0;
    v14 = v6;
LABEL_6:

    goto LABEL_7;
  }
  id v16 = [v6 applicationIdentifier];
  if (_keyFor1stPartyWatchApplicationNameWithBundleIdentifier__onceToken != -1) {
    dispatch_once(&_keyFor1stPartyWatchApplicationNameWithBundleIdentifier__onceToken, &__block_literal_global_1025);
  }
  v17 = [(id)_keyFor1stPartyWatchApplicationNameWithBundleIdentifier__bundleIDToLocalizationKeyMap objectForKey:v16];

  if (v17)
  {
    v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v18 localizedStringForKey:v17 value:&stru_26E2BF688 table:@"CompanionDockSettings"];

    v19 = [v6 localizedDisplayNames];
    if (!v12)
    {
      v20 = [MEMORY[0x263EFF960] currentLocale];
      v21 = [v20 localeIdentifier];

      v12 = [v19 objectForKeyedSubscript:v21];

      if (!v12)
      {
        v22 = [MEMORY[0x263F086E0] mainBundle];
        v23 = [v22 preferredLocalizations];
        v24 = [v23 firstObject];

        v12 = [v19 objectForKeyedSubscript:v24];

        if (!v12)
        {
          v25 = [MEMORY[0x263EFF960] currentLocale];
          v26 = [v25 languageCode];

          v12 = [v19 objectForKeyedSubscript:v26];

          if (!v12)
          {
            v12 = [v6 localizedDisplayName];
            if (!v12)
            {
              v12 = [v6 bundleName];
              if (!v12)
              {
                v27 = [v16 componentsSeparatedByString:@"."];
                v12 = [v27 lastObject];
              }
            }
          }
        }
      }
    }
  }
  else
  {
    v12 = 0;
  }

  if (v12)
  {
    v14 = [v6 applicationIdentifier];
    v13 = +[CSLPRFApp appWithBundleID:v14 name:v12 sdkVersion:@"11.0" supportsAlwaysOnDisplay:0 defaultsToPrivateAlwaysOnDisplayTreatment:0];
    goto LABEL_6;
  }
  v13 = 0;
LABEL_7:

  return v13;
}

void __98__CSLPRFNanoAppRegistryApplicationSource__keyFor1stPartyWatchApplicationNameWithBundleIdentifier___block_invoke()
{
  v0 = (void *)_keyFor1stPartyWatchApplicationNameWithBundleIdentifier__bundleIDToLocalizationKeyMap;
  _keyFor1stPartyWatchApplicationNameWithBundleIdentifier__bundleIDToLocalizationKeyMap = (uint64_t)&unk_26E2C98B8;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F574A8], 0);
  v4.receiver = self;
  v4.super_class = (Class)CSLPRFNanoAppRegistryApplicationSource;
  [(CSLPRFNanoAppRegistryApplicationSource *)&v4 dealloc];
}

- (CSLPRFNanoAppRegistryApplicationSource)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSLPRFNanoAppRegistryApplicationSource;
  v2 = [(CSLPRFNanoAppRegistryApplicationSource *)&v7 init];
  if (v2)
  {
    id v3 = (NARApplicationWorkspace *)objc_alloc_init(MEMORY[0x263F574B0]);
    workspace = v2->_workspace;
    v2->_workspace = v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)CDSNanoAppRegistryAppDataProviderAppsChanged, (CFStringRef)*MEMORY[0x263F574A8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

@end