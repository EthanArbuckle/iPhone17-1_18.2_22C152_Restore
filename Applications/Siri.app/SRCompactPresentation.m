@interface SRCompactPresentation
- (BOOL)alwaysShowRecognizedSpeech;
- (BOOL)bugReportPresenterShouldPromptUserForScreenshotPermission:(id)a3;
- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3;
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)shouldResumeInterruptedAudioPlayback;
- (BOOL)shouldResumeInterruptedAudioPlaybackForAttendingState:(BOOL)a3;
- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates;
- (BOOL)siriDeviceLockedForViewModelController:(id)a3;
- (BOOL)supportsVisualPresentationForConversationItem:(id)a3;
- (CGRect)effectiveContentFrame;
- (CGSize)maxSizeForSnippet;
- (SASRequestOptions)_activeRequestOptions;
- (SRCompactPresentation)initWithDelegate:(id)a3 dataSource:(id)a4;
- (SiriSharedUICompactViewModelController)activeViewModelController;
- (SiriUIPresentationDataSource)dataSource;
- (SiriUIPresentationDelegate)delegate;
- (double)bugReportPresenterRequestsLastPresentationTime:(id)a3;
- (double)expectedContentWidth;
- (id)_activeConversation;
- (id)_analytics;
- (id)_conversationIdentifiers;
- (id)_dismissalContextWithDismissalReason:(int64_t)a3 dismissalOptions:(id)a4;
- (id)_identifierOfPreviousConversation;
- (id)bugReportPresenterRequestsBugReportKeywordIdentifiers:(id)a3;
- (id)bugReportPresenterRequestsBugReportPrefixForTitle:(id)a3;
- (id)bugReportPresenterRequestsPresentingView:(id)a3;
- (id)compactViewModelController:(id)a3 requestsTranscriptItemForAceObject:(id)a4;
- (id)dismissalUserInfo;
- (id)effectiveCoreLocationBundleForCompactViewController:(id)a3;
- (id)localeForCompactViewController:(id)a3;
- (id)viewController;
- (int)viewRegionForPresentedAceObject:(id)a3;
- (int64_t)_inputType;
- (int64_t)_viewModelInputTypeForRequestInputType:(int64_t)a3;
- (int64_t)inputTypeForCompactViewModelController:(id)a3;
- (unint64_t)lockStateForCompactViewController:(id)a3;
- (void)_activeConversationDidChange;
- (void)_dismissVideoPlayerViewController;
- (void)_setInputType:(int64_t)a3;
- (void)_setupBugReportingPresenterIfNecessary;
- (void)_showFullScreenDimmingLayer;
- (void)activeRequestOptionsDidChange;
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
- (void)compactViewController:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5;
- (void)compactViewController:(id)a3 preventOutsideTouchesFromDismissingSiri:(BOOL)a4;
- (void)compactViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4;
- (void)compactViewController:(id)a3 setStatusViewHidden:(BOOL)a4;
- (void)compactViewController:(id)a3 speakText:(id)a4 isPhonetic:(BOOL)a5 completion:(id)a6;
- (void)compactViewController:(id)a3 viewDidAppearForAceObject:(id)a4;
- (void)compactViewController:(id)a3 viewDidDisappearForAceObject:(id)a4;
- (void)compactViewController:(id)a3 willBeginEditingOfType:(int64_t)a4;
- (void)compactViewControllerCancelHIDEventDefferal:(id)a3;
- (void)compactViewControllerDidEndEditing:(id)a3;
- (void)compactViewControllerRequestsHIDEventDefferal:(id)a3;
- (void)compactViewModelController:(id)a3 didProcessConversationItemsWithIdentifiers:(id)a4;
- (void)configureForRequestOptions:(id)a3;
- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4;
- (void)dealloc;
- (void)didBeginProcessingConversationItems;
- (void)didOmitDialogFromPresenting;
- (void)didPresentContentForCompactViewController:(id)a3;
- (void)didPresentSystemUI;
- (void)didReceiveBugButtonLongPress;
- (void)didReceiveOrbViewTapToCancelRequest;
- (void)didReceiveReportBugAction;
- (void)didReceiveRevealRecognizedSpeechCommand:(id)a3;
- (void)endSiriSessionForViewController:(id)a3 withDismissalReason:(int64_t)a4;
- (void)handlePlayContentCommand:(id)a3 completion:(id)a4;
- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4;
- (void)immersiveExperienceRequestedForViewModelController:(id)a3;
- (void)modalContainerViewControllerViewDidDisappear:(id)a3;
- (void)modalContainerViewControllerViewWillDisappear:(id)a3;
- (void)playbackDidFailForVideoPlayerViewController:(id)a3;
- (void)playbackDidFinishForVideoPlayerViewController:(id)a3;
- (void)resetViewsAndClearASR:(BOOL)a3;
- (void)setActiveViewModelController:(id)a3;
- (void)setBottomContentInset:(double)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTopContentInset:(double)a3 animated:(BOOL)a4;
- (void)showFullScreenEffect:(id)a3;
- (void)siriCompactViewController:(id)a3 willDismissViewController:(id)a4;
- (void)siriCompactViewController:(id)a3 willPresentViewController:(id)a4;
- (void)siriDidActivateFromSource:(int64_t)a3;
- (void)siriDidDeactivateWithCompletion:(id)a3;
- (void)siriDidHidePasscodeUnlock;
- (void)siriDidStartNewConversationWithIdentifier:(id)a3;
- (void)siriDidStartSpeakingWithIdentifier:(id)a3;
- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4;
- (void)siriDidTapOutsideContent;
- (void)siriDidTransitionFromState:(int64_t)a3 event:(int64_t)a4;
- (void)siriDidUpdateASRWithRecognition:(id)a3;
- (void)siriIsIdleAndQuietStatusDidChange:(BOOL)a3 isAttending:(BOOL)a4;
- (void)siriRequestWillStartWithRequestOptions:(id)a3;
- (void)siriResponseModeDidChange:(unint64_t)a3;
- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4;
- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3;
- (void)speechRecordingDidBeginOnRecordRoute:(id)a3;
- (void)stopRecordingForViewController:(id)a3;
- (void)stopSpeakingForCompactViewController:(id)a3;
- (void)tapToEditPresented;
- (void)userDrilledIntoSnippet;
- (void)userTouchedSnippet;
- (void)viewController:(id)a3 didFinishEditingUtteranceWithText:(id)a4 originalUserUtterance:(id)a5 selectionResults:(id)a6;
- (void)viewController:(id)a3 openURL:(id)a4 completion:(id)a5;
- (void)viewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5;
- (void)viewController:(id)a3 reduceOrbOpacity:(BOOL)a4;
- (void)viewController:(id)a3 requestsHostBackgroundBlurVisible:(BOOL)a4 reason:(int64_t)a5 fence:(id)a6;
- (void)viewController:(id)a3 siriRequestEnteredWithText:(id)a4;
- (void)viewControllerDidPresentUserInterface:(id)a3;
- (void)viewControllerViewWillDisappear:(id)a3;
@end

