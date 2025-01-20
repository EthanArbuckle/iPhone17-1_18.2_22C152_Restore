@interface NTKPrideCircularQuad
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)noiseConfiguration;
- ($F17434BF0011F66C835719901D77F978)advanceConfig:(id)a3;
- ($F17434BF0011F66C835719901D77F978)advanceCurrentConfig;
- ($F17434BF0011F66C835719901D77F978)generateNextRandomConfigFromConfig:(id)a3;
- ($F17434BF0011F66C835719901D77F978)generateNextRandomConfigFromCurrentConfig;
- (BOOL)postSemaphoreComputeForTime:(double)a3;
- (BOOL)preSemaphoreComputeForTime:(double)a3;
- (BOOL)shouldForceRender;
- (BOOL)useXRsRGB;
- (BOOL)willConsumeTouch:(id)a3;
- (NTKPrideCircularQuad)initWithDevice:(id)a3 useXRsRGB:(BOOL)a4;
- (double)noiseSamplePositionForControlPoint:(int)a3 inSpline:(int)a4;
- (double)splineColorTransitionFraction;
- (float)_dampingFactorForSpline:(int)a3;
- (float)_dialRadiusForSpline:(int)a3;
- (float)_rectRadiusForSpline:(int)a3;
- (float)ampltiudeForControlPoint:(int)a3 ofSpline:(int)a4;
- (float)computeAmplitudeForControlPoint:(int)a3 inSpline:(int)a4 atTime:(double)a5;
- (float)currentSplineWidth;
- (float)globalAmplitudeForTime:(double)a3;
- (float)interpolationStepSizeForSpline:(int)a3;
- (float)softness;
- (id)complicationAlphaCallback;
- (id)generateVignetteTextureData;
- (id)getNTKPrideSplineDefinitionFiller;
- (id)renderPipelineManager;
- (id)renderPipelineName;
- (id)splineColorAtIndex:(int)a3;
- (id)vertexShaderName;
- (int)_numVertsForSpline:(int)a3;
- (int)numControlPointsPerSpline;
- (int)numSplines;
- (int)numVertsForSpline:(int)a3;
- (void)_colorSequenceForStartIndex:(int)a3 reverseDirection:(BOOL)a4 colorSequence:(id)a5;
- (void)_generateControlPointDampingCoefficients;
- (void)applyTransitionFromDialToFullScreenWithFraction:(double)a3;
- (void)clearWaves;
- (void)dealloc;
- (void)generateControlPointsForSpline:(int)a3;
- (void)handleOrdinaryScreenWake;
- (void)handleScreenOff;
- (void)initializePerSplineData;
- (void)performWristRaiseAnimation;
- (void)prepareWristRaiseAnimation;
- (void)processSpline:(int)a3;
- (void)randomizeSplineColors;
- (void)setAmplitude:(float)a3 forControlPoint:(int)a4 ofSpline:(int)a5;
- (void)setColorConfig:(id)a3;
- (void)setComplicationAlphaCallback:(id)a3;
- (void)setDefaultSplineColors;
- (void)setDialMode;
- (void)setFullscreenMode;
- (void)setNoise:(int)a3 forControlPoint:(int)a4 inSpline:;
- (void)setSplineColorTransitionFraction:(double)a3;
- (void)startWavesAtTime:(double)a3;
@end

@implementation NTKPrideCircularQuad

- (float)softness
{
  *((void *)&v4 + 1) = 0;
  int v6 = 0;
  uint64_t v5 = 0;
  v2 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v2, &v4);

  return *((float *)&v4 + 2);
}

- (float)currentSplineWidth
{
  long long v5 = 0uLL;
  int v7 = 0;
  uint64_t v6 = 0;
  v2 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v2, &v5);

  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v3 = v3;
  return (float)(*(float *)&v3 - *((float *)&v5 + 3)) / (float)(v5 - 1);
}

- (void)processSpline:(int)a3
{
  LODWORD(v18) = 0;
  long long v5 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v5, &v17);

  uint64_t v6 = *(void *)&self->super._amplitudeMultiplier;
  int v7 = (float32x2_t *)(v6 + 704 * a3);
  v8 = (void **)&v7[80];
  v9 = [*(id *)&v7[80] controlPointsBuffer];
  uint64_t v10 = DWORD1(v17);
  if (SDWORD1(v17) >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = v6 + 704 * a3;
    v13 = (float *)(v12 + 688);
    uint64_t v14 = v12 + 256;
    do
    {
      float32x2_t v15 = vadd_f32(vadd_f32(*v7, vmul_n_f32(v7[48], *v13 * *(float *)(v14 + 4 * v11))), (float32x2_t)0xBF000000BF000000);
      *(float32x2_t *)(*v9 + 8 * v11++) = vadd_f32(v15, v15);
      ++v7;
    }
    while (v10 != v11);
  }
  v16 = *v8;

  [v16 process];
}

