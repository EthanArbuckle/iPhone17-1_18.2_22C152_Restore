@interface ASDTIOA2LegacyDevice
+ (id)matcherWithDelegate:(id)a3;
- (ASDTIOA2LegacyDevice)initWithIOA2Device:(unsigned int)a3 plugin:(id)a4;
- (AudioStreamBasicDescription)_currentFormatForStream:(SEL)a3;
- (BOOL)_openConnection;
- (BOOL)_setControlValue:(unsigned int *)a3 forControl:(unsigned int)a4;
- (BOOL)_setControlValues:(const unsigned int *)a3 withCount:(unint64_t)a4 resultValues:(unsigned int *)a5 count:(unint64_t *)a6 forControl:(unsigned int)a7;
- (BOOL)_updateControls:(void *)a3;
- (BOOL)_updateStreams;
- (BOOL)delayedStopIO;
- (BOOL)shouldStopIO;
- (BOOL)startIORequest;
- (BOOL)subclassUpdateControls;
- (BOOL)ucDeviceStarted;
- (IOA2UCDevice)ioa2Device;
- (NSMapTable)customPropertySelectorMap;
- (OS_dispatch_queue)stopIOQueue;
- timestampPeriod;
- (array<std::vector<unsigned)_getStreamListUCIDLists;
- (double)samplingRate;
- (id).cxx_construct;
- (id)_availableFormatsForStream:(unsigned int)a3;
- (id)_controlDictionaryForControl:(unsigned int)a3;
- (id)_getControlByUCID:(unsigned int)a3;
- (id)_getStreamByUCID:(unsigned int)a3;
- (id)_markOrCreateControlsWithDictionaries:(id)a3;
- (id)_markOrCreateStreamsWithIDs:(vector<unsigned)int direction:(std:(unsigned int)a4 :allocator<unsigned int>> *)a3;
- (id)_synchronizeStreamsOrReturnForRemoval:(id)a3;
- (id)createStreamForUserClientID:(unsigned int)a3 direction:(unsigned int)a4;
- (id)customDataPropertyWithKey:(id)a3;
- (id)customPropertyWithKey:(id)a3;
- (id)deviceName;
- (id)getKeyForCustomPropertyWithSelector:(unsigned int)a3;
- (id)getZeroTimestampBlock;
- (id)manufacturerName;
- (id)modelUID;
- (id)samplingRates;
- (id)updateClientInputPositionBlock;
- (id)updateClientOutputPositionBlock;
- (int)doStartIO;
- (int)doStopIO;
- (int)performStartIO;
- (int)performStopIO;
- (uint64_t)timestampPeriod;
- (unint64_t)currentSeed;
- (unique_lock<std::recursive_mutex>)scopedLock;
- (unsigned)_streamStartingChannel:(unsigned int)a3;
- (unsigned)clockDomain;
- (unsigned)customUInt32WithKey:(id)a3 defaultValue:(unsigned int)a4;
- (unsigned)inputLatency;
- (unsigned)inputSafetyOffset;
- (unsigned)outputLatency;
- (unsigned)outputSafetyOffset;
- (unsigned)timestampPeriod;
- (unsigned)transportType;
- (void)_addControls:(id)a3;
- (void)_addInputStreams:(id)a3;
- (void)_addOutputStreams:(id)a3;
- (void)_closeConnection;
- (void)_mapIOBuffer:(char *)a3 ofSize:(unsigned int *)a4 forStream:(unsigned int)a5;
- (void)_mapIOBuffers;
- (void)_performUnderlyingStopIO:(unint64_t)a3;
- (void)_pushStreamActiveStates;
- (void)_releaseIOBuffer:(char *)a3 forStream:(unsigned int)a4;
- (void)_releaseIOBuffers;
- (void)_removeControls:(id)a3;
- (void)_removeInputStreams:(id)a3;
- (void)_removeOutputStreams:(id)a3;
- (void)_requestUnderlyingStopIO;
- (void)_setCurrentFormat:(AudioStreamBasicDescription *)a3 forStream:(unsigned int)a4;
- (void)_setStreamActive:(BOOL)a3 streamUCID:(unsigned int)a4;
- (void)blockIORequests;
- (void)clearInputBuffers;
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
- (void)ioa2Device;
- (void)releaseIORequests;
- (void)setCurrentSeed:(unint64_t)a3;
- (void)setCustomPropertySelectorMap:(id)a3;
- (void)setDelayedStopIO:(BOOL)a3;
- (void)setMuteAllOutputs:(BOOL)a3;
- (void)setOutputVolumesToNominal;
- (void)setSamplingRate:(double)a3;
- (void)setShouldStopIO:(BOOL)a3;
- (void)setStopIOQueue:(id)a3;
- (void)setUcDeviceStarted:(BOOL)a3;
- (void)setupCustomPropertySelectorMap;
- (void)startIORequest;
- (void)stopIORequest;
- (void)timestampPeriod;
- (void)writeZerosToMixMilliseconds:(unsigned int)a3;
@end

@implementation ASDTIOA2LegacyDevice

- (ASDTIOA2LegacyDevice)initWithIOA2Device:(unsigned int)a3 plugin:(id)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = a4;
  operator new();
}

void __50__ASDTIOA2LegacyDevice_initWithIOA2Device_plugin___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 624);
  unsigned int v3 = *(_DWORD *)(*(void *)(v1 + 552) + 8);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = ___ZZ50__ASDTIOA2LegacyDevice_initWithIOA2Device_plugin__ENK3__0clEv_block_invoke;
  v4[3] = &unk_2652462F8;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  CADeprecated::CADispatchQueue::InstallMachPortReceiver(v2, v3, v4);
  objc_destroyWeak(&v5);
}

- (void)dealloc
{
  [(ASDTIOA2LegacyDevice *)self _closeConnection];
  v3.receiver = self;
  v3.super_class = (Class)ASDTIOA2LegacyDevice;
  [(ASDAudioDevice *)&v3 dealloc];
}

- (void)handleMachPortMessage
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_248A1B000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, " HALS_IOA2Device::_IOAudio2DeviceNotificationPortMessageHandler: failed to receive the message, Error: 0x%X", (uint8_t *)v1, 8u);
}

- (void)blockIORequests
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v4 = OUTLINED_FUNCTION_3_0(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_5_0(v4, v5, v6);
  OUTLINED_FUNCTION_6_0(&dword_248A1B000, "%@: %s: IORequestCount: %d", v7, v8);
}

- (void)releaseIORequests
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v4 = OUTLINED_FUNCTION_3_0(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_5_0(v4, v5, v6);
  OUTLINED_FUNCTION_6_0(&dword_248A1B000, "%@: %s: IORequestCount: %d", v7, v8);
}

- (BOOL)startIORequest
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v12.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 808);
  v12.__owns_ = 1;
  std::mutex::lock((std::mutex *)((char *)self + 808));
  v3.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_ + 2000000000;
  uint64_t v4 = (int *)((char *)self + 920);
  while (1)
  {
    int v5 = *v4;
    if (*v4 < 1) {
      break;
    }
    if (std::chrono::steady_clock::now().__d_.__rep_ >= v3.__d_.__rep_) {
      goto LABEL_18;
    }
    v6.__d_.__rep_ = v3.__d_.__rep_ - std::chrono::steady_clock::now().__d_.__rep_;
    if (v6.__d_.__rep_ >= 1)
    {
      std::chrono::steady_clock::now();
      v7.__d_.__rep_ = std::chrono::system_clock::now().__d_.__rep_;
      if (!v7.__d_.__rep_)
      {
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8 = 0;
        goto LABEL_13;
      }
      if (v7.__d_.__rep_ < 1)
      {
        if ((unint64_t)v7.__d_.__rep_ >= 0xFFDF3B645A1CAC09) {
          goto LABEL_12;
        }
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8 = 0x8000000000000000;
      }
      else
      {
        if ((unint64_t)v7.__d_.__rep_ > 0x20C49BA5E353F7)
        {
          std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_13;
        }
LABEL_12:
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8 = 1000 * v7.__d_.__rep_;
LABEL_13:
        if (v8 > (v6.__d_.__rep_ ^ 0x7FFFFFFFFFFFFFFFLL))
        {
          v9.__d_.__rep_ = 0x7FFFFFFFFFFFFFFFLL;
LABEL_16:
          std::condition_variable::__do_timed_wait((std::condition_variable *)((char *)self + 872), &v12, v9);
          std::chrono::steady_clock::now();
          goto LABEL_17;
        }
      }
      v9.__d_.__rep_ = v8 + v6.__d_.__rep_;
      goto LABEL_16;
    }
LABEL_17:
    if (std::chrono::steady_clock::now().__d_.__rep_ >= v3.__d_.__rep_)
    {
LABEL_18:
      v10 = ASDTBaseLogType();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        [(ASDAudioDevice *)self deviceUID];
        objc_claimAutoreleasedReturnValue();
        -[ASDTIOA2LegacyDevice startIORequest]();
      }
      goto LABEL_22;
    }
  }
  --*v4;
  v10 = ASDTBaseLogType();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    [(ASDAudioDevice *)self deviceUID];
    objc_claimAutoreleasedReturnValue();
    -[ASDTIOA2LegacyDevice startIORequest]();
  }
