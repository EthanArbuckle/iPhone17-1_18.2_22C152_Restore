@interface BWDeepZoomProcessorInput
- (BOOL)isEnqueued;
- (BOOL)sampleBufferSet;
- (BWDeepZoomProcessorInputDelegate)delegate;
- (id)description;
- (opaqueCMSampleBuffer)sampleBuffer;
- (unint64_t)bufferType;
- (void)addSampleBuffer:(opaqueCMSampleBuffer *)a3 bufferType:(unint64_t)a4;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setEnqueued:(BOOL)a3;
- (void)setSampleBufferSet:(BOOL)a3;
@end

@implementation BWDeepZoomProcessorInput

- (void)dealloc
{
  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer) {
    CFRelease(sampleBuffer);
  }

  v4.receiver = self;
  v4.super_class = (Class)BWDeepZoomProcessorInput;
  [(BWStillImageProcessorControllerInput *)&v4 dealloc];
}

- (void)addSampleBuffer:(opaqueCMSampleBuffer *)a3 bufferType:(unint64_t)a4
{
  sampleBuffer = self->_sampleBuffer;
  if (sampleBuffer)
  {
    CFRelease(sampleBuffer);
    self->_sampleBuffer = 0;
  }
  self->_sampleBufferSet = 1;
  self->_bufferType = a4;
  if (a3) {
    self->_sampleBuffer = (opaqueCMSampleBuffer *)CFRetain(a3);
  }
  delegate = self->_delegate;
  [(BWDeepZoomProcessorInputDelegate *)delegate inputSampleBufferReceived:self];
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (unint64_t)bufferType
{
  return self->_bufferType;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@, %@ : sbuf:%p", v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType"), self->_sampleBuffer];
}

- (BOOL)sampleBufferSet
{
  return self->_sampleBufferSet;
}

- (void)setSampleBufferSet:(BOOL)a3
{
  self->_sampleBufferSet = a3;
}

- (BWDeepZoomProcessorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEnqueued
{
  return self->_enqueued;
}

- (void)setEnqueued:(BOOL)a3
{
  self->_enqueued = a3;
}

@end