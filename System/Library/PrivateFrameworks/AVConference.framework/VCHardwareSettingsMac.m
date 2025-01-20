@interface VCHardwareSettingsMac
+ (BOOL)isCellularTappingSupported;
+ (id)sharedInstance;
+ (id)virtualHardwareSettings:(id)a3;
+ (int64_t)deviceClass;
- (BOOL)_isMachineNewerThanSandybridge:(int)a3;
- (BOOL)_isModel:(id)a3;
- (BOOL)canDoHEVC;
- (BOOL)canDoHiDefDecoding;
- (BOOL)canDoHiDefEncoding;
- (BOOL)captureFormatPrefer16by9ForSquare;
- (BOOL)disableMLScalarDuringSharing;
- (BOOL)isAppleSiliconMac;
- (BOOL)isCaptionsSupported;
- (BOOL)isDeviceLargeScreen;
- (BOOL)isExternalCameraSupported;
- (BOOL)isGVAEncoderAvailable;
- (BOOL)isIMac;
- (BOOL)isIMacPro;
- (BOOL)isMacBookAir;
- (BOOL)isMacBookWVGA;
- (BOOL)isMacPro;
- (BOOL)isMacmini;
- (BOOL)isMediaRecordingSupported;
- (BOOL)isPixelFormatAvailable;
- (BOOL)isRemoteCameraSenderSupported;
- (BOOL)isSpatialAudioSupported;
- (BOOL)isViewPointCorrectionSupported;
- (BOOL)limitCameraDownlinkBitrateDuringSharing;
- (BOOL)preferPresentationTimestamp;
- (BOOL)shouldEnforceScreenFrameRateLimit;
- (BOOL)shouldOverrideGPUMuxing;
- (BOOL)supports1080pDecoding;
- (BOOL)supports1080pEncoding;
- (BOOL)supportsAVFCapture;
- (BOOL)supportsCompressedPixelFormat;
- (BOOL)supportsDecodingSquareCameraVideo;
- (BOOL)supportsDedicatedSystemAudioStream;
- (BOOL)supportsFilteredScreenCapture;
- (BOOL)supportsHEIFEncoding;
- (BOOL)supportsMultiway1080pStream;
- (BOOL)supportsMultiway720pStream;
- (BOOL)supportsOutOfProcessAudioDecoding;
- (BOOL)supportsOutOfProcessVideoDecoding;
- (BOOL)supportsScreenCapture;
- (BOOL)supportsSystemAudioTap;
- (BOOL)useSoftFramerateSwitching;
- (NSArray)supportedVideoPayloads;
- (NSString)machineName;
- (VCHardwareSettingsMac)init;
- (double)previewPreferredAspectRatio;
- (id)_getCPUTypeStringForMachineType:(int)a3;
- (id)initForDevice:(id)a3;
- (id)queryBoardId;
- (int)_getCPUFamilyType;
- (int)hardwareScore;
- (int64_t)screenShareCapabilities;
- (unint64_t)maxScreenEncodingSizeSupported;
- (unsigned)hwEncoderEnterBitrate;
- (unsigned)hwEncoderExitBitrate;
- (unsigned)maxActiveScreenEncoders;
- (unsigned)maxActiveVideoDecoders;
- (unsigned)maxActiveVideoEncoders;
- (unsigned)maxDisplayRefreshRate;
- (unsigned)maxFpsCameraCaptureDuringSharing;
- (unsigned)maxFrameRateSupportedScreenShare;
- (unsigned)maxMultiwayFramerateSupported;
- (unsigned)maxOneToOneFramerateSupported;
- (unsigned)maxRemoteParticipants30fps;
- (unsigned)screenHeight;
- (unsigned)screenWidth;
- (void)addPixelFormat;
- (void)dealloc;
- (void)setupMachineName;
@end

@implementation VCHardwareSettingsMac

- (VCHardwareSettingsMac)init
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)VCHardwareSettingsMac;
  v2 = [(VCHardwareSettings *)&v18 init];
  v3 = v2;
  if (v2)
  {
    v2->_BOOL isGVAEncoderAvailable = [(VCHardwareSettingsMac *)v2 canDoHiDefEncoding];
    v3->_int mhrtz = VCCPUCount();
    v3->_int isG5 = ProcessorSpeedMHz();
    v3->_int hardwareScore = hasG5();
    v3->_int cpuFamily = MachineType();
    [(VCHardwareSettingsMac *)v3 setupMachineName];
    v3->_int numProcessors = [(VCHardwareSettingsMac *)v3 _getCPUFamilyType];
    v3->_cpuType = (NSString *)[(VCHardwareSettingsMac *)v3 _getCPUTypeStringForMachineType:v3->_cpuFamily];
    v3->_boardId = (NSData *)[(VCHardwareSettingsMac *)v3 queryBoardId];
    [(VCHardwareSettingsMac *)v3 addPixelFormat];
    [(VCHardwareSettingsMac *)v3 isGVAEncoderAvailable];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int supportHEVC = v3->super._supportHEVC;
        BOOL supportVCPEncoder = v3->super._supportVCPEncoder;
        int machineType_low = LOBYTE(v3->_machineType);
        machineName = v3->_machineName;
        int cpuFamily = v3->_cpuFamily;
        cpuType = v3->_cpuType;
        int numProcessors = v3->_numProcessors;
        int isG5 = v3->_isG5;
        int hardwareScore = v3->_hardwareScore;
        int mhrtz = v3->_mhrtz;
        BOOL isGVAEncoderAvailable = v3->_isGVAEncoderAvailable;
        *(_DWORD *)buf = 136318466;
        uint64_t v20 = v4;
        __int16 v21 = 2080;
        v22 = "-[VCHardwareSettingsMac init]";
        __int16 v23 = 1024;
        int v24 = 100;
        __int16 v25 = 1024;
        int v26 = supportHEVC;
        __int16 v27 = 1024;
        BOOL v28 = supportVCPEncoder;
        __int16 v29 = 1024;
        int v30 = machineType_low;
        __int16 v31 = 2112;
        v32 = machineName;
        __int16 v33 = 1024;
        int v34 = cpuFamily;
        __int16 v35 = 2112;
        v36 = cpuType;
        __int16 v37 = 1024;
        int v38 = numProcessors;
        __int16 v39 = 1024;
        int v40 = isG5;
        __int16 v41 = 1024;
        int v42 = hardwareScore;
        __int16 v43 = 1024;
        int v44 = mhrtz;
        __int16 v45 = 1024;
        BOOL v46 = isGVAEncoderAvailable;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d { %d, %d, %d, @\"%@\", 0x%x, @\"%@\", 0x%08x, %d, %d, %d, %d }", buf, 0x66u);
      }
    }
  }
  return v3;
}

