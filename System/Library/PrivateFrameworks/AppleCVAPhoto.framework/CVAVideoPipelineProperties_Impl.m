@interface CVAVideoPipelineProperties_Impl
+ (id)allSupportedYCbCrPixelFormats;
- (BOOL)canSkipDisparityHoleFillingAndTemporalRejection;
- (BOOL)modulateFocalRatio;
- (BOOL)sceneMonitorUsesDisparityStatistics;
- (BOOL)supportsForegroundBlur;
- (BOOL)validateWithError:(id *)a3;
- (NSArray)supportedColorPixelBufferPixelFormats;
- (NSArray)supportedInputSegmentationPixelBufferPixelFormats;
- (NSDictionary)faceKitProcessOutputOverride;
- (double)sdofStateMachineMaxOrientationDifference;
- (double)stageLightStageMachineMaxOrientationDifference;
- (float)alphaCoeffFilterColorStd;
- (float)alphaCoeffFilterColorStdFast;
- (float)alphaContrastExponent;
- (float)alphaGammaExponent;
- (float)alphaMaxLaplacian;
- (float)backgroundDisparityUpdateRate;
- (float)backgroundSeparationLikelihoodHigh;
- (float)backgroundSeparationLikelihoodLow;
- (float)centerDeltaCanonicalDisparity;
- (float)closeDisparityPercentile;
- (float)colorPixelBufferFocalLength_mm;
- (float)colorPixelBufferFocalRatio;
- (float)colorPixelBufferPixelSize_um;
- (float)deltaCanonicalDisparity;
- (float)deltaDepth;
- (float)depthPixelBufferMaxLeftOcclusionDisparityChange;
- (float)depthPixelBufferMaxRightOcclusionDisparityChange;
- (float)depthPixelBufferOffset;
- (float)depthPixelBufferScale;
- (float)depthQualityMetricFocalPlaneOffsetMeters;
- (float)disparityFilterColorStd;
- (float)disparityFilterUpdateRate;
- (float)disparityStereoBaselineMeters;
- (float)disparityStereoFocalLengthPixels;
- (float)dsCanonicalHighScale;
- (float)dsCanonicalHighThld;
- (float)dsCanonicalLowScale;
- (float)dsCanonicalLowThld;
- (float)fNumberMultiplier;
- (float)faceSizeRatioInFocus;
- (float)focusDistanceOverride;
- (float)focusThresholdHardness;
- (float)focusUpdateRateFast;
- (float)focusUpdateRateSlow;
- (float)foregroundMaskDilationRadius;
- (float)foregroundPercentile;
- (float)gainMultiplierNoiseBitCalculation;
- (float)guidedFilterMinDistToDeweight;
- (float)guidedFilterUnconfidentWeight;
- (float)infConvolutionDownsampling;
- (float)invalidDisparityRatioUpdateRate;
- (float)laplacianLimitingBlurSize;
- (float)laplacianLimitingDownsampling;
- (float)linearDeltaDepthMultiplier;
- (float)linearDeltaDepthOffset;
- (float)luxMultiplierNoiseBitCalculation;
- (float)mattingUpdateRate;
- (float)mattingUpdateRateFast;
- (float)maxDeltaCanonicalDisparity;
- (float)maxDisparityFillingDistFromForeground;
- (float)maxDisparityFillingInconsistency;
- (float)maximumSimilarityToKeepDisparity;
- (float)minDeltaCanonicalDisparity;
- (float)minimumConfidenceToKeepDisparity;
- (float)offsetNoiseBitCalculation;
- (float)outputDisparityOffset;
- (float)portraitStyleStrengthOverride;
- (float)referenceDisparity;
- (float)relightEffectStrength;
- (float)renderingDisparityBlurRadius;
- (float)renderingDisparityUpdateRate;
- (float)renderingLensFocalLength;
- (float)sdofStateMachineIntensityIncrement;
- (float)stableBackgroundDisparitySumVariance;
- (float)stableInvalidDisparityRatio;
- (float)stageLightStateMachineIntensityIncrement;
- (float)unstableBackgroundDisparitySumVariance;
- (float)unstableInvalidDisparityRatio;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForVideoPipelineDevice:(unint64_t)a3;
- (int)backgroundDisparityStatsWindowSize;
- (int)depthErosionRadius;
- (int)depthPixelBufferXPadding;
- (int)depthPixelBufferXReplication;
- (int)depthPixelBufferYPadding;
- (int)depthPixelBufferYReplication;
- (int)disparityPushingBackgroundToForegroundDisparityDifference;
- (int)guidedFilterHeight;
- (int)guidedFilterWidth;
- (int)invalidDisparityRatioStatsWindowSize;
- (int)maxDistToPushDisparityEdgesFwd;
- (int)maxDistToPushDisparityEdgesRev;
- (int)maxFramesWithoutFace;
- (int)rawShiftInvalidThreshold;
- (int)relightDisplayMode;
- (int)segmentationBinarizationThreshold;
- (unint64_t)alphaMattePixelBufferHeight;
- (unint64_t)alphaMattePixelBufferWidth;
- (unint64_t)colorPixelBufferHeight;
- (unint64_t)colorPixelBufferWidth;
- (unint64_t)focusStatisticsXTileCount;
- (unint64_t)focusStatisticsYTileCount;
- (unint64_t)inputDisparityPixelBufferHeight;
- (unint64_t)inputDisparityPixelBufferWidth;
- (unint64_t)inputToOutputDisparityPixelBufferRotation;
- (unint64_t)outputDisparityPixelBufferHeight;
- (unint64_t)outputDisparityPixelBufferWidth;
- (unint64_t)proxyToFaceEffectLerpNumFrames;
- (unint64_t)videoPipelineDevice;
- (unsigned)alphaMattePixelBufferPixelFormat;
- (unsigned)inputDisparityPixelBufferPixelFormat;
- (unsigned)outputDisparityPixelBufferPixelFormat;
- (void)setAlphaCoeffFilterColorStd:(float)a3;
- (void)setAlphaCoeffFilterColorStdFast:(float)a3;
- (void)setAlphaContrastExponent:(float)a3;
- (void)setAlphaGammaExponent:(float)a3;
- (void)setAlphaMattePixelBufferHeight:(unint64_t)a3;
- (void)setAlphaMattePixelBufferWidth:(unint64_t)a3;
- (void)setAlphaMaxLaplacian:(float)a3;
- (void)setBackgroundDisparityStatsWindowSize:(int)a3;
- (void)setBackgroundDisparityUpdateRate:(float)a3;
- (void)setBackgroundSeparationLikelihoodHigh:(float)a3;
- (void)setBackgroundSeparationLikelihoodLow:(float)a3;
- (void)setCanSkipDisparityHoleFillingAndTemporalRejection:(BOOL)a3;
- (void)setCenterDeltaCanonicalDisparity:(float)a3;
- (void)setCloseDisparityPercentile:(float)a3;
- (void)setColorPixelBufferFocalLength_mm:(float)a3;
- (void)setColorPixelBufferFocalRatio:(float)a3;
- (void)setColorPixelBufferHeight:(unint64_t)a3;
- (void)setColorPixelBufferPixelSize_um:(float)a3;
- (void)setColorPixelBufferWidth:(unint64_t)a3;
- (void)setDeltaCanonicalDisparity:(float)a3;
- (void)setDeltaDepth:(float)a3;
- (void)setDepthErosionRadius:(int)a3;
- (void)setDepthPixelBufferMaxLeftOcclusionDisparityChange:(float)a3;
- (void)setDepthPixelBufferMaxRightOcclusionDisparityChange:(float)a3;
- (void)setDepthPixelBufferOffset:(float)a3;
- (void)setDepthPixelBufferScale:(float)a3;
- (void)setDepthPixelBufferXPadding:(int)a3;
- (void)setDepthPixelBufferXReplication:(int)a3;
- (void)setDepthPixelBufferYPadding:(int)a3;
- (void)setDepthPixelBufferYReplication:(int)a3;
- (void)setDepthQualityMetricFocalPlaneOffsetMeters:(float)a3;
- (void)setDisparityFilterColorStd:(float)a3;
- (void)setDisparityFilterUpdateRate:(float)a3;
- (void)setDisparityPushingBackgroundToForegroundDisparityDifference:(int)a3;
- (void)setDisparityStereoBaselineMeters:(float)a3;
- (void)setDisparityStereoFocalLengthPixels:(float)a3;
- (void)setDsCanonicalHighScale:(float)a3;
- (void)setDsCanonicalHighThld:(float)a3;
- (void)setDsCanonicalLowScale:(float)a3;
- (void)setDsCanonicalLowThld:(float)a3;
- (void)setFNumberMultiplier:(float)a3;
- (void)setFaceKitProcessOutputOverride:(id)a3;
- (void)setFaceSizeRatioInFocus:(float)a3;
- (void)setFocusDistanceOverride:(float)a3;
- (void)setFocusStatisticsXTileCount:(unint64_t)a3;
- (void)setFocusStatisticsYTileCount:(unint64_t)a3;
- (void)setFocusThresholdHardness:(float)a3;
- (void)setFocusUpdateRateFast:(float)a3;
- (void)setFocusUpdateRateSlow:(float)a3;
- (void)setForegroundMaskDilationRadius:(float)a3;
- (void)setForegroundPercentile:(float)a3;
- (void)setGainMultiplierNoiseBitCalculation:(float)a3;
- (void)setGuidedFilterHeight:(int)a3;
- (void)setGuidedFilterMinDistToDeweight:(float)a3;
- (void)setGuidedFilterUnconfidentWeight:(float)a3;
- (void)setGuidedFilterWidth:(int)a3;
- (void)setInfConvolutionDownsampling:(float)a3;
- (void)setInputDisparityPixelBufferHeight:(unint64_t)a3;
- (void)setInputDisparityPixelBufferPixelFormat:(unsigned int)a3;
- (void)setInputDisparityPixelBufferWidth:(unint64_t)a3;
- (void)setInputToOutputDisparityPixelBufferRotation:(unint64_t)a3;
- (void)setInvalidDisparityRatioStatsWindowSize:(int)a3;
- (void)setInvalidDisparityRatioUpdateRate:(float)a3;
- (void)setLaplacianLimitingBlurSize:(float)a3;
- (void)setLaplacianLimitingDownsampling:(float)a3;
- (void)setLinearDeltaDepthMultiplier:(float)a3;
- (void)setLinearDeltaDepthOffset:(float)a3;
- (void)setLuxMultiplierNoiseBitCalculation:(float)a3;
- (void)setMattingUpdateRate:(float)a3;
- (void)setMattingUpdateRateFast:(float)a3;
- (void)setMaxDeltaCanonicalDisparity:(float)a3;
- (void)setMaxDisparityFillingDistFromForeground:(float)a3;
- (void)setMaxDisparityFillingInconsistency:(float)a3;
- (void)setMaxDistToPushDisparityEdgesFwd:(int)a3;
- (void)setMaxDistToPushDisparityEdgesRev:(int)a3;
- (void)setMaxFramesWithoutFace:(int)a3;
- (void)setMaximumSimilarityToKeepDisparity:(float)a3;
- (void)setMinDeltaCanonicalDisparity:(float)a3;
- (void)setMinimumConfidenceToKeepDisparity:(float)a3;
- (void)setModulateFocalRatio:(BOOL)a3;
- (void)setOffsetNoiseBitCalculation:(float)a3;
- (void)setOutputDisparityOffset:(float)a3;
- (void)setOutputDisparityPixelBufferHeight:(unint64_t)a3;
- (void)setOutputDisparityPixelBufferWidth:(unint64_t)a3;
- (void)setPortraitStyleStrengthOverride:(float)a3;
- (void)setProxyToFaceEffectLerpNumFrames:(unint64_t)a3;
- (void)setRawShiftInvalidThreshold:(int)a3;
- (void)setReferenceDisparity:(float)a3;
- (void)setRelightDisplayMode:(int)a3;
- (void)setRelightEffectStrength:(float)a3;
- (void)setRenderingDisparityBlurRadius:(float)a3;
- (void)setRenderingDisparityUpdateRate:(float)a3;
- (void)setRenderingLensFocalLength:(float)a3;
- (void)setSceneMonitorUsesDisparityStatistics:(BOOL)a3;
- (void)setSdofStateMachineIntensityIncrement:(float)a3;
- (void)setSdofStateMachineMaxOrientationDifference:(double)a3;
- (void)setSegmentationBinarizationThreshold:(int)a3;
- (void)setStableBackgroundDisparitySumVariance:(float)a3;
- (void)setStableInvalidDisparityRatio:(float)a3;
- (void)setStageLightStageMachineMaxOrientationDifference:(double)a3;
- (void)setStageLightStateMachineIntensityIncrement:(float)a3;
- (void)setSupportsForegroundBlur:(BOOL)a3;
- (void)setUnstableBackgroundDisparitySumVariance:(float)a3;
- (void)setUnstableInvalidDisparityRatio:(float)a3;
@end

@implementation CVAVideoPipelineProperties_Impl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceKitProcessOutputOverride, 0);
  objc_storeStrong((id *)&self->_supportedInputSegmentationPixelBufferPixelFormats, 0);

  objc_storeStrong((id *)&self->_supportedColorPixelBufferPixelFormats, 0);
}

- (void)setRawShiftInvalidThreshold:(int)a3
{
  self->_rawShiftInvalidThreshold = a3;
}

- (int)rawShiftInvalidThreshold
{
  return self->_rawShiftInvalidThreshold;
}

- (void)setGuidedFilterHeight:(int)a3
{
  self->_guidedFilterHeight = a3;
}

- (int)guidedFilterHeight
{
  return self->_guidedFilterHeight;
}

- (void)setGuidedFilterWidth:(int)a3
{
  self->_guidedFilterWidth = a3;
}

- (int)guidedFilterWidth
{
  return self->_guidedFilterWidth;
}

- (void)setDepthErosionRadius:(int)a3
{
  self->_depthErosionRadius = a3;
}

- (int)depthErosionRadius
{
  return self->_depthErosionRadius;
}

- (void)setSegmentationBinarizationThreshold:(int)a3
{
  self->_segmentationBinarizationThreshold = a3;
}

- (int)segmentationBinarizationThreshold
{
  return self->_segmentationBinarizationThreshold;
}

- (void)setProxyToFaceEffectLerpNumFrames:(unint64_t)a3
{
  self->_proxyToFaceEffectLerpNumFrames = a3;
}

- (unint64_t)proxyToFaceEffectLerpNumFrames
{
  return self->_proxyToFaceEffectLerpNumFrames;
}

- (void)setFocusStatisticsYTileCount:(unint64_t)a3
{
  self->_focusStatisticsYTileCount = a3;
}

- (unint64_t)focusStatisticsYTileCount
{
  return self->_focusStatisticsYTileCount;
}

- (void)setFocusStatisticsXTileCount:(unint64_t)a3
{
  self->_focusStatisticsXTileCount = a3;
}

- (unint64_t)focusStatisticsXTileCount
{
  return self->_focusStatisticsXTileCount;
}

- (void)setDepthQualityMetricFocalPlaneOffsetMeters:(float)a3
{
  self->_depthQualityMetricFocalPlaneOffsetMeters = a3;
}

- (float)depthQualityMetricFocalPlaneOffsetMeters
{
  return self->_depthQualityMetricFocalPlaneOffsetMeters;
}

- (void)setBackgroundSeparationLikelihoodLow:(float)a3
{
  self->_backgroundSeparationLikelihoodLow = a3;
}

- (float)backgroundSeparationLikelihoodLow
{
  return self->_backgroundSeparationLikelihoodLow;
}

- (void)setBackgroundSeparationLikelihoodHigh:(float)a3
{
  self->_backgroundSeparationLikelihoodHigh = a3;
}

- (float)backgroundSeparationLikelihoodHigh
{
  return self->_backgroundSeparationLikelihoodHigh;
}

- (void)setUnstableInvalidDisparityRatio:(float)a3
{
  self->_unstableInvalidDisparityRatio = a3;
}

- (float)unstableInvalidDisparityRatio
{
  return self->_unstableInvalidDisparityRatio;
}

- (void)setStableInvalidDisparityRatio:(float)a3
{
  self->_stableInvalidDisparityRatio = a3;
}

- (float)stableInvalidDisparityRatio
{
  return self->_stableInvalidDisparityRatio;
}

- (void)setUnstableBackgroundDisparitySumVariance:(float)a3
{
  self->_unstableBackgroundDisparitySumVariance = a3;
}

- (float)unstableBackgroundDisparitySumVariance
{
  return self->_unstableBackgroundDisparitySumVariance;
}

- (void)setStableBackgroundDisparitySumVariance:(float)a3
{
  self->_stableBackgroundDisparitySumVariance = a3;
}

- (float)stableBackgroundDisparitySumVariance
{
  return self->_stableBackgroundDisparitySumVariance;
}

- (void)setModulateFocalRatio:(BOOL)a3
{
  self->_modulateFocalRatio = a3;
}

- (BOOL)modulateFocalRatio
{
  return self->_modulateFocalRatio;
}

- (void)setSdofStateMachineMaxOrientationDifference:(double)a3
{
  self->_sdofStateMachineMaxOrientationDifference = a3;
}

- (double)sdofStateMachineMaxOrientationDifference
{
  return self->_sdofStateMachineMaxOrientationDifference;
}

- (void)setSdofStateMachineIntensityIncrement:(float)a3
{
  self->_sdofStateMachineIntensityIncrement = a3;
}

- (float)sdofStateMachineIntensityIncrement
{
  return self->_sdofStateMachineIntensityIncrement;
}

- (void)setStageLightStageMachineMaxOrientationDifference:(double)a3
{
  self->_stageLightStageMachineMaxOrientationDifference = a3;
}

- (double)stageLightStageMachineMaxOrientationDifference
{
  return self->_stageLightStageMachineMaxOrientationDifference;
}

- (void)setStageLightStateMachineIntensityIncrement:(float)a3
{
  self->_stageLightStateMachineIntensityIncrement = a3;
}

- (float)stageLightStateMachineIntensityIncrement
{
  return self->_stageLightStateMachineIntensityIncrement;
}

- (void)setFocusDistanceOverride:(float)a3
{
  self->_focusDistanceOverride = a3;
}

- (float)focusDistanceOverride
{
  return self->_focusDistanceOverride;
}

- (void)setPortraitStyleStrengthOverride:(float)a3
{
  self->_portraitStyleStrengthOverride = a3;
}

- (float)portraitStyleStrengthOverride
{
  return self->_portraitStyleStrengthOverride;
}

- (void)setRelightEffectStrength:(float)a3
{
  self->_relightEffectStrength = a3;
}

- (float)relightEffectStrength
{
  return self->_relightEffectStrength;
}

- (void)setFaceKitProcessOutputOverride:(id)a3
{
}

- (NSDictionary)faceKitProcessOutputOverride
{
  return (NSDictionary *)objc_getProperty(self, a2, 456, 1);
}

- (void)setRelightDisplayMode:(int)a3
{
  self->_relightDisplayMode = a3;
}

- (int)relightDisplayMode
{
  return self->_relightDisplayMode;
}

- (void)setLaplacianLimitingBlurSize:(float)a3
{
  self->_laplacianLimitingBlurSize = a3;
}

- (float)laplacianLimitingBlurSize
{
  return self->_laplacianLimitingBlurSize;
}

- (void)setLaplacianLimitingDownsampling:(float)a3
{
  self->_laplacianLimitingDownsampling = a3;
}

- (float)laplacianLimitingDownsampling
{
  return self->_laplacianLimitingDownsampling;
}

- (void)setInfConvolutionDownsampling:(float)a3
{
  self->_infConvolutionDownsampling = a3;
}

- (float)infConvolutionDownsampling
{
  return self->_infConvolutionDownsampling;
}

- (void)setForegroundMaskDilationRadius:(float)a3
{
  self->_foregroundMaskDilationRadius = a3;
}

- (float)foregroundMaskDilationRadius
{
  return self->_foregroundMaskDilationRadius;
}

- (void)setFaceSizeRatioInFocus:(float)a3
{
  self->_faceSizeRatioInFocus = a3;
}

- (float)faceSizeRatioInFocus
{
  return self->_faceSizeRatioInFocus;
}

- (void)setMaxFramesWithoutFace:(int)a3
{
  self->_maxFramesWithoutFace = a3;
}

- (int)maxFramesWithoutFace
{
  return self->_maxFramesWithoutFace;
}

- (void)setFocusUpdateRateFast:(float)a3
{
  self->_focusUpdateRateFast = a3;
}

- (float)focusUpdateRateFast
{
  return self->_focusUpdateRateFast;
}

- (void)setFocusUpdateRateSlow:(float)a3
{
  self->_focusUpdateRateSlow = a3;
}

- (float)focusUpdateRateSlow
{
  return self->_focusUpdateRateSlow;
}

- (void)setFocusThresholdHardness:(float)a3
{
  self->_focusThresholdHardness = a3;
}

- (float)focusThresholdHardness
{
  return self->_focusThresholdHardness;
}

- (void)setFNumberMultiplier:(float)a3
{
  self->_fNumberMultiplier = a3;
}

- (float)fNumberMultiplier
{
  return self->_fNumberMultiplier;
}

- (void)setRenderingLensFocalLength:(float)a3
{
  self->_renderingLensFocalLength = a3;
}

- (float)renderingLensFocalLength
{
  return self->_renderingLensFocalLength;
}

- (void)setLuxMultiplierNoiseBitCalculation:(float)a3
{
  self->_luxMultiplierNoiseBitCalculation = a3;
}

- (float)luxMultiplierNoiseBitCalculation
{
  return self->_luxMultiplierNoiseBitCalculation;
}

- (void)setGainMultiplierNoiseBitCalculation:(float)a3
{
  self->_gainMultiplierNoiseBitCalculation = a3;
}

- (float)gainMultiplierNoiseBitCalculation
{
  return self->_gainMultiplierNoiseBitCalculation;
}

- (void)setOffsetNoiseBitCalculation:(float)a3
{
  self->_offsetNoiseBitCalculation = a3;
}

