@interface VCVirtualAVCaptureDeviceFormat
- ($2825F4736939C4A6D3AD43837233062D)highResolutionStillImageDimensions;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minExposureDuration;
- (BOOL)isBackgroundReplacementSupported;
- (BOOL)isBackgroundReplacementSupportedForContinuityCamera;
- (BOOL)isCenterStageSupported;
- (BOOL)isEqual:(id)a3;
- (BOOL)isGlobalToneMappingSupported;
- (BOOL)isHighPhotoQualitySupported;
- (BOOL)isHighestPhotoQualitySupported;
- (BOOL)isPortraitEffectSupported;
- (BOOL)isStudioLightSupported;
- (BOOL)isVideoBinned;
- (BOOL)isVideoHDRSupported;
- (BOOL)isVideoStabilizationModeSupported:(int64_t)a3;
- (BOOL)isVideoStabilizationSupported;
- (BOOL)reactionEffectsSupported;
- (NSArray)secondaryNativeResolutionZoomFactors;
- (NSArray)supportedColorSpaces;
- (NSArray)supportedDepthDataFormats;
- (NSArray)supportedMaxPhotoDimensions;
- (NSArray)supportedVideoZoomFactorsForDepthDataDelivery;
- (NSArray)unsupportedCaptureOutputClasses;
- (NSArray)videoSupportedFrameRateRanges;
- (NSString)mediaType;
- (double)videoMaxZoomFactor;
- (double)videoMaxZoomFactorForDepthDataDelivery;
- (double)videoMinZoomFactorForDepthDataDelivery;
- (double)videoZoomFactorUpscaleThreshold;
- (float)maxISO;
- (float)minISO;
- (float)videoFieldOfView;
- (id)description;
- (id)descriptionWithLocale:(id)a3;
- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4;
- (int64_t)autoFocusSystem;
- (opaqueCMFormatDescription)formatDescription;
- (void)dealloc;
- (void)setAutoFocusSystem:(int64_t)a3;
- (void)setBackgroundReplacementSupported:(BOOL)a3;
- (void)setBackgroundReplacementSupportedForContinuityCamera:(BOOL)a3;
- (void)setCenterStageSupported:(BOOL)a3;
- (void)setFormatDescription:(opaqueCMFormatDescription *)a3;
- (void)setGlobalToneMappingSupported:(BOOL)a3;
- (void)setHighPhotoQualitySupported:(BOOL)a3;
- (void)setHighResolutionStillImageDimensions:(id)a3;
- (void)setHighestPhotoQualitySupported:(BOOL)a3;
- (void)setMaxExposureDuration:(id *)a3;
- (void)setMaxISO:(float)a3;
- (void)setMediaType:(id)a3;
- (void)setMinExposureDuration:(id *)a3;
- (void)setMinISO:(float)a3;
- (void)setPortraitEffectSupported:(BOOL)a3;
- (void)setReactionEffectsSupported:(BOOL)a3;
- (void)setSecondaryNativeResolutionZoomFactors:(id)a3;
- (void)setStudioLightSupported:(BOOL)a3;
- (void)setSupportedColorSpaces:(id)a3;
- (void)setSupportedDepthDataFormats:(id)a3;
- (void)setSupportedMaxPhotoDimensions:(id)a3;
- (void)setSupportedVideoZoomFactorsForDepthDataDelivery:(id)a3;
- (void)setUnsupportedCaptureOutputClasses:(id)a3;
- (void)setVideoBinned:(BOOL)a3;
- (void)setVideoFieldOfView:(float)a3;
- (void)setVideoHDRSupported:(BOOL)a3;
- (void)setVideoMaxZoomFactor:(double)a3;
- (void)setVideoMaxZoomFactorForDepthDataDelivery:(double)a3;
- (void)setVideoMinZoomFactorForDepthDataDelivery:(double)a3;
- (void)setVideoStabilizationSupported:(BOOL)a3;
- (void)setVideoSupportedFrameRateRanges:(id)a3;
- (void)setVideoZoomFactorUpscaleThreshold:(double)a3;
@end

@implementation VCVirtualAVCaptureDeviceFormat

- (BOOL)isVideoStabilizationModeSupported:(int64_t)a3
{
  return self->_videoStabilizationMode;
}

- (void)setFormatDescription:(opaqueCMFormatDescription *)a3
{
  formatDescription = self->_formatDescription;
  self->_formatDescription = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (formatDescription)
  {
    CFRelease(formatDescription);
  }
}

- (opaqueCMFormatDescription)formatDescription
{
  return self->_formatDescription;
}

- (id)description
{
  return [(VCVirtualAVCaptureDeviceFormat *)self descriptionWithLocale:0];
}

