@interface AccessoryUSBBillboardDeviceManager
+ (BOOL)vidpidRequiresNotSupportedPrompt:(unsigned int)a3;
+ (id)sharedManager;
- (AccessoryUSBBillboardDeviceManager)init;
- (BOOL)isStartedDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4;
- (BOOL)startDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4;
- (BOOL)stopDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4;
- (OS_dispatch_queue)accessoryUSBBillboardDeviceListenerQueue;
- (id)copyDetectedBillboardDevices;
- (void)AppleUSBHostBillboardDeviceServiceArrived:(unsigned int)a3 vidpid:(unsigned int)a4;
- (void)AppleUSBHostBillboardDeviceServiceTerminated:(unsigned int)a3 vidpid:(unsigned int)a4;
- (void)dealloc;
- (void)stopDetectUSBBillboardDeviceAll;
@end

@implementation AccessoryUSBBillboardDeviceManager

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__AccessoryUSBBillboardDeviceManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, block);
  }
  v2 = (void *)sharedManager_sharedInstance;
  return v2;
}

uint64_t __51__AccessoryUSBBillboardDeviceManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (AccessoryUSBBillboardDeviceManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)AccessoryUSBBillboardDeviceManager;
  v2 = [(AccessoryUSBBillboardDeviceManager *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    usbBillboardDeviceListeners = v2->_usbBillboardDeviceListeners;
    v2->_usbBillboardDeviceListeners = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    detectedBillboardDevices = v2->_detectedBillboardDevices;
    v2->_detectedBillboardDevices = v5;
  }
  return v2;
}

- (void)dealloc
{
  [(AccessoryUSBBillboardDeviceManager *)self stopDetectUSBBillboardDeviceAll];
  v3.receiver = self;
  v3.super_class = (Class)AccessoryUSBBillboardDeviceManager;
  [(AccessoryUSBBillboardDeviceManager *)&v3 dealloc];
}

- (id)copyDetectedBillboardDevices
{
  objc_super v3 = self->_detectedBillboardDevices;
  objc_sync_enter(v3);
  if ([(NSMutableDictionary *)self->_detectedBillboardDevices count])
  {
    v4 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_detectedBillboardDevices];
  }
  else
  {
    v4 = 0;
  }
  objc_sync_exit(v3);

  return v4;
}

- (void)AppleUSBHostBillboardDeviceServiceArrived:(unsigned int)a3 vidpid:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  unsigned int v7 = +[AccessoryUSBBillboardDevice parentServiceVidPid:](AccessoryUSBBillboardDevice, "parentServiceVidPid:");
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 1;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    v10 = MEMORY[0x263EF8438];
    id v9 = MEMORY[0x263EF8438];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315906;
    v21 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceArrived:vidpid:]";
    __int16 v22 = 1024;
    int v23 = v5;
    __int16 v24 = 1024;
    *(_DWORD *)v25 = v7;
    *(_WORD *)&v25[4] = 1024;
    *(_DWORD *)&v25[6] = v4;
    _os_log_impl(&dword_222C74000, v10, OS_LOG_TYPE_INFO, "%s: service %d (0x%x), vidpid 0x%X", (uint8_t *)&v20, 0x1Eu);
  }

  if (v7 == v4
    && +[AccessoryUSBBillboardDeviceManager vidpidRequiresNotSupportedPrompt:v4])
  {
    unint64_t v11 = +[AccessoryUSBBillboardDevice getRegistryEntryIDFromService:v5];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      v12 = MEMORY[0x263EF8438];
      id v13 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136316162;
      v21 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceArrived:vidpid:]";
      __int16 v22 = 1024;
      int v23 = v5;
      __int16 v24 = 1024;
      *(_DWORD *)v25 = v4;
      *(_WORD *)&v25[4] = 2048;
      *(void *)&v25[6] = v11;
      __int16 v26 = 1024;
      int v27 = v4;
      _os_log_impl(&dword_222C74000, v12, OS_LOG_TYPE_DEFAULT, "%s: service %d (0x%x), registryID 0x%llx, vidpid 0x%X", (uint8_t *)&v20, 0x28u);
    }

    if (v11)
    {
      v14 = self->_detectedBillboardDevices;
      objc_sync_enter(v14);
      v15 = [NSNumber numberWithUnsignedLongLong:v11];
      v16 = [(NSMutableDictionary *)self->_detectedBillboardDevices objectForKey:v15];
      if (v16)
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v17 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
          }
          v17 = MEMORY[0x263EF8438];
          id v18 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136315650;
          v21 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceArrived:vidpid:]";
          __int16 v22 = 1024;
          int v23 = v4;
          __int16 v24 = 2048;
          *(void *)v25 = v11;
          _os_log_impl(&dword_222C74000, v17, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, Already seen device for registryID 0x%llx", (uint8_t *)&v20, 0x1Cu);
        }
      }
      else
      {
        v16 = [[AccessoryUSBBillboardDevice alloc] initWithService:v5];
        [(NSMutableDictionary *)self->_detectedBillboardDevices setObject:v16 forKey:v15];
      }

      objc_sync_exit(v14);
      if (v16)
      {
        [(AccessoryUSBBillboardDevice *)v16 presentNotSupportNotification];
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v16 = (AccessoryUSBBillboardDevice *)*(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
          }
          v16 = (AccessoryUSBBillboardDevice *)MEMORY[0x263EF8438];
          id v19 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136315650;
          v21 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceArrived:vidpid:]";
          __int16 v22 = 1024;
          int v23 = v4;
          __int16 v24 = 2048;
          *(void *)v25 = v11;
          _os_log_impl(&dword_222C74000, &v16->super, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, Failed to create device for registryID 0x%llx", (uint8_t *)&v20, 0x1Cu);
        }
      }
    }
  }
}

