@interface ARMLIntermediateDownScalingResultData
- (ARImageData)originalImageData;
- (ARMLIntermediateDownScalingResultData)initWithPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4 originalImageData:(id)a5;
- (BOOL)isEqual:(id)a3;
- (__CVBuffer)pixelBuffer;
- (double)timestamp;
- (void)dealloc;
@end

@implementation ARMLIntermediateDownScalingResultData

- (ARMLIntermediateDownScalingResultData)initWithPixelBuffer:(__CVBuffer *)a3 timestamp:(double)a4 originalImageData:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ARMLIntermediateDownScalingResultData;
  v10 = [(ARMLIntermediateDownScalingResultData *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_pixelBuffer = a3;
    CVPixelBufferRetain(a3);
    v11->_timestamp = a4;
    objc_storeStrong((id *)&v11->_originalImageData, a5);
  }

  return v11;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_pixelBuffer);
  v3.receiver = self;
  v3.super_class = (Class)ARMLIntermediateDownScalingResultData;
  [(ARMLIntermediateDownScalingResultData *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    if ((__CVBuffer *)[v5 pixelBuffer] == self->_pixelBuffer
      && ([v5 timestamp], v6 == self->_timestamp))
    {
      id v9 = [v5 originalImageData];
      char v7 = [v9 isEqual:self->_originalImageData];
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (__CVBuffer)pixelBuffer
{
  return self->_pixelBuffer;
}

- (ARImageData)originalImageData
{
  return self->_originalImageData;
}

- (void).cxx_destruct
{
}

@end