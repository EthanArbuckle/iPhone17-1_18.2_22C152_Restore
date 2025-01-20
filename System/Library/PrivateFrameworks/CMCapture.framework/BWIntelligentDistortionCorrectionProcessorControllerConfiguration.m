@interface BWIntelligentDistortionCorrectionProcessorControllerConfiguration
- ($2825F4736939C4A6D3AD43837233062D)geometricDistortionCorrectionExpandedImageDimensions;
- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions;
- ($5E5F304956FB491AF6F034FDF0808287)processorConfig;
- (BOOL)depthDataCorrectionEnabled;
- (BOOL)intelligentDistortionCorrectionAppliesFinalDimensions;
- (BWVideoFormat)depthFormat;
- (BWVideoFormat)primaryFormat;
- (CGPoint)geometricDistortionCorrectionInputCropOffset;
- (NSArray)portTypesWithGeometricDistortionCorrectionEnabled;
- (NSArray)portTypesWithIntelligentDistortionCorrectionEnabled;
- (NSDictionary)providedInferenceAttachedMediaByMode;
- (int)baseDepthRotationDegrees;
- (int)horizontalSensorBinningFactor;
- (int)intelligentDistortionCorrectionVersion;
- (int)verticalSensorBinningFactor;
- (void)dealloc;
- (void)setDepthDataCorrectionEnabled:(BOOL)a3 primaryFormat:(id)a4 depthFormat:(id)a5 baseDepthRotationDegrees:(int)a6;
- (void)setGeometricDistortionCorrectionExpandedImageDimensions:(id)a3;
- (void)setGeometricDistortionCorrectionInputCropOffset:(CGPoint)a3;
- (void)setHorizontalSensorBinningFactor:(int)a3;
- (void)setIntelligentDistortionCorrectionAppliesFinalDimensions:(BOOL)a3;
- (void)setIntelligentDistortionCorrectionVersion:(int)a3;
- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(id)a3;
- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(id)a3;
- (void)setProcessorConfig:(id)a3;
- (void)setProvidedInferenceAttachedMediaByMode:(id)a3;
- (void)setStereoPhotoOutputDimensions:(id)a3;
- (void)setVerticalSensorBinningFactor:(int)a3;
@end

@implementation BWIntelligentDistortionCorrectionProcessorControllerConfiguration

- (void)setVerticalSensorBinningFactor:(int)a3
{
  self->_verticalSensorBinningFactor = a3;
}

- (void)setStereoPhotoOutputDimensions:(id)a3
{
  self->_stereoPhotoOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setProvidedInferenceAttachedMediaByMode:(id)a3
{
}

- (void)setPortTypesWithIntelligentDistortionCorrectionEnabled:(id)a3
{
}

- (void)setPortTypesWithGeometricDistortionCorrectionEnabled:(id)a3
{
}

- (void)setIntelligentDistortionCorrectionVersion:(int)a3
{
  self->_intelligentDistortionCorrectionVersion = a3;
}

- (void)setIntelligentDistortionCorrectionAppliesFinalDimensions:(BOOL)a3
{
  self->_intelligentDistortionCorrectionAppliesFinalDimensions = a3;
}

- (void)setHorizontalSensorBinningFactor:(int)a3
{
  self->_horizontalSensorBinningFactor = a3;
}

- (void)setGeometricDistortionCorrectionInputCropOffset:(CGPoint)a3
{
  self->_geometricDistortionCorrectionInputCropOffset = a3;
}

- (void)setGeometricDistortionCorrectionExpandedImageDimensions:(id)a3
{
  self->_geometricDistortionCorrectionExpandedImageDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWIntelligentDistortionCorrectionProcessorControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

- (void)setDepthDataCorrectionEnabled:(BOOL)a3 primaryFormat:(id)a4 depthFormat:(id)a5 baseDepthRotationDegrees:(int)a6
{
  BOOL v9 = a3;

  if (v9)
  {
    self->_primaryFormat = (BWVideoFormat *)a4;
    self->_depthFormat = (BWVideoFormat *)a5;
  }
  self->_depthDataCorrectionEnabled = v9;
  self->_baseDepthRotationDegrees = a6;
}

- (NSArray)portTypesWithGeometricDistortionCorrectionEnabled
{
  return self->_portTypesWithGeometricDistortionCorrectionEnabled;
}

- (NSArray)portTypesWithIntelligentDistortionCorrectionEnabled
{
  return self->_portTypesWithIntelligentDistortionCorrectionEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)geometricDistortionCorrectionExpandedImageDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_geometricDistortionCorrectionExpandedImageDimensions;
}

- (CGPoint)geometricDistortionCorrectionInputCropOffset
{
  double x = self->_geometricDistortionCorrectionInputCropOffset.x;
  double y = self->_geometricDistortionCorrectionInputCropOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (int)intelligentDistortionCorrectionVersion
{
  return self->_intelligentDistortionCorrectionVersion;
}

- (BOOL)intelligentDistortionCorrectionAppliesFinalDimensions
{
  return self->_intelligentDistortionCorrectionAppliesFinalDimensions;
}

- (int)horizontalSensorBinningFactor
{
  return self->_horizontalSensorBinningFactor;
}

- (int)verticalSensorBinningFactor
{
  return self->_verticalSensorBinningFactor;
}

- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_stereoPhotoOutputDimensions;
}

- ($5E5F304956FB491AF6F034FDF0808287)processorConfig
{
  p_processorConfig = &self->_processorConfig;
  uint64_t v3 = *(void *)&self->_processorConfig.maximumImageWidth;
  uint64_t v4 = *(void *)&p_processorConfig->maximumPersonMaskWidth;
  result.var2 = v4;
  result.var3 = HIDWORD(v4);
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- (void)setProcessorConfig:(id)a3
{
  self->_processorConfig = ($1F00A21A4A7E7DA834853B7FB335A589)a3;
}

- (NSDictionary)providedInferenceAttachedMediaByMode
{
  return self->_providedInferenceAttachedMediaByMode;
}

- (BOOL)depthDataCorrectionEnabled
{
  return self->_depthDataCorrectionEnabled;
}

- (BWVideoFormat)primaryFormat
{
  return self->_primaryFormat;
}

- (BWVideoFormat)depthFormat
{
  return self->_depthFormat;
}

- (int)baseDepthRotationDegrees
{
  return self->_baseDepthRotationDegrees;
}

@end