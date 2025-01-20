@interface ASDTDeviceManager
+ (ASDTDeviceManager)deviceManagerWithConfig:(id)a3 withDelegate:(id)a4;
- (ASDPlugin)plugin;
- (ASDTCondition)initializingCond;
- (ASDTCondition)threadCond;
- (ASDTDeviceManager)initWithConfig:(id)a3 withDelegate:(id)a4;
- (ASDTDeviceManagerDelegate)delegate;
- (BOOL)addAudioDeviceWithCheck:(id)a3;
- (BOOL)allowSystemSleep;
- (BOOL)threadStarted;
- (BOOL)threadWorkToDo;
- (BOOL)verboseDeviceLogging;
- (NSArray)allDeviceFactories;
- (NSDictionary)configuration;
- (NSMutableArray)ioServiceDependencies;
- (NSMutableDictionary)deviceInitStatus;
- (NSMutableDictionary)matchedDeviceFactories;
- (NSMutableSet)deviceFactories;
- (NSMutableSet)devicesRunning;
- (NSSet)underlyingDeviceUIDs;
- (NSString)name;
- (NSThread)thread;
- (OS_dispatch_queue)initializingQueue;
- (double)runningLogPeriod;
- (id)factoryForDeviceUID:(id)a3;
- (id)generateUnderlyingDeviceUIDsFromConfig:(id)a3;
- (id)messageForDroppedPacketsFromDevice:(id)a3 withScope:(unsigned int)a4;
- (id)messageForDroppedPacketsFromDevice:(id)a3 withScope:(unsigned int)a4 andElement:(unsigned int)a5;
- (unsigned)numDevicesToInitialize;
- (void)buildAndInitializeDevice:(id)a3;
- (void)configureDevices;
- (void)deviceConfigurationFailed:(id)a3;
- (void)deviceInitializationFailed:(id)a3;
- (void)deviceInitialized:(id)a3 withStatus:(int)a4;
- (void)initializeDevice:(id)a3;
- (void)ioServiceAvailable:(id)a3 withManager:(id)a4;
- (void)ioServiceWillTerminate:(id)a3 withManager:(id)a4;
- (void)lockedSignalThread;
- (void)logStatsForDevice:(id)a3 withPowerState:(int)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)powerStateChangedForDevice:(id)a3 toState:(int)a4;
- (void)publishDevice:(id)a3;
- (void)publishDeviceLocked:(id)a3;
- (void)removeAudioDevice:(id)a3;
- (void)removeAudioDevices:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceFactories:(id)a3;
- (void)setDeviceInitStatus:(id)a3;
- (void)setDevicesRunning:(id)a3;
- (void)setInitializingCond:(id)a3;
- (void)setInitializingQueue:(id)a3;
- (void)setIoServiceDependencies:(id)a3;
- (void)setMatchedDeviceFactories:(id)a3;
- (void)setName:(id)a3;
- (void)setNumDevicesToInitialize:(unsigned int)a3;
- (void)setPlugin:(id)a3;
- (void)setRunningLogPeriod:(double)a3;
- (void)setThread:(id)a3;
- (void)setThreadCond:(id)a3;
- (void)setThreadStarted:(BOOL)a3;
- (void)setThreadWorkToDo:(BOOL)a3;
- (void)setUnderlyingDeviceUIDs:(id)a3;
- (void)setVerboseDeviceLogging:(BOOL)a3;
- (void)systemHasPoweredOn;
- (void)systemWillSleep;
- (void)terminateDevice:(id)a3;
- (void)threadLoop:(id)a3;
- (void)waitForInitialization;
- (void)waitForInitializationWithTimeoutUs:(unsigned int)a3;
- (void)waitForThreadStart;
@end

@implementation ASDTDeviceManager

+ (ASDTDeviceManager)deviceManagerWithConfig:(id)a3 withDelegate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(v5, "asdtDeviceManager")), "initWithConfig:withDelegate:", v5, v6);
  [v7 configureDevices];

  return (ASDTDeviceManager *)v7;
}

