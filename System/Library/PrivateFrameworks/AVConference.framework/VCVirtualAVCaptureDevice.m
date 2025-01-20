@interface VCVirtualAVCaptureDevice
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMaxFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMinFrameDuration;
- (BOOL)lockForConfiguration:(id *)a3;
- (CGRect)centerStageRectOfInterest;
- (NSArray)formats;
- (NSString)deviceType;
- (VCVirtualAVCaptureDevice)initWithUniqueID:(id)a3 orientation:(int)a4;
- (id)activeFormat;
- (id)description;
- (id)deviceCode;
- (id)deviceInputs;
- (id)uniqueID;
- (int)startVirtualCapture;
- (int)stopVirtualCapture;
- (void)addDeviceInput:(id)a3;
- (void)configureResizingConverterWithFormat:(id)a3;
- (void)dealloc;
- (void)deregisterBlocksFromService;
- (void)executeBlockUnderConfigurationLock:(id)a3;
- (void)registerBlocksForService;
- (void)removeDeviceInput:(id)a3;
- (void)setActiveFormat:(id)a3;
- (void)setActiveVideoMaxFrameDuration:(id *)a3;
- (void)setActiveVideoMinFrameDuration:(id *)a3;
- (void)setCenterStageRectOfInterest:(CGRect)a3;
- (void)setDeviceType:(id)a3;
- (void)startDumpCollector;
- (void)stopDumpCollector;
- (void)unlockForConfiguration;
- (void)verifyLockForConfiguration;
@end

@implementation VCVirtualAVCaptureDevice

- (VCVirtualAVCaptureDevice)initWithUniqueID:(id)a3 orientation:(int)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v16.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(void *)v16.__opaque = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutexattr_init(&v16);
  pthread_mutexattr_settype(&v16, 2);
  pthread_mutex_init(&self->_deviceMutex, &v16);
  pthread_mutexattr_destroy(&v16);
  self->_lockCount = 0;
  self->_orientation = a4;
  v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  self->_deviceInputs = v7;
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:]();
      }
    }
    goto LABEL_27;
  }
  v8 = (NSString *)[a3 copy];
  self->_deviceUniqueID = v8;
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:]();
      }
    }
    goto LABEL_27;
  }
  v9 = [[VCVirtualAVCaptureHardware alloc] initForDevice:[(VCVirtualAVCaptureDevice *)self deviceCode]];
  self->_captureHardware = v9;
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:]();
      }
    }
    goto LABEL_27;
  }
  v10 = (void *)VCDefaults_CopyStringValueForKey(@"cannedReplay");
  self->_captureSource = [[VCCannedVideoCaptureSource alloc] initWithVideo:v10 callbackContext:self frameCallback:VCVirtualAVCaptureDevice_OnVideoFrame];

  if (!self->_captureSource)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:].cold.4();
      }
    }
    goto LABEL_27;
  }
  id v11 = [(VCVirtualAVCaptureHardware *)self->_captureHardware defaultFormatForDeviceID:self->_deviceUniqueID];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__VCVirtualAVCaptureDevice_initWithUniqueID_orientation___block_invoke;
  v15[3] = &unk_1E6DB3E40;
  v15[4] = self;
  v15[5] = v11;
  [(VCVirtualAVCaptureDevice *)self executeBlockUnderConfigurationLock:v15];
  if (!self->_activeFormat)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:].cold.5();
      }
    }
    goto LABEL_27;
  }
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  v13 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCVirtualAVCaptureDevice.xpc.commands", 0, CustomRootQueue);
  self->_xpcCommandQueue = v13;
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVirtualAVCaptureDevice initWithUniqueID:orientation:].cold.6();
      }
    }
LABEL_27:

    return 0;
  }
  [(VCVirtualAVCaptureDevice *)self registerBlocksForService];
  return self;
}

uint64_t __57__VCVirtualAVCaptureDevice_initWithUniqueID_orientation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setActiveFormat:*(void *)(a1 + 40)];
}

- (void)configureResizingConverterWithFormat:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4 = (const opaqueCMFormatDescription *)[a3 formatDescription];
  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(v4);
  CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(v4);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__VCVirtualAVCaptureDevice_configureResizingConverterWithFormat___block_invoke;
  v7[3] = &unk_1E6DB3F58;
  v7[4] = self;
  v7[5] = Dimensions;
  FourCharCode v8 = MediaSubType;
  [(VCVirtualAVCaptureDevice *)self executeBlockUnderConfigurationLock:v7];
}

