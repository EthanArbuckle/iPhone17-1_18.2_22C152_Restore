@interface CNUISnowglobeUtilities
+ (BOOL)enableGroupPhoto;
+ (CGColor)backgroundColorForBackgroundStyle:(unint64_t)a3;
+ (CGColor)defaultBackgroundColor;
+ (CGColor)defaultDarkBackgroundColor;
+ (CGImage)circularPlaceholderImageForSize:(CGSize)a3 backgroundStyle:(unint64_t)a4 scale:(double)a5;
+ (CGImage)imageForAvatarImages:(CGImage *)a3 badgeImages:(CGImage *)a4 badgeTypes:(id)a5 rect:(CGRect)a6 itemCount:(int64_t)a7 scope:(id)a8;
+ (CGImage)imageForLayer:(id)a3 inRect:(CGRect)a4;
+ (CGImage)roundedRectPlaceholderImageForSize:(CGSize)a3 backgroundStyle:(unint64_t)a4 scale:(double)a5;
+ (CGSize)sizeForImageAtIndex:(unint64_t)a3 inRect:(CGRect)a4 forItemCount:(unint64_t)a5 scope:(id)a6;
+ (id)avatarLayerForCGImages:(CGImage *)a3 inRect:(CGRect)a4 forItemCount:(int64_t)a5 scope:(id)a6;
+ (id)circularContainerLayerForRect:(CGRect)a3 backgroundStyle:(unint64_t)a4;
+ (id)containerLayerForRect:(CGRect)a3 backgroundStyle:(unint64_t)a4;
+ (id)roundedRectContainerLayerForRect:(CGRect)a3 backgroundStyle:(unint64_t)a4;
@end

@implementation CNUISnowglobeUtilities

+ (id)avatarLayerForCGImages:(CGImage *)a3 inRect:(CGRect)a4 forItemCount:(int64_t)a5 scope:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v11 = a6;
  if (width < height) {
    double height = width;
  }
  v12 = objc_msgSend((id)objc_opt_class(), "circularContainerLayerForRect:backgroundStyle:", objc_msgSend(v11, "backgroundStyle"), x, y, height, height);
  v13 = +[CNUIAvatarLayoutManager layoutConfigurationsForType:2 withItemCount:a5];
  unint64_t v14 = [v13 count];
  if (v14 >= a5) {
    int64_t v15 = a5;
  }
  else {
    int64_t v15 = v14;
  }
  if (v15)
  {
    uint64_t v16 = 0;
    v17 = (void *)MEMORY[0x263EFFA68];
    do
    {
      v18 = [v11 maskedAvatarIndices];
      char v19 = [v18 containsIndex:v16];

      if ((v19 & 1) == 0)
      {
        v20 = [MEMORY[0x263F157E8] layer];
        [v20 setContents:a3[v16]];
        [v12 addSublayer:v20];
        uint64_t v21 = [v17 arrayByAddingObject:v20];

        v22 = [v13 objectAtIndexedSubscript:v16];
        objc_msgSend(v22, "updateLayer:inBounds:atIndex:isRTL:", v20, v16, objc_msgSend(v11, "rightToLeft"), x, y, height, height);
        id v23 = objc_alloc_init(MEMORY[0x263F15880]);
        [v20 bounds];
        CGRect v29 = CGRectInset(v28, 1.0, 1.0);
        v24 = CGPathCreateWithEllipseInRect(v29, 0);
        [v20 setMask:v23];
        [v23 setPath:v24];
        if (v24) {
          CGPathRelease(v24);
        }

        v17 = (void *)v21;
      }
      ++v16;
    }
    while (v15 != v16);
  }
  else
  {
    v17 = (void *)MEMORY[0x263EFFA68];
  }

  return v12;
}