- (void)AppleUSBHostBillboardDeviceServiceTerminated:(unsigned int)a3 vidpid:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    id v9 = MEMORY[0x263EF8438];
    id v8 = MEMORY[0x263EF8438];
  }
  else
  {
    id v9 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315650;
    id v18 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceTerminated:vidpid:]";
    __int16 v19 = 1024;
    int v20 = v5;
    __int16 v21 = 1024;
    LODWORD(v22) = v4;
    _os_log_impl(&dword_222C74000, v9, OS_LOG_TYPE_INFO, "%s: service %d, vidpid 0x%X", (uint8_t *)&v17, 0x18u);
  }

  if (+[AccessoryUSBBillboardDeviceManager vidpidRequiresNotSupportedPrompt:v4])
  {
    unint64_t v10 = +[AccessoryUSBBillboardDevice getRegistryEntryIDFromService:v5];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      unint64_t v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      unint64_t v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315906;
      id v18 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceTerminated:vidpid:]";
      __int16 v19 = 1024;
      int v20 = v5;
      __int16 v21 = 2048;
      unint64_t v22 = v10;
      __int16 v23 = 1024;
      int v24 = v4;
      _os_log_impl(&dword_222C74000, v11, OS_LOG_TYPE_DEFAULT, "%s: service %d, registryID 0x%llx, vidpid 0x%X", (uint8_t *)&v17, 0x22u);
    }

    if (v10)
    {
      id v13 = self->_detectedBillboardDevices;
      objc_sync_enter(v13);
      v14 = [NSNumber numberWithUnsignedLongLong:v10];
      v15 = [(NSMutableDictionary *)self->_detectedBillboardDevices objectForKey:v14];

      objc_sync_exit(v13);
      if (v15)
      {
        [v15 dismissNotSupportNotification];
      }
      else
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v15 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
            -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
          }
          v15 = MEMORY[0x263EF8438];
          id v16 = MEMORY[0x263EF8438];
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 136315650;
          id v18 = "-[AccessoryUSBBillboardDeviceManager AppleUSBHostBillboardDeviceServiceTerminated:vidpid:]";
          __int16 v19 = 1024;
          int v20 = v4;
          __int16 v21 = 2048;
          unint64_t v22 = v10;
          _os_log_impl(&dword_222C74000, v15, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, Failed to find device for registryID 0x%llx", (uint8_t *)&v17, 0x1Cu);
        }
      }
    }
  }
}

