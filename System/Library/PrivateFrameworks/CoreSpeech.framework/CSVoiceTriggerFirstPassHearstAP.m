@interface CSVoiceTriggerFirstPassHearstAP
- (BOOL)_shouldProcessAudio;
- (BOOL)isAPHearstFirstPassEnabled;
- (BOOL)isSecondPassRunning;
- (BOOL)isSiriClientListening;
- (CSAsset)currentAsset;
- (CSAudioProvider)audioProvider;
- (CSAudioStream)audioStream;
- (CSKeywordAnalyzerNDAPI)keywordAnalyzerNDAPI;
- (CSOSTransaction)secondPassTransaction;
- (CSOpportuneSpeakEventMonitor)opportuneSpeakEventMonitor;
- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor;
- (CSPolicy)voiceTriggerHearstAPEnabledPolicy;
- (CSRemoteVADSignalExtractor)remoteVADSignalExtractor;
- (CSSiriClientBehaviorMonitor)siriClientBehaviorMonitor;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerFirstPassHearstAP)init;
- (CSVoiceTriggerFirstPassHearstAP)initWithSpeechManager:(id)a3 voiceTriggerEnabledMonitor:(id)a4 siriClientBehaviorMonitor:(id)a5 opportuneSpeakEventMonitor:(id)a6 phoneCallStateMonitor:(id)a7 otherAppRecordingStateMonitor:(id)a8 voiceTriggerHearstAPEnabledPolicy:(id)a9;
- (CSVoiceTriggerSecondChanceContext)secondChanceContext;
- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass;
- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus;
- (NSMutableArray)audioStreamHoldings;
- (NSString)deviceId;
- (NSString)opportuneSpeakAudioProviderUUID;
- (OS_dispatch_group)recordingWillStartGroup;
- (OS_dispatch_queue)queue;
- (float)keywordThreshold;
- (id)_fetchDeviceId;
- (unint64_t)heartbeatFactor;
- (void)_addAudioStreamHold:(id)a3;
- (void)_cancelLastAudioStreamHold;
- (void)_createSecondPass;
- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5;
- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)_reset;
- (void)_setAsset:(id)a3;
- (void)_startListenWithAudioProviderUUID:(id)a3 completion:(id)a4;
- (void)_stopListening;
- (void)_teardownSecondPass;
- (void)_transitHearstAPEnable:(BOOL)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)dealloc;
- (void)opportuneSpeakEventMonitor:(id)a3 didStreamStateChanged:(BOOL)a4;
- (void)setAsset:(id)a3;
- (void)setAudioProvider:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamHoldings:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setHeartbeatFactor:(unint64_t)a3;
- (void)setIsAPHearstFirstPassEnabled:(BOOL)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
- (void)setIsSiriClientListening:(BOOL)a3;
- (void)setKeywordAnalyzerNDAPI:(id)a3;
- (void)setKeywordThreshold:(float)a3;
- (void)setMultiPhraseSelectedStatus:(id)a3;
- (void)setOpportuneSpeakAudioProviderUUID:(id)a3;
- (void)setOpportuneSpeakEventMonitor:(id)a3;
- (void)setOtherAppRecordingStateMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRecordingWillStartGroup:(id)a3;
- (void)setRemoteVADSignalExtractor:(id)a3;
- (void)setSecondChanceContext:(id)a3;
- (void)setSecondPassTransaction:(id)a3;
- (void)setSiriClientBehaviorMonitor:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setVoiceTriggerHearstAPEnabledPolicy:(id)a3;
- (void)setVoiceTriggerSecondPass:(id)a3;
- (void)shouldProcessAudio:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)start;
@end

@implementation CSVoiceTriggerFirstPassHearstAP

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiPhraseSelectedStatus, 0);
  objc_storeStrong((id *)&self->_remoteVADSignalExtractor, 0);
  objc_storeStrong((id *)&self->_secondChanceContext, 0);
  objc_storeStrong((id *)&self->_voiceTriggerHearstAPEnabledPolicy, 0);
  objc_storeStrong((id *)&self->_otherAppRecordingStateMonitor, 0);
  objc_storeStrong((id *)&self->_opportuneSpeakEventMonitor, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_siriClientBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_audioStreamHoldings, 0);
  objc_storeStrong((id *)&self->_opportuneSpeakAudioProviderUUID, 0);
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

