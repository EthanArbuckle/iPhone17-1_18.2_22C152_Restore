@interface CEKApertureButton
- (BOOL)_isRightToLeftFormatting;
- (BOOL)shouldShowApertureValue;
- (BOOL)wantsBackground;
- (CEKApertureButton)initWithFrame:(CGRect)a3;
- (CEKApertureButtonDelegate)delegate;
- (CGSize)intrinsicContentSize;
- (NSNumberFormatter)_decimalFormatter;
- (NSNumberFormatter)_wholeNumberFormatter;
- (UIEdgeInsets)_expansionInsets;
- (UIEdgeInsets)alignmentRectInsets;
- (UIEdgeInsets)tappableEdgeInsets;
- (UIImageView)_circleBackgroundView;
- (UIImageView)_circleOutlineView;
- (UILabel)_symbolLabel;
- (UILabel)_valueLabel;
- (double)_cachedSpaceWidth;
- (double)_cachedSymbolLabelWidth;
- (double)_cachedValueLabelWidth;
- (double)apertureValue;
- (id)_circleImageWithColor:(id)a3;
- (int64_t)expansionDirection;
- (int64_t)orientation;
- (void)_rotateView:(id)a3 withInterfaceOrientation:(int64_t)a4 animated:(BOOL)a5;
- (void)_setCachedValueLabelWidth:(double)a3;
- (void)_setCenterAndBoundsForView:(id)a3 frame:(CGRect)a4;
- (void)_setLayer:(id)a3 highlighted:(BOOL)a4 animated:(BOOL)a5;
- (void)_updateBackgroundView;
- (void)_updateColorsAnimated:(BOOL)a3;
- (void)_updateSymbolLabelOrientationAnimated:(BOOL)a3;
- (void)_updateValueLabel;
- (void)layoutSubviews;
- (void)setActive:(BOOL)a3;
- (void)setActive:(BOOL)a3 animated:(BOOL)a4;
- (void)setApertureValue:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setExpansionDirection:(int64_t)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setShouldShowApertureValue:(BOOL)a3;
- (void)setShouldShowApertureValue:(BOOL)a3 animated:(BOOL)a4;
- (void)setTappableEdgeInsets:(UIEdgeInsets)a3;
- (void)setWantsBackground:(BOOL)a3;
- (void)set_circleBackgroundView:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CEKApertureButton

- (CEKApertureButton)initWithFrame:(CGRect)a3
{
  v41[1] = *MEMORY[0x1E4F143B8];
  v39.receiver = self;
  v39.super_class = (Class)CEKApertureButton;
  v3 = -[CEKApertureButton initWithFrame:](&v39, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemYellowColor];
    [(CEKApertureButton *)v3 setTintColor:v4];

    v3->_orientation = 1;
    v3->_expansionDirection = 0;
    v5 = [MEMORY[0x1E4FB1618] whiteColor];
    v6 = [(CEKApertureButton *)v3 _circleImageWithColor:v5];

    [v6 size];
    v9 = objc_msgSend(v6, "resizableImageWithCapInsets:resizingMode:", 1, v7 * 0.5, v8 * 0.5, v7 * 0.5, v8 * 0.5);

    uint64_t v10 = [v9 imageWithRenderingMode:2];

    v38 = (void *)v10;
    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v10];
    objc_storeStrong((id *)&v3->__circleOutlineView, v11);
    v12 = CEKFontOfSizeWeightStyle(1, 14.0, *MEMORY[0x1E4FB29C8]);
    v13 = CEKLocalizedFrameworkString(@"PORTRAIT_APERTURE_BUTTON_NO_VALUE", 0);
    v14 = CEKLocalizedFrameworkString(@"PORTRAIT_APERTURE_BUTTON_VALUE_FORMAT", 0);
    int v15 = [v14 hasPrefix:@"%@"];
    v37 = v14;
    if (v15) {
      LOBYTE(v15) = objc_msgSend(v14, "hasSuffix:", v13, v14);
    }
    v3->__rightToLeftFormatting = v15;
    id v16 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v17 = *MEMORY[0x1E4F1DB28];
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v21 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], v18, v19, v20);
    v22 = [MEMORY[0x1E4FB1618] clearColor];
    [v21 setBackgroundColor:v22];

    [v21 setFont:v12];
    [v21 setTextAlignment:4];
    [v21 setText:v13];
    objc_storeStrong((id *)&v3->__symbolLabel, v21);
    v23 = CEKMonospacedStylisticNumeralFontOfSizeAndStyle(0, 14.0);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v17, v18, v19, v20);
    v25 = [MEMORY[0x1E4FB1618] clearColor];
    [v24 setBackgroundColor:v25];

    [v24 setFont:v23];
    [v24 setTextAlignment:4];
    objc_storeStrong((id *)&v3->__valueLabel, v24);
    v26 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    decimalFormatter = v3->__decimalFormatter;
    v3->__decimalFormatter = v26;

    [(NSNumberFormatter *)v3->__decimalFormatter setPositiveFormat:@"0.0"];
    v28 = [(NSNumberFormatter *)v3->__decimalFormatter stringFromNumber:&unk_1F1A0F808];
    int v29 = [v28 isEqualToString:@"4,5"];

    if (v29) {
      [(NSNumberFormatter *)v3->__decimalFormatter setDecimalSeparator:@"."];
    }
    v30 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    wholeNumberFormatter = v3->__wholeNumberFormatter;
    v3->__wholeNumberFormatter = v30;

    [(NSNumberFormatter *)v3->__wholeNumberFormatter setPositiveFormat:@"0"];
    [(CEKApertureButton *)v3 addSubview:v11];
    [v11 addSubview:v21];
    [v11 addSubview:v24];
    [(CEKApertureButton *)v3 _updateColorsAnimated:0];
    [v24 setAlpha:0.0];
    uint64_t v40 = *MEMORY[0x1E4FB12B0];
    v41[0] = v12;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
    [@" " sizeWithAttributes:v32];

    UIRoundToViewScale();
    v3->__cachedSpaceWidth = v33;
    [v21 intrinsicContentSize];
    UICeilToViewScale();
    v3->__cachedSymbolLabelWidth = v34;
    v3->_wantsBackground = 0;
    [(CEKApertureButton *)v3 _updateBackgroundView];
    v35 = v3;
  }
  return v3;
}

