@interface CAMAnalyticsPreferencesEvent
- (BOOL)_hidesControlsForCameraButton;
- (BOOL)_lockToFocus;
- (CAMAnalyticsPreferencesEvent)initWithPreferences:(id)a3;
- (CAMCaptureCapabilities)_capabilities;
- (id)_focalLengthStringForCustomLens:(int64_t)a3;
- (id)eventName;
- (int64_t)_clickCountLaunchGesture;
@end

@implementation CAMAnalyticsPreferencesEvent

- (CAMAnalyticsPreferencesEvent)initWithPreferences:(id)a3
{
  uint64_t v189 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v187.receiver = self;
  v187.super_class = (Class)CAMAnalyticsPreferencesEvent;
  v5 = [(CAMAnalyticsEvent *)&v187 init];

  if (!v5) {
    goto LABEL_321;
  }
  v6 = [[CAMCaptureCapabilities alloc] initWithHostProcess:0];
  objc_storeStrong((id *)&v5->__capabilities, v6);
  if ([(CAMCaptureCapabilities *)v6 isHEVCEncodingSupported])
  {
    if ([v4 usingMostCompatibleEncoding]) {
      v7 = @"MostCompatible";
    }
    else {
      v7 = @"HighEfficiency";
    }
    v8 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v8 setObject:v7 forKeyedSubscript:@"Encoding"];
  }
  BOOL v9 = [(CAMCaptureCapabilities *)v6 isPhotoResolutionSupported:3 forPhotoEncoding:1];
  BOOL v10 = [(CAMCaptureCapabilities *)v6 isLinearDNGSupported];
  BOOL v11 = v10;
  if (!v9)
  {
    if (!v10)
    {
      id v18 = 0;
      goto LABEL_28;
    }
    char v17 = [v4 rawControlEnabled];
    int v13 = [v4 preserveRAW];
    id v18 = 0;
    if (v17) {
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  int v12 = [v4 photoFormatControlEnabled];
  int v13 = [v4 preservePhotoResolution];
  if ((v11 & v12) == 1)
  {
    unint64_t v14 = [v4 photoFormatControlSecondaryFormat];
    if (v14 > 2) {
      v16 = 0;
    }
    else {
      v16 = off_263FA3090[v14];
    }
    if ((unint64_t)(v15 - 1) > 2) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = qword_209C79868[v15 - 1];
    }
    id v18 = (id)[NSString stringWithFormat:@"%@%ld", v16, v20];
    char v17 = 1;
    goto LABEL_22;
  }
  id v18 = 0;
  char v17 = v12 & ~v11;
  if ((v17 & 1) == 0)
  {
LABEL_15:
    v19 = @"Off";
    goto LABEL_23;
  }
LABEL_22:
  v19 = @"On";
LABEL_23:
  v21 = [(CAMAnalyticsEvent *)v5 _eventMap];
  [v21 setObject:v19 forKeyedSubscript:@"PhotoFormatControl"];

  if (v17)
  {
    if (v13) {
      v22 = @"On";
    }
    else {
      v22 = @"Off";
    }
    v23 = v22;
    v24 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v24 setObject:v23 forKeyedSubscript:@"PreservePhotoFormatControl"];

    v25 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v25 setObject:v18 forKeyedSubscript:@"PhotoFormatControlDefault"];
  }