- (BOOL)startDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v7 = a4 | (a3 << 16);
  id v8 = [NSNumber numberWithUnsignedLong:v7];
  id v9 = self->_usbBillboardDeviceListeners;
  objc_sync_enter(v9);
  unint64_t v10 = [(NSMutableDictionary *)self->_usbBillboardDeviceListeners objectForKey:v8];
  if (!v10)
  {
    unint64_t v10 = [[AccessoryUSBBillboardDeviceListener alloc] initWithVID:v5 PID:v4];
    if (gLogObjects && gNumLogObjects >= 1)
    {
      unint64_t v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      unint64_t v11 = MEMORY[0x263EF8438];
      id v12 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315650;
      v30 = "-[AccessoryUSBBillboardDeviceManager startDetectUSBBillboardDeviceWithVID:PID:]";
      __int16 v31 = 1024;
      int v32 = v7;
      __int16 v33 = 2112;
      v34 = v10;
      _os_log_impl(&dword_222C74000, v11, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, add listener, %@", (uint8_t *)&v29, 0x1Cu);
    }

    [(NSMutableDictionary *)self->_usbBillboardDeviceListeners setObject:v10 forKey:v8];
    if (!v10)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        id v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        id v16 = MEMORY[0x263EF8438];
        id v21 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceManager startDetectUSBBillboardDeviceWithVID:PID:](v7, v16, v22, v23, v24, v25, v26, v27);
      }
      unint64_t v10 = 0;
      goto LABEL_42;
    }
  }
  BOOL v13 = [(AccessoryUSBBillboardDeviceListener *)v10 started];
  if (gLogObjects) {
    BOOL v14 = gNumLogObjects <= 0;
  }
  else {
    BOOL v14 = 1;
  }
  int v15 = !v14;
  if (v13)
  {
    if (v15)
    {
      id v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      id v16 = MEMORY[0x263EF8438];
      id v18 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136315650;
      v30 = "-[AccessoryUSBBillboardDeviceManager startDetectUSBBillboardDeviceWithVID:PID:]";
      __int16 v31 = 1024;
      int v32 = v7;
      __int16 v33 = 2112;
      v34 = v10;
      _os_log_impl(&dword_222C74000, v16, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, listener already started, %@", (uint8_t *)&v29, 0x1Cu);
    }
LABEL_42:

    BOOL v20 = 0;
    goto LABEL_43;
  }
  if (v15)
  {
    int v17 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
    }
    int v17 = MEMORY[0x263EF8438];
    id v19 = MEMORY[0x263EF8438];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 136315650;
    v30 = "-[AccessoryUSBBillboardDeviceManager startDetectUSBBillboardDeviceWithVID:PID:]";
    __int16 v31 = 1024;
    int v32 = v7;
    __int16 v33 = 2112;
    v34 = v10;
    _os_log_impl(&dword_222C74000, v17, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, start listener, %@", (uint8_t *)&v29, 0x1Cu);
  }

  [(AccessoryUSBBillboardDeviceListener *)v10 startDetectUSBBillboardDevice];
  BOOL v20 = 1;
LABEL_43:

  objc_sync_exit(v9);
  return v20;
}

