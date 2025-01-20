@interface IOAccessorySystemStateMonitor
- (BOOL)bootComplete;
- (BOOL)displayEnabled;
- (BOOL)pmUserActive;
- (BOOL)userActive;
- (BOOL)userPresent;
- (IOAccessorySystemStateMonitor)init;
- (IONotificationPort)notificationPort;
- (NSMutableDictionary)endpointMap;
- (OS_dispatch_queue)notificationQueue;
- (int)bootToken;
- (int)displayNotifyToken;
- (unint64_t)pmNotificationHandle;
- (unsigned)discoveryIterator;
- (unsigned)terminationIterator;
- (void)addEndpointForService:(unsigned int)a3;
- (void)dealloc;
- (void)notifyEndpointsBootComplete:(BOOL)a3;
- (void)notifyEndpointsUserActive:(BOOL)a3;
- (void)notifyEndpointsUserPresent:(BOOL)a3;
- (void)processBootState;
- (void)processDisplayState;
- (void)processPMUserActiveState:(unint64_t)a3;
- (void)removeEndpointForService:(unsigned int)a3;
- (void)setBootComplete:(BOOL)a3;
- (void)setBootToken:(int)a3;
- (void)setDiscoveryIterator:(unsigned int)a3;
- (void)setDisplayEnabled:(BOOL)a3;
- (void)setDisplayNotifyToken:(int)a3;
- (void)setEndpointMap:(id)a3;
- (void)setNotificationPort:(IONotificationPort *)a3;
- (void)setNotificationQueue:(id)a3;
- (void)setPmNotificationHandle:(unint64_t)a3;
- (void)setPmUserActive:(BOOL)a3;
- (void)setTerminationIterator:(unsigned int)a3;
- (void)setUserActive:(BOOL)a3;
- (void)setUserPresent:(BOOL)a3;
@end

@implementation IOAccessorySystemStateMonitor

- (IOAccessorySystemStateMonitor)init
{
  v36.receiver = self;
  v36.super_class = (Class)IOAccessorySystemStateMonitor;
  id v2 = [(IOAccessorySystemStateMonitor *)&v36 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.IOAccessoryManager.SystemStateMonitor", 0);
    v4 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v3;

    v5 = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
    *((void *)v2 + 6) = v5;
    IONotificationPortSetDispatchQueue(v5, *((dispatch_queue_t *)v2 + 7));
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v6;

    v8 = (IONotificationPort *)*((void *)v2 + 6);
    CFDictionaryRef v9 = IOServiceMatching("IOAccessoryIDBusSystemStates");
    IOServiceAddMatchingNotification(v8, "IOServiceFirstPublish", v9, (IOServiceMatchingCallback)ProcessPublishedEndpoints, v2, (io_iterator_t *)v2 + 4);
    v10 = (IONotificationPort *)*((void *)v2 + 6);
    CFDictionaryRef v11 = IOServiceMatching("IOAccessoryIDBusSystemStates");
    IOServiceAddMatchingNotification(v10, "IOServiceTerminate", v11, (IOServiceMatchingCallback)ProcessTerminatedEndpoints, v2, (io_iterator_t *)v2 + 5);
    v12 = *((void *)v2 + 7);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__IOAccessorySystemStateMonitor_init__block_invoke;
    block[3] = &unk_1E6B6D688;
    id v13 = v2;
    id v35 = v13;
    dispatch_sync(v12, block);
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    v31 = __37__IOAccessorySystemStateMonitor_init__block_invoke_2;
    v32 = &unk_1E6B6D8F8;
    v14 = (int *)v13;
    v33 = v14;
    *((void *)v14 + 5) = IOPMScheduleUserActivityLevelNotificationWithTimeout();
    v15 = v14 + 6;
    v16 = *((void *)v2 + 7);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __37__IOAccessorySystemStateMonitor_init__block_invoke_3;
    handler[3] = &unk_1E6B6D920;
    v17 = v14;
    v28 = v17;
    notify_register_dispatch("com.apple.RealitySimulation.DisplayRevealFirstBoot", v15, v16, handler);
    v18 = v17 + 7;
    v19 = *((void *)v2 + 7);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __37__IOAccessorySystemStateMonitor_init__block_invoke_4;
    v25[3] = &unk_1E6B6D920;
    v20 = v17;
    v26 = v20;
    notify_register_dispatch("com.apple.iokit.hid.displayStatus", v18, v19, v25);
    v21 = *((void *)v2 + 7);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __37__IOAccessorySystemStateMonitor_init__block_invoke_5;
    v23[3] = &unk_1E6B6D688;
    v24 = v20;
    dispatch_sync(v21, v23);
  }
  return (IOAccessorySystemStateMonitor *)v2;
}

uint64_t __37__IOAccessorySystemStateMonitor_init__block_invoke(uint64_t a1)
{
  ProcessPublishedEndpoints(*(void **)(a1 + 32), *(_DWORD *)(*(void *)(a1 + 32) + 16));
  id v2 = *(_DWORD **)(a1 + 32);
  io_iterator_t v3 = v2[5];
  return ProcessTerminatedEndpoints(v2, v3);
}

