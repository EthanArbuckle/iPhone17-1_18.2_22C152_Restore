@interface CSSiriSpeechRecorder
- (BOOL)_checkAudioLoggingLimits:(id)a3;
- (BOOL)_prepareDirectoryAtPath:(id)a3;
- (BOOL)_prepareSpeechControllerWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)_setAudioContextWithInfo:(id)a3 forReason:(id)a4;
- (BOOL)_shouldEmitInstrumentation;
- (BOOL)_shouldPlaySummonedToneOnTopCapInvocationOnHorseman;
- (BOOL)_shouldPlayTwoShotToneFeedbackOnHorseman;
- (BOOL)_startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (BOOL)_updateAudioContextToPostVoiceForReason:(id)a3;
- (BOOL)_updateAudioContextWithPendingInfoForReason:(id)a3;
- (BOOL)prepareSpeechCaptureWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)startSpeechCaptureWithContext:(id)a3 willStartHandler:(id)a4 error:(id *)a5;
- (BOOL)suppressInterruptionEndedNotifications;
- (CSSiriSpeechRecorder)initWithQueue:(id)a3 speechController:(id)a4 audioSessionController:(id)a5 audioPlaybackService:(id)a6 experimentContext:(id)a7;
- (id)_convertToAFSpeechPackage:(id)a3;
- (id)_currentMHUUID:(BOOL)a3;
- (id)_currentPlaybackRoute;
- (id)_currentRecordDeviceInfo;
- (id)_currentRecordRoute;
- (id)_currentRecordingInfo;
- (id)_currentRtsSessionId:(BOOL)a3;
- (id)_fingerprinter;
- (id)_getFanInfoArray;
- (id)_mhUUIDFromSpeechRequestOptions:(id)a3;
- (id)_recordingInfoForEvent:(int64_t)a3 audioAlertStyle:(int64_t)a4 includeBTInfo:(BOOL)a5 includeRecordDeviceInfo:(BOOL)a6;
- (id)_rtsSessionIdFromSpeechRequestOptions:(id)a3;
- (id)_speechController;
- (id)_speechControllerWithError:(id *)a3;
- (id)_speechRecordingEventListener;
- (id)convertVirtualAudioSubTypeToString:(unsigned int)a3;
- (id)currentVTSatScore;
- (id)fetchAudioDeviceInfo;
- (id)fetchRecordingInfo;
- (id)getAudioRouteInstrumentationWithRecordingInfo:(id)a3;
- (id)recordingInfoForPreheatWithEvent:(int64_t)a3;
- (int)_mapInstrumentationEndpointTypeFromStopRecordingReason:(id)a3;
- (int)convertSISchemaAudioInputRouteToMHRoute:(int)a3 withRecordingInfo:(id)a4;
- (unsigned)_audioDeviceID;
- (unsigned)_audioSessionID;
- (unsigned)fetchAudioSessionID;
- (void)_checkIfLastEndpointHintShouldBeAccepted:(BOOL)a3;
- (void)_clearEndpointHint;
- (void)_enforceEndpointHintWithMitigation:(BOOL)a3;
- (void)_handleFakeTwoShotPromptCallbackWithUUID:(id)a3 timestamp:(double)a4 duration:(double)a5 error:(id)a6;
- (void)_handleFakeTwoShotPromptTimeoutWithUUID:(id)a3;
- (void)_hardEndpointWasDetectedWithMetrics:(id)a3 atTime:(double)a4;
- (void)_logAudioMetrics:(id)a3 mhUUID:(id)a4;
- (void)_logBluetoothStateWithMHUUID:(id)a3;
- (void)_logVoiceTriggerInfo:(id)a3 withMHUUID:(id)a4;
- (void)_performTwoShotPromptForType:(int64_t)a3 withOverride:(int64_t)a4 atTime:(double)a5;
- (void)_playAudioAlert:(int64_t)a3;
- (void)_playPhaticWithCompletion:(id)a3;
- (void)_playStopAlertIfNecessaryForReason:(int64_t)a3 endpointMode:(int64_t)a4 error:(id)a5;
- (void)_reportServerEndpointMetricsIfNeeded;
- (void)_resetSpeechController;
- (void)_setAlertsIfNeeded;
- (void)_setEndpointStyle:(int64_t)a3;
- (void)_setEndpointerOperationMode:(int64_t)a3 forceUpdate:(BOOL)a4;
- (void)_setLanguageDetectorDelegateIfRequired;
- (void)_setSpeechCapturingMode:(int64_t)a3;
- (void)_setupAudioFileWritingForSpeechController:(id)a3 info:(id)a4 context:(id)a5;
- (void)_speechControllerDidReceiveFirstAudioRecordBufferWithHostTime:(unint64_t)a3 atHostTime:(unint64_t)a4 mhUUID:(id)a5;
- (void)_speechControllerDidReceiveLastAudioRecordBuffer:(id)a3 forReason:(int64_t)a4 estimatedSpeechEndHostTime:(unint64_t)a5 isRecordingStopped:(BOOL)a6;
- (void)_speechControllerDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5;
- (void)_speechControllerDidStopRecording:(id)a3 audioDeviceInfo:(id)a4 forReason:(int64_t)a5 estimatedSpeechEndHostTime:(unint64_t)a6 errorCodeOverride:(int64_t)a7 underlyingError:(id)a8;
- (void)_speechControllerRequestsOperation:(unint64_t)a3 forReason:(unint64_t)a4 completion:(id)a5;
- (void)_stopRecordingForEndpointReason:(id)a3 withEndpointMetrics:(id)a4;
- (void)_stopRecordingWithReason:(id)a3 hostTime:(unint64_t)a4;
- (void)_updateAudioContextWithInfo:(id)a3 reason:(id)a4;
- (void)_updateAudioDeviceInfo:(id)a3 forReason:(id)a4 forcesUpdate:(BOOL)a5;
- (void)_updateRecordBufferDuration;
- (void)acousticFingerprinter:(id)a3 hasFingerprint:(id)a4 duration:(double)a5;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4;
- (void)audioSessionController:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4;
- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3;
- (void)dealloc;
- (void)disableSpeechPacketGeneration:(BOOL)a3;
- (void)eagerlyInitializeAudioRecording;
- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5;
- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4;
- (void)enforcePreviousEndpointHint;
- (void)forceSuccessAudioAlertOnStop;
- (void)getLastStartpointTimestampAndCurrentTime:(id)a3;
- (void)languageDetectorDidDetectLanguageWithConfidence:(id)a3 confidence:(id)a4 isConfident:(BOOL)a5;
- (void)performBlockAfterAlerts:(id)a3 timeout:(double)a4;
- (void)playRecordingStartAlert;
- (void)preheatRecognizerWithOption:(id)a3;
- (void)preheatWithOption:(id)a3;
- (void)prepareForMode:(int64_t)a3;
- (void)prepareForMode:(int64_t)a3 withOptions:(id)a4;
- (void)releaseAudioSession;
- (void)setAudioFileHandle:(id)a3;
- (void)setAudioFileType:(int64_t)a3;
- (void)setClientConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEARLanguageDetectorSpeechRequestId:(id)a3;
- (void)setEndpointerDelayedTrigger:(BOOL)a3;
- (void)setEndpointerThreshold:(double)a3;
- (void)setFingerprintWasRecognized;
- (void)setFingerprintingEnabled:(BOOL)a3;
- (void)setHybridUODEnabled:(BOOL)a3;
- (void)setIsDriving:(BOOL)a3;
- (void)setSpeechRecognizedContext:(id)a3;
- (void)setSpeechRecordingEventListeningEndpoint:(id)a3;
- (void)setSpeechRequestOptions:(id)a3;
- (void)setSpeechWasRecognizedForElapsedTime:(double)a3 isFinal:(BOOL)a4;
- (void)setSuppressInterruptionEndedNotifications:(BOOL)a3;
- (void)speakerIdentificationDidDetectSpeakerWithScores:(id)a3;
- (void)speechController:(id)a3 didSetAudioSessionActive:(BOOL)a4;
- (void)speechController:(id)a3 willSetAudioSessionActive:(BOOL)a4;
- (void)speechControllerBeginRecordInterruption:(id)a3 withContext:(id)a4;
- (void)speechControllerDidDeliverLastBuffer:(id)a3 forReason:(int64_t)a4 estimatedSpeechEndHostTime:(unint64_t)a5;
- (void)speechControllerDidDetectVoiceTriggerTwoShot:(id)a3 atTime:(double)a4 wantsAudibleFeedback:(BOOL)a5;
- (void)speechControllerDidFinishAlertPlayback:(id)a3 ofType:(int64_t)a4 error:(id)a5;
- (void)speechControllerDidStartRecording:(id)a3 audioDeviceInfo:(id)a4 successfully:(BOOL)a5 error:(id)a6;
- (void)speechControllerDidStopRecording:(id)a3 audioDeviceInfo:(id)a4 forReason:(int64_t)a5 estimatedSpeechEndHostTime:(unint64_t)a6;
- (void)speechControllerDidUpdateSmartSiriVolume:(id)a3 forReason:(unint64_t)a4;
- (void)speechControllerEndRecordInterruption:(id)a3;
- (void)speechControllerLPCMRecordBufferAvailable:(id)a3 buffer:(id)a4 recordedAt:(unint64_t)a5;
- (void)speechControllerRecordBufferAvailable:(id)a3 buffers:(id)a4 durationInSec:(float)a5 recordedAt:(unint64_t)a6 audioDeviceInfo:(id)a7;
- (void)speechControllerRecordHardwareConfigurationDidChange:(id)a3 toConfiguration:(int64_t)a4;
- (void)speechControllerRequestsOperation:(unint64_t)a3 forReason:(unint64_t)a4;
- (void)speechControllerRequestsOperation:(unint64_t)a3 forReason:(unint64_t)a4 completion:(id)a5;
- (void)stopSpeechCaptureForEvent:(int64_t)a3 suppressAlert:(BOOL)a4 hostTime:(unint64_t)a5;
- (void)suppressUtteranceGradingIfRequired;
- (void)suspendAutomaticEndpointingInRange:(AFTimeRange)a3;
- (void)updateASRFeatures:(id)a3;
- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5;
- (void)updateSpeechSynthesisRecord:(id)a3;
@end

@implementation CSSiriSpeechRecorder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mhUUID, 0);
  objc_storeStrong((id *)&self->_experimentContext, 0);
  objc_storeStrong((id *)&self->_bluetoothWirelessSplitterSessionStateObserver, 0);
  objc_storeStrong((id *)&self->_numberOfAVVCAlertPlaybacksByType, 0);
  objc_storeStrong((id *)&self->_alertPlaybackGroup, 0);
  objc_storeStrong((id *)&self->_currentClientConfiguration, 0);
  objc_storeStrong((id *)&self->_mostRecentSpeechSynthesisRecord, 0);
  objc_storeStrong((id *)&self->_lastEndpointHintRC, 0);
  objc_storeStrong(&self->_lastEndpointHintCompletion, 0);
  objc_storeStrong((id *)&self->_lastEndpointHintFeatures, 0);
  objc_storeStrong((id *)&self->_endpointDelayReporter, 0);
  objc_storeStrong((id *)&self->_lastEndpointerMetrics, 0);
  objc_storeStrong((id *)&self->_fakeTwoShotTTSPromptWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_speechRecordingEventListenerConnection, 0);
  objc_storeStrong((id *)&self->_recordDevice, 0);
  objc_storeStrong((id *)&self->_recordingWillStartGroup, 0);
  objc_storeStrong((id *)&self->_speechRecognizedContextForServerEndpointInstrumentation, 0);
  objc_storeStrong((id *)&self->_fakeTwoShotTTSPromptUUID, 0);
  objc_storeStrong((id *)&self->_audioFileWriter, 0);
  objc_storeStrong((id *)&self->_audioFileHandle, 0);
  objc_storeStrong((id *)&self->_fingerprinter, 0);
  objc_storeStrong((id *)&self->_currentAudioDeviceInfo, 0);
  objc_storeStrong((id *)&self->_pendingActivationInfo, 0);
  objc_storeStrong((id *)&self->_currentActivationInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_endpointAnalyzer, 0);
  objc_storeStrong((id *)&self->_extendedEndpointTimer, 0);
  objc_storeStrong((id *)&self->_audioPlaybackService, 0);
  objc_storeStrong((id *)&self->_audioSessionController, 0);
  objc_storeStrong((id *)&self->_speechController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

- (void)setSuppressInterruptionEndedNotifications:(BOOL)a3
{
  self->_suppressInterruptionEndedNotifications = a3;
}

- (BOOL)suppressInterruptionEndedNotifications
{
  return self->_suppressInterruptionEndedNotifications;
}

- (unsigned)_audioDeviceID
{
  return 0;
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerResetNotification:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    v7 = "-[CSSiriSpeechRecorder audioSessionController:didReceiveAudioSessionOwnerResetNotification:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s userInfo = %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionOwnerLostNotification:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSSiriSpeechRecorder audioSessionController:didReceiveAudioSessionOwnerLostNotification:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionOwnerLostNotification___block_invoke;
  v9[3] = &unk_1E658D4B0;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

uint64_t __91__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionOwnerLostNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) speechCapturing:*(void *)(a1 + 32) didLoseAudioSessionOwnerOrMediaServices:*(void *)(a1 + 40)];
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    v7 = "-[CSSiriSpeechRecorder audioSessionController:didReceiveAudioSessionMediaServicesWereResetNotificationWithUserInfo:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s userInfo = %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSSiriSpeechRecorder audioSessionController:didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __115__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo___block_invoke;
  v9[3] = &unk_1E658D4B0;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

uint64_t __115__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionMediaServicesWereLostNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) speechCapturing:*(void *)(a1 + 32) didLoseAudioSessionOwnerOrMediaServices:*(void *)(a1 + 40)];
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionRouteChangeNotificationWithUserInfo:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    v7 = "-[CSSiriSpeechRecorder audioSessionController:didReceiveAudioSessionRouteChangeNotificationWithUserInfo:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s userInfo = %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)audioSessionController:(id)a3 didReceiveAudioSessionInterruptionNotificationWithUserInfo:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[CSSiriSpeechRecorder audioSessionController:didReceiveAudioSessionInterruptionNotificationWithUserInfo:]";
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s userInfo = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __106__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke;
  v9[3] = &unk_1E658D4B0;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(queue, v9);
}

void __106__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) speechCapturing:*(void *)(a1 + 32) didInterruptAudioSession:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 32) _currentMHUUID:0];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __106__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_2;
  v6[3] = &unk_1E658C758;
  v6[4] = v3;
  id v7 = v2;
  id v5 = v2;
  [v4 fetchAudioMetricsWithCompletion:v6];
}

void __106__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __106__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_3;
  block[3] = &unk_1E658D3F0;
  block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __106__CSSiriSpeechRecorder_audioSessionController_didReceiveAudioSessionInterruptionNotificationWithUserInfo___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logAudioMetrics:*(void *)(a1 + 40) mhUUID:*(void *)(a1 + 48)];
}

- (void)speakerIdentificationDidDetectSpeakerWithScores:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v33 = "-[CSSiriSpeechRecorder speakerIdentificationDidDetectSpeakerWithScores:]";
    __int16 v34 = 2113;
    id v35 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s scores = %{private}@", buf, 0x16u);
  }
  id v6 = [v4 objectForKey:@"spIdAudioProcessedDuration"];
  uint64_t v22 = [v6 integerValue];

  id v7 = [v4 objectForKey:@"spIdUnknownUserScore"];
  uint64_t v8 = [v7 integerValue];

  id v9 = [v4 objectForKey:@"spIdKnownUserScores"];
  id v10 = [v4 objectForKey:@"spIdUserScoresVersion"];
  uint64_t v11 = [v10 integerValue];

  v12 = [v4 objectForKey:@"spIdScoreThresholdingType"];
  __int16 v13 = [v4 objectForKey:@"spIdAssetVersion"];
  id v14 = [v4 objectForKey:@"userIdentityClassification"];
  uint64_t v15 = [v14 unsignedIntValue];

  v16 = [v4 objectForKey:@"userClassified"];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__CSSiriSpeechRecorder_speakerIdentificationDidDetectSpeakerWithScores___block_invoke;
  block[3] = &unk_1E658CB80;
  block[4] = self;
  id v24 = v9;
  uint64_t v29 = v8;
  uint64_t v30 = v22;
  uint64_t v31 = v11;
  id v25 = v16;
  id v26 = v12;
  id v27 = v13;
  uint64_t v28 = v15;
  id v18 = v13;
  id v19 = v12;
  id v20 = v16;
  id v21 = v9;
  dispatch_async(queue, block);
}

uint64_t __72__CSSiriSpeechRecorder_speakerIdentificationDidDetectSpeakerWithScores___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 8) speechCapturingDidProvideConfidenceScores:a1[5] classification:a1[9] classifiedUser:a1[6] unknownUserScore:a1[10] duration:a1[11] version:a1[12] thresholdingType:a1[7] assetVersion:a1[8]];
}

- (BOOL)_startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    id v10 = self->_alertPlaybackGroup;
    if (!v10)
    {
      id v10 = (OS_dispatch_group *)dispatch_group_create();
      objc_storeStrong((id *)&self->_alertPlaybackGroup, v10);
    }
    dispatch_group_enter((dispatch_group_t)v10);
    uint64_t v11 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[CSSiriSpeechRecorder _startAudioPlaybackRequest:options:completion:]";
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_INFO, "%s Starting audio playback request %@...", buf, 0x16u);
    }
    v12 = self->_context;
    audioPlaybackService = self->_audioPlaybackService;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__CSSiriSpeechRecorder__startAudioPlaybackRequest_options_completion___block_invoke;
    v17[3] = &unk_1E658CB18;
    id v18 = v8;
    id v19 = v12;
    id v20 = v10;
    id v21 = self;
    id v22 = v9;
    id v14 = v10;
    uint64_t v15 = v12;
    [(CSSiriAudioPlaybackService *)audioPlaybackService startRequest:v18 options:a4 completion:v17];
  }
  return v8 != 0;
}

void __70__CSSiriSpeechRecorder__startAudioPlaybackRequest_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *MEMORY[0x1E4F4E380];
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      __int16 v13 = "-[CSSiriSpeechRecorder _startAudioPlaybackRequest:options:completion:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      id v17 = v3;
      _os_log_error_impl(&dword_1C9338000, v4, OS_LOG_TYPE_ERROR, "%s Failed audio playback request %@ due to error %@.", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      __int16 v13 = "-[CSSiriSpeechRecorder _startAudioPlaybackRequest:options:completion:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s Stopped audio playback request %@.", buf, 0x16u);
    }
    [*(id *)(a1 + 40) instrumentSiriCue:1];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  id v7 = *(void **)(a1 + 64);
  if (v7)
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 56) + 16);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__CSSiriSpeechRecorder__startAudioPlaybackRequest_options_completion___block_invoke_253;
    v9[3] = &unk_1E658D3A0;
    id v11 = v7;
    id v10 = v3;
    dispatch_async(v8, v9);
  }
}

uint64_t __70__CSSiriSpeechRecorder__startAudioPlaybackRequest_options_completion___block_invoke_253(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)acousticFingerprinter:(id)a3 hasFingerprint:(id)a4 duration:(double)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[CSSiriSpeechRecorder acousticFingerprinter:hasFingerprint:duration:]";
    __int16 v16 = 2048;
    double v17 = a5;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s duration %lf", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__CSSiriSpeechRecorder_acousticFingerprinter_hasFingerprint_duration___block_invoke;
  block[3] = &unk_1E658CEC8;
  block[4] = self;
  id v12 = v7;
  double v13 = a5;
  id v10 = v7;
  dispatch_async(queue, block);
}

uint64_t __70__CSSiriSpeechRecorder_acousticFingerprinter_hasFingerprint_duration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "speechCapturing:didReceiveFingerprint:duration:", *(double *)(a1 + 48));
}

- (void)setEARLanguageDetectorSpeechRequestId:(id)a3
{
}

- (void)performBlockAfterAlerts:(id)a3 timeout:(double)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    id v7 = (os_log_t *)MEMORY[0x1E4F4E380];
    id v8 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecorder performBlockAfterAlerts:timeout:]";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = a4;
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s timeout = %f", buf, 0x16u);
    }
    if (self->_alertPlaybackGroup)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      uint64_t v28 = __Block_byref_object_copy__25501;
      uint64_t v29 = __Block_byref_object_dispose__25502;
      id v30 = 0;
      id v9 = objc_alloc(MEMORY[0x1E4F4E558]);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __56__CSSiriSpeechRecorder_performBlockAfterAlerts_timeout___block_invoke;
      v24[3] = &unk_1E658CAF0;
      id v26 = buf;
      id v25 = v6;
      id v10 = (void *)[v9 initWithBlock:v24];
      if (a4 > 0.0)
      {
        id v11 = objc_alloc(MEMORY[0x1E4F4E688]);
        queue = self->_queue;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __56__CSSiriSpeechRecorder_performBlockAfterAlerts_timeout___block_invoke_252;
        v22[3] = &unk_1E658D4D8;
        id v23 = v10;
        uint64_t v13 = [v11 initWithTimeoutInterval:queue onQueue:v22 timeoutHandler:a4];
        __int16 v14 = *(void **)(*(void *)&buf[8] + 40);
        *(void *)(*(void *)&buf[8] + 40) = v13;

        [*(id *)(*(void *)&buf[8] + 40) start];
      }
      alertPlaybackGroup = self->_alertPlaybackGroup;
      __int16 v16 = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__CSSiriSpeechRecorder_performBlockAfterAlerts_timeout___block_invoke_2;
      block[3] = &unk_1E658D438;
      id v20 = v10;
      id v21 = buf;
      id v17 = v10;
      dispatch_group_notify(alertPlaybackGroup, v16, block);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      uint64_t v18 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecorder performBlockAfterAlerts:timeout:]";
        _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_INFO, "%s Done", buf, 0xCu);
      }
      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

void __56__CSSiriSpeechRecorder_performBlockAfterAlerts_timeout___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v4)
  {
    [v4 cancel];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
  id v7 = *MEMORY[0x1E4F4E380];
  id v8 = *MEMORY[0x1E4F4E380];
  if (a2 == -2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315138;
      id v12 = "-[CSSiriSpeechRecorder performBlockAfterAlerts:timeout:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s Watchdog timer timed out.", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = [MEMORY[0x1E4F4E478] errorWithCode:224];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[CSSiriSpeechRecorder performBlockAfterAlerts:timeout:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s Done", (uint8_t *)&v11, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __56__CSSiriSpeechRecorder_performBlockAfterAlerts_timeout___block_invoke_252(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithSignal:-2];
}

uint64_t __56__CSSiriSpeechRecorder_performBlockAfterAlerts_timeout___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2)
  {
    [v2 cancel];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = 0;
  }
  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 invokeWithSignal:0];
}

- (void)setSpeechRecognizedContext:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (self->_didDetectEndpoint && self->_lastEndpointerMetrics)
  {
    -[CSEndpointDelayReporter setSpeechRecognizedContext:withEndpointerMetrics:](self->_endpointDelayReporter, "setSpeechRecognizedContext:withEndpointerMetrics:", v5);
    [(CSEndpointDelayReporter *)self->_endpointDelayReporter reportEndpointDelayIfNeed];
  }
  else
  {
    objc_storeStrong((id *)&self->_speechRecognizedContextForServerEndpointInstrumentation, a3);
    [(CSSiriSpeechRecorder *)self _reportServerEndpointMetricsIfNeeded];
  }
}

- (void)setEndpointerDelayedTrigger:(BOOL)a3
{
}

- (void)setEndpointerThreshold:(double)a3
{
  *(float *)&a3 = a3;
  [(CSSpeechController *)self->_speechController updateEndpointerThreshold:a3];
}

- (void)enforcePreviousEndpointHint
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  self->_serverDidEndpoint = 1;
  lastEndpointHintRC = self->_lastEndpointHintRC;
  if (lastEndpointHintRC)
  {
    if (self->_lastEndpointHintRCProcessedForMitigation)
    {
      id v4 = [(SASResultCandidate *)lastEndpointHintRC resultId];
      uint64_t v5 = [v4 integerValue];

      id v6 = [(SASResultCandidate *)self->_lastEndpointHintRC refId];
      speechController = self->_speechController;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __51__CSSiriSpeechRecorder_enforcePreviousEndpointHint__block_invoke;
      v10[3] = &unk_1E658C8E8;
      v10[4] = self;
      [(CSSpeechController *)speechController getMitigationDecisionForRCId:v5 requestId:v6 completion:v10];
    }
    else
    {
      uint64_t v9 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        id v12 = "-[CSSiriSpeechRecorder enforcePreviousEndpointHint]";
        _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s Processing RC for mitigation, force accept", buf, 0xCu);
      }
      [(CSSiriSpeechRecorder *)self _checkIfLastEndpointHintShouldBeAccepted:1];
    }
  }
  else
  {
    id v8 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[CSSiriSpeechRecorder enforcePreviousEndpointHint]";
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s Got an enforce message without a current RC. Stop Recording", buf, 0xCu);
    }
    [(CSSiriSpeechRecorder *)self _enforceEndpointHintWithMitigation:0];
  }
}

void __51__CSSiriSpeechRecorder_enforcePreviousEndpointHint__block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__CSSiriSpeechRecorder_enforcePreviousEndpointHint__block_invoke_2;
  v4[3] = &unk_1E658C870;
  v4[4] = v2;
  char v5 = a2;
  dispatch_async(v3, v4);
}

uint64_t __51__CSSiriSpeechRecorder_enforcePreviousEndpointHint__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enforceEndpointHintWithMitigation:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_enforceEndpointHintWithMitigation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(CSSiriSpeechRecorder *)self _stopRecordingForEndpointReason:4 withEndpointMetrics:0];
  lastEndpointHintCompletion = (void (**)(id, uint64_t, BOOL, NSArray *))self->_lastEndpointHintCompletion;
  if (lastEndpointHintCompletion)
  {
    lastEndpointHintCompletion[2](lastEndpointHintCompletion, 1, v3, self->_lastEndpointHintFeatures);
    id v6 = self->_lastEndpointHintCompletion;
    self->_lastEndpointHintCompletion = 0;

    id v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[CSSiriSpeechRecorder _enforceEndpointHintWithMitigation:]";
      id v8 = "%s Enforce previous endpointHint";
LABEL_6:
      _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    id v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[CSSiriSpeechRecorder _enforceEndpointHintWithMitigation:]";
      id v8 = "%s Got an enforce message without a current completion. Ignoring";
      goto LABEL_6;
    }
  }
  lastEndpointHintRC = self->_lastEndpointHintRC;
  self->_lastEndpointHintRC = 0;

  self->_lastEndpointHintRCProcessedForMitigation = 0;
  lastEndpointHintFeatures = self->_lastEndpointHintFeatures;
  self->_lastEndpointHintFeatures = 0;
}

- (void)_clearEndpointHint
{
  id lastEndpointHintCompletion = self->_lastEndpointHintCompletion;
  if (lastEndpointHintCompletion)
  {
    (*((void (**)(id, void, void, void))lastEndpointHintCompletion + 2))(lastEndpointHintCompletion, 0, 0, 0);
    id v4 = self->_lastEndpointHintCompletion;
    self->_id lastEndpointHintCompletion = 0;
  }
  lastEndpointHintRC = self->_lastEndpointHintRC;
  self->_lastEndpointHintRC = 0;

  self->_lastEndpointHintRCProcessedForMitigation = 0;
  lastEndpointHintFeatures = self->_lastEndpointHintFeatures;
  self->_lastEndpointHintFeatures = 0;
}

- (void)_checkIfLastEndpointHintShouldBeAccepted:(BOOL)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  lastEndpointHintRC = self->_lastEndpointHintRC;
  if (lastEndpointHintRC)
  {
    BOOL v5 = a3;
    id v6 = [(SASResultCandidate *)lastEndpointHintRC processedAudioDuration];
    [v6 doubleValue];
    double v8 = v7;

    if (v8 > 0.0)
    {
      uint64_t v9 = [(CSSiriSpeechRecorder *)self _convertToAFSpeechPackage:self->_lastEndpointHintRC];
      id v10 = [(SASResultCandidate *)self->_lastEndpointHintRC resultId];
      uint64_t v11 = [v10 integerValue];

      id v12 = [(SASResultCandidate *)self->_lastEndpointHintRC speechRecognitionTask];
      uint64_t v13 = [(SASResultCandidate *)self->_lastEndpointHintRC refId];
      __int16 v14 = [(SASResultCandidate *)self->_lastEndpointHintRC latticeRnnMitigatorIsProcessed];
      int v15 = [v14 BOOLValue];

      __int16 v16 = [v9 latticeMitigatorResult];
      [v16 score];
      float v18 = v17;

      id v19 = [v9 latticeMitigatorResult];
      [v19 threshold];
      float v21 = v20;

      id v22 = [v9 latticeMitigatorResult];
      [v22 calibrationScale];
      float v24 = v23;

      id v25 = [v9 latticeMitigatorResult];
      [v25 calibrationOffset];
      float v27 = v26;

      uint64_t v28 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136317442;
        v32 = "-[CSSiriSpeechRecorder _checkIfLastEndpointHintShouldBeAccepted:]";
        __int16 v33 = 2048;
        uint64_t v34 = v11;
        __int16 v35 = 2112;
        uint64_t v36 = v13;
        __int16 v37 = 2048;
        double v38 = v8;
        __int16 v39 = 1024;
        int v40 = v15;
        __int16 v41 = 2048;
        double v42 = v18;
        __int16 v43 = 2048;
        double v44 = v21;
        __int16 v45 = 2048;
        double v46 = v24;
        __int16 v47 = 2048;
        double v48 = v27;
        __int16 v49 = 2112;
        v50 = v12;
        _os_log_impl(&dword_1C9338000, v28, OS_LOG_TYPE_INFO, "%s rcID: %lu, requestId: %@, duration: %lf, lrnnProcessed:%d lrnnScore: %f, lrnnThreshold: %f, calibrationScale: %f, calibrationOffset: %f, taskId: %@", buf, 0x62u);
      }
      speechController = self->_speechController;
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __65__CSSiriSpeechRecorder__checkIfLastEndpointHintShouldBeAccepted___block_invoke;
      v30[3] = &unk_1E658CAC8;
      v30[4] = self;
      *(double *)&v30[5] = v8;
      [(CSSpeechController *)speechController processRCWithId:v11 requestId:v13 speechPackage:v9 taskId:v12 forceAccept:v5 completionHandler:v30];
    }
  }
}

void __65__CSSiriSpeechRecorder__checkIfLastEndpointHintShouldBeAccepted___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(NSObject **)(v8 + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__CSSiriSpeechRecorder__checkIfLastEndpointHintShouldBeAccepted___block_invoke_2;
  v11[3] = &unk_1E658CAA0;
  char v14 = a2;
  char v15 = a3;
  uint64_t v13 = *(void *)(a1 + 40);
  v11[4] = v8;
  id v12 = v7;
  id v10 = v7;
  dispatch_async(v9, v11);
}

void __65__CSSiriSpeechRecorder__checkIfLastEndpointHintShouldBeAccepted___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    int v4 = *(unsigned __int8 *)(a1 + 57);
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = *(void **)(*(void *)(a1 + 32) + 432);
    id v7 = v2;
    uint64_t v8 = [v6 processedAudioDuration];
    [v8 doubleValue];
    int v14 = 136316162;
    char v15 = "-[CSSiriSpeechRecorder _checkIfLastEndpointHintShouldBeAccepted:]_block_invoke_2";
    __int16 v16 = 1024;
    int v17 = v3;
    __int16 v18 = 1024;
    int v19 = v4;
    __int16 v20 = 2048;
    uint64_t v21 = v5;
    __int16 v22 = 2048;
    uint64_t v23 = v9;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s Eager results - shouldAccept: %d, isMitigated: %d Duration: %lf last duration: %lf", (uint8_t *)&v14, 0x2Cu);
  }
  double v10 = *(double *)(a1 + 48);
  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 432) processedAudioDuration];
  [v11 doubleValue];
  double v13 = v12;

  if (v10 == v13)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 416), *(id *)(a1 + 40));
    *(unsigned char *)(*(void *)(a1 + 32) + 440) = 1;
    if (*(unsigned char *)(a1 + 56)) {
      [*(id *)(a1 + 32) _enforceEndpointHintWithMitigation:*(unsigned __int8 *)(a1 + 57)];
    }
  }
}

