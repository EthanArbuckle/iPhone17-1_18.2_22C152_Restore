@interface QLPreviewCollection
+ (id)previewCollectionClassName;
+ (id)previewCollectionWithClassName:(id)a3;
+ (id)quickLookExtension;
+ (void)previewCollectionUsingRemoteViewController:(BOOL)a3 completionHandler:(id)a4;
+ (void)remotePreviewCollectionWithCompletionHandler:(id)a3;
- (BOOL)_isBeingDismissed;
- (BOOL)_isBeingPresented;
- (BOOL)_isVisible;
- (BOOL)_itemViewControllerIsCurrentlyPresentedItemViewController:(id)a3;
- (BOOL)_toggleFullscreenIfPossible;
- (BOOL)allowInteractiveTransitions;
- (BOOL)currentItemViewControllerIsPerformingFocusedAction;
- (BOOL)fullScreen;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasTriggeredInteractiveTransitionAnimation;
- (BOOL)isAvailable;
- (BOOL)isDismissing;
- (BOOL)isEditing;
- (BOOL)isFirstResponderKeyInput;
- (BOOL)isFirstResponderTextEntry;
- (BOOL)isPresenting;
- (BOOL)isRemote;
- (BOOL)isTransitioningPage;
- (BOOL)itemPresenterViewControllerShouldForceAutodownloadFile:(id)a3;
- (BOOL)pinchDismissGestureInProgress;
- (BOOL)shouldStartFullScreen;
- (BOOL)transitionInProgress;
- (NSNumber)isNavigationBarChromeless;
- (NSNumber)isToolbarChromeless;
- (NSString)hostApplicationBundleIdentifier;
- (NSString)overrideParentApplicationDisplayIdentifier;
- (NSString)parentApplicationDisplayIdentifier;
- (NSUUID)uuid;
- (QLItemViewController)currentPreviewItemViewController;
- (QLPageViewController)pageViewController;
- (QLPinchRotationTracker)pinchRotationTracker;
- (QLPreviewCollection)init;
- (QLPreviewControllerStateProtocol)stateManager;
- (QLSwipeDownTracker)swipeDownTracker;
- (QLTransitionContext)transitionContext;
- (QLTransitionControllerProtocol)transitionController;
- (QLTransitionDriver)transitionDriver;
- (UIPanGestureRecognizer)slideGesture;
- (UIPinchGestureRecognizer)pinchGesture;
- (UIRotationGestureRecognizer)rotationGesture;
- (UITapGestureRecognizer)tapGesture;
- (id)_defaultKeyCommands;
- (id)_sandboxExtensionForEditedFileAtURL:(id)a3;
- (id)accessoryView;
- (id)gestureTracker;
- (id)loadingTextForPreviewItemViewController:(id)a3;
- (id)pageViewController:(id)a3 parallaxViewInPage:(id)a4 withIndex:(unint64_t)a5;
- (id)pageViewController:(id)a3 viewControllerAtIndex:(unint64_t)a4;
- (id)prepareForInvalidationCompletionHandler;
- (void)_cleanAccessoryViewContainer;
- (void)_installGestures;
- (void)_notifyHostPreviewCollectionIsReadyForInvalidationIfNeeded;
- (void)_setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)_setUpTransitionDriverForPresenting:(BOOL)a3 duration:(double)a4;
- (void)_tearDownTransition:(BOOL)a3;
- (void)_updateAccessoryViewWithPreviewItemViewController:(id)a3;
- (void)_updateCanChangeCurrentPage;
- (void)_updateCanDismissWithGesture;
- (void)_updateEnableChangingPageUsingGestures;
- (void)_updateFullscreen;
- (void)_updateFullscreenBackgroundColor;
- (void)_updateOverlay:(BOOL)a3;
- (void)_updateOverlayVisibility;
- (void)_updatePreferredContentSize;
- (void)_updatePreviewVisibility:(BOOL)a3;
- (void)_updatePrinter;
- (void)_updateTitleFromController;
- (void)_updateWhitePointAdaptivityStyle;
- (void)actionSheetDidDismiss;
- (void)completeTransition:(BOOL)a3 withDuration:(double)a4;
- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6;
- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7;
- (void)displayBarsIfNeededForDestinationViewController:(id)a3;
- (void)documentMenuActionWillBegin;
- (void)expandContentOfPreviewItemViewController:(id)a3 unarchivedItemsURL:(id)a4;
- (void)forwardKeyPressToHostIfNeeded:(id)a3 serviceCommands:(id)a4;
- (void)forwardPressesToHostIfNeeded:(id)a3;
- (void)hostApplicationDidBecomeActive;
- (void)hostApplicationDidEnterBackground:(BOOL)a3;
- (void)hostSceneWillDeactivate;
- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4;
- (void)hostViewControllerBackgroundColorChanged:(id)a3;
- (void)invalidateServiceWithCompletionHandler:(id)a3;
- (void)keyCommandWasPerformed:(id)a3;
- (void)keyCommandsWithCompletionHandler:(id)a3;
- (void)loadView;
- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3;
- (void)notifyStateRestorationUserInfo:(id)a3;
- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3;
- (void)pageViewController:(id)a3 didCancelTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 animated:(BOOL)a8;
- (void)pageViewController:(id)a3 didTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 animated:(BOOL)a8;
- (void)pageViewController:(id)a3 isTransitioningFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 withProgress:(double)a8;
- (void)pageViewController:(id)a3 willBeginInteractiveTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7;
- (void)pageViewController:(id)a3 willCancelTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 animated:(BOOL)a8;
- (void)pageViewController:(id)a3 willTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 animated:(BOOL)a8;
- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3;
- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4;
- (void)previewItemViewController:(id)a3 didEnableEditMode:(BOOL)a4;
- (void)previewItemViewController:(id)a3 didFailWithError:(id)a4;
- (void)previewItemViewController:(id)a3 hasUnsavedEdits:(BOOL)a4;
- (void)previewItemViewController:(id)a3 requestsTemporaryEditDirectoryWithCompletionHandler:(id)a4;
- (void)previewItemViewController:(id)a3 wantsChromelessNavigationBar:(BOOL)a4;
- (void)previewItemViewController:(id)a3 wantsChromelessToolbar:(BOOL)a4;
- (void)previewItemViewController:(id)a3 wantsFullScreen:(BOOL)a4;
- (void)previewItemViewController:(id)a3 wantsToForwardMessageToHost:(id)a4 completionHandler:(id)a5;
- (void)previewItemViewController:(id)a3 wantsToOpenURL:(id)a4;
- (void)previewItemViewController:(id)a3 wantsToSetRemoteEdgePanGestureWidth:(double)a4;
- (void)previewItemViewController:(id)a3 wantsToShowShareSheetWithPopoverTracker:(id)a4 customSharedURL:(id)a5 dismissCompletion:(id)a6;
- (void)previewItemViewController:(id)a3 wantsToUpdatePreviewItemDisplayState:(id)a4;
- (void)previewItemViewController:(id)a3 wantsToUpdateStateRestorationWithUserInfo:(id)a4;
- (void)previewItemViewControllerDidAcquireLock:(id)a3;
- (void)previewItemViewControllerDidChangeCurrentPreviewController:(id)a3;
- (void)previewItemViewControllerDidEditCopyOfPreviewItem:(id)a3 editedCopy:(id)a4 completionHandler:(id)a5;
- (void)previewItemViewControllerDidHandOverLock:(id)a3;
- (void)previewItemViewControllerDidUpdateContentFrame:(id)a3;
- (void)previewItemViewControllerWantsToDismissQuickLook:(id)a3;
- (void)previewItemViewControllerWantsToShowNoInternetConnectivityAlert:(id)a3;
- (void)previewItemViewControllerWantsToShowShareSheet:(id)a3;
- (void)previewItemViewControllerWantsUpdateKeyCommands:(id)a3;
- (void)previewItemViewControllerWantsUpdateOverlay:(id)a3 animated:(BOOL)a4;
- (void)requestLockForCurrentItem;
- (void)rotationOrPinchGestureRecognized:(id)a3;
- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5;
- (void)setAllowInteractiveTransitions:(BOOL)a3;
- (void)setAppearance:(id)a3 animated:(BOOL)a4;
- (void)setCurrentItemViewControllerIsPerformingFocusedAction:(BOOL)a3;
- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setFullScreen:(BOOL)a3;
- (void)setFullScreen:(BOOL)a3 forceUpdate:(BOOL)a4;
- (void)setHasTriggeredInteractiveTransitionAnimation:(BOOL)a3;
- (void)setHostApplicationBundleIdentifier:(id)a3;
- (void)setIsAvailable:(BOOL)a3;
- (void)setIsContentManaged:(BOOL)a3;
- (void)setIsDismissing:(BOOL)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setIsNavigationBarChromeless:(id)a3;
- (void)setIsPresenting:(BOOL)a3;
- (void)setIsToolbarChromeless:(id)a3;
- (void)setIsTransitioningPage:(BOOL)a3;
- (void)setLoadingString:(id)a3;
- (void)setNavigationBarShouldBeChromelessIfNeeded:(BOOL)a3;
- (void)setOverrideParentApplicationDisplayIdentifier:(id)a3;
- (void)setPageViewController:(id)a3;
- (void)setPinchGesture:(id)a3;
- (void)setPinchRotationTracker:(id)a3;
- (void)setPrepareForInvalidationCompletionHandler:(id)a3;
- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4;
- (void)setRemoteAccessoryContainer:(id)a3;
- (void)setRotationGesture:(id)a3;
- (void)setScreenEdgePanWidth:(double)a3;
- (void)setShouldStartFullScreen:(BOOL)a3;
- (void)setSlideGesture:(id)a3;
- (void)setStateManager:(id)a3;
- (void)setSwipeDownTracker:(id)a3;
- (void)setTapGesture:(id)a3;
- (void)setToolbarShouldBeChromelessIfNeeded:(BOOL)a3;
- (void)setTransitionContext:(id)a3;
- (void)setTransitionController:(id)a3;
- (void)setTransitionDriver:(id)a3;
- (void)setUuid:(id)a3;
- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3;
- (void)slideToDismissGestureRecognized:(id)a3;
- (void)startNonInteractiveTransitionPresenting:(BOOL)a3;
- (void)startTransitionWithSourceViewProvider:(id)a3 transitionController:(id)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7;
- (void)tearDownTransition:(BOOL)a3;
- (void)toolbarButtonPressedWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)toolbarButtonsForTraitCollection:(id)a3 withCompletionHandler:(id)a4;
- (void)triggerInteractiveTransitionAnimationIfNeeded;
- (void)updateCurrentPreviewConfiguration;
- (void)updateTransitionWithProgress:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation QLPreviewCollection

- (void)updateTransitionWithProgress:(double)a3
{
  v4 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  v5 = [v4 transitioningView];

  v6 = [(QLPreviewCollection *)self gestureTracker];
  [v6 trackedCenter];
  objc_msgSend(v5, "setCenter:");

  v7 = [v5 layer];
  v8 = [(QLPreviewCollection *)self gestureTracker];
  [v8 anchorPoint];
  objc_msgSend(v7, "setAnchorPoint:");

  v9 = [(QLPreviewCollection *)self gestureTracker];
  v10 = v9;
  if (v9) {
    [v9 trackedTransform];
  }
  else {
    memset(v11, 0, sizeof(v11));
  }
  [v5 setTransform:v11];
}

- (void)completeTransition:(BOOL)a3 withDuration:(double)a4
{
  v7 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  v8 = [v7 transitioningView];

  v9 = [(QLPreviewCollection *)self view];
  v10 = [(QLPreviewCollection *)self gestureTracker];
  [v10 trackedVelocity];
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;

  v19 = [(QLPreviewCollection *)self gestureTracker];
  [v19 finalAnimationSpringDamping];
  uint64_t v21 = v20;

  objc_msgSend(v8, "QL_setAnchorPointAndUpdatePosition:", 0.5, 0.5);
  if (a3)
  {
    [(QLPreviewCollection *)self _setUpTransitionDriverForPresenting:0 duration:a4];
    v22 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    char v23 = objc_opt_respondsToSelector();

    if (v23)
    {
      v24 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      [v24 transitionWillFinish:0 didComplete:1];
    }
    v25 = [(QLPreviewCollection *)self transitionDriver];
    [v25 animateTransition];
  }
  else
  {
    uint64_t v43 = v16;
    uint64_t v44 = v14;
    uint64_t v45 = v12;
    [v9 bounds];
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    double v31 = v30;
    double v33 = v32;
    v34 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    char v35 = objc_opt_respondsToSelector();

    if (v35)
    {
      v36 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      [v36 transitionWillFinish:0 didComplete:0];
    }
    v37 = (void *)MEMORY[0x263F82E00];
    v48.origin.x = v27;
    v48.origin.y = v29;
    v48.size.width = v31;
    v48.size.height = v33;
    double MidX = CGRectGetMidX(v48);
    v49.origin.x = v27;
    v49.origin.y = v29;
    v49.size.width = v31;
    v49.size.height = v33;
    CGFloat MidY = CGRectGetMidY(v49);
    double v40 = *MEMORY[0x263F00148];
    double v41 = *(double *)(MEMORY[0x263F00148] + 8);
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __79__QLPreviewCollection_InteractiveTransitions__completeTransition_withDuration___block_invoke;
    v47[3] = &unk_2642F5458;
    v47[4] = self;
    long long v42 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v46[0] = *MEMORY[0x263F000D0];
    v46[1] = v42;
    v46[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    objc_msgSend(v37, "qlph_animateView:toCenter:bounds:transform:withDuration:delay:usingSpringWithDamping:initialVelocity:options:completion:", v8, v46, 0, v47, MidX, MidY, v40, v41, v31, v33, a4, 0.0, v21, v45, v44, v43, v18);
  }
}

void __79__QLPreviewCollection_InteractiveTransitions__completeTransition_withDuration___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentPreviewItemViewController];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) currentPreviewItemViewController];
    [v4 transitionDidFinish:0 didComplete:0];
  }
}

- (void)startNonInteractiveTransitionPresenting:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = (NSObject **)MEMORY[0x263F62940];
  v5 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = NSStringFromSelector(a2);
    v8 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412546;
    v10 = v7;
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_INFO, "QLPreviewCollection %@%@ #AppearanceTransition", buf, 0x16u);
  }
  QLRunInMainThread();
}

void __87__QLPreviewCollection_InteractiveTransitions__startNonInteractiveTransitionPresenting___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setUpTransitionDriverForPresenting:*(unsigned __int8 *)(a1 + 40) duration:0.392171552];
  v2 = [*(id *)(a1 + 32) currentPreviewItemViewController];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) currentPreviewItemViewController];
    [v4 transitionDidStart:*(unsigned __int8 *)(a1 + 40)];
  }
  v5 = [*(id *)(a1 + 32) currentPreviewItemViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [*(id *)(a1 + 32) currentPreviewItemViewController];
    [v7 transitionWillFinish:*(unsigned __int8 *)(a1 + 40) didComplete:1];
  }
  id v8 = [*(id *)(a1 + 32) transitionDriver];
  [v8 animateTransition];
}

