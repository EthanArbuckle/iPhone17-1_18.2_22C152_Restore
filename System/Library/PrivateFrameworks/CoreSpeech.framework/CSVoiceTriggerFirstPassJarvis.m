@interface CSVoiceTriggerFirstPassJarvis
+ (id)jarvisAudioLogDirectory;
+ (id)jarvisAudioLoggingFilePath;
+ (id)timeStampString;
- (BOOL)firstTimeAssetConfigured;
- (BOOL)hasReceivedNDEAPIResult;
- (BOOL)hasTriggerCandidate;
- (BOOL)isSecondPassRunning;
- (BOOL)isSiriClientListening;
- (CSAsset)currentAsset;
- (CSAudioProvider)audioProvider;
- (CSAudioStream)audioStream;
- (CSAudioStreamHolding)audioStreamHolding;
- (CSKeywordAnalyzerNDEAPI)keywordAnalyzerNDEAPI;
- (CSKeywordAnalyzerNDEAPIResult)jarvisTriggerResult;
- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSSPGEndpointAnalyzer)endpointAnalyzer;
- (CSSpeechManager)speechManager;
- (CSVoiceTriggerDelegate)delegate;
- (CSVoiceTriggerFirstPassJarvis)init;
- (CSVoiceTriggerFirstPassJarvis)initWithSpeechManager:(id)a3 otherAppRecordingStateMonitor:(id)a4;
- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics;
- (CSVoiceTriggerRTModel)rtModel;
- (CSVoiceTriggerSecondChanceContext)secondChanceContext;
- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass;
- (CSVoiceTriggerUserSelectedPhrase)multiPhraseSelectedStatus;
- (NSMutableArray)assetConfigWaitingBuffer;
- (NSString)deviceId;
- (OS_dispatch_queue)queue;
- (int64_t)latestTriggerMode;
- (unint64_t)activeChannel;
- (unint64_t)earlyDetectFiredMachTime;
- (unint64_t)jarvisVoiceTriggerTimeout;
- (unint64_t)numProcessedSamples;
- (void)_cancelAudioStreamHold;
- (void)_clearTriggerCandidate;
- (void)_createSecondPassIfNeeded;
- (void)_didDetectKeywordFromDeviceId:(id)a3 activationInfo:(id)a4 triggerHostTime:(unint64_t)a5 completion:(id)a6;
- (void)_didStartAudioStream;
- (void)_didStopAudioStream;
- (void)_handleAudioChunk:(id)a3;
- (void)_handleJarvisVoiceTriggerFromDeviceId:(id)a3 activationInfo:(id)a4 triggerHostTime:(unint64_t)a5 completion:(id)a6;
- (void)_handleSecondPassResult:(id)a3 deviceId:(id)a4 error:(id)a5;
- (void)_holdAudioStreamWithTimeout:(double)a3;
- (void)_notifyJarvisVoiceTriggerReject;
- (void)_reportJarvisVoiceTriggerFire;
- (void)_requestStartAudioStreamWitContext:(id)a3 startStreamOption:(id)a4 completion:(id)a5;
- (void)_reset;
- (void)_setAsset:(id)a3;
- (void)_teardownSecondPass;
- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)keywordAnalyzerNDEAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5;
- (void)reset;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAsset:(id)a3;
- (void)setAssetConfigWaitingBuffer:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioProvider:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setAudioStreamHolding:(id)a3;
- (void)setCurrentAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceId:(id)a3;
- (void)setEarlyDetectFiredMachTime:(unint64_t)a3;
- (void)setEndpointAnalyzer:(id)a3;
- (void)setFirstTimeAssetConfigured:(BOOL)a3;
- (void)setFirstpassMetrics:(id)a3;
- (void)setHasReceivedNDEAPIResult:(BOOL)a3;
- (void)setHasTriggerCandidate:(BOOL)a3;
- (void)setIsSecondPassRunning:(BOOL)a3;
- (void)setIsSiriClientListening:(BOOL)a3;
- (void)setJarvisTriggerResult:(id)a3;
- (void)setJarvisVoiceTriggerTimeout:(unint64_t)a3;
- (void)setKeywordAnalyzerNDEAPI:(id)a3;
- (void)setLatestTriggerMode:(int64_t)a3;
- (void)setMultiPhraseSelectedStatus:(id)a3;
- (void)setNumProcessedSamples:(unint64_t)a3;
- (void)setOtherAppRecordingStateMonitor:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRtModel:(id)a3;
- (void)setSecondChanceContext:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)setVoiceTriggerSecondPass:(id)a3;
- (void)siriClientBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 successfully:(BOOL)a5 option:(id)a6 withEventUUID:(id)a7;
- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5;
- (void)siriClientBehaviorMonitor:(id)a3 willStopStream:(id)a4 reason:(unint64_t)a5;
- (void)spgEndpointAnalyzerDidDetectEndpoint:(id)a3;
- (void)start;
@end

