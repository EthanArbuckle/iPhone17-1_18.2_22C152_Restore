@interface VCHardwareSettingsEmbedded
+ (BOOL)isCellularTappingSupported;
+ (id)sharedInstance;
+ (id)virtualHardwareSettings:(id)a3;
+ (int64_t)deviceClass;
- (BOOL)allowScreenShareResolutionModuloAdjustment;
- (BOOL)canDo1080p;
- (BOOL)captureFormatPrefer16by9ForSquare;
- (BOOL)deviceSupportsMultiway1080p;
- (BOOL)disableMLScalarDuringSharing;
- (BOOL)hasAppleNeuralEngine;
- (BOOL)hasBaseband;
- (BOOL)iPadSupportsOutOfProcessDecoding;
- (BOOL)iPhoneSupportsOutOfProcessDecoding;
- (BOOL)isCaptionsSupported;
- (BOOL)isCaptureSIFRPreferred;
- (BOOL)isDeviceLargeScreen;
- (BOOL)isDisplayPortrait;
- (BOOL)isExternalCameraSupported;
- (BOOL)isHDRSupportedAppleTV;
- (BOOL)isHEVC444DecodeSupported;
- (BOOL)isMLEnhanceOneToOneSupported;
- (BOOL)isMediaRecordingSupported;
- (BOOL)isPixelFormatAvailable;
- (BOOL)isRemoteCameraSenderSupported;
- (BOOL)isRemoteCameraSenderSupportediPad;
- (BOOL)isRemoteCameraSenderSupportediPhone;
- (BOOL)isSecondDisplaySupportEnabled;
- (BOOL)isSmartBrakeSupported;
- (BOOL)isSmartBrakeSupportedATV;
- (BOOL)isSmartBrakeSupportedIPad;
- (BOOL)isSmartBrakeSupportedIPhone;
- (BOOL)isSpatialAudioSupported;
- (BOOL)isSpatialAudioSupportedAppleTV;
- (BOOL)isSpatialAudioSupportedIPad;
- (BOOL)isSpatialAudioSupportedIPhone;
- (BOOL)isSpatialAudioSupportedIPod;
- (BOOL)isViewPointCorrectionSupported;
- (BOOL)isViewPointCorrectionSupportedNoDispatch;
- (BOOL)isVoiceProcessingAt24KSupported;
- (BOOL)limitCameraDownlinkBitrateDuringSharing;
- (BOOL)shouldEnforceScreenFrameRateLimit;
- (BOOL)supportsCompressedPixelFormat;
- (BOOL)supportsDecodingSquareCameraVideo;
- (BOOL)supportsDedicatedSystemAudioStream;
- (BOOL)supportsFoveation;
- (BOOL)supportsHEIFEncoding;
- (BOOL)supportsMultiway1080pStream;
- (BOOL)supportsMultiway1080pStreamATV;
- (BOOL)supportsMultiway1080pStreamEmbeddedOS;
- (BOOL)supportsMultiway720pStream;
- (BOOL)supportsOptimizedHandoversForTelephony;
- (BOOL)supportsOutOfProcessDecoding;
- (BOOL)supportsPSVoiceOnAP;
- (BOOL)supportsScreenCapture;
- (BOOL)supportsSystemAudioTap;
- (BOOL)useSoftFramerateSwitching;
- (NSArray)supportedVideoPayloads;
- (NSString)deviceName;
- (VCHardwareSettingsEmbedded)init;
- (double)previewPreferredAspectRatio;
- (id)initForDevice:(id)a3;
- (id)marketingName;
- (int)productType;
- (int64_t)chipId;
- (int64_t)deviceClass;
- (int64_t)screenShareCapabilities;
- (int64_t)screenShareCapabilitiesATV;
- (int64_t)screenShareCapabilitiesIPad;
- (int64_t)screenShareCapabilitiesIPhone;
- (int64_t)screenShareCapabilitiesIPod;
- (int64_t)videoEncoderType;
- (unint64_t)maxScreenEncodingSizeSupported;
- (unsigned)audioPacketLossConcealmentAlgorithmAACELD;
- (unsigned)maxActiveScreenEncoders;
- (unsigned)maxActiveVideoDecoders;
- (unsigned)maxActiveVideoEncoders;
- (unsigned)maxDisplayRefreshRate;
- (unsigned)maxFpsCameraCaptureDuringSharing;
- (unsigned)maxFrameRateSupportedBackgroundBlur;
- (unsigned)maxFrameRateSupportedScreenShare;
- (unsigned)maxHighTierMLEnhanceParticipants;
- (unsigned)maxMultiwayFramerateSupported;
- (unsigned)maxOneToOneFramerateSupported;
- (unsigned)maxRemoteParticipants30fps;
- (unsigned)screenHeight;
- (unsigned)screenHeightForDisplayID:(unsigned int)a3;
- (unsigned)screenWidth;
- (unsigned)screenWidthForDisplayID:(unsigned int)a3;
- (void)_initializeScreenDimension;
- (void)addPixelFormat;
- (void)dealloc;
- (void)setupSiriSupport;
- (void)supportsOutOfProcessDecoding;
@end

@implementation VCHardwareSettingsEmbedded

- (BOOL)isViewPointCorrectionSupported
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60__VCHardwareSettingsEmbedded_isViewPointCorrectionSupported__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  if (isViewPointCorrectionSupported_onceToken != -1) {
    dispatch_once(&isViewPointCorrectionSupported_onceToken, v3);
  }
  return isViewPointCorrectionSupported_result;
}

+ (id)sharedInstance
{
  v3 = objc_opt_class();
  objc_sync_enter(v3);
  if (VRTraceIsInternalOSInstalled()
    && (v4 = [+[VCDefaults sharedInstance] virtualHardware]) != 0)
  {
    v5 = (void *)[a1 virtualHardwareSettings:v4];
    objc_sync_exit(v3);
  }
  else
  {
    if (!sharedInstance__hardwareSettings_0) {
      sharedInstance__hardwareSettings_0 = objc_alloc_init(VCHardwareSettingsEmbedded);
    }
    objc_sync_exit(v3);
    return (id)sharedInstance__hardwareSettings_0;
  }
  return v5;
}

- (double)previewPreferredAspectRatio
{
  int deviceClass = self->_deviceClass;
  BOOL v3 = deviceClass == 8 || deviceClass == 3;
  double result = 1.77777778;
  if (v3) {
    return 1.33333333;
  }
  return result;
}

- (BOOL)captureFormatPrefer16by9ForSquare
{
  return [(VCHardwareSettingsEmbedded *)self deviceClass] == 1;
}

- (int64_t)deviceClass
{
  int64_t v2 = self;
  LODWORD(self) = *(_DWORD *)(self + 56);
  if (!self)
  {
    LODWORD(self) = +[VCHardwareSettingsEmbedded deviceClass];
    *(_DWORD *)(v2 + 56) = self;
  }
  return (int)self;
}

+ (int64_t)deviceClass
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int IntValueForKey = VCDefaults_GetIntValueForKey(@"forceDeviceClass", 0xFFFFFFFFLL);
  if (IntValueForKey == -1)
  {
    unsigned int v6 = MGGetSInt32Answer() - 1;
    if (v6 > 0xA) {
      return -1;
    }
    else {
      return qword_1E25A11A8[v6];
    }
  }
  else
  {
    int64_t v3 = IntValueForKey;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136316162;
        uint64_t v9 = v4;
        __int16 v10 = 2080;
        v11 = "+[VCHardwareSettingsEmbedded deviceClass]";
        __int16 v12 = 1024;
        int v13 = 656;
        __int16 v14 = 2112;
        uint64_t v15 = [NSNumber numberWithInteger:v3];
        __int16 v16 = 2112;
        v17 = @"forceDeviceClass";
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing device class to %@ as specified by the '%@' preference", (uint8_t *)&v8, 0x30u);
      }
    }
  }
  return v3;
}

