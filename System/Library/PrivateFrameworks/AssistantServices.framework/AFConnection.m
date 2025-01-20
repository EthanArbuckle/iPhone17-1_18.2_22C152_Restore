@interface AFConnection
+ (BOOL)assistantIsSupported;
+ (BOOL)assistantIsSupportedForLanguageCode:(id)a3 error:(id *)a4;
+ (BOOL)isAvailable;
+ (BOOL)isNetworkAvailable;
+ (BOOL)siriIsSupportedForLanguageCode:(id)a3 deviceProductVersion:(id)a4 error:(id *)a5;
+ (BOOL)siriIsSupportedForLanguageCode:(id)a3 productName:(id)a4 productVersion:(id)a5 error:(id *)a6;
+ (id)_networkAvailability;
+ (id)_sAvailabilityObserverForTestVerification;
+ (id)currentLanguageCode;
+ (id)outputVoice;
+ (void)beginMonitoringAvailability;
+ (void)defrost;
+ (void)initialize;
+ (void)stopMonitoringAvailability;
- (AFAssistantUIService)delegate;
- (AFConnection)init;
- (AFConnection)initWithTargetQueue:(id)a3;
- (AFConnection)initWithTargetQueue:(id)a3 instanceContext:(id)a4;
- (AFSpeechDelegate)speechDelegate;
- (BOOL)_shouldEmitUEIRequestLinkForRequestInfo:(id)a3 speechRequestOptions:(id)a4;
- (BOOL)_startInputAudioPowerUpdatesWithXPCWrapper:(id)a3;
- (BOOL)hasActiveRequest;
- (BOOL)isRecording;
- (BOOL)shouldSpeak;
- (float)averagePower;
- (float)peakPower;
- (id)_activeRequestUUID;
- (id)_cachedBulletins;
- (id)_clientConfiguration;
- (id)_clientService;
- (id)_clientServiceWithErrorHandler:(id)a3;
- (id)_connection;
- (id)_metricContextValueForUseDeviceSpeakerForTTS:(int64_t)a3;
- (id)_siriClientStateManager;
- (id)_startRequestMetricSettings;
- (id)acquireUserInteractionAssertion;
- (id)startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:(id)a3;
- (int64_t)_getActiveSpeechEvent;
- (unsigned)audioSessionID;
- (void)_aceConnectionWillRetryOnError:(id)a3;
- (void)_barrier;
- (void)_beginInterstitialsForReason:(id)a3;
- (void)_cancelRequestTimeoutForReason:(id)a3;
- (void)_checkAndSetIsCapturingSpeech:(BOOL)a3;
- (void)_clearAssistantInfoForAccountWithIdentifier:(id)a3;
- (void)_clearConnection;
- (void)_completeRequestWithUUID:(id)a3 forReason:(int64_t)a4 error:(id)a5;
- (void)_connectionFailedWithError:(id)a3;
- (void)_dispatchCallbackGroupBlock:(id)a3;
- (void)_dispatchCommand:(id)a3 isInterstitial:(BOOL)a4 interstitialPhase:(int64_t)a5 interstitialDelay:(double)a6 reply:(id)a7;
- (void)_endInterstitialsForReason:(id)a3;
- (void)_enqueueInterstitialCommand:(id)a3;
- (void)_extendExistingRequestTimeoutForReason:(id)a3;
- (void)_extendExpiringRequestTimeout;
- (void)_extendRequestTimeoutForReason:(id)a3 durationInSeconds:(double)a4;
- (void)_fetchShouldSpeak:(id)a3;
- (void)_handleCommand:(id)a3 reply:(id)a4;
- (void)_handleInterstitialPhase:(int64_t)a3 fromProvider:(id)a4 displayText:(id)a5 speakableText:(id)a6 expectedDelay:(double)a7 context:(id)a8 completion:(id)a9;
- (void)_invokeRequestTimeoutForReason:(id)a3;
- (void)_markIsDucking;
- (void)_markIsTwoShot;
- (void)_markNetworkDidBecomeActive;
- (void)_markSpeechRecognized;
- (void)_pauseRequestTimeoutForReason:(id)a3;
- (void)_requestDidEnd;
- (void)_requestWillBeginWithRequestClass:(id)a3 isSpeechRequest:(BOOL)a4 speechRequestOptions:(id)a5 requestInfo:(id)a6 analyticsEventProvider:(id)a7;
- (void)_requestWillBeginWithRequestClass:(id)a3 isSpeechRequest:(BOOL)a4 speechRequestOptions:(id)a5 requestInfo:(id)a6 isBackgroundRequest:(BOOL)a7 analyticsEventProvider:(id)a8;
- (void)_resumeRequestTimeoutForReason:(id)a3;
- (void)_scheduleRequestTimeoutForReason:(id)a3 durationInSeconds:(double)a4;
- (void)_setAudioSessionID:(unsigned int)a3;
- (void)_setRecordRoute:(id)a3;
- (void)_setShouldSpeak:(BOOL)a3;
- (void)_speechRecordingDidFailWithError:(id)a3;
- (void)_startRequestTimeoutTimerWithTimeInterval:(double)a3 reason:(id)a4;
- (void)_startRequestWithAceCommand:(id)a3 turnIdentifier:(id)a4 suppressAlert:(BOOL)a5;
- (void)_startRequestWithInfo:(id)a3;
- (void)_startUIRequestWithInfo:(id)a3 completion:(id)a4;
- (void)_startUIRequestWithText:(id)a3 completion:(id)a4;
- (void)_stopInputAudioPowerUpdates;
- (void)_tellDelegateAudioPlaybackRequestDidStart:(id)a3;
- (void)_tellDelegateAudioPlaybackRequestDidStop:(id)a3 error:(id)a4;
- (void)_tellDelegateAudioPlaybackRequestWillStart:(id)a3;
- (void)_tellDelegateAudioSessionDidBecomeActive:(BOOL)a3;
- (void)_tellDelegateAudioSessionDidBeginInterruptionWithUserInfo:(id)a3;
- (void)_tellDelegateAudioSessionDidEndInterruption:(BOOL)a3 userInfo:(id)a4;
- (void)_tellDelegateAudioSessionIDChanged:(unsigned int)a3;
- (void)_tellDelegateAudioSessionWillBecomeActive:(BOOL)a3;
- (void)_tellDelegateCacheImage:(id)a3;
- (void)_tellDelegateDidDetectMusic;
- (void)_tellDelegateDidFinishAcousticIDRequestWithSuccess:(BOOL)a3;
- (void)_tellDelegateExtensionRequestFinishedForApplication:(id)a3 error:(id)a4;
- (void)_tellDelegateExtensionRequestWillStartForApplication:(id)a3;
- (void)_tellDelegateFailedToLaunchAppWithBundleIdentifier:(id)a3;
- (void)_tellDelegateInvalidateCurrentUserActivity;
- (void)_tellDelegateRequestWillStart;
- (void)_tellDelegateSetUserActivityInfo:(id)a3 webpageURL:(id)a4;
- (void)_tellDelegateShouldSpeakChanged:(BOOL)a3;
- (void)_tellDelegateStartPlaybackDidFail:(int64_t)a3;
- (void)_tellDelegateWillProcessAppLaunchWithBundleIdentifier:(id)a3;
- (void)_tellDelegateWillProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5;
- (void)_tellDelegateWillStartAcousticIDRequest;
- (void)_tellSpeechDelegateRecognitionDidFail:(id)a3;
- (void)_tellSpeechDelegateRecognitionUpdateWillBeginForTask:(id)a3;
- (void)_tellSpeechDelegateRecognizedAdditionalSpeechInterpretation:(id)a3 refId:(id)a4;
- (void)_tellSpeechDelegateRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4;
- (void)_tellSpeechDelegateRecordingDidCancel;
- (void)_tellSpeechDelegateRecordingDidChangeAVRecordRoute:(id)a3;
- (void)_tellSpeechDelegateRecordingDidDetectStartpoint;
- (void)_tellSpeechDelegateRecordingDidEnd;
- (void)_tellSpeechDelegateRecordingDidFail:(id)a3;
- (void)_tellSpeechDelegateRecordingDidUpdateRecognitionPhrases:(id)a3 utterances:(id)a4 refId:(id)a5;
- (void)_tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3;
- (void)_tellSpeechDelegateSpeechRecognized:(id)a3;
- (void)_tellSpeechDelegateSpeechRecognizedPartialResult:(id)a3;
- (void)_tellSpeechDelegateToPerformTwoShotPromptWithType:(int64_t)a3 reply:(id)a4;
- (void)_updateClientConfiguration;
- (void)_updateSpeechEndHostTime:(unint64_t)a3;
- (void)_updateState;
- (void)_updateStateIfNotInSync;
- (void)_willCancelRequest;
- (void)_willCompleteRequest;
- (void)_willEndSession;
- (void)_willFailRequestWithError:(id)a3;
- (void)_willPresentUsefulUserResultWithType:(int64_t)a3;
- (void)_willStartRequestWithSpeech:(BOOL)a3 speechRequestOptions:(id)a4 requestInfo:(id)a5 analyticsEventProvider:(id)a6;
- (void)_willStopRecordingWithSignpostID:(unint64_t)a3;
- (void)accessibilityObserver:(id)a3 stateDidChangeFrom:(id)a4 to:(id)a5;
- (void)acquireAudioSessionWithContext:(id)a3 completion:(id)a4;
- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3;
- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5;
- (void)boostedPreheatWithStyle:(int64_t)a3 completion:(id)a4;
- (void)broadcastCommandDictionary:(id)a3;
- (void)cancelRequest;
- (void)cancelRequestForReason:(int64_t)a3;
- (void)cancelSpeech;
- (void)checkLanguageReady:(id)a3 completion:(id)a4;
- (void)clearContext;
- (void)dealloc;
- (void)deviceRingerObserver:(id)a3 didChangeState:(int64_t)a4;
- (void)didDismissUI;
- (void)endSession;
- (void)failRequestWithError:(id)a3;
- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5;
- (void)forceAudioSessionActive;
- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4;
- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 speechRequestOptions:(id)a5 completion:(id)a6;
- (void)forceAudioSessionInactive;
- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)getCachedObjectsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4;
- (void)getRemoteClockTimerSnapshotWithCompletion:(id)a3;
- (void)interstitialProvider:(id)a3 handlePhase:(int64_t)a4 displayText:(id)a5 speakableText:(id)a6 expectedDelay:(double)a7 context:(id)a8 completion:(id)a9;
- (void)invalidate;
- (void)preheatWithStyle:(int64_t)a3;
- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4;
- (void)prepareForPhoneCall;
- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5;
- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6;
- (void)reportIssueForType:(id)a3 subtype:(id)a4 context:(id)a5;
- (void)requestBarrier:(id)a3;
- (void)requestBarrierIfNecessary:(id)a3;
- (void)requestDidAskForTimeoutExtension:(double)a3;
- (void)resumeInterruptedAudioPlaybackIfNeeded;
- (void)rollbackClearContext;
- (void)rollbackRequest;
- (void)sendGenericAceCommand:(id)a3;
- (void)sendGenericAceCommand:(id)a3 conflictHandler:(id)a4;
- (void)sendGenericAceCommand:(id)a3 turnIdentifier:(id)a4 conflictHandler:(id)a5;
- (void)sendReplyCommand:(id)a3;
- (void)setAccessibilityState:(id)a3;
- (void)setAlertContextWithBulletins:(id)a3;
- (void)setAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a3;
- (void)setApplicationContext:(id)a3;
- (void)setApplicationContextForApplicationInfos:(id)a3;
- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4;
- (void)setCarDNDActive:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceRingerSwitchState:(int64_t)a3;
- (void)setIsDeviceInStarkMode:(BOOL)a3;
- (void)setLockState:(BOOL)a3 screenLocked:(BOOL)a4;
- (void)setModesConfiguration:(id)a3;
- (void)setMyriadDecisionResult:(BOOL)a3;
- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4;
- (void)setShouldWaitForMyriad:(BOOL)a3;
- (void)setSpeechDelegate:(id)a3;
- (void)setSupportsCarPlayVehicleData:(BOOL)a3;
- (void)setVoiceOverIsActive:(BOOL)a3;
- (void)setWatchAuthenticated:(BOOL)a3;
- (void)startAcousticIDRequestWithOptions:(id)a3;
- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)startContinuationRequestWithUserInfo:(id)a3;
- (void)startDirectActionRequestWithString:(id)a3;
- (void)startRecordingForPendingSpeechRequestWithOptions:(id)a3 completion:(id)a4;
- (void)startRequestWithAceCommand:(id)a3;
- (void)startRequestWithCorrectedText:(id)a3 forSpeechIdentifier:(id)a4 userSelectionResults:(id)a5;
- (void)startRequestWithCorrectedText:(id)a3 forSpeechIdentifier:(id)a4 userSelectionResults:(id)a5 turnIdentifier:(id)a6;
- (void)startRequestWithInfo:(id)a3 activationEvent:(int64_t)a4;
- (void)startRequestWithText:(id)a3;
- (void)startSpeechPronunciationRequestWithOptions:(id)a3 pronunciationContext:(id)a4;
- (void)startSpeechRequestWithOptions:(id)a3;
- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3;
- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3 isNarrowBand:(BOOL)a4;
- (void)stopAllAudioPlaybackRequests:(BOOL)a3;
- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4;
- (void)stopSpeech;
- (void)stopSpeechWithOptions:(id)a3;
- (void)telephonyRequestCompleted;
- (void)updateSpeechOptions:(id)a3;
- (void)updateSpeechSynthesisRecord:(id)a3;
- (void)usefulUserResultWillPresent;
- (void)willPresentUI;
- (void)willPresentUsefulUserResultWithType:(int64_t)a3;
- (void)willPresentUsefulUserResultWithType:(int64_t)a3 forCommand:(id)a4;
- (void)willSetApplicationContextWithRefId:(id)a3;
@end

@implementation AFConnection

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_speechDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_siriClientStateManager, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_speechCallbackGroup, 0);
  objc_storeStrong((id *)&self->_lastRetryError, 0);
  objc_storeStrong((id *)&self->_interstitialCommandQueue, 0);
  objc_storeStrong((id *)&self->_interstitialProvider, 0);
  objc_storeStrong((id *)&self->_clientConfiguration, 0);
  objc_storeStrong((id *)&self->_inputAudioPowerUpdater, 0);
  objc_storeStrong((id *)&self->_playbackRoute, 0);
  objc_storeStrong((id *)&self->_recordRoute, 0);
  objc_storeStrong((id *)&self->_replyHandlerForAceId, 0);
  objc_storeStrong((id *)&self->_activeTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_requestCompletion, 0);
  objc_storeStrong((id *)&self->_requestTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_activeRequestUUID, 0);
  objc_storeStrong((id *)&self->_cachedBulletins, 0);
  objc_storeStrong((id *)&self->_initiationCallSiteInfo, 0);
  objc_storeStrong((id *)&self->_outstandingRequestClass, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)setSpeechDelegate:(id)a3
{
}

- (AFSpeechDelegate)speechDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);
  return (AFSpeechDelegate *)WeakRetained;
}

- (AFAssistantUIService)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AFAssistantUIService *)WeakRetained;
}

- (id)acquireUserInteractionAssertion
{
  return 0;
}

- (void)_willStopRecordingWithSignpostID:(unint64_t)a3
{
  self->_uufrID = a3;
}

- (void)_speechRecordingDidFailWithError:(id)a3
{
  id v6 = a3;
  if (self->_activeRequestType == 1)
  {
    v5 = NSStringFromSelector(a2);
    [(AFConnection *)self _cancelRequestTimeoutForReason:v5];
  }
  [(AFConnection *)self _updateStateIfNotInSync];
  [(AFConnection *)self _checkAndSetIsCapturingSpeech:0];
  [(AFConnection *)self _tellSpeechDelegateRecordingDidFail:v6];
}

- (void)adviseSessionArbiterToContinueWithPreviousWinner:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFConnection *)self _clientService];
  [v4 adviseSessionArbiterToContinueWithPreviousWinner:v3];
}

- (void)updateSpeechSynthesisRecord:(id)a3
{
  id v4 = a3;
  id v5 = [(AFConnection *)self _clientService];
  [v5 updateSpeechSynthesisRecord:v4];
}

- (void)stopAllAudioPlaybackRequests:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFConnection *)self _clientService];
  [v4 stopAllAudioPlaybackRequests:v3];
}

- (void)stopAudioPlaybackRequest:(id)a3 immediately:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(AFConnection *)self _clientService];
  [v7 stopAudioPlaybackRequest:v6 immediately:v4];
}

- (void)startAudioPlaybackRequest:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __61__AFConnection_startAudioPlaybackRequest_options_completion___block_invoke;
  v16 = &unk_1E5929680;
  id v17 = v8;
  id v18 = v9;
  id v10 = v9;
  id v11 = v8;
  v12 = [(AFConnection *)self _clientServiceWithErrorHandler:&v13];
  objc_msgSend(v12, "startAudioPlaybackRequest:options:reply:", v11, a4, v10, v13, v14, v15, v16);
}

void __61__AFConnection_startAudioPlaybackRequest_options_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 136315650;
    id v8 = "-[AFConnection startAudioPlaybackRequest:options:completion:]_block_invoke";
    __int16 v9 = 2114;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    id v12 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Fail to start audio playback request %{public}@ due to error %{public}@.", (uint8_t *)&v7, 0x20u);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)checkLanguageReady:(id)a3 completion:(id)a4
{
  if (a4) {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, 1);
  }
}

- (void)willPresentUsefulUserResultWithType:(int64_t)a3 forCommand:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  analytics = self->_analytics;
  int v7 = AFAnalyticsContextCreateWithCommand(a4);
  [(AFAnalytics *)analytics logEventWithType:1420 context:v7];

  if (self->_uufrID && self->_activeRequestUUID && self->_activeRequestType)
  {
    id v8 = (id)AFSiriLogContextConnection;
    __int16 v9 = v8;
    os_signpost_id_t uufrID = self->_uufrID;
    if (uufrID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      int v11 = 136315394;
      id v12 = "SiriX";
      __int16 v13 = 2080;
      uint64_t v14 = "enableTelemetry=YES";
      _os_signpost_emit_with_name_impl(&dword_19CF1D000, v9, OS_SIGNPOST_INTERVAL_END, uufrID, "UsefulUserFacingResults", "%s %s", (uint8_t *)&v11, 0x16u);
    }
  }
  [(AFConnection *)self _willPresentUsefulUserResultWithType:a3];
}

- (void)willPresentUsefulUserResultWithType:(int64_t)a3
{
}

- (void)usefulUserResultWillPresent
{
}

- (void)telephonyRequestCompleted
{
  id v2 = [(AFConnection *)self _clientService];
  [v2 telephonyRequestCompleted];
}

- (void)prepareForPhoneCall
{
  id v2 = [(AFConnection *)self _clientService];
  [v2 prepareForPhoneCall];
}

- (void)setAlertContextWithBulletins:(id)a3
{
  BOOL v4 = (NSArray *)[a3 copy];
  cachedBulletins = self->_cachedBulletins;
  self->_cachedBulletins = v4;

  id v6 = [(AFConnection *)self _clientService];
  [v6 setAlertContextDirty];
}

- (void)setOverriddenApplicationContext:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFConnection *)self _clientService];
  [v8 setOverriddenApplicationContext:v7 withContext:v6];
}

- (void)setApplicationContextForApplicationInfos:(id)a3
{
  id v4 = a3;
  id v5 = [(AFConnection *)self _clientService];
  [v5 fetchAppicationContextForApplicationInfo:v4 supplementalContext:0 refID:0];
}

- (void)setApplicationContextForApplicationInfos:(id)a3 withRefId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFConnection *)self _clientService];
  [v8 fetchAppicationContextForApplicationInfo:v7 supplementalContext:0 refID:v6];
}

- (void)fetchAppicationContextForApplicationInfo:(id)a3 supplementalContext:(id)a4 refID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AFConnection *)self _clientService];
  [v11 fetchAppicationContextForApplicationInfo:v10 supplementalContext:v9 refID:v8];
}

- (void)setApplicationContext:(id)a3
{
  id v4 = a3;
  id v5 = [(AFConnection *)self _clientService];
  [v5 setApplicationContext:v4];
}

- (void)willSetApplicationContextWithRefId:(id)a3
{
  id v4 = a3;
  id v5 = [(AFConnection *)self _clientService];
  [v5 willSetApplicationContextWithRefId:v4];
}

- (void)clearContext
{
  id v2 = [(AFConnection *)self _clientService];
  [v2 clearContext];
}

- (void)getRemoteClockTimerSnapshotWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__AFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke;
    v10[3] = &unk_1E592B9A0;
    id v6 = v4;
    id v11 = v6;
    id v7 = [(AFConnection *)self _clientServiceWithErrorHandler:v10];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__AFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke_2;
    v8[3] = &unk_1E59249C8;
    id v9 = v6;
    [v7 getRemoteClockTimerSnapshotWithCompletion:v8];
  }
}

uint64_t __58__AFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __58__AFConnection_getRemoteClockTimerSnapshotWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getCachedObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFConnection *)self _clientService];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__AFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke;
  v10[3] = &unk_1E59283A8;
  id v11 = v6;
  id v9 = v6;
  [v8 getSerializedCachedObjectsWithIdentifiers:v7 completion:v10];
}

void __59__AFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [AFOneArgumentSafetyBlock alloc];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__AFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke_2;
  v13[3] = &unk_1E5924978;
  id v14 = *(id *)(a1 + 32);
  id v5 = [(AFOneArgumentSafetyBlock *)v4 initWithBlock:v13 defaultValue:MEMORY[0x1E4F1CC08]];
  id INSerializedCacheItemClass = getINSerializedCacheItemClass();
  id v7 = (void *)MEMORY[0x1E4F1CAD0];
  id v8 = [v3 allValues];

  id v9 = [v7 setWithArray:v8];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__AFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke_3;
  v11[3] = &unk_1E59249A0;
  id v12 = v5;
  id v10 = v5;
  [INSerializedCacheItemClass deserializeCacheItems:v9 completion:v11];
}

uint64_t __59__AFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __59__AFConnection_getCachedObjectsWithIdentifiers_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "cacheIdentifier", (void)v12);
        [v4 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) invokeWithValue:v4];
}

- (void)getDeferredObjectsWithIdentifiers:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFConnection *)self _clientService];
  [v8 getDeferredObjectsWithIdentifiers:v7 completion:v6];
}

- (void)sendReplyCommand:(id)a3
{
  id v7 = a3;
  id v4 = [v7 refId];
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_replyHandlerForAceId objectForKey:v4];
    id v6 = (void *)v5;
    if (v5)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
      [(NSMutableDictionary *)self->_replyHandlerForAceId removeObjectForKey:v4];
    }
  }
}