@implementation CSVoiceTriggerFirstPassJarvis

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiPhraseSelectedStatus, 0);
  objc_storeStrong((id *)&self->_otherAppRecordingStateMonitor, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_firstpassMetrics, 0);
  objc_storeStrong((id *)&self->_assetConfigWaitingBuffer, 0);
  objc_storeStrong((id *)&self->_secondChanceContext, 0);
  objc_storeStrong((id *)&self->_voiceTriggerSecondPass, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_rtModel, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_endpointAnalyzer, 0);
  objc_storeStrong((id *)&self->_jarvisTriggerResult, 0);
  objc_storeStrong((id *)&self->_keywordAnalyzerNDEAPI, 0);
  objc_storeStrong((id *)&self->_currentAsset, 0);
  objc_storeStrong((id *)&self->_audioStreamHolding, 0);
  objc_storeStrong((id *)&self->_audioProvider, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
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

- (void)setOtherAppRecordingStateMonitor:(id)a3
{
}

- (CSOtherAppRecordingStateMonitor)otherAppRecordingStateMonitor
{
  return self->_otherAppRecordingStateMonitor;
}

- (void)setSpeechManager:(id)a3
{
}

- (CSSpeechManager)speechManager
{
  return self->_speechManager;
}

- (void)setFirstpassMetrics:(id)a3
{
}

- (CSVoiceTriggerFirstPassMetrics)firstpassMetrics
{
  return self->_firstpassMetrics;
}

- (void)setAssetConfigWaitingBuffer:(id)a3
{
}

- (NSMutableArray)assetConfigWaitingBuffer
{
  return self->_assetConfigWaitingBuffer;
}

- (void)setFirstTimeAssetConfigured:(BOOL)a3
{
  self->_firstTimeAssetConfigured = a3;
}

- (BOOL)firstTimeAssetConfigured
{
  return self->_firstTimeAssetConfigured;
}

- (void)setSecondChanceContext:(id)a3
{
}

- (CSVoiceTriggerSecondChanceContext)secondChanceContext
{
  return self->_secondChanceContext;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_isSiriClientListening = a3;
}

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setIsSecondPassRunning:(BOOL)a3
{
  self->_isSecondPassRunning = a3;
}

- (BOOL)isSecondPassRunning
{
  return self->_isSecondPassRunning;
}

- (void)setVoiceTriggerSecondPass:(id)a3
{
}

- (CSVoiceTriggerSecondPass)voiceTriggerSecondPass
{
  return self->_voiceTriggerSecondPass;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setRtModel:(id)a3
{
}

- (CSVoiceTriggerRTModel)rtModel
{
  return self->_rtModel;
}

- (void)setDeviceId:(id)a3
{
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setEndpointAnalyzer:(id)a3
{
}

- (CSSPGEndpointAnalyzer)endpointAnalyzer
{
  return self->_endpointAnalyzer;
}

- (void)setLatestTriggerMode:(int64_t)a3
{
  self->_latestTriggerMode = a3;
}

- (int64_t)latestTriggerMode
{
  return self->_latestTriggerMode;
}

- (void)setEarlyDetectFiredMachTime:(unint64_t)a3
{
  self->_earlyDetectFiredMachTime = a3;
}

- (unint64_t)earlyDetectFiredMachTime
{
  return self->_earlyDetectFiredMachTime;
}

- (void)setJarvisTriggerResult:(id)a3
{
}

- (CSKeywordAnalyzerNDEAPIResult)jarvisTriggerResult
{
  return self->_jarvisTriggerResult;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setJarvisVoiceTriggerTimeout:(unint64_t)a3
{
  self->_jarvisVoiceTriggerTimeout = a3;
}

- (unint64_t)jarvisVoiceTriggerTimeout
{
  return self->_jarvisVoiceTriggerTimeout;
}

- (void)setNumProcessedSamples:(unint64_t)a3
{
  self->_numProcessedSamples = a3;
}

- (unint64_t)numProcessedSamples
{
  return self->_numProcessedSamples;
}

- (void)setHasTriggerCandidate:(BOOL)a3
{
  self->_hasTriggerCandidate = a3;
}

- (BOOL)hasTriggerCandidate
{
  return self->_hasTriggerCandidate;
}

- (void)setHasReceivedNDEAPIResult:(BOOL)a3
{
  self->_hasReceivedNDEAPIResult = a3;
}

- (BOOL)hasReceivedNDEAPIResult
{
  return self->_hasReceivedNDEAPIResult;
}

- (void)setKeywordAnalyzerNDEAPI:(id)a3
{
}

- (CSKeywordAnalyzerNDEAPI)keywordAnalyzerNDEAPI
{
  return self->_keywordAnalyzerNDEAPI;
}

- (void)setCurrentAsset:(id)a3
{
}

- (CSAsset)currentAsset
{
  return self->_currentAsset;
}

- (void)setAudioStreamHolding:(id)a3
{
}

- (CSAudioStreamHolding)audioStreamHolding
{
  return self->_audioStreamHolding;
}

- (void)setAudioProvider:(id)a3
{
}

- (CSAudioProvider)audioProvider
{
  return self->_audioProvider;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
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
  block[2] = sub_10006EB84;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)siriClientBehaviorMonitor:(id)a3 didStopStream:(id)a4 withEventUUID:(id)a5
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006ECB0;
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
    v20 = "-[CSVoiceTriggerFirstPassJarvis siriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (v9)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006EED0;
    block[3] = &unk_100253AE0;
    block[4] = self;
    dispatch_async(queue, block);
  }
  [(CSVoiceTriggerFirstPassJarvis *)self _cancelAudioStreamHold];
}

- (void)_cancelAudioStreamHold
{
  v3 = [(CSVoiceTriggerFirstPassJarvis *)self audioProvider];
  [v3 cancelAudioStreamHold:self->_audioStreamHolding];

  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = 0;
}

- (void)_holdAudioStreamWithTimeout:(double)a3
{
  id v7 = +[CSAudioStreamHoldRequestOption defaultOptionWithTimeout:a3];
  v4 = [(CSVoiceTriggerFirstPassJarvis *)self audioProvider];
  v5 = [v4 holdAudioStreamWithDescription:@"CSVoiceTriggerFirstPassJarvis" option:v7];
  audioStreamHolding = self->_audioStreamHolding;
  self->_audioStreamHolding = v5;
}

- (void)_teardownSecondPass
{
  voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
  self->_voiceTriggerSecondPass = 0;
}

- (void)_createSecondPassIfNeeded
{
  if (!self->_voiceTriggerSecondPass)
  {
    v3 = [[CSVoiceTriggerSecondPass alloc] initWithPHSEnabled:0];
    voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
    self->_voiceTriggerSecondPass = v3;

    [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setFirstPassSource:4];
    [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setSecondPassClient:3];
    [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setAsset:self->_currentAsset];
    v5 = self->_voiceTriggerSecondPass;
    [(CSVoiceTriggerSecondPass *)v5 start];
  }
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
    *(_DWORD *)buf = 136315906;
    v32 = "-[CSVoiceTriggerFirstPassJarvis _handleSecondPassResult:deviceId:error:]";
    __int16 v33 = 1026;
    *(_DWORD *)v34 = v11;
    *(_WORD *)&v34[4] = 2114;
    *(void *)&v34[6] = v12;
    __int16 v35 = 2114;
    v36 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Second Pass Result, %{public}d, %{public}@, %{public}@", buf, 0x26u);
  }
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
        *(_DWORD *)buf = 136315394;
        v32 = "-[CSVoiceTriggerFirstPassJarvis _handleSecondPassResult:deviceId:error:]";
        __int16 v33 = 2114;
        *(void *)v34 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s VoiceTrigger Second Pass has failed : %{public}@", buf, 0x16u);

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

  queue = self->_queue;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10006F4F8;
  v30[3] = &unk_100253B58;
  v30[4] = self;
  v30[5] = v11;
  dispatch_async(queue, v30);
}

- (void)_reportJarvisVoiceTriggerFire
{
  v25[0] = kVTEIfirstPassDetectedChannel;
  v3 = +[NSNumber numberWithUnsignedInteger:self->_activeChannel];
  v26[0] = v3;
  v25[1] = kVTEIfirstPassScore;
  [(CSKeywordAnalyzerNDEAPIResult *)self->_jarvisTriggerResult bestScore];
  v4 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v26[1] = v4;
  v25[2] = kVTEIfirstPassStartSampleCount;
  v5 = +[NSNumber numberWithUnsignedInteger:[(CSKeywordAnalyzerNDEAPIResult *)self->_jarvisTriggerResult bestStart]];
  v26[2] = v5;
  v25[3] = kVTEIfirstPassEndSampleCount;
  v6 = +[NSNumber numberWithUnsignedInteger:[(CSKeywordAnalyzerNDEAPIResult *)self->_jarvisTriggerResult bestEnd]];
  v26[3] = v6;
  v25[4] = kVTEIearlyDetectFiredMachTime;
  id v7 = +[NSNumber numberWithUnsignedLongLong:self->_earlyDetectFiredMachTime];
  v26[4] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];

  id v9 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSVoiceTriggerFirstPassJarvis _reportJarvisVoiceTriggerFire]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@", buf, 0x16u);
  }
  kdebug_trace();
  self->_isSecondPassRunning = 1;
  [(CSVoiceTriggerFirstPassJarvis *)self _clearTriggerCandidate];
  [(CSSPGEndpointAnalyzer *)self->_endpointAnalyzer stop];
  [(CSPlainAudioFileWriter *)self->_audioFileWriter endAudio];
  objc_initWeak(&location, self);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  char v22 = sub_10006FBE8;
  v23 = sub_10006FBF8;
  id v24 = +[CSJarvisTriggerModeMonitor triggerModeStringDescription:self->_latestTriggerMode];
  [(CSVoiceTriggerFirstPassJarvis *)self _createSecondPassIfNeeded];
  id v10 = [CSVoiceTriggerSecondPassRequestOption alloc];
  deviceId = self->_deviceId;
  id v12 = [(CSVoiceTriggerFirstPassJarvis *)self audioProvider];
  id v13 = [v12 UUID];
  id v14 = +[NSUUID UUID];
  id v15 = [(CSVoiceTriggerSecondPassRequestOption *)v10 initWithFirstPassSource:4 deviceId:deviceId audioProviderUUID:v13 firstPassInfo:v8 rejectionMHUUID:v14 isSecondChanceRun:[(CSVoiceTriggerSecondChanceContext *)self->_secondChanceContext shouldRunAsSecondChance] firstpassMetrics:self->_firstpassMetrics rtModelRequestOptions:0];

  [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setSupportsMultiPhraseDetection:[(CSVoiceTriggerUserSelectedPhrase *)self->_multiPhraseSelectedStatus multiPhraseSelected]];
  voiceTriggerSecondPass = self->_voiceTriggerSecondPass;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10006FC00;
  v18[3] = &unk_10024FCF8;
  v18[5] = buf;
  objc_copyWeak(&v19, &location);
  v18[4] = self;
  [(CSVoiceTriggerSecondPass *)voiceTriggerSecondPass handleVoiceTriggerSecondPassFrom:v15 completion:v18];
  firstpassMetrics = self->_firstpassMetrics;
  self->_firstpassMetrics = 0;

  objc_destroyWeak(&v19);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

