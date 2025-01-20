@interface BWInferenceEngineControllerInput
- (BOOL)expectsMoreData;
- (BOOL)smartCameraClassificationsEnabled;
- (BWInferenceEngineControllerInput)initWithSettings:(id)a3 portType:(id)a4;
- (BWInferenceEngineControllerInput)initWithSettings:(id)a3 portType:(id)a4 inferenceInputBufferType:(unint64_t)a5;
- (NSArray)enabledInferenceMasks;
- (id)description;
- (opaqueCMSampleBuffer)inferenceImage;
- (opaqueCMSampleBuffer)propagationImage;
- (unint64_t)enabledVisionInferences;
- (unint64_t)inferenceInputBufferType;
- (void)addInferenceImage:(opaqueCMSampleBuffer *)a3;
- (void)addInferenceImage:(opaqueCMSampleBuffer *)a3 propagationImage:(opaqueCMSampleBuffer *)a4;
- (void)dealloc;
- (void)setEnabledInferenceMasks:(id)a3;
- (void)setEnabledVisionInferences:(unint64_t)a3;
- (void)setSmartCameraClassificationsEnabled:(BOOL)a3;
@end

@implementation BWInferenceEngineControllerInput

- (BWInferenceEngineControllerInput)initWithSettings:(id)a3 portType:(id)a4 inferenceInputBufferType:(unint64_t)a5
{
  v7.receiver = self;
  v7.super_class = (Class)BWInferenceEngineControllerInput;
  result = [(BWStillImageProcessorControllerInput *)&v7 initWithSettings:a3 portType:a4];
  if (result)
  {
    result->_expectsMoreData = 1;
    result->_inferenceInputBufferType = a5;
  }
  return result;
}

- (BWInferenceEngineControllerInput)initWithSettings:(id)a3 portType:(id)a4
{
  return [(BWInferenceEngineControllerInput *)self initWithSettings:a3 portType:a4 inferenceInputBufferType:15];
}

- (void)dealloc
{
  inferenceImage = self->_inferenceImage;
  if (inferenceImage) {
    CFRelease(inferenceImage);
  }
  propagationImage = self->_propagationImage;
  if (propagationImage) {
    CFRelease(propagationImage);
  }

  v5.receiver = self;
  v5.super_class = (Class)BWInferenceEngineControllerInput;
  [(BWStillImageProcessorControllerInput *)&v5 dealloc];
}

- (void)addInferenceImage:(opaqueCMSampleBuffer *)a3
{
}

- (void)addInferenceImage:(opaqueCMSampleBuffer *)a3 propagationImage:(opaqueCMSampleBuffer *)a4
{
  if (a3 && a4)
  {
    inferenceImage = self->_inferenceImage;
    if (inferenceImage != a3)
    {
      self->_inferenceImage = a3;
      CFRetain(a3);
      if (inferenceImage) {
        CFRelease(inferenceImage);
      }
    }
    propagationImage = self->_propagationImage;
    if (propagationImage != a4)
    {
      self->_propagationImage = a4;
      CFRetain(a4);
      if (propagationImage) {
        CFRelease(propagationImage);
      }
    }
  }
  self->_expectsMoreData = 0;
  v8 = [(BWStillImageProcessorControllerInput *)self delegate];
  [(BWStillImageProcessorControllerInputUpdatesDelegate *)v8 inputReceivedNewData:self];
}

- (id)description
{
  v11 = NSString;
  uint64_t v3 = objc_opt_class();
  int64_t v4 = [(BWStillImageCaptureSettings *)[(BWStillImageProcessorControllerInput *)self captureSettings] settingsID];
  uint64_t v5 = BWPhotoEncoderStringFromEncodingScheme([(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] captureType]);
  v6 = [(BWStillImageCaptureStreamSettings *)[(BWStillImageProcessorControllerInput *)self captureStreamSettings] portType];
  inferenceImage = self->_inferenceImage;
  propagationImage = self->_propagationImage;
  v9 = [(NSArray *)self->_enabledInferenceMasks componentsJoinedByString:@", "];
  return (id)[v11 stringWithFormat:@"<%@ %p>: captureID:%lld, captureType=%@, %@ : infImg:%p propImg:%p masks:%@ smartCam:%d vision:%@ delegate:%p", v3, self, v4, v5, v6, inferenceImage, propagationImage, v9, self->_smartCameraClassificationsEnabled, objc_msgSend(NSString, "stringWithFormat:", @"%llu", self->_enabledVisionInferences), -[BWStillImageProcessorControllerInput delegate](self, "delegate")];
}

- (unint64_t)inferenceInputBufferType
{
  return self->_inferenceInputBufferType;
}

- (opaqueCMSampleBuffer)inferenceImage
{
  return self->_inferenceImage;
}

- (opaqueCMSampleBuffer)propagationImage
{
  return self->_propagationImage;
}

- (NSArray)enabledInferenceMasks
{
  return self->_enabledInferenceMasks;
}

- (void)setEnabledInferenceMasks:(id)a3
{
}

- (BOOL)smartCameraClassificationsEnabled
{
  return self->_smartCameraClassificationsEnabled;
}

- (void)setSmartCameraClassificationsEnabled:(BOOL)a3
{
  self->_smartCameraClassificationsEnabled = a3;
}

- (unint64_t)enabledVisionInferences
{
  return self->_enabledVisionInferences;
}

- (void)setEnabledVisionInferences:(unint64_t)a3
{
  self->_enabledVisionInferences = a3;
}

- (BOOL)expectsMoreData
{
  return self->_expectsMoreData;
}

@end