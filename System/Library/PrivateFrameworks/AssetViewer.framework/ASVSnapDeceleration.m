@interface ASVSnapDeceleration
- (ASVSnapDeceleration)initWithVelocity:(float)a3 minEndDelta:(float)a4 startingOffset:(float)a5 minOffset:(float)a6 maxOffset:(float)a7;
- (float)currentOffset;
- (float)decelerationDelta;
- (float)maxOffset;
- (float)minOffset;
- (void)calculateSnapFromStartingOffset:(float)a3 startingVelocity:(float)a4 deltaTime:(float)a5 outOffset:(float *)a6 outVelocity:(float *)a7;
- (void)setCurrentOffset:(float)a3;
- (void)setMaxOffset:(float)a3;
- (void)setMinOffset:(float)a3;
@end

@implementation ASVSnapDeceleration

- (ASVSnapDeceleration)initWithVelocity:(float)a3 minEndDelta:(float)a4 startingOffset:(float)a5 minOffset:(float)a6 maxOffset:(float)a7
{
  v11.receiver = self;
  v11.super_class = (Class)ASVSnapDeceleration;
  result = -[ASVDeceleration initWithVelocity:minEndDelta:](&v11, sel_initWithVelocity_minEndDelta_);
  if (result)
  {
    result->_currentOffset = a5;
    result->_minOffset = a6;
    result->_maxOffset = a7;
  }
  return result;
}

- (void)calculateSnapFromStartingOffset:(float)a3 startingVelocity:(float)a4 deltaTime:(float)a5 outOffset:(float *)a6 outVelocity:(float *)a7
{
  float v12 = (float)(a4 / 1000.0) * powf(0.998, a5);
  [(ASVSnapDeceleration *)self maxOffset];
  if (v13 < a3)
  {
    [(ASVSnapDeceleration *)self maxOffset];
    float v15 = v14;
    [(ASVSnapDeceleration *)self maxOffset];
    a3 = v15 + (float)((float)(a3 - v16) * powf(0.99, a5));
LABEL_5:
    float v12 = pow(0.99, a5) * v12;
    goto LABEL_6;
  }
  [(ASVSnapDeceleration *)self minOffset];
  if (v17 > a3)
  {
    [(ASVSnapDeceleration *)self minOffset];
    float v19 = v18;
    [(ASVSnapDeceleration *)self minOffset];
    a3 = v19 - (float)((float)(v20 - a3) * powf(0.99, a5));
    goto LABEL_5;
  }
LABEL_6:
  *a6 = a3 + (float)(v12 * a5);
  *a7 = v12 * 1000.0;
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
    float v7 = (v5 - v6) * 1000.0;
    [(ASVSnapDeceleration *)self currentOffset];
    float v9 = v8;
    [(ASVDeceleration *)self velocity];
    LODWORD(v11) = v10;
    uint64_t v22 = 0;
    *(float *)&double v12 = v9;
    *(float *)&double v13 = v7;
    [(ASVSnapDeceleration *)self calculateSnapFromStartingOffset:(char *)&v22 + 4 startingVelocity:&v22 deltaTime:v12 outOffset:v11 outVelocity:v13];
    float v3 = *((float *)&v22 + 1) - v9;
    [(ASVSnapDeceleration *)self currentOffset];
    *(float *)&double v15 = v14 + v3;
    [(ASVSnapDeceleration *)self setCurrentOffset:v15];
    LODWORD(v16) = v22;
    [(ASVDeceleration *)self setVelocity:v16];
    if ([(ASVDeceleration *)self frameCount])
    {
      [(ASVDeceleration *)self minEndDelta];
      if (fabsf(v3) <= v17)
      {
        [(ASVDeceleration *)self setIsDecelerating:0];
        [(ASVSnapDeceleration *)self maxOffset];
        if (v9 > v18)
        {
          [(ASVSnapDeceleration *)self maxOffset];
          return v19 - v9;
        }
        [(ASVSnapDeceleration *)self minOffset];
        float v3 = 0.0;
        if (v9 < v20)
        {
          [(ASVSnapDeceleration *)self minOffset];
          return v19 - v9;
        }
      }
    }
  }
  return v3;
}

- (float)currentOffset
{
  return self->_currentOffset;
}

- (void)setCurrentOffset:(float)a3
{
  self->_currentOffset = a3;
}

- (float)minOffset
{
  return self->_minOffset;
}

- (void)setMinOffset:(float)a3
{
  self->_minOffset = a3;
}

- (float)maxOffset
{
  return self->_maxOffset;
}

- (void)setMaxOffset:(float)a3
{
  self->_maxOffset = a3;
}

@end