- (void)setMultiPhraseSelectedStatus:(id)a3
{
}

- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus
{
  return self->_multiPhraseSelectedStatus;
}

- (void)setRemoteVADSignalExtractor:(id)a3
{
}

- (CSRemoteVADSignalExtractor)remoteVADSignalExtractor
{
  return self->_remoteVADSignalExtractor;
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

- (void)setVoiceTriggerHearstAPEnabledPolicy:(id)a3
{
}

- (CSPolicy)voiceTriggerHearstAPEnabledPolicy
{
  return self->_voiceTriggerHearstAPEnabledPolicy;
}

- (void)setOtherAppRecordingStateMonitor:(id)a3
{
}

- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor
{
  return self->_otherAppRecordingStateMonitor;
}

- (void)setOpportuneSpeakEventMonitor:(id)a3
{
}

- (CSOpportuneSpeakEventMonitor)opportuneSpeakEventMonitor
{
  return self->_opportuneSpeakEventMonitor;
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

- (void)setOpportuneSpeakAudioProviderUUID:(id)a3
{
}

- (NSString)opportuneSpeakAudioProviderUUID
{
  return self->_opportuneSpeakAudioProviderUUID;
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

- (void)setIsAPHearstFirstPassEnabled:(BOOL)a3
{
  self->_isAPHearstFirstPassEnabled = a3;
}

- (BOOL)isAPHearstFirstPassEnabled
{
  return self->_isAPHearstFirstPassEnabled;
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
  block[2] = sub_100064EB0;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064FDC;
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
    v20 = "-[CSVoiceTriggerFirstPassHearstAP siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (v9)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000651F4;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

- (void)opportuneSpeakEventMonitor:(id)a3 didStreamStateChanged:(BOOL)a4
{
  v5 = [(CSOpportuneSpeakEventMonitor *)self->_opportuneSpeakEventMonitor audioProviderUUID];
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10006534C;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)_transitHearstAPEnable:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000653D0;
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

    [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setFirstPassSource:6];
    [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setSecondPassClient:2];
    [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setAsset:self->_currentAsset];
    id v7 = [(CSVoiceTriggerFirstPassHearstAP *)self delegate];
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
    v3 = [(CSVoiceTriggerFirstPassHearstAP *)self audioProvider];
    [v3 cancelAudioStreamHold:v4];

    [(NSMutableArray *)self->_audioStreamHoldings removeLastObject];
  }
}

- (void)_addAudioStreamHold:(id)a3
{
  id v5 = [objc_alloc((Class)CSAudioStreamHoldRequestOption) initWithTimeout:2 clientIdentity:0 requireRecordModeLock:0 requireListeningMicIndicatorLock:5.0];
  id v4 = [(CSAudioProvider *)self->_audioProvider holdAudioStreamWithDescription:@"CSHearstSecondPassRequest" option:v5];
  [(NSMutableArray *)self->_audioStreamHoldings addObject:v4];
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
    int v29 = 136315906;
    v30 = "-[CSVoiceTriggerFirstPassHearstAP _handleSecondPassResult:deviceId:error:]";
    __int16 v31 = 1024;
    *(_DWORD *)v32 = v11;
    *(_WORD *)&v32[4] = 2114;
    *(void *)&v32[6] = v12;
    __int16 v33 = 2114;
    v34 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Second Pass Result, %d, %{public}@, %{public}@", (uint8_t *)&v29, 0x26u);
  }
  self->_isSecondPassRunning = 0;
  switch((unint64_t)v11)
  {
    case 1uLL:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        v18 = objc_loadWeakRetained((id *)&self->_delegate);
        [v18 voiceTriggerDidDetectKeyword:v12 deviceId:v9];
        goto LABEL_14;
      }
      break;
    case 2uLL:
      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        v18 = objc_loadWeakRetained((id *)&self->_delegate);
        [v18 voiceTriggerDidRejected:v12 deviceId:v9];
        goto LABEL_14;
      }
      break;
    case 3uLL:
      id v21 = objc_loadWeakRetained((id *)&self->_delegate);
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        v18 = objc_loadWeakRetained((id *)&self->_delegate);
        [v18 voiceTriggerDidDetectNearMiss:v12 deviceId:v9];
        goto LABEL_14;
      }
      break;
    case 9uLL:
      id v25 = objc_loadWeakRetained((id *)&self->_delegate);
      char v26 = objc_opt_respondsToSelector();

      if (v26)
      {
        v18 = objc_loadWeakRetained((id *)&self->_delegate);
        [v18 voiceTriggerDidDetectSpeakerReject:v12];
        goto LABEL_14;
      }
      break;
    default:
      v23 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        v18 = v23;
        v24 = [v10 localizedDescription];
        int v29 = 136315394;
        v30 = "-[CSVoiceTriggerFirstPassHearstAP _handleSecondPassResult:deviceId:error:]";
        __int16 v31 = 2114;
        *(void *)v32 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s VoiceTrigger Second Pass has failed : %{public}@", (uint8_t *)&v29, 0x16u);

