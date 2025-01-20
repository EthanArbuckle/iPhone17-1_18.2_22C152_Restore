@interface CUIImage
+ (id)imageWithCGImage:(CGImage *)a3;
- (CGImage)image;
- (CGSize)size;
- (CUIImage)initWithCGImage:(CGImage *)a3;
- (void)dealloc;
@end

@implementation CUIImage

+ (id)imageWithCGImage:(CGImage *)a3
{
  id v3 = [objc_alloc((Class)a1) initWithCGImage:a3];
  return v3;
}

- (CUIImage)initWithCGImage:(CGImage *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CUIImage;
  v4 = [(CUIImage *)&v7 init];
  v5 = v4;
  if (a3 && v4) {
    v4->_cgImage = (CGImage *)CFRetain(a3);
  }
  return v5;
}

- (void)dealloc
{
  CGImageRelease(self->_cgImage);
  v3.receiver = self;
  v3.super_class = (Class)CUIImage;
  [(CUIImage *)&v3 dealloc];
}

- (CGImage)image
{
  return self->_cgImage;
}

- (CGSize)size
{
  cgImage = self->_cgImage;
  if (cgImage)
  {
    double Width = (double)CGImageGetWidth(cgImage);
    double Height = (double)CGImageGetHeight(self->_cgImage);
  }
  else
  {
    double Width = CGSizeZero.width;
    double Height = CGSizeZero.height;
  }
  double v6 = Width;
  result.height = Height;
  result.width = v6;
  return result;
}

@end