- (void)_notifyJarvisVoiceTriggerReject
{
  v3 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t numProcessedSamples = self->_numProcessedSamples;
    *(_DWORD *)buf = 136315394;
    id v8 = "-[CSVoiceTriggerFirstPassJarvis _notifyJarvisVoiceTriggerReject]";
    __int16 v9 = 2050;
    unint64_t v10 = numProcessedSamples;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Notify jarvis handler reject at: %{public}tu", buf, 0x16u);
  }
  self->_hasReceivedNDEAPIResult = 1;
  [(CSVoiceTriggerFirstPassJarvis *)self _reset];
  v5 = [(CSVoiceTriggerFirstPassJarvis *)self audioStream];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10006FE88;
  v6[3] = &unk_1002531E0;
  v6[4] = self;
  [v5 stopAudioStreamWithOption:0 completion:v6];

  [(CSVoiceTriggerFirstPassJarvis *)self _cancelAudioStreamHold];
}

- (void)_didDetectKeywordFromDeviceId:(id)a3 activationInfo:(id)a4 triggerHostTime:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006FFF8;
  block[3] = &unk_10024FCD0;
  id v20 = v12;
  unint64_t v21 = a5;
  block[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(queue, block);
}

- (void)_requestStartAudioStreamWitContext:(id)a3 startStreamOption:(id)a4 completion:(id)a5
{
  id v8 = a4;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100070478;
  v24[3] = &unk_100253100;
  id v9 = a5;
  id v25 = v9;
  id v10 = a3;
  id v11 = objc_retainBlock(v24);
  speechManager = self->_speechManager;
  id v23 = 0;
  id v13 = [(CSSpeechManager *)speechManager audioProviderWithContext:v10 error:&v23];

  id v14 = v23;
  if (v13)
  {
    [(CSVoiceTriggerFirstPassJarvis *)self setAudioProvider:v13];
    id v15 = objc_alloc_init((Class)CSAudioStreamRequest);
    [v15 setRequiresHistoricalBuffer:1];
    id v16 = (objc_class *)objc_opt_class();
    char v17 = NSStringFromClass(v16);
    id v22 = 0;
    id v18 = [v13 audioStreamWithRequest:v15 streamName:v17 error:&v22];
    id v19 = v22;

    if (v18)
    {
      [(CSVoiceTriggerFirstPassJarvis *)self setAudioStream:v18];
      [v18 setDelegate:self];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100070490;
      v20[3] = &unk_100253150;
      v20[4] = self;
      unint64_t v21 = v11;
      [v18 startAudioStreamWithOption:v8 completion:v20];
    }
    else
    {
      ((void (*)(void *, void, id))v11[2])(v11, 0, v19);
    }
  }
  else
  {
    ((void (*)(void *, void, id))v11[2])(v11, 0, v14);
  }
}

