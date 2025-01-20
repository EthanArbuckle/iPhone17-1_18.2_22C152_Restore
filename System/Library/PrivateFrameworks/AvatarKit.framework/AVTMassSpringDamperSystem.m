@interface AVTMassSpringDamperSystem
- (AVTMassSpringDamperSystem)init;
- initWithPerceptualDuration:(float)a3 bounce:;
- (double)float3ValueAtTime:(float32x4_t)a3 initialValue:(float32x4_t)a4 initialVelocity:(float32x4_t)a5 targetValue:;
- (float)initWithMass:(float)a3 stiffness:(float)a4 damping:;
- (void)_updateParameters;
- (void)float3VelocityAtTime:(float32x4_t)a3 initialValue:(double)a4 initialVelocity:(float32x4_t)a5 targetValue:;
@end

@implementation AVTMassSpringDamperSystem

- (AVTMassSpringDamperSystem)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVTMassSpringDamperSystem;
  v2 = [(AVTMassSpringDamperSystem *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_mass = 0x42C8000000000000;
    v2->_damping = 10.0;
    v2->_allowsOverdamping = 0;
    [(AVTMassSpringDamperSystem *)v2 _updateParameters];
  }
  return v3;
}

- (float)initWithMass:(float)a3 stiffness:(float)a4 damping:
{
  if (!a1) {
    return 0;
  }
  v13.receiver = a1;
  v13.super_class = (Class)AVTMassSpringDamperSystem;
  v7 = (float *)objc_msgSendSuper2(&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    float v9 = 0.0;
    if (a2 >= 0.0) {
      float v9 = a2;
    }
    float v10 = 100.0;
    if (a3 >= 0.0) {
      float v10 = a3;
    }
    v7[2] = v9;
    v7[3] = v10;
    float v11 = 10.0;
    if (a4 >= 0.0) {
      float v11 = a4;
    }
    v7[4] = v11;
    *((unsigned char *)v7 + 24) = 1;
    [v7 _updateParameters];
  }
  return v8;
}

- initWithPerceptualDuration:(float)a3 bounce:
{
  if (!a1) {
    return 0;
  }
  v12.receiver = a1;
  v12.super_class = (Class)AVTMassSpringDamperSystem;
  objc_super v5 = objc_msgSendSuper2(&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5[2] = 1065353216;
    if (a2 <= 0.0)
    {
      float v8 = INFINITY;
    }
    else
    {
      float v7 = 6.28318531 / a2;
      float v8 = v7 * v7;
    }
    *((float *)v5 + 3) = v8;
    if (a3 >= 0.0) {
      float v9 = 1.0 - a3;
    }
    else {
      float v9 = 1.0 / (float)(a3 + 1.0);
    }
    float v10 = v9 * 12.5663706 / a2;
    *((float *)v5 + 4) = v10;
    *((unsigned char *)v5 + 24) = 1;
    [v5 _updateParameters];
  }
  return v6;
}

- (void)_updateParameters
{
  float mass = self->_mass;
  float stiffness = self->_stiffness;
  double v4 = sqrtf(stiffness / mass);
  float v5 = sqrtf(stiffness * mass);
  double v6 = self->_damping / (v5 + v5);
  self->w0 = v4;
  self->zeta = v6;
  if (v6 < 1.0)
  {
    double v7 = 1.0 - v6 * v6;
LABEL_6:
    self->wd = sqrt(v7) * v4;
    return;
  }
  if (v6 > 1.0 && self->_allowsOverdamping)
  {
    double v7 = v6 * v6 + -1.0;
    goto LABEL_6;
  }
}

