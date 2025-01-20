@interface SSSScreenshotsView
- (BOOL)_anyScreenshotPDFViewNeedsBleedToBottom;
- (BOOL)_contentSwitcherShouldMoveDown;
- (BOOL)_isLandscapePhone;
- (BOOL)_isPortraitPhone;
- (BOOL)_isShowingPDFScreenshot;
- (BOOL)_layoutShouldEnableContentSwitcher;
- (BOOL)_layoutShouldShowContentSwitcher;
- (BOOL)_screenshotEditsShouldBeSnapshottedForCurrentScreenshot;
- (BOOL)_shouldAvoidKeyboard;
- (BOOL)_shouldBleedToBottom;
- (BOOL)_shouldExtendBottomBarForPageDots;
- (BOOL)_shouldHandleKeyboardNotification:(id)a3;
- (BOOL)_shouldShowBottomBar;
- (BOOL)_shouldShowScreenshotViewAtIndex:(int64_t)a3;
- (BOOL)_showAllScreenshotsForNumberOfScreenshots:(int64_t)a3;
- (BOOL)currentScreenshotCropHandlesFadedOut;
- (BOOL)inStateTransition;
- (BOOL)isCropped;
- (BOOL)isPerformingFullscreenSetup;
- (BOOL)isSharing;
- (BOOL)screenshotViewsUseTrilinearMinificationFilter;
- (BOOL)showsShadow;
- (BOOL)snapshotScreenshotEdits;
- (CGRect)_availableRectForContent;
- (CGRect)_effectiveBottomBarExtent;
- (CGRect)_frameForScreenshot:(id)a3 atIndex:(int64_t)a4 numberOfScreenshots:(int64_t)a5 maximumSize:(CGSize)a6 interScreenshotSpacing:(double)a7 rectToCenterAboveKeyboard:(CGRect)a8 state:(unint64_t)a9;
- (CGRect)_layoutBounds;
- (CGRect)_layoutBoundsForFullPageThumbnail;
- (CGRect)_scrollViewRectForPage:(int64_t)a3;
- (CGRect)screenshotsExtentRect;
- (CGSize)_screenshotMaximumSize;
- (CGSize)_scrollContentSize;
- (NSArray)activityItems;
- (NSArray)dragItems;
- (NSArray)imageItems;
- (NSArray)visibleScreenshots;
- (SEL)redoItemAction;
- (SEL)shareItemAction;
- (SEL)undoItemAction;
- (SSSScreenshot)currentScreenshot;
- (SSSScreenshotView)activeScreenshotView;
- (SSSScreenshotView)appearingScreenshotView;
- (SSSScreenshotsView)initWithFrame:(CGRect)a3;
- (SSSScreenshotsViewDelegate)delegate;
- (UIBarButtonItem)currentLiveTextBarButtonItemIfExists;
- (UICoordinateSpace)screenshotsParentCoordinateSpace;
- (UIEdgeInsets)_scrollContentInsets;
- (UINavigationBar)topBar;
- (UIView)bottomBar;
- (UIView)rulerHostingView;
- (VKCImageAnalyzer)imageAnalyzer;
- (double)_bottomBarHeightIncludingSafeAreaInsets;
- (double)_interScreenshotSpacing;
- (double)_thumbnailTrayWidth;
- (double)_toolPickerHeightOnPhone;
- (id)_currentPDFView;
- (id)_rectsForShadowView;
- (id)_screenshotAtIndex:(int64_t)a3;
- (id)_screenshotViewForDragItem:(id)a3;
- (id)_screenshotViewForScreenshot:(id)a3;
- (id)_screenshotsEligibleForSharing;
- (id)_viewForPage:(int64_t)a3;
- (id)createUndoMenu;
- (id)currentScreenshotView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)previewForDragItem:(id)a3 inContainer:(id)a4;
- (id)redoItemTarget;
- (id)screenshotViewForScreenshot:(id)a3;
- (id)shareItemTarget;
- (id)targetForCancellingDragItem:(id)a3 inContainer:(id)a4;
- (id)undoItemTarget;
- (id)viewControllerForPresentationsFromScreenshotView:(id)a3;
- (id)viewsForScreenshots:(id)a3;
- (int64_t)_currentPage;
- (int64_t)_effectiveIndexForIndex:(int64_t)a3 inNumberOfScreenshots:(int64_t)a4;
- (int64_t)_numberOfPages;
- (int64_t)_pageForXOffsetInScrollView:(double)a3;
- (int64_t)_positioningIndexForIndex:(int64_t)a3 numberOfScreenshots:(int64_t)a4;
- (int64_t)currentPDFPage;
- (int64_t)editMode;
- (int64_t)numberOfScreenshotImages;
- (int64_t)positionForBar:(id)a3;
- (unint64_t)interactionMode;
- (unint64_t)state;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_layoutScreenshotView:(id)a3 forState:(unint64_t)a4 isFirstScreenshot:(BOOL)a5 isCurrentScreenshot:(BOOL)a6;
- (void)_layoutThumbnailView;
- (void)_noteCurrentPageForSignificantChange;
- (void)_removeHighlightedModeForScreenshotViewIfNecessary:(id)a3;
- (void)_scrollToPage:(int64_t)a3 animated:(BOOL)a4;
- (void)_setupPaletteIfNecessary;
- (void)_undo;
- (void)_undoAll;
- (void)_updateActiveScreenshotViewIfNecessary;
- (void)_updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:(BOOL)a3;
- (void)_updateDisplayedPage;
- (void)_updateFirstResponderForHidingToolPicker;
- (void)_updateForKeyboardNotification:(id)a3;
- (void)_updateInstructionLabelIfNecessaryAnimated:(BOOL)a3;
- (void)_updatePaletteVisibilityIfNecessary:(BOOL)a3;
- (void)_updateScrollPositionForCurrentPage;
- (void)_updateShadowViewAlpha;
- (void)_updateSubviewOrdering;
- (void)_updateThumbnailViewVisibilityIfNeededAnimated:(BOOL)a3;
- (void)_updateVisualSearchCornerViewPositioning;
- (void)aaButtonPressed:(id)a3;
- (void)addOrRemoveAAButtonIfNecessary;
- (void)addOrRemoveActionInfoViewIfNecessary;
- (void)analysisInfoButtonPressed:(id)a3;
- (void)cancelCrop;
- (void)commitInflightEdits;
- (void)dealloc;
- (void)didProcessDocumentUpdateForScreenshot:(id)a3;
- (void)dismissOverlayManagedViewControllers;
- (void)doneCrop;
- (void)endOpacityEditing;
- (void)enterCrop;
- (void)layoutSubviews;
- (void)parentScreenshotView:(id)a3 animated:(BOOL)a4;
- (void)removeScreenshots:(id)a3;
- (void)resetCrop;
- (void)safeAreaInsetsDidChange;
- (void)screenshotView:(id)a3 didUpdateInteraction:(id)a4 withAnalysis:(id)a5;
- (void)screenshotView:(id)a3 hasHighPriorityGesture:(id)a4;
- (void)screenshotView:(id)a3 noLongerHasHighPriorityGesture:(id)a4;
- (void)screenshotView:(id)a3 requestsUpdateToInteractionMode:(unint64_t)a4;
- (void)screenshotView:(id)a3 startEditingOpacityInAccessoryView:(id)a4;
- (void)screenshotViewCropDidChange:(id)a3;
- (void)screenshotViewTapped:(id)a3;
- (void)screenshotViewUndoStackChanged:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setActiveScreenshotView:(id)a3;
- (void)setAppearingScreenshotView:(id)a3;
- (void)setBorderViewStyleOverride:(int64_t)a3 withAnimator:(id)a4;
- (void)setCurrentScreenshotCropHandlesFadedOut:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEditMode:(int64_t)a3;
- (void)setImageAnalyzer:(id)a3;
- (void)setInteractionMode:(unint64_t)a3;
- (void)setIsPerformingFullscreenSetup:(BOOL)a3;
- (void)setIsSharing:(BOOL)a3;
- (void)setRedoItemAction:(SEL)a3;
- (void)setRedoItemTarget:(id)a3;
- (void)setScreenshotViewsUseTrilinearMinificationFilter:(BOOL)a3;
- (void)setShareItemAction:(SEL)a3;
- (void)setShareItemTarget:(id)a3;
- (void)setShowsShadow:(BOOL)a3;
- (void)setSnapshotScreenshotEdits:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setUndoItemAction:(SEL)a3;
- (void)setUndoItemTarget:(id)a3;
- (void)stateTransitionFinished;
- (void)toolbarDidSelectOpacityOptionWithAccessoryView:(id)a3;
- (void)updateForFrame:(CGRect)a3;
@end

@implementation SSSScreenshotsView

