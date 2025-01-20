@interface SRSystemAssistantExperienceViewController
- ($F24F406B2B787EFB06265DBA3D28CBD5)_bottomContentInsetComponents;
- (BOOL)_alwaysObscureBackgroundContentWhenActive;
- (BOOL)_canShowWhileLocked;
- (BOOL)_contentDiffersBetweenPlatterItems:(id)a3 andItems:(id)a4;
- (BOOL)_hidesStatusViewForInputType:(int64_t)a3;
- (BOOL)_hidesTextRequestViewForInputType:(int64_t)a3;
- (BOOL)_keyboardHasContentAtPoint:(CGPoint)a3;
- (BOOL)_resultEligibleForIntelligentLightEffects;
- (BOOL)_shouldRenderResult;
- (BOOL)_snippetViewControllerRequestsStatusViewHidden;
- (BOOL)alwaysShowRecognizedSpeech;
- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3;
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)hasPendingUpdates;
- (BOOL)isDisplayingResponse;
- (BOOL)isInAmbient;
- (BOOL)isInAmbientInteractivity;
- (BOOL)requireFinalSpeechHypothesisBeforeAppearance;
- (BOOL)siriSnippetViewControllerIsVisible:(id)a3;
- (BOOL)siriViewControllerShouldPreventUserInteraction:(id)a3;
- (CGRect)_convertRectFromKeyboard:(CGRect)a3;
- (CGRect)_keyboardFrame;
- (CGSize)activeSmartDialogSize;
- (CGSize)maxSizeForSnippet;
- (CGSize)siriViewControllerVisibleContentArea:(id)a3;
- (NSString)generativeAssistantOnboardingCommandAceID;
- (SASRequestOptions)activeRequestOptions;
- (SRCompactKeyboardState)_keyboardState;
- (SRSystemAssistantExperienceRootViewController)_rootViewController;
- (SRSystemAssistantExperienceViewController)init;
- (SRSystemAssistantExperienceViewControllerDelegate)delegate;
- (SiriSharedUICompactHostingInstrumentationSupplement)instrumentationSupplement;
- (SiriSharedUICompactResultViewController)_resultViewController;
- (SiriSharedUISAEViewState)viewState;
- (SiriSharedUISystemAssistantExperienceContainerView)containerView;
- (SiriSharedUISystemAssistantExperienceContainerView)textFieldContainerView;
- (SiriUINavigationController)_navigationController;
- (UIEdgeInsets)siriViewControllerBackgroundInsets:(id)a3;
- (UIViewController)_queuedNavigationContentViewController;
- (_TtC4Siri30SystemAssistantPromptEntryView)promptEntryView;
- (double)boundingWidthForSnippetViewController:(id)a3;
- (double)dropletContentMaximumContainerHeight;
- (double)dropletContentMaximumContainerWidth;
- (double)lastPresentationTime;
- (double)siriViewControllerExpectedWidth:(id)a3;
- (double)statusBarHeightForSiriViewController:(id)a3;
- (id)_allTranscriptItems;
- (id)_contentPlatterViewFromViewController:(id)a3;
- (id)_createBackgroundView:(id)a3;
- (id)_instrumentationManager;
- (id)_snippetFromTranscriptItems;
- (id)additionalSpeechInterpretationsForSiriViewController:(id)a3;
- (id)createNewSmartDialog;
- (id)createSuggestionsViewProvider;
- (id)filterTranscriptItemsForSAEDialogBoxContent:(id)a3;
- (id)localeForSiriViewController:(id)a3;
- (id)persistentDataStoreForSiriViewController:(id)a3;
- (id)siriViewController:(id)a3 disambiguationItemForListItem:(id)a4 disambiguationKey:(id)a5;
- (id)siriViewController:(id)a3 domainObjectForIdentifier:(id)a4;
- (id)siriViewController:(id)a3 filteredDisambiguationListItems:(id)a4;
- (id)siriViewController:(id)a3 listItemToPickInAutodisambiguationForListItems:(id)a4;
- (id)siriViewControllerEffectiveBundleForCoreLocation:(id)a3;
- (id)storedGenerativeAssistantOnboardingCompletion;
- (int)viewRegionForPresentedAceObject:(id)a3;
- (int64_t)_mapSASRequestSourceToSuggestionsInputOrigin:(int64_t)a3;
- (unint64_t)presentedResponseElements;
- (void)_addFeedbackButton;
- (void)_addSuggestionsToContainer;
- (void)_didEndEditing;
- (void)_didPressReportConcernButton;
- (void)_executePendingBlocksForTransition;
- (void)_keyboardWillHideForAmbient:(id)a3;
- (void)_keyboardWillShowForAmbient:(id)a3;
- (void)_performResultAnimation:(BOOL)a3;
- (void)_popToRootViewControllerIfNeeded;
- (void)_prepContainerForFirstSnippetPresentation;
- (void)_pushQueuedNavigationContentViewController;
- (void)_recursivelyNotifyVisibleViewControllers:(id)a3 withBlock:(id)a4;
- (void)_registerForAmbientPresentationTraitChange;
- (void)_renderResult;
- (void)_requestKeyboardWithCompletion:(id)a3;
- (void)_setBottomContentInsetComponents:(id)a3;
- (void)_setBottomContentInsetComponents:(id)a3 animatedWithDuration:(double)a4 animationOptions:(unint64_t)a5;
- (void)_setInputType:(int64_t)a3;
- (void)_setKeyboardState:(id)a3;
- (void)_setQueuedNavigationContentViewController:(id)a3;
- (void)_setSmartDialogConversationSnippetViews:(id)a3 withCompletionBlock:(id)a4;
- (void)_setSnippetViewControllerRequestsStatusViewHidden:(BOOL)a3;
- (void)_setStatusViewHidden:(BOOL)a3;
- (void)_setUpConversationContinuerSuggestions:(int64_t)a3 forRequestId:(id)a4 currentMode:(id)a5;
- (void)_setUpConversationStarterSuggestions:(int64_t)a3 isVoiceTrigger:(BOOL)a4 invocationSource:(int64_t)a5;
- (void)_setupFeedbackButton;
- (void)_siriRequestCommittedFromSuggestion:(id)a3;
- (void)_smartDialogSnippetLayoutDidUpdateForView:(id)a3;
- (void)_suggestionsWereShown;
- (void)_teardownTypeToSiriForVisualIntelligenceCameraWithUpdate;
- (void)_teardownTypeToSiriUI;
- (void)_trimFinalSmartDialogs;
- (void)_updateAmbientAvailability;
- (void)_updateBottomContentInsetKeyboardComponent;
- (void)_updateHomeAffordanceVisibility;
- (void)_updateIsInAmbientWithInteractivity:(BOOL)a3;
- (void)_updateKeyboardStateFromNotification:(id)a3;
- (void)_updateSAEViewSize;
- (void)_updateStatusViewVisibility;
- (void)_willBeginEditingOfType:(int64_t)a3;
- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4;
- (void)cancelSpeakingForSiriViewController:(id)a3;
- (void)completedOnboardingFlowWithEnablementResult:(int64_t)a3;
- (void)configureSmartDialog:(id)a3;
- (void)containerView:(id)a3 requestsDismissalWithReason:(int64_t)a4;
- (void)didBeginEditingWhenInTamaleAndCollapsed:(BOOL)a3;
- (void)didChangeText:(id)a3;
- (void)didPresentContent;
- (void)didReceiveAddViewsDialogPhaseForSuggestions:(id)a3;
- (void)didReceiveAddViewsSignalForSuggestions:(id)a3 currentMode:(id)a4;
- (void)didSetInputType:(int64_t)a3;
- (void)didSetServerUtterance:(id)a3;
- (void)didSetTranscriptItems;
- (void)dismissSiriResults;
- (void)dropletContentWillUpdateLayout:(id)a3 withUpdatedContentSize:(CGSize)a4 animated:(BOOL)a5;
- (void)endTypeToSiriLatencyStateIfNeeded;
- (void)entryViewDidSubmit:(id)a3 suggestionText:(id)a4;
- (void)entryViewDidSubmit:(id)a3 text:(id)a4;
- (void)entryViewShouldShowSuggestions:(id)a3 showSuggestions:(BOOL)a4;
- (void)handleVoiceActivationRequestWithRequestOptions:(id)a3;
- (void)keyboardIsReadyToReceiveInput;
- (void)loadView;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)performPillCollapseAnimation;
- (void)performPillMergeAndCrossfadeAnimation;
- (void)performSinglePillExpandAnimation;
- (void)prepareForTypeToSiriActivation;
- (void)presentGenerativeAssistantOnboardingFlowWithCommand:(id)a3 completion:(id)a4;
- (void)presentGenerativeAssistantOnboardingFlowWithCommandId:(id)a3 completion:(id)a4;
- (void)presentLatencyPillAnimation;
- (void)presentResultAnimation:(BOOL)a3;
- (void)promptEntryDidDismissEditMenu:(id)a3;
- (void)promptEntryViewDidLayoutSubviews:(id)a3;
- (void)promptEntryViewWillPresentEditMenu:(id)a3;
- (void)removeResponseElementsIfNeeded:(unint64_t)a3;
- (void)resignKeyboardIfNeeded;
- (void)setActiveRequestOptions:(id)a3;
- (void)setActiveSmartDialogSize:(CGSize)a3;
- (void)setBottomContentInset:(double)a3;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDockFrame:(CGRect)a3;
- (void)setDropletContainerUserUtteranceViewHeight:(double)a3;
- (void)setGenerativeAssistantOnboardingCommandAceID:(id)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setPromptEntryView:(id)a3;
- (void)setRevealRecognizedSpeech:(BOOL)a3;
- (void)setShowsSensitiveUI:(BOOL)a3;
- (void)setSmartDialogCardBlock:(id)a3;
- (void)setSmartDialogPluginBlock:(id)a3;
- (void)setStoredGenerativeAssistantOnboardingCompletion:(id)a3;
- (void)setTextFieldContainerView:(id)a3;
- (void)setTopContentInset:(double)a3 animated:(BOOL)a4;
- (void)setUpConversationStarterSuggestionsWith:(int64_t)a3;
- (void)setViewState:(id)a3;
- (void)setupTextFieldForTamale;
- (void)setupTextFieldForTextInput;
- (void)shouldBeginEditing;
- (void)siriDidActivate;
- (void)siriDidDeactivate;
- (void)siriDidStartSpeakingWithIdentifier:(id)a3;
- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4;
- (void)siriDidTapOutsideContent;
- (void)siriDidUpdateASRWithRecognition:(id)a3;
- (void)siriIsIdleAndQuiet;
- (void)siriSnippetViewController:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5;
- (void)siriSnippetViewController:(id)a3 informHostOfBackgroundView:(id)a4 isSnippetAsyncColored:(BOOL)a5;
- (void)siriSnippetViewController:(id)a3 isBackgroundColorUpdateSuccessful:(BOOL)a4;
- (void)siriSnippetViewController:(id)a3 performAceCommands:(id)a4 sashItem:(id)a5;
- (void)siriSnippetViewController:(id)a3 pushSirilandSnippets:(id)a4;
- (void)siriSnippetViewController:(id)a3 setStatusViewHidden:(BOOL)a4;
- (void)siriSnippetViewController:(id)a3 willDismissViewController:(id)a4;
- (void)siriSnippetViewController:(id)a3 willPresentViewController:(id)a4;
- (void)siriSnippetViewControllerPerformAceCommands:(id)a3;
- (void)siriSnippetViewControllerShouldPushSirilandSnippets:(id)a3;
- (void)siriSnippetViewControllerViewDidLoad:(id)a3;
- (void)siriViewController:(id)a3 openURL:(id)a4 completion:(id)a5;
- (void)siriViewController:(id)a3 performAceCommands:(id)a4;
- (void)siriViewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5;
- (void)siriViewController:(id)a3 speakText:(id)a4 completion:(id)a5;
- (void)siriViewControllerDidEndEditing:(id)a3;
- (void)siriViewControllerHeightDidChange;
- (void)siriViewControllerHeightDidChange:(id)a3;
- (void)siriViewControllerHeightDidChange:(id)a3 pinTopOfSnippet:(BOOL)a4;
- (void)siriViewControllerSetStatusViewHidden:(BOOL)a3;
- (void)siriViewControllerShouldOpenUrl:(id)a3;
- (void)siriViewControllerShouldRequestTextInputWithUtterance:(id)a3;
- (void)siriViewControllerViewDidAppear:(id)a3 isTopLevelViewController:(BOOL)a4;
- (void)siriViewControllerViewDidDisappear:(id)a3 isTopLevelViewController:(BOOL)a4;
- (void)siriViewControllerWillBeginEditing:(id)a3;
- (void)siriWillStartRequest;
- (void)smartDialogContentDidChange;
- (void)switchPresentationToTextInput;
- (void)switchPresentationToVisualIntelligenceCameraInput;
- (void)updateSpeechRecognitionHypothesisForSuggestion:(id)a3;
- (void)updateTopInset:(double)a3 animated:(BOOL)a4;
- (void)userDidReportConcern;
- (void)userDrilledIntoSnippet;
- (void)userTouchedSnippet;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willPresentOnboardingFlow;
- (void)willPresentResult;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SRSystemAssistantExperienceViewController

- (SRSystemAssistantExperienceViewController)init
{
  v46.receiver = self;
  v46.super_class = (Class)SRSystemAssistantExperienceViewController;
  v2 = [(SRSystemAssistantExperienceViewController *)&v46 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2)
  {
    v2->_animatingPillSize = 0;
    v4 = (SiriSharedUISystemAssistantExperienceContainerView *)objc_alloc_init((Class)SiriSharedUISystemAssistantExperienceContainerView);
    containerView = v3->_containerView;
    v3->_containerView = v4;

    [(SiriSharedUISystemAssistantExperienceContainerView *)v3->_containerView setDelegate:v3];
    v6 = [[SRSystemAssistantExperienceRootViewController alloc] initWithContainerView:v3->_containerView];
    rootViewController = v3->_rootViewController;
    v3->_rootViewController = v6;

    v8 = (SiriSharedUISystemAssistantExperienceContainerView *)objc_alloc_init((Class)SiriSharedUISystemAssistantExperienceContainerView);
    textFieldContainerView = v3->_textFieldContainerView;
    v3->_textFieldContainerView = v8;

    [(SiriSharedUISystemAssistantExperienceContainerView *)v3->_textFieldContainerView setDelegate:v3];
    v10 = (SiriSharedUICompactResultViewController *)objc_alloc_init((Class)SiriSharedUICompactResultViewController);
    resultViewController = v3->_resultViewController;
    v3->_resultViewController = v10;

    v12 = (SiriUINavigationController *)[objc_alloc((Class)SiriUINavigationController) initWithRootViewController:v3->_rootViewController];
    navigationController = v3->_navigationController;
    v3->_navigationController = v12;

    [(SiriUINavigationController *)v3->_navigationController setDelegate:v3];
    v14 = [(SiriUINavigationController *)v3->_navigationController view];
    [v14 recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];

    v15 = [(SiriUINavigationController *)v3->_navigationController navigationBar];
    [v15 recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];

    id v16 = objc_alloc((Class)SiriSharedUICompactHostingInstrumentationSupplement);
    v17 = [(SRSystemAssistantExperienceViewController *)v3 _instrumentationManager];
    v18 = (SiriSharedUICompactHostingInstrumentationSupplement *)[v16 initWithInstrumentationManager:v17];
    instrumentationSupplement = v3->_instrumentationSupplement;
    v3->_instrumentationSupplement = v18;

    v20 = (SiriSharedUISAEViewState *)[objc_alloc((Class)SiriSharedUISAEViewState) initWithContainerView:v3->_containerView];
    viewState = v3->_viewState;
    v3->_viewState = v20;

    [(SiriSharedUISAEViewState *)v3->_viewState setDelegate:v3];
    [(SRSystemAssistantExperienceViewController *)v3 _registerForAmbientPresentationTraitChange];
    id v22 = objc_alloc((Class)SRUIFPreferences);
    v23 = (SRUIFPreferences *)[v22 initWithSuiteName:SRUIFPreferencesDefaultDomain];
    preferences = v3->_preferences;
    v3->_preferences = v23;

    if (SiriSharedUIReducedMotionEnabled()) {
      double v25 = 1.0;
    }
    else {
      double v25 = SiriSharedUISAEContainerSpringDampingRatio;
    }
    if (SiriSharedUIReducedMotionEnabled()) {
      double v26 = 0.5;
    }
    else {
      double v26 = SiriSharedUISAEContainerSpringResponse;
    }
    uint64_t v27 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:v25 response:v26];
    defaultSpringAnimationBehavior = v3->_defaultSpringAnimationBehavior;
    v3->_defaultSpringAnimationBehavior = (UIViewSpringAnimationBehavior *)v27;

    if (SiriSharedUIReducedMotionEnabled()) {
      double v29 = 1.0;
    }
    else {
      double v29 = SiriSharedUISAEContainerPillMergeSpringDampingRatio;
    }
    if (SiriSharedUIReducedMotionEnabled()) {
      double v30 = 0.5;
    }
    else {
      double v30 = SiriSharedUISAEContainerPillMergeSpringResponse;
    }
    uint64_t v31 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:v29 response:v30];
    pillMergeSpringAnimationBehavior = v3->_pillMergeSpringAnimationBehavior;
    v3->_pillMergeSpringAnimationBehavior = (UIViewSpringAnimationBehavior *)v31;

    if (SiriSharedUIReducedMotionEnabled()) {
      double v33 = 1.0;
    }
    else {
      double v33 = SiriSharedUISAEContainerPostPillMergeSpringDampingRatio;
    }
    if (SiriSharedUIReducedMotionEnabled()) {
      double v34 = 0.5;
    }
    else {
      double v34 = SiriSharedUISAEContainerPostPillMergeSpringResponse;
    }
    uint64_t v35 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:v33 response:v34];
    postPillMergeSpringAnimationBehavior = v3->_postPillMergeSpringAnimationBehavior;
    v3->_postPillMergeSpringAnimationBehavior = (UIViewSpringAnimationBehavior *)v35;

    if (SiriSharedUIReducedMotionEnabled()) {
      double v37 = 1.0;
    }
    else {
      double v37 = SiriSharedUISAESuggestionsSpringDampingRatio;
    }
    if (SiriSharedUIReducedMotionEnabled()) {
      double v38 = 0.5;
    }
    else {
      double v38 = SiriSharedUISAESuggestionsSpringResponse;
    }
    uint64_t v39 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:v37 response:v38];
    suggestionsSpringAnimationBehavior = v3->_suggestionsSpringAnimationBehavior;
    v3->_suggestionsSpringAnimationBehavior = (UIViewSpringAnimationBehavior *)v39;

    v41 = [[SRTypeToSiriKeyboardReadinessObserver alloc] initWithDelegate:v3];
    typeToSiriKeyboardReadinessObserver = v3->_typeToSiriKeyboardReadinessObserver;
    v3->_typeToSiriKeyboardReadinessObserver = v41;

    v3->_shouldShowSuggestions = 1;
    v43 = (SiriSharedUIGenerativeAssistantOnboardingManager *)[objc_alloc((Class)SiriSharedUIGenerativeAssistantOnboardingManager) initWithDelegate:v3];
    montaraOnboardingManager = v3->_montaraOnboardingManager;
    v3->_montaraOnboardingManager = v43;

    v3->_inTapToEdit = 0;
  }
  return v3;
}

