@interface CAMAnalyticsCaptureEvent
- (BOOL)_isStillDuringVideo;
- (BOOL)_outputToExternalStorage;
- (BOOL)_spatialVideoEnabled;
- (CAMAnalyticsCaptureEvent)initWithEvent:(id)a3;
- (CAMAnalyticsCaptureEvent)initWithGraphConfiguration:(id)a3 outputToExternalStorage:(BOOL)a4;
- (id)_defaultRangeStringForValue:(float)a3 lowerBound:(float)a4 upperBound:(float)a5 defaultValue:(float)a6;
- (id)_zoomRangeStringForDisplayZoomValue:(double)a3 zoomPoints:(id)a4 mode:(int64_t)a5 device:(int64_t)a6;
- (id)eventName;
- (int64_t)_captureDevice;
- (int64_t)_captureDevicePosition;
- (int64_t)_captureMode;
- (int64_t)_captureVideoConfiguration;
- (int64_t)_colorSpace;
- (int64_t)_lightingEffectType;
- (int64_t)_mediaType;
- (int64_t)_videoStabilizationStrength;
- (void)_populateFromCaptureRequest:(id)a3;
- (void)populateAEAFLocked:(BOOL)a3;
- (void)populateBurstLength:(int64_t)a3;
- (void)populateDesiredFlashMode:(int64_t)a3 desiredLivePhotoMode:(int64_t)a4 desiredHDRMode:(int64_t)a5 timerDuration:(int64_t)a6;
- (void)populateDesiredMacroMode:(int64_t)a3 isMacroCapture:(BOOL)a4 isMacroSuggested:(BOOL)a5;
- (void)populateDesiredNightModeControlMode:(unint64_t)a3 resolvedNightModeControlMode:(unint64_t)a4 resolvedNightModeMode:(int64_t)a5 nightModeStatus:(int64_t)a6;
- (void)populateDesiredTorchMode:(int64_t)a3;
- (void)populateDeviceOrientation:(int64_t)a3 isDeviceOrientationLocked:(BOOL)a4;
- (void)populateDuration:(double)a3;
- (void)populateExposureSliderBias:(float)a3 exposureTapAndBias:(float)a4 totalExposureBias:(float)a5;
- (void)populateForTimelapseCaptureOrientation:(int64_t)a3 captureMirrored:(BOOL)a4 origin:(int64_t)a5 pressType:(int64_t)a6 startDate:(id)a7;
- (void)populateFromPanoramaCaptureNotification:(int64_t)a3;
- (void)populateFromPanoramaCaptureRequest:(id)a3;
- (void)populateFromStillImageCaptureRequest:(id)a3 burst:(BOOL)a4 preferences:(id)a5;
- (void)populateFromStillImageCaptureResponse:(id)a3;
- (void)populateFromVideoCaptureRequest:(id)a3 preferences:(id)a4;
- (void)populateFromVideoCaptureResponse:(id)a3;
- (void)populateObjectResultsWithNumberOfFaces:(unint64_t)a3 numberOfCats:(unint64_t)a4 numberOfDogs:(unint64_t)a5;
- (void)populatePanoramaDirection:(int64_t)a3;
- (void)populatePanoramaInstruction:(int64_t)a3;
- (void)populatePortraitStatus:(int64_t)a3 lightingEffectIntensity:(double)a4 apertureValue:(double)a5 zoomFactor:(double)a6 isDepthSuggestionAllowed:(BOOL)a7 request:(id)a8;
- (void)populateSharedLibraryMode:(int64_t)a3;
- (void)populateZoomFromDisplayZoomValue:(double)a3 zoomPoints:(id)a4 zoomInteractionType:(int64_t)a5;
- (void)populateZoomFromZoomButtonSymbol:(int64_t)a3 zoomInteractionType:(int64_t)a4;
- (void)set_isStillDuringVideo:(BOOL)a3;
- (void)set_lightingEffectType:(int64_t)a3;
- (void)set_mediaType:(int64_t)a3;
- (void)set_outputToExternalStorage:(BOOL)a3;
@end

@implementation CAMAnalyticsCaptureEvent

- (CAMAnalyticsCaptureEvent)initWithGraphConfiguration:(id)a3 outputToExternalStorage:(BOOL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMAnalyticsCaptureEvent;
  v7 = [(CAMAnalyticsEvent *)&v10 init];
  if (v7)
  {
    v7->__captureMode = [v6 mode];
    v7->__captureDevice = [v6 device];
    v7->__captureDevicePosition = [v6 devicePosition];
    v7->__captureVideoConfiguration = [v6 videoConfiguration];
    v7->__videoStabilizationStrength = [v6 videoStabilizationStrength];
    v7->__outputToExternalStorage = a4;
    v7->__colorSpace = [v6 colorSpace];
    v7->__spatialVideoEnabled = [v6 enableStereoVideoCapture];
    v8 = v7;
  }

  return v7;
}

- (CAMAnalyticsCaptureEvent)initWithEvent:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMAnalyticsCaptureEvent;
  v5 = [(CAMAnalyticsEvent *)&v8 initWithEvent:v4];
  if (v5)
  {
    v5->__captureMode = [v4 _captureMode];
    v5->__captureDevice = [v4 _captureDevice];
    v5->__captureDevicePosition = [v4 _captureDevicePosition];
    v5->__captureVideoConfiguration = [v4 _captureVideoConfiguration];
    v5->__mediaType = [v4 _mediaType];
    v5->__isStillDuringVideo = [v4 _isStillDuringVideo];
    v5->__outputToExternalStorage = [v4 _outputToExternalStorage];
    v5->__colorSpace = [v4 _colorSpace];
    id v6 = v5;
  }

  return v5;
}

- (id)eventName
{
  return @"capture";
}

- (void)_populateFromCaptureRequest:(id)a3
{
  id v42 = a3;
  uint64_t v4 = [v42 type];
  if (v4 == 2)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = v4;
    if (v4 != 1)
    {
      if (v4) {
        goto LABEL_8;
      }
      unint64_t v6 = [v42 ctmCaptureType];
      if (v6 >= 3) {
        goto LABEL_8;
      }
      uint64_t v5 = qword_209C7BC10[v6];
    }
  }
  [(CAMAnalyticsCaptureEvent *)self set_mediaType:v5];