@implementation SRCompactPresentation

- (SRCompactPresentation)initWithDelegate:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SRCompactPresentation;
  v8 = [(SRCompactPresentation *)&v19 init];
  v9 = v8;
  if (v8)
  {
    [(SRCompactPresentation *)v8 setDelegate:v6];
    [(SRCompactPresentation *)v9 setDataSource:v7];
    v9->_inputType = 0;
    v10 = objc_alloc_init(SRCompactViewController);
    compactViewController = v9->_compactViewController;
    v9->_compactViewController = v10;

    [(SRCompactViewController *)v9->_compactViewController setDelegate:v9];
    v12 = [(SRCompactPresentation *)v9 delegate];
    id v13 = [v12 siriDeviceLockStateForSiriPresentation:v9];

    v14 = [[SRCompactAutoDismissController alloc] initWithDelegate:v9 andLockState:v13];
    autoDismissController = v9->_autoDismissController;
    v9->_autoDismissController = v14;

    v16 = +[AFPreferences sharedPreferences];
    v17 = [v16 languageCode];
    +[SiriUISashItem _setLanguageCode:v17];

    [(SRCompactPresentation *)v9 _activeConversationDidChange];
  }

  return v9;
}

- (id)_conversationIdentifiers
{
  v3 = [(SRCompactPresentation *)self dataSource];
  v4 = [v3 conversationIdentifiersForSiriPresentation:self];

  return v4;
}

- (id)_identifierOfPreviousConversation
{
  v2 = [(SRCompactPresentation *)self _conversationIdentifiers];
  if ((unint64_t)[v2 count] < 2)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[SRCompactPresentation _identifierOfPreviousConversation]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #compact no previous conversation found", (uint8_t *)&v6, 0xCu);
    }
    v3 = 0;
  }
  else
  {
    v3 = [v2 objectAtIndexedSubscript:[v2 count] - 2];
  }

  return v3;
}

- (id)_activeConversation
{
  v3 = [(SRCompactPresentation *)self dataSource];
  v4 = [(SRCompactPresentation *)self _conversationIdentifiers];
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
      v11 = "-[SRCompactPresentation configureForRequestOptions:]";
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Don't check Siri availability for %@ activation", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (+[AFUISiriSession availabilityState])
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      v11 = "-[SRCompactPresentation configureForRequestOptions:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #networkAvailability Siri Not available. Dismissing Siri and posting notification", (uint8_t *)&v10, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained dismissSiriPresentation:self withReason:13];
  }
}

- (id)viewController
{
  return self->_compactViewController;
}

- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactPresentation *)self activeViewModelController];
  [v6 conversationDidChangeWithTransaction:v5];
}

- (void)didReceiveRevealRecognizedSpeechCommand:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    v14 = "-[SRCompactPresentation didReceiveRevealRecognizedSpeechCommand:]";
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: received revealRecognizedSpeech:%@", (uint8_t *)&v13, 0x16u);
  }
  id v6 = [v4 recognition];
  id v7 = [(SRCompactPresentation *)self dataSource];
  v8 = [v7 sessionInfoForSiriPresentation:self];

  v9 = [v4 refId];
  int v10 = [v8 identifier];
  v11 = [v6 af_userUtteranceValueWithRefId:v9 sessionId:v10];

  __int16 v12 = [(SRCompactPresentation *)self activeViewModelController];
  [v12 revealUserUtterance:v11 backingAceObject:v4];
}

- (void)dealloc
{
  [(SRCompactAutoDismissController *)self->_autoDismissController invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SRCompactPresentation;
  [(SRCompactPresentation *)&v3 dealloc];
}

- (void)activeRequestOptionsDidChange
{
  id v4 = [(SRCompactPresentation *)self _activeRequestOptions];
  if ([v4 isTypeToSiriRequest] && objc_msgSend(v4, "inputType") != (id)2) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(SRCompactViewController *)self->_compactViewController setActiveRequestOptions:v4];
  [(SRCompactPresentation *)self _setInputType:v3];
}

