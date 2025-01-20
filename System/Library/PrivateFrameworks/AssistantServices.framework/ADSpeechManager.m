@interface ADSpeechManager
+ (id)_ADSpeechManagerLowPriorityDispatchQueue;
+ (id)_badStateError;
+ (id)_speechCodecError;
+ (id)sharedManager;
- (ADAudioSessionCoordinator)audioSessionCoordinator;
- (AFAudioPowerUpdater)audioPowerUpdater;
- (AFAudioSessionAssertionAcquisitionService)audioSessionAssertionAcquisitionService;
- (AFDictationOptions)dictationOptions;
- (BOOL)_endSessionIfIdle;
- (BOOL)_releaseSession;
- (BOOL)_supportsVolumeService;
- (BOOL)isCapturing;
- (BOOL)isDriving;
- (BOOL)isLocallyRecognizing;
- (BOOL)isLocallyRecognizingInDictationMode;
- (BOOL)isStopped;
- (CSAudioSessionController)audioSessionController;
- (CSSiriAudioPlaybackService)audioPlaybackService;
- (NSArray)dictationLanguages;
- (NSArray)inlineItemList;
- (NSString)initialDictationLanguage;
- (NSString)primaryDictationLanguage;
- (id)_currentSpeechCaptureSource;
- (id)_initWithInstanceContext:(id)a3;
- (id)_interactiveLocalSpeechRecognizer;
- (id)_recordingInfo;
- (id)_speechCompressor;
- (id)_speechRecorder;
- (id)_startFixedPriorityCaptureForMode:(int64_t)a3 options:(id)a4 sessionUUID:(id)a5;
- (id)_volumeService;
- (id)context;
- (id)endpointerModelVersion;
- (id)getRecordingInfo;
- (id)startSpeechCaptureForDictationWithOptions:(id)a3 sessionUUID:(id)a4 secureOfflineOnly:(BOOL)a5;
- (id)startSpeechCaptureForRequestWithOptions:(id)a3 sessionUUID:(id)a4 language:(id)a5;
- (void)_addRecordStoppedCompletion:(id)a3;
- (void)_cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:(id)a3;
- (void)_cancelRecordingWithError:(id)a3 suppressAlert:(BOOL)a4;
- (void)_cleanUpDelegateInfo;
- (void)_fetchSmartSiriVolume:(BOOL)a3;
- (void)_fetchSmartSiriVolumeForType:(unint64_t)a3 forceFetch:(BOOL)a4;
- (void)_getAdjustedSiriOutputVolumeLevelForAudioRoute:(id)a3 withCompletion:(id)a4;
- (void)_lastAudioBufferReceivedWithEndpointMode:(int64_t)a3 totalPacketCount:(int64_t)a4 endpointerMetrics:(id)a5;
- (void)_prepareAudioSystemWithContext:(id)a3 audioSessionAssertion:(id)a4 completion:(id)a5;
- (void)_recordingStoppedWithError:(id)a3 totalPacketCount:(int64_t)a4 endpointMode:(int64_t)a5 endpointerMetrics:(id)a6;
- (void)_startCaptureForMode:(int64_t)a3 options:(id)a4 context:(id)a5;
- (void)_stopSpeechCaptureWithOptions:(id)a3;
- (void)_tellDelegateAboutFingerprint:(id)a3 duration:(double)a4;
- (void)_tellDelegateAboutInputAveragePower:(float)a3 peak:(float)a4;
- (void)_tellDelegateAboutSpeechPackets:(id)a3 atTimestamp:(double)a4 count:(int64_t)a5;
- (void)_tellDelegateAudioFileDidFinish:(id)a3 error:(id)a4;
- (void)_tellDelegateDidDetectLanguage:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5;
- (void)_tellDelegateDidSetAudioSessionActive:(BOOL)a3;
- (void)_tellDelegateEndpointWasDelayedForMusic;
- (void)_tellDelegateMusicWasDetected;
- (void)_tellDelegateQuickStopWasRequested;
- (void)_tellDelegateShutdownUIWasRequested;
- (void)_tellDelegateSpeechCanceled;
- (void)_tellDelegateSpeechEndpointWasDetectedAtTime:(double)a3;
- (void)_tellDelegateSpeechFailedWithError:(id)a3;
- (void)_tellDelegateSpeechFinished;
- (void)_tellDelegateSpeechReceivedLastAudioBufferWithEndpointMode:(int64_t)a3 totalPacketCount:(int64_t)a4 endpointerMetrics:(id)a5;
- (void)_tellDelegateSpeechRecognitionUpdateWillBegin;
- (void)_tellDelegateSpeechShouldPreheatWithRecordingInfo:(id)a3;
- (void)_tellDelegateSpeechStartedWithRecordingInfo:(id)a3;
- (void)_tellDelegateSpeechStartpointWasDetectedAtTime:(double)a3;
- (void)_tellDelegateSpeechWillBeginWithTimestamp:(double)a3 isFromFile:(BOOL)a4 isAudioPowerUpdateDisabled:(BOOL)a5;
- (void)_tellDelegateSpeechWillStopRecordingWithSignpostID:(unint64_t)a3;
- (void)_tellDelegateToPerformTwoShotPromptWithType:(int64_t)a3 completion:(id)a4;
- (void)_tellDelegateUpdateAudioInfo:(id)a3;
- (void)_tellDelegateWillSetAudioSessionActive:(BOOL)a3;
- (void)_updateAudioDeviceInfo:(id)a3;
- (void)_updateCapturingStateWithOptions:(id)a3;
- (void)_updateRecordRoute:(id)a3 andDeviceIdentifier:(id)a4;
- (void)_updateSiriOutputVolume:(BOOL)a3 completion:(id)a4;
- (void)_updateSpeechState:(int)a3;
- (void)addRecordedDictationAudioSampleData:(id)a3;
- (void)adjustSiriOutputVolumeForRouteIfNeeded:(id)a3;
- (void)asrBridgeReceivedEagerRecognitionCandidate:(id)a3 rawRecognitionResult:(id)a4 duration:(double)a5 sessionUUID:(id)a6;
- (void)asrBridgeReceivedFinalResult:(id)a3 speechPackage:(id)a4 sessionUUID:(id)a5;
- (void)asrBridgeReceivedPartialResult:(id)a3 language:(id)a4 tokens:(id)a5;
- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5;
- (void)audioSessionCoordinator:(id)a3 prepareAudioSessionWithContext:(id)a4;
- (void)audioSessionCoordinator:(id)a3 releaseAudioSessionWithContext:(id)a4;
- (void)cancelLocalRecognitionIfActive;
- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3;
- (void)deactivateAudioSessionIfNoActiveAssertions;
- (void)dealloc;
- (void)dictationSessionDidComplete;
- (void)disableDESWithCompletion:(id)a3;
- (void)eagerlyInitializeAudioRecording;
- (void)endSession;
- (void)endSession:(BOOL)a3 completion:(id)a4;
- (void)enforcePreviousEndpointHint;
- (void)getLastStartpointTimestampAndCurrentTime:(id)a3;
- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 completion:(id)a4;
- (void)getRecordingInfoUsingBlock:(id)a3;
- (void)getSpeechRecorderVTSatScore:(id)a3;
- (void)getVolumeServiceUsingBlock:(id)a3;
- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5;
- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4;
- (void)localSpeechRecognizer:(id)a3 didProduceLoggablePackage:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4;
- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4;
- (void)playRecordingStartAlert;
- (void)preheatRecognizerWithOptions:(id)a3;
- (void)preheatWithOptions:(id)a3;
- (void)prepareAudioSystemWithContext:(id)a3 completion:(id)a4;
- (void)resetLocalRecognizer;
- (void)setClientConfiguration:(id)a3;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDictationLanguages:(id)a3;
- (void)setDictationOptions:(id)a3;
- (void)setDirtySiriOutputVolumeHostTime:(unint64_t)a3;
- (void)setEARLanguageDetectorSpeechRequestId:(id)a3;
- (void)setEndpointerDelayedTrigger:(BOOL)a3;
- (void)setEndpointerThreshold:(double)a3;
- (void)setFingerprintWasRecognized;
- (void)setInitialDictationLanguage:(id)a3;
- (void)setInlineItemList:(id)a3;
- (void)setIsDriving:(BOOL)a3;
- (void)setPrimaryDictationLanguage:(id)a3;
- (void)setSpeechRecognizedContext:(id)a3;
- (void)setSuppressAudioInterruptionEndedNotifications:(BOOL)a3;
- (void)speechCapturing:(id)a3 didDetectEndpointAtTime:(double)a4;
- (void)speechCapturing:(id)a3 didDetectLanguage:(id)a4 confidenceScores:(id)a5 isConfident:(BOOL)a6;
- (void)speechCapturing:(id)a3 didDetectStartpointAtTime:(double)a4;
- (void)speechCapturing:(id)a3 didFinishWritingAudioFile:(id)a4 error:(id)a5;
- (void)speechCapturing:(id)a3 didInterruptAudioSession:(id)a4;
- (void)speechCapturing:(id)a3 didLoseAudioSessionOwnerOrMediaServices:(id)a4;
- (void)speechCapturing:(id)a3 didReceiveFingerprint:(id)a4 duration:(double)a5;
- (void)speechCapturing:(id)a3 didSetAudioSessionActive:(BOOL)a4;
- (void)speechCapturing:(id)a3 languageDetectorDidFail:(id)a4;
- (void)speechCapturing:(id)a3 performTwoShotPromptWithType:(int64_t)a4 completion:(id)a5;
- (void)speechCapturing:(id)a3 willSetAudioSessionActive:(BOOL)a4;
- (void)speechCapturingDidDelayEndpointForMusic:(id)a3;
- (void)speechCapturingDidDetectMusic:(id)a3;
- (void)speechCapturingDidProvideConfidenceScores:(id)a3 classification:(unint64_t)a4 classifiedUser:(id)a5 unknownUserScore:(int64_t)a6 duration:(int64_t)a7 version:(int64_t)a8 thresholdingType:(id)a9 assetVersion:(id)a10;
- (void)speechCapturingDidReceiveLastAudioBufferWithEndpointMode:(int64_t)a3 totalPacketCount:(int64_t)a4 endpointerMetrics:(id)a5;
- (void)speechCapturingDidRecordSpeechPackets:(id)a3 atTimestamp:(double)a4 totalPacketCount:(int64_t)a5;
- (void)speechCapturingDidRequestQuickStop:(id)a3;
- (void)speechCapturingDidRequestShutdownUI:(id)a3;
- (void)speechCapturingDidRequestUpdateSiriOutputVolume:(id)a3;
- (void)speechCapturingDidStartRecordingSuccessfully:(BOOL)a3 error:(id)a4 withInfo:(id)a5;
- (void)speechCapturingDidStopRecordingWithError:(id)a3 endpointMode:(int64_t)a4 totalPacketCount:(int64_t)a5 endpointerMetrics:(id)a6;
- (void)speechCapturingDidUpdateRecordingInfo:(id)a3;
- (void)speechCapturingWillStopRecording;
- (void)speechCapturingWillStopRecordingWithSignpostID:(unint64_t)a3;
- (void)startAcousticIDCaptureWithOptions:(id)a3 sessionUUID:(id)a4;
- (void)startRecordedDictationCaptureWithSessionUUID:(id)a3 narrowband:(BOOL)a4 secureOfflineOnly:(BOOL)a5;
- (void)startSpeechCaptureWithURL:(id)a3 isNarrowBand:(BOOL)a4 isDictation:(BOOL)a5 sessionUUID:(id)a6;
- (void)stopFingerprintingForSuccess:(BOOL)a3;
- (void)stopSpeechCaptureIfFingerprintingOnlyWithOptions:(id)a3;
- (void)stopSpeechCaptureWithOptions:(id)a3;
- (void)suppressAudioInterruptionEndedNotificationsAndEndSessionIfIdle:(id)a3;
- (void)suspendAutomaticEndpointingInRange:(AFTimeRange)a3;
- (void)updateASRFeatures:(id)a3;
- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5;
- (void)updateOptionsAfterRecognitionForElapsedTime:(double)a3 isFinal:(BOOL)a4;
- (void)updateSpeechOptions:(id)a3;
- (void)updateSpeechSynthesisRecord:(id)a3;
@end

@implementation ADSpeechManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSessionCoordinator, 0);
  objc_storeStrong((id *)&self->_audioPowerUpdater, 0);
  objc_storeStrong((id *)&self->_inlineItemList, 0);
  objc_storeStrong((id *)&self->_dictationOptions, 0);
  objc_storeStrong((id *)&self->_dictationLanguages, 0);
  objc_storeStrong((id *)&self->_primaryDictationLanguage, 0);
  objc_storeStrong((id *)&self->_initialDictationLanguage, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_recordRoute, 0);
  objc_storeStrong((id *)&self->_audioDeviceInfo, 0);
  objc_storeStrong(&self->_context, 0);
  objc_storeStrong((id *)&self->_audioPlaybackService, 0);
  objc_storeStrong((id *)&self->_volumeService, 0);
  objc_storeStrong((id *)&self->_speechCompressor, 0);
  objc_storeStrong((id *)&self->_playbackSimulator, 0);
  objc_storeStrong((id *)&self->_speechRecorder, 0);
  objc_storeStrong((id *)&self->_currentCapturing, 0);
  objc_storeStrong((id *)&self->_audioSessionController, 0);
  objc_storeStrong((id *)&self->_speechController, 0);
  objc_storeStrong((id *)&self->_speechLog, 0);
  objc_storeStrong(&self->_recordStoppedCompletion, 0);
  objc_storeStrong(&self->_recordStartedCompletion, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recordingError, 0);
  objc_storeStrong((id *)&self->_capturingContext, 0);
  objc_storeStrong((id *)&self->_clientConfiguration, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localSpeechRecognizerTask, 0);
  objc_storeStrong((id *)&self->_interactiveLocalSpeechRecognizer, 0);
}