- (void)setApertureValue:(double)a3
{
  if (self->_apertureValue != a3)
  {
    self->_apertureValue = a3;
    if ([(CEKApertureButton *)self shouldShowApertureValue])
    {
      [(CEKApertureButton *)self _updateValueLabel];
    }
  }
}

- (void)setShouldShowApertureValue:(BOOL)a3
{
}

- (void)setShouldShowApertureValue:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_shouldShowApertureValue != a3)
  {
    BOOL v4 = a4;
    self->_shouldShowApertureValue = a3;
    if (a3) {
      [(CEKApertureButton *)self _updateValueLabel];
    }
    [(CEKApertureButton *)self setNeedsLayout];
    double v7 = [(CEKApertureButton *)self delegate];
    [v7 apertureButtonNeedsLayout:self animated:v4];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__CEKApertureButton_setShouldShowApertureValue_animated___block_invoke;
    v10[3] = &unk_1E63CDAC0;
    BOOL v11 = a3;
    v10[4] = self;
    double v8 = _Block_copy(v10);
    v9 = v8;
    if (v4) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v8 options:0 animations:0.25 completion:0.0];
    }
    else {
      (*((void (**)(void *))v8 + 2))(v8);
    }
    [(CEKApertureButton *)self _updateSymbolLabelOrientationAnimated:v4];
  }
}

void __57__CEKApertureButton_setShouldShowApertureValue_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) _valueLabel];
  [v2 setAlpha:v1];
}

- (void)_updateValueLabel
{
  [(CEKApertureButton *)self apertureValue];
  double v4 = v3;
  if (v3 >= 10.0) {
    [(CEKApertureButton *)self _wholeNumberFormatter];
  }
  else {
  id v13 = [(CEKApertureButton *)self _decimalFormatter];
  }
  v5 = [MEMORY[0x1E4F28ED0] numberWithDouble:v4];
  v6 = [v13 stringFromNumber:v5];
  double v7 = [(CEKApertureButton *)self _valueLabel];
  [v7 setText:v6];

  double v8 = [(CEKApertureButton *)self _valueLabel];
  [v8 intrinsicContentSize];

  [(CEKApertureButton *)self _cachedValueLabelWidth];
  double v10 = v9;
  UICeilToViewScale();
  -[CEKApertureButton _setCachedValueLabelWidth:](self, "_setCachedValueLabelWidth:");
  [(CEKApertureButton *)self _cachedValueLabelWidth];
  if (v10 != v11)
  {
    [(CEKApertureButton *)self setNeedsLayout];
    v12 = [(CEKApertureButton *)self delegate];
    [v12 apertureButtonNeedsLayout:self animated:0];
  }
}

