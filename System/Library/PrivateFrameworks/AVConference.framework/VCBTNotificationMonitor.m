@interface VCBTNotificationMonitor
+ (id)sharedInstance;
- (VCBTNotificationMonitor)init;
- (int)registerBTNotificationHandler:(id)a3;
- (void)dealloc;
- (void)processBTNotification:(id *)a3;
- (void)registerDarwinNotification:(id)a3;
- (void)registerForBluetoothImmediateNotifications;
- (void)setupBTEventHandler;
- (void)unregisterAllBTNotificationHandlers;
- (void)unregisterBTNotificationHandler:(int)a3;
- (void)unregisterBluetoothImmediateNotifications;
- (void)unregisterDarwinNotification:(id)a3;
@end

@implementation VCBTNotificationMonitor

- (VCBTNotificationMonitor)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCBTNotificationMonitor;
  v2 = [(VCBTNotificationMonitor *)&v4 init];
  if (v2)
  {
    v2->_handlerArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(VCBTNotificationMonitor *)v2 registerForBluetoothImmediateNotifications];
    [(VCBTNotificationMonitor *)v2 setupBTEventHandler];
    v2->_btNotificationHandlerLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9 != -1) {
    dispatch_once(&sharedInstance_onceToken_9, &__block_literal_global_49);
  }
  return (id)sharedInstance_sharedInstance;
}

VCBTNotificationMonitor *__41__VCBTNotificationMonitor_sharedInstance__block_invoke()
{
  result = objc_alloc_init(VCBTNotificationMonitor);
  sharedInstance_sharedInstance = (uint64_t)result;
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  [(VCBTNotificationMonitor *)self unregisterBluetoothImmediateNotifications];
  v3.receiver = self;
  v3.super_class = (Class)VCBTNotificationMonitor;
  [(VCBTNotificationMonitor *)&v3 dealloc];
}

- (int)registerBTNotificationHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_btNotificationHandlerLock = &self->_btNotificationHandlerLock;
  os_unfair_lock_lock(&self->_btNotificationHandlerLock);
  int v6 = [(NSMutableArray *)self->_handlerArray count];
  [(NSMutableArray *)self->_handlerArray addObject:_Block_copy(a3)];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316162;
      uint64_t v11 = v7;
      __int16 v12 = 2080;
      v13 = "-[VCBTNotificationMonitor registerBTNotificationHandler:]";
      __int16 v14 = 1024;
      int v15 = 65;
      __int16 v16 = 2048;
      id v17 = a3;
      __int16 v18 = 1024;
      int v19 = v6;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Registered handler[%p] with index=%d", (uint8_t *)&v10, 0x2Cu);
    }
  }
  os_unfair_lock_unlock(p_btNotificationHandlerLock);
  return v6;
}

- (void)unregisterBTNotificationHandler:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_btNotificationHandlerLock = &self->_btNotificationHandlerLock;
  os_unfair_lock_lock(&self->_btNotificationHandlerLock);
  if (a3 < 0 || (int)[(NSMutableArray *)self->_handlerArray count] <= a3)
  {
    os_unfair_lock_unlock(p_btNotificationHandlerLock);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315906;
        uint64_t v9 = v6;
        __int16 v10 = 2080;
        uint64_t v11 = "-[VCBTNotificationMonitor unregisterBTNotificationHandler:]";
        __int16 v12 = 1024;
        int v13 = 76;
        __int16 v14 = 1024;
        int v15 = a3;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unregistered handler with index=%d", (uint8_t *)&v8, 0x22u);
      }
    }
    _Block_release((const void *)[(NSMutableArray *)self->_handlerArray objectAtIndexedSubscript:a3]);
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_handlerArray, "replaceObjectAtIndex:withObject:", a3, [MEMORY[0x1E4F1CA98] null]);
    os_unfair_lock_unlock(p_btNotificationHandlerLock);
  }
}

- (void)unregisterAllBTNotificationHandlers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  p_btNotificationHandlerLock = &self->_btNotificationHandlerLock;
  os_unfair_lock_lock(&self->_btNotificationHandlerLock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  handlerArray = self->_handlerArray;
  uint64_t v5 = [(NSMutableArray *)handlerArray countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(handlerArray);
        }
        _Block_release(*(const void **)(*((void *)&v10 + 1) + 8 * i));
      }
      uint64_t v6 = [(NSMutableArray *)handlerArray countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
  [(NSMutableArray *)self->_handlerArray removeAllObjects];
  os_unfair_lock_unlock(p_btNotificationHandlerLock);
}

- (void)setupBTEventHandler
{
  v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:self];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__VCBTNotificationMonitor_setupBTEventHandler__block_invoke;
  v3[3] = &unk_1E6DB79C0;
  v3[4] = v2;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x1E4F14428], v3);
}