- (BOOL)isCaptureSIFRPreferred
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v3 = _os_feature_enabled_impl();
  if (self->_deviceClass == 4) {
    return 0;
  }
  int v5 = v3;
  int64_t v6 = [+[VCHardwareSettingsEmbedded sharedInstance] chipId];
  int v7 = 0;
  if ((unint64_t)(v6 - 0x8000) > 0x27 || ((1 << v6) & 0x810023000BLL) == 0)
  {
    BOOL v9 = (unint64_t)(v6 - 35152) > 0x10 || ((1 << (v6 - 80)) & 0x10021) == 0;
    if (v9 && (unint64_t)(v6 - 28672) >= 2) {
      int v7 = 1;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136316162;
      uint64_t v13 = v10;
      __int16 v14 = 2080;
      uint64_t v15 = "-[VCHardwareSettingsEmbedded isCaptureSIFRPreferred]";
      __int16 v16 = 1024;
      int v17 = 492;
      __int16 v18 = 1024;
      int v19 = v5;
      __int16 v20 = 1024;
      int v21 = v7;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d featureFlagEnabled = %d, hardwareSupport = %d", (uint8_t *)&v12, 0x28u);
    }
  }
  return v5 & v7;
}

- (BOOL)supportsCompressedPixelFormat
{
  uint64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v2 > 33024)
  {
    if ((unint64_t)(v2 - 33025) > 0x11 || ((1 << (v2 - 1)) & 0x28005) == 0)
    {
      unint64_t v4 = v2 - 35152;
      if (v4 > 0x10 || ((1 << v4) & 0x10021) == 0) {
        return 1;
      }
    }
  }
  else if (((unint64_t)(v2 - 0x8000) > 0x30 || ((1 << v2) & 0x100810023000BLL) == 0) {
         && (unint64_t)(v2 - 28672) >= 2)
  }
  {
    return 1;
  }
  return result;
}

- (int64_t)chipId
{
  int64_t result = self->_chipId;
  if (!result)
  {
    int64_t result = MGGetSInt64Answer();
    self->_chipId = result;
  }
  return result;
}

- (VCHardwareSettingsEmbedded)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCHardwareSettingsEmbedded;
  uint64_t v2 = [(VCHardwareSettings *)&v8 init];
  int v3 = v2;
  if (v2)
  {
    [(VCHardwareSettingsEmbedded *)v2 addPixelFormat];
    [(VCHardwareSettingsEmbedded *)v3 setupSiriSupport];
    *(void *)&v3->_productType = MGGetProductType();
    int v4 = +[VCHardwareSettingsEmbedded deviceClass];
    v3->_int deviceClass = v4;
    if (v4 == -1 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      int64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v10 = v5;
        __int16 v11 = 2080;
        int v12 = "-[VCHardwareSettingsEmbedded init]";
        __int16 v13 = 1024;
        int v14 = 122;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _deviceClass is kVCDeviceClassTypeInvalid", buf, 0x1Cu);
      }
    }
  }
  return v3;
}

- (id)initForDevice:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v4 = [(VCHardwareSettingsEmbedded *)self init];
  if (v4)
  {
    if (a3)
    {
      *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v12 = v5;
      long long v13 = v5;
      long long v11 = v5;
      if (VCVirtualHardwareConfigurations_EmbeddedConfigurationForDevice(a3, &v11))
      {

        uint64_t v6 = [(id)v11 copy];
        v4->_deviceName = (NSString *)v6;
        if (v6)
        {
          *(void *)&v4->_screenWidth = *((void *)&v11 + 1);
          int64_t v7 = v13;
          v4->_chipId = v12;
          v4->_videoEncoderType = v7;
          if (BYTE10(v13)) {
            char v8 = BYTE11(v13);
          }
          else {
            char v8 = MGGetBoolAnswer();
          }
          v4->_hasAppleNeuralEngine = v8;
          v4->_int deviceClass = DWORD2(v12);
          v4->super._supportVCPEncoderInitialized = 1;
          v4->super._supportVCPEncoder = BYTE9(v13);
          int v9 = BYTE8(v13);
          v4->super._supportHEVC = BYTE8(v13);
          if (v9) {
            [(NSMutableSet *)v4->super._pixelFormatCollections addObject:&unk_1F3DC4D70];
          }
          [(NSMutableSet *)v4->super._pixelFormatCollections addObject:&unk_1F3DC4D88];
          [(NSMutableSet *)v4->super._pixelFormatCollections addObject:&unk_1F3DC4DA0];
          v4->_isInitialized = 1;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCHardwareSettingsEmbedded initForDevice:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCHardwareSettingsEmbedded initForDevice:].cold.4();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCHardwareSettingsEmbedded initForDevice:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCHardwareSettingsEmbedded initForDevice:]();
    }
  }
  if (!v4->_isInitialized)
  {

    return 0;
  }
  return v4;
}

+ (id)virtualHardwareSettings:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (virtualHardwareSettings___virtualHardwareSettingsDeviceA_0)
  {
    if (objc_msgSend(a3, "isEqual:", objc_msgSend((id)virtualHardwareSettings___virtualHardwareSettingsDeviceA_0, "deviceName")))
    {
      return (id)virtualHardwareSettings___virtualHardwareSettingsDeviceA_0;
    }
    else if (virtualHardwareSettings___virtualHardwareSettingsDeviceB_0)
    {
      if (objc_msgSend(a3, "isEqual:", objc_msgSend((id)virtualHardwareSettings___virtualHardwareSettingsDeviceB_0, "deviceName")))
      {
        return (id)virtualHardwareSettings___virtualHardwareSettingsDeviceB_0;
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint64_t v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v11 = 136315650;
            uint64_t v12 = v9;
            __int16 v13 = 2080;
            uint64_t v14 = "+[VCHardwareSettingsEmbedded virtualHardwareSettings:]";
            __int16 v15 = 1024;
            int v16 = 200;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Clearing existing virtual hardware settings.", (uint8_t *)&v11, 0x1Cu);
          }
        }

        virtualHardwareSettings___virtualHardwareSettingsDeviceA_0 = 0;
        virtualHardwareSettings___virtualHardwareSettingsDeviceB_0 = 0;
        return +[VCHardwareSettingsEmbedded virtualHardwareSettings:a3];
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        char v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315906;
          uint64_t v12 = v7;
          __int16 v13 = 2080;
          uint64_t v14 = "+[VCHardwareSettingsEmbedded virtualHardwareSettings:]";
          __int16 v15 = 1024;
          int v16 = 190;
          __int16 v17 = 2112;
          id v18 = a3;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Initializing new virtual hardware settings B for device=%@", (uint8_t *)&v11, 0x26u);
        }
      }
      id result = [[VCHardwareSettingsEmbedded alloc] initForDevice:a3];
      virtualHardwareSettings___virtualHardwareSettingsDeviceB_0 = (uint64_t)result;
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315906;
        uint64_t v12 = v5;
        __int16 v13 = 2080;
        uint64_t v14 = "+[VCHardwareSettingsEmbedded virtualHardwareSettings:]";
        __int16 v15 = 1024;
        int v16 = 180;
        __int16 v17 = 2112;
        id v18 = a3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Initializing new virtual hardware settings A for device=%@", (uint8_t *)&v11, 0x26u);
      }
    }
    id result = [[VCHardwareSettingsEmbedded alloc] initForDevice:a3];
    virtualHardwareSettings___virtualHardwareSettingsDeviceA_0 = (uint64_t)result;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCHardwareSettingsEmbedded;
  [(VCHardwareSettings *)&v3 dealloc];
}

- (void)setupSiriSupport
{
  BOOL v3 = +[VCHardwareSettings deviceClass] == 8;
  self->super._isSiriVoicePlayoutSupported = v3;
  self->super._isSiriVoiceTapSupported = v3;
}

