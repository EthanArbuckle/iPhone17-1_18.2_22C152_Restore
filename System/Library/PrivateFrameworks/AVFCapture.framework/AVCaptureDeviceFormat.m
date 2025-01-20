@interface AVCaptureDeviceFormat
+ (void)initialize;
- ($2825F4736939C4A6D3AD43837233062D)defaultPhotoDimensionsWithHighResolutionCaptureEnabled:(BOOL)a3;
- ($2825F4736939C4A6D3AD43837233062D)previewDimensions;
- ($2825F4736939C4A6D3AD43837233062D)sensorDimensions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultActiveMaxFrameDurationForSessionPreset:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultActiveMinFrameDurationForSessionPreset:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)highestSupportedVideoFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lowestSupportedVideoFrameDuration;
- (AVCaptureAutoFocusSystem)autoFocusSystem;
- (AVCaptureDeviceFormat)initWithFigCaptureSourceFormat:(id)a3 fcSourceAttributes:(id)a4;
- (AVExposureBiasRange)systemRecommendedExposureBiasRange;
- (AVFrameRateRange)videoFrameRateRangeForCenterStage;
- (AVFrameRateRange)videoFrameRateRangeForPortraitEffect;
- (AVFrameRateRange)videoFrameRateRangeForReactionEffectsInProgress;
- (AVFrameRateRange)videoFrameRateRangeForStudioLight;
- (AVMediaType)mediaType;
- (AVZoomRange)systemRecommendedVideoZoomRange;
- (BOOL)isAutoVideoFrameRateSupported;
- (BOOL)isBackgroundBlurApertureSupported;
- (BOOL)isBackgroundBlurSupportedForContinuityCamera;
- (BOOL)isBackgroundReplacementSupported;
- (BOOL)isBackgroundReplacementSupportedForContinuityCamera;
- (BOOL)isCameraCalibrationDataDeliverySupported;
- (BOOL)isCenterStageSupported;
- (BOOL)isCenterStageSupportedForContinuityCamera;
- (BOOL)isConstantColorSupported;
- (BOOL)isContentAwareDistortionCorrectionSupported;
- (BOOL)isContinuousZoomWithDepthEnabled;
- (BOOL)isContinuousZoomWithDepthSupported;
- (BOOL)isDCProcessingWithDepthSupported;
- (BOOL)isDeepFusionSupported;
- (BOOL)isDefaultActiveFormat;
- (BOOL)isDeferredPhotoProcessingSupported;
- (BOOL)isDemosaicedRawConfigurationWithDepthSupported;
- (BOOL)isDemosaicedRawSupported;
- (BOOL)isDigitalFlashSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExperimental;
- (BOOL)isFastCapturePrioritizationSupported;
- (BOOL)isGlobalToneMappingSupported;
- (BOOL)isHDRSupported;
- (BOOL)isHighPhotoQualitySupported;
- (BOOL)isHighestPhotoQualitySupported;
- (BOOL)isIrisSupported;
- (BOOL)isIrisVideoStabilizationSupported;
- (BOOL)isLowLightVideoCaptureSupported;
- (BOOL)isManualFramingSupported;
- (BOOL)isMomentCaptureMovieRecordingSupported;
- (BOOL)isMultiCamSupported;
- (BOOL)isNonDestructiveCropSupported;
- (BOOL)isPhotoFormat;
- (BOOL)isPortraitAutoSuggestSupported;
- (BOOL)isPortraitEffectSupported;
- (BOOL)isPortraitEffectsMatteStillImageDeliverySupported;
- (BOOL)isSISSupported;
- (BOOL)isSemanticStyleRenderingSupported;
- (BOOL)isSmartStyleRenderingSupported;
- (BOOL)isSpatialOverCaptureSupported;
- (BOOL)isSpatialVideoCaptureSupported;
- (BOOL)isStereoFusionSupported;
- (BOOL)isStillImageDepthSupported;
- (BOOL)isStillImageDisparitySupported;
- (BOOL)isStreamingDepthSupported;
- (BOOL)isStreamingDisparitySupported;
- (BOOL)isStudioLightSupported;
- (BOOL)isStudioLightingIntensitySupported;
- (BOOL)isStudioLightingSupportedForContinuityCamera;
- (BOOL)isUltraHighResolutionZeroShutterLagSupported;
- (BOOL)isVariableFrameRateVideoCaptureSupported;
- (BOOL)isVideoBinned;
- (BOOL)isVideoGreenGhostMitigationSupported;
- (BOOL)isVideoHDRSupported;
- (BOOL)isVideoHDRSuspensionSupported;
- (BOOL)isVideoStabilizationModeSupported:(AVCaptureVideoStabilizationMode)videoStabilizationMode;
- (BOOL)isVideoStabilizationStrengthSupported:(int64_t)a3;
- (BOOL)isVideoStabilizationSupported;
- (BOOL)isVisionDataDeliverySupported;
- (BOOL)isWideColorSupported;
- (BOOL)isZeroShutterLagSupported;
- (BOOL)isZeroShutterLagWithDepthSupported;
- (BOOL)maxPhotoDimensionsAreUltraHighResolution:(id)a3 privateDimensionsEnabled:(BOOL)a4;
- (BOOL)prefersVideoHDREnabledForSessionPreset:(id)a3;
- (BOOL)reactionEffectsSupported;
- (BOOL)reactionEffectsSupportedForContinuityCamera;
- (BOOL)supportsHighResolutionStillImageOutput;
- (BOOL)supportsQuadraHighResolutionStillImageOutput;
- (BOOL)supportsRedEyeReduction;
- (BOOL)validateMaxPhotoDimensions:(id)a3 privateDimensionsEnabled:(BOOL)a4;
- (BOOL)zoomFactorsOutsideOfVideoZoomRangesForDepthDeliverySupported;
- (CGFloat)videoMaxZoomFactor;
- (CGFloat)videoMaxZoomFactorForCenterStage;
- (CGFloat)videoMaxZoomFactorForDepthDataDelivery;
- (CGFloat)videoMinZoomFactorForCenterStage;
- (CGFloat)videoMinZoomFactorForDepthDataDelivery;
- (CGFloat)videoZoomFactorUpscaleThreshold;
- (CMFormatDescriptionRef)formatDescription;
- (CMTime)maxExposureDuration;
- (CMTime)minExposureDuration;
- (CMVideoDimensions)highResolutionStillImageDimensions;
- (NSArray)secondaryNativeResolutionZoomFactors;
- (NSArray)supportedColorSpaces;
- (NSArray)supportedDepthDataFormats;
- (NSArray)supportedMaxPhotoDimensions;
- (NSArray)supportedVideoZoomFactorsForDepthDataDelivery;
- (NSArray)supportedVideoZoomRangesForDepthDataDelivery;
- (NSArray)unsupportedCaptureOutputClasses;
- (NSArray)videoSupportedFrameRateRanges;
- (double)focalLengthIn35mmFilmWithGeometricDistortionCorrection:(BOOL)a3;
- (double)videoMaxZoomFactorForCameraCalibrationDataDelivery;
- (double)videoMinZoomFactorForCameraCalibrationDataDelivery;
- (float)defaultPortraitLightingEffectStrength;
- (float)defaultSimulatedAperture;
- (float)geometricDistortionCorrectedVideoFieldOfView;
- (float)hardwareCost;
- (float)maxISO;
- (float)maxPortraitLightingEffectStrength;
- (float)maxSimulatedAperture;
- (float)minISO;
- (float)minPortraitLightingEffectStrength;
- (float)minSimulatedAperture;
- (float)spatialOverCapturePercentage;
- (float)videoFieldOfView;
- (id)AVCaptureSessionPresets;
- (id)_stringForMediaType:(unsigned int)a3 formatDescription:(opaqueCMFormatDescription *)a4 frameRateRanges:(id)a5;
- (id)_supportedMaxPhotoDimensionsPrivateDimensionsEnabled:(BOOL)a3;
- (id)debugDescription;
- (id)description;
- (id)figCaptureSourceDepthDataFormat;
- (id)figCaptureSourceVideoFormat;
- (id)optimizedVideoPreviewFilterNames;
- (id)supportedMaxPhotoDimensionsPrivate;
- (id)supportedSemanticSegmentationMatteTypes;
- (id)supportedZoomRangesForCinematicVideo;
- (id)videoFrameRateRangeForBackgroundReplacement;
- (id)videoFrameRateRangeForCenterStageForContinuityCamera;
- (id)vtScalingMode;
- (int)baseSensorPowerConsumption;
- (int)ispPowerConsumption;
- (int)supportedStabilizationMethod;
- (int)variableSensorPowerConsumption;
- (int64_t)videoHDRFlavor;
- (unsigned)internalDemosaicedRawPixelFormat;
- (unsigned)supportedDemosaicedRawPixelFormat;
- (unsigned)supportedRawPixelFormat;
- (void)_initializeSupportedMaxPhotoDimensions;
- (void)dealloc;
- (void)setContinuousZoomWithDepthEnabled:(BOOL)a3;
@end

@implementation AVCaptureDeviceFormat

- (id)AVCaptureSessionPresets
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return (id)[v2 AVCaptureSessionPresets];
}

