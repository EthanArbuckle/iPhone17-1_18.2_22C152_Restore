@interface UIImage(AppleAccountUI)
+ (id)_circularImageFromIcon:()AppleAccountUI size:scale:;
+ (id)aaui_imageFromColor:()AppleAccountUI;
+ (id)addBackgroundForImage:()AppleAccountUI withBackgroundColor:yShift:;
+ (id)circularImageForBundleID:()AppleAccountUI size:scale:;
+ (id)circularImageFromCGImage:()AppleAccountUI size:scale:;
+ (uint64_t)addBackgroundForImage:()AppleAccountUI withBackgroundColor:;
- (id)_imageByCroppingCGImageToRect:()AppleAccountUI;
- (id)_imageByCroppingCIImageToRect:()AppleAccountUI;
- (id)imageByCroppingToRect:()AppleAccountUI;
- (void)_cropRectForRawImageOrientation:()AppleAccountUI;
@end

@implementation UIImage(AppleAccountUI)

+ (id)aaui_imageFromColor:()AppleAccountUI
{
  id v3 = a3;
  v7.width = 1.0;
  v7.height = 1.0;
  UIGraphicsBeginImageContext(v7);
  [v3 set];

  v8.origin.x = 0.0;
  v8.origin.y = 0.0;
  v8.size.width = 1.0;
  v8.size.height = 1.0;
  UIRectFill(v8);
  v4 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v4;
}

- (id)imageByCroppingToRect:()AppleAccountUI
{
  objc_msgSend(a1, "_cropRectForRawImageOrientation:");
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id v10 = a1;
  if ([v10 CGImage])
  {
    v11 = objc_msgSend(v10, "_imageByCroppingCGImageToRect:", v3, v5, v7, v9);
  }
  else
  {
    v12 = [v10 CIImage];

    if (v12)
    {
      v11 = objc_msgSend(v10, "_imageByCroppingCIImageToRect:", v3, v5, v7, v9);
    }
    else
    {
      v11 = 0;
    }
  }
  return v11;
}

- (id)_imageByCroppingCGImageToRect:()AppleAccountUI
{
  id v9 = a1;
  id v10 = (CGImage *)[v9 CGImage];
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  v11 = CGImageCreateWithImageInRect(v10, v17);
  v12 = (void *)MEMORY[0x263F827E8];
  [v9 scale];
  v14 = objc_msgSend(v12, "imageWithCGImage:scale:orientation:", v11, objc_msgSend(v9, "imageOrientation"), v13);
  CGImageRelease(v11);
  return v14;
}

- (id)_imageByCroppingCIImageToRect:()AppleAccountUI
{
  id v10 = [a1 CIImage];
  v11 = objc_msgSend(v10, "imageByCroppingToRect:", a2, a3, a4, a5);

  v12 = (void *)MEMORY[0x263F827E8];
  [a1 scale];
  v14 = objc_msgSend(v12, "imageWithCIImage:scale:orientation:", v11, objc_msgSend(a1, "imageOrientation"), v13);

  return v14;
}

- (void)_cropRectForRawImageOrientation:()AppleAccountUI
{
  *(_OWORD *)&v26.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v26.c = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v29.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v29.c = *(_OWORD *)&v26.c;
  *(_OWORD *)&v26.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v29.tx = *(_OWORD *)&v26.tx;
  unint64_t v10 = [a1 imageOrientation];
  if (v10 <= 7)
  {
    if (((1 << v10) & 0x22) != 0)
    {
      CGAffineTransform v28 = v26;
      CGAffineTransformRotate(&v29, &v28, 3.14159265);
      [a1 size];
      double v17 = v16;
      [a1 scale];
      double v19 = -(v17 * v18);
      [a1 size];
      double v21 = v20;
      [a1 scale];
      double v15 = -(v21 * v22);
      CGAffineTransform v27 = v29;
      double v14 = v19;
      goto LABEL_8;
    }
    if (((1 << v10) & 0x44) != 0)
    {
      CGAffineTransform v28 = v26;
      CGAffineTransformRotate(&v29, &v28, 1.57079633);
      [a1 size];
      double v24 = v23;
      [a1 scale];
      double v15 = -(v24 * v25);
      CGAffineTransform v27 = v29;
      double v14 = 0.0;
      goto LABEL_8;
    }
    if (((1 << v10) & 0x88) != 0)
    {
      CGAffineTransform v28 = v26;
      CGAffineTransformRotate(&v29, &v28, -1.57079633);
      [a1 size];
      double v12 = v11;
      [a1 scale];
      double v14 = -(v12 * v13);
      CGAffineTransform v27 = v29;
      double v15 = 0.0;
LABEL_8:
      CGAffineTransformTranslate(&v28, &v27, v14, v15);
      CGAffineTransform v29 = v28;
    }
  }
  CGAffineTransform v28 = v29;
  v30.origin.x = a2;
  v30.origin.y = a3;
  v30.size.width = a4;
  v30.size.height = a5;
  CGRectApplyAffineTransform(v30, &v28);
}

