@interface AXSiriSettingsController
+ (id)speechRateAsLocalizedPercent:(id)a3;
- (BOOL)_alwaysAllowVoiceActivation;
- (BOOL)_alwaysPrintSiriResponse;
- (BOOL)_typeToSiriEnabled;
- (BOOL)_updateFooterForSpecifier:(id)a3;
- (LAContext)localAuthContext;
- (double)_speechRateFromValue:(double)a3;
- (id)_localizeTriggerString:(id)a3;
- (id)_siriCallHangup:(id)a3;
- (id)_typeToSiriFooterString;
- (id)_voiceActivationFooterString;
- (id)announceNotificationsOnBuiltInSpeaker:(id)a3;
- (id)footerVariant;
- (id)isAlwaysAllowVoiceActivationEnabled:(id)a3;
- (id)isTypeToSiriEnabled:(id)a3;
- (id)showApps:(id)a3;
- (id)siriRequiredForInterruptions:(id)a3;
- (id)sliderValueForSpeechRate:(id)a3;
- (id)specifiers;
- (id)speechRate;
- (id)speechVarianceEnabled:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_typeToSiriTTSDevice;
- (void)_handleSpeechEventCondition;
- (void)_reloadAnnounceNotificationSettingsGroupForAnnounceOnSpeakerEnabled:(BOOL)a3;
- (void)_setAlwaysAllowVoiceActivation:(BOOL)a3;
- (void)_setAlwaysPrintSiriResponse:(BOOL)a3;
- (void)_setTypeToSiriEnabled:(BOOL)a3;
- (void)_setUseDeviceSpeakerForTTS:(int64_t)a3;
- (void)_updateSpecifiersFromPreferences;
- (void)dealloc;
- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5;
- (void)preferencesDidChange:(id)a3;
- (void)reloadSpecifiers;
- (void)setAlwaysAllowVoiceActivationEnabled:(id)a3 specifier:(id)a4;
- (void)setAnnounceNotificationsOnBuiltInSpeaker:(id)a3 specifier:(id)a4;
- (void)setLocalAuthContext:(id)a3;
- (void)setShowApps:(id)a3 specifier:(id)a4;
- (void)setSiriRequiredForInterruptionsEnabled:(id)a3 specifier:(id)a4;
- (void)setSpeechVarianceEnabled:(id)a3 specifier:(id)a4;
- (void)setTypeToSiriEnabled:(id)a3 specifier:(id)a4;
- (void)setupSiriSpeechRateSlider:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation AXSiriSettingsController

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)AXSiriSettingsController;
  [(AXSiriSettingsController *)&v4 viewDidLoad];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"preferencesDidChange:" name:AFPreferencesDidChangeNotification object:0];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AXSiriSettingsController;
  [(AXSiriSettingsController *)&v4 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = [(AXSiriSettingsController *)self loadSpecifiersFromPlistName:@"SiriSettings" target:self];
    uint64_t v66 = 0;
    v67 = &v66;
    uint64_t v68 = 0x2050000000;
    v7 = (void *)getBBSettingsGatewayClass_softClass;
    uint64_t v69 = getBBSettingsGatewayClass_softClass;
    if (!getBBSettingsGatewayClass_softClass)
    {
      v65[0] = _NSConcreteStackBlock;
      v65[1] = 3221225472;
      v65[2] = __getBBSettingsGatewayClass_block_invoke;
      v65[3] = &unk_2089B8;
      v65[4] = &v66;
      __getBBSettingsGatewayClass_block_invoke((uint64_t)v65);
      v7 = (void *)v67[3];
    }
    v8 = v7;
    _Block_object_dispose(&v66, 8);
    v9 = (BBSettingsGateway *)objc_alloc_init(v8);
    bbSettingsGateway = self->_bbSettingsGateway;
    self->_bbSettingsGateway = v9;

    v65[0] = 2;
    unsigned int v11 = +[GMAvailabilityWrapper shouldBeShownInSettingsReturningAvailabilityStatus:v65];
    uint64_t v12 = v65[0];
    if (_os_feature_enabled_impl() && v11 && v12 != 2)
    {
      v13 = [v6 specifierForID:@"SIRI_SETTINGS_TYPE_TO_SIRI"];
      [v6 removeObject:v13];
    }
    else
    {
      v14 = +[PSSpecifier emptyGroupSpecifier];
      typeToSiriGroupSpecifier = self->_typeToSiriGroupSpecifier;
      self->_typeToSiriGroupSpecifier = v14;

      v16 = self->_typeToSiriGroupSpecifier;
      v17 = [(AXSiriSettingsController *)self _typeToSiriFooterString];
      uint64_t v18 = PSFooterTextGroupKey;
      [(PSSpecifier *)v16 setProperty:v17 forKey:PSFooterTextGroupKey];

      [(PSSpecifier *)self->_typeToSiriGroupSpecifier setIdentifier:@"TYPE_TO_SIRI_GROUP_ID"];
      [v5 addObject:self->_typeToSiriGroupSpecifier];
      v13 = [v6 specifierForID:@"ENDPOINTER"];
      v19 = settingsLocString(@"ENDPOINTER_FOOTER", @"SiriSettings");
      [v13 setProperty:v19 forKey:v18];

      v20 = [v6 specifierForID:@"SIRI_SETTINGS_TYPE_TO_SIRI"];
      typeToSiriSwitchSpecifier = self->_typeToSiriSwitchSpecifier;
      self->_typeToSiriSwitchSpecifier = v20;
    }
    v22 = [v6 specifierForID:@"VOICE_FEEDBACK_WITH_SWITCH_ID"];
    preferSpokenSpecifier = self->_preferSpokenSpecifier;
    self->_preferSpokenSpecifier = v22;

    v24 = self->_preferSpokenSpecifier;
    v25 = settingsLocString(@"VOICE_FEEDBACK_TITLE_PREFER_SPOKEN", @"Accessibility");
    [(PSSpecifier *)v24 setName:v25];

    v26 = [v6 specifierForID:@"VOICE_FEEDBACK_GROUP_ID"];
    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = v26;

    v28 = [v6 specifierForID:@"VOICE_FEEDBACK_AUTOMATIC_ID"];
    automaticSpecifier = self->_automaticSpecifier;
    self->_automaticSpecifier = v28;

    v30 = [v6 specifierForID:@"VOICE_FEEDBACK_NEVER_ID"];
    neverSpecifier = self->_neverSpecifier;
    self->_neverSpecifier = v30;

    v32 = self->_neverSpecifier;
    v33 = settingsLocString(@"VOICE_FEEDBACK_TITLE_NEVER", @"Accessibility");
    [(PSSpecifier *)v32 setName:v33];

    if (_os_feature_enabled_impl())
    {
      [(AXSiriSettingsController *)self setupSiriSpeechRateSlider:v6];
    }
    else
    {
      v34 = [v6 specifierForID:@"SPEECH_RATE"];
      [v6 removeObject:v34];
    }
    id v64 = v5;
    v35 = [v6 specifierForID:@"SIRI_SETTINGS_VOICE_ACTIVATION_GROUP_ID"];
    v36 = [(AXSiriSettingsController *)self _voiceActivationFooterString];
    uint64_t v37 = PSFooterTextGroupKey;
    v63 = v35;
    [v35 setProperty:v36 forKey:PSFooterTextGroupKey];

    v38 = [v6 specifierForID:@"SIRI_SETTINGS_VOICE_ACTIVATION_ALWAYS_ALLOW"];
    v39 = [(AXSiriSettingsController *)self _localizeTriggerString:@"SIRI_SETTINGS_VOICE_ACTIVATION_ALWAYS_ALLOW"];
    [v38 setName:v39];

    id v40 = v38;
    v41 = v40;
    if (AXHasCapability())
    {
      v42 = +[PSSpecifier emptyGroupSpecifier];
      v43 = settingsLocString(@"SIRI_BARGE_FOOTER", @"SiriSettings");
      [v42 setProperty:v43 forKey:v37];

      objc_msgSend(v6, "ps_insertObject:afterObject:", v42, v40);
      v44 = settingsLocString(@"SIRI_BARGE_LABEL", @"SiriSettings");
      v41 = +[PSSpecifier preferenceSpecifierNamed:v44 target:self set:"setSiriRequiredForInterruptionsEnabled:specifier:" get:"siriRequiredForInterruptions:" detail:0 cell:6 edit:0];

      [v41 setProperty:@"SIRI_BARGE" forKey:PSIDKey];
      objc_msgSend(v6, "ps_insertObject:afterObject:", v41, v42);
    }
    if (AXHasCapability())
    {
      v45 = +[PSSpecifier emptyGroupSpecifier];
      v46 = settingsLocString(@"SPEECH_VARIANCE_FOOTER", @"SiriSettings");
      [v45 setProperty:v46 forKey:v37];

      objc_msgSend(v6, "ps_insertObject:afterObject:", v45, v41);
      v47 = settingsLocString(@"SPEECH_VARIANCE_LABEL", @"SiriSettings");
      v48 = +[PSSpecifier preferenceSpecifierNamed:v47 target:self set:"setSpeechVarianceEnabled:specifier:" get:"speechVarianceEnabled:" detail:0 cell:6 edit:0];

      [v48 setProperty:@"SIRI_ATYPICAL_SPEECH" forKey:PSIDKey];
      objc_msgSend(v6, "ps_insertObject:afterObject:", v48, v45);

      v41 = v48;
    }
    v49 = v64;
    if (_os_feature_enabled_impl() && AFSupportsCallHangUp())
    {
      v50 = +[PSSpecifier groupSpecifierWithID:@"SiriCallHangupGroup"];
      v51 = settingsLocString(@"CALL_HANG_UP", @"Accessibility");
      v49 = v64;
      v52 = +[PSSpecifier preferenceSpecifierNamed:v51 target:self set:0 get:"_siriCallHangup:" detail:objc_opt_class() cell:2 edit:0];

      [v52 setIdentifier:@"SIRI_CALL_HANGUP_ID"];
      [v6 addObject:v50];
      [v6 addObject:v52];
    }
    if (_os_feature_enabled_impl())
    {
      v53 = [v6 specifierForID:@"ANNOUNCE_NOTIFICATIONS_SETTINGS_ID"];
      announceNotificationsSpecifier = self->_announceNotificationsSpecifier;
      self->_announceNotificationsSpecifier = v53;

      v55 = self->_announceNotificationsSpecifier;
      uint64_t v56 = PSBundlePathForPreferenceBundle();
      [(PSSpecifier *)v55 setProperty:v56 forKey:PSLazilyLoadedBundleKey];

      [(PSSpecifier *)self->_announceNotificationsSpecifier setProperty:&__kCFBooleanTrue forKey:PSBundleOverridePrincipalClassKey];
      [(PSSpecifier *)self->_announceNotificationsSpecifier setControllerLoadAction:"lazyLoadBundle:"];
      v57 = +[AFPreferences sharedPreferences];
      LOBYTE(v56) = [v57 announceNotificationsOnBuiltInSpeakerEnabled];

      if ((v56 & 1) == 0) {
        [v6 removeObject:self->_announceNotificationsSpecifier];
      }
    }
    else
    {
      v58 = [v6 specifierForID:@"ANNOUNCE_NOTIFICATIONS_BUILT_IN_SPEAKER_GROUP"];
      [v6 removeObject:v58];

      v59 = [v6 specifierForID:@"ANNOUNCE_NOTIFICATIONS_BUILT_IN_SPEAKER_ID"];
      [v6 removeObject:v59];

      v60 = [v6 specifierForID:@"ANNOUNCE_NOTIFICATIONS_SETTINGS_ID"];
      [v6 removeObject:v60];
    }
    [v49 addObjectsFromArray:v6];
    v61 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
    *(void *)&self->AXUISettingsBaseListController_opaque[v3] = v49;

    objc_super v4 = *(void **)&self->AXUISettingsBaseListController_opaque[v3];
  }

  return v4;
}

