@interface ADResponseModeProvider
- (ADResponseModeProvider)init;
- (BOOL)_deviceUnlockSignalEnabled;
- (BOOL)_isAudioAccessoryConnected;
- (BOOL)_isDeviceSilent;
- (BOOL)_isDeviceUnlocked;
- (BOOL)_isNavigationActive;
- (BOOL)_isScreenEngaged;
- (BOOL)_isSteveNoteConnected;
- (BOOL)_isThirdPartyBTConnected;
- (BOOL)_overrideModeWhenInAmbient;
- (BOOL)_updateStickiness;
- (id)_computeModeForMacOS;
- (id)_computeModeForVisionOS;
- (id)_computeModeForWatchOS;
- (id)_computeModeForiOS;
- (id)_computeModeFortvOS;
- (id)fetchCurrentMode;
- (id)internalModeOverride:(id)a3;
- (int64_t)_isVoiceOverEnabled;
- (int64_t)_voiceFeedbackSetting;
- (void)_computeMode;
- (void)_connectedOutputDevicesDidChange:(id)a3;
- (void)_fetchConnectedAudioAccessoryState;
- (void)updateModesConfiguration:(id)a3;
@end

@implementation ADResponseModeProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationListener, 0);
  objc_storeStrong((id *)&self->_currentMode, 0);
  objc_storeStrong((id *)&self->_currentModesConfiguration, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sharedSystemAudioContext, 0);
  objc_storeStrong((id *)&self->_ringerStateObserver, 0);
  objc_storeStrong((id *)&self->_connectedOutputDevicesObserver, 0);
}

- (void)_connectedOutputDevicesDidChange:(id)a3
{
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    v6 = "-[ADResponseModeProvider _connectedOutputDevicesDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s #modes: output devices changed, re-fetching connected audio accessory state", (uint8_t *)&v5, 0xCu);
  }
  [(ADResponseModeProvider *)self _fetchConnectedAudioAccessoryState];
}

- (void)_fetchConnectedAudioAccessoryState
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100059044;
  v4[3] = &unk_10050B790;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)internalModeOverride:(id)a3
{
  v3 = [a3 lowercaseString];
  if (([v3 isEqualToString:@"silent"] & 1) != 0
    || [v3 isEqualToString:@"displayonly"])
  {
    v4 = (id *)&SAUIResponseModeDisplayOnlyValue;
LABEL_10:
    id v5 = (__CFString *)*v4;
    goto LABEL_11;
  }
  if (([v3 isEqualToString:@"mixed"] & 1) != 0
    || [v3 isEqualToString:@"displayforward"])
  {
    v4 = (id *)&SAUIResponseModeDisplayForwardValue;
    goto LABEL_10;
  }
  if (([v3 isEqualToString:@"voice"] & 1) != 0
    || [v3 isEqualToString:@"voiceonly"])
  {
    v4 = (id *)&SAUIResponseModeVoiceOnlyValue;
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"voiceforward"])
  {
    v4 = (id *)&SAUIResponseModeVoiceForwardValue;
    goto LABEL_10;
  }
  if (v3)
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      v9 = "-[ADResponseModeProvider internalModeOverride:]";
      __int16 v10 = 2112;
      v11 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s #modes Invalid mode override value: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  id v5 = @"None";
LABEL_11:

  return v5;
}

- (id)_computeModeFortvOS
{
  v3 = [(AFModesConfiguration *)self->_currentModesConfiguration modeOverrideValue];
  v4 = [(ADResponseModeProvider *)self internalModeOverride:v3];

  if (v4 == @"None")
  {
    if (AFIsHorseman())
    {
      int v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315138;
        v15 = "-[ADResponseModeProvider _computeModeFortvOS]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s #modes Computing mode for Homepod as VoiceOnly", (uint8_t *)&v14, 0xCu);
      }
      v9 = (void **)&SAUIResponseModeVoiceOnlyValue;
    }
    else if (AFIsATV() {
           && self->_isConnectedToAppleBTHeadphones
    }
           && +[AFFeatureFlags isStateFeedbackEnabled])
    {
      __int16 v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315138;
        v15 = "-[ADResponseModeProvider _computeModeFortvOS]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s #modes Apple TV + Headphones : DisplayForward", (uint8_t *)&v14, 0xCu);
      }
      v9 = (void **)&SAUIResponseModeDisplayForwardValue;
    }
    else
    {
      v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315138;
        v15 = "-[ADResponseModeProvider _computeModeFortvOS]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #modes Computing mode for tvOS as DisplayOnly", (uint8_t *)&v14, 0xCu);
      }
      v9 = (void **)&SAUIResponseModeDisplayOnlyValue;
    }
    v7 = *v9;
  }
  else
  {
    id v5 = AFSiriLogContextConnection;
    BOOL v6 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    v7 = v4;
    if (v6)
    {
      int v14 = 136315394;
      v15 = "-[ADResponseModeProvider _computeModeFortvOS]";
      __int16 v16 = 2112;
      v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s #modes Override value being used: %@", (uint8_t *)&v14, 0x16u);
      v7 = v4;
    }
  }
  id v12 = v7;

  return v12;
}

