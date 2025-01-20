@interface BWJasperDisparityProcessorRequest
- (BWJasperDisparityProcessorControllerDelegate)delegate;
- (BWJasperDisparityProcessorInput)input;
- (BWJasperDisparityProcessorRequest)initWithInput:(id)a3 delegate:(id)a4;
- (id)description;
- (int)err;
- (void)dealloc;
- (void)setErr:(int)a3;
@end

@implementation BWJasperDisparityProcessorRequest

- (BWJasperDisparityProcessorRequest)initWithInput:(id)a3 delegate:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BWJasperDisparityProcessorRequest;
  v6 = [(BWJasperDisparityProcessorRequest *)&v8 init];
  if (v6)
  {
    v6->_input = (BWJasperDisparityProcessorInput *)a3;
    v6->_delegate = (BWJasperDisparityProcessorControllerDelegate *)a4;
  }
  return v6;
}

- (void)dealloc
{
  [(BWJasperDisparityProcessorInput *)self->_input setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)BWJasperDisparityProcessorRequest;
  [(BWJasperDisparityProcessorRequest *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@, %@", v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self->_input, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "portType")];
}

- (int)err
{
  return self->_err;
}

- (void)setErr:(int)a3
{
  self->_err = a3;
}

- (BWJasperDisparityProcessorInput)input
{
  return self->_input;
}

- (BWJasperDisparityProcessorControllerDelegate)delegate
{
  return self->_delegate;
}

@end