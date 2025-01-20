@interface CAMTimerIndicatorView
- (BOOL)_isPerformingStyleAnimation;
- (CAMAnimationDelegate)_animationDelegate;
- (CAMTimerIndicatorView)initWithCoder:(id)a3;
- (CAMTimerIndicatorView)initWithFrame:(CGRect)a3;
- (CGRect)_landscapeSwapBoundsCoordinates:(CGRect)a3;
- (UILabel)_countdownLabel;
- (UIView)_dimmingView;
- (id)_decrementAnimationForTick:(int64_t)a3;
- (id)_dimmingAnimationForTick:(int64_t)a3;
- (id)_finalDimmingAnimation;
- (id)_fontForStyle:(int64_t)a3;
- (id)font;
- (int64_t)_deferredLabelOrientation;
- (int64_t)_labelOrientation;
- (int64_t)_remainingTicks;
- (int64_t)_startingTicks;
- (int64_t)style;
- (void)_addDecrementAnimationForTick:(int64_t)a3;
- (void)_addDimmingAnimationForTick:(int64_t)a3;
- (void)_commonCAMTimerIndicatorViewInitialization;
- (void)_handleOrientationChange:(int64_t)a3;
- (void)_layoutCountdownLabelForLargeStyle;
- (void)_layoutCountdownLabelForSmallStyle;
- (void)_layoutCountdownLabelForStyle:(int64_t)a3;
- (void)_setDeferredOrientation:(int64_t)a3;
- (void)_setLabelOrientation:(int64_t)a3;
- (void)_setPerformingStyleAnimation:(BOOL)a3;
- (void)_transitionDimmingViewFromStyle:(int64_t)a3;
- (void)_updateCountdownLabelWithTicksRemaining;
- (void)_updateFromChangeToStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)decrement;
- (void)layoutSubviews;
- (void)resetWithNumberOfTicks:(int64_t)a3;
- (void)setFont:(id)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setStyle:(int64_t)a3;
- (void)setStyle:(int64_t)a3 animated:(BOOL)a4;
- (void)startCountdownWithAnimationDelegate:(id)a3;
- (void)stopCountdown;
@end

@implementation CAMTimerIndicatorView

- (CAMTimerIndicatorView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMTimerIndicatorView;
  v3 = -[CAMTimerIndicatorView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMTimerIndicatorView *)v3 _commonCAMTimerIndicatorViewInitialization];
    v5 = v4;
  }

  return v4;
}

- (void)_commonCAMTimerIndicatorViewInitialization
{
  [(CAMTimerIndicatorView *)self setUserInteractionEnabled:0];
  v3 = [MEMORY[0x263F82670] currentDevice];
  self->_style = 2 * (objc_msgSend(v3, "cam_initialLayoutStyle") == 1);

  [(CAMTimerIndicatorView *)self setAutoresizingMask:18];
  id v4 = objc_alloc(MEMORY[0x263F82E00]);
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
  dimmingView = self->__dimmingView;
  self->__dimmingView = v9;

  [(UIView *)self->__dimmingView setAutoresizingMask:18];
  v11 = self->__dimmingView;
  v12 = [MEMORY[0x263F825C8] blackColor];
  [(UIView *)v11 setBackgroundColor:v12];

  [(UIView *)self->__dimmingView setAlpha:0.0];
  [(CAMTimerIndicatorView *)self addSubview:self->__dimmingView];
  self->__remainingTicks = 0;
  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v5, v6, v7, v8);
  countdownLabel = self->__countdownLabel;
  self->__countdownLabel = v13;

  v15 = self->__countdownLabel;
  v16 = [(CAMTimerIndicatorView *)self _fontForStyle:self->_style];
  [(UILabel *)v15 setFont:v16];

  v17 = self->__countdownLabel;
  v18 = [MEMORY[0x263F825C8] whiteColor];
  [(UILabel *)v17 setTextColor:v18];

  [(UILabel *)self->__countdownLabel setTextAlignment:1];
  v19 = self->__countdownLabel;
  v20 = [MEMORY[0x263F825C8] clearColor];
  [(UILabel *)v19 setBackgroundColor:v20];

  v21 = [(UILabel *)self->__countdownLabel layer];
  id v22 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.63];
  objc_msgSend(v21, "setShadowColor:", objc_msgSend(v22, "CGColor"));

  v23 = [(UILabel *)self->__countdownLabel layer];
  objc_msgSend(v23, "setShadowOffset:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));

  v24 = [(UILabel *)self->__countdownLabel layer];
  LODWORD(v25) = 1.0;
  [v24 setShadowOpacity:v25];

  v26 = [(UILabel *)self->__countdownLabel layer];
  [v26 setShadowRadius:2.0];

  [(CAMTimerIndicatorView *)self addSubview:self->__countdownLabel];
  [(CAMTimerIndicatorView *)self _updateCountdownLabelWithTicksRemaining];
}