- (void)updateEndpointHintForRC:(id)a3 forceAccept:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  [(CSSiriSpeechRecorder *)self _clearEndpointHint];
  uint64_t v11 = (os_log_t *)MEMORY[0x1E4F4E380];
  double v12 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    double v13 = v12;
    int v14 = [v9 processedAudioDuration];
    [v14 doubleValue];
    int v19 = 136315394;
    __int16 v20 = "-[CSSiriSpeechRecorder updateEndpointHintForRC:forceAccept:completion:]";
    __int16 v21 = 2048;
    uint64_t v22 = v15;
    _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_INFO, "%s duration = %lf", (uint8_t *)&v19, 0x16u);
  }
  objc_storeStrong((id *)&self->_lastEndpointHintRC, a3);
  __int16 v16 = (void *)MEMORY[0x1CB785210](v10);

  id lastEndpointHintCompletion = self->_lastEndpointHintCompletion;
  self->_id lastEndpointHintCompletion = v16;

  if (self->_didDetectEndpoint && (unint64_t)(self->_endpointerOperationMode - 3) < 2
    || self->_serverDidEndpoint)
  {
    [(CSSiriSpeechRecorder *)self _checkIfLastEndpointHintShouldBeAccepted:v6];
  }
  else
  {
    __int16 v18 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315138;
      __int16 v20 = "-[CSSiriSpeechRecorder updateEndpointHintForRC:forceAccept:completion:]";
      _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_INFO, "%s No endpoint yet, waiting", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (id)_convertToAFSpeechPackage:(id)a3
{
  id v3 = a3;
  int v4 = [v3 recognition];
  uint64_t v5 = objc_msgSend(v4, "af_speechPhrases");
  BOOL v6 = objc_msgSend(v4, "af_speechUtterances");
  id v7 = objc_alloc(MEMORY[0x1E4F4E618]);
  uint64_t v8 = [v3 processedAudioDuration];
  [v8 doubleValue];
  id v9 = objc_msgSend(v7, "initWithPhrases:utterances:processedAudioDuration:", v5, v6);

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F4E5E0]) initWithSpeechRecognitionFeatures:0 acousticFeatures:0 snr:1.0];
  uint64_t v11 = [v3 latticeRnnMitigatorIsProcessed];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x1E4F4E600]);
    double v13 = [v3 latticeRnnMitigatorModelId];
    [v3 latticeRnnMitigatorScore];
    float v15 = v14;
    [v3 latticeRnnMitigatorThreshold];
    *(float *)&double v17 = v16;
    *(float *)&double v16 = v15;
    uint64_t v11 = (void *)[v12 initWithResults:v13 score:v16 threshold:v17];
  }
  __int16 v18 = (void *)[objc_alloc(MEMORY[0x1E4F4E608]) initWithRecognition:v9 rawRecognition:v9 audioAnalytics:v10 isFinal:1 utteranceStart:v11 latticeMitigatorResult:0.0];

  return v18;
}

- (void)_handleFakeTwoShotPromptCallbackWithUUID:(id)a3 timestamp:(double)a4 duration:(double)a5 error:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  int v12 = [(NSUUID *)self->_fakeTwoShotTTSPromptUUID isEqual:v10];
  double v13 = *MEMORY[0x1E4F4E380];
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v17 = 136315906;
      __int16 v18 = "-[CSSiriSpeechRecorder _handleFakeTwoShotPromptCallbackWithUUID:timestamp:duration:error:]";
      __int16 v19 = 2048;
      double v20 = a4;
      __int16 v21 = 2048;
      double v22 = a5;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_INFO, "%s Fake two shot TTS prompt called back (timestamp = %f, duration = %f, error = %@)", (uint8_t *)&v17, 0x2Au);
    }
    [(CSEndpointAnalyzer *)self->_endpointAnalyzer reset];
    [(CSEndpointAnalyzer *)self->_endpointAnalyzer setStartWaitTime:5.0];
    [(AFWatchdogTimer *)self->_fakeTwoShotTTSPromptWatchdogTimer cancel];
    fakeTwoShotTTSPromptWatchdogTimer = self->_fakeTwoShotTTSPromptWatchdogTimer;
    self->_fakeTwoShotTTSPromptWatchdogTimer = 0;

    fakeTwoShotTTSPromptUUID = self->_fakeTwoShotTTSPromptUUID;
    self->_fakeTwoShotTTSPromptUUID = 0;
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    double v16 = self->_fakeTwoShotTTSPromptUUID;
    int v17 = 136315650;
    __int16 v18 = "-[CSSiriSpeechRecorder _handleFakeTwoShotPromptCallbackWithUUID:timestamp:duration:error:]";
    __int16 v19 = 2112;
    double v20 = *(double *)&v10;
    __int16 v21 = 2112;
    double v22 = *(double *)&v16;
    _os_log_error_impl(&dword_1C9338000, v13, OS_LOG_TYPE_ERROR, "%s Fake two shot TTS prompt callback is not handled due to context mismatch (fakeTwoShotPromptUUID = %@, _fakeTwoShotPromptUUID = %@).", (uint8_t *)&v17, 0x20u);
  }
}

- (void)_handleFakeTwoShotPromptTimeoutWithUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v4 = (NSUUID *)a3;
  int v5 = [(NSUUID *)self->_fakeTwoShotTTSPromptUUID isEqual:v4];
  BOOL v6 = *MEMORY[0x1E4F4E380];
  BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v7)
    {
      fakeTwoShotTTSPromptUUID = self->_fakeTwoShotTTSPromptUUID;
      int v12 = 136315394;
      double v13 = "-[CSSiriSpeechRecorder _handleFakeTwoShotPromptTimeoutWithUUID:]";
      __int16 v14 = 2112;
      float v15 = fakeTwoShotTTSPromptUUID;
      _os_log_error_impl(&dword_1C9338000, v6, OS_LOG_TYPE_ERROR, "%s Fake two shot TTS prompt timed out (%@).", (uint8_t *)&v12, 0x16u);
    }
    [(AFWatchdogTimer *)self->_fakeTwoShotTTSPromptWatchdogTimer cancel];
    fakeTwoShotTTSPromptWatchdogTimer = self->_fakeTwoShotTTSPromptWatchdogTimer;
    self->_fakeTwoShotTTSPromptWatchdogTimer = 0;

    id v9 = self->_fakeTwoShotTTSPromptUUID;
    self->_fakeTwoShotTTSPromptUUID = 0;
  }
  else if (v7)
  {
    id v11 = self->_fakeTwoShotTTSPromptUUID;
    int v12 = 136315650;
    double v13 = "-[CSSiriSpeechRecorder _handleFakeTwoShotPromptTimeoutWithUUID:]";
    __int16 v14 = 2112;
    float v15 = v4;
    __int16 v16 = 2112;
    int v17 = v11;
    _os_log_error_impl(&dword_1C9338000, v6, OS_LOG_TYPE_ERROR, "%s Fake two shot TTS prompt timeout is not handled due to context mismatch (fakeTwoShotPromptUUID = %@, _fakeTwoShotPromptUUID = %@).", (uint8_t *)&v12, 0x20u);
  }
}

- (void)_playPhaticWithCompletion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v14 = "-[CSSiriSpeechRecorder _playPhaticWithCompletion:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  BOOL v6 = self->_delegate;
  if (v6)
  {
    BOOL v7 = self->_context;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__CSSiriSpeechRecorder__playPhaticWithCompletion___block_invoke;
    v9[3] = &unk_1E658CA78;
    id v10 = v7;
    id v11 = self;
    id v12 = v4;
    uint64_t v8 = v7;
    [(CSSiriSpeechCapturingDelegate *)v6 speechCapturing:self performTwoShotPromptWithType:2 completion:v9];

LABEL_7:
    goto LABEL_8;
  }
  if (v4)
  {
    uint64_t v8 = [MEMORY[0x1E4F4E478] errorWithCode:15 description:@"delegate is nil" underlyingError:0];
    (*((void (**)(id, CSSiriSpeechRecordingContext *, double, double))v4 + 2))(v4, v8, 0.0, 0.0);
    goto LABEL_7;
  }
LABEL_8:
}

void __50__CSSiriSpeechRecorder__playPhaticWithCompletion___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = *MEMORY[0x1E4F4E380];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v17 = "-[CSSiriSpeechRecorder _playPhaticWithCompletion:]_block_invoke";
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v17 = "-[CSSiriSpeechRecorder _playPhaticWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s done", buf, 0xCu);
    }
    [*(id *)(a1 + 32) instrumentSiriCue:2];
  }
  id v9 = *(void **)(a1 + 48);
  if (v9)
  {
    id v10 = *(NSObject **)(*(void *)(a1 + 40) + 16);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__CSSiriSpeechRecorder__playPhaticWithCompletion___block_invoke_242;
    v11[3] = &unk_1E658CA50;
    id v13 = v9;
    double v14 = a3;
    double v15 = a4;
    id v12 = v7;
    dispatch_async(v10, v11);
  }
}

uint64_t __50__CSSiriSpeechRecorder__playPhaticWithCompletion___block_invoke_242(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

- (void)_performTwoShotPromptForType:(int64_t)a3 withOverride:(int64_t)a4 atTime:(double)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v9 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v10 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v58 = "-[CSSiriSpeechRecorder _performTwoShotPromptForType:withOverride:atTime:]";
    __int16 v59 = 2048;
    int64_t v60 = a3;
    __int16 v61 = 2048;
    double v62 = a5;
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s promptType = %ld, time = %f", buf, 0x20u);
  }
  self->_didFakeTwoShotWithAlert = 1;
  self->_twoShotStartTime = a5;
  id v11 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
  if (a3)
  {
    if (a3 == 2)
    {
      [(CSEndpointAnalyzer *)self->_endpointAnalyzer setSaveSamplesSeenInReset:1];
      int v17 = [MEMORY[0x1E4F5D308] sharedLogger];
      [v17 logTwoShotStartEventWithPromptType:2 withMHUUID:v11];

      __int16 v18 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
      v53 = @"type";
      id v19 = [NSNumber numberWithInteger:2];
      v54 = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      [v18 logEventWithType:239 context:v20];

      __int16 v21 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
      fakeTwoShotTTSPromptUUID = self->_fakeTwoShotTTSPromptUUID;
      self->_fakeTwoShotTTSPromptUUID = v21;

      fakeTwoShotTTSPromptWatchdogTimer = self->_fakeTwoShotTTSPromptWatchdogTimer;
      if (fakeTwoShotTTSPromptWatchdogTimer) {
        [(AFWatchdogTimer *)fakeTwoShotTTSPromptWatchdogTimer cancel];
      }
      objc_initWeak((id *)buf, self);
      id v24 = self->_fakeTwoShotTTSPromptUUID;
      id v25 = objc_alloc(MEMORY[0x1E4F4E688]);
      queue = self->_queue;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __73__CSSiriSpeechRecorder__performTwoShotPromptForType_withOverride_atTime___block_invoke_2;
      v48[3] = &unk_1E658CA00;
      id v27 = v11;
      id v49 = v27;
      objc_copyWeak(&v51, (id *)buf);
      uint64_t v28 = v24;
      v50 = v28;
      uint64_t v29 = (AFWatchdogTimer *)[v25 initWithTimeoutInterval:queue onQueue:v48 timeoutHandler:4.0];
      id v30 = self->_fakeTwoShotTTSPromptWatchdogTimer;
      self->_fakeTwoShotTTSPromptWatchdogTimer = v29;

      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __73__CSSiriSpeechRecorder__performTwoShotPromptForType_withOverride_atTime___block_invoke_241;
      v42[3] = &unk_1E658CA28;
      id v43 = v27;
      double v44 = self;
      uint64_t v31 = v28;
      __int16 v45 = v31;
      int64_t v46 = a4;
      double v47 = a5;
      [(CSSiriSpeechRecorder *)self _playPhaticWithCompletion:v42];

      objc_destroyWeak(&v51);
      objc_destroyWeak((id *)buf);
    }
    else if (a3 == 1)
    {
      [(CSEndpointAnalyzer *)self->_endpointAnalyzer setSaveSamplesSeenInReset:1];
      id v12 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
      v55 = @"type";
      id v13 = [NSNumber numberWithInteger:1];
      v56 = v13;
      double v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
      [v12 logEventWithType:239 context:v14];

      double v15 = [MEMORY[0x1E4F5D308] sharedLogger];
      [v15 logTwoShotStartEventWithPromptType:1 withMHUUID:v11];

      if (AFIsHorseman()) {
        int v16 = ![(CSSiriSpeechRecorder *)self _shouldPlayTwoShotToneFeedbackOnHorseman];
      }
      else {
        int v16 = 0;
      }
      uint64_t v34 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v58 = "-[CSSiriSpeechRecorder _performTwoShotPromptForType:withOverride:atTime:]";
        __int16 v59 = 1024;
        LODWORD(v60) = v16;
        _os_log_impl(&dword_1C9338000, v34, OS_LOG_TYPE_INFO, "%s suppressesTwoShotAlert = %d", buf, 0x12u);
      }
      if (v16)
      {
        __int16 v35 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
        [v35 logEventWithType:240 context:&unk_1F23C5748];

        uint64_t v36 = [MEMORY[0x1E4F5D308] sharedLogger];
        [v36 logTwoShotEndEventWithSuppresedAlert:1 withTimedOut:0 withMHUUID:v11];
      }
      else
      {
        __int16 v37 = [(AFClientConfiguration *)self->_currentClientConfiguration twoShotAudioPlaybackRequest];
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __73__CSSiriSpeechRecorder__performTwoShotPromptForType_withOverride_atTime___block_invoke;
        v52[3] = &unk_1E658C9D8;
        v52[4] = self;
        int v38 = [(CSSiriSpeechRecorder *)self _startAudioPlaybackRequest:v37 options:3 completion:v52];

        if ((v38 & 1) == 0)
        {
          [(CSSpeechController *)self->_speechController playRecordStartingAlertAndResetEndpointerWithAlertOverride:a4];
          [(CSEndpointAnalyzer *)self->_endpointAnalyzer setStartWaitTime:5.0];
          __int16 v39 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
          [v39 logEventWithType:240 context:0];

          int v40 = [MEMORY[0x1E4F5D308] sharedLogger];
          [v40 logTwoShotEndEventWithSuppresedAlert:0 withTimedOut:1 withMHUUID:v11];
        }
        self->_didPerformTwoShotPrompt = 1;
      }
    }
  }
  else
  {
    v32 = [MEMORY[0x1E4F5D308] sharedLogger];
    [v32 logTwoShotStartEventWithPromptType:0 withMHUUID:v11];

    __int16 v33 = [MEMORY[0x1E4F5D308] sharedLogger];
    [v33 logTwoShotEndEventWithSuppresedAlert:0 withTimedOut:0 withMHUUID:v11];
  }
  __int16 v41 = [(CSSiriSpeechRecorder *)self _currentRecordingInfo];
  [v41 setTriggeredTwoShotBorealis:1];
  [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturingDidUpdateRecordingInfo:v41];
}

void __73__CSSiriSpeechRecorder__performTwoShotPromptForType_withOverride_atTime___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) reset];
  [*(id *)(*(void *)(a1 + 32) + 88) setStartWaitTime:5.0];
  id v2 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  [v2 logEventWithType:240 context:0];
}

void __73__CSSiriSpeechRecorder__performTwoShotPromptForType_withOverride_atTime___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  [v2 logEventWithType:240 context:&unk_1F23C5770];

  id v3 = [MEMORY[0x1E4F5D308] sharedLogger];
  [v3 logTwoShotEndEventWithSuppresedAlert:0 withTimedOut:1 withMHUUID:*(void *)(a1 + 32)];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleFakeTwoShotPromptTimeoutWithUUID:*(void *)(a1 + 40)];
}

uint64_t __73__CSSiriSpeechRecorder__performTwoShotPromptForType_withOverride_atTime___block_invoke_241(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = (void *)MEMORY[0x1E4F4E3A0];
  id v8 = a2;
  id v9 = [v7 sharedAnalytics];
  [v9 logEventWithType:240 context:0];

  id v10 = [MEMORY[0x1E4F5D308] sharedLogger];
  [v10 logTwoShotEndEventWithSuppresedAlert:0 withTimedOut:0 withMHUUID:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) _handleFakeTwoShotPromptCallbackWithUUID:*(void *)(a1 + 48) timestamp:v8 duration:a3 error:a4];
  uint64_t result = *(void *)(a1 + 40);
  if (v8 && (unint64_t)(*(void *)(result + 184) - 1) <= 1)
  {
    [(id)result _performTwoShotPromptForType:1 withOverride:*(void *)(a1 + 56) atTime:*(double *)(a1 + 64)];
    uint64_t result = *(void *)(a1 + 40);
  }
  *(unsigned char *)(result + 232) = 1;
  return result;
}

- (void)_hardEndpointWasDetectedWithMetrics:(id)a3 atTime:(double)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = (id *)MEMORY[0x1E4F4E380];
  id v9 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    id v19 = "-[CSSiriSpeechRecorder _hardEndpointWasDetectedWithMetrics:atTime:]";
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s Detected hard end-point with metrics - %@", (uint8_t *)&v18, 0x16u);
  }
  if (AFIsInternalInstall())
  {
    id v10 = *v8;
    os_signpost_id_t v11 = os_signpost_id_generate((os_log_t)*v8);
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        LOWORD(v18) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9338000, v10, OS_SIGNPOST_EVENT, v12, "SpeechRecorder", "EndpointHandled", (uint8_t *)&v18, 2u);
      }
    }
  }
  kdebug_trace();
  self->_didDetectEndpoint = 1;
  objc_storeStrong((id *)&self->_lastEndpointerMetrics, a3);
  if (self->_didDetectStartpoint || self->_serverDidRecognizeSpeech)
  {
    self->_didTimeout = 0;
  }
  else
  {
    BOOL didFakeTwoShotWithAlert = self->_didFakeTwoShotWithAlert;
    self->_didTimeout = !didFakeTwoShotWithAlert;
    if (!didFakeTwoShotWithAlert
      && [(CSSiriAudioActivationInfo *)self->_currentActivationInfo shouldTreatTimeoutAsHardEndpoint])
    {
      int v17 = *v8;
      if (os_log_type_enabled((os_log_t)*v8, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        id v19 = "-[CSSiriSpeechRecorder _hardEndpointWasDetectedWithMetrics:atTime:]";
        _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_INFO, "%s Overriding timeout and start point on timeout", (uint8_t *)&v18, 0xCu);
      }
      self->_didTimeout = 0;
      self->_didDetectStartpoint = 1;
    }
  }
  if ((unint64_t)(self->_endpointerOperationMode - 3) > 1)
  {
    id v13 = *v8;
    if (os_log_type_enabled((os_log_t)*v8, OS_LOG_TYPE_INFO))
    {
      double v14 = v13;
      double v15 = AFSpeechEndpointerOperationModeGetName();
      int v18 = 136315394;
      id v19 = "-[CSSiriSpeechRecorder _hardEndpointWasDetectedWithMetrics:atTime:]";
      __int16 v20 = 2112;
      id v21 = v15;
      _os_log_impl(&dword_1C9338000, v14, OS_LOG_TYPE_INFO, "%s Ignoring hard endpoint since _endpointerOperationMode = %@", (uint8_t *)&v18, 0x16u);
    }
  }
  else
  {
    [(CSSiriSpeechRecorder *)self _checkIfLastEndpointHintShouldBeAccepted:0];
    [(CSSiriSpeechRecorder *)self _stopRecordingForEndpointReason:2 withEndpointMetrics:v7];
    [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturing:self didDetectEndpointAtTime:a4];
  }
}

- (void)endpointer:(id)a3 didDetectHardEndpointAtTime:(double)a4 withMetrics:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = (id *)MEMORY[0x1E4F4E380];
  os_signpost_id_t v11 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v31 = "-[CSSiriSpeechRecorder endpointer:didDetectHardEndpointAtTime:withMetrics:]";
    __int16 v32 = 2048;
    double v33 = a4;
    _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_INFO, "%s time = %lf", buf, 0x16u);
  }
  if (AFIsInternalInstall())
  {
    os_signpost_id_t v12 = *v10;
    os_signpost_id_t v13 = os_signpost_id_generate((os_log_t)*v10);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9338000, v12, OS_SIGNPOST_EVENT, v14, "SpeechRecorder", "Endpoint", buf, 2u);
      }
    }
  }
  kdebug_trace();
  double v15 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __75__CSSiriSpeechRecorder_endpointer_didDetectHardEndpointAtTime_withMetrics___block_invoke;
  v27[3] = &unk_1E658C988;
  double v29 = a4;
  id v16 = v9;
  id v28 = v16;
  [v15 logEventWithType:220 contextProvider:v27];

  recordingWillStartGroup = self->_recordingWillStartGroup;
  dispatch_time_t v18 = dispatch_time(0, 15000000000);
  dispatch_group_wait(recordingWillStartGroup, v18);
  id v19 = *v10;
  if (os_log_type_enabled((os_log_t)*v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v31 = "-[CSSiriSpeechRecorder endpointer:didDetectHardEndpointAtTime:withMetrics:]";
    _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_INFO, "%s exited _recordingWillStartGroup", buf, 0xCu);
  }
  queue = self->_queue;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__CSSiriSpeechRecorder_endpointer_didDetectHardEndpointAtTime_withMetrics___block_invoke_224;
  v23[3] = &unk_1E658C9B0;
  v23[4] = self;
  id v24 = v8;
  double v26 = a4;
  id v25 = v16;
  id v21 = v16;
  id v22 = v8;
  dispatch_sync(queue, v23);
}

id __75__CSSiriSpeechRecorder_endpointer_didDetectHardEndpointAtTime_withMetrics___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v2 setObject:v3 forKey:@"time"];

  id v4 = [*(id *)(a1 + 32) additionalMetrics];
  if (v4) {
    [v2 setObject:v4 forKey:@"additionalMetrics"];
  }

  return v2;
}

void __75__CSSiriSpeechRecorder_endpointer_didDetectHardEndpointAtTime_withMetrics___block_invoke_224(double *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *((void *)a1 + 4);
  if (*(void *)(v1 + 88) != *((void *)a1 + 5))
  {
    id v2 = *MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO)) {
      return;
    }
    int v15 = 136315138;
    id v16 = "-[CSSiriSpeechRecorder endpointer:didDetectHardEndpointAtTime:withMetrics:]_block_invoke";
    id v3 = "%s Ignoring hard endpoint from stale CSEndpointAnalyzer";
    id v4 = v2;
    uint32_t v5 = 12;
    goto LABEL_4;
  }
  [*(id *)(v1 + 448) endTimestamp];
  AFMachAbsoluteTimeGetTimeInterval();
  uint64_t v8 = *((void *)a1 + 4);
  if ((*(void *)(v8 + 64) & 0xFFFFFFFFFFFFFFFBLL) == 1
    && (double v9 = v7, v10 = *(double *)(v8 + 248), v10 < v7)
    && (double v11 = a1[7], v11 < v7 - v10 + 0.5))
  {
    os_signpost_id_t v12 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v15 = 136316162;
      id v16 = "-[CSSiriSpeechRecorder endpointer:didDetectHardEndpointAtTime:withMetrics:]_block_invoke";
      __int16 v17 = 2048;
      double v18 = v11;
      __int16 v19 = 2048;
      double v20 = v10;
      __int16 v21 = 2048;
      double v22 = v9;
      __int16 v23 = 2048;
      uint64_t v24 = 0x3FE0000000000000;
      id v3 = "%s Ignoring hard endpoint because (endpointTime = %f, firstBufferTimestamp = %f, mostRecentTTSEndTimestamp = "
           "%f, extendedSuppressDuration = %f).";
      id v4 = v12;
      uint32_t v5 = 52;
LABEL_4:
      _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, v3, (uint8_t *)&v15, v5);
    }
  }
  else
  {
    uint64_t v13 = *((void *)a1 + 6);
    double v14 = a1[7];
    [(id)v8 _hardEndpointWasDetectedWithMetrics:v13 atTime:v14];
  }
}

- (void)endpointer:(id)a3 didDetectStartpointAtTime:(double)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[CSSiriSpeechRecorder endpointer:didDetectStartpointAtTime:]";
    __int16 v17 = 2048;
    double v18 = a4;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s time = %lf", buf, 0x16u);
  }
  uint64_t v8 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  [v8 logEventWithType:219 context:0];

  recordingWillStartGroup = self->_recordingWillStartGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CSSiriSpeechRecorder_endpointer_didDetectStartpointAtTime___block_invoke;
  block[3] = &unk_1E658CEC8;
  void block[4] = self;
  id v13 = v6;
  double v14 = a4;
  id v11 = v6;
  dispatch_group_notify(recordingWillStartGroup, queue, block);
}

void __61__CSSiriSpeechRecorder_endpointer_didDetectStartpointAtTime___block_invoke(double *a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *((void *)a1 + 4);
  if (*(void *)(v1 + 88) == *((void *)a1 + 5))
  {
    *(unsigned char *)(v1 + 202) = 1;
    double v3 = a1[6];
    id v4 = *(void **)(*((void *)a1 + 4) + 8);
    objc_msgSend(v4, "speechCapturing:didDetectStartpointAtTime:", v3);
  }
  else
  {
    id v2 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      id v6 = "-[CSSiriSpeechRecorder endpointer:didDetectStartpointAtTime:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v2, OS_LOG_TYPE_INFO, "%s Ignoring startpoint from stale CSEndpointAnalyzer", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)speechControllerDidUpdateSmartSiriVolume:(id)a3 forReason:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    os_signpost_id_t v12 = "-[CSSiriSpeechRecorder speechControllerDidUpdateSmartSiriVolume:forReason:]";
    __int16 v13 = 2048;
    unint64_t v14 = a4;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s reason = %tu", buf, 0x16u);
  }
  int v8 = AFIsHorseman();
  if (a4 <= 5 && v8)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__CSSiriSpeechRecorder_speechControllerDidUpdateSmartSiriVolume_forReason___block_invoke;
    block[3] = &unk_1E658D4D8;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __75__CSSiriSpeechRecorder_speechControllerDidUpdateSmartSiriVolume_forReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "speechCapturingDidRequestUpdateSiriOutputVolume:");
}

- (void)_speechControllerRequestsOperation:(unint64_t)a3 forReason:(unint64_t)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = (os_log_t *)MEMORY[0x1E4F4E380];
  double v10 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    double v18 = "-[CSSiriSpeechRecorder _speechControllerRequestsOperation:forReason:completion:]";
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    __int16 v21 = 2048;
    unint64_t v22 = a4;
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s opType = %tu, reason = %tu", buf, 0x20u);
  }
  switch(a3)
  {
    case 0uLL:
      [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturingDidRequestQuickStop:self];
      break;
    case 1uLL:
      [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturingDidRequestShutdownUI:self];
      break;
    case 2uLL:
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __80__CSSiriSpeechRecorder__speechControllerRequestsOperation_forReason_completion___block_invoke;
      v15[3] = &unk_1E658C938;
      id v16 = v8;
      [(CSSiriSpeechRecorder *)self _playPhaticWithCompletion:v15];
      os_signpost_id_t v12 = v16;
      goto LABEL_10;
    case 3uLL:
      [(CSSpeechController *)self->_speechController playRecordStartingAlertAndResetEndpointerWithAlertOverride:2];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __80__CSSiriSpeechRecorder__speechControllerRequestsOperation_forReason_completion___block_invoke_2;
      v13[3] = &unk_1E658C960;
      id v14 = v8;
      [(CSSiriSpeechRecorder *)self performBlockAfterAlerts:v13 timeout:0.5];
      os_signpost_id_t v12 = v14;
LABEL_10:

      break;
    default:
      id v11 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        double v18 = "-[CSSiriSpeechRecorder _speechControllerRequestsOperation:forReason:completion:]";
        __int16 v19 = 2048;
        unint64_t v20 = a3;
        _os_log_error_impl(&dword_1C9338000, v11, OS_LOG_TYPE_ERROR, "%s Unknown CSRequestOperationType (opType = %tu).", buf, 0x16u);
      }
      break;
  }
}

uint64_t __80__CSSiriSpeechRecorder__speechControllerRequestsOperation_forReason_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __80__CSSiriSpeechRecorder__speechControllerRequestsOperation_forReason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)speechControllerRequestsOperation:(unint64_t)a3 forReason:(unint64_t)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  double v9 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    double v18 = "-[CSSiriSpeechRecorder speechControllerRequestsOperation:forReason:completion:]";
    __int16 v19 = 2048;
    unint64_t v20 = a3;
    __int16 v21 = 2048;
    unint64_t v22 = a4;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s opType = %tu, reason = %tu", buf, 0x20u);
  }
  recordingWillStartGroup = self->_recordingWillStartGroup;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__CSSiriSpeechRecorder_speechControllerRequestsOperation_forReason_completion___block_invoke;
  v13[3] = &unk_1E658CA50;
  unint64_t v15 = a3;
  unint64_t v16 = a4;
  void v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  dispatch_group_notify(recordingWillStartGroup, queue, v13);
}

uint64_t __79__CSSiriSpeechRecorder_speechControllerRequestsOperation_forReason_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _speechControllerRequestsOperation:*(void *)(a1 + 48) forReason:*(void *)(a1 + 56) completion:*(void *)(a1 + 40)];
}

- (void)speechControllerRequestsOperation:(unint64_t)a3 forReason:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v12 = "-[CSSiriSpeechRecorder speechControllerRequestsOperation:forReason:]";
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    __int16 v15 = 2048;
    unint64_t v16 = a4;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s opType = %tu, reason = %tu", buf, 0x20u);
  }
  recordingWillStartGroup = self->_recordingWillStartGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CSSiriSpeechRecorder_speechControllerRequestsOperation_forReason___block_invoke;
  block[3] = &unk_1E658C910;
  void block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_group_notify(recordingWillStartGroup, queue, block);
}

uint64_t __68__CSSiriSpeechRecorder_speechControllerRequestsOperation_forReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _speechControllerRequestsOperation:*(void *)(a1 + 40) forReason:*(void *)(a1 + 48) completion:0];
}

- (void)suppressUtteranceGradingIfRequired
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (AFIsHorseman())
  {
    double v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v12 = "-[CSSiriSpeechRecorder suppressUtteranceGradingIfRequired]";
      _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s BTLE speech controller began waiting for Myriad decision", buf, 0xCu);
    }
    id v4 = [(CSSiriSpeechRecorder *)self _speechController];
    [v4 beginWaitingForMyriad];
    int v5 = [MEMORY[0x1E4F5D450] supportsSCDAFramework];
    id v6 = (id *)0x1E4F9FAF0;
    if (!v5) {
      id v6 = (id *)0x1E4F4E508;
    }
    uint64_t v7 = [*v6 sharedMonitor];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__CSSiriSpeechRecorder_suppressUtteranceGradingIfRequired__block_invoke;
    v9[3] = &unk_1E658C8E8;
    id v10 = v4;
    id v8 = v4;
    [v7 waitForMyriadDecisionForReason:@"Utterance Grading" withCompletion:v9];
  }
}

uint64_t __58__CSSiriSpeechRecorder_suppressUtteranceGradingIfRequired__block_invoke(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  id v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[CSSiriSpeechRecorder suppressUtteranceGradingIfRequired]_block_invoke";
    __int16 v8 = 2048;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s BTLE speech controller end waiting for Myriad decision %lu", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 32) endWaitingForMyriadWithDecision:v3];
}

- (void)speechControllerDidDetectVoiceTriggerTwoShot:(id)a3 atTime:(double)a4 wantsAudibleFeedback:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  __int16 v8 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    unint64_t v20 = "-[CSSiriSpeechRecorder speechControllerDidDetectVoiceTriggerTwoShot:atTime:wantsAudibleFeedback:]";
    __int16 v21 = 2048;
    double v22 = a4;
    __int16 v23 = 1024;
    BOOL v24 = v5;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s time = %lf, wantsAudibleFeedback = %d", buf, 0x1Cu);
  }
  uint64_t v9 = [MEMORY[0x1E4F5D308] sharedLogger];
  uint64_t v10 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
  [v9 logTwoShotDetectedWithMHUUID:v10];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke;
  v17[3] = &unk_1E658C898;
  void v17[4] = self;
  *(double *)&v17[5] = a4;
  BOOL v18 = v5;
  id v11 = (void *)MEMORY[0x1CB785210](v17);
  recordingWillStartGroup = self->_recordingWillStartGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke_2;
  block[3] = &unk_1E658D3A0;
  void block[4] = self;
  id v16 = v11;
  id v14 = v11;
  dispatch_group_notify(recordingWillStartGroup, queue, block);
}

void __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 203) && *(void *)(v1 + 184) == 2)
  {
    uint64_t v3 = *(void *)(v1 + 112);
    if (!v3) {
      uint64_t v3 = *(void *)(v1 + 104);
    }
    [*(id *)(v1 + 96) didDetectTwoShotWithAudioActivationInfo:v3 atTime:*(double *)(a1 + 40)];
    if (*(unsigned char *)(a1 + 48))
    {
      id v11 = [*(id *)(a1 + 32) _currentRecordRoute];
      id v4 = [*(id *)(a1 + 32) _currentPlaybackRoute];
      uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 104) twoShotPromptTypeForRecordRoute:v11 playbackRoute:v4];
      int v6 = *(void **)(*(void *)(a1 + 32) + 104);
      uint64_t v7 = CSSupportsVibrator();
      uint64_t v8 = [v6 twoShotFeedbackAlertOverrideForRecordRoute:v11 playbackRoute:v4 deviceSupportsVibrator:v7 deviceSupportsEC:MEMORY[0x1CB783E60]()];
      if (v5)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void **)(a1 + 32);
        if (v10[22] != 17) {
          [v10 _performTwoShotPromptForType:v5 withOverride:v9 atTime:*(double *)(a1 + 40)];
        }
      }
    }
  }
}

void __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((AFIsHorseman() & 1) != 0 || *(void *)(*(void *)(a1 + 32) + 176) == 15)
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    uint64_t v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[CSSiriSpeechRecorder speechControllerDidDetectVoiceTriggerTwoShot:atTime:wantsAudibleFeedback:]_block_invoke_2";
      _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s BTLE waiting for Myriad to finish", buf, 0xCu);
    }
    int v4 = [MEMORY[0x1E4F5D450] supportsSCDAFramework];
    uint64_t v5 = (id *)0x1E4F9FAF0;
    if (!v4) {
      uint64_t v5 = (id *)0x1E4F4E508;
    }
    int v6 = [*v5 sharedMonitor];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke_210;
    v8[3] = &unk_1E658C8C0;
    uint64_t v7 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v7;
    [v6 waitForMyriadDecisionForReason:@"Two shot feedback" withCompletion:v8];
  }
}

