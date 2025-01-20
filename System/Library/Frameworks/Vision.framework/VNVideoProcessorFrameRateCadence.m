@interface VNVideoProcessorFrameRateCadence
- (BOOL)isEqual:(id)a3;
- (NSInteger)frameRate;
- (VNVideoProcessorFrameRateCadence)initWithFrameRate:(NSInteger)frameRate;
- (void)populateVCPVideoProcessorRequestConfiguration:(id)a3;
@end

@implementation VNVideoProcessorFrameRateCadence

- (NSInteger)frameRate
{
  return self->_frameRate;
}

- (void)populateVCPVideoProcessorRequestConfiguration:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VNVideoProcessorFrameRateCadence;
  id v4 = a3;
  [(VNVideoProcessorCadence *)&v6 populateVCPVideoProcessorRequestConfiguration:v4];
  v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[VNVideoProcessorFrameRateCadence frameRate](self, "frameRate", v6.receiver, v6.super_class));
  [v4 setObject:v5 forKeyedSubscript:@"VNVideoProcessingOptionFrameCadence"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VNVideoProcessorFrameRateCadence *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      NSInteger v6 = [(VNVideoProcessorFrameRateCadence *)self frameRate];
      uint64_t v7 = [(VNVideoProcessorFrameRateCadence *)v5 frameRate];

      BOOL v8 = v6 == v7;
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (VNVideoProcessorFrameRateCadence)initWithFrameRate:(NSInteger)frameRate
{
  v5.receiver = self;
  v5.super_class = (Class)VNVideoProcessorFrameRateCadence;
  result = [(VNVideoProcessorFrameRateCadence *)&v5 init];
  if (result) {
    result->_frameRate = frameRate;
  }
  return result;
}

@end