- (CSSiriAudioPlaybackService)audioPlaybackService
{
  return self->_audioPlaybackService;
}

- (CSAudioSessionController)audioSessionController
{
  return self->_audioSessionController;
}

- (ADAudioSessionCoordinator)audioSessionCoordinator
{
  return self->_audioSessionCoordinator;
}

- (AFAudioPowerUpdater)audioPowerUpdater
{
  return self->_audioPowerUpdater;
}

- (void)setInlineItemList:(id)a3
{
}

- (NSArray)inlineItemList
{
  return self->_inlineItemList;
}

- (void)setIsDriving:(BOOL)a3
{
  self->_isDriving = a3;
}

- (BOOL)isDriving
{
  return self->_isDriving;
}

- (void)setContext:(id)a3
{
}

- (id)context
{
  return self->_context;
}

- (void)setDictationOptions:(id)a3
{
}

- (AFDictationOptions)dictationOptions
{
  return self->_dictationOptions;
}

- (void)setDictationLanguages:(id)a3
{
}

- (NSArray)dictationLanguages
{
  return self->_dictationLanguages;
}

- (void)setPrimaryDictationLanguage:(id)a3
{
}

- (NSString)primaryDictationLanguage
{
  return self->_primaryDictationLanguage;
}

- (void)setInitialDictationLanguage:(id)a3
{
}

- (NSString)initialDictationLanguage
{
  return self->_initialDictationLanguage;
}

- (void)asrBridgeReceivedPartialResult:(id)a3 language:(id)a4 tokens:(id)a5
{
  id v6 = a5;
  if (+[AFFeatureFlags isSiriRequestDispatcherEnabled])
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1003291C8;
    v8[3] = &unk_10050E160;
    v8[4] = self;
    id v9 = v6;
    dispatch_async(queue, v8);
  }
}

- (void)asrBridgeReceivedFinalResult:(id)a3 speechPackage:(id)a4 sessionUUID:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (+[AFFeatureFlags isSiriRequestDispatcherEnabled])
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003293D8;
    block[3] = &unk_10050DCB8;
    block[4] = self;
    id v11 = v7;
    id v12 = v8;
    dispatch_async(queue, block);
  }
}

- (void)asrBridgeReceivedEagerRecognitionCandidate:(id)a3 rawRecognitionResult:(id)a4 duration:(double)a5 sessionUUID:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  if (+[AFFeatureFlags isSiriRequestDispatcherEnabled])
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003295BC;
    block[3] = &unk_10050DCB8;
    block[4] = self;
    id v12 = v8;
    id v13 = v9;
    dispatch_async(queue, block);
  }
}

- (AFAudioSessionAssertionAcquisitionService)audioSessionAssertionAcquisitionService
{
  return (AFAudioSessionAssertionAcquisitionService *)self->_audioSessionCoordinator;
}

- (void)_getAdjustedSiriOutputVolumeLevelForAudioRoute:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ADSpeechManager *)self _volumeService];
  id v9 = [v6 routeName];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003297D4;
  v12[3] = &unk_10050C950;
  id v13 = v6;
  id v14 = v7;
  v12[4] = self;
  id v10 = v6;
  id v11 = v7;
  [v8 getSiriOutputVolumeForAudioRoute:v10 withName:v9 completion:v12];
}

- (void)adjustSiriOutputVolumeForRouteIfNeeded:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032A0B4;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_updateSiriOutputVolume:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    BOOL hasUpdatedSiriOutputVolume = self->_hasUpdatedSiriOutputVolume;
    *(_DWORD *)buf = 136315650;
    v15 = "-[ADSpeechManager _updateSiriOutputVolume:completion:]";
    __int16 v16 = 1024;
    BOOL v17 = hasUpdatedSiriOutputVolume;
    __int16 v18 = 1024;
    BOOL v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s BOOL hasUpdatedSiriOutputVolume = %d, forceUpdate = %d", buf, 0x18u);
  }
  if (self->_hasUpdatedSiriOutputVolume && !v4)
  {
    BOOL v11 = 0;
    if (!v6) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  id v10 = [(ADSpeechManager *)self _volumeService];
  BOOL v11 = v10 != 0;
  if (v10)
  {
    self->_BOOL hasUpdatedSiriOutputVolume = 1;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10032A610;
    v12[3] = &unk_10050C890;
    v12[4] = self;
    id v13 = v6;
    [v10 updateSiriOutputVolume:v4 completion:v12];
  }
  if (v6)
  {
LABEL_12:
    if (!v11) {
      v6[2](v6);
    }
  }
LABEL_14:
}

- (void)_fetchSmartSiriVolumeForType:(unint64_t)a3 forceFetch:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    BOOL hasFetchedSmartSiriVolume = self->_hasFetchedSmartSiriVolume;
    int v15 = 136315906;
    __int16 v16 = "-[ADSpeechManager _fetchSmartSiriVolumeForType:forceFetch:]";
    __int16 v17 = 1024;
    BOOL v18 = hasFetchedSmartSiriVolume;
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    __int16 v21 = 1024;
    BOOL v22 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s BOOL hasFetchedSmartSiriVolume = %d, forType = %lu, forceFetch = %d", (uint8_t *)&v15, 0x22u);
  }
  if (!self->_hasFetchedSmartSiriVolume || v4)
  {
    id v10 = [(ADSpeechManager *)self _volumeService];
    BOOL v11 = v10;
    if (v10)
    {
      *(_WORD *)&self->_BOOL hasFetchedSmartSiriVolume = 1;
      [v10 fetchSmartSiriVolumeForType:a3];
      id v12 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        BOOL v13 = self->_hasFetchedSmartSiriVolume;
        BOOL hasUpdatedSiriOutputVolume = self->_hasUpdatedSiriOutputVolume;
        int v15 = 136315650;
        __int16 v16 = "-[ADSpeechManager _fetchSmartSiriVolumeForType:forceFetch:]";
        __int16 v17 = 1024;
        BOOL v18 = v13;
        __int16 v19 = 1024;
        LODWORD(v20) = hasUpdatedSiriOutputVolume;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s hasFetchedSmartSiriVolume = %d, BOOL hasUpdatedSiriOutputVolume = %d", (uint8_t *)&v15, 0x18u);
      }
    }
  }
}

- (void)_fetchSmartSiriVolume:(BOOL)a3
{
}

- (id)_volumeService
{
  if ([(ADSpeechManager *)self _supportsVolumeService])
  {
    volumeService = self->_volumeService;
    if (!volumeService)
    {
      BOOL v4 = [[ADVolumeService alloc] initWithQueue:self->_queue instanceContext:self->_instanceContext speechController:self->_speechController];
      v5 = self->_volumeService;
      self->_volumeService = v4;

      [(ADVolumeService *)self->_volumeService setClientConfiguration:self->_clientConfiguration];
      *(_WORD *)&self->_BOOL hasFetchedSmartSiriVolume = 0;
      self->_dirtySiriOutputVolumeHostTime = 0;
      id v6 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        int v9 = 136315650;
        id v10 = "-[ADSpeechManager _volumeService]";
        __int16 v11 = 1024;
        int v12 = 0;
        __int16 v13 = 1024;
        int v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s hasFetchedSmartSiriVolume = %d, BOOL hasUpdatedSiriOutputVolume = %d", (uint8_t *)&v9, 0x18u);
      }
      volumeService = self->_volumeService;
    }
    id v7 = volumeService;
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (BOOL)_supportsVolumeService
{
  if (sub_1003545D0((uint64_t)self->_instanceContext)) {
    return 1;
  }
  return _AFDeviceSupportsTTS();
}

- (void)setEARLanguageDetectorSpeechRequestId:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032AA88;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_addRecordStoppedCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id recordStoppedCompletion = self->_recordStoppedCompletion;
    if (recordStoppedCompletion)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10032ABD8;
      v11[3] = &unk_10050C868;
      id v12 = objc_retainBlock(recordStoppedCompletion);
      id v13 = v4;
      id v6 = v12;
      id v7 = objc_retainBlock(v11);
      id v8 = self->_recordStoppedCompletion;
      self->_id recordStoppedCompletion = v7;
    }
    else
    {
      id v9 = objc_retainBlock(v4);
      id v10 = self->_recordStoppedCompletion;
      self->_id recordStoppedCompletion = v9;
    }
  }
}

- (void)setEndpointerDelayedTrigger:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10032AC9C;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)setEndpointerThreshold:(double)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10032AD68;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)updateSpeechSynthesisRecord:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032AE54;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getLastStartpointTimestampAndCurrentTime:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032AF4C;
  v7[3] = &unk_10050E188;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)stopFingerprintingForSuccess:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10032B018;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)updateSpeechOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[AFAnalytics sharedAnalytics];
  [v5 logEventWithType:303 context:0];

  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10032B148;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)playRecordingStartAlert
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032B1C8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)setSpeechRecognizedContext:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032B2A4;
  v7[3] = &unk_10050E160;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)enforcePreviousEndpointHint
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032B3E0;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10032B4F0;
  v13[3] = &unk_10050C840;
  v13[4] = self;
  id v14 = v8;
  BOOL v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)updateOptionsAfterRecognitionForElapsedTime:(double)a3 isFinal:(BOOL)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032B5C4;
  block[3] = &unk_10050C818;
  block[4] = self;
  *(double *)&void block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(queue, block);
}

- (void)updateASRFeatures:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032B674;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)suspendAutomaticEndpointingInRange:(AFTimeRange)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032B740;
  block[3] = &unk_10050C7F0;
  block[4] = self;
  AFTimeRange v5 = a3;
  dispatch_async(queue, block);
}

- (void)setFingerprintWasRecognized
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032B808;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)deactivateAudioSessionIfNoActiveAssertions
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032B888;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)suppressAudioInterruptionEndedNotificationsAndEndSessionIfIdle:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032BA44;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)_endSessionIfIdle
{
  int speechState = self->_speechState;
  id v4 = AFSiriLogContextSpeech;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO);
  if (speechState)
  {
    if (v5)
    {
      int v7 = 136315138;
      id v8 = "-[ADSpeechManager _endSessionIfIdle]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s but we're NOT idle", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      int v7 = 136315138;
      id v8 = "-[ADSpeechManager _endSessionIfIdle]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s and we're idle", (uint8_t *)&v7, 0xCu);
    }
    [(ADSpeechManager *)self _releaseSession];
  }
  return speechState == 0;
}

- (void)_cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    unsigned int speechState = self->_speechState;
    int v7 = v5;
    id v8 = sub_10032C0C0(speechState);
    *(_DWORD *)buf = 136315394;
    v30 = "-[ADSpeechManager _cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:]";
    __int16 v31 = 2112;
    v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s state = %@", buf, 0x16u);
  }
  id v9 = objc_alloc((Class)AFSafetyBlock);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10032C16C;
  v27[3] = &unk_10050C7A0;
  id v10 = v4;
  id v28 = v10;
  id v11 = [v9 initWithBlock:v27];
  objc_initWeak(&location, self);
  int v12 = self->_speechState;
  if ((v12 - 3) < 2)
  {
    BOOL v16 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[ADSpeechManager _cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Stopping, waiting for did stop to release session", buf, 0xCu);
    }
    self->_releasesAudioSessionWhenRecordingStopped = 1;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10032C3A4;
    v19[3] = &unk_10050E138;
    id v20 = v11;
    [(ADSpeechManager *)self _addRecordStoppedCompletion:v19];
  }
  else if (v12 == 2)
  {
    __int16 v17 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[ADSpeechManager _cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Recording, stopping record to release session", buf, 0xCu);
    }
    self->_releasesAudioSessionWhenRecordingStopped = 1;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10032C39C;
    v21[3] = &unk_10050E138;
    id v22 = v11;
    [(ADSpeechManager *)self _addRecordStoppedCompletion:v21];
    [(ADSpeechManager *)self _cancelRecordingWithError:0 suppressAlert:1];
  }
  else if (v12 == 1)
  {
    id v13 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[ADSpeechManager _cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s Started, waiting for did start to stop recording then release session", buf, 0xCu);
    }
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10032C238;
    v23[3] = &unk_10050C7C8;
    objc_copyWeak(&v25, &location);
    id v24 = v11;
    id v14 = objc_retainBlock(v23);
    id recordStartedCompletion = self->_recordStartedCompletion;
    self->_id recordStartedCompletion = v14;

    objc_destroyWeak(&v25);
  }
  else
  {
    BOOL v18 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[ADSpeechManager _cancelRecordingIfNeededAndEndSessionWhenIdleWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s Asking AVVoiceController to release its audio session now", buf, 0xCu);
    }
    [(ADSpeechManager *)self _releaseSession];
    [v11 invoke];
  }
  objc_destroyWeak(&location);
}