- (id)_computeModeForMacOS
{
  unsigned int v3 = [(ADResponseModeProvider *)self _updateStickiness];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"Not Sticky";
    if (v3) {
      CFStringRef v5 = @"Sticky";
    }
    int v22 = 136315394;
    v23 = "-[ADResponseModeProvider _computeModeForMacOS]";
    __int16 v24 = 2112;
    CFStringRef v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s #modes Stickiness is %@", (uint8_t *)&v22, 0x16u);
  }
  unsigned int previousIsVoiceTriggerRequest = [(AFModesConfiguration *)self->_currentModesConfiguration isVoiceTriggerRequest];
  int v7 = v3 ^ 1;
  if ((previousIsVoiceTriggerRequest & 1) == 0 && (v7 & 1) == 0) {
    unsigned int previousIsVoiceTriggerRequest = self->_previousIsVoiceTriggerRequest;
  }
  self->_unsigned int previousIsVoiceTriggerRequest = previousIsVoiceTriggerRequest;
  unsigned int previousIsAudioAccessoryButtonActivation = [(AFModesConfiguration *)self->_currentModesConfiguration isAudioAccessoryButtonActivation];
  if (((previousIsAudioAccessoryButtonActivation | v7) & 1) == 0) {
    unsigned int previousIsAudioAccessoryButtonActivation = self->_previousIsAudioAccessoryButtonActivation;
  }
  self->_unsigned int previousIsAudioAccessoryButtonActivation = previousIsAudioAccessoryButtonActivation;
  v9 = [(AFModesConfiguration *)self->_currentModesConfiguration modeOverrideValue];
  __int16 v10 = [(ADResponseModeProvider *)self internalModeOverride:v9];

  if (v10 == @"None")
  {
    if (previousIsVoiceTriggerRequest)
    {
      int v14 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315138;
        v23 = "-[ADResponseModeProvider _computeModeForMacOS]";
        v15 = "%s #modes Hey Siri invocation";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      if (!previousIsAudioAccessoryButtonActivation)
      {
        int64_t v19 = [(ADResponseModeProvider *)self _voiceFeedbackSetting];
        v20 = AFSiriLogContextConnection;
        BOOL v21 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
        if (v19 == 3)
        {
          if (v21)
          {
            int v22 = 136315138;
            v23 = "-[ADResponseModeProvider _computeModeForMacOS]";
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s #modes VoiceFeedback ON", (uint8_t *)&v22, 0xCu);
          }
          __int16 v16 = (void **)&SAUIResponseModeDisplayForwardValue;
        }
        else
        {
          if (v21)
          {
            int v22 = 136315138;
            v23 = "-[ADResponseModeProvider _computeModeForMacOS]";
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%s #modes VoiceFeedback OFF", (uint8_t *)&v22, 0xCu);
          }
          __int16 v16 = (void **)&SAUIResponseModeDisplayOnlyValue;
        }
        goto LABEL_21;
      }
      int v14 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315138;
        v23 = "-[ADResponseModeProvider _computeModeForMacOS]";
        v15 = "%s #modes audio accessory button invocation";
        goto LABEL_19;
      }
    }
    __int16 v16 = (void **)&SAUIResponseModeVoiceForwardValue;
LABEL_21:
    v13 = *v16;
    goto LABEL_22;
  }
  v11 = AFSiriLogContextConnection;
  BOOL v12 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  v13 = v10;
  if (v12)
  {
    int v22 = 136315394;
    v23 = "-[ADResponseModeProvider _computeModeForMacOS]";
    __int16 v24 = 2112;
    CFStringRef v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #modes Override value being used: %@", (uint8_t *)&v22, 0x16u);
    v13 = v10;
  }
LABEL_22:
  id v17 = v13;

  return v17;
}

