@interface FMHorizontalRule
+ (id)imageWithColor:(id)a3 leading:(BOOL)a4;
- (CGSize)preferredContentSize;
- (void)commonSetup;
@end

@implementation FMHorizontalRule

+ (id)imageWithColor:(id)a3 leading:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = (void *)MEMORY[0x263F1C920];
  id v6 = a3;
  v7 = [v5 mainScreen];
  [v7 scale];
  double v9 = v8;

  double v10 = 1.0;
  double v11 = 0.0;
  v19.width = 1.0;
  v19.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  if (v9 > 1.0)
  {
    double v10 = 1.0 / v9;
    if (!v4) {
      double v11 = 1.0 - v10;
    }
  }
  id v13 = v6;
  v14 = (CGColor *)[v13 CGColor];

  CGContextSetFillColorWithColor(CurrentContext, v14);
  v20.size.width = 1.0;
  v20.origin.x = 0.0;
  v20.origin.y = v11;
  v20.size.height = v10;
  CGContextFillRect(CurrentContext, v20);
  v15 = UIGraphicsGetImageFromCurrentImageContext();
  v16 = objc_msgSend(v15, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, 0.0, 0.0, 0.0);
  UIGraphicsEndImageContext();

  return v16;
}

- (void)commonSetup
{
  v4.receiver = self;
  v4.super_class = (Class)FMHorizontalRule;
  [(FMRule *)&v4 commonSetup];
  v3 = [(FMRule *)self imageView];
  [v3 setAutoresizingMask:18];
}

- (CGSize)preferredContentSize
{
  double v2 = *MEMORY[0x263F1D7C8];
  double v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end