- (id)descriptionWithLocale:(id)a3
{
  return [(VCVirtualAVCaptureDeviceFormat *)self descriptionWithLocale:0 indent:0];
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  v4 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v4);
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  formatDescription = self->_formatDescription;
  if (formatDescription)
  {
    CFRelease(formatDescription);
    self->_formatDescription = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VCVirtualAVCaptureDeviceFormat;
  [(VCVirtualAVCaptureDeviceFormat *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_43;
  }
  int v5 = -[NSString isEqual:](self->_mediaType, "isEqual:", [a3 mediaType]);
  if (!v5) {
    return v5;
  }
  int v5 = CMFormatDescriptionEqual(self->_formatDescription, (CMFormatDescriptionRef)[a3 formatDescription]);
  if (!v5) {
    return v5;
  }
  int v5 = -[NSArray isEqual:](self->_videoSupportedFrameRateRanges, "isEqual:", [a3 videoSupportedFrameRateRanges]);
  if (!v5) {
    return v5;
  }
  float videoFieldOfView = self->_videoFieldOfView;
  [a3 videoFieldOfView];
  if ((float)(videoFieldOfView - v7) >= 0.00000011921) {
    goto LABEL_43;
  }
  int videoBinned = self->_videoBinned;
  if (videoBinned != [a3 isVideoBinned]) {
    goto LABEL_43;
  }
  int videoStabilizationSupported = self->_videoStabilizationSupported;
  if (videoStabilizationSupported != [a3 isVideoStabilizationSupported]) {
    goto LABEL_43;
  }
  double videoMaxZoomFactor = self->_videoMaxZoomFactor;
  [a3 videoMaxZoomFactor];
  if (videoMaxZoomFactor - v11 >= 2.22044605e-16) {
    goto LABEL_43;
  }
  double videoZoomFactorUpscaleThreshold = self->_videoZoomFactorUpscaleThreshold;
  [a3 videoZoomFactorUpscaleThreshold];
  if (videoZoomFactorUpscaleThreshold - v13 >= 2.22044605e-16) {
    goto LABEL_43;
  }
  if (a3) {
    [a3 minExposureDuration];
  }
  else {
    memset(&time2, 0, sizeof(time2));
  }
  CMTime time1 = (CMTime)self->_minExposureDuration;
  if (CMTimeCompare(&time1, &time2)) {
    goto LABEL_43;
  }
  if (a3) {
    [a3 maxExposureDuration];
  }
  else {
    memset(&v36, 0, sizeof(v36));
  }
  CMTime time1 = (CMTime)self->_maxExposureDuration;
  if (CMTimeCompare(&time1, &v36)) {
    goto LABEL_43;
  }
  float minISO = self->_minISO;
  [a3 minISO];
  if ((float)(minISO - v15) >= 0.00000011921) {
    goto LABEL_43;
  }
  float maxISO = self->_maxISO;
  [a3 maxISO];
  if ((float)(maxISO - v17) >= 0.00000011921) {
    goto LABEL_43;
  }
  int globalToneMappingSupported = self->_globalToneMappingSupported;
  if (globalToneMappingSupported != [a3 isGlobalToneMappingSupported]) {
    goto LABEL_43;
  }
  int videoHDRSupported = self->_videoHDRSupported;
  if (videoHDRSupported != [a3 isVideoHDRSupported]) {
    goto LABEL_43;
  }
  int width = self->_highResolutionStillImageDimensions.width;
  if (width != [a3 highResolutionStillImageDimensions]) {
    goto LABEL_43;
  }
  int height = self->_highResolutionStillImageDimensions.height;
  if (height != (unint64_t)[a3 highResolutionStillImageDimensions] >> 32) {
    goto LABEL_43;
  }
  int highPhotoQualitySupported = self->_highPhotoQualitySupported;
  if (highPhotoQualitySupported != [a3 isHighPhotoQualitySupported]) {
    goto LABEL_43;
  }
  int highestPhotoQualitySupported = self->_highestPhotoQualitySupported;
  if (highestPhotoQualitySupported != [a3 isHighestPhotoQualitySupported]) {
    goto LABEL_43;
  }
  int portraitEffectSupported = self->_portraitEffectSupported;
  if (portraitEffectSupported != [a3 isPortraitEffectSupported]) {
    goto LABEL_43;
  }
  int64_t autoFocusSystem = self->_autoFocusSystem;
  if (autoFocusSystem != [a3 autoFocusSystem]) {
    goto LABEL_43;
  }
  int v5 = -[NSArray isEqual:](self->_supportedColorSpaces, "isEqual:", [a3 supportedColorSpaces]);
  if (!v5) {
    return v5;
  }
  double videoMinZoomFactorForDepthDataDelivery = self->_videoMinZoomFactorForDepthDataDelivery;
  [a3 videoMinZoomFactorForDepthDataDelivery];
  if (videoMinZoomFactorForDepthDataDelivery - v27 >= 2.22044605e-16) {
    goto LABEL_43;
  }
  double videoMaxZoomFactorForDepthDataDelivery = self->_videoMaxZoomFactorForDepthDataDelivery;
  [a3 videoMaxZoomFactorForDepthDataDelivery];
  if (videoMaxZoomFactorForDepthDataDelivery - v29 >= 2.22044605e-16) {
    goto LABEL_43;
  }
  int v5 = -[NSArray isEqual:](self->_supportedVideoZoomFactorsForDepthDataDelivery, "isEqual:", [a3 supportedVideoZoomFactorsForDepthDataDelivery]);
  if (!v5) {
    return v5;
  }
  int v5 = -[NSArray isEqual:](self->_supportedDepthDataFormats, "isEqual:", [a3 supportedDepthDataFormats]);
  if (!v5) {
    return v5;
  }
  int v5 = -[NSArray isEqual:](self->_unsupportedCaptureOutputClasses, "isEqual:", [a3 unsupportedCaptureOutputClasses]);
  if (!v5) {
    return v5;
  }
  int v5 = -[NSArray isEqual:](self->_supportedMaxPhotoDimensions, "isEqual:", [a3 supportedMaxPhotoDimensions]);
  if (!v5) {
    return v5;
  }
  int v5 = -[NSArray isEqual:](self->_secondaryNativeResolutionZoomFactors, "isEqual:", [a3 secondaryNativeResolutionZoomFactors]);
  if (!v5) {
    return v5;
  }
  int centerStageSupported = self->_centerStageSupported;
  if (centerStageSupported != [a3 isCenterStageSupported]
    || (int v31 = -[VCVirtualAVCaptureDeviceFormat isVideoStabilizationModeSupported:](self, "isVideoStabilizationModeSupported:", -1), v31 != [a3 isVideoStabilizationModeSupported:-1]))
  {
LABEL_43:
    LOBYTE(v5) = 0;
    return v5;
  }
  uint64_t v32 = -1;
  do
  {
    uint64_t v33 = v32;
    if (v32 == 3) {
      break;
    }
    ++v32;
    int v34 = [(VCVirtualAVCaptureDeviceFormat *)self isVideoStabilizationModeSupported:v33 + 1];
  }
  while (v34 == [a3 isVideoStabilizationModeSupported:v33 + 1]);
  LOBYTE(v5) = v33 > 2;
  return v5;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (void)setMediaType:(id)a3
{
}

- (NSArray)videoSupportedFrameRateRanges
{
  return self->_videoSupportedFrameRateRanges;
}

- (void)setVideoSupportedFrameRateRanges:(id)a3
{
}

- (float)videoFieldOfView
{
  return self->_videoFieldOfView;
}

- (void)setVideoFieldOfView:(float)a3
{
  self->_float videoFieldOfView = a3;
}

- (BOOL)isVideoBinned
{
  return self->_videoBinned;
}

- (void)setVideoBinned:(BOOL)a3
{
  self->_int videoBinned = a3;
}

- (BOOL)isVideoStabilizationSupported
{
  return self->_videoStabilizationSupported;
}

- (void)setVideoStabilizationSupported:(BOOL)a3
{
  self->_int videoStabilizationSupported = a3;
}

- (double)videoMaxZoomFactor
{
  return self->_videoMaxZoomFactor;
}

- (void)setVideoMaxZoomFactor:(double)a3
{
  self->_double videoMaxZoomFactor = a3;
}

- (double)videoZoomFactorUpscaleThreshold
{
  return self->_videoZoomFactorUpscaleThreshold;
}

- (void)setVideoZoomFactorUpscaleThreshold:(double)a3
{
  self->_double videoZoomFactorUpscaleThreshold = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minExposureDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 64);
  return self;
}

- (void)setMinExposureDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_minExposureDuration.value = *(_OWORD *)&a3->var0;
  self->_minExposureDuration.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxExposureDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 88);
  return self;
}

