@interface BCUIRowView
+ (BOOL)isAX3PlusLayoutRequiredForContentSizeCategory:(id)a3;
- (BCUIRowView)init;
- (BOOL)isCharging;
- (BOOL)isEmpty;
- (BOOL)isLowCharge;
- (BOOL)isLowPowerModeEnabled;
- (BOOL)isSeparatorVisible;
- (CGRect)_batteryViewFrameforContentSize:(id)a3 percentChargeLabelFrame:(CGRect)a4;
- (CGRect)_glyphImageViewFrameForContentSizeCategory:(id)a3;
- (CGRect)_nameLabelFrameForContentSize:(id)a3 percentChargeLabelFrame:(CGRect)a4;
- (CGRect)_percentChargeLabelFrameForContentSizeCategory:(id)a3;
- (CGRect)_sepatorFrameForContentSize:(id)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSString)name;
- (UIImage)glyph;
- (double)scaleFactor;
- (id)_lazyPercentChargeFormatter;
- (id)_percentChargeString:(int64_t)a3;
- (id)_visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)percentCharge;
- (void)_beginAutomaticallyUpdatingVisualStylingForCategory:(int64_t)a3;
- (void)_configureBatteryViewIfNecessary;
- (void)_configureGlyphImageViewIfNecessary;
- (void)_configureNameLabelIfNecessary;
- (void)_configurePercentChargeLabelIfNecessary;
- (void)_configureSeparatorIfNecessary;
- (void)_stopAutomaticallyUpdatingVisualStylingForCategory:(int64_t)a3;
- (void)_updateBatteryViewIfNeccessary;
- (void)_updateGlyphImageViewIfNecessary:(id)a3;
- (void)_updateNameLabelIfNecessary:(id)a3;
- (void)_updatePercentChargeLabelIfNecessary:(id)a3;
- (void)_updateVisualStylingWithProvidersFromStylingProvider:(id)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setCharging:(BOOL)a3;
- (void)setEmpty:(BOOL)a3;
- (void)setGlyph:(id)a3;
- (void)setLowCharge:(BOOL)a3;
- (void)setLowPowerModeEnabled:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setPercentCharge:(int64_t)a3;
- (void)setScaleFactor:(double)a3;
- (void)setSeparatorVisible:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation BCUIRowView

+ (BOOL)isAX3PlusLayoutRequiredForContentSizeCategory:(id)a3
{
  return UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)a3, (UIContentSizeCategory)*MEMORY[0x1E4FB2790]) == NSOrderedDescending;
}

- (BOOL)isSeparatorVisible
{
  return self->_separator != 0;
}

- (void)setSeparatorVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(BCUIRowView *)self isSeparatorVisible] != a3)
  {
    if (v3)
    {
      [(BCUIRowView *)self _configureSeparatorIfNecessary];
    }
    else
    {
      [(UIView *)self->_separator removeFromSuperview];
      separator = self->_separator;
      self->_separator = 0;
    }
    [(BCUIRowView *)self setNeedsLayout];
  }
}

- (void)setPercentCharge:(int64_t)a3
{
  if (!self->_empty && self->_percentCharge != a3)
  {
    self->_percentCharge = a3;
    [(BCUIRowView *)self setNeedsLayout];
  }
}

- (void)setCharging:(BOOL)a3
{
  if (!self->_empty && self->_charging != a3)
  {
    self->_charging = a3;
    [(BCUIRowView *)self _configureBatteryViewIfNecessary];
    [(_UIStaticBatteryView *)self->_batteryView setShowsInlineChargingIndicator:self->_charging];
    [(BCUIRowView *)self setNeedsLayout];
  }
}