- (BOOL)isCenterStageSupported
{
  return self->_internal->centerStageSupported;
}

- (BOOL)isBackgroundReplacementSupported
{
  return self->_internal->backgroundReplacementSupported;
}

- (BOOL)isPortraitEffectSupported
{
  return self->_internal->backgroundBlurSupported;
}

- (BOOL)isStudioLightSupported
{
  return self->_internal->studioLightingSupported;
}

- (BOOL)reactionEffectsSupported
{
  return self->_internal->reactionEffectsSupported;
}

- (AVCaptureDeviceFormat)initWithFigCaptureSourceFormat:(id)a3 fcSourceAttributes:(id)a4
{
  v19.receiver = self;
  v19.super_class = (Class)AVCaptureDeviceFormat;
  v6 = [(AVCaptureDeviceFormat *)&v19 init];
  if (v6)
  {
    v7 = objc_alloc_init(AVCaptureDeviceFormatInternal);
    v6->_internal = v7;
    if (v7)
    {
      v6->_internal->sourceFormat = (FigCaptureSourceFormat *)a3;
      v6->_internal->fcSourceAttributes = (NSDictionary *)a4;
      if ([(FigCaptureSourceFormat *)v6->_internal->sourceFormat mediaType] == 1986618469)
      {
        [(AVCaptureDeviceFormat *)v6 _initializeSupportedMaxPhotoDimensions];
        v6->_internal->backgroundBlurSupported = [(FigCaptureSourceFormat *)v6->_internal->sourceFormat isBackgroundBlurSupported];
        v6->_internal->backgroundBlurSupportedForContinuityCamera = [(FigCaptureSourceFormat *)v6->_internal->sourceFormat isBackgroundBlurSupportedForContinuityCapture];
        internal = v6->_internal;
        if (!internal->backgroundBlurSupported)
        {
          int IsContinuityCapture = AVCaptureClientIsContinuityCapture();
          internal = v6->_internal;
          if (IsContinuityCapture)
          {
            internal->backgroundBlurSupported = internal->backgroundBlurSupportedForContinuityCamera;
            internal = v6->_internal;
          }
        }
        v6->_internal->studioLightingSupported = [(FigCaptureSourceFormat *)internal->sourceFormat isStudioLightingSupported];
        v6->_internal->studioLightingSupportedForContinuityCamera = [(FigCaptureSourceFormat *)v6->_internal->sourceFormat isStudioLightingSupportedForContinuityCapture];
        v10 = v6->_internal;
        if (!v10->studioLightingSupported)
        {
          int v11 = AVCaptureClientIsContinuityCapture();
          v10 = v6->_internal;
          if (v11)
          {
            v10->studioLightingSupported = v10->studioLightingSupportedForContinuityCamera;
            v10 = v6->_internal;
          }
        }
        v6->_internal->reactionEffectsSupported = [(FigCaptureSourceFormat *)v10->sourceFormat reactionEffectsSupported];
        v6->_internal->reactionEffectsSupportedForContinuityCamera = [(FigCaptureSourceFormat *)v6->_internal->sourceFormat reactionEffectsSupportedForContinuityCapture];
        v12 = v6->_internal;
        if (!v12->reactionEffectsSupported)
        {
          int v13 = AVCaptureClientIsContinuityCapture();
          v12 = v6->_internal;
          if (v13)
          {
            v12->reactionEffectsSupported = v12->reactionEffectsSupportedForContinuityCamera;
            v12 = v6->_internal;
          }
        }
        v6->_internal->backgroundReplacementSupported = [(FigCaptureSourceFormat *)v12->sourceFormat isBackgroundReplacementSupported];
        v6->_internal->backgroundReplacementSupportedForContinuityCamera = [(FigCaptureSourceFormat *)v6->_internal->sourceFormat isBackgroundReplacementSupportedForContinuityCapture];
        v14 = v6->_internal;
        if (!v14->backgroundReplacementSupported)
        {
          int v15 = AVCaptureClientIsContinuityCapture();
          v14 = v6->_internal;
          if (v15)
          {
            v14->backgroundReplacementSupported = v14->backgroundReplacementSupportedForContinuityCamera;
            v14 = v6->_internal;
          }
        }
        v6->_internal->centerStageSupported = [(FigCaptureSourceFormat *)v14->sourceFormat isCinematicFramingSupported];
        v6->_internal->centerStageSupportedForContinuityCamera = [(FigCaptureSourceFormat *)v6->_internal->sourceFormat isCinematicFramingSupportedForContinuityCapture];
        v16 = v6->_internal;
        if (!v16->centerStageSupported)
        {
          int v17 = AVCaptureClientIsContinuityCapture();
          v16 = v6->_internal;
          if (v17)
          {
            v16->centerStageSupported = v16->centerStageSupportedForContinuityCamera;
            v16 = v6->_internal;
          }
        }
        v6->_internal->constantColorSupported = [(FigCaptureSourceFormat *)v16->sourceFormat isConstantColorSupported];
        if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v6->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51B60]), "intValue") == 9)v6->_internal->depthDataFormatsDisabled = !v6->_internal->continuousZoomWithDepthEnabled; {
      }
        }
      v6->_internal->isDepthDataFormat = [a3 mediaType] == 1685091432;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)_initializeSupportedMaxPhotoDimensions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "geometricDistortionCorrectionFormat");
  id v4 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
  if (v3)
  {
    id v5 = (id)[v4 geometricDistortionCorrectionFormat];
LABEL_7:
    v6 = v5;
    goto LABEL_8;
  }
  if (v4)
  {
    id v5 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
    goto LABEL_7;
  }
  if ([(AVCaptureDeviceFormat *)self figCaptureSourceDepthDataFormat])
  {
    id v5 = [(AVCaptureDeviceFormat *)self figCaptureSourceDepthDataFormat];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_8:
  v7 = (void *)[MEMORY[0x1E4F1CA48] array];
  $2825F4736939C4A6D3AD43837233062D v8 = [(AVCaptureDeviceFormat *)self defaultPhotoDimensionsWithHighResolutionCaptureEnabled:0];
  objc_msgSend(v7, "addObject:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F50F88]), "initWithDimensions:deferredPhotoProxyDimensions:isPrivate:flavor:maxUpscalingDimensions:", v8, 0, 0, 0, 0));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = objc_msgSend(v6, "highResStillImageDimensions", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v14 dimensionsAreEqualToDimensions:v8] & 1) == 0) {
          [v7 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v11);
  }
  self->_internal->supportedMaxPhotoDimensions = (NSArray *)[v7 copy];
}

- (BOOL)isContinuousZoomWithDepthSupported
{
  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "clientMaxContinuousZoomFactorForDepthDataDelivery");
  return v2 > 0.0;
}

- (id)figCaptureSourceVideoFormat
{
  if ([(FigCaptureSourceFormat *)self->_internal->sourceFormat mediaType] == 1986618469
    || [(FigCaptureSourceFormat *)self->_internal->sourceFormat mediaType] == 1885564004)
  {
    return self->_internal->sourceFormat;
  }
  else
  {
    return 0;
  }
}

- ($2825F4736939C4A6D3AD43837233062D)defaultPhotoDimensionsWithHighResolutionCaptureEnabled:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "geometricDistortionCorrectionFormat");
    id v5 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
    if (v4)
    {
      id v6 = (id)[v5 geometricDistortionCorrectionFormat];
    }
    else if (v5)
    {
      id v6 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
    }
    else
    {
      CMVideoDimensions Dimensions = [(AVCaptureDeviceFormat *)self figCaptureSourceDepthDataFormat];
      if (!*(void *)&Dimensions)
      {
        unint64_t v8 = 0;
        return ($2825F4736939C4A6D3AD43837233062D)(v8 | Dimensions.width);
      }
      id v6 = [(AVCaptureDeviceFormat *)self figCaptureSourceDepthDataFormat];
    }
    CMVideoDimensions Dimensions = (CMVideoDimensions)[v6 defaultHighResStillImageDimensions];
  }
  else
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions([(AVCaptureDeviceFormat *)self formatDescription]);
  }
  unint64_t v8 = *(void *)&Dimensions & 0xFFFFFFFF00000000;
  return ($2825F4736939C4A6D3AD43837233062D)(v8 | Dimensions.width);
}

- (CMFormatDescriptionRef)formatDescription
{
  internal = self->_internal;
  CMFormatDescriptionRef result = internal->formatDescription;
  if (!result)
  {
    self->_internal->formatDescription = (opaqueCMFormatDescription *)[(FigCaptureSourceFormat *)internal->sourceFormat formatDescription];
    CMFormatDescriptionRef result = self->_internal->formatDescription;
    if (result)
    {
      CFRetain(result);
      return self->_internal->formatDescription;
    }
  }
  return result;
}

- (BOOL)isStreamingDisparitySupported
{
  if (self->_internal->depthDataFormatsDisabled) {
    return 0;
  }
  id v3 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v3 isStreamingDisparitySupported];
}

- (BOOL)isStillImageDisparitySupported
{
  if (self->_internal->depthDataFormatsDisabled) {
    return 0;
  }
  id v3 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v3 isStillImageDisparitySupported];
}

