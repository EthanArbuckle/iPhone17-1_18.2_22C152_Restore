@interface WAImageView
- (BOOL)shouldInvert;
- (CGSize)_imageSize;
- (CGSize)_imageSizeForWidth:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImage)image;
- (WAImageView)initWithFrame:(CGRect)a3;
- (id)colorShiftImage:(id)a3;
- (id)invertImage:(id)a3;
- (void)invertImage;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setShouldInvert:(BOOL)a3;
@end

@implementation WAImageView

- (WAImageView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WAImageView;
  v3 = -[WAImageView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(WAImageView *)v3 setKeylineType:0];
    v5 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    imageView = v4->_imageView;
    v4->_imageView = v5;

    [(WAImageView *)v4 addSubview:v4->_imageView];
  }
  return v4;
}

- (CGSize)_imageSizeForWidth:(double)a3
{
  if (a3 <= 0.0)
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  else
  {
    -[UIImageView sizeThatFits:](self->_imageView, "sizeThatFits:");
    double width = v4;
    double height = v6;
    if (v6 >= 1.0)
    {
      objc_super v8 = +[UIScreen mainScreen];
      [v8 scale];
      double v10 = v9;

      double v11 = a3 / width;
      if (width < v10 * a3) {
        double v11 = 1.0 / v10;
      }
      double width = ceil(width * v11);
      double height = ceil(height * v11);
    }
  }
  double v12 = width;
  double v13 = height;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(WAImageView *)self _imageSizeForWidth:a3.width - SiriUIPlatterStyle[32] - SiriUIPlatterStyle[34]];
  double v5 = v4 + 8.0;
  double v6 = width;
  result.double height = v5;
  result.CGFloat width = v6;
  return result;
}

- (CGSize)_imageSize
{
  [(WAImageView *)self bounds];

  -[WAImageView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.double height = v6;
  result.CGFloat width = v5;
  return result;
}

- (void)setImage:(id)a3
{
  id v9 = a3;
  -[UIImageView setImage:](self->_imageView, "setImage:");
  if ([(WAImageView *)self shouldInvert])
  {
    objc_storeStrong((id *)&self->_regularImage, a3);
    double v5 = [(WAImageView *)self invertImage:v9];
    invertedImage = self->_invertedImage;
    self->_invertedImage = v5;

    v7 = [(WAImageView *)self colorShiftImage:self->_invertedImage];
    objc_super v8 = self->_invertedImage;
    self->_invertedImage = v7;
  }
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)invertImage
{
  if ([(WAImageView *)self shouldInvert])
  {
    if (self->isInverted) {
      double v3 = &OBJC_IVAR___WAImageView__regularImage;
    }
    else {
      double v3 = &OBJC_IVAR___WAImageView__invertedImage;
    }
    [(UIImageView *)self->_imageView setImage:*(void *)&self->SiriUIContentCollectionViewCell_opaque[*v3]];
    self->isInverted ^= 1u;
  }
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)WAImageView;
  [(WAImageView *)&v7 layoutSubviews];
  double v3 = SiriUIPlatterStyle[32];
  [(WAImageView *)self bounds];
  [(WAImageView *)self _imageSizeForWidth:v4 - v3 - SiriUIPlatterStyle[34]];
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v3, 8.0, v5, v6);
}

- (id)invertImage:(id)a3
{
  id v3 = a3;
  double v4 = +[CIContext contextWithOptions:0];
  id v5 = objc_alloc((Class)CIImage);
  id v6 = v3;
  id v7 = objc_msgSend(v5, "initWithCGImage:", objc_msgSend(v6, "CGImage"));
  objc_super v8 = +[CIFilter filterWithName:@"CIColorInvert"];
  [v8 setValue:v7 forKey:kCIInputImageKey];
  id v9 = [v8 valueForKey:kCIOutputImageKey];
  [v9 extent];
  double v10 = (CGImage *)objc_msgSend(v4, "createCGImage:fromRect:", v9);
  id v11 = [objc_alloc((Class)UIImage) initWithCGImage:v10];
  CGImageRelease(v10);
  if (v11)
  {
    id v12 = v11;

    id v6 = v12;
  }

  return v6;
}

- (id)colorShiftImage:(id)a3
{
  id v3 = a3;
  double v4 = +[CIContext contextWithOptions:0];
  id v5 = objc_alloc((Class)CIImage);
  id v6 = v3;
  id v7 = objc_msgSend(v5, "initWithCGImage:", objc_msgSend(v6, "CGImage"));
  objc_super v8 = +[CIFilter filterWithName:@"CIHueAdjust"];
  [v8 setDefaults];
  [v8 setValue:v7 forKey:kCIInputImageKey];
  LODWORD(v9) = 1078530011;
  double v10 = +[NSNumber numberWithFloat:v9];
  [v8 setValue:v10 forKey:@"inputAngle"];

  id v11 = [v8 valueForKey:kCIOutputImageKey];
  [v11 extent];
  id v12 = (CGImage *)objc_msgSend(v4, "createCGImage:fromRect:", v11);
  id v13 = [objc_alloc((Class)UIImage) initWithCGImage:v12];
  CGImageRelease(v12);
  if (v13)
  {
    id v14 = v13;

    id v6 = v14;
  }

  return v6;
}

- (BOOL)shouldInvert
{
  return self->_shouldInvert;
}

- (void)setShouldInvert:(BOOL)a3
{
  self->_shouldInvert = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invertedImage, 0);
  objc_storeStrong((id *)&self->_regularImage, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end