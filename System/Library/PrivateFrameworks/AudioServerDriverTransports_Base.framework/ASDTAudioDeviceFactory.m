@interface ASDTAudioDeviceFactory
+ (id)factoryWithUID:(id)a3 fromList:(id)a4;
+ (id)forDeviceConfig:(id)a3 withManager:(id)a4;
+ (id)ioServiceDependenciesForConfig:(id)a3;
+ (void)addDependenciesFromConfig:(id)a3 toArray:(id)a4;
+ (void)addDependenciesFromConfigArray:(id)a3 toArray:(id)a4;
- (ASDAudioDevice)device;
- (ASDAudioDevice)underlyingDevice;
- (ASDTDeviceManager)manager;
- (ASDTTime)initTime;
- (BOOL)buildDevice;
- (BOOL)checkDependencies;
- (BOOL)checkIOServiceDependencies;
- (BOOL)checkUnderlyingDeviceDependency;
- (BOOL)deviceIsBuilding;
- (BOOL)deviceIsUnderlying;
- (BOOL)didRegisterInterestInUnderlyingDevice;
- (BOOL)ioServiceDependenciesDiscovered;
- (NSArray)ioServiceDependencies;
- (NSDictionary)config;
- (NSString)deviceUID;
- (NSString)underlyingDeviceUID;
- (id).cxx_construct;
- (id)initForDeviceConfig:(id)a3 withManager:(id)a4;
- (int)initializeDevice;
- (void)buildDevice;
- (void)cleanup;
- (void)dealloc;
- (void)interestNotification:(int)a3 forDevice:(id)a4;
- (void)ioServiceAvailable:(id)a3 withManager:(id)a4;
- (void)publishDevice;
- (void)setConfig:(id)a3;
- (void)setDevice:(id)a3;
- (void)setDeviceIsBuilding:(BOOL)a3;
- (void)setDeviceIsUnderlying:(BOOL)a3;
- (void)setDeviceUID:(id)a3;
- (void)setDidRegisterInterestInUnderlyingDevice:(BOOL)a3;
- (void)setInitTime:(ASDTTime *)a3;
- (void)setIoServiceDependencies:(id)a3;
- (void)setIoServiceDependenciesDiscovered:(BOOL)a3;
- (void)setManager:(id)a3;
- (void)setUnderlyingDevice:(id)a3;
- (void)setUnderlyingDeviceUID:(id)a3;
@end

@implementation ASDTAudioDeviceFactory

+ (id)forDeviceConfig:(id)a3 withManager:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = (objc_class *)[v5 asdtFactorySubclass];
  if ([(objc_class *)v7 isSubclassOfClass:objc_opt_class()])
  {
    v8 = (void *)[[v7 alloc] initForDeviceConfig:v5 withManager:v6];
  }
  else
  {
    v9 = ASDTBaseLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [v5 objectForKeyedSubscript:@"FactorySubclass"];
      v11 = [v5 objectForKeyedSubscript:@"Subclass"];
      +[ASDTAudioDeviceFactory forDeviceConfig:v13 withManager:v9];
    }

    v8 = 0;
  }

  return v8;
}

