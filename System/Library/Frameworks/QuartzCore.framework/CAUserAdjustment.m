@interface CAUserAdjustment
- (CAUserAdjustment)initWithXDelta:(double)a3 yDelta:(double)a4 luminanceScale:(double)a5;
- (CAUserAdjustment)initWithXDelta:(double)a3 yDelta:(double)a4 luminanceScale:(double)a5 timestamp:(double)a6;
- (double)luminanceScale;
- (double)timestamp;
- (double)xDelta;
- (double)yDelta;
@end

@implementation CAUserAdjustment

- (double)timestamp
{
  return self->_timestamp;
}

- (double)luminanceScale
{
  return self->_luminanceScale;
}

- (double)yDelta
{
  return self->_yDelta;
}

- (double)xDelta
{
  return self->_xDelta;
}

- (CAUserAdjustment)initWithXDelta:(double)a3 yDelta:(double)a4 luminanceScale:(double)a5 timestamp:(double)a6
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)CAUserAdjustment;
  result = [(CAUserAdjustment *)&v11 init];
  if (result)
  {
    result->_xDelta = a3;
    result->_yDelta = a4;
    result->_luminanceScale = a5;
    result->_timestamp = a6;
  }
  return result;
}

- (CAUserAdjustment)initWithXDelta:(double)a3 yDelta:(double)a4 luminanceScale:(double)a5
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "now"), "timeIntervalSince1970");

  return [(CAUserAdjustment *)self initWithXDelta:a3 yDelta:a4 luminanceScale:a5 timestamp:v9];
}

@end