LABEL_22:

  if (v12.__owns_) {
    std::mutex::unlock(v12.__m_);
  }
  return v5 < 1;
}

- (void)stopIORequest
{
  OUTLINED_FUNCTION_4_0();
  uint64_t v4 = OUTLINED_FUNCTION_3_0(v1, 5.7781e-34, v2, v3);
  OUTLINED_FUNCTION_5_0(v4, v5, v6);
  OUTLINED_FUNCTION_6_0(&dword_248A1B000, "%@: %s: IORequestCount: %d", v7, v8);
}

- (void)handleConfigChange:(IOAudio2Notification *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = ASDTBaseLogType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(ASDAudioDevice *)self deviceUID];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_248A1B000, v5, OS_LOG_TYPE_DEFAULT, "%@: Handle configuration change.", (uint8_t *)&buf, 0xCu);
  }
  [(ASDTIOA2LegacyDevice *)self blockIORequests];
  if ([(ASDAudioDevice *)self isRunning])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v12 = 0x5012000000;
    uint64_t v13 = __Block_byref_object_copy__0;
    v14 = __Block_byref_object_dispose__0;
    v15 = &unk_248A60C85;
    long long v7 = *(_OWORD *)&a3->var4;
    long long v16 = *(_OWORD *)&a3->var0;
    long long v17 = v7;
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __43__ASDTIOA2LegacyDevice_handleConfigChange___block_invoke;
    v8[3] = &unk_265246320;
    objc_copyWeak(&v9, &location);
    v8[4] = &buf;
    [(ASDAudioDevice *)self requestConfigurationChange:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    [(ASDTIOA2LegacyDevice *)self doConfigChange:a3];
    [(ASDTIOA2LegacyDevice *)self releaseIORequests];
  }
}

void __43__ASDTIOA2LegacyDevice_handleConfigChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained doConfigChange:*(void *)(*(void *)(a1 + 32) + 8) + 48];

  id v4 = objc_loadWeakRetained(v2);
  [v4 releaseIORequests];
}

- (void)doConfigChange:(IOAudio2Notification *)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v5 = ASDTBaseLogType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(ASDAudioDevice *)self deviceUID];
    *(_DWORD *)long long buf = 138412290;
    *(void *)&buf[4] = v6;
    _os_log_impl(&dword_248A1B000, v5, OS_LOG_TYPE_DEFAULT, "%@: Do configuration change.", buf, 0xCu);
  }
  [(ASDTIOA2LegacyDevice *)self forceStopIO];
  [(ASDTIOA2LegacyDevice *)self scopedLock];
  int v7 = ASDT::IOA2UCDevice::PerformConfigChange(*((ASDT::IOA2UCDevice **)self + 67), a3);
  if (v7)
  {
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_impl(&dword_248A1B000, v8, OS_LOG_TYPE_DEFAULT, "Error performing config change: %d", (uint8_t *)v10, 8u);
    }
  }
  std::mutex::lock((std::mutex *)((char *)self + 696));
  std::condition_variable::notify_all((std::condition_variable *)((char *)self + 760));
  id v9 = ASDTBaseLogType();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10[0]) = 0;
    _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_INFO, "Signaled sample rate waiting thread", (uint8_t *)v10, 2u);
  }

  std::mutex::unlock((std::mutex *)((char *)self + 696));
  [(ASDTIOA2LegacyDevice *)self _releaseIOBuffers];
  ASDT::IOA2UCDevice::ReleaseEngineStatus(*((void *)self + 67), *((void **)self + 68));
  *((void *)self + 68) = 0;
  (*(void (**)(void))(**((void **)self + 67) + 16))(*((void *)self + 67));
  (*(void (**)(void))(**((void **)self + 67) + 24))(*((void *)self + 67));
  [(ASDTIOA2LegacyDevice *)self setupCustomPropertySelectorMap];
  [(ASDTIOA2LegacyDevice *)self _updateStreams];
  [(ASDTIOA2LegacyDevice *)self _updateControls:buf];
  ASDT::IOA2UCDevice::MapEngineStatus(*((ASDT::IOA2UCDevice **)self + 67), (IOAudio2EngineStatus **)self + 68);
  [(ASDTIOA2LegacyDevice *)self _mapIOBuffers];
  [(ASDTIOA2LegacyDevice *)self _pushStreamActiveStates];
  if (buf[8]) {
    std::recursive_mutex::unlock(*(std::recursive_mutex **)buf);
  }
}

- (void)handleControlChange:(IOAudio2Notification *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  [(ASDTIOA2LegacyDevice *)self scopedLock];
  uint64_t v5 = [(ASDTIOA2LegacyDevice *)self _getControlByUCID:a3->var0];
  unsigned int var1 = a3->var1;
  if (var1 == 1668443751)
  {
    (*(void (**)(void))(**((void **)self + 67) + 16))(*((void *)self + 67));
    std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v20);
    v10 = ASDTBaseLogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [(ASDAudioDevice *)self deviceUID];
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
      v23 = v11;
      __int16 v24 = 1024;
      unsigned int v25 = v12;
      __int16 v26 = 1024;
      int v27 = v14;
      __int16 v28 = 1024;
      int v29 = v16;
      __int16 v30 = 1024;
      int v31 = v18;
      _os_log_impl(&dword_248A1B000, v10, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' range change notification.", buf, 0x24u);
    }
    [v5 synchronizeWithRegistry];
  }
  else if (var1 == 1668702572)
  {
    std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v20);
    int v7 = ASDTBaseLogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8 = [(ASDAudioDevice *)self deviceUID];
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
      v23 = v8;
      __int16 v24 = 1024;
      unsigned int v25 = v9;
      __int16 v26 = 1024;
      int v27 = v13;
      __int16 v28 = 1024;
      int v29 = v15;
      __int16 v30 = 1024;
      int v31 = v17;
      __int16 v32 = 1024;
      unsigned int v33 = var2;
      _os_log_impl(&dword_248A1B000, v7, OS_LOG_TYPE_DEFAULT, "%@: Control '%c%c%c%c' value change notification: %u", buf, 0x2Au);
    }
    [v5 pushValue:a3->var2];
  }

  if (v21) {
    std::recursive_mutex::unlock(v20);
  }
}

- (void)handleTransportChanged:(IOAudio2Notification *)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  unsigned int var1 = a3->var1;
  if (var1 == 1751215220 || var1 == 1735354734)
  {
    v8[0] = HIBYTE(a3->var1);
    v8[1] = BYTE2(var1);
    v8[2] = BYTE1(var1);
    v8[3] = var1;
    v8[4] = 0;
    uint64_t v6 = ASDTBaseLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = [(ASDAudioDevice *)self deviceUID];
      -[ASDTIOA2LegacyDevice handleTransportChanged:](v7, (uint64_t)v8, buf, v6);
    }
  }
}

- (void)handleIOA2PropertyChanged:(const AudioObjectPropertyAddress *)a3 forObject:(id)a4
{
  id v7 = a4;
  uint64_t v6 = [(ASDTIOA2LegacyDevice *)self propertyChangedDelegate];
  [v6 changedProperty:a3 forObject:v7];
}

- (void)handlePropertyChanged:(IOAudio2Notification *)a3
{
  int v5 = [(ASDTIOA2LegacyDevice *)self objectID];
  uint64_t v6 = self;
  [(ASDTIOA2LegacyDevice *)v6 scopedLock];
  (*(void (**)(void))(**((void **)v6 + 67) + 16))(*((void *)v6 + 67));
  (*(void (**)(void))(**((void **)v6 + 67) + 24))(*((void *)v6 + 67));
  if (!a3->var0)
  {
    int v5 = [(ASDTIOA2LegacyDevice *)v6 objectID];
    v11 = v6;
    goto LABEL_9;
  }
  id v7 = -[ASDTIOA2LegacyDevice _getControlByUCID:](v6, "_getControlByUCID:");
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8 = [(ASDTIOA2LegacyDevice *)v6 _getStreamByUCID:a3->var0];
  unsigned int v9 = v8;
  if (v8)
  {
    int v5 = [v8 objectID];
    uint64_t v10 = v9;
  }
  else
  {
    if (!v7)
    {
      v11 = v6;
      goto LABEL_8;
    }
    std::unique_lock<std::recursive_mutex>::unlock((uint64_t)&v12);
    [v7 synchronizeWithRegistry];
    int v5 = [v7 objectID];
    uint64_t v10 = v7;
  }
  v11 = v10;

LABEL_8:
LABEL_9:
  if ((_BYTE)var4) {
    std::recursive_mutex::unlock(v12);
  }
  if (v5)
  {
    unsigned int v12 = *(std::recursive_mutex **)&a3->var2;
    int var4 = a3->var4;
    [(ASDTIOA2LegacyDevice *)v6 handleIOA2PropertyChanged:&v12 forObject:v11];
  }
}

