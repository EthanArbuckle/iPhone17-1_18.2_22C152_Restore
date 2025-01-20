@interface BCUIChargeRing
- (BCUIChargeRing)init;
- (BOOL)_isPastThresholdForRingCapShadow;
- (BOOL)_shouldShowRingCapShadow;
- (BOOL)isCharging;
- (BOOL)isLowCharge;
- (BOOL)isLowPowerModeEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)requiredVisualStyleCategories;
- (UIImage)glyph;
- (UIViewControllerTransitionCoordinator)transitionCoordinator;
- (double)lineWidth;
- (double)ringScale;
- (double)scaleFactor;
- (id)_baseRing;
- (id)_chargeRing;
- (id)_glyphImageView;
- (id)_ringVisualStylingProvider;
- (id)_visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)percentCharge;
- (void)_beginAutomaticallyUpdatingPrimaryVisualStylingForView:(id)a3 observerBlock:(id)a4;
- (void)_beginAutomaticallyUpdatingVisualStylingForCategory:(int64_t)a3;
- (void)_configureBoltImageViewIfNecessary;
- (void)_configureBoltMaskImageViewIfNecessary;
- (void)_configureCaptureBackdropIfNecessary;
- (void)_configureRingCapShadowIfNecessary;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_stopAutomaticallyUpdatingVisualStylingForCategory:(int64_t)a3;
- (void)_updateVisualStylingForBaseRingIfNecessary;
- (void)_updateVisualStylingForBolt;
- (void)_updateVisualStylingWithProvidersFromStylingProvider:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setCharging:(BOOL)a3;
- (void)setGlyph:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setLowCharge:(BOOL)a3;
- (void)setLowPowerModeEnabled:(BOOL)a3;
- (void)setPercentCharge:(int64_t)a3;
- (void)setRingScale:(double)a3;
- (void)setScaleFactor:(double)a3;
- (void)setTransitionCoordinator:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation BCUIChargeRing

- (double)lineWidth
{
  double result = self->_lineWidth;
  if (result <= 0.0) {
    return 6.0;
  }
  return result;
}

- (void)setLineWidth:(double)a3
{
  if (self->_lineWidth != a3)
  {
    self->_lineWidth = a3;
    [(BCUIChargeRing *)self setNeedsLayout];
  }
}

- (void)setPercentCharge:(int64_t)a3
{
  uint64_t v3 = a3 & ~(a3 >> 63);
  if (v3 >= 100) {
    uint64_t v3 = 100;
  }
  if (v3 != self->_percentCharge)
  {
    self->_percentCharge = v3;
    if (v3)
    {
      v5 = [(BCUIChargeRing *)self _chargeRing];
      [v5 setFractionComplete:(double)self->_percentCharge / 100.0];
    }
    else
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __35__BCUIChargeRing_setPercentCharge___block_invoke;
      v9[3] = &unk_1E6BE0AC0;
      v9[4] = self;
      v5 = (void (**)(void))MEMORY[0x1E0182610](v9, a2);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
      if (WeakRetained)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __35__BCUIChargeRing_setPercentCharge___block_invoke_2;
        v7[3] = &unk_1E6BE0B38;
        v8 = v5;
        [WeakRetained animateAlongsideTransition:0 completion:v7];
      }
      else
      {
        v5[2](v5);
      }
    }
    [(BCUIChargeRing *)self setNeedsLayout];
  }
}

void __35__BCUIChargeRing_setPercentCharge___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 504))
  {
    [*(id *)(v1 + 416) removeFromSuperview];
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = *(void **)(v3 + 416);
    *(void *)(v3 + 416) = 0;

    [*(id *)(*(void *)(a1 + 32) + 440) removeFromSuperview];
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = *(void **)(v5 + 440);
    *(void *)(v5 + 440) = 0;

    [*(id *)(*(void *)(a1 + 32) + 432) removeFromSuperview];
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 432);
    *(void *)(v7 + 432) = 0;
  }
}

uint64_t __35__BCUIChargeRing_setPercentCharge___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setLowCharge:(BOOL)a3
{
  if (self->_lowCharge != a3)
  {
    self->_lowCharge = a3;
    [(BCUIChargeRing *)self setNeedsLayout];
  }
}

