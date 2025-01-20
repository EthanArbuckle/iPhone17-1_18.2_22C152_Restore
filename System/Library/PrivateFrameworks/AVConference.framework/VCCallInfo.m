@interface VCCallInfo
+ (unsigned)getVCCurrentVersion;
- (BOOL)isHDVideoSupported;
- (BOOL)isIOS;
- (BOOL)isPreLionOS;
- (BOOL)isVideoQualityDegraded;
- (BOOL)isVideoQualityNearDegraded;
- (BOOL)requiresImplicitFeatureString;
- (BOOL)supportSDPCompression;
- (BOOL)supportsDynamicContentsRectWithAspectPreservation;
- (BOOL)supportsDynamicMaxBitrate;
- (BOOL)supportsSKEOptimization;
- (BOOL)supportsSpecialAACBundle;
- (BOOL)updateWithLastDecodedFrameTime:(double)a3 time:(double)a4;
- (BOOL)useNewPLCalc;
- (BOOL)usesInitialFECImplementation;
- (BOOL)videoIsPaused;
- (NSString)OSVersion;
- (NSString)deviceType;
- (NSString)frameworkVersion;
- (NSString)participantID;
- (NSString)sdpString;
- (SDPMini)sdp;
- (VCCallInfo)init;
- (VoiceIOFarEndVersionInfo)audioVersionInfo:(SEL)a3;
- (unsigned)auNumber;
- (unsigned)callID;
- (unsigned)cellBandwidth;
- (unsigned)maxBandwidth;
- (unsigned)u8Version;
- (unsigned)visibleRectCropping;
- (void)dealloc;
- (void)setAuNumber:(unsigned int)a3;
- (void)setCallID:(unsigned int)a3;
- (void)setCellBandwidth:(unsigned int)a3;
- (void)setDeviceType:(id)a3;
- (void)setFrameworkVersion:(id)a3;
- (void)setIsPreLionOS:(BOOL)a3;
- (void)setIsVideoQualityDegraded:(BOOL)a3;
- (void)setIsVideoQualityNearDegraded:(BOOL)a3;
- (void)setMaxBandwidth:(unsigned int)a3;
- (void)setOSVersion:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setSdp:(id)a3;
- (void)setSdpString:(id)a3;
- (void)setSupportsDynamicMaxBitrate:(BOOL)a3;
- (void)setSupportsSKEOptimization:(BOOL)a3;
- (void)setU8Version:(unsigned __int8)a3;
- (void)setUserAgent:(id)a3;
- (void)setVideoIsPaused:(BOOL)a3;
- (void)setVisibleRectCropping:(unsigned int)a3;
@end

@implementation VCCallInfo

- (VCCallInfo)init
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCCallInfo;
  v2 = [(VCCallInfo *)&v10 init];
  v3 = v2;
  if (v2)
  {
    v2->callID = -1;
    v2->participantID = 0;
    *(void *)&v2->auNumber = 0x25800000000;
    v2->cellBandwidth = 100;
    objc_msgSend(+[GKSConnectivitySettings getClientOption:](GKSConnectivitySettings, "getClientOption:", @"gk-p2p-video-degraded-threshold"), "doubleValue");
    if (v4 < 5.0) {
      double v4 = 5.0;
    }
    v3->double videoDegradedThreshold = v4;
    v3->double videoDegradedThreshold = VCDefaults_GetDoubleValueForKey(@"videoDegradedThreshold", v4);
    objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"gk-p2p-video-near-degraded-threshold", @"videoNearDegradedThreshold", &unk_1F3DC8BF0, 1), "doubleValue");
    v3->_videoNearDegradedThreshold = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double videoDegradedThreshold = v3->videoDegradedThreshold;
        *(_DWORD *)buf = 136315906;
        uint64_t v12 = v6;
        __int16 v13 = 2080;
        v14 = "-[VCCallInfo init]";
        __int16 v15 = 1024;
        int v16 = 44;
        __int16 v17 = 2048;
        double v18 = videoDegradedThreshold;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d double videoDegradedThreshold = %f", buf, 0x26u);
      }
    }
    v3->u8Version = 1;
    v3->useNewPLCalc = 0;
    v3->isPreLionOS = 0;
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  self->participantID = 0;
  v3.receiver = self;
  v3.super_class = (Class)VCCallInfo;
  [(VCCallInfo *)&v3 dealloc];
}

- (BOOL)requiresImplicitFeatureString
{
  return self->is4x;
}

