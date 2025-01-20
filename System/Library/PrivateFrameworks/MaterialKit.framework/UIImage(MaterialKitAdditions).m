@interface UIImage(MaterialKitAdditions)
+ (id)mt_shadowTemplateImageWithAttributes:()MaterialKitAdditions scale:maskCornerRadius:continuousCorners:maskSize:resizableCapInsets:;
+ (uint64_t)mt_edgeOutsetsForShadowProperties:()MaterialKitAdditions scale:;
@end

@implementation UIImage(MaterialKitAdditions)

+ (uint64_t)mt_edgeOutsetsForShadowProperties:()MaterialKitAdditions scale:
{
  return MTEdgeOutsetsForCoreMaterialShadowProperties();
}

+ (id)mt_shadowTemplateImageWithAttributes:()MaterialKitAdditions scale:maskCornerRadius:continuousCorners:maskSize:resizableCapInsets:
{
  *(_OWORD *)v10 = *(_OWORD *)(a4 + 4);
  *(_DWORD *)&v10[16] = *(_DWORD *)(a4 + 20);
  LODWORD(v8) = *(_DWORD *)a4;
  uint64_t v9 = *(void *)(a4 + 24);
  v5 = (CGImage *)MTShadowImageCreateWithCoreMaterialShadowProperties();
  v6 = objc_msgSend(MEMORY[0x263F1C6B0], "imageWithCGImage:scale:orientation:", v5, 0, a1, v8, *(void *)&v10[4], *(void *)&v10[12], v9);
  CGImageRelease(v5);

  return v6;
}

@end