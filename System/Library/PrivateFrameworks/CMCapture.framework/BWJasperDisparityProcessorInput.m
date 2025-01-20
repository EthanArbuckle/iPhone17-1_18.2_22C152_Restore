@interface BWJasperDisparityProcessorInput
- (BOOL)isReadyToExecute;
- (BOOL)skipProcessing;
- (BWJasperDisparityProcessorInput)initWithSettings:(id)a3 portType:(id)a4;
- (BWJasperDisparityProcessorInputDelegate)delegate;
- (id)description;
- (opaqueCMSampleBuffer)colorBuffer;
- (unint64_t)colorBufferType;
- (void)dealloc;
- (void)executeNow;
- (void)setColorBuffer:(opaqueCMSampleBuffer *)a3 type:(unint64_t)a4;
- (void)setColorBufferPTS:(id *)a3 exposureTime:(double)a4;
- (void)setDelegate:(id)a3;
- (void)setSkipProcessing:(BOOL)a3;
@end

@implementation BWJasperDisparityProcessorInput

- (BWJasperDisparityProcessorInput)initWithSettings:(id)a3 portType:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)BWJasperDisparityProcessorInput;
  return [(BWStillImageProcessorControllerInput *)&v5 initWithSettings:a3 portType:a4];
}

- (void)dealloc
{
  colorBuffer = self->_colorBuffer;
  if (colorBuffer) {
    CFRelease(colorBuffer);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWJasperDisparityProcessorInput;
  [(BWStillImageProcessorControllerInput *)&v4 dealloc];
}

- (void)setColorBufferPTS:(id *)a3 exposureTime:(double)a4
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_colorBufferPTS.value = *(_OWORD *)&a3->var0;
  self->_colorBufferPTS.epoch = var3;
  self->_colorBufferExposureTime = a4;
}

- (void)setColorBuffer:(opaqueCMSampleBuffer *)a3 type:(unint64_t)a4
{
  colorBuffer = self->_colorBuffer;
  if (colorBuffer) {
    CFRelease(colorBuffer);
  }
  if (a3) {
    v8 = (opaqueCMSampleBuffer *)CFRetain(a3);
  }
  else {
    v8 = 0;
  }
  self->_colorBuffer = v8;
  self->_colorBufferType = a4;
  if ([(BWJasperDisparityProcessorInput *)self isReadyToExecute])
  {
    delegate = self->_delegate;
    [(BWJasperDisparityProcessorInputDelegate *)delegate inputReadyToExecute:self];
  }
}

- (BOOL)isReadyToExecute
{
  return self->_colorBuffer || self->_skipProcessing;
}

- (void)executeNow
{
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@, %@, colorBuf:%p skip:%d", v4, self, -[BWStillImageCaptureSettings settingsID](-[BWStillImageProcessorControllerInput captureSettings](self, "captureSettings"), "settingsID"), BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "captureType")), -[BWStillImageCaptureStreamSettings portType](-[BWStillImageProcessorControllerInput captureStreamSettings](self, "captureStreamSettings"), "portType"), self->_colorBuffer, self->_skipProcessing];
}

- (BWJasperDisparityProcessorInputDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)colorBufferType
{
  return self->_colorBufferType;
}

- (opaqueCMSampleBuffer)colorBuffer
{
  return self->_colorBuffer;
}

- (BOOL)skipProcessing
{
  return self->_skipProcessing;
}

- (void)setSkipProcessing:(BOOL)a3
{
  self->_skipProcessing = a3;
}

@end