- (void)layoutSubviews
{
  [(SSSScreenshotsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  unint64_t v7 = [(SSSScreenshotsView *)self state];
  [(SSSScreenshotsView *)self _layoutBounds];
  double v11 = v10;
  double v13 = v12;
  if (v4 == CGSizeZero.width && v6 == CGSizeZero.height) {
    return;
  }
  double v15 = v8;
  double v16 = v9;
  if (v7 == 1 && !self->_hasPerformedFullscreenSetup)
  {
    self->_hasPerformedFullscreenSetup = 1;
    v143[0] = _NSConcreteStackBlock;
    v143[1] = 3221225472;
    v143[2] = sub_10003A858;
    v143[3] = &unk_100099A20;
    v143[4] = self;
    +[UIView performWithoutAnimation:v143];
  }
  [(SSSScreenshotsView *)self _setupPaletteIfNecessary];
  [(SSSScreenshotsView *)self safeAreaInsets];
  double v18 = v17;
  [(SSSScreenshotsView *)self bounds];
  double v20 = v19;
  double v21 = 0.0;
  double v23 = v22 + 0.0;
  double v25 = v18 + v24;
  if ([(SSSScreenshotsView *)self _contentSwitcherShouldMoveDown])
  {
    if ((id)[(SSSScreenshotsView *)self editMode] == (id)2) {
      double v21 = 0.0;
    }
    else {
      double v21 = 38.0;
    }
  }
  unint64_t v131 = v7;
  v26 = [(UINavigationBar *)self->_topBar topItem];
  v27 = [v26 _bottomPalette];
  [v27 setPreferredHeight:v21];

  [(UINavigationBar *)self->_topBar intrinsicContentSize];
  double v29 = v28;
  -[UINavigationBar sss_setFrameUnanimatingLayingOut:](self->_topBar, "sss_setFrameUnanimatingLayingOut:", v23, v25, v20, v28);
  [(UINavigationBar *)self->_topBar setBarTintColor:0];
  [(UINavigationBar *)self->_topBar setOpaque:0];
  [(UINavigationBar *)self->_topBar setTranslucent:1];
  [(UINavigationBar *)self->_topBar setBackgroundImage:self->_topBarEmptyBackgroundImage forBarMetrics:0];
  [(UINavigationBar *)self->_topBar bringSubviewToFront:self->_topBarSeparatorLine];
  +[SSChromeHelper barSeparatorSize];
  topBarSeparatorLine = self->_topBarSeparatorLine;
  double v32 = v29 - v31;
  [(SSSScreenshotsView *)self bounds];
  -[UIView sss_setFrameUnanimatingLayingOut:](topBarSeparatorLine, "sss_setFrameUnanimatingLayingOut:", 0.0, v32);
  [(SSSScreenshotsView *)self bounds];
  double v34 = v33;
  double v36 = v35;
  [(SSSScreenshotsView *)self _bottomBarHeightIncludingSafeAreaInsets];
  double v38 = v37;
  [(SSSScreenshotsView *)self bounds];
  -[UIVisualEffectView sss_setFrameUnanimatingLayingOut:](self->_bottomBar, "sss_setFrameUnanimatingLayingOut:", v34, CGRectGetMaxY(v146) - v38, v36, v38);
  bottomBarSeparatorLine = self->_bottomBarSeparatorLine;
  [(UIVisualEffectView *)self->_bottomBar bounds];
  -[UIView sss_setFrameUnanimatingLayingOut:](bottomBarSeparatorLine, "sss_setFrameUnanimatingLayingOut:", 0.0, 0.0);
  [(SSSScreenshotCountIndicator *)self->_countIndicator setCount:[(SSSScreenshotsView *)self _numberOfPages]];
  -[SSSScrollView setFrame:](self->_scrollView, "setFrame:", v11, v13, v15, v16);
  uint64_t v40 = [(SSSScreenshotsView *)self numberOfScreenshotImages];
  BOOL v41 = 0;
  if (v40 >= 2) {
    BOOL v41 = ![(SSSScreenshotsView *)self _shouldAvoidKeyboard]
  }
       && (id)[(SSSScreenshotsView *)self editMode] != (id)2;
  [(SSSScrollView *)self->_scrollView setScrollEnabled:v41];
  v42 = [(SSSScrollView *)self->_scrollView panGestureRecognizer];
  [v42 setAllowedTouchTypes:&off_10009DF50];

  id rect = [(NSMutableArray *)self->_screenshotViews count];
  v43 = [(SSSScreenshotsView *)self currentScreenshotView];
  v132 = [(NSMutableArray *)self->_screenshotViews firstObject];
  long long v139 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  obj = self->_screenshotViews;
  id v44 = [(NSMutableArray *)obj countByEnumeratingWithState:&v139 objects:v145 count:16];
  v130 = v43;
  if (v44)
  {
    id v45 = v44;
    char v46 = 0;
    uint64_t v47 = 0;
    uint64_t v129 = *(void *)v140;
    CGFloat y = CGRectNull.origin.y;
    CGFloat width = CGRectNull.size.width;
    CGFloat height = CGRectNull.size.height;
    do
    {
      for (i = 0; i != v45; i = (char *)i + 1)
      {
        if (*(void *)v140 != v129) {
          objc_enumerationMutation(obj);
        }
        v52 = *(void **)(*((void *)&v139 + 1) + 8 * i);
        v53 = [v52 screenshot];
        [(SSSScreenshotsView *)self _screenshotMaximumSize];
        double v55 = v54;
        double v57 = v56;
        [(SSSScreenshotsView *)self _interScreenshotSpacing];
        double v59 = v58;
        double x = CGRectNull.origin.x;
        double v61 = y;
        double v62 = width;
        double v63 = height;
        if (v52 == v43)
        {
          [v43 rectToCenterAboveKeyboard];
          double x = v64;
          double v61 = v65;
          double v62 = v66;
          double v63 = v67;
        }
        -[SSSScreenshotsView _frameForScreenshot:atIndex:numberOfScreenshots:maximumSize:interScreenshotSpacing:rectToCenterAboveKeyboard:state:](self, "_frameForScreenshot:atIndex:numberOfScreenshots:maximumSize:interScreenshotSpacing:rectToCenterAboveKeyboard:state:", v53, (char *)i + v47, rect, v131, v55, v57, v59, x, v61, v62, v63);
        [v52 setFrame:];
        [(SSSScreenshotsView *)self _layoutScreenshotView:v52 forState:v131 isFirstScreenshot:v52 == v132 isCurrentScreenshot:v52 == v43];
        unsigned int v68 = [(SSSScreenshotsView *)self _shouldShowScreenshotViewAtIndex:(char *)i + v47];
        double v69 = 0.0;
        if (v68) {
          double v69 = 1.0;
        }
        [v52 setAlpha:v69];
        [v52 bounds];
        -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", v52);
        CGFloat v71 = v70;
        CGFloat v73 = v72;
        CGFloat v75 = v74;
        CGFloat v77 = v76;
        [(UINavigationBar *)self->_topBar frame];
        v159.origin.double x = v78;
        v159.origin.CGFloat y = v79;
        v159.size.CGFloat width = v80;
        v159.size.CGFloat height = v81;
        v147.origin.double x = v71;
        v147.origin.CGFloat y = v73;
        v147.size.CGFloat width = v75;
        v147.size.CGFloat height = v77;
        BOOL v82 = CGRectIntersectsRect(v147, v159);
        v43 = v130;
        BOOL v83 = v131 == 1 && v82;
        v46 |= v83;
      }
      id v45 = [(NSMutableArray *)obj countByEnumeratingWithState:&v139 objects:v145 count:16];
      v47 += (uint64_t)i;
    }
    while (v45);
  }
  else
  {
    char v46 = 0;
  }

  if (v131 == 1)
  {
    v84 = [(SSSScreenshotsView *)self visibleScreenshots];
    if ([v84 count]) {
      unsigned int v85 = ![(SSSScreenshotsView *)self _shouldAvoidKeyboard];
    }
    else {
      unsigned int v85 = 0;
    }

    if (v46) {
      goto LABEL_39;
    }
  }
  else
  {
    unsigned int v85 = 0;
    if (v46)
    {
LABEL_39:
      unsigned int v86 = [(SSSScreenshotsView *)self _shouldBleedToBottom];
      goto LABEL_40;
    }
  }
  unsigned int v86 = 1;
LABEL_40:
  double v87 = 0.0;
  if ((v85 & v86) != 0) {
    double v88 = 1.0;
  }
  else {
    double v88 = 0.0;
  }
  [(UINavigationBar *)self->_topBar setAlpha:v88];
  if (v131 == 1)
  {
    if ([(SSSScreenshotsView *)self _shouldShowBottomBar]) {
      double v87 = 1.0;
    }
    else {
      double v87 = 0.0;
    }
  }
  [(UIVisualEffectView *)self->_bottomBar setAlpha:v87];
  BOOL v91 = v85
     && (id)[(SSSScreenshotsView *)self editMode] != (id)2
     && ![(SSSScreenshotsView *)self isSharing]
     && ([(SSSScreenshotsView *)self delegate],
         v89 = objc_claimAutoreleasedReturnValue(),
         unsigned __int8 v90 = [v89 isShowingModalUI],
         v89,
         (v90 & 1) == 0)
     && [(SSSScreenshotsView *)self interactionMode] == 0;
  [(SSSScreenshotsView *)self _updatePaletteVisibilityIfNecessary:v91];
  [(SSSScrollView *)self->_scrollView contentSize];
  double v93 = v92;
  double v95 = v94;
  scrollView = self->_scrollView;
  [(SSSScreenshotsView *)self _scrollContentInsets];
  -[SSSScrollView setContentInset:](scrollView, "setContentInset:");
  [(SSSScreenshotsView *)self _scrollContentSize];
  double v98 = v97;
  [(SSSScrollView *)self->_scrollView bounds];
  double v100 = v99;
  -[SSSScrollView setContentSize:](self->_scrollView, "setContentSize:", v98, v99);
  if (v93 != v98 || v95 != v100) {
    [(SSSScreenshotsView *)self _updateScrollPositionForCurrentPage];
  }
  [(SSSScreenshotsView *)self _updateDisplayedPage];
  [(SSSScreenshotCountIndicator *)self->_countIndicator intrinsicContentSize];
  [v132 bounds];
  -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", v132);
  CGFloat v102 = v101;
  CGFloat v104 = v103;
  CGFloat v106 = v105;
  CGFloat recta = v107;
  long long v135 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  v108 = self->_screenshotViews;
  id v109 = [(NSMutableArray *)v108 countByEnumeratingWithState:&v135 objects:v144 count:16];
  if (v109)
  {
    id v110 = v109;
    uint64_t v111 = *(void *)v136;
    do
    {
      for (j = 0; j != v110; j = (char *)j + 1)
      {
        if (*(void *)v136 != v111) {
          objc_enumerationMutation(v108);
        }
        v113 = *(void **)(*((void *)&v135 + 1) + 8 * (void)j);
        [v113 bounds];
        -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", v113);
        CGFloat v114 = v148.origin.x;
        CGFloat v115 = v148.origin.y;
        CGFloat v116 = v148.size.width;
        CGFloat v117 = v148.size.height;
        double MaxY = CGRectGetMaxY(v148);
        v149.origin.double x = v102;
        v149.origin.CGFloat y = v104;
        v149.size.CGFloat width = v106;
        v149.size.CGFloat height = recta;
        if (MaxY > CGRectGetMaxY(v149))
        {
          CGFloat recta = v117;
          CGFloat v106 = v116;
          CGFloat v104 = v115;
          CGFloat v102 = v114;
        }
      }
      id v110 = [(NSMutableArray *)v108 countByEnumeratingWithState:&v135 objects:v144 count:16];
    }
    while (v110);
  }

  UIRectGetCenter();
  v150.origin.double x = v102;
  v150.origin.CGFloat y = v104;
  v150.size.CGFloat width = v106;
  v150.size.CGFloat height = recta;
  CGRectGetMaxY(v150);
  v119 = [(SSSScreenshotsView *)self traitCollection];
  id v120 = [v119 userInterfaceIdiom];

  if (v120 == (id)1)
  {
    [(SSSScreenshotsView *)self bounds];
    CGRectGetMaxY(v151);
    [(UIVisualEffectView *)self->_bottomBar bounds];
    [(UIVisualEffectView *)self->_bottomBar bounds];
    [(SSSScreenshotsView *)self safeAreaInsets];
  }
  else if ([(SSSScreenshotsView *)self _shouldExtendBottomBarForPageDots])
  {
    [(SSSScreenshotsView *)self bounds];
    CGRectGetMaxY(v152);
    [(UIVisualEffectView *)self->_bottomBar bounds];
    [(UIVisualEffectView *)self->_bottomBar bounds];
    [(SSSScreenshotsView *)self _effectiveBottomBarExtent];
  }
  else
  {
    [(SSSScreenshotsView *)self _effectiveBottomBarExtent];
    CGRectGetMinY(v153);
  }
  UIRectCenteredAboutPoint();
  -[SSSScreenshotCountIndicator sss_setFrameUnanimating:](self->_countIndicator, "sss_setFrameUnanimating:");
  [(SSSScreenshotCountIndicator *)self->_countIndicator setCount:[(SSSScreenshotsView *)self _numberOfPages]];
  if (v131) {
    double v121 = 1.0;
  }
  else {
    double v121 = 0.0;
  }
  if ([(SSSScreenshotsView *)self _numberOfPages] < 2
    || [(SSSScreenshotsView *)self _shouldAvoidKeyboard]
    || (id)[(SSSScreenshotsView *)self editMode] == (id)2)
  {
    double v121 = 0.0;
  }
  [(SSSScreenshotCountIndicator *)self->_countIndicator setAlpha:v121];
  [(SSSScreenshotsView *)self _updateShadowViewAlpha];
  shadowView = self->_shadowView;
  [(SSSScreenshotsView *)self bounds];
  -[SSSShadowView setFrame:](shadowView, "setFrame:");
  v123 = [(SSSScreenshotsView *)self _rectsForShadowView];
  [(SSSShadowView *)self->_shadowView setRectsForShadow:v123];
  if ([(SSSScreenshotsView *)self _shouldShowBottomBar])
  {
    [(UIVisualEffectView *)self->_bottomBar frame];
    double MinY = CGRectGetMinY(v154);
  }
  else
  {
    [(SSSScreenshotsView *)self bounds];
    double MinY = CGRectGetHeight(v155);
  }
  double v125 = MinY;
  [(UINavigationBar *)self->_topBar frame];
  double v126 = v125 - CGRectGetMaxY(v156);
  [(UINavigationBar *)self->_topBar frame];
  double v127 = CGRectGetMaxY(v157);
  [(SSSScreenshotsView *)self bounds];
  -[UIView setFrame:](self->_rulerHostingView, "setFrame:", 0.0, v127, CGRectGetWidth(v158), v126);
  [(SSSScreenshotsView *)self _layoutThumbnailView];
  [(SSSScreenshotsView *)self setActiveScreenshotView:v130];
}

- (void)_setupPaletteIfNecessary
{
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    toolPalette = self->_toolPalette;
    if (!toolPalette)
    {
      uint64_t v16 = 0;
      double v17 = &v16;
      uint64_t v18 = 0x2050000000;
      double v4 = (void *)qword_1000B5828;
      uint64_t v19 = qword_1000B5828;
      if (!qword_1000B5828)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100041E24;
        v15[3] = &unk_100099928;
        v15[4] = &v16;
        sub_100041E24((uint64_t)v15);
        double v4 = (void *)v17[3];
      }
      double v5 = v4;
      _Block_object_dispose(&v16, 8);
      double v6 = (AKToolbarView *)objc_alloc_init(v5);
      unint64_t v7 = self->_toolPalette;
      self->_toolPalette = v6;

      [(AKToolbarView *)self->_toolPalette setOpaque:0];
      double v8 = self->_toolPalette;
      double v9 = +[UIColor clearColor];
      [(AKToolbarView *)v8 setBackgroundColor:v9];

      [(AKToolbarView *)self->_toolPalette setWantsClearBackgroundColorInCompactSize:1];
      double v10 = [(SSSScreenshotsView *)self traitCollection];
      id v11 = [v10 userInterfaceIdiom];

      toolPalette = self->_toolPalette;
      if (!v11)
      {
        [(AKToolbarView *)toolPalette setSupportsOpacityEditing:1];
        [(AKToolbarView *)self->_toolPalette setOpacityEditingDelegate:self];
        toolPalette = self->_toolPalette;
      }
    }
    double v12 = toolPalette;
    [(SSSScreenshotsView *)self bounds];
    -[AKToolbarView sss_setFrameUnanimatingLayingOut:](v12, "sss_setFrameUnanimatingLayingOut:");
    [(AKToolbarView *)self->_toolPalette setUndoRedoButtonsHidden:1];
    [(AKToolbarView *)self->_toolPalette setShareButtonHidden:1];
    double v13 = self->_toolPalette;
    v14 = [(SSSScreenshotsView *)self shareItemTarget];
    [(AKToolbarView *)v13 setShareButtonTarget:v14];

    [(AKToolbarView *)self->_toolPalette setShareButtonAction:[(SSSScreenshotsView *)self shareItemAction]];
    [(AKToolbarView *)self->_toolPalette setAccessibilityIdentifier:@"annotation-bottom-bar"];
  }
}

