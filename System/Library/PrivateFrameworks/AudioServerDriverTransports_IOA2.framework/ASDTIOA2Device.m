@interface ASDTIOA2Device
+ (Class)ioServiceManagerClass;
+ (id)ioServiceDependenciesForConfig:(id)a3;
+ (id)matcherWithDelegate:(id)a3;
+ (unique_ptr<ASDT::IOA2UserClient,)createIOA2UserClient:(unsigned int)a3;
- (ASDTCustomProperty)injectionStreamEnableProperty;
- (ASDTIOA2Device)initWithConfig:(id)a3 withDeviceManager:(id)a4 andPlugin:(id)a5;
- (ASDTIOA2Device)initWithIOA2Device:(unsigned int)a3 config:(id)a4 deviceManager:(id)a5 plugin:(id)a6;
- (ASDTIOA2Device)initWithIOA2Device:(unsigned int)a3 plugin:(id)a4;
- (ASDTIOA2InjectionStream)injectionStream;
- (BOOL)_createDeviceProperties;
- (BOOL)_mapIOBuffer:(char *)a3 ofSize:(unsigned int *)a4 forStream:(unsigned int)a5;
- (BOOL)_openConnection;
- (BOOL)_setControlValue:(unsigned int *)a3 forControl:(unsigned int)a4;
- (BOOL)_setControlValues:(const unsigned int *)a3 withCount:(unint64_t)a4 resultValues:(unsigned int *)a5 count:(unint64_t *)a6 forControl:(unsigned int)a7;
- (BOOL)_setCurrentFormat:(id)a3 forStream:(unsigned int)a4;
- (BOOL)_setSamplingRate:(double)a3;
- (BOOL)_setStreamActive:(BOOL)a3 streamUCID:(unsigned int)a4;
- (BOOL)_setupForIsolatedIO:(unsigned int)a3 forUseCase:(unint64_t)a4 withIOFrameBufferSize:(unsigned int)a5;
- (BOOL)_teardownForIsolatedIO:(unsigned int)a3 forUseCase:(unint64_t)a4;
- (BOOL)_updateControls;
- (BOOL)_updateStreams;
- (BOOL)delayedStopIO;
- (BOOL)ioRequestBegin;
- (BOOL)notifiedIORunning;
- (BOOL)shouldStopIO;
- (BOOL)subclassUpdateControls;
- (BOOL)ucDeviceStarted;
- (IOAudio2EngineStatus)_getIOA2EngineStatus;
- (IOAudio2EngineStatus)engineStatusIndirection;
- (NSMapTable)customPropertySelectorMap;
- (NSString)exclavesInjectionBufferName;
- (NSString)exclavesInputBufferName;
- (OS_dispatch_queue)concurrentQueue;
- (OS_dispatch_queue)stopIOQueue;
- (OS_dispatch_queue)ucDeviceNotificationQueue;
- (double)_samplingRate;
- (id).cxx_construct;
- (id)_channelLayoutForDirection:(unsigned int)a3;
- (id)_controlDictionaryForControl:(unsigned int)a3;
- (id)_getControlByUCID:(unsigned int)a3;
- (id)_getCurrentFormatForStream:(unsigned int)a3;
- (id)_getObjectByUCID:(unsigned int)a3 fromObjects:(id)a4;
- (id)_getStreamByUCID:(unsigned int)a3;
- (id)_markOrCreateStreamsForDirection:(unsigned int)a3;
- (id)_streamInfoForStream:(unsigned int)a3;
- (id)createStreamForUserClientID:(unsigned int)a3 direction:(unsigned int)a4;
- (id)createStreamForUserClientID:(unsigned int)a3 direction:(unsigned int)a4 registryDict:(id)a5;
- (id)customDataPropertyWithKey:(id)a3;
- (id)customPropertyWithKey:(id)a3;
- (id)getKeyForCustomPropertyWithSelector:(unsigned int)a3;
- (id)getZeroTimestampBlock;
- (id)samplingRates;
- (id)unmarkedObjects:(id)a3;
- (id)updateClientInputPositionBlock;
- (id)updateClientOutputPositionBlock;
- (int)performPowerStateIdle:(int)a3;
- (int)performPowerStatePrepare:(int)a3;
- (int)performPowerStatePrewarm:(int)a3;
- (int)setupIsolatedIOForStream:(id)a3 frameSize:(unsigned int)a4 useCase:(unint64_t)a5;
- (int)systemSleepPending;
- (int)teardownIsolatedIOForStream:(id)a3 useCase:(unint64_t)a4;
- (shared_lock<std::shared_mutex>)lockConfigShared;
- (uint64_t)_openConnection;
- (unint64_t)currentSeed;
- (unint64_t)isolatedInputUseCaseID;
- (unique_lock<std::shared_mutex>)lockConfigExclusive;
- (unique_ptr<ASDT::MachPort,)createNotificationPort;
- (unsigned)_getIOBufferFrameSize;
- (unsigned)clockDomain;
- (unsigned)customUInt32WithKey:(id)a3 defaultValue:(unsigned int)a4;
- (unsigned)inputLatency;
- (unsigned)inputSafetyOffset;
- (unsigned)outputLatency;
- (unsigned)outputSafetyOffset;
- (unsigned)timestampPeriod;
- (unsigned)transportType;
- (void)_addControls:(id)a3;
- (void)_addStreams:(id)a3;
- (void)_openConnection;
- (void)_performUnderlyingStopIO:(unint64_t)a3;
- (void)_releaseIOBuffer:(char *)a3;
- (void)_removeControls:(id)a3;
- (void)_removeStreams:(id)a3;
- (void)_requestUnderlyingStopIO;
- (void)_updateProperties;
- (void)clearInputBuffers;
- (void)clearMark:(id)a3;
- (void)clearOutputBuffers;
- (void)dealloc;
- (void)doConfigChange:(IOAudio2Notification *)a3;
- (void)forceStopIO;
- (void)handleConfigChange:(IOAudio2Notification *)a3;
- (void)handleControlChange:(IOAudio2Notification *)a3;
- (void)handleIOA2PropertyChanged:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4;
- (void)handleMachPortMessage;
- (void)handlePropertyChanged:(IOAudio2Notification *)a3;
- (void)handleTransportChanged:(IOAudio2Notification *)a3;
- (void)ioRequestBegin;
- (void)ioRequestEnd;
- (void)ioRequestsBlock;
- (void)ioRequestsRelease;
- (void)ioa2UserClient;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)performTerminate;
- (void)setConcurrentQueue:(id)a3;
- (void)setCurrentSeed:(unint64_t)a3;
- (void)setCustomPropertySelectorMap:(id)a3;
- (void)setDelayedStopIO:(BOOL)a3;
- (void)setExclavesInjectionBufferName:(id)a3;
- (void)setExclavesInputBufferName:(id)a3;
- (void)setInjectionStream:(id)a3;
- (void)setInjectionStreamEnableProperty:(id)a3;
- (void)setIsolatedInputUseCaseID:(unint64_t)a3;
- (void)setMuteAllOutputs:(BOOL)a3;
- (void)setNotifiedIORunning:(BOOL)a3;
- (void)setOutputVolumesToNominal;
- (void)setSamplingRate:(double)a3;
- (void)setShouldStopIO:(BOOL)a3;
- (void)setStopIOQueue:(id)a3;
- (void)setUcDeviceNotificationQueue:(id)a3;
- (void)setUcDeviceStarted:(BOOL)a3;
- (void)setupCustomPropertySelectorMap;
- (void)updateInjectionVisibility;
- (void)writeZerosToMixMilliseconds:(unsigned int)a3;
@end

@implementation ASDTIOA2Device

+ (Class)ioServiceManagerClass
{
  return (Class)objc_opt_class();
}