- (void)reloadSpecifiers
{
  v3.receiver = self;
  v3.super_class = (Class)AXSiriSettingsController;
  [(AXSiriSettingsController *)&v3 reloadSpecifiers];
  [(AXSiriSettingsController *)self _updateSpecifiersFromPreferences];
}

- (void)setSiriRequiredForInterruptionsEnabled:(id)a3 specifier:(id)a4
{
  id v4 = [a3 BOOLValue];

  _AXSetSiriRequireSiriForInterruptionsInValue(v4);
}

- (id)siriRequiredForInterruptions:(id)a3
{
  uint64_t v3 = AXGetSiriRequireSiriForInterruptionsInValue();

  return +[NSNumber numberWithBool:v3];
}

- (void)setSpeechVarianceEnabled:(id)a3 specifier:(id)a4
{
  id v4 = a3;
  id v6 = +[AFPreferences sharedPreferences];
  id v5 = [v4 BOOLValue];

  [v6 setUseAtypicalSpeechModel:v5];
}

- (id)speechVarianceEnabled:(id)a3
{
  uint64_t v3 = +[AFPreferences sharedPreferences];
  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 useAtypicalSpeechModel]);

  return v4;
}

- (id)_siriCallHangup:(id)a3
{
  uint64_t v3 = +[VTPreferences sharedPreferences];
  if ([v3 canUseVoiceTriggerDuringPhoneCall]) {
    id v4 = @"ON";
  }
  else {
    id v4 = @"OFF";
  }
  id v5 = settingsLocString(v4, @"Accessibility");

  return v5;
}

