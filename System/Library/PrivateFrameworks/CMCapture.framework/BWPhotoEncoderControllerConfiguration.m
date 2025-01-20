@interface BWPhotoEncoderControllerConfiguration
- ($2825F4736939C4A6D3AD43837233062D)constantColorConfidenceMapDimensions;
- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions;
- (BOOL)alwaysAwaitInference;
- (BOOL)cameraSupportsFlash;
- (BOOL)deferredPhotoProcessorEnabled;
- (BOOL)smartStyleReversibilityEnabled;
- (BOOL)usesHighEncodingPriority;
- (BOOL)zeroShutterLagEnabled;
- (NSDictionary)attachedMediaConfigurationByAttachedMediaKey;
- (NSDictionary)inputColorInfo;
- (int)portraitRenderQuality;
- (int)semanticDevelopmentVersion;
- (int)smartStyleRenderingVersion;
- (void)dealloc;
- (void)setAlwaysAwaitInference:(BOOL)a3;
- (void)setAttachedMediaConfigurationByAttachedMediaKey:(id)a3;
- (void)setCameraSupportsFlash:(BOOL)a3;
- (void)setConstantColorConfidenceMapDimensions:(id)a3;
- (void)setDeferredPhotoProcessorEnabled:(BOOL)a3;
- (void)setInputColorInfo:(id)a3;
- (void)setPortraitRenderQuality:(int)a3;
- (void)setSemanticDevelopmentVersion:(int)a3;
- (void)setSmartStyleRenderingVersion:(int)a3;
- (void)setSmartStyleReversibilityEnabled:(BOOL)a3;
- (void)setStereoPhotoOutputDimensions:(id)a3;
- (void)setUsesHighEncodingPriority:(BOOL)a3;
- (void)setZeroShutterLagEnabled:(BOOL)a3;
@end

@implementation BWPhotoEncoderControllerConfiguration

- (void)setUsesHighEncodingPriority:(BOOL)a3
{
  self->_usesHighEncodingPriority = a3;
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityEnabled = a3;
}

- (void)setSmartStyleRenderingVersion:(int)a3
{
  self->_smartStyleRenderingVersion = a3;
}

- (void)setCameraSupportsFlash:(BOOL)a3
{
  self->_cameraSupportsFlash = a3;
}

- (void)setStereoPhotoOutputDimensions:(id)a3
{
  self->_stereoPhotoOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setSemanticDevelopmentVersion:(int)a3
{
  self->_semanticDevelopmentVersion = a3;
}

- (void)setPortraitRenderQuality:(int)a3
{
  self->_portraitRenderQuality = a3;
}

- (void)setDeferredPhotoProcessorEnabled:(BOOL)a3
{
  self->_deferredPhotoProcessorEnabled = a3;
}

- (void)setAlwaysAwaitInference:(BOOL)a3
{
  self->_alwaysAwaitInference = a3;
}

- (void)setAttachedMediaConfigurationByAttachedMediaKey:(id)a3
{
}

- (BOOL)deferredPhotoProcessorEnabled
{
  return self->_deferredPhotoProcessorEnabled;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWPhotoEncoderControllerConfiguration;
  [(BWStillImageProcessorControllerConfiguration *)&v3 dealloc];
}

- (BOOL)alwaysAwaitInference
{
  return self->_alwaysAwaitInference;
}

- (BOOL)usesHighEncodingPriority
{
  return self->_usesHighEncodingPriority;
}

- (BOOL)zeroShutterLagEnabled
{
  return self->_zeroShutterLagEnabled;
}

- (void)setZeroShutterLagEnabled:(BOOL)a3
{
  self->_zeroShutterLagEnabled = a3;
}

- (NSDictionary)attachedMediaConfigurationByAttachedMediaKey
{
  return self->_attachedMediaConfigurationByAttachedMediaKey;
}

- (int)portraitRenderQuality
{
  return self->_portraitRenderQuality;
}

- (int)semanticDevelopmentVersion
{
  return self->_semanticDevelopmentVersion;
}

- (NSDictionary)inputColorInfo
{
  return self->_inputColorInfo;
}

- (void)setInputColorInfo:(id)a3
{
}

- (BOOL)cameraSupportsFlash
{
  return self->_cameraSupportsFlash;
}

- ($2825F4736939C4A6D3AD43837233062D)constantColorConfidenceMapDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_constantColorConfidenceMapDimensions;
}

- (void)setConstantColorConfidenceMapDimensions:(id)a3
{
  self->_constantColorConfidenceMapDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (int)smartStyleRenderingVersion
{
  return self->_smartStyleRenderingVersion;
}

- (BOOL)smartStyleReversibilityEnabled
{
  return self->_smartStyleReversibilityEnabled;
}

- ($2825F4736939C4A6D3AD43837233062D)stereoPhotoOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_stereoPhotoOutputDimensions;
}

@end