- (void)siriRequestWillStartWithRequestOptions:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    v9 = "-[SRCompactPresentation siriRequestWillStartWithRequestOptions:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v8, 0xCu);
  }
  *(_WORD *)&self->_isPresentingSystemUI = 0;
  responseMode = self->_responseMode;
  self->_responseMode = 0;

  delayDismissalMs = self->_delayDismissalMs;
  self->_delayDismissalMs = 0;

  self->_shouldMuteSiriFeedbackBanner = 0;
  self->_shouldPauseAutoDismissal = 0;
  if ([v4 requestSource] != (id)9) {
    self->_requestIsWiredMicOrBTHeadsetOrWx = [v4 isWiredMicOrBTHeadsetOrWx];
  }
  [(SRCompactViewController *)self->_compactViewController siriWillStartRequest];
}

- (void)siriResponseModeDidChange:(unint64_t)a3
{
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    BOOL requestIsWiredMicOrBTHeadsetOrWx = self->_requestIsWiredMicOrBTHeadsetOrWx;
    int v9 = 136315650;
    int v10 = "-[SRCompactPresentation siriResponseModeDidChange:]";
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
      int v9 = 136315138;
      int v10 = "-[SRCompactPresentation siriDidActivateFromSource:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact Loading previous conversation because we activated from a breadcrumb", (uint8_t *)&v9, 0xCu);
    }
    id v6 = [(SRCompactPresentation *)self dataSource];
    id v7 = [(SRCompactPresentation *)self _identifierOfPreviousConversation];
    [v6 siriPresentation:self activateConversationWithIdentifier:v7];

    [(SRCompactPresentation *)self _activeConversationDidChange];
    int v8 = [(SRCompactPresentation *)self delegate];
    [v8 siriPresentationDidPresentConversationFromBreadcrumb:self];
  }
  [(SRCompactViewController *)self->_compactViewController siriDidActivate];
  *(_WORD *)&self->_userCancelledRequestViaOrbViewTap = 0;
  self->_isPresentingSystemUI = 0;
  self->_initialRequestSource = a3;
}

- (void)siriDidStartNewConversationWithIdentifier:(id)a3
{
  id v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [a3 UUIDString];
    int v8 = 136315394;
    int v9 = "-[SRCompactPresentation siriDidStartNewConversationWithIdentifier:]";
    __int16 v10 = 2112;
    __int16 v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #compact Starting a new conversation %@", (uint8_t *)&v8, 0x16u);
  }
  [(SRCompactPresentation *)self _activeConversationDidChange];
}

- (void)speechRecordingDidBeginOnRecordRoute:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SRCompactPresentation speechRecordingDidBeginOnRecordRoute:]";
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
    __int16 v13 = "-[SRCompactPresentation shouldResumeInterruptedAudioPlaybackForAttendingState:]";
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

- (void)handlePlayContentCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  __int16 v8 = [[SRPlayContentViewController alloc] initWithPlayContent:v6];
  id v9 = [(SRPlayContentViewController *)v8 player];

  if (v9)
  {
    [(SRPlayContentViewController *)v8 setVideoPlayerControllerDelegate:self];
    BOOL v10 = [(SRCompactPresentation *)self delegate];
    [v10 siriPresentation:self setStatusBarHidden:1 animated:1];

    __int16 v11 = [(SRCompactPresentation *)self delegate];
    [v11 siriPresentation:self setStatusViewHidden:1];

    id v12 = [objc_alloc((Class)SiriUIModalContainerViewController) initWithContentViewController:v8];
    [v12 setDelegate:self];
    __int16 v13 = [(SRCompactPresentation *)self delegate];
    [v13 siriPresentation:self willPresentViewController:v12];

    objc_initWeak(&location, self);
    compactViewController = self->_compactViewController;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100030A48;
    v20[3] = &unk_100143250;
    objc_copyWeak(&v22, &location);
    id v15 = v12;
    id v21 = v15;
    [(SRCompactViewController *)compactViewController presentViewController:v15 animated:1 completion:v20];
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

  return [(SRCompactPresentation *)self alwaysShowRecognizedSpeech];
}

- (int)viewRegionForPresentedAceObject:(id)a3
{
  return [(SRCompactViewController *)self->_compactViewController viewRegionForPresentedAceObject:a3];
}

- (void)siriDidDeactivateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SRCompactViewController *)self->_compactViewController presentedViewController];

  if (v5) {
    [(SRCompactViewController *)self->_compactViewController dismissViewControllerAnimated:1 completion:0];
  }
  [(SRCompactViewController *)self->_compactViewController siriDidDeactivate];
  if (AFIsInternalInstall() && !self->_shouldMuteSiriFeedbackBanner) {
    +[SRSiriDebugManager invokeSiriDebugFeedbackBannerFor:self->_initialRequestSource completionHandler:0];
  }
  id v6 = objc_alloc_init(SRDismissalClassificationController);
  id v7 = [(SRCompactPresentation *)self _dismissalContextWithDismissalReason:self->_lastDismissalReason dismissalOptions:self->_lastDismissalOptions];
  BOOL v8 = [(SRDismissalClassificationController *)v6 classifyRequestAsUnintendedWithContext:v7];
  [v7 setClassifiedAsUnintended:v8];
  [(SRDismissalClassificationController *)v6 recordDismissalEventWithContext:v7 markAsUnintended:v8];
  int64_t inputType = self->_inputType;
  int64_t initialRequestSource = self->_initialRequestSource;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100030CB4;
  v14[3] = &unk_1001436B8;
  id v15 = v6;
  id v16 = v7;
  BOOL v19 = v8;
  id v17 = v4;
  int64_t v18 = inputType;
  id v11 = v4;
  id v12 = v7;
  __int16 v13 = v6;
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
  self->_hasOmittedDialogFromPresenting = 1;
}

