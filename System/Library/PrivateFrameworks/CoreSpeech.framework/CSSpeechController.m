@interface CSSpeechController
+ (BOOL)isSmartSiriVolumeAvailable;
+ (id)sharedController;
- (AudioStreamBasicDescription)getLPCMAudioStreamBasicDescription;
- (BOOL)_activateAudioSessionWithReason:(unint64_t)a3 delay:(double)a4 delayRequested:(BOOL)a5 error:(id *)a6;
- (BOOL)_activateAudioSessionWithReason:(unint64_t)a3 error:(id *)a4;
- (BOOL)_canDelayStopRecording;
- (BOOL)_canPlayTwoShotFeedbackDuringMediaPlayback;
- (BOOL)_createAudioProviderFromXPCWithContext:(id)a3;
- (BOOL)_currentConfigurationSupportsDucking;
- (BOOL)_doActivateAudioSessionWithReason:(unint64_t)a3 error:(id *)a4;
- (BOOL)_fetchAudioProviderWithContext:(id)a3;
- (BOOL)_fetchLastTriggerInfo;
- (BOOL)_isDelayedDuckingSupportedContext;
- (BOOL)_isDuckingAvailableRoute:(id)a3;
- (BOOL)_isHubRequestTV;
- (BOOL)_isRecordRouteBuiltinMic;
- (BOOL)_isRecordRouteStudioDisplay;
- (BOOL)_setupAudioConverter:(BOOL)a3 isNarrowBand:(BOOL)a4;
- (BOOL)_shouldCalculateEstimatedSpeechEndHostTimeFromCachedEPMetrics;
- (BOOL)_shouldFetchRaiseToSpeakInfo;
- (BOOL)_shouldFetchVoiceTriggerInfo;
- (BOOL)_shouldResetContextAtPrepare;
- (BOOL)_shouldRunHybridSDSDMitigation;
- (BOOL)_shouldSetStartSampleCount;
- (BOOL)_shouldSetStartSampleCountForRTS;
- (BOOL)_shouldTrackLaunchLatency;
- (BOOL)_shouldUseLanguageDetector:(id)a3;
- (BOOL)_shouldUseSoundPlaybackMonitors;
- (BOOL)_supportsHybridSDSD;
- (BOOL)canPerformDelayedStop;
- (BOOL)didDeliverFirstSpeechPacket;
- (BOOL)didDeliverLastBuffer;
- (BOOL)hasPerformedDelayedStop;
- (BOOL)hasRequestedTwoShotFeedback;
- (BOOL)initializeRecordSessionWithRecordContext:(id)a3;
- (BOOL)isAlarmPlaying;
- (BOOL)isAsrOnDevice;
- (BOOL)isAudioSessionActivated;
- (BOOL)isHybridUODEnabled;
- (BOOL)isMediaPlaying;
- (BOOL)isNarrowBand;
- (BOOL)isOpus;
- (BOOL)isRecording;
- (BOOL)isRemoteVADAvailableStream;
- (BOOL)isSiriClientListening;
- (BOOL)isSmartSiriVolumeAvailable;
- (BOOL)isSoundPlaying;
- (BOOL)isTimerPlaying;
- (BOOL)myriadPreventingTwoShotFeedback;
- (BOOL)playAlertSoundForType:(int64_t)a3;
- (BOOL)playRecordStartingAlertAndResetEndpointerWithAlertOverride:(int64_t)a3;
- (BOOL)prepareRecordWithSettings:(id)a3 error:(id *)a4;
- (BOOL)prewarmAudioSession;
- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5;
- (BOOL)setCurrentRecordContext:(id)a3 error:(id *)a4;
- (BOOL)setRecordBufferDuration:(double)a3;
- (BOOL)setupStarted;
- (BOOL)shouldUseLanguageDetectorForCurrentRequest;
- (BOOL)startRecording:(id *)a3;
- (BOOL)startRecordingWithSettings:(id)a3 error:(id *)a4;
- (BOOL)supportHearstVoiceTrigger;
- (BOOL)supportPhatic;
- (BOOL)supportSessionActivateDelay;
- (BOOL)supportTriagleModeSessionActivationRetry;
- (BOOL)twoShotNotificationEnabled;
- (CSAsset)asset;
- (CSAudioAlertProviding)alertProvider;
- (CSAudioMeterProviding)audioMeterProvider;
- (CSAudioMetricProviding)audioMetricProvider;
- (CSAudioPowerMeter)powerMeter;
- (CSAudioRecordContext)audioRecordContext;
- (CSAudioSessionController)audioSessionController;
- (CSAudioSessionProviding)sessionProvider;
- (CSAudioStopStreamOption)requestedStopRecordingOptions;
- (CSAudioStream)audioStream;
- (CSAudioStreamProviding)streamProvider;
- (CSContinuousVoiceTrigger)continuousVoiceTrigger;
- (CSEndpointAnalyzer)endpointAnalyzer;
- (CSEndpointerProxy)endpointerProxy;
- (CSFAudioDeviceInfo)audioDeviceInfoImpl;
- (CSLanguageDetector)languageDetector;
- (CSLanguageDetectorDelegate)languageDetectorDelegate;
- (CSPlainAudioFileWriter)audioFileWriter;
- (CSRCHandlingXPCClient)rcHandlingClient;
- (CSSelectiveChannelAudioFileWriter)serverLoggingWriter;
- (CSSmartSiriVolumeController)volumeController;
- (CSSpeakerIdentificationDelegate)speakerIdDelegate;
- (CSSpeakerRecognitionProxy)speakerRecognitionProxy;
- (CSSpeechController)init;
- (CSSpeechController)initWithEndpointId:(id)a3;
- (CSSpeechController)initWithEndpointId:(id)a3 xpcClientFactory:(id)a4 endpointer:(id)a5 continuousVoiceTrigger:(id)a6 siriVolumeController:(id)a7 mediaPlayingMonitor:(id)a8 alarmMonitor:(id)a9 timerMonitor:(id)a10 audioSessionController:(id)a11 supportPhatic:(BOOL)a12 supportHearstVoiceTrigger:(BOOL)a13 supportTriagleModeSessionActivationRetry:(BOOL)a14 supportSessionActivateDelay:(BOOL)a15 supportsDuckingOnSpeakerEvaluator:(id)a16;
- (CSSpeechControllerDelegate)delegate;
- (CSSpeechEndHostTimeEstimator)speechEndHostTimeEstimator;
- (CSUncompressedAudioLogging)uncompressedAudioLogging;
- (CSVolumeMonitor)volumeMonitor;
- (CSXPCClient)duckAudioXPCClient;
- (CSXPCClient)xpcClient;
- (CSXPCClientFactory)xpcClientFactory;
- (NSArray)ssrAssets;
- (NSDictionary)speakerRecognitionScores;
- (NSMutableDictionary)decodersForTV;
- (NSString)bundleIdFromDictation;
- (NSString)logEventUUID;
- (NSString)recordEventUUID;
- (NSString)requestMHUUID;
- (NSString)ssvLogFilePath;
- (NSUUID)endpointId;
- (NSUUID)pendingAudioSessionActivationToken;
- (OS_dispatch_queue)mediaPlayingObserverQueue;
- (SOClockAlarmObserver)alarmMonitor;
- (SOClockTimerObserver)timerMonitor;
- (SOMediaNowPlayingObserver)mediaPlayingMonitor;
- (SSRSpeakerRecognitionController)speakerRecognitionController;
- (SSRVoiceProfileManager)voiceProfileManager;
- (double)getRecordBufferDuration;
- (double)lastEndOfVoiceActivityTime;
- (float)_scheduledAudibleFeedbackDelay;
- (float)cachedAvgPower;
- (float)cachedPeakPower;
- (float)getSmartSiriVolume;
- (float)getVolumeForTTSType:(unint64_t)a3;
- (id)_contextToString:(id)a3;
- (id)_createAlarmMonitor;
- (id)_createMediaPlayingMonitor;
- (id)_createTimerMonitor;
- (id)_fetchAudioDecoderForTV:(unsigned int)a3;
- (id)_fetchFallbackAudioSessionReleaseProviding;
- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4;
- (id)_getSpeechIdentifier;
- (id)_languageDetectorOptionFromSettings:(id)a3;
- (id)_mapScoresToSharedSiriId:(id)a3;
- (id)_processSpeakerRecognitionResult:(id)a3;
- (id)audioDeviceInfo;
- (id)endpointerModelVersion;
- (id)getAudioConverterForTest;
- (id)pendingAudioSessionActivationCompletion;
- (id)playbackRoute;
- (id)recordDeviceInfo;
- (id)recordRoute;
- (id)recordSettings;
- (id)supportsDuckingOnSpeakerOutputEvaluator;
- (id)voiceTriggerInfo;
- (int64_t)_currentAudioRecorderSampleRate;
- (unint64_t)_audibleFeedbackPlaybackReason;
- (unint64_t)_calculateEstimatedSpeechEndHostTimeWithStopOptions:(id)a3;
- (unint64_t)activeChannel;
- (unint64_t)alertStartTime;
- (unint64_t)decoderProcessedSampleCountForTV;
- (unint64_t)maxAllowedTrailingSamplesAfterSchedulingStop;
- (unint64_t)numTrailingSamplesAfterSchedulingStop;
- (unint64_t)outputReferenceChannel;
- (unint64_t)pendingAudioSessionActivationReason;
- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4;
- (void)CSSpeakerRecognitionAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5;
- (void)CSXPCClient:(id)a3 didDisconnect:(BOOL)a4;
- (void)_audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)_cancelPendingAudioSessionActivateForReason:(id)a3;
- (void)_createAudioPowerMeterIfNeeded;
- (void)_createLanguageDetectorIfNeeded;
- (void)_deviceAudioLoggingWithFileWriter:(id)a3;
- (void)_didStopForReason:(int64_t)a3;
- (void)_fetchMetricsAndLog;
- (void)_initializeAlarmState;
- (void)_initializeMediaPlayingState;
- (void)_initializeTimerState;
- (void)_logRecordingStopErrorIfNeeded:(int64_t)a3;
- (void)_performPendingAudioSessionActivateForReason:(id)a3;
- (void)_refreshSpeakerRecognitionAssets;
- (void)_scheduleActivateAudioSessionWithDelay:(double)a3 sessionActivateReason:(unint64_t)a4 scheduleReason:(id)a5 validator:(id)a6 completion:(id)a7;
- (void)_scheduleAudibleFeedbackAtStartRecording;
- (void)_setAlarmIsPlaying:(BOOL)a3;
- (void)_setMediaPlaybackState:(BOOL)a3 isInterrupted:(BOOL)a4;
- (void)_setSoundPlayingState;
- (void)_setTimerIsPlaying:(BOOL)a3;
- (void)_setupAudioProviderFromXPC:(id)a3;
- (void)_setupDownsamplerIfNeeded;
- (void)_setupSpeakerRecognitionController;
- (void)_startFeedbackForTwoShotAtTime:(double)a3;
- (void)_startPhaticDecision;
- (void)_startTwoShotFeedbackDecisionForDetectionAtTime:(double)a3;
- (void)_teardownAudioProviderIfNeeded;
- (void)_updateRecordContextIfNeeded:(id)a3;
- (void)audioAlertProvidingDidFinishAlertPlayback:(id)a3 ofType:(int64_t)a4 error:(id)a5;
- (void)audioConverterDidConvertPackets:(id)a3 packets:(id)a4 durationInSec:(float)a5 timestamp:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7;
- (void)audioDecoderDidDecodePackets:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 timestamp:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 wasBuffered:(BOOL)a9 receivedNumChannels:(unsigned int)a10;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4;
- (void)audioSessionProvider:(id)a3 didChangeContext:(BOOL)a4;
- (void)audioSessionProvider:(id)a3 didSetAudioSessionActive:(BOOL)a4;
- (void)audioSessionProvider:(id)a3 providerInvalidated:(BOOL)a4;
- (void)audioSessionProvider:(id)a3 willSetAudioSessionActive:(BOOL)a4;
- (void)audioSessionProviderBeginInterruption:(id)a3;
- (void)audioSessionProviderBeginInterruption:(id)a3 withContext:(id)a4;
- (void)audioSessionProviderEndInterruption:(id)a3;
- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4;
- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4;
- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4;
- (void)beginWaitingForMyriad;
- (void)cancelCurrentLanguageDetectorRequest;
- (void)clockAlarmObserver:(id)a3 alarmDidDismiss:(id)a4;
- (void)clockAlarmObserver:(id)a3 alarmDidFire:(id)a4;
- (void)clockTimerObserver:(id)a3 timerDidDismiss:(id)a4;
- (void)clockTimerObserver:(id)a3 timerDidFire:(id)a4;
- (void)continuousVoiceTrigger:(id)a3 detectedSilenceAfterVoiceTriggerAt:(double)a4;
- (void)continuousVoiceTrigger:(id)a3 detectedVoiceTriggerResult:(id)a4;
- (void)didFinishSpeakerRecognition:(id)a3;
- (void)didReceiveSpeakerRecognitionScoreCard:(id)a3;
- (void)didTTSVolumeChange:(id)a3 forReason:(unint64_t)a4;
- (void)endWaitingForMyriadWithDecision:(unint64_t)a3;
- (void)endpointer:(id)a3 detectedTwoShotAtTime:(double)a4;
- (void)fetchAudioMetricsWithCompletion:(id)a3;
- (void)getMitigationDecisionForRCId:(unint64_t)a3 requestId:(id)a4 completion:(id)a5;
- (void)handleStopRecordingRequestWithOptions:(id)a3;
- (void)keywordDetectorDidDetectKeyword;
- (void)languageDetectorSetMostRecentRecognitionLanguage:(id)a3;
- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6;
- (void)preheat;
- (void)processASRFeatures:(id)a3;
- (void)processRCWithId:(unint64_t)a3 requestId:(id)a4 speechPackage:(id)a5 taskId:(id)a6 forceAccept:(BOOL)a7 completionHandler:(id)a8;
- (void)releaseAudioSession;
- (void)releaseAudioSession:(unint64_t)a3;
- (void)reset;
- (void)resetAudioSession;
- (void)resetEndpointer;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setAlarmMonitor:(id)a3;
- (void)setAlertProvider:(id)a3;
- (void)setAsset:(id)a3;
- (void)setAudioDeviceInfoImpl:(id)a3;
- (void)setAudioFileWriter:(id)a3;
- (void)setAudioMeterProvider:(id)a3;
- (void)setAudioMetricProvider:(id)a3;
- (void)setAudioRecordContext:(id)a3;
- (void)setAudioSessionController:(id)a3;
- (void)setAudioStream:(id)a3;
- (void)setBundleIdFromDictation:(id)a3;
- (void)setCachedAvgPower:(float)a3;
- (void)setCachedPeakPower:(float)a3;
- (void)setCanPerformDelayedStop:(BOOL)a3;
- (void)setContinuousVoiceTrigger:(id)a3;
- (void)setDecoderProcessedSampleCountForTV:(unint64_t)a3;
- (void)setDecodersForTV:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDeliverFirstSpeechPacket:(BOOL)a3;
- (void)setDidDeliverLastBuffer:(BOOL)a3;
- (void)setDuckAudioXPCClient:(id)a3;
- (void)setDuckOthersOption:(BOOL)a3;
- (void)setEndpointAnalyzerDelegate:(id)a3;
- (void)setEndpointerOperationMode:(int64_t)a3;
- (void)setEndpointerProxy:(id)a3;
- (void)setHasPerformedDelayedStop:(BOOL)a3;
- (void)setHasRequestedTwoShotFeedback:(BOOL)a3;
- (void)setIsAlarmPlaying:(BOOL)a3;
- (void)setIsAsrOnDevice:(BOOL)a3;
- (void)setIsAudioSessionActivated:(BOOL)a3;
- (void)setIsHybridUODEnabled:(BOOL)a3;
- (void)setIsMediaPlaying:(BOOL)a3;
- (void)setIsNarrowBand:(BOOL)a3;
- (void)setIsOpus:(BOOL)a3;
- (void)setIsRemoteVADAvailableStream:(BOOL)a3;
- (void)setIsSiriClientListening:(BOOL)a3;
- (void)setIsSoundPlaying:(BOOL)a3;
- (void)setIsTimerPlaying:(BOOL)a3;
- (void)setLanguageDetector:(id)a3;
- (void)setLanguageDetectorDelegate:(id)a3;
- (void)setLanguageDetectorInteractionID:(id)a3;
- (void)setLogEventUUID:(id)a3;
- (void)setMaxAllowedTrailingSamplesAfterSchedulingStop:(unint64_t)a3;
- (void)setMediaPlayingMonitor:(id)a3;
- (void)setMediaPlayingObserverQueue:(id)a3;
- (void)setMeteringEnabled:(BOOL)a3;
- (void)setMyriadPreventingTwoShotFeedback:(BOOL)a3;
- (void)setNumTrailingSamplesAfterSchedulingStop:(unint64_t)a3;
- (void)setPendingAudioSessionActivationCompletion:(id)a3;
- (void)setPendingAudioSessionActivationReason:(unint64_t)a3;
- (void)setPendingAudioSessionActivationToken:(id)a3;
- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3;
- (void)setPowerMeter:(id)a3;
- (void)setRcHandlingClient:(id)a3;
- (void)setRecordEventUUID:(id)a3;
- (void)setRequestMHUUID:(id)a3;
- (void)setRequestedStopRecordingOptions:(id)a3;
- (void)setServerLoggingWriter:(id)a3;
- (void)setSessionProvider:(id)a3;
- (void)setSetupStarted:(BOOL)a3;
- (void)setShouldUseLanguageDetectorForCurrentRequest:(BOOL)a3;
- (void)setSmartSiriVolumeDirection:(BOOL)a3;
- (void)setSmartSiriVolumePercentage:(float)a3;
- (void)setSpeakerIdDelegate:(id)a3;
- (void)setSpeakerRecognitionController:(id)a3;
- (void)setSpeakerRecognitionProxy:(id)a3;
- (void)setSpeakerRecognitionScores:(id)a3;
- (void)setSpeechEndHostTimeEstimator:(id)a3;
- (void)setSsrAssets:(id)a3;
- (void)setSsvLogFilePath:(id)a3;
- (void)setStreamProvider:(id)a3;
- (void)setSupportHearstVoiceTrigger:(BOOL)a3;
- (void)setSupportPhatic:(BOOL)a3;
- (void)setSupportSessionActivateDelay:(BOOL)a3;
- (void)setSupportTriagleModeSessionActivationRetry:(BOOL)a3;
- (void)setSupportsDuckingOnSpeakerOutputEvaluator:(id)a3;
- (void)setTimerMonitor:(id)a3;
- (void)setTwoShotNotificationEnabled:(BOOL)a3;
- (void)setUncompressedAudioLogging:(id)a3;
- (void)setVoiceProfileManager:(id)a3;
- (void)setVolumeController:(id)a3;
- (void)setVolumeMonitor:(id)a3;
- (void)setXpcClient:(id)a3;
- (void)setXpcClientFactory:(id)a3;
- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4;
- (void)speakerRecognitionController:(id)a3 hasSpeakerInfo:(id)a4;
- (void)speakerRecognitionFinishedProcessing:(id)a3 withFinalSpeakerInfo:(id)a4;
- (void)startController;
- (void)stopEndpointer;
- (void)stopRecording;
- (void)stopRecordingWithOptions:(id)a3;
- (void)updateEndpointerDelayedTrigger:(BOOL)a3;
- (void)updateEndpointerThreshold:(float)a3;
- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5;
@end

@implementation CSSpeechController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_supportsDuckingOnSpeakerOutputEvaluator, 0);
  objc_storeStrong((id *)&self->_uncompressedAudioLogging, 0);
  objc_storeStrong((id *)&self->_rcHandlingClient, 0);
  objc_storeStrong((id *)&self->_audioSessionController, 0);
  objc_storeStrong((id *)&self->_endpointId, 0);
  objc_storeStrong((id *)&self->_audioDeviceInfoImpl, 0);
  objc_storeStrong((id *)&self->_volumeMonitor, 0);
  objc_storeStrong((id *)&self->_timerMonitor, 0);
  objc_storeStrong((id *)&self->_alarmMonitor, 0);
  objc_storeStrong((id *)&self->_mediaPlayingMonitor, 0);
  objc_storeStrong((id *)&self->_mediaPlayingObserverQueue, 0);
  objc_storeStrong((id *)&self->_ssvLogFilePath, 0);
  objc_storeStrong((id *)&self->_ssrAssets, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_voiceProfileManager, 0);
  objc_storeStrong((id *)&self->_speakerRecognitionController, 0);
  objc_storeStrong((id *)&self->_speakerRecognitionProxy, 0);
  objc_storeStrong((id *)&self->_logEventUUID, 0);
  objc_storeStrong((id *)&self->_decodersForTV, 0);
  objc_storeStrong((id *)&self->_requestedStopRecordingOptions, 0);
  objc_storeStrong((id *)&self->_requestMHUUID, 0);
  objc_storeStrong((id *)&self->_powerMeter, 0);
  objc_storeStrong((id *)&self->_duckAudioXPCClient, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_xpcClientFactory, 0);
  objc_storeStrong(&self->_pendingAudioSessionActivationCompletion, 0);
  objc_storeStrong((id *)&self->_pendingAudioSessionActivationToken, 0);
  objc_storeStrong((id *)&self->_languageDetector, 0);
  objc_storeStrong((id *)&self->_continuousVoiceTrigger, 0);
  objc_storeStrong((id *)&self->_bundleIdFromDictation, 0);
  objc_storeStrong((id *)&self->_speechEndHostTimeEstimator, 0);
  objc_storeStrong((id *)&self->_speakerRecognitionScores, 0);
  objc_storeStrong((id *)&self->_recordEventUUID, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_serverLoggingWriter, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_audioMetricProvider, 0);
  objc_storeStrong((id *)&self->_audioMeterProvider, 0);
  objc_storeStrong((id *)&self->_alertProvider, 0);
  objc_storeStrong((id *)&self->_sessionProvider, 0);
  objc_storeStrong((id *)&self->_streamProvider, 0);
  objc_storeStrong((id *)&self->_audioStream, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_endpointerProxy, 0);
  objc_destroyWeak((id *)&self->_speakerIdDelegate);
  objc_destroyWeak((id *)&self->_languageDetectorDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_twoShotAudibleFeedbackDecisionGroup, 0);
  objc_storeStrong((id *)&self->_audibleFeedbackQueue, 0);
  objc_storeStrong((id *)&self->_continuousZeroCounter, 0);
  objc_storeStrong((id *)&self->_lastRTSTriggerInfo, 0);
  objc_storeStrong((id *)&self->_lastVoiceTriggerInfo, 0);
  objc_storeStrong((id *)&self->_requestedRecordSettings, 0);
  objc_storeStrong((id *)&self->_downsampler, 0);
  objc_storeStrong((id *)&self->_audioConverter, 0);
  objc_storeStrong((id *)&self->_narrowBandOpusConverter, 0);
  objc_storeStrong((id *)&self->_opusAudioConverter, 0);
  objc_storeStrong((id *)&self->_contextResetQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
}

- (void)setSupportsDuckingOnSpeakerOutputEvaluator:(id)a3
{
}

- (id)supportsDuckingOnSpeakerOutputEvaluator
{
  return self->_supportsDuckingOnSpeakerOutputEvaluator;
}

- (void)setUncompressedAudioLogging:(id)a3
{
}

- (CSUncompressedAudioLogging)uncompressedAudioLogging
{
  return self->_uncompressedAudioLogging;
}

- (void)setRcHandlingClient:(id)a3
{
}

- (CSRCHandlingXPCClient)rcHandlingClient
{
  return self->_rcHandlingClient;
}

- (void)setAudioSessionController:(id)a3
{
}

- (CSAudioSessionController)audioSessionController
{
  return self->_audioSessionController;
}

- (void)setSetupStarted:(BOOL)a3
{
  self->_setupStarted = a3;
}

- (BOOL)setupStarted
{
  return self->_setupStarted;
}

- (NSUUID)endpointId
{
  return self->_endpointId;
}

- (void)setAudioDeviceInfoImpl:(id)a3
{
}

- (CSFAudioDeviceInfo)audioDeviceInfoImpl
{
  return self->_audioDeviceInfoImpl;
}

- (void)setVolumeMonitor:(id)a3
{
}

- (CSVolumeMonitor)volumeMonitor
{
  return self->_volumeMonitor;
}

- (void)setTimerMonitor:(id)a3
{
}

- (SOClockTimerObserver)timerMonitor
{
  return self->_timerMonitor;
}

- (void)setAlarmMonitor:(id)a3
{
}

- (SOClockAlarmObserver)alarmMonitor
{
  return self->_alarmMonitor;
}

- (void)setMediaPlayingMonitor:(id)a3
{
}

- (SOMediaNowPlayingObserver)mediaPlayingMonitor
{
  return self->_mediaPlayingMonitor;
}

- (void)setMediaPlayingObserverQueue:(id)a3
{
}

- (OS_dispatch_queue)mediaPlayingObserverQueue
{
  return self->_mediaPlayingObserverQueue;
}

- (void)setSsvLogFilePath:(id)a3
{
}

- (NSString)ssvLogFilePath
{
  return self->_ssvLogFilePath;
}

- (void)setSsrAssets:(id)a3
{
}

- (NSArray)ssrAssets
{
  return self->_ssrAssets;
}

- (void)setAsset:(id)a3
{
}

- (CSAsset)asset
{
  return self->_asset;
}

- (void)setVoiceProfileManager:(id)a3
{
}

- (SSRVoiceProfileManager)voiceProfileManager
{
  return self->_voiceProfileManager;
}

- (void)setSpeakerRecognitionController:(id)a3
{
}

- (SSRSpeakerRecognitionController)speakerRecognitionController
{
  return self->_speakerRecognitionController;
}

- (void)setSpeakerRecognitionProxy:(id)a3
{
}

- (CSSpeakerRecognitionProxy)speakerRecognitionProxy
{
  return self->_speakerRecognitionProxy;
}

- (void)setLogEventUUID:(id)a3
{
}

- (NSString)logEventUUID
{
  return self->_logEventUUID;
}

- (void)setDecoderProcessedSampleCountForTV:(unint64_t)a3
{
  self->_decoderProcessedSampleCountForTV = a3;
}

- (unint64_t)decoderProcessedSampleCountForTV
{
  return self->_decoderProcessedSampleCountForTV;
}

- (void)setDecodersForTV:(id)a3
{
}

- (NSMutableDictionary)decodersForTV
{
  return self->_decodersForTV;
}

- (void)setMaxAllowedTrailingSamplesAfterSchedulingStop:(unint64_t)a3
{
  self->_maxAllowedTrailingSamplesAfterSchedulingStop = a3;
}

- (unint64_t)maxAllowedTrailingSamplesAfterSchedulingStop
{
  return self->_maxAllowedTrailingSamplesAfterSchedulingStop;
}

- (void)setNumTrailingSamplesAfterSchedulingStop:(unint64_t)a3
{
  self->_numTrailingSamplesAfterSchedulingStop = a3;
}

- (unint64_t)numTrailingSamplesAfterSchedulingStop
{
  return self->_numTrailingSamplesAfterSchedulingStop;
}

- (void)setRequestedStopRecordingOptions:(id)a3
{
}

- (CSAudioStopStreamOption)requestedStopRecordingOptions
{
  return self->_requestedStopRecordingOptions;
}

- (void)setHasPerformedDelayedStop:(BOOL)a3
{
  self->_hasPerformedDelayedStop = a3;
}

- (BOOL)hasPerformedDelayedStop
{
  return self->_hasPerformedDelayedStop;
}

- (void)setCanPerformDelayedStop:(BOOL)a3
{
  self->_canPerformDelayedStop = a3;
}

- (BOOL)canPerformDelayedStop
{
  return self->_canPerformDelayedStop;
}

- (void)setRequestMHUUID:(id)a3
{
}

- (NSString)requestMHUUID
{
  return self->_requestMHUUID;
}

- (void)setDidDeliverFirstSpeechPacket:(BOOL)a3
{
  self->_didDeliverFirstSpeechPacket = a3;
}

- (BOOL)didDeliverFirstSpeechPacket
{
  return self->_didDeliverFirstSpeechPacket;
}

- (void)setDidDeliverLastBuffer:(BOOL)a3
{
  self->_didDeliverLastBuffer = a3;
}

- (BOOL)didDeliverLastBuffer
{
  return self->_didDeliverLastBuffer;
}

- (void)setPowerMeter:(id)a3
{
}

- (CSAudioPowerMeter)powerMeter
{
  return self->_powerMeter;
}

- (void)setCachedPeakPower:(float)a3
{
  self->_cachedPeakPower = a3;
}

- (float)cachedPeakPower
{
  return self->_cachedPeakPower;
}

- (void)setCachedAvgPower:(float)a3
{
  self->_cachedAvgPower = a3;
}

- (float)cachedAvgPower
{
  return self->_cachedAvgPower;
}

- (void)setDuckAudioXPCClient:(id)a3
{
}

- (CSXPCClient)duckAudioXPCClient
{
  return self->_duckAudioXPCClient;
}

- (void)setXpcClient:(id)a3
{
}

- (CSXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setXpcClientFactory:(id)a3
{
}

- (CSXPCClientFactory)xpcClientFactory
{
  return self->_xpcClientFactory;
}

- (void)setPendingAudioSessionActivationReason:(unint64_t)a3
{
  self->_pendingAudioSessionActivationReason = a3;
}

- (unint64_t)pendingAudioSessionActivationReason
{
  return self->_pendingAudioSessionActivationReason;
}

- (void)setPendingAudioSessionActivationCompletion:(id)a3
{
}

- (id)pendingAudioSessionActivationCompletion
{
  return self->_pendingAudioSessionActivationCompletion;
}

- (void)setPendingAudioSessionActivationToken:(id)a3
{
}

- (NSUUID)pendingAudioSessionActivationToken
{
  return self->_pendingAudioSessionActivationToken;
}

- (void)setShouldUseLanguageDetectorForCurrentRequest:(BOOL)a3
{
  self->_shouldUseLanguageDetectorForCurrentRequest = a3;
}

- (BOOL)shouldUseLanguageDetectorForCurrentRequest
{
  return self->_shouldUseLanguageDetectorForCurrentRequest;
}

- (void)setLanguageDetector:(id)a3
{
}

- (CSLanguageDetector)languageDetector
{
  return self->_languageDetector;
}

- (void)setContinuousVoiceTrigger:(id)a3
{
}

- (CSContinuousVoiceTrigger)continuousVoiceTrigger
{
  return self->_continuousVoiceTrigger;
}

- (void)setIsHybridUODEnabled:(BOOL)a3
{
  self->_isHybridUODEnabled = a3;
}

- (BOOL)isHybridUODEnabled
{
  return self->_isHybridUODEnabled;
}

- (void)setBundleIdFromDictation:(id)a3
{
}

- (NSString)bundleIdFromDictation
{
  return self->_bundleIdFromDictation;
}

- (void)setSpeechEndHostTimeEstimator:(id)a3
{
}

- (CSSpeechEndHostTimeEstimator)speechEndHostTimeEstimator
{
  return self->_speechEndHostTimeEstimator;
}

- (void)setMyriadPreventingTwoShotFeedback:(BOOL)a3
{
  self->_myriadPreventingTwoShotFeedback = a3;
}

- (BOOL)myriadPreventingTwoShotFeedback
{
  return self->_myriadPreventingTwoShotFeedback;
}

- (void)setIsRemoteVADAvailableStream:(BOOL)a3
{
  self->_isRemoteVADAvailableStream = a3;
}

- (BOOL)isRemoteVADAvailableStream
{
  return self->_isRemoteVADAvailableStream;
}

- (void)setIsSoundPlaying:(BOOL)a3
{
  self->_isSoundPlaying = a3;
}

- (BOOL)isSoundPlaying
{
  return self->_isSoundPlaying;
}

- (void)setIsTimerPlaying:(BOOL)a3
{
  self->_isTimerPlaying = a3;
}

- (BOOL)isTimerPlaying
{
  return self->_isTimerPlaying;
}

- (void)setIsAlarmPlaying:(BOOL)a3
{
  self->_isAlarmPlaying = a3;
}

- (BOOL)isAlarmPlaying
{
  return self->_isAlarmPlaying;
}

- (void)setIsMediaPlaying:(BOOL)a3
{
  self->_isMediaPlaying = a3;
}

- (BOOL)isMediaPlaying
{
  return self->_isMediaPlaying;
}

- (void)setTwoShotNotificationEnabled:(BOOL)a3
{
  self->_twoShotNotificationEnabled = a3;
}

- (BOOL)twoShotNotificationEnabled
{
  return self->_twoShotNotificationEnabled;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)setSpeakerRecognitionScores:(id)a3
{
}

- (NSDictionary)speakerRecognitionScores
{
  return self->_speakerRecognitionScores;
}

- (void)setIsAudioSessionActivated:(BOOL)a3
{
  self->_isAudioSessionActivated = a3;
}

- (BOOL)isAudioSessionActivated
{
  return self->_isAudioSessionActivated;
}

- (void)setRecordEventUUID:(id)a3
{
}

- (NSString)recordEventUUID
{
  return self->_recordEventUUID;
}

- (void)setVolumeController:(id)a3
{
}

- (CSSmartSiriVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setServerLoggingWriter:(id)a3
{
}

- (CSSelectiveChannelAudioFileWriter)serverLoggingWriter
{
  return self->_serverLoggingWriter;
}

- (void)setAudioFileWriter:(id)a3
{
}

- (CSPlainAudioFileWriter)audioFileWriter
{
  return self->_audioFileWriter;
}

- (void)setIsNarrowBand:(BOOL)a3
{
  self->_isNarrowBand = a3;
}

- (BOOL)isNarrowBand
{
  return self->_isNarrowBand;
}

- (void)setHasRequestedTwoShotFeedback:(BOOL)a3
{
  self->_hasRequestedTwoShotFeedback = a3;
}

- (BOOL)hasRequestedTwoShotFeedback
{
  return self->_hasRequestedTwoShotFeedback;
}

- (void)setIsSiriClientListening:(BOOL)a3
{
  self->_isSiriClientListening = a3;
}

- (BOOL)isSiriClientListening
{
  return self->_isSiriClientListening;
}

- (void)setIsOpus:(BOOL)a3
{
  self->_isOpus = a3;
}

- (BOOL)isOpus
{
  return self->_isOpus;
}

- (void)setIsAsrOnDevice:(BOOL)a3
{
  self->_isAsrOnDevice = a3;
}

- (BOOL)isAsrOnDevice
{
  return self->_isAsrOnDevice;
}

- (void)setAudioMetricProvider:(id)a3
{
}

- (CSAudioMetricProviding)audioMetricProvider
{
  return self->_audioMetricProvider;
}

- (void)setAudioMeterProvider:(id)a3
{
}

- (CSAudioMeterProviding)audioMeterProvider
{
  return self->_audioMeterProvider;
}

- (void)setAlertProvider:(id)a3
{
}

- (CSAudioAlertProviding)alertProvider
{
  return self->_alertProvider;
}

- (void)setSessionProvider:(id)a3
{
}

- (CSAudioSessionProviding)sessionProvider
{
  return self->_sessionProvider;
}

- (void)setStreamProvider:(id)a3
{
}

- (CSAudioStreamProviding)streamProvider
{
  return self->_streamProvider;
}

- (void)setAudioStream:(id)a3
{
}

- (CSAudioStream)audioStream
{
  return self->_audioStream;
}

- (void)setAudioRecordContext:(id)a3
{
}

- (CSAudioRecordContext)audioRecordContext
{
  return self->_audioRecordContext;
}

- (void)setEndpointerProxy:(id)a3
{
}

- (CSEndpointerProxy)endpointerProxy
{
  return self->_endpointerProxy;
}

- (void)setSupportSessionActivateDelay:(BOOL)a3
{
  self->_supportSessionActivateDelay = a3;
}

- (BOOL)supportSessionActivateDelay
{
  return self->_supportSessionActivateDelay;
}

- (void)setSupportTriagleModeSessionActivationRetry:(BOOL)a3
{
  self->_supportTriagleModeSessionActivationRetry = a3;
}

- (BOOL)supportTriagleModeSessionActivationRetry
{
  return self->_supportTriagleModeSessionActivationRetry;
}

- (void)setSupportHearstVoiceTrigger:(BOOL)a3
{
  self->_supportHearstVoiceTrigger = a3;
}

- (BOOL)supportHearstVoiceTrigger
{
  return self->_supportHearstVoiceTrigger;
}

- (void)setSupportPhatic:(BOOL)a3
{
  self->_supportPhatic = a3;
}

- (BOOL)supportPhatic
{
  return self->_supportPhatic;
}

- (void)setSpeakerIdDelegate:(id)a3
{
}

- (CSSpeakerIdentificationDelegate)speakerIdDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_speakerIdDelegate);
  return (CSSpeakerIdentificationDelegate *)WeakRetained;
}

