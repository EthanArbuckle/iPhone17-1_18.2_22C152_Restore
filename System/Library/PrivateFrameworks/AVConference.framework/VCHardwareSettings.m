@interface VCHardwareSettings
+ (BOOL)allowScreenShareResolutionModuloAdjustment;
+ (BOOL)captureFormatPrefer16by9ForSquare;
+ (BOOL)disableMLScalarDuringSharing;
+ (BOOL)disableViewPointCorrectionForSharing;
+ (BOOL)isAppleSilicon;
+ (BOOL)isCaptionsSupported;
+ (BOOL)isCaptureSIFRPreferred;
+ (BOOL)isCellularTappingSupported;
+ (BOOL)isDataCollectionSupported;
+ (BOOL)isDeviceLargeScreen;
+ (BOOL)isDisplayPortrait;
+ (BOOL)isExternalCameraSupported;
+ (BOOL)isHEVCDecodeSupportedForHardwareSettingsMode:(unsigned __int8)a3;
+ (BOOL)isHEVCEncodeSupportedForHardwareSettingsMode:(unsigned __int8)a3;
+ (BOOL)isMLEnhanceOneToOneSupported;
+ (BOOL)isMediaRecordingSupported;
+ (BOOL)isRemoteCameraSenderSupported;
+ (BOOL)isSiriVoicePlayoutSupported;
+ (BOOL)isSiriVoiceTapSupported;
+ (BOOL)isSpatialAudioSupported;
+ (BOOL)isVideoRenderingSupported;
+ (BOOL)isViewPointCorrectionSupported;
+ (BOOL)isVoiceProcessingAt24KSupported;
+ (BOOL)limitCameraDownlinkBitrateDuringSharing;
+ (BOOL)preferPresentationTimestamp;
+ (BOOL)retainPixelBufferForMediaRecordingEnabled;
+ (BOOL)shouldEnforceScreenFrameRateLimit;
+ (BOOL)shouldOverrideGPUMuxing;
+ (BOOL)supportsCompressedPixelFormat;
+ (BOOL)supportsDecodingSquareCameraVideo;
+ (BOOL)supportsDedicatedSystemAudioStream;
+ (BOOL)supportsFilteredScreenCapture;
+ (BOOL)supportsFoveation;
+ (BOOL)supportsHEIFEncoding;
+ (BOOL)supportsHEVCDecoding;
+ (BOOL)supportsHEVCEncoding;
+ (BOOL)supportsMultiway1080pStream;
+ (BOOL)supportsMultiway720pStream;
+ (BOOL)supportsOptimizedHandoversForTelephony;
+ (BOOL)supportsOutOfProcessAudioDecoding;
+ (BOOL)supportsOutOfProcessVideoDecoding;
+ (BOOL)supportsPSVoiceOnAP;
+ (BOOL)supportsScreenCapture;
+ (BOOL)supportsSystemAudioTap;
+ (BOOL)supportsVideoPriority;
+ (double)previewPreferredAspectRatio;
+ (id)featureListStringForPayload:(int)a3 hardwareSettingsMode:(unsigned __int8)a4 version:(int64_t)a5;
+ (id)sharedInstance;
+ (id)supportedVideoPayloads;
+ (id)virtualHardwareSettings:(id)a3;
+ (int64_t)deviceClass;
+ (int64_t)screenShareCapabilities;
+ (unint64_t)maxScreenEncodingSizeSupported;
+ (unsigned)builtinMicCount;
+ (unsigned)maxActiveScreenEncoders;
+ (unsigned)maxActiveVideoDecoders;
+ (unsigned)maxActiveVideoEncoders;
+ (unsigned)maxFpsCameraCaptureDuringSharing;
+ (unsigned)maxFrameRateSupportedBackgroundBlur;
+ (unsigned)maxFrameRateSupportedScreenShare;
+ (unsigned)maxHighTierMLEnhanceParticipants;
+ (unsigned)maxMultiwayFramerateSupported;
+ (unsigned)maxOneToOneFramerateSupported;
+ (unsigned)maxRemoteParticipants30fps;
+ (unsigned)maxVCPSupportedTemporalLayers;
+ (unsigned)screenHeight;
+ (unsigned)screenHeightForDisplayID:(unsigned int)a3;
+ (unsigned)screenWidth;
+ (unsigned)screenWidthForDisplayID:(unsigned int)a3;
+ (unsigned)tilesPerVideoFrameForHardwareSettingsMode:(unsigned __int8)a3;
+ (unsigned)tilesPerVideoFrameForHardwareSettingsMode:(unsigned __int8)a3 hdrMode:(unint64_t)a4;
- (BOOL)isMLEnhanceOneToOneSupported;
- (BOOL)isSiriVoicePlayoutSupported;
- (BOOL)isSiriVoiceTapSupported;
- (BOOL)isVideoRenderingSupported;
- (BOOL)storeHardwareSettingsForAllOperatingModes;
- (BOOL)supportHEVC;
- (BOOL)vcpSupportsHEVCEncoder;
- (NSMutableDictionary)hardwareUsageModeSettings;
- (NSSet)pixelFormatCollections;
- (VCHardwareSettings)init;
- (id)featureListStringForPayload:(int)a3 hardwareSettingsMode:(unsigned __int8)a4 version:(int64_t)a5;
- (unsigned)maxNetworkBitrateMultiwayAudioOnWifi:(BOOL)a3 isLowLatencyAudio:(BOOL)a4;
- (void)dealloc;
- (void)init;
- (void)setHardwareUsageModeSettings:(id)a3;
- (void)storeHardwareSettingsForAllOperatingModes;
@end

