@interface AFUISiriSession
+ (id)effectiveCoreLocationBundle;
+ (unint64_t)availabilityState;
+ (void)availabilityState;
+ (void)beginMonitoringSiriAvailability;
- (AFAnalyticsTurnBasedInstrumentationContext)_instrumentationTurnContext;
- (AFConnection)_connection;
- (AFUISiriSession)initWithConnection:(id)a3 delegateQueue:(id)a4 requestSource:(int64_t)a5;
- (AFUISiriSessionDelegate)delegate;
- (AFUISiriSessionLocalDataSource)localDataSource;
- (AFUISiriSessionLocalDelegate)localDelegate;
- (BOOL)_aceObjectExpectsTurnIdentifierWhenSendingCommand:(id)a3;
- (BOOL)_hasActiveRequest;
- (BOOL)_isContinuousConversationAvailable;
- (BOOL)_shouldFetchActiveAccount;
- (BOOL)_shouldRetainConnectionForRequestSource:(int64_t)a3;
- (BOOL)attendingState;
- (BOOL)isEyesFree;
- (BOOL)isListening;
- (BOOL)isProcessingAcousticIdRequest;
- (BOOL)speechRequestHandlerShouldRollBackRequestForSpeechCancellation:(id)a3;
- (NSArray)directActionApplicationContexts;
- (NSArray)sessionDelegateContext;
- (SRUIFAudioPowerLevelUpdater)_audioPowerLevelUpdater;
- (SRUIFSiriSessionInfo)siriSessionInfo;
- (SRUIFSiriSessionStateHandler)_stateHandler;
- (SRUIFSiriStateResponding)visualIntelligenceCameraDelegate;
- (SRUIFSpeechRequestHandler)speechRequestHandler;
- (SRUIFUIBridgeClient)_uiBridgeClient;
- (SRUIFWatchAuthenticationManager)_watchAuthenticationManager;
- (float)recordingPowerLevel;
- (id)_getMissingAssetTypes:(id)a3;
- (id)_invocationContextFromTVRemoteType:(unint64_t)a3;
- (id)_invocationEventForRequestOptions:(id)a3 localDataSource:(id)a4;
- (id)_modeOverrideValue;
- (id)_preparedSpeechRequestWithRequestOptions:(id)a3;
- (id)_processInstrumentationForFinalOptionsAndGenerateNewTurn:(id)a3;
- (id)_setRefIdForAllViewsInAddViews:(id)a3;
- (id)_startingRecordingAlertPolicyForSoundID:(id)a3;
- (id)_tamaleDirectActionRequest;
- (id)safeWrapResponseCompletion:(id)a3;
- (id)underlyingConnection;
- (int)_mapInvocationSource:(int64_t)a3;
- (void)_applePaySheetPresented;
- (void)_connection;
- (void)_discardConnectionForReason:(int64_t)a3;
- (void)_handleDidChangeAudioRecordingPower;
- (void)_handlePlayAudioCommand:(id)a3 completion:(id)a4;
- (void)_handleRequestUpdateViewsCommand:(id)a3 completion:(id)a4;
- (void)_handleSuppressDelayFeedbackCommand:(id)a3 completion:(id)a4;
- (void)_handleUnlockAppCommand:(id)a3 completion:(id)a4;
- (void)_handleUnlockDeviceCommand:(id)a3 completion:(id)a4;
- (void)_handleUnlockDeviceWithWatchCommand:(id)a3 completion:(id)a4;
- (void)_localAuthenticationUIPresented;
- (void)_performAceCommand:(id)a3 forRequestUpdateViewsCommand:(id)a4 afterDelay:(double)a5;
- (void)_performAceCommand:(id)a3 turnIdentifier:(id)a4 machAbsoluteTime:(double)a5 conflictHandler:(id)a6;
- (void)_performAceCommands:(id)a3;
- (void)_performBlockWithDelegate:(id)a3;
- (void)_performPunchoutCommand:(id)a3 delegate:(id)a4 completion:(id)a5;
- (void)_playPhaticWithCompletion:(id)a3;
- (void)_populateModesConfiguration:(id)a3 attentionType:(unint64_t)a4 value:(BOOL)a5;
- (void)_requestDidFinishWithError:(id)a3;
- (void)_requestStartedWithInfo:(id)a3;
- (void)_sendContextWithCompletion:(id)a3;
- (void)_setInstrumentationTurnContext:(id)a3;
- (void)_setWatchAuthenticationManager:(id)a3;
- (void)_setupConnectionIfNeeded;
- (void)_siriNetworkAvailabilityDidChange:(id)a3;
- (void)_startContinuityRequestWithInfo:(id)a3 completion:(id)a4;
- (void)_startLegacyDirectActionRequestWithInfo:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_startQuickTypeTamaleRequestWith:(id)a3 completion:(id)a4;
- (void)_startRequestForReadoutOfBulletin:(id)a3;
- (void)_startRequestWithBlock:(id)a3;
- (void)_startRequestWithFinalOptions:(id)a3 completion:(id)a4;
- (void)_startRequestWithInfo:(id)a3 completion:(id)a4;
- (void)_startRequestWithText:(id)a3 turnIdentifier:(id)a4 completion:(id)a5;
- (void)_startSpeechPronunciationRequestWithContext:(id)a3 options:(id)a4 completion:(id)a5;
- (void)_startSpeechRequestWithOptions:(id)a3 completion:(id)a4;
- (void)_startSpeechRequestWithSpeechFileAtURL:(id)a3 completion:(id)a4;
- (void)_startSpeechRequestWithSpeechRequestOptions:(id)a3 isInitialBringUp:(BOOL)a4 completion:(id)a5;
- (void)_updateActiveAccount:(id)a3;
- (void)_updateActiveAccount:(id)a3 withNumberOfActiveAccounts:(unint64_t)a4;
- (void)_updateAssistantVersion:(id)a3;
- (void)_updateCarPlayInvocationContext:(id)a3 fromDirectActionEvent:(int64_t)a4 appBundleIdentifier:(id)a5;
- (void)_updateModesConfigurationForAttentionType:(unint64_t)a3 value:(BOOL)a4;
- (void)_updateModesHeuristicsForRequestOptions:(id)a3;
- (void)assistantConnection:(id)a3 appLaunchFailedWithBundleIdentifier:(id)a4;
- (void)assistantConnection:(id)a3 didChangeAudioSessionID:(unsigned int)a4;
- (void)assistantConnection:(id)a3 didFinishAcousticIDRequestWithSuccess:(BOOL)a4;
- (void)assistantConnection:(id)a3 didLoadAssistant:(id)a4;
- (void)assistantConnection:(id)a3 didStartAudioPlaybackRequest:(id)a4;
- (void)assistantConnection:(id)a3 didUpdateResponseMode:(id)a4;
- (void)assistantConnection:(id)a3 dismissAssistantWithReason:(int64_t)a4;
- (void)assistantConnection:(id)a3 extensionRequestFinishedForApplication:(id)a4 error:(id)a5;
- (void)assistantConnection:(id)a3 extensionRequestWillStartForApplication:(id)a4;
- (void)assistantConnection:(id)a3 openURL:(id)a4 completion:(id)a5;
- (void)assistantConnection:(id)a3 receivedCommand:(id)a4 completion:(id)a5;
- (void)assistantConnection:(id)a3 recognitionUpdateWithPhrases:(id)a4 utterances:(id)a5 refId:(id)a6;
- (void)assistantConnection:(id)a3 recognizedAdditionalSpeechInterpretation:(id)a4 refId:(id)a5;
- (void)assistantConnection:(id)a3 requestFailedWithError:(id)a4 requestClass:(id)a5;
- (void)assistantConnection:(id)a3 speechRecognized:(id)a4;
- (void)assistantConnection:(id)a3 speechRecognizedPartialResult:(id)a4;
- (void)assistantConnection:(id)a3 speechRecordingDidBeginOnAVRecordRoute:(id)a4 audioSessionID:(unsigned int)a5;
- (void)assistantConnection:(id)a3 speechRecordingDidChangeAVRecordRoute:(id)a4;
- (void)assistantConnection:(id)a3 speechRecordingDidFail:(id)a4;
- (void)assistantConnection:(id)a3 speechRecordingPerformTwoShotPromptWithType:(int64_t)a4 completion:(id)a5;
- (void)assistantConnection:(id)a3 startPlaybackDidFail:(int64_t)a4;
- (void)assistantConnection:(id)a3 startUIRequestWithText:(id)a4 completion:(id)a5;
- (void)assistantConnection:(id)a3 wantsToCacheImage:(id)a4;
- (void)assistantConnection:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4;
- (void)assistantConnection:(id)a3 willProcessStartPlayback:(int64_t)a4 intent:(id)a5 completion:(id)a6;
- (void)assistantConnectionAudioSessionDidBeginInterruption:(id)a3 userInfo:(id)a4;
- (void)assistantConnectionAudioSessionDidEndInterruption:(id)a3 shouldResume:(BOOL)a4 userInfo:(id)a5;
- (void)assistantConnectionDidChangeAudioRecordingPower:(id)a3;
- (void)assistantConnectionDidDetectMusic:(id)a3;
- (void)assistantConnectionDismissAssistant:(id)a3;
- (void)assistantConnectionRequestFinished:(id)a3;
- (void)assistantConnectionRequestWillStart:(id)a3;
- (void)assistantConnectionSpeechRecordingDidCancel:(id)a3;
- (void)assistantConnectionSpeechRecordingDidDetectStartpoint:(id)a3;
- (void)assistantConnectionSpeechRecordingDidEnd:(id)a3;
- (void)assistantConnectionSpeechRecordingWillBegin:(id)a3;
- (void)assistantConnectionUpdatedSpeechEndEstimate:(id)a3 speechEndEstimate:(unint64_t)a4;
- (void)assistantConnectionWillStartAcousticIDRequest:(id)a3;
- (void)audioRoutePickerWillDismiss;
- (void)audioRoutePickerWillShow;
- (void)cancelPhotoSelectionWithAnimation:(BOOL)a3;
- (void)cancelSpeechRequest;
- (void)clearContext;
- (void)dealloc;
- (void)didGainAttentionWithEvent:(int64_t)a3;
- (void)didLoseAttentionWithEvent:(int64_t)a3;
- (void)duckTTSToVolume:(float)a3 rampTime:(double)a4 completion:(id)a5;
- (void)emitSiriWasUnavailableEventWithRequestOptions:(id)a3;
- (void)end;
- (void)endForReason:(int64_t)a3;
- (void)fetchAttendingState:(id)a3;
- (void)forceAudioSessionActive;
- (void)forceAudioSessionActiveWithCompletion:(id)a3;
- (void)forceAudioSessionInactive;
- (void)idleAndQuietStatusDidChange:(BOOL)a3;
- (void)launchedIntoListeningAtTime:(double)a3;
- (void)notifyStateManagerPresentationTransitionBegan;
- (void)notifyStateManagerPresentationTransitionEnded;
- (void)notifyStateManagerSpeakingBegan;
- (void)notifyStateManagerSpeakingEnded;
- (void)notifyStateManagerTransactionBegan;
- (void)notifyStateManagerTransactionEnded;
- (void)orchestrationBeganTaskWithIdentifier:(id)a3;
- (void)orchestrationDidPresentResponseFullyInApp;
- (void)performAceCommand:(id)a3 turnIdentifier:(id)a4 machAbsoluteTime:(double)a5;
- (void)preheat;
- (void)promptedUserForInput;
- (void)receivedLatencyInformation:(id)a3;
- (void)recordMetricsContext:(id)a3 forDisambiguatedAppWIthBundleIdentifier:(id)a4;
- (void)recordRequestMetricEvent:(id)a3 withTimestamp:(double)a4;
- (void)recordUIMetrics:(id)a3;
- (void)requestDidPresentViewForErrorCommand:(id)a3;
- (void)requestDidPresentViewForUICommand:(id)a3;
- (void)requestPhotoSelectionWithSearchString:(id)a3 completion:(id)a4;
- (void)resetContextTypes:(int64_t)a3;
- (void)resultDidChangeForAceCommand:(id)a3;
- (void)resultDidChangeForAceCommand:(id)a3 completion:(id)a4;
- (void)resumeInterruptedAudioPlaybackIfNeeded;
- (void)rollbackClearContext;
- (void)sessionStateHandler:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 forEvent:(int64_t)a6 machAbsoluteTime:(double)a7;
- (void)setAlertContext;
- (void)setAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a3;
- (void)setApplicationContext;
- (void)setApplicationContextForDirectAction:(BOOL)a3;
- (void)setCarDNDActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceInStarkMode:(BOOL)a3;
- (void)setDirectActionApplicationContexts:(id)a3;
- (void)setEyesFree:(BOOL)a3;
- (void)setLocalDataSource:(id)a3;
- (void)setLocalDelegate:(id)a3;
- (void)setLockState:(unint64_t)a3;
- (void)setSessionDelegateContext:(id)a3;
- (void)setSiriSessionInfo:(id)a3;
- (void)setSpeechRequestHandler:(id)a3;
- (void)setSupportsCarPlayVehicleData:(BOOL)a3;
- (void)setVisualIntelligenceCameraDelegate:(id)a3;
- (void)setWatchAuthenticated:(BOOL)a3;
- (void)showAssetsDownloadNotificationPrompt;
- (void)siriUIDidPresentDynamicSnippetWithInfo:(id)a3;
- (void)speechRequestHandlerDidCancelSpeechRequest:(id)a3;
- (void)speechRequestHandlerWillCancelSpeechRequest:(id)a3;
- (void)speechSynthesisDidFinish:(id)a3;
- (void)speechSynthesisDidUpdatePowerLevelTo:(float)a3;
- (void)startCorrectedRequestWithText:(id)a3 correctionIdentifier:(id)a4 userSelectionResults:(id)a5 turnIdentifier:(id)a6 machAbsoluteTime:(double)a7;
- (void)startRequestWithOptions:(id)a3;
- (void)startRequestWithOptions:(id)a3 completion:(id)a4;
- (void)stateFeedbackManagerDidStartPlaybackForStateFeedbackType:(int64_t)a3;
- (void)stopAttending;
- (void)stopRecordingSpeech;
- (void)stopRequestWithOptions:(id)a3;
- (void)telephonyRequestCompleted;
- (void)updateRequestOptions:(id)a3;
@end

@implementation AFUISiriSession

- (AFUISiriSession)initWithConnection:(id)a3 delegateQueue:(id)a4 requestSource:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v36.receiver = self;
  v36.super_class = (Class)AFUISiriSession;
  v11 = [(AFUISiriSession *)&v36 init];
  if (v11)
  {
    if (!v10)
    {
      v35 = [MEMORY[0x263F08690] currentHandler];
      [v35 handleFailureInMethod:a2 object:v11 file:@"AFUISiriSession.m" lineNumber:241 description:@"Session must have a delegate queue"];
    }
    objc_storeStrong((id *)&v11->_delegateQueue, a4);
    v11->_currentRequestDidPresent = 1;
    if ([(AFUISiriSession *)v11 _shouldRetainConnectionForRequestSource:a5])
    {
      if (v9) {
        v12 = (AFConnection *)v9;
      }
      else {
        v12 = (AFConnection *)objc_alloc_init(MEMORY[0x263F284A0]);
      }
      connection = v11->_connection;
      v11->_connection = v12;
    }
    v14 = v11->_connection;
    if (v14)
    {
      [(AFConnection *)v14 setDelegate:v11];
      [(AFConnection *)v11->_connection setSpeechDelegate:v11];
      v15 = (void *)[objc_alloc(MEMORY[0x263F754E8]) initWithConnection:v11->_connection];
      uint64_t v16 = [objc_alloc(MEMORY[0x263F754F0]) initWithStateFeedbackProvider:v15 delegate:v11];
      stateFeedbackManager = v11->_stateFeedbackManager;
      v11->_stateFeedbackManager = (SRUIFStateFeedbackManager *)v16;
    }
    v18 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x263F285E0]);
    settingsConnection = v11->_settingsConnection;
    v11->_settingsConnection = v18;

    v20 = (SRUIFSiriSessionInfo *)objc_alloc_init(MEMORY[0x263F754C8]);
    siriSessionInfo = v11->_siriSessionInfo;
    v11->_siriSessionInfo = v20;

    v22 = [MEMORY[0x263F08A00] defaultCenter];
    [v22 addObserver:v11 selector:sel__siriNetworkAvailabilityDidChange_ name:*MEMORY[0x263F282F8] object:0];

    uint64_t v23 = [MEMORY[0x263F28608] sharedManager];
    clientStateManager = v11->_clientStateManager;
    v11->_clientStateManager = (AFSiriClientStateManager *)v23;

    uint64_t v25 = [objc_alloc(MEMORY[0x263F754D0]) initWithDelegate:v11];
    stateHandler = v11->_stateHandler;
    v11->_stateHandler = (SRUIFSiriSessionStateHandler *)v25;

    uint64_t v27 = [objc_alloc(MEMORY[0x263F754E0]) initWithDelegate:v11];
    speechRequestHandler = v11->_speechRequestHandler;
    v11->_speechRequestHandler = (SRUIFSpeechRequestHandler *)v27;

    id v29 = objc_alloc(MEMORY[0x263F75500]);
    uint64_t v30 = [v29 initWithStateHandler:v11->_stateHandler delegateQueue:MEMORY[0x263EF83A0]];
    uiBridgeClient = v11->_uiBridgeClient;
    v11->_uiBridgeClient = (SRUIFUIBridgeClient *)v30;

    [(SRUIFUIBridgeClient *)v11->_uiBridgeClient setDelegate:v11];
    if ([MEMORY[0x263F28510] isContinuousConversationEnabled])
    {
      uint64_t v32 = [objc_alloc(MEMORY[0x263F75480]) initWithDelegate:v11];
      audioPowerLevelUpdater = v11->_audioPowerLevelUpdater;
      v11->_audioPowerLevelUpdater = (SRUIFAudioPowerLevelUpdater *)v32;
    }
  }

  return v11;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [(AFUISiriSession *)self _connection];

  if (v3)
  {
    v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v11 = "-[AFUISiriSession dealloc]";
      _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #session AFConnection was still alive when AFUISiriSession was being deallocated. Cleaning up the connection…", buf, 0xCu);
    }
    [(AFUISiriSession *)self _discardConnectionForReason:0];
  }
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.LocalAuthentication.ui.presented", 0);
  v7 = CFNotificationCenterGetDarwinNotifyCenter();
  getOptionalPKDarwinNotificationEventInAppPresented();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(v7, self, v8, 0);

  v9.receiver = self;
  v9.super_class = (Class)AFUISiriSession;
  [(AFUISiriSession *)&v9 dealloc];
}

- (void)_setupConnectionIfNeeded
{
  if (!self->_connection)
  {
    v3 = (AFConnection *)objc_alloc_init(MEMORY[0x263F284A0]);
    connection = self->_connection;
    self->_connection = v3;

    [(AFConnection *)self->_connection setDelegate:self];
    [(AFConnection *)self->_connection setSpeechDelegate:self];
    id v7 = (id)[objc_alloc(MEMORY[0x263F754E8]) initWithConnection:self->_connection];
    v5 = (SRUIFStateFeedbackManager *)[objc_alloc(MEMORY[0x263F754F0]) initWithStateFeedbackProvider:v7 delegate:self];
    stateFeedbackManager = self->_stateFeedbackManager;
    self->_stateFeedbackManager = v5;

    [(AFUISiriSession *)self resetContextTypes:4];
  }
}

- (BOOL)_shouldRetainConnectionForRequestSource:(int64_t)a3
{
  return a3 != 53;
}

- (void)_siriNetworkAvailabilityDidChange:(id)a3
{
}

uint64_t __53__AFUISiriSession__siriNetworkAvailabilityDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidChangeNetworkAvailability];
}

- (AFConnection)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[AFUISiriSession _connection]();
    }
    connection = self->_connection;
  }

  return connection;
}

- (void)sessionStateHandler:(id)a3 didTransitionFromState:(int64_t)a4 toState:(int64_t)a5 forEvent:(int64_t)a6 machAbsoluteTime:(double)a7
{
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __96__AFUISiriSession_sessionStateHandler_didTransitionFromState_toState_forEvent_machAbsoluteTime___block_invoke;
  v13[3] = &__block_descriptor_64_e35_v16__0___AFUISiriSessionDelegate__8l;
  v13[4] = a4;
  v13[5] = a5;
  v13[6] = a6;
  *(double *)&v13[7] = a7;
  [(AFUISiriSession *)self _performBlockWithDelegate:v13];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  [WeakRetained siriSession:self didChangeToState:a5 event:a6 machAbsoluteTransitionTime:a7];

  [(SRUIFStateFeedbackManager *)self->_stateFeedbackManager didTransitionFromState:a4 toState:a5 event:a6 machAbsoluteTransitionTime:a7];
  [(SRUIFAudioPowerLevelUpdater *)self->_audioPowerLevelUpdater sessionStateDidChangeTo:a5 isAttending:[(AFUISiriSession *)self attendingState]];
}

uint64_t __96__AFUISiriSession_sessionStateHandler_didTransitionFromState_toState_forEvent_machAbsoluteTime___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidTransitionFromState:*(void *)(a1 + 32) toState:*(void *)(a1 + 40) event:*(void *)(a1 + 48) machAbsoluteTransitionTime:*(double *)(a1 + 56)];
}

- (void)speechRequestHandlerWillCancelSpeechRequest:(id)a3
{
}

uint64_t __63__AFUISiriSession_speechRequestHandlerWillCancelSpeechRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionWillCancelRequest];
}

- (void)speechRequestHandlerDidCancelSpeechRequest:(id)a3
{
  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:5];

  [(AFUISiriSession *)self _requestDidFinishWithError:0];
}

- (BOOL)speechRequestHandlerShouldRollBackRequestForSpeechCancellation:(id)a3
{
  BOOL v4 = [(AFUISiriSession *)self _hasActiveRequest];
  if (v4) {
    LOBYTE(v4) = !self->_currentRequestDidPresent;
  }
  return v4;
}

- (void)duckTTSToVolume:(float)a3 rampTime:(double)a4 completion:(id)a5
{
}