- (void)setCharging:(BOOL)a3
{
  if (self->_charging != a3)
  {
    self->_charging = a3;
    [(BCUIChargeRing *)self setNeedsLayout];
  }
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  if (self->_lowPowerModeEnabled != a3)
  {
    self->_lowPowerModeEnabled = a3;
    [(BCUIChargeRing *)self setNeedsLayout];
  }
}

- (void)setGlyph:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  p_glyph = &self->_glyph;
  if (self->_glyph != v5)
  {
    uint64_t v7 = v5;
    objc_storeStrong((id *)p_glyph, a3);
    p_glyph = (UIImage **)[(BCUIChargeRing *)self setNeedsLayout];
    uint64_t v5 = v7;
  }

  MEMORY[0x1F41817F8](p_glyph, v5);
}

- (void)setScaleFactor:(double)a3
{
  if (self->_scaleFactor != a3)
  {
    self->_scaleFactor = a3;
    [(BCUIChargeRing *)self setNeedsLayout];
  }
}

- (BCUIChargeRing)init
{
  v7.receiver = self;
  v7.super_class = (Class)BCUIChargeRing;
  v2 = [(BCUIChargeRing *)&v7 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __22__BCUIChargeRing_init__block_invoke;
    v5[3] = &unk_1E6BE09C8;
    v6 = v2;
    [(UIView *)v6 observeContentSizeCategoryChange:v5];
  }
  return v3;
}

uint64_t __22__BCUIChargeRing_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsLayout];
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)BCUIChargeRing;
  [(BCUIChargeRing *)&v4 didMoveToSuperview];
  uint64_t v3 = [(BCUIChargeRing *)self superview];
  [(BCUIChargeRing *)self _updateVisualStylingWithProvidersFromStylingProvider:v3];
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)BCUIChargeRing;
  [(BCUIChargeRing *)&v5 didMoveToWindow];
  uint64_t v3 = [(BCUIChargeRing *)self window];

  if (v3)
  {
    objc_super v4 = [(BCUIChargeRing *)self superview];
    [(BCUIChargeRing *)self _updateVisualStylingWithProvidersFromStylingProvider:v4];
  }
}