void __65__VCVirtualAVCaptureDevice_configureResizingConverterWithFormat___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 192);
  if (v2
    || (*(void *)(*(void *)(a1 + 32) + 192) = [[VCImageResizingConverter alloc] initWithOutputWidth:*(unsigned int *)(a1 + 40) outputHeight:*(unsigned int *)(a1 + 44) formatType:*(unsigned int *)(a1 + 48)], (v2 = *(void **)(*(void *)(a1 + 32) + 192)) != 0))
  {
    if (([v2 ensureBufferPoolSupportsOutputWidth:*(unsigned int *)(a1 + 40) outputHeight:*(unsigned int *)(a1 + 44)] & 1) == 0&& (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v5 = *(_DWORD *)(a1 + 40);
        int v6 = *(_DWORD *)(a1 + 44);
        int v7 = 136316162;
        uint64_t v8 = v3;
        __int16 v9 = 2080;
        v10 = "-[VCVirtualAVCaptureDevice configureResizingConverterWithFormat:]_block_invoke";
        __int16 v11 = 1024;
        int v12 = 134;
        __int16 v13 = 1024;
        int v14 = v5;
        __int16 v15 = 1024;
        int v16 = v6;
        _os_log_error_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_ERROR, " [%s] %s:%d Resizing converter failed to support dimensions width=%d height=%d", (uint8_t *)&v7, 0x28u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __65__VCVirtualAVCaptureDevice_configureResizingConverterWithFormat___block_invoke_cold_1();
    }
  }
}

- (id)deviceCode
{
  v2 = (void *)VCDefaults_CopyStringValueForKey(@"virtualHardware");

  return v2;
}

- (void)startDumpCollector
{
  if (!self->_dumpCollector) {
    self->_dumpCollector = objc_alloc_init(VCVideoHardwareDumpCollector);
  }
}

- (void)stopDumpCollector
{
  self->_dumpCollector = 0;
}

- (int)startVirtualCapture
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCVirtualAVCaptureDevice-startVirtualCapture");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      __int16 v9 = "-[VCVirtualAVCaptureDevice startVirtualCapture]";
      __int16 v10 = 1024;
      int v11 = 158;
      __int16 v12 = 2048;
      __int16 v13 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCVirtualAVCaptureDevice-startVirtualCapture [%p]", (uint8_t *)&v6, 0x26u);
    }
  }
  [(VCVirtualAVCaptureDevice *)self startDumpCollector];
  return [(VCCannedVideoCaptureSource *)self->_captureSource start];
}

- (int)stopVirtualCapture
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCVirtualAVCaptureDevice-stopVirtualCapture");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCVirtualAVCaptureDevice stopVirtualCapture]";
      __int16 v11 = 1024;
      int v12 = 164;
      __int16 v13 = 2048;
      uint64_t v14 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCVirtualAVCaptureDevice-stopVirtualCapture [%p]", (uint8_t *)&v7, 0x26u);
    }
  }
  int v5 = [(VCCannedVideoCaptureSource *)self->_captureSource stop];
  [(VCVirtualAVCaptureDevice *)self stopDumpCollector];
  return v5;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ VCVirtualAVCaptureDevice-dealloc");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCVirtualAVCaptureDevice dealloc]";
      __int16 v11 = 1024;
      int v12 = 171;
      __int16 v13 = 2048;
      uint64_t v14 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ VCVirtualAVCaptureDevice-dealloc [%p]", buf, 0x26u);
    }
  }
  [(VCVirtualAVCaptureDevice *)self stopVirtualCapture];
  [(VCVirtualAVCaptureDevice *)self deregisterBlocksFromService];

  pthread_mutex_destroy(&self->_deviceMutex);
  xpcCommandQueue = self->_xpcCommandQueue;
  if (xpcCommandQueue)
  {
    dispatch_release(xpcCommandQueue);
    self->_xpcCommandQueue = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)VCVirtualAVCaptureDevice;
  [(VCVirtualAVCaptureDevice *)&v6 dealloc];
}

