@interface UIImage
- (id)imageByCombiningWithImage:(id)a3;
- (id)imageByMaskingWithImage:(id)a3;
- (id)scaledImageToHeight:(double)a3;
- (id)scaledImageToWidth:(double)a3;
- (id)scaledImageWithScale:(double)a3;
@end

@implementation UIImage

- (id)scaledImageToHeight:(double)a3
{
  [(UIImage *)self size];

  return [(UIImage *)self scaledImageWithScale:a3 / v5];
}

- (id)scaledImageToWidth:(double)a3
{
  [(UIImage *)self size];
  double v6 = a3 / v5;

  return [(UIImage *)self scaledImageWithScale:v6];
}

- (id)scaledImageWithScale:(double)a3
{
  [(UIImage *)self size];
  double v6 = v5;
  double v8 = v7;
  CGAffineTransformMakeScale(&v13, a3, a3);
  CGFloat v9 = v8 * v13.c + v13.a * v6;
  CGFloat v10 = v8 * v13.d + v13.b * v6;
  v15.width = v9;
  v15.height = v10;
  UIGraphicsBeginImageContextWithOptions(v15, 0, 0.0);
  -[UIImage drawInRect:](self, "drawInRect:", 0.0, 0.0, v9, v10);
  v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

- (id)imageByCombiningWithImage:(id)a3
{
  id v4 = a3;
  [(UIImage *)self size];
  double v6 = v5;
  [v4 size];
  if (v6 < v7) {
    double v6 = v7;
  }
  [(UIImage *)self size];
  double v9 = v8;
  [v4 size];
  if (v9 < v10) {
    double v9 = v10;
  }
  v11 = +[UIScreen mainScreen];
  [v11 scale];
  CGFloat v13 = v12;
  v25.width = v6;
  v25.height = v9;
  UIGraphicsBeginImageContextWithOptions(v25, 0, v13);

  [(UIImage *)self size];
  *(float *)&double v14 = (v6 - v14) * 0.5;
  double v15 = roundf(*(float *)&v14);
  [(UIImage *)self size];
  float v17 = (v9 - v16) * 0.5;
  -[UIImage drawAtPoint:](self, "drawAtPoint:", v15, roundf(v17));
  [v4 size];
  *(float *)&double v18 = (v6 - v18) * 0.5;
  double v19 = roundf(*(float *)&v18);
  [v4 size];
  float v21 = (v9 - v20) * 0.5;
  [v4 drawAtPoint:v19 roundf(v21)];

  v22 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v22;
}

- (id)imageByMaskingWithImage:(id)a3
{
  id v4 = (CGImage *)[a3 CGImage];
  size_t Width = CGImageGetWidth(v4);
  size_t Height = CGImageGetHeight(v4);
  size_t BitsPerComponent = CGImageGetBitsPerComponent(v4);
  size_t BitsPerPixel = CGImageGetBitsPerPixel(v4);
  size_t BytesPerRow = CGImageGetBytesPerRow(v4);
  DataProvider = CGImageGetDataProvider(v4);
  v11 = CGImageMaskCreate(Width, Height, BitsPerComponent, BitsPerPixel, BytesPerRow, DataProvider, 0, 0);
  double v12 = CGImageCreateWithMask([(UIImage *)self CGImage], v11);
  CGImageRelease(v11);
  CGFloat v13 = +[UIImage imageWithCGImage:v12];
  CGImageRelease(v12);

  return v13;
}

@end