LABEL_14:
      }
      break;
  }
  if ([v8 isSecondChanceCandidate])
  {
    v27 = [[CSVoiceTriggerSecondChanceContext alloc] initWithWindowStartTime:mach_absolute_time()];
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = v27;
  }
  else
  {
    secondChanceContext = self->_secondChanceContext;
    self->_secondChanceContext = 0;
  }

  if (v11 != (id)1) {
    [(CSVoiceTriggerFirstPassHearstAP *)self _cancelLastAudioStreamHold];
  }
  [(CSVoiceTriggerFirstPassHearstAP *)self _reset];
}

- (void)_keywordAnalyzerNDAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (*(double *)&v8 != 0.0)
  {
    [v8 bestScore];
    float v11 = *(float *)&v10;
    uint64_t v12 = qword_1002A3798;
    if (!(qword_1002A3798 % self->_heartbeatFactor))
    {
      id v13 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v37 = "-[CSVoiceTriggerFirstPassHearstAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v38 = 2050;
        double v39 = v11;
        __int16 v40 = 2050;
        uint64_t v41 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Hearst AP first pass best score = %{public}.3f for heartbeat = %{public}lld", buf, 0x20u);
        uint64_t v12 = qword_1002A3798;
      }
    }
    qword_1002A3798 = v12 + 1;
    if (v11 >= self->_keywordThreshold)
    {
      v34[0] = kVTEIfirstPassScore;
      *(float *)&double v10 = v11;
      id v14 = +[NSNumber numberWithFloat:v10];
      v35[0] = v14;
      v34[1] = kVTEIfirstPassStartSampleCount;
      id v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 bestStart]);
      v35[1] = v15;
      v34[2] = kVTEIfirstPassEndSampleCount;
      v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 bestEnd]);
      v35[2] = v16;
      v34[3] = kVTEIfirstPassFireSampleCount;
      char v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 samplesAtFire]);
      v35[3] = v17;
      v18 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];

      id v19 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v37 = "-[CSVoiceTriggerFirstPassHearstAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
        __int16 v38 = 2112;
        double v39 = *(double *)&v9;
        __int16 v40 = 2112;
        uint64_t v41 = (uint64_t)v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s Detected : %@, %@", buf, 0x20u);
      }
      remoteVADSignalExtractor = self->_remoteVADSignalExtractor;
      if (remoteVADSignalExtractor
        && !-[CSRemoteVADSignalExtractor hasSpeechDetectedFromStartSampleCount:toEndSampleCount:](remoteVADSignalExtractor, "hasSpeechDetectedFromStartSampleCount:toEndSampleCount:", [v9 bestStart], objc_msgSend(v9, "bestEnd")))
      {
        id v21 = CSLogCategoryVT;
        if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v37 = "-[CSVoiceTriggerFirstPassHearstAP _keywordAnalyzerNDAPI:hasResultAvailable:forChannel:]";
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Do not send in-ear myriad trigger since remoteVAD didn't detect speech", buf, 0xCu);
        }
      }
      else
      {
        +[CSMyriadNotifier notifyInEarMyriadTrigger];
      }
      [v7 reset];
      [(CSVoiceTriggerFirstPassHearstAP *)self _createSecondPass];
      self->_isSecondPassRunning = 1;
      [(CSVoiceTriggerFirstPassHearstAP *)self _addAudioStreamHold:@"Hearst AP first pass triggered"];
      objc_initWeak((id *)buf, self);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100065F1C;
      v33[3] = &unk_10024FA60;
      v33[4] = self;
      char v22 = [[CSVoiceTriggerRTModelRequestOptions alloc] initWithMutableBuilder:v33];
      v23 = [CSVoiceTriggerSecondPassRequestOption alloc];
      deviceId = self->_deviceId;
      id v25 = [(CSAudioProvider *)self->_audioProvider UUID];
      char v26 = +[NSUUID UUID];
      v27 = [(CSVoiceTriggerSecondPassRequestOption *)v23 initWithFirstPassSource:6 deviceId:deviceId audioProviderUUID:v25 firstPassInfo:v18 rejectionMHUUID:v26 isSecondChanceRun:[(CSVoiceTriggerSecondChanceContext *)self->_secondChanceContext shouldRunAsSecondChance] firstpassMetrics:0 rtModelRequestOptions:v22];

      if ([(CSVoiceTriggerRTModelRequestOptions *)v22 allowMph])
      {
        v28 = [(CSVoiceTriggerRTModelRequestOptions *)v22 accessoryInfo];
        id v29 = [v28 supportsJustSiri];
      }
      else
      {
        id v29 = 0;
      }
      [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setSupportsMultiPhraseDetection:v29];
      voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_1000660A4;
      v31[3] = &unk_100250A30;
      objc_copyWeak(&v32, (id *)buf);
      [(CSVoiceTriggerSecondPass *)voiceTriggerSecondPass handleVoiceTriggerSecondPassFrom:v27 completion:v31];
      objc_destroyWeak(&v32);

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
  v7[2] = sub_1000662D8;
  v7[3] = &unk_1002535D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)_shouldProcessAudio
{
  return !self->_isSiriClientListening && !self->_isSecondPassRunning && self->_isAPHearstFirstPassEnabled;
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000663F0;
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
  block[2] = sub_100066698;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_stopListening
{
  keywordAnalyzerNDAPI = self->_keywordAnalyzerNDAPI;
  self->_keywordAnalyzerNDAPI = 0;

  remoteVADSignalExtractor = self->_remoteVADSignalExtractor;
  self->_remoteVADSignalExtractor = 0;

  id v6 = [(CSVoiceTriggerFirstPassHearstAP *)self audioStream];

  if (v6)
  {
    id v7 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v12 = "-[CSVoiceTriggerFirstPassHearstAP _stopListening]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Waiting for recordWillStartGroup before scheduling stopAudioStream", buf, 0xCu);
    }
    recordingWillStartGroup = self->_recordingWillStartGroup;
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100066830;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_group_notify(recordingWillStartGroup, queue, block);
  }
}

