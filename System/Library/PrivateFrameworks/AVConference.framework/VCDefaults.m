@interface VCDefaults
+ (BOOL)BOOLeanValueForKey:(__CFString *)a3;
+ (BOOL)BOOLeanValueForKey:(__CFString *)a3 defaultValue:(BOOL)a4;
+ (BOOL)forceEnableScreenVirtualDisplayLabel;
+ (double)getDoubleValueForKey:(__CFString *)a3 defaultValue:(double)a4;
+ (id)copyStringValueForKey:(__CFString *)a3;
+ (id)screenVirtualDisplayLabelName;
+ (id)sharedInstance;
+ (int64_t)integerValueForKey:(__CFString *)a3;
+ (int64_t)integerValueForKey:(__CFString *)a3 defaultValue:(int64_t)a4;
- (BOOL)audioRecordingEnabled;
- (BOOL)bandwidthEstimationDumpEnabled;
- (BOOL)cameraVideoStablization;
- (BOOL)canDecodeHD;
- (BOOL)disableRed;
- (BOOL)disableVAD;
- (BOOL)dumpMediaBlob;
- (BOOL)enableAudioDumpParticipantLocal:(BOOL)a3;
- (BOOL)enableAudioDumpParticipantRemote:(BOOL)a3;
- (BOOL)enableBitstreamCapture;
- (BOOL)enableGFTStatsReceiveThread;
- (BOOL)enableGFTStatsReporting;
- (BOOL)enableHEIFAndHEVCForMoments;
- (BOOL)enablePacketLogging;
- (BOOL)enableRecvBitstreamDump;
- (BOOL)enableTxBitstreamDump;
- (BOOL)enableTxTimestampAlignmentLogs;
- (BOOL)enableVPBLogging;
- (BOOL)forceARCapture;
- (BOOL)forceAudioPriorityEnabled;
- (BOOL)forceDisableAudioPowerSpectrumRegister;
- (BOOL)forceDisableEffectsHealthCheck;
- (BOOL)forceDisableFaceZoom;
- (BOOL)forceDisableMediaEncryption;
- (BOOL)forceDisableMediaPriority;
- (BOOL)forceDisableMediaQueue;
- (BOOL)forceDisableMediaStalled;
- (BOOL)forceDisableMessageEncryption;
- (BOOL)forceDisableReporting;
- (BOOL)forceDisableSSRCCollisionDetection;
- (BOOL)forceDisableThermal;
- (BOOL)forceDisableVideoDegraded;
- (BOOL)forceDisableVideoRuleCell720;
- (BOOL)forceDisableVideoRuleWiFi1080;
- (BOOL)forceDynamicEffectsFramerate;
- (BOOL)forceEVSWideBand;
- (BOOL)forceEnableAudioHALPluginMockInput;
- (BOOL)forceEnablePearlCamera;
- (BOOL)forceFECRepairStream;
- (BOOL)forceHWI;
- (BOOL)forceIPv6;
- (BOOL)forceMirroredCapture;
- (BOOL)forceMultiwayHWI;
- (BOOL)forceMuteAtStart;
- (BOOL)forceOneToOneMode;
- (BOOL)forceScreenHWI;
- (BOOL)forceUseAvconferenced;
- (BOOL)forceUseFloat;
- (BOOL)forceUseInternalRTPThreadingWithDefaultValue:(BOOL)a3;
- (BOOL)forceVideoStreamDisableBitrateCap;
- (BOOL)forceVideoStreamLowLatency;
- (BOOL)forceWiFiAssist;
- (BOOL)forceWiFiAssistOutOfBudget;
- (BOOL)forceWifiAssist;
- (BOOL)forceWifiAssistOutOfBudget;
- (BOOL)isFECVersion2Enabled;
- (BOOL)isReceiverTestVerificationEnabled;
- (BOOL)isTransmitterTestVerificationEnabled;
- (BOOL)mediaQueueDumpEnabled;
- (BOOL)momentsUseBestVideoRule;
- (BOOL)momentsUserPreferenceEnabled;
- (BOOL)rateControlAllowBurstyLossRampDown;
- (BOOL)rateControlAllowVideoStop;
- (BOOL)rateControlDumpEnabled;
- (BOOL)rateControlLogEnabled;
- (BOOL)shouldDisplayVideoInfoLayer;
- (BOOL)shouldOverrideEffectsFramerate:(unsigned int *)a3;
- (BOOL)startAirPlayAudioHALPluginNullDevice;
- (BOOL)startAudioHALPluginNullDevice;
- (BOOL)supportsOneToOneMode;
- (BOOL)useCannedVideoPackets;
- (BOOL)useSBR;
- (BOOL)useVirtualCapture;
- (BOOL)videoStreamRateControlDumpEnabled;
- (NSString)virtualHardware;
- (VCDefaults)allocWithZone:(_NSZone *)a3;
- (VCDefaults)init;
- (double)remoteMediaStallTimeout;
- (float)audioVoiceDetectionSensitivity;
- (float)depthFrameRateMultiplier;
- (float)forceAudioPowerThreshold;
- (float)pauseHeartbeatInterval;
- (int)bundleAudio;
- (int)enableRxDecodeYUVDump;
- (int)enableTxSourceYuvDump;
- (int)enableiRATSuggestion;
- (int)encodingScore;
- (int)extraPayloads;
- (int)forceAudioBitrate;
- (int)forceAudioChannelCount;
- (int)forceAudioHardwareSampleRate;
- (int)forceAudioPacketsPerBundle;
- (int)forceAudioPayload;
- (int)forceAudioPowerTimeInterval;
- (int)forceBitrate;
- (int)forceCaptureHeight;
- (int)forceCaptureWidth;
- (int)forceEncodeFramerate;
- (int)forceEncodeHeight;
- (int)forceEncodeWidth;
- (int)forceFramerate;
- (int)forceKeyFrameInterval;
- (int)forceRecvVideoPayload;
- (int)forceRedMaxDelay;
- (int)forceRedNumPayloads;
- (int)forceVideoPayload;
- (int)forceVideoStreamFramerate;
- (int)forceVideoStreamKeyFrameInterval;
- (int)forceVideoStreamPayload;
- (int)forceVideoStreamResolution;
- (int)forceVideoStreamRxMaxBitrate;
- (int)forceVideoStreamRxMinBitrate;
- (int)forceVideoStreamTxMaxBitrate;
- (int)forceVideoStreamTxMinBitrate;
- (int)localRATTypeOverride;
- (int)localWRMLinkType;
- (int)max2GRate;
- (int)packetExpirationTime;
- (int)rateControlBasebandSlowDownFactor;
- (int)rateControlForceRxCap;
- (int)rateControlForceRxRate;
- (int)rateControlForceTxCap;
- (int)rateControlForceTxRate;
- (int)rateControlStatisticsQueueWaitTime;
- (int)rateControllerType;
- (int)redundancyControlForceVideoRedundancyPercentage;
- (int)videoStreamRateControlAlgorithm;
- (unint64_t)retainCount;
- (unsigned)aacBlockSize;
- (unsigned)audioPriorityDecayFast;
- (unsigned)audioPriorityDecaySlow;
- (unsigned)audioPriorityRampUpSpeed;
- (unsigned)cannedVideoPacketMode;
- (unsigned)forceAudioPriorityValue;
- (unsigned)forceThermalLevelFramerate:(unsigned int)a3;
- (unsigned)forceVisibilityIndex;
- (unsigned)maxActiveVideoDecoders;
- (unsigned)maxActiveVideoEncoders;
- (unsigned)minParticipantCountSendVoiceActiveOnly;
- (unsigned)multiwayAudioNetworkBitrateCapCellular;
- (unsigned)multiwayAudioNetworkBitrateCapWifi;
- (unsigned)prominenceActiveAccumulationThreshold;
- (unsigned)prominenceActiveProbabilityThreshold;
- (unsigned)prominenceInactiveAccumulationThreshold;
- (unsigned)prominenceInactiveProbabilityThreshold;
- (unsigned)silenceLevelMovingAveragePeriod;
- (void)seperateString:(id)a3;
@end

