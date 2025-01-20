@interface AVCapturePhotoSettings
+ (AVCapturePhotoSettings)photoSettings;
+ (AVCapturePhotoSettings)photoSettingsFromPhotoSettings:(AVCapturePhotoSettings *)photoSettings;
+ (AVCapturePhotoSettings)photoSettingsWithFormat:(NSDictionary *)format;
+ (AVCapturePhotoSettings)photoSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType;
+ (AVCapturePhotoSettings)photoSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType processedFormat:(NSDictionary *)processedFormat;
+ (AVCapturePhotoSettings)photoSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType rawFileType:(AVFileType)rawFileType processedFormat:(NSDictionary *)processedFormat processedFileType:(AVFileType)processedFileType;
+ (id)burstQualityPhotoSettings;
+ (id)photoSettingsFromMomentCaptureSettings:(id)a3 withFormat:(id)a4;
+ (id)photoSettingsFromMomentCaptureSettings:(id)a3 withRawPixelFormatType:(unsigned int)a4 rawFileType:(id)a5 format:(id)a6;
+ (id)photoSettingsFromPhotoInitiationSettings:(id)a3 format:(id)a4;
+ (int64_t)uniqueID;
+ (void)initialize;
- (AVCaptureFlashMode)flashMode;
- (AVCapturePhotoQualityPrioritization)photoQualityPrioritization;
- (AVCapturePhotoSettings)init;
- (AVFileType)processedFileType;
- (AVFileType)rawFileType;
- (AVVideoCodecType)livePhotoVideoCodecType;
- (BOOL)arePreviewPhotoFormatDimensionsLimitedToDisplayDimensions;
- (BOOL)embedsDepthDataInPhoto;
- (BOOL)embedsPortraitEffectsMatteInPhoto;
- (BOOL)embedsSemanticSegmentationMattesInPhoto;
- (BOOL)isAutoContentAwareDistortionCorrectionEnabled;
- (BOOL)isAutoDeferredProcessingEnabled;
- (BOOL)isAutoDualCameraFusionEnabled;
- (BOOL)isAutoRedEyeReductionEnabled;
- (BOOL)isAutoSpatialOverCaptureEnabled;
- (BOOL)isAutoSpatialPhotoCaptureEnabled;
- (BOOL)isAutoStillImageStabilizationEnabled;
- (BOOL)isAutoVirtualDeviceFusionEnabled;
- (BOOL)isBurstQualityCaptureEnabled;
- (BOOL)isCameraCalibrationDataDeliveryEnabled;
- (BOOL)isConstantColorEnabled;
- (BOOL)isConstantColorFallbackPhotoDeliveryEnabled;
- (BOOL)isDepthDataDeliveryEnabled;
- (BOOL)isDepthDataFiltered;
- (BOOL)isDualCameraDualPhotoDeliveryEnabled;
- (BOOL)isEV0PhotoDeliveryEnabled;
- (BOOL)isHighResolutionPhotoEnabled;
- (BOOL)isPortraitEffectsMatteDeliveryEnabled;
- (BOOL)isProcessedPhotoZoomWithoutUpscalingEnabled;
- (BOOL)isShutterSoundSuppressionEnabled;
- (BOOL)isSquareCropEnabled;
- (BOOL)isTurboModeEnabled;
- (BOOL)photoQualityPrioritizationIsSetByClient;
- (CGSize)embeddedThumbnailCGSize;
- (CGSize)previewCGSize;
- (CGSize)rawEmbeddedThumbnailCGSize;
- (CMVideoDimensions)maxPhotoDimensions;
- (NSArray)availableEmbeddedThumbnailPhotoCodecTypes;
- (NSArray)availablePreviewPhotoPixelFormatTypes;
- (NSArray)availableRawEmbeddedThumbnailPhotoCodecTypes;
- (NSArray)enabledSemanticSegmentationMatteTypes;
- (NSArray)livePhotoMovieMetadata;
- (NSArray)virtualDeviceConstituentPhotoDeliveryEnabledDevices;
- (NSDictionary)embeddedThumbnailPhotoFormat;
- (NSDictionary)format;
- (NSDictionary)metadata;
- (NSDictionary)previewPhotoFormat;
- (NSDictionary)rawEmbeddedThumbnailPhotoFormat;
- (NSDictionary)rawFileFormat;
- (NSURL)livePhotoMovieFileURL;
- (OSType)rawPhotoPixelFormatType;
- (id)HEICSFileURL;
- (id)_initWithFormat:(id)a3 processedFileType:(id)a4 rawPixelFormatType:(unsigned int)a5 rawFileType:(id)a6 burstQualityCaptureEnabled:(BOOL)a7 uniqueID:(int64_t)a8 exceptionReason:(id *)a9;
- (id)_sanitizedLivePhotoMovieMetadataForArray:(id)a3 exceptionReason:(id *)a4;
- (id)adjustedPhotoFilters;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)livePhotoContentIdentifier;
- (id)livePhotoContentIdentifierForOriginalPhoto;
- (id)livePhotoMovieFileURLForOriginalPhoto;
- (id)livePhotoMovieMetadataForOriginalPhoto;
- (id)metadataForOriginalPhoto;
- (id)photoFilters;
- (id)semanticStyle;
- (id)spatialOverCaptureGroupIdentifier;
- (id)spatialOverCaptureGroupIdentifierForOriginalPhoto;
- (id)spatialOverCaptureLivePhotoContentIdentifier;
- (id)spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto;
- (id)spatialOverCaptureLivePhotoMovieFileURL;
- (id)spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto;
- (id)spatialOverCaptureLivePhotoMovieMetadata;
- (id)spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto;
- (id)spatialOverCaptureMetadata;
- (id)spatialOverCaptureMetadataForOriginalPhoto;
- (id)videoFileMetadata;
- (id)videoFileURL;
- (id)videoFormat;
- (int64_t)HDRMode;
- (int64_t)digitalFlashMode;
- (int64_t)uniqueID;
- (unint64_t)userInitiatedPhotoRequestTime;
- (unsigned)embeddedThumbnailFormatFourCC;
- (unsigned)formatFourCC;
- (unsigned)previewFormatFourCC;
- (unsigned)rawEmbeddedThumbnailFormatFourCC;
- (unsigned)shutterSound;
- (void)_setPhotoQualityPrioritization:(int64_t)a3;
- (void)_setPropertiesFromMomentCaptureSettings:(id)a3;
- (void)dealloc;
- (void)setAdjustedPhotoFilters:(id)a3;
- (void)setAutoContentAwareDistortionCorrectionEnabled:(BOOL)autoContentAwareDistortionCorrectionEnabled;
- (void)setAutoDeferredProcessingEnabled:(BOOL)a3;
- (void)setAutoDualCameraFusionEnabled:(BOOL)autoDualCameraFusionEnabled;
- (void)setAutoRedEyeReductionEnabled:(BOOL)autoRedEyeReductionEnabled;
- (void)setAutoSpatialOverCaptureEnabled:(BOOL)a3;
- (void)setAutoSpatialPhotoCaptureEnabled:(BOOL)a3;
- (void)setAutoStillImageStabilizationEnabled:(BOOL)autoStillImageStabilizationEnabled;
- (void)setAutoVirtualDeviceFusionEnabled:(BOOL)autoVirtualDeviceFusionEnabled;
- (void)setCameraCalibrationDataDeliveryEnabled:(BOOL)cameraCalibrationDataDeliveryEnabled;
- (void)setConstantColorEnabled:(BOOL)a3;
- (void)setConstantColorFallbackPhotoDeliveryEnabled:(BOOL)a3;
- (void)setDepthDataDeliveryEnabled:(BOOL)depthDataDeliveryEnabled;
- (void)setDepthDataFiltered:(BOOL)depthDataFiltered;
- (void)setDigitalFlashMode:(int64_t)a3;
- (void)setDualCameraDualPhotoDeliveryEnabled:(BOOL)dualCameraDualPhotoDeliveryEnabled;
- (void)setEV0PhotoDeliveryEnabled:(BOOL)a3;
- (void)setEmbeddedThumbnailPhotoFormat:(NSDictionary *)embeddedThumbnailPhotoFormat;
- (void)setEmbedsDepthDataInPhoto:(BOOL)embedsDepthDataInPhoto;
- (void)setEmbedsPortraitEffectsMatteInPhoto:(BOOL)embedsPortraitEffectsMatteInPhoto;
- (void)setEmbedsSemanticSegmentationMattesInPhoto:(BOOL)embedsSemanticSegmentationMattesInPhoto;
- (void)setEnabledSemanticSegmentationMatteTypes:(NSArray *)enabledSemanticSegmentationMatteTypes;
- (void)setFlashMode:(AVCaptureFlashMode)flashMode;
- (void)setHDRMode:(int64_t)a3;
- (void)setHEICSFileURL:(id)a3;
- (void)setHighResolutionPhotoEnabled:(BOOL)highResolutionPhotoEnabled;
- (void)setLivePhotoContentIdentifier:(id)a3;
- (void)setLivePhotoContentIdentifierForOriginalPhoto:(id)a3;
- (void)setLivePhotoMovieFileURL:(NSURL *)livePhotoMovieFileURL;
- (void)setLivePhotoMovieFileURLForOriginalPhoto:(id)a3;
- (void)setLivePhotoMovieMetadata:(NSArray *)livePhotoMovieMetadata;
- (void)setLivePhotoMovieMetadataForOriginalPhoto:(id)a3;
- (void)setLivePhotoVideoCodecType:(AVVideoCodecType)livePhotoVideoCodecType;
- (void)setMaxPhotoDimensions:(CMVideoDimensions)maxPhotoDimensions;
- (void)setMetadata:(NSDictionary *)metadata;
- (void)setPhotoFilters:(id)a3;
- (void)setPhotoQualityPrioritization:(AVCapturePhotoQualityPrioritization)photoQualityPrioritization;
- (void)setPortraitEffectsMatteDeliveryEnabled:(BOOL)portraitEffectsMatteDeliveryEnabled;
- (void)setPreviewPhotoFormat:(NSDictionary *)previewPhotoFormat;
- (void)setPreviewPhotoFormatDimensionsLimitedToDisplayDimensions:(BOOL)a3;
- (void)setProcessedPhotoZoomWithoutUpscalingEnabled:(BOOL)a3;
- (void)setRawEmbeddedThumbnailPhotoFormat:(NSDictionary *)rawEmbeddedThumbnailPhotoFormat;
- (void)setRawFileFormat:(id)a3;
- (void)setSemanticStyle:(id)a3;
- (void)setShutterSound:(unsigned int)a3;
- (void)setShutterSoundSuppressionEnabled:(BOOL)a3;
- (void)setSpatialOverCaptureLivePhotoMovieFileURL:(id)a3;
- (void)setSpatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto:(id)a3;
- (void)setSpatialOverCaptureLivePhotoMovieMetadata:(id)a3;
- (void)setSpatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto:(id)a3;
- (void)setSpatialOverCaptureMetadata:(id)a3;
- (void)setSpatialOverCaptureMetadataForOriginalPhoto:(id)a3;
- (void)setSquareCropEnabled:(BOOL)a3;
- (void)setTurboModeEnabled:(BOOL)a3;
- (void)setUserInitiatedPhotoRequestTime:(unint64_t)a3;
- (void)setVideoFileMetadata:(id)a3;
- (void)setVideoFileURL:(id)a3;
- (void)setVideoFormat:(id)a3;
- (void)setVirtualDeviceConstituentPhotoDeliveryEnabledDevices:(NSArray *)virtualDeviceConstituentPhotoDeliveryEnabledDevices;
@end

@implementation AVCapturePhotoSettings

- (void)setMetadata:(NSDictionary *)metadata
{
  if (metadata)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", +[AVCapturePhotoOutput validMetadataTopLevelCGImagePropertiesKeys](AVCapturePhotoOutput, "validMetadataTopLevelCGImagePropertiesKeys"));
    v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", -[NSDictionary allKeys](metadata, "allKeys"));
    [v6 minusSet:v5];
    if (![v6 count])
    {

      self->_internal->metadata = (NSDictionary *)[(NSDictionary *)metadata copy];
      return;
    }
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    v15 = v6;
    uint64_t v9 = AVMethodExceptionReasonWithObjectAndSelector();
    v10 = v7;
    uint64_t v11 = v8;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = AVMethodExceptionReasonWithObjectAndSelector();
    v10 = v12;
    uint64_t v11 = v13;
  }
  v14 = objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v9, 0, v15);
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v14);
  }
  NSLog(&cfstr_SuppressingExc.isa, v14);
}

- (int64_t)digitalFlashMode
{
  return self->_internal->digitalFlashMode;
}

