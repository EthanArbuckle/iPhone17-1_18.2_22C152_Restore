@interface CCUIMainViewController
+ (id)_controlCenterBringupEventStream;
+ (id)_controlCenterDismissEventStream;
+ (id)_controlCenterDismissOrbActionsEventStream;
+ (id)_presentationProviderForDevice;
+ (void)_addBlockForSignpost:(unint64_t)a3 block:(id)a4;
+ (void)_executeAndCleanupBlocksForAllSignposts;
+ (void)_executeBlocksForSignpost:(unint64_t)a3;
+ (void)_playEventStream:(id)a3 withCompletion:(id)a4;
- (BOOL)_canShowWhileLocked;
- (BOOL)_dismissalFlickGestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)_dismissalFlickGestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)_dismissalFlickGestureRecognizerShouldBegin:(id)a3;
- (BOOL)_dismissalPanGestureRecognizerShouldBegin:(id)a3;
- (BOOL)_dismissalTapGestureRecognizerShouldBegin:(id)a3;
- (BOOL)_editingLongPressGestureRecognizerShouldBegin:(id)a3;
- (BOOL)_forceModuleEnabled:(id)a3;
- (BOOL)_gestureRecognizerIsActive:(id)a3;
- (BOOL)_includesModuleWithIdentifier:(id)a3 consideringObscureness:(BOOL)a4;
- (BOOL)_interpretsGestureLocationAsContent:(id)a3;
- (BOOL)_isRelevantSensorActivityData:(id)a3;
- (BOOL)_scrollPanGestureRecognizerCanBeginForGestureVelocity:(CGPoint)a3;
- (BOOL)_scrollPanGestureRecognizerShouldBegin:(id)a3;
- (BOOL)_scrollViewCanAcceptDownwardsPan;
- (BOOL)_scrollViewIsScrollable;
- (BOOL)canDismissPresentedContent;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)includesModuleWithIdentifier:(id)a3;
- (BOOL)includesVisiblyUnobscuredModuleWithIdentifier:(id)a3;
- (BOOL)isActive;
- (BOOL)isDevicePasscodeLockedForContentModuleContext:(id)a3;
- (BOOL)isEditing;
- (BOOL)isHomeGestureDismissalAllowed;
- (BOOL)isReachabilityActive;
- (BOOL)isSensorAttributionViewControllerExpanded;
- (BOOL)isShowingRootView;
- (BOOL)isSystemRestoringForPagingViewController:(id)a3;
- (BOOL)pagingViewController:(id)a3 shouldPauseCheckingInvalidControlsForApplicationIdentifier:(id)a4;
- (BOOL)runTest:(id)a3 options:(id)a4 delegate:(id)a5;
- (BOOL)scrollView:(id)a3 gestureRecognizerShouldBegin:(id)a4;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CCUIAnalyticsEventsController)analyticsEventsController;
- (CCUIControlCenterSystemAgent)systemAgent;
- (CCUIHeaderPocketView)overlayHeaderView;
- (CCUIHostStatusBarStyleProvider)hostStatusBarStyleProvider;
- (CCUILayoutRect)_layoutRectForIconCoordinate:(SEL)a3 gridSize:(SBIconCoordinate)a4;
- (CCUIMainViewController)initWithSystemAgent:(id)a3;
- (CCUIMainViewControllerDelegate)delegate;
- (CCUIModuleInstanceManager)moduleInstanceManager;
- (CCUIModuleSettingsManager)moduleSettingsManager;
- (CCUIPagingViewController)pagingViewController;
- (CCUISensorActivityDataProvider)sensorActivityDataProvider;
- (CCUIStatusBarStyleSnapshot)overlayStatusBarStyle;
- (CCUIStatusLabelViewController)statusLabelViewController;
- (CGPoint)_centerPointOfModuleWithIdentifier:(id)a3;
- (CGRect)compactAvoidanceFrameForStatusBar:(id)a3;
- (CGRect)expandedAvoidanceFrameForStatusBar:(id)a3;
- (CGRect)overlayBackgroundFrame;
- (CGRect)overlayContainerFrame;
- (CGSize)overlayContentSize;
- (MTMaterialView)overlayBackgroundView;
- (NSArray)overlayHeaderLayers;
- (NSUUID)currentTransitionUUID;
- (SFAskToAirDropReceiverControllerProtocol)askToAirDropController;
- (UIEdgeInsets)overlayAdditionalEdgeInsets;
- (UIEdgeInsets)overlayContentLayoutInset;
- (UIStatusBar)overlayLeadingStatusBar;
- (UIView)editingAccessoryView;
- (UIView)overlayContainerView;
- (UIView)overlayPageControl;
- (UIView)pagingView;
- (double)overlayReachabilityHeight;
- (id)_beginDismissalAnimated:(BOOL)a3 interactive:(BOOL)a4;
- (id)_beginPresentationAnimated:(BOOL)a3 interactive:(BOOL)a4;
- (id)_controlCenterShowOrbActionsEventStream:(id)a3;
- (id)_initWithSystemAgent:(id)a3 presentationProvider:(id)a4;
- (id)_pagingViewContainerView;
- (id)_safePagingViewContainerView;
- (id)_safeStatusLabelViewContainerView;
- (id)_scrollView;
- (id)_statusLabelViewContainerView;
- (id)compactTrailingStyleRequestForStatusBar:(id)a3;
- (id)contentModuleContext:(id)a3 requestsSensorActivityDataForActiveSensorType:(unint64_t)a4;
- (id)contentModuleContextRequestsSensorActivityDataEligibleForInactiveMicModeSelection:(id)a3;
- (id)existingControlKindFromWidgetExtension:(id)a3;
- (id)fallbackDragHitTestViewForScrollView:(id)a3;
- (id)pagingViewControllerDidAddModuleView:(id)a3;
- (id)reasonToDisallowEditing:(id)a3;
- (int64_t)_interfaceOrientation;
- (unint64_t)__supportedInterfaceOrientations;
- (unint64_t)_fetchModuleEnabledState:(id)a3;
- (unint64_t)moduleRowCount;
- (unint64_t)overlayPageCount;
- (unint64_t)presentationState;
- (unint64_t)supportedInterfaceOrientations;
- (unint64_t)transitionState;
- (void)_askToAirDropPendingOrActiveConnectionsDidChange;
- (void)_becomeActive;
- (void)_cancelDismissalPanGestures;
- (void)_disableModule:(id)a3;
- (void)_dismissalPanGestureRecognizerBegan:(id)a3;
- (void)_dismissalPanGestureRecognizerCancelled:(id)a3;
- (void)_dismissalPanGestureRecognizerChanged:(id)a3;
- (void)_dismissalPanGestureRecognizerEnded:(id)a3;
- (void)_dismissalPanGestureRecognizerFailed:(id)a3;
- (void)_endDismissalWithUUID:(id)a3 animated:(BOOL)a4;
- (void)_endPresentationWithUUID:(id)a3;
- (void)_evaluatePresentationContinuationIntoPagingWithLocation:(CGPoint)a3;
- (void)_getCameraSensorActivityData:(id *)a3 micSensorActivityData:(id *)a4 isInactiveMicModeSelection:(BOOL *)a5;
- (void)_handleDismissalFlickGestureRecognizer:(id)a3;
- (void)_handleDismissalPanGestureRecognizer:(id)a3;
- (void)_handleDismissalTapGestureRecognizer:(id)a3;
- (void)_handleEditingLongPressGestureRecognizer:(id)a3;
- (void)_replaceBackgroundViewContentsWithSnapshotIfNecessary:(BOOL)a3;
- (void)_resignActive;
- (void)_setPresentationPanGestureActive:(BOOL)a3;
- (void)_setupPanGestureFailureRequirements;
- (void)_updateAskToAirDropModuleVisibility;
- (void)_updateChevronStateForTransitionState:(id)a3;
- (void)_updateHotPocket:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateHotPocketAnimated:(BOOL)a3;
- (void)_updatePresentationForTransitionState:(id)a3 withCompletionHander:(id)a4;
- (void)_updatePresentationForTransitionType:(unint64_t)a3 translation:(CGPoint)a4 interactive:(BOOL)a5;
- (void)_updateSensorActivityStatusForHeaderPocketView;
- (void)_willDismissViewControllerContainedInPages;
- (void)_willPresentViewControllerContainedInPages;
- (void)addIfNecessaryAndScrollToControlMatching:(id)a3 animated:(BOOL)a4;
- (void)beginPresentationWithLocation:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5 touches:(id)a6;
- (void)cancelPresentationWithLocation:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5;
- (void)contentModuleContext:(id)a3 enqueueStatusUpdate:(id)a4;
- (void)dealloc;
- (void)didCloseExpandedSensorAttributionViewController;
- (void)didReceiveSignpost:(unint64_t)a3;
- (void)didTriggerEditButtonPrimaryAction;
- (void)didTriggerPowerButtonPrimaryAction;
- (void)dismissAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)dismissControlCenterForContentModuleContext:(id)a3;
- (void)dismissExpandedModuleAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissExpandedViewForContentModuleContext:(id)a3;
- (void)dismissPresentedContent;
- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissPresentedContentWithCompletionHandler:(id)a3;
- (void)displayWillTurnOff;
- (void)endPresentationWithLocation:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5;
- (void)enumerateOverlayModuleViewsWithBlock:(id)a3;
- (void)expandModuleWithIdentifier:(id)a3;
- (void)gameModeStateDidChange:(unint64_t)a3;
- (void)handleControlCenterOperationTypeWithOperationService:(id)a3 operationType:(int64_t)a4 completionHandler:(id)a5;
- (void)handleIconElementRequestWithOperationService:(id)a3 iconElementRequest:(id)a4 completionHandler:(id)a5;
- (void)moduleInstancesChangedForModuleInstanceManager:(id)a3;
- (void)pagingViewController:(id)a3 didAdd:(id)a4;
- (void)pagingViewController:(id)a3 didClose:(id)a4;
- (void)pagingViewController:(id)a3 editingAccessoryViewIntrinsicSizeDidChange:(id)a4;
- (void)pagingViewController:(id)a3 editingDidChange:(BOOL)a4;
- (void)pagingViewController:(id)a3 willExpand:(id)a4;
- (void)pagingViewController:(id)a3 willRemove:(id)a4;
- (void)presentAnimated:(BOOL)a3 withCompletionHandler:(id)a4;
- (void)reachabilityAnimationDidEnd;
- (void)requestExpandModuleForContentModuleContext:(id)a3;
- (void)requestIconElementStateWithOperationService:(id)a3 iconElementRequest:(id)a4 completionHandler:(id)a5;
- (void)resetToDefaultLayoutWithCompletionHandler:(id)a3;
- (void)runTest:(id)a3 subtests:(id)a4 eventStream:(id)a5 completionHandler:(id)a6;
- (void)scrollViewDidScroll:(id)a3;
- (void)setCurrentTransitionUUID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setHostStatusBarStyleProvider:(id)a3;
- (void)setModuleInstanceManager:(id)a3;
- (void)setModuleSettingsManager:(id)a3;
- (void)setOverlayContentLayoutInset:(UIEdgeInsets)a3;
- (void)setOverlayContentLayoutOffset:(CGPoint)a3;
- (void)setOverlayPageContentAlpha:(double)a3;
- (void)setOverlayPageContentScale:(double)a3;
- (void)setOverlayPageContentTranslation:(CGPoint)a3;
- (void)setOverlayStatusBarHidden:(BOOL)a3;
- (void)setPagingViewController:(id)a3;
- (void)setPresentationState:(unint64_t)a3;
- (void)setReachabilityActive:(BOOL)a3;
- (void)setSensorActivityDataProvider:(id)a3;
- (void)setTransitionState:(unint64_t)a3;
- (void)statusLabelViewControllerDidFinishStatusUpdates:(id)a3;
- (void)statusLabelViewControllerWillBeginStatusUpdates:(id)a3;
- (void)updatePresentationWithLocation:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willOpenExpandedSensorAttributionViewController;
@end

@implementation CCUIMainViewController

- (CCUISensorActivityDataProvider)sensorActivityDataProvider
{
  return self->_sensorActivityDataProvider;
}

void __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if ([v8 sensorType] == 1
    && [*(id *)(a1 + 32) _isRelevantSensorActivityData:v8])
  {
    uint64_t v5 = [v8 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *a3 = 1;
  }
}

void __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if (![v8 sensorType]
    && [*(id *)(a1 + 32) _isRelevantSensorActivityData:v8])
  {
    uint64_t v5 = [v8 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *a3 = 1;
  }
}

- (BOOL)_isRelevantSensorActivityData:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 sensorType] > 1)
  {
    char ShouldBeShownForBundleID = 1;
  }
  else
  {
    v4 = [v3 bundleIdentifier];
    if (v4) {
      char ShouldBeShownForBundleID = AVControlCenterModulesShouldBeShownForBundleID();
    }
    else {
      char ShouldBeShownForBundleID = 0;
    }
  }
  return ShouldBeShownForBundleID;
}

- (int64_t)_interfaceOrientation
{
  v2 = [(CCUIMainViewController *)self view];
  id v3 = [v2 window];
  unint64_t v4 = [v3 interfaceOrientation];

  if (v4 <= 1) {
    return 1;
  }
  else {
    return v4;
  }
}

- (BOOL)runTest:(id)a3 options:(id)a4 delegate:(id)a5
{
  v62[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v35 = a5;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x3032000000;
  v54 = __Block_byref_object_copy_;
  v55 = __Block_byref_object_dispose_;
  id v56 = 0;
  if ([v7 isEqualToString:@"ControlCenterBringup"])
  {
    v9 = +[CCUIPPTTest testWithName:@"animation", 1, 2, v8 beginSignpost endSignpost];
    v10 = +[CCUIPPTRootTest testWithName:v7];
    v62[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:1];
    uint64_t v12 = [(id)objc_opt_class() _controlCenterBringupEventStream];
    v13 = (void *)v52[5];
    v52[5] = v12;

    id v14 = 0;
    int v15 = 0;
    v16 = 0;
    char v17 = 0;
    char v18 = 0;
LABEL_3:
    uint64_t v19 = 1;
    goto LABEL_8;
  }
  if (objc_msgSend(v7, "isEqualToString:", @"ControlCenterBringupOverSafari", v8))
  {
    v9 = +[CCUIPPTTest testWithName:@"animation" beginSignpost:1 endSignpost:2];
    v10 = +[CCUIPPTRootTest testWithName:v7];
    v61 = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
    uint64_t v20 = [(id)objc_opt_class() _controlCenterBringupEventStream];
    v21 = (void *)v52[5];
    v52[5] = v20;

    id v14 = 0;
    int v15 = 0;
    v16 = 0;
    char v17 = 0;
    char v18 = 0;
    uint64_t v19 = 2;
  }
  else
  {
    if (![v7 isEqualToString:@"ControlCenterBringupOnLockScreen"])
    {
      if ([v7 isEqualToString:@"ControlCenterDismiss"])
      {
        v9 = +[CCUIPPTTest testWithName:@"animation" beginSignpost:3 endSignpost:4];
        v10 = +[CCUIPPTRootTest testWithName:v7];
        v59 = v9;
        id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
        uint64_t v30 = [(id)objc_opt_class() _controlCenterDismissEventStream];
        v31 = (void *)v52[5];
        v52[5] = v30;

        id v14 = 0;
        int v15 = 0;
        v16 = 0;
        char v17 = 0;
        char v18 = 1;
      }
      else if ([v7 isEqualToString:@"ControlCenterShowOrbActions"])
      {
        v9 = +[CCUIPPTTest testWithName:@"animation" beginSignpost:5 endSignpost:6];
        v10 = +[CCUIPPTRootTest testWithName:v7];
        v58 = v9;
        id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke;
        v49[3] = &unk_1E6A89A08;
        v49[4] = self;
        v50 = @"com.apple.control-center.QuickNoteModule";
        id v14 = _Block_copy(v49);

        char v17 = 0;
        v16 = @"com.apple.control-center.QuickNoteModule";
        int v15 = 1;
        char v18 = 1;
      }
      else
      {
        if (![v7 isEqualToString:@"ControlCenterDismissOrbActions"])
        {
          BOOL v25 = 0;
          id v26 = 0;
          id v14 = 0;
          id v11 = (id)MEMORY[0x1E4F1CBF0];
          goto LABEL_15;
        }
        v9 = +[CCUIPPTTest testWithName:@"animation" beginSignpost:7 endSignpost:8];
        v10 = +[CCUIPPTRootTest testWithName:v7];
        v57 = v9;
        id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
        uint64_t v32 = [(id)objc_opt_class() _controlCenterDismissOrbActionsEventStream];
        v33 = (void *)v52[5];
        v52[5] = v32;

        id v14 = 0;
        v16 = @"com.apple.control-center.QuickNoteModule";
        char v17 = 1;
        int v15 = 1;
        char v18 = 1;
      }
      goto LABEL_3;
    }
    v9 = +[CCUIPPTTest testWithName:@"animation" beginSignpost:1 endSignpost:2];
    v10 = +[CCUIPPTRootTest testWithName:v7];
    v60 = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
    uint64_t v22 = [(id)objc_opt_class() _controlCenterBringupEventStream];
    v23 = (void *)v52[5];
    v52[5] = v22;

    id v14 = 0;
    int v15 = 0;
    v16 = 0;
    char v17 = 0;
    char v18 = 0;
    uint64_t v19 = 0;
  }
LABEL_8:

  if (v10)
  {
    if (v15)
    {
      unint64_t v24 = [(CCUIMainViewController *)self _fetchModuleEnabledState:v16];
      if (v24 != 3) {
        [(CCUIMainViewController *)self _forceModuleEnabled:v16];
      }
    }
    else
    {
      unint64_t v24 = 0;
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_2;
    aBlock[3] = &unk_1E6A89A58;
    aBlock[4] = self;
    id v26 = v10;
    id v45 = v26;
    id v11 = v11;
    id v46 = v11;
    v47 = v16;
    unint64_t v48 = v24;
    v27 = _Block_copy(aBlock);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_4;
    v37[3] = &unk_1E6A89AD0;
    char v42 = v18;
    v37[4] = self;
    id v14 = v14;
    v41 = &v51;
    char v43 = v17;
    v38 = v16;
    id v39 = v14;
    id v28 = v27;
    id v40 = v28;
    [v35 prepareForControlCenterPPTHostState:v19 completionHandler:v37];

    BOOL v25 = 1;
  }
  else
  {
    BOOL v25 = 0;
    id v26 = 0;
  }
LABEL_15:

  _Block_object_dispose(&v51, 8);
  return v25;
}

uint64_t __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 usedRecently] ^ 1;
}