- (BOOL)stopDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unsigned int v5 = a4 | (a3 << 16);
  v6 = [NSNumber numberWithUnsignedLong:v5];
  uint64_t v7 = self->_usbBillboardDeviceListeners;
  objc_sync_enter(v7);
  id v8 = [(NSMutableDictionary *)self->_usbBillboardDeviceListeners objectForKey:v6];
  id v9 = v8;
  if (v8)
  {
    int v10 = [v8 started];
    BOOL v11 = v10;
    if (gLogObjects) {
      BOOL v12 = gNumLogObjects <= 0;
    }
    else {
      BOOL v12 = 1;
    }
    int v13 = !v12;
    if (v10)
    {
      if (v13)
      {
        BOOL v14 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        BOOL v14 = MEMORY[0x263EF8438];
        id v18 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315650;
        uint64_t v24 = "-[AccessoryUSBBillboardDeviceManager stopDetectUSBBillboardDeviceWithVID:PID:]";
        __int16 v25 = 1024;
        unsigned int v26 = v5;
        __int16 v27 = 2112;
        uint64_t v28 = v9;
        _os_log_impl(&dword_222C74000, v14, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, stop listener, %@", (uint8_t *)&v23, 0x1Cu);
      }

      [v9 stopDetectUSBBillboardDevice];
    }
    else
    {
      if (v13)
      {
        id v16 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
          -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
        }
        id v16 = MEMORY[0x263EF8438];
        id v19 = MEMORY[0x263EF8438];
      }
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136315650;
        uint64_t v24 = "-[AccessoryUSBBillboardDeviceManager stopDetectUSBBillboardDeviceWithVID:PID:]";
        __int16 v25 = 1024;
        unsigned int v26 = v5;
        __int16 v27 = 2112;
        uint64_t v28 = v9;
        _os_log_impl(&dword_222C74000, v16, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, listener already stopped, %@", (uint8_t *)&v23, 0x1Cu);
      }
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      BOOL v20 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      BOOL v20 = MEMORY[0x263EF8438];
      id v21 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315650;
      uint64_t v24 = "-[AccessoryUSBBillboardDeviceManager stopDetectUSBBillboardDeviceWithVID:PID:]";
      __int16 v25 = 1024;
      unsigned int v26 = v5;
      __int16 v27 = 2112;
      uint64_t v28 = v9;
      _os_log_impl(&dword_222C74000, v20, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, remove listener, %@", (uint8_t *)&v23, 0x1Cu);
    }

    [(NSMutableDictionary *)self->_usbBillboardDeviceListeners removeObjectForKey:v6];
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      int v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice]();
      }
      int v15 = MEMORY[0x263EF8438];
      id v17 = MEMORY[0x263EF8438];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 136315394;
      uint64_t v24 = "-[AccessoryUSBBillboardDeviceManager stopDetectUSBBillboardDeviceWithVID:PID:]";
      __int16 v25 = 1024;
      unsigned int v26 = v5;
      _os_log_impl(&dword_222C74000, v15, OS_LOG_TYPE_DEFAULT, "%s: vidpid 0x%X, Failed to find listener!!!", (uint8_t *)&v23, 0x12u);
    }

    BOOL v11 = 0;
  }

  objc_sync_exit(v7);
  return v11;
}

- (void)stopDetectUSBBillboardDeviceAll
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  objc_super v3 = self->_usbBillboardDeviceListeners;
  objc_sync_enter(v3);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_usbBillboardDeviceListeners allValues];
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
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) stopDetectUSBBillboardDevice];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->_usbBillboardDeviceListeners removeAllObjects];
  objc_sync_exit(v3);
}

- (BOOL)isStartedDetectUSBBillboardDeviceWithVID:(unsigned __int16)a3 PID:(unsigned __int16)a4
{
  uint64_t v5 = [NSNumber numberWithUnsignedLong:a4 | ((unint64_t)a3 << 16)];
  uint64_t v6 = self->_usbBillboardDeviceListeners;
  objc_sync_enter(v6);
  uint64_t v7 = [(NSMutableDictionary *)self->_usbBillboardDeviceListeners objectForKey:v5];
  long long v8 = v7;
  if (v7) {
    char v9 = [v7 started];
  }
  else {
    char v9 = 0;
  }

  objc_sync_exit(v6);
  return v9;
}

+ (BOOL)vidpidRequiresNotSupportedPrompt:(unsigned int)a3
{
  return a3 >> 1 == 47582088;
}

- (OS_dispatch_queue)accessoryUSBBillboardDeviceListenerQueue
{
  return self->_accessoryUSBBillboardDeviceListenerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUSBBillboardDeviceListenerQueue, 0);
  objc_storeStrong((id *)&self->_detectedBillboardDevices, 0);
  objc_storeStrong((id *)&self->_usbBillboardDeviceListeners, 0);
}

- (void)startDetectUSBBillboardDeviceWithVID:(uint64_t)a3 PID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end