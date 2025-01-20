@interface RPCCUIActivityBaubleView
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)preferredContentSizeCategory;
- (RPCCUIActivityBaubleView)initWithBaubleDescription:(id)a3 shadowAttributes:(id *)a4;
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

@implementation RPCCUIActivityBaubleView

- (RPCCUIActivityBaubleView)initWithBaubleDescription:(id)a3 shadowAttributes:(id *)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)RPCCUIActivityBaubleView;
  v7 = [(RPCCUIActivityBaubleView *)&v22 init];
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
    id v12 = objc_alloc((Class)UIImageView);
    v13 = [v6 systemImageName];
    v14 = +[UIImage _systemImageNamed:v13];
    v15 = (UIImageView *)[v12 initWithImage:v14];
    glyphImageView = v8->_glyphImageView;
    v8->_glyphImageView = v15;

    [(UIImageView *)v8->_glyphImageView setContentMode:4];
    [(RPCCUIActivityBaubleView *)v8 addSubview:v8->_glyphImageView];
    v17 = [v6 tintColor];
    [(RPCCUIActivityBaubleView *)v8 setTintColor:v17];

    v18 = +[UIColor whiteColor];
    [(RPCCUIActivityBaubleView *)v8 setBackgroundColor:v18];

    v19 = [(RPCCUIActivityBaubleView *)v8 layer];
    [v19 setShadowPathIsBounds:1];
    *(float *)&double v20 = a4->var0;
    [v19 setShadowOpacity:v20];
    objc_msgSend(v19, "setShadowOffset:", a4->var1.width, a4->var1.height);
    [v19 setShadowRadius:a4->var2];
  }
  return v8;
}

- (double)scaledValueForValue:(double)a3
{
  [(RPCCUIActivityBaubleView *)self _updateTextAttributesIfNecessary];
  [(RPCCUIActivityBaubleView *)self _scaledValueForValue:self->_referencePointSize];
  if (maximumPointSize > self->_maximumPointSize) {
    double maximumPointSize = self->_maximumPointSize;
  }
  return maximumPointSize / self->_referencePointSize * a3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(RPCCUIActivityBaubleView *)self _updateTextAttributesIfNecessary];
  [(RPCCUIActivityBaubleView *)self scaledValueForValue:self->_referenceDimension];

  UISizeRoundToScale();
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)RPCCUIActivityBaubleView;
  [(RPCCUIActivityBaubleView *)&v5 layoutSubviews];
  [(RPCCUIActivityBaubleView *)self _updateTextAttributesIfNecessary];
  [(RPCCUIActivityBaubleView *)self bounds];
  [(RPCCUIActivityBaubleView *)self _setCornerRadius:CGRectGetHeight(v6) * 0.5];
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
    [(RPCCUIActivityBaubleView *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL v3 = [(RPCCUIActivityBaubleView *)self adjustsFontForContentSizeCategory];
  if (v3) {
    [(RPCCUIActivityBaubleView *)self _setNeedsTextAttributesUpdate];
  }
  return v3;
}

- (double)_scaledValueForValue:(double)a3
{
  referenceFont = self->_referenceFont;
  if (!referenceFont)
  {
    CGRect v6 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:self->_preferredContentSizeCategory];
    v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v6];
    v8 = self->_referenceFont;
    self->_referenceFont = v7;

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

  [(RPCCUIActivityBaubleView *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  BOOL v3 = [(RPCCUIActivityBaubleView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategory = v4;

  glyphImageView = self->_glyphImageView;
  [(RPCCUIActivityBaubleView *)self _scaledValueForValue:self->_referencePointSize];
  if (maximumPointSize > self->_maximumPointSize) {
    double maximumPointSize = self->_maximumPointSize;
  }
  id v8 = +[UIImageSymbolConfiguration configurationWithPointSize:maximumPointSize];
  [(UIImageView *)glyphImageView setPreferredSymbolConfiguration:v8];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(RPCCUIActivityBaubleView *)self _needsTextAttributesUpdate])
  {
    [(RPCCUIActivityBaubleView *)self _updateTextAttributes];
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