+ (CGImage)imageForAvatarImages:(CGImage *)a3 badgeImages:(CGImage *)a4 badgeTypes:(id)a5 rect:(CGRect)a6 itemCount:(int64_t)a7 scope:(id)a8
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v16 = a5;
  id v17 = a8;
  [v17 scale];
  CGAffineTransformMakeScale(&v62, v18, v18);
  double v19 = height * v62.c + v62.a * width;
  double v20 = height * v62.d + v62.b * width;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v22 = CNUIBitmapContextCreate(llround(v19), llround(v20), DeviceRGB);
  unint64_t v23 = 0x263F15000uLL;
  [MEMORY[0x263F158F8] begin];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    [MEMORY[0x263F158F8] activateBackground:1];
  }
  [MEMORY[0x263F158F8] setDisableActions:1];
  v24 = objc_msgSend((id)objc_opt_class(), "avatarLayerForCGImages:inRect:forItemCount:scope:", a3, a7, v17, x, y, v19, v20);
  uint64_t v25 = [v16 count];
  if (v25)
  {
    uint64_t v26 = v25;
    v60 = v22;
    id v27 = [MEMORY[0x263F157E8] layer];
    objc_msgSend(v27, "setFrame:", 0.0, 0.0, v19, v20);
    [v27 addSublayer:v24];
    for (uint64_t i = 0; i != v26; ++i)
    {
      [v24 bounds];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      v37 = [v16 objectAtIndexedSubscript:i];
      v38 = +[CNUIAvatarLayoutManager avatarBadgeLayerForAvatarInRect:badgeType:isRTL:](CNUIAvatarLayoutManager, "avatarBadgeLayerForAvatarInRect:badgeType:isRTL:", [v37 integerValue], objc_msgSend(v17, "rightToLeft"), v30, v32, v34, v36);

      [v38 setContents:a4[i]];
      [v27 addSublayer:v38];
      if ([v17 rightToLeft])
      {
        [v38 frame];
        if (v39 < 0.0)
        {
          [v24 frame];
          double v41 = v40;
          double v43 = v42;
          double v45 = v44;
          double v47 = v46;
          [v38 frame];
          double v49 = v41 + fabs(v48);
          [v38 frame];
          double v51 = v50;
          double v53 = v52;
          double v55 = v54;
          objc_msgSend(v24, "setFrame:", v49, v43, v45, v47);
          objc_msgSend(v38, "setFrame:", 0.0, v51, v53, v55);
        }
      }
    }
    v22 = v60;
    unint64_t v23 = 0x263F15000;
  }
  else
  {
    id v27 = v24;
  }
  [v27 frame];
  transform.b = 0.0;
  transform.c = 0.0;
  transform.a = 1.0;
  *(_OWORD *)&transform.d = xmmword_20B7DB3F0;
  transform.tdouble y = v56;
  CGContextConcatCTM(v22, &transform);
  [v27 renderInContext:v22];
  CGImageRef Image = CGBitmapContextCreateImage(v22);
  [*(id *)(v23 + 2296) commit];
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v22);
  if (Image) {
    v58 = (CGImage *)CFAutorelease(Image);
  }
  else {
    v58 = 0;
  }

  return v58;
}

+ (id)circularContainerLayerForRect:(CGRect)a3 backgroundStyle:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8 = objc_msgSend(a1, "containerLayerForRect:backgroundStyle:", a4);
  id v9 = objc_alloc_init(MEMORY[0x263F15880]);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  v10 = CGPathCreateWithEllipseInRect(v13, 0);
  [v8 setMask:v9];
  [v9 setPath:v10];
  if (v10) {
    CGPathRelease(v10);
  }

  return v8;
}

+ (id)containerLayerForRect:(CGRect)a3 backgroundStyle:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = objc_alloc_init(MEMORY[0x263F157E8]);
  objc_msgSend(v9, "setBackgroundColor:", objc_msgSend((id)objc_opt_class(), "backgroundColorForBackgroundStyle:", a4));
  objc_msgSend(v9, "setFrame:", x, y, width, height);
  return v9;
}

+ (CGColor)backgroundColorForBackgroundStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      CGFloat v3 = 0.882352941;
      CGFloat v4 = 0.88627451;
      CGFloat v5 = 0.894117647;
      CGFloat v6 = 0.32;
      break;
    case 2uLL:
      CGFloat v6 = 0.56;
      goto LABEL_6;
    case 3uLL:
      CGFloat v6 = 0.2;
LABEL_6:
      CGFloat v3 = 1.0;
      CGFloat v4 = 1.0;
      CGFloat v5 = 1.0;
      break;
    case 4uLL:
      CGFloat v3 = 0.0;
      CGFloat v4 = 0.0;
      CGFloat v5 = 0.0;
      CGFloat v6 = 0.0;
      break;
    default:
      CGFloat v3 = 0.882352941;
      CGFloat v4 = 0.88627451;
      CGFloat v5 = 0.894117647;
      CGFloat v6 = 0.56;
      break;
  }
  result = CGColorCreateSRGB(v3, v4, v5, v6);
  if (result)
  {
    return (CGColor *)CFAutorelease(result);
  }
  return result;
}

+ (CGSize)sizeForImageAtIndex:(unint64_t)a3 inRect:(CGRect)a4 forItemCount:(unint64_t)a5 scope:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v12 = a6;
  CGRect v13 = +[CNUIAvatarLayoutManager layoutConfigurationsForType:2 withItemCount:a5];
  if ([v13 count] <= a3)
  {
    double v16 = *MEMORY[0x263F001B0];
    double v18 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  else
  {
    unint64_t v14 = [v13 objectAtIndexedSubscript:a3];
    objc_msgSend(v14, "itemFrameInContainingBounds:isRTL:", objc_msgSend(v12, "rightToLeft"), x, y, width, height);
    double v16 = v15;
    double v18 = v17;
  }
  double v19 = v16;
  double v20 = v18;
  result.double height = v20;
  result.double width = v19;
  return result;
}

