@interface ADiOSAssistantProperties
- (ADiOSAssistantProperties)initWithQueue:(id)a3;
- (BOOL)_getIsAllowSiriWhenLockedEnabled;
- (BOOL)_getIsAlwaysListenForHeySiriEnabled;
- (BOOL)_getIsAlwaysShowSiriCaptionsEnabled;
- (BOOL)_getIsAlwaysShowSpeechEnabled;
- (BOOL)_getIsAnnounceCallsEnabledForAnnounceProperties;
- (BOOL)_getIsAnnounceNotificationsEnabled;
- (BOOL)_getIsAtypicalSpeechEnabled;
- (BOOL)_getIsEnabledForHeadphones;
- (BOOL)_getIsPressSideButtonForSiriEnabled;
- (BOOL)_getIsShowAppsBehindSiriEnabled;
- (BOOL)_getIsSiriCapableDigitalCarKeyAvailable;
- (BOOL)_getIsVoiceOverEnabled;
- (double)_getSiriSpeechRate;
- (id)_getODDAutoSendMessageProperties;
- (id)_getODDCarPlayProperties;
- (id)_getODDHeadGestureProperties;
- (id)_getODDSiriInCallProperties;
- (id)_getODDiOSAccessibilityProperties;
- (id)_getODDiOSResponseProperties;
- (int)_getAnnounceCarPlayStatus;
- (int)_getHeySiriHangupEnablementState;
- (int)_getSiriInCallEnablementState;
- (int)_getSiriPauseTimeState;
- (int)_getVoiceFeedback;
- (int)_headGestureMappingFromGestureType:(int64_t)a3;
- (void)_getIsSpokenNotificationsControlCenterModuleEnabledWithCompletion:(id)a3;
- (void)_getODDAnnouncePropertiesWithCompletion:(id)a3;
- (void)getODDiOSAssistantPropertiesWithCompletion:(id)a3;
@end

@implementation ADiOSAssistantProperties

- (void).cxx_destruct
{
}

- (void)_getIsSpokenNotificationsControlCenterModuleEnabledWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADiOSAssistantProperties _getIsSpokenNotificationsControlCenterModuleEnabledWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s Retrieving", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  v35 = sub_10011D670;
  v36 = sub_10011D680;
  id v37 = 0;
  id v6 = objc_alloc((Class)AFOneArgumentSafetyBlock);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10011D688;
  v25[3] = &unk_100502970;
  v25[4] = self;
  p_long long buf = &buf;
  id v7 = v4;
  id v26 = v7;
  id v8 = [v6 initWithBlock:v25];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2050000000;
  v9 = (void *)qword_100585BE8;
  uint64_t v32 = qword_100585BE8;
  if (!qword_100585BE8)
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10011D750;
    v28[3] = &unk_10050E318;
    v28[4] = &v29;
    sub_10011D750((uint64_t)v28);
    v9 = (void *)v30[3];
  }
  id v10 = v9;
  _Block_object_dispose(&v29, 8);
  v11 = [v10 sharedInstance];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10011D850;
  v23[3] = &unk_10050C458;
  id v12 = v8;
  id v24 = v12;
  [v11 getEnabledStateOfModuleWithIdentifier:@"com.apple.siri.SpokenNotificationsModule" completionHandler:v23];
  id v13 = objc_alloc((Class)AFWatchdogTimer);
  queue = self->_queue;
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  v20 = sub_10011D8B0;
  v21 = &unk_10050E138;
  id v15 = v12;
  id v22 = v15;
  id v16 = [v13 initWithTimeoutInterval:queue onQueue:&v18 timeoutHandler:3.0];
  v17 = *(void **)(*((void *)&buf + 1) + 40);
  *(void *)(*((void *)&buf + 1) + 40) = v16;

  objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "start", v18, v19, v20, v21);
  _Block_object_dispose(&buf, 8);
}

- (BOOL)_getIsEnabledForHeadphones
{
  v2 = [sub_10011DB60() currentNotificationSettingsCenter];
  v3 = [v2 notificationSystemSettings];
  BOOL v4 = [v3 announcementHeadphonesSetting] == (id)2;

  return v4;
}

- (BOOL)_getIsAnnounceNotificationsEnabled
{
  v2 = [sub_10011DB60() currentNotificationSettingsCenter];
  v3 = [v2 notificationSystemSettings];
  BOOL v4 = [v3 announcementSetting] == (id)2;

  return v4;
}

