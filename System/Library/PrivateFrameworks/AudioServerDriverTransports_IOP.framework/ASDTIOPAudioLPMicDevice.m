@interface ASDTIOPAudioLPMicDevice
+ (double)defaultSamplingRate;
+ (id)enableListeningPropertyForService:(id)a3;
+ (id)ioServiceDependenciesForConfig:(id)a3;
- (ASDTIOPAudioLPMicDevice)initWithConfig:(id)a3 withDeviceManager:(id)a4 andPlugin:(id)a5;
- (ASDTIOPAudioLPMicStream)inputStream;
- (BOOL)getEnabledChannelMask:(unsigned int *)a3;
- (BOOL)setEnabledChannelMask:(unsigned int)a3;
- (BOOL)setupCustomProperties;
- (BOOL)updateFromStreamDescription;
- (EngineStatus)lpMicEngineStatus;
- (id).cxx_construct;
- (id)getZeroTimestampBlock;
- (int)performPowerStatePrepare:(int)a3;
- (int)performPowerStatePrewarm:(int)a3;
- (int)setupIsolatedIOForStream:(id)a3 frameSize:(unsigned int)a4 useCase:(unint64_t)a5;
- (int)teardownIsolatedIOForStream:(id)a3 useCase:(unint64_t)a4;
- (unsigned)availablePastDataFrames;
- (unsigned)ioBufferSizeFrames;
- (unsigned)maximumPastDataFrames;
- (unsigned)timestampPeriod;
- (void)ioBufferSizeFrames;
- (void)setInputStream:(id)a3;
- (void)timestampPeriod;
- (void)updateFromStreamDescription;
@end

@implementation ASDTIOPAudioLPMicDevice

+ (id)enableListeningPropertyForService:(id)a3
{
  v11[4] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x263F28D10];
  v10[0] = *MEMORY[0x263F28D40];
  v10[1] = v4;
  v11[0] = @"ASDTIOPAudioCMEnableProperty";
  v11[1] = &unk_26FCB4380;
  uint64_t v5 = *MEMORY[0x263F28D20];
  v11[2] = v3;
  uint64_t v6 = *MEMORY[0x263F28D18];
  v10[2] = v5;
  v10[3] = v6;
  v7 = [NSNumber numberWithUnsignedInt:1];
  v11[3] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

+ (id)ioServiceDependenciesForConfig:(id)a3
{
  v8[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [v3 asdtServiceID];
  uint64_t v5 = +[ASDTIOServiceManager dependencyForID:v4 andConfiguration:v3];

  if (v5)
  {
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (double)defaultSamplingRate
{
  return 16000.0;
}

- (ASDTIOPAudioLPMicDevice)initWithConfig:(id)a3 withDeviceManager:(id)a4 andPlugin:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v7 asdtServiceID];
  v11 = +[ASDTIOServiceManager matchedIOServiceForID:v10];

  [v11 ioObject];
  operator new();
}

- (BOOL)setupCustomProperties
{
  v28[5] = *MEMORY[0x263EF8340];
  BOOL HistoricDataSupported = ASDT::IOPAudio::LPMic::UserClient::GetHistoricDataSupported((ASDT::IOPAudio::LPMic::UserClient *)self->_lpMicUserClient.__ptr_.__value_);
  uint64_t v3 = *MEMORY[0x263F28D10];
  v26[0] = *MEMORY[0x263F28D40];
  uint64_t v2 = v26[0];
  v26[1] = v3;
  uint64_t v4 = *MEMORY[0x263F28CE8];
  uint64_t v5 = MEMORY[0x263EFFA80];
  v27[1] = &unk_26FCB4398;
  v27[2] = MEMORY[0x263EFFA80];
  uint64_t v6 = *MEMORY[0x263F28D00];
  v26[4] = *MEMORY[0x263F28CF8];
  v27[0] = @"ASDTPListProperty";
  v26[2] = v4;
  v26[3] = v6;
  uint64_t v7 = *MEMORY[0x263F28D48];
  v27[3] = @"com.apple.private.audio.hal.aop-audio.user-access";
  v27[4] = v7;
  v16 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:5];
  v28[0] = v16;
  v24[0] = v2;
  v24[1] = v3;
  v25[0] = @"ASDTRawProperty";
  v25[1] = &unk_26FCB43B0;
  v25[2] = v5;
  v24[2] = v4;
  v24[3] = v6;
  id v8 = [MEMORY[0x263EFF8F8] dataWithBytes:&HistoricDataSupported length:4];
  v25[3] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  v28[1] = v9;
  v22[0] = v2;
  v22[1] = v3;
  v23[0] = @"ASDTIOPAudioLPMicUInt32Property";
  v23[1] = &unk_26FCB43C8;
  v22[2] = v4;
  v23[2] = v5;
  v10 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
  v28[2] = v10;
  v20[0] = v2;
  v20[1] = v3;
  v21[0] = @"ASDTIOPAudioLPMicUInt32Property";
  v21[1] = &unk_26FCB43E0;
  v20[2] = v4;
  v21[2] = v5;
  v11 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
  v28[3] = v11;
  v18[0] = v2;
  v18[1] = v3;
  v19[0] = @"ASDTIOPAudioLPMicUInt32Property";
  v19[1] = &unk_26FCB43F8;
  v12 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
  v28[4] = v12;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:5];

  LOBYTE(v5) = [(ASDTAudioDevice *)self addCustomProperties:v13];
  return v5;
}

