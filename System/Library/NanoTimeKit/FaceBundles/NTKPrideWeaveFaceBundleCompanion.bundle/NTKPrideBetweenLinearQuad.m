@interface NTKPrideBetweenLinearQuad
- ($8EF4127CF77ECA3DDB612FCF233DC3A8)noiseConfiguration;
- (BOOL)additiveBlendingEnabled;
- (BOOL)preSemaphoreComputeForTime:(double)a3;
- (NTKPrideBetweenLinearQuad)initWithDevice:(id)a3 useXRsRGB:(BOOL)a4;
- (float)_xPositionForSpline:(int)a3;
- (float)computeAmplitudeForControlPoint:(int)a3 inSpline:(int)a4 atTime:(double)a5;
- (id)fragmentShaderName;
- (id)getNTKPrideSplineDefinitionFiller;
- (id)noiseSamplePositionForControlPoint:(uint64_t)a3 inSpline:(uint64_t)a4;
- (id)renderPipelineManager;
- (id)renderPipelineName;
- (id)vertexShaderName;
- (int)numSplines;
- (int)numSplinesToDraw;
- (int)splineDrawOrder:(int)a3;
- (void)_generateSplineColors;
- (void)_generateSplinePositions;
- (void)_initializePerSplineData;
- (void)applyTransitionFromBandedToFabricWithFraction:(double)a3;
- (void)dealloc;
@end

@implementation NTKPrideBetweenLinearQuad

- (NTKPrideBetweenLinearQuad)initWithDevice:(id)a3 useXRsRGB:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = sub_12824(v6);
  v8 = [NTKPrideTouchCrownHandler alloc];
  LODWORD(v9) = 1.0;
  LODWORD(v10) = 1.5;
  v11 = [(NTKPrideTouchCrownHandler *)v8 initWithNumSplines:v7 strumWidth:0 strumSpeed:2 isCyclical:v9 padding:v10];
  v14.receiver = self;
  v14.super_class = (Class)NTKPrideBetweenLinearQuad;
  v12 = [(NTKPrideLinearQuad *)&v14 initWithDevice:v6 useXRsRGB:v4 touchCrownHandler:v11];

  if (v12) {
    [(NTKPrideLinearQuad *)v12 setFabricMode];
  }
  return v12;
}

- (void)dealloc
{
  v3 = *(void **)((char *)&self->super._currentStyle + 1);
  if (v3) {
    free(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)NTKPrideBetweenLinearQuad;
  [(NTKPrideLinearQuad *)&v4 dealloc];
}

- (id)renderPipelineManager
{
  if (qword_2C908 != -1) {
    dispatch_once(&qword_2C908, &stru_24A48);
  }
  v2 = (void *)qword_2C900;

  return v2;
}

- (id)vertexShaderName
{
  return @"pride_between_lines_vertex_shader";
}

- (id)fragmentShaderName
{
  return @"pride_noantialias_fragment_shader";
}

- (id)renderPipelineName
{
  return @"pride_between_lines";
}

- (void)applyTransitionFromBandedToFabricWithFraction:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideBetweenLinearQuad;
  [(NTKPrideLinearQuad *)&v3 applyTransitionFromBandedToFabricWithFraction:1.0];
}

- (float)computeAmplitudeForControlPoint:(int)a3 inSpline:(int)a4 atTime:(double)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  float v8 = 0.0;
  if (a4 && [(NTKPrideBetweenLinearQuad *)self numSplines] - 1 != a4)
  {
    uint64_t v10 = (int)v5 + 1;
    if (dword_1DE60[(int)v5] == dword_1DE60[v10]) {
      -[NTKPrideLinearQuad computeAmplitudeForControlPoint:inSpline:atTime:](&v15, "computeAmplitudeForControlPoint:inSpline:atTime:", v6, v5, a5, self, NTKPrideBetweenLinearQuad, v16.receiver, v16.super_class);
    }
    else {
      -[NTKPrideLinearQuad computeAmplitudeForControlPoint:inSpline:atTime:](&v16, "computeAmplitudeForControlPoint:inSpline:atTime:", v6, v10, a5, v15.receiver, v15.super_class, self, NTKPrideBetweenLinearQuad);
    }
    float v8 = v11;
  }
  int v12 = *(unsigned __int16 *)(&self->super._useXRsRGB + 2 * (int)v5 + 1);
  int v13 = v12 | (1 << v6);
  if (fabsf(v8) <= 0.2) {
    LOWORD(v13) = v12 & ~(1 << v6);
  }
  *(_WORD *)(&self->super._useXRsRGB + 2 * (int)v5 + 1) = v13;
  return v8;
}

- ($8EF4127CF77ECA3DDB612FCF233DC3A8)noiseConfiguration
{
  v2 = [(NTKPrideMetalQuad *)self clkDevice];
  objc_super v3 = _NoiseConfiguration(v2, 3);

  return ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v3;
}

