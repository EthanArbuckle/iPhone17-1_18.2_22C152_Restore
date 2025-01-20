@interface CBDeviceSettings
- (CBDeviceSettings)init;
- (CBDeviceSettings)initWithXPCObject:(id)a3 error:(id *)a4;
- (NSString)name;
- (char)aclPriority;
- (char)allowsAutoRoute;
- (char)audioRouteHidden;
- (char)doubleTapActionLeft;
- (char)doubleTapActionRight;
- (char)microphoneMode;
- (char)placementMode;
- (char)relinquishAudioRoute;
- (char)smartRoutingMode;
- (char)spatialAudioAllowed;
- (id)description;
- (int)listeningMode;
- (int)spatialAudioMode;
- (unint64_t)deviceFlagsMask;
- (unint64_t)deviceFlagsValue;
- (unsigned)adaptiveVolumeConfig;
- (unsigned)clickHoldModeLeft;
- (unsigned)clickHoldModeRight;
- (unsigned)conversationDetectConfig;
- (unsigned)crownRotationDirection;
- (unsigned)endCallConfig;
- (unsigned)listeningModeConfigs;
- (unsigned)muteControlConfig;
- (unsigned)selectiveSpeechListeningConfig;
- (void)encodeWithXPCObject:(id)a3;
- (void)setAclPriority:(char)a3;
- (void)setAdaptiveVolumeConfig:(unsigned __int8)a3;
- (void)setAllowsAutoRoute:(char)a3;
- (void)setAudioRouteHidden:(char)a3;
- (void)setClickHoldModeLeft:(unsigned __int8)a3;
- (void)setClickHoldModeRight:(unsigned __int8)a3;
- (void)setConversationDetectConfig:(unsigned __int8)a3;
- (void)setCrownRotationDirection:(unsigned __int8)a3;
- (void)setDeviceFlagsMask:(unint64_t)a3;
- (void)setDeviceFlagsValue:(unint64_t)a3;
- (void)setDoubleTapActionLeft:(char)a3;
- (void)setDoubleTapActionRight:(char)a3;
- (void)setEndCallConfig:(unsigned __int8)a3;
- (void)setListeningMode:(int)a3;
- (void)setListeningModeConfigs:(unsigned int)a3;
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

@implementation CBDeviceSettings

- (CBDeviceSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)CBDeviceSettings;
  v2 = [(CBDeviceSettings *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_spatialAudioMode = 255;
    v4 = v2;
  }

  return v3;
}