- (BOOL)isStreamingDepthSupported
{
  if (self->_internal->depthDataFormatsDisabled) {
    return 0;
  }
  id v3 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v3 isStreamingDepthSupported];
}

- (BOOL)isStillImageDepthSupported
{
  if (self->_internal->depthDataFormatsDisabled) {
    return 0;
  }
  id v3 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v3 isStillImageDepthSupported];
}

- (BOOL)isDefaultActiveFormat
{
  return [(FigCaptureSourceFormat *)self->_internal->sourceFormat isDefaultActiveFormat];
}

- (void)setContinuousZoomWithDepthEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (internal->continuousZoomWithDepthEnabled != a3)
  {
    internal->continuousZoomWithDepthEnabled = a3;
    if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51B60]), "intValue") == 9)
    {
      self->_internal->depthDataFormatsDisabled = !a3;

      self->_internal->supportedDepthDataFormats = 0;
    }
  }
}

- (BOOL)isContinuousZoomWithDepthEnabled
{
  return self->_internal->continuousZoomWithDepthEnabled;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)lowestSupportedVideoFrameDuration
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA10];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(AVCaptureDeviceFormat *)self videoSupportedFrameRateRanges];
  CMFormatDescriptionRef result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v13;
    do
    {
      unint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v8);
        if (v9) {
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) minFrameDuration];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *retstr;
        if (CMTimeCompare(&time1, (CMTime *)&v10) < 0)
        {
          if (v9) {
            [v9 minFrameDuration];
          }
          else {
            memset(&v10, 0, sizeof(v10));
          }
          *retstr = v10;
        }
        unint64_t v8 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)v8 + 1);
      }
      while (v6 != v8);
      CMFormatDescriptionRef result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v6 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)prefersVideoHDREnabledForSessionPreset:(id)a3
{
  if (objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isSIFRSupported"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = objc_msgSend(-[AVCaptureDeviceFormat AVCaptureSessionPresets](self, "AVCaptureSessionPresets"), "containsObject:", a3);
    if (v5)
    {
      id v6 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
      LOBYTE(v5) = [v6 prefersSensorHDREnabled];
    }
  }
  return v5;
}

- (BOOL)isWideColorSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isWideColorSupported];
}

- (BOOL)isVideoHDRSupported
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(AVCaptureDeviceFormat *)self supportedColorSpaces];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if (!AVCaptureColorSpaceIsHDR([*(id *)(*((void *)&v10 + 1) + 8 * i) integerValue]))
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:
  if ((objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "hasSensorHDRCompanionIndex") & 1) == 0&& !objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isSIFRSupported"))
  {
    return 0;
  }
  return v8;
}

- (NSArray)supportedColorSpaces
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return (NSArray *)[v2 supportedColorSpaces];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultActiveMinFrameDurationForSessionPreset:(SEL)a3
{
  uint64_t v4 = self;
  uint64_t v6 = *(void *)&self->var1;
  if ((*(unsigned char *)(v6 + 36) & 1) == 0)
  {
    [($3CC8671D27C23BF42ADDB32F2B5E48AE *)self lowestSupportedVideoFrameDuration];
    *(CMTime *)(v6 + 24) = v11;
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)v4 figCaptureSourceVideoFormat];
    if (self)
    {
      objc_msgSend((id)-[$3CC8671D27C23BF42ADDB32F2B5E48AE figCaptureSourceVideoFormat](v4, "figCaptureSourceVideoFormat"), "defaultMaxFrameRateForSessionPreset:", a4);
      BOOL v8 = *(CMTime **)&v4->var1;
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake(&v11, 1, (int)v9);
      v8[1] = v11;
    }
  }
  uint64_t v10 = *(void *)&v4->var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)(v10 + 24);
  retstr->var3 = *(void *)(v10 + 40);
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)defaultActiveMaxFrameDurationForSessionPreset:(SEL)a3
{
  uint64_t v4 = self;
  uint64_t v6 = *(void *)&self->var1;
  if ((*(unsigned char *)(v6 + 60) & 1) == 0)
  {
    [($3CC8671D27C23BF42ADDB32F2B5E48AE *)self highestSupportedVideoFrameDuration];
    *(CMTime *)(v6 + 48) = v11;
    self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)v4 figCaptureSourceVideoFormat];
    if (self)
    {
      objc_msgSend((id)-[$3CC8671D27C23BF42ADDB32F2B5E48AE figCaptureSourceVideoFormat](v4, "figCaptureSourceVideoFormat"), "defaultMinFrameRateForSessionPreset:", a4);
      BOOL v8 = *(CMTime **)&v4->var1;
      self = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake(&v11, 1, (int)v9);
      v8[2] = v11;
    }
  }
  uint64_t v10 = *(void *)&v4->var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)(v10 + 48);
  retstr->var3 = *(void *)(v10 + 64);
  return self;
}

- (NSArray)supportedDepthDataFormats
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  internal = self->_internal;
  if (!internal->supportedDepthDataFormats)
  {
    if (internal->depthDataFormatsDisabled) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "supportedDepthDataFormats");
    }
    if ([v4 count])
    {
      uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v13;
        do
        {
          uint64_t v9 = 0;
          do
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v4);
            }
            uint64_t v10 = [[AVCaptureDeviceFormat alloc] initWithFigCaptureSourceFormat:*(void *)(*((void *)&v12 + 1) + 8 * v9) fcSourceAttributes:self->_internal->fcSourceAttributes];
            [v5 addObject:v10];

            ++v9;
          }
          while (v7 != v9);
          uint64_t v7 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v7);
      }
      self->_internal->supportedDepthDataFormats = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5];
    }
    else
    {
      self->_internal->supportedDepthDataFormats = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
  }
  return self->_internal->supportedDepthDataFormats;
}