- (BOOL)_getIsAnnounceCallsEnabledForAnnounceProperties
{
  id v2 = objc_alloc_init((Class)TUUserConfiguration);
  BOOL v3 = [v2 announceCalls] != 0;

  return v3;
}

- (int)_getVoiceFeedback
{
  return +[ADiOSAssistantPropertiesUtilities getVoiceFeedbackStatus];
}

- (int)_getAnnounceCarPlayStatus
{
  uint64_t v2 = _AFPreferencesAnnounceNotificationsInCarPlayType();
  return +[ADiOSAssistantPropertiesUtilities getODDCarPlayAnnounceStatusFrom:v2];
}

- (int)_getSiriInCallEnablementState
{
  return +[ADiOSAssistantPropertiesUtilities getSiriInCallEnablementState];
}

- (int)_getHeySiriHangupEnablementState
{
  return +[ADiOSAssistantPropertiesUtilities getHangUpEnablementState];
}

- (BOOL)_getIsSiriCapableDigitalCarKeyAvailable
{
  id v2 = objc_alloc_init((Class)PKPassLibrary);
  BOOL v3 = [v2 passesOfType:1];
  objc_msgSend(v3, "pk_objectsPassingTest:", &stru_100502948);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "passActivationState", (void)v9))
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (BOOL)_getIsVoiceOverEnabled
{
  return _AXSVoiceOverTouchEnabled() != 0;
}

- (int)_getSiriPauseTimeState
{
  id v2 = +[AFPreferences sharedPreferences];
  id v3 = [v2 accessibleEndpointerThreshold];

  return +[ADiOSAssistantPropertiesUtilities getSiriPauseTimeStateFrom:v3];
}

- (BOOL)_getIsAlwaysListenForHeySiriEnabled
{
  id v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 alwaysAllowVoiceActivation];

  return v3;
}

- (BOOL)_getIsAtypicalSpeechEnabled
{
  id v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 useAtypicalSpeechModel];

  return v3;
}

- (double)_getSiriSpeechRate
{
  id v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 siriSpeechRate];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (BOOL)_getIsShowAppsBehindSiriEnabled
{
  id v2 = +[AFPreferences sharedPreferences];
  char v3 = [v2 alwaysObscureBackgroundContentWhenActive] ^ 1;

  return v3;
}

- (BOOL)_getIsAlwaysShowSpeechEnabled
{
  id v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 alwaysShowRecognizedSpeech];

  return v3;
}

- (BOOL)_getIsAlwaysShowSiriCaptionsEnabled
{
  id v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 siriResponseShouldAlwaysPrintWithoutOverride];

  return v3;
}

- (BOOL)_getIsAllowSiriWhenLockedEnabled
{
  id v2 = +[AFPreferences sharedPreferences];
  char v3 = [v2 disableAssistantWhilePasscodeLocked] ^ 1;

  return v3;
}

- (BOOL)_getIsPressSideButtonForSiriEnabled
{
  id v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 assistantIsEnabled];

  return v3;
}

- (id)_getODDHeadGestureProperties
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    long long v9 = "-[ADiOSAssistantProperties _getODDHeadGestureProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v8, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDHeadGestureProperties);
  double v5 = +[AFPreferences sharedPreferences];
  uint64_t v6 = [v5 storedHeadGestureConfigurationForDevice];

  objc_msgSend(v4, "setHeadGesturesSupported:", objc_msgSend(v6, "isSupported"));
  objc_msgSend(v4, "setHeadGesturesEnabled:", objc_msgSend(v6, "isEnabled"));
  objc_msgSend(v4, "setAcceptProceedGesture:", -[ADiOSAssistantProperties _headGestureMappingFromGestureType:](self, "_headGestureMappingFromGestureType:", objc_msgSend(v6, "acceptGesture")));
  objc_msgSend(v4, "setDeclineDismissGesture:", -[ADiOSAssistantProperties _headGestureMappingFromGestureType:](self, "_headGestureMappingFromGestureType:", objc_msgSend(v6, "rejectGesture")));

  return v4;
}

- (int)_headGestureMappingFromGestureType:(int64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return 2 * (a3 == 1);
  }
}

