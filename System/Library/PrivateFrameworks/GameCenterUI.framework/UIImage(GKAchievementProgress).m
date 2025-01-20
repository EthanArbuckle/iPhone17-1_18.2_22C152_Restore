@interface UIImage(GKAchievementProgress)
- (id)_gkImageWithProgress:()GKAchievementProgress achievement:isDetail:;
- (id)_gkMaskImageWithProgress:()GKAchievementProgress isDetail:;
- (id)_gkQuestionMarkImage;
@end

@implementation UIImage(GKAchievementProgress)

- (id)_gkQuestionMarkImage
{
  if (_gkQuestionMarkImage_onceToken != -1) {
    dispatch_once(&_gkQuestionMarkImage_onceToken, &__block_literal_global_48);
  }
  v0 = (void *)_gkQuestionMarkImage_sImage;

  return v0;
}

- (id)_gkMaskImageWithProgress:()GKAchievementProgress isDetail:
{
  if (a2 <= 0.999)
  {
    if (_gkMaskImageWithProgress_isDetail__onceToken != -1) {
      dispatch_once(&_gkMaskImageWithProgress_isDetail__onceToken, &__block_literal_global_2);
    }
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"%d~%g", a4, *(void *)&a2);
    id v9 = (id)_gkMaskImageWithProgress_isDetail__sMaskCache;
    objc_sync_enter(v9);
    v5 = [(id)_gkMaskImageWithProgress_isDetail__sMaskCache objectForKey:v8];
    if (!v5)
    {
      [a1 size];
      double v11 = v10;
      double v13 = v12;
      [a1 scale];
      CGFloat v15 = v14;
      v31.double width = v11;
      v31.double height = v13;
      UIGraphicsBeginImageContextWithOptions(v31, 0, v15);
      v16 = [MEMORY[0x1E4FB1618] blackColor];
      [v16 set];

      v17 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", 0.0, 0.0, v11, v13);
      [v17 fill];
      v32.origin.double x = 0.0;
      v32.origin.double y = 0.0;
      v32.size.double width = v11;
      v32.size.double height = v13;
      CGRect v33 = CGRectInset(v32, 1.5, 1.5);
      double x = v33.origin.x;
      double y = v33.origin.y;
      double width = v33.size.width;
      double height = v33.size.height;
      if (a2 <= 0.01)
      {
        v24 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v33.origin.x, v33.origin.y, v33.size.width, v33.size.height);
        [v24 fillWithBlendMode:16 alpha:1.0];
        v26 = [a1 _gkQuestionMarkImage];
        [v26 size];
        objc_msgSend(v26, "drawInRect:", round(x + (width - v27) * 0.5), round(y + (height - v28) * 0.5), v27);
      }
      else
      {
        double MidX = CGRectGetMidX(v33);
        v34.origin.double x = x;
        v34.origin.double y = y;
        v34.size.double width = width;
        v34.size.double height = height;
        double MidY = CGRectGetMidY(v34);
        v24 = [MEMORY[0x1E4FB14C0] bezierPath];
        objc_msgSend(v24, "moveToPoint:", MidX, MidY);
        double v25 = width * 0.5;
        objc_msgSend(v24, "addLineToPoint:", MidX, MidY - v25);
        objc_msgSend(v24, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MidX, MidY, v25, -1.57079633, (a2 + a2) * 3.14159265 + -1.57079633);
        objc_msgSend(v24, "addLineToPoint:", MidX, MidY);
        [v24 closePath];
        [v24 fillWithBlendMode:16 alpha:1.0];
      }

      v5 = UIGraphicsGetImageFromCurrentImageContext();
      [(id)_gkMaskImageWithProgress_isDetail__sMaskCache setObject:v5 forKey:v8];
      UIGraphicsEndImageContext();
    }
    objc_sync_exit(v9);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_gkImageWithProgress:()GKAchievementProgress achievement:isDetail:
{
  id v7 = a1;
  v8 = v7;
  if (a2 <= 0.999)
  {
    [v7 size];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    double v13 = [v8 _gkMaskImageWithProgress:a5 isDetail:a2];
    [v8 scale];
    CGFloat v15 = v14;
    v24.double width = v10;
    v24.double height = v12;
    UIGraphicsBeginImageContextWithOptions(v24, 0, v15);
    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(CurrentContext);
    CGContextTranslateCTM(CurrentContext, 0.0, v12);
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    id v17 = v13;
    v18 = (CGImage *)[v17 CGImage];
    v25.origin.double x = 0.0;
    v25.origin.double y = 0.0;
    v25.size.double width = v10;
    v25.size.double height = v12;
    CGContextClipToMask(CurrentContext, v25, v18);
    id v19 = v8;
    v20 = (CGImage *)[v19 CGImage];

    v26.origin.double x = 0.0;
    v26.origin.double y = 0.0;
    v26.size.double width = v10;
    v26.size.double height = v12;
    CGContextDrawImage(CurrentContext, v26, v20);
    v21 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
    [v21 set];

    v27.origin.double x = 0.0;
    v27.origin.double y = 0.0;
    v27.size.double width = v10;
    v27.size.double height = v12;
    UIRectFillUsingBlendMode(v27, kCGBlendModeNormal);
    CGContextRestoreGState(CurrentContext);
    v8 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }

  return v8;
}

@end