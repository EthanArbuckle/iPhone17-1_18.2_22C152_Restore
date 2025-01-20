@interface ASVVelocitySample2D
- (ASVVelocitySample2D)initWithStart:(ASVVelocitySample2D *)self end:(SEL)a2 deltaTime:(double)a3;
- (double)calcFinalVelocityFromPreviousSample:(void *)a3;
- (double)deltaTime;
- (double)end;
- (double)start;
- (uint64_t)velocity;
- (void)setDeltaTime:(double)a3;
- (void)setEnd:(ASVVelocitySample2D *)self;
- (void)setStart:(ASVVelocitySample2D *)self;
@end

@implementation ASVVelocitySample2D

- (ASVVelocitySample2D)initWithStart:(ASVVelocitySample2D *)self end:(SEL)a2 deltaTime:(double)a3
{
  double v5 = v4;
  uint64_t v6 = v3;
  v9.receiver = self;
  v9.super_class = (Class)ASVVelocitySample2D;
  result = [(ASVVelocitySample2D *)&v9 init];
  if (result)
  {
    *(double *)result->_start = a3;
    *(void *)result->_end = v6;
    result->_deltaTime = v5;
  }
  return result;
}

- (uint64_t)velocity
{
  uint64_t result = [a1 deltaTime];
  if (v3 >= 0.00000011920929)
  {
    objc_msgSend(a1, "end", 0.0);
    [a1 start];
    return [a1 deltaTime];
  }
  return result;
}

- (double)calcFinalVelocityFromPreviousSample:(void *)a3
{
  return _Z28calcFinalVelocityFromSamplesIDv2_f19ASVVelocitySample2DET_PT0_S4_(a1, a3);
}

- (double)start
{
  return *(double *)(a1 + 8);
}

- (void)setStart:(ASVVelocitySample2D *)self
{
  *(void *)self->_start = v2;
}

- (double)end
{
  return *(double *)(a1 + 16);
}

- (void)setEnd:(ASVVelocitySample2D *)self
{
  *(void *)self->_end = v2;
}

- (double)deltaTime
{
  return self->_deltaTime;
}

- (void)setDeltaTime:(double)a3
{
  self->_deltaTime = a3;
}

@end