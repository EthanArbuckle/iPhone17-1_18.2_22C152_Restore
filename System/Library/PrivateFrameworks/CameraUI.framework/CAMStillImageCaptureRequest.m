@interface CAMStillImageCaptureRequest
+ (unsigned)rawPixelFormatTypeForPhotoOutput:(id)a3;
- (BOOL)disablesCameraSwitchingDuringRecording;
- (BOOL)hasAdjustments;
- (BOOL)isCTMVideo;
- (BOOL)isEV0LocalVideoDestinationURL:(id)a3;
- (BOOL)needsLivePhotoCaptureResumedOnPhotoOutput:(id)a3;
- (BOOL)shouldProtectPersistenceForVideo;
- (BOOL)stillDuringVideo;
- (BOOL)wantsAudioForCapture;
- (BOOL)wantsAutoDualCameraFusion;
- (BOOL)wantsDepthData;
- (BOOL)wantsEV0ForHDR;
- (BOOL)wantsHighResolutionStills;
- (BOOL)wantsSemanticSceneFilter;
- (BOOL)wantsSquareCrop;
- (BOOL)wantsWhiteBalanceLockedDuringVideoRecording;
- (CAMStillImageCaptureRequest)init;
- (CAMStillImageCaptureRequest)initWithRequest:(id)a3 distinctPersistence:(BOOL)a4 includeAnalytics:(BOOL)a5;
- (CAMStillImageCaptureRequestDelegate)delegate;
- (CAMTextRegionResult)textAnalysisRegion;
- (CEKCaptureStyle)semanticStyle;
- (CGSize)desiredPreviewSize;
- (NSArray)adjustmentFilters;
- (NSArray)originalFilters;
- (NSString)EV0IrisIdentifier;
- (NSString)EV0PersistenceUUID;
- (NSString)EV0VideoPersistenceUUID;
- (NSString)burstIdentifier;
- (NSString)irisIdentifier;
- (NSString)textAnalysisIdentifier;
- (NSString)timelapseIdentifier;
- (NSString)videoPersistenceUUID;
- (NSURL)EV0LocalVideoDestinationURL;
- (NSURL)localCTMVideoDestinationURL;
- (NSURL)localVideoDestinationURL;
- (id)capturePhotoSettingsWithContext:(id)a3;
- (id)irisIdentifierForEV0:(BOOL)a3;
- (id)irisLocalVideoDestinationURLForEV0:(BOOL)a3;
- (id)irisStillImagePersistenceUUIDForEV0:(BOOL)a3;
- (id)irisVideoPersistenceUUIDForEV0:(BOOL)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)aspectRatioCrop;
- (int64_t)ctmCaptureType;
- (int64_t)effectFilterType;
- (int64_t)flashMode;
- (int64_t)hdrMode;
- (int64_t)irisMode;
- (int64_t)lightingEffectType;
- (int64_t)lowLightMode;
- (int64_t)maximumPhotoResolution;
- (int64_t)photoQualityPrioritization;
- (int64_t)stereoCaptureStatus;
- (int64_t)torchMode;
- (unint64_t)maximumBurstLength;
- (unint64_t)userInitiationTime;
- (void)_configurePhotoSettings:(id)a3 shouldIgnoreInitiationSettingsProperties:(BOOL)a4 context:(id)a5;
- (void)_configureRawFileFormat:(id)a3 context:(id)a4 rawPixelFormatType:(unsigned int)a5;
- (void)_sanitizeCapturePhotoSettings:(id)a3 withContext:(id)a4;
@end

@implementation CAMStillImageCaptureRequest