- (void)endSession:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  int v7 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[ADSpeechManager endSession:completion:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s onlyIfIdle = %d", buf, 0x12u);
  }
  queue = self->_queue;
  if (v4)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10032C5E8;
    v15[3] = &unk_10050E138;
    v15[4] = self;
    id v9 = v15;
    id v10 = queue;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_10032C5F0;
    __int16 v17 = &unk_10050E188;
    dispatch_semaphore_t v18 = v11;
    id v19 = v9;
    int v12 = v11;
    dispatch_async(v10, buf);

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10032C634;
    block[3] = &unk_10050E188;
    block[4] = self;
    id v14 = v6;
    dispatch_async(queue, block);
  }
}

- (void)endSession
{
  v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[ADSpeechManager endSession]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&buf, 0xCu);
  }
  if (AFIsHorseman())
  {
    [(ADSpeechManager *)self endSession:0 completion:0];
  }
  else
  {
    queue = self->_queue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10032C7EC;
    v9[3] = &unk_10050E138;
    v9[4] = self;
    BOOL v5 = v9;
    id v6 = queue;
    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    dispatch_semaphore_t v11 = sub_10032C5F0;
    int v12 = &unk_10050E188;
    dispatch_semaphore_t v13 = v7;
    id v14 = v5;
    id v8 = v7;
    dispatch_async(v6, &buf);

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)setSuppressAudioInterruptionEndedNotifications:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10032CD2C;
  v4[3] = &unk_10050CD50;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

- (void)_stopSpeechCaptureWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activationEvent];
  id v6 = [v4 suppressStopAlert];
  id v7 = [v4 stopRecordingHostTime];
  unsigned int speechState = self->_speechState;
  if (speechState == 1)
  {
    dispatch_semaphore_t v11 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v23 = "-[ADSpeechManager _stopSpeechCaptureWithOptions:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Recording started stopping in record start completion", buf, 0xCu);
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10032CFCC;
    v17[3] = &unk_10050C778;
    dispatch_semaphore_t v18 = self;
    id v19 = v5;
    char v21 = (char)v6;
    id v20 = v7;
    int v12 = v18;
    dispatch_semaphore_t v13 = objc_retainBlock(v17);
    Class isa = v12[11].isa;
    v12[11].Class isa = v13;

    goto LABEL_9;
  }
  if (speechState != 2)
  {
    id v15 = (void *)AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    int v12 = v15;
    BOOL v16 = sub_10032C0C0(speechState);
    *(_DWORD *)long long buf = 136315394;
    v23 = "-[ADSpeechManager _stopSpeechCaptureWithOptions:]";
    __int16 v24 = 2114;
    id v25 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Error: asked to stop when we're in state %{public}@", buf, 0x16u);

LABEL_9:
    goto LABEL_11;
  }
  id v9 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v23 = "-[ADSpeechManager _stopSpeechCaptureWithOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Stopping speech capture", buf, 0xCu);
  }
  id v10 = [(ADSpeechManager *)self _currentSpeechCaptureSource];
  [v10 stopSpeechCaptureForEvent:v5 suppressAlert:v6 hostTime:v7];

  [(ADSpeechManager *)self _updateSpeechState:3];
LABEL_11:
  if (v4) {
    [(ADSpeechManager *)self _updateCapturingStateWithOptions:v4];
  }
}

- (void)stopSpeechCaptureIfFingerprintingOnlyWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[AFAnalytics sharedAnalytics];
  [v5 logEventWithType:305 context:0];

  queue = self->_queue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10032D258;
  v12[3] = &unk_10050E160;
  v12[4] = self;
  id v13 = v4;
  id v7 = v12;
  id v8 = queue;
  id v9 = v4;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032C5F0;
  block[3] = &unk_10050E188;
  dispatch_semaphore_t v15 = v10;
  id v16 = v7;
  dispatch_semaphore_t v11 = v10;
  dispatch_async(v8, block);

  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)stopSpeechCaptureWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = +[AFAnalytics sharedAnalytics];
  id v6 = [v4 stopContext];
  [v5 logEventWithType:305 context:v6];

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10032D3E4;
  v13[3] = &unk_10050E160;
  v13[4] = self;
  id v14 = v4;
  id v8 = v13;
  id v9 = queue;
  id v10 = v4;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032C5F0;
  block[3] = &unk_10050E188;
  dispatch_semaphore_t v16 = v11;
  id v17 = v8;
  int v12 = v11;
  dispatch_async(v9, block);

  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3
{
  id v5 = +[AFAnalytics sharedAnalytics];
  [v5 logEventWithType:304 context:0];

  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10032D530;
  v11[3] = &unk_10050CD50;
  void v11[4] = self;
  BOOL v12 = a3;
  id v7 = v11;
  id v8 = queue;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032C5F0;
  block[3] = &unk_10050E188;
  dispatch_semaphore_t v14 = v9;
  id v15 = v7;
  id v10 = v9;
  dispatch_async(v8, block);

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)startSpeechCaptureWithURL:(id)a3 isNarrowBand:(BOOL)a4 isDictation:(BOOL)a5 sessionUUID:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [objc_alloc((Class)CSSiriSpeechRecordingContext) initWithSessionUUID:v11 turnIdentifier:0];

  queue = self->_queue;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10032D9D4;
  v16[3] = &unk_10050C750;
  v16[4] = self;
  id v17 = v12;
  BOOL v19 = a5;
  id v18 = v10;
  BOOL v20 = a4;
  id v14 = v10;
  id v15 = v12;
  dispatch_async(queue, v16);
}

- (void)addRecordedDictationAudioSampleData:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032DDFC;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startRecordedDictationCaptureWithSessionUUID:(id)a3 narrowband:(BOOL)a4 secureOfflineOnly:(BOOL)a5
{
  id v8 = a3;
  id v9 = [objc_alloc((Class)CSSiriSpeechRecordingContext) initWithSessionUUID:v8 turnIdentifier:0];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032DF30;
  block[3] = &unk_10050C728;
  void block[4] = self;
  id v13 = v9;
  BOOL v14 = a5;
  BOOL v15 = a4;
  id v11 = v9;
  dispatch_async(queue, block);
}

- (void)_startCaptureForMode:(int64_t)a3 options:(id)a4 context:(id)a5
{
  id v8 = (NSString *)a4;
  id v9 = a5;
  id v10 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    v65 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
    __int16 v66 = 2048;
    *(void *)v67 = a3;
    *(_WORD *)&v67[8] = 2112;
    v68 = v8;
    __int16 v69 = 2112;
    id v70 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s mode = %zd, options = %@, context = %@", buf, 0x2Au);
  }
  unsigned int speechState = self->_speechState;
  if (speechState)
  {
    id v12 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      v47 = v12;
      v48 = sub_10032C0C0(speechState);
      *(_DWORD *)long long buf = 136315394;
      v65 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
      __int16 v66 = 2114;
      *(void *)v67 = v48;
      _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s Asked to start recording when we're already in state %{public}@", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    BOOL v14 = +[ADSpeechManager _badStateError];
    [WeakRetained speechManager:self didFailWithError:v14 context:v9];
    goto LABEL_42;
  }
  self->_shouldTalkToDelegate = 1;
  self->_hasReceivedLastAudioBuffer = 0;
  self->_capturingMode = a3;
  objc_storeStrong((id *)&self->_capturingContext, a5);
  [(ADSpeechManager *)self _updateAudioDeviceInfo:0];
  [(ADSpeechManager *)self _updateRecordRoute:0 andDeviceIdentifier:0];
  *(_WORD *)&self->_isReleaseAudioSessionRequired = 1;
  self->_releasesAudioSessionWhenRecordingStopped = 0;
  self->_releasesAudioSessionWhenPrepareAudioSystemDone = 0;
  BOOL v15 = [(ADSpeechManager *)self _speechRecorder];
  objc_storeStrong((id *)&self->_currentCapturing, v15);
  dispatch_semaphore_t v16 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    currentCapturing = self->_currentCapturing;
    *(_DWORD *)long long buf = 136315394;
    v65 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
    __int16 v66 = 2112;
    *(void *)v67 = currentCapturing;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s Speech capturing set to %@.", buf, 0x16u);
  }
  [v15 prepareForMode:a3 withOptions:v8];
  unint64_t v18 = (unint64_t)[(NSString *)v8 activationEvent];
  if (AFSpeechEventIsBluetooth())
  {
    BOOL v19 = +[ADBluetoothManager sharedInstance];
    BOOL v20 = [(NSString *)v8 activationDeviceIdentifier];
    [v19 prewarmDeviceWithIdentifier:v20];
  }
  if ([(NSString *)v8 isMediaPlaying])
  {
    char v21 = [(ADSpeechManager *)self _volumeService];
    [v21 _mediaPlaybackVolume];
    float v23 = v22;

    __int16 v24 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      v65 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
      __int16 v66 = 2048;
      *(double *)v67 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%s mediaPlaybackVolume = %f", buf, 0x16u);
    }
    *(float *)&double v25 = v23;
    [(NSString *)v8 setMediaPlaybackVolume:v25];
  }
  int IsTVRemote = AFSpeechEventIsTVRemote();
  char v27 = IsTVRemote;
  if (IsTVRemote) {
    [(ADSpeechManager *)self _updateCapturingStateWithOptions:v8];
  }
  if ((unint64_t)(a3 - 1) > 1 || (AFIsNano() & 1) != 0 || v18 <= 0x10 && ((1 << v18) & 0x18900) != 0)
  {
    if (v27) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  v49 = [v15 recordingInfoForPreheatWithEvent:v18];
  [(ADSpeechManager *)self _tellDelegateSpeechShouldPreheatWithRecordingInfo:v49];

  if ((v27 & 1) == 0) {
LABEL_22:
  }
    [(ADSpeechManager *)self _updateCapturingStateWithOptions:v8];
LABEL_23:
  char v28 = AFIsATVOnly();
  if (a3 == 3)
  {
    unsigned int v29 = [(AFDictationOptions *)self->_dictationOptions forceOfflineRecognition];
    v30 = (id *)&CoreEmbeddedSpeechRecognizerTaskDictation;
    if (!v29) {
      v30 = (id *)&CoreEmbeddedSpeechRecognizerTaskTshot;
    }
    goto LABEL_26;
  }
  if (v28)
  {
    localSpeechRecognizerTask = self->_localSpeechRecognizerTask;
    self->_localSpeechRecognizerTask = 0;

    v39 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      primaryDictationLanguage = self->_primaryDictationLanguage;
      v41 = v39;
      v42 = +[NSNumber numberWithBool:AFOfflineDictationCapable()];
      *(_DWORD *)long long buf = 136315906;
      v65 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
      __int16 v66 = 2048;
      *(void *)v67 = a3;
      *(_WORD *)&v67[8] = 2112;
      v68 = primaryDictationLanguage;
      __int16 v69 = 2112;
      id v70 = v42;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s Not using local speech recognition for mode %ld, dictation language %@, dictationCapable %@", buf, 0x2Au);
    }
    goto LABEL_27;
  }
  if (a3 == 2 && AFOfflineDictationCapable())
  {
    v30 = (id *)&CoreEmbeddedSpeechRecognizerTaskDictation;
LABEL_26:
    objc_storeStrong((id *)&self->_localSpeechRecognizerTask, *v30);
    goto LABEL_27;
  }
  if (!CSSiriSpeechRecordingModeIsSiri() || !AFOfflineDictationCapable()) {
    goto LABEL_27;
  }
  if (a3 == 5)
  {
    int v43 = AFIsNano();
    v44 = (id *)&CoreEmbeddedSpeechRecognizerTaskDictation;
    if (!v43) {
      v44 = (id *)&CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging;
    }
    objc_storeStrong((id *)&self->_localSpeechRecognizerTask, *v44);
    [(ADSpeechManager *)self _tellDelegateSpeechRecognitionUpdateWillBegin];
    v45 = AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    *(_DWORD *)long long buf = 136315138;
    v65 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
    v46 = "%s Local speech recognition forced on for Siri";
  }
  else if ((_AFPreferencesSiriPersonalizedASRDisabled() & 1) != 0 {
         || [(NSString *)v8 skipPersonalizedASR])
  }
  {
    v50 = self->_localSpeechRecognizerTask;
    self->_localSpeechRecognizerTask = 0;

    v45 = AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    *(_DWORD *)long long buf = 136315138;
    v65 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
    v46 = "%s Not using local speech recognition for Siri because the kill switch is on, or options were set";
  }
  else
  {
    int v51 = AFIsNano();
    v52 = (id *)&CoreEmbeddedSpeechRecognizerTaskDictation;
    if (!v51) {
      v52 = (id *)&CoreEmbeddedSpeechRecognizerTaskSearchOrMessaging;
    }
    objc_storeStrong((id *)&self->_localSpeechRecognizerTask, *v52);
    [(ADSpeechManager *)self _tellDelegateSpeechRecognitionUpdateWillBegin];
    v45 = AFSiriLogContextSpeech;
    if (!os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO)) {
      goto LABEL_27;
    }
    *(_DWORD *)long long buf = 136315138;
    v65 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
    v46 = "%s Doing local speech recognition for Siri";
  }
  _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, v46, buf, 0xCu);