- (void)setLanguageDetectorDelegate:(id)a3
{
}

- (CSLanguageDetectorDelegate)languageDetectorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_languageDetectorDelegate);
  return (CSLanguageDetectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSSpeechControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSSpeechControllerDelegate *)WeakRetained;
}

- (id)getAudioConverterForTest
{
  return self->_audioConverter;
}

- (void)_fetchMetricsAndLog
{
  if (arc4random_uniform(0x64u) <= 9)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_requestMHUUID];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__CSSpeechController__fetchMetricsAndLog__block_invoke;
    v5[3] = &unk_1E658A390;
    id v6 = v3;
    id v4 = v3;
    [(CSSpeechController *)self fetchAudioMetricsWithCompletion:v5];
  }
}

void __41__CSSpeechController__fetchMetricsAndLog__block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v4 = v22;
  if (isKindOfClass)
  {
    v5 = [v22 objectForKey:*MEMORY[0x1E4F15308]];
    objc_opt_class();
    char v6 = objc_opt_isKindOfClass();
    v7 = (void *)MEMORY[0x1E4F15318];
    v8 = (void *)MEMORY[0x1E4F15320];
    if (v6)
    {
      v9 = [v5 objectForKey:*MEMORY[0x1E4F15318]];
      v10 = [v5 objectForKey:*v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v11 = [v9 unsignedLongLongValue];
          uint64_t v12 = [v10 unsignedLongLongValue];
          if (v11)
          {
            if (v12)
            {
              v13 = [MEMORY[0x1E4F5D2D0] sharedLogger];
              [v13 logMHAssistantDaemonAudioSessionSetActivateContextWithMHUUID:*(void *)(a1 + 32) withSetActivateStarted:1];

              v14 = [MEMORY[0x1E4F5D2D0] sharedLogger];
              [v14 logMHAssistantDaemonAudioSessionSetActivateContextWithMHUUID:*(void *)(a1 + 32) withSetActivateStarted:0];
            }
          }
        }
      }
    }
    v15 = [v22 objectForKey:*MEMORY[0x1E4F15310]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v16 = [v15 objectForKey:*v7];
      v17 = [v15 objectForKey:*v8];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v18 = [v16 unsignedLongLongValue];
          uint64_t v19 = [v17 unsignedLongLongValue];
          if (v18)
          {
            if (v19)
            {
              v20 = [MEMORY[0x1E4F5D2D0] sharedLogger];
              [v20 logMHAssistantDaemonAudioSessionSetInactiveWithMHUUID:*(void *)(a1 + 32) withSetInactiveStarted:1];

              v21 = [MEMORY[0x1E4F5D2D0] sharedLogger];
              [v21 logMHAssistantDaemonAudioSessionSetInactiveWithMHUUID:*(void *)(a1 + 32) withSetInactiveStarted:0];
            }
          }
        }
      }
    }
    id v4 = v22;
  }
}

- (void)clockTimerObserver:(id)a3 timerDidDismiss:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CSSpeechController_clockTimerObserver_timerDidDismiss___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __57__CSSpeechController_clockTimerObserver_timerDidDismiss___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSSpeechController clockTimerObserver:timerDidDismiss:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Timer dismissed", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _setTimerIsPlaying:0];
}

- (void)clockTimerObserver:(id)a3 timerDidFire:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CSSpeechController_clockTimerObserver_timerDidFire___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__CSSpeechController_clockTimerObserver_timerDidFire___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSSpeechController clockTimerObserver:timerDidFire:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Timer firing", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _setTimerIsPlaying:1];
}

- (void)clockAlarmObserver:(id)a3 alarmDidDismiss:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CSSpeechController_clockAlarmObserver_alarmDidDismiss___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __57__CSSpeechController_clockAlarmObserver_alarmDidDismiss___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSSpeechController clockAlarmObserver:alarmDidDismiss:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Alarm dismissed", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _setAlarmIsPlaying:0];
}

- (void)clockAlarmObserver:(id)a3 alarmDidFire:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CSSpeechController_clockAlarmObserver_alarmDidFire___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__CSSpeechController_clockAlarmObserver_alarmDidFire___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSSpeechController clockAlarmObserver:alarmDidFire:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Alarm firing", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _setAlarmIsPlaying:1];
}

- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6
{
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__CSSpeechController_nowPlayingObserver_playbackStateDidChangeFrom_to_lastPlayingDate___block_invoke;
  v7[3] = &unk_1E658D3C8;
  v7[4] = self;
  v7[5] = a5;
  dispatch_async(queue, v7);
}

uint64_t __87__CSSpeechController_nowPlayingObserver_playbackStateDidChangeFrom_to_lastPlayingDate___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v8 = 136315394;
    v9 = "-[CSSpeechController nowPlayingObserver:playbackStateDidChangeFrom:to:lastPlayingDate:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Now Playing State has changed %d", (uint8_t *)&v8, 0x12u);
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == 4)
  {
    BOOL v5 = 0;
    uint64_t v6 = 1;
  }
  else
  {
    BOOL v5 = v4 == 1;
    uint64_t v6 = 0;
  }
  return [*(id *)(a1 + 32) _setMediaPlaybackState:v5 isInterrupted:v6];
}

- (void)_setTimerIsPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_isTimerPlaying = a3;
  BOOL v5 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    endpointId = self->_endpointId;
    int v9 = 136315651;
    __int16 v10 = "-[CSSpeechController _setTimerIsPlaying:]";
    __int16 v11 = 1026;
    BOOL v12 = v3;
    __int16 v13 = 2113;
    v14 = endpointId;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Timer is playing: %{public}d on accessory: %{private}@", (uint8_t *)&v9, 0x1Cu);
  }
  v7 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  int v8 = [(NSUUID *)self->_endpointId UUIDString];
  [v7 setIsTimerPlayingOnAccessory:v8 isTimerPlaying:self->_isTimerPlaying];
}

- (void)_setAlarmIsPlaying:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_isAlarmPlaying = a3;
  BOOL v5 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    endpointId = self->_endpointId;
    int v9 = 136315651;
    __int16 v10 = "-[CSSpeechController _setAlarmIsPlaying:]";
    __int16 v11 = 1026;
    BOOL v12 = v3;
    __int16 v13 = 2113;
    v14 = endpointId;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Alarm is playing: %{public}d on accessory: %{private}@", (uint8_t *)&v9, 0x1Cu);
  }
  v7 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  int v8 = [(NSUUID *)self->_endpointId UUIDString];
  [v7 setIsAlarmPlayingOnAccessory:v8 isAlarmPlaying:self->_isAlarmPlaying];
}

- (void)_setMediaPlaybackState:(BOOL)a3 isInterrupted:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_BOOL isMediaPlaying = a3;
  v7 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    endpointId = self->_endpointId;
    int v13 = 136315651;
    v14 = "-[CSSpeechController _setMediaPlaybackState:isInterrupted:]";
    __int16 v15 = 1026;
    BOOL v16 = v5;
    __int16 v17 = 2113;
    uint64_t v18 = endpointId;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Playback is active: %{public}d on accessory: %{private}@", (uint8_t *)&v13, 0x1Cu);
  }
  int v9 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  __int16 v10 = [(NSUUID *)self->_endpointId UUIDString];
  BOOL isMediaPlaying = self->_isMediaPlaying;
  BOOL v12 = [MEMORY[0x1E4F28F80] processInfo];
  [v12 systemUptime];
  objc_msgSend(v9, "setIsMediaPlayingOnAccessory:isMediaPlaying:isInterrupted:interruptedTime:", v10, isMediaPlaying, v4);
}

- (void)_teardownAudioProviderIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_contextResetQueue);
  xpcClient = self->_xpcClient;
  if (xpcClient)
  {
    [(CSXPCClient *)xpcClient disconnect];
    BOOL v4 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v10 = "-[CSSpeechController _teardownAudioProviderIfNeeded]";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    [(CSSpeechController *)self setStreamProvider:0];
    [(CSSpeechController *)self setSessionProvider:0];
    [(CSSpeechController *)self setAlertProvider:0];
    [(CSSpeechController *)self setAudioMeterProvider:0];
    [(CSSpeechController *)self setAudioMetricProvider:0];
    [(CSSpeechController *)self setAudioStream:0];
    [(CSContinuousVoiceTrigger *)self->_continuousVoiceTrigger setAudioTimeConverter:0];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__CSSpeechController__teardownAudioProviderIfNeeded__block_invoke;
    block[3] = &unk_1E658D4D8;
    block[4] = self;
    dispatch_async(queue, block);
  }
  duckAudioXPCClient = self->_duckAudioXPCClient;
  if (duckAudioXPCClient)
  {
    [(CSXPCClient *)duckAudioXPCClient setDelegate:0];
    [(CSXPCClient *)self->_duckAudioXPCClient disconnect];
    v7 = self->_duckAudioXPCClient;
    self->_duckAudioXPCClient = 0;
  }
}

uint64_t __52__CSSpeechController__teardownAudioProviderIfNeeded__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 121) = 0;
  return result;
}

- (void)CSLanguageCodeUpdateMonitor:(id)a3 didReceiveLanguageCodeChanged:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v10 = "-[CSSpeechController CSLanguageCodeUpdateMonitor:didReceiveLanguageCodeChanged:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s _currentLanguageCode changed: %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__CSSpeechController_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __80__CSSpeechController_CSLanguageCodeUpdateMonitor_didReceiveLanguageCodeChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshSpeakerRecognitionAssets];
}

- (void)CSXPCClient:(id)a3 didDisconnect:(BOOL)a4
{
  id v5 = a3;
  contextResetQueue = self->_contextResetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CSSpeechController_CSXPCClient_didDisconnect___block_invoke;
  block[3] = &unk_1E658D4B0;
  id v11 = v5;
  id v12 = self;
  id v7 = v5;
  dispatch_async(contextResetQueue, block);
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__CSSpeechController_CSXPCClient_didDisconnect___block_invoke_383;
  v9[3] = &unk_1E658D4D8;
  v9[4] = self;
  dispatch_async(queue, v9);
}

void __48__CSSpeechController_CSXPCClient_didDisconnect___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = (os_log_t *)MEMORY[0x1E4F5D168];
  BOOL v3 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[CSSpeechController CSXPCClient:didDisconnect:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s XPCConnection disconnected", (uint8_t *)&v6, 0xCu);
  }
  BOOL v4 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v4[43])
  {
    id v5 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[CSSpeechController CSXPCClient:didDisconnect:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s reset audioProvider since xpcClient disconnected", (uint8_t *)&v6, 0xCu);
      BOOL v4 = *(void **)(a1 + 40);
    }
    [v4 _teardownAudioProviderIfNeeded];
  }
}

uint64_t __48__CSSpeechController_CSXPCClient_didDisconnect___block_invoke_383(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 121) = 0;
  return result;
}

- (void)voiceTriggerAssetHandler:(id)a3 endpointId:(id)a4 didChangeCachedAsset:(id)a5
{
  id v8 = a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = a5;
  endpointId = self->_endpointId;
  if (endpointId)
  {
    id v12 = [(NSUUID *)endpointId UUIDString];
    if ([v12 isEqualToString:v9])
    {

LABEL_7:
      [(CSContinuousVoiceTrigger *)self->_continuousVoiceTrigger setAsset:v10];
      queue = self->_queue;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __79__CSSpeechController_voiceTriggerAssetHandler_endpointId_didChangeCachedAsset___block_invoke;
      v15[3] = &unk_1E658D4B0;
      v15[4] = self;
      id v16 = v10;
      dispatch_async(queue, v15);

      goto LABEL_8;
    }
    uint64_t v13 = v9 | (unint64_t)self->_endpointId;

    if (!v13) {
      goto LABEL_7;
    }
  }
  else if (!v9)
  {
    goto LABEL_7;
  }
LABEL_8:
}

void __79__CSSpeechController_voiceTriggerAssetHandler_endpointId_didChangeCachedAsset___block_invoke(uint64_t a1)
{
}

- (void)CSSpeakerRecognitionAssetDownloadMonitor:(id)a3 didInstallNewAsset:(BOOL)a4 assetProviderType:(unint64_t)a5
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__CSSpeechController_CSSpeakerRecognitionAssetDownloadMonitor_didInstallNewAsset_assetProviderType___block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __100__CSSpeechController_CSSpeakerRecognitionAssetDownloadMonitor_didInstallNewAsset_assetProviderType___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) _refreshSpeakerRecognitionAssets];
  v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 456);
    int v4 = 136315394;
    id v5 = "-[CSSpeechController CSSpeakerRecognitionAssetDownloadMonitor:didInstallNewAsset:assetProviderType:]_block_invoke";
    __int16 v6 = 2114;
    uint64_t v7 = v3;
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Received SSR asset download notification, updated asset cache to %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)_mapScoresToSharedSiriId:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CA60];
  if ([v4 count]) {
    uint64_t v6 = [v4 count];
  }
  else {
    uint64_t v6 = 1;
  }
  uint64_t v7 = [v5 dictionaryWithCapacity:v6];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v9)
  {
    uint64_t v11 = v9;
    uint64_t v12 = *(void *)v30;
    *(void *)&long long v10 = 136315394;
    long long v28 = v10;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        __int16 v15 = objc_msgSend(v8, "objectForKeyedSubscript:", v14, v28, (void)v29);
        [v15 floatValue];
        float v17 = v16;

        if (v17 <= 1.0) {
          float v18 = v17;
        }
        else {
          float v18 = 1.0;
        }
        if (v18 < 0.0) {
          float v18 = 0.0;
        }
        uint64_t v19 = (int)vcvtpd_s64_f64(v18 * 100.0);
        v20 = [(SSRVoiceProfileManager *)self->_voiceProfileManager voiceProfileForId:v14];
        v21 = v20;
        if (v20)
        {
          id v22 = [v20 siriProfileId];

          v23 = [NSNumber numberWithInteger:v19];
          if (v22)
          {
            v24 = [v21 siriProfileId];
            [v7 setObject:v23 forKey:v24];

            goto LABEL_21;
          }
        }
        else
        {
          v25 = *MEMORY[0x1E4F5D168];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v28;
            v34 = "-[CSSpeechController _mapScoresToSharedSiriId:]";
            __int16 v35 = 2112;
            uint64_t v36 = v14;
            _os_log_impl(&dword_1C9338000, v25, OS_LOG_TYPE_DEFAULT, "%s Voice Profile for profileID %@ not found", buf, 0x16u);
          }
          v23 = [NSNumber numberWithInteger:v19];
        }
        [v7 setObject:v23 forKey:v14];
LABEL_21:
      }
      uint64_t v11 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v11);
  }

  v26 = (void *)[v7 copy];
  return v26;
}

- (id)_processSpeakerRecognitionResult:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[v4 mutableCopy];
  uint64_t v6 = *MEMORY[0x1E4FA57D8];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4FA57D8]];

  id v8 = [(CSSpeechController *)self _mapScoresToSharedSiriId:v7];

  if (v8)
  {
    uint64_t v9 = +[CSUserIdentityClassifier pickTopScoringProfileIdFromScores:v8];
    if (v9)
    {
      [v5 setObject:v9 forKeyedSubscript:@"userClassified"];
    }
    else
    {
      long long v10 = *MEMORY[0x1E4F5D168];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
      {
        int v23 = 136315394;
        v24 = "-[CSSpeechController _processSpeakerRecognitionResult:]";
        __int16 v25 = 2114;
        v26 = v8;
        _os_log_error_impl(&dword_1C9338000, v10, OS_LOG_TYPE_ERROR, "%s ERR: Failed to get classified user from %{public}@", (uint8_t *)&v23, 0x16u);
      }
    }
    uint64_t v11 = *MEMORY[0x1E4F5D790];
    uint64_t v12 = [(NSDictionary *)self->_lastVoiceTriggerInfo objectForKey:*MEMORY[0x1E4F5D790]];
    if (v12)
    {
      uint64_t v13 = [(NSDictionary *)self->_lastVoiceTriggerInfo objectForKeyedSubscript:v11];
      uint64_t v14 = [v13 integerValue];
    }
    else
    {
      uint64_t v14 = 0;
    }

    unint64_t v15 = +[CSUserIdentityClassifier classifyUserIdentityFor:v9 withScores:v8 withAsset:self->_asset withPhId:v14];
    float v16 = [NSNumber numberWithUnsignedInteger:v15];
    [v5 setObject:v16 forKeyedSubscript:@"userIdentityClassification"];

    [v5 setObject:v8 forKeyedSubscript:v6];
  }
  if (self->_mediaPlayingMonitor)
  {
    float v17 = [NSNumber numberWithBool:self->_isMediaPlaying];
    [v5 setObject:v17 forKeyedSubscript:@"mediaPlayState"];
  }
  else
  {
    [v5 setObject:&unk_1F23C48B0 forKeyedSubscript:@"mediaPlayState"];
  }
  volumeMonitor = self->_volumeMonitor;
  if (volumeMonitor)
  {
    uint64_t v19 = NSNumber;
    [(CSVolumeMonitor *)volumeMonitor musicVolume];
    v20 = objc_msgSend(v19, "numberWithFloat:");
    [v5 setObject:v20 forKeyedSubscript:@"musicVolume"];
  }
  else
  {
    [v5 setObject:&unk_1F23C48B0 forKeyedSubscript:@"musicVolume"];
  }
  v21 = (void *)[v5 copy];

  return v21;
}

- (void)didFinishSpeakerRecognition:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CSSpeechController_didFinishSpeakerRecognition___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __50__CSSpeechController_didFinishSpeakerRecognition___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
  if (WeakRetained)
  {
    int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 118);

    if (v3)
    {
      id v4 = *MEMORY[0x1E4F5D168];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
      {
        id v5 = *(void **)(a1 + 40);
        int v12 = 136315394;
        uint64_t v13 = "-[CSSpeechController didFinishSpeakerRecognition:]_block_invoke";
        __int16 v14 = 2114;
        id v15 = v5;
        _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s SSR Final ScoreCard - %{public}@", (uint8_t *)&v12, 0x16u);
      }
      id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
      [v6 speakerIdentificationDidDetectSpeakerWithScores:*(void *)(a1 + 40)];
      goto LABEL_8;
    }
  }
  uint64_t v7 = (void *)*MEMORY[0x1E4F5D170];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D170], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (id *)(*(void *)(a1 + 32) + 160);
    id v6 = v7;
    id v9 = objc_loadWeakRetained(v8);
    int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 118);
    int v12 = 136315650;
    uint64_t v13 = "-[CSSpeechController didFinishSpeakerRecognition:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v9;
    __int16 v16 = 1024;
    int v17 = v10;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s Discarded speakerId scores for {%@, %d} activation", (uint8_t *)&v12, 0x1Cu);

LABEL_8:
  }
  [*(id *)(*(void *)(a1 + 32) + 232) addContextKey:@"multiuser" withContext:*(void *)(a1 + 40)];
  uint64_t v11 = +[CSP2PService sharedInstance];
  [v11 sendCoreSpeechGradingDataToNearbyPeer];
}

- (void)didReceiveSpeakerRecognitionScoreCard:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CSSpeechController_didReceiveSpeakerRecognitionScoreCard___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __60__CSSpeechController_didReceiveSpeakerRecognitionScoreCard___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
  if (WeakRetained && (int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 118), WeakRetained, v3))
  {
    id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
    [v9 speakerIdentificationDidDetectSpeakerWithScores:*(void *)(a1 + 40)];
  }
  else
  {
    id v4 = (void *)*MEMORY[0x1E4F5D170];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D170], OS_LOG_TYPE_DEFAULT))
    {
      id v5 = (id *)(*(void *)(a1 + 32) + 160);
      id v6 = v4;
      id v7 = objc_loadWeakRetained(v5);
      int v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 118);
      *(_DWORD *)buf = 136315650;
      uint64_t v11 = "-[CSSpeechController didReceiveSpeakerRecognitionScoreCard:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v7;
      __int16 v14 = 1024;
      int v15 = v8;
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s Discarded speakerId scores for {%@, %d} activation", buf, 0x1Cu);
    }
  }
}

- (void)speakerRecognitionFinishedProcessing:(id)a3 withFinalSpeakerInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__CSSpeechController_speakerRecognitionFinishedProcessing_withFinalSpeakerInfo___block_invoke;
  block[3] = &unk_1E658D3F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __80__CSSpeechController_speakerRecognitionFinishedProcessing_withFinalSpeakerInfo___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  int v3 = *(void **)(a1 + 40);
  id v4 = (void *)v2[54];
  if (v4 != v3)
  {
    id v5 = *MEMORY[0x1E4F5D170];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D170], OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315650;
      long long v30 = "-[CSSpeechController speakerRecognitionFinishedProcessing:withFinalSpeakerInfo:]_block_invoke";
      __int16 v31 = 2114;
      id v32 = v4;
      __int16 v33 = 2114;
      v34 = v3;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s SpeakerIdInfo from incorrect SpeakerRecognizer: expected: %{public}@, spkrRecognizer: %{public}@", (uint8_t *)&v29, 0x20u);
    }
    return;
  }
  uint64_t v6 = [v2 _processSpeakerRecognitionResult:*(void *)(a1 + 48)];
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(void **)(v7 + 264);
  *(void *)(v7 + 264) = v6;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
  if (WeakRetained)
  {
    int v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 118);

    if (v10)
    {
      uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 264) objectForKeyedSubscript:@"userIdentityClassification"];
      unsigned int v12 = [v11 unsignedIntValue];

      id v13 = (void *)*MEMORY[0x1E4F5D170];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D170], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v12;
        int v15 = v13;
        uint64_t v16 = +[CSUserIdentityClassifier stringFromClassificationCategory:v14];
        int v17 = [*(id *)(*(void *)(a1 + 32) + 264) objectForKeyedSubscript:@"userClassified"];
        uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 264) objectForKeyedSubscript:*MEMORY[0x1E4FA57D8]];
        int v29 = 136315906;
        long long v30 = "-[CSSpeechController speakerRecognitionFinishedProcessing:withFinalSpeakerInfo:]_block_invoke";
        __int16 v31 = 2114;
        id v32 = v16;
        __int16 v33 = 2114;
        v34 = v17;
        __int16 v35 = 2114;
        uint64_t v36 = v18;
        _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s UserClassification: %{public}@ UserIdentified: %{public}@ Scores: %{public}@", (uint8_t *)&v29, 0x2Au);
      }
      uint64_t v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 160));
      id v20 = (id)[*(id *)(*(void *)(a1 + 32) + 264) copy];
      [v19 speakerIdentificationDidDetectSpeakerWithScores:v20];
      goto LABEL_11;
    }
  }
  v21 = (void *)*MEMORY[0x1E4F5D170];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D170], OS_LOG_TYPE_DEFAULT))
  {
    id v22 = (id *)(*(void *)(a1 + 32) + 160);
    uint64_t v19 = v21;
    id v20 = objc_loadWeakRetained(v22);
    int v23 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 118);
    int v29 = 136315650;
    long long v30 = "-[CSSpeechController speakerRecognitionFinishedProcessing:withFinalSpeakerInfo:]_block_invoke";
    __int16 v31 = 2112;
    id v32 = v20;
    __int16 v33 = 1024;
    LODWORD(v34) = v23;
    _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_DEFAULT, "%s Discarded speakerId scores for {%@, %d} activation", (uint8_t *)&v29, 0x1Cu);
LABEL_11:
  }
  uint64_t v24 = *MEMORY[0x1E4FA57E0];
  __int16 v25 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4FA57E0]];

  if (v25)
  {
    v26 = *(void **)(*(void *)(a1 + 32) + 232);
    uint64_t v27 = [*(id *)(a1 + 48) objectForKeyedSubscript:v24];
    [v26 addContextKey:@"ssrmeta" fromMetaFile:v27];
  }
  [*(id *)(*(void *)(a1 + 32) + 232) addContextKey:@"multiuser" withContext:*(void *)(*(void *)(a1 + 32) + 264)];
  long long v28 = +[CSP2PService sharedInstance];
  [v28 sendCoreSpeechGradingDataToNearbyPeer];
}

- (void)speakerRecognitionController:(id)a3 hasSpeakerInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CSSpeechController_speakerRecognitionController_hasSpeakerInfo___block_invoke;
  block[3] = &unk_1E658D3F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __66__CSSpeechController_speakerRecognitionController_hasSpeakerInfo___block_invoke(void *a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  int v3 = (void *)a1[5];
  id v4 = (void *)v2[54];
  if (v4 == v3)
  {
    uint64_t v6 = [v2 _processSpeakerRecognitionResult:a1[6]];
    uint64_t v7 = a1[4];
    int v8 = *(void **)(v7 + 264);
    *(void *)(v7 + 264) = v6;

    id v9 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(a1[4] + 264);
      int v27 = 136315394;
      long long v28 = "-[CSSpeechController speakerRecognitionController:hasSpeakerInfo:]_block_invoke";
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s _speakerRecognitionScores:%@", (uint8_t *)&v27, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 160));
    if (WeakRetained && (int v12 = *(unsigned __int8 *)(a1[4] + 118), WeakRetained, v12))
    {
      id v13 = [*(id *)(a1[4] + 264) objectForKeyedSubscript:@"userIdentityClassification"];
      unsigned int v14 = [v13 unsignedIntValue];

      int v15 = (void *)*MEMORY[0x1E4F5D170];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D170], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v14;
        int v17 = v15;
        uint64_t v18 = +[CSUserIdentityClassifier stringFromClassificationCategory:v16];
        uint64_t v19 = [*(id *)(a1[4] + 264) objectForKeyedSubscript:@"userClassified"];
        id v20 = [*(id *)(a1[4] + 264) objectForKeyedSubscript:*MEMORY[0x1E4FA57D8]];
        int v27 = 136315906;
        long long v28 = "-[CSSpeechController speakerRecognitionController:hasSpeakerInfo:]_block_invoke";
        __int16 v29 = 2114;
        id v30 = v18;
        __int16 v31 = 2114;
        id v32 = v19;
        __int16 v33 = 2114;
        v34 = v20;
        _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_DEFAULT, "%s UserClassification: %{public}@ UserIdentified: %{public}@ Scores: %{public}@", (uint8_t *)&v27, 0x2Au);
      }
      v21 = objc_loadWeakRetained((id *)(a1[4] + 160));
      id v22 = (void *)[*(id *)(a1[4] + 264) copy];
      [v21 speakerIdentificationDidDetectSpeakerWithScores:v22];
    }
    else
    {
      int v23 = (void *)*MEMORY[0x1E4F5D170];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D170], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v24 = (id *)(a1[4] + 160);
      v21 = v23;
      id v25 = objc_loadWeakRetained(v24);
      int v26 = *(unsigned __int8 *)(a1[4] + 118);
      int v27 = 136315650;
      long long v28 = "-[CSSpeechController speakerRecognitionController:hasSpeakerInfo:]_block_invoke";
      __int16 v29 = 2112;
      id v30 = v25;
      __int16 v31 = 1024;
      LODWORD(v32) = v26;
      _os_log_impl(&dword_1C9338000, v21, OS_LOG_TYPE_DEFAULT, "%s Discarded speakerId scores for {%@, %d} activation", (uint8_t *)&v27, 0x1Cu);
    }
  }
  else
  {
    id v5 = *MEMORY[0x1E4F5D170];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D170], OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 136315650;
      long long v28 = "-[CSSpeechController speakerRecognitionController:hasSpeakerInfo:]_block_invoke";
      __int16 v29 = 2114;
      id v30 = v4;
      __int16 v31 = 2114;
      id v32 = v3;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s SpeakerIdInfo from incorrect SpeakerRecognizer: expected: %{public}@, spkrRecognizer: %{public}@", (uint8_t *)&v27, 0x20u);
    }
  }
}

- (void)_setSoundPlayingState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL isMediaPlaying = self->_isMediaPlaying;
  BOOL isAlarmPlaying = self->_isAlarmPlaying;
  BOOL isTimerPlaying = self->_isTimerPlaying;
  self->_isSoundPlaying = isAlarmPlaying || isMediaPlaying || isTimerPlaying;
  id v5 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = &stru_1F2396200;
    int v7 = 136316162;
    int v8 = "-[CSSpeechController _setSoundPlayingState]";
    __int16 v9 = 2114;
    if (!isAlarmPlaying && !isMediaPlaying && !isTimerPlaying) {
      uint64_t v6 = @" NOT";
    }
    id v10 = v6;
    __int16 v11 = 1024;
    BOOL v12 = isMediaPlaying;
    __int16 v13 = 1024;
    BOOL v14 = isAlarmPlaying;
    __int16 v15 = 1024;
    BOOL v16 = isTimerPlaying;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Detected sound is%{public}@ playing: media(%d) alarm(%d) timer(%d)", (uint8_t *)&v7, 0x28u);
  }
}

- (void)endWaitingForMyriadWithDecision:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[CSSpeechController endWaitingForMyriadWithDecision:]";
    __int16 v8 = 2048;
    unint64_t v9 = a3;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Received Myriad finished with decision: %tu", (uint8_t *)&v6, 0x16u);
  }
  if ([MEMORY[0x1E4F5D450] shouldDelayTwoShotFeedbackForMyriadDecision])
  {
    self->_myriadPreventingTwoShotFeedback = a3 > 1;
    dispatch_group_leave((dispatch_group_t)self->_twoShotAudibleFeedbackDecisionGroup);
  }
}

- (void)beginWaitingForMyriad
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v3 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSSpeechController beginWaitingForMyriad]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s Received Myriad started", (uint8_t *)&v4, 0xCu);
  }
  if ([MEMORY[0x1E4F5D450] shouldDelayTwoShotFeedbackForMyriadDecision]) {
    dispatch_group_enter((dispatch_group_t)self->_twoShotAudibleFeedbackDecisionGroup);
  }
}

- (void)setLanguageDetectorInteractionID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CSSpeechController_setLanguageDetectorInteractionID___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __55__CSSpeechController_setLanguageDetectorInteractionID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 304) setInteractionIDforCurrentRequest:*(void *)(a1 + 40)];
}

- (void)cancelCurrentLanguageDetectorRequest
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CSSpeechController_cancelCurrentLanguageDetectorRequest__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __58__CSSpeechController_cancelCurrentLanguageDetectorRequest__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[CSSpeechController cancelCurrentLanguageDetectorRequest]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Cancelling current language detector request !", (uint8_t *)&v4, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 130) = 0;
  return [*(id *)(*(void *)(a1 + 32) + 304) cancelCurrentRequest];
}

- (void)languageDetectorSetMostRecentRecognitionLanguage:(id)a3
{
}

- (void)setPermanentVolumeOffsetWithDirection:(BOOL)a3
{
  if (!self->_endpointId)
  {
    [(CSSmartSiriVolumeController *)self->_volumeController setPermanentVolumeOffsetWithDirection:a3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechControllerDidUpdateSmartSiriVolume:self forReason:4];
  }
}

- (void)setSmartSiriVolumeDirection:(BOOL)a3
{
  if (!self->_endpointId)
  {
    [(CSSmartSiriVolumeController *)self->_volumeController setSmartSiriVolumeDirection:a3];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechControllerDidUpdateSmartSiriVolume:self forReason:4];
  }
}

- (void)setSmartSiriVolumePercentage:(float)a3
{
  if (!self->_endpointId)
  {
    -[CSSmartSiriVolumeController setSmartSiriVolumePercentage:](self->_volumeController, "setSmartSiriVolumePercentage:");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechControllerDidUpdateSmartSiriVolume:self forReason:4];
  }
}

- (float)getSmartSiriVolume
{
  [(CSSpeechController *)self getVolumeForTTSType:2];
  return result;
}

- (float)getVolumeForTTSType:(unint64_t)a3
{
  if (self->_endpointId) {
    return -1000.0;
  }
  id v5 = [(CSSmartSiriVolumeController *)self->_volumeController getVolumeForTTSType:a3 withContext:0];
  uint64_t v6 = v5;
  if (v5)
  {
    int v7 = [v5 debugLogPath];
    ssvLogFilePath = self->_ssvLogFilePath;
    self->_ssvLogFilePath = v7;

    [v6 volumeEstimate];
    float v3 = v9;
  }
  else
  {
    float v3 = -1000.0;
  }

  return v3;
}

- (BOOL)isSmartSiriVolumeAvailable
{
  if (CSIsHorseman()) {
    return 1;
  }
  return CSIsHorsemanJunior();
}

- (void)shouldAcceptEagerResultForDuration:(double)a3 resultsCompletionHandler:(id)a4
{
}

- (void)updateEndpointerDelayedTrigger:(BOOL)a3
{
}

- (void)updateEndpointerThreshold:(float)a3
{
}

- (id)endpointerModelVersion
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F5D450] supportHybridEndpointer])
  {
    if (self->_isAsrOnDevice)
    {
      float v3 = *MEMORY[0x1E4F5D168];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        uint64_t v10 = "-[CSSpeechController endpointerModelVersion]";
        int v4 = "%s return hybrid model version for sirix request";
LABEL_12:
        _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v9, 0xCu);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
    if ((CSIsHorseman() & 1) != 0 || AFShouldRunAsrOnServerForUOD())
    {
      float v3 = *MEMORY[0x1E4F5D168];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        uint64_t v10 = "-[CSSpeechController endpointerModelVersion]";
        int v4 = "%s return hybrid model version for request on HomePod or supported device + locale";
        goto LABEL_12;
      }
LABEL_13:
      uint64_t v6 = @"3";
      goto LABEL_14;
    }
    uint64_t v6 = [(CSEndpointerProxy *)self->_endpointerProxy endpointerModelVersion];
    id v8 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315394;
      uint64_t v10 = "-[CSSpeechController endpointerModelVersion]";
      __int16 v11 = 2114;
      BOOL v12 = v6;
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Queried endpointerModelVersion: %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    id v5 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      uint64_t v10 = "-[CSSpeechController endpointerModelVersion]";
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s endpointerModelVersion called when HEP is not supported", (uint8_t *)&v9, 0xCu);
    }
    uint64_t v6 = @"NA";
  }
