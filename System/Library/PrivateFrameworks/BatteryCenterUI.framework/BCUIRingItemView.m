@interface BCUIRingItemView
+ (BOOL)isAX1PlusLayoutRequiredForContentSizeCategory:(id)a3;
+ (BOOL)isAX3PlusLayoutRequiredForContentSizeCategory:(id)a3;
+ (double)_ringLabelPaddingForContentSizeCategory:(id)a3;
- (BCUIRingItemView)initWithFrame:(CGRect)a3;
- (BOOL)_isPercentSymbolEnabledForRingItemStyle:(int64_t)a3 andContentSizeCategory:(id)a4;
- (BOOL)isCharging;
- (BOOL)isEmpty;
- (BOOL)isLowCharge;
- (BOOL)isLowPowerModeEnabled;
- (CGRect)_frameForChargeLabelWithSize:(CGSize)a3 baseLineOffsetFromBoundsTop:(double)a4 chargeRingSize:(CGSize)a5 style:(int64_t)a6 inBounds:(CGRect)a7 scale:(double)a8;
- (CGRect)_frameForChargeRingWithSize:(CGSize)a3 chargeLabelSize:(CGSize)a4 style:(int64_t)a5 inBounds:(CGRect)a6 scale:(double)a7;
- (CGRect)_largestPossibleFrameForChargeLabelGivenBounds:(CGRect)result chargeRingSize:(CGSize)a4 andRingLabelPadding:(double)a5;
- (CGSize)_sizeForChargeLabel:(id)a3 withStyle:(int64_t)a4 inBounds:(CGRect)a5 scale:(double)a6;
- (CGSize)_sizeForChargeRingWithStyle:(int64_t)a3 inBounds:(CGRect)a4 withPreferredContentSizeCategory:(id)a5;
- (NSArray)requiredVisualStyleCategories;
- (UIImage)glyph;
- (UIViewControllerTransitionCoordinator)transitionCoordinator;
- (double)ringLineWidth;
- (double)ringScale;
- (double)scaleFactor;
- (id)_chargeRing;
- (id)_lazyPercentChargeFormatter;
- (id)_percentChargeString:(int64_t)a3;
- (id)_visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)percentCharge;
- (int64_t)ringItemViewStyle;
- (void)_beginAutomaticallyUpdatingChargeLabelVisualStyling;
- (void)_configureChargeLabelForStyle:(int64_t)a3;
- (void)_stopAutomaticallyUpdatingVisualStyling;
- (void)_updateFontForChargeLabelForStyle:(int64_t)a3 andContentSizeCategory:(id)a4;
- (void)_updateVisualStylingWithProvidersFromStylingProvider:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setCharging:(BOOL)a3;
- (void)setEmpty:(BOOL)a3;
- (void)setGlyph:(id)a3;
- (void)setLowCharge:(BOOL)a3;
- (void)setLowPowerModeEnabled:(BOOL)a3;
- (void)setPercentCharge:(int64_t)a3;
- (void)setRingItemViewStyle:(int64_t)a3;
- (void)setRingLineWidth:(double)a3;
- (void)setRingScale:(double)a3;
- (void)setScaleFactor:(double)a3;
- (void)setTransitionCoordinator:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation BCUIRingItemView

+ (BOOL)isAX3PlusLayoutRequiredForContentSizeCategory:(id)a3
{
  return UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)a3, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending;
}

+ (BOOL)isAX1PlusLayoutRequiredForContentSizeCategory:(id)a3
{
  v3 = (NSString *)a3;
  v4 = (NSString *)*MEMORY[0x1E4FB2798];
  if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB2798])) {
    BOOL v5 = UIContentSizeCategoryCompareToCategory(v3, v4) == NSOrderedDescending;
  }
  else {
    BOOL v5 = 1;
  }

  return v5;
}

+ (double)_ringLabelPaddingForContentSizeCategory:(id)a3
{
  v3 = (NSString *)a3;
  double v4 = 10.0;
  if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB2798])
    && UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]))
  {
    if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB2788]))
    {
      if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB2780]))
      {
        if (UIContentSizeCategoryCompareToCategory(v3, (UIContentSizeCategory)*MEMORY[0x1E4FB2778])) {
          double v4 = 18.0;
        }
        else {
          double v4 = 0.0;
        }
      }
      else
      {
        double v4 = 3.0;
      }
    }
    else
    {
      double v4 = 8.0;
    }
  }

  return v4;
}