LABEL_27:
  unsigned int v31 = [(NSString *)v8 acousticIdEnabled];
  if (a3 == 4) {
    uint64_t v32 = 1;
  }
  else {
    uint64_t v32 = v31;
  }
  [v15 setFingerprintingEnabled:v32];
  objc_msgSend(v15, "setAudioFileType:", -[NSString audioFileType](v8, "audioFileType"));
  v33 = [(NSString *)v8 audioFileHandle];
  [v15 setAudioFileHandle:v33];

  [v15 setIsDriving:self->_isDriving];
  objc_msgSend(v15, "disableSpeechPacketGeneration:", -[NSString skipGeneratingSpeechPacket](v8, "skipGeneratingSpeechPacket"));
  v34 = [(NSString *)v8 speechRecordingEventListeningEndpoint];
  [v15 setSpeechRecordingEventListeningEndpoint:v34];

  objc_msgSend(v15, "setHybridUODEnabled:", -[NSString isHybridUODEnabled](v8, "isHybridUODEnabled"));
  [(ADSpeechManager *)self _updateSpeechState:1];
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_10032EAC4;
  v58[3] = &unk_10050D7A0;
  id WeakRetained = v15;
  id v59 = WeakRetained;
  id v60 = v9;
  v61 = self;
  v35 = v8;
  v62 = v35;
  int64_t v63 = a3;
  v36 = objc_retainBlock(v58);
  if (!sub_1003545D0((uint64_t)self->_instanceContext)) {
    goto LABEL_36;
  }
  if (([(NSString *)v35 reloadSmartSiriVolume] & 1) != 0
    || self->_dirtySiriOutputVolumeHostTime)
  {
    *(_WORD *)&self->_BOOL hasFetchedSmartSiriVolume = 0;
    self->_dirtySiriOutputVolumeHostTime = 0;
    v37 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      v65 = "-[ADSpeechManager _startCaptureForMode:options:context:]";
      __int16 v66 = 1024;
      *(_DWORD *)v67 = 0;
      *(_WORD *)&v67[4] = 1024;
      *(_DWORD *)&v67[6] = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s hasFetchedSmartSiriVolume = %d, BOOL hasUpdatedSiriOutputVolume = %d", buf, 0x18u);
    }
  }
  if (!AFIsHorseman())
  {
    v53 = _NSConcreteStackBlock;
    uint64_t v54 = 3221225472;
    v55 = sub_10032EFB4;
    v56 = &unk_10050D0D0;
    v57 = v36;
    [(ADSpeechManager *)self _updateSiriOutputVolume:0 completion:&v53];
  }
  else
  {
LABEL_36:
    ((void (*)(void *))v36[2])(v36);
  }
  objc_msgSend(WeakRetained, "suppressUtteranceGradingIfRequired", v53, v54, v55, v56);

  BOOL v14 = v59;
LABEL_42:
}

- (id)_startFixedPriorityCaptureForMode:(int64_t)a3 options:(id)a4 sessionUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = +[AFAnalytics sharedAnalytics];
  id v11 = [v8 startContext];
  [v10 logEventWithType:301 context:v11];

  id v12 = objc_alloc((Class)CSSiriSpeechRecordingContext);
  id v13 = [v8 turnIdentifier];
  id v14 = [v12 initWithSessionUUID:v9 turnIdentifier:v13];

  queue = self->_queue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10032F1AC;
  v21[3] = &unk_10050DD08;
  int64_t v24 = a3;
  void v21[4] = self;
  id v22 = v8;
  id v16 = v14;
  id v23 = v16;
  id v17 = v8;
  dispatch_async(queue, v21);
  unint64_t v18 = v23;
  id v19 = v16;

  return v19;
}

- (void)startAcousticIDCaptureWithOptions:(id)a3 sessionUUID:(id)a4
{
  id v4 = [(ADSpeechManager *)self _startFixedPriorityCaptureForMode:4 options:a3 sessionUUID:a4];
}

- (id)startSpeechCaptureForDictationWithOptions:(id)a3 sessionUUID:(id)a4 secureOfflineOnly:(BOOL)a5
{
  BOOL v5 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10032F3B0;
  block[3] = &unk_10050E138;
  void block[4] = self;
  id v9 = a4;
  id v10 = a3;
  dispatch_async(queue, block);
  id v11 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v17 = "-[ADSpeechManager startSpeechCaptureForDictationWithOptions:sessionUUID:secureOfflineOnly:]";
    __int16 v18 = 1024;
    BOOL v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s secureOfflineOnly is %d", buf, 0x12u);
  }
  if (v5) {
    uint64_t v12 = 3;
  }
  else {
    uint64_t v12 = 2;
  }
  id v13 = [(ADSpeechManager *)self _startFixedPriorityCaptureForMode:v12 options:v10 sessionUUID:v9];

  return v13;
}

- (id)startSpeechCaptureForRequestWithOptions:(id)a3 sessionUUID:(id)a4 language:(id)a5
{
  id v8 = a5;
  queue = self->_queue;
  BOOL v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  id v17 = sub_10032F4F0;
  __int16 v18 = &unk_10050E160;
  BOOL v19 = self;
  id v20 = v8;
  id v10 = v8;
  id v11 = a4;
  id v12 = a3;
  dispatch_async(queue, &v15);
  id v13 = -[ADSpeechManager _startFixedPriorityCaptureForMode:options:sessionUUID:](self, "_startFixedPriorityCaptureForMode:options:sessionUUID:", 1, v12, v11, v15, v16, v17, v18, v19);

  return v13;
}

- (BOOL)isStopped
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10032F634;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCapturing
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10032F6FC;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setClientConfiguration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032F7B4;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10032F8A8;
  v7[3] = &unk_10050E160;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_prepareAudioSystemWithContext:(id)a3 audioSessionAssertion:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v49 = a5;
  id v10 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    unsigned int speechState = self->_speechState;
    id v12 = v10;
    id v13 = sub_10032C0C0(speechState);
    *(_DWORD *)long long buf = 136315650;
    v86 = "-[ADSpeechManager _prepareAudioSystemWithContext:audioSessionAssertion:completion:]";
    __int16 v87 = 2112;
    unint64_t v88 = (unint64_t)v8;
    __int16 v89 = 2112;
    v90 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%s Begin preparing audio system with context %@. (unsigned int speechState = %@)", buf, 0x20u);
  }
  self->_isReleaseAudioSessionRequired = 1;
  id v14 = [v8 speechRequestOptions];
  BOOL v15 = AFAnalyticsContextCreateWithSpeechRequestOptions();
  v84[0] = v15;
  v82[0] = @"reason";
  [v8 reason];
  uint64_t v16 = AFSetAudioSessionActiveReasonGetName();
  v82[1] = @"options";
  v83[0] = v16;
  [v8 options];
  id v17 = AFSetAudioSessionActiveOptionsGetNames();
  v83[1] = v17;
  __int16 v18 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:2];
  v84[1] = v18;
  BOOL v19 = +[NSArray arrayWithObjects:v84 count:2];
  id v20 = AFAnalyticsContextsMerge();

  char v21 = +[AFAnalytics sharedAnalytics];
  [v21 logEventWithType:244 context:v20 contextNoCopy:1];

  ++self->_prepareAudioSystemTransactionCount;
  id v22 = [(ADSpeechManager *)self _speechRecorder];
  id v23 = objc_alloc((Class)AFOneArgumentSafetyBlock);
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100330064;
  v76[3] = &unk_10050C570;
  v76[4] = self;
  id v24 = v22;
  id v77 = v24;
  id v25 = v8;
  id v78 = v25;
  id v52 = v9;
  id v79 = v52;
  id v51 = v20;
  id v80 = v51;
  id v50 = v49;
  id v81 = v50;
  v26 = +[AFError errorWithCode:27];
  id v27 = [v23 initWithBlock:v76 defaultValue:v26];

  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_100330670;
  v75[3] = &unk_10050C5C0;
  v75[4] = self;
  char v28 = objc_retainBlock(v75);
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472;
  v73[2] = sub_100330850;
  v73[3] = &unk_10050C638;
  v73[4] = self;
  id v29 = v24;
  id v74 = v29;
  v30 = objc_retainBlock(v73);
  v69[0] = _NSConcreteStackBlock;
  v69[1] = 3221225472;
  v69[2] = sub_100330A64;
  v69[3] = &unk_10050C660;
  id v31 = v25;
  id v70 = v31;
  v71 = self;
  id v32 = v29;
  id v72 = v32;
  v33 = objc_retainBlock(v69);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_100330DDC;
  v61[3] = &unk_10050C6B0;
  id v34 = v31;
  id v62 = v34;
  id v35 = v32;
  id v63 = v35;
  v64 = self;
  v36 = v28;
  id v66 = v36;
  v37 = v30;
  id v67 = v37;
  v38 = v33;
  id v68 = v38;
  id v39 = v27;
  id v65 = v39;
  v40 = objc_retainBlock(v61);
  if (sub_1003545D0((uint64_t)self->_instanceContext))
  {
    v41 = [v34 speechRequestOptions];
    id v42 = [v41 smartSiriVolumeTTSType];

    if (v42 == (id)5)
    {
      int v43 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        v86 = "-[ADSpeechManager _prepareAudioSystemWithContext:audioSessionAssertion:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "%s Received TTSTypeDropInCallAnnouncement, force fetching SSV.", buf, 0xCu);
      }
      [(ADSpeechManager *)self _fetchSmartSiriVolumeForType:5 forceFetch:1];
      v59[0] = _NSConcreteStackBlock;
      v59[1] = 3221225472;
      v59[2] = sub_100330FBC;
      v59[3] = &unk_10050D0D0;
      id v60 = v40;
      [(ADSpeechManager *)self _updateSiriOutputVolume:1 completion:v59];
      v44 = v60;
    }
    else
    {
      unint64_t dirtySiriOutputVolumeHostTime = self->_dirtySiriOutputVolumeHostTime;
      if (dirtySiriOutputVolumeHostTime)
      {
        v46 = AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          v86 = "-[ADSpeechManager _prepareAudioSystemWithContext:audioSessionAssertion:completion:]";
          __int16 v87 = 2048;
          unint64_t v88 = dirtySiriOutputVolumeHostTime;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "%s Begin waiting for Siri output volume to update after host time %llu...", buf, 0x16u);
        }
        uint64_t v48 = mach_absolute_time();
        v47 = [(ADSpeechManager *)self _volumeService];
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_100330FCC;
        v55[3] = &unk_10050C6D8;
        v55[4] = self;
        unint64_t v57 = dirtySiriOutputVolumeHostTime;
        uint64_t v58 = v48;
        v56 = v40;
        [v47 waitUntilSiriOutputVolumeUpdatesAfterTimestamp:dirtySiriOutputVolumeHostTime withTimeout:v55 block:1.0];

        v44 = v56;
      }
      else
      {
        [(ADSpeechManager *)self _fetchSmartSiriVolume:0];
        v53[0] = _NSConcreteStackBlock;
        v53[1] = 3221225472;
        v53[2] = sub_100331170;
        v53[3] = &unk_10050D0D0;
        uint64_t v54 = v40;
        [(ADSpeechManager *)self _updateSiriOutputVolume:0 completion:v53];
        v44 = v54;
      }
    }
  }
  else
  {
    ((void (*)(void *))v40[2])(v40);
  }
}

- (void)prepareAudioSystemWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  audioSessionCoordinator = self->_audioSessionCoordinator;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100331800;
  v20[3] = &unk_10050C4E0;
  id v9 = v6;
  id v21 = v9;
  id v10 = +[AFAssertionContext newWithBuilder:v20];
  id v11 = [(ADAudioSessionCoordinator *)audioSessionCoordinator acquireAudioSessionAssertionWithContext:v10 relinquishmentHandler:0];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100331944;
  block[3] = &unk_10050E228;
  void block[4] = self;
  id v17 = v9;
  id v18 = v11;
  id v19 = v7;
  id v13 = v7;
  id v14 = v11;
  id v15 = v9;
  dispatch_async(queue, block);
}

- (void)preheatRecognizerWithOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v11 = "-[ADSpeechManager preheatRecognizerWithOptions:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s options = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100331A88;
  v8[3] = &unk_10050E160;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)preheatWithOptions:(id)a3
{
  id v4 = a3;
  BOOL v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v12 = "-[ADSpeechManager preheatWithOptions:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s options = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100331C14;
  v8[3] = &unk_10050E160;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

- (void)eagerlyInitializeAudioRecording
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100331D24;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)localSpeechRecognizer:(id)a3 didCompletionRecognitionWithStatistics:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100331E20;
  v15[3] = &unk_10050DC68;
  id v16 = v8;
  id v17 = self;
  id v18 = v10;
  id v19 = v9;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)localSpeechRecognizer:(id)a3 didProduceLoggablePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003320E8;
  block[3] = &unk_10050DCB8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizePackage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100332350;
  block[3] = &unk_10050DCB8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeRawEagerRecognitionCandidate:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10033258C;
  v8[3] = &unk_10050E160;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

- (void)localSpeechRecognizer:(id)a3 didProcessAudioDuration:(double)a4
{
  id v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[ADSpeechManager localSpeechRecognizer:didProcessAudioDuration:]";
    __int16 v8 = 2048;
    double v9 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s Processed %.2f", (uint8_t *)&v6, 0x16u);
  }
}

- (void)localSpeechRecognizer:(id)a3 didRecognizeTokens:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100332854;
  block[3] = &unk_10050DCB8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5
{
  if (self->_audioPowerUpdater == a3) {
    -[ADSpeechManager _tellDelegateAboutInputAveragePower:peak:](self, "_tellDelegateAboutInputAveragePower:peak:");
  }
}

- (id)_recordingInfo
{
  v2 = [(ADSpeechManager *)self _speechRecorder];
  char v3 = [v2 fetchRecordingInfo];

  return v3;
}