LABEL_28:
  if ([(CAMCaptureCapabilities *)v6 isLinearDNGSupported])
  {
    if ([v4 rawControlEnabled]) {
      v26 = @"On";
    }
    else {
      v26 = @"Off";
    }
    v27 = v26;
    v28 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v28 setObject:v27 forKeyedSubscript:@"LinearDNG"];

    if ([v4 preserveRAW]) {
      v29 = @"On";
    }
    else {
      v29 = @"Off";
    }
    v30 = v29;
    v31 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v31 setObject:v30 forKeyedSubscript:@"PreserveLinearDNG"];
  }
  if ([(CAMCaptureCapabilities *)v6 isProResVideoSupported])
  {
    v32 = [v4 isProResControlEnabled] ? @"On" : @"Off";
    v33 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v33 setObject:v32 forKeyedSubscript:@"ProRes"];

    v34 = [v4 preserveProRes] ? @"On" : @"Off";
    v35 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v35 setObject:v34 forKeyedSubscript:@"PreserveProRes"];

    if ([(CAMCaptureCapabilities *)v6 isProResLogColorSpaceSupported])
    {
      if ([v4 isProResControlEnabled]
        && [v4 allowExplicitProResColorSpace])
      {
        unint64_t v36 = [v4 explicitProResColorSpace];
        if (v36 > 3) {
          v37 = 0;
        }
        else {
          v37 = off_263FA30A8[v36];
        }
        v38 = [(CAMAnalyticsEvent *)v5 _eventMap];
        [v38 setObject:v37 forKeyedSubscript:@"ExplicitProResColorSpace"];
      }
    }
  }
  if ([(CAMCaptureCapabilities *)v6 isPALVideoSupported])
  {
    if ([v4 isPALVideoEnabled]) {
      v39 = @"On";
    }
    else {
      v39 = @"Off";
    }
    v40 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v40 setObject:v39 forKeyedSubscript:@"ShowPALFormats"];
  }
  uint64_t v41 = [v4 usingMostCompatibleEncoding] ^ 1;
  char v42 = [v4 prefersHDR10BitVideoForCapabilities:v6];
  LOBYTE(v181) = v42;
  uint64_t v43 = -[CAMCaptureCapabilities resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:](v6, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", 1, 0, v41, [v4 videoConfiguration], 0, 0, v181);
  LOBYTE(v182) = v42;
  uint64_t v44 = -[CAMCaptureCapabilities resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:](v6, "resolvedVideoConfigurationForMode:device:videoEncodingBehavior:videoConfiguration:outputToExternalStorage:spatialVideoEnabled:prefersHDR10BitVideo:", 2, 0, v41, [v4 slomoConfiguration], 0, 0, v182);
  switch(v43)
  {
    case 0:
      v45 = @"Auto";
      break;
    case 1:
      v45 = @"1080p60";
      break;
    case 2:
      v45 = @"720p120";
      break;
    case 3:
      v45 = @"720p240";
      break;
    case 4:
      v45 = @"1080p120";
      break;
    case 5:
      v45 = @"4k30";
      break;
    case 6:
      v45 = @"720p30";
      break;
    case 7:
      v45 = @"1080p30";
      break;
    case 8:
      v45 = @"1080p240";
      break;
    case 9:
      v45 = @"4k60";
      break;
    case 10:
      v45 = @"4k24";
      break;
    case 11:
      v45 = @"1080p25";
      break;
    case 12:
      v45 = @"4k25";
      break;
    case 13:
      v45 = @"4k120";
      break;
    case 14:
      v45 = @"4k100";
      break;
    default:
      switch(v43)
      {
        case 10000:
          v45 = @"ImagePickerHigh";
          break;
        case 10001:
          v45 = @"ImagePickerMedium";
          break;
        case 10002:
          v45 = @"ImagePickerLow";
          break;
        case 10003:
          v45 = @"ImagePickerVGA";
          break;
        case 10004:
          v45 = @"ImagePickeriFrame720p";
          break;
        case 10005:
          v45 = @"ImagePickeriFrame540p";
          break;
        default:
          v45 = 0;
          break;
      }
      break;
  }
  v46 = [(CAMAnalyticsEvent *)v5 _eventMap];
  [v46 setObject:v45 forKeyedSubscript:@"VideoConfiguration"];

  switch(v44)
  {
    case 0:
      v47 = @"Auto";
      break;
    case 1:
      v47 = @"1080p60";
      break;
    case 2:
      v47 = @"720p120";
      break;
    case 3:
      v47 = @"720p240";
      break;
    case 4:
      v47 = @"1080p120";
      break;
    case 5:
      v47 = @"4k30";
      break;
    case 6:
      v47 = @"720p30";
      break;
    case 7:
      v47 = @"1080p30";
      break;
    case 8:
      v47 = @"1080p240";
      break;
    case 9:
      v47 = @"4k60";
      break;
    case 10:
      v47 = @"4k24";
      break;
    case 11:
      v47 = @"1080p25";
      break;
    case 12:
      v47 = @"4k25";
      break;
    case 13:
      v47 = @"4k120";
      break;
    case 14:
      v47 = @"4k100";
      break;
    default:
      switch(v44)
      {
        case 10000:
          v47 = @"ImagePickerHigh";
          break;
        case 10001:
          v47 = @"ImagePickerMedium";
          break;
        case 10002:
          v47 = @"ImagePickerLow";
          break;
        case 10003:
          v47 = @"ImagePickerVGA";
          break;
        case 10004:
          v47 = @"ImagePickeriFrame720p";
          break;
        case 10005:
          v47 = @"ImagePickeriFrame540p";
          break;
        default:
          v47 = 0;
          break;
      }
      break;
  }
  v48 = [(CAMAnalyticsEvent *)v5 _eventMap];
  [v48 setObject:v47 forKeyedSubscript:@"SlomoConfiguration"];

  if ([v4 usingMostCompatibleEncoding]
    && [(CAMCaptureCapabilities *)v6 isHEVCEncodingSupported])
  {
    if ([v4 didConfirmVideoMostCompatible]) {
      v49 = @"On";
    }
    else {
      v49 = @"Off";
    }
    v50 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v50 setObject:v49 forKeyedSubscript:@"VideoMostCompatible"];

    if ([v4 didConfirmSlomo1080p240MostCompatible]) {
      v51 = @"On";
    }
    else {
      v51 = @"Off";
    }
    v52 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v52 setObject:v51 forKeyedSubscript:@"1080p240MostCompatible"];
  }
  if ([(CAMCaptureCapabilities *)v6 isProRawJpegXLSupported])
  {
    uint64_t v53 = [v4 rawFileFormatBehavior];
    if (v53 == 2)
    {
      v54 = [(CAMAnalyticsEvent *)v5 _eventMap];
      v55 = v54;
      v56 = @"JpegXLLossy";
    }
    else if (v53 == 1)
    {
      v54 = [(CAMAnalyticsEvent *)v5 _eventMap];
      v55 = v54;
      v56 = @"JpegXLLossless";
    }
    else
    {
      if (v53) {
        goto LABEL_120;
      }
      v54 = [(CAMAnalyticsEvent *)v5 _eventMap];
      v55 = v54;
      v56 = @"JpegLossless";
    }
    [v54 setObject:v56 forKeyedSubscript:@"RawFileFormatBehavior"];
  }
