@interface AVPlaybackContentContainerView
- (AVPlaybackContentContainerView)initWithFrame:(CGRect)a3 activeContentView:(id)a4;
- (AVPlaybackContentContainerView)initWithFrame:(CGRect)a3 playerLayerView:(id)a4 contentOverlayView:(id)a5;
- (AVStatusBarBackgroundGradientView)statusBarBackgroundGradientView;
- (AVVisualAnalysisView)visualAnalysisView;
- (BOOL)canShowStatusBarBackgroundGradientWhenStatusBarVisible;
- (BOOL)isObservingStatusBarHidden;
- (BOOL)isPlayingOnSecondScreen;
- (CGRect)videoContentFrame;
- (UIView)contentOverlayView;
- (UIView)contentOverlayViewSubview;
- (__AVPlayerLayerView)playerLayerView;
- (double)_frameForStatusBarBackgroundGradientView;
- (void)_updateStatusBarBackgroundGradientViewAlpha;
- (void)_updateVisualAnalysisViewFrameIfNeeded;
- (void)dealloc;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)removeAllSublayerTransformAnimations;
- (void)setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:(BOOL)a3;
- (void)setContentOverlayViewSubview:(id)a3;
- (void)setObservingStatusBarHidden:(BOOL)a3;
- (void)setPlayerLayerView:(id)a3;
- (void)setPlayingOnSecondScreen:(BOOL)a3;
- (void)setVideoContentFrame:(CGRect)a3;
- (void)setVideoGravity:(int64_t)a3 removingAllSublayerTransformAnimations:(BOOL)a4;
- (void)setVisualAnalysisView:(id)a3;
@end

@implementation AVPlaybackContentContainerView

- (AVPlaybackContentContainerView)initWithFrame:(CGRect)a3 playerLayerView:(id)a4 contentOverlayView:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVPlaybackContentContainerView;
  v14 = -[AVPlaybackContentContainerView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    [(AVPlaybackContentContainerView *)v14 setInsetsLayoutMarginsFromSafeArea:0];
    v15->_videoContentFrame.origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
    v15->_videoContentFrame.size.double width = width;
    v15->_videoContentFrame.size.double height = height;
    objc_storeStrong((id *)&v15->_playerLayerView, a4);
    if ([(AVPlaybackContentContainerView *)v15 isPlayingOnSecondScreen]) {
      [(AVPlaybackContentContainerView *)v15 bounds];
    }
    else {
      [(AVPlaybackContentContainerView *)v15 videoContentFrame];
    }
    objc_msgSend(v12, "setFrame:");
    v16 = v13;
    if (!v13)
    {
      id v17 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      if ([(AVPlaybackContentContainerView *)v15 isPlayingOnSecondScreen]) {
        [(AVPlaybackContentContainerView *)v15 bounds];
      }
      else {
        [(AVPlaybackContentContainerView *)v15 videoContentFrame];
      }
      v16 = objc_msgSend(v17, "initWithFrame:");
    }
    objc_storeStrong((id *)&v15->_contentOverlayView, v16);
    if (!v13) {
  }
    }
  return v15;
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

- (BOOL)isPlayingOnSecondScreen
{
  return self->_playingOnSecondScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarBackgroundGradientView, 0);
  objc_storeStrong((id *)&self->_contentOverlayViewSubview, 0);
  objc_storeStrong((id *)&self->_contentOverlayView, 0);
  objc_storeStrong((id *)&self->_playerLayerView, 0);

  objc_storeStrong((id *)&self->_visualAnalysisView, 0);
}

- (void)setObservingStatusBarHidden:(BOOL)a3
{
  self->_observingStatusBarHidden = a3;
}

- (BOOL)isObservingStatusBarHidden
{
  return self->_observingStatusBarHidden;
}

- (AVStatusBarBackgroundGradientView)statusBarBackgroundGradientView
{
  return self->_statusBarBackgroundGradientView;
}

- (BOOL)canShowStatusBarBackgroundGradientWhenStatusBarVisible
{
  return self->_canShowStatusBarBackgroundGradientWhenStatusBarVisible;
}

- (UIView)contentOverlayViewSubview
{
  return self->_contentOverlayViewSubview;
}

- (UIView)contentOverlayView
{
  return self->_contentOverlayView;
}

- (__AVPlayerLayerView)playerLayerView
{
  return self->_playerLayerView;
}

- (void)setPlayingOnSecondScreen:(BOOL)a3
{
  self->_playingOnSecondScreen = a3;
}