@implementation VCHardwareSettings

+ (BOOL)isViewPointCorrectionSupported
{
  v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 isViewPointCorrectionSupported];
}

+ (BOOL)supportsCompressedPixelFormat
{
  v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportsCompressedPixelFormat];
}

+ (double)previewPreferredAspectRatio
{
  v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  [(VCHardwareSettingsEmbedded *)v2 previewPreferredAspectRatio];
  return result;
}

+ (BOOL)captureFormatPrefer16by9ForSquare
{
  if (VCDefaults_GetBoolValueForKey(@"AVCapturePrefer16By9ForSquare", 0)) {
    return 1;
  }
  v3 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v3 captureFormatPrefer16by9ForSquare];
}

+ (BOOL)retainPixelBufferForMediaRecordingEnabled
{
  BOOL v2 = ((+[VCHardwareSettings deviceClass] - 4) & 0xFFFFFFFFFFFFFFFBLL) != 0;

  return VCDefaults_GetBoolValueForKey(@"enableRetainPixelBufferForMediaRecording", v2);
}

+ (int64_t)deviceClass
{
  return +[VCHardwareSettingsEmbedded deviceClass];
}

+ (BOOL)isCaptureSIFRPreferred
{
  char v2 = _os_feature_enabled_impl();
  return v2 & [+[VCHardwareSettingsEmbedded sharedInstance] isCaptureSIFRPreferred];
}

+ (id)virtualHardwareSettings:(id)a3
{
  uint64_t v4 = VCVirtualHardwareConfigurations_DevicePlatform(a3);
  if (v4 == 2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCHardwareSettings virtualHardwareSettings:]();
      }
    }
    return 0;
  }
  if (v4 == 1)
  {
    v5 = VCHardwareSettingsMac;
    return (id)[(__objc2_class *)v5 virtualHardwareSettings:a3];
  }
  if (v4) {
    return 0;
  }
  v5 = VCHardwareSettingsEmbedded;
  return (id)[(__objc2_class *)v5 virtualHardwareSettings:a3];
}

