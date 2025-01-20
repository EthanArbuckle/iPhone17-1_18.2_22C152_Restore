@interface MOVStreamSampleBufferAndMetadata
- (AVTimedMetadataGroup)metadata;
- (opaqueCMSampleBuffer)sampleBuffer;
- (void)setMetadata:(id)a3;
- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3;
@end

@implementation MOVStreamSampleBufferAndMetadata

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_sampleBuffer = a3;
}

- (AVTimedMetadataGroup)metadata
{
  return (AVTimedMetadataGroup *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end