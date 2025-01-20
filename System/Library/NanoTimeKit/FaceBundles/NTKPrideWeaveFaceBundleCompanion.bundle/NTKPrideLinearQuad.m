@interface NTKPrideLinearQuad
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)noiseConfiguration;
- (BOOL)preSemaphoreComputeForTime:(double)a3;
- (BOOL)shouldForceRender;
- (BOOL)useXRsRGB;
- (NTKPrideLinearQuad)initWithDevice:(id)a3 useXRsRGB:(BOOL)a4;
- (NTKPrideLinearQuad)initWithDevice:(id)a3 useXRsRGB:(BOOL)a4 touchCrownHandler:(id)a5;
- (float)_xPositionForSpline:(int)a3;
- (float)ampltiudeForControlPoint:(int)a3 ofSpline:(int)a4;
- (float)computeAmplitudeForControlPoint:(int)a3 inSpline:(int)a4 atTime:(double)a5;
- (float)globalAmplitudeForTime:(double)a3;
- (float)interpolationStepSizeForSpline:(int)a3;
- (float)noiseSamplePositionForControlPoint:(int)a3 inSpline:(int)a4;
- (float)vignetteAmount;
- (id)generateVignetteTextureData;
- (id)getNTKPrideSplineDefinitionFiller;
- (id)renderPipelineManager;
- (id)renderPipelineName;
- (id)vertexShaderName;
- (int)numControlPointsPerSpline;
- (int)numSplines;
- (int)numVertsForSpline:(int)a3;
- (void)_computePigeonLocationsForPigeons:(int)a3 inHoles:(int)a4 pigeonIndices:(int *)a5 pigeonToHole:(int *)a6 pigeonsPerHole:(int *)a7;
- (void)_generateControlPointDampingCoefficients;
- (void)_generateSplineColors;
- (void)_generateSplinePositions;
- (void)_initializePerSplineData;
- (void)applyTransitionFromBandedToFabricWithFraction:(double)a3;
- (void)clearWaves;
- (void)dealloc;
- (void)generateControlPointsForSpline:(int)a3;
- (void)handleOrdinaryScreenWake;
- (void)handleScreenOff;
- (void)performWristRaiseAnimation;
- (void)prepareWristRaiseAnimation;
- (void)processSpline:(int)a3;
- (void)setAmplitude:(float)a3 forControlPoint:(int)a4 ofSpline:(int)a5;
- (void)setBandedMode;
- (void)setFabricMode;
- (void)setNoise:(int)a3 forControlPoint:(int)a4 inSpline:;
- (void)startWavesAtTime:(double)a3;
@end

@implementation NTKPrideLinearQuad

- (void)processSpline:(int)a3
{
  uint64_t v5 = *(void *)&self->_controlPointsDampingCoefficients[88];
  v6 = (float32x2_t *)(v5 + 320 * a3);
  v7 = (void **)&v6[30];
  v8 = [*(id *)&v6[30] controlPointsBuffer];
  LODWORD(v15) = 0;
  v9 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_7198(v9, (uint64_t)&v14);

  uint64_t v10 = DWORD1(v14);
  if (SDWORD1(v14) >= 1)
  {
    uint64_t v11 = 0;
    do
    {
      float32x2_t v12 = vadd_f32(vadd_f32(*v6, vmul_f32(v6[18], vmul_n_f32(*(float32x2_t *)(&self->super._amplitudeMultiplier + 2 * v11), *(float *)(v5 + 320 * a3 + 96 + 4 * v11)))), (float32x2_t)0xBF000000BF000000);
      *(float32x2_t *)(*v8 + 8 * v11++) = vadd_f32(v12, v12);
      ++v6;
    }
    while (v10 != v11);
  }
  v13 = *v7;

  [v13 process];
}

- (int)numSplines
{
  int v5 = 0;
  memset(v4, 0, sizeof(v4));
  v2 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_7198(v2, (uint64_t)v4);

  return v4[0];
}

- (int)numControlPointsPerSpline
{
  LODWORD(v5) = 0;
  v2 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_7198(v2, (uint64_t)&v4);

  return DWORD1(v4);
}

- (int)numVertsForSpline:(int)a3
{
  LODWORD(v6) = 0;
  v3 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_7198(v3, (uint64_t)&v5);

  return HIDWORD(v5);
}

- (float)interpolationStepSizeForSpline:(int)a3
{
  LODWORD(v6) = 0;
  v3 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_7198(v3, (uint64_t)v5);

  return (float)(v5[1] - 1) / (float)(v5[3] / 2 - 1);
}

