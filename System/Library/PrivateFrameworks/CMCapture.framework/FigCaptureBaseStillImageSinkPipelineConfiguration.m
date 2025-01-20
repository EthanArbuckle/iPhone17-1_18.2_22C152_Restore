@interface FigCaptureBaseStillImageSinkPipelineConfiguration
+ (BOOL)supportsSecureCoding;
- ($2825F4736939C4A6D3AD43837233062D)cinematicFramingWarpingOutputDimensions;
- ($2825F4736939C4A6D3AD43837233062D)depthDataDimensions;
- (BOOL)allowedToModifyInputBuffers;
- (BOOL)allowsMultipleInflightCaptures;
- (BOOL)cinematicFramingWarpingRequired;
- (BOOL)clientIsCameraOrDerivative;
- (BOOL)inputIs10Bit;
- (BOOL)isEqual:(id)a3;
- (BOOL)stillImageStabilizationSupported;
- (BOOL)usesHighEncodingPriority;
- (FigCaptureBaseStillImageSinkPipelineConfiguration)initWithCoder:(id)a3;
- (FigCaptureIrisSinkConfiguration)irisSinkConfiguration;
- (FigCaptureSinkConfiguration)sinkConfiguration;
- (float)maxSupportedFrameRate;
- (float)portraitEffectsMatteMainImageDownscalingFactor;
- (int)horizontalSensorBinningFactor;
- (int)motionAttachmentsSource;
- (int)noiseReductionAndFusionScheme;
- (int)outputColorSpaceProperties;
- (int)verticalSensorBinningFactor;
- (unint64_t)hash;
- (unsigned)outputPixelFormat;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowedToModifyInputBuffers:(BOOL)a3;
- (void)setAllowsMultipleInflightCaptures:(BOOL)a3;
- (void)setCinematicFramingWarpingOutputDimensions:(id)a3;
- (void)setCinematicFramingWarpingRequired:(BOOL)a3;
- (void)setClientIsCameraOrDerivative:(BOOL)a3;
- (void)setDepthDataDimensions:(id)a3;
- (void)setHorizontalSensorBinningFactor:(int)a3;
- (void)setInputIs10Bit:(BOOL)a3;
- (void)setMaxSupportedFrameRate:(float)a3;
- (void)setMotionAttachmentsSource:(int)a3;
- (void)setNoiseReductionAndFusionScheme:(int)a3;
- (void)setOutputColorSpaceProperties:(int)a3;
- (void)setOutputPixelFormat:(unsigned int)a3;
- (void)setPortraitEffectsMatteMainImageDownscalingFactor:(float)a3;
- (void)setSinkConfiguration:(id)a3;
- (void)setStillImageStabilizationSupported:(BOOL)a3;
- (void)setUsesHighEncodingPriority:(BOOL)a3;
- (void)setVerticalSensorBinningFactor:(int)a3;
@end

@implementation FigCaptureBaseStillImageSinkPipelineConfiguration

- (BOOL)clientIsCameraOrDerivative
{
  return self->_clientIsCameraOrDerivative;
}

- (FigCaptureSinkConfiguration)sinkConfiguration
{
  return self->_sinkConfiguration;
}

- (BOOL)cinematicFramingWarpingRequired
{
  return self->_cinematicFramingWarpingRequired;
}

- (BOOL)usesHighEncodingPriority
{
  return self->_usesHighEncodingPriority;
}

