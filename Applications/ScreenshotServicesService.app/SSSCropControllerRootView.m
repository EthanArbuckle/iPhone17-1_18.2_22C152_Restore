@interface SSSCropControllerRootView
- (BOOL)_layoutShouldShowCroppedContents;
- (BOOL)_scrollViewIsInLiveUserEvent;
- (BOOL)_zoomTimerRunning;
- (BOOL)cropEnabled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)showingPDF;
- (CGAffineTransform)_transformToConvertFromRect:(SEL)a3 toRect:(CGRect)a4;
- (CGRect)_cropRectFromOverlayView:(id)a3;
- (CGRect)_currentScrollViewCropRect;
- (CGRect)cropOverlayViewRectInWindow;
- (CGRect)cropRect;
- (CGSize)_minimumSizeForOverlayViewInUnitSpace;
- (NSArray)gestureRecognizers;
- (NSArray)snapRects;
- (SSSCropControllerRootView)initWithFrame:(CGRect)a3;
- (SSSCropControllerRootViewDelegate)delegate;
- (SSSScreenshotContainerView)viewToCrop;
- (UIEdgeInsets)_contentInsetForUnitRect:(CGRect)a3;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (UIScrollView)scrollView;
- (double)_maximumZoomScale;
- (double)cornerGrabberAlpha;
- (double)cornerRadius;
- (double)lineAlpha;
- (double)lineGrabberAlpha;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)unitRectCoordinateSpace;
- (id)viewForZoomingInScrollView:(id)a3;
- (int64_t)editMode;
- (int64_t)numberOfTouchesRequiredForPanningCrop;
- (void)_aboutToChangeSize;
- (void)_cancelZoomTimer;
- (void)_didChangeSize;
- (void)_emitCropRectChangeMessage;
- (void)_emitCropRectWillBeginChangingMessage;
- (void)_handleOverlayViewResize:(id)a3;
- (void)_layoutOccludingView:(id)a3 viewToCrop:(id)a4 overlayView:(id)a5;
- (void)_layoutOccludingViewContainerView:(id)a3 occludingView:(id)a4 scrollViewMaskView:(id)a5;
- (void)_layoutOverlayView:(id)a3 viewToCrop:(id)a4;
- (void)_layoutScrollView:(id)a3;
- (void)_layoutScrollViewContainerView:(id)a3 scrollView:(id)a4 overlayView:(id)a5;
- (void)_layoutUpdateScrollViewContentLayout:(id)a3 viewToCrop:(id)a4;
- (void)_layoutViewToCrop:(id)a3 scrollView:(id)a4;
- (void)_moveToUnitRect:(CGRect)a3 animated:(BOOL)a4;
- (void)_prolongZoomTimerStartingIfNotRunning:(BOOL)a3;
- (void)_scrollViewTerminalUserEventOccurred;
- (void)_updateForScrollViewLiveUserEvent;
- (void)_updateForScrollViewNonLiveUserEvent;
- (void)_updateLastScrollViewUnitRect;
- (void)_updatePDFViewForEditModeChangeIfNecessary;
- (void)_updateScrollViewZoomScaleEndpoints;
- (void)_zoomTimerFired;
- (void)commitInflightEdits;
- (void)dealloc;
- (void)layoutSubviews;
- (void)notifyScrollViewChanged:(id)a3;
- (void)notifyZoomScaleChanged:(id)a3;
- (void)prepareForFullscreenExperience:(BOOL)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setBounds:(CGRect)a3;
- (void)setCornerGrabberAlpha:(double)a3;
- (void)setCornerRadius:(double)a3;
- (void)setCropEnabled:(BOOL)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setEditMode:(int64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setLineAlpha:(double)a3;
- (void)setLineGrabberAlpha:(double)a3;
- (void)setNumberOfTouchesRequiredForPanningCrop:(int64_t)a3;
- (void)setOverlayViewUnitRect:(CGRect)a3;
- (void)setPageCropRect:(CGRect)a3;
- (void)setShowingPDF:(BOOL)a3;
- (void)setSnapRects:(id)a3;
- (void)setUndoCropRect:(CGRect)a3;
- (void)setViewToCrop:(id)a3;
@end

@implementation SSSCropControllerRootView

- (SSSCropControllerRootView)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SSSCropControllerRootView;
  v3 = -[SSSCropControllerRootView initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [v3 setAutoresizesSubviews:0];
  [v3 setAccessibilityIdentifier:@"Screenshots-Crop-Root-View"];
  *((void *)v3 + 37) = 0x3FF0000000000000;
  *((void *)v3 + 38) = 0x3FF0000000000000;
  *((void *)v3 + 39) = 0x3FF0000000000000;
  v4 = objc_alloc_init(SSSPassthroughView);
  v5 = (void *)*((void *)v3 + 7);
  *((void *)v3 + 7) = v4;

  [*((id *)v3 + 7) setClipsToBounds:1];
  [v3 addSubview:*((void *)v3 + 7)];
  v6 = objc_alloc_init(SSSPassthroughView);
  v7 = (void *)*((void *)v3 + 8);
  *((void *)v3 + 8) = v6;

  [*((id *)v3 + 8) setClipsToBounds:1];
  v8 = objc_alloc_init(SSSScrollView);
  v9 = (void *)*((void *)v3 + 23);
  *((void *)v3 + 23) = v8;

  [*((id *)v3 + 23) _setZoomFeedbackGenerator:0];
  [*((id *)v3 + 23) setAutoresizesSubviews:0];
  [*((id *)v3 + 23) setBouncesZoom:0];
  [*((id *)v3 + 23) setBounces:0];
  [*((id *)v3 + 23) setScrollsToTop:0];
  [*((id *)v3 + 23) setAlwaysBounceVertical:0];
  [*((id *)v3 + 23) setAlwaysBounceHorizontal:0];
  [*((id *)v3 + 23) _setAutoScrollEnabled:0];
  [*((id *)v3 + 23) setShowsVerticalScrollIndicator:0];
  [*((id *)v3 + 23) setShowsHorizontalScrollIndicator:0];
  [*((id *)v3 + 23) setDelegate:v3];
  [*((id *)v3 + 7) addSubview:*((void *)v3 + 23)];
  *((void *)v3 + 2) = 0;
  *((void *)v3 + 3) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)v3 + 2) = _Q0;
  *((void *)v3 + 43) = 0;
  *((void *)v3 + 44) = 0;
  *(_OWORD *)(v3 + 360) = _Q0;
  v3[273] = 0;
  CGSize size = CGRectNull.size;
  *((_OWORD *)v3 + 12) = CGRectNull.origin;
  *((CGSize *)v3 + 13) = size;
  return (SSSCropControllerRootView *)v3;
}