- (void)registerBlocksForService
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (VRTraceIsInternalOSInstalled())
  {
    uint64_t v3 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
    objc_msgSend(+[AVConferenceXPCServer AVConferenceXPCServerSingleton](AVConferenceXPCServer, "AVConferenceXPCServerSingleton", MEMORY[0x1E4F143A8], 3221225472, __52__VCVirtualAVCaptureDevice_registerBlocksForService__block_invoke, &unk_1E6DB5478, v3, v5), "registerBlockForService:block:queue:", "previewSetVirtualCaptureAttributes", &v4, self->_xpcCommandQueue);
  }
}

uint64_t __52__VCVirtualAVCaptureDevice_registerBlocksForService__block_invoke(uint64_t a1, void *a2)
{
  v8[6] = *MEMORY[0x1E4F143B8];
  if (![a2 objectForKeyedSubscript:@"CLIENTDIED"])
  {
    uint64_t v4 = (void *)[*(id *)(a1 + 32) strong];
    uint64_t v5 = -[VideoAttributes initWithEncodedDictionary:]([VideoAttributes alloc], "initWithEncodedDictionary:", [a2 objectForKeyedSubscript:@"localVideoAttributes"]);
    if (v5)
    {
      objc_super v6 = v5;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __52__VCVirtualAVCaptureDevice_registerBlocksForService__block_invoke_22;
      v8[3] = &unk_1E6DB3E40;
      v8[4] = v4;
      v8[5] = v5;
      [v4 executeBlockUnderConfigurationLock:v8];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __52__VCVirtualAVCaptureDevice_registerBlocksForService__block_invoke_cold_1();
      }
    }
  }
  return 0;
}

uint64_t __52__VCVirtualAVCaptureDevice_registerBlocksForService__block_invoke_22(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 40) orientation];
  *(_DWORD *)(*(void *)(a1 + 32) + 188) = result;
  return result;
}

- (void)deregisterBlocksFromService
{
  id v2 = +[AVConferenceXPCServer AVConferenceXPCServerSingleton];

  [v2 deregisterFromService:"previewSetVirtualCaptureAttributes"];
}

- (void)executeBlockUnderConfigurationLock:(id)a3
{
  v8[1] = *(id *)MEMORY[0x1E4F143B8];
  v8[0] = 0;
  if (![(VCVirtualAVCaptureDevice *)self lockForConfiguration:v8])
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v6 = *MEMORY[0x1E4F1C3A8];
    uint64_t v7 = [v8[0] description];
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, objc_msgSend(v8[0], "userInfo")));
  }
  (*((void (**)(id))a3 + 2))(a3);
  [(VCVirtualAVCaptureDevice *)self unlockForConfiguration];
}

- (void)setActiveFormat:(id)a3
{
  [(VCVirtualAVCaptureDevice *)self verifyLockForConfiguration];

  uint64_t v5 = (AVCaptureDeviceFormat *)a3;
  self->_activeFormat = v5;
  [(VCVirtualAVCaptureDevice *)self configureResizingConverterWithFormat:v5];
  unint64_t Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions([(AVCaptureDeviceFormat *)self->_activeFormat formatDescription]);
  captureSource = self->_captureSource;

  [(VCCannedVideoCaptureSource *)captureSource setWidth:Dimensions height:HIDWORD(Dimensions)];
}

- (id)activeFormat
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__38;
  __int16 v9 = __Block_byref_object_dispose__38;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__VCVirtualAVCaptureDevice_activeFormat__block_invoke;
  v4[3] = &unk_1E6DB4540;
  v4[4] = self;
  v4[5] = &v5;
  [(VCVirtualAVCaptureDevice *)self executeBlockUnderConfigurationLock:v4];
  id v2 = (void *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __40__VCVirtualAVCaptureDevice_activeFormat__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(a1 + 32) + 120);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setActiveVideoMinFrameDuration:(id *)a3
{
  [(VCVirtualAVCaptureDevice *)self verifyLockForConfiguration];
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_activeVideoMinFrameDuration.value = *(_OWORD *)&a3->var0;
  self->_activeVideoMinFrameDuration.epoch = var3;
  double v6 = (double)self->_activeVideoMinFrameDuration.value / (double)self->_activeVideoMinFrameDuration.timescale;
  if (v6 == 0.0) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = llround(1.0 / v6);
  }
  captureSource = self->_captureSource;

  [(VCCannedVideoCaptureSource *)captureSource setFrameRate:v7];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMinFrameDuration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3810000000;
  __int16 v9 = "";
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__VCVirtualAVCaptureDevice_activeVideoMinFrameDuration__block_invoke;
  v5[3] = &unk_1E6DB4540;
  v5[4] = self;
  v5[5] = &v6;
  [(VCVirtualAVCaptureDevice *)self executeBlockUnderConfigurationLock:v5];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v7 + 4);
  _Block_object_dispose(&v6, 8);
  return result;
}

