@interface CKBrowserSwitcherViewController
- (BOOL)_currentPluginIsJellyfish;
- (BOOL)_hasLandscapeGutters;
- (BOOL)_pluginHasLiveBrowserViewInSwitcher:(id)a3;
- (BOOL)_shouldLimitExpandGestureToGrabber;
- (BOOL)_switchToVisiblePluginWithIdentifier:(id)a3;
- (BOOL)allowFooterLabelUpdates;
- (BOOL)allowPluginLaunchNotifications;
- (BOOL)browserIsCollapsingFromFullscreen;
- (BOOL)browserIsLoadingCompact;
- (BOOL)browserTransitionCoordinatorShouldDismissOnDragSuccess:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)insertedViaCollapse;
- (BOOL)interactiveExpandStarted;
- (BOOL)isBrowserReadyForUserInteraction;
- (BOOL)isBrowserSwitcherFirstLaunch;
- (BOOL)isDragging;
- (BOOL)isInDragAndDrop;
- (BOOL)isTransitioningExpandedState;
- (BOOL)isTransitioningFromSnapshotToLiveView;
- (BOOL)shouldAlwaysShowAppTitle;
- (BOOL)viewHasLaidOutSubviews;
- (CGRect)cachedCompactFrameInWindowCoordsForBrowserTransitionCoordinator:(id)a3;
- (CGRect)restingGrabberFrame;
- (CGSize)_browserSize;
- (CGSize)browserTransitionCoordinator:(id)a3 preferredSizeForBrowser:(id)a4;
- (CKAppGrabberView)grabberView;
- (CKBrowserSwitcherCell)cell;
- (CKBrowserSwitcherViewController)initWithConversation:(id)a3 sendDelegate:(id)a4 presentingViewController:(id)a5;
- (CKBrowserSwitcherViewControllerDelegate)delegate;
- (CKBrowserTransitionCoordinator)transitionCoordinator;
- (CKBrowserViewControllerProtocol)currentViewController;
- (IMBalloonPlugin)balloonPlugin;
- (IMBalloonPlugin)currentVisiblePlugin;
- (NSDate)timeOfLastScrollingDecelerationEnded;
- (NSMutableDictionary)livePluginIdentifierToTimestampMap;
- (UILongPressGestureRecognizer)touchTracker;
- (UIView)browserContainer;
- (UIView)contentView;
- (UIView)shadowView;
- (double)_rubberBandOffsetWithoutDecorationForOffset:(double)result maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6 outside:(BOOL *)a7;
- (double)browserTransitionCoordinatorCollapsedContentHeight:(id)a3;
- (double)restingContainerViewOriginY;
- (id)activeBrowserView;
- (id)appIconOverride;
- (id)appTitleOverride;
- (id)backdropView:(id)a3 willChangeToGraphicsQuality:(int64_t)a4;
- (id)performAfterFirstLayoutBlock;
- (id)traitCollection;
- (id)transitionsPresentationViewController;
- (unint64_t)supportedInterfaceOrientations;
- (void)_handleRemoteViewControllerConnectionInterrupted:(id)a3;
- (void)_handleVisibleSwitcherPluginsChanged:(id)a3;
- (void)_insertCurrentBrowserAndRemoveOldBrowsersIfNeeded;
- (void)_loadBrowserForBalloonPlugin:(id)a3 datasource:(id)a4;
- (void)_performAfterFirstLayout:(id)a3;
- (void)_removeBrowserFromViewHierarchy:(id)a3;
- (void)_removeBrowserWithPluginIdentifierFromViewHierarchy:(id)a3;
- (void)_snapshotCurrentViewController;
- (void)_transitionSnapshotViewToBrowserView;
- (void)_transitionSnapshotViewToBrowserViewAfterViewDidPrepareForDisplay:(id)a3;
- (void)_updateActiveBrowserAlphaStateOnInsertForCurrentController:(id)a3 currentView:(id)a4;
- (void)_updateActiveBrowserTimestampForCurrentBalloonPlugin;
- (void)_updateBrowserViewPositionForPluginAndInsertIfNecessary:(id)a3;
- (void)_updateCurrentBrowserSnapshotIfPossible;
- (void)_updateVisibleBrowserView;
- (void)animateInCompactWithCompletion:(id)a3;
- (void)animateOutCompactWithCompletion:(id)a3;
- (void)appGrabberViewCloseButtonTapped:(id)a3;
- (void)browserTransitionCoordinator:(id)a3 browserWillBecomeInactive:(id)a4;
- (void)browserTransitionCoordinator:(id)a3 didSwitchToPlugin:(id)a4;
- (void)browserTransitionCoordinator:(id)a3 didTransitionFromOrientation:(int64_t)a4 toOrientation:(int64_t)a5;
- (void)browserTransitionCoordinator:(id)a3 expandedStateDidChange:(BOOL)a4 withReason:(int64_t)a5;
- (void)browserTransitionCoordinator:(id)a3 hasUpdatedLastTouchDate:(id)a4;
- (void)browserTransitionCoordinator:(id)a3 willPresentBrowserModally:(id)a4;
- (void)browserTransitionCoordinatorDidCollapseOrDismiss:(id)a3 withReason:(int64_t)a4;
- (void)browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4;
- (void)browserTransitionCoordinatorWantsPresentationOfAppManager:(id)a3;
- (void)browserTransitionCoordinatorWantsPresentationOfAppStore:(id)a3;
- (void)browserTransitionCoordinatorWillCollapseOrDismiss:(id)a3 withReason:(int64_t)a4;
- (void)browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4;
- (void)cleanupExpandAnimatorState;
- (void)dealloc;
- (void)dismissBrowserFullscreenAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)dragManagerDidEndDragging:(id)a3;
- (void)dragManagerDidStartDrag:(id)a3;
- (void)dragManagerWillStartDrag:(id)a3;
- (void)expandGestureTouchMoved:(id)a3;
- (void)handleExpandButton:(id)a3;
- (void)layoutMarginsDidChange;
- (void)loadView;
- (void)reinsertAppGrabberViewForBrowserTransitionCoordinator:(id)a3;
- (void)reverseAndCleanupExpandAnimator;
- (void)saveSnapshotForCurrentBrowserViewControllerIfPossible;
- (void)setAllowFooterLabelUpdates:(BOOL)a3;
- (void)setAllowPluginLaunchNotifications:(BOOL)a3;
- (void)setBalloonPlugin:(id)a3;
- (void)setBrowserContainer:(id)a3;
- (void)setBrowserIsCollapsingFromFullscreen:(BOOL)a3;
- (void)setBrowserIsLoadingCompact:(BOOL)a3;
- (void)setBrowserViewReadyForUserInteraction:(BOOL)a3;
- (void)setCell:(id)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentViewController:(id)a3;
- (void)setCurrentVisiblePlugin:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDragging:(BOOL)a3;
- (void)setGrabberView:(id)a3;
- (void)setInDragAndDrop:(BOOL)a3;
- (void)setInsertedViaCollapse:(BOOL)a3;
- (void)setInteractiveExpandStarted:(BOOL)a3;
- (void)setLivePluginIdentifierToTimestampMap:(id)a3;
- (void)setPerformAfterFirstLayoutBlock:(id)a3;
- (void)setShadowView:(id)a3;
- (void)setTimeOfLastScrollingDecelerationEnded:(id)a3;
- (void)setTouchTracker:(id)a3;
- (void)setTransitionCoordinator:(id)a3;
- (void)setTransitioningExpandedState:(BOOL)a3;
- (void)setTransitioningFromSnapshotToLiveView:(BOOL)a3;
- (void)setViewHasLaidOutSubviews:(BOOL)a3;
- (void)setupPausedExpandAnimatorIfNeeded;
- (void)showBrowserFullscreenForPlugin:(id)a3 datasource:(id)a4;
- (void)showBrowserFullscreenModalForPlugin:(id)a3 datasource:(id)a4 preferredContentSize:(CGSize)a5;
- (void)showBrowserInSwitcherForPlugin:(id)a3 datasource:(id)a4 reloadData:(BOOL)a5;
- (void)stopExpandAnimatorAndCleanupState;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionToCollapsed;
- (void)transitionToFullscreen;
- (void)unloadRemoteViewControllers;
- (void)updateGrabberTitleAndIconForPlugin:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKBrowserSwitcherViewController

- (void)showBrowserFullscreenForPlugin:(id)a3 datasource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
  int v9 = [v8 isExpanded];

  if (v9)
  {
    id v15 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    [v15 expandedAppViewController:0 wantsToSwitchToPlugin:v7 datasource:v6];
  }
  else
  {
    [(CKBrowserSwitcherViewController *)self setBalloonPlugin:v7];
    [(CKBrowserSwitcherViewController *)self setCurrentVisiblePlugin:v7];
    v10 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    [v10 releaseOwnershipOfBrowserForConsumer:1];

    v11 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    int v12 = [v11 updateBrowserSessionForPlugin:v7 datasource:v6];

    if (!v12) {
      return;
    }
    v13 = [(CKBrowserSwitcherViewController *)self view];
    [v13 setNeedsLayout];

    v14 = [(CKBrowserSwitcherViewController *)self view];
    [v14 layoutIfNeeded];

    id v15 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    [v15 transitionCurrentBrowserToExpandedPresentationAnimated:1 completion:0];
  }
}

- (void)expandGestureTouchMoved:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 state];
  switch(v5)
  {
    case 3:
      self->_isDoingExpandInteraction = 0;
      if (self->_expandGestureStartedOnGrabber && !self->_expandInteractionDidMove
        || ([(UIViewPropertyAnimator *)self->_expandPropertyAnimator fractionComplete], v16 >= 1.0))
      {
        [(CKBrowserSwitcherViewController *)self stopExpandAnimatorAndCleanupState];
        [(CKBrowserSwitcherViewController *)self handleExpandButton:0];
      }
      else
      {
        [(CKBrowserSwitcherViewController *)self reverseAndCleanupExpandAnimator];
      }
      self->_expandInteractionDidMove = 0;
      break;
    case 2:
      if (![(CKBrowserSwitcherViewController *)self isDragging]
        && ![(CKBrowserSwitcherViewController *)self isInDragAndDrop])
      {
        expandGestureTracker = self->_expandGestureTracker;
        v18 = [(CKBrowserSwitcherViewController *)self view];
        [(CKImmediatePanGestureRecognizer *)expandGestureTracker translationInView:v18];
        double v41 = v19;
        double v21 = v20;

        v22 = +[CKUIBehavior sharedBehaviors];
        [v22 browserSwitcherExpandThreshold];
        double v24 = v23;

        v25 = [(CKBrowserSwitcherViewController *)self contentView];
        [v25 bounds];
        CGFloat v27 = v26;
        CGFloat v29 = v28;
        CGFloat v31 = v30;
        CGFloat v33 = v32;

        double v34 = v21 + self->_expandGestureTranslationOffset;
        v47.origin.CGFloat x = v27;
        v47.origin.CGFloat y = v29;
        v47.size.CGFloat width = v31;
        v47.size.CGFloat height = v33;
        double MaxY = CGRectGetMaxY(v47);
        v48.origin.CGFloat x = v27;
        v48.origin.CGFloat y = v29;
        v48.size.CGFloat width = v31;
        v48.size.CGFloat height = v33;
        [(CKBrowserSwitcherViewController *)self _rubberBandOffsetWithoutDecorationForOffset:0 maxOffset:v34 minOffset:MaxY range:-24.0 outside:CGRectGetHeight(v48)];
        if (v36 > 0.0) {
          double v36 = 0.0;
        }
        double v37 = v36 / v24;
        if (v37 < 0.0) {
          double v37 = -v37;
        }
        [(UIViewPropertyAnimator *)self->_expandPropertyAnimator setFractionComplete:v37];
        [(UIViewPropertyAnimator *)self->_expandPropertyAnimator fractionComplete];
        if (v38 > 0.0 && !self->_isDoingExpandInteraction)
        {
          self->_isDoingExpandInteraction = 1;
          id location = 0;
          objc_initWeak(&location, self);
          expandPropertyAnimator = self->_expandPropertyAnimator;
          v42[0] = MEMORY[0x1E4F143A8];
          v42[1] = 3221225472;
          v42[2] = __59__CKBrowserSwitcherViewController_expandGestureTouchMoved___block_invoke;
          v42[3] = &unk_1E5621B68;
          objc_copyWeak(&v43, &location);
          [(UIViewPropertyAnimator *)expandPropertyAnimator addCompletion:v42];
          objc_destroyWeak(&v43);
          objc_destroyWeak(&location);
        }
        if (v21 > 2.0 || v41 > 2.0) {
          self->_expandInteractionDidMove = 1;
        }
        [(UIViewPropertyAnimator *)self->_expandPropertyAnimator fractionComplete];
        if (v40 >= 1.0) {
          [(CKImmediatePanGestureRecognizer *)self->_expandGestureTracker finishCurrentInteraction];
        }
      }
      break;
    case 1:
      if (![(CKBrowserSwitcherViewController *)self isDragging]
        && ![(CKBrowserSwitcherViewController *)self isInDragAndDrop])
      {
        self->_expandInteractionDidMove = 0;
        self->_expandGestureStartedOnGrabber = 0;
        id v6 = [(CKBrowserSwitcherViewController *)self grabberView];
        [(CKImmediatePanGestureRecognizer *)self->_expandGestureTracker locationInView:v6];
        CGFloat v8 = v7;
        double v10 = v9;
        [v6 bounds];
        CGFloat x = v46.origin.x;
        CGFloat y = v46.origin.y;
        CGFloat width = v46.size.width;
        CGFloat height = v46.size.height;
        v45.CGFloat x = v8;
        v45.CGFloat y = v10;
        if (CGRectContainsPoint(v46, v45))
        {
          self->_expandGestureStartedOnGrabber = 1;
          double v15 = 0.0;
        }
        else
        {
          v49.origin.CGFloat x = x;
          v49.origin.CGFloat y = y;
          v49.size.CGFloat width = width;
          v49.size.CGFloat height = height;
          double v15 = v10 - CGRectGetMaxY(v49);
        }
        self->_expandGestureTranslationOffset = v15;
        [(CKBrowserSwitcherViewController *)self setupPausedExpandAnimatorIfNeeded];
      }
      break;
    default:
      self->_expandInteractionDidMove = 0;
      if (self->_isDoingExpandInteraction)
      {
        self->_isDoingExpandInteraction = 0;
        [(CKBrowserSwitcherViewController *)self reverseAndCleanupExpandAnimator];
      }
      break;
  }
}

