@interface BWRedEyeReductionControllerInput
+ (BOOL)requiresInferencesFromFrame:(opaqueCMSampleBuffer *)a3;
- (BOOL)requiresSensorInterfaceRawPropagation;
- (BWRedEyeReductionControllerInputDelegate)inputDelegate;
- (BWStillImageProcessorControllerDelegate)processorControllerDelegate;
- (NSArray)faceObservations;
- (opaqueCMSampleBuffer)auxImage;
- (opaqueCMSampleBuffer)primaryImage;
- (void)addFrame:(opaqueCMSampleBuffer *)a3 faceObservations:(id)a4;
- (void)dealloc;
- (void)setInputDelegate:(id)a3;
- (void)setProcessorControllerDelegate:(id)a3;
- (void)setRequiresSensorInterfaceRawPropagation:(BOOL)a3;
@end

@implementation BWRedEyeReductionControllerInput

- (void)dealloc
{
  primaryImage = self->_primaryImage;
  if (primaryImage) {
    CFRelease(primaryImage);
  }
  auxImage = self->_auxImage;
  if (auxImage) {
    CFRelease(auxImage);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWRedEyeReductionControllerInput;
  [(BWStillImageProcessorControllerInput *)&v5 dealloc];
}

- (void)addFrame:(opaqueCMSampleBuffer *)a3 faceObservations:(id)a4
{
  if (!a3) {
    goto LABEL_10;
  }
  uint64_t v7 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54188]), "BOOLValue")? 64: 56;
  if (*(Class *)((char *)&self->super.super.isa + v7)) {
    goto LABEL_10;
  }
  *(Class *)((char *)&self->super.super.isa + v7) = (Class)CFRetain(a3);
  if (a4)
  {

    self->_faceObservations = (NSArray *)a4;
  }
  [(BWRedEyeReductionControllerInputDelegate *)self->_inputDelegate didReceiveFrameForInput:self];
  if (self->_primaryImage)
  {
    if (self->_auxImage)
    {
LABEL_10:
      inputDelegate = self->_inputDelegate;
      -[BWRedEyeReductionControllerInputDelegate didReceiveAllFramesForInput:](inputDelegate, "didReceiveAllFramesForInput:", self, a4);
    }
  }
}

- (BOOL)requiresSensorInterfaceRawPropagation
{
  __int16 v3 = [(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] captureFlags];
  NSUInteger v4 = [(NSArray *)[(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] captureStreamSettings] count];
  __int16 v5 = [(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] captureFlags];
  BOOL v6 = (v5 & 0x200 | [(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] captureFlags] & 4) == 0;
  if (v4 != 1) {
    BOOL v6 = 0;
  }
  return (v3 & 0x800) != 0 && v6;
}

+ (BOOL)requiresInferencesFromFrame:(opaqueCMSampleBuffer *)a3
{
  return objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54188]), "BOOLValue") ^ 1;
}

- (opaqueCMSampleBuffer)primaryImage
{
  return self->_primaryImage;
}

- (opaqueCMSampleBuffer)auxImage
{
  return self->_auxImage;
}

- (NSArray)faceObservations
{
  return self->_faceObservations;
}

- (BWRedEyeReductionControllerInputDelegate)inputDelegate
{
  return self->_inputDelegate;
}

- (void)setInputDelegate:(id)a3
{
}

- (BWStillImageProcessorControllerDelegate)processorControllerDelegate
{
  return self->_processorControllerDelegate;
}

- (void)setProcessorControllerDelegate:(id)a3
{
}

- (void)setRequiresSensorInterfaceRawPropagation:(BOOL)a3
{
  self->_requiresSensorInterfaceRawPropagation = a3;
}

@end