- (CAMStillImageCaptureRequest)init
{
  v24.receiver = self;
  v24.super_class = (Class)CAMStillImageCaptureRequest;
  v2 = [(CAMCaptureRequest *)&v24 initWithType:0];
  v3 = v2;
  if (v2)
  {
    v2->_flashMode = 2;
    v2->_torchMode = 2;
    v2->_hdrMode = 2;
    v2->_photoQualityPrioritization = 1;
    v2->_wantsAutoDualCameraFusion = 1;
    v4 = +[CAMCaptureCapabilities capabilities];
    v3->_wantsSemanticSceneFilter = [v4 semanticDevelopmentSupported];

    semanticStyle = v3->_semanticStyle;
    v3->_semanticStyle = 0;

    v3->_ctmCaptureType = 0;
    v3->_desiredPreviewSize = (CGSize)*MEMORY[0x263F001B0];
    burstIdentifier = v3->_burstIdentifier;
    v3->_burstIdentifier = 0;

    v7 = [MEMORY[0x263F08C38] UUID];
    uint64_t v8 = [v7 UUIDString];
    irisIdentifier = v3->_irisIdentifier;
    v3->_irisIdentifier = (NSString *)v8;

    v10 = [MEMORY[0x263F08C38] UUID];
    uint64_t v11 = [v10 UUIDString];
    videoPersistenceUUID = v3->_videoPersistenceUUID;
    v3->_videoPersistenceUUID = (NSString *)v11;

    v13 = [MEMORY[0x263F08C38] UUID];
    uint64_t v14 = [v13 UUIDString];
    EV0IrisIdentifier = v3->_EV0IrisIdentifier;
    v3->_EV0IrisIdentifier = (NSString *)v14;

    v16 = [MEMORY[0x263F08C38] UUID];
    uint64_t v17 = [v16 UUIDString];
    EV0VideoPersistenceUUID = v3->_EV0VideoPersistenceUUID;
    v3->_EV0VideoPersistenceUUID = (NSString *)v17;

    v19 = [MEMORY[0x263F08C38] UUID];
    uint64_t v20 = [v19 UUIDString];
    EV0PersistenceUUID = v3->_EV0PersistenceUUID;
    v3->_EV0PersistenceUUID = (NSString *)v20;

    v3->_userInitiationTime = 0;
    v3->_maximumPhotoResolution = 0;
    v3->_wantsWhiteBalanceLockedDuringVideoRecording = 0;
    v3->_stereoCaptureStatus = 1;
    v22 = v3;
  }

  return v3;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (int64_t)hdrMode
{
  return self->_hdrMode;
}

- (int64_t)irisMode
{
  return self->_irisMode;
}

- (NSArray)adjustmentFilters
{
  return self->_adjustmentFilters;
}

- (NSArray)originalFilters
{
  return self->_originalFilters;
}

- (BOOL)wantsAutoDualCameraFusion
{
  return self->_wantsAutoDualCameraFusion;
}

- (BOOL)wantsAudioForCapture
{
  return self->_wantsAudioForCapture;
}

- (BOOL)wantsSquareCrop
{
  return self->_wantsSquareCrop;
}

- (BOOL)wantsHighResolutionStills
{
  return self->_wantsHighResolutionStills;
}

- (CGSize)desiredPreviewSize
{
  double width = self->_desiredPreviewSize.width;
  double height = self->_desiredPreviewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CAMStillImageCaptureRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMStillImageCaptureRequestDelegate *)WeakRetained;
}

- (NSString)burstIdentifier
{
  return self->_burstIdentifier;
}

- (unint64_t)maximumBurstLength
{
  return self->_maximumBurstLength;
}

- (int64_t)effectFilterType
{
  return self->_effectFilterType;
}

- (NSString)timelapseIdentifier
{
  return self->_timelapseIdentifier;
}

- (int64_t)lightingEffectType
{
  return self->_lightingEffectType;
}

- (NSString)irisIdentifier
{
  return self->_irisIdentifier;
}

- (NSURL)localVideoDestinationURL
{
  return self->_localVideoDestinationURL;
}

- (NSString)videoPersistenceUUID
{
  return self->_videoPersistenceUUID;
}

- (NSString)EV0IrisIdentifier
{
  return self->_EV0IrisIdentifier;
}

- (NSURL)EV0LocalVideoDestinationURL
{
  return self->_EV0LocalVideoDestinationURL;
}

- (NSString)EV0VideoPersistenceUUID
{
  return self->_EV0VideoPersistenceUUID;
}

- (NSString)EV0PersistenceUUID
{
  return self->_EV0PersistenceUUID;
}

- (unint64_t)userInitiationTime
{
  return self->_userInitiationTime;
}

- (id)irisLocalVideoDestinationURLForEV0:(BOOL)a3
{
  if (a3) {
    [(CAMStillImageCaptureRequest *)self EV0LocalVideoDestinationURL];
  }
  else {
  v3 = [(CAMStillImageCaptureRequest *)self localVideoDestinationURL];
  }
  return v3;
}

- (id)irisVideoPersistenceUUIDForEV0:(BOOL)a3
{
  if (a3) {
    [(CAMStillImageCaptureRequest *)self EV0VideoPersistenceUUID];
  }
  else {
  v3 = [(CAMStillImageCaptureRequest *)self videoPersistenceUUID];
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_EV0VideoPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_EV0LocalVideoDestinationURL, 0);
  objc_storeStrong((id *)&self->_EV0IrisIdentifier, 0);
  objc_storeStrong((id *)&self->_videoPersistenceUUID, 0);
  objc_storeStrong((id *)&self->_localCTMVideoDestinationURL, 0);
  objc_storeStrong((id *)&self->_localVideoDestinationURL, 0);
  objc_storeStrong((id *)&self->_irisIdentifier, 0);
  objc_storeStrong((id *)&self->_burstIdentifier, 0);
  objc_storeStrong((id *)&self->_textAnalysisRegion, 0);
  objc_storeStrong((id *)&self->_textAnalysisIdentifier, 0);
  objc_storeStrong((id *)&self->_semanticStyle, 0);
  objc_storeStrong((id *)&self->_originalFilters, 0);
  objc_storeStrong((id *)&self->_adjustmentFilters, 0);
  objc_storeStrong((id *)&self->_EV0PersistenceUUID, 0);
  objc_storeStrong((id *)&self->_timelapseIdentifier, 0);
}

