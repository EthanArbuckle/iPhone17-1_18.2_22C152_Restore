@interface AVPlayerViewControllerContentView
- (AVCacheLargestInscribedRectInBoundingPath)cacheLargestInscribedRect;
- (AVMobileControlsViewController)controlsViewController;
- (AVPlaybackContentContainer)playbackContentContainerView;
- (AVPlaybackControlsView)playbackControlsView;
- (AVPlayerViewControllerContentView)initWithFrame:(CGRect)a3 playbackContentContainerView:(id)a4 targetVideoGravities:(id)a5;
- (AVPlayerViewControllerContentViewDelegate)delegate;
- (AVPlayerViewControllerCustomControlsView)customControlsView;
- (AVScrollingObserver)scrollingObserver;
- (BOOL)avkit_hasFullScreenLayoutClass;
- (BOOL)canAutomaticallyZoomLetterboxVideos;
- (BOOL)isCoveringWindow;
- (BOOL)isViewDescendantOfPlaybackControlsSubview:(id)a3;
- (BOOL)needsInitialLayout;
- (BOOL)showsPlaybackControls;
- (BOOL)styleSheetShouldUseCompactFullScreenItemSize;
- (BOOL)wantsBackdropView;
- (NSMutableDictionary)targetVideoGravities;
- (NSNumber)layoutClass;
- (NSString)automaticVideoGravity;
- (NSString)externalPlaybackIndicatorSubtitle;
- (NSString)externalPlaybackIndicatorTitle;
- (UIEdgeInsets)edgeInsetsForLetterboxedContent;
- (UIEdgeInsets)videoContentInset;
- (UIView)contentOverlayView;
- (UIView)iAdPreRollView;
- (UIView)iAdPreRollViewIfLoaded;
- (UIView)interactiveContentOverlayView;
- (id)_playerLayerView;
- (id)avkit_backdropGroupLeader;
- (id)chromeControlsViewController;
- (id)gen1Delegate;
- (unint64_t)contentOverlayViewPlacement;
- (void)_applyVideoGravityIfNeeded:(void *)a1;
- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4;
- (void)_clearCustomControlsViewConstraintsIfNeeded;
- (void)_insertViewIntoHierarchy:(id *)a1;
- (void)_updateControlsViewContentIntersectionIfNeeded;
- (void)_updateCustomControlsViewConstraints;
- (void)addPlaybackContentContainerViewIfNeeded;
- (void)avkit_needsUpdateBackdropCaptureViewHidden;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)loadPlaybackControlsViewIfNeeded;
- (void)removeTurboModePlaybackControlsPlaceholderViewIfNeeded;
- (void)scrollingObserverDidChangeScrollingState:(id)a3;
- (void)setAutomaticVideoGravity:(id)a3;
- (void)setCacheLargestInscribedRect:(id)a3;
- (void)setCanAutomaticallyZoomLetterboxVideos:(BOOL)a3;
- (void)setContentOverlayView:(id)a3;
- (void)setContentOverlayViewPlacement:(unint64_t)a3;
- (void)setControlsViewController:(id)a3;
- (void)setCustomControlsView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEdgeInsetsForLetterboxedContent:(UIEdgeInsets)a3;
- (void)setExternalPlaybackIndicatorSubtitle:(id)a3;
- (void)setExternalPlaybackIndicatorTitle:(id)a3;
- (void)setExternalPlaybackIndicatorTitle:(id)a3 subtitle:(id)a4;
- (void)setFrame:(CGRect)a3;
- (void)setGen1Delegate:(id)a3;
- (void)setInteractiveContentOverlayView:(id)a3;
- (void)setNeedsInitialLayout:(BOOL)a3;
- (void)setPlaybackContentContainerView:(id)a3;
- (void)setShowsAudioOnlyIndicator:(BOOL)a3;
- (void)setShowsExternalPlaybackIndicator:(BOOL)a3;
- (void)setShowsPlaybackControls:(BOOL)a3;
- (void)setShowsUnsupportedContentIndicator:(BOOL)a3;
- (void)setStyleSheetShouldUseCompactFullScreenItemSize:(BOOL)a3;
- (void)setTargetVideoGravity:(id)a3 forLayoutClass:(unint64_t)a4;
- (void)setVideoContentInset:(UIEdgeInsets)a3;
- (void)setWantsBackdropView:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation AVPlayerViewControllerContentView

- (void)setWantsBackdropView:(BOOL)a3
{
  if (self->_wantsBackdropView != a3)
  {
    self->_wantsBackdropView = a3;
    if (a3 && !self->_backdropLayerView)
    {
      v4 = [AVCABackdropLayerView alloc];
      [(AVPlayerViewControllerContentView *)self bounds];
      v5 = -[AVCABackdropLayerView initWithFrame:](v4, "initWithFrame:");
      backdropLayerView = self->_backdropLayerView;
      self->_backdropLayerView = v5;

      [(AVCABackdropLayerView *)self->_backdropLayerView setAutoresizingMask:0];
      [(AVCABackdropLayerView *)self->_backdropLayerView setCaptureOnly:1];
      [(AVPlayerViewControllerContentView *)self setNeedsLayout];
    }
  }
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
  if (self->_showsPlaybackControls != a3)
  {
    self->_showsPlaybackControls = a3;
    [(AVPlayerViewControllerContentView *)self loadPlaybackControlsViewIfNeeded];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)setCanAutomaticallyZoomLetterboxVideos:(BOOL)a3
{
  self->_canAutomaticallyZoomLetterboxVideos = a3;
}

- (AVScrollingObserver)scrollingObserver
{
  return self->_scrollingObserver;
}

- (void)loadPlaybackControlsViewIfNeeded
{
  id v9 = [(AVPlayerViewControllerContentView *)self controlsViewController];
  if (v9)
  {
    uint64_t v3 = [(AVPlayerViewControllerContentView *)self window];
    if (v3)
    {
      v4 = (void *)v3;
      BOOL v5 = [(AVPlayerViewControllerContentView *)self showsPlaybackControls];

      if (v5)
      {
        [v9 loadViewIfNeeded];
        -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:]((id *)&self->super.super.super.super.isa, self->_backdropLayerView);
        v6 = [v9 view];
        -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:]((id *)&self->super.super.super.super.isa, v6);

        -[AVPlayerViewControllerContentView _updateCustomControlsViewConstraints]((uint64_t)self);
        [(AVPlayerViewControllerContentView *)self avkit_needsUpdateBackdropCaptureViewHidden];
        v7 = [(AVPlayerViewControllerContentView *)self chromeControlsViewController];
        v8 = [v7 playbackControlsView];
        [v8 setCustomControlsView:self->_customControlsView];

        -[AVPlayerViewControllerContentView _updateControlsViewContentIntersectionIfNeeded](self);
      }
    }
  }
}

- (AVPlayerViewControllerContentView)initWithFrame:(CGRect)a3 playbackContentContainerView:(id)a4 targetVideoGravities:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)AVPlayerViewControllerContentView;
  v14 = -[AVView initWithFrame:](&v23, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    v14->_wantsBackdropView = 0;
    v14->_canAutomaticallyZoomLetterboxVideos = 1;
    v14->_needsInitialLayout = 1;
    uint64_t v16 = [v13 mutableCopy];
    targetVideoGravities = v15->_targetVideoGravities;
    v15->_targetVideoGravities = (NSMutableDictionary *)v16;

    objc_storeStrong((id *)&v15->_playbackContentContainerView, a4);
    v15->_contentOverlayViewPlacement = 0;
    uint64_t v18 = objc_opt_new();
    cacheLargestInscribedRect = v15->_cacheLargestInscribedRect;
    v15->_cacheLargestInscribedRect = (AVCacheLargestInscribedRectInBoundingPath *)v18;

    v20 = [[AVScrollingObserver alloc] initWithView:v15];
    scrollingObserver = v15->_scrollingObserver;
    v15->_scrollingObserver = v20;

    [(AVScrollingObserver *)v15->_scrollingObserver addDelegate:v15];
  }

  return v15;
}