- (void)_executePendingBlocksForTransition
{
  v3 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  [v3 updateUserUtteranceVisibilityIfNeeded];

  if (self->serverUtteranceUpdateBlock)
  {
    v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[SRSystemAssistantExperienceViewController _executePendingBlocksForTransition]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #smartdialog performing server utterance update", (uint8_t *)&v12, 0xCu);
    }
    (*((void (**)(void))self->serverUtteranceUpdateBlock + 2))();
    id serverUtteranceUpdateBlock = self->serverUtteranceUpdateBlock;
    self->id serverUtteranceUpdateBlock = 0;
  }
  if (self->smartDialogCardBlock)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[SRSystemAssistantExperienceViewController _executePendingBlocksForTransition]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #smartdialog performing smart dialog card update", (uint8_t *)&v12, 0xCu);
    }
    (*((void (**)(void))self->smartDialogCardBlock + 2))();
    id smartDialogCardBlock = self->smartDialogCardBlock;
    self->id smartDialogCardBlock = 0;
  }
  if (self->smartDialogPluginBlock)
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[SRSystemAssistantExperienceViewController _executePendingBlocksForTransition]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #smartdialog performing smart dialog plugin update", (uint8_t *)&v12, 0xCu);
    }
    (*((void (**)(void))self->smartDialogPluginBlock + 2))();
    id smartDialogPluginBlock = self->smartDialogPluginBlock;
    self->id smartDialogPluginBlock = 0;
  }
  if (self->snippetUpdateBlock)
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136315138;
      v13 = "-[SRSystemAssistantExperienceViewController _executePendingBlocksForTransition]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #smartdialog performing snippet update", (uint8_t *)&v12, 0xCu);
    }
    (*((void (**)(void))self->snippetUpdateBlock + 2))();
    id snippetUpdateBlock = self->snippetUpdateBlock;
    self->id snippetUpdateBlock = 0;
  }
}

- (void)updateTopInset:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_topInset = a3;
  if ((char *)[UIApp activeInterfaceOrientation] - 1 <= (char *)1)
  {
    v7 = [(SRSystemAssistantExperienceViewController *)self view];
    v8 = [v7 window];

    [v8 safeAreaInsets];
    BOOL v10 = v9 < a3;
    double v11 = a3 - v9 + 10.0;
    if (!v10) {
      double v11 = 0.0;
    }
    if (!v8) {
      double v11 = 0.0;
    }
    if (self->_isDrilledIntoSnippet) {
      double v12 = 0.0;
    }
    else {
      double v12 = v11;
    }
    v14[1] = 3221225472;
    double v13 = 0.3;
    v14[0] = _NSConcreteStackBlock;
    v14[2] = sub_100008A90;
    v14[3] = &unk_100142DC0;
    if (!v4) {
      double v13 = 0.0;
    }
    v14[4] = self;
    *(double *)&v14[5] = v12;
    +[UIView _animateWithDuration:delay:options:animations:start:completion:](UIView, "_animateWithDuration:delay:options:animations:start:completion:", 196608, v14, 0, 0, v13);
  }
}

- (void)loadView
{
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[SRSystemAssistantExperienceViewController loadView]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  BOOL v4 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
  v5 = [v4 view];
  [(SRSystemAssistantExperienceViewController *)self addChildViewController:v4];
  id v6 = objc_alloc_init((Class)AFUITouchPassThroughView);
  v7 = +[UIColor clearColor];
  [v6 setBackgroundColor:v7];

  [v6 setOpaque:0];
  [v6 setAutoresizingMask:18];
  [v6 bounds];
  [v5 setFrame:];
  [v5 setAutoresizingMask:18];
  [v6 addSubview:v5];
  [(SiriSharedUISystemAssistantExperienceContainerView *)self->_textFieldContainerView setAutoresizingMask:18];
  v8 = [(SiriSharedUISystemAssistantExperienceContainerView *)self->_textFieldContainerView layer];
  [v8 setHitTestsAsOpaque:0];

  [(SiriSharedUISystemAssistantExperienceContainerView *)self->_textFieldContainerView setOpaque:0];
  [v6 addSubview:self->_textFieldContainerView];
  if (!_os_feature_enabled_impl()) {
    goto LABEL_8;
  }
  double v9 = [(SRSystemAssistantExperienceViewController *)self activeRequestOptions];
  if ([v9 requestSource] != (id)47)
  {

    goto LABEL_8;
  }
  BOOL v10 = +[SASSystemState sharedSystemState];
  unsigned __int8 v11 = [v10 isInActiveCall];

  if ((v11 & 1) == 0)
  {
LABEL_8:
    double v13 = +[UIImage _systemImageNamed:@"microphone"];
    objc_initWeak((id *)buf, self);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100008EF8;
    v20[3] = &unk_100142DE8;
    objc_copyWeak(&v21, (id *)buf);
    double v12 = +[UIAction actionWithTitle:@"microphone" image:v13 identifier:0 handler:v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);

    goto LABEL_9;
  }
  double v12 = 0;
LABEL_9:
  v14 = -[SystemAssistantPromptEntryView initWithFrame:dictationReplacementAction:]([_TtC4Siri30SystemAssistantPromptEntryView alloc], "initWithFrame:dictationReplacementAction:", v12, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(SRSystemAssistantExperienceViewController *)self setPromptEntryView:v14];

  v15 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
  [v15 setDelegate:self];

  [v4 didMoveToParentViewController:self];
  id v16 = (SiriSharedUIFeedbackController *)[objc_alloc((Class)SiriSharedUIFeedbackController) initWithNibName:0 bundle:0];
  feedbackController = self->_feedbackController;
  self->_feedbackController = v16;

  v18 = [(SiriSharedUIFeedbackController *)self->_feedbackController view];
  v19 = [v18 layer];
  [v19 setAllowsHitTesting:0];

  [(SRSystemAssistantExperienceViewController *)self setView:v6];
}

- (void)_didPressReportConcernButton
{
  v3 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v3 cancelRequestForViewController:self];

  BOOL v4 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v4 siriSAEViewCOntrollerRequestStopAttending:self];

  id v5 = objc_alloc_init((Class)SiriSharedUIFeedbackModel);
  id v6 = [(SRSystemAssistantExperienceViewController *)self delegate];
  v7 = [v6 feedbackFormForCurrentRequest];

  v8 = [v7 domain];

  if (v8)
  {
    double v9 = [v7 domain];
    unsigned __int8 v10 = [v9 isEqualToString:SAUIFeedbackFormDomainDeviceExpertValue];

    if (v10)
    {
      uint64_t v11 = 1;
    }
    else
    {
      double v12 = [v7 domain];
      unsigned __int8 v13 = [v12 isEqualToString:SAUIFeedbackFormDomainSiriWithChatGPTValue];

      if (v13)
      {
        uint64_t v11 = 3;
      }
      else
      {
        v14 = [v7 domain];
        unsigned int v15 = [v14 isEqualToString:SAUIFeedbackFormDomainSiriPQAValue];

        if (v15) {
          uint64_t v11 = 2;
        }
        else {
          uint64_t v11 = 0;
        }
      }
    }
    [v5 setFeedbackDomain:v11];
  }
  id v16 = [v7 input];

  if (v16)
  {
    v17 = [v7 input];
    [v5 setUserInput:v17];
  }
  else
  {
    v17 = [(SiriSharedUISAEViewState *)self->_viewState userUtterance];
    v18 = [v17 speech];
    v19 = [v18 userUtterance];
    v20 = [v19 bestTextInterpretation];
    [v5 setUserInput:v20];
  }
  id v21 = [v7 output];

  if (v21)
  {
    id v22 = [v7 output];
    [v5 setSiriDialog:v22];
  }
  else
  {
    v42 = v7;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    v23 = [(SiriSharedUISAEViewState *)self->_viewState serverUtterances];
    id v24 = [v23 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v44;
      uint64_t v27 = &stru_1001463E0;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v44 != v26) {
            objc_enumerationMutation(v23);
          }
          double v29 = [*(id *)(*((void *)&v43 + 1) + 8 * i) text];
          double v30 = [(__CFString *)v27 stringByAppendingString:v29];

          uint64_t v27 = [v30 stringByAppendingString:@"\n"];
        }
        id v25 = [v23 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v25);
    }
    else
    {
      uint64_t v27 = &stru_1001463E0;
    }

    [v5 setSiriDialog:v27];
    v7 = v42;
  }
  uint64_t v31 = [v7 subFeature];
  [v5 setSubFeature:v31];

  v32 = [(SRSystemAssistantExperienceViewController *)self view];
  double v33 = [(SRSystemAssistantExperienceViewController *)self view];
  [v33 bounds];
  [v32 _imageFromRect:];
  double v34 = (UIImage *)objc_claimAutoreleasedReturnValue();

  uint64_t v35 = UIImageJPEGRepresentation(v34, 1.0);
  [v5 setImageRepresentationOfSnippet:v35];

  v36 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    double v37 = v36;
    double v38 = [v5 userInput];
    uint64_t v39 = [v5 siriDialog];
    *(_DWORD *)buf = 136315650;
    v48 = "-[SRSystemAssistantExperienceViewController _didPressReportConcernButton]";
    __int16 v49 = 2112;
    v50 = v38;
    __int16 v51 = 2112;
    v52 = v39;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%s #feedback - donating feedback with input: %@, output: %@", buf, 0x20u);
  }
  [(SRSystemAssistantExperienceViewController *)self addChildViewController:self->_feedbackController];
  v40 = [(SRSystemAssistantExperienceViewController *)self view];
  v41 = [(SiriSharedUIFeedbackController *)self->_feedbackController view];
  [v40 insertSubview:v41 atIndex:0];

  [(SiriSharedUIFeedbackController *)self->_feedbackController didMoveToParentViewController:self];
  [(SiriSharedUIFeedbackController *)self->_feedbackController userDidReportConcernWithModel:v5];
}

- (void)userDidReportConcern
{
}

- (id)createNewSmartDialog
{
  id v3 = [objc_alloc((Class)SiriSharedUISmartDialogView) initWithResultView:0];
  [(SRSystemAssistantExperienceViewController *)self configureSmartDialog:v3];

  return v3;
}

- (void)configureSmartDialog:(id)a3
{
  id v4 = a3;
  [v4 setInteractionDelegate:self];
  [v4 setDropletContainerDelegate:self];
  id v5 = [v4 layer];
  [v5 setAllowsGroupOpacity:0];

  [v4 setClipsToBounds:1];
  [v4 setPopoverViewController:self];

  self->_resultPresentedInActiveSmartDialog = 0;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SRSystemAssistantExperienceViewController;
  [(SRSystemAssistantExperienceViewController *)&v8 viewDidLoad];
  id v3 = [(SRSystemAssistantExperienceViewController *)self view];
  [v3 recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];

  id v4 = objc_alloc((Class)SiriUIMultiNavigationTransitionController);
  id v5 = objc_alloc_init(SRSystemAssistantExperienceNavigationTransitionController);
  id v6 = [v4 initWithPrimaryTransitionController:v5];

  v7 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
  [v7 setTransitionController:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SRSystemAssistantExperienceViewController;
  [(SRSystemAssistantExperienceViewController *)&v14 viewWillAppear:a3];
  id v4 = +[NSNotificationCenter defaultCenter];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = sub_1000097A0();
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addObserver:self selector:@selector(_updateKeyboardStateFromNotification:) name:*((void *)(*((void *)&v10 + 1) + 8 * i)) object:0 v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }

  [v4 addObserver:self selector:"_keyboardWillShowForAmbient:" name:UIKeyboardWillShowNotification object:0];
  [v4 addObserver:self selector:"_keyboardWillHideForAmbient:" name:UIKeyboardWillHideNotification object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SRSystemAssistantExperienceViewController;
  [(SRSystemAssistantExperienceViewController *)&v7 viewDidAppear:a3];
  id v4 = +[NSProcessInfo processInfo];
  [v4 systemUptime];
  self->_presentationTime = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained viewControllerDidPresentUserInterface:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SRSystemAssistantExperienceViewController;
  [(SRSystemAssistantExperienceViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v4 viewControllerViewWillDisappear:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v31.receiver = self;
  v31.super_class = (Class)SRSystemAssistantExperienceViewController;
  [(SRSystemAssistantExperienceViewController *)&v31 viewDidDisappear:a3];
  id v4 = [(SiriSharedUISAEViewState *)self->_viewState userUtterance];
  objc_super v5 = [v4 speech];

  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_super v7 = [(SiriSharedUISAEViewState *)self->_viewState userUtterance];
    uint64_t v8 = [v7 speech];
    double v9 = [v8 backingAceObject];
    [WeakRetained saeViewController:self viewDidDisappearForAceObject:v9];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v10 = [(SiriSharedUISAEViewState *)self->_viewState serverUtterances];
  id v11 = [v10 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      objc_super v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v14);
        id v16 = objc_loadWeakRetained((id *)&self->_delegate);
        [v16 saeViewController:self viewDidDisappearForAceObject:v15];

        objc_super v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v12);
  }

  v17 = +[NSNotificationCenter defaultCenter];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v18 = sub_1000097A0();
  id v19 = [v18 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v24;
    do
    {
      id v22 = 0;
      do
      {
        if (*(void *)v24 != v21) {
          objc_enumerationMutation(v18);
        }
        [v17 removeObserver:self name:*(void *)(*((void *)&v23 + 1) + 8 * (void)v22) object:0 v23];
        id v22 = (char *)v22 + 1;
      }
      while (v20 != v22);
      id v20 = [v18 countByEnumeratingWithState:&v23 objects:v32 count:16];
    }
    while (v20);
  }

  [v17 removeObserver:self name:UIKeyboardWillShowNotification object:0];
  [v17 removeObserver:self name:UIKeyboardWillHideNotification object:0];
  [(SRSystemAssistantExperienceViewController *)self _setKeyboardState:0];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SRSystemAssistantExperienceViewController;
  [(SRSystemAssistantExperienceViewController *)&v3 viewWillLayoutSubviews];
  [(SRSystemAssistantExperienceViewController *)self _updateSAEViewSize];
}

- (void)_updateSAEViewSize
{
  objc_super v3 = [(SRSystemAssistantExperienceViewController *)self view];
  long long v45 = [v3 window];

  if (SiriSharedUIDeviceIsPad())
  {
    id v4 = v45;
  }
  else
  {
    int IsMac = SiriSharedUIDeviceIsMac();
    id v4 = v45;
    if (!IsMac) {
      goto LABEL_14;
    }
  }
  if (v4)
  {
    [v4 bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    objc_super v14 = [v45 windowScene];
    [v14 interfaceOrientation];
    SiriSharedUICompactSlideOverContentSpacingOnPad();
    double v16 = v15;
    double v18 = v17;

    if (SiriUIDeviceIsPad())
    {
      int IsLargeFormatPad = SiriUIDeviceIsLargeFormatPad();
      id v20 = (double *)&SiriSharedUISAEContentMaxWidthPadLarge;
      if (!IsLargeFormatPad) {
        id v20 = (double *)&SiriSharedUISAEContentMaxWidthPadRegular;
      }
      double v21 = *v20;
      v47.origin.x = v7;
      v47.origin.y = v9;
      v47.size.width = v11;
      v47.size.height = v13;
      double Height = CGRectGetHeight(v47);
      v48.origin.x = v7;
      v48.origin.y = v9;
      v48.size.width = v11;
      v48.size.height = v13;
      CGFloat v23 = (CGRectGetWidth(v48) - v21) * 0.5;
      long long v24 = [(SRSystemAssistantExperienceViewController *)self view];
      [v24 setFrame:v23, 0.0, v21, Height];

      long long v25 = [(SRSystemAssistantExperienceViewController *)self view];
      [v25 safeAreaInsets];
      double v27 = v26 + 16.0;

      long long v28 = [(SRSystemAssistantExperienceViewController *)self view];
      [v28 safeAreaInsets];
      double v30 = v29 + 20.0;

      v49.origin.y = 0.0;
      v49.origin.x = v23;
      v49.size.width = v21;
      v49.size.height = Height;
      double Width = CGRectGetWidth(v49);
      v50.origin.y = 0.0;
      v50.origin.x = v23;
      v50.size.width = v21;
      v50.size.height = Height;
      CGFloat v32 = CGRectGetHeight(v50) - v27 - v30;
      double v33 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
      double v34 = [v33 view];
      [v34 setFrame:CGRectMake(0.0, v27, Width, v32)];
    }
    else
    {
      double v35 = v16 + v18 + SiriSharedUICompactLeftPaddingForShadowOutsetsiPad;
      int IsRTL = SiriLanguageIsRTL();
      double v33 = [(SRSystemAssistantExperienceViewController *)self view];
      CGFloat v37 = v7;
      CGFloat v38 = v9;
      CGFloat v39 = v11;
      CGFloat v40 = v13;
      if (IsRTL)
      {
        double v41 = CGRectGetHeight(*(CGRect *)&v37);
        double v42 = 0.0;
        long long v43 = v33;
      }
      else
      {
        CGFloat v44 = CGRectGetWidth(*(CGRect *)&v37) - v35;
        v51.origin.x = v7;
        v51.origin.y = v9;
        v51.size.width = v11;
        v51.size.height = v13;
        double v41 = CGRectGetHeight(v51);
        long long v43 = v33;
        double v42 = v44;
      }
      [v43 setFrame:v42, 0.0, v35, v41];
    }
  }
LABEL_14:

  _objc_release_x1();
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SRSystemAssistantExperienceViewController;
  id v6 = a3;
  [(SRSystemAssistantExperienceViewController *)&v11 willTransitionToTraitCollection:v6 withTransitionCoordinator:a4];
  id v7 = [v6 verticalSizeClass];

  if (v7 == (id)1)
  {
    double v8 = [(SRSystemAssistantExperienceViewController *)self containerView];
    unsigned int v9 = [v8 isDisplayingResponse];

    if (v9)
    {
      double v10 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
      [v10 resignKeyboard];
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v7.receiver = self;
  v7.super_class = (Class)SRSystemAssistantExperienceViewController;
  -[SRSystemAssistantExperienceViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, "viewWillTransitionToSize:withTransitionCoordinator:", a4);
  if (height <= width) {
    [(SRSystemAssistantExperienceViewController *)self _updateAmbientAvailability];
  }
  else {
    [(SRSystemAssistantExperienceViewController *)self setIsInAmbient:0];
  }
}

- (void)_setupFeedbackButton
{
  if (!self->_feedbackButton)
  {
    objc_super v3 = +[SRFeedbackButton buttonWithType:1];
    feedbackButton = self->_feedbackButton;
    self->_feedbackButton = v3;

    [(SRFeedbackButton *)self->_feedbackButton addTarget:self action:"_didPressReportConcernButton" forControlEvents:64];
    id v5 = [(SRSystemAssistantExperienceViewController *)self containerView];
    [v5 setBottomFloatingButton:self->_feedbackButton];
  }
}

- (id)_snippetFromTranscriptItems
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v2 = [(SiriSharedUISAEViewState *)self->_viewState activeConversationTranscriptItems];
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_super v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        double v8 = [v7 viewController];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

LABEL_13:
          double v12 = [v7 viewController];
          objc_super v11 = [v12 view];

          goto LABEL_14;
        }
        unsigned int v9 = [v7 viewController];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          goto LABEL_13;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
      objc_super v11 = 0;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    objc_super v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)_createBackgroundView:(id)a3
{
  id v4 = objc_alloc_init((Class)SiriSharedUISmartDialogBackgroundView);
  if ([(SiriSharedUISAEViewState *)self->_viewState hasSmartDialogSnippet])
  {
    uint64_t v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 136315138;
      double v33 = "-[SRSystemAssistantExperienceViewController _createBackgroundView:]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #background: snippet insecting in SmartDialogContainer, use GM material for background", (uint8_t *)&v32, 0xCu);
    }
    id v6 = [(SiriSharedUISystemAssistantExperienceContainerView *)self->_containerView createDefaultMaterialBackgroundView];
    objc_super v7 = [v4 contentView];
    [v7 addSubview:v6];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    double v8 = [v6 leadingAnchor];
    unsigned int v9 = [v4 contentView];
    double v10 = [v9 leadingAnchor];
    objc_super v11 = [v8 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    double v12 = [v6 bottomAnchor];
    CGFloat v13 = [v4 contentView];
    long long v14 = [v13 bottomAnchor];
    long long v15 = [v12 constraintEqualToAnchor:v14];
    [v15 setActive:1];

    long long v16 = [v6 trailingAnchor];
    long long v17 = [v4 contentView];
    double v18 = [v17 trailingAnchor];
    id v19 = [v16 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    id v20 = [v6 topAnchor];
    double v21 = [v4 contentView];
    id v22 = [v21 topAnchor];
    CGFloat v23 = [v20 constraintEqualToAnchor:v22];
    [v23 setActive:1];
  }
  else
  {
    long long v24 = [(SRSystemAssistantExperienceViewController *)self view];
    long long v25 = [v24 traitCollection];
    id v26 = [v25 userInterfaceStyle];

    if (v26 == (id)1)
    {
      double v27 = +[UIBlurEffect effectWithStyle:13];
      [v4 setEffect:v27];

      long long v28 = AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v32 = 136315138;
      double v33 = "-[SRSystemAssistantExperienceViewController _createBackgroundView:]";
      double v29 = "%s #background: set light material";
    }
    else
    {
      double v30 = +[UIBlurEffect effectWithStyle:18];
      [v4 setEffect:v30];

      long long v28 = AFSiriLogContextConnection;
      if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
      int v32 = 136315138;
      double v33 = "-[SRSystemAssistantExperienceViewController _createBackgroundView:]";
      double v29 = "%s #background: set dark material";
    }
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&v32, 0xCu);
  }
LABEL_11:

  return v4;
}

- (BOOL)requireFinalSpeechHypothesisBeforeAppearance
{
  return !self->_isInAmbient;
}

- (void)setRevealRecognizedSpeech:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  [v4 setRevealRecognizedSpeech:v3];
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);

  [(SRSystemAssistantExperienceViewController *)self _updateStatusViewVisibility];
}

