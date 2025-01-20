@interface SRCompactViewController
- ($F24F406B2B787EFB06265DBA3D28CBD5)_bottomContentInsetComponents;
- (BOOL)_alwaysObscureBackgroundContentWhenActive;
- (BOOL)_canShowWhileLocked;
- (BOOL)_contentDiffersBetweenPlatterItems:(id)a3 andItems:(id)a4;
- (BOOL)_hidesStatusViewForInputType:(int64_t)a3;
- (BOOL)_hidesTextRequestViewForInputType:(int64_t)a3;
- (BOOL)_keyboardHasContentAtPoint:(CGPoint)a3;
- (BOOL)_navigationBarHasContentAtPoint:(CGPoint)a3;
- (BOOL)_shouldMoveViewStackForTapToEdit;
- (BOOL)_snippetViewControllerRequestsStatusViewHidden;
- (BOOL)_updateActiveTranscriptItems:(id)a3;
- (BOOL)_usesDefaultNavigationBar;
- (BOOL)contentDiffersBetweenItems:(id)a3 andItems:(id)a4;
- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3;
- (BOOL)hasContentAtPoint:(CGPoint)a3;
- (BOOL)isInAmbient;
- (BOOL)isInAmbientInteractivity;
- (BOOL)requireFinalSpeechHypothesisBeforeAppearance;
- (BOOL)shouldBeginDismissalGestureRecognizer:(id)a3 withTouch:(id)a4;
- (BOOL)siriSnippetViewControllerIsVisible:(id)a3;
- (BOOL)siriViewControllerShouldPreventUserInteraction:(id)a3;
- (CGRect)_convertRectFromKeyboard:(CGRect)a3;
- (CGRect)_keyboardFrame;
- (CGSize)maxSizeForSnippet;
- (CGSize)siriViewControllerVisibleContentArea:(id)a3;
- (NSArray)_activeAdditionalPlatterTranscriptItems;
- (NSArray)_activeConversationTranscriptItems;
- (NSArray)_activeTranscriptItems;
- (NSArray)_serverUtterances;
- (SASRequestOptions)activeRequestOptions;
- (SRCompactEditableUtterancePresenter)_editableUtterancePresenter;
- (SRCompactKeyboardState)_keyboardState;
- (SRCompactNavigationStackLayoutControlling)_navigationStackLayoutController;
- (SRCompactTextRequestViewController)_textRequestViewController;
- (SRCompactViewController)init;
- (SRCompactViewControllerDelegate)delegate;
- (SRUIFSpeechRecognitionHypothesis)_speechRecognitionHypothesis;
- (SiriSharedUICompactHostingInstrumentationSupplement)instrumentationSupplement;
- (SiriSharedUICompactResultViewController)_resultViewController;
- (SiriSharedUICompactView)_compactView;
- (SiriSharedUIPanDismissalGestureRecognizer)_dismissalPanGestureRecognizer;
- (SiriSharedUIViewStackContainerController)_viewStackContainerController;
- (SiriUIBackgroundBlurViewController)backgroundBlurViewController;
- (SiriUINavigationController)_navigationController;
- (UIEdgeInsets)siriViewControllerBackgroundInsets:(id)a3;
- (UIViewController)_queuedNavigationContentViewController;
- (double)boundingWidthForSnippetViewController:(id)a3;
- (double)lastPresentationTime;
- (double)maximumHeightForCompactView:(id)a3;
- (double)siriViewControllerExpectedWidth:(id)a3;
- (double)statusBarHeightForSiriViewController:(id)a3;
- (id)_instrumentationManager;
- (id)additionalSpeechInterpretationsForSiriViewController:(id)a3;
- (id)localeForSiriViewController:(id)a3;
- (id)parserSpeakableObjectProviderForCompactView:(id)a3;
- (id)persistentDataStoreForSiriViewController:(id)a3;
- (id)siriViewController:(id)a3 disambiguationItemForListItem:(id)a4 disambiguationKey:(id)a5;
- (id)siriViewController:(id)a3 domainObjectForIdentifier:(id)a4;
- (id)siriViewController:(id)a3 filteredDisambiguationListItems:(id)a4;
- (id)siriViewController:(id)a3 listItemToPickInAutodisambiguationForListItems:(id)a4;
- (id)siriViewControllerEffectiveBundleForCoreLocation:(id)a3;
- (int)viewRegionForPresentedAceObject:(id)a3;
- (int64_t)_inputType;
- (void)_didEndEditing;
- (void)_keyboardWillHideForAmbient:(id)a3;
- (void)_keyboardWillShowForAmbient:(id)a3;
- (void)_pushQueuedNavigationContentViewController;
- (void)_recursivelyNotifyVisibleViewControllers:(id)a3 withBlock:(id)a4;
- (void)_registerForAmbientPresentationTraitChange;
- (void)_requestKeyboardWithCompletion:(id)a3;
- (void)_requestPresentationBackgroundBlurVisible:(BOOL)a3 forReason:(int64_t)a4;
- (void)_setActiveAdditionalPlatterTranscriptItems:(id)a3;
- (void)_setActiveConversationTranscriptItems:(id)a3;
- (void)_setActiveTranscriptItems:(id)a3;
- (void)_setBottomContentInsetComponents:(id)a3;
- (void)_setBottomContentInsetComponents:(id)a3 animatedWithDuration:(double)a4 animationOptions:(unint64_t)a5;
- (void)_setDismissalPanGestureRecognizer:(id)a3;
- (void)_setInputType:(int64_t)a3;
- (void)_setKeyboardState:(id)a3;
- (void)_setNavigationStackLayoutController:(id)a3;
- (void)_setQueuedNavigationContentViewController:(id)a3;
- (void)_setServerUtterances:(id)a3;
- (void)_setSnippetViewControllerRequestsStatusViewHidden:(BOOL)a3;
- (void)_setSpeechRecognitionHypothesis:(id)a3;
- (void)_setStatusViewHidden:(BOOL)a3;
- (void)_updateAdditionalSafeAreaInsetsForNavigationContentViewController:(id)a3;
- (void)_updateAmbientAvailability;
- (void)_updateBottomContentInsetKeyboardComponent;
- (void)_updateCompactViewSize;
- (void)_updateIsInAmbientWithInteractivity:(BOOL)a3;
- (void)_updateKeyboardStateFromNotification:(id)a3;
- (void)_updateStatusViewVisibility;
- (void)_updateTextRequestViewVisibility;
- (void)_willBeginEditingOfType:(int64_t)a3;
- (void)blurFromRootNavigationTransitionController:(id)a3 requestBackgroundBlurViewVisible:(BOOL)a4;
- (void)blurFromRootNavigationTransitionController:(id)a3 requestHostBlurVisible:(BOOL)a4 requestPresentationBlurVisible:(BOOL)a5;
- (void)cancelSpeakingForSiriViewController:(id)a3;
- (void)compactView:(id)a3 didChangeEffectiveBottomContentInsetAnimatedWithContext:(id)a4;
- (void)compactView:(id)a3 viewDidAppearForAceObject:(id)a4;
- (void)compactView:(id)a3 viewDidDisappearForAceObject:(id)a4;
- (void)compactViewModelDidChange:(id)a3 withDiff:(unint64_t)a4;
- (void)didResignFirstResponderFromUtterancePresenter:(id)a3;
- (void)dismissalGestureRecognizerDidFinish:(id)a3 shouldDismiss:(BOOL)a4;
- (void)editableUtterancePresenter:(id)a3 didFinishEditingWithText:(id)a4 selectionResults:(id)a5 shouldStartNewRequest:(BOOL)a6;
- (void)editableUtterancePresenter:(id)a3 openURL:(id)a4;
- (void)editableUtterancePresenter:(id)a3 requestsKeyboardWithCompletion:(id)a4;
- (void)loadView;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)scrollDidBeginFromView:(id)a3;
- (void)scrollDidEndFromView:(id)a3;
- (void)setActiveRequestOptions:(id)a3;
- (void)setBackgroundBlurViewController:(id)a3;
- (void)setBottomContentInset:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setEditableUtterancePresenter:(id)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setTopContentInset:(double)a3 animated:(BOOL)a4;
- (void)showFullScreenEffect:(id)a3;
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
- (void)siriSnippetViewControllerViewDidLoad:(id)a3;
- (void)siriViewController:(id)a3 openURL:(id)a4 completion:(id)a5;
- (void)siriViewController:(id)a3 performAceCommands:(id)a4;
- (void)siriViewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5;
- (void)siriViewController:(id)a3 speakText:(id)a4 completion:(id)a5;
- (void)siriViewControllerDidEndEditing:(id)a3;
- (void)siriViewControllerHeightDidChange:(id)a3;
- (void)siriViewControllerHeightDidChange:(id)a3 pinTopOfSnippet:(BOOL)a4;
- (void)siriViewControllerViewDidAppear:(id)a3 isTopLevelViewController:(BOOL)a4;
- (void)siriViewControllerViewDidDisappear:(id)a3 isTopLevelViewController:(BOOL)a4;
- (void)siriViewControllerWillBeginEditing:(id)a3;
- (void)siriWillStartRequest;
- (void)tapToEditRequestedFromView:(id)a3;
- (void)textRequestController:(id)a3 requestsKeyboardWithCompletion:(id)a4;
- (void)textRequestController:(id)a3 siriRequestCommittedWithText:(id)a4;
- (void)textRequestControllerDidEndEditing:(id)a3;
- (void)textRequestControllerDidEndTextEditMenuInteraction:(id)a3;
- (void)textRequestControllerWillBeginEditing:(id)a3;
- (void)textRequestControllerWillBeginTextEditMenuInteraction:(id)a3;
- (void)updateTopInset:(double)a3 animated:(BOOL)a4;
- (void)userDrilledIntoSnippet;
- (void)userTouchedSnippet;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBeginEditingFromUtterancePresenter:(id)a3;
- (void)willDismissEditableUtterancePresenter:(id)a3 transitionCoordinator:(id)a4;
@end

@implementation SRCompactViewController

- (SRCompactViewController)init
{
  v22.receiver = self;
  v22.super_class = (Class)SRCompactViewController;
  v2 = [(SRCompactViewController *)&v22 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = (SiriSharedUIViewStackContainerController *)objc_alloc_init((Class)SiriSharedUIViewStackContainerController);
    viewStackContainerController = v2->_viewStackContainerController;
    v2->_viewStackContainerController = v3;

    v5 = (SiriSharedUICompactResultViewController *)objc_alloc_init((Class)SiriSharedUICompactResultViewController);
    resultViewController = v2->_resultViewController;
    v2->_resultViewController = v5;

    v7 = objc_alloc_init(SRCompactTextRequestViewController);
    textRequestViewController = v2->_textRequestViewController;
    v2->_textRequestViewController = v7;

    v9 = [(SRCompactTextRequestViewController *)v2->_textRequestViewController view];
    [v9 recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];

    id v10 = objc_alloc((Class)SiriUINavigationController);
    v11 = [(SRCompactViewController *)v2 _viewStackContainerController];
    v12 = (SiriUINavigationController *)[v10 initWithRootViewController:v11];
    navigationController = v2->_navigationController;
    v2->_navigationController = v12;

    [(SiriUINavigationController *)v2->_navigationController setDelegate:v2];
    v14 = [(SiriUINavigationController *)v2->_navigationController view];
    [v14 recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];

    v15 = [(SiriUINavigationController *)v2->_navigationController navigationBar];
    [v15 recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];

    v2->_siriViewControllerIsEditing = 0;
    id v16 = objc_alloc_init((Class)SiriUIBackgroundBlurViewController);
    [(SRCompactViewController *)v2 setBackgroundBlurViewController:v16];

    [(SRCompactTextRequestViewController *)v2->_textRequestViewController setDelegate:v2];
    id v17 = objc_alloc((Class)SiriSharedUICompactHostingInstrumentationSupplement);
    v18 = [(SRCompactViewController *)v2 _instrumentationManager];
    v19 = (SiriSharedUICompactHostingInstrumentationSupplement *)[v17 initWithInstrumentationManager:v18];
    instrumentationSupplement = v2->_instrumentationSupplement;
    v2->_instrumentationSupplement = v19;

    [(SRCompactViewController *)v2 _registerForAmbientPresentationTraitChange];
  }
  return v2;
}

