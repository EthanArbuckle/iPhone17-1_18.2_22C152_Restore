@interface LiveSpeechController
- (AXSpeechSettingsModelController)speechModelController;
- (LiveSpeechController)init;
- (id)_selectedVoiceNameForVoiceSpecifier:(id)a3;
- (id)liveSpeechEnabled:(id)a3;
- (id)specifiers;
- (void)setLiveSpeechEnabled:(id)a3 specifier:(id)a4;
- (void)setSpeechModelController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation LiveSpeechController

- (LiveSpeechController)init
{
  v6.receiver = self;
  v6.super_class = (Class)LiveSpeechController;
  v2 = [(AccessibilityBridgeBaseController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(LiveSpeechSettingsModelController);
    speechModelController = v2->_speechModelController;
    v2->_speechModelController = &v3->super.super;
  }
  return v2;
}

- (id)specifiers
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]);
  if (!v3)
  {
    uint64_t v39 = (int)*MEMORY[0x263F5FDB8];
    v4 = [MEMORY[0x263EFF980] array];
    v5 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ToggleGroup" name:0];
    objc_super v6 = settingsLocString(@"LIVE_SPEECH_FOOTER", @"AccessibilitySettings");
    uint64_t v7 = *MEMORY[0x263F600F8];
    [v5 setProperty:v6 forKey:*MEMORY[0x263F600F8]];

    [v4 addObject:v5];
    v8 = (void *)MEMORY[0x263F5FC40];
    v9 = settingsLocString(@"LIVE_SPEECH_TITLE", @"AccessibilitySettings");
    v10 = [v8 preferenceSpecifierNamed:v9 target:self set:sel_setLiveSpeechEnabled_specifier_ get:sel_liveSpeechEnabled_ detail:0 cell:6 edit:0];

    [v4 addObject:v10];
    int v11 = AXDeviceSupportsLiveSpeechCategories();
    v12 = (uint64_t *)MEMORY[0x263F60138];
    v42 = self;
    if (v11)
    {
      v13 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CategoryPhrasesGroup"];

      [v4 addObject:v13];
      v14 = (void *)MEMORY[0x263F5FC40];
      v15 = settingsLocString(@"LIVE_SPEECH_PHRASES", @"AccessibilitySettings");
      v16 = [v14 preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];

      [v16 setProperty:@"LiveSpeechCategoryManagement" forKey:*v12];
    }
    else
    {
      v17 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"FavoritePhrasesGroup"];

      [v4 addObject:v17];
      v18 = (void *)MEMORY[0x263F5FC40];
      v19 = settingsLocString(@"LIVE_SPEECH_FAVORITE_PHRASES", @"AccessibilitySettings");
      v16 = [v18 preferenceSpecifierNamed:v19 target:self set:0 get:0 detail:objc_opt_class() cell:2 edit:0];
    }
    [v4 addObject:v16];
    v20 = (void *)MEMORY[0x263F5FC40];
    v21 = settingsLocString(@"LIVE_SPEECH_VOICES", @"AccessibilitySettings");
    v22 = [v20 groupSpecifierWithID:@"PreferredVoiceGroup" name:v21];

    v23 = settingsLocString(@"LIVE_SPEECH_VOICES_FOOTER", @"AccessibilitySettings");
    [v22 setProperty:v23 forKey:v7];

    [v4 addObject:v22];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v24 = [MEMORY[0x263F828C0] sharedInputModeController];
    v25 = [v24 enabledInputModeLanguages];

    id obj = v25;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v44;
      uint64_t v41 = *v12;
      uint64_t v29 = *MEMORY[0x263F600A8];
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(obj);
          }
          v31 = AFDictationLanguageForKeyboardLanguage();
          v32 = [MEMORY[0x263F228D0] sharedInstance];
          v33 = [v32 dialectForLanguageID:v31];

          v34 = [v33 languageNameAndLocaleInCurrentLocale];
          if (v34)
          {
            v35 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v34 target:v42 set:0 get:sel__selectedVoiceNameForVoiceSpecifier_ detail:0 cell:2 edit:0];

            [v35 setProperty:v31 forKey:v41];
            [v35 setProperty:MEMORY[0x263EFFA88] forKey:v29];
            [v4 addObject:v35];
            v22 = v35;
          }
        }
        uint64_t v27 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v27);
    }

    v36 = *(Class *)((char *)&v42->super.super.super.super.super.super.isa + v39);
    *(Class *)((char *)&v42->super.super.super.super.super.super.isa + v39) = (Class)v4;
    id v37 = v4;

    v3 = *(Class *)((char *)&v42->super.super.super.super.super.super.isa + v39);
  }

  return v3;
}

- (id)liveSpeechEnabled:(id)a3
{
  v3 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v4 = [v3 objectForKey:@"TripleClickOptions"];

  uint64_t v5 = [v4 containsObject:&unk_26FB00760];
  objc_super v6 = [NSNumber numberWithBool:v5];

  return v6;
}