+ (id)circularImageForBundleID:()AppleAccountUI size:scale:
{
  double v8 = (objc_class *)MEMORY[0x263F4B540];
  id v9 = a5;
  unint64_t v10 = (void *)[[v8 alloc] initWithBundleIdentifier:v9];

  double v11 = [a1 _circularImageFromIcon:v10 size:a2 scale:a3];

  return v11;
}

+ (id)_circularImageFromIcon:()AppleAccountUI size:scale:
{
  double v8 = (objc_class *)MEMORY[0x263F4B558];
  id v9 = a5;
  unint64_t v10 = objc_msgSend([v8 alloc], "initWithSize:scale:", a2, a2, a3);
  double v11 = [v9 prepareImageForDescriptor:v10];

  double v12 = objc_msgSend(a1, "circularImageFromCGImage:size:scale:", objc_msgSend(v11, "CGImage"), a2, a2, a3);

  return v12;
}

+ (id)circularImageFromCGImage:()AppleAccountUI size:scale:
{
  unint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", a1, a2);
  double v11 = [MEMORY[0x263F827E8] imageWithCGImage:a6 scale:0 orientation:a3];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __63__UIImage_AppleAccountUI__circularImageFromCGImage_size_scale___block_invoke;
  v16[3] = &unk_263F92EE0;
  double v18 = a1;
  double v19 = a2;
  id v17 = v11;
  id v12 = v11;
  double v13 = [v10 imageWithActions:v16];
  if (!v13)
  {
    double v14 = _AAUILogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[UIImage(AppleAccountUI) circularImageFromCGImage:size:scale:](v14);
    }
  }
  return v13;
}

+ (uint64_t)addBackgroundForImage:()AppleAccountUI withBackgroundColor:
{
  return objc_msgSend(a1, "addBackgroundForImage:withBackgroundColor:yShift:", 0.0);
}

+ (id)addBackgroundForImage:()AppleAccountUI withBackgroundColor:yShift:
{
  id v7 = a4;
  id v8 = a5;
  [v7 size];
  double v10 = (29.0 - v9) * 0.5;
  [v7 size];
  double v12 = (29.0 - v11) * 0.5;
  [v7 size];
  uint64_t v14 = v13;
  [v7 size];
  uint64_t v16 = v15;
  id v17 = objc_msgSend(objc_alloc(MEMORY[0x263F827A0]), "initWithSize:", 29.0, 29.0);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __76__UIImage_AppleAccountUI__addBackgroundForImage_withBackgroundColor_yShift___block_invoke;
  v34[3] = &unk_263F92F08;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  __asm { FMOV            V0.2D, #29.0 }
  long long v28 = _Q0;
  long long v39 = _Q0;
  id v35 = v8;
  id v36 = v7;
  double v40 = a1;
  double v41 = v10;
  double v42 = v12;
  uint64_t v43 = v14;
  uint64_t v44 = v16;
  id v23 = v7;
  id v24 = v8;
  double v25 = [v17 imageWithActions:v34];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __76__UIImage_AppleAccountUI__addBackgroundForImage_withBackgroundColor_yShift___block_invoke_2;
  v29[3] = &unk_263F923C0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  long long v33 = v28;
  id v30 = v25;
  CGAffineTransform v26 = [v17 imageWithActions:v29];

  return v26;
}

+ (void)circularImageFromCGImage:()AppleAccountUI size:scale:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  double v2 = "+[UIImage(AppleAccountUI) circularImageFromCGImage:size:scale:]";
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "%s Couldn't create circular image", (uint8_t *)&v1, 0xCu);
}

@end