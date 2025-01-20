@interface AssistantAudioFeedbackController
+ (id)bundle;
- (BOOL)_isDeviceSpeakerSupportedForBluetoothAudioRoute;
- (id)_localizeTriggerString:(id)a3;
- (id)alwaysShowRecognizedSpeech;
- (id)footerVariant;
- (id)isAlwaysPrintSiriResponseEnabled:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_hideSiriBluetoothVehicleAudioRouteSettingsIfNeeded:(id)a3;
- (void)_refreshFooterForPreferredAudioRouteSpecifier:(id)a3;
- (void)_refreshFooterForSpecifier:(id)a3;
- (void)_refreshFooterForUpdateDeviceSpeakerForTTSSpecifiers:(id)a3;
- (void)_updateDeviceSpeakerForTTSPreferenceIfNeeded:(id)a3;
- (void)_updateDeviceSpeakerForTTSSpecifiersFromPreferences;
- (void)_updatePreferedAudioRouteFromPreferences;
- (void)_updatePreferencesIfNeeded:(id)a3;
- (void)_updatePreferredAudioRouteIfNeeded:(id)a3;
- (void)_updateSpecifiersFromPreferences;
- (void)preferencesDidChange:(id)a3;
- (void)registerUndoActionWithKey:(id)a3 urlString:(id)a4 undoAction:(id)a5;
- (void)setAlwaysPrintSiriResponseEnabled:(id)a3 forSpecifier:(id)a4;
- (void)setAlwaysShowRecognizedSpeech:(id)a3 forSpecifier:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation AssistantAudioFeedbackController

+ (id)bundle
{
  v2 = (void *)bundle_sAssistantBundle_4;
  if (!bundle_sAssistantBundle_4)
  {
    uint64_t v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = (void *)bundle_sAssistantBundle_4;
    bundle_sAssistantBundle_4 = v3;

    v2 = (void *)bundle_sAssistantBundle_4;
  }

  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v26[2] = *MEMORY[0x263EF8340];
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel_preferencesDidChange_ name:*MEMORY[0x263F28318] object:0];

  v25.receiver = self;
  v25.super_class = (Class)AssistantAudioFeedbackController;
  [(AssistantAudioFeedbackController *)&v25 viewDidAppear:v3];
  v24 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Siri/VOICE_FEEDBACK_ID"];
  id v6 = objc_alloc(MEMORY[0x263F08DB0]);
  v7 = [MEMORY[0x263EFF960] currentLocale];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 bundleURL];
  v10 = (void *)[v6 initWithKey:@"Siri Responses" table:0 locale:v7 bundleURL:v9];

  v11 = +[GMEligibilityProvider shared];
  LODWORD(v8) = [v11 deviceSupported];

  if (v8) {
    v12 = @"Apple Intelligence & Siri";
  }
  else {
    v12 = @"Siri";
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
  v22 = (void *)[v18 initWithKey:@"Siri Responses" table:0 locale:v19 bundleURL:v21];

  v26[0] = v17;
  v26[1] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
  [(AssistantAudioFeedbackController *)self pe_emitNavigationEventForApplicationSettingsWithApplicationBundleIdentifier:@"com.apple.siri" title:v10 localizedNavigationComponents:v23 deepLink:v24];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AssistantAudioFeedbackController;
  [(AssistantAudioFeedbackController *)&v5 viewDidDisappear:a3];
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F28318] object:0];
}

- (void)preferencesDidChange:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", a3);
  int64_t v5 = [v4 useDeviceSpeakerForTTS];

  if (v5 != self->_useDeviceSpeakerForTTSPreference) {
    self->_useDeviceSpeakerForTTSPreference = v5;
  }

  [(AssistantAudioFeedbackController *)self reloadSpecifiers];
}

