@interface FigCaptureIrisSinkConfiguration
+ (BOOL)supportsSecureCoding;
- ($2825F4736939C4A6D3AD43837233062D)maxPhotoDimensions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisMovieDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisMovieVideoFrameDuration;
- (BOOL)bravoConstituentPhotoDeliveryEnabled;
- (BOOL)constantColorClippingRecoveryEnabled;
- (BOOL)constantColorEnabled;
- (BOOL)constantColorSaturationBoostEnabled;
- (BOOL)deferredProcessingEnabled;
- (BOOL)demosaicedRawEnabled;
- (BOOL)depthDataDeliveryEnabled;
- (BOOL)digitalFlashCaptureEnabled;
- (BOOL)fastCapturePrioritizationEnabled;
- (BOOL)filterRenderingEnabled;
- (BOOL)focusPixelBlurScoreEnabled;
- (BOOL)intelligentDistortionCorrectionEnabled;
- (BOOL)irisApplyPreviewShift;
- (BOOL)irisFrameHarvestingEnabled;
- (BOOL)irisMovieCaptureEnabled;
- (BOOL)irisMovieCaptureSuspended;
- (BOOL)isEqual:(id)a3;
- (BOOL)momentCaptureMovieRecordingEnabled;
- (BOOL)optimizesImagesForOfflineVideoStabilization;
- (BOOL)portraitEffectsMatteDeliveryEnabled;
- (BOOL)preservesIrisMovieCaptureSuspendedOnSessionStop;
- (BOOL)previewQualityAdjustedPhotoFilterRenderingEnabled;
- (BOOL)quadraHighResCaptureEnabled;
- (BOOL)responsiveCaptureEnabled;
- (BOOL)semanticStyleRenderingEnabled;
- (BOOL)spatialOverCaptureEnabled;
- (BOOL)stereoPhotoCaptureEnabled;
- (BOOL)ultraHighResolutionZeroShutterLagSupportEnabled;
- (BOOL)zeroShutterLagEnabled;
- (FigCaptureIrisPreparedSettings)irisPreparedSettings;
- (FigCaptureIrisSinkConfiguration)initWithCoder:(id)a3;
- (FigCaptureIrisSinkConfiguration)initWithXPCEncoding:(id)a3;
- (NSArray)enabledSemanticSegmentationMatteURNs;
- (NSDictionary)exifFocalLengthsByZoomFactor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (id)description;
- (int)irisMovieAutoTrimMethod;
- (int)maxQualityPrioritization;
- (int)sinkType;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBravoConstituentPhotoDeliveryEnabled:(BOOL)a3;
- (void)setConstantColorClippingRecoveryEnabled:(BOOL)a3;
- (void)setConstantColorEnabled:(BOOL)a3;
- (void)setConstantColorSaturationBoostEnabled:(BOOL)a3;
- (void)setDeferredProcessingEnabled:(BOOL)a3;
- (void)setDemosaicedRawEnabled:(BOOL)a3;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setDigitalFlashCaptureEnabled:(BOOL)a3;
- (void)setEnabledSemanticSegmentationMatteURNs:(id)a3;
- (void)setExifFocalLengthsByZoomFactor:(id)a3;
- (void)setFastCapturePrioritizationEnabled:(BOOL)a3;
- (void)setFilterRenderingEnabled:(BOOL)a3;
- (void)setFocusPixelBlurScoreEnabled:(BOOL)a3;
- (void)setIntelligentDistortionCorrectionEnabled:(BOOL)a3;
- (void)setIrisApplyPreviewShift:(BOOL)a3;
- (void)setIrisFrameHarvestingEnabled:(BOOL)a3;
- (void)setIrisMovieAutoTrimMethod:(int)a3;
- (void)setIrisMovieCaptureEnabled:(BOOL)a3;
- (void)setIrisMovieCaptureSuspended:(BOOL)a3;
- (void)setIrisMovieDuration:(id *)a3;
- (void)setIrisMovieVideoFrameDuration:(id *)a3;
- (void)setIrisPreparedSettings:(id)a3;
- (void)setMaxPhotoDimensions:(id)a3;
- (void)setMaxQualityPrioritization:(int)a3;
- (void)setMomentCaptureMovieRecordingEnabled:(BOOL)a3;
- (void)setOptimizesImagesForOfflineVideoStabilization:(BOOL)a3;
- (void)setPortraitEffectsMatteDeliveryEnabled:(BOOL)a3;
- (void)setPreservesIrisMovieCaptureSuspendedOnSessionStop:(BOOL)a3;
- (void)setPreviewQualityAdjustedPhotoFilterRenderingEnabled:(BOOL)a3;
- (void)setQuadraHighResCaptureEnabled:(BOOL)a3;
- (void)setResponsiveCaptureEnabled:(BOOL)a3;
- (void)setSemanticStyleRenderingEnabled:(BOOL)a3;
- (void)setSpatialOverCaptureEnabled:(BOOL)a3;
- (void)setStereoPhotoCaptureEnabled:(BOOL)a3;
- (void)setUltraHighResolutionZeroShutterLagSupportEnabled:(BOOL)a3;
- (void)setZeroShutterLagEnabled:(BOOL)a3;
@end

@implementation FigCaptureIrisSinkConfiguration

- (int)sinkType
{
  return 10;
}