@implementation VCDefaults

+ (int64_t)integerValueForKey:(__CFString *)a3 defaultValue:(int64_t)a4
{
  return (int)VCDefaults_GetIntValueForKey(a3, a4);
}

+ (BOOL)BOOLeanValueForKey:(__CFString *)a3 defaultValue:(BOOL)a4
{
  BOOL v4 = a4;
  if (!VRTraceIsInternalOSInstalled()) {
    return v4;
  }

  return _VCDefaults_GetBoolValueForKey(a3, v4, 1);
}

+ (BOOL)BOOLeanValueForKey:(__CFString *)a3
{
  return +[VCDefaults BOOLeanValueForKey:a3 defaultValue:0];
}

+ (id)sharedInstance
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __28__VCDefaults_sharedInstance__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = a1;
  if (sharedInstance_onceToken_18 != -1) {
    dispatch_once(&sharedInstance_onceToken_18, v3);
  }
  return (id)_sharedInstance;
}

- (NSString)virtualHardware
{
  CFTypeID TypeID = CFStringGetTypeID();
  v3 = (void *)VCDefaults_CopyValueForKey(@"virtualHardware", TypeID);

  return (NSString *)v3;
}

- (unsigned)forceThermalLevelFramerate:(unsigned int)a3
{
  return +[VCDefaults integerValueForKey:@"forceThermalLevelFramerate" defaultValue:a3];
}

- (BOOL)forceMirroredCapture
{
  return +[VCDefaults BOOLeanValueForKey:@"forceMirroredCapture"];
}

- (BOOL)forceHWI
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v3 = (void *)CFPreferencesCopyAppValue(@"forceHWI", @"com.apple.VideoConference");
  if (v3)
  {
    BOOL v4 = (void *)MEMORY[0x1E4E589F0]();
    [(VCDefaults *)self seperateString:v3];

    *(int32x2_t *)&long long v5 = vmax_s32(vmin_s32(*(int32x2_t *)&self->_forceEncodeWidth, (int32x2_t)0x80000000800), (int32x2_t)0xF000000140);
    *((void *)&v5 + 1) = v5;
    *(_OWORD *)&self->_int forceCaptureWidth = v5;
    int forceFramerate = self->_forceFramerate;
    if (forceFramerate >= 60) {
      int forceFramerate = 60;
    }
    if (forceFramerate <= 5) {
      int forceFramerate = 5;
    }
    self->_int forceFramerate = forceFramerate;
    if ((int)*MEMORY[0x1E4F47A38] >= 6)
    {
      uint64_t v42 = 0;
      *(_OWORD *)v40 = 0u;
      long long v41 = 0u;
      if (self->_forceVideoPayload != 128) {
        __sprintf_chk(v40, 0, 0x28uLL, "payload: %d", self->_forceVideoPayload);
      }
      if (self->_forceRecvVideoPayload != 128) {
        __sprintf_chk(v40, 0, 0x28uLL, "receive payload: %d", self->_forceVideoPayload);
      }
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      v9 = (os_log_t *)MEMORY[0x1E4F47A50];
      if (ErrorLogLevelForModule >= 6)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          int forceCaptureWidth = self->_forceCaptureWidth;
          int forceCaptureHeight = self->_forceCaptureHeight;
          int v14 = self->_forceFramerate;
          *(_DWORD *)buf = 136316418;
          uint64_t v23 = v10;
          __int16 v24 = 2080;
          v25 = "-[VCDefaults forceHWI]";
          __int16 v26 = 1024;
          int v27 = 212;
          __int16 v28 = 1024;
          int v29 = forceCaptureWidth;
          __int16 v30 = 1024;
          int v31 = forceCaptureHeight;
          __int16 v32 = 1024;
          int v33 = v14;
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forced camera settings %dx%d@%dfps", buf, 0x2Eu);
        }
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          int forceEncodeWidth = self->_forceEncodeWidth;
          int forceEncodeHeight = self->_forceEncodeHeight;
          int v19 = self->_forceFramerate;
          int forceBitrate = self->_forceBitrate;
          int forceKeyFrameInterval = self->_forceKeyFrameInterval;
          *(_DWORD *)buf = 136317186;
          uint64_t v23 = v15;
          __int16 v24 = 2080;
          v25 = "-[VCDefaults forceHWI]";
          __int16 v26 = 1024;
          int v27 = 215;
          __int16 v28 = 1024;
          int v29 = forceEncodeWidth;
          __int16 v30 = 1024;
          int v31 = forceEncodeHeight;
          __int16 v32 = 1024;
          int v33 = v19;
          __int16 v34 = 1024;
          int v35 = forceBitrate;
          __int16 v36 = 1024;
          int v37 = forceKeyFrameInterval;
          __int16 v38 = 2080;
          v39 = v40;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forced encoder settings: %dx%d@%dfps, %d Kbps, %d IDR/sec, %s", buf, 0x44u);
        }
      }
    }
  }
  return v3 != 0;
}