- (void)_setUpTransitionDriverForPresenting:(BOOL)a3 duration:(double)a4
{
  BOOL v5 = a3;
  uint64_t v94 = *MEMORY[0x263EF8340];
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v7 = objc_opt_new();
    [(QLPreviewCollection *)self setTransitionDriver:v7];
  }
  else
  {
    v7 = [(QLPreviewCollection *)self transitionContext];
    id v8 = objc_opt_new();
    [(QLPreviewCollection *)self setTransitionDriver:v8];
  }
  v9 = (NSObject **)MEMORY[0x263F62940];
  v10 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v10 = *v9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v11 = v10;
    uint64_t v12 = NSStringFromBOOL();
    uint64_t v13 = [(QLPreviewCollection *)self transitionDriver];
    *(_DWORD *)buf = 138412546;
    v91 = v12;
    __int16 v92 = 2112;
    v93 = v13;
    _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_INFO, "[QLPreviewCollection _setUpTransitionDriverForPresenting:%@] is about to setup a new transition with driver: %@ #AppearanceTransition", buf, 0x16u);
  }
  uint64_t v14 = [(QLPreviewCollection *)self view];
  uint64_t v15 = [(QLPreviewCollection *)self transitionDriver];
  [v15 setTransitionContainer:v14];

  uint64_t v16 = [(QLPreviewCollection *)self transitionContext];
  uint64_t v17 = [v16 sourceViewSnapshot];
  uint64_t v18 = [(QLPreviewCollection *)self transitionDriver];
  [v18 setSourceView:v17];

  v19 = [(QLPreviewCollection *)self gestureTracker];
  uint64_t v20 = [(QLPreviewCollection *)self transitionDriver];
  [v20 setGestureTracker:v19];

  uint64_t v21 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  v22 = [v21 transitioningView];
  char v23 = [(QLPreviewCollection *)self transitionDriver];
  [v23 setDestinationView:v22];

  v24 = [(QLPreviewCollection *)self transitionContext];
  [v24 sourceFrame];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v33 = [(QLPreviewCollection *)self transitionDriver];
  objc_msgSend(v33, "setSourceViewFrame:", v26, v28, v30, v32);

  v34 = [(QLPreviewCollection *)self transitionContext];
  [v34 sourceBounds];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  uint64_t v43 = [(QLPreviewCollection *)self transitionDriver];
  objc_msgSend(v43, "setSourceViewBounds:", v36, v38, v40, v42);

  uint64_t v44 = [(QLPreviewCollection *)self transitionContext];
  [v44 sourceCenter];
  double v46 = v45;
  double v48 = v47;
  CGRect v49 = [(QLPreviewCollection *)self transitionDriver];
  objc_msgSend(v49, "setSourceViewCenter:", v46, v48);

  v50 = [(QLPreviewCollection *)self transitionContext];
  v51 = v50;
  if (v50)
  {
    [v50 sourceTransform];
  }
  else
  {
    long long v88 = 0u;
    long long v89 = 0u;
    long long v87 = 0u;
  }
  v52 = [(QLPreviewCollection *)self transitionDriver];
  v86[0] = v87;
  v86[1] = v88;
  v86[2] = v89;
  [v52 setSourceViewTransform:v86];

  v53 = [(QLPreviewCollection *)self transitionContext];
  uint64_t v54 = [v53 isSourceTransformed];
  v55 = [(QLPreviewCollection *)self transitionDriver];
  [v55 setIsSourceViewTransformed:v54];

  v56 = [(QLPreviewCollection *)self transitionContext];
  [v56 uncroppedFrame];
  double v58 = v57;
  double v60 = v59;
  double v62 = v61;
  double v64 = v63;
  v65 = [(QLPreviewCollection *)self transitionDriver];
  objc_msgSend(v65, "setUncroppedFrame:", v58, v60, v62, v64);

  v66 = [(QLPreviewCollection *)self transitionDriver];
  [v66 setPresenting:v5];

  v67 = [(QLPreviewCollection *)self transitionDriver];
  [v67 setDuration:a4];

  v68 = [(QLPreviewCollection *)self transitionContext];
  [v68 topNavigationOffset];
  double v70 = v69;
  v71 = [(QLPreviewCollection *)self transitionDriver];
  [v71 setTopNavigationOffset:v70];

  v72 = [(QLPreviewCollection *)self transitionContext];
  [v72 hostNavigationOffset];
  double v74 = v73;
  v75 = [(QLPreviewCollection *)self transitionDriver];
  [v75 setHostNavigationOffset:v74];

  v76 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  v77 = [v76 context];
  v78 = [v77 item];
  v79 = [(QLPreviewCollection *)self transitionDriver];
  [v79 setTransitionPreviewItem:v78];

  v80 = [(QLPreviewCollection *)self transitionContext];
  [v80 previewItemSize];
  double v82 = v81;
  double v84 = v83;
  v85 = [(QLPreviewCollection *)self transitionDriver];
  objc_msgSend(v85, "setTransitionPreviewSize:", v82, v84);
}

- (void)_tearDownTransition:(BOOL)a3
{
}

void __67__QLPreviewCollection_InteractiveTransitions___tearDownTransition___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) transitionDriver];
  if (v2)
  {
    char v3 = [*(id *)(a1 + 32) transitionDriver];
    uint64_t v4 = [v3 presenting];
  }
  else
  {
    uint64_t v4 = 0;
  }

  BOOL v5 = (NSObject **)MEMORY[0x263F62940];
  char v6 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    char v6 = *v5;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    uint64_t v8 = NSStringFromBOOL();
    v9 = (void *)v8;
    v10 = @"dismissed";
    if (v4) {
      v10 = @"presented";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v8;
    __int16 v25 = 2112;
    double v26 = v10;
    _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_INFO, "[QLPreviewCollection _tearDownTransition: completed: %@] - Is being %@ #AppearanceTransition", buf, 0x16u);
  }
  __int16 v11 = [*(id *)(a1 + 32) currentPreviewItemViewController];
  uint64_t v12 = [v11 transitioningView];

  uint64_t v13 = [v12 layer];
  objc_msgSend(v13, "setAnchorPoint:", 0.5, 0.5);

  long long v14 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v22[0] = *MEMORY[0x263F000D0];
  v22[1] = v14;
  v22[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v12 setTransform:v22];
  [v12 setAlpha:1.0];
  double v15 = *MEMORY[0x263F00148];
  double v16 = *(double *)(MEMORY[0x263F00148] + 8);
  uint64_t v17 = [*(id *)(a1 + 32) view];
  [v17 bounds];
  objc_msgSend(v12, "setBounds:", v15, v16);

  objc_msgSend(v12, "setOrigin:", v15, v16);
  uint64_t v18 = [*(id *)(a1 + 32) transitionDriver];
  [v18 tearDown];

  v19 = [*(id *)(a1 + 32) currentPreviewItemViewController];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    uint64_t v21 = [*(id *)(a1 + 32) currentPreviewItemViewController];
    [v21 transitionDidFinish:v4 didComplete:*(unsigned __int8 *)(a1 + 40)];
  }
  [*(id *)(a1 + 32) setTransitionDriver:0];
  [*(id *)(a1 + 32) setTransitionController:0];
  [*(id *)(a1 + 32) setSwipeDownTracker:0];
  [*(id *)(a1 + 32) setPinchRotationTracker:0];
  [*(id *)(a1 + 32) setHasTriggeredInteractiveTransitionAnimation:0];
}

- (id)gestureTracker
{
  char v3 = [(QLPreviewCollection *)self swipeDownTracker];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(QLPreviewCollection *)self pinchRotationTracker];
  }
  char v6 = v5;

  return v6;
}

- (void)rotationOrPinchGestureRecognized:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollection *)self view];
  char v6 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  v7 = [v6 transitioningView];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = [(QLPreviewCollection *)self pageViewController];
    id v9 = [v10 view];
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v12 = v4;
  uint64_t v13 = [v12 state];
  if ((unint64_t)(v13 - 3) >= 3)
  {
    if (v13 == 2)
    {
      char v20 = [(QLPreviewCollection *)self pinchRotationTracker];

      if (!v20) {
        goto LABEL_27;
      }
      if ((unint64_t)[v12 numberOfTouches] < 2) {
        goto LABEL_5;
      }
      uint64_t v21 = [(QLPreviewCollection *)self pinchRotationTracker];
      [v12 locationInView:v5];
      objc_msgSend(v21, "trackGestureLocation:");

      v22 = [(QLPreviewCollection *)self pinchRotationTracker];
      if (isKindOfClass)
      {
        [v12 rotation];
        objc_msgSend(v22, "trackRotation:");
      }
      else
      {
        [v12 scale];
        objc_msgSend(v22, "trackScale:");
      }

      uint64_t v44 = [(QLPreviewCollection *)self pinchRotationTracker];
      [v44 dismissalProgress];
      double v46 = v45;

      [(QLPreviewCollection *)self updateTransitionWithProgress:v46];
      v19 = [(QLPreviewCollection *)self transitionController];
      [v19 updateTransitionWithProgress:v46];
    }
    else
    {
      if (v13 != 1 || (isKindOfClass & 1) != 0) {
        goto LABEL_27;
      }
      [v12 velocity];
      if (v15 <= 0.0)
      {
        char v23 = [(QLPreviewCollection *)self pinchRotationTracker];

        if (!v23)
        {
          uint64_t v24 = objc_opt_new();
          [(QLPreviewCollection *)self setPinchRotationTracker:v24];

          __int16 v25 = [(QLPreviewCollection *)self pinchRotationTracker];
          [v25 setMinimumZoomForDismissal:0.9];

          double v26 = [(QLPreviewCollection *)self pinchRotationTracker];
          [v26 setTargetZoom:0.1];

          [v12 locationInView:v9];
          double v28 = v27;
          double v30 = v29;
          double v31 = [(QLPreviewCollection *)self pinchRotationTracker];
          [v9 center];
          double v33 = v32;
          double v35 = v34;
          [v9 bounds];
          double v37 = v36;
          double v39 = v38;
          double v41 = v40;
          double v43 = v42;
          if (v9)
          {
            [v9 transform];
          }
          else
          {
            long long v51 = 0u;
            long long v52 = 0u;
            long long v50 = 0u;
          }
          objc_msgSend(v31, "startTrackingCenter:bounds:transform:withInitialGestureLocation:", &v50, v33, v35, v37, v39, v41, v43, v28, v30);
        }
        double v47 = [(QLPreviewCollection *)self currentPreviewItemViewController];
        char v48 = objc_opt_respondsToSelector();

        if (v48)
        {
          CGRect v49 = [(QLPreviewCollection *)self currentPreviewItemViewController];
          [v49 transitionDidStart:0];
        }
        _UIUpdateRequestActivate();
        v19 = [(QLPreviewCollection *)self stateManager];
        [v19 beginInteractiveTransition];
      }
      else
      {
        double v16 = [(QLPreviewCollection *)self pinchGesture];
        [v16 setEnabled:0];

        uint64_t v17 = [(QLPreviewCollection *)self rotationGesture];
        [v17 setEnabled:0];

        uint64_t v18 = [(QLPreviewCollection *)self pinchGesture];
        [v18 setEnabled:1];

        v19 = [(QLPreviewCollection *)self rotationGesture];
        [v19 setEnabled:1];
      }
    }

    goto LABEL_27;
  }
LABEL_5:
  _UIUpdateRequestDeactivate();
  long long v14 = [(QLPreviewCollection *)self pinchRotationTracker];

  if (v14) {
    [(QLPreviewCollection *)self triggerInteractiveTransitionAnimationIfNeeded];
  }
LABEL_27:
}

- (void)slideToDismissGestureRecognized:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollection *)self view];
  char v6 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  v7 = [v6 transitioningView];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = [(QLPreviewCollection *)self pageViewController];
    id v9 = [v10 view];
  }
  uint64_t v11 = [v4 state];
  if ((unint64_t)(v11 - 3) >= 3)
  {
    if (v11 == 2)
    {
      double v35 = [(QLPreviewCollection *)self swipeDownTracker];

      if (!v35) {
        goto LABEL_18;
      }
      [v4 translationInView:v5];
      double v37 = v36;
      double v39 = v38;
      [v4 velocityInView:v5];
      double v41 = v40;
      double v43 = v42;
      uint64_t v44 = [(QLPreviewCollection *)self swipeDownTracker];
      objc_msgSend(v44, "trackGestureTranslation:velocity:", v37, v39, v41, v43);

      double v45 = [(QLPreviewCollection *)self swipeDownTracker];
      [v45 dismissalProgress];
      double v47 = v46;

      [(QLPreviewCollection *)self updateTransitionWithProgress:v47];
      char v48 = [(QLPreviewCollection *)self transitionController];
      [v48 updateTransitionWithProgress:v47];
    }
    else
    {
      if (v11 != 1) {
        goto LABEL_18;
      }
      [v4 locationInView:v5];
      double v14 = v13;
      double v16 = v15;
      [v4 translationInView:v5];
      double v18 = v14 - v17;
      double v20 = v16 - v19;
      uint64_t v21 = objc_opt_new();
      [(QLPreviewCollection *)self setSwipeDownTracker:v21];

      v22 = [(QLPreviewCollection *)self swipeDownTracker];
      [v9 center];
      double v24 = v23;
      double v26 = v25;
      [v9 bounds];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      if (v9) {
        [v9 transform];
      }
      else {
        memset(v52, 0, sizeof(v52));
      }
      objc_msgSend(v22, "startTrackingCenter:bounds:transform:withInitialGestureLocation:", v52, v24, v26, v28, v30, v32, v34, v18, v20);

      CGRect v49 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      char v50 = objc_opt_respondsToSelector();

      if (v50)
      {
        long long v51 = [(QLPreviewCollection *)self currentPreviewItemViewController];
        [v51 transitionDidStart:0];
      }
      _UIUpdateRequestActivate();
      char v48 = [(QLPreviewCollection *)self stateManager];
      [v48 beginInteractiveTransition];
    }

    goto LABEL_18;
  }
  _UIUpdateRequestDeactivate();
  id v12 = [(QLPreviewCollection *)self swipeDownTracker];

  if (v12) {
    [(QLPreviewCollection *)self triggerInteractiveTransitionAnimationIfNeeded];
  }
LABEL_18:
}

+ (id)quickLookExtension
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = (void *)quickLookExtension_quickLookExtension;
  if (!quickLookExtension_quickLookExtension)
  {
    uint64_t v3 = *MEMORY[0x263F62A00];
    id v11 = 0;
    id v4 = [MEMORY[0x263F08800] extensionWithIdentifier:v3 error:&v11];
    id v5 = v11;
    char v6 = v5;
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      objc_storeStrong((id *)&quickLookExtension_quickLookExtension, v4);
    }
    else
    {
      uint64_t v8 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        v10 = (NSObject **)MEMORY[0x263F62940];
        QLSInitLogging();
        uint64_t v8 = *v10;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v13 = v6;
        _os_log_impl(&dword_217F61000, v8, OS_LOG_TYPE_FAULT, "Failed to get the QuickLook extension (error %@) #Discovery", buf, 0xCu);
      }
    }

    v2 = (void *)quickLookExtension_quickLookExtension;
  }

  return v2;
}

+ (void)remotePreviewCollectionWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = +[QLPreviewCollection quickLookExtension];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke;
  v6[3] = &unk_2642F5FC0;
  id v7 = v3;
  id v5 = v3;
  [v4 instantiateViewControllerWithInputItems:0 connectionHandler:v6];
}

void __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = (NSObject **)MEMORY[0x263F62940];
    id v11 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v9;
      _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_FAULT, "Error while attempting to instantiate view controller with input items: %@ #Remote", buf, 0xCu);
    }
    uint64_t v22 = MEMORY[0x263EF8330];
    uint64_t v23 = 3221225472;
    double v24 = __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_395;
    double v25 = &unk_2642F5F28;
    id v26 = *(id *)(a1 + 32);
    QLRunInMainThread();
    id v12 = v26;
  }
  else
  {
    id v13 = v8;
    [v13 setIsAvailable:1];
    uint64_t v14 = +[QLPreviewCollection quickLookExtension];
    id v12 = [v14 _extensionContextForUUID:v7];

    [v13 setHostContext:v12];
    double v15 = [v13 hostContext];
    double v16 = +[QLNotificationCenter sharedInstance];
    [v15 setNotificationCenter:v16];

    double v17 = [v13 hostContext];
    [v17 getNetworkObserverWithCompletionBlock:&__block_literal_global_399];

    [v13 setRequest:v7];
    [v13 configureAsAccessoryViewContainerForPreviewCollection:0];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_3;
    v19[3] = &unk_2642F5F98;
    id v20 = v13;
    id v21 = *(id *)(a1 + 32);
    id v18 = v13;
    [v18 getPreviewCollectionUUIDWithCompletionHandler:v19];
  }
}

