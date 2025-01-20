@interface CSVoiceTriggerFirstPassJarvisAP
- (BOOL)_shouldProcessAudio;
- (BOOL)isAPJarvisFirstPassEnabled;
- (BOOL)isSecondPassRunning;
- (BOOL)isSiriClientListening;
- (CSAsset)currentAsset;
- (CSAudioProvider)audioProvider;
- (CSAudioStream)audioStream;
- (CSKeywordAnalyzerNDAPI)keywordAnalyzerNDAPI;
- (CSOSTransaction)secondPassTransaction;
- (CSPolicy)voiceTriggerJarvisAPEnabledPolicy;
- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerFirstPassJarvisAP)init;
- (CSVoiceTriggerFirstPassJarvisAP)initWithSpeechManager:(id)a3 siriClientBehaviorMonitor:(id)a4;
- (CSVoiceTriggerSecondChanceContext)secondChanceContext;
- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass;
- (NSMutableArray)audioStreamHoldings;
- (NSString)deviceId;
- (OS_dispatch_group)recordingWillStartGroup;
- (OS_dispatch_queue)queue;
- (float)keywordThreshold;
- (unint64_t)heartbeatFactor;
- (void)_addAudioStreamHold:(id)a3;
- (void)_cancelLastAudioStreamHold;
- (void)_createSecondPass;
- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5;
- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)_reset;
- (void)_setAsset:(id)a3;
- (void)_startListenWithCompletion:(id)a3;
- (void)_stopListening;
- (void)_teardownSecondPass;
- (void)_transitJarvisAPEnable:(BOOL)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)dealloc;
- (void)setAsset:(id)a3;
- (void)setAudioProvider:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamHoldings:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setHeartbeatFactor:(unint64_t)a3;
- (void)setIsAPJarvisFirstPassEnabled:(BOOL)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
- (void)setIsSiriClientListening:(BOOL)a3;
- (void)setKeywordAnalyzerNDAPI:(id)a3;
- (void)setKeywordThreshold:(float)a3;
- (void)setQueue:(id)a3;
- (void)setRecordingWillStartGroup:(id)a3;
- (void)setSecondChanceContext:(id)a3;
- (void)setSecondPassTransaction:(id)a3;
- (void)setSiriClientBehaviorMonitor:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setVoiceTriggerJarvisAPEnabledPolicy:(id)a3;
- (void)setVoiceTriggerSecondPass:(id)a3;
- (void)shouldProcessAudio:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)start;
@end