- (void)setShowApps:(id)a3 specifier:(id)a4
{
  uint64_t v4 = [a3 BOOLValue] ^ 1;
  id v5 = +[AFPreferences sharedPreferences];
  [v5 setAlwaysObscureBackgroundContentWhenActive:v4];
}

- (id)showApps:(id)a3
{
  uint64_t v3 = +[AFPreferences sharedPreferences];
  uint64_t v4 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v3 alwaysObscureBackgroundContentWhenActive] ^ 1);

  return v4;
}

- (id)announceNotificationsOnBuiltInSpeaker:(id)a3
{
  uint64_t v3 = +[AFPreferences sharedPreferences];
  uint64_t v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 announceNotificationsOnBuiltInSpeakerEnabled]);

  return v4;
}

- (void)setAnnounceNotificationsOnBuiltInSpeaker:(id)a3 specifier:(id)a4
{
  id v6 = a3;
  if (_os_feature_enabled_impl())
  {
    id v5 = +[AFPreferences sharedPreferences];
    objc_msgSend(v5, "setAnnounceNotificationsOnBuiltInSpeakerEnabled:", objc_msgSend(v6, "BOOLValue"));

    if ([v6 BOOLValue])
    {
      if ([(BBSettingsGateway *)self->_bbSettingsGateway effectiveGlobalAnnounceSetting] == (char *)&dword_0 + 1)[(BBSettingsGateway *)self->_bbSettingsGateway setEffectiveGlobalAnnounceSetting:2]; {
    }
      }
  }
}