- (void)setExpansionDirection:(int64_t)a3
{
  if (self->_expansionDirection != a3)
  {
    self->_expansionDirection = a3;
    [(CEKApertureButton *)self setNeedsLayout];
    id v4 = [(CEKApertureButton *)self delegate];
    [v4 apertureButtonNeedsLayout:self animated:0];
  }
}

- (void)setWantsBackground:(BOOL)a3
{
  if (self->_wantsBackground != a3)
  {
    self->_wantsBackground = a3;
    [(CEKApertureButton *)self _updateBackgroundView];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CEKApertureButton;
  [(CEKApertureButton *)&v3 tintColorDidChange];
  if ([(CEKApertureButton *)self isActive]) {
    [(CEKApertureButton *)self _updateColorsAnimated:0];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CEKApertureButton;
  [(CEKApertureButton *)&v4 traitCollectionDidChange:a3];
  if (![(CEKApertureButton *)self isActive]) {
    [(CEKApertureButton *)self _updateColorsAnimated:0];
  }
}

- (void)_updateColorsAnimated:(BOOL)a3
{
  if ([(CEKApertureButton *)self isActive])
  {
    id v10 = [(CEKApertureButton *)self tintColor];
  }
  else
  {
    objc_super v4 = [MEMORY[0x1E4FB1618] labelColor];
    id v10 = [v4 colorWithAlphaComponent:0.6];
  }
  if ([(CEKApertureButton *)self isActive])
  {
    v5 = [(CEKApertureButton *)self tintColor];
  }
  else
  {
    v6 = [MEMORY[0x1E4FB1618] labelColor];
    v5 = [v6 colorWithAlphaComponent:1.0];
  }
  double v7 = [(CEKApertureButton *)self _circleOutlineView];
  [v7 setTintColor:v10];

  double v8 = [(CEKApertureButton *)self _symbolLabel];
  [v8 setTextColor:v5];

  double v9 = [(CEKApertureButton *)self _valueLabel];
  [v9 setTextColor:v5];
}

- (void)_updateBackgroundView
{
  id v11 = [(CEKApertureButton *)self _circleBackgroundView];
  BOOL v3 = [(CEKApertureButton *)self wantsBackground];
  if (!v11 && v3)
  {
    objc_super v4 = (void *)MEMORY[0x1E4FB1818];
    v5 = CEKFrameworkBundle();
    v6 = [v4 imageNamed:@"CEKButtonBackgroundPad" inBundle:v5];

    [v6 size];
    double v9 = objc_msgSend(v6, "resizableImageWithCapInsets:resizingMode:", 1, v7 * 0.5, v8 * 0.5, v7 * 0.5, v8 * 0.5);
    id v11 = (id)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v9];
    -[CEKApertureButton set_circleBackgroundView:](self, "set_circleBackgroundView:");
  }
  id v10 = [v11 superview];

  if (v3)
  {
    if (v10 != self) {
      [(CEKApertureButton *)self insertSubview:v11 atIndex:0];
    }
  }
  else if (v10 == self)
  {
    [v11 removeFromSuperview];
  }
}

- (UIEdgeInsets)_expansionInsets
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if ([(CEKApertureButton *)self shouldShowApertureValue])
  {
    [(CEKApertureButton *)self _cachedSymbolLabelWidth];
    double v8 = v7;
    [(CEKApertureButton *)self _cachedSpaceWidth];
    double v10 = v8 + v9;
    [(CEKApertureButton *)self _cachedValueLabelWidth];
    double v12 = v10 + v11 + -2.0 + -2.0;
    int64_t v13 = [(CEKApertureButton *)self expansionDirection];
    switch(v13)
    {
      case 2:
        UIRoundToViewScale();
        double v4 = v4 + v14;
        double v6 = v6 + v12 - v14;
        break;
      case 1:
        double v6 = v6 + v12;
        break;
      case 0:
        double v4 = v4 + v12;
        break;
    }
  }
  double v15 = v3;
  double v16 = v4;
  double v17 = v5;
  double v18 = v6;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3 = 22.0;
  double v4 = 22.0;
  if ([(CEKApertureButton *)self wantsBackground])
  {
    double v5 = [(CEKApertureButton *)self _circleBackgroundView];
    double v6 = [v5 image];
    [v6 size];
    double v4 = v7;
    double v3 = v8;
  }
  double v9 = v4;
  double v10 = v3;
  result.height = v10;
  result.width = v9;
  return result;
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(CEKApertureButton *)self tappableEdgeInsets];
  unint64_t v4 = v3;
  unint64_t v6 = v5;
  unint64_t v8 = v7;
  unint64_t v10 = v9;
  [(CEKApertureButton *)self _expansionInsets];
  v11.n128_u64[0] = v15.n128_u64[0];
  v12.n128_u64[0] = v16.n128_u64[0];
  v13.n128_u64[0] = v17.n128_u64[0];
  v14.n128_u64[0] = v18.n128_u64[0];
  v15.n128_u64[0] = v4;
  v16.n128_u64[0] = v6;
  v17.n128_u64[0] = v8;
  v18.n128_u64[0] = v10;
  MEMORY[0x1F4166BC0](15, v15, v16, v17, v18, v11, v12, v13, v14);
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