- (ASDTDeviceManager)initWithConfig:(id)a3 withDelegate:(id)a4
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)ASDTDeviceManager;
  v8 = [(ASDTDeviceList *)&v53 init];
  if (!v8) {
    goto LABEL_23;
  }
  v9 = [v6 asdtName];
  [(ASDTDeviceManager *)v8 setName:v9];

  v10 = [(ASDTDeviceManager *)v8 name];
  LODWORD(v9) = v10 == 0;

  if (v9)
  {
    v11 = (objc_class *)objc_opt_class();
    v12 = NSStringFromClass(v11);
    [(ASDTDeviceManager *)v8 setName:v12];
  }
  [(ASDTDeviceManager *)v8 setConfiguration:v6];
  [(ASDTDeviceManager *)v8 setDelegate:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(ASDTDeviceManager *)v8 setPlugin:v7];
  }
  v13 = [(ASDTDeviceManager *)v8 configuration];
  v14 = [v13 asdtDevices];

  unsigned int v15 = [v14 count];
  uint64_t v16 = [v6 asdtManagerAudioObjectMaxCount];
  if (v16)
  {
    v17 = ASDTBaseLogType();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = [(ASDTDeviceManager *)v8 name];
      *(_DWORD *)buf = 138412546;
      v55 = v18;
      __int16 v56 = 1024;
      LODWORD(v57) = v16;
      _os_log_impl(&dword_2489BC000, v17, OS_LOG_TYPE_DEFAULT, "%@: Setting maximum number of objects to %u.", buf, 0x12u);
    }
    v19 = [(ASDTDeviceManager *)v8 plugin];
    [v19 setMaximumNumberOfObjects:v16];
  }
  -[ASDTDeviceManager setVerboseDeviceLogging:](v8, "setVerboseDeviceLogging:", [v6 asdtManagerVerboseLogging]);
  [v6 asdtManagerRunningLogPeriod];
  -[ASDTDeviceManager setRunningLogPeriod:](v8, "setRunningLogPeriod:");
  v20 = ASDTBaseLogType();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [(ASDTDeviceManager *)v8 name];
    [(ASDTDeviceManager *)v8 runningLogPeriod];
    *(_DWORD *)buf = 138412546;
    v55 = v21;
    __int16 v56 = 2048;
    uint64_t v57 = v22;
    _os_log_impl(&dword_2489BC000, v20, OS_LOG_TYPE_DEFAULT, "%@: Running log period: %1.1lf", buf, 0x16u);
  }
  v23 = [MEMORY[0x263EFF9C0] setWithCapacity:v15];
  [(ASDTDeviceManager *)v8 setDeviceFactories:v23];

  v24 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v15];
  [(ASDTDeviceManager *)v8 setMatchedDeviceFactories:v24];

  v25 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:v15];
  [(ASDTDeviceManager *)v8 setDeviceInitStatus:v25];

  v26 = [MEMORY[0x263EFF9C0] setWithCapacity:v15];
  [(ASDTDeviceManager *)v8 setDevicesRunning:v26];

  v27 = [MEMORY[0x263EFF980] array];
  [(ASDTDeviceManager *)v8 setIoServiceDependencies:v27];

  v28 = [(ASDTDeviceManager *)v8 generateUnderlyingDeviceUIDsFromConfig:v14];
  [(ASDTDeviceManager *)v8 setUnderlyingDeviceUIDs:v28];

  v29 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v30 = dispatch_queue_create("com.apple.AudioServerDriverTransports.ASDTDeviceManager.initqueue", v29);
  [(ASDTDeviceManager *)v8 setInitializingQueue:v30];

  v31 = +[ASDTCondition conditionWithName:@"com.apple.AudioServerDriverTransports.ASDTDeviceManager.initcond"];
  [(ASDTDeviceManager *)v8 setInitializingCond:v31];

  v32 = +[ASDTCondition conditionWithName:@"com.apple.AudioServerDriverTransports.ASDTDeviceManager.threadCond"];
  [(ASDTDeviceManager *)v8 setThreadCond:v32];

  v33 = (void *)[objc_alloc(MEMORY[0x263F08B88]) initWithTarget:v8 selector:sel_threadLoop_ object:0];
  [(ASDTDeviceManager *)v8 setThread:v33];

  v34 = [(ASDTDeviceManager *)v8 thread];
  [v34 setName:@"com.apple.AudioServerDriverTransports.ASDTDeviceManager.thread"];

  v35 = [(ASDTDeviceManager *)v8 thread];
  [v35 setQualityOfService:33];

  v36 = [(ASDTDeviceManager *)v8 deviceInitStatus];
  if (v36)
  {
    v37 = [(ASDTDeviceManager *)v8 devicesRunning];
    if (v37)
    {
      v38 = [(ASDTDeviceManager *)v8 thread];
      if (v38)
      {
        v39 = [(ASDTDeviceManager *)v8 threadCond];
        if (v39)
        {
          v40 = [(ASDTDeviceManager *)v8 deviceFactories];
          if (v40)
          {
            v50 = [(ASDTDeviceManager *)v8 matchedDeviceFactories];
            if (v50)
            {
              v49 = [(ASDTDeviceManager *)v8 initializingQueue];
              if (v49)
              {
                v48 = [(ASDTDeviceManager *)v8 initializingCond];
                if (v48)
                {
                  v47 = [(ASDTDeviceManager *)v8 underlyingDeviceUIDs];
                  if (v47)
                  {
                    v41 = [(ASDTDeviceManager *)v8 ioServiceDependencies];
                    BOOL v46 = v41 == 0;

                    if (!v46)
                    {
                      objc_initWeak((id *)buf, v8);
                      v42 = [(ASDTDeviceManager *)v8 initializingQueue];
                      block[0] = MEMORY[0x263EF8330];
                      block[1] = 3221225472;
                      block[2] = __49__ASDTDeviceManager_initWithConfig_withDelegate___block_invoke;
                      block[3] = &unk_2652439D8;
                      objc_copyWeak(&v52, (id *)buf);
                      dispatch_async(v42, block);

                      objc_destroyWeak(&v52);
                      objc_destroyWeak((id *)buf);

LABEL_23:
                      v43 = v8;
                      goto LABEL_35;
                    }
                    goto LABEL_32;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_32:
  v44 = ASDTBaseLogType();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    [(ASDTDeviceManager *)v8 name];
    objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager initWithConfig:withDelegate:]();
  }

  v43 = 0;
LABEL_35:

  return v43;
}

void __49__ASDTDeviceManager_initWithConfig_withDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained waitForThreadStart];
}

- (BOOL)addAudioDeviceWithCheck:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ASDTDeviceManager *)self threadCond];
  [v5 lock];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 addObserver:self forKeyPath:@"powerState" options:1 context:0];
  }
  id v6 = [(ASDTDeviceManager *)self threadCond];
  [v6 unlock];

  v16.receiver = self;
  v16.super_class = (Class)ASDTDeviceManager;
  BOOL v7 = [(ASDTDeviceList *)&v16 addAudioDeviceWithCheck:v4];
  if (v7)
  {
    v8 = ASDTBaseLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [(ASDTDeviceManager *)self name];
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      v12 = [v4 deviceUID];
      *(_DWORD *)buf = 138413058;
      v18 = v9;
      __int16 v19 = 2048;
      v20 = self;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      v24 = v12;
      _os_log_impl(&dword_2489BC000, v8, OS_LOG_TYPE_DEFAULT, "%@(%p): Added %@ '%@'", buf, 0x2Au);
    }
    objc_msgSend(v4, "logDiagnostics:", -[ASDTDeviceManager verboseDeviceLogging](self, "verboseDeviceLogging"));
  }
  else
  {
    v13 = [(ASDTDeviceManager *)self threadCond];
    [v13 lock];

    [v4 removeObserver:self forKeyPath:@"powerState"];
    v14 = [(ASDTDeviceManager *)self threadCond];
    [v14 unlock];
  }
  return v7;
}

- (id)generateUnderlyingDeviceUIDsFromConfig:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  unsigned int v4 = [v3 count];
  id v5 = [MEMORY[0x263EFF9C0] setWithCapacity:v4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "asdtUnderlyingDeviceUID", (void)v13);
        if (v10) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v11 = (void *)[v5 copy];
  return v11;
}

- (void)removeAudioDevice:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4
    && ([(ASDTDeviceList *)self audioDevices],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 containsObject:v4],
        v5,
        (v6 & 1) != 0))
  {
    uint64_t v7 = [(ASDTDeviceManager *)self initializingCond];
    [v7 lock];

    uint64_t v8 = [(ASDTDeviceManager *)self delegate];
    v9 = [v8 audioDevices];
    int v10 = [v9 containsObject:v4];

    if (v10)
    {
      v11 = ASDTBaseLogType();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(ASDTDeviceManager *)self name];
        long long v13 = [v4 deviceUID];
        *(_DWORD *)buf = 138412546;
        v36 = v12;
        __int16 v37 = 2112;
        id v38 = v13;
        _os_log_impl(&dword_2489BC000, v11, OS_LOG_TYPE_DEFAULT, "%@: Unpublishing '%@'.", buf, 0x16u);
      }
      long long v14 = [(ASDTDeviceManager *)self delegate];
      [v14 removeAudioDevice:v4];
    }
    long long v15 = [(ASDTDeviceManager *)self matchedDeviceFactories];
    long long v16 = [v4 deviceUID];
    v17 = [v15 objectForKey:v16];

    if (v17)
    {
      [v17 cleanup];
      uint64_t v18 = [(ASDTDeviceManager *)self deviceFactories];
      [v18 removeObject:v17];

      __int16 v19 = [(ASDTDeviceManager *)self matchedDeviceFactories];
      v20 = [v4 deviceUID];
      [v19 removeObjectForKey:v20];
    }
    __int16 v21 = [(ASDTDeviceManager *)self deviceInitStatus];
    uint64_t v22 = [v4 deviceUID];
    [v21 removeObjectForKey:v22];

    __int16 v23 = [(ASDTDeviceManager *)self initializingCond];
    [v23 unlock];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = [(ASDTDeviceManager *)self threadCond];
      [v24 lock];

      uint64_t v25 = [(ASDTDeviceManager *)self devicesRunning];
      int v26 = [v25 containsObject:v4];

      if (v26)
      {
        v27 = [(ASDTDeviceManager *)self devicesRunning];
        [v27 removeObject:v4];
      }
      [v4 removeObserver:self forKeyPath:@"powerState"];
      v28 = [(ASDTDeviceManager *)self threadCond];
      [v28 unlock];
    }
    v29 = ASDTBaseLogType();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v30 = [(ASDTDeviceManager *)self name];
      v31 = [v4 deviceUID];
      *(_DWORD *)buf = 138412546;
      v36 = v30;
      __int16 v37 = 2112;
      id v38 = v31;
      _os_log_impl(&dword_2489BC000, v29, OS_LOG_TYPE_DEFAULT, "%@: Removing '%@'.", buf, 0x16u);
    }
    v34.receiver = self;
    v34.super_class = (Class)ASDTDeviceManager;
    [(ASDTDeviceList *)&v34 removeAudioDevice:v4];
  }
  else
  {
    v17 = ASDTBaseLogType();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v32 = [(ASDTDeviceManager *)self name];
      v33 = [v4 deviceUID];
      *(_DWORD *)buf = 138412802;
      v36 = v32;
      __int16 v37 = 2048;
      id v38 = v4;
      __int16 v39 = 2112;
      v40 = v33;
      _os_log_debug_impl(&dword_2489BC000, v17, OS_LOG_TYPE_DEBUG, "%@: Bad or unmanaged device(%p) with UID: %@", buf, 0x20u);
    }
  }
}

