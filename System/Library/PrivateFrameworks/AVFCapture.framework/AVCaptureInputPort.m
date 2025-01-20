@interface AVCaptureInputPort
+ (AVCaptureInputPort)portWithInput:(id)a3 mediaType:(id)a4 formatDescription:(opaqueCMFormatDescription *)a5 enabled:(BOOL)a6 sourceDeviceType:(id)a7 sourceDevicePosition:(int64_t)a8;
+ (BOOL)automaticallyNotifiesObserversOfClock;
+ (void)initialize;
- (AVCaptureDevicePosition)sourceDevicePosition;
- (AVCaptureDeviceType)sourceDeviceType;
- (AVCaptureInput)input;
- (AVMediaType)mediaType;
- (BOOL)isEnabled;
- (BOOL)sourcesFromConstituentDevice;
- (CMClockRef)clock;
- (CMFormatDescriptionRef)formatDescription;
- (id)_initWithInput:(id)a3 mediaType:(id)a4 formatDescription:(opaqueCMFormatDescription *)a5 enabled:(BOOL)a6 sourceDeviceType:(id)a7 sourceDevicePosition:(int64_t)a8;
- (id)description;
- (id)figCaptureSourceConfigurationForSessionPreset:(id)a3;
- (id)sourceID;
- (id)valueForUndefinedKey:(id)a3;
- (int)changeSeed;
- (void)_setClock:(OpaqueCMClock *)a3;
- (void)_setFormatDescription:(opaqueCMFormatDescription *)a3;
- (void)_updateBackgroundBlurUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4;
- (void)_updateBackgroundReplacementUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4;
- (void)_updateCenterStageUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4;
- (void)_updateReactionEffectsUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4;
- (void)_updateStudioLightingUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4;
- (void)bumpChangeSeed;
- (void)dealloc;
- (void)setEnabled:(BOOL)enabled;
- (void)setOwner:(id)a3;
@end

@implementation AVCaptureInputPort

- (AVCaptureInput)input
{
  return self->_internal->input;
}

- (BOOL)isEnabled
{
  return self->_internal->enabled;
}

- (AVMediaType)mediaType
{
  v2 = self->_internal->mediaType;

  return v2;
}

- (id)sourceID
{
  return self->_internal->sourceID;
}

- (void)_setClock:(OpaqueCMClock *)a3
{
  internal = self->_internal;
  objc_sync_enter(internal);
  if (self->_internal->clock != a3)
  {
    [(AVCaptureInputPort *)self willChangeValueForKey:@"clock"];
    v6 = self->_internal;
    clock = v6->clock;
    v6->clock = a3;
    if (a3) {
      CFRetain(a3);
    }
    if (clock) {
      CFRelease(clock);
    }
    [(AVCaptureInputPort *)self didChangeValueForKey:@"clock"];
  }

  objc_sync_exit(internal);
}

+ (AVCaptureInputPort)portWithInput:(id)a3 mediaType:(id)a4 formatDescription:(opaqueCMFormatDescription *)a5 enabled:(BOOL)a6 sourceDeviceType:(id)a7 sourceDevicePosition:(int64_t)a8
{
  v8 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithInput:a3 mediaType:a4 formatDescription:a5 enabled:a6 sourceDeviceType:a7 sourceDevicePosition:a8];

  return (AVCaptureInputPort *)v8;
}

