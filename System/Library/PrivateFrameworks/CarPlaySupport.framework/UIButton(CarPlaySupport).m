@interface UIButton(CarPlaySupport)
- (void)cps_setBackgroundColor:()CarPlaySupport forState:;
@end

@implementation UIButton(CarPlaySupport)

- (void)cps_setBackgroundColor:()CarPlaySupport forState:
{
  id v14 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  uint64_t v12 = a4;
  CGRectMake_10();
  rect.origin.x = v4;
  rect.origin.y = v5;
  rect.size.width = v6;
  rect.size.height = v7;
  v15.width = v6;
  v15.height = v7;
  UIGraphicsBeginImageContext(v15);
  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[location[0] CGColor]);
  CGContextFillRect(CurrentContext, rect);
  v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  [v14 setBackgroundImage:v9 forState:v12];
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

@end