@interface _SSSScreenshotFullsizeStaticImageView
- (BOOL)useTrilinearMinificationFilter;
- (CGSize)sizeMultiplier;
- (SSSCropInfo)cropInfo;
- (UIImage)image;
- (_SSSScreenshotFullsizeStaticImageView)initWithFrame:(CGRect)a3;
- (id)generateImageForScreenshot:(id)a3;
- (void)layoutSubviews;
- (void)setCropInfo:(SSSCropInfo *)a3;
- (void)setImage:(id)a3;
- (void)setSizeMultiplier:(CGSize)a3;
- (void)setUseTrilinearMinificationFilter:(BOOL)a3;
@end

@implementation _SSSScreenshotFullsizeStaticImageView

- (_SSSScreenshotFullsizeStaticImageView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SSSScreenshotFullsizeStaticImageView;
  v3 = -[_SSSScreenshotFullsizeStaticImageView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = v3->_imageView;
  v3->_imageView = v4;

  [(_SSSScreenshotFullsizeStaticImageView *)v3 addSubview:v3->_imageView];
  [(_SSSScreenshotFullsizeStaticImageView *)v3 setUserInteractionEnabled:0];
  return v3;
}

- (void)layoutSubviews
{
  [(_SSSScreenshotFullsizeStaticImageView *)self cropInfo];
  if (!CGRectIsEmpty(*(CGRect *)v9))
  {
    [(_SSSScreenshotFullsizeStaticImageView *)self sizeMultiplier];
    double v4 = *(double *)&v9[16] * v3;
    [(_SSSScreenshotFullsizeStaticImageView *)self sizeMultiplier];
    -[UIImageView setFrame:](self->_imageView, "setFrame:", *(double *)v9, *(double *)&v9[8], v4, *(double *)&v9[24] * v5);
    v6 = [(UIImageView *)self->_imageView layer];
    unsigned int v7 = [(_SSSScreenshotFullsizeStaticImageView *)self useTrilinearMinificationFilter];
    v8 = &kCAFilterTrilinear;
    if (!v7) {
      v8 = &kCAFilterLinear;
    }
    [v6 setMinificationFilter:*v8];
  }
}

- (void)setImage:(id)a3
{
  [(UIImageView *)self->_imageView setImage:a3];
  [(_SSSScreenshotFullsizeStaticImageView *)self setNeedsLayout];

  [(_SSSScreenshotFullsizeStaticImageView *)self invalidateIntrinsicContentSize];
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setCropInfo:(SSSCropInfo *)a3
{
  CGPoint origin = a3->currentRect.origin;
  CGSize size = a3->currentRect.size;
  self->_cropInfo.totalSize = a3->totalSize;
  self->_cropInfo.currentRect.CGPoint origin = origin;
  self->_cropInfo.currentRect.CGSize size = size;
  [(_SSSScreenshotFullsizeStaticImageView *)self setNeedsLayout];
}

- (void)setSizeMultiplier:(CGSize)a3
{
  self->_sizeMultiplier = a3;
  [(_SSSScreenshotFullsizeStaticImageView *)self setNeedsLayout];
}

- (void)setUseTrilinearMinificationFilter:(BOOL)a3
{
  self->_useTrilinearMinificationFilter = a3;
  [(_SSSScreenshotFullsizeStaticImageView *)self setNeedsLayout];
}

- (id)generateImageForScreenshot:(id)a3
{
  return 0;
}

- (SSSCropInfo)cropInfo
{
  CGPoint v3 = *(CGPoint *)&self[1].totalSize.height;
  retstr->totalSize = *(CGSize *)&self->currentRect.size.height;
  retstr->currentRect.CGPoint origin = v3;
  retstr->currentRect.CGSize size = *(CGSize *)&self[1].currentRect.origin.y;
  return self;
}

- (CGSize)sizeMultiplier
{
  double width = self->_sizeMultiplier.width;
  double height = self->_sizeMultiplier.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)useTrilinearMinificationFilter
{
  return self->_useTrilinearMinificationFilter;
}

- (void).cxx_destruct
{
}

@end