@interface NTKPrideTouchCrownHandler
- (NTKPrideTouchCrownHandler)initWithNumSplines:(int)a3 strumWidth:(float)a4 strumSpeed:(float)a5 isCyclical:(BOOL)a6 padding:(int)a7;
- (float)strumAmplitudeForSpline:(int)a3;
- (void)_generateStrumCurveWithWidth:(float)a3;
- (void)_strumToCyclicalIndex:(int)a3 withVelocity:(double)a4;
- (void)_strumToLinearIndex:(int)a3 withVelocity:(double)a4;
- (void)clearTouches;
- (void)dealloc;
- (void)fadeStrumByAmount:(float)a3;
- (void)iterateTouchesWithBlock:(id)a3;
- (void)setPreviousCrownIndex:(int)a3;
- (void)startWaveAtX:(float)a3 y:(float)a4 atTime:(double)a5;
- (void)strumToOffset:(double)a3 withVelocity:(double)a4;
@end

@implementation NTKPrideTouchCrownHandler

- (NTKPrideTouchCrownHandler)initWithNumSplines:(int)a3 strumWidth:(float)a4 strumSpeed:(float)a5 isCyclical:(BOOL)a6 padding:(int)a7
{
  BOOL v8 = a6;
  v17.receiver = self;
  v17.super_class = (Class)NTKPrideTouchCrownHandler;
  v12 = [(NTKPrideTouchCrownHandler *)&v17 init];
  v14 = v12;
  if (v12)
  {
    v12->_isCyclical = v8;
    v12->_previousCrownIndex = 0;
    v12->_previousCrownOffset = 0.0;
    v12->_strumSpeed = a5;
    v12->_strumPad = a7;
    int v15 = 2 * a7;
    if (v8) {
      int v15 = 0;
    }
    v12->_numSplines = v15 + a3;
    *(float *)&double v13 = a4;
    [(NTKPrideTouchCrownHandler *)v12 _generateStrumCurveWithWidth:v13];
    v14->_strumAmplitudes = (float *)malloc_type_calloc(v14->_numSplines, 4uLL, 0x100004052888210uLL);
    v14->_strumTargets = (float *)malloc_type_calloc(v14->_numSplines, 4uLL, 0x100004052888210uLL);
  }
  return v14;
}

- (void)dealloc
{
  free(self->_strumAmplitudes);
  free(self->_strumTargets);
  v3.receiver = self;
  v3.super_class = (Class)NTKPrideTouchCrownHandler;
  [(NTKPrideTouchCrownHandler *)&v3 dealloc];
}

