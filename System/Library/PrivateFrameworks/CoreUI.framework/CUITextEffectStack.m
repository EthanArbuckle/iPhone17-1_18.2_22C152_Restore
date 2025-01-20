@interface CUITextEffectStack
- (BOOL)useCoreImageRendering;
- (CGColor)newBackgroundPatternColorWithSize:(CGSize)a3 contentScale:(double)a4 forContext:(CGContext *)a5;
- (CGContext)newGlyphMaskContextForBounds:(CGRect)a3 fromContext:(CGContext *)a4 withScale:(double)a5;
- (CUITextEffectStack)initWithEffectPreset:(id)a3;
- (double)effectiveInteriorFillOpacity;
- (void)_drawShadow:(id *)a3 forGlyphs:(const unsigned __int16 *)a4 inContext:(CGContext *)a5 usingFont:(__CTFont *)a6 atPositions:(const CGPoint *)a7 count:(unint64_t)a8;
- (void)_drawShadow:(id *)a3 forGlyphs:(const unsigned __int16 *)a4 inContext:(CGContext *)a5 usingFont:(__CTFont *)a6 withAdvances:(const CGSize *)a7 count:(unint64_t)a8;
- (void)_drawShadow:(id *)a3 usingQuartz:(id)a4 inContext:(CGContext *)a5;
- (void)drawGlyphs:(const unsigned __int16 *)a3 inContext:(CGContext *)a4 usingFont:(__CTFont *)a5 atPositions:(const CGPoint *)a6 count:(unint64_t)a7 lineHeight:(double)a8 inBounds:(CGRect)a9 atScale:(double)a10;
- (void)drawGlyphs:(const unsigned __int16 *)a3 inContext:(CGContext *)a4 usingFont:(__CTFont *)a5 withAdvances:(const CGSize *)a6 count:(unint64_t)a7 lineHeight:(double)a8 inBounds:(CGRect)a9 atScale:(double)a10;
- (void)drawProcessedMask:(CGContext *)a3 atBounds:(CGRect)a4 inContext:(CGContext *)a5 withScale:(double)a6;
- (void)drawUsingQuartz:(id)a3 inContext:(CGContext *)a4 inBounds:(CGRect)a5 atScale:(double)a6;
@end

@implementation CUITextEffectStack

- (CUITextEffectStack)initWithEffectPreset:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)CUITextEffectStack;
  v4 = -[CUIShapeEffectStack initWithEffectPreset:](&v14, sel_initWithEffectPreset_);
  v5 = v4;
  if (v4)
  {
    BOOL v6 = [(CUIShapeEffectStack *)v4 hasInnerGlow]
      || [(CUIShapeEffectStack *)v5 hasInnerShadow]
      || [(CUIShapeEffectStack *)v5 hasOuterGlow]
      || [(CUIShapeEffectStack *)v5 hasBevelEmboss]
      || [(CUIShapeEffectStack *)v5 hasHueSaturation];
    *(&v5->super._bypassColorFills + 1) = v6;
    [a3 minimumShadowSpread];
    if (!*(&v5->super._bypassColorFills + 1))
    {
      float v8 = v7;
      if ([(CUIShapeEffectStack *)v5 engraveShadowCount]
        && [(CUIShapeEffectStack *)v5 engraveShadowCount])
      {
        unint64_t v9 = 0;
        uint64_t v10 = 20;
        while (*(float *)((char *)[(CUIShapeEffectStack *)v5 engraveShadow] + v10) <= v8)
        {
          ++v9;
          v10 += 48;
          if (v9 >= [(CUIShapeEffectStack *)v5 engraveShadowCount]) {
            goto LABEL_13;
          }
        }
        goto LABEL_20;
      }
LABEL_13:
      if (!*(&v5->super._bypassColorFills + 1)
        && [(CUIShapeEffectStack *)v5 extraShadowCount]
        && [(CUIShapeEffectStack *)v5 extraShadowCount])
      {
        uint64_t v11 = 0;
        for (uint64_t i = 20; *(float *)((char *)[(CUIShapeEffectStack *)v5 extraShadow] + i) <= v8; i += 48)
        {
          if (++v11 >= [(CUIShapeEffectStack *)v5 extraShadowCount]) {
            return v5;
          }
        }
LABEL_20:
        *(&v5->super._bypassColorFills + 1) = 1;
      }
    }
  }
  return v5;
}

- (BOOL)useCoreImageRendering
{
  return *(&self->super._bypassColorFills + 1);
}

- (double)effectiveInteriorFillOpacity
{
  double v3 = 0.0;
  if ([(CUIShapeEffectStack *)self hasInnerGradient])
  {
    [(CUIShapeEffectStack *)self innerGradientOpacity];
    double v3 = v4;
  }
  if (![(CUIShapeEffectStack *)self hasColorOverlay]) {
    return v3;
  }
  [(CUIShapeEffectStack *)self colorOverlayOpacity];
  return v5 + v3 * (float)(1.0 - v5);
}