- (CGRect)_largestPossibleFrameForChargeLabelGivenBounds:(CGRect)result chargeRingSize:(CGSize)a4 andRingLabelPadding:(double)a5
{
  double v5 = result.size.height - (a4.height + a5 + 16.0);
  result.size.height = v5;
  return result;
}

- (void)setRingItemViewStyle:(int64_t)a3
{
  if (self->_ringItemViewStyle != a3)
  {
    self->_ringItemViewStyle = a3;
    [(BCUIRingItemView *)self setNeedsLayout];
  }
}

- (double)ringLineWidth
{
  [(BCUIChargeRing *)self->_chargeRing lineWidth];
  return result;
}

- (void)setRingLineWidth:(double)a3
{
  [(BCUIRingItemView *)self ringLineWidth];
  if (v5 != a3)
  {
    v6 = [(BCUIRingItemView *)self _chargeRing];
    [v6 setLineWidth:a3];

    [(BCUIRingItemView *)self setNeedsLayout];
  }
}

- (void)setRingScale:(double)a3
{
  if (self->_ringScale != a3)
  {
    self->_ringScale = a3;
    double v5 = [(BCUIRingItemView *)self _chargeRing];
    [v5 setRingScale:a3];

    [(BCUIRingItemView *)self setNeedsLayout];
  }
}

- (int64_t)percentCharge
{
  return [(BCUIChargeRing *)self->_chargeRing percentCharge];
}

- (void)setPercentCharge:(int64_t)a3
{
  if ([(BCUIRingItemView *)self percentCharge] != a3)
  {
    double v5 = [(BCUIRingItemView *)self _chargeRing];
    [v5 setPercentCharge:a3];

    [(BCUIRingItemView *)self setNeedsLayout];
  }
}

- (BOOL)isLowCharge
{
  return [(BCUIChargeRing *)self->_chargeRing isLowCharge];
}

- (void)setLowCharge:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BCUIRingItemView *)self isLowCharge] != a3)
  {
    id v5 = [(BCUIRingItemView *)self _chargeRing];
    [v5 setLowCharge:v3];
  }
}

- (BOOL)isCharging
{
  return [(BCUIChargeRing *)self->_chargeRing isCharging];
}

- (void)setCharging:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BCUIRingItemView *)self isCharging] != a3)
  {
    id v5 = [(BCUIRingItemView *)self _chargeRing];
    [v5 setCharging:v3];
  }
}

- (BOOL)isLowPowerModeEnabled
{
  return [(BCUIChargeRing *)self->_chargeRing isLowPowerModeEnabled];
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BCUIRingItemView *)self isLowPowerModeEnabled] != a3)
  {
    id v5 = [(BCUIRingItemView *)self _chargeRing];
    [v5 setLowPowerModeEnabled:v3];
  }
}

- (UIImage)glyph
{
  return [(BCUIChargeRing *)self->_chargeRing glyph];
}

- (void)setGlyph:(id)a3
{
  id v6 = a3;
  id v4 = [(BCUIRingItemView *)self glyph];

  if (v4 != v6)
  {
    id v5 = [(BCUIRingItemView *)self _chargeRing];
    [v5 setGlyph:v6];
  }
}

- (void)setScaleFactor:(double)a3
{
  if (self->_scaleFactor != a3)
  {
    self->_scaleFactor = a3;
    id v4 = [(BCUIRingItemView *)self _chargeRing];
    [v4 setScaleFactor:self->_scaleFactor];

    [(BCUIRingItemView *)self setNeedsLayout];
  }
}

- (void)setEmpty:(BOOL)a3
{
  if (self->_empty != a3)
  {
    self->_empty = a3;
    [(BCUIRingItemView *)self setNeedsLayout];
  }
}