- (void)setDepthDataDimensions:(id)a3
{
  self->_depthDataDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setVerticalSensorBinningFactor:(int)a3
{
  self->_verticalSensorBinningFactor = a3;
}

- (void)setUsesHighEncodingPriority:(BOOL)a3
{
  self->_usesHighEncodingPriority = a3;
}

- (void)setStillImageStabilizationSupported:(BOOL)a3
{
  self->_stillImageStabilizationSupported = a3;
}

- (void)setSinkConfiguration:(id)a3
{
}

- (void)setPortraitEffectsMatteMainImageDownscalingFactor:(float)a3
{
  self->_portraitEffectsMatteMainImageDownscalingFactor = a3;
}

- (void)setOutputPixelFormat:(unsigned int)a3
{
  self->_outputPixelFormat = a3;
}

- (void)setNoiseReductionAndFusionScheme:(int)a3
{
  self->_noiseReductionAndFusionScheme = a3;
}

- (void)setMotionAttachmentsSource:(int)a3
{
  self->_motionAttachmentsSource = a3;
}

- (void)setMaxSupportedFrameRate:(float)a3
{
  self->_maxSupportedFrameRate = a3;
}

- (void)setInputIs10Bit:(BOOL)a3
{
  self->_inputIs10Bit = a3;
}

- (void)setHorizontalSensorBinningFactor:(int)a3
{
  self->_horizontalSensorBinningFactor = a3;
}

- (void)setClientIsCameraOrDerivative:(BOOL)a3
{
  self->_clientIsCameraOrDerivative = a3;
}

- (void)setAllowsMultipleInflightCaptures:(BOOL)a3
{
  self->_allowsMultipleInflightCaptures = a3;
}

- (void)setAllowedToModifyInputBuffers:(BOOL)a3
{
  self->_allowedToModifyInputBuffers = a3;
}

- (float)portraitEffectsMatteMainImageDownscalingFactor
{
  return self->_portraitEffectsMatteMainImageDownscalingFactor;
}

- ($2825F4736939C4A6D3AD43837233062D)depthDataDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_depthDataDimensions;
}

- (int)noiseReductionAndFusionScheme
{
  return self->_noiseReductionAndFusionScheme;
}

- (int)verticalSensorBinningFactor
{
  return self->_verticalSensorBinningFactor;
}

- (BOOL)stillImageStabilizationSupported
{
  return self->_stillImageStabilizationSupported;
}

- (int)outputColorSpaceProperties
{
  return self->_outputColorSpaceProperties;
}

- (BOOL)inputIs10Bit
{
  return self->_inputIs10Bit;
}

- (int)horizontalSensorBinningFactor
{
  return self->_horizontalSensorBinningFactor;
}

- (BOOL)allowsMultipleInflightCaptures
{
  return self->_allowsMultipleInflightCaptures;
}

- (BOOL)allowedToModifyInputBuffers
{
  return self->_allowedToModifyInputBuffers;
}