- (AVMobileControlsViewController)controlsViewController
{
  return self->_controlsViewController;
}

- (BOOL)isCoveringWindow
{
  uint64_t v3 = [(AVPlayerViewControllerContentView *)self window];

  if (!v3) {
    return 0;
  }
  v4 = [(AVPlayerViewControllerContentView *)self window];
  [(AVPlayerViewControllerContentView *)self bounds];
  objc_msgSend(v4, "convertRect:fromView:", self);
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  CGFloat rect = v6;
  UIPointRoundToScale();
  UISizeRoundToScale();
  double v49 = v13;
  double rect_8 = v14;
  v15 = [(AVPlayerViewControllerContentView *)self window];
  uint64_t v16 = [v15 windowScene];
  v17 = [v16 statusBarManager];
  [v17 statusBarFrame];
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  [(AVPlayerViewControllerContentView *)self bounds];
  double Width = CGRectGetWidth(v52);
  v53.origin.double x = v19;
  v53.origin.double y = v21;
  v53.size.double width = v23;
  v53.size.double height = v25;
  CGFloat MaxY = CGRectGetWidth(v53);
  if (Width != MaxY) {
    goto LABEL_6;
  }
  v54.origin.double x = rect;
  v54.origin.double y = v8;
  v54.size.double width = v10;
  v54.size.double height = v12;
  double MinX = CGRectGetMinX(v54);
  v55.origin.double x = v19;
  v55.origin.double y = v21;
  v55.size.double width = v23;
  v55.size.double height = v25;
  CGFloat MaxY = CGRectGetMinX(v55);
  if (MinX == MaxY)
  {
    v56.origin.double x = rect;
    v56.origin.double y = v8;
    v56.size.double width = v10;
    v56.size.double height = v12;
    double MinY = CGRectGetMinY(v56);
    v57.origin.double x = v19;
    v57.origin.double y = v21;
    v57.size.double width = v23;
    v57.size.double height = v25;
    CGFloat MaxY = CGRectGetMaxY(v57);
    BOOL v31 = MinY > MaxY;
    double v32 = v49;
    if (!v31)
    {
      v58.origin.double x = rect;
      v58.origin.double y = v8;
      v58.size.double width = v10;
      v58.size.double height = v12;
      v61.origin.double x = v19;
      v61.origin.double y = v21;
      v61.size.double width = v23;
      v61.size.double height = v25;
      *(CGRect *)&CGFloat MaxY = CGRectUnion(v58, v61);
      double v32 = v33;
      double rect_8 = v34;
    }
  }
  else
  {
LABEL_6:
    double v32 = v49;
  }
  v35 = [(AVPlayerViewControllerContentView *)self window];
  [v35 bounds];
  double v37 = v36;
  double v39 = v38;

  if (v32 == v37)
  {
    double v40 = rect_8;
    if (rect_8 == v39) {
      return 1;
    }
  }
  v42 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
  int v43 = [v42 playerViewControllerContentViewHasActiveTransition:self];

  if (!v43) {
    return 0;
  }
  v44 = [(AVPlayerViewControllerContentView *)self window];
  [v44 bounds];

  v45 = [(AVPlayerViewControllerContentView *)self window];
  [v45 bounds];
  double Height = CGRectGetHeight(v59);
  v47 = [(AVPlayerViewControllerContentView *)self window];
  [v47 bounds];
  double v48 = CGRectGetWidth(v60);

  return v48 == rect_8 && Height == v32;
}

- (void)setContentOverlayView:(id)a3
{
  double v5 = (UIView *)a3;
  contentOverlayView = self->_contentOverlayView;
  if (contentOverlayView != v5)
  {
    CGFloat v8 = v5;
    double v7 = [(UIView *)contentOverlayView superview];

    if (v7 == self) {
      [(UIView *)self->_contentOverlayView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_contentOverlayView, a3);
    -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:]((id *)&self->super.super.super.super.isa, v8);
    contentOverlayView = (UIView *)[(AVPlayerViewControllerContentView *)self setNeedsLayout];
    double v5 = v8;
  }

  MEMORY[0x1F41817F8](contentOverlayView, v5);
}

- (void)setGen1Delegate:(id)a3
{
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(AVPlayerViewControllerContentView *)self frame];
  v16.origin.double x = v8;
  v16.origin.double y = v9;
  v16.size.double width = v10;
  v16.size.double height = v11;
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  BOOL v12 = CGRectEqualToRect(v15, v16);
  v14.receiver = self;
  v14.super_class = (Class)AVPlayerViewControllerContentView;
  -[AVPlayerViewControllerContentView setFrame:](&v14, sel_setFrame_, x, y, width, height);
  if (!v12)
  {
    double v13 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
    [v13 playerViewControllerContentViewDidChangeSize:self];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalPlaybackIndicatorSubtitle, 0);
  objc_storeStrong((id *)&self->_externalPlaybackIndicatorTitle, 0);
  objc_storeStrong((id *)&self->_cacheLargestInscribedRect, 0);
  objc_storeStrong((id *)&self->_iAdPreRollViewIfLoaded, 0);
  objc_storeStrong((id *)&self->_interactiveContentOverlayView, 0);
  objc_storeStrong((id *)&self->_playbackContentContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_targetVideoGravities, 0);
  objc_storeStrong((id *)&self->_scrollingObserver, 0);
  objc_storeStrong((id *)&self->_customControlsView, 0);
  objc_storeStrong((id *)&self->_controlsViewController, 0);
  objc_storeStrong((id *)&self->_automaticVideoGravity, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_destroyWeak((id *)&self->_gen1Delegate);
  objc_storeStrong((id *)&self->_turboModePlaybackControlsPlaceholderView, 0);
  objc_storeStrong((id *)&self->_backdropLayerView, 0);
  objc_storeStrong((id *)&self->_customControlsViewLayoutGuideConstraints, 0);
  objc_storeStrong((id *)&self->_unsupportedContentIndicatorView, 0);
  objc_storeStrong((id *)&self->_iAdPreRollView, 0);
  objc_storeStrong((id *)&self->_externalPlaybackIndicatorView, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);

  objc_storeStrong((id *)&self->_audioOnlyIndicatorView, 0);
}

- (void)setExternalPlaybackIndicatorSubtitle:(id)a3
{
}

- (NSString)externalPlaybackIndicatorSubtitle
{
  return self->_externalPlaybackIndicatorSubtitle;
}

- (void)setExternalPlaybackIndicatorTitle:(id)a3
{
}

- (NSString)externalPlaybackIndicatorTitle
{
  return self->_externalPlaybackIndicatorTitle;
}

- (void)setNeedsInitialLayout:(BOOL)a3
{
  self->_needsInitialLayout = a3;
}

- (BOOL)needsInitialLayout
{
  return self->_needsInitialLayout;
}

- (void)setVideoContentInset:(UIEdgeInsets)a3
{
  self->_videoContentInset = a3;
}

- (UIEdgeInsets)videoContentInset
{
  double top = self->_videoContentInset.top;
  double left = self->_videoContentInset.left;
  double bottom = self->_videoContentInset.bottom;
  double right = self->_videoContentInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)styleSheetShouldUseCompactFullScreenItemSize
{
  return self->_styleSheetShouldUseCompactFullScreenItemSize;
}

- (void)setCacheLargestInscribedRect:(id)a3
{
}

- (AVCacheLargestInscribedRectInBoundingPath)cacheLargestInscribedRect
{
  return self->_cacheLargestInscribedRect;
}