- (id)initForDevice:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(VCHardwareSettingsMac *)self init];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCHardwareSettingsMac initForDevice:](v6, v7);
      }
    }
    goto LABEL_11;
  }
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  if ((VCVirtualHardwareConfigurations_OSXConfigurationForDevice(a3, (uint64_t)&v10) & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        [(VCHardwareSettingsMac *)v8 initForDevice:v9];
      }
    }
LABEL_11:

    return 0;
  }

  v4->_machineName = (NSString *)[*((id *)&v10 + 1) copy];
  v4->_int cpuFamily = v11;
  v4->_cpuType = (NSString *)*((void *)&v11 + 1);
  v4->_int numProcessors = v12;
  *(void *)&v4->_int isG5 = *(void *)((char *)&v12 + 4);
  v4->_int mhrtz = HIDWORD(v12);
  v4->_BOOL isGVAEncoderAvailable = v13;
  LOBYTE(v4->_machineType) = BYTE2(v10);
  *(&v4->_isGVAEncoderAvailable + 1) = 1;
  v4->_screenWidth = HIDWORD(v13);
  v4->_screenHeight = v14;
  v4->super._supportVCPEncoderInitialized = 1;
  v4->super._BOOL supportVCPEncoder = BYTE1(v10);
  v4->super._int supportHEVC = v10;
  [(NSMutableSet *)v4->super._pixelFormatCollections addObject:&unk_1F3DC2CA0];
  [(NSMutableSet *)v4->super._pixelFormatCollections addObject:&unk_1F3DC2CB8];
  return v4;
}

+ (id)virtualHardwareSettings:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (virtualHardwareSettings___virtualHardwareSettingsDeviceA)
  {
    if (objc_msgSend(a3, "isEqual:", objc_msgSend((id)virtualHardwareSettings___virtualHardwareSettingsDeviceA, "machineName")))
    {
      return (id)virtualHardwareSettings___virtualHardwareSettingsDeviceA;
    }
    else if (virtualHardwareSettings___virtualHardwareSettingsDeviceB)
    {
      if (objc_msgSend(a3, "isEqual:", objc_msgSend((id)virtualHardwareSettings___virtualHardwareSettingsDeviceB, "machineName")))
      {
        return (id)virtualHardwareSettings___virtualHardwareSettingsDeviceB;
      }
      else
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          long long v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v11 = 136315650;
            uint64_t v12 = v9;
            __int16 v13 = 2080;
            uint64_t v14 = "+[VCHardwareSettingsMac virtualHardwareSettings:]";
            __int16 v15 = 1024;
            int v16 = 177;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Clearing existing virtual hardware settings.", (uint8_t *)&v11, 0x1Cu);
          }
        }

        virtualHardwareSettings___virtualHardwareSettingsDeviceA = 0;
        virtualHardwareSettings___virtualHardwareSettingsDeviceB = 0;
        return +[VCHardwareSettingsMac virtualHardwareSettings:a3];
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 136315906;
          uint64_t v12 = v7;
          __int16 v13 = 2080;
          uint64_t v14 = "+[VCHardwareSettingsMac virtualHardwareSettings:]";
          __int16 v15 = 1024;
          int v16 = 167;
          __int16 v17 = 2112;
          id v18 = a3;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Initializing new virtual hardware settings B for device=%@", (uint8_t *)&v11, 0x26u);
        }
      }
      id result = [[VCHardwareSettingsMac alloc] initForDevice:a3];
      virtualHardwareSettings___virtualHardwareSettingsDeviceB = (uint64_t)result;
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
        uint64_t v14 = "+[VCHardwareSettingsMac virtualHardwareSettings:]";
        __int16 v15 = 1024;
        int v16 = 157;
        __int16 v17 = 2112;
        id v18 = a3;
        _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Initializing new virtual hardware settings A for device=%@", (uint8_t *)&v11, 0x26u);
      }
    }
    id result = [[VCHardwareSettingsMac alloc] initForDevice:a3];
    virtualHardwareSettings___virtualHardwareSettingsDeviceA = (uint64_t)result;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCHardwareSettingsMac;
  [(VCHardwareSettings *)&v3 dealloc];
}

