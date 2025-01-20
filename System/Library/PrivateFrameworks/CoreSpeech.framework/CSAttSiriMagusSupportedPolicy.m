@interface CSAttSiriMagusSupportedPolicy
+ (BOOL)_isInputOriginSupportedByContinuousConversation:(id)a3;
+ (BOOL)isCurrentlyInActiveCall;
+ (BOOL)isCurrentlyInSplitterState;
+ (CSAttSiriMagusSupportedPolicy)sharedInstance;
+ (void)initialize;
- (BOOL)_isMagusSupportedWithRecordRoute:(id)a3 playbackRoute:(id)a4 isInSplitterMode:(BOOL)a5 isInActiveCall:(BOOL)a6 isSupportedRequestType:(BOOL)a7 audioSessionId:(unsigned int)a8 recordDeviceInfo:(id)a9;
- (BOOL)_isRouteValidForEchoCancellationWithAppleSiliconMac:(id)a3;
- (BOOL)getIsAssetMagusSupported;
- (BOOL)isAssetMagusSupported;
- (BOOL)isMagusSupportedWithAudioRecordContext:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5 audioSessionId:(unsigned int)a6 recordDeviceInfo:(id)a7;
- (BOOL)isMagusSupportedWithInputOrigin:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5;
- (BOOL)isMagusSupportedWithInputOrigin:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5 isInSplitterMode:(BOOL)a6 isInActiveCall:(BOOL)a7;
- (void)_updateWithAsset:(id)a3;
- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5;
- (void)setIsAssetMagusSupported:(BOOL)a3;
- (void)start;
@end

@implementation CSAttSiriMagusSupportedPolicy

- (void)setIsAssetMagusSupported:(BOOL)a3
{
  self->_isAssetMagusSupported = a3;
}

- (BOOL)isAssetMagusSupported
{
  return self->_isAssetMagusSupported;
}

- (void)mitigationAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
}

- (void)_updateWithAsset:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[CSUtils isContinuousConversationSupported];
  unsigned int v6 = [v4 isMagusSupported];

  self->_isAssetMagusSupported = v5 & v6;
  v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    v9 = "-[CSAttSiriMagusSupportedPolicy _updateWithAsset:]";
    __int16 v10 = 1024;
    unsigned int v11 = v5;
    __int16 v12 = 1024;
    unsigned int v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s DeviceSupport %d AssetSupport %d", (uint8_t *)&v8, 0x18u);
  }
}

- (void)start
{
  v3 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
  [v3 addObserver:self];

  self->_isAssetMagusSupported = 0;
  id v4 = +[CSBluetoothWirelessSplitterMonitor sharedInstance];
  [v4 addObserver:self];

  if (+[CSUtils isMedocFeatureEnabled])
  {
    if (+[CSUtils isContinuousConversationSupported])
    {
      unsigned int v5 = +[CSAttSiriMitigationAssetHandler sharedHandlerDisabledOnDeviceCompilation];
      [v5 registerObserver:self];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100093434;
      v6[3] = &unk_100252DF0;
      v6[4] = self;
      [v5 getMitigationAssetWithEndpointId:0 completion:v6];
    }
  }
}

