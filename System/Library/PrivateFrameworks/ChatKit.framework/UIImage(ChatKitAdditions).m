@interface UIImage(ChatKitAdditions)
+ (id)__ck_actionImageForSubscriptionShortName:()ChatKitAdditions;
+ (id)__ck_actionImageForSubscriptionShortName:()ChatKitAdditions isFilled:;
+ (id)abImageNamed:()ChatKitAdditions;
+ (id)ckColorImageOfSize:()ChatKitAdditions withColor:;
+ (id)ckImageNamed:()ChatKitAdditions compatibleWithTraitCollection:;
+ (id)ckImageNamed:()ChatKitAdditions withTintColor:;
+ (id)ckImageWithData:()ChatKitAdditions;
+ (id)ckTemplateImageNamed:()ChatKitAdditions;
+ (uint64_t)ckImageNamed:()ChatKitAdditions;
- (__CFData)__ck_ASTCRepresentation;
- (double)__ck_contentsCenter;
- (id)__ck_imageWithOrientation:()ChatKitAdditions;
- (id)__ck_resizableBalloonWithBalloonDescriptor:()ChatKitAdditions framed:;
- (id)ckImageWithTintColor:()ChatKitAdditions insets:traitCollection:;
- (id)ck_imageCroppedToCircle;
- (uint64_t)ckImageWithTintColor:()ChatKitAdditions;
- (void)decode;
@end

@implementation UIImage(ChatKitAdditions)

+ (uint64_t)ckImageNamed:()ChatKitAdditions
{
  return [a1 ckImageNamed:a3 compatibleWithTraitCollection:0];
}

+ (id)ckImageNamed:()ChatKitAdditions compatibleWithTraitCollection:
{
  v5 = (void *)MEMORY[0x1E4F42A80];
  id v6 = a4;
  id v7 = a3;
  v8 = CKFrameworkBundle();
  v9 = [v5 imageNamed:v7 inBundle:v8 compatibleWithTraitCollection:v6];

  return v9;
}

+ (id)ckColorImageOfSize:()ChatKitAdditions withColor:
{
  id v7 = a5;
  v14.width = a1;
  v14.height = a2;
  UIGraphicsBeginImageContext(v14);
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

+ (id)abImageNamed:()ChatKitAdditions
{
  uint64_t v3 = abImageNamed__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&abImageNamed__onceToken, &__block_literal_global_45);
  }
  v5 = [MEMORY[0x1E4F42A80] imageNamed:v4 inBundle:abImageNamed__sABBundle];

  return v5;
}

+ (id)ckImageWithData:()ChatKitAdditions
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F42A80];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] _initWithData:v4 preserveScale:1 cache:1];

  id v6 = (void *)MEMORY[0x1E4F42A80];
  id v7 = v5;
  uint64_t v8 = [v7 CGImage];
  id v9 = [MEMORY[0x1E4F42D90] mainScreen];
  [v9 scale];
  v11 = objc_msgSend(v6, "imageWithCGImage:scale:orientation:", v8, objc_msgSend(v7, "imageOrientation"), v10);

  return v11;
}

- (id)__ck_resizableBalloonWithBalloonDescriptor:()ChatKitAdditions framed:
{
  id v7 = objc_msgSend(a1, "__ck_imageWithOrientation:", 4 * (a3[3] == 0));
  [a1 capInsets];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  if (a3[73]) {
    char v16 = a3[1];
  }
  else {
    char v16 = 0;
  }
  v17 = +[CKUIBehavior sharedBehaviors];
  [v17 balloonMaskAlignmentRectInsetsWithTailShape:v16];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  if (a4)
  {
    v26 = +[CKUIBehavior sharedBehaviors];
    [v26 balloonMaskFrameInsetsWithBalloonShape:*a3];
    double v9 = v9 + v27;
    double v11 = v11 + v28;
    double v13 = v13 + v29;
    double v15 = v15 + v30;
  }
  v31 = objc_msgSend(v7, "resizableImageWithCapInsets:", v9, v11, v13, v15);

  v32 = objc_msgSend(v31, "imageWithAlignmentRectInsets:", v19, v21, v23, v25);

  return v32;
}