void __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke_210(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v2 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke_2_211;
    block[3] = &unk_1E658D1C0;
    id v5 = *(id *)(a1 + 40);
    dispatch_async(v2, block);
  }
  else
  {
    uint64_t v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v7 = "-[CSSiriSpeechRecorder speechControllerDidDetectVoiceTriggerTwoShot:atTime:wantsAudibleFeedback:]_block_invoke";
      _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s BTLE Myriad loss cancelled two shot feedback", buf, 0xCu);
    }
  }
}

uint64_t __97__CSSiriSpeechRecorder_speechControllerDidDetectVoiceTriggerTwoShot_atTime_wantsAudibleFeedback___block_invoke_2_211(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)languageDetectorDidDetectLanguageWithConfidence:(id)a3 confidence:(id)a4 isConfident:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315907;
    __int16 v19 = "-[CSSiriSpeechRecorder languageDetectorDidDetectLanguageWithConfidence:confidence:isConfident:]";
    __int16 v20 = 1025;
    BOOL v21 = v5;
    __int16 v22 = 2113;
    id v23 = v8;
    __int16 v24 = 2113;
    id v25 = v9;
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s Language detector is confident:%{private}d of the detected language:'%{private}@' with language code likelihood: %{private}@", buf, 0x26u);
  }
  queue = self->_queue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__CSSiriSpeechRecorder_languageDetectorDidDetectLanguageWithConfidence_confidence_isConfident___block_invoke;
  v14[3] = &unk_1E658D488;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  BOOL v17 = v5;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(queue, v14);
}

uint64_t __95__CSSiriSpeechRecorder_languageDetectorDidDetectLanguageWithConfidence_confidence_isConfident___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "speechCapturing:didDetectLanguage:confidenceScores:isConfident:");
}

- (void)_playStopAlertIfNecessaryForReason:(int64_t)a3 endpointMode:(int64_t)a4 error:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = [(CSSiriSpeechRecorder *)self _currentRecordRoute];
  int v9 = self->_speechCapturingMode == 4 && !self->_fingerprintWasRecognized;
  if ((unint64_t)(a3 + 11785) > 0xFFFFFFFFFFFFFFFDLL
    || self->_suppressRecordingStoppedAlert
    || (AFIsHorseman() & 1) != 0
    || (AFIsNano() & 1) != 0
    || [(CSSiriAudioActivationInfo *)self->_currentActivationInfo shouldSuppressRecordingStopAlert]|| ![(CSSiriAudioActivationInfo *)self->_currentActivationInfo isVoiceOverTouchEnabled]&& (self->_speechCapturingMode & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    int v10 = v9;
  }
  else
  {
    int v10 = 1;
  }
  if (AFIsATV())
  {
    if (![(CSSiriAudioActivationInfo *)self->_currentActivationInfo isVoiceOverTouchEnabled]) {
      goto LABEL_15;
    }
  }
  else if (!v10)
  {
LABEL_15:
    id v11 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v31 = 136315138;
      __int16 v32 = "-[CSSiriSpeechRecorder _playStopAlertIfNecessaryForReason:endpointMode:error:]";
      _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_INFO, "%s Not explicitly playing alert", (uint8_t *)&v31, 0xCu);
    }
    goto LABEL_47;
  }
  unint64_t v12 = self->_speechCapturingMode & 0xFFFFFFFFFFFFFFFBLL;
  int64_t v13 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo speechEvent];
  int v14 = [MEMORY[0x1E4F5D450] supportsSCDAFramework];
  id v15 = (id *)0x1E4F9FAF0;
  if (!v14) {
    id v15 = (id *)0x1E4F4E508;
  }
  id v16 = [*v15 sharedMonitor];
  int v17 = [v16 didWin];
  int v18 = [v16 isMonitoring];
  __int16 v19 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_INFO))
  {
    BOOL wasCanceled = self->_wasCanceled;
    BOOL suppressRecordingStoppedAlert = self->_suppressRecordingStoppedAlert;
    int v31 = 136316930;
    __int16 v32 = "-[CSSiriSpeechRecorder _playStopAlertIfNecessaryForReason:endpointMode:error:]";
    __int16 v33 = 1024;
    *(_DWORD *)uint64_t v34 = v12 == 1;
    *(_WORD *)&v34[4] = 2048;
    *(void *)&v34[6] = v13;
    __int16 v35 = 1024;
    BOOL v36 = wasCanceled;
    __int16 v37 = 1024;
    BOOL v38 = suppressRecordingStoppedAlert;
    __int16 v39 = 1024;
    int v40 = v18;
    __int16 v41 = 1024;
    int v42 = v17;
    __int16 v43 = 2112;
    double v44 = v8;
    _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_INFO, "%s isSiriMode=%d, speechEvent=%ld, wasRequestCancelled=%d, shouldSuppressAlert=%d, isMonitoringMyriadEvents=%d, didMyriadWin=%d, recordRoute=%@", (uint8_t *)&v31, 0x3Eu);
  }
  if (v12 == 1
    && AFSpeechEventIsVoiceTrigger()
    && (!self->_wasCanceled ? (int v22 = v18) : (int v22 = 0),
        (v23 = v22 & v17, !self->_wasCanceled) ? (char v24 = 1) : (char v24 = v18),
        v23 != 1 && (v24 & 1) != 0))
  {
    id v25 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v31 = 136315138;
      __int16 v32 = "-[CSSiriSpeechRecorder _playStopAlertIfNecessaryForReason:endpointMode:error:]";
      _os_log_impl(&dword_1C9338000, v25, OS_LOG_TYPE_INFO, "%s BTLE Myriad Not explicitly playing speech stop alert", (uint8_t *)&v31, 0xCu);
    }
  }
  else
  {
    BOOL v26 = (a5 || (!self->_wasCanceled & ~v9) == 0) && !self->_forceSuccessAlertOnStop;
    id v27 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      id v28 = @"AVVoice_RecordStopped";
      if (v26) {
        id v28 = @"AVVoice_RecordStoppedWithError";
      }
      int v31 = 136315394;
      __int16 v32 = "-[CSSiriSpeechRecorder _playStopAlertIfNecessaryForReason:endpointMode:error:]";
      __int16 v33 = 2112;
      *(void *)uint64_t v34 = v28;
      _os_log_impl(&dword_1C9338000, v27, OS_LOG_TYPE_INFO, "%s Explicitly playing %@ alert", (uint8_t *)&v31, 0x16u);
    }
    if (v26
      && ![(CSSiriAudioActivationInfo *)self->_currentActivationInfo shouldSuppressRecordingErrorAlert])
    {
      double v29 = self;
      uint64_t v30 = 3;
    }
    else
    {
      double v29 = self;
      uint64_t v30 = 2;
    }
    [(CSSiriSpeechRecorder *)v29 _playAudioAlert:v30];
  }

LABEL_47:
}

- (BOOL)_shouldPlaySummonedToneOnTopCapInvocationOnHorseman
{
  id v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
  char v3 = [v2 startAlertEnabled];

  return v3;
}

- (BOOL)_shouldPlayTwoShotToneFeedbackOnHorseman
{
  id v2 = [MEMORY[0x1E4F4E538] sharedPreferences];
  if ([v2 startAlertEnabled]) {
    char v3 = 1;
  }
  else {
    char v3 = [MEMORY[0x1E4F5D450] supportStateFeedback];
  }

  return v3;
}

- (void)_setLanguageDetectorDelegateIfRequired
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  char v3 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo languageDetectionUserContext];
  int v4 = _AFPreferencesDictationLanguageDetectorEnabled();
  BOOL v5 = *MEMORY[0x1E4F4E380];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO);
  if (v4 && v3)
  {
    if (v6)
    {
      int v7 = 136315138;
      id v8 = "-[CSSiriSpeechRecorder _setLanguageDetectorDelegateIfRequired]";
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s Language detection delegate is active", (uint8_t *)&v7, 0xCu);
    }
    [(CSSpeechController *)self->_speechController setLanguageDetectorDelegate:self];
  }
  else if (v6)
  {
    int v7 = 136315650;
    id v8 = "-[CSSiriSpeechRecorder _setLanguageDetectorDelegateIfRequired]";
    __int16 v9 = 1024;
    int v10 = v4;
    __int16 v11 = 2112;
    unint64_t v12 = v3;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s Language detection delegate is NOT active. %d, %@", (uint8_t *)&v7, 0x1Cu);
  }
}

- (void)speechControllerDidFinishAlertPlayback:(id)a3 ofType:(int64_t)a4 error:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = *MEMORY[0x1E4F4E380];
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v18 = "-[CSSiriSpeechRecorder speechControllerDidFinishAlertPlayback:ofType:error:]";
      __int16 v19 = 2048;
      int64_t v20 = a4;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_error_impl(&dword_1C9338000, v10, OS_LOG_TYPE_ERROR, "%s type = %ld, error = %@", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v18 = "-[CSSiriSpeechRecorder speechControllerDidFinishAlertPlayback:ofType:error:]";
    __int16 v19 = 2048;
    int64_t v20 = a4;
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s type = %ld", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__CSSiriSpeechRecorder_speechControllerDidFinishAlertPlayback_ofType_error___block_invoke;
  block[3] = &unk_1E658CEC8;
  id v14 = v9;
  id v15 = self;
  int64_t v16 = a4;
  id v12 = v9;
  dispatch_async(queue, block);
}

void __76__CSSiriSpeechRecorder_speechControllerDidFinishAlertPlayback_ofType_error___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32) && [*(id *)(a1 + 40) _shouldEmitInstrumentation]) {
    [*(id *)(*(void *)(a1 + 40) + 96) instrumentSiriCueForAlertType:*(void *)(a1 + 48)];
  }
  id v2 = *(void **)(*(void *)(a1 + 40) + 472);
  if (!v2)
  {
    int v10 = *MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315138;
    int64_t v20 = "-[CSSiriSpeechRecorder speechControllerDidFinishAlertPlayback:ofType:error:]_block_invoke";
    __int16 v11 = "%s numberOfAVVCAlertPlaybacksByType is nil.";
LABEL_13:
    id v12 = v10;
    uint32_t v13 = 12;
    goto LABEL_16;
  }
  char v3 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  int v4 = [v2 objectForKey:v3];
  uint64_t v5 = [v4 unsignedIntegerValue];

  if (!v5)
  {
    id v14 = *MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v15 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 136315394;
    int64_t v20 = "-[CSSiriSpeechRecorder speechControllerDidFinishAlertPlayback:ofType:error:]_block_invoke";
    __int16 v21 = 2048;
    uint64_t v22 = v15;
    __int16 v11 = "%s numberOfAVVCAlertPlaybacksByType does not have AVVC alert playbacks of type %ld.";
    id v12 = v14;
    uint32_t v13 = 22;
LABEL_16:
    _os_log_error_impl(&dword_1C9338000, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    return;
  }
  uint64_t v6 = v5 - 1;
  if (v5 == 1)
  {
    int v7 = *(void **)(*(void *)(a1 + 40) + 472);
    id v8 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
    [v7 removeObjectForKey:v8];

    id v9 = *(NSObject **)(*(void *)(a1 + 40) + 464);
    if (v9)
    {
      dispatch_group_leave(v9);
      return;
    }
    int v10 = *MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315138;
    int64_t v20 = "-[CSSiriSpeechRecorder speechControllerDidFinishAlertPlayback:ofType:error:]_block_invoke";
    __int16 v11 = "%s alertPlaybackGroup is nil.";
    goto LABEL_13;
  }
  int64_t v16 = *(void **)(*(void *)(a1 + 40) + 472);
  id v18 = [NSNumber numberWithUnsignedInteger:v6];
  int v17 = [NSNumber numberWithInteger:*(void *)(a1 + 48)];
  [v16 setObject:v18 forKey:v17];
}

- (void)speechController:(id)a3 didSetAudioSessionActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[CSSiriSpeechRecorder speechController:didSetAudioSessionActive:]";
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__CSSiriSpeechRecorder_speechController_didSetAudioSessionActive___block_invoke;
  v8[3] = &unk_1E658C870;
  v8[4] = self;
  BOOL v9 = v4;
  dispatch_async(queue, v8);
}

uint64_t __66__CSSiriSpeechRecorder_speechController_didSetAudioSessionActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "speechCapturing:didSetAudioSessionActive:");
}

- (void)speechController:(id)a3 willSetAudioSessionActive:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[CSSiriSpeechRecorder speechController:willSetAudioSessionActive:]";
    __int16 v12 = 1024;
    BOOL v13 = v4;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __67__CSSiriSpeechRecorder_speechController_willSetAudioSessionActive___block_invoke;
  v8[3] = &unk_1E658C870;
  v8[4] = self;
  BOOL v9 = v4;
  dispatch_async(queue, v8);
}

uint64_t __67__CSSiriSpeechRecorder_speechController_willSetAudioSessionActive___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "speechCapturing:willSetAudioSessionActive:");
}

- (void)speechControllerRecordHardwareConfigurationDidChange:(id)a3 toConfiguration:(int64_t)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    int v7 = "-[CSSiriSpeechRecorder speechControllerRecordHardwareConfigurationDidChange:toConfiguration:]";
    __int16 v8 = 2048;
    int64_t v9 = a4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %ld", (uint8_t *)&v6, 0x16u);
  }
}

- (void)speechControllerEndRecordInterruption:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    int64_t v9 = "-[CSSiriSpeechRecorder speechControllerEndRecordInterruption:]";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  [v5 logEventWithType:227 context:0];

  int v6 = [MEMORY[0x1E4F5D2D0] sharedLogger];
  int v7 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
  [v6 logMHAssistantDaemonAudioRecordingInterruptionContextWithMHUUID:v7 withStartEvent:0 withLinkID:0 withAvAudioSessionInterruptorName:0 withAVAudioSessionInterrupterType:0];
}

- (void)speechControllerBeginRecordInterruption:(id)a3 withContext:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = AFAddInterruptingAudioSessionInfoToAnalyticsContext();
  int v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    __int16 v19 = "-[CSSiriSpeechRecorder speechControllerBeginRecordInterruption:withContext:]";
    __int16 v20 = 2112;
    __int16 v21 = v5;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s context = %@", (uint8_t *)&v18, 0x16u);
  }
  int v7 = [MEMORY[0x1E4F29128] UUID];
  int v8 = [v5 objectForKey:@"kAudioSessionProperty_ActiveSessionDisplayIDs"];
  int64_t v9 = [v5 objectForKey:*MEMORY[0x1E4F15028]];
  uint64_t v10 = [v5 objectForKey:*MEMORY[0x1E4F15020]];
  __int16 v11 = [v10 stringValue];

  __int16 v12 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
  BOOL v13 = [MEMORY[0x1E4F5D2D0] sharedLogger];
  [v13 logMHAssistantDaemonAudioRecordingInterruptionContextWithMHUUID:v12 withStartEvent:1 withLinkID:v7 withAvAudioSessionInterruptorName:v9 withAVAudioSessionInterrupterType:v11];

  uint64_t v14 = +[CSMXSessionMonitor GetCurrentlyActiveSessionCategory];
  uint64_t v15 = +[CSMXSessionMonitor GetCurrentlyActiveSessionMode];
  int64_t v16 = [MEMORY[0x1E4F5D2D0] sharedLogger];
  [v16 logMHAssistantDaemonAudioRecordingInterruptionStartedTier1WithMHUUID:v12 withLinkID:v7 withActiveSessionDisplayIDs:v8 audioSessionCategory:v14 audioSessionMode:v15];

  int v17 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  [v17 logEventWithType:226 context:v5];
}

- (void)_speechControllerDidReceiveLastAudioRecordBuffer:(id)a3 forReason:(int64_t)a4 estimatedSpeechEndHostTime:(unint64_t)a5 isRecordingStopped:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  __int16 v11 = (os_log_t *)MEMORY[0x1E4F4E380];
  __int16 v12 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v29 = 136315906;
    uint64_t v30 = "-[CSSiriSpeechRecorder _speechControllerDidReceiveLastAudioRecordBuffer:forReason:estimatedSpeechEndHostTime:i"
          "sRecordingStopped:]";
    __int16 v31 = 2048;
    int64_t v32 = a4;
    __int16 v33 = 2048;
    unint64_t v34 = a5;
    __int16 v35 = 1024;
    BOOL v36 = v6;
    _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s reason = %zd, estimatedSpeechEndHostTime = %llu, isRecordingStopped = %d", (uint8_t *)&v29, 0x26u);
  }
  int64_t recordingState = self->_recordingState;
  if ((recordingState & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    os_log_t v22 = *v11;
    if (!os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    int v29 = 136315394;
    uint64_t v30 = "-[CSSiriSpeechRecorder _speechControllerDidReceiveLastAudioRecordBuffer:forReason:estimatedSpeechEndHostTime:i"
          "sRecordingStopped:]";
    __int16 v31 = 2048;
    int64_t v32 = recordingState;
    uint64_t v23 = "%s Ignoring unexpected last buffer callback while in state %ld";
    char v24 = v22;
    uint32_t v25 = 22;
LABEL_18:
    _os_log_error_impl(&dword_1C9338000, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v29, v25);
    goto LABEL_31;
  }
  if (!self->_didReceiveFirstBuffer)
  {
    os_log_t v26 = *v11;
    if (!os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_31;
    }
    int v29 = 136315138;
    uint64_t v30 = "-[CSSiriSpeechRecorder _speechControllerDidReceiveLastAudioRecordBuffer:forReason:estimatedSpeechEndHostTime:i"
          "sRecordingStopped:]";
    uint64_t v23 = "%s Ignoring unexpected last buffer callback without first buffer.";
    char v24 = v26;
    uint32_t v25 = 12;
    goto LABEL_18;
  }
  self->_didReceiveLastBuffer = 1;
  uint64_t v14 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
  if (self->_lastAudioRecordBufferStartTime)
  {
    uint64_t v15 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v15 logEventWithType:231 machAbsoluteTime:self->_lastAudioRecordBufferStartTime context:0];

    int64_t v16 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    objc_msgSend(v16, "logMHAssistantDaemonAudioRecordingLastBufferWithMHUUID:withStartEvent:withLastBufferStartTimeOffsetNs:withLastBufferReceiptTimeOffsetNs:", v14, 1, objc_msgSend(MEMORY[0x1E4F5D300], "hostTimeToNs:", self->_lastAudioRecordBufferStartTime), 0);
  }
  if (self->_lastAudioRecordBufferReceiptTime)
  {
    int v17 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v17 logEventWithType:232 machAbsoluteTime:self->_lastAudioRecordBufferReceiptTime context:0];

    int v18 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    objc_msgSend(v18, "logMHAssistantDaemonAudioRecordingLastBufferWithMHUUID:withStartEvent:withLastBufferStartTimeOffsetNs:withLastBufferReceiptTimeOffsetNs:", v14, 0, 0, objc_msgSend(MEMORY[0x1E4F5D300], "hostTimeToNs:", self->_lastAudioRecordBufferReceiptTime));
  }
  if (!v6)
  {
    if (self->_didDetectEndpoint)
    {
      lastEndpointerMetrics = self->_lastEndpointerMetrics;
      if (lastEndpointerMetrics)
      {
        unint64_t v20 = [(CSEndpointerMetrics *)lastEndpointerMetrics endpointerType];
        if (v20 >= 5) {
          uint64_t v21 = 0;
        }
        else {
          uint64_t v21 = qword_1C94A6FC8[v20];
        }
      }
      else
      {
        uint64_t v21 = 1;
      }
    }
    else
    {
      uint64_t v27 = 2 * (a4 == 0);
      if (a4 == -11789) {
        uint64_t v27 = 1;
      }
      if (self->_serverDidEndpoint) {
        uint64_t v21 = 1;
      }
      else {
        uint64_t v21 = v27;
      }
    }
    if (self->_didDetectEndpoint) {
      id v28 = self->_lastEndpointerMetrics;
    }
    else {
      id v28 = 0;
    }
    [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturingDidReceiveLastAudioBufferWithEndpointMode:v21 totalPacketCount:self->_packetCount endpointerMetrics:v28];
  }

LABEL_31:
}

- (void)speechControllerLPCMRecordBufferAvailable:(id)a3 buffer:(id)a4 recordedAt:(unint64_t)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__CSSiriSpeechRecorder_speechControllerLPCMRecordBufferAvailable_buffer_recordedAt___block_invoke;
  block[3] = &unk_1E658CEC8;
  void block[4] = self;
  id v11 = v9;
  id v22 = v11;
  unint64_t v23 = a5;
  dispatch_async(queue, block);
  if (self->_needsAVVCLPCMCallbacks)
  {
    if ([v11 length])
    {
      recordingWillStartGroup = self->_recordingWillStartGroup;
      BOOL v13 = self->_queue;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __84__CSSiriSpeechRecorder_speechControllerLPCMRecordBufferAvailable_buffer_recordedAt___block_invoke_198;
      v19[3] = &unk_1E658D4B0;
      v19[4] = self;
      id v20 = v11;
      dispatch_group_notify(recordingWillStartGroup, v13, v19);
    }
    else
    {
      uint64_t v14 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[CSSiriSpeechRecorder speechControllerLPCMRecordBufferAvailable:buffer:recordedAt:]";
        _os_log_error_impl(&dword_1C9338000, v14, OS_LOG_TYPE_ERROR, "%s LPCM record buffer is empty.", (uint8_t *)&buf, 0xCu);
      }
      if (!self->_hasReceivedEmptyLPCMRecordBuffer)
      {
        self->_hasReceivedEmptyLPCMRecordBuffer = 1;
        uint64_t v24 = 0;
        uint32_t v25 = &v24;
        uint64_t v26 = 0x2050000000;
        uint64_t v15 = (void *)getSiriCoreSymptomsReporterClass_softClass;
        uint64_t v27 = getSiriCoreSymptomsReporterClass_softClass;
        if (!getSiriCoreSymptomsReporterClass_softClass)
        {
          *(void *)&long long buf = MEMORY[0x1E4F143A8];
          *((void *)&buf + 1) = 3221225472;
          int v29 = __getSiriCoreSymptomsReporterClass_block_invoke;
          uint64_t v30 = &unk_1E658CBA8;
          __int16 v31 = &v24;
          __getSiriCoreSymptomsReporterClass_block_invoke((uint64_t)&buf);
          uint64_t v15 = (void *)v25[3];
        }
        id v16 = v15;
        _Block_object_dispose(&v24, 8);
        int v17 = [v16 sharedInstance];
        int v18 = [MEMORY[0x1E4F28F80] processInfo];
        objc_msgSend(v17, "reportIssueForType:subType:context:processIdentifier:walkboutStatus:", @"audio_recording", @"empty_lpcm_record_buffer", 0, objc_msgSend(v18, "processIdentifier"), CSIsCarryDevice());
      }
    }
  }
}

uint64_t __84__CSSiriSpeechRecorder_speechControllerLPCMRecordBufferAvailable_buffer_recordedAt___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 64) == 4)
  {
    char v3 = [(id)v2 _fingerprinter];
    [v3 appendPCMData:*(void *)(a1 + 40)];

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 235))
  {
    uint64_t v4 = mach_absolute_time();
    uint64_t v5 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v5 + 200))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      int v7 = [*(id *)(a1 + 32) _currentMHUUID:0];
      [(id)v5 _speechControllerDidReceiveFirstAudioRecordBufferWithHostTime:v6 atHostTime:v4 mhUUID:v7];

      uint64_t v5 = *(void *)(a1 + 32);
    }
    *(void *)(v5 + 384) = *(void *)(a1 + 48);
    *(void *)(*(void *)(a1 + 32) + 392) = v4;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = *(void **)(v2 + 8);
  return [v9 speechCapturingDidRecordPCMAudioData:v8];
}

uint64_t __84__CSSiriSpeechRecorder_speechControllerLPCMRecordBufferAvailable_buffer_recordedAt___block_invoke_198(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 168) appendAudioData:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = *(void **)(*(void *)(a1 + 32) + 96);
  return [v3 appendRecordedAudioBuffer:v2];
}

- (id)convertVirtualAudioSubTypeToString:(unsigned int)a3
{
  return (id)[MEMORY[0x1E4F5D450] audioPortSubtypeAsString:*(void *)&a3];
}

- (id)getAudioRouteInstrumentationWithRecordingInfo:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (os_log_t *)MEMORY[0x1E4F4E380];
  uint64_t v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v41 = "-[CSSiriSpeechRecorder getAudioRouteInstrumentationWithRecordingInfo:]";
    __int16 v42 = 2112;
    id v43 = v4;
    _os_log_debug_impl(&dword_1C9338000, v6, OS_LOG_TYPE_DEBUG, "%s Getting audio route instrumentation with recording info %@...", buf, 0x16u);
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4FA1260]);
  id v8 = objc_alloc_init(MEMORY[0x1E4FA12B8]);
  id v9 = [v4 route];
  if ([v9 containsString:@"injectionDevice"]) {
    uint64_t v10 = 14;
  }
  else {
    uint64_t v10 = 0;
  }
  if ([v4 isBluetooth])
  {
    id v36 = v4;
    id v11 = [v4 bluetoothDevice];
    __int16 v12 = [v11 deviceInfo];
    uint64_t v13 = [v12 vendorID];
    uint64_t v14 = [v12 productID];
    if (v13 == 76)
    {
      if ([v9 isEqualToString:*MEMORY[0x1E4F150D8]]) {
        LODWORD(v10) = 10;
      }
      else {
        LODWORD(v10) = 3;
      }
      if ([v9 isEqualToString:*MEMORY[0x1E4F152F8]]) {
        uint64_t v10 = 8;
      }
      else {
        uint64_t v10 = v10;
      }
    }
    else
    {
      uint64_t v10 = 4;
    }
    uint64_t v15 = [NSNumber numberWithUnsignedInt:v13];
    id v16 = [v15 stringValue];
    [v8 setInterfaceVendorID:v16];

    int v17 = [NSNumber numberWithUnsignedInt:v14];
    int v18 = [v17 stringValue];
    [v8 setInterfaceProductID:v18];

    id v4 = v36;
    goto LABEL_18;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F15160]])
  {
    uint64_t v10 = 12;
    goto LABEL_19;
  }
  if ([v9 isEqualToString:*MEMORY[0x1E4F150F0]])
  {
    uint64_t v10 = 1;
    goto LABEL_19;
  }
  if (([v9 isEqualToString:*MEMORY[0x1E4F15118]] & 1) != 0
    || [v9 isEqualToString:*MEMORY[0x1E4F15328]])
  {
    id v11 = [v4 modelName];
    [v8 setInterfaceProductID:v11];
    uint64_t v10 = 7;
LABEL_18:

    goto LABEL_19;
  }
  if (([v9 isEqualToString:*MEMORY[0x1E4F15138]] & 1) != 0
    || [v9 isEqualToString:*MEMORY[0x1E4F15150]])
  {
    id v11 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
    uint64_t v21 = [v11 attributeForKey:*MEMORY[0x1E4F74C68]];
    id v22 = [v21 objectForKey:*MEMORY[0x1E4F74DF8]];
    unint64_t v23 = [(CSSiriSpeechRecorder *)self convertVirtualAudioSubTypeToString:1751410292];
    if ([v22 isEqualToString:v23])
    {

      uint64_t v10 = 6;
LABEL_42:
      uint64_t v30 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136315394;
        __int16 v41 = "-[CSSiriSpeechRecorder getAudioRouteInstrumentationWithRecordingInfo:]";
        __int16 v42 = 2112;
        id v43 = v22;
        _os_log_debug_impl(&dword_1C9338000, v30, OS_LOG_TYPE_DEBUG, "%s routeSubtype = %@", buf, 0x16u);
        uint64_t v30 = *v5;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        __int16 v39 = v21;
        id v31 = v4;
        uint64_t v32 = NSNumber;
        __int16 v33 = v30;
        unint64_t v34 = [v32 numberWithInt:v10];
        *(_DWORD *)long long buf = 136315394;
        __int16 v41 = "-[CSSiriSpeechRecorder getAudioRouteInstrumentationWithRecordingInfo:]";
        __int16 v42 = 2112;
        id v43 = v34;
        _os_log_debug_impl(&dword_1C9338000, v33, OS_LOG_TYPE_DEBUG, "%s route = %@", buf, 0x16u);

        id v4 = v31;
        uint64_t v21 = v39;
      }
      goto LABEL_18;
    }
    BOOL v38 = v21;
    uint64_t v24 = v8;
    uint32_t v25 = [(CSSiriSpeechRecorder *)self convertVirtualAudioSubTypeToString:1214539380];
    if ([v22 isEqualToString:v25])
    {

      uint64_t v10 = 6;
      id v8 = v24;
LABEL_41:
      uint64_t v21 = v38;
      goto LABEL_42;
    }
    uint64_t v37 = v11;
    id v26 = v4;
    uint64_t v27 = [(CSSiriSpeechRecorder *)self convertVirtualAudioSubTypeToString:1752709424];
    if ([v22 isEqualToString:v27])
    {
    }
    else
    {
      id v28 = [(CSSiriSpeechRecorder *)self convertVirtualAudioSubTypeToString:2004367664];
      char v35 = [v22 isEqualToString:v28];

      if ((v35 & 1) == 0)
      {
        int v29 = [&unk_1F23C4DC0 stringValue];
        id v8 = v24;
        [v24 setInterfaceVendorID:v29];

        [v24 setInterfaceProductID:v22];
        uint64_t v10 = 5;
        goto LABEL_40;
      }
    }
    uint64_t v10 = 6;
    id v8 = v24;
LABEL_40:
    id v4 = v26;
    id v11 = v37;
    goto LABEL_41;
  }
LABEL_19:
  [v7 setHardwareInterfaceVendorID:v8];
  [v7 setAudioInputRoute:v10];
  __int16 v19 = *v5;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v41 = "-[CSSiriSpeechRecorder getAudioRouteInstrumentationWithRecordingInfo:]";
    __int16 v42 = 2112;
    id v43 = v7;
    _os_log_debug_impl(&dword_1C9338000, v19, OS_LOG_TYPE_DEBUG, "%s Done getting audio route instrumentation %@.", buf, 0x16u);
  }

  return v7;
}

- (int)convertSISchemaAudioInputRouteToMHRoute:(int)a3 withRecordingInfo:(id)a4
{
  int v4 = a3;
  if ((a3 - 1) >= 0xE)
  {
    uint64_t v5 = [a4 route];
    if ([v5 isEqualToString:*MEMORY[0x1E4F15120]]) {
      int v4 = 15;
    }
    else {
      int v4 = 0;
    }
  }
  return v4;
}

- (void)_speechControllerDidReceiveFirstAudioRecordBufferWithHostTime:(unint64_t)a3 atHostTime:(unint64_t)a4 mhUUID:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = (os_log_t *)MEMORY[0x1E4F4E380];
  uint64_t v10 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v21 = 136315650;
    id v22 = "-[CSSiriSpeechRecorder _speechControllerDidReceiveFirstAudioRecordBufferWithHostTime:atHostTime:mhUUID:]";
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    __int16 v25 = 2048;
    unint64_t v26 = a4;
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s firstBufferStartHostTime = %llu, firstBufferReceiptHostTime = %llu", (uint8_t *)&v21, 0x20u);
  }
  id v11 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  [v11 logEventWithType:229 machAbsoluteTime:a3 context:0 contextNoCopy:1];

  __int16 v12 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  [v12 logEventWithType:230 machAbsoluteTime:a4 context:0 contextNoCopy:1];

  uint64_t v13 = [MEMORY[0x1E4F5D2D0] sharedLogger];
  objc_msgSend(v13, "logMHAssistantDaemonAudioRecordingFirstBufferWithMHUUID:withStartEvent:withFirstBufferStartTimeOffsetNs:withFirstBufferReceiptTimeOffsetNs:", v8, 1, objc_msgSend(MEMORY[0x1E4F5D300], "hostTimeToNs:", a3), 0);

  uint64_t v14 = [MEMORY[0x1E4F5D2D0] sharedLogger];
  objc_msgSend(v14, "logMHAssistantDaemonAudioRecordingFirstBufferWithMHUUID:withStartEvent:withFirstBufferStartTimeOffsetNs:withFirstBufferReceiptTimeOffsetNs:", v8, 0, 0, objc_msgSend(MEMORY[0x1E4F5D300], "hostTimeToNs:", a4));

  self->_didReceiveFirstBuffer = 1;
  self->_firstBufferHostTime = a3;
  [MEMORY[0x1E4F153F8] secondsForHostTime:a3];
  self->_firstBufferTimestamp = v15;
  id v16 = [(CSSiriSpeechRecorder *)self _currentRecordingInfo];
  [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturingDidUpdateRecordingInfo:v16];
  if ([(CSSiriSpeechRecorder *)self _shouldEmitInstrumentation])
  {
    int v17 = [(CSSiriSpeechRecorder *)self getAudioRouteInstrumentationWithRecordingInfo:v16];
    int v18 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    __int16 v19 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo turnIdentifier];
    [v18 logInstrumentation:v17 machAbsoluteTime:a3 turnIdentifier:v19];
  }
  id v20 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315138;
    id v22 = "-[CSSiriSpeechRecorder _speechControllerDidReceiveFirstAudioRecordBufferWithHostTime:atHostTime:mhUUID:]";
    _os_log_impl(&dword_1C9338000, v20, OS_LOG_TYPE_INFO, "%s Done", (uint8_t *)&v21, 0xCu);
  }
}

