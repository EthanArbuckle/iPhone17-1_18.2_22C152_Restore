@interface BWLearnedNRProcessorControllerConfiguration
- (BWVideoFormat)outputFormat;
- (BWVideoFormat)ultraHighResolutionOutputFormat;
- (BWVideoFormat)zoomBasedOutputFormat;
- (NSDictionary)finalCropRectOverscanMultiplierByPortType;
- (NSDictionary)inputFormatsByQSubResolutionFlavor;
- (void)dealloc;
- (void)setFinalCropRectOverscanMultiplierByPortType:(id)a3;
- (void)setInputFormatsByQSubResolutionFlavor:(id)a3;
- (void)setOutputFormat:(id)a3;
- (void)setUltraHighResolutionOutputFormat:(id)a3;
- (void)setZoomBasedOutputFormat:(id)a3;
@end

@implementation BWLearnedNRProcessorControllerConfiguration

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWLearnedNRProcessorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

- (NSDictionary)inputFormatsByQSubResolutionFlavor
{
  return self->_inputFormatsByQSubResolutionFlavor;
}

- (void)setInputFormatsByQSubResolutionFlavor:(id)a3
{
}

- (BWVideoFormat)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(id)a3
{
}

- (BWVideoFormat)zoomBasedOutputFormat
{
  return self->_zoomBasedOutputFormat;
}

- (void)setZoomBasedOutputFormat:(id)a3
{
}

- (BWVideoFormat)ultraHighResolutionOutputFormat
{
  return self->_ultraHighResolutionOutputFormat;
}

- (void)setUltraHighResolutionOutputFormat:(id)a3
{
}

- (NSDictionary)finalCropRectOverscanMultiplierByPortType
{
  return self->_finalCropRectOverscanMultiplierByPortType;
}

- (void)setFinalCropRectOverscanMultiplierByPortType:(id)a3
{
}

@end