- (void)setupMachineName
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  memset(v9, 0, sizeof(v9));
  size_t v8 = 64;
  if (!sysctlbyname("hw.model", v9, &v8, 0, 0))
  {
    uint64_t v7 = 0;
    self->_machineName = (NSString *)[[NSString alloc] initWithUTF8String:v9];
    objc_super v3 = (void *)[MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^([^0-9]+)([0-9]+),([0-9]+)$" options:0 error:&v7];
    machineName = self->_machineName;
    uint64_t v5 = [(NSString *)machineName length];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __41__VCHardwareSettingsMac_setupMachineName__block_invoke;
    v6[3] = &unk_1E6DB4428;
    v6[4] = self;
    objc_msgSend(v3, "enumerateMatchesInString:options:range:usingBlock:", machineName, 0, 0, v5, v6);
  }
}

uint64_t __41__VCHardwareSettingsMac_setupMachineName__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 80);
  uint64_t v5 = [a2 rangeAtIndex:1];
  *(void *)(*(void *)(a1 + 32) + 112) = (id)objc_msgSend(v4, "substringWithRange:", v5, v6);
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 80);
  uint64_t v8 = [a2 rangeAtIndex:2];
  *(_DWORD *)(*(void *)(a1 + 32) + 120) = objc_msgSend((id)objc_msgSend(v7, "substringWithRange:", v8, v9), "intValue");
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 80);
  uint64_t v11 = [a2 rangeAtIndex:3];
  uint64_t result = objc_msgSend((id)objc_msgSend(v10, "substringWithRange:", v11, v12), "intValue");
  *(_DWORD *)(*(void *)(a1 + 32) + 124) = result;
  return result;
}

- (int)_getCPUFamilyType
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v11 = -1431655766;
  size_t v10 = 4;
  int v2 = sysctlbyname("hw.cpufamily", &v11, &v10, 0, 0);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v2)
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      int result = 0;
      if (!v6) {
        return result;
      }
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v4;
      __int16 v14 = 2080;
      __int16 v15 = "-[VCHardwareSettingsMac _getCPUFamilyType]";
      __int16 v16 = 1024;
      int v17 = 225;
      __int16 v18 = 1024;
      int v19 = v11;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCHardwareSettingsMac: Your machine arch is CPUFAMILY_UNKNOWN, 0x%x", buf, 0x22u);
    }
    return 0;
  }
  else
  {
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        __int16 v15 = "-[VCHardwareSettingsMac _getCPUFamilyType]";
        __int16 v16 = 1024;
        int v17 = 221;
        __int16 v18 = 1024;
        int v19 = v11;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCHardwareSettingsMac: Your machine arch is 0x%x", buf, 0x22u);
      }
    }
    return v11;
  }
}

- (id)_getCPUTypeStringForMachineType:(int)a3
{
  if ((a3 & 0x400) != 0)
  {
LABEL_8:
    if (VCPayloadUtils_SupportsShortREDForPayload() == 80) {
      return @"Intel-K65";
    }
    else {
      return @"Intel";
    }
  }
  objc_super v3 = @"G5";
  if ((a3 & 0x100) == 0)
  {
    objc_super v3 = @"G4";
    if ((a3 & 2) == 0)
    {
      if (a3) {
        return @"G3";
      }
      int VectorTypeAvailable = GetVectorTypeAvailable();
      if (VectorTypeAvailable < 1) {
        return @"G3";
      }
      if ((VectorTypeAvailable & 1) == 0)
      {
        if ((VectorTypeAvailable & 5) == 0) {
          return &stru_1F3D3E450;
        }
        goto LABEL_8;
      }
      if (hasG5()) {
        return @"G5";
      }
    }
  }
  return v3;
}

- (BOOL)_isMachineNewerThanSandybridge:(int)a3
{
  BOOL result = 0;
  if (a3 > 1463508715)
  {
    if (a3 > 2009171117)
    {
      if (a3 == 2009171118) {
        return result;
      }
      int v4 = 2028621756;
    }
    else
    {
      if (a3 == 1463508716) {
        return result;
      }
      int v4 = 1801080018;
    }
  }
  else if (a3 > -310978391)
  {
    if (a3 == -310978390) {
      return result;
    }
    int v4 = 1418770316;
  }
  else
  {
    if (a3 == -1439483605) {
      return result;
    }
    int v4 = -823913143;
  }
  if (a3 != v4) {
    return 1;
  }
  return result;
}

- (BOOL)_isModel:(id)a3
{
  return -[NSString compare:options:range:](-[VCHardwareSettingsMac machineName](self, "machineName"), "compare:options:range:", a3, 0, 0, [a3 length]) == NSOrderedSame;
}

- (BOOL)isGVAEncoderAvailable
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!*(&self->_isGVAEncoderAvailable + 1))
  {
    int v4 = dlopen("/System/Library/PrivateFrameworks/AppleGVA.framework/Versions/Current/AppleGVA", 1);
    if (v4)
    {
      uint64_t v5 = v4;
      BOOL v6 = (uint64_t (*)(void))dlsym(v4, "AVFQTXENC_GetEncodeAvailability");
      if (!dlerror()) {
        LOBYTE(self->_machineType) = v6();
      }
      dlclose(v5);
    }
    p_machineType = &self->_machineType;
    int machineType_low = LOBYTE(self->_machineType);
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (machineType_low)
    {
      if (ErrorLogLevelForModule < 7) {
        goto LABEL_15;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      size_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      int v14 = 136315650;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      int v17 = "-[VCHardwareSettingsMac isGVAEncoderAvailable]";
      __int16 v18 = 1024;
      int v19 = 310;
      int v11 = " [%s] %s:%d VCHardwareSettingsMac: HW encoder is available on this platform.";
    }
    else
    {
      if (ErrorLogLevelForModule < 7) {
        goto LABEL_15;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      size_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      int v14 = 136315650;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      int v17 = "-[VCHardwareSettingsMac isGVAEncoderAvailable]";
      __int16 v18 = 1024;
      int v19 = 312;
      int v11 = " [%s] %s:%d VCHardwareSettingsMac: HW encoder is NOT available on this platform.";
    }
    _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0x1Cu);
LABEL_15:
    *(&self->_isGVAEncoderAvailable + 1) = 1;
    return *(unsigned char *)p_machineType;
  }
  p_machineType = &self->_machineType;
  return *(unsigned char *)p_machineType;
}