- (array<std::vector<unsigned)_getStreamListUCIDLists
{
  char v4 = 0;
  uint64_t v5 = 0;
  *(_OWORD *)&retstr->var0[0].var2.var0 = 0u;
  *(_OWORD *)&retstr->var0[1].unsigned int var1 = 0u;
  *(_OWORD *)&retstr->var0[0].var0 = 0u;
  char v6 = 1;
  do
  {
    char v7 = v6;
    std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v8 = ASDT::IOA2UCDevice::CopyStreamList(*((ASDT::IOA2UCDevice **)self + 67), v4 & 1);
    __int16 v28 = v8;
    __int16 v29 = 1;
    if (v8)
    {
      int Count = CFArrayGetCount(v8);
      if (Count >= 1)
      {
        uint64_t v10 = 0;
        p_var0 = (void **)&retstr->var0[v5].var0;
        unsigned int v12 = (unsigned int **)(p_var0 + 1);
        int v13 = p_var0 + 2;
        do
        {
          v27.var0 = 0;
          *(_WORD *)&v27.unsigned int var1 = 1;
          CACFArray::GetCACFDictionary((CACFArray *)&v28, v10, &v27);
          if (v27.var0)
          {
            unsigned int v26 = 0;
            if (CACFDictionary::GetUInt32(&v27, @"stream ID", &v26))
            {
              int v14 = *v12;
              if ((unint64_t)*v12 >= *v13)
              {
                int v16 = (unsigned int *)*p_var0;
                uint64_t v17 = ((char *)v14 - (unsigned char *)*p_var0) >> 2;
                unint64_t v18 = v17 + 1;
                if ((unint64_t)(v17 + 1) >> 62) {
                  std::vector<char>::__throw_length_error[abi:ne180100]();
                }
                uint64_t v19 = *v13 - (void)v16;
                if (v19 >> 1 > v18) {
                  unint64_t v18 = v19 >> 1;
                }
                if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFFCLL) {
                  unint64_t v20 = 0x3FFFFFFFFFFFFFFFLL;
                }
                else {
                  unint64_t v20 = v18;
                }
                if (v20)
                {
                  char v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)(p_var0 + 2), v20);
                  int v14 = *v12;
                  int v16 = (unsigned int *)*p_var0;
                }
                else
                {
                  char v21 = 0;
                }
                v22 = (unsigned int *)&v21[4 * v17];
                unsigned int *v22 = v26;
                int v15 = v22 + 1;
                while (v14 != v16)
                {
                  unsigned int v23 = *--v14;
                  *--v22 = v23;
                }
                *p_var0 = v22;
                *unsigned int v12 = v15;
                *int v13 = &v21[4 * v20];
                if (v16) {
                  operator delete(v16);
                }
              }
              else
              {
                *int v14 = v26;
                int v15 = v14 + 1;
              }
              *unsigned int v12 = v15;
            }
          }
          CACFDictionary::~CACFDictionary(&v27);
          uint64_t v10 = (v10 + 1);
        }
        while (v10 != Count);
      }
    }
    CACFArray::~CACFArray((CACFArray *)&v28);
    char v6 = 0;
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while ((v7 & 1) != 0);
  return result;
}

- (id)_getStreamByUCID:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(ASDAudioDevice *)self inputStreams];
  char v6 = [(ASDAudioDevice *)self outputStreams];
  [v5 arrayByAddingObjectsFromArray:v6];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "userClientID", (void)v14) == a3)
        {
          id v12 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_11:

  return v12;
}

- (id)_getControlByUCID:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  char v4 = [(ASDAudioDevice *)self controls];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v8 userClientID] == a3)
        {
          id v9 = v8;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_11:

  return v9;
}

- (id)createStreamForUserClientID:(unsigned int)a3 direction:(unsigned int)a4
{
  char v4 = [[ASDTIOA2LegacyStream alloc] initWithIOA2Device:self userClientID:*(void *)&a3 direction:*(void *)&a4];
  return v4;
}

- (id)_markOrCreateStreamsWithIDs:(vector<unsigned)int direction:(std:(unsigned int)a4 :allocator<unsigned int>> *)a3
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v8 = [MEMORY[0x263EFF980] array];
  var0 = a3->var0;
  unsigned int var1 = a3->var1;
  if (a3->var0 != var1)
  {
    do
    {
      uint64_t v11 = *var0;
      long long v12 = [(ASDTIOA2LegacyDevice *)self _getStreamByUCID:v11];
      long long v13 = v12;
      if (v12)
      {
        [v12 setMarked:1];
      }
      else
      {
        long long v14 = [(ASDTIOA2LegacyDevice *)self createStreamForUserClientID:v11 direction:v4];
        if (!v14)
        {
          long long v15 = ASDTBaseLogType();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            [(ASDAudioDevice *)self deviceUID];
            objc_claimAutoreleasedReturnValue();
            -[ASDTIOA2LegacyDevice _markOrCreateStreamsWithIDs:direction:]();
          }

          uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
          long long v17 = [(ASDAudioDevice *)self deviceUID];
          [v16 handleFailureInMethod:a2, self, @"ASDTIOA2LegacyDevice.mm", 545, @"%@: Failed to create stream.", v17 object file lineNumber description];
        }
        [v8 addObject:v14];
      }
      ++var0;
    }
    while (var0 != var1);
  }
  return v8;
}

- (id)_synchronizeStreamsOrReturnForRemoval:(id)a3
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
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "marked", (void)v11)) {
          [v9 _synchronizeWithHardware];
        }
        else {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v4;
}

- (BOOL)_updateStreams
{
  id v3 = [(ASDTAudioDevice *)self allStreams];
  clearMark(v3);

  [(ASDTIOA2LegacyDevice *)self _getStreamListUCIDLists];
  __p = 0;
  long long v17 = 0;
  uint64_t v18 = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&__p, v21, v22[0], (v22[0] - (uint64_t)v21) >> 2);
  uint64_t v4 = [(ASDTIOA2LegacyDevice *)self _markOrCreateStreamsWithIDs:&__p direction:1768845428];
  if (__p)
  {
    long long v17 = __p;
    operator delete(__p);
  }
  long long v13 = 0;
  long long v14 = 0;
  uint64_t v15 = 0;
  std::vector<unsigned int>::__init_with_size[abi:ne180100]<unsigned int *,unsigned int *>(&v13, v19, v20, (v20 - (uint64_t)v19) >> 2);
  id v5 = [(ASDTIOA2LegacyDevice *)self _markOrCreateStreamsWithIDs:&v13 direction:1869968496];
  if (v13)
  {
    long long v14 = v13;
    operator delete(v13);
  }
  uint64_t v6 = [(ASDAudioDevice *)self inputStreams];
  uint64_t v7 = [(ASDTIOA2LegacyDevice *)self _synchronizeStreamsOrReturnForRemoval:v6];

  uint64_t v8 = [(ASDAudioDevice *)self outputStreams];
  id v9 = [(ASDTIOA2LegacyDevice *)self _synchronizeStreamsOrReturnForRemoval:v8];

  [(ASDTIOA2LegacyDevice *)self _removeInputStreams:v7];
  [(ASDTIOA2LegacyDevice *)self _removeOutputStreams:v9];
  [(ASDTIOA2LegacyDevice *)self _addInputStreams:v4];
  [(ASDTIOA2LegacyDevice *)self _addOutputStreams:v5];

  for (uint64_t i = 0; i != -6; i -= 3)
  {
    long long v11 = (void *)v22[i - 1];
    if (v11)
    {
      v22[i] = (uint64_t)v11;
      operator delete(v11);
    }
  }
  return 1;
}

