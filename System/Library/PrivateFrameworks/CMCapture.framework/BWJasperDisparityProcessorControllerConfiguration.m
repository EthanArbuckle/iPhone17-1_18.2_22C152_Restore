@interface BWJasperDisparityProcessorControllerConfiguration
- (BWVideoFormat)inputColorFormat;
- (BWVideoFormat)outputDepthFormat;
- (int)horizontalSensorBinningFactor;
- (int)pointCloudTimeMachineCapacity;
- (int)verticalSensorBinningFactor;
- (void)dealloc;
- (void)setHorizontalSensorBinningFactor:(int)a3;
- (void)setInputColorFormat:(id)a3;
- (void)setOutputDepthFormat:(id)a3;
- (void)setPointCloudTimeMachineCapacity:(int)a3;
- (void)setVerticalSensorBinningFactor:(int)a3;
@end

@implementation BWJasperDisparityProcessorControllerConfiguration

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWJasperDisparityProcessorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

- (BWVideoFormat)inputColorFormat
{
  return self->_inputColorFormat;
}

- (void)setInputColorFormat:(id)a3
{
}

- (BWVideoFormat)outputDepthFormat
{
  return self->_outputDepthFormat;
}

- (void)setOutputDepthFormat:(id)a3
{
}

- (int)horizontalSensorBinningFactor
{
  return self->_horizontalSensorBinningFactor;
}

- (void)setHorizontalSensorBinningFactor:(int)a3
{
  self->_horizontalSensorBinningFactor = a3;
}

- (int)verticalSensorBinningFactor
{
  return self->_verticalSensorBinningFactor;
}

- (void)setVerticalSensorBinningFactor:(int)a3
{
  self->_verticalSensorBinningFactor = a3;
}

- (int)pointCloudTimeMachineCapacity
{
  return self->_pointCloudTimeMachineCapacity;
}

- (void)setPointCloudTimeMachineCapacity:(int)a3
{
  self->_pointCloudTimeMachineCapacity = a3;
}

@end