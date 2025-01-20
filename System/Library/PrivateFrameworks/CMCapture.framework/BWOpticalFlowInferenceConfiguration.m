@interface BWOpticalFlowInferenceConfiguration
- ($2825F4736939C4A6D3AD43837233062D)forceIntermediateDimensions;
- ($2825F4736939C4A6D3AD43837233062D)inputDimensions;
- ($2825F4736939C4A6D3AD43837233062D)outputDimensions;
- (BOOL)cropColorInputToPrimaryCaptureRect;
- (NSString)attachedMediaKeyForPropagatedColorInput;
- (NSString)portType;
- (unint64_t)concurrencyWidth;
- (unsigned)inputRotationAngle;
- (void)setAttachedMediaKeyForPropagatedColorInput:(id)a3;
- (void)setConcurrencyWidth:(unint64_t)a3;
- (void)setCropColorInputToPrimaryCaptureRect:(BOOL)a3;
- (void)setForceIntermediateDimensions:(id)a3;
- (void)setInputDimensions:(id)a3;
- (void)setInputRotationAngle:(unsigned int)a3;
- (void)setOutputDimensions:(id)a3;
- (void)setPortType:(id)a3;
@end

@implementation BWOpticalFlowInferenceConfiguration

- (void)setOutputDimensions:(id)a3
{
  self->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setInputDimensions:(id)a3
{
  self->_inputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setConcurrencyWidth:(unint64_t)a3
{
  self->_concurrencyWidth = a3;
}

- (void)setAttachedMediaKeyForPropagatedColorInput:(id)a3
{
  self->_attachedMediaKeyForPropagatedColorInput = (NSString *)a3;
}

- (void)setInputRotationAngle:(unsigned int)a3
{
  self->_inputRotationAngle = a3;
}

- (void)setCropColorInputToPrimaryCaptureRect:(BOOL)a3
{
  self->_cropColorInputToPrimaryCaptureRect = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)inputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_inputDimensions;
}

- (NSString)attachedMediaKeyForPropagatedColorInput
{
  return self->_attachedMediaKeyForPropagatedColorInput;
}

- (NSString)portType
{
  return self->_portType;
}

- (unsigned)inputRotationAngle
{
  return self->_inputRotationAngle;
}

- ($2825F4736939C4A6D3AD43837233062D)forceIntermediateDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_forceIntermediateDimensions;
}

- (BOOL)cropColorInputToPrimaryCaptureRect
{
  return self->_cropColorInputToPrimaryCaptureRect;
}

- (unint64_t)concurrencyWidth
{
  return self->_concurrencyWidth;
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (void)setForceIntermediateDimensions:(id)a3
{
  self->_forceIntermediateDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setPortType:(id)a3
{
  self->_portType = (NSString *)a3;
}

@end