- (void)setTransitionCoordinator:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_transitionCoordinator, obj);
    chargeRing = self->_chargeRing;
    id v7 = v5;
    [(BCUIChargeRing *)chargeRing setTransitionCoordinator:obj];
  }
}

- (BCUIRingItemView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BCUIRingItemView;
  BOOL v3 = -[BCUIRingItemView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    v3->_ringScale = 1.0;
    id v5 = [(BCUIRingItemView *)v3 _chargeRing];
    [v5 setRingScale:1.0];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34__BCUIRingItemView_initWithFrame___block_invoke;
    v7[3] = &unk_1E6BE09C8;
    v8 = v4;
    [(UIView *)v8 observeContentSizeCategoryChange:v7];
  }
  return v4;
}

uint64_t __34__BCUIRingItemView_initWithFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsLayout];
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)BCUIRingItemView;
  [(BCUIRingItemView *)&v4 didMoveToSuperview];
  BOOL v3 = [(BCUIRingItemView *)self superview];
  [(BCUIRingItemView *)self _updateVisualStylingWithProvidersFromStylingProvider:v3];
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)BCUIRingItemView;
  [(BCUIRingItemView *)&v5 didMoveToWindow];
  BOOL v3 = [(BCUIRingItemView *)self window];

  if (v3)
  {
    objc_super v4 = [(BCUIRingItemView *)self superview];
    [(BCUIRingItemView *)self _updateVisualStylingWithProvidersFromStylingProvider:v4];
  }
}

- (void)layoutSubviews
{
  v41.receiver = self;
  v41.super_class = (Class)BCUIRingItemView;
  [(BCUIRingItemView *)&v41 layoutSubviews];
  [(BCUIRingItemView *)self bounds];
  if (!CGRectIsEmpty(v42))
  {
    BOOL v3 = [(BCUIRingItemView *)self traitCollection];
    objc_super v4 = [v3 preferredContentSizeCategory];
    [(BCUIRingItemView *)self _configureChargeLabelForStyle:self->_ringItemViewStyle];
    [(BCUIRingItemView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(BCUIRingItemView *)self window];
    if (v13)
    {
      v14 = [(BCUIRingItemView *)self window];
      v15 = [v14 screen];
      [v15 scale];
      double v17 = v16;
    }
    else
    {
      v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v14 scale];
      double v17 = v18;
    }

    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x4010000000;
    v38[3] = &unk_1DAE05AED;
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    long long v39 = *MEMORY[0x1E4F1DB20];
    long long v40 = v19;
    -[BCUIRingItemView _sizeForChargeRingWithStyle:inBounds:withPreferredContentSizeCategory:](self, "_sizeForChargeRingWithStyle:inBounds:withPreferredContentSizeCategory:", self->_ringItemViewStyle, v4, v6, v8, v10, v12);
    double v22 = v21;
    if (self->_chargeLabel)
    {
      double v35 = v20;
      [(BCUIRingItemView *)self _updateFontForChargeLabelForStyle:self->_ringItemViewStyle andContentSizeCategory:v4];
      v23 = [(BCUIRingItemView *)self _lazyPercentChargeFormatter];
      objc_msgSend(v23, "bcui_setPercentSymbolEnabled:", -[BCUIRingItemView _isPercentSymbolEnabledForRingItemStyle:andContentSizeCategory:](self, "_isPercentSymbolEnabledForRingItemStyle:andContentSizeCategory:", self->_ringItemViewStyle, v4));

      v24 = [(BCUIRingItemView *)self _percentChargeString:[(BCUIRingItemView *)self percentCharge]];
      v25 = [(UILabel *)self->_chargeLabel text];
      char v26 = [v25 isEqualToString:v24];

      if ((v26 & 1) == 0)
      {
        [(UILabel *)self->_chargeLabel setText:v24];
        -[UILabel setAdjustsFontSizeToFitWidth:](self->_chargeLabel, "setAdjustsFontSizeToFitWidth:", (unint64_t)[v24 length] > 4);
        [(UILabel *)self->_chargeLabel pl_performCrossFadeIfNecessary];
      }
      -[BCUIRingItemView _sizeForChargeLabel:withStyle:inBounds:scale:](self, "_sizeForChargeLabel:withStyle:inBounds:scale:", self->_chargeLabel, self->_ringItemViewStyle, v6, v8, v10, v12, v17);
      double v28 = v27;
      double v30 = v29;
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __34__BCUIRingItemView_layoutSubviews__block_invoke;
      v37[3] = &unk_1E6BE09F0;
      *(double *)&v37[6] = v27;
      *(double *)&v37[7] = v29;
      v37[4] = self;
      v37[5] = v38;
      *(double *)&v37[8] = v35;
      *(double *)&v37[9] = v22;
      *(double *)&v37[10] = v6;
      *(double *)&v37[11] = v8;
      *(double *)&v37[12] = v10;
      *(double *)&v37[13] = v12;
      *(double *)&v37[14] = v17;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v37];

      double v20 = v35;
    }
    else
    {
      double v28 = *MEMORY[0x1E4F1DB30];
      double v30 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    -[BCUIRingItemView _frameForChargeRingWithSize:chargeLabelSize:style:inBounds:scale:](self, "_frameForChargeRingWithSize:chargeLabelSize:style:inBounds:scale:", self->_ringItemViewStyle, v20, v22, v28, v30, v6, v8, v10, v12, *(void *)&v17);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __34__BCUIRingItemView_layoutSubviews__block_invoke_2;
    v36[3] = &unk_1E6BE0A18;
    v36[4] = self;
    v36[5] = v31;
    v36[6] = v32;
    v36[7] = v33;
    v36[8] = v34;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v36];
    _Block_object_dispose(v38, 8);
  }
}