- (BOOL)_isMagusSupportedWithRecordRoute:(id)a3 playbackRoute:(id)a4 isInSplitterMode:(BOOL)a5 isInActiveCall:(BOOL)a6 isSupportedRequestType:(BOOL)a7 audioSessionId:(unsigned int)a8 recordDeviceInfo:(id)a9
{
  uint64_t v9 = *(void *)&a8;
  BOOL v56 = a7;
  BOOL v53 = a5;
  BOOL v54 = a6;
  unsigned int v11 = (__CFString *)a3;
  __int16 v12 = (__CFString *)a4;
  id v13 = a9;
  if (+[CSUtils isExclaveHardware]
    && (+[CSUtils isSiriDSPTurnedOn] & 1) == 0)
  {
    v19 = CSLogContextFacilityCoreSpeech;
    LOBYTE(v20) = 0;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Disable FF since this is Exclave hardware without Siri DSP", buf, 0xCu);
      LOBYTE(v20) = 0;
    }
    goto LABEL_73;
  }
  if (+[CSUtils isJarvisAudioRouteWithRecordRoute:v11])
  {
    unsigned int v14 = +[CSUtils isCarplayWithFlexibleFollowupEnabled];
    v15 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v16 = @"NO";
      if (v14) {
        CFStringRef v16 = @"YES";
      }
      *(_DWORD *)buf = 136315394;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      __int16 v59 = 2114;
      CFStringRef v60 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Jarvis route supports FF? %{public}@", buf, 0x16u);
    }
  }
  else
  {
    v17 = +[CSFPreferences sharedPreferences];
    unsigned int v18 = [v17 programmableAudioInjectionEnabled];

    if (v18)
    {
      unsigned int v14 = 1;
      if (+[CSUtils isBuiltInRouteWithRecordRoute:v11 playbackRoute:v12])goto LABEL_22; {
    }
      }
    else
    {
      int v21 = CSIsAppleSiliconMac();
      unsigned int v22 = +[CSUtils isBuiltInRecordRoute:v11];
      char v23 = v22;
      if (v21)
      {
        unsigned int v14 = [(CSAttSiriMagusSupportedPolicy *)self _isRouteValidForEchoCancellationWithAppleSiliconMac:v13];
        if (v23) {
          goto LABEL_22;
        }
      }
      else if (v22)
      {
        unsigned int v14 = 1;
        if (+[CSUtils fetchHypotheticalRouteTypeFromAudioSessionId:v9] == (id)1)goto LABEL_22; {
      }
        }
      else
      {
        unsigned int v14 = 1;
      }
    }
    if (!+[CSUtils isOutOfBandAudioRouteWithRecordRoute:v11])unsigned int v14 = 0; {
  }
    }
LABEL_22:
  id v51 = v13;
  v24 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isAssetMagusSupported = self->_isAssetMagusSupported;
    *(_DWORD *)buf = 136316418;
    v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall"
          ":isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
    __int16 v59 = 2112;
    CFStringRef v60 = v11;
    __int16 v61 = 2112;
    CFStringRef v62 = v12;
    __int16 v63 = 1024;
    *(_DWORD *)v64 = v14;
    *(_WORD *)&v64[4] = 1024;
    *(_DWORD *)&v64[6] = isAssetMagusSupported;
    LOWORD(v65) = 1024;
    *(_DWORD *)((char *)&v65 + 2) = v53;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s recordRoute : %@, playbackRoute : %@, isSupportedRoute : %d, isAssetMagusSupported : %d, isInSplitterMode : %d", buf, 0x32u);
  }
  v52 = v12;
  v26 = v11;
  unsigned int v27 = +[CSUtils isContinuousConversationSupported];
  unsigned int v28 = +[CSUtils isContinuousConversationEnabled];
  v29 = +[CSFPreferences sharedPreferences];
  unsigned int v30 = [v29 isFlexibleFollowupsUserDisabled];

  v31 = +[CSUtils getSiriLanguageWithFallback:0];
  unsigned int v32 = +[CSUtils isMagusDisabledForLanguageCode:v31];

  unsigned int v33 = +[AFSystemAssistantExperienceStatusManager isSAEEnabled];
  int v20 = 0;
  int v34 = AFPreferencesTypeToSiriEnabled() & (v33 ^ 1);
  if (v27)
  {
    if (v28)
    {
      if ((v30 & 1) == 0 && v56 && ((v14 ^ 1) & 1) == 0)
      {
        int v20 = 0;
        if (self->_isAssetMagusSupported && !v54 && !v53) {
          int v20 = (v34 | v32) ^ 1;
        }
      }
    }
  }
  v35 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v36 = @"NO";
    if (v20) {
      CFStringRef v37 = @"YES";
    }
    else {
      CFStringRef v37 = @"NO";
    }
    *(_DWORD *)buf = 136317442;
    v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall"
          ":isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
    if (v54) {
      CFStringRef v38 = @"YES";
    }
    else {
      CFStringRef v38 = @"NO";
    }
    __int16 v59 = 2112;
    CFStringRef v60 = v37;
    if (v27) {
      CFStringRef v39 = @"YES";
    }
    else {
      CFStringRef v39 = @"NO";
    }
    __int16 v61 = 2112;
    CFStringRef v62 = v38;
    if (v28) {
      CFStringRef v40 = @"YES";
    }
    else {
      CFStringRef v40 = @"NO";
    }
    __int16 v63 = 2112;
    *(void *)v64 = v39;
    if (v56) {
      CFStringRef v41 = @"YES";
    }
    else {
      CFStringRef v41 = @"NO";
    }
    *(_WORD *)&v64[8] = 2112;
    if (v30) {
      CFStringRef v42 = @"YES";
    }
    else {
      CFStringRef v42 = @"NO";
    }
    CFStringRef v65 = v40;
    if (v34) {
      CFStringRef v43 = @"YES";
    }
    else {
      CFStringRef v43 = @"NO";
    }
    __int16 v66 = 2112;
    if (v32) {
      CFStringRef v44 = @"YES";
    }
    else {
      CFStringRef v44 = @"NO";
    }
    CFStringRef v67 = v41;
    if (v33) {
      CFStringRef v36 = @"YES";
    }
    __int16 v68 = 2112;
    CFStringRef v69 = v42;
    __int16 v70 = 2112;
    CFStringRef v71 = v43;
    __int16 v72 = 2112;
    CFStringRef v73 = v44;
    __int16 v74 = 2112;
    CFStringRef v75 = v36;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s isSupported=%@: Is request during active call? %@, isDeviceSupported: %@, isFFEnabledOnDevice: %@, isSupportedRequestType: %@, isFFUserDisabled: %@, isTypeToSiriEnabled: %@, isLocaleInDenyList:%@, isSAEEnabled:%@", buf, 0x66u);
  }
  if ((v27 & 1) == 0)
  {
    v47 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%s Magus is not supported since it's not a FF-capable device", buf, 0xCu);
    }
    unsigned int v11 = v26;
    goto LABEL_71;
  }
  if ((v28 & 1) == 0)
  {
    v48 = CSLogCategoryRequest;
    unsigned int v11 = v26;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s Magus is not supported since Flexible Followup is not enabled on device", buf, 0xCu);
    }