- (id)_initWithInput:(id)a3 mediaType:(id)a4 formatDescription:(opaqueCMFormatDescription *)a5 enabled:(BOOL)a6 sourceDeviceType:(id)a7 sourceDevicePosition:(int64_t)a8
{
  v24.receiver = self;
  v24.super_class = (Class)AVCaptureInputPort;
  v14 = [(AVCaptureInputPort *)&v24 init];
  if (v14)
  {
    v15 = objc_alloc_init(AVCaptureInputPortInternal);
    v14->_internal = v15;
    if (v15)
    {
      v15->input = (AVCaptureInput *)a3;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (void *)[a3 device];
        int IsLaunchPrewarmingEnabled = AVCaptureSessionIsLaunchPrewarmingEnabled();
        id v23 = [NSString alloc];
        v18 = (objc_class *)objc_opt_class();
        v19 = NSStringFromClass(v18);
        if (IsLaunchPrewarmingEnabled) {
          uint64_t v20 = [v23 initWithFormat:@"<%@ %@>", v19, objc_msgSend(v16, "deviceType")];
        }
        else {
          uint64_t v20 = [v23 initWithFormat:@"<%@ %p>", v19, v16];
        }
        v14->_internal->sourceID = (NSString *)v20;
        v14->_internal->sourceDeviceType = (NSString *)a7;
        v14->_internal->sourceDevicePosition = a8;
      }
      v14->_internal->mediaType = (NSString *)[a4 copy];
      if (a5) {
        v21 = (opaqueCMFormatDescription *)CFRetain(a5);
      }
      else {
        v21 = 0;
      }
      v14->_internal->formatDescription = v21;
      v14->_internal->enabled = a6;
      -[AVCaptureInputPort _setClock:](v14, "_setClock:", [a3 clock]);
    }
    else
    {

      return 0;
    }
  }
  return v14;
}