- (void)sendGenericAceCommand:(id)a3 turnIdentifier:(id)a4 conflictHandler:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v34 = a4;
  id v9 = a5;
  if (v8)
  {
    id v10 = [v8 aceId];

    if (!v10)
    {
      id v11 = [MEMORY[0x1E4F29128] UUID];
      long long v12 = [v11 UUIDString];

      long long v13 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "-[AFConnection sendGenericAceCommand:turnIdentifier:conflictHandler:]";
        __int16 v46 = 2112;
        v47 = v12;
        _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s passed command without ACE ID; inventing one (%@)",
          buf,
          0x16u);
      }
      [v8 setAceId:v12];
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v30 = v8;
    if (isKindOfClass)
    {
      long long v15 = [v8 commands];
    }
    else
    {
      id v43 = v8;
      long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
    }
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v15;
    uint64_t v16 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v39;
      uint64_t v33 = *MEMORY[0x1E4F97758];
      uint64_t v31 = *MEMORY[0x1E4F97750];
      unsigned int v32 = isKindOfClass & 1;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(id *)(*((void *)&v38 + 1) + 8 * i);
          v21 = [v20 encodedClassName];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v22 = v20;
            objc_opt_class();
            LOBYTE(v23) = objc_opt_isKindOfClass();
          }
          else
          {
            if (([v21 isEqualToString:v33] & 1) == 0
              && ![v21 isEqualToString:v31])
            {
              LOBYTE(v23) = 0;
LABEL_22:
              id v22 = 0;
              goto LABEL_25;
            }
            uint64_t v23 = objc_opt_class();
            if (!v23) {
              goto LABEL_22;
            }
            if (objc_opt_isKindOfClass())
            {
              id v22 = v20;
            }
            else
            {
              id v24 = objc_alloc((Class)v23);
              v25 = [v20 dictionary];
              id v22 = (id)[v24 initWithDictionary:v25];
            }
            LOBYTE(v23) = 0;
          }
LABEL_25:

          if (!v22 || (v23 & 1) != 0)
          {
            if (v23)
            {
              v26 = AFSiriLogContextConnection;
              if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315138;
                v45 = "-[AFConnection sendGenericAceCommand:turnIdentifier:conflictHandler:]";
                _os_log_impl(&dword_19CF1D000, v26, OS_LOG_TYPE_INFO, "%s Performing BackgroundUpdateRequest outside normal request processing flow.", buf, 0xCu);
              }
              v27 = [v20 encodedClassName];
              [(AFConnection *)self _requestWillBeginWithRequestClass:v27 isSpeechRequest:0 speechRequestOptions:0 requestInfo:0 isBackgroundRequest:1 analyticsEventProvider:0];
            }
            v28 = [(AFConnection *)self _clientService];
            v29 = [v20 dictionary];
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __69__AFConnection_sendGenericAceCommand_turnIdentifier_conflictHandler___block_invoke;
            v36[3] = &unk_1E59283D0;
            id v37 = v9;
            [v28 performGenericAceCommand:v29 interruptOutstandingRequest:v9 == 0 reply:v36];
          }
          else
          {
            [(AFConnection *)self _startRequestWithAceCommand:v22 turnIdentifier:v34 suppressAlert:v32];
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      }
      while (v17);
    }

    id v8 = v30;
  }
}

uint64_t __69__AFConnection_sendGenericAceCommand_turnIdentifier_conflictHandler___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (void)sendGenericAceCommand:(id)a3 conflictHandler:(id)a4
{
}

- (void)sendGenericAceCommand:(id)a3
{
}

- (float)peakPower
{
  [(AFAudioPowerUpdater *)self->_inputAudioPowerUpdater _unsafePeakPower];
  return result;
}

- (float)averagePower
{
  [(AFAudioPowerUpdater *)self->_inputAudioPowerUpdater _unsafeAveragePower];
  return result;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (BOOL)shouldSpeak
{
  return (*((unsigned __int8 *)self + 216) >> 1) & 1;
}

- (BOOL)hasActiveRequest
{
  return self->_activeRequestType != 0;
}

- (BOOL)isRecording
{
  return (*((unsigned __int8 *)self + 216) >> 2) & 1;
}

- (void)rollbackRequest
{
  id v3 = NSStringFromSelector(a2);
  [(AFConnection *)self _cancelRequestTimeoutForReason:v3];

  id v4 = [(AFConnection *)self _clientService];
  [v4 rollbackRequest];
}

- (void)rollbackClearContext
{
  id v2 = [(AFConnection *)self _clientService];
  [v2 rollbackClearContext];
}

- (void)updateSpeechOptions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315650;
    id v10 = "-[AFConnection updateSpeechOptions:]";
    __int16 v11 = 2048;
    long long v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p %@", (uint8_t *)&v9, 0x20u);
  }
  analytics = self->_analytics;
  id v7 = AFAnalyticsContextCreateWithSpeechRequestOptions(v4);
  [(AFAnalytics *)analytics logEventWithType:1909 context:v7 contextNoCopy:0];

  id v8 = [(AFConnection *)self _clientService];
  [v8 updateSpeechOptions:v4];
}

- (void)stopSpeechWithOptions:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  kdebug_trace();
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315650;
    uint64_t v15 = "-[AFConnection stopSpeechWithOptions:]";
    __int16 v16 = 2048;
    uint64_t v17 = self;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p %@", (uint8_t *)&v14, 0x20u);
  }
  [(AFConnection *)self _checkAndSetIsCapturingSpeech:0];
  analytics = self->_analytics;
  id v7 = AFAnalyticsContextCreateWithSpeechRequestOptions(v4);
  [(AFAnalytics *)analytics logEventWithType:1910 context:v7 contextNoCopy:0];

  id v8 = [(AFConnection *)self _clientService];
  [v8 stopSpeechWithOptions:v4];

  if (self->_activeRequestType == 1 && self->_activeRequestStopSpeechTimeAPICalled == 0.0)
  {
    int v9 = [MEMORY[0x1E4F28F80] processInfo];
    [v9 systemUptime];
    self->_activeRequestStopSpeechTimeAPICalled = v10;

    if (v4)
    {
      if ([v4 stopRecordingHostTime])
      {
        unint64_t v11 = [v4 stopRecordingHostTime];
        if (_AFMachAbsoluteTimeRate_onceToken == -1) {
          goto LABEL_8;
        }
      }
      else
      {
        [v4 activationEventTime];
        if (v13 > 0.0)
        {
          [v4 activationEventTime];
          goto LABEL_11;
        }
        if (![v4 activationEventMachAbsoluteTime]) {
          goto LABEL_12;
        }
        unint64_t v11 = [v4 activationEventMachAbsoluteTime];
        if (_AFMachAbsoluteTimeRate_onceToken == -1)
        {
LABEL_8:
          double v12 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v11 / 1000000000.0;
LABEL_11:
          self->_activeRequestStopSpeechTimeRequested = v12;
          goto LABEL_12;
        }
      }
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
      goto LABEL_8;
    }
  }
LABEL_12:
}

- (void)stopSpeech
{
}

- (void)reportIssueForType:(id)a3 subtype:(id)a4 context:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    double v10 = [(AFConnection *)self _clientService];
    [v10 reportIssueForType:v11 subtype:v8 context:v9];
  }
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 subtype:(id)a5 context:(id)a6
{
  id v13 = a3;
  id v10 = a5;
  id v11 = a6;
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    double v12 = [(AFConnection *)self _clientService];
    [v12 reportIssueForError:v13 type:a4 subtype:v10 context:v11];
  }
}

- (void)reportIssueForError:(id)a3 type:(int64_t)a4 context:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    id v9 = [(AFConnection *)self _clientService];
    [v9 reportIssueForError:v10 type:a4 context:v8];
  }
}

- (void)failRequestWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v13 = 136315650;
    int v14 = "-[AFConnection failRequestWithError:]";
    __int16 v15 = 2048;
    __int16 v16 = self;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_error_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_ERROR, "%s %p %@", (uint8_t *)&v13, 0x20u);
  }
  id v6 = [(AFConnection *)self _siriClientStateManager];
  [v6 beginTransactionForReason:3];

  id v7 = [v4 domain];
  if (![v7 isEqualToString:@"kAFAssistantErrorDomain"]) {
    goto LABEL_8;
  }
  uint64_t v8 = [v4 code];

  if (v8 == 1)
  {
    if (self->_lastRetryError)
    {
      id v9 = [v4 userInfo];
      id v10 = [v9 objectForKey:*MEMORY[0x1E4F28A50]];

      if (!v10)
      {
        +[AFError errorWithCode:1 description:@"kAFAssistantErrorDomain" underlyingError:self->_lastRetryError];
        id v7 = v4;
        id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
      }
    }
  }
  [(AFConnection *)self _willFailRequestWithError:v4];
  [(AFConnection *)self _requestDidEnd];
  [(AFConnection *)self _checkAndSetIsCapturingSpeech:0];
  id v11 = [(AFConnection *)self _clientService];
  [v11 cancelRequestForReason:3 withError:v4];

  double v12 = [(AFConnection *)self _siriClientStateManager];
  [v12 endTransactionForReason:3];
}

- (void)cancelRequestForReason:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    id v10 = "-[AFConnection cancelRequestForReason:]";
    __int16 v11 = 2048;
    int64_t v12 = a3;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s reason = %ld", (uint8_t *)&v9, 0x16u);
  }
  id v6 = [(AFConnection *)self _siriClientStateManager];
  [v6 beginTransactionForReason:2];

  [(AFConnection *)self _willCancelRequest];
  [(AFConnection *)self _requestDidEnd];
  [(AFConnection *)self _checkAndSetIsCapturingSpeech:0];
  id v7 = [(AFConnection *)self _clientService];
  [v7 cancelRequestForReason:a3 withError:0];

  uint64_t v8 = [(AFConnection *)self _siriClientStateManager];
  [v8 endTransactionForReason:2];
}

- (void)cancelRequest
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFConnection cancelRequest]";
    __int16 v6 = 2048;
    id v7 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  [(AFConnection *)self cancelRequestForReason:13];
}

- (void)cancelSpeech
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[AFConnection cancelSpeech]";
    __int16 v6 = 2048;
    id v7 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v4, 0x16u);
  }
  [(AFConnection *)self cancelRequest];
}

- (void)startAcousticIDRequestWithOptions:(id)a3
{
  id v4 = a3;
  [(AFConnection *)self _checkAndSetIsCapturingSpeech:1];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke;
  v14[3] = &unk_1E5924928;
  id v15 = v4;
  __int16 v16 = self;
  id v5 = v4;
  [(AFConnection *)self _requestWillBeginWithRequestClass:0 isSpeechRequest:1 speechRequestOptions:v5 requestInfo:0 analyticsEventProvider:v14];
  __int16 v6 = self->_activeRequestUUID;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_2;
  v12[3] = &unk_1E5924950;
  v12[4] = self;
  id v7 = v6;
  uint64_t v13 = v7;
  uint64_t v8 = [(AFConnection *)self _clientServiceWithErrorHandler:v12];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_2_345;
  v10[3] = &unk_1E5924950;
  void v10[4] = self;
  __int16 v11 = v7;
  int v9 = v7;
  [v8 startAcousticIDRequestWithOptions:v5 context:0 completion:v10];
}

uint64_t __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFAnalyticsContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
  v21[0] = v4;
  v19[0] = @"unixTime";
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  __int16 v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  v19[1] = @"id";
  v20[0] = v7;
  uint64_t v8 = [v3 UUIDString];
  v20[1] = v8;
  int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v21[1] = v9;
  id v10 = [*(id *)(a1 + 40) _startRequestMetricSettings];
  v21[2] = v10;
  __int16 v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  int64_t v12 = AFAnalyticsContextsMerge(v11);

  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    v18[0] = v12;
    uint64_t v13 = AFAnalyticsTurnContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
    v18[1] = v13;
    int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v15 = AFAnalyticsContextsMerge(v14);

    int64_t v12 = (void *)v15;
  }
  uint64_t v16 = AFAnalyticsEventCreateCurrent(1904, v12);

  return v16;
}

void __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[AFConnection startAcousticIDRequestWithOptions:]_block_invoke_2";
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  id v5 = +[AFError errorWithCode:7 description:0 underlyingError:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_344;
  block[3] = &unk_1E592C338;
  block[4] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_2_345(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_3;
  block[3] = &unk_1E592C338;
  block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:2 error:*(void *)(a1 + 48)];
}

uint64_t __50__AFConnection_startAcousticIDRequestWithOptions___block_invoke_344(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:4 error:*(void *)(a1 + 48)];
}

- (void)startSpeechPronunciationRequestWithOptions:(id)a3 pronunciationContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v24 = "-[AFConnection startSpeechPronunciationRequestWithOptions:pronunciationContext:]";
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 2112;
    id v28 = v8;
    _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s %@ %@", buf, 0x20u);
  }
  [(AFConnection *)self _checkAndSetIsCapturingSpeech:1];
  id v10 = [v7 serverCommandId];

  if (v10)
  {
    id v11 = NSStringFromSelector(a2);
    [(AFConnection *)self _extendRequestTimeoutForReason:v11 durationInSeconds:0.0];
  }
  else
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke;
    v20[3] = &unk_1E5924928;
    id v21 = v7;
    id v22 = self;
    [(AFConnection *)self _requestWillBeginWithRequestClass:0 isSpeechRequest:1 speechRequestOptions:v21 requestInfo:0 analyticsEventProvider:v20];
    id v11 = v21;
  }

  int64_t v12 = self->_activeRequestUUID;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2;
  v18[3] = &unk_1E5924950;
  v18[4] = self;
  uint64_t v13 = v12;
  uint64_t v19 = v13;
  __int16 v14 = [(AFConnection *)self _clientServiceWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2_343;
  v16[3] = &unk_1E5924950;
  v16[4] = self;
  __int16 v17 = v13;
  id v15 = v13;
  [v14 startSpeechPronunciationRequestWithOptions:v7 context:v8 completion:v16];
}

uint64_t __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke(uint64_t a1, void *a2)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFAnalyticsContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
  v21[0] = v4;
  v19[0] = @"unixTime";
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  v19[1] = @"id";
  v20[0] = v7;
  id v8 = [v3 UUIDString];
  v20[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v21[1] = v9;
  id v10 = [*(id *)(a1 + 40) _startRequestMetricSettings];
  v21[2] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  int64_t v12 = AFAnalyticsContextsMerge(v11);

  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    v18[0] = v12;
    uint64_t v13 = AFAnalyticsTurnContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
    v18[1] = v13;
    __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v15 = AFAnalyticsContextsMerge(v14);

    int64_t v12 = (void *)v15;
  }
  uint64_t v16 = AFAnalyticsEventCreateCurrent(1903, v12);

  return v16;
}

void __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[AFConnection startSpeechPronunciationRequestWithOptions:pronunciationContext:]_block_invoke_2";
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  id v5 = +[AFError errorWithCode:7 description:0 underlyingError:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_342;
  block[3] = &unk_1E592C338;
  block[4] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_2_343(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_3;
  block[3] = &unk_1E592C338;
  block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

uint64_t __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:2 error:*(void *)(a1 + 48)];
}

uint64_t __80__AFConnection_startSpeechPronunciationRequestWithOptions_pronunciationContext___block_invoke_342(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:4 error:*(void *)(a1 + 48)];
}

- (id)startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    long long v39 = "-[AFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]";
    __int16 v40 = 2048;
    long long v41 = self;
    __int16 v42 = 2112;
    id v43 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  +[AFAggregator logSiriInvokedVia:](AFAggregator, "logSiriInvokedVia:", [v4 activationEvent]);
  id v6 = [(AFConnection *)self _siriClientStateManager];
  [v6 beginTransactionForReason:1];

  [(AFConnection *)self _checkAndSetIsCapturingSpeech:1];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke;
  v35[3] = &unk_1E5924928;
  id v7 = v4;
  id v36 = v7;
  id v37 = self;
  [(AFConnection *)self _requestWillBeginWithRequestClass:0 isSpeechRequest:1 speechRequestOptions:v7 requestInfo:0 analyticsEventProvider:v35];
  unint64_t pendingSpeechRequestCounter = self->_pendingSpeechRequestCounter;
  self->_unint64_t pendingSpeechRequestCounter = pendingSpeechRequestCounter + 1;
  id v9 = self->_activeRequestUUID;
  kdebug_trace();
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2;
  v33[3] = &unk_1E5924950;
  v33[4] = self;
  id v10 = v9;
  id v34 = v10;
  id v11 = [(AFConnection *)self _clientServiceWithErrorHandler:v33];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2_340;
  v31[3] = &unk_1E5924950;
  v31[4] = self;
  int64_t v12 = v10;
  unsigned int v32 = v12;
  [v11 startRecordingForPendingSpeechRequestWithOptions:v7 requestId:pendingSpeechRequestCounter sessionUUID:v12 completion:v31];

  if ([v7 pendCallbacksUntilAfterContinuation])
  {
    uint64_t v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    __int16 v14 = [AFSafetyBlock alloc];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_4;
    v29[3] = &unk_1E5928308;
    id v15 = v13;
    id v30 = v15;
    uint64_t v16 = [(AFSafetyBlock *)v14 initWithBlock:v29];
    speechCallbackGroup = self->_speechCallbackGroup;
    self->_speechCallbackGroup = (OS_dispatch_group *)v15;
    id v18 = v15;
  }
  else
  {
    uint64_t v16 = 0;
    id v18 = self->_speechCallbackGroup;
    self->_speechCallbackGroup = 0;
  }

  uint64_t v19 = [(AFConnection *)self _siriClientStateManager];
  [v19 endTransactionForReason:1];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_5;
  v24[3] = &unk_1E5929398;
  id v25 = v7;
  id v26 = self;
  __int16 v27 = v16;
  unint64_t v28 = pendingSpeechRequestCounter;
  uint64_t v20 = v16;
  id v21 = v7;
  id v22 = (void *)MEMORY[0x19F3A50D0](v24);

  return v22;
}

uint64_t __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFAnalyticsContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
  v21[0] = v4;
  v19[0] = @"unixTime";
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  v19[1] = @"id";
  v20[0] = v7;
  id v8 = [v3 UUIDString];
  v20[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  v21[1] = v9;
  id v10 = [*(id *)(a1 + 40) _startRequestMetricSettings];
  v21[2] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
  int64_t v12 = AFAnalyticsContextsMerge(v11);

  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    v18[0] = v12;
    uint64_t v13 = AFAnalyticsTurnContextCreateWithSpeechRequestOptions(*(void **)(a1 + 32));
    v18[1] = v13;
    __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    uint64_t v15 = AFAnalyticsContextsMerge(v14);

    int64_t v12 = (void *)v15;
  }
  uint64_t v16 = AFAnalyticsEventCreateCurrent(1902, v12);

  return v16;
}

void __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v13 = "-[AFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]_block_invoke_2";
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  id v5 = +[AFError errorWithCode:7 description:0 underlyingError:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_339;
  block[3] = &unk_1E592C338;
  block[4] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_2_340(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_3;
  block[3] = &unk_1E592C338;
  block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v6 = v3;
  dispatch_async(v5, block);
}

void __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_4(uint64_t a1)
{
}

void __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F28F80] processInfo];
  [v2 systemUptime];
  double v4 = v3;

  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    int64_t v12 = "-[AFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]_block_invoke_5";
    __int16 v13 = 2048;
    uint64_t v14 = v6;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Continuing pending speech request %p", buf, 0x16u);
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_341;
  v9[3] = &unk_1E592C248;
  id v7 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  id v8 = [v7 _clientServiceWithErrorHandler:v9];
  [v8 continuePendingSpeechRequestWithId:*(void *)(a1 + 56) fromTimestamp:v4];

  [*(id *)(a1 + 48) invoke];
}

void __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_341(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[AFConnection startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:]_block_invoke";
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Failed continuing pending speech request %p %{public}@", (uint8_t *)&v6, 0x20u);
  }
}

uint64_t __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:2 error:*(void *)(a1 + 48)];
}

uint64_t __84__AFConnection_startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions___block_invoke_339(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:4 error:*(void *)(a1 + 48)];
}

- (void)startRecordingForPendingSpeechRequestWithOptions:(id)a3 completion:(id)a4
{
  int v6 = (void (**)(id, id))a4;
  id v7 = [(AFConnection *)self startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:a3];
  v6[2](v6, v7);
}

- (void)startSpeechRequestWithOptions:(id)a3
{
  id v3 = [(AFConnection *)self startRecordingAndGetContinueBlockForPendingSpeechRequestWithOptions:a3];
  v3[2]();
}

- (void)_startRequestWithAceCommand:(id)a3 turnIdentifier:(id)a4 suppressAlert:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  uint64_t v9 = objc_alloc_init(AFRequestInfo);
  [(AFRequestInfo *)v9 setActivationEvent:0];
  [(AFRequestInfo *)v9 setTurnIdentifier:v8];

  if (v5) {
    [(AFRequestInfo *)v9 setOptions:1];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AFRequestInfo *)v9 setStartLocalRequest:v10];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(AFRequestInfo *)v9 setStartRequest:v10];
    }
  }
  [(AFConnection *)self _startRequestWithInfo:v9];
}

- (id)_metricContextValueForUseDeviceSpeakerForTTS:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_1E5924A38[a3 - 1];
  }
}

- (id)_startRequestMetricSettings
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  double v4 = self->_preferences;
  BOOL v5 = [(AFPreferences *)v4 languageCode];
  if (v5) {
    [v3 setValue:v5 forKey:@"siriInputLanguage"];
  }
  if (AFIsHorseman_onceToken != -1) {
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
  }
  if (!AFIsHorseman_isHorseman)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = [MEMORY[0x1E4F28ED0] numberWithBool:AFPreferencesTypeToSiriEnabled()];
    [v6 setObject:v7 forKey:@"typeToSiri"];

    id v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AFPreferences alwaysShowRecognizedSpeech](v4, "alwaysShowRecognizedSpeech"));
    [v6 setObject:v8 forKey:@"showRecognizedSpeech"];

    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AFPreferences siriResponseShouldAlwaysPrint](v4, "siriResponseShouldAlwaysPrint"));
    [v6 setObject:v9 forKey:@"captionVoiceFeedback"];

    id v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[AFPreferences alwaysObscureBackgroundContentWhenActive](v4, "alwaysObscureBackgroundContentWhenActive"));
    [v6 setObject:v10 forKey:@"hideBackgroundContent"];

    id v11 = [(AFConnection *)self _metricContextValueForUseDeviceSpeakerForTTS:[(AFPreferences *)v4 useDeviceSpeakerForTTS]];
    if (v11) {
      [v6 setObject:v11 forKey:@"useSpeakerForTTS"];
    }
    [v3 setValue:v6 forKey:@"requestSettings"];
  }
  return v3;
}

- (void)_startRequestWithInfo:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = "-[AFConnection _startRequestWithInfo:]";
    __int16 v22 = 2048;
    uint64_t v23 = self;
    __int16 v24 = 2112;
    id v25 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
  }
  if ([v4 activationEvent] == 2)
  {
    id v6 = [v4 speechRequestOptions];
    uint64_t v7 = [v6 activationEvent];

    if (v7 == 9) {
      kdebug_trace();
    }
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __38__AFConnection__startRequestWithInfo___block_invoke;
  v17[3] = &unk_1E5924928;
  id v18 = v4;
  uint64_t v19 = self;
  id v8 = v4;
  [(AFConnection *)self _requestWillBeginWithRequestClass:0 isSpeechRequest:0 speechRequestOptions:0 requestInfo:v8 analyticsEventProvider:v17];
  uint64_t v9 = self->_activeRequestUUID;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __38__AFConnection__startRequestWithInfo___block_invoke_2;
  v15[3] = &unk_1E5924950;
  v15[4] = self;
  id v10 = v9;
  uint64_t v16 = v10;
  id v11 = [(AFConnection *)self _clientServiceWithErrorHandler:v15];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __38__AFConnection__startRequestWithInfo___block_invoke_2_322;
  v13[3] = &unk_1E5924950;
  void v13[4] = self;
  uint64_t v14 = v10;
  uint64_t v12 = v10;
  [v11 startRequestWithInfo:v8 completion:v13];
}