- (BOOL)updateFromStreamDescription
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if ([(ASDAudioDevice *)self isRunning])
  {
    uint64_t v3 = ASDTIOPLogType();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      [(ASDAudioDevice *)self deviceUID];
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioLPMicDevice updateFromStreamDescription]();
    }

    return 0;
  }
  else
  {
    memset(&v17, 0, sizeof(v17));
    if (ASDT::IOPAudio::LPMic::UserClient::GetStreamDescription((ASDT::IOPAudio::LPMic::UserClient *)self->_lpMicUserClient.__ptr_.__value_, &v17))
    {
      uint64_t v5 = [NSNumber numberWithDouble:v17.var0];
      uint64_t v6 = [(ASDAudioDevice *)self samplingRates];
      char v7 = [v6 containsObject:v5];

      if ((v7 & 1) == 0)
      {
        id v8 = ASDTIOPLogType();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          id v9 = [(ASDAudioDevice *)self deviceUID];
          [(ASDTIOPAudioLPMicDevice *)v9 updateFromStreamDescription];
        }

        v10 = (void *)MEMORY[0x263EFF9C0];
        v11 = [(ASDAudioDevice *)self samplingRates];
        v12 = [v10 setWithArray:v11];

        [v12 addObject:v5];
        uint64_t v13 = [v12 allObjects];
        [(ASDAudioDevice *)self setSamplingRates:v13];
      }
      v14 = [(ASDTIOPAudioLPMicDevice *)self inputStream];
      char v4 = [v14 updateFromStreamDescription:&v17];

      if (v4) {
        [(ASDTAudioDevice *)self setSamplingRate:v17.var0];
      }
    }
    else
    {
      uint64_t v5 = ASDTIOPLogType();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        [(ASDAudioDevice *)self deviceUID];
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOPAudioLPMicDevice updateFromStreamDescription]();
      }
      char v4 = 0;
    }
  }
  return v4;
}

- (unsigned)timestampPeriod
{
  value = self->_lpMicUserClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioLPMicDevice timestampPeriod]();
  }
  return ASDT::IOPAudio::LPMic::UserClient::GetZeroTimeStampInterval((ASDT::IOPAudio::LPMic::UserClient *)value);
}

- (unsigned)ioBufferSizeFrames
{
  value = self->_lpMicUserClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioLPMicDevice ioBufferSizeFrames]();
  }
  return ASDT::IOPAudio::LPMic::UserClient::GetRingBufferSize((ASDT::IOPAudio::LPMic::UserClient *)value);
}

