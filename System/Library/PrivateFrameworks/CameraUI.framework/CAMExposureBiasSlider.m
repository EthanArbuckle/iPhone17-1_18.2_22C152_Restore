@interface CAMExposureBiasSlider
- (BOOL)suspendTrackFadeOut;
- (CAMExposureBiasSlider)initWithFrame:(CGRect)a3;
- (CAMExposureBiasSliderThumb)_thumbView;
- (CGPoint)_sunCenterForNormalizedValue:(float)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)_maxTrackMaskView;
- (UIView)_maxTrackView;
- (UIView)_minTrackMaskView;
- (UIView)_minTrackView;
- (double)_lastInteractionTime;
- (double)_trackAlpha;
- (double)thumbMaxExtension;
- (float)_normalizedExposureValue;
- (float)exposureBiasMax;
- (float)exposureBiasMin;
- (float)exposureBiasValue;
- (void)_animateTrackAlpha:(double)a3 withDuration:(double)a4;
- (void)_cancelDelayedDim;
- (void)_dimTrackForInactivity;
- (void)_scheduleDelayedDim;
- (void)_updateForChangedNormalizedExposureValue;
- (void)forceTrackDimmed;
- (void)layoutSubviews;
- (void)setExposureBiasMax:(float)a3;
- (void)setExposureBiasMin:(float)a3;
- (void)setExposureBiasValue:(float)a3;
- (void)setSuspendTrackFadeOut:(BOOL)a3;
- (void)tintColorDidChange;
- (void)updateLastInteractionTime;
@end

@implementation CAMExposureBiasSlider

- (CAMExposureBiasSlider)initWithFrame:(CGRect)a3
{
  v31.receiver = self;
  v31.super_class = (Class)CAMExposureBiasSlider;
  v3 = -[CAMExposureBiasSlider initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CAMExposureBiasSlider *)v3 setExposureBiasMin:0.0];
    LODWORD(v5) = 1.0;
    [(CAMExposureBiasSlider *)v4 setExposureBiasMax:v5];
    [(CAMExposureBiasSlider *)v4 setExposureBiasValue:0.0];
    v6 = [(CAMExposureBiasSlider *)v4 tintColor];
    id v7 = objc_alloc(MEMORY[0x263F82828]);
    double v8 = *MEMORY[0x263F001A8];
    double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], v9, v10, v11);
    minTrackView = v4->__minTrackView;
    v4->__minTrackView = (UIView *)v12;

    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", v8, v9, v10, v11);
    maxTrackView = v4->__maxTrackView;
    v4->__maxTrackView = (UIView *)v14;

    [(UIView *)v4->__minTrackView setBackgroundColor:v6];
    [(UIView *)v4->__maxTrackView setBackgroundColor:v6];
    [(CAMExposureBiasSlider *)v4 addSubview:v4->__minTrackView];
    [(CAMExposureBiasSlider *)v4 addSubview:v4->__maxTrackView];
    uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    minTrackMaskView = v4->__minTrackMaskView;
    v4->__minTrackMaskView = (UIView *)v16;

    uint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    maxTrackMaskView = v4->__maxTrackMaskView;
    v4->__maxTrackMaskView = (UIView *)v18;

    v20 = v4->__minTrackMaskView;
    v21 = [MEMORY[0x263F825C8] whiteColor];
    [(UIView *)v20 setBackgroundColor:v21];

    v22 = v4->__maxTrackMaskView;
    v23 = [MEMORY[0x263F825C8] whiteColor];
    [(UIView *)v22 setBackgroundColor:v23];

    v24 = [(UIView *)v4->__minTrackView layer];
    v25 = [(UIView *)v4->__minTrackMaskView layer];
    [v24 setMask:v25];

    v26 = [(UIView *)v4->__maxTrackView layer];
    v27 = [(UIView *)v4->__maxTrackMaskView layer];
    [v26 setMask:v27];

    v28 = -[CAMExposureBiasSliderThumb initWithFrame:]([CAMExposureBiasSliderThumb alloc], "initWithFrame:", v8, v9, v10, v11);
    thumbView = v4->__thumbView;
    v4->__thumbView = v28;

    [(CAMExposureBiasSlider *)v4 addSubview:v4->__thumbView];
  }
  return v4;
}

- (void)tintColorDidChange
{
  id v3 = [(CAMExposureBiasSlider *)self tintColor];
  [(UIView *)self->__minTrackView setBackgroundColor:v3];
  [(UIView *)self->__maxTrackView setBackgroundColor:v3];
}

- (void)setExposureBiasMin:(float)a3
{
  if (self->_exposureBiasMin != a3)
  {
    self->_exposureBiasMin = a3;
    [(CAMExposureBiasSlider *)self _updateForChangedNormalizedExposureValue];
  }
}