+ (id)ioServiceDependenciesForConfig:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 asdtDeviceUID];
  if (v5) {
    objc_msgSend((id)objc_msgSend(a1, "ioServiceManagerClass"), "dependencyForIdentifier:andConfiguration:", v5, v4);
  }
  else {
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a1, "ioServiceManagerClass"), "dependencyForConfiguration:", v4);
  }
  v7 = (void *)v6;
  if (v6)
  {
    v10[0] = v6;
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (unique_ptr<ASDT::IOA2UserClient,)createIOA2UserClient:(unsigned int)a3
{
}

- (ASDTIOA2Device)initWithIOA2Device:(unsigned int)a3 config:(id)a4 deviceManager:(id)a5 plugin:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  v72[1] = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v65 = a5;
  id v66 = a6;
  id v11 = (id)objc_opt_class();
  if (v11)
  {
    [v11 createIOA2UserClient:v8];
    id v11 = *(id *)buf;
  }
  *(void *)buf = 0;
  uint64_t v12 = *((void *)self + 67);
  *((void *)self + 67) = v11;
  if (v12)
  {
    (*(void (**)(uint64_t))(*(void *)v12 + 8))(v12);
    id v13 = *(id *)buf;
    *(void *)buf = 0;
    if (v13) {
      (*(void (**)(id))(*(void *)v13 + 8))(v13);
    }
    id v11 = (id)*((void *)self + 67);
  }
  if (v11)
  {
    ASDT::IOA2UserClient::CopyDeviceUID((ASDT::IOA2UserClient *)v11, (const applesauce::CF::TypeRef *)buf);
    id v14 = *(id *)buf;
    v67 = v14;
    if (v14)
    {
      CFRelease(v14);
      if (v10)
      {
        v15 = [v10 asdtDeviceUID];
        char v16 = [v15 isEqualToString:v67];

        if ((v16 & 1) == 0)
        {
          v17 = ASDTIOA2LogType();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = [v10 asdtDeviceUID];
            -[ASDTIOA2Device initWithIOA2Device:config:deviceManager:plugin:].cold.6(v18, (uint64_t)v67, buf, v17);
          }
        }
      }
      else
      {
        uint64_t v71 = *MEMORY[0x263F28CC8];
        v72[0] = v67;
        id v10 = [NSDictionary dictionaryWithObjects:v72 forKeys:&v71 count:1];
      }
    }
    v68.receiver = self;
    v68.super_class = (Class)ASDTIOA2Device;
    id v20 = [(ASDTAudioDevice *)&v68 initWithConfig:v10 withDeviceManager:v65 andPlugin:v66];
    if (!v20) {
      goto LABEL_39;
    }
    v21 = [v10 asdtExclavesInputBufferName];
    [v20 setExclavesInputBufferName:v21];

    v22 = [v10 asdtExclavesInjectionBufferName];
    [v20 setExclavesInjectionBufferName:v22];

    objc_msgSend(v20, "setIsolatedInputUseCaseID:", objc_msgSend(v10, "asdtIsolatedInputUseCaseID"));
    v23 = NSString;
    v24 = (objc_class *)objc_opt_class();
    v25 = NSStringFromClass(v24);
    v26 = [v23 stringWithFormat:@"%s.%@.%@.stopIO", "com.apple.AudioServerDriverTransports", v25, v67];

    id v27 = v26;
    v28 = (const char *)[v27 UTF8String];
    v29 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v30 = dispatch_queue_create(v28, v29);
    v31 = (void *)*((void *)v20 + 122);
    *((void *)v20 + 122) = v30;

    v32 = NSString;
    v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    v35 = [v32 stringWithFormat:@"%s.%@.%@.notification", "com.apple.AudioServerDriverTransports", v34, v67];

    id v36 = v35;
    v37 = (const char *)[v36 UTF8String];
    v38 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v39 = dispatch_queue_create(v37, v38);
    v40 = (void *)*((void *)v20 + 124);
    *((void *)v20 + 124) = v39;

    v41 = NSString;
    v42 = (objc_class *)objc_opt_class();
    v43 = NSStringFromClass(v42);
    v44 = [v41 stringWithFormat:@"%s.%@.%@.concurrent", "com.apple.AudioServerDriverTransports", v43, v67];

    id v45 = v44;
    v46 = (const char *)[v45 UTF8String];
    v47 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v48 = dispatch_queue_create(v46, v47);
    [v20 setConcurrentQueue:v48];

    if (!*((void *)v20 + 122)
      || !*((void *)v20 + 124)
      || ([v20 concurrentQueue],
          v49 = objc_claimAutoreleasedReturnValue(),
          BOOL v50 = v49 == 0,
          v49,
          v50))
    {
      v63 = ASDTIOA2LogType();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        [v20 deviceUID];
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Device initWithIOA2Device:config:deviceManager:plugin:]();
      }
      goto LABEL_42;
    }
    int NumberStreams = ASDT::IOA2UserClient::GetNumberStreams(*((ASDT::IOA2UserClient **)v20 + 67), 1);
    uint64_t v52 = NumberStreams != 0;
    v53 = [v10 objectForKey:*MEMORY[0x263F28CB0]];
    BOOL v54 = v53 == 0;

    if (!v54)
    {
      unsigned int v55 = [v20 canBeDefaultInputDevice];
      if (NumberStreams) {
        uint64_t v52 = v55;
      }
      else {
        uint64_t v52 = 0;
      }
    }
    [v20 setCanBeDefaultInputDevice:v52];
    int v56 = ASDT::IOA2UserClient::GetNumberStreams(*((ASDT::IOA2UserClient **)v20 + 67), 0);
    uint64_t v57 = v56 != 0;
    v58 = [v10 objectForKey:*MEMORY[0x263F28CB8]];
    BOOL v59 = v58 == 0;

    if (!v59)
    {
      unsigned int v60 = [v20 canBeDefaultOutputDevice];
      if (v56) {
        uint64_t v57 = v60;
      }
      else {
        uint64_t v57 = 0;
      }
    }
    [v20 setCanBeDefaultOutputDevice:v57];
    v61 = [v10 objectForKey:*MEMORY[0x263F28CC0]];
    BOOL v62 = v61 == 0;

    if (v62) {
      [v20 setCanBeDefaultSystemDevice:1];
    }
    ASDT::IOA2UserClient::CopyDeviceName(*((ASDT::IOA2UserClient **)v20 + 67), (const applesauce::CF::TypeRef *)cf);
    [v20 setDeviceName:cf[0]];
    if (cf[0]) {
      CFRelease(cf[0]);
    }
    ASDT::IOA2UserClient::CopyDeviceManufacturer(*((ASDT::IOA2UserClient **)v20 + 67), (const applesauce::CF::TypeRef *)cf);
    [v20 setManufacturerName:cf[0]];
    if (cf[0]) {
      CFRelease(cf[0]);
    }
    if (([v20 _openConnection] & 1) == 0)
    {
      v63 = ASDTIOA2LogType();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        [v20 deviceUID];
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Device initWithIOA2Device:config:deviceManager:plugin:].cold.5();
      }
      goto LABEL_42;
    }
    if (([v20 _createDeviceProperties] & 1) == 0)
    {
      v63 = ASDTIOA2LogType();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        [v20 deviceUID];
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Device initWithIOA2Device:config:deviceManager:plugin:].cold.4();
      }
      goto LABEL_42;
    }
    if ([v20 _updateControls])
    {
      if ([v20 _updateStreams])
      {
        ASDT::IOUserClient::SetAlwaysLoadPropertiesFromRegistry(*((ASDT::IOUserClient **)v20 + 67));
        ASDT::IOUserClient::SetTerminationNotificationEnabled(*((ASDT::IOUserClient **)v20 + 67));

LABEL_39:
        v19 = (ASDTIOA2Device *)v20;
LABEL_43:

        self = (ASDTIOA2Device *)v20;
        goto LABEL_44;
      }
      v63 = ASDTIOA2LogType();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
        goto LABEL_50;
      }
    }
    else
    {
      v63 = ASDTIOA2LogType();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
LABEL_50:
        [v20 deviceUID];
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Device initWithIOA2Device:config:deviceManager:plugin:]();
      }
    }
LABEL_42:

    v19 = 0;
    goto LABEL_43;
  }
  v19 = 0;
LABEL_44:

  return v19;
}

- (ASDTIOA2Device)initWithConfig:(id)a3 withDeviceManager:(id)a4 andPlugin:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)MEMORY[0x263F28C88];
  uint64_t v12 = [v8 asdtDeviceUID];
  id v13 = [v11 forIdentifier:v12 andClientType:0];

  id v14 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "ioServiceManagerClass"), "matchedIOServiceForID:", v13);
  v15 = -[ASDTIOA2Device initWithIOA2Device:config:deviceManager:plugin:](self, "initWithIOA2Device:config:deviceManager:plugin:", [v14 ioObject], v8, v9, v10);

  return v15;
}

- (ASDTIOA2Device)initWithIOA2Device:(unsigned int)a3 plugin:(id)a4
{
  return [(ASDTIOA2Device *)self initWithIOA2Device:*(void *)&a3 config:0 deviceManager:0 plugin:a4];
}

- (void)dealloc
{
  v3 = [(ASDTIOA2Device *)self injectionStreamEnableProperty];
  [v3 removeObserver:self forKeyPath:@"value"];

  v4.receiver = self;
  v4.super_class = (Class)ASDTIOA2Device;
  [(ASDAudioDevice *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(ASDTIOA2Device *)self injectionStreamEnableProperty];
  if (v10 == v9)
  {
    int v11 = [v8 isEqualToString:@"value"];

    if (v11)
    {
      objc_initWeak(&location, self);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __65__ASDTIOA2Device_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v12[3] = &unk_2652462F8;
      objc_copyWeak(&v13, &location);
      [(ASDAudioDevice *)self requestConfigurationChange:v12];
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __65__ASDTIOA2Device_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateInjectionVisibility];
}

- (void)performTerminate
{
  v3 = (ASDT::IOUserClient *)*((void *)self + 67);
  if (v3 && ASDT::IOUserClient::IsServiceAlive(v3)) {
    (*(void (**)(void))(**((void **)self + 67) + 16))(*((void *)self + 67));
  }
  *((void *)self + 68) = 0;
  v4.receiver = self;
  v4.super_class = (Class)ASDTIOA2Device;
  [(ASDTAudioDevice *)&v4 performTerminate];
}

- (void)ioa2UserClient
{
  return (void *)*((void *)self + 67);
}

- (unique_lock<std::shared_mutex>)lockConfigExclusive
{
  v3 = (std::__shared_mutex_base *)((char *)self + 616);
  *(void *)uint64_t v2 = v3;
  *(unsigned char *)(v2 + 8) = 1;
  std::__shared_mutex_base::lock(v3);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (shared_lock<std::shared_mutex>)lockConfigShared
{
  v3 = (std::__shared_mutex_base *)((char *)self + 616);
  *(void *)uint64_t v2 = v3;
  *(unsigned char *)(v2 + 8) = 1;
  std::__shared_mutex_base::lock_shared(v3);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)handleMachPortMessage
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@: Failed to receive a message.", v5);
}

void __39__ASDTIOA2Device_handleMachPortMessage__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained handleConfigChange:*(void *)(*(void *)(a1 + 32) + 8) + 48];
}

- (void)ioRequestsBlock
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v4 = OUTLINED_FUNCTION_3_0(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_5_0(v4, v5, v6);
  OUTLINED_FUNCTION_6_0(&dword_248A1B000, "%@: %s: IORequestCount: %d", v7, v8);
}

- (void)ioRequestsRelease
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@: Unbalanced IORequest block/release.", v5);
}

- (BOOL)ioRequestBegin
{
  int v3 = (std::mutex *)((char *)self + 848);
  std::mutex::lock((std::mutex *)((char *)self + 848));
  int v4 = *((_DWORD *)self + 240);
  if (v4 <= 0)
  {
    *((_DWORD *)self + 240) = v4 - 1;
    uint64_t v5 = ASDTIOA2LogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      [(ASDAudioDevice *)self deviceUID];
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Device ioRequestBegin]();
    }
  }
  std::mutex::unlock(v3);
  return v4 < 1;
}

- (void)ioRequestEnd
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@: Unbalanced IORequest start/stop.", v5);
}

- (void)handleConfigChange:(IOAudio2Notification *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = ASDTIOA2LogType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(ASDAudioDevice *)self deviceUID];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_248A1B000, v5, OS_LOG_TYPE_DEFAULT, "%@: Handle configuration change.", (uint8_t *)&buf, 0xCu);
  }
  [(ASDTAudioDevice *)self powerState];
  if ((asdtPowerStateCompare() & 0x80000000) != 0)
  {
    [(ASDTIOA2Device *)self doConfigChange:a3];
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v12 = 0x5012000000;
    id v13 = __Block_byref_object_copy_;
    id v14 = __Block_byref_object_dispose_;
    v15 = &unk_248A60C85;
    long long v7 = *(_OWORD *)&a3->var4;
    long long v16 = *(_OWORD *)&a3->var0;
    long long v17 = v7;
    objc_initWeak(&location, self);
    [(ASDTIOA2Device *)self ioRequestsBlock];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__ASDTIOA2Device_handleConfigChange___block_invoke;
    v8[3] = &unk_265246320;
    objc_copyWeak(&v9, &location);
    v8[4] = &buf;
    [(ASDAudioDevice *)self requestConfigurationChange:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
}

void __37__ASDTIOA2Device_handleConfigChange___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained doConfigChange:*(void *)(*(void *)(a1 + 32) + 8) + 48];
  [WeakRetained ioRequestsRelease];
}

- (void)doConfigChange:(IOAudio2Notification *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = ASDTIOA2LogType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(ASDAudioDevice *)self deviceUID];
    *(_DWORD *)long long buf = 138412290;
    long long v16 = v6;
    _os_log_impl(&dword_248A1B000, v5, OS_LOG_TYPE_DEFAULT, "%@: Do configuration change.", buf, 0xCu);
  }
  [(ASDTIOA2Device *)self forceStopIO];
  [(ASDTIOA2Device *)self lockConfigExclusive];
  if (!ASDT::IOA2UserClient::PerformConfigChange(*((ASDT::IOA2UserClient **)self + 67), a3))
  {
    long long v7 = ASDTIOA2LogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(ASDAudioDevice *)self deviceUID];
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Device doConfigChange:]();
    }
  }
  id v8 = (std::mutex *)*((void *)self + 104);
  std::mutex::lock(v8);
  std::mutex::unlock(v8);
  std::condition_variable::notify_all((std::condition_variable *)((char *)self + 784));
  id v9 = ASDTIOA2LogType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [(ASDAudioDevice *)self deviceUID];
    int v13 = 138412290;
    id v14 = v10;
    _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_INFO, "%@: Signaled sample rate waiting thread", (uint8_t *)&v13, 0xCu);
  }
  if (*((void *)self + 68))
  {
    int v11 = ASDTIOA2LogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      [(ASDAudioDevice *)self deviceUID];
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Device doConfigChange:]();
    }

    uint64_t v12 = (void *)*((void *)self + 68);
    *((void *)self + 68) = 0;
    ASDT::IOUserClient::ReleaseMemory(*((ASDT::IOUserClient **)self + 67), v12);
  }
  [(ASDTIOA2Device *)self _updateProperties];
  [(ASDTIOA2Device *)self _updateControls];
  [(ASDTIOA2Device *)self _updateStreams];
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
}