uint64_t __38__AFConnection__startRequestWithInfo___block_invoke(uint64_t a1, void *a2)
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v21 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) activationEvent];
  if ((unint64_t)(v3 - 2) > 3) {
    uint64_t v4 = 1901;
  }
  else {
    uint64_t v4 = qword_19D0E2560[v3 - 2];
  }
  uint64_t v20 = v4;
  BOOL v5 = AFAnalyticsContextCreateWithRequestInfo(*(void **)(a1 + 32));
  v25[0] = v5;
  v23[0] = @"unixTime";
  id v6 = (void *)MEMORY[0x1E4F28ED0];
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSince1970];
  id v8 = objc_msgSend(v6, "numberWithDouble:");
  v24[0] = v8;
  v23[1] = @"id";
  uint64_t v9 = [v21 UUIDString];
  v24[1] = v9;
  v23[2] = @"systemVersion";
  id v10 = AFProductAndBuildVersion();
  v24[2] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v25[1] = v11;
  uint64_t v12 = [*(id *)(a1 + 40) _startRequestMetricSettings];
  v25[2] = v12;
  __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  uint64_t v14 = AFAnalyticsContextsMerge(v13);

  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    v22[0] = v14;
    uint64_t v15 = AFAnalyticsTurnContextCreateWithRequestInfo(*(void **)(a1 + 32));
    v22[1] = v15;
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 2, v20);
    uint64_t v17 = AFAnalyticsContextsMerge(v16);

    uint64_t v14 = (void *)v17;
  }
  uint64_t v18 = AFAnalyticsEventCreateCurrent(v20, v14);
  [*(id *)(a1 + 32) activationEvent];

  return v18;
}

void __38__AFConnection__startRequestWithInfo___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[AFConnection _startRequestWithInfo:]_block_invoke_2";
    __int16 v14 = 2114;
    id v15 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  BOOL v5 = +[AFError errorWithCode:7 description:0 underlyingError:v3];

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AFConnection__startRequestWithInfo___block_invoke_321;
  block[3] = &unk_1E592C338;
  block[4] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __38__AFConnection__startRequestWithInfo___block_invoke_2_322(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = &stru_1EEE35D28;
    if (v3) {
      BOOL v5 = v3;
    }
    *(_DWORD *)buf = 136315394;
    __int16 v13 = "-[AFConnection _startRequestWithInfo:]_block_invoke_2";
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Complete %@", buf, 0x16u);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__AFConnection__startRequestWithInfo___block_invoke_326;
  block[3] = &unk_1E592C338;
  block[4] = v6;
  id v10 = *(id *)(a1 + 40);
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v7, block);
}

uint64_t __38__AFConnection__startRequestWithInfo___block_invoke_326(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:2 error:*(void *)(a1 + 48)];
}

uint64_t __38__AFConnection__startRequestWithInfo___block_invoke_321(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeRequestWithUUID:*(void *)(a1 + 40) forReason:4 error:*(void *)(a1 + 48)];
}

- (void)startRequestWithInfo:(id)a3 activationEvent:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    id v8 = v7;
    if ((unint64_t)a4 > 0xB) {
      uint64_t v9 = @"Unknown";
    }
    else {
      uint64_t v9 = off_1E5925920[a4];
    }
    id v10 = v9;
    int v11 = 136315650;
    uint64_t v12 = "-[AFConnection startRequestWithInfo:activationEvent:]";
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s Overriding activation event in info %@ %@", (uint8_t *)&v11, 0x20u);
  }
  [v6 setActivationEvent:a4];
  [(AFConnection *)self _startRequestWithInfo:v6];
}

- (void)startRequestWithCorrectedText:(id)a3 forSpeechIdentifier:(id)a4 userSelectionResults:(id)a5 turnIdentifier:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc_init(AFRequestInfo);
  [(AFRequestInfo *)v14 setActivationEvent:4];
  [(AFRequestInfo *)v14 setCorrectedSpeech:v13];

  [(AFRequestInfo *)v14 setCorrectedSpeechContext:v12];
  [(AFRequestInfo *)v14 setTurnIdentifier:v11];

  id v24 = v10;
  __int16 v15 = [v24 combinedRank];
  [(AFRequestInfo *)v14 setCombinedRank:v15];

  uint64_t v16 = [v24 combinedScore];
  [(AFRequestInfo *)v14 setCombinedScore:v16];

  uint64_t v17 = [v24 interactionId];
  [(AFRequestInfo *)v14 setInteractionId:v17];

  uint64_t v18 = [v24 onDeviceUtterancesPresent];
  [(AFRequestInfo *)v14 setOnDeviceUtterancesPresent:v18];

  uint64_t v19 = [v24 originalRank];
  [(AFRequestInfo *)v14 setOriginalRank:v19];

  uint64_t v20 = [v24 originalScore];
  [(AFRequestInfo *)v14 setOriginalScore:v20];

  id v21 = [v24 previousUtterance];
  [(AFRequestInfo *)v14 setPreviousUtterance:v21];

  __int16 v22 = [v24 sessionId];
  [(AFRequestInfo *)v14 setSessionId:v22];

  uint64_t v23 = [v24 utteranceSource];

  [(AFRequestInfo *)v14 setUtteranceSource:v23];
  [(AFConnection *)self _startRequestWithInfo:v14];
}

- (void)startRequestWithCorrectedText:(id)a3 forSpeechIdentifier:(id)a4 userSelectionResults:(id)a5
{
}

- (void)startRequestWithAceCommand:(id)a3
{
}

- (void)startContinuationRequestWithUserInfo:(id)a3
{
  id v4 = a3;
  id v6 = objc_alloc_init(AFRequestInfo);
  BOOL v5 = [v4 objectForKey:@"Data"];

  [(AFRequestInfo *)v6 setHandoffRequestData:v5];
  [(AFConnection *)self _startRequestWithInfo:v6];
}

- (void)startDirectActionRequestWithString:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(AFRequestInfo);
  [(AFRequestInfo *)v5 setActivationEvent:2];
  [(AFRequestInfo *)v5 setLegacyDirectActionIdentifier:v4];

  [(AFConnection *)self _startRequestWithInfo:v5];
}

- (void)startRequestWithText:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_alloc_init(AFRequestInfo);
  [(AFRequestInfo *)v5 setActivationEvent:5];
  [(AFRequestInfo *)v5 setText:v4];

  [(AFConnection *)self _startRequestWithInfo:v5];
}

- (void)setConfiguration:(id)a3
{
  id v4 = (AFClientConfiguration *)[a3 copy];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v4;

  *((unsigned char *)self + 272) &= ~1u;
  [(AFConnection *)self _updateClientConfiguration];
}

- (void)setVoiceOverIsActive:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 272) = *((unsigned char *)self + 272) & 0xFD | v3;
}

- (void)setMyriadDecisionResult:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[AFConnection setMyriadDecisionResult:]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setShouldWaitForMyriad:(BOOL)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  char v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    BOOL v5 = "-[AFConnection setShouldWaitForMyriad:]";
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setDeviceRingerSwitchState:(int64_t)a3
{
  BOOL v5 = [(AFConnection *)self _clientConfiguration];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__AFConnection_setDeviceRingerSwitchState___block_invoke;
  v8[3] = &__block_descriptor_40_e41_v16__0___AFClientConfigurationMutating__8l;
  void v8[4] = a3;
  uint64_t v6 = [v5 mutatedCopyWithMutator:v8];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(AFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __43__AFConnection_setDeviceRingerSwitchState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDeviceRingerSwitchState:*(void *)(a1 + 32)];
}

- (void)setAccessibilityState:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AFConnection *)self _clientConfiguration];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __38__AFConnection_setAccessibilityState___block_invoke;
  v9[3] = &unk_1E59248E0;
  id v6 = v4;
  id v10 = v6;
  uint64_t v7 = [v5 mutatedCopyWithMutator:v9];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v7;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(AFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __38__AFConnection_setAccessibilityState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAccessibilityState:*(void *)(a1 + 32)];
}

- (void)setWatchAuthenticated:(BOOL)a3
{
  BOOL v5 = [(AFConnection *)self _clientConfiguration];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__AFConnection_setWatchAuthenticated___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  BOOL v9 = a3;
  id v6 = [v5 mutatedCopyWithMutator:v8];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(AFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __38__AFConnection_setWatchAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsDeviceWatchAuthenticated:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a3
{
  BOOL v5 = [(AFConnection *)self _clientConfiguration];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__AFConnection_setAnnouncementRequestsPermittedByPresentationWhileActive___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  BOOL v9 = a3;
  id v6 = [v5 mutatedCopyWithMutator:v8];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(AFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __74__AFConnection_setAnnouncementRequestsPermittedByPresentationWhileActive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAreAnnouncementRequestsPermittedByPresentationWhileActive:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setModesConfiguration:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[AFFeatureFlags isResponseFrameworkEnabled])
  {
    BOOL v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = "-[AFConnection setModesConfiguration:]";
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s #modes set modesConfiguration", (uint8_t *)&v7, 0xCu);
    }
    id v6 = [(AFConnection *)self _clientService];
    [v6 setModesConfiguration:v4];
  }
}

- (void)setCarDNDActive:(BOOL)a3
{
  BOOL v5 = [(AFConnection *)self _clientConfiguration];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __32__AFConnection_setCarDNDActive___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  BOOL v9 = a3;
  id v6 = [v5 mutatedCopyWithMutator:v8];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(AFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __32__AFConnection_setCarDNDActive___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsDeviceInCarDNDMode:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  BOOL v5 = [(AFConnection *)self _clientConfiguration];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__AFConnection_setSupportsCarPlayVehicleData___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  BOOL v9 = a3;
  id v6 = [v5 mutatedCopyWithMutator:v8];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(AFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __46__AFConnection_setSupportsCarPlayVehicleData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSupportsCarPlayVehicleData:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setIsDeviceInStarkMode:(BOOL)a3
{
  BOOL v5 = [(AFConnection *)self _clientConfiguration];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__AFConnection_setIsDeviceInStarkMode___block_invoke;
  v8[3] = &__block_descriptor_33_e41_v16__0___AFClientConfigurationMutating__8l;
  BOOL v9 = a3;
  id v6 = [v5 mutatedCopyWithMutator:v8];
  clientConfiguration = self->_clientConfiguration;
  self->_clientConfiguration = v6;

  *((unsigned char *)self + 272) &= ~1u;
  if ((*((unsigned char *)self + 216) & 8) != 0) {
    [(AFConnection *)self _updateClientConfiguration];
  }
}

uint64_t __39__AFConnection_setIsDeviceInStarkMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setIsDeviceInStarkMode:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setLockState:(BOOL)a3 screenLocked:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(AFConnection *)self _clientService];
  [v6 setLockState:v5 showingLockScreen:v4];
}

- (void)didDismissUI
{
  char v3 = [(AFConnection *)self _clientService];
  [v3 didDismissUI];

  id v4 = [(AFConnection *)self _siriClientStateManager];
  [v4 endSessionForClient:self->_clientID];
}

- (void)willPresentUI
{
  char v3 = [(AFConnection *)self _clientService];
  [v3 willPresentUIWithReply:&__block_literal_global_312];

  id v4 = [(AFConnection *)self _siriClientStateManager];
  [v4 beginSessionForClient:self->_clientID];
}

void __29__AFConnection_willPresentUI__block_invoke()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v0 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v1 = 136315138;
    id v2 = "-[AFConnection willPresentUI]_block_invoke";
    _os_log_impl(&dword_19CF1D000, v0, OS_LOG_TYPE_INFO, "%s Received reply.", (uint8_t *)&v1, 0xCu);
  }
}

- (void)resumeInterruptedAudioPlaybackIfNeeded
{
  id v2 = [(AFConnection *)self _clientServiceWithErrorHandler:&__block_literal_global_310];
  [v2 resumeInterruptedAudioPlaybackIfNeeded];
}

void __54__AFConnection_resumeInterruptedAudioPlaybackIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    BOOL v5 = "-[AFConnection resumeInterruptedAudioPlaybackIfNeeded]_block_invoke";
    __int16 v6 = 2114;
    id v7 = v2;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)forceAudioSessionInactiveWithOptions:(unint64_t)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v20 = "-[AFConnection forceAudioSessionInactiveWithOptions:completion:]";
    __int16 v21 = 2048;
    __int16 v22 = self;
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEFAULT, "%s %p %lu", buf, 0x20u);
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __64__AFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke;
  v17[3] = &unk_1E592C360;
  id v18 = v6;
  id v8 = v6;
  BOOL v9 = (void *)MEMORY[0x19F3A50D0](v17);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __64__AFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke_2;
  __int16 v15 = &unk_1E592B9A0;
  id v16 = v9;
  id v10 = v9;
  id v11 = [(AFConnection *)self _clientServiceWithErrorHandler:&v12];
  objc_msgSend(v11, "forceAudioSessionInactiveWithOptions:completion:", a3, v10, v12, v13, v14, v15);
}

uint64_t __64__AFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __64__AFConnection_forceAudioSessionInactiveWithOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[AFConnection forceAudioSessionInactiveWithOptions:completion:]_block_invoke_2";
    __int16 v7 = 2114;
    id v8 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", (uint8_t *)&v5, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceAudioSessionInactive
{
}

- (void)acquireAudioSessionWithContext:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v18 = "-[AFConnection acquireAudioSessionWithContext:completion:]";
    __int16 v19 = 2048;
    uint64_t v20 = self;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }
  uint64_t v9 = [(AFConnection *)self _siriClientStateManager];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__AFConnection_acquireAudioSessionWithContext_completion___block_invoke;
  v13[3] = &unk_1E5924898;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v9;
  id v16 = v7;
  id v10 = v9;
  id v11 = v6;
  id v12 = v7;
  [(AFConnection *)self forceAudioSessionActiveWithContext:v11 completion:v13];
}

void __58__AFConnection_acquireAudioSessionWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315650;
    id v22 = "-[AFConnection acquireAudioSessionWithContext:completion:]_block_invoke";
    __int16 v23 = 2048;
    uint64_t v24 = v5;
    __int16 v25 = 2114;
    id v26 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEFAULT, "%s %p %{public}@", buf, 0x20u);
  }
  if (*(void *)(a1 + 56))
  {
    uint64_t v6 = [*(id *)(a1 + 40) reason];
    id v7 = [v3 error];
    BOOL v8 = v7 != 0;

    BOOL v9 = v6 == 3;
    if (v9 && !v7 && !atomic_fetch_add((atomic_ullong *volatile)(*(void *)(a1 + 32) + 344), 1uLL)) {
      [*(id *)(a1 + 48) beginSpeakingForClient:*(void *)(a1 + 32)];
    }
    id v10 = [AFSafetyBlock alloc];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __58__AFConnection_acquireAudioSessionWithContext_completion___block_invoke_307;
    v17[3] = &unk_1E5924870;
    BOOL v19 = v9;
    BOOL v20 = v8;
    void v17[4] = *(void *)(a1 + 32);
    id v18 = *(id *)(a1 + 48);
    id v11 = [(AFSafetyBlock *)v10 initWithBlock:v17];
    uint64_t v12 = *(void *)(a1 + 56);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__AFConnection_acquireAudioSessionWithContext_completion___block_invoke_2;
    v15[3] = &unk_1E592C678;
    id v16 = v11;
    uint64_t v13 = *(void (**)(uint64_t, id, void *))(v12 + 16);
    id v14 = v11;
    v13(v12, v3, v15);
  }
}

uint64_t __58__AFConnection_acquireAudioSessionWithContext_completion___block_invoke_307(uint64_t result)
{
  if (*(unsigned char *)(result + 48)
    && !*(unsigned char *)(result + 49)
    && atomic_fetch_add((atomic_ullong *volatile)(*(void *)(result + 32) + 344), 0xFFFFFFFFFFFFFFFFLL) == 1)
  {
    return [*(id *)(result + 40) endSpeakingForClient:*(void *)(result + 32)];
  }
  return result;
}

uint64_t __58__AFConnection_acquireAudioSessionWithContext_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) invokeWithSignal:0];
}

- (void)forceAudioSessionActiveWithContext:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v23 = "-[AFConnection forceAudioSessionActiveWithContext:completion:]";
    __int16 v24 = 2048;
    __int16 v25 = self;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEFAULT, "%s %p %@", buf, 0x20u);
  }
  BOOL v9 = [AFOneArgumentSafetyBlock alloc];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke;
  v20[3] = &unk_1E59247D8;
  void v20[4] = self;
  id v21 = v7;
  id v10 = v7;
  id v11 = +[AFSetAudioSessionActiveResult newWithBuilder:&__block_literal_global_297];
  uint64_t v12 = [(AFOneArgumentSafetyBlock *)v9 initWithBlock:v20 defaultValue:v11];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2;
  v18[3] = &unk_1E592C248;
  uint64_t v13 = v12;
  BOOL v19 = v13;
  id v14 = [(AFConnection *)self _clientServiceWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2_305;
  v16[3] = &unk_1E5924848;
  uint64_t v17 = v13;
  id v15 = v13;
  [v14 forceAudioSessionActiveWithContext:v6 completion:v16];
}

void __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 136315650;
    BOOL v8 = "-[AFConnection forceAudioSessionActiveWithContext:completion:]_block_invoke";
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_DEFAULT, "%s %p %@", (uint8_t *)&v7, 0x20u);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v11 = "-[AFConnection forceAudioSessionActiveWithContext:completion:]_block_invoke_2";
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s ErrorHandler %{public}@", buf, 0x16u);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_301;
  v8[3] = &unk_1E5924820;
  id v9 = v3;
  id v6 = v3;
  id v7 = +[AFSetAudioSessionActiveResult newWithBuilder:v8];
  [v5 invokeWithValue:v7];
}

uint64_t __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_2_305(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

void __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_301(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setAudioSessionID:0];
  id v4 = +[AFError errorWithCode:7 description:@"XPC connection encountered an error during -forceAudioSessionActive." underlyingError:*(void *)(a1 + 32)];
  [v3 setError:v4];
}

void __62__AFConnection_forceAudioSessionActiveWithContext_completion___block_invoke_294(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setAudioSessionID:0];
  id v3 = +[AFError errorWithCode:40 description:@"Safety completion of -forceAudioSessionActive is deallocated without invocation."];
  [v2 setError:v3];
}

- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 speechRequestOptions:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__AFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke;
  v17[3] = &unk_1E59252D8;
  unint64_t v19 = a3;
  int64_t v20 = a4;
  id v18 = v10;
  id v12 = v10;
  id v13 = +[AFSetAudioSessionActiveContext newWithBuilder:v17];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__AFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke_2;
  v15[3] = &unk_1E59247B0;
  id v16 = v11;
  id v14 = v11;
  [(AFConnection *)self forceAudioSessionActiveWithContext:v13 completion:v15];
}

void __90__AFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = a2;
  [v4 setOptions:v3];
  [v4 setReason:a1[6]];
  [v4 setSpeechRequestOptions:a1[4]];
}

void __90__AFConnection_forceAudioSessionActiveWithOptions_reason_speechRequestOptions_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    uint64_t v4 = [v3 audioSessionID];
    id v5 = [v3 error];

    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
  }
}

- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
}

- (void)forceAudioSessionActiveWithOptions:(unint64_t)a3 completion:(id)a4
{
}

- (void)forceAudioSessionActive
{
}

- (void)boostedPreheatWithStyle:(int64_t)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v15 = "-[AFConnection boostedPreheatWithStyle:completion:]";
    __int16 v16 = 2048;
    uint64_t v17 = self;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %p %ld", buf, 0x20u);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__AFConnection_boostedPreheatWithStyle_completion___block_invoke;
  v12[3] = &unk_1E592B9A0;
  id v13 = v6;
  id v8 = v6;
  id v9 = [(AFConnection *)self _clientServiceWithErrorHandler:v12];
  id v10 = v9;
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = &__block_literal_global_288;
  }
  [v9 boostedPreheatWithStyle:a3 completion:v11];
}

uint64_t __51__AFConnection_boostedPreheatWithStyle_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)preheatWithStyle:(int64_t)a3 forOptions:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315906;
    id v12 = "-[AFConnection preheatWithStyle:forOptions:]";
    __int16 v13 = 2048;
    id v14 = self;
    __int16 v15 = 2048;
    int64_t v16 = a3;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s %p %ld %@", (uint8_t *)&v11, 0x2Au);
  }
  [(AFAnalytics *)self->_analytics logEventWithType:1915 context:0];
  id v8 = [(AFConnection *)self _clientService];
  [v8 preheatWithStyle:a3 forOptions:v6];

  id v9 = +[AFAccessibilityObserver sharedObserver];
  id v10 = +[AFDeviceRingerSwitchObserver sharedObserver];
}

- (void)preheatWithStyle:(int64_t)a3
{
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    id v6 = "-[AFConnection invalidate]";
    __int16 v7 = 2048;
    id v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  [(AFConnection *)self _clearConnection];
  uint64_t v4 = [(AFConnection *)self _siriClientStateManager];
  [v4 invalidateClient:self->_clientID];
}

- (void)endSession
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    uint64_t v9 = "-[AFConnection endSession]";
    __int16 v10 = 2048;
    int v11 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v8, 0x16u);
  }
  [(AFConnection *)self _willEndSession];
  if (AFSupportsSCDAFramework_onceToken != -1) {
    dispatch_once(&AFSupportsSCDAFramework_onceToken, &__block_literal_global_226);
  }
  if (AFSupportsSCDAFramework_scdaFrameworkEnabled) {
    uint64_t v4 = (__objc2_class *)MEMORY[0x1E4F9FAE0];
  }
  else {
    uint64_t v4 = AFMyriadCoordinator;
  }
  int v5 = [(__objc2_class *)v4 currentCoordinator];
  id v6 = v5;
  if (v5) {
    [v5 endTask];
  }

  __int16 v7 = [(AFConnection *)self _clientService];
  [v7 endSession];
}

- (void)_endInterstitialsForReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_interstitialProvider)
  {
    int v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[AFConnection _endInterstitialsForReason:]";
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s reason = %@", (uint8_t *)&v8, 0x16u);
    }
    [(AFConnection *)self stopAllAudioPlaybackRequests:+[AFFeatureFlags isStateFeedbackEnabled] ^ 1];
    [(AFInterstitialProvider *)self->_interstitialProvider invalidate];
    interstitialProvider = self->_interstitialProvider;
    self->_interstitialProvider = 0;
  }
  interstitialCommandQueue = self->_interstitialCommandQueue;
  self->_interstitialCommandQueue = 0;
}