- (void)resetViewsAndClearASR:(BOOL)a3
{
}

- (void)didPresentSystemUI
{
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[SRCompactPresentation didPresentSystemUI]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Setting didPresentSystemUI to true", (uint8_t *)&v4, 0xCu);
  }
  self->_isPresentingSystemUI = 1;
}

- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3
{
  return [(SRCompactViewController *)self->_compactViewController didReceiveUpdateVisualResponseCommand:a3];
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
      id v17 = "-[SRCompactPresentation siriDidTransitionFromState:event:]";
      __int16 v18 = 1024;
      BOOL v19 = hasPendingAutoDismissal;
      __int16 v20 = 1024;
      BOOL v21 = recordingFromWxDevice;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #compact Speech was mitigated as side speech, _hasPendingAutoDismissal: %d, _recordingFromWxDevice: %d", (uint8_t *)&v16, 0x18u);
    }
    if (self->_hasPendingAutoDismissal)
    {
      BOOL v10 = [(SRCompactPresentation *)self delegate];
      id v11 = v10;
      id v12 = self;
      uint64_t v13 = 4;
    }
    else
    {
      BOOL v6 = self->_recordingFromWxDevice;
      if (!v6) {
        goto LABEL_17;
      }
      BOOL v10 = [(SRCompactPresentation *)self delegate];
      id v11 = v10;
      id v12 = self;
      uint64_t v13 = 58;
    }
    [v10 dismissSiriPresentation:v12 withReason:v13];

    goto LABEL_16;
  }
  if (a4 == 12)
  {
    __int16 v14 = AFSiriLogContextConnection;
    BOOL v15 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    BOOL v6 = 0;
    if (!v15) {
      goto LABEL_17;
    }
    int v16 = 136315138;
    id v17 = "-[SRCompactPresentation siriDidTransitionFromState:event:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #compact Speech was determined as directed at siri stop pausing auto dismissal", (uint8_t *)&v16, 0xCu);
LABEL_16:
    BOOL v6 = 0;
    goto LABEL_17;
  }
  if (a4 != 11) {
    return;
  }
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    id v17 = "-[SRCompactPresentation siriDidTransitionFromState:event:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact Speech start detected, pausing auto dismissal", (uint8_t *)&v16, 0xCu);
  }
  BOOL v6 = 1;
LABEL_17:
  self->_shouldPauseAutoDismissal = v6;
}

- (void)_activeConversationDidChange
{
  id v4 = [(SRCompactPresentation *)self _activeConversation];
  id v3 = [objc_alloc((Class)SiriSharedUICompactViewModelController) initWithConversation:v4 delegate:self];
  [(SRCompactPresentation *)self setActiveViewModelController:v3];
}

- (void)setActiveViewModelController:(id)a3
{
  id v4 = (SiriSharedUICompactViewModelController *)a3;
  [(SiriSharedUICompactViewModelController *)self->_activeViewModelController setDelegate:0];
  activeViewModelController = self->_activeViewModelController;
  self->_activeViewModelController = v4;
  BOOL v6 = v4;

  [(SiriSharedUICompactViewModelController *)self->_activeViewModelController setViewModelChangeObserver:self->_compactViewController];
}

- (int64_t)inputTypeForCompactViewModelController:(id)a3
{
  int64_t v4 = [(SRCompactPresentation *)self _inputType];

  return [(SRCompactPresentation *)self _viewModelInputTypeForRequestInputType:v4];
}

- (void)compactViewModelController:(id)a3 didProcessConversationItemsWithIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self didPresentConversationItemsWithIdentifiers:v5];
}

- (BOOL)siriDeviceLockedForViewModelController:(id)a3
{
  int64_t v4 = [(SRCompactPresentation *)self delegate];
  unint64_t v5 = ((unint64_t)[v4 siriDeviceLockStateForSiriPresentation:self] >> 1) & 1;

  return v5;
}

- (id)compactViewModelController:(id)a3 requestsTranscriptItemForAceObject:(id)a4
{
  id v4 = a4;
  unint64_t v5 = +[SRLocalSnippetManager transcriptItemForObject:v4];
  if (!v5)
  {
    id v6 = +[SiriUISnippetManager sharedInstance];
    unint64_t v5 = [v6 transcriptItemForObject:v4 sizeClass:1];
  }

  return v5;
}

- (void)immersiveExperienceRequestedForViewModelController:(id)a3
{
  id v4 = [(SRCompactPresentation *)self delegate];
  [v4 siriPresentation:self requestHostBlurVisible:1 reason:3 fence:0];
}