- (void)_initializeScreenDimension
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (+[VCHardwareSettings deviceClass] == 8)
  {
    if (VCDefaults_GetBoolValueForKey(@"enableHighScreenCaptureResolution", 1)) {
      uint64_t v3 = 1904;
    }
    else {
      uint64_t v3 = 1080;
    }
    uint64_t v4 = 1920;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
  }
  uint64_t IntValueForKey = VCDefaults_GetIntValueForKey(@"forceScreenDimensionWidth", v4);
  if (IntValueForKey)
  {
    uint64_t v6 = IntValueForKey;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      char v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 136316162;
        uint64_t v21 = v7;
        __int16 v22 = 2080;
        v23 = "-[VCHardwareSettingsEmbedded _initializeScreenDimension]";
        __int16 v24 = 1024;
        int v25 = 258;
        __int16 v26 = 2112;
        *(void *)v27 = [NSNumber numberWithUnsignedInt:v6];
        *(_WORD *)&v27[8] = 2112;
        v28 = @"forceScreenDimensionWidth";
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing 'width' portion of screen dimensions to %@ as specified by the '%@' preference", (uint8_t *)&v20, 0x30u);
      }
    }
  }
  else
  {
    LODWORD(v6) = MGGetSInt32Answer();
  }
  uint64_t v9 = VCDefaults_GetIntValueForKey(@"forceScreenDimensionHeight", v3);
  if (v9)
  {
    uint64_t v10 = v9;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = [NSNumber numberWithUnsignedInt:v10];
        int v20 = 136316162;
        uint64_t v21 = v11;
        __int16 v22 = 2080;
        v23 = "-[VCHardwareSettingsEmbedded _initializeScreenDimension]";
        __int16 v24 = 1024;
        int v25 = 265;
        __int16 v26 = 2112;
        *(void *)v27 = v13;
        *(_WORD *)&v27[8] = 2112;
        v28 = @"forceScreenDimensionHeight";
        _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing 'height' portion of screen dimensions to %@ as specified by the '%@' preference", (uint8_t *)&v20, 0x30u);
      }
    }
  }
  else
  {
    LODWORD(v10) = MGGetSInt32Answer();
  }
  if (v6 <= v10) {
    int v14 = v10;
  }
  else {
    int v14 = v6;
  }
  if (v6 >= v10) {
    int v15 = v10;
  }
  else {
    int v15 = v6;
  }
  self->_int screenWidth = v14;
  self->_int screenHeight = v15;
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    __int16 v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int screenWidth = self->_screenWidth;
      int screenHeight = self->_screenHeight;
      int v20 = 136316162;
      uint64_t v21 = v16;
      __int16 v22 = 2080;
      v23 = "-[VCHardwareSettingsEmbedded _initializeScreenDimension]";
      __int16 v24 = 1024;
      int v25 = 278;
      __int16 v26 = 1024;
      *(_DWORD *)v27 = screenWidth;
      *(_WORD *)&v27[4] = 1024;
      *(_DWORD *)&v27[6] = screenHeight;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d screenWidth=%d, screenHeight=%d", (uint8_t *)&v20, 0x28u);
    }
  }
}

- (NSString)deviceName
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (!self->_deviceName)
  {
    self->_deviceName = (NSString *)MGCopyAnswer();
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        deviceName = self->_deviceName;
        int v7 = 136315906;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        uint64_t v10 = "-[VCHardwareSettingsEmbedded deviceName]";
        __int16 v11 = 1024;
        int v12 = 284;
        __int16 v13 = 2112;
        int v14 = deviceName;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d _deviceName=%@", (uint8_t *)&v7, 0x26u);
      }
    }
  }
  return self->_deviceName;
}

- (id)marketingName
{
  id result = self->_marketingName;
  if (!result)
  {
    id result = (id)MGCopyAnswer();
    self->_marketingName = (NSString *)result;
  }
  return result;
}

- (BOOL)hasBaseband
{
  if (!self->_hasBasebandInitialized)
  {
    self->_hasBaseband = MGGetBoolAnswer();
    self->_hasBasebandInitialized = 1;
  }
  return self->_hasBaseband;
}

- (BOOL)isSpatialAudioSupportedIPhone
{
  uint64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v2 > 33024)
  {
    if (v2 <= 35151 || v2 != 35152 && v2 != 35168) {
      return 1;
    }
  }
  else
  {
    if ((unint64_t)(v2 - 0x8000) <= 0x30)
    {
      if (((1 << v2) & 0x210009) != 0) {
        return result;
      }
      if (v2 == 32800 || v2 == 32816) {
        return 1;
      }
    }
    if (v2 != 28672) {
      return 1;
    }
  }
  return result;
}

- (BOOL)isSpatialAudioSupportedAppleTV
{
  uint64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  if (v2 > 32799) {
    return 1;
  }
  BOOL v3 = 0;
  if (v2 != 28672 && v2 != 32785) {
    return 1;
  }
  return v3;
}

- (BOOL)isHDRSupportedAppleTV
{
  return 1;
}

- (BOOL)isSpatialAudioSupportedIPad
{
  uint64_t v3 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v3 <= 32799)
  {
    if (v3 <= 32770)
    {
      if ((unint64_t)(v3 - 28672) >= 2 && (unint64_t)(v3 - 0x8000) >= 2) {
        return 1;
      }
      return result;
    }
    if (v3 == 32771) {
      return result;
    }
    if (v3 == 32784)
    {
      uint64_t v6 = *(void *)&self->_productType;
      if (v6 == -1)
      {
        uint64_t v6 = MGGetProductType();
        *(void *)&self->_productType = v6;
      }
      return v6 == 3645319985 || v6 == 228444038;
    }
    uint64_t v5 = 32785;
    goto LABEL_16;
  }
  if (v3 <= 33026 || v3 <= 35156) {
    return 1;
  }
  if (v3 != 35157)
  {
    uint64_t v5 = 35168;
LABEL_16:
    if (v3 != v5) {
      return 1;
    }
  }
  return result;
}

- (BOOL)supportsPSVoiceOnAP
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (supportsPSVoiceOnAP_onceToken != -1) {
    dispatch_once(&supportsPSVoiceOnAP_onceToken, &__block_literal_global_64);
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v2 = VRTraceErrorLogLevelToCSTR();
    uint64_t v3 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136316162;
      uint64_t v6 = v2;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCHardwareSettingsEmbedded supportsPSVoiceOnAP]";
      __int16 v9 = 1024;
      int v10 = 414;
      __int16 v11 = 1024;
      int v12 = 0;
      __int16 v13 = 1024;
      int v14 = supportsPSVoiceOnAP_radioVendor;
      _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d supportsPSVoiceOnAP=%d, radioVendor=%u", (uint8_t *)&v5, 0x28u);
    }
  }
  return 0;
}

uint64_t __49__VCHardwareSettingsEmbedded_supportsPSVoiceOnAP__block_invoke()
{
  uint64_t result = TelephonyRadiosGetRadioVendor();
  supportsPSVoiceOnAP_radioVendor = result;
  return result;
}

- (BOOL)supportsOptimizedHandoversForTelephony
{
  if ([(VCHardwareSettingsEmbedded *)self supportsPSVoiceOnAP]
    || VCCarrierBundle_GetPSVoiceOnAPEnabled())
  {
    uint64_t v2 = VCFeatureFlagManager_UseOptimizedTelephonyHandovers();
  }
  else
  {
    uint64_t v2 = 0;
  }

  return VCDefaults_GetBoolValueForKey(@"enableOptimizedTelephonyHandovers", v2);
}

- (BOOL)isSpatialAudioSupportedIPod
{
  int64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  return v2 != 28672 && v2 != 32784;
}

