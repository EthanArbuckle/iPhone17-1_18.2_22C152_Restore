@interface FigCaptureSourceVideoFormat
+ (BOOL)supportsSecureCoding;
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)cinematicFramingOutputDimensions;
- ($2825F4736939C4A6D3AD43837233062D)cropDimensionsForFES;
- ($2825F4736939C4A6D3AD43837233062D)fesInputCropDimensions;
- ($2825F4736939C4A6D3AD43837233062D)geometricDistortionCorrectedNativeDimensions;
- ($2825F4736939C4A6D3AD43837233062D)nativeDimensions;
- ($2825F4736939C4A6D3AD43837233062D)postGDCCropDimensions;
- ($2825F4736939C4A6D3AD43837233062D)preGDCSensorCropDimensions;
- ($2825F4736939C4A6D3AD43837233062D)previewDimensions;
- ($2825F4736939C4A6D3AD43837233062D)sensorCropDimensions;
- ($2825F4736939C4A6D3AD43837233062D)sensorDimensions;
- ($2825F4736939C4A6D3AD43837233062D)sourceCropAspectRatio;
- ($2825F4736939C4A6D3AD43837233062D)stillImageGDCInDCProcessorOutputCropDimensions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minExposureDuration;
- (BOOL)capturesStillsFromVideoStream;
- (BOOL)configureForDepthDataDelivery;
- (BOOL)configureForDigitalFlashSupport;
- (BOOL)configureForNonDisruptiveFullBinSIFRSwitching;
- (BOOL)configureForSoftISPSupport;
- (BOOL)configureForSpatialOverCaptureSupport;
- (BOOL)configureForStereoPhotoCaptureSupport;
- (BOOL)configureForStillImageStabilizationSupport;
- (BOOL)configureForSupplementalTimeOfFlightCameraSupport;
- (BOOL)distortionCompensationSupported;
- (BOOL)fullBinSIFROnSecondaryCameraAllowed;
- (BOOL)gdcInStillImageSinkPipelineSupported;
- (BOOL)hasSensorHDRCompanionIndex;
- (BOOL)intelligentDistortionCorrectionSupported;
- (BOOL)isBackgroundBlurProvidedBySource;
- (BOOL)isBackgroundBlurSupported;
- (BOOL)isBackgroundBlurSupportedForContinuityCapture;
- (BOOL)isBackgroundReplacementProvidedBySource;
- (BOOL)isBackgroundReplacementSupported;
- (BOOL)isBackgroundReplacementSupportedForContinuityCapture;
- (BOOL)isBinned;
- (BOOL)isCaptureTimePhotoCurationSupported;
- (BOOL)isCenterStageRectOfInterestSupported;
- (BOOL)isCinematicFramingProvidedBySource;
- (BOOL)isCinematicFramingSupported;
- (BOOL)isCinematicFramingSupportedForContinuityCapture;
- (BOOL)isCompatibleWithInfraredFormat:(id)a3;
- (BOOL)isConstantColorSupported;
- (BOOL)isContentAwareAWBSupported;
- (BOOL)isContentAwareEnhancementSupported;
- (BOOL)isDeepFusionSupported;
- (BOOL)isDeepZoomSupported;
- (BOOL)isDeferredPhotoProcessingSupported;
- (BOOL)isDigitalFlashRawNightModeSupported;
- (BOOL)isDigitalFlashSupported;
- (BOOL)isFastSwitchingConfigurationRequired;
- (BOOL)isFocusPixelBlurScoreSupported;
- (BOOL)isGNRHDRSupported;
- (BOOL)isGainMapSupported;
- (BOOL)isHDROriginalImageDeliverySupported;
- (BOOL)isHDRSupported;
- (BOOL)isHighPhotoQualitySupported;
- (BOOL)isHighResStillImageSupported;
- (BOOL)isISPMultiBandNoiseReductionSupported;
- (BOOL)isIrisSupported;
- (BOOL)isIrisVideoStabilizationSupported;
- (BOOL)isLearnedNRSupported;
- (BOOL)isLowLightVideoCaptureSupported;
- (BOOL)isManualFramingSupported;
- (BOOL)isMomentCaptureMovieRecordingSupported;
- (BOOL)isMultiCamSupported;
- (BOOL)isMultiIlluminantWhiteBalanceSupported;
- (BOOL)isNonDestructiveCropSupported;
- (BOOL)isPhotoFormat;
- (BOOL)isPocketDetectionSupported;
- (BOOL)isPortraitAutoSuggestSupported;
- (BOOL)isQuadraHighResStillImageSupported;
- (BOOL)isRedEyeReductionSupported;
- (BOOL)isResponsiveShutterSupported;
- (BOOL)isSIFRStillImageCaptureWithDepthDataDisabled;
- (BOOL)isSIFRSupported;
- (BOOL)isSecondaryScalerUnavailable;
- (BOOL)isSemanticStyleRenderingSupported;
- (BOOL)isSmartStyleRenderingSupported;
- (BOOL)isSpatialOverCaptureSupported;
- (BOOL)isSphereAssistedAutoFocusEnabled;
- (BOOL)isStabilizationModeSupported:(int)a3;
- (BOOL)isStagePreviewRenderingSupported;
- (BOOL)isStereoFusionSupported;
- (BOOL)isStereoPhotoCaptureSupported;
- (BOOL)isStereoVideoCaptureSupported;
- (BOOL)isStillImageDepthSupported;
- (BOOL)isStillImageDisparitySupported;
- (BOOL)isStillImageISPChromaNoiseReductionEnabled;
- (BOOL)isStillImageISPMultiBandNoiseReductionSupported;
- (BOOL)isStillImageStabilizationSupported;
- (BOOL)isStreamingDepthSupported;
- (BOOL)isStreamingDisparitySupported;
- (BOOL)isStudioAndContourPreviewRenderingSupported;
- (BOOL)isStudioLightingProvidedBySource;
- (BOOL)isStudioLightingSupported;
- (BOOL)isStudioLightingSupportedForContinuityCapture;
- (BOOL)isSupplementalTimeOfFlightCameraSupported;
- (BOOL)isUltraHighResolutionZeroShutterLagSupported;
- (BOOL)isValidDerivedSourceFormatForUnderlyingFormat:(id)a3;
- (BOOL)isVariableFrameRateVideoCaptureSupported;
- (BOOL)isVideoGreenGhostMitigationSupported;
- (BOOL)isVideoGreenGhostMitigationUsesLightSourceMaskAndKeypointDescriptorData;
- (BOOL)isVideoHDRFusionSupported;
- (BOOL)isVideoSTFMetadataEnabled;
- (BOOL)isVideoSTFSupported;
- (BOOL)isVideoStabilizationStrengthSupported:(int)a3;
- (BOOL)isWideAsStatsMasterEnabled;
- (BOOL)isWideColorSupported;
- (BOOL)isWideDigitalFlashAvailableShallowDepthOfFieldEffectsEnabled;
- (BOOL)isZeroShutterLagSupported;
- (BOOL)isZeroShutterLagWithDepthSupported;
- (BOOL)ispChromaNoiseReductionEnabled;
- (BOOL)prefersSensorHDREnabled;
- (BOOL)reactionEffectsProvidedBySource;
- (BOOL)reactionEffectsSupported;
- (BOOL)reactionEffectsSupportedForContinuityCapture;
- (BOOL)semanticRenderingSupported;
- (BOOL)shouldPreferSIFRFormatWithHighlightRecoveryEnabled:(BOOL)a3;
- (BOOL)sushiRawBlackBorderingEnabled;
- (BOOL)sushiRawSupported;
- (BOOL)swfrSupported;
- (BOOL)temporalNoiseReductionBand0Disabled;
- (BOOL)temporalNoiseReductionRawEnabled;
- (BOOL)usesPacked10BitFirmwareStillImageOutputPixelFormat;
- (BOOL)zeroShutterLagRequiresUserInitiatedCaptureRequestTime;
- (CGPoint)sensorCenterOffset;
- (CGRect)maxVisibleSensorRect;
- (CGSize)stabilizationOverscanFromSensorForFESCropDimensions:(id)a3 preferSIFRFormat:(BOOL)a4 geometricDistortionCorrection:(BOOL)a5 useFESCompanionIndex:(BOOL)a6;
- (FigCaptureSourceVideoFormat)_resolveProperties;
- (FigCaptureSourceVideoFormat)cinematicFramingFormat;
- (FigCaptureSourceVideoFormat)geometricDistortionCorrectionFormat;
- (FigCaptureSourceVideoFormat)initWithCoder:(id)a3;
- (FigCaptureSourceVideoFormat)initWithFigCaptureStreamFormatDictionary:(id)a3;
- (FigCaptureSourceVideoFormat)initWithFigCaptureStreamFormatDictionary:(id)a3 pixelFormatOverride:(unsigned int)a4;
- (FigCaptureSourceVideoFormat)initWithXPCEncoding:(id)a3;
- (NSArray)AVCaptureSessionPresets;
- (NSArray)secondaryNativeResolutionZoomFactors;
- (NSArray)supportedColorSpaces;
- (NSArray)supportedDepthDataFormats;
- (float)_fieldOfViewWithCrop:(uint64_t)a1;
- (float)actionCameraAEMaxGainScaleFactor;
- (float)aeMaxGain;
- (float)cinematicStabilizationExtendedLookAheadDuration;
- (float)clientMaxContinuousZoomFactorForDepthDataDelivery;
- (float)defaultMaxFrameRateForSessionPreset:(id)a3;
- (float)defaultMinFrameRateForSessionPreset:(id)a3;
- (float)defaultPortraitLightingEffectStrength;
- (float)defaultSimulatedAperture;
- (float)depthDataAEMaxGain;
- (float)depthDataMaxIntegrationTimeOverride;
- (float)fieldOfView;
- (float)geometricDistortionCorrectedFieldOfView;
- (float)hardwareCost;
- (float)lowLightVideoAEMaxGain;
- (float)maxContinuousZoomFactorForCinematicVideo;
- (float)maxContinuousZoomFactorForDepthDataDelivery;
- (float)maxISO;
- (float)maxPortraitLightingEffectStrength;
- (float)maxSimulatedAperture;
- (float)maxZoomFactor;
- (float)minISO;
- (float)minPortraitLightingEffectStrength;
- (float)minSimulatedAperture;
- (float)spatialOverCapturePercentage;
- (float)stabilizationOverscanPercentageOverrideForCinematic;
- (float)stabilizationOverscanPercentageOverrideForCinematicExtendedEnhanced;
- (float)stabilizationOverscanPercentageOverrideForStandard;
- (float)stereoVideoAEMaxGain;
- (float)variableFrameRateVideoCaptureFromFWAEMaxGain;
- (float)zoomFactorUpscaleThreshold;
- (id)_avfcAttributes;
- (id)_highResStillImageDimensions;
- (id)_sourceDimensions;
- (id)actionCameraCompanionFormat;
- (id)copyWithNewPixelFormat:(unsigned int)a3;
- (id)copyXPCEncoding;
- (id)depthCompanionFormat;
- (id)digitalFlashDetectedObjectTypes;
- (id)fastSwitchingMainCaptureStreamFormat;
- (id)frontEndScalerCompanionFormats;
- (id)fsdNetCompanionFormat;
- (id)fullBinSIFRCompanionFormat;
- (id)highResStillImageDimensions;
- (id)midFrameSynchronizationOptimizedCompanionFormat;
- (id)nonSIFRCompanionFormat;
- (id)quadraSubPixelSwitchingParameters;
- (id)rawLensShadingCorrection;
- (id)stereoVideoCompanionFormat;
- (id)ultraHighResCompanionFormat;
- (int)autoFocusSystem;
- (int)baseSensorPowerConsumption;
- (int)configureForGreenGhostMitigationVersion;
- (int)constantColorVersion;
- (int)fesBinningFactorHorizontal;
- (int)formatIndex;
- (int)greenGhostMitigationVersion;
- (int)horizontalSensorBinningFactor;
- (int)ispPowerConsumption;
- (int)maxIntegrationTimeOverride;
- (int)preferredPreviewMaxFrameRate;
- (int)previewImageQueueSyncStrategy;
- (int)redEyeReductionVersion;
- (int)semanticDevelopmentVersion;
- (int)sensorHDRCompanionIndex;
- (int)sifrBinningFactorOverrideForNondisruptiveSwitching;
- (int)stabilizationTypeOverrideForCinematic;
- (int)stabilizationTypeOverrideForStandard;
- (int)stillImageGDCSourceMode;
- (int)temporalNoiseReductionMode;
- (int)variableSensorPowerConsumption;
- (int)verticalSensorBinningFactor;
- (uint64_t)_supportsDepthDataFormatForDisparity:(int)a3 streaming:;
- (unint64_t)_highQualitySensorDimensions;
- (unint64_t)_maxUseableSensorDimensions;
- (unint64_t)_nativeDimensionsWithoutCrop;
- (unint64_t)_outputDimensions;
- (unint64_t)_visibleSensorDimensionsIncludingCinematic:(id *)a1;
- (unsigned)internalDemosaicedRawPixelFormat;
- (unsigned)mediaType;
- (unsigned)supportedDemosaicedRawPixelFormat;
- (unsigned)supportedRawPixelFormat;
- (void)_buildFESCompanionFormatsForType:(uint64_t)a1;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation FigCaptureSourceVideoFormat

