@interface CUIShapeEffectStack
+ (CGColor)newColorByAdjustingLightnessOfColor:(CGColor *)a3 darker:(BOOL)a4;
+ (id)adjustOpacity:(id)a3 by:(float)a4;
+ (id)bevelEmbossFrom:(id)a3 withSize:(unsigned int)a4 soften:(unsigned int)a5 angle:(float)a6 altitude:(float)a7 highlightRed:(float)a8 highlightGreen:(float)a9 highlightBlue:(float)a10 highlightOpacity:(float)a11 shadowRed:(float)a12 shadowGreen:(float)a13 shadowBlue:(float)a14 shadowOpacity:(float)a15 bevelStyle:(unsigned int)a16;
+ (id)blend:(id)a3 over:(id)a4 blendKind:(unsigned int)a5;
+ (id)blur:(id)a3 radius:(float)a4;
+ (id)colorWithGray:(float)a3 alpha:(float)a4;
+ (id)colorWithRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6;
+ (id)composite:(id)a3 atop:(id)a4;
+ (id)composite:(id)a3 into:(id)a4;
+ (id)composite:(id)a3 outOf:(id)a4;
+ (id)composite:(id)a3 over:(id)a4;
+ (id)gradientWithParameters:(id *)a3 inRect:(CGRect)a4;
+ (id)hueSaturationFrom:(id)a3 withCenterAngle:(double)a4 width:(double)a5 tintRed:(float)a6 tintGreen:(float)a7 tintBlue:(float)a8;
+ (id)image:(id)a3 withOpacity:(float)a4;
+ (id)imageFromBlendWithMask:(id)a3 foreground:(id)a4 background:(id)a5;
+ (id)innerGlowFrom:(id)a3 withRadius:(float)a4 red:(float)a5 green:(float)a6 blue:(float)a7 opacity:(float)a8;
+ (id)innerShadowFrom:(id)a3 withOffset:(CGPoint)a4 radius:(float)a5 red:(float)a6 green:(float)a7 blue:(float)a8 opacity:(float)a9;
+ (id)invert:(id)a3;
+ (id)offset:(id)a3 by:(CGPoint)a4;
+ (id)outerGlowFrom:(id)a3 withSize:(unsigned int)a4 spread:(unsigned int)a5 red:(float)a6 green:(float)a7 blue:(float)a8 opacity:(float)a9;
+ (id)outerShadowFrom:(id)a3 withOffset:(CGPoint)a4 size:(unsigned int)a5 spread:(unsigned int)a6 red:(float)a7 green:(float)a8 blue:(float)a9 opacity:(float)a10;
+ (id)pixelZoomed:(id)a3 scale:(int)a4 about:(CGPoint)a5;
+ (id)preferredCIContextOptions;
+ (id)rectangle:(CGRect)a3 withRed:(float)a4 green:(float)a5 blue:(float)a6 alpha:(float)a7;
+ (id)shadowFrom:(id)a3 red:(float)a4 green:(float)a5 blue:(float)a6 opacity:(float)a7;
+ (id)shapeEffectSingleBlurFrom:(id)a3 withInteriorFill:(id)a4 offset:(CGPoint)a5 blurSize:(float)a6 innerGlowRed:(float)a7 innerGlowGreen:(float)a8 innerGlowBlue:(float)a9 innerGlowOpacity:(float)a10 innerShadowRed:(float)a11 innerShadowGreen:(float)a12 innerShadowBlue:(float)a13 innerShadowOpacity:(float)a14 outerGlowRed:(float)a15 outerGlowGreen:(float)a16 outerGlowBlue:(float)a17 outerGlowOpacity:(float)a18 outerShadowRed:(float)a19 outerShadowGreen:(float)a20 outerShadowBlue:(float)a21 outerShadowOpacity:(float)a22 hasInsideShadowBlur:(BOOL)a23 hasOutsideShadowBlur:(BOOL)a24;
+ (id)sharedCIContext;
+ (id)unsharpMask:(id)a3 radius:(float)a4 intensity:(float)a5;
- ($01BB1521EC52D44A8E7628F5261DCEC8)effectInsetsWithScale:(double)a3;
- ($1DE4C1FD5A12EFAE99762DD70974AA56)engraveShadow;
- ($1DE4C1FD5A12EFAE99762DD70974AA56)extraShadow;
- ($45A57A840939F8DA3264B2B8C70AC12D)innerGradient;
- ($69725AE9E2C336799B3330C9F2B37222)hueSaturation;
- ($9A3F6720D51884C1BD061C340F5007EE)outerGlow;
- ($B9DFBB3EC52729005FFFDFFACDA0AF43)innerGlow;
- ($C07A9C4F79504F2E326AD5E2BA2D7579)innerShadow;
- ($E0EE018EFC1CA26785F52D94F92F8253)emboss;
- ($EB69DF3B1DDA5C6930A5C79FD1E30C08)colorOverlay;
- (BOOL)_precompositeColorOverlayInnerGradient;
- (BOOL)anyEffectAllowsTintSubstitution;
- (BOOL)expressableByColorFillCheckingOutputBlending:(BOOL)a3;
- (BOOL)hasBevelEmboss;
- (BOOL)hasColorOverlay;
- (BOOL)hasEffects;
- (BOOL)hasEngraveShadow;
- (BOOL)hasExtraShadow;
- (BOOL)hasHueSaturation;
- (BOOL)hasInnerGlow;
- (BOOL)hasInnerGradient;
- (BOOL)hasInnerShadow;
- (BOOL)hasOuterGlow;
- (CGColor)newColorByProcessingColor:(CGColor *)a3;
- (CGImage)_newFlattenedImageFromShapeCGImage:(CGImage *)a3 withScale:(double)a4 ciContext:(id)a5 blendOverImage:(BOOL)a6;
- (CGImage)newFlattenedImageFromCGImage:(CGImage *)a3 withScale:(double)a4 ciContext:(id)a5;
- (CGImage)newFlattenedImageFromShapeCGImage:(CGImage *)a3;
- (CGImage)newFlattenedImageFromShapeCGImage:(CGImage *)a3 withScale:(double)a4;
- (CGImage)newFlattenedImageFromShapeCGImage:(CGImage *)a3 withScale:(double)a4 cache:(BOOL)a5;
- (CGImage)newFlattenedImageFromShapeCGImage:(CGImage *)a3 withScale:(double)a4 ciContext:(id)a5;
- (CGRect)effectPaddingWithScale:(double)a3;
- (CUIShapeEffectStack)initWithEffectPreset:(id)a3;
- (float)colorOverlayOpacity;
- (float)innerGradientOpacity;
- (float)outputOpacity;
- (float)scalefactor;
- (float)shapeOpacity;
- (id)cacheKey;
- (id)compositeEffectStackWithShapeImage:(id)a3 withScale:(double)a4 blendOntoImage:(BOOL)a5;
- (id)effectPreset;
- (id)image:(id)a3 withAdjustedOpacity:(float)a4;
- (id)imageWithBevelEmbossOfImage:(id)a3 effect:(id *)a4;
- (id)imageWithColorOverlayOfImage:(id)a3 effect:(id *)a4;
- (id)imageWithEngraveShadowOfImage:(id)a3 effect:(id *)a4;
- (id)imageWithExtraShadowOfImage:(id)a3 effect:(id *)a4;
- (id)imageWithHueSaturationOfImage:(id)a3 effect:(id *)a4;
- (id)imageWithInnerGlowOfImage:(id)a3 effect:(id *)a4;
- (id)imageWithInnerShadowOfImage:(id)a3 effect:(id *)a4;
- (id)imageWithInteriorGradientFillOfImage:(id)a3 effect:(id *)a4;
- (id)imageWithOuterGlowOfImage:(id)a3 effect:(id *)a4;
- (id)imageWithSingleBlurShapeEffectOfImage:(id)a3 withInteriorFill:(id)a4;
- (id)optimizedSingleBlurEffectCompositeWithShapeImage:(id)a3;
- (id)processedImageFromImage:(id)a3;
- (id)processedImageFromImage:(id)a3 withScale:(double)a4;
- (id)processedImageFromShapeImage:(id)a3;
- (id)processedImageFromShapeImage:(id)a3 withScale:(double)a4;
- (id)processedImageFromShapeImage:(id)a3 withScale:(double)a4 invertShadows:(BOOL)a5;
- (id)processedImageFromShapePath:(CGPath *)a3 inRect:(CGRect)a4;
- (id)standardEffectCompositeWithShapeImage:(id)a3 blendOntoImage:(BOOL)a4;
- (int)cgBlendModeForOutputBlending;
- (int)renderStrategy;
- (unint64_t)bevelEmbossCount;
- (unint64_t)colorOverlayCount;
- (unint64_t)engraveShadowCount;
- (unint64_t)extraShadowCount;
- (unint64_t)hueSaturationCount;
- (unint64_t)innerGlowCount;
- (unint64_t)innerGradientCount;
- (unint64_t)innerShadowCount;
- (unint64_t)outerGlowCount;
- (unsigned)outputBlendMode;
- (void)_cleanupEffectSettings;
- (void)_normalizeEffectParameters;
- (void)_setBevelEmbossAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5;
- (void)_setColorFillAtIndex:(unint64_t)a3 FromPreset:(id)a4 index:(unsigned int)a5;
- (void)_setEngraveShadowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5;
- (void)_setExtraShadowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5;
- (void)_setHueSaturationAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5;
- (void)_setInnerGlowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5;
- (void)_setInnerShadowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5;
- (void)_setInteriorGradientAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5;
- (void)_setOuterGlowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5;
- (void)_setOutputOpacityFromPreset:(id)a3 atIndex:(unsigned int)a4;
- (void)_setShapeOpacityFromPreset:(id)a3 atIndex:(unsigned int)a4;
- (void)_updateRenderStrategyFromEffect:(unsigned int)a3;
- (void)adjustEffectColorsToTemperature:(int)a3 onlyTintableColors:(BOOL)a4;
- (void)applyCustomForegroundColor:(CGColor *)a3;
- (void)applyCustomForegroundColor:(CGColor *)a3 tintEffectColors:(BOOL)a4;
- (void)dealloc;
- (void)scaleBrightnessOfEffectColorsByAmount:(double)a3 onlyTintableColors:(BOOL)a4;
- (void)scaleEffectParametersBy:(double)a3;
- (void)setBypassColorFills:(BOOL)a3;
- (void)setColorOverlayCount:(unint64_t)a3;
- (void)setEngraveShadowCount:(unint64_t)a3;
- (void)setInnerGlowCount:(unint64_t)a3;
- (void)setInnerGradientCount:(unint64_t)a3;
- (void)setInnerShadowCount:(unint64_t)a3;
- (void)updateOutputBlendingWithInteriorFillHeuristic;
@end

@implementation CUIShapeEffectStack

- (void)dealloc
{
  [(CUIShapeEffectStack *)self _cleanupEffectSettings];
  v3.receiver = self;
  v3.super_class = (Class)CUIShapeEffectStack;
  [(CUIShapeEffectStack *)&v3 dealloc];
}

- (void)_cleanupEffectSettings
{
  self->_hueSaturationCount = 0;
  hueSaturation = self->_hueSaturation;
  if (hueSaturation)
  {
    free(hueSaturation);
    self->_hueSaturation = 0;
  }
  self->_colorOverlayCount = 0;
  colorOverlay = self->_colorOverlay;
  if (colorOverlay)
  {
    free(colorOverlay);
    self->_colorOverlay = 0;
  }
  self->_innerGradientCount = 0;
  innerGradient = self->_innerGradient;
  if (innerGradient)
  {
    free(innerGradient);
    self->_innerGradient = 0;
  }
  self->_innerGlowCount = 0;
  innerGlow = self->_innerGlow;
  if (innerGlow)
  {
    free(innerGlow);
    self->_innerGlow = 0;
  }
  self->_innerShadowCount = 0;
  innerShadow = self->_innerShadow;
  if (innerShadow)
  {
    free(innerShadow);
    self->_innerShadow = 0;
  }
  self->_outerGlowCount = 0;
  outerGlow = self->_outerGlow;
  if (outerGlow)
  {
    free(outerGlow);
    self->_outerGlow = 0;
  }
  self->_engraveShadowCount = 0;
  engraveShadow = self->_engraveShadow;
  if (engraveShadow)
  {
    free(engraveShadow);
    self->_engraveShadow = 0;
  }
  self->_extraShadowCount = 0;
  extraShadow = self->_extraShadow;
  if (extraShadow)
  {
    free(extraShadow);
    self->_extraShadow = 0;
  }
  self->_bevelEmbossCount = 0;
  emboss = self->_emboss;
  if (emboss)
  {
    free(emboss);
    self->_emboss = 0;
  }
}

+ (id)preferredCIContextOptions
{
  if (GetShapeEffectCIContextOptions_onceToken != -1) {
    dispatch_once(&GetShapeEffectCIContextOptions_onceToken, &__block_literal_global_19);
  }
  return (id)gCIContextOptions;
}

+ (id)sharedCIContext
{
  if (sharedCIContext_gCIContextLock != -1) {
    dispatch_once(&sharedCIContext_gCIContextLock, &__block_literal_global_7);
  }
  return (id)gSharedCIContext;
}

CIContext *__38__CUIShapeEffectStack_sharedCIContext__block_invoke()
{
  result = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", [(id)objc_opt_class() preferredCIContextOptions]);
  gSharedCIContext = (uint64_t)result;
  return result;
}

- (void)_setShapeOpacityFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  float v5 = COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:a4]);
  self->_shapeOpacity = v5;
}

- (void)_setOutputOpacityFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  float v5 = COERCE_DOUBLE([a3 valueForParameter:2 inEffectAtIndex:a4]);
  self->_outputOpacity = v5;
}

- (void)_setColorFillAtIndex:(unint64_t)a3 FromPreset:(id)a4 index:(unsigned int)a5
{
  if (self->_colorOverlayCount > a3)
  {
    colorOverlay = self->_colorOverlay;
    if (colorOverlay)
    {
      v7 = &colorOverlay[a3];
      uint64_t v8 = a5;
      v7->var0 = [a4 valueForParameter:7 inEffectAtIndex:a5];
      v9.i32[0] = [a4 valueForParameter:0 inEffectAtIndex:v8];
      v9.i32[1] = (unsigned __int32)v9.i32[0] >> 8;
      *(float32x2_t *)&v7->var1 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
      v7->var3 = (float)v9.u8[2] / 255.0;
      float v10 = COERCE_DOUBLE([a4 valueForParameter:2 inEffectAtIndex:v8]);
      v7->var4 = v10;
      v7->var5 = [a4 valueForParameter:10 inEffectAtIndex:v8] == 1;
    }
  }
}

- (BOOL)hasColorOverlay
{
  unint64_t colorOverlayCount = self->_colorOverlayCount;
  if (!colorOverlayCount) {
    return 0;
  }
  colorOverlay = self->_colorOverlay;
  if (colorOverlay->var4 > 0.01) {
    return 1;
  }
  p_var4 = &colorOverlay[1].var4;
  uint64_t v6 = 1;
  do
  {
    unint64_t v7 = v6;
    if (colorOverlayCount == v6) {
      break;
    }
    float v8 = *p_var4;
    p_var4 += 6;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < colorOverlayCount;
}

- (float)colorOverlayOpacity
{
  unint64_t colorOverlayCount = self->_colorOverlayCount;
  if (!colorOverlayCount) {
    return 0.0;
  }
  for (i = &self->_colorOverlay->var4; ; i += 6)
  {
    float result = *i;
    if (*i > 0.0) {
      break;
    }
    if (!--colorOverlayCount) {
      return 0.0;
    }
  }
  return result;
}

- (void)_setInteriorGradientAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  if (self->_innerGradientCount > a3)
  {
    innerGradient = self->_innerGradient;
    if (innerGradient)
    {
      unint64_t v7 = &innerGradient[a3];
      uint64_t v8 = a5;
      v7->var0 = [a4 valueForParameter:7 inEffectAtIndex:a5];
      v9.i32[0] = [a4 valueForParameter:0 inEffectAtIndex:v8];
      v9.i32[1] = (unsigned __int32)v9.i32[0] >> 8;
      float32x2_t v10 = (float32x2_t)vdup_n_s32(0x437F0000u);
      *(float32x2_t *)&v7->var1 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFF000000FFLL)), v10);
      v7->var3 = (float)v9.u8[2] / 255.0;
      v11.i32[0] = [a4 valueForParameter:1 inEffectAtIndex:v8];
      v11.i32[1] = (unsigned __int32)v11.i32[0] >> 8;
      *(float32x2_t *)&v7->var4 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v11, (int8x8_t)0xFF000000FFLL)), v10);
      v7->var6 = (float)v11.u8[2] / 255.0;
      double v12 = COERCE_DOUBLE([a4 valueForParameter:2 inEffectAtIndex:v8]);
      float v14 = 1.0;
      if (v12 != 0.0)
      {
        float v13 = v12;
        float v14 = v13;
      }
      v7->var7 = v14;
    }
  }
}

- (BOOL)hasInnerGradient
{
  unint64_t innerGradientCount = self->_innerGradientCount;
  if (!innerGradientCount) {
    return 0;
  }
  innerGradient = self->_innerGradient;
  if (innerGradient->var7 > 0.01) {
    return 1;
  }
  p_var7 = &innerGradient[1].var7;
  uint64_t v6 = 1;
  do
  {
    unint64_t v7 = v6;
    if (innerGradientCount == v6) {
      break;
    }
    float v8 = *p_var7;
    p_var7 += 8;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < innerGradientCount;
}

- (float)innerGradientOpacity
{
  unint64_t innerGradientCount = self->_innerGradientCount;
  if (!innerGradientCount) {
    return 0.0;
  }
  for (i = &self->_innerGradient->var7; ; i += 8)
  {
    float result = *i;
    if (*i > 0.0) {
      break;
    }
    if (!--innerGradientCount) {
      return 0.0;
    }
  }
  return result;
}

- (void)_setInnerGlowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  if (self->_innerGlowCount > a3)
  {
    innerGlow = self->_innerGlow;
    if (innerGlow)
    {
      unint64_t v7 = &innerGlow[a3];
      uint64_t v8 = a5;
      v7->var0 = [a4 valueForParameter:7 inEffectAtIndex:a5];
      v9.i32[0] = [a4 valueForParameter:0 inEffectAtIndex:v8];
      v9.i32[1] = (unsigned __int32)v9.i32[0] >> 8;
      *(float32x2_t *)&v7->var1 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
      v7->var3 = (float)v9.u8[2] / 255.0;
      float v10 = COERCE_DOUBLE([a4 valueForParameter:2 inEffectAtIndex:v8]);
      v7->var4 = v10;
      v7->var5 = (float)(unint64_t)[a4 valueForParameter:4 inEffectAtIndex:v8];
    }
  }
}