- (void)setInteractionMode:(unint64_t)a3
{
  self->_interactionMode = a3;
  screenshotViews = self->_screenshotViews;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003B5F0;
  v10[3] = &unk_10009A948;
  v10[4] = a3;
  [(NSMutableArray *)screenshotViews enumerateObjectsUsingBlock:v10];
  [(UIButton *)self->_visualSearchButton setSelected:a3 == 2];
  [(UIButton *)self->_visualSearchButton setHidden:self->_interactionMode == 3];
  [(SSSScreenshotsView *)self _updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:1];
  if (self->_interactionMode)
  {
    double v6 = [(SSSScreenshotsView *)self currentScreenshotView];
    [v6 deselectAllAnnotations];

    [(AKToolbarView *)self->_toolPalette endAnnotationEditing];
  }
  if (a3 == 2)
  {
    unint64_t v7 = [(SSSScreenshotView *)self->_activeScreenshotView _visualSearchCornerViewIfExists];
    visualSearchCornerView = self->_visualSearchCornerView;
    self->_visualSearchCornerView = v7;

    [(SSSScreenshotsView *)self addSubview:self->_visualSearchCornerView];
    [(SSSScreenshotsView *)self _updateVisualSearchCornerViewPositioning];
  }
  else
  {
    double v9 = self->_visualSearchCornerView;
    if (v9) {
      [(UIView *)v9 removeFromSuperview];
    }
  }
  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (void)_updateVisualSearchCornerViewPositioning
{
  [(SSSScreenshotView *)self->_activeScreenshotView cropOverlayViewRectInWindow];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(SSSScreenshotsView *)self window];
  -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", v11, v4, v6, v8, v10);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v30.origin.double x = v13;
  v30.origin.CGFloat y = v15;
  v30.size.CGFloat width = v17;
  v30.size.CGFloat height = v19;
  double MaxX = CGRectGetMaxX(v30);
  [(UIView *)self->_visualSearchCornerView bounds];
  double v22 = MaxX - v21 + -18.0;
  v31.origin.double x = v13;
  v31.origin.CGFloat y = v15;
  v31.size.CGFloat width = v17;
  v31.size.CGFloat height = v19;
  double MaxY = CGRectGetMaxY(v31);
  [(UIView *)self->_visualSearchCornerView bounds];
  double v25 = MaxY - v24 + -18.0;
  visualSearchCornerView = self->_visualSearchCornerView;
  [(UIView *)visualSearchCornerView bounds];
  double v28 = v27;
  [(UIView *)self->_visualSearchCornerView bounds];

  -[UIView setFrame:](visualSearchCornerView, "setFrame:", v22, v25, v28);
}

- (void)_updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  double v5 = [(SSSScreenshotsView *)self activeScreenshotView];
  unint64_t v6 = (unint64_t)[v5 editMode];

  double v7 = [(SSSScreenshotsView *)self traitCollection];
  unint64_t v8 = (unint64_t)[v7 userInterfaceIdiom];

  if (v8) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  BOOL v10 = v9;
  if (!(v8 | v6)) {
    BOOL v10 = [(SSSScreenshotsView *)self interactionMode] != 0;
  }
  id v11 = [(SSSScreenshotsView *)self activeScreenshotView];
  double v12 = [v11 currentImageAnalysis];

  if (v12 && [v12 hasResultsForAnalysisTypes:16])
  {
    CGFloat v13 = [(SSSScreenshotsView *)self activeScreenshotView];
    uint64_t v14 = [v13 vsGlyph];
    CGFloat v15 = (void *)v14;
    double v16 = @"info.circle.and.sparkles";
    if (v14) {
      double v16 = (__CFString *)v14;
    }
    CGFloat v17 = v16;

    double v18 = [(SSSScreenshotsView *)self activeScreenshotView];
    uint64_t v19 = [v18 vsGlyphFilled];
    double v20 = (void *)v19;
    double v21 = @"info.circle.and.sparkles.fill";
    if (v19) {
      double v21 = (__CFString *)v19;
    }
    double v22 = v21;

    double v23 = +[UIImageSymbolConfiguration configurationWithScale:3];
    double v24 = +[UIImage _systemImageNamed:v17 withConfiguration:v23];

    double v25 = +[UIImageSymbolConfiguration configurationWithScale:3];
    v26 = +[UIImage _systemImageNamed:v22 withConfiguration:v25];

    [(UIButton *)self->_visualSearchButton setImage:v24 forState:0];
    [(UIButton *)self->_visualSearchButton setImage:v26 forState:4];

    int v27 = 1;
  }
  else
  {
    int v27 = 0;
  }
  double v28 = [(SSSScreenshotsView *)self delegate];
  uint64_t v29 = v10 & v27;
  [v28 updateAnalysisButtonStateToVisible:v29];

  if (v29) {
    double v30 = 1.0;
  }
  else {
    double v30 = 0.0;
  }
  if (v3)
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10003BA70;
    v31[3] = &unk_10009A970;
    objc_copyWeak(v32, &location);
    v32[1] = *(id *)&v30;
    +[UIView animateWithDuration:v31 animations:0.25];
    objc_destroyWeak(v32);
  }
  else
  {
    [(UIButton *)self->_visualSearchButton setAlpha:v30];
    [(SSSScreenshotsView *)self _updateInstructionLabelIfNecessaryAnimated:0];
  }

  objc_destroyWeak(&location);
}

- (void)_removeHighlightedModeForScreenshotViewIfNecessary:(id)a3
{
  id v3 = a3;
  if ([v3 interactionMode] == (id)3) {
    [v3 setInteractionMode:1];
  }
}

- (void)_updateInstructionLabelIfNecessaryAnimated:(BOOL)a3
{
  double v4 = [(SSSScreenshotsView *)self currentScreenshotView];
  double v5 = [v4 currentImageAnalysis];
  id v6 = [v5 countOfDataDetectorsWithTypes:-1];

  double v7 = +[NSBundle mainBundle];
  unint64_t v8 = v7;
  if (v6)
  {
    CFStringRef v9 = @"CROP_AND_SCALE_OR_SELECT_TEXT_LABEL";
    CFStringRef v10 = @"Crop and scale or select text";
  }
  else
  {
    CFStringRef v9 = @"CROP_AND_SCALE_LABEL";
    CFStringRef v10 = @"Crop and scale";
  }
  id v14 = [v7 localizedStringForKey:v9 value:v10 table:0];

  double v11 = 0.0;
  if (self->_interactionMode == 1)
  {
    double v12 = [(UILabel *)self->_instructionLabel text];
    unsigned __int8 v13 = [v12 isEqualToString:v14];

    double v11 = 1.0;
    if ((v13 & 1) == 0)
    {
      [(UILabel *)self->_instructionLabel setAlpha:0.0];
      [(UILabel *)self->_instructionLabel setText:v14];
    }
  }
  [(UILabel *)self->_instructionLabel setAlpha:v11];
}

- (void)_updateFirstResponderForHidingToolPicker
{
  id v3 = [(SSSScreenshotsView *)self delegate];
  id v6 = [v3 viewControllerForPresentationsFromScreenshotsView:self];

  double v4 = [(SSSScreenshotsView *)self window];
  id v5 = [v4 firstResponder];

  if (v5 != v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      [v6 becomeFirstResponder];
    }
  }
}

- (void)_updatePaletteVisibilityIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(SSSScreenshotsView *)self currentScreenshotView];
  if (_os_feature_enabled_impl() && ![(SSSScreenshotsView *)self editMode]
    || _os_feature_enabled_impl() && (id)[(SSSScreenshotsView *)self editMode] == (id)1)
  {
    if (v3)
    {
      [v9 updatePaletteVisibilityIfNecessary:[v9 isBeingRemoved] ^ 1];
    }
    else
    {
      [v9 updatePaletteVisibilityIfNecessary:0];
      [(SSSScreenshotsView *)self _updateFirstResponderForHidingToolPicker];
    }
  }
  else if (self->_toolPalette && self->_isShowingToolPalette != v3)
  {
    id v5 = [(SSSScreenshotsView *)self delegate];
    id v6 = [v5 viewControllerForPresentationsFromScreenshotsView:self];

    double v7 = [(SSSScreenshotsView *)self window];
    unint64_t v8 = [v7 firstResponder];

    if (!v8 || v8 != v6 && ![(SSSScreenshotsView *)self _shouldAvoidKeyboard]) {
      [v6 becomeFirstResponder];
    }
    if ([(AKToolbarView *)self->_toolPalette setToolPickerVisible:v3 forFirstResponder:v6])self->_isShowingToolPalette = v3; {
  }
    }
}

- (void)updateForFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[SSSScreenshotsView setFrame:](self, "setFrame:");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unint64_t v8 = self->_screenshotViews;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      double v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) updateForFrame:x, y, width, height, (void)v13];
        double v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (BOOL)_shouldShowBottomBar
{
  BOOL v3 = [(SSSScreenshotsView *)self traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  int64_t v5 = [(SSSScreenshotsView *)self editMode];
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5 == 2;
  }
  return !v6;
}

- (BOOL)_shouldExtendBottomBarForPageDots
{
  if (![(SSSScreenshotsView *)self _anyScreenshotPDFViewNeedsBleedToBottom]) {
    return 0;
  }
  BOOL v3 = [(SSSScreenshotsView *)self visibleScreenshots];
  if ((unint64_t)[v3 count] < 2)
  {
    BOOL v5 = 0;
  }
  else
  {
    id v4 = [(SSSScreenshotsView *)self traitCollection];
    BOOL v5 = [v4 userInterfaceIdiom] == 0;
  }
  return v5;
}

- (double)_toolPickerHeightOnPhone
{
  v2 = [(SSSScreenshotsView *)self window];
  [v2 safeAreaInsets];
  double v4 = v3 + 75.0;

  return v4;
}

- (double)_bottomBarHeightIncludingSafeAreaInsets
{
  if ([(SSSScreenshotsView *)self _shouldShowBottomBar])
  {
    int64_t v3 = [(SSSScreenshotsView *)self editMode];
    unint64_t v4 = [(SSSScreenshotsView *)self interactionMode];
    BOOL v5 = +[UIDevice currentDevice];
    unint64_t v6 = (unint64_t)[v5 userInterfaceIdiom];

    [(SSSScreenshotsView *)self safeAreaInsets];
    double v8 = v7;
    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      double v8 = v7 + 40.0;
    }
    else if (!v3 || !v4)
    {
      [(SSSScreenshotsView *)self _toolPickerHeightOnPhone];
      double v8 = v11;
    }
  }
  else
  {
    id v9 = [(SSSScreenshotsView *)self traitCollection];
    if ([v9 userInterfaceIdiom] == (id)1)
    {
      [(SSSScreenshotsView *)self safeAreaInsets];
      double v8 = v10 + 40.0;
    }
    else
    {
      [(SSSScreenshotsView *)self _toolPickerHeightOnPhone];
      double v8 = v12;
    }
  }
  unsigned int v13 = [(SSSScreenshotsView *)self _shouldExtendBottomBarForPageDots];
  double result = v8 + 26.0;
  if (!v13) {
    return v8;
  }
  return result;
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SSSScreenshotsView;
  [(SSSScreenshotsView *)&v3 safeAreaInsetsDidChange];
  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (void)_layoutScreenshotView:(id)a3 forState:(unint64_t)a4 isFirstScreenshot:(BOOL)a5 isCurrentScreenshot:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v18 = v9;
  if (a4 == 1)
  {
    [v9 prepareForFullscreenExperience];
    if (!self->_isInStateTransition) {
      [v18 finishPreparingForFullscreenExperience];
    }
    goto LABEL_6;
  }
  if (self->_isInStateTransition)
  {
    [v9 prepareForMiniaturization];
LABEL_6:
    id v9 = v18;
  }
  [v9 setState:a4];
  uint64_t v10 = sub_10004CA5C(a4, self->_borderViewStyleOverride);
  uint64_t v11 = 0;
  if (a4 == 1 && v6) {
    uint64_t v11 = [(SSSScreenshotsView *)self _screenshotEditsShouldBeSnapshottedForCurrentScreenshot] ^ 1;
  }
  if (a4 == 1 && v11 != 1) {
    [v18 commitInflightEdits];
  }
  [v18 setBorderStyle:v10];
  [v18 setUsesOriginalImageAspectRatio:sub_10004CA74(a4)];
  [v18 setGesturesEnabled:a4 == 1];
  [v18 setAnnotationsEnabled:v11];
  if (v6)
  {
    [v18 setScreenshotEditsSnapshotted:v11 ^ 1 inTransition:self->_isInStateTransition currentScreenshot:1];
    if (![(SSSScreenshotsView *)self currentScreenshotCropHandlesFadedOut])
    {
      unsigned int v12 = ![(SSSScreenshotsView *)self _shouldAvoidKeyboard];
      goto LABEL_20;
    }
  }
  else
  {
    if (![(SSSScrollView *)self->_scrollView isMoving]) {
      [v18 deselectAllAnnotations];
    }
    [v18 setScreenshotEditsSnapshotted:v11 ^ 1 inTransition:self->_isInStateTransition currentScreenshot:0];
  }
  unsigned int v12 = 0;
LABEL_20:
  unsigned int v13 = v12 ^ 1;
  if (a4) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 1;
  }
  [v18 setCropHandlesFadedOut:v14];
  [v18 setUseTrilinearMinificationFilter:[self screenshotViewsUseTrilinearMinificationFilter]];
  long long v15 = [(SSSScreenshotsView *)self traitCollection];
  [v18 setGeometryMultiplier:1.0 / sub_10000E1FC()];

  if (v11)
  {
    long long v16 = [(AKToolbarView *)self->_toolPalette annotationController];
    CGFloat v17 = [v18 akController];
    if (v16 != v17) {
      [(AKToolbarView *)self->_toolPalette setAnnotationController:v17];
    }
  }
}