- (void)showBrowserFullscreenModalForPlugin:(id)a3 datasource:(id)a4 preferredContentSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
  objc_msgSend(v11, "presentPluginFullScreenModal:datasource:preferredContentSize:animated:completion:", v10, v9, 1, 0, width, height);
}

- (void)_insertCurrentBrowserAndRemoveOldBrowsersIfNeeded
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v3 = [(CKBrowserSwitcherViewController *)self livePluginIdentifierToTimestampMap];
  id v4 = [v3 allKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v50 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v49 + 1) + 8 * i);
        id v9 = +[CKBalloonPluginManager sharedInstance];
        id v10 = [v9 existingViewControllerForPluginIdentifier:v8];

        if (v10)
        {
          id v11 = [(CKBrowserSwitcherViewController *)self currentViewController];
          BOOL v12 = v10 == v11;

          if (!v12 && ([v10 mayBeKeptInViewHierarchy] & 1) == 0) {
            [(CKBrowserSwitcherViewController *)self _removeBrowserWithPluginIdentifierFromViewHierarchy:v8];
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v5);
  }

  uint64_t v44 = 0;
  *(void *)&long long v13 = 138412290;
  long long v43 = v13;
  while (1)
  {
    v14 = [(CKBrowserSwitcherViewController *)self livePluginIdentifierToTimestampMap];
    unint64_t v15 = [v14 count];
    double v16 = +[CKUIBehavior sharedBehaviors];
    BOOL v17 = v15 > [v16 maxNumLiveBrowserViewsToKeepInViewHierarchy];

    if (!v17) {
      break;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v18 = [(CKBrowserSwitcherViewController *)self livePluginIdentifierToTimestampMap];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v55 count:16];
    if (v19)
    {
      double v20 = 0;
      double v21 = 0;
      uint64_t v22 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v46 != v22) {
            objc_enumerationMutation(v18);
          }
          double v24 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          v25 = [(CKBrowserSwitcherViewController *)self livePluginIdentifierToTimestampMap];
          double v26 = [v25 objectForKey:v24];

          if (!v21 || [v26 compare:v21] == -1)
          {
            id v27 = v26;

            id v28 = v24;
            double v20 = v28;
            double v21 = v27;
          }
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v45 objects:v55 count:16];
      }
      while (v19);

      if (v20) {
        [(CKBrowserSwitcherViewController *)self _removeBrowserWithPluginIdentifierFromViewHierarchy:v20];
      }
    }
    else
    {

      double v21 = 0;
      double v20 = 0;
    }
    if ((unint64_t)++v44 >= 2 && IMOSLoggingEnabled())
    {
      CGFloat v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v43;
        v54 = v20;
        _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_INFO, "CKBrowserSwitcherViewController: unexpectedly removing live browser for plugin %@", buf, 0xCu);
      }
    }
  }
  double v30 = [(CKBrowserSwitcherViewController *)self currentViewController];
  if (v30)
  {
    CGFloat v31 = [(CKBrowserSwitcherViewController *)self childViewControllers];
    double v32 = [(CKBrowserSwitcherViewController *)self currentViewController];
    char v33 = [v31 containsObject:v32];

    if ((v33 & 1) == 0)
    {
      double v34 = [(CKBrowserSwitcherViewController *)self currentViewController];
      [(CKBrowserSwitcherViewController *)self addChildViewController:v34];

      v35 = [(CKBrowserSwitcherViewController *)self currentViewController];
      double v36 = [v35 balloonPlugin];
      double v37 = [v36 identifier];

      if (([v37 isEqualToString:*MEMORY[0x1E4F6CBA0]] & 1) == 0
        && ([v37 isEqualToString:*MEMORY[0x1E4F6CB80]] & 1) == 0)
      {
        double v38 = [(CKBrowserSwitcherViewController *)self currentViewController];
        v39 = [(CKBrowserSwitcherViewController *)self activeBrowserView];
        [(CKBrowserSwitcherViewController *)self _updateActiveBrowserAlphaStateOnInsertForCurrentController:v38 currentView:v39];
      }
      double v40 = [(CKBrowserSwitcherViewController *)self currentViewController];
      double v41 = [v40 balloonPlugin];
      [(CKBrowserSwitcherViewController *)self _updateBrowserViewPositionForPluginAndInsertIfNecessary:v41];

      v42 = [(CKBrowserSwitcherViewController *)self currentViewController];
      [v42 didMoveToParentViewController:self];
    }
  }
}

void __60__CKBrowserSwitcherViewController_setCurrentViewController___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  int v3 = [v8 conformsToProtocol:&unk_1EDFCFEB0];
  id v4 = v8;
  if (v3)
  {
    id v5 = v8;
    id v6 = [*(id *)(a1 + 32) currentViewController];
    if (v6 == v5)
    {
      char v7 = objc_opt_respondsToSelector();

      if (v7) {
        [v5 browserScrolledOnScreen];
      }
    }
    else
    {
    }
    id v4 = v8;
  }
}

uint64_t __61__CKBrowserSwitcherViewController_dragManagerDidEndDragging___block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Switcher heard dragManagerDidEndDragging", v4, 2u);
    }
  }
  [*(id *)(a1 + 32) setInDragAndDrop:0];
  return [*(id *)(*(void *)(a1 + 32) + 976) setEnabled:1];
}

- (void)_loadBrowserForBalloonPlugin:(id)a3 datasource:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v6 identifier];
      *(_DWORD *)buf = 138412290;
      id v28 = v9;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Loading browser for plugin: %@", buf, 0xCu);
    }
  }
  id v10 = +[CKBalloonPluginManager sharedInstance];
  id v11 = [v10 visibleSwitcherPlugins];
  uint64_t v12 = [v11 indexOfObject:v6];

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (IMOSLoggingEnabled())
    {
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = [v6 identifier];
        *(_DWORD *)buf = 138412290;
        id v28 = v14;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Browser was not found for plugin: %@", buf, 0xCu);
      }
LABEL_9:
    }
  }
  else
  {
    unint64_t v15 = [(CKBrowserSwitcherViewController *)self currentViewController];

    if (v15)
    {
      double v16 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
      [v16 releaseOwnershipOfBrowserForConsumer:1];
    }
    [(CKBrowserSwitcherViewController *)self setBrowserIsLoadingCompact:1];
    BOOL v17 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    int v18 = [v17 updateBrowserSessionForPlugin:v6 datasource:v7];

    if (!v18)
    {
      [(CKBrowserSwitcherViewController *)self setCurrentViewController:0];
      if (!IMOSLoggingEnabled()) {
        goto LABEL_30;
      }
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "_loadBrowserForBalloonPlugin failed to update browser session", buf, 2u);
      }
      goto LABEL_9;
    }
    uint64_t v19 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    int v20 = [v19 wasCurrentBrowserExpanded];

    double v21 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    uint64_t v22 = [v21 requestOwnershipOfBrowserForConsumer:1];

    [(CKBrowserSwitcherViewController *)self setBrowserIsLoadingCompact:0];
    if (v20 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v22 viewWillTransitionToCompactPresentation];
    }
    if (v22)
    {
      double v23 = [v6 identifier];
      [(CKBrowserSwitcherViewController *)self _switchToVisiblePluginWithIdentifier:v23];

      [(CKBrowserSwitcherViewController *)self setCurrentViewController:v22];
      double v24 = [v22 balloonPlugin];
      [(CKBrowserSwitcherViewController *)self setCurrentVisiblePlugin:v24];

      if (v20)
      {
        if (objc_opt_respondsToSelector())
        {
          [v22 viewDidTransitionToCompactPresentation];
          if ([v22 isLoaded])
          {
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __75__CKBrowserSwitcherViewController__loadBrowserForBalloonPlugin_datasource___block_invoke;
            v26[3] = &unk_1E5620C40;
            v26[4] = self;
            [MEMORY[0x1E4F42FF0] performWithoutAnimation:v26];
          }
        }
      }
    }
    else
    {
      [(CKBrowserSwitcherViewController *)self setCurrentViewController:0];
      if (IMOSLoggingEnabled())
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "_loadBrowserForBalloonPlugin failed to acquire browser after load", buf, 2u);
        }
      }
    }
  }
LABEL_30:
}

- (unint64_t)supportedInterfaceOrientations
{
  int v3 = [(CKBrowserSwitcherViewController *)self balloonPlugin];
  id v4 = [v3 identifier];
  if ([v4 isEqualToString:*MEMORY[0x1E4F6CB80]])
  {

    unint64_t v5 = 2;
LABEL_9:

    return v5;
  }
  id v6 = [(CKBrowserSwitcherViewController *)self balloonPlugin];
  id v7 = [v6 identifier];
  char v8 = [v7 isEqualToString:*MEMORY[0x1E4F6CBA0]];

  if ((v8 & 1) == 0)
  {
    id v9 = [(CKBrowserSwitcherViewController *)self currentViewController];

    if (v9) {
      [(CKBrowserSwitcherViewController *)self currentViewController];
    }
    else {
    int v3 = +[CKUIBehavior sharedBehaviors];
    }
    unint64_t v5 = [v3 supportedInterfaceOrientations];
    goto LABEL_9;
  }
  return 2;
}

- (void)dragManagerWillStartDrag:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Switcher heard dragManagerWillStartDrag", v7, 2u);
    }
  }
  [(CKImmediatePanGestureRecognizer *)self->_expandGestureTracker setEnabled:0];
  [(UIViewPropertyAnimator *)self->_expandPropertyAnimator stopAnimation:1];
  [(UIViewPropertyAnimator *)self->_expandPropertyAnimator finishAnimationAtPosition:2];
  expandPropertyAnimator = self->_expandPropertyAnimator;
  self->_expandPropertyAnimator = 0;
}

void __72__CKBrowserSwitcherViewController__switchToVisiblePluginWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v9 = v6;
  char v8 = [v6 identifier];
  LODWORD(v7) = [v7 isEqualToString:v8];

  if (v7)
  {
    [*(id *)(a1 + 40) setBalloonPlugin:v9];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)CKBrowserSwitcherViewController;
  [(CKBrowserSwitcherViewController *)&v11 viewDidLoad];
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_dragManagerWillStartDrag_ name:@"CKBrowserDragManagerWillStartDraggingNotification" object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_dragManagerDidStartDrag_ name:@"CKBrowserDragManagerDidStartDraggingNotification" object:0];

  unint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel_dragManagerDidEndDragging_ name:@"CKBrowserDragManagerDidEndDraggingNotification" object:0];

  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 addObserver:self selector:sel__transitionSnapshotViewToBrowserViewAfterViewDidPrepareForDisplay_ name:@"CKMessageExtensionBrowserViewControllerDidPrepareForDisplay" object:0];

  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:self selector:sel__handleRemoteViewControllerConnectionInterrupted_ name:*MEMORY[0x1E4F6D348] object:0];

  char v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 addObserver:self selector:sel__handleRemoteViewControllerConnectionInterrupted_ name:@"CKRemoteViewFailedInstantiationNotification" object:0];

  id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v9 addObserver:self selector:sel_saveSnapshotForCurrentBrowserViewControllerIfPossible name:*MEMORY[0x1E4F43710] object:0];

  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 addObserver:self selector:sel__handleVisibleSwitcherPluginsChanged_ name:@"CKBrowserSelectionControllerVisibleSwitcherPluginsChangedNotification" object:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKBrowserSwitcherViewController;
  [(CKBrowserSwitcherViewController *)&v10 viewDidAppear:a3];
  id v4 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
  if ([v4 currentConsumer] != 1) {
    goto LABEL_4;
  }
  unint64_t v5 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
  if ([v5 isPresentingFullScreenModal])
  {

LABEL_4:
    goto LABEL_5;
  }
  id v7 = [(CKBrowserSwitcherViewController *)self currentViewController];
  int v8 = [v7 isLoaded];

  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49__CKBrowserSwitcherViewController_viewDidAppear___block_invoke;
    v9[3] = &unk_1E5620C40;
    v9[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v9];
  }