- (void)moduleInstancesChangedForModuleInstanceManager:(id)a3
{
  id v3 = [(CCUIMainViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CCUIMainViewController;
  [(CCUIMainViewController *)&v3 viewWillLayoutSubviews];
  [(CCUIOverlayPresentationProvider *)self->_presentationProvider layoutViews];
}

- (CCUIHeaderPocketView)overlayHeaderView
{
  return self->_headerPocketView;
}

- (UIView)pagingView
{
  return (UIView *)[(CCUIPagingViewController *)self->_pagingViewController view];
}

- (BOOL)isEditing
{
  v2 = [(CCUIMainViewController *)self pagingViewController];
  char v3 = [v2 isEditing];

  return v3;
}

- (CCUIPagingViewController)pagingViewController
{
  return self->_pagingViewController;
}

- (UIView)editingAccessoryView
{
  return [(CCUIPagingViewController *)self->_pagingViewController editingAccessoryView];
}

- (CCUIStatusLabelViewController)statusLabelViewController
{
  return self->_statusLabelViewController;
}

- (void)setOverlayContentLayoutOffset:(CGPoint)a3
{
}

- (void)setOverlayContentLayoutInset:(UIEdgeInsets)a3
{
}

- (CCUIStatusBarStyleSnapshot)overlayStatusBarStyle
{
  return self->_hostStatusBarStyleSnapshot;
}

- (double)overlayReachabilityHeight
{
  if (![(CCUIMainViewController *)self isReachabilityActive]) {
    return 0.0;
  }
  char v3 = [(CCUIMainViewController *)self delegate];
  [v3 reachabilityOffsetForControlCenterViewController:self];
  double v5 = v4;

  return v5;
}

- (UIStatusBar)overlayLeadingStatusBar
{
  return self->_compactLeadingStatusBar;
}

- (NSArray)overlayHeaderLayers
{
  return self->_headerPocketGradientMaskLayers;
}

- (CGSize)overlayContentSize
{
  [(CCUIPagingViewController *)self->_pagingViewController contentLayoutSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIView)overlayContainerView
{
  return self->_containerView;
}

- (CGRect)overlayContainerFrame
{
  double v2 = [(CCUIMainViewController *)self view];
  [v2 bounds];
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
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (MTMaterialView)overlayBackgroundView
{
  return self->_backgroundView;
}

- (CGRect)overlayBackgroundFrame
{
  double v2 = [(CCUIMainViewController *)self view];
  [v2 bounds];
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
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)isReachabilityActive
{
  return self->_reachabilityActive;
}

- (void)setSensorActivityDataProvider:(id)a3
{
  double v4 = (CCUISensorActivityDataProvider *)a3;
  double v5 = *MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl(&dword_1D7B17000, v5, OS_LOG_TYPE_DEFAULT, "Updated sensor activity data provider", v7, 2u);
  }
  sensorActivityDataProvider = self->_sensorActivityDataProvider;
  self->_sensorActivityDataProvider = v4;

  if (![(CCUIMainViewController *)self presentationState]) {
    [(CCUIMainViewController *)self _updateSensorActivityStatusForHeaderPocketView];
  }
}

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (void)_updateSensorActivityStatusForHeaderPocketView
{
  *(void *)&v36[5] = *MEMORY[0x1E4F143B8];
  char v34 = 0;
  id v32 = 0;
  id v33 = 0;
  [(CCUIMainViewController *)self _getCameraSensorActivityData:&v33 micSensorActivityData:&v32 isInactiveMicModeSelection:&v34];
  id v3 = v33;
  id v4 = v32;
  double v5 = v4;
  double v6 = (os_log_t *)MEMORY[0x1E4F5AD98];
  if (v3)
  {
    double v7 = (void *)*MEMORY[0x1E4F5AD98];
    BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT);
    double v9 = v3;
    if (v8)
    {
      double v10 = v7;
      double v11 = [v3 debugDescription];
      *(_DWORD *)buf = 138543362;
      *(void *)v36 = v11;
      _os_log_impl(&dword_1D7B17000, v10, OS_LOG_TYPE_DEFAULT, "Adding sensor usage data for CAMERA [%{public}@]", buf, 0xCu);

      double v9 = v3;
    }
LABEL_7:
    id v16 = v9;
    goto LABEL_8;
  }
  if (v4)
  {
    double v12 = (void *)*MEMORY[0x1E4F5AD98];
    BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT);
    double v9 = v5;
    if (v13)
    {
      double v14 = v12;
      int v15 = [v5 debugDescription];
      *(_DWORD *)buf = 138543362;
      *(void *)v36 = v15;
      _os_log_impl(&dword_1D7B17000, v14, OS_LOG_TYPE_DEFAULT, "Adding sensor usage data for MICROPHONE [%{public}@]", buf, 0xCu);

      double v9 = v5;
    }
    goto LABEL_7;
  }
  id v16 = 0;
LABEL_8:
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  char v18 = [(CCUISensorActivityDataProvider *)self->_sensorActivityDataProvider activeSensorActivityData];
  uint64_t v19 = [v17 setByAddingObjectsFromSet:v18];

  uint64_t v20 = [(CCUIGameModeActivityDataProvider *)self->_gameModeActivityDataProvider activityData];
  v21 = [v19 setByAddingObjectsFromSet:v20];

  os_log_t v22 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v23 = v22;
    unint64_t v24 = [v16 bundleIdentifier];
    *(_DWORD *)buf = 67109378;
    v36[0] = v16 != 0;
    LOWORD(v36[1]) = 2114;
    *(void *)((char *)&v36[1] + 2) = v24;
    _os_log_impl(&dword_1D7B17000, v23, OS_LOG_TYPE_DEFAULT, "Setting visibility of AV modules to %{BOOL}d for bundle identifer %{public}@", buf, 0x12u);
  }
  BOOL v25 = [MEMORY[0x1E4F5ACE8] sharedInstance];
  [v25 setVisibility:v16 != 0 forModuleWithIdentifier:@"com.apple.replaykit.VideoConferenceControlCenterModule" completionHandler:0];

  id v26 = [MEMORY[0x1E4F5ACE8] sharedInstance];
  [v26 setVisibility:v16 != 0 forModuleWithIdentifier:@"com.apple.replaykit.AudioConferenceControlCenterModule" completionHandler:0];

  headerPocketView = self->_headerPocketView;
  id v28 = [v16 bundleIdentifier];
  [(CCUIHeaderPocketView *)headerPocketView setAudioVideoControlsEnabled:v16 != 0 forBundleIdentifier:v28];

  [(CCUIHeaderPocketView *)self->_headerPocketView setGameModeActivityDataProvider:self->_gameModeActivityDataProvider];
  [(CCUIHeaderPocketView *)self->_headerPocketView gameModeStateDidChange:[(CCUIGameModeActivityDataProvider *)self->_gameModeActivityDataProvider gameModeState]];
  [(CCUIHeaderPocketView *)self->_headerPocketView setAudioVideoModeSelectionAttribution:v16];
  [(CCUIHeaderPocketView *)self->_headerPocketView sensorAttributionsChanged:v21];
  if (v34) {
    v29 = v5;
  }
  else {
    v29 = 0;
  }
  uint64_t v30 = self->_headerPocketView;
  id v31 = v29;
  [(CCUIHeaderPocketView *)v30 inactiveMicModeSelectionAttributionChanged:v31];
  [(CCUIHeaderPocketView *)self->_headerPocketView layoutIfNeeded];
}

- (void)_getCameraSensorActivityData:(id *)a3 micSensorActivityData:(id *)a4 isInactiveMicModeSelection:(BOOL *)a5
{
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__2;
  id v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  double v9 = [(CCUISensorActivityDataProvider *)self->_sensorActivityDataProvider activeSensorActivityData];
  double v10 = objc_msgSend(v9, "bs_filter:", &__block_literal_global_127);

  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke_2;
  v28[3] = &unk_1E6A8A1D0;
  v28[4] = self;
  v28[5] = &v29;
  [v10 enumerateObjectsUsingBlock:v28];
  double v11 = (void *)v30[5];
  if (v11)
  {
    double v12 = [v11 attributionGroup];
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    BOOL v25 = __Block_byref_object_copy__2;
    id v26 = __Block_byref_object_dispose__2;
    id v27 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke_3;
    v19[3] = &unk_1E6A8A1D0;
    id v13 = v12;
    id v20 = v13;
    v21 = &v22;
    [v10 enumerateObjectsUsingBlock:v19];
    id v14 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
    BOOL v15 = 0;
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  BOOL v25 = __Block_byref_object_copy__2;
  id v26 = __Block_byref_object_dispose__2;
  id v27 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke_4;
  v18[3] = &unk_1E6A8A1D0;
  v18[4] = self;
  v18[5] = &v22;
  [v10 enumerateObjectsUsingBlock:v18];
  id v16 = (void *)v23[5];
  if (v16)
  {
    id v14 = v16;
    BOOL v15 = 0;
  }
  else if (CCUIFeatureEnabled())
  {
    id v17 = [(CCUISensorActivityDataProvider *)self->_sensorActivityDataProvider inactiveSensorActivityDataEligibleForMicModeSelection];
    id v14 = (id)[v17 copy];

    BOOL v15 = v14 != 0;
  }
  else
  {
    BOOL v15 = 0;
    id v14 = 0;
  }
  _Block_object_dispose(&v22, 8);

  if (a3) {
LABEL_3:
  }
    *a3 = (id) v30[5];
LABEL_4:
  if (a4) {
    *a4 = v14;
  }
  if (a5) {
    *a5 = v15;
  }

  _Block_object_dispose(&v29, 8);
}

void __104__CCUIMainViewController__getCameraSensorActivityData_micSensorActivityData_isInactiveMicModeSelection___block_invoke_3(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  if ([v10 sensorType] == 1)
  {
    double v5 = [v10 attributionGroup];
    int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

    if (v6)
    {
      uint64_t v7 = [v10 copy];
      uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
      double v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      *a3 = 1;
    }
  }
}

uint64_t __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _controlCenterShowOrbActionsEventStream:*(void *)(a1 + 40)];
}

void __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_3;
  v9[3] = &unk_1E6A89A30;
  v9[4] = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  id v10 = v7;
  uint64_t v11 = v8;
  [v4 runTest:v5 subtests:v6 eventStream:a2 completionHandler:v9];
}

uint64_t __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) dismissAnimated:0 withCompletionHandler:0];
  if (*(void *)(a1 + 40) && *(void *)(a1 + 48) != 3)
  {
    id v3 = *(void **)(a1 + 32);
    return objc_msgSend(v3, "_disableModule:");
  }
  return result;
}

void __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_4(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 72))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_5;
    v11[3] = &unk_1E6A89AA8;
    id v3 = &v13;
    id v4 = *(id *)(a1 + 48);
    uint64_t v15 = *(void *)(a1 + 64);
    char v16 = *(unsigned char *)(a1 + 73);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    id v13 = v4;
    v11[4] = v5;
    id v12 = v6;
    id v14 = *(id *)(a1 + 56);
    [v2 presentAnimated:0 withCompletionHandler:v11];
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_9;
    v9[3] = &unk_1E6A89A80;
    id v3 = (id *)v10;
    id v7 = *(id *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 64);
    v10[0] = v7;
    v10[1] = v8;
    [v2 dismissAnimated:0 withCompletionHandler:v9];
  }
}

void __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_5(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_6;
  v6[3] = &unk_1E6A89AA8;
  id v3 = *(id *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 64);
  char v11 = *(unsigned char *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(a1 + 40);
  id v8 = v3;
  v6[4] = v4;
  id v7 = v5;
  id v9 = *(id *)(a1 + 56);
  dispatch_after(v2, MEMORY[0x1E4F14428], v6);
}

void __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    uint64_t v3 = (*(void (**)(void))(v2 + 16))();
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [*(id *)(a1 + 32) _controlCenterShowOrbActionsEventStream:*(void *)(a1 + 40)];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_7;
    v11[3] = &unk_1E6A89A80;
    id v8 = *(id *)(a1 + 56);
    uint64_t v9 = *(void *)(a1 + 64);
    id v12 = v8;
    uint64_t v13 = v9;
    [v6 _playEventStream:v7 withCompletion:v11];
  }
  else
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v10();
  }
}

void __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_7(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_8;
  v5[3] = &unk_1E6A89A80;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_after(v2, MEMORY[0x1E4F14428], v5);
}

uint64_t __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_9(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_10;
  v5[3] = &unk_1E6A89A80;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  dispatch_after(v2, MEMORY[0x1E4F14428], v5);
}

uint64_t __56__CCUIMainViewController_PPT__runTest_options_delegate___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

+ (id)_controlCenterBringupEventStream
{
  if (LoadRecap_loadPredicate != -1) {
    dispatch_once(&LoadRecap_loadPredicate, &__block_literal_global_1);
  }
  dispatch_time_t v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  uint64_t v4 = [v2 _keyWindowForScreen:v3];

  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  if (SBFEffectiveHomeButtonType() == 2
    || ([MEMORY[0x1E4FB16C8] currentDevice],
        uint64_t v13 = objc_claimAutoreleasedReturnValue(),
        uint64_t v14 = [v13 userInterfaceIdiom],
        v13,
        v14 == 1))
  {
    v56.origin.x = v6;
    v56.origin.y = v8;
    v56.size.width = v10;
    v56.size.height = v12;
    double MaxX = CGRectGetMaxX(v56);
    v57.origin.x = v6;
    v57.origin.y = v8;
    v57.size.width = v10;
    v57.size.height = v12;
    objc_msgSend(v4, "convertPoint:toView:", 0, MaxX, CGRectGetMinY(v57));
    objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    v58.origin.x = v6;
    v58.origin.y = v8;
    v58.size.width = v10;
    v58.size.height = v12;
    double v20 = CGRectGetMaxX(v58);
    v59.origin.x = v6;
    v59.origin.y = v8;
    v59.size.width = v10;
    v59.size.height = v12;
    objc_msgSend(v4, "convertPoint:toView:", 0, v20, CGRectGetMaxY(v59));
    objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
    uint64_t v22 = v21;
    uint64_t v24 = v23;
    Class RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
    uint64_t v47 = MEMORY[0x1E4F143A8];
    uint64_t v48 = 3221225472;
    v49 = __63__CCUIMainViewController_PPT___controlCenterBringupEventStream__block_invoke;
    v50 = &__block_descriptor_64_e34_v16__0___RCPEventStreamComposer__8l;
    uint64_t v51 = v17;
    uint64_t v52 = v19;
    uint64_t v53 = v22;
    uint64_t v54 = v24;
    id v26 = &v47;
  }
  else
  {
    v60.origin.x = v6;
    v60.origin.y = v8;
    v60.size.width = v10;
    v60.size.height = v12;
    double MidX = CGRectGetMidX(v60);
    v61.origin.x = v6;
    v61.origin.y = v8;
    v61.size.width = v10;
    v61.size.height = v12;
    objc_msgSend(v4, "convertPoint:toView:", 0, MidX, CGRectGetMaxY(v61));
    objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
    uint64_t v29 = v28;
    uint64_t v31 = v30;
    v62.origin.x = v6;
    v62.origin.y = v8;
    v62.size.width = v10;
    v62.size.height = v12;
    double v32 = CGRectGetMidX(v62);
    v63.origin.x = v6;
    v63.origin.y = v8;
    v63.size.width = v10;
    v63.size.height = v12;
    objc_msgSend(v4, "convertPoint:toView:", 0, v32, CGRectGetMinY(v63));
    objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
    uint64_t v34 = v33;
    uint64_t v36 = v35;
    Class RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
    uint64_t v39 = MEMORY[0x1E4F143A8];
    uint64_t v40 = 3221225472;
    v41 = __63__CCUIMainViewController_PPT___controlCenterBringupEventStream__block_invoke_2;
    char v42 = &__block_descriptor_64_e34_v16__0___RCPEventStreamComposer__8l;
    uint64_t v43 = v29;
    uint64_t v44 = v31;
    uint64_t v45 = v34;
    uint64_t v46 = v36;
    id v26 = &v39;
  }
  v37 = -[objc_class eventStreamWithEventActions:](RCPSyntheticEventStreamClass, "eventStreamWithEventActions:", v26, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54);

  return v37;
}

uint64_t __63__CCUIMainViewController_PPT___controlCenterBringupEventStream__block_invoke(double *a1, void *a2)
{
  return objc_msgSend(a2, "sendFlickWithStartPoint:endPoint:duration:", a1[4], a1[5], a1[6], a1[7], 0.25);
}

uint64_t __63__CCUIMainViewController_PPT___controlCenterBringupEventStream__block_invoke_2(double *a1, void *a2)
{
  return objc_msgSend(a2, "sendFlickWithStartPoint:endPoint:duration:", a1[4], a1[5], a1[6], a1[7], 0.25);
}

+ (id)_controlCenterDismissEventStream
{
  if (LoadRecap_loadPredicate != -1) {
    dispatch_once(&LoadRecap_loadPredicate, &__block_literal_global_1);
  }
  Class RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();

  return (id)[(objc_class *)RCPSyntheticEventStreamClass eventStreamWithCLIArguments:&unk_1F2F4B740];
}

- (CGPoint)_centerPointOfModuleWithIdentifier:(id)a3
{
  UIRectGetCenter();
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)_controlCenterShowOrbActionsEventStream:(id)a3
{
  [(CCUIMainViewController *)self _centerPointOfModuleWithIdentifier:a3];
  double v4 = v3;
  double v6 = v5;
  double v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  CGFloat v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
  double v9 = [v7 _keyWindowForScreen:v8];

  objc_msgSend(v9, "convertPoint:toView:", 0, v4, v6);
  objc_msgSend(v9, "_convertPointToSceneReferenceSpace:");
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  Class RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__CCUIMainViewController_PPT___controlCenterShowOrbActionsEventStream___block_invoke;
  v17[3] = &__block_descriptor_48_e34_v16__0___RCPEventStreamComposer__8l;
  v17[4] = v11;
  v17[5] = v13;
  uint64_t v15 = [(objc_class *)RCPSyntheticEventStreamClass eventStreamWithEventActions:v17];

  return v15;
}

void __71__CCUIMainViewController_PPT___controlCenterShowOrbActionsEventStream___block_invoke(uint64_t a1, void *a2)
{
  double v2 = *(double *)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  id v4 = a2;
  objc_msgSend(v4, "touchDown:", v2, v3);
  [v4 advanceTime:3.0];
  [v4 liftUpAtAllActivePoints];
}