- (void)handleRequestEndBehavior:(id)a3 isAttending:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315394;
    id v17 = "-[SRCompactPresentation handleRequestEndBehavior:isAttending:]";
    __int16 v18 = 1024;
    LODWORD(v19) = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s handling request end behavior in presentation: isAttending: %d", (uint8_t *)&v16, 0x12u);
  }
  if (v4)
  {
    if ([v6 premptivelyResumeMedia])
    {
      BOOL v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315138;
        id v17 = "-[SRCompactPresentation handleRequestEndBehavior:isAttending:]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Presentation will resume media on idle", (uint8_t *)&v16, 0xCu);
      }
      self->_shouldResumeMediaOnIdle = 1;
    }
    id v9 = [v6 minimumAutoDismissalTimeInMs];

    if (v9)
    {
      BOOL v10 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v10;
        id v12 = [v6 minimumAutoDismissalTimeInMs];
        id v13 = [v12 longValue];
        int v16 = 136315394;
        id v17 = "-[SRCompactPresentation handleRequestEndBehavior:isAttending:]";
        __int16 v18 = 2048;
        id v19 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Setting delay dismissal for compact presentation by %ld milliseconds.", (uint8_t *)&v16, 0x16u);
      }
      __int16 v14 = [v6 minimumAutoDismissalTimeInMs];
      delayDismissalMs = self->_delayDismissalMs;
      self->_delayDismissalMs = v14;
    }
  }
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(SRCompactViewController *)self->_compactViewController view];
  id v7 = [v6 window];
  BOOL v8 = [v7 screen];

  id v9 = [v8 coordinateSpace];
  [v6 convertPoint:v9 fromCoordinateSpace:x, y];
  unsigned int v10 = -[SRCompactViewController hasContentAtPoint:](self->_compactViewController, "hasContentAtPoint:");
  bugReportingPresenter = self->_bugReportingPresenter;
  if (bugReportingPresenter) {
    v10 |= -[AFUIBugReportPresenting hasContentAtPoint:](bugReportingPresenter, "hasContentAtPoint:", x, y);
  }

  return v10;
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
  id v7 = [(SRCompactPresentation *)self delegate];
  id v8 = [v7 siriDeviceLockStateForSiriPresentation:self];

  if (a3 == 13)
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
  id v7 = [(SRCompactPresentation *)self delegate];
  id v8 = [v7 siriDeviceLockStateForSiriPresentation:self];

  uint64_t v9 = [(SRCompactPresentation *)self dataSource];
  id v10 = [v9 siriStateForSiriPresentation:self];

  if (self->_hasPresentedContent || self->_hasOmittedDialogFromPresenting) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 2 * self->_isPresentingSystemUI;
  }
  id v12 = [SRDismissalClassificationContext alloc];
  id v13 = [v6 reason];

  __int16 v14 = [(SRDismissalClassificationContext *)v12 initWithCancellationReason:v13 contentPresentationState:v11 dismissalReason:a3 isDeviceUnlocked:v8 == 0 siriState:v10 requestSource:self->_initialRequestSource];

  return v14;
}

- (double)expectedContentWidth
{
  id v3 = [(SRCompactPresentation *)self delegate];
  [v3 contentWidthForForSiriPresentation:self];
  double v5 = v4;

  return v5;
}

- (void)tapToEditPresented
{
  id v3 = [(SRCompactPresentation *)self delegate];
  [v3 tapToEditPresented:self];
}

- (CGSize)maxSizeForSnippet
{
  [(SRCompactViewController *)self->_compactViewController maxSizeForSnippet];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)effectiveContentFrame
{
  double v2 = [(SRCompactViewController *)self->_compactViewController view];
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
  id v9 = [(SRCompactPresentation *)self delegate];
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
          double v14 = [(SRCompactPresentation *)self delegate];
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472;
          v36[2] = sub_100032078;
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
    block[2] = sub_100032090;
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
          v23 = [(SRCompactPresentation *)self delegate];
          [v23 siriPresentation:self performAceCommand:v22 conversationItemIdentifier:0 turnIdentifier:v17 completion:0];
        }
        id v19 = [v18 countByEnumeratingWithState:&v29 objects:v45 count:16];
      }
      while (v19);
    }
  }
}

- (void)compactViewController:(id)a3 speakText:(id)a4 isPhonetic:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v9 = a6;
  id v10 = a4;
  uint64_t v11 = [(SRCompactPresentation *)self delegate];
  id v12 = v11;
  if (v6) {
    [v11 siriPresentation:self synthesizeSpeechWithPhoneticText:v10 completion:v9];
  }
  else {
    [v11 siriPresentation:self synthesizeSpeechWithText:v10 completion:v9];
  }
}

- (void)stopSpeakingForCompactViewController:(id)a3
{
  id v4 = [(SRCompactPresentation *)self delegate];
  [v4 stopSpeakingForSiriPresentation:self];
}

- (unint64_t)lockStateForCompactViewController:(id)a3
{
  id v4 = [(SRCompactPresentation *)self delegate];
  id v5 = [v4 siriDeviceLockStateForSiriPresentation:self];

  return (unint64_t)v5;
}

- (id)localeForCompactViewController:(id)a3
{
  id v4 = [(SRCompactPresentation *)self delegate];
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
  id v2 = [(SRCompactPresentation *)self delegate];
  [v2 userTouchedSnippet];
}

- (void)compactViewController:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5
{
  id v11 = a4;
  id v7 = a5;
  id v8 = [(SRCompactPresentation *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(SRCompactPresentation *)self delegate];
    [v10 siriPresentation:self handleStartLocalRequest:v11 turnIdentifier:v7];
  }
}

- (void)compactViewController:(id)a3 setStatusViewHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self setStatusViewHidden:v4];
}

- (void)viewControllerViewWillDisappear:(id)a3
{
}

