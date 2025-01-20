@interface AssistantBridgeController
- (AssistantBridgeController)init;
- (id)_applicationSuggestionsSpecifierWithBundleId:(id)a3 device:(id)a4;
- (id)_localizeTriggerString:(id)a3;
- (id)_localizedNameForRemoteApp:(id)a3;
- (id)digitalCrownEnabled;
- (id)messageWithoutConfirmationEnabled;
- (id)raiseToSpeakEnabled;
- (id)specifiers;
- (id)triggerPhrase;
- (id)voiceFeedbackMode;
- (id)voiceTriggerEnabled;
- (id)voiceVolume;
- (void)_addHyperlinkStyleToText:(id)a3 inString:(id)a4 action:(SEL)a5 forGroup:(id)a6;
- (void)_showAboutActionSheet;
- (void)_updateAskSiriFooter;
- (void)dealloc;
- (void)languageCodeDidChange;
- (void)preferencesDidChange;
- (void)restrictionsDidChange;
- (void)setAssistantEnabled:(BOOL)a3 withConfirmationAction:(id)a4;
- (void)setDigitalCrownEnabled:(id)a3;
- (void)setMessageWithoutConfirmationEnabled:(id)a3;
- (void)setRaiseToSpeakEnabled:(id)a3;
- (void)setVoiceTriggerEnabled:(id)a3;
- (void)setVoiceVolume:(id)a3;
@end

@implementation AssistantBridgeController

- (AssistantBridgeController)init
{
  v15.receiver = self;
  v15.super_class = (Class)AssistantBridgeController;
  v2 = [(AssistantBridgeController *)&v15 init];
  if (v2)
  {
    v3 = +[NRPairedDeviceRegistry sharedInstance];
    v4 = [v3 getActivePairedDevice];

    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"BFF435BD-ACFF-4AD8-9CC4-4DEA6D51BB3A"];
    v2->_siriSpeaksSupportedHardware = [v4 supportsCapability:v5];

    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"68E9D2AF-A820-45FC-8FB3-92A04428CBF8"];
    v2->_raiseToSpeakSupported = [v4 supportsCapability:v6];

    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"36BD47D1-7193-4236-867F-3555B4AC18B0"];
    v2->_siriResponsesSupported = [v4 supportsCapability:v7];

    v8 = +[AFPreferences sharedPreferences];
    v9 = [v8 nanoLanguageCode];
    v2->_siriSpeaksSupportedLanguage = AFGryphonAssetsExistForLanguage();

    id v10 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"3650D526-DBF6-4230-8502-4508D40210DB"];
    v2->_siriAutoSendSupported = [v4 supportsCapability:v10];

    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v2 selector:"languageCodeDidChange" name:AFLanguageCodeDidChangeNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v2 selector:"preferencesDidChange" name:AFNanoPreferencesDidChangeNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"restrictionsDidChange" name:MCRestrictionChangedNotification object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AssistantBridgeController;
  [(AssistantBridgeController *)&v4 dealloc];
}

- (void)preferencesDidChange
{
  v3 = +[AFPreferences sharedPreferences];
  objc_super v4 = [v3 nanoLanguageCode];
  self->_siriSpeaksSupportedLanguage = AFGryphonAssetsExistForLanguage();

  [(AssistantBridgeController *)self reloadSpecifiers];
}