- (id)_stringForMediaType:(unsigned int)a3 formatDescription:(opaqueCMFormatDescription *)a4 frameRateRanges:(id)a5
{
  CMFormatDescriptionGetMediaSubType(a4);
  uint64_t v9 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v10 = AVStringForOSType();
  CMTime v11 = (void *)[v9 stringWithFormat:@"'%@'/'%@' ", v10, AVStringForOSType()];
  if ((int)a3 > 1936684397)
  {
    if (a3 == 1936684398)
    {
      StreamBasicDescription = CMAudioFormatDescriptionGetStreamBasicDescription(a4);
      objc_msgSend(v11, "appendFormat:", @"SR=%0.0f,FF=%u,BPP=%u,FPP=%u,BPF=%u,CH=%u,BPC=%u", *(void *)&StreamBasicDescription->mSampleRate, StreamBasicDescription->mFormatFlags, StreamBasicDescription->mBytesPerPacket, StreamBasicDescription->mFramesPerPacket, StreamBasicDescription->mBytesPerFrame, StreamBasicDescription->mChannelsPerFrame, StreamBasicDescription->mBitsPerChannel);
      return v11;
    }
    int v12 = 1986618469;
LABEL_6:
    if (a3 != v12) {
      return v11;
    }
    goto LABEL_7;
  }
  if (a3 != 1685091432)
  {
    int v12 = 1885564004;
    goto LABEL_6;
  }
LABEL_7:
  if ([a5 count])
  {
    objc_msgSend((id)objc_msgSend(a5, "firstObject"), "minFrameRate");
    uint64_t v14 = (int)v13;
    objc_msgSend((id)objc_msgSend(a5, "firstObject"), "maxFrameRate");
    uint64_t v16 = (int)v15;
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v14 = 0;
  }
  if (a3 == 1885564004)
  {
    [v11 appendFormat:@"max points: %d, {%2d-%3d fps} ", CMPointCloudFormatDescriptionGetNumberOfPoints(), v14, v16, v56];
  }
  else
  {
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(a4);
    [v11 appendFormat:@"%4dx%4d, {%2d-%3d fps}", Dimensions, HIDWORD(*(unint64_t *)&Dimensions), v14, v16];
  }
  [v11 appendString:@", photo dims:{"];
  if ([(NSArray *)[(AVCaptureDeviceFormat *)self supportedMaxPhotoDimensions] count])
  {
    unint64_t v17 = 0;
    do
    {
      if (v17) {
        [v11 appendString:@","];
      }
      id v18 = [(NSArray *)[(AVCaptureDeviceFormat *)self supportedMaxPhotoDimensions] objectAtIndexedSubscript:v17];
      unint64_t v59 = 0;
      [v18 getValue:&v59];
      objc_msgSend(v11, "appendFormat:", @"%dx%d", v59, HIDWORD(v59));
      ++v17;
    }
    while ([(NSArray *)[(AVCaptureDeviceFormat *)self supportedMaxPhotoDimensions] count] > v17);
  }
  [v11 appendString:@"}"];
  [(AVCaptureDeviceFormat *)self videoFieldOfView];
  if (v19 > 0.0)
  {
    [(AVCaptureDeviceFormat *)self videoFieldOfView];
    [v11 appendFormat:@", fov:%2.3f", v20];
  }
  [(AVCaptureDeviceFormat *)self geometricDistortionCorrectedVideoFieldOfView];
  if (v21 > 0.0)
  {
    [(AVCaptureDeviceFormat *)self geometricDistortionCorrectedVideoFieldOfView];
    float v23 = v22;
    [(AVCaptureDeviceFormat *)self videoFieldOfView];
    if (v23 != v24)
    {
      [(AVCaptureDeviceFormat *)self geometricDistortionCorrectedVideoFieldOfView];
      [v11 appendFormat:@", gdc fov:%2.3f", v25];
    }
  }
  if ([(AVCaptureDeviceFormat *)self isVideoBinned]) {
    [v11 appendFormat:@", binned"];
  }
  if ([(AVCaptureDeviceFormat *)self supportedStabilizationMethod] >= 1)
  {
    [v11 appendFormat:@", supports vis"];
    objc_msgSend(v11, "appendString:", @" (max strength:");
    if ([(AVCaptureDeviceFormat *)self isVideoStabilizationStrengthSupported:4]|| [(AVCaptureDeviceFormat *)self isVideoStabilizationStrengthSupported:3]|| [(AVCaptureDeviceFormat *)self isVideoStabilizationStrengthSupported:2]|| [(AVCaptureDeviceFormat *)self isVideoStabilizationStrengthSupported:1])
    {
      v27 = (__CFString *)FigCaptureVideoStabilizationStrengthToString();
    }
    else
    {
      v27 = @"Unknown";
    }
    [v11 appendString:v27];
    [v11 appendString:@""]);
  }
  [(AVCaptureDeviceFormat *)self videoMaxZoomFactor];
  double v29 = v28;
  if (v28 > 1.0)
  {
    [(AVCaptureDeviceFormat *)self videoZoomFactorUpscaleThreshold];
    [v11 appendFormat:@", max zoom:%2.2f (upscales @%2.2f)", *(void *)&v29, v30];
  }
  NSUInteger v31 = [(NSArray *)[(AVCaptureDeviceFormat *)self secondaryNativeResolutionZoomFactors] count];
  v32 = [(AVCaptureDeviceFormat *)self secondaryNativeResolutionZoomFactors];
  if (v31 == 1)
  {
    objc_msgSend(-[NSArray firstObject](v32, "firstObject"), "floatValue");
    [v11 appendFormat:@", secondary:%.2f", v33];
  }
  else if ([(NSArray *)v32 count] >= 2)
  {
    objc_msgSend(-[NSArray firstObject](-[AVCaptureDeviceFormat secondaryNativeResolutionZoomFactors](self, "secondaryNativeResolutionZoomFactors"), "firstObject"), "floatValue");
    [v11 appendFormat:@", secondaries:{%.2f", v34];
    if ([(NSArray *)[(AVCaptureDeviceFormat *)self secondaryNativeResolutionZoomFactors] count] >= 2)
    {
      unint64_t v35 = 1;
      do
      {
        objc_msgSend(-[NSArray objectAtIndexedSubscript:](-[AVCaptureDeviceFormat secondaryNativeResolutionZoomFactors](self, "secondaryNativeResolutionZoomFactors"), "objectAtIndexedSubscript:", v35), "floatValue");
        [v11 appendFormat:@",%.2f", v36];
        ++v35;
      }
      while ([(NSArray *)[(AVCaptureDeviceFormat *)self secondaryNativeResolutionZoomFactors] count] > v35);
    }
    [v11 appendString:@"}"];
  }
  if ([(AVCaptureDeviceFormat *)self systemRecommendedVideoZoomRange])
  {
    [(AVZoomRange *)[(AVCaptureDeviceFormat *)self systemRecommendedVideoZoomRange] minZoomFactor];
    uint64_t v38 = v37;
    [(AVZoomRange *)[(AVCaptureDeviceFormat *)self systemRecommendedVideoZoomRange] maxZoomFactor];
    [v11 appendFormat:@", system zoom range:%.1f-%.1f", v38, v39];
  }
  if ([(AVCaptureDeviceFormat *)self autoFocusSystem]) {
    [v11 appendFormat:@", AF System:%d", -[AVCaptureDeviceFormat autoFocusSystem](self, "autoFocusSystem")];
  }
  [(AVCaptureDeviceFormat *)self minISO];
  if (v40 > 0.0)
  {
    [(AVCaptureDeviceFormat *)self maxISO];
    if (v41 > 0.0)
    {
      [(AVCaptureDeviceFormat *)self minISO];
      double v43 = v42;
      [(AVCaptureDeviceFormat *)self maxISO];
      [v11 appendFormat:@", ISO:%.1f-%.1f", *(void *)&v43, v44];
    }
  }
  if (self)
  {
    [(AVCaptureDeviceFormat *)self minExposureDuration];
    double Seconds = CMTimeGetSeconds(&time);
    [(AVCaptureDeviceFormat *)self maxExposureDuration];
  }
  else
  {
    memset(&time, 0, sizeof(time));
    double Seconds = CMTimeGetSeconds(&time);
    memset(&v57, 0, sizeof(v57));
  }
  double v46 = CMTimeGetSeconds(&v57);
  if (Seconds > 0.0 && v46 > 0.0) {
    [v11 appendFormat:@", SS:%f-%f", *(void *)&Seconds, *(void *)&v46];
  }
  if ([(AVCaptureDeviceFormat *)self systemRecommendedExposureBiasRange])
  {
    [(AVExposureBiasRange *)[(AVCaptureDeviceFormat *)self systemRecommendedExposureBiasRange] minExposureBias];
    double v48 = v47;
    [(AVExposureBiasRange *)[(AVCaptureDeviceFormat *)self systemRecommendedExposureBiasRange] maxExposureBias];
    [v11 appendFormat:@", system exposure bias range:%.1f-%.1f", *(void *)&v48, v49];
  }
  if ([(AVCaptureDeviceFormat *)self isVideoHDRSupported]) {
    [v11 appendString:@", supports HDR"];
  }
  if ([(AVCaptureDeviceFormat *)self isWideColorSupported]) {
    [v11 appendString:@", supports wide color"];
  }
  if ([(AVCaptureDeviceFormat *)self isExperimental]) {
    [v11 appendString:@", *EXPERIMENTAL*"];
  }
  BOOL v50 = [(AVCaptureDeviceFormat *)self isStillImageDisparitySupported]
     || [(AVCaptureDeviceFormat *)self isStillImageDepthSupported];
  BOOL v51 = [(AVCaptureDeviceFormat *)self isStreamingDisparitySupported]
     || [(AVCaptureDeviceFormat *)self isStreamingDepthSupported];
  if (v50 || v51)
  {
    v52 = @", supports still image only depth";
    if (v50 && v51) {
      v52 = @", supports depth";
    }
    if (v50) {
      v53 = v52;
    }
    else {
      v53 = @", supports streaming only depth";
    }
    [v11 appendString:v53];
  }
  if ([(AVCaptureDeviceFormat *)self isMultiCamSupported]) {
    [v11 appendString:@", supports multicam"];
  }
  if ([(AVCaptureDeviceFormat *)self isSpatialVideoCaptureSupported]) {
    [v11 appendString:@", supports spatial video capture"];
  }
  if ([(AVCaptureDeviceFormat *)self isFastCapturePrioritizationSupported]) {
    [v11 appendString:@", supports responsive capture"];
  }
  if ([(AVCaptureDeviceFormat *)self isZeroShutterLagSupported])
  {
    [v11 appendString:@", supports zero shutter lag"];
    if ([(AVCaptureDeviceFormat *)self isZeroShutterLagWithDepthSupported]) {
      [v11 appendString:@" (with depth)"];
    }
  }
  if ([(AVCaptureDeviceFormat *)self isHighPhotoQualitySupported]) {
    [v11 appendString:@", supports high photo quality"];
  }
  if ([(AVCaptureDeviceFormat *)self isHighestPhotoQualitySupported]) {
    [v11 appendString:@", supports highest photo quality"];
  }
  if ([(AVCaptureDeviceFormat *)self isCenterStageSupported]) {
    [v11 appendFormat:@", supports Center Stage"];
  }
  if (objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isCenterStageRectOfInterestSupported"))objc_msgSend(v11, "appendString:", @", supports CS RoI"); {
  if ([(AVCaptureDeviceFormat *)self isBackgroundBlurSupported])
  }
    [v11 appendString:@", supports Portrait Effect"];
  if ([(AVCaptureDeviceFormat *)self isStudioLightSupported]) {
    [v11 appendString:@", supports Studio Lighting"];
  }
  if ([(AVCaptureDeviceFormat *)self reactionEffectsSupported]) {
    [v11 appendString:@", supports Reactions"];
  }
  if ([(AVCaptureDeviceFormat *)self isBackgroundReplacementSupported]) {
    [v11 appendString:@", supports Background Replacement"];
  }
  if ([(AVCaptureDeviceFormat *)self isSmartStyleRenderingSupported]) {
    [v11 appendString:@", supports Smart Style"];
  }
  return v11;
}

- (id)_supportedMaxPhotoDimensionsPrivateDimensionsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  supportedMaxPhotoCMVideoDimensions Dimensions = self->_internal->supportedMaxPhotoDimensions;
  uint64_t v7 = [(NSArray *)supportedMaxPhotoDimensions countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(supportedMaxPhotoDimensions);
        }
        CMTime v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 isPrivate]) {
          BOOL v12 = !v3;
        }
        else {
          BOOL v12 = 0;
        }
        if (!v12)
        {
          uint64_t v18 = [v11 dimensions];
          objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E4F29238], "valueWithBytes:objCType:", &v18, "{?=ii}"));
        }
      }
      uint64_t v8 = [(NSArray *)supportedMaxPhotoDimensions countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }
  return (id)[v5 copy];
}