- (id)figCaptureSourceConfigurationForSessionPreset:(id)a3
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  internal = self->_internal;
  input = internal->input;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = self->_internal->input;
      id v9 = (id)[objc_alloc(MEMORY[0x1E4F50F80]) initWithSourceType:4];
      objc_msgSend(v9, "setSourceID:", -[AVCaptureInput sourceID](v11, "sourceID"));
      return v9;
    }
    return 0;
  }
  v8 = (void *)[(AVCaptureInput *)internal->input device];
  if (![v8 isConnected]) {
    return 0;
  }
  id v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F50F80]), "initWithSource:", objc_msgSend(v8, "figCaptureSource"));
  [v9 setSourceID:self->_internal->sourceID];
  if (([v8 hasMediaType:*MEMORY[0x1E4F47C68]] & 1) == 0
    && ([v8 hasMediaType:@"pcld"] & 1) == 0
    && ![v8 hasMediaType:*MEMORY[0x1E4F47C58]])
  {
LABEL_89:
    if ([v8 hasMediaType:*MEMORY[0x1E4F47C48]])
    {
      objc_msgSend(v9, "setDepthDataDeliveryEnabled:", objc_msgSend(v8, "_isDepthDataDeliveryEnabled"));
      objc_msgSend(v9, "setDepthDataFormat:", objc_msgSend((id)objc_msgSend(v8, "activeDepthDataFormat"), "figCaptureSourceDepthDataFormat"));
      uint64_t v49 = 0;
      uint64_t v50 = 0;
      float v35 = 0.0;
      uint64_t v51 = 0;
      if (v8)
      {
        [v8 activeDepthDataMinFrameDuration];
        if ((BYTE4(v50) & 0x1D) == 1) {
          float v35 = (float)(int)v50 / (float)v49;
        }
      }
      *(float *)&double v34 = v35;
      [v9 setDepthDataMaxFrameRate:v34];
    }
    if ([v8 hasMediaType:*MEMORY[0x1E4F47C40]])
    {
      [v9 setClientOSVersionSupportsDecoupledIO:AVGestaltGetBoolAnswer(@"AVGQCaptureMicrophoneUsesDecoupledIO")];
      objc_msgSend(v9, "setClientAudioClockDeviceUID:", objc_msgSend(v8, "clientAudioClockDeviceUID"));
    }
    return v9;
  }
  objc_msgSend(v8, "_setCenterStageAllowed:", -[AVCaptureInput isCenterStageAllowed](input, "isCenterStageAllowed"));
  objc_msgSend(v8, "_setBackgroundBlurAllowed:", -[AVCaptureInput isBackgroundBlurAllowed](input, "isBackgroundBlurAllowed"));
  objc_msgSend(v8, "_setStudioLightingAllowed:", -[AVCaptureInput isStudioLightingAllowed](input, "isStudioLightingAllowed"));
  objc_msgSend(v8, "_setReactionEffectsAllowed:", -[AVCaptureInput reactionEffectsAllowed](input, "reactionEffectsAllowed"));
  objc_msgSend(v8, "_setBackgroundReplacementAllowed:", -[AVCaptureInput isBackgroundReplacementAllowed](input, "isBackgroundReplacementAllowed"));
  objc_msgSend(v9, "setCinematicFramingSupported:", objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "isCenterStageSupported"));
  if ([v8 isCenterStageActive]
    && [(AVCaptureInput *)input isCenterStageAllowed])
  {
    [v9 setCinematicFramingEnabled:1];
    objc_msgSend(v9, "setCinematicFramingControlMode:", +[AVCaptureDevice centerStageControlMode](AVCaptureDevice, "centerStageControlMode"));
    uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat"), "cinematicFramingFormat");
  }
  else if ([v8 isGeometricDistortionCorrectionEnabled] {
         && objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat"), "geometricDistortionCorrectionFormat"))
  }
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat"), "geometricDistortionCorrectionFormat");
  }
  else
  {
    uint64_t v10 = objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat");
  }
  [v9 setRequiredFormat:v10];
  [(AVCaptureInputPort *)self _updateCenterStageUnavailableReasonsWithDevice:v8 deviceInput:input];
  if (objc_msgSend((id)objc_msgSend(v8, "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeDeskViewCamera"))
  {
    [v9 setDeskCamEnabled:1];
    objc_msgSend(v9, "setRequiredFormat:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat"), "cinematicFramingFormat"));
  }
  if ([v8 isManualFramingEnabled])
  {
    [v9 setManualCinematicFramingEnabled:1];
    objc_msgSend(v9, "setRequiredFormat:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat"), "cinematicFramingFormat"));
    [v8 manualFramingPanningAngleX];
    objc_msgSend(v9, "setManualFramingPanningAngleX:");
    [v8 manualFramingPanningAngleY];
    objc_msgSend(v9, "setManualFramingPanningAngleY:");
    [v8 manualFramingDefaultZoomFactor];
    objc_msgSend(v9, "setManualFramingDefaultZoomFactor:");
  }
  if (![v9 requiredFormat]) {
    objc_msgSend(v9, "setRequiredFormat:", objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "figCaptureSourceVideoFormat"));
  }
  if ([v9 requiredFormat])
  {
    objc_msgSend(v9, "setGazeSelectionEnabled:", objc_msgSend(v8, "isGazeSelectionEnabled"));
    if ([v8 isDockedTrackingEnabled]) {
      [v9 setDockedTrackingEnabled:1];
    }
    uint64_t v49 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    if (v8)
    {
      [v8 activeVideoMinFrameDuration];
      *(float *)&double v13 = (float)(int)v50 / (float)v49;
      [v9 setRequiredMaxFrameRate:v13];
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
      [v8 activeVideoMaxFrameDuration];
    }
    else
    {
      LODWORD(v12) = 2143289344;
      [v9 setRequiredMaxFrameRate:v12];
      uint64_t v46 = 0;
      uint64_t v47 = 0;
      uint64_t v48 = 0;
    }
    *(float *)&double v14 = (float)0 / (float)0;
    [v9 setRequiredMinFrameRate:v14];
    if (objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "isBackgroundBlurSupported")) {
      BOOL v15 = +[AVCaptureDevice isEligibleForBackgroundBlur];
    }
    else {
      BOOL v15 = 0;
    }
    [v9 setBackgroundBlurSupported:v15];
    if ([v8 isBackgroundBlurActive]
      && [(AVCaptureInput *)input isBackgroundBlurAllowed])
    {
      objc_msgSend(v9, "setBackgroundBlurEnabled:", objc_msgSend(v8, "isBackgroundBlurActive"));
    }
    [(AVCaptureInputPort *)self _updateBackgroundBlurUnavailableReasonsWithDevice:v8 deviceInput:input];
    if (objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "isStudioLightSupported")) {
      BOOL v16 = +[AVCaptureDevice isEligibleForStudioLighting];
    }
    else {
      BOOL v16 = 0;
    }
    [v9 setStudioLightingSupported:v16];
    if ([v8 isStudioLightActive]
      && [(AVCaptureInput *)input isStudioLightingAllowed])
    {
      objc_msgSend(v9, "setStudioLightingEnabled:", objc_msgSend(v8, "isStudioLightActive"));
    }
    [(AVCaptureInputPort *)self _updateStudioLightingUnavailableReasonsWithDevice:v8 deviceInput:input];
    if (objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "reactionEffectsSupported")) {
      BOOL v17 = +[AVCaptureDevice isEligibleForReactionEffects];
    }
    else {
      BOOL v17 = 0;
    }
    [v9 setReactionEffectsSupported:v17];
    if ([v8 canPerformReactionEffects]
      && [(AVCaptureInput *)input reactionEffectsAllowed])
    {
      objc_msgSend(v9, "setReactionEffectsEnabled:", objc_msgSend(v8, "canPerformReactionEffects"));
    }
    [(AVCaptureInputPort *)self _updateReactionEffectsUnavailableReasonsWithDevice:v8 deviceInput:input];
    if (objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "isBackgroundReplacementSupported")) {
      BOOL v18 = +[AVCaptureDevice isEligibleForBackgroundReplacement];
    }
    else {
      BOOL v18 = 0;
    }
    [v9 setBackgroundReplacementSupported:v18];
    if ([v8 isBackgroundReplacementActive]
      && [(AVCaptureInput *)input isBackgroundReplacementAllowed])
    {
      objc_msgSend(v9, "setBackgroundReplacementEnabled:", objc_msgSend(v8, "isBackgroundReplacementActive"));
    }
    [(AVCaptureInputPort *)self _updateBackgroundReplacementUnavailableReasonsWithDevice:v8 deviceInput:input];
    objc_msgSend(v9, "setFaceDrivenAEAFMode:", objc_msgSend(v8, "faceDrivenAEAFMode"));
    [v9 setFaceDrivenAEAFEnabledByDefault:AVGestaltGetBoolAnswer(@"AVGQCaptureFaceDrivenAEAFOnByDefault")];
    objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "maxSupportedFrameRate");
    float v20 = *(float *)&v19;
    if (input)
    {
      [(AVCaptureInput *)input videoMinFrameDurationOverride];
      if ((v44 & 0x100000000) != 0)
      {
        [(AVCaptureInput *)input videoMinFrameDurationOverride];
        [(AVCaptureInput *)input videoMinFrameDurationOverride];
        float v20 = (float)v42 / (float)v41;
        objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "maxSupportedFrameRate");
        if (v20 > v21)
        {
          objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "maxSupportedFrameRate");
          float v20 = v22;
        }
        [v9 requiredMaxFrameRate];
        if (*(float *)&v23 > v20)
        {
          *(float *)&double v23 = v20;
          [v9 setRequiredMaxFrameRate:v23];
        }
        [v9 requiredMinFrameRate];
        if (*(float *)&v19 > v20)
        {
          *(float *)&double v19 = v20;
          [v9 setRequiredMinFrameRate:v19];
        }
      }
    }
    else
    {
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      uint64_t v45 = 0;
    }
    *(float *)&double v19 = v20;
    [v9 setMaxFrameRateClientOverride:v19];
    [(AVCaptureInput *)input maxGainOverride];
    if (v24 >= 1.0) {
      objc_msgSend(v9, "setMaxGainClientOverride:");
    }
    [v8 videoZoomRampAcceleration];
    objc_msgSend(v9, "setVideoZoomRampAcceleration:");
    [v8 videoZoomFactor];
    *(float *)&double v25 = v25;
    [v9 setVideoZoomFactor:v25];
    objc_msgSend(v9, "setFallbackPrimaryConstituentDeviceTypes:", objc_msgSend(v8, "fallbackPrimaryConstituentDevicesAsDeviceTypes"));
    int v26 = [a3 isEqualToString:@"AVCaptureSessionPresetInputPriority"];
    if (([(AVCaptureInput *)input unifiedAutoExposureDefaultsEnabled] & 1) != 0
      || [v8 appliesSessionPresetMaxIntegrationTimeOverrideToActiveFormat])
    {
      uint64_t v27 = 1;
      if (v8)
      {
LABEL_66:
        [v8 activeMaxExposureDurationClientOverride];
LABEL_69:
        long long v37 = v39;
        uint64_t v38 = v40;
        [v9 setMaxExposureDurationClientOverride:&v37];
        [v9 setApplyMaxExposureDurationFrameworkOverrideWhenAvailable:v27];
        if ([v8 isVideoHDREnabled]) {
          BOOL v28 = !AVCaptureColorSpaceIsHDR([v8 activeColorSpace]);
        }
        else {
          BOOL v28 = 0;
        }
        if (objc_msgSend((id)objc_msgSend(v9, "requiredFormat"), "isSIFRSupported"))
        {
          BOOL v29 = v28 || AVCaptureColorSpaceIsHDR([v8 activeColorSpace]);
          [v9 setHighlightRecoveryEnabled:v29];
        }
        else
        {
          [v9 setSensorHDREnabled:v28];
        }
        objc_msgSend(v9, "setColorSpace:", objc_msgSend(v8, "activeColorSpace"));
        if (([v8 automaticallyAdjustsImageControlMode] & 1) == 0) {
          objc_msgSend(v9, "setImageControlMode:", objc_msgSend(v8, "imageControlMode"));
        }
        v30 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
        if ([v8 isEyeDetectionSupported])
        {
          uint64_t v31 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "eyeDetectionEnabled"));
          [v30 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F51D78]];
        }
        if ([v8 isEyeClosedDetectionSupported])
        {
          uint64_t v32 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "eyeClosedDetectionEnabled"));
          [v30 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F51D70]];
        }
        if ([v8 isSmileDetectionSupported])
        {
          uint64_t v33 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v8, "smileDetectionEnabled"));
          [v30 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F51D80]];
        }
        if ([v30 count]) {
          [v9 setFaceDetectionConfiguration:v30];
        }
        objc_msgSend(v9, "setLowLightVideoCaptureEnabled:", objc_msgSend(v8, "isLowLightVideoCaptureEnabled"));
        objc_msgSend(v9, "setSpatialOverCaptureEnabled:", objc_msgSend(v8, "isSpatialOverCaptureEnabled"));
        objc_msgSend(v9, "setNonDestructiveCropEnabled:", objc_msgSend(v8, "isNonDestructiveCropEnabled"));
        [v8 normalizedNonDestructiveCropSize];
        objc_msgSend(v9, "setNormalizedNonDestructiveCropSize:");
        objc_msgSend(v9, "setGeometricDistortionCorrectionEnabled:", objc_msgSend(v8, "isGeometricDistortionCorrectionEnabled"));
        objc_msgSend(v9, "setVariableFrameRateVideoCaptureEnabled:", objc_msgSend(v8, "isVariableFrameRateVideoCaptureEnabled"));
        objc_msgSend(v9, "setVideoStabilizationStrength:", objc_msgSend(v8, "videoStabilizationStrength"));
        goto LABEL_89;
      }
    }
    else
    {
      uint64_t v27 = v26 ^ 1u;
      if (v8) {
        goto LABEL_66;
      }
    }
    long long v39 = 0uLL;
    uint64_t v40 = 0;
    goto LABEL_69;
  }
  return v9;
}