- (void)setLowCharge:(BOOL)a3
{
  if (!self->_empty && self->_lowCharge != a3)
  {
    self->_lowCharge = a3;
    if (a3) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    [(BCUIRowView *)self _configureBatteryViewIfNecessary];
    [(_UIStaticBatteryView *)self->_batteryView setLowBatteryMode:v4];
    [(BCUIRowView *)self setNeedsLayout];
  }
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  if (!self->_empty && self->_lowPowerModeEnabled != a3)
  {
    self->_lowPowerModeEnabled = a3;
    [(BCUIRowView *)self _configureBatteryViewIfNecessary];
    [(_UIStaticBatteryView *)self->_batteryView setSaverModeActive:self->_lowPowerModeEnabled];
    [(BCUIRowView *)self setNeedsLayout];
  }
}

- (void)setGlyph:(id)a3
{
  p_glyph = (UIImage **)a3;
  v6 = (UIImage *)p_glyph;
  if (!self->_empty)
  {
    p_glyph = &self->_glyph;
    if (self->_glyph != v6)
    {
      v7 = v6;
      objc_storeStrong((id *)p_glyph, a3);
      p_glyph = (UIImage **)[(BCUIRowView *)self setNeedsLayout];
      v6 = v7;
    }
  }

  MEMORY[0x1F41817F8](p_glyph, v6);
}

- (void)setScaleFactor:(double)a3
{
  if (self->_scaleFactor != a3)
  {
    self->_scaleFactor = a3;
    [(BCUIRowView *)self setNeedsLayout];
  }
}

- (void)setName:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  if (!self->_empty)
  {
    uint64_t v7 = v5;
    uint64_t v5 = [(NSString *)self->_name isEqualToString:v5];
    uint64_t v6 = v7;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_name, a3);
      uint64_t v5 = [(BCUIRowView *)self setNeedsLayout];
      uint64_t v6 = v7;
    }
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)setEmpty:(BOOL)a3
{
  if (self->_empty != a3)
  {
    self->_empty = a3;
    [(BCUIRowView *)self setNeedsLayout];
  }
}

- (BCUIRowView)init
{
  v7.receiver = self;
  v7.super_class = (Class)BCUIRowView;
  v2 = [(BCUIRowView *)&v7 init];
  BOOL v3 = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __19__BCUIRowView_init__block_invoke;
    v5[3] = &unk_1E6BE09C8;
    uint64_t v6 = v2;
    [(UIView *)v6 observeContentSizeCategoryChange:v5];
  }
  return v3;
}

uint64_t __19__BCUIRowView_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNeedsLayout];
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)BCUIRowView;
  [(BCUIRowView *)&v4 didMoveToSuperview];
  BOOL v3 = [(BCUIRowView *)self superview];
  [(BCUIRowView *)self _updateVisualStylingWithProvidersFromStylingProvider:v3];
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)BCUIRowView;
  [(BCUIRowView *)&v5 didMoveToWindow];
  BOOL v3 = [(BCUIRowView *)self window];

  if (v3)
  {
    objc_super v4 = [(BCUIRowView *)self superview];
    [(BCUIRowView *)self _updateVisualStylingWithProvidersFromStylingProvider:v4];
  }
}