- (VCHardwareSettings)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCHardwareSettings;
  char v2 = [(VCHardwareSettings *)&v6 init];
  if (!v2) {
    return v2;
  }
  uint64_t v3 = objc_opt_new();
  v2->_hardwareUsageModeSettings = (NSMutableDictionary *)v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCHardwareSettings init]();
      }
    }
    goto LABEL_12;
  }
  if (![(VCHardwareSettings *)v2 storeHardwareSettingsForAllOperatingModes])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCHardwareSettings init]();
      }
    }
LABEL_12:

    return 0;
  }
  v2->_supportHEVC = -1;
  [(VCHardwareSettings *)v2 supportHEVC];
  [(VCHardwareSettings *)v2 vcpSupportsHEVCEncoder];
  v2->_isSiriVoicePlayoutSupported = 1;
  uint64_t v4 = objc_opt_new();
  v2->_pixelFormatCollections = (NSMutableSet *)v4;
  if (!v4 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCHardwareSettings init]();
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCHardwareSettings;
  [(VCHardwareSettings *)&v3 dealloc];
}

+ (id)featureListStringForPayload:(int)a3 hardwareSettingsMode:(unsigned __int8)a4 version:(int64_t)a5
{
  uint64_t v6 = a4;
  uint64_t v7 = *(void *)&a3;
  v8 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettings *)v8 featureListStringForPayload:v7 hardwareSettingsMode:v6 version:a5];
}

- (id)featureListStringForPayload:(int)a3 hardwareSettingsMode:(unsigned __int8)a4 version:(int64_t)a5
{
  uint64_t v7 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_hardwareUsageModeSettings, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedChar:a4]);
  if (a3 == 126 || a3 == 123)
  {
    if (a5 == 2)
    {
      return (id)[v7 featureListStringFixedPositionH264];
    }
    else
    {
      return (id)[v7 featureListStringH264];
    }
  }
  else if (a3 == 100)
  {
    if (a5 == 2)
    {
      return (id)[v7 featureListStringFixedPositionHEVC];
    }
    else
    {
      return (id)[v7 featureListStringHEVC];
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCHardwareSettings featureListStringForPayload:hardwareSettingsMode:version:]();
      }
    }
    return 0;
  }
}

+ (id)sharedInstance
{
  return +[VCHardwareSettingsMac sharedInstance];
}

- (BOOL)supportHEVC
{
  int supportHEVC = self->_supportHEVC;
  if (supportHEVC == -1)
  {
    int v3 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_hardwareUsageModeSettings, "objectForKeyedSubscript:", &unk_1F3DC6A50), "vcpSupportsHEVCDecoder");
    self->_int supportHEVC = v3;
  }
  else
  {
    LOBYTE(v3) = supportHEVC == 1;
  }
  return v3;
}

- (BOOL)vcpSupportsHEVCEncoder
{
  BOOL result = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_hardwareUsageModeSettings, "objectForKeyedSubscript:", &unk_1F3DC6A50), "vcpSupportsHEVCEncoder");
  self->_supportVCPEncoder = result;
  return result;
}

+ (BOOL)isHEVCEncodeSupportedForHardwareSettingsMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = (void *)[a1 sharedInstance];
  if (v4)
  {
    v5 = (void *)[v4 hardwareUsageModeSettings];
    uint64_t v6 = objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v3));
    LOBYTE(v4) = [v6 vcpSupportsHEVCEncoder];
  }
  return (char)v4;
}

+ (BOOL)isHEVCDecodeSupportedForHardwareSettingsMode:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v4 = (void *)[a1 sharedInstance];
  if (v4)
  {
    v5 = (void *)[v4 hardwareUsageModeSettings];
    uint64_t v6 = objc_msgSend(v5, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v3));
    LOBYTE(v4) = [v6 vcpSupportsHEVCDecoder];
  }
  return (char)v4;
}

+ (unsigned)tilesPerVideoFrameForHardwareSettingsMode:(unsigned __int8)a3 hdrMode:(unint64_t)a4
{
  uint64_t v5 = a3;
  uint64_t v6 = (void *)[a1 sharedInstance];
  if (!v6) {
    return -1;
  }
  uint64_t v7 = (void *)[v6 hardwareUsageModeSettings];
  v8 = objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", v5));

  return [v8 numTilesPerVideoFrameForHDRMode:a4];
}

