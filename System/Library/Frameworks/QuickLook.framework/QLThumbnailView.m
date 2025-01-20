@interface QLThumbnailView
- (BOOL)alwaysVisible;
- (CGRect)unselectedFrame;
- (QLThumbnailView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (int64_t)pageNumber;
- (void)drawRect:(CGRect)a3;
- (void)setAlwaysVisible:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setPageNumber:(int64_t)a3;
- (void)setUnselectedFrame:(CGRect)a3;
@end

@implementation QLThumbnailView

- (QLThumbnailView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)QLThumbnailView;
  v3 = -[QLThumbnailView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(QLThumbnailView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGContextClipToRect(CurrentContext, v26);
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationNone);
  [(QLThumbnailView *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  v17 = [(QLThumbnailView *)self image];
  id v24 = v17;
  if (v17)
  {
    [v17 size];
    double v20 = v14 * (v19 / v18);
    if (v20 <= v16)
    {
      double v21 = v14;
    }
    else
    {
      double v21 = v14 * (v16 / v20);
      double v20 = v16;
    }
    double v10 = floor((v14 - v21) * 0.5);
    double v12 = floor((v16 - v20) * 0.5);
    double v14 = floor(v21);
    double v16 = floor(v20);
  }
  id v22 = [MEMORY[0x263F825C8] whiteColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v22 CGColor]);

  v27.origin.CGFloat x = v10;
  v27.origin.CGFloat y = v12;
  v27.size.CGFloat width = v14;
  v27.size.CGFloat height = v16;
  CGContextFillRect(CurrentContext, v27);
  objc_msgSend(v24, "drawInRect:", v10, v12, v14, v16);
  CGContextSetLineWidth(CurrentContext, 1.0);
  id v23 = [MEMORY[0x263F825C8] lightGrayColor];
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v23 CGColor]);

  v28.origin.CGFloat x = v10 + 0.5;
  v28.origin.CGFloat y = v12 + 0.5;
  v28.size.CGFloat width = v14 + -1.0;
  v28.size.CGFloat height = v16 + -1.0;
  CGContextStrokeRect(CurrentContext, v28);
  CGContextRestoreGState(CurrentContext);
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)QLThumbnailView;
  -[QLThumbnailView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(QLThumbnailView *)self setNeedsDisplay];
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);

  [(QLThumbnailView *)self setNeedsDisplay];
}

- (UIImage)image
{
  return self->_image;
}

- (int64_t)pageNumber
{
  return self->_pageNumber;
}

- (void)setPageNumber:(int64_t)a3
{
  self->_pageNumber = a3;
}

- (BOOL)alwaysVisible
{
  return self->_alwaysVisible;
}

- (void)setAlwaysVisible:(BOOL)a3
{
  self->_alwaysVisible = a3;
}

- (CGRect)unselectedFrame
{
  objc_copyStruct(v6, &self->_unselectedFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

- (void)setUnselectedFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_unselectedFrame, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
}

@end