- (float)offsetNoiseBitCalculation
{
  return self->_offsetNoiseBitCalculation;
}

- (void)setRenderingDisparityBlurRadius:(float)a3
{
  self->_renderingDisparityBlurRadius = a3;
}

- (float)renderingDisparityBlurRadius
{
  return self->_renderingDisparityBlurRadius;
}

- (void)setRenderingDisparityUpdateRate:(float)a3
{
  self->_renderingDisparityUpdateRate = a3;
}

- (float)renderingDisparityUpdateRate
{
  return self->_renderingDisparityUpdateRate;
}

- (void)setDisparityPushingBackgroundToForegroundDisparityDifference:(int)a3
{
  self->_disparityPushingBackgroundToForegroundDisparityDifference = a3;
}

- (int)disparityPushingBackgroundToForegroundDisparityDifference
{
  return self->_disparityPushingBackgroundToForegroundDisparityDifference;
}

- (void)setMaxDistToPushDisparityEdgesRev:(int)a3
{
  self->_maxDistToPushDisparityEdgesRev = a3;
}

- (int)maxDistToPushDisparityEdgesRev
{
  return self->_maxDistToPushDisparityEdgesRev;
}

- (void)setMaxDistToPushDisparityEdgesFwd:(int)a3
{
  self->_maxDistToPushDisparityEdgesFwd = a3;
}

- (int)maxDistToPushDisparityEdgesFwd
{
  return self->_maxDistToPushDisparityEdgesFwd;
}

- (void)setMaxDisparityFillingDistFromForeground:(float)a3
{
  self->_maxDisparityFillingDistFromForeground = a3;
}

- (float)maxDisparityFillingDistFromForeground
{
  return self->_maxDisparityFillingDistFromForeground;
}

- (void)setMaxDisparityFillingInconsistency:(float)a3
{
  self->_maxDisparityFillingInconsistency = a3;
}

- (float)maxDisparityFillingInconsistency
{
  return self->_maxDisparityFillingInconsistency;
}

- (void)setMaximumSimilarityToKeepDisparity:(float)a3
{
  self->_maximumSimilarityToKeepDisparity = a3;
}

- (float)maximumSimilarityToKeepDisparity
{
  return self->_maximumSimilarityToKeepDisparity;
}

- (void)setMinimumConfidenceToKeepDisparity:(float)a3
{
  self->_minimumConfidenceToKeepDisparity = a3;
}

- (float)minimumConfidenceToKeepDisparity
{
  return self->_minimumConfidenceToKeepDisparity;
}

- (void)setDisparityFilterUpdateRate:(float)a3
{
  self->_disparityFilterUpdateRate = a3;
}

- (float)disparityFilterUpdateRate
{
  return self->_disparityFilterUpdateRate;
}

- (void)setDisparityFilterColorStd:(float)a3
{
  self->_disparityFilterColorStd = a3;
}

- (float)disparityFilterColorStd
{
  return self->_disparityFilterColorStd;
}

- (void)setAlphaGammaExponent:(float)a3
{
  self->_alphaGammaExponent = a3;
}

- (float)alphaGammaExponent
{
  return self->_alphaGammaExponent;
}

- (void)setAlphaContrastExponent:(float)a3
{
  self->_alphaContrastExponent = a3;
}

- (float)alphaContrastExponent
{
  return self->_alphaContrastExponent;
}

- (void)setAlphaMaxLaplacian:(float)a3
{
  self->_alphaMaxLaplacian = a3;
}

- (float)alphaMaxLaplacian
{
  return self->_alphaMaxLaplacian;
}

- (void)setAlphaCoeffFilterColorStdFast:(float)a3
{
  self->_alphaCoeffFilterColorStdFast = a3;
}

- (float)alphaCoeffFilterColorStdFast
{
  return self->_alphaCoeffFilterColorStdFast;
}

- (void)setAlphaCoeffFilterColorStd:(float)a3
{
  self->_alphaCoeffFilterColorStd = a3;
}

- (float)alphaCoeffFilterColorStd
{
  return self->_alphaCoeffFilterColorStd;
}

- (void)setDeltaCanonicalDisparity:(float)a3
{
  self->_deltaCanonicalDisparity = a3;
}

- (float)deltaCanonicalDisparity
{
  return self->_deltaCanonicalDisparity;
}

- (void)setReferenceDisparity:(float)a3
{
  self->_referenceDisparity = a3;
}

- (float)referenceDisparity
{
  return self->_referenceDisparity;
}

- (void)setGuidedFilterMinDistToDeweight:(float)a3
{
  self->_guidedFilterMinDistToDeweight = a3;
}

- (float)guidedFilterMinDistToDeweight
{
  return self->_guidedFilterMinDistToDeweight;
}

- (void)setGuidedFilterUnconfidentWeight:(float)a3
{
  self->_guidedFilterUnconfidentWeight = a3;
}

- (float)guidedFilterUnconfidentWeight
{
  return self->_guidedFilterUnconfidentWeight;
}

- (void)setMattingUpdateRateFast:(float)a3
{
  self->_mattingUpdateRateFast = a3;
}

- (float)mattingUpdateRateFast
{
  return self->_mattingUpdateRateFast;
}

- (void)setMattingUpdateRate:(float)a3
{
  self->_mattingUpdateRate = a3;
}

- (float)mattingUpdateRate
{
  return self->_mattingUpdateRate;
}

- (void)setDeltaDepth:(float)a3
{
  self->_deltaDepth = a3;
}

- (float)deltaDepth
{
  return self->_deltaDepth;
}

- (void)setCloseDisparityPercentile:(float)a3
{
  self->_closeDisparityPercentile = a3;
}

- (float)closeDisparityPercentile
{
  return self->_closeDisparityPercentile;
}

- (void)setForegroundPercentile:(float)a3
{
  self->_foregroundPercentile = a3;
}

- (float)foregroundPercentile
{
  return self->_foregroundPercentile;
}

- (void)setDsCanonicalHighScale:(float)a3
{
  self->_dsCanonicalHighScale = a3;
}

- (float)dsCanonicalHighScale
{
  return self->_dsCanonicalHighScale;
}

- (void)setLinearDeltaDepthOffset:(float)a3
{
  self->_linearDeltaDepthOffset = a3;
}

- (float)linearDeltaDepthOffset
{
  return self->_linearDeltaDepthOffset;
}

- (void)setLinearDeltaDepthMultiplier:(float)a3
{
  self->_linearDeltaDepthMultiplier = a3;
}

- (float)linearDeltaDepthMultiplier
{
  return self->_linearDeltaDepthMultiplier;
}

- (void)setDsCanonicalHighThld:(float)a3
{
  self->_dsCanonicalHighThld = a3;
}

- (float)dsCanonicalHighThld
{
  return self->_dsCanonicalHighThld;
}

- (void)setDsCanonicalLowScale:(float)a3
{
  self->_dsCanonicalLowScale = a3;
}

- (float)dsCanonicalLowScale
{
  return self->_dsCanonicalLowScale;
}

- (void)setDsCanonicalLowThld:(float)a3
{
  self->_dsCanonicalLowThld = a3;
}

- (float)dsCanonicalLowThld
{
  return self->_dsCanonicalLowThld;
}

- (void)setCenterDeltaCanonicalDisparity:(float)a3
{
  self->_centerDeltaCanonicalDisparity = a3;
}

- (float)centerDeltaCanonicalDisparity
{
  return self->_centerDeltaCanonicalDisparity;
}

- (void)setMaxDeltaCanonicalDisparity:(float)a3
{
  self->_maxDeltaCanonicalDisparity = a3;
}

- (float)maxDeltaCanonicalDisparity
{
  return self->_maxDeltaCanonicalDisparity;
}

- (void)setMinDeltaCanonicalDisparity:(float)a3
{
  self->_minDeltaCanonicalDisparity = a3;
}

- (float)minDeltaCanonicalDisparity
{
  return self->_minDeltaCanonicalDisparity;
}

- (void)setInvalidDisparityRatioStatsWindowSize:(int)a3
{
  self->_invalidDisparityRatioStatsWindowSize = a3;
}

- (int)invalidDisparityRatioStatsWindowSize
{
  return self->_invalidDisparityRatioStatsWindowSize;
}

- (void)setBackgroundDisparityStatsWindowSize:(int)a3
{
  self->_backgroundDisparityStatsWindowSize = a3;
}

- (int)backgroundDisparityStatsWindowSize
{
  return self->_backgroundDisparityStatsWindowSize;
}

- (void)setInvalidDisparityRatioUpdateRate:(float)a3
{
  self->_invalidDisparityRatioUpdateRate = a3;
}

- (float)invalidDisparityRatioUpdateRate
{
  return self->_invalidDisparityRatioUpdateRate;
}

- (void)setBackgroundDisparityUpdateRate:(float)a3
{
  self->_backgroundDisparityUpdateRate = a3;
}

- (float)backgroundDisparityUpdateRate
{
  return self->_backgroundDisparityUpdateRate;
}

- (void)setDepthPixelBufferMaxRightOcclusionDisparityChange:(float)a3
{
  self->_depthPixelBufferMaxRightOcclusionDisparityChange = a3;
}

- (float)depthPixelBufferMaxRightOcclusionDisparityChange
{
  return self->_depthPixelBufferMaxRightOcclusionDisparityChange;
}

- (void)setDepthPixelBufferMaxLeftOcclusionDisparityChange:(float)a3
{
  self->_depthPixelBufferMaxLeftOcclusionDisparityChange = a3;
}

- (float)depthPixelBufferMaxLeftOcclusionDisparityChange
{
  return self->_depthPixelBufferMaxLeftOcclusionDisparityChange;
}

- (void)setSupportsForegroundBlur:(BOOL)a3
{
  self->_supportsForegroundBlur = a3;
}

- (BOOL)supportsForegroundBlur
{
  return self->_supportsForegroundBlur;
}

- (void)setCanSkipDisparityHoleFillingAndTemporalRejection:(BOOL)a3
{
  self->_canSkipDisparityHoleFillingAndTemporalRejection = a3;
}

- (BOOL)canSkipDisparityHoleFillingAndTemporalRejection
{
  return self->_canSkipDisparityHoleFillingAndTemporalRejection;
}

- (void)setDisparityStereoBaselineMeters:(float)a3
{
  self->_disparityStereoBaselineMeters = a3;
}

- (float)disparityStereoBaselineMeters
{
  return self->_disparityStereoBaselineMeters;
}

- (void)setDisparityStereoFocalLengthPixels:(float)a3
{
  self->_disparityStereoFocalLengthPixels = a3;
}

- (float)disparityStereoFocalLengthPixels
{
  return self->_disparityStereoFocalLengthPixels;
}

- (void)setDepthPixelBufferOffset:(float)a3
{
  self->_depthPixelBufferOffset = a3;
}

- (float)depthPixelBufferOffset
{
  return self->_depthPixelBufferOffset;
}

- (void)setDepthPixelBufferScale:(float)a3
{
  self->_depthPixelBufferScale = a3;
}

- (float)depthPixelBufferScale
{
  return self->_depthPixelBufferScale;
}

- (void)setDepthPixelBufferYReplication:(int)a3
{
  self->_depthPixelBufferYReplication = a3;
}

- (int)depthPixelBufferYReplication
{
  return self->_depthPixelBufferYReplication;
}

- (void)setDepthPixelBufferXReplication:(int)a3
{
  self->_depthPixelBufferXReplication = a3;
}

- (int)depthPixelBufferXReplication
{
  return self->_depthPixelBufferXReplication;
}

- (void)setDepthPixelBufferYPadding:(int)a3
{
  self->_depthPixelBufferYPadding = a3;
}

- (int)depthPixelBufferYPadding
{
  return self->_depthPixelBufferYPadding;
}

- (void)setDepthPixelBufferXPadding:(int)a3
{
  self->_depthPixelBufferXPadding = a3;
}

- (int)depthPixelBufferXPadding
{
  return self->_depthPixelBufferXPadding;
}

- (unint64_t)videoPipelineDevice
{
  return self->_videoPipelineDevice;
}

- (NSArray)supportedInputSegmentationPixelBufferPixelFormats
{
  return (NSArray *)objc_getProperty(self, a2, 440, 1);
}

- (unsigned)outputDisparityPixelBufferPixelFormat
{
  return self->_outputDisparityPixelBufferPixelFormat;
}

- (void)setInputDisparityPixelBufferPixelFormat:(unsigned int)a3
{
  self->_inputDisparityPixelBufferPixelFormat = a3;
}

- (unsigned)inputDisparityPixelBufferPixelFormat
{
  return self->_inputDisparityPixelBufferPixelFormat;
}

- (void)setSceneMonitorUsesDisparityStatistics:(BOOL)a3
{
  self->_sceneMonitorUsesDisparityStatistics = a3;
}

- (BOOL)sceneMonitorUsesDisparityStatistics
{
  return self->_sceneMonitorUsesDisparityStatistics;
}

- (void)setInputToOutputDisparityPixelBufferRotation:(unint64_t)a3
{
  self->_inputToOutputDisparityPixelBufferRotation = a3;
}

- (unint64_t)inputToOutputDisparityPixelBufferRotation
{
  return self->_inputToOutputDisparityPixelBufferRotation;
}

- (void)setOutputDisparityOffset:(float)a3
{
  self->_outputDisparityOffset = a3;
}

- (float)outputDisparityOffset
{
  return self->_outputDisparityOffset;
}

- (void)setOutputDisparityPixelBufferHeight:(unint64_t)a3
{
  self->_outputDisparityPixelBufferHeight = a3;
}

- (unint64_t)outputDisparityPixelBufferHeight
{
  return self->_outputDisparityPixelBufferHeight;
}

- (void)setOutputDisparityPixelBufferWidth:(unint64_t)a3
{
  self->_outputDisparityPixelBufferWidth = a3;
}

- (unint64_t)outputDisparityPixelBufferWidth
{
  return self->_outputDisparityPixelBufferWidth;
}

- (void)setInputDisparityPixelBufferHeight:(unint64_t)a3
{
  self->_inputDisparityPixelBufferHeight = a3;
}

- (unint64_t)inputDisparityPixelBufferHeight
{
  return self->_inputDisparityPixelBufferHeight;
}

- (void)setInputDisparityPixelBufferWidth:(unint64_t)a3
{
  self->_inputDisparityPixelBufferWidth = a3;
}

- (unint64_t)inputDisparityPixelBufferWidth
{
  return self->_inputDisparityPixelBufferWidth;
}

- (unsigned)alphaMattePixelBufferPixelFormat
{
  return self->_alphaMattePixelBufferPixelFormat;
}

- (void)setAlphaMattePixelBufferHeight:(unint64_t)a3
{
  self->_alphaMattePixelBufferHeight = a3;
}

- (unint64_t)alphaMattePixelBufferHeight
{
  return self->_alphaMattePixelBufferHeight;
}

- (void)setAlphaMattePixelBufferWidth:(unint64_t)a3
{
  self->_alphaMattePixelBufferWidth = a3;
}

- (unint64_t)alphaMattePixelBufferWidth
{
  return self->_alphaMattePixelBufferWidth;
}

- (void)setColorPixelBufferFocalRatio:(float)a3
{
  self->_colorPixelBufferFocalRatio = a3;
}

- (float)colorPixelBufferFocalRatio
{
  return self->_colorPixelBufferFocalRatio;
}

- (void)setColorPixelBufferPixelSize_um:(float)a3
{
  self->_colorPixelBufferPixelSize_um = a3;
}

- (float)colorPixelBufferPixelSize_um
{
  return self->_colorPixelBufferPixelSize_um;
}

- (void)setColorPixelBufferFocalLength_mm:(float)a3
{
  self->_colorPixelBufferFocalLength_mm = a3;
}

- (float)colorPixelBufferFocalLength_mm
{
  return self->_colorPixelBufferFocalLength_mm;
}

- (NSArray)supportedColorPixelBufferPixelFormats
{
  return (NSArray *)objc_getProperty(self, a2, 376, 1);
}

- (void)setColorPixelBufferHeight:(unint64_t)a3
{
  self->_colorPixelBufferHeight = a3;
}

- (unint64_t)colorPixelBufferHeight
{
  return self->_colorPixelBufferHeight;
}

- (void)setColorPixelBufferWidth:(unint64_t)a3
{
  self->_colorPixelBufferWidth = a3;
}

- (unint64_t)colorPixelBufferWidth
{
  return self->_colorPixelBufferWidth;
}

