@interface AKAuthorizationAppleIDButton
+ (Class)layerClass;
+ (double)defaultCornerRadius;
+ (id)buttonWithType:(int64_t)a3 style:(int64_t)a4;
+ (int64_t)_buttonStyleForUIStyle;
- (AKAuthorizationAppleIDButton)initWithAuthorizationButtonType:(int64_t)a3 authorizationButtonStyle:(int64_t)a4;
- (AKAuthorizationAppleIDButton)initWithCoder:(id)a3;
- (AKAuthorizationAppleIDButton)initWithFrame:(CGRect)a3;
- (BOOL)isAccessibilityElement;
- (CGSize)intrinsicContentSize;
- (double)cornerRadius;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_commonInit;
- (void)_createHighlightFilterIfNecessary;
- (void)_drawRect:(CGRect)a3 inView:(id)a4;
- (void)_performAnimationToSetHighlighted:(BOOL)a3;
- (void)drawRect:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setCornerRadius:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AKAuthorizationAppleIDButton

+ (id)buttonWithType:(int64_t)a3 style:(int64_t)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAuthorizationButtonType:a3 authorizationButtonStyle:a4];

  return v4;
}

- (AKAuthorizationAppleIDButton)initWithAuthorizationButtonType:(int64_t)a3 authorizationButtonStyle:(int64_t)a4
{
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationAppleIDButton;
  v8 = -[AKAuthorizationAppleIDButton initWithFrame:](&v12, sel_initWithFrame_, v6, v7, 130.0, 30.0);
  v9 = v8;
  if (v8)
  {
    if (a4 == 3)
    {
      v8->_changesInterfaceStyle = 1;
      a4 = +[AKAuthorizationAppleIDButton _buttonStyleForUIStyle];
    }
    v9->_type = a3;
    v9->_style = a4;
    [(id)objc_opt_class() defaultCornerRadius];
    v9->_cornerRadius = v10;
    [(AKAuthorizationAppleIDButton *)v9 _commonInit];
  }
  return v9;
}

- (AKAuthorizationAppleIDButton)initWithFrame:(CGRect)a3
{
  return -[AKAuthorizationAppleIDButton initWithAuthorizationButtonType:authorizationButtonStyle:](self, "initWithAuthorizationButtonType:authorizationButtonStyle:", 0, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (AKAuthorizationAppleIDButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AKAuthorizationAppleIDButton *)self init];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    v5->_style = [v4 decodeIntegerForKey:@"_style"];
    [(AKAuthorizationAppleIDButton *)v5 _commonInit];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationAppleIDButton;
  id v4 = a3;
  [(AKAuthorizationAppleIDButton *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"_type", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_style forKey:@"_style"];
}

- (void)_commonInit
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F428B8] clearColor];
  [(AKAuthorizationAppleIDButton *)self setBackgroundColor:v3];

  id v4 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v5 = [(AKAuthorizationAppleIDButton *)self widthAnchor];
  double v6 = [v5 constraintGreaterThanOrEqualToConstant:130.0];
  v14[0] = v6;
  double v7 = [(AKAuthorizationAppleIDButton *)self widthAnchor];
  v8 = [v7 constraintLessThanOrEqualToConstant:375.0];
  v14[1] = v8;
  v9 = [(AKAuthorizationAppleIDButton *)self heightAnchor];
  double v10 = [v9 constraintGreaterThanOrEqualToConstant:30.0];
  v14[2] = v10;
  v11 = [(AKAuthorizationAppleIDButton *)self heightAnchor];
  objc_super v12 = [v11 constraintLessThanOrEqualToConstant:64.0];
  v14[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:4];
  [v4 activateConstraints:v13];
}

+ (int64_t)_buttonStyleForUIStyle
{
  v2 = [MEMORY[0x1E4F42F80] _currentTraitCollection];
  BOOL v3 = [v2 userInterfaceStyle] != 2;

  return 2 * v3;
}

+ (double)defaultCornerRadius
{
  return 6.0;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(AKAuthorizationAppleIDButton *)self setNeedsDisplay];
  }
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)drawRect:(CGRect)a3
{
}