LABEL_14:
  return v6;
}

- (double)lastEndOfVoiceActivityTime
{
  [(CSEndpointerProxy *)self->_endpointerProxy lastEndOfVoiceActivityTime];
  return result;
}

- (unint64_t)_audibleFeedbackPlaybackReason
{
  return 3;
}

- (float)_scheduledAudibleFeedbackDelay
{
  return 0.35;
}

- (BOOL)_canPlayTwoShotFeedbackDuringMediaPlayback
{
  if ([(CSAudioRecordContext *)self->_audioRecordContext isJarvisVoiceTriggered]) {
    return 1;
  }
  audioRecordContext = self->_audioRecordContext;
  return [(CSAudioRecordContext *)audioRecordContext isHearstVoiceTriggered];
}

- (id)_contextToString:(id)a3
{
  if (a3)
  {
    int v4 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F152E0]];
    int v5 = [v4 unsignedIntValue];

    objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", (v5 >> 24), (v5 << 8 >> 24), ((__int16)v5 >> 8), (char)v5);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = @"none";
  }
  return v6;
}

- (void)_deviceAudioLoggingWithFileWriter:(id)a3
{
  if (a3)
  {
    int v4 = (void *)MEMORY[0x1E4F5D1C8];
    id v5 = a3;
    id v6 = [(CSSpeechController *)self _getSpeechIdentifier];
    [v4 generateDeviceAudioLogging:v5 speechId:v6];
  }
}

- (id)_getSpeechIdentifier
{
  v2 = _AFPreferencesValueForKey();
  uint64_t v3 = [v2 allKeys];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = [v2 allKeys];
    id v6 = [v5 objectAtIndex:0];
    int v7 = CSKeychainValueForAccountAndKey(v6, @"Speech Identifier");

    id v8 = (__CFString *)[[NSString alloc] initWithData:v7 encoding:4];
  }
  else
  {
    id v8 = &stru_1F2396200;
  }

  return v8;
}

- (id)_fetchFallbackAudioSessionReleaseProviding
{
  v2 = [(CSXPCClientFactory *)self->_xpcClientFactory clientForFallbackAudioSessionReleaseProviding];
  [v2 connect];
  return v2;
}

- (void)_setupAudioProviderFromXPC:(id)a3
{
  id v10 = a3;
  [(CSSpeechController *)self setStreamProvider:v10];
  [(CSSpeechController *)self setSessionProvider:v10];
  [(CSSpeechController *)self setAlertProvider:v10];
  [(CSSpeechController *)self setAudioMeterProvider:v10];
  [(CSSpeechController *)self setAudioMetricProvider:v10];
  uint64_t v4 = [(CSSpeechController *)self sessionProvider];
  [v4 setAudioSessionDelegate:self];

  id v5 = [(CSSpeechController *)self alertProvider];
  [v5 setAudioAlertDelegate:self];

  BOOL v6 = [(CSSpeechController *)self _isHubRequestTV];
  continuousVoiceTrigger = self->_continuousVoiceTrigger;
  if (v6)
  {
    id v8 = [MEMORY[0x1E4F5D250] sharedInstance];
    int v9 = [v8 defaultConverter];
    [(CSContinuousVoiceTrigger *)continuousVoiceTrigger setAudioTimeConverter:v9];
  }
  else
  {
    [(CSContinuousVoiceTrigger *)continuousVoiceTrigger setAudioTimeConverter:v10];
  }
}

- (BOOL)_createAudioProviderFromXPCWithContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  xpcClient = self->_xpcClient;
  if (xpcClient)
  {
    if ([(CSXPCClient *)xpcClient isConnected])
    {
      BOOL v6 = 1;
      goto LABEL_17;
    }
  }
  else
  {
    int v7 = (os_log_t *)MEMORY[0x1E4F5D168];
    id v8 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      uint64_t v17 = "-[CSSpeechController _createAudioProviderFromXPCWithContext:]";
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Creating xpcClient", (uint8_t *)&v16, 0xCu);
    }
    uint64_t v9 = [(CSXPCClientFactory *)self->_xpcClientFactory clientForAudioProviding];
    if (!v9)
    {
      BOOL v14 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        int v16 = 136315138;
        uint64_t v17 = "-[CSSpeechController _createAudioProviderFromXPCWithContext:]";
        _os_log_error_impl(&dword_1C9338000, v14, OS_LOG_TYPE_ERROR, "%s Unable to setup audioProvider", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_16;
    }
    id v10 = (void *)v9;
    [(CSSpeechController *)self setXpcClient:v9];
    [v10 setDelegate:self];
  }
  __int16 v11 = (os_log_t *)MEMORY[0x1E4F5D168];
  BOOL v12 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    uint64_t v17 = "-[CSSpeechController _createAudioProviderFromXPCWithContext:]";
    _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_DEFAULT, "%s Establishing xpcClient connection...", (uint8_t *)&v16, 0xCu);
  }
  [(CSSpeechController *)self _setupAudioProviderFromXPC:self->_xpcClient];
  [(CSXPCClient *)self->_xpcClient connect];
  BOOL v6 = 1;
  if (![(CSXPCClient *)self->_xpcClient prepareAudioProviderWithContext:v4 clientType:1 error:0])
  {
    uint64_t v13 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      uint64_t v17 = "-[CSSpeechController _createAudioProviderFromXPCWithContext:]";
      _os_log_error_impl(&dword_1C9338000, v13, OS_LOG_TYPE_ERROR, "%s Unable to prepareAudioProvider in _xpcClient, teardown XPC connection again", (uint8_t *)&v16, 0xCu);
    }
    [(CSSpeechController *)self _teardownAudioProviderIfNeeded];
LABEL_16:
    BOOL v6 = 0;
  }
LABEL_17:

  return v6;
}

- (BOOL)_fetchAudioProviderWithContext:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_contextResetQueue);
  xpcClient = self->_xpcClient;
  if (xpcClient && [(CSXPCClient *)xpcClient isConnected])
  {
    BOOL v6 = 1;
    if (![(CSXPCClient *)self->_xpcClient prepareAudioProviderWithContext:v4 clientType:1 error:0])
    {
      [(CSSpeechController *)self _teardownAudioProviderIfNeeded];
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = [(CSSpeechController *)self _createAudioProviderFromXPCWithContext:v4];
  }

  return v6;
}

- (id)_fetchAudioDecoderForTV:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  decodersForTV = self->_decodersForTV;
  BOOL v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
  int v7 = [(NSMutableDictionary *)decodersForTV objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = self->_decodersForTV;
    uint64_t v9 = [NSNumber numberWithUnsignedInt:v3];
    id v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];
LABEL_3:

    goto LABEL_16;
  }
  if (v3 == 1869641075)
  {
    id v11 = objc_alloc(MEMORY[0x1E4F5D1C0]);
    [MEMORY[0x1E4F5D2E0] opusASBD];
    [MEMORY[0x1E4F5D2E0] lpcmInt16ASBD];
    BOOL v12 = &v23;
    uint64_t v13 = &v22;
  }
  else
  {
    if (v3 != 1936745848)
    {
      uint64_t v17 = *MEMORY[0x1E4F5D168];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136315394;
      int v27 = "-[CSSpeechController _fetchAudioDecoderForTV:]";
      __int16 v28 = 1026;
      int v29 = v3;
      uint64_t v18 = "%s Unexpected audioFormat for ATV : %{public}u";
      uint64_t v19 = v17;
      uint32_t v20 = 18;
LABEL_20:
      _os_log_error_impl(&dword_1C9338000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
      goto LABEL_15;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F5D1C0]);
    [MEMORY[0x1E4F5D2E0] speexASBD];
    [MEMORY[0x1E4F5D2E0] lpcmInt16ASBD];
    BOOL v12 = &v25;
    uint64_t v13 = (uint64_t *)&v24;
  }
  id v10 = (void *)[v11 initWithInASBD:v12 outASBD:v13];
  BOOL v14 = *MEMORY[0x1E4F5D168];
  __int16 v15 = *MEMORY[0x1E4F5D168];
  if (v10)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      int v27 = "-[CSSpeechController _fetchAudioDecoderForTV:]";
      __int16 v28 = 1026;
      int v29 = v3;
      _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_DEFAULT, "%s Create audioDecoder for audioFormat %{public}u", buf, 0x12u);
    }
    [v10 setDelegate:self];
    int v16 = self->_decodersForTV;
    uint64_t v9 = [NSNumber numberWithUnsignedInt:v3];
    [(NSMutableDictionary *)v16 setObject:v10 forKey:v9];
    goto LABEL_3;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    int v27 = "-[CSSpeechController _fetchAudioDecoderForTV:]";
    uint64_t v18 = "%s audioDecoder is nil!";
    uint64_t v19 = v14;
    uint32_t v20 = 12;
    goto LABEL_20;
  }
LABEL_15:
  id v10 = 0;
LABEL_16:
  return v10;
}

- (void)_logRecordingStopErrorIfNeeded:(int64_t)a3
{
  if (a3 == -11786)
  {
    int v4 = [MEMORY[0x1E4F5D450] supportNonInterruptibleSiri];
    id v5 = [MEMORY[0x1E4F5D2A0] sharedInstance];
    id v7 = v5;
    BOOL v6 = (void *)MEMORY[0x1E4F5D558];
    if (!v4) {
      BOOL v6 = (void *)MEMORY[0x1E4F5D4F8];
    }
    [v5 submitAudioIssueReport:*v6];
  }
}

- (BOOL)_shouldTrackLaunchLatency
{
  if (!CSIsIOS()) {
    return 0;
  }
  if (![(CSAudioRecordContext *)self->_audioRecordContext isBuiltInVoiceTriggered])return 0; {
  if (![(CSSpeechController *)self _isRecordRouteBuiltinMic])
  }
    return 0;
  lastVoiceTriggerInfo = self->_lastVoiceTriggerInfo;
  if (!lastVoiceTriggerInfo) {
    return 0;
  }
  int v4 = [(NSDictionary *)lastVoiceTriggerInfo objectForKeyedSubscript:*MEMORY[0x1E4F5D958]];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)_shouldUseSoundPlaybackMonitors
{
  if (self->_supportPhatic) {
    return 1;
  }
  else {
    return CSIsTV();
  }
}

- (void)getMitigationDecisionForRCId:(unint64_t)a3 requestId:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v8 = (void (**)(id, void))a5;
  if ([(CSSpeechController *)self _shouldRunHybridSDSDMitigation]) {
    [(CSRCHandlingXPCClient *)self->_rcHandlingClient getMitigationDecisionForRCIdWithCompletion:a3 requestId:v9 completion:v8];
  }
  else {
    v8[2](v8, 0);
  }
}

- (void)processRCWithId:(unint64_t)a3 requestId:(id)a4 speechPackage:(id)a5 taskId:(id)a6 forceAccept:(BOOL)a7 completionHandler:(id)a8
{
  BOOL v9 = a7;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if ([(CSSpeechController *)self _shouldRunHybridSDSDMitigation])
  {
    [(CSRCHandlingXPCClient *)self->_rcHandlingClient processRCWithId:a3 requestId:v14 speechPackage:v15 taskId:v16 forceAccept:v9 completionHandler:v17];
  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t, void, void))v17 + 2))(v17, 1, 0, 0);
  }
  else
  {
    endpointerProxy = self->_endpointerProxy;
    uint64_t v19 = [v15 recognition];
    [v19 processedAudioDuration];
    double v21 = v20;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __99__CSSpeechController_processRCWithId_requestId_speechPackage_taskId_forceAccept_completionHandler___block_invoke;
    v22[3] = &unk_1E658A368;
    id v23 = v17;
    [(CSEndpointerProxy *)endpointerProxy shouldAcceptEagerResultForDuration:v22 resultsCompletionHandler:v21];
  }
}

uint64_t __99__CSSpeechController_processRCWithId_requestId_speechPackage_taskId_forceAccept_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_shouldRunHybridSDSDMitigation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v4 = [v3 languageCode];

  BOOL v5 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    BOOL isHybridUODEnabled = self->_isHybridUODEnabled;
    endpointId = self->_endpointId;
    rcHandlingClient = self->_rcHandlingClient;
    int v11 = 136316162;
    BOOL v12 = "-[CSSpeechController _shouldRunHybridSDSDMitigation]";
    __int16 v13 = 1024;
    BOOL v14 = isHybridUODEnabled;
    __int16 v15 = 2112;
    id v16 = endpointId;
    __int16 v17 = 2112;
    uint64_t v18 = rcHandlingClient;
    __int16 v19 = 2112;
    double v20 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s _isHybridUODEnabled: %d, _endpointId: %@, _rcHandlingClient: %@, languageCode: %@", (uint8_t *)&v11, 0x30u);
  }
  BOOL v9 = self->_isHybridUODEnabled && !self->_endpointId && self->_rcHandlingClient != 0;

  return v9;
}

- (void)setEndpointerOperationMode:(int64_t)a3
{
}

- (void)processASRFeatures:(id)a3
{
}

- (void)resetEndpointer
{
}

- (int64_t)_currentAudioRecorderSampleRate
{
  v2 = [(CSSpeechController *)self streamProvider];
  uint64_t v3 = [v2 recordSettings];

  if (v3
    && ([v3 objectForKeyedSubscript:*MEMORY[0x1E4F15270]],
        (int v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v5 = v4;
    int64_t v6 = [v4 unsignedIntegerValue];
  }
  else
  {
    [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
    int64_t v6 = (uint64_t)v7;
  }

  return v6;
}

- (void)setEndpointAnalyzerDelegate:(id)a3
{
}

- (CSEndpointAnalyzer)endpointAnalyzer
{
  return (CSEndpointAnalyzer *)self->_endpointerProxy;
}

- (void)fetchAudioMetricsWithCompletion:(id)a3
{
  id v4 = a3;
  contextResetQueue = self->_contextResetQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__CSSpeechController_fetchAudioMetricsWithCompletion___block_invoke;
  v7[3] = &unk_1E658D3A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(contextResetQueue, v7);
}

void __54__CSSpeechController_fetchAudioMetricsWithCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    v2 = [*(id *)(a1 + 32) audioMetricProvider];
    id v5 = [v2 audioMetric];

    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = (void *)[v5 copy];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

- (void)keywordDetectorDidDetectKeyword
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CSSpeechController_keywordDetectorDidDetectKeyword__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __53__CSSpeechController_keywordDetectorDidDetectKeyword__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    float v7 = "-[CSSpeechController keywordDetectorDidDetectKeyword]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Requesting QuickStop operation upon detecting keyword", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v5 speechControllerRequestsOperation:0 forReason:0];
  }
}

- (void)endpointer:(id)a3 detectedTwoShotAtTime:(double)a4
{
  kdebug_trace();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__CSSpeechController_endpointer_detectedTwoShotAtTime___block_invoke;
  v7[3] = &unk_1E658D3C8;
  *(double *)&void v7[5] = a4;
  v7[4] = self;
  dispatch_async(queue, v7);
}

unsigned char *__55__CSSpeechController_endpointer_detectedTwoShotAtTime___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 119);
    int v6 = 136315650;
    float v7 = "-[CSSpeechController endpointer:detectedTwoShotAtTime:]_block_invoke";
    __int16 v8 = 2050;
    uint64_t v9 = v3;
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Reported 2-shot at: %{public}f secs, hasRequestedTwoShotFeedback: %d", (uint8_t *)&v6, 0x1Cu);
  }
  double result = *(unsigned char **)(a1 + 32);
  if (!result[119]) {
    return (unsigned char *)[result _startTwoShotFeedbackDecisionForDetectionAtTime:*(double *)(a1 + 40)];
  }
  return result;
}

- (void)_startTwoShotFeedbackDecisionForDetectionAtTime:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  self->_hasRequestedTwoShotFeedback = 1;
  if ([MEMORY[0x1E4F5D450] shouldDelayTwoShotFeedbackForMyriadDecision])
  {
    id v5 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[CSSpeechController _startTwoShotFeedbackDecisionForDetectionAtTime:]";
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Waiting for myriad decision to continue with two shot", buf, 0xCu);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    double v10 = 0.0;
    double v10 = (double)mach_absolute_time();
    audibleFeedbackQueue = self->_audibleFeedbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __70__CSSpeechController__startTwoShotFeedbackDecisionForDetectionAtTime___block_invoke;
    block[3] = &unk_1E658B460;
    void block[4] = self;
    void block[5] = buf;
    *(double *)&block[6] = a3;
    dispatch_async(audibleFeedbackQueue, block);
    _Block_object_dispose(buf, 8);
  }
  else if (self->_isSiriClientListening)
  {
    float v7 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSSpeechController _startTwoShotFeedbackDecisionForDetectionAtTime:]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a3;
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Starting two shot feedback at: %lf", buf, 0x16u);
    }
    [(CSSpeechController *)self _startFeedbackForTwoShotAtTime:a3];
  }
}

void __70__CSSpeechController__startTwoShotFeedbackDecisionForDetectionAtTime___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 104);
  dispatch_time_t v3 = dispatch_time(0, 1700000000);
  intptr_t v4 = dispatch_group_wait(v2, v3);
  id v5 = *MEMORY[0x1E4F5D168];
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[CSSpeechController _startTwoShotFeedbackDecisionForDetectionAtTime:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s Two shot audible feedback decision timed out while waiting for Myriad decision", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(unsigned __int8 *)(v6 + 128);
      LODWORD(v6) = *(unsigned __int8 *)(v6 + 118);
      int v10 = 136315650;
      uint64_t v11 = "-[CSSpeechController _startTwoShotFeedbackDecisionForDetectionAtTime:]_block_invoke";
      __int16 v12 = 1024;
      int v13 = v7;
      __int16 v14 = 1024;
      int v15 = v6;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Starting two shot feedback decision now: myriadPreventingFeedback %d, Siri Client Listening %d", (uint8_t *)&v10, 0x18u);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v8 + 128) && *(unsigned char *)(v8 + 118))
    {
      mach_absolute_time();
      AFMachAbsoluteTimeGetTimeInterval();
      [*(id *)(a1 + 32) _startFeedbackForTwoShotAtTime:v9 + *(double *)(a1 + 48)];
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 128) = 0;
}

- (void)continuousVoiceTrigger:(id)a3 detectedSilenceAfterVoiceTriggerAt:(double)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__CSSpeechController_continuousVoiceTrigger_detectedSilenceAfterVoiceTriggerAt___block_invoke;
  block[3] = &unk_1E658C910;
  void block[4] = self;
  void block[5] = a2;
  *(double *)&block[6] = a4;
  dispatch_async(queue, block);
}

void __80__CSSpeechController_continuousVoiceTrigger_detectedSilenceAfterVoiceTriggerAt___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  dispatch_time_t v3 = NSStringFromSelector(*(SEL *)(a1 + 40));
  [v2 _performPendingAudioSessionActivateForReason:v3];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "resetForVoiceTriggerTwoShotWithSampleRate:", objc_msgSend(*(id *)(a1 + 32), "_currentAudioRecorderSampleRate"));
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 112)) {
    goto LABEL_9;
  }
  if ([*(id *)(v4 + 168) endPointAnalyzerType] != 1)
  {
    uint64_t v8 = *MEMORY[0x1E4F5D168];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      int v6 = 1;
      goto LABEL_10;
    }
    *(_DWORD *)char v24 = 136315138;
    *(void *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
    double v9 = "%s Endpointer is not hybrid endpoint, we should rely on CVT for two shot beep";
LABEL_8:
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, v9, v24, 0xCu);
    goto LABEL_9;
  }
  if (CSIsHorseman())
  {
    id v5 = *MEMORY[0x1E4F5D168];
    int v6 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v24 = 136315138;
      *(void *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
      int v7 = "%s Not playing two shot feedback since this is horseman, Phatic will be played";
LABEL_45:
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, v7, v24, 0xCu);
      int v6 = 0;
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 176) isDarwinVoiceTriggered])
  {
    uint64_t v8 = *MEMORY[0x1E4F5D168];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)char v24 = 136315138;
    *(void *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
    double v9 = "%s VoiceTrigger from Darwin device, we will rely on CVT for two shot detection";
    goto LABEL_8;
  }
  if (([*(id *)(*(void *)(a1 + 32) + 176) isHearstVoiceTriggered] & 1) == 0
    && ![*(id *)(*(void *)(a1 + 32) + 176) isJarvisVoiceTriggered])
  {
    if ([*(id *)(*(void *)(a1 + 32) + 176) isRemoraVoiceTriggered])
    {
      id v5 = *MEMORY[0x1E4F5D168];
      int v6 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_DWORD *)char v24 = 136315138;
      *(void *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
      int v7 = "%s Not playing two shot feedback since this is hearst, javis, or remora, Phatic will be played";
      goto LABEL_45;
    }
    if ([MEMORY[0x1E4F5D450] isIOSDeviceSupportingBargeIn]
      && [*(id *)(*(void *)(a1 + 32) + 176) isBuiltInVoiceTriggered])
    {
      id v5 = *MEMORY[0x1E4F5D168];
      int v6 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      *(_DWORD *)char v24 = 136315138;
      *(void *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
      int v7 = "%s Not playing two shot feedback since this is barge-in device, Phatic will be played";
      goto LABEL_45;
    }
    goto LABEL_9;
  }
  id v5 = *MEMORY[0x1E4F5D168];
  int v6 = 0;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)char v24 = 136315138;
    *(void *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
    int v7 = "%s Not playing two shot feedback since this is hearst or javis, Phatic will be played";
    goto LABEL_45;
  }
LABEL_10:
  if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "endPointAnalyzerType", *(_OWORD *)v24) == 1)
  {
    int v10 = *MEMORY[0x1E4F5D168];
    int v6 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v24 = 136315138;
      *(void *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEFAULT, "%s State feedback is enabled and we are using hybrid endpointer, use hybrid endpointer for two shot", v24, 0xCu);
      int v6 = 0;
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 176) isRTSTriggered])
  {
    uint64_t v11 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v24 = 136315138;
      *(void *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_DEFAULT, "%s State feedback is enabled and this is an RTS trigger, using CVT for two shot", v24, 0xCu);
    }
    if (![*(id *)(*(void *)(a1 + 32) + 176) isGibraltarVoiceTriggered]) {
      goto LABEL_22;
    }
  }
  else if (([*(id *)(*(void *)(a1 + 32) + 176) isGibraltarVoiceTriggered] & 1) == 0)
  {
    if (!v6) {
      return;
    }
    goto LABEL_22;
  }
  __int16 v12 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)char v24 = 136315138;
    *(void *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_DEFAULT, "%s State feedback is enabled and this is Gibraltar VoiceTrigger, using CVT for two shot", v24, 0xCu);
  }
LABEL_22:
  if (([*(id *)(*(void *)(a1 + 32) + 176) isBuiltInVoiceTriggered] & 1) == 0
    && [*(id *)(a1 + 32) _shouldUseSoundPlaybackMonitors]
    && (int v13 = *(unsigned char **)(a1 + 32), v13[126])
    && ([v13 _canPlayTwoShotFeedbackDuringMediaPlayback] & 1) == 0)
  {
    id v23 = *MEMORY[0x1E4F5D168];
    uint64_t v14 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)char v24 = 136315138;
      *(void *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v23, OS_LOG_TYPE_DEFAULT, "%s Cannot play Phatic since music is being played now", v24, 0xCu);
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 1;
  }
  uint64_t v15 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v15 + 119))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v15 + 144));
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      uint64_t v18 = *MEMORY[0x1E4F5D168];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = *(void *)(a1 + 48);
        if (*(unsigned char *)(*(void *)(a1 + 32) + 122)) {
          double v20 = @"Yes";
        }
        else {
          double v20 = @"No";
        }
        *(_DWORD *)char v24 = 136315650;
        *(void *)&v24[4] = "-[CSSpeechController continuousVoiceTrigger:detectedSilenceAfterVoiceTriggerAt:]_block_invoke";
        *(_WORD *)&v24[12] = 2050;
        *(void *)&v24[14] = v19;
        __int16 v25 = 2114;
        int v26 = v20;
        _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_DEFAULT, "%s Two shot is detected at time %{public}.3f, should notify? [%{public}@]", v24, 0x20u);
      }
      uint64_t v21 = *(void *)(a1 + 32);
      if (*(unsigned char *)(v21 + 122))
      {
        id v22 = objc_loadWeakRetained((id *)(v21 + 144));
        [v22 speechControllerDidDetectVoiceTriggerTwoShot:*(void *)(a1 + 32) atTime:v14 wantsAudibleFeedback:*(double *)(a1 + 48)];
      }
    }
  }
  else
  {
    [(id)v15 _startTwoShotFeedbackDecisionForDetectionAtTime:*(double *)(a1 + 48)];
  }
}

- (void)continuousVoiceTrigger:(id)a3 detectedVoiceTriggerResult:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7
    && (uint64_t v9 = *MEMORY[0x1E4F5D928],
        [v7 objectForKeyedSubscript:*MEMORY[0x1E4F5D928]],
        int v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    uint64_t v11 = [v8 objectForKeyedSubscript:v9];
    uint64_t v12 = [v11 unsignedLongLongValue];

    if (CSIsHorseman() && !self->_endpointId)
    {
      mach_absolute_time();
      AFSiriActivationContinuousVoiceTriggerDetected();
    }
    else
    {
      +[CSMyriadPHash notifyHashlessTrigger:v12];
    }
  }
  else
  {
    int v13 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      uint64_t v15 = "-[CSSpeechController continuousVoiceTrigger:detectedVoiceTriggerResult:]";
      _os_log_error_impl(&dword_1C9338000, v13, OS_LOG_TYPE_ERROR, "%s Unable to notify to Myriad for continuous VoiceTrigger : Cannot find VTEITriggerEndMachTime from VTEI", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (id)voiceTriggerInfo
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = (id *)MEMORY[0x1E4F5D168];
  uint64_t v4 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CSSpeechController voiceTriggerInfo]";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__8283;
  double v20 = __Block_byref_object_dispose__8284;
  id v21 = 0;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__CSSpeechController_voiceTriggerInfo__block_invoke;
  v12[3] = &unk_1E658D438;
  v12[4] = self;
  v12[5] = &buf;
  dispatch_async_and_wait(queue, v12);
  id v7 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v8 = *v3;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [v7 timeIntervalSinceDate:v5];
    *(_DWORD *)int v13 = 136315394;
    int v14 = "-[CSSpeechController voiceTriggerInfo]";
    __int16 v15 = 2050;
    uint64_t v16 = v9;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s fetch lastVoiceTriggerInfo elapsed time = %{public}lf", v13, 0x16u);
  }

  [*(id *)(*((void *)&buf + 1) + 40) removeObjectForKey:*MEMORY[0x1E4F5D6A0]];
  [*(id *)(*((void *)&buf + 1) + 40) removeObjectForKey:*MEMORY[0x1E4F5D690]];
  int v10 = [MEMORY[0x1E4FB4FF8] sanitizeEventInfoForLogging:*(void *)(*((void *)&buf + 1) + 40)];

  _Block_object_dispose(&buf, 8);
  return v10;
}

void __38__CSSpeechController_voiceTriggerInfo__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) mutableCopy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)outputReferenceChannel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (CSIsHorseman())
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F5D278];
    return [v2 channelForOutputReference];
  }
  else
  {
    uint64_t v4 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[CSSpeechController outputReferenceChannel]";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s Not available", (uint8_t *)&v5, 0xCu);
    }
    return -1;
  }
}

- (void)_createAudioPowerMeterIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (CSIsTV()
    && ![(CSAudioRecordContext *)self->_audioRecordContext isTriggeredFromHearst])
  {
    uint64_t v9 = (void *)*MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v9;
      uint64_t v11 = [(CSSpeechController *)self recordRoute];
      int v12 = 136315394;
      int v13 = "-[CSSpeechController _createAudioPowerMeterIfNeeded]";
      __int16 v14 = 2114;
      __int16 v15 = v11;
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEFAULT, "%s We don't need Audio Power Meter with record route %{public}@", (uint8_t *)&v12, 0x16u);
    }
    powerMeter = self->_powerMeter;
    self->_powerMeter = 0;
  }
  else
  {
    uint64_t v3 = (void *)*MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      int v5 = [(CSSpeechController *)self recordRoute];
      int v12 = 136315394;
      int v13 = "-[CSSpeechController _createAudioPowerMeterIfNeeded]";
      __int16 v14 = 2114;
      __int16 v15 = v5;
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s Creating Audio Power Meter with record route %{public}@", (uint8_t *)&v12, 0x16u);
    }
    id v6 = objc_alloc(MEMORY[0x1E4F5D1D8]);
    [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
    uint64_t v7 = (CSAudioPowerMeter *)objc_msgSend(v6, "initWithSampleRate:");
    powerMeter = self->_powerMeter;
    self->_powerMeter = v7;
  }
}

- (void)setMeteringEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[CSSpeechController setMeteringEnabled:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(CSSpeechController *)self audioMeterProvider];
  [v6 setMeteringEnabled:v3];
}

- (void)stopEndpointer
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[CSSpeechController stopEndpointer]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(CSEndpointerProxy *)self->_endpointerProxy stopEndpointer];
}

- (BOOL)playRecordStartingAlertAndResetEndpointerWithAlertOverride:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    int v10 = "-[CSSpeechController playRecordStartingAlertAndResetEndpointerWithAlertOverride:]";
    __int16 v11 = 2048;
    int64_t v12 = a3;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s playing start recording alert with override: %lu", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v6 = [(CSSpeechController *)self alertProvider];
  char v7 = [v6 playRecordStartingAlertAndResetEndpointerWithAlertOverride:a3];

  return v7;
}

- (unint64_t)alertStartTime
{
  uint64_t v2 = [(CSSpeechController *)self alertProvider];
  unint64_t v3 = [v2 alertStartTime];

  return v3;
}

- (BOOL)playAlertSoundForType:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v5 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[CSSpeechController playAlertSoundForType:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v6 = [(CSSpeechController *)self alertProvider];
  char v7 = [v6 playAlertSoundForType:a3];

  return v7;
}

- (BOOL)setAlertSoundFromURL:(id)a3 forType:(int64_t)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = @"NO";
    *(_DWORD *)__int16 v14 = 136315906;
    *(void *)&v14[4] = "-[CSSpeechController setAlertSoundFromURL:forType:force:]";
    *(_WORD *)&v14[12] = 2114;
    *(void *)&v14[14] = v8;
    if (v5) {
      int v10 = @"YES";
    }
    *(_WORD *)&v14[22] = 1026;
    int v15 = a4;
    __int16 v16 = 2114;
    char v17 = v10;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s Setting Alert Sounds From : %{public}@ for AlertType : %{public}d, force : %{public}@", v14, 0x26u);
  }
  uint64_t v11 = [(CSSpeechController *)self alertProvider];
  char v12 = [v11 setAlertSoundFromURL:v8 forType:a4 force:v5];

  return v12;
}

- (void)audioConverterDidConvertPackets:(id)a3 packets:(id)a4 durationInSec:(float)a5 timestamp:(unint64_t)a6 arrivalTimestampToAudioRecorder:(unint64_t)a7
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (self->_isSiriClientListening)
  {
    if (!self->_didDeliverFirstSpeechPacket)
    {
      self->_didDeliverFirstSpeechPacket = 1;
      if (!self->_audioDeviceInfoImpl)
      {
        uint64_t v13 = [(CSSpeechController *)self streamProvider];
        __int16 v14 = [v13 audioDeviceInfo];
        audioDeviceInfoImpl = self->_audioDeviceInfoImpl;
        self->_audioDeviceInfoImpl = v14;
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v17 = objc_opt_respondsToSelector();

    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    double v20 = v18;
    if (v17)
    {
      *(float *)&double v19 = a5;
      [v18 speechControllerRecordBufferAvailable:self buffers:v12 durationInSec:a6 recordedAt:self->_audioDeviceInfoImpl audioDeviceInfo:v19];
    }
    else
    {
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        id v23 = objc_loadWeakRetained((id *)&self->_delegate);
        *(float *)&double v24 = a5;
        [v23 speechControllerRecordBufferAvailable:self buffers:v12 durationInSec:a6 recordedAt:v24];
      }
    }
  }
  else
  {
    id v21 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
    {
      int v25 = 136315138;
      int v26 = "-[CSSpeechController audioConverterDidConvertPackets:packets:durationInSec:timestamp:arrivalTimestampToAudioRecorder:]";
      _os_log_error_impl(&dword_1C9338000, v21, OS_LOG_TYPE_ERROR, "%s SpeechController is trying to forward encoded audio after didStopForwarding, we shouldn't have this", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (BOOL)_setupAudioConverter:(BOOL)a3 isNarrowBand:(BOOL)a4
{
  if (a4)
  {
    p_narrowBandOpusConverter = (id *)&self->_narrowBandOpusConverter;
    narrowBandOpusConverter = self->_narrowBandOpusConverter;
    if (!narrowBandOpusConverter)
    {
      uint64_t v7 = +[CSAudioConverter narrowBandOpusConverter];
LABEL_6:
      id v8 = *p_narrowBandOpusConverter;
      id *p_narrowBandOpusConverter = (id)v7;

      [*p_narrowBandOpusConverter setDelegate:self];
      narrowBandOpusConverter = (CSAudioConverter *)*p_narrowBandOpusConverter;
    }
  }
  else
  {
    p_narrowBandOpusConverter = (id *)&self->_opusAudioConverter;
    narrowBandOpusConverter = self->_opusAudioConverter;
    if (!narrowBandOpusConverter)
    {
      uint64_t v7 = +[CSAudioConverter opusConverter];
      goto LABEL_6;
    }
  }
  int v9 = narrowBandOpusConverter;
  audioConverter = self->_audioConverter;
  self->_audioConverter = v9;

  return self->_audioConverter != 0;
}

- (void)_setupDownsamplerIfNeeded
{
  if (!self->_downsampler)
  {
    unint64_t v3 = [MEMORY[0x1E4F5D200] downsampler];
    downsampler = self->_downsampler;
    self->_downsampler = v3;
  }
}

- (void)didTTSVolumeChange:(id)a3 forReason:(unint64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    int v10 = "-[CSSpeechController didTTSVolumeChange:forReason:]";
    __int16 v11 = 2048;
    unint64_t v12 = a4;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s SmartSiriVolume update reason: %lu", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CSSpeechController_didTTSVolumeChange_forReason___block_invoke;
  v8[3] = &unk_1E658D3C8;
  v8[4] = self;
  v8[5] = a4;
  dispatch_async(queue, v8);
}

void __51__CSSpeechController_didTTSVolumeChange_forReason___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    int v4 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CSSpeechController didTTSVolumeChange:forReason:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v5 speechControllerDidUpdateSmartSiriVolume:*(void *)(a1 + 32) forReason:*(void *)(a1 + 40)];
  }
}

- (void)audioSessionProvider:(id)a3 didSetAudioSessionActive:(BOOL)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v11 = "-[CSSpeechController audioSessionProvider:didSetAudioSessionActive:]";
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CSSpeechController_audioSessionProvider_didSetAudioSessionActive___block_invoke;
  v8[3] = &unk_1E658C870;
  v8[4] = self;
  BOOL v9 = a4;
  dispatch_async(queue, v8);
}

