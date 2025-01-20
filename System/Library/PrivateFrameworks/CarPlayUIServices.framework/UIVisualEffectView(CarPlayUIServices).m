@interface UIVisualEffectView(CarPlayUIServices)
+ (id)crsui_clusterTurnCardETATrayBackgroundMaterial;
+ (id)crsui_consoleTurnCardETATrayBackgroundMaterial;
@end

@implementation UIVisualEffectView(CarPlayUIServices)

+ (id)crsui_consoleTurnCardETATrayBackgroundMaterial
{
  v0 = [MEMORY[0x263F1C480] effectWithBlurRadius:50.0];
  v1 = (void *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v0];
  v2 = [v1 layer];
  [v2 setMaskedCorners:15];

  uint64_t v3 = *MEMORY[0x263F15A20];
  v4 = [v1 layer];
  [v4 setCornerCurve:v3];

  v5 = [v1 layer];
  [v5 setMasksToBounds:1];

  return v1;
}

+ (id)crsui_clusterTurnCardETATrayBackgroundMaterial
{
  v0 = [MEMORY[0x263F1C480] effectWithStyle:8];
  v1 = (void *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v0];
  v2 = [v1 layer];
  [v2 setMaskedCorners:15];

  uint64_t v3 = *MEMORY[0x263F15A20];
  v4 = [v1 layer];
  [v4 setCornerCurve:v3];

  v5 = [v1 layer];
  [v5 setMasksToBounds:1];

  return v1;
}

@end