- (SiriSharedUICompactView)_compactView
{
  v2 = [(SRCompactViewController *)self view];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = +[NSString stringWithFormat:@"Expected -view to return an SiriSharedUICompactView instance, but got %@ instead", v2];
    id v5 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v4 userInfo:0];

    objc_exception_throw(v5);
  }

  return (SiriSharedUICompactView *)v2;
}

- (void)updateTopInset:(double)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_topInset = a3;
  if ((char *)[UIApp activeInterfaceOrientation] - 1 <= (char *)1)
  {
    v7 = [(SRCompactViewController *)self view];
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
    v14[2] = sub_10001F348;
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
    v38 = "-[SRCompactViewController loadView]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  BOOL v4 = [(SRCompactViewController *)self backgroundBlurViewController];
  v30 = [v4 view];
  v31 = v4;
  [(SRCompactViewController *)self addChildViewController:v4];
  id v5 = [(SRCompactViewController *)self _navigationController];
  v29 = [v5 view];
  v27 = v5;
  [(SRCompactViewController *)self addChildViewController:v5];
  v6 = [(SRCompactViewController *)self _viewStackContainerController];
  v28 = [v6 viewStackContainer];
  v7 = [(SRCompactViewController *)self _resultViewController];
  v23 = [v7 compactResultView];
  v25 = v7;
  v26 = v6;
  [v6 addChildViewController:v7];
  v8 = [(SRCompactViewController *)self _textRequestViewController];
  objc_super v22 = [v8 view];
  if (v8) {
    [(SRCompactViewController *)self addChildViewController:v8];
  }
  v24 = v8;
  id v9 = objc_alloc((Class)SiriSharedUICompactConversationView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v13 = [v9 initWithFrame:CGRectZero.origin.x, y, width, height];
  v14 = +[NSMutableArray array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v15 = +[SiriSharedUITranscriptItem additionalContentViewPlatterCategories];
  id v16 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v33;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [objc_alloc((Class)SiriSharedUICompactAdditionalContentView) initWithFrame:CGRectZero.origin.x, y, width, height];
        [v14 addObject:v20];
      }
      id v17 = [v15 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v17);
  }

  id v21 = [objc_alloc((Class)SiriSharedUICompactView) initWithFrame:v30 backgroundBlurView:v29 navigationView:v23 resultView:v13 conversationView:v14 additionalContentViews:v22 textRequestView:v28 viewStackContainer:CGRectZero.origin.x, y, width, height];
  [v21 setAutoresizingMask:18];
  [v21 setDelegate:self];
  [v31 didMoveToParentViewController:self];
  [v27 didMoveToParentViewController:self];
  [v25 didMoveToParentViewController:v26];
  [v24 didMoveToParentViewController:self];
  [(SRCompactViewController *)self setView:v21];
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)SRCompactViewController;
  [(SRCompactViewController *)&v22 viewDidLoad];
  v3 = [(SRCompactViewController *)self view];
  [v3 recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];

  int IsPad = SiriUIDeviceIsPad();
  if (IsPad)
  {
    id v5 = [SRCardStackNavigationTransitionController alloc];
    v6 = [(SRCompactViewController *)self _resultViewController];
    v7 = [(SRCardStackNavigationTransitionController *)v5 initWithCompactResultViewController:v6];

    [(SRCompactViewController *)self _setNavigationStackLayoutController:v7];
    uint64_t v8 = 2;
  }
  else
  {
    id v9 = objc_alloc((Class)SiriUIMultiNavigationTransitionController);
    BOOL v10 = objc_alloc_init(SRBarSlideNavigationTransitionController);
    v7 = (SRCardStackNavigationTransitionController *)[v9 initWithPrimaryTransitionController:v10];

    double v11 = [[SRBlurFromRootNavigationTransitionController alloc] initWithDelegate:self];
    [(SRCardStackNavigationTransitionController *)v7 addAdditionalCoordinationController:v11];

    uint64_t v8 = 1;
  }
  double v12 = [(SRCompactViewController *)self _navigationController];
  [v12 setTransitionController:v7];

  id v13 = (SiriSharedUIPanDismissalGestureRecognizer *)[objc_alloc((Class)SiriSharedUIPanDismissalGestureRecognizer) initWithDismissalDelegate:self dismissalStyle:v8];
  dismissalPanGestureRecognizer = self->_dismissalPanGestureRecognizer;
  self->_dismissalPanGestureRecognizer = v13;

  if (IsPad)
  {
    v15 = [(SRCompactViewController *)self view];
    id v16 = [v15 layer];
    [v16 setAllowsGroupOpacity:0];

    id v17 = [(SRCompactViewController *)self view];
    [v17 addGestureRecognizer:self->_dismissalPanGestureRecognizer];
  }
  else
  {
    id v17 = [(SRCompactViewController *)self _compactView];
    uint64_t v18 = [v17 resultView];
    v19 = [v18 hostingView];
    id v20 = [v19 layer];
    [v20 setAllowsGroupOpacity:0];

    id v21 = [v17 resultView];
    [v21 setDismissalGestureRecognizer:self->_dismissalPanGestureRecognizer];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SRCompactViewController;
  [(SRCompactViewController *)&v14 viewWillAppear:a3];
  BOOL v4 = +[NSNotificationCenter defaultCenter];
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
        [v4 addObserver:self selector:@selector(_updateKeyboardStateFromNotification:) name:*(void *)(*((void *)&v10 + 1) + 8 * i) object:0 v10];
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
  v8.receiver = self;
  v8.super_class = (Class)SRCompactViewController;
  [(SRCompactViewController *)&v8 viewDidAppear:a3];
  BOOL v4 = +[NSProcessInfo processInfo];
  [v4 systemUptime];
  self->_presentationTime = v5;

  if ([(SRCompactViewController *)self _alwaysObscureBackgroundContentWhenActive])
  {
    id v6 = [(SRCompactViewController *)self delegate];
    [v6 viewController:self requestsHostBackgroundBlurVisible:1 reason:1 fence:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained viewControllerDidPresentUserInterface:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SRCompactViewController;
  [(SRCompactViewController *)&v5 viewWillDisappear:a3];
  [(SRCompactEditableUtterancePresenter *)self->_editableUtterancePresenter dismissEditableUtteranceViewControllerAndShouldStartNewRequest:1 completion:0];
  BOOL v4 = [(SRCompactViewController *)self delegate];
  [v4 viewControllerViewWillDisappear:self];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v28.receiver = self;
  v28.super_class = (Class)SRCompactViewController;
  [(SRCompactViewController *)&v28 viewDidDisappear:a3];
  BOOL v4 = [(SRCompactViewController *)self _speechRecognitionHypothesis];

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v6 = [(SRUIFSpeechRecognitionHypothesis *)self->_speechRecognitionHypothesis backingAceObject];
    [WeakRetained compactViewController:self viewDidDisappearForAceObject:v6];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = self->_serverUtterances;
  id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    do
    {
      long long v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * (void)v11);
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        [v13 compactViewController:self viewDidDisappearForAceObject:v12];

        long long v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v9);
  }

  objc_super v14 = +[NSNotificationCenter defaultCenter];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v15 = sub_1000097A0();
  id v16 = [v15 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        [v14 removeObserver:self name:*(void *)(*((void *)&v20 + 1) + 8 * (void)v19) object:0];
        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v17);
  }

  [v14 removeObserver:self name:UIKeyboardWillShowNotification object:0];
  [v14 removeObserver:self name:UIKeyboardWillHideNotification object:0];
  [(SRCompactViewController *)self _setKeyboardState:0];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SRCompactViewController;
  [(SRCompactViewController *)&v3 viewWillLayoutSubviews];
  [(SRCompactViewController *)self _updateCompactViewSize];
}

