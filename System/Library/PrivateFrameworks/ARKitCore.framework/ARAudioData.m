@interface ARAudioData
- (ARAudioData)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (double)timestamp;
- (opaqueCMSampleBuffer)sampleBuffer;
- (void)dealloc;
- (void)setTimestamp:(double)a3;
@end

@implementation ARAudioData

- (ARAudioData)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ARAudioData;
  v4 = [(ARAudioData *)&v8 init];
  if (v4)
  {
    memset(&v7, 0, sizeof(v7));
    CMSampleBufferGetPresentationTimeStamp(&v7, a3);
    CMTime v6 = v7;
    v4->_timestamp = CMTimeGetSeconds(&v6);
    v4->_sampleBuffer = a3;
    CFRetain(a3);
  }
  return v4;
}

- (void)dealloc
{
  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer) {
    CFRelease(sampleBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)ARAudioData;
  [(ARAudioData *)&v4 dealloc];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

@end