- (CAMStillImageCaptureRequest)initWithRequest:(id)a3 distinctPersistence:(BOOL)a4 includeAnalytics:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CAMStillImageCaptureRequest;
  v9 = [(CAMCaptureRequest *)&v45 initWithRequest:v8 distinctPersistence:v6 includeAnalytics:v5];
  if (v9)
  {
    v9->_flashMode = [v8 flashMode];
    v9->_hdrMode = [v8 hdrMode];
    v9->_irisMode = [v8 irisMode];
    v9->_ctmCaptureType = [v8 ctmCaptureType];
    v9->_lowLightMode = [v8 lowLightMode];
    v9->_wantsDepthData = [v8 wantsDepthData];
    v10 = [v8 adjustmentFilters];
    uint64_t v11 = [v10 copy];
    adjustmentFilters = v9->_adjustmentFilters;
    v9->_adjustmentFilters = (NSArray *)v11;

    v13 = [v8 originalFilters];
    uint64_t v14 = [v13 copy];
    originalFilters = v9->_originalFilters;
    v9->_originalFilters = (NSArray *)v14;

    v9->_photoQualityPrioritization = [v8 photoQualityPrioritization];
    v9->_wantsAutoDualCameraFusion = [v8 wantsAutoDualCameraFusion];
    v9->_wantsSemanticSceneFilter = [v8 wantsSemanticSceneFilter];
    uint64_t v16 = [v8 semanticStyle];
    semanticStyle = v9->_semanticStyle;
    v9->_semanticStyle = (CEKCaptureStyle *)v16;

    v9->_wantsAudioForCapture = [v8 wantsAudioForCapture];
    v9->_wantsSquareCrop = [v8 wantsSquareCrop];
    v9->_aspectRatioCrop = [v8 aspectRatioCrop];
    v9->_wantsHighResolutionStills = [v8 wantsHighResolutionStills];
    v9->_stillDuringVideo = [v8 stillDuringVideo];
    v18 = [v8 textAnalysisIdentifier];
    uint64_t v19 = [v18 copy];
    textAnalysisIdentifier = v9->_textAnalysisIdentifier;
    v9->_textAnalysisIdentifier = (NSString *)v19;

    uint64_t v21 = [v8 textAnalysisRegion];
    textAnalysisRegion = v9->_textAnalysisRegion;
    v9->_textAnalysisRegion = (CAMTextRegionResult *)v21;

    [v8 desiredPreviewSize];
    v9->_desiredPreviewSize.double width = v23;
    v9->_desiredPreviewSize.double height = v24;
    v25 = [v8 delegate];
    objc_storeWeak((id *)&v9->_delegate, v25);

    uint64_t v26 = [v8 burstIdentifier];
    burstIdentifier = v9->_burstIdentifier;
    v9->_burstIdentifier = (NSString *)v26;

    v9->_maximumBurstLength = [v8 maximumBurstLength];
    v9->_effectFilterType = [v8 effectFilterType];
    uint64_t v28 = [v8 timelapseIdentifier];
    timelapseIdentifier = v9->_timelapseIdentifier;
    v9->_timelapseIdentifier = (NSString *)v28;

    v9->_lightingEffectType = [v8 lightingEffectType];
    v9->_wantsEV0ForHDR = [v8 wantsEV0ForHDR];
    uint64_t v30 = [v8 irisIdentifier];
    irisIdentifier = v9->_irisIdentifier;
    v9->_irisIdentifier = (NSString *)v30;

    uint64_t v32 = [v8 localVideoDestinationURL];
    localVideoDestinationURL = v9->_localVideoDestinationURL;
    v9->_localVideoDestinationURL = (NSURL *)v32;

    uint64_t v34 = [v8 localCTMVideoDestinationURL];
    localCTMVideoDestinationURL = v9->_localCTMVideoDestinationURL;
    v9->_localCTMVideoDestinationURL = (NSURL *)v34;

    v9->_disablesCameraSwitchingDuringRecording = [v8 disablesCameraSwitchingDuringRecording];
    v9->_torchMode = [v8 torchMode];
    if (v6)
    {
      v25 = [MEMORY[0x263F08C38] UUID];
      [v25 UUIDString];
    }
    else
    {
      [v8 videoPersistenceUUID];
    v36 = };
    objc_storeStrong((id *)&v9->_videoPersistenceUUID, v36);
    if (v6)
    {

      v36 = v25;
    }

    uint64_t v37 = [v8 EV0IrisIdentifier];
    EV0IrisIdentifier = v9->_EV0IrisIdentifier;
    v9->_EV0IrisIdentifier = (NSString *)v37;

    uint64_t v39 = [v8 EV0LocalVideoDestinationURL];
    EV0LocalVideoDestinationURL = v9->_EV0LocalVideoDestinationURL;
    v9->_EV0LocalVideoDestinationURL = (NSURL *)v39;

    if (v6)
    {
      v25 = [MEMORY[0x263F08C38] UUID];
      [v25 UUIDString];
    }
    else
    {
      [v8 EV0VideoPersistenceUUID];
    v41 = };
    objc_storeStrong((id *)&v9->_EV0VideoPersistenceUUID, v41);

    if (v6)
    {

      v25 = [MEMORY[0x263F08C38] UUID];
      [v25 UUIDString];
    }
    else
    {
      [v8 EV0PersistenceUUID];
    v42 = };
    objc_storeStrong((id *)&v9->_EV0PersistenceUUID, v42);
    if (v6)
    {

      v42 = v25;
    }

    v9->_userInitiationTime = [v8 userInitiationTime];
    v9->_maximumPhotoResolution = [v8 maximumPhotoResolution];
    v9->_wantsWhiteBalanceLockedDuringVideoRecording = [v8 wantsWhiteBalanceLockedDuringVideoRecording];
    v9->super._rawFileFormatBehavior = [v8 rawFileFormatBehavior];
    v9->_stereoCaptureStatus = [v8 stereoCaptureStatus];
    v43 = v9;
  }

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CAMMutableStillImageCaptureRequest alloc];
  return [(CAMStillImageCaptureRequest *)v4 initWithRequest:self distinctPersistence:0 includeAnalytics:1];
}