- (CGColor)newBackgroundPatternColorWithSize:(CGSize)a3 contentScale:(double)a4 forContext:(CGContext *)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  CGFloat v9 = a3.width * a4;
  CGFloat v10 = a3.height * a4;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  objc_super v14 = CUICGBitmapContextCreate((unint64_t)v9, (unint64_t)v10, 8uLL, 0, SRGB, 8194, v12, v13);
  if (v14)
  {
    v15 = v14;
    CGContextScaleCTM(v14, a4, a4);
    if ([(CUIShapeEffectStack *)self hasInnerGradient])
    {
      unint64_t v16 = [(CUIShapeEffectStack *)self innerGlowCount];
      if (v16)
      {
        uint64_t v17 = 0;
        do
        {
          components.a = *(float *)((char *)[(CUIShapeEffectStack *)self innerGradient]+ v17+ 4);
          components.b = *(float *)((char *)[(CUIShapeEffectStack *)self innerGradient] + v17 + 8);
          components.c = *(float *)((char *)[(CUIShapeEffectStack *)self innerGradient] + v17 + 12);
          components.d = *(float *)((char *)[(CUIShapeEffectStack *)self innerGradient] + v17 + 28);
          components.tx = *(float *)((char *)[(CUIShapeEffectStack *)self innerGradient] + v17 + 16);
          components.ty = *(float *)((char *)[(CUIShapeEffectStack *)self innerGradient] + v17 + 20);
          double v32 = *(float *)((char *)[(CUIShapeEffectStack *)self innerGradient] + v17 + 24);
          double v33 = *(float *)((char *)[(CUIShapeEffectStack *)self innerGradient] + v17 + 28);
          v18 = CGGradientCreateWithColorComponents(SRGB, &components.a, 0, 2uLL);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v28 = 0u;
          CGContextGetBaseCTM();
          v34.x = 0.0;
          v35.x = 0.0;
          v35.y = 0.0;
          v34.y = height;
          CGContextDrawLinearGradient(v15, v18, v34, v35, 3u);
          CGGradientRelease(v18);
          v17 += 32;
          --v16;
        }
        while (v16);
      }
    }
    if ([(CUIShapeEffectStack *)self hasColorOverlay])
    {
      unint64_t v21 = [(CUIShapeEffectStack *)self colorOverlayCount];
      if (v21)
      {
        unint64_t v22 = v21;
        uint64_t v23 = 0;
        do
        {
          components.a = *(float *)((char *)[(CUIShapeEffectStack *)self colorOverlay] + v23 + 4);
          components.b = *(float *)((char *)[(CUIShapeEffectStack *)self colorOverlay] + v23 + 8);
          components.c = *(float *)((char *)[(CUIShapeEffectStack *)self colorOverlay] + v23 + 12);
          components.d = *(float *)((char *)[(CUIShapeEffectStack *)self colorOverlay] + v23 + 16);
          CGContextSetFillColorSpace(v15, SRGB);
          CGContextSetFillColor(v15, &components.a);
          v36.origin.x = 0.0;
          v36.origin.y = 0.0;
          v36.size.CGFloat width = width;
          v36.size.CGFloat height = height;
          CGContextFillRect(v15, v36);
          v23 += 24;
          --v22;
        }
        while (v22);
      }
    }
    Image = CGBitmapContextCreateImage(v15);
    memset(&components, 0, sizeof(components));
    CGAffineTransformMakeScale(&components, 1.0 / a4, 1.0 / a4);
    *((void *)&v28 + 1) = *(void *)&components.b;
    long long v29 = *(_OWORD *)&components.c;
    long long v30 = *(_OWORD *)&components.tx;
    v25 = (CGPattern *)CGPatternCreateWithImage2();
    Pattern = CGColorSpaceCreatePattern(0);
    *(void *)&long long v28 = 0x3FF0000000000000;
    v20 = CGColorCreateWithPattern(Pattern, v25, (const CGFloat *)&v28);
    CGColorSpaceRelease(Pattern);
    CGPatternRelease(v25);
    CGImageRelease(Image);
    CGContextRelease(v15);
  }
  else
  {
    DeviceGray = CGColorSpaceCreateDeviceGray();
    *(_OWORD *)&components.a = xmmword_1A139EBD0;
    v20 = CGColorCreate(DeviceGray, &components.a);
    CGColorSpaceRelease(DeviceGray);
  }
  return v20;
}