- (void)removeAudioDevices:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v44 = a3;
  id v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = [(ASDTDeviceList *)self audioDevices];
  v43 = [v4 setWithArray:v5];

  char v6 = [MEMORY[0x263EFFA08] setWithArray:v44];
  [v43 intersectSet:v6];

  if ([v43 count])
  {
    uint64_t v7 = [v43 count];
    if (v7 != [v44 count])
    {
      uint64_t v8 = [v43 allObjects];

      id v44 = (id)v8;
    }
    v9 = [(ASDTDeviceManager *)self initializingCond];
    [v9 lock];

    int v10 = [(ASDTDeviceManager *)self delegate];
    v11 = [v10 audioDevices];

    v42 = v11;
    if ([v11 count])
    {
      v12 = [MEMORY[0x263EFF9C0] setWithArray:v44];
      long long v13 = [MEMORY[0x263EFFA08] setWithArray:v11];
      [v12 intersectSet:v13];

      if ([v12 count])
      {
        long long v14 = [(ASDTDeviceManager *)self delegate];
        long long v15 = [v12 allObjects];
        [v14 removeAudioDevices:v15];
      }
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v16 = v44;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v51 != v18) {
            objc_enumerationMutation(v16);
          }
          v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          __int16 v21 = [(ASDTDeviceManager *)self matchedDeviceFactories];
          uint64_t v22 = [v20 deviceUID];
          __int16 v23 = [v21 objectForKey:v22];

          if (v23)
          {
            [v23 cleanup];
            v24 = [(ASDTDeviceManager *)self deviceFactories];
            [v24 removeObject:v23];

            uint64_t v25 = [(ASDTDeviceManager *)self matchedDeviceFactories];
            int v26 = [v20 deviceUID];
            [v25 removeObjectForKey:v26];
          }
          v27 = [(ASDTDeviceManager *)self deviceInitStatus];
          v28 = [v20 deviceUID];
          [v27 removeObjectForKey:v28];

          v29 = ASDTBaseLogType();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            dispatch_queue_t v30 = [(ASDTDeviceManager *)self name];
            v31 = [v20 deviceUID];
            *(_DWORD *)buf = 138412546;
            uint64_t v57 = v30;
            __int16 v58 = 2112;
            v59 = v31;
            _os_log_impl(&dword_2489BC000, v29, OS_LOG_TYPE_DEFAULT, "%@: Removing '%@'.", buf, 0x16u);
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v17);
    }

    v32 = [(ASDTDeviceManager *)self initializingCond];
    [v32 unlock];

    v33 = [(ASDTDeviceManager *)self threadCond];
    [v33 lock];

    objc_super v34 = [(ASDTDeviceManager *)self devicesRunning];
    v35 = [MEMORY[0x263EFFA08] setWithArray:v16];
    [v34 minusSet:v35];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v36 = v16;
    uint64_t v37 = [v36 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v47 != v38) {
            objc_enumerationMutation(v36);
          }
          v40 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v40 removeObserver:self forKeyPath:@"powerState"];
          }
        }
        uint64_t v37 = [v36 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v37);
    }

    uint64_t v41 = [(ASDTDeviceManager *)self threadCond];
    [v41 unlock];

    v45.receiver = self;
    v45.super_class = (Class)ASDTDeviceManager;
    [(ASDTDeviceList *)&v45 removeAudioDevices:v36];
    id v44 = v36;
  }
  else
  {
    v42 = ASDTBaseLogType();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      [(ASDTDeviceManager *)self name];
      objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager removeAudioDevices:]();
    }
  }
}

- (id)factoryForDeviceUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(ASDTDeviceManager *)self initializingCond];
    [v5 lock];

    char v6 = [(ASDTDeviceManager *)self matchedDeviceFactories];
    uint64_t v7 = [v6 objectForKey:v4];

    uint64_t v8 = [(ASDTDeviceManager *)self initializingCond];
    [v8 unlock];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (NSArray)allDeviceFactories
{
  id v3 = [(ASDTDeviceManager *)self initializingCond];
  [v3 lock];

  id v4 = [(ASDTDeviceManager *)self deviceFactories];
  id v5 = [v4 allObjects];

  char v6 = [(ASDTDeviceManager *)self initializingCond];
  [v6 unlock];

  return (NSArray *)v5;
}

- (void)buildAndInitializeDevice:(id)a3
{
  id v4 = a3;
  id v5 = [v4 deviceUID];
  char v6 = [(ASDTDeviceManager *)self initializingCond];
  [v6 lock];

  uint64_t v7 = [(ASDTDeviceManager *)self matchedDeviceFactories];
  id v8 = [v7 objectForKey:v5];

  if (!v8 || v8 == v4)
  {
    if (!v8)
    {
      [(ASDTDeviceManager *)self setNumDevicesToInitialize:[(ASDTDeviceManager *)self numDevicesToInitialize] + 1];
      v11 = [(ASDTDeviceManager *)self matchedDeviceFactories];
      [v11 setObject:v4 forKey:v5];
    }
    v12 = [v4 device];

    if (v12) {
      goto LABEL_9;
    }
    if ([v4 deviceIsBuilding])
    {
      uint64_t v18 = [(ASDTDeviceManager *)self initializingCond];
      [v18 unlock];

      goto LABEL_18;
    }
    [v4 setDeviceIsBuilding:1];
    __int16 v19 = [(ASDTDeviceManager *)self initializingCond];
    [v19 unlock];

    LODWORD(v19) = [v4 buildDevice];
    v20 = [(ASDTDeviceManager *)self initializingCond];
    [v20 lock];

    [v4 setDeviceIsBuilding:0];
    if (!v19) {
      goto LABEL_15;
    }
    __int16 v21 = [v4 device];

    if (v21)
    {
LABEL_9:
      long long v13 = [(ASDTDeviceManager *)self initializingCond];
      [v13 unlock];

      long long v14 = [(ASDTDeviceList *)self audioDevices];
      long long v15 = [v4 device];
      char v16 = [v14 containsObject:v15];

      if ((v16 & 1) == 0)
      {
        uint64_t v17 = [v4 device];
        [(ASDTDeviceList *)self addAudioDevice:v17];

        [(ASDTDeviceManager *)self initializeDevice:v4];
      }
    }
    else
    {
LABEL_15:
      uint64_t v22 = [v4 config];
      [v4 cleanup];
      __int16 v23 = [(ASDTDeviceManager *)self deviceFactories];
      [v23 removeObject:v4];

      v24 = [(ASDTDeviceManager *)self matchedDeviceFactories];
      [v24 removeObjectForKey:v5];

      uint64_t v25 = [(ASDTDeviceManager *)self initializingCond];
      [v25 unlock];

      int v26 = ASDTBaseLogType();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        [(ASDTDeviceManager *)self name];
        objc_claimAutoreleasedReturnValue();
        -[ASDTDeviceManager buildAndInitializeDevice:]();
      }

      [(ASDTDeviceManager *)self deviceConfigurationFailed:v22];
    }
  }
  else
  {
    v9 = [(ASDTDeviceManager *)self initializingCond];
    [v9 unlock];

    int v10 = ASDTBaseLogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      [(ASDTDeviceManager *)self name];
      objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager buildAndInitializeDevice:]();
    }
  }