- (void)_handleJarvisVoiceTriggerFromDeviceId:(id)a3 activationInfo:(id)a4 triggerHostTime:(unint64_t)a5 completion:(id)a6
{
  id v9 = a3;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100070940;
  v35[3] = &unk_100253100;
  id v10 = a6;
  id v36 = v10;
  id v11 = objc_retainBlock(v35);
  if (!self->_rtModel)
  {
    id v24 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[CSVoiceTriggerFirstPassJarvis _handleJarvisVoiceTriggerFromDeviceId:activationInfo:triggerHostTime:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s rtModel is nil!", buf, 0xCu);
    }
    uint64_t v25 = CSErrorDomain;
    uint64_t v26 = 114;
    goto LABEL_11;
  }
  id v12 = objc_alloc((Class)CSKeywordAnalyzerNDEAPI);
  id v13 = [(CSVoiceTriggerRTModel *)self->_rtModel modelData];
  id v14 = (CSKeywordAnalyzerNDEAPI *)[v12 initWithBlob:v13];
  keywordAnalyzerNDEAPI = self->_keywordAnalyzerNDEAPI;
  self->_keywordAnalyzerNDEAPI = v14;

  [(CSKeywordAnalyzerNDEAPI *)self->_keywordAnalyzerNDEAPI setActiveChannel:self->_activeChannel];
  [(CSKeywordAnalyzerNDEAPI *)self->_keywordAnalyzerNDEAPI setDelegate:self];
  if (!self->_keywordAnalyzerNDEAPI)
  {
    v27 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "-[CSVoiceTriggerFirstPassJarvis _handleJarvisVoiceTriggerFromDeviceId:activationInfo:triggerHostTime:completion:]";
      _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s keywordAnalyzerNDEAPI is nil!", buf, 0xCu);
    }
    uint64_t v25 = CSErrorDomain;
    uint64_t v26 = 506;
LABEL_11:
    v28 = +[NSError errorWithDomain:v25 code:v26 userInfo:0];
    ((void (*)(void *, void, void *))v11[2])(v11, 0, v28);
    goto LABEL_17;
  }
  self->_hasReceivedNDEAPIResult = 0;
  +[CSConfig inputRecordingSampleRate];
  self->_jarvisVoiceTriggerTimeout = (unint64_t)(float)(v16 * 3.0);
  char v17 = +[CSJarvisTriggerModeMonitor sharedInstance];
  self->_latestTriggerMode = (int64_t)[v17 getTriggerMode];

  if (self->_latestTriggerMode == 2)
  {
    id v18 = [CSSPGEndpointAnalyzer alloc];
    LODWORD(v19) = 1161527296;
    id v20 = [(CSSPGEndpointAnalyzer *)v18 initWithEndpointThreshold:v19];
    endpointAnalyzer = self->_endpointAnalyzer;
    self->_endpointAnalyzer = v20;

    [(CSSPGEndpointAnalyzer *)self->_endpointAnalyzer setDelegate:self];
    +[CSConfig inputRecordingSampleRate];
    self->_jarvisVoiceTriggerTimeout = (unint64_t)(float)(v22 * 60.0);
    float v23 = 0.5;
  }
  else
  {
    float v23 = 1.1;
  }
  v28 = +[CSAudioRecordContext contextForJarvisWithDeviceId:v9];
  v29 = +[CSAudioStartStreamOption noAlertOption];
  [v29 setRequestHistoricalAudioDataWithHostTime:1];
  *(float *)&double v30 = v23;
  if ((unint64_t)+[CSFTimeUtils secondsToHostTime:v30] >= a5)
  {
    unint64_t v32 = 0;
  }
  else
  {
    *(float *)&double v31 = v23;
    unint64_t v32 = a5 - (void)+[CSFTimeUtils secondsToHostTime:v31];
  }
  [v29 setStartRecordingHostTime:v32];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100070A78;
  v33[3] = &unk_100253150;
  v33[4] = self;
  v34 = v11;
  [(CSVoiceTriggerFirstPassJarvis *)self _requestStartAudioStreamWitContext:v28 startStreamOption:v29 completion:v33];

