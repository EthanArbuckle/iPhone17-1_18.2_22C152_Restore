@interface ADAnchoredVector
+ (id)vectorWithOrigin:(id)a1 direction:(SEL)a2;
+ (id)vectorWithTransform:(double)a3;
- (ADAnchoredVector)vectorByChangingPOV:(float32x4_t)a3;
- (__n128)direction;
- (__n128)origin;
- (double)intersectWithPlane:(float32x4_t)a3 normal:;
- (id)description;
- (void)setDirection:(ADAnchoredVector *)self;
- (void)setOrigin:(ADAnchoredVector *)self;
@end

@implementation ADAnchoredVector

- (void)setDirection:(ADAnchoredVector *)self
{
  *(_OWORD *)self->_direction = v2;
}

- (__n128)direction
{
  return a1[2];
}

- (void)setOrigin:(ADAnchoredVector *)self
{
  *(_OWORD *)self->_origin = v2;
}

- (__n128)origin
{
  return a1[1];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"origin:[%.3f,%.3f,%.3f] direction:[%.3f,%.3f,%.3f]", *(float *)self->_origin, *(float *)&self->_origin[4], *(float *)&self->_origin[8], *(float *)self->_direction, *(float *)&self->_direction[4], *(float *)&self->_direction[8]);
}

- (double)intersectWithPlane:(float32x4_t)a3 normal:
{
  float32x4_t v3 = a1[2];
  float32x4_t v4 = vmulq_f32(v3, a3);
  float32x4_t v5 = vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v4, 2), vaddq_f32(v4, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v4.f32, 1)));
  if (fabsf(v5.f32[0]) < 0.00000011921)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = 0;
      v6 = &_os_log_internal;
      v7 = "cannot find intersection: ray is perpendicular to plane normal";
      v8 = (uint8_t *)&v14;
LABEL_10:
      _os_log_error_impl(&dword_215F16000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
      return 0.0;
    }
    return 0.0;
  }
  float32x4_t v9 = a1[1];
  float32x4_t v10 = vmulq_f32(vsubq_f32(a2, v9), a3);
  float v11 = vdivq_f32(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v10, 2), vaddq_f32(v10, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v10.f32, 1))), v5).f32[0];
  if (v11 < 0.0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      __int16 v13 = 0;
      v6 = &_os_log_internal;
      v7 = "cannot find intersection: plane is behind ray origin";
      v8 = (uint8_t *)&v13;
      goto LABEL_10;
    }
    return 0.0;
  }
  *(void *)&double result = vmlaq_n_f32(v9, v3, v11).u64[0];
  return result;
}

- (ADAnchoredVector)vectorByChangingPOV:(float32x4_t)a3
{
  return +[ADAnchoredVector vectorWithOrigin:*(double *)vaddq_f32(a5, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1[2].f32)), a3, a1[2], 1), a4, *(float32x4_t *)a1[2].f32, 2)).i64 direction:*(double *)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(_OWORD *)a1[4].f32)), a3, a1[4], 1), a4, *(float32x4_t *)a1[4].f32, 2).i64];
}

+ (id)vectorWithTransform:(double)a3
{
  float32x4_t v4 = +[ADAnchoredVector vectorWithOrigin:0.0 direction:0.0];
  float32x4_t v5 = objc_msgSend(v4, "vectorByChangingPOV:", a1, a2, a3, a4);

  return v5;
}

+ (id)vectorWithOrigin:(id)a1 direction:(SEL)a2
{
  double v6 = v3;
  double v7 = v2;
  float32x4_t v4 = objc_opt_new();
  [v4 setOrigin:v7];
  [v4 setDirection:v6];
  return v4;
}

@end