- (FigCaptureIrisPreparedSettings)irisPreparedSettings
{
  return *(FigCaptureIrisPreparedSettings **)&self->_movieAutoTrimMethod;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)FigCaptureIrisSinkConfiguration;
  id v5 = -[FigCaptureSinkConfiguration copyWithZone:](&v16, sel_copyWithZone_);
  objc_msgSend(v5, "setIrisMovieCaptureEnabled:", -[FigCaptureIrisSinkConfiguration irisMovieCaptureEnabled](self, "irisMovieCaptureEnabled"));
  objc_msgSend(v5, "setIrisMovieCaptureSuspended:", -[FigCaptureIrisSinkConfiguration irisMovieCaptureSuspended](self, "irisMovieCaptureSuspended"));
  objc_msgSend(v5, "setPreservesIrisMovieCaptureSuspendedOnSessionStop:", -[FigCaptureIrisSinkConfiguration preservesIrisMovieCaptureSuspendedOnSessionStop](self, "preservesIrisMovieCaptureSuspendedOnSessionStop"));
  if (self)
  {
    [(FigCaptureIrisSinkConfiguration *)self irisMovieDuration];
    long long v12 = v14;
    uint64_t v13 = v15;
    [v5 setIrisMovieDuration:&v12];
    [(FigCaptureIrisSinkConfiguration *)self irisMovieVideoFrameDuration];
  }
  else
  {
    long long v14 = 0uLL;
    uint64_t v15 = 0;
    uint64_t v13 = 0;
    long long v12 = 0uLL;
    [v5 setIrisMovieDuration:&v12];
    long long v10 = 0uLL;
    uint64_t v11 = 0;
  }
  long long v8 = v10;
  uint64_t v9 = v11;
  [v5 setIrisMovieVideoFrameDuration:&v8];
  objc_msgSend(v5, "setIrisMovieAutoTrimMethod:", -[FigCaptureIrisSinkConfiguration irisMovieAutoTrimMethod](self, "irisMovieAutoTrimMethod"));
  id v6 = [(FigCaptureIrisPreparedSettings *)[(FigCaptureIrisSinkConfiguration *)self irisPreparedSettings] copyWithZone:a3];
  [v5 setIrisPreparedSettings:v6];

  objc_msgSend(v5, "setOptimizesImagesForOfflineVideoStabilization:", -[FigCaptureIrisSinkConfiguration optimizesImagesForOfflineVideoStabilization](self, "optimizesImagesForOfflineVideoStabilization"));
  objc_msgSend(v5, "setQuadraHighResCaptureEnabled:", -[FigCaptureIrisSinkConfiguration quadraHighResCaptureEnabled](self, "quadraHighResCaptureEnabled"));
  objc_msgSend(v5, "setDepthDataDeliveryEnabled:", -[FigCaptureIrisSinkConfiguration depthDataDeliveryEnabled](self, "depthDataDeliveryEnabled"));
  objc_msgSend(v5, "setPortraitEffectsMatteDeliveryEnabled:", -[FigCaptureIrisSinkConfiguration portraitEffectsMatteDeliveryEnabled](self, "portraitEffectsMatteDeliveryEnabled"));
  objc_msgSend(v5, "setEnabledSemanticSegmentationMatteURNs:", -[FigCaptureIrisSinkConfiguration enabledSemanticSegmentationMatteURNs](self, "enabledSemanticSegmentationMatteURNs"));
  objc_msgSend(v5, "setFilterRenderingEnabled:", -[FigCaptureIrisSinkConfiguration filterRenderingEnabled](self, "filterRenderingEnabled"));
  objc_msgSend(v5, "setBravoConstituentPhotoDeliveryEnabled:", -[FigCaptureIrisSinkConfiguration bravoConstituentPhotoDeliveryEnabled](self, "bravoConstituentPhotoDeliveryEnabled"));
  objc_msgSend(v5, "setMomentCaptureMovieRecordingEnabled:", -[FigCaptureIrisSinkConfiguration momentCaptureMovieRecordingEnabled](self, "momentCaptureMovieRecordingEnabled"));
  objc_msgSend(v5, "setSpatialOverCaptureEnabled:", -[FigCaptureIrisSinkConfiguration spatialOverCaptureEnabled](self, "spatialOverCaptureEnabled"));
  objc_msgSend(v5, "setMaxQualityPrioritization:", -[FigCaptureIrisSinkConfiguration maxQualityPrioritization](self, "maxQualityPrioritization"));
  objc_msgSend(v5, "setDeferredProcessingEnabled:", -[FigCaptureIrisSinkConfiguration deferredProcessingEnabled](self, "deferredProcessingEnabled"));
  objc_msgSend(v5, "setDigitalFlashCaptureEnabled:", -[FigCaptureIrisSinkConfiguration digitalFlashCaptureEnabled](self, "digitalFlashCaptureEnabled"));
  objc_msgSend(v5, "setIntelligentDistortionCorrectionEnabled:", -[FigCaptureIrisSinkConfiguration intelligentDistortionCorrectionEnabled](self, "intelligentDistortionCorrectionEnabled"));
  objc_msgSend(v5, "setDemosaicedRawEnabled:", -[FigCaptureIrisSinkConfiguration demosaicedRawEnabled](self, "demosaicedRawEnabled"));
  objc_msgSend(v5, "setFocusPixelBlurScoreEnabled:", -[FigCaptureIrisSinkConfiguration focusPixelBlurScoreEnabled](self, "focusPixelBlurScoreEnabled"));
  objc_msgSend(v5, "setPreviewQualityAdjustedPhotoFilterRenderingEnabled:", -[FigCaptureIrisSinkConfiguration previewQualityAdjustedPhotoFilterRenderingEnabled](self, "previewQualityAdjustedPhotoFilterRenderingEnabled"));
  objc_msgSend(v5, "setZeroShutterLagEnabled:", -[FigCaptureIrisSinkConfiguration zeroShutterLagEnabled](self, "zeroShutterLagEnabled"));
  objc_msgSend(v5, "setUltraHighResolutionZeroShutterLagSupportEnabled:", -[FigCaptureIrisSinkConfiguration ultraHighResolutionZeroShutterLagSupportEnabled](self, "ultraHighResolutionZeroShutterLagSupportEnabled"));
  objc_msgSend(v5, "setResponsiveCaptureEnabled:", -[FigCaptureIrisSinkConfiguration responsiveCaptureEnabled](self, "responsiveCaptureEnabled"));
  objc_msgSend(v5, "setFastCapturePrioritizationEnabled:", -[FigCaptureIrisSinkConfiguration fastCapturePrioritizationEnabled](self, "fastCapturePrioritizationEnabled"));
  objc_msgSend(v5, "setSemanticStyleRenderingEnabled:", -[FigCaptureIrisSinkConfiguration semanticStyleRenderingEnabled](self, "semanticStyleRenderingEnabled"));
  objc_msgSend(v5, "setMaxPhotoDimensions:", -[FigCaptureIrisSinkConfiguration maxPhotoDimensions](self, "maxPhotoDimensions"));
  objc_msgSend(v5, "setExifFocalLengthsByZoomFactor:", -[FigCaptureIrisSinkConfiguration exifFocalLengthsByZoomFactor](self, "exifFocalLengthsByZoomFactor"));
  objc_msgSend(v5, "setConstantColorEnabled:", -[FigCaptureIrisSinkConfiguration constantColorEnabled](self, "constantColorEnabled"));
  objc_msgSend(v5, "setConstantColorClippingRecoveryEnabled:", -[FigCaptureIrisSinkConfiguration constantColorClippingRecoveryEnabled](self, "constantColorClippingRecoveryEnabled"));
  objc_msgSend(v5, "setConstantColorSaturationBoostEnabled:", -[FigCaptureIrisSinkConfiguration constantColorSaturationBoostEnabled](self, "constantColorSaturationBoostEnabled"));
  objc_msgSend(v5, "setStereoPhotoCaptureEnabled:", -[FigCaptureIrisSinkConfiguration stereoPhotoCaptureEnabled](self, "stereoPhotoCaptureEnabled"));
  return v5;
}

- (void)setIrisMovieCaptureSuspended:(BOOL)a3
{
  self->_movieCaptureSuspended = a3;
}

- (void)setPreservesIrisMovieCaptureSuspendedOnSessionStop:(BOOL)a3
{
  BYTE4(self->_exifFocalLengthsByZoomFactor) = a3;
}

- (void)setExifFocalLengthsByZoomFactor:(id)a3
{
}

- (void)setStereoPhotoCaptureEnabled:(BOOL)a3
{
  BYTE3(self->_exifFocalLengthsByZoomFactor) = a3;
}

- (void)setDemosaicedRawEnabled:(BOOL)a3
{
  self->_spatialOverCaptureEnabled = a3;
}

- (void)setZeroShutterLagEnabled:(BOOL)a3
{
  BYTE2(self->_maxQualityPrioritization) = a3;
}

- (void)setUltraHighResolutionZeroShutterLagSupportEnabled:(BOOL)a3
{
  HIBYTE(self->_maxQualityPrioritization) = a3;
}

- (void)setSpatialOverCaptureEnabled:(BOOL)a3
{
  BYTE3(self->_enabledSemanticSegmentationMatteURNs) = a3;
}

- (void)setSemanticStyleRenderingEnabled:(BOOL)a3
{
  self->_intelligentDistortionCorrectionEnabled = a3;
}

- (void)setResponsiveCaptureEnabled:(BOOL)a3
{
  self->_deferredProcessingEnabled = a3;
}

- (void)setQuadraHighResCaptureEnabled:(BOOL)a3
{
  BYTE1(self->_preparedSettings) = a3;
}

- (void)setPreviewQualityAdjustedPhotoFilterRenderingEnabled:(BOOL)a3
{
  BYTE1(self->_maxQualityPrioritization) = a3;
}

- (void)setPortraitEffectsMatteDeliveryEnabled:(BOOL)a3
{
  BYTE3(self->_preparedSettings) = a3;
}