- (void)updateSpeechRecognitionHypothesisForSuggestion:(id)a3
{
  viewState = self->_viewState;
  id v4 = a3;
  id v5 = [(SiriSharedUISAEViewState *)viewState activeSmartDialogView];
  [v5 setSpeechRecognitionHypothesisForSuggestion:v4];
}

- (void)_setSmartDialogConversationSnippetViews:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    double v8 = [(SRSystemAssistantExperienceViewController *)self _snippetFromTranscriptItems];
    if (v8)
    {
      unsigned int v9 = [(SRSystemAssistantExperienceViewController *)self _createBackgroundView:v8];
      double v10 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
      [v10 setSnippetBackgroundView:v9];
    }
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000A88C;
    v13[3] = &unk_100142E10;
    objc_copyWeak(&v16, &location);
    id v14 = v6;
    id v15 = v7;
    objc_super v11 = objc_retainBlock(v13);
    id snippetUpdateBlock = self->snippetUpdateBlock;
    self->id snippetUpdateBlock = v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)endTypeToSiriLatencyStateIfNeeded
{
  if ([(SiriSharedUISAEViewState *)self->_viewState inputType] == (id)1)
  {
    BOOL v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[SRSystemAssistantExperienceViewController endTypeToSiriLatencyStateIfNeeded]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Stopping type-to-Siri latency animation", (uint8_t *)&v4, 0xCu);
    }
    [(SystemAssistantPromptEntryView *)self->_promptEntryView stopLatencyAnimationIfNeeded];
  }
}

- (void)resignKeyboardIfNeeded
{
  id v3 = [(SiriSharedUISAEViewState *)self->_viewState inputType];
  int v4 = [(SRSystemAssistantExperienceViewController *)self traitCollection];
  id v5 = [v4 verticalSizeClass];

  if (v3 == (id)1 && v5 == (id)1)
  {
    id v7 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
    [v7 resignKeyboard];
  }
}

- (void)presentResultAnimation:(BOOL)a3
{
  id v5 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  uint64_t v6 = [v5 superview];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(SiriSharedUISAEViewState *)self->_viewState inputType];

    if (v8 != (id)1) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000AC10;
  v11[3] = &unk_100142E38;
  objc_copyWeak(&v12, &location);
  BOOL v13 = a3;
  unsigned int v9 = objc_retainBlock(v11);
  id renderResultBlock = self->renderResultBlock;
  self->id renderResultBlock = v9;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
LABEL_6:
  [(SRSystemAssistantExperienceViewController *)self _executePendingBlocksForTransition];
}

- (void)_renderResult
{
  int v4 = (void (**)(void))objc_retainBlock(self->renderResultBlock);
  id renderResultBlock = self->renderResultBlock;
  self->id renderResultBlock = 0;

  v4[2]();
}

- (BOOL)_shouldRenderResult
{
  if (self->_activeSmartDialogSize.height <= 0.0 || !self->renderResultBlock) {
    return 0;
  }
  if (![(SiriSharedUISAEViewState *)self->_viewState upcomingResultHasSnippet]) {
    return 1;
  }
  id v3 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  int v4 = [v3 conversationSnippetViews];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (void)_prepContainerForFirstSnippetPresentation
{
  id v3 = [(SRSystemAssistantExperienceViewController *)self containerView];
  [v3 setIsFirstSnippet:1];

  int v4 = [(SRSystemAssistantExperienceViewController *)self containerView];
  BOOL v5 = [v4 blurrableView];
  [v5 setAlpha:0.0];

  uint64_t v6 = +[UIScreen mainScreen];
  [v6 bounds];
  double v8 = v7 * 0.5;
  unsigned int v9 = [(SRSystemAssistantExperienceViewController *)self containerView];
  [v9 frame];
  double v11 = v10;
  id v12 = [(SRSystemAssistantExperienceViewController *)self containerView];
  [v12 frame];
  double v14 = v13;
  id v15 = [(SRSystemAssistantExperienceViewController *)self containerView];
  [v15 setFrame:0.0, v8, v11, v14];

  id v16 = [(SRSystemAssistantExperienceViewController *)self containerView];
  [v16 performAnimatedBlur:0 withDuration:0.6];
}

- (void)_performResultAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  [(SiriSharedUISAEViewState *)self->_viewState setSmartDialogAnimationInProgress:1];
  self->_resultPresentedInActiveSmartDialog = 1;
  if (v3 && (SiriSharedUIReducedMotionEnabled() & 1) == 0) {
    [(SRSystemAssistantExperienceViewController *)self _prepContainerForFirstSnippetPresentation];
  }
  BOOL v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v21 = "-[SRSystemAssistantExperienceViewController _performResultAnimation:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #droplet presenting result with no latency", buf, 0xCu);
  }
  uint64_t v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat width = self->_activeSmartDialogSize.width;
    CGFloat height = self->_activeSmartDialogSize.height;
    unsigned int v9 = v6;
    v24.CGFloat width = width;
    v24.CGFloat height = height;
    double v10 = NSStringFromSize(v24);
    *(_DWORD *)buf = 136315394;
    double v21 = "-[SRSystemAssistantExperienceViewController _performResultAnimation:]";
    __int16 v22 = 2112;
    CGFloat v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #droplet present snippet now with size:%@!", buf, 0x16u);
  }
  BOOL v11 = [(SRSystemAssistantExperienceViewController *)self _resultEligibleForIntelligentLightEffects];
  id v12 = [(SRSystemAssistantExperienceViewController *)self containerView];
  double v13 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  [v12 setResultWithResultView:v13 resultSize:v11 eligibleForLightEffects:self->_activeSmartDialogSize.width self->_activeSmartDialogSize.height];

  [(SiriSharedUISAEViewState *)self->_viewState setSmartDialogAnimationInProgress:1];
  if (SiriSharedUIReducedMotionEnabled())
  {
    double v14 = [(SRSystemAssistantExperienceViewController *)self containerView];
    LODWORD(v15) = 1.0;
    [v14 reduceMotionCarouselWithDuration:v3 isFirstSnippet:v15];
  }
  if (v3) {
    int64_t v16 = 0;
  }
  else {
    int64_t v16 = 100000000;
  }
  dispatch_time_t v17 = dispatch_time(0, v16);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000B140;
  v18[3] = &unk_100142E60;
  v18[4] = self;
  BOOL v19 = v3;
  dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, v18);
}

- (BOOL)_resultEligibleForIntelligentLightEffects
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(SiriSharedUISAEViewState *)self->_viewState serverUtterances];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!+[SiriSharedUIUtilities utteranceViewEligibleForLightEffects:*(void *)(*((void *)&v9 + 1) + 8 * i)])
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (void)performSinglePillExpandAnimation
{
  [(SiriSharedUISAEViewState *)self->_viewState setSmartDialogAnimationInProgress:1];
  self->_resultPresentedInActiveSmartDialog = 1;
  id v3 = [(SRSystemAssistantExperienceViewController *)self containerView];
  id v4 = [v3 resultContentView];

  if (SiriSharedUIReducedMotionEnabled())
  {
    uint64_t v5 = [(SRSystemAssistantExperienceViewController *)self containerView];
    double v6 = SiriSharedUIMitosisDuration * 1.5;
    *(float *)&double v6 = SiriSharedUIMitosisDuration * 1.5;
    [v5 reduceMotionCarouselWithDuration:0 isFirstSnippet:v6];
  }
  BOOL v7 = v4 == 0;
  if (SiriSharedUIReducedMotionEnabled()) {
    int64_t v8 = 100000000;
  }
  else {
    int64_t v8 = 0;
  }
  dispatch_time_t v9 = dispatch_time(0, v8);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000B6C0;
  v10[3] = &unk_100142E60;
  v10[4] = self;
  BOOL v11 = v7;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, v10);
}

- (void)performPillCollapseAnimation
{
  id v3 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  [(SRSystemAssistantExperienceViewController *)self dropletContentMaximumContainerWidth];
  double v5 = v4;
  [(SRSystemAssistantExperienceViewController *)self dropletContentMaximumContainerHeight];
  [v3 sizeThatFits:v5, v6];
  double v8 = v7;
  double v10 = v9;

  self->_resultPresentedInActiveSmartDialog = 0;
  BOOL v11 = [(SiriSharedUISAEViewState *)self->_viewState finalAndDisplayedSmartDialogs];
  [v11 removeAllObjects];

  long long v12 = [(SRSystemAssistantExperienceViewController *)self containerView];
  [v12 cleanupResultTransitionIfNeeded];

  double v13 = [(SRSystemAssistantExperienceViewController *)self containerView];
  double v14 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  [v13 setCollapseLoadingWith:v14 collapseLoadingSize:v8 v10];

  defaultSpringAnimationBehavior = self->_defaultSpringAnimationBehavior;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000BC40;
  v17[3] = &unk_100142E88;
  v17[4] = self;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000BC84;
  v16[3] = &unk_100142ED8;
  v16[4] = self;
  +[UIView _animateUsingSpringBehavior:defaultSpringAnimationBehavior tracking:0 animations:v17 completion:v16];
}

- (void)_addFeedbackButton
{
  id v3 = [(SRSystemAssistantExperienceViewController *)self delegate];
  unsigned __int8 v4 = [v3 isPresentingVisualIntelligenceCamera];

  if ((v4 & 1) == 0
    && +[SiriSharedUIUtilities reportConcernButtonEnabled])
  {
    [(SRSystemAssistantExperienceViewController *)self _setupFeedbackButton];
  }
}

- (void)performPillMergeAndCrossfadeAnimation
{
  [(SiriSharedUISAEViewState *)self->_viewState setSmartDialogAnimationInProgress:1];
  id v3 = [(SRSystemAssistantExperienceViewController *)self containerView];
  [v3 setTransitionLoadingToResultWithResultSize:self->_activeSmartDialogSize.width, self->_activeSmartDialogSize.height];

  int v4 = SiriSharedUIReducedMotionEnabled();
  double v5 = [(SRSystemAssistantExperienceViewController *)self containerView];
  double v6 = v5;
  double v7 = SiriSharedUIMitosisDuration;
  *(float *)&double v8 = SiriSharedUIMitosisDuration;
  if (v4) {
    [v5 reduceMotionPillMergeWithDuration:v8];
  }
  else {
    [v5 mitoseWithDuration:v8];
  }

  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v7 * 0.75 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BEFC;
  block[3] = &unk_100142E88;
  block[4] = self;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(v7 * 0.85 * 1000000000.0));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C080;
  v11[3] = &unk_100142E88;
  void v11[4] = self;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);
}

- (void)_trimFinalSmartDialogs
{
  id v3 = [(SiriSharedUISAEViewState *)self->_viewState finalAndDisplayedSmartDialogs];
  id v4 = [v3 count];

  if ((unint64_t)v4 >= 2)
  {
    id v5 = [(SiriSharedUISAEViewState *)self->_viewState finalAndDisplayedSmartDialogs];
    [v5 removeObjectAtIndex:0];
  }
}

- (void)presentLatencyPillAnimation
{
  [(SRSystemAssistantExperienceViewController *)self _popToRootViewControllerIfNeeded];
  id v3 = [(SRSystemAssistantExperienceViewController *)self containerView];
  id v4 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  [v3 setVoiceLoading:v4];

  id v5 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
  [v5 stopLatencyAnimationIfNeeded];

  if (SiriSharedUIReducedMotionEnabled())
  {
    id v6 = [(SRSystemAssistantExperienceViewController *)self containerView];
    [v6 transitionVoiceLoadingToLoading];
  }
  else
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000C5FC;
    v7[3] = &unk_100142E88;
    v7[4] = self;
    +[UIView _performWithoutRetargetingAnimations:v7];
  }
}

- (void)_popToRootViewControllerIfNeeded
{
  if (self->_isDrilledIntoSnippet)
  {
    id v3 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
    [v3 setPopToRootViewController:1];

    id v4 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
    id v5 = [v4 popToRootViewControllerAnimated:1];

    self->_isDrilledIntoSnippet = 0;
  }
}

- (void)removeResponseElementsIfNeeded:(unint64_t)a3
{
  id v5 = [(SiriSharedUISAEViewState *)self->_viewState finalAndDisplayedSmartDialogs];
  [v5 removeAllObjects];

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_10000C8B8;
  v9[4] = sub_10000C8C8;
  id v10 = 0;
  defaultSpringAnimationBehavior = self->_defaultSpringAnimationBehavior;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000C8D0;
  v8[3] = &unk_100142F00;
  v8[4] = self;
  v8[5] = v9;
  v8[6] = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000C93C;
  v7[3] = &unk_100142F28;
  v7[4] = self;
  void v7[5] = v9;
  v7[6] = a3;
  +[UIView _animateUsingSpringBehavior:defaultSpringAnimationBehavior tracking:0 animations:v8 completion:v7];
  _Block_object_dispose(v9, 8);
}

- (unint64_t)presentedResponseElements
{
  v2 = [(SRSystemAssistantExperienceViewController *)self containerView];
  id v3 = [v2 presentedResponseElements];

  return (unint64_t)v3;
}