- (CGContext)newGlyphMaskContextForBounds:(CGRect)a3 fromContext:(CGContext *)a4 withScale:(double)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  memset(&v30, 0, sizeof(v30));
  CGContextGetCTM(&v30, a4);
  CGAffineTransform v29 = v30;
  CGAffineTransform v28 = v30;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGRect v33 = CGRectApplyAffineTransform(v32, &v28);
  CGRect v34 = CGRectIntegral(v33);
  double v10 = v34.origin.x;
  double v11 = v34.origin.y;
  double v12 = v34.size.width;
  double v13 = v34.size.height;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  uint64_t v17 = CUICGBitmapContextCreate((unint64_t)v12, (unint64_t)v13, 8uLL, vcvtd_n_u64_f64(v12, 2uLL), SRGB, 8194, v15, v16);
  memset(&v28, 0, sizeof(v28));
  CGAffineTransformMakeTranslation(&v28, -v10, -v11);
  CGAffineTransform t1 = v29;
  CGAffineTransform t2 = v28;
  memset(&v27, 0, sizeof(v27));
  CGAffineTransformConcat(&v27, &t1, &t2);
  CGAffineTransform t1 = v27;
  CGContextConcatCTM(v17, &t1);
  CGPoint TextPosition = CGContextGetTextPosition(a4);
  CGContextSetTextPosition(v17, TextPosition.x, TextPosition.y);
  CGContextGetTextMatrix(&v25, a4);
  CGContextSetTextMatrix(v17, &v25);
  Font = (CGFont *)CGContextGetFont();
  CGContextSetFont(v17, Font);
  CGContextGetFontSize();
  CGContextSetFontSize(v17, v20);
  CGContextGetCharacterSpacing();
  CGContextSetCharacterSpacing(v17, v21);
  CGContextGetFontRenderingStyle();
  CGContextSetFontRenderingStyle();
  CGContextSetShouldSmoothFonts(v17, 0);
  CGContextSetFontAntialiasingStyle();
  CGContextSetGrayFillColor(v17, 0.0, 1.0);
  CGContextSetAlpha(v17, 1.0);
  CGContextSetCompositeOperation();
  DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
  *(_OWORD *)&t1.a = xmmword_1A13A1730;
  uint64_t v23 = CGColorCreate(DeviceGray, &t1.a);
  CGContextSetFontSmoothingBackgroundColor();
  CGColorRelease(v23);
  CGColorSpaceRelease(DeviceGray);
  return v17;
}

- (void)drawProcessedMask:(CGContext *)a3 atBounds:(CGRect)a4 inContext:(CGContext *)a5 withScale:(double)a6
{
  double Width = (double)CGBitmapContextGetWidth(a3);
  double Height = (double)CGBitmapContextGetHeight(a3);
  size_t BytesPerRow = CGBitmapContextGetBytesPerRow(a3);
  id v13 = [objc_alloc((Class)NSData) initWithBytesNoCopy:CGBitmapContextGetData(a3) length:(unint64_t)(Height * (double)BytesPerRow) freeWhenDone:0];
  uint64_t v14 = kCIFormatBGRA8;
  id v15 = objc_alloc((Class)CIImage);
  uint64_t v46 = kCIImageEdgesAreClear;
  v47 = &__kCFBooleanTrue;
  id v16 = objc_msgSend(v15, "initWithBitmapData:bytesPerRow:size:format:options:", v13, BytesPerRow, v14, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1), Width, Height);

  memset(&v45, 0, sizeof(v45));
  CGContextGetCTM(&v45, a3);
  id v17 = [(CUIShapeEffectStack *)self processedImageFromShapeImage:v16 withScale:v45.d > 0.0 invertShadows:a6];
  [(CUIShapeEffectStack *)self effectPaddingWithScale:a6];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [v16 extent];
  CGFloat v27 = v23 + v26;
  CGFloat v29 = v25 + v28;
  id v30 = [(id)objc_opt_class() sharedCIContext];
  memset(&v44, 0, sizeof(v44));
  CGContextGetCTM(&v43, a3);
  CGAffineTransformInvert(&v44, &v43);
  CGAffineTransform v42 = v44;
  v48.origin.CGFloat x = v19;
  v48.origin.CGFloat y = v21;
  v48.size.CGFloat width = v27;
  v48.size.CGFloat height = v29;
  CGRect v49 = CGRectApplyAffineTransform(v48, &v42);
  CGFloat x = v49.origin.x;
  CGFloat y = v49.origin.y;
  CGFloat v33 = v49.size.width;
  CGFloat v34 = v49.size.height;
  CGPoint v35 = (CGImage *)objc_msgSend(v30, "createCGImage:fromRect:", v17, v19, v21, v27, v29);
  CGContextSaveGState(a5);
  memset(&v42, 0, sizeof(v42));
  CGContextGetCTM(&v42, a5);
  CGAffineTransform v40 = v42;
  CGAffineTransformInvert(&transform, &v40);
  CGContextConcatCTM(a5, &transform);
  CGAffineTransform v40 = v42;
  v50.origin.CGFloat x = x;
  v50.origin.CGFloat y = y;
  v50.size.CGFloat width = v33;
  v50.size.CGFloat height = v34;
  CGRect v51 = CGRectApplyAffineTransform(v50, &v40);
  CGFloat v36 = v51.origin.x;
  CGFloat v37 = v51.origin.y;
  CGFloat v38 = v51.size.width;
  CGFloat v39 = v51.size.height;
  if ([(CUIShapeEffectStack *)self outputBlendMode]) {
    CGContextSetBlendMode(a5, (CGBlendMode)[(CUIShapeEffectStack *)self cgBlendModeForOutputBlending]);
  }
  v52.origin.CGFloat x = v36;
  v52.origin.CGFloat y = v37;
  v52.size.CGFloat width = v38;
  v52.size.CGFloat height = v39;
  CGContextDrawImage(a5, v52, v35);
  CGContextRestoreGState(a5);
  CGImageRelease(v35);
}