- (BOOL)hasInnerGlow
{
  unint64_t innerGlowCount = self->_innerGlowCount;
  if (!innerGlowCount) {
    return 0;
  }
  innerGlow = self->_innerGlow;
  if (innerGlow->var4 > 0.01) {
    return 1;
  }
  p_var4 = &innerGlow[1].var4;
  uint64_t v6 = 1;
  do
  {
    unint64_t v7 = v6;
    if (innerGlowCount == v6) {
      break;
    }
    float v8 = *p_var4;
    p_var4 += 6;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < innerGlowCount;
}

- (void)_setInnerShadowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  if (self->_innerShadowCount > a3)
  {
    innerShadow = self->_innerShadow;
    if (innerShadow)
    {
      float v8 = &innerShadow[a3];
      uint64_t v9 = a5;
      v8->var0 = [a4 valueForParameter:7 inEffectAtIndex:a5];
      v10.i32[0] = [a4 valueForParameter:0 inEffectAtIndex:v9];
      v10.i32[1] = (unsigned __int32)v10.i32[0] >> 8;
      *(float32x2_t *)&v8->var1 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v10, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
      v8->var3 = (float)v10.u8[2] / 255.0;
      float v11 = COERCE_DOUBLE([a4 valueForParameter:2 inEffectAtIndex:v9]);
      v8->var5 = v11;
      v8->var4 = (float)(unint64_t)[a4 valueForParameter:4 inEffectAtIndex:v9];
      v8->float var6 = (float)(unint64_t)[a4 valueForParameter:5 inEffectAtIndex:v9];
      float v12 = (double)(__int16)[a4 valueForParameter:6 inEffectAtIndex:v9] * 0.0174532925;
      __float2 v13 = __sincosf_stret(v12);
      float var6 = v8->var6;
      CGFloat v15 = (float)(var6 * v13.__cosval);
      v8->var8.x = v15;
      p_x = &v8->var8.x;
      *((float *)p_x - 1) = v12;
      double v17 = (float)(var6 * v13.__sinval);
      p_x[1] = v17;
      double v18 = rint(v15);
      if (vabdd_f64(v18, v15) < 0.001) {
        double *p_x = v18;
      }
      double v19 = rint(v17);
      if (vabdd_f64(v19, v17) < 0.001) {
        innerShadow[a3].var8.y = v19;
      }
    }
  }
}

- (BOOL)hasInnerShadow
{
  unint64_t innerShadowCount = self->_innerShadowCount;
  if (!innerShadowCount) {
    return 0;
  }
  innerShadow = self->_innerShadow;
  if (innerShadow->var5 > 0.01) {
    return 1;
  }
  p_var5 = &innerShadow[1].var5;
  uint64_t v6 = 1;
  do
  {
    unint64_t v7 = v6;
    if (innerShadowCount == v6) {
      break;
    }
    float v8 = *p_var5;
    p_var5 += 12;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < innerShadowCount;
}

- (void)_setOuterGlowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  if (self->_outerGlowCount > a3)
  {
    outerGlow = self->_outerGlow;
    if (outerGlow)
    {
      unint64_t v7 = (float32x2_t *)&outerGlow[a3];
      uint64_t v8 = a5;
      v9.i32[0] = [a4 valueForParameter:0 inEffectAtIndex:a5];
      v9.i32[1] = (unsigned __int32)v9.i32[0] >> 8;
      float32x2_t *v7 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
      v7[1].f32[0] = (float)v9.u8[2] / 255.0;
      float32_t v10 = COERCE_DOUBLE([a4 valueForParameter:2 inEffectAtIndex:v8]);
      v7[1].f32[1] = v10;
      v7[2].f32[0] = (float)(unint64_t)[a4 valueForParameter:4 inEffectAtIndex:v8];
      v7[2].f32[1] = (float)(unint64_t)[a4 valueForParameter:9 inEffectAtIndex:v8];
    }
  }
}

- (BOOL)hasOuterGlow
{
  unint64_t outerGlowCount = self->_outerGlowCount;
  if (!outerGlowCount) {
    return 0;
  }
  outerGlow = self->_outerGlow;
  if (outerGlow->var3 > 0.01) {
    return 1;
  }
  p_var3 = &outerGlow[1].var3;
  uint64_t v6 = 1;
  do
  {
    unint64_t v7 = v6;
    if (outerGlowCount == v6) {
      break;
    }
    float v8 = *p_var3;
    p_var3 += 6;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < outerGlowCount;
}

- (void)_setEngraveShadowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  if (self->_engraveShadowCount > a3)
  {
    engraveShadow = self->_engraveShadow;
    if (engraveShadow)
    {
      float v8 = &engraveShadow[a3];
      uint64_t v9 = a5;
      v10.i32[0] = [a4 valueForParameter:0 inEffectAtIndex:a5];
      v10.i32[1] = (unsigned __int32)v10.i32[0] >> 8;
      *(float32x2_t *)&v8->var0 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v10, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
      v8->var2 = (float)v10.u8[2] / 255.0;
      float v11 = COERCE_DOUBLE([a4 valueForParameter:2 inEffectAtIndex:v9]);
      v8->var3 = v11;
      v8->var4 = (float)(unint64_t)[a4 valueForParameter:4 inEffectAtIndex:v9];
      v8->var5 = (float)(unint64_t)[a4 valueForParameter:9 inEffectAtIndex:v9];
      v8->float var6 = (float)(unint64_t)[a4 valueForParameter:5 inEffectAtIndex:v9];
      float v12 = (double)(__int16)[a4 valueForParameter:6 inEffectAtIndex:v9] * 0.0174532925;
      __float2 v13 = __sincosf_stret(v12);
      float var6 = v8->var6;
      CGFloat v15 = (float)(var6 * v13.__cosval);
      v8->var8.x = v15;
      p_x = &v8->var8.x;
      *((float *)p_x - 1) = v12;
      double v17 = (float)(var6 * v13.__sinval);
      p_x[1] = v17;
      double v18 = rint(v15);
      if (vabdd_f64(v18, v15) < 0.001) {
        double *p_x = v18;
      }
      double v19 = rint(v17);
      if (vabdd_f64(v19, v17) < 0.001) {
        engraveShadow[a3].var8.y = v19;
      }
    }
  }
}

- (BOOL)hasEngraveShadow
{
  unint64_t engraveShadowCount = self->_engraveShadowCount;
  if (!engraveShadowCount) {
    return 0;
  }
  engraveShadow = self->_engraveShadow;
  if (engraveShadow->var3 > 0.01) {
    return 1;
  }
  p_var3 = &engraveShadow[1].var3;
  uint64_t v6 = 1;
  do
  {
    unint64_t v7 = v6;
    if (engraveShadowCount == v6) {
      break;
    }
    float v8 = *p_var3;
    p_var3 += 12;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < engraveShadowCount;
}

- (void)_setExtraShadowAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  if (self->_extraShadowCount > a3)
  {
    extraShadow = self->_extraShadow;
    if (extraShadow)
    {
      float v8 = &extraShadow[a3];
      uint64_t v9 = a5;
      v10.i32[0] = [a4 valueForParameter:0 inEffectAtIndex:a5];
      v10.i32[1] = (unsigned __int32)v10.i32[0] >> 8;
      *(float32x2_t *)&v8->var0 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v10, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
      v8->var2 = (float)v10.u8[2] / 255.0;
      float v11 = COERCE_DOUBLE([a4 valueForParameter:2 inEffectAtIndex:v9]);
      v8->var3 = v11;
      v8->var4 = (float)(unint64_t)[a4 valueForParameter:4 inEffectAtIndex:v9];
      v8->var5 = (float)(unint64_t)[a4 valueForParameter:9 inEffectAtIndex:v9];
      v8->float var6 = (float)(unint64_t)[a4 valueForParameter:5 inEffectAtIndex:v9];
      float v12 = (double)(__int16)[a4 valueForParameter:6 inEffectAtIndex:v9] * 0.0174532925;
      __float2 v13 = __sincosf_stret(v12);
      float var6 = v8->var6;
      CGFloat v15 = (float)(var6 * v13.__cosval);
      v8->var8.x = v15;
      p_x = &v8->var8.x;
      *((float *)p_x - 1) = v12;
      double v17 = (float)(var6 * v13.__sinval);
      p_x[1] = v17;
      double v18 = rint(v15);
      if (vabdd_f64(v18, v15) < 0.001) {
        double *p_x = v18;
      }
      double v19 = rint(v17);
      if (vabdd_f64(v19, v17) < 0.001) {
        extraShadow[a3].var8.y = v19;
      }
    }
  }
}

- (BOOL)hasExtraShadow
{
  unint64_t extraShadowCount = self->_extraShadowCount;
  if (!extraShadowCount) {
    return 0;
  }
  extraShadow = self->_extraShadow;
  if (extraShadow->var3 > 0.01) {
    return 1;
  }
  p_var3 = &extraShadow[1].var3;
  uint64_t v6 = 1;
  do
  {
    unint64_t v7 = v6;
    if (extraShadowCount == v6) {
      break;
    }
    float v8 = *p_var3;
    p_var3 += 12;
    ++v6;
  }
  while (v8 <= 0.01);
  return v7 < extraShadowCount;
}

- (void)_setBevelEmbossAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  if (self->_bevelEmbossCount > a3)
  {
    emboss = self->_emboss;
    if (emboss)
    {
      unint64_t v7 = (float32x2_t *)&emboss[a3];
      uint64_t v8 = a5;
      v7->f32[0] = (float)(unint64_t)[a4 valueForParameter:4 inEffectAtIndex:a5];
      v7->f32[1] = (float)(unint64_t)[a4 valueForParameter:8 inEffectAtIndex:v8];
      v7[1] = (float32x2_t)0x41F0000042B40000;
      v9.i32[0] = [a4 valueForParameter:0 inEffectAtIndex:v8];
      v9.i32[1] = (unsigned __int32)v9.i32[0] >> 8;
      float32x2_t v10 = (float32x2_t)vdup_n_s32(0x437F0000u);
      v7[2] = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFF000000FFLL)), v10);
      v7[3].f32[0] = (float)v9.u8[2] / 255.0;
      float32_t v11 = COERCE_DOUBLE([a4 valueForParameter:2 inEffectAtIndex:v8]);
      v7[3].f32[1] = v11;
      v12.i32[0] = [a4 valueForParameter:1 inEffectAtIndex:v8];
      v12.i32[1] = (unsigned __int32)v12.i32[0] >> 8;
      v7[4] = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v12, (int8x8_t)0xFF000000FFLL)), v10);
      v7[5].f32[0] = (float)v12.u8[2] / 255.0;
      float32_t v13 = COERCE_DOUBLE([a4 valueForParameter:3 inEffectAtIndex:v8]);
      v7[5].f32[1] = v13;
      v7[6].i32[0] = [a4 valueForParameter:11 inEffectAtIndex:v8];
    }
  }
}

- (BOOL)hasBevelEmboss
{
  return self->_bevelEmbossCount != 0;
}

- (BOOL)hasEffects
{
  if ([(CUIShapeEffectStack *)self hasHueSaturation]
    || !self->_bypassColorFills
    && ([(CUIShapeEffectStack *)self hasColorOverlay]
     || [(CUIShapeEffectStack *)self hasInnerGradient])
    || [(CUIShapeEffectStack *)self hasInnerGlow]
    || [(CUIShapeEffectStack *)self hasInnerShadow]
    || [(CUIShapeEffectStack *)self hasOuterGlow]
    || [(CUIShapeEffectStack *)self hasEngraveShadow]
    || [(CUIShapeEffectStack *)self hasExtraShadow])
  {
    return 1;
  }
  return [(CUIShapeEffectStack *)self hasBevelEmboss];
}