- (BOOL)forceEnablePearlCamera
{
  return +[VCDefaults BOOLeanValueForKey:@"forceEnablePearlCamera"];
}

- (BOOL)forceDynamicEffectsFramerate
{
  return +[VCDefaults BOOLeanValueForKey:@"forceDynamicEffectsFrameRate"];
}

+ (id)copyStringValueForKey:(__CFString *)a3
{
  CFTypeID TypeID = CFStringGetTypeID();

  return (id)VCDefaults_CopyValueForKey(a3, TypeID);
}

- (BOOL)cameraVideoStablization
{
  return +[VCDefaults BOOLeanValueForKey:@"CameraVideoStabilization" defaultValue:0];
}

- (BOOL)useVirtualCapture
{
  int IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
  {
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:@"useVirtualCapture" defaultValue:0];
  }
  return IsInternalOSInstalled;
}

- (float)depthFrameRateMultiplier
{
  +[VCDefaults getDoubleValueForKey:@"depthFrameRateMultiplier" defaultValue:0.25];
  return v2;
}

+ (double)getDoubleValueForKey:(__CFString *)a3 defaultValue:(double)a4
{
  return VCDefaults_GetDoubleValueForKey(a3, a4);
}

Class *__28__VCDefaults_sharedInstance__block_invoke(Class *result)
{
  if (!_sharedInstance)
  {
    result = (Class *)objc_alloc_init(result[4]);
    _sharedInstance = (uint64_t)result;
    if (result)
    {
      CFPreferencesAppSynchronize(@"com.apple.VideoConference");
      CFStringRef v1 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
      CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
      return (Class *)CFPreferencesSynchronize(@"com.apple.VideoConference", v1, v2);
    }
  }
  return result;
}

+ (int64_t)integerValueForKey:(__CFString *)a3
{
  return +[VCDefaults integerValueForKey:a3 defaultValue:0];
}

- (VCDefaults)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCDefaults;
  return [(VCDefaults *)&v3 init];
}

- (VCDefaults)allocWithZone:(_NSZone *)a3
{
  return (VCDefaults *)_sharedInstance;
}

- (unint64_t)retainCount
{
  return -1;
}

- (BOOL)forceScreenHWI
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)CFPreferencesCopyAppValue(@"forceScreenHWI", @"com.apple.VideoConference");
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4E589F0]();
    long long v5 = (void *)[v3 componentsSeparatedByString:@":"];
    if ([v5 count] == 3)
    {
      self->_int forceEncodeWidth = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "intValue");
      self->_int forceEncodeHeight = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "intValue");
      self->_forceEncodeFramerate = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 2), "intValue");
    }

    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int forceEncodeWidth = self->_forceEncodeWidth;
        int forceEncodeHeight = self->_forceEncodeHeight;
        int forceFramerate = self->_forceFramerate;
        int v12 = 136316418;
        uint64_t v13 = v6;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCDefaults forceScreenHWI]";
        __int16 v16 = 1024;
        int v17 = 170;
        __int16 v18 = 1024;
        int v19 = forceEncodeWidth;
        __int16 v20 = 1024;
        int v21 = forceEncodeHeight;
        __int16 v22 = 1024;
        int v23 = forceFramerate;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Forced screen capture settings: %dx%d@%dfps", (uint8_t *)&v12, 0x2Eu);
      }
    }
  }
  return v3 != 0;
}

- (BOOL)forceMultiwayHWI
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)CFPreferencesCopyAppValue(@"forceMultiwayHWI", @"com.apple.VideoConference");
  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4E589F0]();
    [(VCDefaults *)self seperateString:v3];

    if ((int)*MEMORY[0x1E4F47A38] >= 6)
    {
      uint64_t v33 = 0;
      *(_OWORD *)int v31 = 0u;
      long long v32 = 0u;
      if (self->_forceVideoPayload != 128) {
        __sprintf_chk(v31, 0, 0x28uLL, "payload: %d", self->_forceVideoPayload);
      }
      if (self->_forceRecvVideoPayload != 128) {
        __sprintf_chk(v31, 0, 0x28uLL, "receive payload: %d", self->_forceVideoPayload);
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int forceEncodeWidth = self->_forceEncodeWidth;
          int forceEncodeHeight = self->_forceEncodeHeight;
          int forceFramerate = self->_forceFramerate;
          int forceBitrate = self->_forceBitrate;
          int forceKeyFrameInterval = self->_forceKeyFrameInterval;
          *(_DWORD *)buf = 136317186;
          uint64_t v14 = v6;
          __int16 v15 = 2080;
          __int16 v16 = "-[VCDefaults forceMultiwayHWI]";
          __int16 v17 = 1024;
          int v18 = 252;
          __int16 v19 = 1024;
          int v20 = forceEncodeWidth;
          __int16 v21 = 1024;
          int v22 = forceEncodeHeight;
          __int16 v23 = 1024;
          int v24 = forceFramerate;
          __int16 v25 = 1024;
          int v26 = forceBitrate;
          __int16 v27 = 1024;
          int v28 = forceKeyFrameInterval;
          __int16 v29 = 2080;
          __int16 v30 = v31;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d Forced multiway encoder settings: %dx%d@%dfps, %d Kbps, %d IDR/sec, %s", buf, 0x44u);
        }
      }
    }
  }
  return v3 != 0;
}