- (void)_updateStudioLightingUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([a3 isStudioLightActive])
  {
LABEL_2:
    uint64_t v6 = 0;
    goto LABEL_3;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = objc_msgSend(a3, "formats", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    uint64_t v6 = 1;
LABEL_9:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v8);
      }
      if ([*(id *)(*((void *)&v13 + 1) + 8 * v12) isStudioLightSupported]) {
        goto LABEL_2;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v10) {
          goto LABEL_9;
        }
        goto LABEL_3;
      }
    }
  }
  uint64_t v6 = 1;
LABEL_3:
  if ([a4 isStudioLightingAllowed]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v6 | 4;
  }
  +[AVCaptureDevice setControlCenterVideoEffectUnavailableReasonsForVideoEffect:@"AVControlCenterVideoEffectStudioLighting" reasons:v7];
}

- (void)_updateReactionEffectsUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([a3 canPerformReactionEffects])
  {
LABEL_2:
    uint64_t v6 = 0;
    goto LABEL_3;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = objc_msgSend(a3, "formats", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    uint64_t v6 = 1;
LABEL_9:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v8);
      }
      if ([*(id *)(*((void *)&v13 + 1) + 8 * v12) reactionEffectsSupported]) {
        goto LABEL_2;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v10) {
          goto LABEL_9;
        }
        goto LABEL_3;
      }
    }
  }
  uint64_t v6 = 1;