LABEL_5:
  [(CKBrowserSwitcherViewController *)self setInsertedViaCollapse:0];
  if (__CurrentTestName)
  {
    if (objc_opt_respondsToSelector())
    {
      id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v6 postNotificationName:@"PPTDidShowBrowserSwitcherViewController" object:self userInfo:0];
    }
  }
}

- (BOOL)shouldAlwaysShowAppTitle
{
  v2 = [(CKBrowserSwitcherViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 shouldAlwaysShowAppTitle];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)setBalloonPlugin:(id)a3
{
  double v21 = (IMBalloonPlugin *)a3;
  id v5 = (id)[(CKBrowserSwitcherViewController *)self view];
  id v6 = v21;
  if (self->_balloonPlugin != v21)
  {
    objc_storeStrong((id *)&self->_balloonPlugin, a3);
    id v7 = [(CKBrowserSwitcherViewController *)self cell];

    if (v7)
    {
      int v8 = [(CKBrowserSwitcherViewController *)self cell];
      [v8 removeFromSuperview];
    }
    id v9 = [CKBrowserSwitcherCell alloc];
    objc_super v10 = [(CKBrowserSwitcherViewController *)self browserContainer];
    [v10 bounds];
    objc_super v11 = -[CKBrowserSwitcherCell initWithFrame:](v9, "initWithFrame:");

    uint64_t v12 = [(IMBalloonPlugin *)v21 identifier];
    long long v13 = [(CKBrowserSwitcherViewController *)self browserContainer];
    v14 = [v13 traitCollection];
    uint64_t v15 = [v14 userInterfaceStyle];
    double v16 = [(CKBrowserSwitcherViewController *)self browserContainer];
    [v16 frame];
    BOOL v17 = +[CKSnapshotCacheKey keyWithIdentifier:interfaceStyle:bounds:](CKSnapshotCacheKey, "keyWithIdentifier:interfaceStyle:bounds:", v12, v15);

    [(CKBrowserSwitcherCell *)v11 setPlugin:v21 withSnapshotCacheKey:v17];
    int v18 = [(CKBrowserSwitcherViewController *)self browserContainer];
    [v18 addSubview:v11];

    [(CKBrowserSwitcherViewController *)self setCell:v11];
    uint64_t v19 = [(CKBrowserSwitcherViewController *)self view];
    [v19 setNeedsLayout];

    int v20 = [(CKBrowserSwitcherViewController *)self view];
    [v20 layoutIfNeeded];

    [(CKBrowserSwitcherViewController *)self _updateVisibleBrowserView];
    id v6 = v21;
  }
}

- (CKBrowserSwitcherViewController)initWithConversation:(id)a3 sendDelegate:(id)a4 presentingViewController:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CKBrowserSwitcherViewController;
  objc_super v11 = [(CKBrowserSwitcherViewController *)&v22 init];
  if (v11)
  {
    uint64_t v12 = objc_alloc_init(CKBrowserTransitionCoordinator);
    [(CKBrowserTransitionCoordinator *)v12 setConversation:v8];
    [(CKBrowserTransitionCoordinator *)v12 setSendDelegate:v9];
    [(CKBrowserTransitionCoordinator *)v12 setPresentingViewController:v10];
    [(CKBrowserSwitcherViewController *)v11 setTransitionCoordinator:v12];
    [(CKBrowserTransitionCoordinator *)v12 setDelegate:v11];
    [(CKBrowserSwitcherViewController *)v11 setBrowserViewReadyForUserInteraction:0];
    [(CKBrowserSwitcherViewController *)v11 setAllowFooterLabelUpdates:0];
    if (!v11->_livePluginIdentifierToTimestampMap)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      livePluginIdentifierToTimestampMap = v11->_livePluginIdentifierToTimestampMap;
      v11->_livePluginIdentifierToTimestampMap = (NSMutableDictionary *)Mutable;
    }
    [(CKBrowserSwitcherViewController *)v11 setTransitioningFromSnapshotToLiveView:0];
    [(CKBrowserSwitcherViewController *)v11 setAllowPluginLaunchNotifications:1];
    id location = 0;
    objc_initWeak(&location, v11);
    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v16 = [MEMORY[0x1E4F28F08] mainQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __94__CKBrowserSwitcherViewController_initWithConversation_sendDelegate_presentingViewController___block_invoke;
    v19[3] = &unk_1E5628738;
    objc_copyWeak(&v20, &location);
    id v17 = (id)[v15 addObserverForName:@"com.apple.messages.CKScreenTimeDidEnterCurrentAppRestrictionNotification" object:0 queue:v16 usingBlock:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v11;
}

- (void)browserTransitionCoordinatorWillCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  id v9 = a3;
  [(CKBrowserSwitcherViewController *)self setBrowserIsCollapsingFromFullscreen:1];
  if (a4 == 1) {
    [(CKBrowserSwitcherViewController *)self setInsertedViaCollapse:1];
  }
  id v6 = [(CKBrowserSwitcherViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CKBrowserSwitcherViewController *)self delegate];
    [v8 browserTransitionCoordinatorWillCollapseOrDismiss:v9 withReason:a4];
  }
}

- (void)browserTransitionCoordinatorWantsPresentationOfAppManager:(id)a3
{
  id v4 = [(CKBrowserSwitcherViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKBrowserSwitcherViewController *)self delegate];
    [v6 switcherViewControllerDidSelectAppManager:self shouldRestoreAppSwitcher:0];
  }
}