- (AVCaptureFlashMode)flashMode
{
  return self->_internal->flashMode;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {
  }
  v4.receiver = self;
  v4.super_class = (Class)AVCapturePhotoSettings;
  [(AVCapturePhotoSettings *)&v4 dealloc];
}

- (int64_t)HDRMode
{
  return self->_internal->HDRMode;
}

- (AVCapturePhotoQualityPrioritization)photoQualityPrioritization
{
  return self->_internal->photoQualityPrioritization;
}

- (id)_initWithFormat:(id)a3 processedFileType:(id)a4 rawPixelFormatType:(unsigned int)a5 rawFileType:(id)a6 burstQualityCaptureEnabled:(BOOL)a7 uniqueID:(int64_t)a8 exceptionReason:(id *)a9
{
  uint64_t v12 = *(void *)&a5;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)AVCapturePhotoSettings;
  v43 = 0;
  v15 = [(AVCapturePhotoSettings *)&v42 init];
  if (!v15) {
    return v15;
  }
  v15->_internal = objc_alloc_init(AVCapturePhotoSettingsInternal);
  uint64_t v16 = *MEMORY[0x1E4F47D00];
  if (!a3)
  {
    if (v12)
    {
      a3 = 0;
      uint64_t v17 = 29;
      goto LABEL_6;
    }
    uint64_t v51 = *MEMORY[0x1E4F47D00];
    uint64_t v52 = *MEMORY[0x1E4F47D38];
    a3 = (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
  }
  uint64_t v17 = 28;
LABEL_6:
  uint64_t v18 = *MEMORY[0x1E4F47D40];
  v50[0] = v16;
  v50[1] = v18;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  uint64_t v49 = *MEMORY[0x1E4F24D70];
  if (+[AVCaptureVideoSettingsValidator validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:](AVCaptureVideoSettingsValidator, "validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:", a3, v17, [MEMORY[0x1E4F1C978] arrayWithObjects:&v49 count:1], 0, v19, 0, &v43))
  {
    unint64_t v20 = 0x1E4F1C000uLL;
    if (a3) {
      v15->_internal->format = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:a3];
    }
    if (!v12)
    {
LABEL_15:
      int v22 = [(AVCapturePhotoSettings *)v15 formatFourCC];
      if (!v22) {
        goto LABEL_29;
      }
      if (a4) {
        goto LABEL_28;
      }
      if (v22 <= 1111970368)
      {
        if (v22 != 875704422 && v22 != 875704438) {
          goto LABEL_28;
        }
      }
      else if (v22 != 1111970369)
      {
        if (v22 == 1752589105)
        {
          v23 = (id *)MEMORY[0x1E4F47BE8];
          goto LABEL_27;
        }
        if (v22 == 1785750887)
        {
          v23 = (id *)MEMORY[0x1E4F47BF8];
LABEL_27:
          a4 = *v23;
        }
LABEL_28:
        v15->_internal->processedFileType = (NSString *)a4;
LABEL_29:
        if (!a8) {
          a8 = +[AVCapturePhotoSettings uniqueID];
        }
        v15->_internal->uniqueID = a8;
        v15->_internal->turboModeEnabled = 0;
        BOOL v24 = +[AVCapturePhotoOutput isBayerRAWPixelFormat:v12];
        BOOL v25 = v24;
        if (v24) {
          uint64_t v26 = 1;
        }
        else {
          uint64_t v26 = 2;
        }
        v15->_internal->photoQualityPrioritization = v26;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v27 = +[AVCaptureDeviceDiscoverySession allVideoDevices];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v45;
          while (2)
          {
            for (uint64_t i = 0; i != v29; ++i)
            {
              if (*(void *)v45 != v30) {
                objc_enumerationMutation(v27);
              }
              if ([*(id *)(*((void *)&v44 + 1) + 8 * i) isAutoRedEyeReductionSupported])
              {
                char v32 = 1;
                goto LABEL_44;
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v53 count:16];
            if (v29) {
              continue;
            }
            break;
          }
          char v32 = 0;
LABEL_44:
          unint64_t v20 = 0x1E4F1C000;
        }
        else
        {
          char v32 = 0;
        }
        if (!a4) {
          char v32 = 0;
        }
        v15->_internal->autoRedEyeReductionEnabled = v32;
        v15->_internal->autoVirtualDeviceFusionEnabled = !v25;
        v15->_internal->burstQualityCaptureEnabled = a7;
        v15->_internal->embedsDepthDataInPhoto = 1;
        v15->_internal->depthDataFiltered = 1;
        v15->_internal->embedsPortraitEffectsMatteInPhoto = 1;
        v15->_internal->enabledSemanticSegmentationMatteTypes = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
        v15->_internal->embedsSemanticSegmentationMattesInPhoto = 1;
        v15->_internal->metadata = (NSDictionary *)objc_alloc_init(*(Class *)(v20 + 2536));
        v15->_internal->shutterSound = 1108;
        v15->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
        id v33 = (id)_initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason__sDefaultLivePhotoVideoCodecType;
        if (_initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason__sDefaultLivePhotoVideoCodecType) {
          goto LABEL_52;
        }
        v34 = objc_msgSend(+[AVCaptureDeviceDiscoverySession allVideoDevices](AVCaptureDeviceDiscoverySession, "allVideoDevices"), "firstObject");
        v35 = (id *)MEMORY[0x1E4F47D28];
        if (v34)
        {
          v36 = v34;
          uint64_t v37 = objc_msgSend((id)objc_msgSend(v34, "formats"), "lastObject");
          $2825F4736939C4A6D3AD43837233062D v38 = +[AVCapturePhotoOutput maxLivePhotoMovieDimensions];
          uint64_t v39 = *MEMORY[0x1E4F47C08];
          uint64_t v40 = *MEMORY[0x1E4F47D30];
          v48[0] = *v35;
          v48[1] = v40;
          id v33 = (id)objc_msgSend(+[AVCaptureOutput availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:](AVCaptureOutput, "availableVideoCodecTypesForSourceDevice:sourceFormat:outputDimensions:fileType:videoCodecTypesAllowList:", v36, v37, v38, v39, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v48, 2)), "firstObject");
          _initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason__sDefaultLivePhotoVideoCodecType = (uint64_t)v33;
          if (v33)
          {
LABEL_52:
            v15->_internal->livePhotoVideoCodecType = (NSString *)[v33 copy];
            v15->_internal->photoFilters = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
            v15->_internal->adjustedPhotoFilters = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
            v15->_internal->spatialOverCaptureMetadata = (NSDictionary *)objc_alloc_init(*(Class *)(v20 + 2536));
            v15->_internal->spatialOverCaptureMetadataForOriginalPhoto = (NSDictionary *)objc_alloc_init(*(Class *)(v20 + 2536));
            v15->_internal->previewPhotoFormatDimensionsLimitedToDisplayDimensions = 1;
            return v15;
          }
        }
        else
        {
          id v33 = (id)_initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason__sDefaultLivePhotoVideoCodecType;
          if (_initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason__sDefaultLivePhotoVideoCodecType) {
            goto LABEL_52;
          }
        }
        id v33 = *v35;
        _initWithFormat_processedFileType_rawPixelFormatType_rawFileType_burstQualityCaptureEnabled_uniqueID_exceptionReason__sDefaultLivePhotoVideoCodecType = (uint64_t)v33;
        goto LABEL_52;
      }
      v23 = (id *)MEMORY[0x1E4F47C10];
      goto LABEL_27;
    }
    if (+[AVCapturePhotoOutput isBayerRAWPixelFormat:](AVCapturePhotoOutput, "isBayerRAWPixelFormat:", v12)|| +[AVCapturePhotoOutput isAppleProRAWPixelFormat:v12])
    {
      v15->_internal->rawPhotoPixelFormatType = v12;
      id v21 = (id)*MEMORY[0x1E4F47BE0];
      if (a6) {
        id v21 = a6;
      }
      v15->_internal->rawFileType = (NSString *)v21;
      goto LABEL_15;
    }
    v43 = @"Unrecognized raw pixel format type";
  }
  if (a9) {
    *a9 = v43;
  }

  return 0;
}

- (unsigned)formatFourCC
{
  return ps_formatFourCCForSettingsDictionary(self->_internal->format);
}

- (NSArray)virtualDeviceConstituentPhotoDeliveryEnabledDevices
{
  return self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices;
}

- (OSType)rawPhotoPixelFormatType
{
  return self->_internal->rawPhotoPixelFormatType;
}

- (CMVideoDimensions)maxPhotoDimensions
{
  return (CMVideoDimensions)self->_internal->maxPhotoDimensions;
}

- (BOOL)isHighResolutionPhotoEnabled
{
  return self->_internal->highResolutionPhotoEnabled;
}

+ (AVCapturePhotoSettings)photoSettingsFromPhotoSettings:(AVCapturePhotoSettings *)photoSettings
{
  v3 = (void *)[(AVCapturePhotoSettings *)photoSettings copy];
  *(void *)(v3[1] + 40) = +[AVCapturePhotoSettings uniqueID];

  return (AVCapturePhotoSettings *)v3;
}

+ (int64_t)uniqueID
{
  return atomic_fetch_add_explicit(&uniqueID_sCurrentUniqueID, 1uLL, memory_order_relaxed) + 1;
}

+ (id)burstQualityPhotoSettings
{
  uint64_t v6 = 0;
  v2 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithFormat:0 processedFileType:0 rawPixelFormatType:0 rawFileType:0 burstQualityCaptureEnabled:1 uniqueID:0 exceptionReason:&v6];
  v3 = v2;
  if (v6)
  {
    objc_super v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
    return 0;
  }
  else
  {
    [v2 _setPhotoQualityPrioritization:1];
    [v3 setAutoVirtualDeviceFusionEnabled:0];
    return v3;
  }
}

