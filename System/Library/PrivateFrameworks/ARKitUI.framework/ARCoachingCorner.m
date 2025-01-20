@interface ARCoachingCorner
- (id)initWithRadius:(float32_t)a3 relativeThickness:(float32_t)a4 anchorA:(float32_t)a5 anchorB:(float32_t)a6 cornerEdge:(double)a7 mat:(double)a8;
@end

@implementation ARCoachingCorner

- (id)initWithRadius:(float32_t)a3 relativeThickness:(float32_t)a4 anchorA:(float32_t)a5 anchorB:(float32_t)a6 cornerEdge:(double)a7 mat:(double)a8
{
  float32x4_t v20 = (float32x4_t)xmmword_20B231E60;
  float32x4_t v21 = (float32x4_t)xmmword_20B231E60;
  v21.f32[0] = a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  float32x4_t v22 = (float32x4_t)xmmword_20B231E60;
  v22.f32[0] = a5;
  v30[0] = vmulq_n_f32(v21, a2);
  v30[1] = vmulq_n_f32(v22, a2);
  v20.f32[0] = a6;
  float32x4_t v23 = (float32x4_t)xmmword_20B2321F0;
  float32x4_t v24 = (float32x4_t)xmmword_20B2321F0;
  v24.f32[1] = a6;
  v30[2] = vmulq_n_f32(v20, a2);
  v30[3] = vmulq_n_f32(v24, a2);
  float32x4_t v25 = (float32x4_t)xmmword_20B2321F0;
  v25.f32[1] = a5;
  float32x4_t v26 = vmulq_n_f32(v25, a2);
  v23.f32[1] = a4;
  float32x4_t v27 = vmulq_n_f32(v23, a2);
  v30[4] = v26;
  v30[5] = v27;
  v29.receiver = a1;
  v29.super_class = (Class)ARCoachingCorner;
  v27.f32[0] = a3;
  return -[ARCoachingSpline initWithPoints:numPoints:relativeThickness:pattern:mat:](&v29, sel_initWithPoints_numPoints_relativeThickness_pattern_mat_, v30, 6, 0, *(double *)v27.i64, a10, a12, a14, a16);
}

@end