@implementation CSVoiceTriggerFirstPassJarvisAP

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondChanceContext, 0);
  objc_storeStrong((id *)&self->_voiceTriggerJarvisAPEnabledPolicy, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_audioStreamHoldings, 0);
  objc_storeStrong((id *)&self->_audioProvider, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_secondPassTransaction, 0);
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, 0);
  objc_storeStrong((id *)&self->_recordingWillStartGroup, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzerNDAPI, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setHeartbeatFactor:(unint64_t)a3
{
  self->_heartbeatFactor = a3;
}

- (unint64_t)heartbeatFactor
{
  return self->_heartbeatFactor;
}

- (void)setSecondChanceContext:(id)a3
{
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setVoiceTriggerJarvisAPEnabledPolicy:(id)a3
{
}

- (CSPolicy)voiceTriggerJarvisAPEnabledPolicy
{
  return self->_voiceTriggerJarvisAPEnabledPolicy;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setSiriClientBehaviorMonitor:(id)a3
{
}

- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor
{
  return self->_siriClientBehaviorMonitor;
}

- (void)setAudioStreamHoldings:(id)a3
{
}

- (NSMutableArray)audioStreamHoldings
{
  return self->_audioStreamHoldings;
}

- (void)setAudioProvider:(id)a3
{
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_isSecondPassRunning = a3;
}

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_isSiriClientListening = a3;
}

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setSecondPassTransaction:(id)a3
{
}

- (CSOSTransaction)secondPassTransaction
{
  return self->_secondPassTransaction;
}

- (void)setVoiceTriggerSecondPass:(id)a3
{
}

- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass
{
  return self->_voiceTriggerSecondPass;
}

- (void)setKeywordThreshold:(float)a3
{
  self->_keywordThreshold = a3;
}

- (float)keywordThreshold
{
  return self->_keywordThreshold;
}

- (void)setIsAPJarvisFirstPassEnabled:(BOOL)a3
{
  self->_isAPJarvisFirstPassEnabled = a3;
}

- (BOOL)isAPJarvisFirstPassEnabled
{
  return self->_isAPJarvisFirstPassEnabled;
}

- (void)setRecordingWillStartGroup:(id)a3
{
}

- (OS_dispatch_group)recordingWillStartGroup
{
  return self->_recordingWillStartGroup;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setKeywordAnalyzerNDAPI:(id)a3
{
}

- (CSKeywordAnalyzerNDAPI)keywordAnalyzerNDAPI
{
  return self->_keywordAnalyzerNDAPI;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setDelegate:(id)a3
{
}

- (CSVoiceTriggerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSVoiceTriggerDelegate *)WeakRetained;
}

- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BEBE4;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000BED10;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[CSVoiceTriggerFirstPassJarvisAP siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (v9)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000BEF28;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)_transitJarvisAPEnable:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000BF058;
  v4[3] = &unk_100253AB8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_teardownSecondPass
{
  voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
  self->_voiceTriggerSecondPass = 0;

  secondPassTransaction = self->_secondPassTransaction;
  self->_secondPassTransaction = 0;
}

- (void)_createSecondPass
{
  if (!self->_voiceTriggerSecondPass)
  {
    v3 = (CSOSTransaction *)[objc_alloc((Class)CSOSTransaction) initWithDescription:@"VoiceTrigger SecondPass"];
    secondPassTransaction = self->_secondPassTransaction;
    self->_secondPassTransaction = v3;

    BOOL v5 = [[CSVoiceTriggerSecondPass alloc] initWithPHSEnabled:0];
    voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
    self->_voiceTriggerSecondPass = v5;

    [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setFirstPassSource:4];
    [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setSecondPassClient:3];
    [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setAsset:self->_currentAsset];
    v7 = [(CSVoiceTriggerFirstPassJarvisAP *)self delegate];
    [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setDelegate:v7];

    v8 = self->_voiceTriggerSecondPass;
    [(CSVoiceTriggerSecondPass *)v8 start];
  }
}

- (void)_cancelLastAudioStreamHold
{
  if ([(NSMutableArray *)self->_audioStreamHoldings count])
  {
    id v4 = [(NSMutableArray *)self->_audioStreamHoldings lastObject];
    v3 = [(CSVoiceTriggerFirstPassJarvisAP *)self audioProvider];
    [v3 cancelAudioStreamHold:v4];

    [(NSMutableArray *)self->_audioStreamHoldings removeLastObject];
  }
}

- (void)_addAudioStreamHold:(id)a3
{
  id v4 = a3;
  id v6 = [objc_alloc((Class)CSAudioStreamHoldRequestOption) initWithTimeout:2 clientIdentity:0 requireRecordModeLock:0 requireListeningMicIndicatorLock:5.0];
  BOOL v5 = [(CSAudioProvider *)self->_audioProvider holdAudioStreamWithDescription:v4 option:v6];

  [(NSMutableArray *)self->_audioStreamHoldings addObject:v5];
}

- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 result];
  id v12 = [v8 voiceTriggerEventInfo];
  id v13 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = v13;
    id v15 = [v10 localizedDescription];
    int v27 = 136315906;
    v28 = "-[CSVoiceTriggerFirstPassJarvisAP _handleSecondPassResult:deviceId:error:]";
    __int16 v29 = 1024;
    *(_DWORD *)v30 = v11;
    *(_WORD *)&v30[4] = 2114;
    *(void *)&v30[6] = v12;
    __int16 v31 = 2114;
    v32 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Second Pass Result, %d, %{public}@, %{public}@", (uint8_t *)&v27, 0x26u);
  }
  self->_isSecondPassRunning = 0;
  if (v11 == (id)3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) == 0) {
      goto LABEL_14;
    }
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 voiceTriggerDidDetectNearMiss:v12 deviceId:v9];
    goto LABEL_12;
  }
  if (v11 == (id)2)
  {
    id v21 = objc_loadWeakRetained((id *)&self->_delegate);
    char v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) == 0) {
      goto LABEL_14;
    }
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 voiceTriggerDidRejected:v12 deviceId:v9];
    goto LABEL_12;
  }
  if (v11 == (id)1)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) == 0) {
      goto LABEL_14;
    }
    v18 = objc_loadWeakRetained((id *)&self->_delegate);
    [v18 voiceTriggerDidDetectKeyword:v12 deviceId:v9];
    goto LABEL_12;
  }
  v23 = (void *)CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    v18 = v23;
    v26 = [v10 localizedDescription];
    int v27 = 136315394;
    v28 = "-[CSVoiceTriggerFirstPassJarvisAP _handleSecondPassResult:deviceId:error:]";
    __int16 v29 = 2114;
    *(void *)v30 = v26;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s VoiceTrigger Second Pass has failed : %{public}@", (uint8_t *)&v27, 0x16u);