- (BOOL)canDoHiDefEncoding
{
  if (![(VCHardwareSettingsMac *)self _isModel:@"MacBookAir"]
    || (BOOL v3 = [(VCHardwareSettingsMac *)self _isMachineNewerThanSandybridge:[(VCHardwareSettingsMac *)self _getCPUFamilyType]]))
  {
    if ([(VCHardwareSettingsMac *)self isGVAEncoderAvailable]
      || [(VCHardwareSettingsMac *)self _isModel:@"MacBookPro8"]
      || [(VCHardwareSettingsMac *)self _isModel:@"MacPro"]
      && -[NSString intValue](-[NSString substringFromIndex:](-[VCHardwareSettingsMac machineName](self, "machineName"), "substringFromIndex:", [@"MacPro" length]), "intValue") > 5)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(VCHardwareSettingsMac *)self _isModel:@"iMacPro"];
    }
  }
  return v3;
}

- (BOOL)canDoHEVC
{
  BOOL result = 0;
  int numProcessors = self->_numProcessors;
  if (numProcessors <= 1418770315)
  {
    if (numProcessors <= -310978391)
    {
      BOOL v5 = numProcessors == -1439483605;
      int v6 = -823913143;
    }
    else
    {
      BOOL v5 = numProcessors == -310978390 || numProcessors == 280134364;
      int v6 = 526772277;
    }
  }
  else if (numProcessors > 1801080017)
  {
    BOOL v5 = numProcessors == 1801080018 || numProcessors == 2009171118;
    int v6 = 2028621756;
  }
  else
  {
    BOOL v5 = numProcessors == 1418770316 || numProcessors == 1463508716;
    int v6 = 1479463068;
  }
  if (!v5 && numProcessors != v6) {
    return 1;
  }
  return result;
}

- (BOOL)canDoHiDefDecoding
{
  if ([(VCHardwareSettingsMac *)self _isModel:@"MacBookPro7,1"]
    || [(VCHardwareSettingsMac *)self _isModel:@"MacBookPro6,2"]
    || [(VCHardwareSettingsMac *)self _isModel:@"iMac10,1"])
  {
    return 1;
  }

  return [(VCHardwareSettingsMac *)self _isModel:@"iMac11,1"];
}

- (BOOL)supports1080pEncoding
{
  return VCHardwareSettingsMac_CompareCPUFamilies(self->_numProcessors, 939270559) != -1;
}

- (BOOL)supports1080pDecoding
{
  return VCHardwareSettingsMac_CompareCPUFamilies(self->_numProcessors, 939270559) != -1;
}

- (BOOL)isSpatialAudioSupported
{
  if ([(NSString *)self->_modelName compare:@"MacBookPro" options:1] == NSOrderedSame)
  {
    unsigned int v4 = 14;
    return self->_modelVersion > v4;
  }
  if ([(NSString *)self->_modelName compare:@"MacBookAir" options:1] == NSOrderedSame) {
    goto LABEL_8;
  }
  if ([(NSString *)self->_modelName compare:@"iMac" options:1] == NSOrderedSame)
  {
    unsigned int v4 = 19;
    return self->_modelVersion > v4;
  }
  if ([(NSString *)self->_modelName compare:@"Macmini" options:1] == NSOrderedSame)
  {
LABEL_8:
    unsigned int v4 = 7;
    return self->_modelVersion > v4;
  }
  BOOL v3 = 1;
  if ([(NSString *)self->_modelName compare:@"MacPro" options:1] == NSOrderedSame)
  {
    unsigned int v4 = 6;
    return self->_modelVersion > v4;
  }
  return v3;
}

+ (id)sharedInstance
{
  BOOL v3 = objc_opt_class();
  objc_sync_enter(v3);
  if (VRTraceIsInternalOSInstalled()
    && (unsigned int v4 = [+[VCDefaults sharedInstance] virtualHardware]) != 0)
  {
    BOOL v5 = (void *)[a1 virtualHardwareSettings:v4];
    objc_sync_exit(v3);
  }
  else
  {
    if (!sharedInstance__hardwareSettings) {
      sharedInstance__hardwareSettings = objc_alloc_init(VCHardwareSettingsMac);
    }
    objc_sync_exit(v3);
    return (id)sharedInstance__hardwareSettings;
  }
  return v5;
}

- (BOOL)isMacBookWVGA
{
  if ([(VCHardwareSettingsMac *)self _isModel:@"MacBook8"]
    || [(VCHardwareSettingsMac *)self _isModel:@"MacBook9"])
  {
    return 1;
  }

  return [(VCHardwareSettingsMac *)self _isModel:@"MacBook10"];
}

- (BOOL)isMacPro
{
  return [(VCHardwareSettingsMac *)self _isModel:@"MacPro"];
}

- (BOOL)isIMac
{
  return [(VCHardwareSettingsMac *)self _isModel:@"iMac"];
}

- (BOOL)isIMacPro
{
  return [(VCHardwareSettingsMac *)self _isModel:@"iMacPro"];
}

- (BOOL)isMacBookAir
{
  return [(VCHardwareSettingsMac *)self _isModel:@"MacBookAir"];
}