- (BOOL)browserTransitionCoordinatorShouldDismissOnDragSuccess:(id)a3
{
  id v4 = a3;
  char v5 = [(CKBrowserSwitcherViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v6 = [v5 browserTransitionCoordinatorShouldDismissOnDragSuccess:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (double)browserTransitionCoordinatorCollapsedContentHeight:(id)a3
{
  id v4 = a3;
  char v5 = [(CKBrowserSwitcherViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 browserTransitionCoordinatorCollapsedContentHeight:v4];
    double v7 = v6;
  }
  else
  {
    +[CKInputView defaultContentSize];
    double v7 = v8;
  }

  return v7;
}

- (CGSize)_browserSize
{
  char v3 = [(CKBrowserSwitcherViewController *)self browserContainer];
  if (v3) {
    [(CKBrowserSwitcherViewController *)self browserContainer];
  }
  else {
  id v4 = [(CKBrowserSwitcherViewController *)self contentView];
  }
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)dealloc
{
  [(CKBrowserSwitcherViewController *)self unloadRemoteViewControllers];
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id v4 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
  [v4 setDelegate:0];

  double v5 = [MEMORY[0x1E4F42738] sharedApplication];
  [v5 setIdleTimerDisabled:0];

  [(UIViewPropertyAnimator *)self->_expandPropertyAnimator stopAnimation:1];
  v6.receiver = self;
  v6.super_class = (Class)CKBrowserSwitcherViewController;
  [(CKBrowserSwitcherViewController *)&v6 dealloc];
}

void __94__CKBrowserSwitcherViewController_initWithConversation_sendDelegate_presentingViewController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v5 = [WeakRetained balloonPlugin];
  objc_super v6 = [v5 appBundle];
  double v7 = [v6 bundleIdentifier];

  if (IMOSLoggingEnabled())
  {
    double v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      double v10 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Downtime will show blocking shield notification received. Tearing down currently displayed MessageApp with bundleID: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [WeakRetained appGrabberViewCloseButtonTapped:0];
}

- (void)loadView
{
  v40.receiver = self;
  v40.super_class = (Class)CKBrowserSwitcherViewController;
  [(CKBrowserSwitcherViewController *)&v40 loadView];
  id v3 = [_CKBrowserSwitcherView alloc];
  id v4 = [(CKBrowserSwitcherViewController *)self view];
  [v4 frame];
  double v5 = -[_CKBrowserSwitcherView initWithFrame:](v3, "initWithFrame:");

  objc_super v6 = [(CKBrowserSwitcherViewController *)self view];
  -[_CKBrowserSwitcherView setAutoresizingMask:](v5, "setAutoresizingMask:", [v6 autoresizingMask]);

  [(CKBrowserSwitcherViewController *)self setView:v5];
  [(_CKBrowserSwitcherView *)v5 bounds];
  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v7, v8, v9, v10);
  [(CKBrowserSwitcherViewController *)self setContentView:v11];
  uint64_t v12 = [(CKBrowserSwitcherViewController *)self view];
  [v12 addSubview:v11];

  [v11 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  [(CKBrowserSwitcherViewController *)self restingContainerViewOriginY];
  double v20 = v19;
  double v21 = v18 - v19;
  objc_super v22 = +[CKUIBehavior sharedBehaviors];
  [v22 browserSwitcherExpandThreshold];
  double v24 = v21 + v23;

  v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v14, v20, v16, v24);
  double v26 = +[CKUIBehavior sharedBehaviors];
  id v27 = [v26 theme];
  id v28 = [v27 browserSwitcherGutterColor];
  [v25 setBackgroundColor:v28];

  [v25 setAccessibilityIdentifier:@"appBrowserSwitcherIdentifier"];
  [v25 setSemanticContentAttribute:3];
  [(CKBrowserSwitcherViewController *)self setBrowserContainer:v25];
  [v11 addSubview:v25];
  uint64_t v29 = [(CKBrowserSwitcherViewController *)self grabberView];
  [v11 addSubview:v29];

  double v30 = [[CKImmediatePanGestureRecognizer alloc] initWithTarget:self action:sel_expandGestureTouchMoved_];
  expandGestureTracker = self->_expandGestureTracker;
  self->_expandGestureTracker = v30;

  [(CKImmediatePanGestureRecognizer *)self->_expandGestureTracker setDelegate:self];
  [(CKImmediatePanGestureRecognizer *)self->_expandGestureTracker setDelaysTouchesEnded:0];
  [(CKImmediatePanGestureRecognizer *)self->_expandGestureTracker setCancelsTouchesInView:0];
  [(CKImmediatePanGestureRecognizer *)self->_expandGestureTracker setDelaysTouchesBegan:0];
  [(_CKBrowserSwitcherView *)v5 addGestureRecognizer:self->_expandGestureTracker];
  id v32 = objc_alloc_init(MEMORY[0x1E4F42B70]);
  [v32 setMinimumPressDuration:0.0];
  [v32 setCancelsTouchesInView:0];
  [v32 setDelaysTouchesBegan:0];
  [v32 setDelaysTouchesEnded:0];
  [v32 setDelegate:self];
  [v25 addGestureRecognizer:v32];
  [(CKBrowserSwitcherViewController *)self setTouchTracker:v32];
  if (IMIsRunningIniMessageAppsViewService())
  {
    id v33 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
    [(CKBrowserSwitcherViewController *)self setShadowView:v33];

    double v34 = [(CKBrowserSwitcherViewController *)self shadowView];
    v35 = [v34 layer];
    [v35 setShadowRadius:4.0];

    double v36 = [(CKBrowserSwitcherViewController *)self shadowView];
    double v37 = [v36 layer];
    objc_msgSend(v37, "setShadowOffset:", 0.0, -6.0);

    double v38 = [(CKBrowserSwitcherViewController *)self view];
    v39 = [(CKBrowserSwitcherViewController *)self shadowView];
    [v38 insertSubview:v39 atIndex:0];
  }
}

- (id)activeBrowserView
{
  v2 = [(CKBrowserSwitcherViewController *)self currentViewController];
  id v3 = [v2 view];

  return v3;
}

- (void)viewDidLayoutSubviews
{
  v99.receiver = self;
  v99.super_class = (Class)CKBrowserSwitcherViewController;
  [(CKBrowserSwitcherViewController *)&v99 viewDidLayoutSubviews];
  id v3 = [(CKBrowserSwitcherViewController *)self view];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(CKBrowserSwitcherViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;

  double v13 = v7 + v5;
  if ([(CKBrowserSwitcherViewController *)self _hasLandscapeGutters])
  {
    double v14 = [(CKBrowserSwitcherViewController *)self view];
    [v14 setBackgroundColor:0];
  }
  double v15 = v5 + v10;
  double v16 = v12 - v13;
  double v17 = [(CKBrowserSwitcherViewController *)self grabberView];
  double v18 = [(CKBrowserSwitcherViewController *)self contentView];
  int v19 = [v17 isDescendantOfView:v18];

  if (v19)
  {
    [(CKBrowserSwitcherViewController *)self restingGrabberFrame];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    id v28 = [(CKBrowserSwitcherViewController *)self grabberView];
    objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

    uint64_t v29 = [(CKBrowserSwitcherViewController *)self grabberView];
    [v29 frame];
    double v31 = v30;
    id v32 = [(CKBrowserSwitcherViewController *)self browserContainer];
    [v32 frame];
    double v34 = v31 + v33;

    v35 = [(CKBrowserSwitcherViewController *)self grabberView];
    [v35 frame];
    double v37 = v36;
    double v39 = v38;
    objc_super v40 = [(CKBrowserSwitcherViewController *)self grabberView];
    [v40 frame];
    double v42 = v41;
    long long v43 = [(CKBrowserSwitcherViewController *)self shadowView];
    objc_msgSend(v43, "setFrame:", v37, v39, v42, v34);

    uint64_t v44 = (void *)MEMORY[0x1E4F427D0];
    long long v45 = [(CKBrowserSwitcherViewController *)self shadowView];
    [v45 frame];
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    uint64_t v54 = UIRectCornersAtEdges();
    [(CKAppGrabberView *)self->_grabberView _cornerRadius];
    double v56 = v55;
    [(CKAppGrabberView *)self->_grabberView _cornerRadius];
    objc_msgSend(v44, "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", v54, v47, v49, v51, v53, v56, v57);
    id v58 = objc_claimAutoreleasedReturnValue();
    uint64_t v59 = [v58 CGPath];
    v60 = [(CKBrowserSwitcherViewController *)self shadowView];
    v61 = [v60 layer];
    [v61 setShadowPath:v59];
  }
  else
  {
    long long v45 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    [(CKBrowserSwitcherViewController *)self cachedCompactFrameInWindowCoordsForBrowserTransitionCoordinator:v45];
    double v63 = v62;
    double v65 = v64;
    double v67 = v66;
    double v69 = v68;
    id v58 = [(CKBrowserSwitcherViewController *)self shadowView];
    objc_msgSend(v58, "setFrame:", v63, v65, v67, v69);
  }

  +[CKAppGrabberView compactRoundedCornerRadius];
  BOOL v71 = v70 <= 0.0;
  double v72 = 0.06;
  if (v71) {
    double v72 = 0.0;
  }
  float v73 = v72;
  v74 = [(CKBrowserSwitcherViewController *)self shadowView];
  v75 = [v74 layer];
  *(float *)&double v76 = v73;
  [v75 setShadowOpacity:v76];

  v77 = [(CKBrowserSwitcherViewController *)self contentView];
  v78 = [(CKBrowserSwitcherViewController *)self view];
  [v78 bounds];
  objc_msgSend(v77, "setFrame:");

  v79 = [(CKBrowserSwitcherViewController *)self contentView];
  [v79 bounds];
  double v81 = v80;

  [(CKBrowserSwitcherViewController *)self restingContainerViewOriginY];
  double v83 = v82;
  double v84 = v81 - v82;
  v85 = +[CKUIBehavior sharedBehaviors];
  [v85 browserSwitcherExpandThreshold];
  double v87 = v84 + v86;

  v88 = [(CKBrowserSwitcherViewController *)self browserContainer];
  objc_msgSend(v88, "setFrame:", v15, v83, v16, v87);

  v89 = [(CKBrowserSwitcherViewController *)self cell];
  v90 = [(CKBrowserSwitcherViewController *)self browserContainer];
  [v90 bounds];
  objc_msgSend(v89, "setFrame:");

  uint64_t v91 = [(CKBrowserSwitcherViewController *)self currentViewController];
  if (v91)
  {
    v92 = (void *)v91;
    v93 = [(CKBrowserSwitcherViewController *)self activeBrowserView];
    [v93 frame];
    BOOL v94 = CGRectEqualToRect(v100, *MEMORY[0x1E4F1DB28]);

    if (v94)
    {
      v95 = [(CKBrowserSwitcherViewController *)self currentViewController];
      v96 = [v95 balloonPlugin];
      [(CKBrowserSwitcherViewController *)self _updateBrowserViewPositionForPluginAndInsertIfNecessary:v96];
    }
  }
  [(CKBrowserSwitcherViewController *)self setViewHasLaidOutSubviews:1];
  v97 = [(CKBrowserSwitcherViewController *)self performAfterFirstLayoutBlock];

  if (v97)
  {
    v98 = [(CKBrowserSwitcherViewController *)self performAfterFirstLayoutBlock];
    v98[2]();

    [(CKBrowserSwitcherViewController *)self setPerformAfterFirstLayoutBlock:0];
  }
}

- (BOOL)isBrowserSwitcherFirstLaunch
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v3 = [v2 BOOLForKey:@"BrowserSwitcherFirstLaunch"];

  if ((v3 & 1) == 0)
  {
    double v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setBool:1 forKey:@"BrowserSwitcherFirstLaunch"];
  }
  return v3 ^ 1;
}

- (void)layoutMarginsDidChange
{
  if (IMOSLoggingEnabled())
  {
    char v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v5 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Layout margins changed, calling setNeedsLayout", v5, 2u);
    }
  }
  double v4 = [(CKBrowserSwitcherViewController *)self view];
  [v4 setNeedsLayout];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKBrowserSwitcherViewController;
  [(CKBrowserSwitcherViewController *)&v7 viewWillAppear:a3];
  double v4 = [(CKBrowserSwitcherViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(CKBrowserSwitcherViewController *)self delegate];
    [v6 switcherViewControllerWillAppear:self];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CKBrowserSwitcherViewController;
  [(CKBrowserSwitcherViewController *)&v10 viewWillDisappear:a3];
  double v4 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
  if ([v4 currentConsumer] == 1)
  {
    char v5 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    char v6 = [v5 isPresentingFullScreenModal];

    if ((v6 & 1) == 0) {
      [(CKBrowserSwitcherViewController *)self _updateCurrentBrowserSnapshotIfPossible];
    }
  }
  else
  {
  }
  objc_super v7 = [(CKBrowserSwitcherViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    double v9 = [(CKBrowserSwitcherViewController *)self delegate];
    [v9 switcherViewControllerWillDisappear:self];
  }
}

uint64_t __49__CKBrowserSwitcherViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionSnapshotViewToBrowserView];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKBrowserSwitcherViewController;
  [(CKBrowserSwitcherViewController *)&v4 viewDidDisappear:a3];
  [(CKBrowserSwitcherViewController *)self setAllowFooterLabelUpdates:0];
  [(CKBrowserSwitcherViewController *)self stopExpandAnimatorAndCleanupState];
}

- (void)transitionToFullscreen
{
  if (![(CKBrowserSwitcherViewController *)self isTransitioningExpandedState])
  {
    char v3 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    uint64_t v4 = [v3 currentConsumer];

    if (v4 != 2)
    {
      [(CKBrowserSwitcherViewController *)self setTransitioningExpandedState:1];
      char v5 = [(CKBrowserSwitcherViewController *)self currentViewController];

      if (v5)
      {
        if (self->_expandPropertyAnimator) {
          [(CKBrowserSwitcherViewController *)self stopExpandAnimatorAndCleanupState];
        }
        id location = 0;
        objc_initWeak(&location, self);
        char v6 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
        [v6 releaseOwnershipOfBrowserForConsumer:1];

        objc_super v7 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __57__CKBrowserSwitcherViewController_transitionToFullscreen__block_invoke;
        v8[3] = &unk_1E56215C8;
        objc_copyWeak(&v9, &location);
        [v7 transitionCurrentBrowserToExpandedPresentationAnimated:1 completion:v8];

        objc_destroyWeak(&v9);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __57__CKBrowserSwitcherViewController_transitionToFullscreen__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = [WeakRetained view];
  [v3 setNeedsLayout];

  id v4 = objc_loadWeakRetained(v1);
  [v4 setTransitioningExpandedState:0];
}

- (void)transitionToCollapsed
{
  if (![(CKBrowserSwitcherViewController *)self isTransitioningExpandedState])
  {
    [(CKBrowserSwitcherViewController *)self setTransitioningExpandedState:1];
    id location = 0;
    objc_initWeak(&location, self);
    uint64_t v7 = MEMORY[0x1E4F143A8];
    uint64_t v8 = 3221225472;
    id v9 = __56__CKBrowserSwitcherViewController_transitionToCollapsed__block_invoke;
    objc_super v10 = &unk_1E56215C8;
    objc_copyWeak(&v11, &location);
    char v3 = _Block_copy(&v7);
    id v4 = [(CKBrowserSwitcherViewController *)self balloonPlugin];
    int v5 = [v4 shouldHideAppSwitcher];

    if (v5)
    {
      [(CKBrowserSwitcherViewController *)self dismissBrowserFullscreenAnimated:1 withCompletion:v3];
    }
    else
    {
      char v6 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
      [v6 transitionCurrentBrowserToCollapsedPresentationAnimated:1 completion:v3];
    }
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __56__CKBrowserSwitcherViewController_transitionToCollapsed__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setTransitioningExpandedState:0];
}

- (CGSize)browserTransitionCoordinator:(id)a3 preferredSizeForBrowser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v9 = *MEMORY[0x1E4F1DB30];
  double v8 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ([(CKBrowserSwitcherViewController *)self viewHasLaidOutSubviews]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_super v10 = [(CKBrowserSwitcherViewController *)self delegate];
    double v11 = v8;
    double v12 = v9;
    if (objc_opt_respondsToSelector())
    {
      [v10 browserTransitionCoordinator:v6 preferredSizeForBrowser:v7];
      double v12 = v13;
      double v11 = v14;
    }
    BOOL v15 = v12 == v9 && v11 == v8;
    if (v15 && [(CKBrowserSwitcherViewController *)self browserIsLoadingCompact])
    {
      double v16 = [(CKBrowserSwitcherViewController *)self browserContainer];
      [v16 bounds];
      double v12 = v17;
      double v11 = v18;
    }
    double v8 = v11;
    double v9 = v12;
  }

  double v19 = v9;
  double v20 = v8;
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (void)browserTransitionCoordinator:(id)a3 willPresentBrowserModally:(id)a4
{
  id v8 = a4;
  int v5 = [(CKBrowserSwitcherViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CKBrowserSwitcherViewController *)self delegate];
    [v7 switcherViewController:self willPresentBrowserModally:v8];
  }
}

- (void)browserTransitionCoordinator:(id)a3 didTransitionFromOrientation:(int64_t)a4 toOrientation:(int64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  char v6 = [(CKBrowserSwitcherViewController *)self livePluginIdentifierToTimestampMap];
  id v7 = [v6 allKeys];

  obuint64_t j = v7;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * v11);
        double v13 = +[CKBalloonPluginManager sharedInstance];
        double v14 = [v13 existingViewControllerForPluginIdentifier:v12];

        if (objc_opt_respondsToSelector()) {
          [v14 didTransitionFromOrientation:a4 toOrientation:a5];
        }
        BOOL v15 = [(CKBrowserSwitcherViewController *)self balloonPlugin];
        double v16 = [v15 identifier];
        char v17 = [v16 isEqualToString:v12];

        if ((v17 & 1) == 0) {
          [(CKBrowserSwitcherViewController *)self _removeBrowserWithPluginIdentifierFromViewHierarchy:v12];
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  uint64_t v8 = [(CKBrowserSwitcherViewController *)self currentViewController];
  objc_msgSend(v8, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__CKBrowserSwitcherViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E5621550;
  v9[4] = self;
  [v7 animateAlongsideTransition:v9 completion:0];
}

void __86__CKBrowserSwitcherViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) childViewControllers];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__CKBrowserSwitcherViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v3[3] = &unk_1E562B360;
  v3[4] = *(void *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v3];
}

void __86__CKBrowserSwitcherViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 conformsToProtocol:&unk_1EDFCFEB0])
  {
    char v3 = [v4 balloonPlugin];
    [*(id *)(a1 + 32) _updateBrowserViewPositionForPluginAndInsertIfNecessary:v3];
  }
}

- (void)reinsertAppGrabberViewForBrowserTransitionCoordinator:(id)a3
{
  id v9 = [(CKBrowserSwitcherViewController *)self grabberView];
  id v4 = [(CKBrowserSwitcherViewController *)self contentView];
  char v5 = [v9 isDescendantOfView:v4];

  if ((v5 & 1) == 0)
  {
    char v6 = [(CKBrowserSwitcherViewController *)self contentView];
    [v6 addSubview:v9];

    [v9 setDelegate:self];
    id v7 = [(CKBrowserSwitcherViewController *)self view];
    [v7 setNeedsLayout];

    uint64_t v8 = [(CKBrowserSwitcherViewController *)self view];
    [v8 layoutIfNeeded];
  }
}

