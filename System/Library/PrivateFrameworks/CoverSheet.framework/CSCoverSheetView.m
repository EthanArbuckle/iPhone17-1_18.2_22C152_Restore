@interface CSCoverSheetView
- ($281FBD1A060D4C63F485A737B1C0EEA3)_completedTransitionContextForPreviousTransitionContext:(SEL)a3 newTransitionContext:(id *)a4;
- ($281FBD1A060D4C63F485A737B1C0EEA3)_currentTransitionContext;
- ($281FBD1A060D4C63F485A737B1C0EEA3)transitionContext;
- (BOOL)_maglevActive;
- (BOOL)coverSheetScrollView:(id)a3 gestureRecognizerShouldBegin:(id)a4;
- (BOOL)coverSheetScrollView:(id)a3 shouldSetContentOffset:(CGPoint)a4 animated:(BOOL)a5;
- (BOOL)dateViewIsVibrant;
- (BOOL)dateViewStretch;
- (BOOL)forceDateViewCentered;
- (BOOL)ignoresOverscrollOnMainPage;
- (BOOL)isTransitioning;
- (BOOL)isTransitioningBackgroundStyle;
- (BOOL)legibilitySettingsOverrideVibrancy;
- (BOOL)proudLockPrefersLowerPresentationLevel;
- (BOOL)resetScrollViewToMainPageAnimated:(BOOL)a3 withAnimationSettings:(id)a4 withCompletion:(id)a5;
- (BOOL)resetScrollViewToMainPageAnimated:(BOOL)a3 withCompletion:(id)a4;
- (BOOL)scrollToPageAtIndex:(unint64_t)a3 animated:(BOOL)a4 withCompletion:(id)a5;
- (BOOL)statusBarLegibilityEnabled;
- (CGAffineTransform)_portraitEnforcingTransform;
- (CGAffineTransform)_transformScaling:(SEL)a3 byScale:(id)a4 aboutPointInSelf:(double)a5;
- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9;
- (CGPoint)backgroundContentViewOffset;
- (CGPoint)complicationContainerViewOffset;
- (CGPoint)contentViewOffset;
- (CGPoint)dateViewOffset;
- (CGPoint)foregroundViewPositionOffset;
- (CGPoint)proudLockIconViewOffset;
- (CGPoint)quickActionsViewOffset;
- (CGPoint)wallpaperFloatingLayerContainerViewOffset;
- (CGRect)_dateViewFrameForPageAlignment:(int64_t)a3 pageRelativeScrollOffset:(double)a4 outAlignmentPercent:(double *)a5;
- (CGRect)_wallpaperOrientationEnforcingBounds;
- (CGRect)dateViewPresentationExtentForPageRelativeScrollOffset:(double)a3;
- (CSBackgroundContentView)backgroundContentView;
- (CSCoverSheetView)initWithFrame:(CGRect)a3;
- (CSCoverSheetViewDelegate)delegate;
- (CSFixedFooterView)fixedFooterView;
- (CSLayoutStrategy)layoutStrategy;
- (CSQuickActionsView)quickActionsView;
- (CSRegionsDebugView)regionsDebugView;
- (CSTeachableMomentsContainerView)teachableMomentsContainerView;
- (CSWallpaperView)wallpaperEffectView;
- (NSArray)pageViews;
- (NSString)coverSheetIdentifier;
- (SBFLockScreenDateView)dateView;
- (SBFPagedScrollView)scrollView;
- (SBSearchGesture)searchGesture;
- (SBUIBackgroundView)backgroundView;
- (SBUIBackgroundView)bedtimeGreetingViewBackgroundView;
- (UIColor)reduceTransparencyBackingColor;
- (UIGestureRecognizer)dateViewGestureRecognizer;
- (UIGestureRecognizer)wallpaperGestureRecognizer;
- (UILongPressGestureRecognizer)complicationGestureRecognizer;
- (UITapGestureRecognizer)backgroundContentGestureRecognizer;
- (UITapGestureRecognizer)quickNoteGestureRecognizer;
- (UIView)backdropView;
- (UIView)bottomPage;
- (UIView)cameraCoveredView;
- (UIView)contentView;
- (UIView)fakeStatusBar;
- (UIView)mainPageView;
- (UIView)modalPresentationView;
- (UIView)poseidonContainerView;
- (UIView)proudLockContainerView;
- (UIView)referenceViewForBelowPresentationContext;
- (UIView)sidebarComplicationContainerView;
- (UIView)slideableContentView;
- (UIView)statusBarBackgroundView;
- (UIView)tintingView;
- (UIView)wakeEffectView;
- (UIView)wallpaperFloatingLayerContainerView;
- (_UILegibilitySettings)legibilitySettings;
- (double)backgroundContentViewAlpha;
- (double)backgroundContentViewScale;
- (double)complicationContainerViewScale;
- (double)contentViewScale;
- (double)controlCenterGrabberBlurRadius;
- (double)controlCenterGrabberScale;
- (double)dateViewScale;
- (double)fakeStatusBarBlurRadius;
- (double)fakeStatusBarScale;
- (double)proudLockIconBlurRadius;
- (double)proudLockIconViewScale;
- (double)quickActionsViewBlurRadius;
- (double)quickActionsViewScale;
- (double)wallpaperFloatingLayerContainerViewScale;
- (id)_lockScreenDefaults;
- (int64_t)backgroundStyle;
- (int64_t)dateViewPageAlignment;
- (int64_t)participantState;
- (int64_t)statusBarBackgroundPageAlignment;
- (unint64_t)_indexOfMainPage;
- (unint64_t)backgroundContentPresentationLevel;
- (unint64_t)dateTimePresentationLevel;
- (unint64_t)fakeStatusBarLevel;
- (unint64_t)modalPresentationLevel;
- (unint64_t)targetPageIndexForDraggingEnded;
- (unint64_t)wallpaperFloatingLayerPresentationLevel;
- (unint64_t)wallpaperPresentationLevel;
- (void)_addAuthIndicator;
- (void)_addBackgroundContainerView;
- (void)_addBackgroundView;
- (void)_addContentView;
- (void)_addContentViewWithContentView:(id)a3;
- (void)_addDateTimeContainer;
- (void)_addHigherSlideableContentView;
- (void)_addScrollView;
- (void)_addSlideableContentView;
- (void)_addStatusBarLegibilityView;
- (void)_addTintingView;
- (void)_addWallpaperFloatingLayerContainerView;
- (void)_createProudLockContainerWrapperIfNecessary;
- (void)_layoutAuthIndicator;
- (void)_layoutBackgroundContentView;
- (void)_layoutBottomPage;
- (void)_layoutContentView;
- (void)_layoutDateTimeViewClippingView;
- (void)_layoutDateView;
- (void)_layoutFakeStatusBar;
- (void)_layoutFullScreenViews;
- (void)_layoutHigherSlideableContentView;
- (void)_layoutProudLockView;
- (void)_layoutQuickActionsView;
- (void)_layoutSidebarComplicationContainerView;
- (void)_layoutStatusBarBackgroundView;
- (void)_layoutStatusBarLegibilityView;
- (void)_layoutTeachableMomentsContainerView;
- (void)_layoutTintingView;
- (void)_layoutWallpaperEffectView;
- (void)_layoutWallpaperFloatingLayerContainerView;
- (void)_orderSubviews;
- (void)_prepareBlursForView:(id)a3 withHardEdges:(BOOL)a4;
- (void)_removeContentView;
- (void)_setDateView:(id)a3 forTesting:(BOOL)a4;
- (void)_setLockScreenDefaults:(id)a3;
- (void)_setupAllGesturesOnScrollView:(BOOL)a3;
- (void)_setupBackgroundContentGestureOnScrollView:(BOOL)a3;
- (void)_setupComplicationGestureOnScrollView:(BOOL)a3;
- (void)_setupDateViewGestureOnScrollView:(BOOL)a3;
- (void)_setupQuickNoteGestureOnScrollView:(BOOL)a3;
- (void)_setupWallpaperGestureOnScrollView:(BOOL)a3;
- (void)_updateBlurForView:(id)a3 toRadius:(double)a4;
- (void)_updateDateFont;
- (void)_updateLegibility;
- (void)beginTransitionToBackgroundStyle:(int64_t)a3;
- (void)cancelTransition;
- (void)completeTransitionToBackgroundStyle:(int64_t)a3;
- (void)didAddSubview:(id)a3;
- (void)layoutSubviews;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrolling:(id)a3;
- (void)scrollViewDidScroll:(id)a3 withContext:(id *)a4;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginScrolling:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)setBackdropView:(id)a3;
- (void)setBackgroundContentGestureRecognizer:(id)a3;
- (void)setBackgroundContentPresentationLevel:(unint64_t)a3;
- (void)setBackgroundContentView:(id)a3;
- (void)setBackgroundContentViewAlpha:(double)a3;
- (void)setBackgroundContentViewOffset:(CGPoint)a3;
- (void)setBackgroundContentViewOffset:(CGPoint)a3 scale:(double)a4;
- (void)setBackgroundContentViewScale:(double)a3;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBedtimeGreetingViewBackgroundView:(id)a3;
- (void)setBottomPage:(id)a3;
- (void)setCameraCoveredView:(id)a3;
- (void)setClipsToBounds:(BOOL)a3;
- (void)setComplicationContainerViewOffset:(CGPoint)a3;
- (void)setComplicationContainerViewScale:(double)a3;
- (void)setComplicationGestureRecognizer:(id)a3;
- (void)setContentView:(id)a3;
- (void)setContentViewOffset:(CGPoint)a3;
- (void)setContentViewOffset:(CGPoint)a3 scale:(double)a4;
- (void)setContentViewScale:(double)a3;
- (void)setControlCenterGrabberBlurRadius:(double)a3;
- (void)setControlCenterGrabberScale:(double)a3;
- (void)setDateTimePresentationLevel:(unint64_t)a3;
- (void)setDateView:(id)a3;
- (void)setDateViewGestureRecognizer:(id)a3;
- (void)setDateViewIsVibrant:(BOOL)a3;
- (void)setDateViewOffset:(CGPoint)a3;
- (void)setDateViewOffset:(CGPoint)a3 scale:(double)a4;
- (void)setDateViewPageAlignment:(int64_t)a3;
- (void)setDateViewScale:(double)a3;
- (void)setDateViewStretch:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFakeStatusBar:(id)a3;
- (void)setFakeStatusBarBlurRadius:(double)a3;
- (void)setFakeStatusBarLevel:(unint64_t)a3;
- (void)setFakeStatusBarScale:(double)a3;
- (void)setFixedFooterView:(id)a3;
- (void)setForceDateViewCentered:(BOOL)a3;
- (void)setForegroundViewPositionOffset:(CGPoint)a3;
- (void)setIgnoresOverscrollOnMainPage:(BOOL)a3;
- (void)setLayoutStrategy:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLegibilitySettingsOverrideVibrancy:(BOOL)a3;
- (void)setMainPageView:(id)a3;
- (void)setModalPresentationLevel:(unint64_t)a3;
- (void)setModalPresentationView:(id)a3;
- (void)setPageViews:(id)a3;
- (void)setPoseidonContainerView:(id)a3;
- (void)setProudLockContainerView:(id)a3;
- (void)setProudLockIconBlurRadius:(double)a3;
- (void)setProudLockIconViewOffset:(CGPoint)a3;
- (void)setProudLockIconViewOffset:(CGPoint)a3 scale:(double)a4;
- (void)setProudLockIconViewScale:(double)a3;
- (void)setProudLockPrefersLowerPresentationLevel:(BOOL)a3;
- (void)setQuickActionsView:(id)a3;
- (void)setQuickActionsViewBlurRadius:(double)a3;
- (void)setQuickActionsViewOffset:(CGPoint)a3;
- (void)setQuickActionsViewOffset:(CGPoint)a3 scale:(double)a4;
- (void)setQuickActionsViewScale:(double)a3;
- (void)setQuickNoteGestureRecognizer:(id)a3;
- (void)setReduceTransparencyBackingColor:(id)a3;
- (void)setReferenceViewForBelowPresentationContext:(id)a3;
- (void)setRegionsDebugView:(id)a3;
- (void)setScrollView:(id)a3;
- (void)setSearchGesture:(id)a3;
- (void)setSidebarComplicationContainerView:(id)a3;
- (void)setStatusBarBackgroundPageAlignment:(int64_t)a3;
- (void)setStatusBarBackgroundView:(id)a3;
- (void)setStatusBarLegibilityEnabled:(BOOL)a3;
- (void)setTargetPageIndexForDraggingEnded:(unint64_t)a3;
- (void)setTeachableMomentsContainerView:(id)a3;
- (void)setTintingView:(id)a3;
- (void)setWakeEffectView:(id)a3;
- (void)setWallpaperEffectView:(id)a3;
- (void)setWallpaperFloatingLayerContainerViewOffset:(CGPoint)a3;
- (void)setWallpaperFloatingLayerContainerViewOffset:(CGPoint)a3 scale:(double)a4;
- (void)setWallpaperFloatingLayerContainerViewScale:(double)a3;
- (void)setWallpaperFloatingLayerPresentationLevel:(unint64_t)a3;
- (void)setWallpaperGestureRecognizer:(id)a3;
- (void)setWallpaperPresentationLevel:(unint64_t)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateBackgroundStyleTransitionProgress:(double)a3;
- (void)updateContainerOrientationForBackgroundViews:(int64_t)a3;
- (void)updateStatusBarLegibilityForForceLegibilityGradientHidden:(BOOL)a3;
- (void)updateUIForAuthenticated:(BOOL)a3;
- (void)viewControllerDidDisappear;
- (void)viewControllerWillAppear;
@end

@implementation CSCoverSheetView

- (CSCoverSheetView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CSCoverSheetView;
  v3 = -[CSCoverSheetView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    legibilitySettings = v3->_legibilitySettings;
    v3->_legibilitySettings = 0;

    v4->_statusBarLegibilityEnabled = 1;
    v4->_dateViewPageAlignment = 0x7FFFFFFFFFFFFFFFLL;
    v4->_targetPageIndexForDraggingEnded = 0x7FFFFFFFFFFFFFFFLL;
    v6 = +[CSLockScreenDomain rootSettings];
    uint64_t v7 = [v6 lookSettings];
    lookSettings = v4->_lookSettings;
    v4->_lookSettings = (CSLookSettings *)v7;

    [(PTSettings *)v4->_lookSettings addKeyObserver:v4];
    [(CSCoverSheetView *)v4 setClipsToBounds:1];
    [(CSCoverSheetView *)v4 _addBackgroundContainerView];
    [(CSCoverSheetView *)v4 _addBackgroundView];
    [(CSCoverSheetView *)v4 _addSlideableContentView];
    [(CSCoverSheetView *)v4 _addHigherSlideableContentView];
    [(CSCoverSheetView *)v4 _addDateTimeContainer];
    [(CSCoverSheetView *)v4 _addWallpaperFloatingLayerContainerView];
    [(CSCoverSheetView *)v4 _addScrollView];
    [(CSCoverSheetView *)v4 _addAuthIndicator];
    [(CSCoverSheetView *)v4 _addTintingView];
    [(CSCoverSheetView *)v4 _addStatusBarLegibilityView];
    v9 = [[CSScrollModifier alloc] initWithView:v4];
    scrollModifier = v4->_scrollModifier;
    v4->_scrollModifier = v9;
  }
  return v4;
}