- (BOOL)forceDisableThermal
{
  return +[VCDefaults BOOLeanValueForKey:@"forceDisableThermal" defaultValue:0];
}

- (void)seperateString:(id)a3
{
  uint64_t v4 = (void *)[a3 componentsSeparatedByString:@":"];
  if (v4)
  {
    long long v5 = v4;
    if ([v4 count]) {
      self->_int forceEncodeWidth = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 0), "intValue");
    }
    if ((unint64_t)[v5 count] >= 2) {
      self->_int forceEncodeHeight = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 1), "intValue");
    }
    if ((unint64_t)[v5 count] >= 3) {
      self->_int forceBitrate = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 2), "intValue");
    }
    if ((unint64_t)[v5 count] >= 4) {
      self->_int forceFramerate = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 3), "intValue");
    }
    if ((unint64_t)[v5 count] < 5) {
      int v6 = 128;
    }
    else {
      int v6 = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 4), "intValue");
    }
    self->_forceVideoPayload = v6;
    if ((unint64_t)[v5 count] < 6) {
      int v7 = 128;
    }
    else {
      int v7 = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 5), "intValue");
    }
    self->_forceRecvVideoPayload = v7;
    if ((unint64_t)[v5 count] < 7) {
      int v8 = 1;
    }
    else {
      int v8 = objc_msgSend((id)objc_msgSend(v5, "objectAtIndexedSubscript:", 6), "intValue");
    }
    self->_int forceKeyFrameInterval = v8;
  }
}

- (int)forceCaptureWidth
{
  return self->_forceCaptureWidth;
}

- (int)forceCaptureHeight
{
  return self->_forceCaptureHeight;
}

- (int)forceEncodeWidth
{
  return self->_forceEncodeWidth;
}

- (int)forceEncodeHeight
{
  return self->_forceEncodeHeight;
}

- (int)forceEncodeFramerate
{
  return self->_forceEncodeFramerate;
}

- (int)forceFramerate
{
  return self->_forceFramerate;
}

- (int)forceBitrate
{
  return self->_forceBitrate;
}

- (int)forceVideoPayload
{
  return self->_forceVideoPayload;
}

- (int)forceRecvVideoPayload
{
  return self->_forceRecvVideoPayload;
}

- (int)forceKeyFrameInterval
{
  return self->_forceKeyFrameInterval;
}

- (BOOL)forceARCapture
{
  int IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
  {
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:@"ARCaptureEnabled"];
  }
  return IsInternalOSInstalled;
}

- (BOOL)forceDisableVideoRuleWiFi1080
{
  return +[VCDefaults BOOLeanValueForKey:@"forceDisableVideoRuleWiFi1080"];
}

- (BOOL)forceDisableVideoRuleCell720
{
  return +[VCDefaults BOOLeanValueForKey:@"forceDisableVideoRuleCell720"];
}

- (BOOL)enableBitstreamCapture
{
  int IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
  {
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:@"enableBitstreamCapture"];
  }
  return IsInternalOSInstalled;
}

- (int)enableRxDecodeYUVDump
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int result = VRTraceIsInternalOSInstalled();
  if (!result) {
    return result;
  }
  Boolean keyExistsAndHasValidFormat = -86;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"enableRxDecodeYUVDump", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 0;
  }
  unint64_t v4 = AppIntegerValue;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 > 2)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      int result = 0;
      if (!v10) {
        return result;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCDefaults enableRxDecodeYUVDump]";
      __int16 v16 = 1024;
      int v17 = 385;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Found enableRxDecodeYUVDump but the value[%d] is invalid (should be 1 or 2)", buf, 0x22u);
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCDefaults enableRxDecodeYUVDump]";
      __int16 v16 = 1024;
      int v17 = 382;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Found enableRxDecodeYUVDump set to %d", buf, 0x22u);
    }
  }
  return v4;
}

- (BOOL)enableVPBLogging
{
  return +[VCDefaults BOOLeanValueForKey:@"enableVPBLogging"];
}

- (BOOL)enableRecvBitstreamDump
{
  return +[VCDefaults BOOLeanValueForKey:@"enableRecvBitstreamDump"];
}

- (int)enableTxSourceYuvDump
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int result = VRTraceIsInternalOSInstalled();
  if (!result) {
    return result;
  }
  Boolean keyExistsAndHasValidFormat = -86;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"enableTxSourceYuvDump", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 0;
  }
  unint64_t v4 = AppIntegerValue;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 > 2)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      int result = 0;
      if (!v10) {
        return result;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCDefaults enableTxSourceYuvDump]";
      __int16 v16 = 1024;
      int v17 = 412;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Found enableTxSourceYuvDump but the value[%d] is invalid (should be 1 or 2)", buf, 0x22u);
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v6;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCDefaults enableTxSourceYuvDump]";
      __int16 v16 = 1024;
      int v17 = 409;
      __int16 v18 = 1024;
      int v19 = v4;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Found enableTxSourceYuvDump set to %d", buf, 0x22u);
    }
  }
  return v4;
}

- (BOOL)enableTxBitstreamDump
{
  int IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
  {
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:@"enableTxBitstreamDump"];
  }
  return IsInternalOSInstalled;
}

- (BOOL)enablePacketLogging
{
  return +[VCDefaults BOOLeanValueForKey:@"enablePacketLogging"];
}

- (int)extraPayloads
{
  return VCDefaults_GetIntValueForKey(@"extraPL", 0) & 3;
}

- (BOOL)enableTxTimestampAlignmentLogs
{
  int IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
  {
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:@"enableTxTimestampAlignmentLogs"];
  }
  return IsInternalOSInstalled;
}

- (BOOL)isTransmitterTestVerificationEnabled
{
  return +[VCDefaults BOOLeanValueForKey:@"enableTransmitterTestVerification" defaultValue:0];
}

