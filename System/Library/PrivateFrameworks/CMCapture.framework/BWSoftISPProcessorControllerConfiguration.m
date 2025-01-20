@interface BWSoftISPProcessorControllerConfiguration
- ($2825F4736939C4A6D3AD43837233062D)inputDimensions;
- ($2825F4736939C4A6D3AD43837233062D)outputDimensions;
- (BOOL)auxiliaryTypesForFocusPixelDisparityEnabled;
- (BOOL)cmiResourceEnabled;
- (BOOL)deepFusionEnabled;
- (BOOL)documentScanningEnabled;
- (BOOL)gdcEnabled;
- (BOOL)learnedNREnabled;
- (BOOL)linearRGBForDisparityEnabled;
- (BOOL)lowlightSFHRSupportEnabled;
- (BOOL)ltmHDRCurvesEnabled;
- (BOOL)quadraProcessingEnabled;
- (BOOL)rawNightModeEnabled;
- (BOOL)sfhrSupportEnabled;
- (BOOL)standardYUVProcessingEnabled;
- (CGPoint)sensorCenterOffset;
- (NSDictionary)inputDimensionsByQSubResolutionFlavorByPortType;
- (NSDictionary)outputDimensionsByQSubResolutionFlavor;
- (int)lossyCompressionLevel;
- (int)qBinProcessingMode;
- (unsigned)sensorRawPixelFormat;
- (void)dealloc;
- (void)setAuxiliaryTypesForFocusPixelDisparityEnabled:(BOOL)a3;
- (void)setCmiResourceEnabled:(BOOL)a3;
- (void)setDeepFusionEnabled:(BOOL)a3;
- (void)setDocumentScanningEnabled:(BOOL)a3;
- (void)setGdcEnabled:(BOOL)a3;
- (void)setInputDimensions:(id)a3;
- (void)setInputDimensionsByQSubResolutionFlavorByPortType:(id)a3;
- (void)setLearnedNREnabled:(BOOL)a3;
- (void)setLinearRGBForDisparityEnabled:(BOOL)a3;
- (void)setLossyCompressionLevel:(int)a3;
- (void)setLowlightSFHRSupportEnabled:(BOOL)a3;
- (void)setLtmHDRCurvesEnabled:(BOOL)a3;
- (void)setOutputDimensions:(id)a3;
- (void)setOutputDimensionsByQSubResolutionFlavor:(id)a3;
- (void)setQBinProcessingMode:(int)a3;
- (void)setQuadraProcessingEnabled:(BOOL)a3;
- (void)setRawNightModeEnabled:(BOOL)a3;
- (void)setSensorCenterOffset:(CGPoint)a3;
- (void)setSensorRawPixelFormat:(unsigned int)a3;
- (void)setSfhrSupportEnabled:(BOOL)a3;
- (void)setStandardYUVProcessingEnabled:(BOOL)a3;
@end

@implementation BWSoftISPProcessorControllerConfiguration

- (unsigned)sensorRawPixelFormat
{
  return self->_sensorRawPixelFormat;
}

- (NSDictionary)inputDimensionsByQSubResolutionFlavorByPortType
{
  return self->_inputDimensionsByQSubResolutionFlavorByPortType;
}

- (BOOL)standardYUVProcessingEnabled
{
  return self->_standardYUVProcessingEnabled;
}

- (BOOL)rawNightModeEnabled
{
  return self->_rawNightModeEnabled;
}

- (BOOL)quadraProcessingEnabled
{
  return self->_quadraProcessingEnabled;
}

- (int)qBinProcessingMode
{
  return self->_qBinProcessingMode;
}

- (NSDictionary)outputDimensionsByQSubResolutionFlavor
{
  return self->_outputDimensionsByQSubResolutionFlavor;
}

- (BOOL)linearRGBForDisparityEnabled
{
  return self->_linearRGBForDisparityEnabled;
}