- (id)specifiers
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    int64_t v5 = [(AssistantAudioFeedbackController *)self loadSpecifiersFromPlistName:@"AssistantAudioFeedback" target:self];
    id v6 = [v5 specifierForID:@"VOICE_FEEDBACK_GROUP_ID"];
    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = v6;

    v8 = [v5 specifierForID:@"VOICE_FEEDBACK_PREFER_SILENT_RESPONSES_ID"];
    preferSilentResponsesSpecifier = self->_preferSilentResponsesSpecifier;
    self->_preferSilentResponsesSpecifier = v8;

    v10 = [v5 specifierForID:@"VOICE_FEEDBACK_AUTOMATIC_ID"];
    automaticSpecifier = self->_automaticSpecifier;
    self->_automaticSpecifier = v10;

    v12 = [v5 specifierForID:@"VOICE_FEEDBACK_PREFER_SPOKEN_RESPONSES_ID"];
    preferSpokenResponsesSpecifier = self->_preferSpokenResponsesSpecifier;
    self->_preferSpokenResponsesSpecifier = v12;

    v14 = [v5 specifierForID:@"PREFERRED_AUDIO_GROUP_ID"];
    preferredAudioRouteGroupSpecifier = self->_preferredAudioRouteGroupSpecifier;
    self->_preferredAudioRouteGroupSpecifier = v14;

    v16 = [v5 specifierForID:@"PREFFERED_AUDIO_ROUTE_BLUETOOTH_AUDIO_ID"];
    preferredAudioRouteBluetoothSpecifier = self->_preferredAudioRouteBluetoothSpecifier;
    self->_preferredAudioRouteBluetoothSpecifier = v16;

    id v18 = [v5 specifierForID:@"PREFERRED_AUDIO_ROUTE_CAR_RADIO_ID"];
    preferredAudioRouteCarRadioSpecifier = self->_preferredAudioRouteCarRadioSpecifier;
    self->_preferredAudioRouteCarRadioSpecifier = v18;

    v20 = [v5 specifierForID:@"PREFERRED_AUDIO_ROUTE_PHONE_SPEAKER_ID"];
    preferredAudioRoutePhoneSpeakerSpecifier = self->_preferredAudioRoutePhoneSpeakerSpecifier;
    self->_preferredAudioRoutePhoneSpeakerSpecifier = v20;

    [(AssistantAudioFeedbackController *)self _hideSiriBluetoothVehicleAudioRouteSettingsIfNeeded:v5];
    if (![(AssistantAudioFeedbackController *)self _isDeviceSpeakerSupportedForBluetoothAudioRoute])
    {
      v22 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 136315138;
        v30 = "-[AssistantAudioFeedbackController specifiers]";
        _os_log_impl(&dword_220C23000, v22, OS_LOG_TYPE_DEFAULT, "%s The current device doesn't support device speaker option. Removing option.", (uint8_t *)&v29, 0xCu);
      }
      [v5 removeObject:self->_preferredAudioRoutePhoneSpeakerSpecifier];
    }
    v23 = +[GMEligibilityProvider shared];
    int v24 = [v23 activeEnabled];

    if (v24)
    {
      objc_super v25 = [v5 specifierForID:@"ALWAYS_PRINT_RESPONSE_GROUP_ID"];
      [v5 removeObject:v25];
      v26 = [v5 specifierForID:@"ALWAYS_PRINT_RESPONSE_ID"];
      [v5 removeObject:v26];
    }
    v27 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    [(AssistantAudioFeedbackController *)self _updateSpecifiersFromPreferences];
    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }

  return v4;
}

- (void)_hideSiriBluetoothVehicleAudioRouteSettingsIfNeeded:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!CFPreferencesGetAppBooleanValue(@"showBTAudioRouteSetting", @"com.apple.siri.CarBluetooth", 0))
  {
    int64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      v7 = "-[AssistantAudioFeedbackController _hideSiriBluetoothVehicleAudioRouteSettingsIfNeeded:]";
      _os_log_impl(&dword_220C23000, v5, OS_LOG_TYPE_DEFAULT, "%s Hiding the BT Car Audio Route Settings.", (uint8_t *)&v6, 0xCu);
    }
    [v4 removeObject:self->_preferredAudioRouteGroupSpecifier];
    [v4 removeObject:self->_preferredAudioRoutePhoneSpeakerSpecifier];
    [v4 removeObject:self->_preferredAudioRouteBluetoothSpecifier];
    [v4 removeObject:self->_preferredAudioRouteCarRadioSpecifier];
  }
}