- (void)_setHueSaturationAtIndex:(unint64_t)a3 fromPreset:(id)a4 index:(unsigned int)a5
{
  uint64_t v6 = (float32x2_t *)&self->_hueSaturation[a3];
  uint64_t v7 = a5;
  float32_t v8 = (double)(__int16)[a4 valueForParameter:6 inEffectAtIndex:a5] * 0.0174532925;
  v6->f32[0] = v8;
  float32_t v9 = (double)(__int16)[a4 valueForParameter:5 inEffectAtIndex:v7] * 0.0174532925;
  v6->f32[1] = v9;
  v10.i32[0] = [a4 valueForParameter:0 inEffectAtIndex:v7];
  v10.i32[1] = (unsigned __int32)v10.i32[0] >> 8;
  v6[1] = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v10, (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
  v6[2].f32[0] = (float)v10.u8[2] / 255.0;
  v6[2].i8[4] = [a4 valueForParameter:10 inEffectAtIndex:v7] == 1;
}

- (BOOL)hasHueSaturation
{
  return self->_hueSaturationCount != 0;
}

- (BOOL)_precompositeColorOverlayInnerGradient
{
  return 0;
}

- (void)_updateRenderStrategyFromEffect:(unsigned int)a3
{
  if (self->_renderStrategy == 1) {
    return;
  }
  if ((int)a3 <= 1215653202)
  {
    if ((int)a3 <= 1164796530)
    {
      if (a3 != 1131375730)
      {
        int v4 = 1148350320;
LABEL_17:
        if (a3 != v4) {
          return;
        }
        goto LABEL_18;
      }
    }
    else
    {
      if (a3 == 1164796531 || a3 == 1180787813) {
        goto LABEL_92;
      }
      if (a3 != 1198678372) {
        return;
      }
    }
    [(CUIShapeEffectStack *)self _precompositeColorOverlayInnerGradient];
    unint64_t colorOverlayCount = self->_colorOverlayCount;
    if (!colorOverlayCount) {
      return;
    }
    colorOverlay = self->_colorOverlay;
    while (1)
    {
      unsigned int var0 = colorOverlay->var0;
      ++colorOverlay;
      unsigned int v11 = var0;
      if (var0 != 1852797549 && v11 != 0) {
        break;
      }
      if (!--colorOverlayCount) {
        return;
      }
    }
    goto LABEL_92;
  }
  if ((int)a3 <= 1766288502)
  {
    if (a3 != 1215653203 && a3 != 1397715043)
    {
      int v4 = 1484026465;
      goto LABEL_17;
    }
LABEL_92:
    self->_renderStrategy = 1;
    return;
  }
  if (a3 != 1766288503 && a3 != 1768837992)
  {
    int v4 = 1866951799;
    goto LABEL_17;
  }
LABEL_18:
  unint64_t innerGlowCount = self->_innerGlowCount;
  if (innerGlowCount)
  {
    unsigned int v6 = 0;
    p_var5 = &self->_innerGlow->var5;
    do
    {
      float v8 = *p_var5;
      p_var5 += 6;
      if (v8 > 0.0) {
        ++v6;
      }
      --innerGlowCount;
    }
    while (innerGlowCount);
  }
  else
  {
    unsigned int v6 = 0;
  }
  unint64_t outerGlowCount = self->_outerGlowCount;
  if (outerGlowCount)
  {
    CGFloat v15 = &self->_outerGlow->var5;
    double v16 = 0.0;
    float v17 = 0.0;
    do
    {
      if (*(v15 - 1) > 0.0) {
        ++v6;
      }
      float v18 = *v15;
      v15 += 6;
      float v19 = v18;
      if (v18 > 0.0) {
        float v17 = v17 + 1.0;
      }
      if (v19 > *(float *)&v16 && v19 > 0.0) {
        *(float *)&double v16 = v19;
      }
      --outerGlowCount;
    }
    while (outerGlowCount);
  }
  else
  {
    float v17 = 0.0;
    double v16 = 0.0;
  }
  unint64_t innerShadowCount = self->_innerShadowCount;
  if (innerShadowCount)
  {
    p_var4 = &self->_innerShadow->var4;
    do
    {
      float v23 = *p_var4;
      p_var4 += 12;
      if (v23 > 0.0) {
        ++v6;
      }
      --innerShadowCount;
    }
    while (innerShadowCount);
  }
  unint64_t engraveShadowCount = self->_engraveShadowCount;
  if (engraveShadowCount)
  {
    v25 = &self->_engraveShadow->var5;
    do
    {
      if (*(v25 - 1) > 0.0) {
        ++v6;
      }
      float v26 = *v25;
      v25 += 12;
      float v27 = v26;
      if (v26 > 0.0) {
        float v17 = v17 + 1.0;
      }
      if (v27 > *(float *)&v16 && v27 > 0.0) {
        *(float *)&double v16 = v27;
      }
      --engraveShadowCount;
    }
    while (engraveShadowCount);
  }
  unint64_t bevelEmbossCount = self->_bevelEmbossCount;
  if (bevelEmbossCount)
  {
    emboss = self->_emboss;
    do
    {
      float v31 = emboss->var0;
      ++emboss;
      if (v31 > 0.0) {
        ++v6;
      }
      --bevelEmbossCount;
    }
    while (bevelEmbossCount);
  }
  unint64_t extraShadowCount = self->_extraShadowCount;
  if (extraShadowCount)
  {
    v33 = &self->_extraShadow->var5;
    do
    {
      if (*(v33 - 1) > 0.0) {
        ++v6;
      }
      float v34 = *v33;
      v33 += 12;
      float v35 = v34;
      if (v34 > 0.0) {
        float v17 = v17 + 1.0;
      }
      if (v35 > *(float *)&v16 && v35 > 0.0) {
        *(float *)&double v16 = v35;
      }
      --extraShadowCount;
    }
    while (extraShadowCount);
  }
  if (v6 > 1) {
    goto LABEL_92;
  }
  if (v17 > 0.0 || *(float *)&v16 > 0.0) {
    self->_renderStrategy = 1;
  }
  if ([(CUIShapeEffectStack *)self hasEngraveShadow]
    && [(CUIShapeEffectStack *)self hasInnerShadow]
    || [(CUIShapeEffectStack *)self hasEngraveShadow]
    && [(CUIShapeEffectStack *)self hasExtraShadow]
    || [(CUIShapeEffectStack *)self hasInnerShadow]
    && [(CUIShapeEffectStack *)self hasExtraShadow])
  {
    goto LABEL_92;
  }
  unint64_t v37 = self->_innerGlowCount;
  if (v37)
  {
    innerGlow = self->_innerGlow;
    do
    {
      unsigned int v40 = innerGlow->var0;
      ++innerGlow;
      unsigned int v39 = v40;
      if (v40 != 1852797549 && v39 != 0) {
        goto LABEL_92;
      }
    }
    while (--v37);
  }
  unint64_t v42 = self->_innerShadowCount;
  if (v42)
  {
    innerShadow = self->_innerShadow;
    while (1)
    {
      unsigned int v45 = innerShadow->var0;
      ++innerShadow;
      unsigned int v44 = v45;
      if (v45 != 1852797549 && v44 != 0) {
        break;
      }
      if (!--v42) {
        return;
      }
    }
    goto LABEL_92;
  }
}

- (CUIShapeEffectStack)initWithEffectPreset:(id)a3
{
  v42.receiver = self;
  v42.super_class = (Class)CUIShapeEffectStack;
  int v4 = [(CUIShapeEffectStack *)&v42 init];
  if (v4)
  {
    [a3 effectScale];
    *(float *)&double v5 = v5;
    v4->_scalefactor = *(float *)&v5;
    __asm { FMOV            V0.2S, #1.0 }
    *(void *)&v4->_shapeOpacity = _D0;
    v4->_renderStrategy = 2;
    id v11 = [a3 effectCount];
    [(CUIShapeEffectStack *)v4 _cleanupEffectSettings];
    if (v11)
    {
      uint64_t v12 = 0;
      unsigned int v13 = 1;
      do
      {
        int v14 = [a3 effectTypeAtIndex:v12];
        if (v14 <= 1215653202)
        {
          if (v14 > 1164796530)
          {
            p_size_t bevelEmbossCount = &v4->_bevelEmbossCount;
            if (v14 == 1164796531) {
              goto LABEL_17;
            }
            p_size_t bevelEmbossCount = &v4->_innerGradientCount;
            int v16 = 1198678372;
          }
          else
          {
            p_size_t bevelEmbossCount = &v4->_colorOverlayCount;
            if (v14 == 1131375730) {
              goto LABEL_17;
            }
            p_size_t bevelEmbossCount = &v4->_engraveShadowCount;
            int v16 = 1148350320;
          }
        }
        else if (v14 <= 1766288502)
        {
          if (v14 == 1215653203)
          {
            p_size_t bevelEmbossCount = &v4->_hueSaturationCount;
LABEL_17:
            ++*p_bevelEmbossCount;
            goto LABEL_18;
          }
          p_size_t bevelEmbossCount = &v4->_extraShadowCount;
          int v16 = 1484026465;
        }
        else
        {
          p_size_t bevelEmbossCount = &v4->_innerGlowCount;
          if (v14 == 1766288503) {
            goto LABEL_17;
          }
          p_size_t bevelEmbossCount = &v4->_innerShadowCount;
          if (v14 == 1768837992) {
            goto LABEL_17;
          }
          p_size_t bevelEmbossCount = &v4->_outerGlowCount;
          int v16 = 1866951799;
        }
        if (v14 == v16) {
          goto LABEL_17;
        }
LABEL_18:
        uint64_t v12 = v13;
        BOOL v17 = (unint64_t)v11 > v13++;
      }
      while (v17);
    }
    size_t colorOverlayCount = v4->_colorOverlayCount;
    if (colorOverlayCount) {
      v4->_colorOverlay = ($EB69DF3B1DDA5C6930A5C79FD1E30C08 *)malloc_type_calloc(colorOverlayCount, 0x18uLL, 0x10000402C707793uLL);
    }
    size_t innerGradientCount = v4->_innerGradientCount;
    if (innerGradientCount) {
      v4->_innerGradient = ($45A57A840939F8DA3264B2B8C70AC12D *)malloc_type_calloc(innerGradientCount, 0x20uLL, 0x1000040E0EAB150uLL);
    }
    size_t innerGlowCount = v4->_innerGlowCount;
    if (innerGlowCount) {
      v4->_innerGlow = ($B9DFBB3EC52729005FFFDFFACDA0AF43 *)malloc_type_calloc(innerGlowCount, 0x18uLL, 0x1000040504FFAC1uLL);
    }
    size_t innerShadowCount = v4->_innerShadowCount;
    if (innerShadowCount) {
      v4->_innerShadow = ($C07A9C4F79504F2E326AD5E2BA2D7579 *)malloc_type_calloc(innerShadowCount, 0x30uLL, 0x1000040EED21634uLL);
    }
    size_t outerGlowCount = v4->_outerGlowCount;
    if (outerGlowCount) {
      v4->_outerGlow = ($9A3F6720D51884C1BD061C340F5007EE *)malloc_type_calloc(outerGlowCount, 0x18uLL, 0x1000040504FFAC1uLL);
    }
    size_t engraveShadowCount = v4->_engraveShadowCount;
    if (engraveShadowCount) {
      v4->_engraveShadow = ($1DE4C1FD5A12EFAE99762DD70974AA56 *)malloc_type_calloc(engraveShadowCount, 0x30uLL, 0x1000040EED21634uLL);
    }
    size_t bevelEmbossCount = v4->_bevelEmbossCount;
    if (bevelEmbossCount) {
      v4->_emboss = ($E0EE018EFC1CA26785F52D94F92F8253 *)malloc_type_calloc(bevelEmbossCount, 0x34uLL, 0x10000403884A0CCuLL);
    }
    size_t extraShadowCount = v4->_extraShadowCount;
    if (extraShadowCount) {
      v4->_extraShadow = ($1DE4C1FD5A12EFAE99762DD70974AA56 *)malloc_type_calloc(extraShadowCount, 0x30uLL, 0x1000040EED21634uLL);
    }
    size_t hueSaturationCount = v4->_hueSaturationCount;
    if (hueSaturationCount) {
      v4->_hueSaturation = ($69725AE9E2C336799B3330C9F2B37222 *)malloc_type_calloc(hueSaturationCount, 0x18uLL, 0x100004020B92A0BuLL);
    }
    if (v11)
    {
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      uint64_t v33 = 0;
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      unsigned int v29 = 1;
      while (1)
      {
        id v30 = objc_msgSend(a3, "effectTypeAtIndex:", v27, v33);
        id v31 = v30;
        if ((int)v30 <= 1215653202)
        {
          if ((int)v30 <= 1164796530)
          {
            if (v30 == 1131375730)
            {
              -[CUIShapeEffectStack _setColorFillAtIndex:FromPreset:index:](v4, "_setColorFillAtIndex:FromPreset:index:");
              ++v41;
            }
            else if (v30 == 1148350320)
            {
              -[CUIShapeEffectStack _setEngraveShadowAtIndex:fromPreset:index:](v4, "_setEngraveShadowAtIndex:fromPreset:index:");
              ++v36;
            }
          }
          else
          {
            switch(v30)
            {
              case 0x456D6273:
                -[CUIShapeEffectStack _setBevelEmbossAtIndex:fromPreset:index:](v4, "_setBevelEmbossAtIndex:fromPreset:index:");
                ++v35;
                break;
              case 0x46616465:
                [(CUIShapeEffectStack *)v4 _setOutputOpacityFromPreset:a3 atIndex:v29 - 1];
                break;
              case 0x47726164:
                -[CUIShapeEffectStack _setInteriorGradientAtIndex:fromPreset:index:](v4, "_setInteriorGradientAtIndex:fromPreset:index:");
                ++v40;
                break;
            }
          }
          goto LABEL_66;
        }
        if ((int)v30 > 1766288502)
        {
          switch(v30)
          {
            case 0x69476C77:
              -[CUIShapeEffectStack _setInnerGlowAtIndex:fromPreset:index:](v4, "_setInnerGlowAtIndex:fromPreset:index:");
              ++v39;
              break;
            case 0x696E5368:
              -[CUIShapeEffectStack _setInnerShadowAtIndex:fromPreset:index:](v4, "_setInnerShadowAtIndex:fromPreset:index:");
              ++v38;
              break;
            case 0x6F476C77:
              -[CUIShapeEffectStack _setOuterGlowAtIndex:fromPreset:index:](v4, "_setOuterGlowAtIndex:fromPreset:index:");
              ++v37;
              break;
          }
          goto LABEL_66;
        }
        if (v30 == 1215653203) {
          break;
        }
        if (v30 == 1397715043)
        {
          [(CUIShapeEffectStack *)v4 _setShapeOpacityFromPreset:a3 atIndex:v29 - 1];
          goto LABEL_66;
        }
        if (v30 != 1484026465) {
          goto LABEL_66;
        }
        -[CUIShapeEffectStack _setExtraShadowAtIndex:fromPreset:index:](v4, "_setExtraShadowAtIndex:fromPreset:index:");
        -[CUIShapeEffectStack _updateRenderStrategyFromEffect:](v4, "_updateRenderStrategyFromEffect:", v31, v34 + 1);
LABEL_67:
        uint64_t v27 = v29;
        BOOL v17 = (unint64_t)v11 > v29++;
        if (!v17) {
          return v4;
        }
      }
      [(CUIShapeEffectStack *)v4 _setHueSaturationAtIndex:v28++ fromPreset:a3 index:v29 - 1];
LABEL_66:
      -[CUIShapeEffectStack _updateRenderStrategyFromEffect:](v4, "_updateRenderStrategyFromEffect:", v31, v34);
      goto LABEL_67;
    }
  }
  return v4;
}

- (id)effectPreset
{
  objc_super v3 = objc_alloc_init(CUIShapeEffectPreset);
  int8x8_t v10 = v3;
  float shapeOpacity = self->_shapeOpacity;
  if (shapeOpacity < 1.0) {
    [(CUIShapeEffectPreset *)v3 addShapeOpacityWithOpacity:shapeOpacity];
  }
  if (self->_outputOpacity < 1.0) {
    [(CUIShapeEffectPreset *)v10 addOutputOpacityWithOpacity:self->_shapeOpacity];
  }
  if (self->_innerGradientCount)
  {
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    do
    {
      int v14 = &self->_innerGradient[v12];
      LODWORD(v4) = vcvtms_u32_f32(v14->var1 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v14->var2 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v14->var3 * 255.0);
      LODWORD(v7) = vcvtms_u32_f32(v14->var4 * 255.0);
      LODWORD(v8) = vcvtms_u32_f32(v14->var5 * 255.0);
      LODWORD(v9) = vcvtms_u32_f32(v14->var6 * 255.0);
      LODWORD(v40) = v14->var0;
      [(CUIShapeEffectPreset *)v10 addGradientFillWithTopColorRed:v4 green:v5 blue:v6 bottomColorRed:v7 green:v8 blue:v9 opacity:v14->var7 blendMode:v40];
      ++v13;
      ++v12;
    }
    while (v13 < self->_innerGradientCount);
  }
  if (self->_colorOverlayCount)
  {
    uint64_t v15 = 0;
    unint64_t v16 = 0;
    do
    {
      BOOL v17 = &self->_colorOverlay[v15];
      LODWORD(v4) = vcvtms_u32_f32(v17->var1 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v17->var2 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v17->var3 * 255.0);
      [(CUIShapeEffectPreset *)v10 addColorFillWithRed:v4 green:v5 blue:v6 opacity:v17->var0 blendMode:v17->var5 tintable:v17->var4];
      ++v16;
      ++v15;
    }
    while (v16 < self->_colorOverlayCount);
  }
  if (self->_hueSaturationCount)
  {
    uint64_t v18 = 0;
    unint64_t v19 = 0;
    do
    {
      v20 = &self->_hueSaturation[v18];
      LODWORD(v4) = vcvtms_u32_f32(v20->var2 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v20->var3 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v20->var4 * 255.0);
      [(CUIShapeEffectPreset *)v10 addHueSaturationWithColorRed:v4 green:v5 blue:v6 angle:(int)rint(v20->var0 * 57.2957795) width:rint(v20->var1 * 57.2957795) tintable:v20->var5];
      ++v19;
      ++v18;
    }
    while (v19 < self->_hueSaturationCount);
  }
  if (self->_innerGlowCount)
  {
    uint64_t v21 = 0;
    unint64_t v22 = 0;
    do
    {
      float v23 = &self->_innerGlow[v21];
      LODWORD(v4) = vcvtms_u32_f32(v23->var1 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v23->var2 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v23->var3 * 255.0);
      [(CUIShapeEffectPreset *)v10 addInnerGlowWithColorRed:v4 green:v5 blue:v6 opacity:v23->var5 blur:v23->var0 blendMode:v23->var4];
      ++v22;
      ++v21;
    }
    while (v22 < self->_innerGlowCount);
  }
  if (self->_innerShadowCount)
  {
    uint64_t v24 = 0;
    unint64_t v25 = 0;
    do
    {
      float v26 = &self->_innerShadow[v24];
      LODWORD(v4) = vcvtms_u32_f32(v26->var1 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v26->var2 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v26->var3 * 255.0);
      LODWORD(v40) = v26->var0;
      [(CUIShapeEffectPreset *)v10 addInnerShadowWithColorRed:v4 green:v5 blue:v6 opacity:v26->var4 blur:v26->var6 offset:(int)rint(v26->var7 * 57.2957795) angle:v26->var5 blendMode:v40];
      ++v25;
      ++v24;
    }
    while (v25 < self->_innerShadowCount);
  }
  if (self->_outerGlowCount)
  {
    uint64_t v27 = 0;
    unint64_t v28 = 0;
    do
    {
      unsigned int v29 = &self->_outerGlow[v27];
      LODWORD(v4) = vcvtms_u32_f32(v29->var0 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v29->var1 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v29->var2 * 255.0);
      [(CUIShapeEffectPreset *)v10 addOuterGlowWithColorRed:v4 green:v5 blue:v6 opacity:v29->var4 blur:v29->var5 spread:v29->var3];
      ++v28;
      ++v27;
    }
    while (v28 < self->_outerGlowCount);
  }
  if (self->_engraveShadowCount)
  {
    uint64_t v30 = 0;
    unint64_t v31 = 0;
    do
    {
      v32 = &self->_engraveShadow[v30];
      LODWORD(v4) = vcvtms_u32_f32(v32->var0 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v32->var1 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v32->var2 * 255.0);
      LODWORD(v40) = (int)rint(v32->var7 * 57.2957795);
      [(CUIShapeEffectPreset *)v10 addDropShadowWithColorRed:v4 green:v5 blue:v6 opacity:v32->var4 blur:v32->var5 spread:v32->var6 offset:v32->var3 angle:v40];
      ++v31;
      ++v30;
    }
    while (v31 < self->_engraveShadowCount);
  }
  if (self->_bevelEmbossCount)
  {
    uint64_t v33 = 0;
    unint64_t v34 = 0;
    do
    {
      uint64_t v35 = &self->_emboss[v33];
      LODWORD(v4) = vcvtms_u32_f32(v35->var4 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v35->var5 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v35->var6 * 255.0);
      LODWORD(v7) = vcvtms_u32_f32(v35->var8 * 255.0);
      LODWORD(v8) = vcvtms_u32_f32(v35->var9 * 255.0);
      LODWORD(v9) = vcvtms_u32_f32(v35->var10 * 255.0);
      HIDWORD(v41) = v35->var1;
      LODWORD(v42) = v35->var12;
      LODWORD(v41) = v35->var0;
      -[CUIShapeEffectPreset addBevelEmbossWithHighlightColorRed:green:blue:opacity:shadowColorRed:green:blue:opacity:blur:soften:bevelStyle:](v10, "addBevelEmbossWithHighlightColorRed:green:blue:opacity:shadowColorRed:green:blue:opacity:blur:soften:bevelStyle:", v4, v5, v6, v7, v8, v9, v35->var7, v35->var11, v41, v42);
      ++v34;
      ++v33;
    }
    while (v34 < self->_bevelEmbossCount);
  }
  if (self->_extraShadowCount)
  {
    uint64_t v36 = 0;
    unint64_t v37 = 0;
    do
    {
      uint64_t v38 = &self->_extraShadow[v36];
      LODWORD(v4) = vcvtms_u32_f32(v38->var0 * 255.0);
      LODWORD(v5) = vcvtms_u32_f32(v38->var1 * 255.0);
      LODWORD(v6) = vcvtms_u32_f32(v38->var2 * 255.0);
      LODWORD(v40) = (int)rint(v38->var7 * 57.2957795);
      [(CUIShapeEffectPreset *)v10 addExtraShadowWithColorRed:v4 green:v5 blue:v6 opacity:v38->var4 blur:v38->var5 spread:v38->var6 offset:v38->var3 angle:v40];
      ++v37;
      ++v36;
    }
    while (v37 < self->_extraShadowCount);
  }
  return v10;
}

+ (id)offset:(id)a3 by:(CGPoint)a4
{
  CGAffineTransformMakeTranslation(&v6, a4.x, a4.y);
  return [a3 imageByApplyingTransform:&v6];
}

+ (id)adjustOpacity:(id)a3 by:(float)a4
{
  CGAffineTransform v6 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CUIScaleClampFilter", @"inputImage", a3, @"inputScale", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), 0);
  if (!v6)
  {
    *(float *)&double v7 = a4;
    CGAffineTransform v6 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CUIScaleClampFilterLocal", @"inputImage", a3, @"inputScale", +[NSNumber numberWithFloat:v7], 0);
    if (!v6) {
      return a3;
    }
  }
  return [(CIFilter *)v6 valueForKey:@"outputImage"];
}

+ (id)pixelZoomed:(id)a3 scale:(int)a4 about:(CGPoint)a5
{
  uint64_t v5 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CIPixelZoom", @"inputImage", a3, @"inputScale", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", *(void *)&a4), @"inputSourceCenter", +[CIVector vectorWithX:Y:](CIVector, "vectorWithX:Y:", a5.x, a5.y), @"inputDestCenter", +[CIVector vectorWithX:a5.x Y:a5.y], 0);
  return [(CIFilter *)v5 valueForKey:@"outputImage"];
}

+ (id)unsharpMask:(id)a3 radius:(float)a4 intensity:(float)a5
{
  double v7 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  *(float *)&double v8 = a5;
  uint64_t v9 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CIUnsharpMask", @"inputImage", a3, @"inputRadius", v7, @"inputIntensity", +[NSNumber numberWithFloat:v8], 0);
  return [(CIFilter *)v9 valueForKey:@"outputImage"];
}

+ (id)composite:(id)a3 over:(id)a4
{
  uint64_t v4 = +[CIFilter filterWithName:@"CISourceOverCompositing", @"inputImage", a3, @"inputBackgroundImage", a4, 0 keysAndValues];
  return [(CIFilter *)v4 valueForKey:@"outputImage"];
}

+ (id)composite:(id)a3 into:(id)a4
{
  uint64_t v4 = +[CIFilter filterWithName:@"CISourceInCompositing", @"inputImage", a3, @"inputBackgroundImage", a4, 0 keysAndValues];
  return [(CIFilter *)v4 valueForKey:@"outputImage"];
}

+ (id)composite:(id)a3 outOf:(id)a4
{
  uint64_t v4 = +[CIFilter filterWithName:@"CISourceOutCompositing", @"inputImage", a3, @"inputBackgroundImage", a4, 0 keysAndValues];
  return [(CIFilter *)v4 valueForKey:@"outputImage"];
}

+ (id)composite:(id)a3 atop:(id)a4
{
  uint64_t v4 = +[CIFilter filterWithName:@"CISourceAtopCompositing", @"inputImage", a3, @"inputBackgroundImage", a4, 0 keysAndValues];
  return [(CIFilter *)v4 valueForKey:@"outputImage"];
}