LABEL_18:
}

- (void)initializeDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(ASDTDeviceManager *)self initializingCond];
  [v5 lock];

  char v6 = [(ASDTDeviceManager *)self deviceInitStatus];
  uint64_t v7 = [v4 deviceUID];
  id v8 = [v6 objectForKey:v7];

  if (!v8)
  {
    v9 = [(ASDTDeviceManager *)self deviceInitStatus];
    int v10 = [v4 deviceUID];
    [v9 setObject:&unk_26FCAD4B8 forKey:v10];

    objc_initWeak(&location, self);
    v11 = [(ASDTDeviceManager *)self initializingQueue];
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    long long v15 = __38__ASDTDeviceManager_initializeDevice___block_invoke;
    char v16 = &unk_265243E98;
    uint64_t v17 = self;
    id v18 = v4;
    objc_copyWeak(&v19, &location);
    dispatch_async(v11, &v13);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  v12 = [(ASDTDeviceManager *)self initializingCond];
  [v12 unlock];
}

void __38__ASDTDeviceManager_initializeDevice___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = ASDTBaseLogType();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [a1[4] name];
    id v4 = [a1[5] deviceUID];
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 2112;
    int v10 = v4;
    _os_log_impl(&dword_2489BC000, v2, OS_LOG_TYPE_DEFAULT, "%@: Initializing '%@'", (uint8_t *)&v7, 0x16u);
  }
  if ([a1[5] initializeDevice]) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained deviceInitialized:a1[5] withStatus:v5];
}

- (void)deviceInitialized:(id)a3 withStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [(ASDTDeviceManager *)self initializingCond];
  [v8 lock];

  if (![(ASDTDeviceManager *)self numDevicesToInitialize])
  {
    __int16 v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [(ASDTDeviceManager *)self name];
      objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager deviceInitialized:withStatus:]();
    }

    if (![(ASDTDeviceManager *)self numDevicesToInitialize])
    {
      uint64_t v25 = [MEMORY[0x263F08690] currentHandler];
      int v26 = [(ASDTDeviceManager *)self name];
      [v25 handleFailureInMethod:a2, self, @"ASDTDeviceManager.mm", 422, @"%@: No devices to initialize!", v26 object file lineNumber description];
    }
  }
  [(ASDTDeviceManager *)self setNumDevicesToInitialize:[(ASDTDeviceManager *)self numDevicesToInitialize] - 1];
  int v10 = [(ASDTDeviceManager *)self deviceInitStatus];
  uint64_t v11 = [NSNumber numberWithUnsignedInt:v4];
  v12 = [v7 deviceUID];
  [v10 setObject:v11 forKey:v12];

  if (v4 == 1)
  {
    uint64_t v13 = [(ASDTDeviceManager *)self initializingCond];
    [v13 unlock];

    ASDTTime::machAbsoluteTime(v14, (uint64_t)buf);
    if (v7) {
      [v7 initTime];
    }
    else {
      memset(v27, 0, sizeof(v27));
    }
    long long v29 = *(_OWORD *)buf;
    uint64_t v30 = *(void *)&buf[16];
    ASDTTime::operator-=((_anonymous_namespace_ **)&v29, v27, v15, v16);
    id v19 = ASDTBaseLogType();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [v7 deviceUID];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (double)(uint64_t)v29 / 1000000000.0;
      _os_log_impl(&dword_2489BC000, v19, OS_LOG_TYPE_DEFAULT, "Device '%@' initialized in %1.4lfs", buf, 0x16u);
    }
    [v7 publishDevice];
    __int16 v21 = [(ASDTDeviceManager *)self initializingCond];
    [v21 lock];
  }
  else
  {
    uint64_t v17 = ASDTBaseLogType();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      [(ASDTDeviceManager *)self name];
      objc_claimAutoreleasedReturnValue();
      [v7 deviceUID];
      objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager deviceInitialized:withStatus:]();
    }

    id v18 = [v7 device];
    [(ASDTDeviceManager *)self deviceInitializationFailed:v18];
  }
  uint64_t v22 = [(ASDTDeviceManager *)self initializingCond];
  [v22 broadcast];

  __int16 v23 = [(ASDTDeviceManager *)self initializingCond];
  [v23 unlock];

  v24 = [v7 device];
  [(ASDTDeviceList *)self notifyOfInterest:2 forDevice:v24];
}

- (void)publishDeviceLocked:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = [v5 deviceUID];

  if (!v6)
  {
    id v7 = ASDTBaseLogType();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [(ASDTDeviceManager *)self name];
      objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager publishDeviceLocked:]();
    }

    id v8 = [v5 deviceUID];
    BOOL v9 = v8 == 0;

    if (v9)
    {
      v27 = [MEMORY[0x263F08690] currentHandler];
      v28 = [(ASDTDeviceManager *)self name];
      [v27 handleFailureInMethod:a2, self, @"ASDTDeviceManager.mm", 445, @"%@: Bad device factory.", v28 object file lineNumber description];
    }
  }
  int v10 = [v5 device];
  if (!v10)
  {
    uint64_t v11 = ASDTBaseLogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      [(ASDTDeviceManager *)self name];
      objc_claimAutoreleasedReturnValue();
      [v5 deviceUID];
      objc_claimAutoreleasedReturnValue();
      -[ASDTDeviceManager publishDeviceLocked:]();
    }

    v12 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v13 = [(ASDTDeviceManager *)self name];
    uint64_t v14 = [v5 deviceUID];
    [v12 handleFailureInMethod:a2, self, @"ASDTDeviceManager.mm", 449, @"%@: Device factory for '%@' missing device object.", v13, v14 object file lineNumber description];
  }
  uint64_t v15 = [(ASDTDeviceManager *)self delegate];
  char v16 = [v15 audioDevices];
  char v17 = [v16 containsObject:v10];

  if ((v17 & 1) == 0)
  {
    id v18 = ASDTBaseLogType();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v10 deviceUID];
      v20 = [v10 deviceName];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_2489BC000, v18, OS_LOG_TYPE_DEFAULT, "Publishing %@ (%@)", buf, 0x16u);
    }
    __int16 v21 = [(ASDTDeviceManager *)self delegate];
    [v21 addAudioDevice:v10];

    ASDTTime::machAbsoluteTime(v22, (uint64_t)v30);
    if (v5) {
      [v5 initTime];
    }
    else {
      memset(v29, 0, sizeof(v29));
    }
    *(_OWORD *)buf = *(_OWORD *)v30;
    *(void *)&buf[16] = *(void *)&v30[16];
    ASDTTime::operator-=((_anonymous_namespace_ **)buf, v29, v23, v24);
    uint64_t v25 = ASDTBaseLogType();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = [v5 deviceUID];
      *(_DWORD *)uint64_t v30 = 138412546;
      *(void *)&v30[4] = v26;
      *(_WORD *)&v30[12] = 2048;
      *(double *)&v30[14] = (double)*(uint64_t *)buf / 1000000000.0;
      _os_log_impl(&dword_2489BC000, v25, OS_LOG_TYPE_DEFAULT, "Device '%@' published after %1.4lfs", v30, 0x16u);
    }
  }
}