LABEL_17:
}

- (void)spgEndpointAnalyzerDidDetectEndpoint:(id)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100070C14;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)activationEventNotificationHandler:(id)a3 event:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, uint64_t))a5;
  if ([v9 type] != (id)6)
  {
    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v13 = +[NSError errorWithDomain:CSErrorDomain code:114 userInfo:0];
LABEL_8:
    id v14 = (void *)v13;
    v10[2](v10, 0, v13);

    goto LABEL_14;
  }
  if (![(CSOtherAppRecordingStateMonitor *)self->_otherAppRecordingStateMonitor isOtherNonEligibleAppRecording])
  {
    id v15 = +[CSFPreferences sharedPreferences];
    unsigned int v16 = [v15 voiceTriggerEnabled];

    if (v16)
    {
      objc_initWeak((id *)location, self);
      char v17 = [v9 deviceId];
      id v18 = [v9 activationInfo];
      id v19 = [v9 hosttime];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100070FCC;
      v20[3] = &unk_100250738;
      objc_copyWeak(&v22, (id *)location);
      unint64_t v21 = v10;
      [(CSVoiceTriggerFirstPassJarvis *)self _didDetectKeywordFromDeviceId:v17 activationInfo:v18 triggerHostTime:v19 completion:v20];

      objc_destroyWeak(&v22);
      objc_destroyWeak((id *)location);
      goto LABEL_14;
    }
    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v13 = +[NSError errorWithDomain:CSErrorDomain code:604 userInfo:0];
    goto LABEL_8;
  }
  id v11 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id location = 136315394;
    *(void *)&location[4] = "-[CSVoiceTriggerFirstPassJarvis activationEventNotificationHandler:event:completion:]";
    __int16 v24 = 2114;
    id v25 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s Ignore %{public}@ since there is an other non eligible app recording", location, 0x16u);
    if (!v10) {
      goto LABEL_14;
    }
    goto LABEL_5;
  }
  if (v10)
  {
LABEL_5:
    id v12 = +[NSError errorWithDomain:CSErrorDomain code:610 userInfo:0];
    v10[2](v10, 0, (uint64_t)v12);
  }