+ (id)blend:(id)a3 over:(id)a4 blendKind:(unsigned int)a5
{
  if (a3)
  {
    if (a4)
    {
      int8x8_t v10 = 0;
      if ((int)a5 > 1749838195)
      {
        if ((int)a5 <= 1852797548)
        {
          if ((int)a5 > 1818391149)
          {
            if ((int)a5 > 1818850404)
            {
              switch(a5)
              {
                case 0x6C697465u:
                  int8x8_t v10 = @"CILightenBlendMode";
                  break;
                case 0x6C756D20u:
                  int8x8_t v10 = @"CILuminosityBlendMode";
                  break;
                case 0x6D756C20u:
                  int8x8_t v10 = @"CIMultiplyBlendMode";
                  break;
              }
              goto LABEL_67;
            }
            if (a5 == 1818391150)
            {
              int8x8_t v10 = @"CILinearBurnBlendMode";
              goto LABEL_67;
            }
            if (a5 == 1818518631)
            {
              int8x8_t v10 = @"CILinearDodgeBlendMode";
              goto LABEL_67;
            }
            int v11 = 1818706796;
            goto LABEL_50;
          }
          if ((int)a5 > 1752524063)
          {
            switch(a5)
            {
              case 0x68756520u:
                int8x8_t v10 = @"CIHueBlendMode";
                break;
              case 0x69646976u:
                int8x8_t v10 = @"CIColorBurnBlendMode";
                break;
              case 0x6C4C6974u:
                int8x8_t v10 = @"CILinearLightBlendMode";
                break;
            }
            goto LABEL_67;
          }
          int v14 = 1749838196;
          uint64_t v15 = @"CIHardLightBlendMode";
          BOOL v16 = a5 == 1749903736;
          BOOL v17 = @"CIHardMixBlendMode";
LABEL_53:
          if (!v16) {
            BOOL v17 = 0;
          }
          if (a5 == v14) {
            int8x8_t v10 = v15;
          }
          else {
            int8x8_t v10 = v17;
          }
          goto LABEL_67;
        }
        if ((int)a5 > 1935766559)
        {
          if ((int)a5 <= 1984719219)
          {
            switch(a5)
            {
              case 0x73617420u:
                int8x8_t v10 = @"CISaturationBlendMode";
                break;
              case 0x7363726Eu:
                int8x8_t v10 = @"CIScreenBlendMode";
                break;
              case 0x736D7564u:
                int8x8_t v10 = @"CIExclusionBlendMode";
                break;
            }
            goto LABEL_67;
          }
          if (a5 == 1984719220)
          {
            int8x8_t v10 = @"CIVividLightBlendMode";
            goto LABEL_67;
          }
          if (a5 == 1986227573 || a5 == 1986229103) {
            goto LABEL_66;
          }
LABEL_67:
          v20 = +[CIFilter filterWithName:v10, @"inputImage", a3, @"inputBackgroundImage", a4, 0 keysAndValues];
          return [(CIFilter *)v20 valueForKey:@"outputImage"];
        }
        if ((int)a5 > 1884055923)
        {
          if (a5 == 1884055924)
          {
            int8x8_t v10 = @"CIPinLightBlendMode";
            goto LABEL_67;
          }
          if (a5 != 1885434739)
          {
            if (a5 == 1934387572) {
              int8x8_t v10 = @"CISoftLightBlendMode";
            }
            goto LABEL_67;
          }
          goto LABEL_65;
        }
        if (a5 == 1852797549)
        {
LABEL_66:
          int8x8_t v10 = @"CISourceOverCompositing";
          goto LABEL_67;
        }
        BOOL v18 = a5 == 1870030194;
        unint64_t v19 = @"CIOverlayBlendMode";
LABEL_62:
        if (v18) {
          int8x8_t v10 = v19;
        }
        else {
          int8x8_t v10 = 0;
        }
        goto LABEL_67;
      }
      if ((int)a5 <= 1668246641)
      {
        switch(a5)
        {
          case 0u:
            goto LABEL_66;
          case 0x10u:
          case 0x11u:
          case 0x15u:
          case 0x16u:
          case 0x17u:
          case 0x18u:
          case 0x19u:
            goto LABEL_65;
          case 0x12u:
            int8x8_t v10 = @"CISourceInCompositing";
            break;
          case 0x13u:
            int8x8_t v10 = @"CISourceOutCompositing";
            break;
          case 0x14u:
            int8x8_t v10 = @"CISourceAtopCompositing";
            break;
          case 0x1Au:
            int8x8_t v10 = @"CIPlusDarkerCompositing";
            break;
          case 0x1Bu:
            int8x8_t v10 = @"CIAdditionCompositing";
            break;
          default:
            goto LABEL_67;
        }
        goto LABEL_67;
      }
      if ((int)a5 > 1684633119)
      {
        if ((int)a5 > 1717856629)
        {
          if (a5 == 1717856630)
          {
LABEL_65:
            _CUILog(4, (uint64_t)"CUIShapeEffectStack: Unsupported blend mode %d encountered. Using SourceOver instead.", 0, (uint64_t)a4, *(uint64_t *)&a5, v5, v6, v7, *(uint64_t *)&a5);
            goto LABEL_66;
          }
          BOOL v18 = a5 == 1718842722;
          unint64_t v19 = @"CISubtractBlendMode";
          goto LABEL_62;
        }
        if (a5 == 1684633120)
        {
          int8x8_t v10 = @"CIColorDodgeBlendMode";
          goto LABEL_67;
        }
        int v11 = 1684751212;
      }
      else
      {
        if ((int)a5 <= 1684629093)
        {
          int v14 = 1668246642;
          uint64_t v15 = @"CIColorBlendMode";
          BOOL v16 = a5 == 1684107883;
          BOOL v17 = @"CIDarkenBlendMode";
          goto LABEL_53;
        }
        if (a5 == 1684629094)
        {
          int8x8_t v10 = @"CIDifferenceBlendMode";
          goto LABEL_67;
        }
        int v11 = 1684632435;
      }
LABEL_50:
      if (a5 != v11) {
        goto LABEL_67;
      }
      goto LABEL_65;
    }
    id v12 = a3;
  }
  else
  {
    id v12 = a4;
  }
  return v12;
}

+ (id)image:(id)a3 withOpacity:(float)a4
{
  uint64_t v4 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CIOpacity", @"inputImage", a3, @"inputOpacity", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), 0);
  return [(CIFilter *)v4 valueForKey:@"outputImage"];
}

+ (id)invert:(id)a3
{
  objc_super v3 = +[CIFilter filterWithName:@"CIColorInvert", @"inputImage", a3, 0 keysAndValues];
  return [(CIFilter *)v3 valueForKey:@"outputImage"];
}

+ (id)blur:(id)a3 radius:(float)a4
{
  uint64_t v4 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CIGaussianBlur", @"inputImage", a3, @"inputRadius", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:"), 0);
  return [(CIFilter *)v4 valueForKey:@"outputImage"];
}

+ (id)colorWithGray:(float)a3 alpha:(float)a4
{
  uint64_t v4 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CIConstantColorGenerator", @"inputColor", +[CIColor colorWithSRGBRed:a3 green:a3 blue:a3 alpha:a4], 0);
  return [(CIFilter *)v4 valueForKey:@"outputImage"];
}

+ (id)colorWithRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  uint64_t v6 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CIConstantColorGenerator", @"inputColor", +[CIColor colorWithSRGBRed:a3 green:a4 blue:a5 alpha:a6], 0);
  return [(CIFilter *)v6 valueForKey:@"outputImage"];
}

+ (id)rectangle:(CGRect)a3 withRed:(float)a4 green:(float)a5 blue:(float)a6 alpha:(float)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int v11 = +[CIColor colorWithSRGBRed:a4 green:a5 blue:a6 alpha:a7];
  id v12 = +[CIVector vectorWithX:x Y:y Z:width W:height];
  LODWORD(v13) = 1.0;
  int v14 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CIRectangleGenerator", @"inputColor", v11, @"inputRectangle", v12, @"inputEdgeBlur", +[NSNumber numberWithFloat:v13], 0);
  return [(CIFilter *)v14 valueForKey:@"outputImage"];
}

+ (id)gradientWithParameters:(id *)a3 inRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MaxY = CGRectGetMaxY(a4);
  v13.origin.CGFloat x = x;
  v13.origin.CGFloat y = y;
  v13.size.CGFloat width = width;
  v13.size.CGFloat height = height;
  int8x8_t v10 = +[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", @"CILinearGradient", @"inputColor0", +[CIColor colorWithSRGBRed:green:blue:alpha:](CIColor, "colorWithSRGBRed:green:blue:alpha:", a3->var1, a3->var2, a3->var3, a3->var7), @"inputColor1", +[CIColor colorWithSRGBRed:a3->var4 green:a3->var5 blue:a3->var6 alpha:a3->var7],
          @"inputPoint0",
          +[CIVector vectorWithX:0.0 Y:MaxY],
          @"inputPoint1",
          +[CIVector vectorWithX:0.0 Y:CGRectGetMinY(v13)],
          0);
  return [(CIFilter *)v10 valueForKey:@"outputImage"];
}

+ (id)shadowFrom:(id)a3 red:(float)a4 green:(float)a5 blue:(float)a6 opacity:(float)a7
{
  id v12 = +[CIFilter filterWithName:@"CIMakeShadowMask"];
  [(CIFilter *)v12 setValue:a3 forKey:@"inputImage"];
  [(CIFilter *)v12 setValue:+[CIColor colorWithSRGBRed:a4 green:a5 blue:a6 alpha:1.0] forKey:@"inputColor"];
  *(float *)&double v13 = a7;
  [(CIFilter *)v12 setValue:+[NSNumber numberWithFloat:v13] forKey:@"inputOpacity"];
  return [(CIFilter *)v12 valueForKey:@"outputImage"];
}

+ (id)imageFromBlendWithMask:(id)a3 foreground:(id)a4 background:(id)a5
{
  double v8 = +[CIFilter filterWithName:@"CIBlendWithAlphaMask"];
  [(CIFilter *)v8 setValue:a3 forKey:@"inputMaskImage"];
  [(CIFilter *)v8 setValue:a4 forKey:@"inputImage"];
  [(CIFilter *)v8 setValue:a5 forKey:@"inputBackgroundImage"];
  return [(CIFilter *)v8 valueForKey:@"outputImage"];
}

+ (id)innerGlowFrom:(id)a3 withRadius:(float)a4 red:(float)a5 green:(float)a6 blue:(float)a7 opacity:(float)a8
{
  int v14 = +[CIFilter filterWithName:@"CUIInnerGlowOrShadowFilter"];
  if (!v14)
  {
    int v14 = +[CIFilter filterWithName:@"CUIInnerGlowOrShadowFilterLocal"];
    if (!v14) {
      return a3;
    }
  }
  [(CIFilter *)v14 setValue:a3 forKey:@"inputImage"];
  *(float *)&double v15 = a4;
  [(CIFilter *)v14 setValue:+[NSNumber numberWithFloat:v15] forKey:@"inputRadius"];
  LODWORD(v16) = 0.5;
  [(CIFilter *)v14 setValue:+[NSNumber numberWithFloat:v16] forKey:@"inputRange"];
  [(CIFilter *)v14 setValue:+[CIColor colorWithSRGBRed:a5 green:a6 blue:a7 alpha:a8] forKey:@"inputColor"];
  return [(CIFilter *)v14 valueForKey:@"outputImage"];
}

+ (id)innerShadowFrom:(id)a3 withOffset:(CGPoint)a4 radius:(float)a5 red:(float)a6 green:(float)a7 blue:(float)a8 opacity:(float)a9
{
  double y = a4.y;
  double x = a4.x;
  BOOL v17 = +[CIFilter filterWithName:@"CUIInnerGlowOrShadowFilter"];
  LODWORD(v18) = 1.0;
  [(CIFilter *)v17 setValue:+[NSNumber numberWithFloat:v18] forKey:@"inputRange"];
  if (!v17)
  {
    BOOL v17 = +[CIFilter filterWithName:@"CUIInnerGlowOrShadowFilterLocal"];
    LODWORD(v19) = 1.0;
    [(CIFilter *)v17 setValue:+[NSNumber numberWithFloat:v19] forKey:@"inputRange"];
    if (!v17) {
      return a3;
    }
  }
  [(CIFilter *)v17 setValue:a3 forKey:@"inputImage"];
  [(CIFilter *)v17 setValue:+[CIVector vectorWithX:x Y:y] forKey:@"inputOffset"];
  *(float *)&double v20 = a5;
  [(CIFilter *)v17 setValue:+[NSNumber numberWithFloat:v20] forKey:@"inputRadius"];
  [(CIFilter *)v17 setValue:+[CIColor colorWithSRGBRed:a6 green:a7 blue:a8 alpha:a9] forKey:@"inputColor"];
  return [(CIFilter *)v17 valueForKey:@"outputImage"];
}

+ (id)outerGlowFrom:(id)a3 withSize:(unsigned int)a4 spread:(unsigned int)a5 red:(float)a6 green:(float)a7 blue:(float)a8 opacity:(float)a9
{
  uint64_t v13 = *(void *)&a5;
  uint64_t v14 = *(void *)&a4;
  double v16 = +[CIFilter filterWithName:@"CUIOuterGlowOrShadowFilter"];
  if (!v16)
  {
    double v16 = +[CIFilter filterWithName:@"CUIOuterGlowOrShadowFilterLocal"];
    if (!v16) {
      return a3;
    }
  }
  if ([(NSDictionary *)[(CIFilter *)v16 attributes] valueForKey:@"inputSpread"])
  {
    [(CIFilter *)v16 setValue:+[NSNumber numberWithUnsignedInt:v14] forKey:@"inputSize"];
    double v18 = +[NSNumber numberWithUnsignedInt:v13];
    double v19 = @"inputSpread";
  }
  else
  {
    *(float *)&double v17 = (float)v14 / 2.853;
    double v18 = +[NSNumber numberWithFloat:v17];
    double v19 = @"inputRadius";
  }
  [(CIFilter *)v16 setValue:v18 forKey:v19];
  [(CIFilter *)v16 setValue:a3 forKey:@"inputImage"];
  LODWORD(v20) = 0.5;
  [(CIFilter *)v16 setValue:+[NSNumber numberWithFloat:v20] forKey:@"inputRange"];
  [(CIFilter *)v16 setValue:+[CIColor colorWithSRGBRed:a6 green:a7 blue:a8 alpha:a9] forKey:@"inputColor"];
  return [(CIFilter *)v16 valueForKey:@"outputImage"];
}

+ (id)outerShadowFrom:(id)a3 withOffset:(CGPoint)a4 size:(unsigned int)a5 spread:(unsigned int)a6 red:(float)a7 green:(float)a8 blue:(float)a9 opacity:(float)a10
{
  uint64_t v14 = *(void *)&a6;
  uint64_t v15 = *(void *)&a5;
  double y = a4.y;
  double x = a4.x;
  double v19 = +[CIFilter filterWithName:@"CUIOuterGlowOrShadowFilter"];
  if (!v19)
  {
    double v19 = +[CIFilter filterWithName:@"CUIOuterGlowOrShadowFilterLocal"];
    if (!v19) {
      return a3;
    }
  }
  LODWORD(v20) = 1.0;
  [(CIFilter *)v19 setValue:+[NSNumber numberWithFloat:v20] forKey:@"inputRange"];
  if ([(NSDictionary *)[(CIFilter *)v19 attributes] valueForKey:@"inputSpread"])
  {
    [(CIFilter *)v19 setValue:+[NSNumber numberWithUnsignedInt:v15] forKey:@"inputSize"];
    unint64_t v22 = +[NSNumber numberWithUnsignedInt:v14];
    float v23 = @"inputSpread";
  }
  else
  {
    *(float *)&double v21 = (float)v15 / 2.853;
    unint64_t v22 = +[NSNumber numberWithFloat:v21];
    float v23 = @"inputRadius";
  }
  [(CIFilter *)v19 setValue:v22 forKey:v23];
  [(CIFilter *)v19 setValue:a3 forKey:@"inputImage"];
  [(CIFilter *)v19 setValue:+[CIVector vectorWithX:x Y:y] forKey:@"inputOffset"];
  [(CIFilter *)v19 setValue:+[CIColor colorWithSRGBRed:a7 green:a8 blue:a9 alpha:a10] forKey:@"inputColor"];
  return [(CIFilter *)v19 valueForKey:@"outputImage"];
}

+ (id)bevelEmbossFrom:(id)a3 withSize:(unsigned int)a4 soften:(unsigned int)a5 angle:(float)a6 altitude:(float)a7 highlightRed:(float)a8 highlightGreen:(float)a9 highlightBlue:(float)a10 highlightOpacity:(float)a11 shadowRed:(float)a12 shadowGreen:(float)a13 shadowBlue:(float)a14 shadowOpacity:(float)a15 bevelStyle:(unsigned int)a16
{
  uint64_t v26 = *(void *)&a5;
  uint64_t v27 = *(void *)&a4;
  switch(a16)
  {
    case 0u:
      float v37 = a15;
      unint64_t v28 = +[CIFilter filterWithName:@"CUIOuterBevelEmbossFilter"];
      if (v28) {
        goto LABEL_8;
      }
      unsigned int v29 = @"CUIOuterBevelEmbossFilterLocal";
      goto LABEL_7;
    case 1u:
      float v37 = a15;
      unint64_t v28 = +[CIFilter filterWithName:@"CUIInnerBevelEmbossFilter"];
      if (!v28)
      {
        unsigned int v29 = @"CUIInnerBevelEmbossFilterLocal";
LABEL_7:
        unint64_t v28 = +[CIFilter filterWithName:v29];
        if (!v28) {
          goto LABEL_14;
        }
      }
LABEL_8:
      [(CIFilter *)v28 setValue:a3 forKey:@"inputImage"];
      if ([(NSDictionary *)[(CIFilter *)v28 attributes] valueForKey:@"inputSize"])
      {
        [(CIFilter *)v28 setValue:+[NSNumber numberWithUnsignedInt:v27] forKey:@"inputSize"];
        v32 = +[NSNumber numberWithUnsignedInt:v26];
      }
      else
      {
        *(float *)&double v31 = (float)v27 / 2.853;
        [(CIFilter *)v28 setValue:+[NSNumber numberWithFloat:v31] forKey:@"inputRadius"];
        *(float *)&double v34 = (float)v26 / 2.853;
        v32 = +[NSNumber numberWithFloat:v34];
      }
      [(CIFilter *)v28 setValue:v32 forKey:@"inputSoften"];
      *(float *)&double v35 = a6;
      [(CIFilter *)v28 setValue:+[NSNumber numberWithFloat:v35] forKey:@"inputAngle"];
      [(CIFilter *)v28 setValue:+[CIColor colorWithSRGBRed:a8 green:a9 blue:a10 alpha:a11] forKey:@"inputHighlightColor"];
      [(CIFilter *)v28 setValue:+[CIColor colorWithSRGBRed:a12 green:a13 blue:a14 alpha:v37] forKey:@"inputShadowColor"];
      id result = [(CIFilter *)v28 valueForKey:@"outputImage"];
      break;
    case 2u:
      uint64_t v30 = "Emboss bevel style isn't yet implemented";
      goto LABEL_13;
    case 3u:
      uint64_t v30 = "Pillow emboss bevel style isn't yet implemented";
      goto LABEL_13;
    case 4u:
      uint64_t v30 = "Stroke emboss bevel style isn't yet implemented";
      goto LABEL_13;
    default:
      uint64_t v30 = "unrecognized bevel style";
LABEL_13:
      _CUILog(4, (uint64_t)v30, (uint64_t)a3, *(uint64_t *)&a4, *(uint64_t *)&a5, *(uint64_t *)&a16, v16, v17, v36);
LABEL_14:
      id result = a3;
      break;
  }
  return result;
}

+ (id)hueSaturationFrom:(id)a3 withCenterAngle:(double)a4 width:(double)a5 tintRed:(float)a6 tintGreen:(float)a7 tintBlue:(float)a8
{
  uint64_t v14 = +[CIFilter filterWithName:@"CUIHueSaturationFilter"];
  if (!v14)
  {
    uint64_t v14 = +[CIFilter filterWithName:@"CUIHueSaturationFilterLocal"];
    if (!v14) {
      return a3;
    }
  }
  [(CIFilter *)v14 setValue:a3 forKey:@"inputImage"];
  [(CIFilter *)v14 setValue:+[CIColor colorWithSRGBRed:a6 green:a7 blue:a8] forKey:@"inputTintColor"];
  [(CIFilter *)v14 setValue:+[NSNumber numberWithDouble:a4] forKey:@"inputCenterAngle"];
  [(CIFilter *)v14 setValue:+[NSNumber numberWithDouble:a5] forKey:@"inputAngleWidth"];
  return [(CIFilter *)v14 valueForKey:@"outputImage"];
}