- (UIView)iAdPreRollViewIfLoaded
{
  return self->_iAdPreRollViewIfLoaded;
}

- (UIView)interactiveContentOverlayView
{
  return self->_interactiveContentOverlayView;
}

- (void)setEdgeInsetsForLetterboxedContent:(UIEdgeInsets)a3
{
  self->_edgeInsetsForLetterboxedContent = a3;
}

- (UIEdgeInsets)edgeInsetsForLetterboxedContent
{
  double top = self->_edgeInsetsForLetterboxedContent.top;
  double left = self->_edgeInsetsForLetterboxedContent.left;
  double bottom = self->_edgeInsetsForLetterboxedContent.bottom;
  double right = self->_edgeInsetsForLetterboxedContent.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)canAutomaticallyZoomLetterboxVideos
{
  return self->_canAutomaticallyZoomLetterboxVideos;
}

- (AVPlaybackContentContainer)playbackContentContainerView
{
  return self->_playbackContentContainerView;
}

- (AVPlayerViewControllerContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVPlayerViewControllerContentViewDelegate *)WeakRetained;
}

- (NSMutableDictionary)targetVideoGravities
{
  return self->_targetVideoGravities;
}

- (BOOL)wantsBackdropView
{
  return self->_wantsBackdropView;
}

- (BOOL)showsPlaybackControls
{
  return self->_showsPlaybackControls;
}

- (AVPlayerViewControllerCustomControlsView)customControlsView
{
  return self->_customControlsView;
}

- (unint64_t)contentOverlayViewPlacement
{
  return self->_contentOverlayViewPlacement;
}

- (UIView)contentOverlayView
{
  return self->_contentOverlayView;
}

- (void)scrollingObserverDidChangeScrollingState:(id)a3
{
  [(AVCABackdropLayerView *)self->_backdropLayerView updateActiveBackdropEffectIfGroupLeader];
  v4 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
  [v4 playerViewControllerContentViewDidUpdateScrollingStatus:self];

  double v5 = [(AVPlayerViewControllerContentView *)self playbackControlsView];
  double v6 = [v5 volumeButton];
  [v6 setNeedsUpdateGlyphRenderingMode];

  id v7 = [(AVTurboModePlaybackControlsPlaceholderView *)self->_turboModePlaybackControlsPlaceholderView volumeButton];
  [v7 setNeedsUpdateGlyphRenderingMode];
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  [(AVCacheLargestInscribedRectInBoundingPath *)self->_cacheLargestInscribedRect clearCache];

  [(AVPlayerViewControllerContentView *)self setNeedsLayout];
}

- (void)avkit_needsUpdateBackdropCaptureViewHidden
{
  backdropLayerView = self->_backdropLayerView;
  if (backdropLayerView)
  {
    if (self->_wantsBackdropView) {
      [(AVCABackdropLayerView *)backdropLayerView updateActiveBackdropEffectIfGroupLeader];
    }
  }
}

- (BOOL)avkit_hasFullScreenLayoutClass
{
  v2 = [(AVPlayerViewControllerContentView *)self layoutClass];
  BOOL v3 = [v2 unsignedIntegerValue] == 1 || objc_msgSend(v2, "unsignedIntegerValue") == 2;

  return v3;
}

- (id)avkit_backdropGroupLeader
{
  BOOL v3 = self->_backdropLayerView;
  if (![(AVPlayerViewControllerContentView *)self wantsBackdropView])
  {
    v6.receiver = self;
    v6.super_class = (Class)AVPlayerViewControllerContentView;
    uint64_t v4 = [(UIView *)&v6 avkit_backdropGroupLeader];

    BOOL v3 = (AVCABackdropLayerView *)v4;
  }

  return v3;
}