- (void)dealloc
{
  [(SSSScreenshotContainerView *)self->_viewToCrop removeFromSuperview];
  [(SSSScrollView *)self->_scrollView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)SSSCropControllerRootView;
  [(SSSCropControllerRootView *)&v3 dealloc];
}

- (void)prepareForFullscreenExperience:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SSSCropControllerRootView *)self cropEnabled] || v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000A76C;
    v5[3] = &unk_100099A20;
    v5[4] = self;
    +[UIView performWithoutAnimation:v5];
  }
}

- (void)_aboutToChangeSize
{
  p_cropRectWhenViewSizeChangeBegan = &self->_cropRectWhenViewSizeChangeBegan;
  [(SSSCropControllerRootView *)self cropRect];
  p_cropRectWhenViewSizeChangeBegan->origin.x = v3;
  p_cropRectWhenViewSizeChangeBegan->origin.y = v4;
  p_cropRectWhenViewSizeChangeBegan->size.width = v5;
  p_cropRectWhenViewSizeChangeBegan->size.height = v6;
}

- (void)_didChangeSize
{
  [(SSSCropControllerRootView *)self _updateScrollViewZoomScaleEndpoints];
  [(SSSCropControllerRootView *)self cropRect];
  if (SSRectEqualToRect())
  {
    -[SSSCropControllerRootView setOverlayViewUnitRect:](self, "setOverlayViewUnitRect:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
    scrollView = self->_scrollView;
    viewToCrop = self->_viewToCrop;
    [(SSSCropControllerRootView *)self _layoutUpdateScrollViewContentLayout:scrollView viewToCrop:viewToCrop];
  }
  else
  {
    if (self->_editMode == 1 && _os_feature_enabled_impl())
    {
      double x = 0.0;
      double y = 0.0;
      double width = 1.0;
      double height = 1.0;
    }
    else
    {
      double x = self->_cropRectWhenViewSizeChangeBegan.origin.x;
      double y = self->_cropRectWhenViewSizeChangeBegan.origin.y;
      double width = self->_cropRectWhenViewSizeChangeBegan.size.width;
      double height = self->_cropRectWhenViewSizeChangeBegan.size.height;
    }
    -[SSSCropControllerRootView _moveToUnitRect:animated:](self, "_moveToUnitRect:animated:", 1, x, y, width, height);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SSSCropControllerRootView *)self frame];
  if (v9 == width && v8 == height)
  {
    v11.receiver = self;
    v11.super_class = (Class)SSSCropControllerRootView;
    -[SSSCropControllerRootView setFrame:](&v11, "setFrame:", x, y, width, height);
  }
  else
  {
    [(SSSCropControllerRootView *)self _aboutToChangeSize];
    v12.receiver = self;
    v12.super_class = (Class)SSSCropControllerRootView;
    -[SSSCropControllerRootView setFrame:](&v12, "setFrame:", x, y, width, height);
    [(SSSCropControllerRootView *)self _didChangeSize];
  }
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SSSCropControllerRootView *)self bounds];
  if (v9 == width && v8 == height)
  {
    v11.receiver = self;
    v11.super_class = (Class)SSSCropControllerRootView;
    -[SSSCropControllerRootView setBounds:](&v11, "setBounds:", x, y, width, height);
  }
  else
  {
    [(SSSCropControllerRootView *)self _aboutToChangeSize];
    v12.receiver = self;
    v12.super_class = (Class)SSSCropControllerRootView;
    -[SSSCropControllerRootView setBounds:](&v12, "setBounds:", x, y, width, height);
    [(SSSCropControllerRootView *)self _didChangeSize];
  }
}