- (BOOL)isReceiverTestVerificationEnabled
{
  return +[VCDefaults BOOLeanValueForKey:@"enableReceiverTestVerification" defaultValue:0];
}

- (int)encodingScore
{
  return VCDefaults_GetIntValueForKey(@"encodingScore", 0);
}

- (BOOL)canDecodeHD
{
  return +[VCDefaults BOOLeanValueForKey:@"canDecodeHD"];
}

- (BOOL)disableVAD
{
  return +[VCDefaults BOOLeanValueForKey:@"disableVAD"];
}

- (int)bundleAudio
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = -86;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"bundleAudio", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 0;
  }
  int v3 = AppIntegerValue;
  unint64_t v4 = AppIntegerValue - 1;
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v4 > 9)
  {
    if (ErrorLogLevelForModule >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      BOOL v10 = *MEMORY[0x1E4F47A50];
      BOOL v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      int result = 0;
      if (!v11) {
        return result;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCDefaults bundleAudio]";
      __int16 v17 = 1024;
      int v18 = 477;
      __int16 v19 = 1024;
      int v20 = v3;
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Found bundleAudio but the value[%d] is invalid (should be 1-10)", buf, 0x22u);
    }
    return 0;
  }
  if (ErrorLogLevelForModule >= 6)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v14 = v6;
      __int16 v15 = 2080;
      __int16 v16 = "-[VCDefaults bundleAudio]";
      __int16 v17 = 1024;
      int v18 = 474;
      __int16 v19 = 1024;
      int v20 = v3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: Found bundleAudio. Bundling %d audio packets", buf, 0x22u);
    }
  }
  return v3;
}

- (BOOL)audioRecordingEnabled
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (audioRecordingEnabled_hasChecked == 1) {
    return audioRecordingEnabled_isAudioRecordingEnabled != 0;
  }
  Boolean keyExistsAndHasValidFormat = -86;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"AllowAudioRecording", @"com.apple.facetime", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    if ((VCDefaults *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v6;
      __int16 v16 = 2080;
      __int16 v17 = "-[VCDefaults audioRecordingEnabled]";
      __int16 v18 = 1024;
      int v19 = 494;
      __int16 v20 = 1024;
      *(_DWORD *)uint64_t v21 = AppBooleanValue;
      *(_WORD *)&v21[4] = 1024;
      *(_DWORD *)&v21[6] = keyExistsAndHasValidFormat;
      uint64_t v8 = " [%s] %s:%d allowAudioRecording: %d keyExists: %d";
      uint64_t v9 = v7;
      uint32_t v10 = 40;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v5 = (__CFString *)[(VCDefaults *)self performSelector:sel_logPrefix];
      }
      else {
        long long v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_15;
      }
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      *(_DWORD *)buf = 136316674;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      __int16 v17 = "-[VCDefaults audioRecordingEnabled]";
      __int16 v18 = 1024;
      int v19 = 494;
      __int16 v20 = 2112;
      *(void *)uint64_t v21 = v5;
      *(_WORD *)&v21[8] = 2048;
      int v22 = self;
      __int16 v23 = 1024;
      int v24 = AppBooleanValue;
      __int16 v25 = 1024;
      int v26 = keyExistsAndHasValidFormat;
      uint64_t v8 = " [%s] %s:%d %@(%p) allowAudioRecording: %d keyExists: %d";
      uint64_t v9 = v12;
      uint32_t v10 = 60;
    }
    _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
LABEL_15:
    CFPreferencesSetAppValue(@"AllowAudioRecording", 0, @"com.apple.facetime");
    CFPreferencesAppSynchronize(@"com.apple.facetime");
  }
  BOOL result = 1;
  if (!AppBooleanValue) {
    BOOL result = VRTraceIsInternalOSInstalled();
  }
  audioRecordingEnabled_isAudioRecordingEnabled = result;
  audioRecordingEnabled_hasChecked = 1;
  return result;
}

- (int)forceAudioPayload
{
  return VCDefaults_GetIntValueForKey(@"forceAudioPayload", 128);
}

- (int)forceAudioBitrate
{
  return VCDefaults_GetIntValueForKey(@"forceAudioBitrate", 0);
}

- (int)forceAudioPacketsPerBundle
{
  return VCDefaults_GetIntValueForKey(@"forceAudioPacketsPerBundle", 0);
}

- (int)forceAudioHardwareSampleRate
{
  return VCDefaults_GetIntValueForKey(@"forceHWAudioSampleRate", 0);
}

- (float)forceAudioPowerThreshold
{
  return VCDefaults_GetDoubleValueForKey(@"audioPowerThreshold", -120.0);
}

- (int)forceAudioPowerTimeInterval
{
  return VCDefaults_GetIntValueForKey(@"audioPowerTimeInterval", 0);
}

- (BOOL)forceUseFloat
{
  return +[VCDefaults BOOLeanValueForKey:@"forceUseFloat"];
}

- (int)forceAudioChannelCount
{
  return VCDefaults_GetIntValueForKey(@"audioChannelCount", 0);
}

- (BOOL)forceDisableAudioPowerSpectrumRegister
{
  return +[VCDefaults BOOLeanValueForKey:@"disableAudioPowerSpectrumRegister"];
}

- (BOOL)disableRed
{
  return +[VCDefaults BOOLeanValueForKey:@"disableRed"];
}

- (int)forceRedNumPayloads
{
  return VCDefaults_GetIntValueForKey(@"forceRedNumPayloads", 0);
}

- (int)forceRedMaxDelay
{
  return VCDefaults_GetIntValueForKey(@"forceRedMaxDelay", 0);
}

- (BOOL)useSBR
{
  return +[VCDefaults BOOLeanValueForKey:@"useSBR" defaultValue:1];
}

- (unsigned)aacBlockSize
{
  return VCDefaults_GetIntValueForKey(@"forceAACELDFrames", 480);
}

- (int)forceVideoStreamResolution
{
  return VCDefaults_GetIntValueForKey(@"forceVideoStreamResolution", 0xFFFFFFFFLL);
}