- (void)setAuNumber:(unsigned int)a3
{
  if (a3)
  {
    self->auNumber = a3;
  }
  else
  {
    if (self->is4x) {
      unsigned int v3 = 1;
    }
    else {
      unsigned int v3 = 2;
    }
    self->auNumber = v3;
  }
}

- (BOOL)updateWithLastDecodedFrameTime:(double)a3 time:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    v9 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL videoIsPaused = self->videoIsPaused;
        int v14 = 136316674;
        uint64_t v15 = v7;
        __int16 v16 = 2080;
        __int16 v17 = "-[VCCallInfo updateWithLastDecodedFrameTime:time:]";
        __int16 v18 = 1024;
        int v19 = 87;
        __int16 v20 = 2048;
        double v21 = a4;
        __int16 v22 = 2048;
        double v23 = a3;
        __int16 v24 = 2048;
        double v25 = a4 - a3;
        __int16 v26 = 1024;
        BOOL v27 = videoIsPaused;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d microTime=%f lastDecodedFrameTime=%f currentFrameTimeDiff=%f videoIsPaused=%d", (uint8_t *)&v14, 0x40u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      BOOL v13 = self->videoIsPaused;
      int v14 = 136316674;
      uint64_t v15 = v7;
      __int16 v16 = 2080;
      __int16 v17 = "-[VCCallInfo updateWithLastDecodedFrameTime:time:]";
      __int16 v18 = 1024;
      int v19 = 87;
      __int16 v20 = 2048;
      double v21 = a4;
      __int16 v22 = 2048;
      double v23 = a3;
      __int16 v24 = 2048;
      double v25 = a4 - a3;
      __int16 v26 = 1024;
      BOOL v27 = v13;
      _os_log_debug_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEBUG, " [%s] %s:%d microTime=%f lastDecodedFrameTime=%f currentFrameTimeDiff=%f videoIsPaused=%d", (uint8_t *)&v14, 0x40u);
    }
  }
  if (self->videoIsPaused) {
    return 0;
  }
  if (a4 == 0.0 || (double firstDegradedMeasure = self->firstDegradedMeasure, firstDegradedMeasure == 0.0))
  {
    self->double firstDegradedMeasure = a4;
    double firstDegradedMeasure = a4;
  }
  if (a4 - firstDegradedMeasure >= 10.0)
  {
    if (a4 - a3 <= self->videoDegradedThreshold)
    {
      if (self->isVideoQualityDegraded)
      {
        self->isVideoQualityDegraded = 0;
        return 1;
      }
      else
      {
        BOOL result = 0;
        self->_isVideoQualityNearDegraded = a4 - a3 > self->_videoNearDegradedThreshold;
      }
    }
    else
    {
      if (self->isVideoQualityDegraded) {
        return 0;
      }
      BOOL result = 1;
      self->isVideoQualityDegraded = 1;
    }
  }
  else
  {
    BOOL result = self->isVideoQualityDegraded;
    self->isVideoQualityDegraded = 0;
  }
  return result;
}

- (BOOL)supportsDynamicContentsRectWithAspectPreservation
{
  return [(SDPMini *)self->sdp allowsContentsChangeWithAspectPreservation];
}

- (void)setVideoIsPaused:(BOOL)a3
{
  if (self->videoIsPaused != a3)
  {
    self->BOOL videoIsPaused = a3;
    self->double firstDegradedMeasure = 0.0;
  }
}

- (VoiceIOFarEndVersionInfo)audioVersionInfo:(SEL)a3
{
  retstr->farEndAUVersion = 0;
  *(_OWORD *)&retstr->farEndOSVersion[32] = 0u;
  *(_OWORD *)&retstr->farEndOSVersion[48] = 0u;
  *(_OWORD *)retstr->farEndOSVersion = 0u;
  *(_OWORD *)&retstr->farEndOSVersion[16] = 0u;
  *(_OWORD *)&retstr->farEndHwModel[32] = 0u;
  *(_OWORD *)&retstr->farEndHwModel[48] = 0u;
  *(_OWORD *)retstr->farEndHwModel = 0u;
  *(_OWORD *)&retstr->farEndHwModel[16] = 0u;
  if (a4) {
    BOOL result = (VoiceIOFarEndVersionInfo *)1;
  }
  else {
    BOOL result = (VoiceIOFarEndVersionInfo *)[(VCCallInfo *)self auNumber];
  }
  retstr->farEndAUVersion = result;
  return result;
}