- (NSArray)supportedMaxPhotoDimensions
{
  return (NSArray *)[(AVCaptureDeviceFormat *)self _supportedMaxPhotoDimensionsPrivateDimensionsEnabled:0];
}

- (AVExposureBiasRange)systemRecommendedExposureBiasRange
{
  LODWORD(v2) = -2.0;
  LODWORD(v3) = 2.0;
  return +[AVExposureBiasRange exposureBiasRangeWithMinExposureBias:v2 maxExposureBias:v3];
}

- (float)videoFieldOfView
{
  if ([(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat])
  {
    id v3 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
  }
  else
  {
    if (![(AVCaptureDeviceFormat *)self figCaptureSourceDepthDataFormat]) {
      return 0.0;
    }
    id v3 = [(AVCaptureDeviceFormat *)self figCaptureSourceDepthDataFormat];
  }

  [v3 fieldOfView];
  return result;
}

- (BOOL)isVideoStabilizationStrengthSupported:(int64_t)a3
{
  if (![(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat]) {
    return a3 == 0;
  }
  id v5 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v5 isVideoStabilizationStrengthSupported:a3];
}

- (BOOL)isFastCapturePrioritizationSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isResponsiveShutterSupported];
}

- (NSArray)secondaryNativeResolutionZoomFactors
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return (NSArray *)[v2 secondaryNativeResolutionZoomFactors];
}

- (float)geometricDistortionCorrectedVideoFieldOfView
{
  uint64_t v3 = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "geometricDistortionCorrectionFormat");
  id v4 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
  if (v3) {
    id v4 = (id)[v4 geometricDistortionCorrectionFormat];
  }

  [v4 geometricDistortionCorrectedFieldOfView];
  return result;
}

- (float)minISO
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  [v2 minISO];
  return result;
}

- (AVCaptureAutoFocusSystem)autoFocusSystem
{
  return (uint64_t)(int)objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "autoFocusSystem");
}

- (float)maxISO
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  [v2 maxISO];
  return result;
}

- (BOOL)isSmartStyleRenderingSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isSmartStyleRenderingSupported];
}

- (CGFloat)videoMaxZoomFactor
{
  if (![(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat]) {
    return 1.0;
  }
  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "maxZoomFactor");
  return v3;
}

- (float)minSimulatedAperture
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  [v2 minSimulatedAperture];
  return result;
}

- (BOOL)isZeroShutterLagSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isZeroShutterLagSupported];
}

- (float)defaultSimulatedAperture
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  [v2 defaultSimulatedAperture];
  return result;
}

- (BOOL)isVideoBinned
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isBinned];
}

- (AVZoomRange)systemRecommendedVideoZoomRange
{
  if ([(FigCaptureSourceFormat *)self->_internal->sourceFormat mediaType] != 1986618469) {
    return 0;
  }
  int v3 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51B60]), "intValue");
  if (v3 == 15) {
    return 0;
  }
  int v4 = v3;
  double v5 = [(AVCaptureDeviceFormat *)self isHighestPhotoQualitySupported] ? 5.0 : 3.0;
  if (objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51C20]), "intValue") != 1)return 0; {
  id v6 = [(NSDictionary *)self->_internal->fcSourceAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B08]];
  }
  if (v6)
  {
    objc_msgSend((id)objc_msgSend(v6, "lastObject"), "floatValue");
    double v5 = v5 * v7;
  }
  if (AVGestaltGetBoolAnswer(@"AVGQQ4PFVIJ6WPTAHHYTAR5J5O7YNA"))
  {
    if (v4 == 8 || v4 == 2) {
      double v5 = v5 + v5;
    }
  }
  if (v5 == -1.0) {
    return 0;
  }

  return +[AVZoomRange zoomRangeWithMinZoomFactor:1.0 maxZoomFactor:v5];
}

- (BOOL)isHighestPhotoQualitySupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isStillImageStabilizationSupported];
}

- (float)defaultPortraitLightingEffectStrength
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
  if (!v2) {
    return NAN;
  }

  [v2 defaultPortraitLightingEffectStrength];
  return result;
}

- (float)maxSimulatedAperture
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  [v2 maxSimulatedAperture];
  return result;
}

- (BOOL)isHighPhotoQualitySupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isHighPhotoQualitySupported];
}

- (BOOL)isDeferredPhotoProcessingSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isDeferredPhotoProcessingSupported];
}

- (int)supportedStabilizationMethod
{
  if ([(AVCaptureDeviceFormat *)self isVideoStabilizationModeSupported:1]) {
    return 2;
  }
  else {
    return 0;
  }
}

- (BOOL)isVideoStabilizationModeSupported:(AVCaptureVideoStabilizationMode)videoStabilizationMode
{
  int v3 = self;
  LOBYTE(self) = 1;
  switch(videoStabilizationMode)
  {
    case AVCaptureVideoStabilizationModeAuto:
      return (char)self;
    case AVCaptureVideoStabilizationModeOff:
    case AVCaptureVideoStabilizationModeStandard:
    case AVCaptureVideoStabilizationModeCinematic:
      id v5 = [(AVCaptureDeviceFormat *)v3 figCaptureSourceVideoFormat];
      AVCaptureVideoStabilizationMode v6 = videoStabilizationMode;
      goto LABEL_8;
    case AVCaptureVideoStabilizationModeCinematicExtended:
      LODWORD(self) = AVGestaltGetBoolAnswer(@"AVGQCaptureExtendedCinematicVISSupported");
      if (!self) {
        return (char)self;
      }
      id v5 = [(AVCaptureDeviceFormat *)v3 figCaptureSourceVideoFormat];
      AVCaptureVideoStabilizationMode v6 = AVCaptureVideoStabilizationModeCinematicExtended;
LABEL_8:
      LOBYTE(self) = [v5 isStabilizationModeSupported:v6];
      return (char)self;
    case AVCaptureVideoStabilizationModePreviewOptimized:
      id v5 = [(AVCaptureDeviceFormat *)v3 figCaptureSourceVideoFormat];
      AVCaptureVideoStabilizationMode v6 = AVCaptureVideoStabilizationModePreviewOptimized;
      goto LABEL_8;
    case AVCaptureVideoStabilizationModePreviewOptimized|AVCaptureVideoStabilizationModeStandard:
      id v5 = [(AVCaptureDeviceFormat *)v3 figCaptureSourceVideoFormat];
      AVCaptureVideoStabilizationMode v6 = AVCaptureVideoStabilizationModePreviewOptimized|AVCaptureVideoStabilizationModeStandard;
      goto LABEL_8;
    default:
      LOBYTE(self) = 0;
      return (char)self;
  }
}

- (CMTime)minExposureDuration
{
  float result = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
  if (result)
  {
    return (CMTime *)[(CMTime *)result minExposureDuration];
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- (CMTime)maxExposureDuration
{
  float result = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
  if (result)
  {
    return (CMTime *)[(CMTime *)result maxExposureDuration];
  }
  else
  {
    retstr->value = 0;
    *(void *)&retstr->timescale = 0;
    retstr->epoch = 0;
  }
  return result;
}

- (BOOL)isVisionDataDeliverySupported
{
  internal = self->_internal;
  if (internal->isDepthDataFormat) {
    return 0;
  }
  id v4 = [(NSDictionary *)internal->fcSourceAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51CB0]];

  return [v4 BOOLValue];
}

- (BOOL)isSpatialVideoCaptureSupported
{
  int BoolAnswer = AVGestaltGetBoolAnswer(@"AVGQBWQSOG5QWWG276TG2HH4RGJZDA");
  if (BoolAnswer)
  {
    id v4 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
    LOBYTE(BoolAnswer) = [v4 isStereoVideoCaptureSupported];
  }
  return BoolAnswer;
}

- (BOOL)isMultiCamSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isMultiCamSupported];
}

- (BOOL)isExperimental
{
  return [(FigCaptureSourceFormat *)self->_internal->sourceFormat isExperimental];
}

- (BOOL)isDeepFusionSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isDeepFusionSupported];
}

- (BOOL)isConstantColorSupported
{
  return self->_internal->constantColorSupported;
}

- (BOOL)isCameraCalibrationDataDeliverySupported
{
  id v2 = [(NSDictionary *)self->_internal->fcSourceAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B18]];

  return [v2 BOOLValue];
}

- (CGFloat)videoZoomFactorUpscaleThreshold
{
  if (![(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat]) {
    return 1.0;
  }
  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "zoomFactorUpscaleThreshold");
  return v3;
}

- (id)supportedZoomRangesForCinematicVideo
{
  v4[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "maxContinuousZoomFactorForCinematicVideo");
  if (v2 <= 0.0) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  v4[0] = +[AVZoomRange zoomRangeWithMinZoomFactor:2.0 maxZoomFactor:v2];
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
}

- (id)description
{
  float v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCaptureDeviceFormat debugDescription](self, "debugDescription")];
}

