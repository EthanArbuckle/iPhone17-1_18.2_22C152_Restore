@interface NTKPrideBetweenCircularQuad
- (BOOL)additiveBlendingEnabled;
- (float)_dampingFactorForSpline:(int)a3;
- (float)_dialRadiusForSpline:(int)a3;
- (float)_rectRadiusForSpline:(int)a3;
- (float)computeAmplitudeForControlPoint:(int)a3 inSpline:(int)a4 atTime:(double)a5;
- (float)softness;
- (id)fragmentShaderName;
- (id)noiseSamplePositionForControlPoint:(uint64_t)a3 inSpline:(uint64_t)a4;
- (id)renderPipelineManager;
- (id)renderPipelineName;
- (id)splineColorAtIndex:(int)a3;
- (id)vertexShaderName;
- (int)_numVertsForSpline:(int)a3;
- (int)numSplinesToDraw;
- (int)splineDrawOrder:(int)a3;
- (void)_colorSequenceForStartIndex:(int)a3 reverseDirection:(BOOL)a4 colorSequence:(id)a5;
@end

@implementation NTKPrideBetweenCircularQuad

- (int)_numVertsForSpline:(int)a3
{
  v3 = [(NTKPrideMetalQuad *)self clkDevice];
  v4 = (char *)[v3 deviceCategory];

  if (v4 == (unsigned char *)&dword_0 + 1) {
    return 252;
  }
  else {
    return 402;
  }
}

- (id)renderPipelineManager
{
  if (qword_2C8A8 != -1) {
    dispatch_once(&qword_2C8A8, &stru_24750);
  }
  v2 = (void *)qword_2C8A0;

  return v2;
}

- (id)vertexShaderName
{
  return @"pride_between_circles_vertex_shader";
}

- (id)fragmentShaderName
{
  return @"pride_noantialias_fragment_shader";
}

- (id)renderPipelineName
{
  return @"pride_between_circles";
}

- (int)numSplinesToDraw
{
  return [(NTKPrideCircularQuad *)self numSplines] - 1;
}

- (int)splineDrawOrder:(int)a3
{
  return [(NTKPrideBetweenCircularQuad *)self numSplinesToDraw] + ~a3;
}

- (void)_colorSequenceForStartIndex:(int)a3 reverseDirection:(BOOL)a4 colorSequence:(id)a5
{
  BOOL v5 = a4;
  unint64_t v6 = *(void *)&a3;
  v14 = (void (**)(id, void, __n128))a5;
  if ([(NTKPrideCircularQuad *)self numSplines] >= 1)
  {
    uint64_t v8 = 0;
    int v9 = v6 + 12;
    int32x4_t v13 = vdupq_n_s32(0x437F0000u);
    do
    {
      if (v8 <= [(NTKPrideCircularQuad *)self numSplines] - 3)
      {
        int v11 = dword_1DD40[v8];
        if (v5) {
          int v11 = 5 - v11;
        }
        int v12 = (v9 + v11) % 6;
        if ([(NTKPrideCircularQuad *)self useXRsRGB])
        {
          CLKUIConvertToRGBfFromXRSRGBf();
        }
        else
        {
          unint64_t v6 = v6 & 0xFFFFFFFF00000000 | PRIDE_COLORS_2020[v12];
          CLKUIConvertToRGBfFromSRGB8_fast();
        }
      }
      else
      {
        __n128 v10 = (__n128)xmmword_1DD30;
      }
      v14[2](v14, v8++, v10);
    }
    while (v8 < [(NTKPrideCircularQuad *)self numSplines]);
  }
}

- (float)softness
{
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideBetweenCircularQuad;
  [(NTKPrideCircularQuad *)&v3 softness];
  return result;
}

- (float)_dialRadiusForSpline:(int)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NTKPrideBetweenCircularQuad;
  [(NTKPrideCircularQuad *)&v16 _dialRadiusForSpline:[(NTKPrideCircularQuad *)self numSplines] - 1];
  float v6 = v5;
  float v7 = (float)a3 / (float)([(NTKPrideCircularQuad *)self numSplines] - 2);
  if ([(NTKPrideCircularQuad *)self numSplines] - 1 > a3)
  {
    int v8 = dword_1DD40[a3];
    uint64_t v9 = a3 + 1;
    if (v8 == dword_1DD40[v9])
    {
      uint64_t v10 = a3 - 1;
      if (v8 != dword_1DD40[v10])
      {
        float v11 = (float)(v7 + (float)((float)(int)v10 / (float)([(NTKPrideCircularQuad *)self numSplines] - 3)))
            * 0.5;
        [(NTKPrideBetweenCircularQuad *)self softness];
        float v7 = (float)(v12 * 0.5) + v11;
      }
    }
    else
    {
      float v13 = (float)(v7 + (float)((float)(int)v9 / (float)([(NTKPrideCircularQuad *)self numSplines] - 3)))
          * 0.5;
      [(NTKPrideBetweenCircularQuad *)self softness];
      float v7 = v13 - (float)(v14 * 0.5);
    }
  }
  return v6 * v7;
}

