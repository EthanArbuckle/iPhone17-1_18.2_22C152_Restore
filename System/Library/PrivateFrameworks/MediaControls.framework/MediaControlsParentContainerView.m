@interface MediaControlsParentContainerView
- (MediaControlsContainerView)containerView;
- (MediaControlsParentContainerView)initWithFrame:(CGRect)a3;
- (MediaControlsSeparatorView)bottomDividerView;
- (MediaControlsSeparatorView)topDividerView;
- (MediaControlsTimeControl)timeControl;
- (MediaControlsTransportStackView)transportStackView;
- (UIView)mediaControlsRoutingPickerView;
- (UIView)routingView;
- (int64_t)routingViewControllerAnimationCount;
- (int64_t)selectedMode;
- (int64_t)style;
- (void)_setInitialFrameForRoutingView:(id)a3;
- (void)_toggleRoutingPickerAnimated:(BOOL)a3;
- (void)_updateRoutingPickerVisibilityAnimated:(BOOL)a3;
- (void)_updateTimeControlVisibility:(id)a3;
- (void)didMoveToWindow;
- (void)handleHoverGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)setBottomDividerView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setMediaControlsRoutingPickerView:(id)a3;
- (void)setRoutingView:(id)a3;
- (void)setRoutingViewControllerAnimationCount:(int64_t)a3;
- (void)setSelectedMode:(int64_t)a3;
- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setStyle:(int64_t)a3;
- (void)setTimeControl:(id)a3;
- (void)setTopDividerView:(id)a3;
- (void)setTransportStackView:(id)a3;
@end

@implementation MediaControlsParentContainerView

- (MediaControlsParentContainerView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)MediaControlsParentContainerView;
  v3 = -[MediaControlsParentContainerView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MediaControlsContainerView alloc];
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v9 = -[MediaControlsContainerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    containerView = v3->_containerView;
    v3->_containerView = (MediaControlsContainerView *)v9;

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
    mediaControlsRoutingPickerView = v3->_mediaControlsRoutingPickerView;
    v3->_mediaControlsRoutingPickerView = (UIView *)v11;

    v13 = -[MediaControlsSeparatorView initWithFrame:]([MediaControlsSeparatorView alloc], "initWithFrame:", v5, v6, v7, v8);
    topDividerView = v3->_topDividerView;
    v3->_topDividerView = v13;

    v15 = -[MediaControlsSeparatorView initWithFrame:]([MediaControlsSeparatorView alloc], "initWithFrame:", v5, v6, v7, v8);
    bottomDividerView = v3->_bottomDividerView;
    v3->_bottomDividerView = v15;

    v3->_routingViewControllerAnimationCount = 0;
    v17 = [(MediaControlsParentContainerView *)v3 containerView];
    [(MediaControlsParentContainerView *)v3 addSubview:v17];

    v18 = [(MediaControlsParentContainerView *)v3 mediaControlsRoutingPickerView];
    [(MediaControlsParentContainerView *)v3 addSubview:v18];

    v19 = [(MediaControlsParentContainerView *)v3 topDividerView];
    [(MediaControlsParentContainerView *)v3 addSubview:v19];

    v20 = [(MediaControlsParentContainerView *)v3 bottomDividerView];
    [(MediaControlsParentContainerView *)v3 addSubview:v20];

    [(MediaControlsParentContainerView *)v3 setClipsToBounds:1];
    v21 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v22 = [v21 userInterfaceIdiom];

    if (v22 == 1)
    {
      v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1800]) initWithTarget:v3 action:sel_handleHoverGestureRecognizer_];
      [(MediaControlsParentContainerView *)v3 addGestureRecognizer:v23];
    }
  }
  return v3;
}