- (BOOL)isSpatialAudioSupported
{
  int64_t v3 = +[VCHardwareSettingsEmbedded deviceClass] - 1;
  BOOL result = 1;
  switch(v3)
  {
    case 0:
      BOOL result = [(VCHardwareSettingsEmbedded *)self isSpatialAudioSupportedIPhone];
      break;
    case 1:
      BOOL result = [(VCHardwareSettingsEmbedded *)self isSpatialAudioSupportedIPod];
      break;
    case 2:
      BOOL result = [(VCHardwareSettingsEmbedded *)self isSpatialAudioSupportedIPad];
      break;
    case 7:
      return result;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (unsigned)screenWidth
{
  unsigned int result = self->_screenWidth;
  if (!result)
  {
    [(VCHardwareSettingsEmbedded *)self _initializeScreenDimension];
    return self->_screenWidth;
  }
  return result;
}

- (unsigned)screenWidthForDisplayID:(unsigned int)a3
{
  unsigned int v4 = [(VCHardwareSettingsEmbedded *)self screenWidth];
  if (!a3 && +[VCHardwareSettings deviceClass] != 8)
  {
    int v5 = (void *)[MEMORY[0x1E4F39B60] mainDisplay];
    if (v5)
    {
      uint64_t v6 = v5;
      if (objc_msgSend((id)objc_msgSend(v5, "currentMode"), "width")) {
        return objc_msgSend((id)objc_msgSend(v6, "currentMode"), "width");
      }
    }
  }
  return v4;
}

- (unsigned)screenHeight
{
  unsigned int result = self->_screenHeight;
  if (!result)
  {
    [(VCHardwareSettingsEmbedded *)self _initializeScreenDimension];
    return self->_screenHeight;
  }
  return result;
}

- (unsigned)screenHeightForDisplayID:(unsigned int)a3
{
  unsigned int v4 = [(VCHardwareSettingsEmbedded *)self screenHeight];
  if (!a3 && +[VCHardwareSettings deviceClass] != 8)
  {
    int v5 = (void *)[MEMORY[0x1E4F39B60] mainDisplay];
    if (v5)
    {
      uint64_t v6 = v5;
      if (objc_msgSend((id)objc_msgSend(v5, "currentMode"), "height")) {
        return objc_msgSend((id)objc_msgSend(v6, "currentMode"), "height");
      }
    }
  }
  return v4;
}

- (BOOL)isDisplayPortrait
{
  MGGetFloat32Answer();
  return v3 == 0.0 && ((self->_deviceClass - 4) & 0xFFFFFFFB) != 0;
}

- (unint64_t)maxScreenEncodingSizeSupported
{
  unint64_t v3 = 921600;
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 5603328;
  }
  int64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
  if (((unint64_t)(v4 - 0x8000) > 0x20 || ((1 << v4) & 0x10023000BLL) == 0)
    && ((unint64_t)(v4 - 35152) > 0x10 || ((1 << (v4 - 80)) & 0x10021) == 0)
    && (unint64_t)(v4 - 28672) >= 2)
  {
    return 5603328;
  }
  return v3;
}

- (BOOL)allowScreenShareResolutionModuloAdjustment
{
  if (+[VCHardwareSettingsEmbedded deviceClass] != 1) {
    return 0;
  }
  int64_t v3 = [(VCHardwareSettingsEmbedded *)self chipId];
  if ((unint64_t)(v3 - 0x8000) <= 0x20 && ((1 << v3) & 0x10023000BLL) != 0) {
    return 0;
  }
  if ((unint64_t)(v3 - 35152) > 0x10) {
    return (unint64_t)(v3 - 28672) >= 2;
  }
  BOOL v4 = 0;
  if (((1 << (v3 - 80)) & 0x10021) == 0) {
    return (unint64_t)(v3 - 28672) >= 2;
  }
  return v4;
}

- (unsigned)maxFrameRateSupportedScreenShare
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 30;
  }
  int64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
  unsigned int result = 30;
  if (((unint64_t)(v4 - 0x8000) > 0x20 || ((1 << v4) & 0x10023000BLL) == 0)
    && ((unint64_t)(v4 - 35152) > 0x10 || ((1 << (v4 - 80)) & 0x10021) == 0))
  {
    if ((unint64_t)(v4 - 28672) >= 2) {
      return 60;
    }
    else {
      return 30;
    }
  }
  return result;
}

- (BOOL)shouldEnforceScreenFrameRateLimit
{
  return 0;
}

- (unsigned)maxFrameRateSupportedBackgroundBlur
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 1)
  {
    uint64_t v3 = [(VCHardwareSettingsEmbedded *)self chipId];
    unsigned int result = 24;
    if (v3 > 35151)
    {
      if (v3 != 35152 && v3 != 35168) {
        return 60;
      }
    }
    else if (((unint64_t)(v3 - 0x8000) > 0x30 || ((1 << v3) & 0x1000100210009) == 0) && v3 != 28672)
    {
      return 60;
    }
  }
  else if (self->_deviceClass == 4)
  {
    return 24;
  }
  else
  {
    return 60;
  }
  return result;
}

- (int64_t)videoEncoderType
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 2;
  }
  int64_t result = self->_videoEncoderType;
  if (!result)
  {
    int64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
    if ((unint64_t)(v4 - 35152) <= 0x10 && ((1 << (v4 - 80)) & 0x10021) != 0) {
      int64_t result = 1;
    }
    else {
      int64_t result = 2;
    }
    self->_videoEncoderType = result;
  }
  return result;
}

- (BOOL)useSoftFramerateSwitching
{
  return 0;
}

- (BOOL)supportsMultiway720pStream
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 1;
  }
  if (!VCDefaults_GetBoolValueForKey(@"supportsMultiway720pStream", 1)) {
    return 0;
  }
  int64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
  if ((unint64_t)(v4 - 0x8000) <= 0x11 && ((1 << v4) & 0x3000B) != 0) {
    return 0;
  }
  if ((unint64_t)(v4 - 35152) > 0x10) {
    return (unint64_t)(v4 - 28672) >= 2;
  }
  BOOL v3 = 0;
  if (((1 << (v4 - 80)) & 0x10021) == 0) {
    return (unint64_t)(v4 - 28672) >= 2;
  }
  return v3;
}

- (BOOL)supportsMultiway1080pStreamATV
{
  int64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  return v2 != 28672 && v2 != 32785;
}

- (BOOL)supportsMultiway1080pStreamEmbeddedOS
{
  uint64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v2 > 33024)
  {
    if (((unint64_t)(v2 - 35152) > 0x10 || ((1 << (v2 - 80)) & 0x10021) == 0)
      && v2 != 33025
      && v2 != 33027)
    {
      return 1;
    }
  }
  else if (((unint64_t)(v2 - 0x8000) > 0x30 || ((1 << v2) & 0x100810023000BLL) == 0) {
         && (unint64_t)(v2 - 28672) >= 2)
  }
  {
    return 1;
  }
  return result;
}

- (BOOL)deviceSupportsMultiway1080p
{
  unint64_t v3 = +[VCHardwareSettingsEmbedded deviceClass];
  if (v3 > 7) {
    return 0;
  }
  if (((1 << v3) & 0xCE) != 0)
  {
    return [(VCHardwareSettingsEmbedded *)self supportsMultiway1080pStreamEmbeddedOS];
  }
  if (v3 != 4) {
    return 0;
  }

  return [(VCHardwareSettingsEmbedded *)self supportsMultiway1080pStreamATV];
}

- (BOOL)supportsMultiway1080pStream
{
  BOOL v2 = [(VCHardwareSettingsEmbedded *)self deviceSupportsMultiway1080p];

  return VCDefaults_GetBoolValueForKey(@"supportsMultiway1080pStream", v2);
}

- (BOOL)supportsDecodingSquareCameraVideo
{
  return 0;
}

- (unsigned)maxOneToOneFramerateSupported
{
  int64_t v2 = [(VCHardwareSettingsEmbedded *)self deviceClass];
  if ((unint64_t)(v2 - 3) > 5) {
    return 30;
  }
  else {
    return dword_1E25A1200[v2 - 3];
  }
}