- (void)showAssetsDownloadNotificationPrompt
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if ([(AFUISiriSession *)self _isContinuousConversationAvailable])
  {
    v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      v5 = "-[AFUISiriSession showAssetsDownloadNotificationPrompt]";
      _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s client received request to show Advanced Features assets download notification.", (uint8_t *)&v4, 0xCu);
    }
    [(AFUISiriSessionDelegate *)self->_delegate siriSessionRequestsToShowAssetsDownloadNotificationPrompt];
  }
}

- (void)cancelPhotoSelectionWithAnimation:(BOOL)a3
{
}

- (void)requestPhotoSelectionWithSearchString:(id)a3 completion:(id)a4
{
}

- (void)receivedLatencyInformation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__AFUISiriSession_receivedLatencyInformation___block_invoke;
  v6[3] = &unk_264691DF0;
  id v7 = v4;
  id v5 = v4;
  [(AFUISiriSession *)self _performBlockWithDelegate:v6];
}

uint64_t __46__AFUISiriSession_receivedLatencyInformation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidReceiveLatencyInformation:*(void *)(a1 + 32)];
}

- (void)orchestrationBeganTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__AFUISiriSession_orchestrationBeganTaskWithIdentifier___block_invoke;
  v6[3] = &unk_264691DF0;
  id v7 = v4;
  id v5 = v4;
  [(AFUISiriSession *)self _performBlockWithDelegate:v6];
}

uint64_t __56__AFUISiriSession_orchestrationBeganTaskWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidBeginTaskWithIdentifier:*(void *)(a1 + 32)];
}

- (void)orchestrationDidPresentResponseFullyInApp
{
}

- (void)setDelegate:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_delegate, a3);
  if (self->_siriSessionInfo && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __31__AFUISiriSession_setDelegate___block_invoke;
    v6[3] = &unk_264691DF0;
    void v6[4] = self;
    [(AFUISiriSession *)self _performBlockWithDelegate:v6];
  }
}

uint64_t __31__AFUISiriSession_setDelegate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidInitializeSessionInfo:*(void *)(*(void *)(a1 + 32) + 120)];
}

- (void)_performBlockWithDelegate:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__AFUISiriSession__performBlockWithDelegate___block_invoke;
  block[3] = &unk_264691E18;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

uint64_t __45__AFUISiriSession__performBlockWithDelegate___block_invoke(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 40))) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }

  return MEMORY[0x270F9A758]();
}

- (void)idleAndQuietStatusDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AFUISiriSession *)self _isContinuousConversationAvailable])
  {
    uiBridgeClient = self->_uiBridgeClient;
    [(SRUIFUIBridgeClient *)uiBridgeClient idleAndQuietDidChange:v3];
  }
}

- (void)stateFeedbackManagerDidStartPlaybackForStateFeedbackType:(int64_t)a3
{
  if (!a3)
  {
    [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:15];
    [(AFUISiriSession *)self _performBlockWithDelegate:&__block_literal_global_51];
  }
}

uint64_t __76__AFUISiriSession_stateFeedbackManagerDidStartPlaybackForStateFeedbackType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidEnterLatencyState];
}

- (void)setLocalDataSource:(id)a3
{
}

- (void)preheat
{
  id v2 = [(AFUISiriSession *)self _connection];
  [v2 preheatWithStyle:1];
}

- (void)forceAudioSessionActive
{
}

- (void)launchedIntoListeningAtTime:(double)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[AFUISiriSession launchedIntoListeningAtTime:]";
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:14 eventTimeStamp:a3];
}

- (void)forceAudioSessionActiveWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__AFUISiriSession_forceAudioSessionActiveWithCompletion___block_invoke;
  aBlock[3] = &unk_264691E40;
  id v5 = v4;
  id v13 = v5;
  int v6 = _Block_copy(aBlock);
  BOOL isDeviceInStarkMode = self->_isDeviceInStarkMode;
  uint64_t v8 = *MEMORY[0x263F28348];
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (isDeviceInStarkMode)
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[AFUISiriSession forceAudioSessionActiveWithCompletion:]";
      _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s #tts #carPlay AudioSession CarPlay", buf, 0xCu);
    }
    id v10 = [(AFUISiriSession *)self _connection];
    v11 = (void *)[objc_alloc(MEMORY[0x263F28690]) initWithActivationEvent:9];
    [v10 forceAudioSessionActiveWithOptions:1 reason:3 speechRequestOptions:v11 completion:v6];
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[AFUISiriSession forceAudioSessionActiveWithCompletion:]";
      _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s #tts AudioSession", buf, 0xCu);
    }
    id v10 = [(AFUISiriSession *)self _connection];
    [v10 forceAudioSessionActiveWithOptions:1 reason:3 completion:v6];
  }
}

void __57__AFUISiriSession_forceAudioSessionActiveWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"Success";
    int v9 = 136315650;
    id v10 = "-[AFUISiriSession forceAudioSessionActiveWithCompletion:]_block_invoke";
    if (v5) {
      id v7 = v5;
    }
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 1024;
    int v14 = a2;
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s #tts AudioSession Handler:%@ audioSessionID:%u", (uint8_t *)&v9, 0x1Cu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, __CFString *))(v8 + 16))(v8, a2, v5);
  }
}

- (void)forceAudioSessionInactive
{
  id v2 = [(AFUISiriSession *)self _connection];
  [v2 forceAudioSessionInactive];
}

- (void)resumeInterruptedAudioPlaybackIfNeeded
{
  id v2 = [(AFUISiriSession *)self _connection];
  [v2 resumeInterruptedAudioPlaybackIfNeeded];
}

+ (unint64_t)availabilityState
{
  if (AFHasUnlockedSinceBoot())
  {
    id v2 = [MEMORY[0x263F75488] sharedInstance];
    int v3 = [v2 understandingOnDeviceAssetsAvailable];
    if ((v3 & 1) == 0)
    {
      id v4 = (os_log_t *)MEMORY[0x263F28348];
      id v5 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        +[AFUISiriSession availabilityState];
      }
      if (AFDeviceSupportsDisablingServerFallbackWhenMissingAsset())
      {
        __int16 v13 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR)) {
          +[AFUISiriSession availabilityState];
        }
        unint64_t v21 = 3;
        goto LABEL_20;
      }
    }
    if ([MEMORY[0x263F284A0] isAvailable])
    {
      if ((v3 | [MEMORY[0x263F284A0] isNetworkAvailable]))
      {
        unint64_t v21 = 0;
LABEL_20:

        return v21;
      }
      v38 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        +[AFUISiriSession availabilityState];
      }
    }
    else
    {
      uint64_t v30 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        +[AFUISiriSession availabilityState];
      }
    }
    unint64_t v21 = 1;
    goto LABEL_20;
  }
  v22 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    +[AFUISiriSession availabilityState];
  }
  return 2;
}

+ (void)beginMonitoringSiriAvailability
{
}

- (void)emitSiriWasUnavailableEventWithRequestOptions:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = mach_absolute_time();
  uint64_t v6 = [(AFUISiriSession *)self _processInstrumentationForFinalOptionsAndGenerateNewTurn:v4];
  uint64_t v7 = [(AFUISiriSession *)self localDataSource];
  uint64_t v8 = [(AFUISiriSession *)self _invocationEventForRequestOptions:v4 localDataSource:v7];

  uint64_t v9 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v10 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = v10;
    uint64_t v12 = [v6 turnIdentifier];
    __int16 v13 = [v8 formattedText];
    int v22 = 136315906;
    uint64_t v23 = "-[AFUISiriSession emitSiriWasUnavailableEventWithRequestOptions:]";
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    uint64_t v27 = v12;
    __int16 v28 = 2112;
    uint64_t v29 = v13;
    _os_log_impl(&dword_223099000, v11, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", (uint8_t *)&v22, 0x2Au);
  }
  [v6 emitInstrumentation:v8 machAbsoluteTime:v5];
  id v14 = objc_alloc_init(MEMORY[0x263F6EE68]);
  [v14 setReason:2];
  [v14 setProduct:1];
  uint64_t v15 = [MEMORY[0x263F75488] sharedInstance];
  uint64_t v16 = [v15 assistantUODStatus];

  if (v16 && [v16 count])
  {
    uint64_t v17 = [(AFUISiriSession *)self _getMissingAssetTypes:v16];
    [v14 setAssetTypes:v17];
  }
  os_log_t v18 = *v9;
  if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v18;
    uint64_t v20 = [v6 turnIdentifier];
    unint64_t v21 = [v14 formattedText];
    int v22 = 136315906;
    uint64_t v23 = "-[AFUISiriSession emitSiriWasUnavailableEventWithRequestOptions:]";
    __int16 v24 = 2112;
    id v25 = v14;
    __int16 v26 = 2112;
    uint64_t v27 = v20;
    __int16 v28 = 2112;
    uint64_t v29 = v21;
    _os_log_impl(&dword_223099000, v19, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", (uint8_t *)&v22, 0x2Au);
  }
  [v6 emitInstrumentation:v14 machAbsoluteTime:v5];
}

- (id)_getMissingAssetTypes:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = [v3 objectForKey:@"SPEECH"];

  if (v5)
  {
    uint64_t v6 = [NSNumber numberWithInt:1];
    [v4 addObject:v6];
  }
  uint64_t v7 = [v3 objectForKey:@"NL"];

  if (v7)
  {
    uint64_t v8 = [NSNumber numberWithInt:2];
    [v4 addObject:v8];
  }
  uint64_t v9 = [v3 objectForKey:@"MORPHUN"];

  if (v9)
  {
    uint64_t v10 = [NSNumber numberWithInt:3];
    [v4 addObject:v10];
  }
  uint64_t v11 = [v3 objectForKey:@"ATTENTION"];

  if (v11)
  {
    uint64_t v12 = [NSNumber numberWithInt:4];
    [v4 addObject:v12];
  }
  __int16 v13 = [v3 objectForKey:@"NLROUTER"];

  if (v13)
  {
    id v14 = [NSNumber numberWithInt:5];
    [v4 addObject:v14];
  }
  if (![v4 count] && os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
    -[AFUISiriSession _getMissingAssetTypes:]();
  }

  return v4;
}

- (BOOL)_isContinuousConversationAvailable
{
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    if (self->_isDeviceInStarkMode)
    {
      LOBYTE(v3) = _os_feature_enabled_impl();
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)_processInstrumentationForFinalOptionsAndGenerateNewTurn:(id)a3
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  id v82 = a3;
  val = self;
  id v4 = [(AFUISiriSession *)self localDataSource];
  v81 = [(AFUISiriSession *)val _invocationEventForRequestOptions:v82 localDataSource:v4];

  if ([v81 invocationSource] != 52)
  {
    if ([v81 invocationSource] == 48)
    {
      __int16 v13 = [MEMORY[0x263F754A8] sharedManager];
      id v14 = [v13 latestStoredTurn];

      id v80 = (id)[MEMORY[0x263F28400] newTurnBasedContextWithPreviousTurnID:v14];
      uint64_t v15 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = v15;
        uint64_t v17 = [v80 turnIdentifier];
        *(_DWORD *)buf = 136315650;
        v97 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
        __int16 v98 = 2112;
        id v99 = v17;
        __int16 v100 = 2112;
        v101 = v14;
        _os_log_impl(&dword_223099000, v16, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", buf, 0x20u);
      }
    }
    else if ([v81 invocationSource] == 92)
    {
      os_log_t v18 = [MEMORY[0x263F754A8] sharedManager];
      id v14 = [v18 latestResponseProducingTurn];

      id v80 = (id)[MEMORY[0x263F28400] newTurnBasedContextWithPreviousTurnID:v14];
      uint64_t v19 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = v19;
        unint64_t v21 = [v80 turnIdentifier];
        *(_DWORD *)buf = 136315650;
        v97 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
        __int16 v98 = 2112;
        id v99 = v21;
        __int16 v100 = 2112;
        v101 = v14;
        _os_log_impl(&dword_223099000, v20, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", buf, 0x20u);
      }
    }
    else
    {
      if ([v81 invocationSource] != 29)
      {
        uint64_t v31 = [MEMORY[0x263F283F8] sharedAnalytics];
        uint64_t v32 = (void *)[v31 newTurnBasedInstrumentationContext];

        uint64_t v33 = (void *)*MEMORY[0x263F28348];
        char v78 = 0;
        id v80 = v32;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_24;
        }
        uint64_t v34 = v33;
        uint64_t v35 = [v32 turnIdentifier];
        *(_DWORD *)buf = 136315394;
        v97 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
        __int16 v98 = 2112;
        id v99 = v35;
        _os_log_impl(&dword_223099000, v34, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ ", buf, 0x16u);

        goto LABEL_23;
      }
      uint64_t v27 = [MEMORY[0x263F754A8] sharedManager];
      id v14 = [v27 latestStoredTurn];

      id v80 = (id)[MEMORY[0x263F28400] newTurnBasedContextWithPreviousTurnID:v14];
      __int16 v28 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = v28;
        uint64_t v30 = [v80 turnIdentifier];
        *(_DWORD *)buf = 136315650;
        v97 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
        __int16 v98 = 2112;
        id v99 = v30;
        __int16 v100 = 2112;
        v101 = v14;
        _os_log_impl(&dword_223099000, v29, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", buf, 0x20u);
      }
    }

LABEL_23:
    char v78 = 0;
    goto LABEL_24;
  }
  uint64_t v5 = [v82 previousTurnIdentifier];

  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x263F28400];
    uint64_t v7 = [v82 previousTurnIdentifier];
    uint64_t v8 = (void *)[v6 newTurnBasedContextWithPreviousTurnID:v7];

    uint64_t v9 = (void *)*MEMORY[0x263F28348];
    id v80 = v8;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = v9;
      uint64_t v11 = [v8 turnIdentifier];
      uint64_t v12 = [v82 previousTurnIdentifier];
      *(_DWORD *)buf = 136315650;
      v97 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
      __int16 v98 = 2112;
      id v99 = v11;
      __int16 v100 = 2112;
      v101 = v12;
      _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", buf, 0x20u);
    }
    goto LABEL_23;
  }
  int v22 = [MEMORY[0x263F283F8] sharedAnalytics];
  uint64_t v23 = (void *)[v22 newTurnBasedInstrumentationContext];

  __int16 v24 = (void *)*MEMORY[0x263F28348];
  id v80 = v23;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v25 = v24;
    __int16 v26 = [v23 turnIdentifier];
    *(_DWORD *)buf = 136315394;
    v97 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
    __int16 v98 = 2112;
    id v99 = v26;
    _os_log_impl(&dword_223099000, v25, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ ", buf, 0x16u);
  }
  char v78 = 1;
LABEL_24:
  if ([v82 isInitialBringUp])
  {
    objc_initWeak((id *)buf, val);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__AFUISiriSession__processInstrumentationForFinalOptionsAndGenerateNewTurn___block_invoke;
    block[3] = &unk_264691C90;
    objc_copyWeak(&v94, (id *)buf);
    id v93 = v80;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v94);
    objc_destroyWeak((id *)buf);
  }
  [(AFUISiriSession *)val _setInstrumentationTurnContext:v80];
  if ([v82 isTypeToSiriRequest])
  {
    uint64_t v36 = [v82 text];
    if ([v36 length])
    {
      int v37 = [MEMORY[0x263F286B8] isSAEEnabled];

      if (!v37) {
        goto LABEL_33;
      }
      id v38 = objc_alloc(MEMORY[0x263F6EEE0]);
      id v39 = objc_alloc_init(MEMORY[0x263F08C38]);
      uint64_t v36 = (void *)[v38 initWithNSUUID:v39];

      id v40 = objc_alloc_init(MEMORY[0x263F6EE40]);
      [v40 setLinkId:v36];
      [v40 setHasLinkId:1];
      uint64_t v41 = [v82 text];
      [v40 setTypedText:v41];

      [v81 setLinkId:v36];
      [v81 setHasLinkId:1];
      uint64_t v42 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = v42;
        uint64_t v44 = [(AFUISiriSession *)val _instrumentationTurnContext];
        uint64_t v45 = [v44 turnIdentifier];
        v46 = [v40 formattedText];
        *(_DWORD *)buf = 136315906;
        v97 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
        __int16 v98 = 2112;
        id v99 = v40;
        __int16 v100 = 2112;
        v101 = v45;
        __int16 v102 = 2112;
        v103 = v46;
        _os_log_impl(&dword_223099000, v43, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", buf, 0x2Au);
      }
      v47 = [(AFUISiriSession *)val _instrumentationTurnContext];
      [v47 emitInstrumentation:v40 machAbsoluteTime:mach_absolute_time()];
    }
  }
LABEL_33:
  v48 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v49 = v48;
    v50 = [(AFUISiriSession *)val _instrumentationTurnContext];
    v51 = [v50 turnIdentifier];
    v52 = [v81 formattedText];
    *(_DWORD *)buf = 136315906;
    v97 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
    __int16 v98 = 2112;
    id v99 = v81;
    __int16 v100 = 2112;
    v101 = v51;
    __int16 v102 = 2112;
    v103 = v52;
    _os_log_impl(&dword_223099000, v49, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", buf, 0x2Au);
  }
  v53 = [(AFUISiriSession *)val _instrumentationTurnContext];
  [v53 emitInstrumentation:v81 machAbsoluteTime:mach_absolute_time()];

  v79 = [v82 activationEventInstrumentationIdenifier];
  if (v79)
  {
    activationInstrumentationSender = val->_activationInstrumentationSender;
    if (!activationInstrumentationSender)
    {
      id v55 = objc_alloc(MEMORY[0x263F6C700]);
      v56 = [MEMORY[0x263F6C818] sharedAnalytics];
      v57 = [v56 defaultMessageStream];
      uint64_t v58 = [v55 initWithAnalyticsStream:v57];
      v59 = val->_activationInstrumentationSender;
      val->_activationInstrumentationSender = (SASActivationInstrumentationSender *)v58;

      activationInstrumentationSender = val->_activationInstrumentationSender;
    }
    v60 = [v80 turnIdentifier];
    [(SASActivationInstrumentationSender *)activationInstrumentationSender instrumentTurnActivatedWithTurnId:v60 activationEventIdentifier:v79];

    v61 = val->_activationInstrumentationSender;
    v62 = [v80 turnIdentifier];
    [(SASActivationInstrumentationSender *)v61 instrumentRequestLinkToUEIWithTurnId:v62 activationEventIdentifier:v79];
  }
  v77 = SRUIFConstructLaunchContextForLaunchStarted();
  if ([v82 requestSource] == 22)
  {
    [v82 buttonDownTimestamp];
  }
  else if ([v82 requestSource] == 43)
  {
    [v82 computedActivationTime];
  }
  else
  {
    [v82 timestamp];
  }
  v76 = (void *)AFGetMachAbsoluteTimeFromTimeInterval();
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v63 = [v82 instrumentationEvents];
  uint64_t v64 = [v63 countByEnumeratingWithState:&v88 objects:v95 count:16];
  if (v64)
  {
    uint64_t v65 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v89 != v65) {
          objc_enumerationMutation(v63);
        }
        v67 = *(void **)(*((void *)&v88 + 1) + 8 * i);
        v68 = (void *)*MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          v69 = v68;
          v70 = [(AFUISiriSession *)val _instrumentationTurnContext];
          v71 = [v70 turnIdentifier];
          v72 = [v67 formattedText];
          *(_DWORD *)buf = 136315906;
          v97 = "-[AFUISiriSession _processInstrumentationForFinalOptionsAndGenerateNewTurn:]";
          __int16 v98 = 2112;
          id v99 = v67;
          __int16 v100 = 2112;
          v101 = v71;
          __int16 v102 = 2112;
          v103 = v72;
          _os_log_impl(&dword_223099000, v69, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", buf, 0x2Au);
        }
        v73 = [(AFUISiriSession *)val _instrumentationTurnContext];
        [v73 emitInstrumentation:v67 machAbsoluteTime:mach_absolute_time()];
      }
      uint64_t v64 = [v63 countByEnumeratingWithState:&v88 objects:v95 count:16];
    }
    while (v64);
  }

  objc_initWeak((id *)buf, val);
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __76__AFUISiriSession__processInstrumentationForFinalOptionsAndGenerateNewTurn___block_invoke_74;
  v84[3] = &unk_264691E68;
  objc_copyWeak(v86, (id *)buf);
  id v74 = v77;
  id v85 = v74;
  v86[1] = v76;
  char v87 = v78;
  [(AFUISiriSession *)val _performBlockWithDelegate:v84];

  objc_destroyWeak(v86);
  objc_destroyWeak((id *)buf);

  return v80;
}