- (void)layoutSubviews
{
  v53.receiver = self;
  v53.super_class = (Class)MediaControlsParentContainerView;
  [(MediaControlsParentContainerView *)&v53 layoutSubviews];
  v3 = [(MediaControlsParentContainerView *)self traitCollection];
  [v3 displayScale];

  MPFloatGetSafeScaleForValue();
  double v5 = v4;
  [(MediaControlsParentContainerView *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  int64_t v14 = [(MediaControlsParentContainerView *)self selectedMode];
  unint64_t style = self->_style;
  BOOL v16 = style > 5;
  uint64_t v17 = (1 << style) & 0x29;
  if (v16 || v17 == 0)
  {
    v43 = [(MediaControlsParentContainerView *)self containerView];
    objc_msgSend(v43, "setFrame:", v7, v9, v11, v13);

    v37 = [(MediaControlsParentContainerView *)self mediaControlsRoutingPickerView];
    v38 = v37;
    double v39 = v7;
    double v40 = v9;
    double v41 = v11;
    double v42 = v13;
  }
  else
  {
    double v19 = v7 + 0.0;
    if (v14 != 1) {
      double v19 = v7;
    }
    double v51 = v19;
    UIRectIntegralWithScale();
    double v21 = v20;
    double v23 = v22;
    double v52 = v5;
    double v25 = v24;
    double v27 = v26;
    v28 = [(MediaControlsParentContainerView *)self containerView];
    objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

    UIRectIntegralWithScale();
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v37 = [(MediaControlsParentContainerView *)self mediaControlsRoutingPickerView];
    v38 = v37;
    double v39 = v30;
    double v5 = v52;
    double v40 = v32;
    double v41 = v34;
    double v42 = v36;
  }
  objc_msgSend(v37, "setFrame:", v39, v40, v41, v42, *(void *)&v51);

  if (v5 >= 1.0) {
    double v44 = 1.0 / v5;
  }
  else {
    double v44 = 1.0;
  }
  [(MediaControlsParentContainerView *)self bounds];
  double MinY = CGRectGetMinY(v54);
  [(MediaControlsParentContainerView *)self bounds];
  double Width = CGRectGetWidth(v55);
  v47 = [(MediaControlsParentContainerView *)self topDividerView];
  objc_msgSend(v47, "setFrame:", 0.0, MinY, Width, v44);

  [(MediaControlsParentContainerView *)self bounds];
  CGFloat v48 = CGRectGetMaxY(v56) - v44;
  [(MediaControlsParentContainerView *)self bounds];
  double v49 = CGRectGetWidth(v57);
  v50 = [(MediaControlsParentContainerView *)self bottomDividerView];
  objc_msgSend(v50, "setFrame:", 0.0, v48, v49, v44);
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MediaControlsParentContainerView;
  [(MediaControlsParentContainerView *)&v3 didMoveToWindow];
  [(MediaControlsParentContainerView *)self _updateTimeControlVisibility:@"didMoveToWindow"];
}

- (void)setStyle:(int64_t)a3
{
  double v5 = [(MediaControlsParentContainerView *)self containerView];
  [v5 setStyle:a3];

  if (self->_style != a3)
  {
    self->_unint64_t style = a3;
    [(MediaControlsParentContainerView *)self _updateRoutingPickerVisibilityAnimated:0];
    [(MediaControlsParentContainerView *)self _updateTimeControlVisibility:@"setStyle"];
    [(MediaControlsParentContainerView *)self setNeedsLayout];
  }
}

- (void)setSelectedMode:(int64_t)a3
{
}

- (void)setSelectedMode:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_selectedMode != a3)
  {
    BOOL v4 = a4;
    self->_selectedMode = a3;
    [(MediaControlsParentContainerView *)self _updateTimeControlVisibility:@"setSelectedMode"];
    [(MediaControlsParentContainerView *)self _toggleRoutingPickerAnimated:v4];
  }
}

- (MediaControlsTransportStackView)transportStackView
{
  return [(MediaControlsContainerView *)self->_containerView transportStackView];
}

- (void)setTransportStackView:(id)a3
{
}

- (MediaControlsTimeControl)timeControl
{
  return [(MediaControlsContainerView *)self->_containerView timeControl];
}

- (void)setTimeControl:(id)a3
{
}

- (void)_updateRoutingPickerVisibilityAnimated:(BOOL)a3
{
  int64_t v5 = [(MediaControlsParentContainerView *)self selectedMode];
  if (!a3)
  {
    double v6 = [(MediaControlsParentContainerView *)self mediaControlsRoutingPickerView];
    [v6 setHidden:v5 != 1];
  }
  if (v5 == 1) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  id v8 = [(MediaControlsParentContainerView *)self containerView];
  [v8 setAlpha:v7];
}

- (void)_updateTimeControlVisibility:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MediaControlsParentContainerView *)self _isInAWindow])
  {
    BOOL v5 = ![(MediaControlsParentContainerView *)self selectedMode]
      && (![(MediaControlsParentContainerView *)self style]
       || [(MediaControlsParentContainerView *)self style] == 4)
      || [(MediaControlsParentContainerView *)self style] == 3;
    double v6 = [(MediaControlsParentContainerView *)self containerView];
    double v7 = v6;
    BOOL v8 = v5;
  }
  else
  {
    double v6 = [(MediaControlsParentContainerView *)self containerView];
    double v7 = v6;
    BOOL v8 = 0;
  }
  [v6 setTimeControlOnScreen:v8];

  if ([(MediaControlsParentContainerView *)self style] == 3)
  {
    double v9 = _MRLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = [(MediaControlsParentContainerView *)self containerView];
      int v11 = 138543874;
      id v12 = v4;
      __int16 v13 = 1024;
      int v14 = [v10 isTimeControlOnScreen];
      __int16 v15 = 1024;
      int v16 = [(MediaControlsParentContainerView *)self _isInAWindow];
      _os_log_impl(&dword_1AE7DF000, v9, OS_LOG_TYPE_DEFAULT, "MediaControlsCoverSheet _updateTimeControlVisibility Reason: %{public}@ timeControlOnScreen: %{BOOL}u _isInAWindow:%{BOOL}u", (uint8_t *)&v11, 0x18u);
    }
  }
}