- (void)speechControllerRecordBufferAvailable:(id)a3 buffers:(id)a4 durationInSec:(float)a5 recordedAt:(unint64_t)a6 audioDeviceInfo:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  int v13 = AFIsInternalInstall();
  uint64_t v14 = (os_log_t *)MEMORY[0x1E4F4E380];
  if (v13)
  {
    double v15 = (id)*MEMORY[0x1E4F4E380];
    os_signpost_id_t v16 = os_signpost_id_generate(*v14);
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v17 = v16;
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9338000, v15, OS_SIGNPOST_EVENT, v17, "SpeechRecorder", "RecordBufferAvailable", buf, 2u);
      }
    }
  }
  kdebug_trace();
  uint64_t v18 = mach_absolute_time();
  if ([(CSSiriSpeechRecordingContext *)self->_context wantsRecordedAudioBufferLogs])
  {
    os_log_t v19 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
    {
      id v20 = v19;
      uint64_t v21 = [v12 count];
      *(_DWORD *)long long buf = 136315906;
      uint64_t v32 = "-[CSSiriSpeechRecorder speechControllerRecordBufferAvailable:buffers:durationInSec:recordedAt:audioDeviceInfo:]";
      __int16 v33 = 2048;
      uint64_t v34 = v21;
      __int16 v35 = 2048;
      double v36 = a5;
      __int16 v37 = 2048;
      unint64_t v38 = a6;
      _os_log_impl(&dword_1C9338000, v20, OS_LOG_TYPE_INFO, "%s buffers.count = %llu, durationInSec = %f, bufferStartHostTime = %llu", buf, 0x2Au);
    }
  }
  queue = self->_queue;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __111__CSSiriSpeechRecorder_speechControllerRecordBufferAvailable_buffers_durationInSec_recordedAt_audioDeviceInfo___block_invoke;
  v25[3] = &unk_1E658C848;
  v25[4] = self;
  id v26 = v11;
  unint64_t v28 = a6;
  uint64_t v29 = v18;
  float v30 = a5;
  id v27 = v12;
  id v23 = v12;
  id v24 = v11;
  dispatch_async(queue, v25);
}

void __111__CSSiriSpeechRecorder_speechControllerRecordBufferAvailable_buffers_durationInSec_recordedAt_audioDeviceInfo___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v2 = AFIsInternalInstall();
  char v3 = (os_log_t *)MEMORY[0x1E4F4E380];
  if (v2)
  {
    int v4 = (id)*MEMORY[0x1E4F4E380];
    os_signpost_id_t v5 = os_signpost_id_generate(*v3);
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v6 = v5;
      if (os_signpost_enabled(v4))
      {
        LOWORD(v31) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9338000, v4, OS_SIGNPOST_EVENT, v6, "SpeechRecorder", "RecordBufferHandleBegin", (uint8_t *)&v31, 2u);
      }
    }
  }
  kdebug_trace();
  id v7 = [*(id *)(a1 + 32) _currentMHUUID:0];
  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = v8[23];
  if (v9)
  {
    if (v9 == 1) {
      [v8 _speechControllerDidStartRecording:*(void *)(a1 + 40) successfully:1 error:0];
    }
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v10 logEventWithType:237 context:0];

    id v11 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    [v11 logMHAssistantDaemonAudioRecordingMissedBufferDetectedWithMHUUID:v7];
  }
  uint64_t v12 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v12 + 200))
  {
    [(id)v12 _speechControllerDidReceiveFirstAudioRecordBufferWithHostTime:*(void *)(a1 + 56) atHostTime:*(void *)(a1 + 64) mhUUID:v7];
    uint64_t v12 = *(void *)(a1 + 32);
  }
  *(void *)(v12 + 384) = *(void *)(a1 + 56);
  *(void *)(*(void *)(a1 + 32) + 392) = *(void *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 32);
  double v14 = *(float *)(a1 + 72);
  double v15 = *(double *)(v13 + 280) + v14;
  if (v15 > 60.0)
  {
    os_log_t v20 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v27 = *(void *)(a1 + 56);
      unint64_t v28 = v20;
      AFMachAbsoluteTimeGetTimeInterval();
      uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 280);
      int v31 = 136316162;
      uint64_t v32 = "-[CSSiriSpeechRecorder speechControllerRecordBufferAvailable:buffers:durationInSec:recordedAt:audioDeviceInf"
            "o:]_block_invoke";
      __int16 v33 = 2048;
      double v34 = v14;
      __int16 v35 = 2048;
      uint64_t v36 = v27;
      __int16 v37 = 2048;
      uint64_t v38 = v30;
      __int16 v39 = 2048;
      uint64_t v40 = v29;
      _os_log_debug_impl(&dword_1C9338000, v28, OS_LOG_TYPE_DEBUG, "%s Dropped %f seconds of audio buffers recorded at %llu (%f seconds) due to audio recording restriction (accumulatedBufferDuration = %f seconds).", (uint8_t *)&v31, 0x34u);

      uint64_t v13 = *(void *)(a1 + 32);
      double v15 = *(double *)(v13 + 280) + *(float *)(a1 + 72);
    }
    *(double *)(v13 + 280) = v15;
  }
  else
  {
    *(double *)(v13 + 280) = v15;
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 56);
    uint64_t v17 = [*(id *)(a1 + 48) count] + v16;
    uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 8);
    uint64_t v19 = *(void *)(a1 + 48);
    [MEMORY[0x1E4F153F8] secondsForHostTime:*(void *)(a1 + 56)];
    objc_msgSend(v18, "speechCapturingDidRecordSpeechPackets:atTimestamp:totalPacketCount:", v19, v17);
    *(void *)(*(void *)(a1 + 32) + 56) = v17;
  }
  if (AFIsATV())
  {
    AFMachAbsoluteTimeGetTimeInterval();
    if (v21 < *(double *)(*(void *)(a1 + 32) + 336))
    {
      id v22 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
      [v22 logEventWithType:218 machAbsoluteTime:*(void *)(a1 + 64) context:0 contextNoCopy:0];

      id v23 = [MEMORY[0x1E4F5D2D0] sharedLogger];
      objc_msgSend(v23, "logMHAssistantDaemonAudioLateBufferDetectedWithMHUUID:withBufferReceiptTimeInNs:", v7, objc_msgSend(MEMORY[0x1E4F5D300], "hostTimeToNs:", *(void *)(a1 + 64)));
    }
  }
  if (AFIsInternalInstall())
  {
    id v24 = *v3;
    os_signpost_id_t v25 = os_signpost_id_generate(*v3);
    if (v25 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v26 = v25;
      if (os_signpost_enabled(v24))
      {
        LOWORD(v31) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9338000, v24, OS_SIGNPOST_EVENT, v26, "SpeechRecorder", "RecordBufferHandleEnd", (uint8_t *)&v31, 2u);
      }
    }
  }
  kdebug_trace();
}

- (void)_speechControllerDidStopRecording:(id)a3 audioDeviceInfo:(id)a4 forReason:(int64_t)a5 estimatedSpeechEndHostTime:(unint64_t)a6 errorCodeOverride:(int64_t)a7 underlyingError:(id)a8
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a8;
  uint64_t v18 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136316162;
    *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecorder _speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpe"
                         "echEndHostTime:errorCodeOverride:underlyingError:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a5;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v53 = a6;
    *(_WORD *)v54 = 2048;
    *(void *)&v54[2] = a7;
    *(_WORD *)&v54[10] = 2112;
    *(void *)&v54[12] = v17;
    _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_INFO, "%s reason = %ld, estimatedSpeechEndHostTime = %llu, errorCodeOverride = %ld, underlyingError = %@", buf, 0x34u);
  }
  int64_t recordingState = self->_recordingState;
  if ((recordingState & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if (!self->_didReceiveLastBuffer) {
      [(CSSiriSpeechRecorder *)self _speechControllerDidReceiveLastAudioRecordBuffer:v15 forReason:a5 estimatedSpeechEndHostTime:a6 isRecordingStopped:1];
    }
    int64_t v46 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
    os_log_t v20 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v20 logEventWithType:215 context:0];

    double v21 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    [v21 logMHAssistantDaemonAudioRecordingContextWithMHUUID:v46 withAudioRecordingStarted:0 withAudioInputRoute:0 withAudioSource:0 withAudioInterfaceVendorId:&stru_1F2396200 withAudioInterfaceProductId:&stru_1F2396200];

    self->_estimatedSpeechEndHostTime = a6;
    self->_int64_t recordingState = 0;
    id v22 = NSStringFromSelector(a2);
    [(CSSiriSpeechRecorder *)self _updateAudioContextToPostVoiceForReason:v22];

    id v23 = NSStringFromSelector(a2);
    [(CSSiriSpeechRecorder *)self _updateAudioDeviceInfo:v16 forReason:v23 forcesUpdate:1];

    if (self->_didDetectEndpoint)
    {
      lastEndpointerMetrics = self->_lastEndpointerMetrics;
      if (lastEndpointerMetrics)
      {
        unint64_t v25 = [(CSEndpointerMetrics *)lastEndpointerMetrics endpointerType];
        if (v25 < 5)
        {
          uint64_t v26 = qword_1C94A6FC8[v25];
          if (!a7) {
            goto LABEL_22;
          }
LABEL_35:
          if (v17)
          {
            uint64_t v50 = *MEMORY[0x1E4F28A50];
            id v51 = v17;
            __int16 v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
          }
          else
          {
            __int16 v37 = 0;
          }
          uint64_t v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4E698] code:a7 userInfo:v37];

LABEL_39:
          [(CSSiriSpeechRecorder *)self _playStopAlertIfNecessaryForReason:a5 endpointMode:v26 error:v29];
          uint64_t v38 = [(CSSiriSpeechRecorder *)self _currentRecordingInfo];
          [v38 setIsEndAlertInfo:1];
          if (AFIsHorseman())
          {
            speechController = self->_speechController;
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke;
            v48[3] = &unk_1E658C758;
            void v48[4] = self;
            id v49 = v38;
            [(CSSpeechController *)speechController fetchAudioMetricsWithCompletion:v48];
          }
          [(CSSiriSpeechRecordingContext *)self->_context didStopRecordingWithError:v29];
          [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturingDidUpdateRecordingInfo:v38];
          if (self->_didDetectEndpoint) {
            uint64_t v40 = self->_lastEndpointerMetrics;
          }
          else {
            uint64_t v40 = 0;
          }
          [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturingDidStopRecordingWithError:v29 endpointMode:v26 totalPacketCount:self->_packetCount endpointerMetrics:v40];
          [(CSEndpointAnalyzer *)self->_endpointAnalyzer reset];
          [(CSSpeechController *)self->_speechController setSpeakerIdDelegate:0];
          if (!v29) {
            [(CSSiriAcousticFingerprinter *)self->_fingerprinter flush];
          }
          audioFileWriter = self->_audioFileWriter;
          if (audioFileWriter)
          {
            *(void *)long long buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            unint64_t v53 = (unint64_t)__Block_byref_object_copy__25501;
            *(void *)v54 = __Block_byref_object_dispose__25502;
            *(void *)&v54[8] = audioFileWriter;
            v47[0] = MEMORY[0x1E4F143A8];
            v47[1] = 3221225472;
            v47[2] = __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke_182;
            v47[3] = &unk_1E658C820;
            v47[4] = self;
            v47[5] = buf;
            [*(id *)&v54[8] flushWithCompletion:v47];
            __int16 v42 = self->_audioFileWriter;
            self->_audioFileWriter = 0;

            _Block_object_dispose(buf, 8);
          }
          [(CSSiriSpeechRecordingContext *)self->_context endRecordingAudio];
          *(_WORD *)&self->_needsAVVCLPCMCallbacks = 0;
          context = self->_context;
          self->_context = 0;

          uint64_t v44 = *MEMORY[0x1E4F4E380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
          {
            uint64_t v45 = self->_context;
            *(_DWORD *)long long buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecorder _speechControllerDidStopRecording:audioDeviceInfo:forReason:esti"
                                 "matedSpeechEndHostTime:errorCodeOverride:underlyingError:]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v45;
            _os_log_impl(&dword_1C9338000, v44, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
          }

          goto LABEL_51;
        }
        uint64_t v26 = 0;
        if (a7) {
          goto LABEL_35;
        }
LABEL_22:
        a7 = 208;
        switch(a5)
        {
          case -11791:
            unint64_t v28 = [MEMORY[0x1E4F5D2A0] sharedInstance];
            [v28 submitAudioIssueReport:*MEMORY[0x1E4F5D540]];

            a7 = 235;
            goto LABEL_35;
          case -11790:
            uint64_t v32 = [MEMORY[0x1E4F5D2A0] sharedInstance];
            [v32 submitAudioIssueReport:*MEMORY[0x1E4F5D560]];

            a7 = 230;
            goto LABEL_35;
          case -11789:
LABEL_27:
            int v31 = [MEMORY[0x1E4F5D2A0] sharedInstance];
            [v31 submitAudioIssueReport:*MEMORY[0x1E4F5D580]];

            a7 = 201;
            goto LABEL_35;
          case -11788:
            __int16 v33 = [MEMORY[0x1E4F5D2A0] sharedInstance];
            [v33 submitAudioIssueReport:*MEMORY[0x1E4F5D4F0]];

            a7 = 202;
            goto LABEL_35;
          case -11787:
            double v34 = [MEMORY[0x1E4F5D2A0] sharedInstance];
            [v34 submitAudioIssueReport:*MEMORY[0x1E4F5D538]];

            a7 = 220;
            goto LABEL_35;
          case -11786:
            goto LABEL_35;
          case -11785:
            __int16 v35 = [MEMORY[0x1E4F5D2A0] sharedInstance];
            [v35 submitAudioIssueReport:*MEMORY[0x1E4F5D550]];

            a7 = 228;
            goto LABEL_35;
          case -11784:
            uint64_t v36 = [MEMORY[0x1E4F5D2A0] sharedInstance];
            [v36 submitAudioIssueReport:*MEMORY[0x1E4F5D568]];

            a7 = 229;
            goto LABEL_35;
          default:
            uint64_t v29 = 0;
            switch(a5)
            {
              case 0:
              case 2:
                goto LABEL_39;
              case 1:
                uint64_t v30 = [MEMORY[0x1E4F5D2A0] sharedInstance];
                [v30 submitAudioIssueReport:*MEMORY[0x1E4F5D508]];

                a7 = 232;
                goto LABEL_35;
              case 3:
              case 4:
                goto LABEL_27;
              case 5:
                a7 = 233;
                goto LABEL_35;
              case 6:
                a7 = 234;
                goto LABEL_35;
              default:
                if (a5 != 1919115630) {
                  goto LABEL_27;
                }
                break;
            }
            break;
        }
        goto LABEL_39;
      }
    }
    else if (!self->_serverDidEndpoint)
    {
      if (a5 == -11789) {
        uint64_t v26 = 1;
      }
      else {
        uint64_t v26 = 2 * (a5 == 0);
      }
      if (a7) {
        goto LABEL_35;
      }
      goto LABEL_22;
    }
    uint64_t v26 = 1;
    if (a7) {
      goto LABEL_35;
    }
    goto LABEL_22;
  }
  uint64_t v27 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecorder _speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpe"
                         "echEndHostTime:errorCodeOverride:underlyingError:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = recordingState;
    _os_log_error_impl(&dword_1C9338000, v27, OS_LOG_TYPE_ERROR, "%s Ignoring unexpected didStop callback while in state %ld", buf, 0x16u);
  }
LABEL_51:
}

void __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke_2;
  v6[3] = &unk_1E658D4B0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke_182(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(NSObject **)(v8 + 16);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke_2_183;
  v13[3] = &unk_1E658C7F8;
  void v13[4] = v8;
  id v14 = v6;
  uint64_t v10 = *(void *)(a1 + 40);
  id v15 = v7;
  uint64_t v16 = v10;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v13);
}

void __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke_2_183(void *a1)
{
  [*(id *)(a1[4] + 8) speechCapturing:a1[4] didFinishWritingAudioFile:a1[5] error:a1[6]];
  uint64_t v2 = *(void *)(a1[7] + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __145__CSSiriSpeechRecorder__speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime_errorCodeOverride_underlyingError___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  id v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[CSSiriSpeechRecorder _speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpeechEndHostTime:e"
         "rrorCodeOverride:underlyingError:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s audioMetrics = %@", (uint8_t *)&v6, 0x16u);
  }
  int v4 = [v2 objectForKey:*MEMORY[0x1E4F15308]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 objectForKey:*MEMORY[0x1E4F15320]];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(*(id *)(a1 + 40), "setAudioSessionSetActiveEndHostTime:", objc_msgSend(v5, "unsignedLongLongValue"));
    }
  }
}

- (void)speechControllerDidStopRecording:(id)a3 audioDeviceInfo:(id)a4 forReason:(int64_t)a5 estimatedSpeechEndHostTime:(unint64_t)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  kdebug_trace();
  id v12 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v27 = "-[CSSiriSpeechRecorder speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpeechEndHostTime:]";
    __int16 v28 = 2048;
    int64_t v29 = a5;
    __int16 v30 = 2048;
    unint64_t v31 = a6;
    _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s reason = %ld, estimatedSpeechEndHostTime = %llu", buf, 0x20u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __110__CSSiriSpeechRecorder_speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime___block_invoke;
  block[3] = &unk_1E658D4B0;
  void block[4] = self;
  id v14 = v10;
  id v25 = v14;
  dispatch_async(queue, block);
  recordingWillStartGroup = self->_recordingWillStartGroup;
  uint64_t v16 = self->_queue;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __110__CSSiriSpeechRecorder_speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime___block_invoke_178;
  v19[3] = &unk_1E658C7D0;
  v19[4] = self;
  id v20 = v14;
  id v21 = v11;
  int64_t v22 = a5;
  unint64_t v23 = a6;
  id v17 = v11;
  id v18 = v14;
  dispatch_group_notify(recordingWillStartGroup, v16, v19);
}

void __110__CSSiriSpeechRecorder_speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 32) == *(void *)(a1 + 40) && *(void *)(v1 + 184) == 1)
  {
    id v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      int v6 = "-[CSSiriSpeechRecorder speechControllerDidStopRecording:audioDeviceInfo:forReason:estimatedSpeechEndHostTime:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s Synthesizing a didStart callback, on missing didStart", (uint8_t *)&v5, 0xCu);
    }
    int v4 = [MEMORY[0x1E4F4E478] errorWithCode:217];
    [*(id *)(a1 + 32) _speechControllerDidStartRecording:*(void *)(a1 + 40) successfully:0 error:v4];
  }
}

uint64_t __110__CSSiriSpeechRecorder_speechControllerDidStopRecording_audioDeviceInfo_forReason_estimatedSpeechEndHostTime___block_invoke_178(void *a1)
{
  if (AFIsInternalInstall())
  {
    id v2 = (os_log_t *)MEMORY[0x1E4F4E380];
    id v3 = (id)*MEMORY[0x1E4F4E380];
    os_signpost_id_t v4 = os_signpost_id_generate(*v2);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)id v12 = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9338000, v3, OS_SIGNPOST_EVENT, v5, "SpeechRecorder", "AudioStop", v12, 2u);
      }
    }
  }
  kdebug_trace();
  int v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = a1[6];
  uint64_t v9 = a1[7];
  uint64_t v10 = a1[8];
  return [v6 _speechControllerDidStopRecording:v7 audioDeviceInfo:v8 forReason:v9 estimatedSpeechEndHostTime:v10 errorCodeOverride:0 underlyingError:0];
}

- (void)speechControllerDidDeliverLastBuffer:(id)a3 forReason:(int64_t)a4 estimatedSpeechEndHostTime:(unint64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    id v18 = "-[CSSiriSpeechRecorder speechControllerDidDeliverLastBuffer:forReason:estimatedSpeechEndHostTime:]";
    __int16 v19 = 2048;
    int64_t v20 = a4;
    __int16 v21 = 2048;
    unint64_t v22 = a5;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s reason = %ld, estimatedSpeechEndHostTime = %llu", buf, 0x20u);
  }
  recordingWillStartGroup = self->_recordingWillStartGroup;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__CSSiriSpeechRecorder_speechControllerDidDeliverLastBuffer_forReason_estimatedSpeechEndHostTime___block_invoke;
  v13[3] = &unk_1E658C7A8;
  void v13[4] = self;
  id v14 = v8;
  int64_t v15 = a4;
  unint64_t v16 = a5;
  id v12 = v8;
  dispatch_group_notify(recordingWillStartGroup, queue, v13);
}

uint64_t __98__CSSiriSpeechRecorder_speechControllerDidDeliverLastBuffer_forReason_estimatedSpeechEndHostTime___block_invoke(void *a1)
{
  uint64_t result = a1[4];
  if (!*(unsigned char *)(result + 201)) {
    return [(id)result _speechControllerDidReceiveLastAudioRecordBuffer:a1[5] forReason:a1[6] estimatedSpeechEndHostTime:a1[7] isRecordingStopped:*(void *)(result + 184) == 0];
  }
  return result;
}

- (void)_speechControllerDidStartRecording:(id)a3 successfully:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  *(void *)&v85[13] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = AFIsInternalInstall();
  id v11 = (os_log_t *)MEMORY[0x1E4F4E380];
  if (v10)
  {
    id v12 = (id)*MEMORY[0x1E4F4E380];
    os_signpost_id_t v13 = os_signpost_id_generate(*v11);
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v14 = v13;
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9338000, v12, OS_SIGNPOST_EVENT, v14, "SpeechRecorder", "AudioStart", buf, 2u);
      }
    }
  }
  kdebug_trace();
  uint64_t v15 = mach_absolute_time();
  unint64_t v16 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    v83 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
    __int16 v84 = 1024;
    *(_DWORD *)v85 = v6;
    v85[2] = 2112;
    *(void *)&v85[3] = v9;
    _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_INFO, "%s success = %d, error = %@", buf, 0x1Cu);
  }
  v80 = v8;
  dispatch_group_leave((dispatch_group_t)self->_recordingWillStartGroup);
  id v17 = [(CSSiriSpeechRecorder *)self _currentRecordingInfo];
  context = self->_context;
  __int16 v19 = [v17 deviceInfo];
  [(CSSiriSpeechRecordingContext *)context updateAudioRecordDeviceInfo:v19];

  int64_t v20 = self->_context;
  __int16 v21 = [v17 voiceTriggerEventInfo];
  [(CSSiriSpeechRecordingContext *)v20 updateVoiceTriggerInfo:v21];

  [(CSSiriSpeechRecordingContext *)self->_context updateRecordingInfo:v17];
  if (!v6) {
    [(CSSiriSpeechRecordingContext *)self->_context didStopRecordingWithError:v9];
  }
  v81 = v9;
  unint64_t v22 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
  uint64_t v23 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  id v24 = CSAnalyticsContextCreateWithRecordingInfo(v17);
  [v23 logEventWithType:213 machAbsoluteTime:v15 context:v24];

  id v25 = [(CSSiriSpeechRecorder *)self getAudioRouteInstrumentationWithRecordingInfo:v17];
  uint64_t v26 = -[CSSiriSpeechRecorder convertSISchemaAudioInputRouteToMHRoute:withRecordingInfo:](self, "convertSISchemaAudioInputRouteToMHRoute:withRecordingInfo:", [v25 audioInputRoute], v17);
  v79 = v25;
  uint64_t v27 = [v25 hardwareInterfaceVendorID];
  __int16 v28 = [MEMORY[0x1E4F5D2D0] sharedLogger];
  uint64_t v29 = [v17 mhSource];
  __int16 v30 = [v27 interfaceVendorID];
  v78 = v27;
  unint64_t v31 = [v27 interfaceProductID];
  [v28 logMHAssistantDaemonAudioRecordingContextWithMHUUID:v22 withAudioRecordingStarted:1 withAudioInputRoute:v26 withAudioSource:v29 withAudioInterfaceVendorId:v30 withAudioInterfaceProductId:v31];

  uint64_t v32 = [v17 codec];
  uint64_t v33 = [v17 voiceTriggerEventInfo];
  double v34 = 0.0;
  if (!v33) {
    goto LABEL_13;
  }
  __int16 v35 = (void *)v33;
  uint64_t v36 = [v17 voiceTriggerEventInfo];
  uint64_t v37 = *MEMORY[0x1E4F5D800];
  uint64_t v38 = [v36 objectForKeyedSubscript:*MEMORY[0x1E4F5D800]];

  if (v38)
  {
    __int16 v39 = [v17 voiceTriggerEventInfo];
    uint64_t v40 = [v39 objectForKeyedSubscript:v37];
    uint64_t v41 = [v40 longLongValue];

    [MEMORY[0x1E4F5D278] inputRecordingSampleRate];
    double v34 = (double)v41 / v42;
  }
  else
  {
LABEL_13:
    uint64_t v41 = 0;
  }
  self->_skippedSamplesTimeInSec = v34;
  id v43 = [MEMORY[0x1E4F5D2D0] sharedLogger];
  [v43 logMHASRAudioConfigureStartedWithMHUUID:v22 withAudioCodecString:v32 withAudioSkippedNumSamples:v41];

  uint64_t v44 = [MEMORY[0x1E4F5D2D0] sharedLogger];
  *(float *)&double v45 = v34;
  objc_msgSend(v44, "logMHASRAudioConfigureStartedWithMHUUID:withAudioCodecString:withAudioSkippedTimeInNs:", v22, v32, objc_msgSend(MEMORY[0x1E4F5D300], "secondsToNs:", v45));

  int64_t v46 = [v17 voiceTriggerEventInfo];
  [(CSSiriSpeechRecorder *)self _logVoiceTriggerInfo:v46 withMHUUID:v22];

  int64_t v47 = 2;
  if (!v6) {
    int64_t v47 = 0;
  }
  self->_int64_t recordingState = v47;
  self->_accumulatedBufferDuration = 0.0;
  self->_packetCount = 0;
  *(_DWORD *)&self->_didReceiveFirstBuffer = 0;
  self->_BOOL didFakeTwoShotWithAlert = 0;
  *(_DWORD *)&self->_serverDidRecognizeSpeech = 0;
  *(_WORD *)&self->_BOOL wasCanceled = 0;
  self->_firstBufferHostTime = 0;
  self->_estimatedSpeechEndHostTime = 0;
  self->_firstBufferTimestamp = 0.0;
  self->_isRecordingUsingBTRoute = [v17 isBluetooth];
  self->_twoShotStartTime = 0.0;
  *(_WORD *)&self->_didPerformTwoShotPrompt = 0;
  fakeTwoShotTTSPromptUUID = self->_fakeTwoShotTTSPromptUUID;
  self->_fakeTwoShotTTSPromptUUID = 0;

  [(AFWatchdogTimer *)self->_fakeTwoShotTTSPromptWatchdogTimer cancel];
  fakeTwoShotTTSPromptWatchdogTimer = self->_fakeTwoShotTTSPromptWatchdogTimer;
  self->_fakeTwoShotTTSPromptWatchdogTimer = 0;

  self->_lastAudioRecordBufferStartTime = 0;
  self->_lastAudioRecordBufferReceiptTime = 0;
  lastEndpointerMetrics = self->_lastEndpointerMetrics;
  self->_lastEndpointerMetrics = 0;

  self->_stopRecordingReason = 0;
  self->_stopRecordingMachContinuousTime = 0;
  speechRecognizedContextForServerEndpointInstrumentation = self->_speechRecognizedContextForServerEndpointInstrumentation;
  self->_speechRecognizedContextForServerEndpointInstrumentation = 0;

  if (![MEMORY[0x1E4F5D450] isMedocFeatureEnabled]
    || !self->_shouldDisableSpeechPacketGeneration)
  {
    v52 = [CSEndpointDelayReporter alloc];
    unint64_t v53 = [v22 UUIDString];
    v54 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo turnIdentifier];
    uint64_t v55 = [(CSEndpointDelayReporter *)v52 initWithRequestMHUUID:v53 turnIdentifier:v54];
    endpointDelayReporter = self->_endpointDelayReporter;
    self->_endpointDelayReporter = v55;
  }
  v57 = v80;
  if (AFIsATV())
  {
    v58 = [v80 recordSettings];
    __int16 v59 = v58;
    if (v58)
    {
      int64_t v60 = [v58 objectForKey:*MEMORY[0x1E4F151E0]];
      int v61 = [v60 intValue];

      self->_isOpus = v61 == 1869641075;
      double v62 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
      {
        v76 = @"Speex";
        if (v61 == 1869641075) {
          v76 = @"Opus";
        }
        *(_DWORD *)long long buf = 136315394;
        v83 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
        __int16 v84 = 2112;
        *(void *)v85 = v76;
        _os_log_debug_impl(&dword_1C9338000, v62, OS_LOG_TYPE_DEBUG, "%s SPELLING recordSettings codec=%@", buf, 0x16u);
      }
    }

    v57 = v80;
  }
  if ([v81 code] == 216)
  {
    uint64_t v63 = [v81 domain];
    unsigned int v64 = [v63 isEqualToString:*MEMORY[0x1E4F4E698]];

    if (!v6)
    {
LABEL_25:
      v65 = [MEMORY[0x1E4F4E478] errorWithCode:200 description:0 underlyingError:v81];
      goto LABEL_28;
    }
  }
  else
  {
    unsigned int v64 = 0;
    if (!v6) {
      goto LABEL_25;
    }
  }
  v65 = 0;
LABEL_28:
  v66 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    delegate = self->_delegate;
    *(_DWORD *)long long buf = 136315394;
    v83 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
    __int16 v84 = 2112;
    *(void *)v85 = delegate;
    _os_log_impl(&dword_1C9338000, v66, OS_LOG_TYPE_INFO, "%s Sending speech did start to delegate %@", buf, 0x16u);
  }
  [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturingDidStartRecordingSuccessfully:v6 error:v65 withInfo:v17];
  if (!(v6 | v64))
  {
    v68 = NSStringFromSelector(a2);
    [(CSSiriSpeechRecorder *)self _updateAudioContextToPostVoiceForReason:v68];

    if (![(CSSiriAudioActivationInfo *)self->_currentActivationInfo shouldSuppressRecordingErrorAlert])[(CSSiriSpeechRecorder *)self _playAudioAlert:3]; {
    v69 = NSStringFromSelector(a2);
    }
    [(CSSiriSpeechRecorder *)self _updateAudioContextWithPendingInfoForReason:v69];

    if ([v81 code] != -11786
      || ([v81 domain],
          v70 = objc_claimAutoreleasedReturnValue(),
          char v71 = [v70 isEqualToString:*MEMORY[0x1E4F28760]],
          v70,
          (v71 & 1) == 0))
    {
      v72 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        v83 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
        _os_log_impl(&dword_1C9338000, v72, OS_LOG_TYPE_INFO, "%s Resetting VoiceController on startRecording failure", buf, 0xCu);
      }
      [(CSSiriSpeechRecorder *)self _resetSpeechController];
    }
  }
  [(CSSiriSpeechRecorder *)self _setupAudioFileWritingForSpeechController:v57 info:self->_currentActivationInfo context:self->_context];
  if CSIsWatch() && ([MEMORY[0x1E4F5D450] isM9Device])
  {
    v73 = (os_log_t *)MEMORY[0x1E4F4E380];
    v74 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v83 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
      _os_log_impl(&dword_1C9338000, v74, OS_LOG_TYPE_INFO, "%s Skip bluetooth state logging for M9 watch", buf, 0xCu);
    }
  }
  else
  {
    [(CSSiriSpeechRecorder *)self _logBluetoothStateWithMHUUID:v22];
    v73 = (os_log_t *)MEMORY[0x1E4F4E380];
  }
  v75 = *v73;
  if (os_log_type_enabled(*v73, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v83 = "-[CSSiriSpeechRecorder _speechControllerDidStartRecording:successfully:error:]";
    _os_log_impl(&dword_1C9338000, v75, OS_LOG_TYPE_INFO, "%s Done", buf, 0xCu);
  }
}

- (void)speechControllerDidStartRecording:(id)a3 audioDeviceInfo:(id)a4 successfully:(BOOL)a5 error:(id)a6
{
  BOOL v7 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  os_signpost_id_t v13 = *MEMORY[0x1E4F4E380];
  os_signpost_id_t v14 = *MEMORY[0x1E4F4E380];
  if (v7)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v25 = "-[CSSiriSpeechRecorder speechControllerDidStartRecording:audioDeviceInfo:successfully:error:]";
      _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    id v25 = "-[CSSiriSpeechRecorder speechControllerDidStartRecording:audioDeviceInfo:successfully:error:]";
    __int16 v26 = 2114;
    id v27 = v12;
    _os_log_error_impl(&dword_1C9338000, v13, OS_LOG_TYPE_ERROR, "%s %{public}@", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__CSSiriSpeechRecorder_speechControllerDidStartRecording_audioDeviceInfo_successfully_error___block_invoke;
  block[3] = &unk_1E658C780;
  void block[4] = self;
  id v20 = v10;
  BOOL v23 = v7;
  id v21 = v12;
  id v22 = v11;
  id v16 = v11;
  id v17 = v12;
  id v18 = v10;
  dispatch_async(queue, block);
}

uint64_t __93__CSSiriSpeechRecorder_speechControllerDidStartRecording_audioDeviceInfo_successfully_error___block_invoke(uint64_t result)
{
  uint64_t v1 = (void *)result;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(result + 32);
  if (v2[23] == 1)
  {
    uint64_t v3 = *(unsigned __int8 *)(result + 64);
    uint64_t v4 = *(void *)(result + 40);
    uint64_t v5 = *(void *)(result + 48);
    BOOL v6 = *(void **)(result + 32);
    return [v6 _speechControllerDidStartRecording:v4 successfully:v3 error:v5];
  }
  else if (!*(unsigned char *)(result + 64))
  {
    BOOL v7 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      id v9 = "-[CSSiriSpeechRecorder speechControllerDidStartRecording:audioDeviceInfo:successfully:error:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s Got a speech start failure after we already got audio buffers?!", (uint8_t *)&v8, 0xCu);
      id v2 = (void *)v1[4];
    }
    return [v2 _speechControllerDidStopRecording:v1[5] audioDeviceInfo:v1[7] forReason:0 estimatedSpeechEndHostTime:0 errorCodeOverride:200 underlyingError:v1[6]];
  }
  return result;
}