- (float)vignetteAmount
{
  return *((float *)&self->_perSplineData + 1);
}

- (void)_generateSplineColors
{
  unint64_t v4 = [(NTKPrideMetalQuad *)self clkDevice];
  if ([(id)v4 deviceCategory] == (char *)&dword_0 + 1) {
    long long v5 = (int *)&unk_1DC08;
  }
  else {
    long long v5 = (int *)&unk_1DB68;
  }

  if ([(NTKPrideLinearQuad *)self numSplines] >= 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = 312;
    do
    {
      if (LOBYTE(self->_currentStyle))
      {
        CLKUIConvertToRGBfFromXRSRGBf();
      }
      else
      {
        unint64_t v2 = v2 & 0xFFFFFFFF00000000 | PRIDE_COLORS_2019[v5[v6]];
        CLKUIConvertToRGBfFromSRGB8_fast();
      }
      *(_OWORD *)(*(void *)&self->_controlPointsDampingCoefficients[88] + v7 - 56) = v8;
      unint64_t v4 = v4 & 0xFFFFFFFF00000000 | PRIDE_COLORS_2018[*(int *)(*(void *)&self->_controlPointsDampingCoefficients[88]
                                                                + v7)];
      CLKUIConvertToRGBfFromSRGB8_fast();
      *(_OWORD *)(*(void *)&self->_controlPointsDampingCoefficients[88] + v7 - 24) = v9;
      ++v6;
      v7 += 320;
    }
    while (v6 < [(NTKPrideLinearQuad *)self numSplines]);
  }
}

- (id)generateVignetteTextureData
{
  id v2 = [objc_alloc((Class)NSMutableData) initWithCapacity:4096];
  for (int i = 0; i != 64; ++i)
  {
    int v4 = 0;
    float v5 = (float)((float)i / 63.0) + -0.5 + (float)((float)i / 63.0) + -0.5;
    double v6 = v5 * v5;
    do
    {
      long double v7 = pow(sqrt(v6 + ((float)((float)v4 / 63.0) + -0.5) * ((float)((float)v4 / 63.0) + -0.5) * 0.075), 8.0);
      float v8 = pow(2.71828183, v7 * -5.0);
      char v10 = (int)(float)(v8 * 255.0);
      [v2 appendBytes:&v10 length:1];
      ++v4;
    }
    while (v4 != 64);
  }

  return v2;
}

- (void)_computePigeonLocationsForPigeons:(int)a3 inHoles:(int)a4 pigeonIndices:(int *)a5 pigeonToHole:(int *)a6 pigeonsPerHole:(int *)a7
{
  size_t v12 = a3;
  *a6 = (int *)malloc_type_calloc(a3, 4uLL, 0x100004052888210uLL);
  *a5 = (int *)malloc_type_calloc(v12, 4uLL, 0x100004052888210uLL);
  v13 = (int *)malloc_type_calloc(a4, 4uLL, 0x100004052888210uLL);
  *a7 = v13;
  if (a3 >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = *a5;
    v16 = *a6;
    do
    {
      double v17 = (double)a4 / (double)a3 * (double)(int)v14;
      int v18 = (int)v17;
      int v19 = (int)((v17 - (double)(int)v17) * (double)a3 / (double)a4);
      if (vabdd_f64(1.0, (double)v19) < 0.00001) {
        int v19 = 1;
      }
      v15[v14] = v19;
      v16[v14++] = v18;
      ++v13[v18];
    }
    while (a3 != v14);
  }
}