LABEL_120:
  if (-[CAMCaptureCapabilities isHDR10BitVideoSupportedForVideoConfiguration:videoEncodingBehavior:](v6, "isHDR10BitVideoSupportedForVideoConfiguration:videoEncodingBehavior:", [v4 videoConfiguration], v41))
  {
    if ([v4 HDR10BitVideoEnabled]) {
      v57 = @"On";
    }
    else {
      v57 = @"Off";
    }
    v58 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v58 setObject:v57 forKeyedSubscript:@"HDR10Video"];
  }
  if ([(CAMCaptureCapabilities *)v6 isVariableFramerateVideoSupported])
  {
    unint64_t v59 = [v4 VFRMode];
    if (v59 > 2) {
      v60 = 0;
    }
    else {
      v60 = off_263FA30C8[v59];
    }
LABEL_133:
    v61 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v61 setObject:v60 forKeyedSubscript:@"AutoFPS"];

    goto LABEL_134;
  }
  if (-[CAMCaptureCapabilities isAutoLowLightVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:](v6, "isAutoLowLightVideoSupportedForMode:videoConfiguration:videoEncodingBehavior:", 1, [v4 videoConfiguration], 1))
  {
    if ([v4 isLowLightVideoEnabled]) {
      v60 = @"AutoLowLightVideoOn";
    }
    else {
      v60 = @"AutoLowLightVideoOff";
    }
    goto LABEL_133;
  }