- (id)_computeModeForWatchOS
{
  unsigned int v3 = [(AFModesConfiguration *)self->_currentModesConfiguration modeOverrideValue];
  v4 = [(ADResponseModeProvider *)self internalModeOverride:v3];

  if (v4 == @"None")
  {
    if ([(AFModesConfiguration *)self->_currentModesConfiguration isUIFree])
    {
      int v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315138;
        v23 = "-[ADResponseModeProvider _computeModeForWatchOS]";
        v9 = "%s #modes UIFree session (likely Announce)";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v22, 0xCu);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
    if ([(ADResponseModeProvider *)self _isAudioAccessoryConnected])
    {
      int v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v22 = 136315138;
        v23 = "-[ADResponseModeProvider _computeModeForWatchOS]";
        v9 = "%s #modes Audio accessory connected";
        goto LABEL_10;
      }
LABEL_11:
      __int16 v10 = (void **)&SAUIResponseModeVoiceForwardValue;
LABEL_12:
      int v7 = *v10;
      goto LABEL_13;
    }
    if ((id)[(ADResponseModeProvider *)self _voiceFeedbackSetting] == (id)3)
    {
      v13 = AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
LABEL_32:
        __int16 v10 = (void **)&SAUIResponseModeDisplayForwardValue;
        goto LABEL_12;
      }
      int v22 = 136315138;
      v23 = "-[ADResponseModeProvider _computeModeForWatchOS]";
      int v14 = "%s #modes Always On";
    }
    else
    {
      if ((id)[(ADResponseModeProvider *)self _voiceFeedbackSetting] == (id)2)
      {
        v15 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          __int16 v16 = v15;
          unsigned int v17 = [(ADResponseModeProvider *)self _isDeviceSilent];
          CFStringRef v18 = @"OFF";
          if (v17) {
            CFStringRef v18 = @"ON";
          }
          int v22 = 136315394;
          v23 = "-[ADResponseModeProvider _computeModeForWatchOS]";
          __int16 v24 = 2112;
          CFStringRef v25 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s #modes Control with Ringer Switch - Device silent mode = %@", (uint8_t *)&v22, 0x16u);
        }
        unsigned int v19 = [(ADResponseModeProvider *)self _isDeviceSilent];
        __int16 v10 = (void **)&SAUIResponseModeDisplayOnlyValue;
        if (!v19) {
          __int16 v10 = (void **)&SAUIResponseModeDisplayForwardValue;
        }
        goto LABEL_12;
      }
      int64_t v20 = [(ADResponseModeProvider *)self _voiceFeedbackSetting];
      v13 = AFSiriLogContextConnection;
      BOOL v21 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
      if (v20 == 1)
      {
        if (v21)
        {
          int v22 = 136315138;
          v23 = "-[ADResponseModeProvider _computeModeForWatchOS]";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s #modes Headphones Only", (uint8_t *)&v22, 0xCu);
        }
        __int16 v10 = (void **)&SAUIResponseModeDisplayOnlyValue;
        goto LABEL_12;
      }
      if (!v21) {
        goto LABEL_32;
      }
      int v22 = 136315138;
      v23 = "-[ADResponseModeProvider _computeModeForWatchOS]";
      int v14 = "%s #modes Defaulting to DisplayForward";
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v22, 0xCu);
    goto LABEL_32;
  }
  CFStringRef v5 = AFSiriLogContextConnection;
  BOOL v6 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  int v7 = v4;
  if (v6)
  {
    int v22 = 136315394;
    v23 = "-[ADResponseModeProvider _computeModeForWatchOS]";
    __int16 v24 = 2112;
    CFStringRef v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s #modes Override value being used: %@", (uint8_t *)&v22, 0x16u);
    int v7 = v4;
  }
LABEL_13:
  id v11 = v7;

  return v11;
}