- (void)layoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)BCUIChargeRing;
  [(BCUIChargeRing *)&v45 layoutSubviews];
  [(BCUIChargeRing *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(BCUIChargeRing *)self lineWidth];
  double v12 = v11 * self->_scaleFactor * self->_ringScale;
  v13 = [(BCUIChargeRing *)self _baseRing];
  [v13 setLineWidth:v12];

  -[BCUIRingView setFrame:](self->_baseRing, "setFrame:", v4, v6, v8, v10);
  [(BCUIChargeRing *)self _updateVisualStylingForBaseRingIfNecessary];
  BOOL lowCharge = self->_lowCharge;
  BOOL lowPowerModeEnabled = self->_lowPowerModeEnabled;
  v16 = [MEMORY[0x1E4FB1618] systemGreenColor];
  if (lowPowerModeEnabled)
  {
    uint64_t v17 = [MEMORY[0x1E4FB1618] systemYellowColor];
  }
  else
  {
    if (!lowCharge) {
      goto LABEL_6;
    }
    uint64_t v17 = [MEMORY[0x1E4FB1618] systemRedColor];
  }
  v18 = (void *)v17;

  v16 = v18;
LABEL_6:
  chargeRing = self->_chargeRing;
  if (chargeRing)
  {
    [(BCUIRingView *)chargeRing setLineWidth:v12];
    -[BCUIRingView setFrame:](self->_chargeRing, "setFrame:", v4, v6, v8, v10);
    [(BCUIRingView *)self->_chargeRing setStrokeColor:v16];
    chargeRing = self->_chargeRing;
  }
  double v20 = 0.0;
  if (self->_percentCharge > 0) {
    double v20 = 1.0;
  }
  [(BCUIRingView *)chargeRing setAlpha:v20];
  ringCapShadow = self->_ringCapShadow;
  [(BCUIChargeRing *)self _configureRingCapShadowIfNecessary];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __32__BCUIChargeRing_layoutSubviews__block_invoke;
  v44[3] = &unk_1E6BE0A18;
  v44[4] = self;
  *(double *)&v44[5] = v4;
  *(double *)&v44[6] = v6;
  *(double *)&v44[7] = v8;
  *(double *)&v44[8] = v10;
  uint64_t v22 = MEMORY[0x1E0182610](v44);
  v23 = (void *)v22;
  if (ringCapShadow || !self->_ringCapShadow) {
    (*(void (**)(uint64_t))(v22 + 16))(v22);
  }
  else {
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v22];
  }
  v24 = self->_ringCapShadow;
  BOOL v25 = [(BCUIChargeRing *)self _shouldShowRingCapShadow];
  double v26 = 0.0;
  if (v25) {
    double v26 = 1.0;
  }
  [(BCUIRingCapShadow *)v24 setAlpha:v26];
  v27 = [(BCUIChargeRing *)self window];
  if (v27)
  {
    v28 = [(BCUIChargeRing *)self window];
    v29 = [v28 screen];
    [v29 scale];
  }
  else
  {
    v28 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v28 scale];
  }

  if (self->_charging)
  {
    [(BCUIRingView *)self->_baseRing bounds];
    CGRectGetMidX(v46);
    BSRectWithSize();
    UIRectCenteredAboutPoint();
    UIRectIntegralWithScale();
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __32__BCUIChargeRing_layoutSubviews__block_invoke_2;
    v43[3] = &unk_1E6BE0A18;
    v43[4] = self;
    v43[5] = v30;
    v43[6] = v31;
    v43[7] = v32;
    v43[8] = v33;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v43];
  }
  [(BCUIChargeRing *)self _updateVisualStylingForBolt];
  [(BCUIChargeRing *)self _configureCaptureBackdropIfNecessary];
  -[CABackdropLayer setFrame:](self->_captureBackdrop, "setFrame:", v4, v6, v8, v10);
  if (self->_charging) {
    double v34 = 1.0;
  }
  else {
    double v34 = 0.0;
  }
  [(UIImageView *)self->_boltMaskImageView setAlpha:v34];
  if (self->_charging) {
    double v35 = 1.0;
  }
  else {
    double v35 = 0.0;
  }
  [(UIImageView *)self->_boltImageView setAlpha:v35];
  v36 = [(BCUIChargeRing *)self _glyphImageView];
  v37 = [v36 image];
  glyph = self->_glyph;

  if (v37 != glyph)
  {
    [(UIImageView *)self->_glyphImageView setImage:self->_glyph];
    [(UIImageView *)self->_glyphImageView setContentMode:4];
    v39 = [MEMORY[0x1E4FB1830] configurationWithPointSize:self->_scaleFactor * 24.0 * self->_ringScale];
    v40 = [MEMORY[0x1E4FB1830] _configurationWithHierarchicalColors:MEMORY[0x1E4F1CBF0]];
    v41 = [v39 configurationByApplyingConfiguration:v40];

    [(UIImageView *)self->_glyphImageView setPreferredSymbolConfiguration:v41];
    [(UIImageView *)self->_glyphImageView pl_performCrossFadeIfNecessary];
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __32__BCUIChargeRing_layoutSubviews__block_invoke_3;
  v42[3] = &unk_1E6BE0A18;
  v42[4] = self;
  *(double *)&v42[5] = v4;
  *(double *)&v42[6] = v6;
  *(double *)&v42[7] = v8;
  *(double *)&v42[8] = v10;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v42];
}

uint64_t __32__BCUIChargeRing_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(*(void *)(a1 + 32) + 424) setArcFraction:(double)*(uint64_t *)(*(void *)(a1 + 32) + 504) / 100.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 424);

  return [v2 layoutIfNeeded];
}

uint64_t __32__BCUIChargeRing_layoutSubviews__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureBoltMaskImageViewIfNecessary];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 432), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(a1 + 32) _configureBoltImageViewIfNecessary];
  v2 = *(void **)(*(void *)(a1 + 32) + 440);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);

  return objc_msgSend(v2, "setFrame:", v3, v4, v5, v6);
}

