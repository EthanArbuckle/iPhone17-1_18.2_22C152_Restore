@interface BWStereoDisparityProcessorControllerConfiguration
- ($2825F4736939C4A6D3AD43837233062D)disparityOutputDimensions;
- ($2825F4736939C4A6D3AD43837233062D)inputDimensions;
- (BOOL)shouldComputeDisparityWhenCalibrationFails;
- (BOOL)zoomingDisparityAllowed;
- (NSArray)portTypesWithDepthSegmentationPortraitParameters;
- (id)description;
- (int)stillImageDepthDataType;
- (void)dealloc;
- (void)setDisparityOutputDimensions:(id)a3;
- (void)setInputDimensions:(id)a3;
- (void)setPortTypesWithDepthSegmentationPortraitParameters:(id)a3;
- (void)setShouldComputeDisparityWhenCalibrationFails:(BOOL)a3;
- (void)setStillImageDepthDataType:(int)a3;
- (void)setZoomingDisparityAllowed:(BOOL)a3;
@end

@implementation BWStereoDisparityProcessorControllerConfiguration

- (void)setZoomingDisparityAllowed:(BOOL)a3
{
  self->_zoomingDisparityAllowed = a3;
}

- (void)setStillImageDepthDataType:(int)a3
{
  self->_stillImageDepthDataType = a3;
}

- (void)setShouldComputeDisparityWhenCalibrationFails:(BOOL)a3
{
  self->_shouldComputeDisparityWhenCalibrationFails = a3;
}

- (void)setPortTypesWithDepthSegmentationPortraitParameters:(id)a3
{
}

- (void)setDisparityOutputDimensions:(id)a3
{
  self->_disparityOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWStereoDisparityProcessorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p>: PortTypes:%@, Input:%dx%d, Disparity:%dx%d ZoomingDisparityAllowed:%d ComputeDisparityWhenCalibrationFails:%d Type:%@", v4, self, -[NSArray componentsJoinedByString:](self->_portTypesWithDepthSegmentationPortraitParameters, "componentsJoinedByString:", @",", self->_inputDimensions.width, self->_inputDimensions.height, self->_disparityOutputDimensions.width, self->_disparityOutputDimensions.height, self->_zoomingDisparityAllowed, self->_shouldComputeDisparityWhenCalibrationFails, BWPhotoEncoderStringFromEncodingScheme(self->_stillImageDepthDataType)];
}

- (NSArray)portTypesWithDepthSegmentationPortraitParameters
{
  return self->_portTypesWithDepthSegmentationPortraitParameters;
}

- ($2825F4736939C4A6D3AD43837233062D)inputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_inputDimensions;
}

- (void)setInputDimensions:(id)a3
{
  self->_inputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)disparityOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_disparityOutputDimensions;
}

- (BOOL)zoomingDisparityAllowed
{
  return self->_zoomingDisparityAllowed;
}

- (BOOL)shouldComputeDisparityWhenCalibrationFails
{
  return self->_shouldComputeDisparityWhenCalibrationFails;
}

- (int)stillImageDepthDataType
{
  return self->_stillImageDepthDataType;
}

@end