- (CGRect)cachedCompactFrameInWindowCoordsForBrowserTransitionCoordinator:(id)a3
{
  id v4 = [(CKBrowserSwitcherViewController *)self browserContainer];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CKBrowserSwitcherViewController *)self restingContainerViewOriginY];
  double v12 = v11;
  double v13 = [v4 superview];
  objc_msgSend(v13, "convertRect:toView:", 0, v6, v12, v8, v10);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.double height = v25;
  result.size.double width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (void)dismissBrowserFullscreenAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [(CKBrowserSwitcherViewController *)self setCurrentViewController:0];
  id v7 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
  [v7 dismissCurrentExpandedBrowserAnimated:v4 completion:v6];
}

- (CGRect)restingGrabberFrame
{
  char v3 = [(CKBrowserSwitcherViewController *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(CKBrowserSwitcherViewController *)self view];
  [v8 safeAreaInsets];
  double v10 = v9;
  double v12 = v11;

  double v13 = +[CKUIBehavior sharedBehaviors];
  int v14 = [v13 isAppStripInKeyboard];

  double v15 = 0.0;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E4F42B08], "__ck_appStripVerticalPadding");
    double v15 = v16;
  }
  double v17 = [(CKBrowserSwitcherViewController *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0
    && ([(CKBrowserSwitcherViewController *)self delegate],
        double v19 = objc_claimAutoreleasedReturnValue(),
        char v20 = [v19 switcherViewControllerShouldShowIconAndTitleWhenCompact:self],
        v19,
        (v20 & 1) != 0))
  {
    double v21 = +[CKUIBehavior sharedBehaviors];
    [v21 browserSwitcherExpandedGrabberHeaderHeight];
  }
  else
  {
    double v21 = +[CKUIBehavior sharedBehaviors];
    [v21 browserSwitcherCollapsedGrabberHeaderHeight];
  }
  double v23 = v22;

  double v24 = v5 + v10;
  double v25 = v7 - (v10 + v12);
  double v26 = v15;
  double v27 = v23;
  result.size.double height = v27;
  result.size.double width = v25;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v24;
  return result;
}

- (double)restingContainerViewOriginY
{
  [(CKBrowserSwitcherViewController *)self restingGrabberFrame];
  double v3 = v2;
  double v5 = v4;
  double v6 = +[CKUIBehavior sharedBehaviors];
  int v7 = [v6 isAppStripInKeyboard];

  double v8 = -0.0;
  if (v7) {
    double v8 = v3;
  }
  return v5 + v8;
}

- (double)_rubberBandOffsetWithoutDecorationForOffset:(double)result maxOffset:(double)a4 minOffset:(double)a5 range:(double)a6 outside:(BOOL *)a7
{
  if (a5 >= a4) {
    a4 = a5;
  }
  if (fabs(a6) >= 2.22044605e-16)
  {
    if (a4 < result)
    {
      CGRect result = a4 + (1.0 - 1.0 / ((result - a4) / a6 * 0.55 + 1.0)) * a6;
      if (!a7) {
        return result;
      }
LABEL_9:
      *a7 = 1;
      return result;
    }
    if (result < a5)
    {
      CGRect result = a5 - (1.0 - 1.0 / ((a5 - result) / a6 * 0.55 + 1.0)) * a6;
      if (a7) {
        goto LABEL_9;
      }
    }
  }
  return result;
}

- (void)setupPausedExpandAnimatorIfNeeded
{
  if (!self->_expandPropertyAnimator)
  {
    double v3 = +[CKUIBehavior sharedBehaviors];
    [v3 browserSwitcherExpandThreshold];
    double v5 = -v4;

    double v6 = [(CKBrowserSwitcherViewController *)self grabberView];
    int v7 = [(CKBrowserSwitcherViewController *)self browserContainer];
    char v8 = [v6 roundsTopCorners];
    id v9 = objc_alloc(MEMORY[0x1E4F43008]);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __68__CKBrowserSwitcherViewController_setupPausedExpandAnimatorIfNeeded__block_invoke;
    v24[3] = &unk_1E5625168;
    id v10 = v6;
    double v28 = v5;
    id v25 = v10;
    double v26 = self;
    id v11 = v7;
    id v27 = v11;
    double v12 = (UIViewPropertyAnimator *)[v9 initWithDuration:v24 dampingRatio:0.25 animations:1.0];
    expandPropertyAnimator = self->_expandPropertyAnimator;
    self->_expandPropertyAnimator = v12;

    id location = 0;
    objc_initWeak(&location, self);
    int v14 = self->_expandPropertyAnimator;
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    char v18 = __68__CKBrowserSwitcherViewController_setupPausedExpandAnimatorIfNeeded__block_invoke_2;
    double v19 = &unk_1E56281B8;
    objc_copyWeak(&v21, &location);
    id v15 = v10;
    id v20 = v15;
    char v22 = v8;
    [(UIViewPropertyAnimator *)v14 addCompletion:&v16];
    [(UIViewPropertyAnimator *)self->_expandPropertyAnimator pauseAnimation];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

uint64_t __68__CKBrowserSwitcherViewController_setupPausedExpandAnimatorIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  [*(id *)(a1 + 32) visualOriginYInView:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v3, *(double *)(a1 + 56) - v8, v5, v7);
  [*(id *)(*(void *)(a1 + 40) + 1112) frame];
  double v10 = v9;
  [*(id *)(a1 + 32) frame];
  [*(id *)(*(void *)(a1 + 40) + 1112) setFrame:v10];
  [*(id *)(a1 + 32) setRoundsTopCorners:1];
  [*(id *)(a1 + 48) frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [*(id *)(a1 + 32) frame];
  double MaxY = CGRectGetMaxY(v21);
  char v18 = *(void **)(a1 + 48);

  return objc_msgSend(v18, "setFrame:", v12, MaxY, v14, v16);
}

void __68__CKBrowserSwitcherViewController_setupPausedExpandAnimatorIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v6 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = (void *)WeakRetained[123];
    WeakRetained[123] = 0;

    id WeakRetained = v6;
  }
  if (a2 == 1)
  {
    [*(id *)(a1 + 32) setRoundsTopCorners:*(unsigned __int8 *)(a1 + 48)];
    id WeakRetained = v6;
  }
}

- (void)stopExpandAnimatorAndCleanupState
{
  [(UIViewPropertyAnimator *)self->_expandPropertyAnimator stopAnimation:1];

  [(CKBrowserSwitcherViewController *)self cleanupExpandAnimatorState];
}

- (void)cleanupExpandAnimatorState
{
  expandPropertyAnimator = self->_expandPropertyAnimator;
  self->_expandPropertyAnimator = 0;

  self->_isDoingExpandInteraction = 0;
}

- (void)reverseAndCleanupExpandAnimator
{
  [(UIViewPropertyAnimator *)self->_expandPropertyAnimator setReversed:1];
  expandPropertyAnimator = self->_expandPropertyAnimator;

  [(UIViewPropertyAnimator *)expandPropertyAnimator startAnimation];
}

void __59__CKBrowserSwitcherViewController_expandGestureTouchMoved___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cleanupExpandAnimatorState];
}

- (void)setBrowserViewReadyForUserInteraction:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_browserViewReadyForUserInteraction != a3)
  {
    BOOL v3 = a3;
    if (IMOSLoggingEnabled())
    {
      double v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        double v6 = @"YES";
        if (self->_browserViewReadyForUserInteraction) {
          double v7 = @"YES";
        }
        else {
          double v7 = @"NO";
        }
        if (!v3) {
          double v6 = @"NO";
        }
        int v11 = 138412546;
        double v12 = v7;
        __int16 v13 = 2112;
        double v14 = v6;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "_browserViewReadyForUserInteraction changing from %@ to %@", (uint8_t *)&v11, 0x16u);
      }
    }
    self->_browserViewReadyForUserInteraction = v3;
    double v8 = [(CKBrowserSwitcherViewController *)self currentViewController];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      double v10 = [(CKBrowserSwitcherViewController *)self currentViewController];
      [v10 endDisablingUserInteraction];
    }
  }
}

- (void)browserTransitionCoordinator:(id)a3 expandedStateDidChange:(BOOL)a4 withReason:(int64_t)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [(CKBrowserSwitcherViewController *)self setInteractiveExpandStarted:0];
  if (a5 != 1 || v6)
  {
    int v16 = IMOSLoggingEnabled();
    if (v6)
    {
      if (v16)
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v20 = 0;
          _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "Browser went expanded, nil out the currentViewController.", v20, 2u);
        }
      }
      [(CKBrowserSwitcherViewController *)self setCurrentViewController:0];
    }
    else if (v16)
    {
      char v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v20 = 0;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Browser went compact with keyboard launch context, but is currently owned by someone else!", v20, 2u);
      }
    }
  }
  else
  {
    char v9 = [v8 requestOwnershipOfBrowserForConsumer:1];
    double v10 = v9;
    if (v9)
    {
      int v11 = [v9 balloonPlugin];
      double v12 = +[CKBalloonPluginManager sharedInstance];
      __int16 v13 = [v12 visibleSwitcherPlugins];
      uint64_t v14 = [v13 indexOfObject:v11];

      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v8 releaseOwnershipOfBrowserForConsumer:1];
        if (IMOSLoggingEnabled())
        {
          uint64_t v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v20 = 0;
            _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Attempted browser re-insert after collapse, but browser is not in visiblePlugins!", v20, 2u);
          }
        }
      }
      else
      {
        [(CKBrowserSwitcherViewController *)self setCurrentViewController:v10];
        if ([v10 isLoaded])
        {
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __98__CKBrowserSwitcherViewController_browserTransitionCoordinator_expandedStateDidChange_withReason___block_invoke;
          v21[3] = &unk_1E5620C40;
          v21[4] = self;
          [MEMORY[0x1E4F42FF0] performWithoutAnimation:v21];
        }
      }
    }
    double v19 = [(CKBrowserSwitcherViewController *)self delegate];
    [v19 switcherViewControllerDidCollapse:self];
  }
}

uint64_t __98__CKBrowserSwitcherViewController_browserTransitionCoordinator_expandedStateDidChange_withReason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionSnapshotViewToBrowserView];
}

- (void)browserTransitionCoordinator:(id)a3 browserWillBecomeInactive:(id)a4
{
}

- (void)browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  id v9 = a3;
  BOOL v6 = [(CKBrowserSwitcherViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CKBrowserSwitcherViewController *)self delegate];
    [v8 browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:v9 withReason:a4];
  }
}

- (void)browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  id v9 = a3;
  BOOL v6 = [(CKBrowserSwitcherViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CKBrowserSwitcherViewController *)self delegate];
    [v8 browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:v9 withReason:a4];
  }
}

- (void)browserTransitionCoordinatorDidCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  id v9 = a3;
  BOOL v6 = [(CKBrowserSwitcherViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CKBrowserSwitcherViewController *)self delegate];
    [v8 browserTransitionCoordinatorDidCollapseOrDismiss:v9 withReason:a4];
  }
  [(CKBrowserSwitcherViewController *)self setBrowserIsCollapsingFromFullscreen:0];
}

- (void)browserTransitionCoordinatorWantsPresentationOfAppStore:(id)a3
{
  double v4 = [(CKBrowserSwitcherViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKBrowserSwitcherViewController *)self delegate];
    [v6 switcherViewControllerDidSelectAppStore:self shouldRestoreAppSwitcher:0];
  }
}

- (void)browserTransitionCoordinator:(id)a3 didSwitchToPlugin:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CKBrowserSwitcherViewController *)self setBalloonPlugin:v6];
  [(CKBrowserSwitcherViewController *)self setCurrentVisiblePlugin:v6];

  [(CKBrowserSwitcherViewController *)self setBrowserViewReadyForUserInteraction:1];
  id v10 = [(CKBrowserSwitcherViewController *)self delegate];
  id v8 = [v7 expandedAppViewController];

  id v9 = [v8 contentViewController];
  [v10 switcherViewControllerDidFinishSwitching:self toViewController:v9];
}

- (void)browserTransitionCoordinator:(id)a3 hasUpdatedLastTouchDate:(id)a4
{
  id v8 = a4;
  char v5 = [(CKBrowserSwitcherViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CKBrowserSwitcherViewController *)self delegate];
    [v7 switcherViewController:self hasUpdatedLastTouchDate:v8];
  }
}

