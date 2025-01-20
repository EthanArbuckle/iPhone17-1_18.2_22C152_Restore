@interface UIImage(Additions)
+ (BOOL)isSizeSwappedForImageOrientation:()Additions;
+ (double)transformForImageOrientation:()Additions andSize:;
+ (id)imageWithColor:()Additions andSize:;
+ (uint64_t)imageWithColor:()Additions;
- (BOOL)_isSRGB;
- (double)scaledSized:()Additions maintainAspectRatio:;
- (id)cropImage:()Additions;
- (id)extendedRangeSafeDrawInRect:()Additions opaque:scale:;
- (id)scaledImageEqualOrSmallerThanSize:()Additions maintainAspectRatio:normalizeOrientation:;
- (id)scaledImageWithMaxDimension:()Additions;
- (uint64_t)adjustFitInSize:()Additions normalizeOrientation:;
- (uint64_t)cropped16X9Image;
- (uint64_t)drawImageIntoSize:()Additions maintainAspectRatio:normalizeOrientation:;
- (uint64_t)extendedRangeSafeDrawInRect:()Additions;
- (uint64_t)scaledSizeEqualOrSmallerThanSize:()Additions maintainAspectRatio:normalizeOrientation:;
- (uint64_t)tintedImage;
- (void)drawInRect:()Additions fromRect:blendMode:alpha:;
@end

@implementation UIImage(Additions)

- (void)drawInRect:()Additions fromRect:blendMode:alpha:
{
  v25 = (CGImage *)[a1 CGImage];
  v31.origin.x = a6;
  v31.origin.y = a7;
  v31.size.width = a8;
  v31.size.height = a9;
  if (CGRectIsEmpty(v31))
  {
    double Width = (double)CGImageGetWidth(v25);
    double Height = (double)CGImageGetHeight(v25);
    compositeCGImageRefInRect(v25, a11, a2, a3, a4, a5, 0.0, 0.0, Width, Height, a12);
  }
  else
  {
    v32.origin.x = a6;
    v32.origin.y = a7;
    v32.size.width = a8;
    v32.size.height = a9;
    v28 = CGImageCreateWithImageInRect(v25, v32);
    compositeCGImageRefInRect(v28, a11, a2, a3, a4, a5, a6, a7, a8, a9, a12);
    if (v28)
    {
      CFRelease(v28);
    }
  }
}

- (uint64_t)adjustFitInSize:()Additions normalizeOrientation:
{
  CGFloat v7 = *a3;
  CGFloat v8 = a3[1];
  [a1 size];
  CGFloat v10 = v9;
  [a1 size];
  BOOL v13 = !CGRectCouldContainRect(0.0, 0.0, v7, v8, 0.0, 0.0, v10, v11);
  uint64_t result = v13;
  BOOL v13 = v13 || a4 == 0;
  if (!v13)
  {
    uint64_t result = [a1 imageOrientation];
    if (result)
    {
      [a1 size];
      *(void *)a3 = v14;
      [a1 size];
      *((void *)a3 + 1) = v15;
      return 1;
    }
  }
  return result;
}

- (double)scaledSized:()Additions maintainAspectRatio:
{
  if (a5)
  {
    [a1 size];
    double v9 = v7 / v8;
    if (v9 < 1.0)
    {
      float v10 = a3 * v9;
      return floorf(v10);
    }
  }
  return a2;
}

- (id)scaledImageEqualOrSmallerThanSize:()Additions maintainAspectRatio:normalizeOrientation:
{
  double v11 = a2;
  double v12 = a3;
  if (objc_msgSend(a1, "adjustFitInSize:normalizeOrientation:", &v11))
  {
    objc_msgSend(a1, "drawImageIntoSize:maintainAspectRatio:normalizeOrientation:", a5, a6, v11, v12);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = a1;
  }
  return v9;
}

- (uint64_t)drawImageIntoSize:()Additions maintainAspectRatio:normalizeOrientation:
{
  objc_msgSend(a1, "scaledSized:maintainAspectRatio:");
  return objc_msgSend(a1, "extendedRangeSafeDrawInRect:", 0.0, 0.0, v2, v3);
}

