@interface UIImage
- (id)gax_imageWithOrientation:(int64_t)a3;
- (id)gax_subImageInRect:(CGRect)a3;
@end

@implementation UIImage

- (id)gax_imageWithOrientation:(int64_t)a3
{
  v4 = self;
  v5 = [(UIImage *)v4 CGImage];
  [(UIImage *)v4 scale];

  return +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v5, a3);
}

- (id)gax_subImageInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIImage *)self scale];
  double v9 = v8;
  CGFloat v10 = x * v8;
  CGFloat v11 = y * v8;
  CGFloat v12 = width * v8;
  CGFloat v13 = height * v8;
  v14 = self;
  v15 = [(UIImage *)v14 CGImage];
  v21.origin.double x = v10;
  v21.origin.double y = v11;
  v21.size.double width = v12;
  v21.size.double height = v13;
  CGImageRef v16 = CGImageCreateWithImageInRect(v15, v21);
  if (v16)
  {
    v17 = v16;
    v18 = +[UIImage imageWithCGImage:v16 scale:[(UIImage *)v14 imageOrientation] orientation:v9];
    CGImageRelease(v17);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end