- (AVVisualAnalysisView)visualAnalysisView
{
  return self->_visualAnalysisView;
}

- (void)_updateStatusBarBackgroundGradientViewAlpha
{
  if (![(AVPlaybackContentContainerView *)self canShowStatusBarBackgroundGradientWhenStatusBarVisible]&& !self->_statusBarBackgroundGradientView)
  {
    return;
  }
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __77__AVPlaybackContentContainerView__updateStatusBarBackgroundGradientViewAlpha__block_invoke;
  v44[3] = &unk_1E5FC4698;
  v44[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v44];
  v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 nativeBounds];
  double v6 = v5;

  v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v7 nativeBounds];
  double v9 = v8;

  if (v6 >= v9) {
    double v10 = v6;
  }
  else {
    double v10 = v9;
  }
  v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v11 bounds];
  double v13 = v12;

  v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v14 bounds];
  double v16 = v15;

  if (v13 >= v16) {
    double v17 = v13;
  }
  else {
    double v17 = v16;
  }
  v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
  objc_super v19 = [v18 traitCollection];
  [v19 displayScale];
  double v21 = v20;

  v22 = (id *)MEMORY[0x1E4FB2608];
  if ([(id)*MEMORY[0x1E4FB2608] _isClassic]) {
    BOOL v23 = [*v22 _classicMode] != 5;
  }
  else {
    BOOL v23 = 0;
  }
  double v24 = 0.0;
  if ([(AVPlaybackContentContainerView *)self canShowStatusBarBackgroundGradientWhenStatusBarVisible])
  {
    v25 = [(AVPlaybackContentContainerView *)self window];
    v26 = [v25 windowScene];
    v27 = [v26 statusBarManager];
    if (![v27 isStatusBarHidden])
    {
      double v28 = v17 * v21;
      if (v23)
      {
        v2 = [(AVPlaybackContentContainerView *)self traitCollection];
        [v2 displayCornerRadius];
        if (v29 != 0.0 || v10 != v28)
        {
LABEL_21:

          goto LABEL_22;
        }
LABEL_19:
        v30 = [(AVPlaybackContentContainerView *)self window];
        v31 = [v30 screen];
        v32 = [MEMORY[0x1E4FB1BA8] mainScreen];
        if (v31 == v32)
        {
          v43 = [(AVPlaybackContentContainerView *)self window];
          [v43 windowLevel];
          if (v35 >= *MEMORY[0x1E4FB3118])
          {
            BOOL v37 = 0;
          }
          else
          {
            v42 = [(AVPlaybackContentContainerView *)self window];
            v41 = [v42 windowScene];
            v36 = [v41 statusBarManager];
            BOOL v40 = [v36 statusBarStyle] == 1;

            BOOL v37 = v40;
          }

          if (v23)
          {

            if (!v37) {
              goto LABEL_23;
            }
          }
          else
          {

            if (!v37) {
              goto LABEL_23;
            }
          }
          if (self->_statusBarBackgroundGradientView)
          {
            double v24 = 0.4;
          }
          else
          {
            v38 = -[AVStatusBarBackgroundGradientView initWithFrame:]([AVStatusBarBackgroundGradientView alloc], "initWithFrame:", -[AVPlaybackContentContainerView _frameForStatusBarBackgroundGradientView](self));
            statusBarBackgroundGradientView = self->_statusBarBackgroundGradientView;
            self->_statusBarBackgroundGradientView = v38;

            double v24 = 0.4;
            [(AVStatusBarBackgroundGradientView *)self->_statusBarBackgroundGradientView setAlpha:0.4];
            [(AVStatusBarBackgroundGradientView *)self->_statusBarBackgroundGradientView setUserInteractionEnabled:0];
          }
          goto LABEL_23;
        }

        if (!v23) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }
      if (v10 == v28) {
        goto LABEL_19;
      }
    }
LABEL_22:
  }
LABEL_23:
  if ([(AVPlaybackContentContainerView *)self canShowStatusBarBackgroundGradientWhenStatusBarVisible])
  {
    if (![(AVPlaybackContentContainerView *)self isObservingStatusBarHidden])
    {
      [(AVPlaybackContentContainerView *)self setObservingStatusBarHidden:1];
      v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v33 addObserver:self selector:sel__updateStatusBarBackgroundGradientViewAlpha name:*MEMORY[0x1E4FB3170] object:*v22];
    }
  }
  v34 = [(AVPlaybackContentContainerView *)self statusBarBackgroundGradientView];
  [v34 setAlpha:v24];
}