- (void)setMaxExposureDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_maxExposureDuration.value = *(_OWORD *)&a3->var0;
  self->_maxExposureDuration.epoch = var3;
}

- (float)minISO
{
  return self->_minISO;
}

- (void)setMinISO:(float)a3
{
  self->_float minISO = a3;
}

- (float)maxISO
{
  return self->_maxISO;
}

- (void)setMaxISO:(float)a3
{
  self->_float maxISO = a3;
}

- (BOOL)isGlobalToneMappingSupported
{
  return self->_globalToneMappingSupported;
}

- (void)setGlobalToneMappingSupported:(BOOL)a3
{
  self->_int globalToneMappingSupported = a3;
}

- (BOOL)isVideoHDRSupported
{
  return self->_videoHDRSupported;
}

- (void)setVideoHDRSupported:(BOOL)a3
{
  self->_int videoHDRSupported = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)highResolutionStillImageDimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_highResolutionStillImageDimensions;
}

- (void)setHighResolutionStillImageDimensions:(id)a3
{
  self->_highResolutionStillImageDimensions = ($470D365275581EF16070F5A11344F73E)a3;
}

- (BOOL)isHighPhotoQualitySupported
{
  return self->_highPhotoQualitySupported;
}

- (void)setHighPhotoQualitySupported:(BOOL)a3
{
  self->_int highPhotoQualitySupported = a3;
}