+ (AVCapturePhotoSettings)photoSettingsWithFormat:(NSDictionary *)format
{
  uint64_t v7 = 0;
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithFormat:format processedFileType:0 rawPixelFormatType:0 rawFileType:0 burstQualityCaptureEnabled:0 uniqueID:0 exceptionReason:&v7];
  objc_super v4 = v3;
  if (!v7) {
    return (AVCapturePhotoSettings *)v3;
  }
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v5);
  }
  NSLog(&cfstr_SuppressingExc.isa, v5);
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v12 = 0;
  objc_super v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  internal = self->_internal;
  uint64_t v6 = (void *)[v4 _initWithFormat:internal->format processedFileType:internal->processedFileType rawPixelFormatType:internal->rawPhotoPixelFormatType rawFileType:internal->rawFileType burstQualityCaptureEnabled:internal->burstQualityCaptureEnabled uniqueID:internal->uniqueID exceptionReason:&v12];
  uint64_t v7 = v6;
  if (v12)
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
    return 0;
  }
  else
  {
    [v6 setFlashMode:self->_internal->flashMode];
    [v7 setAutoRedEyeReductionEnabled:self->_internal->autoRedEyeReductionEnabled];
    [v7 setDigitalFlashMode:self->_internal->digitalFlashMode];
    [v7 setConstantColorEnabled:self->_internal->constantColorEnabled];
    [v7 setConstantColorFallbackPhotoDeliveryEnabled:self->_internal->constantColorFallbackPhotoDeliveryEnabled];
    [v7 setShutterSoundSuppressionEnabled:self->_internal->shutterSoundSuppressionEnabled];
    [v7 setAutoSpatialPhotoCaptureEnabled:self->_internal->autoSpatialPhotoCaptureEnabled];
    uint64_t v9 = self->_internal;
    int64_t photoQualityPrioritization = v9->photoQualityPrioritization;
    if (v9->photoQualityPrioritizationIsSetByClient) {
      [v7 setPhotoQualityPrioritization:photoQualityPrioritization];
    }
    else {
      [v7 _setPhotoQualityPrioritization:photoQualityPrioritization];
    }
    [v7 setAutoVirtualDeviceFusionEnabled:self->_internal->autoVirtualDeviceFusionEnabled];
    [v7 setVirtualDeviceConstituentPhotoDeliveryEnabledDevices:self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices];
    [v7 setHighResolutionPhotoEnabled:self->_internal->highResolutionPhotoEnabled];
    [v7 setDepthDataDeliveryEnabled:self->_internal->depthDataDeliveryEnabled];
    [v7 setEmbedsDepthDataInPhoto:self->_internal->embedsDepthDataInPhoto];
    [v7 setDepthDataFiltered:self->_internal->depthDataFiltered];
    [v7 setCameraCalibrationDataDeliveryEnabled:self->_internal->cameraCalibrationDataDeliveryEnabled];
    [v7 setPortraitEffectsMatteDeliveryEnabled:self->_internal->portraitEffectsMatteDeliveryEnabled];
    [v7 setEmbedsPortraitEffectsMatteInPhoto:self->_internal->embedsPortraitEffectsMatteInPhoto];
    [v7 setEnabledSemanticSegmentationMatteTypes:self->_internal->enabledSemanticSegmentationMatteTypes];
    [v7 setEmbedsSemanticSegmentationMattesInPhoto:self->_internal->embedsSemanticSegmentationMattesInPhoto];
    [v7 setMetadata:self->_internal->metadata];
    [v7 setLivePhotoMovieFileURL:self->_internal->livePhotoMovieFileURL];
    [v7 setLivePhotoVideoCodecType:self->_internal->livePhotoVideoCodecType];
    [v7 setLivePhotoMovieMetadata:self->_internal->livePhotoMovieMetadata];
    [v7 setPreviewPhotoFormat:self->_internal->previewPhotoFormat];
    [v7 setEmbeddedThumbnailPhotoFormat:self->_internal->embeddedThumbnailPhotoFormat];
    [v7 setRawFileFormat:self->_internal->rawFileFormat];
    [v7 setRawEmbeddedThumbnailPhotoFormat:self->_internal->rawEmbeddedThumbnailPhotoFormat];
    [v7 setHDRMode:self->_internal->HDRMode];
    [v7 setEV0PhotoDeliveryEnabled:self->_internal->EV0PhotoDeliveryEnabled];
    [v7 setLivePhotoMovieFileURLForOriginalPhoto:self->_internal->livePhotoMovieFileURLForOriginalPhoto];
    [v7 setLivePhotoMovieMetadataForOriginalPhoto:self->_internal->livePhotoMovieMetadataForOriginalPhoto];
    [v7 setPhotoFilters:self->_internal->photoFilters];
    [v7 setAdjustedPhotoFilters:self->_internal->adjustedPhotoFilters];
    [v7 setHEICSFileURL:self->_internal->HEICSFileURL];
    [v7 setVideoFileURL:self->_internal->videoFileURL];
    [v7 setVideoFormat:self->_internal->videoFormat];
    [v7 setVideoFileMetadata:self->_internal->videoFileMetadata];
    [v7 setAutoSpatialOverCaptureEnabled:self->_internal->autoSpatialOverCaptureEnabled];
    [v7 setSpatialOverCaptureMetadata:self->_internal->spatialOverCaptureMetadata];
    [v7 setSpatialOverCaptureLivePhotoMovieFileURL:self->_internal->spatialOverCaptureLivePhotoMovieFileURL];
    [v7 setSpatialOverCaptureLivePhotoMovieMetadata:self->_internal->spatialOverCaptureLivePhotoMovieMetadata];
    *(void *)(v7[1] + 336) = [(NSString *)self->_internal->spatialOverCaptureLivePhotoContentIdentifier copy];
    *(void *)(v7[1] + 344) = [(NSString *)self->_internal->spatialOverCaptureGroupIdentifier copy];
    [v7 setSpatialOverCaptureMetadataForOriginalPhoto:self->_internal->spatialOverCaptureMetadataForOriginalPhoto];
    [v7 setSpatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto:self->_internal->spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto];
    [v7 setSpatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto:self->_internal->spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto];
    *(void *)(v7[1] + 376) = [(NSString *)self->_internal->spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto copy];
    *(void *)(v7[1] + 384) = [(NSString *)self->_internal->spatialOverCaptureGroupIdentifierForOriginalPhoto copy];
    [v7 setProcessedPhotoZoomWithoutUpscalingEnabled:self->_internal->processedPhotoZoomWithoutUpscalingEnabled];
    [v7 setAutoContentAwareDistortionCorrectionEnabled:self->_internal->autoContentAwareDistortionCorrectionEnabled];
    *(unsigned char *)(v7[1] + 264) = self->_internal->autoDeferredPhotoDeliveryEnabled;
    [v7 setSquareCropEnabled:self->_internal->squareCropEnabled];
    [v7 setTurboModeEnabled:self->_internal->turboModeEnabled];
    [v7 setUserInitiatedPhotoRequestTime:self->_internal->userInitiatedPhotoRequestTime];
    [v7 setSemanticStyle:self->_internal->semanticStyle];
    [v7 setPreviewPhotoFormatDimensionsLimitedToDisplayDimensions:self->_internal->previewPhotoFormatDimensionsLimitedToDisplayDimensions];
    objc_msgSend(v7, "setLivePhotoContentIdentifier:", -[AVCapturePhotoSettings livePhotoContentIdentifier](self, "livePhotoContentIdentifier"));
    objc_msgSend(v7, "setLivePhotoContentIdentifierForOriginalPhoto:", -[AVCapturePhotoSettings livePhotoContentIdentifierForOriginalPhoto](self, "livePhotoContentIdentifierForOriginalPhoto"));
    [v7 setShutterSound:self->_internal->shutterSound];
    *($470D365275581EF16070F5A11344F73E *)(v7[1] + 412) = self->_internal->maxPhotoDimensions;
  }
  return v7;
}

- (void)setFlashMode:(AVCaptureFlashMode)flashMode
{
  self->_internal->flashMode = flashMode;
}

- (void)setMaxPhotoDimensions:(CMVideoDimensions)maxPhotoDimensions
{
  self->_internal->maxPhotoDimensions = ($470D365275581EF16070F5A11344F73E)maxPhotoDimensions;
}

- (void)setHDRMode:(int64_t)a3
{
  self->_internal->HDRMode = a3;
}

- (void)setHighResolutionPhotoEnabled:(BOOL)highResolutionPhotoEnabled
{
  self->_internal->highResolutionPhotoEnabled = highResolutionPhotoEnabled;
  [(AVCapturePhotoSettings *)self setMaxPhotoDimensions:0];
}

- (void)setLivePhotoMovieFileURLForOriginalPhoto:(id)a3
{
  self->_internal->livePhotoMovieFileURLForOriginalPhoto = (NSURL *)[a3 copy];
}

- (void)setAutoVirtualDeviceFusionEnabled:(BOOL)autoVirtualDeviceFusionEnabled
{
  BOOL v3 = autoVirtualDeviceFusionEnabled;
  if (+[AVCapturePhotoOutput isBayerRAWPixelFormat:self->_internal->rawPhotoPixelFormatType])
  {
    BOOL v5 = !v3;
  }
  else
  {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (self->_internal->autoVirtualDeviceFusionEnabled != v3)
    {
      [(AVCapturePhotoSettings *)self willChangeValueForKey:@"autoDualCameraFusionEnabled"];
      self->_internal->autoVirtualDeviceFusionEnabled = v3;
      [(AVCapturePhotoSettings *)self didChangeValueForKey:@"autoDualCameraFusionEnabled"];
    }
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (void)setLivePhotoMovieMetadata:(NSArray *)livePhotoMovieMetadata
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  id v5 = [(AVCapturePhotoSettings *)self _sanitizedLivePhotoMovieMetadataForArray:livePhotoMovieMetadata exceptionReason:&v19];
  if (v19)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    uint64_t v7 = v5;

    self->_internal->livePhotoMovieMetadata = (NSArray *)v7;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [(NSArray *)livePhotoMovieMetadata countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      uint64_t v11 = *MEMORY[0x1E4F47CB8];
      uint64_t v12 = *MEMORY[0x1E4F47CC8];
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(livePhotoMovieMetadata);
          }
          v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v14, "keySpace"), "isEqual:", v11)
            && objc_msgSend((id)objc_msgSend(v14, "key"), "isEqual:", v12))
          {

            self->_internal->livePhotoContentIdentifier = (NSString *)objc_msgSend((id)objc_msgSend(v14, "value"), "copy");
            return;
          }
        }
        uint64_t v9 = [(NSArray *)livePhotoMovieMetadata countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
}

- (void)setLivePhotoMovieMetadataForOriginalPhoto:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  id v5 = [(AVCapturePhotoSettings *)self _sanitizedLivePhotoMovieMetadataForArray:a3 exceptionReason:&v19];
  if (v19)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    uint64_t v7 = v5;

    self->_internal->livePhotoMovieMetadataForOriginalPhoto = (NSArray *)v7;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      uint64_t v11 = *MEMORY[0x1E4F47CB8];
      uint64_t v12 = *MEMORY[0x1E4F47CC8];
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(a3);
          }
          v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v14, "keySpace"), "isEqual:", v11)
            && objc_msgSend((id)objc_msgSend(v14, "key"), "isEqual:", v12))
          {

            self->_internal->livePhotoContentIdentifierForOriginalPhoto = (NSString *)objc_msgSend((id)objc_msgSend(v14, "value"), "copy");
            return;
          }
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
}

- (id)_sanitizedLivePhotoMovieMetadataForArray:(id)a3 exceptionReason:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v30;
    uint64_t v9 = @"Array must only contain AVMetadataItems";
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(a3);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_35:
          if (!a4) {
            return 0;
          }
LABEL_36:
          id result = 0;
          *a4 = v9;
          return result;
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v7);
  }
  uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  if (([v11 isEqualToString:0x1EF4D53D0] & 1) != 0
    || ([v11 isEqualToString:0x1EF4D6410] & 1) != 0
    || ([v11 isEqualToString:0x1EF4D6430] & 1) != 0)
  {
    LOBYTE(v24) = 0;
  }
  else
  {
    int v24 = [v11 isEqualToString:@"com.apple.mobileslideshow"] ^ 1;
  }
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count", a4));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v13 = [a3 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (!v13) {
    return (id)[MEMORY[0x1E4F1C978] arrayWithArray:v12];
  }
  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v26;
  uint64_t v16 = *MEMORY[0x1E4F47CB8];
  uint64_t v17 = *MEMORY[0x1E4F47CC8];
  uint64_t v18 = *MEMORY[0x1E4F47CD0];
  uint64_t v19 = *MEMORY[0x1E4F47CC0];
LABEL_16:
  uint64_t v20 = 0;
  while (1)
  {
    if (*(void *)v26 != v15) {
      objc_enumerationMutation(a3);
    }
    uint64_t v21 = *(void **)(*((void *)&v25 + 1) + 8 * v20);
    if (objc_msgSend((id)objc_msgSend(v21, "keySpace"), "isEqual:", v16))
    {
      if (objc_msgSend((id)objc_msgSend(v21, "key"), "isEqual:", v17)) {
        break;
      }
    }
    if (objc_msgSend((id)objc_msgSend(v21, "keySpace"), "isEqual:", v16)
      && (objc_msgSend((id)objc_msgSend(v21, "key"), "isEqual:", v18) & 1) != 0)
    {
      uint64_t v9 = @"AVMetadataKeySpaceQuickTimeMetadata/AVMetadataQuickTimeMetadataKeySpatialOverCaptureGroupIdentifier must not be specified";
      a4 = v23;
      if (v23) {
        goto LABEL_36;
      }
      return 0;
    }
    if (objc_msgSend((id)objc_msgSend(v21, "keySpace"), "isEqual:", v16)
      && (objc_msgSend((id)objc_msgSend(v21, "key"), "isEqual:", v19) & 1) != 0)
    {
      uint64_t v9 = @"AVMetadataKeySpaceQuickTimeMetadata/AVMetadataQuickTimeMetadataKeyContainsSpatialOverCaptureContent must not be specified";
      a4 = v23;
      goto LABEL_35;
    }
    objc_msgSend(v12, "addObject:", (id)objc_msgSend(v21, "copy"));
LABEL_28:
    if (v14 == ++v20)
    {
      uint64_t v14 = [a3 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v14) {
        goto LABEL_16;
      }
      return (id)[MEMORY[0x1E4F1C978] arrayWithArray:v12];
    }
  }
  if ((v24 & 1) == 0) {
    goto LABEL_28;
  }
  a4 = v23;
  uint64_t v9 = @"AVMetadataKeySpaceQuickTimeMetadata/AVMetadataQuickTimeMetadataKeyContentIdentifier must not be specified";
  if (v23) {
    goto LABEL_36;
  }
  return 0;
}

- (void)setEmbedsPortraitEffectsMatteInPhoto:(BOOL)embedsPortraitEffectsMatteInPhoto
{
  self->_internal->embedsPortraitEffectsMatteInPhoto = embedsPortraitEffectsMatteInPhoto;
}

- (void)setEmbedsDepthDataInPhoto:(BOOL)embedsDepthDataInPhoto
{
  self->_internal->embedsDepthDataInPhoto = embedsDepthDataInPhoto;
}

- (void)setDigitalFlashMode:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    BOOL v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
  }
  else
  {
    self->_internal->digitalFlashMode = a3;
  }
}

- (void)setUserInitiatedPhotoRequestTime:(unint64_t)a3
{
  self->_internal->userInitiatedPhotoRequestTime = a3;
}