- (void)restrictionsDidChange
{
  objc_initWeak(&location, self);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_4540;
  v2[3] = &unk_103F8;
  objc_copyWeak(&v3, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (id)specifiers
{
  id v3 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v3)
  {
    uint64_t v47 = OBJC_IVAR___PSListController__specifiers;
    objc_super v4 = [(AssistantBridgeController *)self loadSpecifiersFromPlistName:@"AssistantBridgeSettings" target:self];
    id v5 = [v4 specifierForID:@"HEY_SIRI_SWITCH_ID"];
    uint64_t v6 = [v4 specifierForID:@"VOICE_TRIGGER_ID"];
    v44 = (void *)v6;
    if (+[AssistantBridgeSettingsUtilities isCompactVoiceTriggerAvailable])
    {
      [v4 removeObject:v5];
    }
    else
    {
      [v4 removeObject:v6];
      id v7 = [(AssistantBridgeController *)self _localizeTriggerString:@"VOICE_ACTIVATION"];
      [v5 setName:v7];
    }
    if (!self->_raiseToSpeakSupported)
    {
      v8 = [v4 specifierForID:@"RAISE_TO_SPEAK_SWITCH_ID"];
      [v4 removeObject:v8];
    }
    v9 = [v4 specifierForID:@"VOICE_VOLUME_SLIDER_ID"];
    if (self->_siriSpeaksSupportedHardware && self->_siriSpeaksSupportedLanguage && !self->_siriResponsesSupported)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->PSListController_opaque[OBJC_IVAR___PSViewController__parentController]);

      if (WeakRetained)
      {
        v39 = +[UIImage imageNamed:@"Volume-Min"];
        id v10 = [v39 imageFlippedForRightToLeftLayoutDirection];

        v40 = +[UIImage imageNamed:@"Volume-Max"];
        WeakRetained = [v40 imageFlippedForRightToLeftLayoutDirection];
      }
      else
      {
        id v10 = 0;
      }
      [v9 setProperty:v10 forKey:PSSliderLeftImageKey];
      [v9 setProperty:WeakRetained forKey:PSSliderRightImageKey];
    }
    else
    {
      id v10 = [v4 specifierForID:@"VOICE_FEEDBACK_GROUP_ID"];
      [v4 removeObject:v10];
      WeakRetained = [v4 specifierForID:@"VOICE_FEEDBACK_ID"];
      [v4 removeObject:WeakRetained];
      v12 = [v4 specifierForID:@"VOICE_VOLUME_GROUP_ID"];
      [v4 removeObject:v12];
      [v4 removeObject:v9];
    }
    if (!self->_siriAutoSendSupported)
    {
      v13 = [v4 specifierForID:@"AUTOMATICALLY_SEND_MESSAGES_GROUP_ID"];
      [v4 removeObject:v13];
      v14 = [v4 specifierForID:@"AUTOMATICALLY_SEND_MESSAGES_SWITCH_ID"];
      [v4 removeObject:v14];
    }
    if (!self->_siriResponsesSupported)
    {
      objc_super v15 = [v4 specifierForID:@"SIRI_RESPONSES_GROUP_ID"];
      [v4 removeObject:v15];
      v16 = [v4 specifierForID:@"SIRI_RESPONSES_ID"];
      [v4 removeObject:v16];
    }
    v43 = v9;
    int v17 = AFAssistantRestricted();
    uint64_t v18 = +[NSNumber numberWithBool:v17 ^ 1u];
    uint64_t v19 = PSEnabledKey;
    v45 = v5;
    [v5 setProperty:v18 forKey:PSEnabledKey];
    v20 = [v4 specifierForID:@"VOICE_TRIGGER_ID"];
    [v20 setProperty:v18 forKey:v19];

    v21 = [v4 specifierForID:@"RAISE_TO_SPEAK_SWITCH_ID"];
    [v21 setProperty:v18 forKey:v19];

    v22 = [v4 specifierForID:@"DIGITAL_CROWN_SWITCH_ID"];
    v42 = (void *)v18;
    [v22 setProperty:v18 forKey:v19];

    if ((v17 & 1) != 0
      || (+[AFPreferences sharedPreferences],
          v23 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v24 = [v23 nanoAssistantEnabled],
          v23,
          (v24 & 1) == 0))
    {
      v25 = (char *)[v4 indexOfSpecifierWithID:@"DIGITAL_CROWN_SWITCH_ID"] + 1;
      objc_msgSend(v4, "removeObjectsInRange:", v25, (unsigned char *)objc_msgSend(v4, "indexOfSpecifierWithID:", @"ASSISTANT_SUGGESTIONS_GROUP_ID") - v25);
    }
    v46 = v4;
    v41 = [v4 specifierForID:@"ASSISTANT_SUGGESTIONS_GROUP_ID"];
    v26 = objc_opt_new();
    v27 = +[NRPairedDeviceRegistry sharedInstance];
    v28 = [v27 getActivePairedDevice];

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v29 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"com.apple.NanoMaps", 0);
    id v30 = [v29 countByEnumeratingWithState:&v48 objects:v56 count:16];
    if (v30)
    {
      id v31 = v30;
      uint64_t v32 = *(void *)v49;
      do
      {
        v33 = 0;
        do
        {
          if (*(void *)v49 != v32) {
            objc_enumerationMutation(v29);
          }
          v34 = [(AssistantBridgeController *)self _applicationSuggestionsSpecifierWithBundleId:*(void *)(*((void *)&v48 + 1) + 8 * (void)v33) device:v28];
          if (v34)
          {
            v35 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v53 = "-[AssistantBridgeController specifiers]";
              __int16 v54 = 2112;
              v55 = v34;
              _os_log_debug_impl(&dword_0, v35, OS_LOG_TYPE_DEBUG, "%s AssistantBridge: adding %@", buf, 0x16u);
            }
            [v26 addObject:v34];
          }

          v33 = (char *)v33 + 1;
        }
        while (v31 != v33);
        id v31 = [v29 countByEnumeratingWithState:&v48 objects:v56 count:16];
      }
      while (v31);
    }

    objc_msgSend(v46, "ps_insertObjectsFromArray:afterObject:", v26, v41);
    id v36 = [v46 copy];
    v37 = *(void **)&self->PSListController_opaque[v47];
    *(void *)&self->PSListController_opaque[v47] = v36;

    [(AssistantBridgeController *)self _updateAskSiriFooter];
    id v3 = *(void **)&self->PSListController_opaque[v47];
  }

  return v3;
}

