@interface BWDeferredPipelineParameters
+ (BOOL)supportsSecureCoding;
- ($2825F4736939C4A6D3AD43837233062D)depthDataDimensions;
- ($2825F4736939C4A6D3AD43837233062D)rawSensorDimensions;
- ($2825F4736939C4A6D3AD43837233062D)smartStyleLinearThumbnailDimensions;
- ($2825F4736939C4A6D3AD43837233062D)smartStyleStyledThumbnailDimensions;
- (BOOL)areCompatibleWith:(id)a3;
- (BOOL)canProcessEnhancedResolution;
- (BOOL)continuousZoomWithDepthSupported;
- (BOOL)dcProcessingWithDepthSupported;
- (BOOL)generateInferencesForSemanticProcessingIfNeeded;
- (BOOL)geometricDistortionCorrectionEnabled;
- (BOOL)intelligentDistortionCorrectionEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)quadraProcessingSupportEnabled;
- (BOOL)smartStyleReversibilityEnabled;
- (BWDeferredPipelineParameters)initWithCoder:(id)a3;
- (CGPoint)sensorCenterOffset;
- (NSDictionary)dimensionsByQSubResolutionFlavorByPortType;
- (char)_initWithLegacyCaptureSettings:(void *)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)deepZoomMode;
- (int)deepZoomVersion;
- (int)depthDataType;
- (int)distortionCorrectionVersion;
- (int)noiseReductionAndFusionScheme;
- (int)nrfVersion;
- (int)pearlModuleType;
- (int)semanticRenderingVersion;
- (int)smartStyleRenderingVersion;
- (int)stillImageGDCSourceMode;
- (unsigned)sfhrMode;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCanProcessEnhancedResolution:(BOOL)a3;
- (void)setContinuousZoomWithDepthSupported:(BOOL)a3;
- (void)setDcProcessingWithDepthSupported:(BOOL)a3;
- (void)setDeepZoomMode:(int)a3;
- (void)setDeepZoomVersion:(int)a3;
- (void)setDepthDataDimensions:(id)a3;
- (void)setDepthDataType:(int)a3;
- (void)setDimensionsByQSubResolutionFlavorByPortType:(id)a3;
- (void)setDistortionCorrectionVersion:(int)a3;
- (void)setGenerateInferencesForSemanticProcessingIfNeeded:(BOOL)a3;
- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3;
- (void)setIntelligentDistortionCorrectionEnabled:(BOOL)a3;
- (void)setNoiseReductionAndFusionScheme:(int)a3;
- (void)setNrfVersion:(int)a3;
- (void)setPearlModuleType:(int)a3;
- (void)setQuadraProcessingSupportEnabled:(BOOL)a3;
- (void)setRawSensorDimensions:(id)a3;
- (void)setSemanticRenderingVersion:(int)a3;
- (void)setSensorCenterOffset:(CGPoint)a3;
- (void)setSfhrMode:(unsigned int)a3;
- (void)setSmartStyleLinearThumbnailDimensions:(id)a3;
- (void)setSmartStyleRenderingVersion:(int)a3;
- (void)setSmartStyleReversibilityEnabled:(BOOL)a3;
- (void)setSmartStyleStyledThumbnailDimensions:(id)a3;
- (void)setStillImageGDCSourceMode:(int)a3;
@end

@implementation BWDeferredPipelineParameters

- (int)deepZoomVersion
{
  return self->_deepZoomVersion;
}

- (int)pearlModuleType
{
  return self->_pearlModuleType;
}

- (int)distortionCorrectionVersion
{
  return self->_distortionCorrectionVersion;
}

- (CGPoint)sensorCenterOffset
{
  double x = self->_sensorCenterOffset.x;
  double y = self->_sensorCenterOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)quadraProcessingSupportEnabled
{
  return self->_quadraProcessingSupportEnabled;
}

- (int)nrfVersion
{
  return self->_nrfVersion;
}

- (int)noiseReductionAndFusionScheme
{
  return self->_noiseReductionAndFusionScheme;
}

- (BOOL)intelligentDistortionCorrectionEnabled
{
  return self->_intelligentDistortionCorrectionEnabled;
}

- (BOOL)geometricDistortionCorrectionEnabled
{
  return self->_geometricDistortionCorrectionEnabled;
}

- (int)stillImageGDCSourceMode
{
  return self->_stillImageGDCSourceMode;
}

- ($2825F4736939C4A6D3AD43837233062D)smartStyleStyledThumbnailDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_smartStyleStyledThumbnailDimensions;
}

- (BOOL)smartStyleReversibilityEnabled
{
  return self->_smartStyleReversibilityEnabled;
}

- (int)smartStyleRenderingVersion
{
  return self->_smartStyleRenderingVersion;
}

- ($2825F4736939C4A6D3AD43837233062D)smartStyleLinearThumbnailDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_smartStyleLinearThumbnailDimensions;
}