- (void)layoutSubviews
{
  v46.receiver = self;
  v46.super_class = (Class)CEKApertureButton;
  [(CEKApertureButton *)&v46 layoutSubviews];
  unint64_t v3 = [(CEKApertureButton *)self _circleOutlineView];
  unint64_t v4 = [(CEKApertureButton *)self _circleBackgroundView];
  unint64_t v5 = [(CEKApertureButton *)self _symbolLabel];
  unint64_t v6 = [(CEKApertureButton *)self _valueLabel];
  [(CEKApertureButton *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v42 = v11;
  double v43 = v12;
  -[CEKApertureButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  [(CEKApertureButton *)self _cachedSymbolLabelWidth];
  double v44 = v13;
  [(CEKApertureButton *)self _cachedValueLabelWidth];
  double v45 = v14;
  BOOL v15 = [(CEKApertureButton *)self shouldShowApertureValue];
  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  [(CEKApertureButton *)self _expansionInsets];
  UIRectInset();
  -[CEKApertureButton _setCenterAndBoundsForView:frame:](self, "_setCenterAndBoundsForView:frame:", v3);
  [(CEKApertureButton *)self tappableEdgeInsets];
  objc_msgSend(v4, "setFrame:", v8 + v19, v10 + v16, v42 - (v19 + v17), v43 - (v16 + v18));
  [v3 bounds];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  double v27 = v26;
  if (v15)
  {
    UIRoundToViewScale();
    double v29 = v28;
    v47.origin.x = v21;
    v47.origin.y = v23;
    v47.size.width = v25;
    v47.size.height = v27;
    CGRectGetMaxX(v47);
    UIRoundToViewScale();
    double v31 = v44;
  }
  else
  {
    double v31 = v44;
    UIRoundToViewScale();
    double v29 = v32;
    v48.origin.x = v21;
    v48.origin.y = v23;
    v48.size.width = v25;
    v48.size.height = v27;
    double MaxX = CGRectGetMaxX(v48);
  }
  double v33 = MaxX - v45;
  if ([(CEKApertureButton *)self _isRightToLeftFormatting])
  {
    v49.origin.x = v21;
    v49.origin.y = v23;
    v49.size.width = v25;
    v49.size.height = v27;
    CGFloat v34 = CGRectGetMaxX(v49);
    CGFloat v35 = v29;
    CGFloat v36 = v23;
    CGFloat v37 = v21;
    CGFloat v38 = v31;
    double v39 = v34;
    v50.origin.y = 0.0;
    v50.origin.x = v35;
    v50.size.width = v38;
    v50.size.height = v27;
    double v40 = v39 - CGRectGetMaxX(v50);
    v51.origin.x = v37;
    v51.origin.y = v36;
    double v29 = v40;
    v51.size.width = v25;
    v51.size.height = v27;
    double v41 = CGRectGetMaxX(v51);
    v52.origin.y = 0.0;
    v52.origin.x = v33;
    v52.size.width = v45;
    v52.size.height = v27;
    double v33 = v41 - CGRectGetMaxX(v52);
    double v31 = v38;
  }
  -[CEKApertureButton _setCenterAndBoundsForView:frame:](self, "_setCenterAndBoundsForView:frame:", v5, v29, 0.0, v31, v27);
  -[CEKApertureButton _setCenterAndBoundsForView:frame:](self, "_setCenterAndBoundsForView:frame:", v6, v33, 0.0, v45, v27);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CEKApertureButton *)self isHighlighted];
  v8.receiver = self;
  v8.super_class = (Class)CEKApertureButton;
  [(CEKApertureButton *)&v8 setHighlighted:v3];
  if (v5 != v3)
  {
    unint64_t v6 = [(CEKApertureButton *)self _circleOutlineView];
    double v7 = [v6 layer];
    [(CEKApertureButton *)self _setLayer:v7 highlighted:v3 animated:1];
  }
}

- (void)setActive:(BOOL)a3
{
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  BOOL v7 = [(CEKApertureButton *)self isActive];
  [(CEKApertureButton *)self setSelected:v5];
  if (v7 != v5)
  {
    [(CEKApertureButton *)self _updateColorsAnimated:v4];
  }
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    [(CEKApertureButton *)self setNeedsLayout];
  }
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(CEKApertureButton *)self _updateSymbolLabelOrientationAnimated:a4];
  }
}

- (void)_updateSymbolLabelOrientationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CEKApertureButton *)self shouldShowApertureValue]) {
    int64_t v5 = 1;
  }
  else {
    int64_t v5 = [(CEKApertureButton *)self orientation];
  }
  id v6 = [(CEKApertureButton *)self _symbolLabel];
  [(CEKApertureButton *)self _rotateView:v6 withInterfaceOrientation:v5 animated:v3];
}

- (id)_circleImageWithColor:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CEKApertureButton *)self traitCollection];
  [v5 displayScale];
  double v7 = v6;

  v16.origin.CGFloat x = *(CGFloat *)MEMORY[0x1E4F1DB28];
  v16.origin.CGFloat y = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 8);
  v16.size.CGFloat width = 22.0;
  v16.size.CGFloat height = 22.0;
  CGRect v17 = CGRectInset(v16, 1.0 / v7 * 3.0 * 0.5, 1.0 / v7 * 3.0 * 0.5);
  CGFloat x = v17.origin.x;
  CGFloat y = v17.origin.y;
  CGFloat width = v17.size.width;
  CGFloat height = v17.size.height;
  v17.origin.CGFloat x = 22.0;
  v17.origin.CGFloat y = 22.0;
  UIGraphicsBeginImageContextWithOptions((CGSize)v17.origin, 0, v7);
  CurrentContext = UIGraphicsGetCurrentContext();
  [v4 setStroke];

  CGContextSetLineWidth(CurrentContext, 1.0 / v7 * 3.0);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGContextStrokeEllipseInRect(CurrentContext, v18);
  double v13 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v13;
}

- (void)_setCenterAndBoundsForView:(id)a3 frame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  id v8 = a3;
  UIRectGetCenter();
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  objc_msgSend(v8, "setCenter:");
  objc_msgSend(v8, "setBounds:", v6, v7, width, height);
}

- (void)_rotateView:(id)a3 withInterfaceOrientation:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  memset(&v20, 0, sizeof(v20));
  switch(a4)
  {
    case 0:
    case 1:
      long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v20.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v20.c = v9;
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      goto LABEL_7;
    case 2:
      CGFloat v11 = 3.14159265;
      goto LABEL_6;
    case 3:
      CGFloat v11 = 1.57079633;
      goto LABEL_6;
    case 4:
      CGFloat v11 = -1.57079633;
LABEL_6:
      CGAffineTransformMakeRotation(&v20, v11);
      CGAffineTransform v16 = v20;
      UIIntegralTransform();
      *(_OWORD *)&v20.a = v17;
      *(_OWORD *)&v20.c = v18;
      long long v10 = v19;
LABEL_7:
      *(_OWORD *)&v20.tCGFloat x = v10;
      break;
    default:
      break;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  CGAffineTransform v15 = v20;
  aBlock[2] = __67__CEKApertureButton__rotateView_withInterfaceOrientation_animated___block_invoke;
  aBlock[3] = &unk_1E63CDB10;
  aBlock[4] = self;
  double v12 = _Block_copy(aBlock);
  double v13 = v12;
  if (v5) {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:2 delay:v12 options:0 animations:0.3 completion:0.0];
  }
  else {
    (*((void (**)(void *))v12 + 2))(v12);
  }
}