- (id)splineColorAtIndex:(int)a3
{
  long long v19 = 0uLL;
  int v21 = 0;
  uint64_t v20 = 0;
  long long v5 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v5, &v19);

  int v6 = v19 - 1;
  if ((int)v19 > a3) {
    int v6 = a3;
  }
  if (a3 >= 0) {
    int v7 = ~v6;
  }
  else {
    int v7 = -1;
  }
  v8 = (void *)(*(void *)&self->super._amplitudeMultiplier + 704 * (v7 + (int)v19));
  [(NTKPrideCircularQuad *)self splineColorTransitionFraction];
  if (self->_currentColorConfig.endReversed)
  {
    CLKUIConvertToXRSRGBfFromRGBf();
    float32x4_t v18 = v9;
    uint64_t v10 = CGColorSpaceCreateWithName(kCGColorSpaceExtendedSRGB);
    *(float64x2_t *)components = vcvtq_f64_f32(*(float32x2_t *)v18.f32);
    float64x2_t v23 = vcvt_hight_f64_f32(v18);
    uint64_t v11 = CGColorCreate(v10, components);
    uint64_t v12 = +[UIColor colorWithCGColor:v11];
    CGColorRelease(v11);
    CGColorSpaceRelease(v10);
  }
  else
  {
    CLKUIConvertToSRGBfFromRGBf_fast();
    uint64_t v12 = +[UIColor colorWithRed:v16 green:v13 blue:v14 alpha:v15];
  }

  return v12;
}

- (void)setDefaultSplineColors
{
}

- ($F17434BF0011F66C835719901D77F978)generateNextRandomConfigFromConfig:(id)a3
{
  uint64_t v3 = *(void *)&a3.var2;
  uint64_t v4 = *(void *)&a3.var0;
  int v5 = rand();
  if (v5 <= 0) {
    unsigned int v6 = -(-v5 & 7);
  }
  else {
    unsigned int v6 = v5 & 7;
  }
  char v7 = rand();
  LODWORD(v8) = (char)(v4 + 3 - ((v4 + 3 + (((char)(v4 + 3) >> 12) & 7)) & 0xF8));
  if (v6 == v4) {
    uint64_t v8 = v8;
  }
  else {
    uint64_t v8 = v6;
  }
  unint64_t v9 = (v3 & 0xFFFFFF0000000000 | v8 | ((unint64_t)(v7 & 1) << 32)) ^ 0x100000000;
  uint64_t v10 = v4;
  result.var2 = v9;
  result.var3 = BYTE4(v9);
  result.var0 = v10;
  result.var1 = BYTE4(v10);
  return result;
}

- ($F17434BF0011F66C835719901D77F978)advanceConfig:(id)a3
{
  uint64_t v3 = *(void *)&a3.var2;
  unint64_t v4 = *(void *)&a3.var0 & 0xFFFFFF0000000000 | *(void *)&a3.var2 & 0x1FFFFFFFFLL;
  result.var2 = v3;
  result.var3 = BYTE4(v3);
  result.var0 = v4;
  result.var1 = BYTE4(v4);
  return result;
}

- ($F17434BF0011F66C835719901D77F978)advanceCurrentConfig
{
  id v2 = -[NTKPrideCircularQuad advanceConfig:](self, "advanceConfig:", *(unint64_t *)((char *)&self->_currentStyle + 4), *(void *)&self->_currentColorConfig.startColor);
  result.var2 = v3;
  result.var3 = BYTE4(v3);
  result.var0 = (int)v2;
  result.var1 = BYTE4(v2);
  return result;
}

- ($F17434BF0011F66C835719901D77F978)generateNextRandomConfigFromCurrentConfig
{
  id v2 = -[NTKPrideCircularQuad generateNextRandomConfigFromConfig:](self, "generateNextRandomConfigFromConfig:", *(unint64_t *)((char *)&self->_currentStyle + 4), *(void *)&self->_currentColorConfig.startColor);
  result.var2 = v3;
  result.var3 = BYTE4(v3);
  result.var0 = (int)v2;
  result.var1 = BYTE4(v2);
  return result;
}