- (void)_reloadAnnounceNotificationSettingsGroupForAnnounceOnSpeakerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    unsigned int v5 = [(AXSiriSettingsController *)self containsSpecifier:self->_announceNotificationsSpecifier];
    if (!v3 || (v5 & 1) != 0)
    {
      if (!v3 && ((v5 ^ 1) & 1) == 0) {
        [(AXSiriSettingsController *)self removeSpecifierID:@"ANNOUNCE_NOTIFICATIONS_SETTINGS_ID"];
      }
    }
    else
    {
      [(AXSiriSettingsController *)self insertSpecifier:self->_announceNotificationsSpecifier afterSpecifierID:@"ANNOUNCE_NOTIFICATIONS_BUILT_IN_SPEAKER_ID"];
    }
    [(AXSiriSettingsController *)self reloadSpecifierID:@"ANNOUNCE_NOTIFICATIONS_BUILT_IN_SPEAKER_GROUP"];
  }
}

- (id)isTypeToSiriEnabled:(id)a3
{
  BOOL v3 = [(AXSiriSettingsController *)self _typeToSiriEnabled];

  return +[NSNumber numberWithBool:v3];
}

- (void)setTypeToSiriEnabled:(id)a3 specifier:(id)a4
{
  -[AXSiriSettingsController _setTypeToSiriEnabled:](self, "_setTypeToSiriEnabled:", [a3 BOOLValue]);
  typeToSiriGroupSpecifier = self->_typeToSiriGroupSpecifier;
  id v6 = [(AXSiriSettingsController *)self _typeToSiriFooterString];
  [(PSSpecifier *)typeToSiriGroupSpecifier setProperty:v6 forKey:PSFooterTextGroupKey];

  v7 = self->_typeToSiriGroupSpecifier;

  [(AXSiriSettingsController *)self reloadSpecifier:v7 animated:0];
}

- (id)isAlwaysAllowVoiceActivationEnabled:(id)a3
{
  BOOL v3 = [(AXSiriSettingsController *)self _alwaysAllowVoiceActivation];

  return +[NSNumber numberWithBool:v3];
}

- (void)setAlwaysAllowVoiceActivationEnabled:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];

  [(AXSiriSettingsController *)self _setAlwaysAllowVoiceActivation:v5];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AXSiriSettingsController;
  uint64_t v4 = [(AXSiriSettingsController *)&v7 tableView:a3 cellForRowAtIndexPath:a4];
  id v5 = [v4 textLabel];
  [v5 setNumberOfLines:0];

  return v4;
}

- (void)preferencesDidChange:(id)a3
{
  uint64_t v4 = +[AFPreferences sharedPreferences];
  id v5 = [v4 useDeviceSpeakerForTTS];

  if (v5 != self->_useDeviceSpeakerForTTSPreference)
  {
    self->_useDeviceSpeakerForTTSPreference = (int64_t)v5;
    AXPerformBlockOnMainThread();
  }
  id v6 = +[AFPreferences sharedPreferences];
  id v7 = [v6 announceNotificationsOnBuiltInSpeakerEnabled];

  [(AXSiriSettingsController *)self _reloadAnnounceNotificationSettingsGroupForAnnounceOnSpeakerEnabled:v7];
}

id __49__AXSiriSettingsController_preferencesDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateSpecifiersFromPreferences];
}

- (BOOL)_typeToSiriEnabled
{
  return _AFPreferencesTypeToSiriEnabled(self, a2);
}

- (void)_setTypeToSiriEnabled:(BOOL)a3
{
  AFPreferencesSetTypeToSiriEnabled();

  [(AXSiriSettingsController *)self _updateSpecifiersFromPreferences];
}

- (void)_setUseDeviceSpeakerForTTS:(int64_t)a3
{
  id v4 = +[AFPreferences sharedPreferences];
  [v4 setUseDeviceSpeakerForTTS:a3];
}

- (int64_t)_typeToSiriTTSDevice
{
  v2 = +[AFPreferences sharedPreferences];
  id v3 = [v2 useDeviceSpeakerForTTS];

  return (int64_t)v3;
}

- (BOOL)_alwaysPrintSiriResponse
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 siriResponseShouldAlwaysPrint];

  return v3;
}

- (void)_setAlwaysPrintSiriResponse:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AFPreferences sharedPreferences];
  [v4 setSiriResponseShouldAlwaysPrint:v3];
}

- (BOOL)_alwaysAllowVoiceActivation
{
  v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 alwaysAllowVoiceActivation];

  return v3;
}

- (void)_setAlwaysAllowVoiceActivation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[AFPreferences sharedPreferences];
  [v4 setAlwaysAllowVoiceActivation:v3];
}

