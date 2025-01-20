@interface AssistantActivationController
+ (id)bundle;
- (AssistantActivationDelegate)delegate;
- (BOOL)_isHeySiriAlwaysOn;
- (BOOL)_isVoiceTriggerEnabled;
- (id)_localizeTriggerString:(id)a3;
- (id)_updateAndGetCheckedSpecifier;
- (id)footerVariant;
- (id)hardwareButtonTrigger:(id)a3;
- (id)specifiers;
- (id)typeToSiriTrigger:(id)a3;
- (id)voiceActivation:(id)a3;
- (void)_refreshFootersForSpecifiers;
- (void)_updateAndGetCheckedSpecifier;
- (void)_updateSelectedPhrase;
- (void)_updateSpecifiersFromPreferences;
- (void)preferencesDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHardwareButtonTrigger:(id)a3 forSpecifier:(id)a4;
- (void)setTypeToSiriTrigger:(id)a3 forSpecifier:(id)a4;
- (void)setVoiceActivation:(id)a3 forSpecifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AssistantActivationController

+ (id)bundle
{
  v2 = (void *)bundle_sAssistantBundle_0;
  if (!bundle_sAssistantBundle_0)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)bundle_sAssistantBundle_0;
    bundle_sAssistantBundle_0 = v3;

    v2 = (void *)bundle_sAssistantBundle_0;
  }

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(AssistantActivationController *)self _updateSelectedPhrase];
  v8.receiver = self;
  v8.super_class = (Class)AssistantActivationController;
  [(AssistantActivationController *)&v8 viewWillAppear:v3];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v5 = (void *)getVTUIEnrollTrainingViewControllerClass_softClass;
  uint64_t v13 = getVTUIEnrollTrainingViewControllerClass_softClass;
  if (!getVTUIEnrollTrainingViewControllerClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getVTUIEnrollTrainingViewControllerClass_block_invoke;
    v9[3] = &unk_26457D098;
    v9[4] = &v10;
    __getVTUIEnrollTrainingViewControllerClass_block_invoke((uint64_t)v9);
    v5 = (void *)v11[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v10, 8);
  v7 = objc_opt_new();
  [v7 prewarm];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v26[2] = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_preferencesDidChange_ name:*MEMORY[0x263F28318] object:0];

  v25.receiver = self;
  v25.super_class = (Class)AssistantActivationController;
  [(AssistantActivationController *)&v25 viewDidAppear:v3];
  v24 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Siri/ACTIVATION_COMPACT_ID"];
  id v6 = objc_alloc(MEMORY[0x263F08DB0]);
  v7 = [MEMORY[0x263EFF960] currentLocale];
  objc_super v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 bundleURL];
  uint64_t v10 = (void *)[v6 initWithKey:@"Listen for" table:0 locale:v7 bundleURL:v9];

  v11 = +[GMEligibilityProvider shared];
  LODWORD(v8) = [v11 deviceSupported];

  if (v8) {
    uint64_t v12 = @"Apple Intelligence & Siri";
  }
  else {
    uint64_t v12 = @"Siri";
  }
  id v13 = objc_alloc(MEMORY[0x263F08DB0]);
  v14 = [MEMORY[0x263EFF960] currentLocale];
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 bundleURL];
  v17 = (void *)[v13 initWithKey:v12 table:0 locale:v14 bundleURL:v16];

  id v18 = objc_alloc(MEMORY[0x263F08DB0]);
  v19 = [MEMORY[0x263EFF960] currentLocale];
  v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v21 = [v20 bundleURL];
  v22 = (void *)[v18 initWithKey:@"Listen For" table:0 locale:v19 bundleURL:v21];

  v26[0] = v17;
  v26[1] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  [(AssistantActivationController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.siri" title:v10 localizedNavigationComponents:v23 deepLink:v24];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AssistantActivationController;
  [(AssistantActivationController *)&v5 viewDidDisappear:a3];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F28318] object:0];
}