uint64_t __34__BCUIRingItemView_layoutSubviews__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[59];
  if (v3 == 2)
  {
    objc_super v4 = (void *)v2[52];
    BSRectWithSize();
    objc_msgSend(v4, "setFrame:");
    [*(id *)(*(void *)(a1 + 32) + 416) _firstLineBaselineOffsetFromBoundsTop];
    double v6 = v5;
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = v2[59];
  }
  else
  {
    double v6 = 0.0;
  }
  objc_msgSend(v2, "_frameForChargeLabelWithSize:baseLineOffsetFromBoundsTop:chargeRingSize:style:inBounds:scale:", v3, *(double *)(a1 + 48), *(double *)(a1 + 56), v6, *(double *)(a1 + 64), *(double *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112));
  double v7 = *(void **)(*(void *)(a1 + 40) + 8);
  void v7[4] = v8;
  v7[5] = v9;
  v7[6] = v10;
  v7[7] = v11;
  double v12 = *(void **)(*(void *)(a1 + 32) + 416);
  v13 = *(double **)(*(void *)(a1 + 40) + 8);
  double v14 = v13[4];
  double v15 = v13[5];
  double v16 = v13[6];
  double v17 = v13[7];

  return objc_msgSend(v12, "setFrame:", v14, v15, v16, v17);
}

void __34__BCUIRingItemView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _chargeRing];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F35180C0;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v11 = a3;
  if (v11)
  {
    double v7 = [(BCUIRingItemView *)self requiredVisualStyleCategories];
    uint64_t v8 = [NSNumber numberWithInteger:a4];
    int v9 = [v7 containsObject:v8];

    if (v9)
    {
      id v10 = [(BCUIRingItemView *)self _visualStylingProviderForCategory:a4];
      if (v10 != v11)
      {
        [(BCUIRingItemView *)self _stopAutomaticallyUpdatingVisualStyling];
        objc_storeStrong((id *)&self->_visualStylingProvider, a3);
        [(BCUIRingItemView *)self _beginAutomaticallyUpdatingChargeLabelVisualStyling];
      }
    }
  }
}

- (id)_chargeRing
{
  chargeRing = self->_chargeRing;
  if (!chargeRing)
  {
    objc_super v4 = objc_alloc_init(BCUIChargeRing);
    double v5 = self->_chargeRing;
    self->_chargeRing = v4;

    double v6 = self->_chargeRing;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);
    [(BCUIChargeRing *)v6 setTransitionCoordinator:WeakRetained];

    [(BCUIRingItemView *)self addSubview:self->_chargeRing];
    chargeRing = self->_chargeRing;
  }

  return chargeRing;
}