void __46__VCBTNotificationMonitor_setupBTEventHandler__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  string = xpc_dictionary_get_string(xdict, "XPCEventName");
  v20[0] = string;
  uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "_State");
  v20[1] = uint64;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v22 = v6;
      __int16 v23 = 2080;
      v24 = "-[VCBTNotificationMonitor setupBTEventHandler]_block_invoke";
      __int16 v25 = 1024;
      int v26 = 102;
      __int16 v27 = 2080;
      v28 = (void *)string;
      __int16 v29 = 2048;
      uint64_t v30 = uint64;
      __int16 v31 = 1024;
      int v32 = HIWORD(uint64) & 1;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Received notifyd.matching event %s state %llu isPairing %d", buf, 0x36u);
    }
  }
  int v8 = (void *)[NSString stringWithUTF8String:string];
  if ([v8 isEqualToString:@"com.apple.bluetooth.pairing"]) {
    BOOL v9 = (uint64 & 0x1000000000000) == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9
    || (([v8 isEqualToString:@"com.apple.bluetooth.outgoing-classic-connection-state"] & 1) != 0
     || [v8 isEqualToString:@"com.apple.bluetooth.settings.app-state"])
    && uint64 < 2
    || [v8 isEqualToString:@"com.apple.bluetooth.outgoing-le-fast-scan-level"])
  {
    int v19 = 0;
    char v18 = 0;
    BOOL v10 = +[VCWiFiUtils getInfraChannelNumber:&v19 is5Ghz:&v18];
    int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
    if (v10)
    {
      if (ErrorLogLevelForModule >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        long long v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          if (v18) {
            uint64_t v14 = @"5GHz WLAN";
          }
          else {
            uint64_t v14 = @"2.4GHz WLAN";
          }
          uint64_t v22 = v12;
          __int16 v23 = 2080;
          v24 = "-[VCBTNotificationMonitor setupBTEventHandler]_block_invoke";
          __int16 v25 = 1024;
          int v26 = 113;
          __int16 v27 = 2112;
          v28 = v14;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d BT event received while device is on band=%@", buf, 0x26u);
        }
      }
      if (!v18)
      {
        int v15 = (void *)MEMORY[0x1E4E56580]([*(id *)(a1 + 32) weak]);
        [v15 processBTNotification:v20];
        if (v15) {
          CFRelease(v15);
        }
      }
    }
    else if (ErrorLogLevelForModule >= 3)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      id v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __46__VCBTNotificationMonitor_setupBTEventHandler__block_invoke_cold_1(v16, v17);
      }
    }
  }
}

- (void)processBTNotification:(id *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_btNotificationHandlerLock = &self->_btNotificationHandlerLock;
  os_unfair_lock_lock(&self->_btNotificationHandlerLock);
  uint64_t v6 = (void *)[(NSMutableArray *)self->_handlerArray copy];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            (*(void (**)(uint64_t, $BE749665CD263385F3F5ED554982D87D *))(v11 + 16))(v11, a3);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_btNotificationHandlerLock);
}

- (void)registerDarwinNotification:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (const char *)[a3 cStringUsingEncoding:4];
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "Notification", v4);
  xpc_set_event();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315906;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      uint64_t v11 = "-[VCBTNotificationMonitor registerDarwinNotification:]";
      __int16 v12 = 1024;
      int v13 = 140;
      __int16 v14 = 2112;
      id v15 = a3;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Register for Darwin %@", (uint8_t *)&v8, 0x26u);
    }
  }
  xpc_release(v5);
}

- (void)unregisterDarwinNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [a3 cStringUsingEncoding:4];
  xpc_set_event();
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    xpc_object_t v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315906;
      uint64_t v7 = v4;
      __int16 v8 = 2080;
      uint64_t v9 = "-[VCBTNotificationMonitor unregisterDarwinNotification:]";
      __int16 v10 = 1024;
      int v11 = 147;
      __int16 v12 = 2112;
      id v13 = a3;
      _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unregister for Darwin %@", (uint8_t *)&v6, 0x26u);
    }
  }
}

- (void)registerForBluetoothImmediateNotifications
{
  [(VCBTNotificationMonitor *)self registerDarwinNotification:@"com.apple.bluetooth.pairing"];
  [(VCBTNotificationMonitor *)self registerDarwinNotification:@"com.apple.bluetooth.outgoing-classic-connection-state"];
  [(VCBTNotificationMonitor *)self registerDarwinNotification:@"com.apple.bluetooth.settings.app-state"];

  [(VCBTNotificationMonitor *)self registerDarwinNotification:@"com.apple.bluetooth.outgoing-le-fast-scan-level"];
}

- (void)unregisterBluetoothImmediateNotifications
{
  [(VCBTNotificationMonitor *)self unregisterDarwinNotification:@"com.apple.bluetooth.pairing"];
  [(VCBTNotificationMonitor *)self unregisterDarwinNotification:@"com.apple.bluetooth.outgoing-classic-connection-state"];
  [(VCBTNotificationMonitor *)self unregisterDarwinNotification:@"com.apple.bluetooth.settings.app-state"];

  [(VCBTNotificationMonitor *)self unregisterDarwinNotification:@"com.apple.bluetooth.outgoing-le-fast-scan-level"];
}

void __46__VCBTNotificationMonitor_setupBTEventHandler__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  xpc_object_t v5 = "-[VCBTNotificationMonitor setupBTEventHandler]_block_invoke";
  __int16 v6 = 1024;
  int v7 = 110;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCWiFiUtils getInfraChannelNumber() failed!", (uint8_t *)&v2, 0x1Cu);
}

@end