- (void)publishDevice:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(ASDTDeviceManager *)self initializingCond];
  [v4 lock];

  [(ASDTDeviceManager *)self publishDeviceLocked:v6];
  id v5 = [(ASDTDeviceManager *)self initializingCond];
  [v5 unlock];
}

- (void)waitForInitializationWithTimeoutUs:(unsigned int)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (a3)
  {
    ASDTTime::futureUSecs(*(ASDTTime **)&a3, (uint64_t)&v28);
    uint64_t v4 = [(ASDTDeviceManager *)self initializingCond];
    [v4 lock];

    while ([(ASDTDeviceManager *)self numDevicesToInitialize])
    {
LABEL_14:
      uint64_t v14 = [(ASDTDeviceManager *)self initializingCond];
      long long v22 = v28;
      uint64_t v23 = v29;
      char v15 = [v14 waitUntilTime:&v22];

      if ((v15 & 1) == 0)
      {
        id v5 = ASDTBaseLogType();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          [(ASDTDeviceManager *)self name];
          objc_claimAutoreleasedReturnValue();
          -[ASDTDeviceManager waitForInitializationWithTimeoutUs:]();
        }
        int v16 = 0;
        goto LABEL_19;
      }
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v5 = [(ASDTDeviceList *)self audioDevices];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(v5);
          }
          BOOL v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          int v10 = [(ASDTDeviceManager *)self deviceInitStatus];
          uint64_t v11 = [v9 deviceUID];
          v12 = [v10 objectForKey:v11];
          int v13 = [v12 unsignedIntValue];

          if (!v13)
          {

            goto LABEL_14;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    int v16 = 1;
LABEL_19:

    char v17 = [(ASDTDeviceManager *)self initializingCond];
    [v17 unlock];

    id v18 = ASDTBaseLogType();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v19 = [(ASDTDeviceManager *)self name];
      v20 = (void *)v19;
      __int16 v21 = "some";
      if (v16) {
        __int16 v21 = "all";
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = v19;
      __int16 v32 = 2080;
      v33 = v21;
      _os_log_impl(&dword_2489BC000, v18, OS_LOG_TYPE_DEFAULT, "%@: Done waiting for devices; %s initialized.",
        buf,
        0x16u);
    }
  }
}

- (void)waitForInitialization
{
  id v3 = [(ASDTDeviceManager *)self configuration];
  -[ASDTDeviceManager waitForInitializationWithTimeoutUs:](self, "waitForInitializationWithTimeoutUs:", [v3 asdtManagerInitializationWaitUs]);
}

- (void)configureDevices
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = [(ASDTDeviceManager *)self configuration];
  uint64_t v4 = [v3 asdtDevices];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v47;
    *(void *)&long long v6 = 138412546;
    long long v36 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(obj);
        }
        BOOL v9 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        int v10 = objc_msgSend(v9, "asdtDeviceUID", v36);
        if (v10)
        {
          uint64_t v11 = +[ASDTAudioDeviceFactory forDeviceConfig:v9 withManager:self];
          if (v11)
          {
            v12 = [(ASDTDeviceManager *)self initializingCond];
            [v12 lock];

            int v13 = [(ASDTDeviceManager *)self deviceFactories];
            [v13 addObject:v11];

            uint64_t v14 = [(ASDTDeviceManager *)self initializingCond];
            [v14 unlock];
          }
          else
          {
            uint64_t v14 = ASDTBaseLogType();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              uint64_t v19 = [(ASDTDeviceManager *)self name];
              *(_DWORD *)buf = v36;
              long long v53 = v19;
              __int16 v54 = 2112;
              v55 = v9;
              _os_log_error_impl(&dword_2489BC000, v14, OS_LOG_TYPE_ERROR, "%@: Failure creating factory for: %@", buf, 0x16u);
            }
          }
LABEL_19:

          goto LABEL_20;
        }
        char v15 = (void *)[v9 asdtSubclass];
        if ([v15 conformsToProtocol:&unk_26FCBCD10])
        {
          uint64_t v11 = [v15 ioServiceDependenciesForConfig:v9];
          if ([v11 count])
          {
            int v16 = [(ASDTDeviceManager *)self initializingCond];
            [v16 lock];

            char v17 = [(ASDTDeviceManager *)self ioServiceDependencies];
            [v17 addObjectsFromArray:v11];

            uint64_t v14 = [(ASDTDeviceManager *)self initializingCond];
            [v14 unlock];
          }
          else
          {
            uint64_t v14 = ASDTBaseLogType();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              v20 = [(ASDTDeviceManager *)self name];
              *(_DWORD *)buf = v36;
              long long v53 = v20;
              __int16 v54 = 2112;
              v55 = v9;
              _os_log_error_impl(&dword_2489BC000, v14, OS_LOG_TYPE_ERROR, "%@: Could not identify service dependencies for configuration: %@", buf, 0x16u);
            }
          }
          goto LABEL_19;
        }
        uint64_t v11 = ASDTBaseLogType();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          id v18 = [(ASDTDeviceManager *)self name];
          *(_DWORD *)buf = v36;
          long long v53 = v18;
          __int16 v54 = 2112;
          v55 = v9;
          _os_log_error_impl(&dword_2489BC000, v11, OS_LOG_TYPE_ERROR, "%@: Could not identify required services for configuration: %@", buf, 0x16u);
        }
LABEL_20:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v46 objects:v56 count:16];
    }
    while (v5);
  }

  __int16 v21 = [(ASDTDeviceManager *)self initializingCond];
  [v21 lock];

  long long v22 = [(ASDTDeviceManager *)self deviceFactories];
  uint64_t v23 = [v22 allObjects];

  long long v24 = [(ASDTDeviceManager *)self ioServiceDependencies];
  long long v25 = (void *)[v24 copy];

  long long v26 = [(ASDTDeviceManager *)self initializingCond];
  [v26 unlock];

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v27 = v23;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v43 != v29) {
          objc_enumerationMutation(v27);
        }
        uint64_t v31 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        if ([v31 checkDependencies]) {
          [(ASDTDeviceManager *)self buildAndInitializeDevice:v31];
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v28);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v32 = v25;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v33)
  {
    uint64_t v34 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v33; ++k)
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(v32);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * k) addManagerDelegate:self];
      }
      uint64_t v33 = [v32 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v33);
  }

  [(ASDTDeviceManager *)self waitForInitialization];
}