- (void)_updateCompactViewSize
{
  objc_super v3 = [(SRCompactViewController *)self view];
  long long v27 = [v3 window];

  uint64_t IsPad = SiriSharedUIDeviceIsPad();
  if (IsPad)
  {
    objc_super v5 = v27;
  }
  else
  {
    uint64_t IsPad = SiriSharedUIDeviceIsMac();
    objc_super v5 = v27;
    if (!IsPad) {
      goto LABEL_9;
    }
  }
  if (v5)
  {
    [v5 bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    objc_super v14 = [v27 windowScene];
    [v14 interfaceOrientation];
    SiriSharedUICompactSlideOverContentSpacingOnPad();
    double v16 = v15;
    double v18 = v17;

    double v19 = v16 + v18 + SiriSharedUICompactLeftPaddingForShadowOutsetsiPad;
    LODWORD(v14) = SiriLanguageIsRTL();
    long long v20 = [(SRCompactViewController *)self view];
    CGFloat v21 = v7;
    CGFloat v22 = v9;
    CGFloat v23 = v11;
    CGFloat v24 = v13;
    if (v14)
    {
      double Height = CGRectGetHeight(*(CGRect *)&v21);
      double v26 = 0.0;
    }
    else
    {
      double v26 = CGRectGetWidth(*(CGRect *)&v21) - v19;
      v29.origin.x = v7;
      v29.origin.double y = v9;
      v29.size.double width = v11;
      v29.size.double height = v13;
      double Height = CGRectGetHeight(v29);
    }
    [v20 setFrame:v26, 0.0, v19, Height];

    objc_super v5 = v27;
  }
LABEL_9:

  _objc_release_x1(IsPad, v5);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)SRCompactViewController;
  id v7 = a4;
  -[SRCompactViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  [(SRCompactViewController *)self _updateAmbientAvailability];
  double v8 = [(SRCompactViewController *)self _navigationStackLayoutController];
  v9[4] = v8;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100020200;
  v10[3] = &unk_100143570;
  v10[4] = v8;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100020208;
  v9[3] = &unk_100143570;
  [v7 animateAlongsideTransition:v10 completion:v9];
}

- (void)compactViewModelDidChange:(id)a3 withDiff:(unint64_t)a4
{
  char v38 = a4;
  id v4 = a3;
  id v36 = [v4 inputType];
  v42 = v4;
  v41 = [v4 resultTranscriptItems];
  v37 = [v4 conversationTranscriptItems];
  objc_super v5 = [v4 additionalPlatterTranscriptItems];
  v40 = [v4 serverUtterances];
  v39 = [v4 speechRecognitionHypothesis];
  double v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    double v8 = SiriSharedUIViewModelInputTypeGetDescription();
    *(_DWORD *)buf = 136315394;
    v60 = "-[SRCompactViewController compactViewModelDidChange:withDiff:]";
    __int16 v61 = 2112;
    v62 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #compact Setting input type to : %@", buf, 0x16u);
  }
  CGFloat v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[SRCompactViewController compactViewModelDidChange:withDiff:]";
    __int16 v61 = 2112;
    v62 = v41;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s #compact Setting active transcript items to : %@", buf, 0x16u);
  }
  double v10 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[SRCompactViewController compactViewModelDidChange:withDiff:]";
    __int16 v61 = 2112;
    v62 = v37;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s #compact Setting active conversation transcript items to : %@", buf, 0x16u);
  }
  objc_super v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[SRCompactViewController compactViewModelDidChange:withDiff:]";
    __int16 v61 = 2112;
    v62 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s #compact Setting additional active platter transcript items to : %@", buf, 0x16u);
  }
  double v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[SRCompactViewController compactViewModelDidChange:withDiff:]";
    __int16 v61 = 2112;
    v62 = v40;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s #compact Setting server utterances to : %@", buf, 0x16u);
  }
  CGFloat v13 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v60 = "-[SRCompactViewController compactViewModelDidChange:withDiff:]";
    __int16 v61 = 2112;
    v62 = v39;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s #compact Setting speech recognition hypothesis to : %@", buf, 0x16u);
  }
  BOOL v35 = [v41 count] != 0;
  unsigned int v14 = [(SRCompactViewController *)self requireFinalSpeechHypothesisBeforeAppearance];
  double v15 = [v39 userUtterance];

  if (v14 && ([v39 isFinal] & 1) != 0) {
    int v16 = 1;
  }
  else {
    int v16 = v14 ^ 1;
  }
  if (!v15) {
    int v16 = 0;
  }
  int v34 = v16;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v17 = v5;
  uint64_t v18 = 0;
  id v19 = [v17 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v54;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v54 != v20) {
          objc_enumerationMutation(v17);
        }
        v18 += (uint64_t)[*(id *)(*((void *)&v53 + 1) + 8 * i) count];
      }
      id v19 = [v17 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v19);
  }

  if ([v40 count] && self->_isInAmbient)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v22 = v40;
    int v23 = 0;
    id v24 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v50;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v50 != v25) {
            objc_enumerationMutation(v22);
          }
          long long v27 = [*(id *)(*((void *)&v49 + 1) + 8 * (void)j) dialogIdentifier];
          unsigned int v28 = [v27 isEqual:@"PlaybackControls#SilenceInterstitials"];

          if (v28) {
            LOBYTE(v23) = 1;
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v24);
      v23 &= 1u;
    }
  }
  else
  {
    int v23 = 0;
  }
  if ([v41 count] || objc_msgSend(v37, "count") || v18 > 0) {
    goto LABEL_41;
  }
  id v32 = [v40 count];
  int v33 = v23 ^ 1;
  if (!v32) {
    int v33 = 0;
  }
  if ((v33 | v34) == 1)
  {
LABEL_41:
    CGRect v29 = [(SRCompactViewController *)self delegate];
    [v29 didPresentContentForCompactViewController:self];
  }
  if ((v38 & 1) != 0 && [v41 count])
  {
    v30 = [(SRCompactViewController *)self delegate];
    [v30 didBeginProcessingConversationItems];
  }
  objc_initWeak((id *)buf, self);
  v31 = [(SRCompactViewController *)self _compactView];
  objc_copyWeak(v44, (id *)buf);
  char v45 = v38 & 1;
  v44[1] = v36;
  BOOL v46 = (v38 & 0x2F) != 0;
  BOOL v47 = v35;
  BOOL v48 = (v38 & 0x20) != 0;
  [v31 prepareForUpdatesWithDiff:updateBlock:];

  objc_destroyWeak(v44);
  objc_destroyWeak((id *)buf);
}

- (BOOL)requireFinalSpeechHypothesisBeforeAppearance
{
  return !self->_isInAmbient;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);

  [(SRCompactViewController *)self _updateStatusViewVisibility];
}

- (BOOL)_updateActiveTranscriptItems:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SRCompactViewController *)self _compactView];
  if ([(NSArray *)self->_activeTranscriptItems isEqualToArray:v4])
  {
LABEL_19:
    [v5 setShowSnippetView:1 animated:1];
    BOOL v26 = 0;
    goto LABEL_33;
  }
  if (![(SRCompactViewController *)self contentDiffersBetweenItems:self->_activeTranscriptItems andItems:v4])
  {
    uint64_t v25 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v50 = "-[SRCompactViewController _updateActiveTranscriptItems:]";
      __int16 v51 = 2112;
      id v52 = v4;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s #compact: Transcript items %@ have the same content, not updating our compact view", buf, 0x16u);
    }
    goto LABEL_19;
  }
  id v36 = v5;
  double v6 = [(SRCompactViewController *)self _navigationController];
  id v7 = [v6 popToRootViewControllerAnimated:1];

  id v37 = v4;
  double v8 = (NSArray *)[v4 copy];
  activeTranscriptItems = self->_activeTranscriptItems;
  self->_activeTranscriptItems = v8;

  double v10 = +[NSMutableArray array];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obj = self->_activeTranscriptItems;
  id v11 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v11)
  {
    id v12 = v11;
    CGFloat v13 = 0;
    uint64_t v14 = *(void *)v44;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(obj);
        }
        int v16 = [*(id *)(*((void *)&v43 + 1) + 8 * i) viewController];
        [v10 addObject:v16];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v17 = v14;
          uint64_t v18 = v10;
          id v19 = v13;
          id v20 = v16;
          CGFloat v21 = self;
          [v20 setDelegate:self];
          id v22 = [v20 sashItem];
          int v23 = [v22 applicationBundleIdentifier];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v24 = [v20 appBundleId];

            int v23 = (void *)v24;
          }

          CGFloat v13 = v23;
          self = v21;
          double v10 = v18;
          uint64_t v14 = v17;
        }
        if (objc_opt_respondsToSelector()) {
          [v16 setIsInAmbient:self->_isInAmbient];
        }
      }
      id v12 = [(NSArray *)obj countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v12);
  }
  else
  {
    CGFloat v13 = 0;
  }

  objc_super v5 = v36;
  if (self->_isInAmbient) {
    [v36 configureAmbientAppIconForBundleIdentifier:v13];
  }
  long long v27 = objc_alloc_init(SRCompactResultPlatterViewController);
  [(SRCompactResultPlatterViewController *)v27 setSiriContentViewControllers:v10];
  unsigned int v28 = [(SRCompactViewController *)self _resultViewController];
  [v28 setContentPlatterViewController:v27];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v29 = v10;
  id v30 = [v29 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v40;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(v29);
        }
        int v34 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v34 updateBackgroundIfNeeded];
        }
      }
      id v31 = [v29 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v31);
  }

  BOOL v26 = 1;
  id v4 = v37;
LABEL_33:

  return v26;
}

- (void)_setActiveConversationTranscriptItems:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_activeConversationTranscriptItems isEqualToArray:v4]
    || ![(SRCompactViewController *)self contentDiffersBetweenItems:v4 andItems:self->_activeConversationTranscriptItems])
  {
    objc_super v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v32 = "-[SRCompactViewController _setActiveConversationTranscriptItems:]";
      __int16 v33 = 2112;
      id v34 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: Conversation Transcript has the same content, not updating our compact view for items: %@", buf, 0x16u);
    }
  }
  uint64_t v24 = v4;
  double v6 = (NSArray *)[v4 copy];
  activeConversationTranscriptItems = self->_activeConversationTranscriptItems;
  self->_activeConversationTranscriptItems = v6;

  uint64_t v25 = +[NSMutableArray array];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  double v8 = self->_activeConversationTranscriptItems;
  id v9 = [(NSArray *)v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(v8);
        }
        CGFloat v13 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v12);
        uint64_t v14 = [v13 viewController];
        double v15 = v14;
        if (v14)
        {
          int v16 = [v14 parentViewController];

          if (!v16) {
            [(SiriSharedUIViewStackContainerController *)self->_viewStackContainerController addChildViewController:v15];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v17 = v15;
            unsigned int v18 = [v13 isHintItem];
            if (v18) {
              [v17 setIsHint:1];
            }
            [v17 setDelegate:self];
          }
          else
          {
            LOBYTE(v18) = 0;
          }
          if (objc_opt_respondsToSelector()) {
            [v15 setIsInAmbient:self->_isInAmbient];
          }
          char v19 = v18 ^ 1;
          if (!self->_isInAmbient) {
            char v19 = 1;
          }
          if (v19)
          {
            CGFloat v21 = [v15 view];
            [v25 addObject:v21];

            if (v16) {
              goto LABEL_26;
            }
LABEL_29:
            [v15 didMoveToParentViewController:self->_viewStackContainerController];
            goto LABEL_26;
          }
          id v20 = AFSiriLogContextConnection;
          if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v32 = "-[SRCompactViewController _setActiveConversationTranscriptItems:]";
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s #ambient removed hint view in ambient mode from conversationSnippets", buf, 0xCu);
          }
          if (!v16) {
            goto LABEL_29;
          }
        }
LABEL_26:

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v22 = [(NSArray *)v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
      id v10 = v22;
    }
    while (v22);
  }

  int v23 = [(SRCompactViewController *)self _compactView];
  [v23 setConversationSnippetViews:v25];
}

- (void)_setActiveAdditionalPlatterTranscriptItems:(id)a3
{
  id v4 = a3;
  if ([(NSArray *)self->_activeAdditionalPlatterTranscriptItems isEqualToArray:v4]
    || ![(SRCompactViewController *)self _contentDiffersBetweenPlatterItems:v4 andItems:self->_activeAdditionalPlatterTranscriptItems])
  {
    objc_super v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      char v38 = "-[SRCompactViewController _setActiveAdditionalPlatterTranscriptItems:]";
      __int16 v39 = 2112;
      id v40 = v4;
      double v6 = "%s #compact: Additional Platter Transcripts have the same content, not updating our compact view for items: %@";
      goto LABEL_8;
    }
  }
  else if (self->_isInAmbient)
  {
    objc_super v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      char v38 = "-[SRCompactViewController _setActiveAdditionalPlatterTranscriptItems:]";
      __int16 v39 = 2112;
      id v40 = v4;
      double v6 = "%s #compact #ambient: Additional Platter Transcripts should not show in ambient, not updating our compact view for items: %@";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0x16u);
    }
  }
  else
  {
    id v7 = (NSArray *)[v4 copy];
    activeAdditionalPlatterTranscriptItems = self->_activeAdditionalPlatterTranscriptItems;
    self->_activeAdditionalPlatterTranscriptItems = v7;

    uint64_t v24 = +[NSMutableArray array];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obj = self->_activeAdditionalPlatterTranscriptItems;
    id v25 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v25)
    {
      uint64_t v23 = *(void *)v32;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v32 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = v9;
          id v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
          uint64_t v11 = +[NSMutableArray array];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v12 = v10;
          id v13 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v13)
          {
            id v14 = v13;
            uint64_t v15 = *(void *)v28;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(void *)v28 != v15) {
                  objc_enumerationMutation(v12);
                }
                id v17 = [*(id *)(*((void *)&v27 + 1) + 8 * i) viewController];
                unsigned int v18 = v17;
                if (v17)
                {
                  char v19 = [v17 parentViewController];

                  if (!v19) {
                    [(SiriSharedUIViewStackContainerController *)self->_viewStackContainerController addChildViewController:v18];
                  }
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    [v18 setDelegate:self];
                  }
                  id v20 = [v18 view];
                  [v11 addObject:v20];

                  if (!v19) {
                    [v18 didMoveToParentViewController:self->_viewStackContainerController];
                  }
                }
              }
              id v14 = [v12 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v14);
          }

          [v24 addObject:v11];
          uint64_t v9 = v26 + 1;
        }
        while ((id)(v26 + 1) != v25);
        id v25 = [(NSArray *)obj countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v25);
    }

    CGFloat v21 = [(SRCompactViewController *)self _compactView];
    [v21 setAdditionalContentSnippetViews:v24];
  }
}