- (id)_markOrCreateControlsWithDictionaries:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(MEMORY[0x263EFF980], "array", v4);
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [v9 objectForKeyedSubscript:@"control ID"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            long long v11 = -[ASDTIOA2LegacyDevice _getControlByUCID:](self, "_getControlByUCID:", [v10 unsignedIntValue]);
            long long v12 = v11;
            if (v11)
            {
              [v11 setMarked:1];
            }
            else
            {
              uint64_t v13 = +[ASDTIOA2LegacyControl controlWithDictionary:v9 owningDevice:self];
              if (v13)
              {
                long long v12 = (void *)v13;
                objc_msgSend(v15, "addObject:");
              }
              else
              {
                long long v12 = 0;
              }
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  return v15;
}

- (BOOL)subclassUpdateControls
{
  return 1;
}

- (BOOL)_updateControls:(void *)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = [(ASDAudioDevice *)self controls];
  clearMark(v5);

  unsigned int v23 = ASDT::IOA2UCDevice::CopyControlList(*((ASDT::IOA2UCDevice **)self + 67));
  uint64_t v6 = -[ASDTIOA2LegacyDevice _markOrCreateControlsWithDictionaries:](self, "_markOrCreateControlsWithDictionaries:");
  id v7 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v8 = [(ASDAudioDevice *)self controls];
  id v9 = objc_msgSend(v7, "initWithCapacity:", objc_msgSend(v8, "count"));

  uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[__CFArray count](v23, "count"));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v11 = [(ASDAudioDevice *)self controls];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v15 marked]) {
          long long v16 = v10;
        }
        else {
          long long v16 = v9;
        }
        [v16 addObject:v15];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v12);
  }

  [(ASDTIOA2LegacyDevice *)self _removeControls:v9];
  [(ASDTIOA2LegacyDevice *)self _addControls:v6];
  [v10 addObjectsFromArray:v6];
  std::unique_lock<std::recursive_mutex>::unlock((uint64_t)a3);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v17 = v10;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v17);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * j) synchronizeWithRegistry];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v18);
  }

  BOOL v21 = [(ASDTIOA2LegacyDevice *)self subclassUpdateControls];
  std::unique_lock<std::recursive_mutex>::lock((uint64_t)a3);

  return v21;
}

- (id)deviceName
{
  v6[4] = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3321888768;
  v4[2] = __34__ASDTIOA2LegacyDevice_deviceName__block_invoke;
  v4[3] = &__block_descriptor_40_ea8_32c47_ZTSKZ34__ASDTIOA2LegacyDevice_deviceName_E3__2_e15___NSString_8__0l;
  void v4[4] = &v5;
  id v5 = self;
  v6[0] = &unk_26FCAE1F0;
  v6[1] = 0;
  v6[3] = v6;
  uint64_t v2 = ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100](v6);
  return v2;
}

id __34__ASDTIOA2LegacyDevice_deviceName__block_invoke(uint64_t a1)
{
  [**(id **)(a1 + 32) scopedLock];
  uint64_t v2 = ASDT::IOA2UCDevice::CopyDeviceName(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536));
  if (v5) {
    std::recursive_mutex::unlock(v4);
  }
  return v2;
}

- (id)modelUID
{
  v6[4] = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3321888768;
  v4[2] = __32__ASDTIOA2LegacyDevice_modelUID__block_invoke;
  v4[3] = &__block_descriptor_40_ea8_32c45_ZTSKZ32__ASDTIOA2LegacyDevice_modelUID_E3__3_e15___NSString_8__0l;
  void v4[4] = &v5;
  char v5 = self;
  v6[0] = &unk_26FCAE1F0;
  v6[1] = 0;
  v6[3] = v6;
  uint64_t v2 = ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100](v6);
  return v2;
}

id __32__ASDTIOA2LegacyDevice_modelUID__block_invoke(uint64_t a1)
{
  [**(id **)(a1 + 32) scopedLock];
  uint64_t v2 = ASDT::IOA2UCDevice::CopyModelUID(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536));
  if (v5) {
    std::recursive_mutex::unlock(v4);
  }
  return v2;
}

- (id)manufacturerName
{
  v6[4] = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3321888768;
  v4[2] = __40__ASDTIOA2LegacyDevice_manufacturerName__block_invoke;
  v4[3] = &__block_descriptor_40_ea8_32c53_ZTSKZ40__ASDTIOA2LegacyDevice_manufacturerName_E3__4_e15___NSString_8__0l;
  void v4[4] = &v5;
  char v5 = self;
  v6[0] = &unk_26FCAE1F0;
  v6[1] = 0;
  v6[3] = v6;
  uint64_t v2 = ASDT::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<objc_object * ()(void)>::~__value_func[abi:ne180100](v6);
  return v2;
}

id __40__ASDTIOA2LegacyDevice_manufacturerName__block_invoke(uint64_t a1)
{
  [**(id **)(a1 + 32) scopedLock];
  uint64_t v2 = ASDT::IOA2UCDevice::CopyDeviceManufacturer(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536));
  if (v5) {
    std::recursive_mutex::unlock(v4);
  }
  return v2;
}

- (double)samplingRate
{
  v6[4] = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3321888768;
  v4[2] = __36__ASDTIOA2LegacyDevice_samplingRate__block_invoke;
  v4[3] = &__block_descriptor_40_ea8_32c49_ZTSKZ36__ASDTIOA2LegacyDevice_samplingRate_E3__5_e5_d8__0l;
  void v4[4] = &v5;
  char v5 = self;
  v6[0] = &unk_26FCAE280;
  v6[1] = 0;
  v6[3] = v6;
  double v2 = ASDT::exceptionBarrier<double({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<double ()(void)>::~__value_func[abi:ne180100](v6);
  return v2;
}

double __36__ASDTIOA2LegacyDevice_samplingRate__block_invoke(uint64_t a1)
{
  [**(id **)(a1 + 32) scopedLock];
  double NominalSampleRate = ASDT::IOA2UCDevice::GetNominalSampleRate(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536));
  if (v5) {
    std::recursive_mutex::unlock(v4);
  }
  return NominalSampleRate;
}

- (void)setSamplingRate:(double)a3
{
  v6[4] = *MEMORY[0x263EF8340];
  char v5 = self;
  double v4 = a3;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3321888768;
  v3[2] = __40__ASDTIOA2LegacyDevice_setSamplingRate___block_invoke;
  v3[3] = &__block_descriptor_48_ea8_32c53_ZTSKZ40__ASDTIOA2LegacyDevice_setSamplingRate__E3__6_e5_v8__0l;
  v3[4] = &v5;
  v3[5] = &v4;
  v6[0] = &unk_26FCAE310;
  v6[3] = v6;
  ASDT::exceptionBarrier<void({block_pointer} {__strong})(void)>(v3);
  std::__function::__value_func<void ()(void)>::~__value_func[abi:ne180100](v6);
}

void __40__ASDTIOA2LegacyDevice_setSamplingRate___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [**(id **)(a1 + 32) samplingRate];
  if (v2 != **(double **)(a1 + 40))
  {
    __lk.__m_ = (std::unique_lock<std::mutex>::mutex_type *)(**(void **)(a1 + 32) + 696);
    __lk.__owns_ = 1;
    std::mutex::lock(__lk.__m_);
    id v3 = *(id **)(a1 + 32);
    if (*v3)
    {
      [*v3 scopedLock];
      id v3 = *(id **)(a1 + 32);
    }
    else
    {
      *(void *)long long buf = 0;
      *(void *)&buf[8] = 0;
    }
    ASDT::IOA2UCDevice::SetNominalSampleRate(*((ASDT::IOA2UCDevice **)*v3 + 67), **(double **)(a1 + 40));
    if (buf[8]) {
      std::recursive_mutex::unlock(*(std::recursive_mutex **)buf);
    }
    double v5 = (double)std::chrono::system_clock::now().__d_.__rep_ + 5000000.0;
    double v6 = -9.22337204e18;
    if (v5 * 1000.0 > -9.22337204e18) {
      double v6 = v5 * 1000.0;
    }
    if (v5 * 1000.0 < 9.22337204e18) {
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v7 = (uint64_t)v6;
    }
    else {
      std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    *(void *)&long long v4 = 134218240;
    long long v30 = v4;
    while (1)
    {
      uint64_t v8 = ASDTBaseLogType();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_248A1B000, v8, OS_LOG_TYPE_INFO, "Waiting to be signaled from IOA2 config change notification thread...", buf, 2u);
      }

      uint64_t v9 = **(void **)(a1 + 32);
      if (v5 > (double)std::chrono::system_clock::now().__d_.__rep_)
      {
        v11.__d_.__rep_ = v7;
        std::condition_variable::__do_timed_wait((std::condition_variable *)(v9 + 760), &__lk, v11);
        BOOL v10 = v5 <= (double)std::chrono::system_clock::now().__d_.__rep_;
      }
      else
      {
        BOOL v10 = 1;
      }
      objc_msgSend(**(id **)(a1 + 32), "samplingRate", v30);
      double v13 = v12;
      double v14 = **(double **)(a1 + 40);
      id v15 = ASDTBaseLogType();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = **(void **)(a1 + 40);
        *(_DWORD *)long long buf = v30;
        *(double *)&uint8_t buf[4] = v13;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v16;
        _os_log_impl(&dword_248A1B000, v15, OS_LOG_TYPE_INFO, "Woke! currentRate = %f, desiredRate = %f", buf, 0x16u);
      }

      if (v10) {
        break;
      }
      if (v13 == v14) {
        goto LABEL_26;
      }
    }
    id v17 = ASDTBaseLogType();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_248A1B000, v17, OS_LOG_TYPE_DEFAULT, "SetSampleRateSynchronously timed out", buf, 2u);
    }

    if (v13 != v14)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        __40__ASDTIOA2LegacyDevice_setSamplingRate___block_invoke_cold_1();
      }
      exception = __cxa_allocate_exception(0x10uLL);
      std::to_string(&v32, **(double **)(a1 + 40));
      v22 = std::string::insert(&v32, 0, "SetSampleRateSynchronously failed. DesiredSampleRate: ");
      long long v23 = *(_OWORD *)&v22->__r_.__value_.__l.__data_;
      v33.__r_.__value_.__r.__words[2] = v22->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v33.__r_.__value_.__l.__data_ = v23;
      v22->__r_.__value_.__l.__size_ = 0;
      v22->__r_.__value_.__r.__words[2] = 0;
      v22->__r_.__value_.__r.__words[0] = 0;
      long long v24 = std::string::append(&v33, " ExistingSampleRate: ");
      long long v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
      v34.__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
      *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v25;
      v24->__r_.__value_.__l.__size_ = 0;
      v24->__r_.__value_.__r.__words[2] = 0;
      v24->__r_.__value_.__r.__words[0] = 0;
      std::to_string(&v31, v13);
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        long long v26 = &v31;
      }
      else {
        long long v26 = (std::string *)v31.__r_.__value_.__r.__words[0];
      }
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(v31.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v31.__r_.__value_.__l.__size_;
      }
      long long v28 = std::string::append(&v34, (const std::string::value_type *)v26, size);
      long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
      *(void *)&buf[16] = *((void *)&v28->__r_.__value_.__l + 2);
      *(_OWORD *)long long buf = v29;
      v28->__r_.__value_.__l.__size_ = 0;
      v28->__r_.__value_.__r.__words[2] = 0;
      v28->__r_.__value_.__r.__words[0] = 0;
      MEMORY[0x24C588610](exception, buf);
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
LABEL_26:
    uint64_t v18 = **(void ***)(a1 + 32);
    if (v18)
    {
      [v18 scopedLock];
      std::string::size_type v19 = **(void **)(a1 + 32);
    }
    else
    {
      std::string::size_type v19 = 0;
      *(void *)long long buf = 0;
      *(void *)&buf[8] = 0;
    }
    double v20 = **(double **)(a1 + 40);
    v34.__r_.__value_.__r.__words[0] = v19;
    v34.__r_.__value_.__l.__size_ = (std::string::size_type)ASDTIOA2LegacyDevice;
    unk_26FCC3FE8((objc_super *)&v34, sel_setSamplingRate_, v20);
    if (buf[8]) {
      std::recursive_mutex::unlock(*(std::recursive_mutex **)buf);
    }
    if (__lk.__owns_) {
      std::mutex::unlock(__lk.__m_);
    }
  }
}

