@interface FigCaptureStillImageSettings
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exposureDurations;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageUserInitiatedRequestPTS;
- (BOOL)autoDeferredProcessingEnabled;
- (BOOL)autoIntelligentDistortionCorrectionEnabled;
- (BOOL)autoRedEyeReductionEnabled;
- (BOOL)autoStereoPhotoCaptureEnabled;
- (BOOL)burstQualityCaptureEnabled;
- (BOOL)bypassUpscaling;
- (BOOL)cameraCalibrationDataDeliveryEnabled;
- (BOOL)cmioHighResolutionPhotoEnabled;
- (BOOL)constantColorEnabled;
- (BOOL)constantColorFallbackPhotoDeliveryEnabled;
- (BOOL)constituentPhotoDeliveryEnabled;
- (BOOL)depthDataDeliveryEnabled;
- (BOOL)depthDataFiltered;
- (BOOL)deviceOrientationCorrectionEnabled;
- (BOOL)embedsDepthDataInImage;
- (BOOL)embedsPortraitEffectsMatteInImage;
- (BOOL)embedsSemanticSegmentationMattesInImage;
- (BOOL)isBeginMomentCaptureSettings;
- (BOOL)isClientInitiatedPrepareSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOutputFormatCompressed;
- (BOOL)isUserInitiatedRequestSettings;
- (BOOL)isZoomWithoutUpscalingEnabled;
- (BOOL)lensStabilizationDuringBracketEnabled;
- (BOOL)noiseReductionEnabled;
- (BOOL)outputMirroring;
- (BOOL)portraitEffectsMatteDeliveryEnabled;
- (BOOL)previewEnabled;
- (BOOL)previewMirroring;
- (BOOL)providesOriginalImage;
- (BOOL)rawThumbnailEnabled;
- (BOOL)smartStyleReversibilitySupported;
- (BOOL)squareCropEnabled;
- (BOOL)thumbnailEnabled;
- (FigCaptureSmartStyle)smartStyle;
- (FigCaptureStillImageSettings)initWithCoder:(id)a3;
- (FigCaptureStillImageSettings)initWithSettingsID:(int64_t)a3;
- (FigCaptureStillImageSettings)initWithSettingsID:(int64_t)a3 captureRequestIdentifier:(id)a4;
- (NSArray)bravoConstituentImageDeliveryDeviceTypes;
- (NSArray)enabledSemanticSegmentationMatteURNs;
- (NSArray)originalImageFilters;
- (NSArray)processedImageFilters;
- (NSDictionary)metadata;
- (NSDictionary)metadataForOriginalImage;
- (NSDictionary)outputPixelBufferAttributes;
- (NSDictionary)previewPixelBufferAttributes;
- (NSDictionary)spatialOverCaptureMetadata;
- (NSDictionary)spatialOverCaptureMetadataForOriginalImage;
- (NSDictionary)vtCompressionProperties;
- (NSString)captureRequestIdentifier;
- (NSString)cmioCompressedFormat;
- (NSString)deferredDepthDataFormatUniqueID;
- (NSString)deferredVideoFormatUniqueID;
- (NSString)imageGroupIdentifier;
- (double)stillImageCaptureAbsoluteStartTime;
- (float)ISOs;
- (float)exposureTargetBiases;
- (float)portraitLightingEffectStrength;
- (float)rawOutputFileCodecQuality;
- (float)scaleFactor;
- (float)simulatedAperture;
- (float)videoStabilizationOverscanCropMultiplier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)figCaptureIrisPreparedSettingsRepresentation;
- (int)HDRMode;
- (int)bracketType;
- (int)bravoImageFusionMode;
- (int)clientQualityPrioritization;
- (int)cmioMaxPhotoDimensionsHeight;
- (int)cmioMaxPhotoDimensionsWidth;
- (int)deferredSourceDeviceType;
- (int)deferredSourcePosition;
- (int)digitalFlashMode;
- (int)flashMode;
- (int)outputFileType;
- (int)outputOrientation;
- (int)payloadType;
- (int)previewOrientation;
- (int)qualityPrioritization;
- (int)rawOutputFileType;
- (int)resolutionFlavor;
- (int)settingsProvider;
- (int)wideColorMode;
- (int64_t)settingsID;
- (int64_t)stillImageCaptureStartTime;
- (int64_t)stillImageRequestTime;
- (unint64_t)hash;
- (unint64_t)stillImageUserInitiatedRequestTime;
- (unsigned)bracketImageCount;
- (unsigned)deferredPhotoFinalHeight;
- (unsigned)deferredPhotoFinalWidth;
- (unsigned)deferredPhotoProxyHeight;
- (unsigned)deferredPhotoProxyWidth;
- (unsigned)outputFormat;
- (unsigned)outputHeight;
- (unsigned)outputWidth;
- (unsigned)previewFormat;
- (unsigned)previewHeight;
- (unsigned)previewWidth;
- (unsigned)rawOutputFileBitDepth;
- (unsigned)rawOutputFileCodec;
- (unsigned)rawOutputFormat;
- (unsigned)rawThumbnailFormat;
- (unsigned)rawThumbnailHeight;
- (unsigned)rawThumbnailWidth;
- (unsigned)shutterSound;
- (unsigned)thumbnailFormat;
- (unsigned)thumbnailHeight;
- (unsigned)thumbnailWidth;
- (void)_initWithSettingsID:(void *)a3 captureRequestIdentifier:(void *)a4 imageGroupIdentifier:;
- (void)_teardownBracketStorage;
- (void)cannotProcessDepthPhotos;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAutoDeferredProcessingEnabled:(BOOL)a3;
- (void)setAutoIntelligentDistortionCorrectionEnabled:(BOOL)a3;
- (void)setAutoRedEyeReductionEnabled:(BOOL)a3;
- (void)setAutoStereoPhotoCaptureEnabled:(BOOL)a3;
- (void)setBeginMomentCaptureSettings:(BOOL)a3;
- (void)setBracketType:(int)a3 imageCount:(unsigned int)a4;
- (void)setBravoConstituentImageDeliveryDeviceTypes:(id)a3;
- (void)setBravoImageFusionMode:(int)a3;
- (void)setBurstQualityCaptureEnabled:(BOOL)a3;
- (void)setBypassUpscaling:(BOOL)a3;
- (void)setCameraCalibrationDataDeliveryEnabled:(BOOL)a3;
- (void)setClientInitiatedPrepareSettings:(BOOL)a3;
- (void)setClientQualityPrioritization:(int)a3;
- (void)setCmioCompressedFormat:(id)a3;
- (void)setCmioHighResolutionPhotoEnabled:(BOOL)a3;
- (void)setCmioMaxPhotoDimensionsHeight:(int)a3;
- (void)setCmioMaxPhotoDimensionsWidth:(int)a3;
- (void)setConstantColorEnabled:(BOOL)a3;
- (void)setConstantColorFallbackPhotoDeliveryEnabled:(BOOL)a3;
- (void)setDeferredDepthDataFormatUniqueID:(id)a3;
- (void)setDeferredPhotoFinalHeight:(unsigned int)a3;
- (void)setDeferredPhotoFinalWidth:(unsigned int)a3;
- (void)setDeferredPhotoProxyHeight:(unsigned int)a3;
- (void)setDeferredPhotoProxyWidth:(unsigned int)a3;
- (void)setDeferredSourceDeviceType:(int)a3;
- (void)setDeferredSourcePosition:(int)a3;
- (void)setDeferredVideoFormatUniqueID:(id)a3;
- (void)setDepthDataDeliveryEnabled:(BOOL)a3;
- (void)setDepthDataFiltered:(BOOL)a3;
- (void)setDeviceOrientationCorrectionEnabled:(BOOL)a3;
- (void)setDigitalFlashMode:(int)a3;
- (void)setEmbedsDepthDataInImage:(BOOL)a3;
- (void)setEmbedsPortraitEffectsMatteInImage:(BOOL)a3;
- (void)setEmbedsSemanticSegmentationMattesInImage:(BOOL)a3;
- (void)setEnabledSemanticSegmentationMatteURNs:(id)a3;
- (void)setFlashMode:(int)a3;
- (void)setHDRMode:(int)a3;
- (void)setImageGroupIdentifier:(id)a3;
- (void)setLensStabilizationDuringBracketEnabled:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setMetadataForOriginalImage:(id)a3;
- (void)setNoiseReductionEnabled:(BOOL)a3;
- (void)setOriginalImageFilters:(id)a3;
- (void)setOutputFileType:(int)a3;
- (void)setOutputFormat:(unsigned int)a3;
- (void)setOutputHeight:(unsigned int)a3;
- (void)setOutputMirroring:(BOOL)a3;
- (void)setOutputOrientation:(int)a3;
- (void)setOutputWidth:(unsigned int)a3;
- (void)setPayloadType:(int)a3;
- (void)setPortraitEffectsMatteDeliveryEnabled:(BOOL)a3;
- (void)setPortraitLightingEffectStrength:(float)a3;
- (void)setPreviewEnabled:(BOOL)a3;
- (void)setPreviewFormat:(unsigned int)a3;
- (void)setPreviewHeight:(unsigned int)a3;
- (void)setPreviewMirroring:(BOOL)a3;
- (void)setPreviewOrientation:(int)a3;
- (void)setPreviewWidth:(unsigned int)a3;
- (void)setProcessedImageFilters:(id)a3;
- (void)setProvidesOriginalImage:(BOOL)a3;
- (void)setQualityPrioritization:(int)a3;
- (void)setRawOutputFileBitDepth:(unsigned int)a3;
- (void)setRawOutputFileCodec:(unsigned int)a3;
- (void)setRawOutputFileCodecQuality:(float)a3;
- (void)setRawOutputFileType:(int)a3;
- (void)setRawOutputFormat:(unsigned int)a3;
- (void)setRawThumbnailEnabled:(BOOL)a3;
- (void)setRawThumbnailFormat:(unsigned int)a3;
- (void)setRawThumbnailHeight:(unsigned int)a3;
- (void)setRawThumbnailWidth:(unsigned int)a3;
- (void)setResolutionFlavor:(int)a3;
- (void)setScaleFactor:(float)a3;
- (void)setSettingsProvider:(int)a3;
- (void)setShutterSound:(unsigned int)a3;
- (void)setSimulatedAperture:(float)a3;
- (void)setSmartStyle:(id)a3;
- (void)setSmartStyleReversibilitySupported:(BOOL)a3;
- (void)setSpatialOverCaptureMetadata:(id)a3;
- (void)setSpatialOverCaptureMetadataForOriginalImage:(id)a3;
- (void)setSquareCropEnabled:(BOOL)a3;
- (void)setStillImageCaptureAbsoluteStartTime:(double)a3;
- (void)setStillImageCaptureStartTime:(int64_t)a3;
- (void)setStillImageRequestTime:(int64_t)a3;
- (void)setStillImageUserInitiatedRequestPTS:(id *)a3;
- (void)setStillImageUserInitiatedRequestTime:(unint64_t)a3;
- (void)setThumbnailEnabled:(BOOL)a3;
- (void)setThumbnailFormat:(unsigned int)a3;
- (void)setThumbnailHeight:(unsigned int)a3;
- (void)setThumbnailWidth:(unsigned int)a3;
- (void)setUserInitiatedRequestSettings:(BOOL)a3;
- (void)setVideoStabilizationOverscanCropMultiplier:(float)a3;
- (void)setVtCompressionProperties:(id)a3;
- (void)setWideColorMode:(int)a3;
- (void)setZoomWithoutUpscalingEnabled:(BOOL)a3;
@end

@implementation FigCaptureStillImageSettings

- (int)outputFileType
{
  return self->_outputFileType;
}