void __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_395(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  v2 = objc_opt_new();
  [v3 setView:v2];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263F629A8];
  id v3 = a2;
  id v4 = [v2 sharedInstance];
  [v4 setRemoteObserver:v3];
}

void __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[QLPreviewCollection quickLookExtension];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_4;
  v6[3] = &unk_2642F5F70;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 _instantiateAccessoryViewControllerWithInputItems:0 connectionHandler:v6];
}

void __76__QLPreviewCollection_Remote__remotePreviewCollectionWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    v10 = (NSObject **)MEMORY[0x263F62940];
    id v11 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      int v15 = 138412290;
      id v16 = v9;
      _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_FAULT, "Error while attempting to instantiate view controller for the accessory view: %@ #Remote", (uint8_t *)&v15, 0xCu);
    }
  }
  id v12 = v8;
  id v13 = +[QLPreviewCollection quickLookExtension];
  uint64_t v14 = [v13 _extensionContextForUUID:v7];

  [v12 setHostContext:v14];
  [v12 configureAsAccessoryViewContainerForPreviewCollection:*(void *)(a1 + 32)];
  [v12 setRequest:v7];
  [*(id *)(a1 + 40) setAccessoryViewController:v12];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

+ (id)previewCollectionClassName
{
  return @"QLPreviewCollection";
}

+ (id)previewCollectionWithClassName:(id)a3
{
  NSClassFromString((NSString *)a3);
  id v3 = objc_opt_new();

  return v3;
}

+ (void)previewCollectionUsingRemoteViewController:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  if (v4)
  {
    if (_os_feature_enabled_impl())
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __84__QLPreviewCollection_previewCollectionUsingRemoteViewController_completionHandler___block_invoke;
      _OWORD v11[3] = &unk_2642F7350;
      id v12 = v5;
      +[QLRemoteUIHostViewController remotePreviewCollectionWithCompletionHandler:v11];
      char v6 = v12;
    }
    else
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __84__QLPreviewCollection_previewCollectionUsingRemoteViewController_completionHandler___block_invoke_2;
      v9[3] = &unk_2642F7378;
      id v10 = v5;
      +[QLPreviewCollection remotePreviewCollectionWithCompletionHandler:v9];
      char v6 = v10;
    }
  }
  else
  {
    id v7 = +[QLPreviewCollection previewCollectionClassName];
    NSClassFromString(v7);
    id v8 = objc_opt_new();
    (*((void (**)(id, void *))v5 + 2))(v5, v8);
  }
}

uint64_t __84__QLPreviewCollection_previewCollectionUsingRemoteViewController_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__QLPreviewCollection_previewCollectionUsingRemoteViewController_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (QLPreviewCollection)init
{
  v39[1] = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)QLPreviewCollection;
  v2 = [(QLPreviewCollection *)&v33 init];
  if (v2)
  {
    id v3 = [QLPageViewController alloc];
    uint64_t v38 = *MEMORY[0x263F838E0];
    v39[0] = &unk_26C9132E8;
    BOOL v4 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    id v5 = [(QLPageViewController *)v3 initWithTransitionStyle:1 navigationOrientation:0 options:v4];
    [(QLPreviewCollection *)v2 setPageViewController:v5];

    v2->_currentItemIndex = 0x7FFFFFFFFFFFFFFFLL;
    char v6 = [(QLPreviewCollection *)v2 pageViewController];
    [v6 setDelegate:v2];

    id v7 = [(QLPreviewCollection *)v2 pageViewController];
    [v7 setIndexedDataSource:v2];

    id v8 = [(QLPreviewCollection *)v2 pageViewController];
    [v8 setParallaxIntensity:0.15];

    id v9 = [(QLPreviewCollection *)v2 pageViewController];
    [(QLPreviewCollection *)v2 addChildViewController:v9];

    id v10 = [(QLPreviewCollection *)v2 view];
    id v11 = [(QLPreviewCollection *)v2 pageViewController];
    id v12 = [v11 view];
    [v10 addSubview:v12];

    id v13 = [(QLPreviewCollection *)v2 pageViewController];
    [v13 didMoveToParentViewController:v2];

    uint64_t v14 = [(QLPreviewCollection *)v2 pageViewController];
    int v15 = [v14 view];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v16 = [(QLPreviewCollection *)v2 view];
    uint64_t v17 = (void *)MEMORY[0x263F08938];
    double v36 = @"pageViewController";
    id v18 = [(QLPreviewCollection *)v2 pageViewController];
    double v19 = [v18 view];
    double v37 = v19;
    id v20 = [NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    id v21 = [v17 constraintsWithVisualFormat:@"H:|[pageViewController]|" options:0 metrics:0 views:v20];
    [v16 addConstraints:v21];

    uint64_t v22 = [(QLPreviewCollection *)v2 view];
    uint64_t v23 = (void *)MEMORY[0x263F08938];
    double v34 = @"pageViewController";
    double v24 = [(QLPreviewCollection *)v2 pageViewController];
    double v25 = [v24 view];
    double v35 = v25;
    id v26 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    double v27 = [v23 constraintsWithVisualFormat:@"V:|[pageViewController]|" options:0 metrics:0 views:v26];
    [v22 addConstraints:v27];

    uint64_t v28 = objc_opt_new();
    itemStore = v2->_itemStore;
    v2->_itemStore = (QLPreviewItemStore *)v28;

    [(QLPreviewCollection *)v2 _installGestures];
    [(QLPreviewCollection *)v2 setAutomaticallyAdjustsScrollViewInsets:0];
    double v30 = [MEMORY[0x263F08C38] UUID];
    [(QLPreviewCollection *)v2 setUuid:v30];

    double v31 = v2;
  }

  return v2;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)QLPreviewCollection;
  [(QLPreviewCollection *)&v5 loadView];
  id v3 = [(QLPreviewCollection *)self view];
  BOOL v4 = [v3 layer];
  [v4 setHitTestsAsOpaque:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)QLPreviewCollection;
  [(QLPreviewCollection *)&v8 viewWillAppear:a3];
  if (!self->_previewCollectionIsPartOfViewHierarchy)
  {
    self->_previewCollectionIsPartOfViewHierarchy = 1;
    [(QLPreviewCollection *)self setCurrentPreviewItemIndex:self->_currentItemIndex animated:0];
  }
  if (_os_feature_enabled_impl()
    && ![(QLPreviewCollection *)self isPresenting]
    && ![(QLPreviewCollection *)self isDismissing])
  {
    [(QLPreviewCollection *)self setIsPresenting:1];
    BOOL v4 = [(QLPreviewCollection *)self currentPreviewItemViewController];

    if (v4)
    {
      objc_super v5 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      char v6 = objc_opt_respondsToSelector();

      if (v6)
      {
        id v7 = [(QLPreviewCollection *)self currentPreviewItemViewController];
        objc_msgSend(v7, "transitionDidStart:", -[QLPreviewCollection isPresenting](self, "isPresenting"));
      }
    }
    else
    {
      self->_previewItemControllerMissedTransitionStart = 1;
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)QLPreviewCollection;
  [(QLPreviewCollection *)&v12 viewDidAppear:a3];
  [(QLPreviewCollection *)self updateCurrentPreviewConfiguration];
  if (_os_feature_enabled_impl()
    && ([(QLPreviewCollection *)self isPresenting]
     || [(QLPreviewCollection *)self isDismissing]))
  {
    BOOL v4 = [(QLPreviewCollection *)self isPresenting];
    uint64_t v5 = [(QLPreviewCollection *)self isDismissing] ^ 1;
    char v6 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      objc_super v8 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      [v8 transitionWillFinish:v4 didComplete:v5];
    }
    id v9 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      [v11 transitionDidFinish:v4 didComplete:v5];
    }
    [(QLPreviewCollection *)self setIsPresenting:0];
    [(QLPreviewCollection *)self setIsDismissing:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)QLPreviewCollection;
  [(QLPreviewCollection *)&v7 viewWillDisappear:a3];
  if (_os_feature_enabled_impl()
    && ![(QLPreviewCollection *)self isPresenting]
    && ![(QLPreviewCollection *)self isDismissing])
  {
    [(QLPreviewCollection *)self setIsDismissing:1];
    BOOL v4 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      char v6 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      objc_msgSend(v6, "transitionDidStart:", -[QLPreviewCollection isPresenting](self, "isPresenting"));
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)QLPreviewCollection;
  [(QLPreviewCollection *)&v12 viewDidDisappear:a3];
  self->_previewCollectionIsPartOfViewHierarchy = 0;
  if (_os_feature_enabled_impl()
    && ([(QLPreviewCollection *)self isPresenting]
     || [(QLPreviewCollection *)self isDismissing]))
  {
    BOOL v4 = [(QLPreviewCollection *)self isPresenting];
    BOOL v5 = [(QLPreviewCollection *)self isDismissing];
    char v6 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      objc_super v8 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      [v8 transitionWillFinish:v4 didComplete:v5];
    }
    id v9 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      id v11 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      [v11 transitionDidFinish:v4 didComplete:v5];
    }
    [(QLPreviewCollection *)self setIsPresenting:0];
    [(QLPreviewCollection *)self setIsDismissing:0];
  }
}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

void __64__QLPreviewCollection_hostViewControllerBackgroundColorChanged___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pageViewController];
  id v6 = [v2 currentPage];

  id v3 = [v6 currentPreviewViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    BOOL v5 = [v6 currentPreviewViewController];
    [v5 hostViewControllerBackgroundColorChanged:*(void *)(a1 + 40)];
  }
}

- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4
{
}

uint64_t __67__QLPreviewCollection_hostViewControlerTransitionToState_animated___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1064) = *(void *)(a1 + 40);
  return [*(id *)(a1 + 32) _updatePreviewVisibility:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_updatePreviewVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  switch(self->_visibilityState)
  {
    case 0uLL:
      BOOL v5 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      [v5 previewDidDisappear:v3];

      [(QLPreviewCollection *)self _cleanAccessoryViewContainer];
      return;
    case 1uLL:
      id v6 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      [v6 previewWillDisappear:v3];
      goto LABEL_8;
    case 2uLL:
      id v6 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      [v6 previewDidAppear:v3];
      goto LABEL_8;
    case 3uLL:
      id v6 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      [v6 previewWillAppear:v3];
LABEL_8:

      break;
    default:
      return;
  }
}

- (void)updateCurrentPreviewConfiguration
{
  BOOL v3 = [(QLPreviewCollection *)self stateManager];
  [v3 updateKeyCommands];

  [(QLPreviewCollection *)self _updateOverlay:1];
  char v4 = [(QLPreviewCollection *)self pageViewController];
  id v10 = [v4 currentPage];

  [(QLPreviewCollection *)self _updateFullscreenBackgroundColor];
  [(QLPreviewCollection *)self _updateFullscreen];
  [(QLPreviewCollection *)self _updateAccessoryViewWithPreviewItemViewController:v10];
  [(QLPreviewCollection *)self _updateWhitePointAdaptivityStyle];
  [(QLPreviewCollection *)self _updatePrinter];
  [(QLPreviewCollection *)self _updateTitleFromController];
  [(QLPreviewCollection *)self _updatePreferredContentSize];
  BOOL v5 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  id v6 = [v5 scrollView];

  if (v6)
  {
    char v7 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    objc_super v8 = [v7 scrollView];
    id v9 = [v8 pinchGestureRecognizer];
    [v9 requireGestureRecognizerToFail:self->_pinchGesture];
  }
}

- (void)setRemoteAccessoryContainer:(id)a3
{
}

- (id)accessoryView
{
  p_remoteAccessoryViewContainer = &self->_remoteAccessoryViewContainer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteAccessoryViewContainer);
  if (WeakRetained) {
    goto LABEL_2;
  }
  if (!self->_localAccessoryViewContainer)
  {
    id v9 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    WeakRetained = self->_localAccessoryViewContainer;
    self->_localAccessoryViewContainer = v9;
LABEL_2:
  }
  localAccessoryViewContainer = objc_loadWeakRetained((id *)p_remoteAccessoryViewContainer);
  id v6 = localAccessoryViewContainer;
  if (!localAccessoryViewContainer) {
    localAccessoryViewContainer = self->_localAccessoryViewContainer;
  }
  id v7 = localAccessoryViewContainer;

  return v7;
}

- (BOOL)isRemote
{
  return 0;
}

- (BOOL)isAvailable
{
  return 1;
}

- (void)setAllowInteractiveTransitions:(BOOL)a3
{
  self->_allowInteractiveTransitions = a3;
}

- (void)setFullScreen:(BOOL)a3 forceUpdate:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(QLAppearance *)self->_appearance presentationMode] != 4
    && [(QLAppearance *)self->_appearance presentationMode] != 3
    && [(QLAppearance *)self->_appearance presentationMode] != 5)
  {
    id v7 = [(QLPreviewCollection *)self pageViewController];
    objc_super v8 = [v7 currentPage];
    int v9 = [v8 canEnterFullScreen];

    BOOL v10 = v9 & v5;
    if (self->_fullScreen != v10 || v4)
    {
      self->_fullScreen = v10;
      objc_super v12 = [(QLPreviewCollection *)self stateManager];
      [v12 setFullScreen:v10];

      id v13 = [(QLPreviewCollection *)self pageViewController];
      uint64_t v14 = [v13 currentPage];
      [v14 previewBecameFullScreen:v10 animated:1];

      id v15 = [(QLPreviewCollection *)self stateManager];
      [v15 updateKeyCommands];
    }
  }
}

- (void)setFullScreen:(BOOL)a3
{
}

- (void)setScreenEdgePanWidth:(double)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v4 = (NSObject **)MEMORY[0x263F62940];
  BOOL v5 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    BOOL v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    double v7 = a3;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_INFO, "QLPreviewCollection's edge pan gesture region width has been set to %f #PreviewCollection", (uint8_t *)&v6, 0xCu);
  }
}

- (QLItemViewController)currentPreviewItemViewController
{
  v2 = [(QLPreviewCollection *)self pageViewController];
  BOOL v3 = [v2 currentPage];

  return (QLItemViewController *)v3;
}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

void __84__QLPreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pageViewController];
  id v3 = [v2 currentPage];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __84__QLPreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_2642F5EB8;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [v3 prepareForInvalidationWithCompletionHandler:v5];
}

void __84__QLPreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v1 = *(id *)(a1 + 40);
  QLRunInMainThread();
}

uint64_t __84__QLPreviewCollection_preparePreviewCollectionForInvalidationWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1136);
  *(void *)(v3 + 1136) = v2;

  BOOL v5 = *(void **)(a1 + 32);

  return [v5 _notifyHostPreviewCollectionIsReadyForInvalidationIfNeeded];
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
}

- (void)_notifyHostPreviewCollectionIsReadyForInvalidationIfNeeded
{
  if (![(QLPreviewCollection *)self _isBeingDismissed])
  {
    id prepareForInvalidationCompletionHandler = self->_prepareForInvalidationCompletionHandler;
    if (prepareForInvalidationCompletionHandler)
    {
      BOOL v5 = (void (**)(void))[prepareForInvalidationCompletionHandler copy];
      id v4 = self->_prepareForInvalidationCompletionHandler;
      self->_id prepareForInvalidationCompletionHandler = 0;

      v5[2]();
    }
  }
}