LABEL_3:
  if ([a4 reactionEffectsAllowed]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v6 | 4;
  }
  +[AVCaptureDevice setControlCenterVideoEffectUnavailableReasonsForVideoEffect:@"AVControlCenterVideoEffectReactions" reasons:v7];
}

- (int)changeSeed
{
  return self->_internal->changeSeed;
}

+ (void)initialize
{
}

- (void)_updateBackgroundBlurUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([a3 isBackgroundBlurActive])
  {
    uint64_t v6 = 0;
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = objc_msgSend(a3, "formats", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      uint64_t v6 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v13 + 1) + 8 * i) isBackgroundBlurSupported])
          {
            if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isBackgroundBlurSupported")) {
              uint64_t v6 = 0;
            }
            else {
              uint64_t v6 = 2;
            }
            goto LABEL_16;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
LABEL_16:
  if ([a4 isBackgroundBlurAllowed]) {
    uint64_t v12 = v6;
  }
  else {
    uint64_t v12 = v6 | 4;
  }
  +[AVCaptureDevice setControlCenterVideoEffectUnavailableReasonsForVideoEffect:@"AVControlCenterVideoEffectBackgroundBlur" reasons:v12];
}

- (void)_updateBackgroundReplacementUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([a3 isBackgroundReplacementActive])
  {
LABEL_2:
    uint64_t v6 = 0;
    goto LABEL_3;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v8 = objc_msgSend(a3, "formats", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    uint64_t v6 = 1;
LABEL_9:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v14 != v11) {
        objc_enumerationMutation(v8);
      }
      if ([*(id *)(*((void *)&v13 + 1) + 8 * v12) isBackgroundReplacementSupported]) {
        goto LABEL_2;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v10) {
          goto LABEL_9;
        }
        goto LABEL_3;
      }
    }
  }
  uint64_t v6 = 1;