- (void)viewController:(id)a3 requestsHostBackgroundBlurVisible:(BOOL)a4 reason:(int64_t)a5 fence:(id)a6
{
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = [(SRCompactPresentation *)self delegate];
  [v10 siriPresentation:self requestHostBlurVisible:v7 reason:a5 fence:v9];
}

- (void)viewController:(id)a3 reduceOrbOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self reduceOrbOpacity:v4];
}

- (void)endSiriSessionForViewController:(id)a3 withDismissalReason:(int64_t)a4
{
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 dismissSiriPresentation:self withReason:a4];
}

- (void)stopRecordingForViewController:(id)a3
{
  id v4 = [(SRCompactPresentation *)self delegate];
  [v4 stopRecordingSpeechForSiriPresentation:self];
}

- (void)cancelRequestForViewController:(id)a3
{
  id v4 = [(SRCompactPresentation *)self delegate];
  [v4 cancelRequestForSiriPresentation:self];
}

- (void)didPresentContentForCompactViewController:(id)a3
{
  self->_hasPresentedContent = 1;
  id v4 = [(SRCompactPresentation *)self delegate];
  id v5 = [v4 siriDeviceLockStateForSiriPresentation:self];

  if ([(SRCompactViewController *)self->_compactViewController isInAmbient])
  {
LABEL_2:
    [(SRCompactPresentation *)self _showFullScreenDimmingLayer];
    return;
  }
  if (!v5)
  {
    uint64_t IsPad = SiriUIDeviceIsPad();
    unsigned __int8 v7 = +[AFSystemAssistantExperienceStatusManager isSAEEnabled];
    if (IsPad & 1) != 0 || (v7) {
      return;
    }
    goto LABEL_2;
  }
  id v8 = [(SRCompactPresentation *)self delegate];
  [v8 siriPresentation:self requestHostBlurVisible:1 reason:2 fence:0];
}

- (id)effectiveCoreLocationBundleForCompactViewController:(id)a3
{
  id v4 = [(SRCompactPresentation *)self delegate];
  id v5 = [v4 effectiveCoreLocationBundleForSiriPresentation:self];

  return v5;
}

- (void)siriCompactViewController:(id)a3 willPresentViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self willPresentViewController:v5];
}

- (void)didBeginProcessingConversationItems
{
  id v2 = [(SRCompactPresentation *)self delegate];
  [v2 didBeginProcessingConversationItems];
}

- (void)siriCompactViewController:(id)a3 willDismissViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self willDismissViewController:v5];
}

- (void)compactViewController:(id)a3 viewDidAppearForAceObject:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self viewDidAppearWithAceObject:v5];
}

- (void)compactViewController:(id)a3 viewDidDisappearForAceObject:(id)a4
{
  id v5 = a4;
  id v8 = [(SRCompactPresentation *)self delegate];
  id v6 = [v5 encodedClassName];
  unsigned __int8 v7 = [v5 aceId];

  [v8 siriPresentation:self viewDidDisappearWithClassDescriptor:v6 identifier:v7];
}

- (void)userDrilledIntoSnippet
{
  id v2 = [(SRCompactPresentation *)self delegate];
  [v2 userDrilledIntoSnippet];
}

- (id)_analytics
{
  return +[AFAnalytics sharedAnalytics];
}

- (void)didReceiveBugButtonLongPress
{
  self->_shouldMuteSiriFeedbackBanner = 1;
  [(SRCompactPresentation *)self _setupBugReportingPresenterIfNecessary];
  bugReportingPresenter = self->_bugReportingPresenter;

  [(AFUIBugReportPresenting *)bugReportingPresenter didReceiveBugButtonLongPress];
}

- (void)didReceiveReportBugAction
{
  self->_shouldMuteSiriFeedbackBanner = 1;
  [(SRCompactPresentation *)self _setupBugReportingPresenterIfNecessary];
  bugReportingPresenter = self->_bugReportingPresenter;

  [(AFUIBugReportPresenting *)bugReportingPresenter didReceiveReportBugAction];
}

- (void)_setupBugReportingPresenterIfNecessary
{
  if (!self->_bugReportingPresenter)
  {
    AFUICreateBugReportPresentingWithDelegate();
    double v3 = (AFUIBugReportPresenting *)objc_claimAutoreleasedReturnValue();
    bugReportingPresenter = self->_bugReportingPresenter;
    self->_bugReportingPresenter = v3;
    _objc_release_x1(v3, bugReportingPresenter);
  }
}

- (void)bugReportPresenter:(id)a3 requestsToHandlePasscodeUnlockWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 handlePasscodeUnlockForSiriPresentation:self withCompletion:v5];
}

- (void)bugReportPresenter:(id)a3 requestsToOpenURL:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SRCompactPresentation *)self delegate];
  [v9 siriPresentation:self openURL:v8 conversationId:0 completion:v7];
}

- (void)bugReportPresenter:(id)a3 requestsToPerformAceCommand:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self performAceCommand:v5 conversationItemIdentifier:0 completion:0];
}

- (void)bugReportPresenter:(id)a3 requestsToPresentViewController:(id)a4
{
}

- (void)bugReportPresenter:(id)a3 requestsToTakeScreenshotWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 getScreenshotImageForSiriPresentation:self withCompletion:v5];
}

- (void)bugReportPresenter:(id)a3 setBugReportingAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self setBugReportingAvailable:v4];
}

- (id)bugReportPresenterRequestsBugReportKeywordIdentifiers:(id)a3
{
  CFStringRef v5 = @"1229562";
  double v3 = +[NSArray arrayWithObjects:&v5 count:1];

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
  [(SRCompactViewController *)self->_compactViewController lastPresentationTime];
  return result;
}