- (void)_setServerUtterances:(id)a3
{
  if (self->_serverUtterances != a3)
  {
    id v4 = a3;
    objc_super v5 = (NSArray *)[v4 copy];
    serverUtterances = self->_serverUtterances;
    self->_serverUtterances = v5;

    id v7 = [(SRCompactViewController *)self _compactView];
    [v7 setServerUtterances:v4];
  }
}

- (void)_setSpeechRecognitionHypothesis:(id)a3
{
  if (self->_speechRecognitionHypothesis != a3)
  {
    id v4 = a3;
    objc_super v5 = (SRUIFSpeechRecognitionHypothesis *)[v4 copy];
    speechRecognitionHypothesis = self->_speechRecognitionHypothesis;
    self->_speechRecognitionHypothesis = v5;

    id v7 = [(SRCompactViewController *)self _compactView];
    [v7 setSpeechRecognitionHypothesis:v4];
  }
}

- (BOOL)hasContentAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = objc_alloc_init(SRCompactViewControllerContentTester);
  id v7 = [(SRCompactViewController *)self _compactView];
  double v8 = objc_alloc_init(SRCompactViewControllerMutableContentTesterState);
  [(SRCompactViewControllerMutableContentTesterState *)v8 setDeviceIsPad:SiriUIDeviceIsPad()];
  uint64_t v9 = [(SiriUINavigationController *)self->_navigationController transitionController];
  -[SRCompactViewControllerMutableContentTesterState setNavigationStackIsPopping:](v8, "setNavigationStackIsPopping:", [v9 operation] == (id)2);

  id v10 = [(SiriUINavigationController *)self->_navigationController viewControllers];
  -[SRCompactViewControllerMutableContentTesterState setNavigationStackSize:](v8, "setNavigationStackSize:", [v10 count]);

  uint64_t v11 = [(SiriUINavigationController *)self->_navigationController viewControllers];
  if ((unint64_t)[v11 count] <= 1)
  {
    unsigned __int8 v12 = [(SRCompactViewControllerMutableContentTesterState *)v8 navigationStackIsPopping];

    if ((v12 & 1) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v13 = [(SiriUINavigationController *)self->_navigationController visibleViewController];
  uint64_t v14 = [v13 view];
  [v7 convertPoint:v14 toView:x, y];
  double v16 = v15;
  double v18 = v17;

  -[SRCompactViewControllerMutableContentTesterState setNavigationBarHasContent:](v8, "setNavigationBarHasContent:", -[SRCompactViewController _navigationBarHasContentAtPoint:](self, "_navigationBarHasContentAtPoint:", x, y));
  char v19 = [(SiriUINavigationController *)self->_navigationController visibleViewController];
  objc_opt_class();
  LOBYTE(v14) = objc_opt_isKindOfClass();

  if (v14)
  {
    id v20 = [(SiriUINavigationController *)self->_navigationController visibleViewController];
    [v8 setMultiLevelViewHasContent:[v20 hasContentAtPoint:v16, v18]];
  }
  else
  {
    [(SRCompactViewControllerMutableContentTesterState *)v8 setMultiLevelViewHasContent:1];
  }
LABEL_7:
  -[SRCompactViewControllerMutableContentTesterState setKeyboardHasContent:](v8, "setKeyboardHasContent:", -[SRCompactViewController _keyboardHasContentAtPoint:](self, "_keyboardHasContentAtPoint:", x, y));
  -[SRCompactViewControllerMutableContentTesterState setEditableUtteranceViewHasContent:](v8, "setEditableUtteranceViewHasContent:", -[SRCompactEditableUtterancePresenter hasContentAtPoint:](self->_editableUtterancePresenter, "hasContentAtPoint:", x, y));
  [v8 setCompactViewHasContent:[v7 hasContentAtPoint:x, y]];
  if (self->_siriViewControllerIsEditing
    && ![(SRCompactViewControllerContentTester *)v6 hasContentForState:v8])
  {
    [(SRCompactViewController *)self siriDidTapOutsideContent];
  }
  [(SRCompactViewControllerMutableContentTesterState *)v8 setSiriViewControllerIsEditing:self->_siriViewControllerIsEditing];
  CGFloat v21 = [(SRCompactViewController *)self view];
  id v22 = [v21 window];

  if (v22) {
    -[SRCompactViewControllerMutableContentTesterState setContextMenuIsPresented:](v8, "setContextMenuIsPresented:", [v22 contextMenuIsPresented]);
  }
  unsigned __int8 v23 = [(SRCompactViewControllerContentTester *)v6 hasContentForState:v8];

  return v23;
}

- (void)_setBottomContentInsetComponents:(id)a3 animatedWithDuration:(double)a4 animationOptions:(unint64_t)a5
{
  self->_bottomContentInsetComponents = ($0C5975B48BE0F00762E4FBCC1DCF0A72)a3;
  if (a3.var0 >= a3.var1) {
    double var0 = a3.var0;
  }
  else {
    double var0 = a3.var1;
  }
  id v10 = objc_alloc_init((Class)SiriSharedUIAnimationContext);
  [v10 setAnimationOptions:a5];
  [v10 setAnimationDuration:a4];
  uint64_t v9 = [(SRCompactViewController *)self _compactView];
  [v9 setBottomContentInset:v10 animatedWithContext:var0];
}

- (void)_setBottomContentInsetComponents:(id)a3
{
}

- (void)setBottomContentInset:(double)a3
{
  [(SRCompactViewController *)self _bottomContentInsetComponents];

  [(SRCompactViewController *)self _setBottomContentInsetComponents:a3];
}

- (void)setTopContentInset:(double)a3 animated:(BOOL)a4
{
  if (self->_topInset != a3) {
    -[SRCompactViewController updateTopInset:animated:](self, "updateTopInset:animated:", a4);
  }
}

- (void)_updateBottomContentInsetKeyboardComponent
{
  [(SRCompactViewController *)self _bottomContentInsetComponents];
  double v4 = v3;
  id v14 = [(SRCompactViewController *)self _keyboardState];
  [v14 frameForAnimation];
  -[SRCompactViewController _convertRectFromKeyboard:](self, "_convertRectFromKeyboard:");
  CGFloat x = v16.origin.x;
  CGFloat y = v16.origin.y;
  CGFloat width = v16.size.width;
  CGFloat height = v16.size.height;
  double v9 = 0.0;
  if (CGRectGetHeight(v16) != 0.0)
  {
    id v10 = [(SRCompactViewController *)self _compactView];
    [v10 bounds];
    double v11 = CGRectGetHeight(v17);
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    double v9 = v11 - CGRectGetMinY(v18);
  }
  unsigned __int8 v12 = [v14 animation];
  [v12 duration];
  -[SRCompactViewController _setBottomContentInsetComponents:animatedWithDuration:animationOptions:](self, "_setBottomContentInsetComponents:animatedWithDuration:animationOptions:", [v12 options], v4, v9, v13);
}

- (void)siriDidActivate
{
  if ((id)[(SRCompactViewController *)self _inputType] == (id)1)
  {
    id v4 = [(SRCompactViewController *)self _textRequestViewController];
    double v3 = [v4 view];
    [v3 becomeFirstResponder];
  }
}

- (void)siriDidDeactivate
{
  if ((id)[(SRCompactViewController *)self _inputType] == (id)1)
  {
    double v3 = [(SRCompactViewController *)self _textRequestViewController];
    id v4 = [v3 view];
    [v4 resignFirstResponder];
  }
  id v6 = [(SRCompactViewController *)self _navigationController];
  objc_super v5 = [v6 visibleViewController];
  [(SRCompactViewController *)self _recursivelyNotifyVisibleViewControllers:v5 withBlock:&stru_1001435B8];
}

- (int)viewRegionForPresentedAceObject:(id)a3
{
  return [(SiriSharedUICompactHostingInstrumentationSupplement *)self->_instrumentationSupplement viewRegionForPresentedAceObject:a3 resultTrasncriptItems:self->_activeTranscriptItems conversationTranscriptItems:self->_activeConversationTranscriptItems serverUtterances:self->_serverUtterances];
}

- (double)lastPresentationTime
{
  return self->_presentationTime;
}

- (id)_instrumentationManager
{
  return +[SRUIFInstrumentationManager sharedManager];
}

- (void)showFullScreenEffect:(id)a3
{
  id v8 = a3;
  if (!self->_fullScreenEffects)
  {
    id v4 = objc_alloc_init(SRFullScreenEffects);
    fullScreenEffects = self->_fullScreenEffects;
    self->_fullScreenEffects = v4;
  }
  id v6 = [(SRCompactViewController *)self _compactView];
  id v7 = [(SRFullScreenEffects *)self->_fullScreenEffects effectForAceObject:v8];
  [v6 showFullScreenEffect:v7];
}

- (BOOL)didReceiveUpdateVisualResponseCommand:(id)a3
{
  id v4 = a3;
  id v25 = [v4 viewId];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  objc_super v5 = [(SiriSharedUICompactResultViewController *)self->_resultViewController contentPlatterViewController];
  id v6 = [v5 contentViewControllers];

  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v24 = v4;
    uint64_t v9 = *(void *)v27;
    id v10 = &objc_retain_x8_ptr;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          id v14 = [v13 aceObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v13 aceObject];
            double v15 = v6;
            v17 = CGRect v16 = v10;
            [v17 viewId];
            v19 = uint64_t v18 = v9;
            unsigned int v20 = [v19 isEqualToString:v25];

            uint64_t v9 = v18;
            id v10 = v16;
            id v6 = v15;

            if (v20)
            {
              id v4 = v24;
              CGFloat v21 = [v24 stateData];
              [v13 updateSharedState:v21];

              BOOL v22 = 1;
              goto LABEL_16;
            }
          }
          else
          {
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v8);
    BOOL v22 = 0;
    id v4 = v24;
  }
  else
  {
    BOOL v22 = 0;
  }
LABEL_16:

  return v22;
}