- (id)__ck_imageWithOrientation:()ChatKitAdditions
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  if ([v4 imageOrientation] != a3)
  {
    v5 = [v4 images];
    if (v5)
    {
      id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v5, "count"));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v7 = v5;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v40 != v10) {
              objc_enumerationMutation(v7);
            }
            double v12 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * i), "__ck_imageWithOrientation:", a3, (void)v39);
            [v6 addObject:v12];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v9);
      }

      double v13 = (void *)MEMORY[0x1E4F42A80];
      [v4 duration];
      double v14 = objc_msgSend(v13, "animatedImageWithImages:duration:", v6);
    }
    else
    {
      id v15 = objc_alloc(MEMORY[0x1E4F42A80]);
      id v16 = v4;
      uint64_t v17 = [v16 CGImage];
      [v16 scale];
      double v14 = objc_msgSend(v15, "initWithCGImage:scale:orientation:", v17, a3);
    }
    objc_msgSend(v4, "capInsets", (void)v39);
    double v21 = *MEMORY[0x1E4F437F8];
    double v22 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v23 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v24 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    if (v25 != v22 || v18 != v21 || v20 != v24 || v19 != v23)
    {
      uint64_t v29 = objc_msgSend(v14, "resizableImageWithCapInsets:");

      double v14 = (void *)v29;
    }
    [v4 alignmentRectInsets];
    if (v33 != v22 || v30 != v21 || v32 != v24 || v31 != v23)
    {
      uint64_t v37 = objc_msgSend(v14, "imageWithAlignmentRectInsets:");

      double v14 = (void *)v37;
    }

    id v4 = v14;
  }

  return v4;
}

- (double)__ck_contentsCenter
{
  [a1 size];
  double v3 = v2;
  [a1 capInsets];
  double v5 = v4 / v3;
  if (v3 == 0.0) {
    return 0.0;
  }
  else {
    return v5;
  }
}

- (__CFData)__ck_ASTCRepresentation
{
  double v2 = (__CFData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
  if (__ck_ASTCRepresentation_onceToken != -1) {
    dispatch_once(&__ck_ASTCRepresentation_onceToken, &__block_literal_global_581_0);
  }
  double v3 = CGImageDestinationCreateWithData(v2, @"com.apple.atx", 1uLL, 0);
  double v4 = (CGImage *)[a1 CGImage];
  CGImageDestinationAddImage(v3, v4, (CFDictionaryRef)__ck_ASTCRepresentation_imageProperties);
  CGImageDestinationFinalize(v3);
  CFRelease(v3);

  return v2;
}

- (id)ck_imageCroppedToCircle
{
  [a1 size];
  double v3 = v2;
  [a1 size];
  if (v3 >= v4) {
    double v3 = v4;
  }
  [a1 size];
  CGFloat v6 = (v3 - v5) * 0.5;
  [a1 size];
  CGFloat v8 = (v3 - v7) * 0.5;
  v21.origin.double x = 0.0;
  v21.origin.double y = 0.0;
  v21.size.double width = v3;
  v21.size.double height = v3;
  CGRect v22 = CGRectInset(v21, v6, v8);
  double x = v22.origin.x;
  double y = v22.origin.y;
  double width = v22.size.width;
  double height = v22.size.height;
  double v13 = [MEMORY[0x1E4F42D90] mainScreen];
  [v13 scale];
  CGFloat v15 = v14;
  v20.double width = width;
  v20.double height = height;
  UIGraphicsBeginImageContextWithOptions(v20, 0, v15);

  id v16 = objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v3 * 0.5);
  [v16 addClip];

  objc_msgSend(a1, "drawInRect:", x, y, width, height);
  uint64_t v17 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v17;
}

- (void)decode
{
  result = (void *)[a1 CGImage];
  if (result)
  {
    return objc_msgSend(result, "CA_prepareRenderValue");
  }
  return result;
}

- (uint64_t)ckImageWithTintColor:()ChatKitAdditions
{
  return objc_msgSend(a1, "ckImageWithTintColor:insets:traitCollection:", a3, 0, *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));
}