+ (id)shapeEffectSingleBlurFrom:(id)a3 withInteriorFill:(id)a4 offset:(CGPoint)a5 blurSize:(float)a6 innerGlowRed:(float)a7 innerGlowGreen:(float)a8 innerGlowBlue:(float)a9 innerGlowOpacity:(float)a10 innerShadowRed:(float)a11 innerShadowGreen:(float)a12 innerShadowBlue:(float)a13 innerShadowOpacity:(float)a14 outerGlowRed:(float)a15 outerGlowGreen:(float)a16 outerGlowBlue:(float)a17 outerGlowOpacity:(float)a18 outerShadowRed:(float)a19 outerShadowGreen:(float)a20 outerShadowBlue:(float)a21 outerShadowOpacity:(float)a22 hasInsideShadowBlur:(BOOL)a23 hasOutsideShadowBlur:(BOOL)a24
{
  BOOL v24 = a24;
  BOOL v25 = a23;
  double y = a5.y;
  double x = a5.x;
  double v35 = +[CIFilter filterWithName:@"CUIShapeEffectBlur1"];
  if (!v35)
  {
    double v35 = +[CIFilter filterWithName:@"CUIShapeEffectBlur1Local"];
    if (!v35) {
      return a3;
    }
  }
  [(CIFilter *)v35 setValue:a3 forKey:@"inputImage"];
  [(CIFilter *)v35 setValue:a4 forKey:@"inputFill"];
  [(CIFilter *)v35 setValue:+[CIVector vectorWithX:x Y:y] forKey:@"inputOffset"];
  *(float *)&double v36 = a6;
  [(CIFilter *)v35 setValue:+[NSNumber numberWithFloat:v36] forKey:@"inputRadius"];
  [(CIFilter *)v35 setValue:+[CIColor colorWithSRGBRed:a7 green:a8 blue:a9 alpha:a10] forKey:@"inputGlowColorInner"];
  [(CIFilter *)v35 setValue:+[CIColor colorWithSRGBRed:a15 green:a16 blue:a17 alpha:a18] forKey:@"inputGlowColorOuter"];
  [(CIFilter *)v35 setValue:+[CIColor colorWithSRGBRed:a19 green:a20 blue:a21 alpha:a22] forKey:@"inputShadowColorOuter"];
  [(CIFilter *)v35 setValue:+[CIColor colorWithSRGBRed:a11 green:a12 blue:a13 alpha:a14] forKey:@"inputShadowColorInner"];
  [(CIFilter *)v35 setValue:+[NSNumber numberWithBool:v25] forKey:@"inputShadowBlurInner"];
  [(CIFilter *)v35 setValue:+[NSNumber numberWithBool:v24] forKey:@"inputShadowBlurOuter"];
  return [(CIFilter *)v35 valueForKey:@"outputImage"];
}

- (id)imageWithSingleBlurShapeEffectOfImage:(id)a3 withInteriorFill:(id)a4
{
  BOOL v7 = [(CUIShapeEffectStack *)self hasInnerShadow];
  if ([(CUIShapeEffectStack *)self hasEngraveShadow])
  {
    uint64_t v8 = 128;
LABEL_5:
    uint64_t v15 = *(float **)((char *)&self->super.isa + v8);
    float v10 = *v15;
    unsigned int v11 = *((_DWORD *)v15 + 1);
    unsigned int v12 = *((_DWORD *)v15 + 2);
    int v13 = *((_DWORD *)v15 + 3);
    float v14 = v15[4];
    float v57 = v15[6];
    goto LABEL_6;
  }
  unsigned int v9 = [(CUIShapeEffectStack *)self hasExtraShadow];
  float v10 = 0.0;
  unsigned int v11 = 0;
  unsigned int v12 = 0;
  int v13 = 0;
  float v14 = 0.0;
  float v57 = 0.0;
  if (v9)
  {
    uint64_t v8 = 144;
    goto LABEL_5;
  }
LABEL_6:
  unsigned int v54 = v12;
  unsigned int v55 = v11;
  unsigned int v56 = LODWORD(v10);
  BOOL v16 = ([(CUIShapeEffectStack *)self hasEngraveShadow]
      || [(CUIShapeEffectStack *)self hasExtraShadow])
     && v14 > 0.0;
  unsigned int v17 = [(CUIShapeEffectStack *)self hasInnerGlow];
  float var1 = 0.0;
  float var2 = 0.0;
  float var3 = 0.0;
  float var4 = 0.0;
  float var5 = 0.0;
  if (v17)
  {
    innerGlow = self->_innerGlow;
    float var1 = innerGlow->var1;
    float var2 = innerGlow->var2;
    float var3 = innerGlow->var3;
    float var4 = innerGlow->var4;
    float var5 = innerGlow->var5;
  }
  float v48 = var4;
  float v49 = var3;
  float v50 = var2;
  float v51 = var1;
  int v53 = v13;
  if ([(CUIShapeEffectStack *)self hasInnerShadow])
  {
    innerShadow = self->_innerShadow;
    float v52 = innerShadow->var1;
    float v25 = innerShadow->var4;
    float v46 = innerShadow->var3;
    float v47 = innerShadow->var2;
    float v45 = innerShadow->var5;
    double y = innerShadow->var8.y;
  }
  else
  {
    float v52 = 0.0;
    double y = NSZeroPoint.y;
    float v46 = 0.0;
    float v47 = 0.0;
    float v25 = 0.0;
    float v45 = 0.0;
  }
  unsigned int v27 = [(CUIShapeEffectStack *)self hasOuterGlow];
  double v34 = 0.0;
  float v35 = 0.0;
  float v36 = 0.0;
  float v37 = 0.0;
  float v38 = 0.0;
  if (v27)
  {
    outerGlow = self->_outerGlow;
    *(float *)&double v34 = outerGlow->var0;
    float v35 = outerGlow->var1;
    float v36 = outerGlow->var2;
    float v37 = outerGlow->var3;
    float v38 = outerGlow->var4;
  }
  unsigned int v44 = LODWORD(v34);
  *(float *)&double v34 = v57;
  if (v57 <= 0.0) {
    [(CUIShapeEffectStack *)self hasEngraveShadow];
  }
  if (y <= 0.0) {
    [(CUIShapeEffectStack *)self hasInnerShadow];
  }
  if (v14 != v25) {
    [(CUIShapeEffectStack *)self hasInnerShadow];
  }
  if (var5 != v38 && [(CUIShapeEffectStack *)self hasInnerGlow]) {
    [(CUIShapeEffectStack *)self hasOuterGlow];
  }
  if (y >= v57) {
    double v40 = y;
  }
  else {
    double v40 = v57;
  }
  if (v14 <= v25) {
    float v41 = v25;
  }
  else {
    float v41 = v14;
  }
  if (v41 <= var5) {
    float v41 = var5;
  }
  if (v41 <= v38) {
    float v41 = v38;
  }
  *(float *)&double v28 = v41 / 2.853;
  LODWORD(v43) = v53;
  *(float *)&double v32 = v48;
  *(float *)&double v30 = v50;
  *(float *)&double v29 = v51;
  *(float *)&double v31 = v49;
  *(float *)&double v33 = v52;
  return +[CUIShapeEffectStack shapeEffectSingleBlurFrom:withInteriorFill:offset:blurSize:innerGlowRed:innerGlowGreen:innerGlowBlue:innerGlowOpacity:innerShadowRed:innerShadowGreen:innerShadowBlue:innerShadowOpacity:outerGlowRed:outerGlowGreen:outerGlowBlue:outerGlowOpacity:outerShadowRed:outerShadowGreen:outerShadowBlue:outerShadowOpacity:hasInsideShadowBlur:hasOutsideShadowBlur:](CUIShapeEffectStack, "shapeEffectSingleBlurFrom:withInteriorFill:offset:blurSize:innerGlowRed:innerGlowGreen:innerGlowBlue:innerGlowOpacity:innerShadowRed:innerShadowGreen:innerShadowBlue:innerShadowOpacity:outerGlowRed:outerGlowGreen:outerGlowBlue:outerGlowOpacity:outerShadowRed:outerShadowGreen:outerShadowBlue:outerShadowOpacity:hasInsideShadowBlur:hasOutsideShadowBlur:", a3, a4, v7, v16, 0.0, v40, v28, v29, v30, v31, v32, v33, __PAIR64__(LODWORD(v46), LODWORD(v47)), __PAIR64__(v44, LODWORD(v45)),
           __PAIR64__(LODWORD(v36), LODWORD(v35)),
           __PAIR64__(v56, LODWORD(v37)),
           __PAIR64__(v54, v55),
           v43);
}

- (id)imageWithInnerGlowOfImage:(id)a3 effect:(id *)a4
{
  *(float *)&double v8 = a4->var4;
  *(float *)&double v4 = a4->var5 / 2.853;
  *(float *)&double v5 = a4->var1;
  *(float *)&double v6 = a4->var2;
  *(float *)&double v7 = a4->var3;
  return +[CUIShapeEffectStack innerGlowFrom:a3 withRadius:v4 red:v5 green:v6 blue:v7 opacity:v8];
}

- (id)imageWithInnerShadowOfImage:(id)a3 effect:(id *)a4
{
  *(float *)&double v7 = a4->var3;
  *(float *)&double v4 = a4->var4 / 2.853;
  *(float *)&double v5 = a4->var1;
  *(float *)&double v6 = a4->var2;
  *(float *)&double v8 = a4->var5;
  return +[CUIShapeEffectStack innerShadowFrom:withOffset:radius:red:green:blue:opacity:](CUIShapeEffectStack, "innerShadowFrom:withOffset:radius:red:green:blue:opacity:", a3, -a4->var8.x, -a4->var8.y, v4, v5, v6, v7, v8);
}

- (id)image:(id)a3 withAdjustedOpacity:(float)a4
{
  if (a4 >= 1.0) {
    return a3;
  }
  else {
    return +[CUIShapeEffectStack adjustOpacity:by:](CUIShapeEffectStack, "adjustOpacity:by:", a3);
  }
}

- (id)imageWithColorOverlayOfImage:(id)a3 effect:(id *)a4
{
  *(float *)&double v4 = a4->var1;
  *(float *)&double v5 = a4->var2;
  *(float *)&double v6 = a4->var3;
  *(float *)&double v7 = a4->var4;
  id v10 = +[CUIShapeEffectStack colorWithRed:v4 green:v5 blue:v6 alpha:v7];
  uint64_t var0 = a4->var0;
  return +[CUIShapeEffectStack blend:v10 over:a3 blendKind:var0];
}

- (id)imageWithHueSaturationOfImage:(id)a3 effect:(id *)a4
{
  if (!a4->var6) {
    return a3;
  }
  *(float *)&double v4 = a4->var2;
  *(float *)&double v5 = a4->var3;
  *(float *)&double v6 = a4->var4;
  return +[CUIShapeEffectStack hueSaturationFrom:a3 withCenterAngle:a4->var0 width:a4->var1 tintRed:v4 tintGreen:v5 tintBlue:v6];
}

- (id)imageWithInteriorGradientFillOfImage:(id)a3 effect:(id *)a4
{
  [a3 extent];
  id v6 = +[CUIShapeEffectStack gradientWithParameters:inRect:](CUIShapeEffectStack, "gradientWithParameters:inRect:", a4);
  uint64_t var0 = a4->var0;
  return +[CUIShapeEffectStack blend:v6 over:a3 blendKind:var0];
}

- (id)imageWithOuterGlowOfImage:(id)a3 effect:(id *)a4
{
  *(float *)&double v4 = a4->var0;
  *(float *)&double v5 = a4->var1;
  *(float *)&double v6 = a4->var2;
  *(float *)&double v7 = a4->var3;
  return +[CUIShapeEffectStack outerGlowFrom:a3 withSize:a4->var4 spread:a4->var5 red:v4 green:v5 blue:v6 opacity:v7];
}

- (id)imageWithEngraveShadowOfImage:(id)a3 effect:(id *)a4
{
  *(float *)&double v4 = a4->var0;
  *(float *)&double v5 = a4->var1;
  *(float *)&double v6 = a4->var2;
  *(float *)&double v7 = a4->var3;
  return +[CUIShapeEffectStack outerShadowFrom:withOffset:size:spread:red:green:blue:opacity:](CUIShapeEffectStack, "outerShadowFrom:withOffset:size:spread:red:green:blue:opacity:", a3, a4->var4, a4->var5, -a4->var8.x, -a4->var8.y, v4, v5, v6, v7);
}

- (id)imageWithExtraShadowOfImage:(id)a3 effect:(id *)a4
{
  *(float *)&double v4 = a4->var0;
  *(float *)&double v5 = a4->var1;
  *(float *)&double v6 = a4->var2;
  *(float *)&double v7 = a4->var3;
  return +[CUIShapeEffectStack outerShadowFrom:withOffset:size:spread:red:green:blue:opacity:](CUIShapeEffectStack, "outerShadowFrom:withOffset:size:spread:red:green:blue:opacity:", a3, a4->var4, a4->var5, -a4->var8.x, -a4->var8.y, v4, v5, v6, v7);
}

- (id)imageWithBevelEmbossOfImage:(id)a3 effect:(id *)a4
{
  *(float *)&double v4 = a4->var2;
  *(float *)&double v5 = a4->var3;
  *(float *)&double v6 = a4->var4;
  *(float *)&double v7 = a4->var5;
  *(float *)&double v8 = a4->var6;
  *(float *)&double v9 = a4->var7;
  *(float *)&double v10 = a4->var8;
  *(float *)&double v11 = a4->var9;
  return +[CUIShapeEffectStack bevelEmbossFrom:withSize:soften:angle:altitude:highlightRed:highlightGreen:highlightBlue:highlightOpacity:shadowRed:shadowGreen:shadowBlue:shadowOpacity:bevelStyle:](CUIShapeEffectStack, "bevelEmbossFrom:withSize:soften:angle:altitude:highlightRed:highlightGreen:highlightBlue:highlightOpacity:shadowRed:shadowGreen:shadowBlue:shadowOpacity:bevelStyle:", a3, a4->var0, a4->var1, a4->var12, v4, v5, v6, v7, v8, v9, v10, v11, *(void *)&a4->var10);
}

- (int)cgBlendModeForOutputBlending
{
  uint64_t v2 = [(CUIShapeEffectStack *)self outputBlendMode];
  return +[CUIShapeEffectPreset cgBlendModeFromCUIEffectBlendMode:v2];
}

- (void)updateOutputBlendingWithInteriorFillHeuristic
{
  unint64_t colorOverlayCount = self->_colorOverlayCount;
  if (colorOverlayCount)
  {
    colorOverladouble y = self->_colorOverlay;
    while (1)
    {
      unsigned int var0 = colorOverlay->var0;
      ++colorOverlay;
      unsigned int v4 = var0;
      if (var0) {
        break;
      }
      if (!--colorOverlayCount) {
        return;
      }
    }
    self->_outputBlendMode = v4;
  }
}

- (void)scaleEffectParametersBy:(double)a3
{
  if (self->_scalefactor != a3)
  {
    unint64_t innerGlowCount = self->_innerGlowCount;
    if (innerGlowCount)
    {
      p_float var5 = &self->_innerGlow->var5;
      do
      {
        float v6 = a3;
        float *p_var5 = (float)(*p_var5 / self->_scalefactor) * v6;
        p_var5 += 6;
        --innerGlowCount;
      }
      while (innerGlowCount);
    }
    unint64_t innerShadowCount = self->_innerShadowCount;
    if (innerShadowCount)
    {
      float v9 = a3;
      p_float var6 = &self->_innerShadow->var6;
      do
      {
        *(p_var6 - 2) = (float)(*(p_var6 - 2) / self->_scalefactor) * v9;
        float v11 = p_var6[1];
        float v12 = (float)(*p_var6 / self->_scalefactor) * v9;
        *p_float var6 = v12;
        __float2 v13 = __sincosf_stret(v11);
        *((double *)p_var6 + 1) = (float)(v12 * v13.__cosval);
        *((double *)p_var6 + 2) = (float)(v12 * v13.__sinval);
        p_var6 += 12;
        --innerShadowCount;
      }
      while (innerShadowCount);
    }
    unint64_t outerGlowCount = self->_outerGlowCount;
    if (outerGlowCount)
    {
      p_float var4 = &self->_outerGlow->var4;
      do
      {
        float v15 = a3;
        float *p_var4 = (float)(*p_var4 / self->_scalefactor) * v15;
        p_var4 += 6;
        --outerGlowCount;
      }
      while (outerGlowCount);
    }
    unint64_t engraveShadowCount = self->_engraveShadowCount;
    if (engraveShadowCount)
    {
      float v18 = a3;
      double v19 = &self->_engraveShadow->var6;
      do
      {
        *(v19 - 2) = (float)(*(v19 - 2) / self->_scalefactor) * v18;
        float v20 = v19[1];
        float v21 = (float)(*v19 / self->_scalefactor) * v18;
        *double v19 = v21;
        __float2 v22 = __sincosf_stret(v20);
        *((double *)v19 + 1) = (float)(v21 * v22.__cosval);
        *((double *)v19 + 2) = (float)(v21 * v22.__sinval);
        v19 += 12;
        --engraveShadowCount;
      }
      while (engraveShadowCount);
    }
    unint64_t bevelEmbossCount = self->_bevelEmbossCount;
    if (bevelEmbossCount)
    {
      float v24 = a3;
      p_float var1 = &self->_emboss->var1;
      do
      {
        *(p_var1 - 1) = (float)(*(p_var1 - 1) / self->_scalefactor) * v24;
        *p_float var1 = (float)(*p_var1 / self->_scalefactor) * v24;
        p_var1 += 13;
        --bevelEmbossCount;
      }
      while (bevelEmbossCount);
    }
    else
    {
      float v24 = a3;
    }
    self->_scalefactor = v24;
    [(CUIShapeEffectStack *)self _updateRenderStrategyFromEffect:1148350320];
  }
}