- (void)setActiveScreenshotView:(id)a3
{
  BOOL v5 = (SSSScreenshotView *)a3;
  if (self->_state)
  {
    activeScreenshotView = self->_activeScreenshotView;
    if (activeScreenshotView != v5)
    {
      uint64_t v10 = v5;
      double v7 = activeScreenshotView;
      objc_storeStrong((id *)&self->_activeScreenshotView, a3);
      [(SSSScreenshotsView *)self addOrRemoveAAButtonIfNecessary];
      BOOL v8 = ![(SSSScreenshotView *)v10 editMode]
        && [(SSSScreenshotsView *)self interactionMode];
      [(SSSScreenshotsView *)self setInteractionMode:v8];
      [(SSSScreenshotsView *)self _updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:1];
      id v9 = [(SSSScreenshotsView *)self delegate];
      [v9 activeScreenshotViewDidChangeToView:self->_activeScreenshotView fromView:v7];

      [(SSSScreenshotsView *)self _removeHighlightedModeForScreenshotViewIfNecessary:v7];
      BOOL v5 = v10;
    }
  }
}

- (UIBarButtonItem)currentLiveTextBarButtonItemIfExists
{
  return (UIBarButtonItem *)[(SSSScreenshotView *)self->_activeScreenshotView _imageAnalysisAaBarButtonItemIfExists];
}

- (void)addOrRemoveActionInfoViewIfNecessary
{
  objc_super v3 = [(SSSScreenshotsView *)self traitCollection];
  id v4 = [v3 userInterfaceIdiom];

  if (!v4)
  {
    BOOL v5 = [(SSSScreenshotView *)self->_activeScreenshotView _actionInfoViewIfExists];
    p_actionInfoView = &self->_actionInfoView;
    actionInfoView = self->_actionInfoView;
    if (v5 != actionInfoView)
    {
      [(UIView *)actionInfoView removeFromSuperview];
      objc_storeStrong((id *)&self->_actionInfoView, v5);
    }
    BOOL v8 = [(UIVisualEffectView *)self->_bottomBar contentView];
    if (*p_actionInfoView && self->_liveTextButton)
    {
      id v9 = [(UIView *)*p_actionInfoView superview];

      if (v9 != v8)
      {
        [v8 addSubview:*p_actionInfoView];
        [(UIView *)*p_actionInfoView setTranslatesAutoresizingMaskIntoConstraints:0];
        double v21 = [(UIView *)*p_actionInfoView leadingAnchor];
        double v20 = [v8 leadingAnchor];
        uint64_t v19 = [v21 constraintEqualToAnchor:v20 constant:20.0];
        v22[0] = v19;
        id v18 = [(UIView *)*p_actionInfoView trailingAnchor];
        uint64_t v10 = [(UIButton *)self->_liveTextButton leadingAnchor];
        uint64_t v11 = [v18 constraintEqualToAnchor:v10 constant:-10.0];
        v22[1] = v11;
        unsigned int v12 = [(UIView *)*p_actionInfoView centerYAnchor];
        unsigned int v13 = [(UIButton *)self->_visualSearchButton centerYAnchor];
        uint64_t v14 = [v12 constraintEqualToAnchor:v13];
        v22[2] = v14;
        long long v15 = [(UIView *)*p_actionInfoView heightAnchor];
        long long v16 = [v15 constraintEqualToConstant:35.0];
        v22[3] = v16;
        CGFloat v17 = +[NSArray arrayWithObjects:v22 count:4];
        +[NSLayoutConstraint activateConstraints:v17];
      }
    }
  }
}

- (void)addOrRemoveAAButtonIfNecessary
{
  objc_super v3 = [(SSSScreenshotView *)self->_activeScreenshotView _imageAnalysisAaButtonIfExists];
  p_liveTextButton = &self->_liveTextButton;
  liveTextButton = self->_liveTextButton;
  if (v3 != liveTextButton)
  {
    [(UIButton *)liveTextButton removeFromSuperview];
    objc_storeStrong((id *)&self->_liveTextButton, v3);
    if (*p_liveTextButton)
    {
      BOOL v6 = [(UIVisualEffectView *)self->_bottomBar contentView];
      [v6 addSubview:*p_liveTextButton];
      [(UIButton *)*p_liveTextButton setTranslatesAutoresizingMaskIntoConstraints:0];
      double v7 = [(UIButton *)*p_liveTextButton trailingAnchor];
      BOOL v8 = [v6 trailingAnchor];
      id v9 = [v7 constraintEqualToAnchor:v8 constant:-20.0];
      v14[0] = v9;
      uint64_t v10 = [(UIButton *)*p_liveTextButton centerYAnchor];
      uint64_t v11 = [(UIButton *)self->_visualSearchButton centerYAnchor];
      unsigned int v12 = [v10 constraintEqualToAnchor:v11];
      v14[1] = v12;
      unsigned int v13 = +[NSArray arrayWithObjects:v14 count:2];
      +[NSLayoutConstraint activateConstraints:v13];
    }
  }
  [(SSSScreenshotsView *)self addOrRemoveActionInfoViewIfNecessary];
}

- (CGRect)_frameForScreenshot:(id)a3 atIndex:(int64_t)a4 numberOfScreenshots:(int64_t)a5 maximumSize:(CGSize)a6 interScreenshotSpacing:(double)a7 rectToCenterAboveKeyboard:(CGRect)a8 state:(unint64_t)a9
{
  double width = a8.size.width;
  double height = a8.size.height;
  double r2 = a8.origin.y;
  double x = a8.origin.x;
  uint64_t v14 = [(SSSScreenshotsView *)self screenshotViewForScreenshot:a3];
  long long v72 = 0u;
  long long v73 = 0u;
  long long v71 = 0u;
  long long v15 = [v14 viewModificationInfo];
  long long v16 = v15;
  if (v15)
  {
    [v15 cropInfo];
  }
  else
  {
    long long v72 = 0u;
    long long v73 = 0u;
    long long v71 = 0u;
  }

  SSizeToFitSizeInAspectRatioOfSize();
  [(SSSScreenshotsView *)self effectiveUserInterfaceLayoutDirection];
  uint64_t v70 = 0;
  memset(v69, 0, sizeof(v69));
  CGFloat v17 = [(SSSScreenshotsView *)self traitCollection];
  sub_10000E15C(v17, (uint64_t)v69);

  if (![(SSSScreenshotsView *)self _currentUserInterfaceIdiom])
  {
    [(SSSScreenshotsView *)self _availableRectForContent];
    UIRectCenteredIntegralRect();
    double v19 = v42;
    double v44 = v43;
    double v23 = v45;
    double v25 = v46;
    [(SSSScreenshotsView *)self safeAreaInsets];
    double v21 = v44 - v47;
    if (a9) {
      goto LABEL_6;
    }
LABEL_14:
    SSizeToFitSizeInAspectRatioOfSize();
    [(SSSScrollView *)self->_scrollView bounds];
    sub_10000E208();
    v48 = [(SSSScreenshotsView *)self traitCollection];
    sub_10000E1FC();

    v49 = [(SSSScreenshotsView *)self traitCollection];
    sub_10000E1FC();

    [(SSSScreenshotsView *)self _positioningIndexForIndex:a4 numberOfScreenshots:a5];
    SSRoundRectToScale();
    double v19 = v50;
    double v21 = v51;
    double v23 = v52;
    double v25 = v53;
    goto LABEL_15;
  }
  [(SSSScrollView *)self->_scrollView bounds];
  UIRectCenteredIntegralRect();
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  if (!a9) {
    goto LABEL_14;
  }
LABEL_6:
  if (a9 == 1)
  {
    [(SSSScreenshotsView *)self _effectiveIndexForIndex:a4 inNumberOfScreenshots:a5];
    SSRoundRectToScale();
    double v19 = v26;
    double v21 = v27;
    double v23 = v28;
    double v25 = v29;
    if (![(SSSScreenshotsView *)self editMode] && !CGRectIsNull(self->_keyboardFrame))
    {
      v82.origin.double x = CGRectNull.origin.x;
      v82.origin.CGFloat y = CGRectNull.origin.y;
      v82.size.double width = CGRectNull.size.width;
      v82.size.double height = CGRectNull.size.height;
      v74.origin.double x = x;
      v74.origin.CGFloat y = r2;
      v74.size.double width = width;
      v74.size.double height = height;
      if (!CGRectEqualToRect(v74, v82))
      {
        -[UIView setFrame:](self->_layoutPositioningView, "setFrame:", v19, v21, v23, v25);
        -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", self->_layoutPositioningView, x, r2, width, height);
        CGFloat v64 = v31;
        CGFloat v67 = v30;
        CGFloat r2b = v32;
        CGFloat v34 = v33;
        [(SSSScreenshotsView *)self safeAreaInsets];
        CGFloat v36 = v35;
        v75.origin.double x = v19;
        v75.origin.CGFloat y = v21;
        v75.size.double width = v23;
        v75.size.double height = v25;
        CGRect v83 = CGRectOffset(v75, 0.0, v36);
        CGRect v76 = CGRectIntersection(self->_keyboardFrame, v83);
        CGFloat y = v76.origin.y;
        CGFloat v38 = v76.size.width;
        CGFloat v39 = v76.size.height;
        CGFloat v59 = v76.origin.x;
        v84.origin.CGFloat y = v64;
        v84.origin.double x = v67;
        v84.size.double width = r2b;
        v84.size.double height = v34;
        CGRect v77 = CGRectIntersection(v76, v84);
        CGFloat v40 = v77.size.height;
        CGFloat v65 = v77.origin.y;
        CGFloat v68 = v77.origin.x;
        CGFloat r2a = v77.size.width;
        if (!CGRectIsEmpty(v77))
        {
          CGFloat v58 = y;
          v78.origin.double x = v68;
          v78.origin.CGFloat y = v65;
          v78.size.double width = r2a;
          v78.size.double height = v40;
          if (!CGRectIsNull(v78))
          {
            v79.origin.double x = v68;
            v79.origin.CGFloat y = v65;
            v79.size.double width = r2a;
            v79.size.double height = v40;
            double MaxY = CGRectGetMaxY(v79);
            v80.origin.CGFloat y = v58;
            v80.origin.double x = v59;
            v80.size.double height = v39;
            v80.size.double width = v38;
            double v21 = v21 - (MaxY - CGRectGetMinY(v80));
          }
        }
      }
    }
  }
LABEL_15:

  double v54 = v19;
  double v55 = v21;
  double v56 = v23;
  double v57 = v25;
  result.size.double height = v57;
  result.size.double width = v56;
  result.origin.CGFloat y = v55;
  result.origin.double x = v54;
  return result;
}

