@interface VoiceOverActivitySpeechVoiceSelector
- (BOOL)showsSelectedVoiceVariantForLanguage;
- (id)activity;
- (id)specifiers;
- (id)speechSourceKey;
- (void)_showUnifiedSpeechSelection:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation VoiceOverActivitySpeechVoiceSelector

- (id)activity
{
  v2 = [(VoiceOverActivitySpeechVoiceSelector *)self specifier];
  v3 = [v2 propertyForKey:@"activity"];

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->AXLanguageSpeechBaseController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(VoiceOverActivitySpeechVoiceSelector *)self specifiersForLanguagesAndAccents];
    id v6 = [v5 mutableCopy];
    v7 = *(void **)&self->AXLanguageSpeechBaseController_opaque[v3];
    *(void *)&self->AXLanguageSpeechBaseController_opaque[v3] = v6;

    v4 = *(void **)&self->AXLanguageSpeechBaseController_opaque[v3];
  }

  return v4;
}

- (void)_showUnifiedSpeechSelection:(id)a3
{
  id v4 = a3;
  v5 = [v4 propertyForKey:PSIDKey];
  id v6 = objc_alloc_init((Class)AXSettingsPrimaryResourceDownloadController);
  v7 = [(VoiceOverActivitySpeechVoiceSelector *)self rootController];
  [v6 setRootController:v7];

  [v6 setSpecifier:0];
  [v6 setParentController:self];
  [v6 setLanguage:v5];
  [v6 setShowSpeakingRate:0];
  [v6 setShowDialectPicker:1];
  [v6 setShowNeural:0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = __68__VoiceOverActivitySpeechVoiceSelector__showUnifiedSpeechSelection___block_invoke;
  v19[3] = &unk_20AAC0;
  v19[4] = self;
  id v20 = v4;
  id v8 = v4;
  [v6 setSetDialectPreferencesCallback:v19];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = __68__VoiceOverActivitySpeechVoiceSelector__showUnifiedSpeechSelection___block_invoke_272;
  v18[3] = &unk_20AAE8;
  v18[4] = self;
  [v6 setGetDialectPreferencesCallback:v18];
  v9 = [(VoiceOverActivitySpeechVoiceSelector *)self activity];
  v10 = [v9 uuid];
  v11 = +[NSString stringWithFormat:@"VOActivity_%@", v10];

  [v6 setSpeechSourceKey:v11];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = __68__VoiceOverActivitySpeechVoiceSelector__showUnifiedSpeechSelection___block_invoke_2;
  v16[3] = &unk_20AB10;
  id v12 = v11;
  id v17 = v12;
  [v6 setGetPerVoiceSettingsCallack:v16];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = __68__VoiceOverActivitySpeechVoiceSelector__showUnifiedSpeechSelection___block_invoke_3;
  v14[3] = &unk_20AB38;
  id v15 = v12;
  id v13 = v12;
  [v6 setSetPerVoiceSettingsCallack:v14];
  [(VoiceOverActivitySpeechVoiceSelector *)self showController:v6 animate:1];
}

id __68__VoiceOverActivitySpeechVoiceSelector__showUnifiedSpeechSelection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 activity];
  [v5 setVoiceIdentifier:v4];

  id v6 = VOTLogActivities();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [*(id *)(a1 + 32) activity];
    id v8 = [v7 voiceIdentifier];
    int v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Voice selected: %@", (uint8_t *)&v10, 0xCu);
  }
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40)];
}

id __68__VoiceOverActivitySpeechVoiceSelector__showUnifiedSpeechSelection___block_invoke_272(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) activity];
  v2 = [v1 voiceIdentifier];

  return v2;
}

id __68__VoiceOverActivitySpeechVoiceSelector__showUnifiedSpeechSelection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[AXSettings sharedInstance];
  v5 = [v4 customSettingsForVoice:v3 sourceKey:*(void *)(a1 + 32)];

  return v5;
}

void __68__VoiceOverActivitySpeechVoiceSelector__showUnifiedSpeechSelection___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = +[AXSettings sharedInstance];
  [v7 setCustomSettingsForVoice:v6 sourceKey:*(void *)(a1 + 32) settings:v5];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = [a3 cellForRowAtIndexPath:a4];
  id v5 = [v6 specifier];
  [(VoiceOverActivitySpeechVoiceSelector *)self _showUnifiedSpeechSelection:v5];
}

- (id)speechSourceKey
{
  return 0;
}

- (BOOL)showsSelectedVoiceVariantForLanguage
{
  return 0;
}

@end