- (NSString)hostApplicationBundleIdentifier
{
  hostApplicationBundleIdentifier = self->_hostApplicationBundleIdentifier;
  if (!hostApplicationBundleIdentifier)
  {
    id v4 = (NSObject **)MEMORY[0x263F62940];
    BOOL v5 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      BOOL v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_ERROR, "hostApplicationBundleIdentifier getting accessed before being set, should not happen in QuickLookUIExtension. Trying best effort to determine identifier with entitlement. #PreviewCollection", v9, 2u);
    }
    id v6 = +[QLUtilitiesInternal getCurrentApplicationBundleIdentifier];
    double v7 = self->_hostApplicationBundleIdentifier;
    self->_hostApplicationBundleIdentifier = v6;

    hostApplicationBundleIdentifier = self->_hostApplicationBundleIdentifier;
  }

  return hostApplicationBundleIdentifier;
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6
{
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7
{
  id v8 = a5;
  id v11 = a6;
  id v9 = v11;
  id v10 = v8;
  QLRunInMainThread();
}

void __111__QLPreviewCollection_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 992) = *(void *)(a1 + 56);
  [*(id *)(*(void *)(a1 + 32) + 1000) setItemProvider:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 1000) reloadWithNumberOfPreviewItems:*(void *)(a1 + 64)];
  BOOL v2 = *(void *)(a1 + 64) > 1;
  uint64_t v3 = [*(id *)(a1 + 32) pageViewController];
  id v4 = [v3 scrollView];
  [v4 setScrollEnabled:v2];

  [*(id *)(a1 + 32) setStateManager:*(void *)(a1 + 48)];
  BOOL v5 = [*(id *)(a1 + 32) pageViewController];
  [v5 clearInternalCache];

  [*(id *)(a1 + 32) setCurrentPreviewItemIndex:*(void *)(a1 + 56) animated:0];
  id v6 = *(unsigned char **)(a1 + 32);
  if (v6[1073])
  {
    v6[1073] = 0;
    double v7 = [*(id *)(a1 + 32) currentPreviewItemViewController];
    char v8 = objc_opt_respondsToSelector();

    id v6 = *(unsigned char **)(a1 + 32);
    if (v8)
    {
      id v9 = [v6 currentPreviewItemViewController];
      objc_msgSend(v9, "transitionDidStart:", objc_msgSend(*(id *)(a1 + 32), "isPresenting"));

      id v6 = *(unsigned char **)(a1 + 32);
    }
  }
  [v6 setShouldStartFullScreen:*(unsigned __int8 *)(a1 + 72)];
  *(unsigned char *)(*(void *)(a1 + 32) + 1098) = *(unsigned char *)(a1 + 72);
  id v10 = [*(id *)(a1 + 32) currentPreviewItemViewController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __111__QLPreviewCollection_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen___block_invoke_2;
  _OWORD v11[3] = &unk_2642F5430;
  void v11[4] = *(void *)(a1 + 32);
  [v10 isReadyForDisplayWithCompletionHandler:v11];
}

void __111__QLPreviewCollection_configureWithNumberOfItems_currentPreviewItemIndex_itemProvider_stateManager_fullScreen___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) stateManager];
  [v1 currentPreviewItemViewControllerIsReadyForDisplay];
}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
}

uint64_t __59__QLPreviewCollection_setCurrentPreviewItemIndex_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsEditing:0];
  *(void *)(*(void *)(a1 + 32) + 992) = *(void *)(a1 + 40);
  BOOL v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);

  return [v2 _setCurrentPreviewItemIndex:v3 animated:v4];
}

- (void)_setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = (NSObject **)MEMORY[0x263F62940];
    BOOL v5 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      BOOL v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v6 = "QLPreviewCollection has no current index set yet, so it can't start loading previews. #PreviewCollection";
      double v7 = buf;
LABEL_6:
      _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
    }
  }
  else
  {
    BOOL v8 = a4;
    if (self->_previewCollectionIsPartOfViewHierarchy || (_os_feature_enabled_impl() & 1) != 0)
    {
      id v12 = [(QLPreviewCollection *)self pageViewController];
      [v12 setCurrentPageIndex:a3 animated:v8];
    }
    else
    {
      id v11 = (NSObject **)MEMORY[0x263F62940];
      BOOL v5 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        BOOL v5 = *v11;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = 0;
        id v6 = "QLPreviewCollection is not part of the view hierarchy, so it can't start loading previews. #PreviewCollection";
        double v7 = (uint8_t *)&v13;
        goto LABEL_6;
      }
    }
  }
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  if ([(QLPreviewCollection *)self _isBeingPresented]) {
    UIAccessibilityIsReduceMotionEnabled();
  }
  id v6 = v5;
  QLRunInMainThread();
}

void __46__QLPreviewCollection_setAppearance_animated___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1048), *(id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) currentPreviewItemViewController];
  [v2 setAppearance:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3
{
  objc_initWeak(&location, self);
  objc_copyWeak(v4, &location);
  v4[1] = (id)a3;
  QLRunInMainThread();
  objc_destroyWeak(v4);
  objc_destroyWeak(&location);
}

void __60__QLPreviewCollection_notifyFirstTimeAppearanceWithActions___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_INFO, "notifyFirstTimeAppearanceWithActions #PreviewCollection", v8, 2u);
  }
  id v5 = [*(id *)(a1 + 32) currentPreviewItemViewController];
  int v6 = [v5 isLoaded];
  uint64_t v7 = *(void *)(a1 + 48);
  if (v6)
  {
    [v5 performFirstTimeAppearanceActionsIfNeeded:v7];
    WeakRetained[136] = 0;
    if ((*(unsigned char *)(a1 + 48) & 4) == 0 && [*(id *)(*(void *)(a1 + 32) + 1048) presentationMode] == 2) {
      objc_msgSend(*(id *)(a1 + 32), "setFullScreen:forceUpdate:", objc_msgSend(*(id *)(a1 + 32), "shouldStartFullScreen"), 1);
    }
  }
  else
  {
    WeakRetained[136] = v7;
  }
}

- (void)notifyStateRestorationUserInfo:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

void __54__QLPreviewCollection_notifyStateRestorationUserInfo___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentPreviewItemViewController];
  if ([v2 isLoaded]) {
    [v2 notifyStateRestorationWithUserInfoIfNeeded:*(void *)(a1 + 40)];
  }
}

- (void)toolbarButtonsForTraitCollection:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v5;
  id v7 = v8;
  QLRunInMainThread();
}

void __78__QLPreviewCollection_toolbarButtonsForTraitCollection_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pageViewController];
  id v6 = [v2 currentPage];

  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [v6 toolbarButtonsForTraitCollection:*(void *)(a1 + 40)];
  id v5 = [v6 excludedToolbarButtonIdentifiersForTraitCollection:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);
}

- (void)toolbarButtonPressedWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v8 = a4;
  id v6 = v8;
  id v7 = v5;
  QLRunInMainThread();
}

void __76__QLPreviewCollection_toolbarButtonPressedWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) pageViewController];
  uint64_t v3 = [v2 currentPage];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = (NSObject **)MEMORY[0x263F62940];
    id v6 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = *(void **)(a1 + 32);
      id v8 = v6;
      id v9 = [v7 pageViewController];
      id v10 = [v9 currentPage];
      uint64_t v11 = *(void *)(a1 + 40);
      int v14 = 138412546;
      id v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_217F61000, v8, OS_LOG_TYPE_INFO, "Notifying current item view controller: %@ about button pressed with identifier: %@. #PreviewCollection", (uint8_t *)&v14, 0x16u);
    }
    id v12 = [*(id *)(a1 + 32) pageViewController];
    __int16 v13 = [v12 currentPage];
    [v13 buttonPressedWithIdentifier:*(void *)(a1 + 40) completionHandler:*(void *)(a1 + 48)];
  }
}

- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  QLRunInMainThread();
}

void __82__QLPreviewCollection_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pageViewController];
  uint64_t v3 = [v2 currentPageIndex];

  id v4 = [*(id *)(a1 + 32) pageViewController];
  id v5 = [v4 currentPage];

  if (v5)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __82__QLPreviewCollection_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke_48;
    v9[3] = &unk_2642F73C8;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = v3;
    [v5 savePreviewEditedCopyWithCompletionHandler:v9];
  }
  else
  {
    id v6 = (NSObject **)MEMORY[0x263F62940];
    id v7 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_ERROR, "QLPreviewCollection has no current item, could not save current preview edits #PreviewCollection", buf, 2u);
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 0x7FFFFFFFFFFFFFFFLL, 0);
    }
  }
}

uint64_t __82__QLPreviewCollection_saveCurrentPreviewEditsSynchronously_withCompletionHandler___block_invoke_48(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, *(void *)(a1 + 40), a2);
  }
  return result;
}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

void __78__QLPreviewCollection_prepareForActionSheetPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pageViewController];
  id v7 = [v2 currentPage];

  id v3 = [v7 currentPreviewViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [v7 currentPreviewViewController];
    [v5 prepareForActionSheetPresentation];
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

- (void)actionSheetDidDismiss
{
}

void __44__QLPreviewCollection_actionSheetDidDismiss__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) pageViewController];
  id v5 = [v1 currentPage];

  id v2 = [v5 currentPreviewViewController];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    char v4 = [v5 currentPreviewViewController];
    [v4 actionSheetDidDismiss];
  }
}

- (void)hostSceneWillDeactivate
{
}

void __46__QLPreviewCollection_hostSceneWillDeactivate__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) pageViewController];
  id v5 = [v1 currentPage];

  id v2 = [v5 currentPreviewViewController];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    char v4 = [v5 currentPreviewViewController];
    [v4 hostSceneWillDeactivate];
  }
}

- (void)documentMenuActionWillBegin
{
}

void __50__QLPreviewCollection_documentMenuActionWillBegin__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) pageViewController];
  id v5 = [v1 currentPage];

  id v2 = [v5 currentPreviewViewController];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    char v4 = [v5 currentPreviewViewController];
    [v4 documentMenuActionWillBegin];
  }
}

- (void)hostApplicationDidEnterBackground:(BOOL)a3
{
}

void __57__QLPreviewCollection_hostApplicationDidEnterBackground___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pageViewController];
  id v7 = [v2 currentPage];

  char v3 = [v7 currentPreviewViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [v7 currentPreviewViewController];
    uint64_t v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    [v5 hostApplicationDidEnterBackground:v6];
  }
}

- (void)hostApplicationDidBecomeActive
{
}

void __53__QLPreviewCollection_hostApplicationDidBecomeActive__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) pageViewController];
  id v5 = [v1 currentPage];

  id v2 = [v5 currentPreviewViewController];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    char v4 = [v5 currentPreviewViewController];
    [v4 hostApplicationDidBecomeActive];
  }
}

- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3
{
  char v4 = (void (**)(id, uint64_t))a3;
  id v5 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  v4[2](v4, [v5 canBeLocked]);
}

- (void)requestLockForCurrentItem
{
}

void __48__QLPreviewCollection_requestLockForCurrentItem__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) currentPreviewItemViewController];
  [v1 requestLockForCurrentItem];
}

- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  gotLoadHelper_x20__OBJC_CLASS___PHPhotoLibrary(v10);
  uint64_t v11 = [*(id *)(v5 + 3736) systemPhotoLibraryURL];
  id v12 = (void *)[objc_alloc(*(Class *)(v5 + 3736)) initWithPhotoLibraryURL:v11];
  __int16 v13 = [v8 url];
  char v14 = [v13 startAccessingSecurityScopedResource];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __97__QLPreviewCollection_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler___block_invoke;
  _OWORD v22[3] = &unk_2642F55B8;
  id v23 = v8;
  unint64_t v24 = a4;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __97__QLPreviewCollection_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler___block_invoke_2;
  v18[3] = &unk_2642F73F0;
  char v21 = v14;
  id v19 = v13;
  id v20 = v9;
  id v15 = v9;
  id v16 = v13;
  id v17 = v8;
  [v12 performChanges:v22 completionHandler:v18];
}

void __97__QLPreviewCollection_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  switch(v3)
  {
    case 1:
      double Helper_x8__OBJC_CLASS___PHAssetCreationRequest = gotLoadHelper_x8__OBJC_CLASS___PHAssetCreationRequest(a2);
      objc_msgSend(*(id *)(v10 + 3400), "creationRequestForAsset", Helper_x8__OBJC_CLASS___PHAssetCreationRequest);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [*(id *)(a1 + 32) url];
      id v7 = v25;
      uint64_t v8 = 2;
      break;
    case 3:
      double v11 = gotLoadHelper_x8__OBJC_CLASS___PHAssetCreationRequest(a2);
      objc_msgSend(*(id *)(v12 + 3400), "creationRequestForAsset", v11);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      gotLoadHelper_x8__OBJC_CLASS___PFVideoComplement(v13);
      id v15 = objc_alloc(*(Class *)(v14 + 4016));
      id v16 = [*(id *)(a1 + 32) url];
      uint64_t v6 = (void *)[v15 initWithBundleAtURL:v16];

      id v17 = [v6 imagePath];

      if (v17)
      {
        uint64_t v18 = NSURL;
        id v19 = [v6 imagePath];
        id v20 = [v18 fileURLWithPath:v19];

        [v25 addResourceWithType:1 fileURL:v20 options:0];
      }
      char v21 = [v6 videoPath];

      if (v21)
      {
        uint64_t v22 = NSURL;
        id v23 = [v6 videoPath];
        unint64_t v24 = [v22 fileURLWithPath:v23];

        [v25 addResourceWithType:9 fileURL:v24 options:0];
      }
      goto LABEL_11;
    case 2:
      double v4 = gotLoadHelper_x8__OBJC_CLASS___PHAssetCreationRequest(a2);
      objc_msgSend(*(id *)(v5 + 3400), "creationRequestForAsset", v4);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v6 = [*(id *)(a1 + 32) url];
      id v7 = v25;
      uint64_t v8 = 1;
      break;
    default:
      return;
  }
  [v7 addResourceWithType:v8 fileURL:v6 options:0];
LABEL_11:
}

void __97__QLPreviewCollection_saveIntoPhotoLibraryMediaWithURLWrapper_previewItemType_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) stopAccessingSecurityScopedResource];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(QLPreviewCollection *)self forwardPressesToHostIfNeeded:v7];
  v8.receiver = self;
  v8.super_class = (Class)QLPreviewCollection;
  [(QLPreviewCollection *)&v8 pressesBegan:v7 withEvent:v6];
}

- (void)forwardPressesToHostIfNeeded:(id)a3
{
  id v4 = a3;
  if ([(QLPreviewCollection *)self isFirstResponderTextEntry])
  {
    uint64_t v5 = (NSObject **)MEMORY[0x263F62940];
    id v6 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v6 = *v5;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v7 = "Not propagating presses from service to host since they're in a text entry #Remote";
LABEL_11:
      _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_INFO, v7, buf, 2u);
    }
  }
  else
  {
    if (![(QLPreviewCollection *)self isFirstResponderKeyInput])
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __52__QLPreviewCollection_forwardPressesToHostIfNeeded___block_invoke;
      v9[3] = &unk_2642F7000;
      id v10 = v4;
      double v11 = self;
      [(QLPreviewCollection *)self keyCommandsWithCompletionHandler:v9];

      goto LABEL_13;
    }
    id v6 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      objc_super v8 = (NSObject **)MEMORY[0x263F62940];
      QLSInitLogging();
      id v6 = *v8;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      id v7 = "Not propagating presses from service to host since a UIKeyInput (e.g., text field) is first responder #Remote";
      goto LABEL_11;
    }
  }
LABEL_13:
}

void __52__QLPreviewCollection_forwardPressesToHostIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(a1 + 40);
        id v10 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "key", (void)v11);
        [v9 forwardKeyPressToHostIfNeeded:v10 serviceCommands:v3];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)isFirstResponderTextEntry
{
  id v2 = [(QLPreviewCollection *)self firstResponder];
  char v3 = [v2 conformsToProtocol:&unk_26C972458];

  return v3;
}

- (BOOL)isFirstResponderKeyInput
{
  id v2 = [MEMORY[0x263F828A0] activeKeyboard];
  char v3 = [v2 targetWindow];
  id v4 = [v3 firstResponder];

  LOBYTE(v2) = [v4 conformsToProtocol:&unk_26C972458];
  return (char)v2;
}