- (void)animatedDisappearanceDidBeginWithDuration:(double)a3 reason:(int64_t)a4
{
  if ((a4 == 6 || a4 == 24) && [(SiriSharedUISAEViewState *)self->_viewState inputType] != (id)1)
  {
    id v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v13 = "-[SRSystemAssistantExperienceViewController animatedDisappearanceDidBeginWithDuration:reason:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #dismissal Performing snippet blur-out", buf, 0xCu);
    }
    double v7 = [(SRSystemAssistantExperienceViewController *)self containerView];
    [v7 performAnimatedBlur:1 withDuration:a3];
  }
  else if ([(SiriSharedUISAEViewState *)self->_viewState inputType] == (id)1)
  {
    double v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      double v13 = "-[SRSystemAssistantExperienceViewController animatedDisappearanceDidBeginWithDuration:reason:]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #dismissal Resigning keyboard", buf, 0xCu);
    }
    dispatch_time_t v9 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
    [v9 resignFirstResponder];

    suggestionsSpringAnimationBehavior = self->_suggestionsSpringAnimationBehavior;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000CC34;
    v11[3] = &unk_100142E88;
    void v11[4] = self;
    +[UIView _animateUsingSpringBehavior:suggestionsSpringAnimationBehavior tracking:0 animations:v11 completion:0];
  }
}

- (void)prepareForTypeToSiriActivation
{
  if (self->_isDrilledIntoSnippet)
  {
    id v3 = [(SRSystemAssistantExperienceViewController *)self containerView];
    [v3 restoreSubviewsFromDrillIn];

    [(SRSystemAssistantExperienceViewController *)self _popToRootViewControllerIfNeeded];
    [(SRSystemAssistantExperienceViewController *)self setupTextFieldForTextInput];
  }
}

- (BOOL)isDisplayingResponse
{
  v2 = [(SRSystemAssistantExperienceViewController *)self containerView];
  unsigned __int8 v3 = [v2 isDisplayingResponse];

  return v3;
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  if (self->_shouldAbsorbSuggestionTap)
  {
    self->_shouldAbsorbSuggestionTap = 0;
    return 1;
  }
  double y = a3.y;
  double x = a3.x;
  if ([(SiriSharedUIFeedbackController *)self->_feedbackController isProvidingFeedback])
  {
    double v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      int v49 = 136315138;
      CGRect v50 = "-[SRSystemAssistantExperienceViewController hasContentAtPoint:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #dismissal - tap during feedback session", (uint8_t *)&v49, 0xCu);
    }
    return 1;
  }
  double v8 = objc_alloc_init(SRCompactViewControllerMutableContentTesterState);
  [(SRCompactViewControllerMutableContentTesterState *)v8 setDeviceIsPad:SiriUIDeviceIsPad()];
  dispatch_time_t v9 = [(SiriUINavigationController *)self->_navigationController transitionController];
  -[SRCompactViewControllerMutableContentTesterState setNavigationStackIsPopping:](v8, "setNavigationStackIsPopping:", [v9 operation] == (id)2);

  id v10 = [(SiriUINavigationController *)self->_navigationController viewControllers];
  -[SRCompactViewControllerMutableContentTesterState setNavigationStackSize:](v8, "setNavigationStackSize:", [v10 count]);

  BOOL v11 = [(SiriUINavigationController *)self->_navigationController viewControllers];
  if ((unint64_t)[v11 count] <= 1)
  {
    unsigned __int8 v12 = [(SRCompactViewControllerMutableContentTesterState *)v8 navigationStackIsPopping];

    if ((v12 & 1) == 0) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  double v13 = [(SRSystemAssistantExperienceViewController *)self view];
  double v14 = [(SiriUINavigationController *)self->_navigationController visibleViewController];
  double v15 = [v14 view];
  [v13 convertPoint:v15 toView:x, y];
  double v17 = v16;
  double v19 = v18;

  id v20 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
  uint64_t v21 = [v20 navigationBar];
  [(id)v21 bounds];
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;

  v52.origin.double x = v23;
  v52.origin.double y = v25;
  v52.size.CGFloat width = v27;
  v52.size.CGFloat height = v29;
  v51.double x = v17;
  v51.double y = v19;
  [(SRCompactViewControllerMutableContentTesterState *)v8 setNavigationBarHasContent:CGRectContainsPoint(v52, v51)];
  double v30 = [(SiriUINavigationController *)self->_navigationController visibleViewController];
  objc_opt_class();
  LOBYTE(v21) = objc_opt_isKindOfClass();

  if (v21)
  {
    objc_super v31 = [(SiriUINavigationController *)self->_navigationController visibleViewController];
    -[v8 setMultiLevelViewHasContent:[v31 hasContentAtPoint:v17, v19]];
  }
  else
  {
    [(SRCompactViewControllerMutableContentTesterState *)v8 setMultiLevelViewHasContent:1];
  }
LABEL_13:
  -[SRCompactViewControllerMutableContentTesterState setKeyboardHasContent:](v8, "setKeyboardHasContent:", -[SRSystemAssistantExperienceViewController _keyboardHasContentAtPoint:](self, "_keyboardHasContentAtPoint:", x, y));
  int v32 = [(SRSystemAssistantExperienceViewController *)self containerView];
  double v33 = [(SRSystemAssistantExperienceViewController *)self view];
  [v33 convertPoint:v32 toView:x, y];
  double v35 = v34;
  double v37 = v36;

  CGFloat v38 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
  CGFloat v39 = [(SRSystemAssistantExperienceViewController *)self view];
  [v39 convertPoint:v38 toView:x, y];
  double v41 = v40;
  double v43 = v42;

  if (objc_msgSend(v32, "hasContentAtPoint:", v35, v37)) {
    uint64_t v44 = 1;
  }
  else {
    uint64_t v44 = [v38 hasContentAtPoint:v41, v43];
  }
  [(SRCompactViewControllerMutableContentTesterState *)v8 setCompactViewHasContent:v44];
  long long v45 = [(SRSystemAssistantExperienceViewController *)self view];
  long long v46 = [v45 window];

  if (v46) {
    -[SRCompactViewControllerMutableContentTesterState setContextMenuIsPresented:](v8, "setContextMenuIsPresented:", [v46 contextMenuIsPresented]);
  }
  CGRect v47 = objc_alloc_init(SRCompactViewControllerContentTester);
  unsigned __int8 v48 = [(SRCompactViewControllerContentTester *)v47 hasContentForState:v8];

  return v48;
}

- (CGSize)maxSizeForSnippet
{
  unsigned __int8 v3 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  [v3 maxSnippetWidth];
  double v5 = v4;

  id v6 = +[AFPreferences sharedPreferences];
  if ([v6 alwaysShowRecognizedSpeech])
  {

LABEL_4:
    double v5 = v5 + -16.0;
    goto LABEL_5;
  }
  double v7 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  unsigned int v8 = [v7 revealRecognizedSpeech];

  if (v8) {
    goto LABEL_4;
  }
LABEL_5:
  double v9 = INFINITY;
  double v10 = v5;
  result.CGFloat height = v9;
  result.CGFloat width = v10;
  return result;
}

- (void)setShowsSensitiveUI:(BOOL)a3
{
  self->_sensitiveUIEnabled = a3;
  -[SiriSharedUISystemAssistantExperienceContainerView setShowsSensitiveUI:](self->_containerView, "setShowsSensitiveUI:");
}

- (void)_setBottomContentInsetComponents:(id)a3 animatedWithDuration:(double)a4 animationOptions:(unint64_t)a5
{
  p_bottomContentInsetComponents = &self->_bottomContentInsetComponents;
  if (self->_bottomContentInsetComponents.external != a3.var0
    || self->_bottomContentInsetComponents.keyboard != a3.var1)
  {
    p_bottomContentInsetComponents->external = a3.var0;
    self->_bottomContentInsetComponents.keyboard = a3.var1;
    if (a3.var0 >= a3.var1) {
      double var0 = a3.var0;
    }
    else {
      double var0 = a3.var1;
    }
    if (a3.var1 == 0.0 && a3.var0 < 0.0) {
      double v12 = a3.var0;
    }
    else {
      double v12 = var0;
    }
    double v13 = [(SRSystemAssistantExperienceViewController *)self containerView];
    [v13 setBottomContentInset:v12];

    double v14 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
    [v14 setBottomContentInset:v12];

    double v15 = [(SRSystemAssistantExperienceViewController *)self containerView];
    [v15 setIsExternalKeyboardPresented:p_bottomContentInsetComponents->keyboard > 0.0];

    double v16 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
    [v16 textFieldHeight];
    double v18 = v17;
    double v19 = [(SRSystemAssistantExperienceViewController *)self containerView];
    [v19 setTextFieldHeight:v18];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000D394;
    v20[3] = &unk_100142E88;
    void v20[4] = self;
    +[UIView _animateWithDuration:a5 delay:v20 options:0 animations:0 start:a4 completion:0.0];
  }
}

- (void)_setBottomContentInsetComponents:(id)a3
{
}

- (void)setBottomContentInset:(double)a3
{
  [(SRSystemAssistantExperienceViewController *)self _bottomContentInsetComponents];

  [(SRSystemAssistantExperienceViewController *)self _setBottomContentInsetComponents:a3];
}

- (void)setDockFrame:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  id v6 = [(SRSystemAssistantExperienceViewController *)self view];
  [v6 frame];
  double v8 = v7;

  int IsPad = SiriUIDeviceIsPad();
  if (y <= v8)
  {
    if (!IsPad) {
      return;
    }
    double v14 = [(SRSystemAssistantExperienceViewController *)self view];
    [v14 safeAreaInsets];
    double v16 = v15 + 20.0;

    double v13 = height - v16;
  }
  else
  {
    if (!IsPad) {
      return;
    }
    double v10 = [(SRSystemAssistantExperienceViewController *)self view];
    [v10 safeAreaInsets];
    double v12 = v11 + 20.0;

    double v13 = -v12;
  }

  [(SRSystemAssistantExperienceViewController *)self setBottomContentInset:v13];
}

- (void)setTopContentInset:(double)a3 animated:(BOOL)a4
{
  if (self->_topInset != a3) {
    -[SRSystemAssistantExperienceViewController updateTopInset:animated:](self, "updateTopInset:animated:", a4);
  }
}

- (void)_updateBottomContentInsetKeyboardComponent
{
  [(SRSystemAssistantExperienceViewController *)self _bottomContentInsetComponents];
  double v4 = v3;
  id v18 = [(SRSystemAssistantExperienceViewController *)self _keyboardState];
  [v18 frameForAnimation];
  -[SRSystemAssistantExperienceViewController _convertRectFromKeyboard:](self, "_convertRectFromKeyboard:");
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  double v9 = 0.0;
  if (CGRectGetHeight(v20) != 0.0)
  {
    double v10 = [(SRSystemAssistantExperienceViewController *)self view];
    [v10 bounds];
    double v11 = CGRectGetHeight(v21);
    double v12 = [(SRSystemAssistantExperienceViewController *)self containerView];
    [v12 bounds];
    double v13 = v11 - CGRectGetHeight(v22);

    double v14 = [(SRSystemAssistantExperienceViewController *)self containerView];
    [v14 bounds];
    double v15 = CGRectGetHeight(v23);
    v24.origin.CGFloat x = x;
    v24.origin.CGFloat y = y;
    v24.size.CGFloat width = width;
    v24.size.CGFloat height = height;
    double v9 = v13 + v15 - CGRectGetMinY(v24);
  }
  double v16 = [v18 animation];
  [v16 duration];
  -[SRSystemAssistantExperienceViewController _setBottomContentInsetComponents:animatedWithDuration:animationOptions:](self, "_setBottomContentInsetComponents:animatedWithDuration:animationOptions:", [v16 options], v4, v9, v17);
}

- (void)siriDidActivate
{
  if ([(SiriSharedUISAEViewState *)self->_viewState inputType] == (id)1)
  {
    double v3 = [(SRSystemAssistantExperienceViewController *)self activeRequestOptions];
    id v4 = [v3 requestSource];

    if (v4 == (id)52)
    {
      double v5 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
      [v5 setRequestSourceIsQuickTypeTamale:1];

      [(SRSystemAssistantExperienceViewController *)self setupTextFieldForTamale];
    }
    else
    {
      [(SRSystemAssistantExperienceViewController *)self setupTextFieldForTextInput];
      id v6 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
      [v6 setRequestSourceIsQuickTypeTamale:0];
    }
  }
}

- (void)setupTextFieldForTextInput
{
  [(SRTypeToSiriKeyboardReadinessObserver *)self->_typeToSiriKeyboardReadinessObserver start];
  double v3 = [(SRSystemAssistantExperienceViewController *)self delegate];
  unsigned int v4 = [v3 isPresentingVisualIntelligenceCamera];

  if (v4)
  {
    double v5 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
    [v5 resetIsInTamaleAndCollapsed];
  }
  id v6 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
  double v7 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
  [v7 minimumTextFieldHeight];
  [v6 setTextFieldHeight:];

  double v8 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
  double v9 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
  [v8 setTextFieldWithTextFieldView:v9];

  double v10 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
  [v10 becomeFirstResponder];

  double v11 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v11 viewController:self willChangeKeyboardVisibility:1];

  double v12 = [(SRSystemAssistantExperienceViewController *)self activeRequestOptions];
  id v13 = [v12 requestSource];

  if (v13 == (id)55)
  {
    id v14 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
    [v14 setIsInGenerativeAssistantTextFollowup];
  }
}

- (void)setupTextFieldForTamale
{
  double v3 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
  unsigned int v4 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
  [v4 minimumTextFieldHeight];
  [v3 setTextFieldHeight:];

  double v5 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
  id v6 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
  [v5 setTextFieldWithTextFieldView:v6];

  double v7 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
  [v7 updateKeyboardLightEffects:0];

  id v8 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
  [v8 setIsInTamaleAndCollapsed:1];
}

- (void)setUpConversationStarterSuggestionsWith:(int64_t)a3
{
  id v5 = [(SiriSharedUISAEViewState *)self->_viewState inputType];

  [(SRSystemAssistantExperienceViewController *)self _setUpConversationStarterSuggestions:v5 isVoiceTrigger:a3 == 8 invocationSource:a3];
}

- (void)siriDidDeactivate
{
  if ([(SiriSharedUISAEViewState *)self->_viewState inputType] == (id)1)
  {
    [(SRTypeToSiriKeyboardReadinessObserver *)self->_typeToSiriKeyboardReadinessObserver stop];
    double v3 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
    [v3 resignFirstResponder];

    unsigned int v4 = [(SRSystemAssistantExperienceViewController *)self delegate];
    [v4 viewController:self willChangeKeyboardVisibility:0];
  }
  id v6 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
  id v5 = [v6 visibleViewController];
  [(SRSystemAssistantExperienceViewController *)self _recursivelyNotifyVisibleViewControllers:v5 withBlock:&stru_100142F68];
}

- (int)viewRegionForPresentedAceObject:(id)a3
{
  instrumentationSupplement = self->_instrumentationSupplement;
  viewState = self->_viewState;
  id v6 = a3;
  double v7 = [(SiriSharedUISAEViewState *)viewState activeConversationTranscriptItems];
  id v8 = [(SiriSharedUISAEViewState *)self->_viewState serverUtterances];
  LODWORD(instrumentationSupplement) = [(SiriSharedUICompactHostingInstrumentationSupplement *)instrumentationSupplement viewRegionForPresentedAceObject:v6 resultTrasncriptItems:&__NSArray0__struct conversationTranscriptItems:v7 serverUtterances:v8];

  return (int)instrumentationSupplement;
}

- (double)lastPresentationTime
{
  return self->_presentationTime;
}

- (id)_instrumentationManager
{
  return +[SRUIFInstrumentationManager sharedManager];
}

- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3
{
  id v36 = a3;
  double v37 = [v36 viewId];
  [(SiriSharedUISAEViewState *)self->_viewState activeConversationTranscriptItems];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (!v4)
  {
LABEL_14:

    if ([obj count]
      || (-[SiriSharedUISAEViewState storedConversationTranscriptItems](self->_viewState, "storedConversationTranscriptItems"), v21 = objc_claimAutoreleasedReturnValue(), id v22 = [v21 count], v21, !v22))
    {
      BOOL v16 = 0;
      double v17 = v36;
      goto LABEL_18;
    }
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    double v19 = [(SiriSharedUISAEViewState *)self->_viewState storedConversationTranscriptItems];
    id v23 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (!v23) {
      goto LABEL_34;
    }
    id v24 = v23;
    uint64_t v25 = *(void *)v40;
LABEL_22:
    uint64_t v26 = 0;
    while (1)
    {
      if (*(void *)v40 != v25) {
        objc_enumerationMutation(v19);
      }
      CGFloat v27 = *(void **)(*((void *)&v39 + 1) + 8 * v26);
      double v11 = [v27 viewController];
      double v28 = [v11 view];
      uint64_t v29 = [v28 superview];
      if (!v29) {
        goto LABEL_30;
      }
      double v30 = (void *)v29;
      objc_super v31 = [v27 viewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        break;
      }
LABEL_32:
      if (v24 == (id)++v26)
      {
        id v24 = [v19 countByEnumeratingWithState:&v39 objects:v47 count:16];
        if (!v24)
        {
LABEL_34:
          BOOL v16 = 0;
          double v17 = v36;
          goto LABEL_17;
        }
        goto LABEL_22;
      }
    }
    double v11 = [v27 viewController];
    double v28 = [v11 aceObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v33 = [v11 aceObject];
      double v34 = [v33 viewId];
      unsigned int v35 = [v34 isEqualToString:v37];

      if (v35)
      {
        double v17 = v36;
        id v18 = [v36 stateData];
        [v11 updateSharedState:v18];
        goto LABEL_16;
      }
    }
    else
    {
LABEL_30:
    }
    goto LABEL_32;
  }
  id v5 = v4;
  uint64_t v6 = *(void *)v44;
LABEL_3:
  uint64_t v7 = 0;
  while (1)
  {
    if (*(void *)v44 != v6) {
      objc_enumerationMutation(obj);
    }
    id v8 = *(void **)(*((void *)&v43 + 1) + 8 * v7);
    double v9 = [v8 viewController];
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass();

    if ((v10 & 1) == 0) {
      goto LABEL_12;
    }
    double v11 = [v8 viewController];
    double v12 = [v11 aceObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_11;
    }
    id v13 = [v11 aceObject];
    id v14 = [v13 viewId];
    unsigned int v15 = [v14 isEqualToString:v37];

    if (v15) {
      break;
    }
LABEL_11:

LABEL_12:
    if (v5 == (id)++v7)
    {
      id v5 = [obj countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (!v5) {
        goto LABEL_14;
      }
      goto LABEL_3;
    }
  }
  double v17 = v36;
  id v18 = [v36 stateData];
  [v11 updateSharedState:v18];
  double v19 = obj;
LABEL_16:

  BOOL v16 = 1;
LABEL_17:

LABEL_18:
  return v16;
}

- (void)setActiveRequestOptions:(id)a3
{
  id v5 = (SASRequestOptions *)a3;
  p_activeRequestOptions = &self->_activeRequestOptions;
  if (self->_activeRequestOptions != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_activeRequestOptions, a3);
    p_activeRequestOptions = (SASRequestOptions **)[(SRSystemAssistantExperienceViewController *)self _updateAmbientAvailability];
    id v5 = v7;
  }

  _objc_release_x1(p_activeRequestOptions, v5);
}