void __76__AFUISiriSession__processInstrumentationForFinalOptionsAndGenerateNewTurn___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = objc_loadWeakRetained(WeakRetained + 14);
    [v3 siriSession:v4 initialBringupProcessedWithTurnIdentifier:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

void __76__AFUISiriSession__processInstrumentationForFinalOptionsAndGenerateNewTurn___block_invoke_74(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v5 = [WeakRetained _instrumentationTurnContext];
  [v4 siriSessionDidStartNewTurn:v5 associatedLaunchStartContext:*(void *)(a1 + 32) machAbsoluteTime:*(unsigned __int8 *)(a1 + 56) linkPreviousTurn:(double)*(unint64_t *)(a1 + 48)];
}

- (void)_startRequestWithFinalOptions:(id)a3 completion:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 requestSource] == 53)
  {
    uint64_t v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v65 = "-[AFUISiriSession _startRequestWithFinalOptions:completion:]";
      _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s request source is tostada returning early, not erroring out", buf, 0xCu);
    }
    goto LABEL_43;
  }
  uint64_t v9 = [(AFUISiriSession *)self _processInstrumentationForFinalOptionsAndGenerateNewTurn:v6];
  if (_os_feature_enabled_impl()) {
    [(AFUISiriSession *)self _updateModesHeuristicsForRequestOptions:v6];
  }
  [(AFUISiriSession *)self _setupConnectionIfNeeded];
  objc_initWeak(&location, self);
  if ([(AFUISiriSession *)self _shouldFetchActiveAccount])
  {
    uint64_t v10 = [(SRUIFSiriSessionInfo *)self->_siriSessionInfo activeAccount];
    BOOL v11 = v10 == 0;

    if (v11)
    {
      settingsConnection = self->_settingsConnection;
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke;
      v61[3] = &unk_264691EB8;
      objc_copyWeak(&v62, &location);
      [(AFSettingsConnection *)settingsConnection fetchAccountsWithCompletion:v61];
      objc_destroyWeak(&v62);
    }
  }
  __int16 v13 = [v6 requestInfo];
  id v14 = [v13 turnIdentifier];
  BOOL v15 = v14 == 0;

  if (v15)
  {
    uint64_t v16 = [(AFUISiriSession *)self _instrumentationTurnContext];
    uint64_t v17 = [v6 requestInfo];
    os_log_t v18 = [v16 turnIdentifier];
    [v17 setTurnIdentifier:v18];

    uint64_t v19 = (id)*MEMORY[0x263F28348];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [v16 turnIdentifier];
      *(_DWORD *)buf = 136315650;
      uint64_t v65 = "-[AFUISiriSession _startRequestWithFinalOptions:completion:]";
      __int16 v66 = 2112;
      id v67 = v20;
      __int16 v68 = 2112;
      id v69 = v6;
      _os_log_impl(&dword_223099000, v19, OS_LOG_TYPE_DEFAULT, "%s #instrumentation Specified turn %@ to final options %@", buf, 0x20u);
    }
  }
  if ([v6 requestSource] == 14 || objc_msgSend(v6, "requestSource") == 13)
  {
    unint64_t v21 = [v6 requestInfo];
    int v22 = [v21 startLocalRequest];

    if (v22)
    {
      uint64_t v23 = (id)*MEMORY[0x263F28348];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = [v21 startLocalRequest];
        *(_DWORD *)buf = 136315650;
        uint64_t v65 = "-[AFUISiriSession _startRequestWithFinalOptions:completion:]";
        __int16 v66 = 2112;
        id v67 = v6;
        __int16 v68 = 2112;
        id v69 = v24;
        _os_log_impl(&dword_223099000, v23, OS_LOG_TYPE_DEFAULT, "%s #activation #carPlay activating requested direct action via Native Siri Kit. SASRequestOptions: %@, SAStartLocalRequest: %@", buf, 0x20u);
      }
      objc_copyWeak(&v60, &location);
      id v58 = v21;
      id v59 = v7;
      SRUIFInvokeOnMainQueue();

      objc_destroyWeak(&v60);
    }
    else
    {
      id v25 = [v21 legacyDirectActionIdentifier];

      if (v25)
      {
        __int16 v26 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v65 = "-[AFUISiriSession _startRequestWithFinalOptions:completion:]";
          __int16 v66 = 2112;
          id v67 = v6;
          _os_log_impl(&dword_223099000, v26, OS_LOG_TYPE_DEFAULT, "%s #activation #carPlay activating requested direct action via Legacy. SASRequestOptions: %@", buf, 0x16u);
        }
        uint64_t v27 = [v6 directActionApplicationContext];
        [(AFUISiriSession *)self _startLegacyDirectActionRequestWithInfo:v21 context:v27 completion:v7];
      }
      else
      {
        uint64_t v34 = [v6 bulletin];

        uint64_t v35 = *MEMORY[0x263F28348];
        uint64_t v36 = *MEMORY[0x263F28348];
        if (v34)
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            uint64_t v65 = "-[AFUISiriSession _startRequestWithFinalOptions:completion:]";
            __int16 v66 = 2112;
            id v67 = v6;
            _os_log_impl(&dword_223099000, v35, OS_LOG_TYPE_DEFAULT, "%s #activation #carPlay activating requested direct action with no direct action specified. SASRequestOptions: %@", buf, 0x16u);
          }
          int v37 = [v6 bulletin];
          [(AFUISiriSession *)self _startRequestForReadoutOfBulletin:v37];
        }
        else
        {
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
            -[AFUISiriSession _startRequestWithFinalOptions:completion:]();
          }
          if (v7)
          {
            id v39 = [MEMORY[0x263F28508] errorWithCode:2510 description:@"Unable to handle direct action request options" underlyingError:0];
            (*((void (**)(id, void *))v7 + 2))(v7, v39);
          }
        }
      }
    }

    goto LABEL_40;
  }
  if ([v6 requestSource] != 21)
  {
    if ([v6 requestSource] == 12)
    {
      uint64_t v30 = [v6 requestInfo];
      uint64_t v31 = [v30 speechRequestOptions];

      if (v31)
      {
LABEL_27:
        uint64_t v32 = [v6 requestInfo];
        uint64_t v33 = [v32 speechRequestOptions];
        -[AFUISiriSession _startSpeechRequestWithSpeechRequestOptions:isInitialBringUp:completion:](self, "_startSpeechRequestWithSpeechRequestOptions:isInitialBringUp:completion:", v33, [v6 isInitialBringUp], v7);

        goto LABEL_40;
      }
      uint64_t v43 = [v6 requestInfo];

      if (v43)
      {
LABEL_56:
        v48 = [v6 requestInfo];
        [(AFUISiriSession *)self _startRequestWithInfo:v48 completion:v7];

        goto LABEL_40;
      }
LABEL_62:
      [(AFUISiriSession *)self _startSpeechRequestWithOptions:v6 completion:v7];
      goto LABEL_40;
    }
    if ([v6 requestSource] == 15)
    {
      id v38 = [v6 requestInfo];

      if (v38) {
        goto LABEL_56;
      }
      uint64_t v44 = [v6 text];

      if (v44) {
        goto LABEL_54;
      }
      v49 = [v6 speechFileURL];

      if (!v49)
      {
        if ([v6 inputType] != 2)
        {
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
            -[AFUISiriSession _startRequestWithFinalOptions:completion:]();
          }
          goto LABEL_40;
        }
        goto LABEL_62;
      }
    }
    else
    {
      if ([v6 requestSource] == 18
        || [v6 requestSource] == 37
        || [v6 requestSource] == 40
        || [v6 requestSource] == 42
        || [v6 requestSource] == 41)
      {
        uint64_t v41 = [v6 requestInfo];
        uint64_t v42 = [v41 speechRequestOptions];

        if (v42) {
          goto LABEL_27;
        }
        v47 = [v6 requestInfo];

        if (v47) {
          goto LABEL_56;
        }
        v51 = [v6 speechRequestOptions];

        if (!v51)
        {
          v52 = [v6 continuityInfo];
          [(AFUISiriSession *)self _startContinuityRequestWithInfo:v52 completion:v7];

          goto LABEL_40;
        }
        goto LABEL_62;
      }
      if ([v6 requestSource] == 34 || objc_msgSend(v6, "requestSource") == 39)
      {
        if (v7) {
          (*((void (**)(id, void))v7 + 2))(v7, 0);
        }
        goto LABEL_40;
      }
      if ([v6 isPronunciationRequest])
      {
        v53 = [v6 pronunciationContext];
        [(AFUISiriSession *)self _startSpeechPronunciationRequestWithContext:v53 options:v6 completion:v7];

        goto LABEL_40;
      }
      v54 = [v6 text];

      if (v54)
      {
LABEL_54:
        uint64_t v45 = [v6 text];
        v46 = [v9 turnIdentifier];
        [(AFUISiriSession *)self _startRequestWithText:v45 turnIdentifier:v46 completion:v7];

        goto LABEL_40;
      }
      id v55 = [v6 speechFileURL];

      if (!v55)
      {
        if ([v6 inputType] != 2)
        {
          if ([v6 requestSource] == 52)
          {
            v56 = [v9 turnIdentifier];
            [(AFUISiriSession *)self _startQuickTypeTamaleRequestWith:v56 completion:v7];
          }
          else
          {
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
              -[AFUISiriSession _startRequestWithFinalOptions:completion:]();
            }
            if (v7)
            {
              v57 = [MEMORY[0x263F28508] errorWithCode:2510 description:@"Unexpected UI request options." underlyingError:0];
              (*((void (**)(id, void *))v7 + 2))(v7, v57);
            }
          }
          goto LABEL_40;
        }
        goto LABEL_62;
      }
    }
    v50 = [v6 speechFileURL];
    [(AFUISiriSession *)self _startSpeechRequestWithSpeechFileAtURL:v50 completion:v7];

    goto LABEL_40;
  }
  __int16 v28 = [v6 requestInfo];
  uint64_t v29 = [v6 directActionApplicationContext];
  [(AFUISiriSession *)self _startLegacyDirectActionRequestWithInfo:v28 context:v29 completion:v7];

LABEL_40:
  if ([v6 isFlexibleFollowupRequest])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
    [WeakRetained siriSessionDidReactivateFromFlexibleFollowups];
  }
  objc_destroyWeak(&location);

LABEL_43:
}

void __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke_cold_1();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        uint64_t v12 = MEMORY[0x263EF83A0];
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if ([v14 isActive])
            {
              block[0] = MEMORY[0x263EF8330];
              block[1] = 3221225472;
              block[2] = __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke_77;
              block[3] = &unk_264691E90;
              void block[4] = WeakRetained;
              block[5] = v14;
              id v16 = v8;
              dispatch_async(v12, block);
            }
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      id v6 = 0;
    }
  }
}

uint64_t __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke_77(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 48) count];

  return [v1 _updateActiveAccount:v2 withNumberOfActiveAccounts:v3];
}

void __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke_79(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _startRequestWithInfo:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_startRequestForReadoutOfBulletin:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v18 = "-[AFUISiriSession _startRequestForReadoutOfBulletin:]";
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  if (v4)
  {
    [(AFUISiriSession *)self _performBlockWithDelegate:&__block_literal_global_88];
    [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:6];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __53__AFUISiriSession__startRequestForReadoutOfBulletin___block_invoke_2;
    v15[3] = &unk_264691DF0;
    id v16 = v4;
    [(AFUISiriSession *)self _performBlockWithDelegate:v15];
  }
  else
  {
    id v7 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_ERROR)) {
      -[AFUISiriSession _startRequestForReadoutOfBulletin:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

uint64_t __53__AFUISiriSession__startRequestForReadoutOfBulletin___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionWillStartRequest];
}

void __53__AFUISiriSession__startRequestForReadoutOfBulletin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__AFUISiriSession__startRequestForReadoutOfBulletin___block_invoke_3;
  v6[3] = &unk_264691F08;
  id v7 = v3;
  id v5 = v3;
  [v5 siriSessionRequestsReadoutOfBulletin:v4 completion:v6];
}

void __53__AFUISiriSession__startRequestForReadoutOfBulletin___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  switch(a2)
  {
    case 0:
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 21;
      goto LABEL_9;
    case 1:
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 11;
      goto LABEL_9;
    case 2:
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 33;
      goto LABEL_9;
    case 3:
      uint64_t v4 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        id v6 = "-[AFUISiriSession _startRequestForReadoutOfBulletin:]_block_invoke_3";
        _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s TTS was cancelled, ignoring as it is most likely due to Siri invocation during readout.", (uint8_t *)&v5, 0xCu);
      }
      return;
    case 4:
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 34;
LABEL_9:
      [v2 siriSessionRequestsDismissalForReason:v3];
      break;
    default:
      return;
  }
}

- (void)startRequestWithOptions:(id)a3
{
}

- (void)startRequestWithOptions:(id)a3 completion:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263F28580]);
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke;
  v37[3] = &unk_264691C18;
  id v9 = v7;
  id v38 = v9;
  uint64_t v10 = [MEMORY[0x263F28508] errorWithCode:2510 description:@"Completion block of start request was dropped." underlyingError:0];
  uint64_t v11 = (void *)[v8 initWithBlock:v37 defaultValue:v10];

  [(SRUIFSpeechRequestHandler *)self->_speechRequestHandler discardCurrentSpeechGroup];
  uint64_t v12 = [(id)objc_opt_class() availabilityState];
  if (v12 == 3)
  {
    if ([v6 requestSource] == 53)
    {
LABEL_10:
      long long v17 = [(SRUIFSpeechRequestHandler *)self->_speechRequestHandler prepareForNewSpeechRequest];
      if (([v6 isInitialBringUp] & 1) != 0
        || [v6 inputType] == 1
        || ([(AFUISiriSession *)self delegate], (long long v18 = objc_claimAutoreleasedReturnValue()) == 0)
        || (BOOL v19 = [v6 requestSource] == 53, v18, v19))
      {
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke_110;
        v30[3] = &unk_264691CE0;
        id v31 = v11;
        [(AFUISiriSession *)self _startRequestWithFinalOptions:v6 completion:v30];
      }
      else
      {
        dispatch_group_enter(v17);
        objc_initWeak((id *)buf, self);
        delegate = self->_delegate;
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke_105;
        v32[3] = &unk_264691F30;
        uint64_t v33 = v17;
        objc_copyWeak(&v36, (id *)buf);
        id v34 = v11;
        uint64_t v35 = self;
        [(AFUISiriSessionDelegate *)delegate siriSessionWillStartRequestWithOptions:v6 completion:v32];

        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);
      }

      goto LABEL_22;
    }
    __int16 v24 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v25 = v24;
      [v6 requestSource];
      __int16 v26 = SASRequestSourceGetName();
      *(_DWORD *)buf = 136315394;
      id v40 = "-[AFUISiriSession startRequestWithOptions:completion:]";
      __int16 v41 = 2112;
      uint64_t v42 = v26;
      _os_log_impl(&dword_223099000, v25, OS_LOG_TYPE_DEFAULT, "%s Device doesn't have assets. Not starting the request for %@", buf, 0x16u);
    }
    uint64_t v27 = [MEMORY[0x263F28508] errorWithCode:2510 description:@"No assets." underlyingError:0];
    [v11 invokeWithValue:v27];

    __int16 v28 = [MEMORY[0x263F75478] sharedInstance];
    [v28 downloadAssets];

    [(AFUISiriSession *)self emitSiriWasUnavailableEventWithRequestOptions:v6];
  }
  else
  {
    if (v12 != 2)
    {
      if (v12 == 1 && [v6 requestSource] != 26 && objc_msgSend(v6, "requestSource") != 53)
      {
        uint64_t v13 = (void *)*MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = v13;
          [v6 requestSource];
          BOOL v15 = SASRequestSourceGetName();
          *(_DWORD *)buf = 136315394;
          id v40 = "-[AFUISiriSession startRequestWithOptions:completion:]";
          __int16 v41 = 2112;
          uint64_t v42 = v15;
          _os_log_impl(&dword_223099000, v14, OS_LOG_TYPE_DEFAULT, "%s No network. Not starting the request for %@", buf, 0x16u);
        }
        id v16 = [MEMORY[0x263F28508] errorWithCode:2510 description:@"No network." underlyingError:0];
        [v11 invokeWithValue:v16];

        goto LABEL_22;
      }
      goto LABEL_10;
    }
    id v20 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = v20;
      [v6 requestSource];
      uint64_t v22 = SASRequestSourceGetName();
      *(_DWORD *)buf = 136315394;
      id v40 = "-[AFUISiriSession startRequestWithOptions:completion:]";
      __int16 v41 = 2112;
      uint64_t v42 = v22;
      _os_log_impl(&dword_223099000, v21, OS_LOG_TYPE_DEFAULT, "%s Device not unlocked since boot. Not starting the request for %@", buf, 0x16u);
    }
    uint64_t v23 = [MEMORY[0x263F28508] errorWithCode:2510 description:@"Device not unlocked since boot." underlyingError:0];
    [v11 invokeWithValue:v23];
  }
LABEL_22:
}

uint64_t __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke_105(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v6 = [WeakRetained speechRequestHandler];
  id v7 = [v6 currentSpeechRequestDispatchGroup];

  if (v4 == v7)
  {
    if (v3)
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 56));
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke_2;
      v13[3] = &unk_264691CE0;
      id v14 = *(id *)(a1 + 40);
      [v8 _startRequestWithFinalOptions:v3 completion:v13];

      id v9 = v14;
    }
    else
    {
      uint64_t v10 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 136315394;
        id v16 = "-[AFUISiriSession startRequestWithOptions:completion:]_block_invoke";
        __int16 v17 = 2112;
        uint64_t v18 = v11;
        _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s %@ not starting a new request because its delegate vetoed with nil request options", buf, 0x16u);
      }
      uint64_t v12 = *(void **)(a1 + 40);
      id v9 = [MEMORY[0x263F28508] errorWithCode:2510 description:@"Session delegate vetoed." underlyingError:0];
      [v12 invokeWithValue:v9];
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

uint64_t __54__AFUISiriSession_startRequestWithOptions_completion___block_invoke_110(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) invokeWithValue:a2];
}

- (void)stopRequestWithOptions:(id)a3
{
  speechRequestHandler = self->_speechRequestHandler;
  id v4 = [(AFUISiriSession *)self _preparedSpeechRequestWithRequestOptions:a3];
  [(SRUIFSpeechRequestHandler *)speechRequestHandler stopSpeechRequestWithOptions:v4];
}

- (void)updateRequestOptions:(id)a3
{
  speechRequestHandler = self->_speechRequestHandler;
  id v4 = [(AFUISiriSession *)self _preparedSpeechRequestWithRequestOptions:a3];
  [(SRUIFSpeechRequestHandler *)speechRequestHandler updateSpeechRequestOptions:v4];
}

- (BOOL)_shouldFetchActiveAccount
{
  id v3 = [MEMORY[0x263F285A0] sharedPreferences];
  if ([v3 showServerOnUI])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_localDataSource);
    int v5 = [WeakRetained isPPTAvailable] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)assistantConnectionRequestWillStart:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  self->_currentRequestDidPresent = 0;
  if (_os_feature_enabled_impl())
  {
    modesConfiguration = self->_modesConfiguration;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__AFUISiriSession_assistantConnectionRequestWillStart___block_invoke;
    v10[3] = &unk_264691F58;
    v10[4] = self;
    int v5 = [(AFModesConfiguration *)modesConfiguration mutatedCopyWithMutator:v10];
    id v6 = self->_modesConfiguration;
    self->_modesConfiguration = v5;

    id v7 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v8 = self->_modesConfiguration;
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "-[AFUISiriSession assistantConnectionRequestWillStart:]";
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #modes Sending modes configuration : %@", buf, 0x16u);
    }
    id v9 = [(AFUISiriSession *)self _connection];
    [v9 setModesConfiguration:self->_modesConfiguration];
  }
  [(SRUIFUIBridgeClient *)self->_uiBridgeClient newRequestWillStart];
  [(AFUISiriSession *)self _performBlockWithDelegate:&__block_literal_global_115];
}

void __55__AFUISiriSession_assistantConnectionRequestWillStart___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _modeOverrideValue];
  [v3 setModeOverrideValue:v4];
}

uint64_t __55__AFUISiriSession_assistantConnectionRequestWillStart___block_invoke_113(uint64_t a1, void *a2)
{
  return [a2 siriSessionWillStartRequest];
}

- (id)safeWrapResponseCompletion:(id)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = &__block_literal_global_118;
  }
  id v4 = _Block_copy(v3);

  return v4;
}

- (id)_setRefIdForAllViewsInAddViews:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 refId];
  if (v4)
  {
    int v5 = (void *)MEMORY[0x263EFF980];
    id v6 = [v3 views];
    id v7 = objc_msgSend(v5, "arrayWithCapacity:", objc_msgSend(v6, "count"));

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = objc_msgSend(v3, "views", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionary];
          [v13 setObject:v4 forKey:@"refId"];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    id v14 = [v3 dictionary];
    [v14 setObject:v7 forKey:*MEMORY[0x263F65D20]];
    id v15 = (id)[objc_alloc(MEMORY[0x263F64ED8]) initWithDictionary:v14];
  }
  else
  {
    id v15 = v3;
  }

  return v15;
}

- (void)assistantConnection:(id)a3 receivedCommand:(id)a4 completion:(id)a5
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 encodedClassName];
  uint64_t v12 = [(AFUISiriSession *)self safeWrapResponseCompletion:v10];

  __int16 v13 = (NSObject **)MEMORY[0x263F28348];
  id v14 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    id v16 = [v9 aceId];
    *(_DWORD *)buf = 136315650;
    v46 = "-[AFUISiriSession assistantConnection:receivedCommand:completion:]";
    __int16 v47 = 2112;
    v48 = v11;
    __int16 v49 = 2112;
    v50 = v16;
    _os_log_impl(&dword_223099000, v15, OS_LOG_TYPE_DEFAULT, "%s Received Command: %@ aceId: %@", buf, 0x20u);
  }
  long long v17 = [(AFUISiriSession *)self visualIntelligenceCameraDelegate];
  [v17 siriWillPresentResult];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    long long v18 = v9;
  }
  else {
    long long v18 = 0;
  }
  id v19 = v18;
  if (!v19)
  {
    uint64_t v21 = 0;
    goto LABEL_22;
  }
  long long v20 = v19;
  uint64_t v21 = [(AFUISiriSession *)self _setRefIdForAllViewsInAddViews:v19];

  uint64_t v22 = objc_msgSend(v21, "af_dialogPhase");
  if ([v22 isPossiblyPartOfMultiTurnRequest])
  {
    uint64_t v23 = *v13;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[AFUISiriSession assistantConnection:receivedCommand:completion:]";
      __int16 v47 = 2112;
      v48 = v22;
      _os_log_impl(&dword_223099000, v23, OS_LOG_TYPE_DEFAULT, "%s %@ may be a part of a multi turn request.", buf, 0x16u);
    }
    __int16 v24 = [(AFUISiriSession *)self _connection];
    [v24 adviseSessionArbiterToContinueWithPreviousWinner:1];
  }
  else
  {
    if (([v22 isCompletionDialogPhase] & 1) == 0
      && ([v22 isErrorDialogPhase] & 1) == 0
      && ![v22 isConfirmedDialogPhase])
    {
      goto LABEL_19;
    }
    id v25 = *v13;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v46 = "-[AFUISiriSession assistantConnection:receivedCommand:completion:]";
      __int16 v47 = 2112;
      v48 = v22;
      _os_log_impl(&dword_223099000, v25, OS_LOG_TYPE_DEFAULT, "%s %@ indicates end of a multi turn request.", buf, 0x16u);
    }
    __int16 v24 = [(AFUISiriSession *)self _connection];
    [v24 adviseSessionArbiterToContinueWithPreviousWinner:0];
  }