- (void)layoutSubviews
{
  v37.receiver = self;
  v37.super_class = (Class)BCUIRowView;
  [(BCUIRowView *)&v37 layoutSubviews];
  BOOL v3 = [(BCUIRowView *)self traitCollection];
  objc_super v4 = [v3 preferredContentSizeCategory];

  if (self->_empty)
  {
    [(UIImageView *)self->_glyphImageView removeFromSuperview];
    glyphImageView = self->_glyphImageView;
    self->_glyphImageView = 0;

    [(UILabel *)self->_percentChargeLabel removeFromSuperview];
    percentChargeLabel = self->_percentChargeLabel;
    self->_percentChargeLabel = 0;

    [(UILabel *)self->_nameLabel removeFromSuperview];
    nameLabel = self->_nameLabel;
    self->_nameLabel = 0;

    batteryView = self->_batteryView;
LABEL_3:
    [(_UIStaticBatteryView *)batteryView removeFromSuperview];
    v9 = self->_batteryView;
    self->_batteryView = 0;

    goto LABEL_4;
  }
  if (self->_glyph)
  {
    [(BCUIRowView *)self _configureGlyphImageViewIfNecessary];
    [(BCUIRowView *)self _updateGlyphImageViewIfNecessary:v4];
    [(BCUIRowView *)self _glyphImageViewFrameForContentSizeCategory:v4];
    CGFloat x = v38.origin.x;
    CGFloat y = v38.origin.y;
    CGFloat width = v38.size.width;
    CGFloat height = v38.size.height;
    if (!CGRectIsNull(v38))
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __29__BCUIRowView_layoutSubviews__block_invoke;
      v36[3] = &unk_1E6BE0A18;
      v36[4] = self;
      *(CGFloat *)&v36[5] = x;
      *(CGFloat *)&v36[6] = y;
      *(CGFloat *)&v36[7] = width;
      *(CGFloat *)&v36[8] = height;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v36];
    }
  }
  else
  {
    [(UIImageView *)self->_glyphImageView removeFromSuperview];
    v14 = self->_glyphImageView;
    self->_glyphImageView = 0;
  }
  [(BCUIRowView *)self _configurePercentChargeLabelIfNecessary];
  [(BCUIRowView *)self _updatePercentChargeLabelIfNecessary:v4];
  [(BCUIRowView *)self _percentChargeLabelFrameForContentSizeCategory:v4];
  double v19 = v15;
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  if (self->_percentCharge)
  {
    if (!CGRectIsNull(*(CGRect *)&v15))
    {
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __29__BCUIRowView_layoutSubviews__block_invoke_2;
      v35[3] = &unk_1E6BE0A18;
      v35[4] = self;
      *(double *)&v35[5] = v19;
      *(double *)&v35[6] = v20;
      *(double *)&v35[7] = v21;
      *(double *)&v35[8] = v22;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v35];
    }
  }
  else
  {
    [(UILabel *)self->_percentChargeLabel removeFromSuperview];
    v23 = self->_percentChargeLabel;
    self->_percentChargeLabel = 0;
  }
  if (self->_name)
  {
    [(BCUIRowView *)self _configureNameLabelIfNecessary];
    [(BCUIRowView *)self _updateNameLabelIfNecessary:v4];
    -[BCUIRowView _nameLabelFrameForContentSize:percentChargeLabelFrame:](self, "_nameLabelFrameForContentSize:percentChargeLabelFrame:", v4, v19, v20, v21, v22);
    CGFloat v24 = v39.origin.x;
    CGFloat v25 = v39.origin.y;
    CGFloat v26 = v39.size.width;
    CGFloat v27 = v39.size.height;
    if (!CGRectIsNull(v39))
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __29__BCUIRowView_layoutSubviews__block_invoke_3;
      v34[3] = &unk_1E6BE0A18;
      v34[4] = self;
      *(CGFloat *)&v34[5] = v24;
      *(CGFloat *)&v34[6] = v25;
      *(CGFloat *)&v34[7] = v26;
      *(CGFloat *)&v34[8] = v27;
      [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v34];
    }
    [(BCUIRowView *)self _updateNameLabelIfNecessary:v4];
  }
  else
  {
    [(UILabel *)self->_nameLabel removeFromSuperview];
    v28 = self->_nameLabel;
    self->_nameLabel = 0;
  }
  [(BCUIRowView *)self _configureBatteryViewIfNecessary];
  if (!self->_batteryView)
  {
    batteryView = 0;
    goto LABEL_3;
  }
  [(BCUIRowView *)self _updateBatteryViewIfNeccessary];
  -[BCUIRowView _batteryViewFrameforContentSize:percentChargeLabelFrame:](self, "_batteryViewFrameforContentSize:percentChargeLabelFrame:", v4, v19, v20, v21, v22);
  CGFloat v29 = v40.origin.x;
  CGFloat v30 = v40.origin.y;
  CGFloat v31 = v40.size.width;
  CGFloat v32 = v40.size.height;
  if (!CGRectIsNull(v40))
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __29__BCUIRowView_layoutSubviews__block_invoke_4;
    v33[3] = &unk_1E6BE0A18;
    v33[4] = self;
    *(CGFloat *)&v33[5] = v29;
    *(CGFloat *)&v33[6] = v30;
    *(CGFloat *)&v33[7] = v31;
    *(CGFloat *)&v33[8] = v32;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v33];
  }