- (unsigned)availablePastDataFrames
{
  if (!self->_lpMicEngineStatus) {
    return 0;
  }
  unsigned int result = [(ASDAudioDevice *)self isRunning];
  if (result)
  {
    memset(v6, 0, sizeof(v6));
    ASDT::IOPAudio::LPMic::EngineStatus::Snapshot((uint64_t)self->_lpMicEngineStatus, (uint64_t)v6);
    int v4 = DWORD2(v6[0]) - LODWORD(v6[0]);
    unint64_t v5 = *((void *)&v6[0] + 1) - *(void *)&v6[0] + 1;
    unsigned int result = [(ASDTIOPAudioLPMicDevice *)self maximumPastDataFrames];
    if (v5 < result) {
      return v4 + 1;
    }
  }
  return result;
}

- (unsigned)maximumPastDataFrames
{
  unsigned int v3 = [(ASDTIOPAudioLPMicDevice *)self ioBufferSizeFrames];
  return v3 - [(ASDAudioDevice *)self inputSafetyOffset];
}

- (BOOL)getEnabledChannelMask:(unsigned int *)a3
{
  value = self->_lpMicUserClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioLPMicDevice getEnabledChannelMask:]();
  }
  if (!a3) {
    -[ASDTIOPAudioLPMicDevice getEnabledChannelMask:]();
  }
  return ASDT::IOPAudio::LPMic::UserClient::GetEnabledChannelMask((ASDT::IOPAudio::LPMic::UserClient *)value, a3);
}

- (BOOL)setEnabledChannelMask:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  value = self->_lpMicUserClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioLPMicDevice setEnabledChannelMask:]();
  }
  unsigned int v10 = 0;
  BOOL SupportedChannelMask = ASDT::IOPAudio::LPMic::UserClient::GetSupportedChannelMask((ASDT::IOPAudio::LPMic::UserClient *)value, &v10);
  if (SupportedChannelMask)
  {
    if ((v10 | a3) == v10)
    {
      LOBYTE(SupportedChannelMask) = ASDT::IOPAudio::LPMic::UserClient::SetEnabledChannelMask((ASDT::IOPAudio::LPMic::UserClient *)self->_lpMicUserClient.__ptr_.__value_, a3);
    }
    else
    {
      char v7 = ASDTIOPLogType();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v8 = [(ASDAudioDevice *)self deviceUID];
        *(_DWORD *)buf = 138412802;
        v12 = v8;
        __int16 v13 = 1024;
        unsigned int v14 = a3;
        __int16 v15 = 1024;
        unsigned int v16 = v10;
        _os_log_error_impl(&dword_248A68000, v7, OS_LOG_TYPE_ERROR, "%@: Bad enabled channel mask value: %x; supported %x",
          buf,
          0x18u);
      }
      LOBYTE(SupportedChannelMask) = 0;
    }
  }
  return SupportedChannelMask;
}

- (EngineStatus)lpMicEngineStatus
{
  return self->_lpMicEngineStatus;
}

- (int)performPowerStatePrepare:(int)a3
{
  value = self->_lpMicUserClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioLPMicDevice performPowerStatePrepare:]();
  }
  uint64_t v5 = *(void *)&a3;
  if (a3 == 1685090418) {
    ASDT::IOPAudio::LPMic::UserClient::StopIO((ASDT::IOPAudio::LPMic::UserClient *)value);
  }
  v7.receiver = self;
  v7.super_class = (Class)ASDTIOPAudioLPMicDevice;
  return [(ASDTAudioDevice *)&v7 performPowerStatePrepare:v5];
}