- (BOOL)isStudioLightingSupportedForContinuityCapture
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"StudioLightingSupportedForContinuityCapture"];
  return [v2 BOOLValue];
}

- (FigCaptureSourceVideoFormat)initWithXPCEncoding:(id)a3
{
  return 0;
}

- (FigCaptureSourceVideoFormat)initWithFigCaptureStreamFormatDictionary:(id)a3 pixelFormatOverride:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureSourceVideoFormat;
  v4 = [(FigCaptureSourceFormat *)&v7 initWithFigCaptureStreamFormatDictionary:a3 pixelFormatOverride:*(void *)&a4];
  v5 = v4;
  if (v4) {
    -[FigCaptureSourceVideoFormat _resolveProperties](v4);
  }
  return v5;
}

- (FigCaptureSourceVideoFormat)initWithFigCaptureStreamFormatDictionary:(id)a3
{
  return [(FigCaptureSourceVideoFormat *)self initWithFigCaptureStreamFormatDictionary:a3 pixelFormatOverride:0];
}

- (id)_avfcAttributes
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (_avfcAttributes_onceToken != -1) {
    dispatch_once(&_avfcAttributes_onceToken, &__block_literal_global_749);
  }
  id v2 = (id)[a1[1] mutableCopy];
  [v2 removeObjectsForKeys:_avfcAttributes_sInternalKeys];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a1, "format"));
  [v2 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F24D70]];
  v4 = (void *)[a1 supportedDepthDataFormats];
  if ([v4 count])
  {
    v14 = v2;
    v5 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(id **)(*((void *)&v15 + 1) + 8 * i);
          v11 = (void *)[v10[1] objectForKeyedSubscript:@"AdditionalPixelFormats"];
          if ((objc_msgSend(v11, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "format"))) & 1) == 0)
          {
            v12 = (void *)[v10[1] mutableCopy];
            [v12 removeObjectsForKeys:_avfcAttributes_sInternalKeys];
            [v5 addObject:v12];
          }
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }
    id v2 = v14;
    [v14 setObject:v5 forKeyedSubscript:@"SupportedDepthDataFormats"];
  }
  return v2;
}

- (unsigned)mediaType
{
  id v3 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"MediaType"];
  if (v3)
  {
    return BWOSTypeForString(v3);
  }
  else if ([(FigCaptureSourceFormat *)self format] == 1785950320)
  {
    return 1885564004;
  }
  else
  {
    return 1986618469;
  }
}

- (id)highResStillImageDimensions
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = -[FigCaptureSourceVideoFormat _highResStillImageDimensions]((id *)&self->super.super.isa);
  if (![v3 count])
  {
    if ([(FigCaptureSourceVideoFormat *)self isHighResStillImageSupported])
    {
      if ([(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"HighResStillImageWidth"]&& [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"HighResStillImageHeight"])
      {
        unsigned int var0 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"HighResStillImageWidth"), "intValue");
        uint64_t v5 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"HighResStillImageHeight"), "intValue");
      }
      else
      {
        unint64_t v8 = -[FigCaptureSourceVideoFormat _maxUseableSensorDimensions]((id *)&self->super.super.isa);
        unsigned int var0 = v8;
        uint64_t v5 = HIDWORD(v8);
        float v9 = (float)[(FigCaptureSourceVideoFormat *)self horizontalSensorBinningFactor];
        float v10 = v9
            / (float)[(FigCaptureSourceVideoFormat *)self verticalSensorBinningFactor];
        if (v10 != 1.0)
        {
          if (v10 < 1.0) {
            unsigned int var0 = (int)(float)(v10 * (float)(int)var0);
          }
          else {
            uint64_t v5 = (int)(float)(v10 * (float)(int)v5);
          }
        }
      }
      if ([(FigCaptureSourceVideoFormat *)self isDeferredPhotoProcessingSupported]) {
        unint64_t v7 = var0 | (unint64_t)(v5 << 32);
      }
      else {
        unint64_t v7 = 0;
      }
    }
    else
    {
      $2825F4736939C4A6D3AD43837233062D v6 = [(FigCaptureSourceFormat *)self dimensions];
      unint64_t v7 = 0;
      uint64_t v5 = HIDWORD(*(unint64_t *)&v6);
      unsigned int var0 = v6.var0;
    }
    uint64_t v11 = var0 | (unint64_t)(v5 << 32);
    if (FigCaptureVideoDimensionsAreValid(v11))
    {
      v13[0] = [[FigCaptureSourceFormatDimensions alloc] initWithDimensions:v11 deferredPhotoProxyDimensions:v7 isPrivate:0 flavor:0 maxUpscalingDimensions:0];
      return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
    }
  }
  return v3;
}

- (int)verticalSensorBinningFactor
{
  if ([(FigCaptureSourceVideoFormat *)self isBinned]) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if (![(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoBinningFactorVertical"])return v3; {
  id v4 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoBinningFactorVertical"];
  }
  return [v4 intValue];
}

- (int)horizontalSensorBinningFactor
{
  if ([(FigCaptureSourceVideoFormat *)self isBinned]) {
    int v3 = 2;
  }
  else {
    int v3 = 1;
  }
  if (![(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoBinningFactorHorizontal"])return v3; {
  id v4 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoBinningFactorHorizontal"];
  }
  return [v4 intValue];
}

- (BOOL)isBinned
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoIsBinned"];
  return [v2 BOOLValue];
}

- (void)_buildFESCompanionFormatsForType:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", a2, 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (!v5) {
          uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        }
        float v9 = [[FigCaptureSourceCompanionFormat alloc] initWithCompanionFormatDictionary:v8];
        [v5 addObject:v9];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v5 = 0;
  }
  [v5 sortUsingComparator:&__block_literal_global_42];
  return v5;
}

