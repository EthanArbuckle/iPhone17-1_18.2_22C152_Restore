@interface MIOFifoBufferItem
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)taggedBufferPts;
- (AVTimedMetadataGroup)metadata;
- (OpaqueCMTaggedBufferGroup)taggedBufferGroup;
- (opaqueCMSampleBuffer)sampleBuffer;
- (void)dealloc;
- (void)setMetadata:(id)a3;
- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)setTaggedBufferGroup:(OpaqueCMTaggedBufferGroup *)a3;
- (void)setTaggedBufferPts:(id *)a3;
@end

@implementation MIOFifoBufferItem

- (void)dealloc
{
  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer)
  {
    CFRelease(sampleBuffer);
    self->_sampleBuffer = 0;
  }
  if (self->_taggedBufferGroup)
  {
    CVPixelBufferAtIndex = (__CVBuffer *)FigTaggedBufferGroupGetCVPixelBufferAtIndex();
    CVPixelBufferRelease(CVPixelBufferAtIndex);
    v5 = (__CVBuffer *)FigTaggedBufferGroupGetCVPixelBufferAtIndex();
    CVPixelBufferRelease(v5);
    CFRelease(self->_taggedBufferGroup);
    self->_taggedBufferGroup = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MIOFifoBufferItem;
  [(MIOFifoBufferItem *)&v6 dealloc];
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (void)setSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  self->_sampleBuffer = a3;
}

- (OpaqueCMTaggedBufferGroup)taggedBufferGroup
{
  return self->_taggedBufferGroup;
}

- (void)setTaggedBufferGroup:(OpaqueCMTaggedBufferGroup *)a3
{
  self->_taggedBufferGroup = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)taggedBufferPts
{
  objc_copyStruct(retstr, &self->_taggedBufferPts, 24, 1, 0);
  return result;
}

- (void)setTaggedBufferPts:(id *)a3
{
}

- (AVTimedMetadataGroup)metadata
{
  return (AVTimedMetadataGroup *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
}

@end