- (void)setHDRMode:(int)a3
{
  self->_HDRMode = a3;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt64:self->_settingsID forKey:@"settingsID"];
  [a3 encodeInt32:self->_payloadType forKey:@"payloadType"];
  [a3 encodeInt32:self->_settingsProvider forKey:@"settingsProvider"];
  uint64_t outputFormat = self->_outputFormat;
  if (outputFormat) {
    [a3 encodeInt32:outputFormat forKey:@"outputFormat"];
  }
  uint64_t outputFileType = self->_outputFileType;
  if (outputFileType) {
    [a3 encodeInt32:outputFileType forKey:@"outputFileType"];
  }
  uint64_t rawOutputFormat = self->_rawOutputFormat;
  if (rawOutputFormat) {
    [a3 encodeInt32:rawOutputFormat forKey:@"rawOutputFormat"];
  }
  uint64_t rawOutputFileType = self->_rawOutputFileType;
  if (rawOutputFileType) {
    [a3 encodeInt32:rawOutputFileType forKey:@"rawOutputFileType"];
  }
  uint64_t rawOutputFileBitDepth = self->_rawOutputFileBitDepth;
  if (rawOutputFileBitDepth) {
    [a3 encodeInt32:rawOutputFileBitDepth forKey:@"rawOutputFileBitDepth"];
  }
  uint64_t rawOutputFileCodec = self->_rawOutputFileCodec;
  if (rawOutputFileCodec) {
    [a3 encodeInt32:rawOutputFileCodec forKey:@"rawOutputFileCodec"];
  }
  if (self->_rawOutputFileCodecQuality != 0.0) {
    objc_msgSend(a3, "encodeFloat:forKey:", @"rawOutputFileCodecQuality");
  }
  [a3 encodeInt32:self->_outputWidth forKey:@"outputWidth"];
  [a3 encodeInt32:self->_outputHeight forKey:@"outputHeight"];
  [a3 encodeBool:self->_squareCropEnabled forKey:@"squareCropEnabled"];
  [a3 encodeBool:self->_outputMirroring forKey:@"outputMirroring"];
  [a3 encodeInt32:self->_outputOrientation forKey:@"outputOrientation"];
  [a3 encodeBool:self->_previewEnabled forKey:@"previewEnabled"];
  if (self->_previewEnabled)
  {
    [a3 encodeInt32:self->_previewFormat forKey:@"previewFormat"];
    [a3 encodeInt32:self->_previewWidth forKey:@"previewWidth"];
    [a3 encodeInt32:self->_previewHeight forKey:@"previewHeight"];
    [a3 encodeBool:self->_previewMirroring forKey:@"previewMirroring"];
    [a3 encodeInt32:self->_previewOrientation forKey:@"previewOrientation"];
  }
  [a3 encodeBool:self->_thumbnailEnabled forKey:@"thumbnailEnabled"];
  if (self->_thumbnailEnabled)
  {
    [a3 encodeInt32:self->_thumbnailFormat forKey:@"thumbnailFormat"];
    [a3 encodeInt32:self->_thumbnailWidth forKey:@"thumbnailWidth"];
    [a3 encodeInt32:self->_thumbnailHeight forKey:@"thumbnailHeight"];
  }
  [a3 encodeBool:self->_rawThumbnailEnabled forKey:@"rawThumbnailEnabled"];
  if (self->_rawThumbnailEnabled)
  {
    [a3 encodeInt32:self->_rawThumbnailFormat forKey:@"rawThumbnailFormat"];
    [a3 encodeInt32:self->_rawThumbnailWidth forKey:@"rawThumbnailWidth"];
    [a3 encodeInt32:self->_rawThumbnailHeight forKey:@"rawThumbnailHeight"];
  }
  [a3 encodeBool:self->_noiseReductionEnabled forKey:@"powerBlurEnabled"];
  [a3 encodeBool:self->_burstQualityCaptureEnabled forKey:@"burstQualityCaptureEnabled"];
  *(float *)&double v11 = self->_scaleFactor;
  [a3 encodeFloat:@"scaleFactor" forKey:v11];
  [a3 encodeBool:self->_zoomWithoutUpscalingEnabled forKey:@"zoomWithoutUpscalingEnabled"];
  [a3 encodeInt32:self->_shutterSound forKey:@"shutterSound"];
  [a3 encodeInt32:self->_flashMode forKey:@"flashMode"];
  [a3 encodeBool:self->_autoRedEyeReductionEnabled forKey:@"autoRedEyeReductionEnabled"];
  [a3 encodeInt32:self->_digitalFlashMode forKey:@"digitalFlashMode"];
  [a3 encodeBool:self->_constantColorEnabled forKey:@"constantColorEnabled"];
  [a3 encodeBool:self->_constantColorFallbackPhotoDeliveryEnabled forKey:@"constantColorFallbackPhotoDeliveryEnabled"];
  [a3 encodeBool:self->_autoStereoPhotoCaptureEnabled forKey:@"autoStereoPhotoCaptureEnabled"];
  [a3 encodeInt32:self->_wideColorMode forKey:@"wideColorMode"];
  [a3 encodeInt32:self->_HDRMode forKey:@"HDRMode"];
  if (self->_depthDataDeliveryEnabled)
  {
    [a3 encodeBool:1 forKey:@"depthDataDeliveryEnabled"];
    [a3 encodeBool:self->_embedsDepthDataInImage forKey:@"embedsDepthDataInImage"];
    [a3 encodeBool:self->_depthDataFiltered forKey:@"depthDataFiltered"];
  }
  [a3 encodeBool:self->_cameraCalibrationDataDeliveryEnabled forKey:@"cameraCalibrationDataDeliveryEnabled"];
  if (self->_portraitEffectsMatteDeliveryEnabled)
  {
    [a3 encodeBool:1 forKey:@"portraitEffectsMatteDeliveryEnabled"];
    [a3 encodeBool:self->_embedsPortraitEffectsMatteInImage forKey:@"embedsPortraitEffectsMatteInImage"];
  }
  if ([(NSArray *)self->_enabledSemanticSegmentationMatteURNs count])
  {
    [a3 encodeObject:self->_enabledSemanticSegmentationMatteURNs forKey:@"enabledSemanticSegmentationMatteURNs"];
    [a3 encodeBool:self->_embedsSemanticSegmentationMattesInImage forKey:@"embedsSemanticSegmentationMattesInImage"];
  }
  if ([(NSDictionary *)self->_metadata count]) {
    [a3 encodeObject:self->_metadata forKey:@"metadata"];
  }
  if ([(NSDictionary *)self->_metadataForOriginalImage count]) {
    [a3 encodeObject:self->_metadataForOriginalImage forKey:@"metadataForOriginalImage"];
  }
  if ([(NSArray *)self->_originalImageFilters count]) {
    [a3 encodeObject:self->_originalImageFilters forKey:@"originalImageFilters"];
  }
  if ([(NSArray *)self->_processedImageFilters count]) {
    [a3 encodeObject:self->_processedImageFilters forKey:@"processedImageFilters"];
  }
  [a3 encodeBool:self->_providesOriginalImage forKey:@"providesOriginalImage"];
  *(float *)&double v12 = self->_simulatedAperture;
  [a3 encodeFloat:@"simulatedAperture" forKey:v12];
  *(float *)&double v13 = self->_portraitLightingEffectStrength;
  [a3 encodeFloat:@"portraitLightingEffectStrength" forKey:v13];
  if ([(NSArray *)self->_bravoConstituentImageDeliveryDeviceTypes count]) {
    [a3 encodeObject:self->_bravoConstituentImageDeliveryDeviceTypes forKey:@"bravoConstituentImageDeliveryDeviceTypes"];
  }
  if ([(NSDictionary *)self->_spatialOverCaptureMetadata count]) {
    [a3 encodeObject:self->_spatialOverCaptureMetadata forKey:@"spatialOverCaptureMetadata"];
  }
  if ([(NSDictionary *)self->_spatialOverCaptureMetadataForOriginalImage count]) {
    [a3 encodeObject:self->_spatialOverCaptureMetadataForOriginalImage forKey:@"spatialOverCaptureMetadataForOriginalImage"];
  }
  [a3 encodeBool:self->_autoDeferredProcessingEnabled forKey:@"autoDeferredProcessingEnabled"];
  [a3 encodeInt32:self->_qualityPrioritization forKey:@"qualityPrioritization"];
  [a3 encodeInt32:self->_clientQualityPrioritization forKey:@"clientQualityPrioritization"];
  [a3 encodeInt32:self->_bravoImageFusionMode forKey:@"bravoImageFusionMode"];
  [a3 encodeBool:self->_autoIntelligentDistortionCorrectionEnabled forKey:@"autoIntelligentDistortionCorrectionEnabled"];
  [a3 encodeObject:self->_vtCompressionProperties forKey:@"vtCompressionProperties"];
  [a3 encodeInt32:self->_bracketType forKey:@"bracketType"];
  [a3 encodeInt32:self->_bracketImageCount forKey:@"bracketImageCount"];
  [a3 encodeBool:self->_lensStabilizationDuringBracketEnabled forKey:@"lensStabilizationDuringBracketEnabled"];
  int bracketType = self->_bracketType;
  if (bracketType == 1)
  {
    ISOs = self->_ISOs;
    if (ISOs) {
      objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", ISOs, 4 * self->_bracketImageCount), @"ISOs");
    }
    exposureDurations = self->_exposureDurations;
    if (exposureDurations)
    {
      uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:exposureDurations length:24 * self->_bracketImageCount];
      v17 = @"exposureDurations";
      goto LABEL_49;
    }
  }
  else if (bracketType == 2)
  {
    exposureTargetBiases = self->_exposureTargetBiases;
    if (exposureTargetBiases)
    {
      uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:exposureTargetBiases length:4 * self->_bracketImageCount];
      v17 = @"exposureTargetBiases";
LABEL_49:
      [a3 encodeObject:v16 forKey:v17];
    }
  }
  [a3 encodeInt64:self->_stillImageUserInitiatedRequestTime forKey:@"stillImageUserInitiatedRequestTime"];
  CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  $95D729B680665BEAEFA1D6FCA8238556 stillImageUserInitiatedRequestPTS = self->_stillImageUserInitiatedRequestPTS;
  CFDictionaryRef v21 = CMTimeCopyAsDictionary((CMTime *)&stillImageUserInitiatedRequestPTS, v20);
  [a3 encodeObject:v21 forKey:@"stillImageUserInitiatedRequestPTS"];

  [a3 encodeInt64:self->_stillImageRequestTime forKey:@"stillImageRequestTime"];
  [a3 encodeInt64:self->_stillImageCaptureStartTime forKey:@"stillImageCaptureStartTime"];
  [a3 encodeDouble:@"stillImageCaptureAbsoluteStartTime" forKey:self->_stillImageCaptureAbsoluteStartTime];
  [a3 encodeObject:self->_imageGroupIdentifier forKey:@"imageGroupIdentifier"];
  [a3 encodeObject:self->_captureRequestIdentifier forKey:@"captureRequestIdentifier"];
  [a3 encodeBool:self->_clientInitiatedPrepareSettings forKey:@"clientInitiatedPrepareSettings"];
  [a3 encodeBool:self->_userInitiatedRequestSettings forKey:@"userInitiatedRequestSettings"];
  [a3 encodeBool:self->_beginMomentCaptureSettings forKey:@"beginMomentCaptureSettings"];
  *(float *)&double v22 = self->_videoStabilizationOverscanCropMultiplier;
  [a3 encodeFloat:@"videoStabilizationOverscanCropMultiplier" forKey:v22];
  [a3 encodeInt32:self->_resolutionFlavor forKey:@"resolutionFlavor"];
  [a3 encodeInt32:self->_deferredPhotoProxyWidth forKey:@"deferredPhotoProxyWidth"];
  [a3 encodeInt32:self->_deferredPhotoProxyHeight forKey:@"deferredPhotoProxyHeight"];
  [a3 encodeInt32:self->_deferredPhotoFinalWidth forKey:@"deferredPhotoFinalWidth"];
  [a3 encodeInt32:self->_deferredPhotoFinalHeight forKey:@"deferredPhotoFinalHeight"];
  [a3 encodeInt32:self->_deferredSourceDeviceType forKey:@"deferredSourceDeviceType"];
  [a3 encodeInt32:self->_deferredSourcePosition forKey:@"deferredSourcePosition"];
  [a3 encodeObject:self->_deferredVideoFormatUniqueID forKey:@"deferredVideoFormatUniqueID"];
  [a3 encodeObject:self->_deferredDepthDataFormatUniqueID forKey:@"deferredDepthDataFormatUniqueID"];
  [a3 encodeBool:self->_bypassUpscaling forKey:@"bypassUpscaling"];
  [a3 encodeObject:self->_cmioCompressedFormat forKey:@"compressedFormat"];
  [a3 encodeBool:self->_cmioHighResolutionPhotoEnabled forKey:@"highResolutionPhotoEnabled"];
  [a3 encodeInt32:self->_cmioMaxPhotoDimensionsWidth forKey:@"maxPhotoDimensionsWidth"];
  [a3 encodeInt32:self->_cmioMaxPhotoDimensionsHeight forKey:@"maxPhotoDimensionsHeight"];
  [a3 encodeBool:self->_deviceOrientationCorrectionEnabled forKey:@"deviceOrientationCorrectionEnabled"];
  smartStyle = self->_smartStyle;
  if (smartStyle) {
    [a3 encodeObject:smartStyle forKey:@"smartStyle"];
  }
  [a3 encodeBool:self->_smartStyleReversibilitySupported forKey:@"smartStyleReversibilitySupported"];
}

- (NSString)deferredVideoFormatUniqueID
{
  return self->_deferredVideoFormatUniqueID;
}

- (NSString)deferredDepthDataFormatUniqueID
{
  return self->_deferredDepthDataFormatUniqueID;
}

- (BOOL)depthDataDeliveryEnabled
{
  return self->_depthDataDeliveryEnabled;
}

- (int)deferredSourceDeviceType
{
  return self->_deferredSourceDeviceType;
}

- (int)deferredSourcePosition
{
  return self->_deferredSourcePosition;
}

- (void)setPortraitEffectsMatteDeliveryEnabled:(BOOL)a3
{
  self->_portraitEffectsMatteDeliveryEnabled = a3;
}

- (void)setEmbedsPortraitEffectsMatteInImage:(BOOL)a3
{
  self->_embedsPortraitEffectsMatteInImage = a3;
}

- (void)setEmbedsDepthDataInImage:(BOOL)a3
{
  self->_embedsDepthDataInImage = a3;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)a3
{
  self->_depthDataDeliveryEnabled = a3;
}

- (BOOL)thumbnailEnabled
{
  return self->_thumbnailEnabled;
}

- (void)setZoomWithoutUpscalingEnabled:(BOOL)a3
{
  self->_zoomWithoutUpscalingEnabled = a3;
}

- (void)setWideColorMode:(int)a3
{
  self->_wideColorMode = a3;
}

- (void)setVtCompressionProperties:(id)a3
{
}

- (void)setThumbnailWidth:(unsigned int)a3
{
  self->_thumbnailWidth = a3;
}

- (void)setThumbnailHeight:(unsigned int)a3
{
  self->_thumbnailHeight = a3;
}

- (void)setThumbnailFormat:(unsigned int)a3
{
  self->_thumbnailFormat = a3;
}

- (void)setThumbnailEnabled:(BOOL)a3
{
  self->_thumbnailEnabled = a3;
}

- (void)setStillImageUserInitiatedRequestTime:(unint64_t)a3
{
  self->_stillImageUserInitiatedRequestTime = a3;
}

- (void)setSquareCropEnabled:(BOOL)a3
{
  self->_squareCropEnabled = a3;
}

- (void)setShutterSound:(unsigned int)a3
{
  self->_shutterSound = a3;
}

- (void)setSettingsProvider:(int)a3
{
  self->_settingsProvider = a3;
}

- (void)setScaleFactor:(float)a3
{
  self->_scaleFactor = a3;
}

- (void)setRawThumbnailEnabled:(BOOL)a3
{
  self->_rawThumbnailEnabled = a3;
}

- (void)setRawOutputFormat:(unsigned int)a3
{
  self->_uint64_t rawOutputFormat = a3;
}

- (void)setRawOutputFileType:(int)a3
{
  self->_uint64_t rawOutputFileType = a3;
}

- (void)setQualityPrioritization:(int)a3
{
  self->_qualityPrioritization = a3;
}

- (void)setProvidesOriginalImage:(BOOL)a3
{
  self->_providesOriginalImage = a3;
}

- (void)setProcessedImageFilters:(id)a3
{
}