- (void)_registerForAmbientPresentationTraitChange
{
  [(SRSystemAssistantExperienceViewController *)self _updateAmbientAvailability];
  objc_initWeak(&location, self);
  double v3 = self;
  double v9 = v3;
  id v4 = +[NSArray arrayWithObjects:&v9 count:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000E1E8;
  v6[3] = &unk_100142F90;
  objc_copyWeak(&v7, &location);
  id v5 = [(SRSystemAssistantExperienceViewController *)self registerForTraitChanges:v4 withHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_updateAmbientAvailability
{
  double v3 = [(SRSystemAssistantExperienceViewController *)self view];
  id v4 = [v3 traitCollection];
  id v5 = [v4 isAmbientPresented];

  uint64_t v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = +[NSNumber numberWithBool:v5];
    int v9 = 136315394;
    char v10 = "-[SRSystemAssistantExperienceViewController _updateAmbientAvailability]";
    __int16 v11 = 2112;
    double v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #ambient - is Presented - %@", (uint8_t *)&v9, 0x16u);
  }
  [(SRSystemAssistantExperienceViewController *)self setIsInAmbient:v5];
}

- (void)setIsInAmbient:(BOOL)a3
{
  if (self->_isInAmbient != a3)
  {
    BOOL v3 = a3;
    self->_isInAmbient = a3;
    -[SiriSharedUISAEViewState setIsInAmbient:](self->_viewState, "setIsInAmbient:");
    if (self->_isInAmbient)
    {
      id v5 = +[UIScreen mainScreen];
      [v5 scale];
      double v7 = v6 * SiriSharedUICompactAmbientContentScaleAmount;

      id v8 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
      int v9 = [v8 traitOverrides];
      [v9 setDisplayScale:v7];

      char v10 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
      __int16 v11 = [v10 traitOverrides];
      [v11 setUserInterfaceStyle:2];

      double v12 = [(SRSystemAssistantExperienceViewController *)self traitOverrides];
      [v12 setDisplayScale:v7];

      id v13 = [(SRSystemAssistantExperienceViewController *)self traitOverrides];
      [v13 setUserInterfaceStyle:2];
    }
    else
    {
      id v14 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
      unsigned int v15 = [v14 traitOverrides];
      BOOL v16 = self;
      [v15 removeTrait:v16];

      double v17 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
      id v18 = [v17 traitOverrides];
      double v19 = self;
      [v18 removeTrait:v19];

      CGRect v20 = [(SRSystemAssistantExperienceViewController *)self traitOverrides];
      CGRect v21 = self;
      [v20 removeTrait:v21];

      id v13 = [(SRSystemAssistantExperienceViewController *)self traitOverrides];
      id v22 = self;
      [v13 removeTrait:v22];
    }
    [(SiriSharedUISystemAssistantExperienceContainerView *)self->_containerView setIsInAmbient:self->_isInAmbient];
    id v23 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
    [v23 setIsInAmbient:v3];

    id v24 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
    [v24 setIsInAmbient:v3];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v25 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
    uint64_t v26 = [v25 viewControllers];

    id v27 = [v26 countByEnumeratingWithState:&v42 objects:v47 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          objc_super v31 = [(SRSystemAssistantExperienceViewController *)self _contentPlatterViewFromViewController:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          [v31 setIsInAmbient:v3];
        }
        id v28 = [v26 countByEnumeratingWithState:&v42 objects:v47 count:16];
      }
      while (v28);
    }

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    int v32 = [(SRSystemAssistantExperienceViewController *)self _allTranscriptItems];
    id v33 = [v32 countByEnumeratingWithState:&v38 objects:v46 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v39;
      do
      {
        for (j = 0; j != v34; j = (char *)j + 1)
        {
          if (*(void *)v39 != v35) {
            objc_enumerationMutation(v32);
          }
          double v37 = [*(id *)(*((void *)&v38 + 1) + 8 * (void)j) viewController];
          if (objc_opt_respondsToSelector()) {
            [v37 setIsInAmbient:self->_isInAmbient];
          }
        }
        id v34 = [v32 countByEnumeratingWithState:&v38 objects:v46 count:16];
      }
      while (v34);
    }
  }
}

- (void)_updateIsInAmbientWithInteractivity:(BOOL)a3
{
  if (self->_isInAmbient)
  {
    BOOL v3 = a3;
    id v5 = +[UIScreen mainScreen];
    [v5 scale];
    double v7 = v6 * SiriSharedUICompactAmbientContentScaleAmountForInteractivity;

    id v8 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
    int v9 = [v8 traitOverrides];
    [v9 setDisplayScale:v7];

    self->_isInAmbientInteractivitCGFloat y = v3;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    char v10 = [(SRSystemAssistantExperienceViewController *)self _allTranscriptItems];
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          unsigned int v15 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v14) viewController];
          if (objc_opt_respondsToSelector()) {
            [v15 setIsInAmbientInteractivity:v3];
          }

          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    BOOL v16 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
    [v16 setIsInAmbientInteractivity:v3];
  }
}

- (id)_allTranscriptItems
{
  return [(SiriSharedUISAEViewState *)self->_viewState activeConversationTranscriptItems];
}

- (void)_setUpConversationStarterSuggestions:(int64_t)a3 isVoiceTrigger:(BOOL)a4 invocationSource:(int64_t)a5
{
  BOOL v6 = a4;
  int v9 = [(SRSystemAssistantExperienceViewController *)self delegate];
  id v10 = [v9 lockStateForSAEViewController:self];

  BOOL v11 = a3 == 1;
  unsigned int v12 = [(SRUIFPreferences *)self->_preferences BOOLForKey:SRUIFPreferencesConversationStartersShownSinceOSInstalled];
  if (!self->_suggestionsDisplayed)
  {
    unsigned int v13 = v12;
    if (!self->_suggestionsViewProvider)
    {
      id v14 = [(SRSystemAssistantExperienceViewController *)self createSuggestionsViewProvider];
      suggestionsViewProvider = self->_suggestionsViewProvider;
      self->_suggestionsViewProvider = v14;
    }
    objc_initWeak(&location, self);
    BOOL v16 = self->_suggestionsViewProvider;
    int64_t v17 = [(SRSystemAssistantExperienceViewController *)self _mapSASRequestSourceToSuggestionsInputOrigin:a5];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000EB64;
    v18[3] = &unk_100142FE0;
    objc_copyWeak(&v19, &location);
    BOOL v20 = v11;
    char v21 = v13;
    [(SiriSharedUISuggestionsViewInterface *)v16 fetchConversationStarterViewsWithDeviceLocked:v10 == (id)2 isVoiceTrigger:v6 invocationSource:v17 isFirstInvocationSinceOSInstalled:v13 ^ 1 completion:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)_addSuggestionsToContainer
{
  if (!self->_userInputRecognizedForSuggestions
    && !self->_suggestionsDisplayed
    && [(NSArray *)self->_suggestionViews count])
  {
    BOOL v3 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v8 = "-[SRSystemAssistantExperienceViewController _addSuggestionsToContainer]";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s #suggestions: Adding suggestions starter views to container", buf, 0xCu);
    }
    id v4 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
    [v4 setSuggestions:self->_suggestionViews];

    self->_suggestionsDisplayed = 1;
    [(SRSystemAssistantExperienceViewController *)self _suggestionsWereShown];
    suggestionsSpringAnimationBehavior = self->_suggestionsSpringAnimationBehavior;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000EF24;
    v6[3] = &unk_100142E88;
    void v6[4] = self;
    +[UIView _animateUsingSpringBehavior:suggestionsSpringAnimationBehavior tracking:0 animations:v6 completion:0];
  }
}

- (void)_suggestionsWereShown
{
}

- (void)_siriRequestCommittedFromSuggestion:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v5 viewController:self siriRequestEnteredWithSuggestion:v4];
}

- (void)_setUpConversationContinuerSuggestions:(int64_t)a3 forRequestId:(id)a4 currentMode:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  suggestionsSpringAnimationBehavior = self->_suggestionsSpringAnimationBehavior;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10000F180;
  v24[3] = &unk_100142E88;
  v24[4] = self;
  +[UIView _animateUsingSpringBehavior:suggestionsSpringAnimationBehavior tracking:0 animations:v24 completion:0];
  id v10 = [(SRSystemAssistantExperienceViewController *)self delegate];
  id v11 = [v10 lockStateForSAEViewController:self];

  if (!self->_suggestionsViewProvider)
  {
    unsigned int v12 = [(SRSystemAssistantExperienceViewController *)self createSuggestionsViewProvider];
    suggestionsViewProvider = self->_suggestionsViewProvider;
    self->_suggestionsViewProvider = v12;
  }
  BOOL v14 = v11 == (id)2;
  objc_initWeak(&location, self);
  dispatch_time_t v15 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F1C4;
  block[3] = &unk_100143030;
  objc_copyWeak(&v21, &location);
  block[4] = self;
  id v19 = v7;
  id v20 = v8;
  BOOL v22 = v14;
  id v16 = v8;
  id v17 = v7;
  dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (int64_t)_mapSASRequestSourceToSuggestionsInputOrigin:(int64_t)a3
{
  int64_t v3 = 3;
  uint64_t v4 = 2;
  if (a3 != 47) {
    uint64_t v4 = 0;
  }
  if (a3 != 49) {
    int64_t v3 = v4;
  }
  if (a3 == 8) {
    return 1;
  }
  else {
    return v3;
  }
}

- (id)createSuggestionsViewProvider
{
  objc_initWeak(&location, self);
  id v2 = objc_alloc((Class)SiriSharedUISuggestionsViewInterface);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F5F0;
  v7[3] = &unk_100143058;
  objc_copyWeak(&v8, &location);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F654;
  v5[3] = &unk_100143058;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 initWithPressDownHandler:v7 pressUpHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v3;
}

- (void)didReceiveAddViewsSignalForSuggestions:(id)a3 currentMode:(id)a4
{
  viewState = self->_viewState;
  id v7 = a4;
  id v8 = a3;
  [(SRSystemAssistantExperienceViewController *)self _setUpConversationContinuerSuggestions:[(SiriSharedUISAEViewState *)viewState inputType] forRequestId:v8 currentMode:v7];
}

- (void)didReceiveAddViewsDialogPhaseForSuggestions:(id)a3
{
}

- (void)siriDidStartSpeakingWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
  id v6 = [v5 visibleViewController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000F9FC;
  v8[3] = &unk_1001430A8;
  id v9 = v4;
  id v7 = v4;
  [(SRSystemAssistantExperienceViewController *)self _recursivelyNotifyVisibleViewControllers:v6 withBlock:v8];
}

- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
  id v8 = [v7 visibleViewController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000FB34;
  v10[3] = &unk_1001430D0;
  id v11 = v6;
  BOOL v12 = a4;
  id v9 = v6;
  [(SRSystemAssistantExperienceViewController *)self _recursivelyNotifyVisibleViewControllers:v8 withBlock:v10];
}

- (void)siriDidUpdateASRWithRecognition:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
  id v6 = [v5 visibleViewController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FC60;
  v8[3] = &unk_1001430A8;
  id v9 = v4;
  id v7 = v4;
  [(SRSystemAssistantExperienceViewController *)self _recursivelyNotifyVisibleViewControllers:v6 withBlock:v8];
}

- (void)siriDidTapOutsideContent
{
  id v4 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
  id v3 = [v4 visibleViewController];
  [(SRSystemAssistantExperienceViewController *)self _recursivelyNotifyVisibleViewControllers:v3 withBlock:&stru_1001430F0];
}

- (void)siriWillStartRequest
{
  id v4 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
  id v3 = [v4 visibleViewController];
  [(SRSystemAssistantExperienceViewController *)self _recursivelyNotifyVisibleViewControllers:v3 withBlock:&stru_100143110];
}

- (void)siriIsIdleAndQuiet
{
  id v4 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
  id v3 = [v4 visibleViewController];
  [(SRSystemAssistantExperienceViewController *)self _recursivelyNotifyVisibleViewControllers:v3 withBlock:&stru_100143130];
}

- (void)_recursivelyNotifyVisibleViewControllers:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if ([v6 conformsToProtocol:&OBJC_PROTOCOL___SiriSharedUIViewControlling]) {
    v7[2](v7, v6);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  [v6 childViewControllers];
  id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      BOOL v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SRSystemAssistantExperienceViewController *)self _recursivelyNotifyVisibleViewControllers:*(void *)(*((void *)&v13 + 1) + 8 * (void)v12) withBlock:v7];
        BOOL v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_pushQueuedNavigationContentViewController
{
  id v4 = [(SRSystemAssistantExperienceViewController *)self _queuedNavigationContentViewController];
  if (v4)
  {
    id v3 = [(SRSystemAssistantExperienceViewController *)self _navigationController];
    [v3 pushViewController:v4 animated:1];

    [(SRSystemAssistantExperienceViewController *)self _setQueuedNavigationContentViewController:0];
    [(SRSystemAssistantExperienceViewController *)self userDrilledIntoSnippet];
  }
}

- (void)siriViewController:(id)a3 openURL:(id)a4 completion:(id)a5
{
  instrumentationSupplement = self->_instrumentationSupplement;
  id v9 = a5;
  id v10 = a4;
  [(SiriSharedUICompactHostingInstrumentationSupplement *)instrumentationSupplement logPunchOutEventForSiriViewController:a3 aceCommand:0 URL:v10 appID:0 sashItem:0];
  id v11 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v11 viewController:self openURL:v10 completion:v9];
}

- (void)siriViewController:(id)a3 performAceCommands:(id)a4
{
}

- (void)siriSnippetViewController:(id)a3 performAceCommands:(id)a4 sashItem:(id)a5
{
  instrumentationSupplement = self->_instrumentationSupplement;
  id v9 = a4;
  [(SiriSharedUICompactHostingInstrumentationSupplement *)instrumentationSupplement logPunchOutEventForSiriViewController:a3 aceCommands:v9 sashItem:a5];
  id v10 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v10 viewController:self performAceCommands:v9 completion:0];
}

- (void)siriViewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v9 viewController:self performAceCommands:v8 completion:v7];
}

- (id)additionalSpeechInterpretationsForSiriViewController:(id)a3
{
  return 0;
}

- (id)persistentDataStoreForSiriViewController:(id)a3
{
  return 0;
}

- (double)boundingWidthForSnippetViewController:(id)a3
{
  id v3 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v3 expectedContentWidth];
  double v5 = v4;

  return v5;
}

- (id)siriViewController:(id)a3 disambiguationItemForListItem:(id)a4 disambiguationKey:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  id v8 = +[SiriUISnippetManager sharedInstance];
  id v9 = [v8 disambiguationItemForListItem:v7 disambiguationKey:v6];

  return v9;
}

- (id)siriViewController:(id)a3 domainObjectForIdentifier:(id)a4
{
  return 0;
}

- (id)siriViewController:(id)a3 filteredDisambiguationListItems:(id)a4
{
  id v4 = a4;
  double v5 = +[SiriUISnippetManager sharedInstance];
  id v6 = [v5 filteredDisambiguationListItems:v4];

  return v6;
}

- (id)siriViewController:(id)a3 listItemToPickInAutodisambiguationForListItems:(id)a4
{
  id v4 = a4;
  double v5 = +[SiriUISnippetManager sharedInstance];
  id v6 = [v5 listItemToPickInAutodisambiguationForListItems:v4];

  return v6;
}

- (UIEdgeInsets)siriViewControllerBackgroundInsets:(id)a3
{
  double top = UIEdgeInsetsZero.top;
  double left = UIEdgeInsetsZero.left;
  double bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)siriViewControllerEffectiveBundleForCoreLocation:(id)a3
{
  id v4 = a3;
  double v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  id v6 = [v5 effectiveCoreLocationBundleForSAEViewController:self];

  if (!v6)
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B6F10((uint64_t)v4, v7);
    }
  }

  return v6;
}

- (double)siriViewControllerExpectedWidth:(id)a3
{
  id v4 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  [v4 portraitContentSize];
  double v6 = v5;

  if (self->_isInAmbient && !self->_isInAmbientInteractivity) {
    return v6 / SiriSharedUICompactAmbientContentScaleAmount;
  }
  return v6;
}

- (void)siriViewControllerHeightDidChange:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    double v5 = [(SiriUINavigationController *)self->_navigationController topViewController];
    double v6 = [v5 view];
    id v7 = [(SiriSharedUISystemAssistantExperienceContainerView *)self->_containerView superview];

    if (v6 == v7)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v11 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
      BOOL v12 = [v11 conversationSnippetViews];

      id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          long long v16 = 0;
          do
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            id v17 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v16);
            long long v18 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
            unsigned int v19 = [v18 canRelayoutSnippet];

            if (v19) {
              [v17 setNeedsLayout];
            }
            long long v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
        }
        while (v14);
      }

      id v20 = [v4 view];
      [(SRSystemAssistantExperienceViewController *)self _smartDialogSnippetLayoutDidUpdateForView:v20];
    }
    else
    {
      id v8 = [(SiriUINavigationController *)self->_navigationController topViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v10 = [(SiriUINavigationController *)self->_navigationController topViewController];
        [v10 contentViewDidUpdateSize];
      }
    }
  }
}

- (void)_smartDialogSnippetLayoutDidUpdateForView:(id)a3
{
  viewState = self->_viewState;
  id v5 = a3;
  double v6 = [(SiriSharedUISAEViewState *)viewState activeSmartDialogView];
  id v7 = [v6 conversationSnippetViews];
  unsigned int v8 = [v7 containsObject:v5];

  if (v8)
  {
    id v9 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
    [v9 snippetContentDidUpdate];
  }
}

- (void)siriViewControllerHeightDidChange:(id)a3 pinTopOfSnippet:(BOOL)a4
{
  id v4 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  [v4 setNeedsLayout];
}