- (void)setSquareCropEnabled:(BOOL)a3
{
  self->_internal->squareCropEnabled = a3;
}

- (void)setShutterSound:(unsigned int)a3
{
  self->_internal->shutterSound = a3;
}

- (void)setSemanticStyle:(id)a3
{
  self->_internal->semanticStyle = (AVSemanticStyle *)a3;
}

- (void)setPreviewPhotoFormatDimensionsLimitedToDisplayDimensions:(BOOL)a3
{
  self->_internal->previewPhotoFormatDimensionsLimitedToDisplayDimensions = a3;
}

- (void)setPreviewPhotoFormat:(NSDictionary *)previewPhotoFormat
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v5 = *MEMORY[0x1E4F24E10];
  v8[0] = *MEMORY[0x1E4F24D70];
  v8[1] = v5;
  v8[2] = *MEMORY[0x1E4F24D08];
  if (+[AVCaptureVideoSettingsValidator validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:](AVCaptureVideoSettingsValidator, "validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:", previewPhotoFormat, 5, [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3], -[AVCapturePhotoSettings availablePreviewPhotoPixelFormatTypes](self, "availablePreviewPhotoPixelFormatTypes"), 0, 0, &v7))
  {

    self->_internal->previewPhotoFormat = (NSDictionary *)[(NSDictionary *)previewPhotoFormat copy];
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (NSArray)availablePreviewPhotoPixelFormatTypes
{
  unsigned int v2 = [(AVCapturePhotoSettings *)self formatFourCC];
  BOOL v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  objc_super v4 = v3;
  if (v2 == 875704438) {
    uint64_t v5 = &unk_1EF4FA1A8;
  }
  else {
    uint64_t v5 = &unk_1EF4FA1C0;
  }
  if (v2 == 875704438) {
    uint64_t v6 = &unk_1EF4FA1C0;
  }
  else {
    uint64_t v6 = &unk_1EF4FA1A8;
  }
  [(NSArray *)v3 addObject:v5];
  [(NSArray *)v4 addObject:v6];
  [(NSArray *)v4 addObject:&unk_1EF4FA1D8];
  return v4;
}

- (void)setPortraitEffectsMatteDeliveryEnabled:(BOOL)portraitEffectsMatteDeliveryEnabled
{
  self->_internal->portraitEffectsMatteDeliveryEnabled = portraitEffectsMatteDeliveryEnabled;
}

- (void)setLivePhotoMovieFileURL:(NSURL *)livePhotoMovieFileURL
{
  self->_internal->livePhotoMovieFileURL = (NSURL *)[(NSURL *)livePhotoMovieFileURL copy];
}

- (void)setEmbedsSemanticSegmentationMattesInPhoto:(BOOL)embedsSemanticSegmentationMattesInPhoto
{
  self->_internal->embedsSemanticSegmentationMattesInPhoto = embedsSemanticSegmentationMattesInPhoto;
}

- (void)setEmbeddedThumbnailPhotoFormat:(NSDictionary *)embeddedThumbnailPhotoFormat
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v5 = *MEMORY[0x1E4F47DB0];
  v8[0] = *MEMORY[0x1E4F47D00];
  v8[1] = v5;
  v8[2] = *MEMORY[0x1E4F47D60];
  if (+[AVCaptureVideoSettingsValidator validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:](AVCaptureVideoSettingsValidator, "validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:", embeddedThumbnailPhotoFormat, 25, 0, 0, [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3], -[AVCapturePhotoSettings availableEmbeddedThumbnailPhotoCodecTypes](self, "availableEmbeddedThumbnailPhotoCodecTypes"), &v7))
  {

    self->_internal->embeddedThumbnailPhotoFormat = (NSDictionary *)[(NSDictionary *)embeddedThumbnailPhotoFormat copy];
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (NSArray)availableEmbeddedThumbnailPhotoCodecTypes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  char BoolAnswer = AVGestaltGetBoolAnswer(@"AVGQCapturePhotoSettingsSupportRawEmbeddedThumbnailFormat");
  internal = self->_internal;
  if ((BoolAnswer & 1) == 0 && internal->rawFileType)
  {
    uint64_t v15 = *MEMORY[0x1E4F47D38];
    uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
    uint64_t v6 = &v15;
LABEL_7:
    uint64_t v8 = 1;
    return (NSArray *)objc_msgSend(v5, "arrayWithObjects:count:", v6, v8, v11, v12, v13, v14, v15, v16);
  }
  processedFileType = internal->processedFileType;
  if (processedFileType)
  {
    if ([(NSString *)processedFileType isEqual:*MEMORY[0x1E4F47BF8]])
    {
      uint64_t v14 = *MEMORY[0x1E4F47D38];
      uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v6 = &v14;
      goto LABEL_7;
    }
    if (([(NSString *)self->_internal->processedFileType isEqual:*MEMORY[0x1E4F47BE8]] & 1) != 0
      || [(NSString *)self->_internal->processedFileType isEqual:*MEMORY[0x1E4F47BF0]])
    {
      uint64_t v9 = *MEMORY[0x1E4F47D38];
      uint64_t v12 = *MEMORY[0x1E4F47D30];
      uint64_t v13 = v9;
      uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v6 = &v12;
      uint64_t v8 = 2;
      return (NSArray *)objc_msgSend(v5, "arrayWithObjects:count:", v6, v8, v11, v12, v13, v14, v15, v16);
    }
    if ([(NSString *)self->_internal->processedFileType isEqual:*MEMORY[0x1E4F47C10]])
    {
      uint64_t v11 = *MEMORY[0x1E4F47D38];
      uint64_t v5 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v6 = &v11;
      goto LABEL_7;
    }
  }
  return (NSArray *)MEMORY[0x1E4F1CBF0];
}

- (void)setEV0PhotoDeliveryEnabled:(BOOL)a3
{
  self->_internal->EV0PhotoDeliveryEnabled = a3;
}

- (void)setDepthDataFiltered:(BOOL)depthDataFiltered
{
  self->_internal->depthDataFiltered = depthDataFiltered;
}

- (void)setDepthDataDeliveryEnabled:(BOOL)depthDataDeliveryEnabled
{
  self->_internal->depthDataDeliveryEnabled = depthDataDeliveryEnabled;
}

- (void)setAutoContentAwareDistortionCorrectionEnabled:(BOOL)autoContentAwareDistortionCorrectionEnabled
{
  self->_internal->autoContentAwareDistortionCorrectionEnabled = autoContentAwareDistortionCorrectionEnabled;
}

- (void)setVirtualDeviceConstituentPhotoDeliveryEnabledDevices:(NSArray *)virtualDeviceConstituentPhotoDeliveryEnabledDevices
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (virtualDeviceConstituentPhotoDeliveryEnabledDevices)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(NSArray *)virtualDeviceConstituentPhotoDeliveryEnabledDevices countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(virtualDeviceConstituentPhotoDeliveryEnabledDevices);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * v8) isVirtualDevice])
          {
            uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
            uint64_t v11 = *MEMORY[0x1E4F1C3C8];
            goto LABEL_16;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [(NSArray *)virtualDeviceConstituentPhotoDeliveryEnabledDevices countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    uint64_t v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", virtualDeviceConstituentPhotoDeliveryEnabledDevices), "count");
    if (v9 == [(NSArray *)virtualDeviceConstituentPhotoDeliveryEnabledDevices count])
    {
      if (([(NSArray *)self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices isEqual:virtualDeviceConstituentPhotoDeliveryEnabledDevices] & 1) == 0)
      {
        [(AVCapturePhotoSettings *)self willChangeValueForKey:@"dualCameraDualPhotoDeliveryEnabled"];

        self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:virtualDeviceConstituentPhotoDeliveryEnabledDevices];
        [(AVCapturePhotoSettings *)self didChangeValueForKey:@"dualCameraDualPhotoDeliveryEnabled"];
      }
      return;
    }
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
  }
LABEL_16:
  uint64_t v12 = (void *)[v10 exceptionWithName:v11 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v12);
  }
  NSLog(&cfstr_SuppressingExc.isa, v12);
}

- (void)setVideoFormat:(id)a3
{
  videoFormat = self->_internal->videoFormat;
  if (videoFormat != a3)
  {

    self->_internal->videoFormat = (NSDictionary *)[a3 copy];
  }
}

- (void)setVideoFileURL:(id)a3
{
  videoFileURL = self->_internal->videoFileURL;
  if (videoFileURL != a3)
  {

    self->_internal->videoFileURL = (NSURL *)[a3 copy];
  }
}

- (void)setVideoFileMetadata:(id)a3
{
  videoFileMetadata = self->_internal->videoFileMetadata;
  if (videoFileMetadata != a3)
  {

    self->_internal->videoFileMetadata = (NSArray *)[a3 copy];
  }
}

- (void)setTurboModeEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (a3 && internal->autoSpatialOverCaptureEnabled)
  {
    objc_super v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else
  {
    internal->turboModeEnabled = a3;
  }
}

- (void)setSpatialOverCaptureMetadataForOriginalPhoto:(id)a3
{
  if (a3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", +[AVCapturePhotoOutput validMetadataTopLevelCGImagePropertiesKeys](AVCapturePhotoOutput, "validMetadataTopLevelCGImagePropertiesKeys"));
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a3, "allKeys"));
    [v6 minusSet:v5];
    if (![v6 count])
    {

      self->_internal->spatialOverCaptureMetadataForOriginalPhoto = (NSDictionary *)[a3 copy];
      return;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    long long v15 = v6;
    uint64_t v9 = AVMethodExceptionReasonWithObjectAndSelector();
    uint64_t v10 = v7;
    uint64_t v11 = v8;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = AVMethodExceptionReasonWithObjectAndSelector();
    uint64_t v10 = v12;
    uint64_t v11 = v13;
  }
  long long v14 = objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v9, 0, v15);
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v14);
  }
  NSLog(&cfstr_SuppressingExc.isa, v14);
}

- (void)setSpatialOverCaptureMetadata:(id)a3
{
  if (a3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", +[AVCapturePhotoOutput validMetadataTopLevelCGImagePropertiesKeys](AVCapturePhotoOutput, "validMetadataTopLevelCGImagePropertiesKeys"));
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithArray:", objc_msgSend(a3, "allKeys"));
    [v6 minusSet:v5];
    if (![v6 count])
    {

      self->_internal->spatialOverCaptureMetadata = (NSDictionary *)[a3 copy];
      return;
    }
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C3C8];
    long long v15 = v6;
    uint64_t v9 = AVMethodExceptionReasonWithObjectAndSelector();
    uint64_t v10 = v7;
    uint64_t v11 = v8;
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    uint64_t v9 = AVMethodExceptionReasonWithObjectAndSelector();
    uint64_t v10 = v12;
    uint64_t v11 = v13;
  }
  long long v14 = objc_msgSend(v10, "exceptionWithName:reason:userInfo:", v11, v9, 0, v15);
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v14);
  }
  NSLog(&cfstr_SuppressingExc.isa, v14);
}

- (void)setSpatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  id v5 = [(AVCapturePhotoSettings *)self _sanitizedLivePhotoMovieMetadataForArray:a3 exceptionReason:&v19];
  if (v19)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    uint64_t v7 = v5;

    self->_internal->spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto = (NSArray *)v7;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      uint64_t v11 = *MEMORY[0x1E4F47CB8];
      uint64_t v12 = *MEMORY[0x1E4F47CC8];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(a3);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v14, "keySpace"), "isEqual:", v11)
            && objc_msgSend((id)objc_msgSend(v14, "key"), "isEqual:", v12))
          {

            self->_internal->spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto = (NSString *)objc_msgSend((id)objc_msgSend(v14, "value"), "copy");
          }
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }
  }
}

- (void)setSpatialOverCaptureLivePhotoMovieMetadata:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  id v5 = [(AVCapturePhotoSettings *)self _sanitizedLivePhotoMovieMetadataForArray:a3 exceptionReason:&v19];
  if (v19)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
  else
  {
    uint64_t v7 = v5;

    self->_internal->spatialOverCaptureLivePhotoMovieMetadata = (NSArray *)v7;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      uint64_t v11 = *MEMORY[0x1E4F47CB8];
      uint64_t v12 = *MEMORY[0x1E4F47CC8];
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(a3);
          }
          long long v14 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v14, "keySpace"), "isEqual:", v11)
            && objc_msgSend((id)objc_msgSend(v14, "key"), "isEqual:", v12))
          {

            self->_internal->spatialOverCaptureLivePhotoContentIdentifier = (NSString *)objc_msgSend((id)objc_msgSend(v14, "value"), "copy");
            return;
          }
        }
        uint64_t v9 = [a3 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
}