- (void)setOptimizesImagesForOfflineVideoStabilization:(BOOL)a3
{
  LOBYTE(self->_preparedSettings) = a3;
}

- (void)setMomentCaptureMovieRecordingEnabled:(BOOL)a3
{
  BYTE2(self->_enabledSemanticSegmentationMatteURNs) = a3;
}

- (void)setMaxQualityPrioritization:(int)a3
{
  HIDWORD(self->_enabledSemanticSegmentationMatteURNs) = a3;
}

- (void)setMaxPhotoDimensions:(id)a3
{
  *($2825F4736939C4A6D3AD43837233062D *)&self->_focusPixelBlurScoreEnabled = a3;
}

- (void)setIrisPreparedSettings:(id)a3
{
}

- (void)setIrisMovieVideoFrameDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)((char *)&self->_movieDuration.epoch + 4) = *(_OWORD *)&a3->var0;
  *(void *)&self->_movieVideoFrameDuration.flags = var3;
}

- (void)setIrisMovieDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)(&self->_movieCaptureSuspended + 3) = *(_OWORD *)&a3->var0;
  *(void *)&self->_movieDuration.flags = var3;
}

- (void)setIrisMovieCaptureEnabled:(BOOL)a3
{
  self->_movieCaptureEnabled = a3;
}

- (void)setIrisMovieAutoTrimMethod:(int)a3
{
  HIDWORD(self->_movieVideoFrameDuration.epoch) = a3;
}

- (void)setIntelligentDistortionCorrectionEnabled:(BOOL)a3
{
  self->_momentCaptureMovieRecordingEnabled = a3;
}

- (void)setFocusPixelBlurScoreEnabled:(BOOL)a3
{
  LOBYTE(self->_maxQualityPrioritization) = a3;
}

- (void)setFilterRenderingEnabled:(BOOL)a3
{
  LOBYTE(self->_enabledSemanticSegmentationMatteURNs) = a3;
}

- (void)setFastCapturePrioritizationEnabled:(BOOL)a3
{
  self->_digitalFlashCaptureEnabled = a3;
}

- (void)setEnabledSemanticSegmentationMatteURNs:(id)a3
{
}

- (void)setDigitalFlashCaptureEnabled:(BOOL)a3
{
  self->_bravoConstituentPhotoDeliveryEnabled = a3;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  BYTE2(self->_preparedSettings) = a3;
}

- (void)setDeferredProcessingEnabled:(BOOL)a3
{
  self->_filterRenderingEnabled = a3;
}

- (void)setConstantColorSaturationBoostEnabled:(BOOL)a3
{
  BYTE2(self->_exifFocalLengthsByZoomFactor) = a3;
}

- (void)setConstantColorEnabled:(BOOL)a3
{
  LOBYTE(self->_exifFocalLengthsByZoomFactor) = a3;
}

- (void)setConstantColorClippingRecoveryEnabled:(BOOL)a3
{
  BYTE1(self->_exifFocalLengthsByZoomFactor) = a3;
}

- (void)setBravoConstituentPhotoDeliveryEnabled:(BOOL)a3
{
  BYTE1(self->_enabledSemanticSegmentationMatteURNs) = a3;
}

- (id)copyXPCEncoding
{
  v11.receiver = self;
  v11.super_class = (Class)FigCaptureIrisSinkConfiguration;
  id v3 = [(FigCaptureSinkConfiguration *)&v11 copyXPCEncoding];
  xpc_dictionary_set_BOOL(v3, "irisMovieCaptureEnabled", [(FigCaptureIrisSinkConfiguration *)self irisMovieCaptureEnabled]);
  xpc_dictionary_set_BOOL(v3, "irisMovieCaptureSuspended", [(FigCaptureIrisSinkConfiguration *)self irisMovieCaptureSuspended]);
  xpc_dictionary_set_BOOL(v3, "preservesIrisMovieCaptureSuspendedOnSessionStop", [(FigCaptureIrisSinkConfiguration *)self preservesIrisMovieCaptureSuspendedOnSessionStop]);
  if (self)
  {
    [(FigCaptureIrisSinkConfiguration *)self irisMovieDuration];
    FigXPCMessageSetCMTime();
    [(FigCaptureIrisSinkConfiguration *)self irisMovieVideoFrameDuration];
  }
  else
  {
    FigXPCMessageSetCMTime();
    memset(&v10[6], 0, 48);
  }
  FigXPCMessageSetCMTime();
  xpc_dictionary_set_int64(v3, "irisMovieAutoTrimMethod", [(FigCaptureIrisSinkConfiguration *)self irisMovieAutoTrimMethod]);
  v4 = *(void **)&self->_movieAutoTrimMethod;
  if (v4)
  {
    id v5 = (void *)[v4 copyXPCEncoding];
    xpc_dictionary_set_value(v3, "irisPreparedSettings", v5);
    xpc_release(v5);
  }
  xpc_dictionary_set_BOOL(v3, "irisOptimizesImagesForOfflineVideoStabilization", [(FigCaptureIrisSinkConfiguration *)self optimizesImagesForOfflineVideoStabilization]);
  xpc_dictionary_set_BOOL(v3, "irisQuadraHighResCaptureEnabled", [(FigCaptureIrisSinkConfiguration *)self quadraHighResCaptureEnabled]);
  xpc_dictionary_set_BOOL(v3, "irisDepthDataDeliveryEnabled", [(FigCaptureIrisSinkConfiguration *)self depthDataDeliveryEnabled]);
  xpc_dictionary_set_BOOL(v3, "irisPortraitEffectsMatteDeliveryEnabled", [(FigCaptureIrisSinkConfiguration *)self portraitEffectsMatteDeliveryEnabled]);
  if ([(FigCaptureIrisSinkConfiguration *)self enabledSemanticSegmentationMatteURNs])
  {
    [(FigCaptureIrisSinkConfiguration *)self enabledSemanticSegmentationMatteURNs];
    FigXPCMessageSetCFArray();
  }
  xpc_dictionary_set_BOOL(v3, "irisFilterRenderingEnabled", [(FigCaptureIrisSinkConfiguration *)self filterRenderingEnabled]);
  xpc_dictionary_set_BOOL(v3, "irisBravoConstituentPhotoDeliveryEnabled", [(FigCaptureIrisSinkConfiguration *)self bravoConstituentPhotoDeliveryEnabled]);
  xpc_dictionary_set_BOOL(v3, "momentCaptureMovieRecordingEnabled", [(FigCaptureIrisSinkConfiguration *)self momentCaptureMovieRecordingEnabled]);
  xpc_dictionary_set_BOOL(v3, "spatialOverCaptureEnabled", [(FigCaptureIrisSinkConfiguration *)self spatialOverCaptureEnabled]);
  xpc_dictionary_set_int64(v3, "maxQualityPrioritization", [(FigCaptureIrisSinkConfiguration *)self maxQualityPrioritization]);
  xpc_dictionary_set_BOOL(v3, "deferredProcessingEnabled", [(FigCaptureIrisSinkConfiguration *)self deferredProcessingEnabled]);
  xpc_dictionary_set_BOOL(v3, "digitalFlashCaptureEnabled", [(FigCaptureIrisSinkConfiguration *)self digitalFlashCaptureEnabled]);
  xpc_dictionary_set_BOOL(v3, "intelligentDistortionCorrectionEnabled", [(FigCaptureIrisSinkConfiguration *)self intelligentDistortionCorrectionEnabled]);
  xpc_dictionary_set_BOOL(v3, "demosaicedRawEnabled", [(FigCaptureIrisSinkConfiguration *)self demosaicedRawEnabled]);
  xpc_dictionary_set_BOOL(v3, "focusPixelBlurScoreEnabled", [(FigCaptureIrisSinkConfiguration *)self focusPixelBlurScoreEnabled]);
  xpc_dictionary_set_BOOL(v3, "previewQualityAdjustedPhotoFilterRenderingEnabled", [(FigCaptureIrisSinkConfiguration *)self previewQualityAdjustedPhotoFilterRenderingEnabled]);
  xpc_dictionary_set_BOOL(v3, "zeroShutterLagEnabled", [(FigCaptureIrisSinkConfiguration *)self zeroShutterLagEnabled]);
  xpc_dictionary_set_BOOL(v3, "ultraHighResolutionZeroShutterLagSupportEnabled", [(FigCaptureIrisSinkConfiguration *)self ultraHighResolutionZeroShutterLagSupportEnabled]);
  xpc_dictionary_set_BOOL(v3, "responsiveCaptureEnabled", [(FigCaptureIrisSinkConfiguration *)self responsiveCaptureEnabled]);
  xpc_dictionary_set_BOOL(v3, "fastCapturePrioritizationEnabled", [(FigCaptureIrisSinkConfiguration *)self fastCapturePrioritizationEnabled]);
  xpc_dictionary_set_BOOL(v3, "semanticStyleRenderingEnabled", [(FigCaptureIrisSinkConfiguration *)self semanticStyleRenderingEnabled]);
  xpc_dictionary_set_int64(v3, "maxPhotoWidth", *(int *)&self->_focusPixelBlurScoreEnabled);
  xpc_dictionary_set_int64(v3, "maxPhotoHeight", *(int *)&self->_responsiveCaptureEnabled);
  xpc_dictionary_set_BOOL(v3, "constantColorEnabled", (BOOL)self->_exifFocalLengthsByZoomFactor);
  xpc_dictionary_set_BOOL(v3, "constantColorClippingRecoveryEnabled", BYTE1(self->_exifFocalLengthsByZoomFactor));
  xpc_dictionary_set_BOOL(v3, "constantColorSaturationBoostEnabled", BYTE2(self->_exifFocalLengthsByZoomFactor));
  xpc_dictionary_set_BOOL(v3, "stereoPhotoCaptureEnabled", BYTE3(self->_exifFocalLengthsByZoomFactor));
  if (*(void *)&self->_maxPhotoDimensions.height)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v8 = *(void **)&self->_maxPhotoDimensions.height;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__FigCaptureIrisSinkConfiguration_copyXPCEncoding__block_invoke;
    v10[3] = &unk_1E5C29570;
    v10[4] = v6;
    v10[5] = v7;
    [v8 enumerateKeysAndObjectsUsingBlock:v10];
    FigXPCMessageSetCFArray();
    FigXPCMessageSetCFArray();
  }
  return v3;
}

