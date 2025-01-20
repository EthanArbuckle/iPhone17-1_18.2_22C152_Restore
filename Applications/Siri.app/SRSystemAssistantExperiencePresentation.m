@interface SRSystemAssistantExperiencePresentation
- (BOOL)_showSpeech;
- (BOOL)alwaysShowRecognizedSpeech;
- (BOOL)bugReportPresenterShouldPromptUserForScreenshotPermission:(id)a3;
- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3;
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)isPresentingVisualIntelligenceCamera;
- (BOOL)saeViewModelControllerShouldAlwaysShowRecognizedSpeech:(id)a3;
- (BOOL)shouldAllowTouchPassThrough;
- (BOOL)shouldPunchOutInPlace;
- (BOOL)shouldResumeInterruptedAudioPlayback;
- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3;
- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates;
- (BOOL)siriDeviceLockedForViewModelController:(id)a3;
- (BOOL)supportsVisualPresentationForConversationItem:(id)a3;
- (CGPoint)_convertToPointInSAEViewCoordinates:(CGPoint)a3;
- (CGRect)effectiveContentFrame;
- (CGSize)maxSizeForSnippet;
- (SASRequestOptions)_activeRequestOptions;
- (SRSystemAssistantExperiencePresentation)initWithDelegate:(id)a3 dataSource:(id)a4;
- (SiriSharedUISAEViewModelController)activeViewModelController;
- (SiriUIPresentationDataSource)dataSource;
- (SiriUIPresentationDelegate)delegate;
- (double)bugReportPresenterRequestsLastPresentationTime:(id)a3;
- (double)expectedContentWidth;
- (id)_activeConversation;
- (id)_analytics;
- (id)_conversationIdentifiers;
- (id)_dismissalContextWithDismissalReason:(int64_t)a3 dismissalOptions:(id)a4;
- (id)_identifierOfPreviousConversation;
- (id)_siriLocalizedTriggerPhrases;
- (id)bugReportPresenterRequestsBugReportKeywordIdentifiers:(id)a3;
- (id)bugReportPresenterRequestsBugReportPrefixForTitle:(id)a3;
- (id)bugReportPresenterRequestsPresentingView:(id)a3;
- (id)dismissalUserInfo;
- (id)effectiveCoreLocationBundleForSAEViewController:(id)a3;
- (id)feedbackFormForCurrentRequest;
- (id)localeForSAEViewController:(id)a3;
- (id)saeViewModelController:(id)a3 requestsTranscriptItemForAceObject:(id)a4;
- (id)viewController;
- (int)viewRegionForPresentedAceObject:(id)a3;
- (int64_t)_inputType;
- (int64_t)_viewModelInputTypeForRequestInputType:(int64_t)a3;
- (int64_t)inputTypeForSAEViewModelController:(id)a3;
- (unint64_t)lockStateForSAEViewController:(id)a3;
- (void)_activeConversationDidChange;
- (void)_didDetectGestureEventWithinSiri:(int64_t)a3;
- (void)_didDetectTouchOutsideOfSiri;
- (void)_dismissVideoPlayerViewController;
- (void)_handleNonSnippetResponse:(int64_t)a3;
- (void)_scheduleAutoDismissalForTouchOutsideOfSiri;
- (void)_setInputType:(int64_t)a3;
- (void)_setupBugReportingPresenterIfNecessary;
- (void)_startAutoDismissalIfNeededGivenSiriIsAttending:(BOOL)a3;
- (void)_updatePresentationForVisualIntelligenceCameraIfNeeded;
- (void)activeRequestOptionsDidChange;
- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4;
- (void)attemptedToSaveConversation:(id)a3 withResult:(BOOL)a4;
- (void)autoDismissControllerRequestsDismissal:(id)a3;
- (void)autoDismissControllerRequestsStopAttending:(id)a3;
- (void)bugReportPresenter:(id)a3 requestsSiriDismissalWithReason:(int64_t)a4;
- (void)bugReportPresenter:(id)a3 requestsToHandlePasscodeUnlockWithCompletion:(id)a4;
- (void)bugReportPresenter:(id)a3 requestsToOpenURL:(id)a4 withCompletion:(id)a5;
- (void)bugReportPresenter:(id)a3 requestsToPerformAceCommand:(id)a4;
- (void)bugReportPresenter:(id)a3 requestsToPresentViewController:(id)a4;
- (void)bugReportPresenter:(id)a3 requestsToTakeScreenshotWithCompletion:(id)a4;
- (void)bugReportPresenter:(id)a3 setBugReportingAvailable:(BOOL)a4;
- (void)bugReportPresenter:(id)a3 setStatusViewHidden:(BOOL)a4;
- (void)bugReportPresenterRequestsInvalidateAutoDismissal:(id)a3;
- (void)bugReportPresenterRequestsSiriSessionToFinishCurrentRequest:(id)a3;
- (void)cancelRequestForViewController:(id)a3;
- (void)configureForRequestOptions:(id)a3;
- (void)contentDidUpdate;
- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4;
- (void)dealloc;
- (void)didBeginProcessingConversationItems;
- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4;
- (void)didOmitDialogFromPresenting;
- (void)didPresentContentForSAEViewController:(id)a3;
- (void)didPresentResponseFullyInApp;
- (void)didPresentSystemUI;
- (void)didReceiveAddViewsDialogPhaseForSuggestions:(id)a3;
- (void)didReceiveAddViewsSignalForSuggestions:(id)a3 currentMode:(id)a4;
- (void)didReceiveBugButtonLongPress;
- (void)didReceiveOrbViewTapToCancelRequest;
- (void)didReceiveReportBugAction;
- (void)didReceiveRevealRecognizedSpeechCommand:(id)a3;
- (void)didTapCloseButtonOnSnippet;
- (void)dismissSiriResults;
- (void)dockFrameDidChange:(CGRect)a3;
- (void)endSiriSessionForViewController:(id)a3 withDismissalReason:(int64_t)a4;
- (void)handleFeedbackForm:(id)a3;
- (void)handlePlayContentCommand:(id)a3 completion:(id)a4;
- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4;
- (void)immersiveExperienceRequestedForViewModelController:(id)a3;
- (void)modalContainerViewControllerViewDidDisappear:(id)a3;
- (void)modalContainerViewControllerViewWillDisappear:(id)a3;
- (void)playbackDidFailForVideoPlayerViewController:(id)a3;
- (void)playbackDidFinishForVideoPlayerViewController:(id)a3;
- (void)previousConversationDidLoad:(id)a3;
- (void)resetViewsAndClearASR:(BOOL)a3;
- (void)saeViewController:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5;
- (void)saeViewController:(id)a3 preventOutsideTouchesFromDismissingSiri:(BOOL)a4;
- (void)saeViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4;
- (void)saeViewController:(id)a3 setStatusViewHidden:(BOOL)a4;
- (void)saeViewController:(id)a3 speakText:(id)a4 isPhonetic:(BOOL)a5 completion:(id)a6;
- (void)saeViewController:(id)a3 viewDidAppearForAceObject:(id)a4;
- (void)saeViewController:(id)a3 viewDidDisappearForAceObject:(id)a4;
- (void)saeViewController:(id)a3 willBeginEditingOfType:(int64_t)a4;
- (void)saeViewControllerCancelHIDEventDefferal:(id)a3;
- (void)saeViewControllerDidEndEditing:(id)a3;
- (void)saeViewControllerRequestsHIDEventDefferal:(id)a3;
- (void)saeViewModelController:(id)a3 didProcessConversationItemsWithIdentifiers:(id)a4;
- (void)setActiveViewModelController:(id)a3;
- (void)setBottomContentInset:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIsPresentingVisualIntelligenceCamera:(BOOL)a3;
- (void)setShowsSensitiveUI:(BOOL)a3;
- (void)setTopContentInset:(double)a3 animated:(BOOL)a4;
- (void)showFullScreenEffect:(id)a3;
- (void)siriDidActivateFromSource:(int64_t)a3;
- (void)siriDidBeginTaskWithIdentifier:(id)a3;
- (void)siriDidDeactivateWithCompletion:(id)a3;
- (void)siriDidEnterLatencyState;
- (void)siriDidHidePasscodeUnlock;
- (void)siriDidReceiveLatencyInformation:(id)a3;
- (void)siriDidReceiveStartGenAIEnablementFlowCommand:(id)a3 completion:(id)a4;
- (void)siriDidReceiveStartImmersiveExperienceCommand:(id)a3 completion:(id)a4;
- (void)siriDidStartNewConversationWithIdentifier:(id)a3;
- (void)siriDidStartSpeakingWithIdentifier:(id)a3;
- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4;
- (void)siriDidTapOutsideContent;
- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4;
- (void)siriDidUpdateASRWithRecognition:(id)a3;
- (void)siriIsIdleAndQuietStatusDidChange:(BOOL)a3 isAttending:(BOOL)a4;
- (void)siriRequestWillStartWithRequestOptions:(id)a3;
- (void)siriResponseModeDidChange:(unint64_t)a3;
- (void)siriResultsDidDismissInTamale;
- (void)siriResultsWillDismissInTamale;
- (void)siriSAEViewCOntrollerRequestStopAttending:(id)a3;
- (void)siriSAEViewController:(id)a3 willDismissViewController:(id)a4;
- (void)siriSAEViewController:(id)a3 willPresentViewController:(id)a4;
- (void)siriSAEViewControllerRequestsTextActivation:(id)a3 withRequestSource:(int64_t)a4;
- (void)siriSAEViewControllerRequestsVoiceActivation:(id)a3 withRequestOptions:(id)a4;
- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4;
- (void)siriWillProcessAppLaunchWithBundleIdentifier:(id)a3;
- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3;
- (void)speechRecordingDidBeginOnRecordRoute:(id)a3;
- (void)stopRecordingForViewController:(id)a3;
- (void)stopSpeakingForSAEViewController:(id)a3;
- (void)tapToEditPresented;
- (void)toggleHomeAffordanceHidden:(BOOL)a3;
- (void)updateEdgeLightWindowLevel:(int64_t)a3;
- (void)updateFeedbackFormWithSpeakableText:(id)a3;
- (void)updateSpeechRecognitionHypothesisForSuggestion:(id)a3;
- (void)userDrilledIntoSnippet;
- (void)userTouchedSnippet;
- (void)viewController:(id)a3 didFinishEditingUtteranceWithText:(id)a4 originalUserUtterance:(id)a5 selectionResults:(id)a6;
- (void)viewController:(id)a3 openURL:(id)a4 completion:(id)a5;
- (void)viewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5;
- (void)viewController:(id)a3 reduceOrbOpacity:(BOOL)a4;
- (void)viewController:(id)a3 requestsHostBackgroundBlurVisible:(BOOL)a4 reason:(int64_t)a5 fence:(id)a6;
- (void)viewController:(id)a3 siriRequestEnteredWithSuggestion:(id)a4;
- (void)viewController:(id)a3 siriRequestEnteredWithText:(id)a4;
- (void)viewController:(id)a3 willChangeKeyboardVisibility:(BOOL)a4;
- (void)viewControllerDidPresentUserInterface:(id)a3;
- (void)viewControllerViewWillDisappear:(id)a3;
@end