- (void)forwardKeyPressToHostIfNeeded:(id)a3 serviceCommands:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v36 = v6;
  uint64_t v8 = [v6 charactersIgnoringModifiers];
  if ([v8 length])
  {
    double v34 = self;
    id v35 = v7;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v15 = [v36 modifierFlags];
          uint64_t v16 = [v14 keyCommand];
          id v17 = [v16 input];
          if ([v8 isEqualToString:v17])
          {
            id v18 = v9;
            uint64_t v19 = [v16 modifierFlags];

            BOOL v20 = v15 == v19;
            id v9 = v18;
            if (v20)
            {
              uint64_t v25 = [v16 modifierFlags];
              id v26 = (NSObject **)MEMORY[0x263F62940];
              double v27 = *MEMORY[0x263F62940];
              if (v25)
              {
                if (!v27)
                {
                  QLSInitLogging();
                  double v27 = *v26;
                }
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  uint64_t v28 = v27;
                  uint64_t v29 = [v36 description];
                  double v30 = [v16 description];
                  *(_DWORD *)buf = 138412546;
                  double v42 = v29;
                  __int16 v43 = 2112;
                  uint64_t v44 = v30;
                  _os_log_impl(&dword_217F61000, v28, OS_LOG_TYPE_INFO, "Service ignores key press (%@) with key command (%@) since keycommands with modifiers is already sent to and handled by the host #Remote", buf, 0x16u);

                  id v9 = v18;
                }
              }
              else
              {
                if (!v27)
                {
                  QLSInitLogging();
                  double v27 = *v26;
                }
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  double v31 = v27;
                  double v32 = [v36 description];
                  objc_super v33 = [v16 description];
                  *(_DWORD *)buf = 138412546;
                  double v42 = v32;
                  __int16 v43 = 2112;
                  uint64_t v44 = v33;
                  _os_log_impl(&dword_217F61000, v31, OS_LOG_TYPE_INFO, "Service will directly handle key press (%@) with key command (%@) since it has no modifier #Remote", buf, 0x16u);

                  id v9 = v18;
                }
                [(QLPreviewCollection *)v34 keyCommandWasPerformed:v14];
              }
              goto LABEL_29;
            }
          }
          else
          {
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    char v21 = (NSObject **)MEMORY[0x263F62940];
    uint64_t v22 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      uint64_t v22 = *v21;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = v22;
      unint64_t v24 = [v36 description];
      *(_DWORD *)buf = 138412290;
      double v42 = v24;
      _os_log_impl(&dword_217F61000, v23, OS_LOG_TYPE_INFO, "Propagating unhandled key press from service to host: (%@) #Remote", buf, 0xCu);
    }
    id v9 = [(QLPreviewCollection *)v34 stateManager];
    uint64_t v16 = [v36 charactersIgnoringModifiers];
    objc_msgSend(v9, "handleKeyPressWithInput:modifierFlags:", v16, objc_msgSend(v36, "modifierFlags"));
LABEL_29:
    id v7 = v35;
  }
}

- (void)keyCommandsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

void __56__QLPreviewCollection_keyCommandsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) _defaultKeyCommands];
  id v3 = [*(id *)(a1 + 32) pageViewController];
  id v4 = [v3 currentPage];
  uint64_t v5 = [v4 registeredKeyCommands];
  id v6 = [v7 arrayByAddingObjectsFromArray:v5];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
}

- (id)_defaultKeyCommands
{
  id v3 = objc_opt_new();
  id v4 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  if ([v4 canEnterFullScreen])
  {
    uint64_t v5 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    int v6 = [v5 canToggleFullScreen];

    if (!v6) {
      goto LABEL_5;
    }
    [(QLPreviewCollection *)self fullScreen];
    id v4 = QLLocalizedString();
    id v7 = [MEMORY[0x263F82890] keyCommandWithInput:@"f" modifierFlags:1310720 action:sel__toggleFullscreenIfPossible];
    [v7 setDiscoverabilityTitle:v4];
    uint64_t v8 = [MEMORY[0x263F629A0] keyCommandWithKeyCommand:v7 identifier:5];
    [v3 addObject:v8];
  }
LABEL_5:

  return v3;
}

- (void)keyCommandWasPerformed:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  QLRunInMainThread();
}

void __46__QLPreviewCollection_keyCommandWasPerformed___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) keyCommandIdentifier];
  id v3 = *(void **)(a1 + 40);
  if (v2 == 5)
  {
    [v3 _toggleFullscreenIfPossible];
  }
  else
  {
    id v4 = [v3 pageViewController];
    id v6 = [v4 currentPage];

    uint64_t v5 = [v6 currentPreviewViewController];
    [v5 handlePerformedKeyCommandIfNeeded:*(void *)(a1 + 32)];
  }
}

- (void)triggerInteractiveTransitionAnimationIfNeeded
{
}

void __68__QLPreviewCollection_triggerInteractiveTransitionAnimationIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) transitionController];

  if (!v2 || ([*(id *)(a1 + 32) hasTriggeredInteractiveTransitionAnimation] & 1) != 0) {
    return;
  }
  id v3 = [*(id *)(a1 + 32) slideGesture];
  if ([v3 state] == 1) {
    goto LABEL_8;
  }
  id v4 = [*(id *)(a1 + 32) slideGesture];
  if ([v4 state] == 2)
  {
LABEL_7:

LABEL_8:
LABEL_9:
    id v6 = (NSObject **)MEMORY[0x263F62940];
    id v7 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_INFO, "QLPreviewCollection will not trigger interactive transition because gesture is still active. #AppearanceTransition", (uint8_t *)&v21, 2u);
    }
    return;
  }
  uint64_t v5 = [*(id *)(a1 + 32) pinchGesture];
  if ([v5 state] == 1)
  {

    goto LABEL_7;
  }
  uint64_t v8 = [*(id *)(a1 + 32) pinchGesture];
  if ([v8 state] == 2)
  {
    id v9 = [*(id *)(a1 + 32) pinchGesture];
    unint64_t v10 = [v9 numberOfTouches];

    if (v10 > 1) {
      goto LABEL_9;
    }
  }
  else
  {
  }
  [*(id *)(a1 + 32) setHasTriggeredInteractiveTransitionAnimation:1];
  uint64_t v11 = [*(id *)(a1 + 32) gestureTracker];
  uint64_t v12 = [v11 shouldFinishDismissal];

  long long v13 = (NSObject **)MEMORY[0x263F62940];
  long long v14 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    long long v14 = *v13;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = v14;
    uint64_t v16 = NSStringFromBOOL();
    int v21 = 138412290;
    uint64_t v22 = v16;
    _os_log_impl(&dword_217F61000, v15, OS_LOG_TYPE_INFO, "QLPreviewCollection is triggering interactive transition (finished: %@) #AppearanceTransition", (uint8_t *)&v21, 0xCu);
  }
  id v17 = *(void **)(a1 + 32);
  id v18 = [v17 gestureTracker];
  [v18 finalAnimationDuration];
  objc_msgSend(v17, "completeTransition:withDuration:", v12);

  uint64_t v19 = [*(id *)(a1 + 32) transitionController];
  BOOL v20 = [*(id *)(a1 + 32) gestureTracker];
  [v20 finalAnimationDuration];
  objc_msgSend(v19, "completeTransition:withDuration:", v12);
}

- (void)startTransitionWithSourceViewProvider:(id)a3 transitionController:(id)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a7;
  uint64_t v12 = (NSObject **)MEMORY[0x263F62940];
  long long v13 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    long long v13 = *v12;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    long long v14 = v13;
    uint64_t v15 = NSStringFromBOOL();
    uint64_t v16 = NSStringFromBOOL();
    *(_DWORD *)buf = 138412546;
    uint64_t v22 = v15;
    __int16 v23 = 2112;
    unint64_t v24 = v16;
    _os_log_impl(&dword_217F61000, v14, OS_LOG_TYPE_INFO, "QLPreviewCollection is preparing for transition (presenting: %@, interactive: %@) #AppearanceTransition", buf, 0x16u);
  }
  BOOL v20 = v9;
  id v17 = v11;
  id v18 = v9;
  id v19 = v10;
  QLRunInMainThread();
}

void __136__QLPreviewCollection_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 1192) setEnabled:0];
  objc_initWeak(&location, *(id *)(a1 + 32));
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __136__QLPreviewCollection_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler___block_invoke_2;
  aBlock[3] = &unk_2642F7418;
  objc_copyWeak(&v22, &location);
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  __int16 v23 = *(_WORD *)(a1 + 64);
  id v21 = *(id *)(a1 + 56);
  uint64_t v2 = (void (**)(void))_Block_copy(aBlock);
  if (*(unsigned char *)(a1 + 65)) {
    [*(id *)(a1 + 32) updateCurrentPreviewConfiguration];
  }
  id v3 = [*(id *)(a1 + 32) currentPreviewItemViewController];

  id v4 = (void **)MEMORY[0x263F62940];
  uint64_t v5 = (void *)*MEMORY[0x263F62940];
  if (v3)
  {
    if (!v5)
    {
      QLSInitLogging();
      uint64_t v5 = *v4;
    }
    id v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = NSStringFromBOOL();
      *(_DWORD *)buf = 138412290;
      id v26 = v7;
      _os_log_impl(&dword_217F61000, v6, OS_LOG_TYPE_INFO, "QLPreviewCollection is waiting for preview controller to call ready block (presenting: %@). #AppearanceTransition", buf, 0xCu);
    }
    uint64_t v8 = [*(id *)(a1 + 32) currentPreviewItemViewController];
    objc_initWeak((id *)buf, v8);

    objc_initWeak(&from, *(id *)(a1 + 32));
    id v9 = [*(id *)(a1 + 32) currentPreviewItemViewController];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __136__QLPreviewCollection_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler___block_invoke_207;
    v12[3] = &unk_2642F7440;
    objc_copyWeak(&v14, &from);
    char v16 = *(unsigned char *)(a1 + 65);
    objc_copyWeak(&v15, (id *)buf);
    long long v13 = v2;
    [v9 isReadyForDisplayWithCompletionHandler:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (!v5)
    {
      QLSInitLogging();
      uint64_t v5 = *v4;
    }
    id v10 = v5;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = NSStringFromBOOL();
      *(_DWORD *)buf = 138412290;
      id v26 = v11;
      _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_INFO, "QLPreviewCollection is calling ready block right away (presenting: %@). #AppearanceTransition", buf, 0xCu);
    }
    v2[2](v2);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __136__QLPreviewCollection_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_copyWeak(&v5, (id *)(a1 + 56));
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  __int16 v6 = *(_WORD *)(a1 + 64);
  id v4 = *(id *)(a1 + 48);
  QLRunInMainThread();

  objc_destroyWeak(&v5);
}

uint64_t __136__QLPreviewCollection_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setTransitionController:v2];

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = objc_loadWeakRetained(v3);
  [v6 setTransitionContext:v5];

  LODWORD(v6) = *(unsigned __int8 *)(a1 + 64);
  id v7 = objc_loadWeakRetained(v3);
  uint64_t v8 = v7;
  if (v6) {
    [v7 triggerInteractiveTransitionAnimationIfNeeded];
  }
  else {
    [v7 startNonInteractiveTransitionPresenting:*(unsigned __int8 *)(a1 + 65)];
  }

  [MEMORY[0x263F158F8] flush];
  id v9 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v9();
}

void __136__QLPreviewCollection_startTransitionWithSourceViewProvider_transitionController_presenting_useInteractiveTransition_completionHandler___block_invoke_207(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 56)) {
    BOOL v4 = WeakRetained == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    id v5 = [WeakRetained currentPreviewItemViewController];
    id v6 = objc_loadWeakRetained((id *)(a1 + 48));

    if (v5 == v6) {
      [v3 updateCurrentPreviewConfiguration];
    }
  }
  id v7 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v8 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v8 = *v7;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = v8;
    id v10 = NSStringFromBOOL();
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_log_impl(&dword_217F61000, v9, OS_LOG_TYPE_INFO, "QLPreviewCollection is calling ready block now that its current preview controller is ready (presenting: %@). #AppearanceTransition", (uint8_t *)&v11, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)tearDownTransition:(BOOL)a3
{
}

uint64_t __42__QLPreviewCollection_tearDownTransition___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 1192) setEnabled:1];
  int v2 = [*(id *)(a1 + 32) _isBeingDismissed];
  id v3 = (NSObject **)MEMORY[0x263F62940];
  BOOL v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    BOOL v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = v4;
    uint64_t v6 = NSStringFromBOOL();
    id v7 = (void *)v6;
    uint64_t v8 = @"presented";
    if (v2) {
      uint64_t v8 = @"dismissed";
    }
    int v11 = 138412546;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_INFO, "[QLPreviewCollection tearDownTransition: didComplete: %@] - Is being %@ #AppearanceTransition", (uint8_t *)&v11, 0x16u);
  }
  [*(id *)(a1 + 32) _tearDownTransition:*(unsigned __int8 *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 40)) {
    int v9 = v2;
  }
  else {
    int v9 = 0;
  }
  if (v9 == 1) {
    [*(id *)(a1 + 32) setFullScreen:0];
  }
  return [*(id *)(a1 + 32) _notifyHostPreviewCollectionIsReadyForInvalidationIfNeeded];
}

- (BOOL)transitionInProgress
{
  int v2 = [(QLPreviewCollection *)self transitionController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)pinchDismissGestureInProgress
{
  int v2 = [(QLPreviewCollection *)self pinchRotationTracker];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)_isBeingDismissed
{
  BOOL v3 = [(QLPreviewCollection *)self transitionDriver];
  if (v3)
  {
    BOOL v4 = [(QLPreviewCollection *)self transitionDriver];
    int v5 = [v4 presenting] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)_isBeingPresented
{
  BOOL v3 = [(QLPreviewCollection *)self transitionDriver];
  if (v3)
  {
    BOOL v4 = [(QLPreviewCollection *)self transitionDriver];
    char v5 = [v4 presenting];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)setLoadingString:(id)a3
{
}

- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3
{
}

- (NSString)parentApplicationDisplayIdentifier
{
  BOOL v3 = [(QLPreviewCollection *)self hostApplicationBundleIdentifier];
  if ([v3 hasPrefix:@"com.apple."]
    && [(NSString *)self->_overrideParentApplicationDisplayIdentifier hasPrefix:@"com.apple."])
  {
    BOOL v4 = self->_overrideParentApplicationDisplayIdentifier;

    BOOL v3 = v4;
  }

  return (NSString *)v3;
}

- (void)setIsContentManaged:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [(QLPreviewCollection *)self _setDragDataOwner:v4];

  [(QLPreviewCollection *)self _setDataOwnerForCopy:v4];
}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [(QLPreviewCollection *)self pageViewController];
  id v7 = [v6 currentPage];

  [v7 updatePreviewItemDisplayState:v5];
}

- (BOOL)_isVisible
{
  return self->_visibilityState == 2;
}

- (void)_updatePreferredContentSize
{
  BOOL v3 = [(QLPreviewCollection *)self pageViewController];
  id v5 = [v3 currentPage];

  if (([v5 isLoading] & 1) == 0)
  {
    uint64_t v4 = [(QLPreviewCollection *)self stateManager];
    [v5 preferredContentSize];
    objc_msgSend(v4, "updatePreferredContentSize:");
  }
}

- (void)_updateFullscreenBackgroundColor
{
  BOOL v3 = [(QLPreviewCollection *)self pageViewController];
  id v6 = [v3 currentPage];

  if (([v6 isLoading] & 1) == 0 && objc_msgSend(v6, "isLoaded"))
  {
    uint64_t v4 = [(QLPreviewCollection *)self stateManager];
    id v5 = [v6 fullscreenBackgroundColor];
    [v4 setFullscreenBackgroundColor:v5];
  }
}

- (void)_updateFullscreen
{
  BOOL v3 = [(QLPreviewCollection *)self pageViewController];
  id v6 = [v3 currentPage];

  if (![v6 isLoading]
    || ([v6 loadingFailed] & 1) != 0
    || ([v6 context],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 previewItemType],
        v4,
        v5 == 15))
  {
    if ([(QLPreviewCollection *)self fullScreen]
      && ![(QLPreviewCollection *)self shouldStartFullScreen]
      && ([v6 canEnterFullScreen] & 1) == 0)
    {
      [(QLPreviewCollection *)self setFullScreen:0];
    }
  }
}

- (void)_updateOverlay:(BOOL)a3
{
  BOOL v3 = a3;
  [(QLPreviewCollection *)self _updateOverlayVisibility];
  id v5 = [(QLPreviewCollection *)self stateManager];
  [v5 updateOverlayButtons:v3];
}