- (void)setFakeStatusBar:(id)a3
{
  v5 = (UIView *)a3;
  fakeStatusBar = self->_fakeStatusBar;
  if (fakeStatusBar != v5)
  {
    v11 = v5;
    [(UIView *)fakeStatusBar removeFromSuperview];
    objc_storeStrong((id *)&self->_fakeStatusBar, a3);
    fakeStatusBarWrapperView = self->_fakeStatusBarWrapperView;
    if (!fakeStatusBarWrapperView)
    {
      v8 = [CSPropertyAnimatingTouchPassThroughView alloc];
      v9 = -[CSPropertyAnimatingTouchPassThroughView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v10 = self->_fakeStatusBarWrapperView;
      self->_fakeStatusBarWrapperView = v9;

      [(CSCoverSheetView *)self addSubview:self->_fakeStatusBarWrapperView];
      [(CSCoverSheetView *)self _prepareBlursForView:self->_fakeStatusBarWrapperView withHardEdges:1];
      fakeStatusBarWrapperView = self->_fakeStatusBarWrapperView;
    }
    [(CSPropertyAnimatingTouchPassThroughView *)fakeStatusBarWrapperView addSubview:self->_fakeStatusBar];
    fakeStatusBar = (UIView *)[(CSCoverSheetView *)self _layoutFakeStatusBar];
    v5 = v11;
  }

  MEMORY[0x1F41817F8](fakeStatusBar, v5);
}

- (void)setFakeStatusBarLevel:(unint64_t)a3
{
  if (self->_fakeStatusBarLevel != a3)
  {
    self->_fakeStatusBarLevel = a3;
    [(CSCoverSheetView *)self _orderSubviews];
  }
}

- (void)setFakeStatusBarBlurRadius:(double)a3
{
  if (self->_fakeStatusBarBlurRadius != a3)
  {
    self->_fakeStatusBarBlurRadius = a3;
    if (self->_fakeStatusBarWrapperView) {
      -[CSCoverSheetView _updateBlurForView:toRadius:](self, "_updateBlurForView:toRadius:");
    }
  }
}

- (void)setFakeStatusBarScale:(double)a3
{
  if (self->_fakeStatusBarScale != a3)
  {
    self->_fakeStatusBarScale = a3;
    [(CSCoverSheetView *)self _layoutFakeStatusBar];
  }
}

- (void)setStatusBarBackgroundView:(id)a3
{
  v5 = (UIView *)a3;
  p_statusBarBackgroundView = &self->_statusBarBackgroundView;
  statusBarBackgroundView = self->_statusBarBackgroundView;
  v8 = v5;
  if (statusBarBackgroundView != v5)
  {
    [(UIView *)statusBarBackgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_statusBarBackgroundView, a3);
    if (*p_statusBarBackgroundView)
    {
      [(CSCoverSheetView *)self insertSubview:*p_statusBarBackgroundView aboveSubview:self->_scrollView];
      [(CSCoverSheetView *)self _layoutStatusBarBackgroundView];
    }
  }
}

- (void)setControlCenterGrabberScale:(double)a3
{
  if (self->_controlCenterGrabberScale != a3)
  {
    self->_controlCenterGrabberScale = a3;
    [(CSCoverSheetView *)self _layoutTeachableMomentsContainerView];
  }
}

- (void)setControlCenterGrabberBlurRadius:(double)a3
{
  if (self->_controlCenterGrabberBlurRadius != a3)
  {
    self->_controlCenterGrabberBlurRadius = a3;
    v4 = [(CSTeachableMomentsContainerView *)self->_teachableMomentsContainerView controlCenterGrabberContainerView];

    if (v4)
    {
      id v5 = [(CSTeachableMomentsContainerView *)self->_teachableMomentsContainerView controlCenterGrabberContainerView];
      [(CSCoverSheetView *)self _updateBlurForView:v5 toRadius:self->_controlCenterGrabberBlurRadius];
    }
  }
}

- (void)setWallpaperGestureRecognizer:(id)a3
{
  id v5 = (UIGestureRecognizer *)a3;
  if (self->_wallpaperGestureRecognizer != v5)
  {
    v8 = v5;
    [(CSCoverSheetView *)self _setupWallpaperGestureOnScrollView:0];
    objc_storeStrong((id *)&self->_wallpaperGestureRecognizer, a3);
    unint64_t v6 = [(SBFPagedScrollView *)self->_scrollView currentPageIndex];
    BOOL v7 = v6 == [(CSCoverSheetView *)self _indexOfMainPage];
    id v5 = v8;
    if (v7)
    {
      [(CSCoverSheetView *)self _setupWallpaperGestureOnScrollView:1];
      id v5 = v8;
    }
  }
}

- (void)setBackgroundContentGestureRecognizer:(id)a3
{
  id v5 = (UITapGestureRecognizer *)a3;
  if (self->_backgroundContentGestureRecognizer != v5)
  {
    v8 = v5;
    [(CSCoverSheetView *)self _setupBackgroundContentGestureOnScrollView:0];
    objc_storeStrong((id *)&self->_backgroundContentGestureRecognizer, a3);
    unint64_t v6 = [(SBFPagedScrollView *)self->_scrollView currentPageIndex];
    BOOL v7 = v6 == [(CSCoverSheetView *)self _indexOfMainPage];
    id v5 = v8;
    if (v7)
    {
      [(CSCoverSheetView *)self _setupBackgroundContentGestureOnScrollView:1];
      id v5 = v8;
    }
  }
}

- (void)setQuickNoteGestureRecognizer:(id)a3
{
  id v5 = (UITapGestureRecognizer *)a3;
  if (self->_quickNoteGestureRecognizer != v5)
  {
    v8 = v5;
    [(CSCoverSheetView *)self _setupQuickNoteGestureOnScrollView:0];
    objc_storeStrong((id *)&self->_quickNoteGestureRecognizer, a3);
    unint64_t v6 = [(SBFPagedScrollView *)self->_scrollView currentPageIndex];
    BOOL v7 = v6 == [(CSCoverSheetView *)self _indexOfMainPage];
    id v5 = v8;
    if (v7)
    {
      [(CSCoverSheetView *)self _setupQuickNoteGestureOnScrollView:1];
      id v5 = v8;
    }
  }
}

- (void)setSearchGesture:(id)a3
{
  id v5 = (SBSearchGesture *)a3;
  searchGesture = self->_searchGesture;
  BOOL v7 = v5;
  if (searchGesture != v5)
  {
    [(SBSearchGesture *)searchGesture setTargetView:0];
    objc_storeStrong((id *)&self->_searchGesture, a3);
    [(SBSearchGesture *)v7 setTargetView:self->_scrollView];
  }
}

- (void)setDateViewOffset:(CGPoint)a3
{
  if (self->_dateViewOffset.x != a3.x || self->_dateViewOffset.y != a3.y)
  {
    self->_dateViewOffset = a3;
    [(CSCoverSheetView *)self _layoutDateView];
  }
}

- (void)setDateViewScale:(double)a3
{
  if (self->_dateViewScale != a3)
  {
    self->_dateViewScale = a3;
    [(CSCoverSheetView *)self _layoutDateView];
  }
}

- (void)setDateViewStretch:(BOOL)a3
{
  if (self->_dateViewStretch != a3)
  {
    self->_dateViewStretch = a3;
    [(CSCoverSheetView *)self _layoutDateView];
  }
}

- (void)setContentViewOffset:(CGPoint)a3
{
  if (self->_contentViewOffset.x != a3.x || self->_contentViewOffset.y != a3.y)
  {
    self->_contentViewOffset = a3;
    [(CSCoverSheetView *)self _layoutContentView];
  }
}

- (void)setContentViewScale:(double)a3
{
  if (self->_contentViewScale != a3)
  {
    self->_contentViewScale = a3;
    [(CSCoverSheetView *)self _layoutContentView];
  }
}

- (void)setProudLockIconViewOffset:(CGPoint)a3
{
  if (self->_proudLockIconViewOffset.x != a3.x || self->_proudLockIconViewOffset.y != a3.y)
  {
    self->_proudLockIconViewOffset = a3;
    [(CSCoverSheetView *)self _layoutProudLockView];
  }
}

- (void)setProudLockIconViewScale:(double)a3
{
  if (self->_proudLockIconViewScale != a3)
  {
    self->_proudLockIconViewScale = a3;
    [(CSCoverSheetView *)self _layoutProudLockView];
  }
}

- (void)setProudLockPrefersLowerPresentationLevel:(BOOL)a3
{
  if (self->_proudLockPrefersLowerPresentationLevel != a3)
  {
    self->_proudLockPrefersLowerPresentationLevel = a3;
    [(CSCoverSheetView *)self _layoutProudLockView];
  }
}

- (void)setProudLockIconBlurRadius:(double)a3
{
  if (self->_proudLockIconBlurRadius != a3)
  {
    self->_proudLockIconBlurRadius = a3;
    if (self->_proudLockContainerWrapperView) {
      -[CSCoverSheetView _updateBlurForView:toRadius:](self, "_updateBlurForView:toRadius:");
    }
  }
}

- (void)setForceDateViewCentered:(BOOL)a3
{
  if (self->_forceDateViewCentered != a3)
  {
    self->_forceDateViewCentered = a3;
    [(CSCoverSheetView *)self _layoutDateView];
  }
}

- (void)setDateViewIsVibrant:(BOOL)a3
{
  if (self->_dateViewIsVibrant != a3)
  {
    self->_dateViewIsVibrant = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __41__CSCoverSheetView_setDateViewIsVibrant___block_invoke;
    v3[3] = &unk_1E6AD8CD0;
    BOOL v4 = a3;
    v3[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v3];
  }
}

uint64_t __41__CSCoverSheetView_setDateViewIsVibrant___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    v3 = *(void **)(v2 + 456);
    if (!v3)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F43028]);
      id v5 = objc_opt_new();
      uint64_t v6 = [v4 initWithEffect:v5];
      uint64_t v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 456);
      *(void *)(v7 + 456) = v6;

      [*(id *)(*(void *)(a1 + 32) + 456) setClipsToBounds:0];
      v9 = [*(id *)(*(void *)(a1 + 32) + 456) contentView];
      [v9 setClipsToBounds:0];

      [*(id *)(*(void *)(a1 + 32) + 424) addSubview:*(void *)(*(void *)(a1 + 32) + 456)];
      v3 = *(void **)(*(void *)(a1 + 32) + 456);
    }
    v10 = [v3 contentView];
    [v10 addSubview:*(void *)(*(void *)(a1 + 32) + 640)];
  }
  else
  {
    [*(id *)(v2 + 424) addSubview:*(void *)(v2 + 640)];
    v11 = *(void **)(*(void *)(a1 + 32) + 456);
    if (!v11) {
      goto LABEL_8;
    }
    [v11 removeFromSuperview];
    uint64_t v12 = *(void *)(a1 + 32);
    v10 = *(void **)(v12 + 456);
    *(void *)(v12 + 456) = 0;
  }

LABEL_8:
  v13 = *(void **)(a1 + 32);

  return [v13 _layoutDateView];
}

- (void)setDateViewGestureRecognizer:(id)a3
{
  id v5 = (UIGestureRecognizer *)a3;
  if (self->_dateViewGestureRecognizer != v5)
  {
    v8 = v5;
    [(CSCoverSheetView *)self _setupDateViewGestureOnScrollView:0];
    objc_storeStrong((id *)&self->_dateViewGestureRecognizer, a3);
    unint64_t v6 = [(SBFPagedScrollView *)self->_scrollView currentPageIndex];
    BOOL v7 = v6 == [(CSCoverSheetView *)self _indexOfMainPage];
    id v5 = v8;
    if (v7)
    {
      [(CSCoverSheetView *)self _setupDateViewGestureOnScrollView:1];
      id v5 = v8;
    }
  }
}

- (void)setComplicationGestureRecognizer:(id)a3
{
  id v5 = (UILongPressGestureRecognizer *)a3;
  if (self->_complicationGestureRecognizer != v5)
  {
    v8 = v5;
    [(CSCoverSheetView *)self _setupComplicationGestureOnScrollView:0];
    objc_storeStrong((id *)&self->_complicationGestureRecognizer, a3);
    unint64_t v6 = [(SBFPagedScrollView *)self->_scrollView currentPageIndex];
    BOOL v7 = v6 == [(CSCoverSheetView *)self _indexOfMainPage];
    id v5 = v8;
    if (v7)
    {
      [(CSCoverSheetView *)self _setupComplicationGestureOnScrollView:1];
      id v5 = v8;
    }
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(CSCoverSheetView *)self _updateLegibility];
  }
}

- (void)setModalPresentationView:(id)a3
{
  id v5 = (UIView *)a3;
  p_modalPresentationView = &self->_modalPresentationView;
  modalPresentationView = self->_modalPresentationView;
  if (modalPresentationView != v5)
  {
    v9 = v5;
    [(UIView *)modalPresentationView removeFromSuperview];
    objc_storeStrong((id *)&self->_modalPresentationView, a3);
    v8 = *p_modalPresentationView;
    [(CSCoverSheetView *)self bounds];
    -[UIView setFrame:](v8, "setFrame:");
    [(CSCoverSheetView *)self addSubview:*p_modalPresentationView];
    modalPresentationView = (UIView *)[(CSCoverSheetView *)self setNeedsLayout];
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](modalPresentationView, v5);
}

- (void)setModalPresentationLevel:(unint64_t)a3
{
  if (self->_modalPresentationLevel != a3)
  {
    self->_modalPresentationLevel = a3;
    [(CSCoverSheetView *)self _orderSubviews];
  }
}

- (void)setWallpaperPresentationLevel:(unint64_t)a3
{
  if (self->_wallpaperPresentationLevel != a3)
  {
    self->_wallpaperPresentationLevel = a3;
    [(CSCoverSheetView *)self _orderSubviews];
  }
}

- (void)setWallpaperFloatingLayerPresentationLevel:(unint64_t)a3
{
  if (self->_wallpaperFloatingLayerPresentationLevel != a3)
  {
    self->_wallpaperFloatingLayerPresentationLevel = a3;
    [(CSCoverSheetView *)self _orderSubviews];
  }
}

- (void)setDateTimePresentationLevel:(unint64_t)a3
{
  if (self->_dateTimePresentationLevel != a3)
  {
    self->_dateTimePresentationLevel = a3;
    [(CSCoverSheetView *)self _orderSubviews];
  }
}

- (void)setBackgroundContentPresentationLevel:(unint64_t)a3
{
  if (self->_backgroundContentPresentationLevel != a3)
  {
    self->_backgroundContentPresentationLevel = a3;
    [(CSCoverSheetView *)self _orderSubviews];
  }
}

- (void)updateStatusBarLegibilityForForceLegibilityGradientHidden:(BOOL)a3
{
}

- (void)setWallpaperFloatingLayerContainerViewOffset:(CGPoint)a3
{
  if (self->_wallpaperFloatingLayerContainerViewOffset.x != a3.x
    || self->_wallpaperFloatingLayerContainerViewOffset.y != a3.y)
  {
    self->_wallpaperFloatingLayerContainerViewOffset = a3;
    [(CSCoverSheetView *)self _layoutWallpaperFloatingLayerContainerView];
  }
}

- (void)setWallpaperFloatingLayerContainerViewScale:(double)a3
{
  if (self->_wallpaperFloatingLayerContainerViewScale != a3)
  {
    self->_wallpaperFloatingLayerContainerViewScale = a3;
    [(CSCoverSheetView *)self _layoutWallpaperFloatingLayerContainerView];
  }
}

- (void)setBackgroundContentViewOffset:(CGPoint)a3
{
  if (self->_backgroundContentViewOffset.x != a3.x || self->_backgroundContentViewOffset.y != a3.y)
  {
    self->_backgroundContentViewOffset = a3;
    [(CSCoverSheetView *)self _layoutBackgroundContentView];
  }
}

- (void)setBackgroundContentViewScale:(double)a3
{
  if (self->_backgroundContentViewScale != a3)
  {
    self->_backgroundContentViewScale = a3;
    [(CSCoverSheetView *)self _layoutBackgroundContentView];
  }
}

- (void)setBackgroundContentViewAlpha:(double)a3
{
  if (self->_backgroundContentViewAlpha != a3)
  {
    self->_backgroundContentViewAlpha = a3;
    -[CSBackgroundContentView setAlpha:](self->_backgroundContentView, "setAlpha:");
  }
}