- (id)description
{
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  if (self) {
    [(FigCaptureIrisSinkConfiguration *)self irisMovieVideoFrameDuration];
  }
  if ([*(id *)&self->_optimizesImagesForOfflineVideoStabilization count]) {
    v37 = (__CFString *)[NSString stringWithFormat:@", (SegMattes: %d)", objc_msgSend(*(id *)&self->_optimizesImagesForOfflineVideoStabilization, "count")];
  }
  else {
    v37 = &stru_1EFA403E0;
  }
  BOOL filterRenderingEnabled = self->_filterRenderingEnabled;
  BOOL bravoConstituentPhotoDeliveryEnabled = self->_bravoConstituentPhotoDeliveryEnabled;
  BOOL momentCaptureMovieRecordingEnabled = self->_momentCaptureMovieRecordingEnabled;
  BOOL spatialOverCaptureEnabled = self->_spatialOverCaptureEnabled;
  BOOL intelligentDistortionCorrectionEnabled = self->_intelligentDistortionCorrectionEnabled;
  uint64_t v36 = [NSString stringWithFormat:@", (maxPhotoDims %dx%d)", *(unsigned int *)&self->_focusPixelBlurScoreEnabled, *(unsigned int *)&self->_responsiveCaptureEnabled];
  int maxQualityPrioritization_low = LOBYTE(self->_maxQualityPrioritization);
  if (LOBYTE(self->_exifFocalLengthsByZoomFactor))
  {
    if (BYTE1(self->_exifFocalLengthsByZoomFactor)) {
      uint64_t v9 = @"(clippingRecovery ON)";
    }
    else {
      uint64_t v9 = &stru_1EFA403E0;
    }
    if (BYTE2(self->_exifFocalLengthsByZoomFactor)) {
      long long v10 = @"(saturationBoost ON)";
    }
    else {
      long long v10 = &stru_1EFA403E0;
    }
    v32 = (__CFString *)[NSString stringWithFormat:@", (constantColor ON %@%@)", v9, v10];
  }
  else
  {
    v32 = &stru_1EFA403E0;
  }
  v35 = NSString;
  v39.receiver = self;
  v39.super_class = (Class)FigCaptureIrisSinkConfiguration;
  v34 = [(FigCaptureSinkConfiguration *)&v39 description];
  BOOL v33 = [(FigCaptureIrisSinkConfiguration *)self irisMovieCaptureEnabled];
  BOOL v31 = [(FigCaptureIrisSinkConfiguration *)self irisMovieCaptureSuspended];
  BOOL v30 = [(FigCaptureIrisSinkConfiguration *)self preservesIrisMovieCaptureSuspendedOnSessionStop];
  [(FigCaptureIrisSinkConfiguration *)self irisMovieDuration];
  Float64 Seconds = CMTimeGetSeconds(&time);
  uint64_t v29 = [(FigCaptureIrisSinkConfiguration *)self irisMovieAutoTrimMethod];
  if (v40) {
    uint64_t v12 = (int)v41 / v40;
  }
  else {
    uint64_t v12 = 0;
  }
  if (maxQualityPrioritization_low) {
    uint64_t v13 = @", (BlurScore ON)";
  }
  else {
    uint64_t v13 = &stru_1EFA403E0;
  }
  if (intelligentDistortionCorrectionEnabled) {
    long long v14 = @", (SemStyles ON)";
  }
  else {
    long long v14 = &stru_1EFA403E0;
  }
  if (spatialOverCaptureEnabled) {
    uint64_t v15 = @", (DemRaw ON)";
  }
  else {
    uint64_t v15 = &stru_1EFA403E0;
  }
  if (momentCaptureMovieRecordingEnabled) {
    objc_super v16 = @", (IDC ON)";
  }
  else {
    objc_super v16 = &stru_1EFA403E0;
  }
  if (bravoConstituentPhotoDeliveryEnabled) {
    v17 = @", (DigitalFlash ON)";
  }
  else {
    v17 = &stru_1EFA403E0;
  }
  if (filterRenderingEnabled) {
    v18 = @", (DeferredProcessing ON)";
  }
  else {
    v18 = &stru_1EFA403E0;
  }
  int64_t v19 = [(FigCaptureIrisPreparedSettings *)[(FigCaptureIrisSinkConfiguration *)self irisPreparedSettings] settingsID];
  BOOL v20 = [(FigCaptureIrisSinkConfiguration *)self optimizesImagesForOfflineVideoStabilization];
  v21 = @", optimizesImagesForOfflineVideoStabilization:1";
  if (!v20) {
    v21 = &stru_1EFA403E0;
  }
  if (BYTE1(self->_preparedSettings)) {
    v22 = @", (QHR ON)";
  }
  else {
    v22 = &stru_1EFA403E0;
  }
  if (BYTE2(self->_preparedSettings)) {
    v23 = @", (depth ON)";
  }
  else {
    v23 = &stru_1EFA403E0;
  }
  if (BYTE3(self->_preparedSettings)) {
    v24 = @", (portraitMatte ON)";
  }
  else {
    v24 = &stru_1EFA403E0;
  }
  if (LOBYTE(self->_enabledSemanticSegmentationMatteURNs)) {
    v25 = @", (filters ON)";
  }
  else {
    v25 = &stru_1EFA403E0;
  }
  if (BYTE1(self->_enabledSemanticSegmentationMatteURNs)) {
    v26 = @", (constituentPhoto ON)";
  }
  else {
    v26 = &stru_1EFA403E0;
  }
  v27 = (__CFString *)v36;
  if (!v36) {
    v27 = &stru_1EFA403E0;
  }
  return (id)objc_msgSend(v35, "stringWithFormat:", @"%@ movies:%d, suspended:%d, preserveSuspended:%d, movieDur:%.2fs, trim:%d, %lldfps, preparedID:%lld%@%@%@%@%@%@%@ maxQuality:%d%@%@%@%@%@%@%@%@", v34, v33, v31, v30, *(void *)&Seconds, v29, v12, v19, v21, v22, v23, v24, v37, v25, v26, HIDWORD(self->_enabledSemanticSegmentationMatteURNs),
               v18,
               v17,
               v16,
               v15,
               v14,
               v27,
               v13,
               v32);
}