- (void)preferencesDidChange:(id)a3
{
  [(AssistantActivationController *)self reloadSpecifierID:@"ACTIVATION_COMPACT_ID"];
  [(AssistantActivationController *)self reloadSpecifier:self->_groupSpecifier];
  [(AssistantActivationController *)self reloadSpecifier:self->_voiceActivationHSAndCompactSpecifier];
  [(AssistantActivationController *)self reloadSpecifier:self->_voiceActivationHSSpecifier];
  [(AssistantActivationController *)self reloadSpecifier:self->_voiceActivationOffSpecifier];
  [(AssistantActivationController *)self reloadSpecifier:self->_talkToSiriGroup];
  [(AssistantActivationController *)self reloadSpecifier:self->_typeToSiriGroup];
  [(AssistantActivationController *)self _updateSpecifiersFromPreferences];

  [(AssistantActivationController *)self _refreshFootersForSpecifiers];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = [(AssistantActivationController *)self loadSpecifiersFromPlistName:@"AssistantActivation" target:self];
    id v6 = [v5 specifierForID:@"ACTIVATION_PHRASE_GROUP_ID"];
    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = v6;

    objc_super v8 = [v5 specifierForID:@"ACTIVATION_PHRASE_HS_ID"];
    voiceActivationHSSpecifier = self->_voiceActivationHSSpecifier;
    self->_voiceActivationHSSpecifier = v8;

    uint64_t v10 = self->_voiceActivationHSSpecifier;
    v11 = [(AssistantActivationController *)self _localizeTriggerString:@"ACTIVATION_PHRASE_HS_TITLE"];
    [(PSSpecifier *)v10 setName:v11];

    uint64_t v12 = [v5 specifierForID:@"ACTIVATION_PHRASE_COMPACT_ID"];
    voiceActivationHSAndCompactSpecifier = self->_voiceActivationHSAndCompactSpecifier;
    self->_voiceActivationHSAndCompactSpecifier = v12;

    v14 = self->_voiceActivationHSAndCompactSpecifier;
    v15 = [(AssistantActivationController *)self _localizeTriggerString:@"ACTIVATION_PHRASE_COMPACT_TITLE"];
    [(PSSpecifier *)v14 setName:v15];

    v16 = [v5 specifierForID:@"ACTIVATION_PHRASE_OFF_ID"];
    voiceActivationOffSpecifier = self->_voiceActivationOffSpecifier;
    self->_voiceActivationOffSpecifier = v16;

    id v18 = self->_voiceActivationOffSpecifier;
    v19 = [(AssistantActivationController *)self _localizeTriggerString:@"ACTIVATION_PHRASE_OFF_TITLE"];
    [(PSSpecifier *)v18 setName:v19];

    v20 = (PSConfirmationSpecifier *)objc_alloc_init(MEMORY[0x263F5FB40]);
    confirmationSpecifier = self->_confirmationSpecifier;
    self->_confirmationSpecifier = v20;

    [(PSConfirmationSpecifier *)self->_confirmationSpecifier setName:@"ACTIVATION_CONFIRMATION"];
    [(PSConfirmationSpecifier *)self->_confirmationSpecifier setupWithDictionary:&unk_26D2B3A88];
    v22 = [v5 specifierForID:@"ACTIVATION_LONG_PRESS_GROUP_ID"];
    talkToSiriGroup = self->_talkToSiriGroup;
    self->_talkToSiriGroup = v22;

    v24 = [v5 specifierForID:@"ACTIVATION_LONG_PRESS_ID"];
    [v24 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    if (MGGetSInt32Answer() == 2)
    {
      objc_super v25 = [MEMORY[0x263F82670] currentDevice];
      int v26 = objc_msgSend(v25, "sf_isiPad");

      v27 = +[AssistantController bundle];
      v28 = v27;
      v29 = @"ASSISTANT_HARDWARE_BUTTON_SLEEPWAKE";
      if (v26) {
        v30 = @"AssistantSettings-j3xx";
      }
      else {
        v30 = @"AssistantSettings-D22";
      }
    }
    else
    {
      v27 = +[AssistantController bundle];
      v28 = v27;
      v29 = @"ASSISTANT_HARDWARE_BUTTON";
      v30 = @"AssistantSettings";
    }
    v31 = [v27 localizedStringForKey:v29 value:&stru_26D2AB140 table:v30];
    [v24 setName:v31];

    v32 = [v5 specifierForID:@"ACTIVATION_DOUBLE_TAP_GROUP_ID"];
    typeToSiriGroup = self->_typeToSiriGroup;
    self->_typeToSiriGroup = v32;

    v34 = [v5 specifierForID:@"ACTIVATION_DOUBLE_TAP_ID"];
    typeToSiriSpecifier = self->_typeToSiriSpecifier;
    self->_typeToSiriSpecifier = v34;

    v36 = +[GMEligibilityProvider shared];
    int v37 = [v36 activeEnabled];

    if (+[AssistantUtilities deviceIsVision] || !v37)
    {
      v38 = +[AssistantActivationController bundle];
      v39 = [v38 localizedStringForKey:@"ACTIVATION_COMPACT_TITLE_ALT" value:&stru_26D2AB140 table:@"AssistantActivation"];
      [(AssistantActivationController *)self setTitle:v39];

      [v5 removeObject:self->_typeToSiriGroup];
      [v5 removeObject:self->_typeToSiriSpecifier];
    }
    if (+[AssistantUtilities deviceIsVision])
    {
      v40 = [v5 specifierForID:@"ACTIVATION_LONG_PRESS_ID"];
      [v5 removeObject:v40];
    }
    if (!+[AssistantUtilities shouldShowCompactVoiceTriggerSpecifier](AssistantUtilities, "shouldShowCompactVoiceTriggerSpecifier"))[v5 removeObject:self->_voiceActivationHSAndCompactSpecifier]; {
    v41 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    }
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    [(AssistantActivationController *)self _updateSpecifiersFromPreferences];
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)_updateSelectedPhrase
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[AssistantActivationController _updateSelectedPhrase]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_220C23000, a2, OS_LOG_TYPE_ERROR, "%s Error updating preferred voice trigger phrase: %@", (uint8_t *)&v2, 0x16u);
}