+ (id)_controlCenterDismissOrbActionsEventStream
{
  double v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  id v4 = [v2 _keyWindowForScreen:v3];

  [v4 bounds];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  CGFloat width = v19.size.width;
  CGFloat height = v19.size.height;
  CGFloat v9 = CGRectGetWidth(v19) * 0.1;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  objc_msgSend(v4, "convertPoint:toView:", 0, v9, CGRectGetHeight(v20) * 0.1);
  objc_msgSend(v4, "_convertPointToSceneReferenceSpace:");
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  Class RCPSyntheticEventStreamClass = getRCPSyntheticEventStreamClass();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__CCUIMainViewController_PPT___controlCenterDismissOrbActionsEventStream__block_invoke;
  v17[3] = &__block_descriptor_48_e34_v16__0___RCPEventStreamComposer__8l;
  v17[4] = v11;
  v17[5] = v13;
  uint64_t v15 = [(objc_class *)RCPSyntheticEventStreamClass eventStreamWithEventActions:v17];

  return v15;
}

uint64_t __73__CCUIMainViewController_PPT___controlCenterDismissOrbActionsEventStream__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tap:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

+ (void)_playEventStream:(id)a3 withCompletion:(id)a4
{
  id v5 = a4;
  double v6 = (Class (__cdecl *)())getRCPPlayerPlaybackOptionsClass;
  id v7 = a3;
  id v8 = objc_alloc_init(v6());
  Class RCPInlinePlayerClass = getRCPInlinePlayerClass();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__CCUIMainViewController_PPT___playEventStream_withCompletion___block_invoke;
  v11[3] = &unk_1E6A89B38;
  id v12 = v5;
  id v10 = v5;
  [(objc_class *)RCPInlinePlayerClass playEventStream:v7 options:v8 completion:v11];
}

uint64_t __63__CCUIMainViewController_PPT___playEventStream_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (unint64_t)_fetchModuleEnabledState:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2020000000;
    uint64_t v16 = 0;
    id v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    id v5 = [MEMORY[0x1E4F5ACE8] sharedInstance];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __56__CCUIMainViewController_PPT___fetchModuleEnabledState___block_invoke;
    v10[3] = &unk_1E6A89B60;
    id v12 = &v13;
    double v6 = v4;
    uint64_t v11 = v6;
    [v5 getEnabledStateOfModuleWithIdentifier:v3 completionHandler:v10];

    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    unint64_t v8 = 0;
    if (!dispatch_group_wait(v6, v7)) {
      unint64_t v8 = v14[3];
    }

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

void __56__CCUIMainViewController_PPT___fetchModuleEnabledState___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)_forceModuleEnabled:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  id v5 = [MEMORY[0x1E4F5ACE8] sharedInstance];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __51__CCUIMainViewController_PPT___forceModuleEnabled___block_invoke;
  v10[3] = &unk_1E6A89B88;
  id v12 = &v13;
  double v6 = v4;
  uint64_t v11 = v6;
  [v5 requestEnableModuleWithIdentifier:v3 force:1 completionHandler:v10];

  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v6, v7)) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = *((unsigned char *)v14 + 24) != 0;
  }

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __51__CCUIMainViewController_PPT___forceModuleEnabled___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_disableModule:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x1E4F5ACE8];
    id v4 = a3;
    id v5 = [v3 sharedInstance];
    [v5 requestDisableModuleWithIdentifier:v4 completionHandler:0];
  }
}

- (void)runTest:(id)a3 subtests:(id)a4 eventStream:(id)a5 completionHandler:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v34 = a5;
  id v33 = a6;
  if (LoadRecap_loadPredicate_0 != -1) {
    dispatch_once(&LoadRecap_loadPredicate_0, &__block_literal_global_69);
  }
  [(id)objc_opt_class() _executeAndCleanupBlocksForAllSignposts];
  if (gSignpostListener) {
    BOOL v13 = gSignpostListener == (void)self;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    double v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2 object:self file:@"CCUIMainViewController+PPTInternal.m" lineNumber:32 description:@"Invalid start state for test"];
  }
  objc_storeStrong((id *)&gSignpostListener, self);
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x3810000000;
  v59[3] = &unk_1D7BD4AAF;
  char v60 = 0;
  v57[0] = 0;
  v57[1] = v57;
  v57[2] = 0x3032000000;
  v57[3] = __Block_byref_object_copy__1;
  v57[4] = __Block_byref_object_dispose__1;
  uint64_t v14 = (void *)MEMORY[0x1E4F1CB00];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke;
  v54[3] = &unk_1E6A89D30;
  CGRect v56 = v59;
  id v36 = v11;
  id v55 = v36;
  id v58 = [v14 scheduledTimerWithTimeInterval:0 repeats:v54 block:10.0];
  group = dispatch_group_create();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v12;
  uint64_t v15 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        dispatch_group_enter(group);
        CGRect v19 = objc_opt_class();
        uint64_t v20 = [v18 beginSignpost];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_2;
        v48[3] = &unk_1E6A89968;
        v48[4] = v18;
        id v21 = v36;
        id v49 = v21;
        [v19 _addBlockForSignpost:v20 block:v48];
        uint64_t v22 = objc_opt_class();
        uint64_t v23 = [v18 endSignpost];
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_3;
        v45[3] = &unk_1E6A89990;
        v45[4] = v18;
        id v46 = v21;
        uint64_t v47 = group;
        [v22 _addBlockForSignpost:v23 block:v45];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v15);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_4;
  aBlock[3] = &unk_1E6A89D58;
  uint64_t v43 = v59;
  uint64_t v44 = v57;
  id v24 = v36;
  id v41 = v24;
  id v25 = v33;
  id v42 = v25;
  id v26 = _Block_copy(aBlock);
  if ([v24 endSignpost]) {
    objc_msgSend((id)objc_opt_class(), "_addBlockForSignpost:block:", objc_msgSend(v24, "endSignpost"), v26);
  }
  else {
    dispatch_group_notify(group, MEMORY[0x1E4F14428], v26);
  }
  if ([v24 beginSignpost])
  {
    id v27 = objc_opt_class();
    uint64_t v28 = [v24 beginSignpost];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_6;
    v38[3] = &unk_1E6A898F8;
    id v39 = v24;
    [v27 _addBlockForSignpost:v28 block:v38];
    uint64_t v29 = v39;
  }
  else
  {
    uint64_t v29 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v30 = [v24 name];
    [v29 startedTest:v30];
  }
  id v31 = objc_alloc_init(getRCPPlayerPlaybackOptionsClass_0());
  [(objc_class *)getRCPInlinePlayerClass_0() playEventStream:v34 options:v31 completion:&__block_literal_global_4];

  _Block_object_dispose(v57, 8);
  _Block_object_dispose(v59, 8);
}

void __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke(uint64_t a1)
{
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 48), 1u) & 1) == 0)
  {
    double v2 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v3 = [*(id *)(a1 + 32) name];
    [v2 failedTest:v3 withFailure:@"Signpost timeout" withResults:0];

    id v4 = (void *)gSignpostListener;
    gSignpostListener = 0;
  }
}

void __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_2(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v2 = [*(id *)(a1 + 32) name];
  id v3 = [*(id *)(a1 + 40) name];
  [v4 startedSubTest:v2 forTest:v3];
}

void __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_3(uint64_t a1)
{
  double v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v3 = [*(id *)(a1 + 32) name];
  id v4 = [*(id *)(a1 + 40) name];
  [v2 finishedSubTest:v3 forTest:v4];

  id v5 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v5);
}

void __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_4(uint64_t a1)
{
  if ((atomic_exchange((atomic_uchar *volatile)(*(void *)(*(void *)(a1 + 48) + 8) + 48), 1u) & 1) == 0)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) invalidate];
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;

    id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v5 = [*(id *)(a1 + 32) name];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_5;
    v6[3] = &unk_1E6A89B38;
    id v7 = *(id *)(a1 + 40);
    [v4 finishedTest:v5 extraResults:0 withTeardownBlock:v6];
  }
}

uint64_t __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = (void *)gSignpostListener;
  gSignpostListener = 0;

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __86__CCUIMainViewController_PPTInternal__runTest_subtests_eventStream_completionHandler___block_invoke_6(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v2 = [*(id *)(a1 + 32) name];
  [v3 startedTest:v2];
}

uint64_t __56__CCUIMainViewController_PPTInternal___blocksBySignpost__block_invoke()
{
  _blocksBySignpost_blocksBySignpost = [MEMORY[0x1E4F1CA60] dictionary];

  return MEMORY[0x1F41817F8]();
}

+ (void)_addBlockForSignpost:(unint64_t)a3 block:(id)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 _blocksBySignpost];
  objc_sync_enter(v7);
  BOOL v8 = [NSNumber numberWithUnsignedInteger:a3];
  CGFloat v9 = [v7 objectForKey:v8];

  id v10 = _Block_copy(v6);
  id v11 = v10;
  if (v9)
  {
    id v12 = [v9 arrayByAddingObject:v10];
  }
  else
  {
    v14[0] = v10;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  BOOL v13 = [NSNumber numberWithUnsignedInteger:a3];
  [v7 setObject:v12 forKey:v13];

  objc_sync_exit(v7);
}

+ (void)_executeAndCleanupBlocksForAllSignposts
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 _blocksBySignpost];
  objc_sync_enter(v2);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v19;
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v7 = 0;
      BOOL v8 = v6;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v3);
        }
        CGFloat v9 = [v3 objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * v7)];
        id v6 = [v8 arrayByAddingObjectsFromArray:v9];

        ++v7;
        BOOL v8 = v6;
      }
      while (v4 != v7);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  [v3 removeAllObjects];
  objc_sync_exit(v3);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v10);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v14 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v14 + 1) + 8 * i));
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

+ (void)_executeBlocksForSignpost:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = [a1 _blocksBySignpost];
  objc_sync_enter(v4);
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = objc_msgSend(v4, "bs_takeObjectForKey:", v5);

  objc_sync_exit(v4);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)didReceiveSignpost:(unint64_t)a3
{
  id v4 = objc_opt_class();

  [v4 _executeBlocksForSignpost:a3];
}

+ (id)_presentationProviderForDevice
{
  id v2 = (objc_class *)objc_opt_class();
  id v3 = [MEMORY[0x1E4F5ACD8] standardDefaults];
  uint64_t v4 = [v3 presentationGesture];

  if (v4 == 1) {
    id v2 = (objc_class *)objc_opt_class();
  }
  id v5 = objc_alloc_init(v2);

  return v5;
}

- (CCUIMainViewController)initWithSystemAgent:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _presentationProviderForDevice];
  id v6 = [(CCUIMainViewController *)self _initWithSystemAgent:v4 presentationProvider:v5];

  return v6;
}

- (id)_initWithSystemAgent:(id)a3 presentationProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v40.receiver = self;
  v40.super_class = (Class)CCUIMainViewController;
  uint64_t v8 = [(CCUIMainViewController *)&v40 initWithNibName:0 bundle:0];
  if (v8)
  {
    uint64_t v9 = [[CCUIModuleInstanceManager alloc] initWithSystemAgent:v6];
    [(CCUIMainViewController *)v8 setModuleInstanceManager:v9];
    [(CCUIModuleInstanceManager *)v9 setContextDelegate:v8];
    [(CCUIModuleInstanceManager *)v9 addObserver:v8];
    uint64_t v10 = objc_alloc_init(CCUIModuleSettingsManager);
    [(CCUIMainViewController *)v8 setModuleSettingsManager:v10];
    long long v11 = objc_alloc_init(CCUIStatusLabelViewController);
    statusLabelViewController = v8->_statusLabelViewController;
    v8->_statusLabelViewController = v11;

    [(CCUIMainViewController *)v8 setDefinesPresentationContext:1];
    objc_storeStrong((id *)&v8->_presentationProvider, a4);
    [(CCUIOverlayPresentationProvider *)v8->_presentationProvider setViewProvider:v8];
    [(CCUIOverlayPresentationProvider *)v8->_presentationProvider setMetricsProvider:v8];
    uint64_t v13 = +[CCUIAnimationRunner runner];
    primaryAnimationRunner = v8->_primaryAnimationRunner;
    v8->_primaryAnimationRunner = (CCUIAnimationRunner *)v13;

    uint64_t v15 = +[CCUIAnimationRunner runner];
    secondaryAnimationRunner = v8->_secondaryAnimationRunner;
    v8->_secondaryAnimationRunner = (CCUIAnimationRunner *)v15;

    uint64_t v17 = +[CCUIAnimationRunner runner];
    editingAnimationRunner = v8->_editingAnimationRunner;
    v8->_editingAnimationRunner = (CCUIAnimationRunner *)v17;

    uint64_t v19 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    blockingGestureRecognizers = v8->_blockingGestureRecognizers;
    v8->_blockingGestureRecognizers = (NSHashTable *)v19;

    long long v21 = [(CCUIMainViewController *)v8 statusLabelViewController];
    [v21 setDelegate:v8];

    uint64_t v22 = [MEMORY[0x1E4F5ACE0] sharedService];
    controlCenterOperationService = v8->_controlCenterOperationService;
    v8->_controlCenterOperationService = (CCSControlCenterOperationService *)v22;

    [(CCSControlCenterOperationService *)v8->_controlCenterOperationService setDelegate:v8];
    uint64_t v24 = (void *)MEMORY[0x1E4F62940];
    id v25 = [MEMORY[0x1E4F62958] configurationForDefaultMainDisplayMonitor];
    uint64_t v26 = [v24 monitorWithConfiguration:v25];
    layoutMonitor = v8->_layoutMonitor;
    v8->_layoutMonitor = (FBSDisplayLayoutMonitor *)v26;

    uint64_t v28 = objc_alloc_init(CCUISensorActivityDataProvider);
    sensorActivityDataProvider = v8->_sensorActivityDataProvider;
    v8->_sensorActivityDataProvider = v28;

    uint64_t v30 = [[_TtC15ControlCenterUI32CCUIGameModeActivityDataProvider alloc] initWithDelegate:v8];
    gameModeActivityDataProvider = v8->_gameModeActivityDataProvider;
    v8->_gameModeActivityDataProvider = v30;

    v8->_showingRootView = 1;
    if (_os_feature_enabled_impl())
    {
      uint64_t v32 = SFCreateAskToAirDropReceiverController();
      askToAirDropController = v8->_askToAirDropController;
      v8->_askToAirDropController = (SFAskToAirDropReceiverControllerProtocol *)v32;

      objc_initWeak(&location, v8);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __68__CCUIMainViewController__initWithSystemAgent_presentationProvider___block_invoke;
      v37[3] = &unk_1E6A89FA8;
      objc_copyWeak(&v38, &location);
      [(SFAskToAirDropReceiverControllerProtocol *)v8->_askToAirDropController setPendingOrActiveConnectionsChangedHandler:v37];
      objc_destroyWeak(&v38);
      objc_destroyWeak(&location);
    }
    objc_storeWeak((id *)&v8->_systemAgent, v6);
    id v34 = objc_alloc_init(CCUIAnalyticsEventsController);
    analyticsEventsController = v8->_analyticsEventsController;
    v8->_analyticsEventsController = v34;
  }
  return v8;
}

void __68__CCUIMainViewController__initWithSystemAgent_presentationProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _askToAirDropPendingOrActiveConnectionsDidChange];
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CCUIMainViewController;
  [(CCUIMainViewController *)&v3 dealloc];
}

- (id)_safeStatusLabelViewContainerView
{
  id v4 = [(CCUIMainViewController *)self _statusLabelViewContainerView];
  if (!v4)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CCUIMainViewController.m" lineNumber:221 description:@"The status label view's container view should have been created"];
  }

  return v4;
}

- (void)_becomeActive
{
  if (!self->_active)
  {
    objc_super v3 = [(CCUIMainViewController *)self pagingViewController];
    [v3 willBecomeActive];
  }
  self->_active = 1;

  [(CCUIMainViewController *)self _setupPanGestureFailureRequirements];
}

- (id)_statusLabelViewContainerView
{
  headerPocketView = self->_headerPocketView;
  if (!headerPocketView) {
    headerPocketView = (CCUIHeaderPocketView *)self->_containerView;
  }
  return headerPocketView;
}

- (id)_pagingViewContainerView
{
  return self->_containerView;
}

- (id)_safePagingViewContainerView
{
  id v4 = [(CCUIMainViewController *)self _pagingViewContainerView];
  if (!v4)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"CCUIMainViewController.m" lineNumber:245 description:@"The paging view's container view should have been created"];
  }

  return v4;
}

- (unint64_t)moduleRowCount
{
  return [(CCUIPagingViewController *)self->_pagingViewController moduleRowCount];
}

- (void)setPresentationState:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_presentationState != a3)
  {
    id v5 = (void *)*MEMORY[0x1E4F5AD98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t presentationState = self->_presentationState;
      if (presentationState > 3) {
        id v7 = @"<invalid>";
      }
      else {
        id v7 = off_1E6A8A228[presentationState];
      }
      if (a3 > 3) {
        uint64_t v8 = @"<invalid>";
      }
      else {
        uint64_t v8 = off_1E6A8A228[a3];
      }
      *(_DWORD *)long long v11 = 138543618;
      *(void *)&void v11[4] = v7;
      *(_WORD *)&v11[12] = 2114;
      *(void *)&v11[14] = v8;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1D7B17000, v9, OS_LOG_TYPE_DEFAULT, "Transitioning presentation state: fromState=%{public}@, toState=%{public}@", v11, 0x16u);
    }
    self->_unint64_t presentationState = a3;
    uint64_t v10 = [(CCUIMainViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v10 controlCenterViewController:self didChangePresentationState:self->_presentationState];
    }
  }
}

- (void)setTransitionState:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_transitionState != a3)
  {
    id v5 = (void *)*MEMORY[0x1E4F5AD98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
    {
      unint64_t transitionState = self->_transitionState;
      if (transitionState > 2) {
        id v7 = @"<invalid>";
      }
      else {
        id v7 = off_1E6A8A210[transitionState];
      }
      if (a3 > 2) {
        uint64_t v8 = @"<invalid>";
      }
      else {
        uint64_t v8 = off_1E6A8A210[a3];
      }
      int v10 = 138543618;
      long long v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1D7B17000, v9, OS_LOG_TYPE_DEFAULT, "Transitioning transition state: fromState=%{public}@, toState=%{public}@", (uint8_t *)&v10, 0x16u);
    }
    self->_unint64_t transitionState = a3;
  }
}