- (void)handleControlChange:(IOAudio2Notification *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  [(ASDTIOA2Device *)self lockConfigShared];
  uint64_t v5 = [(ASDTIOA2Device *)self _getControlByUCID:a3->var0];
  unsigned int var1 = a3->var1;
  if (var1 == 1668443751)
  {
    (*(void (**)(void))(**((void **)self + 67) + 24))(*((void *)self + 67));
    id v10 = ASDTIOA2LogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(ASDAudioDevice *)self deviceUID];
      if ([v5 objectClass] >> 29
        && [v5 objectClass] >> 24 <= 0x7E)
      {
        unsigned int v12 = [v5 objectClass] >> 24;
      }
      else
      {
        unsigned int v12 = 32;
      }
      if (([v5 objectClass] & 0xE00000) != 0
        && ([v5 objectClass] >> 16) <= 0x7Eu)
      {
        int v14 = ([v5 objectClass] >> 16);
      }
      else
      {
        int v14 = 32;
      }
      if (([v5 objectClass] & 0xE000) != 0
        && ((unsigned __int16)[v5 objectClass] >> 8) <= 0x7Eu)
      {
        int v16 = ((unsigned __int16)[v5 objectClass] >> 8);
      }
      else
      {
        int v16 = 32;
      }
      if (([v5 objectClass] & 0xE0) != 0 && objc_msgSend(v5, "objectClass") <= 0x7Eu) {
        int v18 = [v5 objectClass];
      }
      else {
        int v18 = 32;
      }
      *(_DWORD *)long long buf = 138413314;
      *(void *)&uint8_t buf[4] = v11;
      __int16 v22 = 1024;
      unsigned int v23 = v12;
      __int16 v24 = 1024;
      int v25 = v14;
      __int16 v26 = 1024;
      int v27 = v16;
      __int16 v28 = 1024;
      int v29 = v18;
      _os_log_impl(&dword_248A1B000, v10, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' range change notification.", buf, 0x24u);
    }
    ASDT::IOA2UserClient::CopyControlDictionaryByID(*((ASDT::IOA2UserClient **)self + 67), (const applesauce::CF::ArrayRef *)a3->var0, (applesauce::CF::DictionaryRef *)buf);
    std::shared_lock<std::shared_mutex>::unlock((uint64_t)v20);
    [v5 synchronizeWithRegistryDictionary:*(void *)buf];
    if (*(void *)buf) {
      CFRelease(*(CFTypeRef *)buf);
    }
  }
  else if (var1 == 1668702572)
  {
    long long v7 = ASDTIOA2LogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(ASDAudioDevice *)self deviceUID];
      if ([v5 objectClass] >> 29
        && [v5 objectClass] >> 24 <= 0x7E)
      {
        unsigned int v9 = [v5 objectClass] >> 24;
      }
      else
      {
        unsigned int v9 = 32;
      }
      if (([v5 objectClass] & 0xE00000) != 0
        && ([v5 objectClass] >> 16) <= 0x7Eu)
      {
        int v13 = ([v5 objectClass] >> 16);
      }
      else
      {
        int v13 = 32;
      }
      if (([v5 objectClass] & 0xE000) != 0
        && ((unsigned __int16)[v5 objectClass] >> 8) <= 0x7Eu)
      {
        int v15 = ((unsigned __int16)[v5 objectClass] >> 8);
      }
      else
      {
        int v15 = 32;
      }
      if (([v5 objectClass] & 0xE0) != 0 && objc_msgSend(v5, "objectClass") <= 0x7Eu) {
        int v17 = [v5 objectClass];
      }
      else {
        int v17 = 32;
      }
      unsigned int var2 = a3->var2;
      *(_DWORD *)long long buf = 138413570;
      *(void *)&uint8_t buf[4] = v8;
      __int16 v22 = 1024;
      unsigned int v23 = v9;
      __int16 v24 = 1024;
      int v25 = v13;
      __int16 v26 = 1024;
      int v27 = v15;
      __int16 v28 = 1024;
      int v29 = v17;
      __int16 v30 = 1024;
      unsigned int v31 = var2;
      _os_log_impl(&dword_248A1B000, v7, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' value change notification: %u", buf, 0x2Au);
    }
    std::shared_lock<std::shared_mutex>::unlock((uint64_t)v20);
    [v5 pushValue:a3->var2];
  }

  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)v20);
}

- (void)handleTransportChanged:(IOAudio2Notification *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unsigned int var1 = a3->var1;
  if (var1 == 1751215220 || var1 == 1735354734)
  {
    long long v7 = ASDTIOA2LogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(ASDAudioDevice *)self deviceUID];
      unsigned int v9 = (void *)v8;
      unsigned int v10 = a3->var1;
      int v11 = HIBYTE(v10);
      if ((v10 - 0x20000000) >> 24 >= 0x5F) {
        int v11 = 32;
      }
      int v12 = BYTE2(v10);
      if (BYTE2(v10) - 32 >= 0x5F) {
        int v12 = 32;
      }
      int v13 = BYTE1(v10);
      if (BYTE1(v10) - 32 >= 0x5F) {
        int v13 = 32;
      }
      *(_DWORD *)int v14 = 138413314;
      *(void *)&v14[4] = v8;
      unsigned int v10 = v10;
      *(_WORD *)&v14[12] = 1024;
      *(_DWORD *)&v14[14] = v11;
      *(_WORD *)&v14[18] = 1024;
      *(_DWORD *)&v14[20] = v12;
      LOWORD(v15) = 1024;
      *(_DWORD *)((char *)&v15 + 2) = v13;
      if (v10 - 32 >= 0x5F) {
        unsigned int v10 = 32;
      }
      HIWORD(v15) = 1024;
      unsigned int v16 = v10;
      _os_log_impl(&dword_248A1B000, v7, OS_LOG_TYPE_DEFAULT, "%@: change in IO state to '%c%c%c%c'", v14, 0x24u);
    }
    -[ASDTIOA2Device setNotifiedIORunning:](self, "setNotifiedIORunning:", a3->var1 == 1735354734, *(_OWORD *)v14, *(void *)&v14[16], v15);
  }
}

- (void)handleIOA2PropertyChanged:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4
{
  id v7 = a4;
  if (v7)
  {
    uint64_t v6 = [(ASDTIOA2Device *)self propertyChangedDelegate];
    [v6 changedProperty:a3 forObject:v7];
  }
}

- (void)handlePropertyChanged:(IOAudio2Notification *)a3
{
  int v5 = [(ASDTIOA2Device *)self objectID];
  uint64_t v6 = self;
  id v7 = (ASDT::IOA2UserClient **)v6;
  if (!a3->var0)
  {
    id v10 = v6;
    if (!v5) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  [(ASDTIOA2Device *)v6 lockConfigShared];
  (*(void (**)(ASDT::IOA2UserClient *))(*(void *)v7[67] + 24))(v7[67]);
  uint64_t v8 = [v7 _getStreamByUCID:a3->var0];
  unsigned int v9 = v8;
  if (v8)
  {
    int v5 = [v8 objectID];
    id v10 = v9;
    int v11 = v7;
  }
  else
  {
    int v11 = [v7 _getControlByUCID:a3->var0];
    if (v11)
    {
      ASDT::IOA2UserClient::CopyControlDictionaryByID(v7[67], (const applesauce::CF::ArrayRef *)a3->var0, (applesauce::CF::DictionaryRef *)&cf);
      [v11 synchronizeWithRegistryDictionary:cf];
      int v5 = [v11 objectID];
      id v10 = v11;

      if (cf) {
        CFRelease(cf);
      }
    }
    else
    {
      id v10 = v7;
    }
  }

  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)&v15);
  if (v5)
  {
LABEL_7:
    uint64_t v15 = *(void *)&a3->var2;
    int var4 = a3->var4;
    [v7 handleIOA2PropertyChanged:&v15 forObject:v10];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v10;
      int v13 = [v12 injectionStream];
      [v7 handleIOA2PropertyChanged:&v15 forObject:v13];
    }
  }
LABEL_9:
}

- (id)_getObjectByUCID:(unsigned int)a3 fromObjects:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        unsigned int v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_26FCB37C0, (void)v12)
          && [v9 userClientID] == a3)
        {
          id v10 = v9;
          goto LABEL_12;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_12:

  return v10;
}

- (id)_getStreamByUCID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(ASDTAudioDevice *)self allStreams];
  uint64_t v6 = [(ASDTIOA2Device *)self _getObjectByUCID:v3 fromObjects:v5];

  return v6;
}

- (id)_getControlByUCID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(ASDAudioDevice *)self controls];
  uint64_t v6 = [(ASDTIOA2Device *)self _getObjectByUCID:v3 fromObjects:v5];

  return v6;
}

- (void)clearMark:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "setMarked:", 0, (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)unmarkedObjects:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_26FCB37C0, (void)v11)
          && ([v9 marked] & 1) == 0)
        {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)createStreamForUserClientID:(unsigned int)a3 direction:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = [ASDTIOA2Stream alloc];
  long long v8 = [(ASDTIOA2Device *)self _streamInfoForStream:v5];
  long long v9 = [(ASDTIOA2Stream *)v7 initWithIOA2Device:self userClientID:v5 direction:v4 registryDict:v8];

  return v9;
}

- (id)createStreamForUserClientID:(unsigned int)a3 direction:(unsigned int)a4 registryDict:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v8 = a5;
  if (objc_opt_respondsToSelector())
  {
    long long v9 = ASDTIOA2LogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v10 = [(ASDAudioDevice *)self deviceUID];
      int v14 = 138412290;
      long long v15 = v10;
      _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_INFO, "%@: Using deprecated method to create streams.", (uint8_t *)&v14, 0xCu);
    }
    long long v11 = [(ASDTIOA2Device *)self createStreamForUserClientID:v6 direction:v5];
  }
  else
  {
    long long v11 = [[ASDTIOA2Stream alloc] initWithIOA2Device:self userClientID:v6 direction:v5 registryDict:v8];
  }
  long long v12 = v11;

  return v12;
}