- (void)_updateOverlayVisibility
{
  BOOL v3 = [(QLPreviewCollection *)self pageViewController];
  id v6 = [v3 currentPage];

  uint64_t v4 = [(QLPreviewCollection *)self stateManager];
  objc_msgSend(v4, "setToolbarCanBeVisible:", objc_msgSend(v6, "canShowToolBar"));

  id v5 = [(QLPreviewCollection *)self stateManager];
  objc_msgSend(v5, "setNavBarCanBeVisible:", objc_msgSend(v6, "canShowNavBar"));
}

- (void)_updateTitleFromController
{
  BOOL v3 = [(QLPreviewCollection *)self pageViewController];
  id v6 = [v3 currentPage];

  if (([v6 isLoading] & 1) == 0)
  {
    uint64_t v4 = [(QLPreviewCollection *)self stateManager];
    id v5 = [v6 title];
    [v4 updateTitle:v5];
  }
}

- (void)_updatePrinter
{
  BOOL v3 = [(QLPreviewCollection *)self pageViewController];
  id v7 = [v3 currentPage];

  if ([v7 isLoading])
  {
    uint64_t v4 = [(QLPreviewCollection *)self stateManager];
    [v4 setPrinter:0];
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [v7 printer];
    }
    else
    {
      uint64_t v4 = 0;
    }
    id v5 = [(QLPreviewCollection *)self stateManager];
    [v5 setPrinter:0];

    if (v4)
    {
      id v6 = [(QLPreviewCollection *)self stateManager];
      [v6 setPrinter:v4];
    }
  }
}

- (void)_cleanAccessoryViewContainer
{
  id v4 = [(QLPreviewCollection *)self accessoryView];
  int v2 = [v4 subviews];
  BOOL v3 = [v2 firstObject];

  [v3 removeFromSuperview];
}

- (void)_updateAccessoryViewWithPreviewItemViewController:(id)a3
{
  v33[1] = *MEMORY[0x263EF8340];
  id v4 = [a3 accessoryView];
  id v5 = [(QLPreviewCollection *)self accessoryView];
  id v6 = [v5 subviews];
  id v7 = [v6 lastObject];

  if (v7 != v4)
  {
    if (v7)
    {
      uint64_t v8 = (void *)MEMORY[0x263F82E00];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke;
      v28[3] = &unk_2642F5430;
      id v29 = v7;
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke_2;
      v26[3] = &unk_2642F5458;
      id v27 = v29;
      [v8 animateWithDuration:v28 animations:v26 completion:0.2];
    }
    if (v4)
    {
      [v5 addSubview:v4];
      [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
      int v9 = (void *)MEMORY[0x263F08938];
      double v32 = @"view";
      v33[0] = v4;
      id v10 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
      int v11 = [v9 constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:0 views:v10];
      [v5 addConstraints:v11];

      uint64_t v12 = (void *)MEMORY[0x263F08938];
      double v30 = @"view";
      double v31 = v4;
      __int16 v13 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      id v14 = [v12 constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:0 views:v13];
      [v5 addConstraints:v14];

      uint64_t v15 = (void *)MEMORY[0x263F82E00];
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke_3;
      v24[3] = &unk_2642F5430;
      id v16 = v4;
      id v25 = v16;
      [v15 performWithoutAnimation:v24];
      [v16 setAlpha:0.0];
      id v17 = (void *)MEMORY[0x263F82E00];
      uint64_t v19 = MEMORY[0x263EF8330];
      uint64_t v20 = 3221225472;
      id v21 = __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke_4;
      id v22 = &unk_2642F5430;
      id v23 = v16;
      [v17 animateWithDuration:&v19 animations:0.2];
    }
  }
  id v18 = [(QLPreviewCollection *)self stateManager];
  [v18 setAccessoryViewVisible:v4 != 0];
}

uint64_t __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  int v2 = *(void **)(a1 + 32);

  return [v2 setAlpha:1.0];
}

uint64_t __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  int v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

uint64_t __73__QLPreviewCollection__updateAccessoryViewWithPreviewItemViewController___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_updateWhitePointAdaptivityStyle
{
  id v4 = [(QLPreviewCollection *)self stateManager];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    objc_msgSend(v4, "previewCollectionPrefersWhitePointAdaptivityStyle:", objc_msgSend(v3, "preferredWhitePointAdaptivityStyle"));
  }
}

- (id)pageViewController:(id)a3 viewControllerAtIndex:(unint64_t)a4
{
  id v6 = a3;
  unint64_t v7 = [(QLPreviewItemStore *)self->_itemStore possibleRange];
  if (a4 < v7 || a4 - v7 >= v8)
  {
    id v16 = 0;
  }
  else
  {
    id v10 = [QLItemPresenterViewController alloc];
    int v11 = [(QLPreviewCollection *)self hostApplicationBundleIdentifier];
    uint64_t v12 = [(QLPreviewCollection *)self parentApplicationDisplayIdentifier];
    __int16 v13 = [(QLItemPresenterViewController *)v10 initWithHostApplicationBundleIdentifier:v11 parentApplicationDisplayIdentifier:v12];

    [(QLItemViewController *)v13 setAppearance:self->_appearance];
    [(QLItemAggregatedViewController *)v13 setDelegate:self];
    objc_initWeak(&location, self);
    itemStore = self->_itemStore;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __64__QLPreviewCollection_pageViewController_viewControllerAtIndex___block_invoke;
    v18[3] = &unk_2642F74E0;
    objc_copyWeak(v21, &location);
    v21[1] = (id)a4;
    uint64_t v15 = v13;
    uint64_t v19 = v15;
    uint64_t v20 = self;
    [(QLPreviewItemStore *)itemStore previewItemAtIndex:a4 withCompletionHandler:v18];
    id v16 = v15;

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __64__QLPreviewCollection_pageViewController_viewControllerAtIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    unint64_t v8 = [WeakRetained pageViewController];
    uint64_t v9 = [v8 currentPageIndex];
    uint64_t v10 = *(void *)(a1 + 56);

    if (v9 == v10)
    {
      [*(id *)(a1 + 32) previewWillAppear:1];
      id v11 = objc_loadWeakRetained((id *)(a1 + 48));
      [v11 _updateWhitePointAdaptivityStyle];
    }
    uint64_t v12 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __64__QLPreviewCollection_pageViewController_viewControllerAtIndex___block_invoke_2;
    v14[3] = &unk_2642F74B8;
    id v15 = v5;
    objc_copyWeak(v17, (id *)(a1 + 48));
    uint64_t v13 = *(void *)(a1 + 40);
    v17[1] = *(id *)(a1 + 56);
    uint64_t v16 = v13;
    [v12 loadPreviewControllerWithContents:v15 context:0 completionHandler:v14];
    objc_destroyWeak(v17);
  }
}

void __64__QLPreviewCollection_pageViewController_viewControllerAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x263F62940];
  id v5 = *MEMORY[0x263F62940];
  if (v3)
  {
    if (!v5)
    {
      QLSInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v6;
      __int16 v28 = 2112;
      id v29 = v3;
      unint64_t v7 = "Error while attempting to load controller for preview item (%@): %@ #PreviewCollection";
      unint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_10:
      _os_log_impl(&dword_217F61000, v8, v9, v7, buf, v10);
    }
  }
  else
  {
    if (!v5)
    {
      QLSInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v11;
      unint64_t v7 = "Finished loading controller for preview item (%@) successfully. #PreviewCollection";
      unint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      uint32_t v10 = 12;
      goto LABEL_10;
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v13 = WeakRetained;
  if (WeakRetained)
  {
    id v14 = [WeakRetained stateManager];
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    id v23 = __64__QLPreviewCollection_pageViewController_viewControllerAtIndex___block_invoke_232;
    unint64_t v24 = &unk_2642F7490;
    v25[1] = *(id *)(a1 + 56);
    objc_copyWeak(v25, (id *)(a1 + 48));
    [v14 getStateRestorationUserInfo:&v21];

    id v15 = objc_msgSend(v13, "pageViewController", v21, v22, v23, v24);
    BOOL v16 = [v15 currentPageIndex] == *(void *)(a1 + 56);

    if (v16) {
      [v13 notifyFirstTimeAppearanceWithActions:v13[136]];
    }
    [*(id *)(a1 + 40) _updateCanChangeCurrentPage];
    [*(id *)(a1 + 40) _updateCanDismissWithGesture];
    id v17 = [v13 pageViewController];
    BOOL v18 = [v17 currentPageIndex] == *(void *)(a1 + 56);

    if (v18) {
      [v13 updateCurrentPreviewConfiguration];
    }
    objc_destroyWeak(v25);
  }
  else
  {
    uint64_t v19 = *v4;
    if (!*v4)
    {
      QLSInitLogging();
      uint64_t v19 = *v4;
    }
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v20;
      _os_log_impl(&dword_217F61000, v19, OS_LOG_TYPE_INFO, "Cancelling loading of preview at index %lu because collection does not exist anymore. #PreviewCollection", buf, 0xCu);
    }
  }
}

void __64__QLPreviewCollection_pageViewController_viewControllerAtIndex___block_invoke_232(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = (NSObject **)MEMORY[0x263F62940];
  id v5 = *MEMORY[0x263F62940];
  if (v3)
  {
    if (!v5)
    {
      QLSInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      unint64_t v7 = v5;
      unint64_t v8 = [v3 debugDescription];
      int v11 = 134218242;
      uint64_t v12 = v6;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_INFO, "State restoration: user info for preview at index %lu: %@ #PreviewCollection", (uint8_t *)&v11, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained notifyStateRestorationUserInfo:v3];
  }
  else
  {
    if (!v5)
    {
      QLSInitLogging();
      id v5 = *v4;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = 134217984;
      uint64_t v12 = v10;
      _os_log_impl(&dword_217F61000, v5, OS_LOG_TYPE_INFO, "State restoration: No user info for preview at index %lu. #PreviewCollection", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)displayBarsIfNeededForDestinationViewController:(id)a3
{
  uint64_t IsEmpty = (uint64_t)a3;
  id v5 = (void *)IsEmpty;
  if (IsEmpty)
  {
    unint64_t v8 = (void *)IsEmpty;
    if (![(id)IsEmpty supportsChromeless]
      || ([v8 contentFrame], IsEmpty = CGRectIsEmpty(v10), id v5 = v8, (IsEmpty & 1) == 0))
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      id v5 = v8;
      if ((isKindOfClass & 1) == 0
        || ([v8 currentPreviewViewController],
            unint64_t v7 = objc_claimAutoreleasedReturnValue(),
            v7,
            id v5 = v8,
            v7))
      {
        if (([v5 navigationBarShouldBeChromeless] & 1) == 0) {
          [(QLPreviewCollection *)self setNavigationBarShouldBeChromelessIfNeeded:0];
        }
        uint64_t IsEmpty = [v8 toolbarShouldBeChromeless];
        id v5 = v8;
        if ((IsEmpty & 1) == 0)
        {
          uint64_t IsEmpty = [(QLPreviewCollection *)self setToolbarShouldBeChromelessIfNeeded:0];
          id v5 = v8;
        }
      }
    }
  }

  MEMORY[0x270F9A758](IsEmpty, v5);
}

- (void)pageViewController:(id)a3 willBeginInteractiveTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7
{
  id v10 = a6;
  id v9 = a4;
  [(QLPreviewCollection *)self setIsTransitioningPage:1];
  [v10 setAppearance:self->_appearance];
  [v9 previewWillDisappear:1];

  [v10 previewWillAppear:1];
  [v10 previewBecameFullScreen:self->_fullScreen animated:0];
  [(QLPreviewCollection *)self displayBarsIfNeededForDestinationViewController:v10];
}

- (void)pageViewController:(id)a3 willTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 animated:(BOOL)a8
{
  BOOL v8 = a8;
  id v10 = a6;
  [v10 setAppearance:self->_appearance];
  [v10 previewBecameFullScreen:self->_fullScreen animated:v8];
  [v10 previewWillAppear:v8];
  if (v8) {
    [v10 previewWillFinishAppearing];
  }
  [(QLPreviewCollection *)self displayBarsIfNeededForDestinationViewController:v10];
}

- (void)pageViewController:(id)a3 isTransitioningFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 withProgress:(double)a8
{
  double v11 = 1.0 - a8;
  id v12 = a6;
  [a4 previewIsAppearingWithProgress:v11];
  [v12 previewIsAppearingWithProgress:a8];
  [(QLPreviewCollection *)self displayBarsIfNeededForDestinationViewController:v12];
}

- (void)pageViewController:(id)a3 didTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 animated:(BOOL)a8
{
  BOOL v8 = a8;
  id v16 = a4;
  id v13 = a6;
  [(QLPreviewCollection *)self setShouldStartFullScreen:0];
  [(QLPreviewCollection *)self setIsTransitioningPage:0];
  self->_currentItemIndex = a7;
  self->_appearanceActions = 0;
  [(QLPreviewCollection *)self _updateFullscreenBackgroundColor];
  id v14 = [(QLPreviewCollection *)self stateManager];
  [v14 previewCollectionUpdatePreviewItem:a7];

  [(QLPreviewCollection *)self _updateFullscreen];
  [(QLPreviewCollection *)self _updateOverlay:v8];
  if (a5 != a7)
  {
    [v16 previewDidDisappear:v8];
    if ([(QLPreviewCollection *)self _isVisible]) {
      [v13 previewDidAppear:v8];
    }
  }
  [v13 setAppearance:self->_appearance];
  [(QLPreviewCollection *)self _updateAccessoryViewWithPreviewItemViewController:v13];
  [(QLPreviewCollection *)self _updateWhitePointAdaptivityStyle];
  uint64_t v15 = [(QLPreviewCollection *)self stateManager];
  [v15 updateKeyCommands];

  [(QLPreviewCollection *)self _updatePrinter];
  [(QLPreviewCollection *)self _updateTitleFromController];
  [(QLPreviewCollection *)self _updatePreferredContentSize];
  -[QLPreviewCollection setNavigationBarShouldBeChromelessIfNeeded:](self, "setNavigationBarShouldBeChromelessIfNeeded:", [v13 navigationBarShouldBeChromeless]);
  -[QLPreviewCollection setToolbarShouldBeChromelessIfNeeded:](self, "setToolbarShouldBeChromelessIfNeeded:", [v13 toolbarShouldBeChromeless]);
}

- (void)pageViewController:(id)a3 willCancelTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 animated:(BOOL)a8
{
  if (a4 != a6)
  {
    BOOL v9 = a8;
    id v11 = a6;
    [a4 previewWillAppear:v9];
    [v11 previewWillDisappear:v9];
  }
}

- (void)pageViewController:(id)a3 didCancelTransitionFromPage:(id)a4 withIndex:(unint64_t)a5 toPage:(id)a6 withIndex:(unint64_t)a7 animated:(BOOL)a8
{
  BOOL v8 = a8;
  id v12 = a4;
  id v11 = a6;
  [(QLPreviewCollection *)self setIsTransitioningPage:0];
  if (v12 != v11)
  {
    if ([(QLPreviewCollection *)self _isVisible]) {
      [v12 previewDidAppear:v8];
    }
    [v11 previewDidDisappear:v8];
  }
  -[QLPreviewCollection setNavigationBarShouldBeChromelessIfNeeded:](self, "setNavigationBarShouldBeChromelessIfNeeded:", [v12 navigationBarShouldBeChromeless]);
  -[QLPreviewCollection setToolbarShouldBeChromelessIfNeeded:](self, "setToolbarShouldBeChromelessIfNeeded:", [v12 toolbarShouldBeChromeless]);
}

- (id)pageViewController:(id)a3 parallaxViewInPage:(id)a4 withIndex:(unint64_t)a5
{
  return (id)objc_msgSend(a4, "parallaxView", a3);
}

- (void)_installGestures
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v3 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__tapGestureRecognized];
  [(QLPreviewCollection *)self setTapGesture:v3];

  id v4 = [(QLPreviewCollection *)self tapGesture];
  [v4 _setDelaysRecognitionForGreaterTapCounts:1];

  id v5 = [(QLPreviewCollection *)self tapGesture];
  [v5 setDelegate:self];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:self action:sel_slideToDismissGestureRecognized_];
  [(QLPreviewCollection *)self setSlideGesture:v6];

  unint64_t v7 = [(QLPreviewCollection *)self slideGesture];
  [v7 setDelegate:self];

  BOOL v8 = [(QLPreviewCollection *)self slideGesture];
  [v8 setAllowedScrollTypesMask:2];

  BOOL v9 = [(QLPreviewCollection *)self slideGesture];
  [v9 setMaximumNumberOfTouches:1];

  id v10 = (void *)[objc_alloc(MEMORY[0x263F82A40]) initWithTarget:self action:sel_rotationOrPinchGestureRecognized_];
  [(QLPreviewCollection *)self setPinchGesture:v10];

  id v11 = [(QLPreviewCollection *)self pinchGesture];
  [v11 setDelegate:self];

  id v12 = (void *)[objc_alloc(MEMORY[0x263F82B28]) initWithTarget:self action:sel_rotationOrPinchGestureRecognized_];
  [(QLPreviewCollection *)self setRotationGesture:v12];

  id v13 = [(QLPreviewCollection *)self rotationGesture];
  [v13 setDelegate:self];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v14 = [(QLPreviewCollection *)self pageViewController];
    uint64_t v15 = [v14 view];
    [v15 addGestureRecognizer:self->_slideGesture];

    id v16 = [(QLPreviewCollection *)self pageViewController];
    id v17 = [v16 view];
    [v17 addGestureRecognizer:self->_pinchGesture];

    BOOL v18 = [(QLPreviewCollection *)self pageViewController];
    uint64_t v19 = [v18 view];
    [v19 addGestureRecognizer:self->_rotationGesture];
  }
  uint64_t v20 = [(QLPreviewCollection *)self pageViewController];
  uint64_t v21 = [v20 view];
  [v21 addGestureRecognizer:self->_tapGesture];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v22 = [(QLPreviewCollection *)self pageViewController];
  id v23 = [v22 view];
  unint64_t v24 = [v23 subviews];
  id v25 = [v24 firstObject];
  id v26 = [v25 gestureRecognizers];

  uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v40;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v26);
        }
        double v31 = *(void **)(*((void *)&v39 + 1) + 8 * v30);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        objc_super v33 = &OBJC_IVAR___QLPreviewCollection__pageSwipeGesture;
        if ((isKindOfClass & 1) != 0
          || (objc_opt_class(),
              char v34 = objc_opt_isKindOfClass(),
              objc_super v33 = &OBJC_IVAR___QLPreviewCollection__pagePanGesture,
              (v34 & 1) != 0))
        {
          objc_storeStrong((id *)((char *)&self->super.super.super.isa + *v33), v31);
        }
        ++v30;
      }
      while (v28 != v30);
      uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v43 count:16];
    }
    while (v28);
  }

  id v35 = [(QLPreviewCollection *)self pinchGesture];
  double v36 = [(QLPreviewCollection *)self slideGesture];
  [v35 requireGestureRecognizerToFail:v36];

  long long v37 = [(QLPreviewCollection *)self rotationGesture];
  long long v38 = [(QLPreviewCollection *)self slideGesture];
  [v37 requireGestureRecognizerToFail:v38];
}