uint64_t __32__BCUIChargeRing_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = [(BCUIChargeRing *)self _baseRing];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)BCUIChargeRing;
  [(BCUIChargeRing *)&v4 _dynamicUserInterfaceTraitDidChange];
  baseRingVisualStylingProvider = self->_baseRingVisualStylingProvider;
  self->_baseRingVisualStylingProvider = 0;

  [(BCUIChargeRing *)self _updateVisualStylingForBaseRingIfNecessary];
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F35180D8;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v11 = a3;
  if (v11)
  {
    double v7 = [(BCUIChargeRing *)self requiredVisualStyleCategories];
    double v8 = [NSNumber numberWithInteger:a4];
    int v9 = [v7 containsObject:v8];

    if (v9)
    {
      id v10 = [(BCUIChargeRing *)self _visualStylingProviderForCategory:a4];
      if (v10 != v11)
      {
        [(BCUIChargeRing *)self _stopAutomaticallyUpdatingVisualStylingForCategory:a4];
        objc_storeStrong((id *)&self->_visualStylingProvider, a3);
        [(BCUIChargeRing *)self _beginAutomaticallyUpdatingVisualStylingForCategory:a4];
      }
    }
  }
}

- (id)_chargeRing
{
  chargeRing = self->_chargeRing;
  if (!chargeRing)
  {
    objc_super v4 = objc_alloc_init(BCUIRingView);
    double v5 = self->_chargeRing;
    self->_chargeRing = v4;

    double v6 = self->_chargeRing;
    double v7 = [(BCUIChargeRing *)self _baseRing];
    [(BCUIChargeRing *)self insertSubview:v6 aboveSubview:v7];

    chargeRing = self->_chargeRing;
  }

  return chargeRing;
}

- (id)_baseRing
{
  baseRing = self->_baseRing;
  if (!baseRing)
  {
    objc_super v4 = objc_alloc_init(BCUIRingView);
    double v5 = self->_baseRing;
    self->_baseRing = v4;

    double v6 = self->_baseRing;
    double v7 = [MEMORY[0x1E4FB1618] secondarySystemFillColor];
    [(BCUIRingView *)v6 setStrokeColor:v7];

    [(BCUIRingView *)self->_baseRing setFractionComplete:1.0];
    [(BCUIChargeRing *)self addSubview:self->_baseRing];
    baseRing = self->_baseRing;
  }

  return baseRing;
}

- (id)_glyphImageView
{
  glyphImageView = self->_glyphImageView;
  if (!glyphImageView)
  {
    objc_super v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    double v5 = self->_glyphImageView;
    self->_glyphImageView = v4;

    chargeRing = self->_chargeRing;
    if (chargeRing)
    {
      double v7 = chargeRing;
    }
    else
    {
      double v7 = [(BCUIChargeRing *)self _baseRing];
    }
    double v8 = v7;
    [(BCUIChargeRing *)self insertSubview:self->_glyphImageView aboveSubview:v7];
    [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:self->_glyphImageView withStyle:0];

    glyphImageView = self->_glyphImageView;
  }

  return glyphImageView;
}

- (void)_configureBoltMaskImageViewIfNecessary
{
  if (!self->_boltMaskImageView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
    objc_super v4 = (void *)MEMORY[0x1E4FB1818];
    double v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v6 = [(BCUIChargeRing *)self traitCollection];
    double v7 = [v4 imageNamed:@"batterywidget.bolt.mask" inBundle:v5 compatibleWithTraitCollection:v6];
    double v8 = (UIImageView *)[v3 initWithImage:v7];
    boltMaskImageView = self->_boltMaskImageView;
    self->_boltMaskImageView = v8;

    [(UIImageView *)self->_boltMaskImageView setContentMode:1];
    id v10 = [(UIImageView *)self->_boltMaskImageView layer];
    [v10 setCompositingFilter:*MEMORY[0x1E4F3A098]];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __56__BCUIChargeRing__configureBoltMaskImageViewIfNecessary__block_invoke;
    v11[3] = &unk_1E6BE0AC0;
    v11[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v11];
    [(BCUIChargeRing *)self addSubview:self->_boltMaskImageView];
  }
}

uint64_t __56__BCUIChargeRing__configureBoltMaskImageViewIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
}