- (FigCaptureSourceVideoFormat)_resolveProperties
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    result->_frontEndScalerCompanionFormats = (NSArray *)-[FigCaptureSourceVideoFormat _buildFESCompanionFormatsForType:]((uint64_t)result, @"FESCompanionFormats");
    id v2 = [(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"SupportedDepthDataFormats"];
    uint64_t v3 = [v2 count];
    uint64_t v4 = (void *)MEMORY[0x1E4F24D70];
    if (v3)
    {
      uint64_t v5 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v25 = [v2 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v25)
      {
        uint64_t v24 = *(void *)v31;
        obuint64_t j = v2;
        uint64_t v23 = *MEMORY[0x1E4F24D70];
        do
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v31 != v24) {
              objc_enumerationMutation(obj);
            }
            unint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", objc_msgSend(v7, "objectForKeyedSubscript:", v23));
            objc_msgSend(v8, "addObjectsFromArray:", objc_msgSend(v7, "objectForKeyedSubscript:", @"AdditionalPixelFormats"));
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
            if (v9)
            {
              uint64_t v10 = v9;
              long long v11 = 0;
              uint64_t v12 = *(void *)v27;
              do
              {
                for (uint64_t j = 0; j != v10; ++j)
                {
                  if (*(void *)v27 != v12) {
                    objc_enumerationMutation(v8);
                  }
                  uint64_t v14 = [*(id *)(*((void *)&v26 + 1) + 8 * j) intValue];
                  if (v11)
                  {
                    long long v15 = [(FigCaptureSourceDepthDataFormat *)v11 copyWithNewPixelFormat:v14];
                  }
                  else
                  {
                    long long v15 = [(FigCaptureSourceFormat *)[FigCaptureSourceDepthDataFormat alloc] initWithFigCaptureStreamFormatDictionary:v7];
                    long long v11 = v15;
                  }
                  uint64_t v16 = v15;
                  [(NSArray *)v5 addObject:v15];
                }
                uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
              }
              while (v10);
            }
          }
          uint64_t v25 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v25);
      }
      v1->_supportedDepthDataFormats = v5;
      uint64_t v4 = (void *)MEMORY[0x1E4F24D70];
    }
    if ([(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"NonSIFRCompanionFormat"])
    {
      v1->_nonSIFRCompanionFormat = [[FigCaptureSourceCompanionFormat alloc] initWithCompanionFormatDictionary:[(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"NonSIFRCompanionFormat"]];
    }
    if ([(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"FullBinSIFRCompanionFormat"])
    {
      v1->_fullBinSIFRCompanionFormat = [[FigCaptureSourceCompanionFormat alloc] initWithCompanionFormatDictionary:[(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"FullBinSIFRCompanionFormat"]];
    }
    if ([(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"MidFrameSynchronizationOptimizedCompanionFormat"])
    {
      v1->_midFrameSynchronizationOptimizedCompanionFormat = [[FigCaptureSourceCompanionFormat alloc] initWithCompanionFormatDictionary:[(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"MidFrameSynchronizationOptimizedCompanionFormat"]];
    }
    if ([(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"ActionCameraCompanionFormat"])
    {
      v1->_actionCameraCompanionFormat = [[FigCaptureSourceCompanionFormat alloc] initWithCompanionFormatDictionary:[(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"ActionCameraCompanionFormat"]];
    }
    if ([(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"DepthCompanionFormat"])
    {
      v1->_depthCompanionFormat = [[FigCaptureSourceCompanionFormat alloc] initWithCompanionFormatDictionary:[(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"DepthCompanionFormat"]];
    }
    if ([(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"UltraHighResCompanionFormat"])
    {
      v1->_ultraHighResCompanionFormat = [[FigCaptureSourceCompanionFormat alloc] initWithCompanionFormatDictionary:[(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"UltraHighResCompanionFormat"]];
    }
    if ([(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"FSDNetCompanionFormat"])
    {
      v1->_fsdNetCompanionFormat = [[FigCaptureSourceCompanionFormat alloc] initWithCompanionFormatDictionary:[(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"FSDNetCompanionFormat"]];
    }
    if ([(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"StereoVideoCompanionFormat"])
    {
      v1->_stereoVideoCompanionFormat = [[FigCaptureSourceCompanionFormat alloc] initWithCompanionFormatDictionary:[(NSDictionary *)v1->super._formatDictionary objectForKeyedSubscript:@"StereoVideoCompanionFormat"]];
    }
    id v17 = (id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", @"GeometricDistortionCorrectionSourceFormat"), "mutableCopy");
    if (v17)
    {
      id v18 = v17;
      objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FigCaptureSourceFormat format](v1, "format")), *v4);
      v1->_geometricDistortionCorrectionFormat = [[FigCaptureSourceVideoFormat alloc] initWithFigCaptureStreamFormatDictionary:v18];
    }
    id v19 = (id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", @"CinematicFramingSourceFormat"), "mutableCopy");
    if (v19)
    {
      id v20 = v19;
      objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FigCaptureSourceFormat format](v1, "format")), *v4);
      v1->_cinematicFramingFormat = [[FigCaptureSourceVideoFormat alloc] initWithFigCaptureStreamFormatDictionary:v20];
    }
    result = (FigCaptureSourceVideoFormat *)(id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v1->super._formatDictionary, "objectForKeyedSubscript:", @"FastSwitchingMainCaptureStreamFormat"), "mutableCopy");
    if (result)
    {
      v21 = result;
      -[FigCaptureSourceVideoFormat setObject:forKeyedSubscript:](result, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FigCaptureSourceFormat format](v1, "format")), *v4);
      result = [[FigCaptureSourceVideoFormat alloc] initWithFigCaptureStreamFormatDictionary:v21];
      v1->_fastSwitchingMainCaptureStreamFormat = result;
    }
  }
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)sourceCropAspectRatio
{
  unint64_t v3 = -[FigCaptureSourceVideoFormat _outputDimensions]((unint64_t)self);
  unint64_t v4 = [(FigCaptureSourceVideoFormat *)self postGDCCropDimensions];
  if (FigCaptureVideoDimensionsAreValid(v4))
  {
    unint64_t v5 = HIDWORD(v4);
  }
  else
  {
    unint64_t v4 = objc_msgSend(-[NSArray lastObject](self->_frontEndScalerCompanionFormats, "lastObject"), "geometricDistortionCorrectedNativeDimensions");
    if (FigCaptureVideoDimensionsAreValid(v4))
    {
      unint64_t v5 = HIDWORD(v4);
    }
    else
    {
      uint64_t v6 = -[FigCaptureSourceVideoFormat _sourceDimensions]((id *)&self->super.super.isa);
      unint64_t v7 = (unint64_t)v6 >> 32;
      LODWORD(v4) = [(FigCaptureSourceVideoFormat *)self horizontalSensorBinningFactor]
                  * v6;
      LODWORD(v5) = [(FigCaptureSourceVideoFormat *)self verticalSensorBinningFactor] * v7;
    }
  }
  if (vabds_f32((float)(int)v4 / (float)(int)v5, (float)(int)v3 / (float)SHIDWORD(v3)) <= 0.01) {
    return ($2825F4736939C4A6D3AD43837233062D)0;
  }
  else {
    return ($2825F4736939C4A6D3AD43837233062D)v3;
  }
}

- (id)_sourceDimensions
{
  if (result)
  {
    v1 = result;
    if (FigCaptureVideoDimensionsAreValid([result sensorCropDimensions])) {
      unint64_t v2 = [v1 sensorCropDimensions];
    }
    else {
      unint64_t v2 = [v1 sensorDimensions];
    }
    int v3 = v2;
    unint64_t v4 = HIDWORD(v2);
    int v5 = objc_msgSend((id)objc_msgSend(v1[1], "objectForKeyedSubscript:", @"HighQualitySensorWidth"), "intValue");
    int v6 = objc_msgSend((id)objc_msgSend(v1[1], "objectForKeyedSubscript:", @"HighQualitySensorHeight"), "intValue");
    if (v5 > v3 || v5 == 0) {
      unsigned int v8 = v3;
    }
    else {
      unsigned int v8 = v5;
    }
    if (v6 > (int)v4 || v6 == 0) {
      int v6 = v4;
    }
    return (id *)(v8 | ((unint64_t)v6 << 32));
  }
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorCropDimensions
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"SensorCropWidth"), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"SensorCropHeight"), "intValue") << 32));
}

- (unint64_t)_outputDimensions
{
  if (result)
  {
    unint64_t v1 = result;
    unsigned int v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "intValue");
    return v2 | (unint64_t)(objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "intValue") << 32);
  }
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorDimensions
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E4F55300]), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E4F552F8]), "intValue") << 32));
}

- ($2825F4736939C4A6D3AD43837233062D)postGDCCropDimensions
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"PostGDCCropWidth"), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"PostGDCCropHeight"), "intValue") << 32));
}

- (unint64_t)_maxUseableSensorDimensions
{
  if (!a1) {
    return 0;
  }
  unsigned int v2 = -[FigCaptureSourceVideoFormat _sourceDimensions](a1);
  unint64_t v3 = [a1 sourceCropAspectRatio];
  int v4 = v3;
  if ((int)v3 < 1) {
    return (unint64_t)v2;
  }
  unint64_t v5 = HIDWORD(v3);
  if (SHIDWORD(v3) < 1) {
    return (unint64_t)v2;
  }
  if ((int)FigCapturePlatformIdentifier() <= 5) {
    uint64_t v6 = 0x200000002;
  }
  else {
    uint64_t v6 = 0x200000004;
  }
  return FigCaptureFitAspectInsideDimensions((uint64_t)v2, v6, (float)v4 / (float)(int)v5);
}

- (float)clientMaxContinuousZoomFactorForDepthDataDelivery
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"MaxContinuousZoomFactorForDepthDataDelivery"];
  [v2 floatValue];
  return result;
}

- (BOOL)isHighPhotoQualitySupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"HighPhotoQualitySupported"];
  return [v2 BOOLValue];
}

- (id)_highResStillImageDimensions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v1 = result;
    uint64_t v9 = (void *)[MEMORY[0x1E4F1CA48] array];
    id v2 = (void *)[v1[1] objectForKeyedSubscript:@"HighResStillImageDimensions"];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    obuint64_t j = v2;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v8 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          objc_msgSend(v9, "addObject:", objc_autorelease(-[FigCaptureSourceFormatDimensions initWithDimensions:deferredPhotoProxyDimensions:isPrivate:flavor:maxUpscalingDimensions:]([FigCaptureSourceFormatDimensions alloc], "initWithDimensions:deferredPhotoProxyDimensions:isPrivate:flavor:maxUpscalingDimensions:", objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"Width"), "intValue") | (unint64_t)(objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"Height"), "intValue") << 32), objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"DeferredPhotoProxyWidth"), "intValue") | (unint64_t)(objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"DeferredPhotoProxyHeight"), "intValue") << 32), objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"Private"), "BOOLValue"), objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"Flavor"), "intValue"), objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"MaxUpscalingWidth"),
                                "intValue") | (unint64_t)(objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", @"MaxUpscalingHeight"), "intValue") << 32))));
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v4);
    }
    return (id *)(id)[v9 copy];
  }
  return result;
}

- (BOOL)isHighResStillImageSupported
{
  if (![(FigCaptureSourceVideoFormat *)self capturesStillsFromVideoStream]) {
    return 1;
  }
  return [(FigCaptureSourceVideoFormat *)self isQuadraHighResStillImageSupported];
}

- (BOOL)capturesStillsFromVideoStream
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"CaptureStillsFromVideoStream"];
  return [v2 BOOLValue];
}

- (BOOL)isDeferredPhotoProcessingSupported
{
  char v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"DeferredPhotoProcessingSupported"), "BOOLValue");
  [(FigCaptureSourceVideoFormat *)self isPhotoFormat];
  return v3;
}

- (BOOL)isPhotoFormat
{
  unint64_t v3 = -[FigCaptureSourceVideoFormat _outputDimensions]((unint64_t)self);
  if (v3 == 0x5E8000007E0 || v3 == 0x60000000800 || v3 == 2592 && (HIDWORD(v3) & 0xFFFFFFF7) == 0x790) {
    return 1;
  }
  if (v3 == 0x80400000AB0) {
    return 1;
  }
  BOOL v4 = HIDWORD(v3) == 2320 || HIDWORD(v3) == 2316;
  BOOL v5 = v4;
  if (v3 == 3088 && v5
    || v3 == 0x99000000CC0
    || v3 == 0xAC800000E60
    || v3 == 0xBD000000FC0
    || v3 == 0x3C000000500
    || v3 == 0x2D0000003C0)
  {
    return 1;
  }
  id v7 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"AVCaptureSessionPresets"];
  return [v7 containsObject:@"AVCaptureSessionPresetPhoto"];
}

- (NSArray)supportedDepthDataFormats
{
  return self->_supportedDepthDataFormats;
}

- (BOOL)isQuadraHighResStillImageSupported
{
  return 0;
}

- (id)copyWithNewPixelFormat:(unsigned int)a3
{
  if (!self->super._formatDictionary) {
    return 0;
  }
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = [FigCaptureSourceVideoFormat alloc];
  formatDictionary = self->super._formatDictionary;
  return [(FigCaptureSourceVideoFormat *)v5 initWithFigCaptureStreamFormatDictionary:formatDictionary pixelFormatOverride:v3];
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  -[FigCaptureSourceVideoFormat _avfcAttributes]((id *)&self->super.super.isa);
  FigXPCMessageSetCFDictionary();
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSourceVideoFormat;
  [(FigCaptureSourceFormat *)&v3 dealloc];
}

- (BOOL)reactionEffectsSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ReactionEffectsSupported"];
  return [v2 BOOLValue];
}

- (BOOL)reactionEffectsSupportedForContinuityCapture
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ReactionEffectsSupportedForContinuityCapture"];
  return [v2 BOOLValue];
}

- (BOOL)isStudioLightingSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"StudioLightingSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isCinematicFramingSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"CinematicFramingSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isCinematicFramingSupportedForContinuityCapture
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"CinematicFramingSupportedForContinuityCapture"];
  return [v2 BOOLValue];
}