LABEL_134:
  BOOL v62 = [(CAMCaptureCapabilities *)v6 interactiveVideoFormatControlSupported];
  BOOL v63 = [(CAMCaptureCapabilities *)v6 interactiveVideoFormatControlAlwaysEnabled];
  if (v62 && !v63)
  {
    if ([v4 isVideoConfigurationControlEnabled]) {
      v64 = @"On";
    }
    else {
      v64 = @"Off";
    }
    v65 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v65 setObject:v64 forKeyedSubscript:@"VideoConfigurationControl"];
  }
  if ([(CAMCaptureCapabilities *)v6 isTelephotoSupported]
    || [(CAMCaptureCapabilities *)v6 isSuperWideSupported])
  {
    if ([v4 shouldDisableCameraSwitchingDuringVideoRecordingForMode:1]) {
      v66 = @"On";
    }
    else {
      v66 = @"Off";
    }
    v67 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v67 setObject:v66 forKeyedSubscript:@"LockCamera"];
  }
  if ([(CAMCaptureCapabilities *)v6 isWhiteBalanceLockingForVideoRecordingSupported])
  {
    if ([v4 shouldLockWhiteBalanceDuringVideoRecording]) {
      v68 = @"On";
    }
    else {
      v68 = @"Off";
    }
    v69 = v68;
    v70 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v70 setObject:v69 forKeyedSubscript:@"LockWhiteBalance"];
  }
  if ([(CAMCaptureCapabilities *)v6 isStereoAudioRecordingSupported]
    || [(CAMCaptureCapabilities *)v6 isCinematicAudioSupported])
  {
    unint64_t v71 = [v4 preferredAudioConfiguration] - 1;
    if (v71 > 2) {
      v72 = 0;
    }
    else {
      v72 = off_263FA30E0[v71];
    }
    v73 = [(CAMAnalyticsEvent *)v5 _eventMap];
    v74 = v73;
    v75 = @"AudioConfiguration";
LABEL_157:
    [v73 setObject:v72 forKeyedSubscript:v75];

    goto LABEL_158;
  }
  if ([(CAMCaptureCapabilities *)v6 isStereoAudioRecordingSupported])
  {
    if ([v4 preferredAudioConfiguration] == 1) {
      v72 = @"Off";
    }
    else {
      v72 = @"On";
    }
    v73 = [(CAMAnalyticsEvent *)v5 _eventMap];
    v74 = v73;
    v75 = @"StereoAudio";
    goto LABEL_157;
  }