- (id)_computeModeForiOS
{
  unsigned int v3 = [(ADResponseModeProvider *)self _updateStickiness];
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"Not Sticky";
    if (v3) {
      CFStringRef v5 = @"Sticky";
    }
    int v30 = 136315394;
    v31 = "-[ADResponseModeProvider _computeModeForiOS]";
    __int16 v32 = 2112;
    CFStringRef v33 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s #modes Stickiness is %@", (uint8_t *)&v30, 0x16u);
  }
  if (v3) {
    unsigned int previousScreenEngagement = self->_previousScreenEngagement;
  }
  else {
    unsigned int previousScreenEngagement = [(ADResponseModeProvider *)self _isScreenEngaged];
  }
  self->_unsigned int previousScreenEngagement = previousScreenEngagement;
  int v7 = [(AFModesConfiguration *)self->_currentModesConfiguration modeOverrideValue];
  int v8 = [(ADResponseModeProvider *)self internalModeOverride:v7];

  if (v8 == @"None")
  {
    if ([(AFModesConfiguration *)self->_currentModesConfiguration userTypedInSiri])
    {
      BOOL v12 = AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
LABEL_16:
        __int16 v16 = (void **)&SAUIResponseModeDisplayOnlyValue;
LABEL_26:
        id v11 = *v16;
        goto LABEL_27;
      }
      int v30 = 136315138;
      v31 = "-[ADResponseModeProvider _computeModeForiOS]";
      v13 = "%s #modes User typed in Siri";
      goto LABEL_14;
    }
    if ((id)[(ADResponseModeProvider *)self _isVoiceOverEnabled] == (id)2)
    {
      unsigned int v17 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        v31 = "-[ADResponseModeProvider _computeModeForiOS]";
        CFStringRef v18 = "%s #modes VoiceOver is Enabled";
LABEL_23:
        unsigned int v19 = v17;
        os_log_type_t v20 = OS_LOG_TYPE_INFO;
LABEL_24:
        _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, (uint8_t *)&v30, 0xCu);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
    if ([(AFModesConfiguration *)self->_currentModesConfiguration isConnectedToCarPlay])
    {
      unsigned int v17 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        v31 = "-[ADResponseModeProvider _computeModeForiOS]";
        CFStringRef v18 = "%s #modes Connected to Carplay";
        goto LABEL_23;
      }
LABEL_25:
      __int16 v16 = (void **)&SAUIResponseModeVoiceForwardValue;
      goto LABEL_26;
    }
    if ([(AFModesConfiguration *)self->_currentModesConfiguration isUIFree])
    {
      v23 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        v31 = "-[ADResponseModeProvider _computeModeForiOS]";
        __int16 v24 = "%s #modes UIFree session (likely Announce)";
LABEL_39:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, v24, (uint8_t *)&v30, 0xCu);
        goto LABEL_40;
      }
      goto LABEL_40;
    }
    if ([(AFModesConfiguration *)self->_currentModesConfiguration isInAmbient]
      && [(ADResponseModeProvider *)self _overrideModeWhenInAmbient])
    {
      unsigned int v17 = AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
      int v30 = 136315138;
      v31 = "-[ADResponseModeProvider _computeModeForiOS]";
      CFStringRef v18 = "%s #modes Ambient session";
      goto LABEL_23;
    }
    if (([(AFModesConfiguration *)self->_currentModesConfiguration isForCarDND] & 1) != 0
      || [(AFModesConfiguration *)self->_currentModesConfiguration isEyesFree])
    {
      v23 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        v31 = "-[ADResponseModeProvider _computeModeForiOS]";
        __int16 v24 = "%s #modes CarDND or Eyesfree mode active";
        goto LABEL_39;
      }