LABEL_12:
  }
LABEL_14:
  if ([v8 isSecondChanceCandidate])
  {
    v24 = [[CSVoiceTriggerSecondChanceContext alloc] initWithWindowStartTime:mach_absolute_time()];
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = v24;
  }
  else
  {
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = 0;
  }

  if (v11 != (id)1) {
    [(CSVoiceTriggerFirstPassJarvisAP *)self _cancelLastAudioStreamHold];
  }
  [(CSVoiceTriggerFirstPassJarvisAP *)self _reset];
}

- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v8)
  {
    [v8 bestScore];
    float v11 = v10;
    uint64_t v12 = qword_1002A38E8;
    if (!(qword_1002A38E8 % self->_heartbeatFactor))
    {
      id v13 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v34 = "-[CSVoiceTriggerFirstPassJarvisAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v35 = 2050;
        double v36 = v11;
        __int16 v37 = 2050;
        uint64_t v38 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Jarvis AP first pass best score = %{public}.3f for heartbeat = %{public}lld", buf, 0x20u);
        uint64_t v12 = qword_1002A38E8;
      }
    }
    qword_1002A38E8 = v12 + 1;
    if (v11 >= self->_keywordThreshold)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.jarvis", 0, 0, 1u);
      id v15 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v34 = "-[CSVoiceTriggerFirstPassJarvisAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Send Jarvis Myriad notification", buf, 0xCu);
      }
      v31[0] = kVTEIfirstPassScore;
      *(float *)&double v16 = v11;
      char v17 = +[NSNumber numberWithFloat:v16];
      v32[0] = v17;
      v31[1] = kVTEIfirstPassStartSampleCount;
      v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 bestStart]);
      v32[1] = v18;
      v31[2] = kVTEIfirstPassEndSampleCount;
      v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 bestEnd]);
      v32[2] = v19;
      v31[3] = kVTEIfirstPassFireSampleCount;
      char v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 samplesAtFire]);
      v32[3] = v20;
      id v21 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];

      char v22 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v34 = "-[CSVoiceTriggerFirstPassJarvisAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v35 = 2112;
        double v36 = *(double *)&v9;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v21;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s Detected : %@, %@", buf, 0x20u);
      }
      [v7 reset];
      [(CSVoiceTriggerFirstPassJarvisAP *)self _createSecondPass];
      self->_isSecondPassRunning = 1;
      [(CSVoiceTriggerFirstPassJarvisAP *)self _addAudioStreamHold:@"Jarvis AP first pass triggered"];
      objc_initWeak((id *)buf, self);
      v23 = [CSVoiceTriggerSecondPassRequestOption alloc];
      deviceId = self->_deviceId;
      v25 = [(CSAudioProvider *)self->_audioProvider UUID];
      v26 = +[NSUUID UUID];
      int v27 = [(CSVoiceTriggerSecondPassRequestOption *)v23 initWithFirstPassSource:4 deviceId:deviceId audioProviderUUID:v25 firstPassInfo:v21 rejectionMHUUID:v26 isSecondChanceRun:[(CSVoiceTriggerSecondChanceContext *)self->_secondChanceContext shouldRunAsSecondChance] firstpassMetrics:0 rtModelRequestOptions:0];

      voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1000BFA68;
      v29[3] = &unk_100250A30;
      objc_copyWeak(&v30, (id *)buf);
      [(CSVoiceTriggerSecondPass *)voiceTriggerSecondPass handleVoiceTriggerSecondPassFrom:v27 completion:v29];
      objc_destroyWeak(&v30);

      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)shouldProcessAudio:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000BFC9C;
  v7[3] = &unk_1002535D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)_shouldProcessAudio
{
  return !self->_isSiriClientListening && !self->_isSecondPassRunning && self->_isAPJarvisFirstPassEnabled;
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000BFDB4;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0024;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_stopListening
{
  keywordAnalyzerNDAPI = self->_keywordAnalyzerNDAPI;
  self->_keywordAnalyzerNDAPI = 0;

  id v5 = [(CSVoiceTriggerFirstPassJarvisAP *)self audioStream];

  if (v5)
  {
    id v6 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      float v11 = "-[CSVoiceTriggerFirstPassJarvisAP _stopListening]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Waiting for recordWillStartGroup before scheduling stpoAudioStream", buf, 0xCu);
    }
    recordingWillStartGroup = self->_recordingWillStartGroup;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000C01B0;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_group_notify(recordingWillStartGroup, queue, block);
  }
}