- (void)event:(int64_t)a3 params:(id)a4 reply:(id)a5
{
}

- (id)_typeToSiriFooterString
{
  [(AXSiriSettingsController *)self _typeToSiriEnabled];
  v2 = AXLocStringKeyForHomeButtonAndExclusiveModel();
  BOOL v3 = settingsLocString(v2, @"Accessibility");

  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXSiriSettingsController;
  [(AXSiriSettingsController *)&v4 viewWillAppear:a3];
  [(AXSiriSettingsController *)self _updateSpecifiersFromPreferences];
}

- (void)willBecomeActive
{
  v3.receiver = self;
  v3.super_class = (Class)AXSiriSettingsController;
  [(AXSiriSettingsController *)&v3 willBecomeActive];
  [(AXSiriSettingsController *)self _updateSpecifiersFromPreferences];
}

- (void)_updateSpecifiersFromPreferences
{
  objc_super v3 = +[AFPreferences sharedPreferences];
  self->_useDeviceSpeakerForTTSPreference = (int64_t)[v3 useDeviceSpeakerForTTS];

  unint64_t v4 = self->_useDeviceSpeakerForTTSPreference - 1;
  if (v4 > 2) {
    id v15 = 0;
  }
  else {
    id v15 = *(id *)&self->AXUISettingsBaseListController_opaque[*off_20A070[v4]];
  }
  uint64_t v5 = PSRadioGroupCheckedSpecifierKey;
  id v6 = [(PSSpecifier *)self->_groupSpecifier propertyForKey:PSRadioGroupCheckedSpecifierKey];
  [(PSSpecifier *)self->_groupSpecifier setProperty:v15 forKey:v5];
  unsigned int v7 = [(AXSiriSettingsController *)self _updateFooterForSpecifier:v15];
  [(AXSiriSettingsController *)self beginUpdates];
  if (v7) {
    [(AXSiriSettingsController *)self reloadSpecifier:self->_groupSpecifier animated:1];
  }
  if (v6 != v15)
  {
    [(AXSiriSettingsController *)self reloadSpecifier:self->_automaticSpecifier animated:1];
    [(AXSiriSettingsController *)self reloadSpecifier:self->_preferSpokenSpecifier animated:1];
    [(AXSiriSettingsController *)self reloadSpecifier:self->_neverSpecifier animated:1];
  }
  v8 = [(AXSiriSettingsController *)self specifierForID:@"ENDPOINTER"];
  v9 = +[AFPreferences sharedPreferences];
  v10 = (char *)[v9 accessibleEndpointerThreshold];

  CFStringRef v11 = @"ENDPOINTER_DEFAULT";
  if (v10 == (unsigned char *)&dword_0 + 2) {
    CFStringRef v11 = @"ENDPOINTER_EXTENDED";
  }
  if (v10 == (unsigned char *)&dword_0 + 3) {
    CFStringRef v12 = @"ENDPOINTER_MAXIMUM";
  }
  else {
    CFStringRef v12 = v11;
  }
  v13 = [(AXSiriSettingsController *)self specifierForID:v12];
  v14 = [v8 propertyForKey:v5];

  if (v14 != v13)
  {
    [v8 setProperty:v13 forKey:v5];
    [(AXSiriSettingsController *)self reloadSpecifier:v8 animated:0];
  }
  [(AXSiriSettingsController *)self endUpdates];
}

- (BOOL)_updateFooterForSpecifier:(id)a3
{
  unint64_t v4 = (PSSpecifier *)a3;
  uint64_t v5 = v4;
  if (self->_automaticSpecifier == v4)
  {
    id v6 = @"VOICE_FEEDBACK_FOOTER_TEXT_AUTOMATIC";
  }
  else if (self->_preferSpokenSpecifier == v4)
  {
    id v6 = @"VOICE_FEEDBACK_FOOTER_PREFER_SPOKEN";
  }
  else if (self->_neverSpecifier == v4)
  {
    AXLocStringKeyForModel();
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = 0;
  }
  unsigned int v7 = [(AXSiriSettingsController *)self _localizeTriggerString:v6];
  uint64_t v8 = PSFooterTextGroupKey;
  v9 = [(PSSpecifier *)self->_groupSpecifier propertyForKey:PSFooterTextGroupKey];
  unsigned __int8 v10 = [v7 isEqualToString:v9];

  if ((v10 & 1) == 0) {
    [(PSSpecifier *)self->_groupSpecifier setProperty:v7 forKey:v8];
  }

  return v10 ^ 1;
}

- (id)_voiceActivationFooterString
{
  objc_super v3 = AXLocStringKeyForModel();
  unint64_t v4 = [(AXSiriSettingsController *)self _localizeTriggerString:v3];

  return v4;
}

- (id)footerVariant
{
  if (AXDeviceIsPhoneIdiom()) {
    v2 = @"IPHONE";
  }
  else {
    v2 = @"IPAD";
  }

  return v2;
}