LABEL_8:
  unint64_t v7 = objc_msgSend(v42, "captureMode", v5);
  if (v7 > 9) {
    objc_super v8 = 0;
  }
  else {
    objc_super v8 = off_263FA65E8[v7];
  }
  v9 = [(CAMAnalyticsEvent *)self _eventMap];
  [v9 setObject:v8 forKeyedSubscript:@"captureMode"];

  unint64_t v10 = [v42 captureDevice];
  if (v10 > 0xB) {
    v11 = 0;
  }
  else {
    v11 = off_263FA67A0[v10];
  }
  v12 = [(CAMAnalyticsEvent *)self _eventMap];
  [v12 setObject:v11 forKeyedSubscript:@"device"];

  uint64_t v13 = [v42 captureDevicePosition];
  v14 = @"Front";
  if (v13 != 1) {
    v14 = 0;
  }
  if (!v13) {
    v14 = @"Back";
  }
  v15 = v14;
  v16 = [(CAMAnalyticsEvent *)self _eventMap];
  [v16 setObject:v15 forKeyedSubscript:@"devicePosition"];

  unint64_t v17 = [v42 captureOrientation];
  v18 = 0;
  if (v17 <= 4) {
    v18 = off_263FA6800[v17];
  }
  v19 = [(CAMAnalyticsEvent *)self _eventMap];
  [v19 setObject:v18 forKeyedSubscript:@"orientation"];

  unint64_t v20 = [v42 origin];
  if (v20 > 3) {
    v21 = 0;
  }
  else {
    v21 = off_263FA6828[v20];
  }
  v22 = [(CAMAnalyticsEvent *)self _eventMap];
  [v22 setObject:v21 forKeyedSubscript:@"origin"];

  v23 = +[CAMCaptureCapabilities capabilities];
  unint64_t v24 = [v23 hostProcess];
  if (v24 > 5) {
    v25 = 0;
  }
  else {
    v25 = off_263FA6848[v24];
  }
  v26 = [(CAMAnalyticsEvent *)self _eventMap];
  [v26 setObject:v25 forKeyedSubscript:@"hostProcess"];

  v27 = [MEMORY[0x263F086E0] mainBundle];
  v28 = [v27 bundleIdentifier];
  v29 = [(CAMAnalyticsEvent *)self _eventMap];
  [v29 setObject:v28 forKeyedSubscript:@"bundleID"];

  uint64_t v30 = [v42 pressType];
  v31 = @"Primary";
  switch(v30)
  {
    case 'f':
      v31 = @"Secondary";
      break;
    case 'g':
      break;
    case 'h':
      v31 = @"Lock";
      break;
    case 'i':
      goto LABEL_30;
    case 'j':
      v31 = @"CameraButton";
      break;
    default:
      if (v30 == 601) {
        v31 = @"CameraCaseShutter";
      }
      else {
LABEL_30:
      }
        v31 = @"Other";
      break;
  }
  v32 = [(CAMAnalyticsEvent *)self _eventMap];
  [v32 setObject:v31 forKeyedSubscript:@"pressType"];

  int64_t v33 = [(CAMAnalyticsCaptureEvent *)self _mediaType];
  v34 = @"Video";
  if (v33 != 1) {
    v34 = 0;
  }
  if (!v33) {
    v34 = @"Photo";
  }
  v35 = v34;
  v36 = [(CAMAnalyticsEvent *)self _eventMap];
  [v36 setObject:v35 forKeyedSubscript:@"captureType"];

  v37 = 0;
  unint64_t v38 = [v42 audioConfiguration] - 1;
  if (v38 <= 2) {
    v37 = off_263FA6638[v38];
  }
  v39 = [(CAMAnalyticsEvent *)self _eventMap];
  [v39 setObject:v37 forKeyedSubscript:@"audioConfiguration"];

  if ([v42 captureDevicePosition] == 1)
  {
    v40 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v42, "isCaptureMirrored"));
    v41 = [(CAMAnalyticsEvent *)self _eventMap];
    [v41 setObject:v40 forKeyedSubscript:@"isCaptureMirrored"];
  }
}

- (void)populateFromStillImageCaptureRequest:(id)a3 burst:(BOOL)a4 preferences:(id)a5
{
  id v60 = a3;
  id v7 = a5;
  objc_super v8 = +[CAMCaptureCapabilities capabilities];
  [(CAMAnalyticsCaptureEvent *)self _populateFromCaptureRequest:v60];
  -[CAMAnalyticsCaptureEvent set_isStillDuringVideo:](self, "set_isStillDuringVideo:", [v60 stillDuringVideo]);
  unint64_t v9 = [v60 captureMode];
  if (![(CAMAnalyticsCaptureEvent *)self _mediaType])
  {
    unint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[CAMAnalyticsCaptureEvent _isStillDuringVideo](self, "_isStillDuringVideo"));
    v11 = [(CAMAnalyticsEvent *)self _eventMap];
    [v11 setObject:v10 forKeyedSubscript:@"isStillDuringVideo"];

    if (![(CAMAnalyticsCaptureEvent *)self _isStillDuringVideo])
    {
      if (objc_msgSend(v8, "isLivePhotoSupportedForMode:devicePosition:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition")))
      {
        unint64_t v12 = [v60 irisMode];
        if (v12 > 2) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = off_263FA6968[v12];
        }
        v14 = [(CAMAnalyticsEvent *)self _eventMap];
        [v14 setObject:v13 forKeyedSubscript:@"resolvedLivePhotoMode"];
      }
      if (objc_msgSend(v8, "isHDRSupportedForMode:devicePosition:", objc_msgSend(v60, "captureMode"), objc_msgSend(v60, "captureDevicePosition")))
      {
        unint64_t v15 = [v60 hdrMode];
        if (v15 > 2) {
          v16 = 0;
        }
        else {
          v16 = off_263FA6968[v15];
        }
        unint64_t v17 = [(CAMAnalyticsEvent *)self _eventMap];
        [v17 setObject:v16 forKeyedSubscript:@"resolvedHDRMode"];
      }
      if (objc_msgSend(v8, "isLowLightSupportedForMode:device:", objc_msgSend(v60, "captureMode"), objc_msgSend(v60, "captureDevice")))
      {
        unint64_t v18 = [v60 lowLightMode];
        if (v18 > 2) {
          v19 = 0;
        }
        else {
          v19 = off_263FA6930[v18];
        }
        unint64_t v20 = [(CAMAnalyticsEvent *)self _eventMap];
        [v20 setObject:v19 forKeyedSubscript:@"resolvedLowLightMode"];
      }
      if (objc_msgSend(v8, "isLightingControlSupportedForMode:", objc_msgSend(v60, "captureMode")))
      {
        -[CAMAnalyticsCaptureEvent set_lightingEffectType:](self, "set_lightingEffectType:", [v60 lightingEffectType]);
        unint64_t v21 = [v60 lightingEffectType];
        if (v21 > 6) {
          v22 = 0;
        }
        else {
          v22 = off_263FA6650[v21];
        }
        v23 = [(CAMAnalyticsEvent *)self _eventMap];
        [v23 setObject:v22 forKeyedSubscript:@"lightingType"];
      }
      if ([v8 semanticStylesSupport])
      {
        unint64_t v24 = [v60 semanticStyle];

        if (v24)
        {
          v25 = [v60 semanticStyle];
          v26 = [v25 analyticsDictionaryForCapture];

          v27 = [(CAMAnalyticsEvent *)self _eventMap];
          [v27 addEntriesFromDictionary:v26];
        }
      }
      v28 = +[CAMCaptureCapabilities capabilities];
      int v29 = [v28 isLinearDNGSupported];

      int v30 = [v7 rawControlEnabled];
      if (v29 && v30)
      {
        if ([v60 photoEncodingBehavior] == 2)
        {
          v31 = [NSNumber numberWithBool:1];
          v32 = [(CAMAnalyticsEvent *)self _eventMap];
          [v32 setObject:v31 forKeyedSubscript:@"linearDNG"];

          int64_t v33 = NSNumber;
          unint64_t v34 = [v60 maximumPhotoResolution] - 1;
          if (v34 > 2) {
            uint64_t v35 = 0;
          }
          else {
            uint64_t v35 = qword_209C7BC28[v34];
          }
          v36 = [v33 numberWithInteger:v35];
          v37 = [(CAMAnalyticsEvent *)self _eventMap];
          unint64_t v38 = v37;
          v39 = @"linearDNGResolution";
        }
        else
        {
          v36 = [NSNumber numberWithBool:0];
          v37 = [(CAMAnalyticsEvent *)self _eventMap];
          unint64_t v38 = v37;
          v39 = @"linearDNG";
        }
        [v37 setObject:v36 forKeyedSubscript:v39];
      }
      v40 = objc_msgSend(v8, "supportedPhotoResolutionsForMode:devicePosition:photoEncoding:", objc_msgSend(v60, "captureMode"), objc_msgSend(v60, "captureDevicePosition"), objc_msgSend(v60, "photoEncodingBehavior"));
      unint64_t v41 = [v40 count];

      if (v41 >= 2)
      {
        id v42 = NSNumber;
        unint64_t v43 = [v60 maximumPhotoResolution] - 1;
        if (v43 > 2) {
          uint64_t v44 = 0;
        }
        else {
          uint64_t v44 = qword_209C7BC28[v43];
        }
        v45 = [v42 numberWithInteger:v44];
        v46 = [(CAMAnalyticsEvent *)self _eventMap];
        [v46 setObject:v45 forKeyedSubscript:@"desiredMaximumResolution"];
      }
    }
  }
  v47 = +[CAMCaptureCapabilities capabilities];
  int v48 = objc_msgSend(v47, "isFlashSupportedForMode:devicePosition:", objc_msgSend(v60, "captureMode"), objc_msgSend(v60, "captureDevicePosition"));

  if (v48 && ![(CAMAnalyticsCaptureEvent *)self _isStillDuringVideo])
  {
    unint64_t v49 = [v60 flashMode];
    if (v49 > 2) {
      v50 = 0;
    }
    else {
      v50 = off_263FA6968[v49];
    }
    v51 = [(CAMAnalyticsEvent *)self _eventMap];
    [v51 setObject:v50 forKeyedSubscript:@"resolvedFlashMode"];
  }
  v52 = +[CAMCaptureCapabilities capabilities];
  int v53 = objc_msgSend(v52, "isAspectRatioCropSupportedForMode:devicePosition:", objc_msgSend(v60, "captureMode"), objc_msgSend(v60, "captureDevicePosition"));

  if (v53)
  {
    unint64_t v54 = [v60 aspectRatioCrop];
    if (v54 > 3) {
      v55 = 0;
    }
    else {
      v55 = off_263FA6688[v54];
    }
    v56 = [(CAMAnalyticsEvent *)self _eventMap];
    [v56 setObject:v55 forKeyedSubscript:@"aspectRatio"];
  }
  if (v9 <= 7 && (((0xC0u >> v9) | (0x11u >> v9)) & 1) != 0)
  {
    unint64_t v57 = [v60 effectFilterType];
    if (v57 > 0x10) {
      v58 = 0;
    }
    else {
      v58 = off_263FA66A8[v57];
    }
    v59 = [(CAMAnalyticsEvent *)self _eventMap];
    [v59 setObject:v58 forKeyedSubscript:@"filterType"];
  }
}