uint64_t __37__IOAccessorySystemStateMonitor_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processPMUserActiveState:a2];
}

uint64_t __37__IOAccessorySystemStateMonitor_init__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) processBootState];
}

uint64_t __37__IOAccessorySystemStateMonitor_init__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) processDisplayState];
}

uint64_t __37__IOAccessorySystemStateMonitor_init__block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) processDisplayState];
  id v2 = *(void **)(a1 + 32);
  return [v2 processBootState];
}

- (void)dealloc
{
  if (self->_pmNotificationHandle)
  {
    IOPMUnregisterNotification();
    self->_pmNotificationHandle = 0;
  }
  int displayNotifyToken = self->_displayNotifyToken;
  if (displayNotifyToken)
  {
    notify_cancel(displayNotifyToken);
    self->_int displayNotifyToken = 0;
  }
  io_object_t discoveryIterator = self->_discoveryIterator;
  if (discoveryIterator)
  {
    IOObjectRelease(discoveryIterator);
    self->_io_object_t discoveryIterator = 0;
  }
  io_object_t terminationIterator = self->_terminationIterator;
  if (terminationIterator)
  {
    IOObjectRelease(terminationIterator);
    self->_io_object_t terminationIterator = 0;
  }
  notificationPort = self->_notificationPort;
  if (notificationPort)
  {
    IONotificationPortDestroy(notificationPort);
    self->_notificationPort = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)IOAccessorySystemStateMonitor;
  [(IOAccessorySystemStateMonitor *)&v7 dealloc];
}

- (void)addEndpointForService:(unsigned int)a3
{
  kern_return_t RegistryEntryID;
  mach_error_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableDictionary *endpointMap;
  void *v24;
  void *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  IOAccessorySystemStateEndpoint *v34;
  IOAccessorySystemStateEndpoint *v35;
  NSMutableDictionary *v36;
  void *v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t entryID;

  if (a3)
  {
    uint64_t v3 = *(void *)&a3;
    if (IOObjectConformsTo(a3, "IOAccessoryIDBusSystemStates"))
    {
      entryID = 0;
      RegistryEntryID = IORegistryEntryGetRegistryEntryID(v3, &entryID);
      if (RegistryEntryID)
      {
        uint64_t v6 = RegistryEntryID;
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          -[IOAccessorySystemStateMonitor addEndpointForService:].cold.5(v6);
        }
      }
      else
      {
        endpointMap = self->_endpointMap;
        v24 = [NSNumber numberWithUnsignedLongLong:entryID];
        v25 = [(NSMutableDictionary *)endpointMap objectForKeyedSubscript:v24];

        if (v25)
        {
          v26 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
          if (v26) {
            -[IOAccessorySystemStateMonitor addEndpointForService:].cold.4(v26, v27, v28, v29, v30, v31, v32, v33);
          }
        }
        else
        {
          v34 = [[IOAccessorySystemStateEndpoint alloc] initWithService:v3];
          id v35 = v34;
          if (v34)
          {
            if (self->_userActive) {
              [(IOAccessorySystemStateEndpoint *)v34 notifyUserActive:1];
            }
            if (self->_userPresent) {
              [(IOAccessorySystemStateEndpoint *)v35 notifyUserPresent:1];
            }
            if (self->_bootComplete) {
              [(IOAccessorySystemStateEndpoint *)v35 notifyBootComplete];
            }
            objc_super v36 = self->_endpointMap;
            v37 = [NSNumber numberWithUnsignedLongLong:entryID];
            [(NSMutableDictionary *)v36 setObject:v35 forKeyedSubscript:v37];
          }
          else
          {
            v38 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
            if (v38) {
              -[IOAccessorySystemStateMonitor addEndpointForService:](v38, v39, v40, v41, v42, v43, v44, v45);
            }
          }
        }
      }
    }
    else
    {
      v15 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
      if (v15) {
        -[IOAccessorySystemStateMonitor addEndpointForService:](v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
  else
  {
    objc_super v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v7) {
      -[IOAccessorySystemStateMonitor addEndpointForService:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (void)removeEndpointForService:(unsigned int)a3
{
  if (a3)
  {
    uint64_t entryID = 0;
    if (!IORegistryEntryGetRegistryEntryID(a3, &entryID))
    {
      endpointMap = self->_endpointMap;
      v5 = [NSNumber numberWithUnsignedLongLong:entryID];
      [(NSMutableDictionary *)endpointMap setObject:0 forKeyedSubscript:v5];
    }
  }
}

- (void)processDisplayState
{
  uint64_t state64 = 0;
  notify_get_state(self->_displayNotifyToken, &state64);
  [(IOAccessorySystemStateMonitor *)self notifyEndpointsUserPresent:state64 != 0];
}

- (void)processBootState
{
  uint64_t state64 = 0;
  notify_get_state(self->_bootToken, &state64);
  [(IOAccessorySystemStateMonitor *)self notifyEndpointsBootComplete:state64 != 0];
}

- (void)processPMUserActiveState:(unint64_t)a3
{
  [(IOAccessorySystemStateMonitor *)self notifyEndpointsUserActive:(a3 & 5) != 0];
}

- (void)notifyEndpointsBootComplete:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(NSMutableDictionary *)self->_endpointMap count];
      *(_DWORD *)buf = 136315394;
      v17 = "-[IOAccessorySystemStateMonitor notifyEndpointsBootComplete:]";
      __int16 v18 = 2048;
      uint64_t v19 = v4;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s boot completed notifying %lu endpoints", buf, 0x16u);
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    v5 = self->_endpointMap;
    uint64_t v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v11 + 1) + 8 * v9), (void)v11);
          [v10 notifyBootComplete];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    self->_bootComplete = 1;
  }
}

