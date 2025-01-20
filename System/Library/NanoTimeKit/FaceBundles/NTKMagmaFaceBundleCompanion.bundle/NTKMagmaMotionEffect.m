@interface NTKMagmaMotionEffect
- (BOOL)isComplete;
- (double)linear;
- (float)noise;
- (float)spin;
- (void)applyForTime:(double)a3 quad:(id)a4;
- (void)setLinear:(NTKMagmaMotionEffect *)self;
- (void)setNoise:(float)a3;
- (void)setSpin:(float)a3;
@end

@implementation NTKMagmaMotionEffect

- (void)applyForTime:(double)a3 quad:(id)a4
{
  unint64_t frame = self->_frame;
  self->_unint64_t frame = (frame & 1) == 0;
  if (frame)
  {
    float32x2_t v6 = vadd_f32(*(float32x2_t *)self->_linear, *(float32x2_t *)self->_linear);
    id v13 = a4;
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    float v8 = 1.0;
    if (IsReduceMotionEnabled) {
      float v8 = 0.5;
    }
    objc_msgSend(v13, "applyLineImpulseWithQuadraticFalloff:", COERCE_DOUBLE(vmul_n_f32(v6, v8)));
    double v9 = (float)(self->_spin + self->_spin);
    BOOL v10 = UIAccessibilityIsReduceMotionEnabled();
    double v11 = 1.0;
    if (v10) {
      double v11 = 0.5;
    }
    double v12 = v11 * v9;
    *(float *)&double v12 = v12;
    [v13 applySpinWithMagnitude:v12];
  }
}

- (BOOL)isComplete
{
  return 0;
}

- (double)linear
{
  return *(double *)(a1 + 24);
}

- (void)setLinear:(NTKMagmaMotionEffect *)self
{
  *(void *)self->_linear = v2;
}

- (float)spin
{
  return self->_spin;
}

- (void)setSpin:(float)a3
{
  self->_spin = a3;
}

- (float)noise
{
  return self->_noise;
}

- (void)setNoise:(float)a3
{
  self->_noise = a3;
}

@end