- (id)samplingRates
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obuint64_t j = [(ASDTAudioDevice *)self allStreams];
  uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v4)
  {
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(obj);
        }
        double v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v7 = [v6 physicalFormats];
        uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v8)
        {
          uint64_t v9 = *(void *)v17;
          do
          {
            for (uint64_t j = 0; j != v8; ++j)
            {
              if (*(void *)v17 != v9) {
                objc_enumerationMutation(v7);
              }
              std::chrono::time_point<std::chrono::system_clock, std::chrono::duration<long long, std::ratio<1, 1000000000>>> v11 = NSNumber;
              [*(id *)(*((void *)&v16 + 1) + 8 * j) sampleRate];
              double v12 = objc_msgSend(v11, "numberWithDouble:");
              if ([v3 indexOfObject:v12] == 0x7FFFFFFFFFFFFFFFLL) {
                [v3 addObject:v12];
              }
            }
            uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v8);
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v4);
  }

  return v3;
}

- (unsigned)timestampPeriod
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  std::chrono::duration<long long, std::ratio<1, 1000000000>>::rep v7 = &unk_26FCAE430;
  int v8 = 0;
  uint64_t v9 = &v7;
  [(ASDTIOA2LegacyDevice *)self scopedLock];
  unsigned int RingBufferSize = ASDT::IOA2UCDevice::GetRingBufferSize(*((ASDT::IOA2UCDevice **)self + 67));
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](&v7);
  return RingBufferSize;
}

- (unsigned)inputLatency
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3321888768;
  v4[2] = __36__ASDTIOA2LegacyDevice_inputLatency__block_invoke;
  v4[3] = &__block_descriptor_40_ea8_32c49_ZTSKZ36__ASDTIOA2LegacyDevice_inputLatency_E3__8_e5_I8__0l;
  void v4[4] = &v5;
  double v5 = self;
  char v6 = &unk_26FCAE3A0;
  int v7 = 0;
  int v8 = &v6;
  unsigned int v2 = ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](&v6);
  return v2;
}

uint64_t __36__ASDTIOA2LegacyDevice_inputLatency__block_invoke(uint64_t a1)
{
  [**(id **)(a1 + 32) scopedLock];
  uint64_t Latency = ASDT::IOA2UCDevice::GetLatency(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536), 1);
  if (v5) {
    std::recursive_mutex::unlock(v4);
  }
  return Latency;
}

- (unsigned)outputLatency
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3321888768;
  v4[2] = __37__ASDTIOA2LegacyDevice_outputLatency__block_invoke;
  v4[3] = &__block_descriptor_40_ea8_32c50_ZTSKZ37__ASDTIOA2LegacyDevice_outputLatency_E3__9_e5_I8__0l;
  void v4[4] = &v5;
  char v5 = self;
  char v6 = &unk_26FCAE3A0;
  int v7 = 0;
  int v8 = &v6;
  unsigned int v2 = ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](&v6);
  return v2;
}

uint64_t __37__ASDTIOA2LegacyDevice_outputLatency__block_invoke(uint64_t a1)
{
  [**(id **)(a1 + 32) scopedLock];
  uint64_t Latency = ASDT::IOA2UCDevice::GetLatency(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536), 0);
  if (v5) {
    std::recursive_mutex::unlock(v4);
  }
  return Latency;
}

- (unsigned)inputSafetyOffset
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3321888768;
  v4[2] = __41__ASDTIOA2LegacyDevice_inputSafetyOffset__block_invoke;
  v4[3] = &__block_descriptor_40_ea8_32c55_ZTSKZ41__ASDTIOA2LegacyDevice_inputSafetyOffset_E4__10_e5_I8__0l;
  void v4[4] = &v5;
  char v5 = self;
  char v6 = &unk_26FCAE3A0;
  int v7 = 0;
  int v8 = &v6;
  unsigned int v2 = ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](&v6);
  return v2;
}

uint64_t __41__ASDTIOA2LegacyDevice_inputSafetyOffset__block_invoke(uint64_t a1)
{
  [**(id **)(a1 + 32) scopedLock];
  uint64_t SafetyOffset = ASDT::IOA2UCDevice::GetSafetyOffset(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536), 1);
  if (v5) {
    std::recursive_mutex::unlock(v4);
  }
  return SafetyOffset;
}

- (unsigned)outputSafetyOffset
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3321888768;
  v4[2] = __42__ASDTIOA2LegacyDevice_outputSafetyOffset__block_invoke;
  v4[3] = &__block_descriptor_40_ea8_32c56_ZTSKZ42__ASDTIOA2LegacyDevice_outputSafetyOffset_E4__11_e5_I8__0l;
  void v4[4] = &v5;
  char v5 = self;
  char v6 = &unk_26FCAE3A0;
  int v7 = 0;
  int v8 = &v6;
  unsigned int v2 = ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](&v6);
  return v2;
}

uint64_t __42__ASDTIOA2LegacyDevice_outputSafetyOffset__block_invoke(uint64_t a1)
{
  [**(id **)(a1 + 32) scopedLock];
  uint64_t SafetyOffset = ASDT::IOA2UCDevice::GetSafetyOffset(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536), 0);
  if (v5) {
    std::recursive_mutex::unlock(v4);
  }
  return SafetyOffset;
}