- (void)setLiveSpeechEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x263EFF980];
  id v6 = a3;
  uint64_t v7 = [(AccessibilityBridgeBaseController *)self accessibilityDomainAccessor];
  v8 = [v7 objectForKey:@"TripleClickOptions"];
  id v9 = [v5 arrayWithArray:v8];

  LODWORD(v5) = [v6 BOOLValue];
  if (v5 && ([v9 containsObject:&unk_26FB00760] & 1) == 0) {
    [v9 addObject:&unk_26FB00760];
  }
  else {
    [v9 removeObject:&unk_26FB00760];
  }
  [(AccessibilityBridgeBaseController *)self setGizmoAccessibilityPref:v9 forKey:@"TripleClickOptions"];
}

- (id)_selectedVoiceNameForVoiceSpecifier:(id)a3
{
  v4 = [a3 propertyForKey:*MEMORY[0x263F60138]];
  uint64_t v5 = [(AXSpeechSettingsModelController *)self->_speechModelController voiceIdentifierForLiveSpeechKeyboardID:v4];
  id v6 = AXVoiceNameForVoiceId();

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 cellForRowAtIndexPath:v7];
  id v9 = [v8 specifier];
  uint64_t v10 = *MEMORY[0x263F60138];
  int v11 = [v9 propertyForKey:*MEMORY[0x263F60138]];
  int v12 = [v11 isEqual:@"LiveSpeechCategoryManagement"];

  if (v12)
  {
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v13 = (void *)getTTSVBUILoaderClass_softClass;
    uint64_t v31 = getTTSVBUILoaderClass_softClass;
    if (!getTTSVBUILoaderClass_softClass)
    {
      location[0] = (id)MEMORY[0x263EF8330];
      location[1] = (id)3221225472;
      location[2] = __getTTSVBUILoaderClass_block_invoke;
      location[3] = &unk_2651F2520;
      location[4] = &v28;
      __getTTSVBUILoaderClass_block_invoke((uint64_t)location);
      v13 = (void *)v29[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v28, 8);

    v15 = [NSClassFromString(&cfstr_Livespeechmana.isa) makeLSManagerViewController];
    [(LiveSpeechController *)self showController:v15];
  }
  else
  {
    v15 = [v9 propertyForKey:v10];
    if (v15)
    {
      id v16 = objc_alloc_init(MEMORY[0x263F22280]);
      v17 = [(LiveSpeechController *)self rootController];
      [v16 setRootController:v17];

      [v16 setSpecifier:0];
      [v16 setParentController:self];
      [v16 setShowPerVoiceSettings:0];
      v19 = [v15 stringByReplacingOccurrencesOfString:@"yue" withString:@"zh"];
      objc_msgSend(v16, "setLanguage:");
      [v16 setHideLanguageInDialect:1];
      [v16 setShowDialectInTitle:0];
      [v16 setShowDialectPicker:1];
      [v16 setShowPersonalVoices:1];
      objc_initWeak(location, self);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __58__LiveSpeechController_tableView_didSelectRowAtIndexPath___block_invoke;
      v24[3] = &unk_2651F2570;
      objc_copyWeak(&v26, location);
      id v18 = v15;
      id v25 = v18;
      [v16 setGetDialectPreferencesCallback:v24];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __58__LiveSpeechController_tableView_didSelectRowAtIndexPath___block_invoke_2;
      v21[3] = &unk_2651F2598;
      id v22 = v18;
      objc_copyWeak(&v23, location);
      [v16 setSetDialectPreferencesCallback:v21];
      [v16 setShowSpeakingRate:0];
      [(LiveSpeechController *)self showController:v16 animate:1];
      objc_destroyWeak(&v23);

      objc_destroyWeak(&v26);
      objc_destroyWeak(location);
    }
    v20.receiver = self;
    v20.super_class = (Class)LiveSpeechController;
    [(LiveSpeechController *)&v20 tableView:v6 didSelectRowAtIndexPath:v7];
  }
}

id __58__LiveSpeechController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = [WeakRetained speechModelController];
  v4 = [v3 voiceIdentifierForLiveSpeechKeyboardID:*(void *)(a1 + 32)];

  return v4;
}

void __58__LiveSpeechController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = LiveSpeechLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v9 = 138412546;
    id v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_246A39000, v4, OS_LOG_TYPE_DEFAULT, "Bridge: Will set voiceID=%@ to keyboardID=%@", (uint8_t *)&v9, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = [WeakRetained speechModelController];
  [v7 updateSelectedVoiceIdentifier:v3 forSpeechSourceKey:*MEMORY[0x263F212D0] languageCode:*(void *)(a1 + 32)];

  id v8 = objc_loadWeakRetained((id *)(a1 + 40));
  [v8 reloadSpecifiers];
}

- (AXSpeechSettingsModelController)speechModelController
{
  return self->_speechModelController;
}

- (void)setSpeechModelController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end