- (BOOL)isMacmini
{
  return [(VCHardwareSettingsMac *)self _isModel:@"Macmini"];
}

- (BOOL)isAppleSiliconMac
{
  return 0;
}

- (unsigned)hwEncoderExitBitrate
{
  unsigned int result = 700000;
  int numProcessors = self->_numProcessors;
  if (numProcessors <= 1463508715)
  {
    if (numProcessors > -310978391)
    {
      BOOL v5 = numProcessors == -310978390;
      int v6 = 1418770316;
    }
    else
    {
      BOOL v5 = numProcessors == -1439483605;
      int v6 = -823913143;
    }
    goto LABEL_13;
  }
  if (numProcessors > 1801080017)
  {
    BOOL v5 = numProcessors == 1801080018 || numProcessors == 2009171118;
    int v6 = 2028621756;
LABEL_13:
    if (!v5 && numProcessors != v6) {
      return 300000;
    }
    return result;
  }
  if (numProcessors != 1463508716)
  {
    if (numProcessors == 1479463068) {
      return 450000;
    }
    return 300000;
  }
  return result;
}

- (unsigned)hwEncoderEnterBitrate
{
  unsigned int result = 1000000;
  int numProcessors = self->_numProcessors;
  if (numProcessors <= 1463508715)
  {
    if (numProcessors > -310978391)
    {
      BOOL v5 = numProcessors == -310978390;
      int v6 = 1418770316;
    }
    else
    {
      BOOL v5 = numProcessors == -1439483605;
      int v6 = -823913143;
    }
    goto LABEL_13;
  }
  if (numProcessors > 1801080017)
  {
    BOOL v5 = numProcessors == 1801080018 || numProcessors == 2009171118;
    int v6 = 2028621756;
LABEL_13:
    if (!v5 && numProcessors != v6) {
      return 450000;
    }
    return result;
  }
  if (numProcessors != 1463508716)
  {
    if (numProcessors == 1479463068) {
      return 600000;
    }
    return 450000;
  }
  return result;
}

- (NSString)machineName
{
  return self->_machineName;
}

- (int)hardwareScore
{
  int result = *(&self->_hardwareScore + 1);
  if (!result)
  {
    BOOL v4 = [(VCHardwareSettingsMac *)self _isMachineNewerThanSandybridge:self->_numProcessors];
    if (![(NSString *)self->_cpuType isEqual:@"Intel"])
    {
      int result = -1;
LABEL_43:
      *(&self->_hardwareScore + 1) = result;
      return result;
    }
    int v5 = *(&self->_hardwareScore + 1);
    *(&self->_hardwareScore + 1) = v5 + 5;
    unsigned int isG5 = self->_isG5;
    if (isG5 >= 0xBB9) {
      int v7 = 17;
    }
    else {
      int v7 = 15;
    }
    if (isG5 >= 0xA29) {
      int v8 = v7;
    }
    else {
      int v8 = 13;
    }
    if (isG5 >= 0x835) {
      int v9 = v8;
    }
    else {
      int v9 = 11;
    }
    if (isG5 >= 0x709) {
      int v10 = v9;
    }
    else {
      int v10 = 9;
    }
    if ((int)isG5 >= 801) {
      int v11 = v10;
    }
    else {
      int v11 = 7;
    }
    int v12 = v5 + v11;
    *(&self->_hardwareScore + 1) = v12;
    int mhrtz = self->_mhrtz;
    if (mhrtz <= 7)
    {
      if (mhrtz <= 3)
      {
        if (mhrtz < 2) {
          goto LABEL_26;
        }
        int v14 = 2;
      }
      else
      {
        int v14 = 8;
      }
    }
    else
    {
      int v14 = 16;
    }
    *(&self->_hardwareScore + 1) = v12 + v14;
LABEL_26:
    BOOL v15 = [(VCHardwareSettingsMac *)self _isModel:@"MacBookAir"];
    int numProcessors = self->_numProcessors;
    if (v15)
    {
      char v17 = numProcessors == 1418770316 || v4;
      if (v17) {
        int v18 = 21;
      }
      else {
        int v18 = *(&self->_hardwareScore + 1) - 2;
      }
    }
    else if (numProcessors == 1418770316 || numProcessors == 1463508716 || numProcessors == 1801080018 || v4)
    {
      int v18 = 2 * *(&self->_hardwareScore + 1);
    }
    else
    {
      if (numProcessors != 2028621756)
      {
LABEL_39:
        if (self->_isGVAEncoderAvailable)
        {
          int result = 30;
        }
        else
        {
          int result = *(&self->_hardwareScore + 1);
          if (result < 26) {
            return result;
          }
          int result = 25;
        }
        goto LABEL_43;
      }
      int v18 = (int)((double)*(&self->_hardwareScore + 1) * 1.5);
    }
    *(&self->_hardwareScore + 1) = v18;
    goto LABEL_39;
  }
  return result;
}

- (BOOL)useSoftFramerateSwitching
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"MacBookAir4,1", @"MacBookAir5,1", @"MacBookPro10,2", 0);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([(NSString *)[(VCHardwareSettingsMac *)self machineName] isEqualToString:*(void *)(*((void *)&v11 + 1) + 8 * i)])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v10 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (unsigned)maxDisplayRefreshRate
{
  return 60;
}