- (void)setSpatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto:(id)a3
{
  self->_internal->spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto = (NSURL *)[a3 copy];
}

- (void)setSpatialOverCaptureLivePhotoMovieFileURL:(id)a3
{
  self->_internal->spatialOverCaptureLivePhotoMovieFileURL = (NSURL *)[a3 copy];
}

- (void)setShutterSoundSuppressionEnabled:(BOOL)a3
{
  self->_internal->shutterSoundSuppressionEnabled = a3;
}

- (void)setRawFileFormat:(id)a3
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    goto LABEL_8;
  }
  uint64_t v13 = 0;
  uint64_t v5 = *MEMORY[0x1E4F47CE8];
  uint64_t v6 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F47CE8]];
  if (!v6)
  {
LABEL_7:
    v15[0] = *MEMORY[0x1E4F47D38];
    v15[1] = AVStringForOSType();
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
    uint64_t v9 = *MEMORY[0x1E4F47D88];
    v14[0] = *MEMORY[0x1E4F47D00];
    v14[1] = v9;
    v14[2] = v5;
    if (!+[AVCaptureVideoSettingsValidator validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:](AVCaptureVideoSettingsValidator, "validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:", a3, 25, 0, 0, [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3], v8, &v13))
    {
      uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v11 = *MEMORY[0x1E4F1C3C8];
      goto LABEL_11;
    }
LABEL_8:

    self->_internal->rawFileFormat = (NSDictionary *)[a3 copy];
    return;
  }
  uint64_t v7 = (void *)v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((int)[v7 intValue] < 8 || (int)objc_msgSend(v7, "intValue") >= 17)
    {
      [NSString stringWithFormat:@"AVVideoAppleProRAWBitDepthKey value (%@) not supported. Expected a value in the range of 8-16.", v7];
      goto LABEL_9;
    }
    goto LABEL_7;
  }
LABEL_9:
  uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v11 = *MEMORY[0x1E4F1C3C8];
LABEL_11:
  uint64_t v12 = (void *)[v10 exceptionWithName:v11 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v12);
  }
  NSLog(&cfstr_SuppressingExc.isa, v12);
}

- (void)setRawEmbeddedThumbnailPhotoFormat:(NSDictionary *)rawEmbeddedThumbnailPhotoFormat
{
  v8[3] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  uint64_t v5 = *MEMORY[0x1E4F47DB0];
  v8[0] = *MEMORY[0x1E4F47D00];
  v8[1] = v5;
  v8[2] = *MEMORY[0x1E4F47D60];
  if (+[AVCaptureVideoSettingsValidator validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:](AVCaptureVideoSettingsValidator, "validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:", rawEmbeddedThumbnailPhotoFormat, 25, 0, 0, [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:3], -[AVCapturePhotoSettings availableRawEmbeddedThumbnailPhotoCodecTypes](self, "availableRawEmbeddedThumbnailPhotoCodecTypes"), &v7))
  {

    self->_internal->rawEmbeddedThumbnailPhotoFormat = (NSDictionary *)[(NSDictionary *)rawEmbeddedThumbnailPhotoFormat copy];
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (void)setProcessedPhotoZoomWithoutUpscalingEnabled:(BOOL)a3
{
  self->_internal->processedPhotoZoomWithoutUpscalingEnabled = a3;
}

- (void)setPhotoFilters:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
LABEL_15:
    uint64_t v11 = (void *)[v9 exceptionWithName:v10 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v11);
    }
    NSLog(&cfstr_SuppressingExc.isa, v11);
    return;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v10 = *MEMORY[0x1E4F1C3C8];
          goto LABEL_15;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  if (([a3 isEqual:self->_internal->photoFilters] & 1) == 0)
  {
    if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementFilterRendering))
    {

      self->_internal->photoFilters = (NSArray *)[a3 copy];
      return;
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_15;
  }
}

- (void)setLivePhotoVideoCodecType:(AVVideoCodecType)livePhotoVideoCodecType
{
  if (livePhotoVideoCodecType)
  {

    self->_internal->livePhotoVideoCodecType = (NSString *)[(NSString *)livePhotoVideoCodecType copy];
  }
  else
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

- (void)setLivePhotoContentIdentifierForOriginalPhoto:(id)a3
{
  self->_internal->livePhotoContentIdentifierForOriginalPhoto = (NSString *)[a3 copy];
}

- (void)setLivePhotoContentIdentifier:(id)a3
{
  self->_internal->livePhotoContentIdentifier = (NSString *)[a3 copy];
}

- (void)setHEICSFileURL:(id)a3
{
  HEICSFileURL = self->_internal->HEICSFileURL;
  if (HEICSFileURL != a3)
  {

    self->_internal->HEICSFileURL = (NSURL *)[a3 copy];
  }
}

- (void)setEnabledSemanticSegmentationMatteTypes:(NSArray *)enabledSemanticSegmentationMatteTypes
{
  if (enabledSemanticSegmentationMatteTypes)
  {

    self->_internal->enabledSemanticSegmentationMatteTypes = (NSArray *)[(NSArray *)enabledSemanticSegmentationMatteTypes copy];
  }
  else
  {
    uint64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

- (void)setConstantColorFallbackPhotoDeliveryEnabled:(BOOL)a3
{
  self->_internal->constantColorFallbackPhotoDeliveryEnabled = a3;
}

- (void)setConstantColorEnabled:(BOOL)a3
{
  self->_internal->constantColorEnabled = a3;
}

- (void)setCameraCalibrationDataDeliveryEnabled:(BOOL)cameraCalibrationDataDeliveryEnabled
{
  self->_internal->cameraCalibrationDataDeliveryEnabled = cameraCalibrationDataDeliveryEnabled;
}

- (void)setAutoSpatialPhotoCaptureEnabled:(BOOL)a3
{
  self->_internal->autoSpatialPhotoCaptureEnabled = a3;
}

- (void)setAutoSpatialOverCaptureEnabled:(BOOL)a3
{
  internal = self->_internal;
  if (a3 && internal->turboModeEnabled)
  {
    objc_super v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v4);
    }
    NSLog(&cfstr_SuppressingExc.isa, v4);
  }
  else
  {
    internal->autoSpatialOverCaptureEnabled = a3;
  }
}

- (void)setAutoRedEyeReductionEnabled:(BOOL)autoRedEyeReductionEnabled
{
  self->_internal->autoRedEyeReductionEnabled = autoRedEyeReductionEnabled;
}

- (void)setAdjustedPhotoFilters:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
LABEL_15:
    uint64_t v11 = (void *)[v9 exceptionWithName:v10 reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v11);
    }
    NSLog(&cfstr_SuppressingExc.isa, v11);
    return;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
          uint64_t v10 = *MEMORY[0x1E4F1C3C8];
          goto LABEL_15;
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  if (([a3 isEqual:self->_internal->adjustedPhotoFilters] & 1) == 0)
  {
    if (AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementFilterRendering))
    {

      self->_internal->adjustedPhotoFilters = (NSArray *)[a3 copy];
      return;
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_15;
  }
}

- (id)livePhotoContentIdentifier
{
  id result = self->_internal->livePhotoContentIdentifier;
  if (!result)
  {
    self->_internal->livePhotoContentIdentifier = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    return self->_internal->livePhotoContentIdentifier;
  }
  return result;
}

- (id)livePhotoContentIdentifierForOriginalPhoto
{
  id result = self->_internal->livePhotoContentIdentifierForOriginalPhoto;
  if (!result)
  {
    self->_internal->livePhotoContentIdentifierForOriginalPhoto = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    return self->_internal->livePhotoContentIdentifierForOriginalPhoto;
  }
  return result;
}

- (NSArray)availableRawEmbeddedThumbnailPhotoCodecTypes
{
  v3[1] = *MEMORY[0x1E4F143B8];
  if (!self->_internal->rawFileType) {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  v3[0] = *MEMORY[0x1E4F47D38];
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (void)_setPhotoQualityPrioritization:(int64_t)a3
{
  self->_internal->int64_t photoQualityPrioritization = a3;
}

- (void)setPhotoQualityPrioritization:(AVCapturePhotoQualityPrioritization)photoQualityPrioritization
{
  BOOL v5 = +[AVCapturePhotoOutput isBayerRAWPixelFormat:self->_internal->rawPhotoPixelFormatType];
  if (photoQualityPrioritization >= AVCapturePhotoQualityPrioritizationBalanced && v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    uint64_t v8 = AVMethodExceptionReasonWithObjectAndSelector();
    uint64_t v9 = v6;
    uint64_t v10 = v7;
  }
  else
  {
    if ((unint64_t)(photoQualityPrioritization - 1) < 3)
    {
      self->_internal->int64_t photoQualityPrioritization = photoQualityPrioritization;
      self->_internal->photoQualityPrioritizationIsSetByClient = 1;
      return;
    }
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    AVCapturePhotoQualityPrioritization v14 = photoQualityPrioritization;
    uint64_t v8 = AVMethodExceptionReasonWithObjectAndSelector();
    uint64_t v9 = v11;
    uint64_t v10 = v12;
  }
  long long v13 = objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v8, 0, v14);
  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v13);
  }
  NSLog(&cfstr_SuppressingExc.isa, v13);
}

- (BOOL)isDepthDataDeliveryEnabled
{
  return self->_internal->depthDataDeliveryEnabled;
}

- (BOOL)isConstantColorEnabled
{
  return self->_internal->constantColorEnabled;
}

- (BOOL)isSquareCropEnabled
{
  return self->_internal->squareCropEnabled;
}

- (unsigned)previewFormatFourCC
{
  return ps_formatFourCCForSettingsDictionary(self->_internal->previewPhotoFormat);
}

- (unsigned)embeddedThumbnailFormatFourCC
{
  return ps_formatFourCCForSettingsDictionary(self->_internal->embeddedThumbnailPhotoFormat);
}

- (id)semanticStyle
{
  return self->_internal->semanticStyle;
}

- (BOOL)isBurstQualityCaptureEnabled
{
  return self->_internal->burstQualityCaptureEnabled;
}

- (unint64_t)userInitiatedPhotoRequestTime
{
  return self->_internal->userInitiatedPhotoRequestTime;
}

- (int64_t)uniqueID
{
  return self->_internal->uniqueID;
}

- (NSDictionary)rawFileFormat
{
  return self->_internal->rawFileFormat;
}

- (unsigned)rawEmbeddedThumbnailFormatFourCC
{
  char BoolAnswer = AVGestaltGetBoolAnswer(@"AVGQCapturePhotoSettingsSupportRawEmbeddedThumbnailFormat");
  internal = self->_internal;
  if ((BoolAnswer & 1) != 0 || !internal->rawFileType) {
    uint64_t v5 = 216;
  }
  else {
    uint64_t v5 = 200;
  }
  uint64_t v6 = *(Class *)((char *)&internal->super.isa + v5);

  return ps_formatFourCCForSettingsDictionary(v6);
}

- (CGSize)previewCGSize
{
  double v2 = ps_CGSizeForSettingsDictionary(self->_internal->previewPhotoFormat);
  result.height = v3;
  result.width = v2;
  return result;
}

- (NSDictionary)metadata
{
  double v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_internal->metadata];
  objc_super v4 = v3;
  if (self->_internal->autoSpatialOverCaptureEnabled)
  {
    uint64_t v5 = *MEMORY[0x1E4F2FC20];
    id v6 = [(NSDictionary *)v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
    if (!v6)
    {
      id v6 = (id)[MEMORY[0x1E4F1CA60] dictionary];
      [(NSDictionary *)v4 setObject:v6 forKeyedSubscript:v5];
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"), @"41");
  }
  return v4;
}

- (BOOL)isTurboModeEnabled
{
  return self->_internal->turboModeEnabled;
}

- (BOOL)isDepthDataFiltered
{
  return self->_internal->depthDataFiltered;
}

- (BOOL)isAutoVirtualDeviceFusionEnabled
{
  return self->_internal->autoVirtualDeviceFusionEnabled;
}

- (BOOL)isAutoRedEyeReductionEnabled
{
  return self->_internal->autoRedEyeReductionEnabled;
}

- (BOOL)embedsPortraitEffectsMatteInPhoto
{
  return self->_internal->embedsPortraitEffectsMatteInPhoto;
}

- (BOOL)embedsDepthDataInPhoto
{
  return self->_internal->embedsDepthDataInPhoto;
}

- (CGSize)embeddedThumbnailCGSize
{
  double v2 = ps_CGSizeForSettingsDictionary(self->_internal->embeddedThumbnailPhotoFormat);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)arePreviewPhotoFormatDimensionsLimitedToDisplayDimensions
{
  return self->_internal->previewPhotoFormatDimensionsLimitedToDisplayDimensions;
}

+ (void)initialize
{
}

+ (AVCapturePhotoSettings)photoSettings
{
  uint64_t v6 = 0;
  double v2 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithFormat:0 processedFileType:0 rawPixelFormatType:0 rawFileType:0 burstQualityCaptureEnabled:0 uniqueID:0 exceptionReason:&v6];
  double v3 = v2;
  if (!v6) {
    return (AVCapturePhotoSettings *)v2;
  }
  objc_super v4 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v4);
  }
  NSLog(&cfstr_SuppressingExc.isa, v4);
  return 0;
}

