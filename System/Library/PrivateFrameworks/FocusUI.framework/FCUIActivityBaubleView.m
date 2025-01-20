@interface FCUIActivityBaubleView
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FCUIActivityBaubleView)initWithBaubleDescription:(id)a3 shadowAttributes:(id *)a4;
- (NSString)preferredContentSizeCategory;
- (double)_scaledValueForValue:(double)a3;
- (double)maximumPointSize;
- (double)referenceDimension;
- (double)referencePointSize;
- (double)scaledValueForValue:(double)a3;
- (id)tintColor;
- (void)_setNeedsTextAttributesUpdate;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesIfNecessary;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setTintColor:(id)a3;
@end

@implementation FCUIActivityBaubleView

- (FCUIActivityBaubleView)initWithBaubleDescription:(id)a3 shadowAttributes:(id *)a4
{
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FCUIActivityBaubleView;
  v7 = [(FCUIActivityBaubleView *)&v23 init];
  v8 = v7;
  if (v7)
  {
    v7->_adjustsFontForContentSizeCategory = 1;
    [v6 referencePointSize];
    v8->_referencePointSize = v9;
    [v6 maximumPointSize];
    v8->_maximumPointSize = v10;
    [v6 referenceDimension];
    v8->_referenceDimension = v11;
    id v12 = objc_alloc(MEMORY[0x263F82828]);
    v13 = (void *)MEMORY[0x263F827E8];
    v14 = [v6 systemImageName];
    v15 = [v13 _systemImageNamed:v14];
    uint64_t v16 = [v12 initWithImage:v15];
    glyphImageView = v8->_glyphImageView;
    v8->_glyphImageView = (UIImageView *)v16;

    [(UIImageView *)v8->_glyphImageView setContentMode:4];
    [(FCUIActivityBaubleView *)v8 addSubview:v8->_glyphImageView];
    v18 = [v6 tintColor];
    [(FCUIActivityBaubleView *)v8 setTintColor:v18];

    v19 = [MEMORY[0x263F825C8] whiteColor];
    [(FCUIActivityBaubleView *)v8 setBackgroundColor:v19];

    v20 = [(FCUIActivityBaubleView *)v8 layer];
    [v20 setShadowPathIsBounds:1];
    *(float *)&double v21 = a4->var0;
    [v20 setShadowOpacity:v21];
    objc_msgSend(v20, "setShadowOffset:", a4->var1.width, a4->var1.height);
    [v20 setShadowRadius:a4->var2];
  }
  return v8;
}

- (double)scaledValueForValue:(double)a3
{
  [(FCUIActivityBaubleView *)self _updateTextAttributesIfNecessary];
  [(FCUIActivityBaubleView *)self _scaledValueForValue:self->_referencePointSize];
  if (maximumPointSize > self->_maximumPointSize) {
    double maximumPointSize = self->_maximumPointSize;
  }
  return maximumPointSize / self->_referencePointSize * a3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(FCUIActivityBaubleView *)self _updateTextAttributesIfNecessary];
  [(FCUIActivityBaubleView *)self scaledValueForValue:self->_referenceDimension];
  UISizeRoundToScale();
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)FCUIActivityBaubleView;
  [(FCUIActivityBaubleView *)&v5 layoutSubviews];
  [(FCUIActivityBaubleView *)self _updateTextAttributesIfNecessary];
  [(FCUIActivityBaubleView *)self bounds];
  [(FCUIActivityBaubleView *)self _setCornerRadius:CGRectGetHeight(v6) * 0.5];
  glyphImageView = self->_glyphImageView;
  double v4 = [(UIImageView *)glyphImageView image];
  [v4 size];
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  [(UIImageView *)glyphImageView setFrame:0];
}

- (id)tintColor
{
  return [(UIImageView *)self->_glyphImageView tintColor];
}

- (void)setTintColor:(id)a3
{
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    [(FCUIActivityBaubleView *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(FCUIActivityBaubleView *)self adjustsFontForContentSizeCategory];
  if (v3) {
    [(FCUIActivityBaubleView *)self _setNeedsTextAttributesUpdate];
  }
  return v3;
}

- (double)_scaledValueForValue:(double)a3
{
  if (![(FCUIActivityBaubleView *)self adjustsFontForContentSizeCategory]) {
    return a3;
  }
  referenceFont = self->_referenceFont;
  if (!referenceFont)
  {
    CGRect v6 = (void *)MEMORY[0x263F81708];
    uint64_t v7 = *MEMORY[0x263F83570];
    v8 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:self->_preferredContentSizeCategory];
    double v9 = [v6 preferredFontForTextStyle:v7 compatibleWithTraitCollection:v8];
    double v10 = self->_referenceFont;
    self->_referenceFont = v9;

    referenceFont = self->_referenceFont;
  }
  [(UIFont *)referenceFont _scaledValueForValue:a3];
  return result;
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_referenceFont == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  referenceFont = self->_referenceFont;
  self->_referenceFont = 0;

  [(FCUIActivityBaubleView *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  BOOL v3 = [(FCUIActivityBaubleView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  glyphImageView = self->_glyphImageView;
  uint64_t v7 = (void *)MEMORY[0x263F82818];
  [(FCUIActivityBaubleView *)self _scaledValueForValue:self->_referencePointSize];
  if (maximumPointSize > self->_maximumPointSize) {
    double maximumPointSize = self->_maximumPointSize;
  }
  id v9 = [v7 configurationWithPointSize:maximumPointSize];
  [(UIImageView *)glyphImageView setPreferredSymbolConfiguration:v9];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(FCUIActivityBaubleView *)self _needsTextAttributesUpdate])
  {
    [(FCUIActivityBaubleView *)self _updateTextAttributes];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (double)referencePointSize
{
  return self->_referencePointSize;
}

- (double)maximumPointSize
{
  return self->_maximumPointSize;
}

- (double)referenceDimension
{
  return self->_referenceDimension;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_referenceFont, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
}

@end