- (void)randomizeSplineColors
{
  id v3 = -[NTKPrideCircularQuad generateNextRandomConfigFromConfig:](self, "generateNextRandomConfigFromConfig:", *(unint64_t *)((char *)&self->_currentStyle + 4), *(void *)&self->_currentColorConfig.startColor);
  id v6 = -[NTKPrideCircularQuad advanceConfig:](self, "advanceConfig:", v3, v4);

  -[NTKPrideCircularQuad setColorConfig:](self, "setColorConfig:", v6, v5);
}

- (void)_colorSequenceForStartIndex:(int)a3 reverseDirection:(BOOL)a4 colorSequence:(id)a5
{
  BOOL v5 = a4;
  unint64_t v6 = *(void *)&a3;
  long long v19 = (void (**)(id, void))a5;
  long long v20 = 0uLL;
  uint64_t v21 = 0;
  int v22 = 0;
  uint64_t v8 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v8, &v20);

  uint64_t v9 = v20;
  if ((int)v20 >= 1)
  {
    uint64_t v10 = 0;
    int v11 = v6 + 16;
    do
    {
      int v12 = dword_1DEE8[v10];
      if (v5) {
        int v12 = 7 - v12;
      }
      int v13 = v11 + v12;
      int v14 = v13 & 7;
      int v16 = -v13;
      BOOL v15 = v16 < 0;
      int v17 = v16 & 7;
      if (v15) {
        int v18 = v14;
      }
      else {
        int v18 = -v17;
      }
      if (self->_currentColorConfig.endReversed)
      {
        CLKUIConvertToRGBfFromXRSRGBf();
      }
      else
      {
        unint64_t v6 = v6 & 0xFFFFFFFF00000000 | PRIDE_COLORS_2019[v18];
        CLKUIConvertToRGBfFromSRGB8_fast();
      }
      v19[2](v19, v10++);
    }
    while (v9 != v10);
  }
}

- (void)setColorConfig:(id)a3
{
  unint64_t v3 = *(void *)&a3.var2;
  *(unint64_t *)((char *)&self->_currentStyle + 4) = *(void *)&a3.var0;
  *(void *)&self->_currentColorConfig.startColor = *(void *)&a3.var2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_13CEC;
  v6[3] = &unk_24AB8;
  v6[4] = self;
  [(NTKPrideCircularQuad *)self _colorSequenceForStartIndex:*(void *)&a3.var0 reverseDirection:a3.var1 colorSequence:v6];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_13D0C;
  v5[3] = &unk_24AB8;
  v5[4] = self;
  [(NTKPrideCircularQuad *)self _colorSequenceForStartIndex:v3 reverseDirection:HIDWORD(v3) & 1 colorSequence:v5];
}

- (int)numSplines
{
  long long v4 = 0uLL;
  int v6 = 0;
  uint64_t v5 = 0;
  id v2 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v2, &v4);

  return v4;
}

- (int)numControlPointsPerSpline
{
  LODWORD(v5) = 0;
  id v2 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v2, &v4);

  return DWORD1(v4);
}

- (int)numVertsForSpline:(int)a3
{
  return *(unsigned __int16 *)(*(void *)&self->super._amplitudeMultiplier + 704 * a3 + 700);
}

- (float)interpolationStepSizeForSpline:(int)a3
{
  LODWORD(v8) = 0;
  uint64_t v5 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v5, &v7);

  return (float)SDWORD1(v7)
       / (float)((*(unsigned __int16 *)(*(void *)&self->super._amplitudeMultiplier + 704 * a3 + 700) >> 1) - 1);
}

- (id)generateVignetteTextureData
{
  id v2 = [objc_alloc((Class)NSMutableData) initWithCapacity:4096];
  int v3 = 0;
  char v6 = -1;
  do
  {
    int v4 = 64;
    do
    {
      [v2 appendBytes:&v6 length:1];
      --v4;
    }
    while (v4);
    ++v3;
  }
  while (v3 != 64);

  return v2;
}