- (int)forceVideoStreamTxMaxBitrate
{
  return VCDefaults_GetIntValueForKey(@"forceVideoStreamTxMaxBitrate", 0);
}

- (int)forceVideoStreamTxMinBitrate
{
  return VCDefaults_GetIntValueForKey(@"forceVideoStreamTxMinBitrate", 0);
}

- (int)forceVideoStreamFramerate
{
  return VCDefaults_GetIntValueForKey(@"forceVideoStreamFramerate", 0);
}

- (int)forceVideoStreamKeyFrameInterval
{
  return VCDefaults_GetIntValueForKey(@"forceVideoStreamKeyFrameInterval", 0);
}

- (int)forceVideoStreamRxMaxBitrate
{
  return VCDefaults_GetIntValueForKey(@"forceVideoStreamRxMaxBitrate", 0);
}

- (int)forceVideoStreamRxMinBitrate
{
  return VCDefaults_GetIntValueForKey(@"forceVideoStreamRxMinBitrate", 0);
}

- (BOOL)forceVideoStreamDisableBitrateCap
{
  return +[VCDefaults BOOLeanValueForKey:@"forceVideoStreamDisableBitrateCap"];
}

- (int)forceVideoStreamPayload
{
  return +[VCDefaults integerValueForKey:@"forceVideoStreamPayload"];
}

- (BOOL)forceVideoStreamLowLatency
{
  return +[VCDefaults BOOLeanValueForKey:@"forceVideoStreamLowLatency"];
}

- (BOOL)enableHEIFAndHEVCForMoments
{
  return +[VCDefaults BOOLeanValueForKey:@"enableHEIFAndHEVCForMoments" defaultValue:1];
}

- (BOOL)videoStreamRateControlDumpEnabled
{
  return +[VCDefaults BOOLeanValueForKey:@"videoStreamRateControlDumpEnabled" defaultValue:1];
}

- (int)videoStreamRateControlAlgorithm
{
  return VCDefaults_GetIntValueForKey(@"videoStreamRateControlAlgorithm", 0xFFFFFFFFLL);
}

- (BOOL)forceDisableMediaQueue
{
  return +[VCDefaults BOOLeanValueForKey:@"forceDisableMediaQueue"];
}

- (BOOL)mediaQueueDumpEnabled
{
  uint64_t IsInternalOSInstalled = VRTraceIsInternalOSInstalled();

  return +[VCDefaults BOOLeanValueForKey:@"enableMediaQueueDump" defaultValue:IsInternalOSInstalled];
}

- (int)rateControllerType
{
  return +[VCDefaults integerValueForKey:@"rateControllerType" defaultValue:0];
}

- (int)rateControlStatisticsQueueWaitTime
{
  return +[VCDefaults integerValueForKey:@"rateControlStatisticsQueueWaitTime" defaultValue:0];
}

- (BOOL)bandwidthEstimationDumpEnabled
{
  return +[VCDefaults BOOLeanValueForKey:@"enableBWEDump" defaultValue:0];
}

- (BOOL)rateControlDumpEnabled
{
  if (VRTraceIsInternalOSInstalled()) {
    uint64_t IsSeedOSInstalled = 1;
  }
  else {
    uint64_t IsSeedOSInstalled = VRTraceIsSeedOSInstalled();
  }

  return +[VCDefaults BOOLeanValueForKey:@"enableTFRCDump" defaultValue:IsSeedOSInstalled];
}

- (BOOL)rateControlLogEnabled
{
  return +[VCDefaults BOOLeanValueForKey:@"enableTFRCLog"];
}

- (BOOL)rateControlAllowVideoStop
{
  return +[VCDefaults BOOLeanValueForKey:@"rateControlAllowVideoStop" defaultValue:0];
}

- (BOOL)rateControlAllowBurstyLossRampDown
{
  return +[VCDefaults BOOLeanValueForKey:@"rateControlAllowBurstyLossRampDown" defaultValue:1];
}

- (int)rateControlForceTxCap
{
  uint64_t ForcedCapBitrate = VCTestMonitorManager_GetForcedCapBitrate();

  return VCDefaults_GetIntValueForKey(@"forcedTxCap", ForcedCapBitrate);
}

- (int)rateControlForceRxCap
{
  return +[VCDefaults integerValueForKey:@"forcedRxCap" defaultValue:(int)VCTestMonitorManager_GetForcedTargetBitrate()];
}

- (int)rateControlForceTxRate
{
  uint64_t ForcedTargetBitrate = VCTestMonitorManager_GetForcedTargetBitrate();

  return VCDefaults_GetIntValueForKey(@"forcedTxRate", ForcedTargetBitrate);
}

- (int)rateControlForceRxRate
{
  uint64_t ForcedTargetBitrate = VCTestMonitorManager_GetForcedTargetBitrate();

  return VCDefaults_GetIntValueForKey(@"forcedRxRate", ForcedTargetBitrate);
}

- (int)rateControlBasebandSlowDownFactor
{
  return VCDefaults_GetIntValueForKey(@"basebandSlowDownFactor", 3);
}

- (int)packetExpirationTime
{
  return +[VCDefaults integerValueForKey:@"forcePacketExpirationTime" defaultValue:-1];
}

- (int)redundancyControlForceVideoRedundancyPercentage
{
  return +[VCDefaults integerValueForKey:@"forceVideoRedundancyPercentage" defaultValue:-1];
}

- (int)max2GRate
{
  int IntValueForKey = VCDefaults_GetIntValueForKey(@"max2GRate", 0xFFFFFFFFLL);
  if (IntValueForKey >= 229 || IntValueForKey == 0) {
    int v4 = 100;
  }
  else {
    int v4 = IntValueForKey;
  }
  if (IntValueForKey >= 0) {
    return v4;
  }
  else {
    return 0;
  }
}

- (BOOL)forceIPv6
{
  return +[VCDefaults BOOLeanValueForKey:@"forceIPv6"];
}

- (int)enableiRATSuggestion
{
  return VCDefaults_GetIntValueForKey(@"enableiRATSuggestion", 0xFFFFFFFFLL);
}