- (void)_drawShadow:(id *)a3 forGlyphs:(const unsigned __int16 *)a4 inContext:(CGContext *)a5 usingFont:(__CTFont *)a6 withAdvances:(const CGSize *)a7 count:(unint64_t)a8
{
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  float64x2_t v12 = vcvtq_f64_f32(*(float32x2_t *)&a3->var0);
  float64x2_t v13 = vcvtq_f64_f32(*(float32x2_t *)&a3->var2);
  *(float64x2_t *)CGAffineTransform components = v12;
  float64x2_t v35 = v13;
  v12.f64[0] = a3->var8.x;
  int8x16_t v23 = (int8x16_t)v12;
  v12.f64[0] = a3->var8.y;
  int8x16_t v21 = (int8x16_t)v12;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  CGContextGetBaseCTM();
  *(double *)v14.i64 = -(*(double *)v21.i64 * 0.0) - 0.0 * *(double *)v23.i64;
  v15.i64[0] = v14.i64[0];
  v16.f64[0] = NAN;
  v16.f64[1] = NAN;
  int8x16_t v17 = (int8x16_t)vnegq_f64(v16);
  *(void *)&CGFloat v24 = vbslq_s8(v17, v23, v14).u64[0];
  *(void *)&CGFloat v22 = vbslq_s8(v17, v21, v15).u64[0];
  if (a3->var4 <= 0.0)
  {
    CGContextSetFillColorSpace(a5, SRGB);
    CGContextSetFillColor(a5, components);
    memset(&v30, 0, sizeof(v30));
    CGContextGetCTM(&v30, a5);
    CGAffineTransform v28 = v30;
    CGAffineTransformInvert(&transform, &v28);
    CGContextConcatCTM(a5, &transform);
    CGContextGetBaseCTM();
    CGContextConcatCTM(a5, &v27);
    CGContextTranslateCTM(a5, v24, v22);
    CGContextGetBaseCTM();
    CGAffineTransformInvert(&v26, &v25);
    CGContextConcatCTM(a5, &v26);
    CGAffineTransform v28 = v30;
    CGContextConcatCTM(a5, &v28);
    CGContextTranslateCTM(a5, v24, v22);
    CGPoint TextPosition = CGContextGetTextPosition(a5);
    CTFontDrawGlyphsWithAdvances();
    CGAffineTransform v28 = v30;
    CGContextSetCTM();
    CGContextSetTextPosition(a5, TextPosition.x, TextPosition.y);
  }
  else
  {
    v35.f64[1] = a3->var3;
    double v18 = CGColorCreate(SRGB, components);
    CGStyleCreateShadow2();
    uint64_t Style = CGContextGetStyle();
    if ([(CUIShapeEffectStack *)self hasEngraveShadow])
    {
      if (Style) {
        CTFontDrawGlyphsWithAdvances();
      }
    }
    CGContextSetStyle();
    v35.f64[1] = a3->var3;
    CGContextSetFillColorSpace(a5, SRGB);
    CGContextSetFillColor(a5, components);
    CGStyleRelease();
    CGColorRelease(v18);
  }
}

