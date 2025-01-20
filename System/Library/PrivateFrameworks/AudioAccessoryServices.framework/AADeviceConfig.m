@interface AADeviceConfig
+ (BOOL)supportsSecureCoding;
- (AADeviceConfig)init;
- (AADeviceConfig)initWithCoder:(id)a3;
- (BOOL)needsUpdateToAAController;
- (BOOL)needsUpdateToDeviceCloudRecord;
- (NSDate)audiogramEnrolledTimestamp;
- (NSString)name;
- (char)aclPriority;
- (char)allowsAutoRoute;
- (char)audioRouteHidden;
- (char)doubleTapActionLeft;
- (char)doubleTapActionRight;
- (char)enableHearingAidGainSwipe;
- (char)enableHearingAssist;
- (char)enableHeartRateMonitor;
- (char)enableSiriMultitone;
- (char)headGestureProxCardShown;
- (char)headGestureToggle;
- (char)hearingAidEnrolled;
- (char)hearingAidToggle;
- (char)listeningModeOffAllowed;
- (char)microphoneMode;
- (char)placementMode;
- (char)relinquishAudioRoute;
- (char)smartRoutingMode;
- (char)spatialAudioAllowed;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)listeningMode;
- (int)spatialAudioMode;
- (unsigned)acceptReplyPlayPauseConfig;
- (unsigned)adaptiveVolumeConfig;
- (unsigned)autoANCStrength;
- (unsigned)bobbleConfig;
- (unsigned)clickHoldModeLeft;
- (unsigned)clickHoldModeRight;
- (unsigned)conversationDetectConfig;
- (unsigned)crownRotationDirection;
- (unsigned)declineDismissSkipConfig;
- (unsigned)endCallConfig;
- (unsigned)listeningModeConfigs;
- (unsigned)muteControlConfig;
- (unsigned)selectiveSpeechListeningConfig;
- (void)encodeWithCoder:(id)a3;
- (void)setAcceptReplyPlayPauseConfig:(unsigned __int8)a3;
- (void)setAclPriority:(char)a3;
- (void)setAdaptiveVolumeConfig:(unsigned __int8)a3;
- (void)setAllowsAutoRoute:(char)a3;
- (void)setAudioRouteHidden:(char)a3;
- (void)setAudiogramEnrolledTimestamp:(id)a3;
- (void)setAutoANCStrength:(unsigned int)a3;
- (void)setBobbleConfig:(unsigned __int8)a3;
- (void)setClickHoldModeLeft:(unsigned __int8)a3;
- (void)setClickHoldModeRight:(unsigned __int8)a3;
- (void)setConversationDetectConfig:(unsigned __int8)a3;
- (void)setCrownRotationDirection:(unsigned __int8)a3;
- (void)setDeclineDismissSkipConfig:(unsigned __int8)a3;
- (void)setDoubleTapActionLeft:(char)a3;
- (void)setDoubleTapActionRight:(char)a3;
- (void)setEnableHearingAidGainSwipe:(char)a3;
- (void)setEnableHearingAssist:(char)a3;
- (void)setEnableHeartRateMonitor:(char)a3;
- (void)setEnableSiriMultitone:(char)a3;
- (void)setEndCallConfig:(unsigned __int8)a3;
- (void)setHeadGestureProxCardShown:(char)a3;
- (void)setHeadGestureToggle:(char)a3;
- (void)setHearingAidEnrolled:(char)a3;
- (void)setHearingAidToggle:(char)a3;
- (void)setListeningMode:(int)a3;
- (void)setListeningModeConfigs:(unsigned int)a3;
- (void)setListeningModeOffAllowed:(char)a3;
- (void)setMicrophoneMode:(char)a3;
- (void)setMuteControlConfig:(unsigned __int8)a3;
- (void)setName:(id)a3;
- (void)setPlacementMode:(char)a3;
- (void)setRelinquishAudioRoute:(char)a3;
- (void)setSelectiveSpeechListeningConfig:(unsigned __int8)a3;
- (void)setSmartRoutingMode:(char)a3;
- (void)setSpatialAudioAllowed:(char)a3;
- (void)setSpatialAudioMode:(int)a3;
@end

@implementation AADeviceConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AADeviceConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)AADeviceConfig;
  v2 = [(AADeviceConfig *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_spatialAudioMode = 255;
    v4 = v2;
  }

  return v3;
}