- (id)_fontForStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = +[CAMFont cameraFontOfSize:](CAMFont, "cameraFontOfSize:", dbl_209C79738[a3], v3);
  }
  return v5;
}

- (void)_updateCountdownLabelWithTicksRemaining
{
  [(UILabel *)self->__countdownLabel setAlpha:0.0];
  CAMTimerCountdownFormatter();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [NSNumber numberWithInteger:self->__remainingTicks];
  uint64_t v4 = [v5 stringFromNumber:v3];

  [(UILabel *)self->__countdownLabel setText:v4];
}

- (BOOL)_isPerformingStyleAnimation
{
  return self->__performingStyleAnimation;
}

- (void)_handleOrientationChange:(int64_t)a3
{
  if (a3)
  {
    -[CAMTimerIndicatorView _setLabelOrientation:](self, "_setLabelOrientation:");
    +[CAMView rotateView:self->__countdownLabel toInterfaceOrientation:a3 animated:1];
    [(CAMTimerIndicatorView *)self setNeedsLayout];
  }
}

- (void)_setLabelOrientation:(int64_t)a3
{
  self->__labelOrientation = a3;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CAMTimerIndicatorView;
  [(CAMTimerIndicatorView *)&v3 layoutSubviews];
  [(CAMTimerIndicatorView *)self bounds];
  -[UIView setFrame:](self->__dimmingView, "setFrame:");
  [(CAMTimerIndicatorView *)self _layoutCountdownLabelForStyle:self->_style];
}

- (void)_layoutCountdownLabelForStyle:(int64_t)a3
{
  if (![(CAMTimerIndicatorView *)self _isPerformingStyleAnimation])
  {
    if ((unint64_t)a3 >= 2)
    {
      if (a3 == 2)
      {
        [(CAMTimerIndicatorView *)self _layoutCountdownLabelForLargeStyle];
      }
    }
    else
    {
      [(CAMTimerIndicatorView *)self _layoutCountdownLabelForSmallStyle];
    }
  }
}