- (void)setPreviewWidth:(unsigned int)a3
{
  self->_previewWidth = a3;
}

- (void)setPreviewOrientation:(int)a3
{
  self->_previewOrientation = a3;
}

- (void)setPreviewMirroring:(BOOL)a3
{
  self->_previewMirroring = a3;
}

- (void)setPreviewHeight:(unsigned int)a3
{
  self->_previewHeight = a3;
}

- (void)setPreviewFormat:(unsigned int)a3
{
  self->_previewFormat = a3;
}

- (void)setPreviewEnabled:(BOOL)a3
{
  self->_previewEnabled = a3;
}

- (void)setPayloadType:(int)a3
{
  self->_payloadType = a3;
}

- (void)setOutputWidth:(unsigned int)a3
{
  self->_outputWidth = a3;
}

- (void)setOutputOrientation:(int)a3
{
  self->_outputOrientation = a3;
}

- (void)setOutputMirroring:(BOOL)a3
{
  self->_outputMirroring = a3;
}

- (void)setOutputHeight:(unsigned int)a3
{
  self->_outputHeight = a3;
}

- (void)setOutputFormat:(unsigned int)a3
{
  self->_uint64_t outputFormat = a3;
}

- (void)setOutputFileType:(int)a3
{
  self->_uint64_t outputFileType = a3;
}

- (void)setOriginalImageFilters:(id)a3
{
}

- (void)setNoiseReductionEnabled:(BOOL)a3
{
  self->_noiseReductionEnabled = a3;
}

- (void)setMetadataForOriginalImage:(id)a3
{
}

- (void)setMetadata:(id)a3
{
}

- (void)setFlashMode:(int)a3
{
  self->_flashMode = a3;
}

- (void)setEnabledSemanticSegmentationMatteURNs:(id)a3
{
}

- (void)setEmbedsSemanticSegmentationMattesInImage:(BOOL)a3
{
  self->_embedsSemanticSegmentationMattesInImage = a3;
}

- (void)setDigitalFlashMode:(int)a3
{
  self->_digitalFlashMode = a3;
}

- (void)setDeviceOrientationCorrectionEnabled:(BOOL)a3
{
  self->_deviceOrientationCorrectionEnabled = a3;
}

- (void)setDepthDataFiltered:(BOOL)a3
{
  self->_depthDataFiltered = a3;
}

- (void)setDeferredVideoFormatUniqueID:(id)a3
{
}

- (void)setDeferredSourcePosition:(int)a3
{
  self->_deferredSourcePosition = a3;
}

- (void)setDeferredSourceDeviceType:(int)a3
{
  self->_deferredSourceDeviceType = a3;
}

- (void)setDeferredDepthDataFormatUniqueID:(id)a3
{
}

- (void)setConstantColorFallbackPhotoDeliveryEnabled:(BOOL)a3
{
  self->_constantColorFallbackPhotoDeliveryEnabled = a3;
}

- (void)setConstantColorEnabled:(BOOL)a3
{
  self->_constantColorEnabled = a3;
}

- (void)setClientQualityPrioritization:(int)a3
{
  self->_clientQualityPrioritization = a3;
}

- (void)setCameraCalibrationDataDeliveryEnabled:(BOOL)a3
{
  self->_cameraCalibrationDataDeliveryEnabled = a3;
}

- (void)setBurstQualityCaptureEnabled:(BOOL)a3
{
  self->_burstQualityCaptureEnabled = a3;
}

- (void)setBravoConstituentImageDeliveryDeviceTypes:(id)a3
{
}

- (void)setAutoStereoPhotoCaptureEnabled:(BOOL)a3
{
  self->_autoStereoPhotoCaptureEnabled = a3;
}

- (void)setAutoRedEyeReductionEnabled:(BOOL)a3
{
  self->_autoRedEyeReductionEnabled = a3;
}

- (void)setAutoIntelligentDistortionCorrectionEnabled:(BOOL)a3
{
  self->_autoIntelligentDistortionCorrectionEnabled = a3;
}

- (void)setAutoDeferredProcessingEnabled:(BOOL)a3
{
  self->_autoDeferredProcessingEnabled = a3;
}

- (BOOL)rawThumbnailEnabled
{
  return self->_rawThumbnailEnabled;
}

- (BOOL)providesOriginalImage
{
  return self->_providesOriginalImage;
}

- (BOOL)previewEnabled
{
  return self->_previewEnabled;
}

- (BOOL)portraitEffectsMatteDeliveryEnabled
{
  return self->_portraitEffectsMatteDeliveryEnabled;
}

- (int)outputOrientation
{
  return self->_outputOrientation;
}

- (BOOL)outputMirroring
{
  return self->_outputMirroring;
}

- (FigCaptureStillImageSettings)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeInt64ForKey:@"settingsID"];
  v6 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"captureRequestIdentifier"];
  v7 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"imageGroupIdentifier"];
  v8 = -[FigCaptureStillImageSettings _initWithSettingsID:captureRequestIdentifier:imageGroupIdentifier:](self, v5, v6, v7);
  if (v8)
  {
    *((_DWORD *)v8 + 4) = [a3 decodeInt32ForKey:@"payloadType"];
    *((_DWORD *)v8 + 5) = [a3 decodeInt32ForKey:@"settingsProvider"];
    *((_DWORD *)v8 + 6) = [a3 decodeInt32ForKey:@"outputFormat"];
    *((_DWORD *)v8 + 7) = [a3 decodeInt32ForKey:@"outputFileType"];
    *((_DWORD *)v8 + 8) = [a3 decodeInt32ForKey:@"rawOutputFormat"];
    *((_DWORD *)v8 + 9) = [a3 decodeInt32ForKey:@"rawOutputFileType"];
    *((_DWORD *)v8 + 10) = [a3 decodeInt32ForKey:@"rawOutputFileBitDepth"];
    *((_DWORD *)v8 + 11) = [a3 decodeInt32ForKey:@"rawOutputFileCodec"];
    [a3 decodeFloatForKey:@"rawOutputFileCodecQuality"];
    *((_DWORD *)v8 + 12) = v9;
    *((_DWORD *)v8 + 13) = [a3 decodeInt32ForKey:@"outputWidth"];
    *((_DWORD *)v8 + 14) = [a3 decodeInt32ForKey:@"outputHeight"];
    *((unsigned char *)v8 + 60) = [a3 decodeBoolForKey:@"squareCropEnabled"];
    *((unsigned char *)v8 + 61) = [a3 decodeBoolForKey:@"outputMirroring"];
    *((_DWORD *)v8 + 16) = [a3 decodeInt32ForKey:@"outputOrientation"];
    int v10 = [a3 decodeBoolForKey:@"previewEnabled"];
    *((unsigned char *)v8 + 68) = v10;
    if (v10)
    {
      *((_DWORD *)v8 + 18) = [a3 decodeInt32ForKey:@"previewFormat"];
      *((_DWORD *)v8 + 19) = [a3 decodeInt32ForKey:@"previewWidth"];
      *((_DWORD *)v8 + 20) = [a3 decodeInt32ForKey:@"previewHeight"];
      *((unsigned char *)v8 + 84) = [a3 decodeBoolForKey:@"previewMirroring"];
      *((_DWORD *)v8 + 22) = [a3 decodeInt32ForKey:@"previewOrientation"];
    }
    int v11 = [a3 decodeBoolForKey:@"thumbnailEnabled"];
    *((unsigned char *)v8 + 92) = v11;
    if (v11)
    {
      *((_DWORD *)v8 + 24) = [a3 decodeInt32ForKey:@"thumbnailFormat"];
      *((_DWORD *)v8 + 25) = [a3 decodeInt32ForKey:@"thumbnailWidth"];
      *((_DWORD *)v8 + 26) = [a3 decodeInt32ForKey:@"thumbnailHeight"];
    }
    int v12 = [a3 decodeBoolForKey:@"rawThumbnailEnabled"];
    *((unsigned char *)v8 + 108) = v12;
    if (v12)
    {
      *((_DWORD *)v8 + 28) = [a3 decodeInt32ForKey:@"rawThumbnailFormat"];
      *((_DWORD *)v8 + 29) = [a3 decodeInt32ForKey:@"rawThumbnailWidth"];
      *((_DWORD *)v8 + 30) = [a3 decodeInt32ForKey:@"rawThumbnailHeight"];
    }
    *((unsigned char *)v8 + 124) = [a3 decodeBoolForKey:@"powerBlurEnabled"];
    *((unsigned char *)v8 + 125) = [a3 decodeBoolForKey:@"burstQualityCaptureEnabled"];
    [a3 decodeFloatForKey:@"scaleFactor"];
    *((_DWORD *)v8 + 32) = v13;
    *((unsigned char *)v8 + 132) = [a3 decodeBoolForKey:@"zoomWithoutUpscalingEnabled"];
    *((_DWORD *)v8 + 34) = [a3 decodeInt32ForKey:@"shutterSound"];
    *((_DWORD *)v8 + 35) = [a3 decodeInt32ForKey:@"flashMode"];
    *((unsigned char *)v8 + 144) = [a3 decodeBoolForKey:@"autoRedEyeReductionEnabled"];
    *((_DWORD *)v8 + 37) = [a3 decodeInt32ForKey:@"digitalFlashMode"];
    *((unsigned char *)v8 + 152) = [a3 decodeBoolForKey:@"constantColorEnabled"];
    *((unsigned char *)v8 + 153) = [a3 decodeBoolForKey:@"constantColorFallbackPhotoDeliveryEnabled"];
    *((unsigned char *)v8 + 154) = [a3 decodeBoolForKey:@"autoStereoPhotoCaptureEnabled"];
    *((_DWORD *)v8 + 39) = [a3 decodeInt32ForKey:@"wideColorMode"];
    *((_DWORD *)v8 + 40) = [a3 decodeInt32ForKey:@"HDRMode"];
    int v14 = [a3 decodeBoolForKey:@"depthDataDeliveryEnabled"];
    *((unsigned char *)v8 + 164) = v14;
    if (v14)
    {
      *((unsigned char *)v8 + 165) = [a3 decodeBoolForKey:@"embedsDepthDataInImage"];
      *((unsigned char *)v8 + 166) = [a3 decodeBoolForKey:@"depthDataFiltered"];
    }
    *((unsigned char *)v8 + 167) = [a3 decodeBoolForKey:@"cameraCalibrationDataDeliveryEnabled"];
    int v15 = [a3 decodeBoolForKey:@"portraitEffectsMatteDeliveryEnabled"];
    *((unsigned char *)v8 + 168) = v15;
    if (v15) {
      *((unsigned char *)v8 + 169) = [a3 decodeBoolForKey:@"embedsPortraitEffectsMatteInImage"];
    }
    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    id v18 = (id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0), @"enabledSemanticSegmentationMatteURNs");
    v8[22] = v18;
    if ([v18 count]) {
      *((unsigned char *)v8 + 184) = [a3 decodeBoolForKey:@"embedsSemanticSegmentationMattesInImage"];
    }
    v8[24] = objc_msgSend((id)objc_msgSend(a3, "decodePropertyListForKey:", @"metadata"), "copy");
    v8[25] = objc_msgSend((id)objc_msgSend(a3, "decodePropertyListForKey:", @"metadataForOriginalImage"), "copy");
    id v19 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v20 = objc_opt_class();
    CFDictionaryRef v21 = objc_msgSend(v19, "initWithObjects:", v20, objc_opt_class(), 0);
    v8[26] = (id)[a3 decodeObjectOfClasses:v21 forKey:@"originalImageFilters"];
    v8[27] = (id)[a3 decodeObjectOfClasses:v21 forKey:@"processedImageFilters"];

    [a3 decodeFloatForKey:@"simulatedAperture"];
    *((_DWORD *)v8 + 56) = v22;
    if ([a3 containsValueForKey:@"portraitLightingEffectStrength"])
    {
      [a3 decodeFloatForKey:@"portraitLightingEffectStrength"];
      *((_DWORD *)v8 + 57) = v23;
    }
    *((unsigned char *)v8 + 232) = [a3 decodeBoolForKey:@"providesOriginalImage"];
    v8[30] = objc_msgSend((id)objc_msgSend(a3, "decodePropertyListForKey:", @"bravoConstituentImageDeliveryDeviceTypes"), "copy");
    v8[31] = objc_msgSend((id)objc_msgSend(a3, "decodePropertyListForKey:", @"spatialOverCaptureMetadata"), "copy");
    v8[32] = objc_msgSend((id)objc_msgSend(a3, "decodePropertyListForKey:", @"spatialOverCaptureMetadataForOriginalImage"), "copy");
    *((unsigned char *)v8 + 264) = [a3 decodeBoolForKey:@"autoDeferredProcessingEnabled"];
    *((_DWORD *)v8 + 67) = [a3 decodeInt32ForKey:@"qualityPrioritization"];
    *((_DWORD *)v8 + 68) = [a3 decodeInt32ForKey:@"clientQualityPrioritization"];
    *((_DWORD *)v8 + 69) = [a3 decodeInt32ForKey:@"bravoImageFusionMode"];
    *((unsigned char *)v8 + 280) = [a3 decodeBoolForKey:@"autoIntelligentDistortionCorrectionEnabled"];
    v8[36] = objc_msgSend((id)objc_msgSend(a3, "decodePropertyListForKey:", @"vtCompressionProperties"), "copy");
    *((_DWORD *)v8 + 74) = [a3 decodeInt32ForKey:@"bracketType"];
    if ((int)[a3 decodeInt32ForKey:@"bracketImageCount"] > 7) {
      int v24 = 8;
    }
    else {
      int v24 = [a3 decodeInt32ForKey:@"bracketImageCount"];
    }
    *((_DWORD *)v8 + 75) = v24;
    *((unsigned char *)v8 + 304) = [a3 decodeBoolForKey:@"lensStabilizationDuringBracketEnabled"];
    int v25 = *((_DWORD *)v8 + 74);
    if (v25 == 1)
    {
      v8[40] = malloc_type_calloc(*((unsigned int *)v8 + 75), 4uLL, 0x100004052888210uLL);
      objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"ISOs"), "getBytes:length:", v8[40], 4 * *((unsigned int *)v8 + 75));
      v8[39] = malloc_type_calloc(*((unsigned int *)v8 + 75), 0x18uLL, 0x1000040504FFAC1uLL);
      v26 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"exposureDurations"];
      uint64_t v27 = v8[39];
      uint64_t v28 = 24 * *((unsigned int *)v8 + 75);
    }
    else
    {
      if (v25 != 2)
      {
LABEL_24:
        v8[42] = [a3 decodeInt64ForKey:@"stillImageUserInitiatedRequestTime"];
        v29 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v30 = objc_opt_class();
        uint64_t v31 = objc_opt_class();
        CFDictionaryRef v32 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0), @"stillImageUserInitiatedRequestPTS");
        CMTimeMakeFromDictionary(&v36, v32);
        *(CMTime *)(v8 + 43) = v36;
        v8[46] = [a3 decodeInt64ForKey:@"stillImageRequestTime"];
        v8[47] = [a3 decodeInt64ForKey:@"stillImageCaptureStartTime"];
        [a3 decodeDoubleForKey:@"stillImageCaptureAbsoluteStartTime"];
        v8[48] = v33;
        *((unsigned char *)v8 + 408) = [a3 decodeBoolForKey:@"clientInitiatedPrepareSettings"];
        *((unsigned char *)v8 + 409) = [a3 decodeBoolForKey:@"userInitiatedRequestSettings"];
        *((unsigned char *)v8 + 410) = [a3 decodeBoolForKey:@"beginMomentCaptureSettings"];
        [a3 decodeFloatForKey:@"videoStabilizationOverscanCropMultiplier"];
        *((_DWORD *)v8 + 103) = v34;
        *((_DWORD *)v8 + 104) = [a3 decodeInt32ForKey:@"resolutionFlavor"];
        *((_DWORD *)v8 + 105) = [a3 decodeInt32ForKey:@"deferredPhotoProxyWidth"];
        *((_DWORD *)v8 + 106) = [a3 decodeInt32ForKey:@"deferredPhotoProxyHeight"];
        *((_DWORD *)v8 + 107) = [a3 decodeInt32ForKey:@"deferredPhotoFinalWidth"];
        *((_DWORD *)v8 + 108) = [a3 decodeInt32ForKey:@"deferredPhotoFinalHeight"];
        *((_DWORD *)v8 + 109) = [a3 decodeInt32ForKey:@"deferredSourceDeviceType"];
        *((_DWORD *)v8 + 110) = [a3 decodeInt32ForKey:@"deferredSourcePosition"];
        v8[56] = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"deferredVideoFormatUniqueID"), "copy");
        v8[57] = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"deferredDepthDataFormatUniqueID"), "copy");
        *((unsigned char *)v8 + 464) = [a3 decodeBoolForKey:@"bypassUpscaling"];
        v8[59] = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"compressedFormat"), "copy");
        *((unsigned char *)v8 + 480) = [a3 decodeBoolForKey:@"highResolutionPhotoEnabled"];
        *((_DWORD *)v8 + 121) = [a3 decodeInt32ForKey:@"maxPhotoDimensionsWidth"];
        *((_DWORD *)v8 + 122) = [a3 decodeInt32ForKey:@"maxPhotoDimensionsHeight"];
        *((unsigned char *)v8 + 492) = [a3 decodeBoolForKey:@"deviceOrientationCorrectionEnabled"];
        v8[62] = (id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"smartStyle"];
        *((unsigned char *)v8 + 504) = [a3 decodeBoolForKey:@"smartStyleReversibilitySupported"];
        return (FigCaptureStillImageSettings *)v8;
      }
      v8[41] = malloc_type_calloc(*((unsigned int *)v8 + 75), 4uLL, 0x100004052888210uLL);
      v26 = (void *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"exposureTargetBiases"];
      uint64_t v27 = v8[41];
      uint64_t v28 = 4 * *((unsigned int *)v8 + 75);
    }
    [v26 getBytes:v27 length:v28];
    goto LABEL_24;
  }
  return (FigCaptureStillImageSettings *)v8;
}