- (void)_configureBoltImageViewIfNecessary
{
  if (!self->_boltImageView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1838]);
    objc_super v4 = (void *)MEMORY[0x1E4FB1818];
    double v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v6 = [(BCUIChargeRing *)self traitCollection];
    double v7 = [v4 imageNamed:@"batterywidget.bolt" inBundle:v5 compatibleWithTraitCollection:v6];
    double v8 = (UIImageView *)[v3 initWithImage:v7];
    boltImageView = self->_boltImageView;
    self->_boltImageView = v8;

    [(UIImageView *)self->_boltImageView setContentMode:1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__BCUIChargeRing__configureBoltImageViewIfNecessary__block_invoke;
    v10[3] = &unk_1E6BE0AC0;
    v10[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v10];
    [(BCUIChargeRing *)self _configureBoltMaskImageViewIfNecessary];
    [(BCUIChargeRing *)self insertSubview:self->_boltImageView aboveSubview:self->_boltMaskImageView];
  }
}

uint64_t __52__BCUIChargeRing__configureBoltImageViewIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.0];
}

- (BOOL)_isPastThresholdForRingCapShadow
{
  return (double)self->_percentCharge / 100.0 >= 0.97;
}

- (BOOL)_shouldShowRingCapShadow
{
  return !self->_charging
      && [(BCUIChargeRing *)self _isPastThresholdForRingCapShadow];
}

- (void)_configureRingCapShadowIfNecessary
{
  BOOL v3 = [(BCUIChargeRing *)self _shouldShowRingCapShadow];
  [(BCUIChargeRing *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__BCUIChargeRing__configureRingCapShadowIfNecessary__block_invoke;
  v27[3] = &unk_1E6BE0AC0;
  v27[4] = self;
  double v12 = (void (**)(void))MEMORY[0x1E0182610](v27);
  [(BCUIRingCapShadow *)self->_ringCapShadow ringBounds];
  v29.origin.x = v13;
  v29.origin.y = v14;
  v29.size.double width = v15;
  v29.size.double height = v16;
  v28.origin.x = v5;
  v28.origin.y = v7;
  v28.size.double width = v9;
  v28.size.double height = v11;
  if (!CGRectEqualToRect(v28, v29)) {
    v12[2](v12);
  }
  ringCapShadow = self->_ringCapShadow;
  if (ringCapShadow) {
    BOOL v18 = 0;
  }
  else {
    BOOL v18 = v3;
  }
  if (v18)
  {
    [(BCUIRingView *)self->_chargeRing lineWidth];
    +[BCUIRingCapShadow ringCapShadowForRingWithBounds:lineWidth:](BCUIRingCapShadow, "ringCapShadowForRingWithBounds:lineWidth:", v5, v7, v9, v11, v19);
    double v20 = (BCUIRingCapShadow *)objc_claimAutoreleasedReturnValue();
    v21 = self->_ringCapShadow;
    self->_ringCapShadow = v20;

    [(BCUIChargeRing *)self insertSubview:self->_ringCapShadow aboveSubview:self->_chargeRing];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __52__BCUIChargeRing__configureRingCapShadowIfNecessary__block_invoke_2;
    v26[3] = &unk_1E6BE0AC0;
    v26[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v26];
  }
  else
  {
    if (ringCapShadow) {
      char v22 = v3;
    }
    else {
      char v22 = 1;
    }
    if ((v22 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
      if (WeakRetained)
      {
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __52__BCUIChargeRing__configureRingCapShadowIfNecessary__block_invoke_3;
        v24[3] = &unk_1E6BE0B60;
        v24[4] = self;
        BOOL v25 = v12;
        [WeakRetained animateAlongsideTransition:0 completion:v24];
      }
      else
      {
        v12[2](v12);
      }
    }
  }
}

void __52__BCUIChargeRing__configureRingCapShadowIfNecessary__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 424);
  *(void *)(v2 + 424) = 0;
}

uint64_t __52__BCUIChargeRing__configureRingCapShadowIfNecessary__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
}