- (void)populateFromVideoCaptureRequest:(id)a3 preferences:(id)a4
{
  id v39 = a3;
  id v6 = a4;
  id v7 = +[CAMCaptureCapabilities capabilities];
  [(CAMAnalyticsCaptureEvent *)self _populateFromCaptureRequest:v39];
  if ([v39 trueVideoEnabled] && objc_msgSend(v39, "captureMode") == 8)
  {
    objc_super v8 = [(CAMAnalyticsEvent *)self _eventMap];
    unint64_t v9 = v8;
    unint64_t v10 = @"SpatialPhoto";
LABEL_7:
    [v8 setObject:v10 forKeyedSubscript:@"captureMode"];

    goto LABEL_8;
  }
  if ([v39 trueVideoEnabled] && objc_msgSend(v39, "captureMode") == 1)
  {
    objc_super v8 = [(CAMAnalyticsEvent *)self _eventMap];
    unint64_t v9 = v8;
    unint64_t v10 = @"Photo";
    goto LABEL_7;
  }
LABEL_8:
  if (objc_msgSend(v7, "isFlashOrTorchSupportedForMode:devicePosition:", objc_msgSend(v39, "captureMode"), objc_msgSend(v39, "captureDevicePosition")))
  {
    unint64_t v11 = [v39 torchMode];
    if (v11 > 2) {
      unint64_t v12 = 0;
    }
    else {
      unint64_t v12 = off_263FA6968[v11];
    }
    uint64_t v13 = [(CAMAnalyticsEvent *)self _eventMap];
    [v13 setObject:v12 forKeyedSubscript:@"resolvedTorchMode"];
  }
  uint64_t v14 = [v6 prefersHDR10BitVideoForCapabilities:v7];
  LOBYTE(v38) = v14;
  uint64_t v15 = objc_msgSend(v7, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", objc_msgSend(v39, "captureMode"), objc_msgSend(v39, "captureDevice"), objc_msgSend(v39, "videoEncodingBehavior"), objc_msgSend(v39, "captureVideoConfiguration"), -[CAMAnalyticsCaptureEvent _outputToExternalStorage](self, "_outputToExternalStorage"), -[CAMAnalyticsCaptureEvent _spatialVideoEnabled](self, "_spatialVideoEnabled"), v38);
  switch(v15)
  {
    case 0:
      v16 = @"Auto";
      break;
    case 1:
      v16 = @"1080p60";
      break;
    case 2:
      v16 = @"720p120";
      break;
    case 3:
      v16 = @"720p240";
      break;
    case 4:
      v16 = @"1080p120";
      break;
    case 5:
      v16 = @"4k30";
      break;
    case 6:
      v16 = @"720p30";
      break;
    case 7:
      v16 = @"1080p30";
      break;
    case 8:
      v16 = @"1080p240";
      break;
    case 9:
      v16 = @"4k60";
      break;
    case 10:
      v16 = @"4k24";
      break;
    case 11:
      v16 = @"1080p25";
      break;
    case 12:
      v16 = @"4k25";
      break;
    case 13:
      v16 = @"4k120";
      break;
    case 14:
      v16 = @"4k100";
      break;
    default:
      switch(v15)
      {
        case 10000:
          v16 = @"ImagePickerHigh";
          break;
        case 10001:
          v16 = @"ImagePickerMedium";
          break;
        case 10002:
          v16 = @"ImagePickerLow";
          break;
        case 10003:
          v16 = @"ImagePickerVGA";
          break;
        case 10004:
          v16 = @"ImagePickeriFrame720p";
          break;
        case 10005:
          v16 = @"ImagePickeriFrame540p";
          break;
        default:
          v16 = 0;
          break;
      }
      break;
  }
  unint64_t v17 = [(CAMAnalyticsEvent *)self _eventMap];
  [v17 setObject:v16 forKeyedSubscript:@"videoConfiguration"];

  int v18 = [v7 isProResVideoSupported];
  int v19 = [v6 isProResControlEnabled];
  if (v18 && v19)
  {
    BOOL v20 = [v39 videoEncodingBehavior] == 2;
    unint64_t v21 = [NSNumber numberWithBool:v20];
    v22 = [(CAMAnalyticsEvent *)self _eventMap];
    [v22 setObject:v21 forKeyedSubscript:@"proRes"];
  }
  uint64_t v23 = [v39 captureMode];
  if (v23 == 2)
  {
    uint64_t v25 = [v6 slomoConfiguration];
    switch(v25)
    {
      case 0:
LABEL_44:
        v26 = @"Auto";
        break;
      case 1:
LABEL_48:
        v26 = @"1080p60";
        break;
      case 2:
LABEL_49:
        v26 = @"720p120";
        break;
      case 3:
LABEL_50:
        v26 = @"720p240";
        break;
      case 4:
LABEL_51:
        v26 = @"1080p120";
        break;
      case 5:
LABEL_52:
        v26 = @"4k30";
        break;
      case 6:
LABEL_53:
        v26 = @"720p30";
        break;
      case 7:
LABEL_54:
        v26 = @"1080p30";
        break;
      case 8:
LABEL_67:
        v26 = @"1080p240";
        break;
      case 9:
LABEL_55:
        v26 = @"4k60";
        break;
      case 10:
LABEL_56:
        v26 = @"4k24";
        break;
      case 11:
LABEL_57:
        v26 = @"1080p25";
        break;
      case 12:
LABEL_58:
        v26 = @"4k25";
        break;
      case 13:
LABEL_59:
        v26 = @"4k120";
        break;
      case 14:
LABEL_60:
        v26 = @"4k100";
        break;
      default:
        switch(v25)
        {
          case 10000:
LABEL_47:
            v26 = @"ImagePickerHigh";
            break;
          case 10001:
LABEL_62:
            v26 = @"ImagePickerMedium";
            break;
          case 10002:
LABEL_63:
            v26 = @"ImagePickerLow";
            break;
          case 10003:
LABEL_64:
            v26 = @"ImagePickerVGA";
            break;
          case 10004:
LABEL_65:
            v26 = @"ImagePickeriFrame720p";
            break;
          case 10005:
LABEL_66:
            v26 = @"ImagePickeriFrame540p";
            break;
          default:
LABEL_61:
            v26 = 0;
            break;
        }
        break;
    }
    v27 = [(CAMAnalyticsEvent *)self _eventMap];
    [v27 setObject:v26 forKeyedSubscript:@"preferredVideoConfiguration"];
  }
  else if (v23 == 1)
  {
    uint64_t v24 = [v6 videoConfiguration];
    switch(v24)
    {
      case 0:
        goto LABEL_44;
      case 1:
        goto LABEL_48;
      case 2:
        goto LABEL_49;
      case 3:
        goto LABEL_50;
      case 4:
        goto LABEL_51;
      case 5:
        goto LABEL_52;
      case 6:
        goto LABEL_53;
      case 7:
        goto LABEL_54;
      case 8:
        goto LABEL_67;
      case 9:
        goto LABEL_55;
      case 10:
        goto LABEL_56;
      case 11:
        goto LABEL_57;
      case 12:
        goto LABEL_58;
      case 13:
        goto LABEL_59;
      case 14:
        goto LABEL_60;
      default:
        switch(v24)
        {
          case 10000:
            goto LABEL_47;
          case 10001:
            goto LABEL_62;
          case 10002:
            goto LABEL_63;
          case 10003:
            goto LABEL_64;
          case 10004:
            goto LABEL_65;
          case 10005:
            goto LABEL_66;
          default:
            goto LABEL_61;
        }
    }
  }
  if (objc_msgSend(v7, "isVideoStabilizationControlSupportedForMode:device:videoConfiguration:videoEncodingBehavior:trueVideoEnabled:prefersHDR10BitVideo:", objc_msgSend(v39, "captureMode"), objc_msgSend(v39, "captureDevice"), objc_msgSend(v39, "captureVideoConfiguration"), objc_msgSend(v39, "videoEncodingBehavior"), objc_msgSend(v39, "trueVideoEnabled"), v14))
  {
    unint64_t v28 = [(CAMAnalyticsCaptureEvent *)self _videoStabilizationStrength];
    if (v28 > 3) {
      int v29 = 0;
    }
    else {
      int v29 = off_263FA6730[v28];
    }
    int v30 = [(CAMAnalyticsEvent *)self _eventMap];
    [v30 setObject:v29 forKeyedSubscript:@"videoStabilizationStrength"];
  }
  if (objc_msgSend(v7, "isExternalStorageOutputSupportedForMode:videoEncodingBehavior:", objc_msgSend(v39, "captureMode"), objc_msgSend(v39, "videoEncodingBehavior")))
  {
    v31 = objc_msgSend(NSNumber, "numberWithBool:", -[CAMAnalyticsCaptureEvent _outputToExternalStorage](self, "_outputToExternalStorage"));
    v32 = [(CAMAnalyticsEvent *)self _eventMap];
    [v32 setObject:v31 forKeyedSubscript:@"externalStorage"];
  }
  unint64_t v33 = [(CAMAnalyticsCaptureEvent *)self _colorSpace];
  if (v33 > 3) {
    unint64_t v34 = 0;
  }
  else {
    unint64_t v34 = off_263FA6750[v33];
  }
  uint64_t v35 = [(CAMAnalyticsEvent *)self _eventMap];
  [v35 setObject:v34 forKeyedSubscript:@"colorSpace"];

  if (objc_msgSend(v7, "isSpatialVideoInVideoModeSupportedForMode:devicePosition:", objc_msgSend(v39, "captureMode"), objc_msgSend(v39, "captureDevicePosition")))
  {
    v36 = objc_msgSend(NSNumber, "numberWithBool:", -[CAMAnalyticsCaptureEvent _spatialVideoEnabled](self, "_spatialVideoEnabled"));
    v37 = [(CAMAnalyticsEvent *)self _eventMap];
    [v37 setObject:v36 forKeyedSubscript:@"spatialVideoEnabled"];
  }
}

- (void)populateFromPanoramaCaptureRequest:(id)a3
{
  [(CAMAnalyticsCaptureEvent *)self _populateFromCaptureRequest:a3];
  uint64_t v4 = [(CAMAnalyticsEvent *)self _eventMap];
  uint64_t v5 = MEMORY[0x263EFFA80];
  [v4 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"slowDownPanoramaInstruction"];

  id v6 = [(CAMAnalyticsEvent *)self _eventMap];
  [v6 setObject:v5 forKeyedSubscript:@"moveUpPanoramaInstruction"];

  id v7 = [(CAMAnalyticsEvent *)self _eventMap];
  [v7 setObject:v5 forKeyedSubscript:@"moveDownPanoramaInstruction"];

  id v8 = [(CAMAnalyticsEvent *)self _eventMap];
  [v8 setObject:@"Shutter" forKeyedSubscript:@"panoramaStopReason"];
}

- (void)populatePanoramaDirection:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    v3 = 0;
  }
  else {
    v3 = off_263FA6770[a3];
  }
  id v4 = [(CAMAnalyticsEvent *)self _eventMap];
  [v4 setObject:v3 forKeyedSubscript:@"panoramaCaptureDirection"];
}