- (void)_generateSplinePositions
{
  int v38 = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  v3 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_7198(v3, (uint64_t)&v35);

  if ([(NTKPrideLinearQuad *)self numSplines] >= 1)
  {
    uint64_t v4 = 0;
    float v5 = *((float *)&v36 + 3);
    float v6 = *((float *)&v37 + 2);
    uint64_t v7 = 248;
    do
    {
      *(float *)(*(void *)&self->_controlPointsDampingCoefficients[88] + v7) = v6 + (float)(v5 * (float)(int)v4++);
      v7 += 320;
    }
    while (v4 < [(NTKPrideLinearQuad *)self numSplines]);
  }
  v33 = 0;
  v34 = 0;
  v32 = 0;
  [(NTKPrideLinearQuad *)self _computePigeonLocationsForPigeons:[(NTKPrideLinearQuad *)self numSplines] inHoles:6 pigeonIndices:&v34 pigeonToHole:&v33 pigeonsPerHole:&v32];
  uint64_t v8 = 0;
  int v9 = 0;
  uint64_t v10 = DWORD2(v36);
  float v28 = *(float *)&v36;
  float v11 = *((float *)&v37 + 3);
  float v12 = *((float *)&v37 + 1);
  double v13 = *((float *)&v37 + 1);
  double v14 = ((double)SDWORD2(v36) + -1.0) * 0.5;
  do
  {
    uint64_t v15 = *((unsigned int *)v32 + v8);
    v30 = 0;
    v31 = 0;
    v29 = 0;
    [(NTKPrideLinearQuad *)self _computePigeonLocationsForPigeons:v15 inHoles:v10 pigeonIndices:&v30 pigeonToHole:&v31 pigeonsPerHole:&v29];
    v16 = v31;
    if ((int)v15 >= 1)
    {
      int v18 = v29;
      double v17 = (int *)v30;
      int v19 = (float *)(*(void *)&self->_controlPointsDampingCoefficients[88] + 320 * v9 + 312);
      v9 += v15;
      v20 = (int *)v31;
      do
      {
        int v22 = *v17++;
        int v21 = v22;
        *((_DWORD *)v19 - 1) = v22;
        *(_DWORD *)int v19 = v8;
        uint64_t v23 = *v20;
        int v24 = v18[v23];
        double v25 = (float)(v11 + (float)(v28 * (float)(int)v8)) + v13 * ((double)(int)v23 - v14);
        *((_DWORD *)v19 - 2) = v24;
        float v26 = v25;
        *(v19 - 9) = v26;
        uint64_t v27 = *v20++;
        *(v19 - 8) = v12 / (float)(int)v18[v27];
        *(float *)&double v25 = v25
                       + (((double)v21 * 2.0 + 1.0) / (double)(2 * v24)
                        + -0.5
                        + ((double)v21 * 2.0 + 1.0) / (double)(2 * v24)
                        + -0.5)
                       * v13
                       * 0.5;
        *(v19 - 10) = *(float *)&v25;
        v19 += 80;
        --v15;
      }
      while (v15);
    }
    free(v16);
    free(v30);
    free(v29);
    ++v8;
  }
  while (v8 != 6);
  free(v34);
  free(v33);
  free(v32);
}

- (void)_generateControlPointDampingCoefficients
{
  LODWORD(v9) = 0;
  v3 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_7198(v3, (uint64_t)&v8);

  int v4 = DWORD1(v8);
  if (SDWORD1(v8) >= 1) {
    memset_pattern16(&self->super._amplitudeMultiplier, &unk_1DCC0, 8 * DWORD1(v8));
  }
  int32x2_t v5 = vdup_n_s32(0x3F19999Au);
  int32x2_t v6 = vdup_n_s32(0x3F4CCCCDu);
  *(void *)&self->super._amplitudeMultiplier = 1048576000;
  *(int32x2_t *)self->_controlPointsDampingCoefficients = v5;
  *(int32x2_t *)&self->_controlPointsDampingCoefficients[8] = v6;
  uint64_t v7 = &self->super._amplitudeMultiplier + 2 * v4;
  *((int32x2_t *)v7 - 3) = v6;
  *((int32x2_t *)v7 - 2) = v5;
  *((void *)v7 - 1) = 1048576000;
}

- (float)_xPositionForSpline:(int)a3
{
  CLKInterpolateBetweenFloatsUnclipped();
  return v3;
}

- (void)generateControlPointsForSpline:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  LODWORD(v11) = 0;
  int32x2_t v5 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_7198(v5, (uint64_t)&v10);

  [(NTKPrideLinearQuad *)self _xPositionForSpline:v3];
  if (fabsf(self->_aspectRatio) < 0.00000011921) {
    unsigned int v6 = *(_DWORD *)(*(void *)&self->_controlPointsDampingCoefficients[88] + 320 * (int)v3 + 276);
  }
  uint64_t v7 = DWORD1(v10);
  if (SDWORD1(v10) >= 1)
  {
    uint64_t v8 = 0;
    do
    {
      *(float *)&unsigned int v9 = ((double)(int)v8 / (double)((int)v7 - 1) + -0.5) * 1.02 * *(float *)&self->_perSplineData + 0.5;
      *(void *)(*(void *)&self->_controlPointsDampingCoefficients[88] + 320 * (int)v3 + 8 * v8++) = __PAIR64__(v9, v6);
    }
    while (v7 != v8);
  }
}

