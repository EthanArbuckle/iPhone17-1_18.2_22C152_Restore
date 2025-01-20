@interface CSVoiceTriggerEventsCoordinator
+ (CSVoiceTriggerEventsCoordinator)sharedInstance;
- (BOOL)_isVoiceTriggerFromHearst:(id)a3;
- (BOOL)_isVoiceTriggerFromRemora:(id)a3;
- (BOOL)_shouldIgnoreVoiceTriggerEvent:(id)a3;
- (CSVoiceTriggerEventsCoordinator)init;
- (id)_createVoiceTriggerEventInfoString:(id)a3;
- (id)_myriadPhashFromVoiceTriggerInfo:(id)a3;
- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4;
- (void)CSBluetoothWirelessSplitterMonitor:(id)a3 didReceiveSplitterStateChange:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5;
- (void)_notifyKeywordDetect;
- (void)_notifyKeywordReject:(id)a3 deviceId:(id)a4;
- (void)_notifyNearMissEvent:(id)a3 deviceId:(id)a4;
- (void)_notifyRemoteTriggerEvent:(id)a3 myriadHash:(id)a4 remoteTriggerType:(unint64_t)a5 remoteDeviceId:(id)a6 isTriggeredFromFullWake:(BOOL)a7 completion:(id)a8;
- (void)_notifySpeakerReject:(id)a3;
- (void)_notifySuperVector:(id)a3;
- (void)_notifyTriggerEvent:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)_notifyWakeKeywordSpokenEvent:(id)a3 deviceId:(id)a4;
- (void)_printVoiceTriggerMetricsString:(id)a3;
- (void)keywordDetectorDidDetectKeyword;
- (void)raiseToSpeakDetected:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)start;
- (void)unregisterObserver:(id)a3;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4 completion:(id)a5;
- (void)voiceTriggerDidDetectKeyword:(id)a3 myriadHash:(id)a4 remoteTriggerType:(unint64_t)a5 remoteDeviceId:(id)a6 isTriggeredFromFullWake:(BOOL)a7 completion:(id)a8;
- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerDidDetectSpeakerReject:(id)a3;
- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4;
- (void)voiceTriggerGotSuperVector:(id)a3;
@end

@implementation CSVoiceTriggerEventsCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)CSBluetoothWirelessSplitterMonitor:(id)a3 didReceiveSplitterStateChange:(unint64_t)a4 shouldDisableSpeakerVerificationInSplitterMode:(BOOL)a5
{
  queue = self->_queue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001191C8;
  v6[3] = &unk_100253B58;
  v6[4] = self;
  v6[5] = a4;
  dispatch_async(queue, v6);
}

- (void)CSAudioRouteChangeMonitor:(id)a3 didReceiveAudioRouteChangeEvent:(int64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100119248;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_notifySuperVector:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100119304;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_notifyKeywordDetect
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011949C;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_notifyKeywordReject:(id)a3 deviceId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100119674;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_notifySpeakerReject:(id)a3
{
  id v4 = a3;
  [(CSVoiceTriggerEventsCoordinator *)self _notifyWakeKeywordSpokenEvent:v4 deviceId:0];
  if (CSIsInternalBuild()) {
    notify_post("com.apple.voicetrigger.PHSReject");
  }
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100119860;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_notifyNearMissEvent:(id)a3 deviceId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (CSIsInternalBuild()) {
    notify_post("com.apple.voicetrigger.NearTrigger");
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100119A60;
  block[3] = &unk_100253540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)_notifyRemoteTriggerEvent:(id)a3 myriadHash:(id)a4 remoteTriggerType:(unint64_t)a5 remoteDeviceId:(id)a6 isTriggeredFromFullWake:(BOOL)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  v18 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[CSVoiceTriggerEventsCoordinator _notifyRemoteTriggerEvent:myriadHash:remoteTriggerType:remoteDeviceId:isTrig"
          "geredFromFullWake:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s EventNotifier received VoiceTrigger event", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100119D30;
  block[3] = &unk_100251EF0;
  BOOL v30 = a7;
  id v28 = v17;
  unint64_t v29 = a5;
  block[4] = self;
  id v25 = v14;
  id v26 = v16;
  id v27 = v15;
  id v20 = v15;
  id v21 = v16;
  id v22 = v14;
  id v23 = v17;
  dispatch_async(queue, block);
}

- (BOOL)_shouldIgnoreVoiceTriggerEvent:(id)a3
{
  id v4 = a3;
  if (CSIsAppleSiliconMac())
  {
    if (+[CSUtils shouldBlockVoiceTriggerWhenOtherAppRecording])
    {
      v5 = +[CSOtherAppRecordingStateMonitorASMac sharedInstance];
      unsigned int v6 = [v5 isOtherNonEligibleAppRecording];

      if (v6)
      {
        id v7 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315138;
          id v15 = "-[CSVoiceTriggerEventsCoordinator _shouldIgnoreVoiceTriggerEvent:]";
          id v8 = "%s Other app is recording, ignore Voicetrigger notification from ASMac";
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, 0xCu);
          goto LABEL_13;
        }
        goto LABEL_13;
      }
    }
  }
  if ([(CSVoiceTriggerEventsCoordinator *)self _isVoiceTriggerFromHearst:v4]
    || !+[CSUtils supportRemoteDarwinVoiceTrigger])
  {
    goto LABEL_15;
  }
  id v9 = +[CSRemoteDarwinDeviceInfo sharedInstance];
  if (([v9 hasDarwinDeviceConnected] & 1) == 0)
  {

    goto LABEL_15;
  }
  id v10 = +[CSRemoteDarwinDeviceInfo sharedInstance];
  unsigned int v11 = [v10 hasDarwinDeviceHandleVoiceTrigger];

  if (!v11)
  {
LABEL_15:
    BOOL v12 = 0;
    goto LABEL_16;
  }
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    id v15 = "-[CSVoiceTriggerEventsCoordinator _shouldIgnoreVoiceTriggerEvent:]";
    id v8 = "%s Darwin device connected, ignore Voicetrigger notification from built-in device";
    goto LABEL_12;
  }