- (void)_generateSplinePositions
{
  v12.receiver = self;
  v12.super_class = (Class)NTKPrideBetweenLinearQuad;
  [(NTKPrideLinearQuad *)&v12 _generateSplinePositions];
  objc_super v3 = [(NTKPrideMetalQuad *)self clkDevice];
  sub_12824(v3);
  float v5 = v4;

  uint64_t v6 = *(unint64_t *)((char *)&self->super._currentStyle + 1);
  *(_DWORD *)(v6 + 16) = 0;
  *(_DWORD *)(v6 + 32 * [(NTKPrideBetweenLinearQuad *)self numSplines] - 16) = 1065353216;
  if ([(NTKPrideBetweenLinearQuad *)self numSplines] >= 3)
  {
    uint64_t v7 = 0;
    float v8 = v5 * -0.5;
    uint64_t v9 = 48;
    do
    {
      float v10 = (double)(int)(v7 & 0xFFFFFFFE) * 0.0833333333 + 0.166666667;
      *(float *)(*(unint64_t *)((char *)&self->super._currentStyle + 1) + v9) = v10
                                                                                     + (float)(v8
                                                                                             * (float)(int)(((v7 + 1) & 1) - 1));
      v9 += 32;
      BOOL v11 = v7 + 2 < [(NTKPrideBetweenLinearQuad *)self numSplines] - 1;
      ++v7;
    }
    while (v11);
  }
}

- (id)noiseSamplePositionForControlPoint:(uint64_t)a3 inSpline:(uint64_t)a4
{
  if ((int)([a1 numSplines] - 1) <= (int)a4) {
    return objc_msgSendSuper2(&v9, "noiseSamplePositionForControlPoint:inSpline:", a3, a4, a1, NTKPrideBetweenLinearQuad, v10.receiver, v10.super_class);
  }
  uint64_t v7 = (int)a4 + 1;
  if (dword_1DE60[(int)a4] == dword_1DE60[v7]) {
    return objc_msgSendSuper2(&v9, "noiseSamplePositionForControlPoint:inSpline:", a3, a4, a1, NTKPrideBetweenLinearQuad, v10.receiver, v10.super_class);
  }
  else {
    return objc_msgSendSuper2(&v10, "noiseSamplePositionForControlPoint:inSpline:", a3, v7, v9.receiver, v9.super_class, a1, NTKPrideBetweenLinearQuad);
  }
}

- (void)_generateSplineColors
{
  if ([(NTKPrideBetweenLinearQuad *)self numSplines] >= 1)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    int32x4_t v7 = vdupq_n_s32(0x437F0000u);
    do
    {
      if ([(NTKPrideLinearQuad *)self useXRsRGB])
      {
        CLKUIConvertToRGBfFromXRSRGBf();
      }
      else
      {
        unint64_t v2 = v2 & 0xFFFFFFFF00000000 | PRIDE_COLORS_2020[dword_1DE60[v5]];
        CLKUIConvertToRGBfFromSRGB8_fast();
      }
      *(_OWORD *)(*(unint64_t *)((char *)&self->super._currentStyle + 1) + v4) = v6;
      ++v5;
      v4 += 32;
    }
    while (v5 < [(NTKPrideBetweenLinearQuad *)self numSplines]);
  }
}

- (void)_initializePerSplineData
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideBetweenLinearQuad;
  [(NTKPrideLinearQuad *)&v3 _initializePerSplineData];
  *(unint64_t *)((char *)&self->super._currentStyle + 1) = (unint64_t)malloc_type_calloc([(NTKPrideBetweenLinearQuad *)self numSplines], 0x20uLL, 0x1000040DD0CCB3EuLL);
}

- (int)numSplinesToDraw
{
  return [(NTKPrideBetweenLinearQuad *)self numSplines] - 1;
}

- (int)numSplines
{
  return 12;
}

- (int)splineDrawOrder:(int)a3
{
  int v3 = a3;
  if (LOBYTE(self->_amplitudeIsLarge[5])) {
    return [(NTKPrideBetweenLinearQuad *)self numSplinesToDraw] + ~a3;
  }
  return v3;
}

- (float)_xPositionForSpline:(int)a3
{
  return *(float *)(*(unint64_t *)((char *)&self->super._currentStyle + 1) + 32 * a3 + 16);
}

- (id)getNTKPrideSplineDefinitionFiller
{
  v9.receiver = self;
  v9.super_class = (Class)NTKPrideBetweenLinearQuad;
  [(NTKPrideLinearQuad *)&v9 getNTKPrideSplineDefinitionFiller];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_13028;
  v7[3] = &unk_24A70;
  v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = v8;
  uint64_t v4 = objc_retainBlock(v7);
  uint64_t v5 = objc_retainBlock(v4);

  return v5;
}

- (BOOL)additiveBlendingEnabled
{
  return 0;
}

- (BOOL)preSemaphoreComputeForTime:(double)a3
{
  uint64_t v3 = 0;
  uint64_t v4 = 0;
  do
  {
    v4 += *(unsigned __int16 *)(&self->super._useXRsRGB + v3 + 1);
    v3 += 2;
  }
  while (v3 != 24);
  if (v4)
  {
    if (!HIBYTE(self->_amplitudeIsLarge[4])) {
      HIBYTE(self->_amplitudeIsLarge[4]) = 1;
    }
  }
  else if (HIBYTE(self->_amplitudeIsLarge[4]))
  {
    HIBYTE(self->_amplitudeIsLarge[4]) = 0;
    LOBYTE(self->_amplitudeIsLarge[5]) ^= 1u;
  }
  v6.receiver = self;
  v6.super_class = (Class)NTKPrideBetweenLinearQuad;
  return [(NTKPrideLinearQuad *)&v6 preSemaphoreComputeForTime:a3];
}

@end