void __68__CSSpeechController_audioSessionProvider_didSetAudioSessionActive___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    int v4 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CSSpeechController audioSessionProvider:didSetAudioSessionActive:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v5 speechController:*(void *)(a1 + 32) didSetAudioSessionActive:*(unsigned __int8 *)(a1 + 40)];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 121) = *(unsigned char *)(a1 + 40);
}

- (void)audioSessionProvider:(id)a3 willSetAudioSessionActive:(BOOL)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v6 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v11 = "-[CSSpeechController audioSessionProvider:willSetAudioSessionActive:]";
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __69__CSSpeechController_audioSessionProvider_willSetAudioSessionActive___block_invoke;
  v8[3] = &unk_1E658C870;
  v8[4] = self;
  BOOL v9 = a4;
  dispatch_async(queue, v8);
}

void __69__CSSpeechController_audioSessionProvider_willSetAudioSessionActive___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    int v4 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CSSpeechController audioSessionProvider:willSetAudioSessionActive:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v5 speechController:*(void *)(a1 + 32) willSetAudioSessionActive:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)audioSessionProviderEndInterruption:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v8 = "-[CSSpeechController audioSessionProviderEndInterruption:]";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CSSpeechController_audioSessionProviderEndInterruption___block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __58__CSSpeechController_audioSessionProviderEndInterruption___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    int v4 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CSSpeechController audioSessionProviderEndInterruption:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v5 speechControllerEndRecordInterruption:*(void *)(a1 + 32)];
  }
}

- (void)audioSessionProviderBeginInterruption:(id)a3 withContext:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v12 = "-[CSSpeechController audioSessionProviderBeginInterruption:withContext:]";
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__CSSpeechController_audioSessionProviderBeginInterruption_withContext___block_invoke;
  v9[3] = &unk_1E658D4B0;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

void __72__CSSpeechController_audioSessionProviderBeginInterruption_withContext___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    int v4 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CSSpeechController audioSessionProviderBeginInterruption:withContext:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v5 speechControllerBeginRecordInterruption:*(void *)(a1 + 32) withContext:*(void *)(a1 + 40)];
  }
}

- (void)audioSessionProviderBeginInterruption:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v8 = "-[CSSpeechController audioSessionProviderBeginInterruption:]";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CSSpeechController_audioSessionProviderBeginInterruption___block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __60__CSSpeechController_audioSessionProviderBeginInterruption___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    int v4 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CSSpeechController audioSessionProviderBeginInterruption:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v5 speechControllerBeginRecordInterruption:*(void *)(a1 + 32)];
  }
}

- (void)audioAlertProvidingDidFinishAlertPlayback:(id)a3 ofType:(int64_t)a4 error:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  uint64_t v8 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    int v15 = "-[CSSpeechController audioAlertProvidingDidFinishAlertPlayback:ofType:error:]";
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__CSSpeechController_audioAlertProvidingDidFinishAlertPlayback_ofType_error___block_invoke;
  block[3] = &unk_1E658CEC8;
  id v12 = v7;
  int64_t v13 = a4;
  void block[4] = self;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __77__CSSpeechController_audioAlertProvidingDidFinishAlertPlayback_ofType_error___block_invoke(void *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    int v4 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[CSSpeechController audioAlertProvidingDidFinishAlertPlayback:ofType:error:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)(a1[4] + 144));
    [v5 speechControllerDidFinishAlertPlayback:a1[4] ofType:a1[6] error:a1[5]];
  }
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSSpeechController audioSessionController:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:]";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
}

- (void)audioSessionProvider:(id)a3 didChangeContext:(BOOL)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v4 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSSpeechController audioSessionProvider:didChangeContext:]";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
}

- (void)audioSessionProvider:(id)a3 providerInvalidated:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CSSpeechController_audioSessionProvider_providerInvalidated___block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

void __63__CSSpeechController_audioSessionProvider_providerInvalidated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CSSpeechController_audioSessionProvider_providerInvalidated___block_invoke_2;
  block[3] = &unk_1E658D4D8;
  void block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __63__CSSpeechController_audioSessionProvider_providerInvalidated___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[CSSpeechController audioSessionProvider:providerInvalidated:]_block_invoke_2";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s AudioProvider is invalidated, teardown connection to audioprovider", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _teardownAudioProviderIfNeeded];
}

- (void)audioStreamProvider:(id)a3 didHardwareConfigurationChange:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v10 = "-[CSSpeechController audioStreamProvider:didHardwareConfigurationChange:]";
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__CSSpeechController_audioStreamProvider_didHardwareConfigurationChange___block_invoke;
  v8[3] = &unk_1E658D3C8;
  v8[4] = self;
  void v8[5] = a4;
  dispatch_async(queue, v8);
}

void __73__CSSpeechController_audioStreamProvider_didHardwareConfigurationChange___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    int v4 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CSSpeechController audioStreamProvider:didHardwareConfigurationChange:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
    }
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v5 speechControllerRecordHardwareConfigurationDidChange:*(void *)(a1 + 32) toConfiguration:*(void *)(a1 + 40)];
  }
}

- (void)audioDecoderDidDecodePackets:(id)a3 audioStreamHandleId:(unint64_t)a4 buffer:(id)a5 remoteVAD:(id)a6 timestamp:(unint64_t)a7 arrivalTimestampToAudioRecorder:(unint64_t)a8 wasBuffered:(BOOL)a9 receivedNumChannels:(unsigned int)a10
{
  id v12 = (void *)MEMORY[0x1E4F5D250];
  id v13 = a5;
  __int16 v14 = [v12 sharedInstance];
  int v15 = [v14 defaultConverter];
  [v15 processSampleCount:self->_decoderProcessedSampleCountForTV hostTime:a7];

  unint64_t v16 = ((unint64_t)[v13 length] >> 1) / a10;
  id v17 = objc_alloc(MEMORY[0x1E4F5D1A8]);
  uint64_t v18 = [MEMORY[0x1E4F5D278] inputRecordingSampleByteDepth];
  unint64_t decoderProcessedSampleCountForTV = self->_decoderProcessedSampleCountForTV;
  LOBYTE(v23) = [MEMORY[0x1E4F5D278] inputRecordingIsFloat];
  LOBYTE(v22) = a9;
  id v25 = (id)[v17 initWithData:v13 numChannels:a10 numSamples:v16 sampleByteDepth:v18 startSampleCount:decoderProcessedSampleCountForTV hostTime:a7 arrivalHostTimeToAudioRecorder:a8 wasBuffered:v22 remoteVAD:0 isFloat:v23];

  [(CSContinuousVoiceTrigger *)self->_continuousVoiceTrigger processAudioSamples:v25];
  if ([MEMORY[0x1E4F5D450] supportsEndpointingOnATV]) {
    [(CSEndpointerProxy *)self->_endpointerProxy processAudioSamplesAsynchronously:v25];
  }
  if (CSIsTV())
  {
    speakerRecognitionController = self->_speakerRecognitionController;
    id v21 = [v25 data];
    -[SSRSpeakerRecognitionController processAudio:withNumberOfSamples:](speakerRecognitionController, "processAudio:withNumberOfSamples:", v21, [v25 numSamples]);
  }
  self->_decoderProcessedSampleCountForTV += v16;
}

- (void)audioStreamProvider:(id)a3 audioChunkForTVAvailable:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__CSSpeechController_audioStreamProvider_audioChunkForTVAvailable___block_invoke;
  v8[3] = &unk_1E658D4B0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __67__CSSpeechController_audioStreamProvider_audioChunkForTVAvailable___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (v1[118])
  {
    objc_msgSend(v1, "_fetchAudioDecoderForTV:", objc_msgSend(*(id *)(a1 + 40), "audioFormat"));
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    char v3 = [*(id *)(a1 + 40) packets];
    uint64_t v4 = [*(id *)(a1 + 40) streamHandleID];
    uint64_t v5 = [*(id *)(a1 + 40) timeStamp];
    uint64_t v6 = [*(id *)(a1 + 40) timeStamp];
    LODWORD(v22) = [*(id *)(a1 + 40) numChannels];
    [v23 addPackets:v3 audioStreamHandleId:v4 remoteVAD:0 timestamp:v5 arrivalTimestampToAudioRecorder:v6 wasBuffered:0 receivedNumChannels:v22];

    if (CSIsTV())
    {
      id v7 = *(void **)(a1 + 32);
      [*(id *)(a1 + 40) avgPower];
      objc_msgSend(v7, "setCachedAvgPower:");
      uint64_t v8 = *(void **)(a1 + 32);
      [*(id *)(a1 + 40) peakPower];
      objc_msgSend(v8, "setCachedPeakPower:");
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 280), "addNumSamples:hostTime:", 0, objc_msgSend(*(id *)(a1 + 40), "timeStamp"));
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v9 + 132))
    {
      *(unsigned char *)(v9 + 132) = 1;
      uint64_t v9 = *(void *)(a1 + 32);
      if (!*(void *)(v9 + 512))
      {
        id v10 = [(id)v9 streamProvider];
        uint64_t v11 = [v10 audioDeviceInfo];
        uint64_t v12 = *(void *)(a1 + 32);
        id v13 = *(void **)(v12 + 512);
        *(void *)(v12 + 512) = v11;

        uint64_t v9 = *(void *)(a1 + 32);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)(v9 + 144));
    char v15 = objc_opt_respondsToSelector();

    id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    if (v15)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = [*(id *)(a1 + 40) packets];
      objc_msgSend(v16, "speechControllerRecordBufferAvailable:buffers:durationInSec:recordedAt:audioDeviceInfo:", v17, v18, objc_msgSend(*(id *)(a1 + 40), "timeStamp"), *(void *)(*(void *)(a1 + 32) + 512), 0.0);
    }
    else
    {
      char v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) == 0)
      {
LABEL_15:

        return;
      }
      id v16 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v18 = [*(id *)(a1 + 40) packets];
      objc_msgSend(v16, "speechControllerRecordBufferAvailable:buffers:durationInSec:recordedAt:", v21, v18, objc_msgSend(*(id *)(a1 + 40), "timeStamp"), 0.0);
    }

    goto LABEL_15;
  }
  double v19 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    id v25 = "-[CSSpeechController audioStreamProvider:audioChunkForTVAvailable:]_block_invoke";
    _os_log_error_impl(&dword_1C9338000, v19, OS_LOG_TYPE_ERROR, "%s SpeechManager still forwarding audio after didStopForwarding, we shouldn't have this", buf, 0xCu);
  }
}

- (void)_audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL didDeliverLastBuffer = self->_didDeliverLastBuffer;
  if (self->_didDeliverLastBuffer)
  {
    uint64_t v9 = (void *)*MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      *(_DWORD *)long long buf = 136315650;
      v89 = "-[CSSpeechController _audioStreamProvider:audioBufferAvailable:]";
      __int16 v90 = 1024;
      *(_DWORD *)v91 = didDeliverLastBuffer;
      *(_WORD *)&v91[4] = 2048;
      *(void *)&v91[6] = [v7 numSamples];
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEFAULT, "%s _didDeliverLastPacket=%d. Dropping Audio packets of size=%lu", buf, 0x1Cu);
    }
    goto LABEL_60;
  }
  if (![(CSSpeechController *)self hasPerformedDelayedStop]
    && [(CSAudioStopStreamOption *)self->_requestedStopRecordingOptions expectedStopHostTime]
    && [(CSSpeechController *)self canPerformDelayedStop])
  {
    unint64_t v11 = self->_numTrailingSamplesAfterSchedulingStop + [v7 numSamples];
    self->_unint64_t numTrailingSamplesAfterSchedulingStop = v11;
    uint64_t v12 = (os_log_t *)MEMORY[0x1E4F5D168];
    id v13 = (void *)*MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = v13;
      uint64_t v15 = [v7 hostTime];
      uint64_t v16 = [v7 numSamples];
      requestedStopRecordingOptions = self->_requestedStopRecordingOptions;
      unint64_t numTrailingSamplesAfterSchedulingStop = self->_numTrailingSamplesAfterSchedulingStop;
      unint64_t maxAllowedTrailingSamplesAfterSchedulingStop = self->_maxAllowedTrailingSamplesAfterSchedulingStop;
      *(_DWORD *)long long buf = 136316418;
      v89 = "-[CSSpeechController _audioStreamProvider:audioBufferAvailable:]";
      __int16 v90 = 2050;
      *(void *)v91 = v15;
      *(_WORD *)&v91[8] = 2050;
      *(void *)&v91[10] = v16;
      __int16 v92 = 2114;
      v93 = requestedStopRecordingOptions;
      __int16 v94 = 2050;
      unint64_t v95 = numTrailingSamplesAfterSchedulingStop;
      __int16 v96 = 2050;
      unint64_t v97 = maxAllowedTrailingSamplesAfterSchedulingStop;
      _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_DEFAULT, "%s chunk.hostTime=%{public}llu, chunkSz=%{public}lu, stopOptions=%{public}@, _numTrailingSamplesAfterSchedulingStop=%{public}lu, maxAllowedSamples=%{public}lu", buf, 0x3Eu);

      unint64_t v11 = self->_numTrailingSamplesAfterSchedulingStop;
    }
    if (v11 > self->_maxAllowedTrailingSamplesAfterSchedulingStop)
    {
      char v20 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        v89 = "-[CSSpeechController _audioStreamProvider:audioBufferAvailable:]";
        _os_log_impl(&dword_1C9338000, v20, OS_LOG_TYPE_DEFAULT, "%s STOPRECORDING: Reached MAX allowed trailing samples AFTER stopRecording was scheduled!", buf, 0xCu);
      }
LABEL_63:
      [(CSSpeechController *)self setHasPerformedDelayedStop:1];
      [(CSSpeechController *)self _delayedStopRecordingWithOptions:self->_requestedStopRecordingOptions];
      goto LABEL_60;
    }
    unint64_t v21 = [v7 hostTime];
    if (v21 >= [(CSAudioStopStreamOption *)self->_requestedStopRecordingOptions expectedStopHostTime])
    {
      os_log_t v75 = *v12;
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
      {
        v76 = v75;
        uint64_t v77 = [v7 hostTime];
        v78 = self->_requestedStopRecordingOptions;
        *(_DWORD *)long long buf = 136315650;
        v89 = "-[CSSpeechController _audioStreamProvider:audioBufferAvailable:]";
        __int16 v90 = 2050;
        *(void *)v91 = v77;
        *(_WORD *)&v91[8] = 2114;
        *(void *)&v91[10] = v78;
        _os_log_impl(&dword_1C9338000, v76, OS_LOG_TYPE_DEFAULT, "%s STOPRECORDING: chunk.hostTime=%{public}llu >= stopOptions=%{public}@", buf, 0x20u);
      }
      goto LABEL_63;
    }
  }
  uint64_t v22 = _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_SPEECH_MANAGER_LPCM_RECORD_BUFFER_AVAILABLE;
  if (__ROR8__(0xEEEEEEEEEEEEEEEFLL* _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_SPEECH_MANAGER_LPCM_RECORD_BUFFER_AVAILABLE, 1) <= 0x888888888888888uLL)
  {
    kdebug_trace();
    uint64_t v22 = _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_SPEECH_MANAGER_LPCM_RECORD_BUFFER_AVAILABLE;
  }
  _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_SPEECH_MANAGER_LPCM_RECORD_BUFFER_AVAILABLE = v22 + 1;
  if (self->_isSiriClientListening)
  {
    id v85 = v7;
    id v23 = v7;
    id v24 = [v23 data];
    id v25 = v24;
    if ([MEMORY[0x1E4F5D278] inputRecordingIsFloat])
    {
      id v25 = [MEMORY[0x1E4F5D2E8] convertToShortLPCMBufFromFloatLPCMBuf:v24];
    }
    -[CSAudioZeroCounter getZeroStatisticsFromBuffer:entireSamples:](self->_continuousZeroCounter, "getZeroStatisticsFromBuffer:entireSamples:", v24, [v24 length] / (unint64_t)objc_msgSend(v23, "sampleByteDepth"));
    -[CSSpeechEndHostTimeEstimator addNumSamples:hostTime:](self->_speechEndHostTimeEstimator, "addNumSamples:hostTime:", [v23 numSamples], objc_msgSend(v23, "hostTime"));
    int v26 = [MEMORY[0x1E4F5D278] inputRecordingIsFloat];
    powerMeter = self->_powerMeter;
    if (v26) {
      -[CSAudioPowerMeter processFloatBuffer:stride:inFrameToProcess:](powerMeter, "processFloatBuffer:stride:inFrameToProcess:", [v24 bytes], 1, objc_msgSend(v23, "numSamples"));
    }
    else {
      -[CSAudioPowerMeter processShortBuffer:stride:inFrameToProcess:](powerMeter, "processShortBuffer:stride:inFrameToProcess:", [v25 bytes], 1, objc_msgSend(v23, "numSamples"));
    }
    int v29 = self->_powerMeter;
    if (v29)
    {
      [(CSAudioPowerMeter *)v29 getAveragePowerDB];
      *(float *)&double v30 = v30;
      self->_cachedAvgPower = *(float *)&v30;
      [(CSAudioPowerMeter *)self->_powerMeter getPeakPowerDB];
      *(float *)&double v31 = v31;
      self->_cachedPeakPower = *(float *)&v31;
    }
    if (self->_shouldUseLanguageDetectorForCurrentRequest) {
      -[CSLanguageDetector addSamples:numSamples:](self->_languageDetector, "addSamples:numSamples:", v24, [v23 numSamples]);
    }
    v84 = v24;
    v87 = v25;
    if (self->_isNarrowBand)
    {
      downsampler = self->_downsampler;
      __int16 v33 = [v23 data];
      v34 = [(CSAudioSampleRateConverter *)downsampler convertSampleRateOfBuffer:v33];

      id v81 = v6;
      if ([MEMORY[0x1E4F5D278] inputRecordingIsFloat])
      {
        id v35 = [MEMORY[0x1E4F5D2E8] convertToShortLPCMBufFromFloatLPCMBuf:v34];
      }
      else
      {
        id v35 = v34;
      }
      id v86 = v35;
      unint64_t v38 = [v34 length];
      unint64_t v82 = v38 / [v23 sampleByteDepth];
      v39 = v34;
      id v40 = objc_alloc(MEMORY[0x1E4F5D1A8]);
      uint64_t v41 = [v23 sampleByteDepth];
      uint64_t v42 = [v23 startSampleCount];
      uint64_t v43 = [v23 hostTime];
      uint64_t v44 = [v23 arrivalHostTimeToAudioRecorder];
      char v45 = [v23 wasBuffered];
      v46 = [v23 remoteVAD];
      LOBYTE(v80) = [v23 isFloat];
      LOBYTE(v79) = v45;
      v47 = v40;
      uint64_t v36 = v39;
      id v37 = (id)[v47 initWithData:v39 numChannels:1 numSamples:v82 sampleByteDepth:v41 startSampleCount:v42 hostTime:v43 arrivalHostTimeToAudioRecorder:v44 wasBuffered:v79 remoteVAD:v46 isFloat:v80];

      id v6 = v81;
      id v25 = v87;
    }
    else
    {
      uint64_t v36 = [v23 data];
      id v86 = v25;
      id v37 = v23;
    }
    [(CSContinuousVoiceTrigger *)self->_continuousVoiceTrigger processAudioSamples:v23];
    -[SSRSpeakerRecognitionController processAudio:withNumberOfSamples:](self->_speakerRecognitionController, "processAudio:withNumberOfSamples:", v25, [v23 numSamples]);
    [(CSEndpointerProxy *)self->_endpointerProxy processAudioSamplesAsynchronously:v37];
    uint64_t v48 = _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_BEGIN;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_BEGIN, 1) <= 0x888888888888888uLL)
    {
      kdebug_trace();
      uint64_t v48 = _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_BEGIN;
    }
    _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_BEGIN = v48 + 1;
    if (!self->_isAsrOnDevice) {
      -[CSAudioConverter addSamples:timestamp:arrivalTimestampToAudioRecorder:](self->_audioConverter, "addSamples:timestamp:arrivalTimestampToAudioRecorder:", v36, [v23 hostTime], objc_msgSend(v23, "arrivalHostTimeToAudioRecorder"));
    }
    uint64_t v49 = _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_END;
    if (__ROR8__(0xEEEEEEEEEEEEEEEFLL * _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_END, 1) <= 0x888888888888888uLL)
    {
      kdebug_trace();
      uint64_t v49 = _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_END;
    }
    v83 = v37;
    _audioStreamProvider_audioBufferAvailable__heartbeat_CORESPEECH_OPUS_ENCODING_END = v49 + 1;
    id v50 = v36;
    id v51 = v50;
    if ([MEMORY[0x1E4F5D278] inputRecordingIsFloat])
    {
      id v51 = v50;
      if ((CSIsOSX() & 1) == 0)
      {
        id v51 = v86;
      }
    }
    [(CSUncompressedAudioLogging *)self->_uncompressedAudioLogging appendAudioData:v51];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v53 = objc_opt_respondsToSelector();

    id v54 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v53)
    {
      objc_msgSend(v54, "speechControllerLPCMRecordBufferAvailable:buffer:recordedAt:", self, v51, objc_msgSend(v23, "hostTime"));
    }
    else
    {
      char v55 = objc_opt_respondsToSelector();

      if ((v55 & 1) == 0)
      {
LABEL_47:
        if (self->_isRemoteVADAvailableStream)
        {
          [MEMORY[0x1E4F5D278] remoteVADDuration];
          float v57 = v56;
          [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
          unint64_t v59 = (unint64_t)(float)(v57 * v58);
          LODWORD(v60) = 1176256512;
          v61 = [v23 dataWithRemoteVADWithScaleFactor:v59 numAudioSamplesPerRemoteVAD:v60];
          v62 = v61;
          if (v61) {
            -[CSPlainAudioFileWriter addSamples:numSamples:](self->_audioFileWriter, "addSamples:numSamples:", [v61 bytes], objc_msgSend(v23, "numSamples"));
          }
        }
        else
        {
          -[CSPlainAudioFileWriter addSamples:numSamples:](self->_audioFileWriter, "addSamples:numSamples:", [v25 bytes], objc_msgSend(v23, "numSamples"));
        }
        serverLoggingWriter = self->_serverLoggingWriter;
        id v64 = [v23 data];
        -[CSSelectiveChannelAudioFileWriter addSamples:numSamples:](serverLoggingWriter, "addSamples:numSamples:", [v64 bytes], objc_msgSend(v23, "numSamples"));

        if (![(CSSpeechController *)self hasPerformedDelayedStop])
        {
          if ([(CSAudioStopStreamOption *)self->_requestedStopRecordingOptions expectedStopHostTime])
          {
            if ([(CSSpeechController *)self canPerformDelayedStop])
            {
              v65 = (void *)MEMORY[0x1E4F5D300];
              float v66 = (float)(unint64_t)[v23 numSamples];
              [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
              *(float *)&double v68 = v66 / v67;
              uint64_t v69 = [v65 secondsToHostTime:v68];
              unint64_t v70 = [v23 hostTime] + v69;
              if (v70 >= [(CSAudioStopStreamOption *)self->_requestedStopRecordingOptions expectedStopHostTime])
              {
                v71 = (void *)*MEMORY[0x1E4F5D168];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
                {
                  v72 = v71;
                  uint64_t v73 = [v23 hostTime];
                  v74 = self->_requestedStopRecordingOptions;
                  *(_DWORD *)long long buf = 136315650;
                  v89 = "-[CSSpeechController _audioStreamProvider:audioBufferAvailable:]";
                  __int16 v90 = 2050;
                  *(void *)v91 = v73 + v69;
                  *(_WORD *)&v91[8] = 2114;
                  *(void *)&v91[10] = v74;
                  _os_log_impl(&dword_1C9338000, v72, OS_LOG_TYPE_DEFAULT, "%s STOPRECORDING: chunk.endHostTime=%{public}llu >= stopOptions=%{public}@", buf, 0x20u);
                }
                [(CSSpeechController *)self setHasPerformedDelayedStop:1];
                [(CSSpeechController *)self _delayedStopRecordingWithOptions:self->_requestedStopRecordingOptions];
              }
            }
          }
        }

        id v7 = v85;
        goto LABEL_60;
      }
      id v54 = objc_loadWeakRetained((id *)&self->_delegate);
      [v54 speechControllerLPCMRecordBufferAvailable:self buffer:v51];
    }

    goto LABEL_47;
  }
  __int16 v28 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    v89 = "-[CSSpeechController _audioStreamProvider:audioBufferAvailable:]";
    _os_log_error_impl(&dword_1C9338000, v28, OS_LOG_TYPE_ERROR, "%s SpeechManager still forwarding audio after didStopForwarding, we shouldn't have this", buf, 0xCu);
  }
LABEL_60:
}

- (void)audioStreamProvider:(id)a3 audioBufferAvailable:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 numSamples];
  if (v7 >= 1)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    do
    {
      id v10 = (void *)MEMORY[0x1CB784FE0]();
      [MEMORY[0x1E4F5D278] inputRecordingBufferDuration];
      double v12 = v11;
      [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
      double v14 = v12 * v13;
      if (v14 > (double)v8) {
        double v14 = (double)v8;
      }
      uint64_t v15 = (uint64_t)v14;
      uint64_t v16 = objc_msgSend(v6, "subChunkFrom:numSamples:", v9, (uint64_t)v14, v24);
      uint64_t v17 = [v6 remoteVAD];

      if (v17)
      {
        [MEMORY[0x1E4F5D278] remoteVADDuration];
        float v19 = v18;
        [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
        unint64_t v21 = [v6 remoteVADSubChunkFrom:v9 numSamples:v15 numAudioSamplesPerRemoteVAD:(unint64_t)(float)(v19 * v20)];
        [v16 setRemoteVAD:v21];
      }
      v8 -= [v16 numSamples];
      v9 += [v16 numSamples];
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__CSSpeechController_audioStreamProvider_audioBufferAvailable___block_invoke;
      block[3] = &unk_1E658D3F0;
      void block[4] = self;
      id v26 = v24;
      id v27 = v16;
      id v23 = v16;
      dispatch_async(queue, block);
    }
    while (v8 > 0);
  }
}

uint64_t __63__CSSpeechController_audioStreamProvider_audioBufferAvailable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _audioStreamProvider:*(void *)(a1 + 40) audioBufferAvailable:*(void *)(a1 + 48)];
}

- (void)audioStreamProvider:(id)a3 didStopStreamUnexpectedly:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    id v10 = "-[CSSpeechController audioStreamProvider:didStopStreamUnexpectedly:]";
    _os_log_error_impl(&dword_1C9338000, v6, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__CSSpeechController_audioStreamProvider_didStopStreamUnexpectedly___block_invoke;
  v8[3] = &unk_1E658D3C8;
  v8[4] = self;
  void v8[5] = a4;
  dispatch_async(queue, v8);
}

uint64_t __68__CSSpeechController_audioStreamProvider_didStopStreamUnexpectedly___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _didStopForReason:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _logRecordingStopErrorIfNeeded:v3];
}

- (BOOL)_isDuckingAvailableRoute:(id)a3
{
  id v3 = a3;
  if (!CSIsIOS())
  {
    if (CSIsWatch())
    {
      if ([v3 isEqualToString:*MEMORY[0x1E4F152F8]]) {
        goto LABEL_6;
      }
    }
    else if (CSIsHorseman())
    {
      goto LABEL_6;
    }
    char v4 = 0;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:*MEMORY[0x1E4F152F8]])
  {
LABEL_6:
    char v4 = 1;
    goto LABEL_9;
  }
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F15328]];
LABEL_9:

  return v4;
}

- (void)_didStopForReason:(int64_t)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if (a3 == 2) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = a3;
  }
  id v6 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    v72 = "-[CSSpeechController _didStopForReason:]";
    __int16 v73 = 2050;
    uint64_t v74 = v5;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s Reason : %{public}ld", buf, 0x16u);
  }
  if ([(CSAudioStopStreamOption *)self->_requestedStopRecordingOptions stopRecordingReason] == 3)
  {
    unint64_t v7 = 0;
  }
  else if ([(CSSpeechController *)self _shouldCalculateEstimatedSpeechEndHostTimeFromCachedEPMetrics])
  {
    uint64_t v8 = [(CSEndpointerProxy *)self->_endpointerProxy cachedEndpointerMetrics];
    speechEndHostTimeEstimator = self->_speechEndHostTimeEstimator;
    [v8 trailingSilenceDurationAtEndpoint];
    -[CSSpeechEndHostTimeEstimator notifyTrailingSilenceDurationAtEndpoint:](speechEndHostTimeEstimator, "notifyTrailingSilenceDurationAtEndpoint:");
    id v10 = [v8 additionalMetrics];
    uint64_t v11 = [v10 objectForKey:@"lastAudioChunkHostTime"];
    uint64_t v12 = [v11 unsignedLongLongValue];

    unint64_t v7 = [(CSSpeechEndHostTimeEstimator *)self->_speechEndHostTimeEstimator estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:v12];
    float v13 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      v72 = "-[CSSpeechController _didStopForReason:]";
      __int16 v73 = 2112;
      uint64_t v74 = (uint64_t)v8;
      _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation using cached EP metrics : %@", buf, 0x16u);
    }
  }
  else
  {
    double v14 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      v72 = "-[CSSpeechController _didStopForReason:]";
      _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: Should Estimate SpeechEndHostTime", buf, 0xCu);
    }
    uint64_t v15 = self->_speechEndHostTimeEstimator;
    [(CSAudioStopStreamOption *)self->_requestedStopRecordingOptions trailingSilenceDurationAtEndpoint];
    -[CSSpeechEndHostTimeEstimator notifyTrailingSilenceDurationAtEndpoint:](v15, "notifyTrailingSilenceDurationAtEndpoint:");
    unint64_t v7 = [(CSSpeechEndHostTimeEstimator *)self->_speechEndHostTimeEstimator estimatedSpeechEndHostTime];
  }
  [(CSEndpointerProxy *)self->_endpointerProxy recordingStoppedForReason:v5];
  [(SSRSpeakerRecognitionController *)self->_speakerRecognitionController endAudio];
  [(CSSpeakerRecognitionProxy *)self->_speakerRecognitionProxy invalidateXPCConnection];
  if (!self->_isAsrOnDevice) {
    [(CSAudioConverter *)self->_audioConverter flush];
  }
  if (self->_shouldUseLanguageDetectorForCurrentRequest) {
    [(CSLanguageDetector *)self->_languageDetector endAudio];
  }
  *(_WORD *)&self->_isSiriClientListening = 0;
  if (!self->_didDeliverLastBuffer)
  {
    self->_BOOL didDeliverLastBuffer = 1;
    uint64_t v16 = (void *)*MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v16;
      uint64_t v18 = mach_absolute_time();
      *(_DWORD *)long long buf = 136315394;
      v72 = "-[CSSpeechController _didStopForReason:]";
      __int16 v73 = 2050;
      uint64_t v74 = v18;
      _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_DEFAULT, "%s Reporting didDeliverLastPacket at: %{public}llu", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      id v21 = objc_loadWeakRetained((id *)&self->_delegate);
      [v21 speechControllerDidDeliverLastBuffer:self forReason:v5 estimatedSpeechEndHostTime:v7];
    }
  }
  id v22 = objc_loadWeakRetained((id *)&self->_delegate);
  char v23 = objc_opt_respondsToSelector();

  if (v23)
  {
    if (v5 != 1)
    {
      id v24 = [(CSSpeechController *)self streamProvider];
      id v25 = [v24 audioDeviceInfo];
      audioDeviceInfoImpl = self->_audioDeviceInfoImpl;
      self->_audioDeviceInfoImpl = v25;
    }
    id v27 = (void *)*MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v28 = v27;
      uint64_t v29 = mach_absolute_time();
      double v30 = [(CSFAudioDeviceInfo *)self->_audioDeviceInfoImpl description];
      *(_DWORD *)long long buf = 136315906;
      v72 = "-[CSSpeechController _didStopForReason:]";
      __int16 v73 = 2050;
      uint64_t v74 = v7;
      __int16 v75 = 2050;
      uint64_t v76 = v29;
      __int16 v77 = 2114;
      v78 = v30;
      _os_log_impl(&dword_1C9338000, v28, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: Reporting didStop with estimated speech end : %{public}llu, at: %{public}llu, audioDeviceInfo: %{public}@", buf, 0x2Au);
    }
    id v31 = objc_loadWeakRetained((id *)&self->_delegate);
    [v31 speechControllerDidStopRecording:self audioDeviceInfo:self->_audioDeviceInfoImpl forReason:v5 estimatedSpeechEndHostTime:v7];
  }
  else
  {
    id v32 = objc_loadWeakRetained((id *)&self->_delegate);
    char v33 = objc_opt_respondsToSelector();

    if ((v33 & 1) == 0) {
      goto LABEL_35;
    }
    v34 = (void *)*MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      id v35 = v34;
      uint64_t v36 = mach_absolute_time();
      *(_DWORD *)long long buf = 136315650;
      v72 = "-[CSSpeechController _didStopForReason:]";
      __int16 v73 = 2050;
      uint64_t v74 = v7;
      __int16 v75 = 2050;
      uint64_t v76 = v36;
      _os_log_impl(&dword_1C9338000, v35, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: Reporting didStop with estimated speech end : %{public}llu, at: %{public}llu", buf, 0x20u);
    }
    id v31 = objc_loadWeakRetained((id *)&self->_delegate);
    [v31 speechControllerDidStopRecording:self forReason:v5 estimatedSpeechEndHostTime:v7];
  }