- (void)ioServiceAvailable:(id)a3 withManager:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v30 = a4;
  uint64_t v7 = [(ASDTDeviceManager *)self initializingCond];
  [v7 lock];

  id v8 = [(ASDTDeviceManager *)self ioServiceDependencies];
  uint64_t v28 = (void *)[v8 copy];

  BOOL v9 = [(ASDTDeviceManager *)self initializingCond];
  [v9 unlock];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  obuint64_t j = v28;
  uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(obj);
        }
        int v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v13 ioServiceMatches:v6 withManager:v30])
        {
          uint64_t v14 = [v6 idValue];
          char v15 = [v14 identifier];

          int v16 = [(ASDTDeviceManager *)self initializingCond];
          [v16 lock];

          char v17 = [(ASDTDeviceManager *)self matchedDeviceFactories];
          id v18 = [v17 objectForKey:v15];

          uint64_t v19 = [(ASDTDeviceManager *)self initializingCond];
          [v19 unlock];

          if (v18)
          {
            v20 = ASDTBaseLogType();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              __int16 v21 = [(ASDTDeviceManager *)self name];
              *(_DWORD *)buf = 138412546;
              long long v36 = v21;
              __int16 v37 = 2112;
              long long v38 = v15;
              _os_log_error_impl(&dword_2489BC000, v20, OS_LOG_TYPE_ERROR, "%@: Device with UID '%@' already matched.", buf, 0x16u);
            }
          }
          else
          {
            long long v22 = [v13 configuration];
            v20 = [v22 mutableCopy];

            [v20 setObject:v15 forKey:@"DeviceUID"];
            id v18 = +[ASDTAudioDeviceFactory forDeviceConfig:v20 withManager:self];
            if (v18)
            {
              uint64_t v23 = [(ASDTDeviceManager *)self initializingCond];
              [v23 lock];

              long long v24 = [(ASDTDeviceManager *)self deviceFactories];
              [v24 addObject:v18];

              long long v25 = [(ASDTDeviceManager *)self initializingCond];
              [v25 unlock];

              [(ASDTDeviceManager *)self buildAndInitializeDevice:v18];
            }
            else
            {
              long long v26 = ASDTBaseLogType();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                id v27 = [(ASDTDeviceManager *)self name];
                *(_DWORD *)buf = 138412546;
                long long v36 = v27;
                __int16 v37 = 2112;
                long long v38 = v20;
                _os_log_error_impl(&dword_2489BC000, v26, OS_LOG_TYPE_ERROR, "%@: Failure creating factory for: %@", buf, 0x16u);
              }
              [(ASDTDeviceManager *)self deviceConfigurationFailed:v20];
            }
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v10);
  }
}

- (void)terminateDevice:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 terminate];
  }
  [(ASDTDeviceManager *)self removeAudioDevice:v4];
}

- (void)ioServiceWillTerminate:(id)a3 withManager:(id)a4
{
  id v5 = a3;
  id v6 = [(ASDTDeviceManager *)self initializingCond];
  [v6 lock];

  uint64_t v7 = [v5 idValue];
  id v8 = [v7 identifier];
  BOOL v9 = [(ASDTDeviceList *)self getAudioDeviceWithUID:v8];

  uint64_t v10 = [(ASDTDeviceManager *)self initializingCond];
  [v10 unlock];

  if (v9)
  {
    uint64_t v11 = [(ASDTDeviceManager *)self delegate];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      int v13 = NSString;
      uint64_t v14 = [v9 deviceUID];
      char v15 = [v13 stringWithFormat:@"Terminate %@", v14];
      int v16 = +[ASDTCondition conditionWithName:v15];

      [v16 lock];
      uint64_t v25 = 0;
      long long v26 = &v25;
      uint64_t v27 = 0x2020000000;
      char v28 = 0;
      objc_initWeak(&location, self);
      char v17 = [(ASDTDeviceManager *)self delegate];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __56__ASDTDeviceManager_ioServiceWillTerminate_withManager___block_invoke;
      v19[3] = &unk_265243EC0;
      objc_copyWeak(&v23, &location);
      id v20 = v9;
      id v18 = v16;
      id v21 = v18;
      long long v22 = &v25;
      [v17 requestConfigurationChangeForDevice:v20 withBlock:v19];

      while (!*((unsigned char *)v26 + 24))
        [v18 wait];
      [v18 unlock];

      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
      _Block_object_dispose(&v25, 8);
    }
    else
    {
      [(ASDTDeviceManager *)self terminateDevice:v9];
    }
  }
}

uint64_t __56__ASDTDeviceManager_ioServiceWillTerminate_withManager___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained terminateDevice:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) lock];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  [*(id *)(a1 + 40) signal];
  id v3 = *(void **)(a1 + 40);
  return [v3 unlock];
}

- (void)deviceConfigurationFailed:(id)a3
{
  id v4 = a3;
  id v5 = ASDTBaseLogType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    [(ASDTDeviceManager *)self name];
    objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager deviceConfigurationFailed:]();
  }
}

- (void)deviceInitializationFailed:(id)a3
{
  id v4 = a3;
  id v5 = ASDTBaseLogType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    [(ASDTDeviceManager *)self name];
    objc_claimAutoreleasedReturnValue();
    [v4 deviceUID];
    objc_claimAutoreleasedReturnValue();
    -[ASDTDeviceManager deviceInitializationFailed:]();
  }
}

- (BOOL)allowSystemSleep
{
  return 1;
}

- (void)systemWillSleep
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [(ASDTDeviceList *)self audioDevices];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v36 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v19;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v18 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v7 = [v6 systemSleepPending];
          if (v7)
          {
            id v8 = ASDTBaseLogType();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              BOOL v9 = [(ASDTDeviceManager *)self name];
              uint64_t v10 = [v6 deviceUID];
              uint64_t v11 = (void *)v10;
              int v12 = v7;
              if (v7 - 32 >= 0x5F) {
                int v12 = 32;
              }
              *(_DWORD *)buf = 138413826;
              id v23 = v9;
              int v13 = BYTE1(v7);
              if (BYTE1(v7) - 32 >= 0x5F) {
                int v13 = 32;
              }
              __int16 v24 = 1024;
              unsigned int v25 = v7;
              int v14 = BYTE2(v7);
              if (BYTE2(v7) - 32 >= 0x5F) {
                int v14 = 32;
              }
              __int16 v26 = 1024;
              if ((v7 - 0x20000000) >> 24 >= 0x5F) {
                int v15 = 32;
              }
              else {
                int v15 = HIBYTE(v7);
              }
              int v27 = v15;
              __int16 v28 = 1024;
              int v29 = v14;
              __int16 v30 = 1024;
              int v31 = v13;
              __int16 v32 = 1024;
              int v33 = v12;
              __int16 v34 = 2112;
              uint64_t v35 = v10;
              _os_log_error_impl(&dword_2489BC000, v8, OS_LOG_TYPE_ERROR, "%@: systemWillSleep: Received error %x (%c%c%c%c) from device '%@'.", buf, 0x34u);
            }
          }
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v16 = [v2 countByEnumeratingWithState:&v18 objects:v36 count:16];
      uint64_t v3 = v16;
    }
    while (v16);
  }
}

- (void)systemHasPoweredOn
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  [(ASDTDeviceList *)self audioDevices];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v36 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v19;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v19 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v18 + 1) + 8 * v5);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v7 = [v6 systemCompletedPowerOn];
          if (v7)
          {
            id v8 = ASDTBaseLogType();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
            {
              BOOL v9 = [(ASDTDeviceManager *)self name];
              uint64_t v10 = [v6 deviceUID];
              uint64_t v11 = (void *)v10;
              int v12 = v7;
              if (v7 - 32 >= 0x5F) {
                int v12 = 32;
              }
              *(_DWORD *)buf = 138413826;
              id v23 = v9;
              int v13 = BYTE1(v7);
              if (BYTE1(v7) - 32 >= 0x5F) {
                int v13 = 32;
              }
              __int16 v24 = 1024;
              unsigned int v25 = v7;
              int v14 = BYTE2(v7);
              if (BYTE2(v7) - 32 >= 0x5F) {
                int v14 = 32;
              }
              __int16 v26 = 1024;
              if ((v7 - 0x20000000) >> 24 >= 0x5F) {
                int v15 = 32;
              }
              else {
                int v15 = HIBYTE(v7);
              }
              int v27 = v15;
              __int16 v28 = 1024;
              int v29 = v14;
              __int16 v30 = 1024;
              int v31 = v13;
              __int16 v32 = 1024;
              int v33 = v12;
              __int16 v34 = 2112;
              uint64_t v35 = v10;
              _os_log_error_impl(&dword_2489BC000, v8, OS_LOG_TYPE_ERROR, "%@: systemHasPoweredOn: Received error %x (%c%c%c%c) from device '%@'.", buf, 0x34u);
            }
          }
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v16 = [v2 countByEnumeratingWithState:&v18 objects:v36 count:16];
      uint64_t v3 = v16;
    }
    while (v16);
  }
}