- (BOOL)isEqual:(id)a3
{
  v44.receiver = self;
  v44.super_class = (Class)FigCaptureIrisSinkConfiguration;
  unsigned int v5 = -[FigCaptureSinkConfiguration isEqual:](&v44, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_27;
    }
    int v6 = [(FigCaptureIrisSinkConfiguration *)self irisMovieCaptureEnabled];
    if (v6 != [a3 irisMovieCaptureEnabled]) {
      goto LABEL_27;
    }
    int v7 = [(FigCaptureIrisSinkConfiguration *)self irisMovieCaptureSuspended];
    if (v7 != [a3 irisMovieCaptureSuspended]) {
      goto LABEL_27;
    }
    int v8 = [(FigCaptureIrisSinkConfiguration *)self preservesIrisMovieCaptureSuspendedOnSessionStop];
    if (v8 != [a3 preservesIrisMovieCaptureSuspendedOnSessionStop]) {
      goto LABEL_27;
    }
    if (self) {
      [(FigCaptureIrisSinkConfiguration *)self irisMovieDuration];
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    if (a3) {
      [a3 irisMovieDuration];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    if (CMTimeCompare(&time1, &time2)) {
      goto LABEL_27;
    }
    if (self) {
      [(FigCaptureIrisSinkConfiguration *)self irisMovieVideoFrameDuration];
    }
    else {
      memset(&v41, 0, sizeof(v41));
    }
    if (a3) {
      [a3 irisMovieVideoFrameDuration];
    }
    else {
      memset(&v40, 0, sizeof(v40));
    }
    if (CMTimeCompare(&v41, &v40)) {
      goto LABEL_27;
    }
    int v9 = [(FigCaptureIrisSinkConfiguration *)self irisMovieAutoTrimMethod];
    if (v9 != [a3 irisMovieAutoTrimMethod]) {
      goto LABEL_27;
    }
    long long v10 = [(FigCaptureIrisSinkConfiguration *)self irisPreparedSettings];
    if (v10 == (FigCaptureIrisPreparedSettings *)[a3 irisPreparedSettings]
      || (unsigned int v5 = -[FigCaptureIrisPreparedSettings isEqual:](-[FigCaptureIrisSinkConfiguration irisPreparedSettings](self, "irisPreparedSettings"), "isEqual:", [a3 irisPreparedSettings])) != 0)
    {
      int v11 = [(FigCaptureIrisSinkConfiguration *)self optimizesImagesForOfflineVideoStabilization];
      if (v11 == [a3 optimizesImagesForOfflineVideoStabilization])
      {
        int v12 = [(FigCaptureIrisSinkConfiguration *)self quadraHighResCaptureEnabled];
        if (v12 == [a3 quadraHighResCaptureEnabled])
        {
          int v13 = [(FigCaptureIrisSinkConfiguration *)self depthDataDeliveryEnabled];
          if (v13 == [a3 depthDataDeliveryEnabled])
          {
            int v14 = [(FigCaptureIrisSinkConfiguration *)self portraitEffectsMatteDeliveryEnabled];
            if (v14 == [a3 portraitEffectsMatteDeliveryEnabled])
            {
              uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[FigCaptureIrisSinkConfiguration enabledSemanticSegmentationMatteURNs](self, "enabledSemanticSegmentationMatteURNs"));
              unsigned int v5 = objc_msgSend(v15, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "enabledSemanticSegmentationMatteURNs")));
              if (!v5) {
                return v5;
              }
              int v16 = [(FigCaptureIrisSinkConfiguration *)self filterRenderingEnabled];
              if (v16 == [a3 filterRenderingEnabled])
              {
                int v17 = [(FigCaptureIrisSinkConfiguration *)self bravoConstituentPhotoDeliveryEnabled];
                if (v17 == [a3 bravoConstituentPhotoDeliveryEnabled])
                {
                  int v18 = [(FigCaptureIrisSinkConfiguration *)self momentCaptureMovieRecordingEnabled];
                  if (v18 == [a3 momentCaptureMovieRecordingEnabled])
                  {
                    int v19 = [(FigCaptureIrisSinkConfiguration *)self spatialOverCaptureEnabled];
                    if (v19 == [a3 spatialOverCaptureEnabled])
                    {
                      int v20 = [(FigCaptureIrisSinkConfiguration *)self maxQualityPrioritization];
                      if (v20 == [a3 maxQualityPrioritization])
                      {
                        int v21 = [(FigCaptureIrisSinkConfiguration *)self deferredProcessingEnabled];
                        if (v21 == [a3 deferredProcessingEnabled])
                        {
                          int v22 = [(FigCaptureIrisSinkConfiguration *)self digitalFlashCaptureEnabled];
                          if (v22 == [a3 digitalFlashCaptureEnabled])
                          {
                            int v23 = [(FigCaptureIrisSinkConfiguration *)self intelligentDistortionCorrectionEnabled];
                            if (v23 == [a3 intelligentDistortionCorrectionEnabled])
                            {
                              int v24 = [(FigCaptureIrisSinkConfiguration *)self demosaicedRawEnabled];
                              if (v24 == [a3 demosaicedRawEnabled])
                              {
                                int v25 = [(FigCaptureIrisSinkConfiguration *)self focusPixelBlurScoreEnabled];
                                if (v25 == [a3 focusPixelBlurScoreEnabled])
                                {
                                  int v26 = [(FigCaptureIrisSinkConfiguration *)self previewQualityAdjustedPhotoFilterRenderingEnabled];
                                  if (v26 == [a3 previewQualityAdjustedPhotoFilterRenderingEnabled])
                                  {
                                    int v27 = [(FigCaptureIrisSinkConfiguration *)self zeroShutterLagEnabled];
                                    if (v27 == [a3 zeroShutterLagEnabled])
                                    {
                                      int v28 = [(FigCaptureIrisSinkConfiguration *)self ultraHighResolutionZeroShutterLagSupportEnabled];
                                      if (v28 == [a3 ultraHighResolutionZeroShutterLagSupportEnabled])
                                      {
                                        int v29 = [(FigCaptureIrisSinkConfiguration *)self responsiveCaptureEnabled];
                                        if (v29 == [a3 responsiveCaptureEnabled])
                                        {
                                          int v30 = [(FigCaptureIrisSinkConfiguration *)self fastCapturePrioritizationEnabled];
                                          if (v30 == [a3 fastCapturePrioritizationEnabled])
                                          {
                                            int v31 = [(FigCaptureIrisSinkConfiguration *)self semanticStyleRenderingEnabled];
                                            if (v31 == [a3 semanticStyleRenderingEnabled])
                                            {
                                              int v32 = (int)[(FigCaptureIrisSinkConfiguration *)self maxPhotoDimensions];
                                              if (v32 == [a3 maxPhotoDimensions])
                                              {
                                                unint64_t v33 = (unint64_t)[(FigCaptureIrisSinkConfiguration *)self maxPhotoDimensions] >> 32;
                                                if (v33 == (unint64_t)[a3 maxPhotoDimensions] >> 32)
                                                {
                                                  v34 = [(FigCaptureIrisSinkConfiguration *)self exifFocalLengthsByZoomFactor];
                                                  if (v34 == (NSDictionary *)[a3 exifFocalLengthsByZoomFactor])
                                                  {
                                                    int v35 = [(FigCaptureIrisSinkConfiguration *)self constantColorEnabled];
                                                    if (v35 == [a3 constantColorEnabled])
                                                    {
                                                      int v36 = [(FigCaptureIrisSinkConfiguration *)self constantColorClippingRecoveryEnabled];
                                                      if (v36 == [a3 constantColorClippingRecoveryEnabled])
                                                      {
                                                        int v37 = [(FigCaptureIrisSinkConfiguration *)self constantColorSaturationBoostEnabled];
                                                        if (v37 == [a3 constantColorSaturationBoostEnabled])
                                                        {
                                                          BOOL v38 = [(FigCaptureIrisSinkConfiguration *)self stereoPhotoCaptureEnabled];
                                                          LOBYTE(v5) = v38 ^ [a3 stereoPhotoCaptureEnabled] ^ 1;
                                                          return v5;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
LABEL_27:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- ($2825F4736939C4A6D3AD43837233062D)maxPhotoDimensions
{
  return *($2825F4736939C4A6D3AD43837233062D *)&self->_focusPixelBlurScoreEnabled;
}

- (BOOL)optimizesImagesForOfflineVideoStabilization
{
  return (BOOL)self->_preparedSettings;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisMovieVideoFrameDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self[1].var3 + 4);
  retstr->int64_t var3 = *(void *)&self[2].var2;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)irisMovieDuration
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)((char *)&self->var3 + 4);
  retstr->int64_t var3 = *(void *)&self[1].var2;
  return self;
}

- (BOOL)irisMovieCaptureSuspended
{
  return self->_movieCaptureSuspended;
}

- (int)irisMovieAutoTrimMethod
{
  return HIDWORD(self->_movieVideoFrameDuration.epoch);
}

- (BOOL)preservesIrisMovieCaptureSuspendedOnSessionStop
{
  return BYTE4(self->_exifFocalLengthsByZoomFactor);
}

- (BOOL)irisMovieCaptureEnabled
{
  return self->_movieCaptureEnabled;
}

- (BOOL)digitalFlashCaptureEnabled
{
  return self->_bravoConstituentPhotoDeliveryEnabled;
}

- (int)maxQualityPrioritization
{
  return HIDWORD(self->_enabledSemanticSegmentationMatteURNs);
}

- (BOOL)depthDataDeliveryEnabled
{
  return BYTE2(self->_preparedSettings);
}

- (BOOL)bravoConstituentPhotoDeliveryEnabled
{
  return BYTE1(self->_enabledSemanticSegmentationMatteURNs);
}

- (BOOL)momentCaptureMovieRecordingEnabled
{
  return BYTE2(self->_enabledSemanticSegmentationMatteURNs);
}

- (BOOL)filterRenderingEnabled
{
  return (BOOL)self->_enabledSemanticSegmentationMatteURNs;
}

- (BOOL)focusPixelBlurScoreEnabled
{
  return self->_maxQualityPrioritization;
}

- (NSArray)enabledSemanticSegmentationMatteURNs
{
  return *(NSArray **)&self->_optimizesImagesForOfflineVideoStabilization;
}

- (BOOL)deferredProcessingEnabled
{
  return self->_filterRenderingEnabled;
}

- (BOOL)previewQualityAdjustedPhotoFilterRenderingEnabled
{
  return BYTE1(self->_maxQualityPrioritization);
}

- (BOOL)portraitEffectsMatteDeliveryEnabled
{
  return BYTE3(self->_preparedSettings);
}

- (BOOL)demosaicedRawEnabled
{
  return self->_spatialOverCaptureEnabled;
}

- (BOOL)semanticStyleRenderingEnabled
{
  return self->_intelligentDistortionCorrectionEnabled;
}

- (BOOL)zeroShutterLagEnabled
{
  return BYTE2(self->_maxQualityPrioritization);
}

- (BOOL)ultraHighResolutionZeroShutterLagSupportEnabled
{
  return HIBYTE(self->_maxQualityPrioritization);
}

- (BOOL)spatialOverCaptureEnabled
{
  return BYTE3(self->_enabledSemanticSegmentationMatteURNs);
}

- (BOOL)responsiveCaptureEnabled
{
  return self->_deferredProcessingEnabled;
}

- (BOOL)intelligentDistortionCorrectionEnabled
{
  return self->_momentCaptureMovieRecordingEnabled;
}

- (BOOL)fastCapturePrioritizationEnabled
{
  return self->_digitalFlashCaptureEnabled;
}

- (BOOL)quadraHighResCaptureEnabled
{
  return BYTE1(self->_preparedSettings);
}

- (NSDictionary)exifFocalLengthsByZoomFactor
{
  return *(NSDictionary **)&self->_maxPhotoDimensions.height;
}

- (BOOL)constantColorEnabled
{
  return (BOOL)self->_exifFocalLengthsByZoomFactor;
}

- (BOOL)stereoPhotoCaptureEnabled
{
  return BYTE3(self->_exifFocalLengthsByZoomFactor);
}

- (BOOL)constantColorSaturationBoostEnabled
{
  return BYTE2(self->_exifFocalLengthsByZoomFactor);
}

- (BOOL)constantColorClippingRecoveryEnabled
{
  return BYTE1(self->_exifFocalLengthsByZoomFactor);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureIrisSinkConfiguration;
  [(FigCaptureSinkConfiguration *)&v3 dealloc];
}

- (BOOL)irisApplyPreviewShift
{
  return self->_movieCaptureEnabled;
}

uint64_t __50__FigCaptureIrisSinkConfiguration_copyXPCEncoding__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) addObject:a2];
  unsigned int v5 = *(void **)(a1 + 40);
  return [v5 addObject:a3];
}

- (BOOL)irisFrameHarvestingEnabled
{
  return self->_movieCaptureEnabled;
}

- (FigCaptureIrisSinkConfiguration)initWithXPCEncoding:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureIrisSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithXPCEncoding:](&v7, sel_initWithXPCEncoding_);
  if (v4)
  {
    v4->_movieCaptureEnabled = xpc_dictionary_get_BOOL(a3, "irisMovieCaptureEnabled");
    v4->_movieCaptureSuspended = xpc_dictionary_get_BOOL(a3, "irisMovieCaptureSuspended");
    BYTE4(v4->_exifFocalLengthsByZoomFactor) = xpc_dictionary_get_BOOL(a3, "preservesIrisMovieCaptureSuspendedOnSessionStop");
    FigXPCMessageGetCMTime();
    FigXPCMessageGetCMTime();
    HIDWORD(v4->_movieVideoFrameDuration.epoch) = xpc_dictionary_get_int64(a3, "irisMovieAutoTrimMethod");
    xpc_object_t value = xpc_dictionary_get_value(a3, "irisPreparedSettings");
    if (value) {
      *(void *)&v4->_movieAutoTrimMethod = [[FigCaptureIrisPreparedSettings alloc] initWithXPCEncoding:value];
    }
    LOBYTE(v4->_preparedSettings) = xpc_dictionary_get_BOOL(a3, "irisOptimizesImagesForOfflineVideoStabilization");
    BYTE1(v4->_preparedSettings) = xpc_dictionary_get_BOOL(a3, "irisQuadraHighResCaptureEnabled");
    BYTE2(v4->_preparedSettings) = xpc_dictionary_get_BOOL(a3, "irisDepthDataDeliveryEnabled");
    BYTE3(v4->_preparedSettings) = xpc_dictionary_get_BOOL(a3, "irisPortraitEffectsMatteDeliveryEnabled");
    FigXPCMessageCopyCFArray();
    LOBYTE(v4->_enabledSemanticSegmentationMatteURNs) = xpc_dictionary_get_BOOL(a3, "irisFilterRenderingEnabled");
    BYTE1(v4->_enabledSemanticSegmentationMatteURNs) = xpc_dictionary_get_BOOL(a3, "irisBravoConstituentPhotoDeliveryEnabled");
    BYTE2(v4->_enabledSemanticSegmentationMatteURNs) = xpc_dictionary_get_BOOL(a3, "momentCaptureMovieRecordingEnabled");
    BYTE3(v4->_enabledSemanticSegmentationMatteURNs) = xpc_dictionary_get_BOOL(a3, "spatialOverCaptureEnabled");
    HIDWORD(v4->_enabledSemanticSegmentationMatteURNs) = xpc_dictionary_get_int64(a3, "maxQualityPrioritization");
    v4->_BOOL filterRenderingEnabled = xpc_dictionary_get_BOOL(a3, "deferredProcessingEnabled");
    v4->_BOOL bravoConstituentPhotoDeliveryEnabled = xpc_dictionary_get_BOOL(a3, "digitalFlashCaptureEnabled");
    v4->_BOOL momentCaptureMovieRecordingEnabled = xpc_dictionary_get_BOOL(a3, "intelligentDistortionCorrectionEnabled");
    v4->_BOOL spatialOverCaptureEnabled = xpc_dictionary_get_BOOL(a3, "demosaicedRawEnabled");
    LOBYTE(v4->_maxQualityPrioritization) = xpc_dictionary_get_BOOL(a3, "focusPixelBlurScoreEnabled");
    BYTE1(v4->_maxQualityPrioritization) = xpc_dictionary_get_BOOL(a3, "previewQualityAdjustedPhotoFilterRenderingEnabled");
    BYTE2(v4->_maxQualityPrioritization) = xpc_dictionary_get_BOOL(a3, "zeroShutterLagEnabled");
    HIBYTE(v4->_maxQualityPrioritization) = xpc_dictionary_get_BOOL(a3, "ultraHighResolutionZeroShutterLagSupportEnabled");
    v4->_deferredProcessingEnabled = xpc_dictionary_get_BOOL(a3, "responsiveCaptureEnabled");
    v4->_digitalFlashCaptureEnabled = xpc_dictionary_get_BOOL(a3, "fastCapturePrioritizationEnabled");
    v4->_BOOL intelligentDistortionCorrectionEnabled = xpc_dictionary_get_BOOL(a3, "semanticStyleRenderingEnabled");
    *(_DWORD *)&v4->_focusPixelBlurScoreEnabled = xpc_dictionary_get_int64(a3, "maxPhotoWidth");
    *(_DWORD *)&v4->_responsiveCaptureEnabled = xpc_dictionary_get_int64(a3, "maxPhotoHeight");
    FigXPCMessageCopyCFArray();
    FigXPCMessageCopyCFArray();
    LOBYTE(v4->_exifFocalLengthsByZoomFactor) = xpc_dictionary_get_BOOL(a3, "constantColorEnabled");
    BYTE1(v4->_exifFocalLengthsByZoomFactor) = xpc_dictionary_get_BOOL(a3, "constantColorClippingRecoveryEnabled");
    BYTE2(v4->_exifFocalLengthsByZoomFactor) = xpc_dictionary_get_BOOL(a3, "constantColorSaturationBoostEnabled");
    BYTE3(v4->_exifFocalLengthsByZoomFactor) = xpc_dictionary_get_BOOL(a3, "stereoPhotoCaptureEnabled");
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureIrisSinkConfiguration)initWithCoder:(id)a3
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)FigCaptureIrisSinkConfiguration;
  v4 = -[FigCaptureSinkConfiguration initWithCoder:](&v16, sel_initWithCoder_);
  if (v4)
  {
    v4[16] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "irisMovieCaptureEnabled"));
    unsigned int v5 = (void *)MEMORY[0x1E4F1CAD0];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    uint64_t v6 = objc_msgSend(v5, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 3));
    CMTimeMakeFromDictionary(&v15, (CFDictionaryRef)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "irisMovieDuration")));
    long long v7 = *(_OWORD *)&v15.value;
    *(void *)(v4 + 36) = v15.epoch;
    *(_OWORD *)(v4 + 20) = v7;
    int v8 = (void *)MEMORY[0x1E4F1CAD0];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    v18[2] = objc_opt_class();
    uint64_t v9 = objc_msgSend(v8, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 3));
    CMTimeMakeFromDictionary(&v15, (CFDictionaryRef)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v9, objc_msgSend(NSString, "stringWithUTF8String:", "irisMovieVideoFrameDuration")));
    long long v10 = *(_OWORD *)&v15.value;
    *(void *)(v4 + 60) = v15.epoch;
    *(_OWORD *)(v4 + 44) = v10;
    *((_DWORD *)v4 + 17) = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "irisMovieAutoTrimMethod"));
    *((void *)v4 + 9) = (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), objc_msgSend(NSString, "stringWithUTF8String:", "irisPreparedSettings"));
    v4[80] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "irisOptimizesImagesForOfflineVideoStabilization"));
    v4[81] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "irisQuadraHighResCaptureEnabled"));
    v4[82] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "irisDepthDataDeliveryEnabled"));
    v4[83] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "irisPortraitEffectsMatteDeliveryEnabled"));
    int v11 = (void *)MEMORY[0x1E4F1CAD0];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    uint64_t v12 = objc_msgSend(v11, "setWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 2));
    *((void *)v4 + 11) = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "enabledSemanticSegmentationMatteURNs"));
    v4[96] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "irisFilterRenderingEnabled"));
    v4[97] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "irisBravoConstituentPhotoDeliveryEnabled"));
    v4[98] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "momentCaptureMovieRecordingEnabled"));
    v4[99] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "spatialOverCaptureEnabled"));
    *((_DWORD *)v4 + 25) = objc_msgSend(a3, "decodeInt32ForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "maxQualityPrioritization"));
    v4[104] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "deferredProcessingEnabled"));
    v4[105] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "digitalFlashCaptureEnabled"));
    v4[106] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "intelligentDistortionCorrectionEnabled"));
    v4[107] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "demosaicedRawEnabled"));
    v4[108] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "focusPixelBlurScoreEnabled"));
    v4[109] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "previewQualityAdjustedPhotoFilterRenderingEnabled"));
    v4[110] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "zeroShutterLagEnabled"));
    v4[111] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "ultraHighResolutionZeroShutterLagSupportEnabled"));
    v4[112] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "responsiveCaptureEnabled"));
    v4[113] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "fastCapturePrioritizationEnabled"));
    v4[114] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "semanticStyleRenderingEnabled"));
    *((_DWORD *)v4 + 29) = objc_msgSend(a3, "decodeIntForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "maxPhotoWidth"));
    *((_DWORD *)v4 + 30) = objc_msgSend(a3, "decodeIntForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "maxPhotoHeight"));
    uint64_t v13 = objc_opt_class();
    *((void *)v4 + 16) = (id)objc_msgSend(a3, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v13, objc_opt_class(), objc_msgSend(NSString, "stringWithUTF8String:", "exifFocalLengthsByZoomFactor"));
    v4[136] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "constantColorEnabled"));
    v4[137] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "constantColorClippingRecoveryEnabled"));
    v4[138] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "constantColorSaturationBoostEnabled"));
    v4[139] = objc_msgSend(a3, "decodeBoolForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "stereoPhotoCaptureEnabled"));
  }
  return (FigCaptureIrisSinkConfiguration *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureIrisSinkConfiguration;
  -[FigCaptureSinkConfiguration encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeBool:forKey:", self->_movieCaptureEnabled, objc_msgSend(NSString, "stringWithUTF8String:", "irisMovieCaptureEnabled"));
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  *(_OWORD *)&v6.xpc_object_t value = *(_OWORD *)(&self->_movieCaptureSuspended + 3);
  v6.epoch = *(void *)&self->_movieDuration.flags;
  objc_msgSend(a3, "encodeObject:forKey:", CMTimeCopyAsDictionary(&v6, v5), objc_msgSend(NSString, "stringWithUTF8String:", "irisMovieDuration"));
  *(_OWORD *)&v6.xpc_object_t value = *(_OWORD *)((char *)&self->_movieDuration.epoch + 4);
  v6.epoch = *(void *)&self->_movieVideoFrameDuration.flags;
  objc_msgSend(a3, "encodeObject:forKey:", CMTimeCopyAsDictionary(&v6, v5), objc_msgSend(NSString, "stringWithUTF8String:", "irisMovieVideoFrameDuration"));
  objc_msgSend(a3, "encodeInt32:forKey:", HIDWORD(self->_movieVideoFrameDuration.epoch), objc_msgSend(NSString, "stringWithUTF8String:", "irisMovieAutoTrimMethod"));
  objc_msgSend(a3, "encodeObject:forKey:", *(void *)&self->_movieAutoTrimMethod, objc_msgSend(NSString, "stringWithUTF8String:", "irisPreparedSettings"));
  objc_msgSend(a3, "encodeBool:forKey:", LOBYTE(self->_preparedSettings), objc_msgSend(NSString, "stringWithUTF8String:", "irisOptimizesImagesForOfflineVideoStabilization"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE1(self->_preparedSettings), objc_msgSend(NSString, "stringWithUTF8String:", "irisQuadraHighResCaptureEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE2(self->_preparedSettings), objc_msgSend(NSString, "stringWithUTF8String:", "irisDepthDataDeliveryEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE3(self->_preparedSettings), objc_msgSend(NSString, "stringWithUTF8String:", "irisPortraitEffectsMatteDeliveryEnabled"));
  objc_msgSend(a3, "encodeObject:forKey:", *(void *)&self->_optimizesImagesForOfflineVideoStabilization, objc_msgSend(NSString, "stringWithUTF8String:", "enabledSemanticSegmentationMatteURNs"));
  objc_msgSend(a3, "encodeBool:forKey:", LOBYTE(self->_enabledSemanticSegmentationMatteURNs), objc_msgSend(NSString, "stringWithUTF8String:", "irisFilterRenderingEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE1(self->_enabledSemanticSegmentationMatteURNs), objc_msgSend(NSString, "stringWithUTF8String:", "irisBravoConstituentPhotoDeliveryEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE2(self->_enabledSemanticSegmentationMatteURNs), objc_msgSend(NSString, "stringWithUTF8String:", "momentCaptureMovieRecordingEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE3(self->_enabledSemanticSegmentationMatteURNs), objc_msgSend(NSString, "stringWithUTF8String:", "spatialOverCaptureEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", HIDWORD(self->_enabledSemanticSegmentationMatteURNs), objc_msgSend(NSString, "stringWithUTF8String:", "maxQualityPrioritization"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_filterRenderingEnabled, objc_msgSend(NSString, "stringWithUTF8String:", "deferredProcessingEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_bravoConstituentPhotoDeliveryEnabled, objc_msgSend(NSString, "stringWithUTF8String:", "digitalFlashCaptureEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_momentCaptureMovieRecordingEnabled, objc_msgSend(NSString, "stringWithUTF8String:", "intelligentDistortionCorrectionEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_spatialOverCaptureEnabled, objc_msgSend(NSString, "stringWithUTF8String:", "demosaicedRawEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", LOBYTE(self->_maxQualityPrioritization), objc_msgSend(NSString, "stringWithUTF8String:", "focusPixelBlurScoreEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE1(self->_maxQualityPrioritization), objc_msgSend(NSString, "stringWithUTF8String:", "previewQualityAdjustedPhotoFilterRenderingEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE2(self->_maxQualityPrioritization), objc_msgSend(NSString, "stringWithUTF8String:", "zeroShutterLagEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", HIBYTE(self->_maxQualityPrioritization), objc_msgSend(NSString, "stringWithUTF8String:", "ultraHighResolutionZeroShutterLagSupportEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_deferredProcessingEnabled, objc_msgSend(NSString, "stringWithUTF8String:", "responsiveCaptureEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_digitalFlashCaptureEnabled, objc_msgSend(NSString, "stringWithUTF8String:", "fastCapturePrioritizationEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_intelligentDistortionCorrectionEnabled, objc_msgSend(NSString, "stringWithUTF8String:", "semanticStyleRenderingEnabled"));
  objc_msgSend(a3, "encodeInt32:forKey:", *(unsigned int *)&self->_focusPixelBlurScoreEnabled, objc_msgSend(NSString, "stringWithUTF8String:", "maxPhotoWidth"));
  objc_msgSend(a3, "encodeInt32:forKey:", *(unsigned int *)&self->_responsiveCaptureEnabled, objc_msgSend(NSString, "stringWithUTF8String:", "maxPhotoHeight"));
  objc_msgSend(a3, "encodeObject:forKey:", *(void *)&self->_maxPhotoDimensions.height, objc_msgSend(NSString, "stringWithUTF8String:", "exifFocalLengthsByZoomFactor"));
  objc_msgSend(a3, "encodeBool:forKey:", LOBYTE(self->_exifFocalLengthsByZoomFactor), objc_msgSend(NSString, "stringWithUTF8String:", "constantColorEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE1(self->_exifFocalLengthsByZoomFactor), objc_msgSend(NSString, "stringWithUTF8String:", "constantColorClippingRecoveryEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE2(self->_exifFocalLengthsByZoomFactor), objc_msgSend(NSString, "stringWithUTF8String:", "constantColorSaturationBoostEnabled"));
  objc_msgSend(a3, "encodeBool:forKey:", BYTE3(self->_exifFocalLengthsByZoomFactor), objc_msgSend(NSString, "stringWithUTF8String:", "stereoPhotoCaptureEnabled"));
}

- (void)setIrisFrameHarvestingEnabled:(BOOL)a3
{
  BYTE5(self->_exifFocalLengthsByZoomFactor) = a3;
}

- (void)setIrisApplyPreviewShift:(BOOL)a3
{
  BYTE6(self->_exifFocalLengthsByZoomFactor) = a3;
}

@end