- (id)debugDescription
{
  [(AVCaptureDeviceFormat *)self mediaType];
  uint64_t v3 = AVOSTypeForString();
  id v4 = [(AVCaptureDeviceFormat *)self formatDescription];
  id v5 = [(AVCaptureDeviceFormat *)self videoSupportedFrameRateRanges];

  return [(AVCaptureDeviceFormat *)self _stringForMediaType:v3 formatDescription:v4 frameRateRanges:v5];
}

- (NSArray)videoSupportedFrameRateRanges
{
  if (!self->_internal->videoSupportedFrameRateRanges)
  {
    if ([(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat])
    {
      objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "minSupportedFrameRate");
      float v4 = v3;
      id v5 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
    }
    else
    {
      if (![(AVCaptureDeviceFormat *)self figCaptureSourceDepthDataFormat])
      {
        uint64_t v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
        goto LABEL_7;
      }
      objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceDepthDataFormat](self, "figCaptureSourceDepthDataFormat"), "minSupportedFrameRate");
      float v4 = v6;
      id v5 = [(AVCaptureDeviceFormat *)self figCaptureSourceDepthDataFormat];
    }
    [v5 maxSupportedFrameRate];
    uint64_t v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", +[AVFrameRateRange frameRateRangeWithMinRate:maxFrameRate:](AVFrameRateRange, "frameRateRangeWithMinRate:maxFrameRate:", (int)v4, (int)v7), 0);
LABEL_7:
    self->_internal->videoSupportedFrameRateRanges = v8;
  }
  return self->_internal->videoSupportedFrameRateRanges;
}

- (AVMediaType)mediaType
{
  [(FigCaptureSourceFormat *)self->_internal->sourceFormat mediaType];

  return (AVMediaType)AVStringForOSType();
}

- (id)figCaptureSourceDepthDataFormat
{
  if ([(FigCaptureSourceFormat *)self->_internal->sourceFormat mediaType] == 1685091432) {
    return self->_internal->sourceFormat;
  }
  else {
    return 0;
  }
}

- (BOOL)isPhotoFormat
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isPhotoFormat];
}

- (BOOL)supportsHighResolutionStillImageOutput
{
  uint64_t v3 = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "geometricDistortionCorrectionFormat");
  id v4 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
  if (v3)
  {
    id v5 = (id)[v4 geometricDistortionCorrectionFormat];
  }
  else
  {
    if (!v4) {
      return [(AVCaptureDeviceFormat *)self figCaptureSourceDepthDataFormat] != 0;
    }
    id v5 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
  }

  return [v5 isHighResStillImageSupported];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)highestSupportedVideoFrameDuration
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA08];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(AVCaptureDeviceFormat *)self videoSupportedFrameRateRanges];
  float result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (result)
  {
    float v6 = result;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v8);
        if (v9) {
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) maxFrameDuration];
        }
        else {
          memset(&time1, 0, sizeof(time1));
        }
        $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *retstr;
        if (CMTimeCompare(&time1, (CMTime *)&v10) >= 1)
        {
          if (v9) {
            [v9 maxFrameDuration];
          }
          else {
            memset(&v10, 0, sizeof(v10));
          }
          *retstr = v10;
        }
        uint64_t v8 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)v8 + 1);
      }
      while (v6 != v8);
      float result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      float v6 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    goto LABEL_7;
  }
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  sourceFormat = self->_internal->sourceFormat;
  if (sourceFormat == *(FigCaptureSourceFormat **)(*((void *)a3 + 1) + 8))
  {
LABEL_7:
    LOBYTE(v5) = 1;
    return v5;
  }

  LOBYTE(v5) = -[FigCaptureSourceFormat isEqual:](sourceFormat, "isEqual:");
  return v5;
}

- (BOOL)isSpatialOverCaptureSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isSpatialOverCaptureSupported];
}

- (id)supportedMaxPhotoDimensionsPrivate
{
  return [(AVCaptureDeviceFormat *)self _supportedMaxPhotoDimensionsPrivateDimensionsEnabled:1];
}

- (BOOL)isPortraitAutoSuggestSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isPortraitAutoSuggestSupported];
}

- (BOOL)isSemanticStyleRenderingSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isSemanticStyleRenderingSupported];
}

- (id)vtScalingMode
{
  return 0;
}

- ($2825F4736939C4A6D3AD43837233062D)sensorDimensions
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return ($2825F4736939C4A6D3AD43837233062D)[v2 sensorDimensions];
}

- (BOOL)isVideoHDRSuspensionSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isSIFRSupported];
}

- (int64_t)videoHDRFlavor
{
  if (objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isSIFRSupported"))return 2; {
  else
  }
    return objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "hasSensorHDRCompanionIndex");
}

- (BOOL)isHDRSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isHDRSupported];
}

- (BOOL)isVideoGreenGhostMitigationSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isVideoGreenGhostMitigationSupported];
}

- (BOOL)isIrisVideoStabilizationSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isIrisVideoStabilizationSupported];
}

- (float)maxPortraitLightingEffectStrength
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
  if (!v2) {
    return NAN;
  }

  [v2 maxPortraitLightingEffectStrength];
  return result;
}

- (float)minPortraitLightingEffectStrength
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];
  if (!v2) {
    return NAN;
  }

  [v2 minPortraitLightingEffectStrength];
  return result;
}

- (BOOL)isVariableFrameRateVideoCaptureSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isVariableFrameRateVideoCaptureSupported];
}

- (BOOL)isLowLightVideoCaptureSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isLowLightVideoCaptureSupported];
}

- (BOOL)isIrisSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isIrisSupported];
}

- (unsigned)supportedRawPixelFormat
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 supportedRawPixelFormat];
}

- (NSArray)supportedVideoZoomRangesForDepthDataDelivery
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)[(AVCaptureDeviceFormat *)self supportedDepthDataFormats] count]) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "clientMaxContinuousZoomFactorForDepthDataDelivery");
  internal = self->_internal;
  if (internal->continuousZoomWithDepthEnabled && (float v5 = v3, v3 > 0.0))
  {
    objc_msgSend((id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51C98]), "firstObject"), "floatValue");
    if (v6 == 0.0) {
      float v6 = 1.0;
    }
    v23[0] = +[AVZoomRange zoomRangeWithMinZoomFactor:v6 maxZoomFactor:v5];
    return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  }
  else
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA48] array];
    id v9 = [(NSDictionary *)self->_internal->fcSourceAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C98]];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          [v14 floatValue];
          double v16 = v15;
          [v14 floatValue];
          objc_msgSend(v8, "addObject:", +[AVZoomRange zoomRangeWithMinZoomFactor:maxZoomFactor:](AVZoomRange, "zoomRangeWithMinZoomFactor:maxZoomFactor:", v16, v17));
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
    return (NSArray *)(id)[v8 copy];
  }
}

- (BOOL)isContentAwareDistortionCorrectionSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 intelligentDistortionCorrectionSupported];
}

- (BOOL)isDemosaicedRawSupported
{
  unsigned int v3 = [(AVCaptureDeviceFormat *)self internalDemosaicedRawPixelFormat];
  if (v3) {
    LOBYTE(v3) = [(AVCaptureDeviceFormat *)self supportedDemosaicedRawPixelFormat] != 0;
  }
  return v3;
}

- (unsigned)internalDemosaicedRawPixelFormat
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 internalDemosaicedRawPixelFormat];
}

- (unsigned)supportedDemosaicedRawPixelFormat
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 supportedDemosaicedRawPixelFormat];
}

- (BOOL)isZeroShutterLagWithDepthSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isZeroShutterLagWithDepthSupported];
}

- (BOOL)isUltraHighResolutionZeroShutterLagSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isUltraHighResolutionZeroShutterLagSupported];
}

- (BOOL)isMomentCaptureMovieRecordingSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isMomentCaptureMovieRecordingSupported];
}

- (BOOL)supportsQuadraHighResolutionStillImageOutput
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isQuadraHighResStillImageSupported];
}

- (BOOL)isDigitalFlashSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isDigitalFlashSupported];
}

- (BOOL)validateMaxPhotoDimensions:(id)a3 privateDimensionsEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  supportedMaxPhotoCMVideoDimensions Dimensions = self->_internal->supportedMaxPhotoDimensions;
  uint64_t v7 = [(NSArray *)supportedMaxPhotoDimensions countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(supportedMaxPhotoDimensions);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        if ([v11 isPrivate]) {
          BOOL v12 = !v4;
        }
        else {
          BOOL v12 = 0;
        }
        if (!v12 && ([v11 dimensionsAreEqualToDimensions:a3] & 1) != 0)
        {
          LOBYTE(v7) = 1;
          return v7;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [(NSArray *)supportedMaxPhotoDimensions countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v7;
}

- (BOOL)supportsRedEyeReduction
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isRedEyeReductionSupported];
}