- (void)layoutSubviews
{
  [(SSSCropControllerRootView *)self prepareForFullscreenExperience:0];
  [(SSSCropControllerRootView *)self bounds];
  if (!CGRectIsEmpty(v33))
  {
    scrollViewContainerView = self->_scrollViewContainerView;
    [(SSSCropControllerRootView *)self bounds];
    -[UIView setFrame:](scrollViewContainerView, "setFrame:");
    occludingViewContainerView = self->_occludingViewContainerView;
    [(SSSCropControllerRootView *)self bounds];
    -[UIView setFrame:](occludingViewContainerView, "setFrame:");
    [(SSSCropControllerRootView *)self _layoutScrollView:self->_scrollView];
    [(SSSCropControllerRootView *)self _layoutViewToCrop:self->_viewToCrop scrollView:self->_scrollView];
    [(SSSCropControllerRootView *)self _layoutOverlayView:self->_overlayView viewToCrop:self->_viewToCrop];
    [(SSSCropControllerRootView *)self _layoutOccludingView:self->_occludingView viewToCrop:self->_viewToCrop overlayView:self->_overlayView];
    [(SSSScrollView *)self->_scrollView frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    [(SSSUncroppedOccludingView *)self->_occludingView frame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [(SSSCropControllerRootView *)self _layoutScrollViewContainerView:self->_scrollViewContainerView scrollView:self->_scrollView overlayView:self->_overlayView];
    [(SSSCropControllerRootView *)self _layoutOccludingViewContainerView:self->_occludingViewContainerView occludingView:self->_occludingView scrollViewMaskView:self->_scrollViewContainerView];
    scrollView = self->_scrollView;
    -[SSSCropControllerRootView convertRect:toView:](self, "convertRect:toView:", self->_scrollViewContainerView, v6, v8, v10, v12);
    -[SSSScrollView setFrame:](scrollView, "setFrame:");
    occludingView = self->_occludingView;
    -[SSSCropControllerRootView convertRect:toView:](self, "convertRect:toView:", self->_occludingViewContainerView, v14, v16, v18, v20);
    -[SSSUncroppedOccludingView setFrame:](occludingView, "setFrame:");
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v23 = [(SSSCropControllerRootView *)self gestureRecognizers];
    id v24 = [v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v29;
      do
      {
        v27 = 0;
        do
        {
          if (*(void *)v29 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * (void)v27) setEnabled:[self cropEnabled]];
          v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        id v25 = [v23 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v25);
    }
  }
}

- (BOOL)_layoutShouldShowCroppedContents
{
  return self->_overlayViewResizeGestureIsTracking
      || [(NSTimer *)self->_zoomInTimer isValid]
      || self->_editMode == 1;
}

- (void)_layoutScrollView:(id)a3
{
  id v4 = a3;
  [(SSSCropControllerRootView *)self bounds];
  [v4 sss_setFrameUnanimatingIfChangingFromCGSizeZero:];
  double v5 = [v4 panGestureRecognizer];
  [v5 setMinimumNumberOfTouches:[self numberOfTouchesRequiredForPanningCrop]];

  id v6 = [v4 panGestureRecognizer];

  [v6 setMaximumNumberOfTouches:[self numberOfTouchesRequiredForPanningCrop]];
}

- (void)_layoutViewToCrop:(id)a3 scrollView:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  if (self->_showingPDF)
  {
    if (self->_editMode == 2)
    {
      [v23 intrinsicContentSize];
      [v6 convertSize:v23 fromView:nil];
      double v8 = v7;
      double v10 = v9;
      double x = CGPointZero.x;
      double y = CGPointZero.y;
      viewToCrop = self->_viewToCrop;
    }
    else
    {
      viewToCrop = self->_viewToCrop;
      [(SSSCropControllerRootView *)self bounds];
      [v6 convertRect:self];
    }
    -[SSSScreenshotContainerView sss_setFrameUnanimatingIfChangingFromCGSizeZero:](viewToCrop, "sss_setFrameUnanimatingIfChangingFromCGSizeZero:", x, y, v8, v10);
  }
  p_previousScrollViewFrame = &self->_previousScrollViewFrame;
  if (CGRectIsEmpty(self->_previousScrollViewFrame)) {
    goto LABEL_8;
  }
  [(SSSScrollView *)self->_scrollView frame];
  v26.origin.double x = v15;
  v26.origin.double y = v16;
  v26.size.double width = v17;
  v26.size.double height = v18;
  v25.origin.double x = p_previousScrollViewFrame->origin.x;
  v25.origin.double y = self->_previousScrollViewFrame.origin.y;
  v25.size.double width = self->_previousScrollViewFrame.size.width;
  v25.size.double height = self->_previousScrollViewFrame.size.height;
  if (!CGRectEqualToRect(v25, v26))
  {
LABEL_8:
    [(SSSScrollView *)self->_scrollView frame];
    p_previousScrollViewFrame->origin.double x = v19;
    self->_previousScrollViewFrame.origin.double y = v20;
    self->_previousScrollViewFrame.size.double width = v21;
    self->_previousScrollViewFrame.size.double height = v22;
    [(SSSCropControllerRootView *)self _layoutUpdateScrollViewContentLayout:self->_scrollView viewToCrop:self->_viewToCrop];
  }
}

- (void)_layoutOverlayView:(id)a3 viewToCrop:(id)a4
{
  id v20 = a3;
  double v5 = [(SSSCropControllerRootView *)self unitRectCoordinateSpace];
  [v5 convertRect:self->_overlayViewUnitRect.origin.x, self->_overlayViewUnitRect.origin.y, self->_overlayViewUnitRect.size.width, self->_overlayViewUnitRect.size.height toCoordinateSpace:self];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v22.origin.double x = v7;
  v22.origin.double y = v9;
  v22.size.double width = v11;
  v22.size.double height = v13;
  if (CGRectIsEmpty(v22) || self->_editMode == 1)
  {
    [(SSSCropControllerRootView *)self bounds];
    double v7 = v14;
    double v9 = v15;
    double v11 = v16;
    double v13 = v17;
  }
  [v20 sss_setFrameUnanimatingIfChangingFromCGSizeZero:v7, v9, v11, v13];
  unsigned int v18 = [(SSSCropControllerRootView *)self cropEnabled];
  double v19 = 0.0;
  if (v18) {
    double v19 = 1.0;
  }
  [v20 setAlpha:v19];
}

- (void)_layoutScrollViewContainerView:(id)a3 scrollView:(id)a4 overlayView:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_viewToCrop)
  {
    if ([(SSSCropControllerRootView *)self _layoutShouldShowCroppedContents])
    {
      double v11 = 1.0;
      double v12 = 0.0;
      double v13 = 0.0;
      double v14 = 1.0;
    }
    else
    {
      [(SSSCropControllerRootView *)self _cropRectFromOverlayView:v10];
      double v12 = v20;
      double v13 = v21;
      double v11 = v22;
      double v14 = v23;
    }
    id v24 = [(SSSCropControllerRootView *)self unitRectCoordinateSpace];
    [v24 convertRect:self toCoordinateSpace:v12, v13, v11, v14];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;

    double v19 = v8;
    double v15 = v26;
    double v16 = v28;
    double v17 = v30;
    double v18 = v32;
  }
  else
  {
    [v9 frame];
    double v19 = v8;
  }
  [v19 sss_setFrameUnanimatingIfChangingFromCGSizeZero:v15, v16, v17, v18];
}

- (void)_layoutOccludingView:(id)a3 viewToCrop:(id)a4 overlayView:(id)a5
{
  id v18 = a3;
  id v8 = a5;
  id v9 = a4;
  [(SSSCropControllerRootView *)self bounds];
  [v18 sss_setFrameUnanimatingIfChangingFromCGSizeZero:];
  [v9 bounds];
  -[SSSCropControllerRootView convertRect:fromView:](self, "convertRect:fromView:", v9);
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  [(SSSCropControllerRootView *)self bounds];
  v23.origin.double x = v11;
  v23.origin.double y = v13;
  v23.size.double width = v15;
  v23.size.double height = v17;
  if (CGRectIntersectsRect(v20, v23))
  {
    [(SSSCropControllerRootView *)self bounds];
    v24.origin.double x = v11;
    v24.origin.double y = v13;
    v24.size.double width = v15;
    v24.size.double height = v17;
    CGRect v22 = CGRectIntersection(v21, v24);
    [v18 sss_setFrameUnanimatingIfChangingFromCGSizeZero:v22.origin.x, v22.origin.y, v22.size.width, v22.size.height];
    [v8 bounds];
    [v18 convertRect:v8 fromView:v18];
    [v18 setUnoccludedRect:];
  }
}