- (void)setReachabilityActive:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_reachabilityActive != a3)
  {
    BOOL v3 = a3;
    id v5 = *MEMORY[0x1E4F5AD98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
    {
      BOOL reachabilityActive = self->_reachabilityActive;
      *(_DWORD *)buf = 67109376;
      BOOL v12 = reachabilityActive;
      __int16 v13 = 1024;
      BOOL v14 = v3;
      _os_log_impl(&dword_1D7B17000, v5, OS_LOG_TYPE_DEFAULT, "Toggling reachability active: from=%{BOOL}d, to=%{BOOL}d", buf, 0xEu);
    }
    self->_BOOL reachabilityActive = v3;
    id v7 = [(CCUIMainViewController *)self _scrollView];
    [v7 setScrollEnabled:!v3];

    uint64_t v8 = [(CCUIMainViewController *)self delegate];
    uint64_t v9 = [v8 reachabilitySpringAnimationBehaviorForControlCenterViewController:self];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __48__CCUIMainViewController_setReachabilityActive___block_invoke;
    v10[3] = &unk_1E6A898F8;
    void v10[4] = self;
    [MEMORY[0x1E4FB1EB0] _animateUsingSpringBehavior:v9 tracking:0 animations:v10 completion:0];
  }
}

uint64_t __48__CCUIMainViewController_setReachabilityActive___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];

  BOOL v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];

  id v4 = *(void **)(a1 + 32);

  return [v4 _updateHotPocket:0 animated:0];
}

- (BOOL)isHomeGestureDismissalAllowed
{
  return 1;
}

- (void)reachabilityAnimationDidEnd
{
  if (!self->_reachabilityActive)
  {
    unint64_t v3 = [(CCUIMainViewController *)self presentationState];
    if ([(CCUIMainViewController *)self transitionState] != 1 && v3 - 1 <= 1)
    {
      [(CCUIMainViewController *)self _replaceBackgroundViewContentsWithSnapshotIfNecessary:1];
    }
  }
}

- (void)setCurrentTransitionUUID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = *MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    currentTransitionUUID = self->_currentTransitionUUID;
    int v9 = 138543618;
    int v10 = currentTransitionUUID;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl(&dword_1D7B17000, v5, OS_LOG_TYPE_DEFAULT, "Changed transition UUID: from=%{public}@, to=%{public}@", (uint8_t *)&v9, 0x16u);
  }
  id v7 = (NSUUID *)[v4 copy];
  uint64_t v8 = self->_currentTransitionUUID;
  self->_currentTransitionUUID = v7;
}

- (void)willOpenExpandedSensorAttributionViewController
{
  id v3 = [(CCUIMainViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 willOpenExpandedModuleForControlCenterViewController:self];
  }
}

- (void)didCloseExpandedSensorAttributionViewController
{
  id v3 = [(CCUIMainViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 didCloseExpandedModuleForControlCenterViewController:self];
  }
}

- (void)didTriggerEditButtonPrimaryAction
{
}

- (void)didTriggerPowerButtonPrimaryAction
{
  id v3 = [(CCUIMainViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 didRequestPowerDownTransientOverlayForControlCenterViewController:self];
  }
}

- (BOOL)isSensorAttributionViewControllerExpanded
{
  return [(CCUIHeaderPocketView *)self->_headerPocketView isSensorAttributionViewControllerExpanded];
}

- (BOOL)canDismissPresentedContent
{
  id v3 = [(CCUIMainViewController *)self pagingViewController];
  BOOL v4 = ([v3 canDismissPresentedContent] & 1) != 0
    || [(CCUIMainViewController *)self isSensorAttributionViewControllerExpanded];

  return v4;
}

- (void)expandModuleWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIMainViewController *)self pagingViewController];
  [v5 expandModuleWithIdentifier:v4];
}

- (void)dismissPresentedContent
{
}

- (void)dismissPresentedContentWithCompletionHandler:(id)a3
{
}

- (void)dismissExpandedModuleAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if ([(CCUIMainViewController *)self isSensorAttributionViewControllerExpanded])
  {
    [(CCUIHeaderPocketView *)self->_headerPocketView dismissSensorAttributionExpandedView:v4 completion:v7];
  }
  else
  {
    id v6 = [(CCUIMainViewController *)self pagingViewController];
    [v6 dismissExpandedModuleAnimated:v4 completion:v7];
  }
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if ([(CCUIMainViewController *)self isSensorAttributionViewControllerExpanded])
  {
    [(CCUIHeaderPocketView *)self->_headerPocketView dismissSensorAttributionExpandedView:v4 completion:v7];
  }
  else
  {
    id v6 = [(CCUIMainViewController *)self pagingViewController];
    [v6 dismissPresentedContentAnimated:v4 completion:v7];
  }
}

- (void)displayWillTurnOff
{
  if ([(CCUIMainViewController *)self _appearState] == 2)
  {
    id v3 = [(CCUIMainViewController *)self pagingViewController];
    [v3 displayWillTurnOff];
  }
}

- (void)presentAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(void))a4;
  unint64_t v7 = [(CCUIMainViewController *)self presentationState];
  uint64_t v8 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 3) {
      int v9 = @"<invalid>";
    }
    else {
      int v9 = off_1E6A8A228[v7];
    }
    *(_DWORD *)buf = 67109378;
    BOOL v19 = v4;
    __int16 v20 = 2114;
    long long v21 = v9;
    int v10 = v8;
    _os_log_impl(&dword_1D7B17000, v10, OS_LOG_TYPE_DEFAULT, "Requested presentation: animated=%{BOOL}d, presentationState=%{public}@", buf, 0x12u);
  }
  if (v7 == 2)
  {
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    __int16 v11 = [(CCUIMainViewController *)self _beginPresentationAnimated:v4 interactive:0];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CCUIMainViewController_presentAnimated_withCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E6A89FF8;
    void aBlock[4] = self;
    id v12 = v11;
    id v16 = v12;
    uint64_t v17 = v6;
    uint64_t v13 = _Block_copy(aBlock);
    BOOL v14 = v13;
    if (v4) {
      (*((void (**)(void *))v13 + 2))(v13);
    }
    else {
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v13];
    }
  }
}

void __64__CCUIMainViewController_presentAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = +[CCUIOverlayTransitionState fullyPresentedState];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__CCUIMainViewController_presentAnimated_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E6A89FD0;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  id v9 = *(id *)(a1 + 48);
  [v2 _updatePresentationForTransitionState:v3 withCompletionHander:v6];
}

uint64_t __64__CCUIMainViewController_presentAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, int a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = *MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 1024;
    int v14 = a3;
    _os_log_impl(&dword_1D7B17000, v6, OS_LOG_TYPE_DEFAULT, "Presentation complete: presentationUUID=%{public}@, finished=%{BOOL}d, retargeted=%{BOOL}d", (uint8_t *)&v9, 0x18u);
  }
  [*(id *)(a1 + 40) _endPresentationWithUUID:*(void *)(a1 + 32)];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_beginPresentationAnimated:(BOOL)a3 interactive:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v28 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = (NSObject **)MEMORY[0x1E4F5AD98];
  uint64_t v7 = *MEMORY[0x1E4F5AD98];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F5AD98]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7B17000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CCUI_CONTROL_CENTER_PRESENTATION_BEGIN", " enableTelemetry=YES ", buf, 2u);
  }
  kdebug_trace();
  if (gSignpostListener) {
    [(id)gSignpostListener didReceiveSignpost:1];
  }
  unint64_t v8 = [(CCUIMainViewController *)self presentationState];
  if (v4) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  unint64_t v10 = [(CCUIMainViewController *)self transitionState];
  __int16 v11 = *v6;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v8 > 3) {
      int v12 = @"<invalid>";
    }
    else {
      int v12 = off_1E6A8A228[v8];
    }
    __int16 v13 = @"animating";
    if (v4) {
      __int16 v13 = @"interactive";
    }
    int v14 = v13;
    *(_DWORD *)buf = 67110402;
    BOOL v33 = v28;
    __int16 v34 = 1024;
    BOOL v35 = v4;
    __int16 v36 = 2114;
    v37 = v12;
    __int16 v38 = 2114;
    id v39 = v14;
    __int16 v40 = 1024;
    BOOL v41 = v8 != 1;
    __int16 v42 = 1024;
    BOOL v43 = v10 != v9;
    uint64_t v15 = v11;
    _os_log_impl(&dword_1D7B17000, v15, OS_LOG_TYPE_DEFAULT, "Begin presentation: animated=%{BOOL}d, interactive=%{BOOL}d, currentState=%{public}@, transitionState=%{public}@, presentationStateWillChange=%{BOOL}d, transitionStateWillChange=%{BOOL}d", buf, 0x2Eu);
  }
  if (v8 != 1 || v10 != v9)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v16 = [(CCUIOverlayPresentationProvider *)self->_presentationProvider headerMode];
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = [MEMORY[0x1E4F29128] UUID];
    [(CCUIMainViewController *)self setCurrentTransitionUUID:v17];

    [(CCUIMainViewController *)self setTransitionState:v9];
    [(CCUIMainViewController *)self _updateAskToAirDropModuleVisibility];
    if ((v16 & 0xFFFFFFFFFFFFFFFELL) != 2 || v8)
    {
      [(CCUIMainViewController *)self setPresentationState:1];
      if (v8)
      {
        if (v8 != 3)
        {
LABEL_28:
          if (v8 != 1)
          {
            if (objc_opt_respondsToSelector())
            {
              uint64_t v23 = [(CCUIOverlayPresentationProvider *)self->_presentationProvider prepareForPresentation];
              uint64_t v24 = v23;
              if (v28)
              {
                [(CCUIAnimationRunner *)self->_primaryAnimationRunner runAnimationBatch:v23 withCompletionBlock:0];
              }
              else
              {
                id v25 = (void *)MEMORY[0x1E4FB1EB0];
                v29[0] = MEMORY[0x1E4F143A8];
                v29[1] = 3221225472;
                v29[2] = __65__CCUIMainViewController__beginPresentationAnimated_interactive___block_invoke_3;
                v29[3] = &unk_1E6A89968;
                v29[4] = self;
                id v30 = v23;
                [v25 performWithoutAnimation:v29];
              }
            }
            [(UIViewController *)self ccui_safelyBeginAppearanceTransitionForChildViewControllers:1 animated:v28];
          }
          goto LABEL_35;
        }
LABEL_27:
        [(MTMaterialView *)self->_backgroundView bs_setHitTestingDisabled:0];
        goto LABEL_28;
      }
    }
    else
    {
      long long v18 = [(CCUIMainViewController *)self hostStatusBarStyleProvider];
      BOOL v19 = [v18 hostStatusBarStyle];
      __int16 v20 = (CCUIStatusBarStyleSnapshot *)[v19 copy];
      hostStatusBarStyleSnapshot = self->_hostStatusBarStyleSnapshot;
      self->_hostStatusBarStyleSnapshot = v20;

      [(CCUIMainViewController *)self setPresentationState:1];
    }
    [(CCUIMainViewController *)self _becomeActive];
    uint64_t v22 = [(CCUIMainViewController *)self view];
    [v22 setHidden:0];

    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __65__CCUIMainViewController__beginPresentationAnimated_interactive___block_invoke;
    v31[3] = &unk_1E6A8A048;
    v31[4] = self;
    v31[5] = v16;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v31];
    goto LABEL_27;
  }
LABEL_35:
  uint64_t v26 = [(CCUIMainViewController *)self currentTransitionUUID];

  return v26;
}

void __65__CCUIMainViewController__beginPresentationAnimated_interactive___block_invoke(uint64_t a1)
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) overlayHeaderView];
  objc_msgSend(v2, "setMode:orientationHint:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_interfaceOrientation"));

  if ((unint64_t)([*(id *)(a1 + 32) _interfaceOrientation] - 1) >= 2)
  {
    BOOL v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    BOOL v3 = (v5 & 0xFFFFFFFFFFFFFFFBLL) != 1;
  }
  else
  {
    BOOL v3 = 0;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6 == 2)
  {
    if (([*(id *)(*(void *)(a1 + 32) + 1136) isHidden] | v3) != 1)
    {
      id v8 = objc_alloc(+[CCUIStatusBar statusBarClass]);
      uint64_t v9 = objc_msgSend(v8, "initWithFrame:showForegroundView:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      uint64_t v10 = *(void *)(a1 + 32);
      __int16 v11 = *(void **)(v10 + 1040);
      *(void *)(v10 + 1040) = v9;

      int v12 = [*(id *)(a1 + 32) view];
      [v12 insertSubview:*(void *)(*(void *)(a1 + 32) + 1040) atIndex:0];

      __int16 v13 = *(void **)(*(void *)(a1 + 32) + 1040);
      v35[0] = *MEMORY[0x1E4FB32E0];
      int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
      [v13 setEnabledPartIdentifiers:v14];

      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void **)(v15 + 1040);
      uint64_t v17 = [*(id *)(v15 + 1136) leadingStyleRequest];
      [v16 setStyleRequest:v17];

      uint64_t v18 = *(void *)(a1 + 32);
      BOOL v19 = *(void **)(v18 + 1040);
      [*(id *)(v18 + 1136) avoidanceFrame];
      objc_msgSend(v19, "setAvoidanceFrame:");
      uint64_t v20 = [*(id *)(*(void *)(a1 + 32) + 1136) hiddenPartIdentifier];
      uint64_t v7 = (void *)v20;
      if (v20)
      {
        long long v21 = *(void **)(*(void *)(a1 + 32) + 1040);
        uint64_t v34 = v20;
        uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
        [v21 setDisabledPartIdentifiers:v22];
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v23 = [*(id *)(*(void *)(a1 + 32) + 1040) statusBar];
        uint64_t v24 = [*(id *)(*(void *)(a1 + 32) + 1136) overlayData];
        [v23 setOverlayData:v24];

        id v25 = [*(id *)(*(void *)(a1 + 32) + 1136) actionsByPartIdentifier];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __65__CCUIMainViewController__beginPresentationAnimated_interactive___block_invoke_2;
        v33[3] = &unk_1E6A8A020;
        v33[4] = *(void *)(a1 + 32);
        [v25 enumerateKeysAndObjectsUsingBlock:v33];
      }
      uint64_t v26 = [*(id *)(*(void *)(a1 + 32) + 1016) statusBar];
      [v26 prepareForPresentation];

      goto LABEL_14;
    }
    uint64_t v6 = *(void *)(a1 + 40);
  }
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 1016) statusBar];
    [v7 prepareForPresentation];
LABEL_14:
  }
  id v27 = [*(id *)(a1 + 32) view];
  [v27 setNeedsLayout];

  BOOL v28 = [*(id *)(a1 + 32) view];
  [v28 layoutIfNeeded];

  uint64_t v29 = *(void *)(a1 + 32);
  id v30 = *(void **)(v29 + 1128);
  *(void *)(v29 + 1128) = 0;

  id v31 = *(void **)(a1 + 32);
  uint64_t v32 = +[CCUIOverlayTransitionState fullyDismissedState];
  [v31 _updatePresentationForTransitionState:v32 withCompletionHander:0];
}

uint64_t __65__CCUIMainViewController__beginPresentationAnimated_interactive___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 1040) setAction:a3 forPartWithIdentifier:a2];
}

uint64_t __65__CCUIMainViewController__beginPresentationAnimated_interactive___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 984) runAnimationBatch:*(void *)(a1 + 40) withCompletionBlock:0];
}

- (void)_replaceBackgroundViewContentsWithSnapshotIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  int v6 = [(MTMaterialView *)self->_backgroundView isContentReplacedWithSnapshot];
  if (v3 && IsReduceTransparencyEnabled && (v6 & 1) == 0 && !self->_reachabilityActive)
  {
    [(MTMaterialView *)self->_backgroundView setContentReplacedWithSnapshot:1];
    id v11 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    id v8 = [v11 layer];
    uint64_t v9 = [(MTMaterialView *)self->_backgroundView layer];
    uint64_t v10 = [v9 contents];
    [v8 setContents:v10];

    [(CCUIHeaderPocketView *)self->_headerPocketView setCustomBackgroundView:v11];
  }
  else if (!v3 && ((v6 ^ 1) & 1) == 0)
  {
    [(MTMaterialView *)self->_backgroundView setContentReplacedWithSnapshot:0];
    headerPocketView = self->_headerPocketView;
    [(CCUIHeaderPocketView *)headerPocketView setCustomBackgroundView:0];
  }
}

- (void)_endPresentationWithUUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CCUIMainViewController *)self currentTransitionUUID];
  unint64_t v6 = [(CCUIMainViewController *)self presentationState];
  uint64_t v7 = (os_log_t *)MEMORY[0x1E4F5AD98];
  if (v4 && [v5 isEqual:v4])
  {
    os_log_t v8 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v6 > 3) {
        uint64_t v9 = @"<invalid>";
      }
      else {
        uint64_t v9 = off_1E6A8A228[v6];
      }
      *(_DWORD *)uint64_t v15 = 138543874;
      *(void *)&v15[4] = v4;
      *(_WORD *)&v15[12] = 2114;
      *(void *)&v15[14] = v5;
      *(_WORD *)&v15[22] = 2114;
      uint64_t v16 = v9;
      __int16 v13 = v8;
      _os_log_impl(&dword_1D7B17000, v13, OS_LOG_TYPE_DEFAULT, "End presentation: UUID=%{public}@ currentTransitionUUID=%{public}@, currentPresentationState=%{public}@", v15, 0x20u);
    }
    -[CCUIMainViewController setCurrentTransitionUUID:](self, "setCurrentTransitionUUID:", 0, *(_OWORD *)v15, *(void *)&v15[16], v16);
    [(CCUIMainViewController *)self setTransitionState:0];
    [(CCUIMainViewController *)self setPresentationState:2];
    if (v6 != 2)
    {
      [(UIViewController *)self ccui_safelyEndAppearanceTransitionForChildViewControllers];
      [(CCUIMainViewController *)self _replaceBackgroundViewContentsWithSnapshotIfNecessary:1];
    }
  }
  else
  {
    os_log_t v10 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v6 > 3) {
        id v11 = @"<invalid>";
      }
      else {
        id v11 = off_1E6A8A228[v6];
      }
      *(_DWORD *)uint64_t v15 = 138543874;
      *(void *)&v15[4] = v4;
      *(_WORD *)&v15[12] = 2114;
      *(void *)&v15[14] = v5;
      *(_WORD *)&v15[22] = 2114;
      uint64_t v16 = v11;
      int v12 = v10;
      _os_log_impl(&dword_1D7B17000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring end presentation as UUID is stale: UUID=%{public}@ currentTransitionUUID=%{public}@, currentPresentationState=%{public}@", v15, 0x20u);
    }
  }
  int v14 = *v7;
  if (os_signpost_enabled(*v7))
  {
    *(_WORD *)uint64_t v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7B17000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CCUI_CONTROL_CENTER_PRESENTATION_END", " enableTelemetry=YES ", v15, 2u);
  }
  kdebug_trace();
  if (gSignpostListener) {
    [(id)gSignpostListener didReceiveSignpost:2];
  }
}