LABEL_4:
  [(BCUIRowView *)self _sepatorFrameForContentSize:v4];
  -[UIView setFrame:](self->_separator, "setFrame:");
}

uint64_t __29__BCUIRowView_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __29__BCUIRowView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __29__BCUIRowView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 416), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __29__BCUIRowView_layoutSubviews__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 440), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F35180F0;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v14 = a3;
  if (v14)
  {
    uint64_t v6 = [(BCUIRowView *)self requiredVisualStyleCategories];
    objc_super v7 = [NSNumber numberWithInteger:a4];
    int v8 = [v6 containsObject:v7];

    if (v8)
    {
      id v9 = [(BCUIRowView *)self _visualStylingProviderForCategory:a4];
      if (v9 != v14)
      {
        [(BCUIRowView *)self _stopAutomaticallyUpdatingVisualStylingForCategory:a4];
        categoriesToVisualStylingProvider = self->_categoriesToVisualStylingProvider;
        if (!categoriesToVisualStylingProvider)
        {
          v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v12 = self->_categoriesToVisualStylingProvider;
          self->_categoriesToVisualStylingProvider = v11;

          categoriesToVisualStylingProvider = self->_categoriesToVisualStylingProvider;
        }
        v13 = [NSNumber numberWithInteger:a4];
        [(NSMutableDictionary *)categoriesToVisualStylingProvider setObject:v14 forKey:v13];

        [(BCUIRowView *)self _beginAutomaticallyUpdatingVisualStylingForCategory:a4];
      }
    }
  }
}

- (void)_updateGlyphImageViewIfNecessary:(id)a3
{
  id v14 = a3;
  objc_super v4 = [(UIImageView *)self->_glyphImageView image];
  glyph = self->_glyph;

  if (v4 != glyph)
  {
    [(UIImageView *)self->_glyphImageView setImage:self->_glyph];
    [(UIImageView *)self->_glyphImageView setContentMode:4];
    uint64_t v6 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v7 = *MEMORY[0x1E4FB2950];
    int v8 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v14];
    id v9 = [v6 preferredFontForTextStyle:v7 compatibleWithTraitCollection:v8];

    v10 = (void *)MEMORY[0x1E4FB1830];
    [v9 pointSize];
    v11 = objc_msgSend(v10, "configurationWithPointSize:weight:scale:", 4, 3);
    v12 = [MEMORY[0x1E4FB1830] _configurationWithHierarchicalColors:MEMORY[0x1E4F1CBF0]];
    v13 = [v11 configurationByApplyingConfiguration:v12];

    [(UIImageView *)self->_glyphImageView setPreferredSymbolConfiguration:v13];
    [(UIImageView *)self->_glyphImageView pl_performCrossFadeIfNecessary];
  }
}

- (void)_updatePercentChargeLabelIfNecessary:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v5 = *MEMORY[0x1E4FB28D8];
  uint64_t v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:a3];
  uint64_t v7 = [v4 preferredFontForTextStyle:v5 compatibleWithTraitCollection:v6];

  [v7 pointSize];
  id v11 = [v7 fontWithSize:v8 * self->_scaleFactor];

  [(UILabel *)self->_percentChargeLabel setFont:v11];
  id v9 = [(BCUIRowView *)self _percentChargeString:self->_percentCharge];
  v10 = [(UILabel *)self->_percentChargeLabel text];
  LOBYTE(v6) = [v10 isEqualToString:v9];

  if ((v6 & 1) == 0)
  {
    [(UILabel *)self->_percentChargeLabel setText:v9];
    [(UILabel *)self->_percentChargeLabel pl_performCrossFadeIfNecessary];
  }
}