LABEL_19:
  if ([v21 immersiveExperience])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
    [WeakRetained siriSessionImmersiveExperienceRequested];
  }
LABEL_22:
  uint64_t v27 = objc_msgSend(v9, "sruif_usefulUserResultType");
  if (v27)
  {
    __int16 v28 = [(AFUISiriSession *)self _connection];
    [v28 willPresentUsefulUserResultWithType:v27 forCommand:v9];
  }
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __66__AFUISiriSession_assistantConnection_receivedCommand_completion___block_invoke;
  v43[3] = &unk_264691DF0;
  id v29 = v9;
  id v44 = v29;
  [(AFUISiriSession *)self _performBlockWithDelegate:v43];
  if ([v11 isEqualToString:*MEMORY[0x263F65DB8]])
  {
    id v30 = objc_loadWeakRetained((id *)&self->_localDelegate);
    [v30 siriSessionDidReceiveDelayedActionCancelCommand:v29 completion:v12];
  }
  else if ([v11 isEqualToString:*MEMORY[0x263F65DC0]])
  {
    id v31 = objc_loadWeakRetained((id *)&self->_localDelegate);
    [v31 siriSessionDidReceiveDelayedActionCommand:v29 completion:v12];
  }
  else if ([v11 isEqualToString:*MEMORY[0x263F65F28]])
  {
    id v32 = objc_loadWeakRetained((id *)&self->_localDelegate);
    [v32 siriSessionDidReceiveTakeScreenshotCommand:v29 completion:v12];
  }
  else if ([v11 isEqualToString:*MEMORY[0x263F651B8]])
  {
    id v33 = objc_loadWeakRetained((id *)&self->_localDelegate);
    [v33 siriSessionDidReceiveStartScreenRecordingCommand:v29 completion:v12];
  }
  else if ([v11 isEqualToString:*MEMORY[0x263F651C0]])
  {
    id v34 = objc_loadWeakRetained((id *)&self->_localDelegate);
    [v34 siriSessionDidReceiveStopScreenRecordingCommand:v29 completion:v12];
  }
  else if ([v11 isEqualToString:*MEMORY[0x263F65EB8]])
  {
    id v35 = objc_loadWeakRetained((id *)&self->_localDelegate);
    [v35 siriSessionDidReceiveSetUpdateMaskCommand:v29 completion:v12];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __66__AFUISiriSession_assistantConnection_receivedCommand_completion___block_invoke_2;
    v36[3] = &unk_264691FA0;
    id v37 = v11;
    id v38 = v21;
    id v41 = v12;
    id v39 = v29;
    id v40 = self;
    objc_copyWeak(&v42, (id *)buf);
    [(AFUISiriSession *)self _performBlockWithDelegate:v36];
    objc_destroyWeak(&v42);

    objc_destroyWeak((id *)buf);
  }
}

uint64_t __66__AFUISiriSession_assistantConnection_receivedCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionWillProcessAceCommand:*(void *)(a1 + 32)];
}

void __66__AFUISiriSession_assistantConnection_receivedCommand_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65D10]])
  {
    [v3 siriSessionDidReceiveAddViewsCommand:*(void *)(a1 + 40) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65D08]])
  {
    [v3 siriSessionDidReceiveAddDialogsCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65D70]])
  {
    [v3 siriSessionDidReceiveClearScreenCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65AA0]])
  {
    [v3 siriSessionDidReceivePlayVoicemailCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65E50]])
  {
    [v3 siriSessionDidReceiveOpenLinkCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65BC0]] {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  }
  {
    [v3 siriSessionDidReceiveSmsPlayAudioCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65E68]])
  {
    [v3 siriSessionDidReceivePlayNotificationSound:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65EA8]])
  {
    [v3 siriSessionDidReceiveSayItCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65E70]])
  {
    [v3 siriSessionDidReceiveRepeatItCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65F30]])
  {
    [*(id *)(a1 + 56) _handleUnlockAppCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65F38]])
  {
    [*(id *)(a1 + 56) _handleUnlockDeviceCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65F40]])
  {
    [*(id *)(a1 + 56) _handleUnlockDeviceWithWatchCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65EC8]])
  {
    [v3 siriSessionDidReceiveShowHelpCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65E78]])
  {
    [*(id *)(a1 + 56) _handleRequestUpdateViewsCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65F48]])
  {
    [v3 siriSessionDidReceiveUpdateViewsCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65D28]])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    [WeakRetained _performPunchoutCommand:*(void *)(a1 + 48) delegate:v3 completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65D78]])
  {
    [v3 siriSessionDidReceiveCloseAssistantCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65E48]])
  {
    [v3 siriSessionDidReceiveListenForPronunciationCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65E30]])
  {
    [v3 siriSessionDidReceiveGetResponseAlternativesPlaybackCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
  }
  else
  {
    int v5 = (id *)(a1 + 48);
    if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65EB0]])
    {
      [v3 siriSessionDidReceiveSetSuggestedUtterancesCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v3 siriSessionDidReceiveAddContentToViewCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65BA8]])
      {
        [v3 siriSessionDidReceiveSetUIGuidedAccessCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65D68]])
      {
        [v3 siriSessionDidReceiveSAUIChangePrimaryUtteranceCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65EC0]])
      {
        [v3 siriSessionDidReceiveSAUIShowFullScreenEffectCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65EF0]])
      {
        [v3 siriSessionDidReceiveSAUIShowSpeechAlternativesCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65ED0]])
      {
        [v3 siriSessionDidReceiveSAUIShowRequestHandlingStatusCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65E38]])
      {
        [v3 siriSessionDidReceiveHideSiriOverlayCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65220]])
      {
        [v3 siriSessionDidReceiveGuideUpdateCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65158]])
      {
        [v3 siriSessionDidReceiveShowNextCardCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65AA8]])
      {
        [v3 siriSessionDidReceivePreSynthesizeTTSCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65E18]])
      {
        [v3 siriSessionDidReceiveDisambiguationItemSelected:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65F68]])
      {
        [v3 siriSessionDidReceivePlayContentCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65E40]])
      {
        [v3 siriSessionDidReceiveLaunchTVRemoteCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65E20]])
      {
        [v3 siriSessionDidReceiveExtendCurrentTTSCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65EA0]])
      {
        [v3 siriSessionDidReceiveRevealRecognizedSpeechCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65E58]])
      {
        [v3 siriSessionDidReceivePaginateListCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65F58]])
      {
        [v3 siriSessionDidReceiveShowNextSnippetCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65F50]])
      {
        [v3 siriSessionDidReceiveUpdateVisualResponseSnippetCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65F00]])
      {
        [v3 siriSessionDidReceiveSnippetConfigurationRequestCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65E60]])
      {
        [*(id *)(a1 + 56) _handlePlayAudioCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65F20]])
      {
        [*(id *)(a1 + 56) _handleSuppressDelayFeedbackCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65F18]])
      {
        [v3 siriSessionDidReceiveStartImmersiveExperienceCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x263F65F10]])
      {
        [v3 siriSessionDidReceiveStartGenAIEnablementFlowCommand:*(void *)(a1 + 48) completion:*(void *)(a1 + 64)];
      }
      else
      {
        id v6 = (void *)*MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
          __66__AFUISiriSession_assistantConnection_receivedCommand_completion___block_invoke_2_cold_1(v5, v6);
        }
      }
    }
  }
}

- (void)_handleSuppressDelayFeedbackCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  stateFeedbackManager = self->_stateFeedbackManager;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __66__AFUISiriSession__handleSuppressDelayFeedbackCommand_completion___block_invoke;
  v11[3] = &unk_264691FC8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  [(SRUIFStateFeedbackManager *)stateFeedbackManager cancelFeedbackWithCompletion:v11];
}

void __66__AFUISiriSession__handleSuppressDelayFeedbackCommand_completion___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 40))
  {
    id v2 = objc_alloc_init(MEMORY[0x263F64830]);
    id v3 = [*(id *)(a1 + 32) aceId];
    [v2 setRefId:v3];

    id v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[AFUISiriSession _handleSuppressDelayFeedbackCommand:completion:]_block_invoke";
      _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s successfully suppressed delay feedback", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_handlePlayAudioCommand:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (os_log_t *)MEMORY[0x263F28348];
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "-[AFUISiriSession _handlePlayAudioCommand:completion:]";
    _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  if (_os_feature_enabled_impl())
  {
    stateFeedbackManager = self->_stateFeedbackManager;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __54__AFUISiriSession__handlePlayAudioCommand_completion___block_invoke;
    v21[3] = &unk_264691FF0;
    id v22 = v6;
    id v23 = v7;
    [(SRUIFStateFeedbackManager *)stateFeedbackManager playAudioPlaybackRequest:v22 completion:v21];

    id v11 = v22;
  }
  else
  {
    id v12 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[AFUISiriSession _handlePlayAudioCommand:completion:](v12, v13, v14, v15, v16, v17, v18, v19);
    }
    id v11 = objc_alloc_init(MEMORY[0x263F64820]);
    long long v20 = [v6 aceId];
    [v11 setRefId:v20];

    (*((void (**)(id, id))v7 + 2))(v7, v11);
  }
}

void __54__AFUISiriSession__handlePlayAudioCommand_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    id v3 = (objc_class *)MEMORY[0x263F64830];
  }
  else {
    id v3 = (objc_class *)MEMORY[0x263F64820];
  }
  id v5 = objc_alloc_init(v3);
  id v4 = [*(id *)(a1 + 32) aceId];
  [v5 setRefId:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_performPunchoutCommand:(id)a3 delegate:(id)a4 completion:(id)a5
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (os_log_t *)MEMORY[0x263F28348];
  id v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v28 = "-[AFUISiriSession _performPunchoutCommand:delegate:completion:]";
    _os_log_impl(&dword_223099000, v12, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  p_localDelegate = &self->_localDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_localDelegate);
  char v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0
    && (id v16 = objc_loadWeakRetained((id *)p_localDelegate),
        int v17 = [v16 shouldNonLocalDelegateHandlePunchouts],
        v16,
        !v17))
  {
    id v22 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v28 = "-[AFUISiriSession _performPunchoutCommand:delegate:completion:]";
      _os_log_impl(&dword_223099000, v22, OS_LOG_TYPE_DEFAULT, "%s Local delegate is handling it.", buf, 0xCu);
    }
    id v23 = objc_loadWeakRetained((id *)p_localDelegate);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __63__AFUISiriSession__performPunchoutCommand_delegate_completion___block_invoke;
    v24[3] = &unk_264692018;
    id v26 = v10;
    id v25 = v8;
    [v23 handlePunchoutCommand:v25 completion:v24];
  }
  else
  {
    os_log_t v18 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = NSNumber;
      long long v20 = v18;
      uint64_t v21 = [v19 numberWithBool:v15 & 1];
      *(_DWORD *)buf = 136315394;
      __int16 v28 = "-[AFUISiriSession _performPunchoutCommand:delegate:completion:]";
      __int16 v29 = 2112;
      id v30 = v21;
      _os_log_impl(&dword_223099000, v20, OS_LOG_TYPE_DEFAULT, "%s Delegate is handling it - responds to shouldNonLocalDelegateHandlePunchouts: %@", buf, 0x16u);
    }
    [v9 siriSessionDidReceiveAppPunchOutCommand:v8 completion:v10];
  }
}

void __63__AFUISiriSession__performPunchoutCommand_delegate_completion___block_invoke(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 40))
  {
    id v3 = (Class *)0x263F64830;
    if (!a2) {
      id v3 = (Class *)0x263F64820;
    }
    id v5 = objc_alloc_init(*v3);
    id v4 = [*(id *)(a1 + 32) aceId];
    [v5 setRefId:v4];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)assistantConnection:(id)a3 startUIRequestWithText:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__AFUISiriSession_assistantConnection_startUIRequestWithText_completion___block_invoke;
  v11[3] = &unk_264692040;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(AFUISiriSession *)self _performBlockWithDelegate:v11];
}

uint64_t __73__AFUISiriSession_assistantConnection_startUIRequestWithText_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionWillStartUIRequestWithText:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

- (void)_requestDidFinishWithError:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __46__AFUISiriSession__requestDidFinishWithError___block_invoke;
  v10[3] = &unk_264691DF0;
  id v5 = v4;
  id v11 = v5;
  [(AFUISiriSession *)self _performBlockWithDelegate:v10];
  p_localDelegate = &self->_localDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_localDelegate);
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)p_localDelegate);
    [v9 siriSessionDidFinishRequestWithError:v5];
  }
}

uint64_t __46__AFUISiriSession__requestDidFinishWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidFinishRequestWithError:*(void *)(a1 + 32)];
}

- (void)assistantConnectionWillStartAcousticIDRequest:(id)a3
{
  self->_isProcessingAcousticIdRequest = 1;
  [(AFUISiriSession *)self _performBlockWithDelegate:&__block_literal_global_134];
}

uint64_t __65__AFUISiriSession_assistantConnectionWillStartAcousticIDRequest___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidStartAcousticIDRequest];
}

- (void)assistantConnection:(id)a3 didFinishAcousticIDRequestWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    char v8 = @"NO";
    if (v4) {
      char v8 = @"YES";
    }
    *(_DWORD *)buf = 136315394;
    id v12 = "-[AFUISiriSession assistantConnection:didFinishAcousticIDRequestWithSuccess:]";
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  self->_isProcessingAcousticIdRequest = 0;
  if (!v4) {
    [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:7];
  }
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__AFUISiriSession_assistantConnection_didFinishAcousticIDRequestWithSuccess___block_invoke;
  v9[3] = &__block_descriptor_33_e35_v16__0___AFUISiriSessionDelegate__8l;
  BOOL v10 = v4;
  [(AFUISiriSession *)self _performBlockWithDelegate:v9];
}

uint64_t __77__AFUISiriSession_assistantConnection_didFinishAcousticIDRequestWithSuccess___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidFinishAcousticIDRequestWithSuccess:*(unsigned __int8 *)(a1 + 32)];
}

- (void)assistantConnection:(id)a3 requestFailedWithError:(id)a4 requestClass:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  id v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    id v11 = "-[AFUISiriSession assistantConnection:requestFailedWithError:requestClass:]";
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s error:%@ requestClass:%@", (uint8_t *)&v10, 0x20u);
  }
  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:7];
  [(AFUISiriSession *)self _requestDidFinishWithError:v7];
}

- (void)assistantConnectionRequestFinished:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[AFUISiriSession assistantConnectionRequestFinished:]";
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:6];
  [(AFUISiriSession *)self _requestDidFinishWithError:0];
}

- (void)assistantConnection:(id)a3 openURL:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __58__AFUISiriSession_assistantConnection_openURL_completion___block_invoke;
  v11[3] = &unk_264692040;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(AFUISiriSession *)self _performBlockWithDelegate:v11];
}

uint64_t __58__AFUISiriSession_assistantConnection_openURL_completion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionOpenURL:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 willProcessStartPlayback:(int64_t)a4 intent:(id)a5 completion:(id)a6
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, void, uint64_t))a6;
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x2050000000;
  id v12 = (void *)getINStartCallIntentClass_softClass;
  uint64_t v27 = getINStartCallIntentClass_softClass;
  if (!getINStartCallIntentClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getINStartCallIntentClass_block_invoke;
    __int16 v29 = &unk_264691928;
    id v30 = &v24;
    __getINStartCallIntentClass_block_invoke((uint64_t)buf);
    id v12 = (void *)v25[3];
  }
  id v13 = v12;
  _Block_object_dispose(&v24, 8);
  objc_opt_class();
  unsigned __int8 isKindOfClass = objc_opt_isKindOfClass();
  char v15 = isKindOfClass ^ 1;
  uint64_t v16 = (os_log_t *)MEMORY[0x263F28348];
  if (((isKindOfClass ^ 1) & 1) == 0)
  {
    int v17 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[AFUISiriSession assistantConnection:willProcessStartPlayback:intent:completion:]";
      _os_log_impl(&dword_223099000, v17, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler Extending the audio session for imminent phone call", buf, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
    objc_msgSend(WeakRetained, "siriSessionShouldExtendAudioSessionForImminentPhoneCall", v24);
  }
  os_log_t v19 = *v16;
  if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
  {
    long long v20 = NSNumber;
    uint64_t v21 = v19;
    id v22 = [v20 numberWithBool:isKindOfClass & 1];
    id v23 = [NSNumber numberWithBool:v15 & 1];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "-[AFUISiriSession assistantConnection:willProcessStartPlayback:intent:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v22;
    *(_WORD *)&buf[22] = 2112;
    __int16 v29 = v23;
    _os_log_impl(&dword_223099000, v21, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler: shouldExtendAudioSessionForImminentPhoneCall: %@, suppressAudioInterruptedNotificationFlag: %@", buf, 0x20u);
  }
  v11[2](v11, v15 & 1, 1);
}

- (void)assistantConnection:(id)a3 startPlaybackDidFail:(int64_t)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[AFUISiriSession assistantConnection:startPlaybackDidFail:]";
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s #PhoneCallAudioSessionHandler startPlaybackDidFail: Telling SiriPresentationViewController to stop extending the audio session", (uint8_t *)&v7, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  [WeakRetained siriSessionShouldEndExtendAudioSessionForImminentPhoneCall];
}

- (void)assistantConnection:(id)a3 didChangeAudioSessionID:(unsigned int)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__AFUISiriSession_assistantConnection_didChangeAudioSessionID___block_invoke;
  v4[3] = &__block_descriptor_36_e35_v16__0___AFUISiriSessionDelegate__8l;
  unsigned int v5 = a4;
  [(AFUISiriSession *)self _performBlockWithDelegate:v4];
}

void __63__AFUISiriSession_assistantConnection_didChangeAudioSessionID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 32);
    int v6 = 136315650;
    int v7 = "-[AFUISiriSession assistantConnection:didChangeAudioSessionID:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #tts 1 _delegate:%@ audioSessionID:%u", (uint8_t *)&v6, 0x1Cu);
  }
  [v3 siriSessionDidUpdateAudioSessionID:*(unsigned int *)(a1 + 32)];
}

- (void)assistantConnectionDismissAssistant:(id)a3
{
}

uint64_t __55__AFUISiriSession_assistantConnectionDismissAssistant___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionRequestsDismissalForReason:32];
}

- (void)assistantConnection:(id)a3 dismissAssistantWithReason:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 5) {
    uint64_t v4 = 32;
  }
  else {
    uint64_t v4 = qword_2230F5B28[a4 - 1];
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__AFUISiriSession_assistantConnection_dismissAssistantWithReason___block_invoke;
  v5[3] = &__block_descriptor_40_e35_v16__0___AFUISiriSessionDelegate__8l;
  v5[4] = v4;
  [(AFUISiriSession *)self _performBlockWithDelegate:v5];
}

uint64_t __66__AFUISiriSession_assistantConnection_dismissAssistantWithReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionRequestsDismissalForReason:*(void *)(a1 + 32)];
}

- (void)assistantConnectionDidDetectMusic:(id)a3
{
}

uint64_t __53__AFUISiriSession_assistantConnectionDidDetectMusic___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidDetectMusic];
}

- (void)assistantConnection:(id)a3 wantsToCacheImage:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__AFUISiriSession_assistantConnection_wantsToCacheImage___block_invoke;
  v7[3] = &unk_264691DF0;
  id v8 = v5;
  id v6 = v5;
  [(AFUISiriSession *)self _performBlockWithDelegate:v7];
}

uint64_t __57__AFUISiriSession_assistantConnection_wantsToCacheImage___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionWantsToCacheImage:*(void *)(a1 + 32)];
}

- (void)assistantConnection:(id)a3 extensionRequestWillStartForApplication:(id)a4
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_authenticationUIPresentedCallBack, @"com.apple.LocalAuthentication.ui.presented", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  id v6 = CFNotificationCenterGetDarwinNotifyCenter();
  getOptionalPKDarwinNotificationEventInAppPresented();
  int v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterAddObserver(v6, self, (CFNotificationCallback)_authenticationUIPresentedCallBack, v7, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)assistantConnection:(id)a3 extensionRequestFinishedForApplication:(id)a4 error:(id)a5
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.LocalAuthentication.ui.presented", 0);
  int v7 = CFNotificationCenterGetDarwinNotifyCenter();
  getOptionalPKDarwinNotificationEventInAppPresented();
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(v7, self, v8, 0);
}

- (void)assistantConnection:(id)a3 didLoadAssistant:(id)a4
{
  objc_msgSend(a4, "version", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(AFUISiriSession *)self _updateAssistantVersion:v5];
}

- (void)assistantConnection:(id)a3 willProcessAppLaunchWithBundleIdentifier:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  [WeakRetained siriSession:self willProcessAppLaunchWithBundleIdentifier:v5];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__AFUISiriSession_assistantConnection_willProcessAppLaunchWithBundleIdentifier___block_invoke;
  v8[3] = &unk_264691DF0;
  id v9 = v5;
  id v7 = v5;
  [(AFUISiriSession *)self _performBlockWithDelegate:v8];
}

uint64_t __80__AFUISiriSession_assistantConnection_willProcessAppLaunchWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionWillProcessAppLaunchWithBundleIdentifier:*(void *)(a1 + 32)];
}

- (void)assistantConnection:(id)a3 appLaunchFailedWithBundleIdentifier:(id)a4
{
  p_localDelegate = &self->_localDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_localDelegate);
  [WeakRetained siriSession:self failedToLaunchAppWithBundleIdentifier:v6];
}

- (void)_updateAssistantVersion:(id)a3
{
  uint64_t v4 = [(SRUIFSiriSessionInfo *)self->_siriSessionInfo setAssistantVersionAndGenerateLightweightInfo:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_localDelegate);
    [v7 siriSessionDidUpdateSessionInfo:v4];
  }
  if (objc_opt_respondsToSelector())
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __43__AFUISiriSession__updateAssistantVersion___block_invoke;
    v8[3] = &unk_264691DF0;
    id v9 = v4;
    [(AFUISiriSession *)self _performBlockWithDelegate:v8];
  }
}

uint64_t __43__AFUISiriSession__updateAssistantVersion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidUpdateSessionInfo:*(void *)(a1 + 32)];
}