- (id)_recordingInfoForEvent:(int64_t)a3 audioAlertStyle:(int64_t)a4 includeBTInfo:(BOOL)a5 includeRecordDeviceInfo:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v11 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v12 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    os_signpost_id_t v13 = v12;
    os_signpost_id_t v14 = AFSpeechEventGetDescription();
    *(_DWORD *)long long buf = 136316418;
    id v43 = "-[CSSiriSpeechRecorder _recordingInfoForEvent:audioAlertStyle:includeBTInfo:includeRecordDeviceInfo:]";
    __int16 v44 = 2048;
    int64_t v45 = a3;
    __int16 v46 = 2112;
    int64_t v47 = v14;
    __int16 v48 = 2048;
    int64_t v49 = a4;
    __int16 v50 = 1024;
    BOOL v51 = v7;
    __int16 v52 = 1024;
    BOOL v53 = v6;
    _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_INFO, "%s Creating recording info (speechEvent = %ld (%@), audioAlertStyle = %ld, includeBTInfo = %d, includeRecordDeviceInfo = %d)", buf, 0x36u);
  }
  if (v6)
  {
    uint64_t v15 = [(CSSiriSpeechRecorder *)self _currentRecordDeviceInfo];
  }
  else
  {
    uint64_t v15 = 0;
  }
  id v16 = [v15 route];
  id v17 = v16;
  BOOL v40 = v7;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [(CSSiriSpeechRecorder *)self _currentRecordRoute];
  }
  uint64_t v37 = v18;
  uint64_t v38 = v15;
  int64_t v41 = a4;

  uint64_t v36 = [(CSSiriSpeechRecorder *)self _currentPlaybackRoute];
  int64_t v39 = a3;
  int IsVoiceTrigger = AFSpeechEventIsVoiceTrigger();
  unint64_t v20 = [(CSSpeechController *)self->_speechController alertStartTime];
  id v21 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v43 = "-[CSSiriSpeechRecorder _recordingInfoForEvent:audioAlertStyle:includeBTInfo:includeRecordDeviceInfo:]";
    __int16 v44 = 2048;
    int64_t v45 = v20;
    _os_log_impl(&dword_1C9338000, v21, OS_LOG_TYPE_INFO, "%s alertStartTime = %llu", buf, 0x16u);
  }
  [MEMORY[0x1E4F153F8] secondsForHostTime:v20];
  double v23 = v22;
  id v24 = [CSSiriRecordingInfo alloc];
  int64_t speechCapturingMode = self->_speechCapturingMode;
  BOOL v27 = speechCapturingMode == 3 || speechCapturingMode == 5;
  uint64_t v28 = [(CSSpeechController *)self->_speechController recordSettings];
  unsigned int v29 = [(CSSiriSpeechRecorder *)self _audioDeviceID];
  unsigned int v30 = [(CSSiriSpeechRecorder *)self _audioSessionID];
  if (IsVoiceTrigger)
  {
    unint64_t v31 = [(CSSpeechController *)self->_speechController voiceTriggerInfo];
  }
  else
  {
    unint64_t v31 = 0;
  }
  LOBYTE(v35) = v40;
  uint64_t v32 = -[CSSiriRecordingInfo initWithDictation:fingerprintOnly:secureOfflineOnly:audioAlertStyle:recordSettings:recordRoute:recordDeviceInfo:playbackRoute:audioDeviceID:audioSessionID:voiceTriggerEventInfo:activationAlertStartTimestamp:startRecordingTimestamp:firstBufferTimestamp:firstBufferHostTime:estimatedSpeechEndHostTime:deviceIdentifier:includeBTInfo:speechEvent:](v24, "initWithDictation:fingerprintOnly:secureOfflineOnly:audioAlertStyle:recordSettings:recordRoute:recordDeviceInfo:playbackRoute:audioDeviceID:audioSessionID:voiceTriggerEventInfo:activationAlertStartTimestamp:startRecordingTimestamp:firstBufferTimestamp:firstBufferHostTime:estimatedSpeechEndHostTime:deviceIdentifier:includeBTInfo:speechEvent:", (speechCapturingMode & 0xFFFFFFFFFFFFFFFELL) == 2, speechCapturingMode == 4, v27, v41, v28, v37, v23, self->_startRecordingTimestamp, self->_firstBufferTimestamp, v38, v36, __PAIR64__(v30, v29), v31, self->_firstBufferHostTime, self->_estimatedSpeechEndHostTime,
          self->_recordDevice,
          v35,
          v39);
  if (IsVoiceTrigger) {

  }
  uint64_t v33 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    id v43 = "-[CSSiriSpeechRecorder _recordingInfoForEvent:audioAlertStyle:includeBTInfo:includeRecordDeviceInfo:]";
    __int16 v44 = 2112;
    int64_t v45 = (int64_t)v32;
    _os_log_impl(&dword_1C9338000, v33, OS_LOG_TYPE_INFO, "%s Done creating recording info %@.", buf, 0x16u);
  }

  return v32;
}

- (id)_currentRecordingInfo
{
  int64_t v3 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo speechEvent];
  int64_t v4 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo audioAlertStyle];
  return [(CSSiriSpeechRecorder *)self _recordingInfoForEvent:v3 audioAlertStyle:v4 includeBTInfo:1 includeRecordDeviceInfo:1];
}

- (void)_updateAudioDeviceInfo:(id)a3 forReason:(id)a4 forcesUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  int v8 = (CSFAudioDeviceInfo *)a3;
  id v9 = a4;
  if (v8 || (self->_currentAudioDeviceInfo ? (BOOL v10 = !v5) : (BOOL v10 = 0), !v10))
  {
    id v11 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
    id v12 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v12 logEventWithType:209 context:0];

    os_signpost_id_t v13 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    [v13 logMHAssistantDaemonAudioFetchRouteContextWithMHUUID:v11 withFetchRouteContextStarted:1];

    kdebug_trace();
    mach_absolute_time();
    os_signpost_id_t v14 = (os_log_t *)MEMORY[0x1E4F4E380];
    uint64_t v15 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315906;
      id v43 = "-[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:]";
      __int16 v44 = 2112;
      int64_t v45 = v8;
      __int16 v46 = 2112;
      id v47 = v9;
      __int16 v48 = 1024;
      BOOL v49 = v5;
      _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_INFO, "%s Begin updating audio device info %@. (reason = %@, forcesUpdate = %d)", buf, 0x26u);
    }
    if (v8)
    {
      id v16 = (CSFAudioDeviceInfo *)[(CSFAudioDeviceInfo *)v8 copy];
      currentAudioDeviceInfo = self->_currentAudioDeviceInfo;
      self->_currentAudioDeviceInfo = v16;
    }
    else
    {
      id v18 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v43 = "-[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:]";
        _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_INFO, "%s Fetching audio device info from CSSpeechController...", buf, 0xCu);
      }
      __int16 v19 = [(CSSpeechController *)self->_speechController audioDeviceInfo];
      unint64_t v20 = (CSFAudioDeviceInfo *)[v19 copy];
      id v21 = self->_currentAudioDeviceInfo;
      self->_currentAudioDeviceInfo = v20;

      double v22 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v43 = "-[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:]";
        _os_log_impl(&dword_1C9338000, v22, OS_LOG_TYPE_INFO, "%s Done fetching audio device info from CSSpeechController.", buf, 0xCu);
      }
    }
    os_log_t v23 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_INFO))
    {
      id v24 = self->_currentAudioDeviceInfo;
      id v25 = v23;
      mach_absolute_time();
      AFMachAbsoluteTimeGetTimeInterval();
      *(_DWORD *)long long buf = 136315650;
      id v43 = "-[CSSiriSpeechRecorder _updateAudioDeviceInfo:forReason:forcesUpdate:]";
      __int16 v44 = 2112;
      int64_t v45 = v24;
      __int16 v46 = 2048;
      id v47 = v26;
      _os_log_impl(&dword_1C9338000, v25, OS_LOG_TYPE_INFO, "%s End updating audio device info %@. (duration = %f)", buf, 0x20u);
    }
    kdebug_trace();
    BOOL v27 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    uint64_t v28 = [(CSFAudioDeviceInfo *)self->_currentAudioDeviceInfo recordDeviceInfo];
    uint64_t v29 = [v28 route];
    unsigned int v30 = (void *)v29;
    if (v29) {
      unint64_t v31 = (__CFString *)v29;
    }
    else {
      unint64_t v31 = @"Unavailable";
    }
    v41[0] = v31;
    v40[1] = @"playbackRoute";
    uint64_t v32 = [(CSFAudioDeviceInfo *)self->_currentAudioDeviceInfo playbackRoute];
    uint64_t v33 = (void *)v32;
    if (v32) {
      double v34 = (__CFString *)v32;
    }
    else {
      double v34 = @"Unavailable";
    }
    v41[1] = v34;
    v40[2] = @"playbackDeviceTypes";
    uint64_t v35 = [(CSFAudioDeviceInfo *)self->_currentAudioDeviceInfo playbackDeviceTypeList];
    uint64_t v36 = (void *)v35;
    if (v35) {
      uint64_t v37 = (__CFString *)v35;
    }
    else {
      uint64_t v37 = @"Unavailable";
    }
    v41[2] = v37;
    uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:3];
    [v27 logEventWithType:210 context:v38];

    int64_t v39 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    [v39 logMHAssistantDaemonAudioFetchRouteContextWithMHUUID:v11 withFetchRouteContextStarted:0];

    if (objc_opt_respondsToSelector()) {
      [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturingDidUpdateAudioDeviceInfo:self->_currentAudioDeviceInfo];
    }
  }
}

- (id)_currentPlaybackRoute
{
  int64_t v3 = NSStringFromSelector(a2);
  [(CSSiriSpeechRecorder *)self _updateAudioDeviceInfo:0 forReason:v3 forcesUpdate:0];

  currentAudioDeviceInfo = self->_currentAudioDeviceInfo;
  return [(CSFAudioDeviceInfo *)currentAudioDeviceInfo playbackRoute];
}

- (id)_currentRecordDeviceInfo
{
  int64_t v3 = NSStringFromSelector(a2);
  [(CSSiriSpeechRecorder *)self _updateAudioDeviceInfo:0 forReason:v3 forcesUpdate:0];

  currentAudioDeviceInfo = self->_currentAudioDeviceInfo;
  return [(CSFAudioDeviceInfo *)currentAudioDeviceInfo recordDeviceInfo];
}

- (id)_currentRecordRoute
{
  id v2 = [(CSSiriSpeechRecorder *)self _currentRecordDeviceInfo];
  int64_t v3 = [v2 route];

  return v3;
}

- (void)updateASRFeatures:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSiriSpeechRecorder *)self _speechController];
  [v5 processASRFeatures:v4];
}

- (void)playRecordingStartAlert
{
  recordingWillStartGroup = self->_recordingWillStartGroup;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CSSiriSpeechRecorder_playRecordingStartAlert__block_invoke;
  block[3] = &unk_1E658D4D8;
  void block[4] = self;
  dispatch_group_notify(recordingWillStartGroup, queue, block);
}

void __47__CSSiriSpeechRecorder_playRecordingStartAlert__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 184) == 2 && [*(id *)(v1 + 104) shouldPlayAlertIfNotPrelistening])
  {
    int64_t v3 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      id v12 = "-[CSSiriSpeechRecorder playRecordingStartAlert]_block_invoke";
      _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    dispatch_group_t v4 = (dispatch_group_t)*(id *)(*(void *)(a1 + 32) + 464);
    if (!v4)
    {
      dispatch_group_t v4 = dispatch_group_create();
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 464), v4);
    }
    dispatch_group_enter(v4);
    id v5 = *(id *)(*(void *)(a1 + 32) + 96);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__CSSiriSpeechRecorder_playRecordingStartAlert__block_invoke_152;
    v8[3] = &unk_1E658D4B0;
    id v9 = v5;
    dispatch_group_t v10 = v4;
    BOOL v6 = v4;
    id v7 = v5;
    AudioServicesPlaySystemSoundWithCompletion(0x57Cu, v8);
  }
}

void __47__CSSiriSpeechRecorder_playRecordingStartAlert__block_invoke_152(uint64_t a1)
{
  [*(id *)(a1 + 32) instrumentSiriCue:3];
  id v2 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v2);
}

- (void)getLastStartpointTimestampAndCurrentTime:(id)a3
{
  id v5 = (void (**)(void))a3;
  dispatch_group_t v4 = [MEMORY[0x1E4F28F80] processInfo];
  [v4 systemUptime];

  if (v5)
  {
    [(CSEndpointAnalyzer *)self->_endpointAnalyzer lastStartOfVoiceActivityTime];
    v5[2]();
  }
}

- (void)setClientConfiguration:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[CSSiriSpeechRecorder setClientConfiguration:]";
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s clientConfiguration = %@", (uint8_t *)&v8, 0x16u);
  }
  BOOL v6 = (AFClientConfiguration *)[v4 copy];
  currentClientConfiguration = self->_currentClientConfiguration;
  self->_currentClientConfiguration = v6;

  [(CSSiriAudioActivationInfo *)self->_currentActivationInfo setClientConfiguration:self->_currentClientConfiguration];
  [(CSSiriAudioActivationInfo *)self->_pendingActivationInfo setClientConfiguration:self->_currentClientConfiguration];
}

- (id)_speechRecordingEventListener
{
  return [(NSXPCConnection *)self->_speechRecordingEventListenerConnection remoteObjectProxyWithErrorHandler:&__block_literal_global_151];
}

void __53__CSSiriSpeechRecorder__speechRecordingEventListener__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int64_t v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[CSSiriSpeechRecorder _speechRecordingEventListener]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_error_impl(&dword_1C9338000, v3, OS_LOG_TYPE_ERROR, "%s %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setSpeechRecordingEventListeningEndpoint:(id)a3
{
  id v4 = a3;
  speechRecordingEventListenerConnection = self->_speechRecordingEventListenerConnection;
  id v11 = v4;
  if (speechRecordingEventListenerConnection)
  {
    [(NSXPCConnection *)speechRecordingEventListenerConnection invalidate];
    __int16 v6 = self->_speechRecordingEventListenerConnection;
    self->_speechRecordingEventListenerConnection = 0;

    id v4 = v11;
  }
  if (v4)
  {
    id v7 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithListenerEndpoint:v11];
    uint64_t v8 = self->_speechRecordingEventListenerConnection;
    self->_speechRecordingEventListenerConnection = v7;

    id v9 = self->_speechRecordingEventListenerConnection;
    __int16 v10 = AFSpeechRecordingEventListenerGetXPCInterface();
    [(NSXPCConnection *)v9 setRemoteObjectInterface:v10];

    [(NSXPCConnection *)self->_speechRecordingEventListenerConnection resume];
    id v4 = v11;
  }
}

- (void)setHybridUODEnabled:(BOOL)a3
{
  self->_hybridUODEnabled = a3;
}

- (void)disableSpeechPacketGeneration:(BOOL)a3
{
  self->_shouldDisableSpeechPacketGeneration = a3;
}

- (void)setIsDriving:(BOOL)a3
{
  self->_isDriving = a3;
}

- (void)setAudioFileHandle:(id)a3
{
}

- (void)setAudioFileType:(int64_t)a3
{
  self->_audioFileType = a3;
}

- (void)forceSuccessAudioAlertOnStop
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int64_t v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[CSSiriSpeechRecorder forceSuccessAudioAlertOnStop]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  self->_forceSuccessAlertOnStop = 1;
}

- (void)setFingerprintingEnabled:(BOOL)a3
{
  if (self->_fingerprintingEnabled != a3)
  {
    self->_fingerprintingEnabled = a3;
    if (!a3)
    {
      [(CSSiriAcousticFingerprinter *)self->_fingerprinter setDelegate:0];
      fingerprinter = self->_fingerprinter;
      self->_fingerprinter = 0;

      if (self->_speechCapturingMode == 4)
      {
        [(CSSiriSpeechRecorder *)self _stopRecordingWithReason:8 hostTime:0];
      }
    }
  }
}

- (void)cancelSpeechCaptureSuppressingAlert:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[CSSiriSpeechRecorder cancelSpeechCaptureSuppressingAlert:]";
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s (suppressAlert = %d)", (uint8_t *)&v6, 0x12u);
  }
  self->_BOOL wasCanceled = 1;
  self->_BOOL suppressRecordingStoppedAlert = v3;
  [(CSSiriSpeechRecorder *)self _stopRecordingWithReason:7 hostTime:0];
}

- (void)stopSpeechCaptureForEvent:(int64_t)a3 suppressAlert:(BOOL)a4 hostTime:(unint64_t)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v9 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v11 = 136315906;
    uint64_t v12 = "-[CSSiriSpeechRecorder stopSpeechCaptureForEvent:suppressAlert:hostTime:]";
    __int16 v13 = 2048;
    int64_t v14 = a3;
    __int16 v15 = 1024;
    BOOL v16 = v6;
    __int16 v17 = 2048;
    unint64_t v18 = a5;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s (event = %ld, suppressAlert = %d, hostTime = %llu)", (uint8_t *)&v11, 0x26u);
  }
  if (a3 == 5) {
    self->_serverDidEndpoint = 1;
  }
  BOOL v10 = (AFIsNano() & 1) == 0
     && (self->_speechCapturingMode & 0xFFFFFFFFFFFFFFFBLL) == 1
     && self->_startEvent == a3
     && (unint64_t)(self->_endpointerOperationMode - 3) >= 2
     && [(CSSiriAudioActivationInfo *)self->_currentActivationInfo audioAlertStyle] == 3;
  self->_BOOL suppressRecordingStoppedAlert = v6 || v10;
  [(CSSiriSpeechRecorder *)self _stopRecordingWithReason:(a3 << 16) | 5 hostTime:a5];
}

- (void)setFingerprintWasRecognized
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  BOOL v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[CSSiriSpeechRecorder setFingerprintWasRecognized]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  self->_fingerprintWasRecognized = 1;
}

- (void)setSpeechWasRecognizedForElapsedTime:(double)a3 isFinal:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = (os_log_t *)MEMORY[0x1E4F4E380];
  __int16 v8 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    double twoShotStartTime = self->_twoShotStartTime;
    int v13 = 136315650;
    int64_t v14 = "-[CSSiriSpeechRecorder setSpeechWasRecognizedForElapsedTime:isFinal:]";
    __int16 v15 = 2048;
    double v16 = a3;
    __int16 v17 = 2048;
    double v18 = twoShotStartTime;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s %lf %lf", (uint8_t *)&v13, 0x20u);
  }
  self->_serverDidRecognizeSpeech = 1;
  if (v4) {
    self->_serverDidEndpoint = 1;
  }
  double v10 = self->_twoShotStartTime;
  BOOL v11 = v10 > 0.0 && v10 < a3;
  if (v11 && !self->_didPerformTwoShotPrompt)
  {
    uint64_t v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      int64_t v14 = "-[CSSiriSpeechRecorder setSpeechWasRecognizedForElapsedTime:isFinal:]";
      __int16 v15 = 2050;
      double v16 = 60.0;
      _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s Endpointer setStartWaitTime is set to %{public}f", (uint8_t *)&v13, 0x16u);
    }
    [(CSEndpointAnalyzer *)self->_endpointAnalyzer setStartWaitTime:60.0];
  }
}

- (void)releaseAudioSession
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CSSpeechController *)self->_speechController isRecording];
  BOOL v4 = (NSObject **)MEMORY[0x1E4F4E380];
  if (v3)
  {
    id v5 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      double v22 = "-[CSSiriSpeechRecorder releaseAudioSession]";
      _os_log_error_impl(&dword_1C9338000, v5, OS_LOG_TYPE_ERROR, "%s Attempting to release audio session while CSSpeechController is still recording.", buf, 0xCu);
    }
    self->_BOOL suppressRecordingStoppedAlert = 1;
    [(CSSiriSpeechRecorder *)self _stopRecordingForEndpointReason:6 withEndpointMetrics:0];
  }
  BOOL v6 = [(CSSiriSpeechRecorder *)self suppressInterruptionEndedNotifications];
  id v7 = *v4;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    __int16 v8 = "notify";
    if (v6) {
      __int16 v8 = "suppress (keep others interrupted forever)";
    }
    *(_DWORD *)long long buf = 136315394;
    double v22 = "-[CSSiriSpeechRecorder releaseAudioSession]";
    __int16 v23 = 2080;
    id v24 = v8;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s releaseAudioSessionBehavior = %s", buf, 0x16u);
  }
  [(CSSpeechController *)self->_speechController releaseAudioSession:!v6];
  [(CSSiriSpeechRecorder *)self setSuppressInterruptionEndedNotifications:0];
  BOOL v9 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
  speechController = self->_speechController;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  __int16 v17 = __43__CSSiriSpeechRecorder_releaseAudioSession__block_invoke;
  double v18 = &unk_1E658C758;
  uint64_t v19 = self;
  id v11 = v9;
  id v20 = v11;
  [(CSSpeechController *)speechController fetchAudioMetricsWithCompletion:&v15];
  currentAudioDeviceInfo = self->_currentAudioDeviceInfo;
  self->_currentAudioDeviceInfo = 0;

  if (objc_opt_respondsToSelector()) {
    -[CSSiriSpeechCapturingDelegate speechCapturingDidUpdateAudioDeviceInfo:](self->_delegate, "speechCapturingDidUpdateAudioDeviceInfo:", 0, v15, v16, v17, v18, v19);
  }
  currentActivationInfo = self->_currentActivationInfo;
  self->_currentActivationInfo = 0;

  pendingActivationInfo = self->_pendingActivationInfo;
  self->_pendingActivationInfo = 0;

  [(CSAudioSessionController *)self->_audioSessionController unregisterObserver:self];
}

void __43__CSSiriSpeechRecorder_releaseAudioSession__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__CSSiriSpeechRecorder_releaseAudioSession__block_invoke_2;
  block[3] = &unk_1E658D3F0;
  void block[4] = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __43__CSSiriSpeechRecorder_releaseAudioSession__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _logAudioMetrics:*(void *)(a1 + 40) mhUUID:*(void *)(a1 + 48)];
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_updateAudioContextWithPendingInfoForReason:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_pendingActivationInfo) {
    goto LABEL_7;
  }
  [(CSSiriSpeechRecorder *)self _updateAudioContextToPostVoiceForReason:v4];
  id v5 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v6 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    pendingActivationInfo = self->_pendingActivationInfo;
    int v14 = 136315650;
    uint64_t v15 = "-[CSSiriSpeechRecorder _updateAudioContextWithPendingInfoForReason:]";
    __int16 v16 = 2112;
    __int16 v17 = pendingActivationInfo;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s Updating using pending info %@ for reason %@.", (uint8_t *)&v14, 0x20u);
  }
  if ([(CSSiriSpeechRecorder *)self _setAudioContextWithInfo:self->_pendingActivationInfo forReason:v4])
  {
    p_currentActivationInfo = &self->_currentActivationInfo;
    objc_storeStrong((id *)&self->_currentActivationInfo, self->_pendingActivationInfo);
    id v9 = self->_pendingActivationInfo;
    self->_pendingActivationInfo = 0;

    double v10 = *v5;
    BOOL v11 = 1;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *p_currentActivationInfo;
      int v14 = 136315394;
      uint64_t v15 = "-[CSSiriSpeechRecorder _updateAudioContextWithPendingInfoForReason:]";
      __int16 v16 = 2112;
      __int16 v17 = v12;
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s Set pending info as current %@.", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
LABEL_7:
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)_updateAudioContextToPostVoiceForReason:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CSSiriAudioActivationInfo *)self->_currentActivationInfo needsUpdateToPostVoiceMode])
  {
    id v5 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v9 = 136315394;
      double v10 = "-[CSSiriSpeechRecorder _updateAudioContextToPostVoiceForReason:]";
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s Updating to post voice for reason %@.", (uint8_t *)&v9, 0x16u);
    }
    unint64_t v6 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo beginUpdateToPostVoice];
    BOOL v7 = [(CSSiriSpeechRecorder *)self _setAudioContextWithInfo:self->_currentActivationInfo forReason:v4];
    [(CSSiriAudioActivationInfo *)self->_currentActivationInfo endUpdateToPostVoiceWithContext:v6 success:v7];
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)_setAudioContextWithInfo:(id)a3 forReason:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (self->_speechController)
  {
    id v8 = [v6 recordContext];
    int v9 = (NSObject **)MEMORY[0x1E4F4E380];
    double v10 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315650;
      double v22 = "-[CSSiriSpeechRecorder _setAudioContextWithInfo:forReason:]";
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v7;
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s Setting audio context %@ for reason %@.", buf, 0x20u);
    }
    mach_absolute_time();
    kdebug_trace();
    speechController = self->_speechController;
    id v20 = 0;
    BOOL v12 = [(CSSpeechController *)speechController setCurrentRecordContext:v8 error:&v20];
    id v13 = v20;
    kdebug_trace();
    int v14 = *v9;
    if (v13 || !v12)
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_13;
      }
      uint64_t v15 = v14;
      mach_absolute_time();
      AFMachAbsoluteTimeGetTimeInterval();
      *(_DWORD *)long long buf = 136316162;
      double v22 = "-[CSSiriSpeechRecorder _setAudioContextWithInfo:forReason:]";
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v7;
      __int16 v27 = 2114;
      id v28 = v13;
      __int16 v29 = 2048;
      uint64_t v30 = v19;
      _os_log_error_impl(&dword_1C9338000, v15, OS_LOG_TYPE_ERROR, "%s Error setting audio context %@ for reason %@ error %{public}@. (%f seconds)", buf, 0x34u);
    }
    else
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
LABEL_13:

        goto LABEL_14;
      }
      uint64_t v15 = v14;
      mach_absolute_time();
      AFMachAbsoluteTimeGetTimeInterval();
      *(_DWORD *)long long buf = 136315906;
      double v22 = "-[CSSiriSpeechRecorder _setAudioContextWithInfo:forReason:]";
      __int16 v23 = 2112;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v7;
      __int16 v27 = 2048;
      id v28 = v16;
      _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_INFO, "%s Done setting audio context %@ for reason %@. (%f seconds)", buf, 0x2Au);
    }

    goto LABEL_13;
  }
  __int16 v17 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    double v22 = "-[CSSiriSpeechRecorder _setAudioContextWithInfo:forReason:]";
    _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_INFO, "%s Ignored setting audio context because there's no speech controller.", buf, 0xCu);
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (void)_updateAudioContextWithInfo:(id)a3 reason:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = (CSSiriAudioActivationInfo *)a3;
  id v7 = a4;
  id v8 = (os_log_t *)MEMORY[0x1E4F4E380];
  int v9 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    id v13 = "-[CSSiriSpeechRecorder _updateAudioContextWithInfo:reason:]";
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s info = %@, reason = %@", (uint8_t *)&v12, 0x20u);
  }
  pendingActivationInfo = self->_pendingActivationInfo;
  if (pendingActivationInfo)
  {
    __int16 v11 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 136315650;
      id v13 = "-[CSSiriSpeechRecorder _updateAudioContextWithInfo:reason:]";
      __int16 v14 = 2112;
      uint64_t v15 = pendingActivationInfo;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_debug_impl(&dword_1C9338000, v11, OS_LOG_TYPE_DEBUG, "%s Dropping previous pending activation info %@ for reason %@.", (uint8_t *)&v12, 0x20u);
      pendingActivationInfo = self->_pendingActivationInfo;
    }
  }
  self->_pendingActivationInfo = v6;

  if (!self->_recordingState) {
    [(CSSiriSpeechRecorder *)self _updateAudioContextWithPendingInfoForReason:v7];
  }
}

- (void)setSpeechRequestOptions:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v7 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id v24 = 136315394;
    *(void *)&void v24[4] = "-[CSSiriSpeechRecorder setSpeechRequestOptions:]";
    *(_WORD *)&v24[12] = 2112;
    *(void *)&v24[14] = v5;
    _os_log_impl(&dword_1C9338000, v7, OS_LOG_TYPE_INFO, "%s %@", v24, 0x16u);
  }
  uint64_t v8 = [v5 endpointerOperationMode];
  os_log_t v9 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
  {
    double v10 = v9;
    __int16 v11 = AFSpeechEndpointerOperationModeGetName();
    *(_DWORD *)id v24 = 136315394;
    *(void *)&void v24[4] = "-[CSSiriSpeechRecorder setSpeechRequestOptions:]";
    *(_WORD *)&v24[12] = 2112;
    *(void *)&v24[14] = v11;
    _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s endpointerOperationMode = %@", v24, 0x16u);
  }
  if (self->_speechCapturingMode == 4)
  {
    os_log_t v12 = *v6;
    uint64_t v8 = 1;
    if (!os_log_type_enabled(*v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_14;
    }
    id v13 = v12;
    uint64_t v8 = 1;
    __int16 v14 = AFSpeechEndpointerOperationModeGetName();
    *(_DWORD *)id v24 = 136315394;
    *(void *)&void v24[4] = "-[CSSiriSpeechRecorder setSpeechRequestOptions:]";
    *(_WORD *)&v24[12] = 2112;
    *(void *)&v24[14] = v14;
    uint64_t v15 = "%s Fingerprinting mode, force (endpointerOperationMode = %@).";
    __int16 v16 = v13;
    uint32_t v17 = 22;
    goto LABEL_13;
  }
  if (AFSpeechEndpointerOperationModeGetIsValid() && v8
    || ![v5 useAutomaticEndpointing])
  {
    goto LABEL_14;
  }
  os_log_t v18 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
  {
    id v13 = v18;
    uint64_t v8 = 3;
    __int16 v14 = AFSpeechEndpointerOperationModeGetName();
    *(_DWORD *)id v24 = 136315650;
    *(void *)&void v24[4] = "-[CSSiriSpeechRecorder setSpeechRequestOptions:]";
    *(_WORD *)&v24[12] = 1024;
    *(_DWORD *)&v24[14] = 1;
    *(_WORD *)&v24[18] = 2112;
    *(void *)&v24[20] = v14;
    uint64_t v15 = "%s Legacy property set (useAutomaticEndpointing = %d), override (endpointerOperationMode = %@)";
    __int16 v16 = v13;
    uint32_t v17 = 28;
LABEL_13:
    _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_INFO, v15, v24, v17);

    goto LABEL_14;
  }
  uint64_t v8 = 3;
LABEL_14:
  -[CSSiriSpeechRecorder _setEndpointerOperationMode:forceUpdate:](self, "_setEndpointerOperationMode:forceUpdate:", v8, 0, *(_OWORD *)v24, *(void *)&v24[16], *(void *)&v24[24]);
  if ([v5 activationEvent] == 21) {
    [(CSSiriSpeechRecorder *)self _setSpeechCapturingMode:1];
  }
  uint64_t v19 = [[CSSiriAudioActivationInfo alloc] initWithSpeechRecordingMode:self->_speechCapturingMode clientConfiguration:self->_currentClientConfiguration experimentContext:self->_experimentContext];
  [(CSSiriAudioActivationInfo *)v19 setSpeechRequestOptions:v5 currentActivationInfo:self->_currentActivationInfo];
  id v20 = NSStringFromSelector(a2);
  [(CSSiriSpeechRecorder *)self _updateAudioContextWithInfo:v19 reason:v20];

  id v21 = [v5 recordDeviceIdentifier];
  double v22 = (NSString *)[v21 copy];
  recordDevice = self->_recordDevice;
  self->_recordDevice = v22;
}

- (void)_logAudioMetrics:(id)a3 mhUUID:(id)a4
{
  id v25 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v5 = v25;
  if (isKindOfClass)
  {
    id v6 = [v25 objectForKey:*MEMORY[0x1E4F15308]];
    objc_opt_class();
    char v7 = objc_opt_isKindOfClass();
    uint64_t v8 = (void *)MEMORY[0x1E4F15318];
    os_log_t v9 = (void *)MEMORY[0x1E4F15320];
    if (v7)
    {
      double v10 = [v6 objectForKey:*MEMORY[0x1E4F15318]];
      __int16 v11 = [v6 objectForKey:*v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v12 = [v10 unsignedLongLongValue];
          uint64_t v13 = [v11 unsignedLongLongValue];
          if (v12)
          {
            uint64_t v14 = v13;
            if (v13)
            {
              uint64_t v15 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
              [v15 logEventWithType:233 machAbsoluteTime:v12 context:0];

              __int16 v16 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
              [v16 logEventWithType:234 machAbsoluteTime:v14 context:0];
            }
          }
        }
      }
    }
    uint32_t v17 = [v25 objectForKey:*MEMORY[0x1E4F15310]];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      os_log_t v18 = [v17 objectForKey:*v8];
      uint64_t v19 = [v17 objectForKey:*v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v20 = [v18 unsignedLongLongValue];
          uint64_t v21 = [v19 unsignedLongLongValue];
          if (v20)
          {
            uint64_t v22 = v21;
            if (v21)
            {
              __int16 v23 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
              [v23 logEventWithType:235 machAbsoluteTime:v20 context:0];

              id v24 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
              [v24 logEventWithType:236 machAbsoluteTime:v22 context:0];
            }
          }
        }
      }
    }
    id v5 = v25;
  }
}