- (double)float3ValueAtTime:(float32x4_t)a3 initialValue:(float32x4_t)a4 initialVelocity:(float32x4_t)a5 targetValue:
{
  if (a1)
  {
    float32x4_t v5 = a5;
    float32x4_t v7 = vabdq_f32(a3, a5);
    v8.i64[0] = 0x3400000034000000;
    v8.i64[1] = 0x3400000034000000;
    uint32x4_t v9 = (uint32x4_t)vcgtq_f32(v8, v7);
    v9.i32[3] = v9.i32[2];
    if ((vminvq_u32(v9) & 0x80000000) == 0)
    {
      float32x4_t v10 = vsubq_f32(a3, v5);
      double v11 = *(double *)(a1 + 40);
      float32x4_t v44 = v5;
      if (v11 >= 1.0)
      {
        if (v11 > 1.0 && *(unsigned char *)(a1 + 24))
        {
          double v21 = *(double *)(a1 + 48);
          double v22 = *(double *)(a1 + 32);
          double v23 = v21 - v11 * v22;
          float v24 = v23;
          float32x4_t v25 = vmlaq_n_f32(vnegq_f32(a4), v10, v24);
          double v26 = v21 + v21;
          *(float *)&double v26 = v21 + v21;
          float32x4_t v27 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v26, 0);
          float32x4_t v28 = vdivq_f32(v25, v27);
          v25.f32[0] = v21 + v11 * v22;
          float32x4_t v40 = vdivq_f32(vmlaq_n_f32(a4, v10, v25.f32[0]), v27);
          float32x4_t v42 = v28;
          float v29 = exp(-(v21 + v11 * v22) * a2);
          float v38 = v29;
          float v30 = exp(v23 * a2);
          float32x4_t v20 = vmlaq_n_f32(vmulq_n_f32(v40, v30), v42, v38);
        }
        else
        {
          double v31 = *(double *)(a1 + 32);
          float v32 = v31;
          float32x4_t v33 = vmlaq_n_f32(a4, v10, v32);
          float v34 = a2;
          float32x4_t v43 = vmlaq_n_f32(v10, v33, v34);
          float v35 = exp(-(a2 * v31));
          float32x4_t v20 = vmulq_n_f32(v43, v35);
        }
        float32x4_t v5 = v44;
      }
      else
      {
        double v12 = *(double *)(a1 + 32);
        double v13 = v11 * v12;
        *(float *)&double v13 = v11 * v12;
        float32x4_t v14 = vmlaq_n_f32(a4, v10, *(float *)&v13);
        double v15 = *(double *)(a1 + 48);
        *(float *)&double v13 = v15;
        float32x4_t v39 = vdivq_f32(v14, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v13, 0));
        float32x4_t v41 = v10;
        float v16 = exp(-(a2 * v11) * v12);
        float v37 = v16;
        __double2 v17 = __sincos_stret(v15 * a2);
        float32x4_t v5 = v44;
        float cosval = v17.__cosval;
        float sinval = v17.__sinval;
        float32x4_t v20 = vmulq_n_f32(vmlaq_n_f32(vmulq_n_f32(v39, sinval), v41, cosval), v37);
      }
      v5.i64[0] = vaddq_f32(v5, v20).u64[0];
    }
  }
  else
  {
    v5.i64[0] = 0;
  }
  return *(double *)v5.i64;
}

- (void)float3VelocityAtTime:(float32x4_t)a3 initialValue:(double)a4 initialVelocity:(float32x4_t)a5 targetValue:
{
  if (a1)
  {
    v6.i64[0] = 0x3400000034000000;
    v6.i64[1] = 0x3400000034000000;
    uint32x4_t v7 = (uint32x4_t)vcgtq_f32(v6, vabdq_f32(a3, a5));
    v7.i32[3] = v7.i32[2];
    if ((vminvq_u32(v7) & 0x80000000) == 0)
    {
      double v8 = *(double *)(a1 + 40);
      if (v8 >= 1.0)
      {
        if (v8 > 1.0 && *(unsigned char *)(a1 + 24))
        {
          double v10 = *(double *)(a1 + 48);
          double v11 = *(double *)(a1 + 32);
          double v12 = v10 - v8 * v11;
          exp(-(v10 + v8 * v11) * a2);
          exp(v12 * a2);
        }
        else
        {
          exp(-(a2 * *(double *)(a1 + 32)));
        }
      }
      else
      {
        double v9 = *(double *)(a1 + 48);
        exp(-(a2 * v8) * *(double *)(a1 + 32));
        __sincos_stret(v9 * a2);
      }
    }
  }
}

@end