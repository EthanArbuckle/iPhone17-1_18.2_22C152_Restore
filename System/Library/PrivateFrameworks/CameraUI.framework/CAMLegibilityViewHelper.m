@interface CAMLegibilityViewHelper
+ (id)_imageFromLabel:(id)a3 sizeToFit:(BOOL)a4;
+ (id)imageForText:(id)a3 font:(id)a4 textAlignment:(int64_t)a5 constrainedToSize:(CGSize)a6;
+ (id)newLegibilityViewWithSettings:(id)a3 forLabel:(id)a4 sizeToFit:(BOOL)a5;
@end

@implementation CAMLegibilityViewHelper

+ (id)newLegibilityViewWithSettings:(id)a3 forLabel:(id)a4 sizeToFit:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = [a1 _imageFromLabel:a4 sizeToFit:v5];
  id v10 = objc_alloc(MEMORY[0x263F83040]);
  v11 = (void *)[v10 initWithSettings:v8 strength:v9 image:0 shadowImage:*MEMORY[0x263F83DC0] options:*MEMORY[0x263F83DB8]];

  return v11;
}

+ (id)_imageFromLabel:(id)a3 sizeToFit:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = [MEMORY[0x263F82B60] mainScreen];
  [v6 scale];
  CGFloat v8 = v7;

  if (v4)
  {
    objc_msgSend(v5, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    UIRectIntegralWithScale();
    objc_msgSend(v5, "setFrame:");
  }
  [v5 frame];
  v13 = 0;
  if (v11 > 0.0 && v12 > 0.0)
  {
    double v14 = v9;
    double v15 = v10;
    v20.width = v11;
    v20.height = v12;
    UIGraphicsBeginImageContextWithOptions(v20, 0, v8);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(CurrentContext, -v14, -v15);
    v17 = [v5 layer];
    [v17 renderInContext:CurrentContext];

    v13 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }

  return v13;
}

+ (id)imageForText:(id)a3 font:(id)a4 textAlignment:(int64_t)a5 constrainedToSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  v32[3] = *MEMORY[0x263EF8340];
  id v10 = a3;
  double v11 = (void *)MEMORY[0x263F82B60];
  id v12 = a4;
  v13 = [v11 mainScreen];
  [v13 scale];
  CGFloat v15 = v14;

  id v16 = objc_alloc_init(MEMORY[0x263F81650]);
  [v16 setAlignment:a5];
  uint64_t v17 = *MEMORY[0x263F814F0];
  v32[0] = v12;
  uint64_t v18 = *MEMORY[0x263F81500];
  v31[0] = v17;
  v31[1] = v18;
  v19 = [MEMORY[0x263F825C8] whiteColor];
  v31[2] = *MEMORY[0x263F81540];
  v32[1] = v19;
  v32[2] = v16;
  CGSize v20 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

  objc_msgSend(v10, "boundingRectWithSize:options:attributes:context:", 1, v20, 0, width, height);
  UIRectIntegralWithScale();
  v25 = 0;
  if (v23 > 0.0)
  {
    double v26 = v24;
    if (v24 > 0.0)
    {
      double v27 = v21;
      double v28 = v22;
      double v29 = v23;
      v34.double width = v23;
      v34.double height = v24;
      UIGraphicsBeginImageContextWithOptions(v34, 0, v15);
      objc_msgSend(v10, "drawWithRect:options:attributes:context:", 1, v20, 0, v27, v28, v29, v26);
      v25 = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
    }
  }

  return v25;
}

@end