- (void)_startListenWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v45 = "-[CSVoiceTriggerFirstPassJarvisAP _startListenWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_1000C08A4;
  v42[3] = &unk_100253100;
  id v6 = v4;
  id v43 = v6;
  id v7 = objc_retainBlock(v42);
  id v8 = +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:self->_currentAsset forFirstPassSource:4];
  uint64_t v9 = [v8 configPathNDAPI];
  float v10 = [(CSAsset *)self->_currentAsset resourcePath];
  __int16 v37 = (void *)v9;
  float v11 = (CSKeywordAnalyzerNDAPI *)[objc_alloc((Class)CSKeywordAnalyzerNDAPI) initWithConfigPath:v9 resourcePath:v10];
  keywordAnalyzerNDAPI = self->_keywordAnalyzerNDAPI;
  self->_keywordAnalyzerNDAPI = v11;

  [(CSKeywordAnalyzerNDAPI *)self->_keywordAnalyzerNDAPI getThreshold];
  self->_keywordThreshold = v13;
  [(CSKeywordAnalyzerNDAPI *)self->_keywordAnalyzerNDAPI setActiveChannel:0];
  deviceId = self->_deviceId;
  self->_deviceId = 0;

  id v15 = +[CSSiriClientBehaviorMonitor sharedInstance];
  double v16 = [v15 recordRoute];
  LODWORD(v9) = +[CSUtils isJarvisAudioRouteWithRecordRoute:v16];

  if (v9)
  {
    char v17 = +[CSSiriClientBehaviorMonitor sharedInstance];
    v18 = [v17 deviceId];
    v19 = self->_deviceId;
    self->_deviceId = v18;
  }
  if (self->_deviceId)
  {
    double v36 = v8;
    char v20 = +[CSAudioRecordContext contextForJarvisWithDeviceId:](CSAudioRecordContext, "contextForJarvisWithDeviceId:");
    speechManager = self->_speechManager;
    id v41 = 0;
    char v22 = [(CSSpeechManager *)speechManager audioProviderWithContext:v20 error:&v41];
    id v23 = v41;
    [(CSVoiceTriggerFirstPassJarvisAP *)self setAudioProvider:v22];
    if (v22)
    {
      id v34 = v23;
      id v35 = v6;
      v24 = +[CSAudioStreamRequest defaultRequestWithContext:v20];
      [v24 setClientIdentity:2];
      v25 = (objc_class *)objc_opt_class();
      v26 = NSStringFromClass(v25);
      id v40 = 0;
      int v27 = [v22 audioStreamWithRequest:v24 streamName:v26 error:&v40];
      id v28 = v40;

      if (v27)
      {
        [(CSVoiceTriggerFirstPassJarvisAP *)self setAudioStream:v27];
        [v27 setDelegate:self];
        __int16 v29 = [(CSVoiceTriggerFirstPassJarvisAP *)self audioStream];

        if (v29)
        {
          id v30 = CSLogCategoryVT;
          if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v45 = "-[CSVoiceTriggerFirstPassJarvisAP _startListenWithCompletion:]";
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s Entering recordWillStartGroup", buf, 0xCu);
          }
          dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
          __int16 v31 = +[CSAudioStartStreamOption noAlertOption];
          v32 = [(CSVoiceTriggerFirstPassJarvisAP *)self audioStream];
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_1000C08BC;
          v38[3] = &unk_100253150;
          v38[4] = self;
          v39 = v7;
          [v32 startAudioStreamWithOption:v31 completion:v38];
        }
      }
      else
      {
        ((void (*)(void *, void, id))v7[2])(v7, 0, v28);
      }

      id v23 = v34;
      id v6 = v35;
    }
    else
    {
      id v28 = +[NSError errorWithDomain:CSErrorDomain code:1451 userInfo:0];
      ((void (*)(void *, void, id))v7[2])(v7, 0, v28);
    }

    id v8 = v36;
  }
  else
  {
    v33 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[CSVoiceTriggerFirstPassJarvisAP _startListenWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s JarvisAP deviceId is nil, skip starting", buf, 0xCu);
    }
    char v20 = +[NSError errorWithDomain:CSErrorDomain code:509 userInfo:0];
    ((void (*)(void *, void, void *))v7[2])(v7, 0, v20);
  }
}