- (void)setBottomPage:(id)a3
{
  id v5 = (UIView *)a3;
  bottomPage = self->_bottomPage;
  if (bottomPage != v5)
  {
    BOOL v7 = v5;
    [(UIView *)bottomPage removeFromSuperview];
    objc_storeStrong((id *)&self->_bottomPage, a3);
    id v5 = v7;
    if (v7)
    {
      [(UIView *)self->_slideableContentView addSubview:v7];
      bottomPage = (UIView *)[(CSCoverSheetView *)self _layoutBottomPage];
      id v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](bottomPage, v5);
}

- (void)setDateView:(id)a3
{
}

- (void)setTeachableMomentsContainerView:(id)a3
{
  id v5 = (CSTeachableMomentsContainerView *)a3;
  p_teachableMomentsContainerView = &self->_teachableMomentsContainerView;
  teachableMomentsContainerView = self->_teachableMomentsContainerView;
  if (teachableMomentsContainerView != v5)
  {
    v9 = v5;
    [(CSTeachableMomentsContainerView *)teachableMomentsContainerView removeFromSuperview];
    objc_storeStrong((id *)&self->_teachableMomentsContainerView, a3);
    [(UIView *)self->_higherSlideableContentView addSubview:*p_teachableMomentsContainerView];
    v8 = [(CSTeachableMomentsContainerView *)*p_teachableMomentsContainerView controlCenterGrabberContainerView];
    [(CSCoverSheetView *)self _prepareBlursForView:v8 withHardEdges:0];

    teachableMomentsContainerView = (CSTeachableMomentsContainerView *)[(CSCoverSheetView *)self setNeedsLayout];
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](teachableMomentsContainerView, v5);
}

- (void)setSidebarComplicationContainerView:(id)a3
{
  id v5 = (UIView *)a3;
  sidebarComplicationContainerView = self->_sidebarComplicationContainerView;
  if (sidebarComplicationContainerView != v5)
  {
    BOOL v7 = v5;
    [(UIView *)sidebarComplicationContainerView removeFromSuperview];
    objc_storeStrong((id *)&self->_sidebarComplicationContainerView, a3);
    [(UIView *)self->_slideableContentView addSubview:self->_sidebarComplicationContainerView];
    sidebarComplicationContainerView = (UIView *)[(CSCoverSheetView *)self setNeedsLayout];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](sidebarComplicationContainerView, v5);
}

- (void)setFixedFooterView:(id)a3
{
  id v5 = (CSFixedFooterView *)a3;
  p_fixedFooterView = &self->_fixedFooterView;
  fixedFooterView = self->_fixedFooterView;
  if (fixedFooterView != v5)
  {
    v10 = v5;
    [(CSFixedFooterView *)fixedFooterView removeFromSuperview];
    objc_storeStrong((id *)&self->_fixedFooterView, a3);
    v8 = *p_fixedFooterView;
    v9 = [(CSCoverSheetView *)self scrollView];
    [(CSFixedFooterView *)v8 setTrackingScrollViewForPageControl:v9];

    [(UIView *)self->_slideableContentView insertSubview:*p_fixedFooterView atIndex:0];
    fixedFooterView = (CSFixedFooterView *)[(CSCoverSheetView *)self setNeedsLayout];
    id v5 = v10;
  }

  MEMORY[0x1F41817F8](fixedFooterView, v5);
}

- (void)setProudLockContainerView:(id)a3
{
  id v5 = (UIView *)a3;
  proudLockContainerView = self->_proudLockContainerView;
  if (proudLockContainerView != v5)
  {
    BOOL v7 = v5;
    [(UIView *)proudLockContainerView removeFromSuperview];
    objc_storeStrong((id *)&self->_proudLockContainerView, a3);
    [(CSCoverSheetView *)self _createProudLockContainerWrapperIfNecessary];
    [(CSPropertyAnimatingTouchPassThroughView *)self->_proudLockContainerWrapperView addSubview:self->_proudLockContainerView];
    proudLockContainerView = (UIView *)[(CSCoverSheetView *)self setNeedsLayout];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](proudLockContainerView, v5);
}

- (void)setCameraCoveredView:(id)a3
{
  id v5 = (UIView *)a3;
  cameraCoveredView = self->_cameraCoveredView;
  if (cameraCoveredView != v5)
  {
    BOOL v7 = v5;
    [(UIView *)cameraCoveredView removeFromSuperview];
    objc_storeStrong((id *)&self->_cameraCoveredView, a3);
    [(CSCoverSheetView *)self _createProudLockContainerWrapperIfNecessary];
    [(CSPropertyAnimatingTouchPassThroughView *)self->_proudLockContainerWrapperView addSubview:self->_cameraCoveredView];
    cameraCoveredView = (UIView *)[(CSCoverSheetView *)self setNeedsLayout];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](cameraCoveredView, v5);
}

- (void)_createProudLockContainerWrapperIfNecessary
{
  if (!self->_proudLockContainerWrapperView)
  {
    v3 = [CSPropertyAnimatingTouchPassThroughView alloc];
    id v4 = -[CSPropertyAnimatingTouchPassThroughView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    proudLockContainerWrapperView = self->_proudLockContainerWrapperView;
    self->_proudLockContainerWrapperView = v4;

    [(CSCoverSheetView *)self _prepareBlursForView:self->_proudLockContainerWrapperView withHardEdges:1];
    [(CSCoverSheetView *)self setNeedsLayout];
  }
}

- (void)setPoseidonContainerView:(id)a3
{
  id v5 = (UIView *)a3;
  poseidonContainerView = self->_poseidonContainerView;
  if (poseidonContainerView != v5)
  {
    BOOL v7 = v5;
    [(UIView *)poseidonContainerView removeFromSuperview];
    objc_storeStrong((id *)&self->_poseidonContainerView, a3);
    [(UIView *)self->_higherSlideableContentView addSubview:self->_poseidonContainerView];
    poseidonContainerView = (UIView *)[(CSCoverSheetView *)self setNeedsLayout];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](poseidonContainerView, v5);
}

- (void)setWallpaperEffectView:(id)a3
{
  id v5 = (CSWallpaperView *)a3;
  p_wallpaperEffectView = &self->_wallpaperEffectView;
  wallpaperEffectView = self->_wallpaperEffectView;
  if (wallpaperEffectView != v5)
  {
    v8 = v5;
    [(CSWallpaperView *)wallpaperEffectView removeFromSuperview];
    objc_storeStrong((id *)&self->_wallpaperEffectView, a3);
    if (*p_wallpaperEffectView)
    {
      -[UIView addSubview:](self->_slideableContentView, "addSubview:");
      [(UIView *)self->_slideableContentView sendSubviewToBack:*p_wallpaperEffectView];
    }
    wallpaperEffectView = (CSWallpaperView *)[(CSCoverSheetView *)self setNeedsLayout];
    id v5 = v8;
  }

  MEMORY[0x1F41817F8](wallpaperEffectView, v5);
}

- (void)setBackgroundContentView:(id)a3
{
  id v5 = (CSBackgroundContentView *)a3;
  p_backgroundContentView = &self->_backgroundContentView;
  backgroundContentView = self->_backgroundContentView;
  if (backgroundContentView != v5)
  {
    v8 = v5;
    [(CSBackgroundContentView *)backgroundContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundContentView, a3);
    if (*p_backgroundContentView)
    {
      -[UIView addSubview:](self->_slideableContentView, "addSubview:");
      [(UIView *)self->_slideableContentView sendSubviewToBack:*p_backgroundContentView];
    }
    backgroundContentView = (CSBackgroundContentView *)[(CSCoverSheetView *)self setNeedsLayout];
    id v5 = v8;
  }

  MEMORY[0x1F41817F8](backgroundContentView, v5);
}

- (void)setWakeEffectView:(id)a3
{
  id v5 = (UIView *)a3;
  p_wakeEffectView = &self->_wakeEffectView;
  wakeEffectView = self->_wakeEffectView;
  if (wakeEffectView != v5)
  {
    v8 = v5;
    [(UIView *)wakeEffectView removeFromSuperview];
    objc_storeStrong((id *)&self->_wakeEffectView, a3);
    if (*p_wakeEffectView)
    {
      -[UIView addSubview:](self->_slideableContentView, "addSubview:");
      [(UIView *)self->_slideableContentView sendSubviewToBack:*p_wakeEffectView];
    }
    wakeEffectView = (UIView *)[(CSCoverSheetView *)self setNeedsLayout];
    id v5 = v8;
  }

  MEMORY[0x1F41817F8](wakeEffectView, v5);
}

- (void)setPageViews:(id)a3
{
  [(SBFPagedScrollView *)self->_scrollView setPageViews:a3];
  fixedFooterView = self->_fixedFooterView;

  [(CSFixedFooterView *)fixedFooterView updatePageControl];
}

- (NSArray)pageViews
{
  return [(SBFPagedScrollView *)self->_scrollView pageViews];
}

- (void)setBackgroundView:(id)a3
{
  id v5 = (SBUIBackgroundView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  v8 = v5;
  v11 = v5;
  if (backgroundView != v5)
  {
    if (backgroundView) {
      [(SBUIBackgroundView *)backgroundView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_backgroundView, a3);
    [(SBUIBackgroundView *)*p_backgroundView setUserInteractionEnabled:0];
    [(SBUIBackgroundView *)*p_backgroundView setReduceTransparencyBackingColor:self->_reduceTransparencyBackingColor];
    v8 = *p_backgroundView;
  }
  v9 = [(SBUIBackgroundView *)v8 superview];
  backgroundContainerView = self->_backgroundContainerView;

  if (v9 != backgroundContainerView)
  {
    [(BSUIOrientationTransformWrapperView *)self->_backgroundContainerView addContentView:*p_backgroundView];
    [(CSCoverSheetView *)self setNeedsLayout];
  }
}

- (void)updateContainerOrientationForBackgroundViews:(int64_t)a3
{
  [(BSUIOrientationTransformWrapperView *)self->_backgroundContainerView setContainerOrientation:a3];
  backgroundContainerView = self->_backgroundContainerView;

  [(BSUIOrientationTransformWrapperView *)backgroundContainerView layoutIfNeeded];
}

- (void)setBedtimeGreetingViewBackgroundView:(id)a3
{
  id v5 = (SBUIBackgroundView *)a3;
  p_bedtimeGreetingViewBackgroundView = &self->_bedtimeGreetingViewBackgroundView;
  bedtimeGreetingViewBackgroundView = self->_bedtimeGreetingViewBackgroundView;
  if (bedtimeGreetingViewBackgroundView != v5)
  {
    v8 = v5;
    if (bedtimeGreetingViewBackgroundView) {
      [(SBUIBackgroundView *)bedtimeGreetingViewBackgroundView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_bedtimeGreetingViewBackgroundView, a3);
    [(SBUIBackgroundView *)*p_bedtimeGreetingViewBackgroundView setUserInteractionEnabled:0];
    [(SBUIBackgroundView *)*p_bedtimeGreetingViewBackgroundView setReduceTransparencyBackingColor:self->_reduceTransparencyBackingColor];
    bedtimeGreetingViewBackgroundView = (SBUIBackgroundView *)[(BSUIOrientationTransformWrapperView *)self->_backgroundContainerView addContentView:*p_bedtimeGreetingViewBackgroundView];
    id v5 = v8;
  }

  MEMORY[0x1F41817F8](bedtimeGreetingViewBackgroundView, v5);
}

- (void)setReduceTransparencyBackingColor:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  if (v5)
  {
    p_reduceTransparencyBackingColor = &self->_reduceTransparencyBackingColor;
    uint64_t v8 = v5;
    uint64_t v5 = [(UIColor *)self->_reduceTransparencyBackingColor isEqual:v5];
    uint64_t v6 = v8;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_reduceTransparencyBackingColor, a3);
      [(SBUIBackgroundView *)self->_bedtimeGreetingViewBackgroundView setReduceTransparencyBackingColor:*p_reduceTransparencyBackingColor];
      uint64_t v5 = [(SBUIBackgroundView *)self->_backgroundView setReduceTransparencyBackingColor:*p_reduceTransparencyBackingColor];
      uint64_t v6 = v8;
    }
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)setQuickActionsView:(id)a3
{
  uint64_t v5 = (CSQuickActionsView *)a3;
  p_quickActionsView = &self->_quickActionsView;
  quickActionsView = self->_quickActionsView;
  v9 = v5;
  if (quickActionsView == v5)
  {
    uint64_t v8 = [(CSQuickActionsView *)v5 superview];

    if (v8 == self) {
      goto LABEL_5;
    }
    quickActionsView = *p_quickActionsView;
  }
  [(CSQuickActionsView *)quickActionsView removeFromSuperview];
  objc_storeStrong((id *)&self->_quickActionsView, a3);
  [(CSCoverSheetView *)self addSubview:*p_quickActionsView];
  [(CSCoverSheetView *)self _prepareBlursForView:*p_quickActionsView withHardEdges:0];
LABEL_5:
}

- (void)setQuickActionsViewOffset:(CGPoint)a3
{
  if (self->_quickActionsViewOffset.x != a3.x || self->_quickActionsViewOffset.y != a3.y)
  {
    self->_quickActionsViewOffset = a3;
    [(CSCoverSheetView *)self _layoutQuickActionsView];
  }
}

- (void)setQuickActionsViewScale:(double)a3
{
  if (self->_quickActionsViewScale != a3)
  {
    self->_quickActionsViewScale = a3;
    [(CSCoverSheetView *)self _layoutQuickActionsView];
  }
}

- (void)setQuickActionsViewBlurRadius:(double)a3
{
  if (self->_quickActionsViewBlurRadius != a3)
  {
    self->_quickActionsViewBlurRadius = a3;
    if (self->_quickActionsView) {
      -[CSCoverSheetView _updateBlurForView:toRadius:](self, "_updateBlurForView:toRadius:");
    }
  }
}

- (void)setQuickActionsViewOffset:(CGPoint)a3 scale:(double)a4
{
  if (self->_quickActionsViewOffset.x != a3.x || self->_quickActionsViewOffset.y != a3.y)
  {
    self->_quickActionsViewOffset = a3;
    p_quickActionsViewScale = &self->_quickActionsViewScale;
    if (self->_quickActionsViewScale == a4)
    {
LABEL_6:
      [(CSCoverSheetView *)self _layoutQuickActionsView];
      return;
    }
LABEL_8:
    double *p_quickActionsViewScale = a4;
    goto LABEL_6;
  }
  p_quickActionsViewScale = &self->_quickActionsViewScale;
  if (self->_quickActionsViewScale != a4) {
    goto LABEL_8;
  }
}

- (void)setDateViewOffset:(CGPoint)a3 scale:(double)a4
{
  if (self->_dateViewOffset.x != a3.x || self->_dateViewOffset.y != a3.y)
  {
    self->_dateViewOffset = a3;
    p_dateViewScale = &self->_dateViewScale;
    if (self->_dateViewScale == a4)
    {
LABEL_6:
      [(CSCoverSheetView *)self _layoutDateView];
      return;
    }
LABEL_8:
    double *p_dateViewScale = a4;
    goto LABEL_6;
  }
  p_dateViewScale = &self->_dateViewScale;
  if (self->_dateViewScale != a4) {
    goto LABEL_8;
  }
}

- (void)setContentViewOffset:(CGPoint)a3 scale:(double)a4
{
  if (self->_contentViewOffset.x != a3.x || self->_contentViewOffset.y != a3.y)
  {
    self->_contentViewOffset = a3;
    p_contentViewScale = &self->_contentViewScale;
    if (self->_contentViewScale == a4)
    {
LABEL_6:
      [(CSCoverSheetView *)self _layoutContentView];
      return;
    }
LABEL_8:
    double *p_contentViewScale = a4;
    goto LABEL_6;
  }
  p_contentViewScale = &self->_contentViewScale;
  if (self->_contentViewScale != a4) {
    goto LABEL_8;
  }
}

- (void)setProudLockIconViewOffset:(CGPoint)a3 scale:(double)a4
{
  if (self->_proudLockIconViewOffset.x != a3.x || self->_proudLockIconViewOffset.y != a3.y)
  {
    self->_proudLockIconViewOffset = a3;
    p_proudLockIconViewScale = &self->_proudLockIconViewScale;
    if (self->_proudLockIconViewScale == a4)
    {
LABEL_6:
      [(CSCoverSheetView *)self _layoutProudLockView];
      return;
    }
LABEL_8:
    double *p_proudLockIconViewScale = a4;
    goto LABEL_6;
  }
  p_proudLockIconViewScale = &self->_proudLockIconViewScale;
  if (self->_proudLockIconViewScale != a4) {
    goto LABEL_8;
  }
}

- (void)setWallpaperFloatingLayerContainerViewOffset:(CGPoint)a3 scale:(double)a4
{
  if (self->_wallpaperFloatingLayerContainerViewOffset.x != a3.x
    || self->_wallpaperFloatingLayerContainerViewOffset.y != a3.y)
  {
    self->_wallpaperFloatingLayerContainerViewOffset = a3;
    p_wallpaperFloatingLayerContainerViewScale = &self->_wallpaperFloatingLayerContainerViewScale;
    if (self->_wallpaperFloatingLayerContainerViewScale == a4)
    {
LABEL_6:
      [(CSCoverSheetView *)self _layoutWallpaperFloatingLayerContainerView];
      return;
    }
LABEL_8:
    double *p_wallpaperFloatingLayerContainerViewScale = a4;
    goto LABEL_6;
  }
  p_wallpaperFloatingLayerContainerViewScale = &self->_wallpaperFloatingLayerContainerViewScale;
  if (self->_wallpaperFloatingLayerContainerViewScale != a4) {
    goto LABEL_8;
  }
}

- (void)setBackgroundContentViewOffset:(CGPoint)a3 scale:(double)a4
{
  if (self->_backgroundContentViewOffset.x != a3.x || self->_backgroundContentViewOffset.y != a3.y)
  {
    self->_backgroundContentViewOffset = a3;
    p_backgroundContentViewScale = &self->_backgroundContentViewScale;
    if (self->_backgroundContentViewScale == a4)
    {
LABEL_6:
      [(CSCoverSheetView *)self _layoutBackgroundContentView];
      return;
    }
LABEL_8:
    double *p_backgroundContentViewScale = a4;
    goto LABEL_6;
  }
  p_backgroundContentViewScale = &self->_backgroundContentViewScale;
  if (self->_backgroundContentViewScale != a4) {
    goto LABEL_8;
  }
}

- (BOOL)resetScrollViewToMainPageAnimated:(BOOL)a3 withCompletion:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  BOOL v7 = [(CSCoverSheetView *)self scrollView];
  LOBYTE(v4) = objc_msgSend(v7, "scrollToPageAtIndex:animated:withCompletion:", -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage"), v4, v6);

  return v4;
}

- (BOOL)resetScrollViewToMainPageAnimated:(BOOL)a3 withAnimationSettings:(id)a4 withCompletion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  v9 = [(CSCoverSheetView *)self scrollView];
  LOBYTE(self) = objc_msgSend(v9, "scrollToPageAtIndex:withAnimationSettings:withCompletion:", -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage"), v8, v7);

  return (char)self;
}

- (BOOL)scrollToPageAtIndex:(unint64_t)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v9 = self->_scrollView;
  [(SBFPagedScrollView *)v9 setGestureEnabled:0];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__CSCoverSheetView_scrollToPageAtIndex_animated_withCompletion___block_invoke;
  v13[3] = &unk_1E6AD8B20;
  v14 = v9;
  id v15 = v8;
  id v10 = v8;
  v11 = v9;
  LOBYTE(v5) = [(SBFPagedScrollView *)v11 scrollToPageAtIndex:a3 animated:v5 withCompletion:v13];

  return v5;
}

uint64_t __64__CSCoverSheetView_scrollToPageAtIndex_animated_withCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setGestureEnabled:1];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)updateUIForAuthenticated:(BOOL)a3
{
  if (a3)
  {
    double v4 = 0.0;
    double v5 = 1.0;
  }
  else
  {
    double v4 = 1.0;
    double v5 = 0.0;
  }
  id v6 = [MEMORY[0x1E4F428B8] colorWithRed:v4 green:v5 blue:0.0 alpha:0.5];
  [(UIView *)self->_authIndicator setBackgroundColor:v6];
}

