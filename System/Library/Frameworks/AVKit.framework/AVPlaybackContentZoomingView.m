@interface AVPlaybackContentZoomingView
- (AVCacheLargestInscribedRectInBoundingPath)cacheLargestInscribedRect;
- (AVPlaybackContentContainerView)activeContentView;
- (AVPlaybackContentZoomingView)initWithFrame:(CGRect)a3 activeContentView:(id)a4;
- (BOOL)canShowStatusBarBackgroundGradientWhenStatusBarVisible;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isFullScreen;
- (BOOL)isPlayingOnSecondScreen;
- (BOOL)isZoomingEnabled;
- (CGRect)_contentRectForScale:(double)a3;
- (CGRect)previousBounds;
- (CGRect)videoContentFrame;
- (CGSize)_contentSizeForScale:(double)a3;
- (CGSize)contentAspectRatio;
- (UIEdgeInsets)_contentInsets;
- (UIWindow)lastKnownWindow;
- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4;
- (void)_updateMinMaxZoomScales;
- (void)_updateMinMaxZoomScales:(BOOL)a3;
- (void)_updateZoomScaling;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setCacheLargestInscribedRect:(id)a3;
- (void)setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:(BOOL)a3;
- (void)setContentAspectRatio:(CGSize)a3;
- (void)setFrame:(CGRect)a3;
- (void)setFullScreen:(BOOL)a3;
- (void)setLastKnownWindow:(id)a3;
- (void)setPlayingOnSecondScreen:(BOOL)a3;
- (void)setPreviousBounds:(CGRect)a3;
- (void)setVideoContentFrame:(CGRect)a3;
- (void)setVideoGravity:(int64_t)a3 removingAllSublayerTransformAnimations:(BOOL)a4;
- (void)setZoomingEnabled:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
- (void)zoomToPoint:(CGPoint)a3;
@end

@implementation AVPlaybackContentZoomingView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheLargestInscribedRect, 0);
  objc_destroyWeak((id *)&self->_lastKnownWindow);

  objc_storeStrong((id *)&self->_activeContentView, 0);
}

- (void)setCacheLargestInscribedRect:(id)a3
{
}

- (AVCacheLargestInscribedRectInBoundingPath)cacheLargestInscribedRect
{
  return self->_cacheLargestInscribedRect;
}

- (UIWindow)lastKnownWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastKnownWindow);

  return (UIWindow *)WeakRetained;
}

- (void)setPreviousBounds:(CGRect)a3
{
  self->_previousBounds = a3;
}