+ (unsigned)tilesPerVideoFrameForHardwareSettingsMode:(unsigned __int8)a3
{
  return [a1 tilesPerVideoFrameForHardwareSettingsMode:a3 hdrMode:0];
}

- (BOOL)storeHardwareSettingsForAllOperatingModes
{
  LOBYTE(v3) = 1;
  uint64_t v4 = [[VCModeSpecificHardwareSettings alloc] initWithHardwareSettingsMode:1];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 1u;
    while (1)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_hardwareUsageModeSettings, "setObject:forKeyedSubscript:", v5, [NSNumber numberWithUnsignedChar:v3]);

      if (v6 == 7) {
        return 1;
      }
      uint64_t v3 = *((unsigned __int8 *)&storeHardwareSettingsForAllOperatingModes_hardwareSettingsModes + v6);
      uint64_t v5 = [[VCModeSpecificHardwareSettings alloc] initWithHardwareSettingsMode:v3];
      ++v6;
      if (!v5)
      {
        BOOL v7 = (unint64_t)(v6 - 2) > 5;
        goto LABEL_6;
      }
    }
  }
  else
  {
    BOOL v7 = 0;
LABEL_6:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCHardwareSettings storeHardwareSettingsForAllOperatingModes]();
      }
    }
  }
  return v7;
}

- (unsigned)maxNetworkBitrateMultiwayAudioOnWifi:(BOOL)a3 isLowLatencyAudio:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v6 = +[VCDefaults sharedInstance];
  if (v5)
  {
    unsigned int result = [(VCDefaults *)v6 multiwayAudioNetworkBitrateCapWifi];
    if (v4) {
      unsigned int v8 = 165600;
    }
    else {
      unsigned int v8 = 73400;
    }
    BOOL v9 = result == -1;
  }
  else
  {
    unsigned int result = [(VCDefaults *)v6 multiwayAudioNetworkBitrateCapCellular];
    BOOL v9 = result == -1;
    unsigned int v8 = 55000;
  }
  if (v9) {
    return v8;
  }
  return result;
}

+ (unsigned)builtinMicCount
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int valuePtr = 0;
  CFNumberRef v2 = (const __CFNumber *)MGCopyAnswer();
  if (v2)
  {
    CFNumberRef v3 = v2;
    CFNumberGetValue(v2, kCFNumberIntType, &valuePtr);
    CFRelease(v3);
    LODWORD(v2) = valuePtr;
  }
  return v2;
}

+ (unsigned)maxRemoteParticipants30fps
{
  CFNumberRef v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 maxRemoteParticipants30fps];
}

+ (unsigned)maxFpsCameraCaptureDuringSharing
{
  uint64_t v2 = [+[VCHardwareSettingsEmbedded sharedInstance] maxFpsCameraCaptureDuringSharing];

  return VCDefaults_GetIntValueForKey(@"maxCameraFrameRateWhenScreenIsEnabled", v2);
}

+ (BOOL)disableViewPointCorrectionForSharing
{
  return 1;
}

- (BOOL)isVideoRenderingSupported
{
  return (+[VCHardwareSettings deviceClass] & 0xFFFFFFFFFFFFFFFELL) != 6;
}

+ (BOOL)shouldOverrideGPUMuxing
{
  return 0;
}

+ (unsigned)screenWidth
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 screenWidth];
}

+ (unsigned)screenHeight
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 screenHeight];
}

+ (unsigned)screenWidthForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v4 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v4 screenWidthForDisplayID:v3];
}

+ (unsigned)screenHeightForDisplayID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v4 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v4 screenHeightForDisplayID:v3];
}

+ (BOOL)supportsFilteredScreenCapture
{
  return 0;
}

+ (unint64_t)maxScreenEncodingSizeSupported
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 maxScreenEncodingSizeSupported];
}