- (id)getRecordingInfo
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_100332B58;
  id v10 = sub_100332B68;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100332B70;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)getRecordingInfoUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100332C60;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)getVolumeServiceUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100332D60;
    v7[3] = &unk_10050E188;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
}

- (void)setDirtySiriOutputVolumeHostTime:(unint64_t)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100332E30;
  v4[3] = &unk_10050D8C0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)audioSessionCoordinator:(id)a3 releaseAudioSessionWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v14 = "-[ADSpeechManager audioSessionCoordinator:releaseAudioSessionWithContext:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s audioSessionCoordinator = %@, context = %@", buf, 0x20u);
  }
  if (AFSupportsAudioSessionCoordination())
  {
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100333054;
    v10[3] = &unk_10050E160;
    id v11 = v6;
    id v12 = self;
    dispatch_async(queue, v10);
  }
}

- (void)audioSessionCoordinator:(id)a3 prepareAudioSessionWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v14 = "-[ADSpeechManager audioSessionCoordinator:prepareAudioSessionWithContext:]";
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s audioSessionCoordinator = %@, context = %@", buf, 0x20u);
  }
  if (AFSupportsAudioSessionCoordination())
  {
    queue = self->_queue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100333368;
    v10[3] = &unk_10050E160;
    id v11 = v6;
    id v12 = self;
    dispatch_async(queue, v10);
  }
}

- (void)speechCapturingDidProvideConfidenceScores:(id)a3 classification:(unint64_t)a4 classifiedUser:(id)a5 unknownUserScore:(int64_t)a6 duration:(int64_t)a7 version:(int64_t)a8 thresholdingType:(id)a9 assetVersion:(id)a10
{
  p_delegate = &self->_delegate;
  id v18 = a10;
  id v19 = a9;
  id v20 = a5;
  id v21 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained speechManager:self didReceiveConfidenceScores:v21 classification:a4 classifiedUser:v20 unknownUserScore:a6 duration:a7 version:a8 thresholdingType:v19 assetVersion:v18];
}

- (void)speechCapturing:(id)a3 languageDetectorDidFail:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained speechManager:self languageDetectorDidFail:v6];
}

- (void)speechCapturing:(id)a3 didDetectLanguage:(id)a4 confidenceScores:(id)a5 isConfident:(BOOL)a6
{
}

- (void)speechCapturing:(id)a3 didLoseAudioSessionOwnerOrMediaServices:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADSpeechManager speechCapturing:didLoseAudioSessionOwnerOrMediaServices:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", (uint8_t *)&v7, 0x16u);
  }
  self->_isAudioSessionLikelyActive = 0;
  self->_hasPreparedAudioSystemForPlayback = 0;
}

- (void)speechCapturing:(id)a3 didInterruptAudioSession:(id)a4
{
  id v5 = a4;
  id v6 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADSpeechManager speechCapturing:didInterruptAudioSession:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", (uint8_t *)&v7, 0x16u);
  }
  self->_isAudioSessionLikelyActive = 0;
  self->_hasPreparedAudioSystemForPlayback = 0;
}

- (void)speechCapturing:(id)a3 didSetAudioSessionActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[ADSpeechManager speechCapturing:didSetAudioSessionActive:]";
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s flag = %d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = 210;
  if (!v4) {
    uint64_t v8 = 211;
  }
  *((unsigned char *)&self->super.isa + v8) = v4;
  self->_isAudioSessionLikelyActive = v4;
  [(ADSpeechManager *)self _tellDelegateDidSetAudioSessionActive:v4];
  [(ADAudioSessionCoordinator *)self->_audioSessionCoordinator handleDidSetAudioSessionActive:v4];
}

- (void)speechCapturing:(id)a3 willSetAudioSessionActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[ADSpeechManager speechCapturing:willSetAudioSessionActive:]";
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s flag = %d", (uint8_t *)&v9, 0x12u);
  }
  uint64_t v8 = 210;
  if (!v4) {
    uint64_t v8 = 211;
  }
  *((unsigned char *)&self->super.isa + v8) = v4;
  [(ADSpeechManager *)self _tellDelegateWillSetAudioSessionActive:v4];
  [(ADAudioSessionCoordinator *)self->_audioSessionCoordinator handleWillSetAudioSessionActive:v4];
}

- (void)speechCapturingDidRequestUpdateSiriOutputVolume:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    int v7 = "-[ADSpeechManager speechCapturingDidRequestUpdateSiriOutputVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  if (sub_1003545D0((uint64_t)self->_instanceContext))
  {
    [(ADSpeechManager *)self _fetchSmartSiriVolume:1];
    [(ADSpeechManager *)self _updateSiriOutputVolume:1 completion:0];
  }
}

- (void)speechCapturingDidRequestShutdownUI:(id)a3
{
  id v4 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADSpeechManager speechCapturingDidRequestShutdownUI:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(ADSpeechManager *)self _tellDelegateShutdownUIWasRequested];
}

- (void)speechCapturingDidRequestQuickStop:(id)a3
{
  id v4 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    int v6 = "-[ADSpeechManager speechCapturingDidRequestQuickStop:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(ADSpeechManager *)self _tellDelegateQuickStopWasRequested];
}

- (void)speechCapturing:(id)a3 performTwoShotPromptWithType:(int64_t)a4 completion:(id)a5
{
}

- (void)speechCapturing:(id)a3 didDetectEndpointAtTime:(double)a4
{
}

- (void)speechCapturing:(id)a3 didDetectStartpointAtTime:(double)a4
{
}

- (void)speechCapturing:(id)a3 didFinishWritingAudioFile:(id)a4 error:(id)a5
{
}

- (void)speechCapturingDidDelayEndpointForMusic:(id)a3
{
}

- (void)speechCapturingDidDetectMusic:(id)a3
{
}

- (void)speechCapturing:(id)a3 didReceiveFingerprint:(id)a4 duration:(double)a5
{
}

- (void)speechCapturingDidRecordSpeechPackets:(id)a3 atTimestamp:(double)a4 totalPacketCount:(int64_t)a5
{
  id v8 = a3;
  if ([(CSSiriSpeechRecordingContext *)self->_capturingContext wantsRecordedAudioBufferLogs])
  {
    int v9 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      id v10 = v9;
      int v11 = 136315906;
      BOOL v12 = "-[ADSpeechManager speechCapturingDidRecordSpeechPackets:atTimestamp:totalPacketCount:]";
      __int16 v13 = 2048;
      id v14 = [v8 count];
      __int16 v15 = 2048;
      double v16 = a4;
      __int16 v17 = 2048;
      int64_t v18 = a5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s packets.count = %llu, timestamp = %f, totalPacketCount = %lld", (uint8_t *)&v11, 0x2Au);
    }
  }
  [(ADSpeechLog *)self->_speechLog appendSpeechPackets:v8];
  [(ADSpeechManager *)self _tellDelegateAboutSpeechPackets:v8 atTimestamp:a5 count:a4];
}

- (void)speechCapturingDidStopRecordingWithError:(id)a3 endpointMode:(int64_t)a4 totalPacketCount:(int64_t)a5 endpointerMetrics:(id)a6
{
  queue = self->_queue;
  id v11 = a6;
  double v16 = (NSError *)a3;
  dispatch_assert_queue_V2(queue);
  BOOL v12 = +[AFDiagnostics sharedDiagnostics];
  [v12 logVoiceRecordingEnd];

  recordingError = v16;
  if (!v16) {
    recordingError = self->_recordingError;
  }
  id v14 = recordingError;
  [(ADSpeechManager *)self _recordingStoppedWithError:v14 totalPacketCount:a5 endpointMode:a4 endpointerMetrics:v11];

  __int16 v15 = self->_recordingError;
  self->_recordingError = 0;
}

- (void)speechCapturingWillStopRecordingWithSignpostID:(unint64_t)a3
{
}

- (void)speechCapturingWillStopRecording
{
}

