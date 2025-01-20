@interface BWJasperColorStillsExecutorControllerConfiguration
- ($2825F4736939C4A6D3AD43837233062D)standardFormatDimensions;
- (BOOL)postponedProcessorSetupSupported;
- (BWVideoFormat)inputColorFormat;
- (BWVideoFormat)outputDepthFormat;
- (id)description;
- (int)horizontalSensorBinningFactor;
- (int)verticalSensorBinningFactor;
- (void)dealloc;
- (void)setHorizontalSensorBinningFactor:(int)a3;
- (void)setInputColorFormat:(id)a3;
- (void)setOutputDepthFormat:(id)a3;
- (void)setStandardFormatDimensions:(id)a3;
- (void)setVerticalSensorBinningFactor:(int)a3;
@end

@implementation BWJasperColorStillsExecutorControllerConfiguration

- (void)setVerticalSensorBinningFactor:(int)a3
{
  self->_verticalSensorBinningFactor = a3;
}

- (void)setStandardFormatDimensions:(id)a3
{
  self->_standardFormatDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setHorizontalSensorBinningFactor:(int)a3
{
  self->_horizontalSensorBinningFactor = a3;
}

- (BOOL)postponedProcessorSetupSupported
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWJasperColorStillsExecutorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p>: inputColorFormat:%@, _outputDepthFormat:%@, standardFormatDimensions:%dx%d, horizontalSensorBinningFactor:%d, verticalSensorBinningFactor:%d", objc_opt_class(), self, self->_inputColorFormat, self->_outputDepthFormat, self->_standardFormatDimensions.width, self->_standardFormatDimensions.height, self->_horizontalSensorBinningFactor, self->_verticalSensorBinningFactor];
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

- ($2825F4736939C4A6D3AD43837233062D)standardFormatDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_standardFormatDimensions;
}

- (int)horizontalSensorBinningFactor
{
  return self->_horizontalSensorBinningFactor;
}

- (int)verticalSensorBinningFactor
{
  return self->_verticalSensorBinningFactor;
}

@end