LABEL_3:
  if ([a4 isBackgroundReplacementAllowed]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v6 | 4;
  }
  +[AVCaptureDevice setControlCenterVideoEffectUnavailableReasonsForVideoEffect:@"AVControlCenterVideoEffectBackgroundReplacement" reasons:v7];
}

- (void)_updateCenterStageUnavailableReasonsWithDevice:(id)a3 deviceInput:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([a3 isCenterStageActive])
  {
    uint64_t v6 = 0;
  }
  else
  {
    if ([a3 isGeometricDistortionCorrectionSupported])
    {
      if ([a3 isGeometricDistortionCorrectionEnabled]) {
        uint64_t v7 = 0;
      }
      else {
        uint64_t v7 = 16;
      }
    }
    else
    {
      uint64_t v7 = 0;
    }
    if ([a3 _isDepthDataDeliveryEnabled]
      && !AVCaptureCurrentClientIsFaceTimeVariant())
    {
      v7 |= 8uLL;
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = objc_msgSend(a3, "formats", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v14 + 1) + 8 * i) isCenterStageSupported])
          {
            if (objc_msgSend((id)objc_msgSend(a3, "activeFormat"), "isCenterStageSupported")) {
              uint64_t v6 = v7;
            }
            else {
              uint64_t v6 = v7 | 2;
            }
            goto LABEL_23;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    uint64_t v6 = v7 | 1;
  }
LABEL_23:
  if ([a4 isCenterStageAllowed]) {
    uint64_t v13 = v6;
  }
  else {
    uint64_t v13 = v6 | 4;
  }
  +[AVCaptureDevice setControlCenterVideoEffectUnavailableReasonsForVideoEffect:@"AVControlCenterVideoEffectCenterStage" reasons:v13];
}