- (void)_layoutCountdownLabelForSmallStyle
{
  [(CAMTimerIndicatorView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v12 = *MEMORY[0x263F00148];
  double v11 = *(double *)(MEMORY[0x263F00148] + 8);
  [(UILabel *)self->__countdownLabel intrinsicContentSize];
  double v15 = v13;
  double v16 = v14;
  if ((unint64_t)(self->__labelOrientation - 3) > 1)
  {
    CGFloat rect = v12;
  }
  else
  {
    -[CAMTimerIndicatorView _landscapeSwapBoundsCoordinates:](self, "_landscapeSwapBoundsCoordinates:", v12, v11, v13, v14);
    CGFloat rect = v17;
    double v11 = v18;
    double v15 = v19;
    double v16 = v20;
  }
  v32.origin.x = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  CGFloat v21 = v10;
  CGFloat v22 = v8;
  CGFloat v23 = v6;
  CGFloat v24 = v4;
  double MaxX = CGRectGetMaxX(v32);
  v33.origin.x = rect;
  v33.origin.y = v11;
  v33.size.width = v15;
  v33.size.height = v16;
  double v26 = MaxX - CGRectGetWidth(v33) + -9.0;
  v34.origin.x = v24;
  v34.origin.y = v23;
  v34.size.width = v22;
  v34.size.height = v21;
  double MaxY = CGRectGetMaxY(v34);
  v35.origin.x = v26;
  v35.origin.y = v11;
  v35.size.width = v15;
  v35.size.height = v16;
  double Height = CGRectGetHeight(v35);
  countdownLabel = self->__countdownLabel;
  -[UILabel setFrame:](countdownLabel, "setFrame:", v26, MaxY - Height + -9.0, v15, v16);
}

- (CAMTimerIndicatorView)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMTimerIndicatorView;
  double v3 = [(CAMTimerIndicatorView *)&v7 initWithCoder:a3];
  CGFloat v4 = v3;
  if (v3)
  {
    [(CAMTimerIndicatorView *)v3 _commonCAMTimerIndicatorViewInitialization];
    double v5 = v4;
  }

  return v4;
}

- (CGRect)_landscapeSwapBoundsCoordinates:(CGRect)a3
{
  CGFloat width = a3.size.width;
  CGFloat x = a3.origin.x;
  double y = a3.origin.y;
  double v6 = x;
  double height = a3.size.height;
  double v8 = width;
  result.size.double height = v8;
  result.size.CGFloat width = height;
  result.origin.double y = v6;
  result.origin.CGFloat x = y;
  return result;
}

- (void)_layoutCountdownLabelForLargeStyle
{
  [(CAMTimerIndicatorView *)self bounds];
  double v3 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  -[UILabel sizeThatFits:](self->__countdownLabel, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  if ((unint64_t)(self->__labelOrientation - 3) <= 1) {
    -[CAMTimerIndicatorView _landscapeSwapBoundsCoordinates:](self, "_landscapeSwapBoundsCoordinates:", v3, v4, v5, v6);
  }
  UIRectCenteredIntegralRectScale();
  countdownLabel = self->__countdownLabel;
  -[UILabel setFrame:](countdownLabel, "setFrame:");
}

- (void)setStyle:(int64_t)a3
{
}

- (id)font
{
  return [(UILabel *)self->__countdownLabel font];
}

- (void)setFont:(id)a3
{
}

- (void)setStyle:(int64_t)a3 animated:(BOOL)a4
{
  int64_t style = self->_style;
  if (style != a3)
  {
    self->_int64_t style = a3;
    [(CAMTimerIndicatorView *)self _updateFromChangeToStyle:style animated:a4];
  }
}

- (void)_updateFromChangeToStyle:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_super v7 = -[CAMTimerIndicatorView _fontForStyle:](self, "_fontForStyle:");
  id v8 = [(CAMTimerIndicatorView *)self _fontForStyle:self->_style];
  [v8 pointSize];
  double v10 = v9;
  [v7 pointSize];
  if (v10 <= v11) {
    double v12 = v7;
  }
  else {
    double v12 = v8;
  }
  id v13 = v12;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x4010000000;
  v58[3] = "";
  long long v14 = *(_OWORD *)(MEMORY[0x263F001A0] + 16);
  long long v59 = *MEMORY[0x263F001A0];
  long long v60 = v14;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3010000000;
  v56[3] = "";
  long long v57 = *MEMORY[0x263F00148];
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x5010000000;
  v52[3] = "";
  long long v15 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  long long v53 = *MEMORY[0x263F000D0];
  long long v54 = v15;
  long long v55 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(UILabel *)self->__countdownLabel intrinsicContentSize];
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  [(UILabel *)self->__countdownLabel setFont:v8];
  [(UILabel *)self->__countdownLabel intrinsicContentSize];
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  [(CAMTimerIndicatorView *)self setNeedsLayout];
  if (v4)
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v49 = 0u;
    countdownLabel = self->__countdownLabel;
    if (countdownLabel) {
      [(UILabel *)countdownLabel transform];
    }
    double v25 = (void *)MEMORY[0x263F82E00];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    long long v41 = v49;
    v36[2] = __59__CAMTimerIndicatorView__updateFromChangeToStyle_animated___block_invoke;
    v36[3] = &unk_263FA2C08;
    v36[4] = self;
    v38 = v56;
    v39 = v58;
    v40 = v52;
    long long v42 = v50;
    long long v43 = v51;
    uint64_t v44 = v17;
    uint64_t v45 = v19;
    uint64_t v46 = v21;
    uint64_t v47 = v23;
    BOOL v48 = v13 != v8;
    id v37 = v13;
    [v25 performWithoutAnimation:v36];
    [(CAMTimerIndicatorView *)self _setPerformingStyleAnimation:1];
    [(CAMTimerIndicatorView *)self _transitionDimmingViewFromStyle:a3];
    double v26 = (void *)MEMORY[0x263F82E00];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __59__CAMTimerIndicatorView__updateFromChangeToStyle_animated___block_invoke_2;
    v35[3] = &unk_263FA2C30;
    v35[4] = self;
    v35[5] = v52;
    v35[6] = v56;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __59__CAMTimerIndicatorView__updateFromChangeToStyle_animated___block_invoke_3;
    v28[3] = &unk_263FA2C58;
    BOOL v34 = v13 != v8;
    v28[4] = self;
    id v27 = v8;
    long long v31 = v49;
    long long v32 = v50;
    long long v33 = v51;
    id v29 = v27;
    v30 = v58;
    [v26 animateWithDuration:v35 animations:v28 completion:0.3];
  }
  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v56, 8);
  _Block_object_dispose(v58, 8);
}