LABEL_35:
  audioFileWriter = self->_audioFileWriter;
  if (audioFileWriter)
  {
    [(CSPlainAudioFileWriter *)audioFileWriter endAudio];
    [(CSPlainAudioFileWriter *)self->_audioFileWriter addContextKey:@"vtei" withContext:self->_lastVoiceTriggerInfo];
    [(CSPlainAudioFileWriter *)self->_audioFileWriter addContextKey:@"ssvmeta" fromMetaFile:self->_ssvLogFilePath];
  }
  [(CSUncompressedAudioLogging *)self->_uncompressedAudioLogging endAudioWithCancellation:a3 != 0 completion:0];
  uncompressedAudioLogging = self->_uncompressedAudioLogging;
  self->_uncompressedAudioLogging = 0;

  [(CSSelectiveChannelAudioFileWriter *)self->_serverLoggingWriter endAudio];
  [(CSSpeechController *)self _deviceAudioLoggingWithFileWriter:self->_serverLoggingWriter];
  continuousZeroCounter = self->_continuousZeroCounter;
  id v40 = [MEMORY[0x1E4F5D498] sharedAggregator];
  [(CSAudioZeroCounter *)continuousZeroCounter stopCountingZeroStatisticsWithReporter:v40];

  [(CSAudioPowerMeter *)self->_powerMeter reset];
  uint64_t v41 = [MEMORY[0x1E4F5D3E0] sharedInstance];
  [v41 notifyDidStopStream:0 withEventUUID:self->_recordEventUUID];

  if ([(CSSpeechController *)self _isHubRequestTV]) {
    [(NSMutableDictionary *)self->_decodersForTV removeAllObjects];
  }
  uint64_t v42 = [(CSSpeechController *)self recordRoute];
  BOOL v43 = [(CSSpeechController *)self _isDuckingAvailableRoute:v42];

  if (!v43)
  {
    uint64_t v44 = [MEMORY[0x1E4F5D1D0] sharedMonitor];
    char v45 = [v44 playingApps];

    v46 = (void *)*MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      v47 = v46;
      int v48 = [v45 count];
      *(_DWORD *)long long buf = 136315394;
      v72 = "-[CSSpeechController _didStopForReason:]";
      __int16 v73 = 1024;
      LODWORD(v74) = v48;
      _os_log_impl(&dword_1C9338000, v47, OS_LOG_TYPE_DEFAULT, "%s Currently playing App : %d", buf, 0x12u);
    }
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id v49 = v45;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v66 objects:v70 count:16];
    if (v50)
    {
      uint64_t v52 = v50;
      uint64_t v53 = *(void *)v67;
      *(void *)&long long v51 = 136315650;
      long long v65 = v51;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v67 != v53) {
            objc_enumerationMutation(v49);
          }
          char v55 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          float v56 = objc_msgSend(v55, "appName", v65, (void)v66);
          float v57 = [v55 version];
          uint64_t v58 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:self->_requestMHUUID];
          unint64_t v59 = (void *)v58;
          if (v56) {
            BOOL v60 = v57 == 0;
          }
          else {
            BOOL v60 = 1;
          }
          if (!v60 && v58 != 0)
          {
            v62 = self;
            v63 = *MEMORY[0x1E4F5D168];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = v65;
              v72 = "-[CSSpeechController _didStopForReason:]";
              __int16 v73 = 2112;
              uint64_t v74 = (uint64_t)v56;
              __int16 v75 = 2112;
              uint64_t v76 = (uint64_t)v57;
              _os_log_impl(&dword_1C9338000, v63, OS_LOG_TYPE_DEFAULT, "%s name : %@, version : %@", buf, 0x20u);
            }
            id v64 = [MEMORY[0x1E4F5D2D0] sharedLogger];
            [v64 logMHApplicationPlaybackAttemptedWithMHUUID:v59 withAppBundleName:v56 withAppBundleVersion:v57];

            self = v62;
          }
        }
        uint64_t v52 = [v49 countByEnumeratingWithState:&v66 objects:v70 count:16];
      }
      while (v52);
    }
  }
}

- (BOOL)_shouldFetchRaiseToSpeakInfo
{
  return [(CSAudioRecordContext *)self->_audioRecordContext isRTSTriggered];
}

- (BOOL)_shouldFetchVoiceTriggerInfo
{
  return [(CSAudioRecordContext *)self->_audioRecordContext isVoiceTriggered];
}

- (id)playbackRoute
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(CSSpeechController *)self streamProvider];
  id v3 = [v2 playbackRoute];

  char v4 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    unint64_t v7 = "-[CSSpeechController playbackRoute]";
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (id)audioDeviceInfo
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(CSSpeechController *)self streamProvider];
  id v3 = [v2 audioDeviceInfo];

  char v4 = (void *)*MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = v4;
    int v6 = [v3 description];
    int v8 = 136315394;
    uint64_t v9 = "-[CSSpeechController audioDeviceInfo]";
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return v3;
}

- (id)recordDeviceInfo
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(CSSpeechController *)self streamProvider];
  id v3 = [v2 recordDeviceInfo];

  char v4 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    unint64_t v7 = "-[CSSpeechController recordDeviceInfo]";
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (id)recordRoute
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(CSSpeechController *)self streamProvider];
  id v3 = [v2 recordRoute];

  char v4 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    unint64_t v7 = "-[CSSpeechController recordRoute]";
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s %{public}@", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

- (BOOL)_canDelayStopRecording
{
  uint64_t v2 = [(CSSpeechController *)self streamProvider];
  id v3 = [v2 recordRoute];

  if ([v3 isEqualToString:*MEMORY[0x1E4F150F0]]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4F15120]];
  }

  return v4;
}

- (BOOL)_isRecordRouteStudioDisplay
{
  uint64_t v2 = [(CSSpeechController *)self streamProvider];
  id v3 = [v2 recordRoute];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F15120]];

  return v4;
}

- (BOOL)_isRecordRouteBuiltinMic
{
  uint64_t v2 = [(CSSpeechController *)self streamProvider];
  id v3 = [v2 recordRoute];
  char v4 = [v3 isEqualToString:*MEMORY[0x1E4F150F0]];

  return v4;
}

- (BOOL)isRecording
{
  uint64_t v2 = [(CSSpeechController *)self audioStream];
  char v3 = [v2 isStreaming];

  return v3;
}

- (unint64_t)_calculateEstimatedSpeechEndHostTimeWithStopOptions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CSSpeechController *)self _shouldCalculateEstimatedSpeechEndHostTimeFromCachedEPMetrics])
  {
    int64_t v5 = [(CSEndpointerProxy *)self->_endpointerProxy cachedEndpointerMetrics];
    speechEndHostTimeEstimator = self->_speechEndHostTimeEstimator;
    [v5 trailingSilenceDurationAtEndpoint];
    -[CSSpeechEndHostTimeEstimator notifyTrailingSilenceDurationAtEndpoint:](speechEndHostTimeEstimator, "notifyTrailingSilenceDurationAtEndpoint:");
    unint64_t v7 = [v5 additionalMetrics];
    __int16 v8 = [v7 objectForKey:@"lastAudioChunkHostTime"];
    uint64_t v9 = [v8 unsignedLongLongValue];

    unint64_t v10 = [(CSSpeechEndHostTimeEstimator *)self->_speechEndHostTimeEstimator estimatedSpeechEndHostTimeWithLastAudioChunkHostTime:v9];
    uint64_t v11 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      uint64_t v15 = "-[CSSpeechController _calculateEstimatedSpeechEndHostTimeWithStopOptions:]";
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_DEFAULT, "%s Send estimatedSpeechEndHostTime using cached EP metrics : %@", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    uint64_t v12 = self->_speechEndHostTimeEstimator;
    [v4 trailingSilenceDurationAtEndpoint];
    -[CSSpeechEndHostTimeEstimator notifyTrailingSilenceDurationAtEndpoint:](v12, "notifyTrailingSilenceDurationAtEndpoint:");
    unint64_t v10 = [(CSSpeechEndHostTimeEstimator *)self->_speechEndHostTimeEstimator estimatedSpeechEndHostTime];
  }

  return v10;
}

- (BOOL)_shouldCalculateEstimatedSpeechEndHostTimeFromCachedEPMetrics
{
  int v3 = [MEMORY[0x1E4F5D450] isContinuousConversationSupported];
  if (v3)
  {
    audioRecordContext = self->_audioRecordContext;
    LOBYTE(v3) = [(CSAudioRecordContext *)audioRecordContext isContinuousConversation];
  }
  return v3;
}

- (void)stopRecordingWithOptions:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CSSpeechController_stopRecordingWithOptions___block_invoke;
  v7[3] = &unk_1E658D4B0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __47__CSSpeechController_stopRecordingWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  id v25 = __47__CSSpeechController_stopRecordingWithOptions___block_invoke_2;
  id v26 = &unk_1E658A340;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v27 = v2;
  uint64_t v28 = v3;
  id v4 = (void (**)(void, void))MEMORY[0x1CB785210](&v23);
  if (objc_msgSend(*(id *)(a1 + 32), "stopRecordingReason", v23, v24, v25, v26) == 3) {
    [*(id *)(*(void *)(a1 + 40) + 544) cancelAudioLogging];
  }
  int64_t v5 = (os_log_t *)MEMORY[0x1E4F5D168];
  id v6 = (void *)*MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = v6;
    uint64_t v9 = mach_absolute_time();
    *(_DWORD *)long long buf = 136315650;
    double v30 = "-[CSSpeechController stopRecordingWithOptions:]_block_invoke";
    __int16 v31 = 2114;
    uint64_t v32 = v7;
    __int16 v33 = 2050;
    uint64_t v34 = v9;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Options: %{public}@ at: %{public}llu", buf, 0x20u);
  }
  uint64_t v10 = [*(id *)(a1 + 32) copy];
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = *(void **)(v11 + 376);
  *(void *)(v11 + 376) = v10;

  uint64_t v13 = [*(id *)(a1 + 32) stopRecordingReason];
  if (([*(id *)(a1 + 40) _shouldCalculateEstimatedSpeechEndHostTimeFromCachedEPMetrics] & 1) != 0
    || v13 == 1)
  {
    if ([*(id *)(a1 + 40) _isRecordRouteStudioDisplay]
      && [*(id *)(a1 + 40) canPerformDelayedStop]
      && [*(id *)(a1 + 32) expectedStopHostTime])
    {
      v4[2](v4, 1);
      goto LABEL_22;
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 131) = 1;
    os_log_t v15 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = v15;
      uint64_t v17 = mach_absolute_time();
      *(_DWORD *)long long buf = 136315394;
      double v30 = "-[CSSpeechController stopRecordingWithOptions:]_block_invoke";
      __int16 v31 = 2050;
      uint64_t v32 = v17;
      _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_DEFAULT, "%s Reporting didDeliverLastPacket at: %{public}llu", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 144));
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      uint64_t v20 = [*(id *)(a1 + 40) _calculateEstimatedSpeechEndHostTimeWithStopOptions:*(void *)(a1 + 32)];
      id v21 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        double v30 = "-[CSSpeechController stopRecordingWithOptions:]_block_invoke";
        __int16 v31 = 2050;
        uint64_t v32 = v20;
        _os_log_impl(&dword_1C9338000, v21, OS_LOG_TYPE_DEFAULT, "%s SpeechEndEstimation: %{public}llu", buf, 0x16u);
      }
      id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 144));
      [v22 speechControllerDidDeliverLastBuffer:*(void *)(a1 + 40) forReason:0 estimatedSpeechEndHostTime:v20];
    }
    goto LABEL_21;
  }
  if (![*(id *)(a1 + 32) expectedStopHostTime]
    || ![*(id *)(a1 + 40) canPerformDelayedStop])
  {
LABEL_21:
    [*(id *)(a1 + 40) handleStopRecordingRequestWithOptions:*(void *)(a1 + 32)];
    goto LABEL_22;
  }
  [MEMORY[0x1E4F5D278] inputRecordingBufferDuration];
  v4[2](v4, (unint64_t)(v14 * 3.0));
LABEL_22:
}

uint64_t __47__CSSpeechController_stopRecordingWithOptions___block_invoke_2(uint64_t a1, unint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)*MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = *(void **)(a1 + 32);
    id v6 = v4;
    int v9 = 136315394;
    uint64_t v10 = "-[CSSpeechController stopRecordingWithOptions:]_block_invoke_2";
    __int16 v11 = 2050;
    uint64_t v12 = [v5 expectedStopHostTime];
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s Scheduling StopRecording After HostTime=%{public}llu", (uint8_t *)&v9, 0x16u);
  }
  *(void *)(*(void *)(a1 + 40) + 384) = 0;
  uint64_t result = [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
  *(void *)(*(void *)(a1 + 40) + 392) = (unint64_t)(float)(v8 * (float)a2);
  return result;
}

- (void)handleStopRecordingRequestWithOptions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (os_log_t *)MEMORY[0x1E4F5D168];
  uint64_t v7 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v17 = "-[CSSpeechController handleStopRecordingRequestWithOptions:]";
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s options :%@", buf, 0x16u);
  }
  kdebug_trace();
  float v8 = NSStringFromSelector(a2);
  [(CSSpeechController *)self _cancelPendingAudioSessionActivateForReason:v8];

  int v9 = [(CSSpeechController *)self audioStream];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F5D3E0] sharedInstance];
    [v10 notifyWillStopStream:0 reason:0 withEventUUID:self->_recordEventUUID];

    __int16 v11 = [(CSSpeechController *)self audioStream];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __60__CSSpeechController_handleStopRecordingRequestWithOptions___block_invoke;
    v15[3] = &unk_1E658D2B0;
    v15[4] = self;
    [v11 stopAudioStreamWithOption:v5 completion:v15];
  }
  else
  {
    uint64_t v12 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v17 = "-[CSSpeechController handleStopRecordingRequestWithOptions:]";
      _os_log_error_impl(&dword_1C9338000, v12, OS_LOG_TYPE_ERROR, "%s Asking stopRecording when audio stream is not existing", buf, 0xCu);
    }
    queue = self->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__CSSpeechController_handleStopRecordingRequestWithOptions___block_invoke_316;
    v14[3] = &unk_1E658D4D8;
    v14[4] = self;
    dispatch_async(queue, v14);
  }
}

void __60__CSSpeechController_handleStopRecordingRequestWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CSSpeechController_handleStopRecordingRequestWithOptions___block_invoke_2;
  block[3] = &unk_1E658D4D8;
  void block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __60__CSSpeechController_handleStopRecordingRequestWithOptions___block_invoke_316(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didStopForReason:0];
}

uint64_t __60__CSSpeechController_handleStopRecordingRequestWithOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didStopForReason:0];
}

- (void)stopRecording
{
}

- (BOOL)startRecording:(id *)a3
{
  return [(CSSpeechController *)self startRecordingWithSettings:MEMORY[0x1E4F1CC08] error:a3];
}

- (BOOL)_shouldSetStartSampleCountForRTS
{
  if (![(CSAudioRecordContext *)self->_audioRecordContext isRTSTriggered]) {
    return 0;
  }
  lastRTSTriggerInfo = self->_lastRTSTriggerInfo;
  if (!lastRTSTriggerInfo) {
    return 0;
  }
  id v4 = [(NSDictionary *)lastRTSTriggerInfo objectForKeyedSubscript:*MEMORY[0x1E4F5D5D0]];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)_shouldSetStartSampleCount
{
  if ((-[CSAudioRecordContext isBuiltInVoiceTriggered](self->_audioRecordContext, "isBuiltInVoiceTriggered")&& ([MEMORY[0x1E4F5D450] isLocalVoiceTriggerAvailable] & 1) != 0|| (-[CSAudioRecordContext isHearstVoiceTriggered](self->_audioRecordContext, "isHearstVoiceTriggered") & 1) != 0|| -[CSAudioRecordContext isJarvisVoiceTriggered](self->_audioRecordContext, "isJarvisVoiceTriggered"))&& (lastVoiceTriggerInfo = self->_lastVoiceTriggerInfo) != 0)
  {
    id v4 = [(NSDictionary *)lastVoiceTriggerInfo objectForKeyedSubscript:*MEMORY[0x1E4F5D988]];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }
  if ([(CSAudioRecordContext *)self->_audioRecordContext isRemoraVoiceTriggered])
  {
    id v6 = self->_lastVoiceTriggerInfo;
    if (v6)
    {
      uint64_t v7 = [(NSDictionary *)v6 objectForKeyedSubscript:*MEMORY[0x1E4F5D988]];

      if (v7) {
        return 1;
      }
    }
  }
  return v5;
}

- (BOOL)_shouldUseLanguageDetector:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  uint64_t v5 = [v3 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorDictationLanguages"];
  if (!v5) {
    goto LABEL_6;
  }
  id v6 = (void *)v5;
  uint64_t v7 = [v4 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorDictationLanguages"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_6;
  }
  int v9 = [v4 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorDictationLanguages"];
  uint64_t v10 = [v9 count];

  if (v10) {
    BOOL v11 = 1;
  }
  else {
LABEL_6:
  }
    BOOL v11 = 0;

  return v11;
}

- (void)_createLanguageDetectorIfNeeded
{
  if (!self->_languageDetector)
  {
    id v3 = objc_alloc_init(CSLanguageDetector);
    languageDetector = self->_languageDetector;
    self->_languageDetector = v3;
  }
}

- (void)_startPhaticDecision
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ([(CSAudioRecordContext *)self->_audioRecordContext isVoiceTriggered])
  {
    lastVoiceTriggerInfo = self->_lastVoiceTriggerInfo;
    if (lastVoiceTriggerInfo)
    {
      uint64_t v4 = [(NSDictionary *)lastVoiceTriggerInfo objectForKeyedSubscript:*MEMORY[0x1E4F5D928]];
      if (v4)
      {
        uint64_t v5 = (void *)v4;
        uint64_t v6 = *MEMORY[0x1E4F5D9A0];
        uint64_t v7 = [(NSDictionary *)self->_lastVoiceTriggerInfo objectForKeyedSubscript:*MEMORY[0x1E4F5D9A0]];

        if (v7)
        {
          float v8 = [(NSDictionary *)self->_lastVoiceTriggerInfo objectForKeyedSubscript:*MEMORY[0x1E4F5D958]];
          uint64_t v9 = [v8 unsignedLongLongValue];

          uint64_t v10 = [(NSDictionary *)self->_lastVoiceTriggerInfo objectForKeyedSubscript:v6];
          [v10 doubleValue];
          unint64_t v11 = CSMachAbsoluteTimeAddTimeInterval();

          uint64_t v12 = mach_absolute_time();
          uint64_t v13 = (os_log_t *)MEMORY[0x1E4F5D168];
          if (v12 <= v11)
          {
            unint64_t v15 = v11;
          }
          else
          {
            double v14 = (void *)*MEMORY[0x1E4F5D168];
            unint64_t v15 = v12;
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
            {
              __int16 v16 = v14;
              CSMachAbsoluteTimeGetTimeInterval();
              *(_DWORD *)long long buf = 136315906;
              uint64_t v29 = "-[CSSpeechController _startPhaticDecision]";
              __int16 v30 = 2050;
              double v31 = v17;
              __int16 v32 = 2050;
              unint64_t v33 = v11;
              __int16 v34 = 2050;
              uint64_t v35 = v12;
              _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_DEFAULT, "%s Start recording invoked too late (%{public}.3f seconds), override scheduledCheckTime: %{public}llu to currentTime: %{public}llu", buf, 0x2Au);

              unint64_t v15 = v12;
            }
          }
          CSMachAbsoluteTimeGetTimeInterval();
          double v19 = v18;
          uint64_t v20 = *v13;
          if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315906;
            uint64_t v29 = "-[CSSpeechController _startPhaticDecision]";
            __int16 v30 = 2050;
            double v31 = v19;
            __int16 v32 = 2050;
            unint64_t v33 = v9;
            __int16 v34 = 2050;
            uint64_t v35 = v12;
            _os_log_impl(&dword_1C9338000, v20, OS_LOG_TYPE_DEFAULT, "%s Scheduled audible feedback decision after %{public}.3fseconds (vtEndMachTime: %{public}llu currentMachTime: %{public}llu)", buf, 0x2Au);
          }
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __42__CSSpeechController__startPhaticDecision__block_invoke;
          v27[3] = &unk_1E658D3C8;
          v27[4] = self;
          v27[5] = v15;
          id v21 = (void *)MEMORY[0x1CB785210](v27);
          dispatch_time_t v22 = dispatch_time(0, (uint64_t)(v19 * 1000000000.0));
          audibleFeedbackQueue = self->_audibleFeedbackQueue;
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __42__CSSpeechController__startPhaticDecision__block_invoke_314;
          v25[3] = &unk_1E658D3A0;
          v25[4] = self;
          id v26 = v21;
          id v24 = v21;
          dispatch_after(v22, audibleFeedbackQueue, v25);
        }
      }
    }
  }
}

void __42__CSSpeechController__startPhaticDecision__block_invoke(uint64_t a1)
{
  v31[2] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 118))
  {
    uint64_t v10 = *MEMORY[0x1E4F5D168];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)long long buf = 136315138;
    id v27 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
    unint64_t v11 = "%s Two shot audible feedback decision not needed since we already stopped recording";
    goto LABEL_10;
  }
  [*(id *)(v1 + 168) postVoiceTriggerSilence];
  double v4 = v3;
  uint64_t v5 = (os_log_t *)MEMORY[0x1E4F5D168];
  uint64_t v6 = (void *)*MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    mach_absolute_time();
    CSMachAbsoluteTimeGetTimeInterval();
    *(_DWORD *)long long buf = 136315650;
    id v27 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
    __int16 v28 = 2050;
    uint64_t v29 = v8;
    __int16 v30 = 2050;
    *(double *)double v31 = v4;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Two shot audible feedback decision (%{public}.3fs later than the scheduled time), postVoiceTriggerSilence: %{public}.3f", buf, 0x20u);
  }
  if (v4 > 0.0)
  {
    uint64_t v9 = *(unsigned __int8 **)(a1 + 32);
    if (v9[128])
    {
      uint64_t v10 = *v5;
      if (!os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)long long buf = 136315138;
      id v27 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
      unint64_t v11 = "%s Two shot audible feedback is prevented by Myriad decision.";
LABEL_10:
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      return;
    }
    int v12 = v9[126];
    int v13 = [v9 _canPlayTwoShotFeedbackDuringMediaPlayback];
    int v14 = v13;
    if (v12) {
      int v15 = v13;
    }
    else {
      int v15 = 1;
    }
    __int16 v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = @"not ";
      id v27 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
      __int16 v28 = 2114;
      *(_DWORD *)long long buf = 136315906;
      if (v15) {
        double v17 = &stru_1F2396200;
      }
      uint64_t v29 = v17;
      __int16 v30 = 1026;
      LODWORD(v31[0]) = v12;
      WORD2(v31[0]) = 1026;
      *(_DWORD *)((char *)v31 + 6) = v14;
      _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_DEFAULT, "%s Two shot audible feedback is %{public}@needed. (BOOL isMediaPlaying = %{public}d, canPlayPhaticDuringMediaPlayback = %{public}d)", buf, 0x22u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    if (objc_opt_respondsToSelector())
    {
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(NSObject **)(v19 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __42__CSSpeechController__startPhaticDecision__block_invoke_310;
      block[3] = &unk_1E658C898;
      void block[4] = v19;
      *(double *)&void block[5] = v4;
      char v25 = v15;
      id v21 = block;
    }
    else
    {
      if (!v15 || (objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_24;
      }
      uint64_t v22 = *(void *)(a1 + 32);
      uint64_t v20 = *(NSObject **)(v22 + 16);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __42__CSSpeechController__startPhaticDecision__block_invoke_313;
      v23[3] = &unk_1E658D3C8;
      v23[4] = v22;
      *(double *)&v23[5] = v4;
      id v21 = v23;
    }
    dispatch_async(v20, v21);
LABEL_24:
  }
}

void __42__CSSpeechController__startPhaticDecision__block_invoke_314(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F5D450] shouldDelayTwoShotFeedbackForMyriadDecision]
    && (id v2 = *(NSObject **)(*(void *)(a1 + 32) + 104),
        dispatch_time_t v3 = dispatch_time(0, 1700000000),
        dispatch_group_wait(v2, v3)))
  {
    double v4 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s Two shot audible feedback decision timed out while waiting for Myriad decision", (uint8_t *)&v5, 0xCu);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 128) = 0;
}

void __42__CSSpeechController__startPhaticDecision__block_invoke_310(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 122)) {
      dispatch_time_t v3 = @"Yes";
    }
    else {
      dispatch_time_t v3 = @"No";
    }
    int v6 = 136315394;
    uint64_t v7 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Two shot audible feedback should notify? [%{public}@]", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 122))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + 144));
    [WeakRetained speechControllerDidDetectVoiceTriggerTwoShot:*(void *)(a1 + 32) atTime:*(unsigned __int8 *)(a1 + 48) wantsAudibleFeedback:*(double *)(a1 + 40)];
  }
}

void __42__CSSpeechController__startPhaticDecision__block_invoke_313(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(*(void *)(a1 + 32) + 122)) {
      dispatch_time_t v3 = @"Yes";
    }
    else {
      dispatch_time_t v3 = @"No";
    }
    int v6 = 136315394;
    uint64_t v7 = "-[CSSpeechController _startPhaticDecision]_block_invoke";
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Two shot audible feedback should notify? [%{public}@]", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v4 + 122))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + 144));
    [WeakRetained speechControllerDidDetectVoiceTriggerTwoShot:*(void *)(a1 + 32) atTime:*(double *)(a1 + 40)];
  }
}

- (void)_scheduleAudibleFeedbackAtStartRecording
{
  [(CSSpeechController *)self _scheduledAudibleFeedbackDelay];
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(float)(v3 * 1000000000.0));
  audibleFeedbackQueue = self->_audibleFeedbackQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CSSpeechController__scheduleAudibleFeedbackAtStartRecording__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_after(v4, audibleFeedbackQueue, block);
}

void __62__CSSpeechController__scheduleAudibleFeedbackAtStartRecording__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 118))
  {
    [*(id *)(v2 + 168) postVoiceTriggerSilence];
    double v4 = v3;
    int v5 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      unint64_t v11 = "-[CSSpeechController _scheduleAudibleFeedbackAtStartRecording]_block_invoke";
      __int16 v12 = 2050;
      double v13 = v4;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Audible feedback decision postVoiceTriggerSilence: %{public}.3f", buf, 0x16u);
    }
    if (v4 > 0.0)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(NSObject **)(v6 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__CSSpeechController__scheduleAudibleFeedbackAtStartRecording__block_invoke_298;
      block[3] = &unk_1E658D4D8;
      void block[4] = v6;
      dispatch_async(v7, block);
    }
  }
  else
  {
    __int16 v8 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      unint64_t v11 = "-[CSSpeechController _scheduleAudibleFeedbackAtStartRecording]_block_invoke";
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Audible feedback not needed since we already stopped recording", buf, 0xCu);
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 128) = 0;
}

void __62__CSSpeechController__scheduleAudibleFeedbackAtStartRecording__block_invoke_298(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[CSSpeechController _scheduleAudibleFeedbackAtStartRecording]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Notifying scheduled audible feedback playback...", (uint8_t *)&v6, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    objc_msgSend(v5, "speechControllerRequestsOperation:forReason:completion:", 3, objc_msgSend(*(id *)(a1 + 32), "_audibleFeedbackPlaybackReason"), &__block_literal_global_304);
  }
}

void __62__CSSpeechController__scheduleAudibleFeedbackAtStartRecording__block_invoke_301(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    double v3 = (void *)*MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
    {
      char v4 = v3;
      id v5 = [v2 description];
      int v6 = 136315394;
      uint64_t v7 = "-[CSSpeechController _scheduleAudibleFeedbackAtStartRecording]_block_invoke";
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s Failed to playback audible feedback, error: %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_startFeedbackForTwoShotAtTime:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (CSIsWatch())
  {
    int v6 = NSStringFromSelector(a2);
    [(CSSpeechController *)self _performPendingAudioSessionActivateForReason:v6];
  }
  if (self->_isSoundPlaying
    && ![(CSSpeechController *)self _canPlayTwoShotFeedbackDuringMediaPlayback])
  {
    double v13 = *MEMORY[0x1E4F5D168];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v16 = 136315138;
    double v17 = "-[CSSpeechController _startFeedbackForTwoShotAtTime:]";
    uint64_t v14 = "%s Will not play two shot feedback for this request";
    int v15 = v13;
LABEL_17:
    _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);
    return;
  }
  BOOL isSiriClientListening = self->_isSiriClientListening;
  __int16 v8 = *MEMORY[0x1E4F5D168];
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT);
  if (!isSiriClientListening)
  {
    if (!v9) {
      return;
    }
    int v16 = 136315138;
    double v17 = "-[CSSpeechController _startFeedbackForTwoShotAtTime:]";
    uint64_t v14 = "%s Siri Client is no longer listening, don't play two shot feedback";
    int v15 = v8;
    goto LABEL_17;
  }
  if (v9)
  {
    BOOL twoShotNotificationEnabled = self->_twoShotNotificationEnabled;
    double v17 = "-[CSSpeechController _startFeedbackForTwoShotAtTime:]";
    int v16 = 136315650;
    if (twoShotNotificationEnabled) {
      unint64_t v11 = @"Yes";
    }
    else {
      unint64_t v11 = @"No";
    }
    __int16 v18 = 2050;
    double v19 = a3;
    __int16 v20 = 2114;
    id v21 = v11;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Two shot is detected at time %{public}.3f, should notify? [%{public}@]", (uint8_t *)&v16, 0x20u);
  }
  if (self->_twoShotNotificationEnabled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained speechControllerDidDetectVoiceTriggerTwoShot:self atTime:1 wantsAudibleFeedback:a3];
  }
}

- (BOOL)startRecordingWithSettings:(id)a3 error:(id *)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F5D168];
  __int16 v8 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSSpeechController startRecordingWithSettings:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s settings : %{public}@", buf, 0x16u);
  }
  speakerRecognitionScores = self->_speakerRecognitionScores;
  self->_speakerRecognitionScores = 0;

  mach_absolute_time();
  kdebug_trace();
  uint64_t v10 = *MEMORY[0x1E4F15338];
  unint64_t v11 = [v6 objectForKey:*MEMORY[0x1E4F15338]];

  if (v11)
  {
    uint64_t v12 = mach_absolute_time();
    double v13 = [v6 objectForKey:v10];
    unint64_t v14 = [v13 unsignedLongLongValue];

    os_log_t v15 = *v7;
    int v16 = *v7;
    uint64_t v17 = v12 - v14;
    if (v12 >= v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = (void *)MEMORY[0x1E4F5D300];
        uint64_t v23 = v15;
        [v22 hostTimeToSeconds:v17];
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[CSSpeechController startRecordingWithSettings:error:]";
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v24;
        _os_log_impl(&dword_1C9338000, v23, OS_LOG_TYPE_DEFAULT, "%s historical audio buffer Siri requested in seconds: %f", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      unint64_t v18 = v14 - v12;
      double v19 = (void *)MEMORY[0x1E4F5D300];
      __int16 v20 = v15;
      [v19 hostTimeToSeconds:v18];
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSSpeechController startRecordingWithSettings:error:]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v21;
      _os_log_error_impl(&dword_1C9338000, v20, OS_LOG_TYPE_ERROR, "%s requestedAudioStartHostTime is greater than startRecordingRequestHostTime. TimeDiff in seconds :%f", buf, 0x16u);
    }
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v65 = __Block_byref_object_copy__8283;
  long long v66 = __Block_byref_object_dispose__8284;
  id v67 = objc_alloc_init(MEMORY[0x1E4F5D218]);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CSSpeechController_startRecordingWithSettings_error___block_invoke;
  block[3] = &unk_1E658BD60;
  void block[4] = self;
  unint64_t v59 = buf;
  id v26 = v6;
  id v58 = v26;
  dispatch_async_and_wait(queue, block);
  id v27 = self->_queue;
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_277;
  v56[3] = &unk_1E658D438;
  v56[4] = self;
  v56[5] = buf;
  dispatch_async(v27, v56);
  [(CSContinuousVoiceTrigger *)self->_continuousVoiceTrigger resetWithAudioRecordContext:self->_audioRecordContext];
  if ([MEMORY[0x1E4F5D450] supportCSTwoShotDecision])
  {
    if ([(CSAudioRecordContext *)self->_audioRecordContext isVoiceTriggered])
    {
      lastVoiceTriggerInfo = self->_lastVoiceTriggerInfo;
LABEL_12:
      [(CSContinuousVoiceTrigger *)self->_continuousVoiceTrigger startDetectTwoShot:lastVoiceTriggerInfo];
      goto LABEL_16;
    }
    if (CSIsWatch()
      && [(CSAudioRecordContext *)self->_audioRecordContext isRTSTriggered])
    {
      lastVoiceTriggerInfo = 0;
      goto LABEL_12;
    }
  }
LABEL_16:
  uint64_t v29 = self->_queue;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_2;
  v54[3] = &unk_1E658D4B0;
  v54[4] = self;
  id v30 = v26;
  id v55 = v30;
  dispatch_async(v29, v54);
  uint64_t v31 = 0;
  double v32 = 0.0;
  if (v30 && self->_supportSessionActivateDelay)
  {
    unint64_t v33 = [v30 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_AudioSessionActiveDelay"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v35 = [v30 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_AudioSessionActiveDelay"];
      [v35 doubleValue];
      double v32 = v36;

      id v37 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)BOOL v60 = 136315394;
        v61 = "-[CSSpeechController startRecordingWithSettings:error:]";
        __int16 v62 = 2050;
        double v63 = v32;
        _os_log_impl(&dword_1C9338000, v37, OS_LOG_TYPE_DEFAULT, "%s Ask delay audio session active by %{public}f seconds", v60, 0x16u);
      }
      uint64_t v31 = 1;
    }
    else
    {
      uint64_t v31 = 0;
    }
  }
  mach_absolute_time();
  kdebug_trace();
  if ([(CSAudioRecordContext *)self->_audioRecordContext isTVRemote]
    && ![*(id *)(*(void *)&buf[8] + 40) isAlertBehaviorOverridedBeep])
  {
    uint64_t v41 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)BOOL v60 = 136315138;
      v61 = "-[CSSpeechController startRecordingWithSettings:error:]";
      _os_log_impl(&dword_1C9338000, v41, OS_LOG_TYPE_DEFAULT, "%s Postpone calling audio session activation til we receive didStart", v60, 0xCu);
    }
    char v38 = 1;
  }
  else
  {
    if (![(CSSpeechController *)self _activateAudioSessionWithReason:2 delay:v31 delayRequested:a4 error:v32])
    {
      v39 = *v7;
      if (!os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
LABEL_35:
        BOOL v49 = 0;
        goto LABEL_36;
      }
      *(_DWORD *)BOOL v60 = 136315138;
      v61 = "-[CSSpeechController startRecordingWithSettings:error:]";
      id v40 = "%s _activateAudoiSessionWithDelay has failed. startRecordWithSettings has failed";
LABEL_38:
      _os_log_error_impl(&dword_1C9338000, v39, OS_LOG_TYPE_ERROR, v40, v60, 0xCu);
      goto LABEL_35;
    }
    char v38 = 0;
  }
  uint64_t v42 = [(CSSpeechController *)self audioStream];

  if (!v42)
  {
    v39 = *v7;
    if (!os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_35;
    }
    *(_DWORD *)BOOL v60 = 136315138;
    v61 = "-[CSSpeechController startRecordingWithSettings:error:]";
    id v40 = "%s audioStream not existing";
    goto LABEL_38;
  }
  BOOL v43 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v44 = [v43 UUIDString];
  recordEventUUID = self->_recordEventUUID;
  self->_recordEventUUID = v44;

  v46 = [MEMORY[0x1E4F5D3E0] sharedInstance];
  [v46 notifyWillStartStreamWithContext:self->_audioRecordContext option:*(void *)(*(void *)&buf[8] + 40) withEventUUID:self->_recordEventUUID];

  v47 = [(CSSpeechController *)self audioStream];
  uint64_t v48 = *(void *)(*(void *)&buf[8] + 40);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_285;
  v51[3] = &unk_1E658A318;
  char v52 = v38;
  *(double *)&v51[6] = v32;
  char v53 = v31;
  v51[4] = self;
  v51[5] = buf;
  [v47 startAudioStreamWithOption:v48 completion:v51];

  BOOL v49 = 1;
LABEL_36:
  mach_absolute_time();
  kdebug_trace();
  mach_absolute_time();
  kdebug_trace();

  _Block_object_dispose(buf, 8);
  return v49;
}