- (unsigned)maxMultiwayFramerateSupported
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 30;
  }
  uint64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
  unsigned int result = 15;
  if (v4 > 35156)
  {
    if (v4 != 35157 && v4 != 35168) {
      return 30;
    }
  }
  else if (((unint64_t)(v4 - 0x8000) > 0x10 || ((1 << v4) & 0x1000B) == 0) {
         && (unint64_t)(v4 - 28672) >= 2)
  }
  {
    return 30;
  }
  return result;
}

- (unsigned)maxDisplayRefreshRate
{
  unsigned int v2 = 60;
  if (+[VCHardwareSettingsEmbedded deviceClass] != 8)
  {
    if (MGGetBoolAnswer()) {
      return 120;
    }
    else {
      return 60;
    }
  }
  return v2;
}

- (unsigned)maxActiveVideoEncoders
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 6;
  }
  unsigned int result = [+[VCDefaults sharedInstance] maxActiveVideoEncoders];
  if (result == -1)
  {
    uint64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
    uint64_t v5 = v4;
    if (v4 <= 35156)
    {
      if ((unint64_t)(v4 - 0x8000) <= 0x11)
      {
        if (((1 << v4) & 0xB) != 0) {
          return 3;
        }
        if (((1 << v4) & 0x30000) != 0) {
          return 5;
        }
      }
      if ((unint64_t)(v4 - 28672) < 2) {
        return 3;
      }
      return 6;
    }
    unsigned int result = 1;
    if (v5 != 35157 && v5 != 35168) {
      return 6;
    }
  }
  return result;
}

- (unsigned)maxActiveVideoDecoders
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 15;
  }
  unsigned int v3 = [+[VCDefaults sharedInstance] maxActiveVideoDecoders];
  if (v3 != -1) {
    return v3;
  }
  uint64_t v5 = [(VCHardwareSettingsEmbedded *)self chipId];
  if (v5 <= 32788)
  {
    if (v5 > 32770)
    {
      if ((unint64_t)(v5 - 32784) < 2) {
        return 9;
      }
      if (v5 != 32771) {
        goto LABEL_25;
      }
    }
    else if ((unint64_t)(v5 - 28672) >= 2 && (unint64_t)(v5 - 0x8000) >= 2)
    {
LABEL_25:
      unsigned int v6 = 24;
      goto LABEL_26;
    }
    return 4;
  }
  if (v5 <= 32815)
  {
    if (v5 == 32789)
    {
      unsigned int v7 = 10;
      unsigned int v6 = 10;
      goto LABEL_27;
    }
    if (v5 != 32800 && v5 != 32807) {
      goto LABEL_25;
    }
    unsigned int v6 = 12;
LABEL_26:
    unsigned int v7 = 11;
LABEL_27:
    if (+[VCHardwareSettingsEmbedded deviceClass] == 3) {
      return v6;
    }
    else {
      return v7;
    }
  }
  if (v5 == 32816)
  {
    unsigned int v6 = 16;
    goto LABEL_26;
  }
  unsigned int v3 = 1;
  if (v5 != 35157 && v5 != 35168) {
    goto LABEL_25;
  }
  return v3;
}

- (unsigned)maxActiveScreenEncoders
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 1;
  }
  uint64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
  unsigned int result = 1;
  if (v4 > 35156)
  {
    if (v4 != 35157 && v4 != 35168) {
      return 2;
    }
  }
  else if (((unint64_t)(v4 - 0x8000) > 0x20 || ((1 << v4) & 0x10023000BLL) == 0) {
         && (unint64_t)(v4 - 28672) >= 2)
  }
  {
    return 2;
  }
  return result;
}

- (BOOL)isDeviceLargeScreen
{
  unint64_t v2 = [(VCHardwareSettingsEmbedded *)self deviceClass];
  return (v2 < 9) & (0x118u >> v2);
}

- (BOOL)hasAppleNeuralEngine
{
  v4[5] = *MEMORY[0x1E4F143B8];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__VCHardwareSettingsEmbedded_hasAppleNeuralEngine__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  if (hasAppleNeuralEngine_onceToken != -1) {
    dispatch_once(&hasAppleNeuralEngine_onceToken, v4);
  }
  return self->_hasAppleNeuralEngine;
}

uint64_t __50__VCHardwareSettingsEmbedded_hasAppleNeuralEngine__block_invoke(uint64_t a1)
{
  uint64_t result = MGGetBoolAnswer();
  *(unsigned char *)(*(void *)(a1 + 32) + 88) = result;
  return result;
}

- (BOOL)isCaptionsSupported
{
  if (![(VCHardwareSettingsEmbedded *)self hasAppleNeuralEngine]) {
    return 0;
  }
  if (+[VCHardwareSettingsEmbedded deviceClass] != 1) {
    return +[VCHardwareSettingsEmbedded deviceClass] == 3
  }
        || +[VCHardwareSettingsEmbedded deviceClass] == 4
        || +[VCHardwareSettingsEmbedded deviceClass] == 8;
  int64_t v3 = [(VCHardwareSettingsEmbedded *)self chipId];
  if ((unint64_t)(v3 - 0x8000) <= 0x15 && ((1 << v3) & 0x23000B) != 0) {
    return 0;
  }
  if ((unint64_t)(v3 - 35152) > 0x10) {
    return (unint64_t)(v3 - 28672) >= 2;
  }
  BOOL v4 = 0;
  if (((1 << (v3 - 80)) & 0x10021) == 0) {
    return (unint64_t)(v3 - 28672) >= 2;
  }
  return v4;
}

- (BOOL)isVoiceProcessingAt24KSupported
{
  if (+[VCHardwareSettingsEmbedded deviceClass] != 1) {
    return 0;
  }
  uint64_t v3 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v3 > 33024)
  {
    if (v3 != 33025 && v3 != 35152 && v3 != 35168) {
      return 1;
    }
  }
  else if (((unint64_t)(v3 - 0x8000) > 0x30 || ((1 << v3) & 0x1000100210009) == 0) && v3 != 28672)
  {
    return 1;
  }
  return result;
}

- (BOOL)supportsHEIFEncoding
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 1;
  }
  int64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
  if ((unint64_t)(v4 - 0x8000) <= 3 && v4 != 32770) {
    return 0;
  }
  if ((unint64_t)(v4 - 35152) > 0x10) {
    return (unint64_t)(v4 - 28672) >= 2;
  }
  BOOL v3 = 0;
  if (((1 << (v4 - 80)) & 0x10021) == 0) {
    return (unint64_t)(v4 - 28672) >= 2;
  }
  return v3;
}

- (unsigned)audioPacketLossConcealmentAlgorithmAACELD
{
  if (+[VCHardwareSettingsEmbedded deviceClass] != 6) {
    return 6;
  }
  if ([(VCHardwareSettingsEmbedded *)self chipId] == 28674) {
    return 3;
  }
  return 4;
}

- (BOOL)isRemoteCameraSenderSupportediPad
{
  uint64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v2 > 35156)
  {
    if (v2 != 35157 && v2 != 35168) {
      return 1;
    }
  }
  else if (((unint64_t)(v2 - 0x8000) > 3 || v2 == 32770) && (unint64_t)(v2 - 28672) >= 2)
  {
    return 1;
  }
  return result;
}