- (void)setForegroundViewPositionOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (self->_foregroundViewPositionOffset.x != a3.x || self->_foregroundViewPositionOffset.y != a3.y)
  {
    self->_foregroundViewPositionOffset = a3;
    if (BSFloatIsZero()) {
      [(CSCoverSheetView *)self _removeContentView];
    }
    else {
      [(CSCoverSheetView *)self addSubview:self->_scrollView];
    }
    [(CSCoverSheetView *)self _orderSubviews];
    if (BSPointEqualToPoint())
    {
      slideableContentView = self->_slideableContentView;
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v14.a = *MEMORY[0x1E4F1DAB8];
      long long v11 = *(_OWORD *)&v14.a;
      *(_OWORD *)&v14.c = v12;
      *(_OWORD *)&v14.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      long long v10 = *(_OWORD *)&v14.tx;
      [(UIView *)slideableContentView setTransform:&v14];
      higherSlideableContentView = self->_higherSlideableContentView;
      *(_OWORD *)&v14.a = v11;
      *(_OWORD *)&v14.c = v12;
      *(_OWORD *)&v14.tCGFloat x = v10;
      v9 = &v14;
    }
    else
    {
      memset(&v14, 0, sizeof(v14));
      CGAffineTransformMakeTranslation(&v14, x, y);
      higherSlideableContentView = self->_slideableContentView;
      CGAffineTransform v13 = v14;
      v9 = &v13;
    }
    [(UIView *)higherSlideableContentView setTransform:v9];
    [(CSCoverSheetView *)self _layoutFakeStatusBar];
    [(CSCoverSheetView *)self _layoutHigherSlideableContentView];
  }
}

- (void)viewControllerWillAppear
{
  self->_viewControllerAppearingOrAppeared = 1;
  unint64_t v3 = [(SBFPagedScrollView *)self->_scrollView currentPageIndex];
  if (v3 == [(CSCoverSheetView *)self _indexOfMainPage])
  {
    [(CSCoverSheetView *)self _setupAllGesturesOnScrollView:1];
    searchGesture = self->_searchGesture;
    scrollView = self->_scrollView;
    [(SBSearchGesture *)searchGesture setTargetView:scrollView];
  }
}

- (void)viewControllerDidDisappear
{
  self->_viewControllerAppearingOrAppeared = 0;
  [(CSCoverSheetView *)self _setupAllGesturesOnScrollView:0];
  [(SBSearchGesture *)self->_searchGesture setTargetView:0];
  [(CSCoverSheetView *)self cancelTransition];
  self->_shouldModifyPageScrolling = 1;
}

- (CGRect)dateViewPresentationExtentForPageRelativeScrollOffset:(double)a3
{
  double v8 = 0.0;
  [(CSCoverSheetView *)self _dateViewFrameForPageAlignment:0 pageRelativeScrollOffset:&v8 outAlignmentPercent:a3];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  [(SBFLockScreenDateView *)self->_dateView presentationExtentForAlignmentPercent:v8];
  return CGRectOffset(v9, v5, v7);
}

- (void)_setLockScreenDefaults:(id)a3
{
}

- (id)_lockScreenDefaults
{
  cachedLockScreenDefaults = self->_cachedLockScreenDefaults;
  if (!cachedLockScreenDefaults)
  {
    double v4 = (SBLockScreenDefaults *)objc_alloc_init(MEMORY[0x1E4FA60B0]);
    CGFloat v5 = self->_cachedLockScreenDefaults;
    self->_cachedLockScreenDefaults = v4;

    cachedLockScreenDefaults = self->_cachedLockScreenDefaults;
  }

  return cachedLockScreenDefaults;
}

- (void)didAddSubview:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetView;
  [(CSCoverSheetView *)&v4 didAddSubview:a3];
  [(CSCoverSheetView *)self _orderSubviews];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSCoverSheetView;
  [(CSCoverSheetView *)&v3 layoutSubviews];
  [(CSCoverSheetView *)self _layoutFullScreenViews];
  [(CSCoverSheetView *)self _layoutDateTimeViewClippingView];
  [(CSCoverSheetView *)self _layoutDateView];
  [(CSCoverSheetView *)self _layoutSidebarComplicationContainerView];
  [(CSCoverSheetView *)self _layoutFakeStatusBar];
  [(CSCoverSheetView *)self _layoutAuthIndicator];
  [(CSCoverSheetView *)self _layoutBottomPage];
  [(CSCoverSheetView *)self _layoutWallpaperEffectView];
  [(CSCoverSheetView *)self _layoutTintingView];
  [(CSCoverSheetView *)self _layoutProudLockView];
  [(CSCoverSheetView *)self _layoutHigherSlideableContentView];
  [(CSCoverSheetView *)self _layoutTeachableMomentsContainerView];
  [(CSCoverSheetView *)self _layoutQuickActionsView];
  [(CSCoverSheetView *)self _layoutStatusBarLegibilityView];
  [(CSCoverSheetView *)self _layoutBackgroundContentView];
  [(CSCoverSheetView *)self _layoutWallpaperFloatingLayerContainerView];
  [(SBSearchGesture *)self->_searchGesture updateForRotation];
  [(CSCoverSheetView *)self _orderSubviews];
}

- (void)setClipsToBounds:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CSCoverSheetView;
  -[CSCoverSheetView setClipsToBounds:](&v5, sel_setClipsToBounds_);
  [(UIView *)self->_dateTimeClippingView setClipsToBounds:v3];
}

- (CGPoint)_scrollView:(id)a3 adjustedOffsetForOffset:(CGPoint)a4 translation:(CGPoint)a5 startPoint:(CGPoint)a6 locationInView:(CGPoint)a7 horizontalVelocity:(double *)a8 verticalVelocity:(double *)a9
{
  double y = a7.y;
  double x = a7.x;
  double v13 = a6.y;
  double v14 = a6.x;
  double v15 = a5.y;
  double v16 = a5.x;
  double v17 = a4.y;
  double v18 = a4.x;
  id v20 = a3;
  initialPageIndedouble x = self->_initialPageIndex;
  if (initialPageIndex == [(CSCoverSheetView *)self _indexOfMainPage]
    && self->_shouldModifyPageScrolling)
  {
    -[CSScrollModifier scrollView:adjustedOffsetForOffset:translation:startPoint:locationInView:horizontalVelocity:verticalVelocity:](self->_scrollModifier, "scrollView:adjustedOffsetForOffset:translation:startPoint:locationInView:horizontalVelocity:verticalVelocity:", v20, a8, a9, v18, v17, v16, v15, v14, v13, x, y);
    double v18 = v22;
    double v17 = v23;
  }

  double v24 = v18;
  double v25 = v17;
  result.double y = v25;
  result.double x = v24;
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(SBFPagedScrollView *)self->_scrollView currentPageIndex];
  self->_initialPageIndedouble x = v4;
  if (v4 == [(CSCoverSheetView *)self _indexOfMainPage] && self->_shouldModifyPageScrolling) {
    [(CSScrollModifier *)self->_scrollModifier scrollViewWillBeginDragging:v5];
  }
  if ([(UIGestureRecognizer *)self->_wallpaperGestureRecognizer isEnabled])
  {
    [(UIGestureRecognizer *)self->_wallpaperGestureRecognizer setEnabled:0];
    [(UIGestureRecognizer *)self->_wallpaperGestureRecognizer setEnabled:1];
  }
}

- (void)scrollViewWillBeginScrolling:(id)a3
{
  id v4 = a3;
  kdebug_trace();
  id v5 = [(CSCoverSheetView *)self delegate];
  self->_shouldModifyPageScrolling = [v5 shouldModifyPageScrolling];

  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
  {
    [v4 contentSize];
    double v7 = v6;
    [v4 frame];
    double v9 = v7 - v8;
    [v4 contentOffset];
    double v11 = v9 - v10;
  }
  else
  {
    [v4 contentOffset];
  }
  self->_scrollViewStartingXOffset = v11;
  [(CSCoverSheetView *)self _currentTransitionContext];
  *(_OWORD *)&self->_transitionContext.value = v13;
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v14;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v15;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained transitionSource:self willBeginWithType:2];
  [WeakRetained setRestrictsTouchesForRemoteView:1];
}

- (void)scrollViewDidScroll:(id)a3 withContext:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(CSFixedFooterView *)self->_fixedFooterView updatePageControl];
  p_transitionContext = &self->_transitionContext;
  double value = self->_transitionContext.interval.start.value;
  double v7 = self->_transitionContext.value;
  long long v20 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  int64_t mode = self->_transitionContext.mode;
  uint64_t v21 = *(void *)&self->_transitionContext.interval.end.inclusive;
  [(CSCoverSheetView *)self _currentTransitionContext];
  long long v9 = *(_OWORD *)&buf[16];
  *(_OWORD *)&self->_transitionContext.double value = *(_OWORD *)buf;
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v9;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v19;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (mode)
  {
    if (self->_transitionContext.mode)
    {
      if ((BSFloatEqualToFloat() & 1) == 0)
      {
        *(double *)buf = value;
        *(_OWORD *)&buf[8] = v20;
        *(void *)&buf[24] = v21;
        if (BSIntervalOrder())
        {
          $DCA72CBAB2CDF67DA9370D0153CCCF3D end = self->_transitionContext.interval.end;
          *($DCA72CBAB2CDF67DA9370D0153CCCF3D *)buf = self->_transitionContext.interval.start;
          *($DCA72CBAB2CDF67DA9370D0153CCCF3D *)&buf[16] = end;
          if (BSIntervalOrder())
          {
            *(double *)buf = v7;
            *(double *)&buf[8] = value;
            *(_OWORD *)&buf[16] = v20;
            *(void *)&long long v19 = v21;
            *((void *)&v19 + 1) = mode;
            long long v12 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
            v16[0] = *(_OWORD *)&p_transitionContext->value;
            v16[1] = v12;
            v16[2] = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
            [(CSCoverSheetView *)self _completedTransitionContextForPreviousTransitionContext:buf newTransitionContext:v16];
            [WeakRetained transitionSource:self didEndWithContext:v17];
            [WeakRetained transitionSource:self willBeginWithType:2];
            long long v13 = SBLogDashBoard();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              int64_t v14 = self->_transitionContext.mode;
              *(_DWORD *)buf = 134217984;
              *(void *)&buf[4] = v14;
              _os_log_impl(&dword_1D839D000, v13, OS_LOG_TYPE_DEFAULT, "Scroll context did change to transitionContext.mode: %ld", buf, 0xCu);
            }
          }
        }
      }
    }
  }
  long long v15 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  *(_OWORD *)buf = *(_OWORD *)&p_transitionContext->value;
  *(_OWORD *)&buf[16] = v15;
  long long v19 = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
  [WeakRetained transitionSource:self didUpdateTransitionWithContext:buf];
  [(CSCoverSheetView *)self _layoutQuickActionsView];
  [(CSCoverSheetView *)self _layoutDateView];
  [(CSCoverSheetView *)self _layoutStatusBarBackgroundView];
  [(CSCoverSheetView *)self _layoutHigherSlideableContentView];
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  initialPageIndedouble x = self->_initialPageIndex;
  if (initialPageIndex == [(CSCoverSheetView *)self _indexOfMainPage]
    && self->_shouldModifyPageScrolling)
  {
    -[CSScrollModifier scrollViewWillEndDragging:withVelocity:targetContentOffset:](self->_scrollModifier, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);
    unint64_t v11 = [(SBFPagedScrollView *)self->_scrollView currentPageIndex];
    unint64_t v12 = self->_initialPageIndex;
    long long v13 = [(SBFPagedScrollView *)self->_scrollView pageViews];
    unint64_t v14 = [v13 count] - 1;

    if (v14 >= v11 + 1) {
      unint64_t v14 = v11 + 1;
    }
    uint64_t v15 = [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection];
    BOOL v16 = [(CSScrollModifier *)self->_scrollModifier scrollFromRightToLeft];
    if (v16) {
      unint64_t v17 = v11;
    }
    else {
      unint64_t v17 = v14;
    }
    if (v16) {
      unint64_t v18 = v14;
    }
    else {
      unint64_t v18 = v11;
    }
    if (v15 == 1) {
      unint64_t v19 = v17;
    }
    else {
      unint64_t v19 = v18;
    }
    BOOL v20 = [(CSScrollModifier *)self->_scrollModifier recognized];
    uint64_t v21 = [(CSCoverSheetView *)self scrollView];
    uint64_t v22 = v21;
    if (v20) {
      unint64_t v23 = v19;
    }
    else {
      unint64_t v23 = v12;
    }
    [v21 contentOffsetForPageAtIndex:v23];
    a5->double x = v24;
  }
  if (self->_targetPageIndexForDraggingEnded != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v25 = [(CSCoverSheetView *)self scrollView];
    [v25 contentOffsetForPageAtIndex:self->_targetPageIndexForDraggingEnded];
    a5->double x = v26;

    v27 = SBLogDashBoard();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t targetPageIndexForDraggingEnded = self->_targetPageIndexForDraggingEnded;
      int v29 = 134217984;
      unint64_t v30 = targetPageIndexForDraggingEnded;
      _os_log_impl(&dword_1D839D000, v27, OS_LOG_TYPE_DEFAULT, "Scroll did end dragging with no clear destination, moving to index: %lu", (uint8_t *)&v29, 0xCu);
    }
  }
}

- (void)scrollViewDidEndScrolling:(id)a3
{
  kdebug_trace();
  [(CSFixedFooterView *)self->_fixedFooterView updatePageControl];
  [(CSCoverSheetView *)self _currentTransitionContext];
  long long v4 = v10;
  *(_OWORD *)&self->_transitionContext.double value = v9;
  *(_OWORD *)&self->_transitionContext.interval.start.inclusive = v4;
  *(_OWORD *)&self->_transitionContext.interval.end.inclusive = v11;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  long long v6 = *(_OWORD *)&self->_transitionContext.interval.start.inclusive;
  long long v9 = *(_OWORD *)&self->_transitionContext.value;
  long long v10 = v6;
  long long v11 = *(_OWORD *)&self->_transitionContext.interval.end.inclusive;
  [WeakRetained transitionSource:self didEndWithContext:&v9];
  [WeakRetained setRestrictsTouchesForRemoteView:0];
  initialPageIndedouble x = self->_initialPageIndex;
  if (initialPageIndex == [(CSCoverSheetView *)self _indexOfMainPage]
    && self->_shouldModifyPageScrolling)
  {
    [(CSScrollModifier *)self->_scrollModifier reset];
  }
  [(CSCoverSheetView *)self _setupAllGesturesOnScrollView:0];
  if (self->_viewControllerAppearingOrAppeared)
  {
    unint64_t v8 = [(SBFPagedScrollView *)self->_scrollView currentPageIndex];
    if (v8 == [(CSCoverSheetView *)self _indexOfMainPage]) {
      [(CSCoverSheetView *)self _setupAllGesturesOnScrollView:1];
    }
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
}

- (BOOL)coverSheetScrollView:(id)a3 shouldSetContentOffset:(CGPoint)a4 animated:(BOOL)a5
{
  double x = a4.x;
  if (![(CSCoverSheetView *)self ignoresOverscrollOnMainPage]) {
    return 1;
  }
  double v7 = [(CSCoverSheetView *)self scrollView];
  objc_msgSend(v7, "contentOffsetForPageAtIndex:", -[CSCoverSheetView _indexOfMainPage](self, "_indexOfMainPage"));
  double v9 = v8;

  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    return x <= v9;
  }
  else {
    return x >= v9;
  }
}

