@interface CSVoiceTriggerAPModeSuspendPolicyIOS
- (BOOL)_isAudioRouteIneligibleForAP;
- (BOOL)_isHearstRoutedAndWithNoPhoneCall;
- (BOOL)_isInPhoneCallStateWithHSPhoneCallCapableRoute;
- (BOOL)_isJarvisRouted;
- (BOOL)_isSpeechDetectionDevicePresent;
- (BOOL)isAssistantClientConsideredAsRecord;
- (CSVoiceTriggerAPModeSuspendPolicyIOS)init;
- (NSString)pendingRecordingStopUUID;
- (void)_addConditionsForIOSAOP;
- (void)_addConditionsForIOSBargeIn;
- (void)_addVoiceTriggerAPModeSuspendConditions;
- (void)_handleClientRecordStateDidChange:(BOOL)a3 eventUUID:(id)a4;
- (void)_subscribeEventMonitors;
- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6;
- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5;
- (void)setIsAssistantClientConsideredAsRecord:(BOOL)a3;
- (void)setPendingRecordingStopUUID:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didChangedRecordState:(BOOL)a4 withEventUUID:(id)a5 withContext:(id)a6;
@end

@implementation CSVoiceTriggerAPModeSuspendPolicyIOS

- (BOOL)_isAudioRouteIneligibleForAP
{
  unsigned int v3 = [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self _isSpeechDetectionDevicePresent];
  unsigned int v4 = [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self _isHearstRoutedAndWithNoPhoneCall];
  unsigned int v5 = [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self _isJarvisRouted];
  int v6 = v3 ^ 1 | v4 | v5;
  if (v6 == 1)
  {
    unsigned int v7 = v5;
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315906;
      v11 = "-[CSVoiceTriggerAPModeSuspendPolicyIOS _isAudioRouteIneligibleForAP]";
      __int16 v12 = 1024;
      unsigned int v13 = v3;
      __int16 v14 = 1024;
      unsigned int v15 = v4;
      __int16 v16 = 1024;
      unsigned int v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s VAD is not present (%d) or Hearst routed without phone call (%d) or Jarvis routed (%d)", (uint8_t *)&v10, 0x1Eu);
    }
  }
  return v6;
}

- (BOOL)_isHearstRoutedAndWithNoPhoneCall
{
  v2 = +[CSAudioRouteChangeMonitor sharedInstance];
  id v3 = [v2 hearstRouteStatus];

  unint64_t v4 = (unint64_t)v3 - 1;
  unsigned int v5 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
  id v6 = [v5 phoneCallState];

  return v4 < 2 && (unint64_t)v6 < 2;
}

- (BOOL)_isJarvisRouted
{
  v2 = +[CSAudioRouteChangeMonitor sharedInstance];
  unsigned __int8 v3 = [v2 jarvisConnected];

  unint64_t v4 = +[CSAudioRouteChangeMonitor sharedInstance];
  unsigned int v5 = (char *)[v4 hearstRouteStatus];

  if ((unint64_t)(v5 - 3) < 0xFFFFFFFFFFFFFFFELL) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)_isSpeechDetectionDevicePresent
{
  v2 = +[CSSpeechDetectionDevicePresentMonitor sharedInstance];
  unsigned __int8 v3 = [v2 isPresent];

  if ((v3 & 1) == 0)
  {
    unint64_t v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      unsigned int v7 = "-[CSVoiceTriggerAPModeSuspendPolicyIOS _isSpeechDetectionDevicePresent]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Speech Detection VAD is not available, we will still running in AOP mode", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRecordingStopUUID, 0);
  objc_storeStrong((id *)&self->_recordStateQueue, 0);
}

- (void)setPendingRecordingStopUUID:(id)a3
{
}

- (NSString)pendingRecordingStopUUID
{
  return self->_pendingRecordingStopUUID;
}

- (void)setIsAssistantClientConsideredAsRecord:(BOOL)a3
{
  self->_isAssistantClientConsideredAsRecord = a3;
}

- (BOOL)isAssistantClientConsideredAsRecord
{
  return self->_isAssistantClientConsideredAsRecord;
}

- (void)siriClientBehaviorMonitor:(id)a3 didChangedRecordState:(BOOL)a4 withEventUUID:(id)a5 withContext:(id)a6
{
  id v8 = a5;
  recordStateQueue = self->_recordStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016CE9C;
  block[3] = &unk_1002537C0;
  BOOL v13 = a4;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(recordStateQueue, block);
}