- (void)populatePanoramaInstruction:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) <= 2)
  {
    id v4 = off_263FA6788[a3 - 3];
    id v5 = [(CAMAnalyticsEvent *)self _eventMap];
    [v5 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:v4];
  }
}

- (void)populateFromPanoramaCaptureNotification:(int64_t)a3
{
  uint64_t v3 = @"ReachedMaximumSize";
  if (a3 != -6000) {
    uint64_t v3 = 0;
  }
  if (a3 == -6001) {
    uint64_t v3 = @"ChangedDirection";
  }
  if (v3)
  {
    id v5 = v3;
    id v6 = [(CAMAnalyticsEvent *)self _eventMap];
    [v6 setObject:v5 forKeyedSubscript:@"panoramaStopReason"];
  }
}

- (void)populateForTimelapseCaptureOrientation:(int64_t)a3 captureMirrored:(BOOL)a4 origin:(int64_t)a5 pressType:(int64_t)a6 startDate:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  [(CAMAnalyticsCaptureEvent *)self set_mediaType:1];
  [(CAMAnalyticsCaptureEvent *)self set_isStillDuringVideo:0];
  uint64_t v13 = [(CAMAnalyticsEvent *)self _eventMap];
  [v13 setObject:@"Timelapse" forKeyedSubscript:@"captureMode"];

  unint64_t v14 = [(CAMAnalyticsCaptureEvent *)self _captureDevice];
  if (v14 > 0xB) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = off_263FA67A0[v14];
  }
  v16 = [(CAMAnalyticsEvent *)self _eventMap];
  [v16 setObject:v15 forKeyedSubscript:@"device"];

  int64_t v17 = [(CAMAnalyticsCaptureEvent *)self _captureDevicePosition];
  int v18 = @"Front";
  if (v17 != 1) {
    int v18 = 0;
  }
  if (!v17) {
    int v18 = @"Back";
  }
  int v19 = v18;
  BOOL v20 = [(CAMAnalyticsEvent *)self _eventMap];
  [v20 setObject:v19 forKeyedSubscript:@"devicePosition"];

  unint64_t v21 = 0;
  if ((unint64_t)a3 <= 4) {
    unint64_t v21 = off_263FA6800[a3];
  }
  v22 = [(CAMAnalyticsEvent *)self _eventMap];
  [v22 setObject:v21 forKeyedSubscript:@"orientation"];

  if ((unint64_t)a5 > 3) {
    uint64_t v23 = 0;
  }
  else {
    uint64_t v23 = off_263FA6828[a5];
  }
  uint64_t v24 = [(CAMAnalyticsEvent *)self _eventMap];
  [v24 setObject:v23 forKeyedSubscript:@"origin"];

  uint64_t v25 = +[CAMCaptureCapabilities capabilities];
  unint64_t v26 = [v25 hostProcess];
  if (v26 > 5) {
    v27 = 0;
  }
  else {
    v27 = off_263FA6848[v26];
  }
  unint64_t v28 = [(CAMAnalyticsEvent *)self _eventMap];
  [v28 setObject:v27 forKeyedSubscript:@"hostProcess"];

  int v29 = [MEMORY[0x263F086E0] mainBundle];
  int v30 = [v29 bundleIdentifier];
  v31 = [(CAMAnalyticsEvent *)self _eventMap];
  [v31 setObject:v30 forKeyedSubscript:@"bundleID"];

  int64_t v32 = a6 - 102;
  unint64_t v33 = @"Primary";
  switch(v32)
  {
    case 0:
      unint64_t v33 = @"Secondary";
      break;
    case 1:
      break;
    case 2:
      unint64_t v33 = @"Lock";
      break;
    case 3:
      goto LABEL_20;
    case 4:
      unint64_t v33 = @"CameraButton";
      break;
    default:
      if (@"Primary" == (__CFString *)601) {
        unint64_t v33 = @"CameraCaseShutter";
      }
      else {
LABEL_20:
      }
        unint64_t v33 = @"Other";
      break;
  }
  unint64_t v34 = [(CAMAnalyticsEvent *)self _eventMap];
  [v34 setObject:v33 forKeyedSubscript:@"pressType"];

  uint64_t v35 = [(CAMAnalyticsEvent *)self _eventMap];
  [v35 setObject:@"Video" forKeyedSubscript:@"captureType"];

  v36 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v42 = [v36 components:32 fromDate:v12];

  uint64_t v37 = [v42 hour];
  uint64_t v38 = [NSNumber numberWithInteger:v37];
  id v39 = [(CAMAnalyticsEvent *)self _eventMap];
  [v39 setObject:v38 forKeyedSubscript:@"userLocalTimeHour"];

  if ([(CAMAnalyticsCaptureEvent *)self _captureDevicePosition] == 1)
  {
    v40 = [NSNumber numberWithBool:v9];
    unint64_t v41 = [(CAMAnalyticsEvent *)self _eventMap];
    [v41 setObject:v40 forKeyedSubscript:@"isCaptureMirrored"];
  }
}