- (void)_initWithSettingsID:(void *)a3 captureRequestIdentifier:(void *)a4 imageGroupIdentifier:
{
  if (!a1) {
    return 0;
  }
  v10.receiver = a1;
  v10.super_class = (Class)FigCaptureStillImageSettings;
  v7 = objc_msgSendSuper2(&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7[1] = a2;
    v7[50] = [a3 copy];
    v8[49] = [a4 copy];
    *((_DWORD *)v8 + 57) = 2143289344;
  }
  return v8;
}

- (void)setStillImageUserInitiatedRequestPTS:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_stillImageUserInitiatedRequestPTS.epoch = a3->var3;
  *(_OWORD *)&self->_stillImageUserInitiatedRequestPTS.value = v3;
}

- (unsigned)outputWidth
{
  return self->_outputWidth;
}

- (unsigned)outputHeight
{
  return self->_outputHeight;
}

- (int)resolutionFlavor
{
  return self->_resolutionFlavor;
}

- (NSArray)enabledSemanticSegmentationMatteURNs
{
  return self->_enabledSemanticSegmentationMatteURNs;
}

- (unsigned)deferredPhotoFinalWidth
{
  return self->_deferredPhotoFinalWidth;
}

- (unsigned)deferredPhotoFinalHeight
{
  return self->_deferredPhotoFinalHeight;
}

- (FigCaptureStillImageSettings)initWithSettingsID:(int64_t)a3 captureRequestIdentifier:(id)a4
{
  if (!(id)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:a4]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Invalid capture request identifier. Not a UUID string" userInfo:0]);
  }
  return (FigCaptureStillImageSettings *)-[FigCaptureStillImageSettings _initWithSettingsID:captureRequestIdentifier:imageGroupIdentifier:](self, a3, a4, 0);
}

- (void)dealloc
{
  -[FigCaptureStillImageSettings _teardownBracketStorage]((void **)&self->super.isa);
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageSettings;
  [(FigCaptureStillImageSettings *)&v3 dealloc];
}

- (void)_teardownBracketStorage
{
  if (a1)
  {
    free(a1[39]);
    a1[39] = 0;
    free(a1[40]);
    a1[40] = 0;
    free(a1[41]);
    a1[41] = 0;
  }
}

- (id)description
{
  unsigned int v3 = bswap32(self->_outputFormat);
  unsigned int v90 = bswap32(self->_outputFileType);
  v91[0] = v3;
  unsigned int rawOutputFormat = self->_rawOutputFormat;
  unsigned int v88 = bswap32(self->_rawOutputFileType);
  unsigned int v89 = bswap32(rawOutputFormat);
  unsigned int v5 = bswap32(self->_previewFormat);
  unsigned int v86 = bswap32(self->_thumbnailFormat);
  unsigned int v87 = v5;
  unsigned int v85 = bswap32(self->_rawThumbnailFormat);
  if (rawOutputFormat) {
    v84 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" RAW:'%.4s'('%.4s')", &v89, &v88);
  }
  else {
    v84 = &stru_1EFA403E0;
  }
  if (self->_previewEnabled) {
    v83 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" PREV:'%.4s'@%dx%d", &v87, self->_previewWidth, self->_previewHeight);
  }
  else {
    v83 = &stru_1EFA403E0;
  }
  if (self->_thumbnailEnabled) {
    v82 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" THUMB:'%.4s'@%dx%d", &v86, self->_thumbnailWidth, self->_thumbnailHeight);
  }
  else {
    v82 = &stru_1EFA403E0;
  }
  if (self->_rawThumbnailEnabled) {
    v81 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" RAWTHUMB:'%.4s'@%dx%d", &v85, self->_rawThumbnailWidth, self->_rawThumbnailHeight);
  }
  else {
    v81 = &stru_1EFA403E0;
  }
  BOOL noiseReductionEnabled = self->_noiseReductionEnabled;
  BOOL burstQualityCaptureEnabled = self->_burstQualityCaptureEnabled;
  BOOL outputMirroring = self->_outputMirroring;
  BOOL squareCropEnabled = self->_squareCropEnabled;
  float scaleFactor = self->_scaleFactor;
  if (scaleFactor == 1.0) {
    v80 = &stru_1EFA403E0;
  }
  else {
    v80 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" x%.3f", scaleFactor);
  }
  BOOL zoomWithoutUpscalingEnabled = self->_zoomWithoutUpscalingEnabled;
  if (self->_flashMode) {
    v79 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" FLASH:%d", self->_flashMode);
  }
  else {
    v79 = &stru_1EFA403E0;
  }
  if (self->_autoRedEyeReductionEnabled) {
    v75 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" RE:%d", 1);
  }
  else {
    v75 = &stru_1EFA403E0;
  }
  if (self->_digitalFlashMode) {
    v74 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" DIGITALFLASH:%d", self->_digitalFlashMode);
  }
  else {
    v74 = &stru_1EFA403E0;
  }
  v7 = &stru_1EFA403E0;
  if (self->_constantColorEnabled)
  {
    if (self->_constantColorFallbackPhotoDeliveryEnabled) {
      v8 = @"(fallback:1)";
    }
    else {
      v8 = &stru_1EFA403E0;
    }
    v7 = (__CFString *)[NSString stringWithFormat:@" ConstantColor:1%@", v8];
  }
  v71 = v7;
  BOOL autoStereoPhotoCaptureEnabled = self->_autoStereoPhotoCaptureEnabled;
  if (self->_wideColorMode) {
    v70 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" WC:%d", self->_wideColorMode);
  }
  else {
    v70 = &stru_1EFA403E0;
  }
  int qualityPrioritization = self->_qualityPrioritization;
  int clientQualityPrioritization = self->_clientQualityPrioritization;
  if (self->_HDRMode) {
    v69 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" HDR:%d", self->_HDRMode);
  }
  else {
    v69 = &stru_1EFA403E0;
  }
  BOOL depthDataDeliveryEnabled = self->_depthDataDeliveryEnabled;
  BOOL embedsDepthDataInImage = self->_embedsDepthDataInImage;
  BOOL depthDataFiltered = self->_depthDataFiltered;
  BOOL portraitEffectsMatteDeliveryEnabled = self->_portraitEffectsMatteDeliveryEnabled;
  BOOL embedsPortraitEffectsMatteInImage = self->_embedsPortraitEffectsMatteInImage;
  if ([(NSArray *)self->_enabledSemanticSegmentationMatteURNs count])
  {
    enabledSemanticSegmentationMatteURNs = self->_enabledSemanticSegmentationMatteURNs;
    int v13 = (__CFString *)[MEMORY[0x1E4F28E78] stringWithFormat:@" MatteTypes:{"];
    if ([(NSArray *)enabledSemanticSegmentationMatteURNs containsObject:*MEMORY[0x1E4F55FC8]]) {
      [(__CFString *)v13 appendString:@"hair,"];
    }
    if ([(NSArray *)enabledSemanticSegmentationMatteURNs containsObject:*MEMORY[0x1E4F55FD0]]) {
      [(__CFString *)v13 appendString:@"skin,"];
    }
    if ([(NSArray *)enabledSemanticSegmentationMatteURNs containsObject:*MEMORY[0x1E4F55FE0]]) {
      [(__CFString *)v13 appendString:@"teeth,"];
    }
    if ([(NSArray *)enabledSemanticSegmentationMatteURNs containsObject:*MEMORY[0x1E4F55FC0]]) {
      [(__CFString *)v13 appendString:@"glasses,"];
    }
    -[__CFString deleteCharactersInRange:](v13, "deleteCharactersInRange:", [(__CFString *)v13 length] - 1, 1);
    [(__CFString *)v13 appendString:@"}"];
  }
  else
  {
    int v13 = &stru_1EFA403E0;
  }
  BOOL embedsSemanticSegmentationMattesInImage = self->_embedsSemanticSegmentationMattesInImage;
  uint64_t v59 = [NSString stringWithFormat:@" SAP: %.2f", self->_simulatedAperture];
  uint64_t v58 = [NSString stringWithFormat:@" PLES: %.2f", self->_portraitLightingEffectStrength];
  BOOL cameraCalibrationDataDeliveryEnabled = self->_cameraCalibrationDataDeliveryEnabled;
  BOOL providesOriginalImage = self->_providesOriginalImage;
  originalImageFilters = self->_originalImageFilters;
  if (originalImageFilters) {
    v57 = (__CFString *)[NSString stringWithFormat:@" OFILTERS:[%@]", BWCIFilterArrayDescription(originalImageFilters)];
  }
  else {
    v57 = &stru_1EFA403E0;
  }
  processedImageFilters = self->_processedImageFilters;
  if (processedImageFilters) {
    v54 = (__CFString *)[NSString stringWithFormat:@" PFILTERS:[%@]", BWCIFilterArrayDescription(processedImageFilters)];
  }
  else {
    v54 = &stru_1EFA403E0;
  }
  if (self->_bravoImageFusionMode) {
    v51 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" BIF:%d", self->_bravoImageFusionMode);
  }
  else {
    v51 = &stru_1EFA403E0;
  }
  if ([(NSArray *)self->_bravoConstituentImageDeliveryDeviceTypes count]) {
    v48 = (__CFString *)_shortStringForFigCaptureSourceDeviceTypes(self->_bravoConstituentImageDeliveryDeviceTypes);
  }
  else {
    v48 = &stru_1EFA403E0;
  }
  BOOL autoIntelligentDistortionCorrectionEnabled = self->_autoIntelligentDistortionCorrectionEnabled;
  BOOL autoDeferredProcessingEnabled = self->_autoDeferredProcessingEnabled;
  if (self->_deferredPhotoProxyWidth) {
    v47 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" PROXY:%dx%d", self->_deferredPhotoProxyWidth, self->_deferredPhotoProxyHeight);
  }
  else {
    v47 = &stru_1EFA403E0;
  }
  uint64_t bracketType = self->_bracketType;
  if (bracketType) {
    v46 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" BRCK:%dx%d LS:%d", bracketType, self->_bracketImageCount, self->_lensStabilizationDuringBracketEnabled);
  }
  else {
    v46 = &stru_1EFA403E0;
  }
  uint64_t resolutionFlavor = self->_resolutionFlavor;
  uint64_t v20 = &stru_1EFA403E0;
  v67 = v13;
  if (resolutionFlavor) {
    v44 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" flavor:%d", resolutionFlavor);
  }
  else {
    v44 = &stru_1EFA403E0;
  }
  CFDictionaryRef v21 = @" CP:balanced";
  if (clientQualityPrioritization == 3) {
    CFDictionaryRef v21 = @" CP:quality";
  }
  if (clientQualityPrioritization == 1) {
    int v22 = @" CP:speed";
  }
  else {
    int v22 = v21;
  }
  int v23 = @" P:quality";
  if (qualityPrioritization != 3) {
    int v23 = @" P:balanced";
  }
  if (qualityPrioritization == 1) {
    int v23 = @" P:speed";
  }
  v45 = v23;
  if (autoDeferredProcessingEnabled) {
    int v24 = @" autoDeferredProcessing:1";
  }
  else {
    int v24 = &stru_1EFA403E0;
  }
  int v25 = @" autoIDC:1";
  if (!autoIntelligentDistortionCorrectionEnabled) {
    int v25 = &stru_1EFA403E0;
  }
  v42 = v25;
  v43 = v24;
  if (providesOriginalImage) {
    v26 = @" Orig:1";
  }
  else {
    v26 = &stru_1EFA403E0;
  }
  v50 = v26;
  uint64_t v27 = @" CameraCalibration:1";
  if (!cameraCalibrationDataDeliveryEnabled) {
    uint64_t v27 = &stru_1EFA403E0;
  }
  v53 = v27;
  uint64_t v28 = @" EmbedsSegmentationMattes:0";
  if (embedsSemanticSegmentationMattesInImage) {
    uint64_t v28 = &stru_1EFA403E0;
  }
  v56 = v28;
  if (embedsPortraitEffectsMatteInImage) {
    v29 = &stru_1EFA403E0;
  }
  else {
    v29 = @" EmbedsPortraitMatte:0";
  }
  v61 = v29;
  uint64_t v30 = @" PortraitMatte:1";
  if (!portraitEffectsMatteDeliveryEnabled) {
    uint64_t v30 = &stru_1EFA403E0;
  }
  v64 = v30;
  if (depthDataFiltered) {
    uint64_t v31 = &stru_1EFA403E0;
  }
  else {
    uint64_t v31 = @" DepthFiltered:0";
  }
  if (embedsDepthDataInImage) {
    CFDictionaryRef v32 = &stru_1EFA403E0;
  }
  else {
    CFDictionaryRef v32 = @" EmbedsDepth:0";
  }
  if (depthDataDeliveryEnabled) {
    uint64_t v33 = @" DEPTH:1";
  }
  else {
    uint64_t v33 = &stru_1EFA403E0;
  }
  if (autoStereoPhotoCaptureEnabled) {
    int v34 = @" stereoPhotoCapture:1";
  }
  else {
    int v34 = &stru_1EFA403E0;
  }
  if (zoomWithoutUpscalingEnabled) {
    v35 = @" ZoomNoUpscale:1";
  }
  else {
    v35 = &stru_1EFA403E0;
  }
  v73 = v35;
  if (squareCropEnabled) {
    CMTime v36 = @" SQ:1";
  }
  else {
    CMTime v36 = &stru_1EFA403E0;
  }
  v37 = @" MIR:1";
  if (!outputMirroring) {
    v37 = &stru_1EFA403E0;
  }
  if (burstQualityCaptureEnabled) {
    v38 = @" Burst:1";
  }
  else {
    v38 = &stru_1EFA403E0;
  }
  if (noiseReductionEnabled) {
    v39 = @" NR:1";
  }
  else {
    v39 = &stru_1EFA403E0;
  }
  if (self->_bypassUpscaling) {
    v40 = @" bypassUpscaling:1";
  }
  else {
    v40 = &stru_1EFA403E0;
  }
  if (self->_deviceOrientationCorrectionEnabled) {
    uint64_t v20 = @" OrientationCorrection:1";
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%@ %p: captureID:%lld '%.4s'('%.4s')%@ %dx%d O:%d%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@", objc_opt_class(), self, self->_settingsID, v91, &v90, v84, self->_outputWidth, self->_outputHeight, self->_outputOrientation, v37, v36, v83, v82, v81, v39, v38,
               v80,
               v73,
               v79,
               v75,
               v74,
               v71,
               v34,
               v70,
               v69,
               v45,
               v22,
               v33,
               v32,
               v31,
               v64,
               v61,
               v67,
               v56,
               v53,
               v50,
               v57,
               v54,
               v59,
               v58,
               v51,
               v48,
               v43,
               v47,
               v42,
               v46,
               v44,
               v40,
               v20);
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (void)setResolutionFlavor:(int)a3
{
  self->_uint64_t resolutionFlavor = a3;
}

