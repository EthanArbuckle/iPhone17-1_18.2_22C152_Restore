@interface UIImage(MapKitExtras)
+ (id)_mapkit_imageNamed:()MapKitExtras;
+ (id)_mapkit_imageNamed:()MapKitExtras compatibleWithTraitCollection:;
- (id)_mapkit_dimmedImage;
- (id)_mapkit_horizontallyFlippedImage;
- (id)_mapkit_imageWithAlpha:()MapKitExtras;
- (id)_mapkit_templateImageWithTintColor:()MapKitExtras;
@end

@implementation UIImage(MapKitExtras)

+ (id)_mapkit_imageNamed:()MapKitExtras
{
  v3 = (void *)MEMORY[0x1E4F42A80];
  v4 = (void *)MEMORY[0x1E4F28B50];
  id v5 = a3;
  v6 = [v4 _mapkitBundle];
  v7 = [v3 imageNamed:v5 inBundle:v6];

  return v7;
}

+ (id)_mapkit_imageNamed:()MapKitExtras compatibleWithTraitCollection:
{
  id v5 = (void *)MEMORY[0x1E4F42A80];
  v6 = (void *)MEMORY[0x1E4F28B50];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 _mapkitBundle];
  v10 = [v5 imageNamed:v8 inBundle:v9 compatibleWithTraitCollection:v7];

  return v10;
}

- (id)_mapkit_dimmedImage
{
  [a1 size];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  [a1 scale];
  CGFloat v7 = v6;
  v22.width = v3;
  v22.height = v5;
  UIGraphicsBeginImageContextWithOptions(v22, 0, v7);
  CurrentContext = UIGraphicsGetCurrentContext();
  [a1 size];
  CGContextTranslateCTM(CurrentContext, 0.0, v9);
  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  [a1 size];
  CGFloat v11 = v10;
  [a1 size];
  CGFloat v13 = v12;
  id v14 = a1;
  v15 = (CGImage *)[v14 CGImage];
  v23.origin.x = 0.0;
  v23.origin.y = 0.0;
  v23.size.width = v11;
  v23.size.height = v13;
  CGContextDrawImage(CurrentContext, v23, v15);
  CGContextSetBlendMode(CurrentContext, kCGBlendModeSourceAtop);
  CGContextSetRGBFillColor(CurrentContext, 0.0, 0.0, 0.0, 0.199999988);
  [v14 size];
  CGFloat v17 = v16;
  [v14 size];
  v24.size.height = v18;
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = v17;
  CGContextFillRect(CurrentContext, v24);
  v19 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v19;
}

- (id)_mapkit_horizontallyFlippedImage
{
  [a1 size];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  [a1 scale];
  CGFloat v7 = v6;
  v14.width = v3;
  v14.height = v5;
  UIGraphicsBeginImageContextWithOptions(v14, 0, v7);
  CurrentContext = UIGraphicsGetCurrentContext();
  [a1 size];
  v12.a = -1.0;
  v12.b = 0.0;
  v12.c = 0.0;
  v12.d = 1.0;
  v12.tx = v9;
  v12.ty = 0.0;
  CGContextConcatCTM(CurrentContext, &v12);
  objc_msgSend(a1, "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  double v10 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v10;
}

- (id)_mapkit_templateImageWithTintColor:()MapKitExtras
{
  id v4 = a3;
  id v5 = a1;
  [v5 size];
  double v7 = v6;
  double v9 = v8;
  double v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", v6, v8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__UIImage_MapKitExtras___mapkit_templateImageWithTintColor___block_invoke;
  v15[3] = &unk_1E54B8CF0;
  long long v18 = *MEMORY[0x1E4F1DB28];
  double v19 = v7;
  double v20 = v9;
  id v16 = v4;
  id v17 = v5;
  id v11 = v5;
  id v12 = v4;
  CGFloat v13 = [v10 imageWithActions:v15];

  return v13;
}

- (id)_mapkit_imageWithAlpha:()MapKitExtras
{
  if (a2 <= 0.0)
  {
    id v10 = 0;
  }
  else if (a2 >= 1.0)
  {
    id v10 = a1;
  }
  else
  {
    [a1 size];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    [a1 scale];
    CGFloat v9 = v8;
    v13.width = v5;
    v13.height = v7;
    UIGraphicsBeginImageContextWithOptions(v13, 0, v9);
    objc_msgSend(a1, "drawAtPoint:blendMode:alpha:", 0, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a2);
    UIGraphicsGetImageFromCurrentImageContext();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();
  }

  return v10;
}

@end