- (id)_applicationSuggestionsSpecifierWithBundleId:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_A6D0();
  }
  v8 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
  [v8 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
  [v8 setProperty:v6 forKey:PSIDKey];
  [v8 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v8 setDetailControllerClass:objc_opt_class()];
  [v8 setProperty:v6 forKey:PSLazyIconAppID];
  [v8 setProperty:&__kCFBooleanTrue forKey:PSLazyIconLoading];
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_A654();
  }
  v9 = +[ACXDeviceConnection sharedDeviceConnection];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_4E74;
  v14[3] = &unk_10448;
  id v15 = v6;
  id v10 = v8;
  id v16 = v10;
  int v17 = self;
  id v11 = v6;
  [v9 fetchApplicationOnPairedDevice:v7 withBundleID:v11 completion:v14];

  id v12 = v10;
  return v12;
}

- (id)_localizedNameForRemoteApp:(id)a3
{
  id v3 = a3;
  uint64_t v4 = _kCFBundleDisplayNameKey;
  id v5 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", _kCFBundleDisplayNameKey, 0);
  id v6 = +[NSLocale preferredLanguages];
  id v7 = [v3 localizedInfoPlistStringsForKeys:v5 fetchingFirstMatchingLocalizationInList:v6];

  if (v7)
  {
    v8 = [v7 objectForKeyedSubscript:v4];
  }
  else
  {
    v8 = 0;
  }
  if (![v8 length])
  {
    uint64_t v9 = [v3 applicationName];

    v8 = (void *)v9;
  }

  return v8;
}

- (id)voiceTriggerEnabled
{
  BOOL v2 = +[AssistantBridgeSettingsUtilities voiceTriggerEnabled];

  return +[NSNumber numberWithBool:v2];
}

- (void)setVoiceTriggerEnabled:(id)a3
{
  id v4 = [a3 BOOLValue];
  id v5 = [(AssistantBridgeController *)self raiseToSpeakEnabled];
  if ([v5 BOOLValue])
  {

LABEL_4:
    id v8 = +[AFPreferences sharedPreferences];
    [v8 setNanoPhraseSpotterEnabled:v4];

    return;
  }
  id v6 = [(AssistantBridgeController *)self digitalCrownEnabled];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7) {
    goto LABEL_4;
  }

  [(AssistantBridgeController *)self setAssistantEnabled:v4 withConfirmationAction:&stru_10488];
}