- (NSURL)livePhotoMovieFileURL
{
  return self->_internal->livePhotoMovieFileURL;
}

- (NSDictionary)format
{
  return self->_internal->format;
}

- (BOOL)isPortraitEffectsMatteDeliveryEnabled
{
  return self->_internal->portraitEffectsMatteDeliveryEnabled;
}

- (BOOL)isEV0PhotoDeliveryEnabled
{
  return self->_internal->EV0PhotoDeliveryEnabled;
}

- (NSArray)enabledSemanticSegmentationMatteTypes
{
  double v2 = self->_internal->enabledSemanticSegmentationMatteTypes;

  return v2;
}

- (id)adjustedPhotoFilters
{
  return self->_internal->adjustedPhotoFilters;
}

- (unsigned)shutterSound
{
  return self->_internal->shutterSound;
}

- (AVFileType)rawFileType
{
  return self->_internal->rawFileType;
}

- (AVFileType)processedFileType
{
  return self->_internal->processedFileType;
}

- (id)photoFilters
{
  return self->_internal->photoFilters;
}

- (BOOL)isProcessedPhotoZoomWithoutUpscalingEnabled
{
  return self->_internal->processedPhotoZoomWithoutUpscalingEnabled;
}

- (BOOL)isConstantColorFallbackPhotoDeliveryEnabled
{
  return self->_internal->constantColorFallbackPhotoDeliveryEnabled;
}

- (BOOL)isCameraCalibrationDataDeliveryEnabled
{
  return self->_internal->cameraCalibrationDataDeliveryEnabled;
}

- (BOOL)isAutoSpatialPhotoCaptureEnabled
{
  return self->_internal->autoSpatialPhotoCaptureEnabled;
}

- (BOOL)isAutoSpatialOverCaptureEnabled
{
  return self->_internal->autoSpatialOverCaptureEnabled;
}

- (BOOL)isAutoContentAwareDistortionCorrectionEnabled
{
  return self->_internal->autoContentAwareDistortionCorrectionEnabled;
}

- (id)videoFileURL
{
  return self->_internal->videoFileURL;
}

- (BOOL)photoQualityPrioritizationIsSetByClient
{
  return self->_internal->photoQualityPrioritizationIsSetByClient;
}

- (id)livePhotoMovieFileURLForOriginalPhoto
{
  return self->_internal->livePhotoMovieFileURLForOriginalPhoto;
}

- (BOOL)isShutterSoundSuppressionEnabled
{
  return self->_internal->shutterSoundSuppressionEnabled;
}

- (BOOL)isDualCameraDualPhotoDeliveryEnabled
{
  double v3 = +[AVCaptureDevice defaultDeviceWithDeviceType:@"AVCaptureDeviceTypeBuiltInDualCamera" mediaType:*MEMORY[0x1E4F47C68] position:0];
  if ((__CFString *)[(AVCaptureDevice *)v3 deviceType] != @"AVCaptureDeviceTypeBuiltInDualCamera") {
    return 0;
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", -[AVCaptureDevice constituentDevices](v3, "constituentDevices"));
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices];

  return [v5 isEqual:v6];
}

- (id)HEICSFileURL
{
  return self->_internal->HEICSFileURL;
}

- (id)metadataForOriginalPhoto
{
  double v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_internal->metadata];
  objc_super v4 = v3;
  if (self->_internal->autoSpatialOverCaptureEnabled)
  {
    uint64_t v5 = *MEMORY[0x1E4F2FC20];
    uint64_t v6 = (void *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
    if (!v6)
    {
      uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [v4 setObject:v6 forKeyedSubscript:v5];
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifierForOriginalPhoto](self, "spatialOverCaptureGroupIdentifierForOriginalPhoto"), @"41");
  }
  return v4;
}

+ (AVCapturePhotoSettings)photoSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType
{
  uint64_t v7 = 0;
  double v3 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithFormat:0 processedFileType:0 rawPixelFormatType:*(void *)&rawPixelFormatType rawFileType:0 burstQualityCaptureEnabled:0 uniqueID:0 exceptionReason:&v7];
  objc_super v4 = v3;
  if (!v7) {
    return (AVCapturePhotoSettings *)v3;
  }
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v5);
  }
  NSLog(&cfstr_SuppressingExc.isa, v5);
  return 0;
}

+ (AVCapturePhotoSettings)photoSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType processedFormat:(NSDictionary *)processedFormat
{
  uint64_t v8 = 0;
  objc_super v4 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithFormat:processedFormat processedFileType:0 rawPixelFormatType:*(void *)&rawPixelFormatType rawFileType:0 burstQualityCaptureEnabled:0 uniqueID:0 exceptionReason:&v8];
  uint64_t v5 = v4;
  if (!v8) {
    return (AVCapturePhotoSettings *)v4;
  }
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v6);
  }
  NSLog(&cfstr_SuppressingExc.isa, v6);
  return 0;
}

+ (AVCapturePhotoSettings)photoSettingsWithRawPixelFormatType:(OSType)rawPixelFormatType rawFileType:(AVFileType)rawFileType processedFormat:(NSDictionary *)processedFormat processedFileType:(AVFileType)processedFileType
{
  uint64_t v10 = 0;
  uint64_t v6 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithFormat:processedFormat processedFileType:processedFileType rawPixelFormatType:*(void *)&rawPixelFormatType rawFileType:rawFileType burstQualityCaptureEnabled:0 uniqueID:0 exceptionReason:&v10];
  uint64_t v7 = v6;
  if (!v10) {
    return (AVCapturePhotoSettings *)v6;
  }
  uint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v8);
  }
  NSLog(&cfstr_SuppressingExc.isa, v8);
  return 0;
}

+ (id)photoSettingsFromPhotoInitiationSettings:(id)a3 format:(id)a4
{
  uint64_t v9 = 0;
  uint64_t v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", a4, 0, 0, 0, objc_msgSend(a3, "burstQualityCaptureEnabled"), objc_msgSend(a3, "uniqueID"), &v9);
  objc_msgSend(v5, "setFlashMode:", objc_msgSend(a3, "flashMode"));
  if ([a3 isAutoStillImageStabilizationEnabled]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 1;
  }
  [v5 _setPhotoQualityPrioritization:v6];
  objc_msgSend(v5, "setHDRMode:", objc_msgSend(a3, "HDRMode"));
  objc_msgSend(v5, "setUserInitiatedPhotoRequestTime:", objc_msgSend(a3, "timestamp"));
  if (!v9) {
    return v5;
  }
  uint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

  if (AVCaptureShouldThrowForAPIViolations()) {
    objc_exception_throw(v7);
  }
  NSLog(&cfstr_SuppressingExc.isa, v7);
  return 0;
}

- (AVCapturePhotoSettings)init
{
  uint64_t v5 = 0;
  double v2 = [(AVCapturePhotoSettings *)self _initWithFormat:0 processedFileType:0 rawPixelFormatType:0 rawFileType:0 burstQualityCaptureEnabled:0 uniqueID:0 exceptionReason:&v5];
  if (v5)
  {
    double v3 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];

    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v3);
    }
    NSLog(&cfstr_SuppressingExc.isa, v3);
    return 0;
  }
  return v2;
}