- (void)_initializePerSplineData
{
  LODWORD(v11) = 0;
  uint64_t v3 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_7198(v3, (uint64_t)&v10);

  *(void *)&self->_controlPointsDampingCoefficients[88] = malloc_type_calloc([(NTKPrideLinearQuad *)self numSplines], 0x140uLL, 0x1080040D7407E77uLL);
  if ([(NTKPrideLinearQuad *)self numSplines] >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = DWORD1(v10);
    uint64_t v6 = 240;
    do
    {
      id v7 = [objc_alloc((Class)NTKCubicSpline) initWithNumberOfControlPoints:v5 isClosed:0];
      uint64_t v8 = *(void *)&self->_controlPointsDampingCoefficients[88];
      unsigned int v9 = *(void **)(v8 + v6);
      *(void *)(v8 + v6) = v7;

      ++v4;
      v6 += 320;
    }
    while (v4 < [(NTKPrideLinearQuad *)self numSplines]);
  }
}

- (id)renderPipelineManager
{
  if (qword_2C840 != -1) {
    dispatch_once(&qword_2C840, &stru_246E8);
  }
  id v2 = (void *)qword_2C838;

  return v2;
}

- (id)vertexShaderName
{
  return @"pride_lines_vertex_shader";
}

- (id)renderPipelineName
{
  return @"pride_lines";
}

- (NTKPrideLinearQuad)initWithDevice:(id)a3 useXRsRGB:(BOOL)a4
{
  BOOL v4 = a4;
  int v14 = 0;
  memset(v13, 0, sizeof(v13));
  id v6 = a3;
  sub_7198(v6, (uint64_t)v13);
  id v7 = [NTKPrideTouchCrownHandler alloc];
  LODWORD(v8) = 1.0;
  LODWORD(v9) = 1.5;
  long long v10 = [(NTKPrideTouchCrownHandler *)v7 initWithNumSplines:LODWORD(v13[0]) strumWidth:0 strumSpeed:2 isCyclical:v8 padding:v9];
  uint64_t v11 = [(NTKPrideLinearQuad *)self initWithDevice:v6 useXRsRGB:v4 touchCrownHandler:v10];

  return v11;
}

- (NTKPrideLinearQuad)initWithDevice:(id)a3 useXRsRGB:(BOOL)a4 touchCrownHandler:(id)a5
{
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NTKPrideLinearQuad;
  double v9 = [(NTKPrideSplinesQuad *)&v16 initWithDevice:v8 touchCrownHandler:a5];
  long long v10 = v9;
  if (v9)
  {
    LOBYTE(v9->_currentStyle) = a4;
    [(NTKPrideLinearQuad *)v9 _initializePerSplineData];
    [(NTKPrideLinearQuad *)v10 _generateSplinePositions];
    [(NTKPrideLinearQuad *)v10 _generateSplineColors];
    [(NTKPrideLinearQuad *)v10 _generateControlPointDampingCoefficients];
    [v8 screenBounds];
    double v12 = v11;
    [v8 screenBounds];
    float v14 = v12 / v13;
    *(float *)&v10->_perSplineData = v14;
    [(NTKPrideLinearQuad *)v10 clearWaves];
    v10->_vignetteAmount = 1.0;
    LOBYTE(v10->_displayMode) = 1;
    HIDWORD(v10->_perSplineData) = 1065353216;
    [(NTKPrideSplinesQuad *)v10 setControlPointsNeedUpdate];
  }

  return v10;
}

- (void)dealloc
{
  if ([(NTKPrideLinearQuad *)self numSplines] >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 240;
    do
    {
      uint64_t v5 = *(void *)&self->_controlPointsDampingCoefficients[88];
      id v6 = *(void **)(v5 + v4);
      *(void *)(v5 + v4) = 0;

      ++v3;
      v4 += 320;
    }
    while (v3 < [(NTKPrideLinearQuad *)self numSplines]);
  }
  free(*(void **)&self->_controlPointsDampingCoefficients[88]);
  v7.receiver = self;
  v7.super_class = (Class)NTKPrideLinearQuad;
  [(NTKPrideSplinesQuad *)&v7 dealloc];
}