- (BOOL)isRemoteCameraSenderSupportediPhone
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VCHardwareSettingsEmbedded *)self chipId];
  if (v3 > 32815)
  {
    if (v3 == 32816 || v3 == 33040) {
      return 1;
    }
    uint64_t v5 = 33025;
LABEL_8:
    if (v3 != v5 && (int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      unsigned int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 136315906;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        int v12 = "-[VCHardwareSettingsEmbedded isRemoteCameraSenderSupportediPhone]";
        __int16 v13 = 1024;
        int v14 = 1143;
        __int16 v15 = 2048;
        int64_t v16 = [(VCHardwareSettingsEmbedded *)self chipId];
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown chipID 0x%llx", (uint8_t *)&v9, 0x26u);
      }
    }
    return 1;
  }
  BOOL v4 = 0;
  if (v3 != 32784 && v3 != 32789)
  {
    uint64_t v5 = 32800;
    goto LABEL_8;
  }
  return v4;
}

- (BOOL)isRemoteCameraSenderSupported
{
  int64_t v3 = +[VCHardwareSettingsEmbedded deviceClass];
  switch(v3)
  {
    case 4:
      return MGGetBoolAnswer();
    case 3:
      return [(VCHardwareSettingsEmbedded *)self isRemoteCameraSenderSupportediPad];
    case 1:
      return [(VCHardwareSettingsEmbedded *)self isRemoteCameraSenderSupportediPhone];
    default:
      return 0;
  }
}

- (BOOL)isSecondDisplaySupportEnabled
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 1;
  }
  if (+[VCHardwareSettingsEmbedded deviceClass] != 3) {
    return 0;
  }
  uint64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v4 > 33026)
  {
    if (v4 == 35168 || v4 == 35157) {
      return result;
    }
    if (v4 != 33027) {
      goto LABEL_15;
    }
    return 1;
  }
  if ((unint64_t)(v4 - 0x8000) <= 0x27)
  {
    if (((1 << v4) & 0x810003000ALL) == 0)
    {
      if (v4 == 0x8000) {
        return result;
      }
      goto LABEL_8;
    }
    return 1;
  }
LABEL_8:
  if ((unint64_t)(v4 - 28672) >= 2)
  {
LABEL_15:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315906;
        uint64_t v8 = v5;
        __int16 v9 = 2080;
        uint64_t v10 = "-[VCHardwareSettingsEmbedded isSecondDisplaySupportEnabled]";
        __int16 v11 = 1024;
        int v12 = 1182;
        __int16 v13 = 2048;
        int64_t v14 = [(VCHardwareSettingsEmbedded *)self chipId];
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown chipID 0x%llx", (uint8_t *)&v7, 0x26u);
      }
    }
    return 1;
  }
  return result;
}

- (BOOL)isHEVC444DecodeSupported
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 1;
  }
  uint64_t v3 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v3 > 33024)
  {
    if (v3 <= 35156)
    {
      if (v3 == 33025 || v3 == 33027) {
        return 1;
      }
      goto LABEL_16;
    }
    if (v3 != 35157 && v3 != 35168) {
      goto LABEL_16;
    }
  }
  else
  {
    if ((unint64_t)(v3 - 0x8000) > 0x30) {
      goto LABEL_12;
    }
    if (((1 << v3) & 0x1008100230000) != 0) {
      return 1;
    }
    if (((1 << v3) & 0xB) == 0)
    {
LABEL_12:
      if ((unint64_t)(v3 - 28672) >= 2)
      {
LABEL_16:
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v5 = VRTraceErrorLogLevelToCSTR();
          uint64_t v6 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v7 = 136315906;
            uint64_t v8 = v5;
            __int16 v9 = 2080;
            uint64_t v10 = "-[VCHardwareSettingsEmbedded isHEVC444DecodeSupported]";
            __int16 v11 = 1024;
            int v12 = 1212;
            __int16 v13 = 2048;
            int64_t v14 = [(VCHardwareSettingsEmbedded *)self chipId];
            _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown chipID 0x%llx", (uint8_t *)&v7, 0x26u);
          }
        }
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)canDo1080p
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 1;
  }
  uint64_t v3 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v3 > 32788)
  {
    if (v3 <= 32815)
    {
      if (v3 == 32800) {
        return +[VCHardwareSettingsEmbedded deviceClass] != 3;
      }
      return 1;
    }
    if ((unint64_t)(v3 - 35152) > 0x10 || ((1 << (v3 - 80)) & 0x10021) == 0) {
      return 1;
    }
  }
  else
  {
    if (v3 > 32770)
    {
      if (v3 == 32771) {
        return result;
      }
      if (v3 == 32784) {
        return +[VCHardwareSettingsEmbedded deviceClass] == 1;
      }
      return 1;
    }
    if ((unint64_t)(v3 - 28672) >= 2 && (unint64_t)(v3 - 0x8000) >= 2) {
      return 1;
    }
  }
  return result;
}

- (unsigned)maxRemoteParticipants30fps
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 32;
  }
  int64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
  unsigned int result = 4;
  if (((unint64_t)(v4 - 0x8000) > 0x15 || ((1 << v4) & 0x23000B) == 0)
    && ((unint64_t)(v4 - 35152) > 0x10 || ((1 << (v4 - 80)) & 0x10021) == 0))
  {
    if ((unint64_t)(v4 - 28672) >= 2) {
      return 32;
    }
    else {
      return 4;
    }
  }
  return result;
}

- (unsigned)maxFpsCameraCaptureDuringSharing
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8
    || +[VCHardwareSettingsEmbedded deviceClass] == 3
    && +[VCHardwareSettings isAppleSilicon])
  {
    return 30;
  }
  else
  {
    return 15;
  }
}

- (void)addPixelFormat
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  [(NSMutableSet *)self->super._pixelFormatCollections addObject:&unk_1F3DC4D88];
  [(NSMutableSet *)self->super._pixelFormatCollections addObject:&unk_1F3DC4DA0];
  v4.receiver = self;
  v4.super_class = (Class)VCHardwareSettingsEmbedded;
  if ([(VCHardwareSettings *)&v4 vcpSupportsHEVCEncoder]) {
    [(NSMutableSet *)self->super._pixelFormatCollections addObject:&unk_1F3DC4D70];
  }
  if ([(VCHardwareSettingsEmbedded *)self isSecondDisplaySupportEnabled]
    && [(VCHardwareSettingsEmbedded *)self isHEVC444DecodeSupported])
  {
    [(NSMutableSet *)self->super._pixelFormatCollections addObject:&unk_1F3DC4DB8];
LABEL_7:
    uint64_t v3 = &unk_1F3DC4DD0;
LABEL_8:
    [(NSMutableSet *)self->super._pixelFormatCollections addObject:v3];
    return;
  }
  if ([(VCHardwareSettingsEmbedded *)self deviceClass] == 1) {
    goto LABEL_7;
  }
  if ([(VCHardwareSettingsEmbedded *)self deviceClass] == 4
    && [(VCHardwareSettingsEmbedded *)self isHDRSupportedAppleTV])
  {
    uint64_t v3 = &unk_1F3DC4DE8;
    goto LABEL_8;
  }
}

- (BOOL)isPixelFormatAvailable
{
  return [(NSMutableSet *)self->super._pixelFormatCollections count] != 0;
}

- (NSArray)supportedVideoPayloads
{
  uint64_t v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  int64_t v4 = [(VCHardwareSettingsEmbedded *)self deviceClass];
  if ((unint64_t)(v4 - 1) >= 4)
  {
    if (v4 == 6)
    {
      uint64_t v5 = &unk_1F3DC4E18;
      goto LABEL_8;
    }
    if (v4 != 8) {
      return v3;
    }
  }
  [(NSArray *)v3 addObject:&unk_1F3DC4E00];
  [(NSArray *)v3 addObject:&unk_1F3DC4E18];
  if ([(VCHardwareSettings *)self supportHEVC])
  {
    uint64_t v5 = &unk_1F3DC4E30;
LABEL_8:
    [(NSArray *)v3 addObject:v5];
  }
  return v3;
}