- (void)assistantConnection:(id)a3 didUpdateResponseMode:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([MEMORY[0x263F28510] isStateFeedbackEnabled])
  {
    char v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315394;
      id v8 = "-[AFUISiriSession assistantConnection:didUpdateResponseMode:]";
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s client recieved mode update: %@", (uint8_t *)&v7, 0x16u);
    }
    [(SRUIFStateFeedbackManager *)self->_stateFeedbackManager updateResponseMode:v5];
  }
}

- (void)assistantConnection:(id)a3 speechRecordingPerformTwoShotPromptWithType:(int64_t)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a5;
  id v8 = objc_alloc(MEMORY[0x263F28580]);
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  os_log_t v19 = __94__AFUISiriSession_assistantConnection_speechRecordingPerformTwoShotPromptWithType_completion___block_invoke;
  long long v20 = &unk_264691C18;
  id v9 = v7;
  id v21 = v9;
  id v10 = (void *)[v8 initWithBlock:&v17];
  uint64_t v11 = *MEMORY[0x263F28348];
  BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (a4 == 2)
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[AFUISiriSession assistantConnection:speechRecordingPerformTwoShotPromptWithType:completion:]";
      _os_log_impl(&dword_223099000, v11, OS_LOG_TYPE_DEFAULT, "%s #phatic 1", buf, 0xCu);
    }
    [(AFUISiriSession *)self _playPhaticWithCompletion:v10];
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315394;
      id v23 = "-[AFUISiriSession assistantConnection:speechRecordingPerformTwoShotPromptWithType:completion:]";
      __int16 v24 = 2048;
      int64_t v25 = a4;
      _os_log_impl(&dword_223099000, v11, OS_LOG_TYPE_DEFAULT, "%s #phatic 1 Fail: type = %tu", buf, 0x16u);
    }
    id v13 = (void *)MEMORY[0x263F28508];
    id v14 = [NSString alloc];
    char v15 = objc_msgSend(v14, "initWithFormat:", @"Unsupported Two-Shot prompt type %ld.", a4, v17, v18, v19, v20);
    uint64_t v16 = [v13 errorWithCode:15 description:v15 underlyingError:0];
    [v10 invokeWithValue:v16];
  }
}

void __94__AFUISiriSession_assistantConnection_speechRecordingPerformTwoShotPromptWithType_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    uint64_t v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      char v6 = "-[AFUISiriSession assistantConnection:speechRecordingPerformTwoShotPromptWithType:completion:]_block_invoke";
      _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #phatic 8", (uint8_t *)&v5, 0xCu);
    }
    (*(void (**)(double, double))(*(void *)(a1 + 32) + 16))(0.0, 0.0);
  }
}

- (void)_playPhaticWithCompletion:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v16 = "-[AFUISiriSession _playPhaticWithCompletion:]";
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s #phatic 2", buf, 0xCu);
  }
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __45__AFUISiriSession__playPhaticWithCompletion___block_invoke;
  BOOL v12 = &unk_2646920F0;
  id v13 = self;
  id v14 = v4;
  id v6 = v4;
  uint64_t v7 = _Block_copy(&v9);
  id v8 = [(AFUISiriSession *)self _connection];
  [v8 forceAudioSessionActiveWithOptions:0 reason:3 completion:v7];
}

void __45__AFUISiriSession__playPhaticWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"success";
    if (v4) {
      id v6 = v4;
    }
    *(_DWORD *)buf = 136315394;
    uint64_t v11 = "-[AFUISiriSession _playPhaticWithCompletion:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s #phatic 3 audioSessionCompletion:%@", buf, 0x16u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __45__AFUISiriSession__playPhaticWithCompletion___block_invoke_157;
  v8[3] = &unk_264691DF0;
  uint64_t v7 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  [v7 _performBlockWithDelegate:v8];
}

void __45__AFUISiriSession__playPhaticWithCompletion___block_invoke_157(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v8 = "-[AFUISiriSession _playPhaticWithCompletion:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #phatic 4 %@", buf, 0x16u);
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__AFUISiriSession__playPhaticWithCompletion___block_invoke_158;
  v5[3] = &unk_2646920C8;
  id v6 = *(id *)(a1 + 32);
  [v3 siriSessionRequestsPlayPhaticWithCompletion:v5];
}

void __45__AFUISiriSession__playPhaticWithCompletion___block_invoke_158(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[AFUISiriSession _playPhaticWithCompletion:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #phatic 9 success:%i", (uint8_t *)&v7, 0x12u);
  }
  int v5 = *(void **)(a1 + 32);
  if (a2)
  {
    [v5 invokeWithValue:0];
  }
  else
  {
    id v6 = [MEMORY[0x263F28508] errorWithCode:15 description:@"Failed to play phatic prompt." underlyingError:0];
    [v5 invokeWithValue:v6];
  }
}

- (void)assistantConnectionSpeechRecordingWillBegin:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  [WeakRetained siriSessionRecordingPreparationHasFinished:self];

  speechRequestHandler = self->_speechRequestHandler;

  [(SRUIFSpeechRequestHandler *)speechRequestHandler speechRecordingWillBegin];
}

- (void)assistantConnection:(id)a3 speechRecordingDidBeginOnAVRecordRoute:(id)a4 audioSessionID:(unsigned int)a5
{
  id v7 = a4;
  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:1];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __93__AFUISiriSession_assistantConnection_speechRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke;
  v12[3] = &unk_264691DF0;
  id v13 = v7;
  id v8 = v7;
  [(AFUISiriSession *)self _performBlockWithDelegate:v12];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  [WeakRetained siriSession:self speechRecordingDidBeginOnAVRecordRoute:v8];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __93__AFUISiriSession_assistantConnection_speechRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke_2;
  v10[3] = &__block_descriptor_36_e35_v16__0___AFUISiriSessionDelegate__8l;
  unsigned int v11 = a5;
  [(AFUISiriSession *)self _performBlockWithDelegate:v10];
}

uint64_t __93__AFUISiriSession_assistantConnection_speechRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionSpeechRecordingDidChangeAVRecordRoute:*(void *)(a1 + 32)];
}

void __93__AFUISiriSession_assistantConnection_speechRecordingDidBeginOnAVRecordRoute_audioSessionID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 32);
    int v6 = 136315650;
    id v7 = "-[AFUISiriSession assistantConnection:speechRecordingDidBeginOnAVRecordRoute:audioSessionID:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s #tts 1 _delegate:%@ audioSessionID:%u", (uint8_t *)&v6, 0x1Cu);
  }
  [v3 siriSessionDidUpdateAudioSessionID:*(unsigned int *)(a1 + 32)];
}

- (void)assistantConnection:(id)a3 speechRecordingDidChangeAVRecordRoute:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__AFUISiriSession_assistantConnection_speechRecordingDidChangeAVRecordRoute___block_invoke;
  v7[3] = &unk_264691DF0;
  id v8 = v5;
  id v6 = v5;
  [(AFUISiriSession *)self _performBlockWithDelegate:v7];
}

uint64_t __77__AFUISiriSession_assistantConnection_speechRecordingDidChangeAVRecordRoute___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionSpeechRecordingDidChangeAVRecordRoute:*(void *)(a1 + 32)];
}

- (void)assistantConnectionDidChangeAudioRecordingPower:(id)a3
{
  if (![(AFUISiriSession *)self _isContinuousConversationAvailable])
  {
    [(AFUISiriSession *)self _handleDidChangeAudioRecordingPower];
  }
}

- (void)_handleDidChangeAudioRecordingPower
{
  objc_initWeak(&location, self);
  if ([MEMORY[0x263F286B8] isSAEEnabled])
  {
    id v3 = [(AFUISiriSession *)self localDelegate];
    [(AFUISiriSession *)self recordingPowerLevel];
    int v5 = v4;
    [(AFUISiriSession *)self recordingPowerLevel];
    LODWORD(v7) = v6;
    LODWORD(v8) = v5;
    [v3 siriSessionAudioRecordingDidChangePowerLevel:v8 peakLevel:v7];

    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __54__AFUISiriSession__handleDidChangeAudioRecordingPower__block_invoke;
    v13[3] = &unk_264692118;
    id v9 = &v14;
    objc_copyWeak(&v14, &location);
    void v13[4] = self;
    [(AFUISiriSession *)self _performBlockWithDelegate:v13];
  }
  else
  {
    __int16 v10 = [(AFUISiriSession *)self localDelegate];
    [(AFUISiriSession *)self recordingPowerLevel];
    objc_msgSend(v10, "siriSessionAudioRecordingDidChangePowerLevel:");

    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__AFUISiriSession__handleDidChangeAudioRecordingPower__block_invoke_2;
    v11[3] = &unk_264692140;
    id v9 = &v12;
    objc_copyWeak(&v12, &location);
    [(AFUISiriSession *)self _performBlockWithDelegate:v11];
  }
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __54__AFUISiriSession__handleDidChangeAudioRecordingPower__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained recordingPowerLevel];
    int v6 = v5;
    [*(id *)(a1 + 32) recordingPowerLevel];
    LODWORD(v8) = v7;
    LODWORD(v9) = v6;
    [v10 siriSessionAudioRecordingDidChangePowerLevel:v9 peakLevel:v8];
  }
}

void __54__AFUISiriSession__handleDidChangeAudioRecordingPower__block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained recordingPowerLevel];
    objc_msgSend(v5, "siriSessionAudioRecordingDidChangePowerLevel:");
  }
}

- (void)assistantConnectionSpeechRecordingDidDetectStartpoint:(id)a3
{
}

uint64_t __73__AFUISiriSession_assistantConnectionSpeechRecordingDidDetectStartpoint___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidDetectSpeechStartpoint];
}

- (void)assistantConnectionSpeechRecordingDidEnd:(id)a3
{
  int v4 = [(AFUISiriSession *)self visualIntelligenceCameraDelegate];
  [v4 siriWillProcessRequest];

  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:2];

  [(AFUISiriSession *)self _performBlockWithDelegate:&__block_literal_global_165];
}

uint64_t __60__AFUISiriSession_assistantConnectionSpeechRecordingDidEnd___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionSpeechRecordingDidEnd];
}

- (void)assistantConnectionUpdatedSpeechEndEstimate:(id)a3 speechEndEstimate:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v6 = [(AFUISiriSession *)self localDataSource];
  char v7 = [v6 getUIViewModeIsUIFreeForCurrentRequest];

  if (v7)
  {
    double v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      int v11 = "-[AFUISiriSession assistantConnectionUpdatedSpeechEndEstimate:speechEndEstimate:]";
      _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s #statefeedback not passing along speech end estimate due to ui free view mode", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    stateFeedbackManager = self->_stateFeedbackManager;
    [(SRUIFStateFeedbackManager *)stateFeedbackManager didUpdateEstimatedEndOfUserInput:a4];
  }
}

- (void)assistantConnection:(id)a3 didStartAudioPlaybackRequest:(id)a4
{
}

- (void)assistantConnectionSpeechRecordingDidCancel:(id)a3
{
  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:3];

  [(AFUISiriSession *)self _performBlockWithDelegate:&__block_literal_global_167];
}

uint64_t __63__AFUISiriSession_assistantConnectionSpeechRecordingDidCancel___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionSpeechRecordingDidCancel];
}

- (void)assistantConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
  [WeakRetained siriSessionRecordingPreparationHasFinished:self];

  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:4];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__AFUISiriSession_assistantConnection_speechRecordingDidFail___block_invoke;
  v8[3] = &unk_264691DF0;
  id v9 = v5;
  id v7 = v5;
  [(AFUISiriSession *)self _performBlockWithDelegate:v8];
  [(SRUIFSpeechRequestHandler *)self->_speechRequestHandler speechRecordingDidFail];
}

uint64_t __62__AFUISiriSession_assistantConnection_speechRecordingDidFail___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionSpeechRecordingDidFailWithError:*(void *)(a1 + 32)];
}

- (void)assistantConnection:(id)a3 speechRecognized:(id)a4
{
  id v5 = a4;
  kdebug_trace();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__AFUISiriSession_assistantConnection_speechRecognized___block_invoke;
  v7[3] = &unk_264691DF0;
  id v8 = v5;
  id v6 = v5;
  [(AFUISiriSession *)self _performBlockWithDelegate:v7];
}

uint64_t __56__AFUISiriSession_assistantConnection_speechRecognized___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidReceiveSpeechRecognizedCommand:*(void *)(a1 + 32)];
}

- (void)assistantConnection:(id)a3 recognizedAdditionalSpeechInterpretation:(id)a4 refId:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __86__AFUISiriSession_assistantConnection_recognizedAdditionalSpeechInterpretation_refId___block_invoke;
  v11[3] = &unk_264692168;
  id v12 = v7;
  id v13 = v8;
  id v9 = v8;
  id v10 = v7;
  [(AFUISiriSession *)self _performBlockWithDelegate:v11];
}

uint64_t __86__AFUISiriSession_assistantConnection_recognizedAdditionalSpeechInterpretation_refId___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidRecognizedAdditionalSpeechInterpretation:*(void *)(a1 + 32) refId:*(void *)(a1 + 40)];
}

- (void)assistantConnection:(id)a3 recognitionUpdateWithPhrases:(id)a4 utterances:(id)a5 refId:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __85__AFUISiriSession_assistantConnection_recognitionUpdateWithPhrases_utterances_refId___block_invoke;
  v15[3] = &unk_264692190;
  id v16 = v9;
  id v17 = v10;
  id v18 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(AFUISiriSession *)self _performBlockWithDelegate:v15];
}

uint64_t __85__AFUISiriSession_assistantConnection_recognitionUpdateWithPhrases_utterances_refId___block_invoke(void *a1, void *a2)
{
  return [a2 siriSessionDidUpdateRecognitionWithPhrases:a1[4] utterances:a1[5] refId:a1[6]];
}

- (void)assistantConnection:(id)a3 speechRecognizedPartialResult:(id)a4
{
  id v5 = a4;
  kdebug_trace();
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__AFUISiriSession_assistantConnection_speechRecognizedPartialResult___block_invoke;
  v7[3] = &unk_264691DF0;
  id v8 = v5;
  id v6 = v5;
  [(AFUISiriSession *)self _performBlockWithDelegate:v7];
}

uint64_t __69__AFUISiriSession_assistantConnection_speechRecognizedPartialResult___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidReceiveSpeechPartialResultCommand:*(void *)(a1 + 32)];
}

- (void)assistantConnectionAudioSessionDidBeginInterruption:(id)a3 userInfo:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[AFUISiriSession assistantConnectionAudioSessionDidBeginInterruption:userInfo:]";
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s #audioInterruption audio session interruption began userInfo: %{public}@", buf, 0x16u);
  }
  uint64_t v7 = mach_absolute_time();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __80__AFUISiriSession_assistantConnectionAudioSessionDidBeginInterruption_userInfo___block_invoke;
  v9[3] = &unk_2646921B8;
  id v10 = v5;
  uint64_t v11 = v7;
  id v8 = v5;
  [(AFUISiriSession *)self _performBlockWithDelegate:v9];
}

uint64_t __80__AFUISiriSession_assistantConnectionAudioSessionDidBeginInterruption_userInfo___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidReceiveAudioSessionInterruptionBeganWithUserInfo:*(void *)(a1 + 32) machAbsoluteTime:*(void *)(a1 + 40)];
}

- (void)assistantConnectionAudioSessionDidEndInterruption:(id)a3 shouldResume:(BOOL)a4 userInfo:(id)a5
{
  BOOL v5 = a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a5;
  uint64_t v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    id v9 = "-[AFUISiriSession assistantConnectionAudioSessionDidEndInterruption:shouldResume:userInfo:]";
    __int16 v10 = 1026;
    BOOL v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #audioInterruption audio session interruption ended shouldResume: %{public, BOOL}d userInfo: %{public}@", (uint8_t *)&v8, 0x1Cu);
  }
}

- (void)_startRequestWithBlock:(id)a3
{
  id v5 = a3;
  [(SRUIFSpeechRequestHandler *)self->_speechRequestHandler nonSpeechRequestWillBegin];
  int v4 = v5;
  if (v5)
  {
    (*((void (**)(id))v5 + 2))(v5);
    int v4 = v5;
  }
}

- (BOOL)_hasActiveRequest
{
  return [(SRUIFSiriSessionStateHandler *)self->_stateHandler state] != 0;
}

- (id)_preparedSpeechRequestWithRequestOptions:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 speechRequestOptions];
  if (v5)
  {
    id v6 = [v4 speechRequestOptions];
    id v7 = (id)[v6 copy];
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x263F28690]);
  }

  uint64_t v8 = [v4 requestSource];
  uint64_t v9 = 0;
  switch(v8)
  {
    case 1:
    case 6:
    case 7:
      uint64_t v9 = v8;
      break;
    case 2:
    case 28:
      uint64_t v9 = 1;
      break;
    case 3:
    case 48:
      uint64_t v9 = 4;
      break;
    case 4:
      uint64_t v9 = 2;
      break;
    case 5:
      uint64_t v9 = 3;
      break;
    case 8:
      uint64_t v10 = objc_msgSend(v7, "activationEvent", 0);
      if (v10) {
        uint64_t v9 = v10;
      }
      else {
        uint64_t v9 = 8;
      }
      break;
    case 9:
      uint64_t v9 = 5;
      break;
    case 10:
    case 11:
    case 13:
    case 14:
    case 16:
    case 37:
    case 43:
      uint64_t v9 = 9;
      break;
    case 12:
      uint64_t v9 = 11;
      break;
    case 22:
      uint64_t v9 = 10;
      break;
    case 26:
      [v7 setSuppressStartAlert:0];
      uint64_t v9 = 17;
      break;
    case 29:
      uint64_t v9 = 23;
      break;
    case 30:
      uint64_t v9 = 22;
      break;
    case 31:
      uint64_t v9 = 24;
      break;
    case 36:
      uint64_t v9 = 27;
      break;
    case 38:
      uint64_t v9 = 30;
      break;
    case 44:
      uint64_t v9 = 16;
      break;
    case 45:
      uint64_t v9 = 34;
      break;
    case 46:
      uint64_t v9 = 35;
      break;
    default:
      break;
  }
  [v7 setActivationEvent:v9];
  [v7 setIsEyesFree:self->_eyesFree];
  BOOL v11 = [v4 serverCommandId];
  [v7 setServerCommandId:v11];

  [v4 timestamp];
  objc_msgSend(v7, "setActivationEventTime:");
  [v4 buttonDownTimestamp];
  objc_msgSend(v7, "setHomeButtonDownEventTime:");
  [v4 expectedTimestamp];
  objc_msgSend(v7, "setExpectedActivationEventTime:");
  objc_msgSend(v7, "setIsInitialBringUp:", objc_msgSend(v4, "isInitialBringUp"));
  __int16 v12 = [v4 activationDeviceIdentifier];
  [v7 setActivationDeviceIdentifier:v12];

  if ([v4 useAutomaticEndpointing]) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 2;
  }
  [v7 setEndpointerOperationMode:v13];
  objc_msgSend(v7, "setUseStreamingDictation:", objc_msgSend(v4, "useStreamingDictation"));
  uint64_t v14 = [v4 homeButtonUpFromBeep];
  [v7 setHomeButtonUpFromBeep:v14];

  objc_msgSend(v7, "setAcousticIdEnabled:", objc_msgSend(v4, "acousticIdEnabled"));
  objc_msgSend(v7, "setReleaseAudioSessionOnRecordingCompletion:", objc_msgSend(v4, "releaseAudioSessionOnRecordingCompletion"));
  [v7 setSpeechSynthesisRecord:self->_lastSpeechSynthesisRecord];
  [v7 setIsSystemApertureEnabled:AFUIIsDeviceSystemApertureEnabled()];
  uint64_t v15 = [v4 presentationMode];
  if (!v15)
  {
    uint64_t v16 = [v4 requestInfo];
    id v17 = [v16 speechRequestOptions];
    uint64_t v15 = [v17 presentationMode];
  }
  [v7 setPresentationMode:v15];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDataSource);
  objc_msgSend(v7, "setIsInAmbient:", objc_msgSend(WeakRetained, "isAmbientPresented:", self));

  os_log_t v19 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    long long v20 = v19;
    int v21 = [v7 isInAmbient];
    id v22 = "NO";
    if (v21) {
      id v22 = "YES";
    }
    int v27 = 136315394;
    __int16 v28 = "-[AFUISiriSession _preparedSpeechRequestWithRequestOptions:]";
    __int16 v29 = 2080;
    id v30 = v22;
    _os_log_impl(&dword_223099000, v20, OS_LOG_TYPE_DEFAULT, "%s #ambientRF setIsInAmbient: %s", (uint8_t *)&v27, 0x16u);
  }
  id v23 = [v4 startRecordingSoundId];

  if (v23)
  {
    __int16 v24 = [v4 startRecordingSoundId];
    int64_t v25 = [(AFUISiriSession *)self _startingRecordingAlertPolicyForSoundID:v24];

    [v7 setRecordingAlertPolicy:v25];
  }

  return v7;
}

- (id)_startingRecordingAlertPolicyForSoundID:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x263F65F08]])
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __59__AFUISiriSession__startingRecordingAlertPolicyForSoundID___block_invoke;
    v10[3] = &__block_descriptor_40_e50_v16__0___AFSpeechRecordingAlertBehaviorMutating__8l;
    void v10[4] = 5;
    id v3 = (void *)[MEMORY[0x263F28680] newWithBuilder:v10];
    id v4 = (void *)MEMORY[0x263F28688];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __59__AFUISiriSession__startingRecordingAlertPolicyForSoundID___block_invoke_2;
    v8[3] = &unk_264692200;
    id v9 = v3;
    id v5 = v3;
    id v6 = (void *)[v4 newWithBuilder:v8];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

uint64_t __59__AFUISiriSession__startingRecordingAlertPolicyForSoundID___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBeepSoundID:*(void *)(a1 + 32)];
}

uint64_t __59__AFUISiriSession__startingRecordingAlertPolicyForSoundID___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setStartingAlertBehavior:*(void *)(a1 + 32)];
}

- (void)_sendContextWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __46__AFUISiriSession__sendContextWithCompletion___block_invoke;
  v6[3] = &unk_264692250;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  [(AFUISiriSession *)self _performBlockWithDelegate:v6];
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __46__AFUISiriSession__sendContextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__AFUISiriSession__sendContextWithCompletion___block_invoke_2;
  v4[3] = &unk_264692228;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = *(id *)(a1 + 32);
  [v3 siriSessionGetRequestContextWithCompletionHandler:v4];

  objc_destroyWeak(&v6);
}

