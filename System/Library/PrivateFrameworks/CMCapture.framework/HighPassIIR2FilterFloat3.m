@interface HighPassIIR2FilterFloat3
- (HighPassIIR2FilterFloat3)init;
- (__n128)filteredValue;
- (float32x4_t)updateValue:(double)a3 withPole:;
- (void)reset;
@end

@implementation HighPassIIR2FilterFloat3

- (HighPassIIR2FilterFloat3)init
{
  v5.receiver = self;
  v5.super_class = (Class)HighPassIIR2FilterFloat3;
  v2 = [(HighPassIIR2FilterFloat3 *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HighPassIIR2FilterFloat3 *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  *(_OWORD *)self->_filteredValue = 0u;
  *(_OWORD *)self->_lowPassBuffer1 = 0u;
  *(_OWORD *)self->_lowPassBuffer2 = 0u;
  self->_isFilterInitialized = 0;
}

- (float32x4_t)updateValue:(double)a3 withPole:
{
  if (*(float *)&a3 > 0.0 && *(float *)&a3 < 1.0)
  {
    if (a1[3].i8[0])
    {
      float32x4_t v5 = a1[2];
      float32x4_t v6 = vsubq_f32(a1[1], a2);
      float32x4_t v7 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a3, 0);
      v7.i32[3] = 0;
      v6.i32[3] = 0;
      float32x4_t v8 = a2;
      v8.i32[3] = 0;
      float32x4_t v9 = vmlaq_f32(v8, v6, v7);
      a1[1] = v9;
      float32x4_t v10 = vsubq_f32(v5, v9);
      v10.i32[3] = 0;
      v9.i32[3] = 0;
      float32x4_t v11 = vmlaq_f32(v9, v10, v7);
      a1[2] = v11;
    }
    else
    {
      a1[1] = a2;
      a1[2] = a2;
      a1[3].i8[0] = 1;
      float32x4_t v11 = a2;
    }
    *(float *)&a3 = 1.0
                  - (float)((float)((float)(1.0 - *(float *)&a3) / (float)(*(float *)&a3 + 1.0))
                          * (float)((float)(1.0 - *(float *)&a3) / (float)(*(float *)&a3 + 1.0)));
    float32x4_t result = vdivq_f32(vsubq_f32(a2, v11), (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a3, 0));
    a1[4] = result;
  }
  else
  {
    return a1[4];
  }
  return result;
}

- (__n128)filteredValue
{
  return a1[4];
}

@end