- (void)_drawRect:(CGRect)a3 inView:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  CurrentContext = UIGraphicsGetCurrentContext();
  v11 = [v9 _screen];

  [v11 scale];
  double v13 = v12;

  v14 = AKCreateAppleIDButtonImageWithCornerRadius(self->_type, self->_style, 0, width, height, v13, self->_cornerRadius);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.double width = width;
  v16.size.double height = height;
  CGContextDrawImage(CurrentContext, v16, v14);

  CGImageRelease(v14);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)AKAuthorizationAppleIDButton;
  [(AKAuthorizationAppleIDButton *)&v3 layoutSubviews];
  [(AKAuthorizationAppleIDButton *)self setNeedsDisplay];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 130.0;
  double v3 = 30.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_createHighlightFilterIfNecessary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (!self->_highlightFilter)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F39BC0]);
    id v4 = (CAFilter *)[v3 initWithType:*MEMORY[0x1E4F3A2A8]];
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v4;

    [(CAFilter *)self->_highlightFilter setName:@"highlightFilter"];
    double v6 = self->_highlightFilter;
    id v7 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:1.0];
    -[CAFilter setValue:forKey:](v6, "setValue:forKey:", [v7 CGColor], @"inputColor");

    v10[0] = self->_highlightFilter;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    id v9 = [(AKAuthorizationAppleIDButton *)self layer];
    [v9 setFilters:v8];
  }
}

- (void)_performAnimationToSetHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  [(AKAuthorizationAppleIDButton *)self _createHighlightFilterIfNecessary];
  id v15 = [(AKAuthorizationAppleIDButton *)self layer];
  double v5 = 0.6;
  if (!v3) {
    double v5 = 1.0;
  }
  double v6 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithWhite:alpha:", v5);
  id v7 = (void *)MEMORY[0x1E4F428B8];
  v8 = [v15 valueForKeyPath:@"filters.highlightFilter.inputColor"];
  id v9 = [v7 colorWithCGColor:v8];

  id v10 = v6;
  objc_msgSend(v15, "setValue:forKeyPath:", objc_msgSend(v10, "CGColor"), @"filters.highlightFilter.inputColor");
  v11 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"filters.highlightFilter.inputColor"];
  [v11 setDuration:0.15];
  [v11 setFillMode:*MEMORY[0x1E4F39FA8]];
  id v12 = v9;
  objc_msgSend(v11, "setFromValue:", objc_msgSend(v12, "CGColor"));
  id v13 = v10;
  objc_msgSend(v11, "setToValue:", objc_msgSend(v13, "CGColor"));
  id v14 = (id)objc_msgSend(v15, "ak_addAdditiveAnimation:", v11);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(AKAuthorizationAppleIDButton *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AKAuthorizationAppleIDButton;
    [(AKAuthorizationAppleIDButton *)&v5 setHighlighted:v3];
    [(AKAuthorizationAppleIDButton *)self _performAnimationToSetHighlighted:v3];
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationAppleIDButton;
  -[AKAuthorizationAppleIDButton setEnabled:](&v6, sel_setEnabled_);
  double v5 = 0.5;
  if (v3) {
    double v5 = 1.0;
  }
  [(AKAuthorizationAppleIDButton *)self setAlpha:v5];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x1E4F434F0];
}

- (id)accessibilityLabel
{
  int64_t type = self->_type;
  if (type == 1)
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    id v4 = v3;
    double v5 = @"SIGN_UP_WITH_APPLE";
  }
  else if (type == 2)
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    id v4 = v3;
    double v5 = @"CONTINUE_WITH_APPLE";
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
    id v4 = v3;
    double v5 = @"SIGN_IN_WITH_APPLE";
  }
  objc_super v6 = [v3 localizedStringForKey:v5 value:&stru_1F1EE8138 table:@"Localizable"];

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationAppleIDButton;
  [(AKAuthorizationAppleIDButton *)&v6 traitCollectionDidChange:a3];
  if (self->_changesInterfaceStyle)
  {
    id v4 = [(AKAuthorizationAppleIDButton *)self traitCollection];
    BOOL v5 = [v4 userInterfaceStyle] != 2;

    self->_style = 2 * v5;
  }
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
}

@end