- (CGSize)siriViewControllerVisibleContentArea:(id)a3
{
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)statusBarHeightForSiriViewController:(id)a3
{
  return 0.0;
}

- (void)siriSnippetViewController:(id)a3 pushSirilandSnippets:(id)a4
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v4 = a4;
  id v5 = [v4 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v5) {
    goto LABEL_26;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v36;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v36 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_26;
      }
      id v10 = v9;
      id v11 = +[SRLocalSnippetManager transcriptItemForObject:v10];
      if (!v11)
      {
        BOOL v12 = +[SiriUISnippetManager sharedInstance];
        id v11 = [v12 transcriptItemForObject:v10 sizeClass:1];
      }
      id v13 = [v11 viewController];
      [v13 setAceObject:v10];

      id v14 = [v11 viewController];
      [v14 wasAddedToTranscript];

      uint64_t v15 = [v11 viewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v16 = [v15 view];
        [v16 layoutIfNeeded];
        id v17 = v15;
        if (SiriUIDeviceIsPad()) {
          [v17 setNavigating:1];
        }
        long long v18 = self;
        if (objc_opt_respondsToSelector()) {
          unsigned int v33 = [v16 shouldAutomaticallyScaleContentInAmbient];
        }
        else {
          unsigned int v33 = 1;
        }
        [v17 setIsInAmbient:self->_isInAmbient];
        [v17 setDelegate:self];
        [(SiriSharedUICompactHostingInstrumentationSupplement *)self->_instrumentationSupplement configureSiriViewControllerWithCurrentTurn:v17];
        id v19 = objc_alloc_init((Class)SiriSharedUIContentPlatterViewController);
        navigationController = self->_navigationController;
        long long v21 = [v19 contentPlatterView];
        [v21 setDelegate:navigationController];

        id v39 = v17;
        long long v22 = +[NSArray arrayWithObjects:&v39 count:1];
        [v19 setContentViewControllers:v22];

        id v23 = objc_alloc_init((Class)SiriUINavigationContentViewController);
        [v23 setContentViewController:v19];
        if (self->_isInAmbient)
        {
          long long v24 = [v19 contentPlatterView];
          uint64_t v25 = [(SRSystemAssistantExperienceViewController *)self _resultViewController];
          uint64_t v26 = [v25 compactResultView];
          [v24 setDelegate:v26];

          long long v18 = self;
        }
        id v27 = [v19 contentPlatterView];
        [v27 setIsNextLevelCard:1];

        id v28 = [v19 contentPlatterView];
        [v28 setIsInAmbient:v18->_isInAmbient];

        uint64_t v29 = [v19 contentPlatterView];
        [v29 setAllowAutomaticContentViewsScaling:v33];

        [(SRSystemAssistantExperienceViewController *)v18 _updateAdditionalSafeAreaInsetsForNavigationContentViewController:v23];
        [(SRSystemAssistantExperienceViewController *)v18 _setQueuedNavigationContentViewController:v23];
        if ([v17 isLoading])
        {
          double v30 = [v17 aceObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {

            long long v18 = self;
          }
          else
          {
            objc_super v31 = [v17 aceObject];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            long long v18 = self;
            if ((isKindOfClass & 1) == 0)
            {
LABEL_25:
              [(SiriSharedUICompactHostingInstrumentationSupplement *)v18->_instrumentationSupplement logDrillInInteractionForSnippetViewControllerIfNecessary:v17];

              goto LABEL_26;
            }
          }
        }
        [(SRSystemAssistantExperienceViewController *)v18 _pushQueuedNavigationContentViewController];
        goto LABEL_25;
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_26:
}

- (void)siriSnippetViewController:(id)a3 setStatusViewHidden:(BOOL)a4
{
}

- (BOOL)siriSnippetViewControllerIsVisible:(id)a3
{
  return 1;
}

- (void)siriSnippetViewControllerViewDidLoad:(id)a3
{
  if (a3)
  {
    id v4 = [a3 view];
    [(SRSystemAssistantExperienceViewController *)self _smartDialogSnippetLayoutDidUpdateForView:v4];

    id v5 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
    [v5 setNeedsLayout];

    [(SRSystemAssistantExperienceViewController *)self _pushQueuedNavigationContentViewController];
  }
}

- (void)userTouchedSnippet
{
  id v2 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v2 userTouchedSnippet];
}

- (void)siriSnippetViewController:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v9 saeViewController:self handleStartLocalRequest:v8 turnIdentifier:v7];
}

- (void)userDrilledIntoSnippet
{
  id v3 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v3 userDrilledIntoSnippet];

  if (SiriSharedUIDeviceIsPhone())
  {
    id v4 = [(SiriSharedUISystemAssistantExperienceContainerView *)self->_textFieldContainerView layer];
    id v5 = +[UIScreen mainScreen];
    id v6 = [v5 traitCollection];
    [v6 displayCornerRadius];
    [v4 setCornerRadius:v7 / 1.2];

    id v8 = [(SiriSharedUISystemAssistantExperienceContainerView *)self->_textFieldContainerView layer];
    [v8 setMaskedCorners:12];

    id v9 = [(SiriSharedUISystemAssistantExperienceContainerView *)self->_textFieldContainerView layer];
    [v9 setMasksToBounds:1];
  }
}

- (void)siriSnippetViewController:(id)a3 informHostOfBackgroundView:(id)a4 isSnippetAsyncColored:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    id v10 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
    id v11 = [v10 snippetBackgroundView];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v11;
      BOOL v12 = [v11 contentView];
      [v12 addSubview:v9];

      [v11 bounds];
      [v9 setFrame:];
      unsigned int v13 = [(SiriSharedUISAEViewState *)self->_viewState hasSmartDialogSnippet];
      id v14 = (double *)&SiriSharedUISmartDialogSnippetCornerRadius;
      if (!v13) {
        id v14 = (double *)&SiriSharedUISmartDialogPlatterCornerRadius;
      }
      [v11 setContinuousCornerRadius:*v14];
      uint64_t v15 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v71 = "-[SRSystemAssistantExperienceViewController siriSnippetViewController:informHostOfBackgroundView:isSnippetAsyncColored:]";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s #background: get SearchUIBackgroundColorView", buf, 0xCu);
      }
      long long v16 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
      if ([v16 onlyContainsSnippet])
      {
        unsigned __int8 v17 = [(SiriSharedUISAEViewState *)self->_viewState hasSmartDialogSnippet];

        if (v17)
        {
LABEL_11:

LABEL_46:
          goto LABEL_47;
        }
        [v11 removeFromSuperview];
        long long v18 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
        [v18 setSnippetBackgroundView:0];

        long long v16 = [(SRSystemAssistantExperienceViewController *)self containerView];
        id v19 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
        [v16 updateBackgroundView:v9 smartDialogView:v19 isSnippetAsyncColored:1];
      }
      goto LABEL_11;
    }
    uint64_t v26 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
    CGPoint v51 = [v26 snippetBackgroundView];
    if (v51)
    {

      goto LABEL_45;
    }
    long long v43 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
    if ([v43 onlyContainsSnippet])
    {
      unsigned __int8 v64 = [(SiriSharedUISAEViewState *)self->_viewState hasSmartDialogSnippet];

      if (v64) {
        goto LABEL_46;
      }
      uint64_t v26 = [(SRSystemAssistantExperienceViewController *)self containerView];
      v61 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
      [v26 updateBackgroundView:v9 smartDialogView:v61 isSnippetAsyncColored:1];
LABEL_43:

      goto LABEL_45;
    }
LABEL_44:

    goto LABEL_45;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
    long long v21 = [v20 snippetBackgroundView];

    if (v21)
    {
      long long v22 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
      id v23 = [v22 snippetBackgroundView];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v11 = v9;
        uint64_t v25 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
        uint64_t v26 = [v25 snippetBackgroundView];

        id v27 = [v11 effect];
        [v26 setEffect:v27];

        id v28 = [v11 backgroundColor];
        [v26 setBackgroundColor:v28];

        unsigned int v29 = [(SiriSharedUISAEViewState *)self->_viewState hasSmartDialogSnippet];
        double v30 = (double *)&SiriSharedUISmartDialogSnippetCornerRadius;
        if (!v29) {
          double v30 = (double *)&SiriSharedUISmartDialogPlatterCornerRadius;
        }
        double v31 = *v30;
        int v32 = [v26 layer];
        [v32 setCornerRadius:v31];

        unsigned int v33 = (void *)AFSiriLogContextConnection;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          id v34 = v33;
          long long v35 = [v26 backgroundColor];
          long long v36 = [v26 effect];
          *(_DWORD *)buf = 136315650;
          v71 = "-[SRSystemAssistantExperienceViewController siriSnippetViewController:informHostOfBackgroundView:isSnipp"
                "etAsyncColored:]";
          __int16 v72 = 2112;
          v73 = v35;
          __int16 v74 = 2112;
          v75 = v36;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s #background: setting backgroundViewColor:%@, effect:%@", buf, 0x20u);
        }
        if ([(SiriSharedUISAEViewState *)self->_viewState hasSmartDialogSnippet])
        {
          long long v67 = 0u;
          long long v68 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v37 = [v26 contentView];
          long long v38 = [v37 subviews];

          id v39 = [v38 countByEnumeratingWithState:&v65 objects:v69 count:16];
          if (v39)
          {
            id v40 = v39;
            uint64_t v41 = *(void *)v66;
            do
            {
              for (i = 0; i != v40; i = (char *)i + 1)
              {
                if (*(void *)v66 != v41) {
                  objc_enumerationMutation(v38);
                }
                [*(id *)(*((void *)&v65 + 1) + 8 * i) removeFromSuperview];
              }
              id v40 = [v38 countByEnumeratingWithState:&v65 objects:v69 count:16];
            }
            while (v40);
          }
        }
        long long v43 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
        if ([v43 onlyContainsSnippet])
        {
          unsigned __int8 v44 = [(SiriSharedUISAEViewState *)self->_viewState hasSmartDialogSnippet];

          if (v44)
          {
LABEL_45:

            goto LABEL_46;
          }
          [v26 removeFromSuperview];
          long long v45 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
          [v45 setSnippetBackgroundView:0];

          long long v46 = (void *)AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            CGRect v47 = v46;
            unsigned __int8 v48 = [v26 backgroundColor];
            int v49 = [v26 effect];
            *(_DWORD *)buf = 136315650;
            v71 = "-[SRSystemAssistantExperienceViewController siriSnippetViewController:informHostOfBackgroundView:isSni"
                  "ppetAsyncColored:]";
            __int16 v72 = 2112;
            v73 = v48;
            __int16 v74 = 2112;
            v75 = v49;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%s #background: updating the whole background backgroundViewColor:%@, effect:%@", buf, 0x20u);
          }
          long long v43 = [(SRSystemAssistantExperienceViewController *)self containerView];
          CGRect v50 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
          [v43 updateBackgroundView:v26 smartDialogView:v50 isSnippetAsyncColored:0];
        }
        goto LABEL_44;
      }
    }
    else
    {
      CGRect v52 = [(SiriSharedUISystemAssistantExperienceContainerView *)self->_containerView resultSnippetBackgroundView];
      objc_opt_class();
      uint64_t v53 = objc_opt_isKindOfClass();

      if (v53)
      {
        id v11 = v9;
        uint64_t v26 = [(SiriSharedUISystemAssistantExperienceContainerView *)self->_containerView resultSnippetBackgroundView];
        v54 = [v11 effect];
        [v26 setEffect:v54];

        v55 = [v11 backgroundColor];
        [v26 setBackgroundColor:v55];

        unsigned int v56 = [(SiriSharedUISAEViewState *)self->_viewState hasSmartDialogSnippet];
        v57 = (double *)&SiriSharedUISmartDialogSnippetCornerRadius;
        if (!v56) {
          v57 = (double *)&SiriSharedUISmartDialogPlatterCornerRadius;
        }
        double v58 = *v57;
        v59 = [v26 layer];
        [v59 setCornerRadius:v58];

        v60 = (void *)AFSiriLogContextConnection;
        if (!os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_45;
        }
        v61 = v60;
        v62 = [v26 backgroundColor];
        v63 = [v26 effect];
        *(_DWORD *)buf = 136315650;
        v71 = "-[SRSystemAssistantExperienceViewController siriSnippetViewController:informHostOfBackgroundView:isSnippetAsyncColored:]";
        __int16 v72 = 2112;
        v73 = v62;
        __int16 v74 = 2112;
        v75 = v63;
        _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%s #background: setting backgroundViewColor:%@, effect:%@", buf, 0x20u);

        goto LABEL_43;
      }
    }
  }
LABEL_47:
}

- (void)siriSnippetViewController:(id)a3 isBackgroundColorUpdateSuccessful:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  unsigned int v7 = [v6 onlyContainsSnippet];

  if (v7)
  {
    id v8 = [(SRSystemAssistantExperienceViewController *)self containerView];
    [v8 searchUIBackgroundColorUpdateSuccessful:v4];
  }
}

- (void)cancelSpeakingForSiriViewController:(id)a3
{
  id v4 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v4 stopSpeakingForSAEViewController:self];
}

- (void)siriViewController:(id)a3 speakText:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v9 saeViewController:self speakText:v8 isPhonetic:0 completion:v7];
}

- (BOOL)siriViewControllerShouldPreventUserInteraction:(id)a3
{
  id v4 = [(SRSystemAssistantExperienceViewController *)self delegate];
  id v5 = [v4 lockStateForSAEViewController:self];

  return v5 != 0;
}

- (id)localeForSiriViewController:(id)a3
{
  id v4 = [(SRSystemAssistantExperienceViewController *)self delegate];
  id v5 = [v4 localeForSAEViewController:self];

  return v5;
}

- (void)siriSnippetViewController:(id)a3 willDismissViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v6 siriSAEViewController:self willDismissViewController:v5];
}

- (void)siriSnippetViewController:(id)a3 willPresentViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v6 siriSAEViewController:self willPresentViewController:v5];
}

- (void)siriViewControllerWillBeginEditing:(id)a3
{
  id v4 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v4 cancelRequestForViewController:self];

  id v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v5 saeViewControllerRequestsHIDEventDefferal:self];

  id v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[SRSystemAssistantExperienceViewController siriViewControllerWillBeginEditing:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s #dismissal - temporarily preventing touches from dismissing Siri while edit sheet is up", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v7 saeViewController:self preventOutsideTouchesFromDismissingSiri:1];
}

- (void)siriViewControllerDidEndEditing:(id)a3
{
  id v4 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v4 saeViewControllerCancelHIDEventDefferal:self];

  id v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[SRSystemAssistantExperienceViewController siriViewControllerDidEndEditing:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #dismissal - edit sheet is removed, no longer preventing touches from dismissing Siri", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v6 saeViewController:self preventOutsideTouchesFromDismissingSiri:0];
}

- (void)siriViewControllerViewDidAppear:(id)a3 isTopLevelViewController:(BOOL)a4
{
  if (a4)
  {
    p_delegate = &self->_delegate;
    id v6 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    int v7 = [v6 aceObject];

    [WeakRetained saeViewController:self viewDidAppearForAceObject:v7];
  }
}

- (void)siriViewControllerViewDidDisappear:(id)a3 isTopLevelViewController:(BOOL)a4
{
  if (a4)
  {
    p_delegate = &self->_delegate;
    id v6 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    int v7 = [v6 aceObject];

    [WeakRetained saeViewController:self viewDidDisappearForAceObject:v7];
  }
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (void)_setStatusViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v5 saeViewController:self setStatusViewHidden:v3];
}

- (void)_setSnippetViewControllerRequestsStatusViewHidden:(BOOL)a3
{
  self->_snippetViewControllerRequestsStatusViewHidden = a3;
  [(SRSystemAssistantExperienceViewController *)self _updateStatusViewVisibility];
}

- (void)_updateStatusViewVisibility
{
  unsigned int v3 = [(SRSystemAssistantExperienceViewController *)self _hidesStatusViewForInputType:[(SiriSharedUISAEViewState *)self->_viewState inputType]];
  uint64_t v4 = v3 | [(SRSystemAssistantExperienceViewController *)self _snippetViewControllerRequestsStatusViewHidden];

  [(SRSystemAssistantExperienceViewController *)self _setStatusViewHidden:v4];
}

- (void)_updateHomeAffordanceVisibility
{
  id v3 = [(SiriSharedUISAEViewState *)self->_viewState inputType];
  if (v3 != (id)3)
  {
    if (v3 == (id)2)
    {
      int v8 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315138;
        id v10 = "-[SRSystemAssistantExperienceViewController _updateHomeAffordanceVisibility]";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s #homeAffordance: toggleHomeAffordanceHidden: YES for input type speech", (uint8_t *)&v9, 0xCu);
      }
      id v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
      id v6 = v5;
      uint64_t v7 = 1;
      goto LABEL_10;
    }
    if (v3 != (id)1) {
      return;
    }
  }
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[SRSystemAssistantExperienceViewController _updateHomeAffordanceVisibility]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #homeAffordance: toggleHomeAffordanceHidden: NO for input type text", (uint8_t *)&v9, 0xCu);
  }
  id v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  id v6 = v5;
  uint64_t v7 = 0;
LABEL_10:
  [v5 toggleHomeAffordanceHidden:v7];
}

- (void)_willBeginEditingOfType:(int64_t)a3
{
  id v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v5 saeViewController:self willBeginEditingOfType:a3];
}

- (void)_didEndEditing
{
  id v3 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v3 saeViewControllerDidEndEditing:self];
}

- (void)_updateKeyboardStateFromNotification:(id)a3
{
  id v4 = a3;
  id v5 = [[SRCompactKeyboardState alloc] initWithKeyboardNotification:v4];

  [(SRSystemAssistantExperienceViewController *)self _setKeyboardState:v5];
}

- (void)_keyboardWillHideForAmbient:(id)a3
{
  if (self->_isInAmbient) {
    [(SRSystemAssistantExperienceViewController *)self _updateIsInAmbientWithInteractivity:0];
  }
}

- (void)_keyboardWillShowForAmbient:(id)a3
{
  if (self->_isInAmbient) {
    [(SRSystemAssistantExperienceViewController *)self _updateIsInAmbientWithInteractivity:1];
  }
}

