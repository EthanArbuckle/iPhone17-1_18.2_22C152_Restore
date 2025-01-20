@interface SRSiriViewController
+ (double)_contentWidthForWidth:(double)result isPhone:(BOOL)a4 isZoomed:(BOOL)a5 isLargeFormatPad:(BOOL)a6;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (id)_speechIdentifierForConversationItem:(id)a3;
- ($5902F3589ABA92D8028CA1BE72F4BD0A)keyboardInfoForSiriPresentation:(SEL)a3;
- (AFConversationStore)_conversationStore;
- (AFManagedStorageConnection)_domainObjectStorageConnection;
- (AFUIAudioPlayer)_audioMessagePlayer;
- (AFUIAudioPlayer)_voicemailPlayer;
- (AFUISiriLanguage)_language;
- (AFUISiriSession)_session;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isAcousticIdAllowed;
- (BOOL)_isAudioPlayerPlaying;
- (BOOL)_isIdleTimerEnabled;
- (BOOL)_isKeyboardLoweredAfterResponse;
- (BOOL)_isReadingBulletinContentInCarPlayOutsideOfSiriSession;
- (BOOL)_isRequestActive;
- (BOOL)_isSiriIdleAndQuiet;
- (BOOL)_isSpeechSynthesisSpeaking;
- (BOOL)_isStartRequestAceCommandSent;
- (BOOL)_isUserUtteranceTapToEditInProgress;
- (BOOL)_isWaitingForStartRequest;
- (BOOL)_languageMatchesConversation:(id)a3;
- (BOOL)_listenAfterSpeakingForRepeatable;
- (BOOL)_listenAfterSpeakingForRequestFinished;
- (BOOL)_presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:(id)a3;
- (BOOL)_presentationSupportsConversationDidChangeWithTransaction:(id)a3;
- (BOOL)_reflectionDialogHasBeenPlayed;
- (BOOL)_resumesInterruptedAudioPlaybackForAttendingState:(BOOL)a3;
- (BOOL)_shouldLowerKeyboardForAddViewsCommand:(id)a3;
- (BOOL)_shouldShowDownloadAssetsNotificationPrompt;
- (BOOL)_siriIsShowingPasscodeUnlock;
- (BOOL)_suppressTTSForErrorsAndInterstitials;
- (BOOL)_usesEventDrivenIdleAndQuietUpdates;
- (BOOL)inTextInputModeForSiriPresentation:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAutorotate;
- (BOOL)siriPresentation:(id)a3 itemAtIndexPathIsVirgin:(id)a4;
- (BOOL)siriPresentationIsPresentingSystemUI:(id)a3;
- (BOOL)siriPresentationShouldDelaySuggestions:(id)a3;
- (BOOL)siriSessionShouldRequestUpdateForViewWithIdentifier:(id)a3;
- (BOOL)textInputEnabled;
- (CGRect)_statusBarFrame;
- (CGRect)_systemContentFrame;
- (CGRect)frameForApplication:(id)a3;
- (CGRect)statusBarFrameForSiriPresentation:(id)a3;
- (NSMutableArray)_conversations;
- (NSMutableArray)_repeatablePhrases;
- (NSMutableSet)_completedCommandAppPunchOutIds;
- (NSString)_currentAVRecordRoute;
- (NSString)_utteranceToSpeakAfterClearScreenCommand;
- (NSTimer)_idleTimer;
- (SASRequestOptions)_requestOptions;
- (SAUISayIt)previousSayItCommand;
- (SRPreferences)_preferences;
- (SRSiriViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SRUIFAceCommandRecords)_aceCommandRecords;
- (SiriUIPresentation)presentation;
- (UIView)inputAccessoryView;
- (_TtC4Siri36SRAssetsDownloadBannerViewController)_bannerViewController;
- (double)_bottomContentInset;
- (double)_statusViewHeight;
- (double)contentWidthForForSiriPresentation:(id)a3;
- (double)statusViewHeightForSiriPresentation:(id)a3;
- (id)_aceCommandWithIdentifier:(id)a3;
- (id)_activeConversation;
- (id)_activeConversationItemAtIndexPath:(id)a3;
- (id)_analytics;
- (id)_configuredSpeakableUtteranceParserForCommand:(id)a3 context:(id)a4 speakableText:(id)a5 subCompletion:(id)a6 speakPreparation:(id *)a7 speakCompletion:(id *)a8;
- (id)_conversationWithIdentifier:(id)a3;
- (id)_delayedConversationItemRevisionIdentifiers;
- (id)_dialogPhaseForItemAtIndexPath:(id)a3;
- (id)_host;
- (id)_hostWithErrorHandler:(id)a3;
- (id)_instrumentationManager;
- (id)_metricsContextForItemWithAceCommandId:(id)a3;
- (id)_pendingPreSynthesisTasks;
- (id)_presentationViewController;
- (id)_presentedConversationItemRevisionIdentifiers;
- (id)_previousConversation;
- (id)_punchoutMetricsAceCommandIdForItemWithIdentifier:(id)a3;
- (id)_searchAddViewsForSpokenHintsView:(id)a3;
- (id)_startNewConversation;
- (id)_uiPresentationIdentifier;
- (id)activeRequestOptionsForSiriPresentation:(id)a3;
- (id)audioPlayer:(id)a3 audioURLForCommand:(id)a4;
- (id)conversationIdentifiersForSiriPresentation:(id)a3;
- (id)domainObjectForIdentifier:(id)a3;
- (id)effectiveCoreLocationBundleForSiriPresentation:(id)a3;
- (id)localeForSiriPresentation:(id)a3;
- (id)preferredFocusEnvironments;
- (id)removeAlternativeFeatureViews:(id)a3;
- (id)sessionInfoForSiriPresentation:(id)a3;
- (id)siriPresentation:(id)a3 aceCommandIdentifierForItemAtIndexPath:(id)a4;
- (id)siriPresentation:(id)a3 aceObjectForItemAtIndexPath:(id)a4;
- (id)siriPresentation:(id)a3 additionalSpeechInterpretationsForRefId:(id)a4;
- (id)siriPresentation:(id)a3 conversationWithIdentifier:(id)a4;
- (id)siriPresentation:(id)a3 dialogPhaseForItemAtIndexPath:(id)a4;
- (id)siriPresentation:(id)a3 domainObjectForIdentifier:(id)a4;
- (id)siriPresentation:(id)a3 identifierOfItemAtIndexPath:(id)a4;
- (id)siriPresentation:(id)a3 indexPathForItemWithIdentifier:(id)a4;
- (id)siriPresentation:(id)a3 updatedUserUtteranceForRefId:(id)a4;
- (int)_instrumentationPresentationForPresentationOptions:(int64_t)a3;
- (int)_instrumentationResponseModeForMode:(unint64_t)a3;
- (int)_mapSiriTransitionState:(int64_t)a3;
- (int64_t)_presentationOptions;
- (int64_t)_siriState;
- (int64_t)_viewModeFromPresentationOptions:(int64_t)a3;
- (int64_t)siriPresentation:(id)a3 numberOfChildrenForItemAtIndexPath:(id)a4;
- (int64_t)siriPresentation:(id)a3 presentationStateForItemAtIndexPath:(id)a4;
- (int64_t)siriPresentation:(id)a3 typeOfItemAtIndexPath:(id)a4;
- (int64_t)siriPresentationStateForSiriPresentation:(id)a3;
- (int64_t)siriStateForSiriPresentation:(id)a3;
- (unint64_t)_MDModeToSRModeConverter:(unint64_t)a3;
- (unint64_t)_SRModeToMDModeConverter:(unint64_t)a3;
- (unint64_t)_currentModeWithModeProvider:(id)a3;
- (unint64_t)_readoutResultFromTTSResult:(int64_t)a3 error:(id)a4;
- (unint64_t)_readoutResultFromTitleResult:(unint64_t)a3 messageResult:(unint64_t)a4;
- (unint64_t)_responseModeToMDModeConverter:(id)a3;
- (unint64_t)_wasSiriIdleAndQuiet;
- (unint64_t)siriDeviceLockStateForSiriPresentation:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_activateConversation:(id)a3;
- (void)_activeRequestOptionsDidChange;
- (void)_addErrorUtterance:(id)a3;
- (void)_audioSessionRouteDidChange:(id)a3;
- (void)_cancelCurrentAudioMessagePlayback:(id)a3;
- (void)_cancelCurrentTTS:(id)a3;
- (void)_cancelIdleTimer;
- (void)_cancelLastRootProvisionalSnippetFromLastRequestInConversation:(id)a3;
- (void)_cancelSpeechSynthesis;
- (void)_checkAndUpdateSiriIdleAndQuietStatusIfNeeded;
- (void)_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded;
- (void)_checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:(id)a3;
- (void)_connectionWasInterrupted;
- (void)_connectionWasInvalidated;
- (void)_delayAceCommandSuccess:(id)a3 forDuration:(double)a4;
- (void)_deleteConversationWithIdentifier:(id)a3;
- (void)_deletePreviousConversation;
- (void)_didCompleteActionForAceCommand:(id)a3 success:(BOOL)a4;
- (void)_didReceiveAceCommand:(id)a3;
- (void)_didReceiveAceCommand:(id)a3 completion:(id)a4;
- (void)_didStartActionForAceCommand:(id)a3;
- (void)_didStartActionForItemAtIndexPath:(id)a3 inConversation:(id)a4;
- (void)_dismissWithReason:(int64_t)a3;
- (void)_displayNotReadyError:(id)a3;
- (void)_emitRenderingEnded;
- (void)_emitRenderingStarted;
- (void)_enqueueSpokenSuggestionsFromAddViews:(id)a3;
- (void)_fetchAttendingState:(id)a3;
- (void)_handleRequestError:(id)a3 completion:(id)a4;
- (void)_idleTimerFired:(id)a3;
- (void)_insertUserUtteranceViewForSuggestion:(id)a3;
- (void)_insertUserUtteranceViewForText:(id)a3;
- (void)_invalidateConnection;
- (void)_logAceObjectPresented:(id)a3 dialogPhase:(id)a4;
- (void)_logAceObjectSpoken:(id)a3 dialogPhase:(id)a4 speakableText:(id)a5;
- (void)_logAceObjectSpoken:(id)a3 dialogPhase:(id)a4 speakableText:(id)a5 dialogIdentifierOverride:(id)a6;
- (void)_logPatternExecutedEventForAddViewsCommand:(id)a3;
- (void)_logRevealSpeechCommandReceived:(id)a3;
- (void)_notifyPromptedUserForInput;
- (void)_openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 conversationId:(id)a6 completion:(id)a7;
- (void)_performAceCommand:(id)a3 conversationIdentifier:(id)a4 turnIdentifier:(id)a5 completion:(id)a6;
- (void)_performAppPunchOutCommand:(id)a3 completion:(id)a4;
- (void)_performAppPunchOutCommand:(id)a3 conversationItemIdentifier:(id)a4 completion:(id)a5;
- (void)_performGenericAceCommand:(id)a3 turnIdentifier:(id)a4 completion:(id)a5;
- (void)_performSayItCommand:(id)a3;
- (void)_presentAuthenticationDialogWithText:(id)a3;
- (void)_processAddViewsCommand:(id)a3 forMode:(unint64_t)a4 completion:(id)a5;
- (void)_reflectionDialogHasBeenPlayed:(BOOL)a3;
- (void)_removePreviousConversationFromStore;
- (void)_rescheduleIdleTimerIfNeeded;
- (void)_resetContext;
- (void)_restorePreviousConversation;
- (void)_runScrollRosterTestWithOptions:(id)a3;
- (void)_saveConversationWithCompletion:(id)a3;
- (void)_scheduleAudioResumptionAfterDelayInSec:(double)a3;
- (void)_scheduleIdleTimer;
- (void)_scheduleInterruptedAudioResumingIfNeeded;
- (void)_setAceCommandRecords:(id)a3;
- (void)_setAcousticIdAllowed:(BOOL)a3;
- (void)_setAudioMessagePlayer:(id)a3;
- (void)_setAudioPlayerIsPlaying:(BOOL)a3;
- (void)_setConversations:(id)a3;
- (void)_setCurrentAVRecordRoute:(id)a3;
- (void)_setDelayedConversationItemRevisionIdentifiers:(id)a3;
- (void)_setExperimentationManager:(id)a3;
- (void)_setIdleTimer:(id)a3;
- (void)_setIdleTimerEnabled:(BOOL)a3;
- (void)_setKeyboardLoweredAfterResponse:(BOOL)a3;
- (void)_setListenAfterSpeakingForRepeatable:(BOOL)a3;
- (void)_setListenAfterSpeakingForRequestFinished:(BOOL)a3;
- (void)_setPresentation:(id)a3;
- (void)_setPresentedConversationItemRevisionIdentifiers:(id)a3;
- (void)_setReadingBulletinContentInCarPlayOutsideOfSiriSession:(BOOL)a3;
- (void)_setRepeatablePhrases:(id)a3;
- (void)_setRequestActive:(BOOL)a3;
- (void)_setRequestOptions:(id)a3;
- (void)_setShowKeyboardIfTextInputEnabled:(BOOL)a3;
- (void)_setShowKeyboardIfTextInputEnabled:(BOOL)a3 minimized:(BOOL)a4;
- (void)_setSiriState:(int64_t)a3;
- (void)_setStartRequestAceCommandSent:(BOOL)a3;
- (void)_setStatusBarFrame:(CGRect)a3;
- (void)_setStatusViewHeight:(double)a3;
- (void)_setUserUtteranceTapToEditInProgress:(BOOL)a3;
- (void)_setUtteranceToSpeakAfterClearScreenCommand:(id)a3;
- (void)_setVoicemailPlayer:(id)a3;
- (void)_setWaitingForStartRequest:(BOOL)a3;
- (void)_setWasSiriIdleAndQuiet:(unint64_t)a3;
- (void)_setupXPCListener;
- (void)_sharePatternIdFromAddViewsCommand:(id)a3;
- (void)_shouldShowDownloadAssetsNotificationPrompt:(BOOL)a3;
- (void)_siriPresentation:(id)a3 speakTextForConversationItemIdentifier:(id)a4 delayed:(BOOL)a5;
- (void)_siriPresentation:(id)a3 speakTextForConversationItemIdentifierDidBecomeReady:(id)a4;
- (void)_speakEnqueuedSpokenSuggestion;
- (void)_speakText:(id)a3 audioData:(id)a4 ignoreMuteSwitch:(BOOL)a5 identifier:(id)a6 sessionId:(id)a7 preferredVoice:(id)a8 language:(id)a9 gender:(id)a10 provisionally:(BOOL)a11 eligibleAfterDuration:(double)a12 delayed:(BOOL)a13 canUseServerTTS:(BOOL)a14 speakableUtteranceParser:(id)a15 analyticsContext:(id)a16 speakableContextInfo:(id)a17 preparation:(id)a18 completion:(id)a19;
- (void)_speakText:(id)a3 identifier:(id)a4 sessionId:(id)a5 preferredVoice:(id)a6 provisionally:(BOOL)a7 eligibleAfterDuration:(double)a8 delayed:(BOOL)a9 canUseServerTTS:(BOOL)a10 speakableUtteranceParser:(id)a11 analyticsContext:(id)a12 speakableContextInfo:(id)a13 preparation:(id)a14 completion:(id)a15;
- (void)_startListenAfterSpeaking;
- (void)_startListenAfterSpeakingRequest;
- (void)_startRequestWithOptions:(id)a3;
- (void)_startScrollingWithOptions:(id)a3;
- (void)_synthesizePhoneticText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6;
- (void)_synthesizeProvisionalText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6;
- (void)_synthesizeSpeechWithText:(id)a3 identifier:(id)a4 sessionId:(id)a5 isPhonetic:(BOOL)a6 provisionally:(BOOL)a7 completion:(id)a8;
- (void)_synthesizeText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6;
- (void)_testDidReceiveAceCommand:(id)a3 completion:(id)a4;
- (void)_updateKeyboardState:(BOOL)a3 minimized:(BOOL)a4;
- (void)_updateKeyboardStateWithError:(id)a3;
- (void)_updateKeyboardStatusForAddViewsCommand:(id)a3;
- (void)_updateLanguageCode;
- (void)aceCommandRecords:(id)a3 didChangeResultForCommand:(id)a4 completion:(id)a5;
- (void)alertDidBeginPlaying:(id)a3;
- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4;
- (void)audioPlayer:(id)a3 didFinishPlayback:(id)a4;
- (void)audioPlayerStartPlaying:(id)a3;
- (void)cancelRequestForSiriPresentation:(id)a3;
- (void)controllerRequestScreenClearedWithClearASR:(BOOL)a3;
- (void)controllerRequestSiriBlurHidden:(BOOL)a3;
- (void)controllerRequestSiriDismissal;
- (void)controllerRequestSystemApertureCollapse;
- (void)controllerRequestTapsShared:(BOOL)a3;
- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4;
- (void)conversation:(id)a3 didRemoveItemsWithIdentifiers:(id)a4 atIndexPaths:(id)a5 parentItemIdentifiers:(id)a6;
- (void)dealloc;
- (void)didBeginProcessingConversationItems;
- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4;
- (void)didReceiveBugButtonLongPress;
- (void)didReceiveHelpAction;
- (void)didReceiveOrbViewTapToCancelRequest;
- (void)didReceiveReportBugAction;
- (void)didReceiveShortTapActionWIthRequestOptions:(id)a3;
- (void)disableIdleTimerForSiriPresentation:(id)a3;
- (void)disableTouchIDFaceIDIfNecessaryForDucID:(id)a3;
- (void)dismissSiriPresentation:(id)a3 withReason:(int64_t)a4;
- (void)dismissSiriResults;
- (void)enableIdleTimerForSiriPresentation:(id)a3;
- (void)forceAudioSessionInactiveForSiriPresentation:(id)a3;
- (void)getScreenshotImageForSiriPresentation:(id)a3 withCompletion:(id)a4;
- (void)handlePasscodeUnlockForSiriPresentation:(id)a3 withCompletion:(id)a4;
- (void)handlePlayTrailer:(id)a3 completion:(id)a4;
- (void)hasContentAtPoint:(id)a3 completion:(id)a4;
- (void)hostApplicationDidBecomeActive;
- (void)hostApplicationDidSuccessfullyHandleCommandsInDelayedActionCommand:(id)a3;
- (void)hostApplicationPresentationStateUpdatedFromPresentationState:(int64_t)a3 toPresentationState:(int64_t)a4;
- (void)hostApplicationRequestsEmitInstrumentationEvent:(id)a3;
- (void)hostApplicationRequestsEmitInstrumentationEvent:(id)a3 atTime:(unint64_t)a4;
- (void)hostApplicationRequestsEmitUIStateTransitionForSiriDismissalWithReason:(int)a3 completion:(id)a4;
- (void)hostApplicationRequestsScreenshotWithCompletion:(id)a3;
- (void)hostApplicationWillEnterForeground;
- (void)hostApplicationWillResignActive;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)notifyClientStateManagerSpeakingBegan:(id)a3;
- (void)notifyClientStateManagerSpeakingEnded:(id)a3;
- (void)notifyClientStateManagerTransactionBegan:(id)a3;
- (void)notifyClientStateManagerTransactionEnded:(id)a3;
- (void)orchestrationDidPresentResponseFullyInApp;
- (void)orientationWillChangeTo:(int64_t)a3;
- (void)preloadPluginBundles;
- (void)preloadPresentationBundleWithIdentifier:(id)a3;
- (void)runPPTWithOptions:(id)a3;
- (void)setBottomContentInset:(double)a3;
- (void)setCompletedCommandAppPunchOutIds:(id)a3;
- (void)setDockFrameValue:(id)a3;
- (void)setDomainObject:(id)a3 forIdentifier:(id)a4;
- (void)setHostFrontMostAppOrientation:(int64_t)a3;
- (void)setInputAccessoryView:(id)a3;
- (void)setPresentation:(id)a3;
- (void)setPresentation:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setPreviousSayItCommand:(id)a3;
- (void)setRequestOptions:(id)a3;
- (void)setSession:(id)a3;
- (void)setStatusBarFrameValue:(id)a3;
- (void)setStatusViewHeightNumber:(id)a3;
- (void)setSystemContentFrame:(CGRect)a3;
- (void)setWaitingForTelephonyToStart:(BOOL)a3;
- (void)showAppUnlockForAppId:(id)a3 completion:(id)a4;
- (void)showPresentationWithIdentifier:(id)a3 properties:(id)a4 lockState:(unint64_t)a5;
- (void)siriDidActivateFromSource:(int64_t)a3;
- (void)siriDidDeactivateWithCompletion:(id)a3;
- (void)siriDidHidePasscodeUnlock;
- (void)siriKeyboardViewDidChange:(id *)a3;
- (void)siriPresentation:(id)a3 activateConversationWithIdentifier:(id)a4;
- (void)siriPresentation:(id)a3 addSelectionResponse:(id)a4;
- (void)siriPresentation:(id)a3 deleteConversationWithIdentifier:(id)a4;
- (void)siriPresentation:(id)a3 didChangePeekMode:(unint64_t)a4;
- (void)siriPresentation:(id)a3 didChangeVisualState:(unint64_t)a4;
- (void)siriPresentation:(id)a3 didCorrectRecognition:(id)a4 correctionIdentifier:(id)a5 forConversationItemWithIdentifier:(id)a6 userSelectionResults:(id)a7;
- (void)siriPresentation:(id)a3 didCorrectRecognition:(id)a4 correctionIdentifier:(id)a5 forItemAtIndexPath:(id)a6;
- (void)siriPresentation:(id)a3 didDelayPresentationOfItemsWithIdentifiers:(id)a4;
- (void)siriPresentation:(id)a3 didDismissViewController:(id)a4;
- (void)siriPresentation:(id)a3 didEditSpeechRecognized:(id)a4 forInterval:(double)a5;
- (void)siriPresentation:(id)a3 didPresentConversationItemsWithIdentifiers:(id)a4;
- (void)siriPresentation:(id)a3 didPresentIntentWithBundleId:(id)a4;
- (void)siriPresentation:(id)a3 didPresentItemsAtIndexPaths:(id)a4;
- (void)siriPresentation:(id)a3 didPresentViewController:(id)a4;
- (void)siriPresentation:(id)a3 didRequestKeyboardWithVisibility:(BOOL)a4;
- (void)siriPresentation:(id)a3 didScrollForInterval:(double)a4 metricsContext:(id)a5;
- (void)siriPresentation:(id)a3 didShowAceViewWithIdentifier:(id)a4 aceViewClass:(Class)a5 metricsContext:(id)a6 forInterval:(double)a7;
- (void)siriPresentation:(id)a3 didShowGuideStartTime:(id)a4 endTime:(id)a5;
- (void)siriPresentation:(id)a3 didShowTipWithIdentifier:(id)a4 startDate:(id)a5 endDate:(id)a6 flowID:(id)a7;
- (void)siriPresentation:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5;
- (void)siriPresentation:(id)a3 inputTypeDidChange:(int64_t)a4;
- (void)siriPresentation:(id)a3 insertAceViews:(id)a4 withDialogPhase:(id)a5 asItemsAtIndexPaths:(id)a6;
- (void)siriPresentation:(id)a3 openURL:(id)a4 conversationId:(id)a5 completion:(id)a6;
- (void)siriPresentation:(id)a3 performAceCommand:(id)a4 conversationItemIdentifier:(id)a5 completion:(id)a6;
- (void)siriPresentation:(id)a3 performAceCommand:(id)a4 conversationItemIdentifier:(id)a5 turnIdentifier:(id)a6 completion:(id)a7;
- (void)siriPresentation:(id)a3 preventOutsideTouchesFromDismissingSiri:(BOOL)a4;
- (void)siriPresentation:(id)a3 reduceOrbOpacity:(BOOL)a4;
- (void)siriPresentation:(id)a3 removeItemsAtIndexPaths:(id)a4;
- (void)siriPresentation:(id)a3 requestHostBlurVisible:(BOOL)a4 reason:(int64_t)a5 fence:(id)a6;
- (void)siriPresentation:(id)a3 requestsAttendingStateWithCompletion:(id)a4;
- (void)siriPresentation:(id)a3 requestsKeyboardWithCompletion:(id)a4;
- (void)siriPresentation:(id)a3 requestsTouchPassThroughEnabled:(BOOL)a4;
- (void)siriPresentation:(id)a3 setBugReportingAvailable:(BOOL)a4;
- (void)siriPresentation:(id)a3 setDomainObject:(id)a4 forIdentifier:(id)a5;
- (void)siriPresentation:(id)a3 setFullScreenDimmingLayerVisible:(BOOL)a4 animated:(BOOL)a5;
- (void)siriPresentation:(id)a3 setHelpButtonEmphasized:(BOOL)a4;
- (void)siriPresentation:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5;
- (void)siriPresentation:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)siriPresentation:(id)a3 setStatusViewDisabled:(BOOL)a4;
- (void)siriPresentation:(id)a3 setStatusViewHidden:(BOOL)a4;
- (void)siriPresentation:(id)a3 setStatusViewUserInteractionEnabled:(BOOL)a4;
- (void)siriPresentation:(id)a3 setTypeToSiriViewHidden:(BOOL)a4;
- (void)siriPresentation:(id)a3 siriRequestEnteredWithText:(id)a4;
- (void)siriPresentation:(id)a3 startEditedRequestWithText:(id)a4 correctionIdentifier:(id)a5 userSelectionResults:(id)a6;
- (void)siriPresentation:(id)a3 startRequestForSuggestion:(id)a4 inputType:(int64_t)a5;
- (void)siriPresentation:(id)a3 startRequestForText:(id)a4;
- (void)siriPresentation:(id)a3 startRequestWithOptions:(id)a4;
- (void)siriPresentation:(id)a3 synthesizeSpeechWithPhoneticText:(id)a4 completion:(id)a5;
- (void)siriPresentation:(id)a3 synthesizeSpeechWithText:(id)a4 completion:(id)a5;
- (void)siriPresentation:(id)a3 viewDidAppearWithAceObject:(id)a4;
- (void)siriPresentation:(id)a3 viewDidAppearWithClassDescriptor:(id)a4 identifier:(id)a5;
- (void)siriPresentation:(id)a3 viewDidDisappearWithClassDescriptor:(id)a4 identifier:(id)a5;
- (void)siriPresentation:(id)a3 willBeginEditingOfType:(int64_t)a4;
- (void)siriPresentation:(id)a3 willChangeKeyboardVisibility:(BOOL)a4;
- (void)siriPresentation:(id)a3 willDiscardConversationItemsWithIdentifiers:(id)a4;
- (void)siriPresentation:(id)a3 willDismissViewController:(id)a4;
- (void)siriPresentation:(id)a3 willPresentViewController:(id)a4;
- (void)siriPresentationCancelHIDEventDefferal:(id)a3;
- (void)siriPresentationClearContext:(id)a3;
- (void)siriPresentationDidDismissBugReporter:(id)a3;
- (void)siriPresentationDidEndEditing:(id)a3;
- (void)siriPresentationDidHideKeyboard:(id)a3;
- (void)siriPresentationDidHideUnlockScreen:(id)a3;
- (void)siriPresentationDidPresentBugReporter:(id)a3;
- (void)siriPresentationDidPresentConversationFromBreadcrumb:(id)a3;
- (void)siriPresentationDidPresentDynamicSnippetWithInfo:(id)a3;
- (void)siriPresentationDidPresentUserInterface:(id)a3;
- (void)siriPresentationDidRequestRestartSpeechSynthesis:(id)a3;
- (void)siriPresentationDidResignFirstResponder:(id)a3;
- (void)siriPresentationKeyboardViewDidAppear:(id)a3;
- (void)siriPresentationMicButtonLongPressBegan:(id)a3;
- (void)siriPresentationMicButtonLongPressEnded:(id)a3;
- (void)siriPresentationMicButtonWasTapped:(id)a3;
- (void)siriPresentationPresentAcousticIDSpinner:(id)a3;
- (void)siriPresentationPulseHelpButton:(id)a3;
- (void)siriPresentationRemoveAcousticIDSpinner:(id)a3;
- (void)siriPresentationRequestsHIDEventDefferal:(id)a3;
- (void)siriPresentationRequestsSystemUICollapse:(id)a3;
- (void)siriPresentationWillSendStartRequest:(id)a3;
- (void)siriResultsDidDismissInTamaleForSiriPresentation:(id)a3;
- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3;
- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3 peakLevel:(float)a4;
- (void)siriSessionDidBeginTaskWithIdentifier:(id)a3;
- (void)siriSessionDidChangeLockState:(unint64_t)a3;
- (void)siriSessionDidChangeNetworkAvailability;
- (void)siriSessionDidDetectMusic;
- (void)siriSessionDidDetectSpeechStartpoint;
- (void)siriSessionDidEnterLatencyState;
- (void)siriSessionDidFinishAcousticIDRequestWithSuccess:(BOOL)a3;
- (void)siriSessionDidFinishRequestWithError:(id)a3;
- (void)siriSessionDidInitializeSessionInfo:(id)a3;
- (void)siriSessionDidReceiveAddContentToViewCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveAddDialogsCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveAddViewsCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveAppPunchOutCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveAudioSessionInterruptionBeganWithUserInfo:(id)a3 machAbsoluteTime:(unint64_t)a4;
- (void)siriSessionDidReceiveClearScreenCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveCloseAssistantCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveDisambiguationItemSelected:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveExtendCurrentTTSCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveGetResponseAlternativesPlaybackCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveGuideUpdateCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveHideSiriOverlayCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveLatencyInformation:(id)a3;
- (void)siriSessionDidReceiveLaunchTVRemoteCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveListenForPronunciationCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveOpenLinkCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceivePaginateListCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceivePlayContentCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceivePlayNotificationSound:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceivePlayVoicemailCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceivePreSynthesizeTTSCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveRepeatItCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveRevealRecognizedSpeechCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSAUIChangePrimaryUtteranceCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSAUIShowFullScreenEffectCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSAUIShowRequestHandlingStatusCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSAUIShowSpeechAlternativesCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSayItCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSetSuggestedUtterancesCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSetUIGuidedAccessCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveShowHelpCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveShowNextCardCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveShowNextSnippetCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSmsPlayAudioCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSnippetConfigurationRequestCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveSpeechPartialResultCommand:(id)a3;
- (void)siriSessionDidReceiveSpeechRecognizedCommand:(id)a3;
- (void)siriSessionDidReceiveStartGenAIEnablementFlowCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveStartImmersiveExperienceCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveUpdateViewsCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidReceiveUpdateVisualResponseSnippetCommand:(id)a3 completion:(id)a4;
- (void)siriSessionDidRecognizedAdditionalSpeechInterpretation:(id)a3 refId:(id)a4;
- (void)siriSessionDidStartAcousticIDRequest;
- (void)siriSessionDidStartNewTurn:(id)a3;
- (void)siriSessionDidStartNewTurn:(id)a3 associatedLaunchStartContext:(id)a4 machAbsoluteTime:(double)a5 linkPreviousTurn:(BOOL)a6;
- (void)siriSessionDidTransitionFromState:(int64_t)a3 toState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6;
- (void)siriSessionDidUpdateAudioSessionID:(unsigned int)a3;
- (void)siriSessionDidUpdateRecognitionWithPhrases:(id)a3 utterances:(id)a4 refId:(id)a5;
- (void)siriSessionDidUpdateSessionInfo:(id)a3;
- (void)siriSessionGetRequestContextWithCompletionHandler:(id)a3;
- (void)siriSessionIsPresentingApplePaySheet;
- (void)siriSessionIsPresentingLocalAuthenticationUI;
- (void)siriSessionOpenURL:(id)a3 completionHandler:(id)a4;
- (void)siriSessionRequestedCancelPhotoSelectionWithAnimation:(BOOL)a3;
- (void)siriSessionRequestedPhotoSelectionWithSearchString:(id)a3 completion:(id)a4;
- (void)siriSessionRequestsDismissalForReason:(int64_t)a3;
- (void)siriSessionRequestsInstrumentingMessage:(id)a3 machAbsoluteTime:(double)a4;
- (void)siriSessionRequestsPlayPhaticWithCompletion:(id)a3;
- (void)siriSessionRequestsReadoutOfBulletin:(id)a3 completion:(id)a4;
- (void)siriSessionRequestsTTSDuckToVolume:(float)a3 rampTime:(double)a4 completion:(id)a5;
- (void)siriSessionRequestsToShowAssetsDownloadNotificationPrompt;
- (void)siriSessionResultForAceCommand:(id)a3 completion:(id)a4;
- (void)siriSessionSpeechRecordingDidCancel;
- (void)siriSessionSpeechRecordingDidChangeAVRecordRoute:(id)a3;
- (void)siriSessionSpeechRecordingDidEnd;
- (void)siriSessionSpeechRecordingDidFailWithError:(id)a3;
- (void)siriSessionWantsToCacheImage:(id)a3;
- (void)siriSessionWillCancelRequest;
- (void)siriSessionWillDismissAudioRoutePicker;
- (void)siriSessionWillProcessAceCommand:(id)a3;
- (void)siriSessionWillProcessAppLaunchWithBundleIdentifier:(id)a3;
- (void)siriSessionWillShowAudioRoutePicker;
- (void)siriSessionWillStartRequest;
- (void)siriSessionWillStartRequestWithOptions:(id)a3 completion:(id)a4;
- (void)siriSessionWillStartUIRequestWithText:(id)a3 completionHandler:(id)a4;
- (void)siriWillActivateFromSource:(int64_t)a3;
- (void)siriWillBePresented:(int64_t)a3;
- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4;
- (void)siriWillHidePasscodeUnlockForResult:(int64_t)a3;
- (void)siriWillShowPasscodeUnlock;
- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3;
- (void)siriWillStopAttending:(id)a3;
- (void)speechSynthesisDidFinish:(id)a3;
- (void)speechSynthesisDidStartSpeakingWithIdentifier:(id)a3;
- (void)speechSynthesisDidStopSpeakingWithIdentifier:(id)a3 queueIsEmpty:(BOOL)a4;
- (void)speechSynthesisDidUpdatePowerLevelTo:(float)a3;
- (void)speechSynthesisGetPreparedTextForIdentifier:(id)a3 completion:(id)a4;
- (void)startRequestForSuggestion:(id)a3 inputType:(int64_t)a4;
- (void)startRequestForText:(id)a3;
- (void)stopRecordingSpeechForSiriPresentation:(id)a3;
- (void)tapToEditPresented:(id)a3;
- (void)toggleHomeAffordanceHidden:(BOOL)a3;
- (void)toggleSiriHomeAffordanceGestureControl:(BOOL)a3;
- (void)updateEdgeLightWindowLevel:(int64_t)a3;
- (void)updateToPresentationWithIdentifier:(id)a3 presentationProperties:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)userDrilledIntoSnippet;
- (void)userTouchedSnippet;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SRSiriViewController

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AFUIViewControllerHosting];
}

+ (id)_exportedInterface
{
  v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AFUIViewControllerServing];
  v3 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___AFUISiriSession];
  [v2 setInterface:v3 forSelector:"setSession:" argumentIndex:0 ofReply:0];

  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v4 = +[NSArray arrayWithObjects:v14 count:2];
  v5 = +[NSSet setWithArray:v4];

  [v2 setClasses:v5 forSelector:"siriSessionGetRequestContextWithCompletionHandler:" argumentIndex:0 ofReply:1];
  uint64_t v6 = objc_opt_class();
  v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, objc_opt_class(), 0);
  [v2 setClasses:v7 forSelector:"siriSessionDidUpdateRecognitionWithPhrases:utterances:refId:" argumentIndex:0 ofReply:0];

  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:"siriSessionDidUpdateRecognitionWithPhrases:utterances:refId:" argumentIndex:1 ofReply:0];

  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v10 forSelector:"siriSessionDidInitializeSessionInfo:" argumentIndex:0 ofReply:0];

  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v11 forSelector:"siriSessionDidUpdateSessionInfo:" argumentIndex:0 ofReply:0];

  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v12 forSelector:"siriSessionDidReceivePlayContentCommand:completion:" argumentIndex:0 ofReply:0];

  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[UIApplication sharedApplication];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = +[UIApplication sharedApplication];
    [v7 _setForcedUserInterfaceLayoutDirection:SiriLanguageIsRTL()];
  }
  else
  {
    uint64_t v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B80AC(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  [(SRSiriViewController *)self _setIdleTimerEnabled:0];
  [(SRSiriViewController *)self _cancelIdleTimer];
  v16.receiver = self;
  v16.super_class = (Class)SRSiriViewController;
  [(SRSiriViewController *)&v16 viewWillAppear:v3];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SRSiriViewController;
  [(SRSiriViewController *)&v4 viewDidLoad];
  BOOL v3 = [(SRSiriViewController *)self _analytics];
  [v3 logEventWithType:1502 context:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SRSiriViewController;
  [(SRSiriViewController *)&v9 viewDidAppear:a3];
  [UIApp finishedIPTest:SUICPPTTestNameSiriBringupToSiriProcessViewControllerAppeared];
  objc_super v4 = [(SRSiriViewController *)self _analytics];
  [v4 logEventWithType:1513 context:0];

  objc_initWeak(&location, self);
  v5 = +[SiriSharedUIReplayUtilityWrapper sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003D7F0;
  v6[3] = &unk_100143998;
  objc_copyWeak(&v7, &location);
  [v5 registerReplayCallback:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v9 = "-[SRSiriViewController viewDidDisappear:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v7.receiver = self;
  v7.super_class = (Class)SRSiriViewController;
  [(SRSiriViewController *)&v7 viewDidDisappear:v3];
  char v6 = [(SRSiriViewController *)self _analytics];
  [v6 logEventWithType:1514 context:0];

  [(SRSiriViewController *)self _invalidateConnection];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SRSiriViewController;
  [(SRSiriViewController *)&v4 viewWillDisappear:a3];
  [(SRSiriViewController *)self _setShowKeyboardIfTextInputEnabled:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  kdebug_trace();
  v8.receiver = self;
  v8.super_class = (Class)SRSiriViewController;
  -[SRSiriViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  [v7 animateAlongsideTransition:0 completion:&stru_1001439D8];
}

- (void)_setupXPCListener
{
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    objc_super v9 = "-[SRSiriViewController _setupXPCListener]";
    __int16 v10 = 2112;
    uint64_t v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp Setting up XPC Listener in %@", buf, 0x16u);
  }
  objc_super v4 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.siri.app"];
  listener = self->_listener;
  self->_listener = v4;

  [(NSXPCListener *)self->_listener _setQueue:&_dispatch_main_q];
  [(NSXPCListener *)self->_listener setDelegate:self];
  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003DBE0;
  block[3] = &unk_100143410;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  char v6 = (NSXPCListener *)a3;
  id v7 = a4;
  listener = self->_listener;
  objc_super v9 = AFSiriLogContextConnection;
  if (listener == v6)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[SRSiriViewController listener:shouldAcceptNewConnection:]";
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp Accepting new XPC Connection: %@", buf, 0x16u);
    }
    id v11 = &_dispatch_main_q;
    objc_initWeak((id *)buf, self);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10003E008;
    v23[3] = &unk_100143A00;
    id v12 = &_dispatch_main_q;
    id v24 = &_dispatch_main_q;
    objc_copyWeak(&v25, (id *)buf);
    [v7 setInvalidationHandler:v23];
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    v19 = sub_10003E0D8;
    v20 = &unk_100143A00;
    id v13 = &_dispatch_main_q;
    id v21 = &_dispatch_main_q;
    objc_copyWeak(&v22, (id *)buf);
    [v7 setInterruptionHandler:&v17];
    uint64_t v14 = [objc_opt_class() _remoteViewControllerInterface:v17, v18, v19, v20];
    [v7 setRemoteObjectInterface:v14];

    uint64_t v15 = [(id)objc_opt_class() _exportedInterface];
    [v7 setExportedInterface:v15];

    [v7 setExportedObject:self];
    [v7 _setQueue:&_dispatch_main_q];
    [v7 resume];
    objc_storeStrong((id *)&self->_connection, a4);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    __int16 v10 = self->_listener;
    *(_DWORD *)buf = 136315906;
    v27 = "-[SRSiriViewController listener:shouldAcceptNewConnection:]";
    __int16 v28 = 2112;
    id v29 = v7;
    __int16 v30 = 2112;
    v31 = v6;
    __int16 v32 = 2112;
    v33 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s #xpcSiriApp Was asked to accept new connection from %@ for %@ instead of %@", buf, 0x2Au);
  }

  return listener == v6;
}

- (void)_connectionWasInvalidated
{
  unsigned int v3 = [(NSXPCConnection *)self->_connection processIdentifier];
  objc_super v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    int v6 = 136315650;
    id v7 = "-[SRSiriViewController _connectionWasInvalidated]";
    __int16 v8 = 1024;
    unsigned int v9 = v3;
    __int16 v10 = 2112;
    id v11 = connection;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp Connection from SpringBoard/CarPlay was invalidated pid=%d _connection=%@", (uint8_t *)&v6, 0x1Cu);
  }
  [(NSXPCConnection *)self->_connection setExportedObject:0];
}

- (void)_connectionWasInterrupted
{
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_1000B8124();
  }
}

- (SRSiriViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v47.receiver = self;
  v47.super_class = (Class)SRSiriViewController;
  __int16 v8 = [(SRSiriViewController *)&v47 initWithNibName:v6 bundle:v7];
  if (v8)
  {
    unsigned int v9 = +[SRApplication sharedApplication];
    [v9 setDataSource:v8];

    __int16 v10 = objc_alloc_init(SRPreferences);
    preferences = v8->_preferences;
    v8->_preferences = v10;

    id v12 = (AFUISiriLanguage *)[objc_alloc((Class)AFUISiriLanguage) initWithDelegate:v8];
    language = v8->_language;
    v8->_language = v12;

    [(SRSiriViewController *)v8 _updateLanguageCode];
    uint64_t v14 = +[NSMutableArray array];
    conversations = v8->_conversations;
    v8->_conversations = (NSMutableArray *)v14;

    id v16 = [(SRSiriViewController *)v8 _startNewConversation];
    v17 = (AFConversationStore *)objc_alloc_init((Class)AFConversationStore);
    conversationStore = v8->_conversationStore;
    v8->_conversationStore = v17;

    v19 = (AFManagedStorageConnection *)objc_alloc_init((Class)AFManagedStorageConnection);
    domainObjectStorageConnection = v8->_domainObjectStorageConnection;
    v8->_domainObjectStorageConnection = v19;

    id v21 = (SRUIFAceCommandRecords *)objc_alloc_init((Class)SRUIFAceCommandRecords);
    aceCommandRecords = v8->_aceCommandRecords;
    v8->_aceCommandRecords = v21;

    [(SRUIFAceCommandRecords *)v8->_aceCommandRecords setDelegate:v8];
    v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    repeatablePhrases = v8->_repeatablePhrases;
    v8->_repeatablePhrases = v23;

    v8->_acousticIdAllowed = 0;
    id v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    synthesisPreparationDictionary = v8->_synthesisPreparationDictionary;
    v8->_synthesisPreparationDictionary = v25;

    v27 = objc_alloc_init(SRModeProvider);
    modeProvider = v8->_modeProvider;
    v8->_modeProvider = v27;

    id v29 = (SRUIFAnalyticsSupplement *)objc_alloc_init((Class)SRUIFAnalyticsSupplement);
    analyticsSupplement = v8->_analyticsSupplement;
    v8->_analyticsSupplement = v29;

    v31 = (SRUIFSpeechSynthesizer *)objc_alloc_init((Class)SRUIFSpeechSynthesizer);
    ttsManager = v8->_ttsManager;
    v8->_ttsManager = v31;

    [(SRUIFSpeechSynthesizer *)v8->_ttsManager setDelegate:v8];
    [(SRUIFSpeechSynthesizer *)v8->_ttsManager setClientStateManagerDelegate:v8];
    v33 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      v34 = v8->_ttsManager;
      *(_DWORD *)buf = 136315394;
      v49 = "-[SRSiriViewController initWithNibName:bundle:]";
      __int16 v50 = 2112;
      v51 = v34;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "%s #tts 3 created _ttsManager:%@", buf, 0x16u);
    }
    v35 = +[AFUIDisambiguationAnalyticsManager sharedManager];
    [v35 setDataSource:v8];

    v36 = +[NSNotificationCenter defaultCenter];
    [v36 addObserver:v8 selector:"_audioSessionRouteDidChange:" name:AVAudioSessionRouteChangeNotification object:0];

    [(SRSiriViewController *)v8 _setupXPCListener];
    objc_initWeak((id *)buf, v8);
    v37 = [SRSiriSystemUIController alloc];
    uint64_t v38 = AFUIIsDeviceLiveActivitiesSupported();
    v39 = [(SRSiriSystemUIController *)v37 initWithDelegate:v8 systemUIDevice:v38 systemApertureSupportedDevice:AFUIIsDeviceSystemApertureEnabled()];
    systemUIController = v8->_systemUIController;
    v8->_systemUIController = v39;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003E7A0;
    block[3] = &unk_100143A28;
    objc_copyWeak(&v46, (id *)buf);
    v8->_mainRunLoopObserverRef = CFRunLoopObserverCreateWithHandler(0, 0x81uLL, 1u, 0, block);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, v8->_mainRunLoopObserverRef, (CFRunLoopMode)UITrackingRunLoopMode);
    v42 = (AIMLExperimentationAnalyticsManager *)objc_alloc_init((Class)AIMLExperimentationAnalyticsManager);
    manager = v8->_manager;
    v8->_manager = v42;

    objc_destroyWeak(&v46);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

- (void)dealloc
{
  unsigned int v3 = [(SRSiriViewController *)self _idleTimer];
  [v3 invalidate];

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:AVAudioSessionRouteChangeNotification object:0];

  if (self->_mainRunLoopObserverRef)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveObserver(Main, self->_mainRunLoopObserverRef, (CFRunLoopMode)UITrackingRunLoopMode);
    CFRelease(self->_mainRunLoopObserverRef);
  }
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v10 = "-[SRSiriViewController dealloc]";
    __int16 v11 = 2112;
    id v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp invalidating connection because of dealloc self=%@", buf, 0x16u);
  }
  [(SRSiriViewController *)self _invalidateConnection];
  id v7 = objc_alloc_init(SRBackgroundTaskManager);
  objc_setAssociatedObject(self->_listener, @"NSXPCListenerInstanceAssociatedBackgroundTaskManagerIdentifier", v7, (void *)1);
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];

  v8.receiver = self;
  v8.super_class = (Class)SRSiriViewController;
  [(SRSiriViewController *)&v8 dealloc];
}

- (void)_invalidateConnection
{
  unsigned int v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    connection = self->_connection;
    int v5 = 136315650;
    id v6 = "-[SRSiriViewController _invalidateConnection]";
    __int16 v7 = 2112;
    objc_super v8 = connection;
    __int16 v9 = 2112;
    __int16 v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #xpcSiriApp \"%@\" %@", (uint8_t *)&v5, 0x20u);
  }
  [(NSXPCConnection *)self->_connection invalidate];
}

- (BOOL)shouldAutorotate
{
  if (SiriUIDeviceIsZoomed()) {
    return 0;
  }

  return SiriUIIsAllOrientationsSupported();
}

- (unint64_t)supportedInterfaceOrientations
{
  if ((SiriUIDeviceIsZoomed() & 1) != 0 || (SiriUIIsAllOrientationsSupported() & 1) == 0) {
    return 2;
  }
  else {
    return 30;
  }
}

- (void)_cancelLastRootProvisionalSnippetFromLastRequestInConversation:(id)a3
{
  id v3 = a3;
  [v3 removeTransientItems];
  uint64_t v4 = (uint64_t)[v3 numberOfChildrenForItemWithIdentifier:0];
  if (v4 >= 1)
  {
    uint64_t v5 = v4 + 1;
    while (1)
    {
      id v6 = +[NSIndexPath indexPathWithIndex:v5 - 2];
      __int16 v7 = [v3 itemAtIndexPath:v6];
      objc_super v8 = [v7 aceObject];
      if ([v7 type] == (id)1) {
        break;
      }
      if ([v7 presentationState] == (id)2)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          __int16 v10 = AFSiriLogContextConnection;
          BOOL v11 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
          if (isKindOfClass)
          {
            if (v11)
            {
              int v13 = 136315138;
              uint64_t v14 = "-[SRSiriViewController _cancelLastRootProvisionalSnippetFromLastRequestInConversation:]";
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Not canceling SAUIPronunciationSnippet", (uint8_t *)&v13, 0xCu);
            }
          }
          else
          {
            if (v11)
            {
              int v13 = 136315394;
              uint64_t v14 = "-[SRSiriViewController _cancelLastRootProvisionalSnippetFromLastRequestInConversation:]";
              __int16 v15 = 2112;
              id v16 = v8;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Canceling provisional %@", (uint8_t *)&v13, 0x16u);
            }
            id v12 = [v7 identifier];
            [v3 cancelItemWithIdentifier:v12];

            [v3 setSynchronizedWithServer:0];
          }
          break;
        }
      }

      if ((unint64_t)--v5 <= 1) {
        goto LABEL_15;
      }
    }
  }
LABEL_15:
}

- (id)_host
{
  return [(SRSiriViewController *)self _hostWithErrorHandler:0];
}

- (id)_hostWithErrorHandler:(id)a3
{
  return [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:a3];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SRSiriViewController;
  [(SRSiriViewController *)&v4 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
}

- (id)preferredFocusEnvironments
{
  uint64_t v3 = [(SRSiriViewController *)self _presentationViewController];
  objc_super v4 = (void *)v3;
  if (v3)
  {
    uint64_t v9 = v3;
    uint64_t v5 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SRSiriViewController;
    uint64_t v5 = [(SRSiriViewController *)&v8 preferredFocusEnvironments];
  }
  id v6 = (void *)v5;

  return v6;
}

- (void)setBottomContentInset:(double)a3
{
  if (vabdd_f64(self->_bottomContentInset, a3) >= 0.00000011920929)
  {
    self->_bottomContentInset = a3;
    id v4 = [(SRSiriViewController *)self _presentation];
    if (objc_opt_respondsToSelector()) {
      [v4 setBottomContentInset:self->_bottomContentInset];
    }
  }
}

- (void)setSystemContentFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  self->_systemContentFrame = a3;
  id v7 = [(SRSiriViewController *)self _presentation];
  if (objc_opt_respondsToSelector())
  {
    v9.origin.CGFloat x = x;
    v9.origin.CGFloat y = y;
    v9.size.CGFloat width = width;
    v9.size.CGFloat height = height;
    [v7 setTopContentInset:1 animated:CGRectGetMaxY(v9)];
  }
}

- (void)_setStatusBarFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_statusBarFrame = &self->_statusBarFrame;
  if (!CGRectEqualToRect(self->_statusBarFrame, a3))
  {
    p_statusBarFrame->origin.CGFloat x = x;
    p_statusBarFrame->origin.CGFloat y = y;
    p_statusBarFrame->size.CGFloat width = width;
    p_statusBarFrame->size.CGFloat height = height;
    id v9 = [(SRSiriViewController *)self _presentation];
    if (objc_opt_respondsToSelector()) {
      [v9 statusBarFrameDidChange];
    }
  }
}

- (void)setStatusBarFrameValue:(id)a3
{
  [a3 CGRectValue];

  -[SRSiriViewController _setStatusBarFrame:](self, "_setStatusBarFrame:");
}

- (void)setDockFrameValue:(id)a3
{
  [a3 CGRectValue];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(SRSiriViewController *)self _presentation];
  if (objc_opt_respondsToSelector()) {
    [v12 dockFrameDidChange:v5, v7, v9, v11];
  }
}

- (void)_setStatusViewHeight:(double)a3
{
  self->_statusViewHeight = a3;
  id v3 = [(SRSiriViewController *)self _presentation];
  if (objc_opt_respondsToSelector()) {
    [v3 statusViewHeightDidChange];
  }
}

- (void)setStatusViewHeightNumber:(id)a3
{
  [a3 floatValue];
  double v5 = v4;

  [(SRSiriViewController *)self _setStatusViewHeight:v5];
}

- (id)_activeConversation
{
  v2 = [(SRSiriViewController *)self _conversations];
  id v3 = [v2 lastObject];

  return v3;
}

- (id)_conversationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  __int16 v15 = sub_10003F330;
  id v16 = sub_10003F340;
  id v17 = 0;
  double v5 = [(SRSiriViewController *)self _conversations];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003F348;
  v9[3] = &unk_100143A50;
  id v6 = v4;
  id v10 = v6;
  double v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)_resetContext
{
  id v2 = [(SRSiriViewController *)self _session];
  [v2 resetContextTypes:7];
}

- (void)_activateConversation:(id)a3
{
  id v4 = a3;
  double v5 = [(SRSiriViewController *)self _conversations];
  id v6 = [(SRSiriViewController *)self _activeConversation];
  id v7 = [(SRSiriViewController *)self _previousConversation];

  unsigned __int8 v8 = [v5 containsObject:v4];
  [v5 removeObject:v4];
  [v5 addObject:v4];
  if (v7 == v4)
  {
    unsigned int v10 = [v4 isSynchronizedWithServer];
    double v11 = AFSiriLogContextConnection;
    BOOL v12 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        int v15 = 136315138;
        id v16 = "-[SRSiriViewController _activateConversation:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Rolling back the last clear context for server synchronized conversation", (uint8_t *)&v15, 0xCu);
      }
      int v13 = [(SRSiriViewController *)self _session];
      [v13 rollbackClearContext];
    }
    else
    {
      if (v12)
      {
        int v15 = 136315138;
        id v16 = "-[SRSiriViewController _activateConversation:]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Clearing context for non synchronized conversation", (uint8_t *)&v15, 0xCu);
      }
      int v13 = [(SRSiriViewController *)self _session];
      [v13 clearContext];
    }

    uint64_t v14 = [(SRSiriViewController *)self _session];
    [v14 setAlertContext];
  }
  else if ((v8 & 1) == 0 && (unint64_t)[v5 count] >= 2)
  {
    double v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315138;
      id v16 = "-[SRSiriViewController _activateConversation:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Resetting context for more than one conversation loaded", (uint8_t *)&v15, 0xCu);
    }
    [(SRSiriViewController *)self _resetContext];
  }
  if (v6) {
    [(SRSiriViewController *)self _cancelLastRootProvisionalSnippetFromLastRequestInConversation:v6];
  }
}

- (void)_removePreviousConversationFromStore
{
  id v2 = [(SRSiriViewController *)self _conversationStore];
  [v2 removeConversationWithIdentifier:AFUIPreviousConversationIdentifier completionBlock:&stru_100143A90];
}

- (void)_saveConversationWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = AFUIPreviousConversationIdentifier;
  id v6 = [(SRSiriViewController *)self _activeConversation];
  id v7 = [(SRSiriViewController *)self _presentation];
  if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v8 = [(SRSiriViewController *)self _presentation];
    unsigned __int8 v9 = [v8 canSaveConversations];

    if ((v9 & 1) == 0)
    {
      unsigned int v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v19 = "-[SRSiriViewController _saveConversationWithCompletion:]";
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s #conversation Presentation does not support conversation saving; not saving conversation { conversation: %@ }",
          buf,
          0x16u);
      }
      if (v4) {
        v4[2](v4);
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  double v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[SRSiriViewController _saveConversationWithCompletion:]";
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2112;
    v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #conversation Saving conversation to store { identifier: %@, conversation: %@ }", buf, 0x20u);
  }
  objc_initWeak((id *)buf, self);
  BOOL v12 = [(SRSiriViewController *)self _conversationStore];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003F9F8;
  v13[3] = &unk_100143AB8;
  objc_copyWeak(&v17, (id *)buf);
  id v14 = v5;
  id v15 = v6;
  id v16 = v4;
  [v12 saveConversation:v15 withIdentifier:v14 completionBlock:v13];

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
LABEL_11:
}

- (void)_deleteConversationWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSiriViewController *)self _previousConversation];
  id v6 = [v5 identifier];
  unsigned int v7 = [v4 isEqual:v6];

  if (v7) {
    [(SRSiriViewController *)self _removePreviousConversationFromStore];
  }
  unsigned __int8 v8 = [(SRSiriViewController *)self _conversations];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003FC98;
  v12[3] = &unk_100143AE0;
  id v9 = v4;
  id v13 = v9;
  id v10 = [v8 indexOfObjectPassingTest:v12];

  if (v10 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    double v11 = [(SRSiriViewController *)self _conversations];
    [v11 removeObjectAtIndex:v10];
  }
}

- (void)_deletePreviousConversation
{
  id v3 = [(SRSiriViewController *)self _previousConversation];
  if (v3)
  {
    id v5 = v3;
    id v4 = [v3 identifier];
    [(SRSiriViewController *)self _deleteConversationWithIdentifier:v4];

    id v3 = v5;
  }
}

- (id)_startNewConversation
{
  id v3 = [(SRSiriViewController *)self _activeConversation];

  if (v3) {
    [(SRSiriViewController *)self _saveConversationWithCompletion:0];
  }
  id v4 = objc_alloc((Class)AFConversation);
  id v5 = [(SRSiriViewController *)self _language];
  uint64_t v6 = [v5 spokenLanguageCode];
  id v7 = [v4 initWithLanguageCode:v6];

  [v7 setDelegate:self];
  [(SRSiriViewController *)self _activateConversation:v7];
  unsigned __int8 v8 = [(SRSiriViewController *)self _presentation];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v9 = [(SRSiriViewController *)self _presentation];
    id v10 = [v7 identifier];
    [v9 siriDidStartNewConversationWithIdentifier:v10];
  }
  double v11 = [v7 identifier];

  return v11;
}

- (void)_restorePreviousConversation
{
  unsigned __int8 v3 = [(SRPreferences *)self->_preferences siriIsActive];
  [(SRPreferences *)self->_preferences setSiriIsActive:1];
  if ((v3 & 1) == 0)
  {
    if ((self->_lockState & 2) != 0)
    {
      id v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id location = 136315394;
        *(void *)&location[4] = "-[SRSiriViewController _restorePreviousConversation]";
        __int16 v9 = 2112;
        uint64_t v10 = AFUIPreviousConversationIdentifier;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #conversation Host not allowing SR to load previous conversation { identifier: %@ }", location, 0x16u);
      }
    }
    else
    {
      objc_initWeak((id *)location, self);
      conversationStore = self->_conversationStore;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_100040028;
      v6[3] = &unk_100143B58;
      objc_copyWeak(&v7, (id *)location);
      [(AFConversationStore *)conversationStore fetchConversationWithIdentifier:AFUIPreviousConversationIdentifier completionBlock:v6];
      objc_destroyWeak(&v7);
      objc_destroyWeak((id *)location);
    }
  }
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  id v6 = a4;
  unsigned int v7 = [(SRSiriViewController *)self textInputEnabled];
  if (a3 == 1 && v7) {
    [(SRSiriViewController *)self _setShowKeyboardIfTextInputEnabled:1 minimized:+[UIKeyboard isInHardwareKeyboardMode] ^ 1];
  }
  v8.receiver = self;
  v8.super_class = (Class)SRSiriViewController;
  [(SRSiriViewController *)&v8 motionEnded:a3 withEvent:v6];
}

- (id)_previousConversation
{
  id v2 = [(SRSiriViewController *)self _conversations];
  unsigned __int8 v3 = (char *)[v2 count];
  if ((unint64_t)v3 < 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v2 objectAtIndex:v3 - 2];
  }

  return v4;
}

- (BOOL)_languageMatchesConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSiriViewController *)self _language];
  id v6 = [v5 spokenLanguageCode];
  unsigned int v7 = [v4 languageCode];

  LOBYTE(v4) = [v6 isEqualToString:v7];
  return (char)v4;
}

- (id)_delayedConversationItemRevisionIdentifiers
{
  delayedConversationItemRevisionIdentifiers = self->_delayedConversationItemRevisionIdentifiers;
  if (!delayedConversationItemRevisionIdentifiers)
  {
    id v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v5 = self->_delayedConversationItemRevisionIdentifiers;
    self->_delayedConversationItemRevisionIdentifiers = v4;

    delayedConversationItemRevisionIdentifiers = self->_delayedConversationItemRevisionIdentifiers;
  }

  return delayedConversationItemRevisionIdentifiers;
}

- (id)_presentedConversationItemRevisionIdentifiers
{
  presentedConversationItemRevisionIdentifiers = self->_presentedConversationItemRevisionIdentifiers;
  if (!presentedConversationItemRevisionIdentifiers)
  {
    id v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v5 = self->_presentedConversationItemRevisionIdentifiers;
    self->_presentedConversationItemRevisionIdentifiers = v4;

    presentedConversationItemRevisionIdentifiers = self->_presentedConversationItemRevisionIdentifiers;
  }

  return presentedConversationItemRevisionIdentifiers;
}

- (id)_pendingPreSynthesisTasks
{
  pendingPreSynthesisTasks = self->_pendingPreSynthesisTasks;
  if (!pendingPreSynthesisTasks)
  {
    id v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v5 = self->_pendingPreSynthesisTasks;
    self->_pendingPreSynthesisTasks = v4;

    pendingPreSynthesisTasks = self->_pendingPreSynthesisTasks;
  }

  return pendingPreSynthesisTasks;
}

- (NSMutableSet)_completedCommandAppPunchOutIds
{
  completedCommandAppPunchOutIds = self->_completedCommandAppPunchOutIds;
  if (!completedCommandAppPunchOutIds)
  {
    id v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v5 = self->_completedCommandAppPunchOutIds;
    self->_completedCommandAppPunchOutIds = v4;

    completedCommandAppPunchOutIds = self->_completedCommandAppPunchOutIds;
  }

  return completedCommandAppPunchOutIds;
}

- (void)setHostFrontMostAppOrientation:(int64_t)a3
{
  id v4 = +[SRApplication sharedApplication];
  [v4 setFrontMostAppOrientation:a3];
}

- (void)siriWillActivateFromSource:(int64_t)a3
{
  id v5 = [(SRSiriViewController *)self _presentation];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    unsigned int v7 = [(SRSiriViewController *)self _presentation];
    [v7 siriWillActivateFromSource:a3];
  }

  [(SRSiriViewController *)self _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded];
}

- (void)siriDidActivateFromSource:(int64_t)a3
{
  id v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    char v6 = v5;
    unsigned int v7 = +[NSNumber numberWithInteger:a3];
    int v17 = 136315394;
    uint64_t v18 = "-[SRSiriViewController siriDidActivateFromSource:]";
    __int16 v19 = 2112;
    __int16 v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s source: %@", (uint8_t *)&v17, 0x16u);
  }
  objc_super v8 = [(SRSiriViewController *)self _presentation];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(SRSiriViewController *)self _presentation];
    [v10 siriDidActivateFromSource:a3];
  }
  testingContext = self->_testingContext;
  if (testingContext)
  {
    uint64_t v12 = SUICPPTTestNameKey;
    uint64_t v13 = [(NSDictionary *)testingContext objectForKey:SUICPPTTestNameKey];
    if (v13)
    {
      id v14 = (void *)v13;
      id v15 = [(NSDictionary *)self->_testingContext objectForKey:v12];
      unsigned __int8 v16 = [v15 hasPrefix:SUICPPTSiriBringupTestPrefix];

      if ((v16 & 1) == 0) {
        [(SRSiriViewController *)self runPPTWithOptions:self->_testingContext];
      }
    }
  }
}

- (void)siriWillBePresented:(int64_t)a3
{
  id v5 = [(SRSiriViewController *)self _presentation];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SRSiriViewController *)self _presentation];
    [v7 siriWillBePresented:a3];
  }
}

- (void)siriDidDeactivateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SRSiriViewController siriDidDeactivateWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&buf, 0xCu);
  }
  char v6 = objc_alloc_init(SRPreferences);
  if ([UIApp activeInterfaceOrientation]) {
    -[SRPreferences setLastKnownInterfaceOrientation:](v6, "setLastKnownInterfaceOrientation:", [UIApp activeInterfaceOrientation]);
  }
  if (![(SRPreferences *)v6 hasPresentedSiriAdvancedFeaturesAssetsDownloadNotification]&& [(SRSiriViewController *)self _shouldShowDownloadAssetsNotificationPrompt]&& +[SRAssetsUtilities shouldShowAssetDownloadBanner])
  {
    id v7 = objc_alloc_init(_TtC4Siri36SRAssetsDownloadBannerViewController);
    bannerViewController = self->_bannerViewController;
    self->_bannerViewController = v7;

    [(SRAssetsDownloadBannerViewController *)self->_bannerViewController showBannerFor:3.0];
    [(SRPreferences *)v6 setHasPresentedSiriAdvancedFeaturesAssetsDownloadNotification:1];
  }
  char v9 = dispatch_group_create();
  uint64_t v10 = [(SRSiriViewController *)self _presentation];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    dispatch_group_enter(v9);
    uint64_t v12 = [(SRSiriViewController *)self _presentation];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000411A8;
    v34[3] = &unk_100142E88;
    v35 = v9;
    [v12 siriDidDeactivateWithCompletion:v34];

    uint64_t v13 = v35;
  }
  else
  {
    id v14 = [(SRSiriViewController *)self _presentation];
    char v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) == 0) {
      goto LABEL_14;
    }
    uint64_t v13 = [(SRSiriViewController *)self _presentation];
    [v13 siriDidDeactivate];
  }

LABEL_14:
  unsigned __int8 v16 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[SRSiriViewController siriDidDeactivateWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s #tts Siri deactivating. Cancelling any in flight TTS so we can release the audio session", (uint8_t *)&buf, 0xCu);
  }
  [(SRSiriViewController *)self _cancelSpeechSynthesis];
  int v17 = [(SRSiriViewController *)self _requestOptions];
  BOOL v18 = [v17 requestSource] == (id)8;

  if (v18
    && (id)[(SRSiriViewController *)self _siriState] != (id)3
    && [(SRSiriViewController *)self _siriState])
  {
    *(void *)v41 = 0;
    *(void *)&v41[8] = v41;
    *(void *)&v41[16] = 0x2050000000;
    __int16 v19 = (void *)qword_100171E28;
    uint64_t v42 = qword_100171E28;
    if (!qword_100171E28)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      uint64_t v37 = (uint64_t)sub_10005D468;
      uint64_t v38 = (uint64_t (*)(uint64_t, uint64_t))&unk_100143B80;
      v39 = (void (*)(uint64_t))v41;
      sub_10005D468((uint64_t)&buf);
      __int16 v19 = *(void **)(*(void *)&v41[8] + 24);
    }
    id v20 = v19;
    _Block_object_dispose(v41, 8);
    [v20 notifyVoiceTriggeredSiriSessionCancelled];
  }
  id v21 = [(SRSiriViewController *)self _preferences];
  [v21 setSiriIsActive:0];

  __int16 v22 = [(SRSiriViewController *)self _activeConversation];
  id v23 = objc_alloc_init((Class)NSIndexPath);
  BOOL v24 = (uint64_t)[v22 numberOfChildrenForItemAtIndexPath:v23] > 0;

  if (v24)
  {
    dispatch_group_enter(v9);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000411B0;
    v32[3] = &unk_100142E88;
    v33 = v9;
    [(SRSiriViewController *)self _saveConversationWithCompletion:v32];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  uint64_t v38 = sub_10003F330;
  v39 = sub_10003F340;
  v40 = objc_alloc_init(SRBackgroundTaskManager);
  id v25 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v26 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)v41 = 136315394;
    *(void *)&v41[4] = "-[SRSiriViewController siriDidDeactivateWithCompletion:]";
    *(_WORD *)&v41[12] = 2112;
    *(void *)&v41[14] = v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s Taking %@ to flush instrumentation", v41, 0x16u);
  }
  v27 = +[SRUIFInstrumentationManager sharedManager];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000411B8;
  v31[3] = &unk_100143B80;
  v31[4] = &buf;
  [v27 boostQueuedMessagesAndPerformOnQueueCompletion:v31 timeout:2.0];

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100041290;
  v29[3] = &unk_100143690;
  id v30 = v4;
  id v28 = v4;
  dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, v29);

  _Block_object_dispose(&buf, 8);
}

- (void)didReceiveOrbViewTapToCancelRequest
{
  unsigned __int8 v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SRSiriViewController *)self _presentation];
    [v5 didReceiveOrbViewTapToCancelRequest];
  }
}

- (void)siriWillShowPasscodeUnlockAndCancelRequest:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SRSiriViewController *)self _presentation];
  char v6 = objc_opt_respondsToSelector();

  id v7 = [(SRSiriViewController *)self _presentation];
  id v9 = v7;
  if (v6)
  {
    [v7 siriWillShowPasscodeUnlockAndCancelRequest:v3];
  }
  else
  {
    char v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0) {
      return;
    }
    id v9 = [(SRSiriViewController *)self _presentation];
    [v9 siriWillShowPasscodeUnlock];
  }
}

- (void)siriWillShowPasscodeUnlock
{
}

- (void)siriWillHidePasscodeUnlockForResult:(int64_t)a3
{
  char v4 = [(SRSiriViewController *)self _presentation];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SRSiriViewController *)self _presentation];
    [v6 siriWillHidePasscodeUnlock];
  }
}

- (void)siriDidHidePasscodeUnlock
{
  BOOL v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SRSiriViewController *)self _presentation];
    [v5 siriDidHidePasscodeUnlock];
  }
}

- (void)showAppUnlockForAppId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SRSiriViewController *)self siriWillShowPasscodeUnlockAndCancelRequest:1];
  char v8 = +[APApplication applicationWithBundleIdentifier:v6];
  id v9 = +[APGuard sharedGuard];
  uint64_t v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    unsigned __int8 v16 = "-[SRSiriViewController showAppUnlockForAppId:completion:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Authenticating via APGuard for App Unlock, appId=%@", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10004170C;
  v12[3] = &unk_100143BA8;
  objc_copyWeak(&v14, (id *)buf);
  id v11 = v7;
  id v13 = v11;
  [v9 authenticateForSubject:v8 relayingAuditToken:1 completion:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)startRequestForText:(id)a3
{
  id v4 = a3;
  id v5 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  if ([v6 length])
  {
    id v7 = [(SRSiriViewController *)self _presentation];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = [(SRSiriViewController *)self _presentation];
      [v9 siriWillStartTextInputRequest];
    }
    id v10 = [objc_alloc((Class)SASRequestOptions) initWithRequestSource:23];
    [v10 setText:v6];
    objc_storeStrong((id *)&self->_requestText, v6);
    [(SRSiriViewController *)self _startRequestWithOptions:v10];
    id v11 = [(SRSiriViewController *)self _host];
    [v11 serviceDidResetTextInput];
  }
  else
  {
    uint64_t v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B8400(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

- (void)startRequestForSuggestion:(id)a3 inputType:(int64_t)a4
{
  id v6 = a3;
  id v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  char v8 = [v6 stringByTrimmingCharactersInSet:v7];

  if ([v8 length])
  {
    id v9 = [objc_alloc((Class)SASRequestOptions) initWithRequestSource:50];
    [v9 setText:v8];
    id v10 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      uint64_t v12 = SASRequestInputTypeGetDescription();
      int v13 = 136315394;
      uint64_t v14 = "-[SRSiriViewController startRequestForSuggestion:inputType:]";
      __int16 v15 = 2112;
      uint64_t v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #suggestions startRequestForSuggestion inputType: %@", (uint8_t *)&v13, 0x16u);
    }
    [v9 setPreviousInteractionInputType:a4];
    objc_storeStrong((id *)&self->_requestText, v8);
    [(SRSiriViewController *)self _startRequestWithOptions:v9];
  }
}

- (void)siriKeyboardViewDidChange:(id *)a3
{
  if (a3)
  {
    id v5 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
      sub_1000B8478((uint64_t)self, v5, (uint64_t)a3);
    }
    p_keyboardInfo = &self->_keyboardInfo;
    long long v8 = *(_OWORD *)&a3->var3.origin.y;
    long long v7 = *(_OWORD *)&a3->var3.size.height;
    *(_OWORD *)&self->_keyboardInfo.enabled = *(_OWORD *)&a3->var0;
    *(_OWORD *)&self->_keyboardInfo.keyboardFrame.origin.CGFloat y = v8;
    *(_OWORD *)&self->_keyboardInfo.keyboardFrame.size.CGFloat height = v7;
    id v9 = [(SRSiriViewController *)self _presentation];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(SRSiriViewController *)self _presentation];
      long long v12 = *(_OWORD *)&p_keyboardInfo->keyboardFrame.origin.y;
      v13[0] = *(_OWORD *)&p_keyboardInfo->enabled;
      v13[1] = v12;
      v13[2] = *(_OWORD *)&p_keyboardInfo->keyboardFrame.size.height;
      [v11 updateKeyboardInfo:v13];
    }
  }
}

- (BOOL)_siriIsShowingPasscodeUnlock
{
  BOOL v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 0;
  }
  id v5 = [(SRSiriViewController *)self _presentation];
  unsigned __int8 v6 = [v5 siriIsShowingPasscodeUnlock];

  return v6;
}

- (void)setSession:(id)a3
{
  id v5 = (AFUISiriSession *)a3;
  p_session = &self->_session;
  if (self->_session != v5)
  {
    long long v7 = v5;
    objc_storeStrong((id *)p_session, a3);
    id v5 = v7;
  }

  _objc_release_x1(p_session, v5);
}

- (void)_setShowKeyboardIfTextInputEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SRSiriViewController *)self _host];
  [v4 serviceDidRequestKeyboard:v3];
}

- (void)_setShowKeyboardIfTextInputEnabled:(BOOL)a3 minimized:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v6 = [(SRSiriViewController *)self _host];
  [v6 serviceDidRequestKeyboard:v5 minimized:v4];
}

- (void)didReceiveHelpAction
{
  BOOL v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SRSiriViewController *)self _presentation];
    [v5 didReceiveHelpAction];
  }
}

- (void)didReceiveReportBugAction
{
  BOOL v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v13 = [(SRSiriViewController *)self _presentation];
    [v13 didReceiveReportBugAction];
  }
  else
  {
    id v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B8558(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

- (void)didReceiveBugButtonLongPress
{
  BOOL v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SRSiriViewController *)self _presentation];
    [v5 didReceiveBugButtonLongPress];
  }
}

- (void)didReceiveShortTapActionWIthRequestOptions:(id)a3
{
  id v7 = a3;
  char v4 = [(SRSiriViewController *)self _presentation];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(SRSiriViewController *)self _presentation];
    [v6 shortTapActionWithRequestOptions:v7];
  }
}

- (void)_dismissWithReason:(int64_t)a3
{
  char v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    id v7 = SASDismissalReasonGetName();
    int v13 = 136315394;
    uint64_t v14 = "-[SRSiriViewController _dismissWithReason:]";
    __int16 v15 = 2112;
    uint64_t v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #punchout 9 %@", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v8 = [(SRSiriViewController *)self _presentation];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    uint64_t v10 = [(SRSiriViewController *)self _presentation];
    uint64_t v11 = [v10 dismissalUserInfo];
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = [(SRSiriViewController *)self _hostWithErrorHandler:&stru_100143BE8];
  [v12 serviceRequestsDismissalWithUserInfo:v11 withReason:a3];
}

- (void)hostApplicationWillResignActive
{
  BOOL v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [(SRSiriViewController *)self _presentation];
    [v5 hostApplicationWillResignActive];
  }
  id v6 = [(SRSiriViewController *)self _instrumentationManager];
  [v6 hostWillResignActive];
}

- (void)hostApplicationWillEnterForeground
{
  BOOL v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SRSiriViewController *)self _presentation];
    [v5 hostApplicationWillEnterForeground];
  }
}

- (void)hostApplicationDidBecomeActive
{
  BOOL v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SRSiriViewController *)self _presentation];
    [v5 hostApplicationDidBecomeActive];
  }
  id v6 = [(SRSiriViewController *)self _instrumentationManager];
  [v6 hostDidBecomeActive];
}

- (void)setWaitingForTelephonyToStart:(BOOL)a3
{
  self->_waitingForTelephonyToStart = a3;
}

- (void)hostApplicationRequestsEmitUIStateTransitionForSiriDismissalWithReason:(int)a3 completion:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  char v9 = (void (**)(id, void *))a4;
  id v5 = +[SRUIFInstrumentationManager sharedManager];
  [v5 emitUIStateTransitionForSiriDismissalWithReason:v4];

  id v6 = +[SRUIFInstrumentationManager sharedManager];
  id v7 = [v6 currentInstrumentationTurnContext];
  uint64_t v8 = [v7 turnIdentifier];

  if (v9) {
    v9[2](v9, v8);
  }
}

- (void)hostApplicationRequestsEmitInstrumentationEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSiriViewController *)self _instrumentationManager];
  [v5 emitInstrumentation:v4];
}

- (void)hostApplicationRequestsEmitInstrumentationEvent:(id)a3 atTime:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(SRSiriViewController *)self _instrumentationManager];
  [v7 emitInstrumentation:v6 atTime:a4];
}

- (void)hostApplicationRequestsScreenshotWithCompletion:(id)a3
{
  BOOL v3 = (void (**)(id, uint64_t))a3;
  id v4 = objc_alloc_init((Class)SSUIService);
  [v4 showScreenshotUI];
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SRSiriViewController hostApplicationRequestsScreenshotWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #screenshot: taking screenshot", (uint8_t *)&v6, 0xCu);
  }
  if (v3) {
    v3[2](v3, 1);
  }
}

- (void)hasContentAtPoint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void (**)(void, void))v7;
  if (!self->_preventOutsideTouchesFromDismissingSiri)
  {
    if (!v6)
    {
      uint64_t v10 = 1;
      if (!v7) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    [v6 CGPointValue];
    double v12 = v11;
    double v14 = v13;
    if (!SiriUIIsValidPoint())
    {
      char v18 = 1;
LABEL_18:
      uint64_t v10 = v18 & 1;
      if (v8) {
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    __int16 v15 = [(SRSiriViewController *)self presentation];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v15, "hasContentAtPoint:", v12, v14) & 1) == 0)
    {
      uint64_t v19 = [(SRSiriViewController *)self parentViewController];
      id v20 = [v19 presentedViewController];

      if (v20)
      {
        id v21 = [v20 view];
        [v21 frame];
        v60.double x = v12;
        v60.double y = v14;
        BOOL v22 = CGRectContainsPoint(v62, v60);

        if (v22)
        {
          id v23 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            v59 = "-[SRSiriViewController hasContentAtPoint:completion:]";
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s #dismissal - found content at point in presented alert view controller", buf, 0xCu);
          }

          goto LABEL_13;
        }
      }

      p_systemContentFrame = &self->_systemContentFrame;
      double height = self->_systemContentFrame.size.height;
      if (height == 0.0) {
        goto LABEL_38;
      }
      double x = p_systemContentFrame->origin.x;
      double y = self->_systemContentFrame.origin.y;
      double width = self->_systemContentFrame.size.width;
      if ([UIApp activeInterfaceOrientation] == (id)3)
      {
        id v29 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          v59 = "-[SRSiriViewController hasContentAtPoint:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s #dismissal - converting system content frame to landscape right", buf, 0xCu);
        }
        id v30 = [(SRSiriViewController *)self view];
        [v30 frame];
        double v32 = v31;

        double height = self->_systemContentFrame.size.width;
        double width = self->_systemContentFrame.size.height;
        double v33 = v32 - height;
        double x = self->_systemContentFrame.origin.y;
        double y = v33 - p_systemContentFrame->origin.x;
      }
      else if ([UIApp activeInterfaceOrientation] == (id)4)
      {
        v34 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315138;
          v59 = "-[SRSiriViewController hasContentAtPoint:completion:]";
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s #dismissal - converting system content frame to landscape left", buf, 0xCu);
        }
        v35 = [(SRSiriViewController *)self view];
        [v35 frame];
        double v37 = v36;

        double height = self->_systemContentFrame.size.width;
        double width = self->_systemContentFrame.size.height;
        double y = p_systemContentFrame->origin.x;
        double x = v37 - width - self->_systemContentFrame.origin.y;
      }
      v63.origin.double x = x;
      v63.origin.double y = y;
      v63.size.double width = width;
      v63.size.double height = height;
      v61.double x = v12;
      v61.double y = v14;
      if (!CGRectContainsPoint(v63, v61))
      {
LABEL_38:
        v51 = v15;
        v52 = v8;
        uint64_t v38 = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:0];
        v39 = [(SRSiriViewController *)self view];
        v40 = [v39 window];

        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v41 = v38;
        id v42 = [v41 countByEnumeratingWithState:&v53 objects:v57 count:16];
        if (v42)
        {
          id v43 = v42;
          char v18 = 0;
          uint64_t v44 = *(void *)v54;
          do
          {
            for (i = 0; i != v43; i = (char *)i + 1)
            {
              if (*(void *)v54 != v44) {
                objc_enumerationMutation(v41);
              }
              id v46 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              if (v46 != v40)
              {
                objc_super v47 = [v46 hitTest:0 withEvent:v12, v14];
                if (v47)
                {
                  v48 = AFSiriLogContextConnection;
                  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long buf = 136315138;
                    v59 = "-[SRSiriViewController hasContentAtPoint:completion:]";
                    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%s #dismissal - found content at point in additional windows used by Siri, but not owned by Siri.", buf, 0xCu);
                  }
                  char v18 = 1;
                }
              }
            }
            id v43 = [v41 countByEnumeratingWithState:&v53 objects:v57 count:16];
          }
          while (v43);
        }
        else
        {
          char v18 = 0;
        }

        if ((v18 & 1) == 0)
        {
          v49 = +[SiriSharedUIReplayUtilityWrapper sharedInstance];
          unsigned int v50 = [v49 hasContentAtPoint:v12, v14];

          if (v50) {
            char v18 = 1;
          }
        }
        uint64_t v8 = v52;
        __int16 v15 = v51;
        goto LABEL_14;
      }
      uint64_t v16 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        v59 = "-[SRSiriViewController hasContentAtPoint:completion:]";
        uint64_t v17 = "%s #dismissal - found content at point in system aperture";
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v16 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        v59 = "-[SRSiriViewController hasContentAtPoint:completion:]";
        uint64_t v17 = "%s #dismissal - found content at point in Presentation";
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 0xCu);
      }
    }
LABEL_13:
    char v18 = 1;
LABEL_14:

    goto LABEL_18;
  }
  char v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v59 = "-[SRSiriViewController hasContentAtPoint:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #dismissal - skipping content at point because _preventOutsideTouchesFromDismissingSiri is YES", buf, 0xCu);
  }
  if (v8)
  {
    uint64_t v10 = 1;
LABEL_19:
    v8[2](v8, v10);
  }
LABEL_20:
}

- (void)didDetectGestureEvent:(int64_t)a3 inRegion:(int64_t)a4
{
  id v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_1000B8644(v7, (void *)a3);
  }
  uint64_t v8 = [(SRSiriViewController *)self presentation];
  if (objc_opt_respondsToSelector()) {
    [v8 didDetectGestureEvent:a3 inRegion:a4];
  }
}

- (void)siriWillBeginTearDownForDismissalReason:(int64_t)a3 withOriginalDismissalOptions:(id)a4
{
  id v8 = a4;
  id v6 = [(SRSiriViewController *)self presentation];
  if (objc_opt_respondsToSelector())
  {
    [v6 siriWillBeginTearDownForDismissalReason:a3 withOriginalDismissalOptions:v8];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v6 siriWillBeginTearDownForDismissalReason:a3];
  }
  [(SRSiriSystemUIController *)self->_systemUIController tearDown];
  systemUIController = self->_systemUIController;
  self->_systemUIController = 0;
}

- (void)dismissSiriResults
{
  id v2 = [(SRSiriViewController *)self presentation];
  if (objc_opt_respondsToSelector()) {
    [v2 dismissSiriResults];
  }
}

- (void)hostApplicationPresentationStateUpdatedFromPresentationState:(int64_t)a3 toPresentationState:(int64_t)a4
{
  self->_presentationState = a4;
  id v7 = [(SRSiriViewController *)self presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SRSiriViewController *)self presentation];
    [v9 presentationStateUpdatedFromPresentationState:a3 toPresentationState:a4];
  }
}

- (void)hostApplicationDidSuccessfullyHandleCommandsInDelayedActionCommand:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    BOOL requestActive = self->_requestActive;
    BOOL listenAfterSpeakingForRequestFinished = self->_listenAfterSpeakingForRequestFinished;
    int v8 = 136315650;
    id v9 = "-[SRSiriViewController hostApplicationDidSuccessfullyHandleCommandsInDelayedActionCommand:]";
    __int16 v10 = 1024;
    BOOL v11 = requestActive;
    __int16 v12 = 1024;
    BOOL v13 = listenAfterSpeakingForRequestFinished;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Request Active:%d, LAS: %d", (uint8_t *)&v8, 0x18u);
  }
  if (!self->_requestActive && self->_listenAfterSpeakingForRequestFinished)
  {
    [(SRSiriViewController *)self _startListenAfterSpeaking];
    [(SRSiriViewController *)self _setListenAfterSpeakingForRequestFinished:0];
  }
}

- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4
{
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_1000B86FC(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  __int16 v15 = [(SRSiriViewController *)self presentation];
  if (objc_opt_respondsToSelector()) {
    [v15 animatedDisappearanceDidBeginWithDuration:a4 reason:a3];
  }
}

- (void)setPresentation:(id)a3
{
}

- (void)setPresentation:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  uint64_t v9 = (SiriUIPresentation *)a3;
  uint64_t v10 = (Block_layout *)a5;
  uint64_t v11 = v10;
  p_presentation = &self->_presentation;
  if (self->_presentation != v9)
  {
    uint64_t v13 = [(SRSiriViewController *)self view];
    uint64_t v14 = [v13 window];
    [v14 frame];
    v54.origin.double x = CGRectZero.origin.x;
    v54.origin.double y = CGRectZero.origin.y;
    v54.size.double width = CGRectZero.size.width;
    v54.size.double height = CGRectZero.size.height;
    BOOL v15 = CGRectEqualToRect(v53, v54);

    if (v15)
    {
      uint64_t v16 = [(SRSiriViewController *)self view];
      uint64_t v17 = [v16 window];
      char v18 = +[UIScreen mainScreen];
      [v18 bounds];
      [v17 setFrame:];
    }
    uint64_t v19 = *p_presentation;
    id v20 = [(SRSiriViewController *)self _presentationViewController];
    id v21 = AFSiriLogContextConnection;
    BOOL v22 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (!v22) {
        goto LABEL_14;
      }
      CFStringRef v23 = &stru_1001463E0;
      *(_DWORD *)long long buf = 136315906;
      id v46 = "-[SRSiriViewController setPresentation:animated:completion:]";
      if (v6) {
        CFStringRef v23 = @" (animated)";
      }
      __int16 v47 = 2112;
      v48 = v19;
      __int16 v49 = 2112;
      unsigned int v50 = v9;
      __int16 v51 = 2112;
      CFStringRef v52 = v23;
      BOOL v24 = "%s Transitioning from presentation %@ to presentation %@%@";
      id v25 = v21;
      uint32_t v26 = 42;
    }
    else
    {
      if (!v22) {
        goto LABEL_14;
      }
      *(_DWORD *)long long buf = 136315394;
      id v46 = "-[SRSiriViewController setPresentation:animated:completion:]";
      __int16 v47 = 2112;
      v48 = v9;
      BOOL v24 = "%s Setting initial presentation to %@";
      id v25 = v21;
      uint32_t v26 = 22;
    }
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
LABEL_14:
    if (objc_opt_respondsToSelector()) {
      [(SiriUIPresentation *)*p_presentation setDataSource:0];
    }
    if (objc_opt_respondsToSelector()) {
      [(SiriUIPresentation *)*p_presentation setDelegate:0];
    }
    objc_storeStrong((id *)&self->_presentation, a3);
    if (objc_opt_respondsToSelector()) {
      [(SiriUIPresentation *)*p_presentation setDelegate:self];
    }
    if (objc_opt_respondsToSelector()) {
      [(SiriUIPresentation *)*p_presentation setDataSource:self];
    }
    if (objc_opt_respondsToSelector()) {
      [(SiriUIPresentation *)*p_presentation setBottomContentInset:self->_bottomContentInset];
    }
    if (objc_opt_respondsToSelector()) {
      [(SiriUIPresentation *)*p_presentation setTopContentInset:1 animated:CGRectGetMaxY(self->_systemContentFrame)];
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v27 = [(SiriUIPresentation *)*p_presentation shouldAllowTouchPassThrough] ^ 1;
    }
    else {
      uint64_t v27 = 1;
    }
    id v28 = [(SRSiriViewController *)self view];
    id v29 = [v28 layer];
    [v29 setHitTestsAsOpaque:v27];

    id v30 = [(SRSiriViewController *)self _presentationViewController];
    if (v30)
    {
      [(SRSiriViewController *)self addChildViewController:v30];
      [v30 didMoveToParentViewController:self];
      if (v6 && v20)
      {
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_1000435A4;
        v42[3] = &unk_1001437A0;
        id v43 = v20;
        uint64_t v44 = v11;
        [(SRSiriViewController *)self transitionFromViewController:v43 toViewController:v30 duration:5242880 options:0 animations:v42 completion:0.2];

LABEL_49:
        goto LABEL_50;
      }
      double v31 = [v30 view];
      [v31 setAutoresizingMask:18];

      double v32 = [v30 view];
      double v33 = [(SRSiriViewController *)self view];
      [v33 bounds];
      [v32 setFrame:];

      v34 = [(SRSiriViewController *)self view];
      v35 = [v30 view];
      [v34 addSubview:v35];

      if (v20) {
        goto LABEL_36;
      }
      if (v19)
      {
        v40 = [(SRSiriViewController *)self _host];
        uint64_t v38 = v40;
        if (v11) {
          id v41 = v11;
        }
        else {
          id v41 = &stru_100143C28;
        }
        [v40 serviceViewControllerRequestsPresentation:v41];
        goto LABEL_48;
      }
    }
    else if (v20)
    {
LABEL_36:
      [v20 willMoveToParentViewController:0];
      double v36 = [v20 view];
      [v36 removeFromSuperview];

      [v20 removeFromParentViewController];
      if (v30) {
        goto LABEL_37;
      }
      double v37 = [(SRSiriViewController *)self _host];
      uint64_t v38 = v37;
      if (v11) {
        v39 = v11;
      }
      else {
        v39 = &stru_100143C48;
      }
      [v37 serviceViewControllerRequestsDismissalWithDismissalReason:0 completion:v39];
LABEL_48:

      goto LABEL_49;
    }
LABEL_37:
    if (v11) {
      v11->invoke(v11, 1);
    }
    goto LABEL_49;
  }
  if (v10) {
    v10->invoke(v10, 0);
  }
LABEL_50:
}

- (void)updateToPresentationWithIdentifier:(id)a3 presentationProperties:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v18 = a4;
  uint64_t v10 = (void (**)(id, void))a6;
  id v11 = a3;
  [(SRSiriViewController *)self _restorePreviousConversation];
  uint64_t v12 = +[SRSiriPresentationPluginHost sharedSiriPresentationPluginHost];
  uint64_t v13 = [v12 presentationWithIdentifier:v11 delegate:self dataSource:self];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v10) {
      v10[2](v10, 0);
    }
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v14 = [v18 objectForKey:AFUIPresentationPropertiesShouldSuppressErrorTTSKey];
      [v13 setShouldSuppressErrorTTS:[v14 BOOLValue]];
    }
    BOOL v15 = [v18 objectForKey:AFUIPresentationPropertiesRequestSourceKey];
    if (v15 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v13 siriWillActivateFromSource:[v15 integerValue]];
    }
    uint64_t v16 = [v18 objectForKey:AFUIPresentationPropertiesShowsSensitiveUIKey];
    id v17 = [v16 BOOLValue];

    if (v15 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v13 setShowsSensitiveUI:v17];
    }
    [(SRSiriViewController *)self setPresentation:v13 animated:v7 completion:v10];
  }
}

- (CGRect)frameForApplication:(id)a3
{
  id v4 = [(SRSiriViewController *)self _presentation];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    goto LABEL_3;
  }
  BOOL v6 = [(SRSiriViewController *)self _presentation];
  [v6 effectiveContentFrame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  v26.origin.double x = CGRectZero.origin.x;
  v26.origin.double y = CGRectZero.origin.y;
  v26.size.double width = CGRectZero.size.width;
  v26.size.double height = CGRectZero.size.height;
  v24.origin.double x = v8;
  v24.origin.double y = v10;
  v24.size.double width = v12;
  v24.size.double height = v14;
  if (CGRectEqualToRect(v24, v26))
  {
LABEL_3:
    BOOL v15 = [(SRSiriViewController *)self view];
    [v15 frame];
    CGFloat v8 = v16;
    CGFloat v10 = v17;
    CGFloat v12 = v18;
    CGFloat v14 = v19;
  }
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)_openURL:(id)a3 bundleId:(id)a4 inPlace:(BOOL)a5 conversationId:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  double v16 = [(SRSiriViewController *)self _punchoutMetricsAceCommandIdForItemWithIdentifier:v14];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100043AE4;
  v31[3] = &unk_100143C70;
  id v17 = v15;
  id v32 = v17;
  double v18 = [(SRSiriViewController *)self _hostWithErrorHandler:v31];
  objc_initWeak(&location, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100043B00;
  v23[3] = &unk_100143C98;
  objc_copyWeak(&v28, &location);
  id v19 = v12;
  id v24 = v19;
  id v20 = v13;
  id v25 = v20;
  BOOL v29 = v9;
  id v21 = v17;
  id v27 = v21;
  id v22 = v16;
  id v26 = v22;
  [v18 openURL:v19 bundleId:v20 inPlace:v9 completion:v23];

  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)_delayAceCommandSuccess:(id)a3 forDuration:(double)a4
{
  id v6 = a3;
  double v7 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v8 = v7;
    BOOL v9 = [v6 aceId];
    *(_DWORD *)long long buf = 136315650;
    double v16 = "-[SRSiriViewController _delayAceCommandSuccess:forDuration:]";
    __int16 v17 = 2048;
    double v18 = a4;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #aceCommandRecord scheduling a delayed action of %f seconds for command %@", buf, 0x20u);
  }
  [(SRSiriViewController *)self _didStartActionForAceCommand:v6];
  objc_initWeak((id *)buf, self);
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043E00;
  block[3] = &unk_100143CC0;
  v14[1] = *(id *)&a4;
  id v13 = v6;
  id v11 = v6;
  objc_copyWeak(v14, (id *)buf);
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(v14);

  objc_destroyWeak((id *)buf);
}

- (void)_didReceiveAceCommand:(id)a3
{
}

- (void)_didReceiveAceCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    id v11 = "-[SRSiriViewController _didReceiveAceCommand:completion:]";
    __int16 v12 = 2112;
    id v13 = self;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s %@ received ACE command: %@", (uint8_t *)&v10, 0x20u);
  }
  BOOL v9 = [(SRSiriViewController *)self _aceCommandRecords];
  [v9 registerAceCommand:v6 completion:v7];
}

- (void)_didStartActionForAceCommand:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [v4 _afui_updateMapsAnalytics];
  }
  char v5 = [(SRSiriViewController *)self _aceCommandRecords];
  [v5 recordActionStartedForAceCommand:v4];

  if ([(SASRequestOptions *)self->_requestOptions inputType] == (id)2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (AFIsInternalInstall())
      {
        CFStringRef v14 = @"bestTextInterpretation";
        id v6 = [v4 af_bestTextInterpretation];
        id v15 = v6;
        id v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      }
      else
      {
        id v7 = 0;
      }
      BOOL v9 = [(SRSiriViewController *)self _analytics];
      int v10 = v9;
      uint64_t v11 = 1505;
LABEL_14:
      [v9 logEventWithType:v11 context:v7];

      goto LABEL_15;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (AFIsInternalInstall())
      {
        CFStringRef v12 = @"bestTextInterpretation";
        CGFloat v8 = [v4 af_bestTextInterpretation];
        id v13 = v8;
        id v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
      }
      else
      {
        id v7 = 0;
      }
      BOOL v9 = [(SRSiriViewController *)self _analytics];
      int v10 = v9;
      uint64_t v11 = 1507;
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)_didStartActionForItemAtIndexPath:(id)a3 inConversation:(id)a4
{
  char v5 = [a4 itemAtIndexPath:a3];
  id v8 = [v5 aceCommandIdentifier];

  id v6 = v8;
  if (v8)
  {
    id v7 = [(SRSiriViewController *)self _aceCommandWithIdentifier:v8];
    [(SRSiriViewController *)self _didStartActionForAceCommand:v7];

    id v6 = v8;
  }
}

- (id)_aceCommandWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(SRSiriViewController *)self _aceCommandRecords];
  id v6 = [v5 aceCommandWithIdentifier:v4];

  return v6;
}

- (void)_speakText:(id)a3 identifier:(id)a4 sessionId:(id)a5 preferredVoice:(id)a6 provisionally:(BOOL)a7 eligibleAfterDuration:(double)a8 delayed:(BOOL)a9 canUseServerTTS:(BOOL)a10 speakableUtteranceParser:(id)a11 analyticsContext:(id)a12 speakableContextInfo:(id)a13 preparation:(id)a14 completion:(id)a15
{
  BYTE2(v15) = a10;
  BYTE1(v15) = a9;
  LOBYTE(v15) = a7;
  -[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:](self, "_speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:", a3, 0, 0, a4, a5, a6, a8, 0, 0, v15, a11, a12, a13, a14, a15);
}

- (void)_speakText:(id)a3 audioData:(id)a4 ignoreMuteSwitch:(BOOL)a5 identifier:(id)a6 sessionId:(id)a7 preferredVoice:(id)a8 language:(id)a9 gender:(id)a10 provisionally:(BOOL)a11 eligibleAfterDuration:(double)a12 delayed:(BOOL)a13 canUseServerTTS:(BOOL)a14 speakableUtteranceParser:(id)a15 analyticsContext:(id)a16 speakableContextInfo:(id)a17 preparation:(id)a18 completion:(id)a19
{
  id v42 = a3;
  id v24 = a4;
  id v39 = a6;
  id v40 = a7;
  id v41 = a8;
  id v25 = a9;
  id v26 = a10;
  id v27 = a15;
  id v28 = a16;
  id v29 = a17;
  id v30 = a18;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1000447AC;
  v61[3] = &unk_100143CE8;
  id v31 = a19;
  id v62 = v31;
  id v32 = objc_retainBlock(v61);
  if (v42)
  {
    id v33 = [v42 length];
    if (!v24 && !v33) {
      goto LABEL_4;
    }
  }
  else if (!v24)
  {
LABEL_4:
    ((void (*)(void *, uint64_t, void))v32[2])(v32, 2, 0);
    goto LABEL_11;
  }
  if (AFDeviceSupportsTTS())
  {
    objc_initWeak(location, self);
    session = self->_session;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000447C4;
    v43[3] = &unk_100143D60;
    objc_copyWeak(v57, location);
    CGRect v54 = v32;
    id v44 = v24;
    id v45 = v39;
    id v46 = v40;
    BOOL v58 = a11;
    v57[1] = *(id *)&a12;
    id v55 = v31;
    BOOL v59 = a14;
    id v47 = v42;
    id v48 = v27;
    id v56 = v30;
    id v49 = v41;
    id v50 = v25;
    id v51 = v26;
    BOOL v60 = a13;
    id v52 = v28;
    id v53 = v29;
    [(AFUISiriSession *)session forceAudioSessionActiveWithCompletion:v43];

    objc_destroyWeak(v57);
    objc_destroyWeak(location);
  }
  else
  {
    id v34 = v27;
    id v35 = v26;
    double v36 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:"
                                      "preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseS"
                                      "erverTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s TTS not available on certain devices, marking as finished", (uint8_t *)location, 0xCu);
    }
    ((void (*)(void *, uint64_t, void))v32[2])(v32, 1, 0);
    id v26 = v35;
    id v27 = v34;
  }
LABEL_11:
}

- (void)_didCompleteActionForAceCommand:(id)a3 success:(BOOL)a4
{
  BOOL v25 = a4;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ![(SRSiriViewController *)self _presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:v6])
  {
    double v23 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v32 = "-[SRSiriViewController _didCompleteActionForAceCommand:success:]";
      __int16 v33 = 2112;
      id v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s #tts 33 NOT recording SAUISayIt completed for SAUISayIt=%@", buf, 0x16u);
    }
    objc_storeStrong((id *)&self->_previousSayItCommand, a3);
    id v9 = [(SRSiriViewController *)self _aceCommandRecords];
    [v9 recordActionStoppedForAceCommand:v6];
    goto LABEL_20;
  }
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    id v32 = "-[SRSiriViewController _didCompleteActionForAceCommand:success:]";
    __int16 v33 = 2112;
    id v34 = v6;
    __int16 v35 = 1024;
    BOOL v36 = v25;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #tts 33 recording command completed for aceCommand=%@ success=%i", buf, 0x1Cu);
  }
  id v8 = [(SRSiriViewController *)self _aceCommandRecords];
  [v8 recordActionCompletedForAceCommand:v6 success:v25];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v6;
    int v10 = [v9 af_dialogPhase];
    unsigned __int8 v11 = [v10 isReflectionDialogPhase];

    if ((v11 & 1) == 0)
    {
      id v24 = v6;
      CFStringRef v12 = [(SRSiriViewController *)self _aceCommandRecords];
      id v13 = [v9 refId];
      CFStringRef v14 = [v12 pendingAddViewsWithReflectionDialogPhaseWithRefId:v13];

      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v15 = v14;
      id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v27;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v27 != v18) {
              objc_enumerationMutation(v15);
            }
            id v20 = *(void **)(*((void *)&v26 + 1) + 8 * i);
            id v21 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315650;
              id v32 = "-[SRSiriViewController _didCompleteActionForAceCommand:success:]";
              __int16 v33 = 2112;
              id v34 = v20;
              __int16 v35 = 1024;
              BOOL v36 = v25;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s #tts recording reflectionDialogPhase command completed command=%@ success=%i", buf, 0x1Cu);
            }
            id v22 = [(SRSiriViewController *)self _aceCommandRecords];
            [v22 recordActionCompletedForAceCommand:v20 success:1];
          }
          id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v17);
      }

      id v6 = v24;
    }
LABEL_20:
  }
}

- (BOOL)_presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:(id)a3
{
  id v4 = a3;
  char v5 = [(SRSiriViewController *)self presentation];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SRSiriViewController *)self presentation];
    id v8 = [v7 performSelector:"shouldProceedToNextCommandAtSpeechSynthesisEnd"];
    BOOL v9 = v8 != 0;

    int v10 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v11 = v10;
      CFStringRef v12 = [(SRSiriViewController *)self presentation];
      CFStringRef v13 = @"doesn't allow";
      int v15 = 136315906;
      id v16 = "-[SRSiriViewController _presentationAllowsRecordingActionCompletedForSpeechSynthesisCommand:]";
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      if (v8) {
        CFStringRef v13 = @"allows";
      }
      __int16 v19 = 2112;
      CFStringRef v20 = v13;
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #tts presentation:%@ %@ recording SAUISayIt=%@ completed", (uint8_t *)&v15, 0x2Au);
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_synthesizeSpeechWithText:(id)a3 identifier:(id)a4 sessionId:(id)a5 isPhonetic:(BOOL)a6 provisionally:(BOOL)a7 completion:(id)a8
{
  BOOL v10 = a6;
  id v14 = a3;
  if (a8) {
    int v15 = (Block_layout *)a8;
  }
  else {
    int v15 = &stru_100143DA0;
  }
  id v16 = a5;
  id v17 = a4;
  uint64_t v18 = objc_retainBlock(v15);
  __int16 v19 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    id v22 = "-[SRSiriViewController _synthesizeSpeechWithText:identifier:sessionId:isPhonetic:provisionally:completion:]";
    __int16 v23 = 2112;
    id v24 = v14;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s #tts Enqueueing text=\"%@\"", buf, 0x16u);
  }
  *(_WORD *)((char *)&v20 + 1) = 256;
  LOBYTE(v20) = a7;
  -[SRUIFSpeechSynthesizer enqueueText:identifier:sessionId:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:completion:analyticsContext:speakableContextInfo:](self->_ttsManager, "enqueueText:identifier:sessionId:language:gender:isPhonetic:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:preparationIdentifier:completion:analyticsContext:speakableContextInfo:", v14, v17, v16, 0, 0, v10, 0.4, v20, 0, v18, 0, 0);
}

- (void)_synthesizePhoneticText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6
{
}

- (void)_synthesizeProvisionalText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6
{
}

- (void)_synthesizeText:(id)a3 identifier:(id)a4 sessionId:(id)a5 completion:(id)a6
{
}

- (void)_cancelSpeechSynthesis
{
  BOOL v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    char v5 = "-[SRSiriViewController _cancelSpeechSynthesis]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  [(SRUIFSpeechSynthesizer *)self->_ttsManager cancel];
  [(SRSiriViewController *)self notifyClientStateManagerSpeakingEnded:0];
}

- (BOOL)_isSpeechSynthesisSpeaking
{
  return self->_synthesisIsSpeaking;
}

+ (id)_speechIdentifierForConversationItem:(id)a3
{
  id v3 = a3;
  int v4 = [v3 aceObject];
  char v5 = [v4 aceId];

  if (!v5)
  {
    char v5 = [v3 aceCommandIdentifier];
  }

  return v5;
}

- (void)speechSynthesisGetPreparedTextForIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  synthesisPreparationDictionardouble y = self->_synthesisPreparationDictionary;
  id v8 = (void (**)(id, void, uint64_t))a4;
  BOOL v9 = [(NSMutableDictionary *)synthesisPreparationDictionary objectForKey:v6];
  BOOL v10 = AFSiriLogContextConnection;
  if (v9)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      CFStringRef v12 = "-[SRSiriViewController speechSynthesisGetPreparedTextForIdentifier:completion:]";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #tts 11 A Getting text for preparation identifier %@", (uint8_t *)&v11, 0x16u);
    }
    ((void (**)(void, void (**)(id, void, uint64_t)))v9)[2](v9, v8);
  }
  else
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B88E4();
    }
    v8[2](v8, 0, 1);
  }

  [(NSMutableDictionary *)self->_synthesisPreparationDictionary removeObjectForKey:v6];
}

- (void)speechSynthesisDidStartSpeakingWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    BOOL v10 = "-[SRSiriViewController speechSynthesisDidStartSpeakingWithIdentifier:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #tts identifier=%@", (uint8_t *)&v9, 0x16u);
  }
  [UIApp finishedIPTest:SUICPPTTestNameSiriBringupToCarPlayMessageReading];
  self->_synthesisIsSpeaking = 1;
  self->_ttsSpokenForRequest = 1;
  [(SRSiriViewController *)self _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded];
  id v6 = [(SRSiriViewController *)self _presentation];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SRSiriViewController *)self _presentation];
    [v8 siriDidStartSpeakingWithIdentifier:v4];
  }
}

- (void)speechSynthesisDidStopSpeakingWithIdentifier:(id)a3 queueIsEmpty:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  char v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    id v24 = "-[SRSiriViewController speechSynthesisDidStopSpeakingWithIdentifier:queueIsEmpty:]";
    __int16 v25 = 2112;
    id v26 = v6;
    __int16 v27 = 1024;
    BOOL v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #tts #punchout 6 identifier=%@ queueIsEmpty=%i", buf, 0x1Cu);
  }
  self->_synthesisIsSpeaking = 0;
  if (v4 && self->_enqueuedSuggestion) {
    [(SRSiriViewController *)self _speakEnqueuedSpokenSuggestion];
  }
  [(SRSiriViewController *)self _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded];
  id v8 = [(SRSiriViewController *)self _presentation];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    BOOL v10 = [(SRSiriViewController *)self _presentation];
    [v10 siriDidStopSpeakingWithIdentifier:v6 speechQueueIsEmpty:v4];
  }
  if (v4 && self->_ttsDelayedBlocks)
  {
    __int16 v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      id v24 = "-[SRSiriViewController speechSynthesisDidStopSpeakingWithIdentifier:queueIsEmpty:]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #punchout 7 executing _ttsDelayedBlocks", buf, 0xCu);
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v12 = self->_ttsDelayedBlocks;
    id v13 = [(AFQueue *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(v12);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * i));
        }
        id v14 = [(AFQueue *)v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v14);
    }

    ttsDelayedBlocks = self->_ttsDelayedBlocks;
    self->_ttsDelayedBlocks = 0;
  }
}

- (void)speechSynthesisDidFinish:(id)a3
{
}

- (void)speechSynthesisDidUpdatePowerLevelTo:(float)a3
{
}

- (void)notifyClientStateManagerTransactionBegan:(id)a3
{
}

- (void)notifyClientStateManagerTransactionEnded:(id)a3
{
}

- (void)notifyClientStateManagerSpeakingBegan:(id)a3
{
}

- (void)notifyClientStateManagerSpeakingEnded:(id)a3
{
  BOOL v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SRSiriViewController notifyClientStateManagerSpeakingEnded:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #tts", (uint8_t *)&v5, 0xCu);
  }
  [(AFUISiriSession *)self->_session notifyStateManagerSpeakingEnded];
}

- (id)domainObjectForIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(SRSiriViewController *)self _domainObjectStorageConnection];
  id v6 = [v4 absoluteString];

  char v7 = [v5 domainObjectForKey:v6];

  id v8 = +[AceObject aceObjectWithDictionary:v7];

  return v8;
}

- (void)setDomainObject:(id)a3 forIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(SRSiriViewController *)self _domainObjectStorageConnection];
  id v8 = [v7 dictionary];

  char v9 = [v6 absoluteString];

  [v10 setDomainObject:v8 forKey:v9];
}

- (void)audioPlayerStartPlaying:(id)a3
{
  [(SRSiriViewController *)self _setAudioPlayerIsPlaying:1];
  if ([(SRSiriViewController *)self _usesEventDrivenIdleAndQuietUpdates])
  {
    [(SRSiriViewController *)self _checkAndUpdateSiriIdleAndQuietStatusIfNeeded];
  }
}

- (void)audioPlayer:(id)a3 didFinishPlayback:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  [(SRSiriViewController *)self _setAudioPlayerIsPlaying:0];
  if ([(SRSiriViewController *)self _usesEventDrivenIdleAndQuietUpdates]) {
    [(SRSiriViewController *)self _checkAndUpdateSiriIdleAndQuietStatusIfNeeded];
  }
  id v7 = [(SRSiriViewController *)self _session];
  [v7 forceAudioSessionActive];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SRSiriViewController *)self _didCompleteActionForAceCommand:v6 success:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [(SRSiriViewController *)self _activeConversation];
      char v9 = [v13 conversationItemIdentifier];
      id v10 = [v8 itemWithIdentifier:v9];

      __int16 v11 = [v10 aceCommandIdentifier];
      if (v11)
      {
        id v12 = [(SRSiriViewController *)self _aceCommandWithIdentifier:v11];
        [(SRSiriViewController *)self _didCompleteActionForAceCommand:v12 success:1];
        [v13 setConversationItemIdentifier:0];
      }
    }
  }
}

- (id)audioPlayer:(id)a3 audioURLForCommand:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v5 = [v4 message];
    if (!v5) {
      goto LABEL_16;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v5 = 0;
LABEL_16:
      id v13 = 0;
      goto LABEL_19;
    }
    id v6 = v4;
    id v7 = [v6 context];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      int v5 = [v6 context];
    }
    else
    {
      int v5 = 0;
    }

    if (!v5) {
      goto LABEL_16;
    }
  }
  char v9 = [v5 messageType];
  unsigned __int8 v10 = [v9 isEqualToString:SASmsSmsMessageTypeAudioMessageValue];

  if ((v10 & 1) == 0)
  {
    id v14 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B8958(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_16;
  }
  __int16 v11 = +[SiriUISnippetManager sharedInstance];
  id v12 = [v11 speakableProviderForObject:v5];

  if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v13 = [v12 attachmentURLForExpression:SASmsSmsDeferredMessageKeyValue];
  }
  else
  {
    id v13 = 0;
  }

LABEL_19:

  return v13;
}

- (void)aceCommandRecords:(id)a3 didChangeResultForCommand:(id)a4 completion:(id)a5
{
  id v10 = a5;
  id v7 = a4;
  id v8 = [(SRSiriViewController *)self _session];
  char v9 = v8;
  if (v10) {
    [v8 resultDidChangeForAceCommand:v7 completion:v10];
  }
  else {
    [v8 resultDidChangeForAceCommand:v7];
  }
}

- (void)siriSessionRequestsToShowAssetsDownloadNotificationPrompt
{
}

- (void)siriSessionWillProcessAceCommand:(id)a3
{
  id v7 = a3;
  if (_os_feature_enabled_impl()) {
    id v4 = (__objc2_class *)MDDialogTransformer;
  }
  else {
    id v4 = SRModeDialogTransformer;
  }
  if (([(__objc2_class *)v4 supportsTransformationForAceCommand:v7] & 1) == 0)
  {
    int v5 = [(SRSiriViewController *)self _analytics];
    id v6 = [(SRSiriViewController *)self _instrumentationManager];
    [v5 logClientFeedbackPresented:v7 dialogIdentifierProvider:v6];
  }
}

- (void)siriSessionResultForAceCommand:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v10 = [(SRSiriViewController *)self _aceCommandRecords];
  id v9 = [v10 resultForAceCommand:v8];

  (*((void (**)(id, id))a4 + 2))(v7, v9);
}

- (void)siriSessionWillStartRequestWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = v6;
  if ([v8 acousticIdEnabled]) {
    BOOL v9 = [(SRSiriViewController *)self _isAcousticIdAllowed];
  }
  else {
    BOOL v9 = 0;
  }
  [v8 setAcousticIdEnabled:v9];
  id v10 = [(SRSiriViewController *)self _presentation];
  char v11 = objc_opt_respondsToSelector();

  id v12 = v8;
  if (v11)
  {
    id v13 = [(SRSiriViewController *)self _presentation];
    id v12 = [v13 configureOptionsForImminentRequest:v8];
  }
  id v14 = [v12 requestInfo];
  uint64_t v15 = [v14 speechRequestOptions];

  if ([v15 activationEvent] == (id)5)
  {
    uint64_t v16 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      BOOL ttsSpokenForRequest = self->_ttsSpokenForRequest;
      int v21 = 136315394;
      id v22 = "-[SRSiriViewController siriSessionWillStartRequestWithOptions:completion:]";
      __int16 v23 = 1024;
      LODWORD(v24) = ttsSpokenForRequest;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s ttsSpokenForRequest: %d", (uint8_t *)&v21, 0x12u);
    }
    if (self->_ttsSpokenForRequest) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = 3;
    }
    [v15 setPresentationMode:v18];
    uint64_t v19 = [v12 requestInfo];
    [v19 setSpeechRequestOptions:v15];
  }
  if ([v12 requestSource] == (id)42) {
    [(SRSiriViewController *)self _setWaitingForStartRequest:1];
  }
  [(SRModeProvider *)self->_modeProvider setRequestOptions:v12];
  uint64_t v20 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136315394;
    id v22 = "-[SRSiriViewController siriSessionWillStartRequestWithOptions:completion:]";
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Modified options:%@", (uint8_t *)&v21, 0x16u);
  }
  if (v7) {
    v7[2](v7, v12);
  }
}

- (void)_updateKeyboardStateWithError:(id)a3
{
  id v14 = a3;
  BOOL lastMinimized = self->_lastMinimized;
  if ([(SRSiriViewController *)self _siriIsShowingPasscodeUnlock])
  {
    uint64_t v5 = 0;
    uint64_t v6 = lastMinimized;
    goto LABEL_24;
  }
  if ([(SASRequestOptions *)self->_requestOptions requestSource] == (id)20)
  {
    uint64_t v5 = 1;
    uint64_t v6 = 1;
    goto LABEL_24;
  }
  if ([(SASRequestOptions *)self->_requestOptions inputType] == (id)2)
  {
    if (!self->_keyboardEnabled)
    {
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      goto LABEL_24;
    }
    uint64_t v6 = +[UIKeyboard isInHardwareKeyboardMode] ^ 1;
  }
  else if ([(SASRequestOptions *)self->_requestOptions requestSource] == (id)23)
  {
    if (self->_keyboardEnabled) {
      unsigned int v7 = +[UIKeyboard isInHardwareKeyboardMode] ^ 1;
    }
    else {
      unsigned int v7 = 0;
    }
    BOOL v9 = [v14 code] != (id)207 && [v14 code] != (id)203;
    uint64_t v6 = v9 & v7;
  }
  else
  {
    uint64_t v6 = lastMinimized || self->_requestOptions == 0;
  }
  uint64_t v5 = 1;
LABEL_24:
  id v10 = [(SRSiriViewController *)self _presentation];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(SRSiriViewController *)self _presentation];
    unsigned int v13 = [v12 currentSnippetContainsFooterButtons];

    uint64_t v6 = v13 | v6;
  }
  [(SRSiriViewController *)self _updateKeyboardState:v5 minimized:v6];
}

- (void)siriSessionWillStartRequest
{
  enqueuedSuggestion = self->_enqueuedSuggestion;
  self->_enqueuedSuggestion = 0;

  id v4 = [(SRSiriViewController *)self _requestOptions];
  id v5 = [v4 inputType];

  if (v5 == (id)2)
  {
    uint64_t v6 = [(SRSiriViewController *)self _host];
    [v6 serviceDidRequestKeyboard:0];
  }
  if ([(SRSiriViewController *)self _isSpeechSynthesisSpeaking])
  {
    unsigned int v7 = [(SRSiriViewController *)self _instrumentationManager];
    [v7 emitUserBargeInEventForBargedInTurn];
  }
  [(SRSiriViewController *)self _setRequestActive:1];
  [(SRSiriViewController *)self _setWaitingForStartRequest:0];
  [(SRSiriViewController *)self _reflectionDialogHasBeenPlayed:0];
  [(SRSiriViewController *)self _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded];
  self->_delaySessionEndForInPlacePunchout = 0;
  self->_keyboardEnabled = 1;
  [(SRSiriViewController *)self _setKeyboardLoweredAfterResponse:0];
  [(SRSiriViewController *)self _setListenAfterSpeakingForRequestFinished:0];
  [(SRSiriViewController *)self _cancelSpeechSynthesis];
  if ([(SRSiriViewController *)self _isUserUtteranceTapToEditInProgress]) {
    [(SASRequestOptions *)self->_requestOptions setRequestSource:32];
  }
  id v8 = [(SRSiriViewController *)self _presentation];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    if (([(SASRequestOptions *)self->_requestOptions isForBluetoothCar] & 1) != 0
      || [(SASRequestOptions *)self->_requestOptions isForEyesFree])
    {
      id v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315138;
        int v21 = "-[SRSiriViewController siriSessionWillStartRequest]";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s This is either a bluetooth car request or an eyes free request", (uint8_t *)&v20, 0xCu);
      }
      char v11 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315138;
        int v21 = "-[SRSiriViewController siriSessionWillStartRequest]";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Emitting Trial Experimentation Analytics for A2DP / HFP experiment", (uint8_t *)&v20, 0xCu);
      }
      manager = self->_manager;
      id v13 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"dec00f3a-a3a4-4777-8e7a-6cdba66bfb3e"];
      id v14 = objc_alloc_init((Class)NSUUID);
      [(AIMLExperimentationAnalyticsManager *)manager emitTriggerForCodePathID:v13 requestID:v14 completionHandler:&stru_100143DC0];

      uint64_t v15 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136315138;
        int v21 = "-[SRSiriViewController siriSessionWillStartRequest]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Emitting BT Car InvocationContext", (uint8_t *)&v20, 0xCu);
      }
      uint64_t v16 = objc_alloc_init(SRCarInvocationSourceInstrumentationSender);
      [(SRCarInvocationSourceInstrumentationSender *)v16 sendBTCarInvocationContext];
    }
    uint64_t v17 = [(SRSiriViewController *)self _presentation];
    [v17 siriRequestWillStartWithRequestOptions:self->_requestOptions];
  }
  unint64_t v18 = (unint64_t)[(SASRequestOptions *)self->_requestOptions requestSource];
  if (v18 == 50)
  {
    [(SRSiriViewController *)self _insertUserUtteranceViewForSuggestion:self->_requestText];
  }
  else if (v18 == 23)
  {
    [(SRSiriViewController *)self _insertUserUtteranceViewForText:self->_requestText];
  }
  else if ((v18 & 0xFFFFFFFFFFFFFFFELL) == 0x18)
  {
    uint64_t v19 = [(SASRequestOptions *)self->_requestOptions text];
    [(SRSiriViewController *)self _insertUserUtteranceViewForText:v19];
  }
}

- (void)siriSessionWillStartUIRequestWithText:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, uint64_t))a4;
  if (+[AFSystemAssistantExperienceStatusManager isSAEEnabled])
  {
    [(SRSiriViewController *)self _insertUserUtteranceViewForText:v6];
    if (v7) {
      v7[2](v7, 1);
    }
  }
  else
  {
    id v8 = objc_alloc_init((Class)SAUIUserUtteranceView);
    [v8 setText:v6];
    char v9 = +[NSUUID UUID];
    id v10 = [v9 UUIDString];
    [v8 setAceId:v10];

    id v11 = objc_alloc_init((Class)SAUIAddViews);
    id v17 = v8;
    id v12 = +[NSArray arrayWithObjects:&v17 count:1];
    [v11 setViews:v12];

    id v13 = +[NSUUID UUID];
    id v14 = [v13 UUIDString];
    [v11 setAceId:v14];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100046FBC;
    v15[3] = &unk_100143DE8;
    uint64_t v16 = v7;
    [(SRSiriViewController *)self siriSessionDidReceiveAddViewsCommand:v11 completion:v15];
  }
}

- (void)siriSessionWillCancelRequest
{
  [(SRSiriViewController *)self _setListenAfterSpeakingForRequestFinished:0];
  [(SRSiriViewController *)self _cancelSpeechSynthesis];
  id v3 = [(SRSiriViewController *)self _utteranceToSpeakAfterClearScreenCommand];
  id v4 = [v3 length];

  if (v4)
  {
    unsigned int v7 = +[AFSpeakableUtteranceParser sruif_speakableUtteranceParserForCurrentLanguage];
    [v7 setHandleTTSCodes:1];
    id v5 = [(SRSiriViewController *)self _utteranceToSpeakAfterClearScreenCommand];
    LOBYTE(v6) = 1;
    [(SRSiriViewController *)self _speakText:v5 identifier:0 sessionId:0 preferredVoice:0 provisionally:0 eligibleAfterDuration:0 delayed:0.0 canUseServerTTS:v6 speakableUtteranceParser:v7 analyticsContext:0 speakableContextInfo:0 preparation:0 completion:0];

    [(SRSiriViewController *)self _setUtteranceToSpeakAfterClearScreenCommand:0];
  }
}

- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3
{
  id v5 = [(SRSiriViewController *)self _presentation];
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v4 = a3;
    [v5 siriAudioRecordingDidChangePowerLevel:v4];
  }
}

- (void)siriSessionAudioRecordingDidChangePowerLevel:(float)a3 peakLevel:(float)a4
{
  -[SRSiriViewController siriSessionAudioRecordingDidChangePowerLevel:](self, "siriSessionAudioRecordingDidChangePowerLevel:");
  id v9 = [(SRSiriViewController *)self _presentation];
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v7 = a3;
    *(float *)&double v8 = a4;
    [v9 siriAudioRecordingDidChangePowerLevel:v7 peakLevel:v8];
  }
}

- (void)siriSessionDidFinishRequestWithError:(id)a3
{
  double v4 = (__CFString *)a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"success";
    if (v4) {
      CFStringRef v6 = v4;
    }
    *(_DWORD *)long long buf = 136315394;
    id v13 = "-[SRSiriViewController siriSessionDidFinishRequestWithError:]";
    __int16 v14 = 2112;
    CFStringRef v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #session %@", buf, 0x16u);
  }
  if ([(SRSiriViewController *)self textInputEnabled]
    && [(SRSiriViewController *)self _isRequestActive]
    && ![(SRSiriViewController *)self _isUserUtteranceTapToEditInProgress])
  {
    [(SRSiriViewController *)self _updateKeyboardStateWithError:v4];
    requestText = self->_requestText;
    self->_requestText = (NSString *)&stru_1001463E0;
  }
  BOOL listenAfterSpeakingForRequestFinished = self->_listenAfterSpeakingForRequestFinished;
  [(SRSiriViewController *)self _setListenAfterSpeakingForRequestFinished:0];
  objc_initWeak((id *)buf, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000473A4;
  v9[3] = &unk_100143E10;
  BOOL v11 = listenAfterSpeakingForRequestFinished;
  objc_copyWeak(&v10, (id *)buf);
  [(SRSiriViewController *)self _handleRequestError:v4 completion:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)siriSessionDidTransitionFromState:(int64_t)a3 toState:(int64_t)a4 event:(int64_t)a5 machAbsoluteTransitionTime:(double)a6
{
  BOOL v11 = [(SRSiriViewController *)self _instrumentationManager];
  [v11 processSessionEvent:a5 isSpeechSynthesisSpeaking:[self _isSpeechSynthesisSpeaking] machAbsoluteTime:a6];

  if (a4 != a3)
  {
    objc_initWeak((id *)location, self);
    id v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472;
    __int16 v33 = sub_100047880;
    id v34 = &unk_100143E38;
    objc_copyWeak(v35, (id *)location);
    v35[1] = (id)a3;
    v35[2] = (id)a4;
    v35[3] = *(id *)&a6;
    id v12 = objc_retainBlock(&v31);
    id v13 = v12;
    if (self->_initialInstrumentationTurnReceieved)
    {
      ((void (*)(void ***))v12[2])(v12);
    }
    else
    {
      instrumentationStateTransitionsPendingInitialTurn = self->_instrumentationStateTransitionsPendingInitialTurn;
      if (!instrumentationStateTransitionsPendingInitialTurn)
      {
        CFStringRef v15 = +[NSMutableArray array];
        uint64_t v16 = self->_instrumentationStateTransitionsPendingInitialTurn;
        self->_instrumentationStateTransitionsPendingInitialTurn = v15;

        instrumentationStateTransitionsPendingInitialTurn = self->_instrumentationStateTransitionsPendingInitialTurn;
      }
      id v17 = objc_retainBlock(v13);
      [(NSMutableArray *)instrumentationStateTransitionsPendingInitialTurn addObject:v17];
    }
    objc_destroyWeak(v35);
    objc_destroyWeak((id *)location);
  }
  if ((unint64_t)(a4 - 1) > 3) {
    int64_t v18 = 0;
  }
  else {
    int64_t v18 = qword_1000DC4D8[a4 - 1];
  }
  self->_siriState = v18;
  [(SRSiriViewController *)self _checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded];
  uint64_t v19 = [(SRSiriViewController *)self _voicemailPlayer];
  [v19 stopPlaying];

  int v20 = [(SRSiriViewController *)self _audioMessagePlayer];
  [v20 stopPlaying];

  int v21 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = v21;
    __int16 v23 = SRUIFSiriSessionStateGetDescription();
    id v24 = SRUIFSiriSessionStateGetDescription();
    __int16 v25 = SRUIFSiriSessionEventGetDescription();
    *(_DWORD *)id location = 136315906;
    *(void *)&location[4] = "-[SRSiriViewController siriSessionDidTransitionFromState:toState:event:machAbsoluteTransitionTime:]";
    __int16 v37 = 2112;
    uint64_t v38 = v23;
    __int16 v39 = 2112;
    id v40 = v24;
    __int16 v41 = 2112;
    id v42 = v25;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s #state changing fromState: %@ toState: %@, event: %@", location, 0x2Au);
  }
  id v26 = [(SRSiriViewController *)self _presentation];
  char v27 = objc_opt_respondsToSelector();

  if (v27)
  {
    BOOL v28 = [(SRSiriViewController *)self _presentation];
    long long v29 = v28;
    if ((unint64_t)(a3 - 1) > 3) {
      uint64_t v30 = 0;
    }
    else {
      uint64_t v30 = qword_1000DC4D8[a3 - 1];
    }
    [v28 siriDidTransitionFromState:v30 event:sub_1000479D8((uint64_t)v28, a5)];
  }
}

- (void)siriSessionDidStartNewTurn:(id)a3
{
  id v4 = a3;
  [(SRSiriViewController *)self siriSessionDidStartNewTurn:v4 associatedLaunchStartContext:0 machAbsoluteTime:0 linkPreviousTurn:(double)mach_absolute_time()];
}

- (void)siriSessionDidStartNewTurn:(id)a3 associatedLaunchStartContext:(id)a4 machAbsoluteTime:(double)a5 linkPreviousTurn:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    __int16 v14 = [(SRSiriViewController *)self _session];
    CFStringRef v15 = [v10 turnIdentifier];
    *(_DWORD *)long long buf = 136315650;
    id v40 = "-[SRSiriViewController siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:]";
    __int16 v41 = 2112;
    id v42 = v14;
    __int16 v43 = 2112;
    id v44 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #instrumentation %@ indicates a new turn %@ has started", buf, 0x20u);
  }
  uint64_t v16 = [(SRSiriViewController *)self _instrumentationManager];
  id v17 = [v16 currentInstrumentationTurnContext];
  int64_t v18 = [v17 turnIdentifier];

  uint64_t v19 = +[SRUIFInstrumentationManager sharedManager];
  [v19 storeCurrentInstrumentationTurnContext:v10];

  if (v11)
  {
    int v20 = [(SRSiriViewController *)self _instrumentationManager];
    [v20 emitInstrumentation:v11 atTime:(unint64_t)a5];
  }
  if (v6)
  {
    int v21 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v21;
      __int16 v23 = [v10 turnIdentifier];
      *(_DWORD *)long long buf = 136315650;
      id v40 = "-[SRSiriViewController siriSessionDidStartNewTurn:associatedLaunchStartContext:machAbsoluteTime:linkPreviousTurn:]";
      __int16 v41 = 2112;
      id v42 = v18;
      __int16 v43 = 2112;
      id v44 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s #instrumentation linking previous turn %@ with the new turn %@", buf, 0x20u);
    }
    id v24 = objc_alloc_init((Class)SISchemaConversationTrace);
    if (v18)
    {
      __int16 v25 = AFTurnIdentifierGetBytes();
    }
    else
    {
      id v26 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_1000B89D0(v26);
      }
      __int16 v25 = 0;
    }
    [v24 setPreviousTurnID:v25];
    char v27 = [(SRSiriViewController *)self _instrumentationManager];
    [v27 emitInstrumentation:v24];
  }
  self->_initialInstrumentationTurnReceieved = 1;
  if ([(NSMutableArray *)self->_instrumentationStateTransitionsPendingInitialTurn count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    BOOL v28 = self->_instrumentationStateTransitionsPendingInitialTurn;
    id v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v35;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v35 != v31) {
            objc_enumerationMutation(v28);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v34 + 1) + 8 * (void)v32) + 16))(*(void *)(*((void *)&v34 + 1) + 8 * (void)v32));
          uint64_t v32 = (char *)v32 + 1;
        }
        while (v30 != v32);
        id v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v30);
    }

    instrumentationStateTransitionsPendingInitialTurn = self->_instrumentationStateTransitionsPendingInitialTurn;
    self->_instrumentationStateTransitionsPendingInitialTurn = 0;
  }
}

- (void)siriSessionRequestsInstrumentingMessage:(id)a3 machAbsoluteTime:(double)a4
{
  id v6 = a3;
  id v7 = [(SRSiriViewController *)self _instrumentationManager];
  [v7 emitInstrumentation:v6 atTime:(unint64_t)a4];
}

- (void)siriSessionGetRequestContextWithCompletionHandler:(id)a3
{
  double v8 = (void (**)(id, void *))a3;
  id v4 = [(SRSiriViewController *)self _presentation];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SRSiriViewController *)self _presentation];
    id v7 = [v6 requestContext];
  }
  else
  {
    id v7 = 0;
  }
  v8[2](v8, v7);
}

- (void)siriSessionDidChangeNetworkAvailability
{
  id v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SRSiriViewController *)self _presentation];
    [v5 siriNetworkAvailabilityDidChange];
  }
}

- (void)siriSessionDidChangeLockState:(unint64_t)a3
{
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    unint64_t lockState = self->_lockState;
    *(_DWORD *)long long buf = 136315650;
    id v12 = "-[SRSiriViewController siriSessionDidChangeLockState:]";
    __int16 v13 = 2048;
    unint64_t v14 = lockState;
    __int16 v15 = 2048;
    unint64_t v16 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s old lockState=%zd, new lockState=%zd", buf, 0x20u);
  }
  BOOL v7 = self->_lockState == 0;
  self->_unint64_t lockState = a3;
  if ((((a3 != 0) ^ v7) & 1) == 0)
  {
    id v8 = objc_alloc_init((Class)SISchemaDeviceLockStateChanged);
    [v8 setIsDeviceLocked:a3 != 0];
    id v9 = [(SRSiriViewController *)self _instrumentationManager];
    [v9 emitInstrumentation:v8];
  }
  if (!a3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004812C;
    block[3] = &unk_100142E88;
    void block[4] = self;
    if (qword_100171E20 != -1) {
      dispatch_once(&qword_100171E20, block);
    }
  }
}

- (void)siriSessionDidReceiveOpenLinkCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 ref];
  id v9 = [v8 scheme];
  if (![v9 caseInsensitiveCompare:@"prefs"]
    || ![v9 caseInsensitiveCompare:@"audio-player-event"])
  {
    goto LABEL_16;
  }
  if (![v9 caseInsensitiveCompare:@"http"]
    || ![v9 caseInsensitiveCompare:@"https"])
  {
    id v10 = [v8 host];
    if ([v10 caseInsensitiveCompare:@"apple.com"])
    {
      id v11 = [v10 rangeOfString:@".apple.com" options:13];

      if (v11 == (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_7;
      }
    }
    else
    {
    }
LABEL_16:
    id v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315394;
      id v22 = "-[SRSiriViewController siriSessionDidReceiveOpenLinkCommand:completion:]";
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Opening URL:%@", buf, 0x16u);
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10004845C;
    v18[3] = &unk_100143E60;
    id v20 = v7;
    id v19 = v6;
    [(SRSiriViewController *)self _openURL:v8 bundleId:0 inPlace:0 conversationId:0 completion:v18];

    unint64_t v16 = v20;
    goto LABEL_19;
  }
LABEL_7:
  id v12 = [(SRSiriViewController *)self _presentation];
  if (objc_opt_respondsToSelector())
  {
    unsigned int v13 = [v12 trustsURL:v8];

    if (v13) {
      goto LABEL_16;
    }
  }
  else
  {
  }
  unint64_t v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    id v22 = "-[SRSiriViewController siriSessionDidReceiveOpenLinkCommand:completion:]";
    __int16 v23 = 2112;
    id v24 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Ignoring unsafe URL:%@", buf, 0x16u);
  }
  if (v7)
  {
    __int16 v15 = [v6 aceId];
    unint64_t v16 = +[SACommandFailed sruif_commandFailedWithRefId:v15];

    [v16 setReason:@"Ignoring potentially unsafe URL"];
    (*((void (**)(id, void *))v7 + 2))(v7, v16);
LABEL_19:
  }
}

- (void)siriSessionOpenURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL delaySessionEndForInPlacePunchout = self->_delaySessionEndForInPlacePunchout;
  id v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v10 = @"Replace";
    *(_DWORD *)long long buf = 136315650;
    id v22 = "-[SRSiriViewController siriSessionOpenURL:completionHandler:]";
    __int16 v23 = 2112;
    if (delaySessionEndForInPlacePunchout) {
      CFStringRef v10 = @"InPlace";
    }
    CFStringRef v24 = v10;
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #punchout 1 Performing %@ punchout of URL: %@", buf, 0x20u);
  }
  [(SRSiriViewController *)self _openURL:v6 bundleId:0 inPlace:delaySessionEndForInPlacePunchout conversationId:0 completion:v7];
  if (delaySessionEndForInPlacePunchout)
  {
    if (!self->_ttsDelayedBlocks)
    {
      id v11 = (AFQueue *)objc_alloc_init((Class)AFQueue);
      ttsDelayedBlocks = self->_ttsDelayedBlocks;
      self->_ttsDelayedBlocks = v11;
    }
    objc_initWeak((id *)buf, self);
    unsigned int v13 = self->_ttsDelayedBlocks;
    __int16 v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_100048750;
    int64_t v18 = &unk_100143250;
    objc_copyWeak(&v20, (id *)buf);
    id v19 = v6;
    unint64_t v14 = objc_retainBlock(&v15);
    -[AFQueue enqueueObject:](v13, "enqueueObject:", v14, v15, v16, v17, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
}

- (void)siriSessionRequestsDismissalForReason:(int64_t)a3
{
  id v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = SASDismissalReasonGetName();
    int v8 = 136315394;
    id v9 = "-[SRSiriViewController siriSessionRequestsDismissalForReason:]";
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Siri Session is requesting dismissal %@", (uint8_t *)&v8, 0x16u);
  }
  [(SRSiriViewController *)self _dismissWithReason:a3];
}

- (void)siriSessionWantsToCacheImage:(id)a3
{
  id v3 = a3;
  id v4 = +[INCache sharedCache];
  [v4 addCacheableObject:v3];
}

- (void)siriSessionIsPresentingLocalAuthenticationUI
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 assistantUILocalizedStringForKey:@"ASSISTANT_PRESENTING_LOCAL_AUTHENTICATION_UI" table:0];

  [(SRSiriViewController *)self _presentAuthenticationDialogWithText:v4];
}

- (void)siriSessionIsPresentingApplePaySheet
{
  id v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = [v3 assistantUILocalizedStringForKey:@"ASSISTANT_PRESENTING_APPLE_PAY_SHEET" table:0];

  [(SRSiriViewController *)self _presentAuthenticationDialogWithText:v4];
}

- (void)_presentAuthenticationDialogWithText:(id)a3
{
  id v4 = a3;
  id v11 = +[NSMutableArray array];
  id v5 = objc_alloc_init((Class)SAUIAddViews);
  [v5 setDialogPhase:SAUIDialogPhaseStatusValue];
  id v6 = objc_alloc_init((Class)SAUIAssistantUtteranceView);
  [v6 setText:v4];
  [v6 setSpeakableText:v4];

  [v11 addObject:v6];
  [v5 setViews:v11];
  id v7 = [v5 dictionary];
  int v8 = +[AceObject aceObjectWithDictionary:v7];

  id v9 = +[NSUUID UUID];
  __int16 v10 = [v9 UUIDString];
  [v8 setAceId:v10];

  [(SRSiriViewController *)self _performGenericAceCommand:v8 turnIdentifier:0 completion:0];
}

- (void)siriSessionDidReceiveSpeechRecognizedCommand:(id)a3
{
  id v4 = a3;
  if (AFIsInternalInstall())
  {
    CFStringRef v17 = @"bestTextInterpretation";
    id v5 = [v4 af_bestTextInterpretation];
    int64_t v18 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [(SRSiriViewController *)self _analytics];
  [v7 logEventWithType:1506 context:v6];

  [(SRSiriViewController *)self _didReceiveAceCommand:v4];
  int v8 = [(SRSiriViewController *)self _activeConversation];
  [v8 addItemForSpeechRecognizedCommand:v4];

  id v9 = [v4 af_userUtteranceValue];
  __int16 v10 = [v9 bestTextInterpretation];

  id v11 = +[SiriSharedUIReplayUtilityWrapper sharedInstance];
  [v11 speechRecognized:v10];

  id v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    unint64_t v14 = "-[SRSiriViewController siriSessionDidReceiveSpeechRecognizedCommand:]";
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s Speech Recognized: %@", (uint8_t *)&v13, 0x16u);
  }
}

- (void)siriSessionDidRecognizedAdditionalSpeechInterpretation:(id)a3 refId:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SRSiriViewController *)self _activeConversation];
  [v8 addAdditionalSpeechInterpretation:v7 refId:v6];
}

- (void)siriSessionDidUpdateRecognitionWithPhrases:(id)a3 utterances:(id)a4 refId:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(SRSiriViewController *)self _activeConversation];
  [v11 addRecognitionUpdateWithPhrases:v10 utterances:v9 refId:v8];
}

- (void)siriSessionDidReceiveSpeechPartialResultCommand:(id)a3
{
  id v4 = a3;
  if (AFIsInternalInstall())
  {
    CFStringRef v18 = @"bestTextInterpretation";
    id v5 = [v4 af_bestTextInterpretation];
    id v19 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [(SRSiriViewController *)self _analytics];
  [v7 logEventWithType:1504 context:v6];

  [(SRSiriViewController *)self _didReceiveAceCommand:v4];
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    __int16 v15 = "-[SRSiriViewController siriSessionDidReceiveSpeechPartialResultCommand:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Did receive partial speech result %@", (uint8_t *)&v14, 0x16u);
  }
  id v9 = [(SRSiriViewController *)self _activeConversation];
  [v9 addItemForPartialResultCommand:v4];

  id v10 = [(SRSiriViewController *)self _presentation];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [v4 af_bestTextInterpretation];
    int v13 = [(SRSiriViewController *)self _presentation];
    [v13 siriDidUpdateASRWithRecognition:v12];
  }
}

- (id)removeAlternativeFeatureViews:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v3 views];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            [v4 addObject:v10];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 setViews:v4];

  return v3;
}

- (BOOL)_shouldLowerKeyboardForAddViewsCommand:(id)a3
{
  id v3 = a3;
  id v4 = [v3 views];
  uint64_t v5 = [v4 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v7 = [v3 af_dialogPhase];
  LOBYTE(v5) = [v7 isReflectionDialogPhase];

  char v8 = 0;
  if ((v5 & 1) == 0 && (isKindOfClass & 1) == 0)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v9 = [v3 views];
    id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      id v11 = v10;
      int v12 = 0;
      int v13 = 0;
      uint64_t v14 = *(void *)v19;
      do
      {
        long long v15 = 0;
        do
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v9);
          }
          __int16 v16 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v15) listenAfterSpeaking];
          v12 |= [v16 BOOLValue];

          v13 |= SiriUIAceViewHasButtons();
          long long v15 = (char *)v15 + 1;
        }
        while (v11 != v15);
        id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
      char v8 = v12 ^ 1 | v13;
    }
    else
    {
      char v8 = 1;
    }
  }
  return v8 & 1;
}

- (void)_updateKeyboardState:(BOOL)a3 minimized:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if (![(SRSiriViewController *)self _isKeyboardLoweredAfterResponse])
  {
    if ([(SASRequestOptions *)self->_requestOptions requestSource] == (id)23)
    {
      objc_initWeak(&location, self);
      id v7 = [(SRSiriViewController *)self _host];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10004950C;
      v8[3] = &unk_100143E88;
      objc_copyWeak(&v9, &location);
      BOOL v10 = v4;
      BOOL v11 = v5;
      [v7 serviceDidRequestCurrentTextInput:v8];

      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
    else if ([(SASRequestOptions *)self->_requestOptions inputType] == (id)2)
    {
      [(SRSiriViewController *)self _setShowKeyboardIfTextInputEnabled:v5 minimized:v4];
      [(SRSiriViewController *)self _setKeyboardLoweredAfterResponse:v4];
    }
  }
}

- (void)_updateKeyboardStatusForAddViewsCommand:(id)a3
{
  if ([(SRSiriViewController *)self _shouldLowerKeyboardForAddViewsCommand:a3])
  {
    uint64_t v4 = +[UIKeyboard isInHardwareKeyboardMode] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(SASRequestOptions *)self->_requestOptions requestSource] == (id)23
    || v4 && [(SASRequestOptions *)self->_requestOptions inputType] == (id)2)
  {
    BOOL v5 = [(SRSiriViewController *)self textInputEnabled];
    [(SRSiriViewController *)self _updateKeyboardState:v5 minimized:v4];
  }
}

- (void)siriSessionDidReceiveAddViewsCommand:(id)a3 completion:(id)a4
{
  id v126 = a3;
  v123 = (void (**)(id, void *))a4;
  id v6 = +[SiriSharedUIReplayUtilityWrapper sharedInstance];
  [v6 receivedCommand:v126];

  id v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SRSiriViewController *)self _presentation];
    BOOL v10 = [v126 af_dialogPhase];
    [v9 didReceiveAddViewsDialogPhaseForSuggestions:v10];
  }
  v124 = [v126 views];
  BOOL v11 = [v124 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v14 = objc_alloc((Class)NSMutableString);
    uint64_t v15 = objc_opt_class();
    __int16 v16 = [v126 aceId];
    id v17 = [v126 refId];
    id v131 = [v14 initWithFormat:@"<%@: %@ refId:%@>\n", v15, v16, v17];

    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id obj = v124;
    id v18 = [obj countByEnumeratingWithState:&v135 objects:v146 count:16];
    if (v18)
    {
      char v130 = 0;
      uint64_t v19 = *(void *)v136;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v136 != v19) {
            objc_enumerationMutation(obj);
          }
          long long v21 = *(void **)(*((void *)&v135 + 1) + 8 * i);
          id v22 = +[SiriUIUtilities descriptionForAceView:v21];
          [v131 appendFormat:@"%@\n", v22];

          __int16 v23 = AFSiriLogContextConnection;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            id v24 = (id)objc_opt_class();
            *(_DWORD *)long long buf = 136315394;
            v141 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
            __int16 v142 = 2112;
            id v143 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s #modes SAUIAddViews view class: %@", buf, 0x16u);
          }
          __int16 v25 = [v21 dialog];
          BOOL v26 = v25 == 0;

          if (!v26)
          {
            char v27 = AFSiriLogContextConnection;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 136315138;
              v141 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
            }

            char v130 = 1;
          }
          BOOL v28 = [v21 aceId];
          BOOL v29 = v28 == 0;

          if (v29)
          {
            id v30 = AFSiriLogContextConnection;
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 136315394;
              v141 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
              __int16 v142 = 2112;
              id v143 = v21;
              _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s View missing aceID can result in TTS speaking AddViews and SayIt out of order %@", buf, 0x16u);
            }

            uint64_t v31 = [(SRSiriViewController *)self _analytics];
            uint64_t v32 = AFAnalyticsContextCreateWithCommand();
            [v31 logEventWithType:1449 context:v32];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v33 = [v21 dialogIdentifier];
            [(SRSiriViewController *)self disableTouchIDFaceIDIfNecessaryForDucID:v33];

            long long v34 = [v21 listenAfterSpeaking];
            self->_keyboardEnabled = [v34 BOOLValue] ^ 1;
          }
          responseViewId = self->_responseViewId;
          self->_responseViewId = 0;

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v36 = [v21 responseViewId];
            BOOL v37 = v36 == 0;

            if (!v37)
            {
              uint64_t v38 = [v21 responseViewId];
              __int16 v39 = self->_responseViewId;
              self->_responseViewId = v38;
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v40 = [v21 responseViewId];
            BOOL v41 = v40 == 0;

            if (!v41)
            {
              id v42 = [v21 responseViewId];
              __int16 v43 = self->_responseViewId;
              self->_responseViewId = v42;

              id v44 = objc_alloc((Class)VRXVisualResponseShown);
              id v45 = [v21 cardData];
              id v46 = [v44 initWithCardData:v45 responseViewId:self->_responseViewId];

              id v47 = [(SRSiriViewController *)self _instrumentationManager];
              id v48 = [v47 currentInstrumentationTurnContext];
              id v49 = [v48 turnIdentifier];

              [v46 emitWithTurnIdentifier:v49];
            }
          }
          id v50 = [v21 dialog];

          if (v50)
          {
            id v51 = [v21 dialog];
            id v52 = [v51 dialogIdentifier];
            [(SRSiriViewController *)self disableTouchIDFaceIDIfNecessaryForDucID:v52];
          }
          if (!self->_listenAfterSpeakingForRequestFinished)
          {
            id v53 = [v21 listenAfterSpeaking];
            unsigned int v54 = [v53 BOOLValue];

            if (v54)
            {
              [(SRSiriViewController *)self _setListenAfterSpeakingForRequestFinished:1];
              id v55 = [v21 listenAfterSpeakingBehavior];
              id v56 = [v55 startAlertSoundID];
              startRecordingSoundId = self->_startRecordingSoundId;
              self->_startRecordingSoundId = v56;
            }
          }
          BOOL v58 = [(SRSiriViewController *)self _presentation];
          char v59 = objc_opt_respondsToSelector();

          if (v59)
          {
            BOOL v60 = [(SRSiriViewController *)self _presentation];
            CGPoint v61 = [v21 delayDismissalMs];
            [v60 delayDismissalAfterIdleFires:v61];
          }
        }
        id v18 = [obj countByEnumeratingWithState:&v135 objects:v146 count:16];
      }
      while (v18);
    }
    else
    {
      char v130 = 0;
    }

    id v62 = [(SRSiriViewController *)self _presentation];
    char v63 = objc_opt_respondsToSelector();

    if (v63)
    {
      v64 = [(SRSiriViewController *)self _presentation];
      v65 = [v126 feedbackForm];
      [v64 handleFeedbackForm:v65];
    }
    v66 = [v126 requestEndBehavior];
    if (v66)
    {
      v67 = [(SRSiriViewController *)self _presentation];
      char v68 = objc_opt_respondsToSelector();

      if (v68)
      {
        objc_initWeak((id *)buf, self);
        v132[0] = _NSConcreteStackBlock;
        v132[1] = 3221225472;
        v132[2] = sub_10004A870;
        v132[3] = &unk_100143EB0;
        objc_copyWeak(&v134, (id *)buf);
        id v133 = v126;
        [(SRSiriViewController *)self _fetchAttendingState:v132];

        objc_destroyWeak(&v134);
        objc_destroyWeak((id *)buf);
      }
    }
    id obja = v126;
    -[SRSiriViewController _logPatternExecutedEventForAddViewsCommand:](self, "_logPatternExecutedEventForAddViewsCommand:");
    [(SRSiriViewController *)self _sharePatternIdFromAddViewsCommand:obja];
    v69 = [obja responseMode];
    unint64_t v127 = [(SRSiriViewController *)self _responseModeToMDModeConverter:v69];

    v70 = [obja responseMode];
    v125 = [v70 lowercaseString];

    v71 = [obja refId];
    addViewsRefId = self->_addViewsRefId;
    self->_addViewsRefId = v71;

    v73 = [obja responseMode];
    self->_addViewsMode = [(SRSiriViewController *)self _responseModeToMDModeConverter:v73];

    v74 = AFSiriLogContextConnection;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      id v75 = [obja patternId];
      *(_DWORD *)long long buf = 136315394;
      v141 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
      __int16 v142 = 2112;
      id v143 = v75;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%s #modes SAUIAddViews patternId: [%@]", buf, 0x16u);
    }
    v76 = AFSiriLogContextConnection;
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = self->_responseViewId;
      *(_DWORD *)long long buf = 136315394;
      v141 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
      __int16 v142 = 2112;
      id v143 = v77;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "%s #modes SAUIAddViews responseViewId: [%@]", buf, 0x16u);
    }

    v78 = AFSiriLogContextConnection;
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      v79 = "false";
      if (v130) {
        v79 = "true";
      }
      *(_DWORD *)long long buf = 136315394;
      v141 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
      __int16 v142 = 2080;
      id v143 = (id)v79;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%s #modes snippetViewContainsDialog: %s", buf, 0x16u);
    }

    v80 = [obja patternId];
    if (v80 || [(NSString *)self->_responseViewId length])
    {

      if ((v130 & 1) == 0)
      {
        v86 = obja;
        goto LABEL_67;
      }
    }
    v81 = AFSiriLogContextConnection;
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      v141 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%s #modes non-RF response - setting currentMode as computed mode passed from MAF through addViews for iOS bridging", buf, 0xCu);
    }

    v82 = [obja sruif_dialogPhase];
    if ([v82 isReflectionDialogPhase])
    {
      unsigned int v83 = [(SRSiriViewController *)self _suppressTTSForErrorsAndInterstitials];

      if (!v83)
      {
LABEL_63:
        v84 = AFSiriLogContextConnection;
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
        {
          MDModeGetName();
          id v85 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)long long buf = 136315650;
          v141 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
          __int16 v142 = 2112;
          id v143 = v85;
          __int16 v144 = 2112;
          id v145 = v131;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "%s #modes %@ %@", buf, 0x20u);
        }
        v86 = +[MDDialogTransformer transformAddViews:obja forMode:v127];

LABEL_67:
        v87 = [(SRSiriViewController *)self _requestOptions];
        BOOL v88 = [v87 requestSource] == (id)52;

        if (v88)
        {
          v89 = AFSiriLogContextConnection;
          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            v141 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
            _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEFAULT, "%s #modes Applying DisplayOnly mode to suppress TTS from being spoken for quickTypeTamale", buf, 0xCu);
          }

          uint64_t v90 = +[MDDialogTransformer transformAddViews:v86 forMode:2];

          unint64_t v127 = 2;
          v86 = (void *)v90;
        }
        v91 = [v86 sruif_dialogPhase];
        unsigned int v92 = [v91 isReflectionDialogPhase];

        if (v92) {
          [(SRSiriViewController *)self _reflectionDialogHasBeenPlayed:1];
        }
        if ((id)[(SRSiriViewController *)self _presentationOptions] == (id)2) {
          int64_t v93 = 4;
        }
        else {
          int64_t v93 = +[SRVisualResponseTransformer currentIdiom];
        }
        int64_t v94 = [(SRSiriViewController *)self _viewModeFromPresentationOptions:[(SRSiriViewController *)self _presentationOptions]];
        systemUIController = self->_systemUIController;
        unint64_t lockState = self->_lockState;
        v97 = [(SRSiriViewController *)self view];
        v98 = [v97 traitCollection];
        -[SRSiriSystemUIController updateSystemUIForAddViews:viewMode:lockState:isInAmbient:](systemUIController, "updateSystemUIForAddViews:viewMode:lockState:isInAmbient:", v86, v94, lockState, [v98 isAmbientPresented]);

        if ([(SRSiriSystemUIController *)self->_systemUIController shouldRedactSnippetForAddViews:v86])
        {
          v99 = [(SRSiriSystemUIController *)self->_systemUIController transformAddViews:v86 mode:[(SRSiriViewController *)self _MDModeToSRModeConverter:v127] idiom:v93];
          unsigned int v100 = [(SRSiriSystemUIController *)self->_systemUIController presentingSystemUI];
          id v101 = v99;

          if (!v100) {
            goto LABEL_84;
          }
          v102 = AFSiriLogContextConnection;
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315138;
            v141 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
            _os_log_impl((void *)&_mh_execute_header, v102, OS_LOG_TYPE_DEFAULT, "%s System UI Presented. Setting didPresentSystemUI", buf, 0xCu);
          }

          v103 = [(SRSiriViewController *)self _presentation];
          char v104 = objc_opt_respondsToSelector();

          if ((v104 & 1) == 0)
          {
LABEL_84:
            v105 = [(SRSiriViewController *)self _presentation];
            char v106 = objc_opt_respondsToSelector();

            if (v106)
            {
              v107 = [(SRSiriViewController *)self _presentation];
              [v107 siriResponseModeDidChange:v127];
            }
            v108 = [v101 views];
            BOOL v109 = [v108 count] == 0;

            if (v109)
            {
              v117 = AFSiriLogContextConnection;
              if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 136315138;
                v141 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
                _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "%s System UI Presented. Resetting ASR", buf, 0xCu);
              }

              v118 = [(SRSiriViewController *)self _presentation];
              char v119 = objc_opt_respondsToSelector();

              if (v119)
              {
                v120 = [(SRSiriViewController *)self _presentation];
                [v120 resetViewsAndClearASR:1];
              }
              v121 = AFSiriLogContextConnection;
              if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
                sub_1000B8A6C(obja, v121);
              }

              if (!v123) {
                goto LABEL_98;
              }
              v116 = [obja aceId];
              v122 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v116];
              v123[2](v123, v122);
            }
            else
            {
              v110 = [(SRSiriViewController *)self _analytics];
              v111 = [(SRSiriViewController *)self _instrumentationManager];
              [v110 logClientFeedbackPresented:v101 dialogIdentifierProvider:v111];

              analyticsSupplement = self->_analyticsSupplement;
              uint64_t v113 = [(SRSiriViewController *)self _instrumentationResponseModeForMode:v127];
              id v139 = v101;
              v114 = +[NSArray arrayWithObjects:&v139 count:1];
              [(SRUIFAnalyticsSupplement *)analyticsSupplement didComputeMode:v113 forAceCommand:obja generatedAceCommands:v114];

              [(SRSiriViewController *)self _processAddViewsCommand:v101 forMode:[(SRSiriViewController *)self _MDModeToSRModeConverter:v127] completion:v123];
              v115 = [(SRSiriViewController *)self _presentation];
              LOBYTE(v113) = objc_opt_respondsToSelector();

              if ((v113 & 1) == 0)
              {
LABEL_98:

                goto LABEL_99;
              }
              v116 = [(SRSiriViewController *)self _presentation];
              [v116 didReceiveAddViewsSignalForSuggestions:self->_addViewsRefId currentMode:v125];
            }

            goto LABEL_98;
          }
          v86 = [(SRSiriViewController *)self _presentation];
          [v86 didPresentSystemUI];
        }
        else
        {
          id v101 = +[SRVisualResponseTransformer transformVisualResponse:v86 forMode:[(SRSiriViewController *)self _MDModeToSRModeConverter:v127] idiom:v93 shouldHideSnippet:0];
        }

        goto LABEL_84;
      }
      v82 = AFSiriLogContextConnection;
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        v141 = "-[SRSiriViewController siriSessionDidReceiveAddViewsCommand:completion:]";
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "%s #modes Applying DisplayOnly mode to suppress interstitials from being spoken", buf, 0xCu);
      }
      unint64_t v127 = 2;
    }

    goto LABEL_63;
  }
  int v13 = [v124 firstObject];
  [(SRSiriViewController *)self handlePlayTrailer:v13 completion:v123];

LABEL_99:
}

- (void)orientationWillChangeTo:(int64_t)a3
{
}

- (void)siriSessionRequestsTTSDuckToVolume:(float)a3 rampTime:(double)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    int v12 = "-[SRSiriViewController siriSessionRequestsTTSDuckToVolume:rampTime:completion:]";
    __int16 v13 = 2048;
    double v14 = a3;
    __int16 v15 = 2048;
    double v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Ducking TTS to %f over time %f", (uint8_t *)&v11, 0x20u);
  }
  *(float *)&double v10 = a3;
  [(SRUIFSpeechSynthesizer *)self->_ttsManager duckTTSVolumeTo:v8 rampTime:v10 completion:a4];
}

- (void)siriSessionWillProcessAppLaunchWithBundleIdentifier:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(SRSiriViewController *)self _presentation];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SRSiriViewController *)self _presentation];
    [v6 siriWillProcessAppLaunchWithBundleIdentifier:v7];
  }
  [(SRSiriSystemUIController *)self->_systemUIController collapseSystemUI];
}

- (void)siriSessionDidEnterLatencyState
{
  id v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SRSiriViewController *)self _presentation];
    [v5 siriDidEnterLatencyState];
  }
}

- (void)siriSessionDidReceiveLatencyInformation:(id)a3
{
  id v7 = a3;
  char v4 = [(SRSiriViewController *)self _presentation];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SRSiriViewController *)self _presentation];
    [v6 siriDidReceiveLatencyInformation:v7];
  }
}

- (void)siriSessionDidBeginTaskWithIdentifier:(id)a3
{
  id v7 = a3;
  char v4 = [(SRSiriViewController *)self _presentation];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SRSiriViewController *)self _presentation];
    [v6 siriDidBeginTaskWithIdentifier:v7];
  }
}

- (void)siriSessionDidReceiveStartImmersiveExperienceCommand:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SRSiriViewController *)self _presentation];
    [v9 siriDidReceiveStartImmersiveExperienceCommand:v10 completion:v6];
  }
}

- (void)siriSessionDidReceiveStartGenAIEnablementFlowCommand:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SRSiriViewController *)self _presentation];
    [v9 siriDidReceiveStartGenAIEnablementFlowCommand:v10 completion:v6];
  }
}

- (void)orchestrationDidPresentResponseFullyInApp
{
  id v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SRSiriViewController *)self _presentation];
    [v5 didPresentResponseFullyInApp];
  }
}

- (void)controllerRequestSystemApertureCollapse
{
  id v2 = [(SRSiriViewController *)self _host];
  [v2 requestSystemApertureCollapse];
}

- (void)controllerRequestSiriDismissal
{
  id v3 = [(SRSiriViewController *)self _presentation];
  [(SRSiriViewController *)self dismissSiriPresentation:v3 withReason:55];
}

- (void)controllerRequestSiriBlurHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SRSiriViewController *)self _host];
  BOOL v6 = !v3;
  [v5 requestHostBlurVisible:v6 reason:2 fence:0];

  id v7 = [(SRSiriViewController *)self traitCollection];
  unsigned int v8 = [v7 isAmbientPresented];

  if (v8)
  {
    id v9 = [(SRSiriViewController *)self _host];
    [v9 setFullScreenDimmingLayerVisible:v6 animated:1];
  }
}

- (void)controllerRequestTapsShared:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SRSiriViewController *)self _host];
  [v5 setShouldPassTouchesThroughToSpringBoard:v3];

  id v7 = [(SRSiriViewController *)self view];
  BOOL v6 = [v7 layer];
  [v6 setHitTestsAsOpaque:v3 ^ 1];
}

- (void)controllerRequestScreenClearedWithClearASR:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SRSiriViewController *)self _presentation];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SRSiriViewController *)self _presentation];
    [v7 resetViewsAndClearASR:v3];
  }
}

- (void)_processAddViewsCommand:(id)a3 forMode:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  int v11 = [(SRSiriViewController *)self _presentation];
  char v12 = objc_opt_respondsToSelector();

  __int16 v13 = v10;
  if (v12)
  {
    double v14 = [(SRSiriViewController *)self _presentation];
    __int16 v13 = [v14 prepareAddViewsCommandForConversation:v10];
  }
  if (SiriUIDisableAlternativesFeature())
  {
    uint64_t v15 = [(SRSiriViewController *)self removeAlternativeFeatureViews:v13];

    __int16 v13 = (void *)v15;
  }
  if ([(SRSiriViewController *)self textInputEnabled]) {
    [(SRSiriViewController *)self _updateKeyboardStatusForAddViewsCommand:v13];
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10004B388;
  v27[3] = &unk_100143DE8;
  id v16 = v9;
  id v28 = v16;
  [(SRSiriViewController *)self _didReceiveAceCommand:v13 completion:v27];
  id v17 = [v13 responseMode];
  unint64_t v18 = [(SRSiriViewController *)self _responseModeToMDModeConverter:v17];

  if ((v18 == 3 || !v18) && _os_feature_enabled_impl()) {
    [(SRSiriViewController *)self _enqueueSpokenSuggestionsFromAddViews:v10];
  }
  if (a4 == 2)
  {
    +[SRUIFAddViewsDurationProvider minimumDisplayDurationForAddViews:v13];
    if (v19 > 0.0) {
      -[SRSiriViewController _delayAceCommandSuccess:forDuration:](self, "_delayAceCommandSuccess:forDuration:", v13);
    }
  }
  long long v20 = [v13 dialogPhase];
  long long v21 = +[AFDialogPhase dialogPhaseForAceDialogPhase:v20];

  if (([v21 isTemporary] & 1) == 0
    && ([v21 isConfirmedDialogPhase] & 1) == 0
    && ([v21 isCancelledDialogPhase] & 1) == 0)
  {
    id v22 = [(SRSiriViewController *)self _repeatablePhrases];
    [v22 removeAllObjects];

    repeatableAudioSayit = self->_repeatableAudioSayit;
    self->_repeatableAudioSayit = 0;
  }
  if (![v21 isTemporary] || objc_msgSend(v21, "isConfirmationDialogPhase"))
  {
    id v24 = [(SRSiriViewController *)self _session];
    [v24 requestDidPresentViewForUICommand:v13];
  }
  if ([v21 isErrorDialogPhase])
  {
    __int16 v25 = [(SRSiriViewController *)self _session];
    [v25 requestDidPresentViewForErrorCommand:v13];
  }
  BOOL v26 = [(SRSiriViewController *)self _activeConversation];
  [v26 addItemsForAddViewsCommand:v13];
}

- (void)disableTouchIDFaceIDIfNecessaryForDucID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((~LODWORD(self->_lockState) & 3) == 0
    && (([v4 isEqualToString:@"misc#answerWhoAmI"] & 1) != 0
     || [v5 isEqualToString:@"misc#answerWhoseIsThis"]))
  {
    char v6 = +[BKDeviceManager availableDevices];
    id v7 = [v6 firstObject];

    if (v7)
    {
      id v15 = 0;
      id v8 = +[BKDevice deviceWithDescriptor:v7 error:&v15];
      id v9 = v15;
      id v10 = v9;
      if (v8)
      {
        id v14 = v9;
        unsigned int v11 = [v8 forceBioLockoutIfLockedForUser:501 error:&v14];
        id v12 = v14;

        __int16 v13 = AFSiriLogContextConnection;
        if (v11)
        {
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 136315394;
            id v17 = "-[SRSiriViewController disableTouchIDFaceIDIfNecessaryForDucID:]";
            __int16 v18 = 2112;
            double v19 = v5;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Disabled BioLock for \"%@\"", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
        {
          sub_1000B8B4C();
        }
        id v10 = v12;
      }
      else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        sub_1000B8B4C();
      }
    }
  }
}

- (void)handlePlayTrailer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)SAVCSPlayContent);
  id v9 = [v6 utsId];
  [v8 setPlayTrailer:1];
  [v8 setContentType:SAVCSContentTypeMovieValue];
  id v10 = +[NSUUID UUID];
  unsigned int v11 = [v10 UUIDString];
  [v8 setAceId:v11];

  [v8 setUtsId:v9];
  id v12 = [v6 hiresTrailerUri];
  __int16 v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v6 lowresTrailerUri];
  }
  id v15 = v14;

  id v16 = [v6 lowresTrailerUri];
  id v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [v6 hiresTrailerUri];
  }
  double v19 = v18;

  if (v15)
  {
    [v8 setHiresTrailerUri:v15];
    [v8 setLowresTrailerUri:v19];
    [(SRSiriViewController *)self siriSessionDidReceivePlayContentCommand:v8 completion:v7];
  }
  else
  {
    id v20 = [objc_alloc((Class)WLKCanonicalPlayablesRequest) initWithCanonicalID:v9];
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10004B7EC;
    v21[3] = &unk_100143ED8;
    id v22 = v8;
    objc_copyWeak(&v24, &location);
    id v23 = v7;
    [v20 makeRequestWithCompletion:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

- (void)siriSessionDidReceiveAddDialogsCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v51 = a4;
  id v7 = objc_alloc((Class)NSMutableString);
  uint64_t v8 = objc_opt_class();
  id v52 = v6;
  id v9 = [v6 aceId];
  id v10 = [v7 initWithFormat:@"<%@: %@>\n", v8, v9];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  unsigned int v11 = [v6 dialogs];
  id v12 = [v11 countByEnumeratingWithState:&v64 objects:v74 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v65;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v65 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        id v16 = +[SiriUIUtilities descriptionForDialog:v15];
        [v10 appendFormat:@"%@\n", v16];

        id v17 = [v15 dialogIdentifier];
        [(SRSiriViewController *)self disableTouchIDFaceIDIfNecessaryForDucID:v17];
      }
      id v12 = [v11 countByEnumeratingWithState:&v64 objects:v74 count:16];
    }
    while (v12);
  }

  if (!self->_listenAfterSpeakingForRequestFinished)
  {
    id v18 = [v52 listenAfterSpeaking];
    unsigned int v19 = [v18 BOOLValue];

    if (v19)
    {
      [(SRSiriViewController *)self _setListenAfterSpeakingForRequestFinished:1];
      id v20 = [v52 listenAfterSpeakingBehavior];
      long long v21 = [v20 startAlertSoundID];
      startRecordingSoundId = self->_startRecordingSoundId;
      self->_startRecordingSoundId = v21;
    }
  }
  id v23 = [v52 requestEndBehavior];
  if (v23)
  {
    id v24 = [(SRSiriViewController *)self _presentation];
    char v25 = objc_opt_respondsToSelector();

    if (v25)
    {
      objc_initWeak((id *)location, self);
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_10004C0FC;
      v61[3] = &unk_100143EB0;
      objc_copyWeak(&v63, (id *)location);
      id v62 = v52;
      [(SRSiriViewController *)self _fetchAttendingState:v61];

      objc_destroyWeak(&v63);
      objc_destroyWeak((id *)location);
    }
  }
  BOOL v26 = [v52 responseMode];
  unint64_t v27 = [(SRSiriViewController *)self _responseModeToMDModeConverter:v26];

  id v28 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id location = 136315138;
    *(void *)&location[4] = "-[SRSiriViewController siriSessionDidReceiveAddDialogsCommand:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%s #modes non-RF response - setting currentMode as computed mode passed from MAF through addDialogs for iOS bridging", location, 0xCu);
  }
  BOOL v29 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v30 = v29;
    uint64_t v31 = MDModeGetName();
    *(_DWORD *)id location = 136315650;
    *(void *)&location[4] = "-[SRSiriViewController siriSessionDidReceiveAddDialogsCommand:completion:]";
    __int16 v70 = 2112;
    v71 = v31;
    __int16 v72 = 2112;
    id v73 = v10;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%s #modes %@ %@", location, 0x20u);
  }
  uint64_t v32 = +[MDDialogTransformer transformAddDialogs:v52 forMode:v27];
  [(SRUIFAnalyticsSupplement *)self->_analyticsSupplement didComputeMode:[(SRSiriViewController *)self _instrumentationResponseModeForMode:v27] forAceCommand:v52 generatedAceCommands:v32];
  __int16 v33 = [(SRSiriViewController *)self _presentation];
  char v34 = objc_opt_respondsToSelector();

  if (v34)
  {
    long long v35 = [(SRSiriViewController *)self _presentation];
    [v35 siriResponseModeDidChange:v27];
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v36 = v32;
  id v37 = [v36 countByEnumeratingWithState:&v57 objects:v68 count:16];
  if (v37)
  {
    uint64_t v38 = *(void *)v58;
    do
    {
      for (j = 0; j != v37; j = (char *)j + 1)
      {
        if (*(void *)v58 != v38) {
          objc_enumerationMutation(v36);
        }
        uint64_t v40 = *(void *)(*((void *)&v57 + 1) + 8 * (void)j);
        BOOL v41 = [(SRSiriViewController *)self _analytics];
        id v42 = [(SRSiriViewController *)self _instrumentationManager];
        [v41 logClientFeedbackPresented:v40 dialogIdentifierProvider:v42];
      }
      id v37 = [v36 countByEnumeratingWithState:&v57 objects:v68 count:16];
    }
    while (v37);
  }

  if ([v36 count])
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10004C184;
    v53[3] = &unk_100143F00;
    id v55 = (char *)[v36 count] - 1;
    unint64_t v56 = v27;
    v53[4] = self;
    id v54 = v51;
    [v36 enumerateObjectsUsingBlock:v53];
  }
  else
  {
    __int16 v43 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v44 = v43;
      id v45 = [v52 aceId];
      *(_DWORD *)id location = 136315394;
      *(void *)&location[4] = "-[SRSiriViewController siriSessionDidReceiveAddDialogsCommand:completion:]";
      __int16 v70 = 2112;
      v71 = v45;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "%s #modes Transformed AddDialogs (aceId = %@) resulted in no commands", location, 0x16u);
    }
    id v46 = [(SRSiriViewController *)self _presentation];
    char v47 = objc_opt_respondsToSelector();

    if (v47)
    {
      id v48 = [(SRSiriViewController *)self _presentation];
      [v48 didOmitDialogFromPresenting];
    }
    if (v51)
    {
      id v49 = [v52 aceId];
      id v50 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v49];
      (*((void (**)(id, void *))v51 + 2))(v51, v50);
    }
  }
}

- (void)siriSessionDidReceiveClearScreenCommand:(id)a3 completion:(id)a4
{
  id v15 = a3;
  id v6 = (void (**)(id, id))a4;
  [(SRSiriViewController *)self _didReceiveAceCommand:v15];
  [(SRSiriViewController *)self _didStartActionForAceCommand:v15];
  id v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SRSiriViewController *)self _presentation];
    [v9 startNewConversation];
  }
  else
  {
    id v10 = [(SRSiriViewController *)self _startNewConversation];
  }
  unsigned int v11 = [v15 initialView];
  id v12 = [v11 speakableText];

  if ([v12 length]) {
    [(SRSiriViewController *)self _setUtteranceToSpeakAfterClearScreenCommand:v12];
  }
  [(SRSiriViewController *)self _didCompleteActionForAceCommand:v15 success:1];
  if (v6)
  {
    id v13 = objc_alloc_init((Class)SACommandSucceeded);
    id v14 = [v15 aceId];
    [v13 setRefId:v14];

    v6[2](v6, v13);
  }
}

- (void)siriSessionDidReceivePlayVoicemailCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  [(SRSiriViewController *)self _didReceiveAceCommand:v6 completion:a4];
  [(SRSiriViewController *)self _didStartActionForAceCommand:v6];
  id v7 = [(SRSiriViewController *)self _voicemailPlayer];
  [v7 setPlaybackCommand:v6];

  id v8 = [(SRSiriViewController *)self _voicemailPlayer];
  [v8 startPlaying];
}

- (AFUIAudioPlayer)_voicemailPlayer
{
  voicemailPlayer = self->_voicemailPlayer;
  if (!voicemailPlayer)
  {
    id v4 = +[AFUIAudioPlayer voicemailPlayer];
    id v5 = self->_voicemailPlayer;
    self->_voicemailPlayer = v4;

    [(AFUIAudioPlayer *)self->_voicemailPlayer setDelegate:self];
    voicemailPlayer = self->_voicemailPlayer;
  }

  return voicemailPlayer;
}

- (id)_configuredSpeakableUtteranceParserForCommand:(id)a3 context:(id)a4 speakableText:(id)a5 subCompletion:(id)a6 speakPreparation:(id *)a7 speakCompletion:(id *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v32 = a6;
  id v15 = +[AFSpeakableUtteranceParser sruif_speakableUtteranceParserForCurrentLanguage];
  [v15 setHandleTTSCodes:1];
  if ([v13 conformsToProtocol:&OBJC_PROTOCOL___SAAceIdentifiable])
  {
    id v16 = v13;
    id v17 = [v16 identifier];
    id v13 = v16;
    if ([v17 isAMOSIdentifier])
    {
      id v13 = [(SRSiriViewController *)self domainObjectForIdentifier:v17];
    }
  }
  uint64_t v48 = 0;
  id v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  if (AFIsInternalInstall())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned __int8 v18 = +[SRUIFUtilities shouldRedactSpeakableTextForAceObject:v12];
      *((unsigned char *)v49 + 24) = v18;
    }
  }
  if (![v15 sruif_hasExternalDomainsForStringWithFormat:v14 shouldRedactLog:*((unsigned __int8 *)v49 + 24)])goto LABEL_15; {
  objc_opt_class();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v21 = AFSiriLogContextConnection;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v22 = objc_opt_class();
      sub_1000B8C60(v22, (uint64_t)v52, v21);
    }

LABEL_15:
    id v20 = 0;
    goto LABEL_16;
  }
  unsigned int v19 = +[SiriUISnippetManager sharedInstance];
  id v20 = [v19 speakableProviderForObject:v13];

  if (v20) {
    [v15 registerProvider:v20 forNamespace:_AFSpeakableUtteranceParserObjDomain];
  }
LABEL_16:
  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v23 = [v20 identifier];
    objc_initWeak(&location, self);
    if (v23)
    {
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10004C9AC;
      v41[3] = &unk_100143F78;
      objc_copyWeak(&v46, &location);
      id v24 = v23;
      id v42 = v24;
      id v43 = v20;
      id v44 = v15;
      id v45 = v14;
      char v25 = objc_retainBlock(v41);

      objc_destroyWeak(&v46);
      goto LABEL_22;
    }
  }
  else
  {
    objc_initWeak(&location, self);
  }
  id v24 = 0;
  char v25 = 0;
LABEL_22:
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10004CCE8;
  v35[3] = &unk_100143FA0;
  objc_copyWeak(&v40, &location);
  __int16 v39 = &v48;
  id v26 = v14;
  id v36 = v26;
  id v27 = v12;
  id v37 = v27;
  id v28 = v32;
  id v38 = v28;
  BOOL v29 = objc_retainBlock(v35);
  if (a7) {
    *a7 = [v25 copy];
  }
  if (a8) {
    *a8 = [v29 copy];
  }
  id v30 = v15;

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  _Block_object_dispose(&v48, 8);

  return v30;
}

- (void)siriSessionDidReceiveSmsPlayAudioCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  [(SRSiriViewController *)self _didReceiveAceCommand:v6 completion:a4];
  [(SRSiriViewController *)self _didStartActionForAceCommand:v6];
  id v7 = [(SRSiriViewController *)self _audioMessagePlayer];
  [v7 setPlaybackCommand:v6];

  id v8 = [(SRSiriViewController *)self _audioMessagePlayer];
  [v8 startPlaying];
}

- (AFUIAudioPlayer)_audioMessagePlayer
{
  audioMessagePlayer = self->_audioMessagePlayer;
  if (!audioMessagePlayer)
  {
    id v4 = +[AFUIAudioPlayer audioMessagePlayer];
    id v5 = self->_audioMessagePlayer;
    self->_audioMessagePlayer = v4;

    [(AFUIAudioPlayer *)self->_audioMessagePlayer setDelegate:self];
    audioMessagePlayer = self->_audioMessagePlayer;
  }

  return audioMessagePlayer;
}

- (void)siriSessionDidReceivePlayNotificationSound:(id)a3 completion:(id)a4
{
  id v7 = a3;
  [(SRSiriViewController *)self _didReceiveAceCommand:v7 completion:a4];
  [(SRSiriViewController *)self _didStartActionForAceCommand:v7];
  [(AFUISiriSession *)self->_session forceAudioSessionActive];
  id v8 = [objc_alloc((Class)TLAlertConfiguration) initWithType:2];
  [v8 setShouldIgnoreRingerSwitch:1];
  id v9 = +[TLAlert alertWithConfiguration:v8];
  [v9 setPlaybackObserver:self];
  p_currentNotificationSound = &self->_currentNotificationSound;
  objc_storeStrong((id *)p_currentNotificationSound, a3);
  unsigned int v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = *p_currentNotificationSound;
    int v13 = 136315650;
    id v14 = "-[SRSiriViewController siriSessionDidReceivePlayNotificationSound:completion:]";
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    unsigned __int8 v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Playing notification sound %@ for command %@ ", (uint8_t *)&v13, 0x20u);
  }
  [v9 playWithCompletionHandler:&stru_100143FC0];
}

- (void)alertDidBeginPlaying:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    id v10 = "-[SRSiriViewController alertDidBeginPlaying:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Alert %@ began playing", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  dispatch_time_t v6 = dispatch_time(0, 1500000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004D454;
  v7[3] = &unk_100143250;
  objc_copyWeak(&v8, (id *)buf);
  v7[4] = self;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)siriSessionDidReceiveSayItCommand:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  id v9 = v7;
  addViewsRefId = self->_addViewsRefId;
  __int16 v11 = [v9 refId];
  LODWORD(addViewsRefId) = [(NSString *)addViewsRefId isEqualToString:v11];

  if (addViewsRefId && self->_addViewsMode == 2)
  {
    id v12 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = v12;
      id v14 = MDModeGetName();
      *(_DWORD *)long long buf = 136315394;
      id v32 = "-[SRSiriViewController siriSessionDidReceiveSayItCommand:completion:]";
      __int16 v33 = 2112;
      char v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #modes Suppressing SayIt command because the mode is %@", buf, 0x16u);
    }
    if (v8)
    {
      id v15 = [v9 refId];
      id v16 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v15];
      v8[2](v8, v16);

LABEL_19:
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  if (!self->_delaySessionEndForInPlacePunchout
    || !+[PrivacyDisclosureManager appRequiresPreflightWithAppBundleId:@"com.apple.Maps"])
  {
    long long v21 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = v21;
      id v23 = +[SiriUIUtilities descriptionForSayIt:v9];
      *(_DWORD *)long long buf = 136315394;
      id v32 = "-[SRSiriViewController siriSessionDidReceiveSayItCommand:completion:]";
      __int16 v33 = 2112;
      char v34 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s #modes %@", buf, 0x16u);
    }
    objc_storeStrong((id *)&self->_previousSayItCommand, a3);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10004D978;
    v29[3] = &unk_100143DE8;
    id v30 = v8;
    [(SRSiriViewController *)self _didReceiveAceCommand:v9 completion:v29];
    id v24 = [(SRSiriViewController *)self _session];
    [v24 requestDidPresentViewForUICommand:v9];

    char v25 = [v9 audioData];
    if (v25)
    {
    }
    else
    {
      uint64_t v26 = [v9 languageCode];
      if (!v26) {
        goto LABEL_18;
      }
      id v27 = (void *)v26;
      id v28 = [v9 message];

      if (!v28) {
        goto LABEL_18;
      }
    }
    objc_storeStrong((id *)&self->_repeatableAudioSayit, a3);
LABEL_18:
    [(SRSiriViewController *)self _performSayItCommand:v9];
    id v15 = v30;
    goto LABEL_19;
  }
  __int16 v17 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v32 = "-[SRSiriViewController siriSessionDidReceiveSayItCommand:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s #modes #punchout Suppressing SayIt command because we are delaying the TTS session for a Maps punchout and the user hasn't accepted the Maps privacy disclosure policy", buf, 0xCu);
  }
  if (v8)
  {
    id v15 = objc_alloc_init((Class)SACommandIgnored);
    unsigned __int8 v18 = [v9 refId];
    [v15 setRefId:v18];

    id v19 = objc_alloc_init((Class)NSUUID);
    id v20 = [v19 UUIDString];
    [v15 setAceId:v20];

    v8[2](v8, v15);
    goto LABEL_19;
  }
LABEL_20:
}

- (void)siriSessionDidReceiveRepeatItCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SRSiriViewController *)self _setListenAfterSpeakingForRequestFinished:self->_listenAfterSpeakingForRepeatable];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10004DDFC;
  v39[3] = &unk_100143DE8;
  id v19 = v7;
  id v40 = v19;
  id v22 = self;
  [(SRSiriViewController *)self _didReceiveAceCommand:v6 completion:v39];
  id v8 = [(SRSiriViewController *)self _session];
  [v8 requestDidPresentViewForUICommand:v6];

  id v20 = [(SRSiriViewController *)v22 _repeatablePhrases];
  uint64_t v35 = 0;
  id v36 = &v35;
  uint64_t v37 = 0x2020000000;
  id v38 = 0;
  id v38 = [v20 count];
  if (v22->_repeatableAudioSayit)
  {
    -[SRSiriViewController _performSayItCommand:](v22, "_performSayItCommand:");
  }
  else if (v36[3])
  {
    [(SRSiriViewController *)v22 _didStartActionForAceCommand:v6];
    objc_initWeak(&location, v22);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id obj = v20;
    id v9 = [obj countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v28;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          int v13 = [v6 aceId];
          id v14 = [v6 refId];
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_10004DE68;
          v23[3] = &unk_100144010;
          char v25 = &v35;
          objc_copyWeak(&v26, &location);
          id v24 = v6;
          [(SRSiriViewController *)v22 _synthesizeText:v12 identifier:v13 sessionId:v14 completion:v23];

          objc_destroyWeak(&v26);
        }
        id v9 = [obj countByEnumeratingWithState:&v27 objects:v41 count:16];
      }
      while (v9);
    }

    objc_destroyWeak(&location);
  }
  else
  {
    id v15 = [v6 contingency];

    if (v15)
    {
      [(SRSiriViewController *)v22 _didStartActionForAceCommand:v6];
      objc_initWeak(&location, v22);
      id v16 = [v6 contingency];
      __int16 v17 = [v6 aceId];
      unsigned __int8 v18 = [v6 refId];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10004DE14;
      v31[3] = &unk_100143FE8;
      objc_copyWeak(&v33, &location);
      id v32 = v6;
      [(SRSiriViewController *)v22 _synthesizeText:v16 identifier:v17 sessionId:v18 completion:v31];

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
  }
  _Block_object_dispose(&v35, 8);
}

- (void)siriSessionDidReceiveShowHelpCommand:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(SRSiriViewController *)self _setShowKeyboardIfTextInputEnabled:1 minimized:1];
  [(SRSiriViewController *)self _didReceiveAceCommand:v7 completion:v6];

  id v8 = [(SRSiriViewController *)self _session];
  [v8 requestDidPresentViewForUICommand:v7];

  id v9 = [(SRSiriViewController *)self _activeConversation];
  [v9 addItemsForShowHelpCommand:v7];
}

- (void)siriSessionDidReceiveUpdateViewsCommand:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(SRSiriViewController *)self _presentation];
    uint64_t v10 = [v9 prepareUpdateViewsCommandForConversation:v13];

    id v11 = (id)v10;
  }
  else
  {
    id v11 = v13;
  }
  id v14 = v11;
  [(SRSiriViewController *)self _didReceiveAceCommand:v11 completion:v6];
  [(SRSiriViewController *)self _didStartActionForAceCommand:v14];
  uint64_t v12 = [(SRSiriViewController *)self _activeConversation];
  [v12 updateWithUpdateViewsCommand:v14];

  [(SRSiriViewController *)self _didCompleteActionForAceCommand:v14 success:1];
}

- (void)siriSessionDidReceiveAppPunchOutCommand:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 aceId];

  if (v10) {
    [(SRSiriViewController *)self _didReceiveAceCommand:v8];
  }
  objc_initWeak(&location, self);
  if (v9)
  {
    id v11 = v13;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10004E214;
    _OWORD v13[3] = &unk_100144038;
    uint64_t v10 = &v16;
    objc_copyWeak(&v16, &location);
    id v4 = &v14;
    id v14 = v8;
    id v5 = &v15;
    id v15 = v9;
  }
  else
  {
    id v11 = 0;
  }
  uint64_t v12 = objc_retainBlock(v11);
  [(SRSiriViewController *)self _performAppPunchOutCommand:v8 completion:v12];

  if (v9)
  {

    objc_destroyWeak(v10);
  }
  objc_destroyWeak(&location);
}

- (void)siriSessionDidReceiveCloseAssistantCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  kdebug_trace();
  id v8 = [v6 reason];
  unsigned int v9 = [v8 isEqualToString:SAUICloseAssistantReasonEMPTY_RECOGNITIONValue];

  if (v9) {
    uint64_t v10 = 53;
  }
  else {
    uint64_t v10 = 10;
  }
  objc_initWeak(&location, self);
  ttsManager = self->_ttsManager;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  id v14[2] = sub_10004E4A4;
  v14[3] = &unk_100144088;
  objc_copyWeak(v17, &location);
  id v12 = v7;
  id v16 = v12;
  id v13 = v6;
  id v15 = v13;
  v17[1] = (id)v10;
  [(SRUIFSpeechSynthesizer *)ttsManager isSynthesisQueueEmpty:v14];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)siriSessionDidReceiveListenForPronunciationCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  ttsManager = self->_ttsManager;
  unsigned int v9 = [v6 aceId];
  uint64_t v10 = [v6 refId];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004EA04;
  _OWORD v13[3] = &unk_1001440B0;
  objc_copyWeak(&v16, &location);
  id v11 = v6;
  id v14 = v11;
  id v12 = v7;
  id v15 = v12;
  [(SRUIFSpeechSynthesizer *)ttsManager enqueueText:0 identifier:v9 sessionId:v10 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)siriSessionDidReceiveSetSuggestedUtterancesCommand:(id)a3 completion:(id)a4
{
  id v14 = a3;
  id v6 = (void (**)(id, void *))a4;
  [(SRSiriViewController *)self _didReceiveAceCommand:v14];
  id v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    unsigned int v9 = [(SRSiriViewController *)self _presentation];
    uint64_t v10 = [v14 utterances];
    id v11 = [v14 language];
    [v9 updateSuggestedUtterances:v10 forLanguage:v11];
  }
  if (v6)
  {
    id v12 = [v14 aceId];
    id v13 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v12];
    v6[2](v6, v13);
  }
}

- (void)siriSessionDidReceiveGetResponseAlternativesPlaybackCommand:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *))a4;
  [(SRSiriViewController *)self _didReceiveAceCommand:v12];
  id v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    unsigned int v9 = [(SRSiriViewController *)self _presentation];
    [v9 handleGetResponseAlternativesPlayback:v12];
  }
  if (v6)
  {
    uint64_t v10 = [v12 aceId];
    id v11 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v10];
    v6[2](v6, v11);
  }
}

- (void)siriSessionDidReceiveSAUIShowFullScreenEffectCommand:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *))a4;
  [(SRSiriViewController *)self _didReceiveAceCommand:v12];
  id v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    unsigned int v9 = [(SRSiriViewController *)self _presentation];
    [v9 showFullScreenEffect:v12];
  }
  if (v6)
  {
    uint64_t v10 = [v12 aceId];
    id v11 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v10];
    v6[2](v6, v11);
  }
}

- (void)siriSessionDidReceiveSAUIShowSpeechAlternativesCommand:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *))a4;
  [(SRSiriViewController *)self _didReceiveAceCommand:v12];
  id v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    unsigned int v9 = [(SRSiriViewController *)self _presentation];
    [v9 showSpeechAlternatives:v12];
  }
  if (v6)
  {
    uint64_t v10 = [v12 aceId];
    id v11 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v10];
    v6[2](v6, v11);
  }
}

- (void)siriSessionDidReceiveSAUIShowRequestHandlingStatusCommand:(id)a3 completion:(id)a4
{
  id v20 = a3;
  id v6 = (void (**)(id, void *))a4;
  [(SRSiriViewController *)self _didReceiveAceCommand:v20];
  id v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    unsigned int v9 = [(SRSiriViewController *)self _presentation];
    [v9 showRequestHandlingStatus:v20];
  }
  else
  {
    uint64_t v10 = [v20 requestHandlingStatus];

    if (!v10) {
      goto LABEL_13;
    }
    id v11 = [v20 requestHandlingStatus];
    unsigned __int8 v12 = [v11 isEqualToString:SAUIShowRequestHandlingStatusRequestHandlingStatusASR_NL_ON_SERVERValue];

    if (v12)
    {
      uint64_t v13 = 1;
    }
    else
    {
      id v14 = [v20 requestHandlingStatus];
      unsigned __int8 v15 = [v14 isEqualToString:SAUIShowRequestHandlingStatusRequestHandlingStatusASR_ON_DEVICE_NL_ON_SERVERValue];

      if (v15)
      {
        uint64_t v13 = 2;
      }
      else
      {
        id v16 = [v20 requestHandlingStatus];
        unsigned int v17 = [v16 isEqualToString:SAUIShowRequestHandlingStatusRequestHandlingStatusASR_NL_ON_DEVICEValue];

        if (v17) {
          uint64_t v13 = 3;
        }
        else {
          uint64_t v13 = 0;
        }
      }
    }
    unsigned int v9 = [(SRSiriViewController *)self _host];
    [v9 setRequestHandlingStatus:v13];
  }

LABEL_13:
  if (v6)
  {
    unsigned __int8 v18 = [v20 aceId];
    id v19 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v18];
    v6[2](v6, v19);
  }
}

- (void)siriSessionDidReceiveSAUIChangePrimaryUtteranceCommand:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = (void (**)(id, void *))a4;
  [(SRSiriViewController *)self _didReceiveAceCommand:v12];
  id v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    unsigned int v9 = [(SRSiriViewController *)self _presentation];
    [v9 changeUtterance:v12];
  }
  if (v6)
  {
    uint64_t v10 = [v12 aceId];
    id v11 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v10];
    v6[2](v6, v11);
  }
}

- (void)siriSessionDidReceiveSetUIGuidedAccessCommand:(id)a3 completion:(id)a4
{
  id v16 = a3;
  id v6 = (void (**)(id, id))a4;
  if ([v16 toggle]) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = [v16 value] ^ 1;
  }
  if (([v16 dryRun] & 1) != 0 || v7)
  {
    id v11 = objc_alloc_init((Class)SACommandFailed);
    [v11 setErrorCode:SASettingValueUnchangedErrorCode];
    id v12 = +[NSString stringWithFormat:@"Guided Access is already off"];
    [v11 setReason:v12];
  }
  else
  {
    Availabilitdouble y = AXGuidedAccessGetAvailability();
    if (!_AXSGuidedAccessEnabled())
    {
      _AXSTripleClickAddOption();
      _AXSGuidedAccessSetEnabled();
      Availabilitdouble y = AXGuidedAccessGetAvailability();
    }
    switch(Availability)
    {
      case 0:
        [(SRSiriViewController *)self _didReceiveAceCommand:v16];
        id v11 = objc_alloc_init((Class)SACommandSucceeded);
        id v14 = [v16 aceId];
        [v11 setRefId:v14];

        if (v6) {
          v6[2](v6, v11);
        }
        unsigned __int8 v15 = [(SRSiriViewController *)self _hostWithErrorHandler:&stru_1001440D0];
        [v15 serviceStartGuidedAccess];

        goto LABEL_15;
      case 1:
      case 2:
      case 4:
      case 5:
      case 6:
      case 12:
      case 14:
        uint64_t v9 = SASettingGuidedAccessTemporarilyUnavailableErrorCode;
        CFStringRef v10 = @"Guided Access not available Right Now";
        goto LABEL_12;
      case 3:
        uint64_t v9 = SASettingGuidedAccessUnavailableInRestoreOrUpdateErrorCode;
        CFStringRef v10 = @"Guided Access not available while restoring or updating";
        goto LABEL_12;
      case 7:
      case 8:
      case 9:
      case 10:
      case 13:
        uint64_t v9 = SASettingGuidedAccessUnavailableForAppErrorCode;
        CFStringRef v10 = @"Guided Access can not be started over this application";
        goto LABEL_12;
      case 11:
        uint64_t v9 = SASettingGuidedAccessPasscodeRequiredErrorCode;
        CFStringRef v10 = @"Guided Access requires a pin code to be set.";
        goto LABEL_12;
      default:
        uint64_t v9 = -1;
        CFStringRef v10 = @"Guided Access failed for an unknown reason.";
LABEL_12:
        [(SRSiriViewController *)self _didReceiveAceCommand:v16];
        id v11 = objc_alloc_init((Class)SACommandFailed);
        [v11 setErrorCode:v9];
        [v11 setReason:v10];
        break;
    }
  }
  uint64_t v13 = [v16 aceId];
  [v11 setRefId:v13];

  if (v6) {
    v6[2](v6, v11);
  }
LABEL_15:
}

- (void)siriSessionDidReceiveHideSiriOverlayCommand:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, id))a4;
  unsigned int v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(SRSiriViewController *)self _presentation];
    [v9 dismissRecordingOverlayAndHideSnippets:[v13 hideSnippets]];

    CFStringRef v10 = [(SRSiriViewController *)self _session];
    [v10 requestDidPresentViewForUICommand:v13];

    if (v6)
    {
      id v11 = objc_alloc_init((Class)SACommandSucceeded);
      id v12 = [v13 aceId];
      [v11 setRefId:v12];

      v6[2](v6, v11);
    }
  }
}

- (void)siriSessionDidReceiveAddContentToViewCommand:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, id))a4;
  unsigned int v7 = [(SRSiriViewController *)self _presentation];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    uint64_t v9 = [(SRSiriViewController *)self _presentation];
    unsigned int v10 = [v9 siriDidReceiveAdditionalContent:v13];

    if (v10)
    {
      id v11 = objc_alloc_init((Class)SACommandSucceeded);
    }
    else
    {
      id v11 = objc_alloc_init((Class)SACommandFailed);
      [v11 setReason:@"The target view could either not be found, was not eligible, or couldn't be delivered the payload"];
    }
    id v12 = [v13 aceId];
    [v11 setRefId:v12];

    if (v6) {
      v6[2](v6, v11);
    }
  }
}

- (void)siriSessionDidReceiveGuideUpdateCommand:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[AFUIGuideCacheManager sharedManager];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004F868;
  v10[3] = &unk_1001440F8;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  [v7 updateCacheWithGuideUpdate:v8 completion:v10];
}

- (void)siriSessionDidReceiveShowNextCardCommand:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v5 = (void (**)(id, id))a4;
  id v6 = +[SRUIFCardLoadingMonitor sharedInstance];
  unsigned int v7 = [v10 cardSnippet];
  [v6 broadcastCardSnippet:v7];

  if (v5)
  {
    id v8 = objc_alloc_init((Class)SACommandSucceeded);
    id v9 = [v10 aceId];
    [v8 setRefId:v9];

    v5[2](v5, v8);
  }
}

- (void)siriSessionDidReceiveShowNextSnippetCommand:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v5 = (void (**)(id, void *))a4;
  id v6 = +[SRUIFCardLoadingMonitor sharedInstance];
  unsigned int v7 = [v10 visualResponse];
  [v6 broadcastVisualResponseSnippet:v7];

  if (v5)
  {
    id v8 = [v10 aceId];
    id v9 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v8];
    v5[2](v5, v9);
  }
}

- (void)siriSessionDidReceiveUpdateVisualResponseSnippetCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  unsigned int v7 = (void (**)(id, void *))a4;
  id v8 = [(SRSiriViewController *)self _presentation];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(SRSiriViewController *)self _presentation];
    unsigned int v11 = [v10 didReceiveUpdateVisualResponseCommand:v6];

    id v12 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = v12;
      id v14 = [v6 viewId];
      unsigned __int8 v15 = NSStringFromBOOL();
      int v19 = 136315650;
      id v20 = "-[SRSiriViewController siriSessionDidReceiveUpdateVisualResponseSnippetCommand:completion:]";
      __int16 v21 = 2112;
      id v22 = v14;
      __int16 v23 = 2112;
      id v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s command with viewId: %@ handled by presentation: %@", (uint8_t *)&v19, 0x20u);
    }
    [(SRSiriViewController *)self _logAceObjectPresented:v6 dialogPhase:0];
    if (v7)
    {
      id v16 = [v6 aceId];
      if (v11) {
        +[SACommandSucceeded sruif_commandSucceededWithRefId:v16];
      }
      else {
      unsigned __int8 v18 = +[SACommandFailed sruif_commandFailedWithRefId:v16];
      }
      v7[2](v7, v18);
      goto LABEL_13;
    }
  }
  else
  {
    unsigned int v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136315394;
      id v20 = "-[SRSiriViewController siriSessionDidReceiveUpdateVisualResponseSnippetCommand:completion:]";
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s presentation does not implement didReceiveUpdateVisualResponseCommand for command:%@", (uint8_t *)&v19, 0x16u);
    }
    if (v7)
    {
      id v16 = [v6 aceId];
      unsigned __int8 v18 = +[SACommandFailed sruif_commandFailedWithRefId:v16];
      v7[2](v7, v18);
LABEL_13:
    }
  }
}

- (void)siriSessionDidReceivePreSynthesizeTTSCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_1000B9174(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  objc_initWeak(&location, self);
  objc_copyWeak(&v18, &location);
  id v16 = v6;
  id v17 = v7;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)siriSessionDidReceiveDisambiguationItemSelected:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v5 = (void (**)(id, void *))a4;
  id v6 = +[AFUIDisambiguationAnalyticsManager sharedManager];
  [v6 logDisambiguationItemSelected:v9];

  if (v5)
  {
    id v7 = [v9 refId];
    id v8 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v7];
    v5[2](v5, v8);
  }
}

- (void)siriSessionSpeechRecordingDidChangeAVRecordRoute:(id)a3
{
  id v7 = a3;
  [(SRSiriViewController *)self _setCurrentAVRecordRoute:"_setCurrentAVRecordRoute:"];
  [UIApp finishedIPTest:SUICPPTTestNameSiriBringupTVSyntheticSpeechCapturedToSpeechRecording];
  id v4 = [(SRSiriViewController *)self _presentation];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SRSiriViewController *)self _presentation];
    [v6 speechRecordingDidBeginOnRecordRoute:v7];
  }
}

- (void)siriSessionSpeechRecordingDidEnd
{
  BOOL v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v7 = [(SRSiriViewController *)self _presentation];
    char v5 = [(SRSiriViewController *)self _requestOptions];
    id v6 = [(SRSiriViewController *)self _currentAVRecordRoute];
    [v7 speechRecordingDidEndForRequest:v5 onAVRecordRoute:v6];
  }
}

- (void)siriSessionSpeechRecordingDidCancel
{
  BOOL v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v7 = [(SRSiriViewController *)self _presentation];
    char v5 = [(SRSiriViewController *)self _requestOptions];
    id v6 = [(SRSiriViewController *)self _currentAVRecordRoute];
    [v7 speechRecordingDidCancelForRequest:v5 onAVRecordRoute:v6];
  }
}

- (void)siriSessionSpeechRecordingDidFailWithError:(id)a3
{
  id v9 = a3;
  char v4 = [(SRSiriViewController *)self _presentation];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SRSiriViewController *)self _presentation];
    id v7 = [(SRSiriViewController *)self _requestOptions];
    id v8 = [(SRSiriViewController *)self _currentAVRecordRoute];
    [v6 speechRecordingDidFailForRequest:v7 onAVRecordRoute:v8 withError:v9];
  }
}

- (BOOL)siriSessionShouldRequestUpdateForViewWithIdentifier:(id)a3
{
  id v4 = a3;
  char v5 = [(SRSiriViewController *)self _activeConversation];
  unsigned __int8 v6 = [v5 containsItemForAceViewWithIdentifier:v4];

  return v6;
}

- (void)siriSessionDidDetectMusic
{
  BOOL v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SRSiriViewController *)self _presentation];
    [v5 siriDidDetectMusic];
  }
}

- (void)siriSessionDidDetectSpeechStartpoint
{
  BOOL v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SRSiriViewController *)self _presentation];
    [v5 speechRecordingDidDetectSpeechStartpoint];
  }
}

- (void)siriSessionDidUpdateAudioSessionID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[SRSiriViewController siriSessionDidUpdateAudioSessionID:]";
    __int16 v12 = 1024;
    int v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #tts 4 %u", (uint8_t *)&v10, 0x12u);
  }
  [(SRUIFSpeechSynthesizer *)self->_ttsManager setAudioSessionID:v3];
  unsigned __int8 v6 = [(SRSiriViewController *)self _requestOptions];
  if ([v6 isForBluetoothCar]) {
    goto LABEL_6;
  }
  id v7 = [(SRSiriViewController *)self _requestOptions];
  if ([v7 isAnnounceRequest])
  {

LABEL_6:
LABEL_7:
    [(SRUIFSpeechSynthesizer *)self->_ttsManager prewarmIfNeeded];
    return;
  }
  id v8 = [(SRSiriViewController *)self _requestOptions];
  unsigned __int8 v9 = [v8 isForStark];

  if (v9) {
    goto LABEL_7;
  }
}

- (void)siriSessionDidReceiveAudioSessionInterruptionBeganWithUserInfo:(id)a3 machAbsoluteTime:(unint64_t)a4
{
  id v9 = objc_alloc_init((Class)SISchemaPNRFatalErrorInfo);
  [v9 setErrorDomain:kAFAssistantErrorDomain];
  unsigned __int8 v6 = +[NSString stringWithFormat:@"%ld", 48];
  [v9 setErrorCode:v6];

  id v7 = objc_alloc_init((Class)SISchemaPNRFatalError);
  [v7 setError:v9];
  id v8 = [(SRSiriViewController *)self _instrumentationManager];
  [v8 emitInstrumentation:v7 atTime:a4];
}

- (void)siriSessionRequestsPlayPhaticWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v11 = "-[SRSiriViewController siriSessionRequestsPlayPhaticWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #phatic 5", buf, 0xCu);
  }
  ttsManager = self->_ttsManager;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000509CC;
  v8[3] = &unk_100143CE8;
  id v9 = v4;
  id v7 = v4;
  [(SRUIFSpeechSynthesizer *)ttsManager enqueuePhaticWithCompletion:v8];
}

- (void)siriSessionWillShowAudioRoutePicker
{
}

- (void)siriSessionWillDismissAudioRoutePicker
{
}

- (void)siriSessionDidInitializeSessionInfo:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_siriSessionInfo, a3);
  if (objc_opt_respondsToSelector()) {
    [(SiriUIPresentation *)self->_presentation siriSessionDidInitializeSessionInfo:v5];
  }
}

- (void)siriSessionDidUpdateSessionInfo:(id)a3
{
  id v4 = a3;
  -[SRUIFSiriSessionInfo applyInfo:](self->_siriSessionInfo, "applyInfo:");
  if (objc_opt_respondsToSelector()) {
    [(SiriUIPresentation *)self->_presentation siriSessionDidUpdateSessionInfo:v4];
  }
}

- (void)siriSessionDidReceivePlayContentCommand:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (objc_opt_respondsToSelector()) {
    [(SiriUIPresentation *)self->_presentation handlePlayContentCommand:v7 completion:v6];
  }
}

- (void)siriSessionDidReceiveLaunchTVRemoteCommand:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 hashedRouteId];
  id v8 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v7 options:0];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100050D98;
  _OWORD v13[3] = &unk_100144148;
  id v14 = objc_alloc_init((Class)AFSecurityConnection);
  id v15 = v7;
  id v16 = v5;
  id v17 = v6;
  id v9 = v5;
  id v10 = v6;
  id v11 = v7;
  id v12 = v14;
  [v12 processData:v8 usingProcedure:2 completion:v13];
}

- (void)siriSessionDidReceiveSnippetConfigurationRequestCommand:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(id, id))a4;
  id v7 = a3;
  id v30 = objc_alloc_init((Class)SAUISize);
  id v8 = [(SRSiriViewController *)self presentation];
  if (objc_opt_respondsToSelector())
  {
    [v8 maxSizeForSnippet];
    double v10 = v9;
    double v12 = v11;
    int v13 = [(SRSiriViewController *)self view];
    id v14 = [v13 traitCollection];
    unsigned int v15 = [v14 isAmbientPresented];

    if (v15) {
      double v10 = v10 / SiriSharedUICompactAmbientContentScaleAmount;
    }
    [v30 setWidth:(uint64_t)v10];
    [v30 setHeight:(uint64_t)v12];
    id v16 = +[UIWindow _applicationKeyWindow];
    id v17 = [v16 windowScene];
    id v18 = [v17 screen];
    [v18 scale];
    [v30 setScale:];
  }
  id v19 = objc_alloc_init((Class)SAUISnippetDisplayConfigurationResponse);
  [v19 setEstimatedVisibleSnippetDisplaySize:v30];
  id v20 = [v7 aceId];

  [v19 setRefId:v20];
  [v19 setAccessibilityDifferentiateWithoutColor:UIAccessibilityShouldDifferentiateWithoutColor()];
  [v19 setAccessibilityInvertColors:UIAccessibilityIsInvertColorsEnabled()];
  [v19 setAccessibilityReduceMotion:UIAccessibilityIsReduceMotionEnabled()];
  [v19 setAccessibilityReduceTransparency:UIAccessibilityIsReduceTransparencyEnabled()];
  int IsRTL = SiriSharedUILanguageIsRTL();
  id v22 = &SAUITextDirectionRightToLeftValue;
  if (!IsRTL) {
    id v22 = &SAUITextDirectionLeftToRightValue;
  }
  [v19 setTextDirection:*v22];
  __int16 v23 = [(SRSiriViewController *)self _presentationViewController];
  id v24 = [v23 traitCollection];

  char v25 = [v24 aceDisplayColorScheme];
  [v19 setDisplayColorScheme:v25];

  id v26 = [v24 aceDisplayColorGamut];
  [v19 setDisplayGamut:v26];

  long long v27 = [v24 aceDynamicTypeSize];
  [v19 setDynamicTypeSize:v27];

  long long v28 = [v24 aceTextLegibilityWeight];
  [v19 setTextLegibilityWeight:v28];

  long long v29 = [v24 aceDisplayContrast];
  [v19 setDisplayContrast:v29];

  v6[2](v6, v19);
}

- (void)siriPresentation:(id)a3 requestHostBlurVisible:(BOOL)a4 reason:(int64_t)a5 fence:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (a5 == 2 && [(SRSiriSystemUIController *)self->_systemUIController presentingSystemUI])
  {
    double v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      unsigned int v15 = "-[SRSiriViewController siriPresentation:requestHostBlurVisible:reason:fence:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #SystemAperture - Not blurring the lock screen for content presentation", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    int v13 = [(SRSiriViewController *)self _host];
    [v13 requestHostBlurVisible:v8 reason:a5 fence:v11];
  }
}

- (void)siriPresentation:(id)a3 reduceOrbOpacity:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRSiriViewController *)self _host];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SRSiriViewController *)self _host];
    [v8 reduceOrbOpacity:v4];
  }
}

- (void)conversation:(id)a3 didChangeWithTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SRSiriViewController *)self _activeConversation];

  if (v8 == v6) {
    [(SRSiriViewController *)self _deletePreviousConversation];
  }
  id v9 = objc_alloc_init((Class)NSArray);
  id v10 = [v7 insertedItemIndexPaths];

  if (v10)
  {
    id v11 = [v7 insertedItemIndexPaths];
    uint64_t v12 = [v9 arrayByAddingObjectsFromArray:v11];

    id v9 = (id)v12;
  }
  int v13 = [v7 updatedItemIndexPaths];

  if (v13)
  {
    int v14 = [v7 updatedItemIndexPaths];
    uint64_t v15 = [v9 arrayByAddingObjectsFromArray:v14];

    id v9 = (id)v15;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v16 = v9;
  id v17 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v26;
    do
    {
      id v20 = 0;
      do
      {
        if (*(void *)v26 != v19) {
          objc_enumerationMutation(v16);
        }
        -[SRSiriViewController _didStartActionForItemAtIndexPath:inConversation:](self, "_didStartActionForItemAtIndexPath:inConversation:", *(void *)(*((void *)&v25 + 1) + 8 * (void)v20), v6, (void)v25);
        id v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v16 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v18);
  }

  __int16 v21 = [(SRSiriViewController *)self _presentation];
  [(SRUIFAnalyticsSupplement *)self->_analyticsSupplement storeDialogPhasesForItemsAtIndexPaths:v16 forConversation:v6];
  if ([(SRSiriViewController *)self _presentationSupportsConversationDidChangeWithTransaction:v21])
  {
    [v21 conversation:v6 didChangeWithTransaction:v7];
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      id v22 = [v7 updatedItemIndexPaths];
      if ([v22 count]) {
        [v21 conversation:v6 didUpdateItemsAtIndexPaths:v22];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      __int16 v23 = [v7 insertedItemIndexPaths];
      if ([v23 count]) {
        [v21 conversation:v6 didInsertItemsAtIndexPaths:v23];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      id v24 = [v7 presentationStateChangedItemIndexPaths];
      if ([v24 count]) {
        [v21 conversation:v6 didChangePresentationStateForItemsAtIndexPaths:v24];
      }
    }
  }
}

- (BOOL)_presentationSupportsConversationDidChangeWithTransaction:(id)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (void)conversation:(id)a3 didRemoveItemsWithIdentifiers:(id)a4 atIndexPaths:(id)a5 parentItemIdentifiers:(id)a6
{
  id v15 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [(SRSiriViewController *)self _activeConversation];

  if (v13 == v15) {
    [(SRSiriViewController *)self _deletePreviousConversation];
  }
  int v14 = [(SRSiriViewController *)self _presentation];
  if (objc_opt_respondsToSelector()) {
    [v14 conversation:v15 didRemoveItemsWithIdentifiers:v10 atIndexPaths:v11 parentItemIdentifiers:v12];
  }
}

- (void)siriSessionDidReceiveExtendCurrentTTSCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  self->_BOOL delaySessionEndForInPlacePunchout = 1;
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[SRSiriViewController siriSessionDidReceiveExtendCurrentTTSCommand:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #punchout received request to delay current session end for In Place Punchout", (uint8_t *)&v11, 0xCu);
  }
  id v9 = [v6 aceId];
  id v10 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v9];
  v7[2](v7, v10);
}

- (void)siriSessionDidReceiveRevealRecognizedSpeechCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = [(SRSiriViewController *)self _presentation];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(SRSiriViewController *)self _presentation];
    [v10 didReceiveRevealRecognizedSpeechCommand:v6];

    [(SRSiriViewController *)self _logAceObjectPresented:v6 dialogPhase:0];
    int v11 = [v6 aceId];
    uint64_t v12 = +[SACommandSucceeded sruif_commandSucceededWithRefId:v11];
  }
  else
  {
    id v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315394;
      id v16 = "-[SRSiriViewController siriSessionDidReceiveRevealRecognizedSpeechCommand:completion:]";
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s presentation does not implement didReceiveRevealRecognizedSpeechCommand for command:%@", (uint8_t *)&v15, 0x16u);
    }
    int v11 = [v6 aceId];
    uint64_t v12 = +[SACommandFailed sruif_commandFailedWithRefId:v11];
  }
  int v14 = (void *)v12;
  v7[2](v7, v12);

  [(SRSiriViewController *)self _logRevealSpeechCommandReceived:v6];
}

- (void)siriSessionDidReceivePaginateListCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SRSiriViewController *)self _presentation];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(SRSiriViewController *)self _presentation];
    [v10 didReceivePaginateListCommand:v6 completion:v7];

    [(SRSiriViewController *)self _logAceObjectPresented:v6 dialogPhase:0];
  }
  else
  {
    int v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315394;
      int v15 = "-[SRSiriViewController siriSessionDidReceivePaginateListCommand:completion:]";
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s presentation does not implement didReceivePaginateListCommand for command:%@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v12 = [v6 aceId];
    id v13 = +[SACommandFailed sruif_commandFailedWithRefId:v12];
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
  }
}

- (int64_t)siriStateForSiriPresentation:(id)a3
{
  return self->_siriState;
}

- (int64_t)siriPresentationStateForSiriPresentation:(id)a3
{
  return self->_presentationState;
}

- (id)conversationIdentifiersForSiriPresentation:(id)a3
{
  uint64_t v3 = [(SRSiriViewController *)self _conversations];
  BOOL v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) identifier:(void)v12];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)siriPresentation:(id)a3 conversationWithIdentifier:(id)a4
{
  return [(SRSiriViewController *)self _conversationWithIdentifier:a4];
}

- (void)siriPresentation:(id)a3 deleteConversationWithIdentifier:(id)a4
{
}

- (void)siriPresentation:(id)a3 activateConversationWithIdentifier:(id)a4
{
  id v5 = [(SRSiriViewController *)self _conversationWithIdentifier:a4];
  [(SRSiriViewController *)self _activateConversation:v5];
}

- (id)siriPresentation:(id)a3 identifierOfItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSiriViewController *)self _activeConversation];
  id v7 = [v6 identifierOfItemAtIndexPath:v5];

  return v7;
}

- (id)siriPresentation:(id)a3 indexPathForItemWithIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSiriViewController *)self _activeConversation];
  id v7 = [v6 indexPathForItemWithIdentifier:v5];

  return v7;
}

- (id)_activeConversationItemAtIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSiriViewController *)self _activeConversation];
  id v6 = [v5 itemAtIndexPath:v4];

  return v6;
}

- (int64_t)siriPresentation:(id)a3 typeOfItemAtIndexPath:(id)a4
{
  id v4 = [(SRSiriViewController *)self _activeConversationItemAtIndexPath:a4];
  id v5 = (char *)[v4 type];

  if ((unint64_t)(v5 - 1) >= 5) {
    return 0;
  }
  else {
    return (int64_t)v5;
  }
}

- (int64_t)siriPresentation:(id)a3 numberOfChildrenForItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSiriViewController *)self _activeConversation];
  id v7 = [v6 numberOfChildrenForItemAtIndexPath:v5];

  return (int64_t)v7;
}

- (id)siriPresentation:(id)a3 aceObjectForItemAtIndexPath:(id)a4
{
  id v4 = [(SRSiriViewController *)self _activeConversationItemAtIndexPath:a4];
  id v5 = [v4 aceObject];

  return v5;
}

- (id)siriPresentation:(id)a3 aceCommandIdentifierForItemAtIndexPath:(id)a4
{
  id v4 = [(SRSiriViewController *)self _activeConversationItemAtIndexPath:a4];
  id v5 = [v4 aceCommandIdentifier];

  return v5;
}

- (id)siriPresentation:(id)a3 dialogPhaseForItemAtIndexPath:(id)a4
{
  return [(SRSiriViewController *)self _dialogPhaseForItemAtIndexPath:a4];
}

- (void)siriPresentation:(id)a3 insertAceViews:(id)a4 withDialogPhase:(id)a5 asItemsAtIndexPaths:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(SRSiriViewController *)self _activeConversation];
  [v12 insertItemsForAceViews:v11 withDialogPhase:v10 atIndexPaths:v9];
}

- (void)siriPresentation:(id)a3 removeItemsAtIndexPaths:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSiriViewController *)self _activeConversation];
  [v6 removeItemsAtIndexPaths:v5];
}

- (void)siriPresentation:(id)a3 addSelectionResponse:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSiriViewController *)self _activeConversation];
  [v6 addSelectionResponse:v5];
}

- (id)siriPresentation:(id)a3 domainObjectForIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [(SRSiriViewController *)self domainObjectStoreForSiriPresentation:a3];
  uint64_t v8 = [v7 domainObjectForIdentifier:v6];

  return v8;
}

- (void)siriPresentation:(id)a3 setDomainObject:(id)a4 forIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(SRSiriViewController *)self domainObjectStoreForSiriPresentation:a3];
  [v10 setDomainObject:v9 forIdentifier:v8];
}

- (BOOL)siriPresentation:(id)a3 itemAtIndexPathIsVirgin:(id)a4
{
  id v4 = [(SRSiriViewController *)self _activeConversationItemAtIndexPath:a4];
  unsigned __int8 v5 = [v4 isVirgin];

  return v5;
}

- (id)sessionInfoForSiriPresentation:(id)a3
{
  return self->_siriSessionInfo;
}

- (double)contentWidthForForSiriPresentation:(id)a3
{
  uint64_t v3 = [(SRSiriViewController *)self view];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v19.origin.double x = v5;
  v19.origin.double y = v7;
  v19.size.double width = v9;
  v19.size.double height = v11;
  double Width = CGRectGetWidth(v19);
  long long v13 = objc_opt_class();
  uint64_t IsPhone = SiriUIDeviceIsPhone();
  uint64_t IsZoomed = SiriUIDeviceIsZoomed();
  uint64_t IsLargeFormatPad = SiriUIDeviceIsLargeFormatPad();

  _[v13 _contentWidthForWidth:IsPhone isPhone:IsZoomed isZoomed:IsLargeFormatPad isLargeFormatPad:Width];
  return result;
}

- (void)tapToEditPresented:(id)a3
{
}

+ (double)_contentWidthForWidth:(double)result isPhone:(BOOL)a4 isZoomed:(BOOL)a5 isLargeFormatPad:(BOOL)a6
{
  if (a4)
  {
    double v6 = (double *)&SiriUIPhoneMaxContentWidth;
  }
  else
  {
    if (a6) {
      return SiriUILargeFormatPadContentWidth;
    }
    double v6 = (double *)&SiriUIPadZoomedMaxContentWidth;
    if (!a5) {
      double v6 = (double *)&SiriUIPadMaxContentWidth;
    }
  }
  if (*v6 <= result) {
    return *v6;
  }
  return result;
}

- (BOOL)textInputEnabled
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ![(SASRequestOptions *)self->_requestOptions isTypeToSiriRequest])
  {
    return 0;
  }
  uint64_t v3 = [(SRSiriViewController *)self _presentation];
  unsigned __int8 v4 = [v3 supportsTextInput];

  return v4;
}

- (CGRect)statusBarFrameForSiriPresentation:(id)a3
{
  [(SRSiriViewController *)self _statusBarFrame];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (double)statusViewHeightForSiriPresentation:(id)a3
{
  if ([(SRSiriViewController *)self textInputEnabled]
    && (!self->_requestActive || [(SASRequestOptions *)self->_requestOptions inputType] != (id)2))
  {
    return 0.0;
  }

  [(SRSiriViewController *)self _statusViewHeight];
  return result;
}

- ($5902F3589ABA92D8028CA1BE72F4BD0A)keyboardInfoForSiriPresentation:(SEL)a3
{
  CGSize size = self[2].var3.size;
  *(CGPoint *)&retstr->var0 = self[2].var3.origin;
  *(CGSize *)&retstr->var3.origin.double y = size;
  *(_OWORD *)&retstr->var3.size.double height = *(_OWORD *)&self[2].var4;
  return self;
}

- (id)activeRequestOptionsForSiriPresentation:(id)a3
{
  if (![(SRSiriViewController *)self _isSiriIdleAndQuiet]
    || ([(SASRequestOptions *)self->_requestOptions isTypeToSiriRequest] & 1) != 0
    || [(SASRequestOptions *)self->_requestOptions requestSource] == (id)53)
  {
    id v4 = [(SASRequestOptions *)self->_requestOptions copy];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)siriPresentation:(id)a3 startRequestWithOptions:(id)a4
{
}

- (void)siriPresentation:(id)a3 startRequestForText:(id)a4
{
  id v5 = a4;
  if ([v5 length]) {
    [(SRSiriViewController *)self startRequestForText:v5];
  }
}

- (void)siriPresentation:(id)a3 startRequestForSuggestion:(id)a4 inputType:(int64_t)a5
{
  id v7 = a4;
  if ([v7 length]) {
    [(SRSiriViewController *)self startRequestForSuggestion:v7 inputType:a5];
  }
}

- (void)siriPresentationKeyboardViewDidAppear:(id)a3
{
  id v4 = [(SRSiriViewController *)self _host];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SRSiriViewController *)self _host];
    [v6 presentationDidPresentKeyboard];
  }
}

- (void)stopRecordingSpeechForSiriPresentation:(id)a3
{
  id v3 = [(SRSiriViewController *)self _session];
  [v3 stopRecordingSpeech];
}

- (void)cancelRequestForSiriPresentation:(id)a3
{
  id v3 = [(SRSiriViewController *)self _session];
  [v3 cancelSpeechRequest];
}

- (void)siriResultsDidDismissInTamaleForSiriPresentation:(id)a3
{
  id v3 = [(SRSiriViewController *)self _hostWithErrorHandler:&stru_100144168];
  [v3 siriResultsDidDismissInTamale];
}

- (void)forceAudioSessionInactiveForSiriPresentation:(id)a3
{
  id v3 = [(SRSiriViewController *)self _session];
  [v3 forceAudioSessionInactive];
}

- (void)dismissSiriPresentation:(id)a3 withReason:(int64_t)a4
{
  id v6 = a3;
  id v7 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    double v10 = "-[SRSiriViewController dismissSiriPresentation:withReason:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #idleTimer cancelling idle timer", (uint8_t *)&v9, 0xCu);
  }
  if ([(SRSiriViewController *)self _isReadingBulletinContentInCarPlayOutsideOfSiriSession])
  {
    double v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      double v10 = "-[SRSiriViewController dismissSiriPresentation:withReason:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #cmas #carPlay received a dismissal request while we are reading bulletin content outside of a Siri session. Cancelling speech synthesis.", (uint8_t *)&v9, 0xCu);
    }
    [(SRSiriViewController *)self _cancelSpeechSynthesis];
  }
  [(SRSiriViewController *)self _setIdleTimerEnabled:0];
  [(SRSiriViewController *)self _cancelIdleTimer];
  [(SRSiriViewController *)self _dismissWithReason:a4];
}

- (void)siriWillStopAttending:(id)a3
{
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SRSiriViewController siriWillStopAttending:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #autodismiss telling session to stop attending for attention loss", (uint8_t *)&v6, 0xCu);
  }
  char v5 = [(SRSiriViewController *)self _session];
  [v5 stopAttending];
}

- (void)_siriPresentation:(id)a3 speakTextForConversationItemIdentifier:(id)a4 delayed:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(SRSiriViewController *)self _setStartRequestAceCommandSent:0];
  double v10 = [(SRSiriViewController *)self _activeConversation];
  if ([v10 containsItemWithIdentifier:v9])
  {
    CGFloat v11 = [v10 itemWithIdentifier:v9];
    id v12 = [v11 aceCommandIdentifier];
    if (v12)
    {
      long long v13 = [(SRSiriViewController *)self _aceCommandWithIdentifier:v12];
      if (v13)
      {
        long long v14 = [(SRSiriViewController *)self _aceCommandRecords];
        id v15 = [v14 resultForAceCommand:v13];

        if (v15 != (id)2)
        {
          id v16 = [v11 type];
          id v17 = [v11 aceObject];
          uint64_t v50 = [(id)objc_opt_class() _speechIdentifierForConversationItem:v11];
          char v51 = v17;
          BOOL v41 = v5;
          if (v16 == (id)3)
          {
            id v18 = v17;
            uint64_t v19 = [v18 context];
            id v49 = [v18 refId];
            unsigned __int8 v40 = [v18 canUseServerTTS];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v18 sruif_combinedSpeakableText];
            }
            else {
            uint64_t v22 = [v18 speakableText];
            }
            if (AFDeviceSupportsTTS())
            {
              if (v22)
              {
                uint64_t v52 = v22;
                uint64_t v42 = v19;
                __int16 v23 = [(SRSiriViewController *)self _presentation];
                char v24 = objc_opt_respondsToSelector();

                if (v24)
                {
                  long long v25 = [(SRSiriViewController *)self _presentation];
                  [v25 updateFeedbackFormWithSpeakableText:v52];

                  uint64_t v22 = v52;
                  uint64_t v19 = v42;
                }
                else
                {
                  uint64_t v19 = v42;
                  uint64_t v22 = v52;
                }
              }
            }
            else
            {
              id v53 = (void *)v22;
              long long v26 = AFSiriLogContextConnection;
              if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 136315138;
                id v63 = "-[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:]";
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s #tts Device does not support tts, overriding speakable text since tts is not supported", buf, 0xCu);
              }

              uint64_t v22 = 0;
            }
            uint64_t v48 = [v18 speakableContextInfo];
          }
          else
          {
            uint64_t v48 = 0;
            id v49 = 0;
            uint64_t v22 = 0;
            uint64_t v19 = 0;
            unsigned __int8 v40 = 1;
          }
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_100053220;
          v55[3] = &unk_1001434D8;
          id v56 = v8;
          id v57 = v10;
          id v58 = v9;
          id v27 = v11;
          id v59 = v27;
          id v43 = (void *)v19;
          id v54 = (void *)v22;
          __int16 v39 = objc_retainBlock(v55);
          id v46 = -[SRSiriViewController _configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPreparation:speakCompletion:](self, "_configuredSpeakableUtteranceParserForCommand:context:speakableText:subCompletion:speakPreparation:speakCompletion:", v13, v19, v22);
          id v47 = 0;
          id v45 = 0;
          long long v28 = [v27 dialogPhase];
          unsigned int v37 = [v28 isExpository];

          long long v29 = [v27 dialogPhase];
          uint64_t v30 = [v29 aceDialogPhaseValue];

          id v38 = (void *)v30;
          if (v30)
          {
            CFStringRef v60 = @"dialogPhase";
            uint64_t v61 = v30;
            id v44 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
          }
          else
          {
            id v44 = 0;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v31 = [v27 aceObject];
            id v32 = [v31 preferredSpeakableTextVoice];
          }
          else
          {
            id v32 = 0;
          }
          id v33 = v54;
          LOBYTE(v36) = v40;
          [(SRSiriViewController *)self _speakText:v54 identifier:v50 sessionId:v49 preferredVoice:v32 provisionally:v37 eligibleAfterDuration:v41 delayed:0.4 canUseServerTTS:v36 speakableUtteranceParser:v46 analyticsContext:v44 speakableContextInfo:v48 preparation:v47 completion:v45];
          if (v54)
          {
            char v34 = [v27 aceObject];
            uint64_t v35 = [v27 dialogPhase];
            [(SRSiriViewController *)self _logAceObjectSpoken:v34 dialogPhase:v35 speakableText:v54];

            id v33 = v54;
          }
        }
      }
    }
    else
    {
      __int16 v21 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315394;
        id v63 = "-[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:]";
        __int16 v64 = 2112;
        id v65 = v9;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Not speaking conversation item:%@. Item missing aceCommandIdentifier.", buf, 0x16u);
      }
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        goto LABEL_35;
      }
      long long v13 = [v11 identifier];
      [v8 siriDidFinishActionsForConversationItemWithIdentifier:v13 inConversation:v10];
    }

LABEL_35:
    goto LABEL_36;
  }
  id v20 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    id v63 = "-[SRSiriViewController _siriPresentation:speakTextForConversationItemIdentifier:delayed:]";
    __int16 v64 = 2112;
    id v65 = v9;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Not speaking conversation item:%@. Item doesn't exist in activeConversation.", buf, 0x16u);
  }
LABEL_36:
}

- (void)_siriPresentation:(id)a3 speakTextForConversationItemIdentifierDidBecomeReady:(id)a4
{
  id v5 = a4;
  int v6 = [(SRSiriViewController *)self _activeConversation];
  id v8 = [v6 itemWithIdentifier:v5];

  id v7 = [(id)objc_opt_class() _speechIdentifierForConversationItem:v8];
  [(SRUIFSpeechSynthesizer *)self->_ttsManager processDelayedItem:v7];
}

- (void)siriPresentationDidPresentUserInterface:(id)a3
{
  id v3 = [(SRSiriViewController *)self _host];
  [v3 serviceDidPresentUserInterface];
}

- (void)siriPresentation:(id)a3 didPresentConversationItemsWithIdentifiers:(id)a4
{
  id v31 = a3;
  id v6 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v33;
    *(void *)&long long v8 = 136315394;
    long long v29 = v8;
    uint64_t v30 = *(void *)v33;
    do
    {
      CGFloat v11 = 0;
      do
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v11);
        long long v13 = [(SRSiriViewController *)self _activeConversation];
        unsigned int v14 = [v13 containsItemWithIdentifier:v12];

        if (v14)
        {
          id v15 = [(SRSiriViewController *)self _activeConversation];
          id v16 = [v15 itemWithIdentifier:v12];

          id v17 = [v16 revisionIdentifier];
          id v18 = [(SRSiriViewController *)self _presentedConversationItemRevisionIdentifiers];
          unsigned int v19 = [v18 containsObject:v17];

          if (v19)
          {
            id v20 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = v29;
              unsigned int v37 = "-[SRSiriViewController siriPresentation:didPresentConversationItemsWithIdentifiers:]";
              __int16 v38 = 2112;
              __int16 v39 = v16;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s Ignoring conversation item because we have already presented it { item: %@ }", buf, 0x16u);
            }
          }
          else
          {
            id v21 = v6;
            uint64_t v22 = [(SRSiriViewController *)self _delayedConversationItemRevisionIdentifiers];
            unsigned int v23 = [v22 containsObject:v17];

            char v24 = AFSiriLogContextConnection;
            BOOL v25 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
            if (v23)
            {
              if (v25)
              {
                *(_DWORD *)long long buf = v29;
                unsigned int v37 = "-[SRSiriViewController siriPresentation:didPresentConversationItemsWithIdentifiers:]";
                __int16 v38 = 2112;
                __int16 v39 = v16;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Delayed conversation item was presented; processing { item: %@ }",
                  buf,
                  0x16u);
              }
              long long v26 = [(SRSiriViewController *)self _delayedConversationItemRevisionIdentifiers];
              [v26 removeObject:v17];

              [(SRSiriViewController *)self _siriPresentation:v31 speakTextForConversationItemIdentifierDidBecomeReady:v12];
              id v27 = [(SRSiriViewController *)self _presentedConversationItemRevisionIdentifiers];
              [v27 addObject:v17];
            }
            else
            {
              if (v25)
              {
                *(_DWORD *)long long buf = v29;
                unsigned int v37 = "-[SRSiriViewController siriPresentation:didPresentConversationItemsWithIdentifiers:]";
                __int16 v38 = 2112;
                __int16 v39 = v16;
                _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s Conversation item was presented for the first time; processing { item: %@ }",
                  buf,
                  0x16u);
              }
              long long v28 = [(SRSiriViewController *)self _presentedConversationItemRevisionIdentifiers];
              [v28 addObject:v17];

              [(SRSiriViewController *)self _siriPresentation:v31 speakTextForConversationItemIdentifier:v12 delayed:0];
            }
            id v6 = v21;
            uint64_t v10 = v30;
          }
        }
        CGFloat v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v9);
  }
}

- (void)siriPresentation:(id)a3 didPresentItemsAtIndexPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  long long v8 = [(SRSiriViewController *)self _activeConversation];
  id v9 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      unsigned int v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [v8 identifierOfItemAtIndexPath:*(void *)(*((void *)&v16 + 1) + 8 * (void)v14) v16];
        [v9 addObject:v15];

        unsigned int v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  [(SRSiriViewController *)self siriPresentation:v6 didPresentConversationItemsWithIdentifiers:v9];
}

- (void)siriPresentation:(id)a3 willDiscardConversationItemsWithIdentifiers:(id)a4
{
  id v5 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 136315394;
    long long v19 = v7;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v10);
        id v12 = [(SRSiriViewController *)self _activeConversation];
        unsigned int v13 = [v12 containsItemWithIdentifier:v11];

        if (v13)
        {
          unsigned int v14 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = v19;
            BOOL v25 = "-[SRSiriViewController siriPresentation:willDiscardConversationItemsWithIdentifiers:]";
            __int16 v26 = 2112;
            uint64_t v27 = v11;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s Discarded conversation item with identifier %@", buf, 0x16u);
          }
          id v15 = [(SRSiriViewController *)self _activeConversation];
          long long v16 = [v15 itemWithIdentifier:v11];

          long long v17 = [v16 aceCommandIdentifier];
          long long v18 = [(SRSiriViewController *)self _aceCommandWithIdentifier:v17];
          [(SRSiriViewController *)self _didCompleteActionForAceCommand:v18 success:1];
        }
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v8);
  }
}

- (void)siriPresentation:(id)a3 didDelayPresentationOfItemsWithIdentifiers:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v25;
    *(void *)&long long v8 = 136315394;
    long long v22 = v8;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v11);
        unsigned int v13 = [(SRSiriViewController *)self _activeConversation];
        unsigned int v14 = [v13 containsItemWithIdentifier:v12];

        if (v14)
        {
          id v15 = [(SRSiriViewController *)self _activeConversation];
          long long v16 = [v15 itemWithIdentifier:v12];

          long long v17 = [v16 revisionIdentifier];
          long long v18 = [(SRSiriViewController *)self _delayedConversationItemRevisionIdentifiers];
          unsigned __int8 v19 = [v18 containsObject:v17];

          if ((v19 & 1) == 0)
          {
            long long v20 = [(SRSiriViewController *)self _delayedConversationItemRevisionIdentifiers];
            [v20 addObject:v17];

            long long v21 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = v22;
              long long v29 = "-[SRSiriViewController siriPresentation:didDelayPresentationOfItemsWithIdentifiers:]";
              __int16 v30 = 2112;
              id v31 = v17;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Processed but delaying presentation for conversation item with identifier %@", buf, 0x16u);
            }
            [(SRSiriViewController *)self _siriPresentation:v23 speakTextForConversationItemIdentifier:v12 delayed:1];
          }
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v6 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v9);
  }
}

- (unint64_t)siriDeviceLockStateForSiriPresentation:(id)a3
{
  return self->_lockState;
}

- (void)siriPresentation:(id)a3 synthesizeSpeechWithText:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100053D84;
  v8[3] = &unk_100143CE8;
  id v9 = a5;
  id v7 = v9;
  [(SRSiriViewController *)self _synthesizeText:a4 identifier:0 sessionId:0 completion:v8];
}

- (void)siriPresentation:(id)a3 synthesizeSpeechWithPhoneticText:(id)a4 completion:(id)a5
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100053E48;
  v8[3] = &unk_100143CE8;
  id v9 = a5;
  id v7 = v9;
  [(SRSiriViewController *)self _synthesizePhoneticText:a4 identifier:0 sessionId:0 completion:v8];
}

- (int64_t)siriPresentation:(id)a3 presentationStateForItemAtIndexPath:(id)a4
{
  id v4 = [(SRSiriViewController *)self _activeConversationItemAtIndexPath:a4];
  id v5 = [v4 presentationState];

  return (int64_t)v5;
}

- (void)siriPresentation:(id)a3 didCorrectRecognition:(id)a4 correctionIdentifier:(id)a5 forConversationItemWithIdentifier:(id)a6 userSelectionResults:(id)a7
{
  id v25 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  unsigned int v14 = [(SRSiriViewController *)self _activeConversation];
  uint64_t v15 = mach_absolute_time();
  if ([v14 containsItemWithIdentifier:v12])
  {
    long long v16 = [v14 itemWithIdentifier:v12];
    if ([v16 type] == (id)1)
    {
      long long v17 = [v16 aceObject];
      [v17 sruif_setRecognitionWithCorrectedSpeech:v25];
    }
    double v18 = (double)v15;
    unsigned __int8 v19 = [v14 indexPathForItemWithIdentifier:v12];
    [v14 removeItemsFollowingItemAtIndexPath:v19];

    if ((char *)[(SASRequestOptions *)self->_requestOptions requestSource] - 23 <= (char *)2)
    {
      [(SASRequestOptions *)self->_requestOptions setText:0];
      requestText = self->_requestText;
      self->_requestText = (NSString *)&stru_1001463E0;
    }
    long long v21 = [(SRSiriViewController *)self _instrumentationManager];
    long long v22 = [v21 currentInstrumentationTurnContext];
    id v23 = [v22 turnIdentifier];

    long long v24 = [(SRSiriViewController *)self _session];
    [v24 startCorrectedRequestWithText:v25 correctionIdentifier:v11 userSelectionResults:v13 turnIdentifier:v23 machAbsoluteTime:v18];
  }
}

- (void)siriPresentation:(id)a3 startEditedRequestWithText:(id)a4 correctionIdentifier:(id)a5 userSelectionResults:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(SRSiriViewController *)self _instrumentationManager];
  id v13 = [v12 currentInstrumentationTurnContext];
  id v16 = [v13 turnIdentifier];

  double v14 = (double)mach_absolute_time();
  uint64_t v15 = [(SRSiriViewController *)self _session];
  [v15 startCorrectedRequestWithText:v11 correctionIdentifier:v10 userSelectionResults:v9 turnIdentifier:v16 machAbsoluteTime:v14];
}

- (void)siriPresentation:(id)a3 didCorrectRecognition:(id)a4 correctionIdentifier:(id)a5 forItemAtIndexPath:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  double v14 = [(SRSiriViewController *)self _activeConversation];
  id v15 = [v14 identifierOfItemAtIndexPath:v10];

  [(SRSiriViewController *)self siriPresentation:v13 didCorrectRecognition:v12 correctionIdentifier:v11 forConversationItemWithIdentifier:v15 userSelectionResults:0];
}

- (void)siriPresentation:(id)a3 performAceCommand:(id)a4 conversationItemIdentifier:(id)a5 completion:(id)a6
{
}

- (void)siriPresentation:(id)a3 performAceCommand:(id)a4 conversationItemIdentifier:(id)a5 turnIdentifier:(id)a6 completion:(id)a7
{
}

- (void)_performAceCommand:(id)a3 conversationIdentifier:(id)a4 turnIdentifier:(id)a5 completion:(id)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v16 sruif_aceCommandType];
  if (v13 == (id)1)
  {
    [(SRSiriViewController *)self _performGenericAceCommand:v16 turnIdentifier:v11 completion:v12];
  }
  else if (v13 == (id)2)
  {
    [(SRSiriViewController *)self _performAppPunchOutCommand:v16 conversationItemIdentifier:v10 completion:v12];
  }
  else if (!v13)
  {
    double v14 = +[NSString stringWithFormat:@"Cannot perform non-command: %@", v16];
    id v15 = +[NSException exceptionWithName:NSInvalidArgumentException reason:v14 userInfo:0];

    objc_exception_throw(v15);
  }
}

- (void)siriPresentation:(id)a3 openURL:(id)a4 conversationId:(id)a5 completion:(id)a6
{
}

- (id)effectiveCoreLocationBundleForSiriPresentation:(id)a3
{
  return +[AFUISiriSession effectiveCoreLocationBundle];
}

- (void)enableIdleTimerForSiriPresentation:(id)a3
{
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SRSiriViewController enableIdleTimerForSiriPresentation:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Enabling idle timer at the presentation's request", (uint8_t *)&v5, 0xCu);
  }
  [(SRSiriViewController *)self _setIdleTimerEnabled:1];
  [(SRSiriViewController *)self _rescheduleIdleTimerIfNeeded];
}

- (void)disableIdleTimerForSiriPresentation:(id)a3
{
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SRSiriViewController disableIdleTimerForSiriPresentation:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Disabling idle timer at the presentation's request", (uint8_t *)&v5, 0xCu);
  }
  [(SRSiriViewController *)self _setIdleTimerEnabled:0];
  [(SRSiriViewController *)self _rescheduleIdleTimerIfNeeded];
}

- (void)siriPresentation:(id)a3 setStatusViewHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SRSiriViewController *)self _host];
  [v5 setStatusViewHidden:v4];
}

- (void)siriPresentation:(id)a3 setTypeToSiriViewHidden:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SRSiriViewController *)self _host];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(SRSiriViewController *)self _host];
    [v8 setTypeToSiriViewHidden:v4];
  }
}

- (void)siriPresentation:(id)a3 setFullScreenDimmingLayerVisible:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if ((SiriUIDeviceIsPad() & 1) == 0
    && +[AFSystemAssistantExperienceStatusManager isSAEEnabled])
  {
    id v8 = [(SRSiriViewController *)self view];
    id v9 = [v8 layer];
    [v9 setHitTestsAsOpaque:v6];
  }
  id v10 = [(SRSiriViewController *)self _host];
  [v10 setFullScreenDimmingLayerVisible:v6 animated:v5];
}

- (void)siriPresentation:(id)a3 inputTypeDidChange:(int64_t)a4
{
  id v5 = [(SRSiriViewController *)self _host];
  [v5 inputTypeDidChange:a4];
}

- (void)siriPresentation:(id)a3 setStatusViewDisabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SRSiriViewController *)self _host];
  [v5 setStatusViewDisabled:v4];
}

- (void)siriPresentation:(id)a3 setStatusViewUserInteractionEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SRSiriViewController *)self _host];
  [v5 setStatusViewUserInteractionEnabled:v4];
}

- (void)siriPresentation:(id)a3 willPresentViewController:(id)a4
{
  id v5 = a4;
  id v7 = [(SRSiriViewController *)self _host];
  id v6 = [v5 preferredStatusBarStyle];

  [v7 serviceWillPresentViewControllerWithStatusBarStyle:v6];
}

- (void)siriPresentation:(id)a3 didPresentViewController:(id)a4
{
  id v5 = a4;
  id v7 = [(SRSiriViewController *)self _host];
  id v6 = [v5 preferredStatusBarStyle];

  [v7 serviceDidPresentViewControllerWithStatusBarStyle:v6];
}

- (void)siriPresentation:(id)a3 willDismissViewController:(id)a4
{
  id v5 = a4;
  id v7 = [(SRSiriViewController *)self _host];
  id v6 = [v5 preferredStatusBarStyle];

  [v7 serviceWillDismissViewControllerWithStatusBarStyle:v6];
}

- (void)siriPresentation:(id)a3 didDismissViewController:(id)a4
{
  id v5 = a4;
  id v7 = [(SRSiriViewController *)self _host];
  id v6 = [v5 preferredStatusBarStyle];

  [v7 serviceDidDismissViewControllerWithStatusBarStyle:v6];
}

- (void)siriPresentation:(id)a3 didRequestKeyboardWithVisibility:(BOOL)a4
{
}

- (void)siriPresentation:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = [(SRSiriViewController *)self _host];
  [v7 setStatusBarHidden:v6 animated:v5];
}

- (void)siriPresentation:(id)a3 setStatusBarHidden:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a6;
  id v10 = [(SRSiriViewController *)self _host];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100054A7C;
  v12[3] = &unk_100143278;
  id v13 = v9;
  id v11 = v9;
  [v10 setStatusBarHidden:v7 animated:v6 completion:v12];
}

- (void)siriPresentation:(id)a3 setHelpButtonEmphasized:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SRSiriViewController *)self _host];
  [v5 setHelpButtonEmphasized:v4];
}

- (void)siriPresentationPulseHelpButton:(id)a3
{
  id v3 = [(SRSiriViewController *)self _host];
  [v3 pulseHelpButton];
}

- (BOOL)siriPresentationShouldDelaySuggestions:(id)a3
{
  if (![(SRSiriViewController *)self textInputEnabled]
    || (id v4 = [(SASRequestOptions *)self->_requestOptions requestSource], v4 != (id)1))
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (void)siriPresentation:(id)a3 setBugReportingAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SRSiriViewController *)self _host];
  [v5 setBugReportingAvailable:v4];
}

- (void)siriPresentationDidPresentBugReporter:(id)a3
{
  BOOL v4 = [(SRSiriViewController *)self _host];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SRSiriViewController *)self _host];
    [v6 serviceDidPresentBugReporter];
  }
}

- (void)siriPresentationDidDismissBugReporter:(id)a3
{
  BOOL v4 = [(SRSiriViewController *)self _host];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SRSiriViewController *)self _host];
    [v6 serviceDidDismissBugReporter];
  }
}

- (void)getScreenshotImageForSiriPresentation:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [(SRSiriViewController *)self _host];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100054D84;
    v7[3] = &unk_100144190;
    id v8 = v5;
    [v6 getScreenshotWithReplyHandler:v7];
  }
}

- (void)siriPresentationPresentAcousticIDSpinner:(id)a3
{
  id v7 = objc_alloc_init((Class)SAAIStartSession);
  BOOL v4 = +[NSUUID UUID];
  id v5 = [v4 UUIDString];
  [v7 setAceId:v5];

  [(SRSiriViewController *)self _didReceiveAceCommand:v7];
  id v6 = [(SRSiriViewController *)self _activeConversation];
  [v6 addItemForMusicStartSessionCommand:v7];
}

- (void)siriPresentationRemoveAcousticIDSpinner:(id)a3
{
  BOOL v4 = [(SRSiriViewController *)self _activeConversation];
  id v8 = [v4 lastItem];

  if ([v8 type] == (id)5)
  {
    id v5 = [v8 identifier];
    id v6 = +[NSSet setWithObject:v5];

    id v7 = [(SRSiriViewController *)self _activeConversation];
    [v7 removeItemsWithIdentifiers:v6];
  }
}

- (void)siriPresentation:(id)a3 didEditSpeechRecognized:(id)a4 forInterval:(double)a5
{
  id v7 = a4;
  id v8 = objc_alloc((Class)AFMetrics);
  id v9 = [v7 refId];

  id v10 = +[NSNumber numberWithDouble:a5];
  id v12 = [v8 initWithOriginalCommandId:v9 category:4 duration:v10];

  id v11 = [(SRSiriViewController *)self _session];
  [v11 recordUIMetrics:v12];
}

- (void)siriPresentation:(id)a3 didScrollForInterval:(double)a4 metricsContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v9)
  {
    id v9 = [(SRSiriViewController *)self _activeConversation];

    if (v9)
    {
      id v10 = [(SRSiriViewController *)self _activeConversation];
      id v11 = [v10 identifier];
      id v12 = [(SRSiriViewController *)self _punchoutMetricsAceCommandIdForItemWithIdentifier:v11];

      id v9 = [(SRSiriViewController *)self _metricsContextForItemWithAceCommandId:v12];
    }
  }
  uint64_t v13 = +[NSString stringWithFormat:@"%.02f", *(void *)&a4];
  double v14 = (void *)v13;
  if (v9)
  {
    v22[0] = @"metricsContext";
    v22[1] = @"duration";
    v23[0] = v9;
    v23[1] = v13;
    id v15 = v23;
    id v16 = (const __CFString **)v22;
    uint64_t v17 = 2;
  }
  else
  {
    CFStringRef v20 = @"duration";
    uint64_t v21 = v13;
    id v15 = &v21;
    id v16 = &v20;
    uint64_t v17 = 1;
  }
  double v18 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:v17];
  unsigned __int8 v19 = [(SRSiriViewController *)self _analytics];
  [v19 logEventWithType:1432 context:v18];
}

- (void)siriPresentation:(id)a3 didShowAceViewWithIdentifier:(id)a4 aceViewClass:(Class)a5 metricsContext:(id)a6 forInterval:(double)a7
{
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(SRSiriViewController *)self _activeConversation];
  unsigned int v14 = [v13 containsItemWithIdentifier:v11];

  if (v14)
  {
    id v15 = [(SRSiriViewController *)self _activeConversation];
    id v16 = [v15 itemWithIdentifier:v11];

    objc_initWeak(&location, self);
    uint64_t v17 = dispatch_get_global_queue(0, 0);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100055340;
    v19[3] = &unk_1001441E0;
    v22[1] = a5;
    id v20 = v12;
    id v21 = v16;
    void v22[2] = *(id *)&a7;
    id v18 = v16;
    objc_copyWeak(v22, &location);
    dispatch_async(v17, v19);

    objc_destroyWeak(v22);
    objc_destroyWeak(&location);
  }
}

- (void)siriPresentation:(id)a3 didShowTipWithIdentifier:(id)a4 startDate:(id)a5 endDate:(id)a6 flowID:(id)a7
{
  id v20 = a5;
  id v11 = a6;
  id v12 = a7;
  id v13 = a4;
  unsigned int v14 = [(SRSiriViewController *)self _activeConversation];
  unsigned int v15 = [v14 containsItemWithIdentifier:v13];

  if (v15)
  {
    id v16 = +[CKKnowledgeStore defaultSynchedKnowledgeStore];
    id v17 = [objc_alloc((Class)CKPermanentEventStore) initWithKnowledgeStore:v16];
    id v18 = +[NSString stringWithFormat:@"%@#%@", v12, @"TipOnScreen"];
    id v19 = [objc_alloc((Class)CKEvent) initWithIdentifier:v18 startDate:v20 endDate:v11 metadata:0];
    [v17 recordEvent:v19 completionHandler:&stru_100144200];
  }
}

- (void)siriPresentation:(id)a3 didShowGuideStartTime:(id)a4 endTime:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v10 = +[CKKnowledgeStore defaultSynchedKnowledgeStore];
  id v8 = [objc_alloc((Class)CKPermanentEventStore) initWithKnowledgeStore:v10];
  id v9 = [objc_alloc((Class)CKEvent) initWithIdentifier:@"SiriGuideShown" startDate:v7 endDate:v6 metadata:0];

  [v8 recordEvent:v9 completionHandler:&stru_100144220];
}

- (void)handlePasscodeUnlockForSiriPresentation:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSiriViewController *)self _host];
  [v6 handlePasscodeUnlockWithCompletion:v5];
}

- (void)siriPresentationMicButtonWasTapped:(id)a3
{
  id v3 = [(SRSiriViewController *)self _host];
  [v3 serviceDidDetectMicButtonTap];
}

- (void)siriPresentationMicButtonLongPressBegan:(id)a3
{
  id v3 = [(SRSiriViewController *)self _host];
  [v3 serviceDidDetectMicButtonLongPressBegan];
}

- (void)siriPresentationMicButtonLongPressEnded:(id)a3
{
  id v3 = [(SRSiriViewController *)self _host];
  [v3 serviceDidDetectMicButtonLongPressEnded];
}

- (void)siriPresentation:(id)a3 didChangePeekMode:(unint64_t)a4
{
  if (a4 - 1 >= 3) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = a4;
  }
  id v5 = [(SRSiriViewController *)self _host];
  [v5 servicePresentationDidChangePeekMode:v4];
}

- (void)siriPresentation:(id)a3 didChangeVisualState:(unint64_t)a4
{
  id v5 = [(SRSiriViewController *)self _host];
  [v5 servicePresentationDidChangeVisualState:a4];
}

- (void)siriPresentation:(id)a3 willChangeKeyboardVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = [(SRSiriViewController *)self _host];
  [v5 serviceViewControllerWillChangeKeyboardVisibility:v4];
}

- (void)siriPresentation:(id)a3 preventOutsideTouchesFromDismissingSiri:(BOOL)a4
{
  self->_preventOutsideTouchesFromDismissingSiri = a4;
}

- (void)siriPresentation:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSiriViewController *)self _host];
  [v6 serviceViewControllerRequestsKeyboardWithCompletion:v5];
}

- (void)siriPresentation:(id)a3 willBeginEditingOfType:(int64_t)a4
{
  if (a4 == 1) {
    [(SRSiriViewController *)self _setUserUtteranceTapToEditInProgress:1];
  }
  id v5 = [(SRSiriViewController *)self _host];
  [v5 serviceWillBeginEditing];
}

- (void)siriPresentationDidEndEditing:(id)a3
{
}

- (void)siriPresentationDidResignFirstResponder:(id)a3
{
  id v3 = [(SRSiriViewController *)self _host];
  [v3 serviceDidEndEditing];
}

- (void)siriPresentationRequestsHIDEventDefferal:(id)a3
{
  id v3 = [(SRSiriViewController *)self _host];
  [v3 serviceRequestsHIDEventDefferal];
}

- (void)siriPresentationCancelHIDEventDefferal:(id)a3
{
  id v3 = [(SRSiriViewController *)self _host];
  [v3 serviceCancelHIDEventDefferal];
}

- (void)siriPresentation:(id)a3 requestsTouchPassThroughEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"Disabling";
    if (v4) {
      CFStringRef v7 = @"Enabling";
    }
    int v10 = 136315394;
    id v11 = "-[SRSiriViewController siriPresentation:requestsTouchPassThroughEnabled:]";
    __int16 v12 = 2112;
    CFStringRef v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s %@ touch pass through on SRSiriViewController", (uint8_t *)&v10, 0x16u);
  }
  id v8 = [(SRSiriViewController *)self view];
  id v9 = [v8 layer];
  [v9 setHitTestsAsOpaque:!v4];
}

- (void)siriPresentation:(id)a3 didPresentIntentWithBundleId:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSiriViewController *)self _host];
  [v6 servicePresentedIntentWithBundleId:v5];
}

- (void)siriPresentationClearContext:(id)a3
{
  id v3 = [(SRSiriViewController *)self _session];
  [v3 clearContext];
}

- (id)siriPresentation:(id)a3 additionalSpeechInterpretationsForRefId:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSiriViewController *)self _activeConversation];
  CFStringRef v7 = [v6 additionalSpeechInterpretationsForRefId:v5];

  return v7;
}

- (id)siriPresentation:(id)a3 updatedUserUtteranceForRefId:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSiriViewController *)self _activeConversation];
  CFStringRef v7 = [v6 updatedUserUtteranceForRefId:v5];

  return v7;
}

- (void)siriPresentationDidPresentConversationFromBreadcrumb:(id)a3
{
  [(SRSiriViewController *)self _setShowKeyboardIfTextInputEnabled:1 minimized:+[UIKeyboard isInHardwareKeyboardMode] ^ 1];
  id v4 = [(SRSiriViewController *)self _host];
  [v4 serviceDidPresentConversationFromBreadcrumb];
}

- (BOOL)inTextInputModeForSiriPresentation:(id)a3
{
  BOOL v4 = [(SRSiriViewController *)self textInputEnabled];
  if (v4) {
    LOBYTE(v4) = !self->_requestActive
  }
              || [(SASRequestOptions *)self->_requestOptions requestSource] != (id)8
              && (!SiriUIIsHTTForTextInputEnabled()
               || [(SASRequestOptions *)self->_requestOptions inputType] != (id)2)
              || self->_keyboardInfo.keyboardHeight > 0.0;
  return v4;
}

- (void)siriPresentationDidHideUnlockScreen:(id)a3
{
  uint64_t v4 = +[UIKeyboard isInHardwareKeyboardMode] ^ 1;

  [(SRSiriViewController *)self _setShowKeyboardIfTextInputEnabled:1 minimized:v4];
}

- (void)siriPresentationDidHideKeyboard:(id)a3
{
}

- (void)siriPresentationWillSendStartRequest:(id)a3
{
  [(SRSiriViewController *)self _setStartRequestAceCommandSent:1];

  [(SRSiriViewController *)self _cancelSpeechSynthesis];
}

- (id)localeForSiriPresentation:(id)a3
{
  id v4 = objc_alloc((Class)NSLocale);
  id v5 = [(SRSiriViewController *)self _language];
  id v6 = [v5 spokenLanguageCode];
  id v7 = [v4 initWithLocaleIdentifier:v6];

  return v7;
}

- (void)siriPresentationDidRequestRestartSpeechSynthesis:(id)a3
{
  previousSayItCommand = self->_previousSayItCommand;
  if (previousSayItCommand) {
    [(SRSiriViewController *)self siriSessionDidReceiveSayItCommand:previousSayItCommand completion:0];
  }
}

- (void)siriPresentationDidPresentDynamicSnippetWithInfo:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSiriViewController *)self _session];
  [v5 siriUIDidPresentDynamicSnippetWithInfo:v4];
}

- (void)userTouchedSnippet
{
}

- (void)siriPresentation:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315394;
    CFStringRef v13 = "-[SRSiriViewController siriPresentation:handleStartLocalRequest:turnIdentifier:]";
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Handling startLocalRequest : %@", (uint8_t *)&v12, 0x16u);
  }
  double v10 = (double)mach_absolute_time();
  id v11 = [(SRSiriViewController *)self _session];
  [v11 performAceCommand:v7 turnIdentifier:v8 machAbsoluteTime:v10];
}

- (void)_emitRenderingStarted
{
  id v3 = objc_alloc_init((Class)SISchemaUEIUIRenderingStarted);
  [v3 setExists:1];
  id v4 = objc_alloc_init((Class)SISchemaUEIUIRenderingContext);
  [v4 setStartedOrChanged:v3];
  id v5 = [(SRSiriViewController *)self _instrumentationManager];
  [v5 emitInstrumentation:v4];

  self->_os_signpost_id_t uiRenderSignpost = os_signpost_id_generate(AFSiriLogContextPerformance);
  id v6 = AFSiriLogContextPerformance;
  id v7 = v6;
  os_signpost_id_t uiRenderSignpost = self->_uiRenderSignpost;
  if (uiRenderSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    int v9 = 136315394;
    double v10 = "SiriX";
    __int16 v11 = 2080;
    int v12 = "enableTelemetry=YES";
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, uiRenderSignpost, "UIRenderTime", "%s %s", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_emitRenderingEnded
{
  id v3 = objc_alloc_init((Class)SISchemaUEIUIRenderingEnded);
  [v3 setExists:1];
  id v4 = objc_alloc_init((Class)SISchemaUEIUIRenderingContext);
  [v4 setEnded:v3];
  id v5 = [(SRSiriViewController *)self _instrumentationManager];
  [v5 emitInstrumentation:v4];

  id v6 = AFSiriLogContextPerformance;
  id v7 = v6;
  os_signpost_id_t uiRenderSignpost = self->_uiRenderSignpost;
  if (uiRenderSignpost - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)int v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, uiRenderSignpost, "UIRenderTime", "", v9, 2u);
  }
}

- (void)didBeginProcessingConversationItems
{
}

- (void)siriPresentation:(id)a3 viewDidAppearWithAceObject:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v6 encodedClassName];
  int v9 = [v6 aceId];
  [(SRSiriViewController *)self siriPresentation:v7 viewDidAppearWithClassDescriptor:v8 identifier:v9];

  double v10 = [(SRUIFAnalyticsSupplement *)self->_analyticsSupplement dialogPhaseForAceObject:v6];
  if (!v10)
  {
    __int16 v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315394;
      CFStringRef v13 = "-[SRSiriViewController siriPresentation:viewDidAppearWithAceObject:]";
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Dialog phase is unexpectedly nil for aceObject : %@", (uint8_t *)&v12, 0x16u);
    }
  }
  [(SRSiriViewController *)self _logAceObjectPresented:v6 dialogPhase:v10];
}

- (void)siriPresentation:(id)a3 viewDidAppearWithClassDescriptor:(id)a4 identifier:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  [(SRSiriViewController *)self _emitRenderingEnded];
  id v8 = +[NSMutableDictionary dictionary];
  if ([v10 length]) {
    [v8 setObject:v10 forKeyedSubscript:@"viewClass"];
  }
  if ([v7 length]) {
    [v8 setObject:v7 forKeyedSubscript:@"identifier"];
  }
  int v9 = [(SRSiriViewController *)self _analytics];
  [v9 logEventWithType:1461 context:v8];
}

- (void)siriPresentation:(id)a3 viewDidDisappearWithClassDescriptor:(id)a4 identifier:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = +[NSMutableDictionary dictionary];
  if ([v10 length]) {
    [v8 setObject:v10 forKeyedSubscript:@"viewClass"];
  }
  if ([v7 length]) {
    [v8 setObject:v7 forKeyedSubscript:@"identifier"];
  }
  int v9 = [(SRSiriViewController *)self _analytics];
  [v9 logEventWithType:1462 context:v8];
}

- (void)userDrilledIntoSnippet
{
}

- (void)toggleHomeAffordanceHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SRSiriViewController *)self _host];
  [v4 toggleHomeAffordanceHidden:v3];
}

- (void)toggleSiriHomeAffordanceGestureControl:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SRSiriViewController *)self _host];
  [v4 toggleSiriHomeAffordanceGestureControl:v3];
}

- (BOOL)siriPresentationIsPresentingSystemUI:(id)a3
{
  return [(SRSiriSystemUIController *)self->_systemUIController presentingSystemUI];
}

- (void)siriPresentationRequestsSystemUICollapse:(id)a3
{
}

- (void)updateEdgeLightWindowLevel:(int64_t)a3
{
  id v4 = [(SRSiriViewController *)self _host];
  [v4 updateEdgeLightWindowLevel:a3];
}

- (void)_insertUserUtteranceViewForText:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    long long v24 = self;
    id v5 = objc_alloc_init((Class)SASToken);
    [v5 setText:v4];
    id v6 = objc_alloc_init((Class)SASInterpretation);
    id v28 = v5;
    id v7 = +[NSArray arrayWithObjects:&v28 count:1];
    [v6 setTokens:v7];

    id v8 = objc_alloc_init((Class)SASPhrase);
    id v27 = v6;
    int v9 = +[NSArray arrayWithObjects:&v27 count:1];
    [v8 setInterpretations:v9];

    id v10 = objc_alloc_init((Class)SASRecognition);
    id v26 = v8;
    __int16 v11 = +[NSArray arrayWithObjects:&v26 count:1];
    [v10 setPhrases:v11];

    id v12 = objc_alloc_init((Class)SASSpeechRecognized);
    CFStringRef v13 = +[NSUUID UUID];
    __int16 v14 = [v13 UUIDString];
    [v12 setAceId:v14];

    id v15 = +[NSUUID UUID];
    id v16 = [v15 UUIDString];
    [v12 setRefId:v16];

    [v12 setTitle:v4];
    [v12 setRecognition:v10];
    id v17 = +[NSUUID UUID];
    id v18 = [v17 UUIDString];
    [v12 setSessionId:v18];

    id v19 = objc_alloc_init((Class)SASSpeechPartialResult);
    id v25 = v5;
    id v20 = +[NSArray arrayWithObjects:&v25 count:1];
    [v19 setTokens:v20];

    id v21 = +[NSUUID UUID];
    long long v22 = [v21 UUIDString];
    [v19 setAceId:v22];

    id v23 = [v12 refId];
    [v19 setRefId:v23];

    [(SRSiriViewController *)v24 siriSessionDidReceiveSpeechPartialResultCommand:v19];
    [(SRSiriViewController *)v24 siriSessionDidReceiveSpeechRecognizedCommand:v12];
  }
}

- (void)_insertUserUtteranceViewForSuggestion:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    id v4 = objc_alloc_init((Class)SASToken);
    [v4 setText:v3];
    id v5 = objc_alloc_init((Class)SASInterpretation);
    id v25 = v4;
    id v29 = v4;
    id v6 = +[NSArray arrayWithObjects:&v29 count:1];
    [v5 setTokens:v6];

    id v7 = objc_alloc_init((Class)SASPhrase);
    id v28 = v5;
    id v8 = +[NSArray arrayWithObjects:&v28 count:1];
    [v7 setInterpretations:v8];

    id v9 = objc_alloc_init((Class)SASRecognition);
    id v27 = v7;
    id v10 = +[NSArray arrayWithObjects:&v27 count:1];
    [v9 setPhrases:v10];

    id v11 = objc_alloc_init((Class)SASSpeechRecognized);
    id v12 = +[NSUUID UUID];
    CFStringRef v13 = [v12 UUIDString];
    [v11 setAceId:v13];

    __int16 v14 = +[NSUUID UUID];
    id v15 = [v14 UUIDString];
    [v11 setRefId:v15];

    [v11 setTitle:v3];
    [v11 setRecognition:v9];
    id v16 = +[NSUUID UUID];
    id v17 = [v16 UUIDString];
    [v11 setSessionId:v17];

    id v18 = [v11 recognition];
    id v19 = [v11 refId];
    id v20 = [v11 sessionId];
    id v21 = [v18 af_userUtteranceValueWithRefId:v19 sessionId:v20];

    id v22 = [objc_alloc((Class)SRUIFSpeechRecognitionHypothesis) initWithUserUtterance:v21 backingAceObject:0 isFinal:1];
    id v23 = [(SRSiriViewController *)self _presentation];
    LOBYTE(v4) = objc_opt_respondsToSelector();

    if (v4)
    {
      long long v24 = [(SRSiriViewController *)self _presentation];
      [v24 updateSpeechRecognitionHypothesisForSuggestion:v22];

      [(SRSiriViewController *)self siriSessionDidReceiveSpeechRecognizedCommand:v11];
    }
  }
}

- (void)siriSessionRequestsReadoutOfBulletin:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #cmas #carPlay %@", buf, 0x16u);
  }
  if (v6)
  {
    long long v24 = (void (**)(void, void))v7;
    [(SRSiriViewController *)self _setReadingBulletinContentInCarPlayOutsideOfSiriSession:1];
    id v9 = dispatch_group_create();
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    uint64_t v45 = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x2020000000;
    v39[3] = 0;
    objc_initWeak(&location, self);
    id v10 = [v6 title];
    id v11 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unsigned __int8 v40 = 136315394;
      BOOL v41 = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]";
      __int16 v42 = 2112;
      id v43 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s #cmas #carPlay Title of emergency bulletin to speak: %@", v40, 0x16u);
    }
    id v12 = [v10 length];
    if (v12)
    {
      dispatch_group_enter(v9);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100057458;
      v34[3] = &unk_100144010;
      uint64_t v36 = buf;
      objc_copyWeak(&v37, &location);
      long long v35 = v9;
      [(SRSiriViewController *)self _synthesizeText:v10 identifier:0 sessionId:0 completion:v34];

      objc_destroyWeak(&v37);
    }
    CFStringRef v13 = [v6 message];
    __int16 v14 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unsigned __int8 v40 = 136315394;
      BOOL v41 = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]";
      __int16 v42 = 2112;
      id v43 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s #cmas #carPlay Message of emergency bulletin to speak: %@", v40, 0x16u);
    }
    if ([v13 length])
    {
      dispatch_group_enter(v9);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1000574D4;
      v30[3] = &unk_100144010;
      long long v32 = v39;
      objc_copyWeak(&v33, &location);
      id v31 = v9;
      [(SRSiriViewController *)self _synthesizeText:v13 identifier:0 sessionId:0 completion:v30];

      objc_destroyWeak(&v33);
    }
    else if (!v12)
    {
      id v16 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
        sub_1000B9594(v16, v17, v18, v19, v20, v21, v22, v23);
      }
      v24[2](v24, 4);
      goto LABEL_16;
    }
    id v15 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)unsigned __int8 v40 = 136315138;
      BOOL v41 = "-[SRSiriViewController siriSessionRequestsReadoutOfBulletin:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%s #cmas #carPlay Waiting for synthesis to complete", v40, 0xCu);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100057550;
    block[3] = &unk_100144268;
    objc_copyWeak(&v29, &location);
    id v27 = buf;
    id v28 = v39;
    void block[4] = self;
    id v26 = v24;
    dispatch_group_notify(v9, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v29);
LABEL_16:

    objc_destroyWeak(&location);
    _Block_object_dispose(v39, 8);
    _Block_object_dispose(buf, 8);

    id v7 = v24;
  }
}

- (unint64_t)_readoutResultFromTTSResult:(int64_t)a3 error:(id)a4
{
  id v5 = a4;
  if (a3 == 1
    && +[SRUIFSpeechSynthesisUtility isSpeechSynthesisErrorUserCancelled:v5])
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      id v9 = "-[SRSiriViewController _readoutResultFromTTSResult:error:]";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #cmas #carPlay received a user cancelled voice services error, setting state to AFUIBulletinReadoutResultSynthesisCancelled. %@", (uint8_t *)&v8, 0x16u);
    }
    a3 = 3;
  }
  else
  {
    if (v5 && os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B9684();
    }
    if ((unint64_t)(a3 - 1) >= 3) {
      a3 = 0;
    }
  }

  return a3;
}

- (unint64_t)_readoutResultFromTitleResult:(unint64_t)a3 messageResult:(unint64_t)a4
{
  unint64_t result = 2;
  if (a3 != 2 && a4 != 2)
  {
    unint64_t result = 3;
    if (a3 != 3 && a4 != 3)
    {
      if (a3 == 1 && !a4 || a3 <= 1 && a4 == 1)
      {
        return 1;
      }
      else
      {
        id v6 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
          sub_1000B96F8(v6, (void *)a3);
        }
        return 0;
      }
    }
  }
  return result;
}

- (void)_activeRequestOptionsDidChange
{
  id v2 = [(SRSiriViewController *)self presentation];
  if (objc_opt_respondsToSelector()) {
    [v2 activeRequestOptionsDidChange];
  }
}

- (void)_setRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_requestOptions, a3);

  [(SRSiriViewController *)self _activeRequestOptionsDidChange];
}

- (void)setRequestOptions:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    id v12 = "-[SRSiriViewController setRequestOptions:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  [(SRSiriViewController *)self _setRequestOptions:v4];
  [(SRModeProvider *)self->_modeProvider setRequestOptions:v4];
  if ([v4 isInitialBringUp]) {
    [(SRSiriViewController *)self _setAcousticIdAllowed:1];
  }
  id v6 = [v4 testingContext];
  testingContext = self->_testingContext;
  self->_testingContext = v6;

  int v8 = [(SRSiriViewController *)self _presentation];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    __int16 v10 = [(SRSiriViewController *)self _presentation];
    [v10 configureForRequestOptions:v4];
  }
}

- (void)_startRequestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    int v11 = "-[SRSiriViewController _startRequestWithOptions:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v10, 0x16u);
  }
  id v6 = [(SRSiriViewController *)self _instrumentationManager];
  id v7 = [v6 currentInstrumentationTurnContext];
  int v8 = [v7 turnIdentifier];

  if (v8) {
    [v4 setPreviousTurnIdentifier:v8];
  }
  [(SRSiriViewController *)self _setWaitingForStartRequest:1];
  if ([(SRSiriViewController *)self _usesEventDrivenIdleAndQuietUpdates]) {
    [(SRSiriViewController *)self _checkAndUpdateSiriIdleAndQuietStatusIfNeeded];
  }
  char v9 = [(SRSiriViewController *)self _hostWithErrorHandler:&stru_100144288];
  [v9 serviceStartRequestWithOptions:v4];
}

- (void)siriPresentation:(id)a3 siriRequestEnteredWithText:(id)a4
{
}

- (void)siriSessionDidStartAcousticIDRequest
{
  id v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(SRSiriViewController *)self _presentation];
    [v5 acousticIDRequestDidStart];
  }
}

- (void)siriSessionDidFinishAcousticIDRequestWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SRSiriViewController *)self _presentation];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SRSiriViewController *)self _presentation];
    [v7 acousticIDRequestDidFinishWithSuccess:v3];
  }
}

- (void)siriSessionRequestedCancelPhotoSelectionWithAnimation:(BOOL)a3
{
  phPicker = self->_phPicker;
  if (phPicker) {
    [(SiriSharedUIPhPicker *)phPicker dismissPhotoPickerIfExistsWithAnimation:a3];
  }
}

- (void)siriSessionRequestedPhotoSelectionWithSearchString:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  phPicker = self->_phPicker;
  if (!phPicker)
  {
    int v8 = (SiriSharedUIPhPicker *)objc_alloc_init((Class)SiriSharedUIPhPicker);
    char v9 = self->_phPicker;
    self->_phPicker = v8;

    phPicker = self->_phPicker;
  }
  int v10 = [(SRSiriViewController *)self _presentationViewController];
  [(SiriSharedUIPhPicker *)phPicker presentPhotoPicker:v10 withSearchString:v11 completion:v6];
}

- (int64_t)_presentationOptions
{
  BOOL v3 = [(SRSiriViewController *)self _requestOptions];
  unsigned __int8 v4 = [v3 isForBluetoothCar];

  if (v4) {
    return 8;
  }
  id v6 = [(SRSiriViewController *)self _presentation];
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0) {
    return 0;
  }
  int v8 = [(SRSiriViewController *)self _presentation];
  id v9 = [v8 options];

  return (int64_t)v9;
}

- (void)preloadPresentationBundleWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[SRSiriPresentationPluginHost sharedSiriPresentationPluginHost];
  [v4 preloadPresentationBundleWithIdentifier:v3];
}

- (void)preloadPluginBundles
{
  id v2 = +[SiriUICardProviderRegistry sharedInstance];
  [v2 preloadProviders];
}

- (void)showPresentationWithIdentifier:(id)a3 properties:(id)a4 lockState:(unint64_t)a5
{
  self->_unint64_t lockState = a5;
  [(SRSiriViewController *)self updateToPresentationWithIdentifier:a3 presentationProperties:a4 animated:0 completion:0];
}

- (void)_setPresentation:(id)a3
{
}

- (id)_presentationViewController
{
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(SiriUIPresentation *)self->_presentation viewController];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (void)_updateLanguageCode
{
  id v2 = [(SRSiriViewController *)self _language];
  id v3 = [v2 spokenLanguageCode];

  AFUISetLanguageCode();
}

- (id)_dialogPhaseForItemAtIndexPath:(id)a3
{
  id v3 = [(SRSiriViewController *)self _activeConversationItemAtIndexPath:a3];
  id v4 = [v3 dialogPhase];

  return v4;
}

- (void)_performGenericAceCommand:(id)a3 turnIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, uint64_t))a5;
  uint64_t v11 = mach_absolute_time();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SRSiriViewController *)self _performSayItCommand:v8];
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SRSiriViewController *)self _cancelCurrentTTS:v8];
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SRSiriViewController *)self _cancelCurrentAudioMessagePlayback:v8];
    if (!v10) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  double v12 = (double)v11;
  if (self->_previousSayItCommand)
  {
    id v13 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      previousSayItCommand = self->_previousSayItCommand;
      int v17 = 136315650;
      uint64_t v18 = "-[SRSiriViewController _performGenericAceCommand:turnIdentifier:completion:]";
      __int16 v19 = 2112;
      id v20 = v8;
      __int16 v21 = 2112;
      uint64_t v22 = previousSayItCommand;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #tts recording _previousSayItCommand completed before processing ace command=%@, previousSayItCommand=%@", (uint8_t *)&v17, 0x20u);
    }
    [(SRSiriViewController *)self _didCompleteActionForAceCommand:self->_previousSayItCommand success:1];
    id v15 = self->_previousSayItCommand;
    self->_previousSayItCommand = 0;
  }
  id v16 = [(SRSiriViewController *)self _session];
  [v16 performAceCommand:v8 turnIdentifier:v9 machAbsoluteTime:v12];

  if (v10) {
LABEL_15:
  }
    v10[2](v10, 1);
LABEL_16:
}

- (void)_performSayItCommand:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 context];
  id v6 = [v4 message];
  id v31 = 0;
  id v32 = 0;
  id v28 = (void *)v5;
  id v27 = [(SRSiriViewController *)self _configuredSpeakableUtteranceParserForCommand:v4 context:v5 speakableText:v6 subCompletion:0 speakPreparation:&v32 speakCompletion:&v31];
  id v30 = v32;
  id v29 = v31;

  if (!self->_listenAfterSpeakingForRequestFinished)
  {
    char v7 = [v4 listenAfterSpeaking];
    unsigned int v8 = [v7 BOOLValue];

    if (v8)
    {
      [(SRSiriViewController *)self _setListenAfterSpeakingForRequestFinished:1];
      id v9 = [v4 listenAfterSpeakingBehavior];
      int v10 = [v9 startAlertSoundID];
      startRecordingSoundId = self->_startRecordingSoundId;
      self->_startRecordingSoundId = v10;
    }
  }
  [(SRSiriViewController *)self _didStartActionForAceCommand:v4];
  double v12 = [v4 voiceName];

  if (v12)
  {
    id v13 = self;
    id v14 = objc_alloc_init((Class)SAVoice);
    id v15 = [v4 voiceName];
    [v14 setName:v15];

    id v16 = [v4 languageCode];
    int v17 = v14;
    [v14 setLanguageString:v16];
  }
  else
  {
    id v13 = self;
    int v17 = 0;
  }
  uint64_t v18 = [v4 message];
  __int16 v19 = [v4 audioData];
  unsigned int v26 = [v4 sruif_ignoresMuteSwitch];
  id v20 = [v4 aceId];
  __int16 v21 = [v4 refId];
  uint64_t v22 = [v4 languageCode];
  uint64_t v23 = [v4 gender];
  BYTE2(v25) = [v4 canUseServerTTS];
  LOWORD(v25) = 0;
  -[SRSiriViewController _speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:](v13, "_speakText:audioData:ignoreMuteSwitch:identifier:sessionId:preferredVoice:language:gender:provisionally:eligibleAfterDuration:delayed:canUseServerTTS:speakableUtteranceParser:analyticsContext:speakableContextInfo:preparation:completion:", v18, v19, v26, v20, v21, v17, 0.0, v22, v23, v25, v27, 0, 0, v30, v29);

  long long v24 = [v4 message];
  [(SRSiriViewController *)v13 _logAceObjectSpoken:v4 dialogPhase:0 speakableText:v24];
}

- (void)_cancelCurrentTTS:(id)a3
{
}

- (void)_cancelCurrentAudioMessagePlayback:(id)a3
{
  id v4 = [(SRSiriViewController *)self _audioMessagePlayer];
  [v4 stopPlaying];

  id v7 = [(SRSiriViewController *)self _audioMessagePlayer];
  uint64_t v5 = [(SRSiriViewController *)self _audioMessagePlayer];
  id v6 = [v5 playbackCommand];
  [(SRSiriViewController *)self audioPlayer:v7 didFinishPlayback:v6];
}

- (void)_performAppPunchOutCommand:(id)a3 completion:(id)a4
{
}

- (void)_performAppPunchOutCommand:(id)a3 conversationItemIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void))a5;
  uint64_t v11 = [v8 bundleId];
  if (v11)
  {
  }
  else
  {
    double v12 = [v8 punchOutUri];

    if (!v12)
    {
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
      {
        sub_1000B982C();
        if (!v10) {
          goto LABEL_22;
        }
      }
      else if (!v10)
      {
        goto LABEL_22;
      }
      v10[2](v10, 0);
      goto LABEL_22;
    }
  }
  id v13 = [v8 refId];
  if (!v13)
  {
    id v13 = [(SRSiriViewController *)self _punchoutMetricsAceCommandIdForItemWithIdentifier:v9];
    if (!v13)
    {
      id v13 = [v8 aceId];
    }
  }
  id v14 = [v8 bundleId];
  id v15 = +[NSString stringWithFormat:@"%@-%@", v13, v14];

  id v16 = [(SRSiriViewController *)self _completedCommandAppPunchOutIds];
  unsigned __int8 v17 = [v16 containsObject:v15];

  if ((v17 & 1) == 0)
  {
    uint64_t v18 = [(SRSiriViewController *)self _completedCommandAppPunchOutIds];
    [v18 addObject:v15];

    objc_initWeak(location, self);
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100058C24;
    v48[3] = &unk_1001442B0;
    objc_copyWeak(&v52, location);
    id v49 = v13;
    id v19 = v8;
    id v50 = v19;
    id v20 = v10;
    id v51 = v20;
    unsigned __int8 v40 = objc_retainBlock(v48);
    __int16 v21 = [v19 alternativePunchOut];

    if (v21)
    {
      uint64_t v22 = [v19 alternativePunchOut];
      [(SRSiriViewController *)self _performGenericAceCommand:v22 turnIdentifier:0 completion:v20];
    }
    else
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100058D44;
      v45[3] = &unk_1001442D8;
      id v23 = v19;
      id v46 = v23;
      long long v24 = v40;
      id v47 = v24;
      [(SRSiriViewController *)self _hostWithErrorHandler:v45];
      __int16 v38 = v37 = v24;
      uint64_t v25 = [(SRSiriViewController *)self _presentation];
      LOBYTE(v24) = objc_opt_respondsToSelector();

      if (v24)
      {
        unsigned int v26 = [(SRSiriViewController *)self _presentation];
        unsigned int v39 = [v26 shouldPunchOutInPlace];

        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
          sub_1000B98A0();
        }
      }
      else
      {
        id v27 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
          sub_1000B9938(v27, v28, v29, v30, v31, v32, v33, v34);
        }
        unsigned int v39 = 0;
      }
      long long v35 = [v23 punchOutUri];
      uint64_t v36 = [v23 bundleId];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100058DBC;
      v41[3] = &unk_100144350;
      id v43 = v37;
      id v42 = v23;
      objc_copyWeak(&v44, location);
      [v38 openURL:v35 bundleId:v36 inPlace:v39 completion:v41];

      objc_destroyWeak(&v44);
      uint64_t v22 = v46;
    }

    objc_destroyWeak(&v52);
    objc_destroyWeak(location);
  }

LABEL_22:
}

- (void)_cancelIdleTimer
{
  id v3 = [(SRSiriViewController *)self _idleTimer];

  if (v3)
  {
    id v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      id v7 = "-[SRSiriViewController _cancelIdleTimer]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #idleTimer", (uint8_t *)&v6, 0xCu);
    }
    uint64_t v5 = [(SRSiriViewController *)self _idleTimer];
    [v5 invalidate];

    [(SRSiriViewController *)self _setIdleTimer:0];
  }
}

- (void)_scheduleIdleTimer
{
  [(SRSiriViewController *)self _cancelIdleTimer];
  id v3 = [(SRSiriViewController *)self _presentation];
  char v4 = objc_opt_respondsToSelector();

  double v5 = 5.0;
  if (v4)
  {
    int v6 = [(SRSiriViewController *)self _presentation];
    [v6 idleTimerInterval];
    double v5 = v7;
  }
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    uint64_t v11 = "-[SRSiriViewController _scheduleIdleTimer]";
    __int16 v12 = 2048;
    double v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #idleTimer idleTimerInterval=%f seconds", (uint8_t *)&v10, 0x16u);
  }
  id v9 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_idleTimerFired:" selector:0 userInfo:0 repeats:v5];
  [(SRSiriViewController *)self _setIdleTimer:v9];
}

- (void)_rescheduleIdleTimerIfNeeded
{
  [(SRSiriViewController *)self _checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:0];
  unsigned int v3 = [(SRSiriViewController *)self _isSiriIdleAndQuiet];
  unsigned int v4 = [(SRSiriViewController *)self _isIdleTimerEnabled];
  double v5 = [(SRSiriViewController *)self _presentation];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(SRSiriViewController *)self _presentation];
    unsigned int v8 = [v7 isPresentingUIFromRemoteDevice];
  }
  else
  {
    unsigned int v8 = 0;
  }
  id v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315906;
    uint64_t v11 = "-[SRSiriViewController _rescheduleIdleTimerIfNeeded]";
    __int16 v12 = 1024;
    unsigned int v13 = v3;
    __int16 v14 = 1024;
    unsigned int v15 = v4;
    __int16 v16 = 1024;
    unsigned int v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #idleTimer idleAndQuiet=%i idleTimerEnabled=%i isPresentingUIFromRemoteDevice:%i", (uint8_t *)&v10, 0x1Eu);
  }
  if ((v4 & (v3 | v8)) == 1) {
    [(SRSiriViewController *)self _scheduleIdleTimer];
  }
  else {
    [(SRSiriViewController *)self _cancelIdleTimer];
  }
}

- (void)_idleTimerFired:(id)a3
{
  unsigned int v4 = [(SRSiriViewController *)self _presentation];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    char v6 = [(SRSiriViewController *)self _presentation];
    unsigned int v7 = [v6 shouldDismissForIdling];
  }
  else
  {
    unsigned int v7 = 0;
  }
  unsigned int v8 = [(SRSiriViewController *)self _isIdleTimerEnabled];
  unsigned int v9 = [(SRSiriViewController *)self _isSiriIdleAndQuiet];
  int v10 = [(SRSiriViewController *)self _presentation];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    __int16 v12 = [(SRSiriViewController *)self _presentation];
    unsigned int v13 = [v12 isPresentingUIFromRemoteDevice];
  }
  else
  {
    unsigned int v13 = 0;
  }
  __int16 v14 = AFSiriLogContextConnection;
  BOOL v15 = os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT);
  if ((v7 & v8 & (v9 | v13)) == 1)
  {
    if (v15)
    {
      int v19 = 136315138;
      id v20 = "-[SRSiriViewController _idleTimerFired:]";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #idleTimer Dismissing Siri", (uint8_t *)&v19, 0xCu);
    }
    [(SRSiriViewController *)self _cancelIdleTimer];
    __int16 v16 = [(SRSiriViewController *)self _presentation];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      uint64_t v18 = [(SRSiriViewController *)self _presentation];
      [v18 siriWillDismissWithReason:1 completion:0];
    }
    [(SRSiriViewController *)self _dismissWithReason:4];
  }
  else
  {
    if (v15)
    {
      int v19 = 136316162;
      id v20 = "-[SRSiriViewController _idleTimerFired:]";
      __int16 v21 = 1024;
      unsigned int v22 = v7;
      __int16 v23 = 1024;
      unsigned int v24 = v9;
      __int16 v25 = 1024;
      unsigned int v26 = v8;
      __int16 v27 = 1024;
      unsigned int v28 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #idleTimer Not dismissing Siri - readyToDismiss:%d idleAndQuiet:%d idleTimerEnabled:%d isPresentingUIFromRemoteDevice:%d", (uint8_t *)&v19, 0x24u);
    }
    [(SRSiriViewController *)self _rescheduleIdleTimerIfNeeded];
  }
}

- (BOOL)_isSiriIdleAndQuiet
{
  int64_t siriState = self->_siriState;
  if (siriState) {
    BOOL v4 = siriState == 3;
  }
  else {
    BOOL v4 = 1;
  }
  int v5 = v4;
  unsigned int v6 = [(SRSiriViewController *)self _isRequestActive];
  unsigned int v7 = [(SRSiriViewController *)self _isSpeechSynthesisSpeaking];
  unsigned int v8 = [(SRSiriViewController *)self _isAudioPlayerPlaying];
  unsigned int v9 = [(SRSiriViewController *)self _isWaitingForStartRequest];
  BOOL delaySessionEndForInPlacePunchout = self->_delaySessionEndForInPlacePunchout;
  int v11 = v9 ^ 1;
  if (self->_delaySessionEndForInPlacePunchout) {
    int v11 = 0;
  }
  if (v8) {
    int v11 = 0;
  }
  if (v7) {
    int v11 = 0;
  }
  if (v6) {
    int v11 = 0;
  }
  if (v5 == 1) {
    BOOL v12 = v11;
  }
  else {
    BOOL v12 = 0;
  }
  unsigned int v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"NO ";
    int v16 = 136316930;
    char v17 = "-[SRSiriViewController _isSiriIdleAndQuiet]";
    __int16 v18 = 2112;
    if (v12) {
      CFStringRef v14 = @"YES";
    }
    CFStringRef v19 = v14;
    __int16 v20 = 1024;
    int v21 = v5;
    __int16 v22 = 1024;
    unsigned int v23 = v6;
    __int16 v24 = 1024;
    unsigned int v25 = v7;
    __int16 v26 = 1024;
    unsigned int v27 = v8;
    __int16 v28 = 1024;
    unsigned int v29 = v9;
    __int16 v30 = 1024;
    BOOL v31 = delaySessionEndForInPlacePunchout;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #idle %@ - inIdleState:%d requestActive:%d speaking:%d audioPlaying:%d waitingForStartRequest:%d delayingSessionEndForInPlacePunchout:%d", (uint8_t *)&v16, 0x3Au);
  }
  return v12;
}

- (void)_checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:(id)a3
{
  unsigned int v8 = (void (**)(id, BOOL))a3;
  BOOL v4 = [(SRSiriViewController *)self _isSiriIdleAndQuiet];
  unint64_t v5 = [(SRSiriViewController *)self _wasSiriIdleAndQuiet];
  if (v4) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [(SRSiriViewController *)self _setWasSiriIdleAndQuiet:v6];
  if (v5 != v6)
  {
    unsigned int v7 = [(SRSiriViewController *)self _hostWithErrorHandler:&stru_100144370];
    [v7 siriIdleAndQuietStatusDidChange:v4];

    [(SRSiriViewController *)self _scheduleInterruptedAudioResumingIfNeeded];
    if (v8) {
      v8[2](v8, v4);
    }
  }
}

- (void)_checkAndUpdateSiriIdleAndQuietStatusIfNeeded
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100059AC8;
  v3[3] = &unk_100143548;
  objc_copyWeak(&v4, &location);
  [(SRSiriViewController *)self _checkAndUpdateSiriIsIdleAndQuietStatusWithChangeHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_scheduleInterruptedAudioResumingIfNeeded
{
  if (!self->_waitingForTelephonyToStart)
  {
    if ([(SRSiriViewController *)self _isSiriIdleAndQuiet])
    {
      objc_initWeak(&location, self);
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_100059E00;
      v3[3] = &unk_100143548;
      objc_copyWeak(&v4, &location);
      [(SRSiriViewController *)self _fetchAttendingState:v3];
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_scheduleAudioResumptionAfterDelayInSec:(double)a3
{
  unint64_t v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    int v10 = "-[SRSiriViewController _scheduleAudioResumptionAfterDelayInSec:]";
    __int16 v11 = 2048;
    double v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Scheduling interrupted audio to be resumed in %lf seconds", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005A05C;
  block[3] = &unk_100143410;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)_checkAndUpdateSiriIdleAndQuietStatusOrRescheduleIdleTimerIfNeeded
{
  if ([(SRSiriViewController *)self _usesEventDrivenIdleAndQuietUpdates])
  {
    [(SRSiriViewController *)self _checkAndUpdateSiriIdleAndQuietStatusIfNeeded];
  }
  else
  {
    [(SRSiriViewController *)self _rescheduleIdleTimerIfNeeded];
  }
}

- (BOOL)_resumesInterruptedAudioPlaybackForAttendingState:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SRSiriViewController *)self _presentation];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v5 = [v4 shouldResumeInterruptedAudioPlaybackForAttendingState:v3];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)_usesEventDrivenIdleAndQuietUpdates
{
  id v2 = [(SRSiriViewController *)self _presentation];
  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v3 = [v2 shouldUseEventDrivenIdleAndQuietUpdates];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (void)_setExperimentationManager:(id)a3
{
}

- (void)_handleRequestError:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B9B10();
    }
    id v8 = +[SRErrorUtility userStringForError:v6 reflectionDialogWasPlayed:[(SRSiriViewController *)self _reflectionDialogHasBeenPlayed]];
    unsigned int v9 = [(SRSiriViewController *)self _instrumentationManager];
    [v9 emitRequestFailedWithError:v6];

    int v10 = [v6 domain];
    if ([v10 isEqualToString:kAFAssistantErrorDomain])
    {
      id v11 = [v6 code];

      if (v11 == (id)6)
      {
        double v12 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315394;
          char v17 = "-[SRSiriViewController _handleRequestError:completion:]";
          __int16 v18 = 2114;
          id v19 = v6;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #errorHandling handling kAFErrorNotReady: %{public}@ locally", buf, 0x16u);
        }
        [(SRSiriViewController *)self _displayNotReadyError:v7];
        goto LABEL_20;
      }
    }
    else
    {
    }
    if (v8)
    {
      [(SRSiriViewController *)self _addErrorUtterance:v8];
      if (![(SRSiriViewController *)self _suppressTTSForErrorsAndInterstitials])
      {
        unsigned int v13 = AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 136315394;
          char v17 = "-[SRSiriViewController _handleRequestError:completion:]";
          __int16 v18 = 2112;
          id v19 = v8;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #errorHandling speaking error TTS with error string: '%@'", buf, 0x16u);
        }
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        id v14[2] = sub_10005A56C;
        v14[3] = &unk_100143CE8;
        id v15 = v7;
        [(SRSiriViewController *)self _synthesizeText:v8 identifier:0 sessionId:0 completion:v14];

        goto LABEL_20;
      }
    }
    else if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      sub_1000B9A9C();
      if (!v7) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    if (!v7)
    {
LABEL_20:

      goto LABEL_21;
    }
LABEL_19:
    (*((void (**)(id, BOOL))v7 + 2))(v7, v8 != 0);
    goto LABEL_20;
  }
  +[SRErrorUtility resetErrorState];
  if (v7) {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_21:
}

- (void)_displayNotReadyError:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[NSBundle bundleForClass:objc_opt_class()];
  id v6 = [v5 assistantUILocalizedStringForKey:@"ASSISTANT_NOT_READY_TITLE" table:0];

  id v7 = +[NSBundle bundleForClass:objc_opt_class()];
  id v8 = [v7 assistantUILocalizedStringForKey:@"ASSISTANT_NOT_READY_MESSAGE" table:0];

  [(SRSiriViewController *)self _addErrorUtterance:v6];
  [(SRSiriViewController *)self _addErrorUtterance:v8];
  [(SRSiriViewController *)self _synthesizeText:v6 identifier:0 sessionId:0 completion:0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005A6F0;
  v10[3] = &unk_100143CE8;
  id v11 = v4;
  id v9 = v4;
  [(SRSiriViewController *)self _synthesizeText:v8 identifier:0 sessionId:0 completion:v10];
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (id)_searchAddViewsForSpokenHintsView:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unsigned __int8 v3 = [a3 views];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    uint64_t v7 = SAAceViewUIItemTypeItemTypeHintValue;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v10 = [v9 itemType];
        unsigned __int8 v11 = [v10 isEqualToString:v7];

        if (v11)
        {
          id v13 = v9;

          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  double v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v20 = "-[SRSiriViewController _searchAddViewsForSpokenHintsView:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #suggestions No hints SAAceView in the SAUIAddViews.", buf, 0xCu);
  }
  id v13 = 0;
LABEL_13:

  return v13;
}

- (void)_enqueueSpokenSuggestionsFromAddViews:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSiriViewController *)self _searchAddViewsForSpokenHintsView:v4];
  if (v5)
  {
    uint64_t v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      unsigned __int8 v11 = "-[SRSiriViewController _enqueueSpokenSuggestionsFromAddViews:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #suggestions We found a hints SAAceView in the SAUIAddViews. Querying SiriSuggestions for potential spoken hints.", buf, 0xCu);
    }
    [(SRUIFAceCommandRecords *)self->_aceCommandRecords recordActionStartedForAceCommand:v4];
    objc_initWeak((id *)buf, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10005AA68;
    v7[3] = &unk_1001443C0;
    objc_copyWeak(&v9, (id *)buf);
    id v8 = v4;
    +[SiriUISpokenSuggestionsProvider fetchTopSpokenSuggestionFrom:v8 completion:v7];

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_speakEnqueuedSpokenSuggestion
{
  unsigned __int8 v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    double v12 = "-[SRSiriViewController _speakEnqueuedSpokenSuggestion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #suggestions Request TTS finished. Calling exposure callback and speaking hint TTS.", buf, 0xCu);
  }
  id v4 = self->_enqueuedSuggestion;
  enqueuedSuggestion = self->_enqueuedSuggestion;
  self->_enqueuedSuggestion = 0;

  [(SiriUISuggestion *)v4 siriDidSpeakHint];
  objc_initWeak((id *)buf, self);
  uint64_t v6 = [(SiriUISuggestion *)v4 spokenText];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005AD78;
  v8[3] = &unk_100143FE8;
  objc_copyWeak(&v10, (id *)buf);
  uint64_t v7 = v4;
  id v9 = v7;
  [(SRSiriViewController *)self _synthesizeText:v6 identifier:0 sessionId:0 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)_logRevealSpeechCommandReceived:(id)a3
{
  id v4 = [a3 recognition];
  id v5 = [v4 utterances];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    double v10 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * i) confidenceScore:v16];
        double v10 = v10 + v12;
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  if ([v6 count]) {
    double v10 = v10 / (double)(unint64_t)[v6 count];
  }
  CFStringRef v20 = @"confidenceScore";
  id v13 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10, (void)v16);
  int v21 = v13;
  CFStringRef v14 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];

  long long v15 = [(SRSiriViewController *)self _analytics];
  [v15 logEventWithType:1459 context:v14];
}

- (unint64_t)_currentModeWithModeProvider:(id)a3
{
  return (unint64_t)_[a3 currentMode];
}

- (id)_analytics
{
  return +[AFAnalytics sharedAnalytics];
}

- (id)_instrumentationManager
{
  return +[SRUIFInstrumentationManager sharedManager];
}

- (void)_addErrorUtterance:(id)a3
{
  id v4 = a3;
  id v11 = +[NSMutableArray array];
  id v5 = objc_alloc_init((Class)SAUIAddViews);
  [v5 setDialogPhase:SAUIDialogPhaseErrorValue];
  id v6 = objc_alloc_init((Class)SAUIAssistantUtteranceView);
  [v6 setText:v4];

  [v11 addObject:v6];
  [v5 setViews:v11];
  id v7 = [v5 dictionary];
  id v8 = +[AceObject aceObjectWithDictionary:v7];

  uint64_t v9 = +[NSUUID UUID];
  double v10 = [v9 UUIDString];
  [v8 setAceId:v10];

  [(SRSiriViewController *)self _performGenericAceCommand:v8 turnIdentifier:0 completion:0];
}

- (void)_audioSessionRouteDidChange:(id)a3
{
  id v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:AVAudioSessionRouteChangeReasonKey];
  id v6 = [v5 unsignedIntegerValue];

  if (v6 == (id)2)
  {
    [(SRSiriViewController *)self _cancelSpeechSynthesis];
  }
}

- (void)_startListenAfterSpeaking
{
  [(SRSiriViewController *)self _setAcousticIdAllowed:0];
  if ([(SASRequestOptions *)self->_requestOptions requestSource] == (id)23
    || [(SASRequestOptions *)self->_requestOptions isSuggestionSourceWithTextInput])
  {
    unsigned __int8 v3 = (void *)AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      requestOptions = self->_requestOptions;
      id v5 = v3;
      [(SASRequestOptions *)requestOptions requestSource];
      id v6 = SASRequestSourceGetName();
      *(_DWORD *)long long buf = 136315394;
      long long v18 = "-[SRSiriViewController _startListenAfterSpeaking]";
      __int16 v19 = 2112;
      CFStringRef v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #tts Not listening after speaking because requestSource == %@", buf, 0x16u);
    }
    return;
  }
  if (![(SASRequestOptions *)self->_requestOptions isForAppleTV])
  {
LABEL_11:
    if ([(SRSiriViewController *)self _isStartRequestAceCommandSent])
    {
      double v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v18 = "-[SRSiriViewController _startListenAfterSpeaking]";
        id v11 = "%s #tts Not listening after speaking because SAStartRequest was sent during TTS";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      }
    }
    else
    {
      double v12 = +[AFPreferences sharedPreferences];
      unsigned int v13 = [v12 listenAfterSpeakingDisabled];

      if (!v13)
      {
        objc_initWeak((id *)buf, self);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10005B660;
        v15[3] = &unk_100143548;
        objc_copyWeak(&v16, (id *)buf);
        [(SRSiriViewController *)self _fetchAttendingState:v15];
        objc_destroyWeak(&v16);
        objc_destroyWeak((id *)buf);
        return;
      }
      double v10 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v18 = "-[SRSiriViewController _startListenAfterSpeaking]";
        id v11 = "%s #tts Not listening after speaking because listenAfterSpeakingDisabled == YES";
        goto LABEL_17;
      }
    }
    self->_keyboardEnabled = 1;
    return;
  }
  id v7 = [(SASRequestOptions *)self->_requestOptions requestInfo];
  if (objc_msgSend(v7, "afui_isRemoteHeadsetActivation"))
  {

    goto LABEL_9;
  }
  unsigned __int8 v8 = [(SASRequestOptions *)self->_requestOptions afui_isTVFollowUpHearstActivation];

  if (v8)
  {
LABEL_9:
    uint64_t v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v18 = "-[SRSiriViewController _startListenAfterSpeaking]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #tts #tv Allowing listening after speaking for multi-turn request on AppleTV when auto endpointing is on", buf, 0xCu);
    }
    goto LABEL_11;
  }
  CFStringRef v14 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    long long v18 = "-[SRSiriViewController _startListenAfterSpeaking]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s #tts #tv Not listening after speaking because requestSource is one of the request sources for AppleTV.", buf, 0xCu);
  }
}

- (void)siriPresentation:(id)a3 requestsAttendingStateWithCompletion:(id)a4
{
}

- (void)_fetchAttendingState:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSiriViewController *)self _session];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005B844;
  v7[3] = &unk_100143278;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchAttendingState:v7];
}

- (void)_notifyPromptedUserForInput
{
  id v2 = [(SRSiriViewController *)self _session];
  [v2 promptedUserForInput];
}

- (void)_startListenAfterSpeakingRequest
{
  unsigned __int8 v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    CFStringRef v20 = "-[SRSiriViewController _startListenAfterSpeakingRequest]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #tts Start listening. Starting new request after TTS completed", buf, 0xCu);
  }
  id v4 = objc_alloc((Class)SASRequestOptions);
  id v5 = [(SRSiriViewController *)self _uiPresentationIdentifier];
  id v6 = [v4 initWithRequestSource:9 uiPresentationIdentifier:v5];

  id v7 = [(SRSiriViewController *)self _requestOptions];
  [v6 setIsForBluetoothCar:[v7 isForBluetoothCar]];

  id v8 = [(SRSiriViewController *)self _requestOptions];
  uint64_t v9 = [v8 originalRequestOptions];
  if (v9)
  {
    [v6 setOriginalRequestOptions:v9];
  }
  else
  {
    double v10 = [(SRSiriViewController *)self _requestOptions];
    [v6 setOriginalRequestOptions:v10];
  }
  [v6 setStartRecordingSoundId:self->_startRecordingSoundId];
  id v11 = [objc_alloc((Class)AFSpeechRequestOptions) initWithActivationEvent:5];
  double v12 = objc_opt_new();
  [v12 setSpeechRequestOptions:v11];
  [v6 setRequestInfo:v12];
  objc_initWeak((id *)buf, self);
  ttsManager = self->_ttsManager;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005BB20;
  v15[3] = &unk_1001443E8;
  objc_copyWeak(&v18, (id *)buf);
  id v14 = v6;
  id v16 = v14;
  long long v17 = self;
  [(SRUIFSpeechSynthesizer *)ttsManager isSynthesisQueueEmpty:v15];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (id)_punchoutMetricsAceCommandIdForItemWithIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_7;
  }
  id v5 = [(SRSiriViewController *)self _activeConversation];
  unsigned int v6 = [v5 containsItemWithIdentifier:v4];

  if (!v6) {
    goto LABEL_7;
  }
  id v7 = [(SRSiriViewController *)self _activeConversation];
  id v8 = [v7 itemWithIdentifier:v4];

  if (v8)
  {
    while (1)
    {
      uint64_t v9 = [v8 aceCommandIdentifier];
      if (v9) {
        break;
      }
      double v10 = [(SRSiriViewController *)self _activeConversation];
      id v11 = [v8 identifier];
      uint64_t v12 = [v10 parentOfItemWithIdentifier:v11];

      id v8 = (void *)v12;
      if (!v12)
      {
        unsigned int v13 = 0;
        goto LABEL_12;
      }
    }
    unsigned int v13 = (void *)v9;
LABEL_12:
  }
  else
  {
LABEL_7:
    unsigned int v13 = 0;
  }

  return v13;
}

- (id)_metricsContextForItemWithAceCommandId:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSiriViewController *)self _aceCommandRecords];
  unsigned int v6 = [v5 aceCommandWithIdentifier:v4];

  if (v6)
  {
    id v7 = [v6 refId];

    id v8 = 0;
    if (v4 && v7)
    {
      v15[0] = @"i";
      uint64_t v9 = [v6 refId];
      v15[1] = @"a";
      v16[0] = v9;
      v16[1] = v4;
      double v10 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

      id v14 = 0;
      id v11 = +[NSJSONSerialization dataWithJSONObject:v10 options:0 error:&v14];
      id v12 = v14;
      if (v11)
      {
        id v8 = [objc_alloc((Class)NSString) initWithData:v11 encoding:4];
      }
      else
      {
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
          sub_1000B9B84();
        }
        id v8 = 0;
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_uiPresentationIdentifier
{
  unsigned __int8 v3 = [(SRSiriViewController *)self _requestOptions];
  id v4 = [v3 uiPresentationIdentifier];
  id v5 = [v4 length];

  if (v5)
  {
    unsigned int v6 = [(SRSiriViewController *)self _requestOptions];
    id v7 = [v6 uiPresentationIdentifier];
  }
  else
  {
    id v8 = [(SRSiriViewController *)self _presentation];
    char v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0
      && ([(SRSiriViewController *)self _presentation],
          double v10 = objc_claimAutoreleasedReturnValue(),
          id v11 = (char *)[v10 options],
          v10,
          (unint64_t)(v11 - 1) <= 7))
    {
      id v7 = off_100144440[(void)(v11 - 1)];
    }
    else
    {
      id v7 = @"com.apple.siri.Compact";
    }
  }

  return v7;
}

- (void)_logAceObjectPresented:(id)a3 dialogPhase:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [(SRSiriViewController *)self _instrumentationManager];
    id v8 = [v17 aceId];
    [v7 emitPartialSpeechTranscriptionEventForAceObjectWithIdentifier:v8];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [(SRSiriViewController *)self _instrumentationManager];
      id v8 = [v17 aceId];
      [v7 emitFinalSpeechTranscriptionEventForAceObjectWithIdentifier:v8];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v9 = [(SRSiriViewController *)self _instrumentationPresentationForPresentationOptions:[(SRSiriViewController *)self _presentationOptions]];
        analyticsSupplement = self->_analyticsSupplement;
        id v11 = [v17 refId];
        id v12 = [(SRUIFAnalyticsSupplement *)analyticsSupplement computedModeForRefId:v11];

        unsigned int v13 = [(SRSiriViewController *)self _presentation];
        char v14 = objc_opt_respondsToSelector();

        if (v14)
        {
          long long v15 = [(SRSiriViewController *)self _presentation];
          id v16 = [v15 viewRegionForPresentedAceObject:v17];
        }
        else
        {
          id v16 = 0;
        }
        id v7 = [(SRSiriViewController *)self _instrumentationManager];
        [v7 emitUUFRShownForAceObject:v17 presentationType:v9 dialogPhase:v6 mode:v12 viewRegion:v16];
        goto LABEL_8;
      }
      id v7 = [(SRSiriViewController *)self _instrumentationManager];
      id v8 = [v17 aceId];
      [v7 emitRevealSpeechTranscriptionEventForAceObjectWithIdentifier:v8];
    }
  }

LABEL_8:
}

- (void)_logAceObjectSpoken:(id)a3 dialogPhase:(id)a4 speakableText:(id)a5
{
}

- (void)_logAceObjectSpoken:(id)a3 dialogPhase:(id)a4 speakableText:(id)a5 dialogIdentifierOverride:(id)a6
{
  id v21 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [(SRSiriViewController *)self _instrumentationPresentationForPresentationOptions:[(SRSiriViewController *)self _presentationOptions]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v21;
    if (_os_feature_enabled_impl())
    {
      if (+[MDDialogTransformer supportsTransformationForAceCommand:v14])
      {
LABEL_7:
        analyticsSupplement = self->_analyticsSupplement;
        id v18 = [v14 refId];
        id v19 = [(SRUIFAnalyticsSupplement *)analyticsSupplement computedModeForRefId:v18];

        if (v19) {
          goto LABEL_10;
        }
      }
    }
    else if (+[SRModeDialogTransformer supportsTransformationForAceCommand:v14])
    {
      goto LABEL_7;
    }
    id v16 = [(SRUIFAnalyticsSupplement *)self->_analyticsSupplement computedModeForAceCommand:v14];
    goto LABEL_9;
  }
  long long v15 = self->_analyticsSupplement;
  id v14 = [v21 refId];
  id v16 = [(SRUIFAnalyticsSupplement *)v15 computedModeForRefId:v14];
LABEL_9:
  id v19 = v16;
LABEL_10:

  CFStringRef v20 = [(SRSiriViewController *)self _instrumentationManager];
  [v20 emitUUFRSpokenForAceObject:v21 presentationType:v13 dialogPhase:v12 mode:v19 speakableText:v11 dialogIdentifierOverride:v10];
}

- (int)_instrumentationResponseModeForMode:(unint64_t)a3
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return dword_1000DC590[a3];
  }
}

- (int)_mapSiriTransitionState:(int64_t)a3
{
  if ((unint64_t)a3 > 4) {
    return 0;
  }
  else {
    return dword_1000DC4F8[a3];
  }
}

- (int)_instrumentationPresentationForPresentationOptions:(int64_t)a3
{
  id v4 = [(SRSiriViewController *)self traitCollection];
  unsigned __int8 v5 = [v4 isAmbientPresented];

  if (v5) {
    return 7;
  }
  if ((unint64_t)a3 > 8) {
    return 0;
  }
  return dword_1000DC50C[a3];
}

- (unint64_t)_MDModeToSRModeConverter:(unint64_t)a3
{
  if (a3 > 3) {
    return 1;
  }
  else {
    return qword_1000DC530[a3];
  }
}

- (unint64_t)_SRModeToMDModeConverter:(unint64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 != 0;
  }
}

- (unint64_t)_responseModeToMDModeConverter:(id)a3
{
  unsigned __int8 v3 = [a3 lowercaseString];
  if ([v3 isEqualToString:@"displayonly"])
  {
    unint64_t v4 = 2;
  }
  else
  {
    if (([v3 isEqualToString:@"displayforward"] & 1) == 0)
    {
      if ([v3 isEqualToString:@"voiceonly"])
      {
        unint64_t v4 = 0;
        goto LABEL_9;
      }
      if ([v3 isEqualToString:@"voiceforward"])
      {
        unint64_t v4 = 3;
        goto LABEL_9;
      }
      id v6 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315138;
        id v8 = "-[SRSiriViewController _responseModeToMDModeConverter:]";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #modes Incompatible ResponseMode sent via addViews. Defaulting to DisplayForward", (uint8_t *)&v7, 0xCu);
      }
    }
    unint64_t v4 = 1;
  }
LABEL_9:

  return v4;
}

- (BOOL)_suppressTTSForErrorsAndInterstitials
{
  unsigned __int8 v3 = [(SRSiriViewController *)self _requestOptions];
  unint64_t v4 = [v3 requestInfo];
  id v5 = [v4 activationEvent];

  id v6 = [(SRSiriViewController *)self _requestOptions];
  if ([v6 requestSource] == (id)26 || v5 == (id)6)
  {
  }
  else
  {

    if (v5 != (id)9)
    {
      modeProvider = self->_modeProvider;
      return [(SRModeProvider *)modeProvider displayOnlyModeForInterstitialsAndErrors];
    }
  }
  id v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    id v11 = "-[SRSiriViewController _suppressTTSForErrorsAndInterstitials]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #errorHandling suppressing interstitial and error TTS for spoken messages", (uint8_t *)&v10, 0xCu);
  }
  return 1;
}

- (void)_setListenAfterSpeakingForRequestFinished:(BOOL)a3
{
  self->_BOOL listenAfterSpeakingForRequestFinished = a3;
  unint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    BOOL listenAfterSpeakingForRequestFinished = self->_listenAfterSpeakingForRequestFinished;
    int v6 = 136315394;
    int v7 = "-[SRSiriViewController _setListenAfterSpeakingForRequestFinished:]";
    __int16 v8 = 1024;
    BOOL v9 = listenAfterSpeakingForRequestFinished;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s listenAfterSpeaking - %d", (uint8_t *)&v6, 0x12u);
  }
}

- (void)_sharePatternIdFromAddViewsCommand:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 patternId];

  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [v3 views];
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        BOOL v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v14 + 1) + 8 * (void)v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = v10;
            id v12 = [v3 patternId];
            uint64_t v13 = [v11 viewId];

            +[VRXVisualResponseProvider setPatternId:v12 forViewId:v13];
          }
          BOOL v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

- (void)_logPatternExecutedEventForAddViewsCommand:(id)a3
{
  id v14 = a3;
  unint64_t v4 = [v14 patternId];
  if (v4)
  {
  }
  else if (![(NSString *)self->_responseViewId length])
  {
    goto LABEL_5;
  }
  id v5 = objc_alloc((Class)VRXPatternExecutedInstrumentationEvent);
  id v6 = [v14 patternId];
  id v7 = [v14 patternType];
  responseViewId = self->_responseViewId;
  BOOL v9 = [v14 responseMode];
  id v10 = [v5 initWithPatternId:v6 patternType:v7 responseViewId:responseViewId responseMode:v9];

  id v11 = [(SRSiriViewController *)self _instrumentationManager];
  id v12 = [v11 currentInstrumentationTurnContext];
  uint64_t v13 = [v12 turnIdentifier];

  [v10 emitWithTurnIdentifier:v13];
LABEL_5:
}

- (int64_t)_viewModeFromPresentationOptions:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return 7;
  }
  else {
    return qword_1000DC550[a3 - 1];
  }
}

- (void)_setConversations:(id)a3
{
}

- (void)_setPresentedConversationItemRevisionIdentifiers:(id)a3
{
}

- (void)_setDelayedConversationItemRevisionIdentifiers:(id)a3
{
}

- (void)_setAceCommandRecords:(id)a3
{
}

- (SiriUIPresentation)presentation
{
  return self->_presentation;
}

- (AFUISiriSession)_session
{
  return self->_session;
}

- (SRPreferences)_preferences
{
  return self->_preferences;
}

- (CGRect)_statusBarFrame
{
  double x = self->_statusBarFrame.origin.x;
  double y = self->_statusBarFrame.origin.y;
  double width = self->_statusBarFrame.size.width;
  double height = self->_statusBarFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)_statusViewHeight
{
  return self->_statusViewHeight;
}

- (double)_bottomContentInset
{
  return self->_bottomContentInset;
}

- (CGRect)_systemContentFrame
{
  double x = self->_systemContentFrame.origin.x;
  double y = self->_systemContentFrame.origin.y;
  double width = self->_systemContentFrame.size.width;
  double height = self->_systemContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (AFConversationStore)_conversationStore
{
  return self->_conversationStore;
}

- (NSMutableArray)_conversations
{
  return self->_conversations;
}

- (AFUISiriLanguage)_language
{
  return self->_language;
}

- (void)_setVoicemailPlayer:(id)a3
{
}

- (void)_setAudioMessagePlayer:(id)a3
{
}

- (SRUIFAceCommandRecords)_aceCommandRecords
{
  return self->_aceCommandRecords;
}

- (void)setCompletedCommandAppPunchOutIds:(id)a3
{
}

- (SASRequestOptions)_requestOptions
{
  return self->_requestOptions;
}

- (NSString)_currentAVRecordRoute
{
  return self->_currentAVRecordRoute;
}

- (void)_setCurrentAVRecordRoute:(id)a3
{
}

- (int64_t)_siriState
{
  return self->_siriState;
}

- (void)_setSiriState:(int64_t)a3
{
  self->_int64_t siriState = a3;
}

- (NSTimer)_idleTimer
{
  return self->__idleTimer;
}

- (void)_setIdleTimer:(id)a3
{
}

- (BOOL)_isIdleTimerEnabled
{
  return self->__idleTimerEnabled;
}

- (void)_setIdleTimerEnabled:(BOOL)a3
{
  self->__idleTimerEnabled = a3;
}

- (BOOL)_isAcousticIdAllowed
{
  return self->_acousticIdAllowed;
}

- (void)_setAcousticIdAllowed:(BOOL)a3
{
  self->_acousticIdAllowed = a3;
}

- (unint64_t)_wasSiriIdleAndQuiet
{
  return self->_wasSiriIdleAndQuiet;
}

- (void)_setWasSiriIdleAndQuiet:(unint64_t)a3
{
  self->_wasSiriIdleAndQuiet = a3;
}

- (AFManagedStorageConnection)_domainObjectStorageConnection
{
  return self->_domainObjectStorageConnection;
}

- (BOOL)_isWaitingForStartRequest
{
  return self->_waitingForStartRequest;
}

- (void)_setWaitingForStartRequest:(BOOL)a3
{
  self->_waitingForStartRequest = a3;
}

- (BOOL)_isRequestActive
{
  return self->_requestActive;
}

- (void)_setRequestActive:(BOOL)a3
{
  self->_BOOL requestActive = a3;
}

- (BOOL)_isUserUtteranceTapToEditInProgress
{
  return self->_userUtteranceTapToEditInProgress;
}

- (void)_setUserUtteranceTapToEditInProgress:(BOOL)a3
{
  self->_userUtteranceTapToEditInProgress = a3;
}

- (NSMutableArray)_repeatablePhrases
{
  return self->_repeatablePhrases;
}

- (void)_setRepeatablePhrases:(id)a3
{
}

- (BOOL)_listenAfterSpeakingForRepeatable
{
  return self->_listenAfterSpeakingForRepeatable;
}

- (void)_setListenAfterSpeakingForRepeatable:(BOOL)a3
{
  self->_listenAfterSpeakingForRepeatable = a3;
}

- (BOOL)_isStartRequestAceCommandSent
{
  return self->_startRequestAceCommandSent;
}

- (void)_setStartRequestAceCommandSent:(BOOL)a3
{
  self->_startRequestAceCommandSent = a3;
}

- (BOOL)_isAudioPlayerPlaying
{
  return self->_audioPlayerIsPlaying;
}

- (void)_setAudioPlayerIsPlaying:(BOOL)a3
{
  self->_audioPlayerIsPlaying = a3;
}

- (BOOL)_isKeyboardLoweredAfterResponse
{
  return self->_keyboardLoweredAfterResponse;
}

- (void)_setKeyboardLoweredAfterResponse:(BOOL)a3
{
  self->_keyboardLoweredAfterResponse = a3;
}

- (NSString)_utteranceToSpeakAfterClearScreenCommand
{
  return self->_utteranceToSpeakAfterClearScreenCommand;
}

- (void)_setUtteranceToSpeakAfterClearScreenCommand:(id)a3
{
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (void)setInputAccessoryView:(id)a3
{
}

- (SAUISayIt)previousSayItCommand
{
  return self->_previousSayItCommand;
}

- (void)setPreviousSayItCommand:(id)a3
{
}

- (BOOL)_listenAfterSpeakingForRequestFinished
{
  return self->_listenAfterSpeakingForRequestFinished;
}

- (BOOL)_isReadingBulletinContentInCarPlayOutsideOfSiriSession
{
  return self->_readingBulletinContentInCarPlayOutsideOfSiriSession;
}

- (void)_setReadingBulletinContentInCarPlayOutsideOfSiriSession:(BOOL)a3
{
  self->_readingBulletinContentInCarPlayOutsideOfSiriSession = a3;
}

- (BOOL)_reflectionDialogHasBeenPlayed
{
  return self->_reflectionDialogHasBeenPlayed;
}

- (void)_reflectionDialogHasBeenPlayed:(BOOL)a3
{
  self->_reflectionDialogHasBeenPlayed = a3;
}

- (BOOL)_shouldShowDownloadAssetsNotificationPrompt
{
  return self->_shouldShowDownloadAssetsNotificationPrompt;
}

- (void)_shouldShowDownloadAssetsNotificationPrompt:(BOOL)a3
{
  self->_shouldShowDownloadAssetsNotificationPrompt = a3;
}

- (_TtC4Siri36SRAssetsDownloadBannerViewController)_bannerViewController
{
  return self->_bannerViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerViewController, 0);
  objc_storeStrong((id *)&self->_previousSayItCommand, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_storeStrong((id *)&self->_utteranceToSpeakAfterClearScreenCommand, 0);
  objc_storeStrong((id *)&self->_repeatablePhrases, 0);
  objc_storeStrong((id *)&self->_domainObjectStorageConnection, 0);
  objc_storeStrong((id *)&self->__idleTimer, 0);
  objc_storeStrong((id *)&self->_currentAVRecordRoute, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_completedCommandAppPunchOutIds, 0);
  objc_storeStrong((id *)&self->_aceCommandRecords, 0);
  objc_storeStrong((id *)&self->_audioMessagePlayer, 0);
  objc_storeStrong((id *)&self->_voicemailPlayer, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_conversations, 0);
  objc_storeStrong((id *)&self->_conversationStore, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_instrumentationStateTransitionsPendingInitialTurn, 0);
  objc_storeStrong((id *)&self->_enqueuedSuggestion, 0);
  objc_storeStrong((id *)&self->_systemUIController, 0);
  objc_storeStrong((id *)&self->_phPicker, 0);
  objc_storeStrong((id *)&self->_addViewsRefId, 0);
  objc_storeStrong((id *)&self->_ttsManager, 0);
  objc_storeStrong((id *)&self->_analyticsSupplement, 0);
  objc_storeStrong((id *)&self->_testingContext, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_siriSessionInfo, 0);
  objc_storeStrong((id *)&self->_startRecordingSoundId, 0);
  objc_storeStrong((id *)&self->_requestText, 0);
  objc_storeStrong((id *)&self->_modeProvider, 0);
  objc_storeStrong((id *)&self->_currentNotificationSound, 0);
  objc_storeStrong((id *)&self->_repeatableAudioSayit, 0);
  objc_storeStrong((id *)&self->_pendingPreSynthesisTasks, 0);
  objc_storeStrong((id *)&self->_delayedConversationItemRevisionIdentifiers, 0);
  objc_storeStrong((id *)&self->_presentedConversationItemRevisionIdentifiers, 0);
  objc_storeStrong((id *)&self->_synthesisPreparationDictionary, 0);
  objc_storeStrong((id *)&self->_responseViewId, 0);

  objc_storeStrong((id *)&self->_ttsDelayedBlocks, 0);
}

- (void)runPPTWithOptions:(id)a3
{
  id v8 = a3;
  uint64_t v4 = SUICPPTTestNameKey;
  id v5 = [v8 objectForKey:SUICPPTTestNameKey];

  id v6 = v8;
  if (v5)
  {
    id v7 = [v8 objectForKey:v4];
    if ([v7 isEqualToString:SUICPPTTestNameSiriScrollTeamRoster]) {
      [(SRSiriViewController *)self _runScrollRosterTestWithOptions:v8];
    }

    id v6 = v8;
  }
}

- (void)_runScrollRosterTestWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)SAUIAddViews);
  id v6 = [objc_alloc((Class)NSData) initWithBase64EncodedString:&cfstr_Gv8ccagsxwjcxa options:0];
  id v7 = objc_alloc((Class)SAUISnippet);
  v18[0] = @"cardData";
  v18[1] = @"$class";
  v19[0] = v6;
  v19[1] = @"Snippet";
  v18[2] = @"$group";
  v18[3] = @"aceId";
  v19[2] = @"com.apple.ace.ui.card";
  v19[3] = @"fakeId";
  id v8 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
  id v9 = [v7 initWithDictionary:v8];

  [v9 setItemType:SAAceViewUIItemTypeItemTypeResultValue];
  id v17 = v9;
  id v10 = +[NSArray arrayWithObjects:&v17 count:1];
  [v5 setViews:v10];

  [(SRSiriViewController *)self _testDidReceiveAceCommand:v5 completion:0];
  objc_initWeak(&location, self);
  dispatch_time_t v11 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005DA74;
  block[3] = &unk_100143250;
  objc_copyWeak(&v15, &location);
  id v14 = v4;
  id v12 = v4;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_startScrollingWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSiriViewController *)self _presentationViewController];
  id v12 = [v5 view];

  id v6 = [v12 snippetView];
  id v7 = [v6 contentPlatterScrollView];
  id v8 = [v4 objectForKey:SUICPPTIterationsKey];
  id v9 = [v8 intValue];

  id v10 = [v4 objectForKey:@"offset"];

  id v11 = [v10 intValue];
  [v7 _performScrollTest:SUICPPTTestNameSiriScrollTeamRoster iterations:v9 delta:v11];
}

- (void)_testDidReceiveAceCommand:(id)a3 completion:(id)a4
{
  id v6 = a3;
  [(SRSiriViewController *)self _didReceiveAceCommand:v6 completion:a4];
  id v7 = [(SRSiriViewController *)self _activeConversation];
  [v7 addItemsForAddViewsCommand:v6];

  id v8 = [(SRSiriViewController *)self _session];
  [v8 stopRecordingSpeech];
}

@end