@interface ASCArtworkView
- (ASCArtworkView)initWithCoder:(id)a3;
- (ASCArtworkView)initWithFrame:(CGRect)a3;
- (ASCBorderView)borderView;
- (ASCScreenshotDisplayConfiguration)screenshotDisplayConfiguration;
- (BOOL)isHighlighted;
- (CGRect)contentRectForBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)preferredSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)decoration;
- (UIColor)placeholderColor;
- (UIImage)image;
- (UIImageView)imageView;
- (UIView)overlayView;
- (double)cornerRadiusForContentRect:(CGRect)a3;
- (id)cornerCurveForContentRect:(CGRect)a3;
- (id)description;
- (unint64_t)cornerMaskForContentRect:(CGRect)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidateIntrinsicContentSize;
- (void)layoutSubviews;
- (void)setDataChanged;
- (void)setDecoration:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setOverlayView:(id)a3;
- (void)setPlaceholderColor:(id)a3;
- (void)setPreferredSize:(CGSize)a3;
- (void)setScreenshotDisplayConfiguration:(id)a3;
- (void)setSemanticContentAttribute:(int64_t)a3;
@end

@implementation ASCArtworkView

- (ASCArtworkView)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)ASCArtworkView;
  v3 = -[ASCArtworkView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    self;
    *(_OWORD *)(v3 + 456) = *MEMORY[0x1E4F1DB30];
    objc_storeStrong((id *)v3 + 51, @"none");
    uint64_t v4 = +[ASCScreenshotDisplayConfiguration defaultConfiguration];
    v5 = (void *)*((void *)v3 + 52);
    *((void *)v3 + 52) = v4;

    uint64_t v6 = +[ASCSemanticColor artworkPlaceholder]();
    v7 = (void *)*((void *)v3 + 53);
    *((void *)v3 + 53) = v6;

    id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], v10, v11, v12);
    v14 = (void *)*((void *)v3 + 55);
    *((void *)v3 + 55) = v13;

    v15 = -[ASCBorderView initWithFrame:]([ASCBorderView alloc], "initWithFrame:", v9, v10, v11, v12);
    v16 = (void *)*((void *)v3 + 56);
    *((void *)v3 + 56) = v15;

    objc_msgSend(v3, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [v3 setInsetsLayoutMarginsFromSafeArea:0];
    [v3 setUserInteractionEnabled:0];
    [v3 setAccessibilityIgnoresInvertColors:1];
    [*((id *)v3 + 55) setClipsToBounds:1];
    v17 = +[ASCSemanticColor artworkSymbolTint]();
    [*((id *)v3 + 55) setTintColor:v17];

    [v3 addSubview:*((void *)v3 + 55)];
    [*((id *)v3 + 56) setWidth:1.0];
    v18 = +[ASCSemanticColor artworkBorder]();
    [*((id *)v3 + 56) setColor:v18];

    [v3 addSubview:*((void *)v3 + 56)];
    [v3 setDataChanged];
  }
  return (ASCArtworkView *)v3;
}

- (ASCArtworkView)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)setPreferredSize:(CGSize)a3
{
  if (self->_preferredSize.width != a3.width || self->_preferredSize.height != a3.height)
  {
    self->_preferredSize = a3;
    if (a3.width >= a3.height) {
      a3.width = a3.height;
    }
    v5 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:-1 scale:ceil(a3.width * 0.5)];
    uint64_t v6 = [(ASCArtworkView *)self imageView];
    [v6 setPreferredSymbolConfiguration:v5];

    [(ASCArtworkView *)self invalidateIntrinsicContentSize];
    [(ASCArtworkView *)self setNeedsLayout];
  }
}

- (void)setDecoration:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_decoration, "isEqualToString:"))
  {
    uint64_t v4 = (NSString *)[v6 copy];
    decoration = self->_decoration;
    self->_decoration = v4;

    [(ASCArtworkView *)self setDataChanged];
  }
}

