@interface VNVideoProcessorTimeIntervalCadence
- (BOOL)isEqual:(id)a3;
- (CFTimeInterval)timeInterval;
- (VNVideoProcessorTimeIntervalCadence)initWithTimeInterval:(CFTimeInterval)timeInterval;
- (unint64_t)hash;
- (void)populateVCPVideoProcessorRequestConfiguration:(id)a3;
@end

@implementation VNVideoProcessorTimeIntervalCadence

- (CFTimeInterval)timeInterval
{
  return self->_timeInterval;
}

- (void)populateVCPVideoProcessorRequestConfiguration:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VNVideoProcessorTimeIntervalCadence;
  id v4 = a3;
  [(VNVideoProcessorCadence *)&v7 populateVCPVideoProcessorRequestConfiguration:v4];
  v5 = NSNumber;
  [(VNVideoProcessorTimeIntervalCadence *)self timeInterval];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setObject:v6 forKeyedSubscript:@"VNVideoProcessingOptionTimeInterval"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNVideoProcessorTimeIntervalCadence *)a3;
  if (v4 == self)
  {
    BOOL v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      [(VNVideoProcessorTimeIntervalCadence *)self timeInterval];
      double v7 = v6;
      [(VNVideoProcessorTimeIntervalCadence *)v5 timeInterval];
      double v9 = v8;

      BOOL v10 = v7 == v9;
    }
    else
    {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  [(VNVideoProcessorTimeIntervalCadence *)self timeInterval];
  if (v2 == 0.0) {
    return 0;
  }
  else {
    return *(void *)&v2;
  }
}

- (VNVideoProcessorTimeIntervalCadence)initWithTimeInterval:(CFTimeInterval)timeInterval
{
  v5.receiver = self;
  v5.super_class = (Class)VNVideoProcessorTimeIntervalCadence;
  result = [(VNVideoProcessorTimeIntervalCadence *)&v5 init];
  if (result) {
    result->_timeInterval = timeInterval;
  }
  return result;
}

@end