void __55__CSSpeechController_startRecordingWithSettings_error___block_invoke(uint64_t a1)
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 131) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 132) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 368);
  *(void *)(v2 + 368) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 376);
  *(void *)(v4 + 376) = 0;

  *(void *)(*(void *)(a1 + 32) + 384) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 133) = [*(id *)(a1 + 32) _canDelayStopRecording];
  *(unsigned char *)(*(void *)(a1 + 32) + 134) = 0;
  [MEMORY[0x1E4F5D278] inputRecordingBufferDuration];
  double v7 = v6;
  [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
  *(void *)(*(void *)(a1 + 32) + 392) = (unint64_t)(v7 * v8 * 3.0);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 512);
  *(void *)(v9 + 512) = 0;

  *(_DWORD *)(*(void *)(a1 + 32) + 136) = 0;
  *(_DWORD *)(*(void *)(a1 + 32) + 140) = 0;
  unint64_t v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F152F0]];
  [v11 setAVVCAlertBehavior:v12];

  double v13 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_shouldSkipStartRecordingAlert"];

  if (v13)
  {
    unint64_t v14 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    os_log_t v15 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_shouldSkipStartRecordingAlert"];
    objc_msgSend(v14, "setSkipAlertBehavior:", objc_msgSend(v15, "BOOLValue"));
  }
  int v16 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_allowRecordWhileBeep"];

  if (v16)
  {
    uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    unint64_t v18 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_allowRecordWhileBeep"];
    objc_msgSend(v17, "setAllowRecordWhileBeep:", objc_msgSend(v18, "BOOLValue"));
  }
  if (!CSIsMac()) {
    goto LABEL_9;
  }
  if (CSIsAppleSiliconMac())
  {
    double v19 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
    if (![v19 isFlexibleFollowupsSupported])
    {
LABEL_14:

      goto LABEL_15;
    }
    int v20 = [*(id *)(*(void *)(a1 + 32) + 176) isServerInvoked];

    if (v20)
    {
LABEL_9:
      uint64_t v21 = *MEMORY[0x1E4F15338];
      uint64_t v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:*MEMORY[0x1E4F15338]];

      if (v22)
      {
        int v23 = [MEMORY[0x1E4F5D450] supportOpportunisticZLL];
        float v24 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        if (v23) {
          [v24 setUseOpportunisticZLL:1];
        }
        else {
          [v24 setRequestHistoricalAudioDataWithHostTime:1];
        }
        char v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        double v19 = [*(id *)(a1 + 40) objectForKeyedSubscript:v21];
        objc_msgSend(v25, "setStartRecordingHostTime:", objc_msgSend(v19, "unsignedLongLongValue"));
        goto LABEL_14;
      }
    }
  }
LABEL_15:
  id v26 = *(void **)(a1 + 40);
  id v27 = (id *)MEMORY[0x1E4F5D168];
  if (!v26) {
    goto LABEL_37;
  }
  uint64_t v28 = [v26 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_requestMHUUID"];
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    id v30 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_requestMHUUID"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v32 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_requestMHUUID"];
      uint64_t v33 = *(void *)(a1 + 32);
      __int16 v34 = *(void **)(v33 + 368);
      *(void *)(v33 + 368) = v32;

      uint64_t v35 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      double v36 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_requestMHUUID"];
      [v35 setRequestMHUUID:v36];

      id v37 = *v27;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        char v38 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_requestMHUUID"];
        *(_DWORD *)v119 = 136315394;
        *(void *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
        *(_WORD *)&v119[12] = 2112;
        *(void *)&v119[14] = v38;
        _os_log_impl(&dword_1C9338000, v37, OS_LOG_TYPE_DEFAULT, "%s Ask start recording with requestMHUUID: %@", v119, 0x16u);
      }
    }
  }
  v39 = *(void **)(a1 + 40);
  if (!v39) {
    goto LABEL_37;
  }
  uint64_t v40 = [v39 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_siriSessionUUID"];
  if (v40)
  {
    uint64_t v41 = (void *)v40;
    uint64_t v42 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_siriSessionUUID"];
    objc_opt_class();
    char v43 = objc_opt_isKindOfClass();

    if (v43)
    {
      uint64_t v44 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      char v45 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_siriSessionUUID"];
      [v44 setSiriSessionUUID:v45];
    }
  }
  v46 = *(void **)(a1 + 40);
  if (!v46) {
    goto LABEL_37;
  }
  v47 = [v46 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_disableEndpointer"];

  if (v47)
  {
    uint64_t v48 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    BOOL v49 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_disableEndpointer"];
    objc_msgSend(v48, "setDisableEndpointer:", objc_msgSend(v49, "BOOLValue"));
  }
  uint64_t v50 = *(void **)(a1 + 40);
  if (!v50) {
    goto LABEL_37;
  }
  long long v51 = [v50 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_disableLocalSpeechRecognizer"];

  if (v51)
  {
    char v52 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    char v53 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_disableLocalSpeechRecognizer"];
    objc_msgSend(v52, "setDisableLocalSpeechRecognizer:", objc_msgSend(v53, "BOOLValue"));
  }
  id v54 = *(void **)(a1 + 40);
  if (!v54) {
    goto LABEL_37;
  }
  uint64_t v55 = [v54 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_asrOnDevice"];
  if (!v55) {
    goto LABEL_37;
  }
  float v56 = (void *)v55;
  float v57 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_asrOnDevice"];
  int v58 = [v57 BOOLValue];

  if (v58)
  {
    unint64_t v59 = *v27;
    if (os_log_type_enabled((os_log_t)*v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v119 = 136315138;
      *(void *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v59, OS_LOG_TYPE_DEFAULT, "%s Disable audio converter since local asr is going to be used", v119, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 116) = 1;
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDisableRCSelection:1];
  }
  else
  {
LABEL_37:
    BOOL v60 = *v27;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v119 = 136315138;
      *(void *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v60, OS_LOG_TYPE_DEFAULT, "%s Enable audio converter", v119, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 116) = 0;
  }
  v61 = *(void **)(a1 + 40);
  if (!v61) {
    goto LABEL_44;
  }
  uint64_t v62 = [v61 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_hybridUODEnabled"];
  if (!v62) {
    goto LABEL_44;
  }
  double v63 = (void *)v62;
  id v64 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_hybridUODEnabled"];
  char v65 = [v64 BOOLValue];

  if (v65) {
    char v66 = 1;
  }
  else {
LABEL_44:
  }
    char v66 = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 129) = v66;
  id v67 = *(void **)(a1 + 40);
  if (v67)
  {
    uint64_t v68 = [v67 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_disablePrewarmLocalAsrAtStartRecording"];
    if (v68)
    {
      long long v69 = (void *)v68;
      unint64_t v70 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_disablePrewarmLocalAsrAtStartRecording"];
      int v71 = [v70 BOOLValue];

      if (v71)
      {
        v72 = *v27;
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v119 = 136315138;
          *(void *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
          _os_log_impl(&dword_1C9338000, v72, OS_LOG_TYPE_DEFAULT, "%s Disable prewarming local asr at startRecording", v119, 0xCu);
        }

        __int16 v73 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
        uint64_t v74 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_disablePrewarmLocalAsrAtStartRecording"];
        objc_msgSend(v73, "setDisablePrewarmLocalAsrAtStartRecording:", objc_msgSend(v74, "BOOLValue"));
      }
    }
  }
  if ([*(id *)(a1 + 32) _shouldSetStartSampleCount])
  {
    __int16 v75 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*MEMORY[0x1E4F5D7C8]];
    uint64_t v76 = [v75 unsignedIntegerValue];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setRequestHistoricalAudioDataSampleCount:1];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setStartRecordingSampleCount:v76];
    __int16 v77 = *v27;
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v119 = 136315394;
      *(void *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      *(_WORD *)&v119[12] = 2050;
      *(void *)&v119[14] = v76;
      _os_log_impl(&dword_1C9338000, v77, OS_LOG_TYPE_DEFAULT, "%s Ask start recording from: %{public}tu", v119, 0x16u);
    }
  }
  v78 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_DictationStartSampleId"];

  if (v78)
  {
    uint64_t v79 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_DictationStartSampleId"];
    uint64_t v80 = [v79 unsignedIntegerValue];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setRequestHistoricalAudioDataSampleCount:1];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setStartRecordingSampleCount:v80];
    id v81 = *v27;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v119 = 136315394;
      *(void *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      *(_WORD *)&v119[12] = 2050;
      *(void *)&v119[14] = v80;
      _os_log_impl(&dword_1C9338000, v81, OS_LOG_TYPE_DEFAULT, "%s TriggerlessDictation: Ask start recording from: %{public}tu", v119, 0x16u);
    }
  }
  if ([*(id *)(a1 + 32) _shouldSetStartSampleCountForRTS])
  {
    unint64_t v82 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:*MEMORY[0x1E4F5D5D0]];
    uint64_t v83 = [v82 unsignedIntegerValue];

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setRequestHistoricalAudioDataSampleCount:1];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setStartRecordingSampleCount:v83];
    v84 = *v27;
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v119 = 136315394;
      *(void *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      *(_WORD *)&v119[12] = 2050;
      *(void *)&v119[14] = v83;
      _os_log_impl(&dword_1C9338000, v84, OS_LOG_TYPE_DEFAULT, "%s Ask start recording from: %{public}tu", v119, 0x16u);
    }
  }
  id v85 = [*(id *)(*(void *)(a1 + 32) + 176) activationMetadata];
  if ([*(id *)(*(void *)(a1 + 32) + 176) isContinuousConversation])
  {
    if (v85)
    {
      uint64_t v86 = *MEMORY[0x1E4F5D7C8];
      v87 = [v85 objectForKeyedSubscript:*MEMORY[0x1E4F5D7C8]];

      if (v87)
      {
        v88 = [*(id *)(*(void *)(a1 + 32) + 176) activationMetadata];
        v89 = [v88 objectForKeyedSubscript:v86];
        uint64_t v90 = [v89 unsignedIntegerValue];

        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setRequestHistoricalAudioDataSampleCount:1];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setStartRecordingSampleCount:v90];
        v91 = *v27;
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v119 = 136315650;
          *(void *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
          *(_WORD *)&v119[12] = 2114;
          *(void *)&v119[14] = v85;
          *(_WORD *)&v119[22] = 2050;
          uint64_t v120 = v90;
          _os_log_impl(&dword_1C9338000, v91, OS_LOG_TYPE_DEFAULT, "%s ContinuousConversation trigger Info: %{public}@ ask start recording from: %{public}tu", v119, 0x20u);
        }
      }
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 118) = 1;
  int v92 = [*(id *)(*(void *)(a1 + 32) + 176) isVoiceTriggered];
  uint64_t v93 = *(void *)(a1 + 32);
  if (!v92
    || (__int16 v94 = *(void **)(v93 + 72)) == 0
    || (uint64_t v95 = *MEMORY[0x1E4F5D7A8],
        [v94 objectForKeyedSubscript:*MEMORY[0x1E4F5D7A8]],
        __int16 v96 = objc_claimAutoreleasedReturnValue(),
        v96,
        uint64_t v93 = *(void *)(a1 + 32),
        !v96))
  {
    if ([*(id *)(v93 + 176) isServerInvoked]
      && (v100 = *(void **)(*(void *)(a1 + 32) + 72)) != 0
      && (uint64_t v101 = *MEMORY[0x1E4F5D7A8],
          [v100 objectForKeyedSubscript:*MEMORY[0x1E4F5D7A8]],
          v102 = objc_claimAutoreleasedReturnValue(),
          v102,
          v102))
    {
      v103 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v101];
      *(void *)(*(void *)(a1 + 32) + 272) = [v103 unsignedIntegerValue];

      v104 = *v27;
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v105 = *(void *)(*(void *)(a1 + 32) + 272);
        *(_DWORD *)v119 = 136315394;
        *(void *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
        *(_WORD *)&v119[12] = 2050;
        *(void *)&v119[14] = v105;
        v106 = "%s Auto prompt to use the last voice triggered channel: %{public}tu";
        v107 = v104;
        uint32_t v108 = 22;
LABEL_81:
        _os_log_impl(&dword_1C9338000, v107, OS_LOG_TYPE_DEFAULT, v106, v119, v108);
      }
    }
    else
    {
      *(void *)(*(void *)(a1 + 32) + 272) = [MEMORY[0x1E4F5D278] channelForProcessedInput];
      uint64_t v109 = *(void *)(a1 + 32);
      v110 = *(void **)(v109 + 72);
      *(void *)(v109 + 72) = 0;

      v104 = *v27;
      if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v119 = 136315138;
        *(void *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
        v106 = "%s SpeechController to receive data from default channel";
        v107 = v104;
        uint32_t v108 = 12;
        goto LABEL_81;
      }
    }

    goto LABEL_83;
  }
  unint64_t v97 = [*(id *)(v93 + 72) objectForKeyedSubscript:v95];
  *(void *)(*(void *)(a1 + 32) + 272) = [v97 unsignedIntegerValue];

  uint64_t v98 = *v27;
  if (os_log_type_enabled((os_log_t)*v27, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v99 = *(void *)(*(void *)(a1 + 32) + 272);
    *(_DWORD *)v119 = 136315394;
    *(void *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
    *(_WORD *)&v119[12] = 2050;
    *(void *)&v119[14] = v99;
    _os_log_impl(&dword_1C9338000, v98, OS_LOG_TYPE_DEFAULT, "%s Voice trigger to use the current voice triggered channel: %{public}tu", v119, 0x16u);
  }
LABEL_83:
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "setRequireSingleChannelLookup:", 1, *(_OWORD *)v119, *(void *)&v119[16]);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setSelectedChannel:*(unsigned int *)(*(void *)(a1 + 32) + 272)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPotentiallyNeedsCarPlayLatencyCorrection:1];
  [*(id *)(a1 + 32) _setupSpeakerRecognitionController];
  if (CSIsCommunalDevice())
  {
    if ([MEMORY[0x1E4F5D450] isAttentiveSiriEnabled])
    {
      uint64_t v111 = *(void *)(a1 + 32);
      if (!*(void *)(v111 + 520))
      {
        v112 = *(void **)(v111 + 424);
        if (!v112)
        {
          v113 = [[CSSpeakerRecognitionProxy alloc] initWithDelegate:*(void *)(a1 + 32)];
          uint64_t v114 = *(void *)(a1 + 32);
          v115 = *(void **)(v114 + 424);
          *(void *)(v114 + 424) = v113;

          v112 = *(void **)(*(void *)(a1 + 32) + 424);
        }
        [v112 startXPCConnection];
      }
    }
  }
  v116 = *v27;
  if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v117 = *(void *)(*(void *)(a1 + 32) + 272);
    *(_DWORD *)v119 = 136315394;
    *(void *)&v119[4] = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
    *(_WORD *)&v119[12] = 2050;
    *(void *)&v119[14] = v117;
    _os_log_impl(&dword_1C9338000, v116, OS_LOG_TYPE_DEFAULT, "%s SpeechController to receive data from channel %{public}tu", v119, 0x16u);
  }

  uint64_t v118 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v118 + 116))
  {
    [*(id *)(v118 + 48) reset];
    uint64_t v118 = *(void *)(a1 + 32);
  }
  [*(id *)(v118 + 280) reset];
}

uint64_t __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_277(uint64_t a1)
{
  kdebug_trace();
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "resetForNewRequestWithSampleRate:recordContext:recordOption:voiceTriggerInfo:", objc_msgSend(*(id *)(a1 + 32), "_currentAudioRecorderSampleRate"), *(void *)(*(void *)(a1 + 32) + 176), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(*(void *)(a1 + 32) + 72));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 168), "setActiveChannel:", objc_msgSend(MEMORY[0x1E4F5D278], "channelForProcessedInput"));
  return kdebug_trace();
}

void __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_2(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 127) = 0;
  uint64_t v2 = [*(id *)(a1 + 32) recordRoute];
  int v3 = [v2 isEqualToString:*MEMORY[0x1E4F152F8]];

  if (v3) {
    *(unsigned char *)(*(void *)(a1 + 32) + 127) = 1;
  }
  uint64_t v4 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v5 = [v4 UUIDString];
  uint64_t v6 = *(void *)(a1 + 32);
  double v7 = *(void **)(v6 + 416);
  *(void *)(v6 + 416) = v5;

  float v8 = (void *)MEMORY[0x1E4F5D1C8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 127))
  {
    [MEMORY[0x1E4F5D2E0] lpcmMonoNonInterleavedWithRemoteVADASBD];
    [MEMORY[0x1E4F5D2E0] lpcmMonoInterleavedWithRemoteVADASBD];
    uint64_t v9 = [v8 createAudioFileWriterForRemoteVADWithInputFormat:v32 outputFormat:v31 withLoggingUUID:*(void *)(*(void *)(a1 + 32) + 416)];
  }
  else
  {
    [MEMORY[0x1E4F5D2E0] lpcmInt16ASBD];
    [MEMORY[0x1E4F5D2E0] lpcmInt16ASBD];
    uint64_t v9 = [v8 createAudioFileWriterWithInputFormat:v30 outputFormat:&v29 withLoggingUUID:*(void *)(*(void *)(a1 + 32) + 416)];
  }
  uint64_t v10 = *(void *)(a1 + 32);
  unint64_t v11 = *(void **)(v10 + 232);
  *(void *)(v10 + 232) = v9;

  *(unsigned char *)(*(void *)(a1 + 32) + 130) = [*(id *)(a1 + 32) _shouldUseLanguageDetector:*(void *)(a1 + 40)];
  uint64_t v12 = *(unsigned char **)(a1 + 32);
  if (v12[130])
  {
    [v12 _createLanguageDetectorIfNeeded];
    double v13 = [*(id *)(a1 + 32) _languageDetectorOptionFromSettings:*(void *)(a1 + 40)];
    *(float *)&double v14 = (float)[*(id *)(a1 + 32) _currentAudioRecorderSampleRate];
    [v13 setSamplingRate:v14];
    os_log_t v15 = *(void **)(a1 + 32);
    int v16 = (void *)v15[38];
    uint64_t v17 = [v15 languageDetectorDelegate];
    [v16 setDelegate:v17];

    [*(id *)(*(void *)(a1 + 32) + 304) resetForNewRequest:v13];
  }
  unint64_t v18 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_siriSessionUUID"];
  if (v18 && !*(unsigned char *)(*(void *)(a1 + 32) + 116) && CSIsHorseman())
  {
    double v19 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v34 = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke_2";
      _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_DEFAULT, "%s Trying to prepare uncompressed audio logging", buf, 0xCu);
    }
    id v20 = objc_alloc(MEMORY[0x1E4F5D440]);
    uint64_t v21 = [MEMORY[0x1E4F4E538] sharedPreferences];
    uint64_t v22 = [v21 languageCode];
    uint64_t v23 = [v20 initWithRequestId:v18 languageCode:v22 task:&stru_1F2396200];
    uint64_t v24 = *(void *)(a1 + 32);
    char v25 = *(void **)(v24 + 544);
    *(void *)(v24 + 544) = v23;

    [*(id *)(*(void *)(a1 + 32) + 544) prepareLogging:0];
  }
  else
  {
    id v26 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v34 = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v26, OS_LOG_TYPE_DEFAULT, "%s Local ASR is used, uncompressed audio logging is disabled", buf, 0xCu);
    }
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v28 = *(void **)(v27 + 544);
    *(void *)(v27 + 544) = 0;
  }
}

void __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_285(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  double v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_2_286;
  block[3] = &unk_1E658A2F0;
  char v13 = a2;
  void block[4] = v6;
  id v10 = v5;
  __int16 v14 = *(_WORD *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 40);
  id v8 = v5;
  dispatch_async(v7, block);
}

void __55__CSSpeechController_startRecordingWithSettings_error___block_invoke_2_286(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 512))
  {
    int v3 = [(id)v2 streamProvider];
    uint64_t v4 = [v3 audioDeviceInfo];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 512);
    *(void *)(v5 + 512) = v4;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v2 + 144));
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = (void *)*MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      if (*(unsigned char *)(a1 + 64)) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      uint64_t v11 = *(void **)(*(void *)(a1 + 32) + 512);
      uint64_t v12 = v9;
      char v13 = [v11 description];
      int v29 = 136315650;
      id v30 = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke_2";
      __int16 v31 = 2112;
      double v32 = *(double *)&v10;
      __int16 v33 = 2114;
      __int16 v34 = v13;
      _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_DEFAULT, "%s Sending client speechControllerDidStartRecording successfully? %{pubic}@, audioDeviceInfo = %{public}@", (uint8_t *)&v29, 0x20u);
    }
    id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v14 speechControllerDidStartRecording:*(void *)(a1 + 32) audioDeviceInfo:*(void *)(*(void *)(a1 + 32) + 512) successfully:*(unsigned __int8 *)(a1 + 64) error:*(void *)(a1 + 40)];
LABEL_16:

    goto LABEL_17;
  }
  id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    uint64_t v17 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v18 = @"YES";
      if (!*(unsigned char *)(a1 + 64)) {
        unint64_t v18 = @"NO";
      }
      int v29 = 136315394;
      id v30 = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
      __int16 v31 = 2112;
      double v32 = *(double *)&v18;
      _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_DEFAULT, "%s Sending client speechControllerDidStartRecording successfully? %{pubic}@", (uint8_t *)&v29, 0x16u);
    }
    id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 144));
    [v14 speechControllerDidStartRecording:*(void *)(a1 + 32) successfully:*(unsigned __int8 *)(a1 + 64) error:*(void *)(a1 + 40)];
    goto LABEL_16;
  }
LABEL_17:
  if (*(unsigned char *)(a1 + 64))
  {
    if (*(unsigned char *)(a1 + 65))
    {
      double v19 = [*(id *)(a1 + 32) audioStream];
      int v20 = [v19 isStreaming];

      if (v20) {
        [*(id *)(a1 + 32) _activateAudioSessionWithReason:2 delay:*(unsigned __int8 *)(a1 + 66) delayRequested:0 error:*(double *)(a1 + 56)];
      }
    }
  }
  if ([*(id *)(a1 + 32) _shouldTrackLaunchLatency])
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F5D300];
    uint64_t v22 = mach_absolute_time();
    uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*MEMORY[0x1E4F5D958]];
    objc_msgSend(v21, "hostTimeToTimeInterval:", v22 - objc_msgSend(v23, "unsignedLongLongValue"));
    double v25 = v24;

    if (v25 >= 1.79999995)
    {
      id v26 = *MEMORY[0x1E4F5D168];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
      {
        int v29 = 136315394;
        id v30 = "-[CSSpeechController startRecordingWithSettings:error:]_block_invoke";
        __int16 v31 = 2048;
        double v32 = v25;
        _os_log_error_impl(&dword_1C9338000, v26, OS_LOG_TYPE_ERROR, "%s Report unexpectedly long launch latency %{publlic}.3f", (uint8_t *)&v29, 0x16u);
      }
      uint64_t v27 = [MEMORY[0x1E4F5D2A0] sharedInstance];
      [v27 submitVoiceTriggerIssueReport:*MEMORY[0x1E4F5D5B8]];
    }
  }
  uint64_t v28 = [MEMORY[0x1E4F5D3E0] sharedInstance];
  [v28 notifyDidStartStreamWithContext:*(void *)(*(void *)(a1 + 32) + 176) successfully:*(unsigned __int8 *)(a1 + 64) option:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withEventUUID:*(void *)(*(void *)(a1 + 32) + 256)];
}

- (id)_languageDetectorOptionFromSettings:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    uint64_t v4 = objc_alloc_init(CSLanguageDetectorOption);
    uint64_t v5 = [v3 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorDictationLanguages"];
    uint64_t v6 = objc_opt_class();
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_2;
    v66[3] = &unk_1E658D4B0;
    double v7 = v4;
    id v67 = v7;
    id v68 = v5;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v5, v6, v66);
    char v8 = [v3 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorCurrentKeyboard"];
    uint64_t v9 = objc_opt_class();
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_3;
    v63[3] = &unk_1E658D4B0;
    id v10 = v7;
    id v64 = v10;
    id v65 = v8;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v8, v9, v63);
    uint64_t v11 = [v3 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorWasLanguageToggled"];
    uint64_t v12 = objc_opt_class();
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_4;
    v60[3] = &unk_1E658D4B0;
    char v13 = v10;
    v61 = v13;
    id v62 = v11;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v11, v12, v60);
    id v14 = [v3 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorMultilingualKeyboardLanguages"];
    uint64_t v15 = objc_opt_class();
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_5;
    v57[3] = &unk_1E658D4B0;
    char v16 = v13;
    int v58 = v16;
    id v59 = v14;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v14, v15, v57);
    uint64_t v17 = [v3 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorKeyboardConvoLanguagePriors"];
    uint64_t v18 = objc_opt_class();
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_6;
    v54[3] = &unk_1E658D4B0;
    double v19 = v16;
    uint64_t v55 = v19;
    id v56 = v17;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v17, v18, v54);
    int v20 = [v3 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorKeyboardGlobalLanguagePriors"];
    uint64_t v21 = objc_opt_class();
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_7;
    v51[3] = &unk_1E658D4B0;
    uint64_t v22 = v19;
    char v52 = v22;
    id v53 = v20;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v20, v21, v51);
    uint64_t v23 = [v3 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorPreviousMessageLanguage"];
    uint64_t v24 = objc_opt_class();
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_8;
    v48[3] = &unk_1E658D4B0;
    double v25 = v22;
    BOOL v49 = v25;
    id v50 = v23;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v23, v24, v48);
    id v26 = [v3 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorGlobalLastKeyboardUsed"];
    uint64_t v27 = objc_opt_class();
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_9;
    v45[3] = &unk_1E658D4B0;
    uint64_t v28 = v25;
    v46 = v28;
    id v47 = v26;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v26, v27, v45);
    int v29 = [v3 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorDictationLanguagePriors"];
    uint64_t v30 = objc_opt_class();
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_10;
    v42[3] = &unk_1E658D4B0;
    __int16 v31 = v28;
    id v43 = v31;
    id v44 = v29;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v29, v30, v42);
    double v32 = [v3 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_LanguageDetectorConversationalMessages"];

    uint64_t v33 = objc_opt_class();
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_11;
    v39[3] = &unk_1E658D4B0;
    id v34 = v31;
    id v40 = v34;
    uint64_t v41 = v32;
    id v35 = v32;
    __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(v35, v33, v39);
    double v36 = v41;
    id v37 = v34;
  }
  else
  {
    id v37 = 0;
  }
  return v37;
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDictationLanguages:*(void *)(a1 + 40)];
}

void __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v6 = a1;
  uint64_t v4 = a3;
  if (v6)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v4)
    {
      if (isKindOfClass) {
        v4[2](v4);
      }
    }
  }
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCurrentKeyboard:*(void *)(a1 + 40)];
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) BOOLValue];
  return [v1 setWasLanguageToggled:v2];
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMultilingualKeyboardLanguages:*(void *)(a1 + 40)];
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setKeyboardConvoLanguagePriors:*(void *)(a1 + 40)];
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setKeyboardGlobalLanguagePriors:*(void *)(a1 + 40)];
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPreviousMessageLanguage:*(void *)(a1 + 40)];
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) setGlobalLastKeyboardUsed:*(void *)(a1 + 40)];
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDictationLanguagePriors:*(void *)(a1 + 40)];
}

uint64_t __58__CSSpeechController__languageDetectorOptionFromSettings___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) setConversationalMessages:*(void *)(a1 + 40)];
}

- (void)_setupSpeakerRecognitionController
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if ((![MEMORY[0x1E4F5D450] isAttentiveSiriEnabled] || self->_endpointId)
    && CSIsCommunalDevice())
  {
    id v3 = (void *)MEMORY[0x1E4F5D450];
    uint64_t v4 = [(NSUUID *)self->_endpointId UUIDString];
    uint64_t v5 = [v3 getSiriLanguageWithEndpointId:v4 fallbackLanguage:@"en-US"];

    id v6 = +[CSVoiceTriggerAssetHandler sharedHandlerDisabledOnDeviceCompilation];
    double v7 = [(NSUUID *)self->_endpointId UUIDString];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __56__CSSpeechController__setupSpeakerRecognitionController__block_invoke;
    v43[3] = &unk_1E658D0A8;
    v43[4] = self;
    [v6 getVoiceTriggerAssetWithEndpointId:v7 completion:v43];

    char v8 = [(SSRVoiceProfileManager *)self->_voiceProfileManager provisionedVoiceProfilesForAppDomain:*MEMORY[0x1E4FA5768] withLocale:v5];
    uint64_t v9 = v8;
    if (!v8 || ![v8 count])
    {
      uint64_t v18 = *MEMORY[0x1E4F5D168];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        char v45 = "-[CSSpeechController _setupSpeakerRecognitionController]";
        __int16 v46 = 2114;
        id v47 = v5;
        _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_DEFAULT, "%s Voice Profiles not present for %{public}@ - Bailing out", buf, 0x16u);
      }
      goto LABEL_39;
    }
    if (CSIsInternalBuild())
    {
      id v10 = [(SSRVoiceProfileManager *)self->_voiceProfileManager provisionedVoiceProfilesForAppDomain:*MEMORY[0x1E4FA5770] withLocale:v5];
      if (v10)
      {
        uint64_t v11 = [v9 arrayByAddingObjectsFromArray:v10];

        uint64_t v9 = (void *)v11;
      }
    }
    int v12 = [(CSAudioRecordContext *)self->_audioRecordContext isBuiltInVoiceTriggered];
    float v13 = 4.0;
    if (v12)
    {
      lastVoiceTriggerInfo = self->_lastVoiceTriggerInfo;
      if (lastVoiceTriggerInfo)
      {
        uint64_t v15 = [(NSDictionary *)lastVoiceTriggerInfo objectForKeyedSubscript:*MEMORY[0x1E4F5D938]];
        [v15 floatValue];
        float v13 = v16 + 4.0;
      }
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = 1;
    }
    double v19 = (os_log_t *)MEMORY[0x1E4F5D168];
    int v20 = *MEMORY[0x1E4F5D168];
    uint64_t v21 = *MEMORY[0x1E4F5D168];
    if (!self->_ssrAssets)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        char v45 = "-[CSSpeechController _setupSpeakerRecognitionController]";
        _os_log_error_impl(&dword_1C9338000, v20, OS_LOG_TYPE_ERROR, "%s Unable to setup SSR due to missing ssr assets", buf, 0xCu);
      }
      goto LABEL_39;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      if (v12) {
        uint64_t v22 = @"VT";
      }
      else {
        uint64_t v22 = @"BP";
      }
      uint64_t v23 = v20;
      uint64_t v24 = [v9 count];
      *(_DWORD *)long long buf = 136316162;
      char v45 = "-[CSSpeechController _setupSpeakerRecognitionController]";
      __int16 v46 = 2114;
      id v47 = v22;
      __int16 v48 = 2114;
      BOOL v49 = v5;
      __int16 v50 = 2050;
      uint64_t v51 = v24;
      __int16 v52 = 2050;
      double v53 = v13;
      _os_log_impl(&dword_1C9338000, v23, OS_LOG_TYPE_DEFAULT, "%s Setting up SSR controller with {%{public}@, %{public}@, %{public}ldusers, %{public}fsecs}", buf, 0x34u);
    }
    id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v26 = [NSNumber numberWithUnsignedInteger:v17];
    [v25 setObject:v26 forKey:*MEMORY[0x1E4FA5778]];

    [v25 setObject:v5 forKey:*MEMORY[0x1E4FA5748]];
    [v25 setObject:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4FA5780]];
    [v25 setObject:v9 forKey:*MEMORY[0x1E4FA5760]];
    if (self->_lastVoiceTriggerInfo) {
      uint64_t v27 = self->_lastVoiceTriggerInfo;
    }
    else {
      uint64_t v27 = (NSDictionary *)MEMORY[0x1E4F1CC08];
    }
    [v25 setObject:v27 forKey:*MEMORY[0x1E4FA5788]];
    *(float *)&double v28 = v13;
    int v29 = [NSNumber numberWithFloat:v28];
    [v25 setObject:v29 forKey:*MEMORY[0x1E4FA5750]];

    [v25 setObject:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4FA5758]];
    [v25 setObject:self->_ssrAssets forKey:*MEMORY[0x1E4FA5730]];
    endpointId = self->_endpointId;
    if (endpointId) {
      [v25 setObject:endpointId forKey:*MEMORY[0x1E4FA5740]];
    }
    id v42 = 0;
    __int16 v31 = (void *)[objc_alloc(MEMORY[0x1E4FA5700]) initWithVoiceRecognitionContext:v25 error:&v42];
    id v32 = v42;
    id v33 = v32;
    if (!v31 || v32)
    {
      os_log_t v40 = *v19;
      if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
      {
        id v37 = v40;
        char v38 = [v33 localizedDescription];
        *(_DWORD *)long long buf = 136315394;
        char v45 = "-[CSSpeechController _setupSpeakerRecognitionController]";
        __int16 v46 = 2112;
        id v47 = v38;
        v39 = "%s ERR: Failed to create SSR context with error %@";
        goto LABEL_42;
      }
    }
    else
    {
      id v41 = 0;
      id v34 = (SSRSpeakerRecognitionController *)[objc_alloc(MEMORY[0x1E4FA5708]) initWithContext:v31 withDelegate:self error:&v41];
      id v33 = v41;
      speakerRecognitionController = self->_speakerRecognitionController;
      self->_speakerRecognitionController = v34;

      if (self->_speakerRecognitionController && !v33) {
        goto LABEL_38;
      }
      os_log_t v36 = *v19;
      if (os_log_type_enabled(*v19, OS_LOG_TYPE_ERROR))
      {
        id v37 = v36;
        char v38 = [v33 localizedDescription];
        *(_DWORD *)long long buf = 136315394;
        char v45 = "-[CSSpeechController _setupSpeakerRecognitionController]";
        __int16 v46 = 2112;
        id v47 = v38;
        v39 = "%s ERR: Failed to create SSR controller with error %@";
LABEL_42:
        _os_log_error_impl(&dword_1C9338000, v37, OS_LOG_TYPE_ERROR, v39, buf, 0x16u);
      }
    }

LABEL_38:
LABEL_39:
  }
}

void __56__CSSpeechController__setupSpeakerRecognitionController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  char v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__CSSpeechController__setupSpeakerRecognitionController__block_invoke_2;
  block[3] = &unk_1E658D3F0;
  id v12 = v6;
  id v13 = v5;
  uint64_t v14 = v7;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __56__CSSpeechController__setupSpeakerRecognitionController__block_invoke_2(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = (void *)a1[4];
  if (v1 || (uint64_t v4 = (void *)a1[5]) == 0)
  {
    uint64_t v2 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[CSSpeechController _setupSpeakerRecognitionController]_block_invoke_2";
      __int16 v11 = 2114;
      id v12 = v1;
      _os_log_error_impl(&dword_1C9338000, v2, OS_LOG_TYPE_ERROR, "%s Failed to get asset with %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(a1[6] + 448), v4);
    id v5 = (void *)*MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1[6] + 448);
      uint64_t v7 = v5;
      char v8 = [v6 configVersion];
      int v9 = 136315394;
      id v10 = "-[CSSpeechController _setupSpeakerRecognitionController]_block_invoke";
      __int16 v11 = 2114;
      id v12 = v8;
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s MU using asset with version %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)_refreshSpeakerRecognitionAssets
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F5D450] supportsSpeakerRecognitionAssets])
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = (void *)MEMORY[0x1E4F5D450];
    id v5 = [(NSUUID *)self->_endpointId UUIDString];
    id v6 = [v4 getSiriLanguageWithEndpointId:v5 fallbackLanguage:@"en-US"];

    uint64_t v7 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      uint64_t v13 = "-[CSSpeechController _refreshSpeakerRecognitionAssets]";
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s languageCode:%@", (uint8_t *)&v12, 0x16u);
    }
    char v8 = [MEMORY[0x1E4FA56F0] sharedManager];
    int v9 = [v8 allInstalledSpeakerRecognitionAssetsForLanguage:v6];

    if (v9) {
      [(NSArray *)v3 addObjectsFromArray:v9];
    }
    ssrAssets = self->_ssrAssets;
    self->_ssrAssets = v3;
  }
  else
  {
    __int16 v11 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[CSSpeechController _refreshSpeakerRecognitionAssets]";
      _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_DEFAULT, "%s SpeakerRecognitionAssets not supported", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)setDuckOthersOption:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CSSpeechController *)self sessionProvider];
  [v4 setDuckOthersOption:v3];
}