- (id)debugDescription
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F29000uLL;
  if ([(AVCapturePhotoSettings *)self formatFourCC])
  {
    objc_super v4 = NSString;
    [(AVCapturePhotoSettings *)self formatFourCC];
    uint64_t v5 = AVStringForOSType();
    processedFileType = self->_internal->processedFileType;
    if (processedFileType) {
      uint64_t v7 = (__CFString *)[NSString stringWithFormat:@"(%@)", ps_shortStringForFileType(processedFileType)];
    }
    else {
      uint64_t v7 = &stru_1EF4D21D0;
    }
    v94 = (__CFString *)[v4 stringWithFormat:@"%@%@", v5, v7];
  }
  else
  {
    v94 = @"(null)";
  }
  internal = self->_internal;
  if (internal->rawPhotoPixelFormatType)
  {
    uint64_t v9 = NSString;
    uint64_t v10 = AVStringForOSType();
    rawFileType = self->_internal->rawFileType;
    if (rawFileType) {
      uint64_t v12 = (__CFString *)[NSString stringWithFormat:@"(%@)", ps_shortStringForFileType(rawFileType)];
    }
    else {
      uint64_t v12 = &stru_1EF4D21D0;
    }
    v93 = (__CFString *)[v9 stringWithFormat:@" raw:%@%@", v10, v12];
    internal = self->_internal;
  }
  else
  {
    v93 = &stru_1EF4D21D0;
  }
  if (internal->flashMode)
  {
    v92 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" flash:%d", internal->flashMode);
    internal = self->_internal;
  }
  else
  {
    v92 = &stru_1EF4D21D0;
  }
  if (internal->constantColorEnabled)
  {
    if (internal->constantColorFallbackPhotoDeliveryEnabled) {
      long long v13 = @"(fallback:1)";
    }
    else {
      long long v13 = &stru_1EF4D21D0;
    }
    v91 = (__CFString *)[NSString stringWithFormat:@" constant-color:1%@", v13];
    internal = self->_internal;
  }
  else
  {
    v91 = &stru_1EF4D21D0;
  }
  BOOL autoSpatialPhotoCaptureEnabled = internal->autoSpatialPhotoCaptureEnabled;
  if ([(NSArray *)internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices count])
  {
    AVCapturePhotoQualityPrioritization v14 = NSString;
    virtualDeviceConstituentPhotoDeliveryEnabledDevices = self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices;
    long long v16 = (void *)[MEMORY[0x1E4F28E78] string];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    uint64_t v17 = [(NSArray *)virtualDeviceConstituentPhotoDeliveryEnabledDevices countByEnumeratingWithState:&v95 objects:v99 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v96;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v96 != v19) {
            objc_enumerationMutation(virtualDeviceConstituentPhotoDeliveryEnabledDevices);
          }
          [v16 appendFormat:@"%@+", AVCaptureDeviceTypeToShortString(objc_msgSend(*(id *)(*((void *)&v95 + 1) + 8 * i), "deviceType"))];
        }
        uint64_t v18 = [(NSArray *)virtualDeviceConstituentPhotoDeliveryEnabledDevices countByEnumeratingWithState:&v95 objects:v99 count:16];
      }
      while (v18);
    }
    if ((unint64_t)[v16 length] < 2) {
      uint64_t v21 = [NSString stringWithString:v16];
    }
    else {
      uint64_t v21 = objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "length") - 1);
    }
    int v22 = (__CFString *)[v14 stringWithFormat:@" constituent-photos:%@", v21];
  }
  else
  {
    int v22 = &stru_1EF4D21D0;
  }
  v23 = self->_internal;
  if (v23->autoVirtualDeviceFusionEnabled)
  {
    BOOL v89 = [(NSArray *)v23->virtualDeviceConstituentPhotoDeliveryEnabledDevices count] == 0;
    v23 = self->_internal;
  }
  else
  {
    BOOL v89 = 0;
  }
  int v24 = NSString;
  if (v23->EV0PhotoDeliveryEnabled
    && (livePhotoMovieFileURLForOriginalPhoto = v23->livePhotoMovieFileURLForOriginalPhoto) != 0)
  {
    long long v26 = (__CFString *)[NSString stringWithFormat:@"-%@, content-id:%@", -[NSURL lastPathComponent](livePhotoMovieFileURLForOriginalPhoto, "lastPathComponent"), -[AVCapturePhotoSettings livePhotoContentIdentifierForOriginalPhoto](self, "livePhotoContentIdentifierForOriginalPhoto")];
  }
  else
  {
    long long v26 = &stru_1EF4D21D0;
  }
  uint64_t v27 = [v24 stringWithFormat:@"%@", v26];
  long long v28 = self->_internal;
  if (v28->EV0PhotoDeliveryEnabled)
  {
    v88 = (__CFString *)[NSString stringWithFormat:@" (EV0:1%@)", v27];
    long long v28 = self->_internal;
  }
  else
  {
    v88 = &stru_1EF4D21D0;
  }
  if (v28->HDRMode)
  {
    v87 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" HDR:%d", v28->HDRMode);
    long long v28 = self->_internal;
  }
  else
  {
    v87 = &stru_1EF4D21D0;
  }
  uint64_t v86 = objc_msgSend(NSString, "stringWithFormat:", @" quality:%d", v28->photoQualityPrioritization);
  long long v29 = self->_internal;
  BOOL squareCropEnabled = v29->squareCropEnabled;
  BOOL highResolutionPhotoEnabled = v29->highResolutionPhotoEnabled;
  if (v29->depthDataDeliveryEnabled)
  {
    if (v29->embedsDepthDataInPhoto) {
      long long v30 = "";
    }
    else {
      long long v30 = "(not embedded)";
    }
    if (v29->depthDataFiltered) {
      long long v31 = "";
    }
    else {
      long long v31 = "(unfiltered)";
    }
    v85 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" depth:ON%s%s", v30, v31);
    long long v29 = self->_internal;
  }
  else
  {
    v85 = &stru_1EF4D21D0;
  }
  if (v29->portraitEffectsMatteDeliveryEnabled)
  {
    if (v29->embedsPortraitEffectsMatteInPhoto) {
      long long v32 = "";
    }
    else {
      long long v32 = "(not embedded)";
    }
    v82 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" portrait-matte:ON%s", v32);
    long long v29 = self->_internal;
  }
  else
  {
    v82 = &stru_1EF4D21D0;
  }
  id v33 = &stru_1EF4D21D0;
  if ([(NSArray *)v29->enabledSemanticSegmentationMatteTypes count])
  {
    enabledSemanticSegmentationMatteTypes = self->_internal->enabledSemanticSegmentationMatteTypes;
    BOOL v35 = [(NSArray *)enabledSemanticSegmentationMatteTypes containsObject:@"AVSemanticSegmentationMatteTypeHair"];
    BOOL v36 = [(NSArray *)enabledSemanticSegmentationMatteTypes containsObject:@"AVSemanticSegmentationMatteTypeSkin"];
    BOOL v37 = [(NSArray *)enabledSemanticSegmentationMatteTypes containsObject:@"AVSemanticSegmentationMatteTypeTeeth"];
    BOOL v38 = [(NSArray *)enabledSemanticSegmentationMatteTypes containsObject:@"AVSemanticSegmentationMatteTypeGlasses"];
    uint64_t v39 = @"hair,";
    if (!v35) {
      uint64_t v39 = &stru_1EF4D21D0;
    }
    uint64_t v40 = @"skin,";
    if (!v36) {
      uint64_t v40 = &stru_1EF4D21D0;
    }
    v41 = @"teeth,";
    if (!v37) {
      v41 = &stru_1EF4D21D0;
    }
    objc_super v42 = @"glasses,";
    if (!v38) {
      objc_super v42 = &stru_1EF4D21D0;
    }
    id v33 = (__CFString *)[MEMORY[0x1E4F28E78] stringWithFormat:@" seg-mattes:{%@%@%@%@}", v39, v40, v41, v42];
    -[__CFString deleteCharactersInRange:](v33, "deleteCharactersInRange:", [(__CFString *)v33 length] - 2, 1);
  }
  v43 = self->_internal;
  BOOL turboModeEnabled = v43->turboModeEnabled;
  BOOL burstQualityCaptureEnabled = v43->burstQualityCaptureEnabled;
  uint64_t v78 = [(NSDictionary *)v43->previewPhotoFormat count];
  unsigned int v77 = [(AVCapturePhotoSettings *)self embeddedThumbnailFormatFourCC];
  unsigned int v76 = [(AVCapturePhotoSettings *)self rawEmbeddedThumbnailFormatFourCC];
  long long v44 = self->_internal;
  if (v44->shutterSound == 1108)
  {
    v81 = &stru_1EF4D21D0;
  }
  else
  {
    v81 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" custom-shutter:%d", v44->shutterSound);
    long long v44 = self->_internal;
  }
  livePhotoMovieFileURL = v44->livePhotoMovieFileURL;
  if (livePhotoMovieFileURL)
  {
    long long v46 = (__CFString *)[NSString stringWithFormat:@" mov:{%@, %@, content-id:%@}", -[NSURL lastPathComponent](livePhotoMovieFileURL, "lastPathComponent"), -[AVCapturePhotoSettings livePhotoVideoCodecType](self, "livePhotoVideoCodecType"), -[AVCapturePhotoSettings livePhotoContentIdentifier](self, "livePhotoContentIdentifier")];
    long long v44 = self->_internal;
  }
  else
  {
    long long v46 = &stru_1EF4D21D0;
  }
  if ([(NSArray *)v44->photoFilters count]) {
    v75 = (__CFString *)[NSString stringWithFormat:@" photo-filters:[%@]", AVCIFilterArrayDescription(self->_internal->photoFilters)];
  }
  else {
    v75 = &stru_1EF4D21D0;
  }
  if ([(NSArray *)self->_internal->adjustedPhotoFilters count]) {
    v74 = (__CFString *)[NSString stringWithFormat:@" adjusted-filters:[%@]", AVCIFilterArrayDescription(self->_internal->adjustedPhotoFilters)];
  }
  else {
    v74 = &stru_1EF4D21D0;
  }
  long long v47 = self->_internal;
  semanticStyle = v47->semanticStyle;
  if (semanticStyle)
  {
    v73 = (__CFString *)[NSString stringWithFormat:@" semantic-style:{%@}", -[AVSemanticStyle debugDescription](semanticStyle, "debugDescription")];
    long long v47 = self->_internal;
  }
  else
  {
    v73 = &stru_1EF4D21D0;
  }
  HEICSFileURL = v47->HEICSFileURL;
  if (HEICSFileURL)
  {
    v50 = (__CFString *)[NSString stringWithFormat:@" HEICS:%@", -[NSURL lastPathComponent](HEICSFileURL, "lastPathComponent")];
    long long v47 = self->_internal;
  }
  else
  {
    v50 = &stru_1EF4D21D0;
  }
  videoFileURL = v47->videoFileURL;
  if (videoFileURL)
  {
    uint64_t v52 = NSString;
    uint64_t v53 = [(NSURL *)videoFileURL lastPathComponent];
    uint64_t v54 = *MEMORY[0x1E4F47D00];
    if ([(NSDictionary *)self->_internal->videoFormat objectForKeyedSubscript:*MEMORY[0x1E4F47D00]])
    {
      id v55 = [(NSDictionary *)self->_internal->videoFormat objectForKeyedSubscript:v54];
    }
    else
    {
      id v55 = (id)*MEMORY[0x1E4F47D28];
    }
    v56 = (__CFString *)[v52 stringWithFormat:@" video:{%@, %@}", v53, v55];
    long long v47 = self->_internal;
  }
  else
  {
    v56 = &stru_1EF4D21D0;
  }
  if (v47->autoSpatialOverCaptureEnabled)
  {
    v72 = v56;
    v57 = (__CFString *)[NSString stringWithFormat:@" spatial-overcapture mov:{%@, %@, content-id:%@, group-id:%@}", -[NSURL lastPathComponent](v47->spatialOverCaptureLivePhotoMovieFileURL, "lastPathComponent"), -[AVCapturePhotoSettings livePhotoVideoCodecType](self, "livePhotoVideoCodecType"), -[AVCapturePhotoSettings spatialOverCaptureLivePhotoContentIdentifier](self, "spatialOverCaptureLivePhotoContentIdentifier"), -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier")];
    long long v47 = self->_internal;
    if (v47->EV0PhotoDeliveryEnabled
      && (spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto = v47->spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto) != 0)
    {
      unint64_t v3 = 0x1E4F29000;
      v59 = (__CFString *)[NSString stringWithFormat:@" spatial-overcapture (EV0) mov:{%@, %@, content-id:%@, group-id:%@}", -[NSURL lastPathComponent](spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto, "lastPathComponent"), -[AVCapturePhotoSettings livePhotoVideoCodecType](self, "livePhotoVideoCodecType"), -[AVCapturePhotoSettings spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto](self, "spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto"), -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifierForOriginalPhoto](self, "spatialOverCaptureGroupIdentifierForOriginalPhoto")];
      long long v47 = self->_internal;
    }
    else
    {
      v59 = &stru_1EF4D21D0;
      unint64_t v3 = 0x1E4F29000uLL;
    }
    v56 = v72;
  }
  else
  {
    v57 = &stru_1EF4D21D0;
    v59 = &stru_1EF4D21D0;
  }
  if (v76) {
    v60 = @" raw-thumb:ON";
  }
  else {
    v60 = &stru_1EF4D21D0;
  }
  if (v77) {
    v61 = @" thumb:ON";
  }
  else {
    v61 = &stru_1EF4D21D0;
  }
  if (v78) {
    v62 = @" prev:ON";
  }
  else {
    v62 = &stru_1EF4D21D0;
  }
  if (burstQualityCaptureEnabled) {
    v63 = @" burst:ON";
  }
  else {
    v63 = &stru_1EF4D21D0;
  }
  if (turboModeEnabled) {
    v64 = @" turbo:ON";
  }
  else {
    v64 = &stru_1EF4D21D0;
  }
  if (highResolutionPhotoEnabled) {
    v65 = @" high-res:ON";
  }
  else {
    v65 = &stru_1EF4D21D0;
  }
  if (squareCropEnabled) {
    v66 = @" square-crop:ON";
  }
  else {
    v66 = &stru_1EF4D21D0;
  }
  if (v89) {
    v67 = @" auto-virtualdevice-fusion:ON";
  }
  else {
    v67 = &stru_1EF4D21D0;
  }
  if (autoSpatialPhotoCaptureEnabled) {
    v68 = @" spatialPhoto:ON";
  }
  else {
    v68 = &stru_1EF4D21D0;
  }
  v69 = @" zoom-without-upscale:ON";
  if (!v47->processedPhotoZoomWithoutUpscalingEnabled) {
    v69 = &stru_1EF4D21D0;
  }
  v70 = @" preview-photo-format-dimensions-limited-to-display-dimensions:NO";
  if (v47->previewPhotoFormatDimensionsLimitedToDisplayDimensions) {
    v70 = &stru_1EF4D21D0;
  }
  return (id)objc_msgSend(*(id *)(v3 + 24), "stringWithFormat:", @"uid:%lld %@:{%@%@%@%@%@%@%@%@%@%@ }%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@", v47->uniqueID, v94, v93, v92, v91, &stru_1EF4D21D0, v87, v88, v86, v22, v67, v66, v65, v85, v82, v33,
               v64,
               v63,
               v62,
               v61,
               v60,
               v81,
               v46,
               v75,
               v74,
               v73,
               v50,
               v56,
               v57,
               v59,
               v69,
               v70,
               v68);
}

- (id)description
{
  unint64_t v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCapturePhotoSettings debugDescription](self, "debugDescription")];
}

- (BOOL)isAutoStillImageStabilizationEnabled
{
  return self->_internal->photoQualityPrioritization > 1;
}

- (void)setAutoStillImageStabilizationEnabled:(BOOL)autoStillImageStabilizationEnabled
{
  if (autoStillImageStabilizationEnabled) {
    int64_t v3 = 2;
  }
  else {
    int64_t v3 = 1;
  }
  internal = self->_internal;
  if (internal->photoQualityPrioritization != v3)
  {
    [(AVCapturePhotoSettings *)self willChangeValueForKey:@"photoQualityPrioritization"];
    self->_internal->int64_t photoQualityPrioritization = v3;
    [(AVCapturePhotoSettings *)self didChangeValueForKey:@"photoQualityPrioritization"];
    internal = self->_internal;
  }
  internal->photoQualityPrioritizationIsSetByClient = 1;
}

- (BOOL)isAutoDualCameraFusionEnabled
{
  return self->_internal->autoVirtualDeviceFusionEnabled;
}

- (void)setAutoDualCameraFusionEnabled:(BOOL)autoDualCameraFusionEnabled
{
  BOOL v3 = autoDualCameraFusionEnabled;
  if (+[AVCapturePhotoOutput isBayerRAWPixelFormat:self->_internal->rawPhotoPixelFormatType])
  {
    BOOL v5 = !v3;
  }
  else
  {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (self->_internal->autoVirtualDeviceFusionEnabled != v3)
    {
      [(AVCapturePhotoSettings *)self willChangeValueForKey:@"autoVirtualDeviceFusionEnabled"];
      self->_internal->autoVirtualDeviceFusionEnabled = v3;
      [(AVCapturePhotoSettings *)self didChangeValueForKey:@"autoVirtualDeviceFusionEnabled"];
    }
  }
  else
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
  }
}