- (CGSize)_sizeForChargeRingWithStyle:(int64_t)a3 inBounds:(CGRect)a4 withPreferredContentSizeCategory:(id)a5
{
  if (self->_ringScale == 1.0) {
    double Width = CGRectGetWidth(a4);
  }
  else {
    double Width = self->_scaleFactor * 74.0;
  }
  if (a3 == 2) {
    double Width = (Width + -11.0) * 0.5;
  }
  double v7 = Width;
  result.height = v7;
  result.width = Width;
  return result;
}

- (CGRect)_frameForChargeRingWithSize:(CGSize)a3 chargeLabelSize:(CGSize)a4 style:(int64_t)a5 inBounds:(CGRect)a6 scale:(double)a7
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  BSRectWithSize();
  CGFloat v28 = v13;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v20 = CGRectGetHeight(v29);
  double ringScale = self->_ringScale;
  if (a5 == 2)
  {
    if ([(BCUIRingItemView *)self _shouldReverseLayoutDirection])
    {
      [(BCUIRingItemView *)self bounds];
      CGRectGetMaxX(v30);
      v31.origin.CGFloat x = v28;
      v31.origin.CGFloat y = v15;
      v31.size.CGFloat width = v17;
      v31.size.CGFloat height = v19;
      CGRectGetWidth(v31);
    }
  }
  else if (a5 == 1)
  {
    double v22 = [(BCUIRingItemView *)self traitCollection];
    v23 = [v22 preferredContentSizeCategory];
    +[BCUIRingItemView _ringLabelPaddingForContentSizeCategory:v23];
  }
  if (ringScale == 1.0) {
    UIRectIntegralWithScale();
  }
  else {
    UIRectCenteredXInRectScale();
  }
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (void)_configureChargeLabelForStyle:(int64_t)a3
{
  chargeLabel = self->_chargeLabel;
  if (a3)
  {
    if (!chargeLabel)
    {
      double v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      double v7 = self->_chargeLabel;
      self->_chargeLabel = v6;

      [(BCUIRingItemView *)self addSubview:self->_chargeLabel];
      [(BCUIRingItemView *)self _beginAutomaticallyUpdatingChargeLabelVisualStyling];
      chargeLabel = self->_chargeLabel;
    }
    if (a3 == 1)
    {
      uint64_t v8 = 1;
    }
    else if ([(BCUIRingItemView *)self _shouldReverseLayoutDirection])
    {
      uint64_t v8 = 2;
    }
    else
    {
      uint64_t v8 = 0;
    }
    [(UILabel *)chargeLabel setTextAlignment:v8];
    [(UILabel *)self->_chargeLabel setLineBreakMode:2];
    id v10 = self->_chargeLabel;
    double v11 = 0.0;
    if (!self->_empty) {
      double v11 = 1.0;
    }
    [(UILabel *)v10 setAlpha:v11];
  }
  else if (chargeLabel)
  {
    [(UILabel *)self->_chargeLabel removeFromSuperview];
    int v9 = self->_chargeLabel;
    self->_chargeLabel = 0;
  }
}

- (void)_updateFontForChargeLabelForStyle:(int64_t)a3 andContentSizeCategory:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  chargeLabel = self->_chargeLabel;
  if (chargeLabel)
  {
    if (a3 == 2)
    {
      id v13 = v6;
      int v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:self->_scaleFactor * 46.0];
      [(UILabel *)chargeLabel setFont:v9];
    }
    else
    {
      if (a3 != 1) {
        goto LABEL_7;
      }
      id v13 = v6;
      int v9 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v6];
      id v10 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2990] compatibleWithTraitCollection:v9];
      [v10 pointSize];
      double v12 = [v10 fontWithSize:v11 * self->_scaleFactor];

      [(UILabel *)self->_chargeLabel setFont:v12];
    }

    id v7 = v13;
  }
LABEL_7:

  MEMORY[0x1F41817F8](v6, v7);
}