- (void)_reset
{
}

- (void)_setAsset:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    [v5 logAssetVersionForInsight];
    objc_storeStrong((id *)&self->_currentAsset, a3);
  }
  else
  {
    id v7 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      uint64_t v9 = "-[CSVoiceTriggerFirstPassJarvisAP _setAsset:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s asset is nil, stop initialization", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000C0C5C;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)dealloc
{
  v3 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[CSVoiceTriggerFirstPassJarvisAP dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerFirstPassJarvisAP is deallocating", buf, 0xCu);
  }
  [(CSPolicy *)self->_voiceTriggerJarvisAPEnabledPolicy setCallback:0];
  v4.receiver = self;
  v4.super_class = (Class)CSVoiceTriggerFirstPassJarvisAP;
  [(CSVoiceTriggerFirstPassJarvisAP *)&v4 dealloc];
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000C0DB0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSVoiceTriggerFirstPassJarvisAP)init
{
  return [(CSVoiceTriggerFirstPassJarvisAP *)self initWithSpeechManager:0 siriClientBehaviorMonitor:0];
}

- (CSVoiceTriggerFirstPassJarvisAP)initWithSpeechManager:(id)a3 siriClientBehaviorMonitor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CSVoiceTriggerFirstPassJarvisAP;
  id v8 = [(CSVoiceTriggerFirstPassJarvisAP *)&v23 init];
  if (v8)
  {
    dispatch_queue_t v9 = dispatch_queue_create("CSVoiceTriggerFirstPassJarvisAP", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    dispatch_group_t v11 = dispatch_group_create();
    recordingWillStartGroup = v8->_recordingWillStartGroup;
    v8->_recordingWillStartGroup = (OS_dispatch_group *)v11;

    uint64_t v13 = +[NSMutableArray array];
    audioStreamHoldings = v8->_audioStreamHoldings;
    v8->_audioStreamHoldings = (NSMutableArray *)v13;

    +[CSConfig inputRecordingBufferDuration];
    v8->_heartbeatFactor = (unint64_t)(2.0 / v15);
    if (v6)
    {
      double v16 = (CSSpeechManager *)v6;
    }
    else
    {
      double v16 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
    }
    speechManager = v8->_speechManager;
    v8->_speechManager = v16;

    if (v7)
    {
      v18 = (CSSiriClientBehaviorMonitor *)v7;
    }
    else
    {
      v18 = +[CSSiriClientBehaviorMonitor sharedInstance];
    }
    siriClientBehaviorMonitor = v8->_siriClientBehaviorMonitor;
    v8->_siriClientBehaviorMonitor = v18;

    uint64_t v20 = +[CSVoiceTriggerJarvisAPEnabledPolicy sharedInstance];
    voiceTriggerJarvisAPEnabledPolicy = v8->_voiceTriggerJarvisAPEnabledPolicy;
    v8->_voiceTriggerJarvisAPEnabledPolicy = (CSPolicy *)v20;
  }
  return v8;
}

@end