- (void)_handleInterstitialPhase:(int64_t)a3 fromProvider:(id)a4 displayText:(id)a5 speakableText:(id)a6 expectedDelay:(double)a7 context:(id)a8 completion:(id)a9
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  __int16 v17 = (AFInterstitialProvider *)a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = (void (**)(void))a9;
  if (self->_interstitialProvider == v17 && ([(NSUUID *)self->_activeRequestUUID isEqual:v20] & 1) != 0)
  {
    id v22 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      __int16 v23 = v22;
      if ((unint64_t)a3 > 4) {
        __int16 v24 = @"(unknown)";
      }
      else {
        __int16 v24 = off_1E5928BD8[a3];
      }
      __int16 v25 = v24;
      *(_DWORD *)buf = 136316418;
      id v34 = "-[AFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:]";
      __int16 v35 = 2112;
      id v36 = v25;
      __int16 v37 = 2112;
      id v38 = v18;
      __int16 v39 = 2112;
      id v40 = v19;
      __int16 v41 = 2048;
      double v42 = a7;
      __int16 v43 = 2112;
      id v44 = v20;
      _os_log_impl(&dword_19CF1D000, v23, OS_LOG_TYPE_INFO, "%s phase = %@, displayText = %@, speakableText = %@, expectedDelay = %f, context = %@", buf, 0x3Eu);
    }
    if ((unint64_t)(a3 - 1) >= 3)
    {
      if (a3 == 4)
      {
        uint64_t v29 = NSStringFromSelector(a2);
        [(AFConnection *)self _endInterstitialsForReason:v29];
        [(AFConnection *)self _invokeRequestTimeoutForReason:v29];
      }
    }
    else
    {
      __int16 v26 = [(AFQueue *)self->_interstitialCommandQueue dequeueObject];
      if (!v26)
      {
        if ([v18 length] || objc_msgSend(v19, "length"))
        {
          id v27 = [(NSUUID *)self->_activeRequestUUID UUIDString];
          AFInterstitialCreateCommand(a3, v18, v19, v27);
          __int16 v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v30 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            id v34 = "-[AFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:]";
            _os_log_impl(&dword_19CF1D000, v30, OS_LOG_TYPE_INFO, "%s Unable to create an interstitial command because display text and speakable text are both empty.", buf, 0xCu);
          }
          __int16 v26 = 0;
        }
      }
      uint64_t v28 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        id v34 = "-[AFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:completion:]";
        __int16 v35 = 2112;
        id v36 = v26;
        _os_log_impl(&dword_19CF1D000, v28, OS_LOG_TYPE_INFO, "%s interstitialCommand = %@", buf, 0x16u);
      }
      if (v26)
      {
        ++self->_activeRequestNumberOfPresentedInterstitials;
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __113__AFConnection__handleInterstitialPhase_fromProvider_displayText_speakableText_expectedDelay_context_completion___block_invoke;
        v31[3] = &unk_1E5924788;
        unsigned int v32 = v21;
        [(AFConnection *)self _dispatchCommand:v26 isInterstitial:1 interstitialPhase:a3 interstitialDelay:v31 reply:a7];
      }
      else if (v21)
      {
        v21[2](v21);
      }
    }
  }
  else if (v21)
  {
    v21[2](v21);
  }
}

void __113__AFConnection__handleInterstitialPhase_fromProvider_displayText_speakableText_expectedDelay_context_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    __int16 v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      id v11 = "-[AFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:complet"
            "ion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s interstitialReply = %@", (uint8_t *)&v10, 0x16u);
    }
  }
  if (v6)
  {
    int v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      id v11 = "-[AFConnection _handleInterstitialPhase:fromProvider:displayText:speakableText:expectedDelay:context:complet"
            "ion:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s interstitialError = %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

- (void)_beginInterstitialsForReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_interstitialProvider)
  {
    if (self->_activeRequestType)
    {
      if (!self->_activeRequestUsefulUserResultType)
      {
        int64_t activeRequestSpeechEvent = self->_activeRequestSpeechEvent;
        if (activeRequestSpeechEvent != 17)
        {
          int64_t activeRequestActivationEvent = self->_activeRequestActivationEvent;
          if (activeRequestActivationEvent != 6 && activeRequestActivationEvent != 9 && activeRequestSpeechEvent != 32)
          {
            if (AFIsInternalInstall_onceToken != -1) {
              dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
            }
            if (!AFIsInternalInstall_isInternal
              || (uint64_t ForcedInterstitialStyle = _AFPreferencesGetForcedInterstitialStyle()) == 0)
            {
              if (AFIsHorseman_onceToken != -1) {
                dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
              }
              if (AFIsHorseman_isHorseman)
              {
                uint64_t ForcedInterstitialStyle = 4;
              }
              else
              {
                recordRoute = self->_recordRoute;
                if (recordRoute
                  && [(NSString *)recordRoute isEqualToString:@"BluetoothDoAP"])
                {
                  uint64_t ForcedInterstitialStyle = 3;
                }
                else if ([(AFClientConfiguration *)self->_clientConfiguration isDeviceInStarkMode])
                {
                  uint64_t ForcedInterstitialStyle = 6;
                }
                else if ([(AFClientConfiguration *)self->_clientConfiguration isDeviceInCarDNDMode])
                {
                  uint64_t ForcedInterstitialStyle = 5;
                }
                else if (AFPlaybackRouteIsHandsFree(self->_playbackRoute))
                {
                  uint64_t ForcedInterstitialStyle = 2;
                }
                else
                {
                  uint64_t ForcedInterstitialStyle = 1;
                }
              }
            }
            int v8 = AFSiriLogContextConnection;
            if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              id v13 = "-[AFConnection _beginInterstitialsForReason:]";
              __int16 v14 = 2114;
              id v15 = v4;
              _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@", buf, 0x16u);
            }
            uint64_t v9 = [[AFInterstitialProvider alloc] initWithStyle:ForcedInterstitialStyle recordRoute:self->_recordRoute isVoiceTrigger:(self->_activeRequestSpeechEvent < 0x20uLL) & (0x80018900 >> self->_activeRequestSpeechEvent) isDucking:self->_activeRequestIsDucking isTwoShot:self->_activeRequestIsTwoShot speechEndHostTime:self->_activeRequestSpeechEndHostTime context:self->_activeRequestUUID preferences:self->_preferences delegate:self];
            interstitialProvider = self->_interstitialProvider;
            self->_interstitialProvider = v9;
          }
        }
      }
    }
  }
}

- (void)_enqueueInterstitialCommand:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 136315394;
    int v10 = "-[AFConnection _enqueueInterstitialCommand:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s command = %@", (uint8_t *)&v9, 0x16u);
  }
  interstitialCommandQueue = self->_interstitialCommandQueue;
  if (!interstitialCommandQueue)
  {
    __int16 v7 = objc_alloc_init(AFQueue);
    int v8 = self->_interstitialCommandQueue;
    self->_interstitialCommandQueue = v7;

    interstitialCommandQueue = self->_interstitialCommandQueue;
  }
  [(AFQueue *)interstitialCommandQueue enqueueObject:v4];
}

- (void)_willPresentUsefulUserResultWithType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a2);
  [(AFConnection *)self _endInterstitialsForReason:v5];
  [(AFConnection *)self _cancelRequestTimeoutForReason:v5];
  if (self->_activeRequestType)
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315650;
      __int16 v11 = "-[AFConnection _willPresentUsefulUserResultWithType:]";
      __int16 v12 = 2048;
      uint64_t v13 = self;
      __int16 v14 = 2048;
      int64_t v15 = a3;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s %p %ld", (uint8_t *)&v10, 0x20u);
    }
    self->_activeRequestUsefulUserResultType = a3;
    if (AFIsInternalInstall_onceToken != -1) {
      dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
    }
    if (AFIsInternalInstall_isInternal)
    {
      if (self->_activeRequestInitialInterstitialBeginTimeInterval > 0.0)
      {
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        double v8 = v7 - self->_activeRequestInitialInterstitialBeginTimeInterval;
        if (v8 < 0.5)
        {
          int v9 = AFSiriLogContextConnection;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
          {
            int v10 = 136315394;
            __int16 v11 = "-[AFConnection _willPresentUsefulUserResultWithType:]";
            __int16 v12 = 2048;
            uint64_t v13 = *(AFConnection **)&v8;
            _os_log_error_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_ERROR, "%s Initial interstitial fired %f seconds right before UUFR!", (uint8_t *)&v10, 0x16u);
          }
          [(AFConnection *)self reportIssueForType:@"Interstitial" subtype:@"Near Fire before UUFR" context:0];
        }
      }
    }
  }
  else
  {
    self->_activeRequestUsefulUserResultType = 0;
  }
}

- (void)_willCompleteRequest
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_activeRequestType = &self->_activeRequestType;
  if (self->_activeRequestType)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      activeRequestUUID = self->_activeRequestUUID;
      *(_DWORD *)buf = 136315650;
      id v22 = "-[AFConnection _willCompleteRequest]";
      __int16 v23 = 2048;
      __int16 v24 = self;
      __int16 v25 = 2112;
      __int16 v26 = activeRequestUUID;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
    }
    double v7 = NSStringFromSelector(a2);
    [(AFConnection *)self _endInterstitialsForReason:v7];

    int64_t *p_activeRequestType = 0;
    p_activeRequestType[1] = 0;
    analytics = self->_analytics;
    int v9 = self->_activeRequestUUID;
    if (v9)
    {
      int v10 = [(NSUUID *)v9 UUIDString];
      id v20 = v10;
      __int16 v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      [(AFAnalytics *)analytics logEventWithType:1914 context:v11];
    }
    else
    {
      [(AFAnalytics *)self->_analytics logEventWithType:1914 context:0];
    }
    +[AFAggregator logSiriRequestSucceeded];
    __int16 v12 = [(AFConnection *)self _clientService];
    [v12 recordAWDSuccessMetrics];

    uint64_t v13 = +[AFDeviceRingerSwitchObserver sharedObserver];
    [v13 removeListener:self];

    __int16 v14 = +[AFAccessibilityObserver sharedObserver];
    [v14 removeListener:self];

    int64_t v15 = [(AFConnection *)self _siriClientStateManager];
    [v15 endRequestWithUUID:self->_activeRequestUUID forClient:self->_clientID];

    _LogUEIRequestCategorization(self->_activeTurnIdentifier, 3, self->_activeRequestTypeForRequestCategorization);
    activeTurnIdentifier = self->_activeTurnIdentifier;
    self->_activeTurnIdentifier = 0;

    self->_activeRequestTypeForRequestCategorization = 0;
    if (AFIsHorseman_onceToken != -1) {
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
    }
    if (AFIsHorseman_isHorseman) {
      goto LABEL_13;
    }
    if (AFIsPad_onceToken != -1) {
      dispatch_once(&AFIsPad_onceToken, &__block_literal_global_208);
    }
    if (AFIsPad_isPad)
    {
LABEL_13:
      __int16 v17 = [(AFConnection *)self _clientService];
      [v17 emitHomeMetricInvocationEvent];
    }
    *(_WORD *)&self->_activeRequestHasSpeechRecognition = 0;
    self->_activeRequestIsTwoShot = 0;
    self->_int64_t activeRequestActivationEvent = 0;
    self->_int64_t activeRequestSpeechEvent = 0;
    *(_OWORD *)&self->_activeRequestBeginTime = 0u;
    *(_OWORD *)&self->_activeRequestNumberOfPresentedInterstitials = 0u;
    *(_OWORD *)&self->_activeRequestStartSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestStopSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestSpeechRecognitionTimeInterval = 0u;
    id v18 = self->_activeRequestUUID;
    self->_activeRequestUUID = 0;
  }
}

- (void)_willFailRequestWithError:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v6 = (AFConnection *)a3;
  if (!self->_activeRequestType) {
    goto LABEL_46;
  }
  double v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    activeRequestUUID = self->_activeRequestUUID;
    activeTurnIdentifier = self->_activeTurnIdentifier;
    *(_DWORD *)buf = 136316162;
    v58 = "-[AFConnection _willFailRequestWithError:]";
    __int16 v59 = 2048;
    v60 = self;
    __int16 v61 = 2112;
    v62 = activeRequestUUID;
    __int16 v63 = 2112;
    v64 = activeTurnIdentifier;
    __int16 v65 = 2112;
    v66 = v6;
    _os_log_error_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_ERROR, "%s %p activeRequestUUID = %@ turnId = %@ %@", buf, 0x34u);
  }
  double v8 = NSStringFromSelector(a2);
  [(AFConnection *)self _endInterstitialsForReason:v8];

  self->_activeRequestType = 0;
  self->_activeRequestUsefulUserResultType = 0;
  int v9 = [(AFConnection *)v6 domain];
  char v10 = [v9 isEqualToString:@"kAFAssistantErrorDomain"];

  if ((v10 & 1) == 0)
  {
    __int16 v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v58 = "-[AFConnection _willFailRequestWithError:]";
      __int16 v59 = 2112;
      v60 = v6;
      _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s Wrapping up non-siri error in generic error %@", buf, 0x16u);
    }
    uint64_t v12 = +[AFError errorWithCode:0 description:0 underlyingError:v6];

    id v6 = (AFConnection *)v12;
  }
  v52[4] = self;
  id v53 = 0;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __42__AFConnection__willFailRequestWithError___block_invoke_2;
  v52[3] = &unk_1E5924760;
  int v13 = AFErrorSetUnderlyingError(v6, &v53, &__block_literal_global_262, v52);
  id v14 = v53;
  if (v13)
  {
    int64_t v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v58 = "-[AFConnection _willFailRequestWithError:]";
      __int16 v59 = 2112;
      v60 = v6;
      _os_log_impl(&dword_19CF1D000, v15, OS_LOG_TYPE_INFO, "%s Appending additional details to error %@", buf, 0x16u);
    }
    uint64_t v16 = (AFConnection *)v14;

    id v6 = v16;
  }
  v51 = v14;
  __int16 v17 = self->_activeRequestUUID;
  if (v17)
  {
    v54 = @"id";
    id v3 = [(NSUUID *)v17 UUIDString];
    v55 = v3;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  }
  else
  {
    id v18 = (void *)MEMORY[0x1E4F1CC08];
  }
  v56[0] = v18;
  uint64_t v19 = AFAnalyticsContextCreateWithError(v6);
  v56[1] = v19;
  id v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
  id v21 = AFAnalyticsContextsMerge(v20);

  if (v17)
  {
  }
  [(AFAnalytics *)self->_analytics logEventWithType:1913 context:v21];
  id v22 = self->_activeRequestUUID;
  __int16 v23 = self->_activeTurnIdentifier;
  __int16 v24 = self->_analytics;
  __int16 v25 = v22;
  __int16 v26 = v23;
  id v6 = v6;
  if (!v6)
  {
    uint64_t v27 = AFSiriLogContextConnection;
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)buf = 136315650;
    v58 = "_EmitPNRFatalError";
    __int16 v59 = 2112;
    v60 = (AFConnection *)v25;
    __int16 v61 = 2112;
    v62 = v26;
    __int16 v37 = "%s error is nil. Instrumentation logging is skipped. requestUUID = %@ turnId = %@";
LABEL_48:
    _os_log_error_impl(&dword_19CF1D000, v27, OS_LOG_TYPE_ERROR, v37, buf, 0x20u);
    goto LABEL_29;
  }
  uint64_t v27 = AFSiriLogContextConnection;
  if (v26)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v58 = "_EmitPNRFatalError";
      __int16 v59 = 2112;
      v60 = (AFConnection *)v25;
      __int16 v61 = 2112;
      v62 = v26;
      __int16 v63 = 2112;
      v64 = (NSUUID *)v6;
      _os_log_impl(&dword_19CF1D000, v27, OS_LOG_TYPE_INFO, "%s Logging instrumentation for requestUUID = %@ turnId = %@ error = %@", buf, 0x2Au);
    }
    id v28 = objc_alloc_init(MEMORY[0x1E4FA12E0]);
    uint64_t v29 = _PNRFatalErrorInfo(v6);
    [v28 setError:v29];

    id v30 = [(AFConnection *)v6 userInfo];
    uint64_t v31 = *MEMORY[0x1E4F28A50];
    unsigned int v32 = [v30 objectForKey:*MEMORY[0x1E4F28A50]];

    if (v32)
    {
      uint64_t v33 = _PNRFatalErrorInfo(v32);
      [v28 setUnderlyingError:v33];

      id v34 = [v32 userInfo];
      __int16 v35 = [v34 objectForKey:v31];

      if (v35)
      {
        id v36 = _PNRFatalErrorInfo(v35);
        [v28 setUnderUnderlyingError:v36];
      }
    }
    [(AFAnalytics *)v24 logInstrumentation:v28 machAbsoluteTime:mach_absolute_time() turnIdentifier:v26];

    goto LABEL_29;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v58 = "_EmitPNRFatalError";
    __int16 v59 = 2112;
    v60 = (AFConnection *)v25;
    __int16 v61 = 2112;
    v62 = (NSUUID *)v6;
    __int16 v37 = "%s turnId is nil. Instrumentation logging is skipped. requestUUID = %@ error = %@";
    goto LABEL_48;
  }
LABEL_29:

  +[AFAggregator logSiriRequestFailedWithError:v6];
  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal)
  {
    id v38 = [(AFConnection *)self _clientService];
    unint64_t activeRequestSpeechEvent = self->_activeRequestSpeechEvent;
    if (activeRequestSpeechEvent > 0x24) {
      id v40 = @"Unknown";
    }
    else {
      id v40 = off_1E5925980[activeRequestSpeechEvent];
    }
    __int16 v41 = v40;
    [v38 reportIssueForError:v6 type:1913 subtype:v41 context:v21];
  }
  if (!_AFConnectionIsErrorDeallocation(v6))
  {
    double v42 = +[AFDeviceRingerSwitchObserver sharedObserver];
    [v42 removeListener:self];

    __int16 v43 = +[AFAccessibilityObserver sharedObserver];
    [v43 removeListener:self];

    id v44 = [(AFConnection *)self _siriClientStateManager];
    [v44 endRequestWithUUID:self->_activeRequestUUID forClient:self->_clientID];
  }
  _LogUEIRequestCategorization(self->_activeTurnIdentifier, 2, self->_activeRequestTypeForRequestCategorization);
  uint64_t v45 = self->_activeTurnIdentifier;
  self->_activeTurnIdentifier = 0;

  self->_activeRequestTypeForRequestCategorization = 0;
  if (AFIsHorseman_onceToken != -1) {
    dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
  }
  if (AFIsHorseman_isHorseman) {
    goto LABEL_44;
  }
  if (AFIsPad_onceToken != -1) {
    dispatch_once(&AFIsPad_onceToken, &__block_literal_global_208);
  }
  if (AFIsPad_isPad)
  {
LABEL_44:
    __int16 v46 = [(AFConnection *)self _clientService];
    [v46 emitHomeMetricInvocationEvent];
  }
  *(_WORD *)&self->_activeRequestHasSpeechRecognition = 0;
  self->_activeRequestIsTwoShot = 0;
  self->_int64_t activeRequestActivationEvent = 0;
  self->_unint64_t activeRequestSpeechEvent = 0;
  *(_OWORD *)&self->_activeRequestBeginTime = 0u;
  *(_OWORD *)&self->_activeRequestNumberOfPresentedInterstitials = 0u;
  *(_OWORD *)&self->_activeRequestStartSpeechTimeAPICalled = 0u;
  *(_OWORD *)&self->_activeRequestStopSpeechTimeAPICalled = 0u;
  *(_OWORD *)&self->_activeRequestSpeechRecognitionTimeInterval = 0u;
  v47 = self->_activeRequestUUID;
  self->_activeRequestUUID = 0;

  uint64_t v48 = self->_activeTurnIdentifier;
  self->_activeTurnIdentifier = 0;

LABEL_46:
}

id __42__AFConnection__willFailRequestWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = _AFConnectionGetBucketStringFromTimeIntervals(*(double *)(*(void *)(a1 + 32) + 152), *(double *)(*(void *)(a1 + 32) + 168));
  id v3 = *(double **)(a1 + 32);
  double v4 = v3[18];
  if (v4 == 0.0) {
    double v4 = v3[19];
  }
  double v5 = v3[20];
  if (v5 == 0.0) {
    double v5 = v3[21];
  }
  id v6 = _AFConnectionGetBucketStringFromTimeIntervals(v4, v5);
  if ([v2 isEqualToString:v6]) {
    id v7 = v2;
  }
  else {
    id v7 = (id)[[NSString alloc] initWithFormat:@"%@,%@", v2, v6];
  }
  double v8 = v7;
  int v9 = (void *)MEMORY[0x1E4F28C58];
  char v10 = (void *)[[NSString alloc] initWithFormat:@"SpeechErrorHints[StartStopSpeechDelta:%@]", v7];
  __int16 v11 = [v9 errorWithDomain:v10 code:0 userInfo:0];

  return v11;
}

BOOL __42__AFConnection__willFailRequestWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 domain];
  int v4 = [v3 isEqualToString:@"SiriSpeechErrorDomain"];

  if (!v4)
  {
    id v7 = [v2 domain];
    int v8 = [v7 isEqualToString:@"kAFAssistantErrorDomain"];

    if (v8)
    {
      BOOL v6 = [v2 code] == 211;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
    goto LABEL_9;
  }
  uint64_t v5 = [v2 code];
  if (v5 != 1 && v5 != 201 && v5 != 102) {
    goto LABEL_8;
  }
  BOOL v6 = 1;
LABEL_9:

  return v6;
}

- (void)_willCancelRequest
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_activeRequestType = &self->_activeRequestType;
  if (self->_activeRequestType)
  {
    uint64_t v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      activeRequestUUID = self->_activeRequestUUID;
      *(_DWORD *)buf = 136315650;
      id v20 = "-[AFConnection _willCancelRequest]";
      __int16 v21 = 2048;
      id v22 = self;
      __int16 v23 = 2112;
      __int16 v24 = activeRequestUUID;
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s %p %@", buf, 0x20u);
    }
    id v7 = NSStringFromSelector(a2);
    [(AFConnection *)self _endInterstitialsForReason:v7];

    int64_t *p_activeRequestType = 0;
    p_activeRequestType[1] = 0;
    analytics = self->_analytics;
    int v9 = self->_activeRequestUUID;
    if (v9)
    {
      char v10 = [(NSUUID *)v9 UUIDString];
      id v18 = v10;
      __int16 v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      [(AFAnalytics *)analytics logEventWithType:1912 context:v11];
    }
    else
    {
      [(AFAnalytics *)self->_analytics logEventWithType:1912 context:0];
    }
    +[AFAggregator logSiriRequestCancelled];
    uint64_t v12 = +[AFDeviceRingerSwitchObserver sharedObserver];
    [v12 removeListener:self];

    int v13 = +[AFAccessibilityObserver sharedObserver];
    [v13 removeListener:self];

    id v14 = [(AFConnection *)self _siriClientStateManager];
    [v14 endRequestWithUUID:self->_activeRequestUUID forClient:self->_clientID];

    _LogUEIRequestCategorization(self->_activeTurnIdentifier, 1, self->_activeRequestTypeForRequestCategorization);
    activeTurnIdentifier = self->_activeTurnIdentifier;
    self->_activeTurnIdentifier = 0;

    self->_int64_t activeRequestActivationEvent = 0;
    self->_unint64_t activeRequestSpeechEvent = 0;
    *(int64_t *)((char *)&self->_activeRequestSpeechEvent + 7) = 0;
    *(_OWORD *)&self->_activeRequestBeginTime = 0u;
    *(_OWORD *)&self->_activeRequestNumberOfPresentedInterstitials = 0u;
    *(_OWORD *)&self->_activeRequestStartSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestStopSpeechTimeAPICalled = 0u;
    *(_OWORD *)&self->_activeRequestSpeechRecognitionTimeInterval = 0u;
    uint64_t v16 = self->_activeRequestUUID;
    self->_activeRequestUUID = 0;
  }
}

- (void)_willEndSession
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315394;
    BOOL v6 = "-[AFConnection _willEndSession]";
    __int16 v7 = 2048;
    int v8 = self;
    _os_log_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v5, 0x16u);
  }
  if (self->_activeRequestUsefulUserResultType == 2) {
    [(AFConnection *)self _willCompleteRequest];
  }
  else {
    [(AFConnection *)self _willCancelRequest];
  }
  int v4 = [(AFConnection *)self _siriClientStateManager];
  [v4 endSessionForClient:self->_clientID];
}

- (void)_willStartRequestWithSpeech:(BOOL)a3 speechRequestOptions:(id)a4 requestInfo:(id)a5 analyticsEventProvider:(id)a6
{
  BOOL v79 = a3;
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v82 = a4;
  id v9 = a5;
  v78 = (uint64_t (**)(id, id))a6;
  v77 = self->_activeRequestUUID;
  v81 = v9;
  char v10 = [v9 startRequest];
  if (v10)
  {
    __int16 v11 = [v81 startRequest];
    uint64_t v12 = [v11 aceId];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F29128]);
      int64_t v15 = [v81 startRequest];
      uint64_t v16 = [v15 aceId];