- (BOOL)isBackgroundReplacementSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"BackgroundReplacementSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isBackgroundReplacementSupportedForContinuityCapture
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"BackgroundReplacementSupportedForContinuityCapture"];
  return [v2 BOOLValue];
}

- (BOOL)isBackgroundBlurSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"BackgroundBlurSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isBackgroundBlurSupportedForContinuityCapture
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"BackgroundBlurSupportedForContinuityCapture"];
  return [v2 BOOLValue];
}

- (BOOL)isStreamingDisparitySupported
{
  return -[FigCaptureSourceVideoFormat _supportsDepthDataFormatForDisparity:streaming:]((uint64_t)self, 1, 1);
}

- (BOOL)isStillImageDisparitySupported
{
  return -[FigCaptureSourceVideoFormat _supportsDepthDataFormatForDisparity:streaming:]((uint64_t)self, 1, 0);
}

- (NSArray)secondaryNativeResolutionZoomFactors
{
  return (NSArray *)[(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SecondaryNativeResolutionZoomFactors"];
}

- (BOOL)isCenterStageRectOfInterestSupported
{
  id v2 = objc_msgSend(-[FigCaptureSourceFormat formatDictionary](self->_cinematicFramingFormat, "formatDictionary"), "objectForKeyedSubscript:", @"CenterStageRectOfInterestSupported");
  return [v2 BOOLValue];
}

- (BOOL)isManualFramingSupported
{
  id v2 = objc_msgSend(-[FigCaptureSourceFormat formatDictionary](self->_cinematicFramingFormat, "formatDictionary"), "objectForKeyedSubscript:", @"ManualFramingSupported");
  return [v2 BOOLValue];
}

- (BOOL)isStreamingDepthSupported
{
  return -[FigCaptureSourceVideoFormat _supportsDepthDataFormatForDisparity:streaming:]((uint64_t)self, 0, 1);
}

- (BOOL)isStillImageDepthSupported
{
  return -[FigCaptureSourceVideoFormat _supportsDepthDataFormatForDisparity:streaming:]((uint64_t)self, 0, 0);
}

- (BOOL)isCinematicFramingProvidedBySource
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"CinematicFramingProvidedBySource"];
  return [v2 BOOLValue];
}

- (NSArray)AVCaptureSessionPresets
{
  return (NSArray *)[(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"AVCaptureSessionPresets"];
}

- (BOOL)isVideoStabilizationStrengthSupported:(int)a3
{
  char v5 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"VideoStabilizationSupported"), "BOOLValue");
  if ((int)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"VideoStabilizationMaxStrength"), "intValue") >= a3)BOOL v6 = v5; {
  else
  }
    BOOL v6 = 0;
  char v7 = v5 ^ 1;
  if (a3) {
    char v7 = 0;
  }
  if (a3 == 1) {
    char v7 = v5;
  }
  if ((a3 - 2) >= 3) {
    return v7;
  }
  else {
    return v6;
  }
}

- (float)minSimulatedAperture
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"MinSimulatedAperture"];
  [v2 floatValue];
  return result;
}

- (float)geometricDistortionCorrectedFieldOfView
{
  int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"StillImageGDCInDCProcessorOutputCropWidth"), "intValue");
  long long v7 = *MEMORY[0x1E4F1DB20];
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  if (v3 || !FigCFDictionaryGetCGRectIfPresent() || *(double *)&v8 == 0.0)
  {
    [(FigCaptureSourceVideoFormat *)self fieldOfView];
  }
  else
  {
    unint64_t v5 = -[FigCaptureSourceVideoFormat _nativeDimensionsWithoutCrop]((uint64_t)self);
    float v6 = 1.0;
    if (*((double *)&v8 + 1) / (double)SHIDWORD(v5) <= 1.0) {
      float v6 = *((double *)&v8 + 1)
    }
         / (double)(int)(-[FigCaptureSourceVideoFormat _nativeDimensionsWithoutCrop]((uint64_t)self) >> 32);
    return -[FigCaptureSourceVideoFormat _fieldOfViewWithCrop:]((uint64_t)self, v6);
  }
  return result;
}

- (float)_fieldOfViewWithCrop:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", *MEMORY[0x1E4F55C70]), "floatValue");
  float v5 = v4;
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "objectForKeyedSubscript:", @"AdditionalHorizontalFOVCropMultiplier"), "floatValue");
  if (v6 == 0.0) {
    float v6 = 1.0;
  }
  float v7 = v6 * a2;
  if (v7 != 1.0)
  {
    float v8 = v5 * 3.14159265 / 360.0;
    float v9 = tanf(v8);
    return (float)(atanf(v7 * v9) * 360.0) / 3.14159265;
  }
  return v5;
}

- (float)fieldOfView
{
  int v3 = -[FigCaptureSourceVideoFormat _maxUseableSensorDimensions]((id *)&self->super.super.isa);
  if (v3) {
    float v4 = (float)v3 / (float)(int)[(FigCaptureSourceVideoFormat *)self sensorDimensions];
  }
  else {
    float v4 = 1.0;
  }
  return -[FigCaptureSourceVideoFormat _fieldOfViewWithCrop:]((uint64_t)self, v4);
}

- (unint64_t)_nativeDimensionsWithoutCrop
{
  if (a1)
  {
    unint64_t v1 = (id *)a1;
    uint64_t v2 = *MEMORY[0x1E4F552B0];
    if ([*(id *)(a1 + 8) objectForKeyedSubscript:*MEMORY[0x1E4F552B0]]
      && (uint64_t v3 = *MEMORY[0x1E4F552A8], [v1[1] objectForKeyedSubscript:*MEMORY[0x1E4F552A8]]))
    {
      unsigned int v4 = objc_msgSend((id)objc_msgSend(v1[1], "objectForKeyedSubscript:", v2), "intValue");
      a1 = objc_msgSend((id)objc_msgSend(v1[1], "objectForKeyedSubscript:", v3), "intValue");
    }
    else
    {
      unint64_t v5 = [v1 sensorDimensions];
      unsigned int v4 = v5;
      a1 = HIDWORD(v5);
    }
  }
  else
  {
    unsigned int v4 = 0;
  }
  return v4 | (unint64_t)(a1 << 32);
}

- (float)defaultSimulatedAperture
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"DefaultSimulatedAperture"];
  [v2 floatValue];
  return result;
}

- (BOOL)isStereoVideoCaptureSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"StereoVideoCaptureSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isMultiCamSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"MultiCamSupported"];
  return [v2 BOOLValue];
}

- (float)maxSimulatedAperture
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"MaxSimulatedAperture"];
  [v2 floatValue];
  return result;
}

- (BOOL)isWideColorSupported
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(FigCaptureSourceVideoFormat *)self supportedColorSpaces];
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * v6) intValue] - 5 > 0xFFFFFFFB)
        {
          LOBYTE(v3) = 1;
          return v3;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      uint64_t v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return v3;
}

- (NSArray)supportedColorSpaces
{
  unsigned int v3 = [(FigCaptureSourceFormat *)self format];
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = v4;
  if (v3 == 2016686640)
  {
    uint64_t v6 = &unk_1EFAFF138;
    goto LABEL_11;
  }
  if (v3 == 2016686642)
  {
    [v4 addObject:&unk_1EFAFF150];
    if ([(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"10BitVideoHDRSupportedForProRes"])
    {
      [v5 addObject:&unk_1EFAFF138];
    }
    if ([(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"AppleLogSupportedForProRes"])
    {
      uint64_t v6 = &unk_1EFAFF168;
LABEL_11:
      [v5 addObject:v6];
    }
  }
  else
  {
    [v4 addObject:&unk_1EFAFF150];
    if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"WideColorSupported"), "BOOLValue")&& v3 == 875704422)
    {
      uint64_t v6 = &unk_1EFAFF180;
      goto LABEL_11;
    }
  }
  float v7 = (void *)[v5 copy];
  return (NSArray *)v7;
}

- (BOOL)hasSensorHDRCompanionIndex
{
  return ![(FigCaptureSourceVideoFormat *)self isQuadraHighResStillImageSupported]
      && [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SensorHDRCompanionIndex"] != 0;
}

- (float)maxContinuousZoomFactorForCinematicVideo
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"MaxContinuousZoomFactorForCinematicVideo"];
  [v2 floatValue];
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minExposureDuration
{
  int64_t v4 = (int)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E4F55C80]), "intValue");
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, v4, 1000000);
}

- (BOOL)isHDROriginalImageDeliverySupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"HDROriginalImageDeliverySupported"];
  return [v2 BOOLValue];
}

- (BOOL)isStudioLightingProvidedBySource
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"StudioLightingProvidedBySource"];
  return [v2 BOOLValue];
}

- (BOOL)isBackgroundReplacementProvidedBySource
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"BackgroundReplacementProvidedBySource"];
  return [v2 BOOLValue];
}

- (BOOL)isBackgroundBlurProvidedBySource
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"BackgroundBlurProvidedBySource"];
  return [v2 BOOLValue];
}

- (BOOL)isLowLightVideoCaptureSupported
{
  char v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"LowLightVideoCaptureSupported"), "BOOLValue");
  return v3 & ~FigCapturePixelFormatIs422([(FigCaptureSourceFormat *)self format]);
}

- (BOOL)isVariableFrameRateVideoCaptureSupported
{
  char v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"VariableFrameRateVideoCaptureSupported"), "BOOLValue");
  return v3 & ~FigCapturePixelFormatIs422([(FigCaptureSourceFormat *)self format]);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDuration
{
  int v5 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E4F55C78]), "intValue");
  memset(&v11, 0, sizeof(v11));
  CMTimeMake(&v11, v5, 1000000);
  memset(&v10, 0, sizeof(v10));
  [(FigCaptureSourceFormat *)self minSupportedFrameRate];
  CMTimeMake(&v10, 1, (int)v6);
  CMTime time1 = v11;
  CMTime v8 = v10;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMinimum((CMTime *)retstr, &time1, &v8);
}

- (BOOL)isPortraitAutoSuggestSupported
{
  char v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"PortraitAutoSuggestSupported"), "BOOLValue");
  [(FigCaptureSourceVideoFormat *)self isPhotoFormat];
  return v3;
}

- (BOOL)isSupplementalTimeOfFlightCameraSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SupplementalTimeOfFlightCameraSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isSmartStyleRenderingSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SmartStyleRenderingSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isConstantColorSupported
{
  return [(FigCaptureSourceVideoFormat *)self constantColorVersion] > 0;
}

- (int)constantColorVersion
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ColorConstancyVersion"];
  return [v2 intValue];
}