@implementation SRSystemAssistantExperiencePresentation

- (SRSystemAssistantExperiencePresentation)initWithDelegate:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)SRSystemAssistantExperiencePresentation;
  v8 = [(SRSystemAssistantExperiencePresentation *)&v22 init];
  v9 = v8;
  if (v8)
  {
    [(SRSystemAssistantExperiencePresentation *)v8 setDelegate:v6];
    [(SRSystemAssistantExperiencePresentation *)v9 setDataSource:v7];
    v9->_inputType = 0;
    v10 = objc_alloc_init(SRSystemAssistantExperienceViewController);
    saeViewController = v9->_saeViewController;
    v9->_saeViewController = v10;

    [(SRSystemAssistantExperienceViewController *)v9->_saeViewController setDelegate:v9];
    v12 = [(SRSystemAssistantExperiencePresentation *)v9 delegate];
    id v13 = [v12 siriDeviceLockStateForSiriPresentation:v9];

    v14 = [[SRCompactAutoDismissController alloc] initWithDelegate:v9 andLockState:v13];
    autoDismissController = v9->_autoDismissController;
    v9->_autoDismissController = v14;

    v16 = +[AFPreferences sharedPreferences];
    v17 = [v16 languageCode];
    +[SiriUISashItem _setLanguageCode:v17];

    v18 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.siri.SRSystemAssistantExperiencePresentation.viewModelControllerQueue", v18);
    viewModelControllerQueue = v9->_viewModelControllerQueue;
    v9->_viewModelControllerQueue = (OS_dispatch_queue *)v19;

    [(SRSystemAssistantExperiencePresentation *)v9 _activeConversationDidChange];
  }

  return v9;
}

- (id)_conversationIdentifiers
{
  v3 = [(SRSystemAssistantExperiencePresentation *)self dataSource];
  v4 = [v3 conversationIdentifiersForSiriPresentation:self];

  return v4;
}

- (id)_identifierOfPreviousConversation
{
  v2 = [(SRSystemAssistantExperiencePresentation *)self _conversationIdentifiers];
  if ((unint64_t)[v2 count] < 2)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[SRSystemAssistantExperiencePresentation _identifierOfPreviousConversation]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #compact no previous conversation found", (uint8_t *)&v6, 0xCu);
    }
    v3 = 0;
  }
  else
  {
    v3 = objc_msgSend(v2, "objectAtIndexedSubscript:", (char *)objc_msgSend(v2, "count") - 2);
  }

  return v3;
}

- (id)_activeConversation
{
  v3 = [(SRSystemAssistantExperiencePresentation *)self dataSource];
  v4 = [(SRSystemAssistantExperiencePresentation *)self _conversationIdentifiers];
  v5 = [v4 lastObject];
  int v6 = [v3 siriPresentation:self conversationWithIdentifier:v5];

  return v6;
}

- (void)configureForRequestOptions:(id)a3
{
  id v4 = a3;
  if ([v4 requestSource] == (id)53)
  {
    v5 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = v5;
      [v4 requestSource];
      id v7 = SASRequestSourceGetName();
      int v10 = 136315394;
      v11 = "-[SRSystemAssistantExperiencePresentation configureForRequestOptions:]";
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Don't check Siri availability for %@ activation", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (+[AFUISiriSession availabilityState])
    {
      v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_1000B79BC(v8);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained dismissSiriPresentation:self withReason:13];
    }
    if ([v4 requestSource] == (id)47) {
      [(SRSystemAssistantExperienceViewController *)self->_saeViewController prepareForTypeToSiriActivation];
    }
  }
}

- (id)viewController
{
  return self->_saeViewController;
}

- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self activeViewModelController];
  [v6 conversationDidChangeWithTransaction:v5];
}

- (void)didReceiveRevealRecognizedSpeechCommand:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    v14 = "-[SRSystemAssistantExperiencePresentation didReceiveRevealRecognizedSpeechCommand:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: received revealRecognizedSpeech:%@", (uint8_t *)&v13, 0x16u);
  }
  id v6 = [v4 recognition];
  id v7 = [(SRSystemAssistantExperiencePresentation *)self dataSource];
  v8 = [v7 sessionInfoForSiriPresentation:self];

  v9 = [v4 refId];
  int v10 = [v8 identifier];
  v11 = [v6 af_userUtteranceValueWithRefId:v9 sessionId:v10];

  if (v4 && v11) {
    [(SRSystemAssistantExperienceViewController *)self->_saeViewController setRevealRecognizedSpeech:1];
  }
  __int16 v12 = [(SRSystemAssistantExperiencePresentation *)self activeViewModelController];
  [v12 revealUserUtterance:v11 backingAceObject:v4];
}

- (void)dealloc
{
  [(SRCompactAutoDismissController *)self->_autoDismissController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SRSystemAssistantExperiencePresentation;
  [(SRSystemAssistantExperiencePresentation *)&v3 dealloc];
}

- (void)activeRequestOptionsDidChange
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self _activeRequestOptions];
  if ([v4 isTypeToSiriRequest] && objc_msgSend(v4, "inputType") != (id)2)
  {
    uint64_t v3 = 1;
  }
  else if ([v4 requestSource] == (id)53)
  {
    uint64_t v3 = 3;
  }
  else
  {
    uint64_t v3 = 2;
  }
  [(SRSystemAssistantExperienceViewController *)self->_saeViewController setActiveRequestOptions:v4];
  [(SRSystemAssistantExperiencePresentation *)self _setInputType:v3];
}

- (void)siriRequestWillStartWithRequestOptions:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[SRSystemAssistantExperiencePresentation siriRequestWillStartWithRequestOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  *(_WORD *)&self->_isCurrentRequestPresentingSystemUI = 0;
  responseMode = self->_responseMode;
  self->_responseMode = 0;

  delayDismissalMs = self->_delayDismissalMs;
  self->_delayDismissalMs = 0;

  self->_shouldMuteSiriFeedbackBanner = 0;
  self->_shouldPauseAutoDismissal = 0;
  if ([v4 requestSource] != (id)9) {
    self->_requestIsWiredMicOrBTHeadsetOrWx = [v4 isWiredMicOrBTHeadsetOrWx];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A574;
  block[3] = &unk_100142E88;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  [(SRSystemAssistantExperienceViewController *)self->_saeViewController siriWillStartRequest];
  if (([v4 isTypeToSiriRequest] & 1) == 0)
  {
    keyboardBringUpTurnIdentifier = self->_keyboardBringUpTurnIdentifier;
    self->_keyboardBringUpTurnIdentifier = 0;
  }
  if (self->_keyboardBringUpTurnIdentifier)
  {
    v9 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = self->_keyboardBringUpTurnIdentifier;
      v11 = v9;
      __int16 v12 = +[SRUIFInstrumentationManager sharedManager];
      int v13 = [v12 currentInstrumentationTurnContext];
      v14 = [v13 turnIdentifier];
      *(_DWORD *)buf = 136315650;
      v20 = "-[SRSystemAssistantExperiencePresentation siriRequestWillStartWithRequestOptions:]";
      __int16 v21 = 2112;
      objc_super v22 = v10;
      __int16 v23 = 2112;
      v24 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #instrumentation linking keyboard bringup turn %@ with the new typing turn %@", buf, 0x20u);
    }
    __int16 v15 = AFTurnIdentifierGetBytes();
    id v16 = objc_alloc_init((Class)SISchemaTypingRequestTrace);
    [v16 setKeyboardAppearanceBringUpTurnID:v15];
    v17 = +[SRUIFInstrumentationManager sharedManager];
    [v17 emitInstrumentation:v16];
  }
}