void __77__AVPlaybackContentContainerView__updateStatusBarBackgroundGradientViewAlpha__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) statusBarBackgroundGradientView];
  [v2 setFrame:-[AVPlaybackContentContainerView _frameForStatusBarBackgroundGradientView](*(void **)(a1 + 32))];
}

- (double)_frameForStatusBarBackgroundGradientView
{
  if (!a1) {
    return 0.0;
  }
  if ([a1 isPlayingOnSecondScreen]) {
    [a1 bounds];
  }
  else {
    [a1 videoContentFrame];
  }
  double v6 = v2;
  CGFloat v7 = v3;
  CGFloat v8 = v4;
  CGFloat v30 = v5;
  double v9 = [a1 window];
  double v10 = [v9 windowScene];
  v11 = [v10 statusBarManager];
  [v11 statusBarFrame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = [a1 window];
  objc_msgSend(v20, "convertRect:toView:", a1, v13, v15, v17, v19);
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;

  if (([a1 isPlayingOnSecondScreen] & 1) == 0)
  {
    if ([a1 canShowStatusBarBackgroundGradientWhenStatusBarVisible])
    {
      v31.origin.double x = v22;
      v31.origin.double y = v24;
      v31.size.double width = v26;
      v31.size.double height = v28;
      v33.origin.double x = v6;
      v33.origin.double y = v7;
      v33.size.double width = v8;
      v33.size.double height = v30;
      if (CGRectIntersectsRect(v31, v33))
      {
        v32.origin.double x = v6;
        v32.origin.double y = v7;
        v32.size.double width = v8;
        v32.size.double height = v30;
        CGRectGetHeight(v32);
      }
    }
  }
  return v6;
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackContentContainerView;
  [(AVPlaybackContentContainerView *)&v3 didMoveToSuperview];
  [(AVPlaybackContentContainerView *)self _updateStatusBarBackgroundGradientViewAlpha];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)AVPlaybackContentContainerView;
  [(AVPlaybackContentContainerView *)&v3 didMoveToWindow];
  [(AVPlaybackContentContainerView *)self _updateStatusBarBackgroundGradientViewAlpha];
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)AVPlaybackContentContainerView;
  [(AVPlaybackContentContainerView *)&v28 layoutSubviews];
  objc_super v3 = [(AVPlaybackContentContainerView *)self playerLayerView];
  double v4 = [v3 window];
  if (v4)
  {
    double v5 = [(AVPlaybackContentContainerView *)self window];
    double v6 = [(AVPlaybackContentContainerView *)self playerLayerView];
    CGFloat v7 = [v6 window];
    BOOL v8 = v5 == v7;
  }
  else
  {
    BOOL v8 = 1;
  }

  double v9 = self->_statusBarBackgroundGradientView;
  if (v8)
  {
    double v10 = [(AVPlaybackContentContainerView *)self playerLayerView];
    [v10 setAutoresizingMask:0];

    v11 = [(AVPlaybackContentContainerView *)self playerLayerView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:1];

    double v12 = [(AVPlaybackContentContainerView *)self playerLayerView];
    if ([(AVPlaybackContentContainerView *)self isPlayingOnSecondScreen]) {
      [(AVPlaybackContentContainerView *)self bounds];
    }
    else {
      [(AVPlaybackContentContainerView *)self videoContentFrame];
    }
    objc_msgSend(v12, "setFrame:");
  }
  double v13 = [(AVPlaybackContentContainerView *)self contentOverlayView];
  [v13 setAutoresizingMask:0];

  double v14 = [(AVPlaybackContentContainerView *)self contentOverlayView];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:1];

  double v15 = [(AVPlaybackContentContainerView *)self contentOverlayView];
  [(AVPlaybackContentContainerView *)self bounds];
  objc_msgSend(v15, "setFrame:");

  double v16 = [(AVPlaybackContentContainerView *)self contentOverlayViewSubview];
  [v16 setAutoresizingMask:0];

  double v17 = [(AVPlaybackContentContainerView *)self contentOverlayViewSubview];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:1];

  double v18 = [(AVPlaybackContentContainerView *)self contentOverlayViewSubview];
  [(AVPlaybackContentContainerView *)self bounds];
  objc_msgSend(v18, "setFrame:");

  if (v9)
  {
    [(AVStatusBarBackgroundGradientView *)v9 setAutoresizingMask:0];
    [(AVStatusBarBackgroundGradientView *)v9 setTranslatesAutoresizingMaskIntoConstraints:1];
    -[AVStatusBarBackgroundGradientView setFrame:](v9, "setFrame:", -[AVPlaybackContentContainerView _frameForStatusBarBackgroundGradientView](self));
  }
  if (v8)
  {
    double v19 = [(AVPlaybackContentContainerView *)self playerLayerView];
    double v20 = [v19 superview];

    if (v20 != self)
    {
      double v21 = [(AVPlaybackContentContainerView *)self playerLayerView];
      [(AVPlaybackContentContainerView *)self insertSubview:v21 atIndex:0];
    }
  }
  CGFloat v22 = [(AVPlaybackContentContainerView *)self contentOverlayView];
  double v23 = [v22 superview];

  if (v23 != self)
  {
    CGFloat v24 = [(AVPlaybackContentContainerView *)self contentOverlayView];
    double v25 = [(AVPlaybackContentContainerView *)self subviews];
    -[AVPlaybackContentContainerView insertSubview:atIndex:](self, "insertSubview:atIndex:", v24, [v25 count]);
  }
  if (v9)
  {
    CGFloat v26 = [(AVStatusBarBackgroundGradientView *)v9 superview];

    if (v26 != self)
    {
      double v27 = [(AVPlaybackContentContainerView *)self subviews];
      -[AVPlaybackContentContainerView insertSubview:atIndex:](self, "insertSubview:atIndex:", v9, [v27 count]);
    }
  }
  -[AVPlaybackContentContainerView _updateVisualAnalysisViewFrameIfNeeded](self);
}

