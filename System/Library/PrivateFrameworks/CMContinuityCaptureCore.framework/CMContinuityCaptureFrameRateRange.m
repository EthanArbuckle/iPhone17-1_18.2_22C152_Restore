@interface CMContinuityCaptureFrameRateRange
+ (id)frameRateRangeWithMinRate:(unsigned int)a3 maxFrameRate:(unsigned int)a4;
- (CMContinuityCaptureFrameRateRange)initWithMinFrameRate:(unsigned int)a3 maxFrameRate:(unsigned int)a4;
- (NSNumber)maxFrameRate;
- (NSNumber)minFrameRate;
@end

@implementation CMContinuityCaptureFrameRateRange

+ (id)frameRateRangeWithMinRate:(unsigned int)a3 maxFrameRate:(unsigned int)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMinFrameRate:*(void *)&a3 maxFrameRate:*(void *)&a4];
  return v4;
}

- (CMContinuityCaptureFrameRateRange)initWithMinFrameRate:(unsigned int)a3 maxFrameRate:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  v12.receiver = self;
  v12.super_class = (Class)CMContinuityCaptureFrameRateRange;
  v6 = [(CMContinuityCaptureFrameRateRange *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [NSNumber numberWithUnsignedInt:v5];
    minFrameRate = v6->_minFrameRate;
    v6->_minFrameRate = (NSNumber *)v7;

    uint64_t v9 = [NSNumber numberWithUnsignedInt:v4];
    maxFrameRate = v6->_maxFrameRate;
    v6->_maxFrameRate = (NSNumber *)v9;
  }
  return v6;
}

- (NSNumber)minFrameRate
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)maxFrameRate
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxFrameRate, 0);
  objc_storeStrong((id *)&self->_minFrameRate, 0);
}

@end