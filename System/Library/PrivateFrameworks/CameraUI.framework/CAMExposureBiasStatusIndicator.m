@interface CAMExposureBiasStatusIndicator
- (BOOL)isExposureValueVisible;
- (BOOL)shouldUseOutline;
- (BOOL)supportsOrientations;
- (CAMExposureBiasStatusIndicator)init;
- (CAMExposureBiasStatusIndicatorTickMarksView)_ticksView;
- (CGRect)_clippingTickFrameForClipping:(double)a3 leftAligned:(BOOL)a4;
- (CGSize)intrinsicContentSize;
- (UILabel)_exposureLabel;
- (UIView)_highlightClippingTick;
- (UIView)_shadowClippingTick;
- (double)_clippingTickAlphaForClipping:(double)a3;
- (double)_horizontalExposureLabelOffset;
- (double)exposureBiasValue;
- (double)highlightClipping;
- (double)shadowClipping;
- (id)accessibilityIdentifier;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (id)imageNameForAXHUD;
- (id)imageNameForCurrentState;
- (void)_layoutHighlightClippingTick;
- (void)_layoutShadowClippingTick;
- (void)_updateExposureLabel;
- (void)_updateHighlightClippingTickAlpha;
- (void)_updateShadowClippingTickAlpha;
- (void)_updateTicks;
- (void)layoutSubviews;
- (void)setExposureBiasValue:(double)a3;
- (void)setExposureValueVisible:(BOOL)a3;
- (void)setHighlightClipping:(double)a3;
- (void)setShadowClipping:(double)a3;
@end

@implementation CAMExposureBiasStatusIndicator

- (CAMExposureBiasStatusIndicator)init
{
  v15.receiver = self;
  v15.super_class = (Class)CAMExposureBiasStatusIndicator;
  double v2 = *MEMORY[0x263F001A8];
  double v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v4 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 24);
  v6 = -[CAMControlStatusIndicator initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x263F001A8], v3, v4, v5);
  if (v6)
  {
    uint64_t v7 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v2, v3, v4, v5);
    exposureLabel = v6->__exposureLabel;
    v6->__exposureLabel = (UILabel *)v7;

    [(UILabel *)v6->__exposureLabel setNumberOfLines:1];
    v9 = CAMYellowColor();
    [(UILabel *)v6->__exposureLabel setTextColor:v9];

    [(UILabel *)v6->__exposureLabel setTextAlignment:1];
    v10 = +[CAMCaptureCapabilities capabilities];
    [v10 sfCameraFontSupported];

    v11 = CEKMonospacedStylisticNumeralFontOfSizeAndStyle();
    [(UILabel *)v6->__exposureLabel setFont:v11];

    [(CAMExposureBiasStatusIndicator *)v6 addSubview:v6->__exposureLabel];
    v12 = objc_alloc_init(CAMExposureBiasStatusIndicatorTickMarksView);
    ticksView = v6->__ticksView;
    v6->__ticksView = v12;

    [(CAMExposureBiasStatusIndicator *)v6 addSubview:v6->__ticksView];
    [(CAMExposureBiasStatusIndicator *)v6 _updateExposureLabel];
    [(CAMExposureBiasStatusIndicator *)v6 _updateTicks];
  }
  return v6;
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(CAMExposureBiasStatusIndicator *)self _exposureLabel];
  [v3 intrinsicContentSize];
  double v5 = v4;

  v6 = [(CAMExposureBiasStatusIndicator *)self _ticksView];
  [v6 intrinsicContentSize];
  double v8 = v7;
  double v10 = v9;

  double v11 = v5 + 4.0 + v10;
  double v12 = v8;
  result.height = v11;
  result.width = v12;
  return result;
}