- (id)_fetchDeviceId
{
  v3 = +[CSAudioStreamActivityMonitor sharedInstance];
  unsigned int v4 = [v3 hasNonVoiceTriggerStreamsOrStreamHoldersActive];

  if (v4)
  {
    id v5 = +[CSSiriClientBehaviorMonitor sharedInstance];
    id v6 = [v5 recordRoute];
    unsigned int v7 = +[CSUtils isDoAPAudioRouteWithRecordRoute:v6];

    if (v7)
    {
      id v8 = +[CSSiriClientBehaviorMonitor sharedInstance];
      id v9 = [v8 deviceId];
LABEL_6:

      goto LABEL_10;
    }
  }
  else
  {
    if ([(CSOpportuneSpeakEventMonitor *)self->_opportuneSpeakEventMonitor isStreaming])
    {
      id v8 = [(CSOpportuneSpeakEventMonitor *)self->_opportuneSpeakEventMonitor audioRecordContext];
      double v10 = [v8 deviceId];
      id v9 = [v10 copy];

      goto LABEL_6;
    }
    float v11 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_FAULT))
    {
      int v13 = 136315138;
      id v14 = "-[CSVoiceTriggerFirstPassHearstAP _fetchDeviceId]";
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "%s FirstPassHearstAP doesn't meet listening condition, set deviceId to nil", (uint8_t *)&v13, 0xCu);
    }
  }
  id v9 = 0;