- (float)_dampingFactorForSpline:(int)a3
{
  if (a3 <= 4)
  {
    int v4 = a3 - 5;
LABEL_5:
    float v8 = (double)v4 * 0.523598776;
    *(float *)&double v7 = cosf(v8) * 0.4 + 0.6;
    *(float *)&double v7 = *(float *)&v7 * *(float *)&v7;
    return *(float *)&v7;
  }
  unsigned int v6 = [(NTKPrideCircularQuad *)self numSplines];
  LODWORD(v7) = 1.0;
  if ((int)(v6 - 5) <= a3)
  {
    int v4 = [(NTKPrideCircularQuad *)self numSplines] - a3 - 6;
    goto LABEL_5;
  }
  return *(float *)&v7;
}

- (void)_generateControlPointDampingCoefficients
{
  long long v8 = 0uLL;
  int v10 = 0;
  uint64_t v9 = 0;
  int v3 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v3, &v8);

  uint64_t v4 = v8;
  if ((int)v8 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = 688;
    do
    {
      [(NTKPrideCircularQuad *)self _dampingFactorForSpline:v5];
      *(_DWORD *)(*(void *)&self->super._amplitudeMultiplier + v6) = v7;
      ++v5;
      v6 += 704;
    }
    while (v4 != v5);
  }
}

- (float)_dialRadiusForSpline:(int)a3
{
  long long v6 = 0uLL;
  int v8 = 0;
  uint64_t v7 = 0;
  uint64_t v4 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v4, &v6);

  return *((float *)&v6 + 3)
       + (float)((float)((float)a3 / (float)(v6 - 1)) * (float)(*(float *)&v7 - *((float *)&v6 + 3)));
}

- (float)_rectRadiusForSpline:(int)a3
{
  long long v6 = 0uLL;
  int v8 = 0;
  uint64_t v7 = 0;
  uint64_t v4 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v4, &v6);

  return *((float *)&v6 + 3)
       + (float)((float)((float)a3 / (float)(v6 - 1)) * (float)(*((float *)&v7 + 1) - *((float *)&v6 + 3)));
}

- (void)generateControlPointsForSpline:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  long long v19 = 0uLL;
  int v21 = 0;
  uint64_t v20 = 0;
  uint64_t v5 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v5, &v19);

  [(NTKPrideCircularQuad *)self _dialRadiusForSpline:v3];
  float v18 = v6;
  [(NTKPrideCircularQuad *)self _rectRadiusForSpline:v3];
  float v17 = v7;
  int v8 = [(NTKPrideMetalQuad *)self clkDevice];
  id v9 = [v8 deviceCategory];

  uint64_t v10 = 0;
  if ((unint64_t)v9 <= 5) {
    uint64_t v10 = (uint64_t)*(&off_24B20 + (void)v9);
  }
  uint64_t v11 = *(void *)&self->super._amplitudeMultiplier + 704 * (int)v3;
  *(float *)(v11 + 692) = v17;
  *(float *)(v11 + 696) = v18;
  uint64_t v12 = DWORD1(v19);
  if (SDWORD1(v19) >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      float v14 = ((float)((float)(int)v13 / (float)(int)v12) + (float)((float)(int)v13 / (float)(int)v12)) * 3.14159265;
      __float2 v15 = __sincosf_stret(v14);
      float32x2_t v16 = vmla_f32((float32x2_t)0x3F0000003F000000, (float32x2_t)0x3F0000003F000000, vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v15.__sinval), LODWORD(v15.__cosval)), v18));
      *(float32x2_t *)(*(void *)&self->super._amplitudeMultiplier + 704 * (int)v3 + 8 * v13) = vmla_n_f32(v16, vsub_f32(vmla_f32((float32x2_t)0x3F0000003F000000, (float32x2_t)0x3F0000003F000000, vmul_n_f32(*(float32x2_t *)(v10 + 8 * v13), v17)), v16), 1.0 - *(float *)&self->_perSplineData);
      ++v13;
    }
    while (v12 != v13);
  }
}

- (int)_numVertsForSpline:(int)a3
{
  int v13 = 0;
  uint64_t v12 = 0;
  uint64_t v5 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v5, &v11);

  float v6 = [(NTKPrideMetalQuad *)self clkDevice];
  if ([v6 deviceCategory] == (char *)&dword_0 + 1) {
    int v7 = 125;
  }
  else {
    int v7 = 200;
  }

  int v8 = [(NTKPrideMetalQuad *)self clkDevice];
  if ([v8 deviceCategory] == (char *)&dword_0 + 1) {
    int v9 = 60;
  }
  else {
    int v9 = 100;
  }

  return 2
       * (int)(float)((float)((float)(*(float *)(*(void *)&self->super._amplitudeMultiplier + 704 * a3 + 696)
                                    * (float)(v7 - v9))
                            / *(float *)&v12)
                    + (float)v9)
       + 2;
}