- (BOOL)coverSheetScrollView:(id)a3 gestureRecognizerShouldBegin:(id)a4
{
  id v5 = a4;
  [v5 locationInView:self];
  double v7 = v6;
  double v9 = v8;
  long long v10 = [(CSCoverSheetView *)self delegate];
  long long v11 = [v5 view];

  LOBYTE(v5) = objc_msgSend(v10, "isTouchLocation:inRestrictedRectForGestureView:", v11, v7, v9);
  return v5 ^ 1;
}

- (NSString)coverSheetIdentifier
{
  uint64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (BOOL)isTransitioning
{
  uint64_t v2 = [(CSCoverSheetView *)self scrollView];
  char v3 = [v2 isScrolling];

  return v3;
}

- ($281FBD1A060D4C63F485A737B1C0EEA3)transitionContext
{
  long long v3 = *(_OWORD *)&self[10].var2;
  *($06DF839FA51B3C3CDB187C0923524556 *)&retstr->var0 = self[10].var1.var1;
  *(_OWORD *)&retstr->var1.var0.var1 = v3;
  *($06DF839FA51B3C3CDB187C0923524556 *)&retstr->var1.var1.var1 = self[11].var1.var0;
  return self;
}

- (void)cancelTransition
{
  long long v3 = [(CSCoverSheetView *)self scrollView];
  int v4 = [v3 isScrolling];

  if (v4)
  {
    id v5 = [(CSCoverSheetView *)self scrollView];
    double v6 = [(CSCoverSheetView *)self scrollView];
    double v7 = v6;
    if (v6)
    {
      [v6 currentScrollContext];
      double v8 = *((double *)&v11 + 1);
      double v9 = v12;
    }
    else
    {
      double v12 = 0.0;
      long long v10 = 0u;
      long long v11 = 0u;
      double v9 = 0.0;
      double v8 = 0.0;
    }
    objc_msgSend(v5, "setContentOffset:", v8, v9, v10, v11, *(void *)&v12);
  }
}

- (BOOL)isTransitioningBackgroundStyle
{
  return [(SBUIBackgroundView *)self->_backgroundView isTransitioningBackgroundStyle];
}

- (int64_t)backgroundStyle
{
  return [(SBUIBackgroundView *)self->_backgroundView backgroundStyle];
}

- (void)setBackgroundStyle:(int64_t)a3
{
}

- (void)beginTransitionToBackgroundStyle:(int64_t)a3
{
}

- (void)updateBackgroundStyleTransitionProgress:(double)a3
{
}

- (void)completeTransitionToBackgroundStyle:(int64_t)a3
{
}

- (void)_setDateView:(id)a3 forTesting:(BOOL)a4
{
  double v7 = (SBFLockScreenDateView *)a3;
  dateView = self->_dateView;
  if (dateView != v7)
  {
    long long v11 = v7;
    [(SBFLockScreenDateView *)dateView removeFromSuperview];
    objc_storeStrong((id *)&self->_dateView, a3);
    [(CSCoverSheetView *)self _updateDateFont];
    if (!a4)
    {
      dateEffectView = self->_dateEffectView;
      if (dateEffectView)
      {
        long long v10 = [(UIVisualEffectView *)dateEffectView contentView];
        [v10 addSubview:v11];
      }
      else
      {
        [(UIView *)self->_dateTimeClippingView addSubview:v11];
      }
    }
    [(CSCoverSheetView *)self _dateViewFrameForPageAlignment:1 pageRelativeScrollOffset:0 outAlignmentPercent:0.0];
    -[SBFLockScreenDateView setRestingFrame:](self->_dateView, "setRestingFrame:");
    dateView = (SBFLockScreenDateView *)[(CSCoverSheetView *)self _layoutDateView];
    double v7 = v11;
  }

  MEMORY[0x1F41817F8](dateView, v7);
}

- (void)_updateDateFont
{
  if ([(CSLookSettings *)self->_lookSettings useSettingsDateTime]
    && [(CSLookSettings *)self->_lookSettings customizesDateTime])
  {
    dateView = self->_dateView;
    int v4 = [(CSLookSettings *)self->_lookSettings customTimeFont];
    [(SBFLockScreenDateView *)dateView setCustomTimeFont:v4];

    id v5 = self->_dateView;
    BOOL v6 = [(CSLookSettings *)self->_lookSettings subtitleAboveTime];
    double v7 = v5;
  }
  else
  {
    double v8 = self->_dateView;
    double v9 = [MEMORY[0x1E4FA5F58] timeFont];
    [(SBFLockScreenDateView *)v8 setCustomTimeFont:v9];

    double v7 = self->_dateView;
    BOOL v6 = 0;
  }

  [(SBFLockScreenDateView *)v7 setSubtitleOnTop:v6];
}

- (void)setRegionsDebugView:(id)a3
{
  id v5 = (CSRegionsDebugView *)a3;
  regionsDebugView = self->_regionsDebugView;
  double v7 = v5;
  if (regionsDebugView != v5)
  {
    [(CSRegionsDebugView *)regionsDebugView removeFromSuperview];
    objc_storeStrong((id *)&self->_regionsDebugView, a3);
    [(CSCoverSheetView *)self addSubview:v7];
    [(CSCoverSheetView *)self setNeedsLayout];
  }
}

- (void)_layoutFullScreenViews
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  [(CSCoverSheetView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(CSCoverSheetView *)self center];
  double v24 = v12;
  double v25 = v11;
  -[BSUIOrientationTransformWrapperView setFrame:](self->_backgroundContainerView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_modalPresentationView, "setFrame:", v4, v6, v8, v10);
  -[CSFixedFooterView setFrame:](self->_fixedFooterView, "setFrame:", v4, v6, v8, v10);
  [(SBFPagedScrollView *)self->_scrollView frame];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  if ((BSRectEqualToRect() & 1) == 0)
  {
    uint64_t v21 = SBLogDashBoard();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v31.origin.double x = v14;
      v31.origin.double y = v16;
      v31.size.width = v18;
      v31.size.height = v20;
      uint64_t v22 = NSStringFromCGRect(v31);
      v32.origin.double x = v4;
      v32.origin.double y = v6;
      v32.size.width = v8;
      v32.size.height = v10;
      unint64_t v23 = NSStringFromCGRect(v32);
      *(_DWORD *)buf = 138412546;
      v27 = v22;
      __int16 v28 = 2112;
      int v29 = v23;
      _os_log_impl(&dword_1D839D000, v21, OS_LOG_TYPE_INFO, "CoverSheetView scrollView frame will change from %@ to %@", buf, 0x16u);
    }
    -[SBFPagedScrollView setFrame:](self->_scrollView, "setFrame:", v4, v6, v8, v10);
  }
  -[UIView setBounds:](self->_slideableContentView, "setBounds:", v4, v6, v8, v10);
  -[UIView setCenter:](self->_slideableContentView, "setCenter:", v25, v24);
  -[UIView setBounds:](self->_higherSlideableContentView, "setBounds:", v4, v6, v8, v10);
  -[UIView setCenter:](self->_higherSlideableContentView, "setCenter:", v25, v24);
  [(CSCoverSheetView *)self bringSubviewToFront:self->_regionsDebugView];
  -[CSRegionsDebugView setFrame:](self->_regionsDebugView, "setFrame:", v4, v6, v8, v10);
}

- (void)_layoutDateTimeViewClippingView
{
  if (self->_dateTimeClippingView && self->_dateView)
  {
    [(CSCoverSheetView *)self _overlayClippingFrame];
    -[UIView setFrame:](self->_dateTimeClippingView, "setFrame:");
    dateTimeClippingView = self->_dateTimeClippingView;
    uint64_t v4 = [(CSCoverSheetView *)self clipsToBounds];
    [(UIView *)dateTimeClippingView setClipsToBounds:v4];
  }
}

- (void)_layoutWallpaperEffectView
{
  if (self->_wallpaperEffectView)
  {
    if ([(CSCoverSheetView *)self _maglevActive])
    {
      [(CSCoverSheetView *)self bounds];
      CGFloat v4 = v3;
      CGFloat v6 = v5;
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      wallpaperEffectView = self->_wallpaperEffectView;
      [(CSCoverSheetView *)self _wallpaperOrientationEnforcingBounds];
      -[CSWallpaperView setBounds:](wallpaperEffectView, "setBounds:");
      double v12 = self->_wallpaperEffectView;
      v19.origin.double x = v4;
      v19.origin.double y = v6;
      v19.size.width = v8;
      v19.size.height = v10;
      double MidX = CGRectGetMidX(v19);
      v20.origin.double x = v4;
      v20.origin.double y = v6;
      v20.size.width = v8;
      v20.size.height = v10;
      -[CSWallpaperView setCenter:](v12, "setCenter:", MidX, CGRectGetMidY(v20));
      CGFloat v14 = self->_wallpaperEffectView;
      [(CSCoverSheetView *)self _portraitEnforcingTransform];
      [(CSWallpaperView *)v14 setTransform:v17];
    }
    else
    {
      double v15 = self->_wallpaperEffectView;
      id v16 = [(CSCoverSheetView *)self scrollView];
      [v16 size];
      BSRectWithSize();
      -[CSWallpaperView setFrame:](v15, "setFrame:");
    }
  }
}

- (void)_layoutTintingView
{
  if (self->_tintingView)
  {
    double v3 = [(CSCoverSheetView *)self mainPageView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = [(CSCoverSheetView *)self mainPageView];
    -[CSCoverSheetView convertRect:fromView:](self, "convertRect:fromView:", v12, v5, v7, v9, v11);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    tintingView = self->_tintingView;
    -[UIView setFrame:](tintingView, "setFrame:", v14, v16, v18, v20);
  }
}

- (void)_layoutDateView
{
  double v30 = 0.0;
  int64_t dateViewPageAlignment = self->_dateViewPageAlignment;
  [(SBFPagedScrollView *)self->_scrollView unclippedPageRelativeScrollOffset];
  -[CSCoverSheetView _dateViewFrameForPageAlignment:pageRelativeScrollOffset:outAlignmentPercent:](self, "_dateViewFrameForPageAlignment:pageRelativeScrollOffset:outAlignmentPercent:", dateViewPageAlignment, &v30);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  dateView = self->_dateView;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v29[0] = *MEMORY[0x1E4F1DAB8];
  v29[1] = v13;
  v29[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(SBFLockScreenDateView *)dateView setTransform:v29];
  dateEffectView = self->_dateEffectView;
  if (dateEffectView)
  {
    -[UIVisualEffectView setFrame:](dateEffectView, "setFrame:", v5, v7, v9, v11);
    double v15 = self->_dateView;
    [(UIVisualEffectView *)self->_dateEffectView bounds];
    double v5 = v16;
    double v7 = v17;
    double v9 = v18;
    double v11 = v19;
  }
  else
  {
    double v15 = self->_dateView;
  }
  -[SBFLockScreenDateView setFrame:](v15, "setFrame:", v5, v7, v9, v11);
  double v20 = self->_dateView;
  double dateViewScale = self->_dateViewScale;
  [(CSCoverSheetView *)self center];
  -[CSCoverSheetView _transformScaling:byScale:aboutPointInSelf:](self, "_transformScaling:byScale:aboutPointInSelf:", v20, dateViewScale, v22, v23);
  [(SBFLockScreenDateView *)v20 setTransform:&v28];
  if (self->_dateViewStretch)
  {
    double y = self->_dateViewOffset.y;
    double v25 = y * -0.125;
    BOOL v26 = y <= 0.0;
    double v27 = 0.0;
    if (v26) {
      double v27 = v25;
    }
    [(SBFLockScreenDateView *)self->_dateView setDateToTimeStretch:v27];
  }
  [(SBFLockScreenDateView *)self->_dateView setAlignmentPercent:v30];
  [(SBFLockScreenDateView *)self->_dateView layoutIfNeeded];
}

- (CGAffineTransform)_transformScaling:(SEL)a3 byScale:(id)a4 aboutPointInSelf:(double)a5
{
  id v7 = a4;
  double v8 = [v7 superview];
  [v7 center];
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v8, "convertPoint:toView:", self, v10, v12);

  return (CGAffineTransform *)SBFTransformForScalingAboutPointInSuperview();
}

- (CGRect)_dateViewFrameForPageAlignment:(int64_t)a3 pageRelativeScrollOffset:(double)a4 outAlignmentPercent:(double *)a5
{
  double y = self->_dateViewOffset.y;
  double v10 = -y;
  if (self->_dateViewStretch && BSFloatLessThanFloat()) {
    double v10 = y * -0.4;
  }
  unint64_t v11 = [(CSCoverSheetView *)self _indexOfMainPage];
  int64_t dateViewPageAlignment = self->_dateViewPageAlignment;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutStrategy);
  double v14 = WeakRetained;
  uint64_t v15 = 0;
  if (!self->_forceDateViewCentered)
  {
    if (dateViewPageAlignment == 0x7FFFFFFFFFFFFFFFLL) {
      double v16 = a4 - (double)v11;
    }
    else {
      double v16 = (double)a3;
    }
    double v17 = [WeakRetained persistentLayout];
    [v17 timeLabelOffsetForScrollPercent:v16];
    uint64_t v15 = v18;
  }
  char v19 = _os_feature_enabled_impl();
  [(CSCoverSheetView *)self bounds];
  CGFloat v24 = v20;
  CGFloat v25 = v21;
  CGFloat v26 = v22;
  CGFloat v27 = v23;
  if ((v19 & 1) == 0)
  {
    objc_msgSend(v14, "suggestedFrameForDateTimeViewInScreenCoordinates:forceCenteredX:", self->_forceDateViewCentered, v20, v21, v22, v23);
    CGFloat v24 = v28;
    CGFloat v25 = v29;
    CGFloat v26 = v30;
    CGFloat v27 = v31;
  }
  [(UIView *)self->_dateTimeClippingView origin];
  CGFloat v33 = v10 - v32;
  v46.origin.double x = v24;
  v46.origin.double y = v25;
  v46.size.width = v26;
  v46.size.height = v27;
  CGRectOffset(v46, 0.0, v33);
  if (a5) {
    *(void *)a5 = v15;
  }
  SBFMainScreenScale();
  BSRectRoundForScale();
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;

  double v42 = v35;
  double v43 = v37;
  double v44 = v39;
  double v45 = v41;
  result.size.height = v45;
  result.size.width = v44;
  result.origin.double y = v43;
  result.origin.double x = v42;
  return result;
}

- (void)_layoutSidebarComplicationContainerView
{
  sidebarComplicationContainerView = self->_sidebarComplicationContainerView;
  if (sidebarComplicationContainerView)
  {
    double v4 = (objc_class *)MEMORY[0x1E4F5E4D0];
    double v5 = sidebarComplicationContainerView;
    id v6 = (id)[[v4 alloc] initWithTraitEnvironment:self];
    [(CSCoverSheetView *)self bounds];
    objc_msgSend(v6, "frameForElements:withBoundingRect:", 16);
    -[UIView setFrame:](v5, "setFrame:");
  }
}

- (void)_layoutFakeStatusBar
{
  double v3 = self->_fakeStatusBar;
  double v4 = v3;
  if (v3)
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v18.a = *MEMORY[0x1E4F1DAB8];
    long long v15 = *(_OWORD *)&v18.a;
    *(_OWORD *)&v18.c = v14;
    *(_OWORD *)&v18.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    long long v13 = *(_OWORD *)&v18.tx;
    [(UIView *)v3 setTransform:&v18];
    [(CSCoverSheetView *)self bounds];
    double v6 = v5;
    [(UIView *)v4 frame];
    -[UIView setFrame:](v4, "setFrame:", 0.0, 0.0, v6, CGRectGetHeight(v19));
    fakeStatusBarWrapperView = self->_fakeStatusBarWrapperView;
    *(_OWORD *)&v18.a = v15;
    *(_OWORD *)&v18.c = v14;
    *(_OWORD *)&v18.tdouble x = v13;
    [(CSPropertyAnimatingTouchPassThroughView *)fakeStatusBarWrapperView setTransform:&v18];
    double v8 = self->_fakeStatusBarWrapperView;
    [(CSCoverSheetView *)self bounds];
    -[CSPropertyAnimatingTouchPassThroughView setBounds:](v8, "setBounds:");
    double v9 = self->_fakeStatusBarWrapperView;
    [(CSCoverSheetView *)self bounds];
    BSRectGetCenter();
    -[CSPropertyAnimatingTouchPassThroughView setCenter:](v9, "setCenter:");
    double v10 = [(CSPropertyAnimatingTouchPassThroughView *)self->_fakeStatusBarWrapperView superview];

    if (v10 == self)
    {
      memset(&v18, 0, sizeof(v18));
      if (BSPointEqualToPoint())
      {
        *(_OWORD *)&v18.a = v15;
        *(_OWORD *)&v18.c = v14;
        *(_OWORD *)&v18.tdouble x = v13;
      }
      else
      {
        CGAffineTransformMakeTranslation(&v18, self->_foregroundViewPositionOffset.x, self->_foregroundViewPositionOffset.y);
      }
      unint64_t v11 = self->_fakeStatusBarWrapperView;
      double fakeStatusBarScale = self->_fakeStatusBarScale;
      CGAffineTransform v16 = v18;
      CGAffineTransformScale(&v17, &v16, fakeStatusBarScale, fakeStatusBarScale);
      [(CSPropertyAnimatingTouchPassThroughView *)v11 setTransform:&v17];
    }
    [(UIView *)v4 layoutIfNeeded];
  }
}