- (CGRect)_layoutBounds
{
  [(SSSScreenshotsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(SSSScreenshotsView *)self state];
  [(SSSScreenshotsView *)self safeAreaInsets];
  if (v11 == 1)
  {
    if (v13 < v15) {
      double v13 = v15;
    }
    double v4 = v4 + v13;
    double v6 = v6 + v12;
    double v8 = v8 - (v13 + v13);
    double v10 = v10 - (v12 + v14);
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.CGFloat y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)_layoutBoundsForFullPageThumbnail
{
  [(SSSScreenshotsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  unint64_t v11 = [(SSSScreenshotsView *)self state];
  [(SSSScreenshotsView *)self safeAreaInsets];
  if (v11 == 1)
  {
    double v4 = v4 + v13;
    double v6 = v6 + v12;
    double v8 = v8 - (v13 + v15);
    double v10 = v10 - (v12 + v14);
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.CGFloat y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)_availableRectForContent
{
  [(SSSScreenshotsView *)self _layoutBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ((id)[(SSSScreenshotsView *)self state] == (id)1)
  {
    if ([(SSSScreenshotsView *)self _currentPage])
    {
      double cachedTopBarHeight = self->_cachedTopBarHeight;
    }
    else
    {
      [(UINavigationBar *)self->_topBar bounds];
      double cachedTopBarHeight = v11;
      self->_double cachedTopBarHeight = v11;
    }
    [(SSSScreenshotsView *)self _bottomBarHeightIncludingSafeAreaInsets];
    double v13 = v12;
    [(SSSScreenshotsView *)self safeAreaInsets];
    double v32 = fmax(v13 - v14, 0.0);
    double v15 = [(SSSScreenshotsView *)self visibleScreenshots];
    BOOL v16 = (unint64_t)[v15 count] > 1;

    double v17 = [(SSSScreenshotsView *)self traitCollection];
    id v18 = [v17 userInterfaceIdiom];

    double v19 = [(SSSScreenshotsView *)self window];
    [v19 bounds];
    +[SSChromeHelper availableRectForFullscreenContent:layoutBounds:bleedToBottom:topBarHeight:bottomBarHeight:userInterfaceIdiom:multipleScreenshots:](SSChromeHelper, "availableRectForFullscreenContent:layoutBounds:bleedToBottom:topBarHeight:bottomBarHeight:userInterfaceIdiom:multipleScreenshots:", [(SSSScreenshotsView *)self _shouldBleedToBottom], v18, v16, v20, v21, v22, v23, v4, v6, v8, v10, *(void *)&cachedTopBarHeight, *(void *)&v32);
    double v4 = v24;
    double v6 = v25;
    double v8 = v26;
    double v10 = v27;
  }
  double v28 = v4;
  double v29 = v6;
  double v30 = v8;
  double v31 = v10;
  result.size.double height = v31;
  result.size.double width = v30;
  result.origin.CGFloat y = v29;
  result.origin.double x = v28;
  return result;
}

- (CGSize)_screenshotMaximumSize
{
  [(SSSScreenshotsView *)self _availableRectForContent];
  [(SSSScreenshotsView *)self bounds];
  SSizeToFitSizeInAspectRatioOfSize();
  double v3 = [(SSSScreenshotsView *)self traitCollection];
  [v3 displayScale];
  SSRoundSizeToScale();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (double)_interScreenshotSpacing
{
  [(SSSScreenshotsView *)self _screenshotMaximumSize];
  double v4 = v3;
  [(SSSScreenshotsView *)self bounds];
  return (v5 - v4) * 0.25;
}

- (UIEdgeInsets)_scrollContentInsets
{
  uint64_t v3 = [(SSSScreenshotsView *)self numberOfScreenshotImages];
  double left = UIEdgeInsetsZero.left;
  CGFloat bottom = UIEdgeInsetsZero.bottom;
  double right = UIEdgeInsetsZero.right;
  id v7 = [(SSSScreenshotsView *)self effectiveUserInterfaceLayoutDirection];
  unint64_t v8 = [(SSSScreenshotsView *)self state];
  if (v3 < 1)
  {
    if (v8 == 1)
    {
      [(SSSScreenshotsView *)self _interScreenshotSpacing];
      double left = v18 + v18;
      [(SSSScreenshotsView *)self _interScreenshotSpacing];
      double right = v19 + v19;
    }
  }
  else if (v8 == 1)
  {
    double v9 = [(NSMutableArray *)self->_screenshotViews firstObject];
    uint64_t v10 = [(NSMutableArray *)self->_screenshotViews lastObject];
    double v11 = (void *)v10;
    BOOL v12 = v7 == 0;
    if (v7) {
      double v13 = (void *)v10;
    }
    else {
      double v13 = v9;
    }
    if (v12) {
      double v14 = (void *)v10;
    }
    else {
      double v14 = v9;
    }
    id v15 = v14;
    [v13 frame];
    [(SSSScreenshotsView *)self bounds];
    UIRectCenteredXInRect();
    double left = v16;
    [v15 frame];

    [(SSSScreenshotsView *)self bounds];
    UIRectCenteredXInRect();
    double right = v17;
  }
  double top = UIEdgeInsetsZero.top;
  double v21 = left;
  double v22 = bottom;
  double v23 = right;
  result.double right = v23;
  result.CGFloat bottom = v22;
  result.double left = v21;
  result.double top = top;
  return result;
}

- (CGSize)_scrollContentSize
{
  [(SSSScreenshotsView *)self bounds];
  CGFloat width = v3;
  if ([(SSSScreenshotsView *)self numberOfScreenshotImages] >= 1
    && (id)[(SSSScreenshotsView *)self state] == (id)1)
  {
    CGFloat width = CGRectNull.size.width;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v5 = self->_screenshotViews;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      CGFloat x = CGRectNull.origin.x;
      CGFloat y = CGRectNull.origin.y;
      CGFloat height = CGRectNull.size.height;
      uint64_t v11 = *(void *)v21;
      do
      {
        BOOL v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v20 + 1) + 8 * (void)v12) frame:(void)v20];
          v28.origin.CGFloat x = v13;
          v28.origin.CGFloat y = v14;
          v28.size.CGFloat width = v15;
          v28.size.CGFloat height = v16;
          v26.origin.CGFloat x = x;
          v26.origin.CGFloat y = y;
          v26.size.CGFloat width = width;
          v26.size.CGFloat height = height;
          CGRect v27 = CGRectUnion(v26, v28);
          CGFloat x = v27.origin.x;
          CGFloat y = v27.origin.y;
          CGFloat width = v27.size.width;
          CGFloat height = v27.size.height;
          BOOL v12 = (char *)v12 + 1;
        }
        while (v7 != v12);
        id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
  }
  [(SSSScrollView *)self->_scrollView frame];
  double v17 = width;
  double v19 = v18;
  result.CGFloat height = v19;
  result.CGFloat width = v17;
  return result;
}

- (BOOL)_showAllScreenshotsForNumberOfScreenshots:(int64_t)a3
{
  unint64_t v4 = [(SSSScreenshotsView *)self state];
  return a3 < 4 || v4 == 1;
}

- (BOOL)_shouldShowScreenshotViewAtIndex:(int64_t)a3
{
  if ((id)[(SSSScreenshotsView *)self editMode] == (id)2
    && [(SSSScreenshotsView *)self _currentPage] != a3)
  {
    return 0;
  }
  if ([(SSSScreenshotsView *)self _showAllScreenshotsForNumberOfScreenshots:[(SSSScreenshotsView *)self _numberOfPages]])
  {
    return 1;
  }
  uint64_t v6 = [(SSSScreenshotsView *)self _numberOfPages];
  int64_t v7 = [(SSSScreenshotsView *)self _numberOfPages];
  if (v6 >= 0) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v6 + 1;
  }
  BOOL v9 = v8 >> 1 == a3 || v7 - 1 == a3;
  return !a3 || v9;
}

- (int64_t)_positioningIndexForIndex:(int64_t)a3 numberOfScreenshots:(int64_t)a4
{
  if (![(SSSScreenshotsView *)self _showAllScreenshotsForNumberOfScreenshots:a4])return (uint64_t)((double)a3 / (double)a4 * 3.0); {
  return a3;
  }
}

- (int64_t)_effectiveIndexForIndex:(int64_t)a3 inNumberOfScreenshots:(int64_t)a4
{
  if ([(SSSScreenshotsView *)self effectiveUserInterfaceLayoutDirection]) {
    return ~a3 + a4;
  }
  else {
    return a3;
  }
}

- (id)_rectsForShadowView
{
  double v3 = +[NSMutableArray array];
  unint64_t v4 = [(SSSScreenshotsView *)self visibleScreenshots];
  uint64_t v5 = (uint64_t)[v4 count];
  if (v5 >= 1)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    double y = CGRectNull.origin.y;
    double width = CGRectNull.size.width;
    double height = CGRectNull.size.height;
    do
    {
      uint64_t v11 = [v4 objectAtIndex:v7];
      [(SSSScreenshotsView *)self bounds];
      -[SSSScreenshotsView _frameForScreenshot:atIndex:numberOfScreenshots:maximumSize:interScreenshotSpacing:rectToCenterAboveKeyboard:state:](self, "_frameForScreenshot:atIndex:numberOfScreenshots:maximumSize:interScreenshotSpacing:rectToCenterAboveKeyboard:state:", v11, v7, v6, 0, v12, v13, 0.0, CGRectNull.origin.x, y, width, height);
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v22 = sub_10000E208();
      long long v23 = +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v15 - v22, v17 - v22, v19 + v22 * 2.0, v21 + v22 * 2.0);
      [v3 addObject:v23];

      ++v7;
    }
    while (v6 != v7);
  }

  return v3;
}

- (double)_thumbnailTrayWidth
{
  [(SSSScreenshotsView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = [(SSSScreenshotsView *)self traitCollection];
  BOOL v8 = [v7 userInterfaceIdiom] == (id)1;

  BOOL v9 = [(SSSScreenshotsView *)self traitCollection];
  id v10 = [v9 userInterfaceIdiom];
  double v11 = fmax(v4, v6);
  double v12 = fmin(v4, v6);
  if (v10 == (id)1) {
    double v13 = v11;
  }
  else {
    double v13 = v12;
  }
  double v14 = dbl_100076010[v8];

  return v14 * v13;
}

- (void)_layoutThumbnailView
{
  if ((id)[(SSSScreenshotsView *)self editMode] == (id)1)
  {
    double v3 = [(SSSScreenshotsView *)self _viewForPage:[(SSSScreenshotsView *)self _currentPage]];
    [v3 setNeedsLayout];

    double v4 = [(SSSScreenshotsView *)self _viewForPage:[(SSSScreenshotsView *)self _currentPage]];
    [v4 layoutIfNeeded];

    pdfThumbnailView = self->_pdfThumbnailView;
    double v6 = [(SSSScreenshotsView *)self _currentPDFView];
    [(_SSSPDFThumbnailView *)pdfThumbnailView setPdfView:v6];

    [(SSSScreenshotsView *)self _updateThumbnailViewVisibilityIfNeededAnimated:0];
    [(SSSScreenshotsView *)self _thumbnailTrayWidth];
    double v8 = v7;
    [(UINavigationBar *)self->_topBar frame];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [(SSSScreenshotsView *)self _bottomBarHeightIncludingSafeAreaInsets];
    if (v17 == 0.0)
    {
      [(SSSScreenshotsView *)self bounds];
      double MaxY = CGRectGetMaxY(v43);
    }
    else
    {
      [(UIVisualEffectView *)self->_bottomBar frame];
      double MaxY = CGRectGetMinY(v42);
    }
    double v19 = MaxY;
    id v20 = [(SSSScreenshotsView *)self effectiveUserInterfaceLayoutDirection];
    [(SSSScreenshotsView *)self _layoutBoundsForFullPageThumbnail];
    if (v20) {
      double MinX = CGRectGetMinX(*(CGRect *)&v21);
    }
    else {
      double MinX = CGRectGetMaxX(*(CGRect *)&v21) - v8;
    }
    v44.origin.CGFloat x = v10;
    v44.origin.double y = v12;
    v44.size.double width = v14;
    v44.size.double height = v16;
    double v26 = CGRectGetMaxY(v44);
    v45.origin.CGFloat x = v10;
    v45.origin.double y = v12;
    v45.size.double width = v14;
    v45.size.double height = v16;
    double v27 = v19 - CGRectGetMaxY(v45);
    -[_SSSPDFThumbnailView setFrame:](self->_pdfThumbnailView, "setFrame:", MinX, v26, v8, v27);
    [(SSSScreenshotsView *)self safeAreaInsets];
    -[UIVisualEffectView setFrame:](self->_thumbnailBackgroundView, "setFrame:", MinX, v26, v8 + v28, v27);
    double v29 = [(SSSScreenshotsView *)self _currentPDFView];
    [v29 bounds];

    double v30 = [(SSSScreenshotsView *)self _currentPDFView];
    [(UINavigationBar *)self->_topBar bounds];
    [v30 convertRect:self->_topBar fromView:];
    SSRectSubtractingRect();

    double v31 = [(SSSScreenshotsView *)self _currentPDFView];
    [(_SSSPDFThumbnailView *)self->_pdfThumbnailView bounds];
    [v31 convertRect:self->_pdfThumbnailView fromView:];
    SSRectSubtractingRect();
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;

    CGFloat v40 = self->_pdfThumbnailView;
    -[_SSSPDFThumbnailView setScrollViewVisibleRectInPDFView:](v40, "setScrollViewVisibleRectInPDFView:", v33, v35, v37, v39);
  }
  else
  {
    [(SSSScreenshotsView *)self _updateThumbnailViewVisibilityIfNeededAnimated:0];
  }
}

- (CGRect)screenshotsExtentRect
{
  CGFloat x = CGRectZero.origin.x;
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v7 = self->_screenshotViews;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        CGFloat v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v12 extent:v21];
        -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", v12);
        v29.origin.CGFloat x = v13;
        v29.origin.CGFloat y = v14;
        v29.size.CGFloat width = v15;
        v29.size.CGFloat height = v16;
        v26.origin.CGFloat x = x;
        v26.origin.CGFloat y = y;
        v26.size.CGFloat width = width;
        v26.size.CGFloat height = height;
        CGRect v27 = CGRectUnion(v26, v29);
        CGFloat x = v27.origin.x;
        CGFloat y = v27.origin.y;
        CGFloat width = v27.size.width;
        CGFloat height = v27.size.height;
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }

  double v17 = x;
  double v18 = y;
  double v19 = width;
  double v20 = height;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- (UICoordinateSpace)screenshotsParentCoordinateSpace
{
  return (UICoordinateSpace *)self->_scrollView;
}

- (void)_updateThumbnailViewVisibilityIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10003DDE0;
  v6[3] = &unk_100099A20;
  v6[4] = self;
  double v4 = objc_retainBlock(v6);
  double v5 = v4;
  if (v3) {
    +[UIView animateWithDuration:v4 animations:0.2];
  }
  else {
    ((void (*)(void *))v4[2])(v4);
  }
}

- (void)aaButtonPressed:(id)a3
{
  [(UIButton *)self->_liveTextButton setSelected:[(UIButton *)self->_liveTextButton isSelected] ^ 1];
  id v5 = [(SSSScreenshotsView *)self delegate];
  double v4 = [(SSSScreenshotsView *)self activeScreenshotView];
  [v5 aaButtonPressed:v4];
}

- (void)analysisInfoButtonPressed:(id)a3
{
  [(UIButton *)self->_visualSearchButton setSelected:[(UIButton *)self->_visualSearchButton isSelected] ^ 1];
  id v5 = [(SSSScreenshotsView *)self delegate];
  double v4 = [(SSSScreenshotsView *)self activeScreenshotView];
  [v5 analysisButtonPressed:v4];
}

- (void)toolbarDidSelectOpacityOptionWithAccessoryView:(id)a3
{
  id v4 = a3;
  id v5 = [(SSSScreenshotsView *)self delegate];
  [v5 didTapOpacityOptionWithAttributeView:v4];
}

- (void)endOpacityEditing
{
  if ((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
  {
    BOOL v3 = [(SSSScreenshotsView *)self window];
    id v4 = +[PKToolPicker activeToolPickerForWindow:v3];
    [v4 _endOpacityEditing];
  }
  toolPalette = self->_toolPalette;

  [(AKToolbarView *)toolPalette endOpacityEditing];
}

- (SSSScreenshot)currentScreenshot
{
  v2 = [(SSSScreenshotsView *)self currentScreenshotView];
  BOOL v3 = [v2 screenshot];

  return (SSSScreenshot *)v3;
}

- (id)currentScreenshotView
{
  int64_t v3 = [(SSSScreenshotsView *)self _currentPage];

  return [(SSSScreenshotsView *)self _viewForPage:v3];
}

- (void)parentScreenshotView:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  [(SSSScreenshotsView *)self layoutIfNeeded];
  [(SSSScreenshotsView *)self _noteCurrentPageForSignificantChange];
  [v5 setDelegate:self];
  [v5 setRulerHostingView:self->_rulerHostingView];
  [(NSMutableArray *)self->_screenshotViews addObject:v5];
  double v6 = [(SSSScreenshotsView *)self imageAnalyzer];
  [v5 setImageAnalyzer:v6];

  [(SSSScrollView *)self->_scrollView addSubview:v5];

  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (id)_screenshotViewForScreenshot:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = self->_screenshotViews;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        [v9 screenshot];
        id v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == v4)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)removeScreenshots:(id)a3
{
  id v4 = a3;
  [(SSSScreenshotsView *)self layoutIfNeeded];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = -[SSSScreenshotsView _screenshotViewForScreenshot:](self, "_screenshotViewForScreenshot:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v9), (void)v13);
        double v11 = v10;
        if (v10)
        {
          [v10 setIsBeingRemoved:1];
          [v11 setScreenshotEditsSnapshotted:1 inTransition:0 currentScreenshot:1];
          [(NSMutableArray *)self->_screenshotViews removeObject:v11];
        }

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [(SSSScreenshotsView *)self _noteCurrentPageForSignificantChange];
  long long v12 = [(SSSScreenshotsView *)self delegate];
  [v12 screenshotDidChangeForScreenshotsView:self];

  [(SSSScreenshotsView *)self _updateActiveScreenshotViewIfNecessary];
  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (int64_t)numberOfScreenshotImages
{
  return (int64_t)[(NSMutableArray *)self->_screenshotViews count];
}

- (void)setScreenshotViewsUseTrilinearMinificationFilter:(BOOL)a3
{
  self->_screenshotViewsUseTrilinearMinificationFilter = a3;
  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (void)setCurrentScreenshotCropHandlesFadedOut:(BOOL)a3
{
  self->_currentScreenshotCropHandlesFadedOut = a3;
  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (void)commitInflightEdits
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_screenshotViews;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) commitInflightEdits:v7];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_updateActiveScreenshotViewIfNecessary
{
  id v3 = [(SSSScreenshotsView *)self currentScreenshotView];
  [(SSSScreenshotsView *)self setActiveScreenshotView:v3];
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_isInStateTransition = 1;
    [(SSSScreenshotsView *)self _noteCurrentPageForSignificantChange];
    if (!a3)
    {
      [(AKToolbarView *)self->_toolPalette forceHideRuler];
      [(SSSScreenshotsView *)self setEditMode:0];
      CGSize size = CGRectNull.size;
      self->_keyboardFrame.origin = CGRectNull.origin;
      self->_keyboardFrame.CGSize size = size;
    }
    self->_state = a3;
    [(SSSScreenshotsView *)self setNeedsLayout];
  }
}

- (BOOL)inStateTransition
{
  return self->_isInStateTransition;
}

- (void)stateTransitionFinished
{
  self->_isInStateTransition = 0;
  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (void)_updateDisplayedPage
{
  if (self->_lastPageForSignificantChange == -1 || [(SSSScreenshotsView *)self _currentPage] == -1)
  {
    countIndicator = self->_countIndicator;
    int64_t v4 = [(SSSScreenshotsView *)self _currentPage];
    [(SSSScreenshotCountIndicator *)countIndicator setIndex:v4];
  }
  else
  {
    if ((id)[(SSSScreenshotsView *)self state] == (id)1)
    {
      [(SSSScreenshotsView *)self _scrollToPage:self->_lastPageForSignificantChange animated:0];
      [(SSSScreenshotCountIndicator *)self->_countIndicator setIndex:self->_lastPageForSignificantChange];
    }
    self->_lastPageForSignificantChange = -1;
  }
}

- (void)_updateScrollPositionForCurrentPage
{
  if ((id)[(SSSScreenshotsView *)self state] == (id)1 && self->_lastPageForSignificantChange == -1)
  {
    int64_t v3 = [(SSSScreenshotsView *)self _currentPage];
    [(SSSScreenshotsView *)self _scrollToPage:v3 animated:0];
  }
}

- (void)_noteCurrentPageForSignificantChange
{
  self->_lastPageForSignificantChange = [(SSSScreenshotsView *)self _currentPage];
}

- (void)scrollViewDidScroll:(id)a3
{
  int64_t v4 = [(SSSScreenshotsView *)self delegate];
  [v4 screenshotDidChangeForScreenshotsView:self];

  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(SSSScreenshotsView *)self setNeedsLayout];

  [(SSSScreenshotsView *)self layoutIfNeeded];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  CGFloat y = a5->y;
  uint64_t v9 = -[SSSScreenshotsView _pageForXOffsetInScrollView:](self, "_pageForXOffsetInScrollView:", a3, a5->x, a4.y);
  id v10 = [(SSSScreenshotsView *)self effectiveUserInterfaceLayoutDirection];
  if (x != 0.0)
  {
    uint64_t v11 = 1;
    if (v10) {
      uint64_t v11 = -1;
    }
    if (x <= 0.0) {
      uint64_t v11 = -v11;
    }
    uint64_t v9 = (v11 + v9) & ~((v11 + v9) >> 63);
    int64_t v12 = [(SSSScreenshotsView *)self _numberOfPages];
    if (v9 >= v12 - 1) {
      uint64_t v9 = v12 - 1;
    }
  }
  [(SSSScreenshotsView *)self _scrollViewRectForPage:v9];
  a5->double x = v13;
  a5->CGFloat y = y;

  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (id)_viewForPage:(int64_t)a3
{
  if (a3 < 0)
  {
    id v6 = 0;
  }
  else
  {
    if ((unint64_t)[(NSMutableArray *)self->_screenshotViews count] <= a3)
    {
      id v6 = 0;
    }
    else
    {
      id v6 = [(NSMutableArray *)self->_screenshotViews objectAtIndex:a3];
    }
  }
  return v6;
}

- (CGRect)_scrollViewRectForPage:(int64_t)a3
{
  int64_t v4 = [(SSSScreenshotsView *)self _viewForPage:a3];
  [v4 bounds];
  -[SSSScrollView convertRect:fromView:](self->_scrollView, "convertRect:fromView:", v4);
  UIRectGetCenter();
  [(SSSScrollView *)self->_scrollView bounds];
  UIRectCenteredAboutPoint();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.double x = v13;
  return result;
}

- (int64_t)_pageForXOffsetInScrollView:(double)a3
{
  [(SSSScrollView *)self->_scrollView bounds];
  UIRectGetCenter();
  double v5 = v4;
  if ([(SSSScreenshotsView *)self _numberOfPages] < 1) {
    return -1;
  }
  uint64_t v6 = 0;
  int64_t v7 = -1;
  double v8 = 1.79769313e308;
  do
  {
    id v9 = [(NSMutableArray *)self->_screenshotViews objectAtIndex:v6];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_appearingScreenshotView);

    if (v9 != WeakRetained && ([v9 isBeingRemoved] & 1) == 0)
    {
      scrollView = self->_scrollView;
      [v9 bounds];
      -[SSSScrollView convertRect:fromView:](scrollView, "convertRect:fromView:", v9);
      UIRectGetCenter();
      double v13 = vabdd_f64(v12, v5);
      if (v13 < v8)
      {
        int64_t v7 = v6;
        double v8 = v13;
      }
    }

    ++v6;
  }
  while (v6 < [(SSSScreenshotsView *)self _numberOfPages]);
  return v7;
}

- (int64_t)_currentPage
{
  int64_t result = [(SSSScreenshotsView *)self state];
  if (result)
  {
    [(SSSScrollView *)self->_scrollView contentOffset];
    return -[SSSScreenshotsView _pageForXOffsetInScrollView:](self, "_pageForXOffsetInScrollView:");
  }
  return result;
}

- (int64_t)_numberOfPages
{
  return (int64_t)[(NSMutableArray *)self->_screenshotViews count];
}

- (void)_scrollToPage:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(SSSScreenshotsView *)self _scrollViewRectForPage:a3];
  scrollView = self->_scrollView;

  -[SSSScrollView setContentOffset:animated:](scrollView, "setContentOffset:animated:", v4);
}