LABEL_7:
      __int16 v21 = (void *)v16;
      id v22 = (void *)[v14 initWithUUIDString:v16];

      goto LABEL_9;
    }
  }
  uint64_t v17 = [v81 startLocalRequest];
  if (v17)
  {
    id v18 = [v81 startLocalRequest];
    uint64_t v19 = [v18 aceId];
    uint64_t v20 = [v19 length];

    if (v20)
    {
      id v14 = objc_alloc(MEMORY[0x1E4F29128]);
      int64_t v15 = [v81 startLocalRequest];
      uint64_t v16 = [v15 aceId];
      goto LABEL_7;
    }
  }
  id v22 = 0;
LABEL_9:
  __int16 v23 = [v82 intuitiveConversationRequestId];

  if (v23)
  {
    __int16 v24 = [v82 intuitiveConversationRequestId];

    uint64_t v25 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      __int16 v26 = v25;
      uint64_t v27 = [v24 UUIDString];
      *(_DWORD *)buf = 136315394;
      v92 = "-[AFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
      __int16 v93 = 2112;
      v94 = v27;
      _os_log_impl(&dword_19CF1D000, v26, OS_LOG_TYPE_INFO, "%s Setting IntuitiveConversationRequestId = %@ from AFSpeechRequestOptions", buf, 0x16u);
    }
  }
  else
  {
    __int16 v24 = v22;
  }
  id obj = v24;
  if (!v24)
  {
    id obj = [MEMORY[0x1E4F29128] UUID];
  }
  id v28 = [(AFConnection *)self _siriClientStateManager];
  [v28 beginRequestWithUUID:obj forClient:self->_clientID];

  [(AFConnection *)self _willCancelRequest];
  [(AFConnection *)self _completeRequestWithUUID:v77 forReason:1 error:0];
  uint64_t v29 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    v92 = "-[AFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
    __int16 v93 = 2048;
    v94 = self;
    __int16 v95 = 2112;
    id v96 = obj;
    __int16 v97 = 1024;
    BOOL v98 = v79;
    __int16 v99 = 2112;
    id v100 = v82;
    _os_log_impl(&dword_19CF1D000, v29, OS_LOG_TYPE_INFO, "%s %p %@ %d (%@)", buf, 0x30u);
  }
  id v30 = [MEMORY[0x1E4F28F80] processInfo];
  [v30 systemUptime];
  double v32 = v31;

  if (v78 && (id v34 = (void *)v78[2](v78, obj)) != 0)
  {
    int v35 = v33;
  }
  else
  {
    v88[0] = @"isSpeechRequest";
    id v36 = [MEMORY[0x1E4F28ED0] numberWithBool:v79];
    v89[0] = v36;
    v88[1] = @"id";
    __int16 v37 = [obj UUIDString];
    v89[1] = v37;
    v88[2] = @"unixTime";
    id v38 = (void *)MEMORY[0x1E4F28ED0];
    __int16 v39 = [MEMORY[0x1E4F1C9C8] date];
    [v39 timeIntervalSince1970];
    id v40 = objc_msgSend(v38, "numberWithDouble:");
    v89[2] = v40;
    v88[3] = @"systemVersion";
    __int16 v41 = AFProductAndBuildVersion();
    v89[3] = v41;
    double v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v89 forKeys:v88 count:4];
    v90[0] = v42;
    __int16 v43 = [(AFConnection *)self _startRequestMetricSettings];
    v90[1] = v43;
    id v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v90 count:2];
    uint64_t v45 = AFAnalyticsContextsMerge(v44);

    if (AFIsInternalInstall_onceToken != -1) {
      dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
    }
    if (AFIsInternalInstall_isInternal)
    {
      v87[0] = v45;
      __int16 v46 = AFAnalyticsTurnContextCreateWithRequestInfo(v81);
      v87[1] = v46;
      v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v87 count:2];
      uint64_t v48 = AFAnalyticsContextsMerge(v47);

      uint64_t v45 = (void *)v48;
    }
    id v34 = AFAnalyticsEventCreateCurrent(1901, v45);

    int v35 = 3;
  }
  [(AFAnalytics *)self->_analytics logEvent:v34];
  if (v79) {
    v49 = v82;
  }
  else {
    v49 = v81;
  }
  v50 = [v49 turnIdentifier];
  objc_storeStrong((id *)&self->_activeTurnIdentifier, v50);
  v51 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v92 = "-[AFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
    _os_log_debug_impl(&dword_19CF1D000, v51, OS_LOG_TYPE_DEBUG, "%s Logging TurnMTE From _willStartRequestWithSpeech", buf, 0xCu);
  }
  id v52 = obj;
  if (v50)
  {
    id v53 = (objc_class *)MEMORY[0x1E4FA1378];
    id v54 = v50;
    v55 = (void *)[[v53 alloc] initWithNSUUID:v52];
    id v56 = objc_alloc_init(MEMORY[0x1E4FA1328]);
    [v56 setMteRequestId:v55];

    v57 = +[AFAnalytics sharedAnalytics];
    [v57 logInstrumentation:v56 machAbsoluteTime:mach_absolute_time() turnIdentifier:v54];
  }
  if ([(AFConnection *)self _shouldEmitUEIRequestLinkForRequestInfo:v81 speechRequestOptions:v82])
  {
    v58 = (id)AFSiriLogContextConnection;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      __int16 v59 = [v50 UUIDString];
      v60 = [v52 UUIDString];
      *(_DWORD *)buf = 136315650;
      v92 = "-[AFConnection _willStartRequestWithSpeech:speechRequestOptions:requestInfo:analyticsEventProvider:]";
      __int16 v93 = 2112;
      v94 = v59;
      __int16 v95 = 2112;
      id v96 = v60;
      _os_log_impl(&dword_19CF1D000, v58, OS_LOG_TYPE_INFO, "%s Emitting Request link message between turnID: %@ and RequestID: %@", buf, 0x20u);
    }
    __int16 v61 = [v52 UUIDString];
    id v62 = [v50 UUIDString];
    __int16 v63 = ADCreateRequestLinkInfo(v61, 1);
    v64 = ADCreateRequestLinkInfo(v62, 2);

    ADEmitRequestLinkEventMessage(v63, v64);
  }
  objc_storeStrong((id *)&self->_activeRequestUUID, obj);
  int64_t v65 = 1;
  if (!v79) {
    int64_t v65 = 2;
  }
  self->_activeRequestType = v65;
  self->_unint64_t activeRequestSpeechEvent = [v82 activationEvent];
  self->_int64_t activeRequestActivationEvent = [v81 activationEvent];
  self->_activeRequestBeginTime = v32;
  self->_activeRequestTypeForRequestCategorization = v35;
  if (!v79)
  {
    self->_activeRequestStartSpeechTimeRequested = 0.0;
    self->_activeRequestStartSpeechTimeAPICalled = 0.0;
    goto LABEL_48;
  }
  self->_activeRequestStartSpeechTimeAPICalled = v32;
  if (!v82) {
    goto LABEL_48;
  }
  [v82 activationEventTime];
  if (v66 <= 0.0)
  {
    if (![v82 activationEventMachAbsoluteTime]) {
      goto LABEL_48;
    }
    unint64_t v68 = [v82 activationEventMachAbsoluteTime];
    if (_AFMachAbsoluteTimeRate_onceToken != -1) {
      dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
    }
    double v67 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v68 / 1000000000.0;
  }
  else
  {
    [v82 activationEventTime];
  }
  self->_activeRequestStartSpeechTimeRequested = v67;
LABEL_48:
  self->_activeRequestUsefulUserResultType = 0;
  *(_WORD *)&self->_activeRequestIsDucking = 0;
  self->_activeRequestSpeechEndHostTime = 0;
  self->_activeRequestNumberOfPresentedInterstitials = 0;
  *(_OWORD *)&self->_activeRequestStopSpeechTimeRequested = 0u;
  *(_OWORD *)&self->_activeRequestSpeechRecordingEndTimeInterval = 0u;
  self->_activeRequestInitialInterstitialBeginTimeInterval = 0.0;
  lastRetryError = self->_lastRetryError;
  self->_lastRetryError = 0;

  self->_os_signpost_id_t uufrID = 0;
  [(AFConnection *)self _updateClientConfiguration];
  _EmitHomePodLaunchContextTime(self->_analytics, self->_activeRequestUUID, self->_activeTurnIdentifier, v82);
  if (v79)
  {
    +[AFAggregator logSiriSpeechRequestStarted];
  }
  else
  {
    +[AFAggregator logSiriOtherRequestStarted];
    [(AFConnection *)self _updateStateIfNotInSync];
  }
  if (AFSupportsSCDAFramework_onceToken != -1) {
    dispatch_once(&AFSupportsSCDAFramework_onceToken, &__block_literal_global_226);
  }
  if (!AFSupportsSCDAFramework_scdaFrameworkEnabled)
  {
    v70 = +[AFMyriadCoordinator currentCoordinator];
    v71 = v70;
    if (v70) {
      goto LABEL_55;
    }
    v72 = [MEMORY[0x1E4F28C40] defaultCenter];
    v83 = @"requestId";
    v73 = [v52 UUIDString];
    v84 = v73;
    v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v84 forKeys:&v83 count:1];
    [v72 postNotificationName:@"RequestIdForMyriad" object:0 userInfo:v74 deliverImmediately:1];
LABEL_60:

    v71 = 0;
    goto LABEL_61;
  }
  v70 = [MEMORY[0x1E4F9FAE0] currentCoordinator];
  v71 = v70;
  if (!v70)
  {
    v72 = [MEMORY[0x1E4F28C40] defaultCenter];
    v85 = @"requestId";
    v73 = [v52 UUIDString];
    v86 = v73;
    v74 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v86 forKeys:&v85 count:1];
    [v72 postNotificationName:@"RequestIdForMyriad" object:0 userInfo:v74 deliverImmediately:1];
    goto LABEL_60;
  }
LABEL_55:
  [v70 setCurrentRequestId:v52];
LABEL_61:

  v75 = +[AFAccessibilityObserver sharedObserver];
  [v75 addListener:self];

  v76 = +[AFDeviceRingerSwitchObserver sharedObserver];
  [v76 addListener:self];
}

- (BOOL)_shouldEmitUEIRequestLinkForRequestInfo:(id)a3 speechRequestOptions:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 activationEvent];
  uint64_t v7 = [v5 activationEvent];

  return v6 == 6 || (unint64_t)(v6 - 9) < 2 || v7 == 17;
}

- (void)_updateClientConfiguration
{
  if ((*((unsigned char *)self + 272) & 1) == 0)
  {
    id v3 = [(AFConnection *)self _clientService];
    int v4 = [(AFConnection *)self _clientConfiguration];
    [v3 setConfiguration:v4];

    *((unsigned char *)self + 272) |= 1u;
  }
}

- (void)_updateState
{
  id v3 = [(AFConnection *)self _clientService];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__AFConnection__updateState__block_invoke;
  v4[3] = &unk_1E5924718;
  v4[4] = self;
  [v3 requestStateUpdateWithReply:v4];
}

void __28__AFConnection__updateState__block_invoke(uint64_t a1, char a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(NSObject **)(v3 + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__AFConnection__updateState__block_invoke_2;
  v5[3] = &unk_1E5929898;
  v5[4] = v3;
  char v7 = a2;
  int v6 = a3;
  dispatch_async(v4, v5);
}

uint64_t __28__AFConnection__updateState__block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 216) |= 1u;
  id v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 44);
    id v5 = v2;
    int v6 = [v3 numberWithBool:v4];
    int v13 = 136315394;
    id v14 = "-[AFConnection _updateState]_block_invoke_2";
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Updated internal state. ShouldSpeak %@", (uint8_t *)&v13, 0x16u);
  }
  [*(id *)(a1 + 32) _setShouldSpeak:*(unsigned __int8 *)(a1 + 44)];
  char v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v9 = *(unsigned int *)(a1 + 40);
    char v10 = v7;
    __int16 v11 = [v8 numberWithUnsignedInt:v9];
    int v13 = 136315394;
    id v14 = "-[AFConnection _updateState]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v11;
    _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s Updated internal state. AudioSessionID %@", (uint8_t *)&v13, 0x16u);
  }
  return [*(id *)(a1 + 32) _setAudioSessionID:*(unsigned int *)(a1 + 40)];
}

- (void)_fetchShouldSpeak:(id)a3
{
  id v4 = a3;
  id v5 = [(AFConnection *)self _clientService];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__AFConnection__fetchShouldSpeak___block_invoke;
  v7[3] = &unk_1E592A6F8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 requestShouldSpeakStateWithReply:v7];
}

void __34__AFConnection__fetchShouldSpeak___block_invoke(uint64_t a1, char a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AFConnection__fetchShouldSpeak___block_invoke_2;
  block[3] = &unk_1E592B670;
  char v6 = a2;
  block[4] = v2;
  id v5 = *(id *)(a1 + 40);
  dispatch_async(v3, block);
}

uint64_t __34__AFConnection__fetchShouldSpeak___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    id v5 = v2;
    char v6 = [v3 numberWithBool:v4];
    int v8 = 136315394;
    uint64_t v9 = "-[AFConnection _fetchShouldSpeak:]_block_invoke_2";
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Updated internal state. ShouldSpeak %@", (uint8_t *)&v8, 0x16u);
  }
  [*(id *)(a1 + 32) _setShouldSpeak:*(unsigned __int8 *)(a1 + 48)];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)_updateStateIfNotInSync
{
  if ((*((unsigned char *)self + 216) & 1) == 0) {
    [(AFConnection *)self _updateState];
  }
}

- (void)_extendExpiringRequestTimeout
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(AFWatchdogTimer *)self->_requestTimeoutTimer timeRemaining];
  double v4 = v3;
  if (self->_requestTimeoutTimer) {
    BOOL v5 = v3 < 4.0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    char v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      int v8 = "-[AFConnection _extendExpiringRequestTimeout]";
      __int16 v9 = 2048;
      double v10 = v4;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEFAULT, "%s Extending timeout with time remaining %.2f", (uint8_t *)&v7, 0x16u);
    }
    [(AFConnection *)self _extendRequestTimeoutForReason:@"ExtendOnlyIfExpiring" durationInSeconds:4.0];
  }
}

- (void)_extendExistingRequestTimeoutForReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    int v7 = "-[AFConnection _extendExistingRequestTimeoutForReason:]";
    __int16 v8 = 2114;
    id v9 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  if (self->_requestTimeoutTimer) {
    [(AFConnection *)self _extendRequestTimeoutForReason:v4 durationInSeconds:0.0];
  }
}

- (void)_extendRequestTimeoutForReason:(id)a3 durationInSeconds:(double)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[AFConnection _extendRequestTimeoutForReason:durationInSeconds:]";
    __int16 v10 = 2114;
    id v11 = v6;
    __int16 v12 = 2050;
    double v13 = a4;
    _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@, durationInSeconds: %{public}f", (uint8_t *)&v8, 0x20u);
  }
  [(AFConnection *)self _cancelRequestTimeoutForReason:v6];
  if (self->_activeRequestType && !self->_activeRequestUsefulUserResultType) {
    [(AFConnection *)self _scheduleRequestTimeoutForReason:v6 durationInSeconds:a4];
  }
}

- (void)_cancelRequestTimeoutForReason:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (requestTimeoutTimer)
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      id v9 = "-[AFConnection _cancelRequestTimeoutForReason:]";
      __int16 v10 = 2114;
      id v11 = v4;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEFAULT, "%s Canceling request timeout for reason %{public}@", (uint8_t *)&v8, 0x16u);
      requestTimeoutTimer = self->_requestTimeoutTimer;
    }
    [(AFWatchdogTimer *)requestTimeoutTimer cancel];
    int v7 = self->_requestTimeoutTimer;
    self->_requestTimeoutTimer = 0;
  }
}

- (void)_resumeRequestTimeoutForReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (requestTimeoutTimer)
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      int v8 = "-[AFConnection _resumeRequestTimeoutForReason:]";
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEFAULT, "%s Resuming request timeout for reason %{public}@", (uint8_t *)&v7, 0x16u);
      requestTimeoutTimer = self->_requestTimeoutTimer;
    }
    [(AFWatchdogTimer *)requestTimeoutTimer start];
  }
}

- (void)_pauseRequestTimeoutForReason:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  requestTimeoutTimer = self->_requestTimeoutTimer;
  if (requestTimeoutTimer)
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      int v8 = "-[AFConnection _pauseRequestTimeoutForReason:]";
      __int16 v9 = 2114;
      id v10 = v4;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEFAULT, "%s Pausing request timeout for reason %{public}@", (uint8_t *)&v7, 0x16u);
      requestTimeoutTimer = self->_requestTimeoutTimer;
    }
    [(AFWatchdogTimer *)requestTimeoutTimer stop];
  }
}

- (void)_invokeRequestTimeoutForReason:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[AFConnection _invokeRequestTimeoutForReason:]";
    __int16 v13 = 2114;
    id v14 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEFAULT, "%s Invoking request timeout for reason %{public}@", (uint8_t *)&v11, 0x16u);
  }
  [(AFConnection *)self _cancelRequestTimeoutForReason:v4];
  if (self->_connectionHadActiveNetwork
    || AFDeviceSupportsSiriUOD()
    && (+[AFConnection currentLanguageCode],
        int v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = +[AFFeatureFlags isSiriUODAvailableForLanguage:v7], v7, v8))
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 52;
  }
  __int16 v9 = +[AFError errorWithCode:v6 description:0 underlyingError:self->_lastRetryError];
  id v10 = [(AFConnection *)self _clientService];
  [v10 cancelRequestForReason:4 withError:v9];

  [(AFConnection *)self _completeRequestWithUUID:self->_activeRequestUUID forReason:3 error:v9];
}

- (void)_startRequestTimeoutTimerWithTimeInterval:(double)a3 reason:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  BOOL v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v20 = "-[AFConnection _startRequestTimeoutTimerWithTimeInterval:reason:]";
    __int16 v21 = 2048;
    double v22 = a3;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEFAULT, "%s Scheduling request timeout for %f seconds for reason %{public}@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  __int16 v9 = [AFWatchdogTimer alloc];
  targetQueue = self->_targetQueue;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __65__AFConnection__startRequestTimeoutTimerWithTimeInterval_reason___block_invoke;
  uint64_t v17 = &unk_1E5929BD0;
  objc_copyWeak(v18, (id *)buf);
  v18[1] = (id)a2;
  uint64_t v11 = [(AFWatchdogTimer *)v9 initWithTimeoutInterval:targetQueue onQueue:&v14 timeoutHandler:a3];
  requestTimeoutTimer = self->_requestTimeoutTimer;
  p_requestTimeoutTimer = (id *)&self->_requestTimeoutTimer;
  id *p_requestTimeoutTimer = (id)v11;

  objc_msgSend(*p_requestTimeoutTimer, "start", v14, v15, v16, v17);
  objc_destroyWeak(v18);
  objc_destroyWeak((id *)buf);
}

void __65__AFConnection__startRequestTimeoutTimerWithTimeInterval_reason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = NSStringFromSelector(*(SEL *)(a1 + 40));
  [WeakRetained _invokeRequestTimeoutForReason:v2];
}

- (void)_scheduleRequestTimeoutForReason:(id)a3 durationInSeconds:(double)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(AFConnection *)self _cancelRequestTimeoutForReason:v6];
  if (!self->_requestTimeoutTimer)
  {
    if (a4 == 0.0)
    {
      id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.assistant"];
      [v7 doubleForKey:@"defaultTimeout"];
      if (v8 == 0.0)
      {
        a4 = 12.0;
      }
      else
      {
        a4 = v8;
        __int16 v9 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
        {
          int v10 = 136315394;
          uint64_t v11 = "-[AFConnection _scheduleRequestTimeoutForReason:durationInSeconds:]";
          __int16 v12 = 2048;
          double v13 = a4;
          _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s Using timeout interval of %f seconds based on UserDefaults", (uint8_t *)&v10, 0x16u);
        }
      }
    }
    [(AFConnection *)self _startRequestTimeoutTimerWithTimeInterval:v6 reason:a4];
  }
}

- (void)requestDidAskForTimeoutExtension:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315394;
    __int16 v9 = "-[AFConnection requestDidAskForTimeoutExtension:]";
    __int16 v10 = 2048;
    double v11 = a3;
    _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s durationInSeconds: %f", (uint8_t *)&v8, 0x16u);
  }
  id v7 = NSStringFromSelector(a2);
  [(AFConnection *)self _extendRequestTimeoutForReason:v7 durationInSeconds:a3];
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    instanceContext = self->_instanceContext;
    if (instanceContext)
    {
      BOOL v5 = instanceContext;
    }
    else
    {
      BOOL v5 = +[AFInstanceContext defaultContext];
    }
    id v6 = v5;
    id v7 = [(AFInstanceContext *)v5 createXPCConnectionWithMachServiceName:@"com.apple.assistant.client" options:0];
    int v8 = self->_connection;
    self->_connection = v7;

    objc_initWeak(&location, self);
    __int16 v9 = self->_targetQueue;
    __int16 v10 = self->_connection;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __27__AFConnection__connection__block_invoke;
    v27[3] = &unk_1E5929FC0;
    double v11 = v9;
    id v28 = v11;
    objc_copyWeak(&v29, &location);
    [(NSXPCConnection *)v10 setInvalidationHandler:v27];
    uint64_t v12 = self->_connection;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __27__AFConnection__connection__block_invoke_229;
    void v24[3] = &unk_1E5929FC0;
    double v13 = v11;
    uint64_t v25 = v13;
    objc_copyWeak(&v26, &location);
    [(NSXPCConnection *)v12 setInterruptionHandler:v24];
    uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v16 = dispatch_queue_create("AFConnection", v15);
    [(NSXPCConnection *)self->_connection _setQueue:v16];
    uint64_t v17 = self->_connection;
    id v18 = AFClientServiceXPCInterface();
    [(NSXPCConnection *)v17 setRemoteObjectInterface:v18];

    uint64_t v19 = self->_connection;
    uint64_t v20 = AFClientServiceDelegateXPCInterface();
    [(NSXPCConnection *)v19 setExportedInterface:v20];

    __int16 v21 = self->_connection;
    double v22 = [[AFConnectionClientServiceDelegate alloc] initWithConnection:self targetQueue:self->_targetQueue];
    [(NSXPCConnection *)v21 setExportedObject:v22];

    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    connection = self->_connection;
  }
  return connection;
}

void __27__AFConnection__connection__block_invoke(uint64_t a1)
{
  int v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__AFConnection__connection__block_invoke_2;
  block[3] = &unk_1E592B978;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __27__AFConnection__connection__block_invoke_229(uint64_t a1)
{
  int v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__AFConnection__connection__block_invoke_2_230;
  block[3] = &unk_1E592B978;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __27__AFConnection__connection__block_invoke_2_230(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    __int16 v9 = "-[AFConnection _connection]_block_invoke_2";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s Connection interrupted", (uint8_t *)&v8, 0xCu);
  }
  id v3 = +[AFError errorWithCode:7];
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _connectionFailedWithError:v3];

  id v6 = objc_loadWeakRetained(v4);
  [v6 _updateState];

  id v7 = objc_loadWeakRetained(v4);
  [v7 _updateClientConfiguration];
}

void __27__AFConnection__connection__block_invoke_2(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    int v8 = "-[AFConnection _connection]_block_invoke_2";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s Connection invalidated", (uint8_t *)&v7, 0xCu);
  }
  id v3 = +[AFError errorWithCode:23];
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _connectionFailedWithError:v3];

  id v6 = objc_loadWeakRetained(v4);
  [v6 _clearConnection];
}

