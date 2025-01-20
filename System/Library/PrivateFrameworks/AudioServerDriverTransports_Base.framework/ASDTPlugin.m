@interface ASDTPlugin
+ (id)forBundleID:(id)a3;
- (ASDTChangeRequestManager)changeRequestManager;
- (ASDTDeviceList)publishedDevices;
- (ASDTDeviceManager)deviceManager;
- (ASDTPlugin)init;
- (ASDTSystemPowerNotifier)systemPowerNotifier;
- (BOOL)allowSystemSleep;
- (BOOL)callRequestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4;
- (BOOL)configurationChangePendingForObject:(id)a3;
- (BOOL)initializationComplete;
- (BOOL)requestConfigurationChange:(id)a3;
- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4;
- (BOOL)systemIsSleeping;
- (NSArray)audioDevices;
- (NSDictionary)config;
- (NSString)asdtBundleID;
- (OS_dispatch_queue)concurrentQueue;
- (id)initForBundleID:(id)a3;
- (void)addAudioDevice:(id)a3;
- (void)addAudioDevices:(id)a3;
- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3;
- (void)removeAudioDevice:(id)a3;
- (void)removeAudioDevices:(id)a3;
- (void)setAsdtBundleID:(id)a3;
- (void)setChangeRequestManager:(id)a3;
- (void)setConcurrentQueue:(id)a3;
- (void)setDeviceManager:(id)a3;
- (void)setInitializationComplete:(BOOL)a3;
- (void)setPublishedDevices:(id)a3;
- (void)setSystemPowerNotifier:(id)a3;
- (void)systemHasPoweredOn;
- (void)systemWillSleep;
- (void)waitForChangeRequests;
- (void)waitForConfigurationChangesForDevice:(id)a3;
@end

@implementation ASDTPlugin

+ (id)forBundleID:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initForBundleID:v4];

  return v5;
}

- (id)initForBundleID:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ASDTPlugin;
  v5 = [(ASDTPlugin *)&v24 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_11;
  }
  atomic_store(0, &v5->_configChangeNumber.__a_.__a_value);
  v7 = v4;
  if (!v4)
  {
    v23.receiver = v5;
    v23.super_class = (Class)ASDTPlugin;
    v7 = [(ASDTPlugin *)&v23 bundleID];
  }
  [(ASDTPlugin *)v6 setAsdtBundleID:v7];
  if (!v4) {

  }
  v8 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x263EF83A8], QOS_CLASS_USER_INTERACTIVE, 0);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.AudioServerDriverTransports.ASDTPlugin.concurrentQueue", v8);
  [(ASDTPlugin *)v6 setConcurrentQueue:v9];

  v10 = [(ASDTPlugin *)v6 bundleID];
  v11 = +[ASDTSystemPowerNotifier notifierForBundleName:v10 delegate:v6 earlyWake:0];
  [(ASDTPlugin *)v6 setSystemPowerNotifier:v11];

  v12 = objc_alloc_init(ASDTDeviceList);
  [(ASDTPlugin *)v6 setPublishedDevices:v12];

  v13 = +[ASDTChangeRequestManager forDelegate:v6];
  [(ASDTPlugin *)v6 setChangeRequestManager:v13];

  v14 = [(ASDTPlugin *)v6 concurrentQueue];
  if (v14)
  {
    v15 = [(ASDTPlugin *)v6 systemPowerNotifier];
    if (v15)
    {
      v16 = [(ASDTPlugin *)v6 publishedDevices];
      if (v16)
      {
        v17 = [(ASDTPlugin *)v6 changeRequestManager];
        BOOL v18 = v17 == 0;

        if (!v18)
        {

LABEL_11:
          v19 = v6;
          goto LABEL_17;
        }
        goto LABEL_14;
      }
    }
  }
LABEL_14:
  v20 = ASDTBaseLogType();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = [(ASDTPlugin *)v6 bundleID];
    [(ASDTPlugin *)v21 initForBundleID:v20];
  }

  v19 = 0;
LABEL_17:

  return v19;
}

- (ASDTPlugin)init
{
  return (ASDTPlugin *)[(ASDTPlugin *)self initForBundleID:0];
}

- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v5 = ASDTBaseLogType();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(ASDTPlugin *)self bundleID];
    *(_DWORD *)buf = 138412546;
    BOOL v18 = v6;
    __int16 v19 = 2080;
    v20 = "220.25";
    _os_log_impl(&dword_2489BC000, v5, OS_LOG_TYPE_DEFAULT, "%@ %s Initialization Start", buf, 0x16u);
  }
  v16.receiver = self;
  v16.super_class = (Class)ASDTPlugin;
  [(ASDTPlugin *)&v16 halInitializeWithPluginHost:a3];
  v7 = [(ASDTPlugin *)self config];
  if (v7)
  {
    v8 = +[ASDTDeviceManager deviceManagerWithConfig:v7 withDelegate:self];
    [(ASDTPlugin *)self setDeviceManager:v8];

    dispatch_queue_t v9 = [(ASDTPlugin *)self deviceManager];
    LODWORD(v8) = v9 == 0;

    if (!v8)
    {
      v10 = "Success";
      goto LABEL_11;
    }
    v11 = ASDTBaseLogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = [(ASDTPlugin *)self bundleID];
      [(ASDTPlugin *)v13 halInitializeWithPluginHost:v11];
    }
  }
  else
  {
    v11 = ASDTBaseLogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = [(ASDTPlugin *)self bundleID];
      [(ASDTPlugin *)v12 halInitializeWithPluginHost:v11];
    }
  }

  v10 = "Failure";
LABEL_11:
  [(ASDTPlugin *)self setInitializationComplete:1];
  v14 = ASDTBaseLogType();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = [(ASDTPlugin *)self bundleID];
    *(_DWORD *)buf = 138412802;
    BOOL v18 = v15;
    __int16 v19 = 2080;
    v20 = "220.25";
    __int16 v21 = 2080;
    v22 = v10;
    _os_log_impl(&dword_2489BC000, v14, OS_LOG_TYPE_DEFAULT, "%@ %s Initialization End; Result: %s", buf, 0x20u);
  }
}

- (NSArray)audioDevices
{
  v2 = [(ASDTPlugin *)self publishedDevices];
  v3 = [v2 audioDevices];

  return (NSArray *)v3;
}

- (void)addAudioDevice:(id)a3
{
  id v4 = a3;
  v5 = [(ASDTPlugin *)self publishedDevices];
  [v5 addAudioDevice:v4];

  v6 = [(ASDTPlugin *)self changeRequestManager];
  [v6 waitForConfigurationChangesForDevice:v4];

  v7.receiver = self;
  v7.super_class = (Class)ASDTPlugin;
  [(ASDTPlugin *)&v7 addAudioDevice:v4];
}

- (void)addAudioDevices:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(ASDTPlugin *)self publishedDevices];
  [v5 addAudioDevices:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * v9);
        v11 = [(ASDTPlugin *)self changeRequestManager];
        [v11 waitForConfigurationChangesForDevice:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  v12.receiver = self;
  v12.super_class = (Class)ASDTPlugin;
  [(ASDTPlugin *)&v12 addAudioDevices:v6];
}

- (void)removeAudioDevice:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ASDTPlugin;
  [(ASDTPlugin *)&v6 removeAudioDevice:v4];
  v5 = [(ASDTPlugin *)self publishedDevices];
  [v5 removeAudioDevice:v4];
}

- (void)removeAudioDevices:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ASDTPlugin;
  [(ASDTPlugin *)&v6 removeAudioDevices:v4];
  v5 = [(ASDTPlugin *)self publishedDevices];
  [v5 removeAudioDevices:v4];
}

- (BOOL)callRequestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ASDTPlugin;
  return [(ASDTPlugin *)&v5 requestConfigurationChangeForDevice:a3 withBlock:a4];
}

- (BOOL)requestConfigurationChange:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(ASDTPlugin *)self initializationComplete];
  objc_super v6 = [(ASDTPlugin *)self publishedDevices];
  uint64_t v7 = [v6 audioDevices];

  if (v5
    && ([v4 object],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v7 containsObject:v8],
        v8,
        (v9 & 1) != 0))
  {
    uint64_t v10 = [v4 object];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __41__ASDTPlugin_requestConfigurationChange___block_invoke_2;
    v18[3] = &unk_265243E70;
    id v19 = v4;
    BOOL v11 = [(ASDTPlugin *)self callRequestConfigurationChangeForDevice:v10 withBlock:v18];
    objc_super v12 = &v19;
  }
  else
  {
    long long v13 = ASDTBaseLogType();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [v4 name];
      long long v15 = (void *)v14;
      long long v16 = "before initialization is complete";
      if (v5) {
        long long v16 = "for unpublished device";
      }
      *(_DWORD *)buf = 136315394;
      objc_super v23 = v16;
      __int16 v24 = 2112;
      uint64_t v25 = v14;
      _os_log_impl(&dword_2489BC000, v13, OS_LOG_TYPE_DEFAULT, "Executing configuration change %s: %@", buf, 0x16u);
    }
    uint64_t v10 = [(ASDTPlugin *)self concurrentQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__ASDTPlugin_requestConfigurationChange___block_invoke;
    block[3] = &unk_265243E70;
    objc_super v12 = &v21;
    id v21 = v4;
    dispatch_async(v10, block);
    BOOL v11 = 1;
  }

  return v11;
}