LABEL_14:
}

- (void)keywordAnalyzerNDEAPI:(id)a3 hasResultAvailable:(id)a4 forChannel:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!self->_hasReceivedNDEAPIResult)
  {
    self->_hasReceivedNDEAPIResult = 1;
    objc_storeStrong((id *)&self->_jarvisTriggerResult, a4);
    [(CSVoiceTriggerFirstPassJarvis *)self _reportJarvisVoiceTriggerFire];
    [(CSVoiceTriggerFirstPassJarvis *)self _reset];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.siri.myriad.jarvis", 0, 0, 1u);
    id v10 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315138;
      id v12 = "-[CSVoiceTriggerFirstPassJarvis keywordAnalyzerNDEAPI:hasResultAvailable:forChannel:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Send Jarvis Myriad notification", (uint8_t *)&v11, 0xCu);
    }
  }
  [v7 reset];
}

- (void)_handleAudioChunk:(id)a3
{
  id v4 = a3;
  uint64_t v5 = qword_1002A37D8;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * qword_1002A37D8, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace();
    uint64_t v5 = qword_1002A37D8;
  }
  qword_1002A37D8 = v5 + 1;
  if (self->_currentAsset)
  {
    uint64_t v6 = qword_1002A37E0;
    if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * qword_1002A37E0, 2) <= 0xCCCCCCCCCCCCCCCuLL)
    {
      id v7 = CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_INFO))
      {
        BOOL isSecondPassRunning = self->_isSecondPassRunning;
        BOOL isSiriClientListening = self->_isSiriClientListening;
        int v18 = 136315906;
        id v19 = "-[CSVoiceTriggerFirstPassJarvis _handleAudioChunk:]";
        __int16 v20 = 2050;
        uint64_t v21 = v6;
        __int16 v22 = 1026;
        BOOL v23 = isSecondPassRunning;
        __int16 v24 = 1026;
        BOOL v25 = isSiriClientListening;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s NDEAPI Jarvis first pass heart beat %{public}llu, isSecondPassRunning? %{public}d, isSiriClientListening? %{public}d", (uint8_t *)&v18, 0x22u);
        uint64_t v6 = qword_1002A37E0;
      }
    }
    qword_1002A37E0 = v6 + 1;
    if (!self->_isSecondPassRunning && !self->_isSiriClientListening)
    {
      unint64_t numProcessedSamples = self->_numProcessedSamples;
      int v11 = (char *)[v4 numSamples] + numProcessedSamples;
      audioFileWriter = self->_audioFileWriter;
      id v13 = [v4 data];
      -[CSPlainAudioFileWriter addSamples:numSamples:](audioFileWriter, "addSamples:numSamples:", [v13 bytes], objc_msgSend(v4, "numSamples"));

      if ((unint64_t)v11 < self->_jarvisVoiceTriggerTimeout || self->_hasReceivedNDEAPIResult)
      {
        id v14 = [(CSKeywordAnalyzerNDEAPI *)self->_keywordAnalyzerNDEAPI processAudioChunk:v4];
        self->_numProcessedSamples += (unint64_t)[v4 numSamples];
        endpointAnalyzer = self->_endpointAnalyzer;
        unsigned int v16 = [v4 dataForChannel:self->_activeChannel];
        -[CSSPGEndpointAnalyzer addAudio:numSamples:](endpointAnalyzer, "addAudio:numSamples:", v16, [v4 numSamples]);
      }
      else
      {
        [(CSVoiceTriggerFirstPassJarvis *)self _notifyJarvisVoiceTriggerReject];
      }
    }
  }
  else
  {
    char v17 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136315138;
      id v19 = "-[CSVoiceTriggerFirstPassJarvis _handleAudioChunk:]";
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s Could not find Assets. Cannot process Audio", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000714DC;
  v8[3] = &unk_100253B08;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000716B8;
  v5[3] = &unk_100253B58;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)_didStopAudioStream
{
  v3 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSVoiceTriggerFirstPassJarvis _didStopAudioStream]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  kdebug_trace();
  [(CSVoiceTriggerFirstPassJarvis *)self _clearTriggerCandidate];
  [(CSSPGEndpointAnalyzer *)self->_endpointAnalyzer stop];
  [(CSPlainAudioFileWriter *)self->_audioFileWriter endAudio];
}