- (BOOL)validateWithError:(id *)a3
{
  float centerDeltaCanonicalDisparity = self->_centerDeltaCanonicalDisparity;
  BOOL v6 = self->_minDeltaCanonicalDisparity <= centerDeltaCanonicalDisparity
    && centerDeltaCanonicalDisparity <= self->_maxDeltaCanonicalDisparity;
  v7 = NSString;
  v8 = [NSString stringWithFormat:@"Expected centerDeltaCanonicalDisparity <= centerDeltaCanonicalDisparity <= maxDeltaCanonicalDisparity"];
  v9 = [v7 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAVideoPipelineProperties_Impl validateWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineProperties.mm", 1559, v8];
  sub_1BA8161F4(!v6, a3, 0, 4294944393, v9);

  if (!v6) {
    return 0;
  }
  unint64_t outputDisparityPixelBufferHeight = self->_outputDisparityPixelBufferHeight;
  uint64_t v11 = 400;
  if ((self->_inputToOutputDisparityPixelBufferRotation & 0xFFFFFFFFFFFFFFFDLL) == 1) {
    uint64_t v12 = 408;
  }
  else {
    uint64_t v12 = 400;
  }
  uint64_t v13 = *(uint64_t *)((char *)&self->super.isa + v12);
  if ((self->_inputToOutputDisparityPixelBufferRotation & 0xFFFFFFFFFFFFFFFDLL) != 1) {
    uint64_t v11 = 408;
  }
  uint64_t v14 = *(uint64_t *)((char *)&self->super.isa + v11);
  unint64_t outputDisparityPixelBufferWidth = self->_outputDisparityPixelBufferWidth;
  v16 = NSString;
  v17 = objc_msgSend(NSString, "stringWithFormat:", @"Input/output disparity pixel buffers must have the same aspect ratio: %zu x %zu != %zu x %zu", v13, outputDisparityPixelBufferHeight, v14, outputDisparityPixelBufferWidth);
  v18 = [v16 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAVideoPipelineProperties_Impl validateWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineProperties.mm", 1581, v17];
  unint64_t v19 = outputDisparityPixelBufferHeight * v13;
  unint64_t v20 = outputDisparityPixelBufferWidth * v14;
  sub_1BA8161F4(v19 != v20, a3, 0, 4294944393, v18);

  if (v19 != v20) {
    return 0;
  }
  unint64_t depthPixelBufferXReplication = self->_depthPixelBufferXReplication;
  unint64_t v22 = self->_outputDisparityPixelBufferWidth;
  v23 = NSString;
  v24 = [NSString stringWithFormat:@"outputDisparityPixelBufferWidth not in [2 + depthPixelBufferXReplication, inf"]);
  v25 = [v23 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAVideoPipelineProperties_Impl validateWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineProperties.mm", 1595, v24];
  depthPixelBufferXReplication += 2;
  sub_1BA8161F4(v22 < depthPixelBufferXReplication, a3, 0, 4294944393, v25);

  if (v22 < depthPixelBufferXReplication) {
    return 0;
  }
  unint64_t depthPixelBufferYReplication = self->_depthPixelBufferYReplication;
  unint64_t v27 = self->_outputDisparityPixelBufferHeight;
  v28 = NSString;
  v29 = [NSString stringWithFormat:@"outputDisparityPixelBufferHeight not in [2 + depthPixelBufferYReplication, inf"]);
  v30 = [v28 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAVideoPipelineProperties_Impl validateWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineProperties.mm", 1609, v29];
  depthPixelBufferYReplication += 2;
  sub_1BA8161F4(v27 < depthPixelBufferYReplication, a3, 0, 4294944393, v30);

  if (v27 < depthPixelBufferYReplication) {
    return 0;
  }
  if (sub_1BA81EA6C(self->_videoPipelineDevice) == 2) {
    return 1;
  }
  unint64_t depthPixelBufferXPadding = self->_depthPixelBufferXPadding;
  BOOL v33 = (depthPixelBufferXPadding & 0x80000000) != 0
     || (unint64_t)(self->_inputDisparityPixelBufferWidth <= depthPixelBufferXPadding);
  v34 = NSString;
  v35 = [NSString stringWithFormat:@"depthPixelBufferXPadding not in [0, inputDisparityPixelBufferWidth"]);
  v36 = [v34 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAVideoPipelineProperties_Impl validateWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineProperties.mm", 1624, v35];
  sub_1BA8161F4(v33, a3, 0, 4294944393, v36);

  if (v33) {
    return 0;
  }
  unint64_t depthPixelBufferYPadding = self->_depthPixelBufferYPadding;
  BOOL v38 = (depthPixelBufferYPadding & 0x80000000) != 0
     || (unint64_t)(self->_inputDisparityPixelBufferHeight <= depthPixelBufferYPadding);
  v39 = NSString;
  v40 = [NSString stringWithFormat:@"depthPixelBufferYPadding not in [0, inputDisparityPixelBufferHeight"]);
  v41 = [v39 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAVideoPipelineProperties_Impl validateWithError:]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAVideoPipelineProperties.mm", 1636, v40];
  sub_1BA8161F4(v38, a3, 0, 4294944393, v41);

  return !v38;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 360) = self->_colorPixelBufferWidth;
  *(void *)(v4 + 368) = self->_colorPixelBufferHeight;
  objc_storeStrong((id *)(v4 + 376), self->_supportedColorPixelBufferPixelFormats);
  *(float *)(v4 + 12) = self->_colorPixelBufferFocalLength_mm;
  *(float *)(v4 + 16) = self->_colorPixelBufferPixelSize_um;
  *(float *)(v4 + 20) = self->_colorPixelBufferFocalRatio;
  *(void *)(v4 + 384) = self->_alphaMattePixelBufferWidth;
  *(void *)(v4 + 392) = self->_alphaMattePixelBufferHeight;
  *(_DWORD *)(v4 + 24) = self->_alphaMattePixelBufferPixelFormat;
  *(void *)(v4 + 400) = self->_inputDisparityPixelBufferWidth;
  *(void *)(v4 + 408) = self->_inputDisparityPixelBufferHeight;
  *(void *)(v4 + 416) = self->_outputDisparityPixelBufferWidth;
  *(float *)(v4 + 28) = self->_outputDisparityOffset;
  unint64_t inputToOutputDisparityPixelBufferRotation = self->_inputToOutputDisparityPixelBufferRotation;
  *(void *)(v4 + 424) = self->_outputDisparityPixelBufferHeight;
  *(void *)(v4 + 432) = inputToOutputDisparityPixelBufferRotation;
  *(unsigned char *)(v4 + 8) = self->_sceneMonitorUsesDisparityStatistics;
  *(_DWORD *)(v4 + 32) = self->_inputDisparityPixelBufferPixelFormat;
  *(_DWORD *)(v4 + 36) = self->_outputDisparityPixelBufferPixelFormat;
  objc_storeStrong((id *)(v4 + 440), self->_supportedInputSegmentationPixelBufferPixelFormats);
  *(void *)(v4 + 448) = self->_videoPipelineDevice;
  *(_DWORD *)(v4 + 40) = self->_depthPixelBufferXPadding;
  *(_DWORD *)(v4 + 44) = self->_depthPixelBufferYPadding;
  *(_DWORD *)(v4 + 48) = self->_depthPixelBufferXReplication;
  *(_DWORD *)(v4 + 52) = self->_depthPixelBufferYReplication;
  *(float *)(v4 + 56) = self->_depthPixelBufferScale;
  *(float *)(v4 + 60) = self->_depthPixelBufferOffset;
  *(float *)(v4 + 64) = self->_disparityStereoFocalLengthPixels;
  *(float *)(v4 + 68) = self->_disparityStereoBaselineMeters;
  *(unsigned char *)(v4 + 9) = self->_canSkipDisparityHoleFillingAndTemporalRejection;
  *(unsigned char *)(v4 + 10) = self->_supportsForegroundBlur;
  *(float *)(v4 + 72) = self->_depthPixelBufferMaxLeftOcclusionDisparityChange;
  *(float *)(v4 + 76) = self->_depthPixelBufferMaxRightOcclusionDisparityChange;
  *(float *)(v4 + 80) = self->_backgroundDisparityUpdateRate;
  *(float *)(v4 + 84) = self->_invalidDisparityRatioUpdateRate;
  *(_DWORD *)(v4 + 88) = self->_backgroundDisparityStatsWindowSize;
  *(_DWORD *)(v4 + 92) = self->_invalidDisparityRatioStatsWindowSize;
  *(float *)(v4 + 96) = self->_minDeltaCanonicalDisparity;
  *(float *)(v4 + 100) = self->_maxDeltaCanonicalDisparity;
  *(float *)(v4 + 104) = self->_centerDeltaCanonicalDisparity;
  *(float *)(v4 + 108) = self->_dsCanonicalLowThld;
  *(float *)(v4 + 112) = self->_dsCanonicalLowScale;
  *(float *)(v4 + 116) = self->_dsCanonicalHighThld;
  *(float *)(v4 + 120) = self->_linearDeltaDepthMultiplier;
  *(float *)(v4 + 124) = self->_linearDeltaDepthOffset;
  *(float *)(v4 + 128) = self->_dsCanonicalHighScale;
  *(float *)(v4 + 132) = self->_foregroundPercentile;
  *(float *)(v4 + 136) = self->_closeDisparityPercentile;
  *(float *)(v4 + 140) = self->_deltaDepth;
  *(float *)(v4 + 144) = self->_mattingUpdateRate;
  *(float *)(v4 + 148) = self->_mattingUpdateRateFast;
  *(float *)(v4 + 152) = self->_guidedFilterUnconfidentWeight;
  *(float *)(v4 + 156) = self->_guidedFilterMinDistToDeweight;
  *(float *)(v4 + 272) = self->_foregroundMaskDilationRadius;
  *(float *)(v4 + 276) = self->_infConvolutionDownsampling;
  *(float *)(v4 + 280) = self->_laplacianLimitingDownsampling;
  *(float *)(v4 + 284) = self->_laplacianLimitingBlurSize;
  *(float *)(v4 + 160) = self->_referenceDisparity;
  *(float *)(v4 + 164) = self->_deltaCanonicalDisparity;
  *(float *)(v4 + 168) = self->_alphaCoeffFilterColorStd;
  *(float *)(v4 + 172) = self->_alphaCoeffFilterColorStdFast;
  *(float *)(v4 + 176) = self->_alphaMaxLaplacian;
  *(float *)(v4 + 180) = self->_alphaContrastExponent;
  *(float *)(v4 + 184) = self->_alphaGammaExponent;
  *(float *)(v4 + 188) = self->_disparityFilterColorStd;
  *(float *)(v4 + 192) = self->_disparityFilterUpdateRate;
  *(float *)(v4 + 196) = self->_minimumConfidenceToKeepDisparity;
  *(float *)(v4 + 200) = self->_maximumSimilarityToKeepDisparity;
  *(float *)(v4 + 204) = self->_maxDisparityFillingInconsistency;
  *(float *)(v4 + 208) = self->_maxDisparityFillingDistFromForeground;
  *(_DWORD *)(v4 + 212) = self->_maxDistToPushDisparityEdgesFwd;
  *(_DWORD *)(v4 + 216) = self->_maxDistToPushDisparityEdgesRev;
  *(_DWORD *)(v4 + 220) = self->_disparityPushingBackgroundToForegroundDisparityDifference;
  *(float *)(v4 + 224) = self->_renderingDisparityUpdateRate;
  *(float *)(v4 + 228) = self->_renderingDisparityBlurRadius;
  *(float *)(v4 + 232) = self->_offsetNoiseBitCalculation;
  *(float *)(v4 + 236) = self->_gainMultiplierNoiseBitCalculation;
  *(float *)(v4 + 240) = self->_luxMultiplierNoiseBitCalculation;
  *(float *)(v4 + 244) = self->_renderingLensFocalLength;
  *(float *)(v4 + 248) = self->_fNumberMultiplier;
  *(float *)(v4 + 252) = self->_focusThresholdHardness;
  *(float *)(v4 + 256) = self->_focusUpdateRateSlow;
  *(float *)(v4 + 260) = self->_focusUpdateRateFast;
  *(_DWORD *)(v4 + 264) = self->_maxFramesWithoutFace;
  *(float *)(v4 + 268) = self->_faceSizeRatioInFocus;
  *(_DWORD *)(v4 + 288) = self->_relightDisplayMode;
  objc_storeStrong((id *)(v4 + 456), self->_faceKitProcessOutputOverride);
  *(float *)(v4 + 292) = self->_relightEffectStrength;
  *(float *)(v4 + 296) = self->_portraitStyleStrengthOverride;
  *(float *)(v4 + 300) = self->_focusDistanceOverride;
  *(float *)(v4 + 304) = self->_stageLightStateMachineIntensityIncrement;
  *(double *)(v4 + 464) = self->_stageLightStageMachineMaxOrientationDifference;
  *(float *)(v4 + 308) = self->_sdofStateMachineIntensityIncrement;
  *(double *)(v4 + 472) = self->_sdofStateMachineMaxOrientationDifference;
  *(unsigned char *)(v4 + 11) = self->_modulateFocalRatio;
  *(float *)(v4 + 312) = self->_stableBackgroundDisparitySumVariance;
  *(float *)(v4 + 316) = self->_unstableBackgroundDisparitySumVariance;
  *(float *)(v4 + 320) = self->_stableInvalidDisparityRatio;
  *(float *)(v4 + 324) = self->_unstableInvalidDisparityRatio;
  *(float *)(v4 + 332) = self->_backgroundSeparationLikelihoodLow;
  *(float *)(v4 + 328) = self->_backgroundSeparationLikelihoodHigh;
  *(float *)(v4 + 336) = self->_depthQualityMetricFocalPlaneOffsetMeters;
  *(void *)(v4 + 480) = self->_focusStatisticsXTileCount;
  *(void *)(v4 + 488) = self->_focusStatisticsYTileCount;
  *(_DWORD *)(v4 + 348) = self->_guidedFilterWidth;
  *(_DWORD *)(v4 + 352) = self->_guidedFilterHeight;
  *(void *)(v4 + 496) = self->_proxyToFaceEffectLerpNumFrames;
  *(_DWORD *)(v4 + 356) = self->_rawShiftInvalidThreshold;
  *(_DWORD *)(v4 + 340) = self->_segmentationBinarizationThreshold;
  *(_DWORD *)(v4 + 344) = self->_depthErosionRadius;
  return (id)v4;
}