LABEL_13:
  BOOL v12 = 1;
LABEL_16:

  return v12;
}

- (BOOL)_isVoiceTriggerFromHearst:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = kVTEIfirstPassTriggerSource;
    unsigned int v6 = [v3 objectForKeyedSubscript:kVTEIfirstPassTriggerSource];
    if (v6)
    {
      id v7 = [v4 objectForKeyedSubscript:v5];
      if ([v7 isEqualToString:kVTEIFirstPassTriggeredFromHearst])
      {
        unsigned __int8 v8 = 1;
      }
      else
      {
        id v9 = [v4 objectForKeyedSubscript:v5];
        unsigned __int8 v8 = [v9 isEqualToString:kVTEIFirstPassTriggeredFromHearstAP];
      }
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)_isVoiceTriggerFromRemora:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = kVTEIfirstPassTriggerSource;
    unsigned int v6 = [v3 objectForKeyedSubscript:kVTEIfirstPassTriggerSource];
    if (v6)
    {
      id v7 = [v4 objectForKeyedSubscript:v5];
      unsigned __int8 v8 = [v7 isEqualToString:kVTEIFirstPassTriggeredFromRemora];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)_myriadPhashFromVoiceTriggerInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(CSMyriadPHash);
  uint64_t v5 = [(CSMyriadPHash *)v4 generatePHashFromVoiceTriggerInfo:v3 writeFile:0];

  return v5;
}

- (void)_notifyTriggerEvent:(id)a3 deviceId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v21 = "-[CSVoiceTriggerEventsCoordinator _notifyTriggerEvent:deviceId:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s EventNotifier received VoiceTrigger event", buf, 0xCu);
  }
  [(CSVoiceTriggerEventsCoordinator *)self _notifyWakeKeywordSpokenEvent:v8 deviceId:v9];
  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10011A868;
  v16[3] = &unk_100252D38;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v10;
  id v15 = v8;
  dispatch_async(queue, v16);
}

- (void)_notifyWakeKeywordSpokenEvent:(id)a3 deviceId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    id v20 = "-[CSVoiceTriggerEventsCoordinator _notifyWakeKeywordSpokenEvent:deviceId:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Notifying Wake Keyword Spoken Event", (uint8_t *)&v19, 0xCu);
  }
  notify_post("com.apple.voicetrigger.KeywordSpoken");
  if (v5)
  {
    uint64_t v8 = kVTEIfirstPassTriggerSource;
    id v9 = [v5 objectForKeyedSubscript:kVTEIfirstPassTriggerSource];

    if (v9)
    {
      id v10 = [v5 objectForKeyedSubscript:v8];
      if ([v10 isEqualToString:kVTEIFirstPassTriggeredFromHearst])
      {

LABEL_8:
        id v13 = +[CSSiriLauncher sharedLauncher];
        [v13 notifyWakeKeywordSpokenBluetoothDevice:v5 deviceId:v6];
LABEL_9:

        goto LABEL_10;
      }
      unsigned int v11 = [v5 objectForKeyedSubscript:v8];
      unsigned int v12 = [v11 isEqualToString:kVTEIFirstPassTriggeredFromHearstAP];

      if (v12) {
        goto LABEL_8;
      }
      id v14 = [v5 objectForKeyedSubscript:v8];
      unsigned int v15 = [v14 isEqualToString:kVTEIFirstPassTriggeredFromJarvis];

      if (v15)
      {
        id v13 = +[CSSiriLauncher sharedLauncher];
        [v13 notifyWakeKeywordSpokenCarPlay:v5 deviceId:v6];
        goto LABEL_9;
      }
      id v16 = [v5 objectForKeyedSubscript:v8];
      unsigned int v17 = [v16 isEqualToString:kVTEIFirstPassTriggeredFromRemora];

      if (v17)
      {
        id v13 = +[CSSiriLauncher sharedLauncher];
        [v13 notifyWakeKeywordSpokenRemora:v5 deviceId:v6];
        goto LABEL_9;
      }
      id v18 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315138;
        id v20 = "-[CSVoiceTriggerEventsCoordinator _notifyWakeKeywordSpokenEvent:deviceId:]";
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Skip notifying the keyword spoken event because the trigger is not from Hearst, Jarvis or Remora", (uint8_t *)&v19, 0xCu);
      }
    }
  }