- (id)_getODDAutoSendMessageProperties
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADiOSAssistantProperties _getODDAutoSendMessageProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDAutoSendMessageProperties);
  objc_msgSend(v4, "setIsAutomaticallySendMessagesEnabled:", -[ADiOSAssistantProperties _getIsAutomaticallySendMessagesEnabled](self, "_getIsAutomaticallySendMessagesEnabled"));
  objc_msgSend(v4, "setIsEnabledForHeadphones:", -[ADiOSAssistantProperties _getIsAutomaticallySendMessagesEnabledForHeadphones](self, "_getIsAutomaticallySendMessagesEnabledForHeadphones"));
  objc_msgSend(v4, "setIsEnabledForCarPlay:", -[ADiOSAssistantProperties _getIsAutomaticallySendMessagesEnabledForCarPlay](self, "_getIsAutomaticallySendMessagesEnabledForCarPlay"));
  return v4;
}

- (void)_getODDAnnouncePropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    id v13 = "-[ADiOSAssistantProperties _getODDAnnouncePropertiesWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  id v6 = objc_alloc_init((Class)ODDSiriSchemaODDAnnounceProperties);
  objc_msgSend(v6, "setIsAnnounceCallsEnabled:", -[ADiOSAssistantProperties _getIsAnnounceCallsEnabledForAnnounceProperties](self, "_getIsAnnounceCallsEnabledForAnnounceProperties"));
  objc_msgSend(v6, "setIsAnnounceNotificationsEnabled:", -[ADiOSAssistantProperties _getIsAnnounceNotificationsEnabled](self, "_getIsAnnounceNotificationsEnabled"));
  objc_msgSend(v6, "setIsEnabledForHeadphones:", -[ADiOSAssistantProperties _getIsEnabledForHeadphones](self, "_getIsEnabledForHeadphones"));
  objc_msgSend(v6, "setIsProximityCardSeen:", -[ADiOSAssistantProperties _getAnnounceIsProximityCardSeen](self, "_getAnnounceIsProximityCardSeen"));
  objc_msgSend(v6, "setIsReplyWithoutConfirmationEnabled:", -[ADiOSAssistantProperties _getAnnounceIsReplyWithoutConfirmationEnabled](self, "_getAnnounceIsReplyWithoutConfirmationEnabled"));
  objc_msgSend(v6, "setIsCarPlayMuted:", -[ADiOSAssistantProperties _getAnnounceIsCarPlayMuted](self, "_getAnnounceIsCarPlayMuted"));
  objc_msgSend(v6, "setCarPlayStatus:", -[ADiOSAssistantProperties _getAnnounceCarPlayStatus](self, "_getAnnounceCarPlayStatus"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10011E714;
  v9[3] = &unk_10050C890;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  [(ADiOSAssistantProperties *)self _getIsSpokenNotificationsControlCenterModuleEnabledWithCompletion:v9];
}

- (id)_getODDSiriInCallProperties
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADiOSAssistantProperties _getODDSiriInCallProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDSiriInCallProperties);
  objc_msgSend(v4, "setHeySiriHangupEnablementState:", -[ADiOSAssistantProperties _getHeySiriHangupEnablementState](self, "_getHeySiriHangupEnablementState"));
  objc_msgSend(v4, "setSiriInCallEnablementState:", -[ADiOSAssistantProperties _getSiriInCallEnablementState](self, "_getSiriInCallEnablementState"));
  return v4;
}

- (id)_getODDCarPlayProperties
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADiOSAssistantProperties _getODDCarPlayProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDCarPlayProperties);
  objc_msgSend(v4, "setIsShowAppsBehindSiriEnabledOnCarPlay:", -[ADiOSAssistantProperties _getIsShowAppsBehindSiriEnabledOnCarPlay](self, "_getIsShowAppsBehindSiriEnabledOnCarPlay"));
  objc_msgSend(v4, "setIsSiriCapableDigitalCarKeyAvailable:", -[ADiOSAssistantProperties _getIsSiriCapableDigitalCarKeyAvailable](self, "_getIsSiriCapableDigitalCarKeyAvailable"));
  return v4;
}