+ (BOOL)allowScreenShareResolutionModuloAdjustment
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 allowScreenShareResolutionModuloAdjustment];
}

+ (unsigned)maxFrameRateSupportedScreenShare
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 maxFrameRateSupportedScreenShare];
}

+ (BOOL)shouldEnforceScreenFrameRateLimit
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 shouldEnforceScreenFrameRateLimit];
}

+ (unsigned)maxActiveScreenEncoders
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 maxActiveScreenEncoders];
}

+ (unsigned)maxFrameRateSupportedBackgroundBlur
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 maxFrameRateSupportedBackgroundBlur];
}

+ (BOOL)isDisplayPortrait
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 isDisplayPortrait];
}

+ (BOOL)isSpatialAudioSupported
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (VCDefaults_GetBoolValueForKey(@"enableSpatialAudio", 0))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      uint64_t v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315650;
        uint64_t v11 = v2;
        __int16 v12 = 2080;
        v13 = "+[VCHardwareSettings isSpatialAudioSupported]";
        __int16 v14 = 1024;
        int v15 = 609;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Spatial audio feature force enabled", (uint8_t *)&v10, 0x1Cu);
      }
    }
    LOBYTE(v4) = 1;
  }
  else
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v5 = VRTraceErrorLogLevelToCSTR();
        uint64_t v6 = *MEMORY[0x1E4F47A50];
        LOBYTE(v4) = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          return v4;
        }
        int v10 = 136315650;
        uint64_t v11 = v5;
        __int16 v12 = 2080;
        v13 = "+[VCHardwareSettings isSpatialAudioSupported]";
        __int16 v14 = 1024;
        int v15 = 613;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Spatial audio feature disabled", (uint8_t *)&v10, 0x1Cu);
      }
      LOBYTE(v4) = 0;
      return v4;
    }
    BOOL v4 = +[VCHardwareSettings deviceClass] == 8
      || [+[VCHardwareSettingsEmbedded sharedInstance] isSpatialAudioSupported];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      unsigned int v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        v13 = "+[VCHardwareSettings isSpatialAudioSupported]";
        __int16 v14 = 1024;
        int v15 = 628;
        __int16 v16 = 1024;
        BOOL v17 = v4;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Spatial audio feature enabled. deviceSupportsSpatialAudio=%d", (uint8_t *)&v10, 0x22u);
      }
    }
  }
  return v4;
}

+ (BOOL)isCaptionsSupported
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 isCaptionsSupported];
}

+ (BOOL)isVoiceProcessingAt24KSupported
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 isVoiceProcessingAt24KSupported];
}

+ (BOOL)supportsHEIFEncoding
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportsHEIFEncoding];
}

+ (BOOL)supportsHEVCEncoding
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettings *)v2 vcpSupportsHEVCEncoder];
}

+ (BOOL)supportsHEVCDecoding
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettings *)v2 supportHEVC];
}

+ (BOOL)supportsMultiway1080pStream
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportsMultiway1080pStream];
}

+ (BOOL)supportsDecodingSquareCameraVideo
{
  BOOL v2 = [+[VCHardwareSettingsEmbedded sharedInstance] supportsDecodingSquareCameraVideo];

  return +[VCDefaults BOOLeanValueForKey:@"preferDecodingSquareCameraVideo" defaultValue:v2];
}

+ (unsigned)maxOneToOneFramerateSupported
{
  unsigned int result = VCDefaults_GetIntValueForKey(@"MaxOneToOneFramerate", 0);
  if (!result)
  {
    uint64_t v3 = +[VCHardwareSettingsEmbedded sharedInstance];
    return [(VCHardwareSettingsEmbedded *)v3 maxOneToOneFramerateSupported];
  }
  return result;
}

+ (unsigned)maxMultiwayFramerateSupported
{
  unsigned int result = VCDefaults_GetIntValueForKey(@"MaxMultiwayFramerate", 0);
  if (!result)
  {
    uint64_t v3 = +[VCHardwareSettingsEmbedded sharedInstance];
    return [(VCHardwareSettingsEmbedded *)v3 maxMultiwayFramerateSupported];
  }
  return result;
}