- (void)applyTransitionFromBandedToFabricWithFraction:(double)a3
{
  int v8 = 0;
  uint64_t v4 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_7198(v4, (uint64_t)&v7);

  CLKInterpolateBetweenFloatsUnclipped();
  *(float *)&double v5 = v5;
  self->_aspectRatio = *(float *)&v5;
  [(NTKPrideSplinesQuad *)self setControlPointsNeedUpdate];
  float v6 = 1.0;
  if (!(_BYTE)v8) {
    float v6 = 1.0 - self->_aspectRatio;
  }
  *((float *)&self->_perSplineData + 1) = v6;
}

- (void)setBandedMode
{
  if (self->_aspectRatio != 0.0) {
    [(NTKPrideSplinesQuad *)self setControlPointsNeedUpdate];
  }
  self->_aspectRatio = 0.0;
  HIDWORD(self->_perSplineData) = 1065353216;
  *(void *)&self->_paused = 0;
}

- (void)setFabricMode
{
  if (self->_aspectRatio != 1.0) {
    [(NTKPrideSplinesQuad *)self setControlPointsNeedUpdate];
  }
  int v6 = 0;
  uint64_t v3 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_7198(v3, (uint64_t)&v5);

  self->_aspectRatio = 1.0;
  LOBYTE(v4) = v6;
  *((float *)&self->_perSplineData + 1) = (float)v4;
  *(void *)&self->_paused = 1;
}

- (void)prepareWristRaiseAnimation
{
  LOBYTE(self->_displayMode) = 0;
}

- (void)performWristRaiseAnimation
{
  LOBYTE(self->_displayMode) = 1;
}

- (void)handleOrdinaryScreenWake
{
  self->_vignetteAmount = 1.0;
}

- (void)handleScreenOff
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideLinearQuad;
  [(NTKPrideMetalQuad *)&v4 handleScreenOff];
  LOBYTE(self->_displayMode) = 0;
  self->_vignetteAmount = 0.0;
  [(NTKPrideLinearQuad *)self clearWaves];
  uint64_t v3 = [(NTKPrideLinearQuad *)self quadView];
  [v3 discardContents];
}

- (void)clearWaves
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideLinearQuad;
  [(NTKPrideSplinesQuad *)&v3 clearWaves];
  self->_currentFade = -10.0;
  self->_vignetteAmount = 1.0;
  LOBYTE(self->_displayMode) = 0;
}

- (float)globalAmplitudeForTime:(double)a3
{
  float v3 = a3 - self->_currentFade;
  float v4 = 4.0;
  if (v3 < 0.0) {
    float v4 = 16.0;
  }
  double v5 = pow(2.71828183, (float)(v4 * v3) * (float)(v4 * v3) * (float)-flt_1DB40[*(void *)&self->_paused == 1]) * 0.16;
  float v6 = fminf((float)(v3 + -2.0) * -7.0, 1.0);
  if (v6 < 0.0) {
    float v6 = 0.0;
  }
  return v5 * v6;
}

- (float)computeAmplitudeForControlPoint:(int)a3 inSpline:(int)a4 atTime:(double)a5
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v9 = *(void *)&self->_controlPointsDampingCoefficients[88] + 320 * a4;
  if (*(void *)&self->_paused) {
    long long v10 = (_DWORD *)(v9 + 248);
  }
  else {
    long long v10 = (_DWORD *)(v9 + 276);
  }
  double v11 = *(double *)(v9 + 8 * a3);
  LODWORD(v11) = *v10;
  *(float *)&double v5 = a5;
  LODWORD(v6) = 1.5;
  [(NTKPrideSplinesQuad *)self combinedAmplitudeForControlPointAtPosition:v11 currentTime:v5 waveSpeed:v6];
  float v13 = v12;
  uint64_t v14 = *(void *)&self->_paused;
  if (!v14)
  {
    int v18 = [(NTKPrideSplinesQuad *)self touchCrownHandler];
    int v19 = v18;
    uint64_t v20 = (v7
                       - *(_DWORD *)(*(void *)&self->_controlPointsDampingCoefficients[88] + 320 * (int)v7 + 308));
LABEL_10:
    [v18 strumAmplitudeForSpline:v20];
    float v15 = v21;

    float v17 = 1.0;
    float v16 = 0.25;
    return (float)(fabsf(v15) * v17) + (float)(v13 * v16);
  }
  if (v14 == 1)
  {
    int v18 = [(NTKPrideSplinesQuad *)self touchCrownHandler];
    int v19 = v18;
    uint64_t v20 = v7;
    goto LABEL_10;
  }
  float v15 = 0.0;
  float v16 = 0.0;
  float v17 = 0.0;
  if (v14 == 2) {
    sub_18244();
  }
  return (float)(fabsf(v15) * v17) + (float)(v13 * v16);
}