- (void)_updateSpecifiersFromPreferences
{
  [(AssistantAudioFeedbackController *)self _updateDeviceSpeakerForTTSSpecifiersFromPreferences];

  [(AssistantAudioFeedbackController *)self _updatePreferedAudioRouteFromPreferences];
}

- (void)_updateDeviceSpeakerForTTSSpecifiersFromPreferences
{
  uint64_t v3 = [MEMORY[0x263F285A0] sharedPreferences];
  self->_useDeviceSpeakerForTTSPreference = [v3 useDeviceSpeakerForTTS];

  unint64_t v4 = self->_useDeviceSpeakerForTTSPreference - 1;
  if (v4 > 2) {
    id v5 = 0;
  }
  else {
    id v5 = *(id *)((char *)&self->super.super.super.super.super.isa + *off_26457D8B8[v4]);
  }
  id v6 = v5;
  [(PSSpecifier *)self->_groupSpecifier setProperty:v5 forKey:*MEMORY[0x263F60200]];
  [(AssistantAudioFeedbackController *)self _refreshFooterForSpecifier:v6];
}

- (void)_updatePreferedAudioRouteFromPreferences
{
  uint64_t v3 = [MEMORY[0x263F285A0] sharedPreferences];
  unint64_t v4 = [v3 bluetoothPreferredCarAudioRoute];
  preferredCarAudioRoute = self->_preferredCarAudioRoute;
  self->_preferredCarAudioRoute = v4;

  if ([(NSString *)self->_preferredCarAudioRoute isEqual:@"A2DP"])
  {
    id v6 = &OBJC_IVAR___AssistantAudioFeedbackController__preferredAudioRouteBluetoothSpecifier;
  }
  else if ([(AssistantAudioFeedbackController *)self _isDeviceSpeakerSupportedForBluetoothAudioRoute]&& ([(NSString *)self->_preferredCarAudioRoute isEqual:@"DeviceSpeaker"] & 1) != 0)
  {
    id v6 = &OBJC_IVAR___AssistantAudioFeedbackController__preferredAudioRoutePhoneSpeakerSpecifier;
  }
  else
  {
    id v6 = &OBJC_IVAR___AssistantAudioFeedbackController__preferredAudioRouteCarRadioSpecifier;
  }
  id v7 = *(id *)((char *)&self->super.super.super.super.super.isa + *v6);
  [(PSSpecifier *)self->_preferredAudioRouteGroupSpecifier setProperty:v7 forKey:*MEMORY[0x263F60200]];
  [(AssistantAudioFeedbackController *)self _refreshFooterForSpecifier:v7];
}

- (id)footerVariant
{
  if (+[AssistantUtilities deviceIsiPhone]) {
    v2 = @"IPHONE";
  }
  else {
    v2 = @"IPAD";
  }

  return v2;
}

- (void)_refreshFooterForSpecifier:(id)a3
{
  id v4 = a3;
  [(AssistantAudioFeedbackController *)self _refreshFooterForUpdateDeviceSpeakerForTTSSpecifiers:v4];
  [(AssistantAudioFeedbackController *)self _refreshFooterForPreferredAudioRouteSpecifier:v4];
}

- (void)_refreshFooterForUpdateDeviceSpeakerForTTSSpecifiers:(id)a3
{
  id v4 = (PSSpecifier *)a3;
  v10 = v4;
  if (self->_preferSilentResponsesSpecifier == v4)
  {
    id v5 = @"VOICE_FEEDBACK_FOOTER_PREFER_SILENT_RESPONSES_";
  }
  else if (self->_automaticSpecifier == v4)
  {
    id v5 = @"VOICE_FEEDBACK_FOOTER_AUTOMATIC_";
  }
  else
  {
    if (self->_preferSpokenResponsesSpecifier != v4) {
      goto LABEL_9;
    }
    id v5 = @"VOICE_FEEDBACK_FOOTER_PREFER_SPOKEN_RESPONSES_";
  }
  if ([(__CFString *)v5 length])
  {
    groupSpecifier = self->_groupSpecifier;
    id v7 = [(AssistantAudioFeedbackController *)self footerVariant];
    uint64_t v8 = [(__CFString *)v5 stringByAppendingString:v7];
    v9 = [(AssistantAudioFeedbackController *)self _localizeTriggerString:v8];
    [(PSSpecifier *)groupSpecifier setProperty:v9 forKey:*MEMORY[0x263F600F8]];
  }
LABEL_9:
}