- (void)intuitiveConvAudioCaptureMonitorDidStopAudioCapture:(id)a3 stopStreamOption:(id)a4 eventUUID:(id)a5
{
  id v6 = a5;
  recordStateQueue = self->_recordStateQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10016CF4C;
  v9[3] = &unk_100253B08;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(recordStateQueue, v9);
}

- (void)intuitiveConvAudioCaptureMonitor:(id)a3 didStartAudioCaptureSuccessfully:(BOOL)a4 option:(id)a5 eventUUID:(id)a6
{
  id v8 = a6;
  recordStateQueue = self->_recordStateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10016D00C;
  block[3] = &unk_1002537C0;
  BOOL v13 = a4;
  block[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(recordStateQueue, block);
}

- (void)_handleClientRecordStateDidChange:(BOOL)a3 eventUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self setIsAssistantClientConsideredAsRecord:1];
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self setPendingRecordingStopUUID:0];
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self notifyCallbackWithOption:0];
  }
  else
  {
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self setPendingRecordingStopUUID:v6];
    unsigned int v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v14 = "-[CSVoiceTriggerAPModeSuspendPolicyIOS _handleClientRecordStateDidChange:eventUUID:]";
      __int16 v15 = 2050;
      uint64_t v16 = 0x4010000000000000;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Will notify Siri Client record state change to STOPPED in %{public}f seconds, eventUUID = %{public}@", buf, 0x20u);
    }
    objc_initWeak((id *)buf, self);
    dispatch_time_t v8 = dispatch_time(0, 4000000000);
    recordStateQueue = self->_recordStateQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10016D1F4;
    v10[3] = &unk_100253798;
    objc_copyWeak(&v12, (id *)buf);
    id v11 = v6;
    dispatch_after(v8, recordStateQueue, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)_isInPhoneCallStateWithHSPhoneCallCapableRoute
{
  v2 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
  unsigned __int8 v3 = (char *)[v2 phoneCallState];

  if (v3 == (char *)2) {
    unsigned int v4 = +[CSUtils supportRingtoneA2DP] ^ 1;
  }
  else {
    unsigned int v4 = 0;
  }
  unsigned int v5 = +[CSUtils fetchHypotheticalBluetoothRouteProductIdFromAudioSessionId:0];
  if (v5) {
    int v6 = AFBTProductIDSupportsAnnounce();
  }
  else {
    int v6 = 0;
  }
  id v7 = +[CSUtils fetchHypotheticalRouteType];
  dispatch_time_t v8 = +[CSMXRingtoneMonitor sharedInstance];
  unsigned int v9 = [v8 isAnyRingtoneCurrentlyPlaying];

  if (+[CSUtils supportHandsFree]
    && ((v4 & 1) != 0 || ((unint64_t)(v3 - 3) < 2 ? (int v10 = 1) : (int v10 = v9), v10 == 1)))
  {
    if (v7 == (id)1) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = v6;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  uint64_t v12 = qword_1002A3CB8;
  if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * qword_1002A3CB8, 2) <= 0xCCCCCCCCCCCCCCCuLL)
  {
    unsigned int v16 = v4;
    BOOL v13 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = v13;
      *(_DWORD *)buf = 136316930;
      id v18 = "-[CSVoiceTriggerAPModeSuspendPolicyIOS _isInPhoneCallStateWithHSPhoneCallCapableRoute]";
      __int16 v19 = 1024;
      unsigned int v20 = +[CSUtils supportHandsFree];
      __int16 v21 = 1024;
      unsigned int v22 = v16;
      __int16 v23 = 1024;
      unsigned int v24 = v9;
      __int16 v25 = 1024;
      int v26 = (int)v3;
      __int16 v27 = 1024;
      int v28 = v6;
      __int16 v29 = 1024;
      BOOL v30 = v7 == (id)1;
      __int16 v31 = 1024;
      BOOL v32 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #PhoneStates: SpprtHF(%d) RingtoneHFP(%d) RingtoneNotfcn(%d) phoneCallState(%u) hsCallHeadsetCnnctd(%d) builtInRoute(%d). Result(%d)", buf, 0x36u);

      uint64_t v12 = qword_1002A3CB8;
    }
  }
  qword_1002A3CB8 = v12 + 1;

  return v11;
}