- (id)_markOrCreateStreamsForDirection:(unsigned int)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v36 = [MEMORY[0x263EFF980] array];
  ASDT::IOA2UserClient::CopyStreamList(*((ASDT::IOA2UserClient **)self + 67), a3 == 1768845428, (const applesauce::CF::TypeRef *)&theArray);
  CFArrayRef v4 = theArray;
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    CFIndex v6 = Count;
    CFArrayRef v7 = theArray;
    if (theArray)
    {
      CFIndex v8 = CFArrayGetCount(theArray);
      if (!v6) {
        goto LABEL_41;
      }
    }
    else
    {
      CFIndex v8 = 0;
      if (!Count) {
        goto LABEL_41;
      }
    }
    for (unint64_t i = 0; v6 != i; ++i)
    {
      if (v4 == v7 && v8 == i) {
        break;
      }
      applesauce::CF::details::at_to<applesauce::CF::TypeRef>(v4, i, &cf);
      if (cf && (CFTypeID v11 = CFGetTypeID(cf), v11 == CFDictionaryGetTypeID())) {
        applesauce::CF::TypeRef::operator applesauce::CF::DictionaryRef(&cf, (applesauce::CF::DictionaryRef *)&v39);
      }
      else {
        CFTypeRef v39 = 0;
      }
      unsigned int v38 = 0;
      if ((ASDT::IOA2UserClient::GetStreamInfo_ID((const __CFDictionary **)&v39, (const applesauce::CF::DictionaryRef *)&v38, v10) & 1) == 0)
      {
        long long v13 = ASDTIOA2LogType();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v20 = [(ASDAudioDevice *)self deviceUID];
          v21 = (id)v39;
          *(_DWORD *)long long buf = 138412546;
          uint64_t v43 = (uint64_t)v20;
          __int16 v44 = 2112;
          id v45 = v21;
          _os_log_error_impl(&dword_248A1B000, v13, OS_LOG_TYPE_ERROR, "%@: Bad stream dict: %@", buf, 0x16u);
        }
        goto LABEL_32;
      }
      long long v12 = [(ASDTIOA2Device *)self _getStreamByUCID:v38];
      long long v13 = v12;
      if (v12)
      {
        [v12 setMarked:1];
        int v14 = (id)v39;
        [v13 synchronizeWithRegistryDictionary:v14];

        long long v15 = [v13 injectionStream];
        if (!v15) {
          goto LABEL_32;
        }
        int v16 = ASDT::IOA2UserClient::SupportsInputStreamInjection(*((ASDT::IOA2UserClient **)self + 67));

        if (!v16) {
          goto LABEL_32;
        }
        uint64_t v17 = [v13 injectionStream];
        [v17 setMarked:1];

        int v18 = [v13 injectionStream];
        v19 = (id)v39;
        [v18 synchronizeWithRegistryDictionary:v19];
      }
      else
      {
        int v18 = (id)v39;
        __int16 v22 = [(ASDTIOA2Device *)self createStreamForUserClientID:v38 direction:a3 registryDict:v18];
        v19 = v22;
        if (v22)
        {
          [v22 setMarked:1];
          [v36 addObject:v19];
          if (a3 != 1768845428) {
            goto LABEL_31;
          }
          if ([v19 usesIsolatedIO])
          {
            objc_msgSend(v19, "setIsolatedUseCaseID:", -[ASDTIOA2Device isolatedInputUseCaseID](self, "isolatedInputUseCaseID"));
            unsigned int v23 = [(ASDTIOA2Device *)self exclavesInputBufferName];
            [v19 setExclavesBufferName:v23];
          }
          if (!ASDT::IOA2UserClient::SupportsInputStreamInjection(*((ASDT::IOA2UserClient **)self + 67))) {
            goto LABEL_31;
          }
          __int16 v24 = [(ASDTIOA2Device *)self exclavesInjectionBufferName];
          BOOL v25 = v24 == 0;

          if (v25) {
            goto LABEL_31;
          }
          __int16 v26 = [[ASDTIOA2InjectionStream alloc] initWithIOA2Device:self inputStream:v19 registryDict:v18];
          if (v26)
          {
            [v19 setInjectionStream:v26];
            [(ASDTIOA2Device *)self setInjectionStream:v26];
          }
          else
          {
            log = ASDTIOA2LogType();
            BOOL v27 = os_log_type_enabled(log, OS_LOG_TYPE_ERROR);
            __int16 v28 = log;
            if (v27)
            {
              uint64_t v30 = [(ASDAudioDevice *)self deviceUID];
              *(_DWORD *)long long buf = 138412546;
              uint64_t v43 = v30;
              __int16 v44 = 2112;
              id v45 = v18;
              v33 = (void *)v30;
              _os_log_error_impl(&dword_248A1B000, log, OS_LOG_TYPE_ERROR, "%@: Failed to create injection stream from %@.", buf, 0x16u);

              __int16 v28 = log;
            }
          }
        }
        else
        {
          ASDTIOA2LogType();
          __int16 v26 = (ASDTIOA2InjectionStream *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v26->super.super.super.super.super, OS_LOG_TYPE_ERROR))
          {
            uint64_t v29 = [(ASDAudioDevice *)self deviceUID];
            *(_DWORD *)long long buf = 138412546;
            uint64_t v43 = v29;
            __int16 v44 = 2112;
            id v45 = v18;
            os_log_t loga = (os_log_t)v29;
            _os_log_error_impl(&dword_248A1B000, &v26->super.super.super.super.super, OS_LOG_TYPE_ERROR, "%@: Failed to create stream from: %@", buf, 0x16u);
          }
        }
      }
LABEL_31:

LABEL_32:
      if (v39) {
        CFRelease(v39);
      }
      if (cf) {
        CFRelease(cf);
      }
    }
  }
LABEL_41:
  id v31 = v36;
  if (theArray) {
    CFRelease(theArray);
  }

  return v31;
}

- (BOOL)_createDeviceProperties
{
  v17[5] = *MEMORY[0x263EF8340];
  if (ASDT::IOA2UserClient::SupportsInputStreamInjection(*((ASDT::IOA2UserClient **)self + 67)))
  {
    id v3 = [(ASDTIOA2Device *)self exclavesInjectionBufferName];

    if (v3)
    {
      int v15 = 0;
      CFArrayRef v4 = (void *)MEMORY[0x263F28C80];
      uint64_t v5 = *MEMORY[0x263F28D40];
      v17[0] = @"ASDTRawProperty";
      uint64_t v6 = *MEMORY[0x263F28D00];
      v16[0] = v5;
      v16[1] = v6;
      uint64_t v7 = [MEMORY[0x263EFF8F8] dataWithBytes:&v15 length:4];
      v17[1] = v7;
      uint64_t v8 = *MEMORY[0x263F28D08];
      v16[2] = *MEMORY[0x263F28D10];
      v16[3] = v8;
      v17[2] = &unk_26FCB1FB0;
      v17[3] = &unk_26FCB1FC8;
      v16[4] = *MEMORY[0x263F28CD0];
      v17[4] = &unk_26FCB1FE0;
      long long v9 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:5];
      long long v10 = [v4 customPropertyForConfig:v9];
      [(ASDTIOA2Device *)self setInjectionStreamEnableProperty:v10];

      CFTypeID v11 = [(ASDTIOA2Device *)self injectionStreamEnableProperty];
      LOBYTE(v7) = v11 == 0;

      if (v7) {
        return 0;
      }
      long long v12 = [(ASDTIOA2Device *)self injectionStreamEnableProperty];
      [v12 addObserver:self forKeyPath:@"value" options:1 context:0];

      long long v13 = [(ASDTIOA2Device *)self injectionStreamEnableProperty];
      [(ASDTIOA2Device *)self addCustomProperty:v13];
    }
  }
  [(ASDTIOA2Device *)self _updateProperties];
  return 1;
}

- (void)updateInjectionVisibility
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = [(ASDTIOA2Device *)self injectionStream];

  if (v3)
  {
    CFArrayRef v4 = [(ASDTIOA2Device *)self injectionStreamEnableProperty];
    uint64_t v5 = [v4 value];

    id v6 = v5;
    uint64_t v7 = (int *)[v6 bytes];
    if (v7 && (unint64_t)[v6 length] >= 4)
    {
      int v8 = *v7;
      long long v9 = [(ASDAudioDevice *)self outputStreams];
      long long v10 = [(ASDTIOA2Device *)self injectionStream];
      int v11 = [v9 containsObject:v10];

      if (v8) {
        char v12 = v11;
      }
      else {
        char v12 = 1;
      }
      if (v12)
      {
        if (v8) {
          int v13 = 0;
        }
        else {
          int v13 = v11;
        }
        if (v13 != 1) {
          goto LABEL_19;
        }
        int v14 = ASDTIOA2LogType();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = [(ASDAudioDevice *)self deviceUID];
          int v19 = 138412290;
          id v20 = v15;
          _os_log_impl(&dword_248A1B000, v14, OS_LOG_TYPE_DEFAULT, "%@: Removing injection stream.", (uint8_t *)&v19, 0xCu);
        }
        int v16 = [(ASDTIOA2Device *)self injectionStream];
        [(ASDAudioDevice *)self removeOutputStream:v16];
      }
      else
      {
        uint64_t v17 = ASDTIOA2LogType();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = [(ASDAudioDevice *)self deviceUID];
          int v19 = 138412290;
          id v20 = v18;
          _os_log_impl(&dword_248A1B000, v17, OS_LOG_TYPE_DEFAULT, "%@: Adding injection stream.", (uint8_t *)&v19, 0xCu);
        }
        int v16 = [(ASDTIOA2Device *)self injectionStream];
        [(ASDAudioDevice *)self addOutputStream:v16];
      }
    }
LABEL_19:
  }
}

- (void)_updateProperties
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  (*(void (**)(void, SEL))(**((void **)self + 67) + 24))(*((void *)self + 67), a2);
  [(ASDTIOA2Device *)self setupCustomPropertySelectorMap];
  id v3 = +[ASDTIOA2DefaultChannelLayout forIOA2Device:self andScope:1869968496];
  CFArrayRef v4 = +[ASDTIOA2DefaultChannelLayout addressForDirection:1869968496];
  if ([(ASDTAudioDevice *)self updateCustomProperty:v3 withAddress:v4])
  {
    uint64_t v5 = ASDTIOA2LogType();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v3 description];
      int v11 = 138412290;
      char v12 = v6;
      _os_log_impl(&dword_248A1B000, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v11, 0xCu);
    }
  }
  uint64_t v7 = +[ASDTIOA2DefaultChannelLayout forIOA2Device:self andScope:1768845428];

  int v8 = +[ASDTIOA2DefaultChannelLayout addressForDirection:1768845428];

  if ([(ASDTAudioDevice *)self updateCustomProperty:v7 withAddress:v8])
  {
    long long v9 = ASDTIOA2LogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = [v7 description];
      int v11 = 138412290;
      char v12 = v10;
      _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (BOOL)_updateStreams
{
  id v3 = [(ASDTAudioDevice *)self allStreams];
  [(ASDTIOA2Device *)self clearMark:v3];

  CFArrayRef v4 = [(ASDTIOA2Device *)self _markOrCreateStreamsForDirection:1768845428];
  [(ASDTIOA2Device *)self _addStreams:v4];

  uint64_t v5 = [(ASDTIOA2Device *)self _markOrCreateStreamsForDirection:1869968496];
  [(ASDTIOA2Device *)self _addStreams:v5];

  id v6 = [(ASDTAudioDevice *)self allStreams];
  uint64_t v7 = [(ASDTIOA2Device *)self unmarkedObjects:v6];
  [(ASDTIOA2Device *)self _removeStreams:v7];

  return 1;
}

- (BOOL)subclassUpdateControls
{
  return 1;
}

- (BOOL)_updateControls
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v3 = [(ASDAudioDevice *)self controls];
  [(ASDTIOA2Device *)self clearMark:v3];

  ASDT::IOA2UserClient::CopyControlList(*((ASDT::IOA2UserClient **)self + 67), (const applesauce::CF::TypeRef *)buf);
  id v4 = *(id *)buf;
  uint64_t v5 = v4;
  if (v4) {
    CFRelease(v4);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v32;
    *(void *)&long long v8 = 138412546;
    long long v26 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v12 = [v11 objectForKeyedSubscript:@"control ID"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = -[ASDTIOA2Device _getControlByUCID:](self, "_getControlByUCID:", [v12 unsignedIntValue]);
            int v14 = v13;
            if (v13)
            {
              [v13 setMarked:1];
              [v14 synchronizeWithRegistryDictionary:v11];
            }
            else
            {
              int v15 = +[ASDTIOA2Control controlWithDictionary:v11 owningDevice:self];
              int v16 = v15;
              if (v15)
              {
                [v15 setMarked:1];
                [(ASDAudioDevice *)self addControl:v16];
                int v14 = v16;
                [v16 synchronizeWithRegistryDictionary:v11];
              }
              else
              {
                uint64_t v17 = ASDTIOA2LogType();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  int v18 = [(ASDAudioDevice *)self deviceUID];
                  *(_DWORD *)long long buf = v26;
                  *(void *)&uint8_t buf[4] = v18;
                  __int16 v37 = 2112;
                  unsigned int v38 = v11;
                  _os_log_error_impl(&dword_248A1B000, v17, OS_LOG_TYPE_ERROR, "%@: Failed to create control for dict: %@", buf, 0x16u);
                }
                int v14 = 0;
              }
            }
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v7);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v19 = [(ASDAudioDevice *)self controls];
  id v20 = [(ASDTIOA2Device *)self unmarkedObjects:v19];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v20);
        }
        -[ASDAudioDevice removeControl:](self, "removeControl:", *(void *)(*((void *)&v27 + 1) + 8 * j), v26);
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v21);
  }

  BOOL v24 = [(ASDTIOA2Device *)self subclassUpdateControls];
  return v24;
}