- (id)_localizeTriggerString:(id)a3
{
  return settingsLocString(a3, @"Accessibility");
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(AXSiriSettingsController *)self specifierAtIndex:[(AXSiriSettingsController *)self indexForIndexPath:v5]];
  if (v6 == self->_groupSpecifier) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)AXSiriSettingsController;
  id v6 = a4;
  [(AXSiriSettingsController *)&v16 tableView:a3 didSelectRowAtIndexPath:v6];
  -[AXSiriSettingsController specifierForIndexPath:](self, "specifierForIndexPath:", v6, v16.receiver, v16.super_class);
  id v7 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [(PSSpecifier *)v7 propertyForKey:@"groupKey"];
  LODWORD(v6) = [v8 isEqualToString:@"VOICE_FEEDBACK"];

  if (v6)
  {
    if (v7 == self->_preferSpokenSpecifier)
    {
      uint64_t useDeviceSpeakerForTTSPreference = 2;
    }
    else if (v7 == self->_automaticSpecifier)
    {
      uint64_t useDeviceSpeakerForTTSPreference = 1;
    }
    else
    {
      if (v7 != self->_neverSpecifier)
      {
        uint64_t useDeviceSpeakerForTTSPreference = self->_useDeviceSpeakerForTTSPreference;
LABEL_15:
        [(AXSiriSettingsController *)self _setUseDeviceSpeakerForTTS:useDeviceSpeakerForTTSPreference];
        [(AXSiriSettingsController *)self _updateSpecifiersFromPreferences];
        goto LABEL_20;
      }
      uint64_t useDeviceSpeakerForTTSPreference = 3;
    }
    self->_uint64_t useDeviceSpeakerForTTSPreference = useDeviceSpeakerForTTSPreference;
    goto LABEL_15;
  }
  unsigned __int8 v10 = [(PSSpecifier *)v7 propertyForKey:@"groupKey"];
  unsigned int v11 = [v10 isEqualToString:@"ENDPOINTER"];

  if (v11)
  {
    CFStringRef v12 = [(PSSpecifier *)v7 propertyForKey:PSIDKey];
    if ([v12 isEqualToString:@"ENDPOINTER_DEFAULT"])
    {
      v13 = +[AFPreferences sharedPreferences];
      v14 = v13;
      uint64_t v15 = 1;
    }
    else if ([v12 isEqualToString:@"ENDPOINTER_EXTENDED"])
    {
      v13 = +[AFPreferences sharedPreferences];
      v14 = v13;
      uint64_t v15 = 2;
    }
    else
    {
      if (![v12 isEqualToString:@"ENDPOINTER_MAXIMUM"])
      {
LABEL_19:

        goto LABEL_20;
      }
      v13 = +[AFPreferences sharedPreferences];
      v14 = v13;
      uint64_t v15 = 3;
    }
    [v13 setAccessibleEndpointerThreshold:v15];

    goto LABEL_19;
  }
LABEL_20:
}

- (double)_speechRateFromValue:(double)a3
{
  id v5 = [(PSSpecifier *)self->_speechRateSpecifier propertyForKey:@"SRSliderMinimumSpeechRate"];
  [v5 floatValue];
  float v7 = v6;

  uint64_t v8 = [(PSSpecifier *)self->_speechRateSpecifier propertyForKey:@"SRSliderMaximumSpeechRate"];
  [v8 floatValue];
  float v10 = v9;

  return v7 + a3 * (float)(v10 - v7);
}