- (void)layoutSubviews
{
  kdebug_trace();
  [(AVPlayerViewControllerContentView *)self bounds];
  CGRect v145 = CGRectInset(v144, 10.0, 43.0);
  double x = v145.origin.x;
  double y = v145.origin.y;
  double width = v145.size.width;
  CGFloat height = v145.size.height;
  if (CGRectGetWidth(v145) < 49.0
    || (v146.origin.double x = x,
        v146.origin.double y = y,
        v146.size.double width = width,
        v146.size.CGFloat height = height,
        CGRectGetHeight(v146) < 37.0))
  {
    double x = *MEMORY[0x1E4F1DB28];
    double y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v142 = height;
  id v7 = [(AVPlayerViewControllerContentView *)self delegate];
  [v7 playerViewControllerContentViewEdgeInsetsForLetterboxedVideo:self];
  -[AVPlayerViewControllerContentView setEdgeInsetsForLetterboxedContent:](self, "setEdgeInsetsForLetterboxedContent:");

  [(AVPlayerViewControllerContentView *)self addPlaybackContentContainerViewIfNeeded];
  if (self)
  {
    [(AVPlayerViewControllerContentView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    if (self->_contentOverlayViewPlacement == 1)
    {
      double v138 = y;
      double v140 = width;
      double v136 = x;
      CGRect v16 = [(AVPlayerViewControllerContentView *)self playbackContentContainerView];
      v17 = [v16 activeContentView];

      [v17 frame];
      if (v17)
      {
        double v22 = v18;
        double v23 = v19;
        double v24 = v20;
        double v25 = v21;
        v26 = [v17 superview];

        if (v26)
        {
          v27 = [v17 superview];
          -[AVPlayerViewControllerContentView convertRect:fromView:](self, "convertRect:fromView:", v27, v22, v23, v24, v25);
          double v9 = v28;
          double v11 = v29;
          double v13 = v30;
          double v15 = v31;
        }
      }

      double x = v136;
      double y = v138;
      double width = v140;
    }
    -[UIView setFrame:](self->_contentOverlayView, "setFrame:", v9, v11, v13, v15);
    double v32 = [(AVPlayerViewControllerContentView *)self playbackContentContainerView];
    if (![v32 isDescendantOfView:self]) {
      goto LABEL_31;
    }
    [(AVPlayerViewControllerContentView *)self bounds];
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    v41 = [(AVMobileControlsViewController *)self->_controlsViewController controlsViewControllerIfChromeless];
    v42 = [v41 viewIfLoaded];
    int v43 = [(AVPlayerViewControllerContentView *)self playbackContentContainerView];
    v44 = [v43 activeContentView];
    v45 = [v44 playerLayerView];

    if (!v41 || !v42 || !v45)
    {
LABEL_30:
      objc_msgSend(v32, "setFrame:", v34, v36, v38, v40);

LABEL_31:
      goto LABEL_32;
    }
    v46 = [v41 contentTabPresentationContext];
    v47 = v46;
    if (v46)
    {
      uint64_t v48 = [v46 state];
      if (!v48
        || v48 == 2
        && ([v47 transitionContext],
            double v49 = objc_claimAutoreleasedReturnValue(),
            uint64_t v50 = [v49 direction],
            v49,
            !v50))
      {
        double v141 = width;
        [v47 presentationHeight];
        -[AVPlayerViewControllerContentView convertPoint:fromView:](self, "convertPoint:fromView:", v42, 0.0, v51);
        double v137 = v52;
        [v41 unobscuredContentArea];
        -[AVPlayerViewControllerContentView convertRect:fromView:](self, "convertRect:fromView:", v42);
        CGFloat v134 = v54;
        CGFloat v135 = v53;
        CGFloat v132 = v56;
        CGFloat v133 = v55;
        [v45 videoDisplaySize];
        double v59 = v58;
        if (v58 != 0.0)
        {
          double v60 = v57;
          if (v57 != 0.0)
          {
            double v139 = y;
            uint64_t v61 = [v45 videoGravity];
            double v62 = v40;
            if ((unint64_t)(v61 - 2) < 2) {
              goto LABEL_23;
            }
            if (v61 == 1)
            {
              double v62 = v38 / (v59 / v60);
LABEL_23:
              v147.origin.double y = v134;
              v147.origin.double x = v135;
              v147.size.CGFloat height = v132;
              v147.size.double width = v133;
              double MinY = CGRectGetMinY(v147);
              double v64 = v40 - MinY - v137;
              float v65 = v64;
              float v66 = v62;
              double width = v141;
              if (v65 > v66 || vabds_f32(v65, v66) < 0.00000011921)
              {
                double v67 = MinY + v64 * 0.5;
                v148.origin.double x = v34;
                v148.origin.double y = v36;
                v148.size.double width = v38;
                v148.size.CGFloat height = v40;
                double v36 = v36 + v67 - CGRectGetMidY(v148);
              }
              double y = v139;
              goto LABEL_29;
            }
            double y = v139;
          }
        }
        double width = v141;
      }
    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_32:
  v68 = [(AVPlayerViewControllerContentView *)self controlsViewController];
  v69 = [v68 viewIfLoaded];
  [(AVPlayerViewControllerContentView *)self bounds];
  objc_msgSend(v69, "setFrame:");

  externalPlaybackIndicatorView = self->_externalPlaybackIndicatorView;
  [(AVPlayerViewControllerContentView *)self bounds];
  -[AVExternalPlaybackIndicatorView setFrame:](externalPlaybackIndicatorView, "setFrame:");
  v71 = [(AVPlayerViewControllerContentView *)self iAdPreRollViewIfLoaded];
  [(AVPlayerViewControllerContentView *)self bounds];
  objc_msgSend(v71, "setFrame:");

  v72 = [(AVPlayerViewControllerContentView *)self interactiveContentOverlayView];
  [(AVPlayerViewControllerContentView *)self bounds];
  objc_msgSend(v72, "setFrame:");

  backdropLayerView = self->_backdropLayerView;
  [(AVPlayerViewControllerContentView *)self bounds];
  -[AVCABackdropLayerView setFrame:](backdropLayerView, "setFrame:");
  -[UIImageView setFrame:](self->_audioOnlyIndicatorView, "setFrame:", x, y, width, v142);
  -[UIImageView setFrame:](self->_unsupportedContentIndicatorView, "setFrame:", x, y, width, v142);
  audioOnlyIndicatorView = self->_audioOnlyIndicatorView;
  v149.origin.double x = x;
  v149.origin.double y = y;
  v149.size.double width = width;
  v149.size.CGFloat height = v142;
  double v75 = CGRectGetWidth(v149);
  v76 = [(UIImageView *)self->_audioOnlyIndicatorView image];
  [v76 size];
  if (v75 < v77)
  {
    [(UIImageView *)audioOnlyIndicatorView setContentMode:1];
  }
  else
  {
    v150.origin.double x = x;
    v150.origin.double y = y;
    v150.size.double width = width;
    v150.size.CGFloat height = v142;
    double v78 = CGRectGetHeight(v150);
    v79 = [(UIImageView *)self->_audioOnlyIndicatorView image];
    [v79 size];
    if (v78 < v80) {
      uint64_t v81 = 1;
    }
    else {
      uint64_t v81 = 4;
    }
    [(UIImageView *)audioOnlyIndicatorView setContentMode:v81];
  }
  unsupportedContentIndicatorView = self->_unsupportedContentIndicatorView;
  v151.origin.double x = x;
  v151.origin.double y = y;
  v151.size.double width = width;
  v151.size.CGFloat height = v142;
  double v83 = CGRectGetWidth(v151);
  v84 = [(UIImageView *)self->_unsupportedContentIndicatorView image];
  [v84 size];
  if (v83 < v85)
  {
    [(UIImageView *)unsupportedContentIndicatorView setContentMode:1];
  }
  else
  {
    v152.origin.double x = x;
    v152.origin.double y = y;
    v152.size.double width = width;
    v152.size.CGFloat height = v142;
    double v86 = CGRectGetHeight(v152);
    v87 = [(UIImageView *)self->_unsupportedContentIndicatorView image];
    [v87 size];
    if (v86 < v88) {
      uint64_t v89 = 1;
    }
    else {
      uint64_t v89 = 4;
    }
    [(UIImageView *)unsupportedContentIndicatorView setContentMode:v89];
  }
  if (![(UIView *)self avkit_isVideoGravityFrozen])
  {
    v90 = [(AVPlayerViewControllerContentView *)self layoutClass];

    if (v90)
    {
      v91 = [(AVPlayerViewControllerContentView *)self layoutClass];
      uint64_t v92 = [v91 unsignedIntegerValue];

      v93 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
      if ([v93 playerViewControllerContentViewShouldApplyAutomaticVideoGravity:self])
      {
        v94 = [(AVPlayerViewControllerContentView *)self automaticVideoGravity];
        uint64_t v95 = AVVideoGravityFromString(v94);
      }
      else
      {
        v94 = [(AVPlayerViewControllerContentView *)self targetVideoGravities];
        v96 = [NSNumber numberWithUnsignedInteger:v92];
        v97 = [v94 objectForKeyedSubscript:v96];
        uint64_t v95 = AVVideoGravityFromString(v97);
      }
      double v98 = *MEMORY[0x1E4FB2848];
      double v99 = *(double *)(MEMORY[0x1E4FB2848] + 8);
      double v100 = *(double *)(MEMORY[0x1E4FB2848] + 16);
      double v101 = *(double *)(MEMORY[0x1E4FB2848] + 24);
      if ([(AVPlayerViewControllerContentView *)self isCoveringWindow])
      {
        v102 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
        char v103 = [v102 playerViewControllerContentViewIsBeingTransitionedFromFullScreen:self];

        if ((v103 & 1) == 0)
        {
          v104 = (id *)MEMORY[0x1E4FB2608];
          if (![(id)*MEMORY[0x1E4FB2608] _isClassic]
            || [*v104 _classicMode] == 5)
          {
            v105 = [(AVPlayerViewControllerContentView *)self traitCollection];
            [v105 displayCornerRadius];
            if (v106 <= 0.0)
            {
            }
            else
            {

              if (v95 == 1)
              {
                [(AVPlayerViewControllerContentView *)self edgeInsetsForLetterboxedContent];
                double v98 = v107;
                double v99 = v108;
                double v100 = v109;
                double v101 = v110;
              }
            }
          }
        }
      }
      -[AVPlayerViewControllerContentView setVideoContentInset:](self, "setVideoContentInset:", v98, v99, v100, v101);
      v111 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
      int v112 = [v111 playerViewControllerContentViewHasActiveTransition:self];

      if (v112 && [MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled]) {
        -[AVPlayerViewControllerContentView _applyVideoGravityIfNeeded:](self, v95);
      }
      double v113 = *MEMORY[0x1E4F1DAD8];
      double v114 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      v115 = [(AVPlayerViewControllerContentView *)self playbackContentContainerView];
      [v115 bounds];
      double v117 = v116;
      double v119 = v118;

      [(AVPlayerViewControllerContentView *)self videoContentInset];
      v155.origin.double x = v113 + v120;
      v155.origin.double y = v114 + v121;
      v155.size.double width = v117 - (v120 + v122);
      v155.size.CGFloat height = v119 - (v121 + v123);
      v153.origin.double x = v113;
      v153.origin.double y = v114;
      v153.size.double width = v117;
      v153.size.CGFloat height = v119;
      CGRect v154 = CGRectIntersection(v153, v155);
      double v124 = v154.origin.x;
      double v125 = v154.origin.y;
      double v126 = v154.size.width;
      double v127 = v154.size.height;
      v128 = [(AVPlayerViewControllerContentView *)self playbackContentContainerView];
      objc_msgSend(v128, "setVideoContentFrame:", v124, v125, v126, v127);

      v129 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
      char v130 = [v129 playerViewControllerContentViewHasActiveTransition:self];

      if ((v130 & 1) == 0) {
        -[AVPlayerViewControllerContentView _applyVideoGravityIfNeeded:](self, v95);
      }
    }
  }
  -[AVPlayerViewControllerContentView _updateControlsViewContentIntersectionIfNeeded](self);
  v143.receiver = self;
  v143.super_class = (Class)AVPlayerViewControllerContentView;
  [(AVView *)&v143 layoutSubviews];
  v131 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
  [v131 playerViewControllerContentViewDidLayoutSubviews:self];

  kdebug_trace();
}

- (void)_updateControlsViewContentIntersectionIfNeeded
{
  if (val)
  {
    objc_initWeak(&location, val);
    v1[0] = MEMORY[0x1E4F143A8];
    v1[1] = 3221225472;
    v1[2] = __83__AVPlayerViewControllerContentView__updateControlsViewContentIntersectionIfNeeded__block_invoke;
    v1[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v2, &location);
    dispatch_async(MEMORY[0x1E4F14428], v1);
    objc_destroyWeak(&v2);
    objc_destroyWeak(&location);
  }
}

void __83__AVPlayerViewControllerContentView__updateControlsViewContentIntersectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v15 = WeakRetained;
    id v2 = [WeakRetained controlsViewController];
    BOOL v3 = [v2 controlsViewControllerIfChromeless];

    uint64_t v4 = [v3 viewIfLoaded];
    double v5 = -[AVPlayerViewControllerContentView _playerLayerView](v15);
    objc_super v6 = v5;
    if (v4 && v5)
    {
      [v5 videoBounds];
      objc_msgSend(v4, "convertRect:fromView:", v6);
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      [v4 bounds];
      v19.origin.double x = v8;
      v19.origin.double y = v10;
      v19.size.double width = v12;
      v19.size.CGFloat height = v14;
      CGRect v18 = CGRectIntersection(v17, v19);
      objc_msgSend(v4, "setContentIntersection:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
    }

    id WeakRetained = v15;
  }
}

- (id)_playerLayerView
{
  if (a1)
  {
    v1 = [a1 playbackContentContainerView];
    id v2 = [v1 activeContentView];
    BOOL v3 = [v2 playerLayerView];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (void)_applyVideoGravityIfNeeded:(void *)a1
{
  -[AVPlayerViewControllerContentView _playerLayerView](a1);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v4 = [v17 videoGravity] == a2;
  double v5 = v17;
  if (!v4)
  {
    if ([MEMORY[0x1E4FB1EB0] _isInAnimationBlock])
    {
      [MEMORY[0x1E4F39CF8] begin];
      objc_super v6 = (void *)MEMORY[0x1E4F39CF8];
      [MEMORY[0x1E4FB1EB0] _currentAnimationDuration];
      objc_msgSend(v6, "setAnimationDuration:");
      double v7 = (void *)MEMORY[0x1E4F39CF8];
      unint64_t v8 = [MEMORY[0x1E4FB1EB0] _currentAnimationCurve];
      if (v8 > 3) {
        double v9 = (id *)MEMORY[0x1E4F3A480];
      }
      else {
        double v9 = (id *)qword_1E5FC4408[v8];
      }
      id v11 = *v9;
      CGFloat v12 = [MEMORY[0x1E4F39C10] functionWithName:v11];

      [v7 setAnimationTimingFunction:v12];
      double v13 = [a1 playbackContentContainerView];
      CGFloat v14 = [a1 gen1Delegate];
      uint64_t v15 = [v14 playerViewControllerContentViewHasActiveTransition:a1];

      [v13 setVideoGravity:a2 removingAllSublayerTransformAnimations:v15];
      [MEMORY[0x1E4F39CF8] commit];
    }
    else
    {
      [v17 setVideoGravity:a2];
      CGFloat v10 = [v17 layer];
      [v10 removeAllAnimations];
    }
    CGRect v16 = [a1 gen1Delegate];
    [v16 playerViewControllerContentViewDidChangeVideoGravity:a1];

    double v5 = v17;
  }
}

- (void)willMoveToWindow:(id)a3
{
  BOOL v4 = [(AVPlayerViewControllerContentView *)self window];
  if (v4)
  {
    id v5 = v4;
    [v4 _removeBoundingPathChangeObserver:self];
    BOOL v4 = v5;
  }
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewControllerContentView;
  [(AVPlayerViewControllerContentView *)&v4 didMoveToSuperview];
  [(AVScrollingObserver *)self->_scrollingObserver update];
  BOOL v3 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
  [v3 playerViewControllerContentViewDidMoveToSuperviewOrWindow:self];
}

- (void)didMoveToWindow
{
  v11.receiver = self;
  v11.super_class = (Class)AVPlayerViewControllerContentView;
  [(AVPlayerViewControllerContentView *)&v11 didMoveToWindow];
  [(AVScrollingObserver *)self->_scrollingObserver update];
  [(AVPlayerViewControllerContentView *)self loadPlaybackControlsViewIfNeeded];
  [(AVPlayerViewControllerContentView *)self avkit_needsUpdateBackdropCaptureViewHidden];
  BOOL v3 = [(AVPlayerViewControllerContentView *)self delegate];
  objc_super v4 = [(AVPlayerViewControllerContentView *)self window];
  [v3 playerViewControllerContentView:self didMoveToWindow:v4];

  id v5 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
  [v5 playerViewControllerContentViewDidMoveToSuperviewOrWindow:self];

  objc_super v6 = [(AVPlayerViewControllerContentView *)self window];
  double v7 = v6;
  if (v6) {
    [v6 _addBoundingPathChangeObserver:self];
  }
  if (!self->_observationController)
  {
    unint64_t v8 = [[AVObservationController alloc] initWithOwner:self];
    observationController = self->_observationController;
    self->_observationController = v8;

    id v10 = [(AVObservationController *)self->_observationController startObserving:self keyPath:@"playbackContentContainerView.activeContentView.playerLayerView.videoBounds" includeInitialValue:0 observationHandler:&__block_literal_global_23395];
    [(AVObservationController *)self->_observationController startObservingNotificationForName:@"AVPlayerViewControllerContentViewUpdateContentIntersectionNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_64_23397];
  }
}

void __63__AVPlayerViewControllerContentView__startObservationsIfNeeded__block_invoke_2(int a1, id val)
{
}

void __63__AVPlayerViewControllerContentView__startObservationsIfNeeded__block_invoke(int a1, id val)
{
}

- (void)_updateCustomControlsViewConstraints
{
  v74[4] = *MEMORY[0x1E4F143B8];
  if (!a1 || !*(void *)(a1 + 568)) {
    return;
  }
  -[AVPlayerViewControllerContentView _clearCustomControlsViewConstraintsIfNeeded](a1);
  id v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = *(id *)(a1 + 552);
  objc_super v4 = [*(id *)(a1 + 568) transportControlsAreaLayoutGuideProvidingView];
  float v65 = [*(id *)(a1 + 568) volumeControlsAreaLayoutGuideProvidingView];
  double v64 = [*(id *)(a1 + 568) displayModeControlsAreaLayoutGuideProvidingView];
  if (!v3 || ![v3 isViewLoaded]) {
    goto LABEL_14;
  }
  id v5 = [v3 transportControlsLayoutItem];
  objc_super v6 = [v3 volumeControlsLayoutItem];
  double v7 = [v3 displayModeControlsLayoutItem];
  unint64_t v8 = v7;
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0)
  {

LABEL_14:
    double v59 = [v4 leadingAnchor];
    double v56 = [(id)a1 leadingAnchor];
    double v53 = [v59 constraintEqualToAnchor:v56];
    v74[0] = v53;
    uint64_t v50 = [v4 trailingAnchor];
    objc_super v11 = [(id)a1 trailingAnchor];
    CGFloat v12 = [v50 constraintEqualToAnchor:v11];
    v74[1] = v12;
    double v13 = [v4 topAnchor];
    CGFloat v14 = [(id)a1 bottomAnchor];
    [v13 constraintEqualToAnchor:v14];
    uint64_t v15 = v66 = v2;
    v74[2] = v15;
    CGRect v16 = [v4 bottomAnchor];
    [(id)a1 bottomAnchor];
    id v17 = v63 = v3;
    [v16 constraintEqualToAnchor:v17];
    CGRect v18 = v62 = v4;
    v74[3] = v18;
    CGRect v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:4];
    [v66 addObjectsFromArray:v19];

    double v60 = [v65 leadingAnchor];
    double v57 = [(id)a1 trailingAnchor];
    double v54 = [v60 constraintEqualToAnchor:v57];
    v73[0] = v54;
    double v51 = [v65 trailingAnchor];
    double v20 = [(id)a1 trailingAnchor];
    double v21 = [v51 constraintEqualToAnchor:v20];
    v73[1] = v21;
    double v22 = [v65 topAnchor];
    double v23 = [(id)a1 topAnchor];
    double v24 = [v22 constraintEqualToAnchor:v23];
    v73[2] = v24;
    double v25 = [v65 bottomAnchor];
    v26 = [(id)a1 topAnchor];
    v27 = [v25 constraintEqualToAnchor:v26];
    v73[3] = v27;
    double v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];
    [v66 addObjectsFromArray:v28];

    uint64_t v61 = [v64 leadingAnchor];
    double v58 = [(id)a1 leadingAnchor];
    double v55 = [v61 constraintEqualToAnchor:v58];
    v72[0] = v55;
    double v52 = [v64 trailingAnchor];
    double v29 = [(id)a1 leadingAnchor];
    double v30 = [v52 constraintEqualToAnchor:v29];
    v72[1] = v30;
    double v31 = [v64 topAnchor];
    double v32 = [(id)a1 topAnchor];
    double v33 = [v31 constraintEqualToAnchor:v32];
    v72[2] = v33;
    double v34 = [v64 bottomAnchor];
    double v35 = [(id)a1 topAnchor];
    double v36 = [v34 constraintEqualToAnchor:v35];
    v72[3] = v36;
    double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:4];
    [v66 addObjectsFromArray:v37];

    objc_super v4 = v62;
    id v3 = v63;

    id v2 = v66;
    goto LABEL_15;
  }
  v47 = objc_msgSend(v4, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v5);
  [v2 addObjectsFromArray:v47];

  uint64_t v48 = objc_msgSend(v65, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v6);
  [v2 addObjectsFromArray:v48];

  double v49 = objc_msgSend(v64, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v8);
  [v2 addObjectsFromArray:v49];

LABEL_15:
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v38 = v2;
  uint64_t v39 = [v38 countByEnumeratingWithState:&v67 objects:v71 count:16];
  if (v39)
  {
    uint64_t v41 = v39;
    uint64_t v42 = *(void *)v68;
    do
    {
      uint64_t v43 = 0;
      do
      {
        if (*(void *)v68 != v42) {
          objc_enumerationMutation(v38);
        }
        LODWORD(v40) = 1148813312;
        [*(id *)(*((void *)&v67 + 1) + 8 * v43++) setPriority:v40];
      }
      while (v41 != v43);
      uint64_t v41 = [v38 countByEnumeratingWithState:&v67 objects:v71 count:16];
    }
    while (v41);
  }

  v44 = objc_msgSend(*(id *)(a1 + 568), "avkit_constraintsFromCenterAndDimensionAnchorsToCenterAndDimensionAnchorsOfItem:", a1);
  [v38 addObjectsFromArray:v44];

  [MEMORY[0x1E4F28DC8] activateConstraints:v38];
  uint64_t v45 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v38];
  v46 = *(void **)(a1 + 496);
  *(void *)(a1 + 496) = v45;

  [*(id *)(a1 + 568) setNeedsUpdateConstraints];
}

- (void)_clearCustomControlsViewConstraintsIfNeeded
{
  if (a1 && *(void *)(a1 + 496))
  {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
    id v2 = *(void **)(a1 + 496);
    *(void *)(a1 + 496) = 0;
  }
}

- (void)removeTurboModePlaybackControlsPlaceholderViewIfNeeded
{
  [(AVTurboModePlaybackControlsPlaceholderView *)self->_turboModePlaybackControlsPlaceholderView removeFromSuperview];
  [(AVTurboModePlaybackControlsPlaceholderView *)self->_turboModePlaybackControlsPlaceholderView setPlayerController:0];
  backdropLayerView = self->_backdropLayerView;

  [(AVCABackdropLayerView *)backdropLayerView setForceLowQualityEffect:0];
}

- (void)_insertViewIntoHierarchy:(id *)a1
{
  v12[8] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    if (v3)
    {
      id v5 = [v3 superview];

      if (v5 != a1)
      {
        v12[0] = a1[75];
        v12[1] = a1[57];
        v12[2] = a1[59];
        v12[3] = a1[61];
        v12[4] = a1[58];
        v12[5] = a1[63];
        v12[6] = [a1[69] viewIfLoaded];
        uint64_t v6 = 0;
        uint64_t v7 = 0;
        v12[7] = a1[71];
        while (1)
        {
          id v8 = (id)v12[v6];
          if (v8 == v4) {
            break;
          }
          BOOL v9 = v8;
          id v10 = [v8 superview];
          if (v10 == a1) {
            ++v7;
          }

          if (++v6 == 8) {
            goto LABEL_11;
          }
        }
        [v4 removeFromSuperview];
        [a1 insertSubview:v4 atIndex:v7];

LABEL_11:
        for (uint64_t i = 7; i != -1; --i)
      }
    }
  }
}

- (NSNumber)layoutClass
{
  id v3 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
  id v4 = [v3 playerViewControllerContentViewOverrideLayoutClass:self];

  if (!v4)
  {
    if ([(AVPlayerViewControllerContentView *)self isCoveringWindow])
    {
      id v5 = NSNumber;
      [(AVPlayerViewControllerContentView *)self bounds];
      double Width = CGRectGetWidth(v10);
      [(AVPlayerViewControllerContentView *)self bounds];
      if (Width <= CGRectGetHeight(v11)) {
        uint64_t v7 = 1;
      }
      else {
        uint64_t v7 = 2;
      }
      id v4 = [v5 numberWithUnsignedInteger:v7];
    }
    else if ([(AVPlayerViewControllerContentView *)self _isInAWindow])
    {
      id v4 = &unk_1F094A1C0;
    }
    else
    {
      id v4 = 0;
    }
  }

  return (NSNumber *)v4;
}

- (void)setTargetVideoGravity:(id)a3 forLayoutClass:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = -[AVPlayerViewControllerContentView _playerLayerView](self);
  id v8 = (void *)*MEMORY[0x1E4F15AF0];
  if (v6) {
    id v8 = v6;
  }
  id v9 = v8;

  CGRect v10 = (void *)[v9 copy];
  CGRect v11 = [(AVPlayerViewControllerContentView *)self targetVideoGravities];
  CGFloat v12 = [NSNumber numberWithUnsignedInteger:a4];
  [v11 setObject:v10 forKeyedSubscript:v12];

  uint64_t v13 = [(AVPlayerViewControllerContentView *)self layoutClass];
  if (v13)
  {
    CGFloat v14 = (void *)v13;
    uint64_t v15 = [(AVPlayerViewControllerContentView *)self layoutClass];
    if ([v15 unsignedIntegerValue] == a4)
    {
      uint64_t v16 = [v7 videoGravity];
      uint64_t v17 = AVVideoGravityFromString(v9);

      if (v16 != v17)
      {
        CGRect v18 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
        int v19 = [v18 playerViewControllerContentViewShouldApplyAutomaticVideoGravity:self];

        if (v19) {
          [(AVPlayerViewControllerContentView *)self setAutomaticVideoGravity:v9];
        }
        double v20 = [(AVPlayerViewControllerContentView *)self window];

        if (v20)
        {
          if (([MEMORY[0x1E4FB1EB0] _isInAnimationBlockWithAnimationsEnabled] & 1) == 0
            && [MEMORY[0x1E4FB1EB0] areAnimationsEnabled]
            && [(UIView *)self avkit_wantsAnimatedViewTransitions])
          {
            id v21 = objc_alloc(MEMORY[0x1E4FB1ED8]);
            v24[0] = MEMORY[0x1E4F143A8];
            v24[1] = 3221225472;
            v24[2] = __74__AVPlayerViewControllerContentView_setTargetVideoGravity_forLayoutClass___block_invoke;
            v24[3] = &unk_1E5FC4698;
            v24[4] = self;
            double v22 = (void *)[v21 initWithDuration:5 curve:v24 animations:0.25];
            [v22 startAnimation];
          }
          else
          {
            [(AVPlayerViewControllerContentView *)self setNeedsLayout];
            [(AVPlayerViewControllerContentView *)self layoutIfNeeded];
          }
        }
        else
        {
          [v7 setVideoGravity:AVVideoGravityFromString(v9)];
          double v23 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
          [v23 playerViewControllerContentViewDidChangeVideoGravity:self];
        }
      }
    }
    else
    {
    }
  }
}

