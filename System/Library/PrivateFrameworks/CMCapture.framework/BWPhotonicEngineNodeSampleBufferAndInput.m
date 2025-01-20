@interface BWPhotonicEngineNodeSampleBufferAndInput
- (BWNodeInput)nodeInput;
- (BWPhotonicEngineNodeSampleBufferAndInput)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 nodeInput:(id)a4;
- (opaqueCMSampleBuffer)sampleBuffer;
- (void)dealloc;
@end

@implementation BWPhotonicEngineNodeSampleBufferAndInput

- (BWPhotonicEngineNodeSampleBufferAndInput)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 nodeInput:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWPhotonicEngineNodeSampleBufferAndInput;
  v6 = [(BWPhotonicEngineNodeSampleBufferAndInput *)&v8 init];
  if (v6)
  {
    if (a3 && (v6->_sampleBuffer = (opaqueCMSampleBuffer *)CFRetain(a3), a4))
    {
      v6->_nodeInput = (BWNodeInput *)a4;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer) {
    CFRelease(sampleBuffer);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWPhotonicEngineNodeSampleBufferAndInput;
  [(BWPhotonicEngineNodeSampleBufferAndInput *)&v4 dealloc];
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (BWNodeInput)nodeInput
{
  return self->_nodeInput;
}

@end