+ (id)supportedVideoPayloads
{
  BOOL v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportedVideoPayloads];
}

+ (BOOL)limitCameraDownlinkBitrateDuringSharing
{
  BOOL v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 limitCameraDownlinkBitrateDuringSharing];
}

+ (BOOL)supportsScreenCapture
{
  BOOL v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportsScreenCapture];
}

+ (BOOL)supportsSystemAudioTap
{
  BOOL v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportsSystemAudioTap];
}

+ (BOOL)supportsDedicatedSystemAudioStream
{
  BOOL v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportsDedicatedSystemAudioStream];
}

+ (BOOL)disableMLScalarDuringSharing
{
  BOOL v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 disableMLScalarDuringSharing];
}

+ (int64_t)screenShareCapabilities
{
  if (VCDefaults_GetBoolValueForKey(@"kVCDefaultForceScreenCaptureCapabilitiesSendWithCamera", 0)) {
    return 2;
  }
  uint64_t v3 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v3 screenShareCapabilities];
}

+ (unsigned)maxActiveVideoEncoders
{
  BOOL v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 maxActiveVideoEncoders];
}

+ (unsigned)maxActiveVideoDecoders
{
  BOOL v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 maxActiveVideoDecoders];
}

+ (BOOL)isVideoRenderingSupported
{
  BOOL v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettings *)v2 isVideoRenderingSupported];
}

+ (BOOL)preferPresentationTimestamp
{
  return 0;
}

+ (unsigned)maxVCPSupportedTemporalLayers
{
  return 4;
}

+ (BOOL)isSiriVoiceTapSupported
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    BOOL v2 = +[VCHardwareSettingsEmbedded sharedInstance];
    return [(VCHardwareSettings *)v2 isSiriVoiceTapSupported];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        BOOL v9 = "+[VCHardwareSettings isSiriVoiceTapSupported]";
        __int16 v10 = 1024;
        int v11 = 866;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Siri audio feature disabled", (uint8_t *)&v6, 0x1Cu);
      }
    }
    return 0;
  }
}

+ (BOOL)isSiriVoicePlayoutSupported
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    BOOL v2 = +[VCHardwareSettingsEmbedded sharedInstance];
    return [(VCHardwareSettings *)v2 isSiriVoicePlayoutSupported];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315650;
        uint64_t v7 = v4;
        __int16 v8 = 2080;
        BOOL v9 = "+[VCHardwareSettings isSiriVoicePlayoutSupported]";
        __int16 v10 = 1024;
        int v11 = 880;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Siri audio feature disabled", (uint8_t *)&v6, 0x1Cu);
      }
    }
    return 0;
  }
}

+ (BOOL)isExternalCameraSupported
{
  BOOL v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 isExternalCameraSupported];
}

void __VCHardwareSettings_FrontCameraOffsetFromDisplayCenter_block_invoke()
{
  CFArrayRef v0 = (const __CFArray *)MGCopyAnswer();
  if (v0)
  {
    CFArrayRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFArrayGetTypeID() && CFArrayGetCount(v1) >= 2)
    {
      objc_msgSend((id)CFArrayGetValueAtIndex(v1, 0), "floatValue");
      *(double *)&VCHardwareSettings_FrontCameraOffsetFromDisplayCenter_offset_0 = (float)(v4 / -1000.0);
      objc_msgSend((id)CFArrayGetValueAtIndex(v1, 1), "floatValue");
      double v3 = (float)(v5 / 1000.0);
    }
    else
    {
      VCHardwareSettings_FrontCameraOffsetFromDisplayCenter_offset_0 = 0xBFB19CCFC02D6854;
      double v3 = 0.00722700031;
    }
    VCHardwareSettings_FrontCameraOffsetFromDisplayCenter_offset_1 = *(void *)&v3;
    CFRelease(v1);
  }
  else
  {
    VCHardwareSettings_FrontCameraOffsetFromDisplayCenter_offset_0 = 0xBFB19CCFC02D6854;
    VCHardwareSettings_FrontCameraOffsetFromDisplayCenter_offset_1 = 0x3F7D9A0F1FAC9276;
  }
}