uint64_t __74__AVPlayerViewControllerContentView_setTargetVideoGravity_forLayoutClass___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  id v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)setShowsExternalPlaybackIndicator:(BOOL)a3
{
  if (a3)
  {
    if (self)
    {
      if (!self->_externalPlaybackIndicatorView)
      {
        id v4 = [AVExternalPlaybackIndicatorView alloc];
        [(AVPlayerViewControllerContentView *)self bounds];
        id v5 = -[AVExternalPlaybackIndicatorView initWithFrame:](v4, "initWithFrame:");
        externalPlaybackIndicatorView = self->_externalPlaybackIndicatorView;
        self->_externalPlaybackIndicatorView = v5;
      }
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71__AVPlayerViewControllerContentView_setShowsExternalPlaybackIndicator___block_invoke;
    v8[3] = &unk_1E5FC4698;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
  }
  else
  {
    uint64_t v7 = self->_externalPlaybackIndicatorView;
    [(AVExternalPlaybackIndicatorView *)v7 removeFromSuperview];
  }
}

void __71__AVPlayerViewControllerContentView_setShowsExternalPlaybackIndicator___block_invoke(uint64_t a1)
{
  id v2 = *(id **)(a1 + 32);
  id v5 = v2[59];
  id v3 = [v2 externalPlaybackIndicatorTitle];
  id v4 = [*(id *)(a1 + 32) externalPlaybackIndicatorSubtitle];
  [v5 setTitleString:v3 subtitleString:v4];

  -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:](*(id **)(a1 + 32), v5);
  [*(id *)(a1 + 32) setNeedsLayout];
}