- (id)transitionsPresentationViewController
{
  double v2 = [(CKBrowserSwitcherViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [v2 transitionsPresentationViewController];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)appTitleOverride
{
  double v2 = [(CKBrowserSwitcherViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [v2 appTitleOverride];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)appIconOverride
{
  double v2 = [(CKBrowserSwitcherViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [v2 appIconOverride];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_performAfterFirstLayout:(id)a3
{
  double v4 = (void (**)(void))a3;
  if ([(CKBrowserSwitcherViewController *)self viewHasLaidOutSubviews]) {
    v4[2]();
  }
  else {
    [(CKBrowserSwitcherViewController *)self setPerformAfterFirstLayoutBlock:v4];
  }
}

- (void)unloadRemoteViewControllers
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(CKBrowserSwitcherViewController *)self currentViewController];
  [(CKBrowserSwitcherViewController *)self _removeBrowserFromViewHierarchy:v3];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v4 = [(CKBrowserSwitcherViewController *)self livePluginIdentifierToTimestampMap];
  char v5 = [v4 allKeys];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(CKBrowserSwitcherViewController *)self _removeBrowserWithPluginIdentifierFromViewHierarchy:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)showBrowserInSwitcherForPlugin:(id)a3 datasource:(id)a4 reloadData:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "In showBrowserInSwitcherForPlugin:datasource:reloadData:", buf, 2u);
    }
  }
  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__CKBrowserSwitcherViewController_showBrowserInSwitcherForPlugin_datasource_reloadData___block_invoke;
    v11[3] = &unk_1E5620AA8;
    v11[4] = self;
    id v12 = v7;
    id v13 = v8;
    [(CKBrowserSwitcherViewController *)self _performAfterFirstLayout:v11];
  }
  else if (IMOSLoggingEnabled())
  {
    long long v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Asking to show browser for nil plugin", buf, 2u);
    }
  }
}

uint64_t __88__CKBrowserSwitcherViewController_showBrowserInSwitcherForPlugin_datasource_reloadData___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBalloonPlugin:*(void *)(a1 + 40)];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 _loadBrowserForBalloonPlugin:v3 datasource:v4];
}

- (void)animateInCompactWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = [(CKBrowserSwitcherViewController *)self contentView];
  [v5 frame];
  double v7 = v6;
  uint64_t v9 = v8;
  double v11 = v10;
  double v13 = v12;

  uint64_t v14 = [(CKBrowserSwitcherViewController *)self contentView];
  [v14 bounds];
  double MaxY = CGRectGetMaxY(v28);

  int v16 = [(CKBrowserSwitcherViewController *)self contentView];
  objc_msgSend(v16, "setFrame:", v7, MaxY, v11, v13);

  uint64_t v17 = (void *)MEMORY[0x1E4F42FF0];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __66__CKBrowserSwitcherViewController_animateInCompactWithCompletion___block_invoke;
  v27[3] = &unk_1E5621968;
  v27[4] = self;
  *(double *)&v27[5] = v7;
  v27[6] = v9;
  *(double *)&v27[7] = v11;
  *(double *)&v27[8] = v13;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __66__CKBrowserSwitcherViewController_animateInCompactWithCompletion___block_invoke_2;
  v25[3] = &unk_1E5622750;
  v25[4] = self;
  id v26 = v4;
  id v18 = v4;
  [v17 _animateUsingSpringWithDuration:0 delay:v27 options:v25 mass:0.5 stiffness:0.0 damping:1.0 initialVelocity:410.0 animations:32.0 completion:0.0];
  double v19 = [(CKBrowserSwitcherViewController *)self view];
  [v19 safeAreaInsets];
  double v21 = v20;
  double v23 = v22;

  if (v21 == 0.0 && v23 == 0.0)
  {
    double v24 = [(CKBrowserSwitcherViewController *)self view];
    [v24 setBackgroundColor:0];
  }
}

void __66__CKBrowserSwitcherViewController_animateInCompactWithCompletion___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) contentView];
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);
}

uint64_t __66__CKBrowserSwitcherViewController_animateInCompactWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateVisibleBrowserView];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)animateOutCompactWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CKBrowserSwitcherViewController *)self contentView];
  [v5 frame];
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v29.origin.CGFloat x = v7;
  v29.origin.CGFloat y = v9;
  v29.size.double width = v11;
  v29.size.double height = v13;
  double Height = CGRectGetHeight(v29);
  if (![(CKBrowserSwitcherViewController *)self _hasLandscapeGutters])
  {
    uint64_t v15 = [(CKBrowserSwitcherViewController *)self view];
    [v15 setBackgroundColor:0];
  }
  CGFloat v16 = v9 + Height;
  uint64_t v17 = [MEMORY[0x1E4F39B48] animation];
  [v17 setKeyPath:@"position.y"];
  id v18 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
  [v17 setTimingFunction:v18];

  [v17 setBeginTime:CACurrentMediaTime()];
  [v17 setDuration:0.200000003];
  double v19 = NSNumber;
  v30.origin.CGFloat x = v7;
  v30.origin.CGFloat y = v9;
  v30.size.double width = v11;
  v30.size.double height = v13;
  CGRectGetMidX(v30);
  v31.origin.CGFloat x = v7;
  v31.origin.CGFloat y = v9;
  v31.size.double width = v11;
  v31.size.double height = v13;
  double v20 = [v19 numberWithDouble:CGRectGetMidY(v31)];
  [v17 setFromValue:v20];

  double v21 = NSNumber;
  v32.origin.CGFloat x = v7;
  v32.origin.CGFloat y = v16;
  v32.size.double width = v11;
  v32.size.double height = v13;
  CGRectGetMidX(v32);
  v33.origin.CGFloat x = v7;
  v33.origin.CGFloat y = v16;
  v33.size.double width = v11;
  v33.size.double height = v13;
  double v22 = [v21 numberWithDouble:CGRectGetMidY(v33)];
  [v17 setToValue:v22];

  [v17 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v17 setRemovedOnCompletion:0];
  double v23 = [(CKBrowserSwitcherViewController *)self contentView];
  double v24 = [v23 layer];
  [v24 addAnimation:v17 forKey:@"SlideOutPresentation"];

  dispatch_time_t v25 = dispatch_time(0, 200000002);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__CKBrowserSwitcherViewController_animateOutCompactWithCompletion___block_invoke;
  v27[3] = &unk_1E5622330;
  v27[4] = self;
  id v28 = v4;
  id v26 = v4;
  dispatch_after(v25, MEMORY[0x1E4F14428], v27);
}

uint64_t __67__CKBrowserSwitcherViewController_animateOutCompactWithCompletion___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _hasLandscapeGutters] & 1) == 0)
  {
    double v2 = [*(id *)(a1 + 32) contentView];
    [v2 setBackgroundColor:0];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (BOOL)_hasLandscapeGutters
{
  double v2 = [(CKBrowserSwitcherViewController *)self view];
  [v2 safeAreaInsets];
  double v4 = v3;
  double v6 = v5;

  return v6 != 0.0 || v4 != 0.0;
}

- (CKAppGrabberView)grabberView
{
  grabberView = self->_grabberView;
  if (!grabberView)
  {
    double v4 = objc_alloc_init(CKAppGrabberView);
    double v5 = self->_grabberView;
    self->_grabberView = v4;

    [(CKAppGrabberView *)self->_grabberView setDelegate:self];
    [(CKAppGrabberView *)self->_grabberView setAutoresizingMask:34];
    double v6 = self->_grabberView;
    CGFloat v7 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    -[CKAppGrabberView setShowsAppTitle:](v6, "setShowsAppTitle:", [v7 shouldAlwaysShowAppTitle]);

    grabberView = self->_grabberView;
  }

  return grabberView;
}

- (void)saveSnapshotForCurrentBrowserViewControllerIfPossible
{
  if ([(CKBrowserSwitcherViewController *)self isBrowserReadyForUserInteraction])
  {
    id v5 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    if ([v5 currentConsumer] == 1)
    {
      double v3 = [(CKBrowserSwitcherViewController *)self currentViewController];
      char v4 = objc_opt_respondsToSelector();

      if ((v4 & 1) == 0) {
        return;
      }
      id v5 = [(CKBrowserSwitcherViewController *)self currentViewController];
      [v5 saveSnapshotForBrowserViewController];
    }
  }
}

- (void)_handleVisibleSwitcherPluginsChanged:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
  uint64_t v6 = [v5 currentConsumer];

  if (v6 != 2)
  {
    CGFloat v7 = [v4 userInfo];
    double v8 = [v7 objectForKey:@"CKBrowserSelectionControllerUninstalledPluginsKey"];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v9 = [(CKBrowserSwitcherViewController *)self livePluginIdentifierToTimestampMap];
    double v10 = [v9 allKeys];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if ([v8 containsObject:v15]) {
            [(CKBrowserSwitcherViewController *)self _removeBrowserWithPluginIdentifierFromViewHierarchy:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    CGFloat v16 = [(CKBrowserSwitcherViewController *)self balloonPlugin];
    uint64_t v17 = [v16 identifier];
    BOOL v18 = [(CKBrowserSwitcherViewController *)self _switchToVisiblePluginWithIdentifier:v17];

    if (!v18)
    {
      [(CKBrowserSwitcherViewController *)self setAllowPluginLaunchNotifications:0];
      double v19 = +[CKBalloonPluginManager sharedInstance];
      double v20 = [v19 visibleSwitcherPlugins];
      double v21 = [v20 firstObject];

      [(CKBrowserSwitcherViewController *)self showBrowserInSwitcherForPlugin:v21 datasource:0 reloadData:0];
      [(CKBrowserSwitcherViewController *)self setAllowPluginLaunchNotifications:1];
    }
  }
}

- (void)_updateCurrentBrowserSnapshotIfPossible
{
  currentViewController = self->_currentViewController;
  if (currentViewController)
  {
    id v4 = [(CKBrowserViewControllerProtocol *)currentViewController view];
    [v4 alpha];
    double v6 = v5;

    CGFloat v7 = [(CKBrowserViewControllerProtocol *)self->_currentViewController viewIfLoaded];
    double v8 = [v7 window];

    if ([(CKBrowserSwitcherViewController *)self isBrowserReadyForUserInteraction])
    {
      if (v6 > 0.0 && v8 != 0)
      {
        [(CKBrowserSwitcherViewController *)self _snapshotCurrentViewController];
        [(CKBrowserSwitcherViewController *)self setBrowserViewReadyForUserInteraction:0];
      }
    }
  }
}

- (BOOL)_pluginHasLiveBrowserViewInSwitcher:(id)a3
{
  id v4 = a3;
  double v5 = +[CKBalloonPluginManager sharedInstance];
  double v6 = [v4 identifier];

  CGFloat v7 = [v5 existingViewControllerForPluginIdentifier:v6];

  double v8 = [v7 parentViewController];
  LOBYTE(self) = v8 == self;

  return (char)self;
}

- (BOOL)_shouldLimitExpandGestureToGrabber
{
  double v2 = [(CKBrowserSwitcherViewController *)self balloonPlugin];
  if (v2)
  {
    double v3 = IMBalloonExtensionIDWithSuffix();
    id v4 = [v2 identifier];
    char v5 = [v4 isEqualToString:v3];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  if (self->_expandGestureTracker != a3) {
    goto LABEL_8;
  }
  if (![(CKBrowserSwitcherViewController *)self isBrowserReadyForUserInteraction]) {
    goto LABEL_8;
  }
  CGFloat v7 = [(CKBrowserSwitcherViewController *)self grabberView];
  int v8 = [v7 showsAppTitle];

  if (v8)
  {
    uint64_t v9 = [(CKBrowserSwitcherViewController *)self grabberView];
    double v10 = [(id)v9 closeButton];

    [v6 locationInView:v10];
    LOBYTE(v9) = objc_msgSend(v10, "pointInside:withEvent:", 0);

    if (v9) {
      goto LABEL_8;
    }
  }
  if (![(CKBrowserSwitcherViewController *)self _shouldLimitExpandGestureToGrabber])
  {
    char v13 = 1;
    goto LABEL_9;
  }
  uint64_t v11 = [v6 view];

  if (v11)
  {
    uint64_t v12 = [v6 view];
    char v13 = [v12 isDescendantOfView:self->_grabberView];
  }
  else
  {
LABEL_8:
    char v13 = 0;
  }
LABEL_9:

  return v13;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = (CKImmediatePanGestureRecognizer *)a3;
  char v5 = [(CKBrowserSwitcherViewController *)self touchTracker];
  if (v5 == v4)
  {
    double v21 = [(CKBrowserSwitcherViewController *)self currentViewController];
    long long v22 = [v21 balloonPlugin];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v6 = [MEMORY[0x1E4F1C9C8] date];
      long long v24 = [(CKBrowserSwitcherViewController *)self delegate];
      char v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) == 0)
      {
        BOOL v20 = 1;
        goto LABEL_13;
      }
      id v26 = [(CKBrowserSwitcherViewController *)self delegate];
      [v26 switcherViewController:self hasUpdatedLastTouchDate:v6];
      BOOL v20 = 1;
      goto LABEL_11;
    }
  }
  else if (self->_expandGestureTracker == v4)
  {
    id v6 = [(CKBrowserSwitcherViewController *)self currentViewController];
    if (objc_opt_respondsToSelector())
    {
      [v6 horizontalSwipeExclusionRect];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      uint64_t v15 = [v6 view];
      [(CKImmediatePanGestureRecognizer *)v4 locationInView:v15];
      CGFloat v17 = v16;
      CGFloat v19 = v18;

      v34.origin.CGFloat x = v8;
      v34.origin.CGFloat y = v10;
      v34.size.double width = v12;
      v34.size.double height = v14;
      v32.CGFloat x = v17;
      v32.CGFloat y = v19;
      if (CGRectContainsPoint(v34, v32))
      {
        BOOL v20 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    id v26 = [(CKBrowserSwitcherViewController *)self view];
    [(CKImmediatePanGestureRecognizer *)self->_expandGestureTracker locationInView:v26];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    [v26 bounds];
    v33.CGFloat x = v28;
    v33.CGFloat y = v30;
    BOOL v20 = CGRectContainsPoint(v35, v33);
LABEL_11:

    goto LABEL_13;
  }
  BOOL v20 = 1;
LABEL_14:

  return v20;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)setCurrentVisiblePlugin:(id)a3
{
  p_currentVisiblePlugin = &self->_currentVisiblePlugin;
  CGFloat v8 = (IMBalloonPlugin *)a3;
  if (*p_currentVisiblePlugin != v8)
  {
    objc_storeStrong((id *)&self->_currentVisiblePlugin, a3);
    [(CKBrowserSwitcherViewController *)self setBrowserViewReadyForUserInteraction:0];
    [(CKBrowserSwitcherViewController *)self updateGrabberTitleAndIconForPlugin:*p_currentVisiblePlugin];
    if (CKIsRunningInMessages())
    {
      BOOL v6 = [(CKBrowserSwitcherViewController *)self _currentPluginIsJellyfish];
      double v7 = [MEMORY[0x1E4F42738] sharedApplication];
      [v7 setIdleTimerDisabled:v6];
    }
  }
}

- (void)updateGrabberTitleAndIconForPlugin:(id)a3
{
  id v10 = a3;
  if ([v10 showInBrowser])
  {
    id v4 = [v10 browserDisplayName];
    char v5 = [(CKBrowserSwitcherViewController *)self traitCollection];
    objc_msgSend(v10, "__ck_browserImageForInterfaceStyle:", objc_msgSend(v5, "userInterfaceStyle"));
  }
  else
  {
    BOOL v6 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    id v4 = [v6 appTitleOverride];

    char v5 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    [v5 appIconOverride];
  double v7 = };

  CGFloat v8 = [(CKBrowserSwitcherViewController *)self grabberView];
  double v9 = [v10 identifier];
  [v8 updateAppTitle:v4 icon:v7 appIdentifier:v9];
}

- (id)traitCollection
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)CKBrowserSwitcherViewController;
  double v2 = [(CKBrowserSwitcherViewController *)&v8 traitCollection];
  if (CKIsRunningInCameraAppsClient())
  {
    double v3 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
    id v4 = (void *)MEMORY[0x1E4F42F80];
    v9[0] = v2;
    v9[1] = v3;
    char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    uint64_t v6 = [v4 traitCollectionWithTraitsFromCollections:v5];

    double v2 = (void *)v6;
  }

  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKBrowserSwitcherViewController;
  id v4 = a3;
  [(CKBrowserSwitcherViewController *)&v8 traitCollectionDidChange:v4];
  char v5 = [(CKBrowserSwitcherViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(CKBrowserSwitcherViewController *)self updateGrabberTitleAndIconForPlugin:self->_currentVisiblePlugin];
  }
}