LABEL_10:
  return v9;
}

- (void)_startListenWithAudioProviderUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "-[CSVoiceTriggerFirstPassHearstAP _startListenWithAudioProviderUUID:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000670CC;
  v49[3] = &unk_100253150;
  v49[4] = self;
  id v9 = v7;
  id v50 = v9;
  double v10 = objc_retainBlock(v49);
  float v11 = +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:self->_currentAsset forFirstPassSource:6];
  uint64_t v12 = [v11 configPathNDAPI];
  v44 = [(CSAsset *)self->_currentAsset resourcePath];
  int v13 = (CSKeywordAnalyzerNDAPI *)[objc_alloc((Class)CSKeywordAnalyzerNDAPI) initWithConfigPath:v12 resourcePath:v44];
  keywordAnalyzerNDAPI = self->_keywordAnalyzerNDAPI;
  self->_keywordAnalyzerNDAPI = v13;

  [(CSKeywordAnalyzerNDAPI *)self->_keywordAnalyzerNDAPI getThreshold];
  self->_keywordThreshold = v15;
  [(CSKeywordAnalyzerNDAPI *)self->_keywordAnalyzerNDAPI setActiveChannel:0];
  v16 = [v11 wearerDetectionConfig];
  [v16 threshold];
  float v18 = v17;

  if (v18 <= 0.0)
  {
    remoteVADSignalExtractor = self->_remoteVADSignalExtractor;
    self->_remoteVADSignalExtractor = 0;
  }
  else
  {
    id v19 = (CSRemoteVADSignalExtractor *)[objc_alloc((Class)CSRemoteVADSignalExtractor) initWithToken:@"CSVoiceTriggerFirstPassHearstAP"];
    remoteVADSignalExtractor = self->_remoteVADSignalExtractor;
    self->_remoteVADSignalExtractor = v19;
  }

  speechManager = self->_speechManager;
  if (speechManager)
  {
    char v22 = speechManager;
  }
  else
  {
    char v22 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
  }
  v23 = v22;
  v24 = [(CSVoiceTriggerFirstPassHearstAP *)self _fetchDeviceId];
  deviceId = self->_deviceId;
  self->_deviceId = v24;

  if (!self->_deviceId)
  {
    uint64_t v28 = CSErrorDomain;
    uint64_t v29 = 1452;
    goto LABEL_13;
  }
  uint64_t v26 = [(CSSpeechManager *)v23 audioProviderWithUUID:v6];
  if (!v26)
  {
    v30 = +[CSAudioRecordContext contextForHearstVoiceTriggerWithDeviceId:self->_deviceId];
    uint64_t v48 = 0;
    v27 = [(CSSpeechManager *)v23 audioProviderWithContext:v30 error:&v48];

    [(CSVoiceTriggerFirstPassHearstAP *)self setAudioProvider:v27];
    if (v27) {
      goto LABEL_15;
    }
    uint64_t v28 = CSErrorDomain;
    uint64_t v29 = 1451;
LABEL_13:
    v27 = +[NSError errorWithDomain:v28 code:v29 userInfo:0];
    ((void (*)(void *, void, void *))v10[2])(v10, 0, v27);
    goto LABEL_22;
  }
  v27 = (void *)v26;
  [(CSVoiceTriggerFirstPassHearstAP *)self setAudioProvider:v26];
