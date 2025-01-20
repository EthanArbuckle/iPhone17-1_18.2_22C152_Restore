@interface ASVDampingDeceleration
- (ASVDampingDeceleration)initWithVelocity:(float)a3 minEndDelta:(float)a4 decelerationRate:(float)a5;
- (float)decelerationDelta;
- (float)decelerationRate;
- (void)setDecelerationRate:(float)a3;
@end

@implementation ASVDampingDeceleration

- (ASVDampingDeceleration)initWithVelocity:(float)a3 minEndDelta:(float)a4 decelerationRate:(float)a5
{
  v7.receiver = self;
  v7.super_class = (Class)ASVDampingDeceleration;
  result = -[ASVDeceleration initWithVelocity:minEndDelta:](&v7, sel_initWithVelocity_minEndDelta_);
  if (result) {
    result->_decelerationRate = a5;
  }
  return result;
}

- (float)decelerationDelta
{
  float v3 = 0.0;
  if ([(ASVDeceleration *)self isDecelerating])
  {
    [(ASVDeceleration *)self setFrameCount:[(ASVDeceleration *)self frameCount] + 1];
    [(ASVDeceleration *)self currentTime];
    -[ASVDeceleration setPreviousTime:](self, "setPreviousTime:");
    [(ASVDeceleration *)self setCurrentTime:CACurrentMediaTime()];
    [(ASVDeceleration *)self currentTime];
    double v5 = v4;
    [(ASVDeceleration *)self previousTime];
    *(float *)&double v6 = v5 - v6;
    float v7 = *(float *)&v6 * 1000.0;
    [(ASVDeceleration *)self velocity];
    float v9 = v8 / 1000.0;
    [(ASVDampingDeceleration *)self decelerationRate];
    long double v11 = pow(v10, v7);
    float v12 = v11;
    float v13 = v9 * v12;
    *(float *)&long double v11 = v13 * 1000.0;
    [(ASVDeceleration *)self setVelocity:(double)v11];
    [(ASVDampingDeceleration *)self decelerationRate];
    double v15 = v14;
    [(ASVDampingDeceleration *)self decelerationRate];
    float v17 = (1.0 - v12) / (1.0 - v16) * v15;
    float v3 = v13 * v17;
    if ([(ASVDeceleration *)self frameCount])
    {
      [(ASVDeceleration *)self velocity];
      float v19 = fabsf(v18);
      [(ASVDeceleration *)self minEndDelta];
      if (v19 <= v20)
      {
        [(ASVDeceleration *)self setIsDecelerating:0];
        return 0.0;
      }
    }
  }
  return v3;
}

- (float)decelerationRate
{
  return self->_decelerationRate;
}

- (void)setDecelerationRate:(float)a3
{
  self->_decelerationRate = a3;
}

@end