- (void)setActiveRequestOptions:(id)a3
{
  objc_super v5 = (SASRequestOptions *)a3;
  p_activeRequestOptions = &self->_activeRequestOptions;
  if (self->_activeRequestOptions != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_activeRequestOptions, a3);
    p_activeRequestOptions = (SASRequestOptions **)[(SRCompactViewController *)self _updateAmbientAvailability];
    objc_super v5 = v7;
  }

  _objc_release_x1(p_activeRequestOptions, v5);
}

- (void)_registerForAmbientPresentationTraitChange
{
  [(SRCompactViewController *)self _updateAmbientAvailability];
  objc_initWeak(&location, self);
  double v3 = self;
  uint64_t v9 = v3;
  id v4 = +[NSArray arrayWithObjects:&v9 count:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000222D8;
  v6[3] = &unk_100142F90;
  objc_copyWeak(&v7, &location);
  id v5 = [(SRCompactViewController *)self registerForTraitChanges:v4 withHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_updateAmbientAvailability
{
  double v3 = [(SRCompactViewController *)self view];
  id v4 = [v3 traitCollection];
  id v5 = [v4 isAmbientPresented];

  id v6 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    id v8 = +[NSNumber numberWithBool:v5];
    int v9 = 136315394;
    id v10 = "-[SRCompactViewController _updateAmbientAvailability]";
    __int16 v11 = 2112;
    unsigned __int8 v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s #ambient - is Presented - %@", (uint8_t *)&v9, 0x16u);
  }
  [(SRCompactViewController *)self setIsInAmbient:v5];
}

- (void)setIsInAmbient:(BOOL)a3
{
  if (self->_isInAmbient != a3)
  {
    BOOL v3 = a3;
    self->_isInAmbient = a3;
    uint64_t v64 = 48;
    if (a3)
    {
      id v5 = +[UIScreen mainScreen];
      [v5 scale];
      double v7 = v6 * SiriSharedUICompactAmbientContentScaleAmount;

      id v8 = [(SRCompactViewController *)self _viewStackContainerController];
      int v9 = [v8 traitOverrides];
      [v9 setDisplayScale:v7];

      id v10 = [(SRCompactViewController *)self _viewStackContainerController];
      __int16 v11 = [v10 traitOverrides];
      [v11 setUserInterfaceStyle:2];

      unsigned __int8 v12 = [(SRCompactViewController *)self _navigationController];
      id v13 = [v12 traitOverrides];
      [v13 setDisplayScale:v7];

      id v14 = [(SRCompactViewController *)self _navigationController];
      double v15 = [v14 traitOverrides];
      [v15 setUserInterfaceStyle:2];

      CGRect v16 = [(SRCompactViewController *)self traitOverrides];
      [v16 setDisplayScale:v7];

      CGRect v17 = [(SRCompactViewController *)self traitOverrides];
      [v17 setUserInterfaceStyle:2];
    }
    else
    {
      uint64_t v18 = [(SRCompactViewController *)self _viewStackContainerController];
      char v19 = [v18 traitOverrides];
      unsigned int v20 = self;
      [v19 removeTrait:v20];

      CGFloat v21 = [(SRCompactViewController *)self _viewStackContainerController];
      BOOL v22 = [v21 traitOverrides];
      unsigned __int8 v23 = self;
      [v22 removeTrait:v23];

      uint64_t v24 = [(SRCompactViewController *)self _navigationController];
      id v25 = [v24 traitOverrides];
      long long v26 = self;
      [v25 removeTrait:v26];

      long long v27 = [(SRCompactViewController *)self _navigationController];
      long long v28 = [v27 traitOverrides];
      long long v29 = self;
      [v28 removeTrait:v29];

      long long v30 = [(SRCompactViewController *)self traitOverrides];
      long long v31 = self;
      [v30 removeTrait:v31];

      CGRect v17 = [(SRCompactViewController *)self traitOverrides];
      long long v32 = self;
      [v17 removeTrait:v32];
    }
    long long v33 = [(SRCompactViewController *)self _compactView];
    long long v34 = [v33 resultView];
    [v34 setIsInAmbient:v3];

    BOOL v35 = [(SRCompactViewController *)self _compactView];
    id v36 = [v35 conversationView];
    [v36 setIsInAmbient:v3];

    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    v65 = self;
    id v37 = [(SRCompactViewController *)self _navigationController];
    char v38 = [v37 viewControllers];

    id v39 = [v38 countByEnumeratingWithState:&v74 objects:v80 count:16];
    if (v39)
    {
      id v40 = v39;
      uint64_t v41 = *(void *)v75;
      do
      {
        for (i = 0; i != v40; i = (char *)i + 1)
        {
          if (*(void *)v75 != v41) {
            objc_enumerationMutation(v38);
          }
          long long v43 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          uint64_t v44 = objc_opt_class();
          long long v45 = sub_1000056B4(v44, v43);
          if (v45)
          {
            uint64_t v46 = objc_opt_class();
            BOOL v47 = [v45 contentViewController];
            BOOL v48 = sub_1000056B4(v46, v47);

            if (v48)
            {
              long long v49 = [v48 contentPlatterView];
              [v49 setIsInAmbient:v3];
            }
          }
        }
        id v40 = [v38 countByEnumeratingWithState:&v74 objects:v80 count:16];
      }
      while (v40);
    }

    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v50 = [(SRCompactViewController *)v65 _compactView];
    __int16 v51 = [v50 additionalContentViews];

    id v52 = [v51 countByEnumeratingWithState:&v70 objects:v79 count:16];
    if (v52)
    {
      id v53 = v52;
      uint64_t v54 = *(void *)v71;
      do
      {
        for (j = 0; j != v53; j = (char *)j + 1)
        {
          if (*(void *)v71 != v54) {
            objc_enumerationMutation(v51);
          }
          [*(id *)(*((void *)&v70 + 1) + 8 * (void)j) setIsInAmbient:v3, v64];
        }
        id v53 = [v51 countByEnumeratingWithState:&v70 objects:v79 count:16];
      }
      while (v53);
    }

    long long v56 = [(NSArray *)v65->_activeTranscriptItems arrayByAddingObjectsFromArray:v65->_activeConversationTranscriptItems];
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v57 = [v56 countByEnumeratingWithState:&v66 objects:v78 count:16];
    uint64_t v58 = v64;
    if (v57)
    {
      id v59 = v57;
      uint64_t v60 = *(void *)v67;
      do
      {
        for (k = 0; k != v59; k = (char *)k + 1)
        {
          if (*(void *)v67 != v60) {
            objc_enumerationMutation(v56);
          }
          v62 = [*(id *)(*((void *)&v66 + 1) + 8 * (void)k) viewController:v64];
          if (objc_opt_respondsToSelector()) {
            [v62 setIsInAmbient:*((unsigned __int8 *)&v65->super.super.super.isa + v58)];
          }
        }
        id v59 = [v56 countByEnumeratingWithState:&v66 objects:v78 count:16];
      }
      while (v59);
    }
    v63 = [(SRCompactViewController *)v65 _compactView];
    [v63 setIsInAmbient:v3];
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

    id v8 = [(SRCompactViewController *)self _viewStackContainerController];
    int v9 = [v8 traitOverrides];
    [v9 setDisplayScale:v7];

    self->_isInAmbientInteractivitCGFloat y = v3;
    id v10 = [(SRCompactViewController *)self _compactView];
    __int16 v11 = [v10 resultView];
    [v11 setIsInAmbientInteractivity:v3];

    unsigned __int8 v12 = [(SRCompactViewController *)self _compactView];
    id v13 = [v12 conversationView];
    [v13 setIsInAmbientInteractivity:v3];

    id v14 = [(NSArray *)self->_activeTranscriptItems arrayByAddingObjectsFromArray:self->_activeConversationTranscriptItems];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v22;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v14);
          }
          char v19 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v18) viewController];
          if (objc_opt_respondsToSelector()) {
            [v19 setIsInAmbientInteractivity:v3];
          }

          uint64_t v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v16);
    }
    unsigned int v20 = [(SRCompactViewController *)self _compactView];
    [v20 setIsInAmbientInteractivity:v3];
  }
}

- (void)siriDidStartSpeakingWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SRCompactViewController *)self _navigationController];
  double v6 = [v5 visibleViewController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100022DF4;
  v8[3] = &unk_1001430A8;
  id v9 = v4;
  id v7 = v4;
  [(SRCompactViewController *)self _recursivelyNotifyVisibleViewControllers:v6 withBlock:v8];
}

- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(SRCompactViewController *)self _navigationController];
  id v8 = [v7 visibleViewController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100022F2C;
  v10[3] = &unk_1001430D0;
  id v11 = v6;
  BOOL v12 = a4;
  id v9 = v6;
  [(SRCompactViewController *)self _recursivelyNotifyVisibleViewControllers:v8 withBlock:v10];
}

- (void)siriDidUpdateASRWithRecognition:(id)a3
{
  id v4 = a3;
  id v5 = [(SRCompactViewController *)self _navigationController];
  id v6 = [v5 visibleViewController];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100023058;
  v8[3] = &unk_1001430A8;
  id v9 = v4;
  id v7 = v4;
  [(SRCompactViewController *)self _recursivelyNotifyVisibleViewControllers:v6 withBlock:v8];
}

- (void)siriDidTapOutsideContent
{
  id v4 = [(SRCompactViewController *)self _navigationController];
  BOOL v3 = [v4 visibleViewController];
  [(SRCompactViewController *)self _recursivelyNotifyVisibleViewControllers:v3 withBlock:&stru_1001435D8];
}

- (void)siriWillStartRequest
{
  id v4 = [(SRCompactViewController *)self _navigationController];
  BOOL v3 = [v4 visibleViewController];
  [(SRCompactViewController *)self _recursivelyNotifyVisibleViewControllers:v3 withBlock:&stru_1001435F8];
}

- (void)siriIsIdleAndQuiet
{
  id v4 = [(SRCompactViewController *)self _navigationController];
  BOOL v3 = [v4 visibleViewController];
  [(SRCompactViewController *)self _recursivelyNotifyVisibleViewControllers:v3 withBlock:&stru_100143618];
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
  id v8 = [v6 childViewControllers];
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
        [(SRCompactViewController *)self _recursivelyNotifyVisibleViewControllers:*(void *)(*((void *)&v13 + 1) + 8 * (void)v12) withBlock:v7];
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
  id v4 = [(SRCompactViewController *)self _queuedNavigationContentViewController];
  if (v4)
  {
    BOOL v3 = [(SRCompactViewController *)self _navigationController];
    [v3 pushViewController:v4 animated:1];

    [(SRCompactViewController *)self _setQueuedNavigationContentViewController:0];
    [(SRCompactViewController *)self userDrilledIntoSnippet];
  }
}

- (void)dismissalGestureRecognizerDidFinish:(id)a3 shouldDismiss:(BOOL)a4
{
  if (a4)
  {
    id v5 = [(SRCompactViewController *)self delegate];
    [v5 endSiriSessionForViewController:self withDismissalReason:24];
  }
}