- (void)_layoutOccludingViewContainerView:(id)a3 occludingView:(id)a4 scrollViewMaskView:(id)a5
{
  id v9 = a3;
  id v8 = a5;
  [a4 frame];
  if (self->_viewToCrop)
  {
    [v8 bounds];
    -[SSSCropControllerRootView convertRect:fromView:](self, "convertRect:fromView:", v8);
  }
  [v9 sss_setFrameUnanimatingIfChangingFromCGSizeZero:];
}

- (void)_layoutUpdateScrollViewContentLayout:(id)a3 viewToCrop:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  [v17 minimumZoomScale];
  double v8 = v7;
  [v6 intrinsicContentSize];
  double v10 = v9;
  double v12 = v11;

  [v17 setZoomScale:0 animated:v8];
  [v17 setContentSize:v8 * v10, v8 * v12];
  if ([(SSSCropControllerRootView *)self _layoutShouldShowCroppedContents])
  {
    double y = 0.0;
    double width = 1.0;
    double height = 1.0;
    double x = 0.0;
  }
  else
  {
    double x = self->_cropRect.origin.x;
    double y = self->_cropRect.origin.y;
    double width = self->_cropRect.size.width;
    double height = self->_cropRect.size.height;
  }
  -[SSSCropControllerRootView _contentInsetForUnitRect:](self, "_contentInsetForUnitRect:", x, y, width, height);
  [v17 setContentInset:];
  [(SSSCropControllerRootView *)self notifyScrollViewChanged:v17];
}

- (void)setViewToCrop:(id)a3
{
  id v4 = (SSSScreenshotContainerView *)a3;
  [(SSSCropControllerRootView *)self layoutIfNeeded];
  [(SSSScreenshotContainerView *)self->_viewToCrop removeFromSuperview];
  viewToCrop = self->_viewToCrop;
  self->_viewToCrop = v4;
  id v6 = v4;

  [(SSSScrollView *)self->_scrollView addSubview:self->_viewToCrop];

  [(SSSCropControllerRootView *)self setNeedsLayout];
}