- (id)initForDeviceConfig:(id)a3 withManager:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 asdtDeviceUID];
  v10 = (void *)v9;
  if (!v8 || !v7 || !v9)
  {
    v11 = ASDTBaseLogType();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[ASDTAudioDeviceFactory initForDeviceConfig:withManager:](v11);
    }

    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"ASDTAudioDeviceFactory.mm" lineNumber:67 description:@"Bad arguments."];
  }
  v23.receiver = self;
  v23.super_class = (Class)ASDTAudioDeviceFactory;
  v13 = [(ASDTAudioDeviceFactory *)&v23 init];
  uint64_t v14 = v13;
  if (v13)
  {
    ASDTTime::machAbsoluteTime((ASDTTime *)v13, (uint64_t)buf);
    *(_OWORD *)&v14->_initTime.nsec = *(_OWORD *)buf;
    *(void *)&v14->_initTime.hostFrac = *(void *)&buf[16];
    [(ASDTAudioDeviceFactory *)v14 setDeviceUID:v10];
    [(ASDTAudioDeviceFactory *)v14 setConfig:v7];
    [(ASDTAudioDeviceFactory *)v14 setManager:v8];
    v15 = [(ASDTAudioDeviceFactory *)v14 config];
    uint64_t v16 = [v15 asdtUnderlyingDeviceUID];
    [(ASDTAudioDeviceFactory *)v14 setUnderlyingDeviceUID:v16];

    v17 = [v8 underlyingDeviceUIDs];
    -[ASDTAudioDeviceFactory setDeviceIsUnderlying:](v14, "setDeviceIsUnderlying:", [v17 containsObject:v10]);

    v18 = [(ASDTAudioDeviceFactory *)v14 underlyingDeviceUID];
    LOBYTE(v16) = v18 == 0;

    if ((v16 & 1) == 0)
    {
      v19 = ASDTBaseLogType();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [(ASDTAudioDeviceFactory *)v14 deviceUID];
        v21 = [(ASDTAudioDeviceFactory *)v14 underlyingDeviceUID];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v21;
        _os_log_impl(&dword_2489BC000, v19, OS_LOG_TYPE_DEFAULT, "%@: Requires underling device with UID: %@", buf, 0x16u);
      }
    }
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(ASDTAudioDeviceFactory *)self ioServiceDependencies];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) ioServiceManager];
        [v7 removeDelegate:self];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  v8.receiver = self;
  v8.super_class = (Class)ASDTAudioDeviceFactory;
  [(ASDTAudioDeviceFactory *)&v8 dealloc];
}

- (void)cleanup
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [(ASDTAudioDeviceFactory *)self setManager:0];
  [(ASDTAudioDeviceFactory *)self setDevice:0];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(ASDTAudioDeviceFactory *)self ioServiceDependencies];
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
        id v7 = [*(id *)(*((void *)&v8 + 1) + 8 * v6) ioServiceManager];
        [v7 removeDelegate:self];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  [(ASDTAudioDeviceFactory *)self setIoServiceDependencies:0];
}

- (BOOL)checkIOServiceDependencies
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  if (![(ASDTAudioDeviceFactory *)self ioServiceDependenciesDiscovered])
  {
    v3 = objc_opt_class();
    uint64_t v4 = [(ASDTAudioDeviceFactory *)self config];
    uint64_t v5 = [v3 ioServiceDependenciesForConfig:v4];
    [(ASDTAudioDeviceFactory *)self setIoServiceDependencies:v5];

    [(ASDTAudioDeviceFactory *)self setIoServiceDependenciesDiscovered:1];
    uint64_t v6 = [(ASDTAudioDeviceFactory *)self ioServiceDependencies];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      long long v8 = (void *)MEMORY[0x263EFF9C0];
      long long v9 = [(ASDTAudioDeviceFactory *)self ioServiceDependencies];
      long long v10 = objc_msgSend(v8, "setWithCapacity:", objc_msgSend(v9, "count"));

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v11 = [(ASDTAudioDeviceFactory *)self ioServiceDependencies];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v53 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v44 != v13) {
              objc_enumerationMutation(v11);
            }
            v15 = [*(id *)(*((void *)&v43 + 1) + 8 * i) description];
            [v10 addObject:v15];
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v53 count:16];
        }
        while (v12);
      }

      uint64_t v16 = ASDTBaseLogType();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = [(ASDTAudioDeviceFactory *)self deviceUID];
        *(_DWORD *)buf = 138412546;
        v50 = v17;
        __int16 v51 = 2112;
        v52 = v10;
        _os_log_impl(&dword_2489BC000, v16, OS_LOG_TYPE_DEFAULT, "%@: Dependent on IOServices: %@", buf, 0x16u);
      }
    }
  }
  v18 = [(ASDTAudioDeviceFactory *)self ioServiceDependencies];
  BOOL v19 = [v18 count] == 0;

  if (v19) {
    return 1;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v20 = [(ASDTAudioDeviceFactory *)self ioServiceDependencies];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v40 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        uint64_t v25 = [v24 ioServiceManager];
        BOOL v26 = v25 == 0;

        if (v26) {
          [v24 addManagerDelegate:self];
        }
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v21);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v27 = [(ASDTAudioDeviceFactory *)self ioServiceDependencies];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v47 count:16];
  if (v28)
  {
    uint64_t v29 = *(void *)v36;
    while (2)
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v36 != v29) {
          objc_enumerationMutation(v27);
        }
        v31 = [*(id *)(*((void *)&v35 + 1) + 8 * k) ioService];
        BOOL v32 = v31 == 0;

        if (v32)
        {
          BOOL v33 = 0;
          goto LABEL_33;
        }
      }
      uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v47 count:16];
      if (v28) {
        continue;
      }
      break;
    }
  }
  BOOL v33 = 1;
