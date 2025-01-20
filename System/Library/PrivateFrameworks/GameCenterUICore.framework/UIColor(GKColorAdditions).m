@interface UIColor(GKColorAdditions)
- (double)_gkLuminance;
@end

@implementation UIColor(GKColorAdditions)

- (double)_gkLuminance
{
  id v1 = a1;
  ColorSpace = CGColorGetColorSpace((CGColorRef)[v1 CGColor]);
  if (!ColorSpace)
  {
    v3 = NSString;
    v4 = [NSString stringWithFormat:@"Assertion failed"];
    v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKColorPalette.m"];
    id v6 = [v5 lastPathComponent];
    v7 = [v3 stringWithFormat:@"%@ (colorSpace != ((void *)0))\n[%s (%s:%d)]", v4, "-[UIColor(GKColorAdditions) _gkLuminance]", objc_msgSend(v6, "UTF8String"), 253];

    [MEMORY[0x263EFF940] raise:@"GameKit Exception", @"%@", v7 format];
  }
  double v14 = 0.0;
  CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
  if (Model == kCGColorSpaceModelRGB)
  {
    double v12 = 0.0;
    double v13 = 0.0;
    uint64_t v10 = 0;
    double v11 = 0.0;
    [v1 getRed:&v13 green:&v12 blue:&v11 alpha:&v10];
    return v12 * 0.7152 + v13 * 0.2126 + v11 * 0.0722;
  }
  else
  {
    double result = 0.0;
    if (Model == kCGColorSpaceModelMonochrome)
    {
      double v13 = 0.0;
      objc_msgSend(v1, "getWhite:alpha:", &v14, &v13, 0.0);
      return v14;
    }
  }
  return result;
}

@end