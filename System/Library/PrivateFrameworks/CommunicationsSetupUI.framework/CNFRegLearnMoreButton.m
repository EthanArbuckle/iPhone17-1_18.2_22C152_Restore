@interface CNFRegLearnMoreButton
+ (id)roundedButtonWithText:(id)a3 color:(id)a4;
- (BOOL)alwaysUnderline;
- (BOOL)usesImage;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNFRegLearnMoreButton)initWithFrame:(CGRect)a3;
- (CNFRegLearnMoreButton)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (CNFRegLearnMoreButton)initWithFrame:(CGRect)a3 style:(int64_t)a4 text:(id)a5;
- (NSString)buttonText;
- (int64_t)style;
- (void)_setupArrowImageForCurrentStyle;
- (void)_setupLearnMoreTextForCurrentStyle;
- (void)drawRect:(CGRect)a3;
- (void)setAlwaysUnderline:(BOOL)a3;
- (void)setButtonText:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setUsesImage:(BOOL)a3;
@end

@implementation CNFRegLearnMoreButton

+ (id)roundedButtonWithText:(id)a3 color:(id)a4
{
  v5 = (void *)MEMORY[0x263F824E8];
  id v6 = a4;
  id v7 = a3;
  v8 = [v5 buttonWithType:1];
  LODWORD(v9) = -0.5;
  [v8 setCharge:v9];
  [v8 setAutoresizingMask:5];
  v10 = [v8 titleLabel];
  v11 = [MEMORY[0x263F81708] fontWithName:@"Helvetica Neue Light" size:14.0];
  [v10 setFont:v11];

  v12 = [v8 titleLabel];
  [v12 setNumberOfLines:1];

  objc_msgSend(v8, "setContentEdgeInsets:", 0.0, 6.0, 0.0, 6.0);
  objc_msgSend(v8, "setTitleEdgeInsets:", 0.0, 0.0, 0.0, 0.0);
  [v8 setTitle:v7 forState:0];

  [v8 setTitleColor:v6 forState:0];
  [v8 sizeToFit];
  return v8;
}

- (CNFRegLearnMoreButton)initWithFrame:(CGRect)a3 style:(int64_t)a4 text:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNFRegLearnMoreButton;
  v12 = -[CNFRegLearnMoreButton initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v13 = v12;
  if (v12)
  {
    [(CNFRegLearnMoreButton *)v12 setStyle:a4];
    [(CNFRegLearnMoreButton *)v13 setButtonText:v11];
    [(CNFRegLearnMoreButton *)v13 setUsesImage:a4 != 1];
    [(CNFRegLearnMoreButton *)v13 setAlwaysUnderline:a4 == 1];
    [(CNFRegLearnMoreButton *)v13 _setupLearnMoreTextForCurrentStyle];
    [(CNFRegLearnMoreButton *)v13 _setupArrowImageForCurrentStyle];
    v14 = [MEMORY[0x263F825C8] clearColor];
    [(CNFRegLearnMoreButton *)v13 setBackgroundColor:v14];
  }
  return v13;
}