uint64_t __41__ASDTPlugin_requestConfigurationChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) execute];
}

uint64_t __41__ASDTPlugin_requestConfigurationChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) execute];
}

- (BOOL)requestConfigurationChangeForDevice:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ASDTPlugin *)self changeRequestManager];
  char v9 = [v8 requestConfigurationChangeForDevice:v6 withBlock:v7];

  return v9;
}

- (BOOL)configurationChangePendingForObject:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ASDTPlugin *)self changeRequestManager];
  char v6 = [v5 configurationChangePendingForObject:v4];

  return v6;
}

- (void)waitForConfigurationChangesForDevice:(id)a3
{
  id v5 = a3;
  id v4 = [(ASDTPlugin *)self changeRequestManager];
  [v4 waitForConfigurationChangesForDevice:v5];
}

- (void)waitForChangeRequests
{
  id v2 = [(ASDTPlugin *)self changeRequestManager];
  [v2 waitForAllConfigurationChanges];
}

- (BOOL)systemIsSleeping
{
  id v2 = [(ASDTPlugin *)self systemPowerNotifier];
  char v3 = [v2 systemIsSleeping];

  return v3;
}

- (BOOL)allowSystemSleep
{
  char v3 = [(ASDTPlugin *)self deviceManager];

  if (!v3) {
    return 1;
  }
  id v4 = [(ASDTPlugin *)self deviceManager];
  char v5 = [v4 allowSystemSleep];

  return v5;
}

- (void)systemWillSleep
{
  v4.receiver = self;
  v4.super_class = (Class)ASDTPlugin;
  [(ASDTPlugin *)&v4 systemWillSleep];
  char v3 = [(ASDTPlugin *)self deviceManager];
  [v3 systemWillSleep];
}

- (void)systemHasPoweredOn
{
  char v3 = [(ASDTPlugin *)self deviceManager];
  [v3 systemHasPoweredOn];

  v4.receiver = self;
  v4.super_class = (Class)ASDTPlugin;
  [(ASDTPlugin *)&v4 systemHasPoweredOn];
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (void)setConcurrentQueue:(id)a3
{
}

- (NSDictionary)config
{
  return self->_config;
}

- (ASDTDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
}

- (NSString)asdtBundleID
{
  return self->_asdtBundleID;
}

- (void)setAsdtBundleID:(id)a3
{
}

- (ASDTSystemPowerNotifier)systemPowerNotifier
{
  return self->_systemPowerNotifier;
}

- (void)setSystemPowerNotifier:(id)a3
{
}

- (BOOL)initializationComplete
{
  return self->_initializationComplete;
}

- (void)setInitializationComplete:(BOOL)a3
{
  self->_initializationComplete = a3;
}

- (ASDTDeviceList)publishedDevices
{
  return self->_publishedDevices;
}

- (void)setPublishedDevices:(id)a3
{
}

- (ASDTChangeRequestManager)changeRequestManager
{
  return self->_changeRequestManager;
}

- (void)setChangeRequestManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRequestManager, 0);
  objc_storeStrong((id *)&self->_publishedDevices, 0);
  objc_storeStrong((id *)&self->_systemPowerNotifier, 0);
  objc_storeStrong((id *)&self->_asdtBundleID, 0);
  objc_storeStrong((id *)&self->_deviceManager, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
}

- (void)initForBundleID:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_7(&dword_2489BC000, a2, a3, "%@: Memory allocation error.", (uint8_t *)a2);
}

- (void)halInitializeWithPluginHost:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_7(&dword_2489BC000, a2, a3, "%@: No configuration found.", (uint8_t *)a2);
}

- (void)halInitializeWithPluginHost:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_7(&dword_2489BC000, a2, a3, "%@: Failed creating device manager.", (uint8_t *)a2);
}

@end