- (id)initForVideoPipelineDevice:(unint64_t)a3
{
  v3 = (void *)MEMORY[0x1F4188790](self, a2, a3);
  uint64_t v4 = 0;
  v5 = 0;
  uint64_t v6 = 0;
  uint64_t v518 = *MEMORY[0x1E4F143B8];
  unint64_t v311 = v7;
  uint64_t v310 = 0;
  v309 = 0;
  v308 = &v309;
  for (i = &v309; ; i = (void **)v308)
  {
    v9 = &v309;
    if (i == &v309) {
      goto LABEL_8;
    }
    v10 = v5;
    uint64_t v11 = &v309;
    if (v5)
    {
      do
      {
        v9 = (void **)v10;
        v10 = (void *)v10[1];
      }
      while (v10);
    }
    else
    {
      do
      {
        v9 = (void **)v11[2];
        BOOL v12 = *v9 == v11;
        uint64_t v11 = v9;
      }
      while (v12);
    }
    unint64_t v13 = qword_1BA86C710[v6];
    if ((unint64_t)v9[4] < v13)
    {
LABEL_8:
      uint64_t v14 = v5 ? v9 : &v309;
      v15 = v5 ? v9 + 1 : &v309;
    }
    else
    {
      uint64_t v14 = &v309;
      v15 = &v309;
      if (v5)
      {
        v15 = &v309;
        while (1)
        {
          while (1)
          {
            uint64_t v14 = (void **)v5;
            unint64_t v27 = v5[4];
            if (v13 >= v27) {
              break;
            }
            v5 = *v14;
            v15 = v14;
            if (!*v14) {
              goto LABEL_15;
            }
          }
          if (v27 >= v13) {
            break;
          }
          v15 = v14 + 1;
          v5 = v14[1];
          if (!v5) {
            goto LABEL_15;
          }
        }
      }
    }
    if (!*v15)
    {
LABEL_15:
      v16 = operator new(0x28uLL);
      v16[4] = qword_1BA86C710[v6];
      void *v16 = 0;
      v16[1] = 0;
      v16[2] = v14;
      void *v15 = v16;
      if (*v308)
      {
        v308 = (void *)*v308;
        v16 = (void *)*v15;
      }
      v17 = v309;
      BOOL v12 = v16 == v309;
      *((unsigned char *)v16 + 24) = v16 == v309;
      if (!v12)
      {
        do
        {
          uint64_t v18 = v16[2];
          if (*(unsigned char *)(v18 + 24)) {
            break;
          }
          unint64_t v19 = *(void **)(v18 + 16);
          uint64_t v20 = *v19;
          if (*v19 == v18)
          {
            uint64_t v23 = v19[1];
            if (!v23 || (int v24 = *(unsigned __int8 *)(v23 + 24), v21 = (unsigned char *)(v23 + 24), v24))
            {
              if (*(void **)v18 == v16)
              {
                v25 = (uint64_t *)v16[2];
              }
              else
              {
                v25 = *(uint64_t **)(v18 + 8);
                uint64_t v26 = *v25;
                *(void *)(v18 + 8) = *v25;
                if (v26)
                {
                  *(void *)(v26 + 16) = v18;
                  unint64_t v19 = *(void **)(v18 + 16);
                }
                v25[2] = (uint64_t)v19;
                *(void *)(*(void *)(v18 + 16) + 8 * (**(void **)(v18 + 16) != v18)) = v25;
                uint64_t *v25 = v18;
                *(void *)(v18 + 16) = v25;
                unint64_t v19 = (void *)v25[2];
                uint64_t v18 = *v19;
              }
              *((unsigned char *)v25 + 24) = 1;
              *((unsigned char *)v19 + 24) = 0;
              uint64_t v30 = *(void *)(v18 + 8);
              *unint64_t v19 = v30;
              if (v30) {
                *(void *)(v30 + 16) = v19;
              }
              *(void *)(v18 + 16) = v19[2];
              *(void *)(v19[2] + 8 * (*(void *)v19[2] != (void)v19)) = v18;
              *(void *)(v18 + 8) = v19;
              goto LABEL_51;
            }
          }
          else if (!v20 || (int v22 = *(unsigned __int8 *)(v20 + 24), v21 = (unsigned char *)(v20 + 24), v22))
          {
            if (*(void **)v18 == v16)
            {
              uint64_t v28 = v16[1];
              *(void *)uint64_t v18 = v28;
              if (v28)
              {
                *(void *)(v28 + 16) = v18;
                unint64_t v19 = *(void **)(v18 + 16);
              }
              v16[2] = v19;
              *(void *)(*(void *)(v18 + 16) + 8 * (**(void **)(v18 + 16) != v18)) = v16;
              v16[1] = v18;
              *(void *)(v18 + 16) = v16;
              unint64_t v19 = (void *)v16[2];
            }
            else
            {
              v16 = (void *)v16[2];
            }
            *((unsigned char *)v16 + 24) = 1;
            *((unsigned char *)v19 + 24) = 0;
            uint64_t v18 = v19[1];
            v29 = *(void **)v18;
            v19[1] = *(void *)v18;
            if (v29) {
              v29[2] = v19;
            }
            *(void *)(v18 + 16) = v19[2];
            *(void *)(v19[2] + 8 * (*(void *)v19[2] != (void)v19)) = v18;
            *(void *)uint64_t v18 = v19;
LABEL_51:
            v19[2] = v18;
            break;
          }
          *(unsigned char *)(v18 + 24) = 1;
          v16 = v19;
          *((unsigned char *)v19 + 24) = v19 == v17;
          unsigned char *v21 = 1;
        }
        while (v19 != v17);
      }
      uint64_t v310 = ++v4;
    }
    if (++v6 == 59) {
      break;
    }
    v5 = v309;
  }
  id v307 = +[CVAPreferenceManager defaults];
  v306.receiver = v3;
  v306.super_class = (Class)CVAVideoPipelineProperties_Impl;
  v31 = [(CVAVideoPipelineProperties_Impl *)&v306 init];
  v422[0] = @"colorPixelBufferWidth";
  v420[0] = &unk_1F143F9D0;
  v420[1] = &unk_1F143FA00;
  v421[0] = &unk_1F143F9E8;
  v421[1] = &unk_1F143FA18;
  v420[2] = &unk_1F143FA30;
  v420[3] = &unk_1F143FA60;
  v421[2] = &unk_1F143FA48;
  v421[3] = &unk_1F143FA48;
  v420[4] = &unk_1F143FA78;
  v420[5] = &unk_1F143FAA8;
  v421[4] = &unk_1F143FA90;
  v421[5] = &unk_1F143FAC0;
  v420[6] = &unk_1F143FAD8;
  v420[7] = &unk_1F143FB08;
  v421[6] = &unk_1F143FAF0;
  v421[7] = &unk_1F143FA48;
  v420[8] = &unk_1F143FB20;
  v420[9] = &unk_1F143FB38;
  v421[8] = &unk_1F143FAF0;
  v421[9] = &unk_1F143FA48;
  v420[10] = &unk_1F143FB50;
  v420[11] = &unk_1F143FB68;
  v421[10] = &unk_1F143FA48;
  v421[11] = &unk_1F143FA48;
  v420[12] = &unk_1F143FB80;
  v420[13] = &unk_1F143FB98;
  v421[12] = &unk_1F143FA48;
  v421[13] = &unk_1F143FA48;
  v420[14] = &unk_1F143FBB0;
  v420[15] = &unk_1F143FBC8;
  v421[14] = &unk_1F143FAF0;
  v421[15] = &unk_1F143FA48;
  v420[16] = &unk_1F143FBE0;
  v420[17] = &unk_1F143FBF8;
  v421[16] = &unk_1F143FA48;
  v421[17] = &unk_1F143FA48;
  v420[18] = &unk_1F143FC10;
  v420[19] = &unk_1F143FC28;
  v421[18] = &unk_1F143FA48;
  v421[19] = &unk_1F143FA48;
  v420[20] = &unk_1F143FC40;
  v420[21] = &unk_1F143FC58;
  v421[20] = &unk_1F143FA48;
  v421[21] = &unk_1F143FA48;
  v420[22] = &unk_1F143FC70;
  v420[23] = &unk_1F143FC88;
  v421[22] = &unk_1F143FAF0;
  v421[23] = &unk_1F143FA48;
  v420[24] = &unk_1F143FCA0;
  v420[25] = &unk_1F143FCB8;
  v421[24] = &unk_1F143FA48;
  v421[25] = &unk_1F143FA48;
  v420[26] = &unk_1F143FCD0;
  v420[27] = &unk_1F143FCE8;
  v421[26] = &unk_1F143FA48;
  v421[27] = &unk_1F143FA48;
  v420[28] = &unk_1F143FD00;
  v421[28] = &unk_1F143FA48;
  v303 = v31;
  v299 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v421 forKeys:v420 count:29];
  v423[0] = v299;
  v422[1] = @"colorPixelBufferHeight";
  v418[0] = &unk_1F143F9D0;
  v418[1] = &unk_1F143FA00;
  v419[0] = &unk_1F143FD18;
  v419[1] = &unk_1F143FD30;
  v418[2] = &unk_1F143FA30;
  v418[3] = &unk_1F143FA60;
  v419[2] = &unk_1F143FD48;
  v419[3] = &unk_1F143FD48;
  v418[4] = &unk_1F143FA78;
  v418[5] = &unk_1F143FAA8;
  v419[4] = &unk_1F143FD60;
  v419[5] = &unk_1F143FD60;
  v418[6] = &unk_1F143FAD8;
  v418[7] = &unk_1F143FB08;
  v419[6] = &unk_1F143FD78;
  v419[7] = &unk_1F143FD48;
  v418[8] = &unk_1F143FB20;
  v418[9] = &unk_1F143FB38;
  v419[8] = &unk_1F143FD78;
  v419[9] = &unk_1F143FD48;
  v418[10] = &unk_1F143FB50;
  v418[11] = &unk_1F143FB68;
  v419[10] = &unk_1F143FD48;
  v419[11] = &unk_1F143FD48;
  v418[12] = &unk_1F143FB80;
  v418[13] = &unk_1F143FB98;
  v419[12] = &unk_1F143FD48;
  v419[13] = &unk_1F143FD48;
  v418[14] = &unk_1F143FBB0;
  v418[15] = &unk_1F143FBC8;
  v419[14] = &unk_1F143FD90;
  v419[15] = &unk_1F143FD48;
  v418[16] = &unk_1F143FBE0;
  v418[17] = &unk_1F143FBF8;
  v419[16] = &unk_1F143FD48;
  v419[17] = &unk_1F143FD48;
  v418[18] = &unk_1F143FC10;
  v418[19] = &unk_1F143FC28;
  v419[18] = &unk_1F143FD48;
  v419[19] = &unk_1F143FD48;
  v418[20] = &unk_1F143FC40;
  v418[21] = &unk_1F143FC58;
  v419[20] = &unk_1F143FD48;
  v419[21] = &unk_1F143FD48;
  v418[22] = &unk_1F143FC70;
  v418[23] = &unk_1F143FC88;
  v419[22] = &unk_1F143FD90;
  v419[23] = &unk_1F143FD48;
  v418[24] = &unk_1F143FCA0;
  v418[25] = &unk_1F143FCB8;
  v419[24] = &unk_1F143FD48;
  v419[25] = &unk_1F143FD48;
  v418[26] = &unk_1F143FCD0;
  v418[27] = &unk_1F143FCE8;
  v419[26] = &unk_1F143FD48;
  v419[27] = &unk_1F143FD48;
  v418[28] = &unk_1F143FD00;
  v419[28] = &unk_1F143FD48;
  v298 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v419 forKeys:v418 count:29];
  v423[1] = v298;
  v422[2] = @"supportedColorPixelBufferPixelFormats";
  v416[0] = &unk_1F143F9D0;
  v416[1] = &unk_1F143FB08;
  v417[0] = &unk_1F143F820;
  v417[1] = &unk_1F143F838;
  v416[2] = &unk_1F143FAD8;
  v416[3] = &unk_1F143FB20;
  v417[2] = &unk_1F143F850;
  v417[3] = &unk_1F143F868;
  v416[4] = &unk_1F143FB38;
  v416[5] = &unk_1F143FB50;
  v417[4] = &unk_1F143F880;
  v417[5] = &unk_1F143F898;
  v416[6] = &unk_1F143FB68;
  v416[7] = &unk_1F143FB80;
  v417[6] = &unk_1F143F8B0;
  v417[7] = &unk_1F143F8C8;
  v416[8] = &unk_1F143FB98;
  v416[9] = &unk_1F143FBB0;
  v417[8] = &unk_1F143F8E0;
  v417[9] = &unk_1F143F8F8;
  v416[10] = &unk_1F143FBC8;
  v416[11] = &unk_1F143FBE0;
  v417[10] = &unk_1F143F910;
  v417[11] = &unk_1F143F928;
  v416[12] = &unk_1F143FDA8;
  v297 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[12] = v297;
  v416[13] = &unk_1F143FBF8;
  v296 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[13] = v296;
  v416[14] = &unk_1F143FC10;
  v295 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[14] = v295;
  v416[15] = &unk_1F143FC28;
  v294 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[15] = v294;
  v416[16] = &unk_1F143FC40;
  v293 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[16] = v293;
  v416[17] = &unk_1F143FC58;
  v292 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[17] = v292;
  v416[18] = &unk_1F143FC70;
  v291 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[18] = v291;
  v416[19] = &unk_1F143FC88;
  v290 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[19] = v290;
  v416[20] = &unk_1F143FCA0;
  v289 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[20] = v289;
  v416[21] = &unk_1F143FCB8;
  v288 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[21] = v288;
  v416[22] = &unk_1F143FCD0;
  v287 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[22] = v287;
  v416[23] = &unk_1F143FCE8;
  v286 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[23] = v286;
  v416[24] = &unk_1F143FD00;
  v285 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[24] = v285;
  v416[25] = &unk_1F143FDC0;
  v284 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[25] = v284;
  v416[26] = &unk_1F143FDD8;
  v283 = +[CVAVideoPipelineProperties_Impl allSupportedYCbCrPixelFormats];
  v417[26] = v283;
  v282 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v417 forKeys:v416 count:27];
  v423[2] = v282;
  v422[3] = @"colorPixelBufferFocalLength_mm";
  v414[0] = &unk_1F143F9D0;
  v414[1] = &unk_1F143FDF0;
  v415[0] = &unk_1F1440498;
  v415[1] = &unk_1F14404A8;
  v281 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v415 forKeys:v414 count:2];
  v423[3] = v281;
  v422[4] = @"colorPixelBufferPixelSize_um";
  v412[0] = &unk_1F143F9D0;
  v412[1] = &unk_1F143FDF0;
  v413[0] = &unk_1F14404B8;
  v413[1] = &unk_1F14404C8;
  v280 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v413 forKeys:v412 count:2];
  v423[4] = v280;
  v422[5] = @"colorPixelBufferFocalRatio";
  v410 = &unk_1F143F9D0;
  v411 = &unk_1F14404D8;
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v411 forKeys:&v410 count:1];
  v422[6] = @"alphaMattePixelBufferWidth";
  v409[0] = &unk_1F143F9E8;
  v409[1] = &unk_1F143FA18;
  v409[4] = &unk_1F143FA90;
  v409[5] = &unk_1F143FAC0;
  v409[6] = &unk_1F143FAF0;
  v409[8] = &unk_1F143FAF0;
  v409[14] = &unk_1F143FAF0;
  v409[22] = &unk_1F143FAF0;
  v279 = (void *)v32;
  v423[5] = v32;
  v408[0] = &unk_1F143F9D0;
  v408[1] = &unk_1F143FA00;
  v408[2] = &unk_1F143FA30;
  v408[3] = &unk_1F143FA60;
  v409[2] = &unk_1F143FA48;
  v409[3] = &unk_1F143FA48;
  v408[4] = &unk_1F143FA78;
  v408[5] = &unk_1F143FAA8;
  v408[6] = &unk_1F143FAD8;
  v408[7] = &unk_1F143FB08;
  v409[7] = &unk_1F143FA48;
  v408[8] = &unk_1F143FB20;
  v408[9] = &unk_1F143FB38;
  v409[9] = &unk_1F143FA48;
  v408[10] = &unk_1F143FB50;
  v408[11] = &unk_1F143FB68;
  v409[10] = &unk_1F143FA48;
  v409[11] = &unk_1F143FA48;
  v408[12] = &unk_1F143FB80;
  v408[13] = &unk_1F143FB98;
  v409[12] = &unk_1F143FA48;
  v409[13] = &unk_1F143FA48;
  v408[14] = &unk_1F143FBB0;
  v408[15] = &unk_1F143FBC8;
  v409[15] = &unk_1F143FA48;
  v408[16] = &unk_1F143FBE0;
  v408[17] = &unk_1F143FBF8;
  v409[16] = &unk_1F143FA48;
  v409[17] = &unk_1F143FA48;
  v408[18] = &unk_1F143FC10;
  v408[19] = &unk_1F143FC28;
  v409[18] = &unk_1F143FA48;
  v409[19] = &unk_1F143FA48;
  v408[20] = &unk_1F143FC40;
  v408[21] = &unk_1F143FC58;
  v409[20] = &unk_1F143FA48;
  v409[21] = &unk_1F143FA48;
  v408[22] = &unk_1F143FC70;
  v408[23] = &unk_1F143FC88;
  v409[23] = &unk_1F143FA48;
  v408[24] = &unk_1F143FCA0;
  v408[25] = &unk_1F143FCB8;
  v409[24] = &unk_1F143FA48;
  v409[25] = &unk_1F143FA48;
  v408[26] = &unk_1F143FCD0;
  v408[27] = &unk_1F143FCE8;
  v409[26] = &unk_1F143FA48;
  v409[27] = &unk_1F143FA48;
  v408[28] = &unk_1F143FD00;
  v409[28] = &unk_1F143FA48;
  uint64_t v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v409 forKeys:v408 count:29];
  v422[7] = @"alphaMattePixelBufferHeight";
  v407[0] = &unk_1F143FD18;
  v407[1] = &unk_1F143FD30;
  v407[4] = &unk_1F143FD60;
  v407[5] = &unk_1F143FD60;
  v407[6] = &unk_1F143FD78;
  v407[8] = &unk_1F143FD78;
  v407[14] = &unk_1F143FD90;
  v407[22] = &unk_1F143FD90;
  v278 = (void *)v33;
  v423[6] = v33;
  v406[0] = &unk_1F143F9D0;
  v406[1] = &unk_1F143FA00;
  v406[2] = &unk_1F143FA30;
  v406[3] = &unk_1F143FA60;
  v407[2] = &unk_1F143FD48;
  v407[3] = &unk_1F143FD48;
  v406[4] = &unk_1F143FA78;
  v406[5] = &unk_1F143FAA8;
  v406[6] = &unk_1F143FAD8;
  v406[7] = &unk_1F143FB08;
  v407[7] = &unk_1F143FD48;
  v406[8] = &unk_1F143FB20;
  v406[9] = &unk_1F143FB38;
  v407[9] = &unk_1F143FD48;
  v406[10] = &unk_1F143FB50;
  v406[11] = &unk_1F143FB68;
  v407[10] = &unk_1F143FD48;
  v407[11] = &unk_1F143FD48;
  v406[12] = &unk_1F143FB80;
  v406[13] = &unk_1F143FB98;
  v407[12] = &unk_1F143FD48;
  v407[13] = &unk_1F143FD48;
  v406[14] = &unk_1F143FBB0;
  v406[15] = &unk_1F143FBC8;
  v407[15] = &unk_1F143FD48;
  v406[16] = &unk_1F143FBE0;
  v406[17] = &unk_1F143FBF8;
  v407[16] = &unk_1F143FD48;
  v407[17] = &unk_1F143FD48;
  v406[18] = &unk_1F143FC10;
  v406[19] = &unk_1F143FC28;
  v407[18] = &unk_1F143FD48;
  v407[19] = &unk_1F143FD48;
  v406[20] = &unk_1F143FC40;
  v406[21] = &unk_1F143FC58;
  v407[20] = &unk_1F143FD48;
  v407[21] = &unk_1F143FD48;
  v406[22] = &unk_1F143FC70;
  v406[23] = &unk_1F143FC88;
  v407[23] = &unk_1F143FD48;
  v406[24] = &unk_1F143FCA0;
  v406[25] = &unk_1F143FCB8;
  v407[24] = &unk_1F143FD48;
  v407[25] = &unk_1F143FD48;
  v406[26] = &unk_1F143FCD0;
  v406[27] = &unk_1F143FCE8;
  v407[26] = &unk_1F143FD48;
  v407[27] = &unk_1F143FD48;
  v406[28] = &unk_1F143FD00;
  v407[28] = &unk_1F143FD48;
  v277 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v407 forKeys:v406 count:29];
  v423[7] = v277;
  v423[8] = &unk_1F143FE08;
  v422[8] = @"alphaMattePixelBufferPixelFormat";
  v422[9] = @"inputDisparityPixelBufferWidth";
  v404[0] = &unk_1F143F9D0;
  v404[1] = &unk_1F143FE38;
  v405[0] = &unk_1F143FE20;
  v405[1] = &unk_1F143FE50;
  v404[2] = &unk_1F143FE68;
  v404[3] = &unk_1F143FE80;
  v405[2] = &unk_1F143FE50;
  v405[3] = &unk_1F143FE98;
  v404[4] = &unk_1F143FA00;
  v404[5] = &unk_1F143FA30;
  v405[4] = &unk_1F143FEB0;
  v405[5] = &unk_1F143FE98;
  v404[6] = &unk_1F143FA60;
  v404[7] = &unk_1F143FA78;
  v405[6] = &unk_1F143FEB0;
  v405[7] = &unk_1F143FE98;
  v404[8] = &unk_1F143FAA8;
  v404[9] = &unk_1F143FEC8;
  v405[8] = &unk_1F143FEB0;
  v405[9] = &unk_1F143FE98;
  v404[10] = &unk_1F143FEE0;
  v404[11] = &unk_1F143FEF8;
  v405[10] = &unk_1F143FEB0;
  v405[11] = &unk_1F143FEB0;
  v404[12] = &unk_1F143FF10;
  v404[13] = &unk_1F143FF28;
  v405[12] = &unk_1F143FE98;
  v405[13] = &unk_1F143FEB0;
  v404[14] = &unk_1F143FF40;
  v404[15] = &unk_1F143FF58;
  v405[14] = &unk_1F143FEB0;
  v405[15] = &unk_1F143FE98;
  v404[16] = &unk_1F143FF70;
  v404[17] = &unk_1F143FFA0;
  v405[16] = &unk_1F143FF88;
  v405[17] = &unk_1F143FE98;
  v404[18] = &unk_1F143FFB8;
  v404[19] = &unk_1F143FFD0;
  v405[18] = &unk_1F143FE98;
  v405[19] = &unk_1F143FEB0;
  v404[20] = &unk_1F143FFE8;
  v404[21] = &unk_1F1440000;
  v405[20] = &unk_1F143FE98;
  v405[21] = &unk_1F143FF88;
  v404[22] = &unk_1F143FDA8;
  v404[23] = &unk_1F1440030;
  v405[22] = &unk_1F1440018;
  v405[23] = &unk_1F1440018;
  v404[24] = &unk_1F143FAD8;
  v404[25] = &unk_1F143FB08;
  v405[24] = &unk_1F143FE98;
  v405[25] = &unk_1F143FEB0;
  v404[26] = &unk_1F143FB20;
  v404[27] = &unk_1F143FB38;
  v405[26] = &unk_1F143FE98;
  v405[27] = &unk_1F143FEB0;
  v404[28] = &unk_1F143FB50;
  v404[29] = &unk_1F143FB68;
  v405[28] = &unk_1F143FEB0;
  v405[29] = &unk_1F143FEB0;
  v404[30] = &unk_1F143FB80;
  v404[31] = &unk_1F143FB98;
  v405[30] = &unk_1F143FEB0;
  v405[31] = &unk_1F143FEB0;
  v404[32] = &unk_1F143FBB0;
  v404[33] = &unk_1F143FBC8;
  v405[32] = &unk_1F143FE98;
  v405[33] = &unk_1F143FEB0;
  v404[34] = &unk_1F143FBE0;
  v404[35] = &unk_1F143FBF8;
  v405[34] = &unk_1F143FEB0;
  v405[35] = &unk_1F143FE98;
  v404[36] = &unk_1F143FC10;
  v404[37] = &unk_1F143FC28;
  v405[36] = &unk_1F143FEB0;
  v405[37] = &unk_1F143FEB0;
  v404[38] = &unk_1F143FC40;
  v404[39] = &unk_1F143FC58;
  v405[38] = &unk_1F143FEB0;
  v405[39] = &unk_1F143FEB0;
  v404[40] = &unk_1F143FC70;
  v404[41] = &unk_1F143FC88;
  v405[40] = &unk_1F143FE98;
  v405[41] = &unk_1F143FEB0;
  v404[42] = &unk_1F143FCA0;
  v404[43] = &unk_1F143FCB8;
  v405[42] = &unk_1F143FEB0;
  v405[43] = &unk_1F143FEB0;
  v404[44] = &unk_1F143FCD0;
  v404[45] = &unk_1F143FCE8;
  v405[44] = &unk_1F143FEB0;
  v405[45] = &unk_1F143FEB0;
  v404[46] = &unk_1F143FD00;
  v405[46] = &unk_1F143FE50;
  v302 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v405 forKeys:v404 count:47];
  v423[9] = v302;
  v422[10] = @"inputDisparityPixelBufferHeight";
  v402[0] = &unk_1F143F9D0;
  v402[1] = &unk_1F143FE38;
  v403[0] = &unk_1F143FE20;
  v403[1] = &unk_1F143FEB0;
  v402[2] = &unk_1F143FE68;
  v402[3] = &unk_1F143FE80;
  v403[2] = &unk_1F143FEB0;
  v403[3] = &unk_1F143FF88;
  v402[4] = &unk_1F143FA00;
  v402[5] = &unk_1F143FA30;
  v403[4] = &unk_1F143FE50;
  v403[5] = &unk_1F143FF88;
  v402[6] = &unk_1F143FA60;
  v402[7] = &unk_1F143FA78;
  v403[6] = &unk_1F143FE50;
  v403[7] = &unk_1F143FF88;
  v402[8] = &unk_1F143FAA8;
  v402[9] = &unk_1F143FEC8;
  v403[8] = &unk_1F143FE50;
  v403[9] = &unk_1F143FF88;
  v402[10] = &unk_1F143FEE0;
  v402[11] = &unk_1F143FEF8;
  v403[10] = &unk_1F143FE50;
  v403[11] = &unk_1F143FE50;
  v402[12] = &unk_1F143FF10;
  v402[13] = &unk_1F143FF28;
  v403[12] = &unk_1F143FF88;
  v403[13] = &unk_1F143FE50;
  v402[14] = &unk_1F143FF40;
  v402[15] = &unk_1F143FF58;
  v403[14] = &unk_1F143FE50;
  v403[15] = &unk_1F143FF88;
  v402[16] = &unk_1F143FF70;
  v402[17] = &unk_1F143FFA0;
  v403[16] = &unk_1F143FE98;
  v403[17] = &unk_1F143FF88;
  v402[18] = &unk_1F143FFB8;
  v402[19] = &unk_1F143FFD0;
  v403[18] = &unk_1F143FF88;
  v403[19] = &unk_1F143FE50;
  v402[20] = &unk_1F143FFE8;
  v402[21] = &unk_1F1440000;
  v403[20] = &unk_1F143FF88;
  v403[21] = &unk_1F143FE98;
  v402[22] = &unk_1F143FDA8;
  v402[23] = &unk_1F1440030;
  v403[22] = &unk_1F1440048;
  v403[23] = &unk_1F1440048;
  v402[24] = &unk_1F143FAD8;
  v402[25] = &unk_1F143FB08;
  v403[24] = &unk_1F143FF88;
  v403[25] = &unk_1F143FE50;
  v402[26] = &unk_1F143FB20;
  v402[27] = &unk_1F143FB38;
  v403[26] = &unk_1F143FF88;
  v403[27] = &unk_1F143FE50;
  v402[28] = &unk_1F143FB50;
  v402[29] = &unk_1F143FB68;
  v403[28] = &unk_1F143FE50;
  v403[29] = &unk_1F143FE50;
  v402[30] = &unk_1F143FB80;
  v402[31] = &unk_1F143FB98;
  v403[30] = &unk_1F143FE50;
  v403[31] = &unk_1F143FE50;
  v402[32] = &unk_1F143FBB0;
  v402[33] = &unk_1F143FBC8;
  v403[32] = &unk_1F143FF88;
  v403[33] = &unk_1F143FE50;
  v402[34] = &unk_1F143FBE0;
  v402[35] = &unk_1F143FBF8;
  v403[34] = &unk_1F143FE50;
  v403[35] = &unk_1F143FF88;
  v402[36] = &unk_1F143FC10;
  v402[37] = &unk_1F143FC28;
  v403[36] = &unk_1F143FE50;
  v403[37] = &unk_1F143FE50;
  v402[38] = &unk_1F143FC40;
  v402[39] = &unk_1F143FC58;
  v403[38] = &unk_1F143FE50;
  v403[39] = &unk_1F143FE50;
  v402[40] = &unk_1F143FC70;
  v402[41] = &unk_1F143FC88;
  v403[40] = &unk_1F143FF88;
  v403[41] = &unk_1F143FE50;
  v402[42] = &unk_1F143FCA0;
  v402[43] = &unk_1F143FCB8;
  v403[42] = &unk_1F143FE50;
  v403[43] = &unk_1F143FE50;
  v402[44] = &unk_1F143FCD0;
  v402[45] = &unk_1F143FCE8;
  v403[44] = &unk_1F143FE50;
  v403[45] = &unk_1F143FE50;
  v402[46] = &unk_1F143FD00;
  v403[46] = &unk_1F143FEB0;
  v276 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v403 forKeys:v402 count:47];
  v423[10] = v276;
  v422[11] = @"outputDisparityPixelBufferWidth";
  v400[0] = &unk_1F143F9D0;
  v400[1] = &unk_1F143FC88;
  v401[0] = &unk_1F143FEB0;
  v401[1] = &unk_1F143FE50;
  v400[2] = &unk_1F143FCA0;
  v400[3] = &unk_1F143FCB8;
  v401[2] = &unk_1F143FE50;
  v401[3] = &unk_1F143FE50;
  v400[4] = &unk_1F143FCD0;
  v400[5] = &unk_1F143FCE8;
  v401[4] = &unk_1F143FE50;
  v401[5] = &unk_1F143FE50;
  v400[6] = &unk_1F143FDC0;
  v401[6] = &unk_1F143FE50;
  v275 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v401 forKeys:v400 count:7];
  v423[11] = v275;
  v422[12] = @"outputDisparityPixelBufferHeight";
  v398[0] = &unk_1F143F9D0;
  v398[1] = &unk_1F143FC88;
  v399[0] = &unk_1F143FE50;
  v399[1] = &unk_1F143FEB0;
  v398[2] = &unk_1F143FCA0;
  v398[3] = &unk_1F143FCB8;
  v399[2] = &unk_1F143FEB0;
  v399[3] = &unk_1F143FEB0;
  v398[4] = &unk_1F143FCD0;
  v398[5] = &unk_1F143FCE8;
  v399[4] = &unk_1F143FEB0;
  v399[5] = &unk_1F143FEB0;
  v398[6] = &unk_1F143FDC0;
  v399[6] = &unk_1F143FEB0;
  v274 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v399 forKeys:v398 count:7];
  v423[12] = v274;
  v422[13] = @"outputDisparityOffset";
  v396[0] = &unk_1F143F9D0;
  v396[1] = &unk_1F143FB98;
  v397[0] = &unk_1F1440688;
  v397[1] = &unk_1F1440698;
  v396[2] = &unk_1F143FBC8;
  v396[3] = &unk_1F143FBE0;
  v397[2] = &unk_1F14406A8;
  v397[3] = &unk_1F14406B8;
  v396[4] = &unk_1F143FC10;
  v396[5] = &unk_1F143FC40;
  v397[4] = &unk_1F14406B8;
  v397[5] = &unk_1F14406A8;
  v396[6] = &unk_1F143FC58;
  v396[7] = &unk_1F143FDC0;
  v397[6] = &unk_1F14406B8;
  v397[7] = &unk_1F14406A8;
  v273 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v397 forKeys:v396 count:8];
  v423[13] = v273;
  v422[14] = @"inputToOutputDisparityPixelBufferRotation";
  v394[0] = &unk_1F143F9D0;
  v394[1] = &unk_1F143FE38;
  v395[0] = &unk_1F143FE38;
  v395[1] = &unk_1F143FA00;
  v394[2] = &unk_1F143FE68;
  v394[3] = &unk_1F143FE80;
  v395[2] = &unk_1F143FA00;
  v395[3] = &unk_1F143FE68;
  v394[4] = &unk_1F143FA30;
  v394[5] = &unk_1F143FA78;
  v395[4] = &unk_1F143FE68;
  v395[5] = &unk_1F143FE68;
  v394[6] = &unk_1F143FEC8;
  v394[7] = &unk_1F143FF10;
  v395[6] = &unk_1F143FE68;
  v395[7] = &unk_1F143FE68;
  v394[8] = &unk_1F143FF58;
  v394[9] = &unk_1F143FF70;
  v395[8] = &unk_1F143FE68;
  v395[9] = &unk_1F143FE38;
  v394[10] = &unk_1F143FFA0;
  v394[11] = &unk_1F143FFB8;
  v395[10] = &unk_1F143FE68;
  v395[11] = &unk_1F143FE68;
  v394[12] = &unk_1F143FFE8;
  v394[13] = &unk_1F1440000;
  v395[12] = &unk_1F143FE68;
  v395[13] = &unk_1F143FE38;
  v394[14] = &unk_1F143FAD8;
  v394[15] = &unk_1F143FB20;
  v395[14] = &unk_1F143FE68;
  v395[15] = &unk_1F143FE68;
  v394[16] = &unk_1F143FBB0;
  v394[17] = &unk_1F143FBF8;
  v395[16] = &unk_1F143FE68;
  v395[17] = &unk_1F143FE68;
  v394[18] = &unk_1F143FC70;
  v394[19] = &unk_1F143FC88;
  v395[18] = &unk_1F143FE68;
  v395[19] = &unk_1F143FA00;
  v394[20] = &unk_1F143FCA0;
  v394[21] = &unk_1F143FCB8;
  v395[20] = &unk_1F143FA00;
  v395[21] = &unk_1F143FA00;
  v394[22] = &unk_1F143FCD0;
  v394[23] = &unk_1F143FCE8;
  v395[22] = &unk_1F143FA00;
  v395[23] = &unk_1F143FA00;
  v394[24] = &unk_1F143FD00;
  v394[25] = &unk_1F143FDC0;
  v395[24] = &unk_1F143FA00;
  v395[25] = &unk_1F143FA00;
  v394[26] = &unk_1F143FDD8;
  v395[26] = &unk_1F143FE68;
  uint64_t v424 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v395 forKeys:v394 count:27];
  v422[15] = @"inputDisparityPixelBufferPixelFormat";
  v392[0] = &unk_1F143F9D0;
  v392[1] = &unk_1F143FE38;
  v393[0] = &unk_1F1440060;
  v393[1] = &unk_1F1440078;
  v272 = (void *)v424;
  uint64_t v425 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v393 forKeys:v392 count:2];
  v426 = &unk_1F1440090;
  v422[16] = @"outputDisparityPixelBufferPixelFormat";
  v422[17] = @"supportedInputSegmentationPixelBufferPixelFormats";
  v427 = &unk_1F143F940;
  v422[18] = @"focusStatisticsXTileCount";
  v390[0] = &unk_1F143F9D0;
  v390[1] = &unk_1F143FDF0;
  v391[0] = &unk_1F14400D8;
  v391[1] = &unk_1F14400F0;
  v301 = (void *)v425;
  v271 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v391 forKeys:v390 count:2];
  v428 = v271;
  v422[19] = @"focusStatisticsYTileCount";
  v388[0] = &unk_1F143F9D0;
  v388[1] = &unk_1F143FDF0;
  v389[0] = &unk_1F1440108;
  v389[1] = &unk_1F1440120;
  uint64_t v429 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v389 forKeys:v388 count:2];
  v430 = &unk_1F143FE20;
  v422[20] = @"depthPixelBufferXPadding";
  v422[21] = @"depthPixelBufferYPadding";
  v431 = &unk_1F143FE20;
  v422[22] = @"depthPixelBufferXReplication";
  v386[0] = &unk_1F143F9D0;
  v386[1] = &unk_1F143FE38;
  v387[0] = &unk_1F143FE20;
  v387[1] = &unk_1F1440138;
  v386[2] = &unk_1F143FE68;
  v386[3] = &unk_1F143FA00;
  v387[2] = &unk_1F1440138;
  v387[3] = &unk_1F1440138;
  v386[4] = &unk_1F143FA60;
  v386[5] = &unk_1F143FAA8;
  v387[4] = &unk_1F1440138;
  v387[5] = &unk_1F1440138;
  v386[6] = &unk_1F143FEE0;
  v386[7] = &unk_1F143FEF8;
  v387[6] = &unk_1F1440138;
  v387[7] = &unk_1F1440138;
  v386[8] = &unk_1F143FF28;
  v386[9] = &unk_1F143FF40;
  v387[8] = &unk_1F1440138;
  v387[9] = &unk_1F1440138;
  v386[10] = &unk_1F143FFD0;
  v386[11] = &unk_1F143FB08;
  v387[10] = &unk_1F1440138;
  v387[11] = &unk_1F1440138;
  v386[12] = &unk_1F143FB38;
  v386[13] = &unk_1F143FB50;
  v387[12] = &unk_1F1440138;
  v387[13] = &unk_1F1440138;
  v386[14] = &unk_1F143FB68;
  v386[15] = &unk_1F143FB80;
  v387[14] = &unk_1F1440138;
  v387[15] = &unk_1F1440138;
  v386[16] = &unk_1F143FB98;
  v386[17] = &unk_1F143FBC8;
  v387[16] = &unk_1F1440138;
  v387[17] = &unk_1F1440138;
  v386[18] = &unk_1F143FBE0;
  v386[19] = &unk_1F143FC10;
  v387[18] = &unk_1F1440138;
  v387[19] = &unk_1F1440138;
  v386[20] = &unk_1F143FC28;
  v386[21] = &unk_1F143FC40;
  v387[20] = &unk_1F1440138;
  v387[21] = &unk_1F1440138;
  v386[22] = &unk_1F143FC58;
  v386[23] = &unk_1F143FDC0;
  v387[22] = &unk_1F1440138;
  v387[23] = &unk_1F1440138;
  v270 = (void *)v429;
  uint64_t v432 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v387 forKeys:v386 count:24];
  v422[23] = @"depthPixelBufferYReplication";
  v384[0] = &unk_1F143F9D0;
  v384[1] = &unk_1F143FE38;
  v385[0] = &unk_1F143FE20;
  v385[1] = &unk_1F1440150;
  v384[2] = &unk_1F143FE68;
  v384[3] = &unk_1F143FA00;
  v385[2] = &unk_1F1440150;
  v385[3] = &unk_1F1440150;
  v384[4] = &unk_1F143FA60;
  v384[5] = &unk_1F143FAA8;
  v385[4] = &unk_1F1440150;
  v385[5] = &unk_1F1440150;
  v384[6] = &unk_1F143FEE0;
  v384[7] = &unk_1F143FEF8;
  v385[6] = &unk_1F1440150;
  v385[7] = &unk_1F1440150;
  v384[8] = &unk_1F143FF28;
  v384[9] = &unk_1F143FF40;
  v385[8] = &unk_1F1440150;
  v385[9] = &unk_1F1440150;
  v384[10] = &unk_1F143FB08;
  v384[11] = &unk_1F143FB38;
  v385[10] = &unk_1F1440150;
  v385[11] = &unk_1F1440150;
  v384[12] = &unk_1F143FB50;
  v384[13] = &unk_1F143FFD0;
  v385[12] = &unk_1F1440150;
  v385[13] = &unk_1F1440150;
  v384[14] = &unk_1F143FB68;
  v384[15] = &unk_1F143FB80;
  v385[14] = &unk_1F1440150;
  v385[15] = &unk_1F1440150;
  v384[16] = &unk_1F143FB98;
  v384[17] = &unk_1F143FBC8;
  v385[16] = &unk_1F1440150;
  v385[17] = &unk_1F1440150;
  v384[18] = &unk_1F143FBE0;
  v384[19] = &unk_1F143FC10;
  v385[18] = &unk_1F1440150;
  v385[19] = &unk_1F1440150;
  v384[20] = &unk_1F143FC28;
  v384[21] = &unk_1F143FC40;
  v385[20] = &unk_1F1440150;
  v385[21] = &unk_1F1440150;
  v384[22] = &unk_1F143FC58;
  v384[23] = &unk_1F143FDC0;
  v385[22] = &unk_1F1440150;
  v385[23] = &unk_1F1440150;
  v269 = (void *)v432;
  v268 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v385 forKeys:v384 count:24];
  v433 = v268;
  v422[24] = @"depthPixelBufferScale";
  v382[0] = &unk_1F143F9D0;
  v382[1] = &unk_1F143FE38;
  v383[0] = &unk_1F1440168;
  v383[1] = &unk_1F1440180;
  uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v383 forKeys:v382 count:2];
  v422[25] = @"depthPixelBufferOffset";
  v381[1] = &unk_1F14406C8;
  v381[2] = &unk_1F14406C8;
  v381[3] = &unk_1F14406D8;
  v381[4] = &unk_1F14406E8;
  v381[6] = &unk_1F1440708;
  v381[8] = &unk_1F1440708;
  v381[16] = &unk_1F14406D8;
  v381[17] = &unk_1F14406D8;
  v381[18] = &unk_1F14406D8;
  v381[19] = &unk_1F14406D8;
  v381[20] = &unk_1F1440738;
  v381[21] = &unk_1F14406D8;
  v381[22] = &unk_1F14406D8;
  v381[24] = &unk_1F1440748;
  v381[28] = &unk_1F1440758;
  v381[29] = &unk_1F1440768;
  v381[32] = &unk_1F1440758;
  v381[36] = &unk_1F1440718;
  v381[37] = &unk_1F1440758;
  v381[13] = &unk_1F1440718;
  v381[26] = &unk_1F1440718;
  v381[30] = &unk_1F1440718;
  v381[10] = &unk_1F1440718;
  v381[11] = &unk_1F1440728;
  v381[14] = &unk_1F1440728;
  v381[27] = &unk_1F1440728;
  v381[33] = &unk_1F1440728;
  v381[35] = &unk_1F1440728;
  v381[38] = &unk_1F1440728;
  v381[0] = &unk_1F14404E8;
  v381[12] = &unk_1F14406F8;
  v381[34] = &unk_1F14406F8;
  v267 = (void *)v34;
  uint64_t v434 = v34;
  v380[0] = &unk_1F143F9D0;
  v380[1] = &unk_1F143FE38;
  v380[2] = &unk_1F143FE68;
  v380[3] = &unk_1F143FE80;
  v380[4] = &unk_1F143FA00;
  v380[5] = &unk_1F143FA30;
  v381[5] = &unk_1F14406F8;
  v380[6] = &unk_1F143FA60;
  v380[7] = &unk_1F143FA78;
  v381[7] = &unk_1F14406F8;
  v380[8] = &unk_1F143FAA8;
  v380[9] = &unk_1F143FEC8;
  v381[9] = &unk_1F14406F8;
  v380[10] = &unk_1F143FEE0;
  v380[11] = &unk_1F143FEF8;
  v380[12] = &unk_1F143FF10;
  v380[13] = &unk_1F143FF28;
  v380[14] = &unk_1F143FF40;
  v380[15] = &unk_1F143FDF0;
  v381[15] = &unk_1F143FE20;
  v380[16] = &unk_1F143FF58;
  v380[17] = &unk_1F143FF70;
  v380[18] = &unk_1F143FFA0;
  v380[19] = &unk_1F143FFB8;
  v380[20] = &unk_1F143FFD0;
  v380[21] = &unk_1F143FFE8;
  v380[22] = &unk_1F1440000;
  v380[23] = &unk_1F143FAD8;
  v381[23] = &unk_1F14406F8;
  v380[24] = &unk_1F143FB08;
  v380[25] = &unk_1F143FB20;
  v381[25] = &unk_1F14406F8;
  v380[26] = &unk_1F143FB38;
  v380[27] = &unk_1F143FB50;
  v380[28] = &unk_1F143FB68;
  v380[29] = &unk_1F143FB80;
  v380[30] = &unk_1F143FB98;
  v380[31] = &unk_1F143FBB0;
  v381[31] = &unk_1F14406F8;
  v380[32] = &unk_1F143FBC8;
  v380[33] = &unk_1F143FBE0;
  v380[34] = &unk_1F143FBF8;
  v380[35] = &unk_1F143FC10;
  v380[36] = &unk_1F143FC28;
  v380[37] = &unk_1F143FC40;
  v380[38] = &unk_1F143FC58;
  v380[39] = &unk_1F143FC70;
  v381[39] = &unk_1F14406F8;
  uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v381 forKeys:v380 count:40];
  v422[26] = @"disparityStereoFocalLengthPixels";
  v379[4] = &unk_1F1440798;
  v379[6] = &unk_1F1440798;
  v379[8] = &unk_1F1440798;
  v379[10] = &unk_1F1440798;
  v379[13] = &unk_1F1440798;
  v379[24] = &unk_1F14407B8;
  v379[1] = &unk_1F1440778;
  v379[2] = &unk_1F1440778;
  v379[12] = &unk_1F1440788;
  v379[3] = &unk_1F1440788;
  v379[5] = &unk_1F1440788;
  v379[7] = &unk_1F1440788;
  v379[9] = &unk_1F1440788;
  v379[11] = &unk_1F14407A8;
  v379[14] = &unk_1F14407A8;
  v379[16] = &unk_1F1440788;
  v379[17] = &unk_1F1440788;
  v379[18] = &unk_1F1440788;
  v379[19] = &unk_1F1440788;
  v379[20] = &unk_1F14407A8;
  v379[21] = &unk_1F1440788;
  v379[22] = &unk_1F1440788;
  v379[23] = &unk_1F1440788;
  v379[25] = &unk_1F1440788;
  v379[26] = &unk_1F14407C8;
  v379[27] = &unk_1F14407A8;
  v379[30] = &unk_1F14407C8;
  v379[36] = &unk_1F14407C8;
  v379[32] = &unk_1F14407F8;
  v379[37] = &unk_1F14407F8;
  v379[28] = &unk_1F14407D8;
  v379[29] = &unk_1F14407E8;
  v379[33] = &unk_1F14407E8;
  v379[35] = &unk_1F14407E8;
  v379[38] = &unk_1F14407E8;
  v379[0] = &unk_1F14404E8;
  v379[34] = &unk_1F143FF88;
  uint64_t v435 = v35;
  v378[0] = &unk_1F143F9D0;
  v378[1] = &unk_1F143FE38;
  v378[2] = &unk_1F143FE68;
  v378[3] = &unk_1F143FE80;
  v378[4] = &unk_1F143FA00;
  v378[5] = &unk_1F143FA30;
  v378[6] = &unk_1F143FA60;
  v378[7] = &unk_1F143FA78;
  v378[8] = &unk_1F143FAA8;
  v378[9] = &unk_1F143FEC8;
  v378[10] = &unk_1F143FEE0;
  v378[11] = &unk_1F143FEF8;
  v378[12] = &unk_1F143FF10;
  v378[13] = &unk_1F143FF28;
  v378[14] = &unk_1F143FF40;
  v378[15] = &unk_1F143FDF0;
  v379[15] = &unk_1F143FE20;
  v378[16] = &unk_1F143FF58;
  v378[17] = &unk_1F143FF70;
  v378[18] = &unk_1F143FFA0;
  v378[19] = &unk_1F143FFB8;
  v378[20] = &unk_1F143FFD0;
  v378[21] = &unk_1F143FFE8;
  v378[22] = &unk_1F1440000;
  v378[23] = &unk_1F143FAD8;
  v378[24] = &unk_1F143FB08;
  v378[25] = &unk_1F143FB20;
  v378[26] = &unk_1F143FB38;
  v378[27] = &unk_1F143FB50;
  v378[28] = &unk_1F143FB68;
  v378[29] = &unk_1F143FB80;
  v378[30] = &unk_1F143FB98;
  v378[31] = &unk_1F143FBB0;
  v379[31] = &unk_1F143FF88;
  v378[32] = &unk_1F143FBC8;
  v378[33] = &unk_1F143FBE0;
  v378[34] = &unk_1F143FBF8;
  v378[35] = &unk_1F143FC10;
  v378[36] = &unk_1F143FC28;
  v378[37] = &unk_1F143FC40;
  v378[38] = &unk_1F143FC58;
  v378[39] = &unk_1F143FC70;
  v379[39] = &unk_1F143FF88;
  v266 = (void *)v35;
  uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v379 forKeys:v378 count:40];
  v422[27] = @"disparityStereoBaselineMeters";
  v377[1] = &unk_1F1440808;
  v377[2] = &unk_1F1440808;
  v377[4] = &unk_1F1440828;
  v377[6] = &unk_1F1440838;
  v377[8] = &unk_1F1440838;
  v377[10] = &unk_1F1440848;
  v377[11] = &unk_1F1440858;
  v377[13] = &unk_1F1440848;
  v377[14] = &unk_1F1440858;
  v377[20] = &unk_1F1440868;
  v377[24] = &unk_1F1440868;
  v377[26] = &unk_1F1440878;
  v377[27] = &unk_1F1440858;
  v377[30] = &unk_1F1440868;
  v377[36] = &unk_1F1440878;
  v377[32] = &unk_1F14408A8;
  v377[37] = &unk_1F14408A8;
  v377[28] = &unk_1F1440888;
  v377[29] = &unk_1F1440898;
  v377[33] = &unk_1F1440898;
  v377[35] = &unk_1F1440898;
  v377[38] = &unk_1F1440898;
  v377[0] = &unk_1F14404E8;
  v377[12] = &unk_1F1440818;
  v377[34] = &unk_1F1440818;
  v265 = (void *)v36;
  uint64_t v436 = v36;
  v376[0] = &unk_1F143F9D0;
  v376[1] = &unk_1F143FE38;
  v376[2] = &unk_1F143FE68;
  v376[3] = &unk_1F143FE80;
  v377[3] = &unk_1F1440818;
  v376[4] = &unk_1F143FA00;
  v376[5] = &unk_1F143FA30;
  v377[5] = &unk_1F1440818;
  v376[6] = &unk_1F143FA60;
  v376[7] = &unk_1F143FA78;
  v377[7] = &unk_1F1440818;
  v376[8] = &unk_1F143FAA8;
  v376[9] = &unk_1F143FEC8;
  v377[9] = &unk_1F1440818;
  v376[10] = &unk_1F143FEE0;
  v376[11] = &unk_1F143FEF8;
  v376[12] = &unk_1F143FF10;
  v376[13] = &unk_1F143FF28;
  v376[14] = &unk_1F143FF40;
  v376[15] = &unk_1F143FDF0;
  v377[15] = &unk_1F143FE20;
  v376[16] = &unk_1F143FF58;
  v376[17] = &unk_1F143FF70;
  v377[16] = &unk_1F1440818;
  v377[17] = &unk_1F1440818;
  v376[18] = &unk_1F143FFA0;
  v376[19] = &unk_1F143FFB8;
  v377[18] = &unk_1F1440818;
  v377[19] = &unk_1F1440818;
  v376[20] = &unk_1F143FFD0;
  v376[21] = &unk_1F143FFE8;
  v377[21] = &unk_1F1440818;
  v376[22] = &unk_1F1440000;
  v376[23] = &unk_1F143FAD8;
  v377[22] = &unk_1F1440818;
  v377[23] = &unk_1F1440818;
  v376[24] = &unk_1F143FB08;
  v376[25] = &unk_1F143FB20;
  v377[25] = &unk_1F1440818;
  v376[26] = &unk_1F143FB38;
  v376[27] = &unk_1F143FB50;
  v376[28] = &unk_1F143FB68;
  v376[29] = &unk_1F143FB80;
  v376[30] = &unk_1F143FB98;
  v376[31] = &unk_1F143FBB0;
  v377[31] = &unk_1F1440818;
  v376[32] = &unk_1F143FBC8;
  v376[33] = &unk_1F143FBE0;
  v376[34] = &unk_1F143FBF8;
  v376[35] = &unk_1F143FC10;
  v376[36] = &unk_1F143FC28;
  v376[37] = &unk_1F143FC40;
  v376[38] = &unk_1F143FC58;
  v376[39] = &unk_1F143FC70;
  v377[39] = &unk_1F1440818;
  v264 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v377 forKeys:v376 count:40];
  v437 = v264;
  v422[28] = @"canSkipDisparityHoleFillingAndTemporalRejection";
  uint64_t v37 = MEMORY[0x1E4F1CC38];
  v374[0] = &unk_1F143F9D0;
  v374[1] = &unk_1F143FB08;
  v375[0] = MEMORY[0x1E4F1CC28];
  v375[1] = MEMORY[0x1E4F1CC38];
  v374[2] = &unk_1F143FB38;
  v374[3] = &unk_1F143FB50;
  v375[2] = MEMORY[0x1E4F1CC38];
  v375[3] = MEMORY[0x1E4F1CC38];
  v374[4] = &unk_1F143FB68;
  v374[5] = &unk_1F143FB80;
  v375[4] = MEMORY[0x1E4F1CC38];
  v375[5] = MEMORY[0x1E4F1CC38];
  v374[6] = &unk_1F143FB98;
  v374[7] = &unk_1F143FBC8;
  v375[6] = MEMORY[0x1E4F1CC38];
  v375[7] = MEMORY[0x1E4F1CC38];
  v374[8] = &unk_1F143FBE0;
  v374[9] = &unk_1F143FC10;
  v375[8] = MEMORY[0x1E4F1CC38];
  v375[9] = MEMORY[0x1E4F1CC38];
  v374[10] = &unk_1F143FC28;
  v374[11] = &unk_1F143FC40;
  v375[10] = MEMORY[0x1E4F1CC38];
  v375[11] = MEMORY[0x1E4F1CC38];
  v374[12] = &unk_1F143FC58;
  v374[13] = &unk_1F143FC88;
  v375[12] = MEMORY[0x1E4F1CC38];
  v375[13] = MEMORY[0x1E4F1CC38];
  v374[14] = &unk_1F143FCA0;
  v374[15] = &unk_1F143FCB8;
  v375[14] = MEMORY[0x1E4F1CC38];
  v375[15] = MEMORY[0x1E4F1CC38];
  v374[16] = &unk_1F143FCD0;
  v374[17] = &unk_1F143FCE8;
  v375[16] = MEMORY[0x1E4F1CC38];
  v375[17] = MEMORY[0x1E4F1CC38];
  v374[18] = &unk_1F143FD00;
  v374[19] = &unk_1F143FDC0;
  v375[18] = MEMORY[0x1E4F1CC38];
  v375[19] = MEMORY[0x1E4F1CC38];
  v374[20] = &unk_1F143FDD8;
  v375[20] = MEMORY[0x1E4F1CC38];
  v263 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v375 forKeys:v374 count:21];
  v438 = v263;
  v422[29] = @"supportsForegroundBlur";
  v372[0] = &unk_1F143F9D0;
  v372[1] = &unk_1F143FB98;
  v373[0] = MEMORY[0x1E4F1CC28];
  v373[1] = v37;
  v372[2] = &unk_1F143FBB0;
  v372[3] = &unk_1F143FBC8;
  v373[2] = v37;
  v373[3] = v37;
  v372[4] = &unk_1F143FBE0;
  v372[5] = &unk_1F143FC10;
  v373[4] = v37;
  v373[5] = v37;
  v372[6] = &unk_1F143FC28;
  v372[7] = &unk_1F143FC40;
  v373[6] = v37;
  v373[7] = v37;
  v372[8] = &unk_1F143FBF8;
  v372[9] = &unk_1F143FC58;
  v373[8] = v37;
  v373[9] = v37;
  v372[10] = &unk_1F143FC70;
  v372[11] = &unk_1F143FC88;
  v373[10] = v37;
  v373[11] = v37;
  v372[12] = &unk_1F143FCA0;
  v372[13] = &unk_1F143FCB8;
  v373[12] = v37;
  v373[13] = v37;
  v372[14] = &unk_1F143FCD0;
  v372[15] = &unk_1F143FCE8;
  v373[14] = v37;
  v373[15] = v37;
  v372[16] = &unk_1F143FD00;
  v372[17] = &unk_1F143FF70;
  v373[16] = v37;
  v373[17] = v37;
  v372[18] = &unk_1F1440000;
  v372[19] = &unk_1F143FDC0;
  v373[18] = v37;
  v373[19] = v37;
  v372[20] = &unk_1F143FDD8;
  v373[20] = v37;
  v262 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v373 forKeys:v372 count:21];
  v439 = v262;
  v422[30] = @"rawShiftInvalidThreshold";
  v370[0] = &unk_1F143F9D0;
  v370[1] = &unk_1F143FE38;
  v371[0] = &unk_1F1440198;
  v371[1] = &unk_1F14401B0;
  uint64_t v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v371 forKeys:v370 count:2];
  v422[31] = @"depthPixelBufferMaxLeftOcclusionDisparityChange";
  v261 = (void *)v38;
  uint64_t v440 = v38;
  v368[0] = &unk_1F143F9D0;
  v368[1] = &unk_1F143FE80;
  v369[0] = &unk_1F14404F8;
  v369[1] = &unk_1F1440688;
  v368[2] = &unk_1F143FA30;
  v368[3] = &unk_1F143FA78;
  v369[2] = &unk_1F1440688;
  v369[3] = &unk_1F1440688;
  v368[4] = &unk_1F143FEC8;
  v368[5] = &unk_1F143FF10;
  v369[4] = &unk_1F1440688;
  v369[5] = &unk_1F1440688;
  v368[6] = &unk_1F143FDF0;
  v368[7] = &unk_1F143FF58;
  v369[6] = &unk_1F1440508;
  v369[7] = &unk_1F1440688;
  v368[8] = &unk_1F143FF70;
  v368[9] = &unk_1F143FFA0;
  v369[8] = &unk_1F1440688;
  v369[9] = &unk_1F1440688;
  v368[10] = &unk_1F143FFB8;
  v368[11] = &unk_1F143FFE8;
  v369[10] = &unk_1F1440688;
  v369[11] = &unk_1F1440688;
  v368[12] = &unk_1F1440000;
  v368[13] = &unk_1F143FAD8;
  v369[12] = &unk_1F1440688;
  v369[13] = &unk_1F1440688;
  v368[14] = &unk_1F143FB20;
  v368[15] = &unk_1F143FBB0;
  v369[14] = &unk_1F1440688;
  v369[15] = &unk_1F1440688;
  v368[16] = &unk_1F143FBF8;
  v368[17] = &unk_1F143FC70;
  v369[16] = &unk_1F1440688;
  v369[17] = &unk_1F1440688;
  v368[18] = &unk_1F143FD00;
  v369[18] = &unk_1F1440688;
  v260 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v369 forKeys:v368 count:19];
  v441 = v260;
  v442 = &unk_1F143FE20;
  v422[32] = @"depthPixelBufferMaxRightOcclusionDisparityChange";
  v422[33] = @"backgroundDisparityUpdateRate";
  v443 = &unk_1F14408B8;
  v444 = &unk_1F14408C8;
  v422[34] = @"invalidDisparityRatioUpdateRate";
  v422[35] = @"backgroundDisparityStatsWindowSize";
  v445 = &unk_1F14401C8;
  v446 = &unk_1F14401E0;
  v422[36] = @"invalidDisparityRatioStatsWindowSize";
  v422[37] = @"minDeltaCanonicalDisparity";
  v366[0] = &unk_1F143F9D0;
  v366[1] = &unk_1F143FE80;
  v367[0] = &unk_1F14408C8;
  v367[1] = &unk_1F14406A8;
  v366[2] = &unk_1F143FA30;
  v366[3] = &unk_1F143FA78;
  v367[2] = &unk_1F14406A8;
  v367[3] = &unk_1F14406A8;
  v366[4] = &unk_1F143FEC8;
  v366[5] = &unk_1F143FF10;
  v367[4] = &unk_1F14406A8;
  v367[5] = &unk_1F14406A8;
  v366[6] = &unk_1F143FDF0;
  v366[7] = &unk_1F143FF58;
  v367[6] = &unk_1F1440518;
  v367[7] = &unk_1F14408C8;
  v366[8] = &unk_1F143FF70;
  v366[9] = &unk_1F143FFA0;
  v367[8] = &unk_1F14408C8;
  v367[9] = &unk_1F14406A8;
  v366[10] = &unk_1F143FFB8;
  v366[11] = &unk_1F143FFE8;
  v367[10] = &unk_1F14406A8;
  v367[11] = &unk_1F14406A8;
  v366[12] = &unk_1F1440000;
  v366[13] = &unk_1F143FAD8;
  v367[12] = &unk_1F14406A8;
  v367[13] = &unk_1F14406A8;
  v366[14] = &unk_1F143FB20;
  v366[15] = &unk_1F143FBB0;
  v367[14] = &unk_1F14406A8;
  v367[15] = &unk_1F14406A8;
  v366[16] = &unk_1F143FBC8;
  v366[17] = &unk_1F143FBF8;
  v367[16] = &unk_1F14408D8;
  v367[17] = &unk_1F14406A8;
  v366[18] = &unk_1F143FC40;
  v366[19] = &unk_1F143FC70;
  v367[18] = &unk_1F14408D8;
  v367[19] = &unk_1F14406A8;
  v366[20] = &unk_1F143FD00;
  v366[21] = &unk_1F143FDC0;
  v367[20] = &unk_1F14406A8;
  v367[21] = &unk_1F14408D8;
  v366[22] = &unk_1F143FDD8;
  v367[22] = &unk_1F14406A8;
  v259 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v367 forKeys:v366 count:23];
  v447 = v259;
  v422[38] = @"maxDeltaCanonicalDisparity";
  v364[0] = &unk_1F143F9D0;
  v364[1] = &unk_1F143FE80;
  v365[0] = &unk_1F14408E8;
  v365[1] = &unk_1F14408F8;
  v364[2] = &unk_1F143FA30;
  v364[3] = &unk_1F143FA78;
  v365[2] = &unk_1F14408F8;
  v365[3] = &unk_1F14408F8;
  v364[4] = &unk_1F143FEC8;
  v364[5] = &unk_1F143FF10;
  v365[4] = &unk_1F14408F8;
  v365[5] = &unk_1F14408F8;
  v364[6] = &unk_1F143FDF0;
  v364[7] = &unk_1F143FF58;
  v365[6] = &unk_1F1440518;
  v365[7] = &unk_1F1440698;
  v364[8] = &unk_1F143FF70;
  v364[9] = &unk_1F143FFA0;
  v365[8] = &unk_1F1440698;
  v365[9] = &unk_1F14408F8;
  v364[10] = &unk_1F143FFB8;
  v364[11] = &unk_1F143FFE8;
  v365[10] = &unk_1F14408F8;
  v365[11] = &unk_1F14408F8;
  v364[12] = &unk_1F1440000;
  v364[13] = &unk_1F143FAD8;
  v365[12] = &unk_1F14408F8;
  v365[13] = &unk_1F14408F8;
  v364[14] = &unk_1F143FB20;
  v364[15] = &unk_1F143FBB0;
  v365[14] = &unk_1F14408F8;
  v365[15] = &unk_1F14408F8;
  v364[16] = &unk_1F143FBF8;
  v364[17] = &unk_1F143FC70;
  v365[16] = &unk_1F14408F8;
  v365[17] = &unk_1F14408F8;
  v364[18] = &unk_1F143FD00;
  v364[19] = &unk_1F143FDD8;
  v365[18] = &unk_1F14408F8;
  v365[19] = &unk_1F14408F8;
  v258 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v365 forKeys:v364 count:20];
  v448 = v258;
  v422[39] = @"centerDeltaCanonicalDisparity";
  v362[0] = &unk_1F143F9D0;
  v362[1] = &unk_1F143FE80;
  v363[0] = &unk_1F1440908;
  v363[1] = &unk_1F1440918;
  v362[2] = &unk_1F143FA30;
  v362[3] = &unk_1F143FA78;
  v363[2] = &unk_1F1440918;
  v363[3] = &unk_1F1440918;
  v362[4] = &unk_1F143FEC8;
  v362[5] = &unk_1F143FF10;
  v363[4] = &unk_1F1440918;
  v363[5] = &unk_1F1440918;
  v362[6] = &unk_1F143FDF0;
  v362[7] = &unk_1F143FF58;
  v363[6] = &unk_1F1440518;
  v363[7] = &unk_1F1440928;
  v362[8] = &unk_1F143FF70;
  v362[9] = &unk_1F143FFA0;
  v363[8] = &unk_1F1440928;
  v363[9] = &unk_1F1440918;
  v362[10] = &unk_1F143FFB8;
  v362[11] = &unk_1F143FFE8;
  v363[10] = &unk_1F1440918;
  v363[11] = &unk_1F1440918;
  v362[12] = &unk_1F1440000;
  v362[13] = &unk_1F143FAD8;
  v363[12] = &unk_1F1440918;
  v363[13] = &unk_1F1440918;
  v362[14] = &unk_1F143FB20;
  v362[15] = &unk_1F143FBB0;
  v363[14] = &unk_1F1440918;
  v363[15] = &unk_1F1440918;
  v362[16] = &unk_1F143FBF8;
  v362[17] = &unk_1F143FC70;
  v363[16] = &unk_1F1440918;
  v363[17] = &unk_1F1440918;
  v362[18] = &unk_1F143FD00;
  v362[19] = &unk_1F143FDD8;
  v363[18] = &unk_1F1440918;
  v363[19] = &unk_1F1440918;
  v257 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v363 forKeys:v362 count:20];
  v449 = v257;
  v450 = &unk_1F1440938;
  v422[40] = @"dsCanonicalLowThld";
  v422[41] = @"dsCanonicalLowScale";
  v360[0] = &unk_1F143F9D0;
  v360[1] = &unk_1F143FE80;
  v361[0] = &unk_1F1440948;
  v361[1] = &unk_1F1440958;
  v360[2] = &unk_1F143FA30;
  v360[3] = &unk_1F143FA78;
  v361[2] = &unk_1F1440958;
  v361[3] = &unk_1F1440958;
  v360[4] = &unk_1F143FEC8;
  v360[5] = &unk_1F143FF10;
  v361[4] = &unk_1F1440958;
  v361[5] = &unk_1F1440958;
  v360[6] = &unk_1F143FF58;
  v360[7] = &unk_1F143FF70;
  v361[6] = &unk_1F1440958;
  v361[7] = &unk_1F1440958;
  v360[8] = &unk_1F143FFA0;
  v360[9] = &unk_1F143FFB8;
  v361[8] = &unk_1F1440958;
  v361[9] = &unk_1F1440958;
  v360[10] = &unk_1F143FFE8;
  v360[11] = &unk_1F1440000;
  v361[10] = &unk_1F1440958;
  v361[11] = &unk_1F1440958;
  v360[12] = &unk_1F143FAD8;
  v360[13] = &unk_1F143FB20;
  v361[12] = &unk_1F1440958;
  v361[13] = &unk_1F1440958;
  v360[14] = &unk_1F143FBB0;
  v360[15] = &unk_1F143FBF8;
  v361[14] = &unk_1F1440958;
  v361[15] = &unk_1F1440958;
  v360[16] = &unk_1F143FC70;
  v360[17] = &unk_1F143FD00;
  v361[16] = &unk_1F1440958;
  v361[17] = &unk_1F1440958;
  v360[18] = &unk_1F143FDD8;
  v361[18] = &unk_1F1440958;
  v256 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v361 forKeys:v360 count:19];
  v451 = v256;
  v452 = &unk_1F1440968;
  v422[42] = @"dsCanonicalHighThld";
  v422[43] = @"linearDeltaDepthMultiplier";
  v453 = &unk_1F1440978;
  v454 = &unk_1F1440988;
  v422[44] = @"linearDeltaDepthOffset";
  v422[45] = @"dsCanonicalHighScale";
  v358[0] = &unk_1F143F9D0;
  v358[1] = &unk_1F143FE80;
  v359[0] = &unk_1F1440998;
  v359[1] = &unk_1F14409A8;
  v358[2] = &unk_1F143FA30;
  v358[3] = &unk_1F143FA78;
  v359[2] = &unk_1F14409A8;
  v359[3] = &unk_1F14409A8;
  v358[4] = &unk_1F143FEC8;
  v358[5] = &unk_1F143FF10;
  v359[4] = &unk_1F14409A8;
  v359[5] = &unk_1F14409A8;
  v358[6] = &unk_1F143FF58;
  v358[7] = &unk_1F143FF70;
  v359[6] = &unk_1F14409A8;
  v359[7] = &unk_1F14409A8;
  v358[8] = &unk_1F143FFA0;
  v358[9] = &unk_1F143FFB8;
  v359[8] = &unk_1F14409A8;
  v359[9] = &unk_1F14409A8;
  v358[10] = &unk_1F143FFE8;
  v358[11] = &unk_1F1440000;
  v359[10] = &unk_1F14409A8;
  v359[11] = &unk_1F14409A8;
  v358[12] = &unk_1F143FAD8;
  v358[13] = &unk_1F143FB20;
  v359[12] = &unk_1F14409A8;
  v359[13] = &unk_1F14409A8;
  v358[14] = &unk_1F143FBB0;
  v359[14] = &unk_1F14409A8;
  v255 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v359 forKeys:v358 count:15];
  v455 = v255;
  v456 = &unk_1F14406A8;
  v422[46] = @"foregroundPercentile";
  v422[47] = @"closeDisparityPercentile";
  v457 = &unk_1F1440698;
  v458 = &unk_1F14406A8;
  v422[48] = @"deltaDepth";
  v422[49] = @"mattingUpdateRate";
  v356 = &unk_1F143F9D0;
  v357 = &unk_1F14408B8;
  v254 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v357 forKeys:&v356 count:1];
  v459 = v254;
  v460 = &unk_1F14406A8;
  v422[50] = @"mattingUpdateRateFast";
  v422[51] = @"guidedFilterUnconfidentWeight";
  v461 = &unk_1F14409B8;
  v462 = &unk_1F1440180;
  v422[52] = @"guidedFilterMinDistToDeweight";
  v422[53] = @"foregroundMaskDilationRadius";
  v463 = &unk_1F14401F8;
  v464 = &unk_1F1440180;
  v422[54] = @"infConvolutionDownsampling";
  v422[55] = @"laplacianLimitingDownsampling";
  v354[0] = &unk_1F143F9D0;
  v354[1] = &unk_1F143FE38;
  v355[0] = &unk_1F14401F8;
  v355[1] = &unk_1F1440210;
  v354[2] = &unk_1F143FE68;
  v354[3] = &unk_1F143FE80;
  v355[2] = &unk_1F1440210;
  v355[3] = &unk_1F1440210;
  v354[4] = &unk_1F143FA00;
  v355[4] = &unk_1F1440210;
  v300 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v355 forKeys:v354 count:5];
  v465 = v300;
  v422[56] = @"laplacianLimitingBlurSize";
  v352[0] = &unk_1F143F9D0;
  v352[1] = &unk_1F143FE38;
  v353[0] = &unk_1F1440210;
  v353[1] = &unk_1F143FE20;
  v352[2] = &unk_1F143FE68;
  v352[3] = &unk_1F143FE80;
  v353[2] = &unk_1F143FE20;
  v353[3] = &unk_1F143FE20;
  v352[4] = &unk_1F143FA00;
  v353[4] = &unk_1F143FE20;
  v253 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v353 forKeys:v352 count:5];
  v466 = v253;
  v467 = &unk_1F1440228;
  v422[57] = @"referenceDisparity";
  v422[58] = @"deltaCanonicalDisparity";
  v350[0] = &unk_1F143F9D0;
  v350[1] = &unk_1F143FE80;
  v351[0] = &unk_1F1440908;
  v351[1] = &unk_1F14409C8;
  v350[2] = &unk_1F143FA30;
  v350[3] = &unk_1F143FA78;
  v351[2] = &unk_1F14409C8;
  v351[3] = &unk_1F14409C8;
  v350[4] = &unk_1F143FEC8;
  v350[5] = &unk_1F143FF10;
  v351[4] = &unk_1F14409C8;
  v351[5] = &unk_1F14409C8;
  v350[6] = &unk_1F143FF58;
  v350[7] = &unk_1F143FF70;
  v351[6] = &unk_1F14409C8;
  v351[7] = &unk_1F14409C8;
  v350[8] = &unk_1F143FFA0;
  v350[9] = &unk_1F143FFB8;
  v351[8] = &unk_1F14409C8;
  v351[9] = &unk_1F14409C8;
  v350[10] = &unk_1F143FFE8;
  v350[11] = &unk_1F1440000;
  v351[10] = &unk_1F14409C8;
  v351[11] = &unk_1F14409C8;
  v350[12] = &unk_1F143FAD8;
  v350[13] = &unk_1F143FB20;
  v351[12] = &unk_1F14409C8;
  v351[13] = &unk_1F14409C8;
  v350[14] = &unk_1F143FBB0;
  v350[15] = &unk_1F143FBF8;
  v351[14] = &unk_1F14409C8;
  v351[15] = &unk_1F14409C8;
  v350[16] = &unk_1F143FC70;
  v350[17] = &unk_1F143FD00;
  v351[16] = &unk_1F14409C8;
  v351[17] = &unk_1F14409A8;
  v350[18] = &unk_1F143FDD8;
  v351[18] = &unk_1F14409C8;
  v252 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v351 forKeys:v350 count:19];
  v468 = v252;
  v422[59] = @"alphaCoeffFilterColorStd";
  v348 = &unk_1F143F9D0;
  v349 = &unk_1F1440138;
  v251 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v349 forKeys:&v348 count:1];
  v469 = v251;
  v470 = &unk_1F1440138;
  v422[60] = @"alphaCoeffFilterColorStdFast";
  v422[61] = @"alphaMaxLaplacian";
  v471 = &unk_1F14409D8;
  v472 = &unk_1F14401F8;
  v422[62] = @"alphaContrastExponent";
  v422[63] = @"alphaGammaExponent";
  v422[64] = @"disparityFilterColorStd";
  v473 = &unk_1F14409E8;
  v474 = &unk_1F1440240;
  v422[65] = @"disparityFilterUpdateRate";
  v475 = &unk_1F14406A8;
  v422[66] = @"minimumConfidenceToKeepDisparity";
  v476 = &unk_1F14409F8;
  v422[67] = @"maximumSimilarityToKeepDisparity";
  v477 = &unk_1F14408F8;
  v422[68] = @"maxDisparityFillingInconsistency";
  v478 = &unk_1F1440258;
  v422[69] = @"maxDisparityFillingDistFromForeground";
  v479 = &unk_1F1440180;
  v422[70] = @"maxDistToPushDisparityEdgesFwd";
  v480 = &unk_1F1440270;
  v422[71] = @"maxDistToPushDisparityEdgesRev";
  v481 = &unk_1F1440270;
  v422[72] = @"disparityPushingBackgroundToForegroundDisparityDifference";
  v482 = &unk_1F1440288;
  v422[73] = @"renderingDisparityUpdateRate";
  v483 = &unk_1F14408B8;
  v422[74] = @"renderingDisparityBlurRadius";
  v346[0] = &unk_1F143F9D0;
  v346[1] = &unk_1F143FDF0;
  v347[0] = &unk_1F14401F8;
  v347[1] = &unk_1F1440150;
  v250 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v347 forKeys:v346 count:2];
  v484 = v250;
  v422[75] = @"offsetNoiseBitCalculation";
  v344[0] = &unk_1F143F9D0;
  v344[1] = &unk_1F143FDF0;
  v345[0] = &unk_1F1440528;
  v345[1] = &unk_1F1440538;
  v249 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v345 forKeys:v344 count:2];
  v485 = v249;
  v422[76] = @"gainMultiplierNoiseBitCalculation";
  v342[0] = &unk_1F143F9D0;
  v342[1] = &unk_1F143FDF0;
  v343[0] = &unk_1F1440548;
  v343[1] = &unk_1F1440558;
  v248 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v343 forKeys:v342 count:2];
  v486 = v248;
  v422[77] = @"luxMultiplierNoiseBitCalculation";
  v340[0] = &unk_1F143F9D0;
  v340[1] = &unk_1F143FDF0;
  v341[0] = &unk_1F1440568;
  v341[1] = &unk_1F1440578;
  uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v341 forKeys:v340 count:2];
  v422[78] = @"renderingLensFocalLength";
  v338[1] = &unk_1F143FE38;
  v338[4] = &unk_1F143FA00;
  v338[6] = &unk_1F143FA60;
  v339[4] = &unk_1F14405B8;
  v339[6] = &unk_1F14405B8;
  v338[8] = &unk_1F143FAA8;
  v339[8] = &unk_1F14405B8;
  v338[10] = &unk_1F143FEE0;
  v338[13] = &unk_1F143FF28;
  v339[0] = &unk_1F1440588;
  v339[1] = &unk_1F1440598;
  v339[2] = &unk_1F1440598;
  v339[3] = &unk_1F14405A8;
  v339[5] = &unk_1F14405A8;
  v339[7] = &unk_1F14405A8;
  v338[15] = &unk_1F143FDF0;
  v339[28] = &unk_1F1440608;
  v339[16] = &unk_1F14405A8;
  v339[17] = &unk_1F14405A8;
  v339[18] = &unk_1F14405A8;
  v339[21] = &unk_1F14405A8;
  v339[22] = &unk_1F14405A8;
  v339[23] = &unk_1F14405A8;
  v339[29] = &unk_1F14405A8;
  v339[26] = &unk_1F14405F8;
  v338[30] = &unk_1F143FB68;
  v339[30] = &unk_1F1440618;
  v339[38] = &unk_1F14405F8;
  v339[34] = &unk_1F1440628;
  v339[39] = &unk_1F1440628;
  v339[13] = &unk_1F14405D8;
  v339[10] = &unk_1F14405D8;
  v339[20] = &unk_1F14405E8;
  v339[11] = &unk_1F14405E8;
  v339[14] = &unk_1F14405E8;
  v339[15] = &unk_1F14405E8;
  v339[24] = &unk_1F14405E8;
  v339[27] = &unk_1F14405E8;
  v339[31] = &unk_1F14405E8;
  v339[32] = &unk_1F14405E8;
  v339[35] = &unk_1F14405E8;
  v339[37] = &unk_1F14405E8;
  v339[40] = &unk_1F14405E8;
  v338[2] = &unk_1F143FE68;
  v338[0] = &unk_1F143F9D0;
  v338[12] = &unk_1F143FF10;
  v339[12] = &unk_1F14405C8;
  v338[14] = &unk_1F143FF40;
  v339[36] = &unk_1F14405C8;
  v247 = (void *)v39;
  uint64_t v487 = v39;
  v338[3] = &unk_1F143FE80;
  v338[5] = &unk_1F143FA30;
  v338[7] = &unk_1F143FA78;
  v338[9] = &unk_1F143FEC8;
  v339[9] = &unk_1F14405C8;
  v338[11] = &unk_1F143FEF8;
  v338[16] = &unk_1F143FF58;
  v338[17] = &unk_1F143FF70;
  v338[18] = &unk_1F143FFA0;
  v338[19] = &unk_1F143FFB8;
  v339[19] = &unk_1F14405C8;
  v338[20] = &unk_1F143FFD0;
  v338[21] = &unk_1F143FFE8;
  v338[22] = &unk_1F1440000;
  v338[23] = &unk_1F143FAD8;
  v338[24] = &unk_1F143FB08;
  v338[25] = &unk_1F143FB20;
  v339[25] = &unk_1F14405C8;
  v338[26] = &unk_1F143FB38;
  v338[27] = &unk_1F143FB50;
  v338[28] = &unk_1F143FDA8;
  v338[29] = &unk_1F1440030;
  v338[31] = &unk_1F143FB80;
  v338[32] = &unk_1F143FB98;
  v338[33] = &unk_1F143FBB0;
  v339[33] = &unk_1F14405C8;
  v338[34] = &unk_1F143FBC8;
  v338[35] = &unk_1F143FBE0;
  v338[36] = &unk_1F143FBF8;
  v338[37] = &unk_1F143FC10;
  v338[38] = &unk_1F143FC28;
  v338[39] = &unk_1F143FC40;
  v338[40] = &unk_1F143FC58;
  v338[41] = &unk_1F143FC70;
  v339[41] = &unk_1F14405C8;
  v338[42] = &unk_1F143FD00;
  v339[42] = &unk_1F14405C8;
  uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v339 forKeys:v338 count:43];
  v422[79] = @"fNumberMultiplier";
  v336[0] = &unk_1F143F9D0;
  v336[1] = &unk_1F143FEF8;
  v246 = (void *)v40;
  uint64_t v488 = v40;
  v337[0] = &unk_1F1440A08;
  v337[1] = &unk_1F1440A18;
  v336[2] = &unk_1F143FF40;
  v336[3] = &unk_1F143FFD0;
  v337[2] = &unk_1F1440A18;
  v337[3] = &unk_1F1440A18;
  v336[4] = &unk_1F143FDA8;
  v336[5] = &unk_1F1440030;
  v337[4] = &unk_1F14406A8;
  v337[5] = &unk_1F1440A28;
  v336[6] = &unk_1F143FB38;
  v336[7] = &unk_1F143FB50;
  v337[6] = &unk_1F1440A18;
  v337[7] = &unk_1F1440A18;
  v336[8] = &unk_1F143FB08;
  v336[9] = &unk_1F143FB80;
  v337[8] = &unk_1F1440A18;
  v337[9] = &unk_1F1440A18;
  v336[10] = &unk_1F143FBE0;
  v336[11] = &unk_1F143FB98;
  v337[10] = &unk_1F1440A18;
  v337[11] = &unk_1F1440A18;
  v336[12] = &unk_1F143FBC8;
  v336[13] = &unk_1F143FC10;
  v337[12] = &unk_1F1440A18;
  v337[13] = &unk_1F1440A18;
  v336[14] = &unk_1F143FC28;
  v336[15] = &unk_1F143FC40;
  v337[14] = &unk_1F1440A18;
  v337[15] = &unk_1F1440A18;
  v336[16] = &unk_1F143FC58;
  v336[17] = &unk_1F143FC88;
  v337[16] = &unk_1F1440A18;
  v337[17] = &unk_1F1440A18;
  v336[18] = &unk_1F143FCA0;
  v336[19] = &unk_1F143FCB8;
  v337[18] = &unk_1F1440A18;
  v337[19] = &unk_1F1440A18;
  v336[20] = &unk_1F143FCD0;
  v336[21] = &unk_1F143FCE8;
  v337[20] = &unk_1F1440A18;
  v337[21] = &unk_1F1440A18;
  v336[22] = &unk_1F143FDC0;
  v337[22] = &unk_1F1440A18;
  uint64_t v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v337 forKeys:v336 count:23];
  v422[80] = @"focusThresholdHardness";
  v422[81] = @"focusUpdateRateSlow";
  v334[18] = &unk_1F143FBE0;
  v334[19] = &unk_1F143FBC8;
  v334[20] = &unk_1F143FC58;
  v334[21] = &unk_1F143FC10;
  v334[22] = &unk_1F143FC28;
  v334[23] = &unk_1F143FC40;
  v334[24] = &unk_1F143FC88;
  v334[25] = &unk_1F143FCA0;
  v334[26] = &unk_1F143FCB8;
  v245 = (void *)v41;
  uint64_t v489 = v41;
  v334[27] = &unk_1F143FCD0;
  v490 = &unk_1F1440638;
  v334[28] = &unk_1F143FCE8;
  v334[0] = &unk_1F143F9D0;
  v334[1] = &unk_1F143FE80;
  v335[0] = &unk_1F1440A38;
  v335[1] = &unk_1F14408C8;
  v334[2] = &unk_1F143FA30;
  v334[3] = &unk_1F143FA78;
  v335[2] = &unk_1F14408C8;
  v335[3] = &unk_1F14408C8;
  v334[4] = &unk_1F143FEC8;
  v334[5] = &unk_1F143FF10;
  v335[4] = &unk_1F14408C8;
  v335[5] = &unk_1F14408C8;
  v334[6] = &unk_1F143FF58;
  v334[7] = &unk_1F143FF70;
  v335[6] = &unk_1F14408C8;
  v335[7] = &unk_1F14408C8;
  v334[8] = &unk_1F143FFA0;
  v334[9] = &unk_1F143FFB8;
  v335[8] = &unk_1F14408C8;
  v335[9] = &unk_1F14408C8;
  v334[10] = &unk_1F143FFE8;
  v334[11] = &unk_1F1440000;
  v335[10] = &unk_1F14408C8;
  v335[11] = &unk_1F14408C8;
  v334[12] = &unk_1F143FAD8;
  v334[13] = &unk_1F143FB20;
  v335[12] = &unk_1F14408C8;
  v335[13] = &unk_1F14408C8;
  v334[14] = &unk_1F1440030;
  v334[15] = &unk_1F143FBB0;
  v335[14] = &unk_1F14408C8;
  v335[15] = &unk_1F14408C8;
  v334[16] = &unk_1F143FBF8;
  v334[17] = &unk_1F143FC70;
  v335[16] = &unk_1F14408C8;
  v335[17] = &unk_1F14408C8;
  v335[18] = &unk_1F14408E8;
  v335[19] = &unk_1F14408E8;
  v335[20] = &unk_1F14408E8;
  v335[21] = &unk_1F14408E8;
  v335[22] = &unk_1F14408E8;
  v335[23] = &unk_1F14408E8;
  v335[24] = &unk_1F14408E8;
  v335[25] = &unk_1F14408E8;
  v335[26] = &unk_1F14408E8;
  v335[27] = &unk_1F14408E8;
  v334[29] = &unk_1F143FD00;
  v335[28] = &unk_1F14408E8;
  v335[29] = &unk_1F14408C8;
  v334[30] = &unk_1F143FDC0;
  v334[31] = &unk_1F143FDD8;
  v335[30] = &unk_1F14408E8;
  v335[31] = &unk_1F14408C8;
  v244 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v335 forKeys:v334 count:32];
  v491 = v244;
  v422[82] = @"focusUpdateRateFast";
  v492 = &unk_1F1440648;
  v422[83] = @"maxFramesWithoutFace";
  v332[0] = &unk_1F143F9D0;
  v332[1] = &unk_1F143FE80;
  v333[0] = &unk_1F143FE20;
  v333[1] = &unk_1F1440270;
  v332[2] = &unk_1F143FA30;
  v332[3] = &unk_1F143FA78;
  v333[2] = &unk_1F1440270;
  v333[3] = &unk_1F1440270;
  v332[4] = &unk_1F143FEC8;
  v332[5] = &unk_1F143FF10;
  v333[4] = &unk_1F1440270;
  v333[5] = &unk_1F1440270;
  v332[6] = &unk_1F143FF58;
  v332[7] = &unk_1F143FF70;
  v333[6] = &unk_1F1440270;
  v333[7] = &unk_1F1440270;
  v332[8] = &unk_1F143FFA0;
  v332[9] = &unk_1F143FFB8;
  v333[8] = &unk_1F1440270;
  v333[9] = &unk_1F1440270;
  v332[10] = &unk_1F143FFE8;
  v332[11] = &unk_1F1440000;
  v333[10] = &unk_1F1440270;
  v333[11] = &unk_1F1440270;
  v332[12] = &unk_1F143FAD8;
  v332[13] = &unk_1F143FB20;
  v333[12] = &unk_1F1440270;
  v333[13] = &unk_1F1440270;
  v332[14] = &unk_1F1440030;
  v332[15] = &unk_1F143FBB0;
  v333[14] = &unk_1F1440270;
  v333[15] = &unk_1F1440270;
  v332[16] = &unk_1F143FBF8;
  v332[17] = &unk_1F143FC70;
  v333[16] = &unk_1F1440270;
  v333[17] = &unk_1F1440270;
  v332[18] = &unk_1F143FD00;
  v332[19] = &unk_1F143FDD8;
  v333[18] = &unk_1F1440270;
  v333[19] = &unk_1F1440270;
  v243 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v333 forKeys:v332 count:20];
  v493 = v243;
  v422[84] = @"faceSizeRatioInFocus";
  v494 = &unk_1F1440638;
  v422[85] = @"stageLightStateMachineIntensityIncrement";
  v495 = &unk_1F1440658;
  v422[86] = @"stageLightStageMachineMaxOrientationDifference";
  v496 = &unk_1F1440A48;
  v422[87] = @"sdofStateMachineIntensityIncrement";
  v497 = &unk_1F1440658;
  v422[88] = @"sdofStateMachineMaxOrientationDifference";
  v498 = &unk_1F1440A48;
  v422[89] = @"stableBackgroundDisparitySumVariance";
  v330[0] = &unk_1F143F9D0;
  v330[1] = &unk_1F143FE80;
  v331[0] = &unk_1F1440A58;
  v331[1] = &unk_1F14409B8;
  v330[2] = &unk_1F143FA30;
  v330[3] = &unk_1F143FA78;
  v331[2] = &unk_1F14409B8;
  v331[3] = &unk_1F14409B8;
  v330[4] = &unk_1F143FEC8;
  v330[5] = &unk_1F143FF10;
  v331[4] = &unk_1F14409B8;
  v331[5] = &unk_1F14409B8;
  v330[6] = &unk_1F143FF58;
  v330[7] = &unk_1F143FF70;
  v331[6] = &unk_1F14409B8;
  v331[7] = &unk_1F14409B8;
  v330[8] = &unk_1F143FFA0;
  v330[9] = &unk_1F143FFB8;
  v331[8] = &unk_1F14409B8;
  v331[9] = &unk_1F14409B8;
  v330[10] = &unk_1F143FFE8;
  v330[11] = &unk_1F1440000;
  v331[10] = &unk_1F14409B8;
  v331[11] = &unk_1F14409B8;
  v330[12] = &unk_1F143FAD8;
  v330[13] = &unk_1F143FB20;
  v331[12] = &unk_1F14409B8;
  v331[13] = &unk_1F14409B8;
  v330[14] = &unk_1F143FBB0;
  v330[15] = &unk_1F143FBF8;
  v331[14] = &unk_1F14409B8;
  v331[15] = &unk_1F14409B8;
  v330[16] = &unk_1F143FC70;
  v330[17] = &unk_1F143FD00;
  v331[16] = &unk_1F14409B8;
  v331[17] = &unk_1F14409B8;
  v330[18] = &unk_1F143FDD8;
  v331[18] = &unk_1F14409B8;
  v242 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v331 forKeys:v330 count:19];
  v499 = v242;
  v422[90] = @"unstableBackgroundDisparitySumVariance";
  v328[0] = &unk_1F143F9D0;
  v328[1] = &unk_1F143FE80;
  v329[0] = &unk_1F14409B8;
  v329[1] = &unk_1F1440A38;
  v328[2] = &unk_1F143FA30;
  v328[3] = &unk_1F143FA78;
  v329[2] = &unk_1F1440A38;
  v329[3] = &unk_1F1440A38;
  v328[4] = &unk_1F143FEC8;
  v328[5] = &unk_1F143FF10;
  v329[4] = &unk_1F1440A38;
  v329[5] = &unk_1F1440A38;
  v328[6] = &unk_1F143FF58;
  v328[7] = &unk_1F143FF70;
  v329[6] = &unk_1F1440A38;
  v329[7] = &unk_1F1440A38;
  v328[8] = &unk_1F143FFA0;
  v328[9] = &unk_1F143FFB8;
  v329[8] = &unk_1F1440A38;
  v329[9] = &unk_1F1440A38;
  v328[10] = &unk_1F143FFE8;
  v328[11] = &unk_1F1440000;
  v329[10] = &unk_1F1440A38;
  v329[11] = &unk_1F1440A38;
  v328[12] = &unk_1F143FAD8;
  v328[13] = &unk_1F143FB20;
  v329[12] = &unk_1F1440A38;
  v329[13] = &unk_1F1440A38;
  v328[14] = &unk_1F143FBB0;
  v328[15] = &unk_1F143FBF8;
  v329[14] = &unk_1F1440A38;
  v329[15] = &unk_1F1440A38;
  v328[16] = &unk_1F143FC70;
  v328[17] = &unk_1F143FD00;
  v329[16] = &unk_1F1440A38;
  v329[17] = &unk_1F1440A38;
  v328[18] = &unk_1F143FDD8;
  v329[18] = &unk_1F1440A38;
  v241 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v329 forKeys:v328 count:19];
  v500 = v241;
  v422[91] = @"stableInvalidDisparityRatio";
  v326[0] = &unk_1F143F9D0;
  v326[1] = &unk_1F143FE80;
  v327[0] = &unk_1F14408E8;
  v327[1] = &unk_1F14406B8;
  v326[2] = &unk_1F143FA30;
  v326[3] = &unk_1F143FA78;
  v327[2] = &unk_1F14406B8;
  v327[3] = &unk_1F14406B8;
  v326[4] = &unk_1F143FEC8;
  v326[5] = &unk_1F143FF10;
  v327[4] = &unk_1F14406B8;
  v327[5] = &unk_1F14406B8;
  v326[6] = &unk_1F143FF58;
  v326[7] = &unk_1F143FF70;
  v327[6] = &unk_1F14406B8;
  v327[7] = &unk_1F14406B8;
  v326[8] = &unk_1F143FFA0;
  v326[9] = &unk_1F143FFB8;
  v327[8] = &unk_1F14406B8;
  v327[9] = &unk_1F14406B8;
  v326[10] = &unk_1F143FFE8;
  v326[11] = &unk_1F1440000;
  v327[10] = &unk_1F14406B8;
  v327[11] = &unk_1F14406B8;
  v326[12] = &unk_1F143FAD8;
  v326[13] = &unk_1F143FB20;
  v327[12] = &unk_1F14406B8;
  v327[13] = &unk_1F14406B8;
  v326[14] = &unk_1F143FBB0;
  v326[15] = &unk_1F143FBF8;
  v327[14] = &unk_1F14406B8;
  v327[15] = &unk_1F14406B8;
  v326[16] = &unk_1F143FC70;
  v326[17] = &unk_1F143FD00;
  v327[16] = &unk_1F14406B8;
  v327[17] = &unk_1F14406B8;
  v326[18] = &unk_1F143FDD8;
  v327[18] = &unk_1F14406B8;
  v240 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v327 forKeys:v326 count:19];
  v501 = v240;
  v422[92] = @"unstableInvalidDisparityRatio";
  v324[0] = &unk_1F143F9D0;
  v324[1] = &unk_1F143FE80;
  v325[0] = &unk_1F14408F8;
  v325[1] = &unk_1F1440698;
  v324[2] = &unk_1F143FA30;
  v324[3] = &unk_1F143FA78;
  v325[2] = &unk_1F1440698;
  v325[3] = &unk_1F1440698;
  v324[4] = &unk_1F143FEC8;
  v324[5] = &unk_1F143FF10;
  v325[4] = &unk_1F1440698;
  v325[5] = &unk_1F1440698;
  v324[6] = &unk_1F143FF58;
  v324[7] = &unk_1F143FF70;
  v325[6] = &unk_1F1440698;
  v325[7] = &unk_1F1440698;
  v324[8] = &unk_1F143FFA0;
  v324[9] = &unk_1F143FFB8;
  v325[8] = &unk_1F1440698;
  v325[9] = &unk_1F1440698;
  v324[10] = &unk_1F143FFE8;
  v324[11] = &unk_1F1440000;
  v325[10] = &unk_1F1440698;
  v325[11] = &unk_1F1440698;
  v324[12] = &unk_1F143FAD8;
  v324[13] = &unk_1F143FB20;
  v325[12] = &unk_1F1440698;
  v325[13] = &unk_1F1440698;
  v324[14] = &unk_1F143FBB0;
  v324[15] = &unk_1F143FBF8;
  v325[14] = &unk_1F1440698;
  v325[15] = &unk_1F1440698;
  v324[16] = &unk_1F143FC70;
  v324[17] = &unk_1F143FD00;
  v325[16] = &unk_1F1440698;
  v325[17] = &unk_1F1440698;
  v324[18] = &unk_1F143FDD8;
  v325[18] = &unk_1F1440698;
  uint64_t v502 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v325 forKeys:v324 count:19];
  v422[93] = @"backgroundSeparationLikelihoodLow";
  v322[0] = &unk_1F143F9D0;
  v322[1] = &unk_1F143FE80;
  v323[0] = &unk_1F1440908;
  v323[1] = &unk_1F14406A8;
  v322[2] = &unk_1F143FA30;
  v322[3] = &unk_1F143FA78;
  v323[2] = &unk_1F14406A8;
  v323[3] = &unk_1F14406A8;
  v322[4] = &unk_1F143FEC8;
  v322[5] = &unk_1F143FF10;
  v323[4] = &unk_1F14406A8;
  v323[5] = &unk_1F14406A8;
  v322[6] = &unk_1F143FF58;
  v322[7] = &unk_1F143FF70;
  v323[6] = &unk_1F14406A8;
  v323[7] = &unk_1F14406A8;
  v322[8] = &unk_1F143FFA0;
  v322[9] = &unk_1F143FFB8;
  v323[8] = &unk_1F14406A8;
  v323[9] = &unk_1F14406A8;
  v322[10] = &unk_1F143FFE8;
  v322[11] = &unk_1F1440000;
  v323[10] = &unk_1F14406A8;
  v323[11] = &unk_1F14406A8;
  v322[12] = &unk_1F143FAD8;
  v322[13] = &unk_1F143FB20;
  v323[12] = &unk_1F14406A8;
  v323[13] = &unk_1F14406A8;
  v322[14] = &unk_1F143FBB0;
  v322[15] = &unk_1F143FBF8;
  v323[14] = &unk_1F14406A8;
  v323[15] = &unk_1F14406A8;
  v322[16] = &unk_1F143FC70;
  v322[17] = &unk_1F143FD00;
  v323[16] = &unk_1F14406A8;
  v323[17] = &unk_1F14406A8;
  v322[18] = &unk_1F143FDD8;
  v323[18] = &unk_1F14406A8;
  v239 = (void *)v502;
  v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v323 forKeys:v322 count:19];
  v503 = v42;
  v422[94] = @"backgroundSeparationLikelihoodHigh";
  v504 = &unk_1F1440668;
  v422[95] = @"depthQualityMetricFocalPlaneOffsetMeters";
  v505 = &unk_1F1440678;
  v422[96] = @"relightDisplayMode";
  v506 = &unk_1F143FE20;
  v422[97] = @"relightEffectStrength";
  v507 = &unk_1F1440638;
  v422[98] = @"portraitStyleStrengthOverride";
  v508 = &unk_1F14404E8;
  v422[99] = @"focusDistanceOverride";
  v509 = &unk_1F14404E8;
  v422[100] = @"modulateFocalRatio";
  uint64_t v510 = MEMORY[0x1E4F1CC28];
  v422[101] = @"guidedFilterWidth";
  v320[0] = &unk_1F143F9D0;
  v320[1] = &unk_1F143FDC0;
  v321[0] = &unk_1F1440018;
  v321[1] = &unk_1F1440048;
  v320[2] = &unk_1F143FDD8;
  v321[2] = &unk_1F1440048;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v321 forKeys:v320 count:3];
  v511 = v43;
  v422[102] = @"guidedFilterHeight";
  v318[0] = &unk_1F143F9D0;
  v318[1] = &unk_1F143FDC0;
  v319[0] = &unk_1F1440048;
  v319[1] = &unk_1F14402A0;
  v318[2] = &unk_1F143FDD8;
  v319[2] = &unk_1F14402A0;
  v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v319 forKeys:v318 count:3];
  v512 = v44;
  v422[103] = @"proxyToFaceEffectLerpNumFrames";
  v316 = &unk_1F143F9D0;
  v317 = &unk_1F14401E0;
  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v317 forKeys:&v316 count:1];
  v513 = v45;
  v422[104] = @"segmentationBinarizationThreshold";
  v314[0] = &unk_1F143F9D0;
  v314[1] = &unk_1F143FDA8;
  v315[0] = &unk_1F14404E8;
  v315[1] = &unk_1F1440228;
  v314[2] = &unk_1F1440030;
  v315[2] = &unk_1F1440228;
  v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v315 forKeys:v314 count:3];
  v514 = v46;
  v422[105] = @"depthErosionRadius";
  v312[0] = &unk_1F143F9D0;
  v312[1] = &unk_1F143FDA8;
  v313[0] = &unk_1F14404E8;
  v313[1] = &unk_1F14402B8;
  v312[2] = &unk_1F1440030;
  v313[2] = &unk_1F14402B8;
  v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v313 forKeys:v312 count:3];
  v515 = v47;
  id v305 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v423 forKeys:v422 count:106];

  v304[0] = &v307;
  v304[1] = &v305;
  v304[2] = &v311;
  v48 = v309;
  if (!v309)
  {
LABEL_65:
    v58 = 0;
    goto LABEL_79;
  }
  while (1)
  {
    unint64_t v49 = v48[4];
    if (v311 < v49) {
      goto LABEL_58;
    }
    if (v49 >= v311) {
      break;
    }
    ++v48;
LABEL_58:
    v48 = (void *)*v48;
    if (!v48) {
      goto LABEL_65;
    }
  }
  v303->_videoPipelineDevice = v311;
  v50 = sub_1BA831804((uint64_t)v304, @"colorPixelBufferWidth");
  v303->_colorPixelBufferWidth = (int)[v50 intValue];

  v51 = sub_1BA831804((uint64_t)v304, @"colorPixelBufferHeight");
  v303->_colorPixelBufferHeight = (int)[v51 intValue];

  v52 = [v305 objectForKeyedSubscript:@"supportedColorPixelBufferPixelFormats"];
  if (!v52)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
