@interface UIImage(CUIKPlatforms)
+ (id)cuik_drawImageWithSize:()CUIKPlatforms drawBlock:;
+ (id)cuik_stripedImageWithBackgroundColor:()CUIKPlatforms stripeColor:scale:;
+ (uint64_t)cuik_imageFromISImage:()CUIKPlatforms;
+ (uint64_t)cuik_resizableImageFromOriginalImage:()CUIKPlatforms withCapInsets:resizingMode:;
- (id)cuik_imageWithInsets:()CUIKPlatforms;
- (uint64_t)cuik_imageWithTintColor:()CUIKPlatforms asTemplate:;
@end

@implementation UIImage(CUIKPlatforms)

+ (uint64_t)cuik_resizableImageFromOriginalImage:()CUIKPlatforms withCapInsets:resizingMode:
{
  return objc_msgSend(a3, "resizableImageWithCapInsets:resizingMode:", a4);
}

+ (id)cuik_drawImageWithSize:()CUIKPlatforms drawBlock:
{
  id v7 = a5;
  v8 = objc_opt_new();
  [v8 setScale:CUIKScaleFactor()];
  [v8 setOpaque:0];
  [v8 setPreferredRange:2];
  v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB17D8]), "initWithSize:format:", v8, a1, a2);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__UIImage_CUIKPlatforms__cuik_drawImageWithSize_drawBlock___block_invoke;
  v13[3] = &unk_1E636AC40;
  id v14 = v7;
  id v10 = v7;
  v11 = [v9 imageWithActions:v13];

  return v11;
}

+ (id)cuik_stripedImageWithBackgroundColor:()CUIKPlatforms stripeColor:scale:
{
  CGImageRef v6 = CUIKCreateStripedImage(a4, a5, a1);
  id v7 = [MEMORY[0x1E4FB1818] imageWithCGImage:v6 scale:0 orientation:a1];
  CFRelease(v6);

  return v7;
}

+ (uint64_t)cuik_imageFromISImage:()CUIKPlatforms
{
  v3 = (void *)MEMORY[0x1E4FB1818];
  id v4 = a3;
  uint64_t v5 = [v4 CGImage];
  [v4 scale];
  double v7 = v6;

  return [v3 imageWithCGImage:v5 scale:0 orientation:v7];
}

- (id)cuik_imageWithInsets:()CUIKPlatforms
{
  [a1 size];
  double v11 = a5 + a3 + v10;
  [a1 size];
  v15[1] = 3221225472;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[2] = __47__UIImage_CUIKPlatforms__cuik_imageWithInsets___block_invoke;
  v15[3] = &unk_1E636AC68;
  v15[4] = a1;
  *(double *)&v15[5] = a3;
  *(double *)&v15[6] = a2;
  v13 = objc_msgSend(MEMORY[0x1E4FB1818], "cuik_drawImageWithSize:drawBlock:", v15, v11, a4 + a2 + v12);

  return v13;
}

- (uint64_t)cuik_imageWithTintColor:()CUIKPlatforms asTemplate:
{
  if (a4) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  return [a1 imageWithTintColor:a3 renderingMode:v4];
}

@end