- (unsigned)sfhrMode
{
  return self->_sfhrMode;
}

- (void)setSmartStyleReversibilityEnabled:(BOOL)a3
{
  self->_smartStyleReversibilityEnabled = a3;
}

- (void)setSmartStyleRenderingVersion:(int)a3
{
  self->_smartStyleRenderingVersion = a3;
}

- (void)setSfhrMode:(unsigned int)a3
{
  self->_sfhrMode = a3;
}

- (void)setSensorCenterOffset:(CGPoint)a3
{
  self->_sensorCenterOffset = a3;
}

- (void)setSemanticRenderingVersion:(int)a3
{
  self->_semanticRenderingVersion = a3;
}

- (void)setRawSensorDimensions:(id)a3
{
  self->_rawSensorDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setQuadraProcessingSupportEnabled:(BOOL)a3
{
  self->_quadraProcessingSupportEnabled = a3;
}

- (void)setPearlModuleType:(int)a3
{
  self->_pearlModuleType = a3;
}

- (void)setNrfVersion:(int)a3
{
  self->_nrfVersion = a3;
}

- (void)setNoiseReductionAndFusionScheme:(int)a3
{
  self->_noiseReductionAndFusionScheme = a3;
}

- (void)setIntelligentDistortionCorrectionEnabled:(BOOL)a3
{
  self->_intelligentDistortionCorrectionEnabled = a3;
}

- (void)setGeometricDistortionCorrectionEnabled:(BOOL)a3
{
  self->_geometricDistortionCorrectionEnabled = a3;
}

- (void)setGenerateInferencesForSemanticProcessingIfNeeded:(BOOL)a3
{
  self->_generateInferencesForSemanticProcessingIfNeeded = a3;
}

- (void)setDistortionCorrectionVersion:(int)a3
{
  self->_distortionCorrectionVersion = a3;
}

- (void)setDimensionsByQSubResolutionFlavorByPortType:(id)a3
{
}

- (void)setDepthDataType:(int)a3
{
  self->_depthDataType = a3;
}

- (void)setDepthDataDimensions:(id)a3
{
  self->_depthDataDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setDeepZoomVersion:(int)a3
{
  self->_deepZoomVersion = a3;
}

- (void)setDeepZoomMode:(int)a3
{
  self->_deepZoomMode = a3;
}

- (void)setContinuousZoomWithDepthSupported:(BOOL)a3
{
  self->_continuousZoomWithDepthSupported = a3;
}

- (void)setCanProcessEnhancedResolution:(BOOL)a3
{
  self->_canProcessEnhancedResolution = a3;
}

- (int)semanticRenderingVersion
{
  return self->_semanticRenderingVersion;
}

- (BOOL)generateInferencesForSemanticProcessingIfNeeded
{
  return self->_generateInferencesForSemanticProcessingIfNeeded;
}

- (int)depthDataType
{
  return self->_depthDataType;
}

- ($2825F4736939C4A6D3AD43837233062D)depthDataDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_depthDataDimensions;
}

- (int)deepZoomMode
{
  return self->_deepZoomMode;
}

- (BOOL)dcProcessingWithDepthSupported
{
  return self->_dcProcessingWithDepthSupported;
}

- (BOOL)continuousZoomWithDepthSupported
{
  return self->_continuousZoomWithDepthSupported;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeferredPipelineParameters;
  [(BWDeferredPipelineParameters *)&v3 dealloc];
}

- (BWDeferredPipelineParameters)initWithCoder:(id)a3
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)BWDeferredPipelineParameters;
  v4 = [(BWDeferredPipelineParameters *)&v8 init];
  if (v4)
  {
    v4->_rawSensorDimensions.width = [a3 decodeInt32ForKey:@"rawSensorDimensionsWidth"];
    v4->_rawSensorDimensions.height = [a3 decodeInt32ForKey:@"rawSensorDimensionsHeight"];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    v10[0] = objc_opt_class();
    v10[1] = objc_opt_class();
    v10[2] = objc_opt_class();
    v4->_dimensionsByQSubResolutionFlavorByPortType = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 3)), @"dimensionsByQSubResolutionFlavorByPortType");
    v4->_nrfVersion = [a3 decodeInt32ForKey:@"nrfVersion"];
    v4->_noiseReductionAndFusionScheme = [a3 decodeInt32ForKey:@"noiseReductionAndFusionScheme"];
    v4->_distortionCorrectionVersion = [a3 decodeInt32ForKey:@"distortionCorrectionVersion"];
    v4->_intelligentDistortionCorrectionEnabled = [a3 decodeBoolForKey:@"intelligentDistortionCorrectionEnabled"];
    v4->_geometricDistortionCorrectionEnabled = [a3 decodeBoolForKey:@"geometricDistortionCorrectionEnabled"];
    v4->_dcProcessingWithDepthSupported = [a3 decodeBoolForKey:@"dcProcessingWithDepthSupported"];
    v4->_stillImageGDCSourceMode = [a3 decodeInt32ForKey:@"stillImageGDCSourceMode"];
    v4->_deepZoomVersion = [a3 decodeInt32ForKey:@"deepZoomVersion"];
    v4->_deepZoomMode = [a3 decodeInt32ForKey:@"deepZoomMode"];
    v4->_semanticRenderingVersion = [a3 decodeInt32ForKey:@"semanticRenderingVersion"];
    v4->_smartStyleRenderingVersion = [a3 decodeInt32ForKey:@"SmartStyleRenderingVersion"];
    v4->_smartStyleReversibilityEnabled = [a3 decodeBoolForKey:@"SmartStyleReversibilityEnabled"];
    v4->_smartStyleLinearThumbnailDimensions.width = [a3 decodeInt32ForKey:@"smartStyleLinearThumbnailWidth"];
    v4->_smartStyleLinearThumbnailDimensions.height = [a3 decodeInt32ForKey:@"smartStyleLinearThumbnailHeight"];
    v4->_smartStyleStyledThumbnailDimensions.width = [a3 decodeInt32ForKey:@"smartStyleStyledThumbnailWidth"];
    v4->_smartStyleStyledThumbnailDimensions.height = [a3 decodeInt32ForKey:@"smartStyleStyledThumbnailHeight"];
    v4->_generateInferencesForSemanticProcessingIfNeeded = [a3 decodeBoolForKey:@"generateInferencesForSemanticProcessingIfNeeded"];
    v4->_quadraProcessingSupportEnabled = [a3 decodeBoolForKey:@"quadraProcessingSupportEnabled"];
    v4->_canProcessEnhancedResolution = [a3 decodeBoolForKey:@"canProcessEnhancedResolution"];
    v4->_continuousZoomWithDepthSupported = [a3 decodeBoolForKey:@"continuousZoomWithDepthSupported"];
    v4->_depthDataType = [a3 decodeInt32ForKey:@"depthDataType"];
    v4->_depthDataDimensions.width = [a3 decodeInt32ForKey:@"depthDataDimensionsWidth"];
    v4->_depthDataDimensions.height = [a3 decodeInt32ForKey:@"depthDataDimensionsHeight"];
    v4->_pearlModuleType = [a3 decodeInt32ForKey:@"PearlModuleType"];
    v4->_sfhrMode = [a3 decodeInt32ForKey:@"sfhrMode"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    v9[2] = objc_opt_class();
    if (!CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v9, 3)), @"sensorCenterOffset"), &v4->_sensorCenterOffset))v4->_sensorCenterOffset = (CGPoint)*MEMORY[0x1E4F1DAD8]; {
  }
    }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt32:self->_rawSensorDimensions.width forKey:@"rawSensorDimensionsWidth"];
  [a3 encodeInt32:self->_rawSensorDimensions.height forKey:@"rawSensorDimensionsHeight"];
  [a3 encodeObject:self->_dimensionsByQSubResolutionFlavorByPortType forKey:@"dimensionsByQSubResolutionFlavorByPortType"];
  [a3 encodeInt32:self->_nrfVersion forKey:@"nrfVersion"];
  [a3 encodeInt32:self->_noiseReductionAndFusionScheme forKey:@"noiseReductionAndFusionScheme"];
  [a3 encodeInt32:self->_distortionCorrectionVersion forKey:@"distortionCorrectionVersion"];
  [a3 encodeBool:self->_intelligentDistortionCorrectionEnabled forKey:@"intelligentDistortionCorrectionEnabled"];
  [a3 encodeBool:self->_geometricDistortionCorrectionEnabled forKey:@"geometricDistortionCorrectionEnabled"];
  [a3 encodeBool:self->_dcProcessingWithDepthSupported forKey:@"dcProcessingWithDepthSupported"];
  [a3 encodeInt32:self->_stillImageGDCSourceMode forKey:@"stillImageGDCSourceMode"];
  [a3 encodeInt32:self->_deepZoomVersion forKey:@"deepZoomVersion"];
  [a3 encodeInt32:self->_deepZoomMode forKey:@"deepZoomMode"];
  [a3 encodeInt32:self->_semanticRenderingVersion forKey:@"semanticRenderingVersion"];
  [a3 encodeInt32:self->_smartStyleRenderingVersion forKey:@"SmartStyleRenderingVersion"];
  [a3 encodeBool:self->_smartStyleReversibilityEnabled forKey:@"SmartStyleReversibilityEnabled"];
  [a3 encodeInt32:self->_smartStyleLinearThumbnailDimensions.width forKey:@"smartStyleLinearThumbnailWidth"];
  [a3 encodeInt32:self->_smartStyleLinearThumbnailDimensions.height forKey:@"smartStyleLinearThumbnailHeight"];
  [a3 encodeInt32:self->_smartStyleStyledThumbnailDimensions.width forKey:@"smartStyleStyledThumbnailWidth"];
  [a3 encodeInt32:self->_smartStyleStyledThumbnailDimensions.height forKey:@"smartStyleStyledThumbnailHeight"];
  [a3 encodeBool:self->_generateInferencesForSemanticProcessingIfNeeded forKey:@"generateInferencesForSemanticProcessingIfNeeded"];
  [a3 encodeBool:self->_quadraProcessingSupportEnabled forKey:@"quadraProcessingSupportEnabled"];
  [a3 encodeBool:self->_canProcessEnhancedResolution forKey:@"canProcessEnhancedResolution"];
  [a3 encodeBool:self->_continuousZoomWithDepthSupported forKey:@"continuousZoomWithDepthSupported"];
  [a3 encodeInt32:self->_depthDataType forKey:@"depthDataType"];
  [a3 encodeInt32:self->_depthDataDimensions.width forKey:@"depthDataDimensionsWidth"];
  [a3 encodeInt32:self->_depthDataDimensions.height forKey:@"depthDataDimensionsHeight"];
  [a3 encodeInt32:self->_pearlModuleType forKey:@"PearlModuleType"];
  [a3 encodeInt32:self->_sfhrMode forKey:@"sfhrMode"];
  CFDictionaryRef v5 = CGPointCreateDictionaryRepresentation(self->_sensorCenterOffset);
  [a3 encodeObject:v5 forKey:@"sensorCenterOffset"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setRawSensorDimensions:*(void *)&self->_rawSensorDimensions];
  [v4 setDimensionsByQSubResolutionFlavorByPortType:self->_dimensionsByQSubResolutionFlavorByPortType];
  [v4 setNrfVersion:self->_nrfVersion];
  [v4 setNoiseReductionAndFusionScheme:self->_noiseReductionAndFusionScheme];
  [v4 setDistortionCorrectionVersion:self->_distortionCorrectionVersion];
  [v4 setIntelligentDistortionCorrectionEnabled:self->_intelligentDistortionCorrectionEnabled];
  [v4 setGeometricDistortionCorrectionEnabled:self->_geometricDistortionCorrectionEnabled];
  [v4 setDcProcessingWithDepthSupported:self->_dcProcessingWithDepthSupported];
  [v4 setStillImageGDCSourceMode:self->_stillImageGDCSourceMode];
  [v4 setDeepZoomVersion:self->_deepZoomVersion];
  [v4 setDeepZoomMode:self->_deepZoomMode];
  [v4 setSemanticRenderingVersion:self->_semanticRenderingVersion];
  [v4 setSmartStyleRenderingVersion:self->_smartStyleRenderingVersion];
  [v4 setSmartStyleReversibilityEnabled:self->_smartStyleReversibilityEnabled];
  [v4 setSmartStyleLinearThumbnailDimensions:*(void *)&self->_smartStyleLinearThumbnailDimensions];
  [v4 setSmartStyleStyledThumbnailDimensions:*(void *)&self->_smartStyleStyledThumbnailDimensions];
  [v4 setGenerateInferencesForSemanticProcessingIfNeeded:self->_generateInferencesForSemanticProcessingIfNeeded];
  [v4 setQuadraProcessingSupportEnabled:self->_quadraProcessingSupportEnabled];
  [v4 setCanProcessEnhancedResolution:self->_canProcessEnhancedResolution];
  [v4 setContinuousZoomWithDepthSupported:self->_continuousZoomWithDepthSupported];
  [v4 setDepthDataType:self->_depthDataType];
  [v4 setDepthDataDimensions:*(void *)&self->_depthDataDimensions];
  [v4 setPearlModuleType:self->_pearlModuleType];
  [v4 setSfhrMode:self->_sfhrMode];
  return v4;
}