- (BOOL)limitCameraDownlinkBitrateDuringSharing
{
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 1;
  }
  uint64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 1;
  if (v4 > 33024)
  {
    if (((unint64_t)(v4 - 35152) > 0x10 || ((1 << (v4 - 80)) & 0x10021) == 0) && v4 != 33025) {
      return +[VCHardwareSettingsEmbedded deviceClass] != 3;
    }
  }
  else if (((unint64_t)(v4 - 0x8000) > 0x30 || ((1 << v4) & 0x100810023000BLL) == 0) {
         && (unint64_t)(v4 - 28672) >= 2)
  }
  {
    return +[VCHardwareSettingsEmbedded deviceClass] != 3;
  }
  return result;
}

- (BOOL)supportsScreenCapture
{
  return (+[VCHardwareSettingsEmbedded deviceClass] & 0xFFFFFFFFFFFFFFFELL) != 6;
}

- (BOOL)supportsSystemAudioTap
{
  return +[VCHardwareSettingsEmbedded deviceClass] != 6;
}

- (BOOL)supportsDedicatedSystemAudioStream
{
  if (![(VCHardwareSettingsEmbedded *)self supportsSystemAudioTap]) {
    return 0;
  }
  if (+[VCHardwareSettingsEmbedded deviceClass] == 8) {
    return 1;
  }
  int64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
  if ((unint64_t)(v4 - 0x8000) <= 0x20 && ((1 << v4) & 0x10023000BLL) != 0) {
    return 0;
  }
  if ((unint64_t)(v4 - 35152) > 0x10) {
    return (unint64_t)(v4 - 28672) >= 2;
  }
  BOOL v3 = 0;
  if (((1 << (v4 - 80)) & 0x10021) == 0) {
    return (unint64_t)(v4 - 28672) >= 2;
  }
  return v3;
}

- (BOOL)disableMLScalarDuringSharing
{
  if (+[VCHardwareSettingsEmbedded deviceClass] != 8) {
    [(VCHardwareSettingsEmbedded *)self chipId];
  }
  return 1;
}

- (int64_t)screenShareCapabilities
{
  int64_t v3 = +[VCHardwareSettingsEmbedded deviceClass] - 1;
  int64_t result = 2;
  switch(v3)
  {
    case 0:
      int64_t result = [(VCHardwareSettingsEmbedded *)self screenShareCapabilitiesIPhone];
      break;
    case 1:
      int64_t result = [(VCHardwareSettingsEmbedded *)self screenShareCapabilitiesIPod];
      break;
    case 2:
      int64_t result = [(VCHardwareSettingsEmbedded *)self screenShareCapabilitiesIPad];
      break;
    case 3:
      int64_t result = [(VCHardwareSettingsEmbedded *)self screenShareCapabilitiesATV];
      break;
    case 7:
      return result;
    default:
      int64_t result = 0;
      break;
  }
  return result;
}

- (int64_t)screenShareCapabilitiesIPhone
{
  uint64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  int64_t result = 1;
  if (v2 > 35151)
  {
    if (v2 != 35152 && v2 != 35168) {
      return 2;
    }
  }
  else if (((unint64_t)(v2 - 0x8000) > 0x30 || ((1 << v2) & 0x1000100210009) == 0) && v2 != 28672)
  {
    return 2;
  }
  return result;
}

- (int64_t)screenShareCapabilitiesIPad
{
  uint64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  int64_t result = 0;
  if (v2 < 0x8000)
  {
    if (v2 != 28672)
    {
      if (v2 == 28673) {
        return 1;
      }
      return 2;
    }
  }
  else
  {
    if ((unint64_t)(v2 - 0x8000) <= 0x20 && ((1 << v2) & 0x10003000BLL) != 0) {
      return 1;
    }
    if (v2 != 35157 && v2 != 35168) {
      return 2;
    }
  }
  return result;
}

- (int64_t)screenShareCapabilitiesATV
{
  if (MGGetBoolAnswer()) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)screenShareCapabilitiesIPod
{
  return [(VCHardwareSettingsEmbedded *)self chipId] != 28672;
}

+ (BOOL)isCellularTappingSupported
{
  return 1;
}

- (BOOL)isMediaRecordingSupported
{
  return [(VCHardwareSettingsEmbedded *)self deviceClass] != 6;
}

- (BOOL)isViewPointCorrectionSupportedNoDispatch
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (![(VCHardwareSettingsEmbedded *)self hasAppleNeuralEngine])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v3) = 0;
      if (!v13) {
        return v3;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v24 = v11;
      __int16 v25 = 2080;
      __int16 v26 = "-[VCHardwareSettingsEmbedded isViewPointCorrectionSupportedNoDispatch]";
      __int16 v27 = 1024;
      int v28 = 1568;
      int64_t v14 = " [%s] %s:%d No AppleNeuralEngine";
LABEL_13:
      uint64_t v15 = v12;
      uint32_t v16 = 28;
LABEL_17:
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
LABEL_18:
    LOBYTE(v3) = 0;
    return v3;
  }
  int64_t v3 = +[VCHardwareSettingsEmbedded deviceClass];
  if (v3 == 1) {
    return v3;
  }
  int64_t v4 = v3;
  if (v3 != 3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      id v18 = *MEMORY[0x1E4F47A50];
      BOOL v19 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      LOBYTE(v3) = 0;
      if (!v19) {
        return v3;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v24 = v17;
      __int16 v25 = 2080;
      __int16 v26 = "-[VCHardwareSettingsEmbedded isViewPointCorrectionSupportedNoDispatch]";
      __int16 v27 = 1024;
      int v28 = 1565;
      __int16 v29 = 2048;
      int64_t v30 = v4;
      int64_t v14 = " [%s] %s:%d VCDeviceClassType=%ld is not supported";
      uint64_t v15 = v18;
      uint32_t v16 = 38;
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_18;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x1E4F47A50];
    BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    LOBYTE(v3) = 0;
    if (!v21) {
      return v3;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v24 = v20;
    __int16 v25 = 2080;
    __int16 v26 = "-[VCHardwareSettingsEmbedded isViewPointCorrectionSupportedNoDispatch]";
    __int16 v27 = 1024;
    int v28 = 1544;
    int64_t v14 = " [%s] %s:%d iPad feature flag is off";
    goto LABEL_13;
  }
  int64_t v5 = [(VCHardwareSettingsEmbedded *)self productType];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1F3DC4E48, &unk_1F3DC4E60, &unk_1F3DC4E78, &unk_1F3DC4E90, &unk_1F3DC4EA8, &unk_1F3DC4EC0, &unk_1F3DC4ED8, &unk_1F3DC4EF0, &unk_1F3DC4F08, &unk_1F3DC4F20, &unk_1F3DC4F38, &unk_1F3DC4F50, &unk_1F3DC4F68, &unk_1F3DC4F80, &unk_1F3DC4F98, &unk_1F3DC4FB0, &unk_1F3DC4FC8,
                 &unk_1F3DC4FE0,
                 &unk_1F3DC4FF8,
                 &unk_1F3DC5010,
                 &unk_1F3DC5028,
                 &unk_1F3DC5040,
                 &unk_1F3DC5058,
                 &unk_1F3DC5070,
                 &unk_1F3DC5088,
                 &unk_1F3DC50A0,
                 &unk_1F3DC50B8,
                 &unk_1F3DC50D0,
                 &unk_1F3DC50E8,
                 &unk_1F3DC5100,
                 &unk_1F3DC5118,
                 &unk_1F3DC5130,
                 &unk_1F3DC5148,
                 &unk_1F3DC5160,
                 &unk_1F3DC5178,
                 &unk_1F3DC5190,
                 &unk_1F3DC51A8,
                 &unk_1F3DC51C0,
                 0);
  int v7 = objc_msgSend(v6, "containsObject:", objc_msgSend(NSNumber, "numberWithLong:", v5));
  if (v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      __int16 v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        deviceName = self->_deviceName;
        *(_DWORD *)buf = 136316162;
        uint64_t v24 = v8;
        __int16 v25 = 2080;
        __int16 v26 = "-[VCHardwareSettingsEmbedded isViewPointCorrectionSupportedNoDispatch]";
        __int16 v27 = 1024;
        int v28 = 1560;
        __int16 v29 = 2048;
        int64_t v30 = v5;
        __int16 v31 = 2112;
        v32 = deviceName;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d iPad productType=0x%lx, model=%@ is not supported.", buf, 0x30u);
      }
    }
  }
  LOBYTE(v3) = v7 ^ 1;
  return v3;
}