- (void)_setFormatDescription:(opaqueCMFormatDescription *)a3
{
  internal = self->_internal;
  formatDescription = internal->formatDescription;
  if (formatDescription != a3)
  {
    internal->formatDescription = a3;
    if (a3) {
      CFRetain(a3);
    }
    if (formatDescription) {
      CFRelease(formatDescription);
    }
    uint64_t v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"AVCaptureInputPortFormatDescriptionDidChangeNotification" object:self];
  }
}

- (BOOL)sourcesFromConstituentDevice
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = (void *)[(AVCaptureInput *)self->_internal->input device];
    v4 = [(AVCaptureInputPort *)self mediaType];
    if (v4 == (NSString *)*MEMORY[0x1E4F47C40])
    {
      uint64_t v6 = [v3 position];
      v5 = [(AVCaptureInputPort *)self sourceDevicePosition];
      goto LABEL_7;
    }
    LODWORD(v5) = [v3 isVirtualDevice];
    if (v5)
    {
      uint64_t v6 = [v3 deviceType];
      v5 = [(AVCaptureInputPort *)self sourceDeviceType];
LABEL_7:
      LOBYTE(v5) = v6 != (void)v5;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (AVCaptureDeviceType)sourceDeviceType
{
  v2 = self->_internal->sourceDeviceType;

  return v2;
}

- (CMFormatDescriptionRef)formatDescription
{
  CMFormatDescriptionRef result = self->_internal->formatDescription;
  if (result)
  {
    CFTypeRef v3 = CFRetain(result);
    return (CMFormatDescriptionRef)CFAutorelease(v3);
  }
  return result;
}

- (AVCaptureDevicePosition)sourceDevicePosition
{
  return self->_internal->sourceDevicePosition;
}

- (CMClockRef)clock
{
  internal = self->_internal;
  objc_sync_enter(internal);
  clock = self->_internal->clock;
  if (clock)
  {
    CFTypeRef v5 = CFRetain(clock);
    uint64_t v6 = (OpaqueCMClock *)CFAutorelease(v5);
  }
  else
  {
    uint64_t v6 = 0;
  }
  objc_sync_exit(internal);
  return v6;
}

- (void)bumpChangeSeed
{
  [(AVCaptureInputPort *)self willChangeValueForKey:@"changeSeed"];
  ++self->_internal->changeSeed;

  [(AVCaptureInputPort *)self didChangeValueForKey:@"changeSeed"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureInputPort;
  [(AVCaptureInputPort *)&v3 dealloc];
}

- (void)setOwner:(id)a3
{
  self->_internal->input = (AVCaptureInput *)a3;
}

- (id)description
{
  v2 = self;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  formatDescription = self->_internal->formatDescription;
  if (formatDescription)
  {
    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(formatDescription);
    if ([(NSString *)v2->_internal->mediaType isEqualToString:*MEMORY[0x1E4F47C50]]) {
      CFArrayRef Identifiers = CMMetadataFormatDescriptionGetIdentifiers(v2->_internal->formatDescription);
    }
    else {
      CFArrayRef Identifiers = 0;
    }
  }
  else
  {
    CFArrayRef Identifiers = 0;
    FourCharCode MediaSubType = 808464432;
  }
  unsigned int v38 = bswap32(MediaSubType);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    input = v2->_internal->input;
    uint64_t v7 = objc_msgSend((id)-[AVCaptureInput device](input, "device"), "deviceType");
    uint64_t v8 = objc_msgSend((id)-[AVCaptureInput device](input, "device"), "position");
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  unint64_t v9 = 0x1E4F29000uLL;
  if ([(AVCaptureInputPort *)v2 sourceDeviceType] == (AVCaptureDeviceType)v7) {
    uint64_t v10 = &stru_1EF4D21D0;
  }
  else {
    uint64_t v10 = (__CFString *)[NSString stringWithFormat:@" %@", AVCaptureDeviceTypeToString(-[AVCaptureInputPort sourceDeviceType](v2, "sourceDeviceType"))];
  }
  if ([(AVCaptureInputPort *)v2 sourceDevicePosition] == v8)
  {
    uint64_t v11 = &stru_1EF4D21D0;
    if (!Identifiers) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v11 = (__CFString *)[NSString stringWithFormat:@" %@", AVCaptureDevicePositionToString(-[AVCaptureInputPort sourceDevicePosition](v2, "sourceDevicePosition"))];
    if (!Identifiers) {
      goto LABEL_38;
    }
  }
  if ([(__CFArray *)Identifiers count])
  {
    uint64_t v12 = (__CFString *)objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @" (");
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    uint64_t v13 = [(__CFArray *)Identifiers countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (!v13) {
      goto LABEL_39;
    }
    uint64_t v14 = v13;
    uint64_t v32 = v11;
    uint64_t v33 = v10;
    double v34 = v2;
    uint64_t v15 = *(void *)v40;
    uint64_t v16 = *MEMORY[0x1E4F47CA0];
    uint64_t v17 = *MEMORY[0x1E4F47CA8];
    uint64_t v37 = *MEMORY[0x1E4F47C90];
    uint64_t v35 = *MEMORY[0x1E4F47CB0];
    uint64_t v36 = *MEMORY[0x1E4F47C98];
    while (1)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(Identifiers);
        }
        uint64_t v19 = *(void **)(*((void *)&v39 + 1) + 8 * v18);
        if ([v19 isEqualToString:v16])
        {
          float v20 = v12;
          float v21 = @"face,";
LABEL_32:
          [(__CFString *)v20 appendString:v21];
          goto LABEL_33;
        }
        if ([v19 isEqualToString:v17])
        {
          float v20 = v12;
          float v21 = @"body,";
          goto LABEL_32;
        }
        if ([v19 isEqualToString:v37])
        {
          float v20 = v12;
          float v21 = @"cat,";
          goto LABEL_32;
        }
        if ([v19 isEqualToString:v36])
        {
          float v20 = v12;
          float v21 = @"dog,";
          goto LABEL_32;
        }
        if ([v19 isEqualToString:v35])
        {
          float v20 = v12;
          float v21 = @"saliency,";
          goto LABEL_32;
        }
        [(__CFString *)v12 appendFormat:@"%@,", v19];
LABEL_33:
        [(__CFString *)v12 replaceCharactersInRange:[(__CFString *)v12 length] - 1, 1, @"" withString]);
        ++v18;
      }
      while (v14 != v18);
      uint64_t v22 = [(__CFArray *)Identifiers countByEnumeratingWithState:&v39 objects:v43 count:16];
      uint64_t v14 = v22;
      if (!v22)
      {
        uint64_t v10 = v33;
        v2 = v34;
        unint64_t v9 = 0x1E4F29000;
        uint64_t v11 = v32;
        goto LABEL_39;
      }
    }
  }