- (void)setDeferredPhotoProxyWidth:(unsigned int)a3
{
  self->_deferredPhotoProxyWidth = a3;
}

- (void)setDeferredPhotoProxyHeight:(unsigned int)a3
{
  self->_deferredPhotoProxyHeight = a3;
}

- (void)setDeferredPhotoFinalWidth:(unsigned int)a3
{
  self->_deferredPhotoFinalWidth = a3;
}

- (void)setDeferredPhotoFinalHeight:(unsigned int)a3
{
  self->_deferredPhotoFinalHeight = a3;
}

- (unsigned)rawOutputFormat
{
  return self->_rawOutputFormat;
}

- (NSArray)processedImageFilters
{
  return self->_processedImageFilters;
}

- (unsigned)deferredPhotoProxyWidth
{
  return self->_deferredPhotoProxyWidth;
}

- (unsigned)deferredPhotoProxyHeight
{
  return self->_deferredPhotoProxyHeight;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureStillImageSettings)initWithSettingsID:(int64_t)a3
{
  unsigned int v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  return (FigCaptureStillImageSettings *)-[FigCaptureStillImageSettings _initWithSettingsID:captureRequestIdentifier:imageGroupIdentifier:](self, a3, v5, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSettingsID:captureRequestIdentifier:", self->_settingsID, self->_captureRequestIdentifier);

  *(void *)(v4 + 392) = self->_imageGroupIdentifier;
  [(id)v4 setPayloadType:self->_payloadType];
  [(id)v4 setSettingsProvider:self->_settingsProvider];
  [(id)v4 setOutputFormat:self->_outputFormat];
  [(id)v4 setOutputFileType:self->_outputFileType];
  [(id)v4 setRawOutputFormat:self->_rawOutputFormat];
  [(id)v4 setRawOutputFileType:self->_rawOutputFileType];
  [(id)v4 setRawOutputFileBitDepth:self->_rawOutputFileBitDepth];
  [(id)v4 setRawOutputFileCodec:self->_rawOutputFileCodec];
  *(float *)&double v5 = self->_rawOutputFileCodecQuality;
  [(id)v4 setRawOutputFileCodecQuality:v5];
  [(id)v4 setOutputWidth:self->_outputWidth];
  [(id)v4 setOutputHeight:self->_outputHeight];
  [(id)v4 setSquareCropEnabled:self->_squareCropEnabled];
  [(id)v4 setOutputMirroring:self->_outputMirroring];
  [(id)v4 setOutputOrientation:self->_outputOrientation];
  [(id)v4 setPreviewEnabled:self->_previewEnabled];
  if (self->_previewEnabled)
  {
    [(id)v4 setPreviewFormat:self->_previewFormat];
    [(id)v4 setPreviewWidth:self->_previewWidth];
    [(id)v4 setPreviewHeight:self->_previewHeight];
    [(id)v4 setPreviewMirroring:self->_previewMirroring];
    [(id)v4 setPreviewOrientation:self->_previewOrientation];
  }
  [(id)v4 setThumbnailEnabled:self->_thumbnailEnabled];
  if (self->_thumbnailEnabled)
  {
    [(id)v4 setThumbnailFormat:self->_thumbnailFormat];
    [(id)v4 setThumbnailWidth:self->_thumbnailWidth];
    [(id)v4 setThumbnailHeight:self->_thumbnailHeight];
  }
  [(id)v4 setRawThumbnailEnabled:self->_rawThumbnailEnabled];
  if (self->_rawThumbnailEnabled)
  {
    [(id)v4 setRawThumbnailFormat:self->_rawThumbnailFormat];
    [(id)v4 setRawThumbnailWidth:self->_rawThumbnailWidth];
    [(id)v4 setRawThumbnailHeight:self->_rawThumbnailHeight];
  }
  [(id)v4 setNoiseReductionEnabled:self->_noiseReductionEnabled];
  [(id)v4 setBurstQualityCaptureEnabled:self->_burstQualityCaptureEnabled];
  *(float *)&double v6 = self->_scaleFactor;
  [(id)v4 setScaleFactor:v6];
  [(id)v4 setZoomWithoutUpscalingEnabled:self->_zoomWithoutUpscalingEnabled];
  [(id)v4 setShutterSound:self->_shutterSound];
  [(id)v4 setFlashMode:self->_flashMode];
  [(id)v4 setAutoRedEyeReductionEnabled:self->_autoRedEyeReductionEnabled];
  [(id)v4 setDigitalFlashMode:self->_digitalFlashMode];
  [(id)v4 setConstantColorEnabled:self->_constantColorEnabled];
  [(id)v4 setConstantColorFallbackPhotoDeliveryEnabled:self->_constantColorFallbackPhotoDeliveryEnabled];
  [(id)v4 setAutoStereoPhotoCaptureEnabled:self->_autoStereoPhotoCaptureEnabled];
  [(id)v4 setWideColorMode:self->_wideColorMode];
  [(id)v4 setHDRMode:self->_HDRMode];
  if (self->_depthDataDeliveryEnabled)
  {
    [(id)v4 setDepthDataDeliveryEnabled:1];
    [(id)v4 setEmbedsDepthDataInImage:self->_embedsDepthDataInImage];
    [(id)v4 setDepthDataFiltered:self->_depthDataFiltered];
  }
  if (self->_portraitEffectsMatteDeliveryEnabled)
  {
    [(id)v4 setPortraitEffectsMatteDeliveryEnabled:1];
    [(id)v4 setEmbedsPortraitEffectsMatteInImage:self->_embedsPortraitEffectsMatteInImage];
  }
  if ([(NSArray *)self->_enabledSemanticSegmentationMatteURNs count])
  {
    [(id)v4 setEnabledSemanticSegmentationMatteURNs:self->_enabledSemanticSegmentationMatteURNs];
    [(id)v4 setEmbedsSemanticSegmentationMattesInImage:self->_embedsSemanticSegmentationMattesInImage];
  }
  [(id)v4 setCameraCalibrationDataDeliveryEnabled:self->_cameraCalibrationDataDeliveryEnabled];
  [(id)v4 setMetadata:self->_metadata];
  [(id)v4 setMetadataForOriginalImage:self->_metadataForOriginalImage];
  [(id)v4 setOriginalImageFilters:self->_originalImageFilters];
  [(id)v4 setProcessedImageFilters:self->_processedImageFilters];
  *(float *)&double v7 = self->_simulatedAperture;
  [(id)v4 setSimulatedAperture:v7];
  *(float *)&double v8 = self->_portraitLightingEffectStrength;
  [(id)v4 setPortraitLightingEffectStrength:v8];
  [(id)v4 setProvidesOriginalImage:self->_providesOriginalImage];
  [(id)v4 setBravoConstituentImageDeliveryDeviceTypes:self->_bravoConstituentImageDeliveryDeviceTypes];
  [(id)v4 setSpatialOverCaptureMetadata:self->_spatialOverCaptureMetadata];
  [(id)v4 setSpatialOverCaptureMetadataForOriginalImage:self->_spatialOverCaptureMetadataForOriginalImage];
  [(id)v4 setAutoDeferredProcessingEnabled:self->_autoDeferredProcessingEnabled];
  [(id)v4 setQualityPrioritization:self->_qualityPrioritization];
  [(id)v4 setClientQualityPrioritization:self->_clientQualityPrioritization];
  [(id)v4 setBravoImageFusionMode:self->_bravoImageFusionMode];
  [(id)v4 setAutoIntelligentDistortionCorrectionEnabled:self->_autoIntelligentDistortionCorrectionEnabled];
  [(id)v4 setVtCompressionProperties:self->_vtCompressionProperties];
  [(id)v4 setBracketType:self->_bracketType imageCount:self->_bracketImageCount];
  [(id)v4 setLensStabilizationDuringBracketEnabled:self->_lensStabilizationDuringBracketEnabled];
  int bracketType = self->_bracketType;
  if (bracketType == 2)
  {
    *(void *)(v4 + 328) = malloc_type_calloc(self->_bracketImageCount, 4uLL, 0x100004052888210uLL);
    objc_super v10 = (void *)[(id)v4 exposureTargetBiases];
    uint64_t v11 = 328;
    goto LABEL_17;
  }
  if (bracketType == 1)
  {
    *(void *)(v4 + 312) = malloc_type_calloc(self->_bracketImageCount, 0x18uLL, 0x1000040504FFAC1uLL);
    memcpy((void *)[(id)v4 exposureDurations], self->_exposureDurations, 24 * self->_bracketImageCount);
    *(void *)(v4 + 320) = malloc_type_calloc(self->_bracketImageCount, 4uLL, 0x100004052888210uLL);
    objc_super v10 = (void *)[(id)v4 ISOs];
    uint64_t v11 = 320;
LABEL_17:
    memcpy(v10, *(const void **)((char *)&self->super.isa + v11), 4 * self->_bracketImageCount);
  }
  [(id)v4 setStillImageUserInitiatedRequestTime:self->_stillImageUserInitiatedRequestTime];
  long long v14 = *(_OWORD *)&self->_stillImageUserInitiatedRequestPTS.value;
  int64_t epoch = self->_stillImageUserInitiatedRequestPTS.epoch;
  [(id)v4 setStillImageUserInitiatedRequestPTS:&v14];
  [(id)v4 setStillImageRequestTime:self->_stillImageRequestTime];
  [(id)v4 setStillImageCaptureStartTime:self->_stillImageCaptureStartTime];
  [(id)v4 setStillImageCaptureAbsoluteStartTime:self->_stillImageCaptureAbsoluteStartTime];
  [(id)v4 setImageGroupIdentifier:self->_imageGroupIdentifier];
  [(id)v4 setClientInitiatedPrepareSettings:self->_clientInitiatedPrepareSettings];
  [(id)v4 setUserInitiatedRequestSettings:self->_userInitiatedRequestSettings];
  *(float *)&double v12 = self->_videoStabilizationOverscanCropMultiplier;
  [(id)v4 setVideoStabilizationOverscanCropMultiplier:v12];
  [(id)v4 setResolutionFlavor:self->_resolutionFlavor];
  [(id)v4 setDeferredPhotoProxyWidth:self->_deferredPhotoProxyWidth];
  [(id)v4 setDeferredPhotoProxyHeight:self->_deferredPhotoProxyHeight];
  [(id)v4 setDeferredPhotoFinalWidth:self->_deferredPhotoFinalWidth];
  [(id)v4 setDeferredPhotoFinalHeight:self->_deferredPhotoFinalHeight];
  [(id)v4 setDeferredSourceDeviceType:self->_deferredSourceDeviceType];
  [(id)v4 setDeferredSourcePosition:self->_deferredSourcePosition];
  [(id)v4 setDeferredVideoFormatUniqueID:self->_deferredVideoFormatUniqueID];
  [(id)v4 setDeferredDepthDataFormatUniqueID:self->_deferredDepthDataFormatUniqueID];
  [(id)v4 setBypassUpscaling:self->_bypassUpscaling];
  [(id)v4 setCmioCompressedFormat:self->_cmioCompressedFormat];
  [(id)v4 setCmioHighResolutionPhotoEnabled:self->_cmioHighResolutionPhotoEnabled];
  [(id)v4 setCmioMaxPhotoDimensionsWidth:self->_cmioMaxPhotoDimensionsWidth];
  [(id)v4 setCmioMaxPhotoDimensionsHeight:self->_cmioMaxPhotoDimensionsHeight];
  [(id)v4 setDeviceOrientationCorrectionEnabled:self->_deviceOrientationCorrectionEnabled];
  [(id)v4 setSmartStyle:self->_smartStyle];
  [(id)v4 setSmartStyleReversibilitySupported:self->_smartStyleReversibilitySupported];
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v60) = 1;
    return v60;
  }
  uint64_t v128 = v6;
  uint64_t v129 = v5;
  uint64_t v130 = v3;
  uint64_t v131 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_147;
  }
  int64_t settingsID = self->_settingsID;
  if (settingsID != [a3 settingsID]) {
    goto LABEL_147;
  }
  int payloadType = self->_payloadType;
  if (payloadType != [a3 payloadType]) {
    goto LABEL_147;
  }
  int settingsProvider = self->_settingsProvider;
  if (settingsProvider != [a3 settingsProvider]) {
    goto LABEL_147;
  }
  unsigned int outputFormat = self->_outputFormat;
  if (outputFormat != [a3 outputFormat]) {
    goto LABEL_147;
  }
  int outputFileType = self->_outputFileType;
  if (outputFileType != [a3 outputFileType]) {
    goto LABEL_147;
  }
  unsigned int rawOutputFormat = self->_rawOutputFormat;
  if (rawOutputFormat != [a3 rawOutputFormat]) {
    goto LABEL_147;
  }
  int rawOutputFileType = self->_rawOutputFileType;
  if (rawOutputFileType != [a3 rawOutputFileType]) {
    goto LABEL_147;
  }
  unsigned int rawOutputFileBitDepth = self->_rawOutputFileBitDepth;
  if (rawOutputFileBitDepth != [a3 rawOutputFileBitDepth]) {
    goto LABEL_147;
  }
  unsigned int rawOutputFileCodec = self->_rawOutputFileCodec;
  if (rawOutputFileCodec != [a3 rawOutputFileCodec]) {
    goto LABEL_147;
  }
  float rawOutputFileCodecQuality = self->_rawOutputFileCodecQuality;
  [a3 rawOutputFileCodecQuality];
  if (rawOutputFileCodecQuality != v19) {
    goto LABEL_147;
  }
  unsigned int outputWidth = self->_outputWidth;
  if (outputWidth != [a3 outputWidth]) {
    goto LABEL_147;
  }
  unsigned int outputHeight = self->_outputHeight;
  if (outputHeight != [a3 outputHeight]) {
    goto LABEL_147;
  }
  int squareCropEnabled = self->_squareCropEnabled;
  if (squareCropEnabled != [a3 squareCropEnabled]) {
    goto LABEL_147;
  }
  int outputMirroring = self->_outputMirroring;
  if (outputMirroring != [a3 outputMirroring]) {
    goto LABEL_147;
  }
  int outputOrientation = self->_outputOrientation;
  if (outputOrientation != [a3 outputOrientation]) {
    goto LABEL_147;
  }
  int previewEnabled = self->_previewEnabled;
  if (previewEnabled != [a3 previewEnabled]) {
    goto LABEL_147;
  }
  unsigned int previewFormat = self->_previewFormat;
  if (previewFormat != [a3 previewFormat]) {
    goto LABEL_147;
  }
  unsigned int previewWidth = self->_previewWidth;
  if (previewWidth != [a3 previewWidth]) {
    goto LABEL_147;
  }
  unsigned int previewHeight = self->_previewHeight;
  if (previewHeight != [a3 previewHeight]) {
    goto LABEL_147;
  }
  int previewMirroring = self->_previewMirroring;
  if (previewMirroring != [a3 previewMirroring]) {
    goto LABEL_147;
  }
  int previewOrientation = self->_previewOrientation;
  if (previewOrientation != [a3 previewOrientation]) {
    goto LABEL_147;
  }
  int thumbnailEnabled = self->_thumbnailEnabled;
  if (thumbnailEnabled != [a3 thumbnailEnabled]) {
    goto LABEL_147;
  }
  unsigned int thumbnailFormat = self->_thumbnailFormat;
  if (thumbnailFormat != [a3 thumbnailFormat]) {
    goto LABEL_147;
  }
  unsigned int thumbnailWidth = self->_thumbnailWidth;
  if (thumbnailWidth != [a3 thumbnailWidth]) {
    goto LABEL_147;
  }
  unsigned int thumbnailHeight = self->_thumbnailHeight;
  if (thumbnailHeight != [a3 thumbnailHeight]) {
    goto LABEL_147;
  }
  int rawThumbnailEnabled = self->_rawThumbnailEnabled;
  if (rawThumbnailEnabled != [a3 rawThumbnailEnabled]) {
    goto LABEL_147;
  }
  unsigned int rawThumbnailFormat = self->_rawThumbnailFormat;
  if (rawThumbnailFormat != [a3 rawThumbnailFormat]) {
    goto LABEL_147;
  }
  unsigned int rawThumbnailWidth = self->_rawThumbnailWidth;
  if (rawThumbnailWidth != [a3 rawThumbnailWidth]) {
    goto LABEL_147;
  }
  unsigned int rawThumbnailHeight = self->_rawThumbnailHeight;
  if (rawThumbnailHeight != [a3 rawThumbnailHeight]) {
    goto LABEL_147;
  }
  int noiseReductionEnabled = self->_noiseReductionEnabled;
  if (noiseReductionEnabled != [a3 noiseReductionEnabled]) {
    goto LABEL_147;
  }
  int burstQualityCaptureEnabled = self->_burstQualityCaptureEnabled;
  if (burstQualityCaptureEnabled != [a3 burstQualityCaptureEnabled]) {
    goto LABEL_147;
  }
  float scaleFactor = self->_scaleFactor;
  [a3 scaleFactor];
  if (scaleFactor != v42) {
    goto LABEL_147;
  }
  int zoomWithoutUpscalingEnabled = self->_zoomWithoutUpscalingEnabled;
  if (zoomWithoutUpscalingEnabled != [a3 isZoomWithoutUpscalingEnabled]) {
    goto LABEL_147;
  }
  unsigned int shutterSound = self->_shutterSound;
  if (shutterSound != [a3 shutterSound]) {
    goto LABEL_147;
  }
  int flashMode = self->_flashMode;
  if (flashMode != [a3 flashMode]) {
    goto LABEL_147;
  }
  int autoRedEyeReductionEnabled = self->_autoRedEyeReductionEnabled;
  if (autoRedEyeReductionEnabled != [a3 autoRedEyeReductionEnabled]) {
    goto LABEL_147;
  }
  int digitalFlashMode = self->_digitalFlashMode;
  if (digitalFlashMode != [a3 digitalFlashMode]) {
    goto LABEL_147;
  }
  int constantColorEnabled = self->_constantColorEnabled;
  if (constantColorEnabled != [a3 constantColorEnabled]) {
    goto LABEL_147;
  }
  int constantColorFallbackPhotoDeliveryEnabled = self->_constantColorFallbackPhotoDeliveryEnabled;
  if (constantColorFallbackPhotoDeliveryEnabled != [a3 constantColorFallbackPhotoDeliveryEnabled])goto LABEL_147; {
  int autoStereoPhotoCaptureEnabled = self->_autoStereoPhotoCaptureEnabled;
  }
  if (autoStereoPhotoCaptureEnabled != [a3 autoStereoPhotoCaptureEnabled]) {
    goto LABEL_147;
  }
  int wideColorMode = self->_wideColorMode;
  if (wideColorMode != [a3 wideColorMode]) {
    goto LABEL_147;
  }
  int HDRMode = self->_HDRMode;
  if (HDRMode != [a3 HDRMode]) {
    goto LABEL_147;
  }
  int depthDataDeliveryEnabled = self->_depthDataDeliveryEnabled;
  if (depthDataDeliveryEnabled != [a3 depthDataDeliveryEnabled]) {
    goto LABEL_147;
  }
  int embedsDepthDataInImage = self->_embedsDepthDataInImage;
  if (embedsDepthDataInImage != [a3 embedsDepthDataInImage]) {
    goto LABEL_147;
  }
  int depthDataFiltered = self->_depthDataFiltered;
  if (depthDataFiltered != [a3 depthDataFiltered]) {
    goto LABEL_147;
  }
  int cameraCalibrationDataDeliveryEnabled = self->_cameraCalibrationDataDeliveryEnabled;
  if (cameraCalibrationDataDeliveryEnabled != [a3 cameraCalibrationDataDeliveryEnabled]) {
    goto LABEL_147;
  }
  int portraitEffectsMatteDeliveryEnabled = self->_portraitEffectsMatteDeliveryEnabled;
  if (portraitEffectsMatteDeliveryEnabled != [a3 portraitEffectsMatteDeliveryEnabled]) {
    goto LABEL_147;
  }
  int embedsPortraitEffectsMatteInImage = self->_embedsPortraitEffectsMatteInImage;
  if (embedsPortraitEffectsMatteInImage != [a3 embedsPortraitEffectsMatteInImage]) {
    goto LABEL_147;
  }
  uint64_t v59 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:self->_enabledSemanticSegmentationMatteURNs];
  LODWORD(v60) = objc_msgSend(v59, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "enabledSemanticSegmentationMatteURNs")));
  if (!v60) {
    return v60;
  }
  int embedsSemanticSegmentationMattesInImage = self->_embedsSemanticSegmentationMattesInImage;
  if (embedsSemanticSegmentationMattesInImage != [a3 embedsSemanticSegmentationMattesInImage])goto LABEL_147; {
  metadata = self->_metadata;
  }
  if (metadata == (NSDictionary *)[a3 metadata]
    || (LODWORD(v60) = -[NSDictionary isEqual:](self->_metadata, "isEqual:", [a3 metadata]), v60))
  {
    metadataForOriginalImage = self->_metadataForOriginalImage;
    if (metadataForOriginalImage == (NSDictionary *)[a3 metadataForOriginalImage]
      || (LODWORD(v60) = -[NSDictionary isEqual:](self->_metadataForOriginalImage, "isEqual:", [a3 metadataForOriginalImage]), v60))
    {
      NSUInteger v64 = [(NSArray *)self->_originalImageFilters count];
      if (v64 != objc_msgSend((id)objc_msgSend(a3, "originalImageFilters"), "count")) {
        goto LABEL_147;
      }
      if ([(NSArray *)self->_originalImageFilters count])
      {
        uint64_t v65 = 0;
        unsigned int v66 = 1;
        while ((objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_originalImageFilters, "objectAtIndexedSubscript:", v65), "name"), "isEqualToString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "originalImageFilters"), "objectAtIndexedSubscript:", v65), "name")) & 1) != 0)
        {
          uint64_t v65 = v66;
          BOOL v67 = [(NSArray *)self->_originalImageFilters count] > v66++;
          if (!v67) {
            goto LABEL_62;
          }
        }
        goto LABEL_147;
      }
LABEL_62:
      NSUInteger v68 = [(NSArray *)self->_processedImageFilters count];
      if (v68 != objc_msgSend((id)objc_msgSend(a3, "processedImageFilters"), "count")) {
        goto LABEL_147;
      }
      if ([(NSArray *)self->_processedImageFilters count])
      {
        uint64_t v69 = 0;
        unsigned int v70 = 1;
        while ((objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_processedImageFilters, "objectAtIndexedSubscript:", v69), "name"), "isEqualToString:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "processedImageFilters"), "objectAtIndexedSubscript:", v69), "name")) & 1) != 0)
        {
          uint64_t v69 = v70;
          BOOL v67 = [(NSArray *)self->_processedImageFilters count] > v70++;
          if (!v67) {
            goto LABEL_67;
          }
        }
        goto LABEL_147;
      }
LABEL_67:
      float simulatedAperture = self->_simulatedAperture;
      [a3 simulatedAperture];
      if (simulatedAperture != v72) {
        goto LABEL_147;
      }
      float portraitLightingEffectStrength = self->_portraitLightingEffectStrength;
      [a3 portraitLightingEffectStrength];
      if (portraitLightingEffectStrength != v74) {
        goto LABEL_147;
      }
      int providesOriginalImage = self->_providesOriginalImage;
      if (providesOriginalImage != [a3 providesOriginalImage]) {
        goto LABEL_147;
      }
      bravoConstituentImageDeliveryDeviceTypes = self->_bravoConstituentImageDeliveryDeviceTypes;
      if (bravoConstituentImageDeliveryDeviceTypes == (NSArray *)[a3 bravoConstituentImageDeliveryDeviceTypes]|| (LODWORD(v60) = -[NSArray isEqual:](self->_bravoConstituentImageDeliveryDeviceTypes, "isEqual:", objc_msgSend(a3, "bravoConstituentImageDeliveryDeviceTypes")), v60))
      {
        spatialOverCaptureMetadata = self->_spatialOverCaptureMetadata;
        if (spatialOverCaptureMetadata == (NSDictionary *)[a3 spatialOverCaptureMetadata]
          || (LODWORD(v60) = -[NSDictionary isEqual:](self->_spatialOverCaptureMetadata, "isEqual:", [a3 spatialOverCaptureMetadata]), v60))
        {
          spatialOverCaptureMetadataForOriginalImage = self->_spatialOverCaptureMetadataForOriginalImage;
          if (spatialOverCaptureMetadataForOriginalImage == (NSDictionary *)[a3 spatialOverCaptureMetadataForOriginalImage]|| (LODWORD(v60) = -[NSDictionary isEqual:](self->_spatialOverCaptureMetadataForOriginalImage, "isEqual:", objc_msgSend(a3, "spatialOverCaptureMetadataForOriginalImage")), v60))
          {
            int autoDeferredProcessingEnabled = self->_autoDeferredProcessingEnabled;
            if (autoDeferredProcessingEnabled != [a3 autoDeferredProcessingEnabled]) {
              goto LABEL_147;
            }
            int qualityPrioritization = self->_qualityPrioritization;
            if (qualityPrioritization != [a3 qualityPrioritization]) {
              goto LABEL_147;
            }
            int clientQualityPrioritization = self->_clientQualityPrioritization;
            if (clientQualityPrioritization != [a3 clientQualityPrioritization]) {
              goto LABEL_147;
            }
            int bravoImageFusionMode = self->_bravoImageFusionMode;
            if (bravoImageFusionMode != [a3 bravoImageFusionMode]) {
              goto LABEL_147;
            }
            int autoIntelligentDistortionCorrectionEnabled = self->_autoIntelligentDistortionCorrectionEnabled;
            if (autoIntelligentDistortionCorrectionEnabled != [a3 autoIntelligentDistortionCorrectionEnabled])goto LABEL_147; {
            vtCompressionProperties = self->_vtCompressionProperties;
            }
            if (vtCompressionProperties != (NSDictionary *)[a3 vtCompressionProperties])
            {
              LODWORD(v60) = -[NSDictionary isEqual:](self->_vtCompressionProperties, "isEqual:", [a3 vtCompressionProperties]);
              if (!v60) {
                return v60;
              }
            }
            int bracketType = self->_bracketType;
            if (bracketType != [a3 bracketType]) {
              goto LABEL_147;
            }
            unsigned int bracketImageCount = self->_bracketImageCount;
            if (bracketImageCount != [a3 bracketImageCount]) {
              goto LABEL_147;
            }
            int lensStabilizationDuringBracketEnabled = self->_lensStabilizationDuringBracketEnabled;
            if (lensStabilizationDuringBracketEnabled != [a3 lensStabilizationDuringBracketEnabled])goto LABEL_147; {
            if (self->_bracketImageCount)
            }
            {
              uint64_t v88 = 0;
              unint64_t v89 = 0;
              do
              {
                if (self->_exposureDurations) {
                  goto LABEL_153;
                }
                if ([a3 exposureDurations]) {
                  goto LABEL_147;
                }
                if (self->_exposureDurations)
                {
LABEL_153:
                  uint64_t v60 = [a3 exposureDurations];
                  if (!v60) {
                    return v60;
                  }
                  if (self->_exposureDurations)
                  {
                    if ([a3 exposureDurations])
                    {
                      unsigned int v90 = &self->_exposureDurations[v88];
                      uint64_t v91 = [a3 exposureDurations];
                      long long v92 = *(_OWORD *)&v90->var0;
                      time1.int64_t epoch = v90->var3;
                      *(_OWORD *)&time1.value = v92;
                      long long v93 = *(_OWORD *)(v91 + v88 * 24);
                      time2.int64_t epoch = *(void *)(v91 + v88 * 24 + 16);
                      *(_OWORD *)&time2.value = v93;
                      if (CMTimeCompare(&time1, &time2)) {
                        goto LABEL_147;
                      }
                    }
                  }
                }
                if (self->_ISOs) {
                  goto LABEL_152;
                }
                if ([a3 ISOs]) {
                  goto LABEL_147;
                }
                if (self->_ISOs)
                {
LABEL_152:
                  uint64_t v60 = [a3 ISOs];
                  if (!v60) {
                    return v60;
                  }
                  if (self->_ISOs)
                  {
                    if ([a3 ISOs])
                    {
                      float v94 = self->_ISOs[v89];
                      if (v94 != *(float *)([a3 ISOs] + 4 * v89)) {
                        goto LABEL_147;
                      }
                    }
                  }
                }
                if (self->_exposureTargetBiases) {
                  goto LABEL_151;
                }
                if ([a3 exposureTargetBiases]) {
                  goto LABEL_147;
                }
                if (self->_exposureTargetBiases)
                {
LABEL_151:
                  uint64_t v60 = [a3 exposureTargetBiases];
                  if (!v60) {
                    return v60;
                  }
                  if (self->_exposureTargetBiases)
                  {
                    if ([a3 exposureTargetBiases])
                    {
                      float v95 = self->_exposureTargetBiases[v89];
                      if (v95 != *(float *)([a3 exposureTargetBiases] + 4 * v89)) {
                        goto LABEL_147;
                      }
                    }
                  }
                }
                ++v89;
                ++v88;
              }
              while (v89 < self->_bracketImageCount);
            }
            unint64_t stillImageUserInitiatedRequestTime = self->_stillImageUserInitiatedRequestTime;
            if (stillImageUserInitiatedRequestTime != [a3 stillImageUserInitiatedRequestTime]) {
              goto LABEL_147;
            }
            if (a3) {
              [a3 stillImageUserInitiatedRequestPTS];
            }
            else {
              memset(&v125, 0, sizeof(v125));
            }
            CMTime time1 = (CMTime)self->_stillImageUserInitiatedRequestPTS;
            if (CMTimeCompare(&time1, &v125)) {
              goto LABEL_147;
            }
            int64_t stillImageRequestTime = self->_stillImageRequestTime;
            if (stillImageRequestTime != [a3 stillImageRequestTime]) {
              goto LABEL_147;
            }
            int64_t stillImageCaptureStartTime = self->_stillImageCaptureStartTime;
            if (stillImageCaptureStartTime != [a3 stillImageCaptureStartTime]) {
              goto LABEL_147;
            }
            double stillImageCaptureAbsoluteStartTime = self->_stillImageCaptureAbsoluteStartTime;
            [a3 stillImageCaptureAbsoluteStartTime];
            if (stillImageCaptureAbsoluteStartTime != v100) {
              goto LABEL_147;
            }
            imageGroupIdentifier = self->_imageGroupIdentifier;
            if (imageGroupIdentifier == (NSString *)[a3 imageGroupIdentifier]
              || (LODWORD(v60) = -[NSString isEqualToString:](self->_imageGroupIdentifier, "isEqualToString:", [a3 imageGroupIdentifier]), v60))
            {
              captureRequestIdentifier = self->_captureRequestIdentifier;
              if (captureRequestIdentifier == (NSString *)[a3 captureRequestIdentifier]
                || (LODWORD(v60) = -[NSString isEqualToString:](self->_captureRequestIdentifier, "isEqualToString:", [a3 captureRequestIdentifier]), v60))
              {
                int clientInitiatedPrepareSettings = self->_clientInitiatedPrepareSettings;
                if (clientInitiatedPrepareSettings != [a3 isClientInitiatedPrepareSettings])goto LABEL_147; {
                int userInitiatedRequestSettings = self->_userInitiatedRequestSettings;
                }
                if (userInitiatedRequestSettings != [a3 isUserInitiatedRequestSettings]) {
                  goto LABEL_147;
                }
                float videoStabilizationOverscanCropMultiplier = self->_videoStabilizationOverscanCropMultiplier;
                [a3 videoStabilizationOverscanCropMultiplier];
                if (videoStabilizationOverscanCropMultiplier != v106) {
                  goto LABEL_147;
                }
                int resolutionFlavor = self->_resolutionFlavor;
                if (resolutionFlavor != [a3 resolutionFlavor]) {
                  goto LABEL_147;
                }
                unsigned int deferredPhotoProxyWidth = self->_deferredPhotoProxyWidth;
                if (deferredPhotoProxyWidth != [a3 deferredPhotoProxyWidth]) {
                  goto LABEL_147;
                }
                unsigned int deferredPhotoProxyHeight = self->_deferredPhotoProxyHeight;
                if (deferredPhotoProxyHeight != [a3 deferredPhotoProxyHeight]) {
                  goto LABEL_147;
                }
                unsigned int deferredPhotoFinalWidth = self->_deferredPhotoFinalWidth;
                if (deferredPhotoFinalWidth != [a3 deferredPhotoFinalWidth]) {
                  goto LABEL_147;
                }
                unsigned int deferredPhotoFinalHeight = self->_deferredPhotoFinalHeight;
                if (deferredPhotoFinalHeight != [a3 deferredPhotoFinalHeight]) {
                  goto LABEL_147;
                }
                int deferredSourceDeviceType = self->_deferredSourceDeviceType;
                if (deferredSourceDeviceType != [a3 deferredSourceDeviceType]) {
                  goto LABEL_147;
                }
                int deferredSourcePosition = self->_deferredSourcePosition;
                if (deferredSourcePosition != [a3 deferredSourcePosition]) {
                  goto LABEL_147;
                }
                deferredVideoFormatUniqueID = self->_deferredVideoFormatUniqueID;
                if (deferredVideoFormatUniqueID == (NSString *)[a3 deferredVideoFormatUniqueID]
                  || (LODWORD(v60) = -[NSString isEqualToString:](self->_deferredVideoFormatUniqueID, "isEqualToString:", [a3 deferredVideoFormatUniqueID]), v60))
                {
                  deferredDepthDataFormatUniqueID = self->_deferredDepthDataFormatUniqueID;
                  if (deferredDepthDataFormatUniqueID == (NSString *)[a3 deferredDepthDataFormatUniqueID]|| (LODWORD(v60) = -[NSString isEqualToString:](self->_deferredDepthDataFormatUniqueID, "isEqualToString:", objc_msgSend(a3, "deferredDepthDataFormatUniqueID")), v60))
                  {
                    int bypassUpscaling = self->_bypassUpscaling;
                    if (bypassUpscaling == [a3 bypassUpscaling])
                    {
                      cmioCompressedFormat = self->_cmioCompressedFormat;
                      if (cmioCompressedFormat != (NSString *)[a3 cmioCompressedFormat])
                      {
                        LODWORD(v60) = -[NSString isEqualToString:](self->_cmioCompressedFormat, "isEqualToString:", [a3 cmioCompressedFormat]);
                        if (!v60) {
                          return v60;
                        }
                      }
                      int cmioHighResolutionPhotoEnabled = self->_cmioHighResolutionPhotoEnabled;
                      if (cmioHighResolutionPhotoEnabled == [a3 cmioHighResolutionPhotoEnabled])
                      {
                        int cmioMaxPhotoDimensionsWidth = self->_cmioMaxPhotoDimensionsWidth;
                        if (cmioMaxPhotoDimensionsWidth == [a3 cmioMaxPhotoDimensionsWidth])
                        {
                          int cmioMaxPhotoDimensionsHeight = self->_cmioMaxPhotoDimensionsHeight;
                          if (cmioMaxPhotoDimensionsHeight == [a3 cmioMaxPhotoDimensionsHeight])
                          {
                            int deviceOrientationCorrectionEnabled = self->_deviceOrientationCorrectionEnabled;
                            if (deviceOrientationCorrectionEnabled == [a3 deviceOrientationCorrectionEnabled])
                            {
                              smartStyle = self->_smartStyle;
                              if (smartStyle == (FigCaptureSmartStyle *)[a3 smartStyle]
                                || (LODWORD(v60) = -[FigCaptureSmartStyle isEqual:](self->_smartStyle, "isEqual:", [a3 smartStyle]), v60))
                              {
                                int smartStyleReversibilitySupported = self->_smartStyleReversibilitySupported;
                                LOBYTE(v60) = smartStyleReversibilitySupported == [a3 smartStyleReversibilitySupported];
                              }
                              return v60;
                            }
                          }
                        }
                      }
                    }
LABEL_147:
                    LOBYTE(v60) = 0;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v60;
}

- (unint64_t)hash
{
  return self->_settingsID;
}

- (NSDictionary)outputPixelBufferAttributes
{
  v5[3] = *MEMORY[0x1E4F143B8];
  if (![(FigCaptureStillImageSettings *)self outputFormat]
    || [(FigCaptureStillImageSettings *)self isOutputFormatCompressed])
  {
    return 0;
  }
  v4[0] = *MEMORY[0x1E4F24D70];
  v5[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FigCaptureStillImageSettings outputFormat](self, "outputFormat"));
  v4[1] = *MEMORY[0x1E4F24E10];
  v5[1] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FigCaptureStillImageSettings outputWidth](self, "outputWidth"));
  v4[2] = *MEMORY[0x1E4F24D08];
  v5[2] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FigCaptureStillImageSettings outputHeight](self, "outputHeight"));
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3];
}

- (BOOL)isOutputFormatCompressed
{
  unsigned int v2 = [(FigCaptureStillImageSettings *)self outputFormat];
  BOOL v3 = v2 == 1752589105 || v2 == 1785750887;
  return v2 == 1635148593 || v3;
}

- (NSDictionary)previewPixelBufferAttributes
{
  v6[3] = *MEMORY[0x1E4F143B8];
  unsigned int v3 = [(FigCaptureStillImageSettings *)self previewFormat];
  if (v3 != 875704422 && v3 != 1111970369 && v3 != 875704438) {
    return 0;
  }
  v5[0] = *MEMORY[0x1E4F24D70];
  v6[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FigCaptureStillImageSettings previewFormat](self, "previewFormat"));
  v5[1] = *MEMORY[0x1E4F24E10];
  v6[1] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FigCaptureStillImageSettings previewWidth](self, "previewWidth"));
  v5[2] = *MEMORY[0x1E4F24D08];
  v6[2] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[FigCaptureStillImageSettings previewHeight](self, "previewHeight"));
  return (NSDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:3];
}

