@interface ADAssistantProperties
- (BOOL)_getHasHomekitHome;
- (BOOL)_getIsAppleIntelligenceAvailable;
- (BOOL)_getIsAppleIntelligenceEnabled;
- (BOOL)_getIsAppleIntelligenceHardwareCapable;
- (BOOL)_getIsAssistantEnabled;
- (BOOL)_getIsChatGPTConfirmationAlwaysRequired;
- (BOOL)_getIsChatGPTEnabled;
- (BOOL)_getIsChatGPTSetUpPrompts;
- (BOOL)_getIsMteUploadEnabled;
- (BOOL)_getIsPreciseLocationEnabled;
- (id)_getAppleIntelligenceProperties;
- (id)_getGradingOptInStateChanges;
- (id)_getInputLocale;
- (id)_getODDHomeKitProperties;
- (id)_getODDOptInProperties;
- (id)_getODDVoiceProperties;
- (id)_getVoiceAccentWithVoiceInfo:(id)a3;
- (id)_getVoiceTriggerSettings;
- (id)getODDAssistantProperties;
- (int)_getChatGPTAccountType;
- (int)_getListenForSettings;
- (int)_getLocationAccessPermission;
- (int)_getSiriDataSharingOptInStatus;
- (int)_getVoiceGenderWithVoiceInfo:(id)a3;
- (int)_getVoiceNameWithVoiceInfo:(id)a3;
- (uint64_t)_getIsServerUserDataSyncEnabled;
@end

@implementation ADAssistantProperties

- (int)_getLocationAccessPermission
{
  if (!+[CLLocationManager locationServicesEnabled]) {
    return 1;
  }
  v2 = AFEffectiveSiriBundlePathForLocation();
  unsigned int v3 = +[CLLocationManager authorizationStatusForBundlePath:v2];

  if (v3 - 1 > 3) {
    return 4;
  }
  else {
    return dword_1003E2A50[v3 - 1];
  }
}

- (BOOL)_getIsPreciseLocationEnabled
{
  id v2 = objc_alloc((Class)CLLocationManager);
  unsigned int v3 = AFEffectiveSiriBundleForLocation();
  id v4 = [v2 initWithEffectiveBundle:v3];

  LOBYTE(v3) = [v4 accuracyAuthorization] == 0;
  return (char)v3;
}

- (int)_getSiriDataSharingOptInStatus
{
  uint64_t v2 = _AFPreferencesSiriDataSharingOptInStatus();
  return +[ADAssistantPropertiesUtils SISchemaDataSharingOptInStateFrom:v2];
}

- (BOOL)_getHasHomekitHome
{
  uint64_t v2 = AFAppleAudioDeviceConnectedInLast24Hours();
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)_getVoiceTriggerSettings
{
  id v2 = objc_alloc_init((Class)SISchemaSiriVoiceTriggerSettings);
  [v2 setIsHeySiriTriggerPhraseEnabled:0];
  [v2 setIsJustSiriTriggerPhraseEnabled:0];
  BOOL v3 = +[VTPreferences sharedPreferences];
  unsigned int v4 = [v3 voiceTriggerEnabled];

  if (v4)
  {
    v5 = +[VTPreferences sharedPreferences];
    uint64_t v8 = 0;
    id v6 = [v5 getUserPreferredVoiceTriggerPhraseTypeForDeviceType:0 endpointId:0 error:&v8];

    if ((unint64_t)v6 <= 1)
    {
      [v2 setIsHeySiriTriggerPhraseEnabled:1];
      [v2 setIsJustSiriTriggerPhraseEnabled:v6];
    }
  }
  return v2;
}

- (int)_getListenForSettings
{
  id v2 = [(ADAssistantProperties *)self _getVoiceTriggerSettings];
  int v3 = +[ADAssistantPropertiesUtils ODDSiriSchemaODDListenForFrom:v2];

  return v3;
}