- (id)_updateAndGetCheckedSpecifier
{
  [(AssistantActivationController *)self _updateSelectedPhrase];
  unint64_t selectedPhrase = self->_selectedPhrase;
  if (selectedPhrase != 10)
  {
    if (selectedPhrase == 1)
    {
      __int16 v4 = &OBJC_IVAR___AssistantActivationController__voiceActivationHSAndCompactSpecifier;
      goto LABEL_9;
    }
    if (!selectedPhrase)
    {
      __int16 v4 = &OBJC_IVAR___AssistantActivationController__voiceActivationHSSpecifier;
      goto LABEL_9;
    }
    uint64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      [(AssistantActivationController *)(uint64_t *)&self->_selectedPhrase _updateAndGetCheckedSpecifier];
    }
  }
  __int16 v4 = &OBJC_IVAR___AssistantActivationController__voiceActivationOffSpecifier;
LABEL_9:
  uint64_t v6 = *(Class *)((char *)&self->super.super.super.super.super.isa + *v4);

  return v6;
}

- (void)_updateSpecifiersFromPreferences
{
  id v3 = [(AssistantActivationController *)self _updateAndGetCheckedSpecifier];
  [(PSSpecifier *)self->_groupSpecifier setProperty:v3 forKey:*MEMORY[0x263F60200]];
  [(AssistantActivationController *)self _refreshFootersForSpecifiers];
}

- (id)footerVariant
{
  if (+[AssistantUtilities deviceIsiPhone]) {
    return @"IPHONE";
  }
  if (+[AssistantUtilities deviceIsVision]) {
    return @"VISION";
  }
  return @"IPAD";
}