- (BOOL)isSiriVoiceTapSupported
{
  return self->_isSiriVoiceTapSupported;
}

- (BOOL)isSiriVoicePlayoutSupported
{
  return self->_isSiriVoicePlayoutSupported;
}

+ (BOOL)isCellularTappingSupported
{
  return +[VCHardwareSettingsEmbedded isCellularTappingSupported];
}

+ (BOOL)supportsMultiway720pStream
{
  CFTypeID v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportsMultiway720pStream];
}

+ (BOOL)isRemoteCameraSenderSupported
{
  CFTypeID v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 isRemoteCameraSenderSupported];
}

+ (BOOL)isMediaRecordingSupported
{
  CFTypeID v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 isMediaRecordingSupported];
}

+ (BOOL)isAppleSilicon
{
  return 1;
}

+ (BOOL)isDeviceLargeScreen
{
  CFTypeID v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 isDeviceLargeScreen];
}

+ (BOOL)isMLEnhanceOneToOneSupported
{
  CFTypeID v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 isMLEnhanceOneToOneSupported];
}

+ (unsigned)maxHighTierMLEnhanceParticipants
{
  uint64_t v2 = [+[VCHardwareSettingsEmbedded sharedInstance] maxHighTierMLEnhanceParticipants];

  return VCDefaults_GetIntValueForKey(@"mlEnhanceNumberMLEnhancedParticipants", v2);
}

+ (BOOL)supportsOutOfProcessVideoDecoding
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportsOutOfProcessVideoDecoding];
}

+ (BOOL)supportsOutOfProcessAudioDecoding
{
  uint64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportsOutOfProcessAudioDecoding];
}

+ (BOOL)isDataCollectionSupported
{
  int64_t v2 = +[VCHardwareSettings deviceClass];
  return ((unint64_t)(v2 + 1) > 7) | (0x36u >> (v2 + 1)) & 1;
}

+ (BOOL)supportsPSVoiceOnAP
{
  int64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportsPSVoiceOnAP];
}

+ (BOOL)supportsOptimizedHandoversForTelephony
{
  int64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportsOptimizedHandoversForTelephony];
}

+ (BOOL)supportsVideoPriority
{
  int64_t v2 = +[VCHardwareSettings deviceClass];
  return ((unint64_t)(v2 + 1) > 9) | (0x36u >> (v2 + 1)) & 1;
}

+ (BOOL)supportsFoveation
{
  int64_t v2 = +[VCHardwareSettingsEmbedded sharedInstance];

  return [(VCHardwareSettingsEmbedded *)v2 supportsFoveation];
}

- (NSMutableDictionary)hardwareUsageModeSettings
{
  return self->_hardwareUsageModeSettings;
}

- (void)setHardwareUsageModeSettings:(id)a3
{
}

- (NSSet)pixelFormatCollections
{
  return &self->_pixelFormatCollections->super;
}

- (BOOL)isMLEnhanceOneToOneSupported
{
  return self->_isMLEnhanceOneToOneSupported;
}

+ (void)virtualHardwareSettings:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 257;
  __int16 v4 = 2112;
  uint64_t v5 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid platform for device=%@", v2, 0x26u);
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCHardwareSettings: Failed to allocate store hardware settings for all VCP usage modes", v2, v3, v4, v5, v6);
}

- (void)featureListStringForPayload:hardwareSettingsMode:version:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected payload=%u", v2, v3, v4, 317);
}

- (void)storeHardwareSettingsForAllOperatingModes
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCHardwareSettings: Failed to allocate array for hardware settings, hardwareSettingsMode=%hhu", v2, v3, v4, 398);
}

@end