- (void)populateFromStillImageCaptureResponse:(id)a3
{
  id v15 = a3;
  id v4 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v5 = [v15 captureDate];
  id v6 = [v4 components:32 fromDate:v5];

  uint64_t v7 = [v6 hour];
  id v8 = [NSNumber numberWithInteger:v7];
  BOOL v9 = [(CAMAnalyticsEvent *)self _eventMap];
  [v9 setObject:v8 forKeyedSubscript:@"userLocalTimeHour"];

  unint64_t v10 = +[CAMCaptureCapabilities capabilities];
  LODWORD(v9) = objc_msgSend(v10, "isSemanticDevelopmentSupportedForMode:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"));

  uint64_t v11 = [v15 semanticEnhanceScene];
  if (v9 && v11 && ![(CAMAnalyticsCaptureEvent *)self _isStillDuringVideo])
  {
    unint64_t v12 = [v15 semanticEnhanceScene] + 1;
    if (v12 > 4) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = off_263FA6878[v12];
    }
    unint64_t v14 = [(CAMAnalyticsEvent *)self _eventMap];
    [v14 setObject:v13 forKeyedSubscript:@"semanticEnhanceScene"];
  }
}

- (void)populateFromVideoCaptureResponse:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    [v4 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  [(CAMAnalyticsCaptureEvent *)self populateDuration:CMTimeGetSeconds(&time)];
  id v6 = [MEMORY[0x263EFF8F0] currentCalendar];
  uint64_t v7 = [v5 captureDate];
  id v8 = [v6 components:32 fromDate:v7];

  uint64_t v9 = [v8 hour];
  unint64_t v10 = [NSNumber numberWithInteger:v9];
  uint64_t v11 = [(CAMAnalyticsEvent *)self _eventMap];
  [v11 setObject:v10 forKeyedSubscript:@"userLocalTimeHour"];

  unint64_t v12 = [v5 reason] - 1;
  if (v12 <= 4)
  {
    uint64_t v13 = off_263FA68A0[v12];
    unint64_t v14 = [(CAMAnalyticsEvent *)self _eventMap];
    [v14 setObject:v13 forKeyedSubscript:@"videoCaptureError"];
  }
}

- (void)populateAEAFLocked:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(CAMAnalyticsEvent *)self _eventMap];
  [v4 setObject:v5 forKeyedSubscript:@"aeafLock"];
}

- (void)populateZoomFromDisplayZoomValue:(double)a3 zoomPoints:(id)a4 zoomInteractionType:(int64_t)a5
{
  id v18 = a4;
  id v8 = +[CAMCaptureCapabilities capabilities];
  char v9 = objc_msgSend(v8, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"), -[CAMAnalyticsCaptureEvent _captureVideoConfiguration](self, "_captureVideoConfiguration"), -[CAMAnalyticsCaptureEvent _videoStabilizationStrength](self, "_videoStabilizationStrength"));

  unint64_t v10 = +[CAMCaptureCapabilities capabilities];
  int v11 = objc_msgSend(v10, "shouldAllowCameraToggleForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"), -[CAMAnalyticsCaptureEvent _captureVideoConfiguration](self, "_captureVideoConfiguration"), -[CAMAnalyticsCaptureEvent _videoStabilizationStrength](self, "_videoStabilizationStrength"));

  if ((v9 & 1) != 0 || v11)
  {
    unint64_t v12 = [NSNumber numberWithDouble:a3];
    uint64_t v13 = [(CAMAnalyticsEvent *)self _eventMap];
    [v13 setObject:v12 forKeyedSubscript:@"zoomFactor"];

    unint64_t v14 = [(CAMAnalyticsCaptureEvent *)self _zoomRangeStringForDisplayZoomValue:v18 zoomPoints:[(CAMAnalyticsCaptureEvent *)self _captureMode] mode:[(CAMAnalyticsCaptureEvent *)self _captureDevice] device:a3];
    id v15 = [(CAMAnalyticsEvent *)self _eventMap];
    [v15 setObject:v14 forKeyedSubscript:@"zoomFactorRange"];

    if ((unint64_t)a5 > 5) {
      v16 = 0;
    }
    else {
      v16 = off_263FA68C8[a5];
    }
    int64_t v17 = [(CAMAnalyticsEvent *)self _eventMap];
    [v17 setObject:v16 forKeyedSubscript:@"zoomInteractionType"];
  }
}

- (void)populateZoomFromZoomButtonSymbol:(int64_t)a3 zoomInteractionType:(int64_t)a4
{
  uint64_t v7 = +[CAMCaptureCapabilities capabilities];
  char v8 = objc_msgSend(v7, "isZoomAllowedForMode:device:videoConfiguration:videoStabilizationStrength:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"), -[CAMAnalyticsCaptureEvent _captureVideoConfiguration](self, "_captureVideoConfiguration"), -[CAMAnalyticsCaptureEvent _videoStabilizationStrength](self, "_videoStabilizationStrength"));

  char v9 = +[CAMCaptureCapabilities capabilities];
  int v10 = objc_msgSend(v9, "shouldAllowCameraToggleForMode:devicePosition:videoConfiguration:videoStabilizationStrength:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"), -[CAMAnalyticsCaptureEvent _captureVideoConfiguration](self, "_captureVideoConfiguration"), -[CAMAnalyticsCaptureEvent _videoStabilizationStrength](self, "_videoStabilizationStrength"));

  if ((v8 & 1) != 0 || v10)
  {
    int v11 = @"Narrow";
    if (a3 != 1) {
      int v11 = 0;
    }
    if (a3) {
      unint64_t v12 = v11;
    }
    else {
      unint64_t v12 = @"Wide";
    }
    uint64_t v13 = [(CAMAnalyticsEvent *)self _eventMap];
    [v13 setObject:v12 forKeyedSubscript:@"frontFacingZoom"];

    unint64_t v14 = 0;
    if ((unint64_t)a4 <= 5) {
      unint64_t v14 = off_263FA68C8[a4];
    }
    id v15 = [(CAMAnalyticsEvent *)self _eventMap];
    [v15 setObject:v14 forKeyedSubscript:@"zoomInteractionType"];
  }
}