LABEL_71:
    __int16 v12 = v52;
    goto LABEL_72;
  }
  unsigned int v11 = v26;
  if (v30)
  {
    v45 = CSLogCategoryRequest;
    __int16 v12 = v52;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      v46 = "%s Magus is not supported since user disabled switch";
LABEL_92:
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);
      goto LABEL_72;
    }
    goto LABEL_72;
  }
  __int16 v12 = v52;
  if (!v56)
  {
    v45 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      v46 = "%s Magus is not supported since request type is ineligible";
      goto LABEL_92;
    }
    goto LABEL_72;
  }
  if ((v14 & 1) == 0)
  {
    v45 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      v46 = "%s Magus is not supported since audio route is ineligible";
      goto LABEL_92;
    }
    goto LABEL_72;
  }
  if (!self->_isAssetMagusSupported)
  {
    v45 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      v46 = "%s Magus is not supported since assets are ineligible";
      goto LABEL_92;
    }
    goto LABEL_72;
  }
  if (v54)
  {
    v45 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      v46 = "%s Magus is not supported since device is in active call";
      goto LABEL_92;
    }
LABEL_72:
    id v13 = v51;
    goto LABEL_73;
  }
  if (v53)
  {
    v45 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      v46 = "%s Magus is not supported since device is in splitter mode";
      goto LABEL_92;
    }
    goto LABEL_72;
  }
  if (v34)
  {
    v45 = CSLogCategoryRequest;
    if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCa"
            "ll:isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
      v46 = "%s Magus is not supported since Type-To-Siri is enabled";
      goto LABEL_92;
    }
    goto LABEL_72;
  }
  if (!v32) {
    goto LABEL_72;
  }
  v50 = CSLogCategoryRequest;
  id v13 = v51;
  if (os_log_type_enabled(CSLogCategoryRequest, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v58 = "-[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall"
          ":isSupportedRequestType:audioSessionId:recordDeviceInfo:]";
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "%s Magus is not supported since locale is ineligible", buf, 0xCu);
  }
LABEL_73:

  return v20;
}

- (BOOL)_isRouteValidForEchoCancellationWithAppleSiliconMac:(id)a3
{
  return 1;
}