- (void)_clearConnection
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection invalidate];
    id v4 = self->_connection;
    self->_connection = 0;
  }
}

- (void)_connectionFailedWithError:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(AFConnection *)self _siriClientStateManager];
  [v5 beginTransactionForReason:4];

  char v6 = *((unsigned char *)self + 216);
  *((unsigned char *)self + 216) = v6 & 0xFE;
  *((unsigned char *)self + 272) &= ~1u;
  if ((v6 & 4) != 0)
  {
    *((unsigned char *)self + 216) = v6 & 0xFA;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);

    if (WeakRetained)
    {
      int v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        int v11 = 136315138;
        uint64_t v12 = "-[AFConnection _connectionFailedWithError:]";
        _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s Reporting speech error on connection tear down", (uint8_t *)&v11, 0xCu);
      }
      [(AFConnection *)self _tellSpeechDelegateRecordingDidFail:v4];
    }
    if (!_AFConnectionIsErrorDeallocation(v4))
    {
      uint64_t v9 = [(AFConnection *)self _siriClientStateManager];
      [v9 endListeningForClient:self->_clientID];
    }
  }
  [(AFConnection *)self _completeRequestWithUUID:self->_activeRequestUUID forReason:4 error:v4];
  [(AFConnection *)self _stopInputAudioPowerUpdates];
  uint64_t v10 = [(AFConnection *)self _siriClientStateManager];
  [v10 endTransactionForReason:4];
}

- (void)interstitialProvider:(id)a3 handlePhase:(int64_t)a4 displayText:(id)a5 speakableText:(id)a6 expectedDelay:(double)a7 context:(id)a8 completion:(id)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  targetQueue = self->_targetQueue;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __108__AFConnection_interstitialProvider_handlePhase_displayText_speakableText_expectedDelay_context_completion___block_invoke;
  v27[3] = &unk_1E59246F0;
  id v32 = v20;
  int64_t v33 = a4;
  void v27[4] = self;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  double v34 = a7;
  id v31 = v19;
  id v22 = v20;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  dispatch_async(targetQueue, v27);
}

uint64_t __108__AFConnection_interstitialProvider_handlePhase_displayText_speakableText_expectedDelay_context_completion___block_invoke(double *a1)
{
  if (+[AFFeatureFlags isStateFeedbackEnabled])
  {
    uint64_t result = *((void *)a1 + 9);
    if (result)
    {
      id v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  else
  {
    uint64_t v5 = *((void *)a1 + 9);
    uint64_t v4 = *((void *)a1 + 10);
    char v6 = (void *)*((void *)a1 + 4);
    uint64_t v7 = *((void *)a1 + 5);
    uint64_t v8 = *((void *)a1 + 6);
    uint64_t v9 = *((void *)a1 + 7);
    double v10 = a1[11];
    uint64_t v11 = *((void *)a1 + 8);
    return [v6 _handleInterstitialPhase:v4 fromProvider:v7 displayText:v8 speakableText:v9 expectedDelay:v11 context:v5 completion:v10];
  }
  return result;
}

- (void)deviceRingerObserver:(id)a3 didChangeState:(int64_t)a4
{
  targetQueue = self->_targetQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__AFConnection_deviceRingerObserver_didChangeState___block_invoke;
  v5[3] = &unk_1E592B398;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(targetQueue, v5);
}

uint64_t __52__AFConnection_deviceRingerObserver_didChangeState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDeviceRingerSwitchState:*(void *)(a1 + 40)];
}

- (void)accessibilityObserver:(id)a3 stateDidChangeFrom:(id)a4 to:(id)a5
{
  id v6 = a5;
  targetQueue = self->_targetQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__AFConnection_accessibilityObserver_stateDidChangeFrom_to___block_invoke;
  v9[3] = &unk_1E592C710;
  void v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(targetQueue, v9);
}

uint64_t __60__AFConnection_accessibilityObserver_stateDidChangeFrom_to___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAccessibilityState:*(void *)(a1 + 40)];
}

- (void)audioPowerUpdaterDidUpdate:(id)a3 averagePower:(float)a4 peakPower:(float)a5
{
  if (self->_inputAudioPowerUpdater == a3)
  {
    p_speechDelegate = &self->_speechDelegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)p_speechDelegate);
      [v9 assistantConnectionDidChangeAudioRecordingPower:self];
    }
  }
}

- (void)_tellSpeechDelegateRecognitionDidFail:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__AFConnection__tellSpeechDelegateRecognitionDidFail___block_invoke;
  v6[3] = &unk_1E59245D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __54__AFConnection__tellSpeechDelegateRecognitionDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecognitionDidFail:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateSpeechRecognizedPartialResult:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__AFConnection__tellSpeechDelegateSpeechRecognizedPartialResult___block_invoke;
  v6[3] = &unk_1E59245D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __65__AFConnection__tellSpeechDelegateSpeechRecognizedPartialResult___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecognizedPartialResult:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateRecognitionUpdateWillBeginForTask:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__AFConnection__tellSpeechDelegateRecognitionUpdateWillBeginForTask___block_invoke;
  v6[3] = &unk_1E59245D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __69__AFConnection__tellSpeechDelegateRecognitionUpdateWillBeginForTask___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:*(void *)(a1 + 32) recognitionUpdateWillBeginForTask:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateRecordingDidUpdateRecognitionPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__AFConnection__tellSpeechDelegateRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke;
  v14[3] = &unk_1E59246C8;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v14];
}

void __89__AFConnection__tellSpeechDelegateRecordingDidUpdateRecognitionPhrases_utterances_refId___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:a1[4] recognitionUpdateWithPhrases:a1[5] utterances:a1[6] refId:a1[7]];
  }
}

- (void)_tellSpeechDelegateRecognizedAdditionalSpeechInterpretation:(id)a3 refId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__AFConnection__tellSpeechDelegateRecognizedAdditionalSpeechInterpretation_refId___block_invoke;
  v10[3] = &unk_1E59246A0;
  void v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v10];
}

void __82__AFConnection__tellSpeechDelegateRecognizedAdditionalSpeechInterpretation_refId___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:a1[4] recognizedAdditionalSpeechInterpretation:a1[5] refId:a1[6]];
  }
}

- (void)_tellSpeechDelegateSpeechRecognized:(id)a3
{
  id v4 = a3;
  if (self->_activeRequestType == 1)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_activeRequestSpeechRecognitionTimeInterval = v5;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__AFConnection__tellSpeechDelegateSpeechRecognized___block_invoke;
  v7[3] = &unk_1E59245D8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v7];
}

void __52__AFConnection__tellSpeechDelegateSpeechRecognized___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecognized:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateRecordingDidFail:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__AFConnection__tellSpeechDelegateRecordingDidFail___block_invoke;
  v6[3] = &unk_1E59245D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __52__AFConnection__tellSpeechDelegateRecordingDidFail___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecordingDidFail:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateRecordingDidCancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __53__AFConnection__tellSpeechDelegateRecordingDidCancel__block_invoke;
  v2[3] = &unk_1E5924628;
  v2[4] = self;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v2];
}

void __53__AFConnection__tellSpeechDelegateRecordingDidCancel__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnectionSpeechRecordingDidCancel:*(void *)(a1 + 32)];
  }
}

- (void)_tellSpeechDelegateRecordingDidEnd
{
  if (self->_activeRequestType == 1)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_activeRequestSpeechRecordingEndTimeInterval = v3;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__AFConnection__tellSpeechDelegateRecordingDidEnd__block_invoke;
  v4[3] = &unk_1E5924628;
  v4[4] = self;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v4];
}

void __50__AFConnection__tellSpeechDelegateRecordingDidEnd__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnectionSpeechRecordingDidEnd:*(void *)(a1 + 32)];
  }
}

- (void)_tellSpeechDelegateToPerformTwoShotPromptWithType:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__AFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke;
  v8[3] = &unk_1E5924678;
  id v9 = v6;
  int64_t v10 = a3;
  void v8[4] = self;
  id v7 = v6;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v8];
}

void __72__AFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 64);
  if (v5 == 1 && !*(void *)(v4 + 72))
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = *(void *)(a1 + 48);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __72__AFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke_2;
      v12[3] = &unk_1E5924650;
      uint64_t v10 = *(void *)(a1 + 32);
      id v13 = *(id *)(a1 + 40);
      [v3 assistantConnection:v10 speechRecordingPerformTwoShotPromptWithType:v9 completion:v12];

      goto LABEL_6;
    }
    uint64_t v6 = *(void *)(a1 + 40);
    if (!v6) {
      goto LABEL_6;
    }
    [NSString stringWithFormat:@"Speech delegate %@ is incapable of performing two-shot prompt.", v3, v11];
    goto LABEL_5;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    [NSString stringWithFormat:@"Active request type is %ld and active request UUFR type is %ld, two-shot prompt is ignored.", v5, *(void *)(v4 + 72)];
    id v7 = LABEL_5:;
    id v8 = +[AFError errorWithCode:15 description:v7 underlyingError:0];
    (*(void (**)(uint64_t, void *, double, double))(v6 + 16))(v6, v8, 0.0, 0.0);
  }
LABEL_6:
}

uint64_t __72__AFConnection__tellSpeechDelegateToPerformTwoShotPromptWithType_reply___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_tellSpeechDelegateRecordingDidDetectStartpoint
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __63__AFConnection__tellSpeechDelegateRecordingDidDetectStartpoint__block_invoke;
  v2[3] = &unk_1E5924628;
  v2[4] = self;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v2];
}

void __63__AFConnection__tellSpeechDelegateRecordingDidDetectStartpoint__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnectionSpeechRecordingDidDetectStartpoint:*(void *)(a1 + 32)];
  }
}

- (void)_tellSpeechDelegateRecordingDidChangeAVRecordRoute:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__AFConnection__tellSpeechDelegateRecordingDidChangeAVRecordRoute___block_invoke;
  v6[3] = &unk_1E59245D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __67__AFConnection__tellSpeechDelegateRecordingDidChangeAVRecordRoute___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecordingDidChangeAVRecordRoute:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateRecordingDidBeginOnAVRecordRoute:(id)a3 audioSessionID:(unsigned int)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__AFConnection__tellSpeechDelegateRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke;
  v8[3] = &unk_1E5924600;
  void v8[4] = self;
  id v9 = v6;
  unsigned int v10 = a4;
  id v7 = v6;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v8];
}

void __83__AFConnection__tellSpeechDelegateRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecordingDidBeginOnAVRecordRoute:*(void *)(a1 + 40) audioSessionID:*(unsigned int *)(a1 + 48)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecordingDidBeginOnAVRecordRoute:*(void *)(a1 + 40)];
  }
}

- (void)_tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__AFConnection__tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke;
  v6[3] = &unk_1E59245D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AFConnection *)self _dispatchCallbackGroupBlock:v6];
}

void __83__AFConnection__tellSpeechDelegateRecordingWillBeginWithInputAudioPowerXPCWrapper___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v3 assistantConnection:*(void *)(a1 + 32) speechRecordingWillBeginWithInputAudioPowerXPCWrapper:*(void *)(a1 + 40)];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v3 assistantConnectionSpeechRecordingWillBegin:*(void *)(a1 + 32)];
  }
}

- (void)_dispatchCallbackGroupBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (self->_speechCallbackGroup)
    {
      objc_copyWeak(&to, (id *)&self->_speechDelegate);
      speechCallbackGroup = self->_speechCallbackGroup;
      targetQueue = self->_targetQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__AFConnection__dispatchCallbackGroupBlock___block_invoke;
      block[3] = &unk_1E5926FA0;
      id v9 = v4;
      objc_copyWeak(&v10, &to);
      dispatch_group_notify(speechCallbackGroup, targetQueue, block);
      objc_destroyWeak(&v10);

      objc_destroyWeak(&to);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate);
      (*((void (**)(id, id))v4 + 2))(v4, WeakRetained);
    }
  }
}

void __44__AFConnection__dispatchCallbackGroupBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);
}

- (void)_tellDelegateFailedToLaunchAppWithBundleIdentifier:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 assistantConnection:self appLaunchFailedWithBundleIdentifier:v7];
  }
}

- (void)_tellDelegateWillProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 assistantConnection:self willProcessAppLaunchWithBundleIdentifier:v7];
  }
}

- (void)_tellDelegateAudioSessionDidBecomeActive:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 assistantConnection:self audioSessionDidBecomeActive:v3];
  }
}

- (void)_tellDelegateAudioSessionWillBecomeActive:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 assistantConnection:self audioSessionWillBecomeActive:v3];
  }
}

- (void)_tellDelegateStartPlaybackDidFail:(int64_t)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 assistantConnection:self startPlaybackDidFail:a3];
  }
}

- (void)_tellDelegateWillProcessStartPlayback:(int64_t)a3 intent:(id)a4 completion:(id)a5
{
  id v15 = a4;
  id v8 = (void (**)(id, uint64_t, uint64_t))a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  id v12 = v11;
  if (v10)
  {
    [v11 assistantConnection:self willProcessStartPlayback:a3 intent:v15 completion:v8];
  }
  else
  {
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 assistantConnection:self willProcessStartPlayback:a3];
    }
    if (v8) {
      v8[2](v8, 1, 1);
    }
  }
}

- (void)_tellDelegateAudioPlaybackRequestDidStop:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnection:self didStopAudioPlaybackRequest:v10 error:v6];
  }
}

- (void)_tellDelegateAudioPlaybackRequestDidStart:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 assistantConnection:self didStartAudioPlaybackRequest:v7];
  }
}

- (void)_tellDelegateAudioPlaybackRequestWillStart:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 assistantConnection:self willStartAudioPlaybackRequest:v7];
  }
}

- (void)_tellDelegateAudioSessionDidEndInterruption:(BOOL)a3 userInfo:(id)a4
{
  BOOL v4 = a3;
  id v11 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  id v9 = v8;
  if (v7)
  {
    [v8 assistantConnectionAudioSessionDidEndInterruption:self shouldResume:v4 userInfo:v11];
  }
  else
  {
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_6;
    }
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnectionAudioSessionDidEndInterruption:self shouldResume:v4];
  }

LABEL_6:
}

- (void)_tellDelegateAudioSessionDidBeginInterruptionWithUserInfo:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = v6;
  if (v5)
  {
    [v6 assistantConnectionAudioSessionDidBeginInterruption:self userInfo:v9];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      goto LABEL_6;
    }
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 assistantConnectionAudioSessionDidBeginInterruption:self];
  }

LABEL_6:
}

- (void)_tellDelegateExtensionRequestFinishedForApplication:(id)a3 error:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnection:self extensionRequestFinishedForApplication:v10 error:v6];
  }
}

- (void)_tellDelegateExtensionRequestWillStartForApplication:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 assistantConnection:self extensionRequestWillStartForApplication:v7];
  }
}

- (void)_tellDelegateCacheImage:(id)a3
{
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 assistantConnection:self wantsToCacheImage:v7];
  }
}

- (void)_tellDelegateInvalidateCurrentUserActivity
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 assistantConnectionInvalidateCurrentUserActivity:self];
  }
}

- (void)_tellDelegateSetUserActivityInfo:(id)a3 webpageURL:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnection:self setUserActivtiyInfoAndMakeCurrent:v10 webpageURL:v6];
  }
}

- (void)_tellDelegateDidFinishAcousticIDRequestWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  analytics = self->_analytics;
  id v10 = @"success";
  id v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:");
  v11[0] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  [(AFAnalytics *)analytics logEventWithType:1917 context:v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnection:self didFinishAcousticIDRequestWithSuccess:v3];
  }
}

- (void)_tellDelegateDidDetectMusic
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 assistantConnectionDidDetectMusic:self];
  }
}

- (void)_tellDelegateWillStartAcousticIDRequest
{
  [(AFAnalytics *)self->_analytics logEventWithType:1916 context:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 assistantConnectionWillStartAcousticIDRequest:self];
  }
}

- (void)_tellDelegateAudioSessionIDChanged:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 assistantConnection:self didChangeAudioSessionID:v3];
  }
}

- (void)_tellDelegateShouldSpeakChanged:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 assistantConnection:self shouldSpeak:v3];
  }
}

- (void)_completeRequestWithUUID:(id)a3 forReason:(int64_t)a4 error:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = (NSUUID *)a3;
  id v9 = a5;
  id v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    activeTurnIdentifier = self->_activeTurnIdentifier;
    int v28 = 136316162;
    id v29 = "-[AFConnection _completeRequestWithUUID:forReason:error:]";
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    int64_t v33 = (int64_t)activeTurnIdentifier;
    __int16 v34 = 2048;
    int64_t v35 = a4;
    __int16 v36 = 2112;
    id v37 = v9;
    _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s requestUUID = %@, turnId = %@, reason %ld, error = %@", (uint8_t *)&v28, 0x34u);
  }
  int64_t activeRequestType = self->_activeRequestType;
  if (activeRequestType == 1)
  {
    int v13 = [(NSUUID *)self->_activeRequestUUID isEqual:v8];
    if (self->_activeRequestType) {
      goto LABEL_5;
    }
LABEL_10:
    id v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v28 = 136315138;
      id v29 = "-[AFConnection _completeRequestWithUUID:forReason:error:]";
      _os_log_impl(&dword_19CF1D000, v18, OS_LOG_TYPE_INFO, "%s Dropping delegate callback because request is complete", (uint8_t *)&v28, 0xCu);
    }
    p_activeRequestUUID = (id *)&self->_activeRequestUUID;
    if ([(NSUUID *)self->_activeRequestUUID isEqual:v8]) {
      goto LABEL_18;
    }
LABEL_13:
    id v19 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      activeRequestUUID = self->_activeRequestUUID;
      __int16 v21 = self->_activeTurnIdentifier;
      int v28 = 136315906;
      id v29 = "-[AFConnection _completeRequestWithUUID:forReason:error:]";
      __int16 v30 = 2112;
      id v31 = activeRequestUUID;
      __int16 v32 = 2112;
      int64_t v33 = (int64_t)v8;
      __int16 v34 = 2112;
      int64_t v35 = (int64_t)v21;
      _os_log_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_INFO, "%s Dropping delegate callback because request is different (_activeRequestUUID = %@, requestUUID = %@, turnId = %@)", (uint8_t *)&v28, 0x2Au);
    }
    goto LABEL_18;
  }
  int v13 = 0;
  if (!activeRequestType) {
    goto LABEL_10;
  }
LABEL_5:
  p_activeRequestUUID = (id *)&self->_activeRequestUUID;
  if (([(NSUUID *)self->_activeRequestUUID isEqual:v8] & 1) == 0) {
    goto LABEL_13;
  }
  if (v9)
  {
    [(AFConnection *)self _willFailRequestWithError:v9];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      [v17 assistantConnection:self requestFailedWithError:v9 requestClass:self->_outstandingRequestClass];
LABEL_17:
    }
  }
  else
  {
    [(AFConnection *)self _willCompleteRequest];
    id v22 = objc_loadWeakRetained((id *)&self->_delegate);
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      id v17 = objc_loadWeakRetained((id *)&self->_delegate);
      [v17 assistantConnectionRequestFinished:self];
      goto LABEL_17;
    }
  }
LABEL_18:
  if (*p_activeRequestUUID && ![*p_activeRequestUUID isEqual:v8])
  {
    id v25 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      id v26 = self->_activeRequestUUID;
      uint64_t v27 = self->_activeTurnIdentifier;
      int v28 = 136315906;
      id v29 = "-[AFConnection _completeRequestWithUUID:forReason:error:]";
      __int16 v30 = 2112;
      id v31 = v26;
      __int16 v32 = 2112;
      int64_t v33 = (int64_t)v8;
      __int16 v34 = 2112;
      int64_t v35 = (int64_t)v27;
      _os_log_impl(&dword_19CF1D000, v25, OS_LOG_TYPE_INFO, "%s Not ending the ongoing request because the active request ID is different than the completed request ID: (_activeRequestUUID = %@, requestUUID = %@, turnId = %@)", (uint8_t *)&v28, 0x2Au);
    }
  }
  else
  {
    [(AFConnection *)self _requestDidEnd];
  }
  if (v13)
  {
    id v24 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v28 = 136315650;
      id v29 = "-[AFConnection _completeRequestWithUUID:forReason:error:]";
      __int16 v30 = 2112;
      id v31 = v8;
      __int16 v32 = 2048;
      int64_t v33 = a4;
      _os_log_impl(&dword_19CF1D000, v24, OS_LOG_TYPE_INFO, "%s Resetting isCapturingSpeech for %@ for reason: %ld", (uint8_t *)&v28, 0x20u);
    }
    [(AFConnection *)self _checkAndSetIsCapturingSpeech:0];
  }
}

- (void)_tellDelegateRequestWillStart
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 assistantConnectionRequestWillStart:self];
  }
}

- (int64_t)_getActiveSpeechEvent
{
  return self->_activeRequestSpeechEvent;
}

- (id)_siriClientStateManager
{
  siriClientStateManager = self->_siriClientStateManager;
  if (!siriClientStateManager)
  {
    char v4 = +[AFSiriClientStateManager sharedManager];
    char v5 = self->_siriClientStateManager;
    self->_siriClientStateManager = v4;

    siriClientStateManager = self->_siriClientStateManager;
  }
  return siriClientStateManager;
}

- (void)_updateSpeechEndHostTime:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int64_t activeRequestType = self->_activeRequestType;
  char v5 = AFSiriLogContextConnection;
  if (activeRequestType != 1)
  {
    if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      return;
    }
    activeRequestUUID = self->_activeRequestUUID;
    *(_DWORD *)buf = 136315650;
    id v19 = "-[AFConnection _updateSpeechEndHostTime:]";
    __int16 v20 = 2048;
    unint64_t v21 = activeRequestType;
    __int16 v22 = 2112;
    char v23 = activeRequestUUID;
    id v12 = "%s Unable to update speech end host time. (_activeRequestType = %zd, _activeRequestUUID = %@)";
    int v13 = v5;
    uint32_t v14 = 32;
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    id v19 = "-[AFConnection _updateSpeechEndHostTime:]";
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s updating speech end host time: %llu", buf, 0x16u);
  }
  if (self->_activeRequestSpeechEndHostTime != a3)
  {
    self->_activeRequestSpeechEndHostTime = a3;
    if (+[AFFeatureFlags isStateFeedbackEnabled])
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __41__AFConnection__updateSpeechEndHostTime___block_invoke;
      v17[3] = &unk_1E59245B0;
      void v17[4] = self;
      void v17[5] = a3;
      [(AFConnection *)self _dispatchCallbackGroupBlock:v17];
      return;
    }
    unint64_t activeRequestNumberOfPresentedInterstitials = self->_activeRequestNumberOfPresentedInterstitials;
    if (activeRequestNumberOfPresentedInterstitials == 1)
    {
      uint64_t v11 = AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136315138;
      id v19 = "-[AFConnection _updateSpeechEndHostTime:]";
      id v12 = "%s Skipped timing adjustment because 1 interstitial has been presented.";
      int v13 = v11;
      uint32_t v14 = 12;
    }
    else
    {
      if (!activeRequestNumberOfPresentedInterstitials)
      {
        id v9 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          id v19 = "-[AFConnection _updateSpeechEndHostTime:]";
          __int16 v20 = 2048;
          unint64_t v21 = a3;
          _os_log_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_INFO, "%s No interstitial has been presented yet, adjusting timings based on updated speech end host time %llu.", buf, 0x16u);
        }
        id v10 = NSStringFromSelector(a2);
        [(AFConnection *)self _endInterstitialsForReason:v10];
        [(AFConnection *)self _beginInterstitialsForReason:v10];

        return;
      }
      uint64_t v15 = AFSiriLogContextConnection;
      if (!os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        return;
      }
      *(_DWORD *)buf = 136315394;
      id v19 = "-[AFConnection _updateSpeechEndHostTime:]";
      __int16 v20 = 2048;
      unint64_t v21 = activeRequestNumberOfPresentedInterstitials;
      id v12 = "%s Skipped timing adjustment because %lu interstitials have been presented.";
      int v13 = v15;
      uint32_t v14 = 22;
    }