- (void)setExposureBiasMax:(float)a3
{
  if (self->_exposureBiasMax != a3)
  {
    self->_exposureBiasMax = a3;
    [(CAMExposureBiasSlider *)self _updateForChangedNormalizedExposureValue];
  }
}

- (void)setExposureBiasValue:(float)a3
{
  if (self->_exposureBiasValue != a3)
  {
    self->_exposureBiasValue = a3;
    [(CAMExposureBiasSlider *)self _updateForChangedNormalizedExposureValue];
  }
  [(CAMExposureBiasSlider *)self updateLastInteractionTime];
}

- (double)thumbMaxExtension
{
  [(CAMExposureBiasSliderThumb *)self->__thumbView maxRadius];
  return result;
}

- (void)_updateForChangedNormalizedExposureValue
{
  [(CAMExposureBiasSlider *)self _normalizedExposureValue];
  -[CAMExposureBiasSliderThumb setNormalizedExposureValue:](self->__thumbView, "setNormalizedExposureValue:");
  [(CAMExposureBiasSlider *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 143.0;
  double v4 = 1.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v25.receiver = self;
  v25.super_class = (Class)CAMExposureBiasSlider;
  [(CAMExposureBiasSlider *)&v25 layoutSubviews];
  [(CAMExposureBiasSlider *)self bounds];
  double v4 = v3;
  double v6 = v5;
  [(CAMExposureBiasSlider *)self _normalizedExposureValue];
  -[CAMExposureBiasSlider _sunCenterForNormalizedValue:](self, "_sunCenterForNormalizedValue:");
  -[CAMExposureBiasSliderThumb sizeThatFits:](self->__thumbView, "sizeThatFits:", v4, v6);
  double v8 = v7;
  double v10 = v9;
  UIRoundToViewScale();
  double v12 = v11;
  UIRoundToViewScale();
  double v14 = v13;
  -[CAMExposureBiasSliderThumb setFrame:](self->__thumbView, "setFrame:", v12, v13, v8, v10);
  double v15 = *MEMORY[0x263F001A8];
  double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
  -[UIView setFrame:](self->__minTrackView, "setFrame:", *MEMORY[0x263F001A8], v16, 1.0, 143.0);
  -[UIView setFrame:](self->__maxTrackView, "setFrame:", v15, v16, 1.0, 143.0);
  -[CAMExposureBiasSlider convertRect:toView:](self, "convertRect:toView:", self->__minTrackView, v12, v14, v8, v10);
  CGFloat width = v26.size.width;
  v26.origin.CGFloat x = v21 + 0.0;
  CGFloat x = v26.origin.x;
  v26.origin.CGFloat y = v22 + -3.0;
  CGFloat y = v26.origin.y;
  v26.size.CGFloat height = v23 + 6.0;
  CGFloat height = v26.size.height;
  -[UIView setFrame:](self->__minTrackMaskView, "setFrame:", 0.0, 0.0, 1.0, CGRectGetMinY(v26));
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v27);
  v28.size.CGFloat width = 1.0;
  v28.origin.CGFloat x = v15;
  v28.origin.CGFloat y = v16;
  v28.size.CGFloat height = 143.0;
  -[UIView setFrame:](self->__maxTrackMaskView, "setFrame:", 0.0, MaxY, 1.0, CGRectGetMaxY(v28) - MaxY);
}

- (CGPoint)_sunCenterForNormalizedValue:(float)a3
{
  [(CAMExposureBiasSlider *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v13 = 3.0 - CAMPixelWidthForView(self);
  v20.origin.CGFloat x = v6;
  v20.origin.CGFloat y = v8;
  v20.size.CGFloat width = v10;
  v20.size.CGFloat height = v12;
  CGFloat v14 = CGRectGetMinY(v20) + v13;
  v21.origin.CGFloat x = v6;
  v21.origin.CGFloat y = v8;
  v21.size.CGFloat width = v10;
  v21.size.CGFloat height = v12;
  CGFloat MaxY = CGRectGetMaxY(v21);
  double v16 = MaxY - v13 + a3 * (v14 - (MaxY - v13));
  v22.origin.CGFloat x = v6;
  v22.origin.CGFloat y = v8;
  v22.size.CGFloat width = v10;
  v22.size.CGFloat height = v12;
  double MidX = CGRectGetMidX(v22);
  double v18 = v16;
  result.CGFloat y = v18;
  result.CGFloat x = MidX;
  return result;
}

- (float)_normalizedExposureValue
{
  [(CAMExposureBiasSlider *)self exposureBiasMin];
  float v4 = v3;
  [(CAMExposureBiasSlider *)self exposureBiasMax];
  float v6 = v5;
  float result = 0.0;
  if (v6 > v4)
  {
    [(CAMExposureBiasSlider *)self exposureBiasValue];
    if (v8 < v4) {
      float v8 = v4;
    }
    if (v8 > v6) {
      float v8 = v6;
    }
    return (float)(v8 - v4) / (float)(v6 - v4);
  }
  return result;
}

- (void)setSuspendTrackFadeOut:(BOOL)a3
{
  if (self->_suspendTrackFadeOut != a3)
  {
    self->_suspendTrackFadeOut = a3;
    if (a3)
    {
      [(CAMExposureBiasSlider *)self _cancelDelayedDim];
      [(CAMExposureBiasSlider *)self updateLastInteractionTime];
    }
    else
    {
      [(CAMExposureBiasSlider *)self _scheduleDelayedDim];
    }
  }
}

- (void)forceTrackDimmed
{
  [(CAMExposureBiasSlider *)self _cancelDelayedDim];
  [(CAMExposureBiasSlider *)self _animateTrackAlpha:0.0 withDuration:0.0];
}

- (void)updateLastInteractionTime
{
  [(CAMExposureBiasSlider *)self _cancelDelayedDim];
  self->__lastInteractionTime = CFAbsoluteTimeGetCurrent();
  [(CAMExposureBiasSlider *)self _trackAlpha];
  if (fabs(v3) <= 0.00000011920929) {
    [(CAMExposureBiasSlider *)self _animateTrackAlpha:1.0 withDuration:0.0];
  }
  [(CAMExposureBiasSlider *)self _scheduleDelayedDim];
}

- (void)_scheduleDelayedDim
{
  if (![(CAMExposureBiasSlider *)self suspendTrackFadeOut])
  {
    [(CAMExposureBiasSlider *)self performSelector:sel__dimTrackForInactivity withObject:0 afterDelay:1.2];
  }
}

- (void)_cancelDelayedDim
{
  double v3 = objc_opt_class();
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__dimTrackForInactivity object:0];
}

- (void)_dimTrackForInactivity
{
  if (![(CAMExposureBiasSlider *)self suspendTrackFadeOut])
  {
    [(CAMExposureBiasSlider *)self _trackAlpha];
    if (v3 == 1.0)
    {
      [(CAMExposureBiasSlider *)self _animateTrackAlpha:0.0 withDuration:0.36];
    }
  }
}

- (void)_animateTrackAlpha:(double)a3 withDuration:(double)a4
{
  if (a4 <= 0.0)
  {
    [(UIView *)self->__minTrackView setAlpha:a3];
    maxTrackView = self->__maxTrackView;
    [(UIView *)maxTrackView setAlpha:a3];
  }
  else
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__CAMExposureBiasSlider__animateTrackAlpha_withDuration___block_invoke;
    v7[3] = &unk_263FA04E0;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    [MEMORY[0x263F82E00] animateWithDuration:2 delay:v7 options:0 animations:a4 completion:0.0];
  }
}

uint64_t __57__CAMExposureBiasSlider__animateTrackAlpha_withDuration___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:*(double *)(a1 + 40)];
  v2 = *(void **)(*(void *)(a1 + 32) + 440);
  double v3 = *(double *)(a1 + 40);
  return [v2 setAlpha:v3];
}

- (double)_trackAlpha
{
  [(UIView *)self->__minTrackView alpha];
  return result;
}

- (float)exposureBiasMin
{
  return self->_exposureBiasMin;
}

- (float)exposureBiasMax
{
  return self->_exposureBiasMax;
}

- (float)exposureBiasValue
{
  return self->_exposureBiasValue;
}

- (BOOL)suspendTrackFadeOut
{
  return self->_suspendTrackFadeOut;
}

- (CAMExposureBiasSliderThumb)_thumbView
{
  return self->__thumbView;
}

- (UIView)_minTrackView
{
  return self->__minTrackView;
}

- (UIView)_maxTrackView
{
  return self->__maxTrackView;
}

- (UIView)_minTrackMaskView
{
  return self->__minTrackMaskView;
}

- (UIView)_maxTrackMaskView
{
  return self->__maxTrackMaskView;
}

- (double)_lastInteractionTime
{
  return self->__lastInteractionTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__maxTrackMaskView, 0);
  objc_storeStrong((id *)&self->__minTrackMaskView, 0);
  objc_storeStrong((id *)&self->__maxTrackView, 0);
  objc_storeStrong((id *)&self->__minTrackView, 0);
  objc_storeStrong((id *)&self->__thumbView, 0);
}

@end