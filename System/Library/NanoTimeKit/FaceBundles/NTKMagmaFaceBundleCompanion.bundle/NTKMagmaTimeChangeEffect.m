@interface NTKMagmaTimeChangeEffect
- (BOOL)isComplete;
- (NTKMagmaTimeChangeEffect)initWithStart:(double)a3 duration:(double)a4 magnitude:(double)a5 radius:(double)a6;
- (void)applyForTime:(double)a3 quad:(id)a4;
@end

@implementation NTKMagmaTimeChangeEffect

- (NTKMagmaTimeChangeEffect)initWithStart:(double)a3 duration:(double)a4 magnitude:(double)a5 radius:(double)a6
{
  v11.receiver = self;
  v11.super_class = (Class)NTKMagmaTimeChangeEffect;
  result = [(NTKMagmaTimeChangeEffect *)&v11 init];
  if (result)
  {
    result->_start = a3;
    result->_duration = a4;
    result->_magnitude = a5;
    result->_radius = a6;
  }
  return result;
}

- (void)applyForTime:(double)a3 quad:(id)a4
{
  double start = self->_start;
  double duration = self->_duration;
  if (start + duration >= a3)
  {
    float v7 = (a3 - start) / duration;
    id v19 = a4;
    [v19 size];
    *(double *)&long long v9 = v8 * 0.5;
    *(float *)&long long v9 = *(double *)&v9;
    long long v17 = v9;
    [v19 size];
    float v11 = (1.0 - v7) * v10;
    long long v12 = v17;
    *((float *)&v12 + 1) = v11;
    long long v18 = v12;
    double magnitude = self->_magnitude;
    if (UIAccessibilityIsReduceMotionEnabled()) {
      double v16 = 0.5;
    }
    else {
      double v16 = 1.0;
    }
    *(float *)&double v14 = magnitude * v16;
    *(float *)&double v15 = self->_radius;
    objc_msgSend(v19, "applyQuadraticRepuslorWithOrigin:magnitude:radius:", *(double *)&v18, v14, v15, v18);
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