- (void)cannotProcessDepthPhotos
{
  [(FigCaptureStillImageSettings *)self setDepthDataDeliveryEnabled:0];
  [(FigCaptureStillImageSettings *)self setProcessedImageFilters:0];
  [(FigCaptureStillImageSettings *)self setPortraitEffectsMatteDeliveryEnabled:0];
  [(FigCaptureStillImageSettings *)self setEmbedsPortraitEffectsMatteInImage:0];
}

- (BOOL)constituentPhotoDeliveryEnabled
{
  return [(NSArray *)self->_bravoConstituentImageDeliveryDeviceTypes count] != 0;
}

- (void)setBracketType:(int)a3 imageCount:(unsigned int)a4
{
  if (self->_bracketType != a3 || self->_bracketImageCount != a4) {
    -[FigCaptureStillImageSettings _teardownBracketStorage]((void **)&self->super.isa);
  }
  self->_int bracketType = a3;
  if (a4 >= 8) {
    unsigned int v7 = 8;
  }
  else {
    unsigned int v7 = a4;
  }
  self->_unsigned int bracketImageCount = v7;
  if (a4)
  {
    if (a3 == 2)
    {
      if (self->_exposureTargetBiases) {
        return;
      }
      p_exposureTargetBiases = &self->_exposureTargetBiases;
      goto LABEL_16;
    }
    if (a3 == 1)
    {
      if (!self->_exposureDurations) {
        self->_exposureDurations = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)malloc_type_calloc(a4, 0x18uLL, 0x1000040504FFAC1uLL);
      }
      if (!self->_ISOs)
      {
        p_exposureTargetBiases = &self->_ISOs;
LABEL_16:
        *p_exposureTargetBiases = (float *)malloc_type_calloc(a4, 4uLL, 0x100004052888210uLL);
      }
    }
  }
}