LABEL_15:
  __int16 v31 = [(CSOpportuneSpeakEventMonitor *)self->_opportuneSpeakEventMonitor audioRecordContext];
  id v32 = +[CSAudioStreamRequest defaultRequestWithContext:v31];

  [v32 setClientIdentity:2];
  __int16 v33 = (objc_class *)objc_opt_class();
  v34 = NSStringFromClass(v33);
  id v47 = 0;
  v35 = [v27 audioStreamWithRequest:v32 streamName:v34 error:&v47];
  id v36 = v47;

  if (v35)
  {
    [v35 setIsWeakStream:1];
    [(CSVoiceTriggerFirstPassHearstAP *)self setAudioStream:v35];
    [v35 setDelegate:self];
    v37 = [(CSVoiceTriggerFirstPassHearstAP *)self audioStream];

    if (v37)
    {
      __int16 v38 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v52 = "-[CSVoiceTriggerFirstPassHearstAP _startListenWithAudioProviderUUID:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%s Entering recordWillStartGroup", buf, 0xCu);
      }
      dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
      double v39 = +[CSAudioStartStreamOption noAlertOption];
      [v39 setDisableBoostForDoAP:1];
      [v39 setStartRecordingHostTime:mach_absolute_time()];
      __int16 v40 = [(CSVoiceTriggerFirstPassHearstAP *)self audioStream];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100067164;
      v45[3] = &unk_100253150;
      v45[4] = self;
      v46 = v10;
      [v40 startAudioStreamWithOption:v39 completion:v45];
    }
  }
  else
  {
    ((void (*)(void *, void, id))v10[2])(v10, 0, v36);
  }

  id v9 = v42;
  id v6 = v43;
  uint64_t v12 = v41;
LABEL_22:
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
      id v9 = "-[CSVoiceTriggerFirstPassHearstAP _setAsset:]";
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
  v7[2] = sub_100067504;
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
    id v6 = "-[CSVoiceTriggerFirstPassHearstAP dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s CSVoiceTriggerFirstPassHearstAP is deallocating", buf, 0xCu);
  }
  [(CSPolicy *)self->_voiceTriggerHearstAPEnabledPolicy setCallback:0];
  v4.receiver = self;
  v4.super_class = (Class)CSVoiceTriggerFirstPassHearstAP;
  [(CSVoiceTriggerFirstPassHearstAP *)&v4 dealloc];
}

- (void)start
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067658;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSVoiceTriggerFirstPassHearstAP)init
{
  return [(CSVoiceTriggerFirstPassHearstAP *)self initWithSpeechManager:0 voiceTriggerEnabledMonitor:0 siriClientBehaviorMonitor:0 opportuneSpeakEventMonitor:0 phoneCallStateMonitor:0 otherAppRecordingStateMonitor:0 voiceTriggerHearstAPEnabledPolicy:0];
}

- (CSVoiceTriggerFirstPassHearstAP)initWithSpeechManager:(id)a3 voiceTriggerEnabledMonitor:(id)a4 siriClientBehaviorMonitor:(id)a5 opportuneSpeakEventMonitor:(id)a6 phoneCallStateMonitor:(id)a7 otherAppRecordingStateMonitor:(id)a8 voiceTriggerHearstAPEnabledPolicy:(id)a9
{
  id v28 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v29.receiver = self;
  v29.super_class = (Class)CSVoiceTriggerFirstPassHearstAP;
  float v18 = [(CSVoiceTriggerFirstPassHearstAP *)&v29 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_speechManager, a3);
    objc_storeStrong((id *)&v19->_siriClientBehaviorMonitor, a5);
    objc_storeStrong((id *)&v19->_opportuneSpeakEventMonitor, a6);
    objc_storeStrong((id *)&v19->_otherAppRecordingStateMonitor, a8);
    objc_storeStrong((id *)&v19->_voiceTriggerHearstAPEnabledPolicy, a9);
    dispatch_queue_t v20 = dispatch_queue_create("CSVoiceTriggerFirstPassHearstAP", 0);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v20;

    dispatch_group_t v22 = dispatch_group_create();
    recordingWillStartGroup = v19->_recordingWillStartGroup;
    v19->_recordingWillStartGroup = (OS_dispatch_group *)v22;

    uint64_t v24 = +[NSMutableArray array];
    audioStreamHoldings = v19->_audioStreamHoldings;
    v19->_audioStreamHoldings = (NSMutableArray *)v24;

    +[CSConfig inputRecordingBufferDuration];
    v19->_heartbeatFactor = (unint64_t)(2.0 / v26);
  }

  return v19;
}

@end