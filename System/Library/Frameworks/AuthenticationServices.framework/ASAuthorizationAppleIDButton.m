@interface ASAuthorizationAppleIDButton
+ (ASAuthorizationAppleIDButton)buttonWithType:(ASAuthorizationAppleIDButtonType)type style:(ASAuthorizationAppleIDButtonStyle)style;
+ (Class)layerClass;
+ (double)defaultCornerRadius;
- (ASAuthorizationAppleIDButton)initWithAuthorizationButtonType:(ASAuthorizationAppleIDButtonType)type authorizationButtonStyle:(ASAuthorizationAppleIDButtonStyle)style;
- (ASAuthorizationAppleIDButton)initWithCoder:(id)a3;
- (ASAuthorizationAppleIDButton)initWithFrame:(CGRect)a3;
- (BOOL)isAccessibilityElement;
- (CGFloat)cornerRadius;
- (CGSize)intrinsicContentSize;
- (id)accessibilityLabel;
- (int64_t)_ak_buttonStyle;
- (int64_t)_ak_buttonType;
- (unint64_t)accessibilityTraits;
- (void)_createHighlightFilterIfNecessary;
- (void)_drawRect:(CGRect)a3 inView:(id)a4;
- (void)_performAnimationToSetHighlighted:(BOOL)a3;
- (void)drawRect:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)layoutSubviews;
- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation ASAuthorizationAppleIDButton

+ (ASAuthorizationAppleIDButton)buttonWithType:(ASAuthorizationAppleIDButtonType)type style:(ASAuthorizationAppleIDButtonStyle)style
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithAuthorizationButtonType:type authorizationButtonStyle:style];

  return (ASAuthorizationAppleIDButton *)v4;
}

- (ASAuthorizationAppleIDButton)initWithAuthorizationButtonType:(ASAuthorizationAppleIDButtonType)type authorizationButtonStyle:(ASAuthorizationAppleIDButtonStyle)style
{
  double v6 = *MEMORY[0x263F00148];
  double v7 = *(double *)(MEMORY[0x263F00148] + 8);
  v12.receiver = self;
  v12.super_class = (Class)ASAuthorizationAppleIDButton;
  v8 = -[ASAuthorizationAppleIDButton initWithFrame:](&v12, sel_initWithFrame_, v6, v7, 130.0, 30.0);
  v9 = v8;
  if (v8)
  {
    v8->_type = type;
    v8->_style = style;
    [(id)objc_opt_class() defaultCornerRadius];
    v9->_cornerRadius = v10;
    _ASAuthorizationButtonInitialize(v9);
  }
  return v9;
}

- (ASAuthorizationAppleIDButton)initWithFrame:(CGRect)a3
{
  return -[ASAuthorizationAppleIDButton initWithAuthorizationButtonType:authorizationButtonStyle:](self, "initWithAuthorizationButtonType:authorizationButtonStyle:", 0, 2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ASAuthorizationAppleIDButton)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ASAuthorizationAppleIDButton;
  v5 = [(ASAuthorizationAppleIDButton *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_type = [v4 decodeIntegerForKey:@"_type"];
    v5->_style = [v4 decodeIntegerForKey:@"_style"];
    _ASAuthorizationButtonInitialize(v5);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ASAuthorizationAppleIDButton;
  id v4 = a3;
  [(ASAuthorizationAppleIDButton *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, @"_type", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_style forKey:@"_style"];
}

+ (double)defaultCornerRadius
{
  return 6.0;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  if (self->_cornerRadius != cornerRadius)
  {
    self->_cornerRadius = cornerRadius;
    [(ASAuthorizationAppleIDButton *)self setNeedsDisplay];
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
  id v5 = a4;
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_super v7 = [v5 _screen];
  [v7 scale];

  [(ASAuthorizationAppleIDButton *)self _ak_buttonType];
  [(ASAuthorizationAppleIDButton *)self _ak_buttonStyle];
  [v5 bounds];
  v8 = (CGImage *)AKCreateAppleIDButtonImageWithCornerRadius();
  [v5 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v18.origin.x = v10;
  v18.origin.y = v12;
  v18.size.width = v14;
  v18.size.height = v16;
  CGContextDrawImage(CurrentContext, v18, v8);

  CGImageRelease(v8);
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)ASAuthorizationAppleIDButton;
  [(ASAuthorizationAppleIDButton *)&v3 layoutSubviews];
  [(ASAuthorizationAppleIDButton *)self setNeedsDisplay];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 130.0;
  double v3 = 30.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_createHighlightFilterIfNecessary
{
  v10[1] = *MEMORY[0x263EF8340];
  if (!self->_highlightFilter)
  {
    id v3 = objc_alloc(MEMORY[0x263F157C8]);
    id v4 = (CAFilter *)[v3 initWithType:*MEMORY[0x263F15D20]];
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v4;

    [(CAFilter *)self->_highlightFilter setName:@"highlightFilter"];
    double v6 = self->_highlightFilter;
    id v7 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:1.0];
    -[CAFilter setValue:forKey:](v6, "setValue:forKey:", [v7 CGColor], @"inputColor");

    v10[0] = self->_highlightFilter;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    double v9 = [(ASAuthorizationAppleIDButton *)self layer];
    [v9 setFilters:v8];
  }
}

- (void)_performAnimationToSetHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  [(ASAuthorizationAppleIDButton *)self _createHighlightFilterIfNecessary];
  id v15 = [(ASAuthorizationAppleIDButton *)self layer];
  double v5 = 0.6;
  if (!v3) {
    double v5 = 1.0;
  }
  double v6 = objc_msgSend(MEMORY[0x263F825C8], "colorWithWhite:alpha:", v5);
  id v7 = (void *)MEMORY[0x263F825C8];
  v8 = [v15 valueForKeyPath:@"filters.highlightFilter.inputColor"];
  double v9 = [v7 colorWithCGColor:v8];

  id v10 = v6;
  objc_msgSend(v15, "setValue:forKeyPath:", objc_msgSend(v10, "CGColor"), @"filters.highlightFilter.inputColor");
  double v11 = [MEMORY[0x263F15760] animationWithKeyPath:@"filters.highlightFilter.inputColor"];
  [v11 setDuration:0.15];
  [v11 setFillMode:*MEMORY[0x263F15AB0]];
  id v12 = v9;
  objc_msgSend(v11, "setFromValue:", objc_msgSend(v12, "CGColor"));
  id v13 = v10;
  objc_msgSend(v11, "setToValue:", objc_msgSend(v13, "CGColor"));
  id v14 = (id)objc_msgSend(v15, "ak_addAdditiveAnimation:", v11);
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ASAuthorizationAppleIDButton *)self isHighlighted] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)ASAuthorizationAppleIDButton;
    [(ASAuthorizationAppleIDButton *)&v5 setHighlighted:v3];
    [(ASAuthorizationAppleIDButton *)self _performAnimationToSetHighlighted:v3];
  }
}

- (int64_t)_ak_buttonType
{
  int64_t type = self->_type;
  if (type == 1) {
    return 2;
  }
  else {
    return type == 2;
  }
}

- (int64_t)_ak_buttonStyle
{
  int64_t style = self->_style;
  int64_t v3 = 1;
  if (style != 1) {
    int64_t v3 = 2;
  }
  if (style) {
    return v3;
  }
  else {
    return 0;
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F83260];
}

- (id)accessibilityLabel
{
  double v2 = _WBSLocalizedString();

  return v2;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (void).cxx_destruct
{
}

@end