LABEL_71:
      v57 = 0;
      goto LABEL_78;
    }
    *(_DWORD *)buf = 138412290;
    v517 = @"supportedColorPixelBufferPixelFormats";
    v59 = MEMORY[0x1E4F14500];
    v60 = "No value for parameter %@";
    uint32_t v61 = 12;
LABEL_81:
    _os_log_error_impl(&dword_1BA813000, v59, OS_LOG_TYPE_ERROR, v60, buf, v61);
    v57 = 0;
    goto LABEL_78;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v57 = v52;
      goto LABEL_78;
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_71;
    }
    *(_WORD *)buf = 0;
    v59 = MEMORY[0x1E4F14500];
    v60 = "Unknown parameter type";
    uint32_t v61 = 2;
    goto LABEL_81;
  }
  id v53 = v52;
  v54 = [v53 objectForKeyedSubscript:&unk_1F143F9D0];
  v55 = [NSNumber numberWithUnsignedInteger:v311];
  v56 = [v53 objectForKeyedSubscript:v55];

  if (v56)
  {
    v57 = v56;
  }
  else if (v54)
  {
    v57 = v54;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v517 = @"supportedColorPixelBufferPixelFormats";
      _os_log_error_impl(&dword_1BA813000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "No value for parameter %@", buf, 0xCu);
    }
    v57 = 0;
  }