- (double)_horizontalExposureLabelOffset
{
  [(CAMExposureBiasStatusIndicator *)self exposureBiasValue];
  double v4 = v3;
  BOOL v5 = [(CAMExposureBiasStatusIndicator *)self isExposureValueVisible];
  double result = 0.0;
  if (v5)
  {
    double result = -4.0;
    if (v4 <= 0.0)
    {
      double result = 0.0;
      if (v4 < 0.0) {
        return CAMPixelWidthForView(self) + -3.0;
      }
    }
  }
  return result;
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)CAMExposureBiasStatusIndicator;
  [(CAMControlStatusIndicator *)&v35 layoutSubviews];
  [(CAMExposureBiasStatusIndicator *)self bounds];
  double v3 = [(CAMExposureBiasStatusIndicator *)self _exposureLabel];
  [v3 intrinsicContentSize];

  double v4 = [(CAMExposureBiasStatusIndicator *)self _ticksView];
  [v4 intrinsicContentSize];
  double v6 = v5;
  double v8 = v7;

  double v9 = [(CAMExposureBiasStatusIndicator *)self _exposureLabel];
  double v10 = [v9 font];
  [v10 ascender];

  double v11 = [(CAMExposureBiasStatusIndicator *)self _exposureLabel];
  double v12 = [v11 font];
  [v12 capHeight];

  UIRectCenteredRect();
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  [(CAMExposureBiasStatusIndicator *)self _horizontalExposureLabelOffset];
  v36.origin.x = v14;
  v36.origin.y = v16;
  v36.size.width = v18;
  v36.size.height = v20;
  CGRectGetMaxY(v36);
  UIPointRoundToViewScale();
  double v22 = v21;
  double v24 = v23;
  v25 = [(CAMExposureBiasStatusIndicator *)self _ticksView];
  objc_msgSend(v25, "setFrame:", v22, v24, v6, v8);

  UIRectIntegralWithScale();
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(CAMExposureBiasStatusIndicator *)self _exposureLabel];
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

  [(CAMExposureBiasStatusIndicator *)self _layoutShadowClippingTick];
  [(CAMExposureBiasStatusIndicator *)self _layoutHighlightClippingTick];
}

- (void)_layoutShadowClippingTick
{
  [(CAMExposureBiasStatusIndicator *)self shadowClipping];
  -[CAMExposureBiasStatusIndicator _clippingTickFrameForClipping:leftAligned:](self, "_clippingTickFrameForClipping:leftAligned:", 1);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CAMExposureBiasStatusIndicator *)self _shadowClippingTick];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)_layoutHighlightClippingTick
{
  [(CAMExposureBiasStatusIndicator *)self highlightClipping];
  -[CAMExposureBiasStatusIndicator _clippingTickFrameForClipping:leftAligned:](self, "_clippingTickFrameForClipping:leftAligned:", 0);
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CAMExposureBiasStatusIndicator *)self _highlightClippingTick];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (BOOL)shouldUseOutline
{
  return 0;
}

- (id)imageNameForCurrentState
{
  return 0;
}

- (BOOL)supportsOrientations
{
  return 0;
}

- (void)_updateExposureLabel
{
  [(CAMExposureBiasStatusIndicator *)self exposureBiasValue];
  double v4 = v3;
  if ([(CAMExposureBiasStatusIndicator *)self isExposureValueVisible])
  {
    double v5 = +[CAMExposureSlider decimalFormatter];
    double v6 = [NSNumber numberWithDouble:v4];
    id v8 = [v5 stringFromNumber:v6];
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"."];
  }
  double v7 = [(CAMExposureBiasStatusIndicator *)self _exposureLabel];
  [v7 setText:v8];

  [(CAMExposureBiasStatusIndicator *)self setNeedsLayout];
}

- (void)_updateTicks
{
  [(CAMExposureBiasStatusIndicator *)self exposureBiasValue];
  CEKProgressClamped();
  uint64_t v4 = llround(v3 * 12.0);
  if (v4 >= 6) {
    uint64_t v5 = 6;
  }
  else {
    uint64_t v5 = v4;
  }
  if (v4 <= 6) {
    uint64_t v4 = 6;
  }
  uint64_t v6 = v4 - v5 + 1;
  id v7 = [(CAMExposureBiasStatusIndicator *)self _ticksView];
  objc_msgSend(v7, "setSelectedRange:", v5, v6);
}

