@interface UIVisualEffectView(MapKitTheming)
+ (id)photoSmallAttributionVisualEffectView;
@end

@implementation UIVisualEffectView(MapKitTheming)

+ (id)photoSmallAttributionVisualEffectView
{
  v12[2] = *MEMORY[0x1E4F143B8];
  if (MapKitIdiomIsMacCatalyst())
  {
    v0 = (void *)MEMORY[0x1E4F43020];
    v1 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.370000005];
    v2 = [v0 effectCompositingColor:v1];

    v3 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:15.0];
    id v4 = objc_alloc(MEMORY[0x1E4F43028]);
    v5 = (void *)MEMORY[0x1E4F43020];
    v12[0] = v2;
    v12[1] = v3;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    v7 = [v5 effectCombiningEffects:v6];
    v8 = (void *)[v4 initWithEffect:v7];
  }
  else
  {
    id v9 = objc_alloc(MEMORY[0x1E4F43028]);
    v10 = [MEMORY[0x1E4F427D8] effectWithStyle:2];
    v8 = (void *)[v9 initWithEffect:v10];
  }

  return v8;
}

@end