- (void)_generateStrumCurveWithWidth:(float)a3
{
  uint64_t v4 = 0;
  double v24 = (float)-a3;
  int32x2_t v5 = (int32x2_t)0x100000000;
  uint64x2_t v6 = (uint64x2_t)xmmword_1DD20;
  uint64x2_t v22 = (uint64x2_t)vdupq_n_s64(0xFuLL);
  int64x2_t v23 = vdupq_n_s64(2uLL);
  __asm
  {
    FMOV            V2.2D, #14.0
    FMOV            V0.2D, #4.0
  }
  float64x2_t v20 = _Q0;
  float64x2_t v21 = _Q2;
  __asm { FMOV            V0.2D, #-2.0 }
  float64x2_t v19 = _Q0;
  do
  {
    int64x2_t v27 = (int64x2_t)v6;
    unsigned __int8 v28 = vmovn_s64((int64x2_t)vcgtq_u64(v22, v6)).u8[0];
    v14.i64[0] = v5.i32[0];
    v14.i64[1] = v5.i32[1];
    float64x2_t v15 = vcvtq_f64_f32(vcvt_f32_f64(vmlaq_f64(v19, v20, vdivq_f64(vcvtq_f64_s64(v14), v21))));
    float64x2_t __y = vmulq_n_f64(vmulq_f64(v15, v15), v24);
    double v26 = pow(2.71828183, __y.f64[1]);
    double v16 = pow(2.71828183, __y.f64[0]);
    if (v28)
    {
      float v17 = v16;
      self->_strumCurve[v4] = v17;
    }
    if (vmovn_s64((int64x2_t)vcgtq_u64((uint64x2_t)vdupq_n_s64(0xFuLL), *(uint64x2_t *)&v27)).i32[1])
    {
      float v18 = v26;
      self->_strumCurve[v4 + 1] = v18;
    }
    uint64x2_t v6 = (uint64x2_t)vaddq_s64(v27, v23);
    int32x2_t v5 = vadd_s32(v5, (int32x2_t)0x200000002);
    v4 += 2;
  }
  while (v4 != 16);
}

- (void)_strumToCyclicalIndex:(int)a3 withVelocity:(double)a4
{
  float v4 = a4;
  if (a4 >= 0.0 || (uint64_t v5 = self->_previousCrownIndex, (int)v5 <= a3))
  {
    if (a4 <= 0.0 || (uint64_t v16 = self->_previousCrownIndex, (int)v16 >= a3))
    {
      if (a4 >= 0.0 || (int v27 = self->_previousCrownIndex, v27 >= a3))
      {
        if (a4 > 0.0)
        {
          uint64_t previousCrownIndex = self->_previousCrownIndex;
          if ((int)previousCrownIndex > a3)
          {
            int numSplines = self->_numSplines;
            int v40 = numSplines + a3;
            if ((int)previousCrownIndex < numSplines + a3)
            {
              strumTargets = self->_strumTargets;
              int v42 = previousCrownIndex - 7;
              uint64_t v43 = -previousCrownIndex;
              int v44 = previousCrownIndex - 7 + numSplines;
              do
              {
                int64_t v45 = ((unint64_t)(v43 + v42) << 32) + 0x700000000;
                uint64_t v46 = v42 - 1;
                int v47 = v44;
                do
                {
                  float v48 = strumTargets[v47 % numSplines]
                      + (float)(*(float *)((char *)self->_strumCurve + (v45 >> 30)) * v4) * 0.05;
                  strumTargets[v47 % numSplines] = v48;
                  v45 += 0x100000000;
                  ++v47;
                  ++v46;
                }
                while (v46 < previousCrownIndex + 6);
                ++previousCrownIndex;
                ++v42;
                LODWORD(v43) = v43 - 1;
                ++v44;
              }
              while (previousCrownIndex != v40);
            }
          }
        }
      }
      else
      {
        int v28 = self->_numSplines;
        if (v28 + v27 > a3)
        {
          v29 = self->_strumTargets;
          int v30 = a3 - 7;
          uint64_t v31 = a3;
          int v32 = a3 - 7 + v28;
          uint64_t v33 = -(uint64_t)a3;
          do
          {
            int64_t v34 = ((unint64_t)(v33 + v30) << 32) + 0x700000000;
            uint64_t v35 = v30 - 1;
            int v36 = v32;
            do
            {
              float v37 = v29[v36 % v28] + (float)(*(float *)((char *)self->_strumCurve + (v34 >> 30)) * v4) * 0.05;
              v29[v36 % v28] = v37;
              v34 += 0x100000000;
              ++v36;
              ++v35;
            }
            while (v35 < v31 + 6);
            ++v31;
            ++v30;
            LODWORD(v33) = v33 - 1;
            ++v32;
          }
          while (v31 != v28 + v27);
        }
      }
    }
    else
    {
      int v17 = self->_numSplines;
      float v18 = self->_strumTargets;
      int v19 = v16 - 7;
      uint64_t v20 = a3;
      uint64_t v21 = -v16;
      int v22 = v16 - 7 + v17;
      do
      {
        int64_t v23 = ((unint64_t)(v21 + v19) << 32) + 0x700000000;
        uint64_t v24 = v19 - 1;
        int v25 = v22;
        do
        {
          float v26 = v18[v25 % v17] + (float)(*(float *)((char *)self->_strumCurve + (v23 >> 30)) * v4) * 0.05;
          v18[v25 % v17] = v26;
          v23 += 0x100000000;
          ++v25;
          ++v24;
        }
        while (v24 < v16 + 6);
        ++v16;
        ++v19;
        LODWORD(v21) = v21 - 1;
        ++v22;
      }
      while (v16 != v20);
    }
  }
  else
  {
    int v6 = self->_numSplines;
    v7 = self->_strumTargets;
    int v8 = a3 - 7;
    uint64_t v9 = a3;
    uint64_t v10 = -(uint64_t)a3;
    int v11 = a3 - 7 + v6;
    do
    {
      int64_t v12 = ((unint64_t)(v10 + v8) << 32) + 0x700000000;
      uint64_t v13 = v8 - 1;
      int v14 = v11;
      do
      {
        float v15 = v7[v14 % v6] + (float)(*(float *)((char *)self->_strumCurve + (v12 >> 30)) * v4) * 0.05;
        v7[v14 % v6] = v15;
        v12 += 0x100000000;
        ++v14;
        ++v13;
      }
      while (v13 < v9 + 6);
      ++v9;
      ++v8;
      LODWORD(v10) = v10 - 1;
      ++v11;
    }
    while (v9 != v5);
  }
  *self->_strumTargets = self->_strumTargets[1];
}

- (void)_strumToLinearIndex:(int)a3 withVelocity:(double)a4
{
  uint64_t previousCrownIndex = self->_previousCrownIndex;
  int v5 = previousCrownIndex - a3;
  if ((int)previousCrownIndex - a3 < 0) {
    int v5 = a3 - previousCrownIndex;
  }
  uint64_t numSplines = self->_numSplines;
  if ((int)numSplines >= 0) {
    int v7 = self->_numSplines;
  }
  else {
    int v7 = numSplines + 1;
  }
  if (v5 <= v7 >> 1)
  {
    float v11 = fabs(a4);
    float v12 = (1.0 - pow(1000.0, (float)-v11)) * 5.0;
    if (a4 >= 0.0 || (int)previousCrownIndex <= a3)
    {
      if (a4 > 0.0 && (int)previousCrownIndex < a3)
      {
        int v22 = previousCrownIndex - 7;
        uint64_t v23 = -previousCrownIndex;
        do
        {
          uint64_t v24 = v22;
          int64_t v25 = ((unint64_t)(v23 + v22) << 32) + 0x700000000;
          uint64_t v26 = v24;
          do
          {
            if ((v26 & 0x8000000000000000) == 0 && v26 < numSplines)
            {
              strumTargets = self->_strumTargets;
              float v28 = strumTargets[v26]
                  + (float)(*(float *)((char *)self->_strumCurve + (v25 >> 30)) * v12) * 0.05;
              strumTargets[v26] = v28;
            }
            v25 += 0x100000000;
            BOOL v21 = v26++ < previousCrownIndex + 6;
          }
          while (v21);
          ++previousCrownIndex;
          int v22 = v24 + 1;
          LODWORD(v23) = v23 - 1;
        }
        while (a3 + 1 != previousCrownIndex);
      }
    }
    else
    {
      int v13 = a3 - 7;
      uint64_t v14 = a3;
      uint64_t v15 = -(uint64_t)a3;
      do
      {
        uint64_t v16 = v13;
        int64_t v17 = ((unint64_t)(v15 + v13) << 32) + 0x700000000;
        uint64_t v18 = v16;
        do
        {
          if ((v18 & 0x8000000000000000) == 0 && v18 < numSplines)
          {
            int v19 = self->_strumTargets;
            float v20 = v19[v18] + (float)(*(float *)((char *)self->_strumCurve + (v17 >> 30)) * v12) * 0.05;
            v19[v18] = v20;
          }
          v17 += 0x100000000;
          BOOL v21 = v18++ < v14 + 6;
        }
        while (v21);
        ++v14;
        int v13 = v16 + 1;
        LODWORD(v15) = v15 - 1;
      }
      while (previousCrownIndex + 1 != v14);
    }
  }
}

- (void)strumToOffset:(double)a3 withVelocity:(double)a4
{
  uint64_t v6 = (int)(a3 / self->_strumSpeed * (double)(self->_numSplines - 1));
  double v7 = a3 - self->_previousCrownOffset;
  if (self->_isCyclical) {
    [(NTKPrideTouchCrownHandler *)self _strumToCyclicalIndex:v6 withVelocity:v7];
  }
  else {
    [(NTKPrideTouchCrownHandler *)self _strumToLinearIndex:v6 withVelocity:v7];
  }
  self->_uint64_t previousCrownIndex = v6;
  self->_previousCrownOffset = a3;
}

- (void)setPreviousCrownIndex:(int)a3
{
  self->_uint64_t previousCrownIndex = 0;
  self->_previousCrownOffset = 0.0;
}

- (void)startWaveAtX:(float)a3 y:(float)a4 atTime:(double)a5
{
  unint64_t v5 = (self->_touchIndex + 1) % 0xA;
  if (a5 - self->_touchTimes[v5] > 1.75)
  {
    self->_touchIndex = v5;
    float v6 = a5 + 0.05;
    self->_touchTimes[v5] = v6;
    *(void *)&self->_touchCoords[8 * v5] = *(void *)&a3;
  }
}

- (void)clearTouches
{
  for (uint64_t i = 0; i != 10; ++i)
  {
    self->_touchTimes[i] = -3.4028e38;
    *(void *)&self->_touchCoords[8 * self->_touchIndex] = 0;
  }
  uint64_t numSplines = self->_numSplines;
  if ((int)numSplines >= 1)
  {
    strumAmplitudes = self->_strumAmplitudes;
    strumTargets = self->_strumTargets;
    do
    {
      *strumTargets++ = 0.0;
      *strumAmplitudes++ = 0.0;
      --numSplines;
    }
    while (numSplines);
  }
}

- (void)iterateTouchesWithBlock:(id)a3
{
  uint64_t v4 = 0;
  touchTimes = self->_touchTimes;
  do
  {
    (*((void (**)(id, SEL, float, double))a3 + 2))(a3, a2, touchTimes[v4], *(double *)&touchTimes[2 * v4 - 20]);
    ++v4;
  }
  while (v4 != 10);
}

- (void)fadeStrumByAmount:(float)a3
{
  uint64_t numSplines = self->_numSplines;
  if ((int)numSplines >= 1)
  {
    strumAmplitudes = self->_strumAmplitudes;
    for (uint64_t i = self->_strumTargets; ; ++i)
    {
      float v6 = *strumAmplitudes;
      if (*i < *strumAmplitudes) {
        break;
      }
      if (*i > *strumAmplitudes)
      {
        double v7 = v6 + (float)(*i - v6) * 0.3;
        goto LABEL_7;
      }
LABEL_8:
      float v9 = *i * 0.96;
      *uint64_t i = v9;
      if (fabsf(*strumAmplitudes) < 0.001)
      {
        float *strumAmplitudes = 0.0;
        float v9 = *i;
      }
      if (fabsf(v9) < 0.001) {
        *uint64_t i = 0.0;
      }
      ++strumAmplitudes;
      if (!--numSplines) {
        return;
      }
    }
    double v7 = v6 * 0.96;
LABEL_7:
    float v8 = v7;
    float *strumAmplitudes = v8;
    goto LABEL_8;
  }
}

- (float)strumAmplitudeForSpline:(int)a3
{
  if (self->_isCyclical) {
    int strumPad = 0;
  }
  else {
    int strumPad = self->_strumPad;
  }
  return self->_strumAmplitudes[strumPad + a3];
}

@end