- (CGRect)_clippingTickFrameForClipping:(double)a3 leftAligned:(BOOL)a4
{
  CEKProgressClamped();
  CEKInterpolate();
  uint64_t v6 = [(CAMExposureBiasStatusIndicator *)self _ticksView];
  [v6 frame];
  if (a4) {
    CGRectGetMinX(*(CGRect *)&v7);
  }
  else {
    CGRectGetMaxX(*(CGRect *)&v7);
  }

  id v11 = [(CAMExposureBiasStatusIndicator *)self _ticksView];
  [v11 frame];
  CGRectGetMaxY(v17);

  UIRectIntegralWithScale();
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (double)_clippingTickAlphaForClipping:(double)a3
{
  CEKProgressClamped();
  return result;
}

- (void)_updateShadowClippingTickAlpha
{
  [(CAMExposureBiasStatusIndicator *)self shadowClipping];
  -[CAMExposureBiasStatusIndicator _clippingTickAlphaForClipping:](self, "_clippingTickAlphaForClipping:");
  double v4 = v3;
  id v5 = [(CAMExposureBiasStatusIndicator *)self _shadowClippingTick];
  [v5 setAlpha:v4];
}

- (void)_updateHighlightClippingTickAlpha
{
  [(CAMExposureBiasStatusIndicator *)self highlightClipping];
  -[CAMExposureBiasStatusIndicator _clippingTickAlphaForClipping:](self, "_clippingTickAlphaForClipping:");
  double v4 = v3;
  id v5 = [(CAMExposureBiasStatusIndicator *)self _highlightClippingTick];
  [v5 setAlpha:v4];
}

- (void)setExposureBiasValue:(double)a3
{
  if (self->_exposureBiasValue != a3)
  {
    self->_exposureBiasValue = a3;
    [(CAMExposureBiasStatusIndicator *)self _updateTicks];
    [(CAMExposureBiasStatusIndicator *)self _updateExposureLabel];
  }
}

- (void)setExposureValueVisible:(BOOL)a3
{
  if (self->_exposureValueVisible != a3)
  {
    self->_exposureValueVisible = a3;
    [(CAMExposureBiasStatusIndicator *)self _updateExposureLabel];
  }
}

- (void)setShadowClipping:(double)a3
{
  CEKClamp();
  if (v4 != self->_shadowClipping)
  {
    self->_shadowClipping = sqrt(v4);
    id v5 = [(CAMExposureBiasStatusIndicator *)self _shadowClippingTick];

    if (!v5)
    {
      uint64_t v6 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      shadowClippingTick = self->__shadowClippingTick;
      self->__shadowClippingTick = v6;

      id v8 = CAMRedColor();
      [(UIView *)self->__shadowClippingTick setBackgroundColor:v8];

      [(CAMExposureBiasStatusIndicator *)self addSubview:self->__shadowClippingTick];
    }
    [(CAMExposureBiasStatusIndicator *)self _layoutShadowClippingTick];
    [(CAMExposureBiasStatusIndicator *)self _updateShadowClippingTickAlpha];
  }
}

- (void)setHighlightClipping:(double)a3
{
  CEKClamp();
  if (v4 != self->_highlightClipping)
  {
    self->_highlightClipping = sqrt(v4);
    id v5 = [(CAMExposureBiasStatusIndicator *)self _highlightClippingTick];

    if (!v5)
    {
      uint64_t v6 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      highlightClippingTick = self->__highlightClippingTick;
      self->__highlightClippingTick = v6;

      id v8 = CAMRedColor();
      [(UIView *)self->__highlightClippingTick setBackgroundColor:v8];

      [(CAMExposureBiasStatusIndicator *)self addSubview:self->__highlightClippingTick];
    }
    [(CAMExposureBiasStatusIndicator *)self _layoutHighlightClippingTick];
    [(CAMExposureBiasStatusIndicator *)self _updateHighlightClippingTickAlpha];
  }
}

- (id)accessibilityIdentifier
{
  return @"StatusBarExposureButton";
}

- (id)imageNameForAXHUD
{
  return @"plusminus.circle";
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CAMExposureBiasStatusIndicator;
  double v4 = [(CAMControlStatusIndicator *)&v10 hudItemForAccessibilityHUDManager:a3];
  id v5 = +[CAMExposureSlider decimalFormatter];
  uint64_t v6 = NSNumber;
  [(CAMExposureBiasStatusIndicator *)self exposureBiasValue];
  uint64_t v7 = objc_msgSend(v6, "numberWithDouble:");
  id v8 = [v5 stringFromNumber:v7];
  [v4 setTitle:v8];

  return v4;
}

- (double)exposureBiasValue
{
  return self->_exposureBiasValue;
}

- (BOOL)isExposureValueVisible
{
  return self->_exposureValueVisible;
}

- (double)shadowClipping
{
  return self->_shadowClipping;
}

- (double)highlightClipping
{
  return self->_highlightClipping;
}

- (UILabel)_exposureLabel
{
  return self->__exposureLabel;
}

- (CAMExposureBiasStatusIndicatorTickMarksView)_ticksView
{
  return self->__ticksView;
}

- (UIView)_shadowClippingTick
{
  return self->__shadowClippingTick;
}

- (UIView)_highlightClippingTick
{
  return self->__highlightClippingTick;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__highlightClippingTick, 0);
  objc_storeStrong((id *)&self->__shadowClippingTick, 0);
  objc_storeStrong((id *)&self->__ticksView, 0);
  objc_storeStrong((id *)&self->__exposureLabel, 0);
}

@end