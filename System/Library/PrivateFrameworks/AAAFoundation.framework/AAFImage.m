@interface AAFImage
+ (CGImage)circularImage:(CGImage *)a3 withDiameter:(double)a4 crop:(CGRect)a5;
+ (CGRect)tranformedRectForImageSize:(CGSize)a3 withDiameter:(double)a4 crop:(CGRect)a5;
+ (id)circularImageData:(id)a3 withDiameter:(double)a4;
+ (id)circularImageData:(id)a3 withDiameter:(double)a4 crop:(CGRect)a5;
@end

@implementation AAFImage

+ (id)circularImageData:(id)a3 withDiameter:(double)a4
{
  return (id)objc_msgSend(a1, "circularImageData:withDiameter:crop:", a3, a4, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
}

+ (id)circularImageData:(id)a3 withDiameter:(double)a4 crop:(CGRect)a5
{
  v5 = +[AAFImage circularImage:withDiameter:crop:](AAFImage, "circularImage:withDiameter:crop:", objc_msgSend(a3, "aaf_toImageRef"), a4, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E4F1C9B8], "aaf_fromImageRef:", v5);
    v5 = (CGImage *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (CGImage)circularImage:(CGImage *)a3 withDiameter:(double)a4 crop:(CGRect)a5
{
  if (!a3) {
    return 0;
  }
  if (a4 <= 0.0)
  {
    v18 = _AAFLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[AAFImage circularImage:withDiameter:crop:](v18, a4);
    }

    return 0;
  }
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  if (!DeviceRGB) {
    return 0;
  }
  v12 = DeviceRGB;
  v13 = CGBitmapContextCreate(0, (unint64_t)a4, (unint64_t)a4, 8uLL, 0, DeviceRGB, 1u);
  CGContextSetInterpolationQuality(v13, kCGInterpolationHigh);
  v20.origin.double x = 0.0;
  v20.origin.double y = 0.0;
  v20.size.double width = a4;
  v20.size.double height = a4;
  v14 = CGPathCreateWithEllipseInRect(v20, 0);
  CGContextAddPath(v13, v14);
  CGContextClip(v13);
  double v15 = (double)CGImageGetWidth(a3);
  +[AAFImage tranformedRectForImageSize:withDiameter:crop:](AAFImage, "tranformedRectForImageSize:withDiameter:crop:", v15, (double)CGImageGetHeight(a3), a4, x, y, width, height);
  CGContextDrawImage(v13, v21, a3);
  CGImageRef Image = CGBitmapContextCreateImage(v13);
  CGPathRelease(v14);
  CGContextRelease(v13);
  CGColorSpaceRelease(v12);
  if (!Image) {
    return 0;
  }
  return (CGImage *)CFAutorelease(Image);
}

+ (CGRect)tranformedRectForImageSize:(CGSize)a3 withDiameter:(double)a4 crop:(CGRect)a5
{
  double v5 = a4;
  double height = a3.height;
  double v7 = 0.0;
  if (a5.size.width <= 0.0)
  {
    double v10 = 0.0;
  }
  else
  {
    double width = a3.width;
    double v9 = a4 / a5.size.width;
    double v10 = -(a5.origin.x * (a4 / a5.size.width));
    double v7 = -((height - CGRectGetMaxY(a5)) * (a4 / a5.size.width));
    a4 = width * v9;
    double v5 = height * v9;
  }
  double v11 = v10;
  double v12 = v5;
  result.size.double height = v12;
  result.size.double width = a4;
  result.origin.double y = v7;
  result.origin.double x = v11;
  return result;
}

+ (void)circularImage:(os_log_t)log withDiameter:(double)a2 crop:.cold.1(os_log_t log, double a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "+[AAFImage circularImage:withDiameter:crop:]";
  __int16 v4 = 2048;
  double v5 = a2;
  _os_log_error_impl(&dword_1DD937000, log, OS_LOG_TYPE_ERROR, "AAFImage %s invalid diameter %f", (uint8_t *)&v2, 0x16u);
}

@end