- (void)setScreenshotDisplayConfiguration:(id)a3
{
  uint64_t v4 = (ASCScreenshotDisplayConfiguration *)a3;
  screenshotDisplayConfiguration = self->_screenshotDisplayConfiguration;
  double v9 = v4;
  if (!v4 || !screenshotDisplayConfiguration)
  {
    if (screenshotDisplayConfiguration == v4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v6 = [(ASCScreenshotDisplayConfiguration *)screenshotDisplayConfiguration isEqual:v4];
  uint64_t v4 = v9;
  if (!v6)
  {
LABEL_6:
    v7 = (ASCScreenshotDisplayConfiguration *)[(ASCScreenshotDisplayConfiguration *)v4 copy];
    id v8 = self->_screenshotDisplayConfiguration;
    self->_screenshotDisplayConfiguration = v7;

    [(ASCArtworkView *)self setDataChanged];
  }
LABEL_7:

  MEMORY[0x1F41817F8]();
}

- (UIImage)image
{
  v2 = [(ASCArtworkView *)self imageView];
  v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  if ([v4 _isSymbolImage]) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  BOOL v6 = [(ASCArtworkView *)self imageView];
  [v6 setContentMode:v5];

  v7 = [(ASCArtworkView *)self imageView];
  [v7 setImage:v4];

  [(ASCArtworkView *)self setDataChanged];
}

- (void)setPlaceholderColor:(id)a3
{
  v7 = (UIColor *)a3;
  uint64_t v5 = self->_placeholderColor;
  if (!v7 || !v5)
  {

    if (v5 == v7) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v6 = [(UIColor *)v5 isEqual:v7];

  if ((v6 & 1) == 0)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_placeholderColor, a3);
    [(ASCArtworkView *)self setDataChanged];
  }
LABEL_7:
}

- (BOOL)isHighlighted
{
  v2 = [(ASCArtworkView *)self imageView];
  char v3 = [v2 isHighlighted];

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ASCArtworkView *)self imageView];
  [v4 setHighlighted:v3];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ASCArtworkView;
  -[ASCArtworkView setSemanticContentAttribute:](&v7, sel_setSemanticContentAttribute_);
  uint64_t v5 = [(ASCArtworkView *)self imageView];
  [v5 setSemanticContentAttribute:a3];

  char v6 = [(ASCArtworkView *)self borderView];
  [v6 setSemanticContentAttribute:a3];
}

- (void)setDataChanged
{
  int HasBorder = ASCArtworkDecorationHasBorder(self->_decoration);
  id v4 = [(ASCArtworkView *)self image];
  if (v4)
  {
    uint64_t v5 = [(ASCArtworkView *)self image];
    uint64_t v6 = [v5 _isSymbolImage] | HasBorder ^ 1;
  }
  else
  {
    uint64_t v6 = 1;
  }

  objc_super v7 = [(ASCArtworkView *)self borderView];
  [v7 setHidden:v6];

  uint64_t v8 = [(ASCArtworkView *)self placeholderColor];
  if (!v8) {
    goto LABEL_11;
  }
  double v9 = (void *)v8;
  double v10 = [(ASCArtworkView *)self image];
  if (v10)
  {
    double v11 = [(ASCArtworkView *)self image];
    char v12 = [v11 _isSymbolImage];

    char v13 = v12 ^ 1;
  }
  else
  {
    char v13 = 0;
  }

  if (HasBorder && (v13 & 1) == 0)
  {
    v14 = [(ASCArtworkView *)self placeholderColor];
    v15 = [(ASCArtworkView *)self imageView];
    [v15 setBackgroundColor:v14];
  }
  else
  {
LABEL_11:
    v14 = [(ASCArtworkView *)self imageView];
    [v14 setBackgroundColor:0];
  }

  [(ASCArtworkView *)self setNeedsLayout];
}