LABEL_33:

  return v33;
}

- (void)ioServiceAvailable:(id)a3 withManager:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v8 = [(ASDTAudioDeviceFactory *)self ioServiceDependencies];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v11++) ioServiceAvailable:v6 withManager:v7];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  if ([(ASDTAudioDeviceFactory *)self checkDependencies])
  {
    uint64_t v12 = [(ASDTAudioDeviceFactory *)self manager];
    [v12 resourcesAvailableForDevice:self];
  }
}

- (BOOL)checkUnderlyingDeviceDependency
{
  v3 = [(ASDTAudioDeviceFactory *)self underlyingDeviceUID];

  if (!v3) {
    return 1;
  }
  if (![(ASDTAudioDeviceFactory *)self didRegisterInterestInUnderlyingDevice])
  {
    [(ASDTAudioDeviceFactory *)self setDidRegisterInterestInUnderlyingDevice:1];
    uint64_t v4 = [(ASDTAudioDeviceFactory *)self manager];
    uint64_t v5 = [(ASDTAudioDeviceFactory *)self underlyingDeviceUID];
    [v4 registerObject:self withInterests:1 forUID:v5];
  }
  id v6 = [(ASDTAudioDeviceFactory *)self underlyingDevice];
  BOOL v7 = v6 != 0;

  return v7;
}

- (void)interestNotification:(int)a3 forDevice:(id)a4
{
  id v9 = a4;
  uint64_t v5 = [(ASDTAudioDeviceFactory *)self underlyingDeviceUID];
  id v6 = [v9 deviceUID];
  int v7 = [v5 isEqualToString:v6];

  if (v7)
  {
    [(ASDTAudioDeviceFactory *)self setUnderlyingDevice:v9];
    if ([(ASDTAudioDeviceFactory *)self checkDependencies])
    {
      long long v8 = [(ASDTAudioDeviceFactory *)self manager];
      [v8 resourcesAvailableForDevice:self];
    }
  }
}

- (BOOL)checkDependencies
{
  BOOL v3 = [(ASDTAudioDeviceFactory *)self checkIOServiceDependencies];
  return [(ASDTAudioDeviceFactory *)self checkUnderlyingDeviceDependency] && v3;
}

- (BOOL)buildDevice
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(ASDTAudioDeviceFactory *)self checkDependencies];
  if (v3)
  {
    uint64_t v4 = [(ASDTAudioDeviceFactory *)self config];
    uint64_t v5 = [(ASDTAudioDeviceFactory *)self manager];
    id v6 = [(ASDTAudioDeviceFactory *)self manager];
    int v7 = [v6 plugin];
    long long v8 = +[ASDTAudioDevice deviceForConfig:v4 withDeviceManager:v5 andPlugin:v7];
    [(ASDTAudioDeviceFactory *)self setDevice:v8];

    id v9 = [(ASDTAudioDeviceFactory *)self device];

    if (v9)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      uint64_t v10 = ASDTBaseLogType();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = [(ASDTAudioDeviceFactory *)self deviceUID];
        [(ASDTAudioDeviceFactory *)v11 buildDevice];
      }

      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (int)initializeDevice
{
  BOOL v3 = [(ASDTAudioDeviceFactory *)self device];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return 0;
  }
  uint64_t v5 = [(ASDTAudioDeviceFactory *)self device];
  id v6 = [v5 pmSequencer];
  int v7 = [v6 executeSequenceToState:1768189029];

  return v7;
}

- (void)publishDevice
{
  if (![(ASDTAudioDeviceFactory *)self deviceIsUnderlying])
  {
    id v3 = [(ASDTAudioDeviceFactory *)self manager];
    [v3 publishDevice:self];
  }
}