- (id)_localizeTriggerString:(id)a3
{
  id v3 = a3;
  id v4 = +[AFPreferences sharedPreferences];
  id v5 = [v4 nanoLanguageCode];

  id v6 = +[VTPreferences sharedPreferences];
  unsigned __int8 v7 = [v6 localizedTriggerPhraseForLanguageCode:v5];

  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v15 = "-[AssistantBridgeController _localizeTriggerString:]";
    __int16 v16 = 2112;
    int v17 = v5;
    __int16 v18 = 2112;
    uint64_t v19 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%s languageCode: %@, triggerPhrase: %@", buf, 0x20u);
  }
  uint64_t v9 = [v7 stringByReplacingOccurrencesOfString:@" " withString:@" "];
  id v10 = +[NSBundle bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:v3 value:&stru_10A70 table:@"AssistantBridgeSettings"];

  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v9);

  return v12;
}

- (id)triggerPhrase
{
  BOOL v2 = [(AssistantBridgeController *)self voiceTriggerEnabled];
  unsigned __int8 v3 = [v2 BOOLValue];

  if (v3)
  {
    id v4 = +[AFPreferences sharedPreferences];
    id v5 = (char *)[v4 nanoVTPhraseType];

    if (v5 == (unsigned char *)&dword_0 + 1)
    {
      uint64_t v6 = +[AssistantBridgeSettingsUtilities triggerPhraseChoiceHSJS];
    }
    else
    {
      if (v5) {
        goto LABEL_8;
      }
      uint64_t v6 = +[AssistantBridgeSettingsUtilities triggerPhraseChoiceHS];
    }
    id v4 = (void *)v6;
  }
  else
  {
    unsigned __int8 v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v4 = [v7 localizedStringForKey:@"VOICE_TRIGGER_DISABLED" value:&stru_10A70 table:@"AssistantBridgeSettings"];
  }
LABEL_8:

  return v4;
}

- (void)setAssistantEnabled:(BOOL)a3 withConfirmationAction:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_5630;
  v7[3] = &unk_103F8;
  objc_copyWeak(&v8, &location);
  +[AssistantBridgeSettingsUtilities setAssistantEnabled:v4 alertPresenter:self confirmationAction:v6 alertPresentationCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)raiseToSpeakEnabled
{
  BOOL v2 = +[AssistantBridgeSettingsUtilities raiseToSpeakEnabled];

  return +[NSNumber numberWithBool:v2];
}

- (void)setRaiseToSpeakEnabled:(id)a3
{
  id v4 = [a3 BOOLValue];
  id v5 = [(AssistantBridgeController *)self voiceTriggerEnabled];
  if ([v5 BOOLValue])
  {

LABEL_4:
    id v8 = +[AFPreferences sharedPreferences];
    [v8 setNanoRaiseToSpeakEnabled:v4];

    return;
  }
  id v6 = [(AssistantBridgeController *)self digitalCrownEnabled];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7) {
    goto LABEL_4;
  }

  [(AssistantBridgeController *)self setAssistantEnabled:v4 withConfirmationAction:&stru_104A8];
}

- (id)digitalCrownEnabled
{
  BOOL v2 = +[AssistantBridgeSettingsUtilities digitalCrownEnabled];

  return +[NSNumber numberWithBool:v2];
}

- (void)setDigitalCrownEnabled:(id)a3
{
  id v4 = [a3 BOOLValue];
  id v5 = [(AssistantBridgeController *)self voiceTriggerEnabled];
  if ([v5 BOOLValue])
  {

LABEL_4:
    id v8 = +[AFPreferences sharedPreferences];
    [v8 setNanoCrownActivationEnabled:v4];

    return;
  }
  id v6 = [(AssistantBridgeController *)self raiseToSpeakEnabled];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7) {
    goto LABEL_4;
  }

  [(AssistantBridgeController *)self setAssistantEnabled:v4 withConfirmationAction:&stru_104C8];
}

