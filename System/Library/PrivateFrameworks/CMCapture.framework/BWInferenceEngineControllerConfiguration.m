@interface BWInferenceEngineControllerConfiguration
- (BOOL)fastMattingEnabled;
- (BOOL)mattingOutputValidContentDetectionEnabled;
- (BOOL)producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom;
- (BOOL)smartCameraClassificationsEnabled;
- (BOOL)suppressVisionTimeOutFailure;
- (BWInferenceEngineControllerConfiguration)init;
- (BWVideoFormat)inputFormat;
- (NSArray)enabledInferenceMasks;
- (NSArray)swfrInferenceMasks;
- (int)personSemanticsVersion;
- (unint64_t)enabledVisionInferences;
- (void)dealloc;
- (void)setEnabledInferenceMasks:(id)a3;
- (void)setEnabledVisionInferences:(unint64_t)a3;
- (void)setFastMattingEnabled:(BOOL)a3;
- (void)setInputFormat:(id)a3;
- (void)setMattingOutputValidContentDetectionEnabled:(BOOL)a3;
- (void)setPersonSemanticsVersion:(int)a3;
- (void)setProducesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom:(BOOL)a3;
- (void)setSmartCameraClassificationsEnabled:(BOOL)a3;
- (void)setSuppressVisionTimeOutFailure:(BOOL)a3;
- (void)setSwfrInferenceMasks:(id)a3;
@end

@implementation BWInferenceEngineControllerConfiguration

- (void)setPersonSemanticsVersion:(int)a3
{
  self->_personSemanticsVersion = a3;
}

- (void)setEnabledVisionInferences:(unint64_t)a3
{
  self->_enabledVisionInferences = a3;
}

- (void)setEnabledInferenceMasks:(id)a3
{
}

- (BWInferenceEngineControllerConfiguration)init
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceEngineControllerConfiguration;
  result = [(BWInferenceEngineControllerConfiguration *)&v3 init];
  if (result) {
    result->_fastMattingEnabled = 1;
  }
  return result;
}

- (void)setSuppressVisionTimeOutFailure:(BOOL)a3
{
  self->_suppressVisionTimeOutFailure = a3;
}

- (void)setSmartCameraClassificationsEnabled:(BOOL)a3
{
  self->_smartCameraClassificationsEnabled = a3;
}

- (void)setProducesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom:(BOOL)a3
{
  self->_producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom = a3;
}

- (void)setMattingOutputValidContentDetectionEnabled:(BOOL)a3
{
  self->_mattingOutputValidContentDetectionEnabled = a3;
}

- (void)setFastMattingEnabled:(BOOL)a3
{
  self->_fastMattingEnabled = a3;
}

- (NSArray)swfrInferenceMasks
{
  return self->_swfrInferenceMasks;
}

- (void)setSwfrInferenceMasks:(id)a3
{
}

- (void)setInputFormat:(id)a3
{
}

- (unint64_t)enabledVisionInferences
{
  return self->_enabledVisionInferences;
}

- (NSArray)enabledInferenceMasks
{
  return self->_enabledInferenceMasks;
}

- (BWVideoFormat)inputFormat
{
  return self->_inputFormat;
}

- (BOOL)suppressVisionTimeOutFailure
{
  return self->_suppressVisionTimeOutFailure;
}

- (BOOL)smartCameraClassificationsEnabled
{
  return self->_smartCameraClassificationsEnabled;
}

- (BOOL)producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom
{
  return self->_producesHighQualityInferencesFromZoomRegionWithLargeDigitalZoom;
}

- (int)personSemanticsVersion
{
  return self->_personSemanticsVersion;
}

- (BOOL)mattingOutputValidContentDetectionEnabled
{
  return self->_mattingOutputValidContentDetectionEnabled;
}

- (BOOL)fastMattingEnabled
{
  return self->_fastMattingEnabled;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWInferenceEngineControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

@end