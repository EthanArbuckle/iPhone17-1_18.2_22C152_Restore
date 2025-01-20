@interface CEKBadgeView
- (CEKBadgeView)initWithFrame:(CGRect)a3;
- (CEKBadgeViewDelegate)delegate;
- (UIColor)_contentColor;
- (UIColor)_fillColor;
- (double)_fillCornerRadius;
- (id)_invertMaskImage:(id)a3;
- (id)_maskImage;
- (void)_setContentColor:(id)a3;
- (void)_setFillColor:(id)a3;
- (void)_setFillCornerRadius:(double)a3;
- (void)drawRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CEKBadgeView

- (CEKBadgeView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CEKBadgeView;
  v3 = -[CEKBadgeView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CEKBadgeView *)v3 setContentMode:3];
    v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(CEKBadgeView *)v4 setBackgroundColor:v5];

    uint64_t v6 = [MEMORY[0x1E4FB1618] systemYellowColor];
    fillColor = v4->__fillColor;
    v4->__fillColor = (UIColor *)v6;

    uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.6];
    contentColor = v4->__contentColor;
    v4->__contentColor = (UIColor *)v8;

    v4->__fillCornerRadius = 2.0;
    v10 = v4;
  }

  return v4;
}

- (void)drawRect:(CGRect)a3
{
  [(CEKBadgeView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  objc_super v12 = [(CEKBadgeView *)self _maskImage];
  v30 = [(CEKBadgeView *)self _contentColor];
  v31 = [(CEKBadgeView *)self _fillColor];
  [(CEKBadgeView *)self _fillCornerRadius];
  double v14 = v13;
  CurrentContext = UIGraphicsGetCurrentContext();
  v34.origin.x = v5;
  v34.origin.y = v7;
  v34.size.width = v9;
  v34.size.height = v11;
  CGContextClearRect(CurrentContext, v34);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  v35.origin.x = v5;
  v35.origin.y = v7;
  v35.size.width = v9;
  v35.size.height = v11;
  CGFloat Height = CGRectGetHeight(v35);
  CGContextTranslateCTM(CurrentContext, 0.0, -Height);
  id v32 = v12;
  v17 = (CGImage *)[v32 CGImage];
  size_t Width = CGImageGetWidth(v17);
  size_t v19 = CGImageGetHeight(v17);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(v17);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(v17);
  size_t BytesPerRow = CGImageGetBytesPerRow(v17);
  DataProvider = CGImageGetDataProvider(v17);
  Decode = CGImageGetDecode(v17);
  BOOL ShouldInterpolate = CGImageGetShouldInterpolate(v17);
  v26 = CGImageMaskCreate(Width, v19, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, Decode, ShouldInterpolate);
  id v27 = [(CEKBadgeView *)self _invertMaskImage:v32];
  v28 = (CGImage *)[v27 CGImage];
  CGContextSaveGState(CurrentContext);
  [v30 set];
  v36.origin.x = v5;
  v36.origin.y = v7;
  v36.size.width = v9;
  v36.size.height = v11;
  CGContextClipToMask(CurrentContext, v36, v28);
  v37.origin.x = v5;
  v37.origin.y = v7;
  v37.size.width = v9;
  v37.size.height = v11;
  CGContextFillRect(CurrentContext, v37);
  CGContextRestoreGState(CurrentContext);
  v38.origin.x = v5;
  v38.origin.y = v7;
  v38.size.width = v9;
  v38.size.height = v11;
  CGContextClipToRect(CurrentContext, v38);
  v39.origin.x = v5;
  v39.origin.y = v7;
  v39.size.width = v9;
  v39.size.height = v11;
  CGContextClipToMask(CurrentContext, v39, v26);
  [v31 set];
  v29 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", v5, v7, v9, v11, v14);
  [v29 fill];
  CGImageRelease(v26);
}

- (id)_invertMaskImage:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [(CEKBadgeView *)self _maskImage];
  double v4 = v3;
  if (v3)
  {
    long long v17 = 0u;
    CGFloat decode = 1.0;
    long long v18 = 0x3FF0000000000000uLL;
    long long v19 = 0x3FF0000000000000uLL;
    uint64_t v20 = 0x3FF0000000000000;
    double v5 = (CGImage *)[v3 CGImage];
    size_t Width = CGImageGetWidth(v5);
    size_t Height = CGImageGetHeight(v5);
    size_t BitsPerComponent = CGImageGetBitsPerComponent(v5);
    size_t BitsPerPixel = CGImageGetBitsPerPixel(v5);
    size_t BytesPerRow = CGImageGetBytesPerRow(v5);
    DataProvider = CGImageGetDataProvider(v5);
    BOOL ShouldInterpolate = CGImageGetShouldInterpolate(v5);
    double v13 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, &decode, ShouldInterpolate);
    double v14 = [MEMORY[0x1E4FB1818] imageWithCGImage:v13];
    CGImageRelease(v13);
  }
  else
  {
    double v14 = 0;
  }

  return v14;
}

- (id)_maskImage
{
  return 0;
}

- (void)_setFillCornerRadius:(double)a3
{
  if (self->__fillCornerRadius != a3)
  {
    self->__fillCornerRadius = a3;
    [(CEKBadgeView *)self setNeedsDisplay];
  }
}

- (void)_setFillColor:(id)a3
{
  id v5 = a3;
  uint64_t fillColor = (uint64_t)self->__fillColor;
  if ((id)fillColor != v5)
  {
    id v7 = v5;
    uint64_t fillColor = [(id)fillColor isEqual:v5];
    id v5 = v7;
    if ((fillColor & 1) == 0)
    {
      objc_storeStrong((id *)&self->__fillColor, a3);
      uint64_t fillColor = [(CEKBadgeView *)self setNeedsDisplay];
      id v5 = v7;
    }
  }
  MEMORY[0x1F41817F8](fillColor, v5);
}

- (void)_setContentColor:(id)a3
{
  id v5 = a3;
  uint64_t contentColor = (uint64_t)self->__contentColor;
  if ((id)contentColor != v5)
  {
    id v7 = v5;
    uint64_t contentColor = [(id)contentColor isEqual:v5];
    id v5 = v7;
    if ((contentColor & 1) == 0)
    {
      objc_storeStrong((id *)&self->__contentColor, a3);
      uint64_t contentColor = [(CEKBadgeView *)self setNeedsDisplay];
      id v5 = v7;
    }
  }
  MEMORY[0x1F41817F8](contentColor, v5);
}

- (CEKBadgeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CEKBadgeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)_fillCornerRadius
{
  return self->__fillCornerRadius;
}

- (UIColor)_fillColor
{
  return self->__fillColor;
}

- (UIColor)_contentColor
{
  return self->__contentColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentColor, 0);
  objc_storeStrong((id *)&self->__fillColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end