- (void)drawGlyphs:(const unsigned __int16 *)a3 inContext:(CGContext *)a4 usingFont:(__CTFont *)a5 withAdvances:(const CGSize *)a6 count:(unint64_t)a7 lineHeight:(double)a8 inBounds:(CGRect)a9 atScale:(double)a10
{
  double height = a9.size.height;
  CGFloat width = a9.size.width;
  CGFloat y = a9.origin.y;
  CGFloat x = a9.origin.x;
  [(CUIShapeEffectStack *)self scalefactor];
  if (v21 != a10) {
    [(CUIShapeEffectStack *)self scaleEffectParametersBy:a10];
  }
  if ([(CUITextEffectStack *)self useCoreImageRendering])
  {
    v54.origin.CGFloat x = x;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    v54.size.double height = height;
    CGRect v55 = CGRectInset(v54, -2.0, -2.0);
    double v22 = v55.origin.x;
    double v23 = v55.origin.y;
    double v24 = v55.size.width;
    double v25 = v55.size.height;
    CGAffineTransform v26 = -[CUITextEffectStack newGlyphMaskContextForBounds:fromContext:withScale:](self, "newGlyphMaskContextForBounds:fromContext:withScale:", a4);
    CTFontDrawGlyphsWithAdvances();
    -[CUITextEffectStack drawProcessedMask:atBounds:inContext:withScale:](self, "drawProcessedMask:atBounds:inContext:withScale:", v26, a4, v22, v23, v24, v25, a10);
    CGContextRelease(v26);
  }
  else
  {
    CGAffineTransform v27 = -[CUITextEffectStack newBackgroundPatternColorWithSize:contentScale:forContext:](self, "newBackgroundPatternColorWithSize:contentScale:forContext:", a4, 10.0, height, a10);
    CGContextSaveGState(a4);
    if ([(CUIShapeEffectStack *)self hasEngraveShadow])
    {
      unint64_t v28 = [(CUIShapeEffectStack *)self engraveShadowCount];
      if (v28)
      {
        unint64_t v29 = v28;
        uint64_t v30 = 0;
        do
        {
          long long v31 = [(CUIShapeEffectStack *)self engraveShadow];
          long long v32 = *(_OWORD *)&v31[v30].var0;
          CGPoint var8 = v31[v30].var8;
          *(_OWORD *)&v51.c = *(_OWORD *)&v31[v30].var4;
          *(CGPoint *)&v51.tCGFloat x = var8;
          *(_OWORD *)&v51.a = v32;
          [(CUITextEffectStack *)self _drawShadow:&v51 forGlyphs:a3 inContext:a4 usingFont:a5 withAdvances:a6 count:a7];
          ++v30;
          --v29;
        }
        while (v29);
      }
    }
    if ([(CUIShapeEffectStack *)self hasExtraShadow])
    {
      unint64_t v34 = [(CUIShapeEffectStack *)self extraShadowCount];
      if (v34)
      {
        unint64_t v35 = v34;
        uint64_t v36 = 0;
        do
        {
          CGFloat v37 = [(CUIShapeEffectStack *)self extraShadow];
          long long v38 = *(_OWORD *)&v37[v36].var0;
          CGPoint v39 = v37[v36].var8;
          *(_OWORD *)&v51.c = *(_OWORD *)&v37[v36].var4;
          *(CGPoint *)&v51.tCGFloat x = v39;
          *(_OWORD *)&v51.a = v38;
          [(CUITextEffectStack *)self _drawShadow:&v51 forGlyphs:a3 inContext:a4 usingFont:a5 withAdvances:a6 count:a7];
          ++v36;
          --v35;
        }
        while (v35);
      }
    }
    memset(&v51, 0, sizeof(v51));
    CGContextGetCTM(&v51, a4);
    CGFloat v40 = v51.d - fabs(v51.d);
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.double height = height;
    double MinX = CGRectGetMinX(v56);
    CGFloat v42 = x;
    CGFloat v43 = y;
    CGFloat v44 = width;
    double v45 = height;
    if (v40 >= 0.0) {
      double MinY = CGRectGetMinY(*(CGRect *)&v42);
    }
    else {
      double MinY = CGRectGetMaxY(*(CGRect *)&v42);
    }
    CGFloat v47 = v51.tx + MinY * v51.c + v51.a * MinX;
    CGFloat v48 = v51.ty + MinY * v51.d + v51.b * MinX;
    CGContextGetBaseCTM();
    CGAffineTransformInvert(&v50, &v49);
    v53.double height = v50.ty + v48 * v50.d + v50.b * v47;
    v53.CGFloat width = 0.0;
    CGContextSetPatternPhase(a4, v53);
    CGContextSetFillColorWithColor(a4, v27);
    if ([(CUIShapeEffectStack *)self outputBlendMode]) {
      CGContextSetBlendMode(a4, (CGBlendMode)[(CUIShapeEffectStack *)self cgBlendModeForOutputBlending]);
    }
    CTFontDrawGlyphsWithAdvances();
    CGColorRelease(v27);
    CGContextRestoreGState(a4);
  }
}

- (void)_drawShadow:(id *)a3 forGlyphs:(const unsigned __int16 *)a4 inContext:(CGContext *)a5 usingFont:(__CTFont *)a6 atPositions:(const CGPoint *)a7 count:(unint64_t)a8
{
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  float64x2_t v12 = vcvtq_f64_f32(*(float32x2_t *)&a3->var2);
  *(float64x2_t *)CGAffineTransform components = vcvtq_f64_f32(*(float32x2_t *)&a3->var0);
  float64x2_t v30 = v12;
  double x = a3->var8.x;
  double y = a3->var8.y;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  CGContextGetBaseCTM();
  memset(&v25, 0, sizeof(v25));
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformInvert(&v25, &v24);
  double v15 = -(y * v25.c) - v25.a * x;
  double v16 = -(y * v25.d) - v25.b * x;
  if (a3->var4 <= 0.0)
  {
    CGContextSetFillColorSpace(a5, SRGB);
    CGContextSetFillColor(a5, components);
    memset(&v24, 0, sizeof(v24));
    CGContextGetCTM(&v24, a5);
    CGAffineTransform v22 = v24;
    CGAffineTransformInvert(&transform, &v22);
    CGContextConcatCTM(a5, &transform);
    CGContextGetBaseCTM();
    CGContextConcatCTM(a5, &v21);
    CGContextTranslateCTM(a5, v15, v16);
    CGContextGetBaseCTM();
    CGAffineTransformInvert(&v20, &v19);
    CGContextConcatCTM(a5, &v20);
    CGAffineTransform v22 = v24;
    CGContextConcatCTM(a5, &v22);
    CTFontDrawGlyphsAtPositions();
    CGAffineTransform v22 = v24;
    CGContextSetCTM();
  }
  else
  {
    v30.f64[1] = a3->var3;
    int8x16_t v17 = CGColorCreate(SRGB, components);
    CGStyleCreateShadow2();
    uint64_t Style = CGContextGetStyle();
    if ([(CUIShapeEffectStack *)self hasEngraveShadow])
    {
      if (Style) {
        CTFontDrawGlyphsAtPositions();
      }
    }
    CGContextSetStyle();
    v30.f64[1] = a3->var3;
    CGContextSetFillColorSpace(a5, SRGB);
    CGContextSetFillColor(a5, components);
    CGStyleRelease();
    CGColorRelease(v17);
  }
}