- (void)setupSiriSpeechRateSlider:(id)a3
{
  id v4 = a3;
  id v5 = +[PSSpecifier preferenceSpecifierNamed:0 target:self set:"setSpeechRateFromSliderValue:specifier:" get:"sliderValueForSpeechRate:" detail:0 cell:5 edit:0];
  speechRateSpecifier = self->_speechRateSpecifier;
  self->_speechRateSpecifier = v5;

  [(PSSpecifier *)self->_speechRateSpecifier setProperty:@"SPEECH_RATE_SLIDER" forKey:PSIDKey];
  [(PSSpecifier *)self->_speechRateSpecifier setProperty:&off_22C3C0 forKey:PSDefaultValueKey];
  [(PSSpecifier *)self->_speechRateSpecifier setProperty:&off_22C3D0 forKey:@"SRSliderMinimumSpeechRate"];
  [(PSSpecifier *)self->_speechRateSpecifier setProperty:&off_22C3E0 forKey:@"SRSliderMaximumSpeechRate"];
  [(PSSpecifier *)self->_speechRateSpecifier setProperty:&off_22C3F0 forKey:@"SRSliderDefaultSpeechRate"];
  objc_initWeak(location, self);
  [(PSSpecifier *)self->_speechRateSpecifier setProperty:objc_opt_class() forKey:PSCellClassKey];
  objc_initWeak(&from, self->_speechRateSpecifier);
  float v7 = self->_speechRateSpecifier;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = __54__AXSiriSettingsController_setupSiriSpeechRateSlider___block_invoke;
  v31[3] = &unk_209F98;
  objc_copyWeak(&v32, location);
  uint64_t v8 = objc_retainBlock(v31);
  [(PSSpecifier *)v7 setProperty:v8 forKey:@"SpeechRateFormatterProperty"];

  float v9 = self->_speechRateSpecifier;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = __54__AXSiriSettingsController_setupSiriSpeechRateSlider___block_invoke_2;
  v29[3] = &unk_209FC0;
  objc_copyWeak(&v30, location);
  float v10 = objc_retainBlock(v29);
  [(PSSpecifier *)v9 setProperty:v10 forKey:@"SpeechShouldPlayHapticDistance"];

  unsigned int v11 = self->_speechRateSpecifier;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __54__AXSiriSettingsController_setupSiriSpeechRateSlider___block_invoke_3;
  v27[3] = &unk_209FE8;
  objc_copyWeak(&v28, &from);
  CFStringRef v12 = objc_retainBlock(v27);
  [(PSSpecifier *)v11 setProperty:v12 forKey:@"SpeechRateChangedProperty"];
  v13 = v4;

  v14 = self->_speechRateSpecifier;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = __54__AXSiriSettingsController_setupSiriSpeechRateSlider___block_invoke_4;
  v25[3] = &unk_208798;
  objc_copyWeak(&v26, location);
  uint64_t v15 = objc_retainBlock(v25);
  [(PSSpecifier *)v14 setProperty:v15 forKey:@"SpeechRateSelectedProperty"];

  objc_super v16 = self->_speechRateSpecifier;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = __54__AXSiriSettingsController_setupSiriSpeechRateSlider___block_invoke_5;
  v23[3] = &unk_20A010;
  objc_copyWeak(&v24, &from);
  v17 = objc_retainBlock(v23);
  [(PSSpecifier *)v16 setProperty:v17 forKey:@"SpeechRateProperty"];

  uint64_t v18 = self->_speechRateSpecifier;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = __54__AXSiriSettingsController_setupSiriSpeechRateSlider___block_invoke_6;
  v21[3] = &unk_209F98;
  objc_copyWeak(&v22, &from);
  v19 = objc_retainBlock(v21);
  [(PSSpecifier *)v18 setProperty:v19 forKey:@"SpeechRateForSliderValueProperty"];

  v20 = settingsLocString(@"SPEECH_RATE_SPECIFIER_ACCESSIBILITY_LABEL", @"SiriSettings");
  [(PSSpecifier *)self->_speechRateSpecifier setAccessibilityLabel:v20];

  objc_msgSend(v13, "insertObject:atIndex:", self->_speechRateSpecifier, (char *)objc_msgSend(v13, "indexOfSpecifierWithID:", @"SPEECH_RATE") + 1);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

double __54__AXSiriSettingsController_setupSiriSpeechRateSlider___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _speechRateFromValue:a2];
  double v5 = v4 * 100.0;

  return v5;
}

double __54__AXSiriSettingsController_setupSiriSpeechRateSlider___block_invoke_2(uint64_t a1, double a2, double a3)
{
  double v5 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _speechRateFromValue:a2];
  double v8 = v7;

  id v9 = objc_loadWeakRetained(v5);
  [v9 _speechRateFromValue:a3];
  double v11 = v10;

  return vabdd_f64(v8, v11);
}

void __54__AXSiriSettingsController_setupSiriSpeechRateSlider___block_invoke_3(uint64_t a1, double a2)
{
  objc_super v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = [WeakRetained propertyForKey:@"SRSliderMinimumSpeechRate"];
  [v5 floatValue];
  float v7 = v6;

  id v8 = objc_loadWeakRetained(v3);
  id v9 = [v8 propertyForKey:@"SRSliderMaximumSpeechRate"];
  [v9 floatValue];
  float v11 = v10;

  *(float *)&a2 = v7 + (float)(v11 - v7) * a2;
  id v14 = +[AFPreferences sharedPreferences];
  LODWORD(v12) = LODWORD(a2);
  v13 = +[NSNumber numberWithFloat:v12];
  [v14 setSiriSpeechRate:v13];
}

void __54__AXSiriSettingsController_setupSiriSpeechRateSlider___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSpeechEventCondition];
}

double __54__AXSiriSettingsController_setupSiriSpeechRateSlider___block_invoke_5(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v3 = [WeakRetained propertyForKey:@"SRSliderMinimumSpeechRate"];
  [v3 floatValue];
  float v5 = v4;

  id v6 = objc_loadWeakRetained(v1);
  float v7 = [v6 propertyForKey:@"SRSliderMaximumSpeechRate"];
  [v7 floatValue];
  float v9 = v8;

  float v10 = +[AFPreferences sharedPreferences];
  uint64_t v11 = [v10 siriSpeechRate];

  if (v11) {
    double v12 = (_UNKNOWN **)v11;
  }
  else {
    double v12 = &off_22C3F0;
  }
  [v12 doubleValue];
  double v14 = (v13 - v5) / (float)(v9 - v5);

  return v14;
}