- (int)localWRMLinkType
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = -86;
  unint64_t AppIntegerValue = CFPreferencesGetAppIntegerValue(@"localWRMLinkType", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (AppIntegerValue >= 2 || keyExistsAndHasValidFormat == 0) {
    LODWORD(AppIntegerValue) = -1;
  }
  return AppIntegerValue;
}

- (int)localRATTypeOverride
{
  return VCDefaults_GetIntValueForKey(@"localRATTypeOverride", 0xFFFFFFFFLL);
}

- (BOOL)enableGFTStatsReporting
{
  return +[VCDefaults BOOLeanValueForKey:@"enableGFTStatsReporting" defaultValue:0];
}

- (BOOL)enableGFTStatsReceiveThread
{
  return +[VCDefaults BOOLeanValueForKey:@"enableGFTStatsReceiveThread" defaultValue:0];
}

- (float)pauseHeartbeatInterval
{
  return (float)(int)VCDefaults_GetIntValueForKey(@"pauseHeartbeatInterval", 2);
}

- (BOOL)shouldDisplayVideoInfoLayer
{
  int IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
  {
    LOBYTE(IsInternalOSInstalled) = _VCDefaults_GetBoolValueForKey(@"shouldDisplayVideoInfoLayer", 0, 1);
  }
  return IsInternalOSInstalled;
}

- (BOOL)forceWifiAssist
{
  return +[VCDefaults BOOLeanValueForKey:@"forceWiFiAssist"];
}

- (BOOL)forceWifiAssistOutOfBudget
{
  return +[VCDefaults BOOLeanValueForKey:@"kVCDefaultForceWiFiAssistOutOfBudget"];
}

- (BOOL)momentsUserPreferenceEnabled
{
  return +[VCDefaults BOOLeanValueForKey:@"FaceTimePhotosEnabled" defaultValue:1];
}

- (BOOL)momentsUseBestVideoRule
{
  return +[VCDefaults BOOLeanValueForKey:@"FaceTimePhotosUseBestVideoRule" defaultValue:1];
}

- (BOOL)dumpMediaBlob
{
  return +[VCDefaults BOOLeanValueForKey:@"dumpMediaBlob"];
}

- (BOOL)forceOneToOneMode
{
  return +[VCDefaults BOOLeanValueForKey:@"ForceOneToOneMode" defaultValue:0];
}

- (BOOL)supportsOneToOneMode
{
  if (+[VCDefaults BOOLeanValueForKey:@"SupportsOneToOneMode" defaultValue:0])
  {
    return 1;
  }

  return _os_feature_enabled_impl();
}

- (unsigned)maxActiveVideoEncoders
{
  return VCDefaults_GetIntValueForKey(@"MaxActiveVideoEncoders", 0xFFFFFFFFLL);
}

- (unsigned)maxActiveVideoDecoders
{
  return VCDefaults_GetIntValueForKey(@"MaxActiveVideoDecoders", 0xFFFFFFFFLL);
}

- (BOOL)forceEVSWideBand
{
  return +[VCDefaults BOOLeanValueForKey:@"ForceEVSWideBand"];
}

- (BOOL)forceMuteAtStart
{
  return +[VCDefaults BOOLeanValueForKey:@"forceMuteAtStart"];
}

- (unsigned)minParticipantCountSendVoiceActiveOnly
{
  return VCDefaults_GetIntValueForKey(@"minParticipantCountSendVoiceActiveOnly", 3);
}

- (unsigned)forceVisibilityIndex
{
  return +[VCDefaults integerValueForKey:@"forceVisibilityIndex" defaultValue:0xFFFFFFFFLL];
}

- (BOOL)forceFECRepairStream
{
  return +[VCDefaults BOOLeanValueForKey:@"forceFECRepairStream"];
}

- (BOOL)enableAudioDumpParticipantRemote:(BOOL)a3
{
  return +[VCDefaults BOOLeanValueForKey:@"enableAudioDumpParticipantRemote" defaultValue:a3];
}

- (BOOL)enableAudioDumpParticipantLocal:(BOOL)a3
{
  return +[VCDefaults BOOLeanValueForKey:@"enableAudioDumpParticipantLocal" defaultValue:a3];
}

- (BOOL)forceDisableMediaPriority
{
  return +[VCDefaults BOOLeanValueForKey:@"forceDisableMediaPriority"];
}

- (unsigned)audioPriorityDecaySlow
{
  return VCDefaults_GetIntValueForKey(@"audioPriorityDecaySlow", 20);
}

- (unsigned)audioPriorityDecayFast
{
  return VCDefaults_GetIntValueForKey(@"audioPriorityDecayFast", 50);
}

- (unsigned)audioPriorityRampUpSpeed
{
  return VCDefaults_GetIntValueForKey(@"audioPriorityRampUp", 50);
}

- (float)audioVoiceDetectionSensitivity
{
  return (float)(int)VCDefaults_GetIntValueForKey(@"audioVoiceDetectionSensitivity", 6);
}

- (unsigned)silenceLevelMovingAveragePeriod
{
  return VCDefaults_GetIntValueForKey(@"silenceLevelMovingAveragePeriod", 10);
}

- (unsigned)forceAudioPriorityValue
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = -86;
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"forceAudioPriorityValue", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    if ((unint64_t)(AppIntegerValue - 256) >= 0xFFFFFFFFFFFFFF01) {
      int v3 = AppIntegerValue;
    }
    else {
      int v3 = 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      long long v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v9 = v4;
        __int16 v10 = 2080;
        uint64_t v11 = "-[VCDefaults forceAudioPriorityValue]";
        __int16 v12 = 1024;
        int v13 = 858;
        __int16 v14 = 2112;
        uint64_t v15 = @"forceAudioPriorityValue";
        __int16 v16 = 1024;
        int v17 = v3;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: %@=%d", buf, 0x2Cu);
      }
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)forceAudioPriorityEnabled
{
  return +[VCDefaults BOOLeanValueForKey:@"forceAudioPriorityEnabled"];
}