- (void)_layoutStatusBarBackgroundView
{
  [(SBFPagedScrollView *)self->_scrollView unclippedPageRelativeScrollOffset];
  double v4 = v3;
  unint64_t v5 = [(CSCoverSheetView *)self _indexOfMainPage];
  double v6 = 0.0;
  if (self->_statusBarBackgroundPageAlignment != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v7 = (double)v5;
    [(CSCoverSheetView *)self bounds];
    double v6 = CGRectGetWidth(v24) * (v7 - v4 + (double)self->_statusBarBackgroundPageAlignment);
  }
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    double v8 = -v6;
  }
  else {
    double v8 = v6;
  }
  [(CSCoverSheetView *)self bounds];
  double v10 = v9;
  [(UIView *)self->_statusBarBackgroundView intrinsicContentSize];
  double v12 = v11;
  long long v13 = [(UIView *)self->_statusBarBackgroundView superview];
  -[CSCoverSheetView convertRect:toView:](self, "convertRect:toView:", v13, v8, 0.0, v10, v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  statusBarBackgroundView = self->_statusBarBackgroundView;

  -[UIView setFrame:](statusBarBackgroundView, "setFrame:", v15, v17, v19, v21);
}

- (void)_layoutAuthIndicator
{
  [(CSCoverSheetView *)self frame];
  double Width = CGRectGetWidth(v6);
  authIndicator = self->_authIndicator;

  -[UIView setFrame:](authIndicator, "setFrame:", 0.0, 0.0, Width, 2.0);
}

- (void)_layoutBottomPage
{
  id v5 = [(CSCoverSheetView *)self bottomPage];
  if (v5)
  {
    [(CSCoverSheetView *)self frame];
    double Height = CGRectGetHeight(v7);
    [(CSCoverSheetView *)self frame];
    double Width = CGRectGetWidth(v8);
    [(CSCoverSheetView *)self frame];
    objc_msgSend(v5, "setFrame:", 0.0, Height, Width, CGRectGetHeight(v9));
  }
}