LABEL_158:
  if ([(CAMCaptureCapabilities *)v6 isMixAudioWithOthersSupported])
  {
    if ([v4 shouldMixAudioWithOthers]) {
      v76 = @"On";
    }
    else {
      v76 = @"Off";
    }
    v77 = v76;
    v78 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v78 setObject:v77 forKeyedSubscript:@"MixAudioWithOthers"];
  }
  if ([(CAMCaptureCapabilities *)v6 isWindRemovalSupported])
  {
    if ([v4 shouldEnableWindRemoval]) {
      v79 = @"On";
    }
    else {
      v79 = @"Off";
    }
    v80 = v79;
    v81 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v81 setObject:v80 forKeyedSubscript:@"WindRemoval"];
  }
  if ([v4 preserveCaptureMode]) {
    v82 = @"On";
  }
  else {
    v82 = @"Off";
  }
  v83 = [(CAMAnalyticsEvent *)v5 _eventMap];
  [v83 setObject:v82 forKeyedSubscript:@"PreserveCaptureMode"];

  if ([(CAMCaptureCapabilities *)v6 isPreserveCreativeControlsSupported])
  {
    if ([v4 preserveEffectFilter]) {
      v84 = @"On";
    }
    else {
      v84 = @"Off";
    }
    v85 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v85 setObject:v84 forKeyedSubscript:@"PreserveCreativeControls"];
  }
  if ([(CAMCaptureCapabilities *)v6 isPreserveCreativeControlsSupported])
  {
    if ([v4 preserveSmartStyle]) {
      v86 = @"On";
    }
    else {
      v86 = @"Off";
    }
    v87 = v86;
    v88 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v88 setObject:v87 forKeyedSubscript:@"PreserveSmartStyle"];
  }
  if ([(CAMCaptureCapabilities *)v6 isExposureSliderSupported])
  {
    if ([v4 preserveExposure]) {
      v89 = @"On";
    }
    else {
      v89 = @"Off";
    }
    v90 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v90 setObject:v89 forKeyedSubscript:@"PreserveExposure"];
  }
  if ([(CAMCaptureCapabilities *)v6 isLivePhotoSupported])
  {
    if ([v4 preserveLivePhoto]) {
      v91 = @"On";
    }
    else {
      v91 = @"Off";
    }
    v92 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v92 setObject:v91 forKeyedSubscript:@"PreserveLivePhoto"];
  }
  if ([(CAMCaptureCapabilities *)v6 isCTMSupported])
  {
    if ([v4 shouldUseVolumeUpBurst]) {
      v93 = @"On";
    }
    else {
      v93 = @"Off";
    }
    v94 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v94 setObject:v93 forKeyedSubscript:@"VolumeUpForBurst"];
  }
  if ([v4 QRBannersEnabledInSettings]) {
    v95 = @"On";
  }
  else {
    v95 = @"Off";
  }
  v96 = [(CAMAnalyticsEvent *)v5 _eventMap];
  [v96 setObject:v95 forKeyedSubscript:@"ScanQRCodes"];

  if ([(CAMCaptureCapabilities *)v6 isImageAnalysisSupported])
  {
    if ([v4 isImageAnalysisEnabled]) {
      v97 = @"On";
    }
    else {
      v97 = @"Off";
    }
    v98 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v98 setObject:v97 forKeyedSubscript:@"LiveText"];
  }
  if ([v4 shouldShowGridView]) {
    v99 = @"On";
  }
  else {
    v99 = @"Off";
  }
  v100 = [(CAMAnalyticsEvent *)v5 _eventMap];
  [v100 setObject:v99 forKeyedSubscript:@"Grid"];

  if ([(CAMCaptureCapabilities *)v6 isMirroredFrontCapturesSupported])
  {
    if ([v4 shouldMirrorFrontCameraCaptures]) {
      v101 = @"On";
    }
    else {
      v101 = @"Off";
    }
    v102 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v102 setObject:v101 forKeyedSubscript:@"MirrorFrontCamera"];
  }
  if ([(CAMCaptureCapabilities *)v6 isSpatialOverCaptureSupported])
  {
    if ([v4 isOverCapturePreviewEnabled]) {
      v103 = @"On";
    }
    else {
      v103 = @"Off";
    }
    v104 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v104 setObject:v103 forKeyedSubscript:@"OvercapturePreview"];
  }
  if ([(CAMCaptureCapabilities *)v6 semanticStylesSupport])
  {
    v105 = [v4 captureConfiguration];
    unint64_t v106 = [v105 selectedSemanticStyleIndex];

    v107 = [v4 captureConfiguration];
    v108 = [v107 semanticStyles];

    if (v106 >= [v108 count])
    {
      v109 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR)) {
        [(CAMAnalyticsPreferencesEvent *)v108 initWithPreferences:v109];
      }
    }
    else
    {
      v109 = [v108 objectAtIndexedSubscript:v106];
      v110 = [(CAMAnalyticsEvent *)v5 _eventMap];
      v111 = [v109 analyticsDictionaryForPreferences];
      [v110 addEntriesFromDictionary:v111];
    }
  }
  if ([(CAMCaptureCapabilities *)v6 semanticDevelopmentSupported])
  {
    if ([v4 semanticDevelopmentEnabled]) {
      v112 = @"On";
    }
    else {
      v112 = @"Off";
    }
    v113 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v113 setObject:v112 forKeyedSubscript:@"SemanticDevelopment"];
  }
  if ([(CAMCaptureCapabilities *)v6 responsiveShutterSupported])
  {
    if ([v4 responsiveShutterEnabled]) {
      v114 = @"On";
    }
    else {
      v114 = @"Off";
    }
    v115 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v115 setObject:v114 forKeyedSubscript:@"DynamicShutter"];
  }
  if ([(CAMCaptureCapabilities *)v6 contentAwareDistortionCorrectionSupported])
  {
    if ([v4 shouldUseContentAwareDistortionCorrection]) {
      v116 = @"On";
    }
    else {
      v116 = @"Off";
    }
    v117 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v117 setObject:v116 forKeyedSubscript:@"LensCorrection"];
  }
  if ([(CAMCaptureCapabilities *)v6 isSuperWideAutoMacroSupported])
  {
    if ([v4 isSuperWideAutoMacroControlAllowed]) {
      v118 = @"On";
    }
    else {
      v118 = @"Off";
    }
    v119 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v119 setObject:v118 forKeyedSubscript:@"AutoMacro"];

    if ([v4 preserveSuperWideAutoMacro]) {
      v120 = @"On";
    }
    else {
      v120 = @"Off";
    }
    v121 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v121 setObject:v120 forKeyedSubscript:@"PreserveAutoMacro"];
  }
  if ([(CAMCaptureCapabilities *)v6 enhancedRAWResolutionSupported]
    && [v4 rawControlEnabled])
  {
    v122 = NSNumber;
    unint64_t v123 = [v4 maximumRAWPhotoResolution] - 1;
    if (v123 > 2) {
      uint64_t v124 = 0;
    }
    else {
      uint64_t v124 = qword_209C79868[v123];
    }
    v125 = [v122 numberWithInteger:v124];
    v126 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v126 setObject:v125 forKeyedSubscript:@"RAWResolution"];
  }
  if ([(CAMCaptureCapabilities *)v6 isPhotoResolutionSupported:2 forPhotoEncoding:1])
  {
    v127 = NSNumber;
    uint64_t v128 = [v4 preferredHEICPhotoResolutionForDevicePosition:0];
    uint64_t v129 = 0;
    if ((unint64_t)(v128 - 1) <= 2) {
      uint64_t v129 = qword_209C79868[v128 - 1];
    }
    v130 = [v127 numberWithInteger:v129];
    v131 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v131 setObject:v130 forKeyedSubscript:@"BackPreferredPhotoResolution"];
  }
  if ([(CAMCaptureCapabilities *)v6 isHDRSettingAllowed])
  {
    BOOL v132 = [(CAMCaptureCapabilities *)v6 isModernHDRSupported];
    BOOL v133 = [(CAMCaptureCapabilities *)v6 isSmartHDRSupported];
    BOOL v134 = [(CAMCaptureCapabilities *)v6 isHDREV0CaptureSupported];
    if (v132 || v133)
    {
      if ([v4 shouldUseModernHDRBehavior]) {
        v135 = @"On";
      }
      else {
        v135 = @"Off";
      }
      v136 = [(CAMAnalyticsEvent *)v5 _eventMap];
      [v136 setObject:v135 forKeyedSubscript:@"SmartHDR"];
    }
    if (v134)
    {
      if ([v4 shouldCaptureHDREV0]) {
        v137 = @"On";
      }
      else {
        v137 = @"Off";
      }
      v138 = [(CAMAnalyticsEvent *)v5 _eventMap];
      [v138 setObject:v137 forKeyedSubscript:@"HDRKeepNormalPhoto"];
    }
  }
  if ([(CAMCaptureCapabilities *)v6 isVideoStabilizationControlSupported])
  {
    if ([v4 enhancedVideoStabilization]) {
      v139 = @"On";
    }
    else {
      v139 = @"Off";
    }
    v140 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v140 setObject:v139 forKeyedSubscript:@"EnhancedVideoStabilization"];

    if ([v4 actionModeLowLightEnabled]) {
      v141 = @"On";
    }
    else {
      v141 = @"Off";
    }
    v142 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v142 setObject:v141 forKeyedSubscript:@"ActionModeLowLight"];
  }
  if (!+[CAMUserPreferences isSharedLibrarySupportedAndEnabledForCapabilities:v6])goto LABEL_291; {
  int v143 = [v4 sharedLibraryEnabled];
  }
  v144 = [(CAMAnalyticsEvent *)v5 _eventMap];
  v145 = v144;
  if (v143)
  {
    v146 = @"On";
    [v144 setObject:@"On" forKeyedSubscript:@"SharedLibraryShareFromCamera"];

    int v147 = [v4 sharedLibraryAutoBehaviorEnabled];
    v148 = [(CAMAnalyticsEvent *)v5 _eventMap];
    v145 = v148;
    if (v147)
    {
      [v148 setObject:@"Automatic" forKeyedSubscript:@"SharedLibraryMode"];

      if (![v4 shareWhenAtHomeEnabled]) {
        v146 = @"Off";
      }
      v149 = [(CAMAnalyticsEvent *)v5 _eventMap];
      v145 = v149;
      v150 = @"SharedLibraryWhenAtHome";
      v151 = v146;
      goto LABEL_290;
    }
    v151 = @"Manual";
    v150 = @"SharedLibraryMode";
  }
  else
  {
    v151 = @"Off";
    v150 = @"SharedLibraryShareFromCamera";
  }
  v149 = v145;