LABEL_40:
      __int16 v16 = (void **)&SAUIResponseModeVoiceOnlyValue;
      goto LABEL_26;
    }
    if ([(ADResponseModeProvider *)self _isThirdPartyBTConnected])
    {
      unsigned int v17 = AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
      int v30 = 136315138;
      v31 = "-[ADResponseModeProvider _computeModeForiOS]";
      CFStringRef v18 = "%s #modes ThirdPartyBTConnected";
      goto LABEL_23;
    }
    if ([(ADResponseModeProvider *)self _isNavigationActive])
    {
      unsigned int v17 = AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
      int v30 = 136315138;
      v31 = "-[ADResponseModeProvider _computeModeForiOS]";
      CFStringRef v18 = "%s #modes Navigation is active";
      goto LABEL_23;
    }
    if ((id)[(ADResponseModeProvider *)self _voiceFeedbackSetting] == (id)1)
    {
      CFStringRef v25 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        v31 = "-[ADResponseModeProvider _computeModeForiOS]";
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%s #modes PreferSilentResponses", (uint8_t *)&v30, 0xCu);
      }
      if (([(AFModesConfiguration *)self->_currentModesConfiguration isDeviceScreenON] & 1) != 0
        || ![(ADResponseModeProvider *)self _isAudioAccessoryConnected])
      {
        goto LABEL_16;
      }
      unsigned int v17 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        v31 = "-[ADResponseModeProvider _computeModeForiOS]";
        CFStringRef v18 = "%s #modes PreferSilentResponses with headphones and screen off";
        goto LABEL_23;
      }
      goto LABEL_25;
    }
    if ([(ADResponseModeProvider *)self _deviceUnlockSignalEnabled]
      && ![(ADResponseModeProvider *)self _isDeviceUnlocked])
    {
      v28 = AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_25;
      }
      int v30 = 136315138;
      v31 = "-[ADResponseModeProvider _computeModeForiOS]";
      CFStringRef v18 = "%s #modes Unlock signal enabled && device is locked";
      unsigned int v19 = v28;
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_24;
    }
    if ((([(ADResponseModeProvider *)self _deviceUnlockSignalEnabled] | previousScreenEngagement) & 1) == 0)
    {
      unsigned int v17 = AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO)) {
        goto LABEL_25;
      }
      int v30 = 136315138;
      v31 = "-[ADResponseModeProvider _computeModeForiOS]";
      CFStringRef v18 = "%s #modes No screen engagement";
      goto LABEL_23;
    }
    if ((id)[(ADResponseModeProvider *)self _voiceFeedbackSetting] == (id)3)
    {
      v26 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v30 = 136315138;
        v31 = "-[ADResponseModeProvider _computeModeForiOS]";
        v27 = "%s #modes PreferSpokenResponses";
LABEL_70:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v30, 0xCu);
      }
    }
    else
    {
      if ([(ADResponseModeProvider *)self _deviceUnlockSignalEnabled])
      {
        v29 = AFSiriLogContextConnection;
        if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        int v30 = 136315138;
        v31 = "-[ADResponseModeProvider _computeModeForiOS]";
        v13 = "%s #modes Unlock signal enabled && device is unlocked";
        int v14 = v29;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_15;
      }
      if ([(ADResponseModeProvider *)self _isAudioAccessoryConnected])
      {
        v26 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          int v30 = 136315138;
          v31 = "-[ADResponseModeProvider _computeModeForiOS]";
          v27 = "%s #modes AudioAccessoryConnected";
          goto LABEL_70;
        }
      }
      else if ([(ADResponseModeProvider *)self _isDeviceSilent])
      {
        BOOL v12 = AFSiriLogContextConnection;
        if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO)) {
          goto LABEL_16;
        }
        int v30 = 136315138;
        v31 = "-[ADResponseModeProvider _computeModeForiOS]";
        v13 = "%s #modes Device is in silent mode";
LABEL_14:
        int v14 = v12;
        os_log_type_t v15 = OS_LOG_TYPE_INFO;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, (uint8_t *)&v30, 0xCu);
        goto LABEL_16;
      }
    }
    __int16 v16 = (void **)&SAUIResponseModeDisplayForwardValue;
    goto LABEL_26;
  }
  v9 = AFSiriLogContextConnection;
  BOOL v10 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  id v11 = v8;
  if (v10)
  {
    int v30 = 136315394;
    v31 = "-[ADResponseModeProvider _computeModeForiOS]";
    __int16 v32 = 2112;
    CFStringRef v33 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s #modes Override value being used: %@", (uint8_t *)&v30, 0x16u);
    id v11 = v8;
  }
LABEL_27:
  id v21 = v11;

  return v21;
}

- (id)_computeModeForVisionOS
{
  unsigned int v3 = [(AFModesConfiguration *)self->_currentModesConfiguration modeOverrideValue];
  v4 = [(ADResponseModeProvider *)self internalModeOverride:v3];

  if (v4 == @"None")
  {
    if ((id)[(ADResponseModeProvider *)self _isVoiceOverEnabled] == (id)2)
    {
      int v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v15 = 136315138;
        __int16 v16 = "-[ADResponseModeProvider _computeModeForVisionOS]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s #modes VoiceOver is Enabled", (uint8_t *)&v15, 0xCu);
      }
      v9 = (void **)&SAUIResponseModeVoiceForwardValue;
    }
    else
    {
      int64_t v10 = [(ADResponseModeProvider *)self _voiceFeedbackSetting];
      id v11 = AFSiriLogContextConnection;
      BOOL v12 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
      if (v10 == 3)
      {
        if (v12)
        {
          int v15 = 136315138;
          __int16 v16 = "-[ADResponseModeProvider _computeModeForVisionOS]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #modes PreferSpokenResponses", (uint8_t *)&v15, 0xCu);
        }
        v9 = (void **)&SAUIResponseModeDisplayForwardValue;
      }
      else
      {
        if (v12)
        {
          int v15 = 136315138;
          __int16 v16 = "-[ADResponseModeProvider _computeModeForVisionOS]";
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #modes Defaulting to DisplayOnly for Device", (uint8_t *)&v15, 0xCu);
        }
        v9 = (void **)&SAUIResponseModeDisplayOnlyValue;
      }
    }
    int v7 = *v9;
  }
  else
  {
    CFStringRef v5 = AFSiriLogContextConnection;
    BOOL v6 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    int v7 = v4;
    if (v6)
    {
      int v15 = 136315394;
      __int16 v16 = "-[ADResponseModeProvider _computeModeForVisionOS]";
      __int16 v17 = 2112;
      CFStringRef v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s #modes Override value being used: %@", (uint8_t *)&v15, 0x16u);
      int v7 = v4;
    }
  }
  id v13 = v7;

  return v13;
}