- (void)_logVoiceTriggerInfo:(id)a3 withMHUUID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 objectForKey:@"earlyDetectFiredMachTime"];
  if (v8)
  {
    os_log_t v9 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    objc_msgSend(v9, "logEventWithType:machAbsoluteTime:context:", 2304, objc_msgSend(v8, "unsignedLongLongValue"), 0);
  }
  double v10 = [v6 objectForKey:@"triggerStartMachTime"];
  if (v10)
  {
    __int16 v11 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    objc_msgSend(v11, "logEventWithType:machAbsoluteTime:context:", 2301, objc_msgSend(v10, "unsignedLongLongValue"), 0);
  }
  uint64_t v12 = [v6 objectForKey:@"triggerFireMachTime"];
  if (v12)
  {
    uint64_t v13 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    objc_msgSend(v13, "logEventWithType:machAbsoluteTime:context:", 2302, objc_msgSend(v12, "unsignedLongLongValue"), 0);
  }
  uint64_t v14 = [v6 objectForKey:@"triggerEndMachTime"];
  if (v14)
  {
    uint64_t v15 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    objc_msgSend(v15, "logEventWithType:machAbsoluteTime:context:", 2303, objc_msgSend(v14, "unsignedLongLongValue"), 0);

    if ([(CSSiriSpeechRecorder *)self _shouldEmitInstrumentation])
    {
      id v24 = v7;
      id v16 = objc_alloc_init(MEMORY[0x1E4FA1330]);
      id v17 = objc_alloc_init(MEMORY[0x1E4FA1340]);
      [v17 setExists:1];
      [v16 setStartedOrChanged:v17];
      os_log_t v18 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
      uint64_t v19 = [v14 unsignedLongLongValue];
      uint64_t v20 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo turnIdentifier];
      [v18 logInstrumentation:v16 machAbsoluteTime:v19 turnIdentifier:v20];

      uint64_t v21 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        id v26 = "-[CSSiriSpeechRecorder _logVoiceTriggerInfo:withMHUUID:]";
        _os_log_impl(&dword_1C9338000, v21, OS_LOG_TYPE_INFO, "%s logInstrumentation for VT launch started", buf, 0xCu);
      }

      id v7 = v24;
    }
  }
  if (v6 && [v6 count])
  {
    uint64_t v22 = [MEMORY[0x1E4F5D308] sharedLogger];
    [v22 logStartEventWithFirstPassStartedInfo:v6 withMHUUID:v7];

    __int16 v23 = [MEMORY[0x1E4F5D308] sharedLogger];
    [v23 logTriggerEventWithVTEI:v6 withMHUUID:v7];
  }
}

- (void)_logBluetoothStateWithMHUUID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  id v6 = objc_msgSend(MEMORY[0x1E4F153E0], "retrieveSessionWithID:", -[CSSiriSpeechRecorder _audioSessionID](self, "_audioSessionID"));
  id v7 = [v6 pickedRoute];

  uint64_t v8 = [v7 objectForKey:*MEMORY[0x1E4F74D00]];
  os_log_t v9 = [v7 objectForKey:*MEMORY[0x1E4F74D80]];
  int v10 = [v9 BOOLValue];

  __int16 v11 = [v7 objectForKey:*MEMORY[0x1E4F74D40]];
  int v12 = [v11 BOOLValue];

  if (v12)
  {
    id v13 = (id)*MEMORY[0x1E4F74D28];

    uint64_t v8 = v13;
  }
  uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v15 = (void *)*MEMORY[0x1E4F5D180];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
  {
    id v16 = v15;
    [v14 timeIntervalSinceDate:v5];
    *(_DWORD *)long long buf = 136315394;
    id v26 = "-[CSSiriSpeechRecorder _logBluetoothStateWithMHUUID:]";
    __int16 v27 = 2050;
    uint64_t v28 = v17;
    _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_DEFAULT, "%s query picked route elapsed time = %{public}lf", buf, 0x16u);
  }
  if (v10)
  {
    if (AFSupportsWirelessSplitter())
    {
      if (!self->_bluetoothWirelessSplitterSessionStateObserver)
      {
        os_log_t v18 = (AFBluetoothWirelessSplitterSessionStateObserver *)[objc_alloc(MEMORY[0x1E4F4E3F0]) initWithQueue:self->_queue delegate:0];
        bluetoothWirelessSplitterSessionStateObserver = self->_bluetoothWirelessSplitterSessionStateObserver;
        self->_bluetoothWirelessSplitterSessionStateObserver = v18;
      }
      uint64_t v20 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __53__CSSiriSpeechRecorder__logBluetoothStateWithMHUUID___block_invoke;
      v22[3] = &unk_1E658C730;
      void v22[4] = self;
      id v23 = v4;
      id v24 = v8;
      [v20 logEventWithType:242 contextResolver:v22];
    }
    else
    {
      uint64_t v21 = [MEMORY[0x1E4F5D2D0] sharedLogger];
      [v21 logMHAssistantDaemonAudioBluetoothInfoWithMHUUID:v4 withWirelessSplitterSessionState:0 withAudioDeviceCategory:v8];
    }
  }
}

void __53__CSSiriSpeechRecorder__logBluetoothStateWithMHUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 480);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CSSiriSpeechRecorder__logBluetoothStateWithMHUUID___block_invoke_2;
  v6[3] = &unk_1E658C708;
  id v9 = v3;
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  id v5 = v3;
  [v4 getStateWithCompletion:v6];
}

void __53__CSSiriSpeechRecorder__logBluetoothStateWithMHUUID___block_invoke_2(void *a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a1[6];
  id v8 = @"state";
  id v5 = AFBluetoothWirelessSplitterSessionStateGetName();
  v9[0] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);

  id v7 = [MEMORY[0x1E4F5D2D0] sharedLogger];
  [v7 logMHAssistantDaemonAudioBluetoothInfoWithMHUUID:a1[4] withWirelessSplitterSessionState:a2 withAudioDeviceCategory:a1[5]];
}

- (id)_getFanInfoArray
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  return v2;
}

- (id)fetchAudioDeviceInfo
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v4 = NSStringFromSelector(a2);
  [(CSSiriSpeechRecorder *)self _updateAudioDeviceInfo:0 forReason:v4 forcesUpdate:0];

  id v5 = (void *)[(CSFAudioDeviceInfo *)self->_currentAudioDeviceInfo copy];
  return v5;
}

- (id)fetchRecordingInfo
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return [(CSSiriSpeechRecorder *)self _currentRecordingInfo];
}

- (unsigned)_audioSessionID
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = (os_log_t *)MEMORY[0x1E4F4E380];
  uint64_t v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[CSSiriSpeechRecorder _audioSessionID]";
    _os_log_impl(&dword_1C9338000, v4, OS_LOG_TYPE_INFO, "%s Fetching audio session ID...", (uint8_t *)&v8, 0xCu);
  }
  unsigned int v5 = [(CSAudioSessionController *)self->_audioSessionController getAudioSessionID];
  id v6 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    id v9 = "-[CSSiriSpeechRecorder _audioSessionID]";
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s Done fetching audio session ID %lu.", (uint8_t *)&v8, 0x16u);
  }
  return v5;
}

- (unsigned)fetchAudioSessionID
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  return [(CSSiriSpeechRecorder *)self _audioSessionID];
}

- (void)updateSpeechSynthesisRecord:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [v5 beginTimestamp];
  if (v6 >= [(AFSpeechSynthesisRecord *)self->_mostRecentSpeechSynthesisRecord beginTimestamp])
  {
    p_mostRecentSpeechSynthesisRecord = (id *)&self->_mostRecentSpeechSynthesisRecord;
    unint64_t v8 = [v5 endTimestamp];
    if (v8 >= [*p_mostRecentSpeechSynthesisRecord endTimestamp])
    {
      id v9 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        id v10 = *p_mostRecentSpeechSynthesisRecord;
        int v11 = 136315650;
        uint64_t v12 = "-[CSSiriSpeechRecorder updateSpeechSynthesisRecord:]";
        __int16 v13 = 2112;
        id v14 = v10;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s Updated speech synthesis record from %@ to %@.", (uint8_t *)&v11, 0x20u);
      }
      objc_storeStrong(p_mostRecentSpeechSynthesisRecord, a3);
    }
  }
}

- (BOOL)startSpeechCaptureWithContext:(id)a3 willStartHandler:(id)a4 error:(id *)a5
{
  uint64_t v139 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v11 = (void (**)(void))a4;
  uint64_t v12 = (id *)MEMORY[0x1E4F4E380];
  __int16 v13 = (id)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    currentActivationInfo = self->_currentActivationInfo;
    *(_DWORD *)long long buf = 136315650;
    v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
    __int16 v134 = 2112;
    *(void *)v135 = v10;
    *(_WORD *)&v135[8] = 2112;
    *(void *)v136 = currentActivationInfo;
    _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_INFO, "%s context:%@, _currentActivationInfo :%@", buf, 0x20u);
  }

  pendingActivationInfo = self->_pendingActivationInfo;
  if (!pendingActivationInfo) {
    pendingActivationInfo = self->_currentActivationInfo;
  }
  [v10 willPrepareAndStartRecordingWithAudioActivationInfo:pendingActivationInfo];
  id v131 = 0;
  BOOL v16 = [(CSSiriSpeechRecorder *)self _prepareSpeechControllerWithOptions:9 error:&v131];
  id v17 = v131;
  if (!v16)
  {
    [(CSSiriSpeechRecorder *)self _logFanState];
    goto LABEL_128;
  }
  [(CSSiriSpeechRecorder *)self _setAlertsIfNeeded];
  if (self->_speechCapturingMode == 4) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = 2 * ((unint64_t)(self->_endpointerOperationMode - 3) > 1);
  }
  [(CSSiriSpeechRecorder *)self _setEndpointStyle:v18];
  uint64_t v19 = NSStringFromSelector(a2);
  [(CSSiriSpeechRecorder *)self _updateAudioDeviceInfo:0 forReason:v19 forcesUpdate:1];

  uint64_t v20 = [(CSSiriSpeechRecorder *)self _currentRecordRoute];
  v118 = [(CSSiriSpeechRecorder *)self _currentPlaybackRoute];
  BOOL v112 = v16;
  v119 = v20;
  if ([v20 isEqualToString:*MEMORY[0x1E4F150D8]])
  {
    uint64_t v21 = *v12;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
      _os_log_impl(&dword_1C9338000, v21, OS_LOG_TYPE_INFO, "%s Using Bluetooth audio analyzer style", buf, 0xCu);
    }
    char v114 = 0;
    uint64_t v22 = 2;
  }
  else if (([v20 isEqualToString:*MEMORY[0x1E4F15118]] & 1) != 0 || self->_isDriving)
  {
    uint64_t v21 = *v12;
    uint64_t v22 = 1;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
      uint64_t v22 = 1;
      _os_log_impl(&dword_1C9338000, v21, OS_LOG_TYPE_INFO, "%s Using driving audio analyzer style", buf, 0xCu);
    }
    char v114 = 0;
  }
  else
  {
    BOOL v42 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo shouldUseVoiceTriggerAnalyzerStyle];
    uint64_t v21 = *v12;
    BOOL v43 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (v42)
    {
      if (v43)
      {
        *(_DWORD *)long long buf = 136315138;
        v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        _os_log_impl(&dword_1C9338000, v21, OS_LOG_TYPE_INFO, "%s Using voice trigger audio analyzer style", buf, 0xCu);
      }
      char v114 = 0;
      uint64_t v22 = 3;
    }
    else if (v43)
    {
      *(_DWORD *)long long buf = 136315138;
      v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
      char v114 = 1;
      _os_log_impl(&dword_1C9338000, v21, OS_LOG_TYPE_INFO, "%s Using default audio analyzer style", buf, 0xCu);
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v22 = 0;
      char v114 = 1;
    }
  }

  [(CSEndpointAnalyzer *)self->_endpointAnalyzer setEndpointStyle:v22];
  if ([(CSSiriAudioActivationInfo *)self->_currentActivationInfo audioAlertStyle] != 3
    || (double v23 = 0.5, AFDeviceSupportsZLL()))
  {
    double v23 = 0.0;
  }
  [(CSEndpointAnalyzer *)self->_endpointAnalyzer setMinimumDurationForEndpointer:v23];
  if (self->_fingerprintingEnabled) {
    [(CSSiriAcousticFingerprinter *)self->_fingerprinter reset];
  }
  [(CSSiriSpeechRecorder *)self _clearEndpointHint];
  if (v11) {
    v11[2](v11);
  }
  if (AFIsHorseman())
  {
    [(CSSiriAudioActivationInfo *)self->_currentActivationInfo speechEvent];
    if (AFSpeechEventIsHardwareTrigger()
      && ([(CSSiriAudioActivationInfo *)self->_currentActivationInfo speechRecordingMode] & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      BOOL v24 = [(CSSiriSpeechRecorder *)self _shouldPlaySummonedToneOnTopCapInvocationOnHorseman];
      id v25 = *v12;
      BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
      if (v24)
      {
        if (v26)
        {
          __int16 v27 = [(AFClientConfiguration *)self->_currentClientConfiguration tapToSiriAudioPlaybackRequest];
          id v28 = [v27 itemURL];
          *(_DWORD *)long long buf = 136315394;
          v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
          __int16 v134 = 2112;
          *(void *)v135 = v28;
          _os_log_impl(&dword_1C9338000, v25, OS_LOG_TYPE_INFO, "%s Playing start alert %@", buf, 0x16u);
        }
        uint64_t v29 = [(AFClientConfiguration *)self->_currentClientConfiguration tapToSiriAudioPlaybackRequest];
        v128[0] = MEMORY[0x1E4F143A8];
        v128[1] = 3221225472;
        v128[2] = __77__CSSiriSpeechRecorder_startSpeechCaptureWithContext_willStartHandler_error___block_invoke;
        v128[3] = &unk_1E658C6B8;
        v129 = v17;
        v130 = self;
        [(CSSiriSpeechRecorder *)self _startAudioPlaybackRequest:v29 options:3 completion:v128];

        id v25 = v129;
        goto LABEL_50;
      }
      if (v26)
      {
        *(_DWORD *)long long buf = 136315138;
        v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        int64_t v41 = "%s Suppressing start alert";
        goto LABEL_49;
      }
    }
    else
    {
      uint64_t v30 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo speechRecordingAlertPolicy];
      uint64_t v31 = [v30 startingAlertBehavior];
      uint64_t v32 = [v31 beepSoundID];

      if (v32)
      {
        uint64_t v33 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo speechRecordingAlertPolicy];
        double v34 = [v33 startingAlertBehavior];
        uint64_t v35 = [v34 beepSoundID];

        uint64_t v36 = [MEMORY[0x1E4F4E408] sharedManager];
        id v25 = [v36 URLForSoundID:v35];

        uint64_t v37 = *v12;
        BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
        if (v25)
        {
          if (v38)
          {
            *(_DWORD *)long long buf = 136315394;
            v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
            __int16 v134 = 2112;
            *(void *)v135 = v25;
            _os_log_error_impl(&dword_1C9338000, v37, OS_LOG_TYPE_ERROR, "%s Playing start alert %@", buf, 0x16u);
          }

          id v39 = objc_alloc(MEMORY[0x1E4F4E3D8]);
          v126[0] = MEMORY[0x1E4F143A8];
          v126[1] = 3221225472;
          v126[2] = __77__CSSiriSpeechRecorder_startSpeechCaptureWithContext_willStartHandler_error___block_invoke_109;
          v126[3] = &unk_1E658C6E0;
          v127 = v25;
          BOOL v40 = (void *)[v39 initWithBuilder:v126];
          v123[0] = MEMORY[0x1E4F143A8];
          v123[1] = 3221225472;
          v123[2] = __77__CSSiriSpeechRecorder_startSpeechCaptureWithContext_willStartHandler_error___block_invoke_2;
          v123[3] = &unk_1E658C6B8;
          id v124 = v17;
          v125 = self;
          [(CSSiriSpeechRecorder *)self _startAudioPlaybackRequest:v40 options:3 completion:v123];

          uint64_t v37 = v127;
        }
        else if (v38)
        {
          *(_DWORD *)long long buf = 136315138;
          v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
          _os_log_error_impl(&dword_1C9338000, v37, OS_LOG_TYPE_ERROR, "%s No SoundID URL", buf, 0xCu);
        }

        goto LABEL_50;
      }
      id v25 = *v12;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        int64_t v41 = "%s No start recording alert";
LABEL_49:
        _os_log_impl(&dword_1C9338000, v25, OS_LOG_TYPE_INFO, v41, buf, 0xCu);
      }
    }
LABEL_50:
  }
  v120 = v17;
  v113 = a5;
  v121 = v10;
  v115 = v11;
  id obj = a3;
  if (-[CSSiriAudioActivationInfo requiresBorealisConsumerCheck](self->_currentActivationInfo, "requiresBorealisConsumerCheck")&& ([MEMORY[0x1E4FB4FF0] isLastTriggerForced] & 1) == 0)
  {
    __int16 v44 = [MEMORY[0x1E4F28F80] processInfo];
    [v44 systemUptime];
    double v46 = v45;
    while (1)
    {
      id v47 = *v12;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        _os_log_impl(&dword_1C9338000, v47, OS_LOG_TYPE_INFO, "%s Checking if VT has triggered", buf, 0xCu);
      }

      int v48 = [MEMORY[0x1E4FB4FF0] isLastTriggerForced];
      BOOL v49 = *v12;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        __int16 v134 = 1024;
        *(_DWORD *)v135 = v48;
        _os_log_impl(&dword_1C9338000, v49, OS_LOG_TYPE_INFO, "%s VT has triggered %d", buf, 0x12u);
      }

      uint64_t v12 = (id *)MEMORY[0x1E4F4E380];
      if (v48) {
        break;
      }
      [v44 systemUptime];
      if (v50 - v46 > 5.0)
      {
        BOOL v51 = *v12;
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          [v44 systemUptime];
          *(_DWORD *)long long buf = 136315394;
          v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
          __int16 v134 = 2050;
          *(double *)v135 = v110 - v46;
          _os_log_error_impl(&dword_1C9338000, v51, OS_LOG_TYPE_ERROR, "%s Timed out after %{public}lfs waiting for Borealis buffer to become available.", buf, 0x16u);
        }

        break;
      }
      usleep(0x3A98u);
    }

    id v10 = v121;
  }
  __int16 v52 = [MEMORY[0x1E4FB4FE0] sharedPreferences];
  if ([v52 isVoiceTriggerAvailable])
  {
    BOOL v53 = [MEMORY[0x1E4F4E538] sharedPreferences];
    char v54 = [v53 cloudSyncEnabled];
  }
  else
  {
    char v54 = 0;
  }

  char v55 = AFSupportsSpeechExtraction();
  if (self->_audioFileType)
  {
    self->_needsAVVCLPCMCallbacks = 1;
  }
  else
  {
    char v56 = v55;
    v57 = [MEMORY[0x1E4F4E538] sharedPreferences];
    self->_needsAVVCLPCMCallbacks = [v57 fileLoggingIsEnabled] | v54 | v56;
  }
  self->_hasReceivedEmptyLPCMRecordBuffer = 0;
  v58 = *v12;
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
    _os_log_impl(&dword_1C9338000, v58, OS_LOG_TYPE_INFO, "%s entering _recordingWillStartGroup", buf, 0xCu);
  }

  dispatch_group_enter((dispatch_group_t)self->_recordingWillStartGroup);
  if ([(CSSiriAudioActivationInfo *)self->_currentActivationInfo hasPlayedStartAlert]) {
    [v10 instrumentSiriCue:1];
  }
  self->_unint64_t startEvent = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo speechEvent];
  __int16 v59 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
  int64_t v60 = self->_currentActivationInfo;
  int v61 = [(CSSiriSpeechRecorder *)self _currentRecordingInfo];
  double v62 = [(CSSiriAudioActivationInfo *)v60 startRecordingSettingsWithRecordRoute:v119 recordingInfo:v61 playbackRoute:v118];

  v117 = v62;
  uint64_t v63 = (void *)[v62 mutableCopy];
  unsigned int v64 = [(CSFAudioDeviceInfo *)self->_currentAudioDeviceInfo recordDeviceInfo];
  if ([v64 isRemoteDevice])
  {
    v65 = (void *)MEMORY[0x1E4F5D450];
    v66 = [(CSFAudioDeviceInfo *)self->_currentAudioDeviceInfo recordDeviceInfo];
    v67 = [v66 route];
    LODWORD(v65) = [v65 isDisplayPortRouteWithRecordRoute:v67];

    id v10 = v121;
    if (v65)
    {
      v68 = (id)*MEMORY[0x1E4F4E380];
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        _os_log_impl(&dword_1C9338000, v68, OS_LOG_TYPE_INFO, "%s Skip start alert for studio display", buf, 0xCu);
      }

      [v63 setObject:MEMORY[0x1E4F1CC38] forKey:@"CSSpeechRecordSettingsKey_shouldSkipStartRecordingAlert"];
    }
  }
  else
  {
  }
  v69 = [v10 sessionUUID];

  if (v69)
  {
    v70 = [v10 sessionUUID];
    [v63 setObject:v70 forKey:@"CSSpeechRecordSettingsKey_siriSessionUUID"];
  }
  char v71 = [v59 UUIDString];

  if (v71)
  {
    v72 = [v59 UUIDString];
    [v63 setObject:v72 forKey:@"CSSpeechRecordSettingsKey_requestMHUUID"];

    if (([MEMORY[0x1E4F5D450] isMedocFeatureEnabled] & 1) == 0) {
      [v10 emitRequestLinkEventForMHUUID:v59];
    }
  }
  v73 = [NSNumber numberWithBool:self->_shouldDisableSpeechPacketGeneration];
  [v63 setObject:v73 forKey:@"CSSpeechRecordSettingsKey_asrOnDevice"];

  v74 = [NSNumber numberWithBool:self->_hybridUODEnabled];
  [v63 setObject:v74 forKey:@"CSSpeechRecordSettingsKey_hybridUODEnabled"];

  int64_t speechCapturingMode = self->_speechCapturingMode;
  v76 = (id *)MEMORY[0x1E4F4E380];
  if ((speechCapturingMode & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
LABEL_91:
    [v63 setObject:MEMORY[0x1E4F1CC38] forKey:@"CSSpeechRecordSettingsKey_disablePrewarmLocalAsrAtStartRecording"];
    goto LABEL_92;
  }
  if ((speechCapturingMode & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    unint64_t startEvent = self->_startEvent;
    if (startEvent <= 0xD && ((1 << startEvent) & 0x2102) != 0)
    {
      AFDeviceSupportsSiriUOD();
    }
    else if (AFDeviceSupportsSiriUOD())
    {
      goto LABEL_92;
    }
    goto LABEL_91;
  }
LABEL_92:
  v116 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo recordContextForSpeechEvent:self->_startEvent];
  objc_msgSend(v10, "updateAudioRecordContext:");
  char v78 = v114 ^ 1;
  double v79 = 0.0;
  if (self->_startEvent != 1) {
    char v78 = 1;
  }
  if ((v78 & 1) == 0)
  {
    v80 = [v63 objectForKey:*MEMORY[0x1E4F15338]];

    if (v80)
    {
      double lastPrepareTimestamp = self->_lastPrepareTimestamp;
      [(CSSiriAudioActivationInfo *)self->_currentActivationInfo activationSystemUptime];
      double v79 = lastPrepareTimestamp - v82;
      v83 = *v76;
      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
        __int16 v134 = 2048;
        *(double *)v135 = v79;
        _os_log_impl(&dword_1C9338000, v83, OS_LOG_TYPE_INFO, "%s Setting delayed start delay %lf", buf, 0x16u);
      }
    }
  }
  [(CSEndpointAnalyzer *)self->_endpointAnalyzer setDelay:v79];
  __int16 v84 = *v76;
  if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
    __int16 v134 = 2112;
    *(void *)v135 = v63;
    _os_log_impl(&dword_1C9338000, v84, OS_LOG_TYPE_INFO, "%s Asking CSSpeechController to startRecording with settings %@", buf, 0x16u);
  }

  v85 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  [v85 logEventWithType:211 context:0];

  v86 = [MEMORY[0x1E4F5D2D0] sharedLogger];
  [v86 logMHAssistantDaemonAudioStartRecordingContextWithMHUUID:v59 withStartRecordingContext:1 withFanInfoArray:0 withActiveSessionDisplayIDs:0];

  v87 = [MEMORY[0x1E4F28F80] processInfo];
  [v87 systemUptime];
  self->_startRecordingTimestamp = v88;

  if (AFIsInternalInstall())
  {
    v89 = *v76;
    os_signpost_id_t v90 = os_signpost_id_generate((os_log_t)*v76);
    if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v91 = v90;
      if (os_signpost_enabled(v89))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9338000, v89, OS_SIGNPOST_EVENT, v91, "SpeechRecorder", "StartRecording", buf, 2u);
      }
    }
  }
  kdebug_trace();
  speechController = self->_speechController;
  id v122 = 0;
  BOOL v93 = [(CSSpeechController *)speechController startRecordingWithSettings:v63 error:&v122];
  id v94 = v122;
  [v121 updateRecordingSettings:v63];
  kdebug_trace();
  id v95 = 0;
  if (!v93)
  {
    AFAddInterruptingAudioSessionInfoToAnalyticsContext();
    id v95 = (id)objc_claimAutoreleasedReturnValue();
  }
  v96 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
  [v96 logEventWithType:212 context:v95];

  v97 = [v95 objectForKey:@"kAudioSessionProperty_ActiveSessionDisplayIDs"];
  v98 = [MEMORY[0x1E4F5D2D0] sharedLogger];
  [v98 logMHAssistantDaemonAudioStartRecordingContextWithMHUUID:v59 withStartRecordingContext:0 withFanInfoArray:0 withActiveSessionDisplayIDs:v97];

  v99 = (id)*MEMORY[0x1E4F4E380];
  int v11 = v115;
  if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
    _os_log_impl(&dword_1C9338000, v99, OS_LOG_TYPE_INFO, "%s Done asking CSSpeechController to startRecording", buf, 0xCu);
  }

  if (v93)
  {
    objc_storeStrong((id *)&self->_context, obj);
    v100 = (id)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
    {
      context = self->_context;
      *(_DWORD *)long long buf = 136315394;
      v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
      __int16 v134 = 2112;
      *(void *)v135 = context;
      _os_log_impl(&dword_1C9338000, v100, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
    }

    self->_int64_t recordingState = 1;
    if ([(CSSiriAudioActivationInfo *)self->_currentActivationInfo shouldExplicitlyPlayAlertOnStart])
    {
      [(CSSiriSpeechRecorder *)self _playAudioAlert:1];
    }
    id v10 = v121;
    if ((self->_speechCapturingMode & 0xFFFFFFFFFFFFFFFBLL) == 1
      && (unint64_t)(self->_endpointerOperationMode - 3) <= 1)
    {
      [(CSSiriSpeechRecorder *)self _scheduleExtendedEndpointTimer];
    }
    if (AFIsATV()) {
      self->_expectedFirstBufferTimestamp = self->_startRecordingTimestamp + 0.2;
    }
    decoder = self->_decoder;
    if (decoder)
    {
      AudioConverterDispose(decoder);
      self->_decoder = 0;
    }
  }
  else
  {
    v103 = [MEMORY[0x1E4F5D2A0] sharedInstance];
    [v103 submitAudioIssueReport:*MEMORY[0x1E4F5D578]];

    uint64_t v104 = [MEMORY[0x1E4F4E478] errorWithCode:200 description:0 underlyingError:v94];

    self->_int64_t recordingState = 0;
    v105 = (id)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
      _os_log_impl(&dword_1C9338000, v105, OS_LOG_TYPE_INFO, "%s leaving _recordingWillStartGroup", buf, 0xCu);
    }

    dispatch_group_leave((dispatch_group_t)self->_recordingWillStartGroup);
    v120 = (void *)v104;
    id v10 = v121;
  }

  [(CSSiriSpeechRecorder *)self _logFanState];
  if (v93)
  {
    BOOL v106 = 1;
    id v17 = v120;
    goto LABEL_137;
  }
  uint64_t v12 = (id *)MEMORY[0x1E4F4E380];
  a5 = v113;
  BOOL v16 = v112;
  id v17 = v120;
LABEL_128:
  [v10 didStopRecordingWithError:v17];
  if (a5) {
    *a5 = v17;
  }
  if (v16
    && ![(CSSiriAudioActivationInfo *)self->_currentActivationInfo shouldSuppressRecordingErrorAlert])
  {
    [(CSSiriSpeechRecorder *)self _playAudioAlert:3];
  }
  v107 = *v12;
  if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
  {
    v109 = &stru_1F2396200;
    *(_DWORD *)long long buf = 136316162;
    v133 = "-[CSSiriSpeechRecorder startSpeechCaptureWithContext:willStartHandler:error:]";
    if (v16) {
      v109 = @", playing error alert";
    }
    __int16 v134 = 1024;
    *(_DWORD *)v135 = v16;
    *(_WORD *)&v135[4] = 1024;
    *(_DWORD *)&v135[6] = 0;
    *(_WORD *)v136 = 2114;
    *(void *)&v136[2] = v17;
    __int16 v137 = 2114;
    v138 = v109;
    _os_log_error_impl(&dword_1C9338000, v107, OS_LOG_TYPE_ERROR, "%s Could not set up recording (prepared = %d, started = %d), returning error %{public}@%{public}@ and resetting voice controller.", buf, 0x2Cu);
  }

  if (v16) {
    [(CSSiriSpeechRecorder *)self _resetSpeechController];
  }
  BOOL v106 = 0;
LABEL_137:

  return v106;
}

void __77__CSSiriSpeechRecorder_startSpeechCaptureWithContext_willStartHandler_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(a1 + 32))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if ((unint64_t)(*(void *)(v4 + 184) - 1) <= 1)
    {
      id v9 = v3;
      [*(id *)(v4 + 88) reset];
      [*(id *)(a1 + 40) _setEndpointStyle:2 * ((unint64_t)(*(void *)(*(void *)(a1 + 40) + 192) - 3) > 1)];
      uint64_t v5 = *(void *)(a1 + 40);
      unint64_t v6 = *(void **)(v5 + 88);
      double v7 = *(double *)(v5 + 272);
      [*(id *)(v5 + 104) activationSystemUptime];
      [v6 setDelay:v7 - v8];
      id v3 = v9;
    }
  }
}

void __77__CSSiriSpeechRecorder_startSpeechCaptureWithContext_willStartHandler_error___block_invoke_109(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setItemURL:v2];
  [v4 setNumberOfLoops:0];
  LODWORD(v3) = 1.0;
  [v4 setVolume:v3];
  [v4 setFadeInDuration:0.0];
  [v4 setFadeOutDuration:0.0];
}

void __77__CSSiriSpeechRecorder_startSpeechCaptureWithContext_willStartHandler_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(a1 + 32))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if ((unint64_t)(*(void *)(v4 + 184) - 1) <= 1)
    {
      id v9 = v3;
      [*(id *)(v4 + 88) reset];
      [*(id *)(a1 + 40) _setEndpointStyle:2 * ((unint64_t)(*(void *)(*(void *)(a1 + 40) + 192) - 3) > 1)];
      uint64_t v5 = *(void *)(a1 + 40);
      unint64_t v6 = *(void **)(v5 + 88);
      double v7 = *(double *)(v5 + 272);
      [*(id *)(v5 + 104) activationSystemUptime];
      [v6 setDelay:v7 - v8];
      id v3 = v9;
    }
  }
}

- (void)prepareForMode:(int64_t)a3 withOptions:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  double v7 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    if ((unint64_t)(a3 - 1) > 4) {
      double v8 = @"Off";
    }
    else {
      double v8 = off_1E658CC00[a3 - 1];
    }
    *(_DWORD *)id v14 = 136315650;
    *(void *)&v14[4] = "-[CSSiriSpeechRecorder prepareForMode:withOptions:]";
    *(_WORD *)&v14[12] = 2112;
    *(void *)&v14[14] = v8;
    *(_WORD *)&v14[22] = 2112;
    id v15 = v6;
    id v9 = v7;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s Preparing speech capture for %@ options:%@", v14, 0x20u);
  }
  -[CSSiriSpeechRecorder _setSpeechCapturingMode:](self, "_setSpeechCapturingMode:", a3, *(_OWORD *)v14, *(void *)&v14[16], v15);
  -[CSSiriSpeechRecorder _setEndpointerOperationMode:forceUpdate:](self, "_setEndpointerOperationMode:forceUpdate:", [v6 endpointerOperationMode], 1);
  id v10 = [(CSSiriSpeechRecorder *)self _mhUUIDFromSpeechRequestOptions:v6];
  mhUUID = self->_mhUUID;
  self->_mhUUID = v10;

  if (!self->_mhUUID)
  {
    uint64_t v12 = [(CSSiriSpeechRecorder *)self _currentMHUUID:1];
    __int16 v13 = self->_mhUUID;
    self->_mhUUID = v12;
  }
}

- (void)prepareForMode:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    double v7 = "-[CSSiriSpeechRecorder prepareForMode:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(CSSiriSpeechRecorder *)self prepareForMode:a3 withOptions:0];
}

- (void)suspendAutomaticEndpointingInRange:(AFTimeRange)a3
{
}

- (id)currentVTSatScore
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[CSSiriSpeechRecorder currentVTSatScore]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v8, 0xCu);
  }
  [(CSSiriAudioActivationInfo *)self->_currentActivationInfo speechEvent];
  if (AFSpeechEventIsVoiceTrigger())
  {
    uint64_t v4 = [(CSSpeechController *)self->_speechController voiceTriggerInfo];
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [v4 objectForKey:@"satScore"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)recordingInfoForPreheatWithEvent:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    uint64_t v10 = "-[CSSiriSpeechRecorder recordingInfoForPreheatWithEvent:]";
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v9, 0xCu);
  }
  id v6 = [(CSSiriSpeechRecorder *)self _speechController];
  double v7 = [(CSSiriSpeechRecorder *)self _recordingInfoForEvent:a3 audioAlertStyle:0 includeBTInfo:0 includeRecordDeviceInfo:0];
  return v7;
}