- (void)_updateNameLabelIfNecessary:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v5 = *MEMORY[0x1E4FB2950];
  uint64_t v6 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:a3];
  uint64_t v7 = [v4 preferredFontForTextStyle:v5 compatibleWithTraitCollection:v6];

  [v7 pointSize];
  id v10 = [v7 fontWithSize:v8 * self->_scaleFactor];

  [(UILabel *)self->_nameLabel setFont:v10];
  id v9 = [(UILabel *)self->_nameLabel text];
  LOBYTE(v5) = [v9 isEqualToString:self->_name];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_nameLabel setText:self->_name];
    [(UILabel *)self->_nameLabel pl_performCrossFadeIfNecessary];
  }
}

- (void)_updateBatteryViewIfNeccessary
{
}

- (CGRect)_glyphImageViewFrameForContentSizeCategory:(id)a3
{
  id v4 = a3;
  int v5 = [(id)objc_opt_class() isAX3PlusLayoutRequiredForContentSizeCategory:v4];

  [(BCUIRowView *)self bounds];
  double v10 = BCUI6x8ColumnWidthForBounds(v6, v7, v8, v9);
  [(BCUIRowView *)self bounds];
  double Height = CGRectGetHeight(v19);
  if (v5) {
    double v12 = 80.0;
  }
  else {
    double v12 = v10;
  }
  if (v5) {
    double v13 = 0.0;
  }
  else {
    double v13 = 8.0;
  }
  -[UIImageView sizeThatFits:](self->_glyphImageView, "sizeThatFits:", v12, Height);
  BSRectWithSize();
  BSRectWithSize();
  if ([(BCUIRowView *)self _shouldReverseLayoutDirection])
  {
    [(BCUIRowView *)self bounds];
    double v14 = CGRectGetWidth(v20) - v13;
  }
  -[UIImageView setContentMode:](self->_glyphImageView, "setContentMode:", 1, v14);
  UIRectCenteredIntegralRectScale();
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)_percentChargeLabelFrameForContentSizeCategory:(id)a3
{
  id v4 = a3;
  int v5 = [(BCUIRowView *)self window];
  if (v5)
  {
    double v6 = [(BCUIRowView *)self window];
    double v7 = [v6 screen];
    [v7 scale];
  }
  else
  {
    double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
  }

  [(BCUIRowView *)self bounds];
  double Height = CGRectGetHeight(v34);
  int v9 = [(BCUIRowView *)self _shouldReverseLayoutDirection];
  int v10 = [(id)objc_opt_class() isAX3PlusLayoutRequiredForContentSizeCategory:v4];

  if (v10)
  {
    if ((v9 & 1) == 0) {
      [(UILabel *)self->_percentChargeLabel setTextAlignment:3];
    }
    percentChargeLabel = self->_percentChargeLabel;
    [(BCUIRowView *)self bounds];
    -[UILabel sizeThatFits:](percentChargeLabel, "sizeThatFits:", CGRectGetWidth(v35) + -80.0 + -8.0, Height * 0.5 + -16.0);
    if (v9)
    {
      [(BCUIRowView *)self bounds];
      CGRectGetWidth(v36);
    }
    [(BCUIRowView *)self bounds];
    CGRectGetWidth(v37);
    UIRectCenteredYInRectScale();
  }
  else
  {
    [(BCUIRowView *)self bounds];
    double v16 = BCUI6x8ColumnWidthForBounds(v12, v13, v14, v15);
    BSRectWithSize();
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    if (v9)
    {
      double v23 = v16 + 16.0;
    }
    else
    {
      [(BCUIRowView *)self bounds];
      double v23 = CGRectGetWidth(v38) + -16.0 + v16 * -2.0;
    }
    v28 = self->_percentChargeLabel;
    [(BCUIRowView *)self bounds];
    -[UILabel sizeThatFits:](v28, "sizeThatFits:", v29, v30);
    double v32 = v31;
    v39.origin.CGFloat x = v23;
    v39.origin.CGFloat y = v18;
    v39.size.CGFloat width = v20;
    v39.size.CGFloat height = v22;
    if (v32 <= CGRectGetWidth(v39)) {
      char v33 = 1;
    }
    else {
      char v33 = v9;
    }
    if ((v33 & 1) == 0)
    {
      v40.origin.CGFloat x = v23;
      v40.origin.CGFloat y = v18;
      v40.size.CGFloat width = v20;
      v40.size.CGFloat height = v22;
      CGRectGetWidth(v40);
    }
    UIRectIntegralWithScale();
  }
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (CGRect)_nameLabelFrameForContentSize:(id)a3 percentChargeLabelFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  int v10 = [(BCUIRowView *)self window];
  if (v10)
  {
    id v11 = [(BCUIRowView *)self window];
    double v12 = [v11 screen];
    [v12 scale];
  }
  else
  {
    id v11 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v11 scale];
  }

  [(BCUIRowView *)self bounds];
  CGRectGetHeight(v23);
  int v13 = [(id)objc_opt_class() isAX3PlusLayoutRequiredForContentSizeCategory:v9];

  [(BCUIRowView *)self bounds];
  if (v13)
  {
    CGRectGetWidth(*(CGRect *)&v14);
    BSRectWithSize();
    if ([(BCUIRowView *)self _shouldReverseLayoutDirection])
    {
      [(BCUIRowView *)self bounds];
      CGRectGetWidth(v24);
    }
    [(BCUIRowView *)self bounds];
    CGRectGetWidth(v28);
  }
  else
  {
    BCUI6x8ColumnWidthForBounds(v14, v15, v16, v17);
    BSRectWithSize();
    if ([(BCUIRowView *)self _shouldReverseLayoutDirection])
    {
      [(BCUIRowView *)self bounds];
      CGRectGetWidth(v25);
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      CGRectGetMaxX(v26);
      v27.origin.CGFloat x = x;
      v27.origin.CGFloat y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      CGRectGetMaxX(v27);
    }
    else
    {
      v29.origin.CGFloat x = x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      CGRectGetMinX(v29);
    }
  }

  UIRectIntegralWithScale();
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)_batteryViewFrameforContentSize:(id)a3 percentChargeLabelFrame:(CGRect)a4
{
  id v5 = a3;
  double v6 = [(BCUIRowView *)self window];
  if (v6)
  {
    double v7 = [(BCUIRowView *)self window];
    double v8 = [v7 screen];
    [v8 scale];
  }
  else
  {
    double v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
  }

  [(BCUIRowView *)self bounds];
  CGRectGetHeight(v40);
  [(_UIStaticBatteryView *)self->_batteryView intrinsicContentSize];
  BSRectWithSize();
  double v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [(BCUIRowView *)self bounds];
  double v21 = BCUI6x8ColumnWidthForBounds(v17, v18, v19, v20);
  int v22 = [(id)objc_opt_class() isAX3PlusLayoutRequiredForContentSizeCategory:v5];

  if (v22)
  {
    if ([(BCUIRowView *)self _shouldReverseLayoutDirection])
    {
      [(BCUIRowView *)self bounds];
      CGRectGetWidth(v41);
    }
    UIRectCenteredIntegralRectScale();
  }
  else
  {
    CGFloat rect = v10;
    BSRectWithSize();
    uint64_t v24 = v23;
    uint64_t v26 = v25;
    uint64_t v28 = v27;
    double v29 = 8.0;
    if (([(BCUIRowView *)self _shouldReverseLayoutDirection] & 1) == 0)
    {
      [(BCUIRowView *)self bounds];
      double v29 = CGRectGetWidth(v42) + -8.0 - v21;
    }
    int v30 = [(BCUIRowView *)self _shouldReverseLayoutDirection];
    double v31 = v29;
    uint64_t v32 = v24;
    uint64_t v33 = v26;
    uint64_t v34 = v28;
    if (v30)
    {
      CGRectGetMaxX(*(CGRect *)&v31);
      v43.origin.CGFloat x = rect;
      v43.origin.CGFloat y = v12;
      v43.size.CGFloat width = v14;
      v43.size.CGFloat height = v16;
      CGRectGetWidth(v43);
    }
    else
    {
      CGRectGetMinX(*(CGRect *)&v31);
    }
    UIRectCenteredYInRectScale();
  }
  result.size.CGFloat height = v38;
  result.size.CGFloat width = v37;
  result.origin.CGFloat y = v36;
  result.origin.CGFloat x = v35;
  return result;
}