- (double)getRecordBufferDuration
{
  return 0.04;
}

- (BOOL)setRecordBufferDuration:(double)a3
{
  return 1;
}

- (AudioStreamBasicDescription)getLPCMAudioStreamBasicDescription
{
  int v4 = CSIsOSX();
  id v5 = (void *)MEMORY[0x1E4F5D2E0];
  if (v4)
  {
    if (self->_isNarrowBand)
    {
      return (AudioStreamBasicDescription *)[v5 lpcmNarrowBandASBD];
    }
    else
    {
      return (AudioStreamBasicDescription *)[v5 lpcmASBD];
    }
  }
  else if (self->_isNarrowBand)
  {
    return (AudioStreamBasicDescription *)[v5 lpcmInt16NarrowBandASBD];
  }
  else
  {
    return (AudioStreamBasicDescription *)[v5 lpcmInt16ASBD];
  }
}

- (id)recordSettings
{
  void v27[6] = *MEMORY[0x1E4F143B8];
  if ([(CSSpeechController *)self _isHubRequestTV])
  {
    BOOL v3 = [(CSSpeechController *)self streamProvider];
    int v4 = [v3 recordSettings];
  }
  else
  {
    uint64_t v5 = *MEMORY[0x1E4F151E0];
    if (self->_isNarrowBand)
    {
      v27[0] = &unk_1F23C4880;
      uint64_t v6 = *MEMORY[0x1E4F15270];
      v26[0] = v5;
      v26[1] = v6;
      uint64_t v7 = NSNumber;
      [MEMORY[0x1E4F5D278] inputRecordingSampleRateNarrowBand];
      BOOL v3 = objc_msgSend(v7, "numberWithFloat:");
      v27[1] = v3;
      v26[2] = *MEMORY[0x1E4F151F0];
      char v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(MEMORY[0x1E4F5D278], "inputRecordingSampleBitDepth"));
      uint64_t v9 = *MEMORY[0x1E4F15208];
      v27[2] = v8;
      v27[3] = MEMORY[0x1E4F1CC28];
      uint64_t v10 = *MEMORY[0x1E4F15228];
      v26[3] = v9;
      v26[4] = v10;
      v26[5] = *MEMORY[0x1E4F15238];
      uint64_t v11 = *MEMORY[0x1E4F15248];
      v27[4] = &unk_1F23C4898;
      v27[5] = v11;
      int v12 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v13 = v27;
      __int16 v14 = v26;
    }
    else
    {
      v25[0] = &unk_1F23C4880;
      uint64_t v15 = *MEMORY[0x1E4F15270];
      v24[0] = v5;
      v24[1] = v15;
      uint64_t v16 = NSNumber;
      [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
      BOOL v3 = objc_msgSend(v16, "numberWithFloat:");
      v25[1] = v3;
      v24[2] = *MEMORY[0x1E4F151F0];
      char v8 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(MEMORY[0x1E4F5D278], "inputRecordingSampleBitDepth"));
      uint64_t v17 = *MEMORY[0x1E4F15208];
      v25[2] = v8;
      v25[3] = MEMORY[0x1E4F1CC28];
      uint64_t v18 = *MEMORY[0x1E4F15228];
      v24[3] = v17;
      v24[4] = v18;
      v24[5] = *MEMORY[0x1E4F15238];
      uint64_t v19 = *MEMORY[0x1E4F15248];
      v25[4] = &unk_1F23C4898;
      void v25[5] = v19;
      int v12 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v13 = v25;
      __int16 v14 = v24;
    }
    int v4 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:6];
  }
  if (self->_supportPhatic)
  {
    id v20 = (id)[v4 mutableCopy];
    BOOL v21 = self->_isMediaPlaying || self->_isTimerPlaying || self->_isAlarmPlaying;
    uint64_t v22 = [NSNumber numberWithInt:v21];
    [v20 setObject:v22 forKey:@"CSSpeechRecordSettingsKey_isDucking"];
  }
  else
  {
    id v20 = v4;
  }

  return v20;
}

- (void)releaseAudioSession:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v11 = "-[CSSpeechController releaseAudioSession:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  uint64_t v6 = [(CSSpeechController *)self sessionProvider];

  if (v6)
  {
    uint64_t v7 = [(CSSpeechController *)self sessionProvider];
    [v7 deactivateAudioSession:a3 error:0];
  }
  else
  {
    uint64_t v7 = [(CSSpeechController *)self _fetchFallbackAudioSessionReleaseProviding];
    [v7 fallbackDeactivateAudioSession:a3 error:0];
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CSSpeechController_releaseAudioSession___block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

unsigned char *__42__CSSpeechController_releaseAudioSession___block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[121]) {
    return (unsigned char *)[result _fetchMetricsAndLog];
  }
  return result;
}

- (void)releaseAudioSession
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v9 = "-[CSSpeechController releaseAudioSession]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  int v4 = [(CSSpeechController *)self sessionProvider];

  if (v4)
  {
    uint64_t v5 = [(CSSpeechController *)self sessionProvider];
    [v5 deactivateAudioSession:0 error:0];
  }
  else
  {
    uint64_t v5 = [(CSSpeechController *)self _fetchFallbackAudioSessionReleaseProviding];
    [v5 fallbackDeactivateAudioSession:0 error:0];
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__CSSpeechController_releaseAudioSession__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(queue, block);
}

unsigned char *__41__CSSpeechController_releaseAudioSession__block_invoke(uint64_t a1)
{
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[121]) {
    return (unsigned char *)[result _fetchMetricsAndLog];
  }
  return result;
}

- (void)reset
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    int v4 = "-[CSSpeechController reset]";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Resetting CoreSpeech frameworks", (uint8_t *)&v3, 0xCu);
  }
}

- (void)resetAudioSession
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v3 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v7 = "-[CSSpeechController resetAudioSession]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  contextResetQueue = self->_contextResetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CSSpeechController_resetAudioSession__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async(contextResetQueue, block);
}

uint64_t __39__CSSpeechController_resetAudioSession__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _teardownAudioProviderIfNeeded];
}

- (BOOL)prewarmAudioSession
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[CSSpeechController prewarmAudioSession]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  int v4 = [(CSSpeechController *)self sessionProvider];
  char v5 = [v4 prewarmAudioSessionWithError:0];

  return v5;
}

- (void)preheat
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    int v4 = "-[CSSpeechController preheat]";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (BOOL)setCurrentRecordContext:(id)a3 error:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (os_log_t *)MEMORY[0x1E4F5D168];
  uint64_t v8 = (void *)*MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    uint64_t v10 = [v6 description];
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSSpeechController setCurrentRecordContext:error:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v10;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s recordContext : %{public}@", buf, 0x16u);
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v38 = 0;
  if ([MEMORY[0x1E4F5D450] supportHomeKitAccessory]) {
    [(CSSpeechController *)self _updateRecordContextIfNeeded:v6];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CSSpeechController_setCurrentRecordContext_error___block_invoke;
  block[3] = &unk_1E658D4B0;
  void block[4] = self;
  id v12 = v6;
  id v34 = v12;
  dispatch_async_and_wait(queue, block);
  if ([v12 isTriggeredFromHearst])
  {
    uint64_t v13 = [v12 deviceId];
    BOOL v14 = v13 == 0;

    if (v14)
    {
      uint64_t v15 = +[CSOpportuneSpeakListenerDeviceManager sharedManager];
      uint64_t v16 = [v15 deviceId];
      [v12 setDeviceId:v16];
    }
  }
  if ([v12 type] != 14 || !objc_msgSend(v12, "isRequestDuringActiveCall"))
  {
    if ([v12 type] == 14 || objc_msgSend(v12, "type") == 5)
    {
      id v20 = [(CSSpeechController *)self streamProvider];

      if (v20)
      {
        BOOL v21 = [(CSSpeechController *)self streamProvider];
        id v32 = 0;
        char v22 = [v21 setCurrentContext:v12 error:&v32];
        id v18 = v32;
        *(unsigned char *)(*(void *)&buf[8] + 24) = v22;

        if (!a4) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
      contextResetQueue = self->_contextResetQueue;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __52__CSSpeechController_setCurrentRecordContext_error___block_invoke_247;
      v29[3] = &unk_1E658BD60;
      __int16 v31 = buf;
      v29[4] = self;
      id v30 = v12;
      dispatch_async_and_wait(contextResetQueue, v29);
    }
    else
    {
      uint64_t v24 = self->_contextResetQueue;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __52__CSSpeechController_setCurrentRecordContext_error___block_invoke_2;
      v26[3] = &unk_1E658BD60;
      double v28 = buf;
      v26[4] = self;
      id v27 = v12;
      dispatch_async_and_wait(v24, v26);
    }
    id v18 = 0;
    if (!a4)
    {
LABEL_22:
      BOOL v19 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
      goto LABEL_23;
    }
LABEL_21:
    *a4 = v18;
    goto LABEL_22;
  }
  uint64_t v17 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v35 = 136315138;
    os_log_t v36 = "-[CSSpeechController setCurrentRecordContext:error:]";
    _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_DEFAULT, "%s Will skip setting current record context because we were in active call and context was post or auto", v35, 0xCu);
  }
  id v18 = 0;
  BOOL v19 = 1;
LABEL_23:

  _Block_object_dispose(buf, 8);
  return v19;
}

uint64_t __52__CSSpeechController_setCurrentRecordContext_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAudioRecordContext:*(void *)(a1 + 40)];
}

uint64_t __52__CSSpeechController_setCurrentRecordContext_error___block_invoke_247(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _fetchAudioProviderWithContext:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __52__CSSpeechController_setCurrentRecordContext_error___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _fetchAudioProviderWithContext:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_updateRecordContextIfNeeded:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_endpointId && ([v4 isAudioRecordTypeSupportedByRemora] & 1) == 0)
  {
    id v6 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_FAULT))
    {
      endpointId = self->_endpointId;
      int v9 = 136315395;
      uint64_t v10 = "-[CSSpeechController _updateRecordContextIfNeeded:]";
      __int16 v11 = 2113;
      id v12 = endpointId;
      _os_log_fault_impl(&dword_1C9338000, v6, OS_LOG_TYPE_FAULT, "%s Falling back to button record type for context whose record type previously is set to unspecified for accessory %{private}@.", (uint8_t *)&v9, 0x16u);
    }
    [v5 setType:18];
    int v7 = [(NSUUID *)self->_endpointId UUIDString];
    [v5 setDeviceId:v7];
  }
}

- (BOOL)_doActivateAudioSessionWithReason:(unint64_t)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v7 = (os_log_t *)MEMORY[0x1E4F5D168];
  uint64_t v8 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    BOOL v21 = "-[CSSpeechController _doActivateAudioSessionWithReason:error:]";
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s Activating audio session now", buf, 0xCu);
  }
  int v9 = [(CSSpeechController *)self sessionProvider];

  if (v9)
  {
    if ([(CSAudioRecordContext *)self->_audioRecordContext isDictation]) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = 1;
    }
    if (a3 == 3)
    {
      if (self->_isSiriClientListening) {
        a3 = 4;
      }
      else {
        a3 = 3;
      }
    }
    __int16 v11 = [(CSSpeechController *)self sessionProvider];
    bundleIdFromDictation = self->_bundleIdFromDictation;
    id v19 = 0;
    int v13 = [v11 activateAudioSessionWithReason:a3 dynamicAttribute:v10 bundleID:bundleIdFromDictation error:&v19];
    id v14 = v19;

    uint64_t v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = @"NO";
      if (v13) {
        uint64_t v16 = @"YES";
      }
      *(_DWORD *)long long buf = 136315394;
      BOOL v21 = "-[CSSpeechController _doActivateAudioSessionWithReason:error:]";
      __int16 v22 = 2114;
      uint64_t v23 = v16;
      _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s AudioSession activated successfully ? %{public}@", buf, 0x16u);
    }
    if (a4) {
LABEL_16:
    }
      *a4 = v14;
  }
  else
  {
    id v18 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      BOOL v21 = "-[CSSpeechController _doActivateAudioSessionWithReason:error:]";
      _os_log_error_impl(&dword_1C9338000, v18, OS_LOG_TYPE_ERROR, "%s AudioSession Provider not available", buf, 0xCu);
    }
    LOBYTE(v13) = 0;
    id v14 = 0;
    if (a4) {
      goto LABEL_16;
    }
  }

  return v13;
}

- (BOOL)_activateAudioSessionWithReason:(unint64_t)a3 error:(id *)a4
{
  int v7 = NSStringFromSelector(a2);
  [(CSSpeechController *)self _cancelPendingAudioSessionActivateForReason:v7];

  return [(CSSpeechController *)self _doActivateAudioSessionWithReason:a3 error:a4];
}

- (void)_performPendingAudioSessionActivateForReason:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (NSUUID *)a3;
  pendingAudioSessionActivationToken = self->_pendingAudioSessionActivationToken;
  if (pendingAudioSessionActivationToken)
  {
    id v6 = (os_log_t *)MEMORY[0x1E4F5D168];
    int v7 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315650;
      id v18 = "-[CSSpeechController _performPendingAudioSessionActivateForReason:]";
      __int16 v19 = 2114;
      id v20 = pendingAudioSessionActivationToken;
      __int16 v21 = 2114;
      __int16 v22 = v4;
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_DEFAULT, "%s Delayed audio session activate: Consumed token %{public}@ in advance for reason %{public}@.", buf, 0x20u);
      pendingAudioSessionActivationToken = self->_pendingAudioSessionActivationToken;
    }
    self->_pendingAudioSessionActivationToken = 0;

    unint64_t pendingAudioSessionActivationReason = self->_pendingAudioSessionActivationReason;
    self->_unint64_t pendingAudioSessionActivationReason = 0;
    int v9 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v18 = "-[CSSpeechController _performPendingAudioSessionActivateForReason:]";
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_DEFAULT, "%s Delayed audio session activate: Activating audio session for reason %{public}@.", buf, 0x16u);
    }
    id v16 = 0;
    BOOL v10 = [(CSSpeechController *)self _activateAudioSessionWithReason:pendingAudioSessionActivationReason error:&v16];
    __int16 v11 = (NSUUID *)v16;
    id v12 = v11;
    int v13 = *v6;
    if (!v10 || v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315650;
        id v18 = "-[CSSpeechController _performPendingAudioSessionActivateForReason:]";
        __int16 v19 = 2114;
        id v20 = v4;
        __int16 v21 = 2112;
        __int16 v22 = v12;
        _os_log_error_impl(&dword_1C9338000, v13, OS_LOG_TYPE_ERROR, "%s Delayed audio session activate: Failed to activate audio session for reason %{public}@ due to error %@.", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v18 = "-[CSSpeechController _performPendingAudioSessionActivateForReason:]";
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_DEFAULT, "%s Delayed audio session activate: Successfully activate audio session for reason %{public}@.", buf, 0x16u);
    }
    pendingAudioSessionActivationCompletion = (void (**)(id, BOOL, void *))self->_pendingAudioSessionActivationCompletion;
    if (pendingAudioSessionActivationCompletion)
    {
      pendingAudioSessionActivationCompletion[2](pendingAudioSessionActivationCompletion, v10, v12);
      id v15 = self->_pendingAudioSessionActivationCompletion;
      self->_pendingAudioSessionActivationCompletion = 0;
    }
  }
}

- (void)_cancelPendingAudioSessionActivateForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  pendingAudioSessionActivationToken = self->_pendingAudioSessionActivationToken;
  if (pendingAudioSessionActivationToken)
  {
    id v6 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      BOOL v10 = "-[CSSpeechController _cancelPendingAudioSessionActivateForReason:]";
      __int16 v11 = 2114;
      id v12 = pendingAudioSessionActivationToken;
      __int16 v13 = 2114;
      id v14 = v4;
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, "%s Delayed audio session activate: Cancelled token %{public}@ for reason %{public}@.", (uint8_t *)&v9, 0x20u);
      pendingAudioSessionActivationToken = self->_pendingAudioSessionActivationToken;
    }
    self->_pendingAudioSessionActivationToken = 0;

    self->_unint64_t pendingAudioSessionActivationReason = 0;
  }
  id pendingAudioSessionActivationCompletion = self->_pendingAudioSessionActivationCompletion;
  if (pendingAudioSessionActivationCompletion)
  {
    (*((void (**)(id, void, void))pendingAudioSessionActivationCompletion + 2))(pendingAudioSessionActivationCompletion, 0, 0);
    id v8 = self->_pendingAudioSessionActivationCompletion;
    self->_id pendingAudioSessionActivationCompletion = 0;
  }
}

- (void)_scheduleActivateAudioSessionWithDelay:(double)a3 sessionActivateReason:(unint64_t)a4 scheduleReason:(id)a5 validator:(id)a6 completion:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  [(CSSpeechController *)self _cancelPendingAudioSessionActivateForReason:v12];
  id v15 = objc_alloc_init(MEMORY[0x1E4F29128]);
  objc_storeStrong((id *)&self->_pendingAudioSessionActivationToken, v15);
  self->_unint64_t pendingAudioSessionActivationReason = a4;
  id v16 = (void *)[v14 copy];

  id pendingAudioSessionActivationCompletion = self->_pendingAudioSessionActivationCompletion;
  self->_id pendingAudioSessionActivationCompletion = v16;

  dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  queue = self->_queue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __119__CSSpeechController__scheduleActivateAudioSessionWithDelay_sessionActivateReason_scheduleReason_validator_completion___block_invoke;
  v24[3] = &unk_1E658B618;
  v24[4] = self;
  id v20 = v15;
  id v25 = v20;
  double v28 = a3;
  id v21 = v12;
  id v26 = v21;
  id v22 = v13;
  id v27 = v22;
  unint64_t v29 = a4;
  dispatch_after(v18, queue, v24);
  uint64_t v23 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315906;
    __int16 v31 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:completion:]";
    __int16 v32 = 2114;
    id v33 = v20;
    __int16 v34 = 2050;
    double v35 = a3;
    __int16 v36 = 2114;
    id v37 = v21;
    _os_log_impl(&dword_1C9338000, v23, OS_LOG_TYPE_DEFAULT, "%s Delayed active audio session: Scheduled new token %{public}@ with %{public}f seconds delay for reason %{public}@.", buf, 0x2Au);
  }
}

void __119__CSSpeechController__scheduleActivateAudioSessionWithDelay_sessionActivateReason_scheduleReason_validator_completion___block_invoke(void *a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1[4] + 312) isEqual:a1[5]];
  int v3 = (os_log_t *)MEMORY[0x1E4F5D168];
  id v4 = *MEMORY[0x1E4F5D168];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT);
  if (!v2)
  {
    if (v5)
    {
      id v22 = (void *)a1[5];
      uint64_t v21 = a1[6];
      uint64_t v23 = *(void *)(a1[4] + 312);
      *(_DWORD *)long long buf = 136315906;
      double v35 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:c"
            "ompletion:]_block_invoke";
      __int16 v36 = 2114;
      uint64_t v37 = v21;
      __int16 v38 = 2114;
      uint64_t v39 = v22;
      __int16 v40 = 2114;
      uint64_t v41 = v23;
      uint64_t v24 = "%s Delayed active audio session: Ignored activate audio session for reason %{public}@ because the scheduled "
            "token %{public}@ does not match the current token %{public}@.";
      id v25 = v4;
      uint32_t v26 = 42;
LABEL_19:
      _os_log_impl(&dword_1C9338000, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    }
LABEL_20:
    dispatch_time_t v18 = 0;
    uint64_t v16 = 0;
    goto LABEL_21;
  }
  if (v5)
  {
    id v6 = (void *)a1[8];
    uint64_t v7 = a1[5];
    uint64_t v8 = a1[6];
    *(_DWORD *)long long buf = 136315906;
    double v35 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:com"
          "pletion:]_block_invoke";
    __int16 v36 = 2114;
    uint64_t v37 = v7;
    __int16 v38 = 2050;
    uint64_t v39 = v6;
    __int16 v40 = 2114;
    uint64_t v41 = v8;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s Delayed active audio session: Consumed token %{public}@ with %{public}f seconds delay for reason %{public}@.", buf, 0x2Au);
  }
  uint64_t v9 = a1[4];
  BOOL v10 = *(void **)(v9 + 312);
  *(void *)(v9 + 312) = 0;

  *(void *)(a1[4] + 328) = 0;
  uint64_t v11 = a1[7];
  if (v11 && !(*(unsigned int (**)(void))(v11 + 16))())
  {
    os_log_t v28 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = a1[6];
      *(_DWORD *)long long buf = 136315394;
      double v35 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:c"
            "ompletion:]_block_invoke";
      __int16 v36 = 2114;
      uint64_t v37 = v29;
      uint64_t v24 = "%s Delayed active audio session: Ignored activating audio session for reason %{public}@ because the validator rejected.";
      id v25 = v28;
      uint32_t v26 = 22;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  id v12 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = a1[6];
    *(_DWORD *)long long buf = 136315394;
    double v35 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:com"
          "pletion:]_block_invoke";
    __int16 v36 = 2114;
    uint64_t v37 = v13;
    _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_DEFAULT, "%s Delayed active audio session: Activating audio session for reason %{public}@.", buf, 0x16u);
  }
  id v14 = (void *)a1[4];
  uint64_t v15 = a1[9];
  id v33 = 0;
  uint64_t v16 = [v14 _activateAudioSessionWithReason:v15 error:&v33];
  id v17 = v33;
  dispatch_time_t v18 = v17;
  __int16 v19 = *v3;
  if (!v16 || v17)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = a1[6];
      *(_DWORD *)long long buf = 136315650;
      double v35 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:c"
            "ompletion:]_block_invoke";
      __int16 v36 = 2114;
      uint64_t v37 = v27;
      __int16 v38 = 2112;
      uint64_t v39 = v18;
      _os_log_error_impl(&dword_1C9338000, v19, OS_LOG_TYPE_ERROR, "%s Delayed active audio session: Failed to activate audio session for reason %{public}@ due to error %@.", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = a1[6];
      *(_DWORD *)long long buf = 136315394;
      double v35 = "-[CSSpeechController _scheduleActivateAudioSessionWithDelay:sessionActivateReason:scheduleReason:validator:c"
            "ompletion:]_block_invoke";
      __int16 v36 = 2114;
      uint64_t v37 = v20;
      _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_DEFAULT, "%s Delayed active audio session: Successfully activate audio session for reason %{public}@.", buf, 0x16u);
    }
    dispatch_time_t v18 = 0;
    uint64_t v16 = 1;
  }
LABEL_21:
  uint64_t v30 = *(void *)(a1[4] + 320);
  if (v30)
  {
    (*(void (**)(uint64_t, uint64_t, void *))(v30 + 16))(v30, v16, v18);
    uint64_t v31 = a1[4];
    __int16 v32 = *(void **)(v31 + 320);
    *(void *)(v31 + 320) = 0;
  }
}

- (BOOL)_activateAudioSessionWithReason:(unint64_t)a3 delay:(double)a4 delayRequested:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  uint64_t v43 = 0;
  id v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v37 = 0;
  __int16 v38 = &v37;
  uint64_t v39 = 0x3032000000;
  __int16 v40 = __Block_byref_object_copy__8283;
  uint64_t v41 = __Block_byref_object_dispose__8284;
  id v42 = 0;
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke;
  v36[3] = &unk_1E658C380;
  v36[4] = self;
  v36[5] = &v43;
  v36[6] = &v37;
  v36[7] = a3;
  id v12 = (void (**)(void))MEMORY[0x1CB785210](v36);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_233;
  v35[3] = &unk_1E658C380;
  uint8_t v35[4] = self;
  v35[5] = &v43;
  v35[6] = &v37;
  v35[7] = a3;
  uint64_t v13 = (void (**)(void))MEMORY[0x1CB785210](v35);
  if (!self->_supportSessionActivateDelay)
  {
    v12[2](v12);
    goto LABEL_24;
  }
  supportsDuckingOnSpeakerOutputEvaluator = (unsigned int (**)(void))self->_supportsDuckingOnSpeakerOutputEvaluator;
  if (supportsDuckingOnSpeakerOutputEvaluator && supportsDuckingOnSpeakerOutputEvaluator[2]())
  {
    uint64_t v15 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v48 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]";
      _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s Device supports ducking on speaker output we should check config.", buf, 0xCu);
    }
    BOOL v16 = [(CSSpeechController *)self _currentConfigurationSupportsDucking];
  }
  else
  {
    BOOL v16 = 1;
  }
  int v17 = [(CSSpeechController *)self _isDelayedDuckingSupportedContext] && v16;
  dispatch_time_t v18 = v12;
  if (v17 != 1) {
    goto LABEL_23;
  }
  if (a4 <= -1.0)
  {
LABEL_18:
    *((unsigned char *)v44 + 24) = 1;
    goto LABEL_24;
  }
  if (a4 <= 0.0)
  {
    if (v7) {
      dispatch_time_t v18 = v13;
    }
    else {
      dispatch_time_t v18 = v12;
    }
LABEL_23:
    ((void (*)(void))v18[2])();
    goto LABEL_24;
  }
  dispatch_async_and_wait((dispatch_queue_t)self->_queue, &__block_literal_global_237);
  __int16 v19 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v48 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]";
    _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_DEFAULT, "%s StreamProvider is already recording", buf, 0xCu);
  }
  uint64_t v20 = [(NSDictionary *)self->_lastVoiceTriggerInfo objectForKeyedSubscript:*MEMORY[0x1E4F5D928]];
  uint64_t v21 = [v20 unsignedLongLongValue];

  [MEMORY[0x1E4F5D300] hostTimeToTimeInterval:mach_absolute_time() - v21];
  double v23 = v22;
  uint64_t v24 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    __int16 v48 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]";
    __int16 v49 = 2050;
    double v50 = a4;
    __int16 v51 = 2050;
    double v52 = v23;
    _os_log_impl(&dword_1C9338000, v24, OS_LOG_TYPE_DEFAULT, "%s duckingDelayedTime = %{public}f, timeIntervalSinceLastTriggerEnd = %{public}lf", buf, 0x20u);
  }
  if (v23 < a4)
  {
    endpointerProxy = self->_endpointerProxy;
    uint32_t v26 = +[CSAssetManager sharedManager];
    uint64_t v27 = [v26 currentLanguageCode];
    [(CSEndpointerProxy *)endpointerProxy logHybridEndpointFeaturesWithEvent:@"com.apple.corespeech.ducking" locale:v27];

    os_log_t v28 = NSStringFromSelector(a2);
    double v29 = a4 - v23;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_243;
    v34[3] = &unk_1E658BC38;
    v34[4] = self;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_2;
    v33[3] = &__block_descriptor_40_e20_v20__0B8__NSError_12l;
    *(double *)&v33[4] = v29;
    [(CSSpeechController *)self _scheduleActivateAudioSessionWithDelay:a3 sessionActivateReason:v28 scheduleReason:v34 validator:v33 completion:v29];

    uint64_t v30 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v48 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]";
      __int16 v49 = 2050;
      double v50 = v29;
      _os_log_impl(&dword_1C9338000, v30, OS_LOG_TYPE_DEFAULT, "%s Scheduled activateAudioSession with %{public}f seconds delay in prepareRecordWithSettings.", buf, 0x16u);
    }
    goto LABEL_18;
  }
  v13[2](v13);
LABEL_24:
  if (a6) {
    *a6 = (id) v38[5];
  }
  BOOL v31 = *((unsigned char *)v44 + 24) != 0;

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
  return v31;
}

void __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v9 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Activating Audio Session Now Sync.", buf, 0xCu);
  }
  int v3 = (void *)a1[4];
  uint64_t v4 = a1[7];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  char v6 = [v3 _activateAudioSessionWithReason:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v6;
}

void __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_233(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v2 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v8 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]_block_invoke";
    _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_DEFAULT, "%s Activating Audio Session Now Async.", buf, 0xCu);
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  uint64_t v3 = a1[4];
  uint64_t v4 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_234;
  block[3] = &unk_1E658B460;
  uint64_t v5 = a1[7];
  void block[5] = a1[6];
  void block[6] = v5;
  void block[4] = v3;
  dispatch_async(v4, block);
}

uint64_t __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_243(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 118);
}

void __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  char v6 = *MEMORY[0x1E4F5D168];
  if (!v5)
  {
    BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (!v8) {
        goto LABEL_10;
      }
      uint64_t v9 = *(void *)(a1 + 32);
      int v12 = 136315394;
      uint64_t v13 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]_block_invoke";
      __int16 v14 = 2050;
      uint64_t v15 = v9;
      uint64_t v10 = "%s Finished activate audio session with %{public}f seconds delay from prepareRecordWithSettings.";
    }
    else
    {
      if (!v8) {
        goto LABEL_10;
      }
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 136315394;
      uint64_t v13 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]_block_invoke";
      __int16 v14 = 2050;
      uint64_t v15 = v11;
      uint64_t v10 = "%s Cancelled activate audio session with %{public}f seconds delay from prepareRecordWithSettings.";
    }
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0x16u);
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v12 = 136315650;
    uint64_t v13 = "-[CSSpeechController _activateAudioSessionWithReason:delay:delayRequested:error:]_block_invoke_2";
    __int16 v14 = 2050;
    uint64_t v15 = v7;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_error_impl(&dword_1C9338000, v6, OS_LOG_TYPE_ERROR, "%s Failed activate audio session with %{public}f seconds delay from prepareRecordWithSettings due to error %{public}@.", (uint8_t *)&v12, 0x20u);
  }
LABEL_10:
}

void __81__CSSpeechController__activateAudioSessionWithReason_delay_delayRequested_error___block_invoke_234(void *a1)
{
  uint64_t v1 = a1[6];
  int v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v3 + 40);
  [v2 _activateAudioSessionWithReason:v1 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
}

- (BOOL)_currentConfigurationSupportsDucking
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CSSpeechController *)self streamProvider];

  if (v3)
  {
    uint64_t v4 = [(CSSpeechController *)self streamProvider];
    id v14 = 0;
    int v5 = [v4 supportsDuckingOnCurrentRouteWithError:&v14];
    id v6 = v14;

    uint64_t v7 = (os_log_t *)MEMORY[0x1E4F5D168];
    BOOL v8 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v16 = "-[CSSpeechController _currentConfigurationSupportsDucking]";
      __int16 v17 = 1026;
      LODWORD(v18) = v5;
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s ConfigSupportsDucking: %{public}d", buf, 0x12u);
    }
    if (v6)
    {
      os_log_t v9 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        int v12 = v9;
        uint64_t v13 = [v6 localizedDescription];
        *(_DWORD *)long long buf = 136315394;
        __int16 v16 = "-[CSSpeechController _currentConfigurationSupportsDucking]";
        __int16 v17 = 2112;
        uint64_t v18 = v13;
        _os_log_error_impl(&dword_1C9338000, v12, OS_LOG_TYPE_ERROR, "%s Failed due to error %@.", buf, 0x16u);
      }
    }
  }
  else
  {
    uint64_t v10 = *MEMORY[0x1E4F5D168];
    LOBYTE(v5) = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      __int16 v16 = "-[CSSpeechController _currentConfigurationSupportsDucking]";
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_DEFAULT, "%s Stream provider does not exist", buf, 0xCu);
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (BOOL)_isDelayedDuckingSupportedContext
{
  if (([(CSAudioRecordContext *)self->_audioRecordContext isVoiceTriggered] & 1) != 0
    || ([(CSAudioRecordContext *)self->_audioRecordContext isServerInvoked] & 1) != 0
    || ([(CSAudioRecordContext *)self->_audioRecordContext isHomePressed] & 1) != 0)
  {
    return 1;
  }
  audioRecordContext = self->_audioRecordContext;
  return [(CSAudioRecordContext *)audioRecordContext isTVRemote];
}

- (BOOL)_fetchLastTriggerInfo
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CSSpeechController *)self xpcClient];

  if (v3)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__CSSpeechController__fetchLastTriggerInfo__block_invoke;
    block[3] = &unk_1E658D4D8;
    void block[4] = self;
    dispatch_async(queue, block);
  }
  else
  {
    int v5 = *MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      os_log_t v9 = "-[CSSpeechController _fetchLastTriggerInfo]";
      _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s xpcClient not existing", buf, 0xCu);
    }
  }
  return v3 != 0;
}

void __43__CSSpeechController__fetchLastTriggerInfo__block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) xpcClient];
  uint64_t v3 = [*(id *)(a1 + 32) audioRecordContext];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__CSSpeechController__fetchLastTriggerInfo__block_invoke_2;
  v4[3] = &unk_1E658A2A8;
  v4[4] = *(void *)(a1 + 32);
  [v2 triggerInfoForContext:v3 completion:v4];
}

uint64_t __43__CSSpeechController__fetchLastTriggerInfo__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [a2 copy];
  uint64_t v7 = *(void *)(a1 + 32);
  BOOL v8 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = v6;

  uint64_t v9 = [v5 copy];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 80);
  *(void *)(v10 + 80) = v9;

  int v12 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(v13 + 72);
    uint64_t v14 = *(void *)(v13 + 80);
    int v17 = 136315650;
    uint64_t v18 = "-[CSSpeechController _fetchLastTriggerInfo]_block_invoke_2";
    __int16 v19 = 2114;
    uint64_t v20 = v15;
    __int16 v21 = 2114;
    uint64_t v22 = v14;
    _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_DEFAULT, "%s received lastVoiceTriggerInfo %{public}@, lastRTSTriggerInfo %{public}@", (uint8_t *)&v17, 0x20u);
  }
  return [*(id *)(a1 + 32) _setSoundPlayingState];
}