- (BOOL)shouldBeginDismissalGestureRecognizer:(id)a3 withTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 view];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v9 = 0;
LABEL_6:
    uint64_t v11 = [v6 view];
    [v7 locationInView:v11];
    double v13 = v12;
    double v15 = v14;
    long long v16 = [(SRCompactViewController *)self _compactView];
    unsigned __int8 v10 = [v16 hasContentAtPoint:v13, v15];

    goto LABEL_7;
  }
  id v9 = [v7 view];

  if (!v9 || ([v9 isEnabled] & 1) == 0) {
    goto LABEL_6;
  }
  unsigned __int8 v10 = 0;
LABEL_7:

  return v10;
}

- (void)siriViewController:(id)a3 openURL:(id)a4 completion:(id)a5
{
  instrumentationSupplement = self->_instrumentationSupplement;
  id v9 = a5;
  id v10 = a4;
  [(SiriSharedUICompactHostingInstrumentationSupplement *)instrumentationSupplement logPunchOutEventForSiriViewController:a3 aceCommand:0 URL:v10 appID:0 sashItem:0];
  id v11 = [(SRCompactViewController *)self delegate];
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
  id v10 = [(SRCompactViewController *)self delegate];
  [v10 viewController:self performAceCommands:v9 completion:0];
}

- (void)siriViewController:(id)a3 performAceCommands:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SRCompactViewController *)self delegate];
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
  BOOL v3 = [(SRCompactViewController *)self delegate];
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
  double v5 = [(SRCompactViewController *)self delegate];
  id v6 = [v5 effectiveCoreLocationBundleForCompactViewController:self];

  if (!v6)
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B7808((uint64_t)v4, v7);
    }
  }

  return v6;
}

- (double)siriViewControllerExpectedWidth:(id)a3
{
  id v4 = [(SRCompactViewController *)self _compactView];
  [v4 resultViewContentSize];
  double v6 = v5;

  if (self->_isInAmbient && !self->_isInAmbientInteractivity) {
    return v6 / SiriSharedUICompactAmbientContentScaleAmount;
  }
  return v6;
}

- (void)siriViewControllerHeightDidChange:(id)a3
{
  id v15 = a3;
  if (v15)
  {
    id v4 = [(SRCompactViewController *)self _compactView];
    double v5 = [(SiriUINavigationController *)self->_navigationController topViewController];
    double v6 = [v5 view];
    id v7 = [v4 viewStackContainer];
    id v8 = [v7 hostingView];

    if (v6 == v8)
    {
      id v11 = [v15 view];
      [v4 snippetLayoutDidUpdateForView:v11];
    }
    else
    {
      id v9 = [(SiriUINavigationController *)self->_navigationController topViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_7;
      }
      id v11 = [(SiriUINavigationController *)self->_navigationController topViewController];
      [v11 contentViewDidUpdateSize];
    }

LABEL_7:
    double v12 = [(SRCompactViewController *)self _navigationController];
    double v13 = [v12 transitionController];
    if ([v13 operation])
    {
    }
    else
    {
      double v14 = [(SRCompactViewController *)self _queuedNavigationContentViewController];

      if (v14) {
        goto LABEL_11;
      }
      double v12 = [(SRCompactViewController *)self _navigationStackLayoutController];
      [v12 layout];
    }

LABEL_11:
  }
}

- (void)siriViewControllerHeightDidChange:(id)a3 pinTopOfSnippet:(BOOL)a4
{
  id v4 = [(SRCompactViewController *)self _compactView];
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
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v4 = a4;
  id v5 = [v4 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (!v5) {
    goto LABEL_32;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v45;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v45 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v44 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_32;
      }
      id v10 = v9;
      id v11 = +[SRLocalSnippetManager transcriptItemForObject:v10];
      if (!v11)
      {
        double v12 = +[SiriUISnippetManager sharedInstance];
        id v11 = [v12 transcriptItemForObject:v10 sizeClass:1];
      }
      double v13 = [v11 viewController];
      [v13 setAceObject:v10];

      double v14 = [v11 viewController];
      [v14 wasAddedToTranscript];

      id v15 = [v11 viewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v16 = [v15 view];
        [v16 layoutIfNeeded];
        id v17 = v15;
        if (SiriUIDeviceIsPad()) {
          [v17 setNavigating:1];
        }
        if (objc_opt_respondsToSelector()) {
          uint64_t v18 = (uint64_t)[v16 shouldAutomaticallyScaleContentInAmbient];
        }
        else {
          uint64_t v18 = 1;
        }
        [v17 setIsInAmbient:self->_isInAmbient];
        [v17 setDelegate:self];
        [(SiriSharedUICompactHostingInstrumentationSupplement *)self->_instrumentationSupplement configureSiriViewControllerWithCurrentTurn:v17];
        id v19 = objc_alloc_init((Class)SiriSharedUIContentPlatterViewController);
        id v48 = v17;
        unsigned int v20 = +[NSArray arrayWithObjects:&v48 count:1];
        [v19 setContentViewControllers:v20];

        id v21 = objc_alloc_init((Class)SiriUINavigationContentViewController);
        [v21 setContentViewController:v19];
        long long v42 = v19;
        if (self->_isInAmbient)
        {
          [v19 contentPlatterView];
          id v41 = v21;
          v23 = uint64_t v22 = v18;
          long long v24 = [(SRCompactViewController *)self _resultViewController];
          id v25 = [v24 compactResultView];
          [v23 setDelegate:v25];

          uint64_t v18 = v22;
          id v21 = v41;
          id v19 = v42;
        }
        long long v26 = [v19 contentPlatterView];
        [v26 setIsNextLevelCard:1];

        long long v27 = [v19 contentPlatterView];
        [v27 setIsInAmbient:self->_isInAmbient];

        long long v28 = [v19 contentPlatterView];
        [v28 setAllowAutomaticContentViewsScaling:v18];

        long long v29 = [v17 aceObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0 && SiriUIDeviceIsPad())
        {
          long long v31 = [v21 contentViewController];
          long long v32 = [v31 view];
          long long v33 = [(SRCompactViewController *)self view];
          [v33 frame];
          [v32 setFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(v50), 0.0)];

          long long v34 = [v21 contentViewController];
          BOOL v35 = [v34 view];
          [v35 setNeedsLayout];

          id v36 = [v21 contentViewController];
          id v37 = [v36 view];
          [v37 layoutIfNeeded];
        }
        if (SiriUIDeviceIsPad()) {
          [v21 setContentLayoutEnabled:0];
        }
        else {
          [(SRCompactViewController *)self _updateAdditionalSafeAreaInsetsForNavigationContentViewController:v21];
        }
        [(SRCompactViewController *)self _setQueuedNavigationContentViewController:v21];
        if ([v17 isLoading])
        {
          char v38 = [v17 aceObject];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
          }
          else
          {
            id v39 = [v17 aceObject];
            objc_opt_class();
            char v40 = objc_opt_isKindOfClass();

            if ((v40 & 1) == 0)
            {
LABEL_31:
              [(SiriSharedUICompactHostingInstrumentationSupplement *)self->_instrumentationSupplement logDrillInInteractionForSnippetViewControllerIfNecessary:v17];

              goto LABEL_32;
            }
          }
        }
        [(SRCompactViewController *)self _pushQueuedNavigationContentViewController];
        goto LABEL_31;
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_32:
}

- (void)_updateAdditionalSafeAreaInsetsForNavigationContentViewController:(id)a3
{
  id v8 = a3;
  if ((SiriUIDeviceIsPad() & 1) == 0)
  {
    id v4 = [(SRCompactViewController *)self _compactView];
    [v4 safeAreaInsets];
    double v6 = 0.0 - v5;
    [v4 effectiveBottomContentInset];
    [v8 setAdditionalSafeAreaInsets:0.0, 8.0, v6 + v7 + 14.0, 8.0];
  }
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
  id v12 = a3;
  if (v12)
  {
    id v4 = [(SRCompactViewController *)self _compactView];
    double v5 = [v12 view];
    [v4 snippetLayoutDidUpdateForView:v5];

    [v4 setNeedsLayout];
    double v6 = [v12 aceObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0 && SiriUIDeviceIsPad())
    {
      id v8 = [v12 view];
      id v9 = [(SRCompactViewController *)self view];
      [v9 frame];
      [v8 setFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(v14), 0.0)];

      id v10 = [v12 view];
      [v10 setNeedsLayout];

      id v11 = [v12 view];
      [v11 layoutIfNeeded];
    }
    [(SRCompactViewController *)self _pushQueuedNavigationContentViewController];
  }
}

- (void)userTouchedSnippet
{
  id v2 = [(SRCompactViewController *)self delegate];
  [v2 userTouchedSnippet];
}

- (void)siriSnippetViewController:(id)a3 informHostOfBackgroundView:(id)a4 isSnippetAsyncColored:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315138;
    CGRect v14 = "-[SRCompactViewController siriSnippetViewController:informHostOfBackgroundView:isSnippetAsyncColored:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v13, 0xCu);
  }
  id v10 = v8;
  if (v10)
  {
    id v11 = [(SiriSharedUICompactResultViewController *)self->_resultViewController contentPlatterViewController];
    id v12 = [v11 contentPlatterView];
    [v12 setBackgroundView:v10];
  }
}

- (void)siriSnippetViewController:(id)a3 isBackgroundColorUpdateSuccessful:(BOOL)a4
{
  BOOL v4 = a4;
  double v5 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    id v7 = +[NSNumber numberWithBool:v4];
    int v8 = 136315394;
    id v9 = "-[SRCompactViewController siriSnippetViewController:isBackgroundColorUpdateSuccessful:]";
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s isSuccessful %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)siriSnippetViewController:(id)a3 handleStartLocalRequest:(id)a4 turnIdentifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SRCompactViewController *)self delegate];
  [v9 compactViewController:self handleStartLocalRequest:v8 turnIdentifier:v7];
}

- (void)userDrilledIntoSnippet
{
  id v2 = [(SRCompactViewController *)self delegate];
  [v2 userDrilledIntoSnippet];
}

- (void)cancelSpeakingForSiriViewController:(id)a3
{
  id v4 = [(SRCompactViewController *)self delegate];
  [v4 stopSpeakingForCompactViewController:self];
}

- (void)siriViewController:(id)a3 speakText:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(SRCompactViewController *)self delegate];
  [v9 compactViewController:self speakText:v8 isPhonetic:0 completion:v7];
}

- (BOOL)siriViewControllerShouldPreventUserInteraction:(id)a3
{
  id v4 = [(SRCompactViewController *)self delegate];
  id v5 = [v4 lockStateForCompactViewController:self];

  return v5 != 0;
}

- (id)localeForSiriViewController:(id)a3
{
  id v4 = [(SRCompactViewController *)self delegate];
  id v5 = [v4 localeForCompactViewController:self];

  return v5;
}

- (void)siriSnippetViewController:(id)a3 willDismissViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactViewController *)self delegate];
  [v6 siriCompactViewController:self willDismissViewController:v5];
}

- (void)siriSnippetViewController:(id)a3 willPresentViewController:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactViewController *)self delegate];
  [v6 siriCompactViewController:self willPresentViewController:v5];
}