uint64_t __52__BCUIChargeRing__configureRingCapShadowIfNecessary__block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isPastThresholdForRingCapShadow];
  if ((result & 1) == 0)
  {
    BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (id)_visualStylingProviderForCategory:(int64_t)a3
{
  return self->_visualStylingProvider;
}

- (void)_updateVisualStylingWithProvidersFromStylingProvider:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v5 = [(BCUIChargeRing *)self requiredVisualStyleCategories];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          double v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          double v11 = objc_msgSend(v4, "visualStylingProviderForCategory:", objc_msgSend(v10, "integerValue"));
          -[BCUIChargeRing setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", v11, [v10 integerValue]);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)_beginAutomaticallyUpdatingPrimaryVisualStylingForView:(id)a3 observerBlock:(id)a4
{
  if (a3)
  {
    visualStylingProvider = self->_visualStylingProvider;
    if (visualStylingProvider)
    {
      -[MTVisualStylingProvider automaticallyUpdateView:withStyle:andObserverBlock:](visualStylingProvider, "automaticallyUpdateView:withStyle:andObserverBlock:");
      [(BCUIChargeRing *)self setNeedsDisplay];
    }
  }
}

- (void)_beginAutomaticallyUpdatingVisualStylingForCategory:(int64_t)a3
{
  if (a3 == 1 && self->_visualStylingProvider)
  {
    [(BCUIChargeRing *)self _beginAutomaticallyUpdatingPrimaryVisualStylingForView:self->_glyphImageView observerBlock:0];
    [(BCUIChargeRing *)self _updateVisualStylingForBolt];
  }
}

- (void)_stopAutomaticallyUpdatingVisualStylingForCategory:(int64_t)a3
{
  if (a3 == 1)
  {
    v7[9] = v3;
    v7[10] = v4;
    if (self->_visualStylingProvider)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __69__BCUIChargeRing__stopAutomaticallyUpdatingVisualStylingForCategory___block_invoke;
      v7[3] = &unk_1E6BE0B88;
      void v7[4] = self;
      uint64_t v6 = (void (**)(void, void))MEMORY[0x1E0182610](v7, a2);
      ((void (**)(void, UIImageView *))v6)[2](v6, self->_glyphImageView);
      ((void (**)(void, UIImageView *))v6)[2](v6, self->_boltImageView);
    }
  }
}

uint64_t __69__BCUIChargeRing__stopAutomaticallyUpdatingVisualStylingForCategory___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(*(void *)(result + 32) + 464) stopAutomaticallyUpdatingView:a2];
    uint64_t v3 = *(void **)(v2 + 32);
    return [v3 setNeedsDisplay];
  }
  return result;
}

- (id)_ringVisualStylingProvider
{
  baseRingVisualStylingProvider = self->_baseRingVisualStylingProvider;
  if (!baseRingVisualStylingProvider)
  {
    uint64_t v4 = [(BCUIChargeRing *)self traitCollection];
    uint64_t v5 = [v4 userInterfaceStyle];
    uint64_t v6 = @"baseRingLight";
    if (v5 == 2) {
      uint64_t v6 = @"baseRingDark";
    }
    uint64_t v7 = v6;

    uint64_t v8 = (void *)MEMORY[0x1E4F743E8];
    double v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v10 = [v8 _visualStylingProviderForStyleSetNamed:v7 inBundle:v9];

    double v11 = self->_baseRingVisualStylingProvider;
    self->_baseRingVisualStylingProvider = v10;

    baseRingVisualStylingProvider = self->_baseRingVisualStylingProvider;
  }

  return baseRingVisualStylingProvider;
}

- (void)_updateVisualStylingForBaseRingIfNecessary
{
  if (!self->_baseRingVisualStylingProvider)
  {
    [(BCUIRingView *)self->_baseRing mt_removeAllVisualStyling];
    baseRing = self->_baseRing;
    id v5 = [(BCUIChargeRing *)self _ringVisualStylingProvider];
    uint64_t v4 = [v5 _visualStylingForStyle:1];
    [(BCUIRingView *)baseRing mt_replaceVisualStyling:v4];
  }
}

- (void)_configureCaptureBackdropIfNecessary
{
  captureBackdrop = self->_captureBackdrop;
  if (self->_charging)
  {
    if (!captureBackdrop)
    {
      uint64_t v4 = (CABackdropLayer *)objc_alloc_init(MEMORY[0x1E4F39B40]);
      id v5 = self->_captureBackdrop;
      self->_captureBackdrop = v4;

      [(CABackdropLayer *)self->_captureBackdrop setAllowsInPlaceFiltering:1];
      id v8 = [(BCUIChargeRing *)self layer];
      [v8 insertSublayer:self->_captureBackdrop atIndex:0];
    }
  }
  else if (captureBackdrop)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __54__BCUIChargeRing__configureCaptureBackdropIfNecessary__block_invoke;
    v11[3] = &unk_1E6BE0AC0;
    v11[4] = self;
    uint64_t v6 = (void (**)(void))MEMORY[0x1E0182610](v11, a2);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
    if (WeakRetained)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __54__BCUIChargeRing__configureCaptureBackdropIfNecessary__block_invoke_2;
      v9[3] = &unk_1E6BE0B38;
      double v10 = v6;
      [WeakRetained animateAlongsideTransition:0 completion:v9];
    }
    else
    {
      v6[2](v6);
    }
  }
}