- (BOOL)deepFusionEnabled
{
  return self->_deepFusionEnabled;
}

- (void)setStandardYUVProcessingEnabled:(BOOL)a3
{
  self->_standardYUVProcessingEnabled = a3;
}

- (void)setSfhrSupportEnabled:(BOOL)a3
{
  self->_sfhrSupportEnabled = a3;
}

- (void)setSensorRawPixelFormat:(unsigned int)a3
{
  self->_sensorRawPixelFormat = a3;
}

- (void)setSensorCenterOffset:(CGPoint)a3
{
  self->_sensorCenterOffset = a3;
}

- (void)setRawNightModeEnabled:(BOOL)a3
{
  self->_rawNightModeEnabled = a3;
}

- (void)setQuadraProcessingEnabled:(BOOL)a3
{
  self->_quadraProcessingEnabled = a3;
}

- (void)setLtmHDRCurvesEnabled:(BOOL)a3
{
  self->_ltmHDRCurvesEnabled = a3;
}

- (void)setLowlightSFHRSupportEnabled:(BOOL)a3
{
  self->_lowlightSFHRSupportEnabled = a3;
}

- (void)setLossyCompressionLevel:(int)a3
{
  self->_lossyCompressionLevel = a3;
}

- (void)setLinearRGBForDisparityEnabled:(BOOL)a3
{
  self->_linearRGBForDisparityEnabled = a3;
}

- (void)setLearnedNREnabled:(BOOL)a3
{
  self->_learnedNREnabled = a3;
}

- (void)setInputDimensionsByQSubResolutionFlavorByPortType:(id)a3
{
}

- (void)setInputDimensions:(id)a3
{
  self->_inputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setGdcEnabled:(BOOL)a3
{
  self->_gdcEnabled = a3;
}

- (void)setDocumentScanningEnabled:(BOOL)a3
{
  self->_documentScanningEnabled = a3;
}

- (void)setDeepFusionEnabled:(BOOL)a3
{
  self->_deepFusionEnabled = a3;
}

- (void)setCmiResourceEnabled:(BOOL)a3
{
  self->_cmiResourceEnabled = a3;
}

- (void)setAuxiliaryTypesForFocusPixelDisparityEnabled:(BOOL)a3
{
  self->_auxiliaryTypesForFocusPixelDisparityEnabled = a3;
}

- (void)setOutputDimensions:(id)a3
{
  self->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- ($2825F4736939C4A6D3AD43837233062D)inputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_inputDimensions;
}

- ($2825F4736939C4A6D3AD43837233062D)outputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_outputDimensions;
}

- (void)setQBinProcessingMode:(int)a3
{
  self->_qBinProcessingMode = a3;
}

- (void)setOutputDimensionsByQSubResolutionFlavor:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWSoftISPProcessorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

- (CGPoint)sensorCenterOffset
{
  double x = self->_sensorCenterOffset.x;
  double y = self->_sensorCenterOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)cmiResourceEnabled
{
  return self->_cmiResourceEnabled;
}

- (BOOL)learnedNREnabled
{
  return self->_learnedNREnabled;
}

- (BOOL)gdcEnabled
{
  return self->_gdcEnabled;
}

- (int)lossyCompressionLevel
{
  return self->_lossyCompressionLevel;
}

- (BOOL)auxiliaryTypesForFocusPixelDisparityEnabled
{
  return self->_auxiliaryTypesForFocusPixelDisparityEnabled;
}

- (BOOL)ltmHDRCurvesEnabled
{
  return self->_ltmHDRCurvesEnabled;
}

- (BOOL)sfhrSupportEnabled
{
  return self->_sfhrSupportEnabled;
}

- (BOOL)lowlightSFHRSupportEnabled
{
  return self->_lowlightSFHRSupportEnabled;
}

- (BOOL)documentScanningEnabled
{
  return self->_documentScanningEnabled;
}

@end