- (void)initializePerSplineData
{
  memset(count, 0, sizeof(count));
  int v13 = 0;
  uint64_t v3 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v3, count);

  int v4 = count[0];
  *(void *)&self->super._amplitudeMultiplier = malloc_type_calloc(SLODWORD(count[0]), 0x2C0uLL, 0x10800409D81A95DuLL);
  if (v4 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v4;
    uint64_t v7 = HIDWORD(count[0]);
    uint64_t v8 = 640;
    do
    {
      id v9 = [objc_alloc((Class)NTKCubicSpline) initWithNumberOfControlPoints:v7 isClosed:1];
      uint64_t v10 = *(void *)&self->super._amplitudeMultiplier;
      long long v11 = *(void **)(v10 + v8);
      *(void *)(v10 + v8) = v9;

      [(NTKPrideCircularQuad *)self generateControlPointsForSpline:v5];
      *(_WORD *)(*(void *)&self->super._amplitudeMultiplier + v8 + 60) = (unsigned __int16)[(NTKPrideCircularQuad *)self _numVertsForSpline:v5++];
      v8 += 704;
    }
    while (v6 != v5);
  }
}

- (id)renderPipelineManager
{
  if (qword_2C968 != -1) {
    dispatch_once(&qword_2C968, &stru_24AD8);
  }
  id v2 = (void *)qword_2C960;

  return v2;
}

- (id)vertexShaderName
{
  return @"pride_circles_vertex_shader";
}

- (id)renderPipelineName
{
  return @"pride_circles";
}

- (NTKPrideCircularQuad)initWithDevice:(id)a3 useXRsRGB:(BOOL)a4
{
  id v6 = a3;
  long long v14 = 0uLL;
  int v16 = 0;
  uint64_t v15 = 0;
  sub_13554(v6, &v14);
  uint64_t v7 = [NTKPrideTouchCrownHandler alloc];
  LODWORD(v8) = 4.0;
  LODWORD(v9) = 2.25;
  uint64_t v10 = [(NTKPrideTouchCrownHandler *)v7 initWithNumSplines:v14 strumWidth:0 strumSpeed:2 isCyclical:v8 padding:v9];
  v13.receiver = self;
  v13.super_class = (Class)NTKPrideCircularQuad;
  long long v11 = [(NTKPrideSplinesQuad *)&v13 initWithDevice:v6 touchCrownHandler:v10];

  if (v11)
  {
    v11->_currentColorConfig.endReversed = a4;
    [(NTKPrideCircularQuad *)v11 initializePerSplineData];
    [(NTKPrideCircularQuad *)v11 setDefaultSplineColors];
    [(NTKPrideCircularQuad *)v11 _generateControlPointDampingCoefficients];
    [(NTKPrideCircularQuad *)v11 clearWaves];
    HIDWORD(v11->_perSplineData) = 1065353216;
    LOBYTE(v11->_displayMode) = 1;
    v11->_complicationAlphaCallback = 0;
    [(NTKPrideSplinesQuad *)v11 setControlPointsNeedUpdate];
    if ([v6 deviceCategory] != (char *)&dword_0 + 1) {
      [(NTKPrideCircularQuad *)v11 setDialMode];
    }
  }

  return v11;
}

- (void)dealloc
{
  long long v9 = 0uLL;
  int v11 = 0;
  uint64_t v10 = 0;
  uint64_t v3 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v3, &v9);

  if ((int)v9 >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 704 * v9;
    do
    {
      uint64_t v6 = *(void *)&self->super._amplitudeMultiplier + v4;
      uint64_t v7 = *(void **)(v6 + 640);
      *(void *)(v6 + 640) = 0;

      v4 += 704;
    }
    while (v5 != v4);
  }
  free(*(void **)&self->super._amplitudeMultiplier);
  v8.receiver = self;
  v8.super_class = (Class)NTKPrideCircularQuad;
  [(NTKPrideSplinesQuad *)&v8 dealloc];
}