- (AADeviceConfig)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AADeviceConfig *)self init];

  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_acceptReplyPlayPauseConfig = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_aclPriority = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_adaptiveVolumeConfig = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_allowsAutoRoute = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_audioRouteHidden = 0;
    }
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_autoANCStrength = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_clickHoldModeLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_clickHoldModeRight = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_conversationDetectConfig = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_crownRotationDirection = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_declineDismissSkipConfig = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_doubleTapActionLeft = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_doubleTapActionRight = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enableHearingAidGainSwipe = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enableHearingAssist = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enableSiriMultitone = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_endCallConfig = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_headGestureToggle = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingAidEnrolled = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_hearingAidToggle = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_enableHeartRateMonitor = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_listeningMode = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_listeningModeConfigs = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_listeningModeOffAllowed = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_microphoneMode = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_muteControlConfig = 0;
    }
    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_placementMode = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_relinquishAudioRoute = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_selectiveSpeechListeningConfig = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_smartRoutingMode = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_spatialAudioAllowed = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_spatialAudioMode = 0;
    }
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (self->_acceptReplyPlayPauseConfig)
  {
    objc_msgSend(v4, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_aclPriority)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_adaptiveVolumeConfig)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_allowsAutoRoute)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_audioRouteHidden)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  audiogramEnrolledTimestamp = self->_audiogramEnrolledTimestamp;
  if (audiogramEnrolledTimestamp)
  {
    [v11 encodeObject:audiogramEnrolledTimestamp forKey:@"agET"];
    id v4 = v11;
  }
  uint64_t autoANCStrength = self->_autoANCStrength;
  if (autoANCStrength)
  {
    [v11 encodeInt64:autoANCStrength forKey:@"aaS"];
    id v4 = v11;
  }
  if (self->_clickHoldModeLeft)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_clickHoldModeRight)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_conversationDetectConfig)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_crownRotationDirection)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_declineDismissSkipConfig)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_doubleTapActionLeft)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_doubleTapActionRight)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_enableHearingAidGainSwipe)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_enableHearingAssist)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_enableSiriMultitone)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_endCallConfig)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_headGestureToggle)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_hearingAidEnrolled)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_hearingAidToggle)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_enableHeartRateMonitor)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  uint64_t listeningMode = self->_listeningMode;
  if (listeningMode)
  {
    [v11 encodeInteger:listeningMode forKey:@"lsmd"];
    id v4 = v11;
  }
  uint64_t listeningModeConfigs = self->_listeningModeConfigs;
  if (listeningModeConfigs)
  {
    [v11 encodeInt64:listeningModeConfigs forKey:@"lsmc"];
    id v4 = v11;
  }
  if (self->_listeningModeOffAllowed)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_microphoneMode)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_muteControlConfig)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  name = self->_name;
  if (name)
  {
    [v11 encodeObject:name forKey:@"name"];
    id v4 = v11;
  }
  if (self->_placementMode)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_relinquishAudioRoute)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_selectiveSpeechListeningConfig)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_smartRoutingMode)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  if (self->_spatialAudioAllowed)
  {
    objc_msgSend(v11, "encodeInteger:forKey:");
    id v4 = v11;
  }
  int spatialAudioMode = self->_spatialAudioMode;
  if (spatialAudioMode && spatialAudioMode != 255)
  {
    [v11 encodeInteger:spatialAudioMode forKey:@"samd"];
    id v4 = v11;
  }
}