__n128 __55__VCVirtualAVCaptureDevice_activeVideoMinFrameDuration__block_invoke(uint64_t a1)
{
  v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  id v2 = (__n128 *)(*(void *)(a1 + 32) + 160);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 176);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (void)setActiveVideoMaxFrameDuration:(id *)a3
{
  [(VCVirtualAVCaptureDevice *)self verifyLockForConfiguration];
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_activeVideoMaxFrameDuration.value = *(_OWORD *)&a3->var0;
  self->_activeVideoMaxFrameDuration.epoch = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)activeVideoMaxFrameDuration
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3810000000;
  __int16 v9 = "";
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__VCVirtualAVCaptureDevice_activeVideoMaxFrameDuration__block_invoke;
  v5[3] = &unk_1E6DB4540;
  v5[4] = self;
  v5[5] = &v6;
  [(VCVirtualAVCaptureDevice *)self executeBlockUnderConfigurationLock:v5];
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(v7 + 4);
  _Block_object_dispose(&v6, 8);
  return result;
}

__n128 __55__VCVirtualAVCaptureDevice_activeVideoMaxFrameDuration__block_invoke(uint64_t a1)
{
  v1 = *(__n128 **)(*(void *)(a1 + 40) + 8);
  id v2 = (__n128 *)(*(void *)(a1 + 32) + 136);
  unint64_t v3 = *(void *)(*(void *)(a1 + 32) + 152);
  __n128 result = *v2;
  v1[2] = *v2;
  v1[3].n128_u64[0] = v3;
  return result;
}

- (void)addDeviceInput:(id)a3
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__VCVirtualAVCaptureDevice_addDeviceInput___block_invoke;
  v3[3] = &unk_1E6DB3E40;
  v3[4] = self;
  v3[5] = a3;
  [(VCVirtualAVCaptureDevice *)self executeBlockUnderConfigurationLock:v3];
}

void __43__VCVirtualAVCaptureDevice_addDeviceInput___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 128) containsObject:*(void *)(a1 + 40)])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        int v8 = 136316162;
        uint64_t v9 = v4;
        __int16 v10 = 2080;
        uint64_t v11 = "-[VCVirtualAVCaptureDevice addDeviceInput:]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 284;
        __int16 v14 = 2112;
        uint64_t v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Device input[%@] already added to device[%@]", (uint8_t *)&v8, 0x30u);
      }
    }
  }
  else
  {
    if (![*(id *)(*(void *)(a1 + 32) + 128) count]) {
      [*(id *)(a1 + 32) startDumpCollector];
    }
    uint64_t v2 = *(void *)(a1 + 40);
    unint64_t v3 = *(void **)(*(void *)(a1 + 32) + 128);
    [v3 addObject:v2];
  }
}

- (void)removeDeviceInput:(id)a3
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__VCVirtualAVCaptureDevice_removeDeviceInput___block_invoke;
  v3[3] = &unk_1E6DB3E40;
  v3[4] = self;
  v3[5] = a3;
  [(VCVirtualAVCaptureDevice *)self executeBlockUnderConfigurationLock:v3];
}

void __46__VCVirtualAVCaptureDevice_removeDeviceInput___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 128) containsObject:*(void *)(a1 + 40)])
  {
    [*(id *)(*(void *)(a1 + 32) + 128) removeObject:*(void *)(a1 + 40)];
    if (![*(id *)(*(void *)(a1 + 32) + 128) count])
    {
      uint64_t v2 = *(void **)(a1 + 32);
      [v2 stopDumpCollector];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    uint64_t v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v7 = 136316162;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      __int16 v10 = "-[VCVirtualAVCaptureDevice removeDeviceInput:]_block_invoke";
      __int16 v11 = 1024;
      int v12 = 298;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Device input[%@] does not exist for device[%@]", (uint8_t *)&v7, 0x30u);
    }
  }
}