- (void)dismissAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (void (**)(void))a4;
  unint64_t v7 = [(CCUIMainViewController *)self presentationState];
  os_log_t v8 = (void *)*MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    if (v7 > 3) {
      uint64_t v9 = @"<invalid>";
    }
    else {
      uint64_t v9 = off_1E6A8A228[v7];
    }
    *(_DWORD *)buf = 67109378;
    BOOL v18 = v4;
    __int16 v19 = 2114;
    uint64_t v20 = v9;
    os_log_t v10 = v8;
    _os_log_impl(&dword_1D7B17000, v10, OS_LOG_TYPE_DEFAULT, "Requested dismissal: animated=%{BOOL}d, presentationState=%{public}@", buf, 0x12u);
  }
  if (v7)
  {
    [(CCUIMainViewController *)self _cancelDismissalPanGestures];
    [(CCUIMainViewController *)self setEditing:0];
    id v11 = [(CCUIMainViewController *)self _beginDismissalAnimated:v4 interactive:0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke;
    v13[3] = &unk_1E6A8A098;
    v13[4] = self;
    id v14 = v11;
    BOOL v16 = v4;
    uint64_t v15 = v6;
    id v12 = v11;
    [(CCUIMainViewController *)self dismissExpandedModuleAnimated:v4 completion:v13];
  }
  else if (v6)
  {
    v6[2](v6);
  }
}

void __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7B17000, v2, OS_LOG_TYPE_DEFAULT, "Modules dismissed", buf, 2u);
  }
  BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v3 _deactivateReachability];

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1008), "bs_setHitTestingDisabled:", 1);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke_63;
  os_log_t v10 = &unk_1E6A8A098;
  BOOL v4 = *(void **)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = v4;
  char v14 = *(unsigned char *)(a1 + 56);
  id v13 = *(id *)(a1 + 48);
  uint64_t v5 = _Block_copy(&v7);
  unint64_t v6 = v5;
  if (*(unsigned char *)(a1 + 56)) {
    (*((void (**)(void *))v5 + 2))(v5);
  }
  else {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "performWithoutAnimation:", v5, v7, v8, v9, v10, v11, v12);
  }
}

void __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke_63(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = +[CCUIOverlayTransitionState fullyDismissedState];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E6A8A070;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  char v10 = *(unsigned char *)(a1 + 56);
  id v9 = *(id *)(a1 + 48);
  [v2 _updatePresentationForTransitionState:v3 withCompletionHander:v6];
}

void __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke_2(uint64_t a1, int a2, int a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = *MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543874;
    uint64_t v22 = v7;
    __int16 v23 = 1024;
    int v24 = a2;
    __int16 v25 = 1024;
    int v26 = a3;
    _os_log_impl(&dword_1D7B17000, v6, OS_LOG_TYPE_DEFAULT, "Dismissal complete: dismissalUUID=%{public}@, finished=%{BOOL}d, retargeted=%{BOOL}d", buf, 0x18u);
  }
  if (*(void *)(a1 + 32)
    && ([*(id *)(a1 + 40) currentTransitionUUID],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 isEqual:*(void *)(a1 + 32)],
        v8,
        v9)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    char v10 = [*(id *)(*(void *)(a1 + 40) + 976) cleanupForDismissal];
    uint64_t v11 = *(void **)(*(void *)(a1 + 40) + 984);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke_66;
    v16[3] = &unk_1E6A8A070;
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    char v14 = *(void **)(a1 + 48);
    id v17 = v12;
    uint64_t v18 = v13;
    char v20 = *(unsigned char *)(a1 + 56);
    id v19 = v14;
    [v11 additivelyRunAnimationBatch:v10 withCompletionBlock:v16];
  }
  else
  {
    [*(id *)(a1 + 40) _endDismissalWithUUID:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v15 = *(void *)(a1 + 48);
    if (v15) {
      (*(void (**)(void))(v15 + 16))();
    }
  }
}

uint64_t __64__CCUIMainViewController_dismissAnimated_withCompletionHandler___block_invoke_66(uint64_t a1, int a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = *MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    int v12 = a2;
    __int16 v13 = 1024;
    int v14 = a3;
    _os_log_impl(&dword_1D7B17000, v6, OS_LOG_TYPE_DEFAULT, "Dismissal cleanup complete: dismissalUUID=%{public}@, finished=%{BOOL}d, retargeted=%{BOOL}d", (uint8_t *)&v9, 0x18u);
  }
  [*(id *)(a1 + 40) _endDismissalWithUUID:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_beginDismissalAnimated:(BOOL)a3 interactive:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v25 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (NSObject **)MEMORY[0x1E4F5AD98];
  uint64_t v7 = *MEMORY[0x1E4F5AD98];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E4F5AD98]))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7B17000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CCUI_CONTROL_CENTER_DISMISSAL_BEGIN", " enableTelemetry=YES ", buf, 2u);
  }
  kdebug_trace();
  if (gSignpostListener) {
    [(id)gSignpostListener didReceiveSignpost:3];
  }
  unint64_t v8 = [(CCUIMainViewController *)self presentationState];
  if (v4) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  unint64_t v10 = [(CCUIMainViewController *)self transitionState];
  __int16 v11 = *v6;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v8 > 3) {
      int v12 = @"<invalid>";
    }
    else {
      int v12 = off_1E6A8A228[v8];
    }
    __int16 v13 = @"animating";
    if (v4) {
      __int16 v13 = @"interactive";
    }
    int v14 = v13;
    *(_DWORD *)buf = 67110402;
    BOOL v28 = v25;
    __int16 v29 = 1024;
    BOOL v30 = v4;
    __int16 v31 = 2114;
    uint64_t v32 = v12;
    __int16 v33 = 2114;
    uint64_t v34 = v14;
    __int16 v35 = 1024;
    BOOL v36 = v8 != 3;
    __int16 v37 = 1024;
    BOOL v38 = v10 != v9;
    uint64_t v15 = v11;
    _os_log_impl(&dword_1D7B17000, v15, OS_LOG_TYPE_DEFAULT, "Begin dismissal: animated=%{BOOL}d, interactive=%{BOOL}d, currentState=%{public}@, transitionState=%{public}@, presentationStateWillChange=%{BOOL}d, transitionStateWillChange=%{BOOL}d", buf, 0x2Eu);
  }
  if (v8 != 3 || v10 != v9)
  {
    if (objc_opt_respondsToSelector())
    {
      unint64_t v16 = [(CCUIOverlayPresentationProvider *)self->_presentationProvider headerMode] & 0xFFFFFFFFFFFFFFFELL;
      id v17 = [MEMORY[0x1E4F29128] UUID];
      [(CCUIMainViewController *)self setCurrentTransitionUUID:v17];

      [(CCUIMainViewController *)self setTransitionState:v9];
      if (v16 == 2)
      {
        uint64_t v18 = [(CCUIMainViewController *)self hostStatusBarStyleProvider];
        id v19 = [v18 hostStatusBarStyle];
        char v20 = (CCUIStatusBarStyleSnapshot *)[v19 copy];
        hostStatusBarStyleSnapshot = self->_hostStatusBarStyleSnapshot;
        self->_hostStatusBarStyleSnapshot = v20;

        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __62__CCUIMainViewController__beginDismissalAnimated_interactive___block_invoke;
        v26[3] = &unk_1E6A898F8;
        v26[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v26];
      }
    }
    else
    {
      uint64_t v22 = [MEMORY[0x1E4F29128] UUID];
      [(CCUIMainViewController *)self setCurrentTransitionUUID:v22];

      [(CCUIMainViewController *)self setTransitionState:v9];
    }
    [(CCUIMainViewController *)self setPresentationState:3];
    if (v8 != 3)
    {
      [(UIViewController *)self ccui_safelyBeginAppearanceTransitionForChildViewControllers:0 animated:v25];
      [(CCUIMainViewController *)self _replaceBackgroundViewContentsWithSnapshotIfNecessary:0];
    }
  }
  __int16 v23 = [(CCUIMainViewController *)self currentTransitionUUID];

  return v23;
}

void __62__CCUIMainViewController__beginDismissalAnimated_interactive___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 1040);
  id v3 = [*(id *)(v1 + 1136) leadingStyleRequest];
  [v2 setStyleRequest:v3];
}

- (void)_endDismissalWithUUID:(id)a3 animated:(BOOL)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [(CCUIMainViewController *)self currentTransitionUUID];
  unint64_t v7 = [(CCUIMainViewController *)self presentationState];
  unint64_t v8 = (os_log_t *)MEMORY[0x1E4F5AD98];
  if (v5 && [v6 isEqual:v5])
  {
    os_log_t v9 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 > 3) {
        unint64_t v10 = @"<invalid>";
      }
      else {
        unint64_t v10 = off_1E6A8A228[v7];
      }
      *(_DWORD *)id v19 = 138543874;
      *(void *)&void v19[4] = v5;
      *(_WORD *)&v19[12] = 2114;
      *(void *)&v19[14] = v6;
      *(_WORD *)&v19[22] = 2114;
      char v20 = v10;
      int v14 = v9;
      _os_log_impl(&dword_1D7B17000, v14, OS_LOG_TYPE_DEFAULT, "End dismissal: UUID=%{public}@ currentTransitionUUID=%{public}@, currentPresentationState=%{public}@", v19, 0x20u);
    }
    -[CCUIMainViewController setCurrentTransitionUUID:](self, "setCurrentTransitionUUID:", 0, *(_OWORD *)v19, *(void *)&v19[16], v20);
    uint64_t v15 = [(CCUIMainViewController *)self overlayHeaderView];
    [v15 setMode:0 orientationHint:0];

    [(UIStatusBar *)self->_compactLeadingStatusBar removeFromSuperview];
    compactLeadingStatusBar = self->_compactLeadingStatusBar;
    self->_compactLeadingStatusBar = 0;

    [(CCUIMainViewController *)self _resignActive];
    id v17 = [(CCUIMainViewController *)self view];
    [v17 setHidden:1];

    [(CCUIMainViewController *)self setTransitionState:0];
    [(CCUIMainViewController *)self setPresentationState:0];
    [(MTMaterialView *)self->_backgroundView bs_setHitTestingDisabled:1];
    if (v7) {
      [(UIViewController *)self ccui_safelyEndAppearanceTransitionForChildViewControllers];
    }
    __int16 v13 = [(CCUIMainViewController *)self pagingViewController];
    [v13 scrollToDefaultPageAnimated:0 completion:0];
  }
  else
  {
    os_log_t v11 = *v8;
    if (!os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    if (v7 > 3) {
      int v12 = @"<invalid>";
    }
    else {
      int v12 = off_1E6A8A228[v7];
    }
    *(_DWORD *)id v19 = 138543874;
    *(void *)&void v19[4] = v5;
    *(_WORD *)&v19[12] = 2114;
    *(void *)&v19[14] = v6;
    *(_WORD *)&v19[22] = 2114;
    char v20 = v12;
    __int16 v13 = v11;
    _os_log_impl(&dword_1D7B17000, v13, OS_LOG_TYPE_DEFAULT, "Ignoring end dismissal as UUID is stale: UUID=%{public}@ currentTransitionUUID=%{public}@, currentPresentationState=%{public}@", v19, 0x20u);
  }

LABEL_17:
  uint64_t v18 = *v8;
  if (os_signpost_enabled(*v8))
  {
    *(_WORD *)id v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7B17000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CCUI_CONTROL_CENTER_DISMISSAL_END", " enableTelemetry=YES ", v19, 2u);
  }
  kdebug_trace();
  if (gSignpostListener) {
    [(id)gSignpostListener didReceiveSignpost:4];
  }
}

- (void)_updatePresentationForTransitionType:(unint64_t)a3 translation:(CGPoint)a4 interactive:(BOOL)a5
{
  -[CCUIOverlayPresentationProvider transitionStateForType:interactive:translation:](self->_presentationProvider, "transitionStateForType:interactive:translation:", a3, a5, a4.x, a4.y);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(CCUIMainViewController *)self _updatePresentationForTransitionState:v6 withCompletionHander:0];
}

- (void)_updatePresentationForTransitionState:(id)a3 withCompletionHander:(id)a4
{
  id v15 = a3;
  presentationProvider = self->_presentationProvider;
  previousTransitionState = self->_previousTransitionState;
  id v8 = a4;
  os_log_t v9 = [(CCUIOverlayPresentationProvider *)presentationProvider animationBatchForTransitionState:v15 previousTransitionState:previousTransitionState];
  [(CCUIAnimationRunner *)self->_primaryAnimationRunner additivelyRunAnimationBatch:v9 withCompletionBlock:v8];

  if (objc_opt_respondsToSelector())
  {
    unint64_t v10 = [(CCUIOverlayPresentationProvider *)self->_presentationProvider secondaryAnimationBatchForTransitionState:v15 previousTransitionState:self->_previousTransitionState];
    [(CCUIAnimationRunner *)self->_secondaryAnimationRunner additivelyRunAnimationBatch:v10 withCompletionBlock:0];
  }
  if ([(CCUIOverlayPresentationProvider *)self->_presentationProvider allowHotPocketDuringTransition])
  {
    [(CCUIMainViewController *)self _updateHotPocketAnimated:1];
    [(CCUIMainViewController *)self _updateChevronStateForTransitionState:v15];
  }
  else
  {
    [(CCUIMainViewController *)self _updateHotPocket:0 animated:1];
  }
  BOOL v11 = +[CCUIOverlayTransitionState isSignificantTransitionFrom:self->_previousTransitionState to:v15];
  int v12 = [(CCUIMainViewController *)self delegate];
  if (v11 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v15 presentationProgress];
    objc_msgSend(v12, "controlCenterViewController:significantPresentationProgressChange:", self);
  }
  __int16 v13 = (CCUIOverlayTransitionState *)[v15 copyWithZone:0];
  int v14 = self->_previousTransitionState;
  self->_previousTransitionState = v13;
}

- (void)_setPresentationPanGestureActive:(BOOL)a3
{
  BOOL v3 = a3;
  self->_presentationPanGestureActive = a3;
  id v4 = [(CCUIPagingViewController *)self->_pagingViewController interactivePagingCoordinator];
  [v4 setShouldExtendAreaForPagingContinuation:v3];
}

- (void)_evaluatePresentationContinuationIntoPagingWithLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(CCUIOverlayTransitionState *)self->_previousTransitionState pagingProgress];
  double v7 = v6;
  id v8 = self->_presentationTouchIdentifiers;
  os_log_t v9 = v8;
  if (v7 > 0.0 && [(NSArray *)v8 count])
  {
    [(CCUIOverlayTransitionState *)self->_previousTransitionState presentationProgress];
    double v11 = v10;
    int v12 = [(CCUIPagingViewController *)self->_pagingViewController interactivePagingCoordinator];
    if (v11 > 1.0)
    {
      __int16 v13 = [(CCUIMainViewController *)self view];
      int v14 = objc_msgSend(v12, "canBeginPagingAtLocation:inView:", v13, x, y);

      if (v14)
      {
        [v12 willBeginPagingInteractively:1];
        presentationTouchIdentifiers = self->_presentationTouchIdentifiers;
        self->_presentationTouchIdentifiers = 0;

        unint64_t v16 = [(CCUIMainViewController *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [v16 controlCenterViewControllerWillContinuePresentationIntoPaging:self];
        }
        id v17 = [(CCUIMainViewController *)self overlayPageControl];
        uint64_t v18 = [v17 window];
        [v18 _contextId];

        id v19 = *MEMORY[0x1E4F5AD98];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)char v20 = 0;
          _os_log_impl(&dword_1D7B17000, v19, OS_LOG_TYPE_DEFAULT, "Control Center transferred presentation touches into paging", v20, 2u);
        }
        BKSHIDEventTransferTouchesToDifferentCAContext();
      }
    }
  }
}

- (void)_resignActive
{
  self->_active = 0;
  id v2 = [(CCUIMainViewController *)self pagingViewController];
  [v2 willResignActive];
}

- (BOOL)includesModuleWithIdentifier:(id)a3
{
  return [(CCUIMainViewController *)self _includesModuleWithIdentifier:a3 consideringObscureness:0];
}

- (BOOL)includesVisiblyUnobscuredModuleWithIdentifier:(id)a3
{
  return [(CCUIMainViewController *)self _includesModuleWithIdentifier:a3 consideringObscureness:1];
}