- (CGRect)previousBounds
{
  double x = self->_previousBounds.origin.x;
  double y = self->_previousBounds.origin.y;
  double width = self->_previousBounds.size.width;
  double height = self->_previousBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFullScreen:(BOOL)a3
{
  self->_fullScreen = a3;
}

- (BOOL)isFullScreen
{
  return self->_fullScreen;
}

- (CGSize)contentAspectRatio
{
  double width = self->_contentAspectRatio.width;
  double height = self->_contentAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)isZoomingEnabled
{
  return self->_zoomingEnabled;
}

- (void)setVideoContentFrame:(CGRect)a3
{
  self->_videoContentFrame = a3;
}

- (CGRect)videoContentFrame
{
  double x = self->_videoContentFrame.origin.x;
  double y = self->_videoContentFrame.origin.y;
  double width = self->_videoContentFrame.size.width;
  double height = self->_videoContentFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPlayingOnSecondScreen:(BOOL)a3
{
  self->_playingOnSecondScreen = a3;
}

- (BOOL)isPlayingOnSecondScreen
{
  return self->_playingOnSecondScreen;
}

- (AVPlaybackContentContainerView)activeContentView
{
  return self->_activeContentView;
}

- (UIEdgeInsets)_contentInsets
{
  [(AVPlaybackContentZoomingView *)self zoomScale];
  -[AVPlaybackContentZoomingView _contentSizeForScale:](self, "_contentSizeForScale:");
  double v4 = v3;
  double v6 = v5;
  [(AVPlaybackContentZoomingView *)self bounds];
  double v8 = *MEMORY[0x1E4FB2848];
  double v9 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v11 = v10 - v4;
  if (v11 > 0.0) {
    double v9 = v11 * 0.5;
  }
  double v12 = v7 - v6;
  double v13 = (v7 - v6) * 0.5;
  if (v12 > 0.0) {
    double v8 = v13;
  }
  double v14 = v8;
  double v15 = v9;
  result.right = v15;
  result.bottom = v14;
  result.left = v9;
  result.top = v8;
  return result;
}

- (void)_updateMinMaxZoomScales:(BOOL)a3
{
  [(AVPlaybackContentZoomingView *)self _contentSizeForScale:1.0];
  double v6 = v5;
  double v8 = v7;
  double v9 = 1.0;
  if ([(AVPlaybackContentZoomingView *)self isZoomingEnabled] && v6 > 0.0 && v8 > 0.0)
  {
    [(AVPlaybackContentZoomingView *)self bounds];
    CGFloat Width = CGRectGetWidth(v23);
    double v9 = (Width + Width) / v6;
    [(AVPlaybackContentZoomingView *)self bounds];
    CGFloat Height = CGRectGetHeight(v24);
    double v12 = (Height + Height) / v8;
    if (v9 < v12) {
      double v9 = v12;
    }
    [(AVPlaybackContentZoomingView *)self bounds];
    CGFloat v13 = CGRectGetWidth(v25);
    double v14 = (v13 + v13) / v8;
    [(AVPlaybackContentZoomingView *)self bounds];
    CGFloat v15 = CGRectGetHeight(v26);
    double v16 = (v15 + v15) / v6;
    if (v14 >= v16) {
      double v16 = v14;
    }
    if (v9 < v16) {
      double v9 = v16;
    }
  }
  [(AVPlaybackContentZoomingView *)self minimumZoomScale];
  if (v17 != 1.0) {
    [(AVPlaybackContentZoomingView *)self setMinimumZoomScale:1.0];
  }
  [(AVPlaybackContentZoomingView *)self maximumZoomScale];
  if (v18 != v9)
  {
    [(AVPlaybackContentZoomingView *)self zoomScale];
    if (a3 || (double v20 = v19, [(UIView *)self avkit_isBeingDismissed])) {
      double v20 = 1.0;
    }
    [(AVPlaybackContentZoomingView *)self setMaximumZoomScale:v9];
    [(AVPlaybackContentZoomingView *)self zoomScale];
    if (v20 != v21)
    {
      [(AVPlaybackContentZoomingView *)self setZoomScale:v20];
    }
  }
}

- (void)_updateMinMaxZoomScales
{
}

- (CGRect)_contentRectForScale:(double)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  [(AVPlaybackContentZoomingView *)self _contentSizeForScale:a3];
  double v6 = v5;
  double v8 = v7;
  double v9 = v3;
  double v10 = v4;
  result.size.double height = v8;
  result.size.double width = v6;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGSize)_contentSizeForScale:(double)a3
{
  double v5 = (double *)MEMORY[0x1E4F1DB30];
  BOOL v6 = [(UIView *)self avkit_hasFullScreenLayoutClass];
  double v7 = [(AVPlaybackContentZoomingView *)self lastKnownWindow];
  double v8 = v7;
  if (!v7 || !v6)
  {

LABEL_29:
    [(AVPlaybackContentZoomingView *)self contentAspectRatio];
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    [(AVPlaybackContentZoomingView *)self bounds];
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    v62.double width = v41;
    v62.double height = v43;
    v67.origin.CGFloat x = v45;
    v67.origin.CGFloat y = v47;
    v67.size.double width = v49;
    v67.size.double height = v51;
    CGRect v64 = AVMakeRectWithAspectRatioInsideRect(v62, v67);
    CGFloat x = v64.origin.x;
    CGFloat y = v64.origin.y;
    double width = v64.size.width;
    double height = v64.size.height;
    goto LABEL_30;
  }
  [(AVPlaybackContentZoomingView *)self contentAspectRatio];
  uint64_t v11 = v10;
  unint64_t v12 = v10 - 1;
  unint64_t v13 = ((v10 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53;
  BOOL v16 = ((v9 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 < 0x3FF && v9 >= 0
     || (unint64_t)(v9 - 1) < 0xFFFFFFFFFFFFFLL;

  BOOL v18 = (v11 < 0 || v13 > 0x3FE) && v12 > 0xFFFFFFFFFFFFELL;
  if (v18 || !v16) {
    goto LABEL_29;
  }
  [(AVPlaybackContentZoomingView *)self contentAspectRatio];
  double v20 = v19;
  [(AVPlaybackContentZoomingView *)self contentAspectRatio];
  double v22 = v20 / v21;
  if ([(UIView *)self avkit_isCounterRotatedForTransition]) {
    double v22 = 1.0 / v22;
  }
  CGRect v23 = [(AVPlaybackContentZoomingView *)self lastKnownWindow];
  [v23 bounds];
  UIRectGetCenter();
  double v25 = v24;
  double v27 = v26;

  cacheLargestInscribedRect = self->_cacheLargestInscribedRect;
  v29 = [(AVPlaybackContentZoomingView *)self lastKnownWindow];
  -[AVCacheLargestInscribedRectInBoundingPath getLargestInscribableRectForView:withCenter:aspectRatio:](cacheLargestInscribedRect, "getLargestInscribableRectForView:withCenter:aspectRatio:", v29, v25, v27, v22);
  CGFloat x = v30;
  CGFloat y = v32;
  double width = v34;
  double v37 = v36;

  BOOL v38 = [(UIView *)self avkit_isCounterRotatedForTransition];
  if (v38) {
    double height = width;
  }
  else {
    double height = v37;
  }
  if (v38) {
    double width = v37;
  }
LABEL_30:
  double v52 = *v5;
  double v53 = v5[1];
  v65.origin.CGFloat x = x;
  v65.origin.CGFloat y = y;
  v65.size.double width = width;
  v65.size.double height = height;
  if (!CGRectIsInfinite(v65))
  {
    v66.origin.CGFloat x = x;
    v66.origin.CGFloat y = y;
    v66.size.double width = width;
    v66.size.double height = height;
    if (!CGRectIsNull(v66))
    {
      v54 = self;
      UIPointRoundToViewScale();
      UISizeRoundToViewScale();
      double v56 = v55;
      double v58 = v57;

      CGAffineTransformMakeScale(&v61, a3, a3);
      double v52 = v58 * v61.c + v61.a * v56;
      double v53 = v58 * v61.d + v61.b * v56;
    }
  }
  double v59 = v52;
  double v60 = v53;
  result.double height = v60;
  result.double width = v59;
  return result;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)AVPlaybackContentZoomingView;
  [(AVPlaybackContentZoomingView *)&v18 layoutSubviews];
  double v3 = [(AVPlaybackContentZoomingView *)self activeContentView];
  [(AVPlaybackContentZoomingView *)self zoomScale];
  -[AVPlaybackContentZoomingView _contentRectForScale:](self, "_contentRectForScale:");
  objc_msgSend(v3, "setFrame:");

  double v4 = [(AVPlaybackContentZoomingView *)self activeContentView];
  double v5 = [(AVPlaybackContentZoomingView *)self activeContentView];
  [v5 bounds];
  objc_msgSend(v4, "setVideoContentFrame:");

  [(AVPlaybackContentZoomingView *)self _contentInsets];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [(AVPlaybackContentZoomingView *)self contentInset];
  if (v9 != v17 || v7 != v14 || v13 != v16 || v11 != v15)
  {
    [(AVPlaybackContentZoomingView *)self _contentInsets];
    -[AVPlaybackContentZoomingView setContentInset:](self, "setContentInset:");
  }
}

- (void)didMoveToWindow
{
  double v3 = [(AVPlaybackContentZoomingView *)self window];
  if (v3)
  {
    id v4 = v3;
    [v3 _addBoundingPathChangeObserver:self];
    double v3 = v4;
  }
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)AVPlaybackContentZoomingView;
  [(AVPlaybackContentZoomingView *)&v7 willMoveToWindow:v4];
  double v5 = [(AVPlaybackContentZoomingView *)self window];
  double v6 = v5;
  if (v5) {
    [v5 _removeBoundingPathChangeObserver:self];
  }
  if (v4) {
    [(AVPlaybackContentZoomingView *)self setLastKnownWindow:v4];
  }
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(AVPlaybackContentZoomingView *)self frame];
  double v10 = v8;
  double v11 = v9;
  BOOL v12 = v8 < width;
  if (v9 <= height) {
    BOOL v12 = 0;
  }
  uint64_t v14 = v8 > width && v9 < height || v12;
  v16.receiver = self;
  v16.super_class = (Class)AVPlaybackContentZoomingView;
  -[AVPlaybackContentZoomingView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  if (v10 != width || v11 != height) {
    [(AVPlaybackContentZoomingView *)self _updateMinMaxZoomScales:v14];
  }
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  [(AVCacheLargestInscribedRectInBoundingPath *)self->_cacheLargestInscribedRect clearCache];

  -[AVPlaybackContentZoomingView _updateZoomScaling](self);
}

- (void)_updateZoomScaling
{
  if (result)
  {
    v1 = result;
    [result _updateMinMaxZoomScales];
    [v1 zoomScale];
    objc_msgSend(v1, "_contentSizeForScale:");
    objc_msgSend(v1, "setContentSize:");
    return (void *)[v1 setNeedsLayout];
  }
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AVPlaybackContentZoomingView;
  if (![(AVPlaybackContentZoomingView *)&v14 gestureRecognizerShouldBegin:v4]) {
    goto LABEL_10;
  }
  if (![(AVPlaybackContentZoomingView *)self isFullScreen]) {
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v4 velocity];
      if (v9 < 0.0)
      {
        [(AVPlaybackContentZoomingView *)self zoomScale];
        double v11 = v10;
        [(AVPlaybackContentZoomingView *)self minimumZoomScale];
        if (v11 == v12) {
          goto LABEL_10;
        }
      }
    }
LABEL_11:
    BOOL v8 = 1;
    goto LABEL_12;
  }
  [v4 translationInView:0];
  if (v5 <= 0.0) {
    goto LABEL_11;
  }
  [(AVPlaybackContentZoomingView *)self contentInset];
  if (v6 != 0.0)
  {
LABEL_10:
    BOOL v8 = 0;
    goto LABEL_12;
  }
  [(AVPlaybackContentZoomingView *)self contentOffset];
  BOOL v8 = v7 != 0.0;
LABEL_12:

  return v8;
}

- (void)scrollViewDidZoom:(id)a3
{
  [a3 zoomScale];
  [(AVPlaybackContentZoomingView *)self setScrollEnabled:v4 != 1.0];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 postNotificationName:@"AVPlayerViewControllerContentViewUpdateContentIntersectionNotification" object:self];
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  -[AVPlaybackContentZoomingView setScrollEnabled:](self, "setScrollEnabled:", a5 != 1.0, a4);
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 postNotificationName:@"AVPlayerViewControllerContentViewUpdateContentIntersectionNotification" object:self];
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  -[AVPlaybackContentZoomingView setAlwaysBounceVertical:](self, "setAlwaysBounceVertical:", 1, a4);
  [(AVPlaybackContentZoomingView *)self setAlwaysBounceHorizontal:1];
  [(AVPlaybackContentZoomingView *)self setBouncesHorizontally:1];

  [(AVPlaybackContentZoomingView *)self setBouncesVertically:1];
}