- (void)populateExposureSliderBias:(float)a3 exposureTapAndBias:(float)a4 totalExposureBias:(float)a5
{
  char v9 = +[CAMCaptureCapabilities capabilities];
  int v10 = objc_msgSend(v9, "isTapAndBiasSupportedForMode:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"));

  if (v10)
  {
    *(float *)&double v11 = a4;
    unint64_t v12 = [NSNumber numberWithFloat:v11];
    uint64_t v13 = [(CAMAnalyticsEvent *)self _eventMap];
    [v13 setObject:v12 forKeyedSubscript:@"exposureTapAndBias"];

    LODWORD(v14) = -4.0;
    LODWORD(v15) = 4.0;
    *(float *)&double v16 = a4;
    int64_t v17 = [(CAMAnalyticsCaptureEvent *)self _defaultRangeStringForValue:v16 lowerBound:v14 upperBound:v15 defaultValue:0.0];
    id v18 = [(CAMAnalyticsEvent *)self _eventMap];
    [v18 setObject:v17 forKeyedSubscript:@"exposureTapAndBiasRange"];
  }
  int v19 = +[CAMCaptureCapabilities capabilities];
  int v20 = objc_msgSend(v19, "isExposureSliderSupportedForMode:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"));

  if (v20)
  {
    *(float *)&double v21 = a3;
    v22 = [NSNumber numberWithFloat:v21];
    uint64_t v23 = [(CAMAnalyticsEvent *)self _eventMap];
    [v23 setObject:v22 forKeyedSubscript:@"exposureSliderBias"];

    *(float *)&double v24 = a5;
    uint64_t v25 = [NSNumber numberWithFloat:v24];
    unint64_t v26 = [(CAMAnalyticsEvent *)self _eventMap];
    [v26 setObject:v25 forKeyedSubscript:@"exposureTotalBias"];

    LODWORD(v27) = -2.0;
    LODWORD(v28) = 2.0;
    *(float *)&double v29 = a3;
    int v30 = [(CAMAnalyticsCaptureEvent *)self _defaultRangeStringForValue:v29 lowerBound:v27 upperBound:v28 defaultValue:0.0];
    v31 = [(CAMAnalyticsEvent *)self _eventMap];
    [v31 setObject:v30 forKeyedSubscript:@"exposureSliderBiasRange"];

    LODWORD(v32) = -4.0;
    LODWORD(v33) = 4.0;
    *(float *)&double v34 = a5;
    id v36 = [(CAMAnalyticsCaptureEvent *)self _defaultRangeStringForValue:v34 lowerBound:v32 upperBound:v33 defaultValue:0.0];
    uint64_t v35 = [(CAMAnalyticsEvent *)self _eventMap];
    [v35 setObject:v36 forKeyedSubscript:@"exposureTotalBiasRange"];
  }
}

- (void)populateDesiredFlashMode:(int64_t)a3 desiredLivePhotoMode:(int64_t)a4 desiredHDRMode:(int64_t)a5 timerDuration:(int64_t)a6
{
  if ([(CAMAnalyticsCaptureEvent *)self _isStillDuringVideo]) {
    return;
  }
  double v11 = +[CAMCaptureCapabilities capabilities];
  int v12 = objc_msgSend(v11, "isFlashSupportedForMode:devicePosition:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"));

  uint64_t v13 = +[CAMCaptureCapabilities capabilities];
  int v14 = objc_msgSend(v13, "isLivePhotoSupportedForMode:devicePosition:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"));

  double v15 = +[CAMCaptureCapabilities capabilities];
  int v16 = objc_msgSend(v15, "isHDRSupportedForMode:devicePosition:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"));

  int64_t v17 = +[CAMCaptureCapabilities capabilities];
  int v18 = objc_msgSend(v17, "isTimerSupportedForMode:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"));

  if (v12)
  {
    if ((unint64_t)a3 > 2) {
      int v20 = 0;
    }
    else {
      int v20 = off_263FA6968[a3];
    }
    double v21 = [(CAMAnalyticsEvent *)self _eventMap];
    [v21 setObject:v20 forKeyedSubscript:@"desiredFlashMode"];

    if (!v14)
    {
LABEL_4:
      if (!v16) {
        goto LABEL_5;
      }
      goto LABEL_20;
    }
  }
  else if (!v14)
  {
    goto LABEL_4;
  }
  if ((unint64_t)a4 > 2) {
    v22 = 0;
  }
  else {
    v22 = off_263FA6968[a4];
  }
  uint64_t v23 = [(CAMAnalyticsEvent *)self _eventMap];
  [v23 setObject:v22 forKeyedSubscript:@"desiredLivePhotoMode"];

  if (!v16)
  {
LABEL_5:
    if (!v18) {
      return;
    }
    goto LABEL_6;
  }
LABEL_20:
  if ((unint64_t)a5 > 2) {
    double v24 = 0;
  }
  else {
    double v24 = off_263FA6968[a5];
  }
  uint64_t v25 = [(CAMAnalyticsEvent *)self _eventMap];
  [v25 setObject:v24 forKeyedSubscript:@"desiredHDRMode"];

  if (v18)
  {
LABEL_6:
    if ((unint64_t)a6 > 3) {
      int v19 = 0;
    }
    else {
      int v19 = off_263FA68F8[a6];
    }
    id v26 = [(CAMAnalyticsEvent *)self _eventMap];
    [v26 setObject:v19 forKeyedSubscript:@"timerDuration"];
  }
}

- (void)populateDesiredMacroMode:(int64_t)a3 isMacroCapture:(BOOL)a4 isMacroSuggested:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  char v8 = +[CAMCaptureCapabilities capabilities];
  int v9 = objc_msgSend(v8, "isSuperWideAutoMacroSupportedForMode:device:videoConfiguration:videoStabilizationStrength:spatialVideoEnabled:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"), -[CAMAnalyticsCaptureEvent _captureVideoConfiguration](self, "_captureVideoConfiguration"), -[CAMAnalyticsCaptureEvent _videoStabilizationStrength](self, "_videoStabilizationStrength"), -[CAMAnalyticsCaptureEvent _spatialVideoEnabled](self, "_spatialVideoEnabled"));

  int v10 = +[CAMUserPreferences preferences];
  int v11 = [v10 isSuperWideAutoMacroControlAllowed];

  if (v9)
  {
    int v12 = [NSNumber numberWithBool:v6];
    uint64_t v13 = [(CAMAnalyticsEvent *)self _eventMap];
    [v13 setObject:v12 forKeyedSubscript:@"isMacroCapture"];

    if (v5)
    {
      int v14 = @"ButtonOff";
      if (v6) {
        int v14 = @"ButtonOn";
      }
      if (v11) {
        double v15 = v14;
      }
      else {
        double v15 = @"AutoOn";
      }
      id v16 = [(CAMAnalyticsEvent *)self _eventMap];
      [v16 setObject:v15 forKeyedSubscript:@"macroBehavior"];
    }
  }
}

- (void)populateDesiredNightModeControlMode:(unint64_t)a3 resolvedNightModeControlMode:(unint64_t)a4 resolvedNightModeMode:(int64_t)a5 nightModeStatus:(int64_t)a6
{
  if (![(CAMAnalyticsCaptureEvent *)self _isStillDuringVideo])
  {
    int v11 = +[CAMCaptureCapabilities capabilities];
    int v12 = objc_msgSend(v11, "isLowLightSupportedForMode:device:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"));

    if (v12)
    {
      if (a3 > 2) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = off_263FA6918[a3];
      }
      int v14 = [(CAMAnalyticsEvent *)self _eventMap];
      [v14 setObject:v13 forKeyedSubscript:@"desiredNightModeControlMode"];

      if (a4 > 2) {
        double v15 = 0;
      }
      else {
        double v15 = off_263FA6918[a4];
      }
      id v16 = [(CAMAnalyticsEvent *)self _eventMap];
      [v16 setObject:v15 forKeyedSubscript:@"resolvedNightModeControlMode"];

      if ((unint64_t)a5 > 2) {
        int64_t v17 = 0;
      }
      else {
        int64_t v17 = off_263FA6930[a5];
      }
      int v18 = [(CAMAnalyticsEvent *)self _eventMap];
      [v18 setObject:v17 forKeyedSubscript:@"resolvedNightModeMode"];

      if ((unint64_t)(a6 + 1) > 3) {
        int v19 = 0;
      }
      else {
        int v19 = off_263FA6948[a6 + 1];
      }
      id v20 = [(CAMAnalyticsEvent *)self _eventMap];
      [v20 setObject:v19 forKeyedSubscript:@"nightModeStatus"];
    }
  }
}

