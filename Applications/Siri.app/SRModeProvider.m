@interface SRModeProvider
- (BOOL)displayOnlyModeForInterstitialsAndErrors;
- (BOOL)userTouchedSnippet;
- (SASRequestOptions)requestOptions;
- (SRModeProvider)init;
- (unint64_t)_modeForSiriSettings;
- (unint64_t)currentMode;
- (unint64_t)internalModeOverride;
- (void)_setSystemState:(id)a3;
- (void)setRequestOptions:(id)a3;
- (void)setUserTouchedSnippet:(BOOL)a3;
@end

@implementation SRModeProvider

- (SRModeProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRModeProvider;
  v2 = [(SRModeProvider *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SRModeSystemState);
    systemState = v2->_systemState;
    v2->_systemState = v3;
  }
  return v2;
}

- (unint64_t)currentMode
{
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    systemState = self->_systemState;
    int v13 = 136315394;
    v14 = "-[SRModeProvider currentMode]";
    __int16 v15 = 2112;
    v16 = systemState;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #modes %@", (uint8_t *)&v13, 0x16u);
  }
  unint64_t v5 = [(SRModeProvider *)self internalModeOverride];
  if (v5 == -1)
  {
    if ([(SRModeSystemState *)self->_systemState isVoiceTriggerRequest]
      || ![(SRModeSystemState *)self->_systemState userTypedInSiri]
      && ![(SRModeSystemState *)self->_systemState userTouchedSnippet]
      && ([(SRModeSystemState *)self->_systemState isConnectedToCarPlay]
       || [(SRModeSystemState *)self->_systemState isForCarDND]
       || [(SRModeSystemState *)self->_systemState isEyesFree]
       || [(SRModeSystemState *)self->_systemState isConnectedToAudioAccessory]
       || [(SRModeSystemState *)self->_systemState isScreenOffBeforeRequest]))
    {
      return 0;
    }
    else
    {
      return [(SRModeProvider *)self _modeForSiriSettings];
    }
  }
  else
  {
    unint64_t v6 = v5;
    v7 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v8 = @"Voice";
      if (v6 == 1) {
        CFStringRef v8 = @"Mixed";
      }
      if (v6 == 2) {
        CFStringRef v9 = @"Silent";
      }
      else {
        CFStringRef v9 = v8;
      }
      v10 = v7;
      v11 = [@"SRMode" stringByAppendingString:v9];
      int v13 = 136315394;
      v14 = "-[SRModeProvider currentMode]";
      __int16 v15 = 2112;
      v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #modes Override value being used: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  return v6;
}

- (unint64_t)_modeForSiriSettings
{
  if ([(SRModeSystemState *)self->_systemState isRequestEmergencyCall]) {
    return 0;
  }
  unint64_t v4 = [(SRModeSystemState *)self->_systemState voiceFeedbackSetting];
  if (v4 != 1)
  {
    if (v4
      || [(SRModeSystemState *)self->_systemState isScreenOffBeforeRequest]
      && [(SRModeSystemState *)self->_systemState isConnectedToAudioAccessory])
    {
      return 1;
    }
    return 2;
  }
  if ([(SRModeSystemState *)self->_systemState isDeviceSilentMode]) {
    return 2;
  }
  if ([(SRModeSystemState *)self->_systemState isRequestMadeWithPhysicalDeviceInteraction])
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)displayOnlyModeForInterstitialsAndErrors
{
  v3 = +[AFAccessibilityObserver sharedObserver];
  unint64_t v4 = [v3 state];
  id v5 = [v4 isVoiceOverTouchEnabled];

  if (v5 == (id)2)
  {
    unint64_t v6 = AFSiriLogContextConnection;
    BOOL v7 = 0;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      CFStringRef v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for voiceover";
LABEL_9:
      CFStringRef v9 = v6;
      goto LABEL_10;
    }
  }
  else if ([(SRModeSystemState *)self->_systemState isConnectedToCarPlay] {
         || [(SRModeSystemState *)self->_systemState isForCarDND]
  }
         || [(SRModeSystemState *)self->_systemState isEyesFree])
  {
    unint64_t v6 = AFSiriLogContextConnection;
    BOOL v7 = 0;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      CFStringRef v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for automotive config";
      goto LABEL_9;
    }
  }
  else
  {
    if (![(SRModeSystemState *)self->_systemState isRequestMadeWithPhysicalDeviceInteraction])
    {
      unint64_t v6 = AFSiriLogContextConnection;
      BOOL v7 = 0;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      CFStringRef v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for no screen engagement";
      goto LABEL_9;
    }
    if ((id)[(SRModeSystemState *)self->_systemState voiceFeedbackSetting] == (id)2)
    {
      unint64_t v6 = AFSiriLogContextConnection;
      BOOL v7 = 0;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      CFStringRef v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for PreferSpokenResponses";
      goto LABEL_9;
    }
    if ([(SRModeSystemState *)self->_systemState isConnectedToAudioAccessory])
    {
      unint64_t v6 = AFSiriLogContextConnection;
      BOOL v7 = 0;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      CFStringRef v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for audio accessory connected";
      goto LABEL_9;
    }
    unsigned __int8 v11 = [(SRModeSystemState *)self->_systemState isDeviceSilentMode];
    v12 = AFSiriLogContextConnection;
    BOOL v13 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 1) == 0)
    {
      if (!v13) {
        goto LABEL_11;
      }
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      CFStringRef v8 = "%s #errorHandling #modes Enabling interstitial and error TTS for device not in silent mode";
      CFStringRef v9 = v12;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0xCu);
LABEL_11:
      BOOL v7 = 0;
      goto LABEL_12;
    }
    if (v13)
    {
      int v14 = 136315138;
      __int16 v15 = "-[SRModeProvider displayOnlyModeForInterstitialsAndErrors]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #errorHandling #modes Suppressing interstitial and error TTS for DisplayOnly mode", (uint8_t *)&v14, 0xCu);
    }
    BOOL v7 = 1;
  }
LABEL_12:

  return v7;
}

- (BOOL)userTouchedSnippet
{
  return [(SRModeSystemState *)self->_systemState userTouchedSnippet];
}

- (void)setUserTouchedSnippet:(BOOL)a3
{
}

- (SASRequestOptions)requestOptions
{
  return [(SRModeSystemState *)self->_systemState requestOptions];
}

- (void)setRequestOptions:(id)a3
{
}

- (void)_setSystemState:(id)a3
{
}

- (unint64_t)internalModeOverride
{
  if (!AFIsInternalInstall()) {
    return -1;
  }
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.siri.internal"];
  v3 = [v2 stringForKey:@"ModeOverride"];
  unint64_t v4 = [v3 lowercaseString];

  if (([v4 isEqualToString:@"silent"] & 1) != 0
    || ([v4 isEqualToString:@"displayonly"] & 1) != 0)
  {
    unint64_t v5 = 2;
  }
  else if (([v4 isEqualToString:@"mixed"] & 1) != 0 {
         || ([v4 isEqualToString:@"displayforward"] & 1) != 0)
  }
  {
    unint64_t v5 = 1;
  }
  else if (([v4 isEqualToString:@"voice"] & 1) != 0 {
         || ([v4 isEqualToString:@"voiceonly"] & 1) != 0
  }
         || ([v4 isEqualToString:@"voiceforward"] & 1) != 0)
  {
    unint64_t v5 = 0;
  }
  else
  {
    if (v4)
    {
      BOOL v7 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_1000B7D44((uint64_t)v4, v7);
      }
    }
    unint64_t v5 = -1;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end