- (void)siriResponseModeDidChange:(unint64_t)a3
{
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    BOOL requestIsWiredMicOrBTHeadsetOrWx = self->_requestIsWiredMicOrBTHeadsetOrWx;
    int v9 = 136315650;
    int v10 = "-[SRSystemAssistantExperiencePresentation siriResponseModeDidChange:]";
    __int16 v11 = 2048;
    unint64_t v12 = a3;
    __int16 v13 = 1024;
    BOOL v14 = requestIsWiredMicOrBTHeadsetOrWx;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact mode updated to %lu, _requestIsWiredMicOrBTHeadsetOrWx: %d", (uint8_t *)&v9, 0x1Cu);
  }
  [(SRCompactAutoDismissController *)self->_autoDismissController siriResponseModeDidChange:a3 isWiredMicOrBTHeadsetOrWx:self->_requestIsWiredMicOrBTHeadsetOrWx];
  MDModeGetName();
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  responseMode = self->_responseMode;
  self->_responseMode = v7;
}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  if (a3 == 20)
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      BOOL v14 = "-[SRSystemAssistantExperiencePresentation siriDidActivateFromSource:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact Loading previous conversation because we activated from a breadcrumb", (uint8_t *)&v13, 0xCu);
    }
    id v6 = [(SRSystemAssistantExperiencePresentation *)self dataSource];
    id v7 = [(SRSystemAssistantExperiencePresentation *)self _identifierOfPreviousConversation];
    [v6 siriPresentation:self activateConversationWithIdentifier:v7];

    [(SRSystemAssistantExperiencePresentation *)self _activeConversationDidChange];
    v8 = [(SRSystemAssistantExperiencePresentation *)self delegate];
    [v8 siriPresentationDidPresentConversationFromBreadcrumb:self];
  }
  else if (a3 == 53)
  {
    self->_isPresentingVisualIntelligenceCamera = 1;
  }
  [(SRSystemAssistantExperienceViewController *)self->_saeViewController siriDidActivate];
  [(SRSystemAssistantExperienceViewController *)self->_saeViewController setUpConversationStarterSuggestionsWith:a3];
  *(_WORD *)&self->_userCancelledRequestViaOrbViewTap = 0;
  self->_isCurrentRequestPresentingSystemUI = 0;
  self->_initialRequestSource = a3;
  if (a3 == 47)
  {
    int v9 = +[SRUIFInstrumentationManager sharedManager];
    int v10 = [v9 currentInstrumentationTurnContext];
    __int16 v11 = [v10 turnIdentifier];
    keyboardBringUpTurnIdentifier = self->_keyboardBringUpTurnIdentifier;
    self->_keyboardBringUpTurnIdentifier = v11;
  }
}

- (void)siriDidStartNewConversationWithIdentifier:(id)a3
{
  id v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [a3 UUIDString];
    int v8 = 136315394;
    int v9 = "-[SRSystemAssistantExperiencePresentation siriDidStartNewConversationWithIdentifier:]";
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #compact Starting a new conversation %@", (uint8_t *)&v8, 0x16u);
  }
  [(SRSystemAssistantExperiencePresentation *)self _activeConversationDidChange];
}

- (void)speechRecordingDidBeginOnRecordRoute:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SRSystemAssistantExperiencePresentation speechRecordingDidBeginOnRecordRoute:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact recording started on recordRoute: %@", (uint8_t *)&v6, 0x16u);
  }
  self->_recordingFromWxDevice = AFRecordRouteIsHearst();
}

- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    responseMode = self->_responseMode;
    BOOL requestIsWiredMicOrBTHeadsetOrWx = self->_requestIsWiredMicOrBTHeadsetOrWx;
    int v12 = 136315906;
    int v13 = "-[SRSystemAssistantExperiencePresentation shouldResumeInterruptedAudioPlaybackForAttendingState:]";
    __int16 v14 = 1024;
    BOOL v15 = v3;
    __int16 v16 = 2112;
    v17 = responseMode;
    __int16 v18 = 1024;
    BOOL v19 = requestIsWiredMicOrBTHeadsetOrWx;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact isAttending: %d, responseMode: %@, requestIsWiredMicOrBTHeadsetOrWx: %d", (uint8_t *)&v12, 0x22u);
  }
  if (v3)
  {
    __int16 v8 = self->_responseMode;
    id v9 = MDModeGetName();
    if ([(NSString *)v8 isEqualToString:v9])
    {

      return self->_shouldResumeMediaOnIdle;
    }
    BOOL v10 = self->_requestIsWiredMicOrBTHeadsetOrWx;

    if (v10) {
      return self->_shouldResumeMediaOnIdle;
    }
  }
  return 1;
}

- (BOOL)shouldResumeInterruptedAudioPlayback
{
  return 1;
}

- (BOOL)shouldPunchOutInPlace
{
  return _os_feature_enabled_impl();
}

- (BOOL)shouldAllowTouchPassThrough
{
  return 1;
}

- (void)handlePlayContentCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  __int16 v8 = [[SRPlayContentViewController alloc] initWithPlayContent:v6];
  id v9 = [(SRPlayContentViewController *)v8 player];

  if (v9)
  {
    [(SRPlayContentViewController *)v8 setVideoPlayerControllerDelegate:self];
    BOOL v10 = [(SRSystemAssistantExperiencePresentation *)self delegate];
    [v10 siriPresentation:self setStatusBarHidden:1 animated:1];

    __int16 v11 = [(SRSystemAssistantExperiencePresentation *)self delegate];
    [v11 siriPresentation:self setStatusViewHidden:1];

    id v12 = [objc_alloc((Class)SiriUIModalContainerViewController) initWithContentViewController:v8];
    [v12 setDelegate:self];
    int v13 = [(SRSystemAssistantExperiencePresentation *)self delegate];
    [v13 siriPresentation:self willPresentViewController:v12];

    objc_initWeak(&location, self);
    saeViewController = self->_saeViewController;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002ADAC;
    v20[3] = &unk_100143250;
    objc_copyWeak(&v22, &location);
    id v15 = v12;
    id v21 = v15;
    [(SRSystemAssistantExperienceViewController *)saeViewController presentViewController:v15 animated:1 completion:v20];
    if (v7)
    {
      id v16 = objc_alloc_init((Class)SACommandSucceeded);
      v17 = [v6 aceId];
      [v16 setRefId:v17];

      v7[2](v7, v16);
    }

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    id v18 = [objc_alloc((Class)SACommandFailed) initWithReason:@"No AVPlayer for PlayContent command"];
    BOOL v19 = [v6 aceId];
    [v18 setRefId:v19];

    v7[2](v7, v18);
  }
}

- (BOOL)supportsVisualPresentationForConversationItem:(id)a3
{
  if ((char *)[a3 type] - 1 > (char *)1) {
    return 1;
  }

  return [(SRSystemAssistantExperiencePresentation *)self _showSpeech];
}

- (int)viewRegionForPresentedAceObject:(id)a3
{
  return [(SRSystemAssistantExperienceViewController *)self->_saeViewController viewRegionForPresentedAceObject:a3];
}

- (void)siriDidDeactivateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSystemAssistantExperienceViewController *)self->_saeViewController presentedViewController];

  if (v5) {
    [(SRSystemAssistantExperienceViewController *)self->_saeViewController dismissViewControllerAnimated:1 completion:0];
  }
  [(SRSystemAssistantExperienceViewController *)self->_saeViewController siriDidDeactivate];
  if (AFIsInternalInstall() && !self->_shouldMuteSiriFeedbackBanner) {
    +[SRSiriDebugManager invokeSiriDebugFeedbackBannerFor:self->_initialRequestSource completionHandler:0];
  }
  id v6 = objc_alloc_init(SRDismissalClassificationController);
  id v7 = [(SRSystemAssistantExperiencePresentation *)self _dismissalContextWithDismissalReason:self->_lastDismissalReason dismissalOptions:self->_lastDismissalOptions];
  BOOL v8 = [(SRDismissalClassificationController *)v6 classifyRequestAsUnintendedWithContext:v7];
  [v7 setClassifiedAsUnintended:v8];
  [(SRDismissalClassificationController *)v6 recordDismissalEventWithContext:v7 markAsUnintended:v8];
  int64_t inputType = self->_inputType;
  int64_t initialRequestSource = self->_initialRequestSource;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002B018;
  v14[3] = &unk_1001436B8;
  id v15 = v6;
  id v16 = v7;
  BOOL v19 = v8;
  id v17 = v4;
  int64_t v18 = inputType;
  id v11 = v4;
  id v12 = v7;
  int v13 = v6;
  [(SRDismissalClassificationController *)v13 requestMitigationStatusBasedOnRequestClassification:v8 withRequestSource:initialRequestSource withCompletion:v14];
}

- (void)siriDidStartSpeakingWithIdentifier:(id)a3
{
}

- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4
{
}

- (void)siriDidUpdateASRWithRecognition:(id)a3
{
}

- (void)siriDidTapOutsideContent
{
}

- (void)showFullScreenEffect:(id)a3
{
}

- (void)didOmitDialogFromPresenting
{
}

- (void)resetViewsAndClearASR:(BOOL)a3
{
}

- (void)didPresentSystemUI
{
}

- (void)updateSpeechRecognitionHypothesisForSuggestion:(id)a3
{
}

- (id)_siriLocalizedTriggerPhrases
{
  v2 = +[VTPreferences sharedPreferences];
  BOOL v3 = +[AFPreferences sharedPreferences];
  id v4 = [v3 languageCode];
  id v5 = [v2 localizedTriggerPhraseForLanguageCode:v4];

  id v6 = +[NSCharacterSet whitespaceCharacterSet];
  id v7 = [v5 stringByTrimmingCharactersInSet:v6];

  BOOL v8 = +[VTPreferences sharedPreferences];
  id v9 = +[AFPreferences sharedPreferences];
  BOOL v10 = [v9 languageCode];
  id v11 = [v8 localizedCompactTriggerPhraseForLanguageCode:v10];

  id v12 = +[NSCharacterSet whitespaceCharacterSet];
  int v13 = [v11 stringByTrimmingCharactersInSet:v12];

  v16[0] = v13;
  v16[1] = v7;
  __int16 v14 = +[NSArray arrayWithObjects:v16 count:2];

  return v14;
}