- (void)setCinematicFramingWarpingRequired:(BOOL)a3
{
  self->_cinematicFramingWarpingRequired = a3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureBaseStillImageSinkPipelineConfiguration;
  [(FigCaptureBaseStillImageSinkPipelineConfiguration *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureIrisSinkConfiguration)irisSinkConfiguration
{
  if ([(FigCaptureSinkConfiguration *)self->_sinkConfiguration sinkType] == 10) {
    return (FigCaptureIrisSinkConfiguration *)self->_sinkConfiguration;
  }
  else {
    return 0;
  }
}

- (FigCaptureBaseStillImageSinkPipelineConfiguration)initWithCoder:(id)a3
{
  v4 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self init];
  if (v4)
  {
    v4->_allowsMultipleInflightCaptures = [a3 decodeBoolForKey:@"allowsMultipleInflightCaptures"];
    v4->_clientIsCameraOrDerivative = [a3 decodeBoolForKey:@"clientIsCameraOrDerivative"];
    v4->_allowedToModifyInputBuffers = [a3 decodeBoolForKey:@"allowedToModifyInputBuffers"];
    v4->_inputIs10Bit = [a3 decodeBoolForKey:@"inputIs10Bit"];
    v4->_horizontalSensorBinningFactor = [a3 decodeInt32ForKey:@"horizontalSensorBinningFactor"];
    v4->_verticalSensorBinningFactor = [a3 decodeInt32ForKey:@"verticalSensorBinningFactor"];
    [a3 decodeFloatForKey:@"maxSupportedFrameRate"];
    v4->_maxSupportedFrameRate = v5;
    v4->_motionAttachmentsSource = [a3 decodeInt32ForKey:@"motionAttachmentsSource"];
    v4->_sinkConfiguration = (FigCaptureSinkConfiguration *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"sinkConfiguration"];
    v4->_usesHighEncodingPriority = [a3 decodeBoolForKey:@"usesHighEncodingPriority"];
    v4->_outputPixelFormat = [a3 decodeInt32ForKey:@"outputPixelFormat"];
    v4->_outputColorSpaceProperties = [a3 decodeInt32ForKey:@"outputColorSpacePropertiesKey"];
    v4->_stillImageStabilizationSupported = [a3 decodeBoolForKey:@"stillImageStabilizationSupported"];
    v4->_noiseReductionAndFusionScheme = [a3 decodeInt32ForKey:@"noiseReductionAndFusionScheme"];
    v4->_depthDataDimensions.width = [a3 decodeInt32ForKey:@"depthDataDimensionsWidth"];
    v4->_depthDataDimensions.height = [a3 decodeInt32ForKey:@"depthDataDimensionsHeight"];
    [a3 decodeFloatForKey:@"portraitEffectsMatteMainImageDownscalingFactor"];
    v4->_portraitEffectsMatteMainImageDownscalingFactor = v6;
    v4->_cinematicFramingWarpingRequired = [a3 decodeBoolForKey:@"cinematicFramingWarpingRequiredKey"];
    v4->_cinematicFramingWarpingOutputDimensions.width = [a3 decodeInt32ForKey:@"cinematicFramingWarpingOutputDimensionsWidth"];
    v4->_cinematicFramingWarpingOutputDimensions.height = [a3 decodeInt32ForKey:@"cinematicFramingWarpingOutputDimensionsHeight"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeBool:self->_allowsMultipleInflightCaptures forKey:@"allowsMultipleInflightCaptures"];
  [a3 encodeBool:self->_clientIsCameraOrDerivative forKey:@"clientIsCameraOrDerivative"];
  [a3 encodeBool:self->_allowedToModifyInputBuffers forKey:@"allowedToModifyInputBuffers"];
  [a3 encodeBool:self->_inputIs10Bit forKey:@"inputIs10Bit"];
  [a3 encodeInt32:self->_horizontalSensorBinningFactor forKey:@"horizontalSensorBinningFactor"];
  [a3 encodeInt32:self->_verticalSensorBinningFactor forKey:@"verticalSensorBinningFactor"];
  *(float *)&double v5 = self->_maxSupportedFrameRate;
  [a3 encodeFloat:@"maxSupportedFrameRate" forKey:v5];
  [a3 encodeInt32:self->_motionAttachmentsSource forKey:@"motionAttachmentsSource"];
  [a3 encodeObject:self->_sinkConfiguration forKey:@"sinkConfiguration"];
  [a3 encodeBool:self->_usesHighEncodingPriority forKey:@"usesHighEncodingPriority"];
  [a3 encodeInt32:self->_outputPixelFormat forKey:@"outputPixelFormat"];
  [a3 encodeInt32:self->_outputColorSpaceProperties forKey:@"outputColorSpacePropertiesKey"];
  [a3 encodeBool:self->_stillImageStabilizationSupported forKey:@"stillImageStabilizationSupported"];
  [a3 encodeInt32:self->_noiseReductionAndFusionScheme forKey:@"noiseReductionAndFusionScheme"];
  [a3 encodeInt32:self->_depthDataDimensions.width forKey:@"depthDataDimensionsWidth"];
  [a3 encodeInt32:self->_depthDataDimensions.height forKey:@"depthDataDimensionsHeight"];
  *(float *)&double v6 = self->_portraitEffectsMatteMainImageDownscalingFactor;
  [a3 encodeFloat:@"portraitEffectsMatteMainImageDownscalingFactor" forKey:v6];
  [a3 encodeBool:self->_cinematicFramingWarpingRequired forKey:@"cinematicFramingWarpingRequiredKey"];
  [a3 encodeInt32:self->_cinematicFramingWarpingOutputDimensions.width forKey:@"cinematicFramingWarpingOutputDimensionsWidth"];
  uint64_t height = self->_cinematicFramingWarpingOutputDimensions.height;
  [a3 encodeInt32:height forKey:@"cinematicFramingWarpingOutputDimensionsHeight"];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v16) = 1;
    return v16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_21;
  }
  int v5 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self allowsMultipleInflightCaptures];
  if (v5 != [a3 allowsMultipleInflightCaptures]) {
    goto LABEL_21;
  }
  int v6 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self clientIsCameraOrDerivative];
  if (v6 != [a3 clientIsCameraOrDerivative]) {
    goto LABEL_21;
  }
  int v7 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self allowedToModifyInputBuffers];
  if (v7 != [a3 allowedToModifyInputBuffers]
    || (int v8 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self inputIs10Bit],
        v8 != [a3 inputIs10Bit])
    || (int v9 = -[FigCaptureBaseStillImageSinkPipelineConfiguration horizontalSensorBinningFactor](self, "horizontalSensorBinningFactor"), v9 != [a3 horizontalSensorBinningFactor])|| (v10 = -[FigCaptureBaseStillImageSinkPipelineConfiguration verticalSensorBinningFactor](self, "verticalSensorBinningFactor"), v10 != objc_msgSend(a3, "verticalSensorBinningFactor"))|| (-[FigCaptureBaseStillImageSinkPipelineConfiguration maxSupportedFrameRate](self, "maxSupportedFrameRate"), v12 = v11, objc_msgSend(a3, "maxSupportedFrameRate"), v12 != v13)|| (v14 = -[FigCaptureBaseStillImageSinkPipelineConfiguration motionAttachmentsSource](self, "motionAttachmentsSource"), v14 != objc_msgSend(a3, "motionAttachmentsSource")))
  {
LABEL_21:
    LOBYTE(v16) = 0;
    return v16;
  }
  v15 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self sinkConfiguration];
  if (v15 == (FigCaptureSinkConfiguration *)[a3 sinkConfiguration]
    || (BOOL v16 = -[FigCaptureSinkConfiguration isEqual:](-[FigCaptureBaseStillImageSinkPipelineConfiguration sinkConfiguration](self, "sinkConfiguration"), "isEqual:", [a3 sinkConfiguration])))
  {
    int v17 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self usesHighEncodingPriority];
    if (v17 != [a3 usesHighEncodingPriority]) {
      goto LABEL_21;
    }
    unsigned int v18 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self outputPixelFormat];
    if (v18 != [a3 outputPixelFormat]) {
      goto LABEL_21;
    }
    int v19 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self outputColorSpaceProperties];
    if (v19 != [a3 outputColorSpaceProperties]) {
      goto LABEL_21;
    }
    int v20 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self stillImageStabilizationSupported];
    if (v20 != [a3 stillImageStabilizationSupported]) {
      goto LABEL_21;
    }
    int v21 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self noiseReductionAndFusionScheme];
    if (v21 != [a3 noiseReductionAndFusionScheme]) {
      goto LABEL_21;
    }
    BOOL v16 = FigCaptureVideoDimensionsAreEqual(-[FigCaptureBaseStillImageSinkPipelineConfiguration depthDataDimensions](self, "depthDataDimensions"), [a3 depthDataDimensions]);
    if (!v16) {
      return v16;
    }
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self portraitEffectsMatteMainImageDownscalingFactor];
    float v23 = v22;
    [a3 portraitEffectsMatteMainImageDownscalingFactor];
    if (v23 != v24) {
      goto LABEL_21;
    }
    int v25 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self cinematicFramingWarpingRequired];
    if (v25 != [a3 cinematicFramingWarpingRequired]) {
      goto LABEL_21;
    }
    $2825F4736939C4A6D3AD43837233062D v26 = [(FigCaptureBaseStillImageSinkPipelineConfiguration *)self cinematicFramingWarpingOutputDimensions];
    uint64_t v27 = [a3 cinematicFramingWarpingOutputDimensions];
    LOBYTE(v16) = FigCaptureVideoDimensionsAreEqual(*(void *)&v26, v27);
  }
  return v16;
}

- (unint64_t)hash
{
  return [(FigCaptureSinkConfiguration *)self->_sinkConfiguration hash];
}

- (float)maxSupportedFrameRate
{
  return self->_maxSupportedFrameRate;
}

- (int)motionAttachmentsSource
{
  return self->_motionAttachmentsSource;
}

- (unsigned)outputPixelFormat
{
  return self->_outputPixelFormat;
}

- (void)setOutputColorSpaceProperties:(int)a3
{
  self->_outputColorSpaceProperties = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)cinematicFramingWarpingOutputDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_cinematicFramingWarpingOutputDimensions;
}

- (void)setCinematicFramingWarpingOutputDimensions:(id)a3
{
  self->_cinematicFramingWarpingOutputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

@end