- (void)speechCapturingDidReceiveLastAudioBufferWithEndpointMode:(int64_t)a3 totalPacketCount:(int64_t)a4 endpointerMetrics:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int speechState = self->_speechState;
  if (speechState > 4 || ((1 << speechState) & 0x13) == 0)
  {
    if (!self->_hasReceivedLastAudioBuffer) {
      [(ADSpeechManager *)self _lastAudioBufferReceivedWithEndpointMode:a3 totalPacketCount:a4 endpointerMetrics:v8];
    }
  }
  else
  {
    id v11 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      BOOL v12 = v11;
      __int16 v13 = sub_10032C0C0(speechState);
      int v14 = 136315394;
      __int16 v15 = "-[ADSpeechManager speechCapturingDidReceiveLastAudioBufferWithEndpointMode:totalPacketCount:endpointerMetrics:]";
      __int16 v16 = 2112;
      __int16 v17 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s Ignored because speech state is %@.", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)speechCapturingDidUpdateRecordingInfo:(id)a3
{
  id v6 = a3;
  id v4 = [v6 route];
  int v5 = [v6 deviceIdentifier];
  [(ADSpeechManager *)self _updateRecordRoute:v4 andDeviceIdentifier:v5];

  [(ADSpeechManager *)self _tellDelegateUpdateAudioInfo:v6];
}

- (void)speechCapturingDidStartRecordingSuccessfully:(BOOL)a3 error:(id)a4 withInfo:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v10 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315906;
    v100 = "-[ADSpeechManager speechCapturingDidStartRecordingSuccessfully:error:withInfo:]";
    __int16 v101 = 1024;
    *(_DWORD *)v102 = v6;
    *(_WORD *)&v102[4] = 2112;
    *(void *)&v102[6] = v8;
    *(_WORD *)&v102[14] = 2112;
    *(void *)&v102[16] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s success = %d, error = %@, info = %@", buf, 0x26u);
  }
  if (!v6)
  {
    [(ADSpeechManager *)self _updateSpeechState:0];
    [(ADSpeechManager *)self _tellDelegateSpeechFailedWithError:v8];
    goto LABEL_74;
  }
  id v11 = [v9 route];
  BOOL v12 = [v9 deviceIdentifier];
  [(ADSpeechManager *)self _updateRecordRoute:v11 andDeviceIdentifier:v12];

  [(ADSpeechManager *)self _updateSpeechState:2];
  __int16 v13 = [v9 codec];
  if (v13)
  {
    v98 = self->_initialDictationLanguage;
    int v14 = [(AFDictationOptions *)self->_dictationOptions offlineLanguage];
    if (!v14 && (int v14 = self->_primaryDictationLanguage) == 0
      || !self->_localSpeechRecognizerTask
      || !AFOfflineDictationCapable()
      || ([v9 isFingerprintOnly] & 1) != 0)
    {
      __int16 v15 = (void *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        localSpeechRecognizerTask = self->_localSpeechRecognizerTask;
        __int16 v17 = v15;
        int64_t v18 = +[NSNumber numberWithBool:AFOfflineDictationCapable()];
        *(_DWORD *)long long buf = 136315906;
        v100 = "-[ADSpeechManager speechCapturingDidStartRecordingSuccessfully:error:withInfo:]";
        __int16 v101 = 2112;
        *(void *)v102 = v14;
        *(_WORD *)&v102[8] = 2112;
        *(void *)&v102[10] = localSpeechRecognizerTask;
        *(_WORD *)&v102[18] = 2112;
        *(void *)&v102[20] = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Not starting local recognizer: language %@, task %@, dictation capable %@", buf, 0x2Au);
      }
LABEL_72:
      [(ADSpeechManager *)self _tellDelegateSpeechStartedWithRecordingInfo:v9];
      [(ADSpeechLog *)self->_speechLog beginNewSpeechLogWithFormat:v13];

      goto LABEL_73;
    }
    id v19 = [v9 codecIsNarrowband];
    id v20 = [v9 voiceTriggerEventInfo];
    BOOL v21 = v20 != 0;

    v92 = self->_localSpeechRecognizerTask;
    unsigned int v93 = [(NSString *)v92 isEqualToString:CoreEmbeddedSpeechRecognizerTaskDictation];
    id v22 = objc_alloc_init((Class)NSMutableDictionary);
    [v22 setObject:v13 forKeyedSubscript:@"codec"];
    [v22 setObject:v14 forKeyedSubscript:@"language"];
    id v23 = +[NSNumber numberWithBool:v19];
    [v22 setObject:v23 forKeyedSubscript:@"narrowband"];

    id v24 = +[NSNumber numberWithBool:v21];
    [v22 setObject:v24 forKeyedSubscript:@"farField"];

    dictationOptions = self->_dictationOptions;
    if (dictationOptions)
    {
      unint64_t v88 = v22;
      if (v93)
      {
        AFIsDictationRequestEligibleForOnDeviceDictation();
        dictationOptions = self->_dictationOptions;
      }
      unsigned int v86 = [(AFDictationOptions *)dictationOptions detectUtterances];
      unsigned int v96 = [(AFDictationOptions *)self->_dictationOptions continuousListening];
      unsigned int v26 = [(AFDictationOptions *)self->_dictationOptions shouldHandleCapitalization];
      v91 = [(AFDictationOptions *)self->_dictationOptions originalAudioFileURL];
      v90 = [(AFDictationOptions *)self->_dictationOptions modelOverrideURL];
      __int16 v89 = [(AFDictationOptions *)self->_dictationOptions inlineItemList];
      id v27 = [(AFDictationOptions *)self->_dictationOptions fieldLabel];
      AFIsDictationRequestSpeechApiRequest();

      inlineItemList = (NSArray *)objc_alloc_init((Class)NSMutableDictionary);
      id v29 = [(AFDictationOptions *)self->_dictationOptions recognitionOverrides];
      [(NSArray *)inlineItemList addEntriesFromDictionary:v29];

      if (v96) {
        CFStringRef v30 = @"YES";
      }
      else {
        CFStringRef v30 = @"NO";
      }
      [(NSArray *)inlineItemList setObject:v30 forKeyedSubscript:@"continuousListening"];
      if (v26) {
        CFStringRef v31 = @"YES";
      }
      else {
        CFStringRef v31 = @"NO";
      }
      [(NSArray *)inlineItemList setObject:v31 forKeyedSubscript:@"shouldHandleCapitalization"];
      id v81 = inlineItemList;
      id v97 = [(NSArray *)inlineItemList copy];
      v95 = [(AFDictationOptions *)self->_dictationOptions interactionIdentifier];
      uint64_t v32 = [(AFDictationOptions *)self->_dictationOptions applicationName];
      unsigned int v82 = [(AFDictationOptions *)self->_dictationOptions preferOnlineRecognition];
      unsigned int v83 = [(AFDictationOptions *)self->_dictationOptions forceOfflineRecognition];
      unsigned int v84 = [(AFDictationOptions *)self->_dictationOptions secureOfflineOnly];
      int v85 = v93 & v83;
      [(AFDictationOptions *)self->_dictationOptions emojiRecognition];
      [(AFDictationOptions *)self->_dictationOptions autoPunctuation];
      v33 = +[NSNumber numberWithBool:v86];
      id v22 = v88;
      [v88 setObject:v33 forKeyedSubscript:@"detectUtterances"];

      if (v97) {
        id v34 = v97;
      }
      else {
        id v34 = &__NSDictionary0__struct;
      }
      [v88 setObject:v34 forKeyedSubscript:@"recognitionOverrides"];
      v94 = (void *)v32;
      if (v32) {
        CFStringRef v35 = (const __CFString *)v32;
      }
      else {
        CFStringRef v35 = @"undefined";
      }
      [v88 setObject:v35 forKeyedSubscript:@"applicationName"];
      v36 = +[NSNumber numberWithBool:v82];
      [v88 setObject:v36 forKeyedSubscript:@"preferOnlineRecognition"];

      v37 = +[NSNumber numberWithBool:v83];
      [v88 setObject:v37 forKeyedSubscript:@"forceOfflineRecognition"];

      v38 = +[NSNumber numberWithBool:v84];
      [v88 setObject:v38 forKeyedSubscript:@"secureOfflineOnly"];

      if (v85 != 1)
      {
        CFStringRef v39 = (const __CFString *)v92;
        goto LABEL_68;
      }
      CFStringRef v39 = (const __CFString *)v92;
      if (v84)
      {
        if (v95) {
          CFStringRef v40 = v95;
        }
        else {
          CFStringRef v40 = &stru_10050F7D8;
        }
        [v88 setObject:v40 forKeyedSubscript:@"dictationUIInteractionIdentifier"];
        uint64_t v41 = AFCurrentUserInterfaceIdiom();
        id v42 = (void *)v41;
        if (v41) {
          CFStringRef v43 = (const __CFString *)v41;
        }
        else {
          CFStringRef v43 = &stru_10050F7D8;
        }
        [v88 setObject:v43 forKeyedSubscript:@"userInterfaceIdiom"];

        uint64_t v44 = [v9 source];
        v45 = (void *)v44;
        if (v44) {
          CFStringRef v46 = (const __CFString *)v44;
        }
        else {
          CFStringRef v46 = &stru_10050F7D8;
        }
        [v88 setObject:v46 forKeyedSubscript:@"audioSource"];

        uint64_t v47 = [v9 vendorId];
        uint64_t v48 = (void *)v47;
        if (v47) {
          CFStringRef v49 = (const __CFString *)v47;
        }
        else {
          CFStringRef v49 = &stru_10050F7D8;
        }
        [v88 setObject:v49 forKeyedSubscript:@"vendorId"];

        uint64_t v50 = [v9 productId];
        id v51 = (void *)v50;
        if (v50) {
          CFStringRef v52 = (const __CFString *)v50;
        }
        else {
          CFStringRef v52 = &stru_10050F7D8;
        }
        [v88 setObject:v52 forKeyedSubscript:@"productId"];

        uint64_t v53 = [(AFDictationOptions *)self->_dictationOptions fieldLabel];
        uint64_t v54 = (void *)v53;
        if (v53) {
          CFStringRef v55 = (const __CFString *)v53;
        }
        else {
          CFStringRef v55 = &stru_10050F7D8;
        }
        [v88 setObject:v55 forKeyedSubscript:@"fieldLabel"];

        uint64_t v56 = sub_10035C6FC((uint64_t)[v9 speechEvent]);
        unint64_t v57 = (void *)v56;
        if (v56) {
          CFStringRef v58 = (const __CFString *)v56;
        }
        else {
          CFStringRef v58 = &stru_10050F7D8;
        }
        [v88 setObject:v58 forKeyedSubscript:@"inputOrigin"];

        if (AFIsSearchDictationRequest())
        {
          id v59 = +[ADDictationOfflineStatusObserver sharedDictationOfflineStatusObserver];
          id v60 = [v59 offlineDictationStatus];
          v61 = [v60 objectForKey:v14];

          __int16 v87 = v61;
          id v62 = [(NSString *)v61 objectForKey:AFOfflineDictationStatusOnDeviceSearchKey];
          LODWORD(v59) = [v62 BOOLValue];

          if (v59)
          {
            CFStringRef v39 = (const __CFString *)CoreEmbeddedSpeechRecognizerTaskWebSearch;
          }
          else
          {
            CFStringRef v39 = (const __CFString *)v92;
          }
          inlineItemList = v81;
          id v63 = v87;
          goto LABEL_67;
        }
        if ([(AFDictationOptions *)self->_dictationOptions taskHint] == (id)5)
        {
          id v63 = v92;
          CFStringRef v39 = @"DictationCC";
LABEL_67:
        }
      }
    }
    else
    {
      if (!self->_inlineItemList)
      {
        v94 = 0;
        v95 = 0;
        __int16 v89 = 0;
        v90 = 0;
        id v97 = 0;
        v91 = 0;
        CFStringRef v39 = (const __CFString *)v92;
LABEL_69:
        v64 = v22;
        [v22 setObject:v39 forKeyedSubscript:@"task"];
        id v65 = AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          v100 = "-[ADSpeechManager speechCapturingDidStartRecordingSuccessfully:error:withInfo:]";
          __int16 v101 = 2114;
          *(void *)v102 = v39;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "%s Will start local speech recognition with task: %{public}@", buf, 0x16u);
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [(CSSiriSpeechRecordingContext *)self->_capturingContext sessionUUID];
        v68 = id v67 = (__CFString *)v39;
        [WeakRetained speechManager:self didBeginLocalRecognitionWithContext:v64 sessionUUID:v68];

        goto LABEL_72;
      }
      CFStringRef v39 = (const __CFString *)v92;
      if (AFIsNano()) {
        __int16 v89 = 0;
      }
      else {
        __int16 v89 = self->_inlineItemList;
      }
      v94 = 0;
      v95 = 0;
      id v97 = 0;
      v90 = 0;
      v91 = 0;
      inlineItemList = self->_inlineItemList;
      self->_inlineItemList = 0;
    }
LABEL_68:

    goto LABEL_69;
  }
  v98 = +[ADSpeechManager _speechCodecError];
  -[ADSpeechManager _cancelRecordingWithError:suppressAlert:](self, "_cancelRecordingWithError:suppressAlert:");
LABEL_73:

LABEL_74:
  id recordStartedCompletion = (void (**)(id))self->_recordStartedCompletion;
  if (recordStartedCompletion)
  {
    id v70 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      unsigned int speechState = self->_speechState;
      id v72 = v70;
      v73 = sub_10032C0C0(speechState);
      *(_DWORD *)long long buf = 136315394;
      v100 = "-[ADSpeechManager speechCapturingDidStartRecordingSuccessfully:error:withInfo:]";
      __int16 v101 = 2112;
      *(void *)v102 = v73;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_INFO, "%s Invoking recording started completion (state = %@)", buf, 0x16u);

      id recordStartedCompletion = (void (**)(id))self->_recordStartedCompletion;
    }
    recordStartedCompletion[2](recordStartedCompletion);
    id v74 = self->_recordStartedCompletion;
    self->_id recordStartedCompletion = 0;
  }
  if (!v6)
  {
    id recordStoppedCompletion = (void (**)(id))self->_recordStoppedCompletion;
    if (recordStoppedCompletion)
    {
      v76 = (void *)AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        unsigned int v77 = self->_speechState;
        id v78 = v76;
        id v79 = sub_10032C0C0(v77);
        *(_DWORD *)long long buf = 136315394;
        v100 = "-[ADSpeechManager speechCapturingDidStartRecordingSuccessfully:error:withInfo:]";
        __int16 v101 = 2112;
        *(void *)v102 = v79;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "%s Invoking recording stopped completion (state = %@)", buf, 0x16u);

        id recordStoppedCompletion = (void (**)(id))self->_recordStoppedCompletion;
      }
      recordStoppedCompletion[2](recordStoppedCompletion);
      id v80 = self->_recordStoppedCompletion;
      self->_id recordStoppedCompletion = 0;
    }
  }
}

- (void)_updateCapturingStateWithOptions:(id)a3
{
  id v4 = a3;
  int v5 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[ADSpeechManager _updateCapturingStateWithOptions:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  if (v4)
  {
    BOOL v6 = [(ADSpeechManager *)self _currentSpeechCaptureSource];
    [v6 setSpeechRequestOptions:v4];
  }
}

- (void)_recordingStoppedWithError:(id)a3 totalPacketCount:(int64_t)a4 endpointMode:(int64_t)a5 endpointerMetrics:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  BOOL v12 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    unsigned int speechState = self->_speechState;
    int v14 = v12;
    __int16 v15 = sub_10032C0C0(speechState);
    int v24 = 136316418;
    id v25 = "-[ADSpeechManager _recordingStoppedWithError:totalPacketCount:endpointMode:endpointerMetrics:]";
    __int16 v26 = 2112;
    id v27 = v10;
    __int16 v28 = 2048;
    int64_t v29 = a5;
    __int16 v30 = 2048;
    int64_t v31 = a4;
    __int16 v32 = 2112;
    id v33 = v11;
    __int16 v34 = 2112;
    CFStringRef v35 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s error = %@, endpointMode = %zd, totalPacketCount = %zd, endpointerMetrics = %@, ADSpeechState = %@", (uint8_t *)&v24, 0x3Eu);
  }
  int v16 = self->_speechState;
  [(ADSpeechManager *)self _updateSpeechState:0];
  if (v10)
  {
    [(ADSpeechManager *)self _tellDelegateSpeechFailedWithError:v10];
  }
  else if (v16 == 4)
  {
    [(ADSpeechManager *)self _tellDelegateSpeechCanceled];
  }
  else
  {
    if (!self->_hasReceivedLastAudioBuffer) {
      [(ADSpeechManager *)self _lastAudioBufferReceivedWithEndpointMode:a5 totalPacketCount:a4 endpointerMetrics:v11];
    }
    [(ADSpeechManager *)self _tellDelegateSpeechFinished];
  }
  [(ADSpeechLog *)self->_speechLog endSpeechLog];
  self->_hasPreparedAudioSystemForPlayback = 0;
  if (self->_releasesAudioSessionWhenRecordingStopped)
  {
    __int16 v17 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v24 = 136315138;
      id v25 = "-[ADSpeechManager _recordingStoppedWithError:totalPacketCount:endpointMode:endpointerMetrics:]";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%s Asking AVVoiceController to release its audio session now because 'releasesAudioSessionWhenRecordingStopped' is set.", (uint8_t *)&v24, 0xCu);
    }
    [(ADSpeechManager *)self _releaseSession];
  }
  id recordStoppedCompletion = (void (**)(id))self->_recordStoppedCompletion;
  if (recordStoppedCompletion)
  {
    id v19 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      unsigned int v20 = self->_speechState;
      BOOL v21 = v19;
      id v22 = sub_10032C0C0(v20);
      int v24 = 136315394;
      id v25 = "-[ADSpeechManager _recordingStoppedWithError:totalPacketCount:endpointMode:endpointerMetrics:]";
      __int16 v26 = 2112;
      id v27 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s Invoking recording stopped completion (state = %@)", (uint8_t *)&v24, 0x16u);

      id recordStoppedCompletion = (void (**)(id))self->_recordStoppedCompletion;
    }
    recordStoppedCompletion[2](recordStoppedCompletion);
    id v23 = self->_recordStoppedCompletion;
    self->_id recordStoppedCompletion = 0;
  }
}

- (void)_lastAudioBufferReceivedWithEndpointMode:(int64_t)a3 totalPacketCount:(int64_t)a4 endpointerMetrics:(id)a5
{
  id v8 = a5;
  __int16 v9 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    unsigned int speechState = self->_speechState;
    id v11 = v9;
    BOOL v12 = sub_10032C0C0(speechState);
    int v13 = 136316162;
    int v14 = "-[ADSpeechManager _lastAudioBufferReceivedWithEndpointMode:totalPacketCount:endpointerMetrics:]";
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2048;
    int64_t v18 = a4;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s %zd %zd %@ %@", (uint8_t *)&v13, 0x34u);
  }
  self->_hasReceivedLastAudioBuffer = 1;
  [(ADSpeechManager *)self _tellDelegateSpeechReceivedLastAudioBufferWithEndpointMode:a3 totalPacketCount:a4 endpointerMetrics:v8];
}