- (id)_visualStylingProviderForCategory:(int64_t)a3
{
  if (a3 == 1) {
    return self->_visualStylingProvider;
  }
  else {
    return 0;
  }
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
    double v5 = [(BCUIRingItemView *)self requiredVisualStyleCategories];
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
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          double v11 = objc_msgSend(v4, "visualStylingProviderForCategory:", objc_msgSend(v10, "integerValue"));
          -[BCUIRingItemView setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", v11, [v10 integerValue]);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)_beginAutomaticallyUpdatingChargeLabelVisualStyling
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    chargeLabel = self->_chargeLabel;
    if (chargeLabel) {
      [(MTVisualStylingProvider *)visualStylingProvider automaticallyUpdateView:chargeLabel withStyle:0 andObserverBlock:&__block_literal_global];
    }
  }
}

id __71__BCUIRingItemView__beginAutomaticallyUpdatingChargeLabelVisualStyling__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 alpha];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__BCUIRingItemView__beginAutomaticallyUpdatingChargeLabelVisualStyling__block_invoke_2;
  v6[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  v6[4] = v3;
  id v4 = (void *)MEMORY[0x1E0182610](v6);

  return v4;
}

uint64_t __71__BCUIRingItemView__beginAutomaticallyUpdatingChargeLabelVisualStyling__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setAlpha:*(double *)(a1 + 32)];
}

- (void)_stopAutomaticallyUpdatingVisualStyling
{
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider)
  {
    if (self->_chargeLabel) {
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](visualStylingProvider, "stopAutomaticallyUpdatingView:");
    }
  }
}

- (CGSize)_sizeForChargeLabel:(id)a3 withStyle:(int64_t)a4 inBounds:(CGRect)a5 scale:(double)a6
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v11 = a3;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v12 = CGRectGetWidth(v21);
  double v13 = 0.0;
  if (a4 == 1) {
    double v13 = 12.0;
  }
  double v14 = v13 + v12;
  long long v15 = [v11 font];

  [v15 pointSize];
  double v17 = v16;

  double v18 = v14;
  double v19 = v17;
  result.CGFloat height = v19;
  result.CGFloat width = v18;
  return result;
}

- (CGRect)_frameForChargeLabelWithSize:(CGSize)a3 baseLineOffsetFromBoundsTop:(double)a4 chargeRingSize:(CGSize)a5 style:(int64_t)a6 inBounds:(CGRect)a7 scale:(double)a8
{
  BSRectWithSize();
  CGRectGetHeight(a7);
  if (a6 == 1)
  {
    id v10 = [(BCUIRingItemView *)self traitCollection];
    id v11 = [v10 preferredContentSizeCategory];
    +[BCUIRingItemView _ringLabelPaddingForContentSizeCategory:v11];
  }

  UIRectIntegralWithScale();
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (id)_lazyPercentChargeFormatter
{
  percentChargeFormatter = self->_percentChargeFormatter;
  if (!percentChargeFormatter)
  {
    objc_msgSend(MEMORY[0x1E4F28EE0], "bcui_newPercentChargeFormatter");
    id v4 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
    double v5 = self->_percentChargeFormatter;
    self->_percentChargeFormatter = v4;

    percentChargeFormatter = self->_percentChargeFormatter;
  }

  return percentChargeFormatter;
}

- (id)_percentChargeString:(int64_t)a3
{
  id v4 = [(BCUIRingItemView *)self _lazyPercentChargeFormatter];
  double v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 stringFromNumber:v5];

  return v6;
}

- (BOOL)_isPercentSymbolEnabledForRingItemStyle:(int64_t)a3 andContentSizeCategory:(id)a4
{
  return a3 != 1
      || UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)a4, (UIContentSizeCategory)*MEMORY[0x1E4FB2798]) == NSOrderedAscending;
}

- (double)ringScale
{
  return self->_ringScale;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (UIViewControllerTransitionCoordinator)transitionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transitionCoordinator);

  return (UIViewControllerTransitionCoordinator *)WeakRetained;
}

- (int64_t)ringItemViewStyle
{
  return self->_ringItemViewStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_transitionCoordinator);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_percentChargeFormatter, 0);
  objc_storeStrong((id *)&self->_chargeLabel, 0);

  objc_storeStrong((id *)&self->_chargeRing, 0);
}

@end