- (void)zoomToPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  [(AVPlaybackContentZoomingView *)self zoomScale];
  if (v6 == 1.0)
  {
    double v7 = [(AVPlaybackContentZoomingView *)self activeContentView];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    objc_super v16 = [(AVPlaybackContentZoomingView *)self activeContentView];
    objc_msgSend(v16, "convertPoint:fromView:", self, x, y);
    double v18 = v17;
    double v40 = v19;
    double v41 = v17;
    double v20 = v19;

    v43.origin.double x = v9;
    v43.origin.double y = v11;
    v43.size.double width = v13;
    v43.size.double height = v15;
    double v39 = fmin(fmax((v18 - v9) / CGRectGetWidth(v43), 0.0), 1.0);
    v44.origin.double x = v9;
    v44.origin.double y = v11;
    v44.size.double width = v13;
    v44.size.double height = v15;
    double v38 = fmin(fmax((v20 - v11) / CGRectGetHeight(v44), 0.0), 1.0);
    [(AVPlaybackContentZoomingView *)self maximumZoomScale];
    double v22 = v21;
    [(AVPlaybackContentZoomingView *)self minimumZoomScale];
    double v24 = (v22 - v23) * 0.5;
    [(AVPlaybackContentZoomingView *)self bounds];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    if (v24 <= 0.0) {
      double v33 = 1.0;
    }
    else {
      double v33 = 1.0 / (v24 + 1.0);
    }
    CGAffineTransformMakeScale(&v42, v33, v33);
    v45.origin.double x = v26;
    v45.origin.double y = v28;
    v45.size.double width = v30;
    v45.size.double height = v32;
    CGRect v46 = CGRectApplyAffineTransform(v45, &v42);
    CGFloat v34 = v46.origin.y;
    double width = v46.size.width;
    double height = v46.size.height;
    v47.origin.double x = v41 - CGRectGetWidth(v46) * v39;
    v47.origin.double y = v34;
    v47.size.double width = width;
    v47.size.double height = height;
    -[AVPlaybackContentZoomingView zoomToRect:animated:](self, "zoomToRect:animated:", 0, v47.origin.x, v40 - CGRectGetHeight(v47) * v38, width, height);
  }
  else
  {
    [(AVPlaybackContentZoomingView *)self setZoomScale:1.0];
  }
  [(AVPlaybackContentZoomingView *)self setNeedsLayout];
  [(AVPlaybackContentZoomingView *)self layoutIfNeeded];
  double v37 = [(AVPlaybackContentZoomingView *)self activeContentView];
  [v37 removeAllSublayerTransformAnimations];
}