- (float)defaultMinFrameRateForSessionPreset:(id)a3
{
  if (!a3
    || (id v5 = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"VideoDefaultMinFrameRatesForPresets")) == 0|| (objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", a3), "floatValue"), v6 == 0.0))
  {
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"VideoDefaultMinFrameRate"), "floatValue");
  }
  float v7 = v6;
  if (v6 != 0.0) {
    return v7;
  }
  BOOL v8 = [(FigCaptureSourceVideoFormat *)self isPhotoFormat];
  [(FigCaptureSourceVideoFormat *)self defaultMaxFrameRateForSessionPreset:a3];
  float v7 = v9;
  if (!v8) {
    return v7;
  }
  float v7 = v9 * 0.5;
  [(FigCaptureSourceFormat *)self minSupportedFrameRate];
  if (v7 >= v10) {
    return v7;
  }
  [(FigCaptureSourceFormat *)self minSupportedFrameRate];
  return result;
}

- (float)defaultMaxFrameRateForSessionPreset:(id)a3
{
  if (!a3
    || (id v5 = -[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"VideoDefaultMaxFrameRatesForPresets")) == 0|| (objc_msgSend((id)objc_msgSend(v5, "objectForKeyedSubscript:", a3), "floatValue"), result == 0.0))
  {
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"VideoDefaultMaxFrameRate"), "floatValue");
  }
  if (result == 0.0)
  {
    id v7 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoMaxFrameRate"];
    [v7 floatValue];
  }
  return result;
}

- (FigCaptureSourceVideoFormat)geometricDistortionCorrectionFormat
{
  return self->_geometricDistortionCorrectionFormat;
}

- (FigCaptureSourceVideoFormat)cinematicFramingFormat
{
  return self->_cinematicFramingFormat;
}

- (BOOL)isValidDerivedSourceFormatForUnderlyingFormat:(id)a3
{
  if (!a3) {
    return 0;
  }
  int64_t v4 = [(FigCaptureSourceFormat *)self uniqueID];
  uint64_t v5 = [a3 uniqueID];
  return [(NSString *)v4 isEqualToString:v5];
}

- (id)fastSwitchingMainCaptureStreamFormat
{
  if ([(FigCaptureSourceVideoFormat *)self isFastSwitchingConfigurationRequired]) {
    return self->_fastSwitchingMainCaptureStreamFormat;
  }
  else {
    return 0;
  }
}

- (BOOL)isFastSwitchingConfigurationRequired
{
  return [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"FastSwitchingConfiguration"] != 0;
}

- (float)maxISO
{
  [(FigCaptureSourceVideoFormat *)self minISO];
  float v4 = v3;
  if (v3 > 0.0)
  {
    [(FigCaptureSourceVideoFormat *)self aeMaxGain];
    if (v5 == 0.0)
    {
      objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E4F552A0]), "floatValue");
      float v5 = v6 * 0.0039062;
    }
    return v4 * fmaxf(v5, 1.0);
  }
  return v4;
}

- (float)minISO
{
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", *MEMORY[0x1E4F552B8]), "floatValue");
  float v3 = v2;
  if (v2 == 0.0 && BWCaptureIsRunningInIOSAppOnMacEnvironment()) {
    return 50.0;
  }
  return v3;
}

- (float)aeMaxGain
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"AEMaxGain"];
  [v2 floatValue];
  return result;
}

- (BOOL)isVideoGreenGhostMitigationSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoGreenGhostMitigationSupported"];
  return [v2 BOOLValue];
}

- (BOOL)reactionEffectsProvidedBySource
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ReactionEffectsProvidedBySource"];
  return [v2 BOOLValue];
}

- (float)minPortraitLightingEffectStrength
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"MinPortraitLightingEffectStrength"];
  if (!v2) {
    return NAN;
  }
  [v2 floatValue];
  return result;
}

- (float)zoomFactorUpscaleThreshold
{
  unint64_t v3 = -[FigCaptureSourceVideoFormat _visibleSensorDimensionsIncludingCinematic:]((id *)&self->super.super.isa, 0);
  int v4 = v3;
  unint64_t v5 = HIDWORD(v3);
  unint64_t v6 = -[FigCaptureSourceVideoFormat _outputDimensions]((unint64_t)self);
  return fmaxf(fminf((float)v4 / (float)(int)v6, (float)(int)v5 / (float)SHIDWORD(v6)), 1.0);
}

- (float)maxZoomFactor
{
  if ([(FigCaptureSourceVideoFormat *)self stabilizationTypeOverrideForCinematic] == 3|| [(FigCaptureSourceVideoFormat *)self stabilizationTypeOverrideForStandard] == 3)
  {
    unint64_t v3 = -[FigCaptureSourceVideoFormat _outputDimensions]((unint64_t)self);
    float result = 32.0;
    if (v3 != 960 && HIDWORD(v3) != 540)
    {
      float result = 30.0;
      if (v3 != 1024 && HIDWORD(v3) != 768)
      {
        float result = 24.0;
        if (v3 != 1280 && HIDWORD(v3) != 720)
        {
          float result = 16.0;
          BOOL v5 = HIDWORD(v3) == 2160 || v3 == 3840;
          float v6 = 9.0;
          if (!v5) {
            float v6 = 16.0;
          }
          if (HIDWORD(v3) == 1080) {
            float v6 = 16.0;
          }
          if (v3 != 1920) {
            return v6;
          }
        }
      }
    }
  }
  else
  {
    unint64_t v7 = -[FigCaptureSourceVideoFormat _visibleSensorDimensionsIncludingCinematic:]((id *)&self->super.super.isa, 1);
    return fminf((float)(int)v7 * 0.0625, (float)SHIDWORD(v7) * 0.0625);
  }
  return result;
}

- (unint64_t)_visibleSensorDimensionsIncludingCinematic:(id *)a1
{
  if (!a1) {
    return 0;
  }
  unint64_t v4 = -[FigCaptureSourceVideoFormat _maxUseableSensorDimensions](a1);
  if (a2 && [a1 isStabilizationModeSupported:2])
  {
    [a1 stabilizationOverscanPercentageOverrideForCinematic];
    double v7 = v6 / 100.0;
    double v8 = v7 + 1.0;
    BOOL v9 = v7 == 0.0;
    double v10 = 1.2;
  }
  else
  {
    if (![a1 isStabilizationModeSupported:1]) {
      return v4;
    }
    [a1 stabilizationOverscanPercentageOverrideForStandard];
    double v12 = v11 / 100.0;
    double v8 = v12 + 1.0;
    BOOL v9 = v12 == 0.0;
    double v10 = 1.1;
  }
  if (!v9) {
    double v10 = v8;
  }
  float v13 = v10;
  double v14 = (float)(1.0 / v13);
  LODWORD(v5) = llround((double)SHIDWORD(v4) * v14 * 0.5);
  return (2 * llround((double)(int)v4 * v14 * 0.5)) | (unint64_t)(v5 << 33);
}

- (BOOL)isStabilizationModeSupported:(int)a3
{
  switch(a3)
  {
    case 0:
      LOBYTE(v4) = 1;
      return (char)v4;
    case 1:
      formatDictionary = self->super._formatDictionary;
      float v6 = @"VideoStabilizationSupported";
      goto LABEL_11;
    case 2:
      LODWORD(v4) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"VideoStabilizationSupported"), "BOOLValue");
      if (!v4) {
        return (char)v4;
      }
      formatDictionary = self->super._formatDictionary;
      float v6 = @"CinematicVideoStabilizationSupported";
LABEL_11:
      id v9 = [(NSDictionary *)formatDictionary objectForKeyedSubscript:v6];
      LOBYTE(v4) = [v9 BOOLValue];
      return (char)v4;
    case 3:
      LODWORD(v4) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"VideoStabilizationSupported"), "BOOLValue");
      if (!v4) {
        return (char)v4;
      }
      LODWORD(v4) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"CinematicVideoStabilizationSupported"), "BOOLValue");
      if (!v4) {
        return (char)v4;
      }
      double v7 = self->super._formatDictionary;
      double v8 = @"CinematicVideoStabilizationExtendedLookAheadDuration";
      goto LABEL_17;
    case 4:
      formatDictionary = self->super._formatDictionary;
      float v6 = @"PreviewStabilizationSupported";
      goto LABEL_11;
    case 5:
      LODWORD(v4) = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"VideoStabilizationSupported"), "BOOLValue");
      if (!v4) {
        return (char)v4;
      }
      id v4 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"CinematicVideoStabilizationExtendedLookAheadDuration"];
      if (!v4) {
        return (char)v4;
      }
      double v7 = self->super._formatDictionary;
      double v8 = @"CinematicVideoStabilizationExtendedEnhancedSupported";
LABEL_17:
      LOBYTE(v4) = [(NSDictionary *)v7 objectForKeyedSubscript:v8] != 0;
      return (char)v4;
    default:
      LOBYTE(v4) = 0;
      return (char)v4;
  }
}

- (int)stabilizationTypeOverrideForCinematic
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoStabilizationTypeOverrideForCinematic"];
  return [v2 intValue];
}

- (int)stabilizationTypeOverrideForStandard
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoStabilizationTypeOverrideForStandard"];
  return [v2 intValue];
}

- (float)stabilizationOverscanPercentageOverrideForCinematic
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoStabilizationOverscanPercentageOverrideForCinematic"];
  [v2 floatValue];
  return result;
}

- (float)stabilizationOverscanPercentageOverrideForStandard
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoStabilizationOverscanPercentageOverrideForStandard"];
  [v2 floatValue];
  return result;
}

- (BOOL)distortionCompensationSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"DistortionCompensationSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isIrisVideoStabilizationSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"IrisVideoStabilizationSupported"];
  return [v2 BOOLValue];
}

- (float)cinematicStabilizationExtendedLookAheadDuration
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"CinematicVideoStabilizationExtendedLookAheadDuration"];
  [v2 floatValue];
  return result;
}

- (BOOL)isVideoSTFSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoSTFSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isIrisSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"IrisSupported"];
  return [v2 BOOLValue];
}

- (BOOL)usesPacked10BitFirmwareStillImageOutputPixelFormat
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"UsesPacked10BitFirmwareStillImageOutputPixelFormat"];
  return [v2 BOOLValue];
}

- (uint64_t)_supportsDepthDataFormatForDisparity:(int)a3 streaming:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = *(void **)(result + 136);
    float result = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
          if (!a3 || ([*(id *)(*((void *)&v11 + 1) + 8 * v8) isStillImageOnlyDepthData] & 1) == 0)
          {
            int v10 = [v9 format];
            if (a2)
            {
              if (FigDepthFormatIsDisparity(v10)) {
                return 1;
              }
            }
            else if (FigDepthFormatIsDepth(v10))
            {
              return 1;
            }
          }
          ++v8;
        }
        while (v6 != v8);
        float result = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        uint64_t v6 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (BOOL)isHDRSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"HDRSupported"];
  return [v2 BOOLValue];
}

- (id)fullBinSIFRCompanionFormat
{
  return self->_fullBinSIFRCompanionFormat;
}

- (BOOL)gdcInStillImageSinkPipelineSupported
{
  return [(FigCaptureSourceVideoFormat *)self stillImageGDCSourceMode] != 0;
}

- (int)stillImageGDCSourceMode
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"StillImageGDCSourceMode"];
  return [v2 intValue];
}

- (id)depthCompanionFormat
{
  return self->_depthCompanionFormat;
}

- (BOOL)isZeroShutterLagSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ZeroShutterLagSupported"];
  return [v2 BOOLValue];
}