uint64_t __60__VCHardwareSettingsEmbedded_isViewPointCorrectionSupported__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isViewPointCorrectionSupportedNoDispatch];
  isViewPointCorrectionSupported_uint64_t result = result;
  return result;
}

- (BOOL)isSmartBrakeSupportedIPhone
{
  int64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  BOOL v4 = (unint64_t)(v2 - 0x8000) > 0x27 || ((1 << v2) & 0x810023000BLL) == 0;
  if (v4 && ((unint64_t)(v2 - 35152) > 0x10 || ((1 << (v2 - 80)) & 0x10021) == 0)) {
    return (unint64_t)(v2 - 28672) >= 2;
  }
  return result;
}

- (BOOL)isSmartBrakeSupportedIPad
{
  uint64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v2 > 35156)
  {
    if (v2 != 35157 && v2 != 35168) {
      return 1;
    }
  }
  else if (((unint64_t)(v2 - 0x8000) > 0x20 || ((1 << v2) & 0x10003000BLL) == 0) {
         && (unint64_t)(v2 - 28672) >= 2)
  }
  {
    return 1;
  }
  return result;
}

- (BOOL)isSmartBrakeSupportedATV
{
  uint64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  if (v2 > 32799) {
    return 1;
  }
  BOOL v3 = 0;
  if (v2 != 28672 && v2 != 32785) {
    return 1;
  }
  return v3;
}

- (BOOL)isSmartBrakeSupported
{
  int64_t v3 = [(VCHardwareSettingsEmbedded *)self deviceClass];
  switch(v3)
  {
    case 4:
      return [(VCHardwareSettingsEmbedded *)self isSmartBrakeSupportedATV];
    case 3:
      return [(VCHardwareSettingsEmbedded *)self isSmartBrakeSupportedIPad];
    case 1:
      return [(VCHardwareSettingsEmbedded *)self isSmartBrakeSupportedIPhone];
    default:
      return 0;
  }
}

- (BOOL)isExternalCameraSupported
{
  if ([(VCHardwareSettingsEmbedded *)self deviceClass] != 3) {
    return 0;
  }

  return _os_feature_enabled_impl();
}

- (BOOL)isMLEnhanceOneToOneSupported
{
  if ([(VCHardwareSettingsEmbedded *)self deviceClass] != 3) {
    return 0;
  }
  uint64_t v3 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v3 > 33024)
  {
    if (((unint64_t)(v3 - 35152) > 0x10 || ((1 << (v3 - 80)) & 0x10021) == 0)
      && v3 != 33025
      && v3 != 33040)
    {
      return 1;
    }
  }
  else if (((unint64_t)(v3 - 0x8000) > 0x30 || ((1 << v3) & 0x100810023000BLL) == 0) {
         && (unint64_t)(v3 - 28672) >= 2)
  }
  {
    return 1;
  }
  return result;
}

- (unsigned)maxHighTierMLEnhanceParticipants
{
  int64_t v3 = [(VCHardwareSettingsEmbedded *)self deviceClass];
  if (v3 != 1)
  {
    if (v3 != 4) {
      return 2;
    }
    int64_t v4 = [(VCHardwareSettingsEmbedded *)self chipId];
    unsigned int result = 1;
    if (((unint64_t)(v4 - 0x8000) > 0x20 || ((1 << v4) & 0x10023000BLL) == 0)
      && ((unint64_t)(v4 - 35152) > 0x10 || ((1 << (v4 - 80)) & 0x10021) == 0))
    {
      if ((unint64_t)(v4 - 28672) >= 2) {
        return 2;
      }
      else {
        return 1;
      }
    }
    return result;
  }
  uint64_t v6 = [(VCHardwareSettingsEmbedded *)self chipId];
  unsigned int result = 0;
  if (v6 <= 33024)
  {
    if ((unint64_t)(v6 - 0x8000) <= 0x30 && ((1 << v6) & 0x1000100210009) != 0 || v6 == 28672) {
      return result;
    }
    return 1;
  }
  if (v6 > 35151)
  {
    if (v6 == 35152) {
      return result;
    }
    uint64_t v7 = 35168;
  }
  else
  {
    if (v6 == 33025) {
      return result;
    }
    uint64_t v7 = 33040;
  }
  if (v6 != v7) {
    return 1;
  }
  return result;
}

- (BOOL)supportsOutOfProcessDecoding
{
  int64_t v3 = [(VCHardwareSettingsEmbedded *)self deviceClass];
  LOBYTE(v4) = 1;
  switch(v3)
  {
    case -1:
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_2;
      }
      VRTraceErrorLogLevelToCSTR();
      BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (v4)
      {
        -[VCHardwareSettingsEmbedded supportsOutOfProcessDecoding]();
        goto LABEL_2;
      }
      break;
    case 0:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCHardwareSettingsEmbedded supportsOutOfProcessDecoding]();
        }
      }
      LOBYTE(v4) = 1;
      break;
    case 1:
      LOBYTE(v4) = [(VCHardwareSettingsEmbedded *)self iPhoneSupportsOutOfProcessDecoding];
      break;
    case 2:
    case 5:
    case 8:
LABEL_2:
      LOBYTE(v4) = 0;
      break;
    case 3:
      LOBYTE(v4) = [(VCHardwareSettingsEmbedded *)self iPadSupportsOutOfProcessDecoding];
      break;
    default:
      return v4;
  }
  return v4;
}

- (BOOL)iPhoneSupportsOutOfProcessDecoding
{
  uint64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v2 > 33024)
  {
    if (((unint64_t)(v2 - 35152) > 0x10 || ((1 << (v2 - 80)) & 0x10021) == 0)
      && v2 != 33025
      && v2 != 33027)
    {
      return 1;
    }
  }
  else if (((unint64_t)(v2 - 0x8000) > 0x30 || ((1 << v2) & 0x100810023000BLL) == 0) {
         && (unint64_t)(v2 - 28672) >= 2)
  }
  {
    return 1;
  }
  return result;
}

- (BOOL)iPadSupportsOutOfProcessDecoding
{
  uint64_t v2 = [(VCHardwareSettingsEmbedded *)self chipId];
  BOOL result = 0;
  if (v2 > 35156)
  {
    if (v2 != 35157 && v2 != 35168) {
      return 1;
    }
  }
  else if (((unint64_t)(v2 - 0x8000) > 0x10 || ((1 << v2) & 0x1000B) == 0) {
         && (unint64_t)(v2 - 28672) >= 2)
  }
  {
    return 1;
  }
  return result;
}

- (BOOL)supportsFoveation
{
  return +[VCHardwareSettingsEmbedded deviceClass] == 8;
}

- (int)productType
{
  return *(void *)&self->_productType;
}

- (void)initForDevice:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to initialize", v2, v3, v4, v5, v6);
}

- (void)initForDevice:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Attempting to initialize with NULL device code", v2, v3, v4, v5, v6);
}

- (void)initForDevice:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to copy device name", v2, v3, v4, v5, v6);
}

- (void)initForDevice:.cold.4()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCHardwareSettingsEmbedded initForDevice:]";
  __int16 v6 = 1024;
  int v7 = 136;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to find configuration for virtual embedded device=%@", v3, 0x26u);
}

- (void)supportsOutOfProcessDecoding
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCHardwareSettingsEmbedded called on kVCDeviceClassTypeMac", v2, v3, v4, v5, v6);
}

@end