- (void)setUserAgent:(id)a3
{
  self->isIOS = [a3 rangeOfString:@"/GK"] != 0x7FFFFFFFFFFFFFFFLL;
  if ([a3 rangeOfString:@"Viceroy 1.4.0"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [a3 rangeOfString:@"Viceroy 1.4.1"];
    self->is4x = v5 != 0x7FFFFFFFFFFFFFFFLL;
    BOOL v6 = v5 == 0x7FFFFFFFFFFFFFFFLL
      && [a3 rangeOfString:@"Viceroy 1.4.2"] == 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    BOOL v6 = 0;
    self->is4x = 1;
  }
  self->supportsSpecialAACBundle = v6;
  self->usesInitialFECImplementation = [a3 rangeOfString:@"Viceroy 1.4"] != 0x7FFFFFFFFFFFFFFFLL;
  if (self->isIOS)
  {
    self->visibleRectCropping = 1;
LABEL_12:
    v8 = @"Viceroy 1.6";
    goto LABEL_13;
  }
  if ([a3 rangeOfString:@"Viceroy 1.4"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [a3 rangeOfString:@"Viceroy 1.5"];
    unsigned int v7 = 1;
  }
  else
  {
    unsigned int v7 = 0;
  }
  self->visibleRectCropping = v7;
  if (self->isIOS) {
    goto LABEL_12;
  }
  v8 = @"Viceroy 1.7";
LABEL_13:
  self->useNewPLCalc = [a3 localizedCaseInsensitiveCompare:v8] != -1;
}

- (BOOL)supportSDPCompression
{
  return self->u8Version != 0;
}

+ (unsigned)getVCCurrentVersion
{
  return 1;
}

- (BOOL)isHDVideoSupported
{
  return !self->isPreLionOS;
}

- (unsigned)callID
{
  return self->callID;
}

- (void)setCallID:(unsigned int)a3
{
  self->callID = a3;
}

- (NSString)participantID
{
  return self->participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (unsigned)auNumber
{
  return self->auNumber;
}

- (unsigned)maxBandwidth
{
  return self->maxBandwidth;
}

- (void)setMaxBandwidth:(unsigned int)a3
{
  self->maxBandwidth = a3;
}

- (unsigned)cellBandwidth
{
  return self->cellBandwidth;
}

- (void)setCellBandwidth:(unsigned int)a3
{
  self->cellBandwidth = a3;
}

- (BOOL)isPreLionOS
{
  return self->isPreLionOS;
}

- (void)setIsPreLionOS:(BOOL)a3
{
  self->isPreLionOS = a3;
}

- (BOOL)isVideoQualityDegraded
{
  return self->isVideoQualityDegraded;
}

- (void)setIsVideoQualityDegraded:(BOOL)a3
{
  self->isVideoQualityDegraded = a3;
}

- (BOOL)videoIsPaused
{
  return self->videoIsPaused;
}

- (BOOL)isIOS
{
  return self->isIOS;
}

- (BOOL)usesInitialFECImplementation
{
  return self->usesInitialFECImplementation;
}

- (BOOL)supportsDynamicMaxBitrate
{
  return self->supportsDynamicMaxBitrate;
}

- (void)setSupportsDynamicMaxBitrate:(BOOL)a3
{
  self->supportsDynamicMaxBitrate = a3;
}

- (NSString)sdpString
{
  return self->sdpString;
}

- (void)setSdpString:(id)a3
{
}

- (SDPMini)sdp
{
  return self->sdp;
}

- (void)setSdp:(id)a3
{
}

- (unsigned)visibleRectCropping
{
  return self->visibleRectCropping;
}

- (void)setVisibleRectCropping:(unsigned int)a3
{
  self->visibleRectCropping = a3;
}

- (BOOL)useNewPLCalc
{
  return self->useNewPLCalc;
}

- (BOOL)supportsSpecialAACBundle
{
  return self->supportsSpecialAACBundle;
}

- (BOOL)supportsSKEOptimization
{
  return self->supportsSKEOptimization;
}

- (void)setSupportsSKEOptimization:(BOOL)a3
{
  self->supportsSKEOptimization = a3;
}

- (unsigned)u8Version
{
  return self->u8Version;
}

- (void)setU8Version:(unsigned __int8)a3
{
  self->u8Version = a3;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (NSString)OSVersion
{
  return self->_osVersion;
}

- (void)setOSVersion:(id)a3
{
}

- (NSString)frameworkVersion
{
  return self->_frameworkVersion;
}

- (void)setFrameworkVersion:(id)a3
{
}

- (BOOL)isVideoQualityNearDegraded
{
  return self->_isVideoQualityNearDegraded;
}

- (void)setIsVideoQualityNearDegraded:(BOOL)a3
{
  self->_isVideoQualityNearDegraded = a3;
}

@end