- (id)supportedSemanticSegmentationMatteTypes
{
  v20[4] = *MEMORY[0x1E4F143B8];
  unsigned int v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  id v4 = [(NSDictionary *)self->_internal->fcSourceAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C60]];
  if ([v4 count])
  {
    uint64_t v5 = *MEMORY[0x1E4F55FD0];
    v19[0] = *MEMORY[0x1E4F55FC8];
    v19[1] = v5;
    v20[0] = @"AVSemanticSegmentationMatteTypeHair";
    v20[1] = @"AVSemanticSegmentationMatteTypeSkin";
    uint64_t v6 = *MEMORY[0x1E4F55FC0];
    v19[2] = *MEMORY[0x1E4F55FE0];
    v19[3] = v6;
    v20[2] = @"AVSemanticSegmentationMatteTypeTeeth";
    v20[3] = @"AVSemanticSegmentationMatteTypeGlasses";
    uint64_t v7 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v4);
          }
          uint64_t v12 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * v11)];
          if (v12) {
            [v3 addObject:v12];
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  return (id)[MEMORY[0x1E4F1C978] arrayWithArray:v3];
}

- (BOOL)isStereoFusionSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isStereoFusionSupported];
}

- (BOOL)isSISSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isStillImageStabilizationSupported];
}

- (BOOL)isPortraitEffectsMatteStillImageDeliverySupported
{
  internal = self->_internal;
  if (!internal->isDepthDataFormat) {
    return 0;
  }
  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](internal->fcSourceAttributes, "objectForKeyedSubscript:", *MEMORY[0x1E4F51C18]), "floatValue");
  return v3 > 0.0;
}

- (BOOL)isDemosaicedRawConfigurationWithDepthSupported
{
  id v2 = [(NSDictionary *)self->_internal->fcSourceAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B58]];
  float v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F513D8]];

  return [v3 BOOLValue];
}

- (BOOL)isDCProcessingWithDepthSupported
{
  id v2 = [(NSDictionary *)self->_internal->fcSourceAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51B58]];
  float v3 = (void *)[v2 objectForKeyedSubscript:*MEMORY[0x1E4F513D0]];

  return [v3 BOOLValue];
}

- (BOOL)isNonDestructiveCropSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isNonDestructiveCropSupported];
}

+ (void)initialize
{
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {

    id v4 = self->_internal;
    formatDescription = v4->formatDescription;
    if (formatDescription)
    {
      CFRelease(formatDescription);
      id v4 = self->_internal;
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureDeviceFormat;
  [(AVCaptureDeviceFormat *)&v6 dealloc];
}

- (CGFloat)videoMinZoomFactorForDepthDataDelivery
{
  objc_msgSend(-[NSArray firstObject](-[AVCaptureDeviceFormat supportedVideoZoomRangesForDepthDataDelivery](self, "supportedVideoZoomRangesForDepthDataDelivery"), "firstObject"), "minZoomFactor");
  if (v2 == 0.0) {
    return (float)1.0;
  }
  return (float)v2;
}

- (CGFloat)videoMaxZoomFactorForDepthDataDelivery
{
  objc_msgSend(-[NSArray firstObject](-[AVCaptureDeviceFormat supportedVideoZoomRangesForDepthDataDelivery](self, "supportedVideoZoomRangesForDepthDataDelivery"), "firstObject"), "maxZoomFactor");
  if (v2 == 0.0) {
    return (float)1.0;
  }
  return (float)v2;
}

- (NSArray)supportedVideoZoomFactorsForDepthDataDelivery
{
  float result = [(NSDictionary *)self->_internal->fcSourceAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51C98]];
  if (!result) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return result;
}

- (BOOL)zoomFactorsOutsideOfVideoZoomRangesForDepthDeliverySupported
{
  objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "clientMaxContinuousZoomFactorForDepthDataDelivery");
  return v2 > 0.0;
}

- (double)videoMinZoomFactorForCameraCalibrationDataDelivery
{
  return 1.0;
}

- (double)videoMaxZoomFactorForCameraCalibrationDataDelivery
{
  return 1.0;
}

- (CGFloat)videoMinZoomFactorForCenterStage
{
  return 1.0;
}

- (CGFloat)videoMaxZoomFactorForCenterStage
{
  if ([(AVCaptureDeviceFormat *)self isCenterStageSupported]) {
    return 1.0;
  }

  [(AVCaptureDeviceFormat *)self videoMaxZoomFactor];
  return result;
}

- (AVFrameRateRange)videoFrameRateRangeForCenterStage
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![(AVCaptureDeviceFormat *)self isCenterStageSupported]) {
    return 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  float v3 = [(AVCaptureDeviceFormat *)self videoSupportedFrameRateRanges];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    double v7 = 0.0;
    double v8 = 3.40282347e38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v10 minFrameRate];
        if (v11 < v8)
        {
          [v10 minFrameRate];
          double v8 = v12;
        }
        [v10 maxFrameRate];
        if (v13 > v7)
        {
          [v10 maxFrameRate];
          double v7 = v14;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 3.40282347e38;
  }
  long long v16 = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "cinematicFramingFormat");
  [v16 minSupportedFrameRate];
  if (v8 < v17)
  {
    [v16 minSupportedFrameRate];
    double v8 = v18;
  }
  [v16 maxSupportedFrameRate];
  if (v8 > v19)
  {
    [v16 maxSupportedFrameRate];
    double v8 = v20;
  }
  [v16 minSupportedFrameRate];
  if (v7 < v21)
  {
    [v16 minSupportedFrameRate];
    double v7 = v22;
  }
  [v16 maxSupportedFrameRate];
  if (v7 > v23)
  {
    [v16 maxSupportedFrameRate];
    double v7 = v24;
  }
  return +[AVFrameRateRange frameRateRangeWithMinRate:(int)v8 maxFrameRate:(int)v7];
}

- (id)videoFrameRateRangeForCenterStageForContinuityCamera
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (![(AVCaptureDeviceFormat *)self isCenterStageSupported]
    && ![(AVCaptureDeviceFormat *)self isCenterStageSupportedForContinuityCamera])
  {
    return 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  float v3 = [(AVCaptureDeviceFormat *)self videoSupportedFrameRateRanges];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    double v7 = 0.0;
    double v8 = 3.40282347e38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        [v10 minFrameRate];
        if (v11 < v8)
        {
          [v10 minFrameRate];
          double v8 = v12;
        }
        [v10 maxFrameRate];
        if (v13 > v7)
        {
          [v10 maxFrameRate];
          double v7 = v14;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 3.40282347e38;
  }
  long long v15 = objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "cinematicFramingFormat");
  [v15 minSupportedFrameRate];
  if (v8 < v16)
  {
    [v15 minSupportedFrameRate];
    double v8 = v17;
  }
  [v15 maxSupportedFrameRate];
  if (v8 > v18)
  {
    [v15 maxSupportedFrameRate];
    double v8 = v19;
  }
  [v15 minSupportedFrameRate];
  if (v7 < v20)
  {
    [v15 minSupportedFrameRate];
    double v7 = v21;
  }
  [v15 maxSupportedFrameRate];
  if (v7 > v22)
  {
    [v15 maxSupportedFrameRate];
    double v7 = v23;
  }
  return +[AVFrameRateRange frameRateRangeWithMinRate:(int)v8 maxFrameRate:(int)v7];
}

- (AVFrameRateRange)videoFrameRateRangeForPortraitEffect
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(AVCaptureDeviceFormat *)self isBackgroundBlurSupported]) {
    return 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  float v3 = [(AVCaptureDeviceFormat *)self videoSupportedFrameRateRanges];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    double v7 = 0.0;
    double v8 = 3.40282347e38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v10 minFrameRate];
        if (v11 < v8)
        {
          [v10 minFrameRate];
          double v8 = v12;
        }
        [v10 maxFrameRate];
        if (v13 > v7)
        {
          [v10 maxFrameRate];
          double v7 = v14;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 3.40282347e38;
  }
  double v16 = 30.0;
  if (v7 <= 30.0) {
    double v16 = v7;
  }
  return +[AVFrameRateRange frameRateRangeWithMinRate:(int)v8 maxFrameRate:(int)v16];
}

- (AVFrameRateRange)videoFrameRateRangeForStudioLight
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(AVCaptureDeviceFormat *)self isStudioLightSupported]) {
    return 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  float v3 = [(AVCaptureDeviceFormat *)self videoSupportedFrameRateRanges];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    double v7 = 0.0;
    double v8 = 3.40282347e38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v10 minFrameRate];
        if (v11 < v8)
        {
          [v10 minFrameRate];
          double v8 = v12;
        }
        [v10 maxFrameRate];
        if (v13 > v7)
        {
          [v10 maxFrameRate];
          double v7 = v14;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 3.40282347e38;
  }
  double v16 = 30.0;
  if (v7 <= 30.0) {
    double v16 = v7;
  }
  return +[AVFrameRateRange frameRateRangeWithMinRate:(int)v8 maxFrameRate:(int)v16];
}

- (AVFrameRateRange)videoFrameRateRangeForReactionEffectsInProgress
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(AVCaptureDeviceFormat *)self reactionEffectsSupported]) {
    return 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  float v3 = [(AVCaptureDeviceFormat *)self videoSupportedFrameRateRanges];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    double v7 = 0.0;
    double v8 = 3.40282347e38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v10 minFrameRate];
        if (v11 < v8)
        {
          [v10 minFrameRate];
          double v8 = v12;
        }
        [v10 maxFrameRate];
        if (v13 > v7)
        {
          [v10 maxFrameRate];
          double v7 = v14;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 3.40282347e38;
  }
  double v16 = 30.0;
  if (v7 <= 30.0) {
    double v16 = v7;
  }
  return +[AVFrameRateRange frameRateRangeWithMinRate:(int)v8 maxFrameRate:(int)v16];
}