- (void)_updateVisualAnalysisViewFrameIfNeeded
{
  if (a1)
  {
    double v2 = (void *)a1[52];
    if (v2)
    {
      id v26 = v2;
      objc_super v3 = [a1 playerLayerView];
      double v4 = [v3 playerController];
      [v4 contentDimensions];
      double v6 = v5;
      double v8 = v7;

      [a1 bounds];
      double v24 = v9;
      double v25 = v10;
      double v12 = v11;
      double v14 = v13;
      double v15 = [a1 playerLayerView];
      int v16 = [v15 isVideoScaled];
      double v17 = *MEMORY[0x1E4F1DB28];
      double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      if (v8 != 0.0 && v6 != 0.0)
      {
        double v21 = v12 / v6;
        if (v12 / v6 >= v14 / v8) {
          double v22 = v12 / v6;
        }
        else {
          double v22 = v14 / v8;
        }
        if (v12 / v6 >= v14 / v8) {
          double v21 = v14 / v8;
        }
        if (v16) {
          double v21 = v22;
        }
        CGAffineTransformMakeScale(&v27, v21, v21);
        double v19 = v8 * v27.c + v27.a * v6;
        double v20 = v8 * v27.d + v27.b * v6;
        double v17 = v24 - (v19 - v12) * 0.5;
        double v18 = v25 - (v20 - v14) * 0.5;
      }

      double v23 = [a1 subviews];
      objc_msgSend(a1, "insertSubview:atIndex:", v26, objc_msgSend(v23, "count"));

      objc_msgSend(v26, "setFrame:", v17, v18, v19, v20);
    }
  }
}

- (void)removeAllSublayerTransformAnimations
{
  id v3 = [(AVPlaybackContentContainerView *)self playerLayerView];
  double v2 = [v3 layer];
  objc_msgSend(v2, "avkit_removeAllSublayerTransformAnimations");
}

- (void)setVideoGravity:(int64_t)a3 removingAllSublayerTransformAnimations:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(AVPlaybackContentContainerView *)self playerLayerView];
  [v7 setVideoGravity:a3];

  if (v4)
  {
    double v8 = [(AVPlaybackContentContainerView *)self playerLayerView];
    double v9 = [v8 layer];
    objc_msgSend(v9, "avkit_removeAllSublayerTransformAnimations");
  }

  -[AVPlaybackContentContainerView _updateVisualAnalysisViewFrameIfNeeded](self);
}

- (void)setContentOverlayViewSubview:(id)a3
{
  double v5 = (UIView *)a3;
  contentOverlayViewSubview = self->_contentOverlayViewSubview;
  if (contentOverlayViewSubview != v5)
  {
    double v9 = v5;
    [(UIView *)contentOverlayViewSubview removeFromSuperview];
    objc_storeStrong((id *)&self->_contentOverlayViewSubview, a3);
    double v5 = v9;
    if (v9)
    {
      double v7 = [(AVPlaybackContentContainerView *)self contentOverlayView];

      double v5 = v9;
      if (v7 != v9)
      {
        double v8 = [(AVPlaybackContentContainerView *)self contentOverlayView];
        [v8 addSubview:v9];

        [(AVPlaybackContentContainerView *)self setNeedsLayout];
        contentOverlayViewSubview = (UIView *)[(AVPlaybackContentContainerView *)self layoutIfNeeded];
        double v5 = v9;
      }
    }
  }

  MEMORY[0x1F41817F8](contentOverlayViewSubview, v5);
}