- (unsigned)transportType
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3321888768;
  v4[2] = __37__ASDTIOA2LegacyDevice_transportType__block_invoke;
  v4[3] = &__block_descriptor_40_ea8_32c51_ZTSKZ37__ASDTIOA2LegacyDevice_transportType_E4__12_e5_I8__0l;
  void v4[4] = &v5;
  char v5 = self;
  char v6 = &unk_26FCAE3A0;
  int v7 = 0;
  int v8 = &v6;
  unsigned int v2 = ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](&v6);
  return v2;
}

uint64_t __37__ASDTIOA2LegacyDevice_transportType__block_invoke(uint64_t a1)
{
  [**(id **)(a1 + 32) scopedLock];
  uint64_t TransportType = ASDT::IOA2UCDevice::GetTransportType(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536));
  if (v5) {
    std::recursive_mutex::unlock(v4);
  }
  return TransportType;
}

- (unsigned)clockDomain
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3321888768;
  v4[2] = __35__ASDTIOA2LegacyDevice_clockDomain__block_invoke;
  v4[3] = &__block_descriptor_40_ea8_32c49_ZTSKZ35__ASDTIOA2LegacyDevice_clockDomain_E4__13_e5_I8__0l;
  void v4[4] = &v5;
  char v5 = self;
  char v6 = &unk_26FCAE3A0;
  int v7 = 0;
  int v8 = &v6;
  unsigned int v2 = ASDT::exceptionBarrier<unsigned int({block_pointer} {__strong})(void)>(v4);
  std::__function::__value_func<unsigned int ()(void)>::~__value_func[abi:ne180100](&v6);
  return v2;
}

uint64_t __35__ASDTIOA2LegacyDevice_clockDomain__block_invoke(uint64_t a1)
{
  [**(id **)(a1 + 32) scopedLock];
  uint64_t ClockDomain = ASDT::IOA2UCDevice::GetClockDomain(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536));
  if (v5) {
    std::recursive_mutex::unlock(v4);
  }
  return ClockDomain;
}

- (BOOL)_openConnection
{
  return 1;
}

- (void)_closeConnection
{
  ASDT::UCObject::SetConnectionNotificationPort(*((ASDT::UCObject **)self + 67), 0, 0, 0);
  [(ASDTIOA2LegacyDevice *)self _releaseIOBuffers];
  ASDT::IOA2UCDevice::ReleaseEngineStatus(*((void *)self + 67), *((void **)self + 68));
  *((void *)self + 68) = 0;
  id v3 = (ASDT::UCObject *)*((void *)self + 67);
  ASDT::UCObject::CloseConnection(v3);
}

- (void)_pushStreamActiveStates
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned int v2 = [(ASDTAudioDevice *)self allStreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        char v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v6 _pushActiveState];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_mapIOBuffers
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned int v2 = [(ASDTAudioDevice *)self allStreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        char v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v6 _mapIOBuffer];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_releaseIOBuffers
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned int v2 = [(ASDTAudioDevice *)self allStreams];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        char v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v6 _releaseIOBuffer];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (void)_addInputStreams:(id)a3
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
        -[ASDAudioDevice addInputStream:](self, "addInputStream:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_removeInputStreams:(id)a3
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
        -[ASDAudioDevice removeInputStream:](self, "removeInputStream:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_addOutputStreams:(id)a3
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
        -[ASDAudioDevice addOutputStream:](self, "addOutputStream:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_removeOutputStreams:(id)a3
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
        -[ASDAudioDevice removeOutputStream:](self, "removeOutputStream:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
  uint64_t v2 = *((void *)self + 68);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__ASDTIOA2LegacyDevice_getZeroTimestampBlock__block_invoke;
  v5[3] = &__block_descriptor_40_e20_i36__0_d8_Q16_Q24I32l;
  v5[4] = v2;
  uint64_t v3 = (void *)MEMORY[0x24C588C90](v5, a2);
  return v3;
}

uint64_t __45__ASDTIOA2LegacyDevice_getZeroTimestampBlock__block_invoke(uint64_t a1, double *a2, unint64_t *a3, unint64_t *a4)
{
  id v4 = *(unint64_t **)(a1 + 32);
  if (!v4) {
    return 1937010544;
  }
  unint64_t v5 = v4[2];
  unint64_t v6 = v4[1];
  uint64_t result = 0;
  *a2 = (double)*v4;
  *a3 = v6;
  *a4 = v5;
  return result;
}

- (IOA2UCDevice)ioa2Device
{
  uint64_t result = (IOA2UCDevice *)*((void *)self + 67);
  if (!result) {
    -[ASDTIOA2LegacyDevice ioa2Device]();
  }
  return result;
}

- (void)setupCustomPropertySelectorMap
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = ASDT::IOA2UCDevice::CopyCustomPropertyInfo(*((ASDT::IOA2UCDevice **)self + 67));
  uint64_t v3 = objc_msgSend(MEMORY[0x263F08968], "mapTableWithKeyOptions:valueOptions:", 0, 0, v2);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [(__CFArray *)v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        long long v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        long long v9 = [v8 valueForKey:@"registry key"];
        uint64_t v10 = [v8 valueForKey:@"property selector"];
        long long v11 = (void *)v10;
        if (v9) {
          BOOL v12 = v10 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {
          [v3 setObject:v9 forKey:v10];
          uint64_t v13 = ASDTBaseLogType();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            int v14 = [v11 unsignedIntValue];
            *(_DWORD *)long long buf = 138412546;
            long long v21 = v9;
            __int16 v22 = 1024;
            int v23 = v14;
            _os_log_debug_impl(&dword_248A1B000, v13, OS_LOG_TYPE_DEBUG, "Registry Key: %@, Selector: %u", buf, 0x12u);
          }
        }
      }
      uint64_t v5 = [(__CFArray *)v4 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }

  [(ASDTIOA2LegacyDevice *)self setCustomPropertySelectorMap:v3];
}

- (id)getKeyForCustomPropertyWithSelector:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(ASDTIOA2LegacyDevice *)self customPropertySelectorMap];
  uint64_t v5 = [NSNumber numberWithUnsignedInt:v3];
  uint64_t v6 = [v4 objectForKey:v5];

  return v6;
}

- (id)customPropertyWithKey:(id)a3
{
  id v5 = 0;
  ASDT::UCObject::CopyProperty_CFDictionary(*((ASDT::UCObject **)self + 67), (const __CFString *)a3, (CFTypeRef *)&v5);
  id v3 = v5;
  return v3;
}

- (unsigned)customUInt32WithKey:(id)a3 defaultValue:(unsigned int)a4
{
  unsigned int v6 = a4;
  if (ASDT::UCObject::CopyProperty_UInt32(*((ASDT::UCObject **)self + 67), (const __CFString *)a3, &v6)) {
    return v6;
  }
  else {
    return a4;
  }
}

- (id)customDataPropertyWithKey:(id)a3
{
  id v5 = 0;
  if (ASDT::UCObject::CopyProperty_CFData(*((ASDT::UCObject **)self + 67), (const __CFString *)a3, (CFTypeRef *)&v5)) {
    id v3 = v5;
  }
  else {
    id v3 = 0;
  }
  return v3;
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
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
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
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = [(ASDAudioDevice *)self controls];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 controlScope] == 1869968496) {
          [v6 changeDecibelValue:0.0];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

- (int)doStartIO
{
  uint64_t v4 = self;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3321888768;
  v3[2] = __33__ASDTIOA2LegacyDevice_doStartIO__block_invoke;
  v3[3] = &__block_descriptor_40_ea8_32c47_ZTSKZ33__ASDTIOA2LegacyDevice_doStartIO_E4__14_e5_v8__0l;
  v3[4] = &v4;
  if (ASDT::exceptionBarrierReturnSuccess(v3)) {
    return 0;
  }
  else {
    return 2003329396;
  }
}

uint64_t __33__ASDTIOA2LegacyDevice_doStartIO__block_invoke(uint64_t a1)
{
  return ASDT::IOA2UCDevice::StartIO(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536));
}

- (int)doStopIO
{
  uint64_t v4 = self;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3321888768;
  v3[2] = __32__ASDTIOA2LegacyDevice_doStopIO__block_invoke;
  v3[3] = &__block_descriptor_40_ea8_32c46_ZTSKZ32__ASDTIOA2LegacyDevice_doStopIO_E4__15_e5_v8__0l;
  v3[4] = &v4;
  if (ASDT::exceptionBarrierReturnSuccess(v3)) {
    return 0;
  }
  else {
    return 2003329396;
  }
}