- (void)_didStartAudioStream
{
  kdebug_trace();
  [(CSSPGEndpointAnalyzer *)self->_endpointAnalyzer start];
  v3 = +[CSFPreferences sharedPreferences];
  unsigned int v4 = [v3 jarvisAudioLoggingEnabled];

  if (v4)
  {
    id v5 = +[CSVoiceTriggerFirstPassJarvis jarvisAudioLoggingFilePath];
    uint64_t v6 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      id v13 = "-[CSVoiceTriggerFirstPassJarvis _didStartAudioStream]";
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Jarvis firstpass writing audio file into %{public}@", (uint8_t *)&v12, 0x16u);
    }
    id v7 = objc_alloc((Class)CSPlainAudioFileWriter);
    id v8 = +[NSURL URLWithString:v5];
    id v9 = (CSPlainAudioFileWriter *)[v7 initWithURL:v8];
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v9;
  }
  else
  {
    int v11 = self->_audioFileWriter;
    self->_audioFileWriter = 0;
  }
}

- (void)_clearTriggerCandidate
{
  v3 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSVoiceTriggerFirstPassJarvis _clearTriggerCandidate]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Clearing VoiceTrigger candidate in the voiceTriggerJarvis", (uint8_t *)&v4, 0xCu);
  }
  self->_hasTriggerCandidate = 0;
}

- (void)_setAsset:(id)a3
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 logAssetVersionForInsight];
    objc_storeStrong((id *)&self->_currentAsset, a3);
    id v7 = [v6 RTModelWithFallbackLanguage:@"en-US"];
    rtModel = self->_rtModel;
    self->_rtModel = v7;

    [(CSVoiceTriggerFirstPassJarvis *)self _reset];
    [(CSVoiceTriggerSecondPass *)self->_voiceTriggerSecondPass setAsset:v6];
    if (!self->_firstTimeAssetConfigured) {
      self->_firstTimeAssetConfigured = 1;
    }
  }
  else
  {
    id v9 = CSLogCategoryVT;
    if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      int v11 = "-[CSVoiceTriggerFirstPassJarvis _setAsset:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s asset is nil, stop initialization", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)setAsset:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100071C74;
  v7[3] = &unk_100253B08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_reset
{
  [(CSKeywordAnalyzerNDEAPI *)self->_keywordAnalyzerNDEAPI reset];
  self->_unint64_t numProcessedSamples = 0;
  [(CSVoiceTriggerFirstPassJarvis *)self _clearTriggerCandidate];
}