- (BOOL)_toggleFullscreenIfPossible
{
  id v3 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  int v4 = [v3 canToggleFullScreen];

  if (v4) {
    [(QLPreviewCollection *)self setFullScreen:[(QLPreviewCollection *)self fullScreen] ^ 1];
  }
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  if (self->_tapGesture == v6
    && ([(QLPreviewCollection *)self currentPreviewItemViewController],
        BOOL v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 canClickToToggleFullscreen],
        v8,
        (v9 & 1) == 0)
    && ([v7 _isPointerTouch] & 1) != 0)
  {
    char v10 = 0;
  }
  else
  {
    id v11 = [(QLPreviewCollection *)self currentPreviewItemViewController];

    if (v11)
    {
      id v12 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      char v10 = [v12 shouldAcceptTouch:v7 ofGestureRecognizer:v6];
    }
    else
    {
      char v10 = 1;
    }
  }

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  int v4 = (UIRotationGestureRecognizer *)a3;
  id v5 = v4;
  slideGesture = self->_slideGesture;
  if (slideGesture != (UIPanGestureRecognizer *)v4
    && self->_rotationGesture != v4
    && (UIRotationGestureRecognizer *)self->_pinchGesture != v4)
  {
    goto LABEL_14;
  }
  id v7 = [(QLPreviewCollection *)self presentedViewController];

  if (!v7)
  {
    if ([(QLPreviewCollection *)self transitionInProgress])
    {
      rotationGesture = self->_rotationGesture;
      if (![(QLPreviewCollection *)self pinchDismissGestureInProgress]
        || rotationGesture != v5)
      {
        char v10 = (NSObject **)MEMORY[0x263F62940];
        id v11 = *MEMORY[0x263F62940];
        if (!*MEMORY[0x263F62940])
        {
          QLSInitLogging();
          id v11 = *v10;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          int v32 = 138412290;
          objc_super v33 = v5;
          _os_log_impl(&dword_217F61000, v11, OS_LOG_TYPE_INFO, "Gesture recognizer (%@) can't begin because and interactive transition is already in progress. #AppearanceTransition", (uint8_t *)&v32, 0xCu);
        }
        goto LABEL_5;
      }
LABEL_17:
      char v8 = 1;
      goto LABEL_32;
    }
    slideGesture = self->_slideGesture;
LABEL_14:
    if (slideGesture == (UIPanGestureRecognizer *)v5)
    {
      id v13 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      id v12 = [v13 scrollView];

      id v14 = self->_slideGesture;
      uint64_t v15 = [(UIPanGestureRecognizer *)v14 view];
      [(UIPanGestureRecognizer *)v14 velocityInView:v15];
      double v17 = v16;
      double v19 = v18;

      int v20 = fabs(v19) > fabs(v17);
      if (v12)
      {
        [v12 contentOffset];
        if (v21 > 0.0) {
          int v20 = 0;
        }
      }
      [v12 contentOffset];
      if (v22 <= 0.0)
      {
        [v12 frame];
        double v24 = v23;
        [v12 contentSize];
        BOOL v26 = v24 >= v25;
        if (v19 >= 0.0) {
          BOOL v26 = 1;
        }
        v20 &= v26;
      }
      if (self->_allowInteractiveTransitions
        && ([(QLPreviewCollection *)self currentPreviewItemViewController],
            uint64_t v27 = objc_claimAutoreleasedReturnValue(),
            int v28 = [v27 canSwipeToDismiss] & v20,
            v27,
            v28 == 1))
      {
        uint64_t v29 = [v12 panGestureRecognizer];
        [v29 setEnabled:0];

        uint64_t v30 = [v12 panGestureRecognizer];
        char v8 = 1;
        [v30 setEnabled:1];
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      if (self->_rotationGesture != v5 && (UIRotationGestureRecognizer *)self->_pinchGesture != v5) {
        goto LABEL_17;
      }
      if (!self->_allowInteractiveTransitions) {
        goto LABEL_5;
      }
      id v12 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      char v8 = [v12 canPinchToDismiss];
    }

    goto LABEL_32;
  }
LABEL_5:
  char v8 = 0;
LABEL_32:

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v6 = (UIPanGestureRecognizer *)a3;
  id v7 = (UIPanGestureRecognizer *)a4;
  if (self->_slideGesture == v6)
  {
    char v8 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    char v9 = [v8 scrollView];
    char v10 = [v9 panGestureRecognizer];

    if (v10 == v7) {
      goto LABEL_14;
    }
  }
  if ((UIPanGestureRecognizer *)self->_pinchGesture == v6)
  {
    id v11 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    id v12 = [v11 scrollView];
    id v13 = [v12 pinchGestureRecognizer];

    if (v13 == v7) {
      goto LABEL_14;
    }
  }
  id v14 = [(UIPanGestureRecognizer *)v7 view];
  uint64_t v15 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  double v16 = [v15 view];
  int v17 = [v14 isDescendantOfView:v16];

  if (v17)
  {
    double v18 = [(QLPreviewCollection *)self currentPreviewItemViewController];
    if ([v18 shouldRecognizeGestureRecognizer:v6])
    {
      double v19 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      int v20 = [v19 gestureRecognizer:v6 shouldRecognizeSimultaneouslyWithGestureRecognizer:v7];

      if (v20) {
        goto LABEL_8;
      }
    }
    else
    {
    }
LABEL_16:
    char v24 = 0;
    goto LABEL_18;
  }
LABEL_8:
  slideGesture = self->_slideGesture;
  if (slideGesture == v6)
  {
    char v24 = self->_verticalPanGesture == v7;
    goto LABEL_18;
  }
  if ((UIPanGestureRecognizer *)self->_tapGesture == v6)
  {
    if (slideGesture != v7
      && (UIPanGestureRecognizer *)self->_pinchGesture != v7
      && (UIPanGestureRecognizer *)self->_rotationGesture != v7
      && self->_pagePanGesture != v7
      && (UIPanGestureRecognizer *)self->_pageSwipeGesture != v7)
    {
      objc_opt_class();
      char v24 = objc_opt_isKindOfClass() ^ 1;
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  rotationGesture = self->_rotationGesture;
  pinchGesture = self->_pinchGesture;
  if ((rotationGesture != (UIRotationGestureRecognizer *)v6 || pinchGesture != (UIPinchGestureRecognizer *)v7)
    && (rotationGesture != (UIRotationGestureRecognizer *)v7 || pinchGesture != (UIPinchGestureRecognizer *)v6))
  {
    if ((UIPanGestureRecognizer *)self->_pageSwipeGesture != v7)
    {
      char v24 = self->_pagePanGesture != v7;
      goto LABEL_18;
    }
    goto LABEL_16;
  }
LABEL_14:
  char v24 = 1;
LABEL_18:

  return v24 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  uint64_t v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  char v8 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  char v9 = [v8 gestureRecognizer:v6 shouldRequireFailureOfGestureRecognizer:v7];

  if (v9)
  {
    char isKindOfClass = 1;
  }
  else if (self->_tapGesture == v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)previewItemViewController:(id)a3 wantsFullScreen:(BOOL)a4
{
}

uint64_t __65__QLPreviewCollection_previewItemViewController_wantsFullScreen___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFullScreen:*(unsigned __int8 *)(a1 + 40)];
}

- (void)previewItemViewController:(id)a3 wantsToSetRemoteEdgePanGestureWidth:(double)a4
{
}

void __85__QLPreviewCollection_previewItemViewController_wantsToSetRemoteEdgePanGestureWidth___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) stateManager];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) stateManager];
    [v4 setScreenEdgePanWidth:*(double *)(a1 + 40)];
  }
}

- (void)previewItemViewController:(id)a3 wantsToOpenURL:(id)a4
{
  id v5 = a4;
  id v6 = [(QLPreviewCollection *)self stateManager];
  [v6 openURLIfAllowed:v5];
}

- (void)previewItemViewController:(id)a3 didFailWithError:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = (NSObject **)MEMORY[0x263F62940];
  char v9 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    char v9 = *v8;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    char v10 = v9;
    id v11 = [v6 contents];
    int v15 = 138412546;
    double v16 = v11;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl(&dword_217F61000, v10, OS_LOG_TYPE_ERROR, "QLItemViewController (contents: %@) did fail with error: %@. #PreviewCollection", (uint8_t *)&v15, 0x16u);
  }
  id v12 = [v6 presentingDelegate];
  id v13 = [v12 itemPresenterViewController];
  id v14 = [(QLPreviewCollection *)self currentPreviewItemViewController];

  if (v13 == v14) {
    [(QLPreviewCollection *)self updateCurrentPreviewConfiguration];
  }
}

- (void)previewItemViewControllerWantsToShowShareSheet:(id)a3
{
  id v3 = [(QLPreviewCollection *)self stateManager];
  [v3 showShareSheet];
}

- (void)previewItemViewController:(id)a3 wantsToShowShareSheetWithPopoverTracker:(id)a4 customSharedURL:(id)a5 dismissCompletion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(QLPreviewCollection *)self stateManager];
  [v12 showShareSheetWithPopoverTracker:v11 customSharedURL:v10 dismissCompletion:v9];
}

- (void)previewItemViewControllerWantsUpdateOverlay:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 presentingDelegate];
  id v7 = [v6 itemPresenterViewController];
  char v8 = [(QLPreviewCollection *)self currentPreviewItemViewController];

  if (v7 == v8)
  {
    [(QLPreviewCollection *)self _updateOverlay:v4];
  }
}

- (void)previewItemViewControllerWantsUpdateKeyCommands:(id)a3
{
  id v3 = [(QLPreviewCollection *)self stateManager];
  [v3 updateKeyCommands];
}

- (void)previewItemViewControllerWantsToShowNoInternetConnectivityAlert:(id)a3
{
  id v3 = [(QLPreviewCollection *)self stateManager];
  [v3 presentAlertControllerForScenario:0];
}

- (void)previewItemViewController:(id)a3 requestsTemporaryEditDirectoryWithCompletionHandler:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([(QLPreviewCollection *)self _itemViewControllerIsCurrentlyPresentedItemViewController:v6])
  {
    char v8 = [v6 context];
    id v9 = [v8 item];

    int64_t v10 = [(QLPreviewItemStore *)self->_itemStore indexOfPreviewItem:v9];
    id v11 = [(QLPreviewCollection *)self stateManager];
    [v11 createTemporaryEditDirectoryForItemAtIndex:v10 completionHandler:v7];
  }
  else
  {
    id v12 = (NSObject **)MEMORY[0x263F62940];
    id v13 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v13 = *v12;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = v13;
      int v15 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      int v17 = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      int v20 = v15;
      _os_log_impl(&dword_217F61000, v14, OS_LOG_TYPE_ERROR, "Could not create temporary directory because preview controller (%@) is not the current preview controller (%@) #PreviewCollection", (uint8_t *)&v17, 0x16u);
    }
    double v16 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F62938] code:1 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v16);
  }
}

- (void)previewItemViewControllerDidUpdateContentFrame:(id)a3
{
  id v7 = a3;
  BOOL v4 = [(QLPreviewCollection *)self stateManager];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(QLPreviewCollection *)self stateManager];
    [v7 contentFrame];
    objc_msgSend(v6, "updateContentFrame:");
  }
}

- (void)previewItemViewController:(id)a3 wantsChromelessNavigationBar:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(QLPreviewCollection *)self isTransitioningPage])
  {
    [(QLPreviewCollection *)self setNavigationBarShouldBeChromelessIfNeeded:v4];
  }
}

- (void)previewItemViewController:(id)a3 wantsChromelessToolbar:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(QLPreviewCollection *)self isTransitioningPage])
  {
    [(QLPreviewCollection *)self setToolbarShouldBeChromelessIfNeeded:v4];
  }
}

- (void)setNavigationBarShouldBeChromelessIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(QLPreviewCollection *)self isNavigationBarChromeless];
  if (!v5
    || (id v6 = (void *)v5,
        [(QLPreviewCollection *)self isNavigationBarChromeless],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 BOOLValue],
        v7,
        v6,
        v8 != v3))
  {
    id v9 = [NSNumber numberWithBool:v3];
    [(QLPreviewCollection *)self setIsNavigationBarChromeless:v9];

    id v10 = [(QLPreviewCollection *)self stateManager];
    [v10 setNavigationBarShouldBeChromeless:v3];
  }
}

- (void)setToolbarShouldBeChromelessIfNeeded:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(QLPreviewCollection *)self isToolbarChromeless];
  if (!v5
    || (id v6 = (void *)v5,
        [(QLPreviewCollection *)self isToolbarChromeless],
        id v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 BOOLValue],
        v7,
        v6,
        v8 != v3))
  {
    id v9 = [NSNumber numberWithBool:v3];
    [(QLPreviewCollection *)self setIsToolbarChromeless:v9];

    id v10 = [(QLPreviewCollection *)self stateManager];
    [v10 setToolbarShouldBeChromeless:v3];
  }
}