- (BOOL)_includesModuleWithIdentifier:(id)a3 consideringObscureness:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(CCUIMainViewController *)self pagingViewController];
  id v8 = [v7 moduleViewForIdentifier:v6];
  LOBYTE(v9) = v8 != 0;
  if (v8 && v4)
  {
    if ([v7 expandedModuleCount] < 1
      || [v7 isModuleExpandedForIdentifier:v6])
    {
      double v10 = [v8 window];
      if (v10)
      {
        [v8 bounds];
        objc_msgSend(v8, "convertRect:toView:", v10);
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        [v10 bounds];
        v21.origin.double x = v12;
        v21.origin.double y = v14;
        v21.size.CGFloat width = v16;
        v21.size.CGFloat height = v18;
        int v9 = CGRectIntersectsRect(v20, v21) << 31 >> 31;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9 & 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewDidLoad
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  v75.receiver = self;
  v75.super_class = (Class)CCUIMainViewController;
  [(CCUIMainViewController *)&v75 viewDidLoad];
  objc_msgSend(MEMORY[0x1E4F743C8], "materialViewWithRecipe:", objc_msgSend(MEMORY[0x1E4F5AE08], "_controlCenterBackgroundRecipe"));
  BOOL v3 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
  backgroundView = self->_backgroundView;
  self->_backgroundView = v3;

  id v5 = self->_backgroundView;
  id v6 = (objc_class *)objc_opt_class();
  double v7 = NSStringFromClass(v6);
  [(MTMaterialView *)v5 setGroupNameBase:v7];

  [(MTMaterialView *)self->_backgroundView setZoomEnabled:[(CCUIOverlayPresentationProvider *)self->_presentationProvider isZoomEnabled]];
  [(MTMaterialView *)self->_backgroundView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:[(CCUIOverlayPresentationProvider *)self->_presentationProvider backdropViewShouldUseAlphaTransformer]];
  [(MTMaterialView *)self->_backgroundView setIgnoresScreenClip:1];
  if (objc_opt_respondsToSelector())
  {
    id v8 = self->_backgroundView;
    int v9 = [(CCUIOverlayPresentationProvider *)self->_presentationProvider customBackdropScaleAdjustment];
    [(MTMaterialView *)v8 setBackdropScaleAdjustment:v9];
  }
  double v10 = self->_backgroundView;
  double v11 = [(CCUIMainViewController *)self view];
  [v11 bounds];
  -[MTMaterialView setFrame:](v10, "setFrame:");

  CGFloat v12 = [(CCUIMainViewController *)self view];
  [v12 addSubview:self->_backgroundView];

  double v13 = [(CCUIMainViewController *)self view];
  [v13 setHidden:1];

  CGFloat v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  containerView = self->_containerView;
  self->_containerView = v14;

  CGFloat v16 = [(CCUIMainViewController *)self view];
  [v16 addSubview:self->_containerView];

  double v17 = [(CCUIMainViewController *)self view];
  [v17 _setSafeAreaInsetsFrozen:1];

  v67 = [(CCUIMainViewController *)self moduleInstanceManager];
  v66 = [(CCUIMainViewController *)self moduleSettingsManager];
  v65 = objc_alloc_init(CCUIControlIntentStore);
  id v18 = objc_alloc(MEMORY[0x1E4F58E40]);
  id v19 = [MEMORY[0x1E4F58E50] visibleControls];
  CGRect v20 = (void *)[v18 initWithOptions:v19];

  v64 = [[CCUIControlDescriptorProvider alloc] initWithWidgetExtensionProvider:v20];
  CGRect v21 = [[CCUIPagingViewController alloc] initWithModuleInstanceManager:v67 moduleSettingsManager:v66 controlIntentStore:v65 controlDescriptorProvider:v64 controlExtensionProvider:v20];
  pagingViewController = self->_pagingViewController;
  self->_pagingViewController = v21;

  [(CCUIPagingViewController *)self->_pagingViewController setPagingDelegate:self];
  [(CCUIPagingViewController *)self->_pagingViewController setContextDelegate:self];
  __int16 v23 = self->_pagingViewController;
  int v24 = [(CCUIMainViewController *)self _safePagingViewContainerView];
  [(CCUIMainViewController *)self bs_addChildViewController:v23 withSuperview:v24];

  BOOL v25 = [(CCUIPagingViewController *)self->_pagingViewController scrollView];
  [v25 setHostingDelegate:self];
  int v26 = [v25 panGestureRecognizer];
  pagingViewScrollPanGesture = self->_pagingViewScrollPanGesture;
  self->_pagingViewScrollPanGesture = v26;

  objc_initWeak(&location, self);
  CGRect v63 = [(CCUIPagingViewController *)self->_pagingViewController interactivePagingCoordinator];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __37__CCUIMainViewController_viewDidLoad__block_invoke;
  v72[3] = &unk_1E6A8A0C0;
  CGRect v61 = &v73;
  objc_copyWeak(&v73, &location);
  [v63 addPagingDidChangeHandler:v72];
  if (objc_opt_respondsToSelector())
  {
    BOOL v28 = [CCUIHeaderPocketView alloc];
    __int16 v29 = -[CCUIHeaderPocketView initWithFrame:moduleInstanceManager:](v28, "initWithFrame:moduleInstanceManager:", v67, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), &v73);
    headerPocketView = self->_headerPocketView;
    self->_headerPocketView = v29;

    [(CCUIHeaderPocketView *)self->_headerPocketView setStatusBarDelegate:self];
    [(CCUIHeaderPocketView *)self->_headerPocketView setActionsDelegate:self];
    __int16 v31 = [(CCUIMainViewController *)self view];
    [v31 addSubview:self->_headerPocketView];

    [(CCUIHeaderPocketView *)self->_headerPocketView addSensorAttributionViewControllerAsChildOfViewController:self];
    [(CCUIHeaderPocketView *)self->_headerPocketView setHeaderPocketViewDelegate:self];
  }
  uint64_t v32 = [(CCUIMainViewController *)self _safeStatusLabelViewContainerView];
  [(CCUIMainViewController *)self bs_addChildViewController:self->_statusLabelViewController withSuperview:v32];
  __int16 v33 = [(CCUIStatusLabelViewController *)self->_statusLabelViewController view];
  [v33 setUserInteractionEnabled:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v34 = v32;
    __int16 v35 = [(CCUIStatusLabelViewController *)self->_statusLabelViewController view];
    [v34 setStatusLabelView:v35];
  }
  BOOL v36 = [(CCUIMainViewController *)self view];
  [v36 _setIgnoreBackdropViewsWhenHiding:1];

  if (self->_headerPocketView)
  {
    if ([(CCUIOverlayPresentationProvider *)self->_presentationProvider isPanDismissalAvailable])
    {
      __int16 v37 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:self action:sel__handleDismissalPanGestureRecognizer_];
      headerPocketViewDismissalPanGesture = self->_headerPocketViewDismissalPanGesture;
      self->_headerPocketViewDismissalPanGesture = v37;

      [(UIPanGestureRecognizer *)self->_headerPocketViewDismissalPanGesture setMaximumNumberOfTouches:1];
      [(UIPanGestureRecognizer *)self->_headerPocketViewDismissalPanGesture setDelegate:self];
      [(CCUIHeaderPocketView *)self->_headerPocketView addGestureRecognizer:self->_headerPocketViewDismissalPanGesture];
    }
    uint64_t v39 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleDismissalTapGestureRecognizer_];
    headerPocketViewDismissalTapGesture = self->_headerPocketViewDismissalTapGesture;
    self->_headerPocketViewDismissalTapGesture = v39;

    [(UITapGestureRecognizer *)self->_headerPocketViewDismissalTapGesture setDelegate:self];
    [(CCUIHeaderPocketView *)self->_headerPocketView addGestureRecognizer:self->_headerPocketViewDismissalTapGesture];
    [(CCUIMainViewController *)self _updateSensorActivityStatusForHeaderPocketView];
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v41 = [(CCUIOverlayPresentationProvider *)self->_presentationProvider flickGestureBehavior];
    if (v41)
    {
      __int16 v42 = [[CCUIFlickGestureRecognizer alloc] initWithTarget:self action:sel__handleDismissalFlickGestureRecognizer_];
      pagingViewDismissalFlickGesture = self->_pagingViewDismissalFlickGesture;
      self->_pagingViewDismissalFlickGesture = v42;

      [(CCUIFlickGestureRecognizer *)self->_pagingViewDismissalFlickGesture setDelegate:self];
      uint64_t v44 = self->_pagingViewDismissalFlickGesture;
      [v41 dismissalFlickMaximumTime];
      -[CCUIFlickGestureRecognizer setMaximumFlickTime:](v44, "setMaximumFlickTime:");
      uint64_t v45 = self->_pagingViewDismissalFlickGesture;
      [v41 dismissalFlickMinimumVelocity];
      -[CCUIFlickGestureRecognizer setMinimumFlickVelocity:](v45, "setMinimumFlickVelocity:");
      -[CCUIFlickGestureRecognizer setAllowedFlickDirections:](self->_pagingViewDismissalFlickGesture, "setAllowedFlickDirections:", [v41 dismissalFlickAllowedDirections]);
      [v25 addGestureRecognizer:self->_pagingViewDismissalFlickGesture];
    }
  }
  else
  {
    BOOL v41 = 0;
  }
  if ([(CCUIOverlayPresentationProvider *)self->_presentationProvider isPanDismissalAvailable])
  {
    id v46 = [[CCUIDismissalGestureRecognizer alloc] initWithTarget:self action:sel__handleDismissalPanGestureRecognizer_];
    pagingViewDismissalPanGesture = self->_pagingViewDismissalPanGesture;
    self->_pagingViewDismissalPanGesture = &v46->super;

    [(UIPanGestureRecognizer *)self->_pagingViewDismissalPanGesture setMaximumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)self->_pagingViewDismissalPanGesture setDelegate:self];
    [v25 addGestureRecognizer:self->_pagingViewDismissalPanGesture];
  }
  uint64_t v48 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleDismissalTapGestureRecognizer_];
  pagingViewDismissalTapGesture = self->_pagingViewDismissalTapGesture;
  self->_pagingViewDismissalTapGesture = v48;

  [(UITapGestureRecognizer *)self->_pagingViewDismissalTapGesture setDelegate:self];
  [v25 addGestureRecognizer:self->_pagingViewDismissalTapGesture];
  long long v50 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:self action:sel__handleEditingLongPressGestureRecognizer_];
  editingLongPressGesture = self->_editingLongPressGesture;
  self->_editingLongPressGesture = v50;

  [(UILongPressGestureRecognizer *)self->_editingLongPressGesture setDelegate:self];
  [(CCUIPagingViewController *)self->_pagingViewController setLongPressToEditGestureRecognizer:self->_editingLongPressGesture];
  long long v52 = [(CCUIMainViewController *)self view];
  [v52 addGestureRecognizer:self->_editingLongPressGesture];

  if (self->_headerPocketView)
  {
    long long v53 = [(CCUIMainViewController *)self pagingView];
    uint64_t v54 = [MEMORY[0x1E4FA5F00] configureGradientMaskForFeatherBlurRecipe:7 onContentView:v53];
    p_headerPocketGradientMaskLayers = (id *)&self->_headerPocketGradientMaskLayers;
    id v56 = *p_headerPocketGradientMaskLayers;
    id *p_headerPocketGradientMaskLayers = (id)v54;

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id v57 = *p_headerPocketGradientMaskLayers;
    uint64_t v58 = [v57 countByEnumeratingWithState:&v68 objects:v76 count:16];
    if (v58)
    {
      uint64_t v59 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v58; ++i)
        {
          if (*(void *)v69 != v59) {
            objc_enumerationMutation(v57);
          }
          [*(id *)(*((void *)&v68 + 1) + 8 * i) setHidden:1];
        }
        uint64_t v58 = [v57 countByEnumeratingWithState:&v68 objects:v76 count:16];
      }
      while (v58);
    }
  }
  objc_destroyWeak(v62);

  objc_destroyWeak(&location);
}

void __37__CCUIMainViewController_viewDidLoad__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = [WeakRetained overlayHeaderView];
  BOOL v4 = v3;
  double v5 = 1.0;
  if (a2) {
    double v5 = 0.0;
  }
  [v3 setAdditionalContentAlphaMultiplier:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIMainViewController;
  [(CCUIMainViewController *)&v5 viewDidAppear:a3];
  BOOL v4 = [(CCUIMainViewController *)self analyticsEventsController];
  [v4 analyticsLogMainViewControllerPresent];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CCUIMainViewController;
  [(CCUIMainViewController *)&v5 viewDidDisappear:a3];
  [(CCUIMainViewController *)self _updateSensorActivityStatusForHeaderPocketView];
  BOOL v4 = [(CCUIMainViewController *)self analyticsEventsController];
  [v4 analyticsLogMainViewControllerDismiss];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CCUIMainViewController;
  id v7 = a4;
  -[CCUIMainViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__CCUIMainViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6A8A0E8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

uint64_t __77__CCUIMainViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__CCUIMainViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v4[3] = &unk_1E6A898F8;
  v4[4] = *(void *)(a1 + 32);
  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2031617, v4, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __77__CCUIMainViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (unint64_t)__supportedInterfaceOrientations
{
  return 30;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setEditing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CCUIMainViewController *)self pagingViewController];
  [v4 setEditing:v3];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (CCUIFlickGestureRecognizer *)a3;
  CAFrameRateRange v5 = v4;
  if (self->_pagingViewDismissalFlickGesture == v4)
  {
    BOOL v7 = [(CCUIMainViewController *)self _dismissalFlickGestureRecognizerShouldBegin:v4];
    goto LABEL_12;
  }
  if ((CCUIFlickGestureRecognizer *)self->_headerPocketViewDismissalTapGesture == v4
    || (CCUIFlickGestureRecognizer *)self->_pagingViewDismissalTapGesture == v4)
  {
    BOOL v7 = [(CCUIMainViewController *)self _dismissalTapGestureRecognizerShouldBegin:v4];
LABEL_12:
    BOOL v6 = v7;
    goto LABEL_13;
  }
  if ((CCUIFlickGestureRecognizer *)self->_headerPocketViewDismissalPanGesture == v4
    || (CCUIFlickGestureRecognizer *)self->_pagingViewDismissalPanGesture == v4)
  {
    BOOL v7 = [(CCUIMainViewController *)self _dismissalPanGestureRecognizerShouldBegin:v4];
    goto LABEL_12;
  }
  if ((CCUIFlickGestureRecognizer *)self->_editingLongPressGesture == v4)
  {
    BOOL v7 = [(CCUIMainViewController *)self _editingLongPressGestureRecognizerShouldBegin:v4];
    goto LABEL_12;
  }
  BOOL v6 = 1;
LABEL_13:

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return self->_pagingViewDismissalFlickGesture == a3
      && -[CCUIMainViewController _dismissalFlickGestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:](self, "_dismissalFlickGestureRecognizer:shouldBeRequiredToFailByGestureRecognizer:");
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  BOOL v6 = (UIPanGestureRecognizer *)a3;
  id v7 = a4;
  id v8 = v7;
  if (self->_headerPocketViewDismissalPanGesture == v6)
  {
    double v10 = [v7 view];
    double v11 = [(CCUIHeaderPocketView *)self->_headerPocketView statusBar];
    if ([v10 isDescendantOfView:v11])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }
  if ((UIPanGestureRecognizer *)self->_pagingViewDismissalTapGesture == v6
    && ([(CCUIMainViewController *)self pagingViewController],
        CGFloat v12 = objc_claimAutoreleasedReturnValue(),
        int v13 = [v12 isEditing],
        v12,
        !v13))
  {
    char isKindOfClass = 1;
  }
  else if ((UIPanGestureRecognizer *)self->_editingLongPressGesture == v6)
  {
    CGFloat v14 = [v8 view];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v15 = [v8 delegate];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_pagingViewDismissalFlickGesture != a3
      || -[CCUIMainViewController _dismissalFlickGestureRecognizer:shouldReceiveTouch:](self, "_dismissalFlickGestureRecognizer:shouldReceiveTouch:");
}

- (BOOL)scrollView:(id)a3 gestureRecognizerShouldBegin:(id)a4
{
  return self->_pagingViewScrollPanGesture != a4
      || [(CCUIMainViewController *)self _scrollPanGestureRecognizerShouldBegin:a4];
}

- (void)scrollViewDidScroll:(id)a3
{
  unint64_t v4 = [(CCUIMainViewController *)self presentationState];
  if ([(CCUIMainViewController *)self transitionState] != 1 && v4 - 1 <= 1) {
    [(CCUIMainViewController *)self _replaceBackgroundViewContentsWithSnapshotIfNecessary:1];
  }

  [(CCUIMainViewController *)self _updateHotPocketAnimated:0];
}

- (id)fallbackDragHitTestViewForScrollView:(id)a3
{
  BOOL v3 = [(CCUIMainViewController *)self pagingViewController];
  unint64_t v4 = [v3 currentIconlistView];

  return v4;
}

- (void)pagingViewController:(id)a3 didAdd:(id)a4
{
  id v9 = a4;
  if (self->_active)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = v9;
    if (v5)
    {
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
    id v8 = v7;

    [v8 willBecomeActive];
  }
  [(CCUIMainViewController *)self _setupPanGestureFailureRequirements];
}

- (void)pagingViewController:(id)a3 willRemove:(id)a4
{
  id v5 = a4;
  if (self->_active)
  {
    id v10 = v5;
    uint64_t v6 = objc_opt_class();
    id v7 = v10;
    if (v6)
    {
      if (objc_opt_isKindOfClass()) {
        id v8 = v7;
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
    id v9 = v8;

    [v9 willResignActive];
    id v5 = v10;
  }
}

- (void)pagingViewController:(id)a3 willExpand:(id)a4
{
  id v5 = [(CCUIMainViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 willOpenExpandedModuleForControlCenterViewController:self];
  }
  [(CCUIMainViewController *)self _willPresentViewControllerContainedInPages];
  self->_showingRootView = 0;
}

- (void)pagingViewController:(id)a3 didClose:(id)a4
{
  id v5 = [(CCUIMainViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 didCloseExpandedModuleForControlCenterViewController:self];
  }
  self->_showingRootView = 1;
  [(CCUIMainViewController *)self _updateAskToAirDropModuleVisibility];
}

- (void)_willPresentViewControllerContainedInPages
{
  [(CCUIMainViewController *)self presentAnimated:1 withCompletionHandler:0];
  headerPocketView = self->_headerPocketView;

  [(CCUIHeaderPocketView *)headerPocketView setAlpha:0.0];
}

- (void)_willDismissViewControllerContainedInPages
{
}

- (void)pagingViewController:(id)a3 editingDidChange:(BOOL)a4
{
  char v5 = objc_opt_respondsToSelector();
  presentationProvider = self->_presentationProvider;
  if (v5)
  {
    id v7 = [(CCUIOverlayPresentationProvider *)presentationProvider transitionBetweenEditing];
    [(CCUIAnimationRunner *)self->_editingAnimationRunner runAnimationBatch:v7 withCompletionBlock:0];
  }
  else
  {
    [(CCUIOverlayPresentationProvider *)presentationProvider layoutViews];
  }
}

- (id)reasonToDisallowEditing:(id)a3
{
  BOOL v3 = [(CCUIMainViewController *)self systemAgent];
  unint64_t v4 = [v3 reasonToDisallowEditing];

  return v4;
}

- (void)pagingViewController:(id)a3 editingAccessoryViewIntrinsicSizeDidChange:(id)a4
{
}

- (id)pagingViewControllerDidAddModuleView:(id)a3
{
  if ([(CCUIMainViewController *)self presentationState] == 3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__CCUIMainViewController_pagingViewControllerDidAddModuleView___block_invoke;
    aBlock[3] = &unk_1E6A8A110;
    void aBlock[4] = self;
    unint64_t v4 = _Block_copy(aBlock);
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

void __63__CCUIMainViewController_pagingViewControllerDidAddModuleView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  id v9 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "_layoutRectForIconCoordinate:gridSize:", a3, a4, a5);
  uint64_t v10 = *(void *)(a1 + 32);
  double v11 = *(void **)(v10 + 976);
  uint64_t v12 = *(void *)(v10 + 1128);
  v14[0] = v15;
  v14[1] = v16;
  int v13 = [v11 moduleViewAnimationBatchForTransitionState:v12 moduleView:v9 layoutRect:v14];
  [*(id *)(*(void *)(a1 + 32) + 992) additivelyRunAnimationBatch:v13 withCompletionBlock:0];
}

- (BOOL)isSystemRestoringForPagingViewController:(id)a3
{
  BOOL v3 = [(CCUIMainViewController *)self systemAgent];
  char v4 = [v3 isRestoring];

  return v4;
}

- (BOOL)pagingViewController:(id)a3 shouldPauseCheckingInvalidControlsForApplicationIdentifier:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(CCUIMainViewController *)self systemAgent];
  char v7 = [(id)v6 hasApplicationPlaceholderForDisplayID:v5];

  id v8 = [(CCUIMainViewController *)self systemAgent];
  LOBYTE(v6) = [v8 hasApplicationForDisplayID:v5];

  return v7 | v6;
}

- (void)statusLabelViewControllerWillBeginStatusUpdates:(id)a3
{
}

- (void)statusLabelViewControllerDidFinishStatusUpdates:(id)a3
{
}

- (void)handleIconElementRequestWithOperationService:(id)a3 iconElementRequest:(id)a4 completionHandler:(id)a5
{
}

- (void)handleControlCenterOperationTypeWithOperationService:(id)a3 operationType:(int64_t)a4 completionHandler:(id)a5
{
  id v7 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __111__CCUIMainViewController_handleControlCenterOperationTypeWithOperationService_operationType_completionHandler___block_invoke;
  block[3] = &unk_1E6A8A138;
  v11[1] = (id)a4;
  objc_copyWeak(v11, &location);
  block[4] = self;
  id v10 = v7;
  id v8 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

uint64_t __111__CCUIMainViewController_handleControlCenterOperationTypeWithOperationService_operationType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained presentAnimated:1 withCompletionHandler:0];

    uint64_t v2 = *(void *)(a1 + 56);
  }
  switch(v2)
  {
    case 2:
      char v4 = (id *)(a1 + 48);
      goto LABEL_8;
    case 3:
      id v5 = objc_loadWeakRetained((id *)(a1 + 48));
      if (![v5 presentationState])
      {

        goto LABEL_12;
      }
      id v6 = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v7 = [v6 presentationState];

      if (v7 == 3)
      {
LABEL_12:
        id v8 = objc_loadWeakRetained((id *)(a1 + 48));
        [v8 presentAnimated:1 withCompletionHandler:0];
        goto LABEL_13;
      }
      char v4 = (id *)(a1 + 48);
LABEL_8:
      id v8 = objc_loadWeakRetained(v4);
      [v8 dismissAnimated:1 withCompletionHandler:0];
LABEL_13:

LABEL_14:
      double v11 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
      return v11();
    case 4:
      id v9 = objc_loadWeakRetained((id *)(a1 + 48));
      [v9 presentAnimated:1 withCompletionHandler:0];

      id v10 = [*(id *)(a1 + 32) view];
      [v10 layoutIfNeeded];

      [*(id *)(*(void *)(a1 + 32) + 1016) presentSensorAttributionExpandedView:1];
      goto LABEL_14;
    case 5:
      [*(id *)(*(void *)(a1 + 32) + 1016) dismissSensorAttributionExpandedView:1 completion:&__block_literal_global_8];
      goto LABEL_14;
    default:
      goto LABEL_14;
  }
}

