@interface ARCoachingArc
- (id)initWithRadius:(double)a3 mat:(double)a4;
@end

@implementation ARCoachingArc

- (id)initWithRadius:(double)a3 mat:(double)a4
{
  uint64_t v7 = 0;
  uint64_t v18 = *MEMORY[0x263EF8340];
  do
  {
    float v8 = (float)((float)(v7 - 1) / 3.0) * 3.14159265 * 0.5;
    float32x4_t v9 = vmulq_n_f32((float32x4_t)*(unint64_t *)&__sincosf_stret(v8), a2);
    v17[v7++] = v9;
  }
  while (v7 != 6);
  v16.receiver = a1;
  v16.super_class = (Class)ARCoachingArc;
  v9.i32[0] = *(_DWORD *)"333?";
  return -[ARCoachingSpline initWithPoints:numPoints:relativeThickness:pattern:mat:](&v16, sel_initWithPoints_numPoints_relativeThickness_pattern_mat_, v17, 6, 0, *(double *)v9.i64, a3, a4, a5, a6);
}

@end