- (CGRect)_sepatorFrameForContentSize:(id)a3
{
  if (self->_separator)
  {
    id v4 = a3;
    [(BCUIRowView *)self bounds];
    BCUI6x8ColumnWidthForBounds(v5, v6, v7, v8);
    [(id)objc_opt_class() isAX3PlusLayoutRequiredForContentSizeCategory:v4];

    double v9 = [(BCUIRowView *)self window];
    if (v9)
    {
      double v10 = [(BCUIRowView *)self window];
      double v11 = [v10 screen];
      [v11 scale];
    }
    else
    {
      double v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v10 scale];
    }

    [(BCUIRowView *)self bounds];
    CGRectGetWidth(v16);
    [(BCUIRowView *)self _shouldReverseLayoutDirection];
    [(BCUIRowView *)self bounds];
    CGRectGetHeight(v17);
    UIRectIntegralWithScale();
  }
  else
  {
    double v12 = *MEMORY[0x1E4F1DB20];
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (void)_configureGlyphImageViewIfNecessary
{
  if (!self->_glyphImageView)
  {
    BOOL v3 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    glyphImageView = self->_glyphImageView;
    self->_glyphImageView = v3;

    [(BCUIRowView *)self addSubview:self->_glyphImageView];
    id v5 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProvider objectForKey:&unk_1F3518078];
    [v5 automaticallyUpdateView:self->_glyphImageView withStyle:0];
  }
}