- (id)irisIdentifierForEV0:(BOOL)a3
{
  if (a3) {
    [(CAMStillImageCaptureRequest *)self EV0IrisIdentifier];
  }
  else {
  v3 = [(CAMStillImageCaptureRequest *)self irisIdentifier];
  }
  return v3;
}

- (id)irisStillImagePersistenceUUIDForEV0:(BOOL)a3
{
  if (a3) {
    [(CAMStillImageCaptureRequest *)self EV0PersistenceUUID];
  }
  else {
  v3 = [(CAMCaptureRequest *)self persistenceUUID];
  }
  return v3;
}

- (BOOL)isEV0LocalVideoDestinationURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CAMStillImageCaptureRequest *)self irisLocalVideoDestinationURLForEV0:1];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (BOOL)shouldProtectPersistenceForVideo
{
  BOOL v3 = [(CAMCaptureRequest *)self shouldProtectPersistence];
  if (v3)
  {
    LOBYTE(v3) = [(CAMStillImageCaptureRequest *)self isCTMVideo];
  }
  return v3;
}

- (BOOL)isCTMVideo
{
  return [(CAMStillImageCaptureRequest *)self ctmCaptureType] == 2;
}

- (BOOL)hasAdjustments
{
  if ([(CAMStillImageCaptureRequest *)self effectFilterType]
    || [(CAMStillImageCaptureRequest *)self lightingEffectType]
    || [(CAMStillImageCaptureRequest *)self aspectRatioCrop])
  {
    return 1;
  }
  BOOL v5 = [(CAMStillImageCaptureRequest *)self adjustmentFilters];
  BOOL v3 = [v5 count] != 0;

  return v3;
}

- (BOOL)wantsDepthData
{
  return self->_wantsDepthData;
}

- (int64_t)photoQualityPrioritization
{
  return self->_photoQualityPrioritization;
}

- (BOOL)wantsSemanticSceneFilter
{
  return self->_wantsSemanticSceneFilter;
}

- (BOOL)stillDuringVideo
{
  return self->_stillDuringVideo;
}

- (int64_t)ctmCaptureType
{
  return self->_ctmCaptureType;
}

- (int64_t)lowLightMode
{
  return self->_lowLightMode;
}

- (CEKCaptureStyle)semanticStyle
{
  return self->_semanticStyle;
}

- (NSString)textAnalysisIdentifier
{
  return self->_textAnalysisIdentifier;
}

- (CAMTextRegionResult)textAnalysisRegion
{
  return self->_textAnalysisRegion;
}

- (NSURL)localCTMVideoDestinationURL
{
  return self->_localCTMVideoDestinationURL;
}

- (BOOL)disablesCameraSwitchingDuringRecording
{
  return self->_disablesCameraSwitchingDuringRecording;
}

- (int64_t)torchMode
{
  return self->_torchMode;
}

- (BOOL)wantsEV0ForHDR
{
  return self->_wantsEV0ForHDR;
}

- (int64_t)maximumPhotoResolution
{
  return self->_maximumPhotoResolution;
}

- (BOOL)wantsWhiteBalanceLockedDuringVideoRecording
{
  return self->_wantsWhiteBalanceLockedDuringVideoRecording;
}

- (int64_t)stereoCaptureStatus
{
  return self->_stereoCaptureStatus;
}

- (int64_t)aspectRatioCrop
{
  return self->_aspectRatioCrop;
}