- (void)requestIconElementStateWithOperationService:(id)a3 iconElementRequest:(id)a4 completionHandler:(id)a5
{
}

- (void)resetToDefaultLayoutWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, uint64_t, void))a3;
  char v4 = [(CCUIMainViewController *)self pagingViewController];
  [v4 resetToDefaultLayout];

  v5[2](v5, 1, 0);
}

- (UIView)overlayPageControl
{
  return [(CCUIPagingViewController *)self->_pagingViewController pageControl];
}

- (void)setOverlayStatusBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CCUIMainViewController *)self delegate];
  [v5 controlCenterViewController:self wantsHostStatusBarHidden:!v3];

  if (v3) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  [(UIStatusBar *)self->_compactLeadingStatusBar setAlpha:v6];
  id v7 = [(CCUIHeaderPocketView *)self->_headerPocketView statusBar];
  [v7 setAlpha:v6];
}

- (void)setOverlayPageContentAlpha:(double)a3
{
  id v4 = [(CCUIPagingViewController *)self->_pagingViewController interactivePagingCoordinator];
  [v4 setPageContentAlpha:a3];
}

- (void)setOverlayPageContentScale:(double)a3
{
  id v4 = [(CCUIPagingViewController *)self->_pagingViewController interactivePagingCoordinator];
  [v4 setPageContentScale:a3];
}

- (void)setOverlayPageContentTranslation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(CCUIPagingViewController *)self->_pagingViewController interactivePagingCoordinator];
  objc_msgSend(v5, "setPageContentTranslation:", x, y);
}

- (void)enumerateOverlayModuleViewsWithBlock:(id)a3
{
  id v4 = a3;
  pagingViewController = self->_pagingViewController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CCUIMainViewController_enumerateOverlayModuleViewsWithBlock___block_invoke;
  v7[3] = &unk_1E6A8A160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CCUIPagingViewController *)pagingViewController enumerateDisplayedModuleViewsWithBlock:v7];
}

void __63__CCUIMainViewController_enumerateOverlayModuleViewsWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  id v10 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  double v11 = *(void **)(a1 + 32);
  if (v11) {
    objc_msgSend(v11, "_layoutRectForIconCoordinate:gridSize:", a3, a4, a5);
  }
  uint64_t v12 = *(void *)(a1 + 40);
  int v13 = *(void (**)(uint64_t, id, _OWORD *, uint64_t))(v12 + 16);
  v14[0] = v15;
  v14[1] = v16;
  v13(v12, v10, v14, v9);
}

- (CCUILayoutRect)_layoutRectForIconCoordinate:(SEL)a3 gridSize:(SBIconCoordinate)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  if (SBIconCoordinateIsNotFound())
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a3 object:self file:@"CCUIMainViewController.m" lineNumber:1286 description:@"Icon coordinate must be valid"];
  }
  uint64_t result = (CCUILayoutRect *)SBHIconGridSizeIsEmpty();
  if (result)
  {
    int v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a3 object:self file:@"CCUIMainViewController.m" lineNumber:1287 description:@"Icon grid size must not be empty"];
  }
  retstr->var0.int64_t var0 = var0 - 1;
  retstr->var0.int64_t var1 = var1 - 1;
  retstr->var1.double width = a5.var0;
  retstr->var1.double height = a5.var1;
  return result;
}

- (unint64_t)overlayPageCount
{
  return [(CCUIPagingViewController *)self->_pagingViewController pageCount];
}

- (UIEdgeInsets)overlayAdditionalEdgeInsets
{
  double v4 = *MEMORY[0x1E4FB2848];
  double v3 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if ([(CCUIMainViewController *)self isReachabilityActive])
  {
    id v7 = [(CCUIMainViewController *)self delegate];
    [v7 reachabilityOffsetForControlCenterViewController:self];
    double v4 = v4 + v8;
  }
  double v9 = v4;
  double v10 = v3;
  double v11 = v5;
  double v12 = v6;
  result.right = v12;
  result.bottom = v11;
  result.left = v10;
  result.top = v9;
  return result;
}

- (UIEdgeInsets)overlayContentLayoutInset
{
  [(CCUIPagingViewController *)self->_pagingViewController additionalContentInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)compactTrailingStyleRequestForStatusBar:(id)a3
{
  double v4 = [(CCUIStatusBarStyleSnapshot *)self->_hostStatusBarStyleSnapshot trailingStyleRequest];
  if ([(CCUIStatusBarStyleSnapshot *)self->_hostStatusBarStyleSnapshot isHidden])
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1C98]) initWithStyle:1 legacy:0 legibilityStyle:_UILegibilityStyleFromStatusBarStyle() foregroundColor:0];

    double v4 = (void *)v5;
  }

  return v4;
}

- (CGRect)compactAvoidanceFrameForStatusBar:(id)a3
{
  [(CCUIStatusBarStyleSnapshot *)self->_hostStatusBarStyleSnapshot avoidanceFrame];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (CGRect)expandedAvoidanceFrameForStatusBar:(id)a3
{
  id v4 = a3;
  if ((unint64_t)([(CCUIMainViewController *)self _interfaceOrientation] - 3) > 1)
  {
    double v16 = *MEMORY[0x1E4F1DB28];
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    double v5 = [(CCUIHeaderPocketView *)self->_headerPocketView compactSensorAttributionControl];
    [v5 bounds];
    objc_msgSend(v5, "convertRect:toView:", 0);
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    CGFloat v14 = [v4 expandedStatusBar];
    objc_msgSend(v14, "convertRect:fromView:", 0, v7, v9, v11, v13);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
  }
  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (void)contentModuleContext:(id)a3 enqueueStatusUpdate:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (self->_active)
  {
    double v7 = [(CCUIMainViewController *)self pagingViewController];
    uint64_t v8 = [v7 expandedModuleCount];

    if (!v8)
    {
      double v9 = [(CCUIMainViewController *)self statusLabelViewController];
      double v10 = [v11 moduleIdentifier];
      [v9 enqueueStatusUpdate:v6 forIdentifier:v10];
    }
  }
}

- (void)requestExpandModuleForContentModuleContext:(id)a3
{
  id v4 = a3;
  if (self->_active)
  {
    id v10 = v4;
    double v5 = [(CCUIMainViewController *)self pagingViewController];
    uint64_t v6 = [v5 expandedModuleCount];

    id v4 = v10;
    if (!v6)
    {
      double v7 = [(CCUIMainViewController *)self pagingViewController];
      uint64_t v8 = [v10 moduleIdentifier];
      double v9 = [v10 uniqueIdentifier];
      [v7 expandModuleWithIdentifier:v8 uniqueIdentifier:v9];

      id v4 = v10;
    }
  }
}

- (void)dismissExpandedViewForContentModuleContext:(id)a3
{
  id v4 = a3;
  if (self->_active)
  {
    id v8 = v4;
    double v5 = [(CCUIMainViewController *)self pagingViewController];
    uint64_t v6 = [v8 moduleIdentifier];
    int v7 = [v5 isModuleExpandedForIdentifier:v6];

    id v4 = v8;
    if (v7)
    {
      [(CCUIMainViewController *)self dismissPresentedContentAnimated:1 completion:0];
      id v4 = v8;
    }
  }
}

- (void)dismissControlCenterForContentModuleContext:(id)a3
{
  if ([(CCUIMainViewController *)self isActive])
  {
    [(CCUIMainViewController *)self dismissAnimated:1 withCompletionHandler:0];
  }
}

- (id)contentModuleContext:(id)a3 requestsSensorActivityDataForActiveSensorType:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x3032000000;
  double v24 = __Block_byref_object_copy__2;
  double v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  if (a4 > 1)
  {
    CGFloat v14 = [(CCUISensorActivityDataProvider *)self->_sensorActivityDataProvider activeSensorActivityData];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __93__CCUIMainViewController_contentModuleContext_requestsSensorActivityDataForActiveSensorType___block_invoke;
    v17[3] = &unk_1E6A8A188;
    v17[4] = self;
    v17[5] = &v21;
    void v17[6] = a4;
    [v14 enumerateObjectsUsingBlock:v17];
  }
  else
  {
    char v20 = 0;
    id v18 = 0;
    id v19 = 0;
    [(CCUIMainViewController *)self _getCameraSensorActivityData:&v19 micSensorActivityData:&v18 isInactiveMicModeSelection:&v20];
    id v7 = v19;
    id v8 = v18;
    double v9 = v8;
    id v10 = v7;
    if (!a4 || (id v10 = v8, !v20))
    {
      id v11 = v22;
      id v12 = v10;
      double v13 = (void *)v11[5];
      void v11[5] = (uint64_t)v12;
    }
  }
  id v15 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v15;
}

void __93__CCUIMainViewController_contentModuleContext_requestsSensorActivityDataForActiveSensorType___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if (([v8 usedRecently] & 1) == 0
    && [v8 sensorType] == *(void *)(a1 + 48)
    && [*(id *)(a1 + 32) _isRelevantSensorActivityData:v8])
  {
    uint64_t v5 = [v8 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    *a3 = 1;
  }
}

- (id)contentModuleContextRequestsSensorActivityDataEligibleForInactiveMicModeSelection:(id)a3
{
  char v8 = 0;
  id v7 = 0;
  [(CCUIMainViewController *)self _getCameraSensorActivityData:0 micSensorActivityData:&v7 isInactiveMicModeSelection:&v8];
  id v3 = v7;
  id v4 = v3;
  if (v8) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isDevicePasscodeLockedForContentModuleContext:(id)a3
{
  id v3 = [(CCUIMainViewController *)self systemAgent];
  char v4 = [v3 isPasscodeLocked];

  return v4;
}

- (id)existingControlKindFromWidgetExtension:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CCUIPagingViewController *)self->_pagingViewController iconModel];
  [v5 iconsOfClass:objc_opt_class()];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v22 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    uint64_t v7 = *(void *)v28;
    uint64_t v20 = *(void *)v28;
    uint64_t v21 = v5;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v7) {
          objc_enumerationMutation(v6);
        }
        double v9 = [*(id *)(*((void *)&v27 + 1) + 8 * i) iconDataSourcesOfClass:objc_opt_class()];
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v24;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              id v15 = *(void **)(*((void *)&v23 + 1) + 8 * j);
              double v16 = [v15 extensionBundleIdentifier];
              char v17 = [v16 isEqualToString:v4];

              if (v17)
              {
                id v18 = [v15 kind];

                id v5 = v21;
                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        uint64_t v7 = v20;
      }
      id v18 = 0;
      id v5 = v21;
      uint64_t v22 = [v6 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

- (void)addIfNecessaryAndScrollToControlMatching:(id)a3 animated:(BOOL)a4
{
}

- (void)beginPresentationWithLocation:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5 touches:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  double v8 = a4.y;
  double v9 = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  id v16 = a6;
  if ([(CCUIMainViewController *)self presentationState] != 1
    && [(CCUIMainViewController *)self presentationState] != 2)
  {
    [(CCUIMainViewController *)self _setPresentationPanGestureActive:1];
    objc_msgSend(v16, "bs_compactMap:", &__block_literal_global_132);
    uint64_t v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    presentationTouchIdentifiers = self->_presentationTouchIdentifiers;
    self->_presentationTouchIdentifiers = v13;

    id v15 = [(CCUIMainViewController *)self _beginPresentationAnimated:1 interactive:1];
    [(CCUIMainViewController *)self _updateSensorActivityStatusForHeaderPocketView];
    -[CCUIMainViewController updatePresentationWithLocation:translation:velocity:](self, "updatePresentationWithLocation:translation:velocity:", v11, v10, v9, v8, x, y);
    [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
  }
}

uint64_t __85__CCUIMainViewController_beginPresentationWithLocation_translation_velocity_touches___block_invoke(uint64_t a1, void *a2)
{
  double v2 = NSNumber;
  uint64_t v3 = [a2 _touchIdentifier];

  return [v2 numberWithUnsignedInt:v3];
}

- (void)updatePresentationWithLocation:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  if ([(CCUIMainViewController *)self presentationState] == 1
    && [(CCUIMainViewController *)self transitionState] == 1)
  {
    -[CCUIMainViewController _updatePresentationForTransitionType:translation:interactive:](self, "_updatePresentationForTransitionType:translation:interactive:", 1, 1, x, y);
    -[CCUIMainViewController _evaluatePresentationContinuationIntoPagingWithLocation:](self, "_evaluatePresentationContinuationIntoPagingWithLocation:", v8, v7);
  }
}

- (void)endPresentationWithLocation:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  double v7 = a4.y;
  double v8 = a4.x;
  -[CCUIMainViewController _setPresentationPanGestureActive:](self, "_setPresentationPanGestureActive:", 0, a3.x, a3.y);
  if ([(CCUIMainViewController *)self presentationState] == 1
    && [(CCUIMainViewController *)self transitionState] == 1)
  {
    -[CCUIOverlayPresentationProvider transitionStateForType:interactive:translation:](self->_presentationProvider, "transitionStateForType:interactive:translation:", 1, 1, v8, v7);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = -[CCUIOverlayPresentationProvider finalTransitionTypeForState:gestureTranslation:gestureVelocity:](self->_presentationProvider, "finalTransitionTypeForState:gestureTranslation:gestureVelocity:", v8, v7, x, y);
    if (v10) {
      BOOL v11 = v10 == 2;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      [(CCUIMainViewController *)self dismissAnimated:1 withCompletionHandler:0];
    }
    else if (v10 == 1)
    {
      [(CCUIMainViewController *)self presentAnimated:1 withCompletionHandler:0];
    }
  }
}

- (void)cancelPresentationWithLocation:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5
{
  -[CCUIMainViewController _setPresentationPanGestureActive:](self, "_setPresentationPanGestureActive:", 0, a3.x, a3.y, a4.x, a4.y, a5.x, a5.y);
  if ([(CCUIMainViewController *)self presentationState] == 1)
  {
    [(CCUIMainViewController *)self dismissAnimated:1 withCompletionHandler:0];
  }
}

- (BOOL)_interpretsGestureLocationAsContent:(id)a3
{
  id v4 = a3;
  id v5 = [(CCUIMainViewController *)self view];
  pagingViewController = self->_pagingViewController;
  [v4 locationInView:v5];
  if (-[CCUIPagingViewController interpretsLocationAsContent:in:](pagingViewController, "interpretsLocationAsContent:in:", v5))
  {
    BOOL v7 = 1;
  }
  else
  {
    headerPocketView = self->_headerPocketView;
    [v4 locationInView:headerPocketView];
    double v9 = -[CCUIHeaderPocketView hitTest:withEvent:](headerPocketView, "hitTest:withEvent:", 0);
    if (v9) {
      BOOL v7 = [(CCUIHeaderPocketView *)self->_headerPocketView hitTestedViewWantsToBlockGestures:v9];
    }
    else {
      BOOL v7 = 0;
    }
  }
  return v7;
}

- (BOOL)_dismissalTapGestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if ([(CCUIMainViewController *)self presentationState] == 3
    || ![(CCUIMainViewController *)self presentationState])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    BOOL v5 = ![(CCUIMainViewController *)self _interpretsGestureLocationAsContent:v4];
  }

  return v5;
}