- (void)_refreshFootersForSpecifiers
{
  v21 = [(AssistantActivationController *)self _updateAndGetCheckedSpecifier];
  if (![(AssistantActivationController *)self _isVoiceTriggerEnabled])
  {
    id v4 = [(AssistantActivationController *)self footerVariant];
    uint64_t v5 = @"ACTIVATION_PHRASE_COMPACT_OFF_FOOTER_TEXT_";
LABEL_6:
    uint64_t v6 = [(__CFString *)v5 stringByAppendingString:v4];
    uint64_t v7 = [(AssistantActivationController *)self _localizeTriggerString:v6];
    goto LABEL_7;
  }
  if (v21 != self->_voiceActivationHSAndCompactSpecifier)
  {
    if (v21 != self->_voiceActivationHSSpecifier)
    {
      id v3 = 0;
      goto LABEL_9;
    }
    id v4 = [(AssistantActivationController *)self footerVariant];
    uint64_t v5 = @"ACTIVATION_PHRASE_HS_FOOTER_TEXT_";
    goto LABEL_6;
  }
  v19 = [(AssistantActivationController *)self footerVariant];
  v20 = [@"ACTIVATION_PHRASE_COMPACT_FOOTER_TEXT_" stringByAppendingString:v19];
  id v4 = [(AssistantActivationController *)self _localizeTriggerString:v20];

  if (+[AssistantUtilities deviceIsVision])
  {
    id v4 = v4;
    id v3 = v4;
    goto LABEL_8;
  }
  uint64_t v6 = [(AssistantActivationController *)self _localizeTriggerString:@"ACTIVATION_PHRASE_COMPACT_FOOTER_TEXT_HEADPHONES"];
  uint64_t v7 = [NSString stringWithFormat:@"%@ %@", v4, v6];
LABEL_7:
  id v3 = (void *)v7;

LABEL_8:
LABEL_9:
  uint64_t v8 = *MEMORY[0x263F600F8];
  [(PSSpecifier *)self->_groupSpecifier setProperty:v3 forKey:*MEMORY[0x263F600F8]];
  [(AssistantActivationController *)self reloadSpecifier:self->_groupSpecifier];
  v9 = +[GMEligibilityProvider shared];
  int v10 = [v9 activeEnabled];

  if (v10)
  {
    v11 = +[AssistantActivationController bundle];
    uint64_t v12 = [(AssistantActivationController *)self footerVariant];
    id v13 = [@"ACTIVATION_LONG_PRESS_FOOTER_" stringByAppendingString:v12];
    v14 = [v11 localizedStringForKey:v13 value:&stru_26D2AB140 table:@"AssistantActivation"];

    [(PSSpecifier *)self->_talkToSiriGroup setProperty:v14 forKey:v8];
    [(AssistantActivationController *)self reloadSpecifier:self->_talkToSiriGroup];
    v15 = +[AssistantActivationController bundle];
    v16 = [(AssistantActivationController *)self footerVariant];
    v17 = [@"ACTIVATION_DOUBLE_TAP_FOOTER_" stringByAppendingString:v16];
    id v18 = [v15 localizedStringForKey:v17 value:&stru_26D2AB140 table:@"AssistantActivation"];

    [(PSSpecifier *)self->_typeToSiriGroup setProperty:v18 forKey:v8];
    [(AssistantActivationController *)self reloadSpecifier:self->_typeToSiriGroup];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v16.receiver = self;
  v16.super_class = (Class)AssistantActivationController;
  id v6 = a4;
  [(AssistantActivationController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[AssistantActivationController indexForIndexPath:](self, "indexForIndexPath:", v6, v16.receiver, v16.super_class);

  uint64_t v8 = [(AssistantActivationController *)self specifierAtIndex:v7];
  v9 = v8;
  if (v8 == self->_voiceActivationHSAndCompactSpecifier)
  {
    uint64_t v11 = 1;
  }
  else
  {
    if (v8 != self->_voiceActivationHSSpecifier)
    {
      uint64_t v10 = 0;
      goto LABEL_9;
    }
    uint64_t v11 = 0;
  }
  uint64_t v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v18 = "-[AssistantActivationController tableView:didSelectRowAtIndexPath:]";
    __int16 v19 = 2048;
    uint64_t v20 = v11;
    _os_log_impl(&dword_220C23000, v12, OS_LOG_TYPE_DEFAULT, "%s Setting preferred voice trigger phrase: %lu", buf, 0x16u);
  }
  id v13 = [MEMORY[0x263F85AF0] sharedPreferences];
  id v14 = (id)[v13 setUserPreferredVoiceTriggerPhraseType:v11 sender:self deviceType:0 endpointId:0];

  uint64_t v10 = 1;
LABEL_9:
  v15 = [NSNumber numberWithBool:v10];
  [(AssistantActivationController *)self setVoiceActivation:v15 forSpecifier:self->_confirmationSpecifier];

  [(AssistantActivationController *)self _updateSpecifiersFromPreferences];
  [(AssistantActivationController *)self preferencesDidChange:0];
}

- (id)_localizeTriggerString:(id)a3
{
  id v3 = (void *)MEMORY[0x263F85AF0];
  id v4 = a3;
  uint64_t v5 = [v3 sharedPreferences];
  id v6 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v7 = [v6 languageCode];
  uint64_t v8 = [v5 localizedTriggerPhraseForLanguageCode:v7];

  v9 = [v8 stringByReplacingOccurrencesOfString:@" " withString:@" "];
  uint64_t v10 = NSString;
  uint64_t v11 = +[AssistantActivationController bundle];
  uint64_t v12 = [v11 localizedStringForKey:v4 value:&stru_26D2AB140 table:@"AssistantActivation"];

  id v13 = objc_msgSend(v10, "stringWithFormat:", v12, v9);

  return v13;
}

- (id)voiceActivation:(id)a3
{
  id v3 = NSNumber;
  BOOL v4 = [(AssistantActivationController *)self _isVoiceTriggerEnabled];

  return (id)[v3 numberWithBool:v4];
}

- (void)setVoiceActivation:(id)a3 forSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  uint64_t v8 = [(AssistantActivationController *)self delegate];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __65__AssistantActivationController_setVoiceActivation_forSpecifier___block_invoke;
  v9[3] = &unk_26457CF60;
  objc_copyWeak(&v10, &location);
  [v8 setVoiceActivation:v6 forSpecifier:v7 withTrainingCompletionIfNecessary:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __65__AssistantActivationController_setVoiceActivation_forSpecifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained preferencesDidChange:0];
    id WeakRetained = v2;
  }
}