- (id)capturePhotoSettingsWithContext:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(CAMStillImageCaptureRequest *)self burstIdentifier];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263EFA628] burstQualityPhotoSettings];
LABEL_3:
    v7 = (void *)v6;
    goto LABEL_4;
  }
  int64_t v9 = [(CAMCaptureRequest *)self photoEncodingBehavior];
  switch(v9)
  {
    case 0:
      uint64_t v6 = [MEMORY[0x263EFA628] photoSettings];
      goto LABEL_3;
    case 2:
      v12 = objc_opt_class();
      v13 = [v4 currentStillImageOutput];
      uint64_t v14 = [v12 rawPixelFormatTypeForPhotoOutput:v13];

      v7 = [MEMORY[0x263EFA628] photoSettingsWithRawPixelFormatType:v14 rawFileType:*MEMORY[0x263EF9868] processedFormat:0 processedFileType:*MEMORY[0x263EF9868]];
      [(CAMStillImageCaptureRequest *)self _configureRawFileFormat:v7 context:v4 rawPixelFormatType:v14];
      break;
    case 1:
      v10 = (void *)MEMORY[0x263EFA628];
      uint64_t v15 = *MEMORY[0x263EFA338];
      v16[0] = *MEMORY[0x263EFA370];
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      v7 = [v10 photoSettingsWithFormat:v11];

      break;
    default:
      v7 = 0;
      break;
  }
LABEL_4:
  [(CAMStillImageCaptureRequest *)self _configurePhotoSettings:v7 shouldIgnoreInitiationSettingsProperties:0 context:v4];

  return v7;
}

- (void)_configureRawFileFormat:(id)a3 context:(id)a4 rawPixelFormatType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  int64_t v10 = [(CAMCaptureRequest *)self rawFileFormatBehavior];
  uint64_t v11 = [v9 currentStillImageOutput];

  v12 = [v11 supportedRawPhotoCodecTypesForRawPhotoPixelFormatType:v5 fileType:*MEMORY[0x263EF9868]];
  if (v10 == 1)
  {
    v13 = &unk_26BDE05D0;
    goto LABEL_5;
  }
  if (v10 == 2)
  {
    v13 = &unk_26BDE05E0;
LABEL_5:
    uint64_t v14 = CAMNUStringForTypeCode(1786276963);
    char v15 = 0;
    goto LABEL_7;
  }
  v13 = 0;
  uint64_t v14 = 0;
  char v15 = 1;
LABEL_7:
  uint64_t v16 = [v12 indexOfObject:v14];
  uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
  v18 = v17;
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v14)
    {
      uint64_t v19 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [v12 componentsJoinedByString:@","];
        int v21 = 138543618;
        v22 = v14;
        __int16 v23 = 2114;
        CGFloat v24 = v20;
        _os_log_impl(&dword_2099F8000, v19, OS_LOG_TYPE_DEFAULT, "Raw file format: requested type %{public}@ not supported, supportedCodecTypes=(%{public}@)", (uint8_t *)&v21, 0x16u);
      }
    }
  }
  else
  {
    if (v14) {
      [v17 setObject:v14 forKey:*MEMORY[0x263EFA338]];
    }
    if ((v15 & 1) == 0) {
      [v18 setObject:v13 forKey:*MEMORY[0x263EFA428]];
    }
  }
  if ([v18 count]) {
    [v8 setRawFileFormat:v18];
  }
}