CGAffineTransform *__59__CAMTimerIndicatorView__updateFromChangeToStyle_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) center];
  double v3 = v2;
  double v5 = v4;
  [*(id *)(*(void *)(a1 + 32) + 432) bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(*(void *)(a1 + 32) + 432) center];
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  [*(id *)(*(void *)(a1 + 32) + 432) bounds];
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v18 + 32) = v15;
  *(void *)(v18 + 40) = v17;
  uint64_t v19 = *(void **)(*(void *)(a1 + 56) + 8);
  v19[4] = v20;
  v19[5] = v21;
  v19[6] = v22;
  v19[7] = v23;
  CGFloat v24 = *(_OWORD **)(*(void *)(a1 + 64) + 8);
  double v25 = (_OWORD *)(a1 + 72);
  long long v26 = *(_OWORD *)(a1 + 72);
  long long v27 = *(_OWORD *)(a1 + 104);
  v24[3] = *(_OWORD *)(a1 + 88);
  v24[4] = v27;
  v24[2] = v26;
  if (*(unsigned char *)(a1 + 152))
  {
    [*(id *)(*(void *)(a1 + 32) + 432) setFont:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "setCenter:", v3, v5);
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "setBounds:", v7, v9, v11, v13);
    double v28 = *(double *)(a1 + 144);
    double v29 = *(double *)(a1 + 128);
    CGFloat v30 = *(double *)(a1 + 136) / *(double *)(a1 + 120);
    long long v31 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)&v41.a = *v25;
    *(_OWORD *)&v41.c = v31;
    *(_OWORD *)&v41.tCGFloat x = *(_OWORD *)(a1 + 104);
    memset(&v42, 0, sizeof(v42));
    CGRect result = CGAffineTransformScale(&v42, &v41, v30, v28 / v29);
    long long v33 = *(_OWORD **)(*(void *)(a1 + 64) + 8);
    long long v35 = *(_OWORD *)&v42.c;
    long long v34 = *(_OWORD *)&v42.tx;
    v33[2] = *(_OWORD *)&v42.a;
    v33[3] = v35;
    v33[4] = v34;
  }
  else
  {
    double v36 = *(double *)(a1 + 120);
    double v37 = *(double *)(a1 + 136);
    CGFloat v38 = *(double *)(a1 + 128) / *(double *)(a1 + 144);
    long long v39 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)&v41.a = *v25;
    *(_OWORD *)&v41.c = v39;
    *(_OWORD *)&v41.tCGFloat x = *(_OWORD *)(a1 + 104);
    memset(&v42, 0, sizeof(v42));
    CGAffineTransformScale(&v42, &v41, v36 / v37, v38);
    v40 = *(void **)(*(void *)(a1 + 32) + 432);
    CGAffineTransform v41 = v42;
    [v40 setTransform:&v41];
    return (CGAffineTransform *)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "setCenter:", v3, v5);
  }
  return result;
}

uint64_t __59__CAMTimerIndicatorView__updateFromChangeToStyle_animated___block_invoke_2(void *a1)
{
  uint64_t v2 = a1[5];
  double v3 = *(void **)(a1[4] + 432);
  double v4 = *(_OWORD **)(v2 + 8);
  long long v5 = v4[3];
  v7[0] = v4[2];
  v7[1] = v5;
  v7[2] = v4[4];
  [v3 setTransform:v7];
  return objc_msgSend(*(id *)(a1[4] + 432), "setCenter:", *(double *)(*(void *)(a1[6] + 8) + 32), *(double *)(*(void *)(a1[6] + 8) + 40));
}