- (CGSize)intrinsicContentSize
{
  -[ASCArtworkView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4FB2C68], *(double *)(MEMORY[0x1E4FB2C68] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)invalidateIntrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)ASCArtworkView;
  [(ASCArtworkView *)&v4 invalidateIntrinsicContentSize];
  if ([(ASCArtworkView *)self translatesAutoresizingMaskIntoConstraints])
  {
    double v3 = [(ASCArtworkView *)self superview];
    [v3 invalidateIntrinsicContentSize];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(ASCArtworkView *)self image];
  if (v6)
  {

    goto LABEL_3;
  }
  char v13 = [(ASCArtworkView *)self decoration];
  if ([v13 isEqualToString:@"none"])
  {

LABEL_20:
    double width = *MEMORY[0x1E4F1DB30];
    double height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_21;
  }
  v14 = [(ASCArtworkView *)self placeholderColor];

  if (!v14) {
    goto LABEL_20;
  }
LABEL_3:
  [(ASCArtworkView *)self preferredSize];
  double v9 = v7;
  double v10 = v8;
  if (width == *MEMORY[0x1E4FB2C68] && height == *(double *)(MEMORY[0x1E4FB2C68] + 8))
  {
    double width = v7;
    double height = v8;
  }
  else
  {
    self;
    if (v9 != *MEMORY[0x1E4F1DB30] || v10 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      if (width >= v9) {
        double width = v9;
      }
      if (height >= v10) {
        double height = v10;
      }
    }
  }