- (unsigned)maxActiveVideoEncoders
{
  int numProcessors = self->_numProcessors;
  unsigned int result = 3;
  if (numProcessors > 1418770315)
  {
    if (numProcessors > 1801080017)
    {
      BOOL v4 = numProcessors == 1801080018 || numProcessors == 2009171118;
      int v5 = 2028621756;
    }
    else
    {
      BOOL v4 = numProcessors == 1418770316 || numProcessors == 1463508716;
      int v5 = 1479463068;
    }
LABEL_22:
    if (!v4 && numProcessors != v5) {
      return 6;
    }
    return result;
  }
  if (numProcessors <= 280134363)
  {
    BOOL v4 = numProcessors == -1439483605 || numProcessors == -823913143;
    int v5 = -310978390;
    goto LABEL_22;
  }
  if (numProcessors != 280134364 && numProcessors != 526772277)
  {
    if (numProcessors == 939270559) {
      return 4;
    }
    return 6;
  }
  return result;
}

- (BOOL)supportsMultiway720pStream
{
  return 1;
}

- (unsigned)maxOneToOneFramerateSupported
{
  return 60;
}

- (BOOL)isCaptionsSupported
{
  return 0;
}

- (unsigned)maxMultiwayFramerateSupported
{
  return 30;
}

- (unsigned)maxActiveVideoDecoders
{
  unsigned int result = [+[VCDefaults sharedInstance] maxActiveVideoDecoders];
  if (result != -1) {
    return result;
  }
  if ([(VCHardwareSettingsMac *)self isIMacPro]) {
    return 24;
  }
  int numProcessors = self->_numProcessors;
  unsigned int result = 4;
  if (numProcessors > 1418770315)
  {
    if (numProcessors > 1801080017)
    {
      BOOL v5 = numProcessors == 1801080018 || numProcessors == 2009171118;
      int v6 = 2028621756;
    }
    else
    {
      BOOL v5 = numProcessors == 1418770316 || numProcessors == 1463508716;
      int v6 = 1479463068;
    }
LABEL_25:
    if (!v5 && numProcessors != v6) {
      return 24;
    }
    return result;
  }
  if (numProcessors <= 280134363)
  {
    BOOL v5 = numProcessors == -1439483605 || numProcessors == -823913143;
    int v6 = -310978390;
    goto LABEL_25;
  }
  if (numProcessors != 280134364 && numProcessors != 526772277)
  {
    if (numProcessors != 939270559) {
      return 24;
    }
    return 9;
  }
  return result;
}

- (BOOL)supportsCompressedPixelFormat
{
  return 0;
}

- (BOOL)isDeviceLargeScreen
{
  return 1;
}

- (BOOL)supportsHEIFEncoding
{
  return 1;
}

- (void)addPixelFormat
{
  [(NSMutableSet *)self->super._pixelFormatCollections addObject:&unk_1F3DC2CA0];
  [(NSMutableSet *)self->super._pixelFormatCollections addObject:&unk_1F3DC2CB8];
  if ([(VCHardwareSettingsMac *)self isAppleSiliconMac])
  {
    [(NSMutableSet *)self->super._pixelFormatCollections addObject:&unk_1F3DC2CD0];
    [(NSMutableSet *)self->super._pixelFormatCollections addObject:&unk_1F3DC2CE8];
    [(NSMutableSet *)self->super._pixelFormatCollections addObject:&unk_1F3DC2D00];
    pixelFormatCollections = self->super._pixelFormatCollections;
    [(NSMutableSet *)pixelFormatCollections addObject:&unk_1F3DC2D18];
  }
}

- (BOOL)isPixelFormatAvailable
{
  return [(NSMutableSet *)self->super._pixelFormatCollections count] != 0;
}

+ (int64_t)deviceClass
{
  return 0;
}

- (unsigned)maxRemoteParticipants30fps
{
  if ([(VCHardwareSettingsMac *)self isIMacPro]) {
    return 32;
  }
  int numProcessors = self->_numProcessors;
  unsigned int result = 4;
  if (numProcessors <= 1418770315)
  {
    if (numProcessors <= -310978391)
    {
      BOOL v5 = numProcessors == -1439483605;
      int v6 = -823913143;
    }
    else
    {
      BOOL v5 = numProcessors == -310978390 || numProcessors == 280134364;
      int v6 = 526772277;
    }
  }
  else if (numProcessors > 1801080017)
  {
    BOOL v5 = numProcessors == 1801080018 || numProcessors == 2009171118;
    int v6 = 2028621756;
  }
  else
  {
    BOOL v5 = numProcessors == 1418770316 || numProcessors == 1463508716;
    int v6 = 1479463068;
  }
  if (!v5 && numProcessors != v6) {
    return 32;
  }
  return result;
}

- (unsigned)maxFpsCameraCaptureDuringSharing
{
  if ([(VCHardwareSettingsMac *)self isAppleSiliconMac]) {
    return 30;
  }
  unsigned int v3 = 30;
  if (![(VCHardwareSettingsMac *)self isMacPro])
  {
    if ([(VCHardwareSettingsMac *)self isIMacPro]) {
      return 30;
    }
    else {
      return 15;
    }
  }
  return v3;
}

- (BOOL)supportsAVFCapture
{
  return 1;
}

- (BOOL)supportsMultiway1080pStream
{
  BOOL v2 = [(VCHardwareSettingsMac *)self isAppleSiliconMac];

  return VCDefaults_GetBoolValueForKey(@"supportsMultiway1080pStream", v2);
}

- (BOOL)supportsDecodingSquareCameraVideo
{
  return 0;
}

- (unsigned)screenWidth
{
  unsigned int result = self->_screenWidth;
  if (!result)
  {
    [(VCHardwareSettingsMac *)self _initializeScreenDimension];
    return self->_screenWidth;
  }
  return result;
}