- (uint64_t)scaledSizeEqualOrSmallerThanSize:()Additions maintainAspectRatio:normalizeOrientation:
{
  double v8 = a2;
  double v9 = a3;
  if (objc_msgSend(a1, "adjustFitInSize:normalizeOrientation:", &v8)) {
    return objc_msgSend(a1, "scaledSized:maintainAspectRatio:", a5, v8, v9);
  }
  else {
    return [a1 size];
  }
}

- (id)scaledImageWithMaxDimension:()Additions
{
  id v3 = a1;
  [v3 size];
  double v5 = v4;
  [v3 size];
  if (v5 >= v6) {
    double v7 = v5;
  }
  else {
    double v7 = v6;
  }
  if (v7 > a2)
  {
    [v3 size];
    CGFloat v9 = v8;
    [v3 size];
    v23.origin.CGFloat x = 0.0;
    v23.origin.CGFloat y = 0.0;
    v20.CGFloat width = v9;
    v23.size.CGFloat width = a2;
    v23.size.CGFloat height = a2;
    CGRect v21 = AVMakeRectWithAspectRatioInsideRect(v20, v23);
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
    double v14 = CGRectGetWidth(v21);
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGFloat v15 = CGRectGetHeight(v22);
    LODWORD(v16) = 1.0;
    uint64_t v17 = objc_msgSend(v3, "extendedRangeSafeDrawInRect:opaque:scale:", 0, 0.0, 0.0, v14, v15, v16);

    id v3 = (id)v17;
  }
  return v3;
}

- (uint64_t)cropped16X9Image
{
  [a1 size];
  double v3 = v2;
  [a1 size];
  float v5 = v3 / v4;
  [a1 size];
  double v8 = v7;
  if (v5 <= 1.7778)
  {
    [a1 size];
    double v10 = v11 * 0.0625 * 9.0;
  }
  else
  {
    double v8 = v6 / 9.0 * 16.0;
    [a1 size];
    double v10 = v9;
  }
  [a1 size];
  double v12 = 0.0;
  double v13 = 0.0;
  if (v14 > v8)
  {
    [a1 size];
    double v13 = (v15 - v8) * 0.5;
  }
  [a1 size];
  if (v16 > v10)
  {
    [a1 size];
    double v12 = (v17 - v10) * 0.5;
  }
  return objc_msgSend(a1, "cropImage:", v13, v12, v8, v10);
}

- (id)cropImage:()Additions
{
  id v9 = a1;
  [v9 size];
  if (a4 != v11 || a5 != v10)
  {
    [v9 size];
    double v14 = v13;
    double v16 = v15;
    [v9 scale];
    *(float *)&double v18 = v17;
    uint64_t v19 = objc_msgSend(v9, "extendedRangeSafeDrawInRect:opaque:scale:", 1, -a2, -a3, v14, v16, v18);

    id v9 = (id)v19;
  }
  return v9;
}

+ (BOOL)isSizeSwappedForImageOrientation:()Additions
{
  return ((a3 - 2) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

+ (double)transformForImageOrientation:()Additions andSize:
{
  uint64_t v4 = MEMORY[0x263F000D0];
  long long v5 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)a2 = *MEMORY[0x263F000D0];
  *(_OWORD *)(a2 + 16) = v5;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(v4 + 32);
  switch(a1)
  {
    case 1:
      *(void *)a2 = 0xBFF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0xBFF0000000000000;
      *(double *)(a2 + 32) = result;
      *(double *)(a2 + 40) = a4;
      break;
    case 2:
      uint64_t result = 0.0;
      *(_OWORD *)a2 = xmmword_234D61130;
      *(_OWORD *)(a2 + 16) = xmmword_234D614C0;
      *(double *)(a2 + 32) = a4;
      goto LABEL_6;
    case 3:
      *(_OWORD *)a2 = xmmword_234D614B0;
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 16) = 0x3FF0000000000000;
      *(double *)(a2 + 40) = result;
      break;
    case 4:
      *(void *)a2 = 0xBFF0000000000000;
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0x3FF0000000000000;
      *(double *)(a2 + 32) = result;
LABEL_6:
      *(void *)(a2 + 40) = 0;
      break;
    case 5:
      *(void *)(a2 + 8) = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)a2 = 0x3FF0000000000000;
      uint64_t result = -1.0;
      *(_OWORD *)(a2 + 24) = xmmword_234D614C0;
      *(double *)(a2 + 40) = a4;
      break;
    case 6:
      *(_OWORD *)a2 = xmmword_234D614B0;
      *(_OWORD *)(a2 + 16) = xmmword_234D614C0;
      *(double *)(a2 + 32) = a4;
      *(double *)(a2 + 40) = result;
      break;
    case 7:
      uint64_t result = 0.0;
      *(_OWORD *)a2 = xmmword_234D61130;
      *(void *)(a2 + 16) = 0x3FF0000000000000;
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 32) = 0;
      *(void *)(a2 + 40) = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (uint64_t)tintedImage
{
  return [a1 imageWithRenderingMode:2];
}