- (void)reset
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071D34;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)start
{
  v3 = CSLogCategoryVT;
  if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[CSVoiceTriggerFirstPassJarvis start]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100071E3C;
  block[3] = &unk_100253AE0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSVoiceTriggerFirstPassJarvis)init
{
  return [(CSVoiceTriggerFirstPassJarvis *)self initWithSpeechManager:0 otherAppRecordingStateMonitor:0];
}

- (CSVoiceTriggerFirstPassJarvis)initWithSpeechManager:(id)a3 otherAppRecordingStateMonitor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)CSVoiceTriggerFirstPassJarvis;
  id v9 = [(CSVoiceTriggerFirstPassJarvis *)&v25 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create("VoiceTriggerFirstPassJarvis Queue", 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    int v12 = v9->_queue;
    id v13 = dispatch_get_global_queue(33, 0);
    dispatch_set_target_queue(v12, v13);

    v9->_unint64_t numProcessedSamples = 0;
    v9->_activeChannel = (unint64_t)+[CSConfig channelForProcessedInput];
    +[CSConfig inputRecordingSampleRate];
    v9->_jarvisVoiceTriggerTimeout = (unint64_t)(float)(v14 * 3.0);
    [(CSVoiceTriggerFirstPassJarvis *)v9 _clearTriggerCandidate];
    id v15 = +[CSJarvisTriggerModeMonitor sharedInstance];
    [v15 addObserver:v9];

    v9->_firstTimeAssetConfigured = 0;
    uint64_t v16 = +[NSMutableArray array];
    assetConfigWaitingBuffer = v9->_assetConfigWaitingBuffer;
    v9->_assetConfigWaitingBuffer = (NSMutableArray *)v16;

    v9->_latestTriggerMode = -1;
    p_speechManager = (void **)&v9->_speechManager;
    objc_storeStrong((id *)&v9->_speechManager, a3);
    if (!v9->_speechManager)
    {
      uint64_t v19 = +[CSSpeechManager sharedManagerForCoreSpeechDaemon];
      __int16 v20 = *p_speechManager;
      *p_speechManager = (void *)v19;
    }
    p_otherAppRecordingStateMonitor = (void **)&v9->_otherAppRecordingStateMonitor;
    objc_storeStrong((id *)&v9->_otherAppRecordingStateMonitor, a4);
    if (!v9->_otherAppRecordingStateMonitor)
    {
      uint64_t v22 = +[CSOtherAppRecordingStateMonitor sharedInstance];
      BOOL v23 = *p_otherAppRecordingStateMonitor;
      *p_otherAppRecordingStateMonitor = (void *)v22;
    }
  }

  return v9;
}

+ (id)timeStampString
{
  id v2 = objc_alloc_init((Class)NSDateFormatter);
  v3 = +[NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  [v2 setDateFormat:@"yyyyMMdd-HHmmss"];
  id v4 = +[NSDate date];
  id v5 = [v2 stringFromDate:v4];

  return v5;
}

+ (id)jarvisAudioLogDirectory
{
  id v2 = +[NSFileManager defaultManager];
  v3 = +[CSFPreferences sharedPreferences];
  id v4 = [v3 voiceTriggerAudioLogDirectory];

  if ([v2 fileExistsAtPath:v4])
  {
    id v5 = 0;
  }
  else
  {
    id v11 = 0;
    unsigned __int8 v6 = [v2 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:&v11];
    id v5 = v11;
    if ((v6 & 1) == 0)
    {
      id v7 = (void *)CSLogCategoryVT;
      if (os_log_type_enabled(CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        id v9 = v7;
        dispatch_queue_t v10 = [v5 localizedDescription];
        *(_DWORD *)buf = 136315650;
        id v13 = "+[CSVoiceTriggerFirstPassJarvis jarvisAudioLogDirectory]";
        __int16 v14 = 2114;
        id v15 = v4;
        __int16 v16 = 2114;
        char v17 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Couldn't create jarvis audio logging directory at path %{public}@ %{public}@", buf, 0x20u);
      }
      id v4 = @"/tmp";
    }
  }

  return v4;
}

+ (id)jarvisAudioLoggingFilePath
{
  id v2 = +[CSVoiceTriggerFirstPassJarvis jarvisAudioLogDirectory];
  v3 = +[CSVoiceTriggerFirstPassJarvis timeStampString];
  id v4 = +[NSString stringWithFormat:@"%@%@.wav", v3, @"-jarvis"];

  id v5 = [v2 stringByAppendingPathComponent:v4];

  return v5;
}

@end