- (void)_updatePDFViewForEditModeChangeIfNecessary
{
  if (self->_showingPDF)
  {
    [(SSSCropControllerRootView *)self _aboutToChangeSize];
    viewToCrop = self->_viewToCrop;
    if (self->_editMode == 2)
    {
      -[SSSScreenshotContainerView setCrop:](viewToCrop, "setCrop:", 0.0, 0.0, 1.0, 1.0);
      [(SSSScreenshotContainerView *)self->_viewToCrop enterCropMode];
    }
    else
    {
      -[SSSScreenshotContainerView setCrop:](viewToCrop, "setCrop:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
      [(SSSScreenshotContainerView *)self->_viewToCrop enterMarkupMode];
      [(SSSCropControllerRootView *)self _updateScrollViewZoomScaleEndpoints];
    }
    [(SSSCropControllerRootView *)self _layoutUpdateScrollViewContentLayout:self->_scrollView viewToCrop:self->_viewToCrop];
    [(SSSScreenshotContainerView *)self->_viewToCrop setUserInteractionEnabled:self->_editMode == 1];
    [(SSSCropControllerRootView *)self _didChangeSize];
    [(SSSCropControllerRootView *)self setNeedsLayout];
  }
  else
  {
    id v4 = self->_viewToCrop;
    [(SSSScreenshotContainerView *)v4 exitMarkupMode];
  }
}

- (void)setEditMode:(int64_t)a3
{
  if (self->_editMode != a3)
  {
    self->_editMode = a3;
    self->_showingPDF = (unint64_t)(a3 - 1) < 2;
    [(SSSCropControllerRootView *)self _updatePDFViewForEditModeChangeIfNecessary];
  }
}

- (void)setOverlayViewUnitRect:(CGRect)a3
{
  v5.origin.double x = 0.0;
  v5.origin.double y = 0.0;
  v5.size.double width = 1.0;
  v5.size.double height = 1.0;
  self->_overlayViewUnitRect = CGRectIntersection(a3, v5);

  [(SSSCropControllerRootView *)self setNeedsLayout];
}

- (void)_handleOverlayViewResize:(id)a3
{
  id v34 = a3;
  [v34 locationInView:self];
  if (v4 >= 0.0) {
    double v6 = v4;
  }
  else {
    double v6 = 0.0;
  }
  if (v5 >= 0.0) {
    double v7 = v5;
  }
  else {
    double v7 = 0.0;
  }
  [(SSSCropControllerRootView *)self bounds];
  if (v6 >= v8) {
    double v9 = v8;
  }
  else {
    double v9 = v6;
  }
  [(SSSCropControllerRootView *)self bounds];
  if (v7 >= v10) {
    double v11 = v10;
  }
  else {
    double v11 = v7;
  }
  double v12 = [(SSSCropControllerRootView *)self unitRectCoordinateSpace];
  [v12 convertPoint:self fromCoordinateSpace:v9];
  double v14 = v13;
  double v16 = v15;

  if ([v34 state] == (id)1)
  {
    self->_overlayViewResizeGestureIsTracking = 1;
    CGSize size = self->_overlayViewUnitRect.size;
    self->_overlayViewUnitRectWhenResizeBegan.origin = self->_overlayViewUnitRect.origin;
    self->_overlayViewUnitRectWhenResizeBegan.CGSize size = size;
    overlayView = self->_overlayView;
    -[SSSCropOverlayView convertPoint:fromView:](overlayView, "convertPoint:fromView:", self, v9, v11);
    id v19 = -[SSSCropOverlayView grabPositionForLocation:](overlayView, "grabPositionForLocation:");
    unint64_t v21 = v20;
    if (sub_100030F9C((uint64_t)v19, v20))
    {
      [v34 setEnabled:0];
      [v34 setEnabled:1];
      self->_overlayViewResizeGestureIsTracking = 0;
    }
    else
    {
      self->_grabPositionForResize.edge = (unint64_t)v19;
      self->_grabPositionForResize.corner = v21;
      self->_locationOfResizeGestureInUsWhenResizeBegan.double x = v14;
      self->_locationOfResizeGestureInUsWhenResizeBegan.double y = v16;
      [(SSSCropControllerRootView *)self _cancelZoomTimer];
      [(SSSCropControllerRootView *)self _emitCropRectWillBeginChangingMessage];
    }
    goto LABEL_25;
  }
  if ([v34 state] == (id)2)
  {
    [(SSSCropControllerRootView *)self _minimumSizeForOverlayViewInUnitSpace];
    double v23 = v22;
    double v25 = v24;
    double v26 = [(SSSCropControllerRootView *)self snapRects];
    double v27 = sub_10002F148(self->_grabPositionForResize.edge, self->_grabPositionForResize.corner, v26, self->_overlayViewUnitRectWhenResizeBegan.origin.x, self->_overlayViewUnitRectWhenResizeBegan.origin.y, self->_overlayViewUnitRectWhenResizeBegan.size.width, self->_overlayViewUnitRectWhenResizeBegan.size.height, self->_locationOfResizeGestureInUsWhenResizeBegan.x, self->_locationOfResizeGestureInUsWhenResizeBegan.y, v14, v16, v23, v25);
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;

    -[SSSCropControllerRootView setOverlayViewUnitRect:](self, "setOverlayViewUnitRect:", v27, v29, v31, v33);
    goto LABEL_25;
  }
  if ([v34 state] == (id)3)
  {
    [(SSSCropControllerRootView *)self _prolongZoomTimerStartingIfNotRunning:1];
LABEL_24:
    self->_overlayViewResizeGestureIsTracking = 0;
    goto LABEL_25;
  }
  if ([v34 state] == (id)5 || objc_msgSend(v34, "state") == (id)4)
  {
    -[SSSCropControllerRootView setOverlayViewUnitRect:](self, "setOverlayViewUnitRect:", self->_overlayViewUnitRectWhenResizeBegan.origin.x, self->_overlayViewUnitRectWhenResizeBegan.origin.y, self->_overlayViewUnitRectWhenResizeBegan.size.width, self->_overlayViewUnitRectWhenResizeBegan.size.height);
    goto LABEL_24;
  }
LABEL_25:
  [(SSSCropControllerRootView *)self setNeedsLayout];
}

- (CGSize)_minimumSizeForOverlayViewInUnitSpace
{
  double v3 = sub_10002F554();
  double v5 = v4;
  double y = CGRectZero.origin.y;
  double v7 = [(SSSCropControllerRootView *)self unitRectCoordinateSpace];
  [v7 convertRect:self->_viewToCrop fromCoordinateSpace:CGRectZero.origin.x, y, v3, v5];
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)_zoomTimerFired
{
  [(NSTimer *)self->_zoomInTimer invalidate];
  self->_isZoomingIn = 1;
  [(SSSCropControllerRootView *)self _cropRectFromOverlayView:self->_overlayView];

  -[SSSCropControllerRootView _moveToUnitRect:animated:](self, "_moveToUnitRect:animated:", 1);
}

- (BOOL)_zoomTimerRunning
{
  return [(NSTimer *)self->_zoomInTimer isValid];
}

- (void)_prolongZoomTimerStartingIfNotRunning:(BOOL)a3
{
  unsigned int v5 = [(SSSCropControllerRootView *)self _zoomTimerRunning];
  if (a3 || v5)
  {
    [(SSSCropControllerRootView *)self _cancelZoomTimer];
    self->_zoomInTimer = +[NSTimer scheduledTimerWithTimeInterval:self target:"_zoomTimerFired" selector:0 userInfo:0 repeats:1.0];
    _objc_release_x1();
  }
}

- (void)_cancelZoomTimer
{
}

- (UIEdgeInsets)_contentInsetForUnitRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  [(SSSScrollView *)self->_scrollView bounds];
  double v7 = v6;
  double v9 = v8;
  [(SSSScreenshotContainerView *)self->_viewToCrop intrinsicContentSize];
  double v11 = width * v10;
  double v13 = height * v12;
  double v14 = sub_10002F4C0(self->_editMode, v11, v13, v7, v9);
  if (v11 / v13 >= v7 / v9)
  {
    double right = UIEdgeInsetsZero.right;
    double left = UIEdgeInsetsZero.left;
    double bottom = (v9 - v13 * v14) * 0.5;
    double top = bottom;
  }
  else
  {
    double bottom = UIEdgeInsetsZero.bottom;
    double top = UIEdgeInsetsZero.top;
    double right = (v7 - v11 * v14) * 0.5;
    double left = right;
  }
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)_moveToUnitRect:(CGRect)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SSSCropControllerRootView *)self layoutIfNeeded];
  -[SSSCropControllerRootView setOverlayViewUnitRect:](self, "setOverlayViewUnitRect:", x, y, width, height);
  double v10 = [(SSSCropControllerRootView *)self unitRectCoordinateSpace];
  [v10 convertRect:self->_viewToCrop toCoordinateSpace:x, y, width, height];
  uint64_t v19 = v11;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000BF88;
  v21[3] = &unk_100099A88;
  v21[4] = self;
  *(double *)&v21[5] = x;
  *(double *)&v21[6] = y;
  *(double *)&v21[7] = width;
  *(double *)&v21[8] = height;
  v21[9] = v19;
  v21[10] = v13;
  v21[11] = v15;
  v21[12] = v17;
  id v18 = objc_retainBlock(v21);
  if (v4)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000C010;
    v20[3] = &unk_100099AB0;
    v20[4] = self;
    +[UIView animateWithDuration:4 delay:v18 options:v20 animations:0.2 completion:0.0];
  }
  else
  {
    +[UIView performWithoutAnimation:v18];
  }
}

- (void)setCropRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(SSSCropControllerRootView *)self _cancelZoomTimer];
  self->_cropRect.origin.double x = x;
  self->_cropRect.origin.double y = y;
  self->_cropRect.size.double width = width;
  self->_cropRect.size.double height = height;
  -[SSSCropControllerRootView _moveToUnitRect:animated:](self, "_moveToUnitRect:animated:", 1, x, y, width, height);

  [(SSSCropControllerRootView *)self setNeedsLayout];
}