- (void)setDualCameraDualPhotoDeliveryEnabled:(BOOL)dualCameraDualPhotoDeliveryEnabled
{
  if (dualCameraDualPhotoDeliveryEnabled
    && (objc_super v4 = +[AVCaptureDevice defaultDeviceWithDeviceType:@"AVCaptureDeviceTypeBuiltInDualCamera" mediaType:*MEMORY[0x1E4F47C68] position:0], (__CFString *)[(AVCaptureDevice *)v4 deviceType] == @"AVCaptureDeviceTypeBuiltInDualCamera"))
  {
    BOOL v5 = [(AVCaptureDevice *)v4 constituentDevices];
  }
  else
  {
    BOOL v5 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CAD0] setWithArray:v5];
  if ((objc_msgSend(v6, "isEqual:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices)) & 1) == 0)
  {
    [(AVCapturePhotoSettings *)self willChangeValueForKey:@"virtualDeviceConstituentPhotoDeliveryEnabledDevices"];

    self->_internal->virtualDeviceConstituentPhotoDeliveryEnabledDevices = v5;
    [(AVCapturePhotoSettings *)self didChangeValueForKey:@"virtualDeviceConstituentPhotoDeliveryEnabledDevices"];
  }
}

- (BOOL)embedsSemanticSegmentationMattesInPhoto
{
  return self->_internal->embedsSemanticSegmentationMattesInPhoto;
}

- (AVVideoCodecType)livePhotoVideoCodecType
{
  return self->_internal->livePhotoVideoCodecType;
}

- (NSArray)livePhotoMovieMetadata
{
  BOOL v3 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_internal->livePhotoMovieMetadata, "count") + 2);
  objc_super v4 = v3;
  if (self->_internal->livePhotoMovieMetadata) {
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:");
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
  uint64_t v6 = *MEMORY[0x1E4F47CB8];
  [v5 setKeySpace:*MEMORY[0x1E4F47CB8]];
  [v5 setKey:*MEMORY[0x1E4F47CC8]];
  objc_msgSend(v5, "setValue:", -[AVCapturePhotoSettings livePhotoContentIdentifier](self, "livePhotoContentIdentifier"));
  [(NSArray *)v4 addObject:v5];

  if (self->_internal->autoSpatialOverCaptureEnabled)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
    [v7 setKeySpace:v6];
    [v7 setKey:*MEMORY[0x1E4F47CD0]];
    objc_msgSend(v7, "setValue:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"));
    [(NSArray *)v4 addObject:v7];
  }
  return v4;
}

- (id)livePhotoMovieMetadataForOriginalPhoto
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_internal->livePhotoMovieMetadataForOriginalPhoto, "count") + 2);
  objc_super v4 = v3;
  if (self->_internal->livePhotoMovieMetadataForOriginalPhoto) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
  uint64_t v6 = *MEMORY[0x1E4F47CB8];
  [v5 setKeySpace:*MEMORY[0x1E4F47CB8]];
  [v5 setKey:*MEMORY[0x1E4F47CC8]];
  objc_msgSend(v5, "setValue:", -[AVCapturePhotoSettings livePhotoContentIdentifierForOriginalPhoto](self, "livePhotoContentIdentifierForOriginalPhoto"));
  [v4 addObject:v5];

  if (self->_internal->autoSpatialOverCaptureEnabled)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
    [v7 setKeySpace:v6];
    [v7 setKey:*MEMORY[0x1E4F47CD0]];
    objc_msgSend(v7, "setValue:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifierForOriginalPhoto](self, "spatialOverCaptureGroupIdentifierForOriginalPhoto"));
    [v4 addObject:v7];
  }
  return v4;
}

- (NSDictionary)previewPhotoFormat
{
  return self->_internal->previewPhotoFormat;
}

- (NSDictionary)embeddedThumbnailPhotoFormat
{
  return self->_internal->embeddedThumbnailPhotoFormat;
}

- (NSDictionary)rawEmbeddedThumbnailPhotoFormat
{
  return self->_internal->rawEmbeddedThumbnailPhotoFormat;
}

- (CGSize)rawEmbeddedThumbnailCGSize
{
  char BoolAnswer = AVGestaltGetBoolAnswer(@"AVGQCapturePhotoSettingsSupportRawEmbeddedThumbnailFormat");
  internal = self->_internal;
  if ((BoolAnswer & 1) != 0 || !internal->rawFileType) {
    uint64_t v5 = 216;
  }
  else {
    uint64_t v5 = 200;
  }
  uint64_t v6 = *(Class *)((char *)&internal->super.isa + v5);

  double v7 = ps_CGSizeForSettingsDictionary(v6);
  result.height = v8;
  result.width = v7;
  return result;
}

- (BOOL)isAutoDeferredProcessingEnabled
{
  return self->_internal->autoDeferredPhotoDeliveryEnabled;
}

- (void)setAutoDeferredProcessingEnabled:(BOOL)a3
{
  self->_internal->autoDeferredPhotoDeliveryEnabled = a3;
}

- (id)videoFormat
{
  return self->_internal->videoFormat;
}

- (id)videoFileMetadata
{
  return self->_internal->videoFileMetadata;
}

- (void)_setPropertiesFromMomentCaptureSettings:(id)a3
{
  self->_internal->userInitiatedPhotoRequestTime = [a3 userInitiatedCaptureTime];
  -[AVCapturePhotoSettings _setPhotoQualityPrioritization:](self, "_setPhotoQualityPrioritization:", [a3 photoQualityPrioritization]);
  -[AVCapturePhotoSettings setFlashMode:](self, "setFlashMode:", [a3 flashMode]);
  -[AVCapturePhotoSettings setAutoRedEyeReductionEnabled:](self, "setAutoRedEyeReductionEnabled:", [a3 isAutoRedEyeReductionEnabled]);
  -[AVCapturePhotoSettings setDigitalFlashMode:](self, "setDigitalFlashMode:", [a3 digitalFlashMode]);
  -[AVCapturePhotoSettings setHDRMode:](self, "setHDRMode:", [a3 HDRMode]);
  -[AVCapturePhotoSettings setEV0PhotoDeliveryEnabled:](self, "setEV0PhotoDeliveryEnabled:", [a3 isAutoOriginalPhotoDeliveryEnabled]);
  uint64_t v5 = [a3 isAutoSpatialOverCaptureEnabled];

  [(AVCapturePhotoSettings *)self setAutoSpatialOverCaptureEnabled:v5];
}

+ (id)photoSettingsFromMomentCaptureSettings:(id)a3 withFormat:(id)a4
{
  uint64_t v9 = 0;
  id v5 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", a4, 0, 0, 0, 0, objc_msgSend(a3, "uniqueID"), &v9);
  if (v9)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v6);
    }
    NSLog(&cfstr_SuppressingExc.isa, v6);
    return 0;
  }
  else
  {
    double v7 = v5;
    [v5 _setPropertiesFromMomentCaptureSettings:a3];
  }
  return v7;
}

+ (id)photoSettingsFromMomentCaptureSettings:(id)a3 withRawPixelFormatType:(unsigned int)a4 rawFileType:(id)a5 format:(id)a6
{
  uint64_t v11 = 0;
  id v7 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithFormat:processedFileType:rawPixelFormatType:rawFileType:burstQualityCaptureEnabled:uniqueID:exceptionReason:", a6, 0, *(void *)&a4, a5, 0, objc_msgSend(a3, "uniqueID"), &v11);
  if (v11)
  {
    double v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v8);
    }
    NSLog(&cfstr_SuppressingExc.isa, v8);
    return 0;
  }
  else
  {
    uint64_t v9 = v7;
    [v7 _setPropertiesFromMomentCaptureSettings:a3];
  }
  return v9;
}

- (id)spatialOverCaptureMetadata
{
  BOOL v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_internal->spatialOverCaptureMetadata];
  objc_super v4 = v3;
  if (self->_internal->autoSpatialOverCaptureEnabled)
  {
    uint64_t v5 = *MEMORY[0x1E4F2FC20];
    uint64_t v6 = (void *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
    if (!v6)
    {
      uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [v4 setObject:v6 forKeyedSubscript:v5];
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"), @"41");
  }
  return v4;
}

- (id)spatialOverCaptureLivePhotoMovieFileURL
{
  return self->_internal->spatialOverCaptureLivePhotoMovieFileURL;
}

- (id)spatialOverCaptureLivePhotoMovieMetadata
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_internal->spatialOverCaptureLivePhotoMovieMetadata, "count") + 3);
  objc_super v4 = v3;
  if (self->_internal->spatialOverCaptureLivePhotoMovieMetadata) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
  uint64_t v6 = *MEMORY[0x1E4F47CB8];
  [v5 setKeySpace:*MEMORY[0x1E4F47CB8]];
  [v5 setKey:*MEMORY[0x1E4F47CC8]];
  objc_msgSend(v5, "setValue:", -[AVCapturePhotoSettings spatialOverCaptureLivePhotoContentIdentifier](self, "spatialOverCaptureLivePhotoContentIdentifier"));
  [v4 addObject:v5];

  id v7 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
  [v7 setKeySpace:v6];
  [v7 setKey:*MEMORY[0x1E4F47CD0]];
  objc_msgSend(v7, "setValue:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"));
  [v4 addObject:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
  [v8 setKeySpace:v6];
  [v8 setKey:*MEMORY[0x1E4F47CC0]];
  [v8 setDataType:*MEMORY[0x1E4F1F068]];
  objc_msgSend(v8, "setValue:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", 1));
  [v4 addObject:v8];

  return v4;
}

- (id)spatialOverCaptureLivePhotoContentIdentifier
{
  id result = self->_internal->spatialOverCaptureLivePhotoContentIdentifier;
  if (!result)
  {
    self->_internal->spatialOverCaptureLivePhotoContentIdentifier = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    return self->_internal->spatialOverCaptureLivePhotoContentIdentifier;
  }
  return result;
}

- (id)spatialOverCaptureGroupIdentifier
{
  id result = self->_internal->spatialOverCaptureGroupIdentifier;
  if (!result)
  {
    self->_internal->spatialOverCaptureGroupIdentifier = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    return self->_internal->spatialOverCaptureGroupIdentifier;
  }
  return result;
}

- (id)spatialOverCaptureMetadataForOriginalPhoto
{
  BOOL v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:self->_internal->spatialOverCaptureMetadataForOriginalPhoto];
  objc_super v4 = v3;
  if (self->_internal->autoSpatialOverCaptureEnabled)
  {
    uint64_t v5 = *MEMORY[0x1E4F2FC20];
    uint64_t v6 = (void *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
    if (!v6)
    {
      uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [v4 setObject:v6 forKeyedSubscript:v5];
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifierForOriginalPhoto](self, "spatialOverCaptureGroupIdentifierForOriginalPhoto"), @"41");
  }
  return v4;
}

- (id)spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto
{
  return self->_internal->spatialOverCaptureLivePhotoMovieFileURLForOriginalPhoto;
}

- (id)spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_internal->spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto, "count")+ 3);
  objc_super v4 = v3;
  if (self->_internal->spatialOverCaptureLivePhotoMovieMetadataForOriginalPhoto) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
  uint64_t v6 = *MEMORY[0x1E4F47CB8];
  [v5 setKeySpace:*MEMORY[0x1E4F47CB8]];
  [v5 setKey:*MEMORY[0x1E4F47CC8]];
  objc_msgSend(v5, "setValue:", -[AVCapturePhotoSettings spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto](self, "spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto"));
  [v4 addObject:v5];

  id v7 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
  [v7 setKeySpace:v6];
  [v7 setKey:*MEMORY[0x1E4F47CD0]];
  objc_msgSend(v7, "setValue:", -[AVCapturePhotoSettings spatialOverCaptureGroupIdentifierForOriginalPhoto](self, "spatialOverCaptureGroupIdentifierForOriginalPhoto"));
  [v4 addObject:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
  [v8 setKeySpace:v6];
  [v8 setKey:*MEMORY[0x1E4F47CC0]];
  [v8 setDataType:*MEMORY[0x1E4F1F068]];
  objc_msgSend(v8, "setValue:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", 1));
  [v4 addObject:v8];

  return v4;
}

- (id)spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto
{
  id result = self->_internal->spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto;
  if (!result)
  {
    self->_internal->spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    return self->_internal->spatialOverCaptureLivePhotoContentIdentifierForOriginalPhoto;
  }
  return result;
}

- (id)spatialOverCaptureGroupIdentifierForOriginalPhoto
{
  id result = self->_internal->spatialOverCaptureGroupIdentifierForOriginalPhoto;
  if (!result)
  {
    self->_internal->spatialOverCaptureGroupIdentifierForOriginalPhoto = (NSString *)(id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    return self->_internal->spatialOverCaptureGroupIdentifierForOriginalPhoto;
  }
  return result;
}

@end