- (char)_initWithLegacyCaptureSettings:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v6.receiver = a1;
  v6.super_class = (Class)BWDeferredPipelineParameters;
  objc_super v3 = (char *)objc_msgSendSuper2(&v6, sel_init);
  if (v3)
  {
    int v4 = [+[FigCaptureCameraParameters sharedInstance] nrfVersion];
    if (([a2 captureFlags] & 4) != 0 || v4 <= 2) {
      *((_DWORD *)v3 + 6) = v4;
    }
    *((_DWORD *)v3 + 7) = 4;
    *((_DWORD *)v3 + 8) = objc_msgSend((id)objc_msgSend(a2, "metadata"), "intelligentDistortionCorrectionVersion");
    v3[36] = objc_msgSend((id)objc_msgSend(a2, "metadata"), "intelligentDistortionCorrectionEnabled");
    v3[37] = objc_msgSend((id)objc_msgSend(a2, "metadata"), "geometricDistortionCorrectionEnabled");
    v3[38] = 0;
    *((_DWORD *)v3 + 10) = 0;
    *((_DWORD *)v3 + 11) = objc_msgSend((id)objc_msgSend(a2, "metadata"), "deepZoomVersion");
    *(void *)(v3 + 52) = 0;
    v3[60] = 0;
    *((void *)v3 + 8) = 0;
    *((void *)v3 + 9) = 0;
    v3[80] = 0;
    v3[81] = *((_DWORD *)v3 + 6) > 2;
    v3[82] = ([a2 captureFlags] & 0x200000000) != 0;
    *((_DWORD *)v3 + 25) = *((_DWORD *)v3 + 6) > 3;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v11) = 1;
  }
  else
  {
    uint64_t v33 = v5;
    uint64_t v34 = v4;
    uint64_t v35 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_18:
      LOBYTE(v11) = 0;
      return v11;
    }
    int v11 = FigCaptureVideoDimensionsAreEqual(-[BWDeferredPipelineParameters rawSensorDimensions](self, "rawSensorDimensions"), [a3 rawSensorDimensions]);
    if (v11)
    {
      v12 = [(BWDeferredPipelineParameters *)self dimensionsByQSubResolutionFlavorByPortType];
      if (v12 == (NSDictionary *)[a3 dimensionsByQSubResolutionFlavorByPortType]
        || (int v11 = -[NSDictionary isEqual:](-[BWDeferredPipelineParameters dimensionsByQSubResolutionFlavorByPortType](self, "dimensionsByQSubResolutionFlavorByPortType"), "isEqual:", [a3 dimensionsByQSubResolutionFlavorByPortType])) != 0)
      {
        int v13 = [(BWDeferredPipelineParameters *)self nrfVersion];
        if (v13 != [a3 nrfVersion]) {
          goto LABEL_18;
        }
        int v14 = [(BWDeferredPipelineParameters *)self noiseReductionAndFusionScheme];
        if (v14 != [a3 noiseReductionAndFusionScheme]) {
          goto LABEL_18;
        }
        int v15 = [(BWDeferredPipelineParameters *)self distortionCorrectionVersion];
        if (v15 != [a3 distortionCorrectionVersion]) {
          goto LABEL_18;
        }
        int v16 = [(BWDeferredPipelineParameters *)self intelligentDistortionCorrectionEnabled];
        if (v16 != [a3 intelligentDistortionCorrectionEnabled]) {
          goto LABEL_18;
        }
        int v17 = [(BWDeferredPipelineParameters *)self geometricDistortionCorrectionEnabled];
        if (v17 != [a3 geometricDistortionCorrectionEnabled]) {
          goto LABEL_18;
        }
        int v18 = [(BWDeferredPipelineParameters *)self dcProcessingWithDepthSupported];
        if (v18 != [a3 dcProcessingWithDepthSupported]) {
          goto LABEL_18;
        }
        int v19 = [(BWDeferredPipelineParameters *)self stillImageGDCSourceMode];
        if (v19 != [a3 stillImageGDCSourceMode]) {
          goto LABEL_18;
        }
        int v20 = [(BWDeferredPipelineParameters *)self deepZoomVersion];
        if (v20 != [a3 deepZoomVersion]) {
          goto LABEL_18;
        }
        int v21 = [(BWDeferredPipelineParameters *)self deepZoomMode];
        if (v21 != [a3 deepZoomMode]) {
          goto LABEL_18;
        }
        int v22 = [(BWDeferredPipelineParameters *)self semanticRenderingVersion];
        if (v22 != [a3 semanticRenderingVersion]) {
          goto LABEL_18;
        }
        int v23 = [(BWDeferredPipelineParameters *)self smartStyleRenderingVersion];
        if (v23 != [a3 smartStyleRenderingVersion]) {
          goto LABEL_18;
        }
        int v24 = [(BWDeferredPipelineParameters *)self smartStyleReversibilityEnabled];
        if (v24 != [a3 smartStyleReversibilityEnabled]) {
          goto LABEL_18;
        }
        int v11 = FigCaptureVideoDimensionsAreEqual(-[BWDeferredPipelineParameters smartStyleLinearThumbnailDimensions](self, "smartStyleLinearThumbnailDimensions"), [a3 smartStyleLinearThumbnailDimensions]);
        if (v11)
        {
          int v11 = FigCaptureVideoDimensionsAreEqual(-[BWDeferredPipelineParameters smartStyleStyledThumbnailDimensions](self, "smartStyleStyledThumbnailDimensions"), [a3 smartStyleStyledThumbnailDimensions]);
          if (v11)
          {
            int v25 = [(BWDeferredPipelineParameters *)self generateInferencesForSemanticProcessingIfNeeded];
            if (v25 != [a3 generateInferencesForSemanticProcessingIfNeeded]) {
              goto LABEL_18;
            }
            int v26 = [(BWDeferredPipelineParameters *)self quadraProcessingSupportEnabled];
            if (v26 != [a3 quadraProcessingSupportEnabled]) {
              goto LABEL_18;
            }
            int v27 = [(BWDeferredPipelineParameters *)self canProcessEnhancedResolution];
            if (v27 != [a3 canProcessEnhancedResolution]) {
              goto LABEL_18;
            }
            int v28 = [(BWDeferredPipelineParameters *)self continuousZoomWithDepthSupported];
            if (v28 != [a3 continuousZoomWithDepthSupported]) {
              goto LABEL_18;
            }
            int v29 = [(BWDeferredPipelineParameters *)self depthDataType];
            if (v29 != [a3 depthDataType]) {
              goto LABEL_18;
            }
            int v11 = FigCaptureVideoDimensionsAreEqual(-[BWDeferredPipelineParameters depthDataDimensions](self, "depthDataDimensions"), [a3 depthDataDimensions]);
            if (!v11) {
              return v11;
            }
            int v30 = [(BWDeferredPipelineParameters *)self pearlModuleType];
            if (v30 != [a3 pearlModuleType]) {
              goto LABEL_18;
            }
            unsigned int v31 = [(BWDeferredPipelineParameters *)self sfhrMode];
            LOBYTE(v11) = v31 == [a3 sfhrMode];
          }
        }
      }
    }
  }
  return v11;
}