LABEL_10:
}

- (void)_printVoiceTriggerMetricsString:(id)a3
{
  id v3 = a3;
  if (CSIsInternalBuild())
  {
    if (qword_1002A3A90 != -1) {
      dispatch_once(&qword_1002A3A90, &stru_100251EC8);
    }
    id v4 = [@"\nVoiceTrigger Metrics: {\n" mutableCopy];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = (id)qword_1002A3A88;
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          unsigned int v11 = [v3 objectForKey:v10];

          if (v11)
          {
            unsigned int v12 = [v3 objectForKey:v10];
            id v13 = +[NSString stringWithFormat:@"\t%@: %@\n", v10, v12, (void)v15];
            [v4 appendString:v13];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v7);
    }

    [v4 appendString:@"}"];
    id v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled(CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v20 = "-[CSVoiceTriggerEventsCoordinator _printVoiceTriggerMetricsString:]";
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
  }
}

- (id)_createVoiceTriggerEventInfoString:(id)a3
{
  id v3 = a3;
  if (qword_1002A3A80 != -1) {
    dispatch_once(&qword_1002A3A80, &stru_100251EA8);
  }
  id v4 = [@"\nvoiceTriggerEventInfo: {\n" mutableCopy];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)qword_1002A3A78;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        unsigned int v11 = [v3 objectForKey:v10];

        if (v11)
        {
          unsigned int v12 = [v3 objectForKey:v10];
          id v13 = +[NSString stringWithFormat:@"\t%@: %@\n", v10, v12, (void)v15];
          [v4 appendString:v13];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  [v4 appendString:@"}"];
  return v4;
}

- (void)raiseToSpeakDetected:(id)a3
{
}

- (void)keywordDetectorDidDetectKeyword
{
}

- (void)voiceTriggerGotSuperVector:(id)a3
{
}

- (void)voiceTriggerDidRejected:(id)a3 deviceId:(id)a4
{
}

- (void)voiceTriggerDidDetectSpeakerReject:(id)a3
{
}

- (void)voiceTriggerDidDetectNearMiss:(id)a3 deviceId:(id)a4
{
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 myriadHash:(id)a4 remoteTriggerType:(unint64_t)a5 remoteDeviceId:(id)a6 isTriggeredFromFullWake:(BOOL)a7 completion:(id)a8
{
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4 completion:(id)a5
{
}

- (void)voiceTriggerDidDetectKeyword:(id)a3 deviceId:(id)a4
{
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011B908;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10011B9B8;
  v7[3] = &unk_100253B08;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10011BA44;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setTargetQueue:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_targetQueue, a3);
  targetQueue = self->_targetQueue;
  if (targetQueue) {
    dispatch_set_target_queue((dispatch_object_t)self->_queue, targetQueue);
  }
}

- (CSVoiceTriggerEventsCoordinator)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSVoiceTriggerEventsCoordinator;
  v2 = [(CSVoiceTriggerEventsCoordinator *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    uint64_t v5 = +[CSUtils getSerialQueue:@"VoiceTriggerEventNotifier queue" qualityOfService:33];
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_splitterState = 0;
  }
  return v2;
}

+ (CSVoiceTriggerEventsCoordinator)sharedInstance
{
  if (qword_1002A3A70 != -1) {
    dispatch_once(&qword_1002A3A70, &stru_100251E88);
  }
  v2 = (void *)qword_1002A3A68;
  return (CSVoiceTriggerEventsCoordinator *)v2;
}

@end