- (void)_refreshFooterForPreferredAudioRouteSpecifier:(id)a3
{
  id v7 = (PSSpecifier *)a3;
  if (self->_preferredAudioRouteCarRadioSpecifier == v7)
  {
    id v4 = @"PREFERRED_AUDIO_ROUTE_CAR_RADIO_FOOTER_TEXT";
  }
  else if ([(AssistantAudioFeedbackController *)self _isDeviceSpeakerSupportedForBluetoothAudioRoute]&& self->_preferredAudioRoutePhoneSpeakerSpecifier == v7)
  {
    id v4 = @"PREFERRED_AUDIO_ROUTE_PHONE_SPEAKER_FOOTER_TEXT";
  }
  else if (self->_preferredAudioRouteBluetoothSpecifier == v7)
  {
    id v4 = @"PREFFERED_AUDIO_ROUTE_BLUETOOTH_AUDIO_FOOTER_TEXT";
  }
  else
  {
    id v4 = 0;
  }
  if (AFIsInternalInstall())
  {
    id v4 = [(__CFString *)v4 stringByAppendingString:@"_INTERNAL"];
  }
  if (v4 && [(__CFString *)v4 length])
  {
    preferredAudioRouteGroupSpecifier = self->_preferredAudioRouteGroupSpecifier;
    id v6 = [(AssistantAudioFeedbackController *)self _localizeTriggerString:v4];
    [(PSSpecifier *)preferredAudioRouteGroupSpecifier setProperty:v6 forKey:*MEMORY[0x263F600F8]];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)AssistantAudioFeedbackController;
  id v6 = a4;
  [(AssistantAudioFeedbackController *)&v10 tableView:a3 didSelectRowAtIndexPath:v6];
  uint64_t v7 = -[AssistantAudioFeedbackController indexForIndexPath:](self, "indexForIndexPath:", v6, v10.receiver, v10.super_class);

  uint64_t v8 = [(AssistantAudioFeedbackController *)self specifierAtIndex:v7];
  [(AssistantAudioFeedbackController *)self _refreshFooterForSpecifier:v8];
  [(AssistantAudioFeedbackController *)self _updatePreferencesIfNeeded:v8];
  v9 = [MEMORY[0x263F285A0] sharedPreferences];
  [v9 synchronize];
}

- (void)_updatePreferencesIfNeeded:(id)a3
{
  id v4 = a3;
  [(AssistantAudioFeedbackController *)self _updateDeviceSpeakerForTTSPreferenceIfNeeded:v4];
  [(AssistantAudioFeedbackController *)self _updatePreferredAudioRouteIfNeeded:v4];
}

- (void)_updateDeviceSpeakerForTTSPreferenceIfNeeded:(id)a3
{
  id v4 = (PSSpecifier *)a3;
  id v5 = v4;
  if (self->_preferSilentResponsesSpecifier == v4)
  {
    int64_t v6 = 3;
  }
  else if (self->_automaticSpecifier == v4)
  {
    int64_t v6 = 1;
  }
  else
  {
    if (self->_preferSpokenResponsesSpecifier != v4) {
      goto LABEL_8;
    }
    int64_t v6 = 2;
  }
  self->_useDeviceSpeakerForTTSPreference = v6;
LABEL_8:
  uint64_t v7 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v8 = [v7 useDeviceSpeakerForTTS];

  if (v8 != self->_useDeviceSpeakerForTTSPreference)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __81__AssistantAudioFeedbackController__updateDeviceSpeakerForTTSPreferenceIfNeeded___block_invoke;
    v10[3] = &unk_26457D898;
    v10[4] = self;
    v10[5] = v8;
    [(AssistantAudioFeedbackController *)self registerUndoActionWithKey:@"VOICE_FEEDBACK" urlString:@"prefs:root=SIRI&path=VOICE_FEEDBACK_ID" undoAction:v10];
    v9 = [MEMORY[0x263F285A0] sharedPreferences];
    [v9 setUseDeviceSpeakerForTTS:self->_useDeviceSpeakerForTTSPreference];
  }
}