- (void)setPageCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(SSSCropControllerRootView *)self _cancelZoomTimer];
  [(SSSCropControllerRootView *)self _aboutToChangeSize];
  self->_cropRect.origin.CGFloat x = x;
  self->_cropRect.origin.CGFloat y = y;
  self->_cropRect.size.CGFloat width = width;
  self->_cropRect.size.CGFloat height = height;
  [(SSSCropControllerRootView *)self _updateScrollViewZoomScaleEndpoints];
  [(SSSCropControllerRootView *)self _layoutUpdateScrollViewContentLayout:self->_scrollView viewToCrop:self->_viewToCrop];
  double v8 = self->_cropRect.origin.x;
  double v9 = self->_cropRect.origin.y;
  double v10 = self->_cropRect.size.width;
  double v11 = self->_cropRect.size.height;

  -[SSSCropControllerRootView _moveToUnitRect:animated:](self, "_moveToUnitRect:animated:", 0, v8, v9, v10, v11);
}

- (void)setUndoCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(SSSCropControllerRootView *)self _cancelZoomTimer];
  self->_cropRect.origin.CGFloat x = x;
  self->_cropRect.origin.CGFloat y = y;
  self->_cropRect.size.CGFloat width = width;
  self->_cropRect.size.CGFloat height = height;
  [(SSSCropControllerRootView *)self _aboutToChangeSize];
  if (self->_editMode == 1) {
    -[SSSScreenshotContainerView setCrop:](self->_viewToCrop, "setCrop:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
  }
  [(SSSCropControllerRootView *)self _layoutUpdateScrollViewContentLayout:self->_scrollView viewToCrop:self->_viewToCrop];

  [(SSSCropControllerRootView *)self _didChangeSize];
}

- (void)commitInflightEdits
{
  overlayView = self->_overlayView;
  if (!overlayView
    || ([(SSSCropOverlayView *)overlayView bounds],
        v22.origin.CGFloat x = CGRectZero.origin.x,
        v22.origin.CGFloat y = CGRectZero.origin.y,
        v22.size.CGFloat width = CGRectZero.size.width,
        v22.size.CGFloat height = CGRectZero.size.height,
        !CGRectEqualToRect(v21, v22)))
  {
    [(SSSCropControllerRootView *)self cropRect];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [(SSSCropControllerRootView *)self _cropRectFromOverlayView:self->_overlayView];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    if ((SSRectEqualToRect() & 1) == 0)
    {
      if ([(SSSCropControllerRootView *)self cropEnabled])
      {
        double v5 = v13;
        double v7 = v15;
        double v9 = v17;
        double v11 = v19;
      }
      [(NSTimer *)self->_zoomInTimer invalidate];
      -[SSSCropControllerRootView _moveToUnitRect:animated:](self, "_moveToUnitRect:animated:", 0, v5, v7, v9, v11);
      [(SSSCropControllerRootView *)self _emitCropRectChangeMessage];
    }
  }
}

- (void)_updateScrollViewZoomScaleEndpoints
{
  uint64_t v3 = [(SSSCropControllerRootView *)self viewToCrop];
  if (v3)
  {
    double v4 = (void *)v3;
    [(SSSCropControllerRootView *)self bounds];
    IsEmptCGFloat y = CGRectIsEmpty(v23);

    if (!IsEmpty)
    {
      double v6 = [(SSSCropControllerRootView *)self viewToCrop];
      [v6 intrinsicContentSize];
      double v8 = v7;
      double v10 = v9;

      [(SSSCropControllerRootView *)self bounds];
      [(SSSScrollView *)self->_scrollView setMinimumZoomScale:sub_10002F4C0(self->_editMode, v8, v10, v11, v12)];
      scrollView = self->_scrollView;
      [(SSSCropControllerRootView *)self _maximumZoomScale];
      -[SSSScrollView setMaximumZoomScale:](scrollView, "setMaximumZoomScale:");
      [(SSSScrollView *)self->_scrollView zoomScale];
      double v15 = v14;
      [(SSSScrollView *)self->_scrollView minimumZoomScale];
      double v16 = self->_scrollView;
      if (v15 >= v17)
      {
        [(SSSScrollView *)v16 zoomScale];
        double v19 = v18;
        [(SSSScrollView *)self->_scrollView maximumZoomScale];
        if (v19 <= v20) {
          return;
        }
        [(SSSScrollView *)self->_scrollView maximumZoomScale];
      }
      else
      {
        [(SSSScrollView *)v16 minimumZoomScale];
      }
      CGRect v21 = self->_scrollView;
      -[SSSScrollView setZoomScale:](v21, "setZoomScale:");
    }
  }
}

- (double)_maximumZoomScale
{
  [(SSSCropControllerRootView *)self bounds];

  sub_10002F4F4();
  return result;
}

- (CGRect)_currentScrollViewCropRect
{
  uint64_t v3 = [(SSSCropControllerRootView *)self unitRectCoordinateSpace];
  [(SSSCropControllerRootView *)self bounds];
  [v3 convertRect:self fromCoordinateSpace:];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)_cropRectFromOverlayView:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    double v5 = [(SSSCropControllerRootView *)self unitRectCoordinateSpace];
    [v4 bounds];
    [v5 convertRect:v4 fromCoordinateSpace:];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v11 = 1.0;
    double v7 = 0.0;
    double v9 = 0.0;
    double v13 = 1.0;
  }
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)self->_scrollView;
}

- (id)unitRectCoordinateSpace
{
  v2 = [[SSSUnitRectCoordinateSpace alloc] initWithView:self->_viewToCrop];

  return v2;
}

- (void)_emitCropRectWillBeginChangingMessage
{
  id v3 = [(SSSCropControllerRootView *)self delegate];
  [v3 cropControllerRootViewWillBeginChangingCropRect:self];
}

- (void)_emitCropRectChangeMessage
{
  [(SSSCropControllerRootView *)self _cropRectFromOverlayView:self->_overlayView];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  self->_cropRect.origin.CGFloat x = v3;
  self->_cropRect.origin.CGFloat y = v5;
  self->_cropRect.size.CGFloat width = v7;
  self->_cropRect.size.CGFloat height = v9;
  double v11 = [(SSSCropControllerRootView *)self delegate];
  [v11 cropControllerRootView:self changedToCropRect:v4, v6, v8, v10];

  scrollView = self->_scrollView;

  [(SSSCropControllerRootView *)self notifyScrollViewChanged:scrollView];
}