- (void)waitForThreadStart
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_7(&dword_2489BC000, v3, v4, "%@: Failed to start thread.", v5);
}

- (void)lockedSignalThread
{
  [(ASDTDeviceManager *)self setThreadWorkToDo:1];
  id v3 = [(ASDTDeviceManager *)self threadCond];
  [v3 signal];
}

- (void)threadLoop:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  os_log_t v4 = ASDTBaseLogType();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(ASDTDeviceManager *)self name];
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v5;
    _os_log_impl(&dword_2489BC000, v4, OS_LOG_TYPE_DEFAULT, "%@: Started background thread.", buf, 0xCu);
  }
  id v6 = [(ASDTDeviceManager *)self initializingCond];
  [v6 lock];

  [(ASDTDeviceManager *)self setThreadStarted:1];
  unsigned int v7 = [(ASDTDeviceManager *)self initializingCond];
  [v7 broadcast];

  id v8 = [(ASDTDeviceManager *)self initializingCond];
  [v8 unlock];

  BOOL v9 = [(ASDTDeviceManager *)self thread];
  [v9 setQualityOfService:17];

  long long v36 = 0uLL;
  uint64_t v37 = 0x10000;
  while (1)
  {
    uint64_t v10 = [(ASDTDeviceManager *)self thread];
    char v11 = [v10 isCancelled];

    if (v11) {
      break;
    }
    int v12 = (void *)MEMORY[0x24C5879A0]();
    int v13 = [(ASDTDeviceManager *)self threadCond];
    [v13 lock];

    if (![(ASDTDeviceManager *)self threadWorkToDo])
    {
      if ((void)v36)
      {
        int v14 = [(ASDTDeviceManager *)self threadCond];
        long long v34 = v36;
        uint64_t v35 = v37;
        [v14 waitUntilTime:&v34];
      }
      else
      {
        int v14 = [(ASDTDeviceManager *)self threadCond];
        [v14 wait];
      }
    }
    [(ASDTDeviceManager *)self setThreadWorkToDo:0];
    int v15 = [(ASDTDeviceManager *)self devicesRunning];
    uint64_t v16 = [v15 allObjects];

    char v17 = [(ASDTDeviceManager *)self threadCond];
    [v17 unlock];

    long long v18 = (ASDTTime *)[v16 count];
    if (!v18)
    {
      ASDTTime::ASDTTime((uint64_t)buf, 0, 1, v19);
LABEL_23:
      long long v36 = *(_OWORD *)buf;
      uint64_t v37 = v40;
      goto LABEL_24;
    }
    if (!(void)v36)
    {
      __int16 v28 = (ASDTTime *)[(ASDTDeviceManager *)self runningLogPeriod];
      ASDTTime::futureSecs(v28, v29, (uint64_t)buf);
      goto LABEL_23;
    }
    ASDTTime::machAbsoluteTime(v18, (uint64_t)buf);
    if (*(uint64_t *)buf > (uint64_t)v36)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v20 = v16;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v31;
        do
        {
          uint64_t v23 = 0;
          do
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v20);
            }
            -[ASDTDeviceManager logStatsForDevice:withPowerState:](self, "logStatsForDevice:withPowerState:", *(void *)(*((void *)&v30 + 1) + 8 * v23), [*(id *)(*((void *)&v30 + 1) + 8 * v23) powerState]);
            ++v23;
          }
          while (v21 != v23);
          uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v21);
      }

      [(ASDTDeviceManager *)self runningLogPeriod];
      ASDTTime::ASDTTime((uint64_t)buf, (ASDTTime *)llround(v24 * 1000000000.0), 1, v25);
      ASDTTime::operator+=((_anonymous_namespace_ **)&v36, (uint64_t *)buf, v26, v27);
    }
LABEL_24:
  }
}

- (void)powerStateChangedForDevice:(id)a3 toState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v14 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [(ASDTDeviceManager *)self threadCond];
    [v6 lock];

    unsigned int v7 = [(ASDTDeviceManager *)self devicesRunning];
    int v8 = [v7 containsObject:v14];

    if (v4 == 1920298606) {
      char v9 = v8;
    }
    else {
      char v9 = 1;
    }
    if (v9)
    {
      if (v4 == 1920298606) {
        int v10 = 0;
      }
      else {
        int v10 = v8;
      }
      if (v10 != 1) {
        goto LABEL_13;
      }
      [(ASDTDeviceManager *)self logStatsForDevice:v14 withPowerState:v4];
      char v11 = [(ASDTDeviceManager *)self devicesRunning];
      [v11 removeObject:v14];
    }
    else
    {
      int v12 = [(ASDTDeviceManager *)self devicesRunning];
      [v12 addObject:v14];

      [(ASDTDeviceManager *)self logStatsForDevice:v14 withPowerState:1920298606];
    }
    [(ASDTDeviceManager *)self lockedSignalThread];