- (id)ckImageWithTintColor:()ChatKitAdditions insets:traitCollection:
{
  id v14 = a7;
  id v15 = a8;
  [a1 size];
  double v17 = v16;
  double v19 = v18;
  if (v15) {
    [MEMORY[0x1E4F42A60] formatForTraitCollection:v15];
  }
  else {
  CGSize v20 = [MEMORY[0x1E4F42A60] preferredFormat];
  }
  CGRect v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:format:", v20, a3 + a5 + v17, a2 + a4 + v19);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __73__UIImage_ChatKitAdditions__ckImageWithTintColor_insets_traitCollection___block_invoke;
  v25[3] = &unk_1E5623F78;
  double v27 = a2;
  double v28 = a3;
  double v29 = a4;
  double v30 = a5;
  v25[4] = a1;
  id v26 = v14;
  id v22 = v14;
  double v23 = [v21 imageWithActions:v25];

  return v23;
}

+ (id)ckImageNamed:()ChatKitAdditions withTintColor:
{
  id v5 = a4;
  CGFloat v6 = [MEMORY[0x1E4F42A80] ckImageNamed:a3];
  double v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = [v6 ckImageWithTintColor:v5];

    double v7 = (void *)v8;
  }

  return v7;
}

+ (id)ckTemplateImageNamed:()ChatKitAdditions
{
  v1 = objc_msgSend(a1, "ckImageNamed:");
  double v2 = [v1 imageWithRenderingMode:2];

  return v2;
}

+ (id)__ck_actionImageForSubscriptionShortName:()ChatKitAdditions
{
  id v3 = a3;
  double v4 = objc_msgSend((id)objc_opt_class(), "__ck_actionImageForSubscriptionShortName:isFilled:", v3, 1);

  return v4;
}

+ (id)__ck_actionImageForSubscriptionShortName:()ChatKitAdditions isFilled:
{
  id v5 = (objc_class *)MEMORY[0x1E4F42FF0];
  id v6 = a3;
  double v7 = objc_msgSend([v5 alloc], "initWithFrame:", 0.0, 0.0, 25.0, 25.0);
  uint64_t v8 = [MEMORY[0x1E4F428B8] clearColor];
  [v7 setBackgroundColor:v8];

  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", 0.0, 0.0, 17.0, 17.0);
  uint64_t v10 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
  [v9 setFont:v10];

  [v9 setText:v6];
  if (a4)
  {
    double v11 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    [v9 setTextColor:v11];

    [v9 setTextAlignment:1];
    double v12 = [MEMORY[0x1E4F428B8] labelColor];
    [v9 setBackgroundColor:v12];

    double v13 = [v9 layer];
    [v13 setMasksToBounds:1];

    id v14 = [v9 layer];
    [v14 setCornerRadius:3.0];
  }
  else
  {
    id v15 = [MEMORY[0x1E4F428B8] labelColor];
    [v9 setTextColor:v15];

    [v9 setTextAlignment:1];
    double v16 = [MEMORY[0x1E4F428B8] clearColor];
    [v9 setBackgroundColor:v16];

    double v17 = [v9 layer];
    [v17 setMasksToBounds:1];

    double v18 = [v9 layer];
    [v18 setCornerRadius:3.0];

    id v19 = [MEMORY[0x1E4F428B8] labelColor];
    uint64_t v20 = [v19 CGColor];
    CGRect v21 = [v9 layer];
    [v21 setBorderColor:v20];

    id v14 = [v9 layer];
    [v14 setBorderWidth:1.5];
  }

  [v9 intrinsicContentSize];
  double v23 = v22 + 7.0;
  if (v22 + 7.0 > 17.0)
  {
    double v24 = v22 + 10.0;
    if (v24 <= 25.0) {
      double v25 = 25.0;
    }
    else {
      double v25 = v24;
    }
    objc_msgSend(v7, "setFrame:", 0.0, 0.0, v25, v25);
    objc_msgSend(v9, "setFrame:", 0.0, 0.0, v23, 17.0);
  }
  [v7 center];
  objc_msgSend(v9, "setCenter:");
  [v7 addSubview:v9];
  [v7 bounds];
  v35.double width = v26;
  v35.double height = v27;
  UIGraphicsBeginImageContextWithOptions(v35, 0, 0.0);
  double v28 = [v7 layer];
  [v28 renderInContext:UIGraphicsGetCurrentContext()];

  double v29 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  double v30 = (void *)MEMORY[0x1E4F42A80];
  id v31 = v29;
  double v32 = objc_msgSend(v30, "imageWithCGImage:scale:orientation:", objc_msgSend(v31, "CGImage"), 0, 0.0);

  return v32;
}

@end