- (void)_addConditionsForIOSAOP
{
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10016D844;
  v9[3] = &unk_100253730;
  objc_copyWeak(&v10, &location);
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:v9];
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:&stru_100253770];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10016D94C;
  v7[3] = &unk_100253730;
  objc_copyWeak(&v8, &location);
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10016DA40;
  v5[3] = &unk_100253730;
  objc_copyWeak(&v6, &location);
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:v5];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10016DB98;
  v3[3] = &unk_100253730;
  objc_copyWeak(&v4, &location);
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_addConditionsForIOSBargeIn
{
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000038EC;
  v13[3] = &unk_100253730;
  objc_copyWeak(&v14, &location);
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:v13];
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:&stru_100253750];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003E1C;
  v11[3] = &unk_100253730;
  objc_copyWeak(&v12, &location);
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:v11];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100003588;
  v9[3] = &unk_100253730;
  objc_copyWeak(&v10, &location);
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:v9];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000041F0;
  v7[3] = &unk_100253730;
  objc_copyWeak(&v8, &location);
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000348C;
  v5[3] = &unk_100253730;
  objc_copyWeak(&v6, &location);
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:v5];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100003398;
  v3[3] = &unk_100253730;
  objc_copyWeak(&v4, &location);
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_addVoiceTriggerAPModeSuspendConditions
{
  if (+[CSUtils isIOSDeviceSupportingBargeIn])
  {
    unsigned __int8 v3 = +[CSFPreferences sharedPreferences];
    unsigned int v4 = [v3 forceVoiceTriggerAPMode];

    if (v4)
    {
      unsigned int v5 = &stru_1002536E8;
LABEL_13:
      [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self addConditions:v5];
      return;
    }
  }
  if (+[CSUtils isIOSDeviceSupportingBargeIn])
  {
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self _addConditionsForIOSBargeIn];
  }
  else
  {
    if (!CSHasAOP())
    {
      unsigned int v5 = &stru_100253708;
      goto LABEL_13;
    }
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self _addConditionsForIOSAOP];
  }
}

- (void)_subscribeEventMonitors
{
  if (+[CSUtils isIOSDeviceSupportingBargeIn])
  {
    unsigned __int8 v3 = +[CSBuiltinSpeakerStateMonitor sharedInstance];
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self subscribeEventMonitor:v3];

    unsigned int v4 = +[CSAudioRouteChangeMonitor sharedInstance];
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self subscribeEventMonitor:v4];

    unsigned int v5 = +[CSPlaybackVolumeStatusMonitor sharedInstance];
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self subscribeEventMonitor:v5];
  }
  id v6 = +[CSSpeechDetectionDevicePresentMonitor sharedInstance];
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self subscribeEventMonitor:v6];

  id v7 = +[CSAlwaysOnProcessorStateMonitor sharedInstance];
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self subscribeEventMonitor:v7];

  id v8 = +[CSCommandControlStreamEventMonitor sharedInstance];
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self subscribeEventMonitor:v8];

  unsigned int v9 = +[CSAttSiriStateMonitor sharedInstance];
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self subscribeEventMonitor:v9];

  id v10 = +[CSAudioStreamActivityMonitor sharedInstance];
  [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self subscribeEventMonitor:v10];

  if (+[CSUtils supportHandsFree])
  {
    BOOL v11 = +[CSPhoneCallStateMonitorFactory phoneCallStateMonitor];
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self subscribeEventMonitor:v11];

    id v12 = +[CSMXRingtoneMonitor sharedInstance];
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)self subscribeEventMonitor:v12];
  }
}

- (CSVoiceTriggerAPModeSuspendPolicyIOS)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSVoiceTriggerAPModeSuspendPolicyIOS;
  v2 = [(CSVoiceTriggerAPModeSuspendPolicyIOS *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSVoiceTriggerAPModeSuspendPolicyIOS RecordState queue", 0);
    recordStateQueue = v2->_recordStateQueue;
    v2->_recordStateQueue = (OS_dispatch_queue *)v3;

    v2->_isAssistantClientConsideredAsRecord = 0;
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)v2 _addVoiceTriggerAPModeSuspendConditions];
    [(CSVoiceTriggerAPModeSuspendPolicyIOS *)v2 _subscribeEventMonitors];
    unsigned int v5 = +[CSSiriClientBehaviorMonitor sharedInstance];
    [v5 registerObserver:v2];

    id v6 = +[CSIntuitiveConvAudioCaptureMonitor sharedInstance];
    [v6 registerObserver:v2];
  }
  return v2;
}

@end