- ($2825F4736939C4A6D3AD43837233062D)previewDimensions
{
  p_previewDimensions = ($2825F4736939C4A6D3AD43837233062D *)&self->_previewDimensions;
  if (!self->_previewDimensions.width)
  {
    int v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"PreferredPreviewWidth"), "intValue");
    int v5 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"PreferredPreviewHeight"), "intValue");
    p_previewDimensions->unsigned int var0 = v4;
    p_previewDimensions->var1 = v5;
    if (!v4)
    {
      $2825F4736939C4A6D3AD43837233062D v6 = [(FigCaptureSourceFormat *)self dimensions];
      if ([(FigCaptureSourceVideoFormat *)self cinematicFramingOutputDimensions]&& (unint64_t)[(FigCaptureSourceVideoFormat *)self cinematicFramingOutputDimensions] >> 32)
      {
        $2825F4736939C4A6D3AD43837233062D v6 = [(FigCaptureSourceVideoFormat *)self cinematicFramingOutputDimensions];
      }
      $2825F4736939C4A6D3AD43837233062D *p_previewDimensions = ($2825F4736939C4A6D3AD43837233062D)FigCaptureOptimalVideoPreviewDimensionsForSourceDimensions(*(void *)&v6, 0);
    }
  }
  return *p_previewDimensions;
}

- (BOOL)zeroShutterLagRequiresUserInitiatedCaptureRequestTime
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ZeroShutterLagRequiresUserInitiatedCaptureRequestTime"];
  return [v2 BOOLValue];
}

- (BOOL)isZeroShutterLagWithDepthSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ZeroShutterLagWithDepthSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isRedEyeReductionSupported
{
  return [(FigCaptureSourceVideoFormat *)self redEyeReductionVersion] > 0;
}

- (int)redEyeReductionVersion
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"RedEyeReductionVersion"];
  return [v2 intValue];
}

- (BOOL)isNonDestructiveCropSupported
{
  return 1;
}

- (BOOL)isMomentCaptureMovieRecordingSupported
{
  return 1;
}

- (float)maxPortraitLightingEffectStrength
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"MaxPortraitLightingEffectStrength"];
  if (!v2) {
    return NAN;
  }
  [v2 floatValue];
  return result;
}

- (BOOL)configureForNonDisruptiveFullBinSIFRSwitching
{
  formatDictionary = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"FastSwitchingConfiguration"];
  if (!formatDictionary) {
    formatDictionary = self->super._formatDictionary;
  }
  id v4 = [(NSDictionary *)formatDictionary objectForKeyedSubscript:@"ConfigureForNonDisruptiveFullBinSIFRSwitching"];
  return [v4 BOOLValue];
}

- (float)variableFrameRateVideoCaptureFromFWAEMaxGain
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VariableFrameRateVideoCaptureFromFWAEMaxGain"];
  [v2 floatValue];
  return result;
}

- (int)sifrBinningFactorOverrideForNondisruptiveSwitching
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SIFRBinningFactorOverrideForNondisruptiveSwitching"];
  return [v2 intValue];
}

- (id)quadraSubPixelSwitchingParameters
{
  return [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"QuadraSubPixelSwitchingParameters"];
}

- (float)lowLightVideoAEMaxGain
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"LowLightVideoAEMaxGain"];
  [v2 floatValue];
  return result;
}

- (BOOL)ispChromaNoiseReductionEnabled
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ISPChromaNoiseReduction"];
  return [v2 BOOLValue];
}

- (BOOL)isVideoHDRFusionSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoHDRFusionSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isMultiIlluminantWhiteBalanceSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"MultiIlluminantWhiteBalanceSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isContentAwareEnhancementSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ContentAwareEnhancementSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isContentAwareAWBSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ContentAwareAWBSupported"];
  return [v2 BOOLValue];
}

- (int)fesBinningFactorHorizontal
{
  int result = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"FESBinningFactorHorizontal"), "intValue");
  if (result <= 1) {
    return 1;
  }
  return result;
}

- (int)maxIntegrationTimeOverride
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"MaxIntegrationTimeOverride"];
  return [v2 intValue];
}

- (BOOL)isUltraHighResolutionZeroShutterLagSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"UltraHighResolutionZeroShutterLagSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isSemanticStyleRenderingSupported
{
  if ([(FigCaptureSourceVideoFormat *)self isPhotoFormat]
    || (int v3 = [(FigCaptureSourceVideoFormat *)self isLearnedNRSupported]) != 0)
  {
    int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"SemanticStyleRenderingSupported"), "BOOLValue");
    if (v3) {
      LOBYTE(v3) = ![(FigCaptureSourceVideoFormat *)self isSmartStyleRenderingSupported];
    }
  }
  return v3;
}

- (BOOL)isLearnedNRSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"LearnedNRSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isStudioAndContourPreviewRenderingSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"StudioAndContourPreviewRenderingSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isStagePreviewRenderingSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"StagePreviewRenderingSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isVideoGreenGhostMitigationUsesLightSourceMaskAndKeypointDescriptorData
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoGreenGhostMitigationUsesLightSourceMaskAndKeypointDescriptorData"];
  return [v2 BOOLValue];
}

- (unsigned)supportedRawPixelFormat
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SupportedRawPixelFormat"];
  return [v2 intValue];
}

- (BOOL)shouldPreferSIFRFormatWithHighlightRecoveryEnabled:(BOOL)a3
{
  BOOL v5 = [(FigCaptureSourceVideoFormat *)self isSIFRSupported];
  if (v5 && !a3) {
    LOBYTE(v5) = [(FigCaptureSourceVideoFormat *)self nonSIFRCompanionFormat] == 0;
  }
  return v5;
}

- (BOOL)isSIFRSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:*MEMORY[0x1E4F552D8]];
  return [v2 BOOLValue];
}

- (CGPoint)sensorCenterOffset
{
  double v3 = (double)(int)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"SensorCenterOffsetX"), "intValue");
  double v4 = (double)(int)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"SensorCenterOffsetY"), "intValue");
  double v5 = v3;
  result.y = v4;
  result.x = v5;
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)fesInputCropDimensions
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"FESInputCropWidth"), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"FESInputCropHeight"), "intValue") << 32));
}

- (id)ultraHighResCompanionFormat
{
  return self->_ultraHighResCompanionFormat;
}

- (int)formatIndex
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"Index"];
  if (!v2) {
    return -1;
  }
  return [v2 intValue];
}

- ($2825F4736939C4A6D3AD43837233062D)cropDimensionsForFES
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"CropWidthForFES"), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"CropHeightForFES"), "intValue") << 32));
}

- (id)frontEndScalerCompanionFormats
{
  return self->_frontEndScalerCompanionFormats;
}

- (BOOL)isStillImageStabilizationSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SISSupported"];
  return [v2 BOOLValue];
}

- (float)defaultPortraitLightingEffectStrength
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"DefaultPortraitLightingEffectStrength"];
  if (!v2) {
    return NAN;
  }
  [v2 floatValue];
  return result;
}

- (BOOL)isDeepFusionSupported
{
  char v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"DeepFusionSupported"), "BOOLValue");
  [(FigCaptureSourceVideoFormat *)self isPhotoFormat];
  return v3;
}

- (BOOL)intelligentDistortionCorrectionSupported
{
  char v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"IntelligentDistortionCorrectionSupported"), "BOOLValue");
  [(FigCaptureSourceVideoFormat *)self isPhotoFormat];
  return v3;
}

- (float)maxContinuousZoomFactorForDepthDataDelivery
{
  [(FigCaptureSourceVideoFormat *)self clientMaxContinuousZoomFactorForDepthDataDelivery];
  if (result > 0.0) {
    return result + 0.1999;
  }
  return result;
}

- (int)greenGhostMitigationVersion
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"GreenGhostMitigationVersion"];
  return [v2 intValue];
}

- (int)preferredPreviewMaxFrameRate
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"PreferredPreviewMaxFrameRate"];
  return [v2 intValue];
}

- (BOOL)isVideoSTFMetadataEnabled
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoSTFMetadataEnabled"];
  return [v2 BOOLValue];
}

- (BOOL)configureForStillImageStabilizationSupport
{
  formatDictionary = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"FastSwitchingConfiguration"];
  if (!formatDictionary) {
    formatDictionary = self->super._formatDictionary;
  }
  id v4 = [(NSDictionary *)formatDictionary objectForKeyedSubscript:@"ConfigureForSISSupport"];
  return [v4 BOOLValue];
}

- (BOOL)configureForSoftISPSupport
{
  formatDictionary = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"FastSwitchingConfiguration"];
  if (!formatDictionary) {
    formatDictionary = self->super._formatDictionary;
  }
  id v4 = [(NSDictionary *)formatDictionary objectForKeyedSubscript:@"ConfigureForSoftISPSupport"];
  return [v4 BOOLValue];
}

- (int)configureForGreenGhostMitigationVersion
{
  formatDictionary = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"FastSwitchingConfiguration"];
  if (!formatDictionary) {
    formatDictionary = self->super._formatDictionary;
  }
  id v4 = [(NSDictionary *)formatDictionary objectForKeyedSubscript:@"ConfigureForGreenGhostMitigationVersion"];
  return [v4 intValue];
}

- (BOOL)configureForStereoPhotoCaptureSupport
{
  return 0;
}

- (BOOL)configureForSpatialOverCaptureSupport
{
  formatDictionary = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"FastSwitchingConfiguration"];
  if (!formatDictionary) {
    formatDictionary = self->super._formatDictionary;
  }
  id v4 = [(NSDictionary *)formatDictionary objectForKeyedSubscript:@"ConfigureForSpatialOverCaptureSupport"];
  return [v4 BOOLValue];
}

- (BOOL)configureForDigitalFlashSupport
{
  formatDictionary = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"FastSwitchingConfiguration"];
  if (!formatDictionary) {
    formatDictionary = self->super._formatDictionary;
  }
  id v4 = [(NSDictionary *)formatDictionary objectForKeyedSubscript:@"ConfigureForDigitalFlashSupport"];
  return [v4 BOOLValue];
}

- (BOOL)configureForDepthDataDelivery
{
  formatDictionary = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"FastSwitchingConfiguration"];
  if (!formatDictionary) {
    formatDictionary = self->super._formatDictionary;
  }
  id v4 = [(NSDictionary *)formatDictionary objectForKeyedSubscript:@"ConfigureForDepthDataDelivery"];
  return [v4 BOOLValue];
}

- (float)spatialOverCapturePercentage
{
  BOOL v2 = [(FigCaptureSourceVideoFormat *)self isSpatialOverCaptureSupported];
  float result = 40.0;
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (BOOL)isSpatialOverCaptureSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SpatialOverCaptureSupported"];
  return [v2 BOOLValue];
}

- (BOOL)swfrSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SWFRSupported"];
  return [v2 BOOLValue];
}