- (void)_computeMode
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A81C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (int64_t)_isVoiceOverEnabled
{
  v2 = +[AFAccessibilityObserver sharedObserver];
  unsigned int v3 = [v2 state];
  id v4 = [v3 isVoiceOverTouchEnabled];

  return (int64_t)v4;
}

- (BOOL)_isNavigationActive
{
  return [(GEONavigationListener *)self->_navigationListener navigationState] == (id)2;
}

- (BOOL)_updateStickiness
{
  if (([(AFModesConfiguration *)self->_currentModesConfiguration isSiriAutoPrompt] & 1) == 0
    && ![(AFModesConfiguration *)self->_currentModesConfiguration isFlexibleFollowup])
  {
LABEL_13:
    BOOL v10 = 0;
    goto LABEL_14;
  }
  unsigned int v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    currentModesConfiguration = self->_currentModesConfiguration;
    CFStringRef v5 = v3;
    unsigned int v6 = [(AFModesConfiguration *)currentModesConfiguration isSiriAutoPrompt];
    CFStringRef v7 = @"FlexibleFollowup";
    if (v6) {
      CFStringRef v7 = @"SiriAutoPrompt";
    }
    int v13 = 136315394;
    int v14 = "-[ADResponseModeProvider _updateStickiness]";
    __int16 v15 = 2112;
    CFStringRef v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s #modes Checking screenEngagement stickiness for %@", (uint8_t *)&v13, 0x16u);
  }
  if (([(AFModesConfiguration *)self->_currentModesConfiguration isRequestMadeWithPhysicalDeviceInteraction] & 1) != 0|| (id previousDeviceMotion = self->_previousDeviceMotion, previousDeviceMotion != [(AFModesConfiguration *)self->_currentModesConfiguration deviceMotion])|| (previousScreenOnState = self->_previousScreenOnState, previousScreenOnState != [(AFModesConfiguration *)self->_currentModesConfiguration isDeviceScreenON]))
  {
    id v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315138;
      int v14 = "-[ADResponseModeProvider _updateStickiness]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #modes Will compute new value for screen engagement as we detected ReInvocation OR CoreMotion change OR Wake/Sleep state change for multiturn or Flexible Followup", (uint8_t *)&v13, 0xCu);
    }
    goto LABEL_13;
  }
  BOOL v10 = 1;
LABEL_14:
  self->_id previousDeviceMotion = (int64_t)[(AFModesConfiguration *)self->_currentModesConfiguration deviceMotion];
  self->_int previousScreenOnState = [(AFModesConfiguration *)self->_currentModesConfiguration isDeviceScreenON];
  return v10;
}