uint64_t __32__ASDTIOA2LegacyDevice_doStopIO__block_invoke(uint64_t a1)
{
  return ASDT::IOA2UCDevice::StopIO(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536));
}

- (int)performStartIO
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v13.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 560);
  v13.__owns_ = 0;
  uint64_t v3 = ASDTBaseLogType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(ASDAudioDevice *)self deviceUID];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v15 = v4;
    _os_log_impl(&dword_248A1B000, v3, OS_LOG_TYPE_DEFAULT, "%@ PerformStartIO", buf, 0xCu);
  }
  if ([(ASDTIOA2LegacyDevice *)self startIORequest])
  {
    std::unique_lock<std::mutex>::lock(&v13);
    ++*((void *)self + 118);
    int v5 = [(ASDTIOA2LegacyDevice *)self doStartIO];
    if (!v5)
    {
      [(ASDTIOA2LegacyDevice *)self setUcDeviceStarted:1];
      std::unique_lock<std::mutex>::unlock(&v13);
      v11.receiver = self;
      v11.super_class = (Class)ASDTIOA2LegacyDevice;
      int v5 = [(ASDTAudioDevice *)&v11 performStartIO];
      std::unique_lock<std::mutex>::lock(&v13);
      if (v5)
      {
        if ([(ASDTIOA2LegacyDevice *)self ucDeviceStarted])
        {
          [(ASDTIOA2LegacyDevice *)self setUcDeviceStarted:0];
          [(ASDTIOA2LegacyDevice *)self doStopIO];
        }
      }
    }
    std::unique_lock<std::mutex>::unlock(&v13);
    uint64_t v6 = ASDTBaseLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      long long v7 = [(ASDAudioDevice *)self deviceUID];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v15 = v7;
      __int16 v16 = 1024;
      int v17 = v5;
      _os_log_impl(&dword_248A1B000, v6, OS_LOG_TYPE_DEFAULT, "%@ PerformStartIO returned, result %d", buf, 0x12u);
    }
    [(ASDTIOA2LegacyDevice *)self stopIORequest];
    if (v13.__owns_) {
      std::mutex::unlock(v13.__m_);
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ASDTIOA2LegacyDevice;
    int v5 = [(ASDTAudioDevice *)&v12 performStartIO];
    long long v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = [(ASDAudioDevice *)self deviceUID];
      *(_DWORD *)long long buf = 138412546;
      uint64_t v15 = v9;
      __int16 v16 = 1024;
      int v17 = v5;
      _os_log_impl(&dword_248A1B000, v8, OS_LOG_TYPE_DEFAULT, "%@ PerformStartIO faked, result %d", buf, 0x12u);
    }
  }
  return v5;
}

- (int)performStopIO
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v13.__m_ = (std::unique_lock<std::mutex>::mutex_type *)((char *)self + 560);
  v13.__owns_ = 0;
  uint64_t v3 = ASDTBaseLogType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(ASDAudioDevice *)self deviceUID];
    *(_DWORD *)long long buf = 138412290;
    uint64_t v15 = v4;
    _os_log_impl(&dword_248A1B000, v3, OS_LOG_TYPE_DEFAULT, "%@ PerformStopIO", buf, 0xCu);
  }
  std::unique_lock<std::mutex>::lock(&v13);
  if ([(ASDTIOA2LegacyDevice *)self delayedStopIO]
    && [(ASDTIOA2LegacyDevice *)self ucDeviceStarted]
    && ![(ASDTAudioDevice *)self configurationChangesPending])
  {
    long long v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = [(ASDAudioDevice *)self deviceUID];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v15 = v10;
      _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEFAULT, "%@ Postpone underlying StopIO", buf, 0xCu);
    }
    [(ASDTIOA2LegacyDevice *)self _requestUnderlyingStopIO];
    int v5 = 0;
  }
  else
  {
    [(ASDTIOA2LegacyDevice *)self setUcDeviceStarted:0];
    int v5 = [(ASDTIOA2LegacyDevice *)self doStopIO];
  }
  std::unique_lock<std::mutex>::unlock(&v13);
  if (v5)
  {
    v11.receiver = self;
    v11.super_class = (Class)ASDTIOA2LegacyDevice;
    [(ASDTAudioDevice *)&v11 performStopIO];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)ASDTIOA2LegacyDevice;
    int v5 = [(ASDTAudioDevice *)&v12 performStopIO];
  }
  uint64_t v6 = ASDTBaseLogType();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    long long v7 = [(ASDAudioDevice *)self deviceUID];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v15 = v7;
    __int16 v16 = 1024;
    int v17 = v5;
    _os_log_impl(&dword_248A1B000, v6, OS_LOG_TYPE_DEFAULT, "%@ PerformStopIO returned. result %d", buf, 0x12u);
  }
  if (v13.__owns_) {
    std::mutex::unlock(v13.__m_);
  }
  return v5;
}

- (void)_requestUnderlyingStopIO
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  uint64_t v4 = (void *)*((void *)self + 118);
  *((unsigned char *)self + 925) = 1;
  objc_initWeak(&location, self);
  int v5 = *((void *)self + 117);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__ASDTIOA2LegacyDevice__requestUnderlyingStopIO__block_invoke;
  block[3] = &unk_265246270;
  objc_copyWeak(v7, &location);
  v7[1] = v4;
  dispatch_after(v3, v5, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __48__ASDTIOA2LegacyDevice__requestUnderlyingStopIO__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performUnderlyingStopIO:*(void *)(a1 + 40)];
}

- (void)_performUnderlyingStopIO:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v5 = (std::mutex *)((char *)self + 560);
  std::mutex::lock((std::mutex *)((char *)self + 560));
  if (*((unsigned char *)self + 925) && *((void *)self + 118) == a3)
  {
    uint64_t v6 = ASDTBaseLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      long long v7 = [(ASDAudioDevice *)self deviceUID];
      int v11 = 138412290;
      objc_super v12 = v7;
      _os_log_impl(&dword_248A1B000, v6, OS_LOG_TYPE_DEFAULT, "%@ PerformUnderlyingStopIO", (uint8_t *)&v11, 0xCu);
    }
    *((unsigned char *)self + 925) = 0;
    if ([(ASDTIOA2LegacyDevice *)self ucDeviceStarted])
    {
      [(ASDTIOA2LegacyDevice *)self setUcDeviceStarted:0];
      int v8 = [(ASDTIOA2LegacyDevice *)self doStopIO];
      long long v9 = ASDTBaseLogType();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        long long v10 = [(ASDAudioDevice *)self deviceUID];
        int v11 = 138412546;
        objc_super v12 = v10;
        __int16 v13 = 1024;
        int v14 = v8;
        _os_log_impl(&dword_248A1B000, v9, OS_LOG_TYPE_DEFAULT, "%@ PerformUnderlyingStopIO returned, result %d", (uint8_t *)&v11, 0x12u);
      }
    }
    else
    {
      long long v9 = ASDTBaseLogType();
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
  dispatch_time_t v3 = ASDTBaseLogType();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(ASDAudioDevice *)self deviceUID];
    int v5 = *((unsigned __int8 *)self + 925);
    *(_DWORD *)long long buf = 138412546;
    long long v9 = v4;
    __int16 v10 = 1024;
    int v11 = v5;
    _os_log_impl(&dword_248A1B000, v3, OS_LOG_TYPE_DEFAULT, "%@ forceStopIO, shouldStopIO %d", buf, 0x12u);
  }
  if (*((unsigned char *)self + 925))
  {
    uint64_t v6 = *((void *)self + 117);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__ASDTIOA2LegacyDevice_forceStopIO__block_invoke;
    block[3] = &unk_265246388;
    void block[4] = self;
    dispatch_sync(v6, block);
  }
}

uint64_t __35__ASDTIOA2LegacyDevice_forceStopIO__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performUnderlyingStopIO:*(void *)(*(void *)(a1 + 32) + 944)];
}

- (id)updateClientOutputPositionBlock
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__ASDTIOA2LegacyDevice_updateClientOutputPositionBlock__block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0Q8l;
  void v4[4] = (char *)self + 544;
  uint64_t v2 = (void *)MEMORY[0x24C588C90](v4, a2);
  return v2;
}

uint64_t __55__ASDTIOA2LegacyDevice_updateClientOutputPositionBlock__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(**(void **)(result + 32) + 32) = a2;
  return result;
}

- (id)updateClientInputPositionBlock
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__ASDTIOA2LegacyDevice_updateClientInputPositionBlock__block_invoke;
  v4[3] = &__block_descriptor_40_e8_v16__0Q8l;
  void v4[4] = (char *)self + 544;
  uint64_t v2 = (void *)MEMORY[0x24C588C90](v4, a2);
  return v2;
}