- (void)_setKeyboardState:(id)a3
{
  id v4 = (SRCompactKeyboardState *)[a3 copy];
  keyboardState = self->_keyboardState;
  self->_keyboardState = v4;

  [(SRSystemAssistantExperienceViewController *)self _updateBottomContentInsetKeyboardComponent];
}

- (CGRect)_convertRectFromKeyboard:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int v8 = [(SRSystemAssistantExperienceViewController *)self view];
  int v9 = [v8 window];
  id v10 = [v9 screen];

  id v11 = [v10 coordinateSpace];
  BOOL v12 = [(SRSystemAssistantExperienceViewController *)self view];
  [v12 convertRect:v11 fromCoordinateSpace:x, y, width, height];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (CGRect)_keyboardFrame
{
  id v3 = [(SRSystemAssistantExperienceViewController *)self _keyboardState];
  [v3 frame];
  -[SRSystemAssistantExperienceViewController _convertRectFromKeyboard:](self, "_convertRectFromKeyboard:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (BOOL)_hidesStatusViewForInputType:(int64_t)a3
{
  return ((a3 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (BOOL)_hidesTextRequestViewForInputType:(int64_t)a3
{
  return ![(SRSystemAssistantExperienceViewController *)self _hidesStatusViewForInputType:a3];
}

- (void)_setInputType:(int64_t)a3
{
  if ([(SiriSharedUISAEViewState *)self->_viewState inputType] != (id)a3)
  {
    [(SiriSharedUISAEViewState *)self->_viewState setInputType:a3];
    double v5 = [(SRSystemAssistantExperienceViewController *)self containerView];
    [v5 setInputType:a3];

    [(SRSystemAssistantExperienceViewController *)self _updateTextRequestViewVisibility];
    [(SRSystemAssistantExperienceViewController *)self _updateStatusViewVisibility];
  }
}

- (BOOL)_alwaysObscureBackgroundContentWhenActive
{
  id v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 alwaysObscureBackgroundContentWhenActive];

  return v3;
}

- (BOOL)_keyboardHasContentAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SRSystemAssistantExperienceViewController *)self _keyboardFrame];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (void)_requestKeyboardWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v5 saeViewController:self requestsKeyboardWithCompletion:v4];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v29 = a3;
  id v8 = a4;
  CGFloat v9 = [(SRSystemAssistantExperienceViewController *)self _contentPlatterViewFromViewController:v8];
  CGFloat v10 = [v29 viewControllers];
  id v11 = [v10 count];

  if (v11 == (id)2)
  {
    if (SiriSharedUIDeviceIsPhone() && !self->_isDrilledIntoSnippet)
    {
      double v13 = [(SRSystemAssistantExperienceViewController *)self delegate];
      [v13 updateEdgeLightWindowLevel:1];
    }
    self->_isDrilledIntoSnippet = 1;
    if (SiriSharedUIDeviceIsPad())
    {
      [v29 setNavigationBarHidden:0 animated:v5];
      [v9 setFakeNavigationBarBackgroundHidden:1];
    }
    else
    {
      [v29 setNavigationBarHidden:1 animated:v5];
    }
    double v19 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
    [v19 textFieldHeight];
    double v21 = v20;

    if ((SiriSharedUIDeviceIsPad() & 1) == 0)
    {
      double v22 = [(SRSystemAssistantExperienceViewController *)self view];
      [v22 safeAreaInsets];
      double v21 = v21 + v23;
    }
    [v9 setMinimumScrollViewBottomInset:v21];
    double v24 = [v8 navigationItem];
    [v24 setHidesBackButton:1];

    uint64_t v25 = [(SRSystemAssistantExperienceViewController *)self delegate];
    [v25 toggleHomeAffordanceHidden:SiriSharedUIDeviceIsPhone() ^ 1];

    if ([(SiriSharedUISAEViewState *)self->_viewState inputType] == (id)1)
    {
      uint64_t v26 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
      [v26 resignFirstResponder];

      id v27 = [(SRSystemAssistantExperienceViewController *)self delegate];
      [v27 viewController:self willChangeKeyboardVisibility:0];
    }
    [(SRSystemAssistantExperienceViewController *)self updateTopInset:1 animated:self->_topInset];
    id v28 = [(SiriSharedUISAEViewState *)self->_viewState finalAndDisplayedSmartDialogs];
    [v28 removeAllObjects];

    [(SiriSharedUISAEViewState *)self->_viewState setActiveSmartDialogView:0];
  }
  else if (v11 == (id)1)
  {
    self->_isDrilledIntoSnippet = 0;
    [v29 setNavigationBarHidden:1 animated:v5];
    [v9 setFakeNavigationBarBackgroundHidden:1];
    [(SRSystemAssistantExperienceViewController *)self _updateHomeAffordanceVisibility];
    if (SiriSharedUIDeviceIsPhone())
    {
      double v12 = [(SRSystemAssistantExperienceViewController *)self delegate];
      [v12 updateEdgeLightWindowLevel:0];
    }
    [(SRSystemAssistantExperienceViewController *)self updateTopInset:1 animated:self->_topInset];
  }
  else if ((unint64_t)v11 >= 3)
  {
    [v29 setNavigationBarHidden:0 animated:v5];
    [v9 setFakeNavigationBarBackgroundHidden:0];
    double v14 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
    [v14 textFieldHeight];
    double v16 = v15;

    if ((SiriSharedUIDeviceIsPad() & 1) == 0)
    {
      double v17 = [(SRSystemAssistantExperienceViewController *)self view];
      [v17 safeAreaInsets];
      double v16 = v16 + v18;
    }
    [v9 setMinimumScrollViewBottomInset:v16];
  }
}

- (id)_contentPlatterViewFromViewController:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = sub_1000056B4(v4, v3);

  if (v5
    && (uint64_t v6 = objc_opt_class(),
        [v5 contentViewController],
        double v7 = objc_claimAutoreleasedReturnValue(),
        sub_1000056B4(v6, v7),
        id v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        v8))
  {
    CGFloat v9 = [v8 contentPlatterView];
  }
  else
  {
    CGFloat v9 = 0;
  }

  return v9;
}

- (BOOL)_contentDiffersBetweenPlatterItems:(id)a3 andItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  if (v7 == [v6 count])
  {
    if ([v5 count])
    {
      unint64_t v8 = 0;
      do
      {
        CGFloat v9 = [v5 objectAtIndex:v8];
        CGFloat v10 = [v6 objectAtIndex:v8];
        unsigned int v11 = +[SiriSharedUIUtilities contentDiffersBetweenItems:v10 andItems:v9];

        if (v11) {
          break;
        }
        ++v8;
      }
      while ((unint64_t)[v5 count] > v8);
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }
  else
  {
    LOBYTE(v11) = 1;
  }

  return v11;
}

- (void)dropletContentWillUpdateLayout:(id)a3 withUpdatedContentSize:(CGSize)a4 animated:(BOOL)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  viewState = self->_viewState;
  id v9 = a3;
  id v10 = [(SiriSharedUISAEViewState *)viewState activeSmartDialogView];

  if (v10 == v9)
  {
    unsigned int v11 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogIsLatencyPill];
    double v12 = self->_viewState;
    if (v11)
    {
      double v13 = [(SiriSharedUISAEViewState *)v12 userUtterance];
      double v14 = [v13 speech];
      unsigned __int8 v15 = [v14 isFinal];

      defaultSpringAnimationBehavior = self->_defaultSpringAnimationBehavior;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100012C90;
      v30[3] = &unk_100143158;
      v30[4] = self;
      *(CGFloat *)&v30[5] = width;
      *(CGFloat *)&v30[6] = height;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100012CE4;
      v28[3] = &unk_100142EB0;
      unsigned __int8 v29 = v15;
      v28[4] = self;
      +[UIView _animateUsingSpringBehavior:defaultSpringAnimationBehavior tracking:0 animations:v30 completion:v28];
      double v17 = [(SRSystemAssistantExperienceViewController *)self view];
      [v17 setNeedsLayout];

      double v18 = [(SRSystemAssistantExperienceViewController *)self view];
LABEL_4:
      double v19 = v18;
      [v18 layoutIfNeeded];

      return;
    }
    uint64_t v20 = [(SiriSharedUISAEViewState *)v12 activeSmartDialogView];
    if (v20)
    {
      double v21 = (void *)v20;
      double v22 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
      unsigned int v23 = [v22 hasResult];

      if (v23)
      {
        self->_activeSmartDialogSize.CGFloat width = width;
        self->_activeSmartDialogSize.CGFloat height = height;
        if ([(SRSystemAssistantExperienceViewController *)self _shouldRenderResult])
        {
          [(SRSystemAssistantExperienceViewController *)self _renderResult];
        }
        else if (self->_resultPresentedInActiveSmartDialog)
        {
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100012DC4;
          v27[3] = &unk_100143158;
          v27[4] = self;
          *(CGFloat *)&v27[5] = width;
          *(CGFloat *)&v27[6] = height;
          +[UIView _performWithoutRetargetingAnimations:v27];
          double v24 = [(SRSystemAssistantExperienceViewController *)self view];
          [v24 setNeedsLayout];

          uint64_t v25 = [(SRSystemAssistantExperienceViewController *)self view];
          [v25 layoutIfNeeded];

          uint64_t v26 = [(SRSystemAssistantExperienceViewController *)self containerView];
          [v26 setNeedsLayout];

          double v18 = [(SRSystemAssistantExperienceViewController *)self containerView];
          goto LABEL_4;
        }
      }
    }
  }
}

- (double)dropletContentMaximumContainerWidth
{
  id v2 = [(SRSystemAssistantExperienceViewController *)self containerView];
  [v2 frame];
  double v4 = v3;

  return v4;
}

- (double)dropletContentMaximumContainerHeight
{
  id v2 = [(SRSystemAssistantExperienceViewController *)self containerView];
  [v2 frame];
  double v4 = v3;

  return v4;
}

- (void)setDropletContainerUserUtteranceViewHeight:(double)a3
{
  id v4 = [(SRSystemAssistantExperienceViewController *)self containerView];
  [v4 setUserUtteranceViewHeight:a3];
}

- (void)siriSnippetViewControllerShouldPushSirilandSnippets:(id)a3
{
}

- (void)siriSnippetViewControllerPerformAceCommands:(id)a3
{
}

- (void)siriViewControllerHeightDidChange
{
  id v2 = [(SiriSharedUISAEViewState *)self->_viewState activeSmartDialogView];
  [v2 snippetContentDidUpdate];
}

- (void)siriViewControllerShouldOpenUrl:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v5 viewController:self openURL:v4 completion:0];
}

- (void)siriViewControllerSetStatusViewHidden:(BOOL)a3
{
}

- (void)siriViewControllerShouldRequestTextInputWithUtterance:(id)a3
{
  self->_inTapToEdit = 1;
  viewState = self->_viewState;
  id v5 = a3;
  if ([(SiriSharedUISAEViewState *)viewState inputType] == (id)1)
  {
    id v7 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
    [v7 prefillWithText:v5];
  }
  else
  {
    [(SRSystemAssistantExperienceViewController *)self removeResponseElementsIfNeeded:1];
    [(SRSystemAssistantExperienceViewController *)self _setInputType:1];
    [(SRSystemAssistantExperienceViewController *)self siriDidActivate];
    id v6 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
    [v6 prefillWithText:v5];

    id v7 = [(SRSystemAssistantExperienceViewController *)self delegate];
    [v7 siriSAEViewControllerRequestsTextActivation:self withRequestSource:32];
  }
}

- (void)switchPresentationToTextInput
{
  [(SRSystemAssistantExperienceViewController *)self _setInputType:1];

  [(SRSystemAssistantExperienceViewController *)self siriDidActivate];
}

- (void)switchPresentationToVisualIntelligenceCameraInput
{
  [(SRSystemAssistantExperienceViewController *)self _setInputType:3];

  [(SRSystemAssistantExperienceViewController *)self siriDidActivate];
}

- (void)promptEntryViewWillPresentEditMenu:(id)a3
{
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SRSystemAssistantExperienceViewController promptEntryViewWillPresentEditMenu:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #dismissal - temporarily preventing touches from dismissing Siri while edit menu is up", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v5 saeViewController:self preventOutsideTouchesFromDismissingSiri:1];
}

- (void)promptEntryDidDismissEditMenu:(id)a3
{
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[SRSystemAssistantExperienceViewController promptEntryDidDismissEditMenu:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #dismissal - edit menu is removed, no longer preventing touches from dismissing Siri", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v5 saeViewController:self preventOutsideTouchesFromDismissingSiri:0];
}

- (void)entryViewDidSubmit:(id)a3 text:(id)a4
{
  id v5 = a4;
  int v6 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
  [v6 removeSuggestions];

  BOOL inTapToEdit = self->_inTapToEdit;
  unint64_t v8 = [(SRSystemAssistantExperienceViewController *)self delegate];
  id v9 = v8;
  if (inTapToEdit)
  {
    id v10 = [(SiriSharedUISAEViewState *)self->_viewState userUtterance];
    unsigned int v11 = [v10 speech];
    double v12 = [v11 userUtterance];
    id v13 = objc_alloc_init((Class)AFUserUtteranceSelectionResults);
    [v9 viewController:self didFinishEditingUtteranceWithText:v5 originalUserUtterance:v12 selectionResults:v13];

    self->_BOOL inTapToEdit = 0;
  }
  else
  {
    [v8 viewController:self siriRequestEnteredWithText:v5];
  }
  suggestionsViewProvider = self->_suggestionsViewProvider;

  [(SiriSharedUISuggestionsViewInterface *)suggestionsViewProvider startNewTypingSession];
}

- (void)entryViewDidSubmit:(id)a3 suggestionText:(id)a4
{
  id v5 = a4;
  int v6 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
  [v6 removeSuggestions];

  id v7 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v7 viewController:self siriRequestEnteredWithSuggestion:v5];

  suggestionsViewProvider = self->_suggestionsViewProvider;

  [(SiriSharedUISuggestionsViewInterface *)suggestionsViewProvider startNewTypingSession];
}

- (void)shouldBeginEditing
{
  id v2 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
  [v2 updateKeyboardLightEffects:1];
}

- (void)didBeginEditingWhenInTamaleAndCollapsed:(BOOL)a3
{
  if (a3)
  {
    id v4 = [(SRSystemAssistantExperienceViewController *)self delegate];
    [v4 cancelRequestForViewController:self];

    [(SRSystemAssistantExperienceViewController *)self removeResponseElementsIfNeeded:1];
  }
}

- (void)didChangeText:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  unsigned __int8 v6 = [v5 isPresentingVisualIntelligenceCamera];

  if ((v6 & 1) == 0)
  {
    if ([v4 length])
    {
      id v7 = [(SRSystemAssistantExperienceViewController *)self delegate];
      unint64_t v8 = (unint64_t)[v7 lockStateForSAEViewController:self];

      objc_initWeak(&location, self);
      suggestionsViewProvider = self->_suggestionsViewProvider;
      id v10 = [(SRSystemAssistantExperienceViewController *)self _instrumentationManager];
      unsigned int v11 = [v10 currentInstrumentationTurnContext];
      double v12 = [v11 turnIdentifier];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10001384C;
      v17[3] = &unk_1001431E8;
      objc_copyWeak(&v18, &location);
      v17[4] = self;
      [(SiriSharedUISuggestionsViewInterface *)suggestionsViewProvider fetchAutoCompletionSuggestionsViewsWithQuery:v4 deviceLocked:(v8 >> 1) & 1 turnId:v12 completion:v17];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {
      id v13 = [(SiriSharedUISuggestionsViewInterface *)self->_suggestionsViewProvider getInitialSuggestionViews];
      suggestionViews = self->_suggestionViews;
      self->_suggestionViews = v13;

      unsigned __int8 v15 = [(SRSystemAssistantExperienceViewController *)self textFieldContainerView];
      [v15 setSuggestions:self->_suggestionViews];

      suggestionTexts = self->_suggestionTexts;
      self->_suggestionTexts = (NSArray *)&__NSArray0__struct;
    }
  }
}

- (void)entryViewShouldShowSuggestions:(id)a3 showSuggestions:(BOOL)a4
{
  self->_shouldShowSuggestions = a4;
  suggestionsSpringAnimationBehavior = self->_suggestionsSpringAnimationBehavior;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013D3C;
  v5[3] = &unk_100142E88;
  void v5[4] = self;
  +[UIView _animateUsingSpringBehavior:suggestionsSpringAnimationBehavior tracking:0 animations:v5 completion:0];
}

- (void)promptEntryViewDidLayoutSubviews:(id)a3
{
  [(SiriSharedUISystemAssistantExperienceContainerView *)self->_textFieldContainerView setNeedsLayout];
  textFieldContainerView = self->_textFieldContainerView;

  [(SiriSharedUISystemAssistantExperienceContainerView *)textFieldContainerView layoutIfNeeded];
}

- (void)handleVoiceActivationRequestWithRequestOptions:(id)a3
{
  id v4 = a3;
  [(SRSystemAssistantExperienceViewController *)self _setInputType:2];
  [(SRSystemAssistantExperienceViewController *)self _teardownTypeToSiriUI];
  id v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v5 siriSAEViewControllerRequestsVoiceActivation:self withRequestOptions:v4];
}

- (void)_teardownTypeToSiriUI
{
  double v3 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
  [v3 resignFirstResponder];

  suggestionsSpringAnimationBehavior = self->_suggestionsSpringAnimationBehavior;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013F58;
  v6[3] = &unk_100142E88;
  void v6[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100013FB0;
  v5[3] = &unk_100142ED8;
  void v5[4] = self;
  +[UIView _animateUsingSpringBehavior:suggestionsSpringAnimationBehavior tracking:0 animations:v6 completion:v5];
}

- (void)dismissSiriResults
{
  id v3 = [(SiriSharedUISAEViewState *)self->_viewState inputType];
  id v4 = [(SRSystemAssistantExperienceViewController *)self delegate];
  unsigned int v5 = [v4 isPresentingVisualIntelligenceCamera];

  if (!v5 || v3 == (id)3)
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B70A4(v5, v3 == (id)3, v7);
    }
  }
  else
  {
    unsigned __int8 v6 = [(SRSystemAssistantExperienceViewController *)self delegate];
    [v6 siriResultsWillDismissInTamale];

    [(SRSystemAssistantExperienceViewController *)self _teardownTypeToSiriForVisualIntelligenceCameraWithUpdate];
  }
}