- (void)populateDesiredTorchMode:(int64_t)a3
{
  if (![(CAMAnalyticsCaptureEvent *)self _isStillDuringVideo])
  {
    BOOL v5 = +[CAMCaptureCapabilities capabilities];
    int v6 = objc_msgSend(v5, "isTorchSupportedForMode:devicePosition:", -[CAMAnalyticsCaptureEvent _captureMode](self, "_captureMode"), -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"));

    if (v6)
    {
      if ((unint64_t)a3 > 2) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = off_263FA6968[a3];
      }
      id v8 = [(CAMAnalyticsEvent *)self _eventMap];
      [v8 setObject:v7 forKeyedSubscript:@"desiredTorchMode"];
    }
  }
}

- (void)populatePortraitStatus:(int64_t)a3 lightingEffectIntensity:(double)a4 apertureValue:(double)a5 zoomFactor:(double)a6 isDepthSuggestionAllowed:(BOOL)a7 request:(id)a8
{
  id v63 = a8;
  int64_t v14 = [(CAMAnalyticsCaptureEvent *)self _captureMode];
  int64_t v15 = v14;
  if ((unint64_t)(v14 - 6) >= 2)
  {
    if (v14 || !a7) {
      goto LABEL_26;
    }
    if ((unint64_t)a3 > 0xF) {
      int64_t v17 = 0;
    }
    else {
      int64_t v17 = off_263FA6980[a3];
    }
    int v19 = [(CAMAnalyticsEvent *)self _eventMap];
    [v19 setObject:v17 forKeyedSubscript:@"portraitStatus"];
  }
  else
  {
    if ((unint64_t)a3 > 0xF) {
      id v16 = 0;
    }
    else {
      id v16 = off_263FA6980[a3];
    }
    int v18 = [(CAMAnalyticsEvent *)self _eventMap];
    [v18 setObject:v16 forKeyedSubscript:@"portraitStatus"];

    if (!a7) {
      goto LABEL_20;
    }
  }
  if (![v63 type])
  {
    id v20 = v63;
    double v21 = [v20 adjustmentFilters];
    BOOL v22 = +[CAMEffectFilterManager isDepthEffectInFilters:v21];

    if (v22)
    {
      uint64_t v23 = @"PortraitEnabled";
    }
    else if ([v20 wantsDepthData])
    {
      uint64_t v23 = @"DepthOnly";
    }
    else
    {
      uint64_t v23 = @"None";
    }
    double v24 = [(CAMAnalyticsEvent *)self _eventMap];
    [v24 setObject:v23 forKeyedSubscript:@"portraitInPhotoMode"];
  }
LABEL_20:
  uint64_t v25 = +[CAMCaptureCapabilities capabilities];
  if ([v25 isPortraitEffectIntensitySupportedForMode:v15])
  {
    id v26 = +[CAMCaptureCapabilities capabilities];
    int v27 = objc_msgSend(v26, "isPortraitEffectIntensitySupportedForLightingType:", -[CAMAnalyticsCaptureEvent _lightingEffectType](self, "_lightingEffectType"));

    if (!v27) {
      goto LABEL_24;
    }
    double v28 = +[CAMCaptureCapabilities capabilities];
    [v28 minimumPortraitEffectIntensity];
    double v30 = v29;

    v31 = +[CAMCaptureCapabilities capabilities];
    [v31 maximumPortraitEffectIntensity];
    double v33 = v32;

    double v34 = +[CAMCaptureCapabilities capabilities];
    [v34 defaultPortraitEffectIntensity];
    double v36 = v35;

    uint64_t v37 = [NSNumber numberWithDouble:a4];
    uint64_t v38 = [(CAMAnalyticsEvent *)self _eventMap];
    [v38 setObject:v37 forKeyedSubscript:@"lightingEffectIntensity"];

    *(float *)&double v39 = a4;
    *(float *)&double v40 = v30;
    *(float *)&double v41 = v33;
    *(float *)&double v42 = v36;
    uint64_t v25 = [(CAMAnalyticsCaptureEvent *)self _defaultRangeStringForValue:v39 lowerBound:v40 upperBound:v41 defaultValue:v42];
    unint64_t v43 = [(CAMAnalyticsEvent *)self _eventMap];
    [v43 setObject:v25 forKeyedSubscript:@"lightingEffectIntensityRange"];
  }
LABEL_24:
  uint64_t v44 = +[CAMCaptureCapabilities capabilities];
  int v45 = objc_msgSend(v44, "isDepthEffectApertureSupportedForMode:devicePosition:", v15, -[CAMAnalyticsCaptureEvent _captureDevicePosition](self, "_captureDevicePosition"));

  if (v45)
  {
    v46 = +[CAMCaptureCapabilities capabilities];
    objc_msgSend(v46, "minimumDepthEffectApertureForMode:device:", v15, -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"));
    double v48 = v47;

    unint64_t v49 = +[CAMCaptureCapabilities capabilities];
    objc_msgSend(v49, "maximumDepthEffectApertureForMode:device:", v15, -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"));
    double v51 = v50;

    v52 = +[CAMCaptureCapabilities capabilities];
    objc_msgSend(v52, "defaultDepthEffectApertureForMode:device:zoomFactor:", v15, -[CAMAnalyticsCaptureEvent _captureDevice](self, "_captureDevice"), a6);
    double v54 = v53;

    v55 = [NSNumber numberWithDouble:a5];
    v56 = [(CAMAnalyticsEvent *)self _eventMap];
    [v56 setObject:v55 forKeyedSubscript:@"apertureValue"];

    *(float *)&double v57 = a5;
    *(float *)&double v58 = v48;
    *(float *)&double v59 = v51;
    *(float *)&double v60 = v54;
    v61 = [(CAMAnalyticsCaptureEvent *)self _defaultRangeStringForValue:v57 lowerBound:v58 upperBound:v59 defaultValue:v60];
    v62 = [(CAMAnalyticsEvent *)self _eventMap];
    [v62 setObject:v61 forKeyedSubscript:@"apertureRange"];
  }
LABEL_26:
}

- (void)populateDuration:(double)a3
{
  BOOL v5 = [NSNumber numberWithInteger:vcvtpd_s64_f64(a3)];
  int v6 = [(CAMAnalyticsEvent *)self _eventMap];
  [v6 setObject:v5 forKeyedSubscript:@"duration"];

  id v8 = [(id)objc_opt_class() durationRangeStringForDuration:a3];
  uint64_t v7 = [(CAMAnalyticsEvent *)self _eventMap];
  [v7 setObject:v8 forKeyedSubscript:@"durationRange"];
}

- (void)populateBurstLength:(int64_t)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  id v4 = [(CAMAnalyticsEvent *)self _eventMap];
  [v4 setObject:v5 forKeyedSubscript:@"burstLength"];
}

- (void)populateObjectResultsWithNumberOfFaces:(unint64_t)a3 numberOfCats:(unint64_t)a4 numberOfDogs:(unint64_t)a5
{
  [(id)objc_opt_class() bucketedPowerOf2ForValue:1 allowZero:(double)a3 minPositiveValue:1.0 maxValue:10.0];
  unint64_t v9 = (unint64_t)v8;
  [(id)objc_opt_class() bucketedPowerOf2ForValue:1 allowZero:(double)a4 minPositiveValue:1.0 maxValue:10.0];
  double v11 = v10;
  [(id)objc_opt_class() bucketedPowerOf2ForValue:1 allowZero:(double)a5 minPositiveValue:1.0 maxValue:10.0];
  double v13 = v12;
  if (v9)
  {
    int64_t v14 = [NSNumber numberWithUnsignedInteger:v9];
  }
  else
  {
    int64_t v14 = 0;
  }
  unint64_t v15 = (unint64_t)v11;
  id v16 = [(CAMAnalyticsEvent *)self _eventMap];
  [v16 setObject:v14 forKeyedSubscript:@"numberOfFaces"];

  if (v9) {
  if (v15)
  }
  {
    int64_t v17 = [NSNumber numberWithUnsignedInteger:(unint64_t)v11];
  }
  else
  {
    int64_t v17 = 0;
  }
  unint64_t v18 = (unint64_t)v13;
  int v19 = [(CAMAnalyticsEvent *)self _eventMap];
  [v19 setObject:v17 forKeyedSubscript:@"numberOfCats"];

  if (v15) {
  if (v18)
  }
  {
    id v21 = [NSNumber numberWithUnsignedInteger:(unint64_t)v13];
  }
  else
  {
    id v21 = 0;
  }
  id v20 = [(CAMAnalyticsEvent *)self _eventMap];
  [v20 setObject:v21 forKeyedSubscript:@"numberOfDogs"];

  if (v18)
  {
  }
}

- (void)populateSharedLibraryMode:(int64_t)a3
{
  id v5 = +[CAMUserPreferences preferences];
  int v6 = [v5 sharedLibraryEnabled];

  if (v6)
  {
    if ((unint64_t)a3 > 5) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = off_263FA6A00[a3];
    }
    double v8 = [(CAMAnalyticsEvent *)self _eventMap];
    [v8 setObject:v7 forKeyedSubscript:@"sharedLibraryMode"];

    id v11 = +[CAMUserPreferences preferences];
    if ([v11 sharedLibraryAutoBehaviorEnabled]) {
      unint64_t v9 = @"Auto";
    }
    else {
      unint64_t v9 = @"Manual";
    }
    double v10 = [(CAMAnalyticsEvent *)self _eventMap];
    [v10 setObject:v9 forKeyedSubscript:@"sharedLibrarySetting"];
  }
}