LABEL_21:
  double v15 = width;
  double v16 = height;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(ASCArtworkView *)self layoutMargins];
  double v9 = x + v8;
  double v11 = y + v10;
  double v13 = width - (v8 + v12);
  double v15 = height - (v10 + v14);
  v35.origin.double x = v9;
  v35.origin.double y = v11;
  v35.size.double width = v13;
  v35.size.double height = v15;
  if (!CGRectIsEmpty(v35))
  {
    double v16 = [(ASCArtworkView *)self image];

    if (v16)
    {
      v17 = [(ASCArtworkView *)self image];
      [v17 size];
      double v19 = v18;
      double v21 = v20;

      if (v19 >= 2.22044605e-16 && v21 >= 2.22044605e-16)
      {
        v36.origin.double x = v9;
        v36.origin.double y = v11;
        v36.size.double width = v13;
        v36.size.double height = v15;
        double v22 = CGRectGetWidth(v36) / v19;
        v37.origin.double x = v9;
        v37.origin.double y = v11;
        v37.size.double width = v13;
        v37.size.double height = v15;
        double v23 = CGRectGetHeight(v37) / v21;
        CGFloat v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        CGFloat rect = *MEMORY[0x1E4F1DB28];
        if (v22 >= v23)
        {
          double v25 = floor(v19 * v23);
          v39.origin.double x = v9;
          v39.origin.double y = v11;
          v39.size.double width = v13;
          v39.size.double height = v15;
          double v26 = CGRectGetHeight(v39);
        }
        else
        {
          v38.origin.double x = v9;
          v38.origin.double y = v11;
          v38.size.double width = v13;
          v38.size.double height = v15;
          double v25 = CGRectGetWidth(v38);
          double v26 = floor(v21 * v22);
        }
        v40.origin.double x = v9;
        v40.origin.double y = v11;
        v40.size.double width = v13;
        v40.size.double height = v15;
        double MidX = CGRectGetMidX(v40);
        v41.origin.double x = rect;
        v41.origin.double y = v24;
        v41.size.double width = v25;
        v41.size.double height = v26;
        CGFloat v28 = floor(MidX - CGRectGetWidth(v41) * 0.5);
        v42.origin.double x = v9;
        v42.origin.double y = v11;
        v42.size.double width = v13;
        v42.size.double height = v15;
        double MidY = CGRectGetMidY(v42);
        v43.origin.double x = v28;
        v43.origin.double y = v24;
        v43.size.double width = v25;
        v43.size.double height = v26;
        double v11 = floor(MidY - CGRectGetHeight(v43) * 0.5);
        double v15 = v26;
        double v13 = v25;
        double v9 = v28;
      }
    }
  }
  double v30 = v9;
  double v31 = v11;
  double v32 = v13;
  double v33 = v15;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (double)cornerRadiusForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = [(ASCArtworkView *)self decoration];
  char v9 = [v8 isEqualToString:@"none"];

  double v10 = 0.0;
  if (v9) {
    return v10;
  }
  double v11 = [(ASCArtworkView *)self decoration];
  int v12 = [v11 isEqualToString:@"maskToCircle"];

  if (v12)
  {
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.double width = width;
    v38.size.double height = height;
    double v13 = CGRectGetWidth(v38);
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.double width = width;
    v39.size.double height = height;
    double v14 = CGRectGetHeight(v39);
    if (v13 < v14) {
      double v14 = v13;
    }
    return v14 * 0.5;
  }
  double v15 = [(ASCArtworkView *)self decoration];
  if ([v15 isEqualToString:@"roundedRect"])
  {

LABEL_9:
    double v18 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F298]];
    [v18 continuousCornerRadius];
    double v20 = v19;
    [v18 size];
    double v22 = v21;
    double v24 = v23;
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.double width = width;
    v40.size.double height = height;
    double v25 = CGRectGetWidth(v40);
    v41.origin.CGFloat x = x;
    v41.origin.CGFloat y = y;
    v41.size.double width = width;
    v41.size.double height = height;
    if (v25 <= CGRectGetWidth(v41))
    {
      v43.origin.CGFloat x = x;
      v43.origin.CGFloat y = y;
      v43.size.double width = width;
      v43.size.double height = height;
      double v26 = CGRectGetHeight(v43) / v24;
    }
    else
    {
      v42.origin.CGFloat x = x;
      v42.origin.CGFloat y = y;
      v42.size.double width = width;
      v42.size.double height = height;
      double v26 = CGRectGetWidth(v42) / v22;
    }
    double v10 = v20 * v26;

    return v10;
  }
  double v16 = [(ASCArtworkView *)self decoration];
  int v17 = [v16 isEqualToString:@"iap"];

  if (v17) {
    goto LABEL_9;
  }
  CGFloat v28 = [(ASCArtworkView *)self decoration];
  int v29 = [v28 isEqualToString:@"pill"];

  if (v29)
  {
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.double width = width;
    v44.size.double height = height;
    double v14 = CGRectGetHeight(v44);
    return v14 * 0.5;
  }
  double v30 = [(ASCArtworkView *)self decoration];
  int v31 = [v30 isEqualToString:@"tvRect"];

  if (v31)
  {
    double v14 = floor(width * 0.095 + width * 0.095);
    return v14 * 0.5;
  }
  double v32 = [(ASCArtworkView *)self decoration];
  int v33 = [v32 isEqualToString:@"screenshot"];

  if (!v33)
  {
    CGRect v37 = [(ASCArtworkView *)self decoration];
    ASCUnknownEnumCase(@"ASCArtworkDecoration", v37);
  }
  v34 = [(ASCArtworkView *)self screenshotDisplayConfiguration];
  objc_msgSend(v34, "cornerRadiusForSize:", width, height);
  double v36 = v35;

  return v36;
}

- (id)cornerCurveForContentRect:(CGRect)a3
{
  objc_super v4 = [(ASCArtworkView *)self decoration];
  int v5 = [v4 isEqualToString:@"maskToCircle"];

  if (v5)
  {
    uint64_t v6 = (id *)MEMORY[0x1E4F39EA0];
  }
  else
  {
    double v7 = [(ASCArtworkView *)self decoration];
    int v8 = [v7 isEqualToString:@"screenshot"];

    if (v8)
    {
      char v9 = [(ASCArtworkView *)self screenshotDisplayConfiguration];
      id v10 = [v9 cornerCurve];

      goto LABEL_7;
    }
    uint64_t v6 = (id *)MEMORY[0x1E4F39EA8];
  }
  id v10 = *v6;
LABEL_7:

  return v10;
}