- (BOOL)prepareSpeechCaptureWithOptions:(unint64_t)a3 error:(id *)a4
{
  BOOL v6 = [(CSSiriSpeechRecorder *)self _prepareSpeechControllerWithOptions:a3 error:a4];
  if (v6)
  {
    double v7 = NSStringFromSelector(a2);
    [(CSSiriSpeechRecorder *)self _updateAudioDeviceInfo:0 forReason:v7 forcesUpdate:0];
  }
  return v6;
}

- (void)preheatRecognizerWithOption:(id)a3
{
  id v6 = a3;
  int v3 = [v6 isTest];
  if ((AFDeviceSupportsSiriUOD() & 1) != 0
    || AFOfflineDictationCapable()
    && ([v6 skipPersonalizedASR] & 1) == 0
    && ((v3 ^ 1) & 1) == 0)
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F72FE8]) initWithDelegate:0];
    if (v6)
    {
      uint64_t v5 = [v6 preheatLanguage];
    }
    else
    {
      uint64_t v5 = 0;
    }
    [v4 preheatLocalSpeechRecognitionWithLanguage:v5 source:1];
    [v4 invalidate];
  }
}

- (void)preheatWithOption:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  pendingActivationInfo = self->_pendingActivationInfo;
  if (!pendingActivationInfo) {
    pendingActivationInfo = self->_currentActivationInfo;
  }
  id v6 = pendingActivationInfo;
  if ([(CSSiriAudioActivationInfo *)v6 canPrewarm])
  {
    double v7 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
    int v8 = [(CSSiriSpeechRecorder *)self _speechController];
    int v9 = (os_log_t *)MEMORY[0x1E4F4E380];
    uint64_t v10 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v27 = 136315138;
      id v28 = "-[CSSiriSpeechRecorder preheatWithOption:]";
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s Prewarming audio session in speech controller", (uint8_t *)&v27, 0xCu);
    }
    uint64_t v11 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v11 logEventWithType:205 context:0];

    uint64_t v12 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    [v12 logMHAssistantDaemonAudioPrewarmContextWithMHUUID:v7 withPrewarmStarted:1];

    kdebug_trace();
    [v8 prewarmAudioSession];
    kdebug_trace();
    __int16 v13 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v13 logEventWithType:206 context:0];

    id v14 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    [v14 logMHAssistantDaemonAudioPrewarmContextWithMHUUID:v7 withPrewarmStarted:0];

    id v15 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      int v27 = 136315138;
      id v28 = "-[CSSiriSpeechRecorder preheatWithOption:]";
      _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_INFO, "%s Done prewarm audio session in speech controller", (uint8_t *)&v27, 0xCu);
    }
    if (AFIsHorseman())
    {
      if ([(CSSiriSpeechRecorder *)self _shouldPlaySummonedToneOnTopCapInvocationOnHorseman])
      {
        currentClientConfiguration = self->_currentClientConfiguration;
        if (currentClientConfiguration)
        {
          id v17 = [(AFClientConfiguration *)currentClientConfiguration tapToSiriAudioPlaybackRequest];
          if (v17)
          {
            uint64_t v18 = *v9;
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              int v27 = 136315138;
              id v28 = "-[CSSiriSpeechRecorder preheatWithOption:]";
              _os_log_impl(&dword_1C9338000, v18, OS_LOG_TYPE_INFO, "%s Prewarming start alert", (uint8_t *)&v27, 0xCu);
            }
            [(CSSiriAudioPlaybackService *)self->_audioPlaybackService prewarmRequest:v17 completion:&__block_literal_global_25776];
          }
        }
      }
    }
  }
  else if ([(CSSiriAudioActivationInfo *)v6 canPrepareWithoutInterruption])
  {
    uint64_t v19 = (os_log_t *)MEMORY[0x1E4F4E380];
    uint64_t v20 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v27 = 136315138;
      id v28 = "-[CSSiriSpeechRecorder preheatWithOption:]";
      _os_log_impl(&dword_1C9338000, v20, OS_LOG_TYPE_INFO, "%s Preparing instead of preheating since we're not in the default mode", (uint8_t *)&v27, 0xCu);
    }
    uint64_t v21 = NSStringFromSelector(a2);
    BOOL v22 = [(CSSiriSpeechRecorder *)self _setAudioContextWithInfo:v6 forReason:v21];

    if (v22)
    {
      double v23 = self->_pendingActivationInfo;
      self->_pendingActivationInfo = 0;

      objc_storeStrong((id *)&self->_currentActivationInfo, pendingActivationInfo);
      BOOL v24 = *v19;
      if (os_log_type_enabled(*v19, OS_LOG_TYPE_INFO))
      {
        currentActivationInfo = self->_currentActivationInfo;
        int v27 = 136315394;
        id v28 = "-[CSSiriSpeechRecorder preheatWithOption:]";
        __int16 v29 = 2112;
        uint64_t v30 = currentActivationInfo;
        _os_log_impl(&dword_1C9338000, v24, OS_LOG_TYPE_INFO, "%s Set pending info as current %@.", (uint8_t *)&v27, 0x16u);
      }
    }
    [(CSSiriSpeechRecorder *)self _prepareSpeechControllerWithOptions:4 error:0];
  }
  else
  {
    id v26 = [(CSSiriSpeechRecorder *)self _speechController];
  }
}

void __42__CSSiriSpeechRecorder_preheatWithOption___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  int v3 = *MEMORY[0x1E4F4E380];
  BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR);
  if (v2)
  {
    if (v4)
    {
      int v8 = 136315394;
      int v9 = "-[CSSiriSpeechRecorder preheatWithOption:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v2;
      uint64_t v5 = "%s Failed to prewarm start alert due to %@";
      id v6 = v3;
      uint32_t v7 = 22;
LABEL_7:
      _os_log_error_impl(&dword_1C9338000, v6, OS_LOG_TYPE_ERROR, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    int v8 = 136315138;
    int v9 = "-[CSSiriSpeechRecorder preheatWithOption:]_block_invoke";
    uint64_t v5 = "%s Done prewarming start alert";
    id v6 = v3;
    uint32_t v7 = 12;
    goto LABEL_7;
  }
}

- (void)eagerlyInitializeAudioRecording
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    id v6 = "-[CSSiriSpeechRecorder eagerlyInitializeAudioRecording]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(CSSiriSpeechRecorder *)self _speechController];
}

- (void)_stopRecordingForEndpointReason:(id)a3 withEndpointMetrics:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  int64_t recordingState = self->_recordingState;
  int v8 = *MEMORY[0x1E4F4E380];
  int v9 = *MEMORY[0x1E4F4E380];
  if (recordingState == 2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      id v11 = "-[CSSiriSpeechRecorder _stopRecordingForEndpointReason:withEndpointMetrics:]";
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
    }
    -[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:](self, "_stopRecordingWithReason:hostTime:", a3.var1, [v6 endpointBufferHostTime]);
    [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturingWillStopRecording];
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v10 = 136315394;
    id v11 = "-[CSSiriSpeechRecorder _stopRecordingForEndpointReason:withEndpointMetrics:]";
    __int16 v12 = 2048;
    int64_t v13 = recordingState;
    _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s Ignoring unexpected stop recording while in state %ld", (uint8_t *)&v10, 0x16u);
  }
}

- (void)_setEndpointStyle:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "-[CSSiriSpeechRecorder _setEndpointStyle:]";
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s %ld", (uint8_t *)&v8, 0x16u);
  }
  if (a3 == 2)
  {
    [(CSEndpointAnalyzer *)self->_endpointAnalyzer setStartWaitTime:60.0];
    [(CSEndpointAnalyzer *)self->_endpointAnalyzer setEndWaitTime:60.0];
  }
  else
  {
    if (a3 == 1)
    {
      [(CSEndpointAnalyzer *)self->_endpointAnalyzer setEndWaitTime:0.5];
      endpointAnalyzer = self->_endpointAnalyzer;
      double v7 = 0.5;
    }
    else
    {
      if (a3) {
        return;
      }
      [(CSEndpointAnalyzer *)self->_endpointAnalyzer setStartWaitTime:5.0];
      [(CSEndpointAnalyzer *)self->_endpointAnalyzer setEndWaitTime:0.77];
      endpointAnalyzer = self->_endpointAnalyzer;
      double v7 = 0.36;
    }
    [(CSEndpointAnalyzer *)endpointAnalyzer setInterspeechWaitTime:v7];
  }
}

- (void)_setupAudioFileWritingForSpeechController:(id)a3 info:(id)a4 context:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = (os_log_t *)MEMORY[0x1E4F4E380];
  uint64_t v12 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v9;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&unsigned char buf[24] = v10;
    _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s info = %@, context = %@", buf, 0x20u);
  }
  if (self->_audioFileType)
  {
    audioFileHandle = self->_audioFileHandle;
    uint64_t v14 = [CSSiriAudioFileWriter alloc];
    int64_t audioFileType = self->_audioFileType;
    if (audioFileHandle) {
      uint64_t v16 = [(CSSiriAudioFileWriter *)v14 initWithType:audioFileType fileHandle:self->_audioFileHandle priority:25];
    }
    else {
      uint64_t v16 = [(CSSiriAudioFileWriter *)v14 initWithType:audioFileType pathGenerator:0 priority:25];
    }
    audioFileWriter = self->_audioFileWriter;
    self->_audioFileWriter = v16;

    uint64_t v20 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = self->_audioFileWriter;
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      _os_log_impl(&dword_1C9338000, v20, OS_LOG_TYPE_INFO, "%s Created _audioFileWriter %@.", buf, 0x16u);
    }
  }
  else
  {
    id v17 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 0;
      _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_INFO, "%s Did not create _audioFileWriter because int64_t audioFileType = %ld.", buf, 0x16u);
    }
    uint64_t v18 = self->_audioFileWriter;
    self->_audioFileWriter = 0;
  }
  BOOL v22 = [MEMORY[0x1E4FB4FE0] sharedPreferences];
  if ([v22 isVoiceTriggerAvailable])
  {
    double v23 = [MEMORY[0x1E4F4E538] sharedPreferences];
    int v24 = [v23 cloudSyncEnabled];
  }
  else
  {
    int v24 = 0;
  }

  id v25 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v24;
    _os_log_impl(&dword_1C9338000, v25, OS_LOG_TYPE_INFO, "%s supportsVoiceIdentificationTraining = %d", buf, 0x12u);
  }
  int v26 = AFSupportsSpeechExtraction();
  int v27 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v26;
    _os_log_impl(&dword_1C9338000, v27, OS_LOG_TYPE_INFO, "%s supportsSpeechExtraction = %d", buf, 0x12u);
  }
  if ([v9 canGetPCMStream])
  {
    id v28 = [MEMORY[0x1E4F4E538] sharedPreferences];
    int v29 = [v28 fileLoggingIsEnabled];
  }
  else
  {
    int v29 = 0;
  }
  uint64_t v30 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v26;
    _os_log_impl(&dword_1C9338000, v30, OS_LOG_TYPE_INFO, "%s supportsSpeechLogging = %d", buf, 0x12u);
  }
  if (self->_audioFileWriter)
  {
    uint64_t v31 = [v8 recordSettings];
    uint64_t v52 = 0;
    memset(buf, 0, sizeof(buf));
    _LPCMStreamASBDForSpeechControllerSettings((uint64_t)buf, v31);
    uint64_t v32 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)double v45 = 136315394;
      double v46 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
      __int16 v47 = 2112;
      id v48 = v31;
      _os_log_impl(&dword_1C9338000, v32, OS_LOG_TYPE_INFO, "%s Configure _audioFileWriter with recordSettings = %@.", v45, 0x16u);
    }
    [(CSSiriAudioFileWriter *)self->_audioFileWriter configureWithAudioStreamBasicDescription:buf];
  }
  if ((v24 | v26 | v29) == 1)
  {
    uint64_t v33 = [v8 recordSettings];
    uint64_t v52 = 0;
    memset(buf, 0, sizeof(buf));
    _LPCMStreamASBDForSpeechControllerSettings((uint64_t)buf, v33);
    double v34 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)double v45 = 136315650;
      double v46 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
      __int16 v47 = 2112;
      id v48 = v10;
      __int16 v49 = 2112;
      double v50 = v33;
      _os_log_impl(&dword_1C9338000, v34, OS_LOG_TYPE_INFO, "%s Ask context %@ to configure and record with recordSettings = %@.", v45, 0x20u);
    }
    [v10 beginRecordingAudioWithAudioStreamBasicDescription:buf];
    if (v29)
    {
      id v35 = objc_alloc_init(MEMORY[0x1E4F1C9C8]);
      [v9 speechEvent];
      int IsVoiceTrigger = AFSpeechEventIsVoiceTrigger();
      uint64_t v37 = @"DT";
      if (IsVoiceTrigger) {
        uint64_t v37 = @"VT";
      }
      BOOL v38 = v37;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __79__CSSiriSpeechRecorder__setupAudioFileWritingForSpeechController_info_context___block_invoke;
      v42[3] = &unk_1E658C670;
      void v42[4] = self;
      id v43 = v35;
      __int16 v44 = v38;
      id v39 = v38;
      id v40 = v35;
      [v10 acquireRecordedAudioWithHandler:v42];
    }
  }
  int64_t v41 = *v11;
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]";
    _os_log_impl(&dword_1C9338000, v41, OS_LOG_TYPE_INFO, "%s Done", buf, 0xCu);
  }
}

void __79__CSSiriSpeechRecorder__setupAudioFileWritingForSpeechController_info_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  double v7 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v8 = *MEMORY[0x1E4F4E380];
  id v9 = *MEMORY[0x1E4F4E380];
  if (!v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      int v26 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s Unable to acquire recorded audio for speech logging.", buf, 0xCu);
      if (!v6) {
        goto LABEL_20;
      }
    }
    else if (!v6)
    {
      goto LABEL_20;
    }
LABEL_19:
    v6[2](v6);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315394;
    int v26 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]_block_invoke";
    __int16 v27 = 2112;
    id v28 = v5;
    _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s Acquired recorded audio for speech logging: %@", buf, 0x16u);
  }
  id v10 = AFSpeechLogsDirectory();
  if (v10 && [*(id *)(a1 + 32) _prepareDirectoryAtPath:v10])
  {
    if ([*(id *)(a1 + 32) _checkAudioLoggingLimits:v10])
    {
      id v11 = [NSString alloc];
      if (_CSSiriSpeechAudioRecordingDateFormatter_onceToken != -1) {
        dispatch_once(&_CSSiriSpeechAudioRecordingDateFormatter_onceToken, &__block_literal_global_681);
      }
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = (id)_CSSiriSpeechAudioRecordingDateFormatter_dateFormatter;
      uint64_t v14 = [v13 stringFromDate:v12];
      id v15 = (void *)[v11 initWithFormat:@"PCM-%@-%@.wav", v14, *(void *)(a1 + 48)];

      uint64_t v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10 isDirectory:1];
      id v17 = [v16 URLByAppendingPathComponent:v15];

      uint64_t v18 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v24 = 0;
      int v19 = [v18 linkItemAtURL:v5 toURL:v17 error:&v24];
      id v20 = v24;

      uint64_t v21 = *v7;
      if (!v19 || v20)
      {
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315394;
          int v26 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]_block_invoke";
          __int16 v27 = 2112;
          id v28 = v20;
          _os_log_error_impl(&dword_1C9338000, v21, OS_LOG_TYPE_ERROR, "%s Unable to save recorded audio for speech logging due to error %@.", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        int v26 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]_block_invoke";
        __int16 v27 = 2112;
        id v28 = v17;
        _os_log_impl(&dword_1C9338000, v21, OS_LOG_TYPE_INFO, "%s Speech Log: %@", buf, 0x16u);
      }
    }
    else
    {
      double v23 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        int v26 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]_block_invoke";
        _os_log_impl(&dword_1C9338000, v23, OS_LOG_TYPE_INFO, "%s Skipped saving recorded audio for speech logging due to audio logging limit.", buf, 0xCu);
      }
    }
  }
  else
  {
    BOOL v22 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      int v26 = "-[CSSiriSpeechRecorder _setupAudioFileWritingForSpeechController:info:context:]_block_invoke";
      _os_log_error_impl(&dword_1C9338000, v22, OS_LOG_TYPE_ERROR, "%s Unable to prepare directory for speech logging.", buf, 0xCu);
    }
  }

  if (v6) {
    goto LABEL_19;
  }
LABEL_20:
}

- (BOOL)_prepareDirectoryAtPath:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v11 = 0;
  if ([v4 fileExistsAtPath:v3 isDirectory:&v11])
  {
    if (v11)
    {
      char v5 = 1;
    }
    else
    {
      id v8 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        id v13 = "-[CSSiriSpeechRecorder _prepareDirectoryAtPath:]";
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s An item already exists at path %@, but it is not a directory.", buf, 0x16u);
      }
      char v5 = 0;
    }
  }
  else
  {
    id v10 = 0;
    char v5 = [v4 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v10];
    id v6 = v10;
    if (v6) {
      char v5 = 0;
    }
    if ((v5 & 1) == 0)
    {
      double v7 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315650;
        id v13 = "-[CSSiriSpeechRecorder _prepareDirectoryAtPath:]";
        __int16 v14 = 2112;
        id v15 = v3;
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_error_impl(&dword_1C9338000, v7, OS_LOG_TYPE_ERROR, "%s Failed to create directory at path %@ due to error %@.", buf, 0x20u);
      }
    }
  }
  return v5;
}

- (BOOL)_checkAudioLoggingLimits:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F4E538] sharedPreferences];
  int v5 = [v4 limitedAudioLoggingEnabled];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    double v7 = [v6 enumeratorAtPath:v3];
    uint64_t v8 = [v7 nextObject];
    if (v8)
    {
      id v9 = (void *)v8;
      unsigned int v10 = 0;
      do
      {
        v10 += [v9 hasSuffix:@"wav"];
        uint64_t v11 = [v7 nextObject];

        id v9 = (void *)v11;
      }
      while (v11);
    }
    else
    {
      unsigned int v10 = 0;
    }
    BOOL v12 = v10 < 0xA;
    id v13 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v15 = 136315650;
      __int16 v16 = "-[CSSiriSpeechRecorder _checkAudioLoggingLimits:]";
      __int16 v17 = 1024;
      unsigned int v18 = v10;
      __int16 v19 = 1024;
      BOOL v20 = v10 < 0xA;
      _os_log_impl(&dword_1C9338000, v13, OS_LOG_TYPE_INFO, "%s Checked audio logging limits, count = %d -> %d", (uint8_t *)&v15, 0x18u);
    }
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)_playAudioAlert:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int v5 = NSStringFromSelector(a2);
  [(CSSiriSpeechRecorder *)self _updateAudioContextToPostVoiceForReason:v5];

  numberOfAVVCAlertPlaybacksByType = self->_numberOfAVVCAlertPlaybacksByType;
  if (numberOfAVVCAlertPlaybacksByType)
  {
    double v7 = [NSNumber numberWithInteger:a3];
    uint64_t v8 = [(NSMutableDictionary *)numberOfAVVCAlertPlaybacksByType objectForKey:v7];
    numberOfAVVCAlertPlaybacksByType = (NSMutableDictionary *)[v8 unsignedIntegerValue];
  }
  else
  {
    id v9 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
    double v7 = self->_numberOfAVVCAlertPlaybacksByType;
    self->_numberOfAVVCAlertPlaybacksByType = v9;
  }

  unsigned int v10 = self->_numberOfAVVCAlertPlaybacksByType;
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:(char *)&numberOfAVVCAlertPlaybacksByType->super.super.isa + 1];
  BOOL v12 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)v10 setObject:v11 forKey:v12];

  if (!numberOfAVVCAlertPlaybacksByType)
  {
    alertPlaybackGroup = self->_alertPlaybackGroup;
    if (!alertPlaybackGroup)
    {
      __int16 v14 = (OS_dispatch_group *)dispatch_group_create();
      int v15 = self->_alertPlaybackGroup;
      self->_alertPlaybackGroup = v14;

      alertPlaybackGroup = self->_alertPlaybackGroup;
    }
    dispatch_group_enter(alertPlaybackGroup);
  }
  __int16 v16 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v17 = 136315394;
    unsigned int v18 = "-[CSSiriSpeechRecorder _playAudioAlert:]";
    __int16 v19 = 2048;
    int64_t v20 = a3;
    _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_INFO, "%s Playing alert %ld", (uint8_t *)&v17, 0x16u);
  }
  [(CSSpeechController *)self->_speechController playAlertSoundForType:a3];
}

- (int)_mapInstrumentationEndpointTypeFromStopRecordingReason:(id)a3
{
  int result = 6;
  switch(a3.var0.var0)
  {
    case 1u:
      if ((unint64_t)(self->_endpointerOperationMode - 3) < 2
        || (self->_speechCapturingMode & 0xFFFFFFFFFFFFFFFBLL) != 1)
      {
        goto LABEL_6;
      }
      int result = 1;
      break;
    case 2u:
    case 3u:
LABEL_6:
      int result = 2;
      break;
    case 4u:
      if (self->_serverDidEndpoint) {
        int result = 3;
      }
      else {
        int result = 2;
      }
      break;
    case 5u:
      if ((unsigned __int16)(a3.var0.var1 - 1) >= 5u) {
        int result = 5;
      }
      else {
        int result = dword_1C94A6FB4[(unsigned __int16)(a3.var0.var1 - 1)];
      }
      break;
    case 6u:
    case 7u:
    case 8u:
      return result;
    default:
      int result = 0;
      break;
  }
  return result;
}

- (BOOL)_shouldEmitInstrumentation
{
  id v2 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo turnIdentifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_reportServerEndpointMetricsIfNeeded
{
  BOOL v3 = [(NSDictionary *)self->_speechRecognizedContextForServerEndpointInstrumentation objectForKey:@"endTime"];
  id v4 = [(NSDictionary *)self->_speechRecognizedContextForServerEndpointInstrumentation objectForKey:@"leadingSilence"];
  uint64_t v5 = [(NSDictionary *)self->_speechRecognizedContextForServerEndpointInstrumentation objectForKey:@"trailingSilence"];
  id v6 = (void *)v5;
  if (self->_stopRecordingReason == 2 && v3 != 0 && v5 != 0)
  {
    unint64_t firstBufferHostTime = self->_firstBufferHostTime;
    double skippedSamplesTimeInSec = self->_skippedSamplesTimeInSec;
    unint64_t stopRecordingMachContinuousTime = self->_stopRecordingMachContinuousTime;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__CSSiriSpeechRecorder__reportServerEndpointMetricsIfNeeded__block_invoke;
    block[3] = &unk_1E658C648;
    void block[4] = self;
    id v14 = v3;
    id v15 = v4;
    id v16 = v6;
    unint64_t v17 = stopRecordingMachContinuousTime;
    double v18 = skippedSamplesTimeInSec;
    unint64_t v19 = firstBufferHostTime;
    dispatch_async(queue, block);
  }
}

uint64_t __60__CSSiriSpeechRecorder__reportServerEndpointMetricsIfNeeded__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 408);
  [*(id *)(a1 + 40) doubleValue];
  double v4 = v3;
  [*(id *)(a1 + 48) doubleValue];
  double v6 = v5;
  [*(id *)(a1 + 56) doubleValue];
  uint64_t v8 = *(void *)(a1 + 64);
  double v9 = *(double *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  return [v2 instrumentEndpointSignpostsForServerEndpointWithEndTime:v8 leadingSilence:v10 trailingSilence:v4 stopRecordingMachContinuousTime:v6 skippedSamplesTimeInSec:v7 firstAudioSampleSensorHostTime:v9];
}

- (void)_stopRecordingWithReason:(id)a3 hostTime:(unint64_t)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  int var0 = a3.var0.var0;
  uint64_t v8 = (os_log_t *)MEMORY[0x1E4F4E380];
  double v9 = *MEMORY[0x1E4F4E380];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO);
  if (var0 == 5)
  {
    if (v10)
    {
      uint64_t v11 = v9;
      BOOL v12 = AFSpeechEventGetDescription();
      *(_DWORD *)long long buf = 136316162;
      v65 = "-[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:]";
      __int16 v66 = 1024;
      int v67 = 5;
      __int16 v68 = 2048;
      unint64_t var1 = a3.var0.var1;
      __int16 v70 = 2112;
      char v71 = v12;
      __int16 v72 = 2048;
      unint64_t v73 = a4;
      _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_INFO, "%s reason = %d, speechEvent = %zd (%@), hostTime = %llu", buf, 0x30u);
    }
  }
  else if (v10)
  {
    *(_DWORD *)long long buf = 136315650;
    v65 = "-[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:]";
    __int16 v66 = 1024;
    int v67 = var0;
    __int16 v68 = 2048;
    unint64_t var1 = a4;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s reason = %d, hostTime = %llu", buf, 0x1Cu);
  }
  [(CSSiriSpeechRecordingContext *)self->_context willStopRecordingAtHostTime:a4];
  [(CSSiriSpeechRecorder *)self _cancelExtendedEndpointTimer];
  int64_t recordingState = self->_recordingState;
  if ((unint64_t)(recordingState - 1) >= 2)
  {
    if (recordingState != 3)
    {
LABEL_57:
      v58 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        v65 = "-[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:]";
        _os_log_error_impl(&dword_1C9338000, v58, OS_LOG_TYPE_ERROR, "%s Sending stop recording immediately because CSSpeechController isn't recording", buf, 0xCu);
      }
      [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturingDidStopRecordingWithError:0 endpointMode:0 totalPacketCount:self->_packetCount endpointerMetrics:0];
      return;
    }
    unint64_t v19 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      v65 = "-[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:]";
      _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_INFO, "%s Someone else has already asked to stop recording.", buf, 0xCu);
    }
    self->_didPerformTwoShotPrompt = 0;
  }
  else
  {
    speechController = self->_speechController;
    if (speechController)
    {
      id v15 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
      [(CSEndpointDelayReporter *)self->_endpointDelayReporter setStopRecordingHostTime:mach_absolute_time()];
      lastEndpointerMetrics = self->_lastEndpointerMetrics;
      endpointDelayReporter = self->_endpointDelayReporter;
      if (lastEndpointerMetrics) {
        [(CSEndpointerMetrics *)lastEndpointerMetrics totalAudioRecorded];
      }
      else {
        double v18 = 0.0;
      }
      [(CSEndpointDelayReporter *)endpointDelayReporter setEndpointTimeInMs:v18];
      [(CSEndpointDelayReporter *)self->_endpointDelayReporter reportEndpointDelayIfNeed];
      int64_t v20 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
      v62[0] = MEMORY[0x1E4F143A8];
      v62[1] = 3221225472;
      v62[2] = __58__CSSiriSpeechRecorder__stopRecordingWithReason_hostTime___block_invoke;
      v62[3] = &__block_descriptor_36_e19___NSDictionary_8__0l;
      unsigned int v63 = a3.var1;
      [v20 logEventWithType:216 contextProvider:v62];

      uint64_t v21 = [MEMORY[0x1E4F5D2D0] sharedLogger];
      [v21 logMHAssistantDaemonAudioStopRecordingContextWithMHUUID:v15 withStopRecordingStarted:1 withADStopRecordingEvent:a3.var0.var0];

      if ([(CSSiriSpeechRecorder *)self _shouldEmitInstrumentation])
      {
        __int16 v59 = v15;
        id v22 = objc_alloc_init(MEMORY[0x1E4FA1268]);
        double v23 = v22;
        id v24 = speechController;
        if (a3.var0.var0 > 8u) {
          uint64_t v25 = 0;
        }
        else {
          uint64_t v25 = dword_1C94A6F90[(__int16)a3.var0.var0];
        }
        objc_msgSend(v22, "setStopReasonMajor:", v25, v59);
        unsigned int v26 = (unsigned __int16)(a3.var0.var1 - 1);
        if (v26 < 0xB) {
          uint64_t v27 = v26 + 1;
        }
        else {
          uint64_t v27 = 0;
        }
        [v23 setStopReasonMinor:v27];
        id v28 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
        uint64_t v29 = mach_absolute_time();
        uint64_t v30 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo turnIdentifier];
        [v28 logInstrumentation:v23 machAbsoluteTime:v29 turnIdentifier:v30];

        speechController = v24;
        id v15 = v60;
      }
      if (AFIsInternalInstall())
      {
        uint64_t v31 = *v8;
        os_signpost_id_t v32 = os_signpost_id_generate(*v8);
        if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v33 = v32;
          if (os_signpost_enabled(v31))
          {
            *(_WORD *)long long buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1C9338000, v31, OS_SIGNPOST_EVENT, v33, "SpeechRecorder", "StopRecording", buf, 2u);
          }
        }
      }
      kdebug_trace();
      double v34 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        v65 = "-[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:]";
        _os_log_impl(&dword_1C9338000, v34, OS_LOG_TYPE_INFO, "%s Really stopping recording", buf, 0xCu);
      }
      id v35 = *MEMORY[0x1E4F5D180];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        v65 = "_ADSpeechRecorderGetCSStopRecordingReason";
        __int16 v66 = 1024;
        int v67 = var0;
        _os_log_impl(&dword_1C9338000, v35, OS_LOG_TYPE_DEFAULT, "%s inReason.parts.event:%u", buf, 0x12u);
      }
      switch(a3.var0.var0)
      {
        case 2u:
        case 3u:
          unint64_t v36 = 1;
          break;
        case 4u:
          unint64_t v36 = 2;
          break;
        case 5u:
          unint64_t v36 = 2 * ((a3.var1 & 0xFFFF0000) == 327680);
          break;
        case 6u:
          unint64_t v36 = 4;
          break;
        case 7u:
          unint64_t v36 = 3;
          break;
        default:
          unint64_t v36 = 0;
          break;
      }
      self->_unint64_t stopRecordingReason = v36;
      self->_unint64_t stopRecordingMachContinuousTime = mach_continuous_time();
      if ([MEMORY[0x1E4F5D450] isContinuousConversationSupported]
        && self->_shouldDisableSpeechPacketGeneration)
      {
        int v61 = speechController;
        uint64_t v37 = [(CSSiriSpeechRecorder *)self _currentRecordRoute];
        BOOL v38 = [(CSSiriSpeechRecorder *)self _currentPlaybackRoute];
        uint64_t v39 = [(CSSiriSpeechRecorder *)self _audioSessionID];
        id v40 = +[CSAttSiriMagusSupportedPolicy sharedInstance];
        int64_t v41 = [(CSSiriAudioActivationInfo *)self->_currentActivationInfo recordContext];
        BOOL v42 = [(CSSiriSpeechRecorder *)self _currentRecordDeviceInfo];
        uint64_t v43 = [v40 isMagusSupportedWithAudioRecordContext:v41 recordRoute:v37 playbackRoute:v38 audioSessionId:v39 recordDeviceInfo:v42];

        if (v43)
        {
          __int16 v44 = *MEMORY[0x1E4F5D180];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D180], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            v65 = "-[CSSiriSpeechRecorder _stopRecordingWithReason:hostTime:]";
            _os_log_impl(&dword_1C9338000, v44, OS_LOG_TYPE_DEFAULT, "%s Requesting audio stream hold until flexible followup pick up", buf, 0xCu);
          }
          double v45 = (void *)[objc_alloc(MEMORY[0x1E4F5D238]) initWithTimeout:5 clientIdentity:0 requireRecordModeLock:1 requireListeningMicIndicatorLock:1.0];
        }
        else
        {
          double v45 = 0;
        }
        uint64_t v8 = (os_log_t *)MEMORY[0x1E4F4E380];
        speechController = v61;
      }
      else
      {
        uint64_t v43 = 0;
        double v45 = 0;
      }
      id v46 = objc_alloc(MEMORY[0x1E4F5D220]);
      unint64_t stopRecordingReason = self->_stopRecordingReason;
      [(CSEndpointerMetrics *)self->_lastEndpointerMetrics trailingSilenceDurationAtEndpoint];
      id v48 = objc_msgSend(v46, "initWithStopRecordingReason:expectedStopHostTime:trailingSilenceDurationAtEndpoint:holdRequest:supportsMagus:", stopRecordingReason, a4, v45, v43);
      [(CSSpeechController *)self->_speechController stopRecordingWithOptions:v48];
      __int16 v49 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
      [v49 logEventWithType:217 context:0];

      double v50 = [MEMORY[0x1E4F5D2D0] sharedLogger];
      [v50 logMHAssistantDaemonAudioStopRecordingContextWithMHUUID:v15 withStopRecordingStarted:0 withADStopRecordingEvent:0];

      if (self->_stopRecordingReason == 2)
      {
        BOOL v51 = [v15 UUIDString];
        +[CSEndpointLoggingHelper reportServerEndpointWithMhId:v51];

        [(CSSiriSpeechRecorder *)self _reportServerEndpointMetricsIfNeeded];
      }
      uint64_t v52 = (id *)MEMORY[0x1E4F4E360];
      os_signpost_id_t v53 = os_signpost_id_generate((os_log_t)*MEMORY[0x1E4F4E360]);
      char v54 = *v52;
      char v55 = v54;
      if (v53 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9338000, v55, OS_SIGNPOST_INTERVAL_BEGIN, v53, "UsefulUserFacingResults", (const char *)&unk_1C94ED623, buf, 2u);
      }

      [(CSSiriSpeechCapturingDelegate *)self->_delegate speechCapturingWillStopRecordingWithSignpostID:v53];
      [(CSSiriSpeechRecorder *)self _logFanState];

      int64_t recordingState = self->_recordingState;
    }
    if (recordingState == 1)
    {
      char v56 = self->_speechController;
      v57 = [MEMORY[0x1E4F4E478] errorWithCode:216];
      [(CSSiriSpeechRecorder *)self _speechControllerDidStartRecording:v56 successfully:0 error:v57];
    }
    self->_int64_t recordingState = 3;
    if (!speechController) {
      goto LABEL_57;
    }
  }
}