- (void)_cancelRecordingWithError:(id)a3 suppressAlert:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v6 = (NSError *)a3;
  int v7 = (void *)AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    unsigned int speechState = self->_speechState;
    __int16 v9 = v7;
    id v10 = sub_10032C0C0(speechState);
    int v13 = 136315906;
    int v14 = "-[ADSpeechManager _cancelRecordingWithError:suppressAlert:]";
    __int16 v15 = 2112;
    int64_t v16 = v6;
    __int16 v17 = 1024;
    BOOL v18 = v4;
    __int16 v19 = 2112;
    id v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s %@ %d %@", (uint8_t *)&v13, 0x26u);
  }
  recordingError = self->_recordingError;
  self->_recordingError = v6;

  BOOL v12 = [(ADSpeechManager *)self _currentSpeechCaptureSource];
  [v12 cancelSpeechCaptureSuppressingAlert:v4];

  [(ADSpeechManager *)self _updateSpeechState:4];
}

- (void)_tellDelegateSpeechWillStopRecordingWithSignpostID:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self willStopRecordingWithSignpostID:a3];
}

- (void)_tellDelegateDidDetectLanguage:(id)a3 confidenceScores:(id)a4 isConfident:(BOOL)a5
{
  BOOL v5 = a5;
  p_delegate = &self->_delegate;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained speechManager:self didDetectLanguage:v10 confidenceScores:v9 isConfident:v5];
}

- (void)_tellDelegateDidSetAudioSessionActive:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self audioSessionDidBecomeActive:v3];
}

- (void)_tellDelegateWillSetAudioSessionActive:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self audioSessionWillBecomeActive:v3];
}

- (void)_tellDelegateShutdownUIWasRequested
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self didRequestShutdownUIWithContext:self->_capturingContext];
}

- (void)_tellDelegateQuickStopWasRequested
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self didRequestQuickStopWithContext:self->_capturingContext];
}

- (void)_tellDelegateToPerformTwoShotPromptWithType:(int64_t)a3 completion:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained speechManager:self performTwoShotPromptWithType:a3 context:self->_capturingContext completion:v7];
}

- (void)_tellDelegateSpeechEndpointWasDetectedAtTime:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self didDetectEndpointAtTime:self->_capturingContext context:a3];
}

- (void)_tellDelegateSpeechStartpointWasDetectedAtTime:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained speechManager:self didDetectStartpointAtTime:self->_capturingContext context:a3];
}

- (void)_tellDelegateAudioFileDidFinish:(id)a3 error:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained speechManager:self didFinishWritingAudioFile:v8 error:v7 context:self->_capturingContext];
}

- (void)_tellDelegateAboutInputAveragePower:(float)a3 peak:(float)a4
{
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(float *)&double v7 = a3;
    *(float *)&double v8 = a4;
    [WeakRetained speechManager:self didUpdateInputAveragePower:v7 peakPower:v8];
  }
  else
  {
    id v9 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v12 = "-[ADSpeechManager _tellDelegateAboutInputAveragePower:peak:]";
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", buf, 0xCu);
    }
  }
}

- (void)_tellDelegateEndpointWasDelayedForMusic
{
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManagerDidDelayEndpointForMusic:self];
  }
  else
  {
    BOOL v3 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v6 = "-[ADSpeechManager _tellDelegateEndpointWasDelayedForMusic]";
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", buf, 0xCu);
    }
  }
}

- (void)_tellDelegateMusicWasDetected
{
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManagerDidDetectMusic:self];
  }
  else
  {
    BOOL v3 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v6 = "-[ADSpeechManager _tellDelegateMusicWasDetected]";
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", buf, 0xCu);
    }
  }
}

- (void)_tellDelegateAboutFingerprint:(id)a3 duration:(double)a4
{
  id v6 = a3;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self capturedFingerprint:v6 duration:a4];
  }
  else
  {
    double v8 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315138;
      id v10 = "-[ADSpeechManager _tellDelegateAboutFingerprint:duration:]";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_tellDelegateAboutSpeechPackets:(id)a3 atTimestamp:(double)a4 count:(int64_t)a5
{
  id v8 = a3;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self capturedPackets:v8 atTimestamp:a5 totalCount:self->_capturingContext context:a4];
  }
  else
  {
    id v10 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      BOOL v12 = "-[ADSpeechManager _tellDelegateAboutSpeechPackets:atTimestamp:count:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_tellDelegateUpdateAudioInfo:(id)a3
{
  id v4 = a3;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didUpdateRecordingWithInfo:v4 context:self->_capturingContext];
  }
  else
  {
    id v6 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[ADSpeechManager _tellDelegateUpdateAudioInfo:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_tellDelegateSpeechStartedWithRecordingInfo:(id)a3
{
  id v4 = a3;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didStartRecordingWithInfo:v4 context:self->_capturingContext];
  }
  else
  {
    id v6 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[ADSpeechManager _tellDelegateSpeechStartedWithRecordingInfo:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_tellDelegateSpeechWillBeginWithTimestamp:(double)a3 isFromFile:(BOOL)a4 isAudioPowerUpdateDisabled:(BOOL)a5
{
  if (self->_shouldTalkToDelegate)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v12 = WeakRetained;
    if (v5)
    {
      [WeakRetained speechManager:self willStartRecordingAtTimestamp:v6 isFromFile:0 inputAudioPowerWrapper:self->_capturingContext context:a3];
    }
    else
    {
      int v11 = [(AFAudioPowerUpdater *)self->_audioPowerUpdater _createNewXPCWrapper];
      [v12 speechManager:self willStartRecordingAtTimestamp:v6 isFromFile:v11 inputAudioPowerWrapper:self->_capturingContext context:a3];
    }
  }
  else
  {
    id v10 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      int v14 = "-[ADSpeechManager _tellDelegateSpeechWillBeginWithTimestamp:isFromFile:isAudioPowerUpdateDisabled:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", buf, 0xCu);
    }
  }
}

- (void)_tellDelegateSpeechRecognitionUpdateWillBegin
{
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self recognitionUpdateWillBeginForTask:self->_localSpeechRecognizerTask];
  }
  else
  {
    BOOL v3 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v6 = "-[ADSpeechManager _tellDelegateSpeechRecognitionUpdateWillBegin]";
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", buf, 0xCu);
    }
  }
}

- (void)_tellDelegateSpeechShouldPreheatWithRecordingInfo:(id)a3
{
  id v4 = a3;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self preheatWithRecordingInfo:v4 context:self->_capturingContext];
  }
  else
  {
    BOOL v6 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[ADSpeechManager _tellDelegateSpeechShouldPreheatWithRecordingInfo:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_tellDelegateSpeechFinished
{
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didFinishWithCapturingMode:self->_capturingMode context:self->_capturingContext];

    if (!self->_localSpeechRecognizerTask)
    {
      [(ADSpeechManager *)self _cleanUpDelegateInfo];
    }
  }
  else
  {
    id v4 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      BOOL v6 = "-[ADSpeechManager _tellDelegateSpeechFinished]";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_tellDelegateSpeechReceivedLastAudioBufferWithEndpointMode:(int64_t)a3 totalPacketCount:(int64_t)a4 endpointerMetrics:(id)a5
{
  id v8 = a5;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didReceiveLastAudioBufferWithEndpointMode:a3 totalPacketCount:a4 endpointerMetrics:v8 context:self->_capturingContext];
  }
  else
  {
    id v10 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[ADSpeechManager _tellDelegateSpeechReceivedLastAudioBufferWithEndpointMode:totalPacketCount:endpointerMetrics:]";
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_tellDelegateSpeechFailedWithError:(id)a3
{
  id v4 = a3;
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didFailWithError:v4 context:self->_capturingContext];

    [(ADSpeechManager *)self _cleanUpDelegateInfo];
  }
  else
  {
    BOOL v6 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315138;
      id v8 = "-[ADSpeechManager _tellDelegateSpeechFailedWithError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_tellDelegateSpeechCanceled
{
  if (self->_shouldTalkToDelegate)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didCancelWithContext:self->_capturingContext];

    [(ADSpeechManager *)self _cleanUpDelegateInfo];
  }
  else
  {
    id v4 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      BOOL v6 = "-[ADSpeechManager _tellDelegateSpeechCanceled]";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Speech finished dropping callback", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_cleanUpDelegateInfo
{
  BOOL v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    BOOL v6 = "-[ADSpeechManager _cleanUpDelegateInfo]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s ADSpeechManager no longer talking to delegate", (uint8_t *)&v5, 0xCu);
  }
  [(AFAudioPowerUpdater *)self->_audioPowerUpdater endUpdate];
  self->_shouldTalkToDelegate = 0;
  self->_hasReceivedLastAudioBuffer = 0;
  self->_capturingMode = 0;
  capturingContext = self->_capturingContext;
  self->_capturingContext = 0;
}

- (void)resetLocalRecognizer
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003366A8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (void)cancelLocalRecognitionIfActive
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100336778;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isLocallyRecognizingInDictationMode
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100336914;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isLocallyRecognizing
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003369F4;
  v5[3] = &unk_10050D5F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)disableDESWithCompletion:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100336AA8;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)getOfflineDictationStatusIgnoringCache:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100336B94;
  block[3] = &unk_10050D0D0;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

- (id)_interactiveLocalSpeechRecognizer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
  if (!interactiveLocalSpeechRecognizer)
  {
    id v4 = (CoreEmbeddedSpeechRecognizer *)[objc_alloc((Class)CoreEmbeddedSpeechRecognizer) initWithDelegate:self instanceUUID:&CoreEmbeddedSpeechRecognizerInstanceUUIDInteractive];
    id v5 = self->_interactiveLocalSpeechRecognizer;
    self->_interactiveLocalSpeechRecognizer = v4;

    id v6 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      id v7 = self->_interactiveLocalSpeechRecognizer;
      int v9 = 136315650;
      id v10 = "-[ADSpeechManager _interactiveLocalSpeechRecognizer]";
      __int16 v11 = 2112;
      id v12 = self;
      __int16 v13 = 2112;
      int v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@ created speech recognizer %@", (uint8_t *)&v9, 0x20u);
    }
    interactiveLocalSpeechRecognizer = self->_interactiveLocalSpeechRecognizer;
  }
  return interactiveLocalSpeechRecognizer;
}

- (void)dictationSessionDidComplete
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100336DB8;
  block[3] = &unk_10050E138;
  void block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_releaseSession
{
  char v3 = AFSiriLogContextSpeech;
  if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
  {
    BOOL isAudioSessionLikelyActive = self->_isAudioSessionLikelyActive;
    int v23 = 136315394;
    int v24 = "-[ADSpeechManager _releaseSession]";
    __int16 v25 = 1024;
    unsigned int v26 = isAudioSessionLikelyActive;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s isAudioSessionActive = %d (likely)", (uint8_t *)&v23, 0x12u);
  }
  if (AFSupportsAudioSessionCoordination())
  {
    unsigned int v5 = [(ADAudioSessionCoordinator *)self->_audioSessionCoordinator hasActiveAudioSessionAssertions];
    id v6 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 136315394;
      int v24 = "-[ADSpeechManager _releaseSession]";
      __int16 v25 = 1024;
      unsigned int v26 = v5;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s hasActiveAudioSessionAssertions = %d", (uint8_t *)&v23, 0x12u);
      id v6 = AFSiriLogContextSpeech;
    }
    BOOL isReleaseAudioSessionRequired = self->_isReleaseAudioSessionRequired;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 136315394;
      int v24 = "-[ADSpeechManager _releaseSession]";
      __int16 v25 = 1024;
      unsigned int v26 = isReleaseAudioSessionRequired;
      _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%s hasActivatedAudioSession = %d", (uint8_t *)&v23, 0x12u);
      if (v5)
      {
LABEL_8:
        id v8 = AFSiriLogContextSpeech;
        if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
        {
          int v23 = 136315138;
          int v24 = "-[ADSpeechManager _releaseSession]";
          int v9 = "%s Rejected releasing audio session because audio session coordinator has active assertions.";
LABEL_30:
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v23, 0xCu);
          return 0;
        }
        return 0;
      }
    }
    else if (v5)
    {
      goto LABEL_8;
    }
    if (!isReleaseAudioSessionRequired)
    {
      id v8 = AFSiriLogContextSpeech;
      if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
      {
        int v23 = 136315138;
        int v24 = "-[ADSpeechManager _releaseSession]";
        int v9 = "%s Skipped releasing audio session because audio session has not been activated and audio session coordinat"
             "or has no active assertions.";
        goto LABEL_30;
      }
      return 0;
    }
  }
  if (self->_prepareAudioSystemTransactionCount < 1)
  {
    CFStringRef v29 = @"wasAudioSessionActive";
    id v12 = +[NSNumber numberWithBool:self->_isAudioSessionLikelyActive];
    __int16 v30 = v12;
    __int16 v13 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

    int v14 = +[AFAnalytics sharedAnalytics];
    [v14 logEventWithType:246 context:v13 contextNoCopy:1];

    *(_WORD *)&self->_BOOL isAudioSessionLikelyActive = 0;
    self->_hasPreparedAudioSystemForPlayback = 0;
    self->_releasesAudioSessionWhenRecordingStopped = 0;
    self->_releasesAudioSessionWhenPrepareAudioSystemDone = 0;
    __int16 v15 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 136315138;
      int v24 = "-[ADSpeechManager _releaseSession]";
      _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%s Stopping audio playback, if any", (uint8_t *)&v23, 0xCu);
    }
    [(CSSiriAudioPlaybackService *)self->_audioPlaybackService stopAllRequestsSynchronously];
    int64_t v16 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 136315138;
      int v24 = "-[ADSpeechManager _releaseSession]";
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s Stopped audio playback, if any", (uint8_t *)&v23, 0xCu);
    }
    __int16 v17 = [(ADSpeechManager *)self _currentSpeechCaptureSource];
    [(CSSiriSpeechRecorder *)v17 releaseAudioSession];
    speechRecorder = self->_speechRecorder;
    if (speechRecorder != v17) {
      [(CSSiriSpeechRecorder *)speechRecorder releaseAudioSession];
    }
    [(ADSpeechManager *)self _updateAudioDeviceInfo:0];
    [(ADSpeechManager *)self _updateRecordRoute:0 andDeviceIdentifier:0];
    *(_WORD *)&self->_BOOL hasFetchedSmartSiriVolume = 0;
    self->_unint64_t dirtySiriOutputVolumeHostTime = 0;
    __int16 v19 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315650;
      int v24 = "-[ADSpeechManager _releaseSession]";
      __int16 v25 = 1024;
      unsigned int v26 = 0;
      __int16 v27 = 1024;
      int v28 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s hasFetchedSmartSiriVolume = %d, BOOL hasUpdatedSiriOutputVolume = %d", (uint8_t *)&v23, 0x18u);
    }
    if (self->_volumeService && ![(ADSpeechManager *)self _supportsVolumeService])
    {
      [(ADVolumeService *)self->_volumeService invalidate];
      volumeService = self->_volumeService;
      self->_volumeService = 0;
    }
    __int16 v21 = +[AFAnalytics sharedAnalytics];
    BOOL v11 = 1;
    [v21 logEventWithType:247 context:v13 contextNoCopy:1];
  }
  else
  {
    id v10 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v23 = 136315138;
      int v24 = "-[ADSpeechManager _releaseSession]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s Deferred releasing audio session during audio system preparation.", (uint8_t *)&v23, 0xCu);
    }
    BOOL v11 = 0;
    self->_releasesAudioSessionWhenPrepareAudioSystemDone = 1;
  }
  return v11;
}

