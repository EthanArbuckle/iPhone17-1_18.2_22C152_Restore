@interface BWSmartStyleRenderingProcessorInput
- (BOOL)_isApplyOnly:(BOOL)result;
- (BOOL)addFrameFailed;
- (BOOL)applyOnly;
- (BOOL)isEnqueued;
- (BWSmartStyleRenderingProcessorInput)initWithSettings:(id)a3 portType:(id)a4;
- (opaqueCMSampleBuffer)inputFrame;
- (opaqueCMSampleBuffer)sampleBuffer;
- (unint64_t)bufferType;
- (unint64_t)inputBufferType;
- (void)addSampleBuffer:(opaqueCMSampleBuffer *)a3 bufferType:(unint64_t)a4;
- (void)dealloc;
- (void)setEnqueued:(BOOL)a3;
@end

@implementation BWSmartStyleRenderingProcessorInput

- (void)dealloc
{
  inputFrame = self->_inputFrame;
  if (inputFrame) {
    CFRelease(inputFrame);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWSmartStyleRenderingProcessorInput;
  [(BWStillImageProcessorControllerInput *)&v4 dealloc];
}

- (void)addSampleBuffer:(opaqueCMSampleBuffer *)a3 bufferType:(unint64_t)a4
{
  v7 = [(BWStillImageProcessorControllerInput *)self delegate];
  self->_inputBufferType = a4;
  if (self->_addFrameFailed)
  {
LABEL_7:
    [(BWStillImageProcessorControllerInputUpdatesDelegate *)v7 inputAddFrameFailed:self];
    return;
  }
  if (!a3 || !CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0))
  {
    self->_addFrameFailed = 1;
    goto LABEL_7;
  }
  inputFrame = self->_inputFrame;
  self->_inputFrame = a3;
  CFRetain(a3);
  if (inputFrame) {
    CFRelease(inputFrame);
  }
  [(BWStillImageProcessorControllerInputUpdatesDelegate *)v7 input:self addFrame:self->_inputFrame];
  if (self->_addFrameFailed) {
    goto LABEL_7;
  }
}

- (BWSmartStyleRenderingProcessorInput)initWithSettings:(id)a3 portType:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWSmartStyleRenderingProcessorInput;
  v5 = [(BWStillImageProcessorControllerInput *)&v8 initWithSettings:a3 portType:a4];
  v6 = v5;
  if (v5) {
    v5->_applyOnly = -[BWSmartStyleRenderingProcessorInput _isApplyOnly:]((BOOL)v5, a3);
  }
  return v6;
}

- (BOOL)_isApplyOnly:(BOOL)result
{
  if (result)
  {
    int v3 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
    BOOL v6 = (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x80) == 0 && v3 != 2 && v3 != 11;
    if (v3 == 12) {
      BOOL v6 = 0;
    }
    return v3 != 10 && v6;
  }
  return result;
}

- (opaqueCMSampleBuffer)inputFrame
{
  return self->_inputFrame;
}

- (BOOL)addFrameFailed
{
  return self->_addFrameFailed;
}

- (BOOL)applyOnly
{
  return self->_applyOnly;
}

- (BOOL)isEnqueued
{
  return self->_enqueued;
}

- (void)setEnqueued:(BOOL)a3
{
  self->_enqueued = a3;
}

- (opaqueCMSampleBuffer)sampleBuffer
{
  return self->_sampleBuffer;
}

- (unint64_t)bufferType
{
  return self->_bufferType;
}

- (unint64_t)inputBufferType
{
  return self->_inputBufferType;
}

@end