- (id)bugReportPresenterRequestsPresentingView:(id)a3
{
  return [(SRCompactViewController *)self->_compactViewController view];
}

- (void)bugReportPresenter:(id)a3 setStatusViewHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self setStatusViewHidden:v4];
}

- (void)bugReportPresenterRequestsInvalidateAutoDismissal:(id)a3
{
  [(SRCompactAutoDismissController *)self->_autoDismissController invalidate];
  id v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    CFStringRef v5 = "-[SRCompactPresentation bugReportPresenterRequestsInvalidateAutoDismissal:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #autodismiss Siri TTR invalidated Auto Dismissal to keep Siri TTR modal up.", (uint8_t *)&v4, 0xCu);
  }
}

- (void)bugReportPresenterRequestsSiriSessionToFinishCurrentRequest:(id)a3
{
  id v3 = [(SRCompactPresentation *)self delegate];
  [v3 siriSessionWillCancelRequest];

  int v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SRCompactPresentation bugReportPresenterRequestsSiriSessionToFinishCurrentRequest:]";
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
    id v9 = "-[SRCompactPresentation bugReportPresenter:requestsSiriDismissalWithReason:]";
    __int16 v10 = 2048;
    int64_t v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #SiriTTR: Dismissing Siri with SASDismissalReason: %ld", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(SRCompactPresentation *)self delegate];
  [v7 dismissSiriPresentation:self withReason:a4];
}

- (void)compactViewController:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self requestsKeyboardWithCompletion:v5];
}

- (void)compactViewController:(id)a3 willBeginEditingOfType:(int64_t)a4
{
  BOOL v5 = a4 == 1;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self willBeginEditingOfType:v5];
}

- (void)compactViewControllerDidEndEditing:(id)a3
{
  id v4 = [(SRCompactPresentation *)self delegate];
  [v4 siriPresentationDidResignFirstResponder:self];
}

- (void)viewController:(id)a3 siriRequestEnteredWithText:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self startRequestForText:v5];
}

- (void)viewController:(id)a3 didFinishEditingUtteranceWithText:(id)a4 originalUserUtterance:(id)a5 selectionResults:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (+[SiriUIUtilities string:v9 isSameAsUserUtterance:v10])
  {
    id v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      uint64_t v22 = "-[SRCompactPresentation viewController:didFinishEditingUtteranceWithText:originalUserUtterance:selectionResults:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #compact: edited text was same as original, not creating new UserUtterance", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    uint64_t v13 = [(SRCompactPresentation *)self delegate];
    double v14 = [v10 correctionIdentifier];
    [v13 siriPresentation:self startEditedRequestWithText:v9 correctionIdentifier:v14 userSelectionResults:v11];

    BOOL v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      uint64_t v22 = "-[SRCompactPresentation viewController:didFinishEditingUtteranceWithText:originalUserUtterance:selectionResults:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s #compact: creating new UserUtterance from edited text", (uint8_t *)&v21, 0xCu);
    }
    id v16 = objc_alloc((Class)AFUserUtterance);
    id v17 = [v10 correctionIdentifier];
    id v18 = [v16 initWithString:v9 correctionIdentifier:v17];

    id v19 = [(SRCompactPresentation *)self activeViewModelController];
    [v19 revealUserUtterance:v18 backingAceObject:0];
  }
  uint64_t v20 = [(SRCompactPresentation *)self delegate];
  [v20 siriPresentationDidEndEditing:self];
}

- (void)compactViewControllerRequestsHIDEventDefferal:(id)a3
{
  id v4 = [(SRCompactPresentation *)self delegate];
  [v4 siriPresentationRequestsHIDEventDefferal:self];
}

- (void)compactViewControllerCancelHIDEventDefferal:(id)a3
{
  id v4 = [(SRCompactPresentation *)self delegate];
  [v4 siriPresentationCancelHIDEventDefferal:self];
}

- (void)compactViewController:(id)a3 preventOutsideTouchesFromDismissingSiri:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRCompactPresentation *)self delegate];
  [v6 siriPresentation:self preventOutsideTouchesFromDismissingSiri:v4];
}

- (SASRequestOptions)_activeRequestOptions
{
  id v3 = [(SRCompactPresentation *)self delegate];
  BOOL v4 = [v3 activeRequestOptionsForSiriPresentation:self];

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
    *(_DWORD *)int v21 = 136316162;
    *(void *)&v21[4] = "-[SRCompactPresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
    *(_WORD *)&v21[12] = 1024;
    *(_DWORD *)&v21[14] = v5;
    *(_WORD *)&v21[18] = 1024;
    *(_DWORD *)&v21[20] = v4;
    __int16 v22 = 2112;
    v23 = responseMode;
    __int16 v24 = 1024;
    BOOL v25 = requestIsWiredMicOrBTHeadsetOrWx;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #compact siriIsIdleAndQuiet: %d, isAttending: %d, responseMode: %@, requestIsWiredMicOrBTHeadsetOrWx: %d", v21, 0x28u);
  }
  [(SRCompactAutoDismissController *)self->_autoDismissController stopAutoDismissalAttentionController];
  if (!v5) {
    return;
  }
  [(SRCompactViewController *)self->_compactViewController siriIsIdleAndQuiet];
  if (v4)
  {
    id v10 = self->_responseMode;
    id v11 = MDModeGetName();
    if ([(NSString *)v10 isEqualToString:v11])
    {
    }
    else
    {
      BOOL v12 = self->_requestIsWiredMicOrBTHeadsetOrWx;

      if (!v12) {
        goto LABEL_13;
      }
    }
    delayDismissalMs = self->_delayDismissalMs;
    if (delayDismissalMs)
    {
      double v14 = (double)[(NSNumber *)delayDismissalMs longValue] / 1000.0;
      BOOL v15 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v21 = 136315394;
        *(void *)&v21[4] = "-[SRCompactPresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
        *(_WORD *)&v21[12] = 2048;
        *(double *)&v21[14] = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s #compact, setting minimum dismissal time to %lf s for VoiceOnly/Headphones", v21, 0x16u);
      }
    }
    else
    {
      double v14 = 0.0;
    }
    [(SRCompactAutoDismissController *)self->_autoDismissController updateMinimumIdleTimeInterval:v14];
  }