- (void)_configurePhotoSettings:(id)a3 shouldIgnoreInitiationSettingsProperties:(BOOL)a4 context:(id)a5
{
  v78[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v62 = +[CAMCaptureCapabilities capabilities];
  int64_t v10 = [v9 currentStillImageOutput];
  v61 = [v9 currentVideoDeviceFormat];
  if (!a4)
  {
    objc_msgSend(v8, "setFlashMode:", +[CAMCaptureConversions captureFlashModeForFlashMode:](CAMCaptureConversions, "captureFlashModeForFlashMode:", -[CAMStillImageCaptureRequest flashMode](self, "flashMode")));
    objc_msgSend(v8, "setHDRMode:", +[CAMCaptureConversions captureHDRModeForHDRMode:](CAMCaptureConversions, "captureHDRModeForHDRMode:", -[CAMStillImageCaptureRequest hdrMode](self, "hdrMode")));
    if ([v8 flashMode] == 1 && objc_msgSend(v8, "HDRMode") == 1) {
      [v8 setHDRMode:0];
    }
    objc_msgSend(v8, "setPhotoQualityPrioritization:", +[CAMCaptureConversions AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:](CAMCaptureConversions, "AVCapturePhotoQualityPrioritizationForCAMPhotoQualityPrioritization:", -[CAMStillImageCaptureRequest photoQualityPrioritization](self, "photoQualityPrioritization")));
  }
  if ([v62 hasFilteringEntitlement])
  {
    uint64_t v11 = [(CAMStillImageCaptureRequest *)self originalFilters];
    v12 = [(CAMStillImageCaptureRequest *)self adjustmentFilters];
    if ([v11 count]) {
      [v8 setPhotoFilters:v11];
    }
    if ([v12 count]) {
      [v8 setAdjustedPhotoFilters:v12];
    }
  }
  objc_msgSend(v8, "setDigitalFlashMode:", +[CAMCaptureConversions captureDigitalFlashModeForLowLightMode:](CAMCaptureConversions, "captureDigitalFlashModeForLowLightMode:", -[CAMStillImageCaptureRequest lowLightMode](self, "lowLightMode")));
  BOOL v13 = [v62 isHDREV0CaptureSupported]
     && [(CAMStillImageCaptureRequest *)self wantsEV0ForHDR]
     && [v8 HDRMode] != 0;
  [v8 setEV0PhotoDeliveryEnabled:v13];
  BOOL v14 = [(CAMStillImageCaptureRequest *)self wantsDepthData];
  [v8 setDepthDataDeliveryEnabled:v14];
  [v8 setEmbedsDepthDataInPhoto:v14];
  [v8 setPortraitEffectsMatteDeliveryEnabled:v14];
  [v8 setEmbedsPortraitEffectsMatteInPhoto:v14];
  if (v14)
  {
    char v15 = [v10 availableSemanticSegmentationMatteTypes];
    [v8 setEnabledSemanticSegmentationMatteTypes:v15];
  }
  objc_msgSend(v8, "setAutoVirtualDeviceFusionEnabled:", -[CAMStillImageCaptureRequest wantsAutoDualCameraFusion](self, "wantsAutoDualCameraFusion"));
  if ([(CAMStillImageCaptureRequest *)self wantsAudioForCapture]) {
    uint64_t v16 = 1108;
  }
  else {
    uint64_t v16 = 0;
  }
  [v8 setShutterSound:v16];
  objc_msgSend(v8, "setHighResolutionPhotoEnabled:", -[CAMStillImageCaptureRequest wantsHighResolutionStills](self, "wantsHighResolutionStills"));
  BOOL v17 = [(CAMStillImageCaptureRequest *)self wantsSquareCrop];
  [v8 setSquareCropEnabled:v17];
  v18 = [(CAMStillImageCaptureRequest *)self burstIdentifier];

  if (!v17 && (unint64_t)([(CAMStillImageCaptureRequest *)self irisMode] - 1) <= 1)
  {
    uint64_t v19 = [(CAMStillImageCaptureRequest *)self irisLocalVideoDestinationURLForEV0:0];
    [v8 setLivePhotoMovieFileURL:v19];
    uint64_t v20 = [MEMORY[0x263EFF910] date];
    int v21 = +[CAMPersistenceController clientVideoMetadataForRequest:self withCreationDate:v20 isEV0ForHDR:0 livePhotoIdentifierOverride:0 slomoPlayback:0];
    [v8 setLivePhotoMovieMetadata:v21];
    if (v13)
    {
      v22 = [(CAMStillImageCaptureRequest *)self irisLocalVideoDestinationURLForEV0:1];
      [v8 setLivePhotoMovieFileURLForOriginalPhoto:v22];
      __int16 v23 = +[CAMPersistenceController clientVideoMetadataForRequest:self withCreationDate:v20 isEV0ForHDR:1 livePhotoIdentifierOverride:0 slomoPlayback:0];
      [v8 setLivePhotoMovieMetadataForOriginalPhoto:v23];
    }
  }
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x3032000000;
  v68 = __Block_byref_object_copy__31;
  v69 = __Block_byref_object_dispose__31;
  id v70 = 0;
  CGFloat v24 = [v8 availablePreviewPhotoPixelFormatTypes];
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __122__CAMStillImageCaptureRequest_CAMCaptureEngine___configurePhotoSettings_shouldIgnoreInitiationSettingsProperties_context___block_invoke;
  v64[3] = &unk_263FA6AC0;
  v64[4] = &v65;
  [v24 enumerateObjectsUsingBlock:v64];
  v60 = v24;
  if (v66[5])
  {
    id v25 = objc_alloc(MEMORY[0x263EFF9A0]);
    uint64_t v26 = objc_msgSend(v25, "initWithObjectsAndKeys:", v66[5], *MEMORY[0x263F04180], 0);
    [(CAMStillImageCaptureRequest *)self desiredPreviewSize];
    double v28 = v27;
    if (v29 > 0.0 || v27 > 0.0)
    {
      uint64_t v30 = objc_msgSend(NSNumber, "numberWithDouble:");
      [v26 setObject:v30 forKey:*MEMORY[0x263F04240]];

      v31 = [NSNumber numberWithDouble:v28];
      [v26 setObject:v31 forKey:*MEMORY[0x263F04118]];
    }
    [v8 setPreviewPhotoFormat:v26];
    uint64_t v32 = [(CAMStillImageCaptureRequest *)self textAnalysisIdentifier];
    BOOL v33 = v32 != 0;

    [v8 setPreviewPhotoFormatDimensionsLimitedToDisplayDimensions:v33];
  }
  if ([(CAMCaptureRequest *)self photoEncodingBehavior] == 2)
  {
    if ([v62 useFullResolutionThumbnailForRAWCaptures]
      && [(CAMStillImageCaptureRequest *)self maximumPhotoResolution])
    {
      int64_t v34 = [(CAMStillImageCaptureRequest *)self maximumPhotoResolution];
    }
    else
    {
      int64_t v34 = 1;
    }
    $2825F4736939C4A6D3AD43837233062D v38 = +[CAMCaptureConversions CMVideoDimensionsForCAMPhotoResolution:v34];
    uint64_t v39 = [v8 availableRawEmbeddedThumbnailPhotoCodecTypes];
    v36 = [v39 firstObject];

    if (v36)
    {
      uint64_t v40 = *MEMORY[0x263EFA338];
      v78[0] = v36;
      uint64_t v41 = *MEMORY[0x263EFA458];
      v77[0] = v40;
      v77[1] = v41;
      v42 = [NSNumber numberWithInt:v38];
      v78[1] = v42;
      v77[2] = *MEMORY[0x263EFA3E8];
      v43 = [NSNumber numberWithInt:HIDWORD(*(unint64_t *)&v38)];
      v78[2] = v43;
      uint64_t v37 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:3];

      [v8 setRawEmbeddedThumbnailPhotoFormat:v37];
    }
    else
    {
      uint64_t v37 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[CAMStillImageCaptureRequest(CAMCaptureEngine) _configurePhotoSettings:shouldIgnoreInitiationSettingsProperties:context:](v37);
      }
    }
  }
  else
  {
    v35 = [v8 availableEmbeddedThumbnailPhotoCodecTypes];
    v36 = +[CAMCaptureEncodingUtilities selectPhotoCodecFromAvailableCodecs:v35 withBehavior:[(CAMCaptureRequest *)self photoEncodingBehavior]];

    if (v36)
    {
      uint64_t v75 = *MEMORY[0x263EFA338];
      v76 = v36;
      uint64_t v37 = [NSDictionary dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      [v8 setEmbeddedThumbnailPhotoFormat:v37];
    }
    else
    {
      uint64_t v37 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        -[CAMStillImageCaptureRequest(CAMCaptureEngine) _configurePhotoSettings:shouldIgnoreInitiationSettingsProperties:context:](v37);
      }
    }
  }

  v44 = [(CAMStillImageCaptureRequest *)self semanticStyle];
  if (v44)
  {
    if (!v18)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v45 = v44;
        v46 = [v45 avSemanticStyle];
        [v8 setSemanticStyle:v46];
      }
    }
  }
  v47 = +[CAMCaptureMetadataUtilities metadataFromRequest:self];
  [v8 setMetadata:v47];
  if ([(CAMStillImageCaptureRequest *)self maximumPhotoResolution])
  {
    $2825F4736939C4A6D3AD43837233062D v63 = +[CAMCaptureConversions CMVideoDimensionsForCAMPhotoResolution:[(CAMStillImageCaptureRequest *)self maximumPhotoResolution]];
    v48 = [v61 supportedMaxPhotoDimensionsPrivate];
    v49 = [MEMORY[0x263F08D40] valueWithBytes:&v63 objCType:"{?=ii}"];
    if ([v48 containsObject:v49])
    {
      [v8 setMaxPhotoDimensions:v63];
    }
    else
    {
      v50 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int var0 = v63.var0;
        __int16 v73 = 1024;
        int var1 = v63.var1;
        _os_log_impl(&dword_2099F8000, v50, OS_LOG_TYPE_DEFAULT, "supportedMaxPhotoDimensionsPrivate did not contain desired max photo dimensions (%d, %d)! Not setting AVCapturePhotoSettings maxPhotoDimensions", buf, 0xEu);
      }
    }
  }
  objc_msgSend(v8, "setUserInitiatedPhotoRequestTime:", -[CAMStillImageCaptureRequest userInitiationTime](self, "userInitiationTime"));
  v51 = +[CAMCaptureCapabilities capabilities];
  int v52 = objc_msgSend(v51, "processZoomWithoutUpscaleForDevicePosition:", -[CAMCaptureRequest captureDevicePosition](self, "captureDevicePosition"));

  if (v52 && [v10 isProcessedPhotoZoomWithoutUpscalingSupported]) {
    [v8 setProcessedPhotoZoomWithoutUpscalingEnabled:1];
  }
  if ([v61 supportsQuadraHighResolutionStillImageOutput]) {
    objc_msgSend(v8, "setHighResolutionPhotoEnabled:", objc_msgSend(v10, "isHighResolutionCaptureEnabled"));
  }
  v53 = [v8 livePhotoMovieFileURL];
  if (v53)
  {
    int v54 = [v10 isLivePhotoCaptureEnabled];

    if (v54)
    {
      int64_t v55 = [(CAMCaptureRequest *)self videoEncodingBehavior];
      v56 = [v10 availableLivePhotoVideoCodecTypes];
      v57 = +[CAMCaptureEncodingUtilities selectVideoCodecFromAvailableCodecs:v56 withBehavior:v55];
      if (v57) {
        [v8 setLivePhotoVideoCodecType:v57];
      }
    }
  }
  objc_msgSend(v8, "setAutoContentAwareDistortionCorrectionEnabled:", objc_msgSend(v10, "isContentAwareDistortionCorrectionEnabled"));
  if ([v10 isSpatialPhotoCaptureSupported]
    && [v10 isSpatialPhotoCaptureEnabled])
  {
    if ([v8 photoQualityPrioritization] == 3)
    {
      [v8 setAutoSpatialPhotoCaptureEnabled:1];
    }
    else
    {
      unint64_t v58 = +[CAMCaptureConversions CAMPhotoQualityPrioritizationForAVCapturePhotoQualityPrioritization:](CAMCaptureConversions, "CAMPhotoQualityPrioritizationForAVCapturePhotoQualityPrioritization:", [v8 photoQualityPrioritization]);
      v59 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
        -[CAMStillImageCaptureRequest(CAMCaptureEngine) _configurePhotoSettings:shouldIgnoreInitiationSettingsProperties:context:](v58, v59);
      }
    }
  }
  [(CAMStillImageCaptureRequest *)self _sanitizeCapturePhotoSettings:v8 withContext:v9];

  _Block_object_dispose(&v65, 8);
}