uint64_t __54__ASDTIOA2LegacyDevice_updateClientInputPositionBlock__block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(**(void **)(result + 32) + 24) = a2;
  return result;
}

- (void)_setStreamActive:(BOOL)a3 streamUCID:(unsigned int)a4
{
}

- (void)_mapIOBuffer:(char *)a3 ofSize:(unsigned int *)a4 forStream:(unsigned int)a5
{
}

- (void)_releaseIOBuffer:(char *)a3 forStream:(unsigned int)a4
{
}

- (id)_availableFormatsForStream:(unsigned int)a3
{
  dispatch_time_t v3 = (void *)ASDT::IOA2UCDevice::CopyStreamInfoByID_AvailableFormats(*((ASDT::IOA2UCDevice **)self + 67), a3);
  return v3;
}

- (AudioStreamBasicDescription)_currentFormatForStream:(SEL)a3
{
  *(void *)&retstr->mBitsPerChannel = 0;
  *(_OWORD *)&retstr->mSampleRate = 0u;
  *(_OWORD *)&retstr->mBytesPerPacket = 0u;
  ASDT::IOA2UCDevice::GetStreamInfoByID_CurrentFormat(*((ASDT::IOA2UCDevice **)self + 67), a4, retstr);
  return result;
}

- (unsigned)_streamStartingChannel:(unsigned int)a3
{
  return ASDT::IOA2UCDevice::GetStreamInfoByID_StartingChannel(*((ASDT::IOA2UCDevice **)self + 67), a3);
}

- (void)_setCurrentFormat:(AudioStreamBasicDescription *)a3 forStream:(unsigned int)a4
{
}

- (id)_controlDictionaryForControl:(unsigned int)a3
{
  dispatch_time_t v3 = ASDT::IOA2UCDevice::CopyControlDictionaryByID(*((ASDT::IOA2UCDevice **)self + 67), *(const __CFArray **)&a3);
  return v3;
}

- (BOOL)_setControlValue:(unsigned int *)a3 forControl:(unsigned int)a4
{
  long long v7 = a3;
  int v8 = self;
  unsigned int v6 = a4;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3321888768;
  v5[2] = __52__ASDTIOA2LegacyDevice__setControlValue_forControl___block_invoke;
  v5[3] = &__block_descriptor_56_ea8_32c66_ZTSKZ52__ASDTIOA2LegacyDevice__setControlValue_forControl__E4__16_e5_v8__0l;
  v5[4] = &v8;
  void v5[5] = &v6;
  v5[6] = &v7;
  return ASDT::exceptionBarrierReturnSuccess(v5);
}

uint64_t __52__ASDTIOA2LegacyDevice__setControlValue_forControl___block_invoke(uint64_t a1)
{
  return ASDT::IOA2UCDevice::SetControlValue(*(ASDT::IOA2UCDevice **)(**(void **)(a1 + 32) + 536), **(_DWORD **)(a1 + 40), **(unsigned int ***)(a1 + 48));
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
  int v9 = ASDT::IOA2UCDevice::SetMultiControlValue(*((ASDT::IOA2UCDevice **)self + 67), a7, a3, a4, a5, &v11);
  if (a6 && !v9) {
    *a6 = v11;
  }
  return v9 == 0;
}

- (unique_lock<std::recursive_mutex>)scopedLock
{
  dispatch_time_t v3 = (std::recursive_mutex *)((char *)self + 632);
  *(void *)uint64_t v2 = v3;
  *(unsigned char *)(v2 + 8) = 1;
  std::recursive_mutex::lock(v3);
  result.unsigned int var1 = v5;
  result.var0 = v4;
  return result;
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
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = *((void *)self + 68);
  if (v3)
  {
    uint64_t v4 = *(void *)&a3;
    uint64_t v5 = *(void *)(v3 + 32);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v6 = [(ASDAudioDevice *)self outputStreams];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) writeZerosToMixMilliseconds:v4 atSampleTime:v5];
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

+ (id)matcherWithDelegate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F28C90]) initForIOServiceWithClassName:@"IOAudio2Device" withDelegate:v3];

  return v4;
}

- (BOOL)delayedStopIO
{
  return *((unsigned char *)self + 924);
}

- (void)setDelayedStopIO:(BOOL)a3
{
  *((unsigned char *)self + 924) = a3;
}

- (NSMapTable)customPropertySelectorMap
{
  return (NSMapTable *)*((void *)self + 116);
}

- (void)setCustomPropertySelectorMap:(id)a3
{
}

- (OS_dispatch_queue)stopIOQueue
{
  return (OS_dispatch_queue *)*((void *)self + 117);
}

- (void)setStopIOQueue:(id)a3
{
}

- (unint64_t)currentSeed
{
  return *((void *)self + 118);
}

- (void)setCurrentSeed:(unint64_t)a3
{
  *((void *)self + 118) = a3;
}

- (BOOL)shouldStopIO
{
  return *((unsigned char *)self + 925);
}

- (void)setShouldStopIO:(BOOL)a3
{
  *((unsigned char *)self + 925) = a3;
}

- (BOOL)ucDeviceStarted
{
  return *((unsigned char *)self + 926);
}

- (void)setUcDeviceStarted:(BOOL)a3
{
  *((unsigned char *)self + 926) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)self + 117, 0);
  objc_storeStrong((id *)self + 116, 0);
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)self + 872));
  std::mutex::~mutex((std::mutex *)((char *)self + 808));
  std::condition_variable::~condition_variable((std::condition_variable *)((char *)self + 760));
  std::mutex::~mutex((std::mutex *)((char *)self + 696));
  std::recursive_mutex::~recursive_mutex((std::recursive_mutex *)((char *)self + 632));
  uint64_t v3 = *((void *)self + 78);
  *((void *)self + 78) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  std::mutex::~mutex((std::mutex *)((char *)self + 560));
  uint64_t v4 = *((void *)self + 69);
  *((void *)self + 69) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
  uint64_t v5 = *((void *)self + 67);
  *((void *)self + 67) = 0;
  if (v5)
  {
    long long v6 = *(void (**)(void))(*(void *)v5 + 8);
    v6();
  }
}

- (id).cxx_construct
{
  *((void *)self + 67) = 0;
  *((void *)self + 69) = 0;
  *((void *)self + 70) = 850045863;
  *((void *)self + 77) = 0;
  *(_OWORD *)((char *)self + 600) = 0u;
  *(_OWORD *)((char *)self + 584) = 0u;
  *(_OWORD *)((char *)self + 568) = 0u;
  *((void *)self + 78) = 0;
  MEMORY[0x24C588680]((char *)self + 632, a2);
  *((void *)self + 87) = 850045863;
  *((_OWORD *)self + 44) = 0u;
  *((_OWORD *)self + 45) = 0u;
  *((_OWORD *)self + 46) = 0u;
  *((void *)self + 94) = 0;
  *((void *)self + 95) = 1018212795;
  *((_OWORD *)self + 48) = 0u;
  *((_OWORD *)self + 49) = 0u;
  *((void *)self + 100) = 0;
  *((void *)self + 101) = 850045863;
  *((_OWORD *)self + 51) = 0u;
  *((_OWORD *)self + 52) = 0u;
  *((_OWORD *)self + 53) = 0u;
  *((void *)self + 108) = 0;
  *((void *)self + 109) = 1018212795;
  *((_OWORD *)self + 56) = 0u;
  *((void *)self + 114) = 0;
  *((_OWORD *)self + 55) = 0u;
  return self;
}

- (void)timestampPeriod
{
}

- timestampPeriod
{
  _DWORD *result;

  unique_lock<std::recursive_mutex> result = operator new(0x10uLL);
  *(void *)unique_lock<std::recursive_mutex> result = &unk_26FCAE430;
  result[2] = *(_DWORD *)(a1 + 8);
  return result;
}

- (uint64_t)timestampPeriod
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (void)startIORequest
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_248A1B000, v3, v4, "%@: Waited to long to StartIO while change request is in progress.", v5);
}

- (void)handleTransportChanged:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_248A1B000, log, OS_LOG_TYPE_DEBUG, "IOA2Device %@ IO state = %s", buf, 0x16u);
}

- (void)_markOrCreateStreamsWithIDs:direction:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  *uint64_t v1 = 138412290;
  *int v3 = v2;
  _os_log_error_impl(&dword_248A1B000, v5, OS_LOG_TYPE_ERROR, "%@: Failed to create stream.", v4, 0xCu);
}

void __40__ASDTIOA2LegacyDevice_setSamplingRate___block_invoke_cold_1()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_248A1B000, MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR, " ", v0, 2u);
}

- (void)ioa2Device
{
}

@end