LABEL_13:
    int v13 = [(ASDTDeviceManager *)self threadCond];
    [v13 unlock];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([v10 isEqualToString:@"powerState"])
  {
    int v13 = [v12 objectForKey:*MEMORY[0x263F081B8]];
    -[ASDTDeviceManager powerStateChangedForDevice:toState:](self, "powerStateChangedForDevice:toState:", v11, [v13 unsignedIntValue]);
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)ASDTDeviceManager;
    [(ASDTDeviceManager *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (id)messageForDroppedPacketsFromDevice:(id)a3 withScope:(unsigned int)a4 andElement:(unsigned int)a5
{
  id v7 = a3;
  v13[0] = 1883533936;
  v13[1] = a4;
  v13[2] = a5;
  if (([v7 hasProperty:v13] & 1) != 0
    && (int v11 = 4,
        unsigned int v12 = 0,
        ([v7 getProperty:v13 withQualifierSize:0 qualifierData:0 dataSize:&v11 andData:&v12 forClient:0] & 1) != 0))
  {
    int v8 = "Host";
    if (a5 != 1) {
      int v8 = "Remote";
    }
    char v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %u", v8, v12);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)messageForDroppedPacketsFromDevice:(id)a3 withScope:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [(ASDTDeviceManager *)self messageForDroppedPacketsFromDevice:v6 withScope:v4 andElement:1];
  uint64_t v8 = [(ASDTDeviceManager *)self messageForDroppedPacketsFromDevice:v6 withScope:v4 andElement:0];
  if (v7 | v8)
  {
    if (v7) {
      char v9 = (const char *)[ (id) v7 UTF8String];
    }
    else {
      char v9 = "";
    }
    if (v8) {
      int v11 = (const char *)[ (id) v8 UTF8String];
    }
    else {
      int v11 = "";
    }
    unsigned int v12 = "Output";
    if (v4 != 1869968496) {
      unsigned int v12 = "Input";
    }
    if (v8) {
      BOOL v13 = v7 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    objc_super v14 = ", ";
    if (v13) {
      objc_super v14 = "";
    }
    id v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s: %s%s%s", v12, v9, v14, v11);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (void)logStatsForDevice:(id)a3 withPowerState:(int)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v29 = a3;
  long long v30 = [MEMORY[0x263EFF980] array];
  id v6 = NSString;
  uint64_t v7 = [(ASDTDeviceManager *)self name];
  uint64_t v8 = [v29 deviceUID];
  char v9 = (void *)v8;
  id v10 = "not ";
  if (a4 == 1920298606) {
    id v10 = "";
  }
  int v11 = [v6 stringWithFormat:@"%@: '%@' is %srunning", v7, v8, v10];

  if (v11) {
    [v30 addObject:v11];
  }
  __int16 v28 = [(ASDTDeviceManager *)self messageForDroppedPacketsFromDevice:v29 withScope:1869968496];
  uint64_t v12 = [(ASDTDeviceManager *)self messageForDroppedPacketsFromDevice:v29 withScope:1768845428];
  int v27 = (void *)v12;
  if (__PAIR128__((unint64_t)v28, v12) != 0)
  {
    BOOL v13 = &stru_26FCA6768;
    if (v12) {
      objc_super v14 = (__CFString *)v12;
    }
    else {
      objc_super v14 = &stru_26FCA6768;
    }
    if (v12) {
      BOOL v15 = v28 == 0;
    }
    else {
      BOOL v15 = 1;
    }
    uint64_t v16 = "; ";
    if (v15) {
      uint64_t v16 = "";
    }
    if (v28) {
      BOOL v13 = v28;
    }
    uint64_t v17 = [NSString stringWithFormat:@"Packets Dropped: %@%s%@", v13, v16, v14];

    if (v17)
    {
      int v11 = (void *)v17;
      [v30 addObject:v17];
    }
    else
    {
      int v11 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v18 = [v29 status];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v19 = [v18 allKeys];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          double v24 = NSString;
          unsigned int v25 = [v18 objectForKeyedSubscript:v23];
          uint64_t v26 = [v24 stringWithFormat:@"%@: %@", v23, v25];

          int v11 = (void *)v26;
          if (v26) {
            [v30 addObject:v26];
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v20);
    }
  }
  [MEMORY[0x263F28C50] asdtLogComponents:v30, @", " withSeparator];
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (ASDTDeviceManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASDTDeviceManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ASDPlugin)plugin
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_plugin);
  return (ASDPlugin *)WeakRetained;
}

- (void)setPlugin:(id)a3
{
}

- (BOOL)verboseDeviceLogging
{
  return self->_verboseDeviceLogging;
}

- (void)setVerboseDeviceLogging:(BOOL)a3
{
  self->_verboseDeviceLogging = a3;
}

- (NSMutableSet)deviceFactories
{
  return self->_deviceFactories;
}

- (void)setDeviceFactories:(id)a3
{
}

- (NSMutableDictionary)matchedDeviceFactories
{
  return self->_matchedDeviceFactories;
}

- (void)setMatchedDeviceFactories:(id)a3
{
}

- (NSMutableArray)ioServiceDependencies
{
  return self->_ioServiceDependencies;
}

- (void)setIoServiceDependencies:(id)a3
{
}

- (unsigned)numDevicesToInitialize
{
  return self->_numDevicesToInitialize;
}

- (void)setNumDevicesToInitialize:(unsigned int)a3
{
  self->_numDevicesToInitialize = a3;
}

- (NSMutableDictionary)deviceInitStatus
{
  return self->_deviceInitStatus;
}

- (void)setDeviceInitStatus:(id)a3
{
}

- (OS_dispatch_queue)initializingQueue
{
  return self->_initializingQueue;
}

- (void)setInitializingQueue:(id)a3
{
}

- (ASDTCondition)initializingCond
{
  return self->_initializingCond;
}

- (void)setInitializingCond:(id)a3
{
}

- (NSThread)thread
{
  return self->_thread;
}

- (void)setThread:(id)a3
{
}

- (ASDTCondition)threadCond
{
  return self->_threadCond;
}

- (void)setThreadCond:(id)a3
{
}

- (BOOL)threadWorkToDo
{
  return self->_threadWorkToDo;
}

- (void)setThreadWorkToDo:(BOOL)a3
{
  self->_threadWorkToDo = a3;
}

- (BOOL)threadStarted
{
  return self->_threadStarted;
}

- (void)setThreadStarted:(BOOL)a3
{
  self->_threadStarted = a3;
}

- (NSMutableSet)devicesRunning
{
  return self->_devicesRunning;
}

- (void)setDevicesRunning:(id)a3
{
}

- (NSSet)underlyingDeviceUIDs
{
  return self->_underlyingDeviceUIDs;
}

- (void)setUnderlyingDeviceUIDs:(id)a3
{
}

- (double)runningLogPeriod
{
  return self->_runningLogPeriod;
}

- (void)setRunningLogPeriod:(double)a3
{
  self->_runningLogPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_devicesRunning, 0);
  objc_storeStrong((id *)&self->_threadCond, 0);
  objc_storeStrong((id *)&self->_thread, 0);
  objc_storeStrong((id *)&self->_initializingCond, 0);
  objc_storeStrong((id *)&self->_initializingQueue, 0);
  objc_storeStrong((id *)&self->_deviceInitStatus, 0);
  objc_storeStrong((id *)&self->_ioServiceDependencies, 0);
  objc_storeStrong((id *)&self->_matchedDeviceFactories, 0);
  objc_storeStrong((id *)&self->_deviceFactories, 0);
  objc_destroyWeak((id *)&self->_plugin);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)initWithConfig:withDelegate:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_7(&dword_2489BC000, v3, v4, "%@: Memory allocation error on initializingQueue/Devices/Cond.", v5);
}

- (void)removeAudioDevices:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  _os_log_debug_impl(&dword_2489BC000, v5, OS_LOG_TYPE_DEBUG, "%@: Bad or unmanaged devices to remove. %@", v4, 0x16u);
}

- (void)buildAndInitializeDevice:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_4(&dword_2489BC000, "%@: Failed to build device '%@' after resources ready.", v4, v5);
}

- (void)buildAndInitializeDevice:.cold.2()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_4(&dword_2489BC000, "%@: Device with UID '%@' is already matched.", v4, v5);
}

- (void)deviceInitialized:withStatus:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_8(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_1_4(&dword_2489BC000, "%@: Initialization of device '%@' failed; not publishing it.", v5, v6);
}

- (void)deviceInitialized:withStatus:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_7(&dword_2489BC000, v3, v4, "%@: No devices to initialize!", v5);
}

- (void)publishDeviceLocked:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_8(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_1_4(&dword_2489BC000, "%@: Device factory for '%@' missing device object.", v5, v6);
}

- (void)publishDeviceLocked:.cold.2()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_7(&dword_2489BC000, v3, v4, "%@: Bad device factory.", v5);
}

- (void)waitForInitializationWithTimeoutUs:.cold.1()
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_5(v1, v2, 5.7779e-34);
  _os_log_debug_impl(&dword_2489BC000, v3, OS_LOG_TYPE_DEBUG, "%@: Timeout waiting for audio devices to initialize.", v4, 0xCu);
}

- (void)deviceConfigurationFailed:.cold.1()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_8(v1, v2, v3, 5.778e-34);
  OUTLINED_FUNCTION_1_4(&dword_2489BC000, "%@: Failed creating audio device with configuration:\n%@", v4, v5);
}

- (void)deviceInitializationFailed:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_0_8(v2, v3, v4, 5.778e-34);
  OUTLINED_FUNCTION_1_4(&dword_2489BC000, "%@: Failed initializing audio device with UID %@", v5, v6);
}

@end