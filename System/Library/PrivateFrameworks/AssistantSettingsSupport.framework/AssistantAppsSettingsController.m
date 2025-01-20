@interface AssistantAppsSettingsController
+ (id)bundle;
- (id)specifiers;
- (void)specifiers;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AssistantAppsSettingsController

+ (id)bundle
{
  v2 = (void *)bundle_sAssistantBundle_5;
  if (!bundle_sAssistantBundle_5)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)bundle_sAssistantBundle_5;
    bundle_sAssistantBundle_5 = v3;

    v2 = (void *)bundle_sAssistantBundle_5;
  }

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AssistantAppsSettingsController;
  [(AssistantAppsSettingsController *)&v3 viewWillAppear:a3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AssistantAppsSettingsController;
  [(AssistantAppsSettingsController *)&v5 viewDidLoad];
  objc_super v3 = [(id)objc_opt_class() bundle];
  v4 = [v3 localizedStringForKey:@"APPS" value:&stru_26D2AB140 table:@"AssistantSettings"];
  [(AssistantAppsSettingsController *)self setTitle:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)AssistantAppsSettingsController;
  [(AssistantAppsSettingsController *)&v24 viewDidAppear:a3];
  v23 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Siri/ASSISTANT_APPS_SETTINGS_ID"];
  v4 = +[GMEligibilityProvider shared];
  int v5 = [v4 deviceSupported];

  if (v5) {
    v6 = @"Apple Intelligence & Siri";
  }
  else {
    v6 = @"Siri";
  }
  id v7 = objc_alloc(MEMORY[0x263F08DB0]);
  v8 = [MEMORY[0x263EFF960] currentLocale];
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 bundleURL];
  v11 = (void *)[v7 initWithKey:v6 table:0 locale:v8 bundleURL:v10];

  id v12 = objc_alloc(MEMORY[0x263F08DB0]);
  v13 = [MEMORY[0x263EFF960] currentLocale];
  v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v15 = [v14 bundleURL];
  v16 = (void *)[v12 initWithKey:@"Apps" table:0 locale:v13 bundleURL:v15];

  id v17 = objc_alloc(MEMORY[0x263F08DB0]);
  v18 = [MEMORY[0x263EFF960] currentLocale];
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = [v19 bundleURL];
  v21 = (void *)[v17 initWithKey:v6 table:0 locale:v18 bundleURL:v20];

  v25[0] = v11;
  v25[1] = v16;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  [(AssistantAppsSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.siri" title:v21 localizedNavigationComponents:v22 deepLink:v23];
}

- (id)specifiers
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v34 = self;
  if (!self->_disabledSpotlightBundles)
  {
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    v2 = (void (*)(uint64_t))getSPGetDisabledBundleSetSymbolLoc_ptr;
    v49 = getSPGetDisabledBundleSetSymbolLoc_ptr;
    if (!getSPGetDisabledBundleSetSymbolLoc_ptr)
    {
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __getSPGetDisabledBundleSetSymbolLoc_block_invoke;
      v44 = &unk_26457D098;
      v45 = &v46;
      objc_super v3 = (void *)SearchLibrary();
      v47[3] = (uint64_t)dlsym(v3, "SPGetDisabledBundleSet");
      getSPGetDisabledBundleSetSymbolLoc_ptr = *(_UNKNOWN **)(v45[1] + 24);
      v2 = (void (*)(uint64_t))v47[3];
    }
    _Block_object_dispose(&v46, 8);
    if (!v2) {
      -[AssistantAppsSettingsController specifiers]();
    }
    uint64_t v4 = v2(1);
    disabledSpotlightBundles = v34->_disabledSpotlightBundles;
    v34->_disabledSpotlightBundles = (NSMutableSet *)v4;

    self = v34;
  }
  if (!self->_disabledSpotlightDomains)
  {
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    v6 = (void (*)(uint64_t))getSPGetDisabledDomainSetSymbolLoc_ptr;
    v49 = getSPGetDisabledDomainSetSymbolLoc_ptr;
    if (!getSPGetDisabledDomainSetSymbolLoc_ptr)
    {
      uint64_t v41 = MEMORY[0x263EF8330];
      uint64_t v42 = 3221225472;
      v43 = __getSPGetDisabledDomainSetSymbolLoc_block_invoke;
      v44 = &unk_26457D098;
      v45 = &v46;
      id v7 = (void *)SearchLibrary();
      v47[3] = (uint64_t)dlsym(v7, "SPGetDisabledDomainSet");
      getSPGetDisabledDomainSetSymbolLoc_ptr = *(_UNKNOWN **)(v45[1] + 24);
      v6 = (void (*)(uint64_t))v47[3];
    }
    _Block_object_dispose(&v46, 8);
    if (!v6) {
      -[AssistantAppsSettingsController specifiers]();
    }
    uint64_t v8 = v6(1);
    disabledSpotlightDomains = v34->_disabledSpotlightDomains;
    v34->_disabledSpotlightDomains = (NSMutableSet *)v8;

    self = v34;
  }
  availableSuggestionAppsController = self->_availableSuggestionAppsController;
  if (!availableSuggestionAppsController)
  {
    uint64_t v11 = [MEMORY[0x263F287A0] sharedController];
    id v12 = v34->_availableSuggestionAppsController;
    v34->_availableSuggestionAppsController = (ASFAvailableSuggestionAppsController *)v11;

    availableSuggestionAppsController = v34->_availableSuggestionAppsController;
  }
  id obj = [(ASFAvailableSuggestionAppsController *)availableSuggestionAppsController visibleBundleIds];
  if (![(NSSet *)v34->_appSettingsBundleIDs isEqual:obj])
  {
    objc_storeStrong((id *)&v34->_appSettingsBundleIDs, obj);
    v13 = (void *)[obj mutableCopy];
    v36 = [MEMORY[0x263EFF980] array];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v35 = v13;
    uint64_t v14 = [v35 countByEnumeratingWithState:&v37 objects:v51 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v38;
      uint64_t v16 = *MEMORY[0x263F5FFE0];
      uint64_t v17 = *MEMORY[0x263F60080];
      uint64_t v18 = *MEMORY[0x263F600A8];
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v35);
          }
          uint64_t v20 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          v21 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v20];
          v22 = PSApplicationSpecifierForAssistantSection();
          if (v22)
          {
            [v22 setProperty:objc_opt_class() forKey:v16];
            [v22 setProperty:objc_opt_class() forKey:v17];
            [v22 setIdentifier:v20];
            [v22 setDetailControllerClass:objc_opt_class()];
            [v22 setProperty:MEMORY[0x263EFFA88] forKey:v18];
            [v36 addObject:v22];
          }
        }
        uint64_t v14 = [v35 countByEnumeratingWithState:&v37 objects:v51 count:16];
      }
      while (v14);
    }

    uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithArray:v36];
    allAppsSpecifiers = v34->_allAppsSpecifiers;
    v34->_allAppsSpecifiers = (NSArray *)v23;
  }
  v25 = [(NSArray *)v34->_allAppsSpecifiers sortedArrayUsingComparator:&__block_literal_global_8];
  v26 = [MEMORY[0x263F5FC40] groupSpecifierWithName:0];
  v50 = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v50 count:1];
  uint64_t v28 = [v27 arrayByAddingObjectsFromArray:v25];
  v29 = (id *)((char *)&v34->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  id v30 = *v29;
  id *v29 = (id)v28;

  id v31 = *v29;
  return v31;
}

uint64_t __45__AssistantAppsSettingsController_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 name];
  v6 = [v4 name];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableSuggestionAppsController, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightApps, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightDomains, 0);
  objc_storeStrong((id *)&self->_disabledSpotlightBundles, 0);
  objc_storeStrong((id *)&self->_allAppsSpecifiers, 0);

  objc_storeStrong((id *)&self->_appSettingsBundleIDs, 0);
}

- (void)specifiers
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSMutableSet *PSSPGetDisabledDomainSet(BOOL)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantAppsSettingsController.m", 34, @"%s", dlerror());

  __break(1u);
}

@end