- (void)didReceiveAddViewsSignalForSuggestions:(id)a3 currentMode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    BOOL v10 = "-[SRSystemAssistantExperiencePresentation didReceiveAddViewsSignalForSuggestions:currentMode:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #suggestions addviews received, triggering conversation continuer suggestions", (uint8_t *)&v9, 0xCu);
  }
  [(SRSystemAssistantExperienceViewController *)self->_saeViewController didReceiveAddViewsSignalForSuggestions:v6 currentMode:v7];
}

- (void)didReceiveAddViewsDialogPhaseForSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SRSystemAssistantExperiencePresentation didReceiveAddViewsDialogPhaseForSuggestions:]";
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #suggestions dialog phase %@ received", (uint8_t *)&v6, 0x16u);
  }
  [(SRSystemAssistantExperienceViewController *)self->_saeViewController didReceiveAddViewsDialogPhaseForSuggestions:v4];
}

- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3
{
  return [(SRSystemAssistantExperienceViewController *)self->_saeViewController didReceiveUpdateVisualResponseCommand:a3];
}

- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4
{
  if (a4 == 13)
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      BOOL hasPendingAutoDismissal = self->_hasPendingAutoDismissal;
      BOOL recordingFromWxDevice = self->_recordingFromWxDevice;
      int v16 = 136315650;
      id v17 = "-[SRSystemAssistantExperiencePresentation siriDidTransitionFromState:event:]";
      __int16 v18 = 1024;
      BOOL v19 = hasPendingAutoDismissal;
      __int16 v20 = 1024;
      BOOL v21 = recordingFromWxDevice;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #compact Speech was mitigated as side speech, _hasPendingAutoDismissal: %d, _recordingFromWxDevice: %d", (uint8_t *)&v16, 0x18u);
    }
    if (self->_hasPendingAutoDismissal)
    {
      if (self->_isPresentingVisualIntelligenceCamera)
      {
        [(SRSystemAssistantExperiencePresentation *)self dismissSiriResults];
        goto LABEL_18;
      }
      id v12 = [(SRSystemAssistantExperiencePresentation *)self delegate];
      int v13 = v12;
      __int16 v14 = self;
      uint64_t v15 = 4;
    }
    else
    {
      BOOL v6 = self->_recordingFromWxDevice;
      if (!v6) {
        goto LABEL_19;
      }
      id v12 = [(SRSystemAssistantExperiencePresentation *)self delegate];
      int v13 = v12;
      __int16 v14 = self;
      uint64_t v15 = 58;
    }
    [v12 dismissSiriPresentation:v14 withReason:v15];

    goto LABEL_18;
  }
  if (a4 == 12)
  {
    BOOL v10 = AFSiriLogContextConnection;
    BOOL v11 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    BOOL v6 = 0;
    if (!v11) {
      goto LABEL_19;
    }
    int v16 = 136315138;
    id v17 = "-[SRSystemAssistantExperiencePresentation siriDidTransitionFromState:event:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #compact Speech was determined as directed at siri stop pausing auto dismissal", (uint8_t *)&v16, 0xCu);
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if (a4 != 11) {
    return;
  }
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    id v17 = "-[SRSystemAssistantExperiencePresentation siriDidTransitionFromState:event:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact Speech start detected, pausing auto dismissal", (uint8_t *)&v16, 0xCu);
  }
  BOOL v6 = 1;
LABEL_19:
  self->_shouldPauseAutoDismissal = v6;
}

- (void)siriWillProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7A40((uint64_t)v4, v5);
  }
  [(SRSystemAssistantExperiencePresentation *)self _handleNonSnippetResponse:2];
}

- (void)siriDidEnterLatencyState
{
}

- (void)siriDidReceiveLatencyInformation:(id)a3
{
  id v11 = a3;
  id v4 = [(SRSystemAssistantExperiencePresentation *)self _activeRequestOptions];
  id v5 = [v4 requestSource];

  if (v5 == (id)52)
  {
    BOOL v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v6 siriUILocalizedStringForKey:@"TAMALE_INITIAL_LATENCY_SUMMARY" table:0];
    id v8 = objc_alloc((Class)SRUIFLatencyInformation);
    id v9 = [v11 taskIdentifier];
    id v10 = [v8 initWithLatencySummary:v7 taskIdentifier:v9 shouldShow:1];

    [(SiriSharedUISAEViewModelController *)self->_activeViewModelController didReceiveLatencyInformation:v10];
    [(SiriSharedUISAEViewModelController *)self->_activeViewModelController revealLatencyView];
  }
  else
  {
    [(SiriSharedUISAEViewModelController *)self->_activeViewModelController didReceiveLatencyInformation:v11];
  }
}

- (void)siriDidBeginTaskWithIdentifier:(id)a3
{
}

- (void)previousConversationDidLoad:(id)a3
{
  id v4 = a3;
  id v5 = [v4 lastItem];
  if (![v5 isPersistentAcrossInvocations])
  {
LABEL_8:

    goto LABEL_9;
  }
  unsigned __int8 v6 = [(SRSystemAssistantExperienceViewController *)self->_saeViewController isInAmbient];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = SRUIFMaxIntervalForDisplayingPreviousConversation();
    if (v7 != -1)
    {
      uint64_t v8 = v7;
      id v9 = objc_alloc((Class)SRUIFPreferences);
      id v5 = [v9 initWithSuiteName:SRUIFPreferencesDefaultDomain];
      id v10 = [v5 integerForKey:SRUIFPreferencesPreviousConversationEndTimestamp];
      if (v10)
      {
        id v11 = v10;
        +[NSDate timeIntervalSinceReferenceDate];
        if ((uint64_t)v12 - (uint64_t)v11 >= 0 && (uint64_t)v12 - (uint64_t)v11 <= v8)
        {
          viewModelControllerQueue = self->_viewModelControllerQueue;
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_10002BD48;
          v14[3] = &unk_1001436E0;
          void v14[4] = self;
          id v15 = v4;
          dispatch_async(viewModelControllerQueue, v14);
        }
      }
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)attemptedToSaveConversation:(id)a3 withResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [a3 lastItem];
  unsigned int v6 = [v5 isPersistentAcrossInvocations];

  if (v6)
  {
    id v7 = objc_alloc((Class)SRUIFPreferences);
    id v10 = [v7 initWithSuiteName:SRUIFPreferencesDefaultDomain];
    if (v4)
    {
      +[NSDate timeIntervalSinceReferenceDate];
      uint64_t v9 = (uint64_t)v8;
    }
    else
    {
      uint64_t v9 = 0;
    }
    [v10 setInteger:v9 forKey:SRUIFPreferencesPreviousConversationEndTimestamp];
  }
}

- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4
{
}

- (void)didPresentResponseFullyInApp
{
}

- (void)_handleNonSnippetResponse:(int64_t)a3
{
  [(SRSystemAssistantExperienceViewController *)self->_saeViewController setRevealRecognizedSpeech:0];
  switch(a3)
  {
    case 0:
      id v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315138;
        __int16 v20 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #dismissal Omitted dialog -> recording _hasOmittedDialogFromPresenting = YES", (uint8_t *)&v19, 0xCu);
      }
      char v6 = 0;
      uint64_t v7 = 34;
      goto LABEL_24;
    case 1:
      double v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 136315138;
        __int16 v20 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #dismissal Presenting System UI -> recording _isCurrentRequestPresentingSystemUI = YES", (uint8_t *)&v19, 0xCu);
      }
      char v6 = 0;
      uint64_t v7 = 35;
      goto LABEL_24;
    case 2:
      if (!_os_feature_enabled_impl()) {
        return;
      }
      int64_t inputType = self->_inputType;
      id v10 = AFSiriLogContextConnection;
      BOOL v11 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
      if (inputType == 1)
      {
        if (v11)
        {
          int v19 = 136315138;
          __int16 v20 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #dismissal Siri will process app launch -> dismissing Siri", (uint8_t *)&v19, 0xCu);
        }
        uint64_t v12 = 29;
        goto LABEL_17;
      }
      if (v11)
      {
        int v19 = 136315138;
        __int16 v20 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #dismissal Siri will process app launch -> recording _willLaunchApp = YES", (uint8_t *)&v19, 0xCu);
      }
      char v6 = 1;
      uint64_t v7 = 97;
      goto LABEL_24;
    case 3:
      int64_t v13 = self->_inputType;
      __int16 v14 = AFSiriLogContextConnection;
      BOOL v15 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
      if (v13 == 1)
      {
        if (v15)
        {
          int v19 = 136315138;
          __int16 v20 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #dismissal Response presented fully in-app -> dismissing Siri", (uint8_t *)&v19, 0xCu);
        }
        uint64_t v12 = 64;
LABEL_17:
        int v16 = [(SRSystemAssistantExperiencePresentation *)self delegate];
        [v16 dismissSiriPresentation:self withReason:v12];
      }
      else
      {
        if (v15)
        {
          int v19 = 136315138;
          __int16 v20 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #dismissal Response presented fully in-app -> recording _presentedResponseInApp = YES", (uint8_t *)&v19, 0xCu);
        }
        char v6 = 1;
        uint64_t v7 = 120;
LABEL_24:
        *((unsigned char *)&self->super.isa + v7) = 1;
        id v17 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 136315138;
          __int16 v20 = "-[SRSystemAssistantExperiencePresentation _handleNonSnippetResponse:]";
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Removing all elements of the response UI if needed", (uint8_t *)&v19, 0xCu);
        }
        [(SRSystemAssistantExperienceViewController *)self->_saeViewController removeResponseElementsIfNeeded:-1];
        if (self->_inputType == 1) {
          char v18 = v6;
        }
        else {
          char v18 = 1;
        }
        if ((v18 & 1) == 0)
        {
          [(SRSystemAssistantExperienceViewController *)self->_saeViewController endTypeToSiriLatencyStateIfNeeded];
          [(SRSystemAssistantExperienceViewController *)self->_saeViewController resignKeyboardIfNeeded];
        }
      }
      return;
    default:
      return;
  }
}