- (void)_teardownTypeToSiriForVisualIntelligenceCameraWithUpdate
{
  id v3 = [(SRSystemAssistantExperienceViewController *)self delegate];
  unsigned int v4 = [v3 isPresentingVisualIntelligenceCamera];

  if (v4)
  {
    unsigned int v5 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
    unsigned int v6 = [v5 getIsInTamaleAndCollapsed];

    if (v6)
    {
      id v7 = [(SRSystemAssistantExperienceViewController *)self promptEntryView];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100014298;
      v9[3] = &unk_100142E88;
      v9[4] = self;
      [v7 animateOutTextFieldAndButton:v9];
    }
    else
    {
      [(SRSystemAssistantExperienceViewController *)self _teardownTypeToSiriUI];
      id v8 = [(SRSystemAssistantExperienceViewController *)self delegate];
      [v8 siriResultsDidDismissInTamale];
    }
  }
  else
  {
    [(SRSystemAssistantExperienceViewController *)self _teardownTypeToSiriUI];
  }
}

- (void)keyboardIsReadyToReceiveInput
{
  id v3 = [(SRSystemAssistantExperienceViewController *)self _instrumentationManager];
  unsigned int v4 = SRUIFConstructLaunchContextForLaunchEnded();
  [v3 emitInstrumentation:v4];

  typeToSiriKeyboardReadinessObserver = self->_typeToSiriKeyboardReadinessObserver;

  [(SRTypeToSiriKeyboardReadinessObserver *)typeToSiriKeyboardReadinessObserver stop];
}

- (void)containerView:(id)a3 requestsDismissalWithReason:(int64_t)a4
{
  unsigned int v6 = [(SRSystemAssistantExperienceViewController *)self delegate];
  unsigned int v7 = [v6 isPresentingVisualIntelligenceCamera];

  if (v7)
  {
    [(SRSystemAssistantExperienceViewController *)self dismissSiriResults];
  }
  else
  {
    id v8 = [(SRSystemAssistantExperienceViewController *)self delegate];
    [v8 endSiriSessionForViewController:self withDismissalReason:a4];
  }
}

- (void)presentGenerativeAssistantOnboardingFlowWithCommandId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  [(SRSystemAssistantExperienceViewController *)self setStoredGenerativeAssistantOnboardingCompletion:a4];
  [(SRSystemAssistantExperienceViewController *)self setGenerativeAssistantOnboardingCommandAceID:v6];

  montaraOnboardingManager = self->_montaraOnboardingManager;

  [(SiriSharedUIGenerativeAssistantOnboardingManager *)montaraOnboardingManager presentOnboardingFlow];
}

- (void)presentGenerativeAssistantOnboardingFlowWithCommand:(id)a3 completion:(id)a4
{
  id v7 = a3;
  [(SRSystemAssistantExperienceViewController *)self setStoredGenerativeAssistantOnboardingCompletion:a4];
  id v6 = [v7 aceId];
  [(SRSystemAssistantExperienceViewController *)self setGenerativeAssistantOnboardingCommandAceID:v6];

  [(SiriSharedUIGenerativeAssistantOnboardingManager *)self->_montaraOnboardingManager presentOnboardingFlowForCommand:v7];
}

- (void)willPresentOnboardingFlow
{
  [(SiriSharedUISystemAssistantExperienceContainerView *)self->_containerView clearResultViewAndBackground];
  id v3 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v3 siriSAEViewCOntrollerRequestStopAttending:self];

  id v4 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v4 saeViewController:self preventOutsideTouchesFromDismissingSiri:1];
}

- (void)completedOnboardingFlowWithEnablementResult:(int64_t)a3
{
  unsigned int v5 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v5 saeViewController:self preventOutsideTouchesFromDismissingSiri:0];

  id v6 = [(SRSystemAssistantExperienceViewController *)self storedGenerativeAssistantOnboardingCompletion];

  if (v6)
  {
    if (a3 == 2)
    {
      id v10 = +[NSURL URLWithString:@"settings-navigation://com.apple.Settings.Siri/ExternalAIModel?view=signIn"];
      [(SRSystemAssistantExperienceViewController *)self siriViewControllerShouldOpenUrl:v10];
    }
    else if (a3 == 3)
    {
      id v14 = objc_alloc_init((Class)SACommandSucceeded);
      id v7 = [(SRSystemAssistantExperienceViewController *)self generativeAssistantOnboardingCommandAceID];
      [v14 setRefId:v7];

      id v8 = [(SRSystemAssistantExperienceViewController *)self storedGenerativeAssistantOnboardingCompletion];
      ((void (**)(void, id))v8)[2](v8, v14);

LABEL_10:

      return;
    }
    id v14 = objc_alloc_init((Class)SACommandFailed);
    unsigned int v11 = [(SRSystemAssistantExperienceViewController *)self generativeAssistantOnboardingCommandAceID];
    [v14 setRefId:v11];

    double v12 = [(SRSystemAssistantExperienceViewController *)self storedGenerativeAssistantOnboardingCompletion];
    ((void (**)(void, id))v12)[2](v12, v14);

    id v13 = [(SRSystemAssistantExperienceViewController *)self delegate];
    [v13 endSiriSessionForViewController:self withDismissalReason:10];

    goto LABEL_10;
  }
  id v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
    sub_1000B7144(v9);
  }
}

- (void)didSetInputType:(int64_t)a3
{
  [(SiriSharedUISystemAssistantExperienceContainerView *)self->_containerView setInputType:a3];

  [(SRSystemAssistantExperienceViewController *)self _updateHomeAffordanceVisibility];
}

- (void)didSetServerUtterance:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SRSystemAssistantExperienceViewController *)self _resultEligibleForIntelligentLightEffects];
  id v6 = [(SRSystemAssistantExperienceViewController *)self containerView];
  [v6 setResultEligibleForLightEffects:v5];

  if ([v4 count])
  {
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100014894;
    v9[3] = &unk_100143250;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    id v7 = objc_retainBlock(v9);
    id serverUtteranceUpdateBlock = self->serverUtteranceUpdateBlock;
    self->id serverUtteranceUpdateBlock = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)didSetTranscriptItems
{
  double v17 = +[NSMutableArray array];
  double v19 = +[NSMutableArray array];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(SiriSharedUISAEViewState *)self->_viewState activeConversationTranscriptItems];
  id v3 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v3)
  {
    uint64_t v5 = *(void *)v24;
    *(void *)&long long v4 = 136315138;
    long long v16 = v4;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v24 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v8 = [v7 viewController:v16];
        if (v8)
        {
          [v19 addObject:v8];
          id v9 = [v8 parentViewController];

          if (!v9)
          {
            [(SRSystemAssistantExperienceRootViewController *)self->_rootViewController addChildViewController:v8];
            [v8 didMoveToParentViewController:self->_rootViewController];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v10 = v8;
            unsigned int v11 = [v7 isHintItem];
            if (v11) {
              [v10 setIsHint:1];
            }
            [v10 setDelegate:self];
          }
          else
          {
            LOBYTE(v11) = 0;
          }
          if (objc_opt_respondsToSelector()) {
            [v8 setIsInAmbient:self->_isInAmbient];
          }
          char v12 = v11 ^ 1;
          if (!self->_isInAmbient) {
            char v12 = 1;
          }
          if (v12)
          {
            if (([v7 isHintItem] & 1) == 0)
            {
              id v14 = [v8 view];
              [v17 addObject:v14];
            }
          }
          else
          {
            id v13 = AFSiriLogContextConnection;
            if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v16;
              id v28 = "-[SRSystemAssistantExperienceViewController didSetTranscriptItems]";
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #ambient removed hint view in ambient mode from conversationSnippets", buf, 0xCu);
            }
          }
          if (!v9) {
            [v8 didMoveToParentViewController:self->_rootViewController];
          }
        }
      }
      id v3 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v3);
  }

  objc_initWeak((id *)buf, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100014CB0;
  v20[3] = &unk_100143250;
  objc_copyWeak(&v22, (id *)buf);
  id v15 = v19;
  id v21 = v15;
  [(SRSystemAssistantExperienceViewController *)self _setSmartDialogConversationSnippetViews:v17 withCompletionBlock:v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

- (void)smartDialogContentDidChange
{
  id v2 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v2 contentDidUpdate];
}

- (void)didPresentContent
{
  id v3 = [(SRSystemAssistantExperienceViewController *)self delegate];
  [v3 didPresentContentForSAEViewController:self];
}

- (void)setSmartDialogCardBlock:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id smartDialogCardBlock = self->smartDialogCardBlock;
  self->id smartDialogCardBlock = v4;

  _objc_release_x1(v4, smartDialogCardBlock);
}

- (void)willPresentResult
{
  [(SRSystemAssistantExperienceViewController *)self _popToRootViewControllerIfNeeded];
  [(SRSystemAssistantExperienceViewController *)self endTypeToSiriLatencyStateIfNeeded];

  [(SRSystemAssistantExperienceViewController *)self resignKeyboardIfNeeded];
}

- (BOOL)hasPendingUpdates
{
  return self->serverUtteranceUpdateBlock
      || self->snippetUpdateBlock
      || self->smartDialogCardBlock
      || self->smartDialogPluginBlock != 0;
}

- (id)filterTranscriptItemsForSAEDialogBoxContent:(id)a3
{
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
  if (!v3) {
    goto LABEL_44;
  }
  id v5 = v3;
  uint64_t v6 = *(void *)v59;
  *(void *)&long long v4 = 136315394;
  long long v42 = v4;
  uint64_t v45 = *(void *)v59;
  do
  {
    id v7 = 0;
    id v44 = v5;
    do
    {
      if (*(void *)v59 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(void **)(*((void *)&v58 + 1) + 8 * (void)v7);
      id v9 = [v8 aceObject:v42];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_42;
      }
      unsigned int v11 = [v8 aceObject];
      char v12 = [v11 siriui_card_compact];
      id v13 = [v12 backingCard];
      id v14 = [v13 cardSections];
      CGPoint v51 = v11;
      unsigned __int8 v48 = v8;
      if (v14) {
        [v11 siriui_card_compact];
      }
      else {
      id v15 = [v11 siriui_card];
      }
      long long v16 = [v15 backingCard];

      id v52 = [v16 copy];
      id v53 = objc_alloc_init((Class)NSMutableArray);
      id v17 = objc_alloc_init((Class)NSMutableArray);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v18 = [v16 cardSections];
      id v19 = [v18 countByEnumeratingWithState:&v54 objects:v66 count:16];
      BOOL v50 = v19 != 0;
      if (v19)
      {
        id v20 = v19;
        int v49 = v16;
        CGRect v47 = v7;
        char v21 = 0;
        uint64_t v22 = *(void *)v55;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v55 != v22) {
              objc_enumerationMutation(v18);
            }
            long long v24 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            unsigned int v25 = [v24 shouldShowInSmartDialog];
            objc_opt_class();
            char v26 = objc_opt_isKindOfClass();
            if (v25)
            {
              if (v26)
              {
                id v27 = [v24 cardSections];
                [v17 addObjectsFromArray:v27];
              }
              else
              {
                [v17 addObject:v24];
              }
              char v21 = 1;
            }
            else if (v26)
            {
              id v28 = v24;
              unsigned __int8 v29 = [v28 cardSections];
              id v30 = [v29 count];

              if (v30)
              {
                double v31 = [v28 cardSections];
                int v32 = [v31 objectAtIndexedSubscript:0];

                if ([v32 shouldShowInSmartDialog])
                {
                  unsigned int v33 = [v28 cardSections];
                  [v17 addObjectsFromArray:v33];

                  char v21 = 1;
                }
              }
            }
            else
            {
              [v53 addObject:v24];
            }
          }
          id v20 = [v18 countByEnumeratingWithState:&v54 objects:v66 count:16];
        }
        while (v20);

        if ((v21 & 1) == 0)
        {
          BOOL v40 = 0;
          id v5 = v44;
          uint64_t v6 = v45;
          id v7 = v47;
          long long v35 = v51;
          long long v16 = v49;
          goto LABEL_41;
        }
        id v34 = AFSiriLogContextConnection;
        long long v35 = v51;
        if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v42;
          v63 = "-[SRSystemAssistantExperienceViewController filterTranscriptItemsForSAEDialogBoxContent:]";
          __int16 v64 = 2112;
          id v65 = v53;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%s #dialogbox found card content for dialog box: %@", buf, 0x16u);
        }
        [v49 setCardSections:v53];
        id v18 = [v51 copy];
        id v36 = [objc_alloc((Class)_SFPBCard) initWithFacade:v49];
        uint64_t v37 = [v36 data];
        [v18 setCardData:v37];

        long long v38 = [v48 viewController];
        objc_opt_class();
        LOBYTE(v37) = objc_opt_isKindOfClass();

        id v5 = v44;
        id v7 = v47;
        if (v37)
        {
          id v39 = [v48 viewController];
          if ([v53 count]) {
            [v39 setSnippet:v18];
          }
          else {
            [v48 setViewController:0];
          }
        }
        [v52 setCardSections:v17];
        id v43 = v52;
        long long v16 = v49;
      }
      else
      {
        long long v35 = v51;
      }

      BOOL v40 = v50;
      uint64_t v6 = v45;
LABEL_41:

      if (v40) {
        goto LABEL_45;
      }
LABEL_42:
      id v7 = (char *)v7 + 1;
    }
    while (v7 != v5);
    id v5 = [obj countByEnumeratingWithState:&v58 objects:v67 count:16];
  }
  while (v5);
LABEL_44:
  id v43 = 0;
LABEL_45:

  return v43;
}

- (void)setSmartDialogPluginBlock:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id smartDialogPluginBlock = self->smartDialogPluginBlock;
  self->id smartDialogPluginBlock = v4;

  _objc_release_x1(v4, smartDialogPluginBlock);
}

- (BOOL)alwaysShowRecognizedSpeech
{
  id v2 = [(SRSystemAssistantExperienceViewController *)self delegate];
  unsigned __int8 v3 = [v2 alwaysShowRecognizedSpeech];

  return v3;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (SiriSharedUISAEViewState)viewState
{
  return self->_viewState;
}

- (void)setViewState:(id)a3
{
}

- (SRSystemAssistantExperienceViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SRSystemAssistantExperienceViewControllerDelegate *)WeakRetained;
}

- (SiriUINavigationController)_navigationController
{
  return self->_navigationController;
}

- (SRSystemAssistantExperienceRootViewController)_rootViewController
{
  return self->_rootViewController;
}

- (SiriSharedUICompactResultViewController)_resultViewController
{
  return self->_resultViewController;
}

- (UIViewController)_queuedNavigationContentViewController
{
  return self->_queuedNavigationContentViewController;
}

- (void)_setQueuedNavigationContentViewController:(id)a3
{
}

- (CGSize)activeSmartDialogSize
{
  double width = self->_activeSmartDialogSize.width;
  double height = self->_activeSmartDialogSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setActiveSmartDialogSize:(CGSize)a3
{
  self->_activeSmartDialogSize = a3;
}

- (SiriSharedUISystemAssistantExperienceContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (SiriSharedUISystemAssistantExperienceContainerView)textFieldContainerView
{
  return self->_textFieldContainerView;
}

- (void)setTextFieldContainerView:(id)a3
{
}

- (_TtC4Siri30SystemAssistantPromptEntryView)promptEntryView
{
  return self->_promptEntryView;
}

- (void)setPromptEntryView:(id)a3
{
}

- (BOOL)_snippetViewControllerRequestsStatusViewHidden
{
  return self->_snippetViewControllerRequestsStatusViewHidden;
}

- (SRCompactKeyboardState)_keyboardState
{
  return self->_keyboardState;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_bottomContentInsetComponents
{
  double external = self->_bottomContentInsetComponents.external;
  double keyboard = self->_bottomContentInsetComponents.keyboard;
  result.var1 = keyboard;
  result.double var0 = external;
  return result;
}

- (SiriSharedUICompactHostingInstrumentationSupplement)instrumentationSupplement
{
  return self->_instrumentationSupplement;
}

- (SASRequestOptions)activeRequestOptions
{
  return self->_activeRequestOptions;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  self->_isInAmbientInteractivitCGFloat y = a3;
}

- (id)storedGenerativeAssistantOnboardingCompletion
{
  return self->_storedGenerativeAssistantOnboardingCompletion;
}

- (void)setStoredGenerativeAssistantOnboardingCompletion:(id)a3
{
}

- (NSString)generativeAssistantOnboardingCommandAceID
{
  return self->_generativeAssistantOnboardingCommandAceID;
}

- (void)setGenerativeAssistantOnboardingCommandAceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generativeAssistantOnboardingCommandAceID, 0);
  objc_storeStrong(&self->_storedGenerativeAssistantOnboardingCompletion, 0);
  objc_storeStrong((id *)&self->_activeRequestOptions, 0);
  objc_storeStrong((id *)&self->_instrumentationSupplement, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_promptEntryView, 0);
  objc_storeStrong((id *)&self->_textFieldContainerView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_queuedNavigationContentViewController, 0);
  objc_storeStrong((id *)&self->_resultViewController, 0);
  objc_storeStrong((id *)&self->_rootViewController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewState, 0);
  objc_storeStrong((id *)&self->_feedbackButton, 0);
  objc_storeStrong((id *)&self->_montaraOnboardingManager, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_storeStrong((id *)&self->_typeToSiriKeyboardReadinessObserver, 0);
  objc_storeStrong((id *)&self->_suggestionsSpringAnimationBehavior, 0);
  objc_storeStrong((id *)&self->_postPillMergeSpringAnimationBehavior, 0);
  objc_storeStrong((id *)&self->_pillMergeSpringAnimationBehavior, 0);
  objc_storeStrong((id *)&self->_defaultSpringAnimationBehavior, 0);
  objc_storeStrong(&self->renderResultBlock, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong(&self->smartDialogPluginBlock, 0);
  objc_storeStrong(&self->smartDialogCardBlock, 0);
  objc_storeStrong(&self->snippetUpdateBlock, 0);
  objc_storeStrong(&self->serverUtteranceUpdateBlock, 0);
  objc_storeStrong((id *)&self->_suggestionViews, 0);
  objc_storeStrong((id *)&self->_suggestionTexts, 0);
  objc_storeStrong((id *)&self->_suggestionsViewProvider, 0);

  objc_storeStrong((id *)&self->_fullScreenEffects, 0);
}

@end