- (void)drawGlyphs:(const unsigned __int16 *)a3 inContext:(CGContext *)a4 usingFont:(__CTFont *)a5 atPositions:(const CGPoint *)a6 count:(unint64_t)a7 lineHeight:(double)a8 inBounds:(CGRect)a9 atScale:(double)a10
{
  double height = a9.size.height;
  CGFloat width = a9.size.width;
  CGFloat y = a9.origin.y;
  CGFloat x = a9.origin.x;
  [(CUIShapeEffectStack *)self scalefactor];
  if (v21 != a10) {
    [(CUIShapeEffectStack *)self scaleEffectParametersBy:a10];
  }
  __int16 SymbolicTraits = CTFontGetSymbolicTraits(a5);
  if ((SymbolicTraits & 0x2000) != 0)
  {
    [(CUIShapeEffectStack *)self setInnerGradientCount:0];
    [(CUIShapeEffectStack *)self setInnerShadowCount:0];
    [(CUIShapeEffectStack *)self setInnerGlowCount:0];
    [(CUIShapeEffectStack *)self setColorOverlayCount:0];
    if ([(CUIShapeEffectStack *)self hasEngraveShadow])
    {
      unint64_t v23 = [(CUIShapeEffectStack *)self engraveShadowCount];
      if (v23)
      {
        unint64_t v24 = v23;
        uint64_t v25 = 28;
        while (fabs(*(float *)((char *)[(CUIShapeEffectStack *)self engraveShadow] + v25) + -1.57079633) <= 0.00100000005)
        {
          v25 += 48;
          if (!--v24) {
            goto LABEL_9;
          }
        }
      }
      else
      {
LABEL_9:
        [(CUIShapeEffectStack *)self setEngraveShadowCount:0];
      }
    }
    [(CUIShapeEffectStack *)self _updateRenderStrategyFromEffect:1148350320];
  }
  if ([(CUITextEffectStack *)self useCoreImageRendering])
  {
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    v60.size.CGFloat width = width;
    v60.size.double height = height;
    CGRect v61 = CGRectInset(v60, -2.0, -2.0);
    double v26 = v61.origin.x;
    double v27 = v61.origin.y;
    double v28 = v61.size.width;
    double v29 = v61.size.height;
    float64x2_t v30 = -[CUITextEffectStack newGlyphMaskContextForBounds:fromContext:withScale:](self, "newGlyphMaskContextForBounds:fromContext:withScale:", a4);
    CTFontDrawGlyphsAtPositions();
    -[CUITextEffectStack drawProcessedMask:atBounds:inContext:withScale:](self, "drawProcessedMask:atBounds:inContext:withScale:", v30, a4, v26, v27, v28, v29, a10);
    CGContextRelease(v30);
    if ((SymbolicTraits & 0x2000) != 0)
    {
      CTFontDrawGlyphs(a5, a3, a6, a7, a4);
    }
  }
  else
  {
    if ([(CUIShapeEffectStack *)self hasInnerGradient])
    {
      FillColorAsColor = -[CUITextEffectStack newBackgroundPatternColorWithSize:contentScale:forContext:](self, "newBackgroundPatternColorWithSize:contentScale:forContext:", a4, 10.0, height, a10);
    }
    else
    {
      FillColorAsColor = (CGColor *)CGContextGetFillColorAsColor();
      CGColorRetain(FillColorAsColor);
      if ([(CUIShapeEffectStack *)self hasColorOverlay])
      {
        long long v32 = [(CUIShapeEffectStack *)self newColorByProcessingColor:FillColorAsColor];
        if (v32)
        {
          long long v33 = v32;
          CGColorRelease(FillColorAsColor);
          FillColorAsColor = v33;
        }
      }
    }
    CGContextSaveGState(a4);
    if (_CUIDebugUseSimplifiedTextAntialiasing())
    {
      CGContextSetShouldSmoothFonts(a4, 0);
      CGContextSetFontAntialiasingStyle();
      DeviceGraCGFloat y = CGColorSpaceCreateDeviceGray();
      *(_OWORD *)&components.a = xmmword_1A13A1730;
      unint64_t v35 = CGColorCreate(DeviceGray, &components.a);
      CGContextSetFontSmoothingBackgroundColor();
      CGColorRelease(v35);
      CGColorSpaceRelease(DeviceGray);
    }
    [(CUIShapeEffectStack *)self outputOpacity];
    if (v36 < 1.0)
    {
      [(CUIShapeEffectStack *)self outputOpacity];
      CGContextSetAlpha(a4, v37);
    }
    if ([(CUIShapeEffectStack *)self hasEngraveShadow])
    {
      unint64_t v38 = [(CUIShapeEffectStack *)self engraveShadowCount];
      if (v38)
      {
        unint64_t v39 = v38;
        uint64_t v40 = 0;
        do
        {
          v41 = [(CUIShapeEffectStack *)self engraveShadow];
          long long v42 = *(_OWORD *)&v41[v40].var0;
          CGPoint var8 = v41[v40].var8;
          *(_OWORD *)&components.c = *(_OWORD *)&v41[v40].var4;
          *(CGPoint *)&components.tCGFloat x = var8;
          *(_OWORD *)&components.a = v42;
          [(CUITextEffectStack *)self _drawShadow:&components forGlyphs:a3 inContext:a4 usingFont:a5 atPositions:a6 count:a7];
          ++v40;
          --v39;
        }
        while (v39);
      }
    }
    if ([(CUIShapeEffectStack *)self hasExtraShadow])
    {
      unint64_t v44 = [(CUIShapeEffectStack *)self extraShadowCount];
      if (v44)
      {
        unint64_t v45 = v44;
        uint64_t v46 = 0;
        do
        {
          CGFloat v47 = [(CUIShapeEffectStack *)self extraShadow];
          long long v48 = *(_OWORD *)&v47[v46].var0;
          CGPoint v49 = v47[v46].var8;
          *(_OWORD *)&components.c = *(_OWORD *)&v47[v46].var4;
          *(CGPoint *)&components.tCGFloat x = v49;
          *(_OWORD *)&components.a = v48;
          [(CUITextEffectStack *)self _drawShadow:&components forGlyphs:a3 inContext:a4 usingFont:a5 atPositions:a6 count:a7];
          ++v46;
          --v45;
        }
        while (v45);
      }
    }
    memset(&components, 0, sizeof(components));
    CGContextGetCTM(&components, a4);
    v62.origin.CGFloat x = x;
    v62.origin.CGFloat y = y;
    v62.size.CGFloat width = width;
    v62.size.double height = height;
    double MinX = CGRectGetMinX(v62);
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.double height = height;
    CGFloat MinY = CGRectGetMinY(v63);
    CGFloat v52 = components.tx + MinY * components.c + components.a * MinX;
    CGFloat v53 = components.ty + MinY * components.d + components.b * MinX;
    CGContextGetBaseCTM();
    CGAffineTransformInvert(&v56, &v55);
    v59.double height = v56.ty + v53 * v56.d + v56.b * v52;
    v59.CGFloat width = 0.0;
    CGContextSetPatternPhase(a4, v59);
    CGContextSetFillColorWithColor(a4, FillColorAsColor);
    if ([(CUIShapeEffectStack *)self outputBlendMode]
      && (CGContextSetBlendMode(a4, (CGBlendMode)[(CUIShapeEffectStack *)self cgBlendModeForOutputBlending]), FontSmoothinguint64_t Style = CGContextGetFontSmoothingStyle(), CGContextGetShouldSmoothFonts())&& FontSmoothingStyle >= 0x11)
    {
      CGContextBeginTransparencyLayer(a4, 0);
      CTFontDrawGlyphsAtPositions();
      CGContextEndTransparencyLayer(a4);
    }
    else
    {
      CTFontDrawGlyphsAtPositions();
    }
    CGColorRelease(FillColorAsColor);
    CGContextRestoreGState(a4);
  }
}