- (void)applyTransitionFromDialToFullScreenWithFraction:(double)a3
{
  CLKInterpolateBetweenFloatsUnclipped();
  *(float *)&double v4 = v4;
  LODWORD(self->_perSplineData) = LODWORD(v4);

  [(NTKPrideSplinesQuad *)self setControlPointsNeedUpdate];
}

- (void)setDialMode
{
  if (*(float *)&self->_perSplineData != 1.0) {
    [(NTKPrideSplinesQuad *)self setControlPointsNeedUpdate];
  }
  LODWORD(self->_perSplineData) = 1065353216;
  *(void *)&self->_paused = 0;
}

- (void)setFullscreenMode
{
  if (*(float *)&self->_perSplineData != 0.0) {
    [(NTKPrideSplinesQuad *)self setControlPointsNeedUpdate];
  }
  LODWORD(self->_perSplineData) = 0;
  *(void *)&self->_paused = 1;
}

- (void)prepareWristRaiseAnimation
{
  HIDWORD(self->_perSplineData) = 0;
  LOBYTE(self->_displayMode) = 0;
}

- (void)performWristRaiseAnimation
{
  LOBYTE(self->_displayMode) = 1;
  HIDWORD(self->_perSplineData) = 0;
}

- (void)handleOrdinaryScreenWake
{
  HIDWORD(self->_perSplineData) = 1065353216;
}

- (void)handleScreenOff
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideCircularQuad;
  [(NTKPrideMetalQuad *)&v4 handleScreenOff];
  LOBYTE(self->_displayMode) = 0;
  [(NTKPrideCircularQuad *)self clearWaves];
  [(NTKPrideCircularQuad *)self randomizeSplineColors];
  HIDWORD(self->_perSplineData) = 0;
  uint64_t v3 = [(NTKPrideCircularQuad *)self quadView];
  [v3 discardContents];
}

- (BOOL)willConsumeTouch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NTKPrideCircularQuad *)self quadView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  [v4 locationInView:v5];
  double v11 = v10;
  [v4 locationInView:v5];
  double v13 = v12;

  int v28 = 0;
  uint64_t v27 = 0;
  long long v14 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v14, &v26);

  uint64_t v15 = *(void *)&self->_paused;
  if (v15 == 1)
  {
    char v24 = 1;
  }
  else if (v15)
  {
    char v24 = 0;
  }
  else
  {
    v16.f32[0] = v11 / v7;
    float32_t v17 = v13 / v9;
    v16.f32[1] = v17;
    __asm { FMOV            V2.2S, #-1.0 }
    float32x2_t v23 = vmla_f32(_D2, (float32x2_t)0x4000000040000000, v16);
    char v24 = sqrtf(vaddv_f32(vmul_f32(v23, v23))) < *(float *)&v27;
  }

  return v24;
}

- (void)clearWaves
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideCircularQuad;
  [(NTKPrideSplinesQuad *)&v3 clearWaves];
  self->_currentFade = -10.0;
  LOBYTE(self->_displayMode) = 0;
  HIDWORD(self->_perSplineData) = 1065353216;
}

- (float)computeAmplitudeForControlPoint:(int)a3 inSpline:(int)a4 atTime:(double)a5
{
  uint64_t v7 = *(void *)&a4;
  *(float *)&double v5 = a5;
  LODWORD(v6) = 1.5;
  [(NTKPrideSplinesQuad *)self combinedAmplitudeForControlPointAtPosition:*(double *)(*(void *)&self->super._amplitudeMultiplier + 704 * a4 + 8 * a3) currentTime:v5 waveSpeed:v6];
  float v10 = v9;
  double v11 = [(NTKPrideSplinesQuad *)self touchCrownHandler];
  [v11 strumAmplitudeForSpline:v7];
  float v13 = v12;

  return fabsf(v13) * 1.5 + v10 * 0.2;
}

- (float)globalAmplitudeForTime:(double)a3
{
  float v3 = a3 - self->_currentFade;
  float v4 = 4.0;
  if (v3 < 0.0) {
    float v4 = 16.0;
  }
  double v5 = pow(2.71828183, (float)(v4 * v3) * (float)(v4 * v3) * -0.200000003) * 0.2;
  float v6 = fminf((float)(v3 + -1.5) * -7.0, 1.0);
  if (v6 < 0.0) {
    float v6 = 0.0;
  }
  return v5 * v6;
}