- (id)messageWithoutConfirmationEnabled
{
  BOOL v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v2 nanoMessageWithoutConfirmationEnabled]);

  return v3;
}

- (void)setMessageWithoutConfirmationEnabled:(id)a3
{
  id v3 = [a3 BOOLValue];
  id v4 = +[AFPreferences sharedPreferences];
  [v4 setNanoMessageWithoutConfirmationEnabled:v3];
}

- (void)_updateAskSiriFooter
{
  unsigned int v3 = +[AssistantBridgeSettingsUtilities voiceTriggerEnabled];
  unsigned int v4 = +[AssistantBridgeSettingsUtilities raiseToSpeakEnabled];
  unsigned int v5 = +[AssistantBridgeSettingsUtilities digitalCrownEnabled];
  id v6 = &AFAssistantRestricted_ptr;
  if (!v3)
  {
    id v15 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v7 = v15;
    if (v4)
    {
      if (v5) {
        CFStringRef v16 = @"ACTIVATION_FOOTER_CROWN_AND_RAISE_TO_SPEAK";
      }
      else {
        CFStringRef v16 = @"ACTIVATION_FOOTER_RAISE_TO_SPEAK_ONLY";
      }
    }
    else if (v5)
    {
      CFStringRef v16 = @"ACTIVATION_FOOTER_CROWN_ONLY";
    }
    else
    {
      CFStringRef v16 = @"ACTIVATION_FOOTER_ALL_DISABLED";
    }
    id v29 = [v15 localizedStringForKey:v16 value:&stru_10A70 table:@"AssistantBridgeSettings"];
    goto LABEL_31;
  }
  unsigned __int8 v7 = +[AssistantBridgeSettingsUtilities languageCode];
  id v8 = +[VTPreferences sharedPreferences];
  uint64_t v9 = [v8 localizedTriggerPhraseForLanguageCode:v7];

  id v10 = +[VTPreferences sharedPreferences];
  id v11 = [v10 localizedCompactTriggerPhraseForLanguageCode:v7];

  if (+[AssistantBridgeSettingsUtilities isCompactVoiceTriggerAvailable])
  {
    id v12 = +[AFPreferences sharedPreferences];
    v13 = (char *)[v12 nanoVTPhraseType];

    BOOL v14 = v13 == (unsigned char *)&dword_0 + 1;
  }
  else
  {
    BOOL v14 = 0;
  }
  int v17 = +[NSBundle bundleForClass:objc_opt_class()];
  __int16 v18 = v17;
  if (!v4)
  {
    if (v5)
    {
      if (v14)
      {
        CFStringRef v19 = @"ACTIVATION_FOOTER_BOTH_VOICE_TRIGGERS_AND_CROWN";
        goto LABEL_24;
      }
      CFStringRef v21 = @"ACTIVATION_FOOTER_HS_AND_CROWN";
    }
    else
    {
      if (v14)
      {
        CFStringRef v19 = @"ACTIVATION_FOOTER_BOTH_VOICE_TRIGGERS";
        goto LABEL_24;
      }
      CFStringRef v21 = @"ACTIVATION_FOOTER_HS_ONLY";
    }
LABEL_29:
    v20 = [v17 localizedStringForKey:v21 value:&stru_10A70 table:@"AssistantBridgeSettings"];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v9, v28);
    goto LABEL_30;
  }
  if (!v5)
  {
    if (v14)
    {
      CFStringRef v19 = @"ACTIVATION_FOOTER_BOTH_VOICE_TRIGGERS_AND_RAISE_TO_SPEAK";
      goto LABEL_24;
    }
    CFStringRef v21 = @"ACTIVATION_FOOTER_HS_AND_RAISE_TO_SPEAK";
    goto LABEL_29;
  }
  if (!v14)
  {
    CFStringRef v21 = @"ACTIVATION_FOOTER_HS_RAISE_TO_SPEAK_AND_CROWN";
    goto LABEL_29;
  }
  CFStringRef v19 = @"ACTIVATION_FOOTER_BOTH_VOICE_TRIGGERS_RAISE_TO_SPEAK_AND_CROWN_ENABLED";