- (id)_getODDiOSAccessibilityProperties
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADiOSAssistantProperties _getODDiOSAccessibilityProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDiOSAccessibilityProperties);
  objc_msgSend(v4, "setIsShowAppsBehindSiriEnabled:", -[ADiOSAssistantProperties _getIsShowAppsBehindSiriEnabled](self, "_getIsShowAppsBehindSiriEnabled"));
  [(ADiOSAssistantProperties *)self _getSiriSpeechRate];
  objc_msgSend(v4, "setSiriSpeechRate:");
  objc_msgSend(v4, "setIsVoiceOverEnabled:", -[ADiOSAssistantProperties _getIsVoiceOverEnabled](self, "_getIsVoiceOverEnabled"));
  objc_msgSend(v4, "setIsTypeToSiriEnabled:", -[ADiOSAssistantProperties _getIsTypeToSiriEnabled](self, "_getIsTypeToSiriEnabled"));
  objc_msgSend(v4, "setVoiceFeedback:", -[ADiOSAssistantProperties _getVoiceFeedback](self, "_getVoiceFeedback"));
  objc_msgSend(v4, "setIsAtypicalSpeechEnabled:", -[ADiOSAssistantProperties _getIsAtypicalSpeechEnabled](self, "_getIsAtypicalSpeechEnabled"));
  objc_msgSend(v4, "setIsAlwaysListenForHeySiriEnabled:", -[ADiOSAssistantProperties _getIsAlwaysListenForHeySiriEnabled](self, "_getIsAlwaysListenForHeySiriEnabled"));
  objc_msgSend(v4, "setSiriPauseTimeState:", -[ADiOSAssistantProperties _getSiriPauseTimeState](self, "_getSiriPauseTimeState"));
  return v4;
}

- (id)_getODDiOSResponseProperties
{
  unsigned __int8 v3 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    id v7 = "-[ADiOSAssistantProperties _getODDiOSResponseProperties]";
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v6, 0xCu);
  }
  id v4 = objc_alloc_init((Class)ODDSiriSchemaODDiOSResponseProperties);
  objc_msgSend(v4, "setIsAlwaysShowSiriCaptionsEnabled:", -[ADiOSAssistantProperties _getIsAlwaysShowSiriCaptionsEnabled](self, "_getIsAlwaysShowSiriCaptionsEnabled"));
  objc_msgSend(v4, "setIsAlwaysShowSpeechEnabled:", -[ADiOSAssistantProperties _getIsAlwaysShowSpeechEnabled](self, "_getIsAlwaysShowSpeechEnabled"));
  return v4;
}

- (void)getODDiOSAssistantPropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v32 = "-[ADiOSAssistantProperties getODDiOSAssistantPropertiesWithCompletion:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  int v6 = dispatch_group_create();
  id v7 = objc_alloc_init((Class)ODDSiriSchemaODDiOSAssistantProperties);
  objc_msgSend(v7, "setIsPressSideButtonForSiriEnabled:", -[ADiOSAssistantProperties _getIsPressSideButtonForSiriEnabled](self, "_getIsPressSideButtonForSiriEnabled"));
  objc_msgSend(v7, "setIsAllowSiriWhenLockedEnabled:", -[ADiOSAssistantProperties _getIsAllowSiriWhenLockedEnabled](self, "_getIsAllowSiriWhenLockedEnabled"));
  id v8 = [(ADiOSAssistantProperties *)self _getODDiOSResponseProperties];
  [v7 setResponse:v8];

  long long v9 = [(ADiOSAssistantProperties *)self _getODDiOSAccessibilityProperties];
  [v7 setAccessibility:v9];

  id v10 = [(ADiOSAssistantProperties *)self _getODDCarPlayProperties];
  [v7 setCarPlay:v10];

  id v11 = [(ADiOSAssistantProperties *)self _getODDSiriInCallProperties];
  [v7 setSiriInCall:v11];

  long long v12 = [(ADiOSAssistantProperties *)self _getODDAutoSendMessageProperties];
  [v7 setAutoSendMessage:v12];

  id v13 = [(ADiOSAssistantProperties *)self _getODDHeadGestureProperties];
  [v7 setHeadGestures:v13];

  dispatch_group_enter(v6);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10011EF30;
  v28[3] = &unk_100502908;
  id v14 = v7;
  id v29 = v14;
  id v15 = v6;
  v30 = v15;
  [(ADiOSAssistantProperties *)self _getODDAnnouncePropertiesWithCompletion:v28];
  dispatch_group_enter(v15);
  queue = self->_queue;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10011EF70;
  v25[3] = &unk_100506530;
  id v17 = v14;
  id v26 = v17;
  v27 = v15;
  v18 = v15;
  +[ADDevicePropertiesUtils fetchActiveSubscriptionsWithQueue:queue completion:v25];
  uint64_t v19 = self->_queue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10011EFB0;
  v22[3] = &unk_10050E188;
  id v23 = v17;
  id v24 = v4;
  id v20 = v17;
  id v21 = v4;
  dispatch_group_notify(v18, v19, v22);
}

- (ADiOSAssistantProperties)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ADiOSAssistantProperties;
  int v6 = [(ADiOSAssistantProperties *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

@end