- (void)setShowsSensitiveUI:(BOOL)a3
{
}

- (void)dockFrameDidChange:(CGRect)a3
{
}

- (BOOL)_showSpeech
{
  if ([(SRSystemAssistantExperiencePresentation *)self alwaysShowRecognizedSpeech]) {
    return 1;
  }
  BOOL v4 = [(SRSystemAssistantExperienceViewController *)self->_saeViewController viewState];
  id v5 = [v4 activeSmartDialogView];
  unsigned __int8 v6 = [v5 revealRecognizedSpeech];

  return v6;
}

- (void)_activeConversationDidChange
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self _activeConversation];
  id v3 = [objc_alloc((Class)SiriSharedUISAEViewModelController) initWithConversation:v4 delegate:self];
  [(SRSystemAssistantExperiencePresentation *)self setActiveViewModelController:v3];
}

- (void)setActiveViewModelController:(id)a3
{
  id v4 = a3;
  [(SiriSharedUISAEViewModelController *)self->_activeViewModelController setDelegate:0];
  viewModelControllerQueue = self->_viewModelControllerQueue;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  BOOL v11 = sub_10002C3D8;
  uint64_t v12 = &unk_1001436E0;
  int64_t v13 = self;
  id v14 = v4;
  id v6 = v4;
  dispatch_sync(viewModelControllerQueue, &v9);
  activeViewModelController = self->_activeViewModelController;
  double v8 = [(SRSystemAssistantExperienceViewController *)self->_saeViewController viewState];
  [(SiriSharedUISAEViewModelController *)activeViewModelController setViewModelChangeObserver:v8];
}

- (int64_t)inputTypeForSAEViewModelController:(id)a3
{
  int64_t v4 = [(SRSystemAssistantExperiencePresentation *)self _inputType];

  return [(SRSystemAssistantExperiencePresentation *)self _viewModelInputTypeForRequestInputType:v4];
}

- (void)saeViewModelController:(id)a3 didProcessConversationItemsWithIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self didPresentConversationItemsWithIdentifiers:v5];
}

- (BOOL)saeViewModelControllerShouldAlwaysShowRecognizedSpeech:(id)a3
{
  return [(SRSystemAssistantExperiencePresentation *)self _showSpeech];
}

- (BOOL)siriDeviceLockedForViewModelController:(id)a3
{
  int64_t v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  unint64_t v5 = ((unint64_t)[v4 siriDeviceLockStateForSiriPresentation:self] >> 1) & 1;

  return v5;
}

- (id)saeViewModelController:(id)a3 requestsTranscriptItemForAceObject:(id)a4
{
  id v5 = a4;
  id v6 = +[SRLocalSnippetManager transcriptItemForObject:v5];
  if (!v6)
  {
    uint64_t v7 = +[SiriUISnippetManager sharedInstance];
    id v6 = [v7 transcriptItemForObject:v5 sizeClass:1];
  }
  [v6 setTaskIdentifier:self->_currentTaskIdentifier];

  return v6;
}

- (void)immersiveExperienceRequestedForViewModelController:(id)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v4 siriPresentation:self requestHostBlurVisible:1 reason:3 fence:0];
}

- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    id v17 = "-[SRSystemAssistantExperiencePresentation handleRequestEndBehavior:isAttending:]";
    __int16 v18 = 1024;
    LODWORD(v19) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s handling request end behavior in presentation: isAttending: %d", (uint8_t *)&v16, 0x12u);
  }
  if (v4)
  {
    if ([v6 premptivelyResumeMedia])
    {
      double v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315138;
        id v17 = "-[SRSystemAssistantExperiencePresentation handleRequestEndBehavior:isAttending:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Presentation will resume media on idle", (uint8_t *)&v16, 0xCu);
      }
      self->_shouldResumeMediaOnIdle = 1;
    }
    uint64_t v9 = [v6 minimumAutoDismissalTimeInMs];

    if (v9)
    {
      uint64_t v10 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = v10;
        uint64_t v12 = [v6 minimumAutoDismissalTimeInMs];
        id v13 = [v12 longValue];
        int v16 = 136315394;
        id v17 = "-[SRSystemAssistantExperiencePresentation handleRequestEndBehavior:isAttending:]";
        __int16 v18 = 2048;
        id v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Setting delay dismissal for compact presentation by %ld milliseconds.", (uint8_t *)&v16, 0x16u);
      }
      id v14 = [v6 minimumAutoDismissalTimeInMs];
      delayDismissalMs = self->_delayDismissalMs;
      self->_delayDismissalMs = v14;
    }
  }
}

- (void)handleFeedbackForm:(id)a3
{
}

- (void)updateFeedbackFormWithSpeakableText:(id)a3
{
  id v8 = a3;
  currentFeedbackForm = self->_currentFeedbackForm;
  if (!currentFeedbackForm)
  {
    id v5 = (SAUIFeedbackForm *)objc_alloc_init((Class)SAUIFeedbackForm);
    id v6 = self->_currentFeedbackForm;
    self->_currentFeedbackForm = v5;

    [(SAUIFeedbackForm *)self->_currentFeedbackForm setDomain:SAUIFeedbackFormDomainSystemAssistantValue];
    currentFeedbackForm = self->_currentFeedbackForm;
  }
  uint64_t v7 = [(SAUIFeedbackForm *)currentFeedbackForm output];

  if (!v7) {
    [(SAUIFeedbackForm *)self->_currentFeedbackForm setOutput:v8];
  }
}

- (void)siriSAEViewCOntrollerRequestStopAttending:(id)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v4 siriWillStopAttending:self];
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  bugReportingPresenter = self->_bugReportingPresenter;
  if (bugReportingPresenter
    && (-[AFUIBugReportPresenting hasContentAtPoint:](bugReportingPresenter, "hasContentAtPoint:", a3.x, a3.y) & 1) != 0)
  {
    return 1;
  }
  -[SRSystemAssistantExperiencePresentation _convertToPointInSAEViewCoordinates:](self, "_convertToPointInSAEViewCoordinates:", x, y);
  saeViewController = self->_saeViewController;

  return -[SRSystemAssistantExperienceViewController hasContentAtPoint:](saeViewController, "hasContentAtPoint:");
}

- (CGPoint)_convertToPointInSAEViewCoordinates:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(SRSystemAssistantExperienceViewController *)self->_saeViewController view];
  id v6 = [v5 window];
  uint64_t v7 = [v6 screen];

  id v8 = [v7 coordinateSpace];
  [v5 convertPoint:v8 fromCoordinateSpace:x, y];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double y = v14;
  result.double x = v13;
  return result;
}

- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4
{
  uint64_t v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_1000B7ACC(v7);
  }
  if (a4 == 1)
  {
    [(SRSystemAssistantExperiencePresentation *)self _didDetectTouchOutsideOfSiri];
  }
  else if (!a4)
  {
    [(SRSystemAssistantExperiencePresentation *)self _didDetectGestureEventWithinSiri:a3];
  }
}

- (void)_didDetectGestureEventWithinSiri:(int64_t)a3
{
  if (self->_inputType != 1)
  {
    self->_detectedTouchOutsideOfSiri = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002CB84;
    block[3] = &unk_100142E88;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_didDetectTouchOutsideOfSiri
{
  if (self->_inputType != 1)
  {
    unsigned int v3 = [(SRSystemAssistantExperienceViewController *)self->_saeViewController presentedResponseElements];
    id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
    unsigned int v5 = [v4 siriPresentationIsPresentingSystemUI:self];

    char v6 = v5 ^ 1;
    if ((v3 & 2) != 0) {
      char v6 = 0;
    }
    if (v6 & 1) != 0 || (v3)
    {
      if ((~v3 & 3) == 0) {
        [(SRSystemAssistantExperienceViewController *)self->_saeViewController removeResponseElementsIfNeeded:2];
      }
      if ((v3 & v5) == 1)
      {
        uint64_t v7 = [(SRSystemAssistantExperiencePresentation *)self delegate];
        [v7 siriPresentationRequestsSystemUICollapse:self];
      }
      if (self->_siriIsIdleAndQuiet)
      {
        [(SRSystemAssistantExperiencePresentation *)self _scheduleAutoDismissalForTouchOutsideOfSiri];
      }
      else
      {
        self->_detectedTouchOutsideOfSiri = 1;
      }
    }
    else
    {
      id v8 = [(SRSystemAssistantExperiencePresentation *)self delegate];
      [v8 dismissSiriPresentation:self withReason:23];
    }
  }
}

- (void)setBottomContentInset:(double)a3
{
}

- (void)setTopContentInset:(double)a3 animated:(BOOL)a4
{
}

- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4
{
  id v10 = a4;
  self->_lastDismissalReason = a3;
  objc_storeStrong((id *)&self->_lastDismissalOptions, a4);
  uint64_t v7 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  id v8 = [v7 siriDeviceLockStateForSiriPresentation:self];

  if (a3 == 67 || a3 == 13)
  {
    if (v8) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    +[SRNotificationUtility postSiriUnavailableNotification:v9];
  }
}

- (id)_dismissalContextWithDismissalReason:(int64_t)a3 dismissalOptions:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  id v8 = [v7 siriDeviceLockStateForSiriPresentation:self];

  uint64_t v9 = [(SRSystemAssistantExperiencePresentation *)self dataSource];
  id v10 = [v9 siriStateForSiriPresentation:self];

  if (self->_hasPresentedContent || self->_hasOmittedDialogFromPresenting) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 2 * self->_isCurrentRequestPresentingSystemUI;
  }
  double v12 = [SRDismissalClassificationContext alloc];
  id v13 = [v6 reason];

  double v14 = [(SRDismissalClassificationContext *)v12 initWithCancellationReason:v13 contentPresentationState:v11 dismissalReason:a3 isDeviceUnlocked:v8 == 0 siriState:v10 requestSource:self->_initialRequestSource];

  return v14;
}