- (float)_rectRadiusForSpline:(int)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NTKPrideBetweenCircularQuad;
  [(NTKPrideCircularQuad *)&v16 _rectRadiusForSpline:[(NTKPrideCircularQuad *)self numSplines] - 1];
  float v6 = v5;
  float v7 = (float)a3 / (float)([(NTKPrideCircularQuad *)self numSplines] - 2);
  if ([(NTKPrideCircularQuad *)self numSplines] - 1 > a3)
  {
    int v8 = dword_1DD40[a3];
    uint64_t v9 = a3 + 1;
    if (v8 == dword_1DD40[v9])
    {
      uint64_t v10 = a3 - 1;
      if (v8 != dword_1DD40[v10])
      {
        float v11 = (float)(v7 + (float)((float)(int)v10 / (float)([(NTKPrideCircularQuad *)self numSplines] - 3)))
            * 0.5;
        [(NTKPrideBetweenCircularQuad *)self softness];
        float v7 = (float)(v12 * 0.5) + v11;
      }
    }
    else
    {
      float v13 = (float)(v7 + (float)((float)(int)v9 / (float)([(NTKPrideCircularQuad *)self numSplines] - 3)))
          * 0.5;
      [(NTKPrideBetweenCircularQuad *)self softness];
      float v7 = v13 - (float)(v14 * 0.5);
    }
  }
  return v6 * v7;
}

- (id)noiseSamplePositionForControlPoint:(uint64_t)a3 inSpline:(uint64_t)a4
{
  if ((int)([a1 numSplines] - 1) <= (int)a4) {
    return objc_msgSendSuper2(&v9, "noiseSamplePositionForControlPoint:inSpline:", a3, a4, a1, NTKPrideBetweenCircularQuad, v10.receiver, v10.super_class);
  }
  uint64_t v7 = (int)a4 + 1;
  if (dword_1DD40[(int)a4] == dword_1DD40[v7]) {
    return objc_msgSendSuper2(&v9, "noiseSamplePositionForControlPoint:inSpline:", a3, a4, a1, NTKPrideBetweenCircularQuad, v10.receiver, v10.super_class);
  }
  else {
    return objc_msgSendSuper2(&v10, "noiseSamplePositionForControlPoint:inSpline:", a3, v7, v9.receiver, v9.super_class, a1, NTKPrideBetweenCircularQuad);
  }
}

- (float)computeAmplitudeForControlPoint:(int)a3 inSpline:(int)a4 atTime:(double)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  unsigned int v9 = [(NTKPrideCircularQuad *)self numSplines];
  float result = 0.0;
  if ((int)(v9 - 4) >= (int)v6)
  {
    if ([(NTKPrideCircularQuad *)self numSplines] - 1 <= (int)v6
      || (uint64_t v11 = (int)v6 + 1, dword_1DD40[(int)v6] == dword_1DD40[v11]))
    {
      -[NTKPrideCircularQuad computeAmplitudeForControlPoint:inSpline:atTime:](&v12, "computeAmplitudeForControlPoint:inSpline:atTime:", v7, v6, a5, self, NTKPrideBetweenCircularQuad, v13.receiver, v13.super_class);
    }
    else
    {
      -[NTKPrideCircularQuad computeAmplitudeForControlPoint:inSpline:atTime:](&v13, "computeAmplitudeForControlPoint:inSpline:atTime:", v7, v11, a5, v12.receiver, v12.super_class, self, NTKPrideBetweenCircularQuad);
    }
  }
  return result;
}

- (float)_dampingFactorForSpline:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(NTKPrideCircularQuad *)self numSplines] - 1 <= a3
    || (uint64_t v5 = (int)v3 + 1, dword_1DD40[(int)v3] == dword_1DD40[v5]))
  {
    -[NTKPrideCircularQuad _dampingFactorForSpline:](&v7, "_dampingFactorForSpline:", v3, self, NTKPrideBetweenCircularQuad, v8.receiver, v8.super_class);
  }
  else
  {
    -[NTKPrideCircularQuad _dampingFactorForSpline:](&v8, "_dampingFactorForSpline:", v5, v7.receiver, v7.super_class, self, NTKPrideBetweenCircularQuad);
  }
  return result;
}

- (BOOL)additiveBlendingEnabled
{
  return 0;
}

- (id)splineColorAtIndex:(int)a3
{
  int v4 = a3 + 2;
  unsigned int v5 = [(NTKPrideCircularQuad *)self numSplines] - 1;
  if (v4 >= (int)v5) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = v4;
  }
  v9.receiver = self;
  v9.super_class = (Class)NTKPrideBetweenCircularQuad;
  objc_super v7 = [(NTKPrideCircularQuad *)&v9 splineColorAtIndex:v6];

  return v7;
}

@end