- (void)_normalizeEffectParameters
{
  unint64_t innerGlowCount = self->_innerGlowCount;
  if (innerGlowCount)
  {
    p_float var5 = &self->_innerGlow->var5;
    do
    {
      float v4 = *p_var5;
      if (*p_var5 == 2.0) {
        float v4 = 1.0;
      }
      float *p_var5 = v4;
      p_var5 += 6;
      --innerGlowCount;
    }
    while (innerGlowCount);
  }
  unint64_t outerGlowCount = self->_outerGlowCount;
  if (outerGlowCount)
  {
    p_float var4 = &self->_outerGlow->var4;
    do
    {
      float v7 = *p_var4;
      if (*p_var4 == 2.0) {
        float v7 = 1.0;
      }
      float *p_var4 = v7;
      p_var4 += 6;
      --outerGlowCount;
    }
    while (outerGlowCount);
  }
  unint64_t bevelEmbossCount = self->_bevelEmbossCount;
  if (bevelEmbossCount)
  {
    emboss = (float32x2_t *)self->_emboss;
    __asm { FMOV            V1.2S, #1.0 }
    do
    {
      float32x2_t *emboss = (float32x2_t)vbsl_s8((int8x8_t)vceq_f32(*emboss, (float32x2_t)0x4000000040000000), _D1, (int8x8_t)*emboss);
      emboss = (float32x2_t *)((char *)emboss + 52);
      --bevelEmbossCount;
    }
    while (bevelEmbossCount);
  }
}

- (BOOL)anyEffectAllowsTintSubstitution
{
  unint64_t colorOverlayCount = self->_colorOverlayCount;
  if (colorOverlayCount)
  {
    p_float var5 = &self->_colorOverlay->var5;
    while (1)
    {
      BOOL v4 = *p_var5;
      p_var5 += 24;
      if (v4) {
        return 1;
      }
      if (!--colorOverlayCount) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t hueSaturationCount = self->_hueSaturationCount;
    if (hueSaturationCount)
    {
      unint64_t v6 = hueSaturationCount - 1;
      float v7 = &self->_hueSaturation->var5;
      do
      {
        BOOL v8 = *v7;
        v7 += 24;
        BOOL result = v8;
      }
      while (!v8 && v6-- != 0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)applyCustomForegroundColor:(CGColor *)a3
{
}

- (void)applyCustomForegroundColor:(CGColor *)a3 tintEffectColors:(BOOL)a4
{
  BOOL v4 = a4;
  ColorSpace = CGColorGetColorSpace(a3);
  if (ColorSpace)
  {
    CGColorSpaceModel Model = CGColorSpaceGetModel(ColorSpace);
    if (Model)
    {
      if (Model == kCGColorSpaceModelRGB)
      {
        Components = CGColorGetComponents(a3);
        double v10 = *Components;
        double v11 = Components[1];
        double v12 = Components[2];
        double Alpha = CGColorGetAlpha(a3);
      }
      else
      {
        uint64_t SRGB = _CUIColorSpaceGetSRGB();
        MEMORY[0x1A622FCE0](SRGB, 0);
        float v15 = (CGColor *)CGColorTransformConvertColor();
        CGColorTransformRelease();
        if (!v15) {
          return;
        }
        BOOL v16 = CGColorGetComponents(v15);
        double v10 = *v16;
        double v11 = v16[1];
        double v12 = v16[2];
        double Alpha = CGColorGetAlpha(v15);
        CGColorRelease(v15);
      }
    }
    else
    {
      double v10 = *CGColorGetComponents(a3);
      double Alpha = CGColorGetAlpha(a3);
      double v11 = v10;
      double v12 = v10;
    }
    unsigned int v17 = [(CUIShapeEffectStack *)self anyEffectAllowsTintSubstitution];
    if (v4)
    {
      if (v17)
      {
        unint64_t colorOverlayCount = self->_colorOverlayCount;
        if (colorOverlayCount)
        {
          p_float var5 = &self->_colorOverlay->var5;
          float v23 = p_var5;
          do
          {
            BOOL v24 = *v23;
            v23 += 24;
            if (v24)
            {
              float v19 = v10;
              *((float *)p_var5 - 4) = v19;
              float v20 = v11;
              *((float *)p_var5 - 3) = v20;
              float v25 = *((float *)p_var5 - 1);
              if (v25 <= 0.0) {
                double v26 = 1.0;
              }
              else {
                double v26 = v25;
              }
              float v27 = Alpha * v26;
              float v21 = v12;
              *((float *)p_var5 - 2) = v21;
              *((float *)p_var5 - 1) = v27;
            }
            p_float var5 = v23;
            --colorOverlayCount;
          }
          while (colorOverlayCount);
        }
        unint64_t hueSaturationCount = self->_hueSaturationCount;
        if (hueSaturationCount)
        {
          p_float var3 = &self->_hueSaturation->var3;
          do
          {
            if (*((unsigned char *)p_var3 + 8)
              && (vabdd_f64(v10, *(p_var3 - 1)) > 0.00000011920929
               || vabdd_f64(v11, *p_var3) > 0.00000011920929
               || vabdd_f64(v12, p_var3[1]) > 0.00000011920929))
            {
              float v29 = v10;
              *(p_var3 - 1) = v29;
              float v30 = v11;
              float *p_var3 = v30;
              float v31 = v12;
              p_var3[1] = v31;
              *((unsigned char *)p_var3 + 9) = 1;
            }
            p_var3 += 6;
            --hueSaturationCount;
          }
          while (hueSaturationCount);
        }
      }
      else
      {
        float v33 = Alpha;
        self->_outputOpacitdouble y = v33;
        unint64_t v34 = self->_colorOverlayCount;
        if (v34)
        {
          p_float var4 = &self->_colorOverlay->var4;
          do
          {
            float v35 = v10;
            *(p_var4 - 3) = v35;
            float v36 = v11;
            *(p_var4 - 2) = v36;
            float v37 = v12;
            *(p_var4 - 1) = v37;
            float *p_var4 = v33;
            p_var4 += 6;
            --v34;
          }
          while (v34);
        }
        unint64_t innerGlowCount = self->_innerGlowCount;
        if (innerGlowCount)
        {
          uint64_t v43 = &self->_innerGlow->var3;
          do
          {
            float v40 = v10;
            *(v43 - 2) = v40;
            float v41 = v11;
            *(v43 - 1) = v41;
            float v42 = v12;
            *uint64_t v43 = v42;
            v43 += 6;
            --innerGlowCount;
          }
          while (innerGlowCount);
        }
        unint64_t innerShadowCount = self->_innerShadowCount;
        if (innerShadowCount)
        {
          float v48 = &self->_innerShadow->var3;
          do
          {
            float v45 = v10;
            *(v48 - 2) = v45;
            float v46 = v11;
            *(v48 - 1) = v46;
            float v47 = v12;
            *float v48 = v47;
            v48 += 12;
            --innerShadowCount;
          }
          while (innerShadowCount);
        }
        unint64_t outerGlowCount = self->_outerGlowCount;
        if (outerGlowCount)
        {
          p_float var2 = &self->_outerGlow->var2;
          do
          {
            float v50 = v10;
            *(p_var2 - 2) = v50;
            float v51 = v11;
            *(p_var2 - 1) = v51;
            float v52 = v12;
            *p_float var2 = v52;
            p_var2 += 6;
            --outerGlowCount;
          }
          while (outerGlowCount);
        }
        unint64_t engraveShadowCount = self->_engraveShadowCount;
        if (engraveShadowCount)
        {
          v58 = &self->_engraveShadow->var2;
          do
          {
            float v55 = v10;
            *(v58 - 2) = v55;
            float v56 = v11;
            *(v58 - 1) = v56;
            float v57 = v12;
            float *v58 = v57;
            v58 += 12;
            --engraveShadowCount;
          }
          while (engraveShadowCount);
        }
        unint64_t extraShadowCount = self->_extraShadowCount;
        if (extraShadowCount)
        {
          v63 = &self->_extraShadow->var2;
          do
          {
            float v60 = v10;
            *(v63 - 2) = v60;
            float v61 = v11;
            *(v63 - 1) = v61;
            float v62 = v12;
            float *v63 = v62;
            v63 += 12;
            --extraShadowCount;
          }
          while (extraShadowCount);
        }
      }
    }
    if ((v17 & 1) == 0)
    {
      if ([(CUIShapeEffectStack *)self hasInnerGradient])
      {
        unint64_t innerGradientCount = self->_innerGradientCount;
        if (innerGradientCount)
        {
          p_var7 = &self->_innerGradient->var7;
          do
          {
            double v68 = *p_var7;
            v65.f64[1] = v10 * (1.0 - Alpha);
            v65.f64[0] = v12 * (1.0 - Alpha);
            v66.f64[1] = v11 * (1.0 - Alpha);
            v66.f64[0] = v65.f64[1];
            *(float32x4_t *)(p_var7 - 6) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmlaq_n_f64(v66, vcvtq_f64_f32(*(float32x2_t *)(p_var7 - 6)), v68)), vmlaq_n_f64(v65, vcvt_hight_f64_f32(*(float32x4_t *)(p_var7 - 6)), v68));
            float v69 = v66.f64[1] + v68 * *(p_var7 - 2);
            float v70 = v65.f64[0] + v68 * *(p_var7 - 1);
            *(p_var7 - 2) = v69;
            *(p_var7 - 1) = v70;
            *(float *)&double v68 = 1.0 - Alpha + v68;
            float *p_var7 = *(float *)&v68;
            p_var7 += 8;
            --innerGradientCount;
          }
          while (innerGradientCount);
        }
      }
      else if ([(CUIShapeEffectStack *)self hasColorOverlay])
      {
        unint64_t v71 = self->_colorOverlayCount;
        if (v71)
        {
          v72 = &self->_colorOverlay->var4;
          do
          {
            double v73 = *v72;
            float v74 = v10 * (1.0 - Alpha) + v73 * *(v72 - 3);
            float v75 = v11 * (1.0 - Alpha) + v73 * *(v72 - 2);
            *(v72 - 3) = v74;
            *(v72 - 2) = v75;
            float v76 = v12 * (1.0 - Alpha) + v73 * *(v72 - 1);
            *(float *)&double v73 = 1.0 - Alpha + v73;
            *(v72 - 1) = v76;
            float *v72 = *(float *)&v73;
            v72 += 6;
            --v71;
          }
          while (v71);
        }
      }
      else
      {
        self->_unint64_t colorOverlayCount = 1;
        v77 = ($EB69DF3B1DDA5C6930A5C79FD1E30C08 *)malloc_type_calloc(1uLL, 0x18uLL, 0x10000402C707793uLL);
        self->_colorOverladouble y = v77;
        float v78 = v10;
        float v79 = v11;
        v77->float var1 = v78;
        v77->float var2 = v79;
        float v80 = v12;
        float v81 = Alpha;
        v77->float var3 = v80;
        v77->float var4 = v81;
      }
    }
  }
}

- (void)scaleBrightnessOfEffectColorsByAmount:(double)a3 onlyTintableColors:(BOOL)a4
{
  if (vabdd_f64(1.0, a3) > 0.00000011920929)
  {
    BOOL v5 = a4;
    unint64_t colorOverlayCount = self->_colorOverlayCount;
    if (colorOverlayCount)
    {
      uint64_t v8 = 0;
      for (unint64_t i = 0; i < colorOverlayCount; ++i)
      {
        colorOverladouble y = self->_colorOverlay;
        if (!v5 || colorOverlay[v8].var5)
        {
          double v27 = 0.0;
          double v28 = 0.0;
          double v25 = 0.0;
          double v26 = 0.0;
          double v23 = 0.0;
          double v24 = 0.0;
          p_unsigned int var0 = (float *)&colorOverlay[v8].var0;
          _CUIRGBToHSB(&v28, &v27, &v26, colorOverlay[v8].var1, colorOverlay[v8].var2, colorOverlay[v8].var3);
          double v26 = v26 * a3;
          _CUIHSBToRGB(&v25, &v24, &v23, v28, v27, v26);
          float v12 = v25;
          p_var0[1] = v12;
          float v13 = v24;
          p_var0[2] = v13;
          float v14 = v23;
          p_var0[3] = v14;
          unint64_t colorOverlayCount = self->_colorOverlayCount;
        }
        ++v8;
      }
    }
    unint64_t hueSaturationCount = self->_hueSaturationCount;
    if (hueSaturationCount)
    {
      uint64_t v16 = 0;
      for (unint64_t j = 0; j < hueSaturationCount; ++j)
      {
        hueSaturation = self->_hueSaturation;
        if (!v5 || hueSaturation[v16].var5)
        {
          double v27 = 0.0;
          double v28 = 0.0;
          double v25 = 0.0;
          double v26 = 0.0;
          double v23 = 0.0;
          double v24 = 0.0;
          float v19 = &hueSaturation[v16];
          _CUIRGBToHSB(&v28, &v27, &v26, hueSaturation[v16].var2, hueSaturation[v16].var3, hueSaturation[v16].var4);
          double v26 = v26 * a3;
          _CUIHSBToRGB(&v25, &v24, &v23, v28, v27, v26);
          float v20 = v25;
          v19->float var2 = v20;
          float v21 = v24;
          v19->float var3 = v21;
          float v22 = v23;
          v19->float var4 = v22;
          v19->float var6 = 1;
          unint64_t hueSaturationCount = self->_hueSaturationCount;
        }
        ++v16;
      }
    }
  }
}

- (void)adjustEffectColorsToTemperature:(int)a3 onlyTintableColors:(BOOL)a4
{
  if (a3 != 6500)
  {
    v27[9] = v4;
    v27[10] = v5;
    if ((a3 - 1000) <= 0x9858)
    {
      BOOL v7 = a4;
      double v26 = 0.0;
      v27[0] = 0.0;
      double v25 = 0.0;
      unint64_t colorOverlayCount = self->_colorOverlayCount;
      if (colorOverlayCount)
      {
        uint64_t v10 = 0;
        for (unint64_t i = 0; i < colorOverlayCount; ++i)
        {
          colorOverladouble y = self->_colorOverlay;
          if (!v7 || colorOverlay[v10].var5)
          {
            p_unsigned int var0 = (float *)&colorOverlay[v10].var0;
            _CUICreateColorByAdjustingTemperature(a3, v27, &v26, &v25, colorOverlay[v10].var1, colorOverlay[v10].var2, colorOverlay[v10].var3);
            float v14 = v27[0];
            p_var0[1] = v14;
            float v15 = v26;
            p_var0[2] = v15;
            float v16 = v25;
            p_var0[3] = v16;
            unint64_t colorOverlayCount = self->_colorOverlayCount;
          }
          ++v10;
        }
      }
      unint64_t hueSaturationCount = self->_hueSaturationCount;
      if (hueSaturationCount)
      {
        uint64_t v18 = 0;
        for (unint64_t j = 0; j < hueSaturationCount; ++j)
        {
          hueSaturation = self->_hueSaturation;
          if (!v7 || hueSaturation[v18].var5)
          {
            float v21 = &hueSaturation[v18];
            _CUICreateColorByAdjustingTemperature(a3, v27, &v26, &v25, hueSaturation[v18].var2, hueSaturation[v18].var3, hueSaturation[v18].var4);
            float v22 = v27[0];
            v21->float var2 = v22;
            float v23 = v26;
            v21->float var3 = v23;
            float v24 = v25;
            v21->float var4 = v24;
            v21->float var6 = 1;
            unint64_t hueSaturationCount = self->_hueSaturationCount;
          }
          ++v18;
        }
      }
    }
  }
}

- (id)standardEffectCompositeWithShapeImage:(id)a3 blendOntoImage:(BOOL)a4
{
  BOOL v5 = a4;
  if (standardEffectCompositeWithShapeImage_blendOntoImage__once_token != -1) {
    dispatch_once(&standardEffectCompositeWithShapeImage_blendOntoImage__once_token, &__block_literal_global_282);
  }
  int v8 = standardEffectCompositeWithShapeImage_blendOntoImage__blendWithMaskAvailable;
  *(float *)&double v4 = self->_shapeOpacity;
  id v9 = [(CUIShapeEffectStack *)self image:a3 withAdjustedOpacity:v4];
  if ([(CUIShapeEffectStack *)self hasEffects])
  {
    double v11 = +[CIImage emptyImage];
    if (v5) {
      double v11 = +[CUIShapeEffectStack composite:a3 over:v11];
    }
    if (!self->_bypassColorFills)
    {
      if (self->_innerGradientCount)
      {
        uint64_t v12 = 0;
        unint64_t v13 = 0;
        do
        {
          float v14 = &self->_innerGradient[v12];
          long long v15 = *(_OWORD *)&v14->var4;
          long long v67 = *(_OWORD *)&v14->var0;
          long long v68 = v15;
          float v16 = [(CUIShapeEffectStack *)self imageWithInteriorGradientFillOfImage:v9 effect:&v67];
          ++v13;
          ++v12;
        }
        while (v13 < self->_innerGradientCount);
        double v11 = v16;
      }
      if (self->_colorOverlayCount)
      {
        uint64_t v17 = 0;
        unint64_t v18 = 0;
        do
        {
          float v19 = &self->_colorOverlay[v17];
          long long v20 = *(_OWORD *)&v19->var0;
          *(void *)&long long v68 = *(void *)&v19->var4;
          long long v67 = v20;
          double v11 = [(CUIShapeEffectStack *)self imageWithColorOverlayOfImage:v11 effect:&v67];
          ++v18;
          ++v17;
        }
        while (v18 < self->_colorOverlayCount);
      }
    }
    BOOL v21 = v8 != 0;
    if (self->_hueSaturationCount)
    {
      uint64_t v22 = 0;
      unint64_t v23 = 0;
      do
      {
        float v24 = &self->_hueSaturation[v22];
        long long v25 = *(_OWORD *)&v24->var0;
        *(void *)&long long v68 = *(void *)&v24->var4;
        long long v67 = v25;
        double v26 = [(CUIShapeEffectStack *)self imageWithHueSaturationOfImage:v9 effect:&v67];
        ++v23;
        ++v22;
      }
      while (v23 < self->_hueSaturationCount);
      double v11 = v26;
      BOOL v21 = 0;
    }
    if (self->_innerGlowCount)
    {
      uint64_t v27 = 0;
      unint64_t v28 = 0;
      do
      {
        float v29 = &self->_innerGlow[v27];
        long long v30 = *(_OWORD *)&v29->var0;
        *(void *)&long long v68 = *(void *)&v29->var4;
        long long v67 = v30;
        double v11 = +[CUIShapeEffectStack blend:[(CUIShapeEffectStack *)self imageWithInnerGlowOfImage:v9 effect:&v67] over:v11 blendKind:self->_innerGlow[v27].var0];
        ++v28;
        ++v27;
      }
      while (v28 < self->_innerGlowCount);
    }
    if (self->_innerShadowCount)
    {
      uint64_t v31 = 0;
      unint64_t v32 = 0;
      do
      {
        float v33 = &self->_innerShadow[v31];
        long long v34 = *(_OWORD *)&v33->var0;
        CGPoint var8 = v33->var8;
        long long v68 = *(_OWORD *)&v33->var4;
        CGPoint v69 = var8;
        long long v67 = v34;
        double v11 = +[CUIShapeEffectStack blend:[(CUIShapeEffectStack *)self imageWithInnerShadowOfImage:v9 effect:&v67] over:v11 blendKind:self->_innerShadow[v31].var0];
        ++v32;
        ++v31;
      }
      while (v32 < self->_innerShadowCount);
    }
    unint64_t bevelEmbossCount = self->_bevelEmbossCount;
    if (bevelEmbossCount)
    {
      uint64_t v37 = 0;
      for (unint64_t i = 0; i < bevelEmbossCount; ++i)
      {
        uint64_t v39 = &self->_emboss[v37];
        if (v39->var12 == 1)
        {
          long long v40 = *(_OWORD *)&v39->var0;
          long long v41 = *(_OWORD *)&v39->var4;
          CGPoint v42 = *(CGPoint *)&v39->var8;
          unsigned int var12 = v39->var12;
          long long v68 = v41;
          CGPoint v69 = v42;
          long long v67 = v40;
          double v11 = +[CUIShapeEffectStack composite:[(CUIShapeEffectStack *)self imageWithBevelEmbossOfImage:v9 effect:&v67] over:v11];
          unint64_t bevelEmbossCount = self->_bevelEmbossCount;
        }
        ++v37;
      }
    }
    if (!standardEffectCompositeWithShapeImage_blendOntoImage__blendWithMaskAvailable) {
      double v11 = +[CUIShapeEffectStack composite:v11 into:v9];
    }
    uint64_t v43 = +[CIImage emptyImage];
    if (self->_outerGlowCount)
    {
      uint64_t v44 = 0;
      unint64_t v45 = 0;
      do
      {
        float v46 = &self->_outerGlow[v44];
        long long v47 = *(_OWORD *)&v46->var0;
        *(void *)&long long v68 = *(void *)&v46->var4;
        long long v67 = v47;
        uint64_t v43 = +[CUIShapeEffectStack composite:[(CUIShapeEffectStack *)self imageWithOuterGlowOfImage:v9 effect:&v67] over:v43];
        ++v45;
        ++v44;
      }
      while (v45 < self->_outerGlowCount);
    }
    if (self->_engraveShadowCount)
    {
      uint64_t v48 = 0;
      unint64_t v49 = 0;
      do
      {
        float v50 = &self->_engraveShadow[v48];
        long long v51 = *(_OWORD *)&v50->var0;
        CGPoint v52 = v50->var8;
        long long v68 = *(_OWORD *)&v50->var4;
        CGPoint v69 = v52;
        long long v67 = v51;
        uint64_t v43 = +[CUIShapeEffectStack composite:[(CUIShapeEffectStack *)self imageWithEngraveShadowOfImage:v9 effect:&v67] over:v43];
        ++v49;
        ++v48;
      }
      while (v49 < self->_engraveShadowCount);
    }
    if (self->_extraShadowCount)
    {
      uint64_t v53 = 0;
      unint64_t v54 = 0;
      do
      {
        float v55 = &self->_extraShadow[v53];
        long long v56 = *(_OWORD *)&v55->var0;
        CGPoint v57 = v55->var8;
        long long v68 = *(_OWORD *)&v55->var4;
        CGPoint v69 = v57;
        long long v67 = v56;
        uint64_t v43 = +[CUIShapeEffectStack composite:[(CUIShapeEffectStack *)self imageWithExtraShadowOfImage:v9 effect:&v67] over:v43];
        ++v54;
        ++v53;
      }
      while (v54 < self->_extraShadowCount);
    }
    unint64_t v58 = self->_bevelEmbossCount;
    if (v58)
    {
      uint64_t v59 = 0;
      for (unint64_t j = 0; j < v58; ++j)
      {
        float v61 = &self->_emboss[v59];
        if (v61->var12 != 1)
        {
          long long v62 = *(_OWORD *)&v61->var0;
          long long v63 = *(_OWORD *)&v61->var4;
          CGPoint v64 = *(CGPoint *)&v61->var8;
          unsigned int var12 = v61->var12;
          long long v68 = v63;
          CGPoint v69 = v64;
          long long v67 = v62;
          uint64_t v43 = +[CUIShapeEffectStack composite:[(CUIShapeEffectStack *)self imageWithBevelEmbossOfImage:v9 effect:&v67] over:v43];
          unint64_t v58 = self->_bevelEmbossCount;
        }
        ++v59;
      }
    }
    if (v21) {
      id v65 = +[CUIShapeEffectStack imageFromBlendWithMask:a3 foreground:v11 background:v43];
    }
    else {
      id v65 = +[CUIShapeEffectStack composite:v11 over:v43];
    }
    id v9 = v65;
  }
  *(float *)&double v10 = self->_outputOpacity;
  return [(CUIShapeEffectStack *)self image:v9 withAdjustedOpacity:v10];
}

CIFilter *__76__CUIShapeEffectStack_standardEffectCompositeWithShapeImage_blendOntoImage___block_invoke()
{
  BOOL result = +[CIFilter filterWithName:@"CIBlendWithAlphaMask"];
  standardEffectCompositeWithShapeImage_blendOntoImage__blendWithMaskAvailable = result != 0;
  return result;
}

- (id)optimizedSingleBlurEffectCompositeWithShapeImage:(id)a3
{
  BOOL v5 = +[CIImage emptyImage];
  if ([(CUIShapeEffectStack *)self hasInnerGradient])
  {
    innerGradient = self->_innerGradient;
    long long v7 = *(_OWORD *)&innerGradient->var4;
    long long v11 = *(_OWORD *)&innerGradient->var0;
    long long v12 = v7;
    BOOL v5 = [(CUIShapeEffectStack *)self imageWithInteriorGradientFillOfImage:a3 effect:&v11];
  }
  if ([(CUIShapeEffectStack *)self hasColorOverlay])
  {
    colorOverladouble y = self->_colorOverlay;
    long long v9 = *(_OWORD *)&colorOverlay->var0;
    *(void *)&long long v12 = *(void *)&colorOverlay->var4;
    long long v11 = v9;
    BOOL v5 = [(CUIShapeEffectStack *)self imageWithColorOverlayOfImage:v5 effect:&v11];
  }
  return [(CUIShapeEffectStack *)self imageWithSingleBlurShapeEffectOfImage:a3 withInteriorFill:v5];
}

- (id)compositeEffectStackWithShapeImage:(id)a3 withScale:(double)a4 blendOntoImage:(BOOL)a5
{
  BOOL v5 = a5;
  if (self->_scalefactor != a4) {
    -[CUIShapeEffectStack scaleEffectParametersBy:](self, "scaleEffectParametersBy:");
  }
  [(CUIShapeEffectStack *)self _normalizeEffectParameters];
  if (_CUIDebugUseStandardRendering())
  {
    self->_renderStrategdouble y = 1;
LABEL_10:
    return [(CUIShapeEffectStack *)self standardEffectCompositeWithShapeImage:a3 blendOntoImage:v5];
  }
  renderStrategdouble y = self->_renderStrategy;
  if (renderStrategy == 1) {
    goto LABEL_10;
  }
  if (renderStrategy != 2) {
    return 0;
  }
  return [(CUIShapeEffectStack *)self optimizedSingleBlurEffectCompositeWithShapeImage:a3];
}

- (CGRect)effectPaddingWithScale:(double)a3
{
  if (self->_scalefactor != a3) {
    -[CUIShapeEffectStack scaleEffectParametersBy:](self, "scaleEffectParametersBy:");
  }
  CGFloat y = CGRectZero.origin.y;
  CGFloat width = CGRectZero.size.width;
  CGFloat height = CGRectZero.size.height;
  [(CUIShapeEffectStack *)self _normalizeEffectParameters];
  CGFloat v7 = height;
  CGFloat v8 = width;
  CGFloat v9 = y;
  CGFloat x = CGRectZero.origin.x;
  if ([(CUIShapeEffectStack *)self hasOuterGlow])
  {
    CGFloat v7 = height;
    CGFloat v8 = width;
    CGFloat v9 = y;
    CGFloat x = CGRectZero.origin.x;
    if (self->_outerGlowCount)
    {
      unint64_t v11 = 0;
      uint64_t v12 = 16;
      CGFloat x = CGRectZero.origin.x;
      CGFloat v9 = y;
      CGFloat v8 = width;
      CGFloat v7 = height;
      do
      {
        v24.origin.CGFloat x = x;
        v24.origin.CGFloat y = v9;
        v24.size.CGFloat width = v8;
        v24.size.CGFloat height = v7;
        CGFloat v13 = -*(float *)((char *)&self->_outerGlow->var0 + v12);
        CGRect v25 = CGRectInset(v24, v13, v13);
        CGFloat x = v25.origin.x;
        CGFloat v9 = v25.origin.y;
        CGFloat v8 = v25.size.width;
        CGFloat v7 = v25.size.height;
        ++v11;
        v12 += 24;
      }
      while (v11 < self->_outerGlowCount);
    }
  }
  if ([(CUIShapeEffectStack *)self hasBevelEmboss] && self->_bevelEmbossCount)
  {
    uint64_t v14 = 0;
    unint64_t v15 = 0;
    do
    {
      v26.origin.CGFloat x = CGRectZero.origin.x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      CGFloat v16 = -(float)(self->_emboss[v14].var0 + self->_emboss[v14].var1);
      CGRect v34 = CGRectInset(v26, v16, v16);
      v27.origin.CGFloat x = x;
      v27.origin.CGFloat y = v9;
      v27.size.CGFloat width = v8;
      v27.size.CGFloat height = v7;
      CGRect v28 = CGRectUnion(v27, v34);
      CGFloat x = v28.origin.x;
      CGFloat v9 = v28.origin.y;
      CGFloat v8 = v28.size.width;
      CGFloat v7 = v28.size.height;
      ++v15;
      ++v14;
    }
    while (v15 < self->_bevelEmbossCount);
  }
  if ([(CUIShapeEffectStack *)self hasEngraveShadow] && self->_engraveShadowCount)
  {
    uint64_t v17 = 0;
    unint64_t v18 = 0;
    do
    {
      v29.origin.CGFloat x = CGRectZero.origin.x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      CGFloat v19 = -self->_engraveShadow[v17].var4;
      CGRect v30 = CGRectInset(v29, v19, v19);
      CGRect v35 = CGRectOffset(v30, -self->_engraveShadow[v17].var8.x, -self->_engraveShadow[v17].var8.y);
      v31.origin.CGFloat x = x;
      v31.origin.CGFloat y = v9;
      v31.size.CGFloat width = v8;
      v31.size.CGFloat height = v7;
      CGRect v32 = CGRectUnion(v31, v35);
      CGFloat x = v32.origin.x;
      CGFloat v9 = v32.origin.y;
      CGFloat v8 = v32.size.width;
      CGFloat v7 = v32.size.height;
      ++v18;
      ++v17;
    }
    while (v18 < self->_engraveShadowCount);
  }
  double v20 = x;
  double v21 = v9;
  double v22 = v8;
  double v23 = v7;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)effectInsetsWithScale:(double)a3
{
  [(CUIShapeEffectStack *)self effectPaddingWithScale:a3];
  double v4 = v3;
  double v6 = v5;
  double v8 = -(v7 + v3);
  double v10 = -(v9 + v5);
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.float var3 = v13;
  result.float var2 = v12;
  result.float var1 = v11;
  result.unsigned int var0 = v10;
  return result;
}

- (id)processedImageFromImage:(id)a3
{
  return [(CUIShapeEffectStack *)self compositeEffectStackWithShapeImage:a3 withScale:1 blendOntoImage:1.0];
}

- (id)processedImageFromImage:(id)a3 withScale:(double)a4
{
  return [(CUIShapeEffectStack *)self compositeEffectStackWithShapeImage:a3 withScale:1 blendOntoImage:a4];
}

- (id)processedImageFromShapeImage:(id)a3
{
  return [(CUIShapeEffectStack *)self compositeEffectStackWithShapeImage:a3 withScale:0 blendOntoImage:1.0];
}

- (id)processedImageFromShapeImage:(id)a3 withScale:(double)a4
{
  return [(CUIShapeEffectStack *)self processedImageFromShapeImage:a3 withScale:0 invertShadows:a4];
}

- (id)processedImageFromShapeImage:(id)a3 withScale:(double)a4 invertShadows:(BOOL)a5
{
  if (a5)
  {
    unint64_t innerShadowCount = self->_innerShadowCount;
    if (innerShadowCount)
    {
      p_CGFloat y = &self->_innerShadow->var8.y;
      do
      {
        *p_CGFloat y = -*p_y;
        p_y += 6;
        --innerShadowCount;
      }
      while (innerShadowCount);
    }
    unint64_t engraveShadowCount = self->_engraveShadowCount;
    if (engraveShadowCount)
    {
      double v8 = &self->_engraveShadow->var8.y;
      do
      {
        *double v8 = -*v8;
        v8 += 6;
        --engraveShadowCount;
      }
      while (engraveShadowCount);
    }
    unint64_t extraShadowCount = self->_extraShadowCount;
    if (extraShadowCount)
    {
      double v10 = &self->_extraShadow->var8.y;
      do
      {
        *double v10 = -*v10;
        v10 += 6;
        --extraShadowCount;
      }
      while (extraShadowCount);
    }
  }
  return [(CUIShapeEffectStack *)self compositeEffectStackWithShapeImage:a3 withScale:0 blendOntoImage:a4];
}

- (CGImage)newFlattenedImageFromShapeCGImage:(CGImage *)a3 withScale:(double)a4
{
  return [(CUIShapeEffectStack *)self newFlattenedImageFromShapeCGImage:a3 withScale:0 cache:a4];
}

- (CGImage)newFlattenedImageFromShapeCGImage:(CGImage *)a3 withScale:(double)a4 cache:(BOOL)a5
{
  BOOL v5 = a5;
  [(CUIShapeEffectStack *)self cacheKey];
  PropertCGFloat y = (CGImage *)CGImageGetProperty();
  if (!Property || (double v10 = Property, Property == a3))
  {
    id v11 = [objc_alloc((Class)CIImage) initWithCGImage:a3];
    id v12 = [(CUIShapeEffectStack *)self compositeEffectStackWithShapeImage:v11 withScale:0 blendOntoImage:a4];
    [v12 extent];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    uint64_t SRGB = _CUIColorSpaceGetSRGB();
    id v22 = [(id)objc_opt_class() sharedCIContext];
    double v10 = (CGImage *)objc_msgSend(v22, "createCGImage:fromRect:format:colorSpace:deferred:", v12, objc_msgSend(v22, "workingFormat"), SRGB, 1, v14, v16, v18, v20);

    if (v5) {
      CGImageSetProperty();
    }
  }
  else
  {
    CGImageRetain(Property);
  }
  return v10;
}

- (CGImage)_newFlattenedImageFromShapeCGImage:(CGImage *)a3 withScale:(double)a4 ciContext:(id)a5 blendOverImage:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = [objc_alloc((Class)CIImage) initWithCGImage:a3 options:&unk_1EF4A6D48];
  id v11 = [(CUIShapeEffectStack *)self compositeEffectStackWithShapeImage:v10 withScale:v6 blendOntoImage:a4];
  [v10 extent];
  double v13 = v12;
  double v15 = v14;
  [(CUIShapeEffectStack *)self effectPaddingWithScale:a4];
  double v17 = v16;
  double v19 = v18;
  double v21 = v13 + v20;
  double v23 = v15 + v22;
  uint64_t SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  size_t AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  Data = (const void *)CGBitmapAllocateData();
  objc_msgSend(a5, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v11, Data, AlignedBytesPerRow, kCIFormatBGRA8, SRGB, v17, v19, v21, v23);
  CGRect v27 = CGDataProviderCreateWithData(0, Data, (unint64_t)(v23 * (double)AlignedBytesPerRow), (CGDataProviderReleaseDataCallback)CGBitmapDataProviderReleaseData);
  CGRect v28 = CGImageCreate((unint64_t)v21, (unint64_t)v23, 8uLL, 0x20uLL, AlignedBytesPerRow, SRGB, 0x2002u, v27, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v27);

  return v28;
}

- (CGImage)newFlattenedImageFromShapeCGImage:(CGImage *)a3 withScale:(double)a4 ciContext:(id)a5
{
  return [(CUIShapeEffectStack *)self _newFlattenedImageFromShapeCGImage:a3 withScale:a5 ciContext:0 blendOverImage:a4];
}

- (CGImage)newFlattenedImageFromCGImage:(CGImage *)a3 withScale:(double)a4 ciContext:(id)a5
{
  return [(CUIShapeEffectStack *)self _newFlattenedImageFromShapeCGImage:a3 withScale:a5 ciContext:1 blendOverImage:a4];
}

- (CGImage)newFlattenedImageFromShapeCGImage:(CGImage *)a3
{
  return [(CUIShapeEffectStack *)self newFlattenedImageFromShapeCGImage:a3 withScale:1.0];
}

- (id)processedImageFromShapePath:(CGPath *)a3 inRect:(CGRect)a4
{
  return 0;
}

- (CGColor)newColorByProcessingColor:(CGColor *)a3
{
  return CGColorCreateCopy(a3);
}

- (BOOL)expressableByColorFillCheckingOutputBlending:(BOOL)a3
{
  uint64_t v3 = 0;
  unint64_t innerGlowCount = self->_innerGlowCount;
  v14[0] = self->_innerGradientCount;
  v14[1] = innerGlowCount;
  unint64_t outerGlowCount = self->_outerGlowCount;
  v14[2] = self->_innerShadowCount;
  v14[3] = outerGlowCount;
  unint64_t extraShadowCount = self->_extraShadowCount;
  v14[4] = self->_engraveShadowCount;
  v14[5] = extraShadowCount;
  v14[6] = self->_bevelEmbossCount;
  do
  {
    if (v14[v3]) {
      return 0;
    }
    ++v3;
  }
  while (v3 != 7);
  if (a3)
  {
    unint64_t colorOverlayCount = self->_colorOverlayCount;
    if (colorOverlayCount)
    {
      colorOverlaCGFloat y = self->_colorOverlay;
      do
      {
        BOOL result = 0;
        int var0 = colorOverlay->var0;
        ++colorOverlay;
        int v10 = var0;
        if (var0 > 1986227572)
        {
          if (v10 != 1986229103 && v10 != 1986227573) {
            return result;
          }
        }
        else
        {
          if (v10) {
            BOOL v12 = v10 == 1852797549;
          }
          else {
            BOOL v12 = 1;
          }
          if (!v12) {
            return result;
          }
        }
        --colorOverlayCount;
      }
      while (colorOverlayCount);
    }
  }
  return 1;
}

+ (CGColor)newColorByAdjustingLightnessOfColor:(CGColor *)a3 darker:(BOOL)a4
{
  if (!a3) {
    return 0;
  }
  BOOL v4 = a4;
  CopyByMatchingToColorSpace = a3;
  uint64_t SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  CGColorGetColorSpace(CopyByMatchingToColorSpace);
  if (!CGColorSpaceEqualToColorSpace())
  {
    CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(SRGB, kCGRenderingIntentRelativeColorimetric, CopyByMatchingToColorSpace, 0);
    if (CopyByMatchingToColorSpace) {
      goto LABEL_5;
    }
    return 0;
  }
  CGColorRetain(CopyByMatchingToColorSpace);
LABEL_5:
  double v7 = CGColorGetComponents(CopyByMatchingToColorSpace);
  double v8 = *v7;
  double v9 = v7[1];
  double v25 = v9;
  double v26 = v8;
  double v10 = v7[2];
  double v11 = v7[3];
  double v24 = v10;
  double v22 = 0.0;
  double v23 = 0.0;
  double v21 = 0.0;
  if (v4)
  {
    double v20 = v11;
    _CUIRGBToHSB(&v23, &v22, &v21, v8, v9, v10);
    double v23 = fmod(v23 + 0.5, 1.0);
    _CUIHSBToRGB(&v26, &v25, &v24, v23, v22, v21);
    float64x2_t v12 = vmulq_n_f64((float64x2_t)xmmword_1A13A17B0, v25);
    __asm { FMOV            V4.2D, #1.0 }
    *(float64x2_t *)components = vaddq_f64(vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v12, (float64x2_t)xmmword_1A13A17C0, v26), (float64x2_t)vdupq_n_s64(0xBFB6C8B439581062), v24), (float64x2_t)0, v20), _Q4);
    double v28 = v12.f64[0] + v26 * 0.03 + v24 * -0.89 + v20 * 0.0 + 1.0;
    double v29 = v20 + v25 * 0.0 + v26 * 0.0 + v24 * 0.0 + 0.0;
  }
  else
  {
    double v29 = v9 * 0.0 + v8 * 0.0 + v10 * 0.0 + v11 + 0.0;
    double v25 = v9 * -1.347 + v8 * -0.049 + v10 * 0.146 + v11 * 0.0 + 1.25;
    double v26 = v9 * -0.097 + v8 * -1.3 + v10 * 0.147 + v11 * 0.0 + 1.25;
    double v24 = v9 * -0.097 + v8 * -0.049 + v10 * -1.104 + v11 * 0.0 + 1.25;
    _CUIRGBToHSB(&v23, &v22, &v21, v26, v25, v24);
    double v23 = fmod(v23 + 0.5, 1.0);
    _CUIHSBToRGB(&v26, &v25, &v24, v23, v22, v21);
    components[0] = v26;
    components[1] = v25;
    double v28 = v24;
  }
  double v18 = CGColorCreate(SRGB, components);
  CGColorRelease(CopyByMatchingToColorSpace);
  return v18;
}