- (BOOL)isHighestPhotoQualitySupported
{
  return self->_highestPhotoQualitySupported;
}

- (void)setHighestPhotoQualitySupported:(BOOL)a3
{
  self->_int highestPhotoQualitySupported = a3;
}

- (BOOL)isPortraitEffectSupported
{
  return self->_portraitEffectSupported;
}

- (void)setPortraitEffectSupported:(BOOL)a3
{
  self->_int portraitEffectSupported = a3;
}

- (int64_t)autoFocusSystem
{
  return self->_autoFocusSystem;
}

- (void)setAutoFocusSystem:(int64_t)a3
{
  self->_int64_t autoFocusSystem = a3;
}

- (NSArray)supportedColorSpaces
{
  return self->_supportedColorSpaces;
}

- (void)setSupportedColorSpaces:(id)a3
{
}

- (double)videoMinZoomFactorForDepthDataDelivery
{
  return self->_videoMinZoomFactorForDepthDataDelivery;
}

- (void)setVideoMinZoomFactorForDepthDataDelivery:(double)a3
{
  self->_double videoMinZoomFactorForDepthDataDelivery = a3;
}

- (double)videoMaxZoomFactorForDepthDataDelivery
{
  return self->_videoMaxZoomFactorForDepthDataDelivery;
}

- (void)setVideoMaxZoomFactorForDepthDataDelivery:(double)a3
{
  self->_double videoMaxZoomFactorForDepthDataDelivery = a3;
}

- (NSArray)supportedVideoZoomFactorsForDepthDataDelivery
{
  return self->_supportedVideoZoomFactorsForDepthDataDelivery;
}

- (void)setSupportedVideoZoomFactorsForDepthDataDelivery:(id)a3
{
}

- (NSArray)supportedDepthDataFormats
{
  return self->_supportedDepthDataFormats;
}

- (void)setSupportedDepthDataFormats:(id)a3
{
}

- (NSArray)unsupportedCaptureOutputClasses
{
  return self->_unsupportedCaptureOutputClasses;
}

- (void)setUnsupportedCaptureOutputClasses:(id)a3
{
}

- (NSArray)supportedMaxPhotoDimensions
{
  return self->_supportedMaxPhotoDimensions;
}

- (void)setSupportedMaxPhotoDimensions:(id)a3
{
}

- (NSArray)secondaryNativeResolutionZoomFactors
{
  return self->_secondaryNativeResolutionZoomFactors;
}

- (void)setSecondaryNativeResolutionZoomFactors:(id)a3
{
}

- (BOOL)isCenterStageSupported
{
  return self->_centerStageSupported;
}

- (void)setCenterStageSupported:(BOOL)a3
{
  self->_int centerStageSupported = a3;
}

- (BOOL)reactionEffectsSupported
{
  return self->_reactionEffectsSupported;
}

- (void)setReactionEffectsSupported:(BOOL)a3
{
  self->_reactionEffectsSupported = a3;
}

- (BOOL)isStudioLightSupported
{
  return self->_studioLightSupported;
}

- (void)setStudioLightSupported:(BOOL)a3
{
  self->_studioLightSupported = a3;
}

- (BOOL)isBackgroundReplacementSupported
{
  return self->_backgroundReplacementSupported;
}

- (void)setBackgroundReplacementSupported:(BOOL)a3
{
  self->_backgroundReplacementSupported = a3;
}

- (BOOL)isBackgroundReplacementSupportedForContinuityCamera
{
  return self->_backgroundReplacementSupportedForContinuityCamera;
}

- (void)setBackgroundReplacementSupportedForContinuityCamera:(BOOL)a3
{
  self->_backgroundReplacementSupportedForContinuityCamera = a3;
}

@end