uint64_t __59__CAMTimerIndicatorView__updateFromChangeToStyle_animated___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 104))
  {
    [*(id *)(*(void *)(a1 + 32) + 432) setFont:*(void *)(a1 + 40)];
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 432);
    long long v3 = *(_OWORD *)(a1 + 72);
    v5[0] = *(_OWORD *)(a1 + 56);
    v5[1] = v3;
    v5[2] = *(_OWORD *)(a1 + 88);
    [v2 setTransform:v5];
    if (!CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32))) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "setBounds:", *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
    }
  }
  [*(id *)(a1 + 32) _setPerformingStyleAnimation:0];
  objc_msgSend(*(id *)(a1 + 32), "_handleOrientationChange:", objc_msgSend(*(id *)(a1 + 32), "_deferredLabelOrientation"));
  [*(id *)(a1 + 32) _setDeferredOrientation:0];
  return [*(id *)(a1 + 32) setNeedsLayout];
}

- (void)startCountdownWithAnimationDelegate:(id)a3
{
  objc_storeStrong((id *)&self->__animationDelegate, a3);
  [(CAMTimerIndicatorView *)self _addDecrementAnimationForTick:self->__remainingTicks];
  int64_t remainingTicks = self->__remainingTicks;
  [(CAMTimerIndicatorView *)self _addDimmingAnimationForTick:remainingTicks];
}

- (void)stopCountdown
{
}

- (void)decrement
{
  --self->__remainingTicks;
  [(CAMTimerIndicatorView *)self _updateCountdownLabelWithTicksRemaining];
  [(CAMTimerIndicatorView *)self _addDecrementAnimationForTick:self->__remainingTicks];
  int64_t remainingTicks = self->__remainingTicks;
  [(CAMTimerIndicatorView *)self _addDimmingAnimationForTick:remainingTicks];
}

- (void)resetWithNumberOfTicks:(int64_t)a3
{
  animationDelegate = self->__animationDelegate;
  self->__animationDelegate = 0;

  [(CAMTimerIndicatorView *)self _removeAllAnimations:1];
  self->__startingTicks = a3;
  self->__int64_t remainingTicks = a3;
  [(CAMTimerIndicatorView *)self _updateCountdownLabelWithTicksRemaining];
  [(CAMTimerIndicatorView *)self setNeedsLayout];
}

- (id)_decrementAnimationForTick:(int64_t)a3
{
  long long v5 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
  double v6 = v5;
  if (self->__remainingTicks == 1)
  {
    [v5 setValues:&unk_26BDDFE30];
    [v6 setKeyTimes:&unk_26BDDFE48];
    [v6 setFillMode:*MEMORY[0x263F15AB0]];
  }
  else
  {
    [v5 setValues:&unk_26BDDFE00];
    [v6 setKeyTimes:&unk_26BDDFE18];
  }
  [v6 setRemovedOnCompletion:0];
  [v6 setDuration:1.0];
  [v6 setBeginTime:CACurrentMediaTime() + (float)(self->__remainingTicks - a3)];
  return v6;
}

- (void)_addDecrementAnimationForTick:(int64_t)a3
{
  id v5 = [(CAMTimerIndicatorView *)self _decrementAnimationForTick:a3];
  [v5 setDelegate:self->__animationDelegate];
  double v4 = [(UILabel *)self->__countdownLabel layer];
  [v4 addAnimation:v5 forKey:@"decrement"];
}

- (id)_finalDimmingAnimation
{
  uint64_t v2 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v2 setFromValue:&unk_26BDDF2F8];
  [v2 setToValue:&unk_26BDDF2C8];
  [v2 setDuration:0.35];
  [v2 setBeginTime:CACurrentMediaTime() + 0.65];
  return v2;
}