double __54__AXSiriSettingsController_setupSiriSpeechRateSlider___block_invoke_6(uint64_t a1, double a2)
{
  objc_super v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  float v5 = [WeakRetained propertyForKey:@"SRSliderMinimumSpeechRate"];
  [v5 floatValue];
  float v7 = v6;

  id v8 = objc_loadWeakRetained(v3);
  float v9 = [v8 propertyForKey:@"SRSliderMaximumSpeechRate"];
  [v9 floatValue];
  float v11 = v10;

  return (a2 - v7) / (float)(v11 - v7);
}

- (void)_handleSpeechEventCondition
{
  if (!_AXSVoiceOverTouchEnabled())
  {
    if (!self->_siriSession)
    {
      objc_super v3 = (SiriTTSDaemonSession *)objc_opt_new();
      siriSession = self->_siriSession;
      self->_siriSession = v3;
    }
    float v5 = +[AFConnection outputVoice];
    id v6 = objc_alloc((Class)SiriTTSSynthesisVoice);
    float v7 = [v5 languageCode];
    id v8 = [v5 name];
    id v9 = [v6 initWithLanguage:v7 name:v8];

    float v10 = [(AXSiriSettingsController *)self speechRate];
    [v10 doubleValue];
    double v12 = v11;

    id v13 = objc_alloc((Class)SiriTTSSpeechRequest);
    double v14 = [v5 languageCode];
    uint64_t v15 = siriSpeakingSampleLocString(v14, v12);
    id v16 = [v13 initWithText:v15 voice:v9];

    *(float *)&double v17 = v12;
    [v16 setRate:v17];
    if (self->_activeSampleSpeechRequest) {
      -[SiriTTSDaemonSession cancelWithRequest:](self->_siriSession, "cancelWithRequest:");
    }
    activeSampleSpeechRequest = self->_activeSampleSpeechRequest;
    self->_activeSampleSpeechRequest = (SiriTTSSpeechRequest *)v16;
    id v19 = v16;

    v20 = self->_siriSession;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = __55__AXSiriSettingsController__handleSpeechEventCondition__block_invoke;
    v21[3] = &unk_20A038;
    void v21[4] = self;
    [(SiriTTSDaemonSession *)v20 speakWithSpeechRequest:v19 didFinish:v21];
  }
}

void __55__AXSiriSettingsController__handleSpeechEventCondition__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  float v4 = v3;
  if (!v3)
  {
    id v6 = AXLogSettings();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    LOWORD(v13) = 0;
    id v8 = "Spoke siri sample string";
    goto LABEL_7;
  }
  float v5 = (char *)[v3 code];
  id v6 = AXLogSettings();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5 == (unsigned char *)&dword_0 + 1)
  {
    if (!v7) {
      goto LABEL_11;
    }
    LOWORD(v13) = 0;
    id v8 = "Siri sample cancelled early";
LABEL_7:
    id v9 = v6;
    uint32_t v10 = 2;
    goto LABEL_10;
  }
  if (!v7) {
    goto LABEL_11;
  }
  int v13 = 138412290;
  double v14 = v4;
  id v8 = "Failed to speak siri sample string with error: %@";
  id v9 = v6;
  uint32_t v10 = 12;
LABEL_10:
  _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v13, v10);
LABEL_11:

  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = *(void **)(v11 + 264);
  if (v12)
  {
    *(void *)(v11 + 264) = 0;
  }
}

- (id)speechRate
{
  v2 = +[AFPreferences sharedPreferences];
  id v3 = [v2 siriSpeechRate];

  [v3 floatValue];
  if (v4 <= 0.0) {
    float v5 = &off_22C3F0;
  }
  else {
    float v5 = (_UNKNOWN **)v3;
  }
  id v6 = v5;

  return v6;
}

+ (id)speechRateAsLocalizedPercent:(id)a3
{
  return +[NSNumberFormatter localizedStringFromNumber:a3 numberStyle:3];
}

- (id)sliderValueForSpeechRate:(id)a3
{
  id v3 = [a3 propertyForKey:@"SpeechRateProperty"];
  v3[2]();
  float v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v4;
}

- (LAContext)localAuthContext
{
  return self->_localAuthContext;
}

- (void)setLocalAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthContext, 0);
  objc_storeStrong((id *)&self->_bbSettingsGateway, 0);
  objc_storeStrong((id *)&self->_activeSampleSpeechRequest, 0);
  objc_storeStrong((id *)&self->_siriSession, 0);
  objc_storeStrong((id *)&self->_speechRateSpecifier, 0);
  objc_storeStrong((id *)&self->_speechRateGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_announceNotificationsSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_neverSpecifier, 0);
  objc_storeStrong((id *)&self->_automaticSpecifier, 0);
  objc_storeStrong((id *)&self->_preferSpokenSpecifier, 0);
  objc_storeStrong((id *)&self->_typeToSiriSwitchSpecifier, 0);

  objc_storeStrong((id *)&self->_typeToSiriGroupSpecifier, 0);
}

@end