- (CBDeviceSettings)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(CBDeviceSettings *)self init];
  if (!v7)
  {
    if (a4)
    {
      v39 = [(id)objc_opt_class() description];
      CBErrorF(-6756, (uint64_t)"%@ super init failed", v40, v41, v42, v43, v44, v45, (uint64_t)v39);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_79;
  }
  if (MEMORY[0x1AD1120E0](v6) != MEMORY[0x1E4F14590])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v46);
      v37 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_74;
    }
    goto LABEL_79;
  }
  int v14 = CUXPCDecodeSInt64RangedEx();
  if (v14 == 6)
  {
    v7->_aclPriority = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_79;
  }
  int v15 = CUXPCDecodeUInt64RangedEx();
  if (v15 == 6)
  {
    v7->_adaptiveVolumeConfig = 0;
  }
  else if (v15 == 5)
  {
    goto LABEL_79;
  }
  int v16 = CUXPCDecodeSInt64RangedEx();
  if (v16 == 6)
  {
    v7->_allowsAutoRoute = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_79;
  }
  int v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 == 6)
  {
    v7->_audioRouteHidden = 0;
  }
  else if (v17 == 5)
  {
    goto LABEL_79;
  }
  int v18 = CUXPCDecodeUInt64RangedEx();
  if (v18 == 6)
  {
    v7->_clickHoldModeLeft = 0;
  }
  else if (v18 == 5)
  {
    goto LABEL_79;
  }
  int v19 = CUXPCDecodeUInt64RangedEx();
  if (v19 == 6)
  {
    v7->_clickHoldModeRight = 0;
  }
  else if (v19 == 5)
  {
    goto LABEL_79;
  }
  int v20 = CUXPCDecodeUInt64RangedEx();
  if (v20 == 6)
  {
    v7->_conversationDetectConfig = 0;
  }
  else if (v20 == 5)
  {
    goto LABEL_79;
  }
  int v21 = CUXPCDecodeUInt64RangedEx();
  if (v21 == 6)
  {
    v7->_crownRotationDirection = 0;
  }
  else if (v21 == 5)
  {
    goto LABEL_79;
  }
  int v22 = CUXPCDecodeUInt64RangedEx();
  if (v22 == 6)
  {
    v7->_deviceFlagsMask = 0;
  }
  else if (v22 == 5)
  {
    goto LABEL_79;
  }
  int v23 = CUXPCDecodeUInt64RangedEx();
  if (v23 == 6)
  {
    v7->_deviceFlagsValue = 0;
  }
  else if (v23 == 5)
  {
    goto LABEL_79;
  }
  int v24 = CUXPCDecodeSInt64RangedEx();
  if (v24 == 6)
  {
    v7->_doubleTapActionLeft = 0;
  }
  else if (v24 == 5)
  {
    goto LABEL_79;
  }
  int v25 = CUXPCDecodeSInt64RangedEx();
  if (v25 == 6)
  {
    v7->_doubleTapActionRight = 0;
  }
  else if (v25 == 5)
  {
    goto LABEL_79;
  }
  int v26 = CUXPCDecodeUInt64RangedEx();
  if (v26 == 6)
  {
    v7->_endCallConfig = 0;
  }
  else if (v26 == 5)
  {
    goto LABEL_79;
  }
  int v27 = CUXPCDecodeSInt64RangedEx();
  if (v27 == 6)
  {
    v7->_listeningMode = 0;
  }
  else if (v27 == 5)
  {
    goto LABEL_79;
  }
  int v28 = CUXPCDecodeUInt64RangedEx();
  if (v28 == 6)
  {
    v7->_listeningModeConfigs = 0;
  }
  else if (v28 == 5)
  {
    goto LABEL_79;
  }
  int v29 = CUXPCDecodeSInt64RangedEx();
  if (v29 == 6)
  {
    v7->_microphoneMode = 0;
  }
  else if (v29 == 5)
  {
    goto LABEL_79;
  }
  int v30 = CUXPCDecodeUInt64RangedEx();
  if (v30 == 6)
  {
    v7->_muteControlConfig = 0;
  }
  else if (v30 == 5)
  {
    goto LABEL_79;
  }
  if (!CUXPCDecodeNSString()) {
    goto LABEL_79;
  }
  int v31 = CUXPCDecodeSInt64RangedEx();
  if (v31 == 6)
  {
    v7->_placementMode = 0;
  }
  else if (v31 == 5)
  {
    goto LABEL_79;
  }
  int v32 = CUXPCDecodeSInt64RangedEx();
  if (v32 == 6)
  {
    v7->_relinquishAudioRoute = 0;
  }
  else if (v32 == 5)
  {
    goto LABEL_79;
  }
  int v33 = CUXPCDecodeUInt64RangedEx();
  if (v33 == 6)
  {
    v7->_selectiveSpeechListeningConfig = 0;
  }
  else if (v33 == 5)
  {
    goto LABEL_79;
  }
  int v34 = CUXPCDecodeSInt64RangedEx();
  if (v34 == 6)
  {
    v7->_smartRoutingMode = 0;
  }
  else if (v34 == 5)
  {
    goto LABEL_79;
  }
  int v35 = CUXPCDecodeSInt64RangedEx();
  if (v35 == 6)
  {
    v7->_spatialAudioAllowed = 0;
  }
  else if (v35 == 5)
  {
    goto LABEL_79;
  }
  int v36 = CUXPCDecodeSInt64RangedEx();
  if (v36 != 6)
  {
    if (v36 != 5) {
      goto LABEL_73;
    }
LABEL_79:
    v37 = 0;
    goto LABEL_74;
  }
  v7->_spatialAudioMode = 0;
LABEL_73:
  v37 = v7;