- (void)_transitionDimmingViewFromStyle:(int64_t)a3
{
  if (a3 == 2)
  {
    if (!self->_style)
    {
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = __57__CAMTimerIndicatorView__transitionDimmingViewFromStyle___block_invoke;
      v4[3] = &unk_263FA0208;
      v4[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:4 delay:v4 options:0 animations:0.3 completion:0.0];
    }
  }
  else if (!a3 && self->_style == 2)
  {
    int64_t remainingTicks = self->__remainingTicks;
    [(CAMTimerIndicatorView *)self _addDimmingAnimationForTick:remainingTicks];
  }
}

uint64_t __57__CAMTimerIndicatorView__transitionDimmingViewFromStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
}

- (id)_dimmingAnimationForTick:(int64_t)a3
{
  v24[2] = *MEMORY[0x263EF8340];
  float v4 = 0.6 / (float)self->__startingTicks;
  id v5 = [(UIView *)self->__dimmingView layer];
  double v6 = [v5 presentationLayer];
  [v6 opacity];
  float v8 = v7;

  int64_t startingTicks = self->__startingTicks;
  int64_t remainingTicks = self->__remainingTicks;
  if (remainingTicks <= 1) {
    int64_t v11 = 1;
  }
  else {
    int64_t v11 = self->__remainingTicks;
  }
  if (remainingTicks == 1) {
    double v12 = 0.65;
  }
  else {
    double v12 = 1.0;
  }
  float v13 = v4 * (float)((startingTicks - remainingTicks) & ~((startingTicks - remainingTicks) >> 63));
  float v14 = v4 * (float)(startingTicks - v11 + 1);
  if (startingTicks == remainingTicks || (float)(v8 - v13) == 0.00000011921) {
    float v8 = v13;
  }
  uint64_t v17 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
  *(float *)&double v18 = v8;
  uint64_t v19 = [NSNumber numberWithFloat:v18];
  v24[0] = v19;
  *(float *)&double v20 = v14;
  uint64_t v21 = [NSNumber numberWithFloat:v20];
  v24[1] = v21;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  [v17 setValues:v22];

  [v17 setKeyTimes:&unk_26BDDFE60];
  [v17 setDuration:v12];
  [v17 setBeginTime:CACurrentMediaTime()];
  if (remainingTicks != 1)
  {
    [v17 setFillMode:*MEMORY[0x263F15AB0]];
    [v17 setRemovedOnCompletion:0];
  }
  return v17;
}

- (void)_addDimmingAnimationForTick:(int64_t)a3
{
  if (self->_style)
  {
    id v7 = [(CAMTimerIndicatorView *)self _dimmingAnimationForTick:a3];
    float v4 = [(UIView *)self->__dimmingView layer];
    [v4 addAnimation:v7 forKey:@"dimming"];

    if (self->__remainingTicks == 1)
    {
      id v5 = [(CAMTimerIndicatorView *)self _finalDimmingAnimation];
      double v6 = [(UIView *)self->__dimmingView layer];
      [v6 addAnimation:v5 forKey:@"finalDimming"];
    }
  }
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if ([(CAMTimerIndicatorView *)self _isPerformingStyleAnimation])
  {
    [(CAMTimerIndicatorView *)self _setDeferredOrientation:a3];
  }
  else
  {
    [(CAMTimerIndicatorView *)self _handleOrientationChange:a3];
  }
}

- (int64_t)style
{
  return self->_style;
}

- (UIView)_dimmingView
{
  return self->__dimmingView;
}

- (UILabel)_countdownLabel
{
  return self->__countdownLabel;
}

- (int64_t)_startingTicks
{
  return self->__startingTicks;
}

- (int64_t)_remainingTicks
{
  return self->__remainingTicks;
}

- (int64_t)_labelOrientation
{
  return self->__labelOrientation;
}

- (CAMAnimationDelegate)_animationDelegate
{
  return self->__animationDelegate;
}

- (void)_setPerformingStyleAnimation:(BOOL)a3
{
  self->__performingStyleAnimation = a3;
}

- (int64_t)_deferredLabelOrientation
{
  return self->__deferredLabelOrientation;
}

- (void)_setDeferredOrientation:(int64_t)a3
{
  self->__deferredLabelOrientation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animationDelegate, 0);
  objc_storeStrong((id *)&self->__countdownLabel, 0);
  objc_storeStrong((id *)&self->__dimmingView, 0);
}

@end