- (void)expandContentOfPreviewItemViewController:(id)a3 unarchivedItemsURL:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  int v8 = [v7 context];
  id v9 = [v8 item];

  id v10 = [v7 presentingDelegate];

  id v11 = [v10 itemPresenterViewController];
  id v12 = [(QLPreviewCollection *)self currentPreviewItemViewController];

  if (v11 == v12)
  {
    int64_t v13 = [(QLPreviewItemStore *)self->_itemStore indexOfPreviewItem:v9];
    int v14 = [v6 startAccessingSecurityScopedResource];
    id v21 = 0;
    int v15 = [MEMORY[0x263F054E0] wrapperWithURL:v6 readonly:1 error:&v21];
    id v16 = v21;
    if (v16)
    {
      int v17 = (NSObject **)MEMORY[0x263F62940];
      id v18 = *MEMORY[0x263F62940];
      if (!*MEMORY[0x263F62940])
      {
        QLSInitLogging();
        id v18 = *v17;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        int64_t v23 = v13;
        __int16 v24 = 2112;
        id v25 = v16;
        _os_log_impl(&dword_217F61000, v18, OS_LOG_TYPE_ERROR, "Could not expand content of item at index: %lu. Error: %@ #PreviewCollection", buf, 0x16u);
      }
      if (!v14) {
        goto LABEL_9;
      }
    }
    else
    {
      __int16 v19 = [(QLPreviewCollection *)self stateManager];
      int v20 = [v9 uuid];
      [v19 expandContentOfItemAtIndex:v13 withUUID:v20 unarchivedItemsURLWrapper:v15];

      if (!v14) {
        goto LABEL_9;
      }
    }
    [v6 stopAccessingSecurityScopedResource];
LABEL_9:
  }
}

- (id)loadingTextForPreviewItemViewController:(id)a3
{
  return self->_loadingString;
}

- (void)previewItemViewControllerDidEditCopyOfPreviewItem:(id)a3 editedCopy:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  if (!v8) {
    id v8 = &__block_literal_global_19;
  }
  id v15 = v8;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(QLPreviewCollection *)self stateManager];
  itemStore = self->_itemStore;
  int64_t v13 = [v10 context];

  int v14 = [v13 item];
  objc_msgSend(v11, "updatePreviewItemAtIndex:editedCopy:completionHandler:", -[QLPreviewItemStore indexOfPreviewItem:](itemStore, "indexOfPreviewItem:", v14), v9, v15);
}

- (void)previewItemViewController:(id)a3 hasUnsavedEdits:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [a3 context];
  id v9 = [v6 item];

  if (v9
    && [(QLPreviewItemStore *)self->_itemStore indexOfPreviewItem:v9] == self->_currentItemIndex)
  {
    id v7 = [(QLPreviewCollection *)self stateManager];
    id v8 = [v9 uuid];
    [v7 currentPreviewItemViewControllerHasUnsavedEdits:v4 forItemUUID:v8];
  }
}

- (void)previewItemViewController:(id)a3 didEnableEditMode:(BOOL)a4
{
  [(QLPreviewCollection *)self setIsEditing:a4];

  [(QLPreviewCollection *)self _updateEnableChangingPageUsingGestures];
}

- (void)previewItemViewControllerDidAcquireLock:(id)a3
{
  itemStore = self->_itemStore;
  uint64_t v5 = [a3 context];
  id v6 = [v5 item];
  uint64_t v7 = [(QLPreviewItemStore *)itemStore indexOfPreviewItem:v6];
  int64_t currentItemIndex = self->_currentItemIndex;

  if (v7 == currentItemIndex)
  {
    [(QLPreviewCollection *)self setCurrentItemViewControllerIsPerformingFocusedAction:1];
    [(QLPreviewCollection *)self _updateEnableChangingPageUsingGestures];
  }
}

- (void)previewItemViewControllerDidHandOverLock:(id)a3
{
  [(QLPreviewCollection *)self setCurrentItemViewControllerIsPerformingFocusedAction:0];

  [(QLPreviewCollection *)self _updateEnableChangingPageUsingGestures];
}

- (void)previewItemViewController:(id)a3 wantsToUpdateStateRestorationWithUserInfo:(id)a4
{
  id v5 = a4;
  id v6 = [(QLPreviewCollection *)self stateManager];
  [v6 updateStateRestorationWithUserInfo:v5];
}

- (void)previewItemViewController:(id)a3 wantsToUpdatePreviewItemDisplayState:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 context];
  id v10 = [v7 item];

  int64_t v8 = [(QLPreviewItemStore *)self->_itemStore indexOfPreviewItem:v10];
  id v9 = [(QLPreviewCollection *)self stateManager];
  [v9 setPreviewItemDisplayState:v6 onItemAtIndex:v8];
}

- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [(QLPreviewCollection *)self pageViewController];
  id v7 = [v6 currentPage];

  [v7 updatePreviewItemDisplayState:v5];
}

- (void)previewItemViewControllerWantsToDismissQuickLook:(id)a3
{
  id v3 = [(QLPreviewCollection *)self stateManager];
  [v3 triggerQuickLookDismissal];
}

- (void)previewItemViewControllerDidChangeCurrentPreviewController:(id)a3
{
  if ([(QLPreviewCollection *)self _itemViewControllerIsCurrentlyPresentedItemViewController:a3])
  {
    [(QLPreviewCollection *)self updateCurrentPreviewConfiguration];
  }
}

- (void)previewItemViewController:(id)a3 wantsToForwardMessageToHost:(id)a4 completionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(QLPreviewCollection *)self _itemViewControllerIsCurrentlyPresentedItemViewController:v8])
  {
    id v11 = [v8 context];
    id v12 = [v11 item];

    int64_t v13 = [(QLPreviewItemStore *)self->_itemStore indexOfPreviewItem:v12];
    int v14 = (NSObject **)MEMORY[0x263F62940];
    id v15 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v15 = *v14;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = v15;
      int v17 = [v12 uuid];
      int v24 = 138412802;
      id v25 = v9;
      __int16 v26 = 2048;
      int64_t v27 = v13;
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      _os_log_impl(&dword_217F61000, v16, OS_LOG_TYPE_INFO, "Forwarding message %@ to item at index: %lu UUID: %@ #PreviewCollection", (uint8_t *)&v24, 0x20u);
    }
    id v18 = [(QLPreviewCollection *)self stateManager];
    __int16 v19 = [v12 uuid];
    [v18 forwardMessage:v9 toItemAtIndex:v13 withUUID:v19 completionHandler:v10];

    id v10 = v18;
  }
  else
  {
    int v20 = (NSObject **)MEMORY[0x263F62940];
    id v21 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v21 = *v20;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      double v22 = v21;
      int64_t v23 = [(QLPreviewCollection *)self currentPreviewItemViewController];
      int v24 = 138412546;
      id v25 = v8;
      __int16 v26 = 2112;
      int64_t v27 = (int64_t)v23;
      _os_log_impl(&dword_217F61000, v22, OS_LOG_TYPE_ERROR, "Could not forward message to host because preview controller (%@) is not the current preview controller (%@) #PreviewCollection", (uint8_t *)&v24, 0x16u);
    }
    id v12 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F629F0] code:0 userInfo:0];
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0, v12);
  }
}

- (BOOL)itemPresenterViewControllerShouldForceAutodownloadFile:(id)a3
{
  id v4 = a3;
  id v5 = [(QLPreviewCollection *)self currentPreviewItemViewController];

  return v5 == v4 && self->_appearanceActions != 0;
}

- (void)setCurrentItemViewControllerIsPerformingFocusedAction:(BOOL)a3
{
  self->_currentItemViewControllerIsPerformingFocusedAction = a3;
  [(QLPreviewCollection *)self _updateCanChangeCurrentPage];

  [(QLPreviewCollection *)self _updateCanDismissWithGesture];
}

- (void)setIsEditing:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_isEditing = a3;
  [(QLPreviewCollection *)obj _updateCanChangeCurrentPage];
  [(QLPreviewCollection *)obj _updateCanDismissWithGesture];
  objc_sync_exit(obj);
}

- (void)setIsTransitioningPage:(BOOL)a3
{
  BOOL v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_isTransitioningPage != v3)
  {
    obj->_isTransitioningPage = v3;
    [(QLPreviewCollection *)obj _updateCanChangeCurrentPage];
  }
  objc_sync_exit(obj);
}

- (void)_updateCanChangeCurrentPage
{
  BOOL v3 = [(QLPreviewCollection *)self stateManager];
  BOOL v4 = !self->_isEditing && !self->_isTransitioningPage;
  id v5 = v3;
  [v3 setCanChangeCurrentPage:v4];
}

- (void)_updateCanDismissWithGesture
{
  BOOL v3 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  int v4 = [v3 canSwipeToDismiss];

  id v5 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  unsigned int v6 = [v5 canPinchToDismiss];

  id v7 = [(QLPreviewCollection *)self stateManager];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(QLPreviewCollection *)self stateManager];
    id v11 = v9;
    if (self->_isEditing) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = v4 | v6;
    }
    [v9 setCanDismissWithGesture:v10];
  }
}

- (void)_updateEnableChangingPageUsingGestures
{
  BOOL v3 = !self->_isEditing && !self->_currentItemViewControllerIsPerformingFocusedAction;
  [(UISwipeGestureRecognizer *)self->_pageSwipeGesture setEnabled:v3];
  [(UIPanGestureRecognizer *)self->_pagePanGesture setEnabled:v3];
  id v5 = [(QLPreviewCollection *)self pageViewController];
  int v4 = [v5 scrollView];
  [v4 setScrollEnabled:v3];
}

- (id)_sandboxExtensionForEditedFileAtURL:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int v4 = [v3 path];
  id v5 = [v4 stringByDeletingLastPathComponent];
  [v5 fileSystemRepresentation];

  unsigned int v6 = (const char *)sandbox_extension_issue_file();
  if (v6)
  {
    id v7 = [MEMORY[0x263EFF8F8] dataWithBytes:v6 length:strlen(v6) + 1];
  }
  else
  {
    char v8 = (NSObject **)MEMORY[0x263F62940];
    id v9 = *MEMORY[0x263F62940];
    if (!*MEMORY[0x263F62940])
    {
      QLSInitLogging();
      id v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_217F61000, v9, OS_LOG_TYPE_ERROR, "QLPreviewCollection could not provide a sandbox extension for file at URL: %@ #PreviewCollection", (uint8_t *)&v11, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_itemViewControllerIsCurrentlyPresentedItemViewController:(id)a3
{
  int v4 = [a3 presentingDelegate];
  id v5 = [v4 itemPresenterViewController];
  unsigned int v6 = [(QLPreviewCollection *)self currentPreviewItemViewController];
  LOBYTE(self) = v5 == v6;

  return (char)self;
}

- (QLPageViewController)pageViewController
{
  return (QLPageViewController *)objc_getProperty(self, a2, 1112, 1);
}

- (void)setPageViewController:(id)a3
{
}

- (QLPreviewControllerStateProtocol)stateManager
{
  return (QLPreviewControllerStateProtocol *)objc_getProperty(self, a2, 1120, 1);
}

- (void)setStateManager:(id)a3
{
}

- (void)setIsAvailable:(BOOL)a3
{
  self->_isAvailable = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (BOOL)allowInteractiveTransitions
{
  return self->_allowInteractiveTransitions;
}

- (BOOL)fullScreen
{
  return self->_fullScreen;
}

- (BOOL)shouldStartFullScreen
{
  return self->_shouldStartFullScreen;
}

- (void)setShouldStartFullScreen:(BOOL)a3
{
  self->_shouldStartFullScreen = a3;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (BOOL)currentItemViewControllerIsPerformingFocusedAction
{
  return self->_currentItemViewControllerIsPerformingFocusedAction;
}

- (BOOL)isTransitioningPage
{
  return self->_isTransitioningPage;
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (id)prepareForInvalidationCompletionHandler
{
  return self->_prepareForInvalidationCompletionHandler;
}

- (void)setPrepareForInvalidationCompletionHandler:(id)a3
{
}

- (NSString)overrideParentApplicationDisplayIdentifier
{
  return self->_overrideParentApplicationDisplayIdentifier;
}

- (void)setOverrideParentApplicationDisplayIdentifier:(id)a3
{
}

- (NSNumber)isNavigationBarChromeless
{
  return self->_isNavigationBarChromeless;
}

- (void)setIsNavigationBarChromeless:(id)a3
{
}

- (NSNumber)isToolbarChromeless
{
  return self->_isToolbarChromeless;
}

- (void)setIsToolbarChromeless:(id)a3
{
}

- (UIPanGestureRecognizer)slideGesture
{
  return (UIPanGestureRecognizer *)objc_getProperty(self, a2, 1168, 1);
}

- (void)setSlideGesture:(id)a3
{
}

- (UIPinchGestureRecognizer)pinchGesture
{
  return (UIPinchGestureRecognizer *)objc_getProperty(self, a2, 1176, 1);
}

- (void)setPinchGesture:(id)a3
{
}

- (UIRotationGestureRecognizer)rotationGesture
{
  return (UIRotationGestureRecognizer *)objc_getProperty(self, a2, 1184, 1);
}

- (void)setRotationGesture:(id)a3
{
}

- (UITapGestureRecognizer)tapGesture
{
  return (UITapGestureRecognizer *)objc_getProperty(self, a2, 1192, 1);
}

- (void)setTapGesture:(id)a3
{
}

- (QLSwipeDownTracker)swipeDownTracker
{
  return (QLSwipeDownTracker *)objc_getProperty(self, a2, 1200, 1);
}

- (void)setSwipeDownTracker:(id)a3
{
}

- (QLPinchRotationTracker)pinchRotationTracker
{
  return (QLPinchRotationTracker *)objc_getProperty(self, a2, 1208, 1);
}

- (void)setPinchRotationTracker:(id)a3
{
}

- (QLTransitionContext)transitionContext
{
  return (QLTransitionContext *)objc_getProperty(self, a2, 1216, 1);
}

- (void)setTransitionContext:(id)a3
{
}

- (QLTransitionControllerProtocol)transitionController
{
  return (QLTransitionControllerProtocol *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setTransitionController:(id)a3
{
}

- (QLTransitionDriver)transitionDriver
{
  return (QLTransitionDriver *)objc_getProperty(self, a2, 1232, 1);
}

- (void)setTransitionDriver:(id)a3
{
}

- (BOOL)hasTriggeredInteractiveTransitionAnimation
{
  return self->_hasTriggeredInteractiveTransitionAnimation;
}

- (void)setHasTriggeredInteractiveTransitionAnimation:(BOOL)a3
{
  self->_hasTriggeredInteractiveTransitionAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionDriver, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_pinchRotationTracker, 0);
  objc_storeStrong((id *)&self->_swipeDownTracker, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_rotationGesture, 0);
  objc_storeStrong((id *)&self->_pinchGesture, 0);
  objc_storeStrong((id *)&self->_slideGesture, 0);
  objc_storeStrong((id *)&self->_isToolbarChromeless, 0);
  objc_storeStrong((id *)&self->_isNavigationBarChromeless, 0);
  objc_storeStrong((id *)&self->_overrideParentApplicationDisplayIdentifier, 0);
  objc_storeStrong(&self->_prepareForInvalidationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_pageViewController, 0);
  objc_storeStrong((id *)&self->_hostApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_loadingString, 0);
  objc_storeStrong((id *)&self->_appearance, 0);
  objc_storeStrong((id *)&self->_pagePanGesture, 0);
  objc_storeStrong((id *)&self->_pageSwipeGesture, 0);
  objc_storeStrong((id *)&self->_verticalPanGesture, 0);
  objc_destroyWeak((id *)&self->_remoteAccessoryViewContainer);
  objc_storeStrong((id *)&self->_localAccessoryViewContainer, 0);

  objc_storeStrong((id *)&self->_itemStore, 0);
}

@end