LABEL_74:

  return v37;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_aclPriority) {
    xpc_dictionary_set_int64(v4, "aclP", self->_aclPriority);
  }
  if (self->_adaptiveVolumeConfig) {
    xpc_dictionary_set_uint64(v5, "avCf", self->_adaptiveVolumeConfig);
  }
  if (self->_allowsAutoRoute) {
    xpc_dictionary_set_int64(v5, "alAR", self->_allowsAutoRoute);
  }
  if (self->_audioRouteHidden) {
    xpc_dictionary_set_int64(v5, "auRH", self->_audioRouteHidden);
  }
  if (self->_clickHoldModeLeft) {
    xpc_dictionary_set_uint64(v5, "clHL", self->_clickHoldModeLeft);
  }
  if (self->_clickHoldModeRight) {
    xpc_dictionary_set_uint64(v5, "clHR", self->_clickHoldModeRight);
  }
  if (self->_crownRotationDirection) {
    xpc_dictionary_set_uint64(v5, "crRD", self->_crownRotationDirection);
  }
  if (self->_conversationDetectConfig) {
    xpc_dictionary_set_uint64(v5, "cdCf", self->_conversationDetectConfig);
  }
  uint64_t deviceFlagsMask = self->_deviceFlagsMask;
  if (deviceFlagsMask) {
    xpc_dictionary_set_uint64(v5, "dvFM", deviceFlagsMask);
  }
  uint64_t deviceFlagsValue = self->_deviceFlagsValue;
  if (deviceFlagsValue) {
    xpc_dictionary_set_uint64(v5, "dvFV", deviceFlagsValue);
  }
  if (self->_doubleTapActionLeft) {
    xpc_dictionary_set_int64(v5, "dtAL", self->_doubleTapActionLeft);
  }
  if (self->_doubleTapActionRight) {
    xpc_dictionary_set_int64(v5, "dtAR", self->_doubleTapActionRight);
  }
  if (self->_endCallConfig) {
    xpc_dictionary_set_uint64(v5, "eCC", self->_endCallConfig);
  }
  int64_t listeningMode = self->_listeningMode;
  if (listeningMode) {
    xpc_dictionary_set_int64(v5, "lsnM", listeningMode);
  }
  uint64_t listeningModeConfigs = self->_listeningModeConfigs;
  if (listeningModeConfigs) {
    xpc_dictionary_set_uint64(v5, "lsMC", listeningModeConfigs);
  }
  if (self->_microphoneMode) {
    xpc_dictionary_set_int64(v5, "micM", self->_microphoneMode);
  }
  if (self->_muteControlConfig) {
    xpc_dictionary_set_uint64(v5, "mCC", self->_muteControlConfig);
  }
  name = self->_name;
  xpc_object_t xdict = v5;
  uint64_t v11 = [(NSString *)name UTF8String];
  if (v11) {
    xpc_dictionary_set_string(xdict, "nm", v11);
  }

  if (self->_placementMode) {
    xpc_dictionary_set_int64(xdict, "dPlM", self->_placementMode);
  }
  if (self->_relinquishAudioRoute) {
    xpc_dictionary_set_int64(xdict, "rlAR", self->_relinquishAudioRoute);
  }
  uint64_t v12 = xdict;
  if (self->_selectiveSpeechListeningConfig)
  {
    xpc_dictionary_set_uint64(xdict, "ssCf", self->_selectiveSpeechListeningConfig);
    uint64_t v12 = xdict;
  }
  if (self->_smartRoutingMode)
  {
    xpc_dictionary_set_int64(xdict, "srMd", self->_smartRoutingMode);
    uint64_t v12 = xdict;
  }
  if (self->_spatialAudioAllowed)
  {
    xpc_dictionary_set_int64(xdict, "SpAA", self->_spatialAudioAllowed);
    uint64_t v12 = xdict;
  }
  int64_t spatialAudioMode = self->_spatialAudioMode;
  if (spatialAudioMode != 255)
  {
    xpc_dictionary_set_int64(xdict, "SpAM", spatialAudioMode);
    uint64_t v12 = xdict;
  }
}