+ (void)addDependenciesFromConfig:(id)a3 toArray:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = (void *)[v8 asdtSubclass];
    if ([v6 conformsToProtocol:&unk_26FCBCD10])
    {
      int v7 = [v6 ioServiceDependenciesForConfig:v8];
      if ([v7 count]) {
        [v5 addObjectsFromArray:v7];
      }
    }
  }
}

+ (void)addDependenciesFromConfigArray:(id)a3 toArray:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(a1, "addDependenciesFromConfig:toArray:", *(void *)(*((void *)&v12 + 1) + 8 * v11++), v7, (void)v12);
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

+ (id)ioServiceDependenciesForConfig:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  [a1 addDependenciesFromConfig:v4 toArray:v5];
  id v6 = [v4 asdtControls];
  [a1 addDependenciesFromConfigArray:v6 toArray:v5];

  id v7 = [v4 asdtCustomProperties];
  [a1 addDependenciesFromConfigArray:v7 toArray:v5];

  id v8 = [v4 asdtPMDevices];
  [a1 addDependenciesFromConfigArray:v8 toArray:v5];

  uint64_t v9 = [v4 asdtStreams];
  [a1 addDependenciesFromConfigArray:v9 toArray:v5];

  if ([v5 count]) {
    uint64_t v10 = (void *)[v5 copy];
  }
  else {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)factoryWithUID:(id)a3 fromList:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = a4;
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "deviceUID", (void)v14);
        char v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (ASDTTime)initTime
{
  *retstr = self[3];
  return self;
}

- (void)setInitTime:(ASDTTime *)a3
{
  long long v3 = *(_OWORD *)&a3->nsec;
  *(void *)&self->_initTime.hostFrac = *(void *)&a3->hostFrac;
  *(_OWORD *)&self->_initTime.nsec = v3;
}

- (NSDictionary)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (ASDTDeviceManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (ASDTDeviceManager *)WeakRetained;
}

- (void)setManager:(id)a3
{
}

- (NSString)deviceUID
{
  return self->_deviceUID;
}

- (void)setDeviceUID:(id)a3
{
}

- (BOOL)deviceIsBuilding
{
  return self->_deviceIsBuilding;
}

- (void)setDeviceIsBuilding:(BOOL)a3
{
  self->_deviceIsBuilding = a3;
}

- (ASDAudioDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BOOL)deviceIsUnderlying
{
  return self->_deviceIsUnderlying;
}

- (void)setDeviceIsUnderlying:(BOOL)a3
{
  self->_deviceIsUnderlying = a3;
}

- (ASDAudioDevice)underlyingDevice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_underlyingDevice);
  return (ASDAudioDevice *)WeakRetained;
}

- (void)setUnderlyingDevice:(id)a3
{
}

- (NSArray)ioServiceDependencies
{
  return self->_ioServiceDependencies;
}

- (void)setIoServiceDependencies:(id)a3
{
}

- (NSString)underlyingDeviceUID
{
  return self->_underlyingDeviceUID;
}

- (void)setUnderlyingDeviceUID:(id)a3
{
}

- (BOOL)didRegisterInterestInUnderlyingDevice
{
  return self->_didRegisterInterestInUnderlyingDevice;
}

- (void)setDidRegisterInterestInUnderlyingDevice:(BOOL)a3
{
  self->_didRegisterInterestInUnderlyingDevice = a3;
}

- (BOOL)ioServiceDependenciesDiscovered
{
  return self->_ioServiceDependenciesDiscovered;
}

- (void)setIoServiceDependenciesDiscovered:(BOOL)a3
{
  self->_ioServiceDependenciesDiscovered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDeviceUID, 0);
  objc_storeStrong((id *)&self->_ioServiceDependencies, 0);
  objc_destroyWeak((id *)&self->_underlyingDevice);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_deviceUID, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_config, 0);
}

- (id).cxx_construct
{
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0x10000;
  return self;
}

+ (void)forDeviceConfig:(uint8_t *)buf withManager:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "Invalid subclass name: %@ (or %@Factory)", buf, 0x16u);
}

- (void)initForDeviceConfig:(os_log_t)log withManager:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "Bad arguments.", v1, 2u);
}

- (void)buildDevice
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2489BC000, log, OS_LOG_TYPE_ERROR, "Failed to create device '%@'.", buf, 0xCu);
}

@end