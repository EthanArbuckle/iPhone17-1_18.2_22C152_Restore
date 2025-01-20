@interface NTKMagmaCrownEffect
- (BOOL)idle;
- (BOOL)isComplete;
- (NTKMagmaCrownEffect)init;
- (float)offset;
- (void)applyForTime:(double)a3 quad:(id)a4;
- (void)setIdle:(BOOL)a3;
- (void)setOffset:(float)a3;
@end

@implementation NTKMagmaCrownEffect

- (NTKMagmaCrownEffect)init
{
  v3.receiver = self;
  v3.super_class = (Class)NTKMagmaCrownEffect;
  result = [(NTKMagmaCrownEffect *)&v3 init];
  if (result) {
    result->_idle = 1;
  }
  return result;
}

- (void)setIdle:(BOOL)a3
{
  if (self->_idle != a3) {
    self->_idle = a3;
  }
}

- (void)applyForTime:(double)a3 quad:(id)a4
{
  if (!self->_idle)
  {
    id v10 = a4;
    [v10 size];
    *(float *)&double v5 = v5 * 0.5;
    unsigned int v9 = LODWORD(v5);
    [v10 size];
    double v6 = 1.0;
    *(float *)&double v7 = v7 * (1.0 - self->_offset);
    double v8 = COERCE_DOUBLE(__PAIR64__(LODWORD(v7), v9));
    LODWORD(v6) = 1053609165;
    LODWORD(v7) = 5.0;
    [v10 applyInverseQuadraticRepuslorWithOrigin:v8 magnitude:v7 radius:v6];
  }
}

- (BOOL)isComplete
{
  return self->complete;
}

- (float)offset
{
  return self->_offset;
}

- (void)setOffset:(float)a3
{
  self->_offset = a3;
}

- (BOOL)idle
{
  return self->_idle;
}

@end