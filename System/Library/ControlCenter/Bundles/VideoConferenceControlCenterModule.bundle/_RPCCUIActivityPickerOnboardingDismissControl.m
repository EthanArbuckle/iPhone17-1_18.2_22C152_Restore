@interface _RPCCUIActivityPickerOnboardingDismissControl
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (CGRect)_imageViewFrameWithBounds:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)preferredContentSizeCategory;
- (UIEdgeInsets)contentInsetsWithBounds:(CGRect)a3;
- (_RPCCUIActivityPickerOnboardingDismissControl)initWithAction:(id)a3;
- (double)_scaledValueForValue:(double)a3;
- (void)_setNeedsTextAttributesUpdate;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesIfNecessary;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
@end

@implementation _RPCCUIActivityPickerOnboardingDismissControl

- (_RPCCUIActivityPickerOnboardingDismissControl)initWithAction:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_RPCCUIActivityPickerOnboardingDismissControl;
  v5 = [(_RPCCUIActivityPickerOnboardingDismissControl *)&v14 init];
  v6 = v5;
  if (v5)
  {
    [(_RPCCUIActivityPickerOnboardingDismissControl *)v5 addAction:v4 forControlEvents:64];
    id v7 = objc_alloc((Class)UIImageView);
    v8 = +[UIImage _systemImageNamed:@"xmark"];
    v9 = (UIImageView *)[v7 initWithImage:v8];
    imageView = v6->_imageView;
    v6->_imageView = v9;

    [(UIImageView *)v6->_imageView setContentMode:4];
    v11 = v6->_imageView;
    v12 = +[UIColor secondaryLabelColor];
    [(UIImageView *)v11 setTintColor:v12];

    [(_RPCCUIActivityPickerOnboardingDismissControl *)v6 addSubview:v6->_imageView];
  }

  return v6;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)_RPCCUIActivityPickerOnboardingDismissControl;
  [(_RPCCUIActivityPickerOnboardingDismissControl *)&v4 layoutSubviews];
  [(_RPCCUIActivityPickerOnboardingDismissControl *)self _updateTextAttributesIfNecessary];
  imageView = self->_imageView;
  [(_RPCCUIActivityPickerOnboardingDismissControl *)self bounds];
  -[_RPCCUIActivityPickerOnboardingDismissControl _imageViewFrameWithBounds:](self, "_imageViewFrameWithBounds:");
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (UIEdgeInsets)contentInsetsWithBounds:(CGRect)a3
{
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat height = a3.size.height;
  CGFloat rect = a3.size.height;
  -[_RPCCUIActivityPickerOnboardingDismissControl _imageViewFrameWithBounds:](self, "_imageViewFrameWithBounds:");
  CGFloat v7 = v21.origin.x;
  CGFloat v8 = v21.origin.y;
  CGFloat v9 = v21.size.width;
  CGFloat v10 = v21.size.height;
  CGFloat MinY = CGRectGetMinY(v21);
  v22.origin.CGFloat x = v7;
  v22.origin.CGFloat y = v8;
  v22.size.CGFloat width = v9;
  v22.size.CGFloat height = v10;
  CGFloat MinX = CGRectGetMinX(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v23);
  v24.origin.CGFloat x = v7;
  v24.origin.CGFloat y = v8;
  v24.size.CGFloat width = v9;
  v24.size.CGFloat height = v10;
  double v12 = MaxY - CGRectGetMaxY(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = rect;
  double MaxX = CGRectGetMaxX(v25);
  v26.origin.CGFloat x = v7;
  v26.origin.CGFloat y = v8;
  v26.size.CGFloat width = v9;
  v26.size.CGFloat height = v10;
  double v14 = MaxX - CGRectGetMaxX(v26);
  double v16 = MinX;
  double v15 = MinY;
  double v17 = v12;
  result.right = v14;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(_RPCCUIActivityPickerOnboardingDismissControl *)self _updateTextAttributesIfNecessary];
  objc_super v4 = [(UIImageView *)self->_imageView image];
  [v4 size];
  double v6 = v5;
  double v8 = v7;

  double v9 = fmax(v6, 44.0);
  double v10 = fmax(v8, 44.0);
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = [v4 view];
  BOOL v6 = v5 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || [v4 numberOfTouchesRequired] != (char *)&dword_0 + 1
    || [v4 numberOfTapsRequired] != (char *)&dword_0 + 1;

  return v6;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategorCGFloat y = a3;
    [(_RPCCUIActivityPickerOnboardingDismissControl *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  v3 = [(_RPCCUIActivityPickerOnboardingDismissControl *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5) {
    [(_RPCCUIActivityPickerOnboardingDismissControl *)self _setNeedsTextAttributesUpdate];
  }

  return v5 != NSOrderedSame;
}

- (double)_scaledValueForValue:(double)a3
{
  referenceFont = self->_referenceFont;
  if (!referenceFont)
  {
    BOOL v6 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:self->_preferredContentSizeCategory];
    double v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v6];
    double v8 = self->_referenceFont;
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

  [(_RPCCUIActivityPickerOnboardingDismissControl *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  v3 = [(_RPCCUIActivityPickerOnboardingDismissControl *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategorCGFloat y = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategorCGFloat y = v4;

  imageView = self->_imageView;
  [(_RPCCUIActivityPickerOnboardingDismissControl *)self _scaledValueForValue:11.0];
  if (v7 > 20.0) {
    double v7 = 20.0;
  }
  id v8 = +[UIImageSymbolConfiguration configurationWithPointSize:v7];
  [(UIImageView *)imageView setPreferredSymbolConfiguration:v8];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(_RPCCUIActivityPickerOnboardingDismissControl *)self _needsTextAttributesUpdate])
  {
    [(_RPCCUIActivityPickerOnboardingDismissControl *)self _updateTextAttributes];
  }
}

- (CGRect)_imageViewFrameWithBounds:(CGRect)a3
{
  v3 = [(UIImageView *)self->_imageView image];
  [v3 size];

  BSRectWithSize();

  UIRectCenteredIntegralRect();
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_referenceFont, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end