@interface VMAccountButton
+ (NSCache)imageCache;
+ (VMAccountButton)accountButton;
+ (id)backgroundImageForSize:(CGSize)a3 state:(unint64_t)a4;
+ (id)backgroundImageNameForSize:(CGSize)a3 state:(unint64_t)a4;
- (CGSize)intrinsicContentSize;
- (VMAccountButton)initWithFrame:(CGRect)a3;
- (double)preferredIntrinsicContentSizeWidth;
- (double)titleLabelFirstBaselineAnchorLayoutConstraintConstant;
- (double)titleLabelLastBaselineAnchorLayoutConstraintConstant;
- (void)commonInit;
- (void)layoutSubviews;
- (void)setPreferredIntrinsicContentSizeWidth:(double)a3;
@end

@implementation VMAccountButton

+ (VMAccountButton)accountButton
{
  return (VMAccountButton *)[a1 buttonWithType:1];
}

+ (id)backgroundImageNameForSize:(CGSize)a3 state:(unint64_t)a4
{
  v6 = NSString;
  v7 = NSStringFromCGSize(a3);
  v8 = [NSNumber numberWithUnsignedInteger:a4];
  v9 = [v6 stringWithFormat:@"<%@ backgroundImage, size=%@, state=%@>", a1, v7, v8];

  return v9;
}

+ (id)backgroundImageForSize:(CGSize)a3 state:(unint64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = objc_msgSend(a1, "backgroundImageNameForSize:state:", a4);
  v8 = [a1 imageCache];
  v9 = [v8 objectForKey:v7];

  if (!v9)
  {
    v10 = [MEMORY[0x263F1C688] preferredFormat];
    [v10 setScale:0.0];
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithSize:format:", v10, width, height);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __48__VMAccountButton_backgroundImageForSize_state___block_invoke;
    v15[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
    *(double *)&v15[4] = width;
    *(double *)&v15[5] = height;
    v12 = [v11 imageWithActions:v15];
    v13 = [a1 imageCache];
    [v13 setObject:v12 forKey:v7];
  }

  return v9;
}

void __48__VMAccountButton_backgroundImageForSize_state___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F1C550] dynamicSecondaryLabelColor];
  [v2 setStroke];

  v5.size.double width = *(CGFloat *)(a1 + 32);
  v5.size.double height = *(CGFloat *)(a1 + 40);
  v5.origin.x = 0.0;
  v5.origin.y = 0.0;
  CGRect v6 = CGRectInset(v5, 0.5, 0.5);
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, 7.5);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 stroke];
}

+ (NSCache)imageCache
{
  if (imageCache_onceToken != -1) {
    dispatch_once(&imageCache_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)imageCache_imageCache;

  return (NSCache *)v2;
}

uint64_t __29__VMAccountButton_imageCache__block_invoke()
{
  imageCache_imageCache = (uint64_t)objc_alloc_init(MEMORY[0x263EFF8E0]);

  return MEMORY[0x270F9A758]();
}

- (VMAccountButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VMAccountButton;
  id v3 = -[VMAccountButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_preferredIntrinsicContentSizeWidth = 161.0;
    [(VMAccountButton *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  -[VMAccountButton setContentEdgeInsets:](self, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  [(VMAccountButton *)self setContentHorizontalAlignment:0];
  id v5 = [(VMAccountButton *)self titleLabel];
  id v3 = [MEMORY[0x263F1C658] telephonyUIBodyShortFont];
  [v5 setFont:v3];

  [v5 setTextAlignment:1];
  v4 = [MEMORY[0x263F1C550] dynamicSecondaryLabelColor];
  [(VMAccountButton *)self setTitleColor:v4 forState:0];
}

- (double)preferredIntrinsicContentSizeWidth
{
  double preferredIntrinsicContentSizeWidth = self->_preferredIntrinsicContentSizeWidth;
  [(VMAccountButton *)self frame];
  if (preferredIntrinsicContentSizeWidth >= v4)
  {
    double result = self->_preferredIntrinsicContentSizeWidth;
  }
  else
  {
    [(VMAccountButton *)self frame];
    double result = v5;
    self->_double preferredIntrinsicContentSizeWidth = v5;
  }
  if (result < 161.0)
  {
    self->_double preferredIntrinsicContentSizeWidth = 161.0;
    return 161.0;
  }
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(VMAccountButton *)self titleLabelFirstBaselineAnchorLayoutConstraintConstant];
  double v4 = v3;
  [(VMAccountButton *)self titleLabelLastBaselineAnchorLayoutConstraintConstant];
  double v6 = v4 + v5;
  [(VMAccountButton *)self preferredIntrinsicContentSizeWidth];
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  double v3 = objc_opt_class();
  [(VMAccountButton *)self frame];
  double v6 = objc_msgSend(v3, "backgroundImageForSize:state:", 0, v4, v5);
  if (v6) {
    [(VMAccountButton *)self setBackgroundImage:v6 forState:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)VMAccountButton;
  [(VMAccountButton *)&v7 layoutSubviews];
}

- (double)titleLabelFirstBaselineAnchorLayoutConstraintConstant
{
  v2 = [(VMAccountButton *)self titleLabel];
  double v3 = [v2 font];
  double v4 = [v3 fontDescriptor];
  double v5 = [v4 objectForKey:*MEMORY[0x263F1D208]];

  if (v5)
  {
    double v6 = [MEMORY[0x263F1C668] metricsForTextStyle:v5];
    [v6 scaledValueForValue:24.0];
    double v8 = ceil(v7);
  }
  else
  {
    double v8 = 24.0;
  }

  return v8;
}

- (double)titleLabelLastBaselineAnchorLayoutConstraintConstant
{
  v2 = [(VMAccountButton *)self titleLabel];
  double v3 = [v2 font];
  double v4 = [v3 fontDescriptor];
  double v5 = [v4 objectForKey:*MEMORY[0x263F1D208]];

  if (v5)
  {
    double v6 = [MEMORY[0x263F1C668] metricsForTextStyle:v5];
    [v6 scaledValueForValue:11.0];
    double v8 = ceil(v7);
  }
  else
  {
    double v8 = 11.0;
  }

  return v8;
}

- (void)setPreferredIntrinsicContentSizeWidth:(double)a3
{
  self->_double preferredIntrinsicContentSizeWidth = a3;
}

@end