- (void)_snapshotCurrentViewController
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    double v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "In cancel touches and snapshot", (uint8_t *)&v10, 2u);
    }
  }
  if (self->_currentViewController)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        char v5 = [(CKBrowserViewControllerProtocol *)self->_currentViewController balloonPlugin];
        uint64_t v6 = [v5 identifier];
        int v10 = 138412290;
        double v11 = v6;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "===> snapshotting current view controller (%@) since we're moving away", (uint8_t *)&v10, 0xCu);
      }
    }
    uint64_t v7 = +[CKBalloonPluginManager sharedInstance];
    currentViewController = self->_currentViewController;
    double v9 = [(CKBrowserSwitcherViewController *)self browserContainer];
    [v9 frame];
    objc_msgSend(v7, "updateSnapshotForBrowserViewController:currentBounds:", currentViewController);
  }
}

- (void)_updateVisibleBrowserView
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = [(CKBrowserSwitcherViewController *)self currentViewController];
  id v4 = [v3 balloonPlugin];

  char v5 = [(CKBrowserSwitcherViewController *)self balloonPlugin];
  if (-[CKBrowserSwitcherViewController _pluginHasLiveBrowserViewInSwitcher:](self, "_pluginHasLiveBrowserViewInSwitcher:", v4)&& [v4 isEqual:v5])
  {
    [(CKBrowserSwitcherViewController *)self _updateActiveBrowserTimestampForCurrentBalloonPlugin];
    [(CKBrowserSwitcherViewController *)self setBrowserViewReadyForUserInteraction:1];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [v5 identifier];
        int v15 = 138412290;
        double v16 = v7;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Requesting load of browser VC for %@", (uint8_t *)&v15, 0xCu);
      }
    }
    objc_super v8 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    [v8 releaseOwnershipOfBrowserForConsumer:1];

    double v9 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
    char v10 = [v9 updateBrowserSessionForPlugin:v5 datasource:0];

    if (v10)
    {
      double v11 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
      uint64_t v12 = [v11 requestOwnershipOfBrowserForConsumer:1];

      if (v12) {
        [(CKBrowserSwitcherViewController *)self setCurrentViewController:v12];
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        double v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          CGFloat v14 = [v5 identifier];
          int v15 = 138412290;
          double v16 = v14;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Transition coordinator failed to update browser session for %@", (uint8_t *)&v15, 0xCu);
        }
      }
      [(CKBrowserSwitcherViewController *)self setBrowserViewReadyForUserInteraction:1];
      [(CKBrowserSwitcherViewController *)self setCurrentViewController:0];
    }
  }
}

- (void)_transitionSnapshotViewToBrowserViewAfterViewDidPrepareForDisplay:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    char v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "===> _transitionSnapshotViewToBrowserViewAfterRemoteViewDidLoad: called with notification: %@", buf, 0xCu);
    }
  }
  uint64_t v6 = [v4 userInfo];
  uint64_t v7 = [v6 objectForKey:@"CKRemoteViewPluginKey"];

  objc_super v8 = [v7 identifier];
  double v9 = [(CKBrowserSwitcherViewController *)self currentViewController];
  char v10 = [v9 balloonPlugin];
  double v11 = [v10 identifier];
  int v12 = [v8 isEqualToString:v11];

  if (v12)
  {
    [(CKBrowserSwitcherViewController *)self _transitionSnapshotViewToBrowserView];
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v13 = [(CKBrowserSwitcherViewController *)self livePluginIdentifierToTimestampMap];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * v16);
          double v18 = [v7 identifier];
          int v19 = [v18 isEqualToString:v17];

          if (v19)
          {
            BOOL v20 = +[CKBalloonPluginManager sharedInstance];
            double v21 = [v20 existingViewControllerForPluginIdentifier:v17];
            long long v22 = [v21 view];
            [v22 setAlpha:1.0];

            goto LABEL_17;
          }
          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
  }
LABEL_17:
}

- (void)_handleRemoteViewControllerConnectionInterrupted:(id)a3
{
  id v4 = [a3 userInfo];
  id v12 = [v4 objectForKey:*MEMORY[0x1E4F6D340]];

  char v5 = [(CKBrowserSwitcherViewController *)self balloonPlugin];
  uint64_t v6 = [v5 identifier];
  if ([v6 isEqualToString:v12])
  {
    BOOL v7 = [(CKBrowserSwitcherViewController *)self isBrowserReadyForUserInteraction];

    if (!v7) {
      goto LABEL_5;
    }
    objc_super v8 = [(CKBrowserSwitcherViewController *)self balloonPlugin];
    char v5 = [v8 browserDisplayName];

    [(CKBrowserSwitcherViewController *)self setBrowserViewReadyForUserInteraction:0];
    [(CKBrowserSwitcherViewController *)self setBalloonPlugin:0];
    [(CKBrowserSwitcherViewController *)self setCurrentVisiblePlugin:0];
    double v9 = [(CKBrowserSwitcherViewController *)self activeBrowserView];
    [v9 removeFromSuperview];

    char v10 = [(CKBrowserSwitcherViewController *)self currentViewController];
    [v10 removeFromParentViewController];

    [(CKBrowserSwitcherViewController *)self setCurrentViewController:0];
    double v11 = [(CKBrowserSwitcherViewController *)self cell];
    [v11 showExtensionInterruptedViewWithDisplayName:v5];

    uint64_t v6 = [(CKBrowserSwitcherViewController *)self livePluginIdentifierToTimestampMap];
    [v6 removeObjectForKey:v12];
  }

LABEL_5:
}

- (void)_transitionSnapshotViewToBrowserView
{
  if (![(CKBrowserSwitcherViewController *)self isTransitioningFromSnapshotToLiveView])
  {
    [(CKBrowserSwitcherViewController *)self setTransitioningFromSnapshotToLiveView:1];
    double v3 = [(CKBrowserSwitcherViewController *)self currentVisiblePlugin];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__CKBrowserSwitcherViewController__transitionSnapshotViewToBrowserView__block_invoke;
    aBlock[3] = &unk_1E5621EA8;
    aBlock[4] = self;
    id v4 = v3;
    id v12 = v4;
    char v5 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
    uint64_t v6 = [(CKBrowserSwitcherViewController *)self cell];
    int v7 = [v6 isUsingFallbackSnapshot];

    if (v7)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __71__CKBrowserSwitcherViewController__transitionSnapshotViewToBrowserView__block_invoke_418;
      v10[3] = &unk_1E5620C40;
      v10[4] = self;
      objc_super v8 = _Block_copy(v10);
      [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v8 options:v5 animations:0.5 completion:0.0];
    }
    else
    {
      double v9 = [(CKBrowserSwitcherViewController *)self activeBrowserView];
      [v9 setAlpha:1.0];

      v5[2](v5, 1);
    }
  }
}

uint64_t __71__CKBrowserSwitcherViewController__transitionSnapshotViewToBrowserView__block_invoke(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    double v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "====> set the browser view's alpha to 1.0", v9, 2u);
    }
  }
  double v3 = [*(id *)(a1 + 32) currentViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    char v5 = [*(id *)(a1 + 32) currentViewController];
    [v5 saveSnapshotForBrowserViewController];
  }
  uint64_t v6 = *(void **)(a1 + 40);
  int v7 = [*(id *)(a1 + 32) currentVisiblePlugin];

  if (v6 == v7) {
    [*(id *)(a1 + 32) setBrowserViewReadyForUserInteraction:1];
  }
  return [*(id *)(a1 + 32) setTransitioningFromSnapshotToLiveView:0];
}

void __71__CKBrowserSwitcherViewController__transitionSnapshotViewToBrowserView__block_invoke_418(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activeBrowserView];
  [v1 setAlpha:1.0];
}

- (BOOL)_currentPluginIsJellyfish
{
  double v2 = [(CKBrowserSwitcherViewController *)self currentVisiblePlugin];
  double v3 = [v2 identifier];
  char v4 = IMBalloonExtensionIDWithSuffix();
  char v5 = [v3 isEqualToString:v4];

  return v5;
}

- (void)_updateActiveBrowserAlphaStateOnInsertForCurrentController:(id)a3 currentView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0 || ([v5 isLoaded] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)objc_super v8 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "====> set the browser view's alpha to 0.0!", v8, 2u);
      }
    }
    [v6 setAlpha:0.0];
  }
}

- (void)_updateBrowserViewPositionForPluginAndInsertIfNecessary:(id)a3
{
  id v4 = a3;
  if (![(CKBrowserSwitcherViewController *)self isTransitioningExpandedState]
    || [(CKBrowserSwitcherViewController *)self browserIsCollapsingFromFullscreen])
  {
    id v5 = +[CKBalloonPluginManager sharedInstance];
    id v6 = [v5 visibleSwitcherPlugins];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __91__CKBrowserSwitcherViewController__updateBrowserViewPositionForPluginAndInsertIfNecessary___block_invoke;
    v7[3] = &unk_1E562B388;
    id v8 = v4;
    double v9 = self;
    [v6 enumerateObjectsUsingBlock:v7];
  }
}

