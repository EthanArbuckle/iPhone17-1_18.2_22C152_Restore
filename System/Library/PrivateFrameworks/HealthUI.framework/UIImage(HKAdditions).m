@interface UIImage(HKAdditions)
+ (id)hk_arrowExerciseImage;
+ (id)hk_arrowMoveImage;
+ (id)hk_arrowStandImage;
+ (id)hk_hearingHealthAudioExposureSymbolForClassification:()HKAdditions font:;
+ (id)hk_medicationsSymbolImage;
+ (id)hk_transparentInterfaceImageWithSize:()HKAdditions;
+ (uint64_t)hk_disclosureChevronImage;
- (double)hk_scaledImageViewHeightWithScaledWidth:()HKAdditions;
- (id)hk_croppedImageWithRect:()HKAdditions;
- (id)hk_resizedInterfaceImageWithSize:()HKAdditions;
- (id)hk_watchIconImage;
@end

@implementation UIImage(HKAdditions)

- (double)hk_scaledImageViewHeightWithScaledWidth:()HKAdditions
{
  [a1 size];
  double v5 = v4;
  [a1 size];
  return HKUICeilToScreenScale(a2 / (v5 / v6));
}

- (id)hk_croppedImageWithRect:()HKAdditions
{
  [a1 scale];
  if (v10 > 1.0)
  {
    [a1 scale];
    a2 = a2 * v11;
    [a1 scale];
    a3 = a3 * v12;
    [a1 scale];
    a4 = a4 * v13;
    [a1 scale];
    a5 = a5 * v14;
  }
  id v15 = a1;
  v16 = (CGImage *)[v15 CGImage];
  v23.origin.x = a2;
  v23.origin.y = a3;
  v23.size.width = a4;
  v23.size.height = a5;
  v17 = CGImageCreateWithImageInRect(v16, v23);
  v18 = (void *)MEMORY[0x1E4FB1818];
  [v15 scale];
  v20 = objc_msgSend(v18, "imageWithCGImage:scale:orientation:", v17, objc_msgSend(v15, "imageOrientation"), v19);
  CGImageRelease(v17);
  return v20;
}

- (id)hk_watchIconImage
{
  [a1 size];
  CGFloat v3 = v2;
  [a1 size];
  v25.size.double height = v4;
  v25.origin.double x = 0.0;
  v25.origin.double y = 0.0;
  v25.size.double width = v3;
  CGRect v26 = CGRectIntegral(v25);
  double x = v26.origin.x;
  double y = v26.origin.y;
  double width = v26.size.width;
  double height = v26.size.height;
  id v9 = a1;
  double v10 = (CGImage *)[v9 CGImage];
  [v9 size];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v9 scale];
  CGFloat v16 = v15;
  v24.double width = v12;
  v24.double height = v14;
  UIGraphicsBeginImageContextWithOptions(v24, 0, v16);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationHigh);
  objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", x, y, width, height);
  id v18 = objc_claimAutoreleasedReturnValue();
  CGContextAddPath(CurrentContext, (CGPathRef)[v18 CGPath]);

  CGContextClip(CurrentContext);
  [v9 size];
  v22.b = 0.0;
  v22.c = 0.0;
  v22.a = 1.0;
  *(_OWORD *)&v22.d = xmmword_1E0F059E0;
  v22.tdouble y = v19;
  CGContextConcatCTM(CurrentContext, &v22);
  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  CGContextDrawImage(CurrentContext, v27, v10);
  v20 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v20;
}

- (id)hk_resizedInterfaceImageWithSize:()HKAdditions
{
  double v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", a2, a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__UIImage_HKAdditions__hk_resizedInterfaceImageWithSize___block_invoke;
  v9[3] = &unk_1E6D53D88;
  v9[4] = a1;
  *(double *)&v9[5] = a2;
  *(double *)&v9[6] = a3;
  v7 = [v6 imageWithActions:v9];

  return v7;
}

+ (id)hk_transparentInterfaceImageWithSize:()HKAdditions
{
  double v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:", a1, a2);
  CGFloat v3 = [v2 imageWithActions:&__block_literal_global_44];

  return v3;
}

+ (uint64_t)hk_disclosureChevronImage
{
  return [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.forward"];
}

+ (id)hk_arrowMoveImage
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  v1 = HKHealthUIFrameworkBundle();
  double v2 = [v0 imageNamed:@"arrow_move" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)hk_arrowExerciseImage
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  v1 = HKHealthUIFrameworkBundle();
  double v2 = [v0 imageNamed:@"arrow_exercise" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)hk_arrowStandImage
{
  v0 = (void *)MEMORY[0x1E4FB1818];
  v1 = HKHealthUIFrameworkBundle();
  double v2 = [v0 imageNamed:@"arrow_stand" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)hk_medicationsSymbolImage
{
  v0 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pills.fill"];
  v1 = objc_msgSend(MEMORY[0x1E4FB1830], "hk_medicationTrackingSymbolConfiguration");
  double v2 = [v0 imageByApplyingSymbolConfiguration:v1];

  return v2;
}

+ (id)hk_hearingHealthAudioExposureSymbolForClassification:()HKAdditions font:
{
  v20[2] = *MEMORY[0x1E4F143B8];
  double v5 = (void *)MEMORY[0x1E4FB08E0];
  id v6 = a4;
  objc_msgSend(v5, "hk_chartCurrentValueValueFont");
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E4FB1830];
  if (v7 == v6)
  {
    [v6 pointSize];
    double v11 = v10;

    id v9 = [v8 configurationWithPointSize:4 weight:1 scale:v11];
  }
  else
  {
    id v9 = [MEMORY[0x1E4FB1830] configurationWithFont:v6 scale:1];
  }
  CGFloat v12 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_hearingHealthAudioExposureBackground");
  v20[0] = v12;
  double v13 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_hearingHealthAudioExposureColorForClassification:", a3);
  v20[1] = v13;
  CGFloat v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];

  double v15 = [MEMORY[0x1E4FB1830] configurationWithPaletteColors:v14];
  if (a3 == 1)
  {
    CGFloat v16 = @"checkmark.circle.fill";
    goto LABEL_8;
  }
  if (a3 == 2)
  {
    CGFloat v16 = @"exclamationmark.triangle.fill";
LABEL_8:
    v17 = [MEMORY[0x1E4FB1818] systemImageNamed:v16 withConfiguration:v9];
    goto LABEL_10;
  }
  v17 = 0;
LABEL_10:
  id v18 = [v17 imageByApplyingSymbolConfiguration:v15];

  return v18;
}

@end