- (NSString)imageGroupIdentifier
{
  if (!self->_providesOriginalImage && !self->_bracketImageCount && (!self->_rawOutputFormat || !self->_outputFormat)) {
    return 0;
  }
  result = self->_imageGroupIdentifier;
  if (!result)
  {
    result = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    self->_imageGroupIdentifier = result;
  }
  return result;
}

- (id)figCaptureIrisPreparedSettingsRepresentation
{
  unsigned int v3 = objc_alloc_init(FigCaptureIrisPreparedSettings);
  [(FigCaptureIrisPreparedSettings *)v3 setSettingsID:self->_settingsID];
  [(FigCaptureIrisPreparedSettings *)v3 setProcessedOutputFormat:self->_outputFormat];
  [(FigCaptureIrisPreparedSettings *)v3 setOutputWidth:self->_outputWidth];
  [(FigCaptureIrisPreparedSettings *)v3 setOutputHeight:self->_outputHeight];
  [(FigCaptureIrisPreparedSettings *)v3 setRawOutputFormat:self->_rawOutputFormat];
  [(FigCaptureIrisPreparedSettings *)v3 setBracketedImageCount:self->_bracketImageCount];
  [(FigCaptureIrisPreparedSettings *)v3 setQualityPrioritization:self->_qualityPrioritization];
  [(FigCaptureIrisPreparedSettings *)v3 setHDRMode:self->_HDRMode];
  return v3;
}