- (id)viewsForScreenshots:(id)a3
{
  id v3 = a3;
  id v18 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        id v9 = self->_screenshotViews;
        id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v21;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v21 != v12) {
                objc_enumerationMutation(v9);
              }
              double v14 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
              double v15 = [v14 screenshot];

              if (v15 == v8)
              {
                [v18 addObject:v14];
                goto LABEL_16;
              }
            }
            id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      id v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }

  return v18;
}

- (void)setIsSharing:(BOOL)a3
{
  self->_isSharing = a3;
  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (NSArray)visibleScreenshots
{
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_screenshotViews;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) screenshot:v11];
        [v3 addObject:v9];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_screenshotAtIndex:(int64_t)a3
{
  id v3 = [(NSMutableArray *)self->_screenshotViews objectAtIndex:a3];
  id v4 = [v3 screenshot];

  return v4;
}

- (id)screenshotViewForScreenshot:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_screenshotViews;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 screenshot];
        unsigned __int8 v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_screenshotsEligibleForSharing
{
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_screenshotViews;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) screenshot:v11];
        [v3 addObject:v9];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSArray)activityItems
{
  id v3 = +[NSMutableArray array];
  id v4 = [(SSSScreenshotsView *)self _screenshotsEligibleForSharing];
  id v5 = [v4 count];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(SSSScreenshotsView *)self _screenshotsEligibleForSharing];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v12 = [v11 lastViewEditMode];
        if (v12)
        {
          if (v12 != (id)1) {
            continue;
          }
          if (v5 == (id)1) {
            [v11 itemProviderPDFAsImage];
          }
          else {
          uint64_t v13 = [v11 itemProviderPDF];
          }
        }
        else
        {
          uint64_t v13 = [v11 itemProviderImage];
        }
        long long v14 = (void *)v13;
        [v3 addObject:v13];
      }
      id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  if ([v3 count])
  {
    long long v15 = +[UIPrintInfo printInfo];
    [v15 setOutputType:0];
    long long v16 = +[NSBundle mainBundle];
    double v17 = [v16 localizedStringForKey:@"SCREENSHOTS_PRINT_JOB_FORMAT" value:&stru_10009B8B0 table:0];
    id v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, [v3 count]);

    [v15 setJobName:v18];
    [v3 addObject:v15];
  }

  return (NSArray *)v3;
}

- (NSArray)dragItems
{
  id v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_screenshotViews;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 screenshot:v14];
        long long v11 = [v10 itemProviderForDragItems];
        id v12 = [objc_alloc((Class)UIDragItem) initWithItemProvider:v11];
        [v12 setLocalObject:v9];
        [v3 addObject:v12];
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)imageItems
{
  id v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SSSScreenshotsView *)self _screenshotsEligibleForSharing];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) itemProviderImage];
        id v10 = [v9 item];
        [v3 addObject:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (id)_screenshotViewForDragItem:(id)a3
{
  return [a3 localObject];
}

- (id)previewForDragItem:(id)a3 inContainer:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SSSScreenshotsView *)self _screenshotViewForDragItem:a3];
  id v8 = [v7 screenshot];
  [v7 bounds];
  [v6 convertRect:v7 fromView:];
  double v10 = v9;
  double v12 = v11;
  double y = CGPointZero.y;
  long long v14 = [v8 imageProvider];
  long long v15 = [v14 requestOutputImageForUIBlocking];

  id v16 = [objc_alloc((Class)UIImageView) initWithImage:v15];
  [v16 setFrame:CGPointZero.x, y, v10, v12];
  [v7 bounds];
  UIRectGetCenter();
  [v6 convertPoint:v7 fromView:v6];
  double v18 = v17;
  double v20 = v19;

  id v21 = objc_alloc((Class)UIDragPreviewTarget);
  long long v22 = [(SSSScreenshotsView *)self window];
  long long v23 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v29[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v29[1] = v23;
  v29[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id v24 = [v21 initWithContainer:v22 center:v29 transform:v18];

  id v25 = objc_alloc_init((Class)UIDragPreviewParameters);
  long long v26 = +[UIColor clearColor];
  [v25 setBackgroundColor:v26];

  id v27 = [objc_alloc((Class)UITargetedDragPreview) initWithView:v16 parameters:v25 target:v24];

  return v27;
}

- (id)targetForCancellingDragItem:(id)a3 inContainer:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(SSSScreenshotsView *)self _screenshotViewForDragItem:a3];
  [v7 bounds];
  UIRectGetCenter();
  [v6 convertPoint:v7 fromView:];
  id v10 = [objc_alloc((Class)UIDragPreviewTarget) initWithContainer:v6 center:v8];

  return v10;
}