- (BOOL)_isScreenEngaged
{
  if (([(AFModesConfiguration *)self->_currentModesConfiguration isRequestMadeWithPhysicalDeviceInteraction] & 1) != 0|| [(AFModesConfiguration *)self->_currentModesConfiguration liftToWakeDetected])
  {
    unsigned int v3 = (void *)AFSiriLogContextConnection;
    LOBYTE(v4) = 1;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      currentModesConfiguration = self->_currentModesConfiguration;
      unsigned int v6 = v3;
      if ([(AFModesConfiguration *)currentModesConfiguration isRequestMadeWithPhysicalDeviceInteraction])CFStringRef v7 = @"YES"; {
      else
      }
        CFStringRef v7 = @"NO";
      unsigned int v8 = [(AFModesConfiguration *)self->_currentModesConfiguration liftToWakeDetected];
      int v21 = 136315650;
      int v22 = "-[ADResponseModeProvider _isScreenEngaged]";
      if (v8) {
        CFStringRef v9 = @"YES";
      }
      else {
        CFStringRef v9 = @"NO";
      }
      __int16 v23 = 2112;
      CFStringRef v24 = v7;
      __int16 v25 = 2112;
      CFStringRef v26 = v9;
      LOBYTE(v4) = 1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s #modes ScreenEngagement - Device Invocation = %@, liftToWakeDetected = %@", (uint8_t *)&v21, 0x20u);
    }
    return v4;
  }
  if (([(AFModesConfiguration *)self->_currentModesConfiguration isDeviceScreenON] & 1) == 0)
  {
    id v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      int v22 = "-[ADResponseModeProvider _isScreenEngaged]";
      BOOL v12 = "%s #modes ScreenEngagement - Device Screen is off";
LABEL_20:
      int v13 = v11;
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v21, 0xCu);
    }
LABEL_22:
    LOBYTE(v4) = 0;
    return v4;
  }
  if ([(AFModesConfiguration *)self->_currentModesConfiguration deviceMotion] == (id)2)
  {
    BOOL v10 = AFSiriLogContextConnection;
    LOBYTE(v4) = 1;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      int v22 = "-[ADResponseModeProvider _isScreenEngaged]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s #modes ScreenEngagement - Device is moving", (uint8_t *)&v21, 0xCu);
    }
    return v4;
  }
  if ([(AFModesConfiguration *)self->_currentModesConfiguration deviceMotion] == (id)1)
  {
    id v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v21 = 136315138;
      int v22 = "-[ADResponseModeProvider _isScreenEngaged]";
      BOOL v12 = "%s #modes ScreenEngagement - Device is stationary";
      goto LABEL_20;
    }
    goto LABEL_22;
  }
  id v15 = [(AFModesConfiguration *)self->_currentModesConfiguration deviceMotion];
  CFStringRef v16 = AFSiriLogContextConnection;
  BOOL v17 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
  if (v15 != (id)3)
  {
    if (!v17) {
      goto LABEL_22;
    }
    int v21 = 136315138;
    int v22 = "-[ADResponseModeProvider _isScreenEngaged]";
    BOOL v12 = "%s #modes ScreenEngagement - No ScreenEngagement heuristics detected";
    int v13 = v16;
    goto LABEL_21;
  }
  if (v17)
  {
    CFStringRef v18 = v16;
    unsigned int v19 = [(ADResponseModeProvider *)self _isAudioAccessoryConnected];
    CFStringRef v20 = @"notConnected";
    if (v19) {
      CFStringRef v20 = @"Connected";
    }
    int v21 = 136315394;
    int v22 = "-[ADResponseModeProvider _isScreenEngaged]";
    __int16 v23 = 2112;
    CFStringRef v24 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s #modes ScreenEngagement - Device is in a moving environment and audio accessory connected = %@", (uint8_t *)&v21, 0x16u);
  }
  return ![(ADResponseModeProvider *)self _isAudioAccessoryConnected];
}

- (BOOL)_isDeviceUnlocked
{
  unsigned int v2 = [(AFModesConfiguration *)self->_currentModesConfiguration isDeviceUnlocked];
  unsigned int v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    CFStringRef v4 = @"LOCKED";
    if (v2) {
      CFStringRef v4 = @"UNLOCKED";
    }
    int v6 = 136315394;
    CFStringRef v7 = "-[ADResponseModeProvider _isDeviceUnlocked]";
    __int16 v8 = 2112;
    CFStringRef v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s #modes Unlocked/Lock State: %@", (uint8_t *)&v6, 0x16u);
  }
  return v2;
}

- (int64_t)_voiceFeedbackSetting
{
  unsigned int v2 = +[AFPreferences sharedPreferences];
  unint64_t v3 = (unint64_t)[v2 useDeviceSpeakerForTTS];
  if (v3 > 3) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = qword_1003E2A90[v3];
  }

  return v4;
}

- (BOOL)_deviceUnlockSignalEnabled
{
  unsigned int v2 = +[AFPreferences sharedPreferences];
  unsigned int v3 = [v2 deviceUnlockSignalEnabled];

  int64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 136315394;
    __int16 v8 = "-[ADResponseModeProvider _deviceUnlockSignalEnabled]";
    __int16 v9 = 2112;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #modes Turn on Unlock Signal: %@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
}