- (double)expectedContentWidth
{
  unsigned int v3 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v3 contentWidthForForSiriPresentation:self];
  double v5 = v4;

  return v5;
}

- (void)tapToEditPresented
{
  id v3 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v3 tapToEditPresented:self];
}

- (CGSize)maxSizeForSnippet
{
  [(SRSystemAssistantExperienceViewController *)self->_saeViewController maxSizeForSnippet];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)effectiveContentFrame
{
  double v2 = [(SRSystemAssistantExperienceViewController *)self->_saeViewController view];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)viewController:(id)a3 openURL:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v9 siriPresentation:self openURL:v8 conversationId:0 completion:v7];
}

- (void)viewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  v26 = v8;
  id v27 = a5;
  if (v27)
  {
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x2020000000;
    char v44 = 1;
    id v9 = dispatch_group_create();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v8;
    id v10 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16 v24, v8];
    if (v10)
    {
      uint64_t v11 = *(void *)v40;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v39 + 1) + 8 * i);
          dispatch_group_enter(v9);
          double v14 = [(SRSystemAssistantExperiencePresentation *)self delegate];
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_10002D39C;
          v36[3] = &unk_100143708;
          v38 = v43;
          v37 = v9;
          [v14 siriPresentation:self performAceCommand:v13 conversationItemIdentifier:0 completion:v36];
        }
        id v10 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
      }
      while (v10);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002D3B4;
    block[3] = &unk_100143730;
    id v34 = v27;
    v35 = v43;
    dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);

    _Block_object_dispose(v43, 8);
  }
  else
  {
    BOOL v15 = +[SRUIFInstrumentationManager sharedManager];
    int v16 = [v15 currentInstrumentationTurnContext];
    id v17 = [v16 turnIdentifier];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = v8;
    id v19 = [v18 countByEnumeratingWithState:&v29 objects:v45 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v30;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v30 != v20) {
            objc_enumerationMutation(v18);
          }
          uint64_t v22 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
          __int16 v23 = [(SRSystemAssistantExperiencePresentation *)self delegate];
          [v23 siriPresentation:self performAceCommand:v22 conversationItemIdentifier:0 turnIdentifier:v17 completion:0];
        }
        id v19 = [v18 countByEnumeratingWithState:&v29 objects:v45 count:16];
      }
      while (v19);
    }
  }
}

- (void)saeViewController:(id)a3 speakText:(id)a4 isPhonetic:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  uint64_t v11 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  id v12 = v11;
  if (v6) {
    [v11 siriPresentation:self synthesizeSpeechWithPhoneticText:v10 completion:v9];
  }
  else {
    [v11 siriPresentation:self synthesizeSpeechWithText:v10 completion:v9];
  }
}

- (void)stopSpeakingForSAEViewController:(id)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v4 stopSpeakingForSiriPresentation:self];
}

- (unint64_t)lockStateForSAEViewController:(id)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  id v5 = [v4 siriDeviceLockStateForSiriPresentation:self];

  return (unint64_t)v5;
}

- (id)localeForSAEViewController:(id)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  id v5 = [v4 localeForSiriPresentation:self];

  return v5;
}

- (void)viewControllerDidPresentUserInterface:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained siriPresentationDidPresentUserInterface:self];
}

- (void)userTouchedSnippet
{
  id v2 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v2 userTouchedSnippet];
}

- (void)saeViewController:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(SRSystemAssistantExperiencePresentation *)self delegate];
    [v10 siriPresentation:self handleStartLocalRequest:v11 turnIdentifier:v7];
  }
}

- (void)saeViewController:(id)a3 setStatusViewHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self setStatusViewHidden:v4];
}

- (void)viewControllerViewWillDisappear:(id)a3
{
}

- (void)viewController:(id)a3 requestsHostBackgroundBlurVisible:(BOOL)a4 reason:(int64_t)a5 fence:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v10 siriPresentation:self requestHostBlurVisible:v7 reason:a5 fence:v9];
}

- (void)viewController:(id)a3 reduceOrbOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self reduceOrbOpacity:v4];
}

- (void)endSiriSessionForViewController:(id)a3 withDismissalReason:(int64_t)a4
{
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 dismissSiriPresentation:self withReason:a4];
}

- (void)stopRecordingForViewController:(id)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v4 stopRecordingSpeechForSiriPresentation:self];
}

- (void)cancelRequestForViewController:(id)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v4 cancelRequestForSiriPresentation:self];
}

- (void)siriResultsWillDismissInTamale
{
  double v3 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v3 cancelRequestForSiriPresentation:self];

  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v4 siriWillStopAttending:self];

  [(SRSystemAssistantExperienceViewController *)self->_saeViewController removeResponseElementsIfNeeded:-1];
  id v5 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v5 updateEdgeLightWindowLevel:0];

  activeViewModelController = self->_activeViewModelController;

  [(SiriSharedUISAEViewModelController *)activeViewModelController clearLatencySummaryWithoutViewUpdate];
}

- (void)_updatePresentationForVisualIntelligenceCameraIfNeeded
{
  if (!self->_isPresentingVisualIntelligenceCamera)
  {
    [(SRSystemAssistantExperiencePresentation *)self siriResultsWillDismissInTamale];
    [(SRSystemAssistantExperienceViewController *)self->_saeViewController didSetInputTypeFromTextToVisualIntelligenceCamera];
    self->_isPresentingVisualIntelligenceCamera = 1;
  }
  saeViewController = self->_saeViewController;

  [(SRSystemAssistantExperienceViewController *)saeViewController switchPresentationToVisualIntelligenceCameraInput];
}

- (void)siriResultsDidDismissInTamale
{
  if (self->_isPresentingVisualIntelligenceCamera)
  {
    [(SRSystemAssistantExperiencePresentation *)self _setInputType:3];
    id v3 = [(SRSystemAssistantExperiencePresentation *)self delegate];
    [v3 siriResultsDidDismissInTamaleForSiriPresentation:self];
  }
}

- (void)didPresentContentForSAEViewController:(id)a3
{
  self->_hasPresentedContent = 1;
  if ([(SRSystemAssistantExperienceViewController *)self->_saeViewController isInAmbient])
  {
    id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
    [v4 siriPresentation:self requestHostBlurVisible:1 reason:2 fence:0];
  }
}

- (id)effectiveCoreLocationBundleForSAEViewController:(id)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  id v5 = [v4 effectiveCoreLocationBundleForSiriPresentation:self];

  return v5;
}

- (void)siriSAEViewController:(id)a3 willPresentViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self willPresentViewController:v5];
}

- (void)didBeginProcessingConversationItems
{
  id v2 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v2 didBeginProcessingConversationItems];
}

- (void)siriSAEViewController:(id)a3 willDismissViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self willDismissViewController:v5];
}

- (void)saeViewController:(id)a3 viewDidAppearForAceObject:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self viewDidAppearWithAceObject:v5];
}

- (void)saeViewController:(id)a3 viewDidDisappearForAceObject:(id)a4
{
  id v5 = a4;
  id v8 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  id v6 = [v5 encodedClassName];
  BOOL v7 = [v5 aceId];

  [v8 siriPresentation:self viewDidDisappearWithClassDescriptor:v6 identifier:v7];
}

- (void)userDrilledIntoSnippet
{
  id v2 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v2 userDrilledIntoSnippet];
}

- (void)contentDidUpdate
{
  self->_detectedTouchOutsideOfSiri = 0;
}

- (void)siriSAEViewControllerRequestsVoiceActivation:(id)a3 withRequestOptions:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self startRequestWithOptions:v5];
}

- (void)siriSAEViewControllerRequestsTextActivation:(id)a3 withRequestSource:(int64_t)a4
{
  id v5 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v5 cancelRequestForSiriPresentation:self];

  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriWillStopAttending:self];
}

- (void)saeViewController:(id)a3 preventOutsideTouchesFromDismissingSiri:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self preventOutsideTouchesFromDismissingSiri:v4];
}

- (void)viewController:(id)a3 willChangeKeyboardVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self willChangeKeyboardVisibility:v4];
}

- (void)didTapCloseButtonOnSnippet
{
  id v3 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v3 dismissSiriPresentation:self withReason:66];
}

- (id)_analytics
{
  return +[AFAnalytics sharedAnalytics];
}