- (void)siriViewControllerWillBeginEditing:(id)a3
{
  self->_siriViewControllerIsEditing = 1;
  id v4 = [(SRCompactViewController *)self delegate];
  [v4 cancelRequestForViewController:self];

  id v5 = [(SRCompactViewController *)self delegate];
  [v5 compactViewControllerRequestsHIDEventDefferal:self];

  id v6 = [(SRCompactViewController *)self _compactView];
  [v6 setConversationViewHidden:1];
}

- (void)siriViewControllerDidEndEditing:(id)a3
{
  self->_siriViewControllerIsEditing = 0;
  id v4 = [(SRCompactViewController *)self delegate];
  [v4 compactViewControllerCancelHIDEventDefferal:self];

  id v5 = [(SRCompactViewController *)self _compactView];
  [v5 setConversationViewHidden:0];
}

- (void)siriViewControllerViewDidAppear:(id)a3 isTopLevelViewController:(BOOL)a4
{
  if (a4)
  {
    p_delegate = &self->_delegate;
    id v6 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    id v7 = [v6 aceObject];

    [WeakRetained compactViewController:self viewDidAppearForAceObject:v7];
  }
}

- (void)siriViewControllerViewDidDisappear:(id)a3 isTopLevelViewController:(BOOL)a4
{
  if (a4)
  {
    p_delegate = &self->_delegate;
    id v6 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    id v7 = [v6 aceObject];

    [WeakRetained compactViewController:self viewDidDisappearForAceObject:v7];
  }
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (void)_setStatusViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SRCompactViewController *)self delegate];
  [v5 compactViewController:self setStatusViewHidden:v3];
}

- (void)_setSnippetViewControllerRequestsStatusViewHidden:(BOOL)a3
{
  self->_snippetViewControllerRequestsStatusViewHidden = a3;
  [(SRCompactViewController *)self _updateStatusViewVisibility];
}

- (void)_updateStatusViewVisibility
{
  unsigned int v3 = [(SRCompactViewController *)self _hidesStatusViewForInputType:[(SRCompactViewController *)self _inputType]];
  uint64_t v4 = v3 | [(SRCompactViewController *)self _snippetViewControllerRequestsStatusViewHidden];

  [(SRCompactViewController *)self _setStatusViewHidden:v4];
}

- (void)_updateTextRequestViewVisibility
{
  BOOL v3 = [(SRCompactViewController *)self _hidesTextRequestViewForInputType:[(SRCompactViewController *)self _inputType]];
  id v4 = [(SRCompactViewController *)self _compactView];
  [v4 setHidesTextRequestView:v3];
}

- (void)_willBeginEditingOfType:(int64_t)a3
{
  id v5 = [(SRCompactViewController *)self delegate];
  [v5 compactViewController:self willBeginEditingOfType:a3];
}

- (void)_didEndEditing
{
  id v3 = [(SRCompactViewController *)self delegate];
  [v3 compactViewControllerDidEndEditing:self];
}

- (void)scrollDidBeginFromView:(id)a3
{
  id v4 = [(SRCompactViewController *)self delegate];
  [v4 viewController:self reduceOrbOpacity:1];
}

- (void)scrollDidEndFromView:(id)a3
{
  id v4 = [(SRCompactViewController *)self delegate];
  [v4 viewController:self reduceOrbOpacity:0];
}

- (void)tapToEditRequestedFromView:(id)a3
{
  id v4 = a3;
  id v5 = [(SRCompactViewController *)self _speechRecognitionHypothesis];
  id v6 = [v5 backingAceObject];
  id v7 = [v6 refId];

  id v8 = objc_alloc((Class)SiriSharedUIUserUtteranceEditingDataManager);
  id v9 = [(SRCompactViewController *)self _speechRecognitionHypothesis];
  __int16 v10 = [v9 userUtterance];
  id v11 = [v8 initWithUserUtterance:v10 backingAceObjectRefId:v7];

  id v12 = [[SRCompactEditableUtterancePresenter alloc] initWithUserEditingDataManager:v11 delegate:self];
  editableUtterancePresenter = self->_editableUtterancePresenter;
  self->_editableUtterancePresenter = v12;

  CGRect v14 = [(SRCompactViewController *)self delegate];
  [v14 tapToEditPresented];

  objc_initWeak(&location, self);
  id v15 = self->_editableUtterancePresenter;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100025070;
  v16[3] = &unk_100143488;
  objc_copyWeak(&v17, &location);
  [(SRCompactEditableUtterancePresenter *)v15 presentUtteranceViewControllerFromViewController:self animateAlongsideTransition:v16 completion:0];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (BOOL)_shouldMoveViewStackForTapToEdit
{
  id v2 = [(SRCompactViewController *)self _resultViewController];
  id v3 = [v2 contentPlatterViewController];
  id v4 = [v3 contentViewControllers];
  id v5 = [v4 count];

  if (v5) {
    return 0;
  }
  else {
    return SiriUIDeviceIsPad() ^ 1;
  }
}

- (void)compactView:(id)a3 viewDidAppearForAceObject:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained compactViewController:self viewDidAppearForAceObject:v6];
}

- (void)compactView:(id)a3 viewDidDisappearForAceObject:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained compactViewController:self viewDidDisappearForAceObject:v6];
}

- (void)compactView:(id)a3 didChangeEffectiveBottomContentInsetAnimatedWithContext:(id)a4
{
  id v5 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = self;
  id v7 = [(SRCompactViewController *)self _navigationController];
  id v8 = [v7 viewControllers];

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v22 + 1) + 8 * (void)v12);
        uint64_t v14 = objc_opt_class();
        id v15 = sub_1000056B4(v14, v13);
        if (v15)
        {
          [(SRCompactViewController *)v6 _updateAdditionalSafeAreaInsetsForNavigationContentViewController:v15];
          [v15 contentViewDidUpdateSize];
          [v5 animationDuration];
          double v17 = v16;
          id v18 = [v5 animationOptions];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_100025470;
          v20[3] = &unk_100142E88;
          id v21 = v15;
          +[UIView animateWithDuration:v18 delay:v20 options:0 animations:v17 completion:0.0];
        }
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }
}

- (id)parserSpeakableObjectProviderForCompactView:(id)a3
{
  return +[SiriUISnippetManager sharedInstance];
}

- (double)maximumHeightForCompactView:(id)a3
{
  id v3 = [(SiriSharedUIViewStackContainerController *)self->_viewStackContainerController viewStackContainer];
  id v4 = [v3 hostingView];
  [v4 frame];
  double Height = CGRectGetHeight(v7);

  return Height;
}

- (CGSize)maxSizeForSnippet
{
  id v3 = [(SRCompactViewController *)self _compactView];
  [v3 resultViewContentSize];
  double v5 = v4;

  id v6 = [(SRCompactViewController *)self _compactView];
  CGRect v7 = [(SRCompactViewController *)self _resultViewController];
  id v8 = [v7 compactResultView];
  [v6 maximumHeightForResultView:v8];
  double v10 = v9;

  double v11 = v5;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)editableUtterancePresenter:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
}

- (void)willBeginEditingFromUtterancePresenter:(id)a3
{
}

- (void)didResignFirstResponderFromUtterancePresenter:(id)a3
{
}

- (void)editableUtterancePresenter:(id)a3 didFinishEditingWithText:(id)a4 selectionResults:(id)a5 shouldStartNewRequest:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a5;
  if (v6)
  {
    double v11 = [(SRCompactViewController *)self _compactView];
    id v12 = objc_alloc((Class)AFUserUtterance);
    int v13 = [(SRCompactViewController *)self _speechRecognitionHypothesis];
    uint64_t v14 = [v13 userUtterance];
    id v15 = [v14 correctionIdentifier];
    id v16 = [v12 initWithString:v9 correctionIdentifier:v15];

    id v17 = [objc_alloc((Class)SRUIFSpeechRecognitionHypothesis) initWithUserUtterance:v16 backingAceObject:0 isFinal:1];
    [v11 setSpeechRecognitionHypothesis:v17];

    [v11 setServerUtterances:&__NSArray0__struct];
    [v11 setShowSnippetView:0 animated:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v19 = [(SRUIFSpeechRecognitionHypothesis *)self->_speechRecognitionHypothesis userUtterance];
  [WeakRetained viewController:self didFinishEditingUtteranceWithText:v9 originalUserUtterance:v19 selectionResults:v10];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000257C8;
  block[3] = &unk_100142E88;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)editableUtterancePresenter:(id)a3 openURL:(id)a4
{
  id v5 = a4;
  id v6 = [(SRCompactViewController *)self delegate];
  [v6 viewController:self openURL:v5 completion:0];
}

- (void)willDismissEditableUtterancePresenter:(id)a3 transitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 0;
  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000259CC;
  v10[3] = &unk_100143640;
  objc_copyWeak(&v11, &location);
  void v10[4] = v13;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025A58;
  v8[3] = &unk_100143668;
  void v8[4] = v13;
  objc_copyWeak(&v9, &location);
  [v7 animateAlongsideTransition:v10 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(v13, 8);
}

- (void)_updateKeyboardStateFromNotification:(id)a3
{
  id v4 = a3;
  id v5 = [[SRCompactKeyboardState alloc] initWithKeyboardNotification:v4];

  [(SRCompactViewController *)self _setKeyboardState:v5];
}

- (void)_keyboardWillHideForAmbient:(id)a3
{
  if (self->_isInAmbient) {
    [(SRCompactViewController *)self _updateIsInAmbientWithInteractivity:0];
  }
}

- (void)_keyboardWillShowForAmbient:(id)a3
{
  if (self->_isInAmbient) {
    [(SRCompactViewController *)self _updateIsInAmbientWithInteractivity:1];
  }
}

- (void)_setKeyboardState:(id)a3
{
  id v4 = (SRCompactKeyboardState *)[a3 copy];
  keyboardState = self->_keyboardState;
  self->_keyboardState = v4;

  [(SRCompactViewController *)self _updateBottomContentInsetKeyboardComponent];
}

- (CGRect)_convertRectFromKeyboard:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(SRCompactViewController *)self view];
  id v9 = [v8 window];
  id v10 = [v9 screen];

  id v11 = [v10 coordinateSpace];
  id v12 = [(SRCompactViewController *)self view];
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
  id v3 = [(SRCompactViewController *)self _keyboardState];
  [v3 frame];
  -[SRCompactViewController _convertRectFromKeyboard:](self, "_convertRectFromKeyboard:");
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
  return ![(SRCompactViewController *)self _hidesStatusViewForInputType:a3];
}

- (void)_setInputType:(int64_t)a3
{
  if (self->_inputType != a3)
  {
    self->_inputType = a3;
    [(SRCompactViewController *)self _updateTextRequestViewVisibility];
    [(SRCompactViewController *)self _updateStatusViewVisibility];
  }
}

- (void)textRequestController:(id)a3 requestsKeyboardWithCompletion:(id)a4
{
}

- (void)textRequestControllerWillBeginEditing:(id)a3
{
}

- (void)textRequestControllerDidEndEditing:(id)a3
{
}

- (void)textRequestControllerWillBeginTextEditMenuInteraction:(id)a3
{
  double v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    double v7 = "-[SRCompactViewController textRequestControllerWillBeginTextEditMenuInteraction:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #dismissal - temporarily preventing touches from dismissing Siri while edit menu is up", (uint8_t *)&v6, 0xCu);
  }
  double v5 = [(SRCompactViewController *)self delegate];
  [v5 compactViewController:self preventOutsideTouchesFromDismissingSiri:1];
}