void __122__CAMStillImageCaptureRequest_CAMCaptureEngine___configurePhotoSettings_shouldIgnoreInitiationSettingsProperties_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 intValue] == 875704422)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)_sanitizeCapturePhotoSettings:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 currentStillImageOutput];
  id v7 = [v6 supportedFlashModes];
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "flashMode"));
  char v9 = [v7 containsObject:v8];

  if ((v9 & 1) == 0) {
    [v5 setFlashMode:0];
  }
  int64_t v10 = [v6 supportedHDRModes];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v5, "HDRMode"));
  char v12 = [v10 containsObject:v11];

  if ((v12 & 1) == 0)
  {
    [v5 setHDRMode:0];
    [v5 setEV0PhotoDeliveryEnabled:0];
  }
  if (([v6 isLivePhotoCaptureEnabled] & 1) == 0)
  {
    [v5 setLivePhotoMovieFileURL:0];
    [v5 setLivePhotoMovieFileURLForOriginalPhoto:0];
    [v5 setLivePhotoMovieMetadata:0];
    [v5 setLivePhotoMovieMetadataForOriginalPhoto:0];
  }
  uint64_t v13 = [v5 digitalFlashMode];
  BOOL v14 = [v6 supportedDigitalFlashModes];
  char v15 = [NSNumber numberWithInteger:v13];
  char v16 = [v14 containsObject:v15];

  if (v16)
  {
    if (v13)
    {
      [v5 setHDRMode:0];
      [v5 setFlashMode:0];
      [v5 setLivePhotoMovieFileURL:0];
      [v5 setLivePhotoMovieFileURLForOriginalPhoto:0];
      [v5 setLivePhotoMovieMetadata:0];
      [v5 setLivePhotoMovieMetadataForOriginalPhoto:0];
    }
  }
  else
  {
    BOOL v17 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "Disabling digital-flash capture because the output doesn't support the feature. This should only occur when the feature is force enabled via defaults.", buf, 2u);
    }

    [v5 setDigitalFlashMode:0];
  }
  if (([v6 isDepthDataDeliverySupported] & 1) == 0
    && [v5 isDepthDataDeliveryEnabled])
  {
    v18 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CGFloat v24 = 0;
      _os_log_impl(&dword_2099F8000, v18, OS_LOG_TYPE_DEFAULT, "Disabling depth delivery on photo output settings, because the output doesn't support depth delivery. This should only occur when Portrait is force enabled, as during emulation.", v24, 2u);
    }

    [v5 setDepthDataDeliveryEnabled:0];
  }
  if (([v6 isPortraitEffectsMatteDeliverySupported] & 1) == 0)
  {
    [v5 setPortraitEffectsMatteDeliveryEnabled:0];
    [v5 setEmbedsPortraitEffectsMatteInPhoto:0];
  }
  uint64_t v19 = [v5 semanticStyle];

  int v20 = [v6 isSemanticStyleRenderingSupported];
  int v21 = [v6 isSemanticStyleRenderingEnabled];
  if (v19 && (v20 & v21 & 1) == 0)
  {
    v22 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v23 = 0;
      _os_log_impl(&dword_2099F8000, v22, OS_LOG_TYPE_DEFAULT, "Disabling Semantic Style on photo settings, because it is not supported on the device. This should only occur if the device is forced without Camera.app knowing about it or a fallback device is used.", v23, 2u);
    }

    [v5 setSemanticStyle:0];
  }
}

+ (unsigned)rawPixelFormatTypeForPhotoOutput:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unsigned int v3 = 1815491698;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(a3, "availableRawPhotoPixelFormatTypes", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        char v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(MEMORY[0x263EFA620], "isAppleProRAWPixelFormat:", objc_msgSend(v9, "unsignedIntValue")))
        {
          unsigned int v3 = [v9 unsignedIntValue];
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)needsLivePhotoCaptureResumedOnPhotoOutput:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CAMStillImageCaptureRequest *)self irisMode];
  uint64_t v6 = [(CAMStillImageCaptureRequest *)self irisLocalVideoDestinationURLForEV0:0];

  char v7 = [v4 isLivePhotoCaptureEnabled];
  char v8 = [v4 isLivePhotoCaptureSuspended];

  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    char v10 = 0;
  }
  else {
    char v10 = v7;
  }
  return v10 & v8;
}

@end