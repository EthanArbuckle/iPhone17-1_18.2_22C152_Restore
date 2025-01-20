@interface CUIPSDLayerEffectGradientOverlay
- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4;
- (CUIPSDGradient)gradient;
- (CUIPSDLayerEffectGradientOverlay)init;
- (CUIPSDLayerEffectGradientOverlay)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4;
- (unsigned)effectType;
- (void)dealloc;
- (void)setGradient:(id)a3;
@end

@implementation CUIPSDLayerEffectGradientOverlay

- (BOOL)updateLayerEffectPreset:(id)a3 error:(id *)a4
{
  v7 = [(CUIPSDLayerEffectGradientOverlay *)self gradient];
  if (v7)
  {
    v8 = [(CUIPSDGradient *)[(CUIPSDLayerEffectGradientOverlay *)self gradient] evaluator];
    id v9 = (id)[(CUIPSDGradientEvaluator *)v8 blendMode];
    [(CUIPSDGradientEvaluator *)v8 _smoothedGradientColorAtLocation:0.0];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(CUIPSDGradientEvaluator *)v8 _smoothedGradientColorAtLocation:1.0];
    uint64_t v16 = rint(v11 * 255.0);
    uint64_t v18 = rint(v17 * 255.0);
    uint64_t v20 = rint(v19 * 255.0);
    uint64_t v22 = rint(v21 * 255.0);
    [(CUIPSDGradientEvaluator *)v8 fillColor];
    double v24 = v23;
    LODWORD(v27) = +[CUIShapeEffectPreset cuiEffectBlendModeFromCGBlendMode:v9];
    [a3 addGradientFillWithTopColorRed:v16 green:rint(v13 * 255.0) blue:rint(v15 * 255.0) bottomColorRed:v18 green:v20 blue:v22 opacity:v24 blendMode:v27];
  }
  else
  {
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    v29 = @"Gradient is missing gradient information";
    v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, -1, +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1]);
    if (a4) {
      *a4 = v25;
    }
  }
  return v7 != 0;
}

- (CUIPSDLayerEffectGradientOverlay)initWithEffectFromPreset:(id)a3 atIndex:(unsigned int)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CUIPSDLayerEffectGradientOverlay;
  v6 = [(CUIPSDLayerEffectGradientOverlay *)&v16 init];
  uint64_t v7 = a4;
  id v8 = [a3 valueForParameter:2 inEffectAtIndex:a4];
  v9.i32[0] = [a3 valueForParameter:0 inEffectAtIndex:a4];
  v9.i32[1] = (unsigned __int32)v9.i32[0] >> 8;
  float32x2_t v10 = (float32x2_t)vdup_n_s32(0x437F0000u);
  *(float64x2_t *)components = vcvtq_f64_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v9, (int8x8_t)0xFF000000FFLL)), v10));
  double v18 = (float)((float)v9.u8[2] / 255.0);
  id v19 = v8;
  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  CGColorRef v12 = CGColorCreate(SRGB, components);
  v13.i32[0] = [a3 valueForParameter:1 inEffectAtIndex:v7];
  v13.i32[1] = (unsigned __int32)v13.i32[0] >> 8;
  *(float64x2_t *)components = vcvtq_f64_f32(vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8(v13, (int8x8_t)0xFF000000FFLL)), v10));
  double v18 = (float)((float)v13.u8[2] / 255.0);
  id v19 = v8;
  CGColorRef v14 = CGColorCreate(SRGB, components);
  [(CUIPSDLayerEffectGradientOverlay *)v6 setGradient:+[CUIPSDGradient cuiPSDGradientWithColors:locations:midpointLocations:angle:isRadial:](CUIPSDGradient, "cuiPSDGradientWithColors:locations:midpointLocations:angle:isRadial:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v14, 0), &unk_1EF4A6BE8, 0, 0, 90.0)];
  [(CUIPSDLayerEffectComponent *)v6 setVisible:1];
  CFRelease(v14);
  CFRelease(v12);
  return v6;
}

- (CUIPSDLayerEffectGradientOverlay)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUIPSDLayerEffectGradientOverlay;
  v2 = [(CUIPSDLayerEffectGradientOverlay *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CUIPSDLayerEffectComponent *)v2 setName:@"Gradient Overlay"];
  }
  return v3;
}

- (unsigned)effectType
{
  return 1198671468;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDLayerEffectGradientOverlay;
  [(CUIPSDLayerEffectComponent *)&v3 dealloc];
}

- (CUIPSDGradient)gradient
{
  return (CUIPSDGradient *)objc_getProperty(self, a2, 24, 1);
}

- (void)setGradient:(id)a3
{
}

@end