- (void)_scrollViewTerminalUserEventOccurred
{
  if (![(SSSCropControllerRootView *)self _zoomTimerRunning])
  {
    [(SSSCropControllerRootView *)self _emitCropRectChangeMessage];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  [(SSSCropControllerRootView *)self _scrollViewTerminalUserEventOccurred];

  [(SSSCropControllerRootView *)self _updateForScrollViewNonLiveUserEvent];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4) {
    [(SSSCropControllerRootView *)self _scrollViewTerminalUserEventOccurred];
  }
  overlayViewResizeGesture = self->_overlayViewResizeGesture;

  [(UILongPressGestureRecognizer *)overlayViewResizeGesture setEnabled:1];
}

- (void)_updateLastScrollViewUnitRect
{
  p_lastScrollViewUnitRect = &self->_lastScrollViewUnitRect;
  [(SSSCropControllerRootView *)self _currentScrollViewCropRect];
  p_lastScrollViewUnitRect->origin.CGFloat x = v4;
  p_lastScrollViewUnitRect->origin.CGFloat y = v5;
  p_lastScrollViewUnitRect->size.CGFloat width = v6;
  p_lastScrollViewUnitRect->size.CGFloat height = v7;

  [(SSSCropControllerRootView *)self setNeedsLayout];
}

- (void)_updateForScrollViewLiveUserEvent
{
  [(SSSCropControllerRootView *)self _currentScrollViewCropRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  p_lastScrollViewUnitRect = &self->_lastScrollViewUnitRect;
  if (CGRectIsEmpty(self->_lastScrollViewUnitRect))
  {
    p_lastScrollViewUnitRect->origin.double x = v4;
    self->_lastScrollViewUnitRect.origin.double y = v6;
    double height = v10;
    double width = v8;
    double y = v6;
    double x = v4;
    self->_lastScrollViewUnitRect.size.double width = v8;
    self->_lastScrollViewUnitRect.size.double height = v10;
  }
  else
  {
    double x = p_lastScrollViewUnitRect->origin.x;
    double y = self->_lastScrollViewUnitRect.origin.y;
    double width = self->_lastScrollViewUnitRect.size.width;
    double height = self->_lastScrollViewUnitRect.size.height;
  }
  memset(&v16[1], 0, sizeof(CGAffineTransform));
  -[SSSCropControllerRootView _transformToConvertFromRect:toRect:](self, "_transformToConvertFromRect:toRect:", x, y, width, height, v4, v6, v8, v10);
  [(SSSCropControllerRootView *)self _updateLastScrollViewUnitRect];
  CGRect overlayViewUnitRect = self->_overlayViewUnitRect;
  v16[0] = v16[1];
  CGRect v18 = CGRectApplyAffineTransform(overlayViewUnitRect, v16);
  -[SSSCropControllerRootView setOverlayViewUnitRect:](self, "setOverlayViewUnitRect:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  [(SSSCropControllerRootView *)self _prolongZoomTimerStartingIfNotRunning:0];
  [(SSSCropControllerRootView *)self setNeedsLayout];
}

- (CGAffineTransform)_transformToConvertFromRect:(SEL)a3 toRect:(CGRect)a4
{
  double y = a5.origin.y;
  double x = a5.origin.x;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat v9 = a4.origin.y;
  CGFloat v10 = a4.origin.x;
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeScale(&v16, a5.size.width / a4.size.width, a5.size.width / a4.size.width);
  CGAffineTransform v15 = v16;
  v17.origin.double x = v10;
  v17.origin.double y = v9;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  CGRect v18 = CGRectApplyAffineTransform(v17, &v15);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v15, x - v18.origin.x, y - v18.origin.y);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tdouble x = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransform t1 = v16;
  CGAffineTransform v13 = v15;
  return CGAffineTransformConcat(retstr, &t1, &v13);
}

- (void)_updateForScrollViewNonLiveUserEvent
{
  if (self->_isZoomingIn)
  {
    self->_isZoomingIn = 0;
    [(SSSCropControllerRootView *)self _emitCropRectChangeMessage];
  }
}

- (BOOL)_scrollViewIsInLiveUserEvent
{
  if (([(SSSScrollView *)self->_scrollView isTracking] & 1) != 0
    || ([(SSSScrollView *)self->_scrollView isDecelerating] & 1) != 0
    || self->_scrollViewIsInUserInitiatedZoom)
  {
    return ![(SSSScrollView *)self->_scrollView isInProgrammaticCall];
  }
  else
  {
    return 0;
  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  [(UILongPressGestureRecognizer *)self->_overlayViewResizeGesture setEnabled:0];
  [(SSSCropControllerRootView *)self _emitCropRectWillBeginChangingMessage];

  [(SSSCropControllerRootView *)self _updateForScrollViewLiveUserEvent];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  if ([(SSSCropControllerRootView *)self _scrollViewIsInLiveUserEvent])
  {
    [(SSSCropControllerRootView *)self _updateForScrollViewLiveUserEvent];
    [(SSSCropControllerRootView *)self setNeedsLayout];
  }
  [(SSSCropControllerRootView *)self notifyScrollViewChanged:v4];
}

- (void)scrollViewDidZoom:(id)a3
{
  id v4 = a3;
  if ([(SSSCropControllerRootView *)self _scrollViewIsInLiveUserEvent]) {
    [(SSSCropControllerRootView *)self _updateForScrollViewLiveUserEvent];
  }
  [(SSSCropControllerRootView *)self setNeedsLayout];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v5 = [(SSSCropControllerRootView *)self scrollView];
  double v6 = [v5 subviews];

  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(SSSScreenshotContainerView **)(*((void *)&v12 + 1) + 8 * i);
        if (v11 != self->_viewToCrop) {
          [(SSSScreenshotContainerView *)v11 setNeedsLayout];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  if (!self->_scrollViewIsInUserInitiatedZoom) {
    [(SSSCropControllerRootView *)self notifyZoomScaleChanged:v4];
  }
  [(SSSCropControllerRootView *)self notifyScrollViewChanged:v4];
}

- (void)notifyScrollViewChanged:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(SSSScreenshotContainerView *)self->_viewToCrop cropControllerDidUpdateScrollView:v4];
  }
}