- (void)textRequestControllerDidEndTextEditMenuInteraction:(id)a3
{
  double v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    double v7 = "-[SRCompactViewController textRequestControllerDidEndTextEditMenuInteraction:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #dismissal - edit menu is removed, no longer preventing touches from dismissing Siri", (uint8_t *)&v6, 0xCu);
  }
  double v5 = [(SRCompactViewController *)self delegate];
  [v5 compactViewController:self preventOutsideTouchesFromDismissingSiri:0];
}

- (void)textRequestController:(id)a3 siriRequestCommittedWithText:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  double v7 = [(SRCompactViewController *)self delegate];
  [v7 viewController:self siriRequestEnteredWithText:v6];

  [v8 setAllowsCancellation:SiriUIDeviceIsPad() ^ 1];
}

- (BOOL)_alwaysObscureBackgroundContentWhenActive
{
  id v2 = +[AFPreferences sharedPreferences];
  unsigned __int8 v3 = [v2 alwaysObscureBackgroundContentWhenActive];

  return v3;
}

- (void)_requestPresentationBackgroundBlurVisible:(BOOL)a3 forReason:(int64_t)a4
{
  BOOL v5 = a3;
  double v7 = [(SRCompactViewController *)self delegate];
  id v8 = [v7 lockStateForCompactViewController:self];

  if (!v8
    && ![(SRCompactViewController *)self _alwaysObscureBackgroundContentWhenActive])
  {
    id v9 = [(SRCompactViewController *)self backgroundBlurViewController];
    [v9 requestBackgroundBlurVisible:v5 forReason:a4];
  }
}

- (void)blurFromRootNavigationTransitionController:(id)a3 requestBackgroundBlurViewVisible:(BOOL)a4
{
}

- (void)blurFromRootNavigationTransitionController:(id)a3 requestHostBlurVisible:(BOOL)a4 requestPresentationBlurVisible:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v14 = a3;
  id v9 = [(SRCompactViewController *)self view];
  double v10 = [v9 window];
  double v11 = [v10 windowScene];
  double v12 = [v11 _synchronizedDrawingFence];

  [(SRCompactViewController *)self _requestPresentationBackgroundBlurVisible:v5 forReason:4];
  double v13 = [(SRCompactViewController *)self delegate];
  [v13 viewController:self requestsHostBackgroundBlurVisible:v6 reason:4 fence:v12];
}

- (BOOL)_navigationBarHasContentAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(SRCompactViewController *)self _navigationController];
  double v7 = [v6 navigationBar];
  [v7 bounds];
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;

  double v16 = [(SRCompactViewController *)self navigationController];
  double v17 = [v16 navigationBar];
  double v18 = [(SRCompactViewController *)self _compactView];
  [v17 convertPoint:v18 fromView:x, y];
  uint64_t v20 = v19;
  uint64_t v22 = v21;

  uint64_t v23 = v9;
  uint64_t v24 = v11;
  uint64_t v25 = v13;
  uint64_t v26 = v15;
  uint64_t v27 = v20;
  uint64_t v28 = v22;

  return CGRectContainsPoint(*(CGRect *)&v23, *(CGPoint *)&v27);
}

- (BOOL)_keyboardHasContentAtPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SRCompactViewController *)self _keyboardFrame];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (void)_requestKeyboardWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SRCompactViewController *)self delegate];
  [v5 compactViewController:self requestsKeyboardWithCompletion:v4];
}

- (BOOL)_usesDefaultNavigationBar
{
  return SiriUIDeviceIsPad() ^ 1;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v11 = a3;
  double v7 = [v11 viewControllers];
  id v8 = [v7 count];

  if (v8 == (id)2)
  {
    self->_isDrilledIntoSnippet = 1;
    [(SRCompactViewController *)self updateTopInset:1 animated:self->_topInset];
    CGFloat v10 = [(SRCompactViewController *)self _dismissalPanGestureRecognizer];
    [v10 setEnabled:0];

    if ([(SRCompactViewController *)self _usesDefaultNavigationBar]) {
      [v11 setNavigationBarHidden:0 animated:v5];
    }
  }
  else if (v8 == (id)1)
  {
    self->_isDrilledIntoSnippet = 0;
    CGFloat v9 = [(SRCompactViewController *)self _dismissalPanGestureRecognizer];
    [v9 setEnabled:1];

    if ([(SRCompactViewController *)self _usesDefaultNavigationBar]) {
      [v11 setNavigationBarHidden:1 animated:v5];
    }
    [(SRCompactViewController *)self updateTopInset:1 animated:self->_topInset];
  }
}

- (BOOL)_contentDiffersBetweenPlatterItems:(id)a3 andItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 count];
  if (v8 == [v7 count])
  {
    if ([v6 count])
    {
      unint64_t v9 = 0;
      do
      {
        CGFloat v10 = [v6 objectAtIndex:v9];
        id v11 = [v7 objectAtIndex:v9];
        BOOL v12 = [(SRCompactViewController *)self contentDiffersBetweenItems:v11 andItems:v10];

        if (v12) {
          break;
        }
        ++v9;
      }
      while ((unint64_t)[v6 count] > v9);
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 1;
  }

  return v12;
}

- (BOOL)contentDiffersBetweenItems:(id)a3 andItems:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 count];
  if (v7 == [v6 count])
  {
    if ([v5 count])
    {
      uint64_t v8 = 0;
      id v35 = v6;
      id v36 = v5;
      while (1)
      {
        unint64_t v9 = [v5 objectAtIndex:v8, v35, v36];
        CGFloat v10 = [v9 aceObject];

        id v11 = [v6 objectAtIndex:v8];
        BOOL v12 = [v11 aceObject];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {

          goto LABEL_23;
        }
        id v13 = v10;
        id v14 = v12;
        uint64_t v15 = [v13 sash];
        double v16 = [v15 applicationBundleIdentifier];
        double v17 = [v14 sash];
        double v18 = [v17 applicationBundleIdentifier];
        if ([v16 isEqualToString:v18])
        {
          [v13 sash];
          uint64_t v19 = v38 = v15;
          uint64_t v20 = [v19 title];
          uint64_t v21 = [v14 sash];
          [v21 title];
          uint64_t v22 = v37 = v13;
          unsigned int v23 = [v20 isEqualToString:v22];

          if (!v23)
          {
            unsigned __int8 v27 = 0;
            id v6 = v35;
            id v5 = v36;
            id v13 = v37;
            goto LABEL_18;
          }
          id v13 = v37;
          uint64_t v24 = [v37 siriui_card_compact];
          uint64_t v25 = [v24 backingCard];
          uint64_t v26 = [v25 cardSections];
          if (v26) {
            [v37 siriui_card_compact];
          }
          else {
          uint64_t v28 = [v37 siriui_card];
          }
          id v6 = v35;
          id v5 = v36;
          id v39 = [v28 backingCard];

          long long v29 = [v14 siriui_card_compact];
          long long v30 = [v29 backingCard];
          long long v31 = [v30 cardSections];
          if (v31) {
            [v14 siriui_card_compact];
          }
          else {
          long long v32 = [v14 siriui_card];
          }
          double v16 = [v32 backingCard];

          uint64_t v15 = v39;
          unsigned __int8 v27 = [v39 afui_hasContentEqualTo:v16];
        }
        else
        {

          unsigned __int8 v27 = 0;
        }

LABEL_18:
        if ((v27 & 1) != 0 && (unint64_t)[v5 count] > ++v8) {
          continue;
        }
        char v33 = v27 ^ 1;
        goto LABEL_24;
      }
    }
    char v33 = 0;
  }
  else
  {
LABEL_23:
    char v33 = 1;
  }
LABEL_24:

  return v33;
}

- (SRCompactTextRequestViewController)_textRequestViewController
{
  return self->_textRequestViewController;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (SRCompactViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SRCompactViewControllerDelegate *)WeakRetained;
}

- (NSArray)_activeTranscriptItems
{
  return self->_activeTranscriptItems;
}

- (void)_setActiveTranscriptItems:(id)a3
{
}

- (NSArray)_activeConversationTranscriptItems
{
  return self->_activeConversationTranscriptItems;
}

- (NSArray)_activeAdditionalPlatterTranscriptItems
{
  return self->_activeAdditionalPlatterTranscriptItems;
}

- (NSArray)_serverUtterances
{
  return self->_serverUtterances;
}

- (SRUIFSpeechRecognitionHypothesis)_speechRecognitionHypothesis
{
  return self->_speechRecognitionHypothesis;
}

- (SiriUINavigationController)_navigationController
{
  return self->_navigationController;
}

- (SRCompactNavigationStackLayoutControlling)_navigationStackLayoutController
{
  return self->_navigationStackLayoutController;
}

- (void)_setNavigationStackLayoutController:(id)a3
{
}

- (SiriSharedUICompactResultViewController)_resultViewController
{
  return self->_resultViewController;
}

- (SiriSharedUIViewStackContainerController)_viewStackContainerController
{
  return self->_viewStackContainerController;
}

- (UIViewController)_queuedNavigationContentViewController
{
  return self->_queuedNavigationContentViewController;
}

- (void)_setQueuedNavigationContentViewController:(id)a3
{
}

- (SiriSharedUIPanDismissalGestureRecognizer)_dismissalPanGestureRecognizer
{
  return self->_dismissalPanGestureRecognizer;
}

- (void)_setDismissalPanGestureRecognizer:(id)a3
{
}

- (BOOL)_snippetViewControllerRequestsStatusViewHidden
{
  return self->_snippetViewControllerRequestsStatusViewHidden;
}

- (SRCompactEditableUtterancePresenter)_editableUtterancePresenter
{
  return self->_editableUtterancePresenter;
}

- (void)setEditableUtterancePresenter:(id)a3
{
}

- (int64_t)_inputType
{
  return self->_inputType;
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

- (SiriUIBackgroundBlurViewController)backgroundBlurViewController
{
  return self->_backgroundBlurViewController;
}

- (void)setBackgroundBlurViewController:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeRequestOptions, 0);
  objc_storeStrong((id *)&self->_instrumentationSupplement, 0);
  objc_storeStrong((id *)&self->_backgroundBlurViewController, 0);
  objc_storeStrong((id *)&self->_keyboardState, 0);
  objc_storeStrong((id *)&self->_editableUtterancePresenter, 0);
  objc_storeStrong((id *)&self->_dismissalPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_queuedNavigationContentViewController, 0);
  objc_storeStrong((id *)&self->_viewStackContainerController, 0);
  objc_storeStrong((id *)&self->_resultViewController, 0);
  objc_storeStrong((id *)&self->_navigationStackLayoutController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_speechRecognitionHypothesis, 0);
  objc_storeStrong((id *)&self->_serverUtterances, 0);
  objc_storeStrong((id *)&self->_activeAdditionalPlatterTranscriptItems, 0);
  objc_storeStrong((id *)&self->_activeConversationTranscriptItems, 0);
  objc_storeStrong((id *)&self->_activeTranscriptItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textRequestViewController, 0);

  objc_storeStrong((id *)&self->_fullScreenEffects, 0);
}

@end