- (void)_toggleRoutingPickerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MediaControlsParentContainerView *)self selectedMode] == 1)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke;
    v20[3] = &unk_1E5F0D7F8;
    v20[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v20];
    [(UIView *)self->_mediaControlsRoutingPickerView setHidden:0];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke_2;
  aBlock[3] = &unk_1E5F0D8C0;
  aBlock[4] = self;
  BOOL v19 = v3;
  BOOL v5 = (void (**)(void))_Block_copy(aBlock);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke_3;
  v17[3] = &unk_1E5F0D7F8;
  v17[4] = self;
  double v6 = (void (**)(void))_Block_copy(v17);
  if (v3)
  {
    int64_t v7 = [(MediaControlsParentContainerView *)self selectedMode];
    id v8 = objc_alloc(MEMORY[0x1E4F318A8]);
    if (v7 == 1)
    {
      double v9 = 500.0;
      double v10 = 1000.0;
      double v11 = 3.0;
    }
    else
    {
      double v9 = 300.0;
      double v10 = 36.0;
      double v11 = 2.0;
    }
    id v12 = objc_msgSend(v8, "initWithMass:stiffness:damping:initialVelocity:", v11, v9, v10, 0.0, 0.0);
    __int16 v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1698]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
    [v12 setSpringCubicTimingParameters:v13];

    int v14 = (void *)[objc_alloc(MEMORY[0x1E4F318A0]) initWithDuration:v12 timingParameters:1.0];
    [v14 addAnimations:v5];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke_4;
    v15[3] = &unk_1E5F0DDB0;
    int v16 = v6;
    [v14 addCompletion:v15];
    [v14 startAnimation];
  }
  else
  {
    v5[2](v5);
    v6[2](v6);
  }
}

uint64_t __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setInitialFrameForRoutingView:*(void *)(*(void *)(a1 + 32) + 448)];
}

uint64_t __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke_2(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 456);
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);

  return [v2 _updateRoutingPickerVisibilityAnimated:v3];
}

void *__65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke_3(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 456);
  result = *(void **)(a1 + 32);
  if (!result[57])
  {
    BOOL v3 = [result selectedMode] != 1;
    id v4 = *(void **)(*(void *)(a1 + 32) + 448);
    return (void *)[v4 setHidden:v3];
  }
  return result;
}

uint64_t __65__MediaControlsParentContainerView__toggleRoutingPickerAnimated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_setInitialFrameForRoutingView:(id)a3
{
  id v4 = [(MediaControlsParentContainerView *)self traitCollection];
  [v4 displayScale];

  [(MediaControlsParentContainerView *)self bounds];
  UIRectIntegralWithScale();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(MediaControlsParentContainerView *)self mediaControlsRoutingPickerView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
}

- (UIView)routingView
{
  return self->_mediaControlsRoutingPickerView;
}

- (void)setRoutingView:(id)a3
{
  double v5 = (UIView *)a3;
  p_mediaControlsRoutingPickerView = &self->_mediaControlsRoutingPickerView;
  mediaControlsRoutingPickerView = self->_mediaControlsRoutingPickerView;
  if (mediaControlsRoutingPickerView != v5)
  {
    double v9 = v5;
    if ([(UIView *)mediaControlsRoutingPickerView isDescendantOfView:self]) {
      [(UIView *)*p_mediaControlsRoutingPickerView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_mediaControlsRoutingPickerView, a3);
    [(MediaControlsParentContainerView *)self addSubview:*p_mediaControlsRoutingPickerView];
    [(MediaControlsParentContainerView *)self _updateRoutingPickerVisibilityAnimated:0];
    int64_t v8 = [(MediaControlsParentContainerView *)self selectedMode];
    double v5 = v9;
    if (v8 == 1)
    {
      [(MediaControlsParentContainerView *)self layoutIfNeeded];
      [(MediaControlsParentContainerView *)self setNeedsLayout];
      double v5 = v9;
    }
  }
}

- (void)handleHoverGestureRecognizer:(id)a3
{
  if (self->_style == 3)
  {
    BOOL v4 = (unint64_t)([a3 state] - 3) < 0xFFFFFFFFFFFFFFFELL;
    [(MediaControlsParentContainerView *)self setClipsToBounds:v4];
  }
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)selectedMode
{
  return self->_selectedMode;
}

- (MediaControlsContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (MediaControlsSeparatorView)topDividerView
{
  return self->_topDividerView;
}

- (void)setTopDividerView:(id)a3
{
}

- (MediaControlsSeparatorView)bottomDividerView
{
  return self->_bottomDividerView;
}

- (void)setBottomDividerView:(id)a3
{
}

- (UIView)mediaControlsRoutingPickerView
{
  return self->_mediaControlsRoutingPickerView;
}

- (void)setMediaControlsRoutingPickerView:(id)a3
{
}

- (int64_t)routingViewControllerAnimationCount
{
  return self->_routingViewControllerAnimationCount;
}

- (void)setRoutingViewControllerAnimationCount:(int64_t)a3
{
  self->_routingViewControllerAnimationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaControlsRoutingPickerView, 0);
  objc_storeStrong((id *)&self->_bottomDividerView, 0);
  objc_storeStrong((id *)&self->_topDividerView, 0);

  objc_storeStrong((id *)&self->_containerView, 0);
}

@end