LABEL_24:
  v20 = [v17 localizedStringForKey:v19 value:&stru_10A70 table:@"AssistantBridgeSettings"];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v11, v9);
LABEL_30:
  id v29 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = &AFAssistantRestricted_ptr;
LABEL_31:

  v22 = +[NSBundle bundleForClass:objc_opt_class()];
  v23 = [v22 localizedStringForKey:@"ACTIVATION_FOOTER_PRIVACY_LINK_TEXT" value:&stru_10A70 table:@"AssistantBridgeSettings"];

  unsigned __int8 v24 = [v6[91] stringWithFormat:@"%@ %@", v29, v23];
  v25 = [*(id *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers] specifierForID:@"ASK_SIRI_GROUP_ID"];
  [v25 setProperty:v24 forKey:PSFooterTextGroupKey];
  v26 = (objc_class *)objc_opt_class();
  v27 = NSStringFromClass(v26);
  [v25 setProperty:v27 forKey:PSFooterCellClassGroupKey];

  [(AssistantBridgeController *)self _addHyperlinkStyleToText:v23 inString:v24 action:"_showAboutActionSheet" forGroup:v25];
}

- (void)_addHyperlinkStyleToText:(id)a3 inString:(id)a4 action:(SEL)a5 forGroup:(id)a6
{
  id v20 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = [v11 propertyForKey:PSFooterCellClassGroupKey];
  v13 = (objc_class *)objc_opt_class();
  BOOL v14 = NSStringFromClass(v13);
  unsigned __int8 v15 = [v12 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    CFStringRef v16 = (objc_class *)objc_opt_class();
    int v17 = NSStringFromClass(v16);
    +[NSException raise:NSInternalInconsistencyException, @"Group must use %@ as footer cell class", v17 format];
  }
  id v18 = [v10 rangeOfString:v20];
  if (v19) {
    objc_msgSend(v11, "addFooterHyperlinkWithRange:target:action:", v18, v19, self, a5);
  }
}

- (void)_showAboutActionSheet
{
  id v3 = +[OBPrivacyPresenter presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.siri"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)languageCodeDidChange
{
  id v3 = +[AFPreferences sharedPreferences];
  unsigned int v4 = [v3 nanoLanguageCode];
  self->_siriSpeaksSupportedLanguage = AFGryphonAssetsExistForLanguage();

  [(AssistantBridgeController *)self reloadSpecifiers];
}

- (id)voiceFeedbackMode
{
  BOOL v2 = +[AFPreferences sharedPreferences];
  id v3 = (char *)[v2 nanoUseDeviceSpeakerForTTS];

  if (v3 == (unsigned char *)&dword_0 + 1)
  {
    unsigned int v4 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v5 = v4;
    CFStringRef v6 = @"VOICE_FEEDBACK_CONTROL_WITH_SILENT_MODE";
  }
  else
  {
    unsigned int v4 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v5 = v4;
    if (v3 == (unsigned char *)&dword_0 + 2) {
      CFStringRef v6 = @"VOICE_FEEDBACK_ALWAYS_ON";
    }
    else {
      CFStringRef v6 = @"VOICE_FEEDBACK_HEADPHONES_ONLY";
    }
  }
  unsigned __int8 v7 = [v4 localizedStringForKey:v6 value:&stru_10A70 table:@"AssistantBridgeSettings"];

  return v7;
}

- (id)voiceVolume
{
  BOOL v2 = +[AFPreferences sharedPreferences];
  [v2 nanoTTSSpeakerVolume];
  id v3 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

  return v3;
}

- (void)setVoiceVolume:(id)a3
{
  [a3 floatValue];
  int v4 = v3;
  id v6 = +[AFPreferences sharedPreferences];
  LODWORD(v5) = v4;
  [v6 setNanoTTSSpeakerVolume:v5];
}

@end