LABEL_19:
    _os_log_error_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
  }
}

void __41__AFConnection__updateSpeechEndHostTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 assistantConnectionUpdatedSpeechEndEstimate:*(void *)(a1 + 32) speechEndEstimate:*(void *)(a1 + 40)];
  }
}

- (void)_markNetworkDidBecomeActive
{
  self->_connectionHadActiveNetwork = 1;
  if (!AFDeviceSupportsSiriUOD()
    || (+[AFConnection currentLanguageCode],
        id v3 = objc_claimAutoreleasedReturnValue(),
        BOOL v4 = +[AFFeatureFlags isSiriUODAvailableForLanguage:v3], v3, !v4))
  {
    [(AFConnection *)self _extendExpiringRequestTimeout];
  }
}

- (void)_markSpeechRecognized
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t activeRequestType = self->_activeRequestType;
  if (activeRequestType == 1)
  {
    self->_activeRequestHasSpeechRecognition = 1;
  }
  else
  {
    BOOL v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      activeRequestUUID = self->_activeRequestUUID;
      int v6 = 136315650;
      char v7 = "-[AFConnection _markSpeechRecognized]";
      __int16 v8 = 2048;
      int64_t v9 = activeRequestType;
      __int16 v10 = 2112;
      uint64_t v11 = activeRequestUUID;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Unable to mark speech recognized because the active request is not a speech request. (_int64_t activeRequestType = %ld, _activeRequestUUID = %@)", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)_markIsTwoShot
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t activeRequestType = self->_activeRequestType;
  if (activeRequestType == 1)
  {
    self->_activeRequestIsTwoShot = 1;
  }
  else
  {
    BOOL v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      activeRequestUUID = self->_activeRequestUUID;
      int v6 = 136315650;
      char v7 = "-[AFConnection _markIsTwoShot]";
      __int16 v8 = 2048;
      int64_t v9 = activeRequestType;
      __int16 v10 = 2112;
      uint64_t v11 = activeRequestUUID;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Unable to mark isTwoShot because the active request is not a speech request. (_int64_t activeRequestType = %zd, _activeRequestUUID = %@)", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)_markIsDucking
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t activeRequestType = self->_activeRequestType;
  if (activeRequestType == 1)
  {
    self->_activeRequestIsDucking = 1;
  }
  else
  {
    BOOL v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      activeRequestUUID = self->_activeRequestUUID;
      int v6 = 136315650;
      char v7 = "-[AFConnection _markIsDucking]";
      __int16 v8 = 2048;
      int64_t v9 = activeRequestType;
      __int16 v10 = 2112;
      uint64_t v11 = activeRequestUUID;
      _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s Unable to mark isDucking because the active request is not a speech request. (_int64_t activeRequestType = %zd, _activeRequestUUID = %@)", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)_setRecordRoute:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (NSString *)a3;
  char v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    __int16 v10 = "-[AFConnection _setRecordRoute:]";
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s recordRoute = %@", (uint8_t *)&v9, 0x16u);
  }
  recordRoute = self->_recordRoute;
  if (recordRoute != v4 && ![(NSString *)recordRoute isEqualToString:v4])
  {
    char v7 = (NSString *)[(NSString *)v4 copy];
    __int16 v8 = self->_recordRoute;
    self->_recordRoute = v7;
  }
}

- (void)_setAudioSessionID:(unsigned int)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    int v9 = "-[AFConnection _setAudioSessionID:]";
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s audioSessionID = %lu", buf, 0x16u);
  }
  if (self->_audioSessionID != a3)
  {
    self->_audioSessionID = a3;
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__AFConnection__setAudioSessionID___block_invoke;
    block[3] = &unk_1E592C678;
    void block[4] = self;
    dispatch_async(targetQueue, block);
  }
}

uint64_t __35__AFConnection__setAudioSessionID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellDelegateAudioSessionIDChanged:*(unsigned int *)(*(void *)(a1 + 32) + 220)];
}

- (void)_stopInputAudioPowerUpdates
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
  if (inputAudioPowerUpdater)
  {
    [(AFAudioPowerUpdater *)inputAudioPowerUpdater endUpdate];
    [(AFAudioPowerUpdater *)self->_inputAudioPowerUpdater invalidate];
    BOOL v4 = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = 0;

    char v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      char v7 = "-[AFConnection _stopInputAudioPowerUpdates]";
      _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, "%s Stopped input audio power updates.", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)_startInputAudioPowerUpdatesWithXPCWrapper:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AFConnection *)self _stopInputAudioPowerUpdates];
  if (v4
    && (id WeakRetained = objc_loadWeakRetained((id *)&self->_speechDelegate),
        char v6 = objc_opt_respondsToSelector(),
        WeakRetained,
        (v6 & 1) != 0))
  {
    char v7 = [[AFAudioPowerXPCProvider alloc] initWithXPCWrapper:v4];
    uint64_t v8 = [[AFAudioPowerUpdater alloc] initWithProvider:v7 queue:self->_targetQueue frequency:1 delegate:self];
    inputAudioPowerUpdater = self->_inputAudioPowerUpdater;
    self->_inputAudioPowerUpdater = v8;

    __int16 v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      char v16 = "-[AFConnection _startInputAudioPowerUpdatesWithXPCWrapper:]";
      _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s Prepared for input audio power updates. Waiting for _speechCallbackGroup...", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __59__AFConnection__startInputAudioPowerUpdatesWithXPCWrapper___block_invoke;
    v13[3] = &unk_1E5924588;
    objc_copyWeak(&v14, (id *)buf);
    [(AFConnection *)self _dispatchCallbackGroupBlock:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

void __59__AFConnection__startInputAudioPowerUpdatesWithXPCWrapper___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = (void *)*((void *)WeakRetained + 30);
    if (v3)
    {
      [v3 beginUpdate];
      id v4 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        int v5 = 136315138;
        char v6 = "-[AFConnection _startInputAudioPowerUpdatesWithXPCWrapper:]_block_invoke";
        _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s Started input audio power updates.", (uint8_t *)&v5, 0xCu);
      }
    }
  }
}

- (void)_aceConnectionWillRetryOnError:(id)a3
{
}

- (void)_setShouldSpeak:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v10 = "-[AFConnection _setShouldSpeak:]";
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_debug_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_DEBUG, "%s shouldSpeak = %d", buf, 0x12u);
  }
  if ([(AFConnection *)self shouldSpeak] != v3)
  {
    if (v3) {
      char v6 = 2;
    }
    else {
      char v6 = 0;
    }
    *((unsigned char *)self + 216) = *((unsigned char *)self + 216) & 0xFD | v6;
    targetQueue = self->_targetQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __32__AFConnection__setShouldSpeak___block_invoke;
    block[3] = &unk_1E592C678;
    void block[4] = self;
    dispatch_async(targetQueue, block);
  }
}

uint64_t __32__AFConnection__setShouldSpeak___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _tellDelegateShouldSpeakChanged:(*(unsigned __int8 *)(*(void *)(a1 + 32) + 216) >> 1) & 1];
}

- (void)_dispatchCommand:(id)a3 isInterstitial:(BOOL)a4 interstitialPhase:(int64_t)a5 interstitialDelay:(double)a6 reply:(id)a7
{
  BOOL v10 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v16 = objc_opt_respondsToSelector();
  uint64_t v17 = AFSiriLogContextConnection;
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v44 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]";
      __int16 v45 = 2112;
      id v46 = v13;
      __int16 v47 = 1024;
      LODWORD(v48) = v10;
      _os_log_impl(&dword_19CF1D000, v17, OS_LOG_TYPE_DEFAULT, "%s command = %@, isInterstitial = %d", buf, 0x1Cu);
    }
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke;
    v35[3] = &unk_1E5924538;
    void v35[4] = self;
    id v18 = v13;
    BOOL v42 = v10;
    id v36 = v18;
    int64_t v39 = a5;
    SEL v40 = a2;
    double v41 = a6;
    id v37 = WeakRetained;
    id v19 = v14;
    id v38 = v19;
    uint64_t v20 = MEMORY[0x19F3A50D0](v35);
    unint64_t v21 = (void *)v20;
    unint64_t activeRequestSpeechEvent = self->_activeRequestSpeechEvent;
    if (activeRequestSpeechEvent <= 0x1F && ((0x80018900 >> activeRequestSpeechEvent) & 1) != 0)
    {
      targetQueue = self->_targetQueue;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_119;
      v29[3] = &unk_1E5924560;
      BOOL v34 = v10;
      void v29[4] = self;
      id v30 = v18;
      id v31 = v19;
      id v32 = v21;
      SEL v33 = a2;
      dispatch_async(targetQueue, v29);
    }
    else
    {
      (*(void (**)(uint64_t))(v20 + 16))(v20);
      if (!v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v26 = NSStringFromSelector(a2);
          [(AFConnection *)self _cancelRequestTimeoutForReason:v26];
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = v17;
      int v28 = [v13 encodedClassName];
      *(_DWORD *)buf = 136315650;
      id v44 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]";
      __int16 v45 = 2112;
      id v46 = WeakRetained;
      __int16 v47 = 2112;
      uint64_t v48 = v28;
      _os_log_error_impl(&dword_19CF1D000, v27, OS_LOG_TYPE_ERROR, "%s no delegate method on %@ to handle command: %@", buf, 0x20u);
    }
    uint64_t v24 = +[AFError errorWithCode:26];
    (*((void (**)(id, void, void *))v14 + 2))(v14, 0, v24);

    if (!v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v25 = NSStringFromSelector(a2);
        [(AFConnection *)self _cancelRequestTimeoutForReason:v25];
      }
    }
  }
}

void __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke(uint64_t a1)
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 56);
  BOOL v3 = [*(id *)(a1 + 40) encodedClassName];
  id v4 = v2;
  id v5 = v3;
  if (v4)
  {
    if (AFIsHorseman_onceToken != -1) {
      dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
    }
    if (!AFIsHorseman_isHorseman
      || ([v5 isEqual:@"ExecuteOnRemoteRequest"] & 1) != 0
      || ([v5 isEqual:@"StartHandoffRequest"] & 1) != 0)
    {
      LODWORD(v6) = 1;
    }
    else
    {
      LODWORD(v6) = [v5 isEqual:@"InitiateHandoffOnCompanion"];
    }
  }
  else
  {
    LODWORD(v6) = 0;
  }

  uint64_t v7 = AFAnalyticsContextCreateWithCommand(*(void **)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 328) logEventWithType:1421 context:v7 contextNoCopy:1];
  if (v6)
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 56);
    int v9 = [*(id *)(a1 + 40) encodedClassName];
    BOOL v10 = [*(id *)(a1 + 40) aceId];
    id v11 = v8;
    id v12 = v9;
    id v13 = [v11 UUIDString];
    id v14 = _ConvertIdToSchemaUUID(v13);

    if (v14)
    {
      char v100 = (char)v6;
      id v6 = objc_alloc_init(MEMORY[0x1E4FA0D40]);
      id v15 = objc_alloc_init(MEMORY[0x1E4FA0D48]);
      [v15 setRequestId:v14];
      [v6 setEventMetadata:v15];
      BOOL v98 = v7;
      id v16 = objc_alloc_init(MEMORY[0x1E4FA0CF8]);
      id v17 = objc_alloc_init(MEMORY[0x1E4FA0D08]);
      [v17 setAceCommandType:2];
      [v17 setAceCommandName:v12];
      [v16 setStartedOrChanged:v17];
      id v18 = _ConvertIdToSchemaUUID(v10);
      [v16 setAceId:v18];

      [v6 setAceCommandContext:v16];
      id v19 = [MEMORY[0x1E4F9F9A8] sharedStream];
      [v19 emitMessage:v6];

      uint64_t v7 = v98;
      LOBYTE(v6) = v100;
    }
    else
    {
      uint64_t v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v111 = "_EmitAceCommandStartedEvent";
        __int16 v112 = 2112;
        v113 = (const char *)v11;
        _os_log_error_impl(&dword_19CF1D000, v20, OS_LOG_TYPE_ERROR, "%s The requestId=%@ is malformed, unable to log SELF command", buf, 0x16u);
      }
    }
  }
  os_signpost_id_t v21 = os_signpost_id_generate((os_log_t)AFSiriLogContextPerformance);
  __int16 v22 = (id)AFSiriLogContextPerformance;
  char v23 = v22;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_DWORD *)buf = 136315394;
    v111 = "SiriX";
    __int16 v112 = 2080;
    v113 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl(&dword_19CF1D000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "UICommandHandle", "%s %s", buf, 0x16u);
  }

  if (!*(unsigned char *)(a1 + 88))
  {
    uint64_t v28 = *(void *)(a1 + 32);
    id v29 = *(void **)(v28 + 200);
    if (!v29) {
      goto LABEL_79;
    }
    id v30 = *(void **)(a1 + 40);
    id v31 = *(id *)(v28 + 328);
    id v32 = v30;
    id v33 = v29;
    id v34 = v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v96 = v33;
      objc_msgSend(v32, "af_dialogPhase");
      int64_t v35 = (char *)objc_claimAutoreleasedReturnValue();
      id v36 = AFSiriLogContextConnection;
      char v101 = (char)v6;
      __int16 v97 = v31;
      __int16 v99 = v7;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v111 = "_LogUUFRReadyConditionally";
        __int16 v112 = 2112;
        v113 = v35;
        _os_log_impl(&dword_19CF1D000, v36, OS_LOG_TYPE_INFO, "%s Logging uufr for phase= %@", buf, 0x16u);
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_78;
        }
      }
      id v96 = v33;
      __int16 v97 = v31;
      __int16 v99 = v7;
      char v101 = (char)v6;
      int64_t v35 = 0;
    }
    id v61 = objc_alloc_init(MEMORY[0x1E4FA1350]);
    v94 = v35;
    objc_msgSend(v61, "setDialogPhase:", objc_msgSend(v35, "UEIUUFRReadyDialogPhase"));
    id v95 = v34;
    id v62 = v34;
    id v63 = v32;
    id v64 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      int64_t v65 = NSString;
      double v66 = [v63 groupIdentifier];
      double v67 = [v63 encodedClassName];
      unint64_t v68 = [v65 stringWithFormat:@"%@.%@", v66, v67];

      v69 = [v62 objectForKey:v68];
      v70 = v69;
      if (v69)
      {
        uint64_t v71 = [v69 objectForKey:@"dialogIdentifiers"];

        id v64 = (id)v71;
      }
    }
    [v61 setDialogIdentifiers:v64];

    id v72 = v62;
    id v73 = v63;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v75 = [v72 objectForKey:@"com.apple.ace.assistant.AddViews"];
      v76 = [v75 objectForKey:@"views"];
      v77 = v76;
      if (v76 && [v76 count])
      {
        v78 = [v77 objectAtIndex:0];
        BOOL v79 = _ExtractAceViewId(v78);
      }
      else
      {
        BOOL v79 = 0;
      }
    }
    else
    {
      BOOL v79 = 0;
    }

    [v61 setAceViewId:v79];
    [v61 setUufrReadySource:1];
    v85 = (objc_class *)objc_opt_class();
    v86 = NSStringFromClass(v85);
    [v61 setAceCommandClass:v86];

    v87 = [v73 aceId];
    v88 = _ConvertIdToSchemaUUID(v87);
    [v61 setAceCommandId:v88];

    id v33 = v96;
    id v31 = v97;
    [v97 logInstrumentation:v61 machAbsoluteTime:mach_absolute_time() turnIdentifier:v96];

    LOBYTE(v6) = v101;
    uint64_t v7 = v99;
    id v34 = v95;
LABEL_78:

    if (!*(unsigned char *)(a1 + 88)) {
      goto LABEL_79;
    }
  }
  uint64_t v24 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    unint64_t v25 = *(void *)(a1 + 64);
    id v26 = v24;
    if (v25 > 4) {
      uint64_t v27 = @"(unknown)";
    }
    else {
      uint64_t v27 = off_1E5928BD8[v25];
    }
    id v37 = v27;
    *(_DWORD *)buf = 136315394;
    v111 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
    __int16 v112 = 2112;
    v113 = (const char *)v37;
    _os_log_impl(&dword_19CF1D000, v26, OS_LOG_TYPE_INFO, "%s interstitialPhase = %@", buf, 0x16u);
  }
  id v38 = *(void **)(a1 + 32);
  int64_t v39 = NSStringFromSelector(*(SEL *)(a1 + 72));
  [v38 _pauseRequestTimeoutForReason:v39];

  if (AFIsInternalInstall_onceToken != -1) {
    dispatch_once(&AFIsInternalInstall_onceToken, &__block_literal_global_158);
  }
  if (AFIsInternalInstall_isInternal && *(void *)(a1 + 64) == 1)
  {
    uint64_t v40 = mach_absolute_time();
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v42 = v41;
    __int16 v43 = [MEMORY[0x1E4F28F80] processInfo];
    [v43 systemUptime];
    double v45 = v44;

    *(double *)(*(void *)(a1 + 32) + 192) = v42;
    id v46 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      __int16 v47 = *(const char **)(a1 + 80);
      *(_DWORD *)buf = 136315394;
      v111 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      __int16 v112 = 2048;
      v113 = v47;
      _os_log_impl(&dword_19CF1D000, v46, OS_LOG_TYPE_INFO, "%s interstitialDelay = %f (expected)", buf, 0x16u);
    }
    uint64_t v48 = *(void *)(a1 + 32);
    uint64_t v49 = *(void *)(v48 + 64);
    double v50 = 0.0;
    if (v49 == 2)
    {
      double v80 = *(double *)(v48 + 120);
      if (v80 > 0.0)
      {
        double v81 = v45 - v80;
        id v82 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v111 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          __int16 v112 = 2048;
          v113 = *(const char **)&v81;
          _os_log_impl(&dword_19CF1D000, v82, OS_LOG_TYPE_INFO, "%s durationFromRequestBegin = %f", buf, 0x16u);
        }
        double v50 = fmax(v81, 0.0);
      }
    }
    else if (v49 == 1)
    {
      double v51 = *(double *)(v48 + 176);
      if (v51 > 0.0)
      {
        double v52 = v42 - v51;
        id v53 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v111 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          __int16 v112 = 2048;
          v113 = *(const char **)&v52;
          _os_log_impl(&dword_19CF1D000, v53, OS_LOG_TYPE_INFO, "%s durationFromSpeechRecordingEnd = %f", buf, 0x16u);
          uint64_t v48 = *(void *)(a1 + 32);
        }
        double v50 = fmax(v52, 0.0);
      }
      double v54 = *(double *)(v48 + 184);
      if (v54 > 0.0)
      {
        double v55 = v42 - v54;
        id v56 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v111 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          __int16 v112 = 2048;
          v113 = *(const char **)&v55;
          _os_log_impl(&dword_19CF1D000, v56, OS_LOG_TYPE_INFO, "%s durationFromSpeechRecognition = %f", buf, 0x16u);
          uint64_t v48 = *(void *)(a1 + 32);
        }
        double v50 = fmax(v50, v55);
      }
      uint64_t v57 = *(void *)(v48 + 128);
      if (v57)
      {
        unint64_t v58 = v40 - v57;
        if (_AFMachAbsoluteTimeRate_onceToken != -1) {
          dispatch_once(&_AFMachAbsoluteTimeRate_onceToken, &__block_literal_global_973);
        }
        double v59 = *(double *)&_AFMachAbsoluteTimeRate_rate * (double)v58 / 1000000000.0;
        v60 = AFSiriLogContextConnection;
        if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v111 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
          __int16 v112 = 2048;
          v113 = *(const char **)&v59;
          _os_log_impl(&dword_19CF1D000, v60, OS_LOG_TYPE_INFO, "%s durationFromSpeechEnd = %f", buf, 0x16u);
        }
        double v50 = fmax(v50, v59);
      }
    }
    v83 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v111 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      __int16 v112 = 2048;
      v113 = *(const char **)&v50;
      _os_log_impl(&dword_19CF1D000, v83, OS_LOG_TYPE_INFO, "%s interstitialDelay = %f (actual)", buf, 0x16u);
    }
    if (v50 < *(double *)(a1 + 80) + -0.2)
    {
      v84 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v111 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
        _os_log_error_impl(&dword_19CF1D000, v84, OS_LOG_TYPE_ERROR, "%s Initial interstitial fired too early!", buf, 0xCu);
      }
      [*(id *)(a1 + 32) reportIssueForType:@"Interstitial" subtype:@"Early Fire" context:0];
    }
  }
LABEL_79:
  uint64_t v90 = *(void *)(a1 + 40);
  v89 = *(void **)(a1 + 48);
  uint64_t v91 = *(void *)(a1 + 32);
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_116;
  v102[3] = &unk_1E5924510;
  char v108 = *(unsigned char *)(a1 + 88);
  uint64_t v92 = *(void *)(a1 + 72);
  v102[4] = v91;
  uint64_t v106 = v92;
  id v105 = *(id *)(a1 + 56);
  id v103 = v7;
  char v109 = (char)v6;
  id v104 = *(id *)(a1 + 40);
  os_signpost_id_t v107 = v21;
  id v93 = v7;
  [v89 assistantConnection:v91 receivedCommand:v90 completion:v102];
}

void __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_119(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 72) && *(void *)(*(void *)(a1 + 32) + 72))
  {
    uint64_t v2 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v9 = 136315394;
      BOOL v10 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v3;
      _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s Drop command %@ because UUFR has been presented.", (uint8_t *)&v9, 0x16u);
    }
    uint64_t v4 = *(void *)(a1 + 48);
    if (v4)
    {
      id v5 = +[AFError errorWithCode:38];
      (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v5);
LABEL_12:
    }
  }
  else
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v9 = 136315394;
      BOOL v10 = "-[AFConnection _dispatchCommand:isInterstitial:interstitialPhase:interstitialDelay:reply:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      _os_log_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_INFO, "%s Dispatching command %@", (uint8_t *)&v9, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    if (!*(unsigned char *)(a1 + 72))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v8 = *(void **)(a1 + 32);
        id v5 = NSStringFromSelector(*(SEL *)(a1 + 64));
        [v8 _cancelRequestTimeoutForReason:v5];
        goto LABEL_12;
      }
    }
  }
}

void __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_116(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_2;
  block[3] = &unk_1E59244E8;
  char v17 = *(unsigned char *)(a1 + 80);
  void block[4] = v4;
  long long v10 = *(_OWORD *)(a1 + 56);
  id v6 = (id)v10;
  long long v15 = v10;
  id v12 = v3;
  id v13 = *(id *)(a1 + 40);
  char v18 = *(unsigned char *)(a1 + 81);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 72);
  id v14 = v7;
  uint64_t v16 = v8;
  id v9 = v3;
  dispatch_async(v5, block);
}