- (BOOL)_isHeySiriAlwaysOn
{
  return MEMORY[0x270F95FB8](@"U+73bmG4kBGj6kpreQXUTQ", a2);
}

- (BOOL)_isVoiceTriggerEnabled
{
  id v2 = [MEMORY[0x263F85AF0] sharedPreferences];
  char v3 = [v2 voiceTriggerEnabled];

  return v3;
}

- (id)hardwareButtonTrigger:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AssistantActivationController *)self delegate];
  id v6 = [v5 hardwareButtonTrigger:v4];

  return v6;
}

- (void)setHardwareButtonTrigger:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AssistantActivationController *)self delegate];
  [v8 setHardwareButtonTrigger:v7 forSpecifier:v6];
}

- (id)typeToSiriTrigger:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AssistantActivationController *)self delegate];
  id v6 = [v5 typeToSiriTrigger:v4];

  return v6;
}

- (void)setTypeToSiriTrigger:(id)a3 forSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AssistantActivationController *)self delegate];
  [v8 setTypeToSiriTrigger:v7 forSpecifier:v6];
}

- (AssistantActivationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AssistantActivationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_confirmationSpecifier, 0);
  objc_storeStrong((id *)&self->_typeToSiriSpecifier, 0);
  objc_storeStrong((id *)&self->_typeToSiriGroup, 0);
  objc_storeStrong((id *)&self->_talkToSiriGroup, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceActivationHSAndCompactSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceActivationHSSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceActivationOffSpecifier, 0);

  objc_storeStrong((id *)&self->_currentSiriActivationSpecifier, 0);
}

- (void)_updateAndGetCheckedSpecifier
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 136315394;
  id v4 = "-[AssistantActivationController _updateAndGetCheckedSpecifier]";
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_error_impl(&dword_220C23000, a2, OS_LOG_TYPE_ERROR, "%s Error updating preferred voice trigger phrase specifier, unknown phrase type: %lu", (uint8_t *)&v3, 0x16u);
}

@end