- (void)toggleHomeAffordanceHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v4 toggleHomeAffordanceHidden:v3];
}

- (void)updateEdgeLightWindowLevel:(int64_t)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v4 updateEdgeLightWindowLevel:a3];
}

- (void)siriDidReceiveStartImmersiveExperienceCommand:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v8 siriWillStopAttending:self];

  id v9 = [v7 aceId];

  [(SRSystemAssistantExperienceViewController *)self->_saeViewController presentGenerativeAssistantOnboardingFlowWithCommandId:v9 completion:v6];
}

- (void)siriDidReceiveStartGenAIEnablementFlowCommand:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v7 siriWillStopAttending:self];

  [(SRSystemAssistantExperienceViewController *)self->_saeViewController presentGenerativeAssistantOnboardingFlowWithCommand:v8 completion:v6];
}

- (BOOL)alwaysShowRecognizedSpeech
{
  id v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 alwaysShowRecognizedSpeech];

  return v3;
}

- (BOOL)isPresentingVisualIntelligenceCamera
{
  return self->_isPresentingVisualIntelligenceCamera;
}

- (void)didReceiveBugButtonLongPress
{
  self->_shouldMuteSiriFeedbackBanner = 1;
  [(SRSystemAssistantExperiencePresentation *)self _setupBugReportingPresenterIfNecessary];
  bugReportingPresenter = self->_bugReportingPresenter;

  [(AFUIBugReportPresenting *)bugReportingPresenter didReceiveBugButtonLongPress];
}

- (void)didReceiveReportBugAction
{
  self->_shouldMuteSiriFeedbackBanner = 1;
  [(SRSystemAssistantExperiencePresentation *)self _setupBugReportingPresenterIfNecessary];
  bugReportingPresenter = self->_bugReportingPresenter;

  [(AFUIBugReportPresenting *)bugReportingPresenter didReceiveReportBugAction];
}

- (void)_setupBugReportingPresenterIfNecessary
{
  if (!self->_bugReportingPresenter)
  {
    AFUICreateBugReportPresentingWithDelegate();
    unsigned __int8 v3 = (AFUIBugReportPresenting *)objc_claimAutoreleasedReturnValue();
    bugReportingPresenter = self->_bugReportingPresenter;
    self->_bugReportingPresenter = v3;
    _objc_release_x1(v3, bugReportingPresenter);
  }
}

- (void)bugReportPresenter:(id)a3 requestsToHandlePasscodeUnlockWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 handlePasscodeUnlockForSiriPresentation:self withCompletion:v5];
}

- (void)bugReportPresenter:(id)a3 requestsToOpenURL:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v9 siriPresentation:self openURL:v8 conversationId:0 completion:v7];
}

- (void)bugReportPresenter:(id)a3 requestsToPerformAceCommand:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self performAceCommand:v5 conversationItemIdentifier:0 completion:0];
}

- (void)bugReportPresenter:(id)a3 requestsToPresentViewController:(id)a4
{
}

- (void)bugReportPresenter:(id)a3 requestsToTakeScreenshotWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 getScreenshotImageForSiriPresentation:self withCompletion:v5];
}

- (void)bugReportPresenter:(id)a3 setBugReportingAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self setBugReportingAvailable:v4];
}

- (id)bugReportPresenterRequestsBugReportKeywordIdentifiers:(id)a3
{
  CFStringRef v5 = @"1229562";
  unsigned __int8 v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (id)bugReportPresenterRequestsBugReportPrefixForTitle:(id)a3
{
  id v3 = objc_alloc_init((Class)UIDevice);
  BOOL v4 = [v3 buildVersion];

  CFStringRef v5 = +[NSString stringWithFormat:@"[%@]", v4];

  return v5;
}

- (double)bugReportPresenterRequestsLastPresentationTime:(id)a3
{
  [(SRSystemAssistantExperienceViewController *)self->_saeViewController lastPresentationTime];
  return result;
}

- (id)bugReportPresenterRequestsPresentingView:(id)a3
{
  return [(SRSystemAssistantExperienceViewController *)self->_saeViewController view];
}

- (void)bugReportPresenter:(id)a3 setStatusViewHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self setStatusViewHidden:v4];
}

- (void)bugReportPresenterRequestsInvalidateAutoDismissal:(id)a3
{
  [(SRCompactAutoDismissController *)self->_autoDismissController invalidate];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    CFStringRef v5 = "-[SRSystemAssistantExperiencePresentation bugReportPresenterRequestsInvalidateAutoDismissal:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Siri TTR invalidated Auto Dismissal to keep Siri TTR modal up.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)bugReportPresenterRequestsSiriSessionToFinishCurrentRequest:(id)a3
{
  id v3 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v3 siriSessionWillCancelRequest];

  int v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SRSystemAssistantExperiencePresentation bugReportPresenterRequestsSiriSessionToFinishCurrentRequest:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #SiriTTR Cancel current Siri Session request so that it doesn't interrupt user filing issue details.", (uint8_t *)&v5, 0xCu);
  }
}

- (BOOL)bugReportPresenterShouldPromptUserForScreenshotPermission:(id)a3
{
  return 1;
}

- (void)bugReportPresenter:(id)a3 requestsSiriDismissalWithReason:(int64_t)a4
{
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    id v9 = "-[SRSystemAssistantExperiencePresentation bugReportPresenter:requestsSiriDismissalWithReason:]";
    __int16 v10 = 2048;
    int64_t v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #SiriTTR: Dismissing Siri with SASDismissalReason: %ld", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v7 dismissSiriPresentation:self withReason:a4];
}

- (void)saeViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self requestsKeyboardWithCompletion:v5];
}

- (void)saeViewController:(id)a3 willBeginEditingOfType:(int64_t)a4
{
  BOOL v5 = a4 == 1;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self willBeginEditingOfType:v5];
}

- (void)saeViewControllerDidEndEditing:(id)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v4 siriPresentationDidResignFirstResponder:self];
}

- (void)viewController:(id)a3 siriRequestEnteredWithText:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self startRequestForText:v5];
}

- (void)viewController:(id)a3 siriRequestEnteredWithSuggestion:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v6 siriPresentation:self startRequestForSuggestion:v5 inputType:self->_inputType];
}

- (void)viewController:(id)a3 didFinishEditingUtteranceWithText:(id)a4 originalUserUtterance:(id)a5 selectionResults:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  uint64_t v13 = [v10 correctionIdentifier];
  [v12 siriPresentation:self startEditedRequestWithText:v9 correctionIdentifier:v13 userSelectionResults:v11];

  double v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315138;
    BOOL v21 = "-[SRSystemAssistantExperiencePresentation viewController:didFinishEditingUtteranceWithText:originalUserUtteran"
          "ce:selectionResults:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #sae: creating new UserUtterance from edited text", (uint8_t *)&v20, 0xCu);
  }
  id v15 = objc_alloc((Class)AFUserUtterance);
  int v16 = [v10 correctionIdentifier];
  id v17 = [v15 initWithString:v9 correctionIdentifier:v16];

  [(SRSystemAssistantExperienceViewController *)self->_saeViewController setRevealRecognizedSpeech:1];
  id v18 = [(SRSystemAssistantExperiencePresentation *)self activeViewModelController];
  [v18 revealUserUtterance:v17 backingAceObject:0];

  id v19 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v19 siriPresentationDidEndEditing:self];
}

- (void)saeViewControllerRequestsHIDEventDefferal:(id)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v4 siriPresentationRequestsHIDEventDefferal:self];
}

- (void)saeViewControllerCancelHIDEventDefferal:(id)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v4 siriPresentationCancelHIDEventDefferal:self];
}

- (id)feedbackFormForCurrentRequest
{
  return self->_currentFeedbackForm;
}

- (SASRequestOptions)_activeRequestOptions
{
  id v3 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  id v4 = [v3 activeRequestOptionsForSiriPresentation:self];

  return (SASRequestOptions *)v4;
}

- (void)siriIsIdleAndQuietStatusDidChange:(BOOL)a3 isAttending:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    responseMode = self->_responseMode;
    BOOL requestIsWiredMicOrBTHeadsetOrWx = self->_requestIsWiredMicOrBTHeadsetOrWx;
    int v12 = 136316162;
    uint64_t v13 = "-[SRSystemAssistantExperiencePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
    __int16 v14 = 1024;
    BOOL v15 = v5;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    __int16 v18 = 2112;
    id v19 = responseMode;
    __int16 v20 = 1024;
    BOOL v21 = requestIsWiredMicOrBTHeadsetOrWx;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #compact siriIsIdleAndQuiet: %d, isAttending: %d, responseMode: %@, requestIsWiredMicOrBTHeadsetOrWx: %d", (uint8_t *)&v12, 0x28u);
  }
  self->_siriIsIdleAndQuiet = v5;
  id v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    uint64_t v13 = "-[SRSystemAssistantExperiencePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
    __int16 v14 = 1024;
    BOOL v15 = v5;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Stopping auto dismissal if needed because idle and quiet status did change: siriIsIdleAndQuiet=%d, isAttending=%d", (uint8_t *)&v12, 0x18u);
  }
  [(SRCompactAutoDismissController *)self->_autoDismissController stopAutoDismissalAttentionController];
  if (v5)
  {
    [(SRSystemAssistantExperienceViewController *)self->_saeViewController siriIsIdleAndQuiet];
    id v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      uint64_t v13 = "-[SRSystemAssistantExperiencePresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Starting auto dismissal if needed because Siri is idle and quiet", (uint8_t *)&v12, 0xCu);
    }
    [(SRSystemAssistantExperiencePresentation *)self _startAutoDismissalIfNeededGivenSiriIsAttending:v4];
  }
}