- (BOOL)shouldOverrideGPUMuxing
{
  if ([(VCHardwareSettingsMac *)self _isModel:@"MacBookPro13,3"]) {
    return 1;
  }

  return [(VCHardwareSettingsMac *)self _isModel:@"MacBookPro14,3"];
}

- (unsigned)screenHeight
{
  unsigned int result = self->_screenHeight;
  if (!result)
  {
    [(VCHardwareSettingsMac *)self _initializeScreenDimension];
    return self->_screenHeight;
  }
  return result;
}

- (double)previewPreferredAspectRatio
{
  return 1.77777778;
}

- (BOOL)supportsFilteredScreenCapture
{
  BOOL result = 0;
  int numProcessors = self->_numProcessors;
  if (numProcessors <= 1418770315)
  {
    if (numProcessors <= -310978391)
    {
      BOOL v5 = numProcessors == -1439483605;
      int v6 = -823913143;
    }
    else
    {
      BOOL v5 = numProcessors == -310978390 || numProcessors == 280134364;
      int v6 = 526772277;
    }
  }
  else if (numProcessors > 1801080017)
  {
    BOOL v5 = numProcessors == 1801080018 || numProcessors == 2009171118;
    int v6 = 2028621756;
  }
  else
  {
    BOOL v5 = numProcessors == 1418770316 || numProcessors == 1463508716;
    int v6 = 1479463068;
  }
  if (!v5 && numProcessors != v6) {
    return 1;
  }
  return result;
}

- (unint64_t)maxScreenEncodingSizeSupported
{
  unint64_t result = 2073600;
  int numProcessors = self->_numProcessors;
  if (numProcessors > 943936838)
  {
    if (numProcessors <= 1479463067)
    {
      BOOL v5 = numProcessors == 943936839 || numProcessors == 1418770316;
      int v6 = 1463508716;
    }
    else if (numProcessors > 2009171117)
    {
      BOOL v5 = numProcessors == 2009171118;
      int v6 = 2028621756;
    }
    else
    {
      BOOL v5 = numProcessors == 1479463068;
      int v6 = 1801080018;
    }
  }
  else if (numProcessors <= 260141637)
  {
    BOOL v5 = numProcessors == -1439483605 || numProcessors == -823913143;
    int v6 = -310978390;
  }
  else if (numProcessors > 526772276)
  {
    BOOL v5 = numProcessors == 526772277;
    int v6 = 939270559;
  }
  else
  {
    BOOL v5 = numProcessors == 260141638;
    int v6 = 280134364;
  }
  if (!v5 && numProcessors != v6) {
    return 5603328;
  }
  return result;
}

- (unsigned)maxActiveScreenEncoders
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int numProcessors = self->_numProcessors;
  unsigned int v3 = 2;
  if (numProcessors > 943936838)
  {
    if (numProcessors <= 1479463067)
    {
      BOOL v4 = numProcessors == 943936839 || numProcessors == 1418770316;
      int v5 = 1463508716;
    }
    else if (numProcessors > 2009171117)
    {
      BOOL v4 = numProcessors == 2028621756;
      int v5 = 2009171118;
    }
    else
    {
      BOOL v4 = numProcessors == 1479463068;
      int v5 = 1801080018;
    }
  }
  else if (numProcessors <= 260141637)
  {
    BOOL v4 = numProcessors == -1439483605 || numProcessors == -823913143;
    int v5 = -310978390;
  }
  else if (numProcessors > 526772276)
  {
    BOOL v4 = numProcessors == 526772277;
    int v5 = 939270559;
  }
  else
  {
    BOOL v4 = numProcessors == 260141638;
    int v5 = 280134364;
  }
  BOOL v6 = v4 || numProcessors == v5;
  if (v6 && [(VCHardwareSettingsMac *)self isMacBookAir])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6)
    {
      return 1;
    }
    else
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      BOOL v8 = *MEMORY[0x1E4F47A50];
      unsigned int v3 = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 136315906;
        uint64_t v11 = v7;
        __int16 v12 = 2080;
        long long v13 = "-[VCHardwareSettingsMac maxActiveScreenEncoders]";
        __int16 v14 = 1024;
        int v15 = 985;
        __int16 v16 = 1024;
        int v17 = 1;
        _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing max screen encoders=%d", (uint8_t *)&v10, 0x22u);
      }
    }
  }
  return v3;
}

- (unsigned)maxFrameRateSupportedScreenShare
{
  int numProcessors = self->_numProcessors;
  if (numProcessors > 943936838)
  {
    if (numProcessors <= 1479463067)
    {
      if (numProcessors == 943936839)
      {
        if (![(VCHardwareSettingsMac *)self isMacBookAir]) {
          return 60;
        }
        return 30;
      }
      BOOL v3 = numProcessors == 1418770316;
      int v4 = 1463508716;
    }
    else if (numProcessors > 2009171117)
    {
      BOOL v3 = numProcessors == 2028621756;
      int v4 = 2009171118;
    }
    else
    {
      BOOL v3 = numProcessors == 1479463068;
      int v4 = 1801080018;
    }
    goto LABEL_20;
  }
  if (numProcessors <= 260141637)
  {
    BOOL v3 = numProcessors == -1439483605 || numProcessors == -823913143;
    int v4 = -310978390;
LABEL_20:
    if (!v3 && numProcessors != v4) {
      return 60;
    }
    goto LABEL_25;
  }
  if (numProcessors > 526772276)
  {
    if (numProcessors != 526772277)
    {
      if (numProcessors != 939270559) {
        return 60;
      }
      return 30;
    }
LABEL_25:
    if ([(VCHardwareSettingsMac *)self isMacBookAir]) {
      return 10;
    }
    return 30;
  }
  if (numProcessors != 260141638)
  {
    if (numProcessors != 280134364) {
      return 60;
    }
    goto LABEL_25;
  }
  return 30;
}