- (CGRect)maxVisibleSensorRect
{
  unint64_t v3 = -[FigCaptureSourceVideoFormat _maxUseableSensorDimensions]((id *)&self->super.super.isa);
  $2825F4736939C4A6D3AD43837233062D v4 = [(FigCaptureSourceVideoFormat *)self sensorDimensions];
  if (FigCaptureVideoDimensionsAreValid([(FigCaptureSourceVideoFormat *)self preGDCSensorCropDimensions])) {
    unint64_t v3 = [(FigCaptureSourceVideoFormat *)self preGDCSensorCropDimensions];
  }
  unint64_t v5 = HIDWORD(v3);
  if (v4.var0 > (int)v3 || (double v6 = 0.0, v4.var1 > SHIDWORD(v3)))
  {
    double v7 = (double)((v4.var0 - (int)v3) / 2);
    int v8 = v4.var1 - HIDWORD(v3);
    if (v4.var1 < SHIDWORD(v3)) {
      ++v8;
    }
    double v6 = (double)(v8 >> 1);
  }
  else
  {
    LODWORD(v5) = v4.var1;
    LODWORD(v3) = v4.var0;
    double v7 = 0.0;
  }
  double v9 = (double)(int)v3;
  double v10 = (double)(int)v5;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v6;
  result.origin.x = v7;
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)preGDCSensorCropDimensions
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"PreGDCSensorCropWidth"), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"PreGDCSensorCropHeight"), "intValue") << 32));
}

- (BOOL)sushiRawSupported
{
  id v3 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SushiRawSupported"];
  formatDictionary = self->super._formatDictionary;
  if (!v3) {
    return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", @"SupportedRawPixelFormat"), "intValue") != 0;
  }
  id v5 = [(NSDictionary *)formatDictionary objectForKeyedSubscript:@"SushiRawSupported"];
  return [v5 BOOLValue];
}

- (int)previewImageQueueSyncStrategy
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"PreviewImageQueueSyncStrategy"];
  return [v2 intValue];
}

- (unsigned)internalDemosaicedRawPixelFormat
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"InternalDemosaicedRawPixelFormat"), "intValue");
  [(FigCaptureSourceVideoFormat *)self isPhotoFormat];
  return v3;
}

- (int)autoFocusSystem
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"AutoFocusSystem"];
  return [v2 intValue];
}

- (id)digitalFlashDetectedObjectTypes
{
  return [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"DigitalFlashDetectedObjectTypes"];
}

- (BOOL)isStereoFusionSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"StereoFusionSupported"];
  return [v2 BOOLValue];
}

- (int)temporalNoiseReductionMode
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"TemporalNoiseReductionMode"];
  return [v2 intValue];
}

- (BOOL)isWideDigitalFlashAvailableShallowDepthOfFieldEffectsEnabled
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"WideDigitalFlashAvailableShallowDepthOfFieldEffectsEnabled"];
  return [v2 BOOLValue];
}

- (BOOL)isWideAsStatsMasterEnabled
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"WideAsStatsMasterEnabled"), "intValue") != 0;
}

- (BOOL)isStillImageISPMultiBandNoiseReductionSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"StillImageISPMultiBandNoiseReductionSupported"];
  return [v2 BOOLValue];
}

- (BOOL)fullBinSIFROnSecondaryCameraAllowed
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"FullBinSIFROnSecondaryCameraAllowed"];
  return [v2 BOOLValue];
}

- (BOOL)isSecondaryScalerUnavailable
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SecondaryScalerUnavailable"];
  return [v2 BOOLValue];
}

- ($2825F4736939C4A6D3AD43837233062D)nativeDimensions
{
  if ([(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"CropWidthForFES"]&& [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"CropHeightForFES"])
  {
    unsigned int var0 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"CropWidthForFES"), "intValue");
    formatDictionary = self->super._formatDictionary;
    id v5 = @"CropHeightForFES";
  }
  else
  {
    uint64_t v6 = *MEMORY[0x1E4F552B0];
    if ([(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:*MEMORY[0x1E4F552B0]]&& (double v7 = (__CFString *)*MEMORY[0x1E4F552A8], [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:*MEMORY[0x1E4F552A8]]))
    {
      unsigned int var0 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", v6), "intValue");
      formatDictionary = self->super._formatDictionary;
      id v5 = v7;
    }
    else
    {
      if (![(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SensorCropWidth"]|| ![(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SensorCropHeight"])
      {
        $2825F4736939C4A6D3AD43837233062D v9 = [(FigCaptureSourceVideoFormat *)self sensorDimensions];
        unsigned int var0 = v9.var0;
        uint64_t v8 = HIDWORD(*(unint64_t *)&v9);
        return ($2825F4736939C4A6D3AD43837233062D)(var0 | (unint64_t)(v8 << 32));
      }
      unsigned int var0 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"SensorCropWidth"), "intValue");
      formatDictionary = self->super._formatDictionary;
      id v5 = @"SensorCropHeight";
    }
  }
  uint64_t v8 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](formatDictionary, "objectForKeyedSubscript:", v5), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(var0 | (unint64_t)(v8 << 32));
}

- (unsigned)supportedDemosaicedRawPixelFormat
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"SupportedDemosaicedRawPixelFormat"), "intValue");
  [(FigCaptureSourceVideoFormat *)self isPhotoFormat];
  return v3;
}

- (BOOL)isDigitalFlashSupported
{
  char v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"DigitalFlashSupported"), "BOOLValue");
  [(FigCaptureSourceVideoFormat *)self isPhotoFormat];
  return v3;
}

+ (void)initialize
{
}

- (BOOL)semanticRenderingSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SemanticRenderingSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isResponsiveShutterSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ResponsiveShutterSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isDigitalFlashRawNightModeSupported
{
  char v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"DigitalFlashRawNightModeSupported"), "BOOLValue");
  [(FigCaptureSourceVideoFormat *)self isPhotoFormat];
  return v3;
}

- (BOOL)isCaptureTimePhotoCurationSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"CaptureTimePhotoCurationSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isGainMapSupported
{
  char v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"GainMapSupported"), "BOOLValue");
  [(FigCaptureSourceVideoFormat *)self isPhotoFormat];
  return v3;
}

- (BOOL)isDeepZoomSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"DeepZoomSupported"];
  return [v2 BOOLValue];
}

- (CGSize)stabilizationOverscanFromSensorForFESCropDimensions:(id)a3 preferSIFRFormat:(BOOL)a4 geometricDistortionCorrection:(BOOL)a5 useFESCompanionIndex:(BOOL)a6
{
  int var0 = a3.var0;
  int var1 = a3.var1;
  $2825F4736939C4A6D3AD43837233062D v10 = [(FigCaptureSourceVideoFormat *)self sensorCropDimensions];
  unint64_t v11 = HIDWORD(*(unint64_t *)&v10);
  int v12 = v10.var0;
  unint64_t v13 = -[FigCaptureSourceVideoFormat _highQualitySensorDimensions]((unint64_t)self);
  if (!a4)
  {
    if ([(FigCaptureSourceVideoFormat *)self nonSIFRCompanionFormat])
    {
      uint64_t v14 = objc_msgSend(-[FigCaptureSourceVideoFormat nonSIFRCompanionFormat](self, "nonSIFRCompanionFormat"), "sensorCropDimensions");
      if (v14 != 0 && HIDWORD(v14) != 0)
      {
        int v12 = v14;
        LODWORD(v11) = HIDWORD(v14);
      }
    }
  }
  uint64_t v15 = (double *)MEMORY[0x1E4F1DB30];
  if (!v12 || !v11)
  {
    $2825F4736939C4A6D3AD43837233062D v16 = [(FigCaptureSourceVideoFormat *)self sensorDimensions];
    int v12 = v16.var0;
    unint64_t v11 = HIDWORD(*(unint64_t *)&v16);
  }
  double v17 = *v15;
  BOOL v18 = var0 > 0;
  BOOL v19 = var1 > 0;
  BOOL v20 = !v18 || !v19;
  if (v18 && v19) {
    int v21 = var0;
  }
  else {
    int v21 = v12;
  }
  if (v20) {
    int v22 = v11;
  }
  else {
    int v22 = var1;
  }
  if ((int)v13 >= 1 && v21 > (int)v13) {
    double v17 = (double)v21 / (double)(int)v13 + -1.0;
  }
  double v23 = v15[1];
  if (SHIDWORD(v13) >= 1 && v22 > SHIDWORD(v13)) {
    double v23 = (double)v22 / (double)SHIDWORD(v13) + -1.0;
  }
  result.height = v23;
  result.width = v17;
  return result;
}

- (unint64_t)_highQualitySensorDimensions
{
  if (result)
  {
    unint64_t v1 = result;
    unsigned int v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 8), "objectForKeyedSubscript:", @"HighQualitySensorWidth"), "intValue");
    return v2 | (unint64_t)(objc_msgSend((id)objc_msgSend(*(id *)(v1 + 8), "objectForKeyedSubscript:", @"HighQualitySensorHeight"), "intValue") << 32);
  }
  return result;
}

- (id)nonSIFRCompanionFormat
{
  return self->_nonSIFRCompanionFormat;
}

- (BOOL)isFocusPixelBlurScoreSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"FocusPixelBlurScoreSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isSIFRStillImageCaptureWithDepthDataDisabled
{
  char v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"SIFRStillImageCaptureWithDepthDataDisabled"), "BOOLValue");
  [(FigCaptureSourceVideoFormat *)self isPhotoFormat];
  return v3;
}

- (BOOL)isStereoPhotoCaptureSupported
{
  char v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"StereoPhotoCaptureSupported"), "BOOLValue");
  [(FigCaptureSourceVideoFormat *)self isPhotoFormat];
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureSourceVideoFormat)initWithCoder:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "decodePropertyListForKey:", objc_msgSend(NSString, "stringWithUTF8String:", "formatDictionary"));
  return [(FigCaptureSourceVideoFormat *)self initWithFigCaptureStreamFormatDictionary:v4];
}

- (void)encodeWithCoder:(id)a3
{
  formatDictionary = self->super._formatDictionary;
  uint64_t v5 = [NSString stringWithUTF8String:"formatDictionary"];
  [a3 encodeObject:formatDictionary forKey:v5];
}

- ($2825F4736939C4A6D3AD43837233062D)geometricDistortionCorrectedNativeDimensions
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"GeometricDistortionCorrectedNativeWidth"), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"GeometricDistortionCorrectedNativeHeight"), "intValue") << 32));
}

- (BOOL)isPocketDetectionSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"PocketDetectionSupported"];
  return [v2 BOOLValue];
}

- (BOOL)temporalNoiseReductionBand0Disabled
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"TemporalNoiseReductionBand0Disabled"];
  return [v2 BOOLValue];
}

- (BOOL)temporalNoiseReductionRawEnabled
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"TemporalNoiseReductionRawEnabled"];
  return [v2 BOOLValue];
}

- (float)depthDataAEMaxGain
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"DepthDataAEMaxGain"];
  [v2 floatValue];
  return result;
}

- (float)depthDataMaxIntegrationTimeOverride
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"DepthDataMaxIntegrationTimeOverride"];
  [v2 floatValue];
  return result;
}

- (float)stereoVideoAEMaxGain
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"StereoVideoAEMaxGain"];
  [v2 floatValue];
  return result;
}