void __46__AFUISiriSession__sendContextWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && [v3 count])
  {
    uint64_t v5 = [v3 valueForKey:@"dictionary"];

    id v6 = objc_alloc_init(MEMORY[0x263F64CB0]);
    v8[0] = v5;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
    [v6 setOrderedContext:v7];

    [WeakRetained performAceCommand:v6 turnIdentifier:0 machAbsoluteTime:(double)mach_absolute_time()];
    id v3 = (id)v5;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_startSpeechRequestWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(AFUISiriSession *)self _preparedSpeechRequestWithRequestOptions:v7];
  uint64_t v8 = [v7 isInitialBringUp];

  [(AFUISiriSession *)self _startSpeechRequestWithSpeechRequestOptions:v9 isInitialBringUp:v8 completion:v6];
}

- (void)_startSpeechRequestWithSpeechRequestOptions:(id)a3 isInitialBringUp:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v24 = *MEMORY[0x263EF8340];
  p_localDelegate = &self->_localDelegate;
  id v9 = a5;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_localDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v12 = objc_loadWeakRetained((id *)p_localDelegate);
    uint64_t v13 = [v12 headphonesAuthenticated];
  }
  else
  {
    uint64_t v13 = 0;
  }

  uint64_t v14 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = NSNumber;
    uint64_t v16 = v14;
    id v17 = [v15 numberWithBool:v13];
    int v20 = 136315394;
    int v21 = "-[AFUISiriSession _startSpeechRequestWithSpeechRequestOptions:isInitialBringUp:completion:]";
    __int16 v22 = 2112;
    id v23 = v17;
    _os_log_impl(&dword_223099000, v16, OS_LOG_TYPE_DEFAULT, "%s 🎧 setIsHeadphonesAuthenticated: %@", (uint8_t *)&v20, 0x16u);
  }
  [v10 setIsHeadphonesAuthenticated:v13];
  speechRequestHandler = self->_speechRequestHandler;
  os_log_t v19 = [(AFUISiriSession *)self _instrumentationTurnContext];
  [(SRUIFSpeechRequestHandler *)speechRequestHandler startSpeechRequestWithSpeechRequestOptions:v10 instrumentationTurn:v19 isInitialBringUp:v5 completion:v9];
}

- (void)_startSpeechRequestWithSpeechFileAtURL:(id)a3 completion:(id)a4
{
}

- (void)_startSpeechPronunciationRequestWithContext:(id)a3 options:(id)a4 completion:(id)a5
{
  BOOL v11 = (void (**)(id, void))a5;
  id v8 = a3;
  id v9 = [(AFUISiriSession *)self _preparedSpeechRequestWithRequestOptions:a4];
  id v10 = [(AFUISiriSession *)self _connection];
  [v10 startSpeechPronunciationRequestWithOptions:v9 pronunciationContext:v8];

  if (v11) {
    v11[2](v11, 0);
  }
}

- (void)stopRecordingSpeech
{
}

- (void)cancelSpeechRequest
{
}

- (void)requestDidPresentViewForUICommand:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 temporary])
    {
      id v6 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315394;
        id v12 = "-[AFUISiriSession requestDidPresentViewForUICommand:]";
        __int16 v13 = 2112;
        id v14 = v5;
        _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s Not transitioning to SRUIFSiriSessionEventRequestFinished for temporary command : %@", (uint8_t *)&v11, 0x16u);
      }
LABEL_10:

      goto LABEL_11;
    }
  }
  self->_currentRequestDidPresent = 1;
  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:6];
  if (AFIsInternalInstall() && objc_msgSend(v4, "sruif_usefulUserResultType"))
  {
    kdebug_trace();
    id v5 = [v4 deserializationDuration];
    if (v5)
    {
      id v7 = objc_alloc(MEMORY[0x263F28550]);
      id v8 = [v4 aceId];
      id v9 = (void *)[v7 initWithOriginalCommandId:v8 category:6 duration:v5];

      id v10 = [(AFUISiriSession *)self _connection];
      [v10 recordUIMetrics:v9];
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)requestDidPresentViewForErrorCommand:(id)a3
{
  self->_currentRequestDidPresent = 1;
  [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:7];
}

- (void)recordUIMetrics:(id)a3
{
  id v4 = a3;
  id v5 = [(AFUISiriSession *)self underlyingConnection];
  [v5 recordUIMetrics:v4];
}

- (void)recordRequestMetricEvent:(id)a3 withTimestamp:(double)a4
{
  id v6 = a3;
  id v7 = [(AFUISiriSession *)self underlyingConnection];
  [v7 recordRequestMetric:v6 withTimestamp:a4];
}

- (void)recordMetricsContext:(id)a3 forDisambiguatedAppWIthBundleIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AFUISiriSession *)self underlyingConnection];
  [v8 sendFeedbackToAppPreferencesPredictorForMetricsContext:v7 selectedBundleId:v6];
}

- (void)audioRoutePickerWillShow
{
}

uint64_t __43__AFUISiriSession_audioRoutePickerWillShow__block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionWillShowAudioRoutePicker];
}

- (void)audioRoutePickerWillDismiss
{
}

uint64_t __46__AFUISiriSession_audioRoutePickerWillDismiss__block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionWillDismissAudioRoutePicker];
}

- (void)speechSynthesisDidFinish:(id)a3
{
}

- (void)speechSynthesisDidUpdatePowerLevelTo:(float)a3
{
  id v5 = [(AFUISiriSession *)self localDelegate];
  *(float *)&double v4 = a3;
  [v5 siriSessionAudioOutputDidChangePowerLevel:v4];
}

- (void)didLoseAttentionWithEvent:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = SRUIFStringForUserAttentionLossEvent();
    int v8 = 136315394;
    id v9 = "-[AFUISiriSession didLoseAttentionWithEvent:]";
    __int16 v10 = 2112;
    int v11 = v7;
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s #userAttention Attention was lost for event: %@", (uint8_t *)&v8, 0x16u);
  }
  if (a3 == 1) {
    [(AFUISiriSession *)self _updateModesConfigurationForAttentionType:1 value:0];
  }
}

- (void)didGainAttentionWithEvent:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = SRUIFStringForUserAttentionGainEvent();
    int v8 = 136315394;
    id v9 = "-[AFUISiriSession didGainAttentionWithEvent:]";
    __int16 v10 = 2112;
    int v11 = v7;
    _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s #userAttention Attention was gained for event: %@", (uint8_t *)&v8, 0x16u);
  }
  if (a3 != 1)
  {
    if (a3 == 5)
    {
      a3 = 8;
    }
    else
    {
      if (a3 != 3) {
        return;
      }
      a3 = 2;
    }
  }
  [(AFUISiriSession *)self _updateModesConfigurationForAttentionType:a3 value:1];
}

- (void)_updateModesConfigurationForAttentionType:(unint64_t)a3 value:(BOOL)a4
{
  objc_initWeak(&location, self);
  modesConfiguration = self->_modesConfiguration;
  if (modesConfiguration)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __67__AFUISiriSession__updateModesConfigurationForAttentionType_value___block_invoke_2;
    v12[3] = &unk_264692278;
    int v8 = v13;
    objc_copyWeak(v13, &location);
    v13[1] = (id)a3;
    BOOL v14 = a4;
    id v9 = [(AFModesConfiguration *)modesConfiguration mutatedCopyWithMutator:v12];
  }
  else
  {
    __int16 v10 = (void *)MEMORY[0x263F28558];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __67__AFUISiriSession__updateModesConfigurationForAttentionType_value___block_invoke;
    v15[3] = &unk_264692278;
    int v8 = v16;
    objc_copyWeak(v16, &location);
    v16[1] = (id)a3;
    BOOL v17 = a4;
    id v9 = (AFModesConfiguration *)[v10 newWithBuilder:v15];
  }
  int v11 = self->_modesConfiguration;
  self->_modesConfiguration = v9;

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __67__AFUISiriSession__updateModesConfigurationForAttentionType_value___block_invoke(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _populateModesConfiguration:v4 attentionType:*(void *)(a1 + 40) value:*(unsigned __int8 *)(a1 + 48)];
}

void __67__AFUISiriSession__updateModesConfigurationForAttentionType_value___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _populateModesConfiguration:v4 attentionType:*(void *)(a1 + 40) value:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_populateModesConfiguration:(id)a3 attentionType:(unint64_t)a4 value:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  switch(a4)
  {
    case 8uLL:
      if (v5) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 1;
      }
      id v11 = v7;
      [v7 setButtonPressDetected:v9];
      break;
    case 2uLL:
      if (v5) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 1;
      }
      id v11 = v7;
      [v7 setTouchScreenDetected:v10];
      break;
    case 1uLL:
      if (v5) {
        uint64_t v8 = 2;
      }
      else {
        uint64_t v8 = 1;
      }
      id v11 = v7;
      [v7 setFaceDetected:v8];
      break;
    default:
      goto LABEL_17;
  }
  id v7 = v11;
LABEL_17:
}

- (void)notifyStateManagerPresentationTransitionBegan
{
}

- (void)notifyStateManagerPresentationTransitionEnded
{
}

- (void)notifyStateManagerSpeakingBegan
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[AFUISiriSession notifyStateManagerSpeakingBegan]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts", (uint8_t *)&v4, 0xCu);
  }
  [(AFSiriClientStateManager *)self->_clientStateManager beginSpeakingForClient:self];
}

- (void)notifyStateManagerSpeakingEnded
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    BOOL v5 = "-[AFUISiriSession notifyStateManagerSpeakingEnded]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s #tts", (uint8_t *)&v4, 0xCu);
  }
  [(AFSiriClientStateManager *)self->_clientStateManager endSpeakingForClient:self];
}

- (void)notifyStateManagerTransactionBegan
{
}

- (void)notifyStateManagerTransactionEnded
{
}

- (void)promptedUserForInput
{
  if ([(AFUISiriSession *)self _isContinuousConversationAvailable])
  {
    uiBridgeClient = self->_uiBridgeClient;
    [(SRUIFUIBridgeClient *)uiBridgeClient promptedUserForInput];
  }
}

- (void)fetchAttendingState:(id)a3
{
  BOOL v5 = (void (**)(id, uint64_t))a3;
  if ([(AFUISiriSession *)self _isContinuousConversationAvailable]) {
    uint64_t v4 = [(SRUIFUIBridgeClient *)self->_uiBridgeClient isAttending];
  }
  else {
    uint64_t v4 = 0;
  }
  v5[2](v5, v4);
}

- (BOOL)attendingState
{
  int v3 = [(AFUISiriSession *)self _isContinuousConversationAvailable];
  if (v3)
  {
    uiBridgeClient = self->_uiBridgeClient;
    LOBYTE(v3) = [(SRUIFUIBridgeClient *)uiBridgeClient isAttending];
  }
  return v3;
}

- (void)_startLegacyDirectActionRequestWithInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v21 = "-[AFUISiriSession _startLegacyDirectActionRequestWithInfo:context:completion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_223099000, v11, OS_LOG_TYPE_DEFAULT, "%s #activation requestInfo: %@, context: %@", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __78__AFUISiriSession__startLegacyDirectActionRequestWithInfo_context_completion___block_invoke;
  v15[3] = &unk_2646922A0;
  objc_copyWeak(&v19, (id *)buf);
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

void __78__AFUISiriSession__startLegacyDirectActionRequestWithInfo_context_completion___block_invoke(id *a1)
{
  id v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __78__AFUISiriSession__startLegacyDirectActionRequestWithInfo_context_completion___block_invoke_2;
  id v9 = &unk_2646922A0;
  objc_copyWeak(&v13, v2);
  id v10 = a1[4];
  id v11 = a1[5];
  id v12 = a1[6];
  [WeakRetained _startRequestWithBlock:&v6];

  uint64_t v4 = (id *)objc_loadWeakRetained(v2);
  BOOL v5 = v4;
  if (v4) {
    objc_msgSend(v4[22], "performTransitionForEvent:", 0, v6, v7, v8, v9, v10, v11);
  }

  objc_destroyWeak(&v13);
}

uint64_t __78__AFUISiriSession__startLegacyDirectActionRequestWithInfo_context_completion___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v9[0] = *(void *)(a1 + 32);
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [WeakRetained setDirectActionApplicationContexts:v4];

  id v5 = objc_loadWeakRetained(v2);
  [v5 setApplicationContextForDirectAction:1];

  id v6 = objc_loadWeakRetained(v2);
  uint64_t v7 = [v6 _connection];
  [v7 startRequestWithInfo:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)_startContinuityRequestWithInfo:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[AFUISiriSession _startContinuityRequestWithInfo:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__AFUISiriSession__startContinuityRequestWithInfo_completion___block_invoke;
  v11[3] = &unk_264691EE0;
  objc_copyWeak(&v14, (id *)buf);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(AFUISiriSession *)self _startRequestWithBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

uint64_t __62__AFUISiriSession__startContinuityRequestWithInfo_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v3 = [WeakRetained _connection];
  [v3 startContinuationRequestWithUserInfo:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)_startRequestWithInfo:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v16 = "-[AFUISiriSession _startRequestWithInfo:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__AFUISiriSession__startRequestWithInfo_completion___block_invoke;
  v11[3] = &unk_264691EE0;
  objc_copyWeak(&v14, (id *)buf);
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(AFUISiriSession *)self _startRequestWithBlock:v11];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __52__AFUISiriSession__startRequestWithInfo_completion___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained _connection];
  [v4 startRequestWithInfo:*(void *)(a1 + 32)];

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
  id v6 = objc_loadWeakRetained(v2);
  [v6 _requestStartedWithInfo:*(void *)(a1 + 32)];
}

- (void)_requestStartedWithInfo:(id)a3
{
  if ([a3 activationEvent] == 10)
  {
    stateHandler = self->_stateHandler;
    [(SRUIFSiriSessionStateHandler *)stateHandler performTransitionForEvent:16];
  }
}

- (void)_startRequestWithText:(id)a3 turnIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __67__AFUISiriSession__startRequestWithText_turnIdentifier_completion___block_invoke;
  v14[3] = &unk_2646922C8;
  id v11 = v9;
  id v15 = v11;
  id v12 = v8;
  id v16 = v12;
  objc_copyWeak(&v18, &location);
  id v13 = v10;
  id v17 = v13;
  [(AFUISiriSession *)self _startRequestWithBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __67__AFUISiriSession__startRequestWithText_turnIdentifier_completion___block_invoke(uint64_t a1)
{
  id v5 = objc_alloc_init(MEMORY[0x263F285B0]);
  if (objc_opt_respondsToSelector())
  {
    [v5 setActivationEvent:5];
    [v5 setTurnIdentifier:*(void *)(a1 + 32)];
    [v5 setText:*(void *)(a1 + 40)];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    int v3 = [WeakRetained _connection];
    [v3 startRequestWithInfo:v5];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    int v3 = [WeakRetained _connection];
    [v3 startRequestWithText:*(void *)(a1 + 40)];
  }

  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
}

- (void)startCorrectedRequestWithText:(id)a3 correctionIdentifier:(id)a4 userSelectionResults:(id)a5 turnIdentifier:(id)a6 machAbsoluteTime:(double)a7
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v42 = a6;
  objc_initWeak(&location, self);
  id v15 = (void *)[MEMORY[0x263F28400] newTurnBasedContextWithPreviousTurnID:v42];
  id v16 = (id)*MEMORY[0x263F28348];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v15 turnIdentifier];
    *(_DWORD *)buf = 136315650;
    v54 = "-[AFUISiriSession startCorrectedRequestWithText:correctionIdentifier:userSelectionResults:turnIdentifier:machAbsoluteTime:]";
    __int16 v55 = 2112;
    id v56 = v17;
    __int16 v57 = 2112;
    id v58 = v42;
    _os_log_impl(&dword_223099000, v16, OS_LOG_TYPE_DEFAULT, "%s #instrumentation New Turn %@ <-> Old Turn %@ ", buf, 0x20u);
  }
  [(AFUISiriSession *)self _setInstrumentationTurnContext:v15];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __123__AFUISiriSession_startCorrectedRequestWithText_correctionIdentifier_userSelectionResults_turnIdentifier_machAbsoluteTime___block_invoke;
  v46[3] = &unk_2646922F0;
  objc_copyWeak(&v51, &location);
  id v18 = v12;
  id v47 = v18;
  id v39 = v13;
  id v48 = v39;
  id v40 = v14;
  id v49 = v40;
  id v41 = v15;
  id v50 = v41;
  [(AFUISiriSession *)self _startRequestWithBlock:v46];
  id v19 = objc_alloc_init(MEMORY[0x263F6ED78]);
  [v19 setInvocationSource:12];
  int v20 = [(AFUISiriSession *)self localDataSource];
  uint64_t v21 = [v20 lockStateForSiriSession:self];

  [v19 setIsDeviceLocked:v21 != 0];
  if ([MEMORY[0x263F286B8] isSAEEnabled])
  {
    id v22 = objc_alloc_init(MEMORY[0x263F6EDE8]);
    objc_msgSend(v22, "setIsTranscriptEdited:", 1, v39, v40);
    [v19 setTapToEditContext:v22];
    id v23 = objc_alloc(MEMORY[0x263F6EEE0]);
    id v24 = objc_alloc_init(MEMORY[0x263F08C38]);
    id v25 = (void *)[v23 initWithNSUUID:v24];

    [v19 setLinkId:v25];
    [v19 setHasLinkId:1];
    id v26 = objc_alloc_init(MEMORY[0x263F6EE40]);
    [v26 setLinkId:v25];
    [v26 setHasLinkId:1];
    [v26 setTypedText:v18];
    int v27 = (id)*MEMORY[0x263F28348];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v28 = [(AFUISiriSession *)self _instrumentationTurnContext];
      id v29 = [v28 turnIdentifier];
      id v30 = [v26 formattedText];
      *(_DWORD *)buf = 136315906;
      v54 = "-[AFUISiriSession startCorrectedRequestWithText:correctionIdentifier:userSelectionResults:turnIdentifier:machAbsoluteTime:]";
      __int16 v55 = 2112;
      id v56 = v26;
      __int16 v57 = 2112;
      id v58 = v29;
      __int16 v59 = 2112;
      id v60 = v30;
      _os_log_impl(&dword_223099000, v27, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", buf, 0x2Au);
    }
    uint64_t v31 = [(AFUISiriSession *)self _instrumentationTurnContext];
    [v31 emitInstrumentation:v26 machAbsoluteTime:mach_absolute_time()];
  }
  id v32 = (id)*MEMORY[0x263F28348];
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    id v33 = [(AFUISiriSession *)self _instrumentationTurnContext];
    id v34 = [v33 turnIdentifier];
    id v35 = [v19 formattedText];
    *(_DWORD *)buf = 136315906;
    v54 = "-[AFUISiriSession startCorrectedRequestWithText:correctionIdentifier:userSelectionResults:turnIdentifier:machAbsoluteTime:]";
    __int16 v55 = 2112;
    id v56 = v19;
    __int16 v57 = 2112;
    id v58 = v34;
    __int16 v59 = 2112;
    id v60 = v35;
    _os_log_impl(&dword_223099000, v32, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ in turn %@: \n%@", buf, 0x2Au);
  }
  id v36 = [(AFUISiriSession *)self _instrumentationTurnContext];
  [v36 emitInstrumentation:v19 machAbsoluteTime:mach_absolute_time()];

  id v37 = SRUIFConstructLaunchContextForLaunchStarted();
  v43[0] = MEMORY[0x263EF8330];
  v43[1] = 3221225472;
  v43[2] = __123__AFUISiriSession_startCorrectedRequestWithText_correctionIdentifier_userSelectionResults_turnIdentifier_machAbsoluteTime___block_invoke_194;
  v43[3] = &unk_264692318;
  objc_copyWeak(v45, &location);
  id v38 = v37;
  id v44 = v38;
  v45[1] = *(id *)&a7;
  [(AFUISiriSession *)self _performBlockWithDelegate:v43];

  objc_destroyWeak(v45);
  objc_destroyWeak(&v51);

  objc_destroyWeak(&location);
}

void __123__AFUISiriSession_startCorrectedRequestWithText_correctionIdentifier_userSelectionResults_turnIdentifier_machAbsoluteTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v2 = [WeakRetained _connection];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 56) turnIdentifier];
  [v2 startRequestWithCorrectedText:v3 forSpeechIdentifier:v4 userSelectionResults:v5 turnIdentifier:v6];
}

void __123__AFUISiriSession_startCorrectedRequestWithText_correctionIdentifier_userSelectionResults_turnIdentifier_machAbsoluteTime___block_invoke_194(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained _instrumentationTurnContext];
    [v6 siriSessionDidStartNewTurn:v5 associatedLaunchStartContext:*(void *)(a1 + 32) machAbsoluteTime:0 linkPreviousTurn:*(double *)(a1 + 48)];
  }
}

- (void)resultDidChangeForAceCommand:(id)a3
{
}

- (void)resultDidChangeForAceCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__AFUISiriSession_resultDidChangeForAceCommand_completion___block_invoke;
  v10[3] = &unk_264692040;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(AFUISiriSession *)self _performBlockWithDelegate:v10];
}

void __59__AFUISiriSession_resultDidChangeForAceCommand_completion___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__AFUISiriSession_resultDidChangeForAceCommand_completion___block_invoke_2;
  v5[3] = &unk_264692340;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  [a2 siriSessionResultForAceCommand:v4 completion:v5];
}

void __59__AFUISiriSession_resultDidChangeForAceCommand_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 40)) {
    return;
  }
  if (a2 == 2)
  {
    uint64_t v3 = (Class *)0x263F64820;
  }
  else
  {
    if (a2 != 1)
    {
      id v5 = 0;
      goto LABEL_9;
    }
    uint64_t v3 = (Class *)0x263F64830;
  }
  id v5 = objc_alloc_init(*v3);
LABEL_9:
  uint64_t v4 = [*(id *)(a1 + 32) aceId];
  [v5 setRefId:v4];

  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)telephonyRequestCompleted
{
  id v2 = [(AFUISiriSession *)self _connection];
  [v2 telephonyRequestCompleted];
}