- (BOOL)isMagusSupportedWithAudioRecordContext:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5 audioSessionId:(unsigned int)a6 recordDeviceInfo:(id)a7
{
  uint64_t v7 = *(void *)&a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  LOBYTE(v7) = -[CSAttSiriMagusSupportedPolicy _isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:](self, "_isMagusSupportedWithRecordRoute:playbackRoute:isInSplitterMode:isInActiveCall:isSupportedRequestType:audioSessionId:recordDeviceInfo:", v14, v13, +[CSAttSiriMagusSupportedPolicy isCurrentlyInSplitterState](CSAttSiriMagusSupportedPolicy, "isCurrentlyInSplitterState"), +[CSAttSiriMagusSupportedPolicy isCurrentlyInActiveCall](CSAttSiriMagusSupportedPolicy, "isCurrentlyInActiveCall"), [a3 isAudioRecordTypeSupportedByContinuousConversation], v7, v12);

  return v7;
}

- (BOOL)isMagusSupportedWithInputOrigin:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  LOBYTE(a3) = [(CSAttSiriMagusSupportedPolicy *)self _isMagusSupportedWithRecordRoute:v9 playbackRoute:v8 isInSplitterMode:+[CSAttSiriMagusSupportedPolicy isCurrentlyInSplitterState](CSAttSiriMagusSupportedPolicy, "isCurrentlyInSplitterState") isInActiveCall:+[CSAttSiriMagusSupportedPolicy isCurrentlyInActiveCall](CSAttSiriMagusSupportedPolicy, "isCurrentlyInActiveCall") isSupportedRequestType:+[CSAttSiriMagusSupportedPolicy _isInputOriginSupportedByContinuousConversation:a3] audioSessionId:0 recordDeviceInfo:0];

  return (char)a3;
}

- (BOOL)isMagusSupportedWithInputOrigin:(id)a3 recordRoute:(id)a4 playbackRoute:(id)a5 isInSplitterMode:(BOOL)a6 isInActiveCall:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  LOBYTE(v7) = [(CSAttSiriMagusSupportedPolicy *)self _isMagusSupportedWithRecordRoute:v13 playbackRoute:v12 isInSplitterMode:v8 isInActiveCall:v7 isSupportedRequestType:+[CSAttSiriMagusSupportedPolicy _isInputOriginSupportedByContinuousConversation:a3] audioSessionId:0 recordDeviceInfo:0];

  return v7;
}

- (BOOL)getIsAssetMagusSupported
{
  return self->_isAssetMagusSupported;
}

+ (BOOL)_isInputOriginSupportedByContinuousConversation:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:SAInputOriginHomeButtonValue] & 1) != 0
    || ([v3 isEqualToString:SAInputOriginRemoteButtonValue] & 1) != 0
    || ([v3 isEqualToString:SAInputOriginAssistantSpeechButtonValue] & 1) != 0
    || ([v3 isEqualToString:SAInputOriginVoiceTriggerValue] & 1) != 0
    || ([v3 isEqualToString:SAInputOriginServerGeneratedValue] & 1) != 0
    || ([v3 isEqualToString:SAInputOriginMagusFollowupValue] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    unsigned __int8 v4 = [v3 isEqualToString:SAInputOriginClientGeneratedValue];
  }

  return v4;
}

+ (BOOL)isCurrentlyInActiveCall
{
  v2 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
  id v3 = (char *)[v2 phoneCallState];

  return (unint64_t)(v3 - 2) < 3;
}

+ (BOOL)isCurrentlyInSplitterState
{
  v2 = +[CSBluetoothWirelessSplitterMonitor sharedInstance];
  id v3 = [v2 splitterState];

  return (unint64_t)v3 > 1;
}

+ (void)initialize
{
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    unsigned int v5 = "+[CSAttSiriMagusSupportedPolicy initialize]";
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s ", (uint8_t *)&v4, 0xCu);
  }
  id v3 = +[CSCarKitUtils sharedInstance];
}

+ (CSAttSiriMagusSupportedPolicy)sharedInstance
{
  if (qword_1002A3810 != -1) {
    dispatch_once(&qword_1002A3810, &stru_100250158);
  }
  v2 = (void *)qword_1002A3808;
  return (CSAttSiriMagusSupportedPolicy *)v2;
}

@end