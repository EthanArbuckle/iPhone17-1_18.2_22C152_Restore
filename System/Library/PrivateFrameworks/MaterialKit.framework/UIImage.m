@interface UIImage
@end

@implementation UIImage

id __136__UIImage_MaterialKitPrivateAdditions__mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize___block_invoke(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  double v2 = *(double *)(a1 + 72);
  double v3 = *(double *)(a1 + 80);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 104);
  long long v5 = *(_OWORD *)(a1 + 56);
  v12[0] = *(_OWORD *)(a1 + 40);
  v12[1] = v5;
  v6 = objc_msgSend(MEMORY[0x263F1C6B0], "mt_shadowTemplateImageWithAttributes:scale:maskCornerRadius:continuousCorners:maskSize:resizableCapInsets:", v12, v4, &v13, v2, v3, *(double *)(a1 + 88), *(double *)(a1 + 96));
  if (!mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize____keysToCapInsets)
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8 = (void *)mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize____keysToCapInsets;
    mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize____keysToCapInsets = (uint64_t)v7;
  }
  v11[0] = v13;
  v11[1] = v14;
  v9 = [MEMORY[0x263F08D40] valueWithBytes:v11 objCType:"{UIEdgeInsets=dddd}"];
  [(id)mt_resizableShadowTemplateImageWithAttributes_scale_maskCornerRadius_continuousCorners_maskSize____keysToCapInsets setObject:v9 forKeyedSubscript:*(void *)(a1 + 32)];

  return v6;
}

void __93__UIImage_MaterialKitPrivateAdditions___mt_imageWithShadowWithAttributes_userInterfaceStyle___block_invoke(uint64_t a1, void *a2)
{
  double v3 = (objc_class *)MEMORY[0x263F1CB60];
  id v4 = a2;
  id v5 = [v3 alloc];
  BSRectWithSize();
  id v15 = (id)objc_msgSend(v5, "initWithFrame:");
  v6 = (void *)[objc_alloc(MEMORY[0x263F1C6D0]) initWithImage:*(void *)(a1 + 32)];
  [v15 addSubview:v6];
  BSRectWithSize();
  objc_msgSend(v6, "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  id v7 = [v6 layer];
  v8 = [MEMORY[0x263F1C550] labelColor];
  v9 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:*(void *)(a1 + 104)];
  v10 = [v8 resolvedColorWithTraitCollection:v9];

  id v11 = v10;
  objc_msgSend(v7, "setShadowColor:", objc_msgSend(v11, "CGColor"));
  objc_msgSend(v7, "setShadowOffset:", *(double *)(a1 + 120), *(double *)(a1 + 128));
  [v7 setShadowRadius:*(double *)(a1 + 136)];
  LODWORD(v12) = *(_DWORD *)(a1 + 112);
  [v7 setShadowOpacity:v12];
  uint64_t v13 = [v4 CGContext];

  long long v14 = [v15 layer];
  [v14 renderInContext:v13];
}

@end