- (id)midFrameSynchronizationOptimizedCompanionFormat
{
  return self->_midFrameSynchronizationOptimizedCompanionFormat;
}

- (id)actionCameraCompanionFormat
{
  return self->_actionCameraCompanionFormat;
}

- (id)fsdNetCompanionFormat
{
  return self->_fsdNetCompanionFormat;
}

- (id)stereoVideoCompanionFormat
{
  return self->_stereoVideoCompanionFormat;
}

- ($2825F4736939C4A6D3AD43837233062D)cinematicFramingOutputDimensions
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"CinematicFramingOutputWidth"), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"CinematicFramingOutputHeight"), "intValue") << 32));
}

- (int)sensorHDRCompanionIndex
{
  if (![(FigCaptureSourceVideoFormat *)self hasSensorHDRCompanionIndex]) {
    return -1;
  }
  id v3 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SensorHDRCompanionIndex"];
  return [v3 intValue];
}

- (BOOL)prefersSensorHDREnabled
{
  if ([(FigCaptureSourceVideoFormat *)self isQuadraHighResStillImageSupported]) {
    return 0;
  }
  id v4 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"PrefersSensorHDR"];
  return [v4 BOOLValue];
}

- (float)stabilizationOverscanPercentageOverrideForCinematicExtendedEnhanced
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VideoStabilizationOverscanPercentageOverrideForCinematicExtendedEnhanced"];
  [v2 floatValue];
  return result;
}

- (BOOL)configureForSupplementalTimeOfFlightCameraSupport
{
  formatDictionary = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"FastSwitchingConfiguration"];
  if (!formatDictionary) {
    formatDictionary = self->super._formatDictionary;
  }
  id v4 = [(NSDictionary *)formatDictionary objectForKeyedSubscript:@"ConfigureForSupplementalTimeOfFlightCameraSupport"];
  return [v4 BOOLValue];
}

- (BOOL)isGNRHDRSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"GNRHDRSupported"];
  return [v2 BOOLValue];
}

- (BOOL)isISPMultiBandNoiseReductionSupported
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ISPMultiBandNoiseReductionSupported"];
  return [v2 BOOLValue];
}

- (int)semanticDevelopmentVersion
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SemanticDevelopmentVersion"];
  return [v2 intValue];
}

- (BOOL)isSphereAssistedAutoFocusEnabled
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SphereAssistedAutoFocusEnabled"];
  return [v2 BOOLValue];
}

- ($2825F4736939C4A6D3AD43837233062D)stillImageGDCInDCProcessorOutputCropDimensions
{
  unsigned int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"StillImageGDCInDCProcessorOutputCropWidth"), "intValue");
  return ($2825F4736939C4A6D3AD43837233062D)(v3 | (unint64_t)(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"StillImageGDCInDCProcessorOutputCropHeight"), "intValue") << 32));
}

- (BOOL)isStillImageISPChromaNoiseReductionEnabled
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"StillImageISPChromaNoiseReduction"];
  return [v2 BOOLValue];
}

- (id)rawLensShadingCorrection
{
  return [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"RawLensShadingCorrection"];
}

- (BOOL)sushiRawBlackBorderingEnabled
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"SushiRawBlackBorderingEnabled"];
  return [v2 BOOLValue];
}

- (float)hardwareCost
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"HardwareCost"];
  [v2 floatValue];
  return result;
}

- (int)baseSensorPowerConsumption
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"BaseSensorPowerConsumption"];
  return [v2 intValue];
}

- (int)variableSensorPowerConsumption
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"VariableSensorPowerConsumption"];
  return [v2 intValue];
}

- (int)ispPowerConsumption
{
  id v2 = [(NSDictionary *)self->super._formatDictionary objectForKeyedSubscript:@"ISPPowerConsumption"];
  return [v2 intValue];
}

uint64_t __64__FigCaptureSourceVideoFormat__buildFESCompanionFormatsForType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5 = [a2 fesDimensions];
  if (v5 > (int)[a3 fesDimensions]) {
    return 1;
  }
  int v6 = [a2 fesDimensions];
  if (v6 < (int)[a3 fesDimensions]) {
    return -1;
  }
  unint64_t v8 = (unint64_t)[a2 fesDimensions] >> 32;
  if ((int)v8 > (int)((unint64_t)[a3 fesDimensions] >> 32)) {
    return 1;
  }
  unint64_t v9 = (unint64_t)[a2 fesDimensions] >> 32;
  if ((int)v9 >= (int)((unint64_t)[a3 fesDimensions] >> 32)) {
    return 0;
  }
  else {
    return -1;
  }
}

id __46__FigCaptureSourceVideoFormat__avfcAttributes__block_invoke()
{
  v1[90] = *MEMORY[0x1E4F143B8];
  v1[0] = @"Index";
  v1[1] = @"TemporalNoiseReductionMode";
  v1[2] = @"TemporalNoiseReductionBand0Disabled";
  v1[3] = @"TemporalNoiseReductionRawEnabled";
  v1[4] = @"ISPChromaNoiseReduction";
  v1[5] = @"MaxIntegrationTimeOverride";
  v1[6] = @"DepthDataAEMaxGain";
  v1[7] = @"DepthDataMaxIntegrationTimeOverride";
  v1[8] = @"LowLightVideoAEMaxGain";
  v1[9] = @"DistortionCompensationSupported";
  v1[10] = @"NonSIFRCompanionFormat";
  v1[11] = @"FullBinSIFRCompanionFormat";
  v1[12] = @"MidFrameSynchronizationOptimizedCompanionFormat";
  v1[13] = @"ActionCameraCompanionFormat";
  v1[14] = @"SIFRBinningFactorOverrideForNondisruptiveSwitching";
  v1[15] = @"FullBinSIFROnSecondaryCameraAllowed";
  v1[16] = @"FESCompanionFormats";
  v1[17] = @"DepthCompanionFormat";
  v1[18] = @"UltraHighResCompanionFormat";
  v1[19] = @"FSDNetCompanionFormat";
  v1[20] = @"SensorCenterOffsetX";
  v1[21] = @"SensorCenterOffsetY";
  v1[22] = @"PreGDCSensorCropWidth";
  v1[23] = @"PreGDCSensorCropHeight";
  v1[24] = @"PostGDCCropWidth";
  v1[25] = @"PostGDCCropHeight";
  v1[26] = @"GeometricDistortionCorrectedNativeWidth";
  v1[27] = @"GeometricDistortionCorrectedNativeHeight";
  v1[28] = @"FESInputCropWidth";
  v1[29] = @"FESInputCropHeight";
  v1[30] = @"CropWidthForFES";
  v1[31] = @"CropHeightForFES";
  v1[32] = @"PreviewImageQueueSyncStrategy";
  v1[33] = @"FESBinningFactorHorizontal";
  v1[34] = @"SecondaryScalerUnavailable";
  v1[35] = @"StudioAndContourPreviewRenderingSupported";
  v1[36] = @"StagePreviewRenderingSupported";
  v1[37] = @"WideAsStatsMasterEnabled";
  v1[38] = @"VideoSTFSupported";
  v1[39] = @"VideoSTFMetadataEnabled";
  v1[40] = @"StillImageISPChromaNoiseReduction";
  v1[41] = @"RawLensShadingCorrection";
  v1[42] = @"SupplementalTimeOfFlightCameraSupported";
  v1[43] = @"ConfigureForSISSupport";
  v1[44] = @"ConfigureForSpatialOverCaptureSupport";
  v1[45] = @"ConfigureForDigitalFlashSupport";
  v1[46] = @"ConfigureForSoftISPSupport";
  v1[47] = @"ConfigureForNonDisruptiveFullBinSIFRSwitching";
  v1[48] = @"ConfigureForDepthDataDelivery";
  v1[49] = @"ConfigureForSupplementalTimeOfFlightCameraSupport";
  v1[50] = @"FastSwitchingConfiguration";
  v1[51] = @"FastSwitchingMainCaptureStreamFormat";
  v1[52] = @"GNRHDRSupported";
  v1[53] = @"ISPMultiBandNoiseReductionSupported";
  v1[54] = @"StillImageISPMultiBandNoiseReductionSupported";
  v1[55] = @"ZeroShutterLagRequiresUserInitiatedCaptureRequestTime";
  v1[56] = @"DigitalFlashRawNightModeSupported";
  v1[57] = @"DigitalFlashDetectedObjectTypes";
  v1[58] = @"StillImageGDCInDCProcessorOutputCropWidth";
  v1[59] = @"StillImageGDCInDCProcessorOutputCropHeight";
  v1[60] = @"SIFRStillImageCaptureWithDepthDataDisabled";
  v1[61] = @"SushiRawSupported";
  v1[62] = @"SushiRawBlackBorderingEnabled";
  v1[63] = @"SemanticDevelopmentVersion";
  v1[64] = @"DeepZoomSupported";
  v1[65] = @"GainMapSupported";
  v1[66] = @"CaptureTimePhotoCurationSupported";
  v1[67] = @"StillImageGDCSourceMode";
  v1[68] = @"GreenGhostMitigationVersion";
  v1[69] = @"ConfigureForGreenGhostMitigationVersion";
  v1[70] = @"UsesPacked10BitFirmwareStillImageOutputPixelFormat";
  v1[71] = @"WideDigitalFlashAvailableShallowDepthOfFieldEffectsEnabled";
  v1[72] = @"ContentAwareEnhancementSupported";
  v1[73] = @"ContentAwareAWBSupported";
  v1[74] = @"MultiIlluminantWhiteBalanceSupported";
  v1[75] = @"DepthEngineOutputWidth";
  v1[76] = @"DepthEngineOutputHeight";
  v1[77] = @"RGBIRStereoFusionSupported";
  v1[78] = @"VideoGreenGhostMitigationUsesLightSourceMaskAndKeypointDescriptorData";
  v1[79] = @"PocketDetectionSupported";
  v1[80] = @"VariableFrameRateVideoCaptureFromFWAEMaxGain";
  v1[81] = @"SphereAssistedAutoFocusEnabled";
  v1[82] = @"StereoVideoCompanionFormat";
  v1[83] = @"StereoVideoAEMaxGain";
  v1[84] = @"PreferredPreviewMaxFrameRate";
  v1[85] = @"AdditionalHorizontalFOVCropMultiplier";
  v1[86] = @"ActionCameraAEMaxGainScaleFactor";
  v1[87] = @"SWFRSupported";
  v1[88] = @"SemanticRenderingSupported";
  v1[89] = @"QuadraSubPixelSwitchingParameters";
  id result = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v1 count:90];
  _avfcAttributes_sInternalKeys = (uint64_t)result;
  return result;
}

- (BOOL)isCompatibleWithInfraredFormat:(id)a3
{
  unsigned int v4 = [(FigCaptureSourceFormat *)self format];
  return v4 == [a3 format];
}

- (float)actionCameraAEMaxGainScaleFactor
{
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->super._formatDictionary, "objectForKeyedSubscript:", @"ActionCameraAEMaxGainScaleFactor"), "floatValue");
  if (result == 0.0) {
    return 1.0;
  }
  return result;
}

@end