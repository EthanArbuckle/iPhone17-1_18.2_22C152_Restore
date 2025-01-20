@interface UIImage
+ (id)getCircleWithDiameter:(double)a3 withFillColor:(id)a4;
+ (id)getFadedCircleWithDiameter:(double)a3 withFillColors:(id)a4;
@end

@implementation UIImage

+ (id)getCircleWithDiameter:(double)a3 withFillColor:(id)a4
{
  id v5 = a4;
  v11.width = a3;
  v11.height = a3;
  UIGraphicsBeginImageContextWithOptions(v11, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  id v7 = v5;
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v7 CGColor]);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = a3;
  v12.size.height = a3;
  CGContextFillEllipseInRect(CurrentContext, v12);
  CGContextRestoreGState(CurrentContext);
  v8 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v8;
}

+ (id)getFadedCircleWithDiameter:(double)a3 withFillColors:(id)a4
{
  id v5 = a4;
  v14.width = a3;
  v14.height = a3;
  UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CFArrayRef v7 = (const __CFArray *)v5;
  long long v12 = xmmword_10000C4F0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v9 = CGGradientCreateWithColors(DeviceRGB, v7, (const CGFloat *)&v12);
  v15.x = a3 * 0.5;
  v15.y = a3 * 0.5;
  v16.x = a3 * 0.5;
  v16.y = a3 * 0.5;
  CGContextDrawRadialGradient(CurrentContext, v9, v15, 0.0, v16, a3 * 0.5 / 1.5, 2u);
  CGContextRestoreGState(CurrentContext);
  v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

@end