+ (uint64_t)imageWithColor:()Additions
{
  return [MEMORY[0x263F1C6B0] imageWithColor:1.0 andSize:1.0];
}

+ (id)imageWithColor:()Additions andSize:
{
  id v7 = a5;
  if (NSClassFromString(&cfstr_Uigraphicsimag.isa))
  {
    double v8 = [MEMORY[0x263F1C688] defaultFormat];
    id v9 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithBounds:format:", v8, 0.0, 0.0, a1, a2);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __45__UIImage_Additions__imageWithColor_andSize___block_invoke;
    v12[3] = &unk_264C0AB60;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    id v13 = v7;
    double v16 = a1;
    double v17 = a2;
    double v10 = [v9 imageWithActions:v12];
  }
  else
  {
    double v10 = 0;
  }

  return v10;
}

- (uint64_t)extendedRangeSafeDrawInRect:()Additions
{
  [a1 scale];
  *(float *)&double v11 = v10;
  return objc_msgSend(a1, "extendedRangeSafeDrawInRect:opaque:scale:", 0, a2, a3, a4, a5, v11);
}

- (id)extendedRangeSafeDrawInRect:()Additions opaque:scale:
{
  if (NSClassFromString(&cfstr_Uigraphicsimag.isa))
  {
    uint64_t v15 = [MEMORY[0x263F1C688] defaultFormat];
    [v15 setOpaque:a8];
    [v15 setScale:a6];
    if ([v15 preferredRange] == 1 && objc_msgSend(a1, "_isSRGB")) {
      [v15 setPreferredRange:2];
    }
    double v16 = objc_msgSend(objc_alloc(MEMORY[0x263F1C680]), "initWithBounds:format:", v15, a2, a3, a4, a5);
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __63__UIImage_Additions__extendedRangeSafeDrawInRect_opaque_scale___block_invoke;
    v19[3] = &unk_264C0AB60;
    v19[4] = a1;
    *(double *)&v19[5] = a2;
    *(double *)&v19[6] = a3;
    *(CGFloat *)&v19[7] = a4;
    *(CGFloat *)&v19[8] = a5;
    double v17 = [v16 imageWithActions:v19];
  }
  else
  {
    if (extendedRangeSafeDrawInRect_opaque_scale__onceToken != -1) {
      dispatch_once(&extendedRangeSafeDrawInRect_opaque_scale__onceToken, &__block_literal_global_11);
    }
    v21.CGFloat width = a4;
    v21.CGFloat height = a5;
    UIGraphicsBeginImageContextWithOptions(v21, a8, a6);
    objc_msgSend(a1, "drawInRect:", a2, a3, a4, a5);
    double v17 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
  }
  return v17;
}

- (BOOL)_isSRGB
{
  CGColorSpaceRef ColorSpace = CGImageGetColorSpace((CGImageRef)[a1 CGImage]);
  if (_isSRGB_onceToken != -1) {
    dispatch_once(&_isSRGB_onceToken, &__block_literal_global_19);
  }
  return CFEqual(ColorSpace, (CFTypeRef)_isSRGB_s_sRGB) != 0;
}

@end