- (void)setCanShowStatusBarBackgroundGradientWhenStatusBarVisible:(BOOL)a3
{
  if (self->_canShowStatusBarBackgroundGradientWhenStatusBarVisible != a3)
  {
    self->_canShowStatusBarBackgroundGradientWhenStatusBarVisible = a3;
    if (a3)
    {
      BOOL v4 = [(AVPlaybackContentContainerView *)self statusBarBackgroundGradientView];
      [v4 setFrame:-[AVPlaybackContentContainerView _frameForStatusBarBackgroundGradientView](self)];
    }
    [(AVPlaybackContentContainerView *)self _updateStatusBarBackgroundGradientViewAlpha];
  }
}

- (void)setVideoContentFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_videoContentFrame = &self->_videoContentFrame;
  if (!CGRectEqualToRect(self->_videoContentFrame, a3))
  {
    p_videoContentFrame->origin.double x = x;
    p_videoContentFrame->origin.double y = y;
    p_videoContentFrame->size.double width = width;
    p_videoContentFrame->size.double height = height;
    double v9 = [(AVPlaybackContentContainerView *)self playerLayerView];
    uint64_t v10 = [v9 window];
    if (v10)
    {
      double v11 = (void *)v10;
      double v12 = [(AVPlaybackContentContainerView *)self window];
      double v13 = [(AVPlaybackContentContainerView *)self playerLayerView];
      double v14 = [v13 window];

      if (v12 != v14) {
        return;
      }
    }
    else
    {
    }
    double v15 = [(AVPlaybackContentContainerView *)self playerLayerView];
    objc_msgSend(v15, "setFrame:", x, y, width, height);

    int v16 = [(AVPlaybackContentContainerView *)self contentOverlayView];
    [(AVPlaybackContentContainerView *)self bounds];
    objc_msgSend(v16, "setFrame:");

    if (self->_statusBarBackgroundGradientView)
    {
      double v17 = -[AVPlaybackContentContainerView _frameForStatusBarBackgroundGradientView](self);
      statusBarBackgroundGradientView = self->_statusBarBackgroundGradientView;
      [(AVStatusBarBackgroundGradientView *)statusBarBackgroundGradientView setFrame:v17];
    }
  }
}

- (void)setVisualAnalysisView:(id)a3
{
  double v5 = (AVVisualAnalysisView *)a3;
  visualAnalysisView = self->_visualAnalysisView;
  if (visualAnalysisView != v5)
  {
    double v7 = v5;
    [(AVVisualAnalysisView *)visualAnalysisView removeFromSuperview];
    objc_storeStrong((id *)&self->_visualAnalysisView, a3);
    -[AVPlaybackContentContainerView _updateVisualAnalysisViewFrameIfNeeded](self);
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](visualAnalysisView, v5);
}

- (void)setPlayerLayerView:(id)a3
{
  double v5 = (__AVPlayerLayerView *)a3;
  playerLayerView = self->_playerLayerView;
  if (playerLayerView != v5)
  {
    double v8 = v5;
    if (playerLayerView)
    {
      double v7 = [(__AVPlayerLayerView *)playerLayerView superview];

      if (v7) {
        [(__AVPlayerLayerView *)self->_playerLayerView removeFromSuperview];
      }
    }
    objc_storeStrong((id *)&self->_playerLayerView, a3);
    playerLayerView = (__AVPlayerLayerView *)[(AVPlaybackContentContainerView *)self setNeedsLayout];
    double v5 = v8;
  }

  MEMORY[0x1F41817F8](playerLayerView, v5);
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB3170] object:*MEMORY[0x1E4FB2608]];

  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackContentContainerView;
  [(AVPlaybackContentContainerView *)&v4 dealloc];
}

- (AVPlaybackContentContainerView)initWithFrame:(CGRect)a3 activeContentView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  uint64_t v10 = [v9 playerLayerView];
  double v11 = [v9 contentOverlayView];

  double v12 = -[AVPlaybackContentContainerView initWithFrame:playerLayerView:contentOverlayView:](self, "initWithFrame:playerLayerView:contentOverlayView:", v10, v11, x, y, width, height);
  return v12;
}

@end