LABEL_13:
  [(SRCompactAutoDismissController *)self->_autoDismissController startAutoDismissalAttentionController];
  if (!self->_hasPresentedContent && !self->_hasOmittedDialogFromPresenting && !self->_isPresentingSystemUI)
  {
    BOOL userCancelledRequestViaOrbViewTap = self->_userCancelledRequestViaOrbViewTap;
    id v17 = AFSiriLogContextConnection;
    BOOL v18 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (userCancelledRequestViaOrbViewTap)
    {
      double v19 = 3.0;
      if (v18)
      {
        *(_DWORD *)int v21 = 136315394;
        *(void *)&v21[4] = "-[SRCompactPresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
        *(_WORD *)&v21[12] = 2048;
        *(void *)&v21[14] = 0x4008000000000000;
        uint64_t v20 = "%s #autodismiss Siri is idle and hasn't presented content to the user. Scheduling autodismissal in %.0f se"
              "conds because orbView was tapped";
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v20, v21, 0x16u);
      }
    }
    else
    {
      double v19 = 0.300000012;
      if (v18)
      {
        *(_DWORD *)int v21 = 136315394;
        *(void *)&v21[4] = "-[SRCompactPresentation siriIsIdleAndQuietStatusDidChange:isAttending:]";
        *(_WORD *)&v21[12] = 2048;
        *(void *)&v21[14] = 0x3FD3333340000000;
        uint64_t v20 = "%s #autodismiss Siri is idle and hasn't presented content to the user. Scheduling autodismissal in %.0f seconds";
        goto LABEL_21;
      }
    }
    -[SRCompactAutoDismissController scheduleAutoDismissalForLongIdling:](self->_autoDismissController, "scheduleAutoDismissalForLongIdling:", v19, *(_OWORD *)v21, *(void *)&v21[16]);
  }
}

- (void)didReceiveOrbViewTapToCancelRequest
{
  self->_BOOL userCancelledRequestViaOrbViewTap = 1;
}

- (BOOL)shouldUseEventDrivenIdleAndQuietUpdates
{
  return 1;
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

- (void)_showFullScreenDimmingLayer
{
  id v3 = [(SRCompactPresentation *)self delegate];
  [v3 siriPresentation:self setFullScreenDimmingLayerVisible:1 animated:1];
}

- (void)_setInputType:(int64_t)a3
{
  self->_int64_t inputType = a3;
  if (a3 == 1) {
    [(SRCompactPresentation *)self _showFullScreenDimmingLayer];
  }
  id v4 = [(SRCompactPresentation *)self activeViewModelController];
  [v4 inputTypeDidChange];
}

- (void)autoDismissControllerRequestsDismissal:(id)a3
{
  id v4 = a3;
  if (self->_shouldPauseAutoDismissal)
  {
    BOOL v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      int v8 = "-[SRCompactPresentation autoDismissControllerRequestsDismissal:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact holding onto autodismissal event waiting for mitigation result", (uint8_t *)&v7, 0xCu);
    }
    self->_BOOL hasPendingAutoDismissal = 1;
  }
  else
  {
    id v6 = [(SRCompactPresentation *)self delegate];
    [v6 dismissSiriPresentation:self withReason:4];
  }
}

- (void)autoDismissControllerRequestsStopAttending:(id)a3
{
  id v4 = [(SRCompactPresentation *)self delegate];
  [v4 siriWillStopAttending:self];
}

- (void)modalContainerViewControllerViewWillDisappear:(id)a3
{
  id v4 = a3;
  id v5 = [(SRCompactPresentation *)self delegate];
  [v5 siriPresentation:self willDismissViewController:v4];
}

- (void)modalContainerViewControllerViewDidDisappear:(id)a3
{
  id v4 = a3;
  id v5 = [(SRCompactPresentation *)self delegate];
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
  [(SRCompactViewController *)self->_compactViewController dismissViewControllerAnimated:1 completion:0];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100033BE4;
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

- (BOOL)alwaysShowRecognizedSpeech
{
  id v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 alwaysShowRecognizedSpeech];

  return v3;
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

- (SiriSharedUICompactViewModelController)activeViewModelController
{
  return self->_activeViewModelController;
}

- (int64_t)_inputType
{
  return self->_inputType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeViewModelController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_delayDismissalMs, 0);
  objc_storeStrong((id *)&self->_lastDismissalOptions, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_autoDismissController, 0);
  objc_storeStrong((id *)&self->_bugReportingPresenter, 0);

  objc_storeStrong((id *)&self->_compactViewController, 0);
}

@end