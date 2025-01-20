@interface UIImage(LPExtras)
+ (id)_lp_createImageWithCGImage:()LPExtras;
+ (id)_lp_systemImageNamed:()LPExtras;
- (BOOL)_lp_hasTransparency;
- (BOOL)_lp_isTemplate;
- (id)_lp_imageByApplyingSymbolConfiguration:()LPExtras;
- (id)_lp_imageForcingUserInterfaceStyle:()LPExtras;
- (uint64_t)_lp_CGImage;
@end

@implementation UIImage(LPExtras)

- (uint64_t)_lp_CGImage
{
  id v1 = a1;

  return [v1 CGImage];
}

+ (id)_lp_createImageWithCGImage:()LPExtras
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1818]) initWithCGImage:a3];

  return v3;
}

+ (id)_lp_systemImageNamed:()LPExtras
{
  v0 = objc_msgSend(MEMORY[0x1E4FB1818], "_systemImageNamed:");

  return v0;
}

- (id)_lp_imageByApplyingSymbolConfiguration:()LPExtras
{
  id v1 = objc_msgSend(a1, "imageByApplyingSymbolConfiguration:");

  return v1;
}

- (BOOL)_lp_hasTransparency
{
  id v1 = (void *)MEMORY[0x1F4188790](a1);
  v25[256] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(v1, "_lp_CGImage");
  if (!v2) {
    return 0;
  }
  v3 = (CGImage *)v2;
  if (!CGImageHasAlpha()) {
    return 0;
  }
  objc_msgSend(v1, "_lp_pixelSize");
  if (!sizeFitsWithinSize(v4, v5, 1024.0, 1024.0)) {
    return 0;
  }
  *((_DWORD *)&srcFormat.renderingIntent + 1) = 0;
  srcFormat.bitsPerComponent = CGImageGetBitsPerComponent(v3);
  srcFormat.uint64_t bitsPerPixel = CGImageGetBitsPerPixel(v3);
  srcFormat.colorSpace = CGImageGetColorSpace(v3);
  srcFormat.bitmapInfo = CGImageGetBitmapInfo(v3);
  srcFormat.version = 0;
  srcFormat.decode = CGImageGetDecode(v3);
  srcFormat.renderingIntent = CGImageGetRenderingIntent(v3);
  if (MEMORY[0x1A624C2B0](&srcs, &srcFormat, 0, v3, 0)) {
    return 0;
  }
  data = srcs.data;
  v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E4F1DC98]);
  *(void *)&destFormat.bitsPerComponent = 0x2000000008;
  destFormat.colorSpace = v9;
  destFormat.bitmapInfo = 3;
  memset(&destFormat.version, 0, 20);
  vImage_Buffer v17 = srcs;
  if (MEMORY[0x1A624C2C0](&srcFormat, &destFormat))
  {
    v10 = 0;
    goto LABEL_9;
  }
  v14 = vImageConverter_CreateWithCGImageFormat(&srcFormat, &destFormat, 0, 0, 0);
  BOOL v6 = (BOOL)v14;
  if (v14)
  {
    uint64_t bitsPerPixel = destFormat.bitsPerPixel;
    vImagePixelCount width = srcs.width;
    if (srcs.rowBytes == srcs.width * destFormat.bitsPerPixel)
    {
      if (!vImageConverter_MustOperateOutOfPlace(v14, 0, 0, 0))
      {
        v10 = 0;
        goto LABEL_23;
      }
      vImagePixelCount width = srcs.width;
      uint64_t bitsPerPixel = destFormat.bitsPerPixel;
    }
    if (MEMORY[0x1A624C2A0](&v17, srcs.height, width, bitsPerPixel, 0))
    {
      v10 = 0;
      goto LABEL_24;
    }
    v10 = v17.data;
LABEL_23:
    if (!vImageConvert_AnyToAny((const vImageConverterRef)v6, &srcs, &v17, 0, 0))
    {
      vImageConverter_Release((vImageConverterRef)v6);
LABEL_9:
      bzero(v25, 0x800uLL);
      bzero(v24, 0x800uLL);
      bzero(v23, 0x800uLL);
      bzero(v22, 0x800uLL);
      histogram[0] = v25;
      histogram[1] = (vImagePixelCount *)v24;
      histogram[2] = (vImagePixelCount *)v23;
      histogram[3] = (vImagePixelCount *)v22;
      if (!vImageHistogramCalculation_ARGB8888(&v17, histogram, 0))
      {
        uint64_t v11 = 0;
        do
        {
          uint64_t v12 = *(void *)&v22[v11];
          BOOL v6 = v12 != 0;
          if (v12) {
            break;
          }
          BOOL v13 = v11 == 2032;
          v11 += 8;
        }
        while (!v13);
LABEL_26:
        if (v10) {
          free(v10);
        }
        goto LABEL_28;
      }
LABEL_25:
      BOOL v6 = 0;
      goto LABEL_26;
    }
LABEL_24:
    vImageConverter_Release((vImageConverterRef)v6);
    goto LABEL_25;
  }
LABEL_28:
  if (data) {
    free(data);
  }
  return v6;
}

- (BOOL)_lp_isTemplate
{
  return [a1 renderingMode] == 2;
}

- (id)_lp_imageForcingUserInterfaceStyle:()LPExtras
{
  double v5 = [a1 imageAsset];

  if (v5)
  {
    BOOL v6 = [a1 imageAsset];
    if (a3 == 1) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = 1;
    }
    v8 = [MEMORY[0x1E4FB1E20] traitCollectionWithUserInterfaceStyle:v7];
    v9 = [v6 imageWithTraitCollection:v8];

    uint64_t v10 = objc_msgSend(v9, "_lp_CGImage");
    objc_msgSend(MEMORY[0x1E4FB1818], "_lp_createImageWithCGImage:", v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = a1;
  }

  return v11;
}

@end