- (void)_drawShadow:(id *)a3 usingQuartz:(id)a4 inContext:(CGContext *)a5
{
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  float64x2_t v10 = vcvtq_f64_f32(*(float32x2_t *)&a3->var0);
  double var2 = a3->var2;
  long long v17 = 0u;
  *(float64x2_t *)CGAffineTransform components = v10;
  long long v15 = 0u;
  long long v16 = 0u;
  CGContextGetBaseCTM();
  memset(&v13, 0, sizeof(v13));
  memset(&v14, 0, sizeof(v14));
  CGAffineTransformInvert(&v14, &v13);
  double var3 = a3->var3;
  double v11 = CGColorCreate(SRGB, components);
  CGStyleCreateShadow2();
  uint64_t Style = CGContextGetStyle();
  if ([(CUIShapeEffectStack *)self hasEngraveShadow] && Style) {
    (*((void (**)(id, CGContext *))a4 + 2))(a4, a5);
  }
  CGContextSetStyle();
  double var3 = a3->var3;
  CGContextSetFillColorSpace(a5, SRGB);
  CGContextSetFillColor(a5, components);
  CGContextSetStrokeColorSpace(a5, SRGB);
  CGContextSetStrokeColor(a5, components);
  CGStyleRelease();
  CGColorRelease(v11);
}