- (void)setZoomingEnabled:(BOOL)a3
{
  if (self->_zoomingEnabled != a3)
  {
    self->_zoomingEnabled = a3;
    [(AVPlaybackContentZoomingView *)self _updateMinMaxZoomScales];
  }
}

- (void)setContentAspectRatio:(CGSize)a3
{
  if (a3.width != self->_contentAspectRatio.width || a3.height != self->_contentAspectRatio.height)
  {
    self->_contentAspectRatio = a3;
    [(AVPlaybackContentZoomingView *)self _updateMinMaxZoomScales];
    [(AVPlaybackContentZoomingView *)self zoomScale];
    -[AVPlaybackContentZoomingView _contentSizeForScale:](self, "_contentSizeForScale:");
    -[AVPlaybackContentZoomingView setContentSize:](self, "setContentSize:");
    [(AVPlaybackContentZoomingView *)self setNeedsLayout];
  }
}

- (void)setVideoGravity:(int64_t)a3 removingAllSublayerTransformAnimations:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AVPlaybackContentZoomingView *)self activeContentView];
  [v6 setVideoGravity:a3 removingAllSublayerTransformAnimations:v4];
}

- (void)setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVPlaybackContentZoomingView *)self activeContentView];
  [v4 setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:v3];
}

- (BOOL)canShowStatusBarBackgroundGradientWhenStatusBarVisible
{
  v2 = [(AVPlaybackContentZoomingView *)self activeContentView];
  char v3 = [v2 canShowStatusBarBackgroundGradientWhenStatusBarVisible];

  return v3;
}