- (void)setShowsAudioOnlyIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "NO";
    *(_DWORD *)buf = 136315650;
    uint64_t v17 = "-[AVPlayerViewControllerContentView setShowsAudioOnlyIndicator:]";
    int v19 = "showsAudioOnlyIndicator";
    __int16 v18 = 2080;
    if (v3) {
      id v6 = "YES";
    }
    __int16 v20 = 2080;
    id v21 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

  if (v3)
  {
    if (self)
    {
      if (!self->_audioOnlyIndicatorView)
      {
        id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
        id v8 = (void *)MEMORY[0x1E4FB1818];
        id v9 = AVBundle();
        CGRect v10 = [v8 imageNamed:@"AudioOnlyIndicator" inBundle:v9];
        CGRect v11 = objc_msgSend(MEMORY[0x1E4FB1618], "AV_indicatorForegroundColor");
        CGFloat v12 = [v10 _flatImageWithColor:v11];
        uint64_t v13 = (UIImageView *)[v7 initWithImage:v12];
        audioOnlyIndicatorView = self->_audioOnlyIndicatorView;
        self->_audioOnlyIndicatorView = v13;
      }
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__AVPlayerViewControllerContentView_setShowsAudioOnlyIndicator___block_invoke;
    v15[3] = &unk_1E5FC4698;
    v15[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v15];
  }
  else
  {
    [(UIImageView *)self->_audioOnlyIndicatorView removeFromSuperview];
  }
}