- (void)setShowsShadow:(BOOL)a3
{
  self->_showsShadow = a3;
  [(SSSScreenshotsView *)self _updateShadowViewAlpha];
}

- (void)_updateShadowViewAlpha
{
  unsigned int v3 = [(SSSScreenshotsView *)self showsShadow];
  double v4 = 0.0;
  if (v3) {
    double v4 = 1.0;
  }
  shadowView = self->_shadowView;

  [(SSSShadowView *)shadowView setAlpha:v4];
}

- (void)screenshotViewUndoStackChanged:(id)a3
{
  id v4 = [(SSSScreenshotsView *)self delegate];
  [v4 undoStackChangedForScreenshotsView:self];
}

- (void)screenshotViewTapped:(id)a3
{
  id v6 = a3;
  id v4 = [(SSSScreenshotsView *)self currentScreenshotView];

  id v5 = v6;
  if (v4 != v6)
  {
    [(SSSScreenshotsView *)self _scrollToPage:[(NSMutableArray *)self->_screenshotViews indexOfObject:v6] animated:1];
    id v5 = v6;
    self->_shouldUpdateActivityItemsAfterScrollAnimation = 1;
  }
}

- (void)screenshotViewCropDidChange:(id)a3
{
  id v4 = [(SSSScreenshotsView *)self delegate];
  [v4 cropDidChangeForScreenshotView:self];

  [(SSSScreenshotsView *)self _updateVisualSearchCornerViewPositioning];
}

- (id)viewControllerForPresentationsFromScreenshotView:(id)a3
{
  id v4 = [(SSSScreenshotsView *)self delegate];
  id v5 = [v4 viewControllerForPresentationsFromScreenshotsView:self];

  return v5;
}

- (void)screenshotView:(id)a3 hasHighPriorityGesture:(id)a4
{
  scrollView = self->_scrollView;
  id v5 = a4;
  id v6 = [(SSSScrollView *)scrollView panGestureRecognizer];
  [v6 requireGestureRecognizerToFail:v5];
}

- (void)screenshotView:(id)a3 noLongerHasHighPriorityGesture:(id)a4
{
  scrollView = self->_scrollView;
  id v5 = a4;
  id v6 = [(SSSScrollView *)scrollView panGestureRecognizer];
  [v6 removeFailureRequirement:v5];
}

- (void)screenshotView:(id)a3 didUpdateInteraction:(id)a4 withAnalysis:(id)a5
{
  id v6 = a3;
  id v7 = [(SSSScreenshotsView *)self activeScreenshotView];

  if (v7 == v6)
  {
    [(SSSScreenshotsView *)self addOrRemoveAAButtonIfNecessary];
    [(SSSScreenshotsView *)self _updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:1];
  }
}

- (void)screenshotView:(id)a3 requestsUpdateToInteractionMode:(unint64_t)a4
{
  id v6 = [(SSSScreenshotsView *)self delegate];
  [v6 screenshotsView:self requestsUpdateToInteractionMode:a4];
}

- (void)screenshotView:(id)a3 startEditingOpacityInAccessoryView:(id)a4
{
  id v5 = a4;
  id v6 = [(SSSScreenshotsView *)self delegate];
  [v6 didTapOpacityOptionWithAttributeView:v5];
}