LABEL_78:
  supportedColorPixelBufferPixelFormats = v303->_supportedColorPixelBufferPixelFormats;
  v303->_supportedColorPixelBufferPixelFormats = v57;

  v63 = sub_1BA831804((uint64_t)v304, @"colorPixelBufferFocalLength_mm");
  [v63 floatValue];
  v303->_colorPixelBufferFocalLength_mm = v64;

  v65 = sub_1BA831804((uint64_t)v304, @"colorPixelBufferPixelSize_um");
  [v65 floatValue];
  v303->_colorPixelBufferPixelSize_um = v66;

  v67 = sub_1BA831804((uint64_t)v304, @"colorPixelBufferFocalRatio");
  [v67 floatValue];
  v303->_colorPixelBufferFocalRatio = v68;

  v69 = sub_1BA831804((uint64_t)v304, @"alphaMattePixelBufferWidth");
  v303->_alphaMattePixelBufferWidth = (int)[v69 intValue];

  v70 = sub_1BA831804((uint64_t)v304, @"alphaMattePixelBufferHeight");
  v303->_alphaMattePixelBufferHeight = (int)[v70 intValue];

  v71 = sub_1BA831804((uint64_t)v304, @"alphaMattePixelBufferPixelFormat");
  v303->_alphaMattePixelBufferPixelFormat = [v71 intValue];

  v72 = sub_1BA831804((uint64_t)v304, @"inputDisparityPixelBufferWidth");
  v303->_inputDisparityPixelBufferWidth = (int)[v72 intValue];

  v73 = sub_1BA831804((uint64_t)v304, @"inputDisparityPixelBufferHeight");
  v303->_inputDisparityPixelBufferHeight = (int)[v73 intValue];

  v74 = sub_1BA831804((uint64_t)v304, @"outputDisparityPixelBufferWidth");
  v303->_unint64_t outputDisparityPixelBufferWidth = (int)[v74 intValue];

  v75 = sub_1BA831804((uint64_t)v304, @"outputDisparityPixelBufferHeight");
  v303->_unint64_t outputDisparityPixelBufferHeight = (int)[v75 intValue];

  v76 = sub_1BA831804((uint64_t)v304, @"outputDisparityOffset");
  [v76 floatValue];
  v303->_outputDisparityOffset = v77;

  v78 = sub_1BA831804((uint64_t)v304, @"inputToOutputDisparityPixelBufferRotation");
  v303->_unint64_t inputToOutputDisparityPixelBufferRotation = (int)[v78 intValue];

  v79 = sub_1BA831804((uint64_t)v304, @"sceneMonitorUsesDisparityStatistics");
  v303->_sceneMonitorUsesDisparityStatistics = [v79 BOOLValue];

  v80 = sub_1BA831804((uint64_t)v304, @"inputDisparityPixelBufferPixelFormat");
  v303->_inputDisparityPixelBufferPixelFormat = [v80 intValue];

  v81 = sub_1BA831804((uint64_t)v304, @"outputDisparityPixelBufferPixelFormat");
  v303->_outputDisparityPixelBufferPixelFormat = [v81 intValue];

  uint64_t v82 = [v305 objectForKeyedSubscript:@"supportedInputSegmentationPixelBufferPixelFormats"];
  supportedInputSegmentationPixelBufferPixelFormats = v303->_supportedInputSegmentationPixelBufferPixelFormats;
  v303->_supportedInputSegmentationPixelBufferPixelFormats = (NSArray *)v82;

  v84 = sub_1BA831804((uint64_t)v304, @"depthPixelBufferXPadding");
  v303->_unint64_t depthPixelBufferXPadding = [v84 intValue];

  v85 = sub_1BA831804((uint64_t)v304, @"depthPixelBufferYPadding");
  v303->_unint64_t depthPixelBufferYPadding = [v85 intValue];

  v86 = sub_1BA831804((uint64_t)v304, @"depthPixelBufferXReplication");
  v303->_unint64_t depthPixelBufferXReplication = [v86 intValue];

  v87 = sub_1BA831804((uint64_t)v304, @"depthPixelBufferYReplication");
  v303->_unint64_t depthPixelBufferYReplication = [v87 intValue];

  v88 = sub_1BA831804((uint64_t)v304, @"depthPixelBufferScale");
  [v88 floatValue];
  v303->_depthPixelBufferScale = v89;

  v90 = sub_1BA831804((uint64_t)v304, @"depthPixelBufferOffset");
  [v90 floatValue];
  v303->_depthPixelBufferOffset = v91;

  v92 = sub_1BA831804((uint64_t)v304, @"disparityStereoFocalLengthPixels");
  [v92 floatValue];
  v303->_disparityStereoFocalLengthPixels = v93;

  v94 = sub_1BA831804((uint64_t)v304, @"disparityStereoBaselineMeters");
  [v94 floatValue];
  v303->_disparityStereoBaselineMeters = v95;

  v96 = sub_1BA831804((uint64_t)v304, @"canSkipDisparityHoleFillingAndTemporalRejection");
  v303->_canSkipDisparityHoleFillingAndTemporalRejection = [v96 BOOLValue];

  v97 = sub_1BA831804((uint64_t)v304, @"supportsForegroundBlur");
  v303->_supportsForegroundBlur = [v97 BOOLValue];

  v98 = sub_1BA831804((uint64_t)v304, @"depthPixelBufferMaxLeftOcclusionDisparityChange");
  [v98 floatValue];
  v303->_depthPixelBufferMaxLeftOcclusionDisparityChange = v99;

  v100 = sub_1BA831804((uint64_t)v304, @"depthPixelBufferMaxRightOcclusionDisparityChange");
  [v100 floatValue];
  v303->_depthPixelBufferMaxRightOcclusionDisparityChange = v101;

  v102 = sub_1BA831804((uint64_t)v304, @"backgroundDisparityUpdateRate");
  [v102 floatValue];
  v303->_backgroundDisparityUpdateRate = v103;

  v104 = sub_1BA831804((uint64_t)v304, @"invalidDisparityRatioUpdateRate");
  [v104 floatValue];
  v303->_invalidDisparityRatioUpdateRate = v105;

  v106 = sub_1BA831804((uint64_t)v304, @"backgroundDisparityStatsWindowSize");
  v303->_backgroundDisparityStatsWindowSize = [v106 intValue];

  v107 = sub_1BA831804((uint64_t)v304, @"invalidDisparityRatioStatsWindowSize");
  v303->_invalidDisparityRatioStatsWindowSize = [v107 intValue];

  v108 = sub_1BA831804((uint64_t)v304, @"minDeltaCanonicalDisparity");
  [v108 floatValue];
  v303->_minDeltaCanonicalDisparity = v109;

  v110 = sub_1BA831804((uint64_t)v304, @"maxDeltaCanonicalDisparity");
  [v110 floatValue];
  v303->_maxDeltaCanonicalDisparity = v111;

  v112 = sub_1BA831804((uint64_t)v304, @"centerDeltaCanonicalDisparity");
  [v112 floatValue];
  v303->_float centerDeltaCanonicalDisparity = v113;

  v114 = sub_1BA831804((uint64_t)v304, @"dsCanonicalLowThld");
  [v114 floatValue];
  v303->_dsCanonicalLowThld = v115;

  v116 = sub_1BA831804((uint64_t)v304, @"dsCanonicalLowScale");
  [v116 floatValue];
  v303->_dsCanonicalLowScale = v117;

  v118 = sub_1BA831804((uint64_t)v304, @"dsCanonicalHighThld");
  [v118 floatValue];
  v303->_dsCanonicalHighThld = v119;

  v120 = sub_1BA831804((uint64_t)v304, @"linearDeltaDepthMultiplier");
  [v120 floatValue];
  v303->_linearDeltaDepthMultiplier = v121;

  v122 = sub_1BA831804((uint64_t)v304, @"linearDeltaDepthOffset");
  [v122 floatValue];
  v303->_linearDeltaDepthOffset = v123;

  v124 = sub_1BA831804((uint64_t)v304, @"dsCanonicalHighScale");
  [v124 floatValue];
  v303->_dsCanonicalHighScale = v125;

  v126 = sub_1BA831804((uint64_t)v304, @"foregroundPercentile");
  [v126 floatValue];
  v303->_foregroundPercentile = v127;

  v128 = sub_1BA831804((uint64_t)v304, @"closeDisparityPercentile");
  [v128 floatValue];
  v303->_closeDisparityPercentile = v129;

  v130 = sub_1BA831804((uint64_t)v304, @"deltaDepth");
  [v130 floatValue];
  v303->_deltaDepth = v131;

  v132 = sub_1BA831804((uint64_t)v304, @"mattingUpdateRate");
  [v132 floatValue];
  v303->_mattingUpdateRate = v133;

  v134 = sub_1BA831804((uint64_t)v304, @"mattingUpdateRateFast");
  [v134 floatValue];
  v303->_mattingUpdateRateFast = v135;

  v136 = sub_1BA831804((uint64_t)v304, @"guidedFilterUnconfidentWeight");
  [v136 floatValue];
  v303->_guidedFilterUnconfidentWeight = v137;

  v138 = sub_1BA831804((uint64_t)v304, @"guidedFilterMinDistToDeweight");
  [v138 floatValue];
  v303->_guidedFilterMinDistToDeweight = v139;

  v140 = sub_1BA831804((uint64_t)v304, @"foregroundMaskDilationRadius");
  [v140 floatValue];
  v303->_foregroundMaskDilationRadius = v141;

  v142 = sub_1BA831804((uint64_t)v304, @"infConvolutionDownsampling");
  [v142 floatValue];
  v303->_infConvolutionDownsampling = v143;

  v144 = sub_1BA831804((uint64_t)v304, @"laplacianLimitingDownsampling");
  [v144 floatValue];
  v303->_laplacianLimitingDownsampling = v145;

  v146 = sub_1BA831804((uint64_t)v304, @"laplacianLimitingBlurSize");
  [v146 floatValue];
  v303->_laplacianLimitingBlurSize = v147;

  v148 = sub_1BA831804((uint64_t)v304, @"referenceDisparity");
  [v148 floatValue];
  v303->_referenceDisparity = v149;

  v150 = sub_1BA831804((uint64_t)v304, @"deltaCanonicalDisparity");
  [v150 floatValue];
  v303->_deltaCanonicalDisparity = v151;

  v152 = sub_1BA831804((uint64_t)v304, @"alphaCoeffFilterColorStd");
  [v152 floatValue];
  v303->_alphaCoeffFilterColorStd = v153;

  v154 = sub_1BA831804((uint64_t)v304, @"alphaCoeffFilterColorStdFast");
  [v154 floatValue];
  v303->_alphaCoeffFilterColorStdFast = v155;

  v156 = sub_1BA831804((uint64_t)v304, @"alphaMaxLaplacian");
  [v156 floatValue];
  v303->_alphaMaxLaplacian = v157;

  v158 = sub_1BA831804((uint64_t)v304, @"alphaContrastExponent");
  [v158 floatValue];
  v303->_alphaContrastExponent = v159;

  v160 = sub_1BA831804((uint64_t)v304, @"alphaGammaExponent");
  [v160 floatValue];
  v303->_alphaGammaExponent = v161;

  v162 = sub_1BA831804((uint64_t)v304, @"disparityFilterColorStd");
  [v162 floatValue];
  v303->_disparityFilterColorStd = v163;

  v164 = sub_1BA831804((uint64_t)v304, @"disparityFilterUpdateRate");
  [v164 floatValue];
  v303->_disparityFilterUpdateRate = v165;

  v166 = sub_1BA831804((uint64_t)v304, @"minimumConfidenceToKeepDisparity");
  [v166 floatValue];
  v303->_minimumConfidenceToKeepDisparity = v167;

  v168 = sub_1BA831804((uint64_t)v304, @"maximumSimilarityToKeepDisparity");
  [v168 floatValue];
  v303->_maximumSimilarityToKeepDisparity = v169;

  v170 = sub_1BA831804((uint64_t)v304, @"maxDisparityFillingInconsistency");
  [v170 floatValue];
  v303->_maxDisparityFillingInconsistency = v171;

  v172 = sub_1BA831804((uint64_t)v304, @"maxDisparityFillingDistFromForeground");
  [v172 floatValue];
  v303->_maxDisparityFillingDistFromForeground = v173;

  v174 = sub_1BA831804((uint64_t)v304, @"maxDistToPushDisparityEdgesFwd");
  v303->_maxDistToPushDisparityEdgesFwd = [v174 intValue];

  v175 = sub_1BA831804((uint64_t)v304, @"maxDistToPushDisparityEdgesRev");
  v303->_maxDistToPushDisparityEdgesRev = [v175 intValue];

  v176 = sub_1BA831804((uint64_t)v304, @"disparityPushingBackgroundToForegroundDisparityDifference");
  v303->_disparityPushingBackgroundToForegroundDisparityDifference = [v176 intValue];

  v177 = sub_1BA831804((uint64_t)v304, @"renderingDisparityUpdateRate");
  [v177 floatValue];
  v303->_renderingDisparityUpdateRate = v178;

  v179 = sub_1BA831804((uint64_t)v304, @"renderingDisparityBlurRadius");
  [v179 floatValue];
  v303->_renderingDisparityBlurRadius = v180;

  v181 = sub_1BA831804((uint64_t)v304, @"offsetNoiseBitCalculation");
  [v181 floatValue];
  v303->_offsetNoiseBitCalculation = v182;

  v183 = sub_1BA831804((uint64_t)v304, @"gainMultiplierNoiseBitCalculation");
  [v183 floatValue];
  v303->_gainMultiplierNoiseBitCalculation = v184;

  v185 = sub_1BA831804((uint64_t)v304, @"luxMultiplierNoiseBitCalculation");
  [v185 floatValue];
  v303->_luxMultiplierNoiseBitCalculation = v186;

  v187 = sub_1BA831804((uint64_t)v304, @"renderingLensFocalLength");
  [v187 floatValue];
  v303->_renderingLensFocalLength = v188;

  v189 = sub_1BA831804((uint64_t)v304, @"fNumberMultiplier");
  [v189 floatValue];
  v303->_fNumberMultiplier = v190;

  v191 = sub_1BA831804((uint64_t)v304, @"focusThresholdHardness");
  [v191 floatValue];
  v303->_focusThresholdHardness = v192;

  v193 = sub_1BA831804((uint64_t)v304, @"focusUpdateRateSlow");
  [v193 floatValue];
  v303->_focusUpdateRateSlow = v194;

  v195 = sub_1BA831804((uint64_t)v304, @"focusUpdateRateFast");
  [v195 floatValue];
  v303->_focusUpdateRateFast = v196;

  v197 = sub_1BA831804((uint64_t)v304, @"maxFramesWithoutFace");
  v303->_maxFramesWithoutFace = [v197 intValue];

  v198 = sub_1BA831804((uint64_t)v304, @"faceSizeRatioInFocus");
  [v198 floatValue];
  v303->_faceSizeRatioInFocus = v199;

  v200 = sub_1BA831804((uint64_t)v304, @"stageLightStateMachineIntensityIncrement");
  [v200 floatValue];
  v303->_stageLightStateMachineIntensityIncrement = v201;

  v202 = sub_1BA831804((uint64_t)v304, @"stageLightStageMachineMaxOrientationDifference");
  [v202 doubleValue];
  v303->_stageLightStageMachineMaxOrientationDifference = v203;

  v204 = sub_1BA831804((uint64_t)v304, @"sdofStateMachineIntensityIncrement");
  [v204 floatValue];
  v303->_sdofStateMachineIntensityIncrement = v205;

  v206 = sub_1BA831804((uint64_t)v304, @"sdofStateMachineMaxOrientationDifference");
  [v206 doubleValue];
  v303->_sdofStateMachineMaxOrientationDifference = v207;

  v208 = sub_1BA831804((uint64_t)v304, @"stableBackgroundDisparitySumVariance");
  [v208 floatValue];
  v303->_stableBackgroundDisparitySumVariance = v209;

  v210 = sub_1BA831804((uint64_t)v304, @"unstableBackgroundDisparitySumVariance");
  [v210 floatValue];
  v303->_unstableBackgroundDisparitySumVariance = v211;

  v212 = sub_1BA831804((uint64_t)v304, @"stableInvalidDisparityRatio");
  [v212 floatValue];
  v303->_stableInvalidDisparityRatio = v213;

  v214 = sub_1BA831804((uint64_t)v304, @"unstableInvalidDisparityRatio");
  [v214 floatValue];
  v303->_unstableInvalidDisparityRatio = v215;

  v216 = sub_1BA831804((uint64_t)v304, @"backgroundSeparationLikelihoodLow");
  [v216 floatValue];
  v303->_backgroundSeparationLikelihoodLow = v217;

  v218 = sub_1BA831804((uint64_t)v304, @"backgroundSeparationLikelihoodHigh");
  [v218 floatValue];
  v303->_backgroundSeparationLikelihoodHigh = v219;

  v220 = sub_1BA831804((uint64_t)v304, @"depthQualityMetricFocalPlaneOffsetMeters");
  [v220 floatValue];
  v303->_depthQualityMetricFocalPlaneOffsetMeters = v221;

  v222 = sub_1BA831804((uint64_t)v304, @"relightDisplayMode");
  v303->_relightDisplayMode = [v222 intValue];

  v223 = sub_1BA831804((uint64_t)v304, @"relightEffectStrength");
  [v223 floatValue];
  v303->_relightEffectStrength = v224;

  v225 = sub_1BA831804((uint64_t)v304, @"portraitStyleStrengthOverride");
  [v225 floatValue];
  v303->_portraitStyleStrengthOverride = v226;

  v227 = sub_1BA831804((uint64_t)v304, @"focusDistanceOverride");
  [v227 floatValue];
  v303->_focusDistanceOverride = v228;

  v229 = sub_1BA831804((uint64_t)v304, @"modulateFocalRatio");
  v303->_modulateFocalRatio = [v229 BOOLValue];

  v230 = sub_1BA831804((uint64_t)v304, @"focusStatisticsXTileCount");
  v303->_focusStatisticsXTileCount = (int)[v230 intValue];

  v231 = sub_1BA831804((uint64_t)v304, @"focusStatisticsYTileCount");
  v303->_focusStatisticsYTileCount = (int)[v231 intValue];

  v232 = sub_1BA831804((uint64_t)v304, @"guidedFilterWidth");
  v303->_guidedFilterWidth = [v232 intValue];

  v233 = sub_1BA831804((uint64_t)v304, @"guidedFilterHeight");
  v303->_guidedFilterHeight = [v233 intValue];

  v234 = sub_1BA831804((uint64_t)v304, @"rawShiftInvalidThreshold");
  v303->_rawShiftInvalidThreshold = [v234 intValue];

  v235 = sub_1BA831804((uint64_t)v304, @"proxyToFaceEffectLerpNumFrames");
  v303->_proxyToFaceEffectLerpNumFrames = [v235 unsignedIntValue];

  v236 = sub_1BA831804((uint64_t)v304, @"segmentationBinarizationThreshold");
  v303->_segmentationBinarizationThreshold = [v236 intValue];

  v237 = sub_1BA831804((uint64_t)v304, @"depthErosionRadius");
  v303->_depthErosionRadius = [v237 intValue];

  v58 = v303;
LABEL_79:

  sub_1BA831AFC(v309);
  return v58;
}

+ (id)allSupportedYCbCrPixelFormats
{
  return &unk_1F143F808;
}

@end