- (id)deviceInputs
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  uint64_t v8 = __Block_byref_object_copy__38;
  __int16 v9 = __Block_byref_object_dispose__38;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__VCVirtualAVCaptureDevice_deviceInputs__block_invoke;
  v4[3] = &unk_1E6DB4540;
  v4[4] = self;
  v4[5] = &v5;
  [(VCVirtualAVCaptureDevice *)self executeBlockUnderConfigurationLock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __40__VCVirtualAVCaptureDevice_deviceInputs__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 128) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (NSArray)formats
{
  id v2 = [(NSDictionary *)[(VCVirtualAVCaptureHardware *)self->_captureHardware devices] objectForKeyedSubscript:self->_deviceUniqueID];

  return (NSArray *)v2;
}

- (void)verifyLockForConfiguration
{
  p_deviceMutex = &self->_deviceMutex;
  uint64_t v4 = pthread_mutex_trylock(&self->_deviceMutex);
  uint64_t v5 = v4;
  if (v4)
  {
    if (v4 == 16) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Another thread is holding the device lock. result=%d", 16);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3B8], @"Failed to lock the device. result=%d", v5);
  }
  if (!self->_lockCount)
  {
    pthread_mutex_unlock(p_deviceMutex);
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3A8], @"Attempting to set virtual device configuration without first locking the device. result=%d", v5);
  }

  pthread_mutex_unlock(p_deviceMutex);
}

- (BOOL)lockForConfiguration:(id *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = pthread_mutex_lock(&self->_deviceMutex);
  if (v5)
  {
    if (a3)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"pthread mutex lock failed with result=%d", v5);
      uint64_t v8 = *MEMORY[0x1E4F28568];
      v9[0] = v6;
      *a3 = (id)objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"VCVirtualAVCaptureDevice", -1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
    }
  }
  else
  {
    ++self->_lockCount;
  }
  return v5 == 0;
}

- (void)unlockForConfiguration
{
}

- (id)description
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (CGRect)centerStageRectOfInterest
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = 0;
  __int16 v13 = (double *)&v12;
  uint64_t v14 = 0x4010000000;
  __int16 v15 = "";
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v16 = *MEMORY[0x1E4F1DB20];
  long long v17 = v2;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__VCVirtualAVCaptureDevice_centerStageRectOfInterest__block_invoke;
  v11[3] = &unk_1E6DB4540;
  v11[4] = self;
  v11[5] = &v12;
  [(VCVirtualAVCaptureDevice *)self executeBlockUnderConfigurationLock:v11];
  double v3 = v13[4];
  double v4 = v13[5];
  double v5 = v13[6];
  double v6 = v13[7];
  _Block_object_dispose(&v12, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

__n128 __53__VCVirtualAVCaptureDevice_centerStageRectOfInterest__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  __n128 result = *(__n128 *)(*(void *)(a1 + 32) + 240);
  *(_OWORD *)(v1 + 32) = *(_OWORD *)(*(void *)(a1 + 32) + 224);
  *(__n128 *)(v1 + 48) = result;
  return result;
}

- (void)setCenterStageRectOfInterest:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(VCVirtualAVCaptureDevice *)self verifyLockForConfiguration];
  self->_centerStageRectOfInterest.origin.CGFloat x = x;
  self->_centerStageRectOfInterest.origin.CGFloat y = y;
  self->_centerStageRectOfInterest.size.CGFloat width = width;
  self->_centerStageRectOfInterest.size.CGFloat height = height;
}

- (NSString)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(id)a3
{
}

- (id)uniqueID
{
  return self->_deviceUniqueID;
}

- (void)initWithUniqueID:orientation:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate device inputs array", v2, v3, v4, v5, v6);
}

- (void)initWithUniqueID:orientation:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Received nil device ID", v2, v3, v4, v5, v6);
}

- (void)initWithUniqueID:orientation:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate virtual capture hardware", v2, v3, v4, v5, v6);
}

- (void)initWithUniqueID:orientation:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate capture source", v2, v3, v4, v5, v6);
}

- (void)initWithUniqueID:orientation:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Attempting to initialize with nil active format", v2, v3, v4, v5, v6);
}

- (void)initWithUniqueID:orientation:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create xpc command queue", v2, v3, v4, v5, v6);
}

void __65__VCVirtualAVCaptureDevice_configureResizingConverterWithFormat___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create image resizing converter", v2, v3, v4, v5, v6);
}

void __52__VCVirtualAVCaptureDevice_registerBlocksForService__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create local video attributes", v2, v3, v4, v5, v6);
}

@end