LABEL_290:
  [v149 setObject:v151 forKeyedSubscript:v150];

LABEL_291:
  if (-[CAMCaptureCapabilities isCustomLensSupportedForPhotoResolution:](v6, "isCustomLensSupportedForPhotoResolution:", [v4 preferredHEICPhotoResolutionForDevicePosition:0]))
  {
    id v152 = v18;
    v153 = [v4 customLensGroup];
    id v154 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v183 = 0u;
    long long v184 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    id v155 = v153;
    uint64_t v156 = [v155 countByEnumeratingWithState:&v183 objects:v188 count:16];
    if (v156)
    {
      uint64_t v157 = v156;
      uint64_t v158 = *(void *)v184;
      do
      {
        for (uint64_t i = 0; i != v157; ++i)
        {
          if (*(void *)v184 != v158) {
            objc_enumerationMutation(v155);
          }
          uint64_t v160 = [*(id *)(*((void *)&v183 + 1) + 8 * i) integerValue];
          if (v160)
          {
            v161 = [(CAMAnalyticsPreferencesEvent *)v5 _focalLengthStringForCustomLens:v160];
            [v154 addObject:v161];
          }
        }
        uint64_t v157 = [v155 countByEnumeratingWithState:&v183 objects:v188 count:16];
      }
      while (v157);
    }

    if ([v154 count])
    {
      v162 = [v154 componentsJoinedByString:@", "];
      v163 = [(CAMAnalyticsEvent *)v5 _eventMap];
      [v163 setObject:v162 forKeyedSubscript:@"CustomLenses"];

      v164 = -[CAMAnalyticsPreferencesEvent _focalLengthStringForCustomLens:](v5, "_focalLengthStringForCustomLens:", [v4 defaultCustomLens]);
      v165 = [(CAMAnalyticsEvent *)v5 _eventMap];
      [v165 setObject:v164 forKeyedSubscript:@"DefaultCustomLens"];
    }
    else
    {
      v164 = [(CAMAnalyticsEvent *)v5 _eventMap];
      [v164 setObject:@"None" forKeyedSubscript:@"CustomLenses"];
    }
    id v18 = v152;
  }
  if ([(CAMCaptureCapabilities *)v6 isSpatialVideoCaptureSupported])
  {
    if ([v4 spatialVideoControlEnabled]) {
      v166 = @"On";
    }
    else {
      v166 = @"Off";
    }
    v167 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v167 setObject:v166 forKeyedSubscript:@"SpatialVideoControl"];

    if ([v4 preserveSpatialVideoEnabled]) {
      v168 = @"On";
    }
    else {
      v168 = @"Off";
    }
    v169 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v169 setObject:v168 forKeyedSubscript:@"PreserveSpatialVideo"];
  }
  if ([(CAMCaptureCapabilities *)v6 photoModeDepthSuggestionSupported])
  {
    if ([v4 shouldUseDepthSuggestionInPhotoMode]) {
      v170 = @"On";
    }
    else {
      v170 = @"Off";
    }
    v171 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v171 setObject:v170 forKeyedSubscript:@"PhotoModeDepthSuggestion"];
  }
  if ([(CAMCaptureCapabilities *)v6 isCameraButtonSupported])
  {
    uint64_t v172 = [(CAMAnalyticsPreferencesEvent *)v5 _clickCountLaunchGesture];
    v173 = [NSNumber numberWithInteger:v172];
    v174 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v174 setObject:v173 forKeyedSubscript:@"ClickCountLaunchGesture"];

    v175 = objc_msgSend(NSNumber, "numberWithBool:", -[CAMAnalyticsPreferencesEvent _hidesControlsForCameraButton](v5, "_hidesControlsForCameraButton"));
    v176 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v176 setObject:v175 forKeyedSubscript:@"CameraControlQuietUIToggle"];

    v177 = objc_msgSend(NSNumber, "numberWithBool:", -[CAMAnalyticsPreferencesEvent _lockToFocus](v5, "_lockToFocus"));
    v178 = [(CAMAnalyticsEvent *)v5 _eventMap];
    [v178 setObject:v177 forKeyedSubscript:@"CameraControlLockToFocus"];
  }
  v179 = v5;