uint64_t __67__CEKApertureButton__rotateView_withInterfaceOrientation_animated___block_invoke(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

- (void)_setLayer:(id)a3 highlighted:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [v8 presentationLayer];
  long long v10 = (void *)v9;
  if (v9) {
    CGFloat v11 = (void *)v9;
  }
  else {
    CGFloat v11 = v8;
  }
  id v12 = v11;

  double v13 = [v12 valueForKeyPath:@"transform.scale.xy"];
  [v13 doubleValue];
  CGFloat v15 = v14;

  memset(&v37, 0, sizeof(v37));
  CGAffineTransform v16 = [v12 valueForKeyPath:@"transform"];
  long long v17 = v16;
  if (v16) {
    [v16 CATransform3DValue];
  }
  else {
    memset(&v37, 0, sizeof(v37));
  }

  memset(&v36, 0, sizeof(v36));
  CATransform3DMakeScale(&v36, v15, v15, 1.0);
  memset(&v35, 0, sizeof(v35));
  CATransform3D a = v36;
  CATransform3DInvert(&b, &a);
  CATransform3D a = v37;
  CATransform3DConcat(&v35, &a, &b);
  if (v6)
  {
    int v18 = CEKIsPadLayoutForView(self);
    double v19 = 0.9;
    if (v18) {
      double v19 = 0.94;
    }
    memset(&a, 0, sizeof(a));
    CATransform3DMakeScale(&a, v19, v19, 1.0);
    CATransform3D v31 = v35;
    CATransform3D v30 = a;
    CATransform3DConcat(&v32, &v31, &v30);
    CATransform3D v35 = v32;
  }
  if (v5)
  {
    UIAnimationDragCoefficient();
    float v21 = v20;
    double v22 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"transform"];
    [v22 setMass:0.8];
    [v22 setVelocity:0.0];
    [v22 setDamping:12.0 / v21];
    [v22 setStiffness:300.0 / (float)(v21 * v21)];
    [v22 durationForEpsilon:0.01];
    objc_msgSend(v22, "setDuration:");
    LODWORD(v23) = 1041865114;
    LODWORD(v24) = 0.5;
    LODWORD(v25) = 1.0;
    double v26 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v23 :0.0 :v24 :v25];
    [v22 setTimingFunction:v26];

    CATransform3D a = v37;
    double v27 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&a];
    [v22 setFromValue:v27];

    CATransform3D a = v35;
    double v28 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&a];
    [v22 setToValue:v28];

    [v8 addAnimation:v22 forKey:@"highlightScaleAnimation"];
  }
  CATransform3D v29 = v35;
  [v8 setTransform:&v29];
}

- (CEKApertureButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CEKApertureButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)apertureValue
{
  return self->_apertureValue;
}

- (BOOL)shouldShowApertureValue
{
  return self->_shouldShowApertureValue;
}

- (int64_t)expansionDirection
{
  return self->_expansionDirection;
}

- (BOOL)wantsBackground
{
  return self->_wantsBackground;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top = self->_tappableEdgeInsets.top;
  double left = self->_tappableEdgeInsets.left;
  double bottom = self->_tappableEdgeInsets.bottom;
  double right = self->_tappableEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (UIImageView)_circleOutlineView
{
  return self->__circleOutlineView;
}

- (UILabel)_symbolLabel
{
  return self->__symbolLabel;
}

- (UILabel)_valueLabel
{
  return self->__valueLabel;
}

- (UIImageView)_circleBackgroundView
{
  return self->__circleBackgroundView;
}

- (void)set_circleBackgroundView:(id)a3
{
}

- (NSNumberFormatter)_decimalFormatter
{
  return self->__decimalFormatter;
}

- (NSNumberFormatter)_wholeNumberFormatter
{
  return self->__wholeNumberFormatter;
}

- (BOOL)_isRightToLeftFormatting
{
  return self->__rightToLeftFormatting;
}

- (double)_cachedSpaceWidth
{
  return self->__cachedSpaceWidth;
}

- (double)_cachedSymbolLabelWidth
{
  return self->__cachedSymbolLabelWidth;
}

- (double)_cachedValueLabelWidth
{
  return self->__cachedValueLabelWidth;
}

- (void)_setCachedValueLabelWidth:(double)a3
{
  self->__cachedValueLabelWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__wholeNumberFormatter, 0);
  objc_storeStrong((id *)&self->__decimalFormatter, 0);
  objc_storeStrong((id *)&self->__circleBackgroundView, 0);
  objc_storeStrong((id *)&self->__valueLabel, 0);
  objc_storeStrong((id *)&self->__symbolLabel, 0);
  objc_storeStrong((id *)&self->__circleOutlineView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end