- (void)startWavesAtTime:(double)a3
{
  if (*(void *)&self->_paused)
  {
    id v8 = [(NTKPrideSplinesQuad *)self touchCrownHandler];
    [(NTKPrideMetalQuad *)self currentTime];
    double v5 = v4;
    LODWORD(v4) = 0.5;
    LODWORD(v6) = 0.5;
    [v8 startWaveAtX:v4 y:v6 atTime:v5];
  }
  else
  {
    float v7 = a3 + 0.3;
    self->_currentFade = v7;
  }
}

- (BOOL)shouldForceRender
{
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideLinearQuad;
  return [(NTKPrideSplinesQuad *)&v4 shouldForceRender] || LOBYTE(self->_displayMode) != 0;
}

- (void)setAmplitude:(float)a3 forControlPoint:(int)a4 ofSpline:(int)a5
{
  *(float *)(*(void *)&self->_controlPointsDampingCoefficients[88] + 320 * a5 + 4 * a4 + 96) = a3;
}

- (float)ampltiudeForControlPoint:(int)a3 ofSpline:(int)a4
{
  return *(float *)(*(void *)&self->_controlPointsDampingCoefficients[88] + 320 * a4 + 4 * a3 + 96);
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)noiseConfiguration
{
  uint64_t v2 = *(void *)&self->_paused;
  if (v2 == 1)
  {
    float v3 = [(NTKPrideMetalQuad *)self clkDevice];
    objc_super v4 = v3;
    uint64_t v5 = 1;
  }
  else
  {
    if (v2) {
      sub_18270();
    }
    float v3 = [(NTKPrideMetalQuad *)self clkDevice];
    objc_super v4 = v3;
    uint64_t v5 = 0;
  }
  double v6 = _NoiseConfiguration(v3, v5);

  return ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v6;
}

- (float)noiseSamplePositionForControlPoint:(int)a3 inSpline:(int)a4
{
  uint64_t v4 = *(void *)(a1 + 272);
  uint64_t v5 = *(void *)(v4 + 320 * a4 + 8 * a3);
  if (!*(void *)(a1 + 312)) {
    LODWORD(v5) = *(_DWORD *)(v4 + 320 * a4 + 276);
  }
  return *(float *)&v5;
}

- (void)setNoise:(int)a3 forControlPoint:(int)a4 inSpline:
{
  *(void *)(*(void *)&self->_controlPointsDampingCoefficients[88] + 320 * a4 + 8 * a3 + 144) = v4;
}

- (BOOL)preSemaphoreComputeForTime:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKPrideLinearQuad;
  BOOL v4 = [(NTKPrideSplinesQuad *)&v8 preSemaphoreComputeForTime:a3];
  if (v4)
  {
    float vignetteAmount = self->_vignetteAmount;
    if (LOBYTE(self->_displayMode)) {
      BOOL v6 = vignetteAmount == 1.0;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      float vignetteAmount = vignetteAmount + 0.0333333333;
      if (vignetteAmount > 1.0)
      {
        LOBYTE(self->_displayMode) = 0;
        float vignetteAmount = 1.0;
      }
    }
    self->_float vignetteAmount = vignetteAmount;
  }
  return v4;
}

- (id)getNTKPrideSplineDefinitionFiller
{
  int v22 = 0;
  long long v21 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  float v3 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_7198(v3, (uint64_t)&v19);

  double v4 = 0.25;
  if (*(void *)&self->_paused == 1) {
    double v4 = 0.75;
  }
  double v5 = fmin((1.0 - self->_aspectRatio - v4) * 2.0 + 0.5, 1.0);
  if (v5 < 0.0) {
    double v5 = 0.0;
  }
  float v6 = v5;
  float vignetteAmount = self->_vignetteAmount;
  [(NTKPrideSplinesQuad *)self fadeMultiplier];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  long long v13 = v19;
  long long v14 = v20;
  v12[2] = sub_88F8;
  v12[3] = &unk_24710;
  v12[4] = self;
  long long v15 = v21;
  int v16 = v22;
  float v17 = v6;
  float v18 = vignetteAmount * v8;
  uint64_t v9 = objc_retainBlock(v12);
  long long v10 = objc_retainBlock(v9);

  return v10;
}

- (BOOL)useXRsRGB
{
  return self->_currentStyle;
}

@end