- (void)didReceiveOrbViewTapToCancelRequest
{
  self->_userCancelledRequestViaOrbViewTap = 1;
}

- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates
{
  int64_t inputType = self->_inputType;
  if (inputType == 3)
  {
    id v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[SRSystemAssistantExperiencePresentation shouldUseEventDrivenIdleAndQuietUpdates]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s InputTypeTamale shouldUseEventDrivenIdleAndQuietUpdates=False", (uint8_t *)&v5, 0xCu);
    }
  }
  return inputType != 3;
}

- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3
{
}

- (void)siriDidHidePasscodeUnlock
{
}

- (id)dismissalUserInfo
{
  [(SRCompactAutoDismissController *)self->_autoDismissController autoDismissalReason];
  id v2 = SUICStringForAutoDismissalReason();
  if (v2)
  {
    v6[0] = SiriUIDismissalReasonUserInfoKey;
    id v3 = SiriUIDismissalReasonStringFromReason();
    v6[1] = SiriUIDismissalReasonDescriptionUserInfoKey;
    v7[0] = v3;
    v7[1] = v2;
    BOOL v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)_startAutoDismissalIfNeededGivenSiriIsAttending:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    id v19 = "-[SRSystemAssistantExperiencePresentation _startAutoDismissalIfNeededGivenSiriIsAttending:]";
    __int16 v20 = 1024;
    LODWORD(v21) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Starting auto dismissal if needed, isAttending=%d", (uint8_t *)&v18, 0x12u);
  }
  if (self->_inputType == 1)
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315138;
      id v19 = "-[SRSystemAssistantExperiencePresentation _startAutoDismissalIfNeededGivenSiriIsAttending:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Not starting auto dismissal because we're in type-to-Siri mode", (uint8_t *)&v18, 0xCu);
    }
    return;
  }
  if (self->_detectedTouchOutsideOfSiri) {
    [(SRSystemAssistantExperiencePresentation *)self _scheduleAutoDismissalForTouchOutsideOfSiri];
  }
  if (v3)
  {
    responseMode = self->_responseMode;
    int v8 = MDModeGetName();
    if ([(NSString *)responseMode isEqualToString:v8])
    {

LABEL_12:
      delayDismissalMs = self->_delayDismissalMs;
      if (delayDismissalMs)
      {
        double v11 = (double)[(NSNumber *)delayDismissalMs longValue] / 1000.0;
        int v12 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315394;
          id v19 = "-[SRSystemAssistantExperiencePresentation _startAutoDismissalIfNeededGivenSiriIsAttending:]";
          __int16 v20 = 2048;
          uint64_t v21 = *(void *)&v11;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #autodismiss, setting minimum dismissal time to %lf s for VoiceOnly/Headphones", (uint8_t *)&v18, 0x16u);
        }
      }
      else
      {
        double v11 = 0.0;
      }
      [(SRCompactAutoDismissController *)self->_autoDismissController updateMinimumIdleTimeInterval:v11];
      goto LABEL_17;
    }
    BOOL requestIsWiredMicOrBTHeadsetOrWx = self->_requestIsWiredMicOrBTHeadsetOrWx;

    if (requestIsWiredMicOrBTHeadsetOrWx) {
      goto LABEL_12;
    }
  }
LABEL_17:
  [(SRCompactAutoDismissController *)self->_autoDismissController startAutoDismissalAttentionController];
  if (!self->_hasPresentedContent
    && !self->_hasOmittedDialogFromPresenting
    && !self->_isCurrentRequestPresentingSystemUI
    && !self->_willLaunchApp
    && !self->_presentedResponseFullyInApp)
  {
    BOOL userCancelledRequestViaOrbViewTap = self->_userCancelledRequestViaOrbViewTap;
    __int16 v14 = AFSiriLogContextConnection;
    BOOL v15 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (userCancelledRequestViaOrbViewTap)
    {
      if (v15)
      {
        int v18 = 136315394;
        id v19 = "-[SRSystemAssistantExperiencePresentation _startAutoDismissalIfNeededGivenSiriIsAttending:]";
        __int16 v20 = 2048;
        uint64_t v21 = 0x4008000000000000;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Siri is idle and hasn't presented content to the user. Scheduling autodismissal in %.0f seconds because orbView was tapped", (uint8_t *)&v18, 0x16u);
      }
      autoDismissController = self->_autoDismissController;
      double v17 = 3.0;
    }
    else
    {
      if (v15)
      {
        int v18 = 136315394;
        id v19 = "-[SRSystemAssistantExperiencePresentation _startAutoDismissalIfNeededGivenSiriIsAttending:]";
        __int16 v20 = 2048;
        uint64_t v21 = 0x3FD3333340000000;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Siri is idle and hasn't presented content to the user. Scheduling autodismissal in %.0f seconds", (uint8_t *)&v18, 0x16u);
      }
      autoDismissController = self->_autoDismissController;
      double v17 = 0.300000012;
    }
    [(SRCompactAutoDismissController *)autoDismissController scheduleAutoDismissalForLongIdling:v17];
  }
}

- (void)_scheduleAutoDismissalForTouchOutsideOfSiri
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F364;
  block[3] = &unk_100142E88;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)dismissSiriResults
{
}

- (void)_setInputType:(int64_t)a3
{
  int64_t inputType = self->_inputType;
  if (inputType != a3)
  {
    if (a3 == 1 && inputType == 2 || a3 == 1 && inputType == 3)
    {
      self->_int64_t inputType = 1;
      [(SRSystemAssistantExperienceViewController *)self->_saeViewController switchPresentationToTextInput];
    }
    else if (a3 == 3)
    {
      self->_int64_t inputType = 3;
      [(SRSystemAssistantExperiencePresentation *)self _updatePresentationForVisualIntelligenceCameraIfNeeded];
    }
    else
    {
      self->_int64_t inputType = a3;
    }
    id v6 = [(SRSystemAssistantExperiencePresentation *)self activeViewModelController];
    [v6 inputTypeDidChange];

    id v7 = [(SRSystemAssistantExperiencePresentation *)self delegate];
    [v7 siriPresentation:self inputTypeDidChange:a3];
  }
}

- (void)autoDismissControllerRequestsDismissal:(id)a3
{
  id v4 = a3;
  if (self->_shouldPauseAutoDismissal)
  {
    int v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      double v11 = "-[SRSystemAssistantExperiencePresentation autoDismissControllerRequestsDismissal:]";
      id v6 = "%s #compact holding onto autodismissal event waiting for mitigation result";
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    if (self->_isPresentingVisualIntelligenceCamera)
    {
      [(SRSystemAssistantExperiencePresentation *)self dismissSiriResults];
      goto LABEL_12;
    }
    id v7 = +[SiriSharedUIReplayUtilityWrapper sharedInstance];
    unsigned int v8 = [v7 shouldSkipAutoDismissal];

    if (!v8)
    {
      id v9 = [(SRSystemAssistantExperiencePresentation *)self delegate];
      [v9 dismissSiriPresentation:self withReason:4];

      goto LABEL_12;
    }
    int v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      double v11 = "-[SRSystemAssistantExperiencePresentation autoDismissControllerRequestsDismissal:]";
      id v6 = "%s #compact skipped dismissal due to replay but holding onto autodismissal event";
      goto LABEL_4;
    }
  }
  self->_BOOL hasPendingAutoDismissal = 1;
LABEL_12:
}

- (void)autoDismissControllerRequestsStopAttending:(id)a3
{
  id v4 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v4 siriWillStopAttending:self];
}

- (void)modalContainerViewControllerViewWillDisappear:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v5 siriPresentation:self willDismissViewController:v4];
}

- (void)modalContainerViewControllerViewDidDisappear:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSystemAssistantExperiencePresentation *)self delegate];
  [v5 siriPresentation:self didDismissViewController:v4];
}

- (void)playbackDidFinishForVideoPlayerViewController:(id)a3
{
}

- (void)playbackDidFailForVideoPlayerViewController:(id)a3
{
}

- (void)_dismissVideoPlayerViewController
{
  [(SRSystemAssistantExperienceViewController *)self->_saeViewController dismissViewControllerAnimated:1 completion:0];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002F7F0;
  v3[3] = &unk_100142E88;
  v3[4] = self;
  +[UIView animateWithDuration:v3 animations:0.2];
}

- (int64_t)_viewModelInputTypeForRequestInputType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (SiriUIPresentationDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (SiriUIPresentationDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (SiriUIPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SiriUIPresentationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SiriSharedUISAEViewModelController)activeViewModelController
{
  return self->_activeViewModelController;
}

- (int64_t)_inputType
{
  return self->_inputType;
}

- (void)setIsPresentingVisualIntelligenceCamera:(BOOL)a3
{
  self->_isPresentingVisualIntelligenceCamera = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeViewModelController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_currentTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_currentFeedbackForm, 0);
  objc_storeStrong((id *)&self->_viewModelControllerQueue, 0);
  objc_storeStrong((id *)&self->_previousConversation, 0);
  objc_storeStrong((id *)&self->_delayDismissalMs, 0);
  objc_storeStrong((id *)&self->_lastDismissalOptions, 0);
  objc_storeStrong((id *)&self->_keyboardBringUpTurnIdentifier, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_autoDismissController, 0);
  objc_storeStrong((id *)&self->_bugReportingPresenter, 0);

  objc_storeStrong((id *)&self->_saeViewController, 0);
}

@end