- (BOOL)areCompatibleWith:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
    return v5;
  }
  int v5 = FigCaptureVideoDimensionsAreEqual(-[BWDeferredPipelineParameters rawSensorDimensions](self, "rawSensorDimensions"), [a3 rawSensorDimensions]);
  if (v5)
  {
    uint64_t v6 = [(BWDeferredPipelineParameters *)self dimensionsByQSubResolutionFlavorByPortType];
    if (v6 == (NSDictionary *)[a3 dimensionsByQSubResolutionFlavorByPortType]
      || (int v5 = -[NSDictionary isEqual:](-[BWDeferredPipelineParameters dimensionsByQSubResolutionFlavorByPortType](self, "dimensionsByQSubResolutionFlavorByPortType"), "isEqual:", [a3 dimensionsByQSubResolutionFlavorByPortType])) != 0)
    {
      int v7 = [(BWDeferredPipelineParameters *)self nrfVersion];
      if (v7 != [a3 nrfVersion]) {
        goto LABEL_41;
      }
      int v8 = [(BWDeferredPipelineParameters *)self noiseReductionAndFusionScheme];
      if (v8 != [a3 noiseReductionAndFusionScheme]) {
        goto LABEL_41;
      }
      int v9 = [(BWDeferredPipelineParameters *)self distortionCorrectionVersion];
      if (v9 != [a3 distortionCorrectionVersion]) {
        goto LABEL_41;
      }
      int v10 = [(BWDeferredPipelineParameters *)self stillImageGDCSourceMode];
      if (v10 != [a3 stillImageGDCSourceMode]) {
        goto LABEL_41;
      }
      int v11 = [(BWDeferredPipelineParameters *)self semanticRenderingVersion];
      if (v11 != [a3 semanticRenderingVersion]) {
        goto LABEL_41;
      }
      if ((![a3 intelligentDistortionCorrectionEnabled]
         || (int v5 = -[BWDeferredPipelineParameters intelligentDistortionCorrectionEnabled](self, "intelligentDistortionCorrectionEnabled")) != 0)&& (![a3 geometricDistortionCorrectionEnabled]|| (int v5 = -[BWDeferredPipelineParameters geometricDistortionCorrectionEnabled](self, "geometricDistortionCorrectionEnabled")) != 0)&& (!objc_msgSend(a3, "dcProcessingWithDepthSupported")|| (int v5 = -[BWDeferredPipelineParameters dcProcessingWithDepthSupported](self, "dcProcessingWithDepthSupported")) != 0)&& (!objc_msgSend(a3, "continuousZoomWithDepthSupported")|| (int v5 = -[BWDeferredPipelineParameters continuousZoomWithDepthSupported](self, "continuousZoomWithDepthSupported")) != 0))
      {
        int v12 = [(BWDeferredPipelineParameters *)self depthDataType];
        if (v12 != [a3 depthDataType]) {
          goto LABEL_41;
        }
        int v5 = FigCaptureVideoDimensionsAreEqual(-[BWDeferredPipelineParameters depthDataDimensions](self, "depthDataDimensions"), [a3 depthDataDimensions]);
        if (v5)
        {
          if (![a3 pearlModuleType]
            || (int v5 = [(BWDeferredPipelineParameters *)self pearlModuleType]) != 0)
          {
            if ([a3 deepZoomMode])
            {
              int v13 = [(BWDeferredPipelineParameters *)self deepZoomVersion];
              if (v13 != [a3 deepZoomVersion]) {
                goto LABEL_41;
              }
              int v14 = [(BWDeferredPipelineParameters *)self deepZoomMode];
              if (v14 != [a3 deepZoomMode]) {
                goto LABEL_41;
              }
            }
            if (![a3 smartStyleRenderingVersion]) {
              goto LABEL_45;
            }
            int v15 = [(BWDeferredPipelineParameters *)self smartStyleRenderingVersion];
            if (v15 != [a3 smartStyleRenderingVersion]) {
              goto LABEL_41;
            }
            if (![a3 smartStyleReversibilityEnabled]
              || (int v5 = [(BWDeferredPipelineParameters *)self smartStyleReversibilityEnabled]) != 0)
            {
              int v5 = FigCaptureVideoDimensionsAreEqual(-[BWDeferredPipelineParameters smartStyleLinearThumbnailDimensions](self, "smartStyleLinearThumbnailDimensions"), [a3 smartStyleLinearThumbnailDimensions]);
              if (v5)
              {
                int v5 = FigCaptureVideoDimensionsAreEqual(-[BWDeferredPipelineParameters smartStyleStyledThumbnailDimensions](self, "smartStyleStyledThumbnailDimensions"), [a3 smartStyleStyledThumbnailDimensions]);
                if (v5)
                {
LABEL_45:
                  if ((![a3 generateInferencesForSemanticProcessingIfNeeded]
                     || (int v5 = -[BWDeferredPipelineParameters generateInferencesForSemanticProcessingIfNeeded](self, "generateInferencesForSemanticProcessingIfNeeded")) != 0)&& (![a3 quadraProcessingSupportEnabled]|| (int v5 = -[BWDeferredPipelineParameters quadraProcessingSupportEnabled](self, "quadraProcessingSupportEnabled")) != 0)&& (!objc_msgSend(a3, "canProcessEnhancedResolution")|| (int v5 = -[BWDeferredPipelineParameters canProcessEnhancedResolution](self, "canProcessEnhancedResolution")) != 0))
                  {
                    if (![a3 sfhrMode]
                      || (unsigned int v16 = [(BWDeferredPipelineParameters *)self sfhrMode],
                          v16 == [a3 sfhrMode]))
                    {
                      LOBYTE(v5) = 1;
                      return v5;
                    }
LABEL_41:
                    LOBYTE(v5) = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = [NSString stringWithFormat:@"rawSensorDimensions:%@", BWStringFromDimensions(*(void *)&self->_rawSensorDimensions)];
  dimensionsByQSubResolutionFlavorByPortType = self->_dimensionsByQSubResolutionFlavorByPortType;
  if (dimensionsByQSubResolutionFlavorByPortType) {
    int v5 = (__CFString *)[NSString stringWithFormat:@", dimensionsByQSubResolutionFlavorByPortType.count:%lu", -[NSDictionary count](dimensionsByQSubResolutionFlavorByPortType, "count")];
  }
  else {
    int v5 = &stru_1EFA403E0;
  }
  uint64_t v6 = [NSString stringWithFormat:@", nrfVersion:%d", self->_nrfVersion];
  uint64_t v40 = [NSString stringWithFormat:@", noiseReductionAndFusionScheme:%d", self->_noiseReductionAndFusionScheme];
  if (self->_distortionCorrectionVersion) {
    v39 = (__CFString *)[NSString stringWithFormat:@", dcProcessorVersion:%d", self->_distortionCorrectionVersion];
  }
  else {
    v39 = &stru_1EFA403E0;
  }
  BOOL intelligentDistortionCorrectionEnabled = self->_intelligentDistortionCorrectionEnabled;
  BOOL geometricDistortionCorrectionEnabled = self->_geometricDistortionCorrectionEnabled;
  BOOL dcProcessingWithDepthSupported = self->_dcProcessingWithDepthSupported;
  uint64_t v38 = [NSString stringWithFormat:@", gdcSourceMode:%d", self->_stillImageGDCSourceMode];
  if (self->_deepZoomVersion) {
    v36 = (__CFString *)[NSString stringWithFormat:@", deepZoomVersion:%d", self->_deepZoomVersion];
  }
  else {
    v36 = &stru_1EFA403E0;
  }
  if (self->_deepZoomMode) {
    uint64_t v35 = (__CFString *)[NSString stringWithFormat:@", deepZoomMode:%d", self->_deepZoomMode];
  }
  else {
    uint64_t v35 = &stru_1EFA403E0;
  }
  if (self->_semanticRenderingVersion) {
    uint64_t v34 = (__CFString *)[NSString stringWithFormat:@", semanticRenderingVersion:%d", self->_semanticRenderingVersion];
  }
  else {
    uint64_t v34 = &stru_1EFA403E0;
  }
  if (self->_smartStyleRenderingVersion) {
    uint64_t v33 = (__CFString *)[NSString stringWithFormat:@", smartStyleRenderingVersion:%d", self->_smartStyleRenderingVersion];
  }
  else {
    uint64_t v33 = &stru_1EFA403E0;
  }
  if (self->_smartStyleReversibilityEnabled) {
    v32 = (__CFString *)[NSString stringWithFormat:@", smartStyleReversibilityEnabled:%d", 1];
  }
  else {
    v32 = &stru_1EFA403E0;
  }
  BOOL generateInferencesForSemanticProcessingIfNeeded = self->_generateInferencesForSemanticProcessingIfNeeded;
  BOOL quadraProcessingSupportEnabled = self->_quadraProcessingSupportEnabled;
  BOOL canProcessEnhancedResolution = self->_canProcessEnhancedResolution;
  BOOL continuousZoomWithDepthSupported = self->_continuousZoomWithDepthSupported;
  uint64_t depthDataType = self->_depthDataType;
  if (depthDataType)
  {
    uint64_t v12 = v6;
    int v13 = v5;
    uint64_t v14 = v3;
    int v15 = NSString;
    uint64_t v27 = BWPhotoEncoderStringFromEncodingScheme(depthDataType);
    unsigned int v16 = v15;
    uint64_t v3 = v14;
    int v5 = v13;
    uint64_t v6 = v12;
    int v17 = (__CFString *)[v16 stringWithFormat:@", depthDataType:%@", v27];
  }
  else
  {
    int v17 = &stru_1EFA403E0;
  }
  v42 = v5;
  uint64_t v43 = v3;
  uint64_t v41 = v6;
  unsigned int v31 = v17;
  if (FigCaptureVideoDimensionsAreValid(*(void *)&self->_depthDataDimensions)) {
    int v28 = (__CFString *)[NSString stringWithFormat:@", depthDataDimensions:%@", BWStringFromDimensions(*(void *)&self->_depthDataDimensions)];
  }
  else {
    int v28 = &stru_1EFA403E0;
  }
  int v18 = &stru_1EFA403E0;
  if (self->_pearlModuleType) {
    int v19 = (__CFString *)[NSString stringWithFormat:@", pearlModuleType %d", self->_pearlModuleType];
  }
  else {
    int v19 = &stru_1EFA403E0;
  }
  if (continuousZoomWithDepthSupported) {
    int v20 = @", continuousZoomWithDepthSupported:1";
  }
  else {
    int v20 = &stru_1EFA403E0;
  }
  if (canProcessEnhancedResolution) {
    int v21 = @", canProcessEnhancedResolution:1";
  }
  else {
    int v21 = &stru_1EFA403E0;
  }
  if (quadraProcessingSupportEnabled) {
    int v22 = @", quadraProcessingSupportEnabled:1";
  }
  else {
    int v22 = &stru_1EFA403E0;
  }
  if (generateInferencesForSemanticProcessingIfNeeded) {
    int v23 = @", generateInferencesForSemanticProcessingIfNeeded:1";
  }
  else {
    int v23 = &stru_1EFA403E0;
  }
  if (dcProcessingWithDepthSupported) {
    int v24 = @", dcProcessingWithDepth:1";
  }
  else {
    int v24 = &stru_1EFA403E0;
  }
  if (geometricDistortionCorrectionEnabled) {
    int v25 = @", gdcEnabled:1";
  }
  else {
    int v25 = &stru_1EFA403E0;
  }
  if (intelligentDistortionCorrectionEnabled) {
    int v18 = @", idcEnabled:1";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@ %p>: %@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@", objc_opt_class(), self, v43, v42, v41, v40, v39, v18, v25, v24, v38, v36, v35, v34, v33, v32,
               v23,
               v22,
               v21,
               v20,
               v31,
               v28,
               v19);
}

- ($2825F4736939C4A6D3AD43837233062D)rawSensorDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_rawSensorDimensions;
}

- (NSDictionary)dimensionsByQSubResolutionFlavorByPortType
{
  return self->_dimensionsByQSubResolutionFlavorByPortType;
}

- (void)setDcProcessingWithDepthSupported:(BOOL)a3
{
  self->_BOOL dcProcessingWithDepthSupported = a3;
}

- (void)setStillImageGDCSourceMode:(int)a3
{
  self->_stillImageGDCSourceMode = a3;
}

- (void)setSmartStyleLinearThumbnailDimensions:(id)a3
{
  self->_smartStyleLinearThumbnailDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (void)setSmartStyleStyledThumbnailDimensions:(id)a3
{
  self->_smartStyleStyledThumbnailDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)canProcessEnhancedResolution
{
  return self->_canProcessEnhancedResolution;
}

@end