uint64_t __64__AVPlayerViewControllerContentView_setShowsAudioOnlyIndicator___block_invoke(uint64_t a1)
{
  -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:](*(id **)(a1 + 32), *(void **)(*(void *)(a1 + 32) + 456));
  id v2 = *(void **)(a1 + 32);

  return [v2 setNeedsLayout];
}

- (void)setShowsUnsupportedContentIndicator:(BOOL)a3
{
  if (a3)
  {
    if (self && !self->_unsupportedContentIndicatorView)
    {
      id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
      id v5 = (void *)MEMORY[0x1E4FB1818];
      id v6 = AVBundle();
      id v7 = [v5 imageNamed:@"UnsupportedContentIndicator" inBundle:v6];
      id v8 = objc_msgSend(MEMORY[0x1E4FB1618], "AV_indicatorForegroundColor");
      id v9 = [v7 _flatImageWithColor:v8];
      CGRect v10 = (UIImageView *)[v4 initWithImage:v9];
      unsupportedContentIndicatorView = self->_unsupportedContentIndicatorView;
      self->_unsupportedContentIndicatorView = v10;
    }
    -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:]((id *)&self->super.super.super.super.isa, self->_unsupportedContentIndicatorView);
    [(AVPlayerViewControllerContentView *)self setNeedsLayout];
  }
  else
  {
    CGFloat v12 = self->_unsupportedContentIndicatorView;
    [(UIImageView *)v12 removeFromSuperview];
  }
}

- (BOOL)isViewDescendantOfPlaybackControlsSubview:(id)a3
{
  id v4 = (AVPlayerViewControllerCustomControlsView *)a3;
  id v5 = [(AVMobileControlsViewController *)self->_controlsViewController viewIfLoaded];
  if ([(AVPlayerViewControllerCustomControlsView *)v4 isDescendantOfView:v5])
  {
    id v6 = [(AVMobileControlsViewController *)self->_controlsViewController viewIfLoaded];

    if (v6 != v4)
    {
      BOOL v7 = 1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  if ([(AVPlayerViewControllerCustomControlsView *)v4 isDescendantOfView:self->_customControlsView])BOOL v7 = self->_customControlsView != v4; {
  else
  }
    BOOL v7 = 0;
LABEL_8:

  return v7;
}

- (void)setPlaybackContentContainerView:(id)a3
{
  id v4 = (AVPlaybackContentContainer *)a3;
  playbackContentContainerView = self->_playbackContentContainerView;
  if (playbackContentContainerView != v4)
  {
    CGRect v11 = v4;
    id v6 = v4;
    BOOL v7 = self->_playbackContentContainerView;
    self->_playbackContentContainerView = v6;
    id v8 = playbackContentContainerView;

    id v9 = self->_playbackContentContainerView;
    [(AVPlaybackContentContainer *)v8 frame];
    -[AVPlaybackContentContainer setFrame:](v9, "setFrame:");

    [(AVPlayerViewControllerContentView *)self addPlaybackContentContainerViewIfNeeded];
    CGRect v10 = [(AVPlayerViewControllerContentView *)self gen1Delegate];
    [v10 playerViewControllerContentViewPlaybackContentContainerViewChanged:self];

    id v4 = v11;
  }
}

- (AVPlaybackControlsView)playbackControlsView
{
  id v2 = [(AVPlayerViewControllerContentView *)self chromeControlsViewController];
  BOOL v3 = [v2 playbackControlsView];

  return (AVPlaybackControlsView *)v3;
}

- (UIView)iAdPreRollView
{
  iAdPreRollView = self->_iAdPreRollView;
  if (!iAdPreRollView)
  {
    id v4 = [AVTouchIgnoringView alloc];
    [(AVPlayerViewControllerContentView *)self bounds];
    id v5 = -[AVTouchIgnoringView initWithFrame:](v4, "initWithFrame:");
    id v6 = self->_iAdPreRollView;
    self->_iAdPreRollView = v5;

    [(UIView *)self->_iAdPreRollView setEdgesInsettingLayoutMarginsFromSafeArea:0];
    [(AVPlayerViewControllerContentView *)self addSubview:self->_iAdPreRollView];
    iAdPreRollView = self->_iAdPreRollView;
  }

  return iAdPreRollView;
}

- (id)gen1Delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_gen1Delegate);

  return WeakRetained;
}