void __54__BCUIChargeRing__configureCaptureBackdropIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 481))
  {
    [*(id *)(v1 + 448) removeFromSuperlayer];
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 448);
    *(void *)(v3 + 448) = 0;
  }
}

uint64_t __54__BCUIChargeRing__configureCaptureBackdropIfNecessary__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_updateVisualStylingForBolt
{
  if (self->_charging)
  {
    int64_t percentCharge = self->_percentCharge;
    visualStylingProvider = self->_visualStylingProvider;
    boltImageView = self->_boltImageView;
    if (percentCharge == 100)
    {
      [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:boltImageView];
      uint64_t v6 = self->_boltImageView;
      uint64_t v7 = [MEMORY[0x1E4FB1618] systemGreenColor];
      [(UIImageView *)v6 setTintColor:v7];
    }
    else
    {
      double v10 = [(MTVisualStylingProvider *)visualStylingProvider _visualStylingForContinuallyUpdatedView:boltImageView];

      if (!v10)
      {
        objc_initWeak(&location, self->_boltImageView);
        double v11 = self->_boltImageView;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __45__BCUIChargeRing__updateVisualStylingForBolt__block_invoke;
        v14[3] = &unk_1E6BE0BB0;
        objc_copyWeak(&v15, &location);
        [(BCUIChargeRing *)self _beginAutomaticallyUpdatingPrimaryVisualStylingForView:v11 observerBlock:v14];
        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
    double v9 = [(BCUIChargeRing *)self layer];
    [v9 setAllowsGroupBlending:1];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
    double v9 = WeakRetained;
    if (WeakRetained)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __45__BCUIChargeRing__updateVisualStylingForBolt__block_invoke_3;
      v13[3] = &unk_1E6BE0BD8;
      v13[4] = self;
      [WeakRetained animateAlongsideTransition:0 completion:v13];
    }
    else
    {
      long long v12 = [(BCUIChargeRing *)self layer];
      [v12 setAllowsGroupBlending:self->_charging];
    }
  }
}

id __45__BCUIChargeRing__updateVisualStylingForBolt__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained alpha];
  uint64_t v3 = v2;

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__BCUIChargeRing__updateVisualStylingForBolt__block_invoke_2;
  v6[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  v6[4] = v3;
  uint64_t v4 = (void *)MEMORY[0x1E0182610](v6);

  return v4;
}

uint64_t __45__BCUIChargeRing__updateVisualStylingForBolt__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:*(double *)(a1 + 32)];
}

void __45__BCUIChargeRing__updateVisualStylingForBolt__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  [v2 setAllowsGroupBlending:*(unsigned __int8 *)(*(void *)(a1 + 32) + 481)];
}

- (double)ringScale
{
  return self->_ringScale;
}

- (void)setRingScale:(double)a3
{
  self->_ringScale = a3;
}

- (int64_t)percentCharge
{
  return self->_percentCharge;
}

- (BOOL)isLowCharge
{
  return self->_lowCharge;
}

- (BOOL)isCharging
{
  return self->_charging;
}

- (BOOL)isLowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (UIImage)glyph
{
  return self->_glyph;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);

  return (UIViewControllerTransitionCoordinator *)WeakRetained;
}

- (void)setTransitionCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitionCoordinator);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_baseRingVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_captureBackdrop, 0);
  objc_storeStrong((id *)&self->_boltImageView, 0);
  objc_storeStrong((id *)&self->_boltMaskImageView, 0);
  objc_storeStrong((id *)&self->_ringCapShadow, 0);
  objc_storeStrong((id *)&self->_chargeRing, 0);

  objc_storeStrong((id *)&self->_baseRing, 0);
}

@end