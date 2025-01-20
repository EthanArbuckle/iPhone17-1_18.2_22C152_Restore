@interface UIImage(FIUIUtilities)
+ (id)fiui_imageWithColor:()FIUIUtilities size:;
+ (uint64_t)fiui_pixelImageWithColor:()FIUIUtilities;
@end

@implementation UIImage(FIUIUtilities)

+ (id)fiui_imageWithColor:()FIUIUtilities size:
{
  id v7 = a5;
  v14.width = a1;
  v14.height = a2;
  UIGraphicsBeginImageContextWithOptions(v14, 1, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v9 = v7;
  v10 = (CGColor *)[v9 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v10);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = a1;
  v15.size.height = a2;
  CGContextFillRect(CurrentContext, v15);
  v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v11;
}

+ (uint64_t)fiui_pixelImageWithColor:()FIUIUtilities
{
  return objc_msgSend(MEMORY[0x263F827E8], "fiui_imageWithColor:size:", 1.0, 1.0);
}

@end