- (void)_handleDismissalTapGestureRecognizer:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(CCUIMainViewController *)self pagingViewController];
    int v5 = [v4 isEditing];

    if (v5)
    {
      id v6 = [(CCUIMainViewController *)self pagingViewController];
      [v6 setEditing:0];
    }
    else
    {
      [(CCUIMainViewController *)self dismissAnimated:1 withCompletionHandler:0];
    }
  }
}

- (BOOL)_dismissalFlickGestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if ([(CCUIMainViewController *)self _scrollViewIsScrollable])
  {
    [v4 minimumFlickVelocity];
    BOOL v6 = !-[CCUIMainViewController _scrollPanGestureRecognizerCanBeginForGestureVelocity:](self, "_scrollPanGestureRecognizerCanBeginForGestureVelocity:", 0.0, v5);
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (BOOL)_dismissalFlickGestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return [(NSHashTable *)self->_blockingGestureRecognizers containsObject:a4];
}

- (BOOL)_dismissalFlickGestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(CCUIMainViewController *)self _scrollViewCanAcceptDownwardsPan])
  {
    BOOL v6 = 0;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v7 = objc_msgSend(v5, "gestureRecognizers", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([(NSHashTable *)self->_blockingGestureRecognizers containsObject:*(void *)(*((void *)&v13 + 1) + 8 * i)])
          {
            BOOL v6 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v6 = 0;
LABEL_13:
  }
  return v6;
}

- (void)_handleDismissalFlickGestureRecognizer:(id)a3
{
  if ([a3 state] == 3)
  {
    id v4 = [(CCUIMainViewController *)self pagingViewController];
    int v5 = [v4 isEditing];

    if (v5)
    {
      id v6 = [(CCUIMainViewController *)self pagingViewController];
      [v6 setEditing:0];
    }
    else
    {
      [(CCUIMainViewController *)self dismissAnimated:1 withCompletionHandler:0];
    }
  }
}

- (void)_cancelDismissalPanGestures
{
  [(UIPanGestureRecognizer *)self->_pagingViewDismissalPanGesture setEnabled:0];
  [(UIPanGestureRecognizer *)self->_pagingViewDismissalPanGesture setEnabled:1];
  [(UIPanGestureRecognizer *)self->_headerPocketViewDismissalPanGesture setEnabled:0];
  headerPocketViewDismissalPanGesture = self->_headerPocketViewDismissalPanGesture;

  [(UIPanGestureRecognizer *)headerPocketViewDismissalPanGesture setEnabled:1];
}

- (BOOL)_dismissalPanGestureRecognizerShouldBegin:(id)a3
{
  id v4 = (UIPanGestureRecognizer *)a3;
  unint64_t v5 = [(CCUIMainViewController *)self presentationState];
  char v6 = 0;
  if (v5 && v5 != 3)
  {
    if (self->_presentationPanGestureActive)
    {
LABEL_4:
      char v6 = 0;
      goto LABEL_5;
    }
    if (self->_pagingViewDismissalPanGesture == v4)
    {
      if ([(CCUIMainViewController *)self _gestureRecognizerIsActive:self->_headerPocketViewDismissalPanGesture]|| [(CCUIMainViewController *)self isEditing])
      {
        goto LABEL_4;
      }
      uint64_t v8 = [(CCUIMainViewController *)self view];
      [(UIPanGestureRecognizer *)v4 velocityInView:v8];
      double v10 = v9;
      double v12 = v11;

      BOOL v13 = -[CCUIMainViewController _scrollPanGestureRecognizerCanBeginForGestureVelocity:](self, "_scrollPanGestureRecognizerCanBeginForGestureVelocity:", v10, v12);
    }
    else
    {
      if (self->_headerPocketViewDismissalPanGesture != v4)
      {
        char v6 = 1;
        goto LABEL_5;
      }
      if (-[CCUIMainViewController _gestureRecognizerIsActive:](self, "_gestureRecognizerIsActive:")) {
        goto LABEL_4;
      }
      BOOL v13 = [(CCUIMainViewController *)self isSensorAttributionViewControllerExpanded];
    }
    char v6 = !v13;
  }
LABEL_5:

  return v6;
}

- (void)_handleDismissalPanGestureRecognizer:(id)a3
{
  id v4 = a3;
  switch([v4 state])
  {
    case 1:
      [(CCUIMainViewController *)self _dismissalPanGestureRecognizerBegan:v4];
      break;
    case 2:
      [(CCUIMainViewController *)self _dismissalPanGestureRecognizerChanged:v4];
      break;
    case 3:
      [(CCUIMainViewController *)self _dismissalPanGestureRecognizerEnded:v4];
      break;
    case 4:
      [(CCUIMainViewController *)self _dismissalPanGestureRecognizerCancelled:v4];
      break;
    case 5:
      [(CCUIMainViewController *)self _dismissalPanGestureRecognizerFailed:v4];
      break;
    default:
      break;
  }
}

- (void)_dismissalPanGestureRecognizerBegan:(id)a3
{
  id v6 = a3;
  id v4 = [(CCUIMainViewController *)self _beginDismissalAnimated:1 interactive:1];
  unint64_t v5 = [(CCUIMainViewController *)self view];
  objc_msgSend(v6, "setTranslation:inView:", v5, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  [(CCUIMainViewController *)self _dismissalPanGestureRecognizerChanged:v6];
}

- (void)_dismissalPanGestureRecognizerChanged:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CCUIMainViewController *)self view];
  [v4 translationInView:v5];
  double v7 = v6;
  double v9 = v8;

  -[CCUIMainViewController _updatePresentationForTransitionType:translation:interactive:](self, "_updatePresentationForTransitionType:translation:interactive:", 2, 1, v7, v9);
}

- (void)_dismissalPanGestureRecognizerEnded:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(CCUIMainViewController *)self view];
  [v4 translationInView:v5];
  double v7 = v6;
  double v9 = v8;

  double v10 = [(CCUIMainViewController *)self view];
  [v4 velocityInView:v10];
  double v12 = v11;
  double v14 = v13;

  -[CCUIOverlayPresentationProvider transitionStateForType:interactive:translation:](self->_presentationProvider, "transitionStateForType:interactive:translation:", 2, 1, v7, v9);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v15 = -[CCUIOverlayPresentationProvider finalTransitionTypeForState:gestureTranslation:gestureVelocity:](self->_presentationProvider, "finalTransitionTypeForState:gestureTranslation:gestureVelocity:", v7, v9, v12, v14);
  if (v15 >= 2)
  {
    if (v15 == 2) {
      [(CCUIMainViewController *)self dismissAnimated:1 withCompletionHandler:0];
    }
  }
  else
  {
    [(CCUIMainViewController *)self presentAnimated:1 withCompletionHandler:0];
  }
}

- (void)_dismissalPanGestureRecognizerCancelled:(id)a3
{
}

- (void)_dismissalPanGestureRecognizerFailed:(id)a3
{
}

- (BOOL)_editingLongPressGestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if ([(CCUIMainViewController *)self isEditing]
    || [(CCUIMainViewController *)self isSensorAttributionViewControllerExpanded]|| [(CCUIPagingViewController *)self->_pagingViewController expandedModuleCount] > 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    unint64_t v7 = [(CCUIMainViewController *)self presentationState];
    LOBYTE(v5) = 0;
    if (v7 && v7 != 3) {
      BOOL v5 = ![(CCUIMainViewController *)self _interpretsGestureLocationAsContent:v4];
    }
  }

  return v5;
}

- (void)_handleEditingLongPressGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ([v4 state] == 1)
  {
    [(CCUIMainViewController *)self setEditing:1];
    [v4 setEnabled:0];
    [v4 setEnabled:1];
  }
}

- (BOOL)_scrollPanGestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if ([(CCUIMainViewController *)self presentationState] == 3
    || self->_presentationPanGestureActive
    || [(CCUIMainViewController *)self _gestureRecognizerIsActive:self->_headerPocketViewDismissalPanGesture]|| [(CCUIMainViewController *)self _gestureRecognizerIsActive:self->_pagingViewDismissalPanGesture])
  {
    BOOL v5 = 0;
  }
  else
  {
    unint64_t v7 = [(CCUIMainViewController *)self view];
    [v4 velocityInView:v7];
    double v9 = v8;
    double v11 = v10;

    BOOL v5 = -[CCUIMainViewController _scrollPanGestureRecognizerCanBeginForGestureVelocity:](self, "_scrollPanGestureRecognizerCanBeginForGestureVelocity:", v9, v11);
  }

  return v5;
}

- (BOOL)_scrollPanGestureRecognizerCanBeginForGestureVelocity:(CGPoint)a3
{
  if (BSFloatGreaterThanFloat()
    && ![(CCUIMainViewController *)self _scrollViewCanAcceptDownwardsPan])
  {
    int v4 = [(CCUIMainViewController *)self _scrollViewIsScrollable];
    if (v4) {
      LOBYTE(v4) = BSFloatGreaterThanFloat() ^ 1;
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return v4;
}

- (BOOL)_scrollViewIsScrollable
{
  double v2 = [(CCUIMainViewController *)self _scrollView];
  if ([v2 isScrollEnabled])
  {
    [v2 contentSize];
    [v2 contentInset];
    [v2 contentInset];
    [v2 bounds];
    char v3 = BSFloatGreaterThanFloat();
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_scrollViewCanAcceptDownwardsPan
{
  int v3 = [(CCUIMainViewController *)self _scrollViewIsScrollable];
  if (v3)
  {
    int v4 = [(CCUIMainViewController *)self _scrollView];
    objc_msgSend(v4, "ccui_relativeContentOffset");

    LOBYTE(v3) = BSFloatLessThanOrEqualToFloat() ^ 1;
  }
  return v3;
}

- (id)_scrollView
{
  return [(CCUIPagingViewController *)self->_pagingViewController scrollView];
}

- (void)_updateChevronStateForTransitionState:(id)a3
{
  [a3 presentationProgress];
  uint64_t v4 = BSFloatGreaterThanOrEqualToFloat();
  headerPocketView = self->_headerPocketView;

  [(CCUIHeaderPocketView *)headerPocketView setChevronState:v4];
}

- (void)_updateHotPocketAnimated:(BOOL)a3
{
  if (self->_headerPocketView)
  {
    BOOL v3 = a3;
    BOOL v5 = [(CCUIMainViewController *)self pagingViewController];
    id v26 = [v5 topmostContentView];

    [(CCUIHeaderPocketView *)self->_headerPocketView bounds];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    [v26 bounds];
    objc_msgSend(v26, "convertRect:toView:", self->_headerPocketView);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    v28.origin.double x = v7;
    v28.origin.double y = v9;
    v28.size.double width = v11;
    v28.size.double height = v13;
    double Height = CGRectGetHeight(v28);
    v29.origin.double x = v15;
    v29.origin.double y = v17;
    v29.size.double width = v19;
    v29.size.double height = v21;
    double MinY = CGRectGetMinY(v29);
    if ([(CCUIMainViewController *)self transitionState] == 2
      && [(CCUIMainViewController *)self presentationState] == 3)
    {
      int v24 = [(CCUIOverlayPresentationProvider *)self->_presentationProvider allowHotPocketDuringTransition];
    }
    else
    {
      int v24 = 1;
    }
    BOOL v25 = vabdd_f64(MinY, Height) > 0.05;
    if (MinY >= Height) {
      BOOL v25 = 0;
    }
    [(CCUIMainViewController *)self _updateHotPocket:v25 & v24 animated:v3];
  }
}

- (void)_updateHotPocket:(BOOL)a3 animated:(BOOL)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_headerPocketView)
  {
    BOOL v4 = a3;
    if (self->_showHotPocket != a3)
    {
      self->_showHotPocket = a3;
      double v6 = 0.0;
      if (a3) {
        double v6 = 1.0;
      }
      if (a4)
      {
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __52__CCUIMainViewController__updateHotPocket_animated___block_invoke;
        v18[3] = &unk_1E6A8A048;
        v18[4] = self;
        *(double *)&v18[5] = v6;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v18 animations:0.3];
      }
      else
      {
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        v17[2] = __52__CCUIMainViewController__updateHotPocket_animated___block_invoke_2;
        v17[3] = &unk_1E6A8A048;
        v17[4] = self;
        *(double *)&v17[5] = v6;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v17];
      }
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      CGFloat v7 = self->_headerPocketGradientMaskLayers;
      uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        BOOL v11 = !v4;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "setHidden:", v11, (void)v13);
          }
          uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v13 objects:v19 count:16];
        }
        while (v9);
      }
    }
  }
}

uint64_t __52__CCUIMainViewController__updateHotPocket_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) setBackgroundAlpha:*(double *)(a1 + 40)];
}

uint64_t __52__CCUIMainViewController__updateHotPocket_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) setBackgroundAlpha:*(double *)(a1 + 40)];
}

- (void)_setupPanGestureFailureRequirements
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(NSHashTable *)self->_blockingGestureRecognizers removeAllObjects];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = [(CCUIMainViewController *)self pagingViewController];
  BOOL v4 = [v3 queryAllTopLevelBlockingGestureRecognizers];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        [(NSHashTable *)self->_blockingGestureRecognizers addObject:v9];
        [(UIPanGestureRecognizer *)self->_pagingViewDismissalPanGesture requireGestureRecognizerToFail:v9];
        [(UIPanGestureRecognizer *)self->_pagingViewScrollPanGesture requireGestureRecognizerToFail:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)_gestureRecognizerIsActive:(id)a3
{
  return (unint64_t)([a3 state] - 1) < 3;
}

- (void)gameModeStateDidChange:(unint64_t)a3
{
}

- (void)_askToAirDropPendingOrActiveConnectionsDidChange
{
  BOOL v3 = *MEMORY[0x1E4F5AD98];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D7B17000, v3, OS_LOG_TYPE_DEFAULT, "AskToAirDrop: pendingOrActiveConnectionsChanged", v4, 2u);
  }
  [(CCUIMainViewController *)self _updateAskToAirDropModuleVisibility];
}

- (void)_updateAskToAirDropModuleVisibility
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CCUIMainViewController *)self askToAirDropController];
  uint64_t v4 = [v3 hasPendingOrActiveConnections];

  if ((unint64_t)([(CCUIMainViewController *)self _interfaceOrientation] - 1) >= 2)
  {
    uint64_t v5 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  if ([(CCUIMainViewController *)self isShowingRootView] || !v4)
  {
    uint64_t v7 = *MEMORY[0x1E4F5AD98];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD98], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = @"NO";
      if (v4) {
        uint64_t v8 = @"YES";
      }
      int v10 = 138412546;
      long long v11 = @"com.apple.sharing.AskToAirDropControlCenterModule";
      __int16 v12 = 2112;
      long long v13 = v8;
      _os_log_impl(&dword_1D7B17000, v7, OS_LOG_TYPE_DEFAULT, "AskToAirDrop: update module visibility with identifier:%@ visible:%@", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v9 = [MEMORY[0x1E4F5ACE8] sharedInstance];
    [v9 setVisibility:v4 forModuleWithIdentifier:@"com.apple.sharing.AskToAirDropControlCenterModule" completionHandler:0];
  }
}

- (CCUIControlCenterSystemAgent)systemAgent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemAgent);

  return (CCUIControlCenterSystemAgent *)WeakRetained;
}

- (CCUIMainViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CCUIMainViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isActive
{
  return self->_active;
}

- (unint64_t)transitionState
{
  return self->_transitionState;
}

- (CCUIHostStatusBarStyleProvider)hostStatusBarStyleProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostStatusBarStyleProvider);

  return (CCUIHostStatusBarStyleProvider *)WeakRetained;
}

- (void)setHostStatusBarStyleProvider:(id)a3
{
}

- (NSUUID)currentTransitionUUID
{
  return self->_currentTransitionUUID;
}

- (void)setPagingViewController:(id)a3
{
}

- (CCUIModuleInstanceManager)moduleInstanceManager
{
  return self->_moduleInstanceManager;
}

- (void)setModuleInstanceManager:(id)a3
{
}

- (CCUIModuleSettingsManager)moduleSettingsManager
{
  return self->_moduleSettingsManager;
}

- (void)setModuleSettingsManager:(id)a3
{
}

- (BOOL)isShowingRootView
{
  return self->_showingRootView;
}

- (SFAskToAirDropReceiverControllerProtocol)askToAirDropController
{
  return self->_askToAirDropController;
}

- (CCUIAnalyticsEventsController)analyticsEventsController
{
  return self->_analyticsEventsController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventsController, 0);
  objc_storeStrong((id *)&self->_askToAirDropController, 0);
  objc_storeStrong((id *)&self->_statusLabelViewController, 0);
  objc_storeStrong((id *)&self->_moduleSettingsManager, 0);
  objc_storeStrong((id *)&self->_moduleInstanceManager, 0);
  objc_storeStrong((id *)&self->_pagingViewController, 0);
  objc_storeStrong((id *)&self->_sensorActivityDataProvider, 0);
  objc_storeStrong((id *)&self->_currentTransitionUUID, 0);
  objc_destroyWeak((id *)&self->_hostStatusBarStyleProvider);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_systemAgent);
  objc_storeStrong((id *)&self->_controlCenterOperationService, 0);
  objc_storeStrong((id *)&self->_gameModeActivityDataProvider, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_hostStatusBarStyleSnapshot, 0);
  objc_storeStrong((id *)&self->_previousTransitionState, 0);
  objc_storeStrong((id *)&self->_blockingGestureRecognizers, 0);
  objc_storeStrong((id *)&self->_editingLongPressGesture, 0);
  objc_storeStrong((id *)&self->_pagingViewScrollPanGesture, 0);
  objc_storeStrong((id *)&self->_pagingViewDismissalTapGesture, 0);
  objc_storeStrong((id *)&self->_pagingViewDismissalPanGesture, 0);
  objc_storeStrong((id *)&self->_pagingViewDismissalFlickGesture, 0);
  objc_storeStrong((id *)&self->_headerPocketViewDismissalTapGesture, 0);
  objc_storeStrong((id *)&self->_headerPocketViewDismissalPanGesture, 0);
  objc_storeStrong((id *)&self->_presentationTouchIdentifiers, 0);
  objc_storeStrong((id *)&self->_compactLeadingStatusBar, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_headerPocketGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_headerPocketView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_editingAnimationRunner, 0);
  objc_storeStrong((id *)&self->_secondaryAnimationRunner, 0);
  objc_storeStrong((id *)&self->_primaryAnimationRunner, 0);

  objc_storeStrong((id *)&self->_presentationProvider, 0);
}

@end