- (void)_configureNameLabelIfNecessary
{
  if (!self->_nameLabel)
  {
    BOOL v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    nameLabel = self->_nameLabel;
    self->_nameLabel = v3;

    id v5 = self->_nameLabel;
    if ([(BCUIRowView *)self _shouldReverseLayoutDirection]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
    [(UILabel *)v5 setTextAlignment:v6];
    [(UILabel *)self->_nameLabel setLineBreakMode:4];
    double v7 = self->_nameLabel;
    [(BCUIRowView *)self addSubview:v7];
  }
}

- (void)_configurePercentChargeLabelIfNecessary
{
  if (!self->_percentChargeLabel)
  {
    BOOL v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    percentChargeLabel = self->_percentChargeLabel;
    self->_percentChargeLabel = v3;

    id v5 = self->_percentChargeLabel;
    if ([(BCUIRowView *)self _shouldReverseLayoutDirection]) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 0;
    }
    [(UILabel *)v5 setTextAlignment:v6];
    [(UILabel *)self->_percentChargeLabel setLineBreakMode:2];
    [(BCUIRowView *)self addSubview:self->_percentChargeLabel];
    id v7 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProvider objectForKey:&unk_1F3518078];
    [v7 automaticallyUpdateView:self->_percentChargeLabel withStyle:0];
  }
}

- (void)_configureBatteryViewIfNecessary
{
  if (!self->_batteryView)
  {
    BOOL v3 = (_UIStaticBatteryView *)objc_alloc_init(MEMORY[0x1E4FB22E0]);
    batteryView = self->_batteryView;
    self->_batteryView = v3;

    [(_UIStaticBatteryView *)self->_batteryView setChargingState:1];
    id v5 = self->_batteryView;
    [(BCUIRowView *)self addSubview:v5];
  }
}

- (void)_configureSeparatorIfNecessary
{
  if (!self->_separator)
  {
    BOOL v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    separator = self->_separator;
    self->_separator = v3;

    id v5 = self->_separator;
    uint64_t v6 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(BCUIRowView *)self addSubview:self->_separator];
    id v7 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProvider objectForKey:&unk_1F3518090];
    [v7 automaticallyUpdateView:self->_separator withStyle:5];
  }
}

