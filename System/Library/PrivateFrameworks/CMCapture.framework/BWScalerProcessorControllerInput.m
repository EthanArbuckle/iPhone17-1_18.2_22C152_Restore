@interface BWScalerProcessorControllerInput
- (BOOL)applyZoom;
- (BWScalerProcessorControllerInput)initWithSettings:(id)a3 portType:(id)a4;
- (opaqueCMSampleBuffer)frame;
- (unint64_t)bufferType;
- (void)addFrame:(opaqueCMSampleBuffer *)a3 bufferType:(unint64_t)a4;
- (void)dealloc;
- (void)setApplyZoom:(BOOL)a3;
@end

@implementation BWScalerProcessorControllerInput

- (BWScalerProcessorControllerInput)initWithSettings:(id)a3 portType:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BWScalerProcessorControllerInput;
  result = [(BWStillImageProcessorControllerInput *)&v5 initWithSettings:a3 portType:a4];
  if (result) {
    result->_applyZoom = 1;
  }
  return result;
}

- (void)dealloc
{
  frame = self->_frame;
  if (frame) {
    CFRelease(frame);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWScalerProcessorControllerInput;
  [(BWStillImageProcessorControllerInput *)&v4 dealloc];
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3 bufferType:(unint64_t)a4
{
  frame = self->_frame;
  self->_frame = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (frame) {
    CFRelease(frame);
  }
  self->_bufferType = a4;
  v7 = [(BWStillImageProcessorControllerInput *)self delegate];
  [(BWStillImageProcessorControllerInputUpdatesDelegate *)v7 inputChanged:self];
}

- (opaqueCMSampleBuffer)frame
{
  return self->_frame;
}

- (unint64_t)bufferType
{
  return self->_bufferType;
}

- (BOOL)applyZoom
{
  return self->_applyZoom;
}

- (void)setApplyZoom:(BOOL)a3
{
  self->_applyZoom = a3;
}

@end