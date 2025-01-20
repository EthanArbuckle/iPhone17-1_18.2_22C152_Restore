@interface AXLanguageSpeechBaseController
- (AXLanguageSpeechBaseController)init;
- (AXSpeechSettingsModelController)speechModelController;
- (BOOL)includeLocaleInSelectorDialog;
- (BOOL)showsSelectedVoiceVariantForLanguage;
- (NSString)speechSourceKey;
- (id)_selectedDialect:(id)a3;
- (id)specifiersForLanguagesAndAccents;
- (void)setSpeechModelController:(id)a3;
@end

@implementation AXLanguageSpeechBaseController

- (AXLanguageSpeechBaseController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AXLanguageSpeechBaseController;
  v2 = [(AXUISettingsSetupCapableListController *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(AXSpeechSettingsModelController);
    [(AXLanguageSpeechBaseController *)v2 setSpeechModelController:v3];
  }
  return v2;
}

- (id)specifiersForLanguagesAndAccents
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v31 = [MEMORY[0x1E4F49440] sharedInstance];
  v2 = [MEMORY[0x1E4F1CA48] array];
  if (!AXDeviceSupportsVoiceBankingSpeech()
    || (v3 = (void *)MEMORY[0x1E4F92E70],
        AXUILocalizedStringForKey(@"SYSTEM_VOICES_TITLE"),
        v4 = objc_claimAutoreleasedReturnValue(),
        [v3 groupSpecifierWithName:v4],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    uint64_t v5 = [MEMORY[0x1E4F92E70] groupSpecifierWithName:0];
  }
  v26 = (void *)v5;
  v27 = v2;
  [v2 addObject:v5];
  v25 = [MEMORY[0x1E4F1CA48] array];
  v6 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v7 = [MEMORY[0x1E4FAF278] sharedInstance];
  v8 = [v7 resourcesWithType:1 subType:1];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v35;
    uint64_t v28 = *MEMORY[0x1E4F93188];
    uint64_t v29 = *MEMORY[0x1E4F93250];
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v34 + 1) + 8 * i) primaryLanguage];
        v14 = AXCLanguageCanonicalFormToGeneralLanguage();

        v15 = [v6 objectForKeyedSubscript:v14];

        if (!v15)
        {
          v16 = [v31 dialectForLanguageID:v14];
          v17 = (void *)MEMORY[0x1E4F92E70];
          v18 = [v16 languageNameInCurrentLocale];
          v19 = [v17 preferenceSpecifierNamed:v18 target:self set:0 get:sel__selectedDialect_ detail:objc_opt_class() cell:2 edit:0];

          v20 = [v16 languageNameAndLocaleInCurrentLocale];
          [v19 setProperty:v20 forKey:v29];

          [v19 setProperty:v14 forKey:v28];
          v21 = [v16 langMap];
          [v19 setProperty:v21 forKey:@"kAXPSLangMapKey"];

          [v6 setObject:v19 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v10);
  }

  v22 = [v6 allValues];
  [v25 addObjectsFromArray:v22];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __66__AXLanguageSpeechBaseController_specifiersForLanguagesAndAccents__block_invoke;
  v32[3] = &unk_1E649C8B0;
  id v33 = v31;
  id v23 = v31;
  [v25 sortUsingComparator:v32];
  [v27 addObjectsFromArray:v25];

  return v27;
}

uint64_t __66__AXLanguageSpeechBaseController_specifiersForLanguagesAndAccents__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F93188];
  v8 = [v5 propertyForKey:*MEMORY[0x1E4F93188]];
  uint64_t v9 = [*(id *)(a1 + 32) dialectForSystemLanguage];
  uint64_t v10 = [v9 langMap];
  uint64_t v11 = [v10 generalLanguageID];
  char v12 = [v8 isEqualToString:v11];

  if (v12)
  {
    uint64_t v13 = -1;
  }
  else
  {
    v14 = [v6 propertyForKey:v7];
    v15 = [*(id *)(a1 + 32) dialectForSystemLanguage];
    v16 = [v15 langMap];
    v17 = [v16 generalLanguageID];
    char v18 = [v14 isEqualToString:v17];

    if (v18)
    {
      uint64_t v13 = 1;
    }
    else
    {
      v19 = [v5 name];
      v20 = [v6 name];
      uint64_t v13 = [v19 localizedStandardCompare:v20];
    }
  }

  return v13;
}

- (id)_selectedDialect:(id)a3
{
  id v4 = a3;
  if ([(AXLanguageSpeechBaseController *)self showsSelectedVoiceVariantForLanguage])
  {
    id v5 = [v4 propertyForKey:@"kAXPSLangMapKey"];
    id v6 = [(AXLanguageSpeechBaseController *)self speechModelController];
    uint64_t v7 = [(AXLanguageSpeechBaseController *)self speechSourceKey];
    v8 = [v5 generalLanguageID];
    uint64_t v9 = [v6 selectedVoiceIdentifierForSpeechSourceKey:v7 languageCode:v8];

    [(AXLanguageSpeechBaseController *)self includeLocaleInSelectorDialog];
    uint64_t v10 = AXVoiceNameForVoiceId();
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)includeLocaleInSelectorDialog
{
  return 1;
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

- (NSString)speechSourceKey
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  v2 = (void *)*MEMORY[0x1E4F481E0];
  return (NSString *)v2;
}

- (BOOL)showsSelectedVoiceVariantForLanguage
{
  return 0;
}

@end