- (id)_visualStylingProviderForCategory:(int64_t)a3
{
  categoriesToVisualStylingProvider = self->_categoriesToVisualStylingProvider;
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)categoriesToVisualStylingProvider objectForKey:v4];

  return v5;
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
    id v5 = [(BCUIRowView *)self requiredVisualStyleCategories];
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
          -[BCUIRowView setVisualStylingProvider:forCategory:](self, "setVisualStylingProvider:forCategory:", v11, [v10 integerValue]);
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)_beginAutomaticallyUpdatingVisualStylingForCategory:(int64_t)a3
{
  categoriesToVisualStylingProvider = self->_categoriesToVisualStylingProvider;
  if (!categoriesToVisualStylingProvider) {
    return;
  }
  if (a3 == 2)
  {
    if (!self->_separator) {
      return;
    }
    uint64_t v6 = [(NSMutableDictionary *)categoriesToVisualStylingProvider objectForKey:&unk_1F3518090];
    uint64_t v7 = v6;
    separator = (UIImageView *)self->_separator;
    uint64_t v9 = 5;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    if (self->_percentChargeLabel)
    {
      id v5 = [(NSMutableDictionary *)categoriesToVisualStylingProvider objectForKey:&unk_1F3518078];
      [v5 automaticallyUpdateView:self->_percentChargeLabel withStyle:0];

      [(BCUIRowView *)self setNeedsDisplay];
    }
    if (self->_glyphImageView)
    {
      uint64_t v6 = [(NSMutableDictionary *)self->_categoriesToVisualStylingProvider objectForKey:&unk_1F3518078];
      uint64_t v7 = v6;
      separator = self->_glyphImageView;
      uint64_t v9 = 0;
LABEL_10:
      [v6 automaticallyUpdateView:separator withStyle:v9];

      [(BCUIRowView *)self setNeedsDisplay];
    }
  }
}

- (void)_stopAutomaticallyUpdatingVisualStylingForCategory:(int64_t)a3
{
  categoriesToVisualStylingProvider = self->_categoriesToVisualStylingProvider;
  if (!categoriesToVisualStylingProvider) {
    return;
  }
  if (a3 == 2)
  {
    p_separator = &self->_separator;
    if (!self->_separator) {
      return;
    }
    uint64_t v7 = &unk_1F3518090;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    if (self->_percentChargeLabel)
    {
      id v5 = [(NSMutableDictionary *)categoriesToVisualStylingProvider objectForKey:&unk_1F3518078];
      [v5 stopAutomaticallyUpdatingView:self->_percentChargeLabel];

      [(BCUIRowView *)self setNeedsDisplay];
    }
    p_separator = &self->_glyphImageView;
    if (self->_glyphImageView)
    {
      categoriesToVisualStylingProvider = self->_categoriesToVisualStylingProvider;
      uint64_t v7 = &unk_1F3518078;
LABEL_10:
      uint64_t v8 = [(NSMutableDictionary *)categoriesToVisualStylingProvider objectForKey:v7];
      [v8 stopAutomaticallyUpdatingView:*p_separator];

      [(BCUIRowView *)self setNeedsDisplay];
    }
  }
}

- (id)_lazyPercentChargeFormatter
{
  percentChargeFormatter = self->_percentChargeFormatter;
  if (!percentChargeFormatter)
  {
    objc_msgSend(MEMORY[0x1E4F28EE0], "bcui_newPercentChargeFormatter");
    id v4 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_percentChargeFormatter;
    self->_percentChargeFormatter = v4;

    percentChargeFormatter = self->_percentChargeFormatter;
  }

  return percentChargeFormatter;
}

- (id)_percentChargeString:(int64_t)a3
{
  id v4 = [(BCUIRowView *)self _lazyPercentChargeFormatter];
  id v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 stringFromNumber:v5];

  return v6;
}

- (int64_t)percentCharge
{
  return self->_percentCharge;
}

- (BOOL)isCharging
{
  return self->_charging;
}

- (BOOL)isLowCharge
{
  return self->_lowCharge;
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

- (NSString)name
{
  return self->_name;
}

- (BOOL)isEmpty
{
  return self->_empty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
  objc_storeStrong((id *)&self->_percentChargeFormatter, 0);
  objc_storeStrong((id *)&self->_percentChargeLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_glyphImageView, 0);
}

@end