- (id)videoFrameRateRangeForBackgroundReplacement
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (![(AVCaptureDeviceFormat *)self isBackgroundReplacementSupported]) {
    return 0;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  float v3 = [(AVCaptureDeviceFormat *)self videoSupportedFrameRateRanges];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    double v7 = 0.0;
    double v8 = 3.40282347e38;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v10 minFrameRate];
        if (v11 < v8)
        {
          [v10 minFrameRate];
          double v8 = v12;
        }
        [v10 maxFrameRate];
        if (v13 > v7)
        {
          [v10 maxFrameRate];
          double v7 = v14;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = 0.0;
    double v8 = 3.40282347e38;
  }
  double v16 = 30.0;
  if (v7 <= 30.0) {
    double v16 = v7;
  }
  return +[AVFrameRateRange frameRateRangeWithMinRate:(int)v8 maxFrameRate:(int)v16];
}

- (BOOL)isVideoStabilizationSupported
{
  if (AVGestaltGetBoolAnswer(@"AVGQCaptureConnectionCinematicVISAwareAPIsAreAvailable"))
  {
    uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "environment"), "objectForKeyedSubscript:", @"SKIP_DEPRECATED_LOG");
    if (([v4 isEqualToString:@"YES"] & 1) == 0
      && ([v4 isEqualToString:@"yes"] & 1) == 0
      && ([v4 isEqualToString:@"1"] & 1) == 0)
    {
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = NSStringFromSelector(a2);
      NSLog(&cfstr_Warning0xXIsDe.isa, v5, self, v6, @"-[AVCaptureDeviceFormat isVideoStabilizationModeSupported:]");
    }
  }
  id v7 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v7 isStabilizationModeSupported:1];
}

- (BOOL)isGlobalToneMappingSupported
{
  internal = self->_internal;
  if (internal->isDepthDataFormat) {
    return 0;
  }
  id v4 = [(NSDictionary *)internal->fcSourceAttributes objectForKeyedSubscript:*MEMORY[0x1E4F51BB0]];

  return [v4 BOOLValue];
}

- (CMVideoDimensions)highResolutionStillImageDimensions
{
  return (CMVideoDimensions)[(AVCaptureDeviceFormat *)self defaultPhotoDimensionsWithHighResolutionCaptureEnabled:1];
}

- (NSArray)unsupportedCaptureOutputClasses
{
  if ([(AVCaptureDeviceFormat *)self isPhotoFormat]
    && (AVGestaltGetBoolAnswer(@"AVGQCaptureMFOSupportsPhotoFormats") & 1) == 0)
  {
    float v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    [v3 addObject:objc_opt_class()];
  }
  else
  {
    float v3 = 0;
  }
  if (![(AVCaptureDeviceFormat *)self isStreamingDisparitySupported]
    && ![(AVCaptureDeviceFormat *)self isStreamingDepthSupported])
  {
    if (!v3) {
      float v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    }
    [v3 addObject:objc_opt_class()];
  }
  if (!v3) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = (void *)MEMORY[0x1E4F1C978];

  return (NSArray *)[v4 arrayWithArray:v3];
}

- (BOOL)isCenterStageSupportedForContinuityCamera
{
  return self->_internal->centerStageSupportedForContinuityCamera;
}

- (BOOL)isManualFramingSupported
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 isManualFramingSupported];
}

- (BOOL)isBackgroundBlurSupportedForContinuityCamera
{
  return self->_internal->backgroundBlurSupportedForContinuityCamera;
}

- (BOOL)isBackgroundBlurApertureSupported
{
  return self->_internal->backgroundBlurSupported;
}

- (BOOL)isStudioLightingSupportedForContinuityCamera
{
  return self->_internal->studioLightingSupportedForContinuityCamera;
}

- (BOOL)isStudioLightingIntensitySupported
{
  return self->_internal->studioLightingSupported;
}

- (BOOL)reactionEffectsSupportedForContinuityCamera
{
  return self->_internal->reactionEffectsSupportedForContinuityCamera;
}

- (BOOL)isBackgroundReplacementSupportedForContinuityCamera
{
  return self->_internal->backgroundReplacementSupportedForContinuityCamera;
}

- ($2825F4736939C4A6D3AD43837233062D)previewDimensions
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return ($2825F4736939C4A6D3AD43837233062D)[v2 previewDimensions];
}

- (id)optimizedVideoPreviewFilterNames
{
  if ([(FigCaptureSourceFormat *)self->_internal->sourceFormat mediaType] != 1986618469) {
    return (id)MEMORY[0x1E4F1CBF0];
  }
  float v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", @"CIPhotoEffectChrome", @"CIPhotoEffectFade", @"CIPhotoEffectInstant", @"CIPhotoEffectMono", @"CIPhotoEffectNoir", @"CIPhotoEffectProcess", @"CIPhotoEffectTonal", @"CIPhotoEffectTransfer", @"CIPhotoEffect3DVivid", @"CIPhotoEffect3DVividWarm", @"CIPhotoEffect3DVividCool", @"CIPhotoEffect3DDramatic", @"CIPhotoEffect3DDramaticWarm", @"CIPhotoEffect3DDramaticCool", @"CIPhotoEffect3DSilverplate", @"CIPhotoEffect3DNoir", @"CIDepthEffect",
                 @"CIPhotoEffect3DCommercial",
                 @"CIPortraitEffectLight",
                 @"CIPortraitEffectCommercial",
                 @"CIPortraitEffectStudio",
                 @"CIPortraitEffectContour",
                 @"CIPortraitEffectBlack",
                 @"CIPortraitEffectStage",
                 @"CIPortraitEffectBlackoutMono",
                 @"CIPortraitEffectStageMono",
                 @"CIPortraitEffectStudioV2",
                 @"CIPortraitEffectContourV2",
                 @"CIPortraitEffectStageV2",
                 @"CIPortraitEffectStageMonoV2",
                 @"CIPortraitEffectStageWhite",
                 0);
  if (objc_msgSend(-[AVCaptureDeviceFormat figCaptureSourceVideoFormat](self, "figCaptureSourceVideoFormat"), "isStreamingDisparitySupported"))objc_msgSend(v3, "addObject:", AVCaptureShallowDepthOfFieldCIFilterName); {
  return v3;
  }
}

- (float)hardwareCost
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  [v2 hardwareCost];
  return result;
}

- (int)baseSensorPowerConsumption
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 baseSensorPowerConsumption];
}

- (int)variableSensorPowerConsumption
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 variableSensorPowerConsumption];
}

- (int)ispPowerConsumption
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  return [v2 ispPowerConsumption];
}

- (BOOL)isAutoVideoFrameRateSupported
{
  if ([(AVCaptureDeviceFormat *)self isVariableFrameRateVideoCaptureSupported])
  {
    return 1;
  }

  return [(AVCaptureDeviceFormat *)self isLowLightVideoCaptureSupported];
}

- (float)spatialOverCapturePercentage
{
  id v2 = [(AVCaptureDeviceFormat *)self figCaptureSourceVideoFormat];

  [v2 spatialOverCapturePercentage];
  return result;
}

- (BOOL)maxPhotoDimensionsAreUltraHighResolution:(id)a3 privateDimensionsEnabled:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  supportedMaxPhotoCMVideoDimensions Dimensions = self->_internal->supportedMaxPhotoDimensions;
  uint64_t v7 = [(NSArray *)supportedMaxPhotoDimensions countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(supportedMaxPhotoDimensions);
        }
        double v11 = *(void **)(*((void *)&v14 + 1) + 8 * v10);
        if ([v11 isPrivate]) {
          BOOL v12 = !v4;
        }
        else {
          BOOL v12 = 0;
        }
        if (!v12
          && [v11 dimensionsAreEqualToDimensions:a3]
          && [v11 flavor] == 2)
        {
          LOBYTE(v7) = 1;
          return v7;
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [(NSArray *)supportedMaxPhotoDimensions countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v7;
}

- (double)focalLengthIn35mmFilmWithGeometricDistortionCorrection:(BOOL)a3
{
  if (a3) {
    [(AVCaptureDeviceFormat *)self geometricDistortionCorrectedVideoFieldOfView];
  }
  else {
    [(AVCaptureDeviceFormat *)self videoFieldOfView];
  }
  float v5 = v4;
  uint64_t v6 = objc_msgSend(-[NSArray firstObject](-[AVCaptureDeviceFormat supportedMaxPhotoDimensions](self, "supportedMaxPhotoDimensions"), "firstObject"), "CMVideoDimensionsValue");
  if (HIDWORD(v6)) {
    double v7 = (float)((float)(int)v6 / (float)SHIDWORD(v6));
  }
  else {
    double v7 = 1.33333333;
  }
  long double v8 = tan(v5 * 3.14159265 / 180.0 * 0.5);
  return 36.0 / (v8 + v8) / (sqrt(36.0 / v7 * (36.0 / v7) + 1296.0) / 43.266615);
}

@end