- (CNFRegLearnMoreButton)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  return -[CNFRegLearnMoreButton initWithFrame:style:text:](self, "initWithFrame:style:text:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CNFRegLearnMoreButton)initWithFrame:(CGRect)a3
{
  return -[CNFRegLearnMoreButton initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_setupLearnMoreTextForCurrentStyle
{
  id v21 = +[CNFRegAppearanceController globalAppearanceController];
  double v3 = 0.0;
  if ([(CNFRegLearnMoreButton *)self usesImage]) {
    double v4 = 5.0;
  }
  else {
    double v4 = 0.0;
  }
  -[CNFRegLearnMoreButton setTitleEdgeInsets:](self, "setTitleEdgeInsets:", 0.0, 0.0, 0.0, v4);
  v5 = self->_buttonText;
  if (!v5)
  {
    id v6 = CommunicationsSetupUIBundle();
    id v7 = CNFRegStringTableName();
    v5 = [v6 localizedStringForKey:@"FACETIME_SPLASH_LEARN_MORE" value:&stru_26D05D4F8 table:v7];
  }
  [(CNFRegLearnMoreButton *)self setTitle:v5 forState:0];
  v8 = [MEMORY[0x263F81708] boldSystemFontOfSize:15.0];
  double v9 = [v21 learnMoreTextColor];
  v10 = [v21 learnMoreTextColorSelected];
  id v11 = [v21 learnMoreShadowColor];
  double v12 = 1.0;
  if ([(CNFRegLearnMoreButton *)self style] == 1)
  {
    uint64_t v13 = [v21 tableHeaderTextColor];

    uint64_t v14 = [v21 tableHeaderTextColorSelected];

    uint64_t v15 = [v21 tableHeaderTextShadowColor];

    [v21 tableHeaderTextShadowOffset];
    double v3 = v16;
    double v12 = v17;
    v10 = (void *)v14;
    id v11 = (void *)v15;
    double v9 = (void *)v13;
  }
  [(CNFRegLearnMoreButton *)self setTitleColor:v9 forState:0];
  [(CNFRegLearnMoreButton *)self setTitleColor:v10 forState:1];
  v18 = [(CNFRegLearnMoreButton *)self titleLabel];
  [v18 setFont:v8];

  v19 = [(CNFRegLearnMoreButton *)self titleLabel];
  [v19 setLineBreakMode:4];

  if (v11)
  {
    [(CNFRegLearnMoreButton *)self setTitleShadowColor:v11 forState:0];
    v20 = [(CNFRegLearnMoreButton *)self titleLabel];
    objc_msgSend(v20, "setShadowOffset:", v3, v12);
  }
}

- (void)_setupArrowImageForCurrentStyle
{
  if ([(CNFRegLearnMoreButton *)self usesImage])
  {
    id v5 = +[CNFRegAppearanceController globalAppearanceController];
    double v3 = [v5 learnMoreArrowImage];
    double v4 = [v5 learnMoreArrowImagePressed];
    [(CNFRegLearnMoreButton *)self setImage:v3 forState:0];
    [(CNFRegLearnMoreButton *)self setImage:v4 forState:1];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CNFRegLearnMoreButton;
  -[CNFRegLearnMoreButton sizeThatFits:](&v11, sel_sizeThatFits_, a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  v8 = [(CNFRegLearnMoreButton *)self imageForState:[(CNFRegLearnMoreButton *)self state]];
  if (v8) {
    double v5 = v5 + 5.0;
  }

  double v9 = v5;
  double v10 = v7;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(CNFRegLearnMoreButton *)self imageForState:[(CNFRegLearnMoreButton *)self state]];
  double v9 = v8;
  if (v8)
  {
    [v8 size];
    double v11 = v10;
    double v13 = v12;
    [(CNFRegLearnMoreButton *)self imageEdgeInsets];
    CGFloat v15 = x + v14;
    CGFloat v17 = y + v16;
    CGFloat v19 = width - (v14 + v18);
    CGFloat v21 = height - (v16 + v20);
    v28.origin.double x = v15;
    v28.origin.double y = v17;
    v28.size.double width = v19;
    v28.size.double height = v21;
    double v22 = CGRectGetMaxX(v28) - v11;
    v29.origin.double x = v15;
    v29.origin.double y = v17;
    v29.size.double width = v19;
    v29.size.double height = v21;
    double v23 = floor(CGRectGetMidY(v29) + v13 * -0.5);
  }
  else
  {
    double v22 = *MEMORY[0x263F001A8];
    double v23 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v24 = v22;
  double v25 = v23;
  double v26 = v11;
  double v27 = v13;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v41[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = [(CNFRegLearnMoreButton *)self state];
  double v9 = [(CNFRegLearnMoreButton *)self titleForState:v8];
  double v10 = v9;
  if (v9 && [v9 length])
  {
    double v11 = [(CNFRegLearnMoreButton *)self imageForState:v8];
    double v12 = v11;
    uint64_t v13 = MEMORY[0x263F001B0];
    double v14 = *MEMORY[0x263F001B0];
    double v15 = *MEMORY[0x263F001B0];
    if (v11)
    {
      [v11 size];
      double v15 = v16;
    }
    [(CNFRegLearnMoreButton *)self titleEdgeInsets];
    double v18 = x + v17;
    double v20 = y + v19;
    double v22 = width - (v17 + v21);
    double v24 = height - (v19 + v23);
    uint64_t v25 = [(CNFRegLearnMoreButton *)self _lineBreakMode];
    v42.origin.double x = v18;
    v42.origin.double y = v20;
    v42.size.double width = v22;
    v42.size.double height = v24;
    double v26 = CGRectGetWidth(v42);
    double v27 = [MEMORY[0x263F81658] defaultParagraphStyle];
    CGRect v28 = (void *)[v27 mutableCopy];

    [v28 setLineBreakMode:v25];
    v40[0] = *MEMORY[0x263F814F0];
    CGRect v29 = [(CNFRegLearnMoreButton *)self _font];
    v40[1] = *MEMORY[0x263F81540];
    v41[0] = v29;
    v41[1] = v28;
    v30 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];

    if ([v10 length])
    {
      objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v30, 0, v26 - v15, 1.79769313e308);
      double v14 = v31;
      double v33 = v32;
    }
    else
    {
      double v33 = *(double *)(v13 + 8);
    }
    v43.origin.double x = v18;
    v43.origin.double y = v20;
    v43.size.double width = v22;
    v43.size.double height = v24;
    double v34 = CGRectGetMaxX(v43) - v15 - v14;
    v44.origin.double x = v18;
    v44.origin.double y = v20;
    v44.size.double width = v22;
    v44.size.double height = v24;
    double v35 = floor(CGRectGetMidY(v44) + v33 * -0.5);
  }
  else
  {
    double v34 = *MEMORY[0x263F001A8];
    double v35 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v33 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v36 = v34;
  double v37 = v35;
  double v38 = v14;
  double v39 = v33;
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.double y = v37;
  result.origin.double x = v36;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegLearnMoreButton;
  [(CNFRegLearnMoreButton *)&v4 setHighlighted:a3];
  [(CNFRegLearnMoreButton *)self setNeedsDisplay];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegLearnMoreButton;
  [(CNFRegLearnMoreButton *)&v4 setSelected:a3];
  [(CNFRegLearnMoreButton *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v33[2] = *MEMORY[0x263EF8340];
  uint64_t v8 = +[CNFRegAppearanceController globalAppearanceController];
  if ([v8 learnMoreButtonDrawsUnderline]
    && (([(CNFRegLearnMoreButton *)self isHighlighted] & 1) != 0
     || ([(CNFRegLearnMoreButton *)self isSelected] & 1) != 0
     || [(CNFRegLearnMoreButton *)self alwaysUnderline]))
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    double v10 = [(CNFRegLearnMoreButton *)self titleLabel];
    [(CNFRegLearnMoreButton *)self bounds];
    double v12 = v11;
    uint64_t v13 = [MEMORY[0x263F81658] defaultParagraphStyle];
    double v14 = (void *)[v13 mutableCopy];

    [v14 setLineBreakMode:4];
    v32[0] = *MEMORY[0x263F814F0];
    double v15 = [v10 font];
    v32[1] = *MEMORY[0x263F81540];
    v33[0] = v15;
    v33[1] = v14;
    double v16 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];

    double v17 = [v10 text];
    if ([v17 length])
    {
      double v18 = [v10 text];
      [(CNFRegLearnMoreButton *)self bounds];
      objc_msgSend(v18, "boundingRectWithSize:options:attributes:context:", 1, v16, 0, v19, v20);
      double v22 = v21;
    }
    else
    {
      double v22 = *MEMORY[0x263F001B0];
    }

    [v10 center];
    double v23 = v22 * 0.5;
    CGFloat v25 = v24 - v22 * 0.5;
    [v10 center];
    CGFloat v27 = v23 + v26;
    id v28 = [v10 textColor];
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v28 CGColor]);

    CGContextSetLineWidth(CurrentContext, 1.5);
    CGContextMoveToPoint(CurrentContext, v25, v12 + -1.5);
    CGContextAddLineToPoint(CurrentContext, v27, v12 + -1.5);
    CGContextStrokePath(CurrentContext);
    id v29 = [MEMORY[0x263F825C8] whiteColor];
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v29 CGColor]);

    CGContextSetLineWidth(CurrentContext, 1.0);
    CGFloat v30 = v12 + -0.5;
    CGContextMoveToPoint(CurrentContext, v25, v30);
    CGContextAddLineToPoint(CurrentContext, v27, v30);
    CGContextStrokePath(CurrentContext);
  }
  v31.receiver = self;
  v31.super_class = (Class)CNFRegLearnMoreButton;
  -[CNFRegLearnMoreButton drawRect:](&v31, sel_drawRect_, x, y, width, height);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (void)setButtonText:(id)a3
{
}

- (BOOL)usesImage
{
  return self->_usesImage;
}

- (void)setUsesImage:(BOOL)a3
{
  self->_usesImage = a3;
}

- (BOOL)alwaysUnderline
{
  return self->_alwaysUnderline;
}

- (void)setAlwaysUnderline:(BOOL)a3
{
  self->_alwaysUnderline = a3;
}

- (void).cxx_destruct
{
}

@end