- (BOOL)shouldEnforceScreenFrameRateLimit
{
  return [(VCHardwareSettingsMac *)self _isModel:@"MacBookPro18"];
}

- (id)queryBoardId
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  io_iterator_t iterator = 0;
  mach_port_t v2 = *MEMORY[0x1E4F2EF00];
  io_registry_entry_t RootEntry = IORegistryGetRootEntry(*MEMORY[0x1E4F2EF00]);
  if (!RootEntry) {
    return 0;
  }
  io_object_t v4 = RootEntry;
  if (IORegistryCreateIterator(v2, "IOService", 0, &iterator) || (io_object_t v7 = IOIteratorNext(iterator)) == 0)
  {
LABEL_3:
    CFTypeRef v5 = 0;
  }
  else
  {
    io_object_t v8 = v7;
    while (1)
    {
      *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)((char *)v17 + 9) = v9;
      long long v16 = v9;
      v17[0] = v9;
      long long v14 = v9;
      long long v15 = v9;
      long long v12 = v9;
      long long v13 = v9;
      strcpy(className, "IOPlatformExpertDevice");
      if (IOObjectConformsTo(v8, className)) {
        break;
      }
      IOObjectRelease(v8);
      io_object_t v8 = IOIteratorNext(iterator);
      if (!v8) {
        goto LABEL_3;
      }
    }
    CFTypeRef v5 = IORegistryEntrySearchCFProperty(v8, "IOService", @"board-id", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1u);
    IOObjectRelease(v8);
  }
  if (iterator) {
    IOObjectRelease(iterator);
  }
  IOObjectRelease(v4);
  if (v5) {
    return (id)(id)CFMakeCollectable(v5);
  }
  else {
    return 0;
  }
}

- (NSArray)supportedVideoPayloads
{
  BOOL v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  [(NSArray *)v3 addObject:&unk_1F3DC2D30];
  [(NSArray *)v3 addObject:&unk_1F3DC2D48];
  if ([(VCHardwareSettings *)self supportHEVC]) {
    [(NSArray *)v3 addObject:&unk_1F3DC2D60];
  }
  return v3;
}

- (BOOL)limitCameraDownlinkBitrateDuringSharing
{
  return ![(VCHardwareSettingsMac *)self isAppleSiliconMac];
}

- (BOOL)supportsScreenCapture
{
  return 1;
}

- (BOOL)supportsSystemAudioTap
{
  return 1;
}

- (BOOL)supportsDedicatedSystemAudioStream
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(VCHardwareSettingsMac *)self supportsSystemAudioTap];
  if (v3)
  {
    int numProcessors = self->_numProcessors;
    LOBYTE(v3) = 1;
    if (numProcessors <= 943936838)
    {
      if (numProcessors > 260141637)
      {
        BOOL v5 = numProcessors == 260141638 || numProcessors == 280134364;
        int v6 = 526772277;
      }
      else
      {
        BOOL v5 = numProcessors == -1439483605 || numProcessors == -823913143;
        int v6 = -310978390;
      }
    }
    else if (numProcessors <= 1479463067)
    {
      BOOL v5 = numProcessors == 943936839 || numProcessors == 1418770316;
      int v6 = 1463508716;
    }
    else if (numProcessors > 2009171117)
    {
      BOOL v5 = numProcessors == 2028621756;
      int v6 = 2009171118;
    }
    else
    {
      BOOL v5 = numProcessors == 1479463068;
      int v6 = 1801080018;
    }
    if (v5 || numProcessors == v6)
    {
      if (![(VCHardwareSettingsMac *)self isMacBookAir])
      {
        LOBYTE(v3) = 1;
        return v3;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        long long v9 = *MEMORY[0x1E4F47A50];
        BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
        LOBYTE(v3) = 0;
        if (!v10) {
          return v3;
        }
        int v12 = 136315650;
        uint64_t v13 = v8;
        __int16 v14 = 2080;
        long long v15 = "-[VCHardwareSettingsMac supportsDedicatedSystemAudioStream]";
        __int16 v16 = 1024;
        int v17 = 1131;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Forcing mixed in system audio", (uint8_t *)&v12, 0x1Cu);
      }
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)disableMLScalarDuringSharing
{
  return 1;
}

- (int64_t)screenShareCapabilities
{
  return 2;
}

- (BOOL)preferPresentationTimestamp
{
  return 0;
}

+ (BOOL)isCellularTappingSupported
{
  return 0;
}

- (BOOL)isRemoteCameraSenderSupported
{
  return 0;
}

- (BOOL)isMediaRecordingSupported
{
  return 1;
}

- (BOOL)isViewPointCorrectionSupported
{
  return 0;
}

- (BOOL)isExternalCameraSupported
{
  return 1;
}

- (BOOL)supportsOutOfProcessVideoDecoding
{
  return 1;
}

- (BOOL)supportsOutOfProcessAudioDecoding
{
  return 1;
}

- (BOOL)captureFormatPrefer16by9ForSquare
{
  return 0;
}

- (void)initForDevice:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  BOOL v5 = "-[VCHardwareSettingsMac initForDevice:]";
  __int16 v6 = 1024;
  int v7 = 113;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to initialize", (uint8_t *)&v2, 0x1Cu);
}

- (void)initForDevice:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  __int16 v6 = "-[VCHardwareSettingsMac initForDevice:]";
  __int16 v7 = 1024;
  int v8 = 117;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to find configuration for virtual OSX device=%@", (uint8_t *)&v3, 0x26u);
}

@end