- (double)_samplingRate
{
  ASDT::IOA2UserClient::GetNominalSampleRate(*((ASDT::IOA2UserClient **)self + 67));
  return result;
}

- (void)setSamplingRate:(double)a3
{
  if (-[ASDTIOA2Device _setSamplingRate:](self, "_setSamplingRate:"))
  {
    v5.receiver = self;
    v5.super_class = (Class)ASDTIOA2Device;
    [(ASDTAudioDevice *)&v5 setSamplingRate:a3];
  }
}

- (BOOL)_setSamplingRate:(double)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  [(ASDTIOA2Device *)self lockConfigExclusive];
  [(ASDTIOA2Device *)self _samplingRate];
  if (v5 != a3)
  {
    if (ASDT::IOA2UserClient::SetNominalSampleRate(*((ASDT::IOA2UserClient **)self + 67), a3))
    {
      double v20 = (double)std::chrono::system_clock::now().__d_.__rep_ + 5000000.0;
      while (1)
      {
        id v6 = ASDTIOA2LogType();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          uint64_t v7 = [(ASDAudioDevice *)self deviceUID];
          *(_DWORD *)long long buf = 138412290;
          unsigned int v23 = v7;
          _os_log_impl(&dword_248A1B000, v6, OS_LOG_TYPE_INFO, "%@: Waiting to be signaled from IOA2 config change notification thread...", buf, 0xCu);
        }
        BOOL v8 = std::condition_variable_any::wait_until<std::unique_lock<std::shared_mutex>,std::chrono::system_clock,std::chrono::duration<double,std::ratio<1l,1000000l>>>((uint64_t)self + 784, (uint64_t)v21, &v20);
        [(ASDTIOA2Device *)self _samplingRate];
        double v10 = v9;
        int v11 = ASDTIOA2LogType();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          char v12 = [(ASDAudioDevice *)self deviceUID];
          *(_DWORD *)long long buf = 138412802;
          unsigned int v23 = v12;
          __int16 v24 = 2048;
          double v25 = v10;
          __int16 v26 = 2048;
          double v27 = a3;
          _os_log_impl(&dword_248A1B000, v11, OS_LOG_TYPE_INFO, "%@: Woke! currentRate = %f, desiredRate = %f", buf, 0x20u);
        }
        if (v8) {
          break;
        }
        if (v10 == a3) {
          goto LABEL_19;
        }
      }
      int v16 = ASDTIOA2LogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = [(ASDAudioDevice *)self deviceUID];
        *(_DWORD *)long long buf = 138412290;
        unsigned int v23 = v17;
        _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "%@: setSamplingRate timed out", buf, 0xCu);
      }
      if (v10 == a3)
      {
LABEL_19:
        std::unique_lock<std::shared_mutex>::unlock((uint64_t)v21);
        BOOL v14 = 1;
        goto LABEL_15;
      }
      int v18 = ASDTIOA2LogType();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        int v19 = [(ASDAudioDevice *)self deviceUID];
        *(_DWORD *)long long buf = 138412802;
        unsigned int v23 = v19;
        __int16 v24 = 2048;
        double v25 = a3;
        __int16 v26 = 2048;
        double v27 = v10;
        _os_log_error_impl(&dword_248A1B000, v18, OS_LOG_TYPE_ERROR, "%@: setSamplingRate failed. Desired: %lf, Existing: %lf", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v13 = ASDTIOA2LogType();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        [(ASDAudioDevice *)self deviceUID];
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Device _setSamplingRate:]();
      }
    }
  }
  BOOL v14 = 0;
LABEL_15:
  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v21);
  return v14;
}

- (id)_getCurrentFormatForStream:(unsigned int)a3
{
  cf[4] = *(CFTypeRef *)MEMORY[0x263EF8340];
  ASDT::IOA2UserClient::CopyStreamDictionaryByID(*((ASDT::IOA2UserClient **)self + 67), a3, (applesauce::CF::DictionaryRef *)cf);
  if (ASDT::IOA2UserClient::GetStreamInfo_CurrentFormat((const __CFDictionary **)cf, (const applesauce::CF::DictionaryRef *)v8, v4))
  {
    double v5 = (void *)[objc_alloc(MEMORY[0x263F28C70]) initWithAudioStreamBasicDescription:v8];
  }
  else
  {
    id v6 = ASDTIOA2LogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(ASDAudioDevice *)self deviceUID];
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOA2Device _getCurrentFormatForStream:]();
    }

    double v5 = 0;
  }
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  return v5;
}

- (BOOL)_setCurrentFormat:(id)a3 forStream:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(ASDTIOA2Device *)self lockConfigExclusive];
  uint64_t v7 = [(ASDTIOA2Device *)self _getCurrentFormatForStream:v4];
  if ([v6 isEqual:v7])
  {
LABEL_20:
    BOOL v18 = 0;
    goto LABEL_21;
  }
  BOOL v8 = (ASDT::IOA2UserClient *)*((void *)self + 67);
  if (v6) {
    [v6 audioStreamBasicDescription];
  }
  else {
    memset(&buf, 0, sizeof(buf));
  }
  if (!ASDT::IOA2UserClient::SetStreamCurrentFormat(v8, v4, &buf))
  {
    int v19 = ASDTIOA2LogType();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = [(ASDAudioDevice *)self deviceUID];
      LODWORD(buf.mSampleRate) = 138412802;
      *(void *)((char *)&buf.mSampleRate + 4) = v22;
      LOWORD(buf.mFormatFlags) = 1024;
      *(AudioFormatFlags *)((char *)&buf.mFormatFlags + 2) = v4;
      HIWORD(buf.mBytesPerPacket) = 2112;
      *(void *)&buf.mFramesPerPacket = v6;
      _os_log_error_impl(&dword_248A1B000, v19, OS_LOG_TYPE_ERROR, "%@: Failed to set stream %u current format to: %@", (uint8_t *)&buf, 0x1Cu);
    }
    goto LABEL_20;
  }
  LOBYTE(v9) = 0;
  double v24 = (double)std::chrono::system_clock::now().__d_.__rep_ + 5000000.0;
  do
  {
    if (v9)
    {
      BOOL v18 = 1;
      goto LABEL_21;
    }
    double v10 = ASDTIOA2LogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = [(ASDAudioDevice *)self deviceUID];
      LODWORD(buf.mSampleRate) = 138412290;
      *(void *)((char *)&buf.mSampleRate + 4) = v11;
      _os_log_impl(&dword_248A1B000, v10, OS_LOG_TYPE_INFO, "%@: Waiting to be signaled from IOA2 config change notification thread...", (uint8_t *)&buf, 0xCu);
    }
    BOOL v12 = std::condition_variable_any::wait_until<std::unique_lock<std::shared_mutex>,std::chrono::system_clock,std::chrono::duration<double,std::ratio<1l,1000000l>>>((uint64_t)self + 784, (uint64_t)v25, &v24);
    uint64_t v13 = [(ASDTIOA2Device *)self _getCurrentFormatForStream:v4];

    AudioFormatFlags v9 = [v6 isEqual:v13];
    BOOL v14 = ASDTIOA2LogType();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [(ASDAudioDevice *)self deviceUID];
      LODWORD(buf.mSampleRate) = 138412546;
      *(void *)((char *)&buf.mSampleRate + 4) = v15;
      LOWORD(buf.mFormatFlags) = 1024;
      *(AudioFormatFlags *)((char *)&buf.mFormatFlags + 2) = v9;
      _os_log_impl(&dword_248A1B000, v14, OS_LOG_TYPE_INFO, "%@: Woke! Desired format set: %hhu", (uint8_t *)&buf, 0x12u);
    }
    uint64_t v7 = (void *)v13;
  }
  while (!v12);
  int v16 = ASDTIOA2LogType();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = [(ASDAudioDevice *)self deviceUID];
    LODWORD(buf.mSampleRate) = 138412290;
    *(void *)((char *)&buf.mSampleRate + 4) = v17;
    _os_log_impl(&dword_248A1B000, v16, OS_LOG_TYPE_DEFAULT, "%@: _setCurrentFormat timed out", (uint8_t *)&buf, 0xCu);
  }
  if (v9)
  {
    BOOL v18 = 1;
  }
  else
  {
    uint64_t v21 = ASDTIOA2LogType();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      unsigned int v23 = [(ASDAudioDevice *)self deviceUID];
      LODWORD(buf.mSampleRate) = 138412802;
      *(void *)((char *)&buf.mSampleRate + 4) = v23;
      LOWORD(buf.mFormatFlags) = 2112;
      *(void *)((char *)&buf.mFormatFlags + 2) = v6;
      HIWORD(buf.mFramesPerPacket) = 2112;
      *(void *)&buf.mBytesPerFrame = v13;
      _os_log_error_impl(&dword_248A1B000, v21, OS_LOG_TYPE_ERROR, "%@: _setCurrentFormat failed.\nDesired: %@\nCurrent: %@", (uint8_t *)&buf, 0x20u);
    }
    BOOL v18 = 0;
  }
  uint64_t v7 = (void *)v13;
LABEL_21:

  std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v25);
  return v18;
}