- (CGRect)_effectiveBottomBarExtent
{
  [(SSSScreenshotsView *)self _toolPickerHeightOnPhone];
  double height = v3;
  [(SSSScreenshotsView *)self bounds];
  double v6 = v5;
  [(SSSScreenshotsView *)self bounds];
  CGFloat width = v7;
  double v9 = [(SSSScreenshotsView *)self traitCollection];
  if ([v9 userInterfaceIdiom] == (id)1)
  {
    CGFloat x = CGRectZero.origin.x;
    double y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  else
  {
    double y = v6 - height;
    CGFloat x = 0.0;
  }

  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.double height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)setSnapshotScreenshotEdits:(BOOL)a3
{
  self->_snapshotScreenshotEdits = a3;
  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (BOOL)_screenshotEditsShouldBeSnapshottedForCurrentScreenshot
{
  if ([(SSSScreenshotsView *)self snapshotScreenshotEdits]) {
    return 1;
  }
  scrollView = self->_scrollView;

  return [(SSSScrollView *)scrollView isMoving];
}

- (void)dismissOverlayManagedViewControllers
{
  [(AKToolbarView *)self->_toolPalette dismissPresentedPopovers];
  double v3 = [(SSSScreenshotsView *)self window];
  id v4 = [v3 firstResponder];

  [(AKToolbarView *)self->_toolPalette setToolPickerVisible:0 forFirstResponder:v4];
}

- (int64_t)positionForBar:(id)a3
{
  if (self->_topBar == a3) {
    return 3;
  }
  else {
    return 0;
  }
}

- (UIView)bottomBar
{
  return (UIView *)self->_toolPalette;
}

- (void)setShareItemTarget:(id)a3
{
  objc_storeWeak(&self->_shareItemTarget, a3);

  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (void)setShareItemAction:(SEL)a3
{
  if (a3) {
    double v3 = a3;
  }
  else {
    double v3 = 0;
  }
  self->_shareItemAction = v3;
  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (void)setUndoItemTarget:(id)a3
{
  objc_storeWeak(&self->_undoItemTarget, a3);

  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (void)setUndoItemAction:(SEL)a3
{
  if (a3) {
    double v3 = a3;
  }
  else {
    double v3 = 0;
  }
  self->_undoItemAction = v3;
  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (void)setRedoItemTarget:(id)a3
{
  objc_storeWeak(&self->_redoItemTarget, a3);

  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (void)setRedoItemAction:(SEL)a3
{
  if (a3) {
    double v3 = a3;
  }
  else {
    double v3 = 0;
  }
  self->_redoItemAction = v3;
  [(SSSScreenshotsView *)self setNeedsLayout];
}

- (id)createUndoMenu
{
  v2 = [(SSSScreenshotsView *)self currentScreenshotView];
  double v3 = [v2 undoManager];

  id v4 = +[NSBundle mainBundle];
  double v5 = [v4 localizedStringForKey:@"UNDO_FORMAT" value:@"Undo %@" table:0];
  double v6 = [v3 undoActionName];
  double v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);

  double v8 = +[UICommand commandWithTitle:v7 image:0 action:"_undo" propertyList:0];
  double v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"UNDO_ALL" value:@"Undo All" table:0];
  double v11 = +[UICommand commandWithTitle:v10 image:0 action:"_undoAll" propertyList:0];

  v15[0] = v8;
  v15[1] = v11;
  double v12 = +[NSArray arrayWithObjects:v15 count:2];
  double v13 = +[UIMenu menuWithTitle:&stru_10009B8B0 image:0 identifier:@"SSSUndoMenuIdentifer" options:0 children:v12];

  return v13;
}

- (void)_undo
{
  v2 = [(SSSScreenshotsView *)self currentScreenshotView];
  id v3 = [v2 undoManager];

  if ([v3 canUndo]) {
    [v3 undo];
  }
}

- (void)_undoAll
{
  v2 = [(SSSScreenshotsView *)self currentScreenshotView];
  id v3 = [v2 undoManager];

  if ([v3 canUndo])
  {
    do
      [v3 undo];
    while (([v3 canUndo] & 1) != 0);
  }
}

- (void)setBorderViewStyleOverride:(int64_t)a3 withAnimator:(id)a4
{
  id v6 = a4;
  self->_borderViewStyleOverride = a3;
  [(SSSScreenshotsView *)self setNeedsLayout];
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10004058C;
    v9[3] = &unk_100099A20;
    v9[4] = self;
    [v6 addAnimations:v9];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100040594;
    v8[3] = &unk_100099A20;
    v8[4] = self;
    id v7 = +[UIViewPropertyAnimator runningPropertyAnimatorWithDuration:6 delay:v8 options:0 animations:0.3 completion:0.0];
  }
}

- (BOOL)_shouldHandleKeyboardNotification:(id)a3
{
  id v4 = [a3 userInfo];
  double v5 = [v4 objectForKeyedSubscript:UIKeyboardIsLocalUserInfoKey];
  unsigned int v6 = [v5 BOOLValue];

  if (!v6) {
    return 0;
  }
  id v7 = [(SSSScreenshotsView *)self delegate];
  double v8 = [v7 viewControllerForPresentationsFromScreenshotsView:self];

  double v9 = [v8 presentedViewController];
  BOOL v10 = v9 == 0;

  return v10;
}

- (void)_updateForKeyboardNotification:(id)a3
{
  id v4 = a3;
  if ([(SSSScreenshotsView *)self _shouldHandleKeyboardNotification:v4])
  {
    double v5 = [v4 userInfo];
    unsigned int v6 = [v5 valueForKey:UIKeyboardFrameEndUserInfoKey];

    id v7 = [v4 userInfo];
    double v8 = [v7 valueForKey:UIKeyboardAnimationDurationUserInfoKey];

    double v9 = [v4 userInfo];
    BOOL v10 = [v9 valueForKey:UIKeyboardAnimationCurveUserInfoKey];

    [v6 CGRectValue];
    -[SSSScreenshotsView convertRect:fromView:](self, "convertRect:fromView:", 0);
    double v12 = v11;
    double v14 = v13;
    id v16 = v15;
    double v18 = v17;
    [v8 doubleValue];
    double v20 = v19;
    unint64_t v21 = (unint64_t)[v10 integerValue];
    [(SSSScreenshotsView *)self setNeedsLayout];
    [(SSSScreenshotsView *)self layoutIfNeeded];
    [(SSSScreenshotsView *)self setNeedsLayout];
    objc_initWeak(&location, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100040860;
    v22[3] = &unk_10009A998;
    objc_copyWeak(v23, &location);
    v23[1] = v12;
    v23[2] = v14;
    v23[3] = v16;
    v23[4] = v18;
    +[UIView animateWithDuration:v21 | 6 delay:v22 options:0 animations:v20 completion:0.0];
    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }
}

- (void)_keyboardWillShow:(id)a3
{
}

- (void)_keyboardWillHide:(id)a3
{
}

- (BOOL)_shouldAvoidKeyboard
{
  p_keyboardFrame = &self->_keyboardFrame;
  v14.origin.CGFloat x = CGRectNull.origin.x;
  v14.origin.double y = CGRectNull.origin.y;
  v14.size.CGFloat width = CGRectNull.size.width;
  v14.size.double height = CGRectNull.size.height;
  if (CGRectEqualToRect(self->_keyboardFrame, v14))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    [(SSSScreenshotsView *)self bounds];
    v15.origin.CGFloat x = v5;
    v15.origin.double y = v6;
    v15.size.CGFloat width = v7;
    v15.size.double height = v8;
    CGRect v12 = CGRectIntersection(*p_keyboardFrame, v15);
    BOOL v4 = !CGRectIsEmpty(v12);
  }
  double v9 = [(SSSScreenshotsView *)self currentScreenshotView];
  [v9 rectToCenterAboveKeyboard];
  BOOL v10 = v4 & !CGRectIsNull(v13);

  return v10;
}

- (void)_updateSubviewOrdering
{
  id v3 = +[NSMutableArray array];
  BOOL v4 = v3;
  if (self->_toolPalette) {
    [v3 addObject:];
  }
  if (self->_countIndicator) {
    [v4 addObject:];
  }
  if (self->_bottomBar) {
    [v4 addObject:];
  }
  if (self->_pdfThumbnailView) {
    [v4 addObject:];
  }
  if (self->_thumbnailBackgroundView) {
    [v4 addObject:];
  }
  if (self->_topBar) {
    [v4 addObject:];
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[SSSScreenshotsView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", *(void *)(*((void *)&v10 + 1) + 8 * i), self->_scrollView, (void)v10);
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = +[NSMutableArray array];
  double v9 = v8;
  if (self->_topBar) {
    [v8 addObject:];
  }
  if (self->_toolPalette) {
    [v9 addObject:];
  }
  long long v10 = [(UIVisualEffectView *)self->_bottomBar contentView];

  if (v10)
  {
    long long v11 = [(UIVisualEffectView *)self->_bottomBar contentView];
    [v9 addObject:v11];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    while (2)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        double v17 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v17 convertPoint:self x:y];
        [v17 hitTest:v7];
        double v18 = (SSSScreenshotCountIndicator *)objc_claimAutoreleasedReturnValue();
        if (v18 && !UIViewIgnoresTouchEvents())
        {

          goto LABEL_18;
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  v25.receiver = self;
  v25.super_class = (Class)SSSScreenshotsView;
  -[SSSScreenshotsView hitTest:withEvent:](&v25, "hitTest:withEvent:", v7, x, y);
  double v18 = (SSSScreenshotCountIndicator *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  if (v18 == self->_countIndicator
    || ([(UIVisualEffectView *)self->_bottomBar contentView],
        double v19 = (SSSScreenshotCountIndicator *)objc_claimAutoreleasedReturnValue(),
        v19,
        v18 == v19))
  {
    double v20 = self->_scrollView;

    double v18 = (SSSScreenshotCountIndicator *)v20;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    id v23 = objc_loadWeakRetained((id *)&self->_delegate);
    [v23 screenshotsView:self didHitTestView:v18 point:v7 withEvent:x, y];
  }

  return v18;
}

- (void)setEditMode:(int64_t)a3
{
  if ([(SSSScreenshotsView *)self editMode] != a3)
  {
    id v8 = [(SSSScreenshotsView *)self currentScreenshotView];
    if ([v8 editMode] != (id)a3) {
      [(AKToolbarView *)self->_toolPalette forceHideRuler];
    }
    [v8 setEditMode:a3];
    [(_SSSPDFThumbnailView *)self->_pdfThumbnailView setShouldUpdate:a3 == 1];
    [(SSSScreenshotsView *)self _noteCurrentPageForSignificantChange];
    id v5 = [(SSSScreenshotsView *)self delegate];
    id v6 = [v5 viewControllerForPresentationsFromScreenshotsView:self];

    [v6 becomeFirstResponder];
    [(SSSScreenshotsView *)self setNeedsLayout];
    [(SSSScreenshotsView *)self layoutIfNeeded];
    [v8 adjustPDFPositioningToMatchImageIfNecessary];
    [(SSSScreenshotsView *)self _updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:0];
    [(SSSScreenshotsView *)self addOrRemoveAAButtonIfNecessary];
    id v7 = [(SSSScreenshotsView *)self delegate];
    [v7 screenshotsViewEditModeDidChange:self];
  }
}

- (int64_t)editMode
{
  v2 = [(SSSScreenshotsView *)self currentScreenshotView];
  id v3 = [v2 editMode];

  return (int64_t)v3;
}

- (BOOL)isCropped
{
  v2 = [(SSSScreenshotsView *)self currentScreenshotView];
  unsigned __int8 v3 = [v2 isCropped];

  return v3;
}

- (void)enterCrop
{
  [(AKToolbarView *)self->_toolPalette forceHideRuler];
  id v3 = [(SSSScreenshotsView *)self _viewForPage:[(SSSScreenshotsView *)self _currentPage]];
  [v3 enterCrop];
}

- (void)resetCrop
{
  id v2 = [(SSSScreenshotsView *)self currentScreenshotView];
  [v2 resetCrop];
}

- (void)doneCrop
{
  id v2 = [(SSSScreenshotsView *)self _viewForPage:[(SSSScreenshotsView *)self _currentPage]];
  [v2 doneCrop];
}

- (void)cancelCrop
{
  id v2 = [(SSSScreenshotsView *)self _viewForPage:[(SSSScreenshotsView *)self _currentPage]];
  [v2 cancelCrop];
}

- (int64_t)currentPDFPage
{
  id v2 = [(SSSScreenshotsView *)self currentScreenshotView];
  id v3 = [v2 currentPDFPage];

  return (int64_t)v3;
}

- (id)_currentPDFView
{
  if ([(SSSScreenshotsView *)self _isShowingPDFScreenshot])
  {
    id v3 = [(SSSScreenshotsView *)self currentScreenshotView];
    BOOL v4 = [v3 _internalPDFView];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_anyScreenshotPDFViewNeedsBleedToBottom
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(SSSScreenshotsView *)self visibleScreenshots];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = [*(id *)(*((void *)&v8 + 1) + 8 * i) pdfData];

        if (v6)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)_isShowingPDFScreenshot
{
  id v2 = [(SSSScreenshotsView *)self currentScreenshotView];
  BOOL v3 = [v2 editMode] != 0;

  return v3;
}

- (void)didProcessDocumentUpdateForScreenshot:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SSSScreenshotsView *)self visibleScreenshots];
  unsigned int v5 = [v4 containsObject:v6];

  if (v5) {
    [v6 didProcessDocumentUpdate];
  }
}

- (BOOL)_layoutShouldShowContentSwitcher
{
  BOOL v3 = [(SSSScreenshotsView *)self currentScreenshot];
  unsigned __int8 v4 = [v3 isWaitingForPDF];

  unsigned int v5 = [(SSSScreenshotsView *)self currentScreenshot];
  id v6 = [v5 pdfData];

  if (v6) {
    return 1;
  }
  else {
    return v4;
  }
}

- (BOOL)_layoutShouldEnableContentSwitcher
{
  id v2 = [(SSSScreenshotsView *)self currentScreenshot];
  BOOL v3 = [v2 pdfData];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)_contentSwitcherShouldMoveDown
{
  unsigned __int8 v3 = [(SSSScreenshotsView *)self _isPortraitPhone];
  if ([(SSSScreenshotsView *)self _isLandscapePhone])
  {
    BOOL v4 = +[UIScreen mainScreen];
    [v4 bounds];
    BOOL v6 = v5 <= 568.0;
  }
  else
  {
    BOOL v6 = 0;
  }
  return (v3 | v6) & [(SSSScreenshotsView *)self _layoutShouldShowContentSwitcher];
}

- (BOOL)_shouldBleedToBottom
{
  return (id)[(SSSScreenshotsView *)self editMode] == (id)1;
}

- (BOOL)_isPortraitPhone
{
  unsigned __int8 v3 = [(SSSScreenshotsView *)self window];
  [v3 bounds];
  double v5 = v4;
  BOOL v6 = [(SSSScreenshotsView *)self window];
  [v6 bounds];
  double v8 = v7;

  long long v9 = [(SSSScreenshotsView *)self traitCollection];
  id v10 = [v9 userInterfaceIdiom];
  BOOL v12 = v5 > v8 && v10 == 0;

  return v12;
}

- (BOOL)_isLandscapePhone
{
  unsigned __int8 v3 = [(SSSScreenshotsView *)self window];
  [v3 bounds];
  double v5 = v4;
  BOOL v6 = [(SSSScreenshotsView *)self window];
  [v6 bounds];
  double v8 = v7;

  long long v9 = [(SSSScreenshotsView *)self traitCollection];
  id v10 = [v9 userInterfaceIdiom];
  BOOL v12 = v5 > v8 && v10 == 0;

  return v12;
}

- (SSSScreenshotsView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SSSScreenshotsView;
  unsigned __int8 v3 = -[SSSScreenshotsView initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SSSScreenshotsView *)v3 setClipsToBounds:0];
  double v4 = (UINavigationBar *)objc_alloc_init((Class)UINavigationBar);
  topBar = v3->_topBar;
  v3->_topBar = v4;

  v3->_state = 0;
  BOOL v6 = [SSSScrollView alloc];
  [(SSSScreenshotsView *)v3 bounds];
  double v7 = -[SSSScrollView initWithFrame:](v6, "initWithFrame:");
  scrollView = v3->_scrollView;
  v3->_scrollView = v7;

  [(SSSScrollView *)v3->_scrollView setShowsHorizontalScrollIndicator:0];
  [(SSSScrollView *)v3->_scrollView setShowsVerticalScrollIndicator:0];
  [(SSSScrollView *)v3->_scrollView setPagingEnabled:0];
  [(SSSScrollView *)v3->_scrollView setClipsToBounds:0];
  [(SSSScrollView *)v3->_scrollView setHitTestsUsingSubviews:1];
  [(SSSScrollView *)v3->_scrollView setDelegate:v3];
  [(SSSScrollView *)v3->_scrollView setDecelerationRate:UIScrollViewDecelerationRateFast];
  [(SSSScrollView *)v3->_scrollView setDelegate:v3];
  [(SSSScreenshotsView *)v3 addSubview:v3->_scrollView];
  long long v9 = (UIView *)objc_alloc_init((Class)UIView);
  layoutPositioningView = v3->_layoutPositioningView;
  v3->_layoutPositioningView = v9;

  [(UIView *)v3->_layoutPositioningView setHidden:1];
  [(SSSScrollView *)v3->_scrollView addSubview:v3->_layoutPositioningView];
  long long v11 = objc_alloc_init(SSSShadowView);
  shadowView = v3->_shadowView;
  v3->_shadowView = v11;

  [(SSSScreenshotsView *)v3 insertSubview:v3->_shadowView belowSubview:v3->_scrollView];
  uint64_t v13 = +[NSMutableArray array];
  screenshotViews = v3->_screenshotViews;
  v3->_screenshotViews = (NSMutableArray *)v13;

  CGSize size = CGRectNull.size;
  v3->_keyboardFrame.origin = CGRectNull.origin;
  v3->_keyboardFrame.CGSize size = size;
  v3->_lastPageForSignificantChange = -1;
  id v16 = objc_alloc_init(SSSPassthroughView);
  rulerHostingView = v3->_rulerHostingView;
  v3->_rulerHostingView = &v16->super;

  [(UIView *)v3->_rulerHostingView setClipsToBounds:1];
  [(SSSScreenshotsView *)v3 addSubview:v3->_rulerHostingView];
  double v18 = +[NSNotificationCenter defaultCenter];
  [v18 addObserver:v3 selector:"_keyboardWillShow:" name:UIKeyboardWillShowNotification object:0];

  double v19 = +[NSNotificationCenter defaultCenter];
  [v19 addObserver:v3 selector:"_keyboardWillHide:" name:UIKeyboardWillHideNotification object:0];

  double v20 = objc_alloc_init(_SSSPDFThumbnailView);
  pdfThumbnailView = v3->_pdfThumbnailView;
  v3->_pdfThumbnailView = v20;

  return v3;
}

- (void)dealloc
{
  unsigned __int8 v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SSSScreenshotsView;
  [(SSSScreenshotsView *)&v4 dealloc];
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  if (self->_shouldUpdateActivityItemsAfterScrollAnimation)
  {
    self->_shouldUpdateActivityItemsAfterScrollAnimation = 0;
    id v4 = [(SSSScreenshotsView *)self delegate];
    [v4 activityItemsChangedForScreenshotsView:self];
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)snapshotScreenshotEdits
{
  return self->_snapshotScreenshotEdits;
}

- (VKCImageAnalyzer)imageAnalyzer
{
  return self->_imageAnalyzer;
}

- (void)setImageAnalyzer:(id)a3
{
}

- (unint64_t)interactionMode
{
  return self->_interactionMode;
}

- (UINavigationBar)topBar
{
  return self->_topBar;
}

- (id)shareItemTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_shareItemTarget);

  return WeakRetained;
}

- (SEL)shareItemAction
{
  if (self->_shareItemAction) {
    return self->_shareItemAction;
  }
  else {
    return 0;
  }
}

- (id)undoItemTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_undoItemTarget);

  return WeakRetained;
}

- (SEL)undoItemAction
{
  if (self->_undoItemAction) {
    return self->_undoItemAction;
  }
  else {
    return 0;
  }
}

- (id)redoItemTarget
{
  id WeakRetained = objc_loadWeakRetained(&self->_redoItemTarget);

  return WeakRetained;
}

- (SEL)redoItemAction
{
  if (self->_redoItemAction) {
    return self->_redoItemAction;
  }
  else {
    return 0;
  }
}

- (BOOL)showsShadow
{
  return self->_showsShadow;
}

- (BOOL)screenshotViewsUseTrilinearMinificationFilter
{
  return self->_screenshotViewsUseTrilinearMinificationFilter;
}

- (SSSScreenshotsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSScreenshotsViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)currentScreenshotCropHandlesFadedOut
{
  return self->_currentScreenshotCropHandlesFadedOut;
}

- (UIView)rulerHostingView
{
  return self->_rulerHostingView;
}

- (BOOL)isSharing
{
  return self->_isSharing;
}

- (BOOL)isPerformingFullscreenSetup
{
  return self->_isPerformingFullscreenSetup;
}

- (void)setIsPerformingFullscreenSetup:(BOOL)a3
{
  self->_isPerformingFullscreenSetup = a3;
}

- (SSSScreenshotView)appearingScreenshotView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appearingScreenshotView);

  return (SSSScreenshotView *)WeakRetained;
}

- (void)setAppearingScreenshotView:(id)a3
{
}

- (SSSScreenshotView)activeScreenshotView
{
  return self->_activeScreenshotView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeScreenshotView, 0);
  objc_destroyWeak((id *)&self->_appearingScreenshotView);
  objc_storeStrong((id *)&self->_rulerHostingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak(&self->_redoItemTarget);
  objc_destroyWeak(&self->_undoItemTarget);
  objc_destroyWeak(&self->_shareItemTarget);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
  objc_storeStrong((id *)&self->_screenshotViews, 0);
  objc_storeStrong((id *)&self->_layoutPositioningView, 0);
  objc_storeStrong((id *)&self->_pdfThumbnailView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_countIndicator, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_toolPalette, 0);
  objc_storeStrong((id *)&self->_thumbnailBackgroundView, 0);
  objc_storeStrong((id *)&self->_actionInfoView, 0);
  objc_storeStrong((id *)&self->_visualSearchCornerView, 0);
  objc_storeStrong((id *)&self->_liveTextButton, 0);
  objc_storeStrong((id *)&self->_visualSearchButton, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_bottomBarSeparatorLine, 0);
  objc_storeStrong((id *)&self->_topBarSeparatorLine, 0);
  objc_storeStrong((id *)&self->_bottomBar, 0);
  objc_storeStrong((id *)&self->_topBarEmptyBackgroundImage, 0);

  objc_storeStrong((id *)&self->_topBar, 0);
}

@end