- (void)startWavesAtTime:(double)a3
{
  id v7 = [(NTKPrideSplinesQuad *)self touchCrownHandler];
  [(NTKPrideMetalQuad *)self currentTime];
  double v5 = v4;
  LODWORD(v4) = 0.5;
  LODWORD(v6) = 0.5;
  [v7 startWaveAtX:v4 y:v6 atTime:v5];
}

- (void)setAmplitude:(float)a3 forControlPoint:(int)a4 ofSpline:(int)a5
{
  *(float *)(*(void *)&self->super._amplitudeMultiplier + 704 * a5 + 4 * a4 + 256) = a3;
}

- (float)ampltiudeForControlPoint:(int)a3 ofSpline:(int)a4
{
  return *(float *)(*(void *)&self->super._amplitudeMultiplier + 704 * a4 + 4 * a3 + 256);
}

- (BOOL)shouldForceRender
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideCircularQuad;
  return [(NTKPrideSplinesQuad *)&v4 shouldForceRender] || LOBYTE(self->_displayMode) != 0;
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)noiseConfiguration
{
  id v2 = [(NTKPrideMetalQuad *)self clkDevice];
  float v3 = _NoiseConfiguration(v2, 2);

  return ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v3;
}

- (double)noiseSamplePositionForControlPoint:(int)a3 inSpline:(int)a4
{
  return *(double *)(*(void *)(a1 + 176) + 704 * a4 + 8 * a3);
}

- (void)setNoise:(int)a3 forControlPoint:(int)a4 inSpline:
{
  *(void *)(*(void *)&self->super._amplitudeMultiplier + 704 * a4 + 8 * a3 + 384) = v4;
}

- (BOOL)preSemaphoreComputeForTime:(double)a3
{
  v13.receiver = self;
  v13.super_class = (Class)NTKPrideCircularQuad;
  BOOL v4 = [(NTKPrideSplinesQuad *)&v13 preSemaphoreComputeForTime:a3];
  if (v4)
  {
    float v5 = *((float *)&self->_perSplineData + 1);
    if (LOBYTE(self->_displayMode)) {
      BOOL v6 = v5 == 1.0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      float v7 = v5 + -1.0;
      float v8 = *(float *)&self->_currentStyle;
      double v9 = 0.0160000008;
      do
      {
        float v8 = v8 + (float)((float)(v8 * -50.0) + (float)(v7 * -180.0)) * 0.001;
        double v10 = v8 * 0.001;
        float v7 = v10 + v7;
        float v5 = v10 + v5;
        float v11 = v9 + -0.001;
        double v9 = v11;
      }
      while (v9 >= 0.001);
      *(float *)&self->_currentStyle = v8;
      if (1.0 - v5 < 0.0001)
      {
        LOBYTE(self->_displayMode) = 0;
        float v5 = 1.0;
      }
    }
    *((float *)&self->_perSplineData + 1) = v5;
  }
  return v4;
}

- (id)getNTKPrideSplineDefinitionFiller
{
  memset(v9, 0, 28);
  float v3 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_13554(v3, v9);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_14F2C;
  v7[3] = &unk_24B00;
  v7[4] = self;
  v8[0] = v9[0];
  *(_OWORD *)((char *)v8 + 12) = *(_OWORD *)((char *)v9 + 12);
  BOOL v4 = objc_retainBlock(v7);
  float v5 = objc_retainBlock(v4);

  return v5;
}

- (BOOL)postSemaphoreComputeForTime:(double)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKPrideCircularQuad;
  [(NTKPrideSplinesQuad *)&v6 postSemaphoreComputeForTime:a3];
  uint64_t v4 = *(void *)&self->_useXRsRGB;
  if (v4 && !*(void *)&self->_paused && *(float *)&self->_perSplineData == 1.0) {
    (*(void (**)(float))(v4 + 16))(*(float *)&self->_currentColorConfig.endColor);
  }
  return 1;
}

- (BOOL)useXRsRGB
{
  return self->_currentColorConfig.endReversed;
}

- (id)complicationAlphaCallback
{
  return *(id *)&self->_useXRsRGB;
}

- (void)setComplicationAlphaCallback:(id)a3
{
}

- (double)splineColorTransitionFraction
{
  return *(double *)&self->_complicationAlphaCallback;
}

- (void)setSplineColorTransitionFraction:(double)a3
{
  *(double *)&self->_complicationAlphaCallback = a3;
}

- (void).cxx_destruct
{
}

@end