void __91__CKBrowserSwitcherViewController__updateBrowserViewPositionForPluginAndInsertIfNecessary___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v21 = a2;
  id v6 = [v21 identifier];
  int v7 = [*(id *)(a1 + 32) identifier];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    [*(id *)(a1 + 40) _browserSize];
    double v10 = v9;
    double v12 = v11;
    double v13 = +[CKBalloonPluginManager sharedInstance];
    uint64_t v14 = [v21 identifier];
    uint64_t v15 = [v13 existingViewControllerForPluginIdentifier:v14];

    if (v15)
    {
      uint64_t v16 = [v15 view];
      [v16 setAutoresizingMask:18];
      objc_msgSend(v16, "setFrame:", 0.0, 0.0, v10, v12);
      uint64_t v17 = [v16 superview];
      double v18 = [*(id *)(a1 + 40) browserContainer];

      if (v17 != v18)
      {
        int v19 = [*(id *)(a1 + 40) browserContainer];
        [v19 addSubview:v16];

        BOOL v20 = [*(id *)(a1 + 40) browserContainer];
        [v20 bringSubviewToFront:v16];
      }
    }
    *a4 = 1;
  }
}

- (void)_removeBrowserWithPluginIdentifierFromViewHierarchy:(id)a3
{
  id v7 = a3;
  id v4 = +[CKBalloonPluginManager sharedInstance];
  id v5 = [v4 existingViewControllerForPluginIdentifier:v7];

  if (v5) {
    [(CKBrowserSwitcherViewController *)self _removeBrowserFromViewHierarchy:v5];
  }
  id v6 = [(CKBrowserSwitcherViewController *)self livePluginIdentifierToTimestampMap];
  [v6 removeObjectForKey:v7];
}

- (void)_removeBrowserFromViewHierarchy:(id)a3
{
  id v4 = a3;
  id v5 = [v4 parentViewController];
  if (v5 == self)
  {
  }
  else
  {
    id v6 = v5;
    id v7 = [v4 parentViewController];

    if (v7) {
      goto LABEL_14;
    }
  }
  if (objc_opt_respondsToSelector())
  {
    [v4 deferredForceTearDownRemoteView];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v4 forceTearDownRemoteView];
  }
  [v4 willMoveToParentViewController:0];
  int v8 = [v4 view];
  [v8 removeFromSuperview];

  [v4 removeFromParentViewController];
  [(CKBrowserSwitcherViewController *)self removeChildViewController:v4];
  if (IMOSLoggingEnabled())
  {
    double v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v11 = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "====> set the browser view's alpha to 1.0 when removing from hierarchy", v11, 2u);
    }
  }
  double v10 = [v4 view];
  [v10 setAlpha:1.0];

LABEL_14:
}

- (void)_updateActiveBrowserTimestampForCurrentBalloonPlugin
{
  if (!self->_livePluginIdentifierToTimestampMap)
  {
    CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    livePluginIdentifierToTimestampMap = self->_livePluginIdentifierToTimestampMap;
    self->_livePluginIdentifierToTimestampMap = Mutable;
  }
  id v5 = [(CKBrowserSwitcherViewController *)self balloonPlugin];
  id v6 = [v5 identifier];

  if (v6)
  {
    id v10 = [(CKBrowserSwitcherViewController *)self livePluginIdentifierToTimestampMap];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    int v8 = [(CKBrowserSwitcherViewController *)self balloonPlugin];
    double v9 = [v8 identifier];
    [v10 setObject:v7 forKey:v9];
  }
}

- (void)setCurrentViewController:(id)a3
{
  id v5 = (CKBrowserViewControllerProtocol *)a3;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "In setCurrentViewController", buf, 2u);
    }
  }
  p_currentViewController = &self->_currentViewController;
  if (self->_currentViewController != v5)
  {
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "===> setCurrentViewController called, switching view controllers", buf, 2u);
      }
    }
    objc_storeStrong((id *)&self->_currentViewController, a3);
    if (v5)
    {
      [(CKBrowserSwitcherViewController *)self _updateActiveBrowserTimestampForCurrentBalloonPlugin];
      [(CKBrowserSwitcherViewController *)self _insertCurrentBrowserAndRemoveOldBrowsersIfNeeded];
      if (objc_opt_respondsToSelector())
      {
        if ([(CKBrowserViewControllerProtocol *)v5 isLoaded]) {
          [(CKBrowserSwitcherViewController *)self setBrowserViewReadyForUserInteraction:1];
        }
      }
    }
    double v9 = [(CKBrowserViewControllerProtocol *)v5 balloonPlugin];
    if (v9)
    {
      id v10 = +[CKBalloonPluginManager sharedInstance];
      [v10 updateLaunchStatus:1 forPlugin:v9 withNotification:0];
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_17;
      }
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "===>  plugin is nil, not updating launch identifier, launch status or page control", buf, 2u);
      }
    }

LABEL_17:
    if (IMOSLoggingEnabled())
    {
      double v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "===>  informing delegate that we finished switching", buf, 2u);
      }
    }
    double v12 = [(CKBrowserSwitcherViewController *)self delegate];
    [v12 switcherViewControllerDidFinishSwitching:self toViewController:*p_currentViewController];

    double v13 = [(CKBrowserSwitcherViewController *)self contentView];
    uint64_t v14 = [(CKBrowserSwitcherViewController *)self grabberView];
    [v13 bringSubviewToFront:v14];
  }
  uint64_t v15 = [(CKBrowserViewControllerProtocol *)v5 balloonPlugin];
  uint64_t v16 = [v15 identifier];
  int v17 = [v16 isEqualToString:@"com.apple.messages.browser.RecentPlugin"];

  if (v17)
  {
    double v18 = *p_currentViewController;
    int v19 = [(CKBrowserSwitcherViewController *)self contentView];
    [(CKBrowserViewControllerProtocol *)v18 setDragTargetView:v19];
  }
  else
  {
    BOOL v20 = [(CKBrowserViewControllerProtocol *)v5 balloonPlugin];
    id v21 = [v20 identifier];
    int v22 = [v21 isEqualToString:@"com.apple.appstore.MessagesProvider"];

    if (v22) {
      -[CKBrowserViewControllerProtocol setAdditionalSafeAreaInsets:](v5, "setAdditionalSafeAreaInsets:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
    }
  }
  long long v23 = [(CKBrowserSwitcherViewController *)self childViewControllers];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__CKBrowserSwitcherViewController_setCurrentViewController___block_invoke;
  v24[3] = &unk_1E562B360;
  void v24[4] = self;
  [v23 enumerateObjectsUsingBlock:v24];
}

- (void)handleExpandButton:(id)a3
{
  if (![(CKBrowserSwitcherViewController *)self isDragging]
    && [(CKBrowserSwitcherViewController *)self isBrowserReadyForUserInteraction])
  {
    [(CKBrowserSwitcherViewController *)self transitionToFullscreen];
  }
}

uint64_t __75__CKBrowserSwitcherViewController__loadBrowserForBalloonPlugin_datasource___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _transitionSnapshotViewToBrowserView];
}

- (BOOL)_switchToVisiblePluginWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  id v5 = +[CKBalloonPluginManager sharedInstance];
  id v6 = [v5 visibleSwitcherPlugins];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__CKBrowserSwitcherViewController__switchToVisiblePluginWithIdentifier___block_invoke;
  void v9[3] = &unk_1E562B3B0;
  id v7 = v4;
  id v10 = v7;
  double v11 = self;
  double v12 = &v13;
  [v6 enumerateObjectsUsingBlock:v9];

  LOBYTE(self) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)self;
}

- (void)dragManagerDidStartDrag:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Switcher heard dragManagerDidStartDrag", v6, 2u);
    }
  }
  [(CKBrowserSwitcherViewController *)self setInDragAndDrop:1];
}

- (void)dragManagerDidEndDragging:(id)a3
{
  dispatch_time_t v4 = dispatch_time(0, 400000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CKBrowserSwitcherViewController_dragManagerDidEndDragging___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

- (void)appGrabberViewCloseButtonTapped:(id)a3
{
  id v4 = [(CKBrowserSwitcherViewController *)self transitionCoordinator];
  double v3 = [v4 sendDelegate];
  [v3 dismissAndReloadInputViews:0];
}

- (id)backdropView:(id)a3 willChangeToGraphicsQuality:(int64_t)a4
{
  return (id)[a3 inputSettings];
}

- (CKBrowserSwitcherViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKBrowserSwitcherViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKBrowserViewControllerProtocol)currentViewController
{
  return self->_currentViewController;
}

- (CKBrowserTransitionCoordinator)transitionCoordinator
{
  return self->_transitionCoordinator;
}

- (void)setTransitionCoordinator:(id)a3
{
}

- (BOOL)isDragging
{
  return self->_dragging;
}

- (void)setDragging:(BOOL)a3
{
  self->_dragging = a3;
}

- (BOOL)isBrowserReadyForUserInteraction
{
  return self->_browserViewReadyForUserInteraction;
}

- (IMBalloonPlugin)balloonPlugin
{
  return self->_balloonPlugin;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (UIView)browserContainer
{
  return self->_browserContainer;
}

- (void)setBrowserContainer:(id)a3
{
}

- (CKBrowserSwitcherCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
}

- (NSMutableDictionary)livePluginIdentifierToTimestampMap
{
  return self->_livePluginIdentifierToTimestampMap;
}

- (void)setLivePluginIdentifierToTimestampMap:(id)a3
{
}

- (UILongPressGestureRecognizer)touchTracker
{
  return self->_touchTracker;
}

- (void)setTouchTracker:(id)a3
{
}

- (IMBalloonPlugin)currentVisiblePlugin
{
  return self->_currentVisiblePlugin;
}

- (void)setGrabberView:(id)a3
{
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (BOOL)insertedViaCollapse
{
  return self->_insertedViaCollapse;
}

- (void)setInsertedViaCollapse:(BOOL)a3
{
  self->_insertedViaCollapse = a3;
}

- (BOOL)isInDragAndDrop
{
  return self->_inDragAndDrop;
}

- (void)setInDragAndDrop:(BOOL)a3
{
  self->_inDragAndDrop = a3;
}

- (BOOL)interactiveExpandStarted
{
  return self->_interactiveExpandStarted;
}

- (void)setInteractiveExpandStarted:(BOOL)a3
{
  self->_interactiveExpandStarted = a3;
}

- (BOOL)isTransitioningFromSnapshotToLiveView
{
  return self->_transitioningFromSnapshotToLiveView;
}

- (void)setTransitioningFromSnapshotToLiveView:(BOOL)a3
{
  self->_transitioningFromSnapshotToLiveView = a3;
}

- (BOOL)isTransitioningExpandedState
{
  return self->_transitioningExpandedState;
}

- (void)setTransitioningExpandedState:(BOOL)a3
{
  self->_transitioningExpandedState = a3;
}

- (BOOL)allowFooterLabelUpdates
{
  return self->_allowFooterLabelUpdates;
}

- (void)setAllowFooterLabelUpdates:(BOOL)a3
{
  self->_allowFooterLabelUpdates = a3;
}

- (BOOL)allowPluginLaunchNotifications
{
  return self->_allowPluginLaunchNotifications;
}

- (void)setAllowPluginLaunchNotifications:(BOOL)a3
{
  self->_allowPluginLaunchNotifications = a3;
}

- (id)performAfterFirstLayoutBlock
{
  return self->_performAfterFirstLayoutBlock;
}

- (void)setPerformAfterFirstLayoutBlock:(id)a3
{
}

- (BOOL)viewHasLaidOutSubviews
{
  return self->_viewHasLaidOutSubviews;
}

- (void)setViewHasLaidOutSubviews:(BOOL)a3
{
  self->_viewHasLaidOutSubviews = a3;
}

- (NSDate)timeOfLastScrollingDecelerationEnded
{
  return self->_timeOfLastScrollingDecelerationEnded;
}

- (void)setTimeOfLastScrollingDecelerationEnded:(id)a3
{
}

- (BOOL)browserIsLoadingCompact
{
  return self->_browserIsLoadingCompact;
}

- (void)setBrowserIsLoadingCompact:(BOOL)a3
{
  self->_browserIsLoadingCompact = a3;
}

- (BOOL)browserIsCollapsingFromFullscreen
{
  return self->_browserIsCollapsingFromFullscreen;
}

- (void)setBrowserIsCollapsingFromFullscreen:(BOOL)a3
{
  self->_browserIsCollapsingFromFullscreen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfLastScrollingDecelerationEnded, 0);
  objc_storeStrong(&self->_performAfterFirstLayoutBlock, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_currentVisiblePlugin, 0);
  objc_storeStrong((id *)&self->_touchTracker, 0);
  objc_storeStrong((id *)&self->_livePluginIdentifierToTimestampMap, 0);
  objc_storeStrong((id *)&self->_cell, 0);
  objc_storeStrong((id *)&self->_browserContainer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_balloonPlugin, 0);
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_currentViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expandPropertyAnimator, 0);

  objc_storeStrong((id *)&self->_expandGestureTracker, 0);
}

@end