- (int)performPowerStatePrewarm:(int)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v8.receiver = self;
  v8.super_class = (Class)ASDTIOPAudioLPMicDevice;
  int result = -[ASDTAudioDevice performPowerStatePrewarm:](&v8, sel_performPowerStatePrewarm_);
  if (!result)
  {
    if (a3 != 1970304877) {
      return 0;
    }
    value = self->_lpMicUserClient.__ptr_.__value_;
    if (!value) {
      -[ASDTIOPAudioLPMicDevice performPowerStatePrewarm:]();
    }
    if (!ASDT::IOPAudio::LPMic::UserClient::StartIO((ASDT::IOPAudio::LPMic::UserClient *)value))
    {
      objc_super v7 = ASDTIOPLogType();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        [(ASDAudioDevice *)self deviceUID];
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOPAudioLPMicDevice performPowerStatePrewarm:]();
      }

      return 1852990585;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)getZeroTimestampBlock
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__ASDTIOPAudioLPMicDevice_getZeroTimestampBlock__block_invoke;
  aBlock[3] = &__block_descriptor_40_e20_i36__0_d8_Q16_Q24I32l;
  aBlock[4] = &self->_lpMicEngineStatus;
  uint64_t v2 = _Block_copy(aBlock);
  return v2;
}

uint64_t __48__ASDTIOPAudioLPMicDevice_getZeroTimestampBlock__block_invoke(uint64_t a1, double *a2, void *a3, void *a4)
{
  uint64_t v4 = **(void **)(a1 + 32);
  if (!v4) {
    return 1937010544;
  }
  long long v10 = 0u;
  long long v11 = 0u;
  ASDT::IOPAudio::LPMic::EngineStatus::Snapshot(v4, (uint64_t)&v10);
  if ((void)v11) {
    double v8 = (double)(unint64_t)(*((void *)&v10 + 1) - v10 + 1);
  }
  else {
    double v8 = 0.0;
  }
  uint64_t result = 0;
  *a2 = v8;
  *a3 = v11;
  *a4 = *((void *)&v11 + 1);
  return result;
}

- (int)setupIsolatedIOForStream:(id)a3 frameSize:(unsigned int)a4 useCase:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = [v7 setupIsolatedIOForUseCase:a5 withFrameSize:v6];
  }
  else {
    int v8 = 561214578;
  }

  return v8;
}

- (int)teardownIsolatedIOForStream:(id)a3 useCase:(unint64_t)a4
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v6 = [v5 teardownIsolatedIOForUseCase:a4];
  }
  else {
    int v6 = 561214578;
  }

  return v6;
}

- (ASDTIOPAudioLPMicStream)inputStream
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_inputStream);
  return (ASDTIOPAudioLPMicStream *)WeakRetained;
}

- (void)setInputStream:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputStream);
  value = self->_lpMicUserClient.__ptr_.__value_;
  self->_lpMicUserClient.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 67) = 0;
  return self;
}

- (void)initWithConfig:withDeviceManager:andPlugin:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_248A68000, v3, v4, "%@: Failed to map the engine status.", v5);
}

- (void)initWithConfig:withDeviceManager:andPlugin:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_248A68000, v3, v4, "%@: Failed to allocate custom properties.", v5);
}

- (void)initWithConfig:withDeviceManager:andPlugin:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_248A68000, v3, v4, "%@: Bad input stream.", v5);
}

- (void)initWithConfig:withDeviceManager:andPlugin:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_248A68000, v3, v4, "%@: Failed to open connection to LPMicDevice user client", v5);
}

- (void)initWithConfig:withDeviceManager:andPlugin:.cold.5()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_248A68000, v3, v4, "%@: Failed to create LPMicDevice user client", v5);
}

- (void)updateFromStreamDescription
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_248A68000, v3, v4, "%@: Invalid stream description.", v5);
}

- (void)timestampPeriod
{
}

- (void)ioBufferSizeFrames
{
}

- (void)getEnabledChannelMask:.cold.1()
{
}

- (void)getEnabledChannelMask:.cold.2()
{
}

- (void)setEnabledChannelMask:.cold.1()
{
}

- (void)performPowerStatePrepare:.cold.1()
{
}

- (void)performPowerStatePrewarm:.cold.1()
{
}

- (void)performPowerStatePrewarm:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_248A68000, v3, v4, "%@: Failed to StartIO.", v5);
}

@end