+ (BOOL)enableGroupPhoto
{
  if (enableGroupPhoto_s_onceToken != -1) {
    dispatch_once(&enableGroupPhoto_s_onceToken, &__block_literal_global_16);
  }
  return (enableGroupPhoto_enableGroupPhoto | enableGroupPhoto_enablePinning) != 0;
}

void __42__CNUISnowglobeUtilities_enableGroupPhoto__block_invoke()
{
  enableGroupPhoto_enableGroupPhoto = _os_feature_enabled_impl();
  enableGroupPhoto_enablePinning = _os_feature_enabled_impl();
  v0 = [MEMORY[0x263F086E0] mainBundle];
  v1 = [v0 bundleIdentifier];
  int v2 = [v1 isEqualToString:*MEMORY[0x263EFDED8]];

  if (!enableGroupPhoto_enableGroupPhoto && !enableGroupPhoto_enablePinning)
  {
    if (v2)
    {
      enableGroupPhoto_enableGroupPhoto = CFPreferencesGetAppBooleanValue(@"EnableGroupPhoto", @"com.apple.messages", 0) != 0;
      enableGroupPhoto_enablePinning = CFPreferencesGetAppBooleanValue(@"ConversationPinning", @"com.apple.messages", 0) != 0;
    }
  }
}

+ (CGImage)circularPlaceholderImageForSize:(CGSize)a3 backgroundStyle:(unint64_t)a4 scale:(double)a5
{
  double height = a3.height;
  double width = a3.width;
  [MEMORY[0x263F158F8] begin];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    [MEMORY[0x263F158F8] activateBackground:1];
  }
  [MEMORY[0x263F158F8] setDisableActions:1];
  double v9 = width * a5;
  double v10 = height * a5;
  id v11 = objc_msgSend((id)objc_opt_class(), "circularContainerLayerForRect:backgroundStyle:", a4, 0.0, 0.0, v9, v10);
  id v12 = (CGImage *)objc_msgSend((id)objc_opt_class(), "imageForLayer:inRect:", v11, 0.0, 0.0, v9, v10);
  [MEMORY[0x263F158F8] commit];

  return v12;
}

+ (CGImage)imageForLayer:(id)a3 inRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  id v6 = a3;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v8 = CNUIBitmapContextCreate(llround(width), llround(height), DeviceRGB);
  [v6 renderInContext:v8];

  CGImageRef Image = CGBitmapContextCreateImage(v8);
  CGColorSpaceRelease(DeviceRGB);
  CGContextRelease(v8);
  if (!Image) {
    return 0;
  }
  return (CGImage *)CFAutorelease(Image);
}

+ (CGColor)defaultBackgroundColor
{
  int v2 = objc_opt_class();
  return (CGColor *)[v2 backgroundColorForBackgroundStyle:0];
}

+ (CGColor)defaultDarkBackgroundColor
{
  int v2 = objc_opt_class();
  return (CGColor *)[v2 backgroundColorForBackgroundStyle:1];
}

+ (id)roundedRectContainerLayerForRect:(CGRect)a3 backgroundStyle:(unint64_t)a4
{
  CGFloat height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8 = objc_msgSend(a1, "containerLayerForRect:backgroundStyle:", a4);
  id v9 = objc_alloc_init(MEMORY[0x263F15880]);
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.double width = width;
  v14.size.CGFloat height = height;
  CGFloat v10 = floor(width * 15.0 / 255.0) * 0.5;
  id v11 = CGPathCreateWithRoundedRect(v14, v10, v10, 0);
  [v8 setMask:v9];
  [v9 setPath:v11];
  if (v11) {
    CGPathRelease(v11);
  }

  return v8;
}

+ (CGImage)roundedRectPlaceholderImageForSize:(CGSize)a3 backgroundStyle:(unint64_t)a4 scale:(double)a5
{
  double height = a3.height;
  double width = a3.width;
  [MEMORY[0x263F158F8] begin];
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0) {
    [MEMORY[0x263F158F8] activateBackground:1];
  }
  [MEMORY[0x263F158F8] setDisableActions:1];
  double v9 = width * a5;
  double v10 = height * a5;
  id v11 = objc_msgSend((id)objc_opt_class(), "roundedRectContainerLayerForRect:backgroundStyle:", a4, 0.0, 0.0, v9, v10);
  id v12 = (CGImage *)objc_msgSend((id)objc_opt_class(), "imageForLayer:inRect:", v11, 0.0, 0.0, v9, v10);
  [MEMORY[0x263F158F8] commit];

  return v12;
}

@end