- (unsigned)multiwayAudioNetworkBitrateCapWifi
{
  return VCDefaults_GetIntValueForKey(@"multiwayAudioNetworkBitrateCapWifi", 0xFFFFFFFFLL);
}

- (unsigned)multiwayAudioNetworkBitrateCapCellular
{
  return VCDefaults_GetIntValueForKey(@"multiwayAudioNetworkBitrateCapCellular", 0xFFFFFFFFLL);
}

- (BOOL)forceDisableFaceZoom
{
  return +[VCDefaults BOOLeanValueForKey:@"forceDisableFaceZoom" defaultValue:1];
}

- (BOOL)forceDisableEffectsHealthCheck
{
  return +[VCDefaults BOOLeanValueForKey:@"forceDisableEffectsHealthCheck"];
}

- (BOOL)forceDisableVideoDegraded
{
  return +[VCDefaults BOOLeanValueForKey:@"forceDisableVideoDegraded"];
}

- (BOOL)forceDisableMediaStalled
{
  return +[VCDefaults BOOLeanValueForKey:@"forceDisableMediaStalled"];
}

- (BOOL)shouldOverrideEffectsFramerate:(unsigned int *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = -86;
  unsigned int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"effectsFrameRate", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  int v5 = keyExistsAndHasValidFormat;
  if (a3 && keyExistsAndHasValidFormat)
  {
    unsigned int v6 = AppIntegerValue;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v12 = v7;
        __int16 v13 = 2080;
        __int16 v14 = "-[VCDefaults shouldOverrideEffectsFramerate:]";
        __int16 v15 = 1024;
        int v16 = 904;
        __int16 v17 = 2112;
        uint64_t v18 = @"effectsFrameRate";
        __int16 v19 = 1024;
        unsigned int v20 = v6;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: %@=%d", buf, 0x2Cu);
      }
    }
    *a3 = v6;
    int v5 = keyExistsAndHasValidFormat;
  }
  return v5 != 0;
}

- (BOOL)forceDisableMediaEncryption
{
  int IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
  {
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:@"forceDisableMediaEncryption"];
  }
  return IsInternalOSInstalled;
}

- (BOOL)forceDisableMessageEncryption
{
  int IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
  {
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:@"forceDisableMessageEncryption"];
  }
  return IsInternalOSInstalled;
}

- (BOOL)forceDisableReporting
{
  return +[VCDefaults BOOLeanValueForKey:@"forceDisableReporting"];
}

- (BOOL)forceUseAvconferenced
{
  return +[VCDefaults BOOLeanValueForKey:@"useAvconferenced"];
}

- (BOOL)forceDisableSSRCCollisionDetection
{
  int IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  if (IsInternalOSInstalled)
  {
    LOBYTE(IsInternalOSInstalled) = +[VCDefaults BOOLeanValueForKey:@"forceDisableSSRCCollisionDetection"];
  }
  return IsInternalOSInstalled;
}

- (unsigned)cannedVideoPacketMode
{
  return +[VCDefaults integerValueForKey:@"cannedVideoPacketMode" defaultValue:0];
}

- (BOOL)useCannedVideoPackets
{
  return [(VCDefaults *)self cannedVideoPacketMode] != 0;
}

- (unsigned)prominenceActiveProbabilityThreshold
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = -86;
  unsigned int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"prominenceActiveProbabilityThreshold", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 127;
  }
  unsigned int v3 = AppBooleanValue;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    int v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v9 = v4;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCDefaults prominenceActiveProbabilityThreshold]";
      __int16 v12 = 1024;
      int v13 = 972;
      __int16 v14 = 2112;
      __int16 v15 = @"prominenceActiveProbabilityThreshold";
      __int16 v16 = 1024;
      unsigned int v17 = v3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VideoConferenceDefaults: %@=%u", buf, 0x2Cu);
    }
  }
  return v3;
}

- (unsigned)prominenceActiveAccumulationThreshold
{
  return VCDefaults_GetIntValueForKey(@"prominenceActiveAccumulationThreshold", 15);
}

- (unsigned)prominenceInactiveProbabilityThreshold
{
  return VCDefaults_GetIntValueForKey(@"prominenceInactiveProbabilityThreshold", 128);
}

- (unsigned)prominenceInactiveAccumulationThreshold
{
  return VCDefaults_GetIntValueForKey(@"prominenceInactiveAccumulationThreshold", 50);
}

- (double)remoteMediaStallTimeout
{
  return VCDefaults_GetDoubleValueForKey(@"remoteMediaStallTimeout", 5.0);
}

- (BOOL)forceUseInternalRTPThreadingWithDefaultValue:(BOOL)a3
{
  return +[VCDefaults BOOLeanValueForKey:@"forceUseInternalRTPThreading" defaultValue:a3];
}

- (BOOL)forceEnableAudioHALPluginMockInput
{
  return +[VCDefaults BOOLeanValueForKey:@"forceEnableAudioHALPluginMockInput"];
}

- (BOOL)startAudioHALPluginNullDevice
{
  return +[VCDefaults BOOLeanValueForKey:@"startAudioHALPluginNullDevice"];
}

- (BOOL)startAirPlayAudioHALPluginNullDevice
{
  return +[VCDefaults BOOLeanValueForKey:@"startAirPlayAudioHALPluginNullDevice"];
}

+ (BOOL)forceEnableScreenVirtualDisplayLabel
{
  return +[VCDefaults BOOLeanValueForKey:@"forceEnableScreenVirtualDisplayLabel"];
}

+ (id)screenVirtualDisplayLabelName
{
  CFTypeID TypeID = CFStringGetTypeID();
  unsigned int v3 = (void *)VCDefaults_CopyValueForKey(@"screenVirtualDisplayLabelName", TypeID);

  return v3;
}

- (BOOL)isFECVersion2Enabled
{
  return self->_isFECVersion2Enabled;
}

- (BOOL)forceWiFiAssist
{
  return self->_forceWiFiAssist;
}

- (BOOL)forceWiFiAssistOutOfBudget
{
  return self->_forceWiFiAssistOutOfBudget;
}

@end