uint64_t __81__AssistantAudioFeedbackController__updateDeviceSpeakerForTTSPreferenceIfNeeded___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  [v2 setUseDeviceSpeakerForTTS:*(void *)(a1 + 40)];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 reloadSpecifiers];
}

- (void)_updatePreferredAudioRouteIfNeeded:(id)a3
{
  id v4 = (PSSpecifier *)a3;
  if (self->_preferredAudioRouteBluetoothSpecifier == v4)
  {
    preferredCarAudioRoute = self->_preferredCarAudioRoute;
    int64_t v6 = @"A2DP";
  }
  else if ([(AssistantAudioFeedbackController *)self _isDeviceSpeakerSupportedForBluetoothAudioRoute]&& self->_preferredAudioRoutePhoneSpeakerSpecifier == v4)
  {
    preferredCarAudioRoute = self->_preferredCarAudioRoute;
    int64_t v6 = @"DeviceSpeaker";
  }
  else
  {
    preferredCarAudioRoute = self->_preferredCarAudioRoute;
    int64_t v6 = @"HFP";
  }
  self->_preferredCarAudioRoute = &v6->isa;

  uint64_t v7 = [MEMORY[0x263F285A0] sharedPreferences];
  uint64_t v8 = [v7 bluetoothPreferredCarAudioRoute];

  if (self->_preferredCarAudioRoute != v8)
  {
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    v12 = __71__AssistantAudioFeedbackController__updatePreferredAudioRouteIfNeeded___block_invoke;
    id v13 = &unk_26457D148;
    v14 = v8;
    v15 = self;
    [(AssistantAudioFeedbackController *)self registerUndoActionWithKey:@"PREFERRED_AUDIO_ROUTE_TITLE" urlString:@"prefs:root=SIRI&path=PREFERRED_AUDIO_GROUP_ID" undoAction:&v10];
    v9 = objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", v10, v11, v12, v13);
    [v9 setBluetoothPreferredCarAudioRoute:self->_preferredCarAudioRoute];
  }
}

uint64_t __71__AssistantAudioFeedbackController__updatePreferredAudioRouteIfNeeded___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  [v2 setBluetoothPreferredCarAudioRoute:*(void *)(a1 + 32)];

  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 reloadSpecifiers];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AssistantAudioFeedbackController;
  id v4 = [(AssistantAudioFeedbackController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  id v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (id)_localizeTriggerString:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F85AF0];
  id v4 = a3;
  id v5 = [v3 sharedPreferences];
  int64_t v6 = [MEMORY[0x263F285A0] sharedPreferences];
  objc_super v7 = [v6 languageCode];
  uint64_t v8 = [v5 localizedTriggerPhraseForLanguageCode:v7];

  v9 = [v8 stringByReplacingOccurrencesOfString:@" " withString:@" "];
  uint64_t v10 = NSString;
  uint64_t v11 = +[AssistantAudioFeedbackController bundle];
  v12 = [v11 localizedStringForKey:v4 value:&stru_26D2AB140 table:@"AssistantAudioFeedback"];

  id v13 = objc_msgSend(v10, "stringWithFormat:", v12, v9);

  return v13;
}

- (id)isAlwaysPrintSiriResponseEnabled:(id)a3
{
  uint64_t v3 = NSNumber;
  id v4 = objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", a3);
  id v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "siriResponseShouldAlwaysPrint"));

  return v5;
}