LABEL_321:
  return v5;
}

- (id)_focalLengthStringForCustomLens:(int64_t)a3
{
  id v4 = [(CAMAnalyticsPreferencesEvent *)self _capabilities];
  unint64_t v5 = [v4 effectiveFocalLengthForCustomLens:a3];

  uint64_t v6 = 0;
  if (v5 <= 3) {
    uint64_t v6 = qword_209C79880[v5];
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%.fmm", v6);
}

- (id)eventName
{
  return @"preferences";
}

- (int64_t)_clickCountLaunchGesture
{
  Boolean keyExistsAndHasValidFormat = 0;
  int64_t result = CFPreferencesGetAppIntegerValue(@"SBCaptureButtonClickCount", @"com.apple.springboard", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 1;
  }
  return result;
}

- (BOOL)_hidesControlsForCameraButton
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"systemOverlay.hidesClientControls", @"com.apple.camera", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 0;
  }
  return !v3;
}

- (BOOL)_lockToFocus
{
  return CFPreferencesGetAppBooleanValue(@"systemOverlay.focusLockEnabled", @"com.apple.camera", 0) != 0;
}

- (CAMCaptureCapabilities)_capabilities
{
  return self->__capabilities;
}

- (void).cxx_destruct
{
}

- (void)initWithPreferences:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = [a1 count] - 1;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "Selected semantic style index %ld is out of range 0-%ld", (uint8_t *)&v4, 0x16u);
}

@end