- (void)setExternalPlaybackIndicatorTitle:(id)a3 subtitle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AVPlayerViewControllerContentView *)self setExternalPlaybackIndicatorTitle:v7];
  [(AVPlayerViewControllerContentView *)self setExternalPlaybackIndicatorSubtitle:v6];
  [(AVExternalPlaybackIndicatorView *)self->_externalPlaybackIndicatorView setTitleString:v7 subtitleString:v6];
}

- (void)setCustomControlsView:(id)a3
{
  id v5 = (AVPlayerViewControllerCustomControlsView *)a3;
  customControlsView = self->_customControlsView;
  id v9 = v5;
  if (customControlsView != v5)
  {
    [(AVPlayerViewControllerCustomControlsView *)customControlsView removeFromSuperview];
    -[AVPlayerViewControllerContentView _clearCustomControlsViewConstraintsIfNeeded]((uint64_t)self);
    objc_storeStrong((id *)&self->_customControlsView, a3);
    -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:]((id *)&self->super.super.super.super.isa, v9);
    -[AVPlayerViewControllerContentView _updateCustomControlsViewConstraints]((uint64_t)self);
    id v7 = [(AVPlayerViewControllerContentView *)self chromeControlsViewController];
    id v8 = [v7 playbackControlsView];
    [v8 setCustomControlsView:v9];
  }
}

- (void)setContentOverlayViewPlacement:(unint64_t)a3
{
  if (self->_contentOverlayViewPlacement != a3)
  {
    self->_contentOverlayViewPlacement = a3;
    [(AVPlayerViewControllerContentView *)self setNeedsLayout];
  }
}

- (void)setControlsViewController:(id)a3
{
  id v5 = (AVMobileControlsViewController *)a3;
  p_controlsViewController = &self->_controlsViewController;
  if (self->_controlsViewController != v5)
  {
    CGRect v11 = v5;
    objc_storeStrong((id *)p_controlsViewController, a3);
    id v7 = [(AVPlayerViewControllerContentView *)self chromeControlsViewController];
    id v8 = [v7 turboModeControlsView];
    turboModePlaybackControlsPlaceholderView = self->_turboModePlaybackControlsPlaceholderView;
    self->_turboModePlaybackControlsPlaceholderView = v8;

    CGRect v10 = [(AVPlayerViewControllerContentView *)self chromeControlsViewController];
    objc_msgSend(v10, "setPrefersCompactFullScreenControls:", -[AVPlayerViewControllerContentView styleSheetShouldUseCompactFullScreenItemSize](self, "styleSheetShouldUseCompactFullScreenItemSize"));

    p_controlsViewController = (AVMobileControlsViewController **)[(AVPlayerViewControllerContentView *)self loadPlaybackControlsViewIfNeeded];
    id v5 = v11;
  }

  MEMORY[0x1F41817F8](p_controlsViewController, v5);
}

- (id)chromeControlsViewController
{
  id v2 = [(AVPlayerViewControllerContentView *)self controlsViewController];
  BOOL v3 = [v2 controlsViewControllerIfChromed];

  return v3;
}

- (void)addPlaybackContentContainerViewIfNeeded
{
  BOOL v3 = [(AVPlayerViewControllerContentView *)self delegate];
  char v4 = [v3 playerViewControllerContentViewIsPlayingOnSecondScreen:self];

  id v6 = [(AVPlayerViewControllerContentView *)self playbackContentContainerView];
  id v5 = [v6 superview];

  if (v5 != self && (v4 & 1) == 0)
  {
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    -[AVPlayerViewControllerContentView _insertViewIntoHierarchy:]((id *)&self->super.super.super.super.isa, v6);
    [(AVPlayerViewControllerContentView *)self bounds];
    objc_msgSend(v6, "setFrame:");
    [MEMORY[0x1E4F39CF8] commit];
  }
}

- (void)setInteractiveContentOverlayView:(id)a3
{
  id v5 = (UIView *)a3;
  p_interactiveContentOverlayView = &self->_interactiveContentOverlayView;
  if (self->_interactiveContentOverlayView != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_interactiveContentOverlayView, a3);
    if (v7)
    {
      [(AVPlayerViewControllerContentView *)self addSubview:v7];
      [(AVPlayerViewControllerContentView *)self setNeedsLayout];
      p_interactiveContentOverlayView = (UIView **)[(AVPlayerViewControllerContentView *)self layoutIfNeeded];
    }
  }

  MEMORY[0x1F4181820](p_interactiveContentOverlayView);
}

- (void)setStyleSheetShouldUseCompactFullScreenItemSize:(BOOL)a3
{
  if (self->_styleSheetShouldUseCompactFullScreenItemSize != a3)
  {
    BOOL v3 = a3;
    self->_styleSheetShouldUseCompactFullScreenItemSize = a3;
    id v4 = [(AVPlayerViewControllerContentView *)self chromeControlsViewController];
    [v4 setPrefersCompactFullScreenControls:v3];
  }
}

- (void)setAutomaticVideoGravity:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 copy];
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = (void *)*MEMORY[0x1E4F15AF8];
  }
  objc_storeStrong((id *)&self->_automaticVideoGravity, v7);

  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.avkit.SharedPreferences"];
  id v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F09B4238];
  [v8 setRemoteObjectInterface:v9];

  [v8 resume];
  CGRect v10 = [v8 remoteObjectProxy];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__AVPlayerViewControllerContentView_setAutomaticVideoGravity___block_invoke;
  v12[3] = &unk_1E5FC4698;
  id v13 = v8;
  id v11 = v8;
  [v10 setAutomaticVideoGravity:v4 completion:v12];
}

uint64_t __62__AVPlayerViewControllerContentView_setAutomaticVideoGravity___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (NSString)automaticVideoGravity
{
  p_automaticVideoGravitdouble y = &self->_automaticVideoGravity;
  automaticVideoGravitdouble y = self->_automaticVideoGravity;
  if (!automaticVideoGravity)
  {
    CFPropertyListRef v4 = CFPreferencesCopyValue(@"automaticVideoGravity", @"com.apple.avkit", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
    uint64_t v5 = (void *)v4;
    if (v4) {
      id v6 = (void *)v4;
    }
    else {
      id v6 = (void *)*MEMORY[0x1E4F15AF8];
    }
    objc_storeStrong((id *)p_automaticVideoGravity, v6);

    automaticVideoGravitdouble y = *p_automaticVideoGravity;
  }

  return automaticVideoGravity;
}

- (void)dealloc
{
  observationController = self->_observationController;
  if (observationController) {
    [(AVObservationController *)observationController stopAllObservation];
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewControllerContentView;
  [(AVPlayerViewControllerContentView *)&v4 dealloc];
}

@end