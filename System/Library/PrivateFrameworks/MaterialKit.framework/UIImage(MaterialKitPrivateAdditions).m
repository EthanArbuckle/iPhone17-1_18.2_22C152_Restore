@interface UIImage(MaterialKitPrivateAdditions)
+ (id)mt_resizableShadowTemplateImageWithAttributes:()MaterialKitPrivateAdditions scale:maskCornerRadius:continuousCorners:maskSize:;
- (id)_mt_imageWithShadowWithAttributes:()MaterialKitPrivateAdditions userInterfaceStyle:;
- (id)mt_imageWithDefaultShadowAttributesForUserInterfaceStyle:()MaterialKitPrivateAdditions;
@end

@implementation UIImage(MaterialKitPrivateAdditions)

+ (id)mt_resizableShadowTemplateImageWithAttributes:()MaterialKitPrivateAdditions scale:maskCornerRadius:continuousCorners:maskSize:
{
  MTDimensionsForContinuousCornerRadiusInBounds();
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  MTResizableAreaForCornerDimensionsInBounds();
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%f.%f.%f.%f.%f.%f.%i.%f.%f.%f.%f", *(float *)a7, *((void *)a7 + 1), *((void *)a7 + 2), *((void *)a7 + 3), *(void *)&a1, *(void *)&a2, a8, v15, v17, v18, v19);
  v21 = +[MTMappedImageCache sharedCache];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  long long v22 = a7[1];
  long long v31 = *a7;
  v29[2] = __136__UIImage_MaterialKitPrivateAdditions__mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize___block_invoke;
  v29[3] = &unk_264256970;
  long long v32 = v22;
  double v33 = a1;
  double v34 = a2;
  char v37 = a8;
  double v35 = a3;
  double v36 = a4;
  id v30 = v20;
  id v23 = v20;
  v24 = [v21 imageForKey:v23 generatingIfNecessaryWithBlock:v29];

  v25 = [(id)mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize____keysToCapInsets objectForKeyedSubscript:v23];
  [v25 UIEdgeInsetsValue];
  v26 = objc_msgSend(v24, "resizableImageWithCapInsets:");
  v27 = [v26 imageWithRenderingMode:2];

  return v27;
}

- (id)_mt_imageWithShadowWithAttributes:()MaterialKitPrivateAdditions userInterfaceStyle:
{
  id v6 = a1;
  v8 = v6;
  if (*(float *)a3 > 0.0)
  {
    LODWORD(v7) = *(_DWORD *)a3;
    objc_msgSend(v6, "size", v7);
    double v10 = v9;
    double v12 = v11;
    double v13 = a3[2];
    if (v13 < a3[1]) {
      double v13 = a3[1];
    }
    if (v13 < 1.0) {
      double v13 = 1.0;
    }
    double v14 = v13 + a3[3] * 2.8;
    id v15 = objc_alloc(MEMORY[0x263F1C680]);
    uint64_t v16 = [MEMORY[0x263F1C688] preferredFormat];
    uint64_t v17 = objc_msgSend(v15, "initWithSize:format:", v16, v14 + v10 + v14, v14 + v12 + v14);

    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __93__UIImage_MaterialKitPrivateAdditions___mt_imageWithShadowWithAttributes_userInterfaceStyle___block_invoke;
    v21[3] = &unk_264256998;
    *(double *)&v21[5] = v14 + v10 + v14;
    *(double *)&v21[6] = v14 + v12 + v14;
    v21[4] = v8;
    *(double *)&v21[7] = v10;
    *(double *)&v21[8] = v12;
    *(double *)&v21[9] = v14;
    *(double *)&v21[10] = v14;
    *(double *)&v21[11] = v14;
    *(double *)&v21[12] = v14;
    v21[13] = a4;
    long long v18 = *((_OWORD *)a3 + 1);
    long long v22 = *(_OWORD *)a3;
    long long v23 = v18;
    uint64_t v19 = [v17 imageWithActions:v21];

    v8 = (void *)v19;
  }

  return v8;
}

- (id)mt_imageWithDefaultShadowAttributesForUserInterfaceStyle:()MaterialKitPrivateAdditions
{
  int v5 = 1050253722;
  long long v6 = xmmword_2156D2BD0;
  uint64_t v7 = 0x3FE3333333333333;
  v3 = objc_msgSend(a1, "_mt_imageWithShadowWithAttributes:userInterfaceStyle:", &v5, a3);

  return v3;
}

@end