- (void)setAlwaysPrintSiriResponseEnabled:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __83__AssistantAudioFeedbackController_setAlwaysPrintSiriResponseEnabled_forSpecifier___block_invoke;
  uint64_t v11 = &unk_26457D148;
  id v12 = v5;
  id v13 = self;
  id v6 = v5;
  [(AssistantAudioFeedbackController *)self registerUndoActionWithKey:@"ALWAYS_PRINT_RESPONSE" urlString:@"prefs:root=SIRI&path=VOICE_FEEDBACK_ID/ALWAYS_PRINT_RESPONSE_GROUP_ID" undoAction:&v8];
  objc_super v7 = objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", v8, v9, v10, v11);
  objc_msgSend(v7, "setSiriResponseShouldAlwaysPrint:", objc_msgSend(v6, "BOOLValue"));
}

uint64_t __83__AssistantAudioFeedbackController_setAlwaysPrintSiriResponseEnabled_forSpecifier___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  objc_msgSend(v2, "setSiriResponseShouldAlwaysPrint:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue") ^ 1);

  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 reloadSpecifiers];
}

- (BOOL)_isDeviceSpeakerSupportedForBluetoothAudioRoute
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F544E0] sharedAVSystemController];
  uint64_t v3 = [v2 pickableRoutesForCategory:*MEMORY[0x263F28778] andMode:@"Default"];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    objc_super v7 = (void *)MEMORY[0x263F54468];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectForKeyedSubscript:", *v7, (void)v12);
        char v10 = [v9 BOOLValue];

        if (v10)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)alwaysShowRecognizedSpeech
{
  v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x263F285A0] sharedPreferences];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "alwaysShowRecognizedSpeech"));

  return v4;
}

- (void)setAlwaysShowRecognizedSpeech:(id)a3 forSpecifier:(id)a4
{
  id v5 = a3;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  char v10 = __79__AssistantAudioFeedbackController_setAlwaysShowRecognizedSpeech_forSpecifier___block_invoke;
  uint64_t v11 = &unk_26457D148;
  id v12 = v5;
  long long v13 = self;
  id v6 = v5;
  [(AssistantAudioFeedbackController *)self registerUndoActionWithKey:@"ALWAYS_SHOW_RECOGNIZED_SPEECH" urlString:@"prefs:root=SIRI&path=VOICE_FEEDBACK_ID/ALWAYS_SHOW_RECOGNIZED_SPEECH_GROUP_ID" undoAction:&v8];
  objc_super v7 = objc_msgSend(MEMORY[0x263F285A0], "sharedPreferences", v8, v9, v10, v11);
  objc_msgSend(v7, "setAlwaysShowRecognizedSpeech:", objc_msgSend(v6, "BOOLValue"));
}

uint64_t __79__AssistantAudioFeedbackController_setAlwaysShowRecognizedSpeech_forSpecifier___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F285A0] sharedPreferences];
  objc_msgSend(v2, "setAlwaysShowRecognizedSpeech:", objc_msgSend(*(id *)(a1 + 32), "BOOLValue") ^ 1);

  uint64_t v3 = *(void **)(a1 + 40);

  return [v3 reloadSpecifiers];
}

- (void)registerUndoActionWithKey:(id)a3 urlString:(id)a4 undoAction:(id)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x263F08DB0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 alloc];
  long long v13 = [MEMORY[0x263EFF960] currentLocale];
  long long v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  long long v15 = [v14 bundleURL];
  id v17 = (id)[v12 initWithKey:v11 table:@"AssistantAudioFeedback" locale:v13 bundleURL:v15];

  v16 = [NSURL URLWithString:v10];

  [(AssistantAudioFeedbackController *)self pe_registerUndoActionName:v17 associatedDeepLink:v16 undoAction:v9];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredCarAudioRoute, 0);
  objc_storeStrong((id *)&self->_preferredAudioRouteGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_preferredAudioRoutePhoneSpeakerSpecifier, 0);
  objc_storeStrong((id *)&self->_preferredAudioRouteCarRadioSpecifier, 0);
  objc_storeStrong((id *)&self->_preferredAudioRouteBluetoothSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_preferSpokenResponsesSpecifier, 0);
  objc_storeStrong((id *)&self->_automaticSpecifier, 0);

  objc_storeStrong((id *)&self->_preferSilentResponsesSpecifier, 0);
}

@end