- (void)_layoutContentView
{
  [(CSCoverSheetView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UIView setBounds:](self->_contentView, "setBounds:");
  contentView = self->_contentView;
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  double MidX = CGRectGetMidX(v25);
  v26.origin.double x = v4;
  v26.origin.double y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  -[UIView setCenter:](contentView, "setCenter:", MidX, CGRectGetMidY(v26));
  int v13 = BSPointEqualToPoint();
  double contentViewScale = self->_contentViewScale;
  if (v13) {
    BOOL v15 = contentViewScale == 1.0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    double v18 = self->_contentView;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v24.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v24.c = v19;
    *(_OWORD *)&v24.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v17 = &v24;
  }
  else
  {
    memset(&v24, 0, sizeof(v24));
    CGAffineTransformMakeTranslation(&v24, self->_contentViewOffset.x, self->_contentViewOffset.y);
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeScale(&v23, contentViewScale, contentViewScale);
    double v16 = self->_contentView;
    CGAffineTransform t1 = v23;
    CGAffineTransform v20 = v24;
    CGAffineTransformConcat(&v22, &t1, &v20);
    double v17 = &v22;
    double v18 = v16;
  }
  [(UIView *)v18 setTransform:v17];
}

- (void)_layoutProudLockView
{
  if (![(UIView *)self->_proudLockContainerView isHidden])
  {
    [(CSCoverSheetView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [MEMORY[0x1E4FA5F68] proudLockCenterFromTopOfScreen];
    double v12 = v11;
    v29.origin.double x = v4;
    v29.origin.double y = v6;
    v29.size.width = v8;
    v29.size.height = v10;
    double Width = CGRectGetWidth(v29);
    v30.origin.double x = v4;
    v30.origin.double y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    CGFloat v14 = CGRectGetMidX(v30) + Width * -0.5;
    -[CSPropertyAnimatingTouchPassThroughView setBounds:](self->_proudLockContainerWrapperView, "setBounds:", v14, 0.0, Width, v12 + v12);
    v31.origin.double x = v4;
    v31.origin.double y = v6;
    v31.size.width = v8;
    v31.size.height = v10;
    -[CSPropertyAnimatingTouchPassThroughView setCenter:](self->_proudLockContainerWrapperView, "setCenter:", CGRectGetMidX(v31), v12);
    -[UIView setFrame:](self->_proudLockContainerView, "setFrame:", v14, 0.0, Width, v12 + v12);
    -[UIView setFrame:](self->_cameraCoveredView, "setFrame:", v4, v6, v8, v10);
    if (BSPointEqualToPoint() && self->_proudLockIconViewScale == 1.0)
    {
      proudLockContainerWrapperView = self->_proudLockContainerWrapperView;
      long long v22 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v28.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v28.c = v22;
      *(_OWORD *)&v28.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      CGAffineTransform v20 = &v28;
    }
    else
    {
      memset(&v28, 0, sizeof(v28));
      CGAffineTransformMakeTranslation(&v28, self->_proudLockIconViewOffset.x, self->_proudLockIconViewOffset.y);
      v32.origin.double x = v4;
      v32.origin.double y = v6;
      v32.size.width = v8;
      v32.size.height = v10;
      double MidX = CGRectGetMidX(v32);
      double proudLockIconViewScale = self->_proudLockIconViewScale;
      [MEMORY[0x1E4FA5F68] proudLockScaleFactor];
      double v18 = proudLockIconViewScale / v17;
      if (v18 > 1.0) {
        double v18 = 1.0;
      }
      memset(&v27, 0, sizeof(v27));
      -[CSCoverSheetView _transformScaling:byScale:aboutPointInSelf:](self, "_transformScaling:byScale:aboutPointInSelf:", self->_proudLockContainerWrapperView, v18, MidX, v12);
      long long v19 = self->_proudLockContainerWrapperView;
      CGAffineTransform t1 = v28;
      CGAffineTransform v24 = v27;
      CGAffineTransformConcat(&v26, &t1, &v24);
      CGAffineTransform v20 = &v26;
      proudLockContainerWrapperView = v19;
    }
    [(CSPropertyAnimatingTouchPassThroughView *)proudLockContainerWrapperView setTransform:v20];
    if (self->_proudLockPrefersLowerPresentationLevel) {
      CGAffineTransform v23 = &OBJC_IVAR___CSCoverSheetView__slideableContentView;
    }
    else {
      CGAffineTransform v23 = &OBJC_IVAR___CSCoverSheetView__higherSlideableContentView;
    }
    [*(id *)((char *)&self->super.super.super.isa + *v23) addSubview:self->_proudLockContainerWrapperView];
  }
}

- (void)_layoutHigherSlideableContentView
{
  [(UIView *)self->_slideableContentView frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(UIView *)self->_higherSlideableContentView superview];
  -[CSCoverSheetView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  higherSlideableContentView = self->_higherSlideableContentView;

  -[UIView setFrame:](higherSlideableContentView, "setFrame:", v13, v15, v17, v19);
}

- (void)_layoutTeachableMomentsContainerView
{
  double v3 = [(CSCoverSheetView *)self teachableMomentsContainerView];
  if (v3)
  {
    [(CSCoverSheetView *)self bounds];
    objc_msgSend(v3, "setBounds:");
    BSRectGetCenter();
    objc_msgSend(v3, "setCenter:");
    memset(&v6, 0, sizeof(v6));
    CGAffineTransformMakeScale(&v6, self->_controlCenterGrabberScale, self->_controlCenterGrabberScale);
    double v4 = [v3 controlCenterGrabberContainerView];
    CGAffineTransform v5 = v6;
    [v4 setTransform:&v5];
  }
}

- (void)_layoutQuickActionsView
{
  [(CSCoverSheetView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v9 = (double)[(CSCoverSheetView *)self _indexOfMainPage];
  [(SBFPagedScrollView *)self->_scrollView unclippedPageRelativeScrollOffset];
  double v11 = v9 - v10;
  [(CSCoverSheetView *)self bounds];
  double Width = CGRectGetWidth(v24);
  if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1) {
    double v13 = -(v11 * Width);
  }
  else {
    double v13 = v11 * Width;
  }
  if (BSPointEqualToPoint() && self->_quickActionsViewScale == 1.0)
  {
    quickActionsView = self->_quickActionsView;
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v23.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v23.c = v18;
    *(_OWORD *)&v23.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(CSQuickActionsView *)quickActionsView setTransform:&v23];
    -[CSQuickActionsView setFrame:](self->_quickActionsView, "setFrame:", v13, v4, v6, v8);
  }
  else
  {
    double v14 = self->_quickActionsView;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v23.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v23.c = v15;
    *(_OWORD *)&v23.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(CSQuickActionsView *)v14 setTransform:&v23];
    -[CSQuickActionsView setFrame:](self->_quickActionsView, "setFrame:", v13, v4, v6, v8);
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeTranslation(&v23, self->_quickActionsViewOffset.x, self->_quickActionsViewOffset.y);
    memset(&v22, 0, sizeof(v22));
    CGAffineTransformMakeScale(&v22, self->_quickActionsViewScale, self->_quickActionsViewScale);
    double v16 = self->_quickActionsView;
    CGAffineTransform t1 = v22;
    CGAffineTransform v19 = v23;
    CGAffineTransformConcat(&v21, &t1, &v19);
    [(CSQuickActionsView *)v16 setTransform:&v21];
  }
}

- (void)_layoutStatusBarLegibilityView
{
  [(CSCoverSheetView *)self bounds];
  statusBarLegibilityView = self->_statusBarLegibilityView;

  -[SBFStatusBarLegibilityView setFrame:](statusBarLegibilityView, "setFrame:");
}

- (BOOL)_maglevActive
{
  uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return 0;
  }

  return _os_feature_enabled_impl();
}

- (CGRect)_wallpaperOrientationEnforcingBounds
{
  [(CSCoverSheetView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  if ([(CSCoverSheetView *)self _forcingPortraitForWallpaperContent])
  {
    v17.origin.double x = v4;
    v17.origin.double y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    double Height = CGRectGetHeight(v17);
    v18.origin.double x = v4;
    v18.origin.double y = v6;
    v18.size.width = v8;
    v18.size.height = v10;
    double Width = CGRectGetWidth(v18);
    if (Height < Width)
    {
      CGFloat v6 = 0.0;
      CGFloat v10 = Width;
      CGFloat v8 = Height;
      CGFloat v4 = 0.0;
    }
  }
  double v13 = v4;
  double v14 = v6;
  double v15 = v8;
  double v16 = v10;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGAffineTransform)_portraitEnforcingTransform
{
  CGRect result = (CGAffineTransform *)[(CSCoverSheetView *)self _forcingPortraitForWallpaperContent];
  if (result)
  {
    CGFloat v6 = [(CSCoverSheetView *)self window];
    uint64_t v7 = [v6 interfaceOrientation];

    switch(v7)
    {
      case 1:
        double v8 = 0.0;
        break;
      case 3:
        double v8 = 1.57079633;
        break;
      case 4:
        double v8 = -1.57079633;
        break;
      default:
        double v8 = 3.14159265;
        if (v7 != 2) {
          double v8 = 0.0;
        }
        break;
    }
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeRotation(&v23, -v8);
    CGAffineTransform t1 = v23;
    memset(&v22, 0, sizeof(v22));
    UIIntegralTransform();
    double v12 = [(CSCoverSheetView *)self window];
    int v13 = [v12 isRotating];

    if (v13)
    {
      double v14 = [(CSCoverSheetView *)self window];
      uint64_t v15 = [v14 _fromWindowOrientation];

      double v16 = [(CSCoverSheetView *)self window];
      uint64_t v17 = [v16 _toWindowOrientation];

      if ((unint64_t)(v15 - 3) < 2)
      {
        uint64_t v18 = -3;
LABEL_16:
        if (v15 != v17 && (unint64_t)(v17 + v18) <= 1)
        {
          v20.tdouble x = 0.0;
          v20.tdouble y = 0.0;
          CGAffineTransform t1 = v22;
          *(_OWORD *)&v20.a = xmmword_1D8505F10;
          *(_OWORD *)&v20.c = xmmword_1D8505F20;
          return CGAffineTransformConcat(retstr, &t1, &v20);
        }
        goto LABEL_19;
      }
      if ((unint64_t)(v15 - 1) <= 1)
      {
        uint64_t v18 = -1;
        goto LABEL_16;
      }
    }
LABEL_19:
    long long v19 = *(_OWORD *)&v22.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v22.a;
    *(_OWORD *)&retstr->c = v19;
    long long v11 = *(_OWORD *)&v22.tx;
    goto LABEL_20;
  }
  uint64_t v9 = MEMORY[0x1E4F1DAB8];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v10;
  long long v11 = *(_OWORD *)(v9 + 32);
LABEL_20:
  *(_OWORD *)&retstr->tdouble x = v11;
  return result;
}

- (void)_layoutWallpaperFloatingLayerContainerView
{
  [(CSCoverSheetView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if ([(CSCoverSheetView *)self _maglevActive])
  {
    [(CSCoverSheetView *)self _wallpaperOrientationEnforcingBounds];
    -[UIView setBounds:](self->_wallpaperFloatingLayerContainerView, "setBounds:");
    wallpaperFloatingLayerContainerView = self->_wallpaperFloatingLayerContainerView;
    v35.origin.double x = v4;
    v35.origin.double y = v6;
    v35.size.width = v8;
    v35.size.height = v10;
    double MidX = CGRectGetMidX(v35);
    v36.origin.double x = v4;
    v36.origin.double y = v6;
    v36.size.width = v8;
    v36.size.height = v10;
    -[UIView setCenter:](wallpaperFloatingLayerContainerView, "setCenter:", MidX, CGRectGetMidY(v36));
    long long v13 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v34.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v34.c = v13;
    *(_OWORD *)&v34.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    int v14 = BSPointEqualToPoint();
    double wallpaperFloatingLayerContainerViewScale = self->_wallpaperFloatingLayerContainerViewScale;
    if (v14) {
      BOOL v16 = wallpaperFloatingLayerContainerViewScale == 1.0;
    }
    else {
      BOOL v16 = 0;
    }
    if (!v16)
    {
      memset(&v33, 0, sizeof(v33));
      CGAffineTransformMakeTranslation(&v33, self->_wallpaperFloatingLayerContainerViewOffset.x, self->_wallpaperFloatingLayerContainerViewOffset.y);
      memset(&v32, 0, sizeof(v32));
      CGAffineTransformMakeScale(&v32, wallpaperFloatingLayerContainerViewScale, wallpaperFloatingLayerContainerViewScale);
      CGAffineTransform t1 = v32;
      CGAffineTransform t2 = v33;
      CGAffineTransformConcat(&v34, &t1, &t2);
    }
    uint64_t v17 = self->_wallpaperFloatingLayerContainerView;
    [(CSCoverSheetView *)self _portraitEnforcingTransform];
    CGAffineTransform v33 = v34;
    CGAffineTransformConcat(&v29, &v33, &v28);
    uint64_t v18 = &v29;
    long long v19 = v17;
  }
  else
  {
    -[UIView setBounds:](self->_wallpaperFloatingLayerContainerView, "setBounds:", v4, v6, v8, v10);
    CGAffineTransform v20 = self->_wallpaperFloatingLayerContainerView;
    v37.origin.double x = v4;
    v37.origin.double y = v6;
    v37.size.width = v8;
    v37.size.height = v10;
    double v21 = CGRectGetMidX(v37);
    v38.origin.double x = v4;
    v38.origin.double y = v6;
    v38.size.width = v8;
    v38.size.height = v10;
    -[UIView setCenter:](v20, "setCenter:", v21, CGRectGetMidY(v38));
    int v22 = BSPointEqualToPoint();
    double v23 = self->_wallpaperFloatingLayerContainerViewScale;
    if (v22) {
      BOOL v24 = v23 == 1.0;
    }
    else {
      BOOL v24 = 0;
    }
    if (v24)
    {
      long long v19 = self->_wallpaperFloatingLayerContainerView;
      long long v26 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v34.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v34.c = v26;
      *(_OWORD *)&v34.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      uint64_t v18 = &v34;
    }
    else
    {
      memset(&v34, 0, sizeof(v34));
      CGAffineTransformMakeTranslation(&v34, self->_wallpaperFloatingLayerContainerViewOffset.x, self->_wallpaperFloatingLayerContainerViewOffset.y);
      memset(&v33, 0, sizeof(v33));
      CGAffineTransformMakeScale(&v33, v23, v23);
      CGRect v25 = self->_wallpaperFloatingLayerContainerView;
      CGAffineTransform v32 = v33;
      CGAffineTransform t1 = v34;
      CGAffineTransformConcat(&v27, &v32, &t1);
      uint64_t v18 = &v27;
      long long v19 = v25;
    }
  }
  [(UIView *)v19 setTransform:v18];
}

- (void)_layoutBackgroundContentView
{
  [(CSCoverSheetView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[CSBackgroundContentView setBounds:](self->_backgroundContentView, "setBounds:");
  backgroundContentView = self->_backgroundContentView;
  v25.origin.double x = v4;
  v25.origin.double y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  double MidX = CGRectGetMidX(v25);
  v26.origin.double x = v4;
  v26.origin.double y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  -[CSBackgroundContentView setCenter:](backgroundContentView, "setCenter:", MidX, CGRectGetMidY(v26));
  int v13 = BSPointEqualToPoint();
  double backgroundContentViewScale = self->_backgroundContentViewScale;
  if (v13) {
    BOOL v15 = backgroundContentViewScale == 1.0;
  }
  else {
    BOOL v15 = 0;
  }
  if (v15)
  {
    uint64_t v18 = self->_backgroundContentView;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v24.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v24.c = v19;
    *(_OWORD *)&v24.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v17 = &v24;
  }
  else
  {
    memset(&v24, 0, sizeof(v24));
    CGAffineTransformMakeTranslation(&v24, self->_backgroundContentViewOffset.x, self->_backgroundContentViewOffset.y);
    memset(&v23, 0, sizeof(v23));
    CGAffineTransformMakeScale(&v23, backgroundContentViewScale, backgroundContentViewScale);
    BOOL v16 = self->_backgroundContentView;
    CGAffineTransform t1 = v23;
    CGAffineTransform v20 = v24;
    CGAffineTransformConcat(&v22, &t1, &v20);
    uint64_t v17 = &v22;
    uint64_t v18 = v16;
  }
  [(CSBackgroundContentView *)v18 setTransform:v17];
}

- (void)_orderSubviews
{
  if (self->_fixedFooterView) {
    -[UIView bringSubviewToFront:](self->_slideableContentView, "bringSubviewToFront:");
  }
  if (!self->_dateTimePresentationLevel) {
    [(UIView *)self->_slideableContentView sendSubviewToBack:self->_dateTimeClippingView];
  }
  if (!self->_backgroundContentPresentationLevel) {
    [(UIView *)self->_slideableContentView insertSubview:self->_backgroundContentView atIndex:0];
  }
  if (!self->_wallpaperPresentationLevel) {
    [(UIView *)self->_slideableContentView insertSubview:self->_wallpaperEffectView atIndex:0];
  }
  if (!self->_wallpaperFloatingLayerPresentationLevel) {
    [(UIView *)self->_slideableContentView insertSubview:self->_wallpaperFloatingLayerContainerView aboveSubview:self->_dateTimeClippingView];
  }
  [(CSCoverSheetView *)self sendSubviewToBack:self->_statusBarLegibilityView];
  if (self->_modalPresentationLevel == 1) {
    [(CSCoverSheetView *)self sendSubviewToBack:self->_modalPresentationView];
  }
  if (self->_wallpaperFloatingLayerPresentationLevel == 1)
  {
    double v3 = [(UIView *)self->_wallpaperFloatingLayerContainerView superview];

    wallpaperFloatingLayerContainerView = self->_wallpaperFloatingLayerContainerView;
    BOOL v5 = v3 != self;
    if (v3 == self)
    {
      [(CSCoverSheetView *)self sendSubviewToBack:wallpaperFloatingLayerContainerView];
      CGFloat v6 = [(UIView *)self->_dateTimeClippingView superview];
      [(CSCoverSheetView *)self sendSubviewToBack:v6];
    }
    else
    {
      CGFloat v6 = [(UIView *)self->_dateTimeClippingView superview];
      [(CSCoverSheetView *)self insertSubview:wallpaperFloatingLayerContainerView aboveSubview:v6];
    }
  }
  else
  {
    BOOL v5 = 0;
  }
  if (self->_backgroundContentPresentationLevel == 1)
  {
    double v7 = [(CSBackgroundContentView *)self->_backgroundContentView superview];

    backgroundContentView = self->_backgroundContentView;
    if (v7 == self)
    {
      [(CSCoverSheetView *)self sendSubviewToBack:backgroundContentView];
    }
    else
    {
      [(CSCoverSheetView *)self insertSubview:backgroundContentView atIndex:0];
      BOOL v5 = 1;
    }
  }
  if (self->_wallpaperPresentationLevel == 1)
  {
    double v9 = [(CSWallpaperView *)self->_wallpaperEffectView superview];

    wallpaperEffectView = self->_wallpaperEffectView;
    if (v9 != self)
    {
      [(CSCoverSheetView *)self insertSubview:wallpaperEffectView atIndex:0];
      backgroundContainerView = self->_backgroundContainerView;
      [(CSCoverSheetView *)self sendSubviewToBack:backgroundContainerView];
      return;
    }
    [(CSCoverSheetView *)self sendSubviewToBack:wallpaperEffectView];
  }
  [(CSCoverSheetView *)self sendSubviewToBack:self->_backgroundContainerView];
  if (v5) {
    return;
  }
  [(CSCoverSheetView *)self bringSubviewToFront:self->_quickActionsView];
  [(CSCoverSheetView *)self bringSubviewToFront:self->_tintingView];
  if (!self->_modalPresentationLevel) {
    [(CSCoverSheetView *)self bringSubviewToFront:self->_modalPresentationView];
  }
  if (self->_fakeStatusBar && self->_fakeStatusBarLevel == 1)
  {
    id v20 = [(CSCoverSheetView *)self referenceViewForBelowPresentationContext];
    double v12 = [v20 superview];
    [v12 insertSubview:self->_higherSlideableContentView aboveSubview:v20];
    [v12 insertSubview:self->_fakeStatusBarWrapperView belowSubview:self->_higherSlideableContentView];
    [v12 insertSubview:self->_statusBarBackgroundView belowSubview:self->_fakeStatusBarWrapperView];

LABEL_45:

    return;
  }
  int v13 = [(UIView *)self->_statusBarBackgroundView superview];

  statusBarBackgroundView = self->_statusBarBackgroundView;
  if (v13 == self) {
    [(CSCoverSheetView *)self bringSubviewToFront:statusBarBackgroundView];
  }
  else {
    [(CSCoverSheetView *)self addSubview:statusBarBackgroundView];
  }
  BOOL v15 = [(UIView *)self->_higherSlideableContentView superview];

  higherSlideableContentView = self->_higherSlideableContentView;
  if (v15 == self) {
    [(CSCoverSheetView *)self bringSubviewToFront:higherSlideableContentView];
  }
  else {
    [(CSCoverSheetView *)self addSubview:higherSlideableContentView];
  }
  if (self->_fakeStatusBar && self->_fakeStatusBarLevel == 1)
  {
    id v20 = [(CSCoverSheetView *)self subviews];
    uint64_t v17 = [v20 indexOfObject:self->_fakeStatusBarWrapperView];
    if (v17 != [v20 indexOfObject:self->_slideableContentView] - 1)
    {
      [(CSCoverSheetView *)self insertSubview:self->_fakeStatusBarWrapperView belowSubview:self->_slideableContentView];
      [(CSCoverSheetView *)self insertSubview:self->_statusBarBackgroundView belowSubview:self->_fakeStatusBarWrapperView];
    }
    goto LABEL_45;
  }
  uint64_t v18 = [(CSPropertyAnimatingTouchPassThroughView *)self->_fakeStatusBarWrapperView superview];

  fakeStatusBarWrapperView = self->_fakeStatusBarWrapperView;
  if (v18 == self)
  {
    [(CSCoverSheetView *)self bringSubviewToFront:fakeStatusBarWrapperView];
  }
  else
  {
    [(CSCoverSheetView *)self addSubview:fakeStatusBarWrapperView];
  }
}

- (void)_addBackgroundContainerView
{
  id v3 = objc_alloc(MEMORY[0x1E4F4F8D0]);
  [(CSCoverSheetView *)self bounds];
  CGFloat v4 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v3, "initWithFrame:");
  backgroundContainerView = self->_backgroundContainerView;
  self->_backgroundContainerView = v4;

  [(BSUIOrientationTransformWrapperView *)self->_backgroundContainerView setContainerOrientation:1];
  [(BSUIOrientationTransformWrapperView *)self->_backgroundContainerView setContentOrientation:1];
  [(BSUIOrientationTransformWrapperView *)self->_backgroundContainerView setCounterTransformView:1];
  CGFloat v6 = self->_backgroundContainerView;

  [(CSCoverSheetView *)self insertSubview:v6 atIndex:0];
}

- (void)_addBackgroundView
{
  id v3 = objc_alloc(MEMORY[0x1E4FA7998]);
  [(CSCoverSheetView *)self bounds];
  CGFloat v4 = (SBUIBackgroundView *)objc_msgSend(v3, "initWithFrame:");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v4;

  [(SBUIBackgroundView *)self->_backgroundView setGroupName:@"CSBackgroundView"];
  backgroundContainerView = self->_backgroundContainerView;
  double v7 = self->_backgroundView;

  [(BSUIOrientationTransformWrapperView *)backgroundContainerView addContentView:v7];
}

- (void)_addSlideableContentView
{
  id v3 = objc_alloc(MEMORY[0x1E4FA6028]);
  [(CSCoverSheetView *)self bounds];
  CGFloat v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  slideableContentView = self->_slideableContentView;
  self->_slideableContentView = v4;

  [(UIView *)self->_slideableContentView setAutoresizingMask:18];
  CGFloat v6 = self->_slideableContentView;

  [(CSCoverSheetView *)self addSubview:v6];
}

- (void)_addHigherSlideableContentView
{
  id v3 = objc_alloc(MEMORY[0x1E4FA6028]);
  [(CSCoverSheetView *)self bounds];
  CGFloat v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  higherSlideableContentView = self->_higherSlideableContentView;
  self->_higherSlideableContentView = v4;

  [(UIView *)self->_higherSlideableContentView setAutoresizingMask:18];
  CGFloat v6 = self->_higherSlideableContentView;

  [(CSCoverSheetView *)self addSubview:v6];
}

- (void)_addContentView
{
}

- (void)_addContentViewWithContentView:(id)a3
{
  id v4 = a3;
  if (!self->_hasSubviewModifyingView)
  {
    id v9 = v4;
    self->_hasSubviewModifyingView = 1;
    contentView = self->_contentView;
    if (!contentView)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FA6028]);
      [(CSCoverSheetView *)self bounds];
      double v7 = (UIView *)objc_msgSend(v6, "initWithFrame:");
      CGFloat v8 = self->_contentView;
      self->_contentView = v7;

      [(UIView *)self->_contentView setAutoresizingMask:18];
      contentView = self->_contentView;
    }
    [(CSCoverSheetView *)self addSubview:contentView];
    [(UIView *)self->_contentView addSubview:v9];
    id v4 = v9;
  }
}

- (void)_removeContentView
{
  [(UIView *)self->_contentView removeFromSuperview];
  [(UIView *)self->_slideableContentView addSubview:self->_scrollView];
  contentView = self->_contentView;
  self->_contentView = 0;

  self->_hasSubviewModifyingView = 0;
}

- (void)_addScrollView
{
  id v3 = [CSScrollView alloc];
  [(CSCoverSheetView *)self bounds];
  BOOL v5 = -[SBFPagedScrollView initWithFrame:](v3, "initWithFrame:");
  [(BSUIScrollView *)v5 setDelegate:self];
  id v4 = [(CSScrollView *)v5 panGestureRecognizer];
  [v4 setName:@"CoverSheetPagedPanGestureRecognizer"];

  [(CSScrollView *)v5 setAutoresizingMask:18];
  [(CSScrollView *)v5 setContentInsetAdjustmentBehavior:2];
  [(CSScrollView *)v5 setAllowsKeyboardScrolling:0];
  [(UIView *)self->_slideableContentView addSubview:v5];
  [(CSCoverSheetView *)self setScrollView:v5];
}

- (void)_addDateTimeContainer
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  id v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  dateTimeClippingView = self->_dateTimeClippingView;
  self->_dateTimeClippingView = v4;

  [(UIView *)self->_dateTimeClippingView setUserInteractionEnabled:0];
  slideableContentView = self->_slideableContentView;
  double v7 = self->_dateTimeClippingView;

  [(UIView *)slideableContentView addSubview:v7];
}

- (void)_addWallpaperFloatingLayerContainerView
{
  id v3 = objc_alloc(MEMORY[0x1E4FA6028]);
  [(CSCoverSheetView *)self bounds];
  id v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  wallpaperFloatingLayerContainerView = self->_wallpaperFloatingLayerContainerView;
  self->_wallpaperFloatingLayerContainerView = v4;

  [(UIView *)self->_wallpaperFloatingLayerContainerView setAccessibilityIgnoresInvertColors:1];
  slideableContentView = self->_slideableContentView;
  double v7 = self->_wallpaperFloatingLayerContainerView;

  [(UIView *)slideableContentView addSubview:v7];
}

- (void)_addAuthIndicator
{
  id v3 = [(CSCoverSheetView *)self _lockScreenDefaults];
  int v4 = [v3 showAuthenticationEngineeringUI];

  if (v4)
  {
    BOOL v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    authIndicator = self->_authIndicator;
    self->_authIndicator = v5;

    [(UIView *)self->_authIndicator setUserInteractionEnabled:0];
    [(UIView *)self->_slideableContentView addSubview:self->_authIndicator];
    [(CSCoverSheetView *)self setNeedsLayout];
    [(CSCoverSheetView *)self updateUIForAuthenticated:0];
  }
}

- (void)_addTintingView
{
  id v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FA6028]);
  tintingView = self->_tintingView;
  self->_tintingView = v3;

  BOOL v5 = self->_tintingView;
  id v6 = [MEMORY[0x1E4F428B8] blackColor];
  [(UIView *)v5 setBackgroundColor:v6];

  [(UIView *)self->_tintingView setHidden:1];
  double v7 = self->_tintingView;

  [(CSCoverSheetView *)self addSubview:v7];
}

- (void)_addStatusBarLegibilityView
{
  id v3 = (SBFStatusBarLegibilityView *)objc_alloc_init(MEMORY[0x1E4FA5FF8]);
  statusBarLegibilityView = self->_statusBarLegibilityView;
  self->_statusBarLegibilityView = v3;

  BOOL v5 = self->_statusBarLegibilityView;

  [(CSCoverSheetView *)self addSubview:v5];
}

- ($281FBD1A060D4C63F485A737B1C0EEA3)_currentTransitionContext
{
  long long v5 = 0uLL;
  long long v15 = 0u;
  long long v16 = 0u;
  scrollView = self->_scrollView;
  if (scrollView
    && ([(SBFPagedScrollView *)scrollView currentScrollInterval],
        long long v5 = 0uLL,
        (double v7 = self->_scrollView) != 0))
  {
    [(SBFPagedScrollView *)v7 currentScrollContext];
    uint64_t v8 = v12;
    id v9 = self->_scrollView;
  }
  else
  {
    id v9 = 0;
    uint64_t v8 = 0;
    uint64_t v14 = 0;
    long long v12 = v5;
    long long v13 = v5;
  }
  [(SBFPagedScrollView *)v9 pageRelativeScrollOffset];
  v11[0] = v15;
  v11[1] = v16;
  CSCoverSheetTransitionContextMake((uint64_t)v11, v8, (uint64_t)retstr);
  return result;
}

- ($281FBD1A060D4C63F485A737B1C0EEA3)_completedTransitionContextForPreviousTransitionContext:(SEL)a3 newTransitionContext:(id *)a4
{
  long long v5 = *(_OWORD *)&a4->var1.var1.var1;
  long long v6 = *(_OWORD *)&a4->var0;
  *(_OWORD *)&retstr->var1.var0.var1 = *(_OWORD *)&a4->var1.var0.var1;
  *(_OWORD *)&retstr->var1.var1.var1 = v5;
  *(_OWORD *)&retstr->var0 = v6;
  retstr->var1.var1 = a5->var1.var0;
  retstr->var0 = a4->var1.var1.var0;
  return self;
}

- (unint64_t)_indexOfMainPage
{
  id v3 = [(CSCoverSheetView *)self scrollView];
  int v4 = [v3 pageViews];
  long long v5 = [(CSCoverSheetView *)self mainPageView];
  unint64_t v6 = [v4 indexOfObject:v5];

  return v6;
}

- (void)_updateLegibility
{
  [(SBFLockScreenDateView *)self->_dateView setLegibilitySettings:self->_legibilitySettings];
  statusBarLegibilityView = self->_statusBarLegibilityView;
  legibilitySettings = self->_legibilitySettings;

  [(SBFStatusBarLegibilityView *)statusBarLegibilityView setLegibilitySettings:legibilitySettings];
}

- (void)_setupAllGesturesOnScrollView:(BOOL)a3
{
  BOOL v3 = a3;
  -[CSCoverSheetView _setupWallpaperGestureOnScrollView:](self, "_setupWallpaperGestureOnScrollView:");
  [(CSCoverSheetView *)self _setupBackgroundContentGestureOnScrollView:v3];
  [(CSCoverSheetView *)self _setupQuickNoteGestureOnScrollView:v3];
  [(CSCoverSheetView *)self _setupDateViewGestureOnScrollView:v3];

  [(CSCoverSheetView *)self _setupComplicationGestureOnScrollView:v3];
}

- (void)_setupWallpaperGestureOnScrollView:(BOOL)a3
{
  if (self->_wallpaperGestureRecognizer)
  {
    BOOL v3 = a3;
    long long v5 = SBLogDashBoard();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_INFO, "DashBoardView installed wallpaper gesture recognizer", buf, 2u);
      }

      [(SBFPagedScrollView *)self->_scrollView addGestureRecognizer:self->_wallpaperGestureRecognizer];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)double v7 = 0;
        _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_INFO, "DashBoardView removed wallpaper gesture recognizer", v7, 2u);
      }

      [(SBFPagedScrollView *)self->_scrollView removeGestureRecognizer:self->_wallpaperGestureRecognizer];
    }
  }
}