- (int)payloadType
{
  return self->_payloadType;
}

- (int)settingsProvider
{
  return self->_settingsProvider;
}

- (unsigned)outputFormat
{
  return self->_outputFormat;
}

- (unsigned)rawOutputFileBitDepth
{
  return self->_rawOutputFileBitDepth;
}

- (void)setRawOutputFileBitDepth:(unsigned int)a3
{
  self->_unsigned int rawOutputFileBitDepth = a3;
}

- (unsigned)rawOutputFileCodec
{
  return self->_rawOutputFileCodec;
}

- (void)setRawOutputFileCodec:(unsigned int)a3
{
  self->_unsigned int rawOutputFileCodec = a3;
}

- (float)rawOutputFileCodecQuality
{
  return self->_rawOutputFileCodecQuality;
}

- (void)setRawOutputFileCodecQuality:(float)a3
{
  self->_float rawOutputFileCodecQuality = a3;
}

- (int)rawOutputFileType
{
  return self->_rawOutputFileType;
}

- (BOOL)squareCropEnabled
{
  return self->_squareCropEnabled;
}

- (unsigned)previewFormat
{
  return self->_previewFormat;
}

- (unsigned)previewWidth
{
  return self->_previewWidth;
}

- (unsigned)previewHeight
{
  return self->_previewHeight;
}

- (BOOL)previewMirroring
{
  return self->_previewMirroring;
}

- (int)previewOrientation
{
  return self->_previewOrientation;
}

- (unsigned)thumbnailFormat
{
  return self->_thumbnailFormat;
}

- (unsigned)thumbnailWidth
{
  return self->_thumbnailWidth;
}

- (unsigned)thumbnailHeight
{
  return self->_thumbnailHeight;
}

- (unsigned)rawThumbnailFormat
{
  return self->_rawThumbnailFormat;
}

- (void)setRawThumbnailFormat:(unsigned int)a3
{
  self->_unsigned int rawThumbnailFormat = a3;
}

- (unsigned)rawThumbnailWidth
{
  return self->_rawThumbnailWidth;
}

- (void)setRawThumbnailWidth:(unsigned int)a3
{
  self->_unsigned int rawThumbnailWidth = a3;
}

- (unsigned)rawThumbnailHeight
{
  return self->_rawThumbnailHeight;
}

- (void)setRawThumbnailHeight:(unsigned int)a3
{
  self->_unsigned int rawThumbnailHeight = a3;
}

- (BOOL)noiseReductionEnabled
{
  return self->_noiseReductionEnabled;
}

- (BOOL)burstQualityCaptureEnabled
{
  return self->_burstQualityCaptureEnabled;
}

- (float)scaleFactor
{
  return self->_scaleFactor;
}

- (BOOL)isZoomWithoutUpscalingEnabled
{
  return self->_zoomWithoutUpscalingEnabled;
}

- (unsigned)shutterSound
{
  return self->_shutterSound;
}

- (int)flashMode
{
  return self->_flashMode;
}

- (BOOL)autoRedEyeReductionEnabled
{
  return self->_autoRedEyeReductionEnabled;
}

- (int)digitalFlashMode
{
  return self->_digitalFlashMode;
}

- (BOOL)constantColorEnabled
{
  return self->_constantColorEnabled;
}

- (BOOL)constantColorFallbackPhotoDeliveryEnabled
{
  return self->_constantColorFallbackPhotoDeliveryEnabled;
}

- (BOOL)autoStereoPhotoCaptureEnabled
{
  return self->_autoStereoPhotoCaptureEnabled;
}

- (int)wideColorMode
{
  return self->_wideColorMode;
}

- (int)HDRMode
{
  return self->_HDRMode;
}

- (BOOL)embedsDepthDataInImage
{
  return self->_embedsDepthDataInImage;
}

- (BOOL)depthDataFiltered
{
  return self->_depthDataFiltered;
}

- (BOOL)cameraCalibrationDataDeliveryEnabled
{
  return self->_cameraCalibrationDataDeliveryEnabled;
}

- (BOOL)embedsPortraitEffectsMatteInImage
{
  return self->_embedsPortraitEffectsMatteInImage;
}

- (BOOL)embedsSemanticSegmentationMattesInImage
{
  return self->_embedsSemanticSegmentationMattesInImage;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSDictionary)metadataForOriginalImage
{
  return self->_metadataForOriginalImage;
}

- (NSArray)originalImageFilters
{
  return self->_originalImageFilters;
}

- (float)simulatedAperture
{
  return self->_simulatedAperture;
}

- (void)setSimulatedAperture:(float)a3
{
  self->_float simulatedAperture = a3;
}

- (float)portraitLightingEffectStrength
{
  return self->_portraitLightingEffectStrength;
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  self->_float portraitLightingEffectStrength = a3;
}

- (NSArray)bravoConstituentImageDeliveryDeviceTypes
{
  return self->_bravoConstituentImageDeliveryDeviceTypes;
}

- (NSDictionary)spatialOverCaptureMetadata
{
  return self->_spatialOverCaptureMetadata;
}

- (void)setSpatialOverCaptureMetadata:(id)a3
{
}

- (int)qualityPrioritization
{
  return self->_qualityPrioritization;
}

- (int)clientQualityPrioritization
{
  return self->_clientQualityPrioritization;
}

- (int)bravoImageFusionMode
{
  return self->_bravoImageFusionMode;
}

- (void)setBravoImageFusionMode:(int)a3
{
  self->_int bravoImageFusionMode = a3;
}

- (BOOL)autoIntelligentDistortionCorrectionEnabled
{
  return self->_autoIntelligentDistortionCorrectionEnabled;
}

- (NSDictionary)vtCompressionProperties
{
  return self->_vtCompressionProperties;
}

- (int)bracketType
{
  return self->_bracketType;
}

- (unsigned)bracketImageCount
{
  return self->_bracketImageCount;
}

- (BOOL)lensStabilizationDuringBracketEnabled
{
  return self->_lensStabilizationDuringBracketEnabled;
}

- (void)setLensStabilizationDuringBracketEnabled:(BOOL)a3
{
  self->_int lensStabilizationDuringBracketEnabled = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)exposureDurations
{
  return self->_exposureDurations;
}

- (float)ISOs
{
  return self->_ISOs;
}

- (float)exposureTargetBiases
{
  return self->_exposureTargetBiases;
}

- (unint64_t)stillImageUserInitiatedRequestTime
{
  return self->_stillImageUserInitiatedRequestTime;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageUserInitiatedRequestPTS
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 344);
  return self;
}

- (int64_t)stillImageRequestTime
{
  return self->_stillImageRequestTime;
}

- (void)setStillImageRequestTime:(int64_t)a3
{
  self->_int64_t stillImageRequestTime = a3;
}

- (int64_t)stillImageCaptureStartTime
{
  return self->_stillImageCaptureStartTime;
}

- (void)setStillImageCaptureStartTime:(int64_t)a3
{
  self->_int64_t stillImageCaptureStartTime = a3;
}

- (double)stillImageCaptureAbsoluteStartTime
{
  return self->_stillImageCaptureAbsoluteStartTime;
}

- (void)setStillImageCaptureAbsoluteStartTime:(double)a3
{
  self->_double stillImageCaptureAbsoluteStartTime = a3;
}

- (FigCaptureSmartStyle)smartStyle
{
  return self->_smartStyle;
}

- (void)setSmartStyle:(id)a3
{
}

- (BOOL)smartStyleReversibilitySupported
{
  return self->_smartStyleReversibilitySupported;
}

- (void)setSmartStyleReversibilitySupported:(BOOL)a3
{
  self->_int smartStyleReversibilitySupported = a3;
}

- (NSString)captureRequestIdentifier
{
  return self->_captureRequestIdentifier;
}

- (BOOL)isClientInitiatedPrepareSettings
{
  return self->_clientInitiatedPrepareSettings;
}

- (void)setClientInitiatedPrepareSettings:(BOOL)a3
{
  self->_int clientInitiatedPrepareSettings = a3;
}

- (BOOL)isUserInitiatedRequestSettings
{
  return self->_userInitiatedRequestSettings;
}

- (void)setUserInitiatedRequestSettings:(BOOL)a3
{
  self->_int userInitiatedRequestSettings = a3;
}

- (BOOL)isBeginMomentCaptureSettings
{
  return self->_beginMomentCaptureSettings;
}

- (void)setBeginMomentCaptureSettings:(BOOL)a3
{
  self->_beginMomentCaptureSettings = a3;
}

- (float)videoStabilizationOverscanCropMultiplier
{
  return self->_videoStabilizationOverscanCropMultiplier;
}

- (void)setVideoStabilizationOverscanCropMultiplier:(float)a3
{
  self->_float videoStabilizationOverscanCropMultiplier = a3;
}

- (BOOL)bypassUpscaling
{
  return self->_bypassUpscaling;
}

- (void)setBypassUpscaling:(BOOL)a3
{
  self->_int bypassUpscaling = a3;
}

- (NSString)cmioCompressedFormat
{
  return self->_cmioCompressedFormat;
}

- (void)setCmioCompressedFormat:(id)a3
{
}

- (BOOL)cmioHighResolutionPhotoEnabled
{
  return self->_cmioHighResolutionPhotoEnabled;
}

- (void)setCmioHighResolutionPhotoEnabled:(BOOL)a3
{
  self->_int cmioHighResolutionPhotoEnabled = a3;
}

- (int)cmioMaxPhotoDimensionsWidth
{
  return self->_cmioMaxPhotoDimensionsWidth;
}

- (void)setCmioMaxPhotoDimensionsWidth:(int)a3
{
  self->_int cmioMaxPhotoDimensionsWidth = a3;
}

- (int)cmioMaxPhotoDimensionsHeight
{
  return self->_cmioMaxPhotoDimensionsHeight;
}

- (void)setCmioMaxPhotoDimensionsHeight:(int)a3
{
  self->_int cmioMaxPhotoDimensionsHeight = a3;
}

- (BOOL)deviceOrientationCorrectionEnabled
{
  return self->_deviceOrientationCorrectionEnabled;
}

- (NSDictionary)spatialOverCaptureMetadataForOriginalImage
{
  return self->_spatialOverCaptureMetadataForOriginalImage;
}

- (void)setSpatialOverCaptureMetadataForOriginalImage:(id)a3
{
}

- (BOOL)autoDeferredProcessingEnabled
{
  return self->_autoDeferredProcessingEnabled;
}

- (void)setImageGroupIdentifier:(id)a3
{
  self->_imageGroupIdentifier = (NSString *)a3;
}

@end