- (id)_getGradingOptInStateChanges
{
  id v2 = +[AFPreferences sharedPreferences];
  int v3 = [v2 siriDataSharingOptInStatusHistory];
  id v4 = [v3 count];
  if ((unint64_t)v4 >= 5) {
    uint64_t v5 = 5;
  }
  else {
    uint64_t v5 = (uint64_t)v4;
  }
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "ADGradingOptInStateChangesHistory";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v5;
    *(_WORD *)&buf[22] = 2112;
    v12 = (uint64_t (*)(uint64_t, uint64_t))v2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Fetching %lu most recent siri data sharing opt-in status change entries from preferences %@", buf, 0x20u);
  }
  v7 = objc_msgSend(v3, "subarrayWithRange:", 0, v5);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v12 = sub_1001153A8;
  v13 = sub_1001153B8;
  id v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001153C0;
  v10[3] = &unk_1005027E0;
  v10[4] = buf;
  v10[5] = v5;
  [v7 enumerateObjectsUsingBlock:v10];
  id v8 = *(id *)(*(void *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v8;
}

- (BOOL)_getIsMteUploadEnabled
{
  id v2 = +[AFSiriDataSharingSensitivityManager shared];
  char v3 = [v2 isOptedOutOfMTE] ^ 1;

  return v3;
}

- (int)_getVoiceNameWithVoiceInfo:(id)a3
{
  char v3 = [a3 name];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 uppercaseString];
    id v6 = +[NSString stringWithFormat:@"VOICENAME_%@", v5];
  }
  else
  {
    id v6 = @"VOICENAME_UNKNOWN";
  }
  v7 = v6;
  if ([(__CFString *)v7 isEqualToString:@"VOICENAME_UNKNOWN"])
  {
    int v8 = 0;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_AARON"])
  {
    int v8 = 1;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_AIDAN"])
  {
    int v8 = 2;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_AKASH"])
  {
    int v8 = 3;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_ALEKSEI"])
  {
    int v8 = 4;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_ALVA"])
  {
    int v8 = 5;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_AMELIE"])
  {
    int v8 = 6;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_ANGEL"])
  {
    int v8 = 7;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_ARTHUR"])
  {
    int v8 = 8;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_AXEL"])
  {
    int v8 = 9;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_BEATRIZ"])
  {
    int v8 = 10;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_CARMEN"])
  {
    int v8 = 11;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_CARMIT"])
  {
    int v8 = 12;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_CATHERINE"])
  {
    int v8 = 13;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_CHENGHAN"])
  {
    int v8 = 14;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_DAMAYANTI"])
  {
    int v8 = 15;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_DAMON"])
  {
    int v8 = 16;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_DANIEL"])
  {
    int v8 = 17;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_DEDEC"])
  {
    int v8 = 18;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_DEDED"])
  {
    int v8 = 19;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_ELIF"])
  {
    int v8 = 20;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_ELLEN"])
  {
    int v8 = 21;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_ELSE"])
  {
    int v8 = 22;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_ENGBC"])
  {
    int v8 = 23;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_ENGBD"])
  {
    int v8 = 24;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_FRANCESCA"])
  {
    int v8 = 25;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_GORDON"])
  {
    int v8 = 26;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_HATTORI"])
  {
    int v8 = 27;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_HELENA"])
  {
    int v8 = 28;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_HIRO"])
  {
    int v8 = 29;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_HOYIN"])
  {
    int v8 = 30;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_INGRID"])
  {
    int v8 = 31;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_JENS"])
  {
    int v8 = 32;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_JINSOO"])
  {
    int v8 = 33;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_KAAN"])
  {
    int v8 = 34;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_KANYA"])
  {
    int v8 = 35;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_KAYAN"])
  {
    int v8 = 36;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_KLAAR"])
  {
    int v8 = 37;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_LEONA"])
  {
    int v8 = 38;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_LIMU"])
  {
    int v8 = 39;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_LINFEI"])
  {
    int v8 = 40;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_LUCIANA"])
  {
    int v8 = 41;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_LUISA"])
  {
    int v8 = 42;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_MAEVE"])
  {
    int v8 = 43;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_MAGED"])
  {
    int v8 = 44;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_MARIE"])
  {
    int v8 = 45;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_MARIUS"])
  {
    int v8 = 46;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_MARTHA"])
  {
    int v8 = 47;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_MARTIN"])
  {
    int v8 = 48;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_MEIJIA"])
  {
    int v8 = 49;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_MINJI"])
  {
    int v8 = 50;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_MOIRA"])
  {
    int v8 = 51;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_NANDO"])
  {
    int v8 = 52;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_NICKY"])
  {
    int v8 = 53;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_NORA"])
  {
    int v8 = 54;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_OREN"])
  {
    int v8 = 55;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_PAOLO"])
  {
    int v8 = 56;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_PAULINA"])
  {
    int v8 = 57;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_PIERRE"])
  {
    int v8 = 58;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_PIETER"])
  {
    int v8 = 59;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_QUINN"])
  {
    int v8 = 60;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_RIYA"])
  {
    int v8 = 61;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_SAKURA"])
  {
    int v8 = 62;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_SAMER"])
  {
    int v8 = 63;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_SANDRA"])
  {
    int v8 = 64;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_SARA"])
  {
    int v8 = 65;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_SATU"])
  {
    int v8 = 66;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_SHUFEN"])
  {
    int v8 = 67;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_SIMONE"])
  {
    int v8 = 68;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_SINJI"])
  {
    int v8 = 69;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_SOHA"])
  {
    int v8 = 70;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_SOPHIE"])
  {
    int v8 = 71;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_SUVI"])
  {
    int v8 = 72;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_TESSA"])
  {
    int v8 = 73;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_THTHA"])
  {
    int v8 = 74;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_THTHB"])
  {
    int v8 = 75;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_TILDE"])
  {
    int v8 = 76;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_TOPI"])
  {
    int v8 = 77;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_VINCENT"])
  {
    int v8 = 78;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_XANDER"])
  {
    int v8 = 79;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_YASMIN"])
  {
    int v8 = 80;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_YELDA"])
  {
    int v8 = 81;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_YELENA"])
  {
    int v8 = 82;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_YUNA"])
  {
    int v8 = 83;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_YUSHU"])
  {
    int v8 = 84;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_ZIV"])
  {
    int v8 = 85;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_MSMYA"])
  {
    int v8 = 86;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_MSMYB"])
  {
    int v8 = 87;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_ZHCNC"])
  {
    int v8 = 88;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_ZHCND"])
  {
    int v8 = 89;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_VIVNA"])
  {
    int v8 = 90;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_VIVNB"])
  {
    int v8 = 91;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_VIVNC"])
  {
    int v8 = 92;
  }
  else if ([(__CFString *)v7 isEqualToString:@"VOICENAME_VIVND"])
  {
    int v8 = 93;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)_getVoiceAccentWithVoiceInfo:(id)a3
{
  char v3 = [a3 languageCode];
  id v4 = +[SIUtilities convertLanguageCodeToSchemaLocale:v3];

  return +[ADAssistantPropertiesUtils SISchemaLocaleToSISchemaISOLocale:v4];
}

- (int)_getVoiceGenderWithVoiceInfo:(id)a3
{
  id v3 = [a3 gender];
  return +[ADAssistantPropertiesUtils SISchemaVoiceGenderFromAFVoiceGender:v3];
}

- (id)_getInputLocale
{
  id v2 = objc_alloc_init((Class)SISchemaISOLocale);
  id v3 = +[ADPreferences sharedPreferences];
  id v4 = [v3 languageCode];

  if (v4)
  {
    uint64_t v5 = +[ADAssistantPropertiesUtils SISchemaLocaleToSISchemaISOLocale:](ADAssistantPropertiesUtils, "SISchemaLocaleToSISchemaISOLocale:", +[SIUtilities convertLanguageCodeToSchemaLocale:v4]);

    id v2 = (id)v5;
  }

  return v2;
}

- (BOOL)_getIsAssistantEnabled
{
  id v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  return v3;
}

- (BOOL)_getIsChatGPTSetUpPrompts
{
  unsigned int v2 = +[GATSettings setupPrompt];
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    id v6 = "-[ADAssistantProperties _getIsChatGPTSetUpPrompts]";
    __int16 v7 = 1024;
    unsigned int v8 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s #ODD: prompt=%d", (uint8_t *)&v5, 0x12u);
  }
  return v2;
}

- (int)_getChatGPTAccountType
{
  unsigned int v2 = (char *)+[GATSettings accountType];
  if ((unint64_t)(v2 - 1) < 3) {
    int v3 = (int)v2;
  }
  else {
    int v3 = 0;
  }
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    __int16 v7 = "-[ADAssistantProperties _getChatGPTAccountType]";
    __int16 v8 = 1024;
    int v9 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s #ODD: type=%d", (uint8_t *)&v6, 0x12u);
  }
  return v3;
}

- (BOOL)_getIsChatGPTConfirmationAlwaysRequired
{
  unsigned int v2 = +[GATSettings useConfirmationPrompts];
  int v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    int v6 = "-[ADAssistantProperties _getIsChatGPTConfirmationAlwaysRequired]";
    __int16 v7 = 1024;
    unsigned int v8 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s #ODD: confirmation=%d", (uint8_t *)&v5, 0x12u);
  }
  return v2;
}

- (BOOL)_getIsChatGPTEnabled
{
  unsigned int v2 = +[GATSettings isEnabled];
  int v3 = AFMontaraRestricted() ^ 1;
  id v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315650;
    __int16 v7 = "-[ADAssistantProperties _getIsChatGPTEnabled]";
    __int16 v8 = 1024;
    unsigned int v9 = v2;
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s #ODD: enabled=%d allowed=%d", (uint8_t *)&v6, 0x18u);
  }
  return v3 & v2;
}

- (BOOL)_getIsAppleIntelligenceAvailable
{
  uint64_t v8 = 2;
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x2050000000;
  unsigned int v2 = (void *)qword_100585BC8;
  uint64_t v12 = qword_100585BC8;
  if (!qword_100585BC8)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10011C8C4;
    id v14 = &unk_10050E318;
    v15 = &v9;
    sub_10011C8C4((uint64_t)buf);
    unsigned int v2 = (void *)v10[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v9, 8);
  unsigned int v4 = [v3 shouldBeShownInSettingsReturningAvailabilityStatus:&v8];
  unsigned int v5 = +[AFSystemAssistantExperienceStatusManager isSAEEnabled];
  int v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&buf[4] = "-[ADAssistantProperties _getIsAppleIntelligenceAvailable]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s #ODD: isAvailableInSettings=%d isSAEEnabled=%d", buf, 0x18u);
  }
  return v4;
}

- (BOOL)_getIsAppleIntelligenceHardwareCapable
{
  int v2 = AFHasGMSCapabilityUnembargoed();
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315394;
    int v6 = "-[ADAssistantProperties _getIsAppleIntelligenceHardwareCapable]";
    __int16 v7 = 1024;
    int v8 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s #ODD: %d", (uint8_t *)&v5, 0x12u);
  }
  return v2;
}

- (BOOL)_getIsAppleIntelligenceEnabled
{
  id v2 = objc_alloc_init((Class)CSFGMOptIn);
  unsigned int v3 = [v2 isOptedIn];
  unsigned int v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315394;
    __int16 v7 = "-[ADAssistantProperties _getIsAppleIntelligenceEnabled]";
    __int16 v8 = 1024;
    unsigned int v9 = v3;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s #ODD: %d", (uint8_t *)&v6, 0x12u);
  }

  return v3;
}

- (id)_getODDHomeKitProperties
{
  unsigned int v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    __int16 v7 = "-[ADAssistantProperties _getODDHomeKitProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDHomeKitProperties);
  objc_msgSend(v4, "setHasHomekitHome:", -[ADAssistantProperties _getHasHomekitHome](self, "_getHasHomekitHome"));
  return v4;
}

- (id)_getODDOptInProperties
{
  unsigned int v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 136315138;
    __int16 v8 = "-[ADAssistantProperties _getODDOptInProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDOptInProperties);
  objc_msgSend(v4, "setIsMteUploadEnabled:", -[ADAssistantProperties _getIsMteUploadEnabled](self, "_getIsMteUploadEnabled"));
  objc_msgSend(v4, "setDataSharingOptInStatus:", -[ADAssistantProperties _getSiriDataSharingOptInStatus](self, "_getSiriDataSharingOptInStatus"));
  int v5 = [(ADAssistantProperties *)self _getGradingOptInStateChanges];
  [v4 setGradingOptInStateChanges:v5];

  objc_msgSend(v4, "setIsServerUserDataSyncEnabled:", -[ADAssistantProperties _getIsServerUserDataSyncEnabled](self, "_getIsServerUserDataSyncEnabled"));
  return v4;
}

- (id)_getODDVoiceProperties
{
  unsigned int v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315138;
    __int16 v10 = "-[ADAssistantProperties _getODDVoiceProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v9, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDVoiceProperties);
  int v5 = +[ADPreferences sharedPreferences];
  int v6 = [v5 outputVoice];

  objc_msgSend(v4, "setGender:", -[ADAssistantProperties _getVoiceGenderWithVoiceInfo:](self, "_getVoiceGenderWithVoiceInfo:", v6));
  int v7 = [(ADAssistantProperties *)self _getVoiceAccentWithVoiceInfo:v6];
  [v4 setAccent:v7];

  objc_msgSend(v4, "setName:", -[ADAssistantProperties _getVoiceNameWithVoiceInfo:](self, "_getVoiceNameWithVoiceInfo:", v6));
  return v4;
}

- (id)_getAppleIntelligenceProperties
{
  id v3 = objc_alloc_init((Class)ODDSiriSchemaODDAppleIntelligenceProperties);
  objc_msgSend(v3, "setIsAppleIntelligenceEnabled:", -[ADAssistantProperties _getIsAppleIntelligenceEnabled](self, "_getIsAppleIntelligenceEnabled"));
  objc_msgSend(v3, "setIsAppleIntelligenceHardwareCapable:", -[ADAssistantProperties _getIsAppleIntelligenceHardwareCapable](self, "_getIsAppleIntelligenceHardwareCapable"));
  objc_msgSend(v3, "setIsAppleIntelligenceAvailable:", -[ADAssistantProperties _getIsAppleIntelligenceAvailable](self, "_getIsAppleIntelligenceAvailable"));
  objc_msgSend(v3, "setIsChatGPTEnabled:", -[ADAssistantProperties _getIsChatGPTEnabled](self, "_getIsChatGPTEnabled"));
  objc_msgSend(v3, "setIsChatGPTConfirmationAlwaysRequired:", -[ADAssistantProperties _getIsChatGPTConfirmationAlwaysRequired](self, "_getIsChatGPTConfirmationAlwaysRequired"));
  objc_msgSend(v3, "setChatGPTAccountType:", -[ADAssistantProperties _getChatGPTAccountType](self, "_getChatGPTAccountType"));
  objc_msgSend(v3, "setIsChatGPTSetUpPrompts:", -[ADAssistantProperties _getIsChatGPTSetUpPrompts](self, "_getIsChatGPTSetUpPrompts"));
  return v3;
}

- (id)getODDAssistantProperties
{
  id v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 136315138;
    uint64_t v12 = "-[ADAssistantProperties getODDAssistantProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v11, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDAssistantProperties);
  objc_msgSend(v4, "setIsAssistantEnabled:", -[ADAssistantProperties _getIsAssistantEnabled](self, "_getIsAssistantEnabled"));
  int v5 = [(ADAssistantProperties *)self _getInputLocale];
  [v4 setInputLocale:v5];

  objc_msgSend(v4, "setListenFor:", -[ADAssistantProperties _getListenForSettings](self, "_getListenForSettings"));
  objc_msgSend(v4, "setIsPreciseLocationEnabled:", -[ADAssistantProperties _getIsPreciseLocationEnabled](self, "_getIsPreciseLocationEnabled"));
  int v6 = [(ADAssistantProperties *)self _getODDVoiceProperties];
  [v4 setVoice:v6];

  int v7 = [(ADAssistantProperties *)self _getAppleIntelligenceProperties];
  [v4 setAppleIntelligence:v7];

  __int16 v8 = [(ADAssistantProperties *)self _getODDOptInProperties];
  [v4 setOptIn:v8];

  int v9 = [(ADAssistantProperties *)self _getODDHomeKitProperties];
  [v4 setHomeKit:v9];

  objc_msgSend(v4, "setLocationAccessPermission:", -[ADAssistantProperties _getLocationAccessPermission](self, "_getLocationAccessPermission"));
  return v4;
}

- (uint64_t)_getIsServerUserDataSyncEnabled
{
  uint64_t v44 = +[AFPreferences sharedPreferences];
  v0 = +[AFPreferences sharedPreferences];
  if ([v0 dictationIsEnabled])
  {
    id v1 = [v0 siriDataSharingOptInStatus];
    unsigned __int8 v2 = +[AFUtilitiesWrapper deviceSupportsOnDeviceDictation];
    id v3 = +[SFEntitledAssetManager onDeviceDictationLocales];
    id v4 = +[NSSet setWithArray:v3];

    int v5 = [v0 enabledDictationLocales];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    int v6 = [v5 allKeys];
    id v7 = [v6 countByEnumeratingWithState:&v45 objects:v59 count:16];
    if (v7)
    {
      id v8 = v7;
      unsigned __int8 v42 = v2;
      id v43 = v1;
      uint64_t v9 = *(void *)v46;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v46 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v45 + 1) + 8 * i);
          uint64_t v12 = [v5 objectForKey:v11];
          if ([v12 BOOLValue])
          {
            unsigned __int8 v13 = [v4 containsObject:v11];

            if ((v13 & 1) == 0)
            {
              int v15 = 1;
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v45 objects:v59 count:16];
      }
      while (v8);
      int v15 = 0;
LABEL_15:
      id v1 = v43;
      unsigned __int8 v2 = v42;
    }
    else
    {
      int v15 = 0;
    }

    unsigned int v16 = [v0 deviceHasPairedWatches];
    unsigned int v17 = [v0 deviceHasAtvOrHomepodInHome];
    v18 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      v50 = "ADShouldAllowDictationOnlySync";
      __int16 v51 = 1024;
      BOOL v52 = v1 != (id)1;
      __int16 v53 = 1024;
      int v54 = v15;
      __int16 v55 = 1024;
      unsigned int v56 = v17;
      __int16 v57 = 1024;
      unsigned int v58 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s optedOut: %d, serverDictationRequired: %d, deviceHasAtvOrHomepodInHome: %d, deviceHasPairedWatch: %d", buf, 0x24u);
    }
    char v19 = v2 ^ 1;
    if (v1 == (id)1) {
      char v19 = 1;
    }
    char v14 = v15 | v17 | v19 | v16;
  }
  else
  {
    char v14 = 0;
  }

  v20 = +[AFPreferences sharedPreferences];
  v21 = +[ADPreferences sharedPreferences];
  v22 = [v21 languageCode];

  id v23 = [v20 siriDataSharingOptInStatus];
  v24 = +[ADAssetManager sharedInstance];
  v25 = [v24 assetsAvailableStatusForLanguage:v22];
  unsigned int v26 = +[AFUtilitiesWrapper uodStatusSupportedFull:v25 languageCode:v22];

  unsigned int v27 = [v20 deviceHasPairedWatches];
  unsigned int v28 = [v20 deviceHasAtvOrHomepodInHome];
  if ((AFIsVision() & 1) != 0 || AFIsMac())
  {
    v29 = AFSiriLogContextSync;
    if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v59 = 136315138;
      v60 = "ADShouldAllowAssistantSync";
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%s Skipping tvOS dependency check for sync enablement on VisionOS and macOS devices", v59, 0xCu);
    }
    unsigned int v28 = 0;
  }
  v30 = +[ADServerFallbackConfigManager sharedInstance];
  if ([v30 assistantSyncDisabled]
    && [v20 shouldDisableServerFallbackNL])
  {
    unsigned int v31 = [v20 shouldDisableServerFallbackDomain];
  }
  else
  {
    unsigned int v31 = 0;
  }

  v32 = AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v59 = 136316418;
    v60 = "ADShouldAllowAssistantSync";
    __int16 v61 = 1024;
    BOOL v62 = v23 != (id)1;
    __int16 v63 = 1024;
    unsigned int v64 = v26;
    __int16 v65 = 1024;
    unsigned int v66 = v28;
    __int16 v67 = 1024;
    unsigned int v68 = v27;
    __int16 v69 = 1024;
    unsigned int v70 = v31;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%s optedOut: %d, fullUodCapable: %d, deviceHasAtvOrHomepodInHome: %d, deviceHasPairedWatch: %d, assistantSyncDisabledViaConfig: %d", v59, 0x2Au);
  }
  int v33 = v26 ^ 1;
  if (v23 == (id)1) {
    int v33 = 1;
  }
  if ((v33 | v27) == 1)
  {

    v34 = (void *)v44;
    goto LABEL_38;
  }

  v34 = (void *)v44;
  if ((v28 | v31 ^ 1) == 1)
  {
LABEL_38:
    BOOL v35 = sub_1001FBAA0();
    if (v14) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  BOOL v35 = 0;
  if (v14)
  {
LABEL_42:
    uint64_t v36 = 1;
    goto LABEL_46;
  }
LABEL_41:
  if ([v34 assistantIsEnabled] & v35) {
    goto LABEL_42;
  }
  v37 = (void *)AFSiriLogContextSync;
  if (os_log_type_enabled(AFSiriLogContextSync, OS_LOG_TYPE_INFO))
  {
    v38 = v37;
    unsigned int v39 = [v34 dictationIsEnabled];
    unsigned int v40 = [v34 assistantIsEnabled];
    *(_DWORD *)v59 = 136316162;
    v60 = "ADIsSyncEnabled";
    __int16 v61 = 1024;
    BOOL v62 = v39;
    __int16 v63 = 1024;
    unsigned int v64 = 0;
    __int16 v65 = 1024;
    unsigned int v66 = v40;
    __int16 v67 = 1024;
    unsigned int v68 = v35;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "%s Sync disallowed dictation enabled=%d, dictation only sync allowed=%d, assistant enabled=%d, assistant sync enabled=%d", v59, 0x24u);
  }
  uint64_t v36 = 0;
LABEL_46:

  return v36;
}

@end