- (void)setBypassColorFills:(BOOL)a3
{
  self->_bypassColorFills = a3;
}

- (id)cacheKey
{
  unint64_t v2 = ((unint64_t)self->_scalefactor << ((unint64_t)self->_scalefactor & 7))
     + 83
     * (((unint64_t)self->_outputBlendMode << (self->_outputBlendMode & 7))
      + 83
      * (((unint64_t)(float)(self->_outputOpacity * 100.0) << ((unint64_t)(float)(self->_outputOpacity
                                                                                              * 100.0) & 7))
       + 83
       * ((unint64_t)(float)(self->_shapeOpacity * 100.0) << ((unint64_t)(float)(self->_shapeOpacity
                                                                                             * 100.0) & 7))))
     + 47458321;
  unint64_t innerGradientCount = self->_innerGradientCount;
  if (innerGradientCount)
  {
    p_float var4 = &self->_innerGradient->var4;
    do
    {
      unint64_t v5 = (unint64_t)(float)(*(p_var4 - 3) * 255.0);
      unint64_t v6 = (unint64_t)(float)(*(p_var4 - 1) * 255.0);
      unint64_t v2 = ((unint64_t)(float)(p_var4[3] * 100.0) << ((unint64_t)(float)(p_var4[3] * 100.0) & 7))
         + 83
         * (((unint64_t)(float)(p_var4[2] * 255.0) << ((unint64_t)(float)(p_var4[2] * 255.0) & 7))
          + 83
          * (((unint64_t)(float)(p_var4[1] * 255.0) << ((unint64_t)(float)(p_var4[1] * 255.0) & 7))
           + 83
           * (((unint64_t)(float)(*p_var4 * 255.0) << ((unint64_t)(float)(*p_var4 * 255.0) & 7))
            + 83
            * ((v6 << (v6 & 7))
             + 83
             * (((unint64_t)(float)(*(p_var4 - 2) * 255.0) << ((unint64_t)(float)(*(p_var4 - 2) * 255.0) & 7))
              + 83
              * ((v5 << (v5 & 7))
               + 83 * (((unint64_t)*((unsigned int *)p_var4 - 4) << (*(_DWORD *)(p_var4 - 4) & 7)) + 6889 * v2)))))))
         - 0x57DF3F949DCCE1C0;
      p_var4 += 8;
      --innerGradientCount;
    }
    while (innerGradientCount);
  }
  unint64_t colorOverlayCount = self->_colorOverlayCount;
  if (colorOverlayCount)
  {
    p_float var3 = &self->_colorOverlay->var3;
    do
    {
      unint64_t v9 = (unint64_t)(float)(*(p_var3 - 2) * 255.0);
      unint64_t v2 = ((unint64_t)*((unsigned __int8 *)p_var3 + 8) << *((unsigned char *)p_var3 + 8))
         + 83
         * (((unint64_t)(float)(p_var3[1] * 100.0) << ((unint64_t)(float)(p_var3[1] * 100.0) & 7))
          + 83
          * (((unint64_t)(float)(*p_var3 * 255.0) << ((unint64_t)(float)(*p_var3 * 255.0) & 7))
           + 83
           * (((unint64_t)(float)(*(p_var3 - 1) * 255.0) << ((unint64_t)(float)(*(p_var3 - 1) * 255.0) & 7))
            + 83
            * ((v9 << (v9 & 7))
             + 83 * (((unint64_t)*((unsigned int *)p_var3 - 3) << (*(_DWORD *)(p_var3 - 3) & 7)) + 6889 * v2)))))
         + 0x3527352730804F88;
      p_var3 += 6;
      --colorOverlayCount;
    }
    while (colorOverlayCount);
  }
  unint64_t hueSaturationCount = self->_hueSaturationCount;
  if (hueSaturationCount)
  {
    double v11 = &self->_hueSaturation->var3;
    do
    {
      unint64_t v12 = (unint64_t)(float)(*(v11 - 1) * 255.0);
      unint64_t v2 = ((unint64_t)*((unsigned __int8 *)v11 + 9) << *((unsigned char *)v11 + 9))
         + 83
         * (((unint64_t)*((unsigned __int8 *)v11 + 8) << *((unsigned char *)v11 + 8))
          + 83
          * (((unint64_t)(float)(v11[1] * 255.0) << ((unint64_t)(float)(v11[1] * 255.0) & 7))
           + 83
           * (((unint64_t)(float)(*v11 * 255.0) << ((unint64_t)(float)(*v11 * 255.0) & 7))
            + 83
            * ((v12 << (v12 & 7))
             + 83
             * (((unint64_t)*(v11 - 2) << ((unint64_t)*(v11 - 2) & 7))
              + 83
              * (((unint64_t)(*(v11 - 3) * 57.2957795) << ((unint64_t)(*(v11 - 3) * 57.2957795) & 7))
               + 6889 * v2))))))
         + 0x46BEAB24AB6CC108;
      v11 += 6;
      --hueSaturationCount;
    }
    while (hueSaturationCount);
  }
  unint64_t innerGlowCount = self->_innerGlowCount;
  if (innerGlowCount)
  {
    double v14 = &self->_innerGlow->var3;
    do
    {
      uint64_t v15 = *((unsigned int *)v14 - 3);
      float v16 = v14[2];
      unint64_t v2 = ((unint64_t)v16 << ((unint64_t)v16 & 7))
         + 83
         * (((unint64_t)(float)(v14[1] * 100.0) << ((unint64_t)(float)(v14[1] * 100.0) & 7))
          + 83
          * (((unint64_t)(float)(*v14 * 255.0) << ((unint64_t)(float)(*v14 * 255.0) & 7))
           + 83
           * (((unint64_t)(float)(*(v14 - 1) * 255.0) << ((unint64_t)(float)(*(v14 - 1) * 255.0) & 7))
            + 83
            * (((unint64_t)(float)(*(v14 - 2) * 255.0) << ((unint64_t)(float)(*(v14 - 2) * 255.0) & 7))
             + 83 * ((v15 << (v15 & 7)) + 6889 * v2)))))
         + 0x299C35185859F80;
      v14 += 6;
      --innerGlowCount;
    }
    while (innerGlowCount);
  }
  unint64_t innerShadowCount = self->_innerShadowCount;
  if (innerShadowCount)
  {
    p_float var5 = &self->_innerShadow->var5;
    do
    {
      unint64_t v19 = (unint64_t)(float)(*(p_var5 - 4) * 255.0);
      unint64_t v20 = ((unint64_t)p_var5[1] << ((unint64_t)p_var5[1] & 7))
          + 83
          * (((unint64_t)(float)(*p_var5 * 100.0) << ((unint64_t)(float)(*p_var5 * 100.0) & 7))
           + 83
           * (((unint64_t)*(p_var5 - 1) << ((unint64_t)*(p_var5 - 1) & 7))
            + 83
            * (((unint64_t)(float)(*(p_var5 - 2) * 255.0) << ((unint64_t)(float)(*(p_var5 - 2) * 255.0) & 7))
             + 83
             * (((unint64_t)(float)(*(p_var5 - 3) * 255.0) << ((unint64_t)(float)(*(p_var5 - 3) * 255.0) & 7))
              + 83
              * ((v19 << (v19 & 7))
               + 83 * (((unint64_t)*((unsigned int *)p_var5 - 5) << (*(_DWORD *)(p_var5 - 5) & 7)) + 6889 * v2))))));
      unint64_t v21 = (unint64_t)(p_var5[2] * 57.2957795);
      unint64_t v2 = ((unint64_t)*(double *)(p_var5 + 5) << ((unint64_t)*(double *)(p_var5 + 5) & 7))
         + 83
         * (((unint64_t)*(double *)(p_var5 + 3) << ((unint64_t)*(double *)(p_var5 + 3) & 7))
          + 83 * ((v21 << (v21 & 7)) + 83 * v20))
         - 0x173702E434C82958;
      p_var5 += 12;
      --innerShadowCount;
    }
    while (innerShadowCount);
  }
  unint64_t bevelEmbossCount = self->_bevelEmbossCount;
  if (bevelEmbossCount)
  {
    p_float var6 = &self->_emboss->var6;
    do
    {
      unint64_t v24 = (unint64_t)*(p_var6 - 6);
      double v25 = *(p_var6 - 4) * 57.2957795;
      unint64_t v26 = (unint64_t)*(p_var6 - 3);
      unint64_t v27 = (unint64_t)(float)(*(p_var6 - 2) * 255.0);
      unint64_t v28 = (unint64_t)(float)(*(p_var6 - 1) * 255.0);
      unint64_t v29 = (unint64_t)(float)(*p_var6 * 255.0);
      unint64_t v30 = (unint64_t)(float)(p_var6[1] * 100.0);
      unint64_t v31 = (unint64_t)(float)(p_var6[2] * 255.0);
      unint64_t v32 = (unint64_t)(float)(p_var6[3] * 255.0);
      float v33 = p_var6[4];
      unint64_t v2 = ((unint64_t)(float)(p_var6[5] * 100.0) << ((unint64_t)(float)(p_var6[5] * 100.0) & 7))
         + 83
         * (((unint64_t)(float)(v33 * 255.0) << ((unint64_t)(float)(v33 * 255.0) & 7))
          + 83
          * ((v32 << (v32 & 7))
           + 83
           * ((v31 << (v31 & 7))
            + 83
            * ((v30 << (v30 & 7))
             + 83
             * ((v29 << (v29 & 7))
              + 83
              * ((v28 << (v28 & 7))
               + 83
               * ((v27 << (v27 & 7))
                + 83
                * ((v26 << (v26 & 7))
                 + 83
                 * (((unint64_t)v25 << ((unint64_t)v25 & 7))
                  + 83
                  * (((unint64_t)*(p_var6 - 5) << ((unint64_t)*(p_var6 - 5) & 7))
                   + 83
                   * ((v24 << (v24 & 7))
                    + 83 * (((unint64_t)*((unsigned int *)p_var6 + 6) << (p_var6[6] & 7)) + 6889 * v2))))))))))))
         + 0x60D4F8F84CF55FC8;
      p_var6 += 13;
      --bevelEmbossCount;
    }
    while (bevelEmbossCount);
  }
  unint64_t outerGlowCount = self->_outerGlowCount;
  if (outerGlowCount)
  {
    CGRect v35 = &self->_outerGlow->var3;
    do
    {
      unint64_t v36 = (unint64_t)(float)(*(v35 - 3) * 255.0);
      unint64_t v2 = ((unint64_t)v35[2] << ((unint64_t)v35[2] & 7))
         + 83
         * (((unint64_t)v35[1] << ((unint64_t)v35[1] & 7))
          + 83
          * (((unint64_t)(float)(*v35 * 100.0) << ((unint64_t)(float)(*v35 * 100.0) & 7))
           + 83
           * (((unint64_t)(float)(*(v35 - 1) * 255.0) << ((unint64_t)(float)(*(v35 - 1) * 255.0) & 7))
            + 83
            * (((unint64_t)(float)(*(v35 - 2) * 255.0) << ((unint64_t)(float)(*(v35 - 2) * 255.0) & 7))
             + 83 * ((v36 << (v36 & 7)) + 6889 * v2)))))
         + 0x601857BC85859F80;
      v35 += 6;
      --outerGlowCount;
    }
    while (outerGlowCount);
  }
  unint64_t engraveShadowCount = self->_engraveShadowCount;
  if (engraveShadowCount)
  {
    float v38 = &self->_engraveShadow->var5;
    do
    {
      unint64_t v39 = (unint64_t)(float)(*(v38 - 5) * 255.0);
      float v40 = *(v38 - 2);
      float v41 = v38[1];
      unint64_t v42 = ((unint64_t)v41 << ((unint64_t)v41 & 7))
          + 83
          * (((unint64_t)*v38 << ((unint64_t)*v38 & 7))
           + 83
           * (((unint64_t)(float)(v40 * 100.0) << ((unint64_t)(float)(v40 * 100.0) & 7))
            + 83
            * (((unint64_t)*(v38 - 1) << ((unint64_t)*(v38 - 1) & 7))
             + 83
             * (((unint64_t)(float)(*(v38 - 3) * 255.0) << ((unint64_t)(float)(*(v38 - 3) * 255.0) & 7))
              + 83
              * (((unint64_t)(float)(*(v38 - 4) * 255.0) << ((unint64_t)(float)(*(v38 - 4) * 255.0) & 7))
               + 83 * ((v39 << (v39 & 7)) + 6889 * v2))))));
      unint64_t v43 = (unint64_t)(v38[2] * 57.2957795);
      unint64_t v2 = ((unint64_t)*(double *)(v38 + 5) << ((unint64_t)*(double *)(v38 + 5) & 7))
         + 83
         * (((unint64_t)*(double *)(v38 + 3) << ((unint64_t)*(double *)(v38 + 3) & 7))
          + 83 * ((v43 << (v43 & 7)) + 83 * v42))
         - 0x4B7B6CDC8A65A510;
      v38 += 12;
      --engraveShadowCount;
    }
    while (engraveShadowCount);
  }
  unint64_t extraShadowCount = self->_extraShadowCount;
  if (extraShadowCount)
  {
    unint64_t v45 = &self->_extraShadow->var5;
    do
    {
      unint64_t v46 = (unint64_t)(float)(*(v45 - 5) * 255.0);
      float v47 = *(v45 - 2);
      float v48 = v45[1];
      unint64_t v49 = ((unint64_t)v48 << ((unint64_t)v48 & 7))
          + 83
          * (((unint64_t)*v45 << ((unint64_t)*v45 & 7))
           + 83
           * (((unint64_t)(float)(v47 * 100.0) << ((unint64_t)(float)(v47 * 100.0) & 7))
            + 83
            * (((unint64_t)*(v45 - 1) << ((unint64_t)*(v45 - 1) & 7))
             + 83
             * (((unint64_t)(float)(*(v45 - 3) * 255.0) << ((unint64_t)(float)(*(v45 - 3) * 255.0) & 7))
              + 83
              * (((unint64_t)(float)(*(v45 - 4) * 255.0) << ((unint64_t)(float)(*(v45 - 4) * 255.0) & 7))
               + 83 * ((v46 << (v46 & 7)) + 6889 * v2))))));
      unint64_t v50 = (unint64_t)(v45[2] * 57.2957795);
      unint64_t v2 = ((unint64_t)*(double *)(v45 + 5) << ((unint64_t)*(double *)(v45 + 5) & 7))
         + 83
         * (((unint64_t)*(double *)(v45 + 3) << ((unint64_t)*(double *)(v45 + 3) & 7))
          + 83 * ((v50 << (v50 & 7)) + 83 * v49))
         + 0x7196D2C630712CD2;
      v45 += 12;
      --extraShadowCount;
    }
    while (extraShadowCount);
  }
  return objc_msgSend(@"com.apple.CoreUI.ShapeEffectStack.", "stringByAppendingFormat:", @"%lu", v2);
}

