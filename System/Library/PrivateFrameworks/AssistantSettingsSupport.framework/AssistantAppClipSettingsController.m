@interface AssistantAppClipSettingsController
+ (id)bundle;
- (AssistantAppClipSettingsController)init;
- (id)learnFromAppClipsEnabled:(id)a3;
- (id)showInSearchEnabled:(id)a3;
- (id)specifiers;
- (id)suggestAppClipsEnabled:(id)a3;
- (void)setLearnFromAppClipsEnabled:(id)a3 specifier:(id)a4;
- (void)setShowInSearchEnabled:(id)a3 specifier:(id)a4;
- (void)setSuggestAppClipsEnabled:(id)a3 specifier:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AssistantAppClipSettingsController

+ (id)bundle
{
  v2 = (void *)bundle_sAssistantBundle_2;
  if (!bundle_sAssistantBundle_2)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)bundle_sAssistantBundle_2;
    bundle_sAssistantBundle_2 = v3;

    v2 = (void *)bundle_sAssistantBundle_2;
  }

  return v2;
}

- (AssistantAppClipSettingsController)init
{
  v3.receiver = self;
  v3.super_class = (Class)AssistantAppClipSettingsController;
  return [(AssistantAppClipSettingsController *)&v3 init];
}

- (void)viewWillAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)AssistantAppClipSettingsController;
  [(AssistantAppClipSettingsController *)&v3 viewWillAppear:a3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)AssistantAppClipSettingsController;
  [(AssistantAppClipSettingsController *)&v5 viewDidLoad];
  objc_super v3 = [(id)objc_opt_class() bundle];
  v4 = [v3 localizedStringForKey:@"APP_CLIPS" value:&stru_26D2AB140 table:@"AssistantSettings"];
  [(AssistantAppClipSettingsController *)self setTitle:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v25[2] = *MEMORY[0x263EF8340];
  v24.receiver = self;
  v24.super_class = (Class)AssistantAppClipSettingsController;
  [(AssistantAppClipSettingsController *)&v24 viewDidAppear:a3];
  v23 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Siri/ASSISTANT_APP_CLIPS_SETTINGS_ID"];
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
  v16 = (void *)[v12 initWithKey:@"App Clips" table:0 locale:v13 bundleURL:v15];

  id v17 = objc_alloc(MEMORY[0x263F08DB0]);
  v18 = [MEMORY[0x263EFF960] currentLocale];
  v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v20 = [v19 bundleURL];
  v21 = (void *)[v17 initWithKey:v6 table:0 locale:v18 bundleURL:v20];

  v25[0] = v11;
  v25[1] = v16;
  v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:2];
  [(AssistantAppClipSettingsController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.siri" title:v21 localizedNavigationComponents:v22 deepLink:v23];
}

- (id)specifiers
{
  v39[5] = *MEMORY[0x263EF8340];
  if (!self->_appClipsSuggestionsController)
  {
    objc_super v3 = [MEMORY[0x263F28798] sharedController];
    appClipsSuggestionsController = self->_appClipsSuggestionsController;
    self->_appClipsSuggestionsController = v3;
  }
  int v5 = (void *)MEMORY[0x263F5FC40];
  v6 = [(id)objc_opt_class() bundle];
  id v7 = [v6 localizedStringForKey:@"APP_CLIPS_IN_APP_CLIPS_HEADER" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v38 = [v5 groupSpecifierWithName:v7];

  v8 = [(id)objc_opt_class() bundle];
  v9 = [v8 localizedStringForKey:@"APP_CLIPS_IN_APP_CLIPS_FOOTER" value:&stru_26D2AB140 table:@"AssistantSettings"];
  uint64_t v10 = *MEMORY[0x263F600F8];
  [v38 setObject:v9 forKeyedSubscript:*MEMORY[0x263F600F8]];

  v11 = (void *)MEMORY[0x263F5FC40];
  id v12 = [(id)objc_opt_class() bundle];
  v13 = [v12 localizedStringForKey:@"APP_CLIPS_LEARN_FROM_APP_CLIPS" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v36 = [v11 preferenceSpecifierNamed:v13 target:self set:sel_setLearnFromAppClipsEnabled_specifier_ get:sel_learnFromAppClipsEnabled_ detail:0 cell:6 edit:0];

  uint64_t v14 = *MEMORY[0x263F5FEF8];
  uint64_t v15 = MEMORY[0x263EFFA88];
  [v36 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  uint64_t v16 = *MEMORY[0x263F600A8];
  [v36 setProperty:v15 forKey:*MEMORY[0x263F600A8]];
  id v17 = (void *)MEMORY[0x263F5FC40];
  v18 = [(id)objc_opt_class() bundle];
  v19 = [v18 localizedStringForKey:@"SIRIANDSEARCH_PERAPP_ONHOMESCREEN_HEADER" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v37 = [v17 groupSpecifierWithName:v19];

  v20 = [(id)objc_opt_class() bundle];
  v21 = [v20 localizedStringForKey:@"APP_CLIPS_IN_SEARCH_FOOTER" value:&stru_26D2AB140 table:@"AssistantSettings"];
  [v37 setObject:v21 forKeyedSubscript:v10];

  v22 = (void *)MEMORY[0x263F5FC40];
  v23 = [(id)objc_opt_class() bundle];
  objc_super v24 = [v23 localizedStringForKey:@"APP_CLIPS_SHOW_IN_SEARCH" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v25 = [v22 preferenceSpecifierNamed:v24 target:self set:sel_setShowInSearchEnabled_specifier_ get:sel_showInSearchEnabled_ detail:0 cell:6 edit:0];

  uint64_t v26 = MEMORY[0x263EFFA88];
  [v25 setProperty:MEMORY[0x263EFFA88] forKey:v14];
  [v25 setProperty:v26 forKey:v16];
  v27 = (void *)MEMORY[0x263F5FC40];
  v28 = [(id)objc_opt_class() bundle];
  v29 = [v28 localizedStringForKey:@"APP_CLIPS_SUGGEST_APP_CLIPS" value:&stru_26D2AB140 table:@"AssistantSettings"];
  v30 = [v27 preferenceSpecifierNamed:v29 target:self set:sel_setSuggestAppClipsEnabled_specifier_ get:sel_suggestAppClipsEnabled_ detail:0 cell:6 edit:0];

  [v30 setProperty:v26 forKey:v14];
  [v30 setProperty:v26 forKey:v16];
  v39[0] = v38;
  v39[1] = v36;
  v39[2] = v37;
  v39[3] = v25;
  v39[4] = v30;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:5];
  uint64_t v32 = (int)*MEMORY[0x263F5FDB8];
  v33 = *(Class *)((char *)&self->super.super.super.super.super.isa + v32);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v32) = v31;

  id v34 = *(id *)((char *)&self->super.super.super.super.super.isa + v32);
  return v34;
}

- (void)setLearnFromAppClipsEnabled:(id)a3 specifier:(id)a4
{
  appClipsSuggestionsController = self->_appClipsSuggestionsController;
  uint64_t v5 = [a3 BOOLValue];

  [(ASFAppClipsSuggestionsController *)appClipsSuggestionsController setLearnFromAppClipsEnabled:v5];
}

- (id)learnFromAppClipsEnabled:(id)a3
{
  objc_super v3 = NSNumber;
  uint64_t v4 = [(ASFAppClipsSuggestionsController *)self->_appClipsSuggestionsController learnFromAppClipsEnabled];

  return (id)[v3 numberWithBool:v4];
}

- (void)setShowInSearchEnabled:(id)a3 specifier:(id)a4
{
  appClipsSuggestionsController = self->_appClipsSuggestionsController;
  uint64_t v5 = [a3 BOOLValue];

  [(ASFAppClipsSuggestionsController *)appClipsSuggestionsController setShowInSearchEnabled:v5];
}

- (id)showInSearchEnabled:(id)a3
{
  objc_super v3 = NSNumber;
  uint64_t v4 = [(ASFAppClipsSuggestionsController *)self->_appClipsSuggestionsController showInSearchEnabled];

  return (id)[v3 numberWithBool:v4];
}

- (void)setSuggestAppClipsEnabled:(id)a3 specifier:(id)a4
{
  appClipsSuggestionsController = self->_appClipsSuggestionsController;
  uint64_t v5 = [a3 BOOLValue];

  [(ASFAppClipsSuggestionsController *)appClipsSuggestionsController setSuggestAppClipsEnabled:v5];
}

- (id)suggestAppClipsEnabled:(id)a3
{
  objc_super v3 = NSNumber;
  uint64_t v4 = [(ASFAppClipsSuggestionsController *)self->_appClipsSuggestionsController suggestAppClipsEnabled];

  return (id)[v3 numberWithBool:v4];
}

- (void).cxx_destruct
{
}

@end