- (void)setLastKnownWindow:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastKnownWindow);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_lastKnownWindow, v4);
    if (v4)
    {
      [(AVPlaybackContentZoomingView *)self setNeedsLayout];
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __51__AVPlaybackContentZoomingView_setLastKnownWindow___block_invoke;
      v6[3] = &unk_1E5FC4698;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v6];
    }
  }
}

uint64_t __51__AVPlaybackContentZoomingView_setLastKnownWindow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (AVPlaybackContentZoomingView)initWithFrame:(CGRect)a3 activeContentView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)AVPlaybackContentZoomingView;
  double v11 = -[AVPlaybackContentZoomingView initWithFrame:](&v18, sel_initWithFrame_, x, y, width, height);
  double v12 = v11;
  if (v11)
  {
    [(AVPlaybackContentZoomingView *)v11 setContentInsetAdjustmentBehavior:2];
    uint64_t v13 = objc_opt_new();
    cacheLargestInscribedRect = v12->_cacheLargestInscribedRect;
    v12->_cacheLargestInscribedRect = (AVCacheLargestInscribedRectInBoundingPath *)v13;

    objc_storeStrong((id *)&v12->_activeContentView, a4);
    v12->_contentAspectRatio = (CGSize)xmmword_1B07212E0;
    [(AVPlaybackContentZoomingView *)v12 setBouncesZoom:1];
    [(AVPlaybackContentZoomingView *)v12 setShowsVerticalScrollIndicator:0];
    [(AVPlaybackContentZoomingView *)v12 setShowsHorizontalScrollIndicator:0];
    [(AVPlaybackContentZoomingView *)v12 _updateMinMaxZoomScales];
    [(AVPlaybackContentZoomingView *)v12 _contentRectForScale:1.0];
    objc_msgSend(v10, "setFrame:");
    [(AVPlaybackContentZoomingView *)v12 addSubview:v10];
    [(AVPlaybackContentZoomingView *)v12 setDelegate:v12];
    [(AVPlaybackContentZoomingView *)v12 setDecelerationRate:*MEMORY[0x1E4FB2EE8]];
    [(AVPlaybackContentZoomingView *)v12 zoomScale];
    [(AVPlaybackContentZoomingView *)v12 setScrollEnabled:v15 != 1.0];
    objc_super v16 = [v10 backgroundColor];
    [(AVPlaybackContentZoomingView *)v12 setBackgroundColor:v16];
  }
  return v12;
}

@end