- (id)description
{
  return [(AADeviceConfig *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  v53 = [(id)objc_opt_class() description];
  NSAppendPrintF_safe();
  id v4 = 0;

  if (self->_acceptReplyPlayPauseConfig)
  {
    NSAppendPrintF_safe();
    id v5 = v4;

    id v4 = v5;
  }
  if (self->_aclPriority)
  {
    NSAppendPrintF_safe();
    id v6 = v4;

    id v4 = v6;
  }
  if (self->_adaptiveVolumeConfig)
  {
    NSAppendPrintF_safe();
    id v7 = v4;

    id v4 = v7;
  }
  if (self->_allowsAutoRoute)
  {
    NSAppendPrintF_safe();
    id v8 = v4;

    id v4 = v8;
  }
  v9 = self->_audiogramEnrolledTimestamp;
  if (v9)
  {
    NSAppendPrintF_safe();
    id v10 = v4;

    id v4 = v10;
  }

  if (self->_audioRouteHidden)
  {
    NSAppendPrintF_safe();
    id v11 = v4;

    id v4 = v11;
  }
  if (self->_autoANCStrength)
  {
    NSAppendPrintF_safe();
    id v13 = v4;

    id v4 = v13;
  }
  if (self->_bobbleConfig)
  {
    NSAppendPrintF_safe();
    id v14 = v4;

    id v4 = v14;
  }
  int clickHoldModeLeft = self->_clickHoldModeLeft;
  int clickHoldModeRight = self->_clickHoldModeRight;
  if (clickHoldModeLeft | clickHoldModeRight)
  {
    NSAppendPrintF_safe();
    id v17 = v4;

    if (clickHoldModeLeft)
    {
      NSAppendPrintF_safe();
      id v18 = v17;

      id v17 = v18;
    }
    if (clickHoldModeRight)
    {
      NSAppendPrintF_safe();
      id v4 = v17;
    }
    else
    {
      id v4 = v17;
    }
  }
  if (self->_conversationDetectConfig)
  {
    NSAppendPrintF_safe();
    id v19 = v4;

    id v4 = v19;
  }
  int crownRotationDirection = self->_crownRotationDirection;
  if (self->_crownRotationDirection)
  {
    v21 = @"?";
    if (crownRotationDirection == 1) {
      v21 = @"BackToFront";
    }
    if (crownRotationDirection == 2) {
      v22 = @"FrontToBack";
    }
    else {
      v22 = v21;
    }
    v54 = v22;
    NSAppendPrintF_safe();
    id v23 = v4;

    id v4 = v23;
  }
  if (self->_declineDismissSkipConfig)
  {
    NSAppendPrintF_safe();
    id v24 = v4;

    id v4 = v24;
  }
  int doubleTapActionLeft = self->_doubleTapActionLeft;
  int doubleTapActionRight = self->_doubleTapActionRight;
  if (doubleTapActionLeft | doubleTapActionRight)
  {
    NSAppendPrintF_safe();
    id v27 = v4;

    if (doubleTapActionLeft)
    {
      NSAppendPrintF_safe();
      id v28 = v27;

      id v27 = v28;
    }
    if (doubleTapActionRight)
    {
      NSAppendPrintF_safe();
      id v4 = v27;
    }
    else
    {
      id v4 = v27;
    }
  }
  if (self->_enableHearingAidGainSwipe)
  {
    NSAppendPrintF_safe();
    id v29 = v4;

    id v4 = v29;
  }
  if (self->_enableHearingAssist)
  {
    NSAppendPrintF_safe();
    id v30 = v4;

    id v4 = v30;
  }
  if (self->_enableSiriMultitone)
  {
    NSAppendPrintF_safe();
    id v31 = v4;

    id v4 = v31;
  }
  if (self->_endCallConfig)
  {
    NSAppendPrintF_safe();
    id v32 = v4;

    id v4 = v32;
  }
  if (self->_headGestureToggle)
  {
    NSAppendPrintF_safe();
    id v33 = v4;

    id v4 = v33;
  }
  if (self->_headGestureProxCardShown)
  {
    NSAppendPrintF_safe();
    id v34 = v4;

    id v4 = v34;
  }
  if (self->_hearingAidToggle)
  {
    NSAppendPrintF_safe();
    id v35 = v4;

    id v4 = v35;
  }
  if (self->_hearingAidEnrolled)
  {
    NSAppendPrintF_safe();
    id v36 = v4;

    id v4 = v36;
  }
  if (self->_enableHeartRateMonitor)
  {
    NSAppendPrintF_safe();
    id v37 = v4;

    id v4 = v37;
  }
  if (self->_listeningMode)
  {
    NSAppendPrintF_safe();
    id v38 = v4;

    id v4 = v38;
  }
  if (self->_listeningModeConfigs)
  {
    v55 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v39 = v4;

    id v4 = v39;
  }
  if (self->_listeningModeOffAllowed)
  {
    NSAppendPrintF_safe();
    id v40 = v4;

    id v4 = v40;
  }
  if (self->_microphoneMode)
  {
    NSAppendPrintF_safe();
    id v41 = v4;

    id v4 = v41;
  }
  if (self->_muteControlConfig)
  {
    NSAppendPrintF_safe();
    id v42 = v4;

    id v4 = v42;
  }
  v43 = self->_name;
  if (v43)
  {
    NSAppendPrintF_safe();
    id v44 = v4;

    id v4 = v44;
  }

  if (self->_placementMode)
  {
    NSAppendPrintF_safe();
    id v45 = v4;

    id v4 = v45;
  }
  if (self->_relinquishAudioRoute)
  {
    NSAppendPrintF_safe();
    id v46 = v4;

    id v4 = v46;
  }
  if (self->_selectiveSpeechListeningConfig)
  {
    NSAppendPrintF_safe();
    id v47 = v4;

    id v4 = v47;
  }
  if (self->_smartRoutingMode)
  {
    NSAppendPrintF_safe();
    id v48 = v4;

    id v4 = v48;
  }
  if (self->_spatialAudioAllowed)
  {
    NSAppendPrintF_safe();
    id v49 = v4;

    id v4 = v49;
  }
  if (self->_spatialAudioMode != 255)
  {
    NSAppendPrintF_safe();
    id v50 = v4;

    id v4 = v50;
  }
  id v51 = v4;

  return v51;
}

- (BOOL)needsUpdateToAAController
{
  return _os_feature_enabled_impl()
      && (self->_enableHearingAidGainSwipe
       || self->_enableHearingAssist
       || self->_hearingAidToggle
       || self->_hearingAidEnrolled)
      || _os_feature_enabled_impl() && self->_listeningModeOffAllowed
      || self->_autoANCStrength
      || self->_enableHeartRateMonitor
      || self->_enableSiriMultitone != 0;
}

- (BOOL)needsUpdateToDeviceCloudRecord
{
  return _os_feature_enabled_impl() && self->_audiogramEnrolledTimestamp
      || self->_headGestureToggle
      || self->_acceptReplyPlayPauseConfig
      || self->_declineDismissSkipConfig
      || _os_feature_enabled_impl() && self->_listeningModeOffAllowed;
}

- (unsigned)acceptReplyPlayPauseConfig
{
  return self->_acceptReplyPlayPauseConfig;
}

- (void)setAcceptReplyPlayPauseConfig:(unsigned __int8)a3
{
  self->_acceptReplyPlayPauseConfig = a3;
}

- (char)aclPriority
{
  return self->_aclPriority;
}

- (void)setAclPriority:(char)a3
{
  self->_aclPriority = a3;
}

- (unsigned)adaptiveVolumeConfig
{
  return self->_adaptiveVolumeConfig;
}

- (void)setAdaptiveVolumeConfig:(unsigned __int8)a3
{
  self->_adaptiveVolumeConfig = a3;
}

- (unsigned)autoANCStrength
{
  return self->_autoANCStrength;
}

- (void)setAutoANCStrength:(unsigned int)a3
{
  self->_uint64_t autoANCStrength = a3;
}

- (char)allowsAutoRoute
{
  return self->_allowsAutoRoute;
}

- (void)setAllowsAutoRoute:(char)a3
{
  self->_allowsAutoRoute = a3;
}

- (NSDate)audiogramEnrolledTimestamp
{
  return self->_audiogramEnrolledTimestamp;
}

- (void)setAudiogramEnrolledTimestamp:(id)a3
{
}

- (char)audioRouteHidden
{
  return self->_audioRouteHidden;
}

- (void)setAudioRouteHidden:(char)a3
{
  self->_audioRouteHidden = a3;
}

- (unsigned)bobbleConfig
{
  return self->_bobbleConfig;
}

- (void)setBobbleConfig:(unsigned __int8)a3
{
  self->_bobbleConfig = a3;
}

- (unsigned)clickHoldModeLeft
{
  return self->_clickHoldModeLeft;
}

- (void)setClickHoldModeLeft:(unsigned __int8)a3
{
  self->_int clickHoldModeLeft = a3;
}

- (unsigned)clickHoldModeRight
{
  return self->_clickHoldModeRight;
}

- (void)setClickHoldModeRight:(unsigned __int8)a3
{
  self->_int clickHoldModeRight = a3;
}

- (unsigned)conversationDetectConfig
{
  return self->_conversationDetectConfig;
}

- (void)setConversationDetectConfig:(unsigned __int8)a3
{
  self->_conversationDetectConfig = a3;
}

- (unsigned)crownRotationDirection
{
  return self->_crownRotationDirection;
}

- (void)setCrownRotationDirection:(unsigned __int8)a3
{
  self->_int crownRotationDirection = a3;
}

- (unsigned)declineDismissSkipConfig
{
  return self->_declineDismissSkipConfig;
}

- (void)setDeclineDismissSkipConfig:(unsigned __int8)a3
{
  self->_declineDismissSkipConfig = a3;
}

- (char)doubleTapActionLeft
{
  return self->_doubleTapActionLeft;
}

- (void)setDoubleTapActionLeft:(char)a3
{
  self->_int doubleTapActionLeft = a3;
}

- (char)doubleTapActionRight
{
  return self->_doubleTapActionRight;
}

- (void)setDoubleTapActionRight:(char)a3
{
  self->_int doubleTapActionRight = a3;
}

- (char)enableHearingAidGainSwipe
{
  return self->_enableHearingAidGainSwipe;
}

- (void)setEnableHearingAidGainSwipe:(char)a3
{
  self->_enableHearingAidGainSwipe = a3;
}

- (char)enableHearingAssist
{
  return self->_enableHearingAssist;
}

- (void)setEnableHearingAssist:(char)a3
{
  self->_enableHearingAssist = a3;
}

- (char)enableSiriMultitone
{
  return self->_enableSiriMultitone;
}

- (void)setEnableSiriMultitone:(char)a3
{
  self->_enableSiriMultitone = a3;
}

- (unsigned)endCallConfig
{
  return self->_endCallConfig;
}

- (void)setEndCallConfig:(unsigned __int8)a3
{
  self->_endCallConfig = a3;
}

- (char)headGestureToggle
{
  return self->_headGestureToggle;
}

- (void)setHeadGestureToggle:(char)a3
{
  self->_headGestureToggle = a3;
}

- (char)headGestureProxCardShown
{
  return self->_headGestureProxCardShown;
}

- (void)setHeadGestureProxCardShown:(char)a3
{
  self->_headGestureProxCardShown = a3;
}

- (char)hearingAidToggle
{
  return self->_hearingAidToggle;
}

- (void)setHearingAidToggle:(char)a3
{
  self->_hearingAidToggle = a3;
}

- (char)hearingAidEnrolled
{
  return self->_hearingAidEnrolled;
}

- (void)setHearingAidEnrolled:(char)a3
{
  self->_hearingAidEnrolled = a3;
}

- (char)enableHeartRateMonitor
{
  return self->_enableHeartRateMonitor;
}

- (void)setEnableHeartRateMonitor:(char)a3
{
  self->_enableHeartRateMonitor = a3;
}

- (int)listeningMode
{
  return self->_listeningMode;
}

- (void)setListeningMode:(int)a3
{
  self->_uint64_t listeningMode = a3;
}

- (unsigned)listeningModeConfigs
{
  return self->_listeningModeConfigs;
}

- (void)setListeningModeConfigs:(unsigned int)a3
{
  self->_uint64_t listeningModeConfigs = a3;
}

- (char)listeningModeOffAllowed
{
  return self->_listeningModeOffAllowed;
}

- (void)setListeningModeOffAllowed:(char)a3
{
  self->_listeningModeOffAllowed = a3;
}

- (char)microphoneMode
{
  return self->_microphoneMode;
}

- (void)setMicrophoneMode:(char)a3
{
  self->_microphoneMode = a3;
}

- (unsigned)muteControlConfig
{
  return self->_muteControlConfig;
}

- (void)setMuteControlConfig:(unsigned __int8)a3
{
  self->_muteControlConfig = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (char)placementMode
{
  return self->_placementMode;
}

- (void)setPlacementMode:(char)a3
{
  self->_placementMode = a3;
}

- (char)relinquishAudioRoute
{
  return self->_relinquishAudioRoute;
}

- (void)setRelinquishAudioRoute:(char)a3
{
  self->_relinquishAudioRoute = a3;
}

- (unsigned)selectiveSpeechListeningConfig
{
  return self->_selectiveSpeechListeningConfig;
}

- (void)setSelectiveSpeechListeningConfig:(unsigned __int8)a3
{
  self->_selectiveSpeechListeningConfig = a3;
}

- (char)smartRoutingMode
{
  return self->_smartRoutingMode;
}

- (void)setSmartRoutingMode:(char)a3
{
  self->_smartRoutingMode = a3;
}

- (char)spatialAudioAllowed
{
  return self->_spatialAudioAllowed;
}

- (void)setSpatialAudioAllowed:(char)a3
{
  self->_spatialAudioAllowed = a3;
}

- (int)spatialAudioMode
{
  return self->_spatialAudioMode;
}

- (void)setSpatialAudioMode:(int)a3
{
  self->_int spatialAudioMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_audiogramEnrolledTimestamp, 0);
}

@end