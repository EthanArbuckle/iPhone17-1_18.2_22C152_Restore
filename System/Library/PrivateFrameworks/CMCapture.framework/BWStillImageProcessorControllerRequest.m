@interface BWStillImageProcessorControllerRequest
- (BOOL)readyForProcessing;
- (BWStillImageProcessorControllerDelegate)delegate;
- (BWStillImageProcessorControllerInput)input;
- (BWStillImageProcessorControllerRequest)initWithInput:(id)a3 delegate:(id)a4;
- (id)description;
- (int)err;
- (opaqueCMSampleBuffer)outputFrame;
- (unint64_t)outputType;
- (void)dealloc;
- (void)setErr:(int)a3;
@end

@implementation BWStillImageProcessorControllerRequest

- (BWStillImageProcessorControllerRequest)initWithInput:(id)a3 delegate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWStillImageProcessorControllerRequest;
  v6 = [(BWStillImageProcessorControllerRequest *)&v8 init];
  if (v6)
  {
    v6->_input = (BWStillImageProcessorControllerInput *)a3;
    v6->_delegate = (BWStillImageProcessorControllerDelegate *)a4;
  }
  return v6;
}

- (void)dealloc
{
  [(BWStillImageProcessorControllerInput *)self->_input setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessorControllerRequest;
  [(BWStillImageProcessorControllerRequest *)&v3 dealloc];
}

- (BOOL)readyForProcessing
{
}

- (unint64_t)outputType
{
  return 0;
}

- (opaqueCMSampleBuffer)outputFrame
{
  return 0;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@, %@ captureRequestIdentifier:%@", v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self->_input, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "captureType")), -[BWStillImageProcessorControllerInput portType](self->_input, "portType"), -[FigCaptureStillImageSettings captureRequestIdentifier](-[BWStillImageProcessorControllerInput settings](self->_input, "settings"), "captureRequestIdentifier")];
}

- (int)err
{
  return self->_err;
}

- (void)setErr:(int)a3
{
  self->_err = a3;
}

- (BWStillImageProcessorControllerInput)input
{
  return self->_input;
}

- (BWStillImageProcessorControllerDelegate)delegate
{
  return self->_delegate;
}

@end