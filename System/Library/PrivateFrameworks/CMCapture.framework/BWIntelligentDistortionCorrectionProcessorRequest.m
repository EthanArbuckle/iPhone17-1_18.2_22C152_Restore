@interface BWIntelligentDistortionCorrectionProcessorRequest
- (BWIntelligentDistortionCorrectionProcessorInput)input;
- (BWStillImageProcessorControllerDelegate)delegate;
- (id)description;
- (int)err;
- (void)dealloc;
- (void)initWithInput:(void *)a3 delegate:;
- (void)setErr:(int)a3;
@end

@implementation BWIntelligentDistortionCorrectionProcessorRequest

- (void)initWithInput:(void *)a3 delegate:
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)BWIntelligentDistortionCorrectionProcessorRequest;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  if (v5)
  {
    v5[1] = a2;
    v5[2] = a3;
  }
  return v5;
}

- (void)dealloc
{
  [(BWIntelligentDistortionCorrectionProcessorInput *)self->_input setDelegate:0];

  v3.receiver = self;
  v3.super_class = (Class)BWIntelligentDistortionCorrectionProcessorRequest;
  [(BWIntelligentDistortionCorrectionProcessorRequest *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t v5 = [(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self->_input captureSettings] settingsID];
  uint64_t v6 = BWPhotoEncoderStringFromEncodingScheme([(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self->_input captureStreamSettings] captureType]);
  return (id)[v3 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@, %@ input:<%@ %p>", v4, self, v5, v6, -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self->_input, "captureStreamSettings"), "portType"), objc_opt_class(), self->_input];
}

- (BWStillImageProcessorControllerDelegate)delegate
{
  return self->_delegate;
}

- (int)err
{
  return self->_err;
}

- (void)setErr:(int)a3
{
  self->_err = a3;
}

- (BWIntelligentDistortionCorrectionProcessorInput)input
{
  return self->_input;
}

@end