- (void)notifyEndpointsUserActive:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_userActive != a3)
  {
    BOOL v3 = a3;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      BOOL userActive = self->_userActive;
      uint64_t v6 = [(NSMutableDictionary *)self->_endpointMap count];
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = "-[IOAccessorySystemStateMonitor notifyEndpointsUserActive:]";
      __int16 v20 = 1024;
      BOOL v21 = userActive;
      __int16 v22 = 1024;
      BOOL v23 = v3;
      __int16 v24 = 2048;
      uint64_t v25 = v6;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s user active changed %d->%d notifying %lu endpoints", buf, 0x22u);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = self->_endpointMap;
    uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
          [v12 notifyUserActive:v3];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    self->_BOOL userActive = v3;
  }
}

- (void)notifyEndpointsUserPresent:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (self->_userPresent != a3)
  {
    BOOL v3 = a3;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      BOOL userPresent = self->_userPresent;
      uint64_t v6 = [(NSMutableDictionary *)self->_endpointMap count];
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = "-[IOAccessorySystemStateMonitor notifyEndpointsUserPresent:]";
      __int16 v20 = 1024;
      BOOL v21 = userPresent;
      __int16 v22 = 1024;
      BOOL v23 = v3;
      __int16 v24 = 2048;
      uint64_t v25 = v6;
      _os_log_impl(&dword_1D9622000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s user present changed %d->%d notifying %lu endpoints", buf, 0x22u);
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v7 = self->_endpointMap;
    uint64_t v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_endpointMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v13 + 1) + 8 * v11), (void)v13);
          [v12 notifyUserPresent:v3];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    self->_BOOL userPresent = v3;
  }
}

- (NSMutableDictionary)endpointMap
{
  return self->_endpointMap;
}

- (void)setEndpointMap:(id)a3
{
}

- (unint64_t)pmNotificationHandle
{
  return self->_pmNotificationHandle;
}

- (void)setPmNotificationHandle:(unint64_t)a3
{
  self->_pmNotificationHandle = a3;
}

- (IONotificationPort)notificationPort
{
  return self->_notificationPort;
}

- (void)setNotificationPort:(IONotificationPort *)a3
{
  self->_notificationPort = a3;
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
}

- (unsigned)discoveryIterator
{
  return self->_discoveryIterator;
}

- (void)setDiscoveryIterator:(unsigned int)a3
{
  self->_io_object_t discoveryIterator = a3;
}

- (unsigned)terminationIterator
{
  return self->_terminationIterator;
}

- (void)setTerminationIterator:(unsigned int)a3
{
  self->_io_object_t terminationIterator = a3;
}

- (int)bootToken
{
  return self->_bootToken;
}

- (void)setBootToken:(int)a3
{
  self->_bootToken = a3;
}

- (int)displayNotifyToken
{
  return self->_displayNotifyToken;
}

- (void)setDisplayNotifyToken:(int)a3
{
  self->_int displayNotifyToken = a3;
}

- (BOOL)bootComplete
{
  return self->_bootComplete;
}

- (void)setBootComplete:(BOOL)a3
{
  self->_bootComplete = a3;
}

- (BOOL)displayEnabled
{
  return self->_displayEnabled;
}

- (void)setDisplayEnabled:(BOOL)a3
{
  self->_displayEnabled = a3;
}

- (BOOL)pmUserActive
{
  return self->_pmUserActive;
}

- (void)setPmUserActive:(BOOL)a3
{
  self->_pmUserActive = a3;
}

- (BOOL)userActive
{
  return self->_userActive;
}

- (void)setUserActive:(BOOL)a3
{
  self->_BOOL userActive = a3;
}

- (BOOL)userPresent
{
  return self->_userPresent;
}

- (void)setUserPresent:(BOOL)a3
{
  self->_BOOL userPresent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_endpointMap, 0);
}

- (void)addEndpointForService:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addEndpointForService:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addEndpointForService:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addEndpointForService:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)addEndpointForService:(mach_error_t)a1 .cold.5(mach_error_t a1)
{
  mach_error_string(a1);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_1D9622000, MEMORY[0x1E4F14500], v1, "%s unable to read registry entry id (%s)", v2, v3, v4, v5, 2u);
}

@end