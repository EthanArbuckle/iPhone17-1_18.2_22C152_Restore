@interface BWJasperColorStillsExecutorRequest
- (BWJasperColorStillsExecutorControllerDelegate)delegate;
- (BWJasperColorStillsExecutorInput)input;
- (id)description;
- (int)err;
- (void)dealloc;
- (void)initWithInput:(void *)a3 delegate:;
- (void)setErr:(int)a3;
@end

@implementation BWJasperColorStillsExecutorRequest

- (void)initWithInput:(void *)a3 delegate:
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)BWJasperColorStillsExecutorRequest;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[2] = a2;
    v5[3] = a3;
  }
  return v5;
}

- (void)dealloc
{
  [(BWJasperColorStillsExecutorInput *)self->_input setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)BWJasperColorStillsExecutorRequest;
  [(BWJasperColorStillsExecutorRequest *)&v3 dealloc];
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

- (BWJasperColorStillsExecutorInput)input
{
  return self->_input;
}

- (BWJasperColorStillsExecutorControllerDelegate)delegate
{
  return self->_delegate;
}

@end