- (void)drawUsingQuartz:(id)a3 inContext:(CGContext *)a4 inBounds:(CGRect)a5 atScale:(double)a6
{
  double height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  if ([(CUITextEffectStack *)self useCoreImageRendering])
  {
    v43.origin.CGFloat x = x;
    v43.origin.CGFloat y = y;
    v43.size.CGFloat width = width;
    v43.size.double height = height;
    CGRect v44 = CGRectInset(v43, -2.0, -2.0);
    double v14 = v44.origin.x;
    double v15 = v44.origin.y;
    double v16 = v44.size.width;
    double v17 = v44.size.height;
    double v18 = -[CUITextEffectStack newGlyphMaskContextForBounds:fromContext:withScale:](self, "newGlyphMaskContextForBounds:fromContext:withScale:", a4);
    (*((void (**)(id, CGContext *))a3 + 2))(a3, v18);
    -[CUITextEffectStack drawProcessedMask:atBounds:inContext:withScale:](self, "drawProcessedMask:atBounds:inContext:withScale:", v18, a4, v14, v15, v16, v17, a6);
    CGContextBeginPath(a4);
    CGContextRelease(v18);
  }
  else
  {
    if ([(CUIShapeEffectStack *)self hasInnerGradient])
    {
      FillColorAsColor = -[CUITextEffectStack newBackgroundPatternColorWithSize:contentScale:forContext:](self, "newBackgroundPatternColorWithSize:contentScale:forContext:", a4, 10.0, height, a6);
    }
    else
    {
      FillColorAsColor = (CGColor *)CGContextGetFillColorAsColor();
      CGColorRetain(FillColorAsColor);
      if ([(CUIShapeEffectStack *)self hasColorOverlay])
      {
        CGAffineTransform v20 = [(CUIShapeEffectStack *)self newColorByProcessingColor:FillColorAsColor];
        if (v20)
        {
          float v21 = v20;
          CGColorRelease(FillColorAsColor);
          FillColorAsColor = v21;
        }
      }
    }
    CGContextSaveGState(a4);
    if ([(CUIShapeEffectStack *)self hasEngraveShadow])
    {
      unint64_t v22 = [(CUIShapeEffectStack *)self engraveShadowCount];
      if (v22)
      {
        unint64_t v23 = v22;
        uint64_t v24 = 0;
        do
        {
          uint64_t v25 = [(CUIShapeEffectStack *)self engraveShadow];
          long long v26 = *(_OWORD *)&v25[v24].var0;
          CGPoint var8 = v25[v24].var8;
          *(_OWORD *)&v40.c = *(_OWORD *)&v25[v24].var4;
          *(CGPoint *)&v40.tCGFloat x = var8;
          *(_OWORD *)&v40.a = v26;
          [(CUITextEffectStack *)self _drawShadow:&v40 usingQuartz:a3 inContext:a4];
          ++v24;
          --v23;
        }
        while (v23);
      }
    }
    if ([(CUIShapeEffectStack *)self hasExtraShadow])
    {
      unint64_t v28 = [(CUIShapeEffectStack *)self extraShadowCount];
      if (v28)
      {
        unint64_t v29 = v28;
        uint64_t v30 = 0;
        do
        {
          long long v31 = [(CUIShapeEffectStack *)self extraShadow];
          long long v32 = *(_OWORD *)&v31[v30].var0;
          CGPoint v33 = v31[v30].var8;
          *(_OWORD *)&v40.c = *(_OWORD *)&v31[v30].var4;
          *(CGPoint *)&v40.tCGFloat x = v33;
          *(_OWORD *)&v40.a = v32;
          [(CUITextEffectStack *)self _drawShadow:&v40 usingQuartz:a3 inContext:a4];
          ++v30;
          --v29;
        }
        while (v29);
      }
    }
    memset(&v40, 0, sizeof(v40));
    CGContextGetCTM(&v40, a4);
    v45.origin.CGFloat x = x;
    v45.origin.CGFloat y = y;
    v45.size.CGFloat width = width;
    v45.size.double height = height;
    double MinX = CGRectGetMinX(v45);
    v46.origin.CGFloat x = x;
    v46.origin.CGFloat y = y;
    v46.size.CGFloat width = width;
    v46.size.double height = height;
    CGFloat MinY = CGRectGetMinY(v46);
    CGFloat v36 = v40.tx + MinY * v40.c + v40.a * MinX;
    CGFloat v37 = v40.ty + MinY * v40.d + v40.b * MinX;
    CGContextGetBaseCTM();
    CGAffineTransformInvert(&v39, &v38);
    v42.double height = v39.ty + v37 * v39.d + v39.b * v36;
    v42.CGFloat width = 0.0;
    CGContextSetPatternPhase(a4, v42);
    CGContextSetFillColorWithColor(a4, FillColorAsColor);
    CGContextSetStrokeColorWithColor(a4, FillColorAsColor);
    if ([(CUIShapeEffectStack *)self outputBlendMode]) {
      CGContextSetBlendMode(a4, (CGBlendMode)[(CUIShapeEffectStack *)self cgBlendModeForOutputBlending]);
    }
    (*((void (**)(id, CGContext *))a3 + 2))(a3, a4);
    CGColorRelease(FillColorAsColor);
    CGContextRestoreGState(a4);
  }
}

@end