@interface ARMattingImageMetaData
- (ARMattingImageMetaData)initWithTimestamp:(double)a3 downSampledImageBuffer:(__CVBuffer *)a4 mattingScaleImageBuffer:(__CVBuffer *)a5;
- (NSString)description;
- (__CVBuffer)downSampledImageBuffer;
- (__CVBuffer)mattingScaleImageBuffer;
- (double)timestamp;
- (void)dealloc;
@end

@implementation ARMattingImageMetaData

- (ARMattingImageMetaData)initWithTimestamp:(double)a3 downSampledImageBuffer:(__CVBuffer *)a4 mattingScaleImageBuffer:(__CVBuffer *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)ARMattingImageMetaData;
  v8 = [(ARMattingImageMetaData *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_timestamp = a3;
    v8->_downSampledImageBuffer = CVPixelBufferRetain(a4);
    v9->_mattingScaleImageBuffer = CVPixelBufferRetain(a5);
  }
  return v9;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->_downSampledImageBuffer);
  CVPixelBufferRelease(self->_mattingScaleImageBuffer);
  v3.receiver = self;
  v3.super_class = (Class)ARMattingImageMetaData;
  [(ARMattingImageMetaData *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(ARMattingImageMetaData *)self timestamp];
  v7 = [v3 stringWithFormat:@"<%@: %p timestamp=%f>", v5, self, v6];

  return (NSString *)v7;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (__CVBuffer)downSampledImageBuffer
{
  return self->_downSampledImageBuffer;
}

- (__CVBuffer)mattingScaleImageBuffer
{
  return self->_mattingScaleImageBuffer;
}

@end