- (id)samplingRates
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF9C0] set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v4 = [(ASDTAudioDevice *)self allStreams];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    obuint64_t j = v4;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        BOOL v8 = objc_msgSend(v7, "physicalFormats", obj);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v27;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v27 != v10) {
                objc_enumerationMutation(v8);
              }
              BOOL v12 = *(void **)(*((void *)&v26 + 1) + 8 * j);
              [v12 sampleRate];
              if (v13 != 0.0)
              {
                BOOL v14 = NSNumber;
                [v12 sampleRate];
                int v15 = objc_msgSend(v14, "numberWithDouble:");
                [v3 addObject:v15];
LABEL_17:

                continue;
              }
              [v12 minimumSampleRate];
              if (v16 != 0.0)
              {
                uint64_t v17 = NSNumber;
                [v12 minimumSampleRate];
                BOOL v18 = objc_msgSend(v17, "numberWithDouble:");
                [v3 addObject:v18];
              }
              [v12 maximumSampleRate];
              if (v19 != 0.0)
              {
                double v20 = NSNumber;
                [v12 maximumSampleRate];
                int v15 = objc_msgSend(v20, "numberWithDouble:");
                [v3 addObject:v15];
                goto LABEL_17;
              }
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v9);
        }
      }
      uint64_t v4 = obj;
      uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v5);
  }

  uint64_t v21 = [v3 allObjects];
  uint64_t v22 = [v21 sortedArrayUsingComparator:&__block_literal_global];

  return v22;
}

uint64_t __31__ASDTIOA2Device_samplingRates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (unsigned)timestampPeriod
{
  return ASDT::IOA2UserClient::GetRingBufferSize(*((ASDT::IOA2UserClient **)self + 67));
}

- (unsigned)inputLatency
{
  return ASDT::IOA2UserClient::GetLatency(*((ASDT::IOA2UserClient **)self + 67), 1);
}

- (unsigned)outputLatency
{
  return ASDT::IOA2UserClient::GetLatency(*((ASDT::IOA2UserClient **)self + 67), 0);
}

- (unsigned)inputSafetyOffset
{
  return ASDT::IOA2UserClient::GetSafetyOffset(*((ASDT::IOA2UserClient **)self + 67), 1);
}

- (unsigned)outputSafetyOffset
{
  return ASDT::IOA2UserClient::GetSafetyOffset(*((ASDT::IOA2UserClient **)self + 67), 0);
}

- (unsigned)transportType
{
  return ASDT::IOA2UserClient::GetTransportType(*((ASDT::IOA2UserClient **)self + 67));
}

- (unsigned)clockDomain
{
  return ASDT::IOA2UserClient::GetClockDomain(*((ASDT::IOA2UserClient **)self + 67));
}

- (unique_ptr<ASDT::MachPort,)createNotificationPort
{
}

- (BOOL)_openConnection
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  [(ASDTIOA2Device *)self createNotificationPort];
  if (v16)
  {
    id v18 = *((id *)self + 124);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    double v13 = __33__ASDTIOA2Device__openConnection__block_invoke;
    BOOL v14 = &unk_2652462F8;
    objc_copyWeak(&v15, &location);
    id v19 = (id)MEMORY[0x24C588C90](&v11);
    if ((*(uint64_t (**)(uint64_t, id *))(*(void *)v16 + 16))(v16, &v18))
    {
      if (ASDT::IOUserClient::OpenConnection(*((ASDT::IOUserClient **)self + 67)))
      {
        uint64_t v3 = v16;
        uint64_t v16 = 0;
        uint64_t v10 = v3;
        [(ASDTIOA2Device *)self objectID];
        char v4 = ASDT::IOUserClient::SetConnectionNotification();
        if (v10) {
          (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
        }
        if (v4)
        {
          BOOL v5 = 1;
LABEL_18:

          objc_destroyWeak(&v15);
          goto LABEL_19;
        }
        uint64_t v7 = ASDTIOA2LogType();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          [(ASDAudioDevice *)self deviceUID];
          objc_claimAutoreleasedReturnValue();
          -[ASDTIOA2Device _openConnection]();
        }
      }
      else
      {
        uint64_t v7 = ASDTIOA2LogType();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          [(ASDAudioDevice *)self deviceUID];
          objc_claimAutoreleasedReturnValue();
          -[ASDTIOA2Device _openConnection].cold.4();
        }
      }
    }
    else
    {
      uint64_t v7 = ASDTIOA2LogType();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        [(ASDAudioDevice *)self deviceUID];
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Device _openConnection].cold.5();
      }
    }

    BOOL v5 = 0;
    goto LABEL_18;
  }
  id v6 = ASDTIOA2LogType();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    [(ASDAudioDevice *)self deviceUID];
    objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2Device _openConnection]();
  }

  BOOL v5 = 0;
LABEL_19:
  uint64_t v8 = v16;
  uint64_t v16 = 0;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  objc_destroyWeak(&location);
  return v5;
}

void __33__ASDTIOA2Device__openConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleMachPortMessage];
}

- (void)_addStreams:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "direction", (void)v9) == 1768845428) {
          [(ASDAudioDevice *)self addInputStream:v8];
        }
        else {
          [(ASDAudioDevice *)self addOutputStream:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_removeStreams:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "direction", (void)v9) == 1768845428) {
          [(ASDAudioDevice *)self removeInputStream:v8];
        }
        else {
          [(ASDAudioDevice *)self removeOutputStream:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_addControls:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[ASDAudioDevice addControl:](self, "addControl:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_removeControls:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[ASDAudioDevice removeControl:](self, "removeControl:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)getZeroTimestampBlock
{
  uint64_t v2 = [(ASDTIOA2Device *)self engineStatusIndirection];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__ASDTIOA2Device_getZeroTimestampBlock__block_invoke;
  v5[3] = &__block_descriptor_40_e20_i36__0_d8_Q16_Q24I32l;
  v5[4] = v2;
  uint64_t v3 = (void *)MEMORY[0x24C588C90](v5);
  return v3;
}

uint64_t __39__ASDTIOA2Device_getZeroTimestampBlock__block_invoke(uint64_t a1, double *a2, unint64_t *a3, unint64_t *a4)
{
  id v4 = **(unint64_t ***)(a1 + 32);
  if (!v4) {
    return 1937010544;
  }
  unint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  unint64_t v7 = v4[2];
  uint64_t result = 0;
  *a2 = (double)v5;
  *a3 = v6;
  *a4 = v7;
  return result;
}

- (void)setupCustomPropertySelectorMap
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  ASDT::IOA2UserClient::CopyCustomPropertyInfo(*((ASDT::IOA2UserClient **)self + 67), (const applesauce::CF::TypeRef *)buf);
  id v2 = *(id *)buf;
  uint64_t v3 = v2;
  if (v2) {
    CFRelease(v2);
  }
  id v4 = objc_msgSend(MEMORY[0x263F08968], "mapTableWithKeyOptions:valueOptions:", 0, 0, self);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v10 = [v9 valueForKey:@"registry key"];
        uint64_t v11 = [v9 valueForKey:@"property selector"];
        long long v12 = (void *)v11;
        if (v10) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        if (!v13)
        {
          [v4 setObject:v10 forKey:v11];
          uint64_t v14 = ASDTIOA2LogType();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            int v15 = [v12 unsignedIntValue];
            *(_DWORD *)AudioStreamBasicDescription buf = 138412546;
            *(void *)&uint8_t buf[4] = v10;
            __int16 v23 = 1024;
            int v24 = v15;
            _os_log_debug_impl(&dword_248A1B000, v14, OS_LOG_TYPE_DEBUG, "Registry Key: %@, Selector: %u", buf, 0x12u);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v6);
  }

  [v17 setCustomPropertySelectorMap:v4];
}

- (id)getKeyForCustomPropertyWithSelector:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(ASDTIOA2Device *)self customPropertySelectorMap];
  id v5 = [NSNumber numberWithUnsignedInt:v3];
  uint64_t v6 = [v4 objectForKey:v5];

  return v6;
}

- (id)customPropertyWithKey:(id)a3
{
  id v4 = (applesauce::CF::StringRef *)a3;
  CFTypeRef v10 = 0;
  id v5 = (ASDT::IOUserClient *)*((void *)self + 67);
  applesauce::CF::StringRef::from_ns_noexcept(v4, (applesauce::CF::StringRef **)&cf);
  int v6 = ASDT::IOUserClient::CopyProperty<applesauce::CF::DictionaryRef>(v5, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v10);
  if (cf) {
    CFRelease(cf);
  }
  if (v6) {
    uint64_t v7 = (id)v10;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v10) {
    CFRelease(v10);
  }

  return v7;
}

- (unsigned)customUInt32WithKey:(id)a3 defaultValue:(unsigned int)a4
{
  int v6 = (applesauce::CF::StringRef *)a3;
  unsigned int v11 = a4;
  uint64_t v7 = (ASDT::IOUserClient *)*((void *)self + 67);
  applesauce::CF::StringRef::from_ns_noexcept(v6, (applesauce::CF::StringRef **)&cf);
  int v8 = ASDT::IOUserClient::CopyProperty<unsigned int>(v7, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v11);
  if (cf) {
    CFRelease(cf);
  }
  if (v8) {
    a4 = v11;
  }

  return a4;
}

- (id)customDataPropertyWithKey:(id)a3
{
  id v4 = (applesauce::CF::StringRef *)a3;
  CFTypeRef v10 = 0;
  id v5 = (ASDT::IOUserClient *)*((void *)self + 67);
  applesauce::CF::StringRef::from_ns_noexcept(v4, (applesauce::CF::StringRef **)&cf);
  int v6 = ASDT::IOUserClient::CopyProperty<applesauce::CF::DataRef>(v5, (const applesauce::CF::StringRef *)&cf, (const applesauce::CF::TypeRef *)&v10);
  if (cf) {
    CFRelease(cf);
  }
  if (v6) {
    uint64_t v7 = (id)v10;
  }
  else {
    uint64_t v7 = 0;
  }
  if (v10) {
    CFRelease(v10);
  }

  return v7;
}

- (void)setMuteAllOutputs:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(ASDAudioDevice *)self controls];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        int v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v8 controlScope] == 1869968496) {
          [v8 changeValue:v3];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)setOutputVolumesToNominal
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(ASDAudioDevice *)self controls];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && [v6 controlScope] == 1869968496
          && [v6 objectClass] == 1986817381)
        {
          LODWORD(v7) = 1.0;
          [v6 changeScalarValue:v7];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

- (int)performPowerStatePrewarm:(int)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v15.receiver = self;
  v15.super_class = (Class)ASDTIOA2Device;
  unsigned int v5 = -[ASDTAudioDevice performPowerStatePrewarm:](&v15, sel_performPowerStatePrewarm_);
  int v6 = v5;
  if (a3 != 1970304877 || v5) {
    return v6;
  }
  double v7 = ASDTIOA2LogType();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    long long v8 = [(ASDAudioDevice *)self deviceUID];
    *(_DWORD *)AudioStreamBasicDescription buf = 138412290;
    uint64_t v17 = v8;
    _os_log_impl(&dword_248A1B000, v7, OS_LOG_TYPE_DEFAULT, "%@ Starting IO", buf, 0xCu);
  }
  if ([(ASDTIOA2Device *)self ioRequestBegin])
  {
    v14.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 552);
    v14.__owns_ = 1;
    std::mutex::lock((std::mutex *)((char *)self + 552));
    ++*((void *)self + 123);
    *((unsigned char *)self + 965) = 0;
    if (![(ASDTIOA2Device *)self ucDeviceStarted])
    {
      if (!ASDT::IOA2UserClient::StartIO(*((ASDT::IOA2UserClient **)self + 67)))
      {
        int v6 = 2003329396;
        goto LABEL_14;
      }
      -[ASDTIOA2Device setUcDeviceStarted:](self, "setUcDeviceStarted:", 1, v14.__m_);
    }
    int v6 = 0;
