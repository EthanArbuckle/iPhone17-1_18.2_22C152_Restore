@interface CAMFlashBadge
- (CAMFlashBadge)initWithFrame:(CGRect)a3;
- (CGSize)_imageSize;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)_imageInsets;
- (UIImage)_contentImage;
- (id)_maskImage;
- (void)set_contentImage:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMFlashBadge

- (CAMFlashBadge)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CAMFlashBadge;
  v3 = -[CEKBadgeView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x263F827E8];
    v5 = [MEMORY[0x263F82818] configurationWithPointSize:12.0];
    v6 = [v4 systemImageNamed:@"bolt.fill" withConfiguration:v5];
    v7 = [v6 imageWithRenderingMode:2];

    v8 = [MEMORY[0x263F825C8] whiteColor];
    uint64_t v9 = [v7 imageWithTintColor:v8];
    contentImage = v3->__contentImage;
    v3->__contentImage = (UIImage *)v9;

    v11 = v3;
  }

  return v3;
}

- (CGSize)intrinsicContentSize
{
  [(CAMFlashBadge *)self _imageSize];
  [(CAMFlashBadge *)self _imageInsets];
  UICeilToViewScale();
  double v4 = v3;
  UICeilToViewScale();
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)_imageSize
{
  [(UIImage *)self->__contentImage size];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(CAMFlashBadge *)self traitCollection];
  v8 = [v7 preferredContentSizeCategory];

  uint64_t v9 = *MEMORY[0x263F83468];
  if (([v8 isEqualToString:*MEMORY[0x263F83468]] & 1) == 0)
  {
    [MEMORY[0x263F30690] _textHeightForContentSize:v8];
    [MEMORY[0x263F30690] _textHeightForContentSize:v9];
    UIRoundToViewScale();
    double v4 = v10;
    UIRoundToViewScale();
    double v6 = v11;
  }

  double v12 = v4;
  double v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (UIEdgeInsets)_imageInsets
{
  [(CAMFlashBadge *)self _imageSize];
  double v4 = v3;
  [MEMORY[0x263F30690] _defaultTextInsets];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = (void *)MEMORY[0x263F30690];
  v14 = [(CAMFlashBadge *)self traitCollection];
  v15 = [v14 preferredContentSizeCategory];
  objc_msgSend(v13, "_heightForContentSize:textInsets:", v15, v6, v8, v10, v12);
  double v17 = v16;

  UICeilToViewScale();
  double v19 = v17 - v4 - v18;
  double v20 = 16.0;
  double v21 = 16.0;
  result.right = v21;
  result.bottom = v19;
  result.left = v20;
  result.top = v18;
  return result;
}

- (id)_maskImage
{
  [(CAMFlashBadge *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  [(CAMFlashBadge *)self _imageSize];
  double v8 = v7;
  double v10 = v9;
  [(CAMFlashBadge *)self _imageInsets];
  double v12 = v11;
  double v14 = v13;
  v18.width = v4;
  v18.height = v6;
  UIGraphicsBeginImageContextWithOptions(v18, 0, 0.0);
  -[UIImage drawInRect:](self->__contentImage, "drawInRect:", v14, v12, v8, v10);
  v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v15;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  CGFloat v4 = [(CAMFlashBadge *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0) {
    [(CAMFlashBadge *)self setNeedsDisplay];
  }
}

- (UIImage)_contentImage
{
  return self->__contentImage;
}

- (void)set_contentImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end