- (void)notifyZoomScaleChanged:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(SSSScreenshotContainerView *)self->_viewToCrop cropControllerDidZoomInScrollView:v4];
  }
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  double v5 = [a3 pinchGestureRecognizer];
  self->_scrollViewIsInUserInitiatedZoom = [v5 state] == (id)1;

  if (self->_scrollViewIsInUserInitiatedZoom)
  {
    [(SSSCropControllerRootView *)self _updateForScrollViewLiveUserEvent];
  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  if (self->_scrollViewIsInUserInitiatedZoom)
  {
    id v6 = a3;
    [(SSSCropControllerRootView *)self _updateForScrollViewLiveUserEvent];
    self->_scrollViewIsInUserInitiatedZoom = 0;
    [(SSSCropControllerRootView *)self _scrollViewTerminalUserEventOccurred];
    [(SSSCropControllerRootView *)self notifyZoomScaleChanged:v6];
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_viewToCrop;
}

- (NSArray)gestureRecognizers
{
  double v3 = +[NSMutableArray array];
  id v4 = v3;
  if (self->_overlayViewResizeGesture) {
    [v3 addObject:];
  }
  double v5 = [(SSSScrollView *)self->_scrollView panGestureRecognizer];

  if (v5)
  {
    id v6 = [(SSSScrollView *)self->_scrollView panGestureRecognizer];
    [v4 addObject:v6];
  }
  id v7 = [(SSSScrollView *)self->_scrollView pinchGestureRecognizer];

  if (v7)
  {
    id v8 = [(SSSScrollView *)self->_scrollView pinchGestureRecognizer];
    [v4 addObject:v8];
  }

  return (NSArray *)v4;
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return (UIPanGestureRecognizer *)[(SSSScrollView *)self->_scrollView panGestureRecognizer];
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return (UIPinchGestureRecognizer *)[(SSSScrollView *)self->_scrollView pinchGestureRecognizer];
}

- (void)setNumberOfTouchesRequiredForPanningCrop:(int64_t)a3
{
  if (self->_numberOfTouchesRequiredForPanningCrop != a3)
  {
    self->_numberOfTouchesRequiredForPanningCrop = a3;
    [(SSSCropControllerRootView *)self setNeedsLayout];
  }
}

- (void)setCropEnabled:(BOOL)a3
{
  if ([(SSSCropControllerRootView *)self cropEnabled] != a3)
  {
    self->_cropEnabled = a3;
    [(SSSCropControllerRootView *)self setNeedsLayout];
  }
}

- (void)setSnapRects:(id)a3
{
  id v5 = a3;
  if ((-[NSArray isEqual:](self->_snapRects, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_snapRects, a3);
    [(SSSCropControllerRootView *)self setNeedsLayout];
  }
}

- (void)setCornerRadius:(double)a3
{
}

- (double)cornerRadius
{
  [(SSSScrollView *)self->_scrollView _cornerRadius];
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  -[SSSCropOverlayView convertPoint:fromView:](self->_overlayView, "convertPoint:fromView:", self, x, y);
  double v9 = v8;
  double v11 = v10;
  v14.receiver = self;
  v14.super_class = (Class)SSSCropControllerRootView;
  if (-[SSSCropControllerRootView pointInside:withEvent:](&v14, "pointInside:withEvent:", v7, x, y)) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = -[SSSCropOverlayView pointInside:withEvent:](self->_overlayView, "pointInside:withEvent:", v7, v9, v11);
  }

  return v12;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)SSSCropControllerRootView;
  id v7 = a4;
  double v8 = -[SSSCropControllerRootView hitTest:withEvent:](&v14, "hitTest:withEvent:", v7, x, y);
  -[SSSCropOverlayView convertPoint:fromView:](self->_overlayView, "convertPoint:fromView:", self, x, y, v14.receiver, v14.super_class);
  double v9 = -[SSSCropOverlayView hitTest:withEvent:](self->_overlayView, "hitTest:withEvent:", v7);

  double v10 = v9;
  if (v9
    || (-[SSSUncroppedOccludingView convertPoint:fromView:](self->_occludingView, "convertPoint:fromView:", self, x, y),
        unsigned int v11 = -[SSSUncroppedOccludingView pointCanPassthrough:](self->_occludingView, "pointCanPassthrough:"),
        double v10 = v8,
        v11))
  {
    id v12 = v10;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)setCornerGrabberAlpha:(double)a3
{
  self->_cornerGrabberAlpha = a3;
  -[SSSCropOverlayView setCornerGrabberAlpha:](self->_overlayView, "setCornerGrabberAlpha:");
}

- (void)setLineAlpha:(double)a3
{
  self->_lineAlpha = a3;
  -[SSSCropOverlayView setLineAlpha:](self->_overlayView, "setLineAlpha:");
}

- (void)setLineGrabberAlpha:(double)a3
{
  self->_lineGrabberAlpha = a3;
  -[SSSCropOverlayView setLineGrabberAlpha:](self->_overlayView, "setLineGrabberAlpha:");
}

- (CGRect)cropOverlayViewRectInWindow
{
  double v3 = [(SSSCropControllerRootView *)self window];
  [(SSSCropOverlayView *)self->_overlayView bounds];
  [v3 convertRect:self->_overlayView fromView:];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (SSSScreenshotContainerView)viewToCrop
{
  return self->_viewToCrop;
}

- (CGRect)cropRect
{
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)editMode
{
  return self->_editMode;
}

- (double)cornerGrabberAlpha
{
  return self->_cornerGrabberAlpha;
}

- (double)lineAlpha
{
  return self->_lineAlpha;
}

- (double)lineGrabberAlpha
{
  return self->_lineGrabberAlpha;
}

- (int64_t)numberOfTouchesRequiredForPanningCrop
{
  return self->_numberOfTouchesRequiredForPanningCrop;
}

- (BOOL)cropEnabled
{
  return self->_cropEnabled;
}

- (NSArray)snapRects
{
  return self->_snapRects;
}

- (SSSCropControllerRootViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSCropControllerRootViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showingPDF
{
  return self->_showingPDF;
}

- (void)setShowingPDF:(BOOL)a3
{
  self->_showingPDF = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapRects, 0);
  objc_storeStrong((id *)&self->_viewToCrop, 0);
  objc_storeStrong((id *)&self->_zoomInTimer, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_overlayViewResizeGesture, 0);
  objc_storeStrong((id *)&self->_occludingViewContainerView, 0);
  objc_storeStrong((id *)&self->_scrollViewContainerView, 0);
  objc_storeStrong((id *)&self->_occludingView, 0);

  objc_storeStrong((id *)&self->_overlayView, 0);
}

@end