- (BOOL)_overrideModeWhenInAmbient
{
  unsigned int v2 = +[AFPreferences sharedPreferences];
  unsigned int v3 = [v2 overrideModeWhileInAmbient];

  int64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    int v7 = 136315394;
    __int16 v8 = "-[ADResponseModeProvider _overrideModeWhenInAmbient]";
    __int16 v9 = 2112;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s #modes Override Mode When In Ambient: %@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
}

- (BOOL)_isThirdPartyBTConnected
{
  return self->_isConnectedToThirdPartyBT;
}

- (BOOL)_isAudioAccessoryConnected
{
  if ([(ADResponseModeProvider *)self _isSteveNoteConnected])
  {
    unsigned int v3 = AFSiriLogContextConnection;
    BOOL v4 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    if (v4)
    {
      int v6 = 136315138;
      int v7 = "-[ADResponseModeProvider _isAudioAccessoryConnected]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s #modes Steve Note is connected, ignoring AudioAccessoryConnected detection for Steve Note", (uint8_t *)&v6, 0xCu);
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = self->_isConnectedToAudioAccessory;
  }
  return v4;
}

- (BOOL)_isSteveNoteConnected
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.airplay"];
  unsigned int v3 = [v2 BOOLForKey:@"TetheredDemoMode"];
  BOOL v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    CFStringRef v5 = @"notConnected";
    if (v3) {
      CFStringRef v5 = @"Connected";
    }
    int v7 = 136315394;
    __int16 v8 = "-[ADResponseModeProvider _isSteveNoteConnected]";
    __int16 v9 = 2112;
    CFStringRef v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s #modes Steve Note is = %@", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

- (BOOL)_isDeviceSilent
{
  unsigned int v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    ringerStateObserver = self->_ringerStateObserver;
    CFStringRef v5 = v3;
    int v7 = 136315394;
    __int16 v8 = "-[ADResponseModeProvider _isDeviceSilent]";
    __int16 v9 = 2048;
    id v10 = [(AFNotifyObserver *)ringerStateObserver state];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s #modes Device RingerSwitchState : %ld", (uint8_t *)&v7, 0x16u);
  }
  return [(AFNotifyObserver *)self->_ringerStateObserver state] == 0;
}

- (id)fetchCurrentMode
{
  uint64_t v7 = 0;
  __int16 v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_10005B5A4;
  id v11 = sub_10005B5B4;
  id v12 = SAUIResponseModeDisplayForwardValue;
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005B5BC;
  v6[3] = &unk_10050D5F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)updateModesConfiguration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  uint64_t v9 = sub_10005B744;
  id v10 = &unk_10050E160;
  id v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async(queue, &v7);
  [(ADResponseModeProvider *)self _computeMode];
}

- (ADResponseModeProvider)init
{
  v19.receiver = self;
  v19.super_class = (Class)ADResponseModeProvider;
  id v2 = [(ADResponseModeProvider *)&v19 init];
  if (v2)
  {
    unsigned int v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.siri.mode", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_DEFAULT, 0);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.siri.systemstateaccess", v8);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v9;

    uint64_t v11 = +[AVOutputContext sharedSystemAudioContext];
    sharedSystemAudioContext = v2->_sharedSystemAudioContext;
    v2->_sharedSystemAudioContext = (AVOutputContext *)v11;

    *(_WORD *)&v2->_isConnectedToAudioAccessory = 0;
    v2->_isConnectedToAppleBTHeadphones = 0;
    [(ADResponseModeProvider *)v2 _fetchConnectedAudioAccessoryState];
    int v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v2 selector:"_connectedOutputDevicesDidChange:" name:AVOutputContextOutputDeviceDidChangeNotification object:0];

    int v14 = (AFNotifyObserver *)[objc_alloc((Class)AFNotifyObserver) initWithName:@"com.apple.springboard.ringerstate" options:1 queue:v2->_accessQueue delegate:0];
    ringerStateObserver = v2->_ringerStateObserver;
    v2->_ringerStateObserver = v14;

    *(_DWORD *)&v2->_int previousScreenOnState = 0;
    v2->_id previousDeviceMotion = 0;
    CFStringRef v16 = (GEONavigationListener *)[objc_alloc((Class)GEONavigationListener) initWithQueue:v2->_queue];
    navigationListener = v2->_navigationListener;
    v2->_navigationListener = v16;
  }
  return v2;
}

@end