id __58__CSSiriSpeechRecorder__stopRecordingWithReason_hostTime___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  double v4 = @"reason";
  uint64_t v1 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d.%d", *(unsigned __int16 *)(a1 + 32), *(unsigned __int16 *)(a1 + 34));
  v5[0] = v1;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (BOOL)_prepareSpeechControllerWithOptions:(unint64_t)a3 error:(id *)a4
{
  double v4 = a4;
  v70[1] = *MEMORY[0x1E4F143B8];
  if (a4) {
    *a4 = 0;
  }
  pendingActivationInfo = self->_pendingActivationInfo;
  if (!pendingActivationInfo) {
    pendingActivationInfo = self->_currentActivationInfo;
  }
  uint64_t v8 = pendingActivationInfo;
  double v9 = (os_log_t *)MEMORY[0x1E4F4E380];
  if ((a3 & 4) == 0
    || !CSIsMacMini()
    || ([(CSSiriAudioActivationInfo *)v8 deviceIdentifier],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    if (AFIsInternalInstall())
    {
      id v11 = objc_alloc(MEMORY[0x1E4F4E688]);
      queue = self->_queue;
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __66__CSSiriSpeechRecorder__prepareSpeechControllerWithOptions_error___block_invoke;
      v59[3] = &unk_1E658D4D8;
      id v60 = 0;
      id v13 = (void *)[v11 initWithTimeoutInterval:queue onQueue:v59 timeoutHandler:6.0];
      [v13 start];
    }
    else
    {
      id v13 = 0;
    }
    v69 = @"CSSpeechRecordSettingsKey_asrOnDevice";
    id v14 = [NSNumber numberWithBool:self->_shouldDisableSpeechPacketGeneration];
    v70[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
    uint64_t v16 = [(CSSiriAudioActivationInfo *)v8 recordSettingsWithOptions:a3 appendingSettings:v15];

    unint64_t v17 = *v9;
    if (os_log_type_enabled(*v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      double v62 = "-[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:]";
      __int16 v63 = 2112;
      uint64_t v64 = v16;
      _os_log_impl(&dword_1C9338000, v17, OS_LOG_TYPE_INFO, "%s Preparing CSSpeechController with settings %@", buf, 0x16u);
    }
    id v58 = 0;
    double v18 = [(CSSiriSpeechRecorder *)self _speechControllerWithError:&v58];
    unint64_t v19 = (__CFString *)v58;
    char v54 = (void *)v16;
    if (!v18)
    {
      char v25 = 0;
      unsigned int v26 = @"since we have no Voice Controller!";
      if (!v13)
      {
LABEL_42:
        double v45 = *v9;
        id v46 = *v9;
        if (v25)
        {
          __int16 v47 = v54;
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136315138;
            double v62 = "-[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:]";
            _os_log_impl(&dword_1C9338000, v45, OS_LOG_TYPE_INFO, "%s Done preparing CSSpeechController", buf, 0xCu);
          }
          [v18 setSpeakerIdDelegate:self];
          [(CSSiriSpeechRecorder *)self _setLanguageDetectorDelegateIfRequired];
          [(CSAudioSessionController *)self->_audioSessionController registerObserver:self];
          if (!v4) {
            goto LABEL_52;
          }
        }
        else
        {
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315394;
            double v62 = "-[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:]";
            __int16 v63 = 2114;
            uint64_t v64 = (uint64_t)v26;
            _os_log_error_impl(&dword_1C9338000, v45, OS_LOG_TYPE_ERROR, "%s Error setting up CSSpeechController %{public}@", buf, 0x16u);
          }
          [(CSSiriSpeechRecorder *)self _resetSpeechController];
          __int16 v47 = v54;
          if (!v4) {
            goto LABEL_52;
          }
        }
        if (v19) {
          *double v4 = v19;
        }
LABEL_52:

        goto LABEL_53;
      }
LABEL_41:
      [v13 cancelIfNotAlreadyCanceled];

      goto LABEL_42;
    }
    os_signpost_id_t v53 = v4;
    int64_t v20 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
    uint64_t v21 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v21 logEventWithType:207 context:0];

    id v22 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    [v22 logMHAssistantDaemonAudioPrepareContextWithMHUUID:v20 withPrepareStarted:1];

    kdebug_trace();
    if (v8)
    {
      double v23 = [(CSSiriAudioActivationInfo *)v8 recordContext];
      int v24 = [v23 isRequestDuringActiveCall];

      if (v24) {
        [(CSSiriSpeechRecorder *)self _setAudioContextWithInfo:v8 forReason:@"requestDuringActiveCall"];
      }
    }
    v57 = v19;
    char v25 = [v18 prepareRecordWithSettings:v16 error:&v57];
    unsigned int v26 = v57;

    if (v25)
    {
      [(CSSiriAudioActivationInfo *)self->_currentActivationInfo audioSessionActivated];
      uint64_t v27 = 0;
      goto LABEL_40;
    }
    id v28 = [(__CFString *)v26 domain];
    uint64_t v29 = *MEMORY[0x1E4F28760];
    if ([v28 isEqualToString:*MEMORY[0x1E4F28760]])
    {
      if ([(__CFString *)v26 code] == -11795
        || [(__CFString *)v26 code] == -11784
        || [(__CFString *)v26 code] == 2)
      {
      }
      else
      {
        uint64_t v50 = [(__CFString *)v26 code];

        if (v50 != 2003329396)
        {
LABEL_28:
          uint64_t v31 = [(__CFString *)v26 domain];
          if ([v31 isEqualToString:v29])
          {
            uint64_t v32 = [(__CFString *)v26 code];

            if (v32 != 561017449)
            {
LABEL_34:
              if (v8)
              {
                unint64_t v36 = [(CSSiriAudioActivationInfo *)v8 recordContext];
                int v37 = [v36 isRequestDuringActiveCall];

                if (v37) {
                  uint64_t v38 = 236;
                }
                else {
                  uint64_t v38 = 221;
                }
              }
              else
              {
                uint64_t v38 = 221;
              }
              uint64_t v27 = AFAddInterruptingAudioSessionInfoToAnalyticsContext();
              uint64_t v39 = [MEMORY[0x1E4F5D2A0] sharedInstance];
              [v39 submitAudioIssueReport:*MEMORY[0x1E4F5D570] withError:v26];

              uint64_t v40 = [MEMORY[0x1E4F4E478] errorWithCode:v38 description:0 underlyingError:v26];

              unsigned int v26 = (__CFString *)v40;
LABEL_40:
              int64_t v41 = [MEMORY[0x1E4F28F80] processInfo];
              [v41 systemUptime];
              self->_double lastPrepareTimestamp = v42;

              kdebug_trace();
              uint64_t v43 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
              [v43 logEventWithType:208 context:v27];

              __int16 v44 = [MEMORY[0x1E4F5D2D0] sharedLogger];
              [v44 logMHAssistantDaemonAudioPrepareContextWithMHUUID:v20 withPrepareStarted:0];

              unint64_t v19 = v26;
              double v4 = v53;
              double v9 = (os_log_t *)MEMORY[0x1E4F4E380];
              if (!v13) {
                goto LABEL_42;
              }
              goto LABEL_41;
            }
            uint64_t v31 = +[CSMXSessionMonitor GetCurrentlyActiveSessionCategory];
            os_signpost_id_t v33 = +[CSMXSessionMonitor GetCurrentlyActiveSessionMode];
            double v34 = (void *)*MEMORY[0x1E4F5D158];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_ERROR))
            {
              BOOL v51 = v34;
              uint64_t v52 = [(__CFString *)v26 code];
              *(_DWORD *)long long buf = 136315906;
              double v62 = "-[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:]";
              __int16 v63 = 2048;
              uint64_t v64 = v52;
              __int16 v65 = 2112;
              __int16 v66 = v31;
              __int16 v67 = 2112;
              __int16 v68 = v33;
              _os_log_error_impl(&dword_1C9338000, v51, OS_LOG_TYPE_ERROR, "%s Failed to prepare with Insufficient Priority(%ld), because %@ with %@ is currently active.", buf, 0x2Au);
            }
            id v35 = [MEMORY[0x1E4F5D2D0] sharedLogger];
            [v35 logMHAssistantDaemonAudioSessionActivationFailedWithInsufficientPriority:v20 activeSessionDisplayIDs:0 audioSessionCategory:v31 audioSessionMode:v33];
          }
          goto LABEL_34;
        }
      }
      uint64_t v30 = [MEMORY[0x1E4F5D260] sharedInstance];
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __66__CSSiriSpeechRecorder__prepareSpeechControllerWithOptions_error___block_invoke_60;
      v55[3] = &unk_1E658C5E8;
      id v56 = v20;
      [v30 getConnectedBluetoothDeviceAddressesWithCompletion:v55];

      id v28 = v56;
    }

    goto LABEL_28;
  }
  __int16 v49 = *v9;
  char v25 = 0;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    double v62 = "-[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:]";
    _os_log_impl(&dword_1C9338000, v49, OS_LOG_TYPE_DEFAULT, "%s Skip prewarming on MacMini's mic, since it doesn't have built-in mic", buf, 0xCu);
    char v25 = 0;
  }
LABEL_53:

  return v25;
}

uint64_t __66__CSSiriSpeechRecorder__prepareSpeechControllerWithOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    double v5 = "-[CSSiriSpeechRecorder _prepareSpeechControllerWithOptions:error:]_block_invoke";
    _os_log_error_impl(&dword_1C9338000, v2, OS_LOG_TYPE_ERROR, "%s CSSpeechController prepare watchdog firing", (uint8_t *)&v4, 0xCu);
  }
  WriteStackshotReport_async();
  return [*(id *)(a1 + 32) cancel];
}

void __66__CSSiriSpeechRecorder__prepareSpeechControllerWithOptions_error___block_invoke_60(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        uint64_t v8 = +[CSSiriBluetoothManager sharedInstance];
        double v9 = [v8 deviceWithAddress:v7];

        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __66__CSSiriSpeechRecorder__prepareSpeechControllerWithOptions_error___block_invoke_2;
        v11[3] = &unk_1E658C5C0;
        id v12 = *(id *)(a1 + 32);
        [v9 getDeviceInfo:v11];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void __66__CSSiriSpeechRecorder__prepareSpeechControllerWithOptions_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 vendorID];
  uint64_t v5 = [v3 productID];

  id v11 = [MEMORY[0x1E4F5D2D0] sharedLogger];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = [NSNumber numberWithUnsignedInt:v4];
  uint64_t v8 = [v7 stringValue];
  double v9 = [NSNumber numberWithUnsignedInt:v5];
  BOOL v10 = [v9 stringValue];
  [v11 logMHAssistantDaemonAudioRecordingFailedWithMHUUID:v6 withReason:1 vendorId:v8 productId:v10];
}

- (id)_fingerprinter
{
  fingerprinter = self->_fingerprinter;
  if (!fingerprinter)
  {
    uint64_t v4 = objc_alloc_init(CSSiriAcousticFingerprinter);
    uint64_t v5 = self->_fingerprinter;
    self->_fingerprinter = v4;

    [(CSSiriAcousticFingerprinter *)self->_fingerprinter setDelegate:self];
    uint64_t v6 = [(CSSiriSpeechRecorder *)self _speechController];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 getLPCMAudioStreamBasicDescription];
    }
    else
    {
      uint64_t v10 = 0;
      memset(v9, 0, sizeof(v9));
    }

    [(CSSiriAcousticFingerprinter *)self->_fingerprinter setASBD:v9];
    fingerprinter = self->_fingerprinter;
  }
  return fingerprinter;
}

- (void)_resetSpeechController
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[CSSiriSpeechRecorder _resetSpeechController]";
    _os_log_impl(&dword_1C9338000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v10, 0xCu);
  }
  self->_isSpeechControllerInitialized = 0;
  [(CSSpeechController *)self->_speechController setEndpointAnalyzerDelegate:0];
  [(CSSpeechController *)self->_speechController setDelegate:0];
  [(CSSpeechController *)self->_speechController setLanguageDetectorDelegate:0];
  [(CSSpeechController *)self->_speechController setSpeakerIdDelegate:0];
  [(CSSpeechController *)self->_speechController resetAudioSession];
  [(CSEndpointAnalyzer *)self->_endpointAnalyzer reset];
  endpointAnalyzer = self->_endpointAnalyzer;
  self->_endpointAnalyzer = 0;

  self->_recordingAlertsConfiguration = 0;
  context = self->_context;
  uint64_t v6 = [MEMORY[0x1E4F4E478] errorWithCode:227];
  [(CSSiriSpeechRecordingContext *)context didStopRecordingWithError:v6];

  uint64_t v7 = self->_context;
  self->_context = 0;

  mhUUID = self->_mhUUID;
  self->_mhUUID = 0;

  id v9 = [(CSSiriSpeechRecorder *)self _speechController];
}

- (id)_speechControllerWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!self->_speechController)
  {
    uint64_t v27 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
    [v27 handleFailureInMethod:a2 object:self file:@"CSSiriSpeechRecorder.m" lineNumber:594 description:@"Speech controller should not be nil."];
  }
  if (!self->_isSpeechControllerInitialized)
  {
    uint64_t v4 = [(CSSiriSpeechRecorder *)self _currentMHUUID:0];
    pendingActivationInfo = self->_pendingActivationInfo;
    if (!pendingActivationInfo) {
      pendingActivationInfo = self->_currentActivationInfo;
    }
    uint64_t v6 = pendingActivationInfo;
    uint64_t v7 = [(CSSiriAudioActivationInfo *)v6 recordContext];
    uint64_t v8 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v28 = 136315394;
      uint64_t v29 = "-[CSSiriSpeechRecorder _speechControllerWithError:]";
      __int16 v30 = 2112;
      uint64_t v31 = v7;
      _os_log_impl(&dword_1C9338000, v8, OS_LOG_TYPE_INFO, "%s Initalizing speech controller with context %@", (uint8_t *)&v28, 0x16u);
    }
    id v9 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v9 logEventWithType:201 context:0];

    int v10 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    [v10 logMHAssistantDaemonAudioInitContextWithMHUUID:v4 withInitStarted:1];

    kdebug_trace();
    if ([(CSSpeechController *)self->_speechController initializeRecordSessionWithRecordContext:v7])
    {
      id v11 = self->_pendingActivationInfo;
      self->_pendingActivationInfo = 0;

      objc_storeStrong((id *)&self->_currentActivationInfo, pendingActivationInfo);
      uint64_t v12 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
      {
        currentActivationInfo = self->_currentActivationInfo;
        int v28 = 136315394;
        uint64_t v29 = "-[CSSiriSpeechRecorder _speechControllerWithError:]";
        __int16 v30 = 2112;
        uint64_t v31 = currentActivationInfo;
        _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s Set pending info as current %@.", (uint8_t *)&v28, 0x16u);
      }
    }
    long long v14 = [(CSSpeechController *)self->_speechController endpointAnalyzer];
    endpointAnalyzer = self->_endpointAnalyzer;
    self->_endpointAnalyzer = v14;

    [(CSEndpointAnalyzer *)self->_endpointAnalyzer setEndpointStyle:0];
    kdebug_trace();
    long long v16 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v16 logEventWithType:202 context:0];

    unint64_t v17 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    [v17 logMHAssistantDaemonAudioInitContextWithMHUUID:v4 withInitStarted:0];

    self->_isSpeechControllerInitialized = 1;
    uint64_t v18 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v18 logEventWithType:203 context:0];

    unint64_t v19 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    [v19 logMHAssistantDaemonAudioConfigureContextWithMHUUID:v4 withConfigureStarted:1];

    kdebug_trace();
    [(CSSpeechController *)self->_speechController setMeteringEnabled:1];
    [(CSSpeechController *)self->_speechController setEndpointAnalyzerDelegate:self];
    [(CSSpeechController *)self->_speechController setDelegate:self];
    [(CSSpeechController *)self->_speechController setSpeakerIdDelegate:self];
    if (AFIsHorseman()) {
      [(CSSpeechController *)self->_speechController setDuckOthersOption:1];
    }
    [(CSSiriSpeechRecorder *)self _updateRecordBufferDuration];
    kdebug_trace();
    int64_t v20 = [MEMORY[0x1E4F4E3A0] sharedAnalytics];
    [v20 logEventWithType:204 context:0];

    uint64_t v21 = [MEMORY[0x1E4F5D2D0] sharedLogger];
    [v21 logMHAssistantDaemonAudioConfigureContextWithMHUUID:v4 withConfigureStarted:0];

    id v22 = +[CSAttSiriMagusSupportedPolicy sharedInstance];
    double v23 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v28 = 136315138;
      uint64_t v29 = "-[CSSiriSpeechRecorder _speechControllerWithError:]";
      _os_log_impl(&dword_1C9338000, v23, OS_LOG_TYPE_INFO, "%s Done initializing voice controller", (uint8_t *)&v28, 0xCu);
    }
  }
  speechController = self->_speechController;
  return speechController;
}

- (id)_speechController
{
  return [(CSSiriSpeechRecorder *)self _speechControllerWithError:0];
}

- (void)_updateRecordBufferDuration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  speechController = self->_speechController;
  if (speechController)
  {
    uint64_t v4 = (os_log_t *)MEMORY[0x1E4F4E380];
    uint64_t v5 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      id v11 = "-[CSSiriSpeechRecorder _updateRecordBufferDuration]";
      __int16 v12 = 2048;
      uint64_t v13 = 0x3FA47AE147AE147BLL;
      _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s Trying to set record buffer duration to %lf", (uint8_t *)&v10, 0x16u);
      speechController = self->_speechController;
    }
    if (![(CSSpeechController *)speechController setRecordBufferDuration:0.04])
    {
      os_log_t v6 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = self->_speechController;
        uint64_t v8 = v6;
        [(CSSpeechController *)v7 getRecordBufferDuration];
        int v10 = 136315394;
        id v11 = "-[CSSiriSpeechRecorder _updateRecordBufferDuration]";
        __int16 v12 = 2050;
        uint64_t v13 = v9;
        _os_log_error_impl(&dword_1C9338000, v8, OS_LOG_TYPE_ERROR, "%s Failed setting record buffer duration. Duration is %{public}lf", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (void)_setAlertsIfNeeded
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  int64_t recordingAlertsConfiguration = self->_recordingAlertsConfiguration;
  unint64_t v4 = self->_speechCapturingMode & 0xFFFFFFFFFFFFFFFELL;
  uint64_t v5 = (os_log_t *)MEMORY[0x1E4F4E380];
  if (v4 == 2)
  {
    self->_int64_t recordingAlertsConfiguration = 2;
    int v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      unint64_t v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      _os_log_impl(&dword_1C9338000, v10, OS_LOG_TYPE_INFO, "%s Setting up recording alerts for Dictation.", buf, 0xCu);
    }
    BOOL v11 = recordingAlertsConfiguration != 2;
    uint64_t v8 = [MEMORY[0x1E4F4E408] sharedManager];
    __int16 v12 = [v8 URLForSoundID:1];
    uint64_t v13 = [v8 URLForSoundID:2];
    uint64_t v14 = [v8 URLForSoundID:3];
    long long v15 = [(CSSiriSpeechRecorder *)self _speechController];
    [v15 setAlertSoundFromURL:v12 forType:1 force:v11];
    [v15 setAlertSoundFromURL:v13 forType:2 force:v11];
    [v15 setAlertSoundFromURL:v14 forType:3 force:v11];
    long long v16 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      unint64_t v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_INFO, "%s Done setting recording alerts for Dictation.", buf, 0xCu);
    }
  }
  else
  {
    self->_int64_t recordingAlertsConfiguration = 1;
    os_log_t v6 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      unint64_t v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      _os_log_impl(&dword_1C9338000, v6, OS_LOG_TYPE_INFO, "%s Setting up recording alerts for Siri and other non-Dictation modes.", buf, 0xCu);
    }
    BOOL v7 = recordingAlertsConfiguration != 1;
    uint64_t v8 = [(CSSiriSpeechRecorder *)self _speechController];
    [v8 setAlertSoundFromURL:0 forType:1 force:v7];
    [v8 setAlertSoundFromURL:0 forType:2 force:v7];
    [v8 setAlertSoundFromURL:0 forType:3 force:v7];
    uint64_t v9 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      unint64_t v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s Done setting recording alerts for Siri and other non-Dictation modes.", buf, 0xCu);
    }
  }

  unint64_t v17 = [(AFExperimentContext *)self->_experimentContext invocationFeedbackExperiment];
  int v18 = [v17 isFeatureGroupOneEnabled];

  if (v4 != 2 && v18)
  {
    unint64_t v19 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      unint64_t v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_INFO, "%s Overriding record starting alert for IFD feature group one.", buf, 0xCu);
    }
    int64_t v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v20 URLForResource:@"siri-begin-improved" withExtension:@"caf"];
    if (v21)
    {
      id v22 = [(CSSiriSpeechRecorder *)self _speechController];
      [v22 setAlertSoundFromURL:v21 forType:1 force:1];
      double v23 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        unint64_t v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
        __int16 v37 = 2112;
        uint64_t v38 = v21;
        _os_log_impl(&dword_1C9338000, v23, OS_LOG_TYPE_INFO, "%s Done overriding record starting alert for IFD feature group one (soundURL = %@).", buf, 0x16u);
      }
      self->_int64_t recordingAlertsConfiguration = 3;
    }
    else
    {
      int v24 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        unint64_t v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
        _os_log_error_impl(&dword_1C9338000, v24, OS_LOG_TYPE_ERROR, "%s Failed overriding record starting alert for IFD feature group one.", buf, 0xCu);
      }
    }
  }
  pendingActivationInfo = self->_pendingActivationInfo;
  if (!pendingActivationInfo) {
    pendingActivationInfo = self->_currentActivationInfo;
  }
  unsigned int v26 = pendingActivationInfo;
  uint64_t v27 = [(CSSiriAudioActivationInfo *)v26 startingAlertBeepURL];
  if (v27)
  {
    int v28 = [(CSSiriSpeechRecorder *)self _speechController];
    [v28 setAlertSoundFromURL:v27 forType:1 force:1];
    uint64_t v29 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      unint64_t v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      __int16 v37 = 2112;
      uint64_t v38 = v27;
      _os_log_impl(&dword_1C9338000, v29, OS_LOG_TYPE_INFO, "%s Done overriding record starting alert from override policy (soundURL = %@).", buf, 0x16u);
    }
    self->_int64_t recordingAlertsConfiguration = 3;
  }
  else
  {
    __int16 v30 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      unint64_t v36 = "-[CSSiriSpeechRecorder _setAlertsIfNeeded]";
      _os_log_error_impl(&dword_1C9338000, v30, OS_LOG_TYPE_ERROR, "%s Failed overriding record starting alert from override policy.", buf, 0xCu);
    }
  }
  if (self->_alertPlaybackGroup)
  {
    numberOfAVVCAlertPlaybacksByType = self->_numberOfAVVCAlertPlaybacksByType;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __42__CSSiriSpeechRecorder__setAlertsIfNeeded__block_invoke;
    v34[3] = &unk_1E658C4C0;
    v34[4] = self;
    [(NSMutableDictionary *)numberOfAVVCAlertPlaybacksByType enumerateKeysAndObjectsUsingBlock:v34];
    alertPlaybackGroup = self->_alertPlaybackGroup;
    self->_alertPlaybackGroup = 0;
  }
  os_signpost_id_t v33 = self->_numberOfAVVCAlertPlaybacksByType;
  self->_numberOfAVVCAlertPlaybacksByType = 0;
}

void __42__CSSiriSpeechRecorder__setAlertsIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if ([a3 unsignedIntegerValue])
  {
    unint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 464);
    dispatch_group_leave(v4);
  }
}

- (void)_setEndpointerOperationMode:(int64_t)a3 forceUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (os_log_t *)MEMORY[0x1E4F4E380];
  uint64_t v8 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = v8;
    int v10 = AFSpeechEndpointerOperationModeGetName();
    int v20 = 136315650;
    uint64_t v21 = "-[CSSiriSpeechRecorder _setEndpointerOperationMode:forceUpdate:]";
    __int16 v22 = 2112;
    double v23 = v10;
    __int16 v24 = 1024;
    LODWORD(v25) = v4;
    _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s int64_t endpointerOperationMode = %@, forceUpdate = %d", (uint8_t *)&v20, 0x1Cu);
  }
  if (a3 || v4)
  {
    int64_t endpointerOperationMode = self->_endpointerOperationMode;
    if (a3 < 2 || endpointerOperationMode != 1 || v4)
    {
      if (endpointerOperationMode != a3 || v4)
      {
        self->_int64_t endpointerOperationMode = a3;
        unint64_t v17 = [(CSSiriSpeechRecorder *)self _speechController];
        [v17 setEndpointerOperationMode:self->_endpointerOperationMode];
        unint64_t v18 = a3 - 3;
        unint64_t v19 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
        {
          int v20 = 136315394;
          uint64_t v21 = "-[CSSiriSpeechRecorder _setEndpointerOperationMode:forceUpdate:]";
          __int16 v22 = 1024;
          LODWORD(v23) = v18 < 2;
          _os_log_impl(&dword_1C9338000, v19, OS_LOG_TYPE_INFO, "%s Set Use Automatic Endpointing %d", (uint8_t *)&v20, 0x12u);
        }
        [(CSSiriSpeechRecorder *)self _setEndpointStyle:2 * (v18 > 1)];
        if (v18 <= 1 && self->_didDetectEndpoint && self->_recordingState == 2) {
          [(CSSiriSpeechRecorder *)self _stopRecordingForEndpointReason:3 withEndpointMetrics:0];
        }
      }
    }
    else
    {
      os_log_t v13 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = v13;
        long long v15 = AFSpeechEndpointerOperationModeGetName();
        long long v16 = AFSpeechEndpointerOperationModeGetName();
        int v20 = 136315650;
        uint64_t v21 = "-[CSSiriSpeechRecorder _setEndpointerOperationMode:forceUpdate:]";
        __int16 v22 = 2112;
        double v23 = v15;
        __int16 v24 = 2112;
        char v25 = v16;
        _os_log_error_impl(&dword_1C9338000, v14, OS_LOG_TYPE_ERROR, "%s Ignored because endpointer operation mode can not be changed from %@ to %@.", (uint8_t *)&v20, 0x20u);
      }
    }
  }
  else
  {
    BOOL v11 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315138;
      uint64_t v21 = "-[CSSiriSpeechRecorder _setEndpointerOperationMode:forceUpdate:]";
      _os_log_impl(&dword_1C9338000, v11, OS_LOG_TYPE_INFO, "%s Ignored because endpointer operation mode is unspecified.", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)_setSpeechCapturingMode:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[CSSiriSpeechRecorder _setSpeechCapturingMode:]";
    __int16 v9 = 2048;
    int64_t v10 = a3;
    _os_log_impl(&dword_1C9338000, v5, OS_LOG_TYPE_INFO, "%s mode = %ld", (uint8_t *)&v7, 0x16u);
  }
  if (self->_speechCapturingMode != a3)
  {
    self->_int64_t speechCapturingMode = a3;
    uint64_t v6 = 112;
    if (!self->_recordingState) {
      uint64_t v6 = 104;
    }
    [*(id *)((char *)&self->super.isa + v6) setSpeechRecordingMode:a3];
  }
}

- (id)_rtsSessionIdFromSpeechRequestOptions:(id)a3
{
  return 0;
}

- (id)_currentRtsSessionId:(BOOL)a3
{
  return 0;
}

- (id)_mhUUIDFromSpeechRequestOptions:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 voiceTriggerEventInfo];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 objectForKey:*MEMORY[0x1E4F5D760]];
      if (v7)
      {
        uint64_t v8 = (void *)v7;
        __int16 v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
LABEL_12:

        goto LABEL_14;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  int64_t v10 = (NSObject **)MEMORY[0x1E4F4E380];
  uint64_t v11 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    __int16 v12 = v11;
    os_log_t v13 = [v4 continuousConversationInfo];
    int v17 = 136315394;
    unint64_t v18 = "-[CSSiriSpeechRecorder _mhUUIDFromSpeechRequestOptions:]";
    __int16 v19 = 2112;
    int v20 = v13;
    _os_log_impl(&dword_1C9338000, v12, OS_LOG_TYPE_INFO, "%s continuousConversationInfo :%@", (uint8_t *)&v17, 0x16u);
  }
  if ([v4 activationEvent] == 30)
  {
    __int16 v9 = [v4 continuousConversationInfo];

    if (!v9) {
      goto LABEL_14;
    }
    uint64_t v14 = [v4 continuousConversationInfo];
    uint64_t v8 = [v14 objectForKeyedSubscript:@"requestMHUUID"];

    __int16 v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    long long v15 = *v10;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v17 = 136315394;
      unint64_t v18 = "-[CSSiriSpeechRecorder _mhUUIDFromSpeechRequestOptions:]";
      __int16 v19 = 2112;
      int v20 = v9;
      _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_INFO, "%s requestMHUUID:%@", (uint8_t *)&v17, 0x16u);
    }
    goto LABEL_12;
  }
  __int16 v9 = 0;
LABEL_14:

  return v9;
}

- (id)_currentMHUUID:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  mhUUID = self->_mhUUID;
  if (mhUUID) {
    BOOL v5 = !a3;
  }
  else {
    BOOL v5 = 0;
  }
  if (!v5)
  {
    BOOL v6 = a3;
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v8 = self->_mhUUID;
    self->_mhUUID = v7;

    __int16 v9 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int64_t v10 = @"NO";
      uint64_t v11 = self->_mhUUID;
      uint64_t v14 = "-[CSSiriSpeechRecorder _currentMHUUID:]";
      int v13 = 136315650;
      __int16 v15 = 2112;
      if (v6) {
        int64_t v10 = @"YES";
      }
      long long v16 = v11;
      __int16 v17 = 2112;
      unint64_t v18 = v10;
      _os_log_impl(&dword_1C9338000, v9, OS_LOG_TYPE_INFO, "%s Assign new MHUUID here to %@ (force = %@)", (uint8_t *)&v13, 0x20u);
    }
    mhUUID = self->_mhUUID;
  }
  return mhUUID;
}

- (void)dealloc
{
  decoder = self->_decoder;
  if (decoder)
  {
    AudioConverterDispose(decoder);
    self->_decoder = 0;
  }
  [(NSXPCConnection *)self->_speechRecordingEventListenerConnection invalidate];
  [(AFWatchdogTimer *)self->_fakeTwoShotTTSPromptWatchdogTimer cancel];
  v4.receiver = self;
  v4.super_class = (Class)CSSiriSpeechRecorder;
  [(CSSiriSpeechRecorder *)&v4 dealloc];
}

- (CSSiriSpeechRecorder)initWithQueue:(id)a3 speechController:(id)a4 audioSessionController:(id)a5 audioPlaybackService:(id)a6 experimentContext:(id)a7
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_10:
    uint64_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"CSSiriSpeechRecorder.m", 369, @"Invalid parameter not satisfying: %@", @"audioSessionController != nil" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"CSSiriSpeechRecorder.m", 368, @"Invalid parameter not satisfying: %@", @"speechController != nil" object file lineNumber description];

  if (!v14) {
    goto LABEL_10;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_11:
  int v28 = [MEMORY[0x1E4F28B00] currentHandler];
  [v28 handleFailureInMethod:a2, self, @"CSSiriSpeechRecorder.m", 370, @"Invalid parameter not satisfying: %@", @"audioPlaybackService != nil" object file lineNumber description];

LABEL_4:
  v31.receiver = self;
  v31.super_class = (Class)CSSiriSpeechRecorder;
  __int16 v17 = [(CSSiriSpeechRecorder *)&v31 init];
  unint64_t v18 = v17;
  if (v17)
  {
    v17->_isSpeechControllerInitialized = 0;
    objc_storeStrong((id *)&v17->_speechController, a4);
    objc_storeStrong((id *)&v18->_audioSessionController, a5);
    objc_storeStrong((id *)&v18->_audioPlaybackService, a6);
    objc_storeStrong((id *)&v18->_experimentContext, a7);
    uint64_t v19 = [[CSSiriAudioActivationInfo alloc] initWithSpeechRecordingMode:v18->_speechCapturingMode clientConfiguration:0 experimentContext:v18->_experimentContext];
    currentActivationInfo = v18->_currentActivationInfo;
    v18->_currentActivationInfo = v19;

    uint64_t v21 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      __int16 v22 = v18->_currentActivationInfo;
      *(_DWORD *)long long buf = 136315394;
      os_signpost_id_t v33 = "-[CSSiriSpeechRecorder initWithQueue:speechController:audioSessionController:audioPlaybackService:experimentContext:]";
      __int16 v34 = 2112;
      id v35 = v22;
      _os_log_impl(&dword_1C9338000, v21, OS_LOG_TYPE_INFO, "%s Set initial info as current %@.", buf, 0x16u);
    }
    objc_storeStrong((id *)&v18->_queue, a3);
    dispatch_group_t v23 = dispatch_group_create();
    recordingWillStartGroup = v18->_recordingWillStartGroup;
    v18->_recordingWillStartGroup = (OS_dispatch_group *)v23;
  }
  return v18;
}

@end