- (BOOL)prepareRecordWithSettings:(id)a3 error:(id *)a4
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (__CFString *)a3;
  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F5D168];
  BOOL v8 = *MEMORY[0x1E4F5D168];
  uint64_t v9 = &off_1C94A6000;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
    __int16 v101 = 2114;
    v102 = v6;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_DEFAULT, "%s settings : %{public}@", buf, 0x16u);
  }
  kdebug_trace();
  if (!v6) {
    goto LABEL_7;
  }
  uint64_t v10 = [(__CFString *)v6 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_DictationRequestAppBundleID"];
  if (!v10) {
    goto LABEL_7;
  }
  uint64_t v11 = (void *)v10;
  int v12 = [(__CFString *)v6 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_DictationRequestAppBundleID"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v14 = [(__CFString *)v6 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_DictationRequestAppBundleID"];
    bundleIdFromDictation = self->_bundleIdFromDictation;
    self->_bundleIdFromDictation = v14;
  }
  else
  {
LABEL_7:
    bundleIdFromDictation = self->_bundleIdFromDictation;
    self->_bundleIdFromDictation = 0;
  }

  if ([(CSSpeechController *)self _isHubRequestTV]) {
    self->_unint64_t decoderProcessedSampleCountForTV = 0;
  }
  uint64_t v16 = 0;
  double v17 = 0.0;
  if (v6 && self->_supportSessionActivateDelay)
  {
    uint64_t v18 = [(__CFString *)v6 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_AudioSessionActiveDelay"];
    objc_opt_class();
    char v19 = objc_opt_isKindOfClass();

    if (v19)
    {
      uint64_t v20 = [(__CFString *)v6 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_AudioSessionActiveDelay"];
      [v20 floatValue];
      double v17 = v21;

      uint64_t v16 = 1;
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  contextResetQueue = self->_contextResetQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CSSpeechController_prepareRecordWithSettings_error___block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_async_and_wait(contextResetQueue, block);
  uint64_t v23 = [(CSSpeechController *)self sessionProvider];

  if (v23)
  {
    uint64_t v24 = [(CSSpeechController *)self sessionProvider];
    [v24 enableSmartRoutingConsideration:0];
  }
  id v25 = [(CSSpeechController *)self sessionProvider];

  if (!v25)
  {
    id v33 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
      _os_log_error_impl(&dword_1C9338000, v33, OS_LOG_TYPE_ERROR, "%s Session Provider does not exist", buf, 0xCu);
      if (!v6) {
        goto LABEL_32;
      }
      goto LABEL_26;
    }
LABEL_25:
    if (!v6) {
      goto LABEL_32;
    }
    goto LABEL_26;
  }
  if (!v6 || !self->_supportHearstVoiceTrigger) {
    goto LABEL_25;
  }
  uint32_t v26 = [(__CFString *)v6 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_AudioSessionActiveReason"];
  objc_opt_class();
  char v27 = objc_opt_isKindOfClass();

  if ((v27 & 1) == 0) {
    goto LABEL_26;
  }
  os_log_t v28 = [(__CFString *)v6 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_AudioSessionActiveReason"];
  uint64_t v29 = [v28 integerValue];

  if (v29 == 2)
  {
    if (![(CSAudioRecordContext *)self->_audioRecordContext isTriggeredFromHearst])goto LABEL_26; {
    uint64_t v30 = [(CSSpeechController *)self sessionProvider];
    }
    BOOL v31 = v30;
    uint64_t v32 = 1;
  }
  else
  {
    __int16 v38 = [(__CFString *)v6 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_AudioSessionActiveReason"];
    uint64_t v39 = [v38 integerValue];

    if (v39 != 3) {
      goto LABEL_26;
    }
    uint64_t v30 = [(CSSpeechController *)self sessionProvider];
    BOOL v31 = v30;
    uint64_t v32 = 0;
  }
  [v30 enableMiniDucking:v32];

LABEL_26:
  __int16 v34 = [(__CFString *)v6 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_AudioSessionActiveReason"];
  objc_opt_class();
  char v35 = objc_opt_isKindOfClass();

  if (v35)
  {
    __int16 v36 = [(__CFString *)v6 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_AudioSessionActiveReason"];
    uint64_t v37 = [v36 integerValue];

    goto LABEL_33;
  }
LABEL_32:
  uint64_t v37 = 0;
LABEL_33:
  if (([(CSSpeechController *)self _shouldFetchVoiceTriggerInfo]
     || [(CSSpeechController *)self _shouldFetchRaiseToSpeakInfo])
    && ![(CSSpeechController *)self _fetchLastTriggerInfo])
  {
    BOOL v40 = 0;
    id v41 = 0;
  }
  else
  {
    id v97 = 0;
    BOOL v40 = [(CSSpeechController *)self _activateAudioSessionWithReason:v37 delay:v16 delayRequested:&v97 error:v17];
    id v41 = v97;
  }
  BOOL v42 = self->_supportTriagleModeSessionActivationRetry || v40;
  if (!self->_supportTriagleModeSessionActivationRetry || v40) {
    goto LABEL_50;
  }
  uint64_t v43 = [v41 domain];
  if (([v43 isEqualToString:*MEMORY[0x1E4F28760]] & 1) == 0)
  {

    goto LABEL_49;
  }
  uint64_t v44 = [v41 code];

  if (v44 != -11795)
  {
LABEL_49:
    BOOL v42 = 0;
    goto LABEL_50;
  }
  uint64_t v45 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
    _os_log_impl(&dword_1C9338000, v45, OS_LOG_TYPE_DEFAULT, "%s Received special error code that corespeech needs to setContext and activate audio session again", buf, 0xCu);
  }
  char v46 = self->_contextResetQueue;
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __54__CSSpeechController_prepareRecordWithSettings_error___block_invoke_222;
  v96[3] = &unk_1E658D4D8;
  v96[4] = self;
  dispatch_async_and_wait(v46, v96);
  id v95 = v41;
  BOOL v42 = [(CSSpeechController *)self _activateAudioSessionWithReason:v37 error:&v95];
  id v47 = v95;

  id v41 = v47;
LABEL_50:
  uint64_t v48 = [(CSAudioRecordContext *)self->_audioRecordContext isContinuousConversation];
  if (v48)
  {
    __int16 v49 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
      _os_log_impl(&dword_1C9338000, v49, OS_LOG_TYPE_DEFAULT, "%s We will skip Siri Client monitor update since it is FF", buf, 0xCu);
    }
  }
  if (!v42)
  {
    int v55 = 0;
    goto LABEL_84;
  }
  v91 = a4;
  uint64_t v50 = [(CSSpeechController *)self audioStream];
  if (v50)
  {
    __int16 v51 = (void *)v50;
    double v52 = [(CSSpeechController *)self audioStream];
    int v53 = [v52 isStreaming];

    if (v53)
    {
      uint64_t v54 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
        _os_log_impl(&dword_1C9338000, v54, OS_LOG_TYPE_DEFAULT, "%s CSSpeechController is already streaming audio.., we don't need to create another audio stream here", buf, 0xCu);
      }
      int v55 = 1;
      goto LABEL_83;
    }
  }
  id v56 = [(CSSpeechController *)self audioStream];

  if (!v56)
  {
    char v66 = [(CSSpeechController *)self streamProvider];

    if (!v66)
    {
      uint64_t v76 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
        _os_log_error_impl(&dword_1C9338000, v76, OS_LOG_TYPE_ERROR, "%s AudioStreamProvider is not existing?", buf, 0xCu);
      }
      uint64_t v77 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1552 userInfo:0];

      int v55 = 0;
      id v41 = (id)v77;
      goto LABEL_83;
    }
    id v67 = (void *)MEMORY[0x1E4F5D240];
    id v68 = [(CSSpeechController *)self audioRecordContext];
    id v59 = [v67 defaultRequestWithContext:v68];

    [v59 setClientIdentity:1];
    [v59 setRequestSkipClientMonitorUpdate:v48];
    [v59 setRequestRecordModeLock:1];
    [v59 setRequestListeningMicIndicatorLock:1];
    long long v69 = [(CSSpeechController *)self streamProvider];
    unint64_t v70 = (objc_class *)objc_opt_class();
    int v71 = NSStringFromClass(v70);
    id v93 = 0;
    id v64 = [v69 audioStreamWithRequest:v59 streamName:v71 error:&v93];
    id v61 = v93;

    uint64_t v7 = (os_log_t *)MEMORY[0x1E4F5D168];
    os_log_t v72 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v64) {
        __int16 v73 = @"YES";
      }
      else {
        __int16 v73 = @"NO";
      }
      uint64_t v74 = v72;
      __int16 v75 = [v61 localizedDescription];
      *(_DWORD *)long long buf = 136315650;
      v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
      __int16 v101 = 2114;
      v102 = v73;
      uint64_t v9 = &off_1C94A6000;
      __int16 v103 = 2114;
      v104 = v75;
      _os_log_impl(&dword_1C9338000, v74, OS_LOG_TYPE_DEFAULT, "%s audioStreamWithRequest succeeded ? %{public}@, error - %{public}@", buf, 0x20u);

      uint64_t v7 = (os_log_t *)MEMORY[0x1E4F5D168];
    }
    int v55 = v64 != 0;
    if (v64)
    {
      [(CSSpeechController *)self setAudioStream:v64];
      [v64 setDelegate:self];
LABEL_81:

      goto LABEL_82;
    }
    v78 = *v7;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
    {
      v89 = v78;
      uint64_t v90 = [v61 localizedDescription];
      *(_DWORD *)long long buf = 136315394;
      v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
      __int16 v101 = 2114;
      v102 = v90;
      _os_log_error_impl(&dword_1C9338000, v89, OS_LOG_TYPE_ERROR, "%s Failed to get audioStream : %{public}@", buf, 0x16u);
    }
    id v79 = v61;

    id v41 = v79;
LABEL_80:
    uint64_t v7 = (os_log_t *)MEMORY[0x1E4F5D168];
    goto LABEL_81;
  }
  float v57 = (void *)MEMORY[0x1E4F5D240];
  int v58 = [(CSSpeechController *)self audioRecordContext];
  id v59 = [v57 defaultRequestWithContext:v58];

  [v59 setClientIdentity:1];
  [v59 setRequestSkipClientMonitorUpdate:v48];
  [v59 setRequestRecordModeLock:1];
  [v59 setRequestListeningMicIndicatorLock:1];
  BOOL v60 = [(CSSpeechController *)self audioStream];
  id v94 = 0;
  int v55 = [v60 prepareAudioStreamSyncWithRequest:v59 error:&v94];
  id v61 = v94;

  os_log_t v62 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v55) {
      double v63 = @"YES";
    }
    else {
      double v63 = @"NO";
    }
    id v64 = v62;
    id v65 = [v61 localizedDescription];
    *(_DWORD *)long long buf = 136315650;
    v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
    __int16 v101 = 2114;
    v102 = v63;
    uint64_t v9 = &off_1C94A6000;
    __int16 v103 = 2114;
    v104 = v65;
    _os_log_impl(&dword_1C9338000, v64, OS_LOG_TYPE_DEFAULT, "%s Prepare audio stream succeeded ? %{public}@, error - %{public}@", buf, 0x20u);

    goto LABEL_80;
  }
LABEL_82:

LABEL_83:
  a4 = v91;
LABEL_84:
  uint64_t v80 = [(CSSpeechController *)self streamProvider];
  self->_isNarrowBand = [v80 isNarrowBand];

  if (self->_isNarrowBand) {
    [(CSSpeechController *)self _setupDownsamplerIfNeeded];
  }
  if (v6)
  {
    id v81 = [(__CFString *)v6 objectForKeyedSubscript:@"CSSpeechRecordSettingsKey_asrOnDevice"];
    char v82 = [v81 BOOLValue];

    if (!v55)
    {
LABEL_93:
      v84 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
        _os_log_impl(&dword_1C9338000, v84, OS_LOG_TYPE_DEFAULT, "%s Skipping audio converter setup", buf, 0xCu);
      }
      goto LABEL_95;
    }
  }
  else
  {
    char v82 = 0;
    if (!v55) {
      goto LABEL_93;
    }
  }
  if (v82) {
    goto LABEL_93;
  }
  int v55 = 1;
  if (![(CSSpeechController *)self _setupAudioConverter:1 isNarrowBand:self->_isNarrowBand])
  {
    uint64_t v83 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5D138] code:1551 userInfo:0];

    int v55 = 0;
    id v41 = (id)v83;
  }
LABEL_95:
  kdebug_trace();
  if (a4) {
    *a4 = v41;
  }
  if (v55)
  {
    queue = self->_queue;
    v92[0] = MEMORY[0x1E4F143A8];
    v92[1] = 3221225472;
    v92[2] = __54__CSSpeechController_prepareRecordWithSettings_error___block_invoke_231;
    v92[3] = &unk_1E658D4D8;
    v92[4] = self;
    dispatch_async(queue, v92);
  }
  uint64_t v86 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    v87 = @"NO";
    if (v55) {
      v87 = @"YES";
    }
    *(_DWORD *)long long buf = *((void *)v9 + 330);
    v100 = "-[CSSpeechController prepareRecordWithSettings:error:]";
    __int16 v101 = 2114;
    v102 = v87;
    _os_log_impl(&dword_1C9338000, v86, OS_LOG_TYPE_DEFAULT, "%s Done prepareRecord with result: %{public}@.", buf, 0x16u);
  }

  return v55;
}

void __54__CSSpeechController_prepareRecordWithSettings_error___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldResetContextAtPrepare])
  {
    int v2 = *(void **)(a1 + 32);
    id v3 = [v2 audioRecordContext];
    [v2 _fetchAudioProviderWithContext:v3];
  }
}

void __54__CSSpeechController_prepareRecordWithSettings_error___block_invoke_222(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 audioRecordContext];
  [v1 _fetchAudioProviderWithContext:v2];
}

uint64_t __54__CSSpeechController_prepareRecordWithSettings_error___block_invoke_231(uint64_t a1)
{
  return [*(id *)(a1 + 32) _createAudioPowerMeterIfNeeded];
}

- (BOOL)_shouldResetContextAtPrepare
{
  xpcClient = self->_xpcClient;
  if (xpcClient) {
    return ![(CSXPCClient *)xpcClient isConnected];
  }
  else {
    return 1;
  }
}

- (BOOL)_isHubRequestTV
{
  int v3 = CSIsTV();
  if (v3) {
    LOBYTE(v3) = self->_endpointId == 0;
  }
  return v3;
}

- (void)startController
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = (os_log_t *)MEMORY[0x1E4F5D168];
  uint64_t v4 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v11 = "-[CSSpeechController startController]";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEFAULT, "%s Calling startController", buf, 0xCu);
  }
  if (self->_setupStarted)
  {
    id v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v11 = "-[CSSpeechController startController]";
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Ignore request since it is already started", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v6 = +[CSVoiceTriggerAssetHandler sharedHandlerDisabledOnDeviceCompilation];
    uint64_t v7 = [(NSUUID *)self->_endpointId UUIDString];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__CSSpeechController_startController__block_invoke;
    v9[3] = &unk_1E658D0A8;
    v9[4] = self;
    [v6 getVoiceTriggerAssetWithEndpointId:v7 completion:v9];

    BOOL v8 = +[CSVoiceTriggerAssetHandler sharedHandlerDisabledOnDeviceCompilation];
    [v8 registerObserver:self];

    if (!self->_endpointId) {
      [(CSSmartSiriVolumeController *)self->_volumeController setDelegate:self];
    }
    [(CSAudioSessionController *)self->_audioSessionController registerObserver:self];
    if (![MEMORY[0x1E4F5D450] isAttentiveSiriEnabled] || self->_endpointId) {
      [(CSSpeechController *)self _refreshSpeakerRecognitionAssets];
    }
    self->_setupStarted = 1;
  }
}

void __37__CSSpeechController_startController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    [*(id *)(*(void *)(a1 + 32) + 296) setAsset:v5];
  }
  else
  {
    uint64_t v7 = (void *)*MEMORY[0x1E4F5D168];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_ERROR))
    {
      BOOL v8 = v7;
      uint64_t v9 = [v6 localizedDescription];
      int v10 = 136315394;
      uint64_t v11 = "-[CSSpeechController startController]_block_invoke";
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s Cannot reinitialize ContinuousVoiceTrigger since we cannot look-up VoiceTrigger asset : %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (BOOL)initializeRecordSessionWithRecordContext:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F5D168];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D168], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[CSSpeechController initializeRecordSessionWithRecordContext:]";
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_DEFAULT, "%s Record Context: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  kdebug_trace();
  BOOL v6 = [(CSSpeechController *)self setCurrentRecordContext:v4 error:0];
  kdebug_trace();

  return v6;
}

- (void)_initializeTimerState
{
  [(SOClockTimerObserver *)self->_timerMonitor addListener:self];
  objc_initWeak(&location, self);
  timerMonitor = self->_timerMonitor;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__CSSpeechController__initializeTimerState__block_invoke;
  v4[3] = &unk_1E658A280;
  objc_copyWeak(&v5, &location);
  [(SOClockTimerObserver *)timerMonitor getFiringTimerIDsWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __43__CSSpeechController__initializeTimerState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained[2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CSSpeechController__initializeTimerState__block_invoke_2;
  v7[3] = &unk_1E658D4B0;
  id v8 = v3;
  uint64_t v9 = WeakRetained;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __43__CSSpeechController__initializeTimerState__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "_setTimerIsPlaying:", objc_msgSend(*(id *)(a1 + 32), "count") != 0);
  id v2 = *(void **)(a1 + 40);
  return [v2 _setSoundPlayingState];
}

- (void)_initializeAlarmState
{
  [(SOClockAlarmObserver *)self->_alarmMonitor addListener:self];
  objc_initWeak(&location, self);
  alarmMonitor = self->_alarmMonitor;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__CSSpeechController__initializeAlarmState__block_invoke;
  v4[3] = &unk_1E658A280;
  objc_copyWeak(&v5, &location);
  [(SOClockAlarmObserver *)alarmMonitor getFiringAlarmIDsWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __43__CSSpeechController__initializeAlarmState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained[2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CSSpeechController__initializeAlarmState__block_invoke_2;
  v7[3] = &unk_1E658D4B0;
  id v8 = v3;
  uint64_t v9 = WeakRetained;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __43__CSSpeechController__initializeAlarmState__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "_setAlarmIsPlaying:", objc_msgSend(*(id *)(a1 + 32), "count") != 0);
  id v2 = *(void **)(a1 + 40);
  return [v2 _setSoundPlayingState];
}

- (void)_initializeMediaPlayingState
{
  [(SOMediaNowPlayingObserver *)self->_mediaPlayingMonitor addListener:self];
  objc_initWeak(&location, self);
  mediaPlayingMonitor = self->_mediaPlayingMonitor;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__CSSpeechController__initializeMediaPlayingState__block_invoke;
  v4[3] = &unk_1E658BAB8;
  objc_copyWeak(&v5, &location);
  [(SOMediaNowPlayingObserver *)mediaPlayingMonitor getPlaybackStateWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__CSSpeechController__initializeMediaPlayingState__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained[2];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__CSSpeechController__initializeMediaPlayingState__block_invoke_2;
  v5[3] = &unk_1E658D3C8;
  void v5[4] = WeakRetained;
  v5[5] = a2;
  dispatch_async(v4, v5);
}

uint64_t __50__CSSpeechController__initializeMediaPlayingState__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 32);
  if (v2 == 4)
  {
    BOOL v3 = 0;
    uint64_t v5 = 1;
  }
  else
  {
    BOOL v3 = v2 == 1;
    uint64_t v5 = 0;
  }
  [v4 _setMediaPlaybackState:v3 isInterrupted:v5];
  id v6 = *(void **)(a1 + 32);
  return [v6 _setSoundPlayingState];
}

- (id)_createTimerMonitor
{
  if (self->_endpointId)
  {
    id v2 = objc_alloc(MEMORY[0x1E4FA2B20]);
    BOOL v3 = [MEMORY[0x1E4F4E4A0] currentContext];
    id v4 = (id)[v2 initWithInstanceContext:v3];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA2B20]);
  }
  return v4;
}

- (id)_createAlarmMonitor
{
  if (self->_endpointId)
  {
    id v2 = objc_alloc(MEMORY[0x1E4FA2B18]);
    BOOL v3 = [MEMORY[0x1E4F4E4A0] currentContext];
    id v4 = (id)[v2 initWithInstanceContext:v3];
  }
  else
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FA2B18]);
  }
  return v4;
}

- (id)_createMediaPlayingMonitor
{
  BOOL v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  id v4 = (OS_dispatch_queue *)dispatch_queue_create("MediaPlayingObserverQueue", v3);
  mediaPlayingObserverQueue = self->_mediaPlayingObserverQueue;
  self->_mediaPlayingObserverQueue = v4;

  endpointId = self->_endpointId;
  id v7 = objc_alloc(MEMORY[0x1E4FA2B28]);
  id v8 = v7;
  uint64_t v9 = self->_mediaPlayingObserverQueue;
  if (endpointId)
  {
    __int16 v10 = [MEMORY[0x1E4F4E4A0] currentContext];
    id v11 = (void *)[v8 initWithQueue:v9 instanceContext:v10];
  }
  else
  {
    id v11 = (void *)[v7 initWithQueue:v9];
  }

  return v11;
}

- (BOOL)_supportsHybridSDSD
{
  if (AFDeviceSupportsSiriUOD()) {
    return 0;
  }
  return MEMORY[0x1F410AC90]();
}

- (id)_getSerialQueueWithName:(id)a3 targetQueue:(id)a4
{
  uint64_t v5 = a4;
  if (v5)
  {
    uint64_t v6 = (uint64_t)dispatch_queue_create_with_target_V2((const char *)[a3 UTF8String], 0, v5);
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F5D450] getSerialQueueWithQOS:33 name:a3 fixedPriority:*MEMORY[0x1E4F5D4E8]];
  }
  id v7 = (void *)v6;

  return v7;
}

- (CSSpeechController)initWithEndpointId:(id)a3 xpcClientFactory:(id)a4 endpointer:(id)a5 continuousVoiceTrigger:(id)a6 siriVolumeController:(id)a7 mediaPlayingMonitor:(id)a8 alarmMonitor:(id)a9 timerMonitor:(id)a10 audioSessionController:(id)a11 supportPhatic:(BOOL)a12 supportHearstVoiceTrigger:(BOOL)a13 supportTriagleModeSessionActivationRetry:(BOOL)a14 supportSessionActivateDelay:(BOOL)a15 supportsDuckingOnSpeakerEvaluator:(id)a16
{
  id v92 = a3;
  id v22 = a4;
  id v91 = a5;
  id v23 = a6;
  id v24 = a7;
  id v90 = a8;
  id v25 = a9;
  id v26 = a10;
  id v27 = a11;
  os_log_t v28 = v25;
  id v29 = a16;
  v95.receiver = self;
  v95.super_class = (Class)CSSpeechController;
  uint64_t v30 = [(CSSpeechController *)&v95 init];
  if (!v30) {
    goto LABEL_60;
  }
  id v89 = v29;
  CSLogInitIfNeeded();
  v30->_supportPhatic = a12;
  v30->_supportHearstVoiceTrigger = a13;
  v30->_supportTriagleModeSessionActivationRetry = a14;
  v30->_supportSessionActivateDelay = a15;
  if ([MEMORY[0x1E4F5D450] supportsDispatchWorkloop])
  {
    BOOL v31 = 0;
  }
  else
  {
    BOOL v31 = [MEMORY[0x1E4F5D450] rootQueueWithFixedPriority:*MEMORY[0x1E4F5D4E8]];
  }
  uint64_t v32 = [(CSSpeechController *)v30 _getSerialQueueWithName:@"CSSpeechController" targetQueue:v31];
  queue = v30->_queue;
  v30->_queue = (OS_dispatch_queue *)v32;

  uint64_t v34 = [(CSSpeechController *)v30 _getSerialQueueWithName:@"CSSpeechController ContextReset" targetQueue:v31];
  contextResetQueue = v30->_contextResetQueue;
  v30->_contextResetQueue = (OS_dispatch_queue *)v34;

  v30->_BOOL isSiriClientListening = 0;
  v30->_isNarrowBand = 0;
  bundleIdFromDictation = v30->_bundleIdFromDictation;
  v30->_bundleIdFromDictation = 0;

  uint64_t v37 = [v92 copy];
  endpointId = v30->_endpointId;
  v30->_endpointId = (NSUUID *)v37;

  if (v91)
  {
    objc_storeStrong((id *)&v30->_endpointerProxy, a5);
LABEL_13:
    [(CSEndpointerProxy *)v30->_endpointerProxy setEndpointerImplDelegate:v30];
    goto LABEL_14;
  }
  if (!CSIsTV() || ([MEMORY[0x1E4F5D450] supportsEndpointingOnATV] & 1) != 0)
  {
    if (!v30->_endpointId)
    {
      uint64_t v39 = +[CSEndpointerFactory endpointerProxy];
      goto LABEL_12;
    }
LABEL_10:
    uint64_t v39 = [[CSEndpointerProxy alloc] initForSidekick];
LABEL_12:
    endpointerProxy = v30->_endpointerProxy;
    v30->_endpointerProxy = v39;

    goto LABEL_13;
  }
  if ([MEMORY[0x1E4F5D450] supportHomeKitAccessory] && v30->_endpointId) {
    goto LABEL_10;
  }
LABEL_14:
  if ([(CSSpeechController *)v30 _supportsHybridSDSD])
  {
    id v41 = objc_alloc_init(CSRCHandlingXPCClient);
    rcHandlingClient = v30->_rcHandlingClient;
    v30->_rcHandlingClient = v41;
  }
  uint64_t v43 = [MEMORY[0x1E4F5D2F8] sharedPreferences];
  v30->_BOOL twoShotNotificationEnabled = [v43 twoShotNotificationEnabled];

  if (CSIsInternalBuild())
  {
    id v44 = objc_alloc(MEMORY[0x1E4F5D258]);
    uint64_t v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    id v46 = v27;
    id v47 = v24;
    id v48 = v23;
    id v49 = v22;
    id v50 = v26;
    __int16 v51 = v31;
    int v53 = v52 = v28;
    *(float *)&double v54 = (float)[(CSSpeechController *)v30 _currentAudioRecorderSampleRate];
    uint64_t v55 = [v44 initWithToken:v53 sampleRate:1 numChannels:v54];
    continuousZeroCounter = v30->_continuousZeroCounter;
    v30->_continuousZeroCounter = (CSAudioZeroCounter *)v55;

    os_log_t v28 = v52;
    BOOL v31 = v51;
    id v26 = v50;
    id v22 = v49;
    id v23 = v48;
    id v24 = v47;
    id v27 = v46;
    id v29 = v89;
  }
  if (v30->_supportPhatic)
  {
    uint64_t v57 = [(CSSpeechController *)v30 _getSerialQueueWithName:@"com.apple.corespeech.twoShotAudibleFeedback" targetQueue:v31];
    audibleFeedbackQueue = v30->_audibleFeedbackQueue;
    v30->_audibleFeedbackQueue = (OS_dispatch_queue *)v57;

    dispatch_group_t v59 = dispatch_group_create();
    twoShotAudibleFeedbackDecisionGroup = v30->_twoShotAudibleFeedbackDecisionGroup;
    v30->_twoShotAudibleFeedbackDecisionGroup = (OS_dispatch_group *)v59;
  }
  if ([(CSSpeechController *)v30 _shouldUseSoundPlaybackMonitors])
  {
    if (v90)
    {
      id v61 = (SOMediaNowPlayingObserver *)v90;
    }
    else
    {
      id v61 = [(CSSpeechController *)v30 _createMediaPlayingMonitor];
    }
    mediaPlayingMonitor = v30->_mediaPlayingMonitor;
    v30->_mediaPlayingMonitor = v61;

    [(CSSpeechController *)v30 _initializeMediaPlayingState];
    if (v28)
    {
      double v63 = v28;
    }
    else
    {
      double v63 = [(CSSpeechController *)v30 _createAlarmMonitor];
    }
    alarmMonitor = v30->_alarmMonitor;
    v30->_alarmMonitor = v63;

    [(CSSpeechController *)v30 _initializeAlarmState];
    if (v26)
    {
      id v65 = (SOClockTimerObserver *)v26;
    }
    else
    {
      id v65 = [(CSSpeechController *)v30 _createTimerMonitor];
    }
    timerMonitor = v30->_timerMonitor;
    v30->_timerMonitor = v65;

    [(CSSpeechController *)v30 _initializeTimerState];
    uint64_t v67 = [MEMORY[0x1E4F5D4A0] sharedInstance];
    volumeMonitor = v30->_volumeMonitor;
    v30->_volumeMonitor = (CSVolumeMonitor *)v67;

    [(CSVolumeMonitor *)v30->_volumeMonitor addObserver:v30];
  }
  if (v30->_supportHearstVoiceTrigger || CSIsHorseman())
  {
    long long v69 = objc_alloc_init(CSSpeechEndHostTimeEstimator);
    speechEndHostTimeEstimator = v30->_speechEndHostTimeEstimator;
    v30->_speechEndHostTimeEstimator = v69;
  }
  if (v24)
  {
    int v71 = (CSSmartSiriVolumeController *)v24;
LABEL_36:
    volumeController = v30->_volumeController;
    v30->_volumeController = v71;

    [(CSSmartSiriVolumeController *)v30->_volumeController setDelegate:v30];
    goto LABEL_39;
  }
  if ([MEMORY[0x1E4F5D450] supportSmartVolume] && !v30->_endpointId)
  {
    int v71 = objc_alloc_init(CSSmartSiriVolumeController);
    goto LABEL_36;
  }
LABEL_39:
  if (v23)
  {
    __int16 v73 = (CSContinuousVoiceTrigger *)v23;
LABEL_43:
    continuousVoiceTrigger = v30->_continuousVoiceTrigger;
    v30->_continuousVoiceTrigger = v73;

    [(CSContinuousVoiceTrigger *)v30->_continuousVoiceTrigger setDelegate:v30];
    goto LABEL_44;
  }
  if ([MEMORY[0x1E4F5D450] supportContinuousVoiceTrigger])
  {
    __int16 v73 = objc_alloc_init(CSContinuousVoiceTrigger);
    goto LABEL_43;
  }
LABEL_44:
  if ([(CSSpeechController *)v30 _isHubRequestTV])
  {
    v30->_unint64_t decoderProcessedSampleCountForTV = 0;
    uint64_t v75 = [MEMORY[0x1E4F1CA60] dictionary];
    decodersForTV = v30->_decodersForTV;
    v30->_decodersForTV = (NSMutableDictionary *)v75;
  }
  v30->_isAudioSessionActivated = 0;
  if (CSIsCommunalDevice()
    && (![MEMORY[0x1E4F5D450] isAttentiveSiriEnabled] || v30->_endpointId))
  {
    uint64_t v77 = +[CSSpeakerRecognitionAssetDownloadMonitor sharedInstance];
    [v77 addObserver:v30];
  }
  uint64_t v78 = [MEMORY[0x1E4FA5718] sharedInstanceWithEndpointId:v30->_endpointId];
  voiceProfileManager = v30->_voiceProfileManager;
  v30->_voiceProfileManager = (SSRVoiceProfileManager *)v78;

  uint64_t v80 = [MEMORY[0x1E4F5D340] sharedInstance];
  [v80 addObserver:v30];

  v30->_setupStarted = 0;
  if (v22)
  {
    id v81 = (CSXPCClientFactory *)v22;
  }
  else
  {
    id v81 = +[CSXPCClientFactory defaultFactory];
  }
  xpcClientFactory = v30->_xpcClientFactory;
  v30->_xpcClientFactory = v81;

  if (v27)
  {
    uint64_t v83 = (CSAudioSessionController *)v27;
  }
  else
  {
    uint64_t v83 = +[CSAudioSessionController sharedInstance];
  }
  audioSessionController = v30->_audioSessionController;
  v30->_audioSessionController = v83;

  if (v29)
  {
    uint64_t v85 = MEMORY[0x1CB785210](v29);
    id supportsDuckingOnSpeakerOutputEvaluator = v30->_supportsDuckingOnSpeakerOutputEvaluator;
    v30->_id supportsDuckingOnSpeakerOutputEvaluator = (id)v85;
  }
  else
  {
    id supportsDuckingOnSpeakerOutputEvaluator = v30->_supportsDuckingOnSpeakerOutputEvaluator;
    v30->_id supportsDuckingOnSpeakerOutputEvaluator = &__block_literal_global_209;
  }

  v87 = v30->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __325__CSSpeechController_initWithEndpointId_xpcClientFactory_endpointer_continuousVoiceTrigger_siriVolumeController_mediaPlayingMonitor_alarmMonitor_timerMonitor_audioSessionController_supportPhatic_supportHearstVoiceTrigger_supportTriagleModeSessionActivationRetry_supportSessionActivateDelay_supportsDuckingOnSpeakerEvaluator___block_invoke_2;
  block[3] = &unk_1E658D4D8;
  id v94 = v30;
  dispatch_async(v87, block);

LABEL_60:
  return v30;
}

uint64_t __325__CSSpeechController_initWithEndpointId_xpcClientFactory_endpointer_continuousVoiceTrigger_siriVolumeController_mediaPlayingMonitor_alarmMonitor_timerMonitor_audioSessionController_supportPhatic_supportHearstVoiceTrigger_supportTriagleModeSessionActivationRetry_supportSessionActivateDelay_supportsDuckingOnSpeakerEvaluator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startController];
}

uint64_t __325__CSSpeechController_initWithEndpointId_xpcClientFactory_endpointer_continuousVoiceTrigger_siriVolumeController_mediaPlayingMonitor_alarmMonitor_timerMonitor_audioSessionController_supportPhatic_supportHearstVoiceTrigger_supportTriagleModeSessionActivationRetry_supportSessionActivateDelay_supportsDuckingOnSpeakerEvaluator___block_invoke()
{
  return [MEMORY[0x1E4F15510] supportsDuckingOnSpeakerOutput];
}

- (CSSpeechController)initWithEndpointId:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F5D450];
  id v5 = a3;
  char v6 = [v4 supportPhatic];
  char v7 = [MEMORY[0x1E4F5D450] supportHearstVoiceTrigger];
  if (CSIsIOS()) {
    char v8 = CSIsHorseman() ^ 1;
  }
  else {
    char v8 = 0;
  }
  BYTE3(v11) = [MEMORY[0x1E4F5D450] supportSessionActivateDelay];
  BYTE2(v11) = v8;
  BYTE1(v11) = v7;
  LOBYTE(v11) = v6;
  uint64_t v9 = -[CSSpeechController initWithEndpointId:xpcClientFactory:endpointer:continuousVoiceTrigger:siriVolumeController:mediaPlayingMonitor:alarmMonitor:timerMonitor:audioSessionController:supportPhatic:supportHearstVoiceTrigger:supportTriagleModeSessionActivationRetry:supportSessionActivateDelay:supportsDuckingOnSpeakerEvaluator:](self, "initWithEndpointId:xpcClientFactory:endpointer:continuousVoiceTrigger:siriVolumeController:mediaPlayingMonitor:alarmMonitor:timerMonitor:audioSessionController:supportPhatic:supportHearstVoiceTrigger:supportTriagleModeSessionActivationRetry:supportSessionActivateDelay:supportsDuckingOnSpeakerEvaluator:", v5, 0, 0, 0, 0, 0, 0, 0, 0, v11, 0);

  return v9;
}

- (CSSpeechController)init
{
  return [(CSSpeechController *)self initWithEndpointId:0];
}

+ (BOOL)isSmartSiriVolumeAvailable
{
  if (CSIsHorseman()) {
    return 1;
  }
  return CSIsHorsemanJunior();
}

+ (id)sharedController
{
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, &__block_literal_global_8446);
  }
  id v2 = (void *)sharedController_sharedController;
  return v2;
}

uint64_t __38__CSSpeechController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(CSSpeechController);
  uint64_t v1 = (void *)sharedController_sharedController;
  sharedController_sharedController = (uint64_t)v0;

  id v2 = (void *)sharedController_sharedController;
  return [v2 startController];
}

@end