- (void)_setupBackgroundContentGestureOnScrollView:(BOOL)a3
{
  if (self->_backgroundContentGestureRecognizer)
  {
    BOOL v3 = a3;
    long long v5 = SBLogDashBoard();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView installed background content gesture recognizer", buf, 2u);
      }

      [(SBFPagedScrollView *)self->_scrollView addGestureRecognizer:self->_backgroundContentGestureRecognizer];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)double v7 = 0;
        _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView removed background content gesture recognizer", v7, 2u);
      }

      [(SBFPagedScrollView *)self->_scrollView removeGestureRecognizer:self->_backgroundContentGestureRecognizer];
    }
  }
}

- (void)_setupQuickNoteGestureOnScrollView:(BOOL)a3
{
  if (self->_quickNoteGestureRecognizer)
  {
    BOOL v3 = a3;
    long long v5 = SBLogDashBoard();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView installed quicknote gesture recognizer", buf, 2u);
      }

      [(SBFPagedScrollView *)self->_scrollView addGestureRecognizer:self->_quickNoteGestureRecognizer];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)double v7 = 0;
        _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView removed quicknote gesture recognizer", v7, 2u);
      }

      [(SBFPagedScrollView *)self->_scrollView removeGestureRecognizer:self->_quickNoteGestureRecognizer];
    }
  }
}

- (void)_setupDateViewGestureOnScrollView:(BOOL)a3
{
  if (self->_dateViewGestureRecognizer)
  {
    BOOL v3 = a3;
    long long v5 = SBLogDashBoard();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView installed dateview gesture recognizer", buf, 2u);
      }

      [(SBFPagedScrollView *)self->_scrollView addGestureRecognizer:self->_dateViewGestureRecognizer];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)double v7 = 0;
        _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView removed dateview gesture recognizer", v7, 2u);
      }

      [(SBFPagedScrollView *)self->_scrollView removeGestureRecognizer:self->_dateViewGestureRecognizer];
    }
  }
}

- (void)_setupComplicationGestureOnScrollView:(BOOL)a3
{
  if (self->_complicationGestureRecognizer)
  {
    BOOL v3 = a3;
    long long v5 = SBLogDashBoard();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView installed complication gesture recognizer", buf, 2u);
      }

      [(SBFPagedScrollView *)self->_scrollView addGestureRecognizer:self->_complicationGestureRecognizer];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)double v7 = 0;
        _os_log_impl(&dword_1D839D000, v5, OS_LOG_TYPE_DEFAULT, "DashBoardView removed complication gesture recognizer", v7, 2u);
      }

      [(SBFPagedScrollView *)self->_scrollView removeGestureRecognizer:self->_complicationGestureRecognizer];
    }
  }
}

- (void)_prepareBlursForView:(id)a3 withHardEdges:(BOOL)a4
{
  BOOL v4 = a4;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = v5;
  if (v5)
  {
    double v7 = [v5 layer];
    uint64_t v8 = [v7 valueForKeyPath:@"filters.coverSheetBlurContents"];
    if (!v8)
    {
      id v9 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A0D0]];
      CGFloat v10 = v9;
      if (v4) {
        [v9 setValue:MEMORY[0x1E4F1CC38] forKey:@"inputHardEdges"];
      }
      [v10 setName:@"coverSheetBlurContents"];
      long long v11 = [v7 filters];

      if (v11)
      {
        long long v12 = [v7 mutableArrayValueForKeyPath:@"filters"];
        [v12 addObject:v10];
      }
      else
      {
        v18[0] = v10;
        long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
        [v7 setFilters:v12];
      }
    }
    long long v13 = [v6 animatedLayerProperties];
    uint64_t v14 = (void *)[v13 mutableCopy];
    long long v15 = v14;
    if (v14) {
      id v16 = v14;
    }
    else {
      id v16 = (id)objc_opt_new();
    }
    uint64_t v17 = v16;

    [v17 addObject:@"filters.coverSheetBlurContents.inputRadius"];
    [v6 setAnimatedLayerProperties:v17];
  }
}

- (void)_updateBlurForView:(id)a3 toRadius:(double)a4
{
  id v6 = [a3 layer];
  id v5 = [NSNumber numberWithDouble:a4];
  [v6 setValue:v5 forKeyPath:@"filters.coverSheetBlurContents.inputRadius"];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_lookSettings == a3)
  {
    [(CSCoverSheetView *)self _updateDateFont];
    [(CSCoverSheetView *)self _layoutDateView];
  }
}

- (UIView)bottomPage
{
  return self->_bottomPage;
}

- (CSCoverSheetViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSCoverSheetViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSLayoutStrategy)layoutStrategy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutStrategy);

  return (CSLayoutStrategy *)WeakRetained;
}

- (void)setLayoutStrategy:(id)a3
{
}

- (SBFPagedScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (UIView)mainPageView
{
  return self->_mainPageView;
}

- (void)setMainPageView:(id)a3
{
}

- (BOOL)ignoresOverscrollOnMainPage
{
  return self->_ignoresOverscrollOnMainPage;
}

- (void)setIgnoresOverscrollOnMainPage:(BOOL)a3
{
  self->_ignoresOverscrollOnMainPage = a3;
}

- (SBFLockScreenDateView)dateView
{
  return self->_dateView;
}

- (UIView)sidebarComplicationContainerView
{
  return self->_sidebarComplicationContainerView;
}

- (CSFixedFooterView)fixedFooterView
{
  return self->_fixedFooterView;
}

- (UIView)proudLockContainerView
{
  return self->_proudLockContainerView;
}

- (UIView)cameraCoveredView
{
  return self->_cameraCoveredView;
}

- (UIView)poseidonContainerView
{
  return self->_poseidonContainerView;
}

- (CSTeachableMomentsContainerView)teachableMomentsContainerView
{
  return self->_teachableMomentsContainerView;
}

- (CSQuickActionsView)quickActionsView
{
  return self->_quickActionsView;
}

- (CGPoint)quickActionsViewOffset
{
  double x = self->_quickActionsViewOffset.x;
  double y = self->_quickActionsViewOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)quickActionsViewScale
{
  return self->_quickActionsViewScale;
}

- (double)quickActionsViewBlurRadius
{
  return self->_quickActionsViewBlurRadius;
}

- (CGPoint)dateViewOffset
{
  double x = self->_dateViewOffset.x;
  double y = self->_dateViewOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)dateViewScale
{
  return self->_dateViewScale;
}

- (BOOL)dateViewStretch
{
  return self->_dateViewStretch;
}

- (CGPoint)complicationContainerViewOffset
{
  double x = self->_complicationContainerViewOffset.x;
  double y = self->_complicationContainerViewOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setComplicationContainerViewOffset:(CGPoint)a3
{
  self->_complicationContainerViewOffset = a3;
}

- (double)complicationContainerViewScale
{
  return self->_complicationContainerViewScale;
}

- (void)setComplicationContainerViewScale:(double)a3
{
  self->_complicationContainerViewScale = a3;
}

- (CGPoint)proudLockIconViewOffset
{
  double x = self->_proudLockIconViewOffset.x;
  double y = self->_proudLockIconViewOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)proudLockIconViewScale
{
  return self->_proudLockIconViewScale;
}

- (BOOL)proudLockPrefersLowerPresentationLevel
{
  return self->_proudLockPrefersLowerPresentationLevel;
}

- (double)proudLockIconBlurRadius
{
  return self->_proudLockIconBlurRadius;
}

- (int64_t)dateViewPageAlignment
{
  return self->_dateViewPageAlignment;
}

- (void)setDateViewPageAlignment:(int64_t)a3
{
  self->_int64_t dateViewPageAlignment = a3;
}

- (BOOL)forceDateViewCentered
{
  return self->_forceDateViewCentered;
}

- (BOOL)dateViewIsVibrant
{
  return self->_dateViewIsVibrant;
}

- (UIGestureRecognizer)dateViewGestureRecognizer
{
  return self->_dateViewGestureRecognizer;
}

- (UILongPressGestureRecognizer)complicationGestureRecognizer
{
  return self->_complicationGestureRecognizer;
}

- (UIView)fakeStatusBar
{
  return self->_fakeStatusBar;
}

- (unint64_t)fakeStatusBarLevel
{
  return self->_fakeStatusBarLevel;
}

- (double)fakeStatusBarBlurRadius
{
  return self->_fakeStatusBarBlurRadius;
}

- (double)fakeStatusBarScale
{
  return self->_fakeStatusBarScale;
}

- (UIView)statusBarBackgroundView
{
  return self->_statusBarBackgroundView;
}

- (int64_t)statusBarBackgroundPageAlignment
{
  return self->_statusBarBackgroundPageAlignment;
}

- (void)setStatusBarBackgroundPageAlignment:(int64_t)a3
{
  self->_statusBarBackgroundPageAlignment = a3;
}

- (double)controlCenterGrabberScale
{
  return self->_controlCenterGrabberScale;
}

- (double)controlCenterGrabberBlurRadius
{
  return self->_controlCenterGrabberBlurRadius;
}

- (UIGestureRecognizer)wallpaperGestureRecognizer
{
  return self->_wallpaperGestureRecognizer;
}

- (UITapGestureRecognizer)backgroundContentGestureRecognizer
{
  return self->_backgroundContentGestureRecognizer;
}

- (UITapGestureRecognizer)quickNoteGestureRecognizer
{
  return self->_quickNoteGestureRecognizer;
}

- (SBSearchGesture)searchGesture
{
  return self->_searchGesture;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (CGPoint)contentViewOffset
{
  double x = self->_contentViewOffset.x;
  double y = self->_contentViewOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)contentViewScale
{
  return self->_contentViewScale;
}

- (UIView)wallpaperFloatingLayerContainerView
{
  return self->_wallpaperFloatingLayerContainerView;
}

- (UIView)slideableContentView
{
  return self->_slideableContentView;
}

- (UIView)modalPresentationView
{
  return self->_modalPresentationView;
}

- (UIView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (unint64_t)modalPresentationLevel
{
  return self->_modalPresentationLevel;
}

- (unint64_t)wallpaperPresentationLevel
{
  return self->_wallpaperPresentationLevel;
}

- (unint64_t)wallpaperFloatingLayerPresentationLevel
{
  return self->_wallpaperFloatingLayerPresentationLevel;
}

- (unint64_t)dateTimePresentationLevel
{
  return self->_dateTimePresentationLevel;
}

- (unint64_t)backgroundContentPresentationLevel
{
  return self->_backgroundContentPresentationLevel;
}

- (UIView)wakeEffectView
{
  return self->_wakeEffectView;
}

- (CSWallpaperView)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (UIView)tintingView
{
  return self->_tintingView;
}

- (void)setTintingView:(id)a3
{
}

- (SBUIBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (SBUIBackgroundView)bedtimeGreetingViewBackgroundView
{
  return self->_bedtimeGreetingViewBackgroundView;
}

- (UIColor)reduceTransparencyBackingColor
{
  return self->_reduceTransparencyBackingColor;
}

- (CGPoint)wallpaperFloatingLayerContainerViewOffset
{
  double x = self->_wallpaperFloatingLayerContainerViewOffset.x;
  double y = self->_wallpaperFloatingLayerContainerViewOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)wallpaperFloatingLayerContainerViewScale
{
  return self->_wallpaperFloatingLayerContainerViewScale;
}

- (CGPoint)backgroundContentViewOffset
{
  double x = self->_backgroundContentViewOffset.x;
  double y = self->_backgroundContentViewOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)backgroundContentViewScale
{
  return self->_backgroundContentViewScale;
}

- (double)backgroundContentViewAlpha
{
  return self->_backgroundContentViewAlpha;
}

- (CSBackgroundContentView)backgroundContentView
{
  return self->_backgroundContentView;
}

- (CGPoint)foregroundViewPositionOffset
{
  double x = self->_foregroundViewPositionOffset.x;
  double y = self->_foregroundViewPositionOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (UIView)referenceViewForBelowPresentationContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_referenceViewForBelowPresentationContext);

  return (UIView *)WeakRetained;
}

- (void)setReferenceViewForBelowPresentationContext:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)legibilitySettingsOverrideVibrancy
{
  return self->_legibilitySettingsOverrideVibrancy;
}

- (void)setLegibilitySettingsOverrideVibrancy:(BOOL)a3
{
  self->_legibilitySettingsOverrideVibrancdouble y = a3;
}

- (BOOL)statusBarLegibilityEnabled
{
  return self->_statusBarLegibilityEnabled;
}

- (void)setStatusBarLegibilityEnabled:(BOOL)a3
{
  self->_statusBarLegibilityEnabled = a3;
}

- (unint64_t)targetPageIndexForDraggingEnded
{
  return self->_targetPageIndexForDraggingEnded;
}

- (void)setTargetPageIndexForDraggingEnded:(unint64_t)a3
{
  self->_unint64_t targetPageIndexForDraggingEnded = a3;
}

- (CSRegionsDebugView)regionsDebugView
{
  return self->_regionsDebugView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionsDebugView, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_referenceViewForBelowPresentationContext);
  objc_storeStrong((id *)&self->_backgroundContentView, 0);
  objc_storeStrong((id *)&self->_reduceTransparencyBackingColor, 0);
  objc_storeStrong((id *)&self->_bedtimeGreetingViewBackgroundView, 0);
  objc_storeStrong((id *)&self->_tintingView, 0);
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_wakeEffectView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_modalPresentationView, 0);
  objc_storeStrong((id *)&self->_wallpaperFloatingLayerContainerView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_searchGesture, 0);
  objc_storeStrong((id *)&self->_quickNoteGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_backgroundContentGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_wallpaperGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_fakeStatusBar, 0);
  objc_storeStrong((id *)&self->_complicationGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_dateViewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_quickActionsView, 0);
  objc_storeStrong((id *)&self->_teachableMomentsContainerView, 0);
  objc_storeStrong((id *)&self->_poseidonContainerView, 0);
  objc_storeStrong((id *)&self->_cameraCoveredView, 0);
  objc_storeStrong((id *)&self->_proudLockContainerView, 0);
  objc_storeStrong((id *)&self->_fixedFooterView, 0);
  objc_storeStrong((id *)&self->_sidebarComplicationContainerView, 0);
  objc_storeStrong((id *)&self->_dateView, 0);
  objc_storeStrong((id *)&self->_mainPageView, 0);
  objc_destroyWeak((id *)&self->_layoutStrategy);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomPage, 0);
  objc_storeStrong((id *)&self->_lookSettings, 0);
  objc_storeStrong((id *)&self->_cachedLockScreenDefaults, 0);
  objc_storeStrong((id *)&self->_scrollModifier, 0);
  objc_storeStrong((id *)&self->_backgroundContainerView, 0);
  objc_storeStrong((id *)&self->_proudLockContainerWrapperView, 0);
  objc_storeStrong((id *)&self->_fakeStatusBarWrapperView, 0);
  objc_storeStrong((id *)&self->_statusBarLegibilityView, 0);
  objc_storeStrong((id *)&self->_dateEffectView, 0);
  objc_storeStrong((id *)&self->_higherSlideableContentView, 0);
  objc_storeStrong((id *)&self->_slideableContentView, 0);
  objc_storeStrong((id *)&self->_authIndicator, 0);
  objc_storeStrong((id *)&self->_dateTimeClippingView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end