- (unint64_t)cornerMaskForContentRect:(CGRect)a3
{
  objc_super v4 = [(ASCArtworkView *)self decoration];
  char v5 = [v4 isEqualToString:@"iap"];

  if (v5) {
    return 2;
  }
  double v7 = [(ASCArtworkView *)self decoration];
  int v8 = [v7 isEqualToString:@"screenshot"];

  if (!v8) {
    return 15;
  }
  char v9 = [(ASCArtworkView *)self screenshotDisplayConfiguration];
  unint64_t v10 = [v9 maskedCorners];

  return v10;
}

- (void)layoutSubviews
{
  v26.receiver = self;
  v26.super_class = (Class)ASCArtworkView;
  [(ASCArtworkView *)&v26 layoutSubviews];
  [(ASCArtworkView *)self bounds];
  -[ASCArtworkView contentRectForBounds:](self, "contentRectForBounds:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[ASCArtworkView cornerRadiusForContentRect:](self, "cornerRadiusForContentRect:");
  double v12 = v11;
  double v13 = -[ASCArtworkView cornerCurveForContentRect:](self, "cornerCurveForContentRect:", v4, v6, v8, v10);
  unint64_t v14 = -[ASCArtworkView cornerMaskForContentRect:](self, "cornerMaskForContentRect:", v4, v6, v8, v10);
  double v15 = [(ASCArtworkView *)self imageView];
  objc_msgSend(v15, "setFrame:", v4, v6, v8, v10);

  double v16 = [(ASCArtworkView *)self imageView];
  int v17 = [v16 layer];
  [v17 setCornerRadius:v12];

  double v18 = [(ASCArtworkView *)self imageView];
  double v19 = [v18 layer];
  [v19 setCornerCurve:v13];

  double v20 = [(ASCArtworkView *)self imageView];
  double v21 = [v20 layer];
  [v21 setMaskedCorners:v14];

  double v22 = [(ASCArtworkView *)self borderView];
  objc_msgSend(v22, "setFrame:", v4, v6, v8, v10);

  double v23 = [(ASCArtworkView *)self borderView];
  [v23 setCornerRadius:v12];

  double v24 = [(ASCArtworkView *)self borderView];
  [v24 setCornerCurve:v13];

  double v25 = [(ASCArtworkView *)self borderView];
  [v25 setCornerMask:v14];
}

- (id)description
{
  double v3 = [[ASCDescriber alloc] initWithObject:self];
  double v4 = NSString;
  [(ASCArtworkView *)self preferredSize];
  uint64_t v6 = v5;
  [(ASCArtworkView *)self preferredSize];
  double v8 = [v4 stringWithFormat:@"{%f, %f}", v6, v7];
  [(ASCDescriber *)v3 addObject:v8 withName:@"preferredSize"];

  double v9 = [(ASCArtworkView *)self decoration];
  [(ASCDescriber *)v3 addObject:v9 withName:@"decoration"];

  double v10 = [(ASCArtworkView *)self image];
  [(ASCDescriber *)v3 addObject:v10 withName:@"image"];

  double v11 = [(ASCArtworkView *)self placeholderColor];
  [(ASCDescriber *)v3 addObject:v11 withName:@"placeholderColor"];

  double v12 = [(ASCDescriber *)v3 finalizeDescription];

  return v12;
}

- (CGSize)preferredSize
{
  double width = self->_preferredSize.width;
  double height = self->_preferredSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)decoration
{
  return self->_decoration;
}

- (ASCScreenshotDisplayConfiguration)screenshotDisplayConfiguration
{
  return self->_screenshotDisplayConfiguration;
}

- (UIColor)placeholderColor
{
  return self->_placeholderColor;
}

- (UIView)overlayView
{
  return self->_overlayView;
}

- (void)setOverlayView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (ASCBorderView)borderView
{
  return self->_borderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_placeholderColor, 0);
  objc_storeStrong((id *)&self->_screenshotDisplayConfiguration, 0);

  objc_storeStrong((id *)&self->_decoration, 0);
}

@end