LABEL_14:
    std::unique_lock<std::mutex>::unlock(&v14);
    long long v11 = ASDTIOA2LogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = [(ASDAudioDevice *)self deviceUID];
      *(_DWORD *)AudioStreamBasicDescription buf = 138412546;
      uint64_t v17 = v12;
      __int16 v18 = 1024;
      int v19 = v6;
      _os_log_impl(&dword_248A1B000, v11, OS_LOG_TYPE_DEFAULT, "%@ Start of IO result %d", buf, 0x12u);
    }
    [(ASDTIOA2Device *)self ioRequestEnd];
    if (v14.__owns_) {
      std::mutex::unlock(v14.__m_);
    }
    return v6;
  }
  long long v9 = ASDTIOA2LogType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    long long v10 = [(ASDAudioDevice *)self deviceUID];
    *(_DWORD *)AudioStreamBasicDescription buf = 138412290;
    uint64_t v17 = v10;
    _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEFAULT, "%@ Start of IO faked.", buf, 0xCu);
  }
  return 0;
}

- (int)performPowerStatePrepare:(int)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3 == 1970303090)
  {
    v16.receiver = self;
    v16.super_class = (Class)ASDTIOA2Device;
    int v4 = [(ASDTAudioDevice *)&v16 performPowerStatePrepare:1970303090];
    if (!v4)
    {
      [(ASDTIOA2Device *)self lockConfigExclusive];
      if (ASDT::IOA2UserClient::MapEngineStatus(*((ASDT::IOA2UserClient **)self + 67), (IOAudio2EngineStatus **)self + 68))
      {
        int v4 = 0;
      }
      else
      {
        int v4 = 1852990585;
      }
      std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)buf);
    }
    return v4;
  }
  uint64_t v5 = *(void *)&a3;
  int v6 = ASDTIOA2LogType();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v7 = [(ASDAudioDevice *)self deviceUID];
    *(_DWORD *)AudioStreamBasicDescription buf = 138412290;
    __int16 v18 = v7;
    _os_log_impl(&dword_248A1B000, v6, OS_LOG_TYPE_DEFAULT, "%@ Stopping IO", buf, 0xCu);
  }
  v15.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 552);
  v15.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)self + 552));
  if ([(ASDTIOA2Device *)self delayedStopIO]
    && [(ASDTIOA2Device *)self ucDeviceStarted]
    && ![(ASDTAudioDevice *)self configurationChangesPending])
  {
    long long v9 = ASDTIOA2LogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = [(ASDAudioDevice *)self deviceUID];
      *(_DWORD *)AudioStreamBasicDescription buf = 138412290;
      __int16 v18 = v10;
      _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEFAULT, "%@ Postpone underlying StopIO", buf, 0xCu);
    }
    [(ASDTIOA2Device *)self _requestUnderlyingStopIO];
  }
  else
  {
    [(ASDTIOA2Device *)self setUcDeviceStarted:0];
    if (![(ASDTAudioDevice *)self terminated])
    {
      if (ASDT::IOA2UserClient::StopIO(*((ASDT::IOA2UserClient **)self + 67))) {
        int v8 = 0;
      }
      else {
        int v8 = 2003329396;
      }
      goto LABEL_20;
    }
  }
  int v8 = 0;
LABEL_20:
  std::unique_lock<std::mutex>::unlock(&v15);
  long long v11 = ASDTIOA2LogType();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = [(ASDAudioDevice *)self deviceUID];
    *(_DWORD *)AudioStreamBasicDescription buf = 138412546;
    __int16 v18 = v12;
    __int16 v19 = 1024;
    int v20 = v8;
    _os_log_impl(&dword_248A1B000, v11, OS_LOG_TYPE_DEFAULT, "%@ Stop of IO result %d", buf, 0x12u);
  }
  v14.receiver = self;
  v14.super_class = (Class)ASDTIOA2Device;
  int v4 = [(ASDTAudioDevice *)&v14 performPowerStatePrepare:v5];
  if (v15.__owns_) {
    std::mutex::unlock(v15.__m_);
  }
  return v4;
}

- (int)performPowerStateIdle:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 1684628588)
  {
    [(ASDTIOA2Device *)self lockConfigExclusive];
    ASDT::IOUserClient::ReleaseMemory(*((ASDT::IOUserClient **)self + 67), *((void **)self + 68));
    *((void *)self + 68) = 0;
    std::unique_lock<std::shared_mutex>::~unique_lock[abi:ne180100]((uint64_t)v7);
  }
  v6.receiver = self;
  v6.super_class = (Class)ASDTIOA2Device;
  return [(ASDTAudioDevice *)&v6 performPowerStateIdle:v3];
}

- (void)_requestUnderlyingStopIO
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  int v4 = (void *)*((void *)self + 123);
  *((unsigned char *)self + 965) = 1;
  objc_initWeak(&location, self);
  uint64_t v5 = *((void *)self + 122);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ASDTIOA2Device__requestUnderlyingStopIO__block_invoke;
  block[3] = &unk_265246270;
  objc_copyWeak(v7, &location);
  v7[1] = v4;
  dispatch_after(v3, v5, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __42__ASDTIOA2Device__requestUnderlyingStopIO__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performUnderlyingStopIO:*(void *)(a1 + 40)];
}

- (void)_performUnderlyingStopIO:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = (std::mutex *)((char *)self + 552);
  std::mutex::lock((std::mutex *)((char *)self + 552));
  if (*((unsigned char *)self + 965) && *((void *)self + 123) == a3)
  {
    objc_super v6 = ASDTIOA2LogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = [(ASDAudioDevice *)self deviceUID];
      int v13 = 138412290;
      uint64_t v14 = (uint64_t)v7;
      _os_log_impl(&dword_248A1B000, v6, OS_LOG_TYPE_DEFAULT, "%@ PerformUnderlyingStopIO", (uint8_t *)&v13, 0xCu);
    }
    *((unsigned char *)self + 965) = 0;
    if ([(ASDTIOA2Device *)self ucDeviceStarted])
    {
      [(ASDTIOA2Device *)self setUcDeviceStarted:0];
      BOOL v8 = [(ASDTAudioDevice *)self terminated]
        || ASDT::IOA2UserClient::StopIO(*((ASDT::IOA2UserClient **)self + 67));
      long long v9 = ASDTIOA2LogType();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [(ASDAudioDevice *)self deviceUID];
        long long v11 = (void *)v10;
        long long v12 = "failed";
        if (v8) {
          long long v12 = "succeeded";
        }
        int v13 = 138412546;
        uint64_t v14 = v10;
        __int16 v15 = 2080;
        objc_super v16 = v12;
        _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEFAULT, "%@ PerformUnderlyingStopIO %s", (uint8_t *)&v13, 0x16u);
      }
    }
    else
    {
      long long v9 = ASDTIOA2LogType();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        [(ASDAudioDevice *)self deviceUID];
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2Device _performUnderlyingStopIO:]();
      }
    }
  }
  std::mutex::unlock(v5);
}

- (void)forceStopIO
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  dispatch_time_t v3 = ASDTIOA2LogType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = [(ASDAudioDevice *)self deviceUID];
    int v5 = *((unsigned __int8 *)self + 965);
    *(_DWORD *)AudioStreamBasicDescription buf = 138412546;
    long long v9 = v4;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_248A1B000, v3, OS_LOG_TYPE_DEFAULT, "%@ forceStopIO, shouldStopIO %d", buf, 0x12u);
  }
  objc_super v6 = *((void *)self + 122);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__ASDTIOA2Device_forceStopIO__block_invoke;
  block[3] = &unk_265246388;
  void block[4] = self;
  dispatch_sync(v6, block);
}

uint64_t __29__ASDTIOA2Device_forceStopIO__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performUnderlyingStopIO:*(void *)(*(void *)(a1 + 32) + 984)];
}

- (int)systemSleepPending
{
  [(ASDTIOA2Device *)self forceStopIO];
  v4.receiver = self;
  v4.super_class = (Class)ASDTIOA2Device;
  return [(ASDTAudioDevice *)&v4 systemSleepPending];
}

- (id)updateClientOutputPositionBlock
{
  id v2 = [(ASDTIOA2Device *)self engineStatusIndirection];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__ASDTIOA2Device_updateClientOutputPositionBlock__block_invoke;
  v5[3] = &__block_descriptor_40_e8_v16__0Q8l;
  v5[4] = v2;
  dispatch_time_t v3 = (void *)MEMORY[0x24C588C90](v5);
  return v3;
}

uint64_t __49__ASDTIOA2Device_updateClientOutputPositionBlock__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = **(void **)(result + 32);
  if (v2) {
    *(void *)(v2 + 32) = a2;
  }
  return result;
}

- (id)updateClientInputPositionBlock
{
  uint64_t v2 = [(ASDTIOA2Device *)self engineStatusIndirection];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__ASDTIOA2Device_updateClientInputPositionBlock__block_invoke;
  v5[3] = &__block_descriptor_40_e8_v16__0Q8l;
  v5[4] = v2;
  dispatch_time_t v3 = (void *)MEMORY[0x24C588C90](v5);
  return v3;
}

uint64_t __48__ASDTIOA2Device_updateClientInputPositionBlock__block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = **(void **)(result + 32);
  if (v2) {
    *(void *)(v2 + 24) = a2;
  }
  return result;
}

- (BOOL)_setStreamActive:(BOOL)a3 streamUCID:(unsigned int)a4
{
  return ASDT::IOA2UserClient::SetStreamActive(*((ASDT::IOA2UserClient **)self + 67), a4, a3);
}

- (BOOL)_setupForIsolatedIO:(unsigned int)a3 forUseCase:(unint64_t)a4 withIOFrameBufferSize:(unsigned int)a5
{
  return ASDT::IOA2UserClient::SetupForIsolatedIO(*((ASDT::IOA2UserClient **)self + 67), a3, a4, a5);
}

- (int)setupIsolatedIOForStream:(id)a3 frameSize:(unsigned int)a4 useCase:(unint64_t)a5
{
  id v8 = a3;
  objc_opt_class();
  int v9 = 561214578;
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    if ([v10 usesIsolatedIO])
    {
      if (ASDT::IOA2UserClient::SetupForIsolatedIO(*((ASDT::IOA2UserClient **)self + 67), [v10 userClientID], a5, a4))
      {
        int v9 = 0;
      }
      else
      {
        int v9 = 2003329396;
      }
    }
  }
  return v9;
}

- (BOOL)_teardownForIsolatedIO:(unsigned int)a3 forUseCase:(unint64_t)a4
{
  return ASDT::IOA2UserClient::TeardownForIsolatedIO(*((ASDT::IOA2UserClient **)self + 67), a3, a4);
}