void __90__AFConnection__dispatchCommand_isInterstitial_interstitialPhase_interstitialDelay_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 88))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = NSStringFromSelector(*(SEL *)(a1 + 72));
    [v2 _resumeRequestTimeoutForReason:v3];
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 40), 0);
  }
  id v5 = *(void **)(a1 + 40);
  v24[0] = *(void *)(a1 + 48);
  id v6 = AFAnalyticsContextCreateWithCommand(v5);
  v24[1] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  uint64_t v8 = AFAnalyticsContextsMerge(v7);

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 328), "logEventWithType:context:contextNoCopy:", 1422, v8, 1, v24[0]);
  if (*(unsigned char *)(a1 + 89))
  {
    id v9 = *(void **)(*(void *)(a1 + 32) + 56);
    long long v10 = [*(id *)(a1 + 56) aceId];
    id v11 = v9;
    id v12 = [v11 UUIDString];
    id v13 = _ConvertIdToSchemaUUID(v12);

    if (v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4FA0D40]);
      id v15 = objc_alloc_init(MEMORY[0x1E4FA0D48]);
      [v15 setRequestId:v13];
      [v14 setEventMetadata:v15];
      id v16 = objc_alloc_init(MEMORY[0x1E4FA0CF8]);
      id v17 = objc_alloc_init(MEMORY[0x1E4FA0D00]);
      [v17 setExists:1];
      [v17 setAceCommandType:2];
      [v16 setEnded:v17];
      char v18 = _ConvertIdToSchemaUUID(v10);
      [v16 setAceId:v18];

      [v14 setAceCommandContext:v16];
      id v19 = [MEMORY[0x1E4F9F9A8] sharedStream];
      [v19 emitMessage:v14];
    }
    else
    {
      uint64_t v20 = AFSiriLogContextDaemon;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        id v26 = "_EmitAceCommandEndedEvent";
        __int16 v27 = 2112;
        uint64_t v28 = (const char *)v11;
        _os_log_error_impl(&dword_19CF1D000, v20, OS_LOG_TYPE_ERROR, "%s The requestId=%@ is malformed, unable to log SELF command", buf, 0x16u);
      }
    }
  }
  os_signpost_id_t v21 = (id)AFSiriLogContextPerformance;
  __int16 v22 = v21;
  os_signpost_id_t v23 = *(void *)(a1 + 80);
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_DWORD *)buf = 136315394;
    id v26 = "SiriX";
    __int16 v27 = 2080;
    uint64_t v28 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl(&dword_19CF1D000, v22, OS_SIGNPOST_INTERVAL_END, v23, "UICommandHandle", "%s %s", buf, 0x16u);
  }
}

- (void)_handleCommand:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  uint64_t v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    id v15 = "-[AFConnection _handleCommand:reply:]";
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_DEFAULT, "%s command = %@", (uint8_t *)&v14, 0x16u);
  }
  if (AFInterstitialIsCommandInterstitial(v6))
  {
    if (self->_activeRequestType && !self->_activeRequestUsefulUserResultType)
    {
      [(AFConnection *)self _enqueueInterstitialCommand:v6];
      id v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136315394;
        id v15 = "-[AFConnection _handleCommand:reply:]";
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_debug_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_DEBUG, "%s Enqueued command %@ because it is an interstitial and active request has not presented UUFR yet.", (uint8_t *)&v14, 0x16u);
      }
      long long v10 = (Class *)0x1E4F965B8;
    }
    else
    {
      id v9 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
      {
        int v14 = 136315394;
        id v15 = "-[AFConnection _handleCommand:reply:]";
        __int16 v16 = 2112;
        id v17 = v6;
        _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s Ignored command %@ because it is an interstitial but there's no active request or active request has presented UUFR already.", (uint8_t *)&v14, 0x16u);
      }
      long long v10 = (Class *)0x1E4F965B0;
    }
    id v12 = objc_alloc_init(*v10);
    id v13 = [v6 aceId];
    [v12 setRefId:v13];

    if (v7) {
      v7[2](v7, v12, 0);
    }
  }
  else
  {
    [(AFConnection *)self _dispatchCommand:v6 isInterstitial:0 interstitialPhase:0 interstitialDelay:v7 reply:0.0];
  }
}

- (void)_startUIRequestWithInfo:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnection:self startUIRequestWithInfo:v10 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)_startUIRequestWithText:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_delegate);
    [v9 assistantConnection:self startUIRequestWithText:v10 completion:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)_requestDidEnd
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    char v8 = "-[AFConnection _requestDidEnd]";
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %p", (uint8_t *)&v7, 0x16u);
  }
  *((unsigned char *)self + 216) &= ~8u;
  outstandingRequestClass = self->_outstandingRequestClass;
  self->_outstandingRequestClass = 0;

  id v6 = NSStringFromSelector(a2);
  [(AFConnection *)self _endInterstitialsForReason:v6];
  [(AFConnection *)self _cancelRequestTimeoutForReason:v6];
}

- (void)_requestWillBeginWithRequestClass:(id)a3 isSpeechRequest:(BOOL)a4 speechRequestOptions:(id)a5 requestInfo:(id)a6 isBackgroundRequest:(BOOL)a7 analyticsEventProvider:(id)a8
{
  BOOL v9 = a7;
  BOOL v12 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v15 = (NSString *)a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136316418;
    os_signpost_id_t v23 = "-[AFConnection _requestWillBeginWithRequestClass:isSpeechRequest:speechRequestOptions:requestInfo:isBackground"
          "Request:analyticsEventProvider:]";
    __int16 v24 = 2048;
    unint64_t v25 = self;
    __int16 v26 = 2112;
    __int16 v27 = v15;
    __int16 v28 = 1024;
    BOOL v29 = v12;
    __int16 v30 = 2112;
    id v31 = v16;
    __int16 v32 = 1024;
    BOOL v33 = v9;
    _os_log_impl(&dword_19CF1D000, v19, OS_LOG_TYPE_DEFAULT, "%s %p (requestClass = %@, isSpeechRequest = %d (%@), isBackgroundRequest = %d)", (uint8_t *)&v22, 0x36u);
  }
  if (!v9)
  {
    [(AFConnection *)self _willStartRequestWithSpeech:v12 speechRequestOptions:v16 requestInfo:v17 analyticsEventProvider:v18];
    [(AFConnection *)self _tellDelegateRequestWillStart];
    if (!v12)
    {
      uint64_t v20 = NSStringFromSelector(a2);
      [(AFConnection *)self _scheduleRequestTimeoutForReason:v20 durationInSeconds:0.0];
      [(AFConnection *)self _beginInterstitialsForReason:v20];
    }
  }
  *((unsigned char *)self + 216) |= 8u;
  outstandingRequestClass = self->_outstandingRequestClass;
  self->_outstandingRequestClass = v15;
}

- (void)_requestWillBeginWithRequestClass:(id)a3 isSpeechRequest:(BOOL)a4 speechRequestOptions:(id)a5 requestInfo:(id)a6 analyticsEventProvider:(id)a7
{
}

- (void)_checkAndSetIsCapturingSpeech:(BOOL)a3
{
  if (a3)
  {
    char v4 = *((unsigned char *)self + 216);
    if ((v4 & 4) != 0)
    {
      id v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"AFConnection.m" lineNumber:376 description:@"Client is already capturing speech"];

      char v4 = *((unsigned char *)self + 216);
    }
    *((unsigned char *)self + 216) = v4 | 4;
    id v7 = [(AFConnection *)self _siriClientStateManager];
    [v7 beginListeningForClient:self->_clientID];
  }
  else
  {
    [(AFConnection *)self _stopInputAudioPowerUpdates];
    *((unsigned char *)self + 216) &= ~4u;
    id v7 = [(AFConnection *)self _siriClientStateManager];
    [v7 endListeningForClient:self->_clientID];
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = objc_storeWeak((id *)&self->_delegate, a3);
  id v5 = a3;
  if (!a3)
  {
    [(AFConnection *)self _clearConnection];
    id v5 = 0;
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = +[AFError errorWithCode:24];
  [(AFConnection *)self _connectionFailedWithError:v3];
  [(AFConnection *)self _clearConnection];
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v7 = "-[AFConnection dealloc]";
    __int16 v8 = 2048;
    BOOL v9 = self;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s %p", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)AFConnection;
  [(AFConnection *)&v5 dealloc];
}

- (AFConnection)init
{
  return [(AFConnection *)self initWithTargetQueue:0];
}

- (AFConnection)initWithTargetQueue:(id)a3
{
  return [(AFConnection *)self initWithTargetQueue:a3 instanceContext:0];
}

- (AFConnection)initWithTargetQueue:(id)a3 instanceContext:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v36.receiver = self;
  v36.super_class = (Class)AFConnection;
  BOOL v9 = [(AFConnection *)&v36 init];
  uint64_t v10 = v9;
  if (v9)
  {
    v9->_clientID = v9;
    if (v4 && (memset(&v37, 0, sizeof(v37)), dladdr(v4, &v37)))
    {
      if (v37.dli_fname && *v37.dli_fname)
      {
        id v11 = [NSString alloc];
        BOOL v12 = (void *)[v11 initWithUTF8String:v37.dli_fname];
      }
      else
      {
        BOOL v12 = 0;
      }
      if (v37.dli_sname && *v37.dli_sname)
      {
        id v14 = [NSString alloc];
        id v15 = (void *)[v14 initWithUTF8String:v37.dli_sname];
      }
      else
      {
        id v15 = 0;
      }
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __52__AFConnection_initWithTargetQueue_instanceContext___block_invoke;
      v33[3] = &unk_1E592A130;
      id v34 = v12;
      id v35 = v15;
      id v16 = v15;
      id v17 = v12;
      id v13 = +[AFCallSiteInfo newWithBuilder:v33];
    }
    else
    {
      id v13 = 0;
    }
    initiationCallSiteInfo = v10->_initiationCallSiteInfo;
    v10->_initiationCallSiteInfo = v13;

    if (v7)
    {
      id v19 = (OS_dispatch_queue *)v7;
      targetQueue = v10->_targetQueue;
      v10->_targetQueue = v19;
    }
    else
    {
      os_signpost_id_t v21 = (OS_dispatch_queue *)MEMORY[0x1E4F14428];
      id v22 = MEMORY[0x1E4F14428];
      targetQueue = v10->_targetQueue;
      v10->_targetQueue = v21;
    }

    *((unsigned char *)v10 + 216) |= 2u;
    if (v8)
    {
      os_signpost_id_t v23 = (AFInstanceContext *)v8;
    }
    else
    {
      os_signpost_id_t v23 = +[AFInstanceContext defaultContext];
    }
    instanceContext = v10->_instanceContext;
    v10->_instanceContext = v23;

    unint64_t v25 = [[AFAnalytics alloc] initWithInstanceContext:v8];
    analytics = v10->_analytics;
    v10->_analytics = v25;

    atomic_store(0, &v10->_activePlaybackCount);
    v10->_os_signpost_id_t uufrID = 0;
    uint64_t v27 = +[AFPreferences sharedPreferences];
    preferences = v10->_preferences;
    v10->_preferences = (AFPreferences *)v27;

    BOOL v29 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      __int16 v30 = v10->_instanceContext;
      id v31 = v10->_initiationCallSiteInfo;
      LODWORD(v37.dli_fname) = 136315906;
      *(const char **)((char *)&v37.dli_fname + 4) = "-[AFConnection initWithTargetQueue:instanceContext:]";
      WORD2(v37.dli_fbase) = 2048;
      *(void **)((char *)&v37.dli_fbase + 6) = v10;
      HIWORD(v37.dli_sname) = 2112;
      v37.dli_saddr = v30;
      __int16 v38 = 2112;
      int64_t v39 = v31;
      _os_log_impl(&dword_19CF1D000, v29, OS_LOG_TYPE_INFO, "%s %p (instanceContext = %@, caller = %@)", (uint8_t *)&v37, 0x2Au);
    }
  }

  return v10;
}

void __52__AFConnection_initWithTargetQueue_instanceContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setImagePath:v3];
  [v4 setSymbolName:*(void *)(a1 + 40)];
}

+ (void)defrost
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "+[AFConnection defrost]";
    _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s Begin sending defrost XPC message.", buf, 0xCu);
  }
  mach_service = xpc_connection_create_mach_service("com.apple.assistant.sync", 0, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_282);
  xpc_connection_resume(mach_service);
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "name", "defrost");
  uint64_t v5 = mach_absolute_time();
  xpc_dictionary_set_uint64(v4, "mach_time", v5);
  xpc_connection_send_message(mach_service, v4);
  barrier[0] = MEMORY[0x1E4F143A8];
  barrier[1] = 3221225472;
  barrier[2] = __23__AFConnection_defrost__block_invoke_2;
  barrier[3] = &unk_1E592C678;
  id v8 = mach_service;
  id v6 = mach_service;
  xpc_connection_send_barrier(v6, barrier);
}

void __23__AFConnection_defrost__block_invoke_2(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  uint64_t v1 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v2 = 136315138;
    uint64_t v3 = "+[AFConnection defrost]_block_invoke_2";
    _os_log_impl(&dword_19CF1D000, v1, OS_LOG_TYPE_INFO, "%s End sending defrost XPC message.", (uint8_t *)&v2, 0xCu);
  }
}

+ (id)outputVoice
{
  int v2 = +[AFPreferences sharedPreferences];
  uint64_t v3 = [v2 outputVoice];

  return v3;
}

+ (id)currentLanguageCode
{
  int v2 = +[AFPreferences sharedPreferences];
  uint64_t v3 = [v2 languageCode];

  return v3;
}

+ (id)_sAvailabilityObserverForTestVerification
{
  return (id)sAvailabilityObserver;
}

+ (void)stopMonitoringAvailability
{
  if (sAvailabilityObserver)
  {
    int v2 = [a1 _networkAvailability];
    [v2 removeObserver:sAvailabilityObserver];

    uint64_t v3 = (void *)sAvailabilityObserver;
    sAvailabilityObserver = 0;
  }
}

+ (id)_networkAvailability
{
  return +[AFNetworkAvailability sharedAvailability];
}

+ (BOOL)isAvailable
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (+[AFConnection isNetworkAvailable])
  {
    int v2 = AFSiriLogContextConnection;
    LOBYTE(v3) = 1;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315138;
      uint64_t v11 = "+[AFConnection isAvailable]";
      _os_log_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_INFO, "%s Network is available. Evaluating AFConnection as available.", (uint8_t *)&v10, 0xCu);
    }
    return v3;
  }
  if (AFDeviceSupportsSiriUOD())
  {
    uint64_t v4 = +[AFConnection currentLanguageCode];
    BOOL v3 = +[AFFeatureFlags isSiriUODAvailableForLanguage:v4];
    uint64_t v5 = AFSiriLogContextConnection;
    BOOL v6 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        int v10 = 136315394;
        uint64_t v11 = "+[AFConnection isAvailable]";
        __int16 v12 = 2112;
        id v13 = v4;
        id v7 = "%s Network is not available but device supports Understanding On Device for %@. Evaluating AFConnection as available.";
LABEL_13:
        _os_log_impl(&dword_19CF1D000, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v10, 0x16u);
      }
    }
    else if (v6)
    {
      int v10 = 136315394;
      uint64_t v11 = "+[AFConnection isAvailable]";
      __int16 v12 = 2112;
      id v13 = v4;
      id v7 = "%s Network is not available and language %@ is not supported for Understanding On Device. Evaluating AFConnec"
           "tion as NOT available.";
      goto LABEL_13;
    }

    return v3;
  }
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    uint64_t v11 = "+[AFConnection isAvailable]";
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s Network is not available and device does not support Understanding On Device. Evaluating AFConnection as NOT available.", (uint8_t *)&v10, 0xCu);
  }
  LOBYTE(v3) = 0;
  return v3;
}

+ (BOOL)isNetworkAvailable
{
  if (!sAvailabilityObserver) {
    [a1 beginMonitoringAvailability];
  }
  BOOL v3 = [a1 _networkAvailability];
  char v4 = [v3 isAvailable];

  return v4;
}

+ (void)beginMonitoringAvailability
{
  os_unfair_lock_lock((os_unfair_lock_t)&sAvailabilityObserverLock);
  if (!sAvailabilityObserver)
  {
    BOOL v3 = objc_alloc_init(AFConnectionAvailabilityObserver);
    char v4 = (void *)sAvailabilityObserver;
    sAvailabilityObserver = (uint64_t)v3;

    uint64_t v5 = [a1 _networkAvailability];
    [v5 addObserver:sAvailabilityObserver];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sAvailabilityObserverLock);
}

+ (BOOL)assistantIsSupported
{
  if (AFAssistantCapable_onceToken != -1) {
    dispatch_once(&AFAssistantCapable_onceToken, &__block_literal_global_59_45503);
  }
  return AFAssistantCapable_isCapable;
}

+ (BOOL)siriIsSupportedForLanguageCode:(id)a3 productName:(id)a4 productVersion:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  __int16 v12 = v11;
  if (!v9 || !v11)
  {
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kAFAssistantErrorDomain" code:402 userInfo:0];
    if (!a6) {
      goto LABEL_7;
    }
LABEL_6:
    *a6 = v14;
    goto LABEL_7;
  }
  id v13 = AFPreferencesSupportedLanguagesForRemote(v10, v11);
  if ([v13 containsObject:v9])
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kAFAssistantErrorDomain" code:401 userInfo:0];
  }

  if (a6) {
    goto LABEL_6;
  }
LABEL_7:

  return v14 == 0;
}

+ (BOOL)siriIsSupportedForLanguageCode:(id)a3 deviceProductVersion:(id)a4 error:(id *)a5
{
  return [a1 siriIsSupportedForLanguageCode:a3 productName:0 productVersion:a4 error:a5];
}

+ (BOOL)assistantIsSupportedForLanguageCode:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (AFAssistantCapable_onceToken != -1) {
    dispatch_once(&AFAssistantCapable_onceToken, &__block_literal_global_59_45503);
  }
  if (AFAssistantCapable_isCapable)
  {
    BOOL v6 = +[AFPreferences sharedPreferences];
    char v7 = [v6 isLocaleIdentifierNativelySupported:v5];

    if (v7)
    {
      id v8 = 0;
      if (!a4) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    uint64_t v9 = 401;
  }
  else
  {
    uint64_t v9 = 400;
  }
  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kAFAssistantErrorDomain" code:v9 userInfo:0];
  if (a4) {
LABEL_10:
  }
    *a4 = v8;
LABEL_11:

  return v8 == 0;
}

+ (void)initialize
{
  if (AFLogInitIfNeeded_once != -1) {
    dispatch_once(&AFLogInitIfNeeded_once, &__block_literal_global_2935);
  }
}

- (void)broadcastCommandDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(AFConnection *)self _clientService];
  [v5 _broadcastCommandDictionary:v4];
}

- (void)requestBarrierIfNecessary:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__AFConnection_Private__requestBarrierIfNecessary___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  BOOL v6 = [(AFConnection *)self _clientServiceWithErrorHandler:v7];
  [v6 _requestBarrierIfNecessaryWithReply:v5];
}

uint64_t __51__AFConnection_Private__requestBarrierIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)requestBarrier:(id)a3
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__AFConnection_Private__requestBarrier___block_invoke;
  v7[3] = &unk_1E592B9A0;
  id v8 = v4;
  id v5 = v4;
  BOOL v6 = [(AFConnection *)self _clientServiceWithErrorHandler:v7];
  [v6 _requestBarrierWithReply:v5];
}

uint64_t __40__AFConnection_Private__requestBarrier___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3 isNarrowBand:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(AFConnection *)self _checkAndSetIsCapturingSpeech:1];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__AFConnection_Private__startSpeechRequestWithSpeechFileAtURL_isNarrowBand___block_invoke;
  v8[3] = &unk_1E59249F0;
  BOOL v9 = v4;
  void v8[4] = self;
  [(AFConnection *)self _requestWillBeginWithRequestClass:0 isSpeechRequest:1 speechRequestOptions:0 requestInfo:0 analyticsEventProvider:v8];
  char v7 = [(AFConnection *)self _clientService];
  [v7 _startSpeechWithURL:v6 isNarrowBand:v4];
}

uint64_t __76__AFConnection_Private__startSpeechRequestWithSpeechFileAtURL_isNarrowBand___block_invoke(uint64_t a1, void *a2)
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v16[0] = @"File";
  v15[0] = @"speechEvent";
  v15[1] = @"isNarrowBand";
  BOOL v4 = [MEMORY[0x1E4F28ED0] numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v16[1] = v4;
  v15[2] = @"unixTime";
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v6 timeIntervalSince1970];
  char v7 = objc_msgSend(v5, "numberWithDouble:");
  v16[2] = v7;
  v15[3] = @"id";
  id v8 = [v3 UUIDString];
  v16[3] = v8;
  BOOL v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v17[0] = v9;
  id v10 = [*(id *)(a1 + 32) _startRequestMetricSettings];
  v17[1] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
  __int16 v12 = AFAnalyticsContextsMerge(v11);
  uint64_t v13 = AFAnalyticsEventCreateCurrent(1902, v12);

  return v13;
}

- (void)startSpeechRequestWithSpeechFileAtURL:(id)a3
{
}

- (id)_clientConfiguration
{
  clientConfiguration = self->_clientConfiguration;
  if (!clientConfiguration)
  {
    BOOL v4 = +[AFAccessibilityObserver sharedObserver];
    id v5 = +[AFDeviceRingerSwitchObserver sharedObserver];
    id v6 = [AFClientConfiguration alloc];
    char v7 = [v4 currentState];
    LOBYTE(v12) = 0;
    id v8 = -[AFClientConfiguration initWithAccessibilityState:deviceRingerSwitchState:isDeviceInCarDNDMode:isDeviceInStarkMode:supportsCarPlayVehicleData:isDeviceWatchAuthenticated:areAnnouncementRequestsPermittedByPresentationWhileActive:outputVolume:tapToSiriAudioPlaybackRequest:twoShotAudioPlaybackRequest:deviceSetupFlowBeginDate:deviceSetupFlowEndDate:](v6, "initWithAccessibilityState:deviceRingerSwitchState:isDeviceInCarDNDMode:isDeviceInStarkMode:supportsCarPlayVehicleData:isDeviceWatchAuthenticated:areAnnouncementRequestsPermittedByPresentationWhileActive:outputVolume:tapToSiriAudioPlaybackRequest:twoShotAudioPlaybackRequest:deviceSetupFlowBeginDate:deviceSetupFlowEndDate:", v7, [v5 state], 0, 0, 0, 0, 0.0, v12, 0, 0, 0, 0);
    BOOL v9 = self->_clientConfiguration;
    self->_clientConfiguration = v8;

    *((unsigned char *)self + 272) &= ~1u;
    clientConfiguration = self->_clientConfiguration;
  }
  id v10 = (void *)[(AFClientConfiguration *)clientConfiguration copy];
  return v10;
}

- (id)_cachedBulletins
{
  return self->_cachedBulletins;
}

- (id)_clientServiceWithErrorHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(AFConnection *)self _connection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (id)_clientService
{
  int v2 = [(AFConnection *)self _connection];
  id v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)_clearAssistantInfoForAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AFConnection *)self _clientService];
  [v5 _clearAssistantInfoForAccountIdentifier:v4];
}

- (void)_barrier
{
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __34__AFConnection_Internal___barrier__block_invoke;
  v10[3] = &unk_1E592C248;
  id v4 = v3;
  id v11 = v4;
  id v5 = [(AFConnection *)self _clientServiceWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __34__AFConnection_Internal___barrier__block_invoke_2;
  v8[3] = &unk_1E592C678;
  BOOL v9 = v4;
  id v6 = v4;
  [v5 _barrierWithReply:v8];

  dispatch_time_t v7 = dispatch_time(0, 2000000000);
  dispatch_semaphore_wait(v6, v7);
}

intptr_t __34__AFConnection_Internal___barrier__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __34__AFConnection_Internal___barrier__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_activeRequestUUID
{
  return self->_activeRequestUUID;
}

@end