- (void)_updateRecordRoute:(id)a3 andDeviceIdentifier:(id)a4
{
  id v6 = (NSString *)a3;
  id v7 = (NSString *)a4;
  recordRoute = self->_recordRoute;
  if (recordRoute != v6 && ![(NSString *)recordRoute isEqualToString:v6])
  {
    int v9 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      id v10 = self->_recordRoute;
      int v18 = 136315650;
      __int16 v19 = "-[ADSpeechManager _updateRecordRoute:andDeviceIdentifier:]";
      __int16 v20 = 2112;
      __int16 v21 = v10;
      __int16 v22 = 2112;
      int v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s recordRoute: %@ -> %@", (uint8_t *)&v18, 0x20u);
    }
    BOOL v11 = (NSString *)[(NSString *)v6 copy];
    id v12 = self->_recordRoute;
    self->_recordRoute = v11;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier != v7 && ![(NSString *)deviceIdentifier isEqualToString:v7])
  {
    int v14 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = self->_deviceIdentifier;
      int v18 = 136315650;
      __int16 v19 = "-[ADSpeechManager _updateRecordRoute:andDeviceIdentifier:]";
      __int16 v20 = 2112;
      __int16 v21 = v15;
      __int16 v22 = 2112;
      int v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s deviceIdentifier: %@ -> %@", (uint8_t *)&v18, 0x20u);
    }
    int64_t v16 = (NSString *)[(NSString *)v7 copy];
    __int16 v17 = self->_deviceIdentifier;
    self->_deviceIdentifier = v16;
  }
}

- (void)_updateAudioDeviceInfo:(id)a3
{
  id v4 = a3;
  unsigned int v5 = self->_audioDeviceInfo;
  id v6 = (CSAudioDeviceInfo *)v4;
  id v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (v6 && v5)
    {
      unsigned __int8 v8 = [(CSAudioDeviceInfo *)v5 isEqual:v6];

      if (v8) {
        goto LABEL_11;
      }
    }
    else
    {
    }
    int v9 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      audioDeviceInfo = self->_audioDeviceInfo;
      int v13 = 136315650;
      int v14 = "-[ADSpeechManager _updateAudioDeviceInfo:]";
      __int16 v15 = 2112;
      int64_t v16 = audioDeviceInfo;
      __int16 v17 = 2112;
      int v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s audioDeviceInfo: %@ -> %@", (uint8_t *)&v13, 0x20u);
    }
    BOOL v11 = (CSAudioDeviceInfo *)[(CSAudioDeviceInfo *)v7 copy];
    id v12 = self->_audioDeviceInfo;
    self->_audioDeviceInfo = v11;
  }
LABEL_11:
}

- (void)_updateSpeechState:(int)a3
{
  unsigned int speechState = self->_speechState;
  if (speechState != a3)
  {
    id v6 = (void *)AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      id v7 = v6;
      unsigned __int8 v8 = sub_10032C0C0(speechState);
      int v9 = sub_10032C0C0(a3);
      int v11 = 136315650;
      id v12 = "-[ADSpeechManager _updateSpeechState:]";
      __int16 v13 = 2112;
      int v14 = v8;
      __int16 v15 = 2112;
      int64_t v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s speechState: %@ -> %@", (uint8_t *)&v11, 0x20u);
    }
    self->_unsigned int speechState = a3;
  }
  if ((a3 != 0) == (speechState == 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechManager:self didChangeRecordingState:a3 != 0];
  }
}

- (id)_currentSpeechCaptureSource
{
  currentCapturing = self->_currentCapturing;
  if (!currentCapturing)
  {
    id v4 = [(ADSpeechManager *)self _speechRecorder];
    unsigned int v5 = self->_currentCapturing;
    self->_currentCapturing = v4;

    id v6 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      id v7 = self->_currentCapturing;
      int v9 = 136315394;
      id v10 = "-[ADSpeechManager _currentSpeechCaptureSource]";
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Speech capturing set to %@.", (uint8_t *)&v9, 0x16u);
    }
    currentCapturing = self->_currentCapturing;
  }
  return currentCapturing;
}

- (id)_speechCompressor
{
  speechCompressor = self->_speechCompressor;
  if (!speechCompressor)
  {
    id v4 = [ADSpeechCompressor alloc];
    queue = self->_queue;
    speechController = self->_speechController;
    audioSessionController = self->_audioSessionController;
    audioPlaybackService = self->_audioPlaybackService;
    int v9 = +[ADExperimentManager sharedManager];
    id v10 = [v9 context];
    __int16 v11 = [(ADSpeechCompressor *)v4 initWithQueue:queue speechController:speechController audioSessionController:audioSessionController audioPlaybackService:audioPlaybackService experimentContext:v10];
    id v12 = self->_speechCompressor;
    self->_speechCompressor = v11;

    __int16 v13 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      speechRecorder = self->_speechRecorder;
      int v16 = 136315650;
      __int16 v17 = "-[ADSpeechManager _speechCompressor]";
      __int16 v18 = 2112;
      __int16 v19 = self;
      __int16 v20 = 2112;
      __int16 v21 = speechRecorder;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %@ created speech compressor %@", (uint8_t *)&v16, 0x20u);
    }
    [(ADSpeechCompressor *)self->_speechCompressor setDelegate:self];
    speechCompressor = self->_speechCompressor;
  }
  return speechCompressor;
}

- (id)endpointerModelVersion
{
  return [(CSSpeechController *)self->_speechController endpointerModelVersion];
}

- (void)getSpeechRecorderVTSatScore:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100337C50;
  v7[3] = &unk_10050E188;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (id)_speechRecorder
{
  speechRecorder = self->_speechRecorder;
  if (!speechRecorder)
  {
    id v4 = objc_alloc((Class)CSSiriSpeechRecorder);
    queue = self->_queue;
    speechController = self->_speechController;
    audioSessionController = self->_audioSessionController;
    audioPlaybackService = self->_audioPlaybackService;
    int v9 = +[ADExperimentManager sharedManager];
    id v10 = [v9 context];
    __int16 v11 = (CSSiriSpeechRecorder *)[v4 initWithQueue:queue speechController:speechController audioSessionController:audioSessionController audioPlaybackService:audioPlaybackService experimentContext:v10];
    id v12 = self->_speechRecorder;
    self->_speechRecorder = v11;

    __int16 v13 = AFSiriLogContextSpeech;
    if (os_log_type_enabled(AFSiriLogContextSpeech, OS_LOG_TYPE_INFO))
    {
      int v14 = self->_speechRecorder;
      int v16 = 136315650;
      __int16 v17 = "-[ADSpeechManager _speechRecorder]";
      __int16 v18 = 2112;
      __int16 v19 = self;
      __int16 v20 = 2112;
      __int16 v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %@ created local speech recorder %@", (uint8_t *)&v16, 0x20u);
    }
    [(CSSiriSpeechRecorder *)self->_speechRecorder setClientConfiguration:self->_clientConfiguration];
    [(CSSiriSpeechRecorder *)self->_speechRecorder setDelegate:self];
    speechRecorder = self->_speechRecorder;
  }
  return speechRecorder;
}

- (void)dealloc
{
  [(AFAudioPowerUpdater *)self->_audioPowerUpdater invalidate];
  [(ADAudioSessionCoordinator *)self->_audioSessionCoordinator invalidate];
  char v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ADSpeechManager;
  [(ADSpeechManager *)&v4 dealloc];
}

- (id)_initWithInstanceContext:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)ADSpeechManager;
  unsigned int v5 = [(ADSpeechManager *)&v36 init];
  if (v5)
  {
    id v6 = sub_1001FC704();
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UNSPECIFIED, 0);

    if (v6) {
      dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("ADSpeechManagerQueue", v8, v6);
    }
    else {
      dispatch_queue_t v9 = dispatch_queue_create("ADSpeechManagerQueue", v8);
    }
    id v10 = (OS_dispatch_queue *)v9;

    queue = v5->_queue;
    v5->_queue = v10;

    v5->_unsigned int speechState = 0;
    id v12 = objc_alloc_init(ADSpeechLog);
    speechLog = v5->_speechLog;
    v5->_speechLog = v12;

    if (v4)
    {
      int v14 = (AFInstanceContext *)v4;
    }
    else
    {
      int v14 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v14;

    uint64_t v16 = +[CSSpeechController sharedController];
    speechController = v5->_speechController;
    v5->_speechController = (CSSpeechController *)v16;

    uint64_t v18 = +[CSAudioSessionController sharedInstance];
    audioSessionController = v5->_audioSessionController;
    v5->_audioSessionController = (CSAudioSessionController *)v18;

    if ([(AFInstanceContext *)v5->_instanceContext supportsAudioPowerUpdate])
    {
      __int16 v20 = [[ADAudioPowerCoreSpeechProvider alloc] initWithChannel:0 speechController:v5->_speechController];
      __int16 v21 = (AFAudioPowerUpdater *)[objc_alloc((Class)AFAudioPowerUpdater) initWithProvider:v20 queue:v5->_queue frequency:1 delegate:v5];
      audioPowerUpdater = v5->_audioPowerUpdater;
      v5->_audioPowerUpdater = v21;
    }
    int v23 = (CSSiriAudioPlaybackService *)[objc_alloc((Class)CSSiriAudioPlaybackService) initWithAudioSessionController:v5->_audioSessionController];
    audioPlaybackService = v5->_audioPlaybackService;
    v5->_audioPlaybackService = v23;

    __int16 v25 = [[ADAudioSessionCoordinator alloc] initWithInstanceContext:v4 delegate:v5];
    audioSessionCoordinator = v5->_audioSessionCoordinator;
    v5->_audioSessionCoordinator = v25;

    __int16 v27 = v5->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003381A4;
    block[3] = &unk_10050E138;
    CFStringRef v35 = v5;
    dispatch_async(v27, block);
    int v28 = v5->_queue;
    CFStringRef v29 = +[ADQueueMonitor sharedMonitor];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1003381C8;
    v32[3] = &unk_10050C458;
    id v33 = v28;
    __int16 v30 = v28;
    [v29 addQueue:v30 heartBeatInterval:v32 timeoutInterval:5.0 timeoutHandler:5.0];
  }
  return v5;
}

+ (id)sharedManager
{
  if (qword_1005863C8 != -1) {
    dispatch_once(&qword_1005863C8, &stru_10050C430);
  }
  v2 = (void *)qword_1005863D0;
  return v2;
}

+ (id)_speechCodecError
{
  return +[NSError errorWithDomain:kAFAssistantErrorDomain code:202 userInfo:0];
}

+ (id)_badStateError
{
  return +[NSError errorWithDomain:kAFAssistantErrorDomain code:205 userInfo:0];
}

+ (id)_ADSpeechManagerLowPriorityDispatchQueue
{
  v2 = (void *)qword_1005863C0;
  if (!qword_1005863C0)
  {
    char v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v4 = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.siri.ADSpeechManager.lowPrioritySerial", v4);
    id v6 = (void *)qword_1005863C0;
    qword_1005863C0 = (uint64_t)v5;

    v2 = (void *)qword_1005863C0;
  }
  return v2;
}

@end