- (int)teardownIsolatedIOForStream:(id)a3 useCase:(unint64_t)a4
{
  id v6 = a3;
  objc_opt_class();
  int v7 = 561214578;
  if (objc_opt_isKindOfClass())
  {
    id v8 = v6;
    if ([v8 usesIsolatedIO])
    {
      if (ASDT::IOA2UserClient::TeardownForIsolatedIO(*((ASDT::IOA2UserClient **)self + 67), [v8 userClientID], a4))
      {
        int v7 = 0;
      }
      else
      {
        int v7 = 2003329396;
      }
    }
  }
  return v7;
}

- (IOAudio2EngineStatus)_getIOA2EngineStatus
{
  return (IOAudio2EngineStatus *)*((void *)self + 68);
}

- (IOAudio2EngineStatus)engineStatusIndirection
{
  return (IOAudio2EngineStatus **)((char *)self + 544);
}

- (unsigned)_getIOBufferFrameSize
{
  return ASDT::IOA2UserClient::GetRingBufferSize(*((ASDT::IOA2UserClient **)self + 67));
}

- (BOOL)_mapIOBuffer:(char *)a3 ofSize:(unsigned int *)a4 forStream:(unsigned int)a5
{
  return ASDT::IOA2UserClient::MapIOBufferForStream(*((ASDT::IOA2UserClient **)self + 67), a5, a4, (unsigned __int8 **)a3);
}

- (void)_releaseIOBuffer:(char *)a3
{
}

- (id)_streamInfoForStream:(unsigned int)a3
{
  ASDT::IOA2UserClient::CopyStreamDictionaryByID(*((ASDT::IOA2UserClient **)self + 67), a3, (applesauce::CF::DictionaryRef *)&v6);
  id v3 = v6;
  objc_super v4 = v3;
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (id)_controlDictionaryForControl:(unsigned int)a3
{
  ASDT::IOA2UserClient::CopyControlDictionaryByID(*((ASDT::IOA2UserClient **)self + 67), *(const applesauce::CF::ArrayRef **)&a3, (applesauce::CF::DictionaryRef *)&v6);
  id v3 = v6;
  objc_super v4 = v3;
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (BOOL)_setControlValue:(unsigned int *)a3 forControl:(unsigned int)a4
{
  return ASDT::IOA2UserClient::SetControlValue(*((ASDT::IOA2UserClient **)self + 67), a4, a3);
}

- (BOOL)_setControlValues:(const unsigned int *)a3 withCount:(unint64_t)a4 resultValues:(unsigned int *)a5 count:(unint64_t *)a6 forControl:(unsigned int)a7
{
  if (a6) {
    unsigned int v8 = *(_DWORD *)a6;
  }
  else {
    unsigned int v8 = 0;
  }
  unsigned int v11 = v8;
  BOOL v9 = ASDT::IOA2UserClient::SetMultiControlValue(*((ASDT::IOA2UserClient **)self + 67), a7, a3, a4, a5, &v11);
  if (a6 && v9) {
    *a6 = v11;
  }
  return v9;
}

- (id)_channelLayoutForDirection:(unsigned int)a3
{
  ASDT::IOA2UserClient::CopyDefaultChannelLayoutData(*((ASDT::IOA2UserClient **)self + 67), a3 == 1768845428, (applesauce::CF::DataRef *)&v6);
  id v3 = v6;
  objc_super v4 = v3;
  if (v3) {
    CFRelease(v3);
  }
  return v4;
}

- (void)clearOutputBuffers
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = [(ASDAudioDevice *)self outputStreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) clearBuffer];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)clearInputBuffers
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v2 = [(ASDAudioDevice *)self inputStreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) clearBuffer];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)writeZerosToMixMilliseconds:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(ASDTIOA2Device *)self lockConfigShared];
  uint64_t v5 = *((void *)self + 68);
  if (v5)
  {
    uint64_t v6 = *(void *)(v5 + 32);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v7 = [(ASDAudioDevice *)self outputStreams];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10++) writeZerosToMixMilliseconds:v3 atSampleTime:v6];
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
  }
  std::shared_lock<std::shared_mutex>::~shared_lock[abi:ne180100]((uint64_t)v15);
}

+ (id)matcherWithDelegate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F28C90]) initForIOServiceWithClassName:@"IOAudio2Device" withDelegate:v3];

  return v4;
}

- (BOOL)delayedStopIO
{
  return *((unsigned char *)self + 964);
}

- (void)setDelayedStopIO:(BOOL)a3
{
  *((unsigned char *)self + 964) = a3;
}

- (NSMapTable)customPropertySelectorMap
{
  return (NSMapTable *)*((void *)self + 121);
}

- (void)setCustomPropertySelectorMap:(id)a3
{
}

- (OS_dispatch_queue)stopIOQueue
{
  return (OS_dispatch_queue *)*((void *)self + 122);
}

- (void)setStopIOQueue:(id)a3
{
}

- (unint64_t)currentSeed
{
  return *((void *)self + 123);
}

- (void)setCurrentSeed:(unint64_t)a3
{
  *((void *)self + 123) = a3;
}

- (BOOL)shouldStopIO
{
  return *((unsigned char *)self + 965);
}

- (void)setShouldStopIO:(BOOL)a3
{
  *((unsigned char *)self + 965) = a3;
}

- (BOOL)ucDeviceStarted
{
  return *((unsigned char *)self + 966);
}

- (void)setUcDeviceStarted:(BOOL)a3
{
  *((unsigned char *)self + 966) = a3;
}

- (OS_dispatch_queue)ucDeviceNotificationQueue
{
  return (OS_dispatch_queue *)*((void *)self + 124);
}

- (void)setUcDeviceNotificationQueue:(id)a3
{
}

- (BOOL)notifiedIORunning
{
  return *((unsigned char *)self + 967);
}

- (void)setNotifiedIORunning:(BOOL)a3
{
  *((unsigned char *)self + 967) = a3;
}

- (NSString)exclavesInputBufferName
{
  return (NSString *)*((void *)self + 125);
}

- (void)setExclavesInputBufferName:(id)a3
{
}

- (NSString)exclavesInjectionBufferName
{
  return (NSString *)*((void *)self + 126);
}

- (void)setExclavesInjectionBufferName:(id)a3
{
}

- (unint64_t)isolatedInputUseCaseID
{
  return *((void *)self + 127);
}

- (void)setIsolatedInputUseCaseID:(unint64_t)a3
{
  *((void *)self + 127) = a3;
}

- (ASDTIOA2InjectionStream)injectionStream
{
  return (ASDTIOA2InjectionStream *)*((void *)self + 128);
}

- (void)setInjectionStream:(id)a3
{
}

- (ASDTCustomProperty)injectionStreamEnableProperty
{
  return (ASDTCustomProperty *)*((void *)self + 129);
}

- (void)setInjectionStreamEnableProperty:(id)a3
{
}

- (OS_dispatch_queue)concurrentQueue
{
  return (OS_dispatch_queue *)*((void *)self + 130);
}

- (void)setConcurrentQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 130, 0);
  objc_storeStrong((id *)self + 129, 0);
  objc_storeStrong((id *)self + 128, 0);
  objc_storeStrong((id *)self + 126, 0);
  objc_storeStrong((id *)self + 125, 0);
  objc_storeStrong((id *)self + 124, 0);
  objc_storeStrong((id *)self + 122, 0);
  objc_storeStrong((id *)self + 121, 0);
  std::condition_variable::~condition_variable((std::condition_variable *)self + 19);
  std::mutex::~mutex((std::mutex *)((char *)self + 848));
  id v3 = (std::__shared_weak_count *)*((void *)self + 105);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)self + 784));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)self + 728));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)self + 680));
  std::mutex::~mutex((std::mutex *)((char *)self + 616));
  std::mutex::~mutex((std::mutex *)((char *)self + 552));
  uint64_t v4 = *((void *)self + 67);
  *((void *)self + 67) = 0;
  if (v4)
  {
    uint64_t v5 = *(void (**)(void))(*(void *)v4 + 8);
    v5();
  }
}

- (id).cxx_construct
{
  *((void *)self + 67) = 0;
  *((void *)self + 69) = 850045863;
  *((void *)self + 76) = 0;
  *((_OWORD *)self + 37) = 0u;
  *((_OWORD *)self + 36) = 0u;
  *((_OWORD *)self + 35) = 0u;
  std::__shared_mutex_base::__shared_mutex_base((std::__shared_mutex_base *)((char *)self + 616));
  *((void *)self + 98) = 1018212795;
  *(_OWORD *)((char *)self + 792) = 0u;
  *(_OWORD *)((char *)self + 808) = 0u;
  *((void *)self + 103) = 0;
  id v3 = operator new(0x58uLL);
  v3[1] = 0;
  v3[2] = 0;
  void *v3 = &unk_26FCADDD0;
  v3[3] = 850045863;
  *((_OWORD *)v3 + 2) = 0u;
  *((_OWORD *)v3 + 3) = 0u;
  *((_OWORD *)v3 + 4) = 0u;
  v3[10] = 0;
  *((void *)self + 104) = v3 + 3;
  *((void *)self + 105) = v3;
  *((void *)self + 106) = 850045863;
  *(_OWORD *)((char *)self + 856) = 0u;
  *(_OWORD *)((char *)self + 872) = 0u;
  *(_OWORD *)((char *)self + 888) = 0u;
  *((void *)self + 113) = 0;
  *((void *)self + 114) = 1018212795;
  *(_OWORD *)((char *)self + 936) = 0u;
  *((void *)self + 119) = 0;
  *(_OWORD *)((char *)self + 920) = 0u;
  return self;
}

- (void)initWithIOA2Device:config:deviceManager:plugin:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@: Failed to allocate dispatch queue.", v5);
}

- (void)initWithIOA2Device:config:deviceManager:plugin:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@: Error creating streams", v5);
}

- (void)initWithIOA2Device:config:deviceManager:plugin:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@: Error creating device properties.", v5);
}

- (void)initWithIOA2Device:config:deviceManager:plugin:.cold.5()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@: Failed to open connection.", v5);
}

- (void)initWithIOA2Device:(void *)a1 config:(uint64_t)a2 deviceManager:(uint8_t *)buf plugin:(os_log_t)log .cold.6(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)AudioStreamBasicDescription buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_248A1B000, log, OS_LOG_TYPE_ERROR, "ASDTIOA2Device: Configuration device UID does not match: %@ vs. %@", buf, 0x16u);
}

- (void)ioRequestBegin
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v4 = OUTLINED_FUNCTION_3_0(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_5_0(v4, v5, v6);
  OUTLINED_FUNCTION_6_0(&dword_248A1B000, "%@: %s: IORequestCount: %d", v7, v8);
}

- (void)doConfigChange:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@: Engine status is not released!", v5);
}

- (void)doConfigChange:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@: Error performing config change.", v5);
}

- (void)_setSamplingRate:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@: Failed to set nominal sampling rate.", v5);
}

- (void)_getCurrentFormatForStream:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.778e-34);
  *(_WORD *)(v3 + 12) = 1024;
  *(_DWORD *)(v3 + 14) = v4;
  _os_log_error_impl(&dword_248A1B000, v6, OS_LOG_TYPE_ERROR, "%@: Failed to retrieve format for stream %u", v5, 0x12u);
}

- (void)_openConnection
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@: Failed to set notification handler.", v5);
}

- (uint64_t)_openConnection
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

- (void)_performUnderlyingStopIO:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@ PerformUnderlyingStopIO ucDevice not started.", v5);
}

@end