- (void)setAlertContext
{
  uint64_t v3 = [(AFUISiriSession *)self localDataSource];
  uint64_t v4 = [v3 bulletinsForSiriSession:self];

  if (v4) {
    id v5 = (void *)v4;
  }
  else {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }
  id v7 = v5;
  id v6 = [(AFUISiriSession *)self _connection];
  [v6 setAlertContextWithBulletins:v7];
}

- (void)setApplicationContext
{
}

- (void)setApplicationContextForDirectAction:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v13 = 0;
  }
  else
  {
    id v5 = [(AFUISiriSession *)self localDataSource];
    id v13 = [v5 contextAppInfosForSiriSession:self];
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v7 = [(AFUISiriSession *)self localDataSource];
  id v8 = [v7 starkAppBundleIdentifierContextForSiriSession:self];
  [v6 addObjectsFromArray:v8];

  if (v3)
  {
    [(AFUISiriSession *)self directActionApplicationContexts];
  }
  else
  {
    id v9 = [(AFUISiriSession *)self localDataSource];
    id v10 = [v9 currentCarPlaySupportedOEMAppIDListForSiriSession:self];
    [v6 addObjectsFromArray:v10];

    [(AFUISiriSession *)self sessionDelegateContext];
  id v11 = };
  [v6 addObjectsFromArray:v11];

  id v12 = [(AFUISiriSession *)self _connection];
  [v12 fetchAppicationContextForApplicationInfo:v13 supplementalContext:v6 refID:0];
}

- (void)clearContext
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[AFUISiriSession clearContext]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  uint64_t v4 = [(AFUISiriSession *)self _connection];
  [v4 clearContext];
}

- (void)resetContextTypes:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[AFUISiriSession resetContextTypes:]";
    __int16 v11 = 2048;
    int64_t v12 = a3;
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s %zd", (uint8_t *)&v9, 0x16u);
    if ((a3 & 4) == 0)
    {
LABEL_3:
      if ((a3 & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      [(AFUISiriSession *)self setAlertContext];
      if ((a3 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((a3 & 4) == 0)
  {
    goto LABEL_3;
  }
  [(AFUISiriSession *)self clearContext];
  if ((a3 & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if (a3) {
LABEL_5:
  }
    [(AFUISiriSession *)self setApplicationContext];
LABEL_6:
  id v6 = [(AFUISiriSession *)self localDataSource];
  uint64_t v7 = [v6 lockStateForSiriSession:self];

  [(AFUISiriSession *)self setLockState:v7];
  [(AFUISiriSession *)self setWatchAuthenticated:0];
  id v8 = [(AFUISiriSession *)self localDelegate];
  [v8 siriSessionDidResetContext:self];
}

- (void)rollbackClearContext
{
  id v2 = [(AFUISiriSession *)self _connection];
  [v2 rollbackClearContext];
}

- (void)setDeviceInStarkMode:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL isDeviceInStarkMode = a3;
  id v4 = [(AFUISiriSession *)self _connection];
  [v4 setIsDeviceInStarkMode:v3];
}

- (void)setCarDNDActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFUISiriSession *)self _connection];
  [v4 setCarDNDActive:v3];
}

- (void)setSupportsCarPlayVehicleData:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AFUISiriSession *)self _connection];
  [v4 setSupportsCarPlayVehicleData:v3];
}

- (void)setLockState:(unint64_t)a3
{
  unsigned int v4 = (a3 >> 1) & 1;
  char v5 = a3 & 1;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__AFUISiriSession_setLockState___block_invoke;
  v6[3] = &unk_264692368;
  objc_copyWeak(v7, &location);
  char v8 = v4;
  char v9 = v5;
  v7[1] = (id)a3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __32__AFUISiriSession_setLockState___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v4 = [WeakRetained _connection];
  [v4 setLockState:*(unsigned __int8 *)(a1 + 48) screenLocked:*(unsigned __int8 *)(a1 + 49)];

  id v5 = objc_loadWeakRetained(v2);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__AFUISiriSession_setLockState___block_invoke_2;
  v6[3] = &__block_descriptor_40_e35_v16__0___AFUISiriSessionDelegate__8l;
  void v6[4] = *(void *)(a1 + 40);
  [v5 _performBlockWithDelegate:v6];
}

uint64_t __32__AFUISiriSession_setLockState___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidChangeLockState:*(void *)(a1 + 32)];
}

- (void)setAnnouncementRequestsPermittedByPresentationWhileActive:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    char v8 = "-[AFUISiriSession setAnnouncementRequestsPermittedByPresentationWhileActive:]";
    __int16 v9 = 1024;
    BOOL v10 = v3;
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s Updating announcement requests permitted by presentation: %{BOOL}d", (uint8_t *)&v7, 0x12u);
  }
  id v6 = [(AFUISiriSession *)self _connection];
  [v6 setAnnouncementRequestsPermittedByPresentationWhileActive:v3];
}

- (void)_handleUnlockAppCommand:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__AFUISiriSession__handleUnlockAppCommand_completion___block_invoke;
  aBlock[3] = &unk_264692018;
  id v8 = v7;
  id v25 = v8;
  id v9 = v6;
  id v24 = v9;
  BOOL v10 = _Block_copy(aBlock);
  uint64_t v11 = [v9 appBundleId];
  int64_t v12 = *MEMORY[0x263F28348];
  BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315394;
      int v27 = "-[AFUISiriSession _handleUnlockAppCommand:completion:]";
      __int16 v28 = 2112;
      id v29 = v11;
      _os_log_impl(&dword_223099000, v12, OS_LOG_TYPE_DEFAULT, "%s UnlockApp command received for appBundleId=%@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __54__AFUISiriSession__handleUnlockAppCommand_completion___block_invoke_196;
    v19[3] = &unk_264692390;
    id v21 = v10;
    id v15 = v9;
    id v20 = v15;
    objc_copyWeak(&v22, (id *)buf);
    [WeakRetained siriSession:self didReceiveAppUnlockRequestForAppId:v11 withCompletion:v19];

    id v16 = objc_alloc(MEMORY[0x263F28550]);
    id v17 = [v15 refId];
    id v18 = (void *)[v16 initWithOriginalCommandId:v17 category:5 duration:0];

    [(AFUISiriSession *)self recordUIMetrics:v18];
    objc_destroyWeak(&v22);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 136315138;
      int v27 = "-[AFUISiriSession _handleUnlockAppCommand:completion:]";
      _os_log_impl(&dword_223099000, v12, OS_LOG_TYPE_DEFAULT, "%s UnlockApp command received without appBundleId, returning failure", buf, 0xCu);
    }
    (*((void (**)(void *, void))v10 + 2))(v10, 0);
  }
}

void __54__AFUISiriSession__handleUnlockAppCommand_completion___block_invoke(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 40))
  {
    BOOL v3 = (Class *)0x263F64830;
    if (!a2) {
      BOOL v3 = (Class *)0x263F64820;
    }
    id v5 = objc_alloc_init(*v3);
    unsigned int v4 = [*(id *)(a1 + 32) aceId];
    [v5 setRefId:v4];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __54__AFUISiriSession__handleUnlockAppCommand_completion___block_invoke_196(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unsigned int v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[AFUISiriSession _handleUnlockAppCommand:completion:]_block_invoke";
    __int16 v9 = 2050;
    uint64_t v10 = a2;
    _os_log_impl(&dword_223099000, v4, OS_LOG_TYPE_DEFAULT, "%s APGuard complete for App Unlock, result=%{public}ld", (uint8_t *)&v7, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (a2) {
    [*(id *)(a1 + 32) failureCommands];
  }
  else {
  id v5 = [*(id *)(a1 + 32) successCommands];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _performAceCommands:v5];
}

- (void)_handleUnlockDeviceCommand:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(AFUISiriSession *)self localDataSource];
  uint64_t v9 = [v8 lockStateForSiriSession:self];

  uint64_t v10 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v28 = "-[AFUISiriSession _handleUnlockDeviceCommand:completion:]";
    __int16 v29 = 2048;
    uint64_t v30 = v9;
    _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s Lock state while handling unlockDevice command = %zd", buf, 0x16u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__AFUISiriSession__handleUnlockDeviceCommand_completion___block_invoke;
  aBlock[3] = &unk_264692018;
  id v11 = v7;
  id v26 = v11;
  id v12 = v6;
  id v25 = v12;
  BOOL v13 = _Block_copy(aBlock);
  id v14 = v13;
  if ((v9 & 2) != 0)
  {
    objc_initWeak((id *)buf, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __57__AFUISiriSession__handleUnlockDeviceCommand_completion___block_invoke_2;
    v20[3] = &unk_2646923B8;
    objc_copyWeak(&v23, (id *)buf);
    id v21 = v12;
    id v22 = v14;
    [WeakRetained siriSession:self didReceiveDeviceUnlockRequestAndCancelRequest:0 withCompletion:v20];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    (*((void (**)(void *, uint64_t))v13 + 2))(v13, 1);
    id v15 = [v12 successCommands];
    [(AFUISiriSession *)self _performAceCommands:v15];
  }
  id v17 = objc_alloc(MEMORY[0x263F28550]);
  id v18 = [v12 refId];
  id v19 = (void *)[v17 initWithOriginalCommandId:v18 category:5 duration:0];

  [(AFUISiriSession *)self recordUIMetrics:v19];
}

void __57__AFUISiriSession__handleUnlockDeviceCommand_completion___block_invoke(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 40))
  {
    BOOL v3 = (Class *)0x263F64830;
    if (!a2) {
      BOOL v3 = (Class *)0x263F64820;
    }
    id v5 = objc_alloc_init(*v3);
    unsigned int v4 = [*(id *)(a1 + 32) aceId];
    [v5 setRefId:v4];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __57__AFUISiriSession__handleUnlockDeviceCommand_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 2:
      uint64_t v4 = [*(id *)(a1 + 32) cancellationCommands];
      goto LABEL_6;
    case 1:
      id v7 = [*(id *)(a1 + 32) failureCommands];
      id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_8;
    case 0:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
      [WeakRetained setLockState:0];

      uint64_t v4 = [*(id *)(a1 + 32) successCommands];
LABEL_6:
      id v7 = (id)v4;
      id v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_8:
      v5();
      goto LABEL_10;
  }
  id v7 = 0;
LABEL_10:
  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  [v6 _performAceCommands:v7];
}

- (void)_handleUnlockDeviceWithWatchCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__AFUISiriSession__handleUnlockDeviceWithWatchCommand_completion___block_invoke;
  aBlock[3] = &unk_264692018;
  id v8 = v7;
  id v21 = v8;
  id v9 = v6;
  id v20 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  id v11 = [(AFUISiriSession *)self _watchAuthenticationManager];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __66__AFUISiriSession__handleUnlockDeviceWithWatchCommand_completion___block_invoke_2;
  v14[3] = &unk_2646923E0;
  objc_copyWeak(&v17, &location);
  id v12 = v10;
  id v16 = v12;
  id v13 = v9;
  id v15 = v13;
  [v11 requestWatchAuthentication:v14];

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __66__AFUISiriSession__handleUnlockDeviceWithWatchCommand_completion___block_invoke(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 40))
  {
    BOOL v3 = (Class *)0x263F64830;
    if (!a2) {
      BOOL v3 = (Class *)0x263F64820;
    }
    id v5 = objc_alloc_init(*v3);
    uint64_t v4 = [*(id *)(a1 + 32) aceId];
    [v5 setRefId:v4];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __66__AFUISiriSession__handleUnlockDeviceWithWatchCommand_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2)
    {
      id v6 = objc_loadWeakRetained(v4);
      [v6 setWatchAuthenticated:1];

      [*(id *)(a1 + 32) successCommands];
    }
    else
    {
      [*(id *)(a1 + 32) failureCommands];
    id v7 = };
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __66__AFUISiriSession__handleUnlockDeviceWithWatchCommand_completion___block_invoke_3;
    v9[3] = &unk_264691C90;
    objc_copyWeak(&v11, v4);
    id v10 = v7;
    id v8 = v7;
    dispatch_async(MEMORY[0x263EF83A0], v9);

    objc_destroyWeak(&v11);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __66__AFUISiriSession__handleUnlockDeviceWithWatchCommand_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _performAceCommands:*(void *)(a1 + 32)];
}

- (void)setWatchAuthenticated:(BOOL)a3
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__AFUISiriSession_setWatchAuthenticated___block_invoke;
  block[3] = &unk_264691B40;
  objc_copyWeak(&v5, &location);
  BOOL v6 = a3;
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __41__AFUISiriSession_setWatchAuthenticated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained _connection];
  [v2 setWatchAuthenticated:*(unsigned __int8 *)(a1 + 40)];
}

- (SRUIFWatchAuthenticationManager)_watchAuthenticationManager
{
  watchAuthenticationManager = self->_watchAuthenticationManager;
  if (!watchAuthenticationManager)
  {
    uint64_t v4 = (SRUIFWatchAuthenticationManager *)objc_alloc_init(MEMORY[0x263F75510]);
    id v5 = self->_watchAuthenticationManager;
    self->_watchAuthenticationManager = v4;

    watchAuthenticationManager = self->_watchAuthenticationManager;
  }

  return watchAuthenticationManager;
}

- (void)_performAceCommand:(id)a3 forRequestUpdateViewsCommand:(id)a4 afterDelay:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  objc_initWeak(&location, self);
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  id v13[2] = __78__AFUISiriSession__performAceCommand_forRequestUpdateViewsCommand_afterDelay___block_invoke;
  v13[3] = &unk_264692408;
  objc_copyWeak(&v16, &location);
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_after(v10, MEMORY[0x263EF83A0], v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __78__AFUISiriSession__performAceCommand_forRequestUpdateViewsCommand_afterDelay___block_invoke(id *a1)
{
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v4 = a1[4];
  double v5 = (double)mach_absolute_time();
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__AFUISiriSession__performAceCommand_forRequestUpdateViewsCommand_afterDelay___block_invoke_2;
  v6[3] = &unk_264692408;
  objc_copyWeak(&v9, v2);
  id v7 = a1[4];
  id v8 = a1[5];
  [WeakRetained _performAceCommand:v4 turnIdentifier:0 machAbsoluteTime:v6 conflictHandler:v5];

  objc_destroyWeak(&v9);
}

void __78__AFUISiriSession__performAceCommand_forRequestUpdateViewsCommand_afterDelay___block_invoke_2(id *a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__AFUISiriSession__performAceCommand_forRequestUpdateViewsCommand_afterDelay___block_invoke_3;
  block[3] = &unk_264692408;
  objc_copyWeak(&v5, a1 + 6);
  id v3 = a1[4];
  id v4 = a1[5];
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v5);
}

void __78__AFUISiriSession__performAceCommand_forRequestUpdateViewsCommand_afterDelay___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _performAceCommand:*(void *)(a1 + 32) forRequestUpdateViewsCommand:*(void *)(a1 + 40) afterDelay:10.0];
}

- (void)_handleRequestUpdateViewsCommand:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = [v6 timeInSeconds];
  [v8 doubleValue];
  double v10 = v9;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = objc_msgSend(v6, "commands", 0);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        [(AFUISiriSession *)self _performAceCommand:*(void *)(*((void *)&v18 + 1) + 8 * v15++) forRequestUpdateViewsCommand:v6 afterDelay:v10];
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  if (v7)
  {
    id v16 = objc_alloc_init(MEMORY[0x263F64830]);
    id v17 = [v6 aceId];
    [v16 setRefId:v17];

    v7[2](v7, v16);
  }
}

- (void)performAceCommand:(id)a3 turnIdentifier:(id)a4 machAbsoluteTime:(double)a5
{
}

- (void)_performAceCommands:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(AFUISiriSession *)self performAceCommand:*(void *)(*((void *)&v9 + 1) + 8 * v8++) turnIdentifier:0 machAbsoluteTime:(double)mach_absolute_time()];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_performAceCommand:(id)a3 turnIdentifier:(id)a4 machAbsoluteTime:(double)a5 conflictHandler:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (SRUIFShouldInstrumentLaunchContextForAceCommand())
  {
    uint64_t v13 = SRUIFConstructLaunchContextForLaunchStarted();
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __86__AFUISiriSession__performAceCommand_turnIdentifier_machAbsoluteTime_conflictHandler___block_invoke;
    v30[3] = &unk_2646921B8;
    id v31 = v13;
    double v32 = a5;
    id v14 = v13;
    [(AFUISiriSession *)self _performBlockWithDelegate:v30];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    uint64_t v15 = objc_msgSend(v10, "commands", 0, 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v37 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v27 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:8];
            goto LABEL_16;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v26 objects:v37 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SRUIFSiriSessionStateHandler *)self->_stateHandler performTransitionForEvent:8];
    }
  }
  if ([(AFUISiriSession *)self _aceObjectExpectsTurnIdentifierWhenSendingCommand:v10])
  {
    if (!v11)
    {
      long long v20 = (void *)*MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
        -[AFUISiriSession _performAceCommand:turnIdentifier:machAbsoluteTime:conflictHandler:](v20);
      }
LABEL_25:
      id v11 = 0;
    }
  }
  else if (v11)
  {
    long long v21 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v21;
      uint64_t v23 = (objc_class *)objc_opt_class();
      id v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 136315394;
      id v34 = "-[AFUISiriSession _performAceCommand:turnIdentifier:machAbsoluteTime:conflictHandler:]";
      __int16 v35 = 2112;
      id v36 = v24;
      _os_log_impl(&dword_223099000, v22, OS_LOG_TYPE_DEFAULT, "%s Sending ace command of class %@ with a turn identifier is unsupported. Dropping turn identifier.", buf, 0x16u);
    }
    goto LABEL_25;
  }
  id v25 = [(AFUISiriSession *)self _connection];
  [v25 sendGenericAceCommand:v10 turnIdentifier:v11 conflictHandler:v12];
}

uint64_t __86__AFUISiriSession__performAceCommand_turnIdentifier_machAbsoluteTime_conflictHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionRequestsInstrumentingMessage:*(void *)(a1 + 32) machAbsoluteTime:*(double *)(a1 + 40)];
}

- (BOOL)_aceObjectExpectsTurnIdentifierWhenSendingCommand:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)siriUIDidPresentDynamicSnippetWithInfo:(id)a3
{
  id v3 = a3;
  if (siriUIDidPresentDynamicSnippetWithInfo__onceToken != -1) {
    dispatch_once(&siriUIDidPresentDynamicSnippetWithInfo__onceToken, &__block_literal_global_202);
  }
  if (CoreDuetLibraryCore())
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2050000000;
    id v4 = (void *)get_DKSystemEventStreamsClass_softClass;
    uint64_t v14 = get_DKSystemEventStreamsClass_softClass;
    if (!get_DKSystemEventStreamsClass_softClass)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __get_DKSystemEventStreamsClass_block_invoke;
      v10[3] = &unk_264691928;
      void v10[4] = &v11;
      __get_DKSystemEventStreamsClass_block_invoke((uint64_t)v10);
      id v4 = (void *)v12[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v11, 8);
    uint64_t v6 = [v5 siriServiceStream];
    uint64_t v7 = [v6 name];
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v8 = [MEMORY[0x263F08C38] UUID];
  long long v9 = [v8 UUIDString];
  AFRecordCoreDuetEventWithStream();
}

uint64_t __58__AFUISiriSession_siriUIDidPresentDynamicSnippetWithInfo___block_invoke()
{
  siriUIDidPresentDynamicSnippetWithInfo__sDuetQueue = (uint64_t)dispatch_queue_create("Core duet logging queue", 0);

  return MEMORY[0x270F9A758]();
}

+ (id)effectiveCoreLocationBundle
{
  id v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

- (void)end
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[AFUISiriSession end]";
    _os_log_impl(&dword_223099000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(AFUISiriSession *)self endForReason:0];
}

- (void)endForReason:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    long long v9 = "-[AFUISiriSession endForReason:]";
    __int16 v10 = 2048;
    int64_t v11 = a3;
    _os_log_impl(&dword_223099000, v5, OS_LOG_TYPE_DEFAULT, "%s reason %zd", (uint8_t *)&v8, 0x16u);
  }
  uint64_t v6 = [(AFUISiriSession *)self localDelegate];
  [v6 siriSessionWillEnd:self];

  [(SRUIFStateFeedbackManager *)self->_stateFeedbackManager siriSessionDidEnd];
  [(SRUIFSpeechRequestHandler *)self->_speechRequestHandler discardCurrentSpeechGroup];
  if ([(AFUISiriSession *)self _isContinuousConversationAvailable]) {
    [(SRUIFUIBridgeClient *)self->_uiBridgeClient endForReason:a3];
  }
  [(SRUIFAudioPowerLevelUpdater *)self->_audioPowerLevelUpdater invalidate];
  [(AFUISiriSession *)self _discardConnectionForReason:a3];
  [(AFSiriClientStateManager *)self->_clientStateManager invalidateClient:self];
  uint64_t v7 = [(AFUISiriSession *)self localDelegate];
  [v7 siriSessionDidEnd:self];
}

- (void)stopAttending
{
  if ([(AFUISiriSession *)self _isContinuousConversationAvailable])
  {
    uiBridgeClient = self->_uiBridgeClient;
    [(SRUIFUIBridgeClient *)uiBridgeClient stopAttending];
  }
}

- (void)_discardConnectionForReason:(int64_t)a3
{
  id v5 = [(AFUISiriSession *)self _connection];
  [v5 cancelRequestForReason:a3];

  uint64_t v6 = [(AFUISiriSession *)self _connection];
  [v6 endSession];

  uint64_t v7 = [(AFUISiriSession *)self _connection];
  [v7 invalidate];

  int v8 = [(AFUISiriSession *)self _connection];
  [v8 setSpeechDelegate:0];

  long long v9 = [(AFUISiriSession *)self _connection];
  [v9 setDelegate:0];

  connection = self->_connection;
  self->_connection = 0;

  uiBridgeClient = self->_uiBridgeClient;
  self->_uiBridgeClient = 0;

  audioPowerLevelUpdater = self->_audioPowerLevelUpdater;
  self->_audioPowerLevelUpdater = 0;
}

