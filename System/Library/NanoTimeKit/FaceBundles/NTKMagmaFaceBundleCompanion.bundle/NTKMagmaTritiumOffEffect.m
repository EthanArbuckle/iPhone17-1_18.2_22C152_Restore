@interface NTKMagmaTritiumOffEffect
- (BOOL)isComplete;
- (NTKMagmaTritiumOffEffect)initWithStart:(double)a3 duration:(double)a4 magnitude:(double)a5 radius:(double)a6 speed:(double)a7;
- (void)applyForTime:(double)a3 quad:(id)a4;
@end

@implementation NTKMagmaTritiumOffEffect

- (NTKMagmaTritiumOffEffect)initWithStart:(double)a3 duration:(double)a4 magnitude:(double)a5 radius:(double)a6 speed:(double)a7
{
  v23.receiver = self;
  v23.super_class = (Class)NTKMagmaTritiumOffEffect;
  v12 = [(NTKMagmaTritiumOffEffect *)&v23 init];
  v13 = v12;
  if (v12)
  {
    v12->_start = a3;
    v12->_duration = a4;
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    double v15 = 1.0;
    if (IsReduceMotionEnabled) {
      double v15 = 0.5;
    }
    v13->_magnitude = v15 * a5;
    v13->_radius = a6;
    v13->_speed = a7;
    v16 = &v13->_randomParams[40];
    for (uint64_t i = 1; i != 4; ++i)
    {
      for (uint64_t j = 0; j != 16; j += 8)
      {
        float v19 = (double)arc4random() / 4294967300.0;
        float v22 = v19;
        if (arc4random_uniform(2u)) {
          float v20 = 1.0;
        }
        else {
          float v20 = -1.0;
        }
        *(void *)&v16[j] = __PAIR64__(LODWORD(v20), LODWORD(v22));
      }
      v16 += 32;
    }
  }
  return v13;
}

- (void)applyForTime:(double)a3 quad:(id)a4
{
  id v6 = a4;
  double start = self->_start;
  double duration = self->_duration;
  if (start + duration >= a3)
  {
    float v9 = (a3 - start) / duration;
    double v10 = 1.0 - (float)((float)(v9 * 2.0) + -1.0) * (float)((float)(v9 * 2.0) + -1.0);
    *(float *)&double v10 = v10;
    double v22 = v10;
    double v11 = self->_speed * v9;
    v12 = &self->_randomParams[40];
    unint64_t v13 = 1;
    id v25 = v6;
    do
    {
      for (uint64_t i = 0; i != 2; ++i)
      {
        objc_msgSend(v25, "size", *(void *)&v22);
        *(float *)&double v15 = (double)(unint64_t)(i + 1) / 3.0 * v15;
        unsigned int v23 = LODWORD(v15);
        [v25 size];
        *(float *)&unsigned int v17 = (double)v13 * 0.25 * v16;
        double v24 = COERCE_DOUBLE(__PAIR64__(v17, v23));
        double v18 = (COERCE_FLOAT(*(void *)&v12[8 * i]) + v11 * COERCE_FLOAT(HIDWORD(*(void *)&v12[8 * i]))) * 3.14159265;
        *(float *)&double v18 = v18 + v18;
        __float2 v19 = __sincosf_stret(*(float *)&v18);
        double radius = self->_radius;
        float magnitude = self->_magnitude;
        *(float *)&double radius = radius;
        objc_msgSend(v25, "applyQuadraticDragWithOrigin:drag:radius:", v24, COERCE_DOUBLE(vmul_n_f32(vmul_n_f32((float32x2_t)v19, *(float *)&v22), magnitude)), radius);
        id v6 = v25;
      }
      ++v13;
      v12 += 32;
    }
    while (v13 != 4);
  }
  else
  {
    self->_complete = 1;
  }
}

- (BOOL)isComplete
{
  return self->_complete;
}

@end