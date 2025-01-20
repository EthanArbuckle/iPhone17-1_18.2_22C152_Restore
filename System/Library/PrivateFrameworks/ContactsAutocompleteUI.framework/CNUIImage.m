@interface CNUIImage
+ (id)cropImageCircular:(id)a3 withCornerRadius:(double)a4 scale:(double)a5;
+ (id)resizeImage:(id)a3 toFitWidth:(double)a4 scale:(double)a5;
@end

@implementation CNUIImage

+ (id)resizeImage:(id)a3 toFitWidth:(double)a4 scale:(double)a5
{
  id v7 = a3;
  [v7 size];
  if (v8 <= a4)
  {
    id v15 = v7;
  }
  else
  {
    [v7 size];
    double v10 = v9 / a4;
    [v7 size];
    CGFloat v12 = v11 / v10;
    [v7 size];
    CGFloat v14 = v13 / v10;
    v18.width = v12;
    v18.height = v14;
    UIGraphicsBeginImageContextWithOptions(v18, 0, a5);
    objc_msgSend(v7, "drawInRect:", 0.0, 0.0, v12, v14);
    UIGraphicsGetImageFromCurrentImageContext();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v15;
}

+ (id)cropImageCircular:(id)a3 withCornerRadius:(double)a4 scale:(double)a5
{
  id v7 = (objc_class *)MEMORY[0x1E4F42AA0];
  id v8 = a3;
  double v9 = (void *)[[v7 alloc] initWithImage:v8];

  double v10 = [v9 layer];
  [v10 setMasksToBounds:1];

  double v11 = [v9 layer];
  [v11 setCornerRadius:a4];

  [v9 bounds];
  v18.width = v12;
  v18.height = v13;
  UIGraphicsBeginImageContextWithOptions(v18, 0, a5);
  CGFloat v14 = [v9 layer];
  [v14 renderInContext:UIGraphicsGetCurrentContext()];

  id v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v15;
}

@end