- (BOOL)isListening
{
  return [(SRUIFSiriSessionStateHandler *)self->_stateHandler state] == 1;
}

- (float)recordingPowerLevel
{
  audioPowerLevelUpdater = self->_audioPowerLevelUpdater;
  if (!audioPowerLevelUpdater)
  {
    int v4 = [MEMORY[0x263F28510] isContinuousConversationEnabled];
    uint64_t v5 = 32;
    if (v4) {
      uint64_t v5 = 192;
    }
    audioPowerLevelUpdater = *(Class *)((char *)&self->super.isa + v5);
  }

  [(SRUIFAudioPowerLevelUpdater *)audioPowerLevelUpdater averagePower];
  return result;
}

- (id)underlyingConnection
{
  return self->_connection;
}

- (void)_localAuthenticationUIPresented
{
}

uint64_t __50__AFUISiriSession__localAuthenticationUIPresented__block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionIsPresentingLocalAuthenticationUI];
}

- (void)_applePaySheetPresented
{
}

uint64_t __42__AFUISiriSession__applePaySheetPresented__block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionIsPresentingApplePaySheet];
}

- (void)_updateActiveAccount:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  settingsConnection = self->_settingsConnection;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __40__AFUISiriSession__updateActiveAccount___block_invoke;
  v7[3] = &unk_264692430;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [(AFSettingsConnection *)settingsConnection fetchAccountsWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __40__AFUISiriSession__updateActiveAccount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      __40__AFUISiriSession__updateActiveAccount___block_invoke_cold_1();
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained) {
      objc_msgSend(WeakRetained, "_updateActiveAccount:withNumberOfActiveAccounts:", *(void *)(a1 + 32), objc_msgSend(v5, "count"));
    }
  }
}

- (void)_updateActiveAccount:(id)a3 withNumberOfActiveAccounts:(unint64_t)a4
{
  id v6 = [(SRUIFSiriSessionInfo *)self->_siriSessionInfo setActiveAccountAndGenerateLightweightInfo:a3];
  if (v6)
  {
    id v7 = (id)[(SRUIFSiriSessionInfo *)self->_siriSessionInfo setUserAccountCountGenerateLightweightInfo:a4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_localDelegate);
      [v10 siriSessionDidUpdateSessionInfo:v6];
    }
    if (objc_opt_respondsToSelector())
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __67__AFUISiriSession__updateActiveAccount_withNumberOfActiveAccounts___block_invoke;
      v11[3] = &unk_264691DF0;
      id v12 = v6;
      [(AFUISiriSession *)self _performBlockWithDelegate:v11];
    }
  }
}

uint64_t __67__AFUISiriSession__updateActiveAccount_withNumberOfActiveAccounts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 siriSessionDidUpdateSessionInfo:*(void *)(a1 + 32)];
}

- (void)_updateModesHeuristicsForRequestOptions:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (_os_feature_enabled_impl()) {
    char v5 = 0;
  }
  else {
    char v5 = [v4 isForBluetoothCar];
  }
  BOOL v6 = ([v4 currentLockState] & 2) == 0;
  modesConfiguration = self->_modesConfiguration;
  if (modesConfiguration)
  {
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __59__AFUISiriSession__updateModesHeuristicsForRequestOptions___block_invoke_214;
    v20[3] = &unk_264692458;
    id v8 = (id *)v21;
    id v9 = v4;
    char v22 = v5;
    BOOL v23 = v6;
    v21[0] = v9;
    v21[1] = self;
    char v24 = 0;
    id v10 = [(AFModesConfiguration *)modesConfiguration mutatedCopyWithMutator:v20];
    int64_t v11 = self->_modesConfiguration;
    self->_modesConfiguration = v10;

    id v12 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = self->_modesConfiguration;
      *(_DWORD *)buf = 136315394;
      id v31 = "-[AFUISiriSession _updateModesHeuristicsForRequestOptions:]";
      __int16 v32 = 2112;
      id v33 = v13;
      uint64_t v14 = "%s #modes Updating modes configuration with heuristics related to RequestOptions: %@";
LABEL_9:
      _os_log_impl(&dword_223099000, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 0x16u);
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F28558];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __59__AFUISiriSession__updateModesHeuristicsForRequestOptions___block_invoke;
    v25[3] = &unk_264692458;
    id v8 = (id *)v26;
    id v16 = v4;
    char v27 = v5;
    BOOL v28 = v6;
    v26[0] = v16;
    v26[1] = self;
    char v29 = 0;
    uint64_t v17 = (AFModesConfiguration *)[v15 newWithBuilder:v25];
    uint64_t v18 = self->_modesConfiguration;
    self->_modesConfiguration = v17;

    id v12 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      long long v19 = self->_modesConfiguration;
      *(_DWORD *)buf = 136315394;
      id v31 = "-[AFUISiriSession _updateModesHeuristicsForRequestOptions:]";
      __int16 v32 = 2112;
      id v33 = v19;
      uint64_t v14 = "%s #modes Creating modes configuration with heuristics related to RequestOptions: %@";
      goto LABEL_9;
    }
  }
}

void __59__AFUISiriSession__updateModesHeuristicsForRequestOptions___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  BOOL v3 = ([*(id *)(a1 + 32) isForEyesFree] & 1) != 0 || *(unsigned char *)(a1 + 48) != 0;
  [v12 setIsEyesFree:v3];
  objc_msgSend(v12, "setIsUIFree:", objc_msgSend(*(id *)(a1 + 32), "isForUIFree"));
  objc_msgSend(v12, "setIsForCarDND:", objc_msgSend(*(id *)(a1 + 32), "isForCarDND"));
  objc_msgSend(v12, "setIsVoiceTriggerRequest:", objc_msgSend(*(id *)(a1 + 32), "isVoiceTriggerRequest"));
  objc_msgSend(v12, "setIsConnectedToCarPlay:", objc_msgSend(*(id *)(a1 + 32), "isConnectedToCarPlay"));
  objc_msgSend(v12, "setIsSiriAutoPrompt:", objc_msgSend(*(id *)(a1 + 32), "isInAutoPrompt"));
  objc_msgSend(v12, "setIsFlexibleFollowup:", objc_msgSend(*(id *)(a1 + 32), "isFlexibleFollowupRequest"));
  objc_msgSend(v12, "setIsRequestMadeWithPhysicalDeviceInteraction:", objc_msgSend(*(id *)(a1 + 32), "isRequestMadeWithPhysicalDeviceInteraction"));
  objc_msgSend(v12, "setUserTypedInSiri:", objc_msgSend(*(id *)(a1 + 32), "userTypedInSiri"));
  [v12 setIsDeviceUnlocked:*(unsigned __int8 *)(a1 + 49)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 104));
  objc_msgSend(v12, "setDeviceOrientation:", objc_msgSend(WeakRetained, "getDeviceOrientation:", *(void *)(a1 + 40)));

  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 104));
  if ([v5 recentButtonPressActivityDetected:*(void *)(a1 + 40)]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [v12 setButtonPressDetected:v6];

  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 104));
  if ([v7 recentTouchScreenActivityDetected:*(void *)(a1 + 40)]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  [v12 setTouchScreenDetected:v8];

  id v9 = [MEMORY[0x263F6C740] sharedSystemState];
  objc_msgSend(v12, "setIsDeviceScreenON:", objc_msgSend(v9, "deviceScreenIsOn"));

  id v10 = [MEMORY[0x263F6C740] sharedSystemState];
  objc_msgSend(v12, "setLiftToWakeDetected:", objc_msgSend(v10, "deviceLiftToWake"));

  if (objc_opt_respondsToSelector())
  {
    if (*(unsigned char *)(a1 + 50)) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    [v12 setIsUserEngagedWithDevice:v11];
  }
}

void __59__AFUISiriSession__updateModesHeuristicsForRequestOptions___block_invoke_214(uint64_t a1, void *a2)
{
  id v12 = a2;
  BOOL v3 = ([*(id *)(a1 + 32) isForEyesFree] & 1) != 0 || *(unsigned char *)(a1 + 48) != 0;
  [v12 setIsEyesFree:v3];
  objc_msgSend(v12, "setIsForCarDND:", objc_msgSend(*(id *)(a1 + 32), "isForCarDND"));
  objc_msgSend(v12, "setIsVoiceTriggerRequest:", objc_msgSend(*(id *)(a1 + 32), "isVoiceTriggerRequest"));
  objc_msgSend(v12, "setIsConnectedToCarPlay:", objc_msgSend(*(id *)(a1 + 32), "isConnectedToCarPlay"));
  objc_msgSend(v12, "setIsSiriAutoPrompt:", objc_msgSend(*(id *)(a1 + 32), "isInAutoPrompt"));
  objc_msgSend(v12, "setIsFlexibleFollowup:", objc_msgSend(*(id *)(a1 + 32), "isFlexibleFollowupRequest"));
  objc_msgSend(v12, "setIsRequestMadeWithPhysicalDeviceInteraction:", objc_msgSend(*(id *)(a1 + 32), "isRequestMadeWithPhysicalDeviceInteraction"));
  objc_msgSend(v12, "setUserTypedInSiri:", objc_msgSend(*(id *)(a1 + 32), "userTypedInSiri"));
  [v12 setIsDeviceUnlocked:*(unsigned __int8 *)(a1 + 49)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 104));
  objc_msgSend(v12, "setDeviceOrientation:", objc_msgSend(WeakRetained, "getDeviceOrientation:", *(void *)(a1 + 40)));

  id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 104));
  if ([v5 recentButtonPressActivityDetected:*(void *)(a1 + 40)]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [v12 setButtonPressDetected:v6];

  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 104));
  if ([v7 recentTouchScreenActivityDetected:*(void *)(a1 + 40)]) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 1;
  }
  [v12 setTouchScreenDetected:v8];

  id v9 = [MEMORY[0x263F6C740] sharedSystemState];
  objc_msgSend(v12, "setIsDeviceScreenON:", objc_msgSend(v9, "deviceScreenIsOn"));

  id v10 = [MEMORY[0x263F6C740] sharedSystemState];
  objc_msgSend(v12, "setLiftToWakeDetected:", objc_msgSend(v10, "deviceLiftToWake"));

  if (objc_opt_respondsToSelector())
  {
    if (*(unsigned char *)(a1 + 50)) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    [v12 setIsUserEngagedWithDevice:v11];
  }
}

- (id)_modeOverrideValue
{
  if (AFIsInternalInstall())
  {
    id v2 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.internal"];
    BOOL v3 = [v2 stringForKey:@"ModeOverride"];
    id v4 = [v3 lowercaseString];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_invocationEventForRequestOptions:(id)a3 localDataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F6ED78]);
  id v9 = [v6 speechRequestOptions];
  if ([v9 activationEvent] == 15)
  {
    uint64_t v10 = 21;
  }
  else
  {
    uint64_t v11 = [v9 voiceTriggerEventInfo];
    if (!v11) {
      goto LABEL_6;
    }
    id v12 = (void *)v11;
    uint64_t v13 = [v9 voiceTriggerEventInfo];
    uint64_t v14 = [v13 objectForKey:@"triggeredPhraseId"];
    uint64_t v15 = [v14 unsignedLongValue];

    if (v15 == 1) {
      uint64_t v10 = 80;
    }
    else {
LABEL_6:
    }
      uint64_t v10 = -[AFUISiriSession _mapInvocationSource:](self, "_mapInvocationSource:", [v6 requestSource]);
  }
  [v8 setInvocationSource:v10];
  objc_msgSend(v8, "setIsDeviceLocked:", objc_msgSend(v7, "lockStateForSiriSession:", self) != 0);
  if ([v6 isForStark])
  {
    id v16 = objc_alloc_init(MEMORY[0x263F6ED08]);
    uint64_t v17 = [v6 requestInfo];
    uint64_t v18 = [v17 activationEvent];

    if (v18 == 2)
    {
      uint64_t v19 = [v6 directActionEvent];
      long long v20 = [v6 appBundleIdentifier];
      [(AFUISiriSession *)self _updateCarPlayInvocationContext:v16 fromDirectActionEvent:v19 appBundleIdentifier:v20];
    }
    [v7 carPlayEnhancedVoiceTriggerModeForSiriSession:self];
    [v16 setEnhancedVoiceTriggerMode:SASCarPlayEnhancedVoiceTriggerModeToSISchemaEnhancedVoiceTriggerMode()];
    long long v21 = [MEMORY[0x263F6C740] sharedSystemState];
    [v21 carPlayTransportType];

    [v16 setCarPlayConnection:SASCarPlayTransportTypeToSISchemaCarPlayConnection()];
    [v8 setCarPlayInvocationContext:v16];
  }
  else if ([v6 tvRemoteType])
  {
    -[AFUISiriSession _invocationContextFromTVRemoteType:](self, "_invocationContextFromTVRemoteType:", [v6 tvRemoteType]);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    [v8 setTvRemoteInvocationContext:v16];
  }
  else
  {
    id v16 = objc_alloc_init(MEMORY[0x263F6ED50]);
    unint64_t v22 = [v6 longPressBehavior] + 1;
    if (v22 < 3) {
      uint64_t v23 = (v22 + 1);
    }
    else {
      uint64_t v23 = 0;
    }
    [v16 setHardwareButtonLongPressBehavior:v23];
    [v8 setHardwareButtonInvocationContext:v16];
  }

  return v8;
}

- (int)_mapInvocationSource:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0x35) {
    return 0;
  }
  else {
    return dword_2230F5B58[a3 - 1];
  }
}

- (void)_updateCarPlayInvocationContext:(id)a3 fromDirectActionEvent:(int64_t)a4 appBundleIdentifier:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  int64_t v9 = a4 - 2;
  if (unint64_t)(a4 - 2) < 0x11 && ((0x1E83Du >> v9))
  {
    uint64_t v12 = dword_2230F5C30[v9];
  }
  else
  {
    uint64_t v10 = *MEMORY[0x263F28348];
    BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
    uint64_t v12 = 0;
    if (v11)
    {
      int v13 = 136315394;
      uint64_t v14 = "-[AFUISiriSession _updateCarPlayInvocationContext:fromDirectActionEvent:appBundleIdentifier:]";
      __int16 v15 = 2048;
      int64_t v16 = a4;
      _os_log_impl(&dword_223099000, v10, OS_LOG_TYPE_DEFAULT, "%s Unhandled direct action event: %li", (uint8_t *)&v13, 0x16u);
      uint64_t v12 = 0;
    }
  }
  [v7 setDirectAction:v12];
  [v7 setBundleID:v8];
}

- (id)_invocationContextFromTVRemoteType:(unint64_t)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263F6EDE0]);
  id v5 = v4;
  if (a3 - 1 > 5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = dword_2230F5C74[a3 - 1];
  }
  [v4 setRemoteType:v6];

  return v5;
}

- (id)_tamaleDirectActionRequest
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F70030]) initWithIdentifier:@"com.apple.siri.ifflow.ajaxMedia"];
  id v3 = objc_alloc_init(MEMORY[0x263F70028]);
  id v4 = [MEMORY[0x263F70020] runSiriKitExecutorCommandWithContext:v3 payload:v2];
  id v5 = [MEMORY[0x263F70020] wrapCommandInStartLocalRequest:v4];

  return v5;
}

- (void)_startQuickTypeTamaleRequestWith:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int64_t v16 = "-[AFUISiriSession _startQuickTypeTamaleRequestWith:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_223099000, v8, OS_LOG_TYPE_DEFAULT, "%s startQuickTypeTamaleRequest turnId:%@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__AFUISiriSession__startQuickTypeTamaleRequestWith_completion___block_invoke;
  block[3] = &unk_264691EE0;
  objc_copyWeak(&v14, (id *)buf);
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __63__AFUISiriSession__startQuickTypeTamaleRequestWith_completion___block_invoke(id *a1)
{
  id v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __63__AFUISiriSession__startQuickTypeTamaleRequestWith_completion___block_invoke_2;
  v6[3] = &unk_264691EE0;
  objc_copyWeak(&v9, v2);
  id v7 = a1[4];
  id v8 = a1[5];
  [WeakRetained _startRequestWithBlock:v6];

  id v4 = (id *)objc_loadWeakRetained(v2);
  id v5 = v4;
  if (v4) {
    [v4[22] performTransitionForEvent:0];
  }

  objc_destroyWeak(&v9);
}

uint64_t __63__AFUISiriSession__startQuickTypeTamaleRequestWith_completion___block_invoke_2(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [v2 _tamaleDirectActionRequest];
  [v2 performAceCommand:v3 turnIdentifier:*(void *)(a1 + 32) machAbsoluteTime:(double)mach_absolute_time()];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (AFUISiriSessionDelegate)delegate
{
  return self->_delegate;
}

- (AFUISiriSessionLocalDataSource)localDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDataSource);

  return (AFUISiriSessionLocalDataSource *)WeakRetained;
}

- (AFUISiriSessionLocalDelegate)localDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_localDelegate);

  return (AFUISiriSessionLocalDelegate *)WeakRetained;
}

- (void)setLocalDelegate:(id)a3
{
}

- (BOOL)isEyesFree
{
  return self->_eyesFree;
}

- (void)setEyesFree:(BOOL)a3
{
  self->_eyesFree = a3;
}

- (BOOL)isProcessingAcousticIdRequest
{
  return self->_isProcessingAcousticIdRequest;
}

- (SRUIFSiriSessionInfo)siriSessionInfo
{
  return self->_siriSessionInfo;
}

- (void)setSiriSessionInfo:(id)a3
{
}

- (SRUIFSiriStateResponding)visualIntelligenceCameraDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualIntelligenceCameraDelegate);

  return (SRUIFSiriStateResponding *)WeakRetained;
}

- (void)setVisualIntelligenceCameraDelegate:(id)a3
{
}

- (NSArray)sessionDelegateContext
{
  return self->_sessionDelegateContext;
}

- (void)setSessionDelegateContext:(id)a3
{
}

- (NSArray)directActionApplicationContexts
{
  return self->_directActionApplicationContexts;
}

- (void)setDirectActionApplicationContexts:(id)a3
{
}

- (SRUIFSpeechRequestHandler)speechRequestHandler
{
  return self->_speechRequestHandler;
}

- (void)setSpeechRequestHandler:(id)a3
{
}

- (AFAnalyticsTurnBasedInstrumentationContext)_instrumentationTurnContext
{
  return self->_instrumentationTurnContext;
}

- (void)_setInstrumentationTurnContext:(id)a3
{
}

- (void)_setWatchAuthenticationManager:(id)a3
{
}

- (SRUIFSiriSessionStateHandler)_stateHandler
{
  return self->_stateHandler;
}

- (SRUIFUIBridgeClient)_uiBridgeClient
{
  return self->_uiBridgeClient;
}

- (SRUIFAudioPowerLevelUpdater)_audioPowerLevelUpdater
{
  return self->_audioPowerLevelUpdater;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPowerLevelUpdater, 0);
  objc_storeStrong((id *)&self->_uiBridgeClient, 0);
  objc_storeStrong((id *)&self->_stateHandler, 0);
  objc_storeStrong((id *)&self->_watchAuthenticationManager, 0);
  objc_storeStrong((id *)&self->_instrumentationTurnContext, 0);
  objc_storeStrong((id *)&self->_speechRequestHandler, 0);
  objc_storeStrong((id *)&self->_directActionApplicationContexts, 0);
  objc_storeStrong((id *)&self->_sessionDelegateContext, 0);
  objc_destroyWeak((id *)&self->_visualIntelligenceCameraDelegate);
  objc_storeStrong((id *)&self->_siriSessionInfo, 0);
  objc_destroyWeak((id *)&self->_localDelegate);
  objc_destroyWeak((id *)&self->_localDataSource);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_activationInstrumentationSender, 0);
  objc_storeStrong((id *)&self->_stateFeedbackManager, 0);
  objc_storeStrong((id *)&self->_modesConfiguration, 0);
  objc_storeStrong((id *)&self->_clientStateManager, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_lastSpeechSynthesisRecord, 0);

  objc_storeStrong((id *)&self->_delegateQueue, 0);
}

- (void)_connection
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s The AFConnection for this session (%@) has been invalidated.", v2, v3, v4, v5, 2u);
}

+ (void)availabilityState
{
}

- (void)_getMissingAssetTypes:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unknown missing asset type found during Siri UNAV event %@", v2, v3, v4, v5, 2u);
}

- (void)_startRequestWithFinalOptions:completion:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s #activation #carPlay unable to handle direct action request options: %@", v2, v3, v4, v5, 2u);
}

- (void)_startRequestWithFinalOptions:completion:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Skipping activation. Invalid request options provided for SASRequestSourceTesting: %@", v2, v3, v4, v5, 2u);
}

- (void)_startRequestWithFinalOptions:completion:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Unexpected request source %@", v2, v3, v4, v5, 2u);
}

void __60__AFUISiriSession__startRequestWithFinalOptions_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Error fetching accounts: %@", v2, v3, v4, v5, 2u);
}

- (void)_startRequestForReadoutOfBulletin:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __66__AFUISiriSession_assistantConnection_receivedCommand_completion___block_invoke_2_cold_1(id *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = *a1;
  uint64_t v4 = a2;
  uint64_t v5 = [v3 groupIdentifier];
  id v6 = [*a1 encodedClassName];
  int v7 = 136315650;
  id v8 = "-[AFUISiriSession assistantConnection:receivedCommand:completion:]_block_invoke_2";
  __int16 v9 = 2114;
  id v10 = v5;
  __int16 v11 = 2114;
  id v12 = v6;
  _os_log_error_impl(&dword_223099000, v4, OS_LOG_TYPE_ERROR, "%s AFUISiriSession received unexpected command: %{public}@.%{public}@", (uint8_t *)&v7, 0x20u);
}

- (void)_handlePlayAudioCommand:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_performAceCommand:(void *)a1 turnIdentifier:machAbsoluteTime:conflictHandler:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1;
  uint64_t v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_223099000, v1, OS_LOG_TYPE_ERROR, "%s Sending ace command of class %@ expects a turn identifier, but one isn't provided.", (uint8_t *)v4, 0x16u);
}

void __40__AFUISiriSession__updateActiveAccount___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_223099000, v0, v1, "%s Error fetching accounts: %@", v2, v3, v4, v5, 2u);
}

@end