LABEL_38:
  uint64_t v12 = &stru_1EF4D21D0;
LABEL_39:
  double v23 = *(void **)(v9 + 24);
  float v24 = (objc_class *)objc_opt_class();
  double v25 = NSStringFromClass(v24);
  int v26 = (objc_class *)objc_opt_class();
  uint64_t v27 = NSStringFromClass(v26);
  BOOL v28 = v2->_internal->input;
  uint64_t v29 = [(AVCaptureInputPort *)v2 mediaType];
  if (v2->_internal->enabled) {
    v30 = "enabled";
  }
  else {
    v30 = "disabled";
  }
  return (id)[v23 stringWithFormat:@"<%@: %p (%@: %p)%@%@ %@ %.4s%@ %s>", v25, v2, v27, v28, v10, v11, v29, &v38, v12, v30];
}

- (void)setEnabled:(BOOL)enabled
{
  internal = self->_internal;
  if (internal->enabled != enabled)
  {
    internal->enabled = enabled;
    [(AVCaptureInputPort *)self bumpChangeSeed];
  }
}

- (id)valueForUndefinedKey:(id)a3
{
  if ([a3 isEqualToString:@"clock"])
  {
    return [(AVCaptureInputPort *)self clock];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AVCaptureInputPort;
    return [(AVCaptureInputPort *)&v6 valueForUndefinedKey:a3];
  }
}

+ (BOOL)automaticallyNotifiesObserversOfClock
{
  return 0;
}

@end