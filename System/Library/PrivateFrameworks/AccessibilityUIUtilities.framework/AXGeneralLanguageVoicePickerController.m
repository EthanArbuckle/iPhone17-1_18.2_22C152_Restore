@interface AXGeneralLanguageVoicePickerController
- (id)specifiers;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (void)_handleUnifiedSelectedVoice:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXGeneralLanguageVoicePickerController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXGeneralLanguageVoicePickerController;
  [(AXGeneralLanguageVoicePickerController *)&v4 viewWillAppear:a3];
  [*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92F10]) reloadData];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(AXLanguageSpeechBaseController *)self specifiersForLanguagesAndAccents];
    v6 = (void *)[v5 mutableCopy];

    if (UIAccessibilityIsVoiceOverRunning())
    {
      v7 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
      v8 = AXUILocalizedStringForKey(@"VoiceOverVoiceSelectionHint");
      [v7 setProperty:v8 forKey:*MEMORY[0x1E4F93170]];

      [v6 insertObject:v7 atIndex:0];
    }
    v9 = (objc_class *)[v6 copy];
    v10 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = v9;

    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = [a3 cellForRowAtIndexPath:a4];
  v5 = [v6 specifier];
  [(AXGeneralLanguageVoicePickerController *)self _handleUnifiedSelectedVoice:v5];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)_handleUnifiedSelectedVoice:(id)a3
{
  id v4 = a3;
  v5 = [v4 propertyForKey:*MEMORY[0x1E4F93188]];
  id v6 = objc_alloc_init(AXSettingsPrimaryResourceDownloadController);
  [(AXSettingsPrimaryResourceDownloadController *)v6 setShowNeural:1];
  v7 = [(AXGeneralLanguageVoicePickerController *)self rootController];
  [(AXSettingsPrimaryResourceDownloadController *)v6 setRootController:v7];

  [(AXSettingsPrimaryResourceDownloadController *)v6 setSpecifier:0];
  [(AXSettingsPrimaryResourceDownloadController *)v6 setParentController:self];
  [(AXSettingsPrimaryResourceDownloadController *)v6 setLanguage:v5];
  v8 = [(AXLanguageSpeechBaseController *)self speechModelController];
  [(AXSettingsResourceDownloadController *)v6 setSpeechModelController:v8];

  v9 = [MEMORY[0x1E4F49458] sharedInstance];
  [v9 quickSpeakSpeakingRateForLanguage:v5];
  float v11 = v10;

  double v12 = fabs(v11 + -3.40282347e38);
  if (v12 < 0.001)
  {
    v13 = [MEMORY[0x1E4F49458] sharedInstance];
    [v13 quickSpeakSpeakingRate];
    float v11 = v14;
  }
  *(float *)&double v12 = v11;
  [(AXSettingsPrimaryResourceDownloadController *)v6 setSpeakingRate:v12];
  v15 = [MEMORY[0x1E4F49440] sharedInstance];
  v16 = [v15 systemLanguageID];
  v17 = AXCLanguageCanonicalFormToGeneralLanguage();

  -[AXSettingsPrimaryResourceDownloadController setShowSpeakingRate:](v6, "setShowSpeakingRate:", [v17 isEqualToString:v5] ^ 1);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke;
  v33[3] = &unk_1E649CBB8;
  id v18 = v5;
  id v34 = v18;
  [(AXSettingsPrimaryResourceDownloadController *)v6 setSetSpeakingRateCallback:v33];
  [(AXSettingsPrimaryResourceDownloadController *)v6 setShowDialectPicker:1];
  objc_initWeak(&location, self);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_2;
  v28[3] = &unk_1E649CBE0;
  objc_copyWeak(&v31, &location);
  v28[4] = self;
  id v19 = v18;
  id v29 = v19;
  id v20 = v4;
  id v30 = v20;
  [(AXSettingsResourceDownloadController *)v6 setSetDialectPreferencesCallback:v28];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_3;
  v25[3] = &unk_1E649CC08;
  objc_copyWeak(&v27, &location);
  v25[4] = self;
  id v21 = v19;
  id v26 = v21;
  [(AXSettingsResourceDownloadController *)v6 setGetDialectPreferencesCallback:v25];
  v22 = [(AXLanguageSpeechBaseController *)self speechSourceKey];
  [(AXSettingsResourceDownloadController *)v6 setSpeechSourceKey:v22];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_4;
  v24[3] = &unk_1E649CC30;
  v24[4] = self;
  [(AXSettingsResourceDownloadController *)v6 setGetPerVoiceSettingsCallack:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_5;
  v23[3] = &unk_1E649CC58;
  v23[4] = self;
  [(AXSettingsResourceDownloadController *)v6 setSetPerVoiceSettingsCallack:v23];
  [(AXUISettingsSetupCapableListController *)self showController:v6 animate:1];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

void __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke(uint64_t a1, float a2)
{
  id v20 = (id)_AXSQuickSpeakCopyPreferredLocalesForLanguages();
  id v4 = [v20 objectForKey:*(void *)(a1 + 32)];
  if (!v4)
  {
    id v4 = AXCLanguageConvertToCanonicalForm();
  }
  v5 = [MEMORY[0x1E4F49458] sharedInstance];
  *(float *)&double v6 = a2;
  [v5 setQuickSpeakSpeakingRate:*(void *)(a1 + 32) forLanguage:v6];

  v7 = [MEMORY[0x1E4F49458] sharedInstance];
  *(float *)&double v8 = a2;
  [v7 setQuickSpeakSpeakingRate:v4 forLanguage:v8];

  if (!MACancelDownloadErrorDomain_block_invoke_qsInstance)
  {
    v9 = (void *)MEMORY[0x1E4F28B50];
    float v10 = AXAccessibilityBundlesDirectory();
    float v11 = [v10 stringByAppendingPathComponent:@"QuickSpeak.bundle"];
    double v12 = [v9 bundleWithPath:v11];

    if (([v12 isLoaded] & 1) == 0) {
      [v12 load];
    }
    v13 = (void *)[v12 principalClass];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v13 sharedInstance];
      v15 = (void *)MACancelDownloadErrorDomain_block_invoke_qsInstance;
      MACancelDownloadErrorDomain_block_invoke_qsInstance = v14;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    _AXAssert();
  }
  if (objc_opt_respondsToSelector())
  {
    v17 = (void *)MACancelDownloadErrorDomain_block_invoke_qsInstance;
    uint64_t v18 = *(void *)(a1 + 32);
    *(float *)&double v16 = a2;
    id v19 = [NSNumber numberWithFloat:v16];
    [v17 speakStatusWithLanguage:v18 rate:v19];
  }
}

void __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F49458];
  id v4 = a2;
  id v9 = [v3 sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  double v6 = [WeakRetained speechModelController];
  v7 = [*(id *)(a1 + 32) speechSourceKey];
  [v6 updateSelectedVoiceIdentifier:v4 forSpeechSourceKey:v7 languageCode:*(void *)(a1 + 40)];

  [v9 quickSpeakSpeakingRateForLanguage:*(void *)(a1 + 40)];
  if (fabs(v8 + -3.40282347e38) < 0.001) {
    [v9 quickSpeakSpeakingRate];
  }
  objc_msgSend(v9, "setQuickSpeakSpeakingRate:forLanguage:", *(void *)(a1 + 40));
  [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 48)];
}

id __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [WeakRetained speechModelController];
  id v4 = [*(id *)(a1 + 32) speechSourceKey];
  v5 = [v3 selectedVoiceIdentifierForSpeechSourceKey:v4 languageCode:*(void *)(a1 + 40)];

  return v5;
}

id __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F49458];
  id v4 = a2;
  v5 = [v3 sharedInstance];
  double v6 = [*(id *)(a1 + 32) speechSourceKey];
  v7 = [v5 customSettingsForVoice:v4 sourceKey:v6];

  return v7;
}

void __70__AXGeneralLanguageVoicePickerController__handleUnifiedSelectedVoice___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  v5 = (void *)MEMORY[0x1E4F49458];
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 sharedInstance];
  float v8 = [*(id *)(a1 + 32) speechSourceKey];
  [v9 setCustomSettingsForVoice:v7 sourceKey:v8 settings:v6];
}

@end