- (void)populateDeviceOrientation:(int64_t)a3 isDeviceOrientationLocked:(BOOL)a4
{
  BOOL v4 = a4;
  if ((unint64_t)a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unexpected:%ld", a3);
    int v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    int v6 = off_263FA6A30[a3];
  }
  uint64_t v7 = [(CAMAnalyticsEvent *)self _eventMap];
  [v7 setObject:v6 forKeyedSubscript:@"deviceOrientation"];

  id v9 = [NSNumber numberWithBool:v4];
  double v8 = [(CAMAnalyticsEvent *)self _eventMap];
  [v8 setObject:v9 forKeyedSubscript:@"deviceOrientationLocked"];
}

- (id)_defaultRangeStringForValue:(float)a3 lowerBound:(float)a4 upperBound:(float)a5 defaultValue:(float)a6
{
  double v6 = a3;
  if (a4 + 0.01 >= v6) {
    return @"Min";
  }
  double v7 = a6;
  if (v7 + -0.01 > v6) {
    return @"Low";
  }
  if (v7 + 0.01 >= v6) {
    return @"Default";
  }
  if (a5 + -0.01 <= v6) {
    return @"Max";
  }
  return @"High";
}

- (id)_zoomRangeStringForDisplayZoomValue:(double)a3 zoomPoints:(id)a4 mode:(int64_t)a5 device:(int64_t)a6
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = +[CAMCaptureCapabilities capabilities];
  double v12 = v11;
  if ((unint64_t)(a6 - 1) > 0xA) {
    uint64_t v13 = 0;
  }
  else {
    uint64_t v13 = qword_209C7BC40[a6 - 1];
  }
  int v14 = [v11 isSuperWideSupportedForDevicePosition:v13];
  int v15 = [v12 isTelephotoSupportedForDevicePosition:v13];
  [v12 superWideDisplayZoomFactor];
  double v17 = v16;
  [v12 wideDisplayZoomFactor];
  double v19 = v18;
  [v12 telephotoDisplayZoomFactor];
  double v21 = v20;
  char v22 = objc_msgSend(v12, "isQuadraWideZoomButtonSupportedForMode:devicePosition:videoConfiguration:", a5, v13, -[CAMAnalyticsCaptureEvent _captureVideoConfiguration](self, "_captureVideoConfiguration"));
  [v12 quadraWideDisplayZoomFactor];
  double v24 = v23;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v25 = v10;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v43 != v28) {
          objc_enumerationMutation(v25);
        }
        double v30 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if ([v30 isCustomLens])
        {
          [v30 displayZoomFactor];
          if (vabdd_f64(a3, v31) < 0.001)
          {
            unint64_t v33 = objc_msgSend(v12, "effectiveFocalLengthForCustomLens:", objc_msgSend(v30, "customLens"));
            uint64_t v34 = 0;
            if (v33 < 4) {
              uint64_t v34 = qword_209C7BC98[v33];
            }
            objc_msgSend(NSString, "stringWithFormat:", @"%.fmm", v34);
            double v32 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_18;
          }
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v27) {
        continue;
      }
      break;
    }
  }

  if (v19 == a3)
  {
    double v32 = @"Wide";
  }
  else
  {
    if (v24 == a3) {
      char v36 = v22;
    }
    else {
      char v36 = 0;
    }
    if (v36)
    {
      double v32 = @"QuadraWide";
    }
    else
    {
      if (v19 <= a3)
      {
        uint64_t v37 = @">Wide";
        uint64_t v38 = @"Wide-Telephoto";
        double v41 = @">Telephoto";
        if (v21 == a3) {
          double v41 = @"Telephoto";
        }
        if (v21 <= a3) {
          uint64_t v38 = v41;
        }
        BOOL v40 = v15 == 0;
      }
      else
      {
        uint64_t v37 = @"<Wide";
        uint64_t v38 = @"<UltraWide";
        double v39 = @"UltraWide-Wide";
        if (v17 == a3) {
          double v39 = @"UltraWide";
        }
        if (v17 <= a3) {
          uint64_t v38 = v39;
        }
        BOOL v40 = v14 == 0;
      }
      if (v40) {
        double v32 = v37;
      }
      else {
        double v32 = v38;
      }
    }
  }
LABEL_18:

  return v32;
}

- (int64_t)_captureMode
{
  return self->__captureMode;
}

- (int64_t)_captureDevice
{
  return self->__captureDevice;
}

- (int64_t)_captureDevicePosition
{
  return self->__captureDevicePosition;
}

- (int64_t)_captureVideoConfiguration
{
  return self->__captureVideoConfiguration;
}

- (int64_t)_lightingEffectType
{
  return self->__lightingEffectType;
}

- (void)set_lightingEffectType:(int64_t)a3
{
  self->__lightingEffectType = a3;
}

- (int64_t)_mediaType
{
  return self->__mediaType;
}

- (void)set_mediaType:(int64_t)a3
{
  self->__mediaType = a3;
}

- (BOOL)_isStillDuringVideo
{
  return self->__isStillDuringVideo;
}

- (void)set_isStillDuringVideo:(BOOL)a3
{
  self->__isStillDuringVideo = a3;
}

- (int64_t)_videoStabilizationStrength
{
  return self->__videoStabilizationStrength;
}

- (BOOL)_outputToExternalStorage
{
  return self->__outputToExternalStorage;
}

- (void)set_outputToExternalStorage:(BOOL)a3
{
  self->__outputToExternalStorage = a3;
}

- (int64_t)_colorSpace
{
  return self->__colorSpace;
}

- (BOOL)_spatialVideoEnabled
{
  return self->__spatialVideoEnabled;
}

@end