- (id)description
{
  v38 = [(id)objc_opt_class() description];
  NSAppendPrintF_safe();
  id v3 = 0;

  if (self->_aclPriority)
  {
    NSAppendPrintF_safe();
    id v4 = v3;

    id v3 = v4;
  }
  if (self->_adaptiveVolumeConfig)
  {
    NSAppendPrintF_safe();
    id v5 = v3;

    id v3 = v5;
  }
  if (self->_allowsAutoRoute)
  {
    NSAppendPrintF_safe();
    id v6 = v3;

    id v3 = v6;
  }
  if (self->_audioRouteHidden)
  {
    NSAppendPrintF_safe();
    id v7 = v3;

    id v3 = v7;
  }
  int clickHoldModeLeft = self->_clickHoldModeLeft;
  int clickHoldModeRight = self->_clickHoldModeRight;
  if (clickHoldModeLeft | clickHoldModeRight)
  {
    NSAppendPrintF_safe();
    id v10 = v3;

    if (clickHoldModeLeft)
    {
      NSAppendPrintF_safe();
      id v11 = v10;

      id v10 = v11;
    }
    if (clickHoldModeRight)
    {
      NSAppendPrintF_safe();
      id v3 = v10;
    }
    else
    {
      id v3 = v10;
    }
  }
  if (self->_conversationDetectConfig)
  {
    NSAppendPrintF_safe();
    id v12 = v3;

    id v3 = v12;
  }
  int crownRotationDirection = self->_crownRotationDirection;
  if (self->_crownRotationDirection)
  {
    int v14 = @"?";
    if (crownRotationDirection == 1) {
      int v14 = @"BackToFront";
    }
    if (crownRotationDirection == 2) {
      int v15 = @"FrontToBack";
    }
    else {
      int v15 = v14;
    }
    v39 = v15;
    NSAppendPrintF_safe();
    id v16 = v3;

    id v3 = v16;
  }
  if (*(_OWORD *)&self->_deviceFlagsMask == 0)
  {
    int doubleTapActionLeft = self->_doubleTapActionLeft;
    int doubleTapActionRight = self->_doubleTapActionRight;
    if (!(doubleTapActionLeft | doubleTapActionRight)) {
      goto LABEL_26;
    }
LABEL_33:
    NSAppendPrintF_safe();
    id v22 = v3;

    if (doubleTapActionLeft)
    {
      NSAppendPrintF_safe();
      id v35 = v22;

      id v22 = v35;
    }
    if (doubleTapActionRight)
    {
      NSAppendPrintF_safe();
      id v3 = v22;

      if (self->_endCallConfig) {
        goto LABEL_56;
      }
    }
    else
    {
      id v3 = v22;
      if (self->_endCallConfig) {
        goto LABEL_56;
      }
    }
LABEL_27:
    if (!self->_listeningMode) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
  int v20 = CUPrintFlags64();
  uint64_t v41 = CUPrintFlags64();
  NSAppendPrintF_safe();
  id v21 = v3;

  id v3 = v21;
  int doubleTapActionLeft = self->_doubleTapActionLeft;
  int doubleTapActionRight = self->_doubleTapActionRight;
  if (doubleTapActionLeft | doubleTapActionRight) {
    goto LABEL_33;
  }
LABEL_26:
  if (!self->_endCallConfig) {
    goto LABEL_27;
  }
LABEL_56:
  NSAppendPrintF_safe();
  id v36 = v3;

  id v3 = v36;
  if (!self->_listeningMode)
  {
LABEL_28:
    if (!self->_listeningModeConfigs) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_57:
  NSAppendPrintF_safe();
  id v37 = v3;

  id v3 = v37;
  if (self->_listeningModeConfigs)
  {
LABEL_29:
    uint64_t v40 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v19 = v3;

    id v3 = v19;
  }
LABEL_30:
  if (self->_microphoneMode)
  {
    NSAppendPrintF_safe();
    id v23 = v3;

    id v3 = v23;
  }
  if (self->_muteControlConfig)
  {
    NSAppendPrintF_safe();
    id v24 = v3;

    id v3 = v24;
  }
  int v25 = self->_name;
  if (v25)
  {
    NSAppendPrintF_safe();
    id v26 = v3;

    id v3 = v26;
  }

  if (self->_placementMode)
  {
    NSAppendPrintF_safe();
    id v27 = v3;

    id v3 = v27;
  }
  if (self->_relinquishAudioRoute)
  {
    NSAppendPrintF_safe();
    id v28 = v3;

    id v3 = v28;
  }
  if (self->_selectiveSpeechListeningConfig)
  {
    NSAppendPrintF_safe();
    id v29 = v3;

    id v3 = v29;
  }
  if (self->_smartRoutingMode)
  {
    NSAppendPrintF_safe();
    id v30 = v3;

    id v3 = v30;
  }
  if (self->_spatialAudioAllowed)
  {
    NSAppendPrintF_safe();
    id v31 = v3;

    id v3 = v31;
  }
  if (self->_spatialAudioMode != 255)
  {
    NSAppendPrintF_safe();
    id v32 = v3;

    id v3 = v32;
  }
  id v33 = v3;

  return v33;
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

- (char)allowsAutoRoute
{
  return self->_allowsAutoRoute;
}

- (void)setAllowsAutoRoute:(char)a3
{
  self->_allowsAutoRoute = a3;
}

- (char)audioRouteHidden
{
  return self->_audioRouteHidden;
}

- (void)setAudioRouteHidden:(char)a3
{
  self->_audioRouteHidden = a3;
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

- (unint64_t)deviceFlagsMask
{
  return self->_deviceFlagsMask;
}

- (void)setDeviceFlagsMask:(unint64_t)a3
{
  self->_uint64_t deviceFlagsMask = a3;
}

- (unint64_t)deviceFlagsValue
{
  return self->_deviceFlagsValue;
}

- (void)setDeviceFlagsValue:(unint64_t)a3
{
  self->_uint64_t deviceFlagsValue = a3;
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

- (unsigned)endCallConfig
{
  return self->_endCallConfig;
}

- (void)setEndCallConfig:(unsigned __int8)a3
{
  self->_endCallConfig = a3;
}

- (int)listeningMode
{
  return self->_listeningMode;
}

- (void)setListeningMode:(int)a3
{
  self->_int64_t listeningMode = a3;
}

- (unsigned)listeningModeConfigs
{
  return self->_listeningModeConfigs;
}

- (void)setListeningModeConfigs:(unsigned int)a3
{
  self->_uint64_t listeningModeConfigs = a3;
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
  self->_int64_t spatialAudioMode = a3;
}

- (void).cxx_destruct
{
}

@end