- (unsigned)outputBlendMode
{
  return self->_outputBlendMode;
}

- (float)shapeOpacity
{
  return self->_shapeOpacity;
}

- (float)outputOpacity
{
  return self->_outputOpacity;
}

- (unint64_t)hueSaturationCount
{
  return self->_hueSaturationCount;
}

- ($69725AE9E2C336799B3330C9F2B37222)hueSaturation
{
  return self->_hueSaturation;
}

- (unint64_t)colorOverlayCount
{
  return self->_colorOverlayCount;
}

- (void)setColorOverlayCount:(unint64_t)a3
{
  self->_unint64_t colorOverlayCount = a3;
}

- ($EB69DF3B1DDA5C6930A5C79FD1E30C08)colorOverlay
{
  return self->_colorOverlay;
}

- (unint64_t)innerGradientCount
{
  return self->_innerGradientCount;
}

- (void)setInnerGradientCount:(unint64_t)a3
{
  self->_unint64_t innerGradientCount = a3;
}

- ($45A57A840939F8DA3264B2B8C70AC12D)innerGradient
{
  return self->_innerGradient;
}

- (unint64_t)innerGlowCount
{
  return self->_innerGlowCount;
}

- (void)setInnerGlowCount:(unint64_t)a3
{
  self->_unint64_t innerGlowCount = a3;
}

- ($B9DFBB3EC52729005FFFDFFACDA0AF43)innerGlow
{
  return self->_innerGlow;
}

- (unint64_t)innerShadowCount
{
  return self->_innerShadowCount;
}

- (void)setInnerShadowCount:(unint64_t)a3
{
  self->_unint64_t innerShadowCount = a3;
}

- ($C07A9C4F79504F2E326AD5E2BA2D7579)innerShadow
{
  return self->_innerShadow;
}

- (unint64_t)outerGlowCount
{
  return self->_outerGlowCount;
}

- ($9A3F6720D51884C1BD061C340F5007EE)outerGlow
{
  return self->_outerGlow;
}

- (unint64_t)engraveShadowCount
{
  return self->_engraveShadowCount;
}

- (void)setEngraveShadowCount:(unint64_t)a3
{
  self->_unint64_t engraveShadowCount = a3;
}

- ($1DE4C1FD5A12EFAE99762DD70974AA56)engraveShadow
{
  return self->_engraveShadow;
}

- (unint64_t)extraShadowCount
{
  return self->_extraShadowCount;
}

- ($1DE4C1FD5A12EFAE99762DD70974AA56)extraShadow
{
  return self->_extraShadow;
}

- (unint64_t)bevelEmbossCount
{
  return self->_bevelEmbossCount;
}

- ($E0EE018EFC1CA26785F52D94F92F8253)emboss
{
  return self->_emboss;
}

- (float)scalefactor
{
  return self->_scalefactor;
}

- (int)renderStrategy
{
  return self->_renderStrategy;
}

@end