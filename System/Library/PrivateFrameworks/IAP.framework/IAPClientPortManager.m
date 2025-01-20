@interface IAPClientPortManager
+ (id)sharedInstance;
- (BOOL)iaptransportdIsRunning;
- (IAPClientPortManager)init;
- (int)forwardAccessoryDataToIAP:(id)a3 data:(const char *)a4 length:(unsigned __int16)a5;
- (int)registerSendDataHandler:(id)a3 queue:(id)a4 sendBlock:(id)a5;
- (int)unregisterSendDataHandler:(id)a3;
- (void)dealloc;
- (void)reRegisterHandlers;
- (void)sendData:(id)a3 data:(char *)a4 length:(unsigned __int16)a5;
- (void)setIaptransportdIsRunning:(BOOL)a3;
@end

@implementation IAPClientPortManager

- (IAPClientPortManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)IAPClientPortManager;
  v2 = [(IAPClientPortManager *)&v6 init];
  if (v2)
  {
    v2->_portList = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_iaptransportdIsRunning = iaptransportdHasLaunched();
    v2->_portListQueue = (OS_dispatch_queue *)dispatch_queue_create("IAPClientPortManagerQueue", 0);
    v2->_iaptransportdXPCConnection = 0;
    v2->_iaptransportdXPCConnection = (OS_xpc_object *)RetainConnectionToIAPTransportDaemon();
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)__iaptransportdDied, @"kIAPTransportServerDiedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)__iaptransportdLaunched, @"kIAPTransportServerLaunchedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterRemoveObserver(LocalCenter, 0, @"kIAPTransportServerDiedNotification", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, 0, @"kIAPTransportServerLaunchedNotification", 0);
  iaptransportdXPCConnection = self->_iaptransportdXPCConnection;
  if (iaptransportdXPCConnection)
  {
    xpc_release(iaptransportdXPCConnection);
    self->_iaptransportdXPCConnection = 0;
  }
  dispatch_sync((dispatch_queue_t)self->_portListQueue, &__block_literal_global_32);
  dispatch_release((dispatch_object_t)self->_portListQueue);
  [(NSMutableDictionary *)self->_portList removeAllObjects];

  v6.receiver = self;
  v6.super_class = (Class)IAPClientPortManager;
  [(IAPClientPortManager *)&v6 dealloc];
}

- (BOOL)iaptransportdIsRunning
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  portListQueue = self->_portListQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__IAPClientPortManager_iaptransportdIsRunning__block_invoke;
  v5[3] = &unk_1E6227B08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(portListQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __46__IAPClientPortManager_iaptransportdIsRunning__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)setIaptransportdIsRunning:(BOOL)a3
{
  portListQueue = self->_portListQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__IAPClientPortManager_setIaptransportdIsRunning___block_invoke;
  v4[3] = &unk_1E6227B30;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(portListQueue, v4);
}

uint64_t __50__IAPClientPortManager_setIaptransportdIsRunning___block_invoke(uint64_t a1)
{
  NSLog(&cfstr_Iaptransportdi.isa, *(unsigned __int8 *)(*(void *)(a1 + 32) + 24), *(unsigned __int8 *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = *(unsigned char *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 32);
  if (*(unsigned char *)(v2 + 24))
  {
    if (v3)
    {
      xpc_release(v3);
      *(void *)(*(void *)(a1 + 32) + 32) = 0;
    }
    uint64_t result = RetainConnectionToIAPTransportDaemon();
  }
  else
  {
    xpc_release(v3);
    uint64_t result = 0;
  }
  *(void *)(*(void *)(a1 + 32) + 32) = result;
  return result;
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_35);
  }
  return (id)sharedInstance_sharedInstance;
}

IAPClientPortManager *__38__IAPClientPortManager_sharedInstance__block_invoke()
{
  uint64_t result = objc_alloc_init(IAPClientPortManager);
  sharedInstance_sharedInstance = (uint64_t)result;
  return result;
}

- (void)sendData:(id)a3 data:(char *)a4 length:(unsigned __int16)a5
{
  portListQueue = self->_portListQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__IAPClientPortManager_sendData_data_length___block_invoke;
  v6[3] = &unk_1E6227B80;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  unsigned __int16 v7 = a5;
  dispatch_sync(portListQueue, v6);
}

void __45__IAPClientPortManager_sendData_data_length___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    char v3 = (void *)v2;
    v4 = (void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)(a1 + 48) length:*(unsigned __int16 *)(a1 + 56)];
    id v5 = v4;
    uint64_t v6 = [v3 clientPortEventQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__IAPClientPortManager_sendData_data_length___block_invoke_2;
    block[3] = &unk_1E6227B58;
    uint64_t v7 = *(void *)(a1 + 40);
    block[4] = v3;
    block[5] = v7;
    block[6] = v4;
    dispatch_async(v6, block);
  }
}

void __45__IAPClientPortManager_sendData_data_length___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) sendDataHandlerQueue])
  {
    uint64_t v2 = [*(id *)(a1 + 32) sendDataHandlerQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__IAPClientPortManager_sendData_data_length___block_invoke_3;
    block[3] = &unk_1E6227B58;
    long long v4 = *(_OWORD *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    dispatch_async(v2, block);
  }
}

uint64_t __45__IAPClientPortManager_sendData_data_length___block_invoke_3(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) sendDataHandler];
  if (result)
  {
    uint64_t v3 = [*(id *)(a1 + 32) sendDataHandler];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 48) bytes];
    unsigned __int16 v6 = [*(id *)(a1 + 48) length];
    uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(v3 + 16);
    return v7(v3, v4, v5, v6);
  }
  return result;
}

- (int)registerSendDataHandler:(id)a3 queue:(id)a4 sendBlock:(id)a5
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  if (a3 && a4 && a5)
  {
    portListQueue = self->_portListQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__IAPClientPortManager_registerSendDataHandler_queue_sendBlock___block_invoke;
    block[3] = &unk_1E6227BA8;
    void block[4] = self;
    block[5] = a3;
    block[6] = a4;
    void block[7] = a5;
    block[8] = &v9;
    dispatch_sync(portListQueue, block);
  }
  else if (!a3 || a4 || a5)
  {
    int v12 = -536870206;
  }
  else
  {
    -[IAPClientPortManager unregisterSendDataHandler:](self, "unregisterSendDataHandler:");
  }
  int v6 = *((_DWORD *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __64__IAPClientPortManager_registerSendDataHandler_queue_sendBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 24))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    int v6 = -536870185;
LABEL_8:
    *(_DWORD *)(v5 + 24) = v6;
    return;
  }
  if (!*(void *)(v2 + 32))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    int v6 = -536870209;
    goto LABEL_8;
  }
  uint64_t v3 = [[IAPClientPort alloc] initWithUUID:*(void *)(a1 + 40) queue:*(void *)(a1 + 48) sendHandler:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v3 forKey:*(void *)(a1 + 40)];

  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "requestType", "IAPClientPortRegisterStr");
  xpc_dictionary_set_string(v4, "IAPClientPortUUIDStr", (const char *)[*(id *)(a1 + 40) UTF8String]);
  xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 32), v4);
  xpc_release(v4);
}

- (int)unregisterSendDataHandler:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  int v10 = 0;
  portListQueue = self->_portListQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__IAPClientPortManager_unregisterSendDataHandler___block_invoke;
  block[3] = &unk_1E6227BD0;
  void block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(portListQueue, block);
  int v4 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __50__IAPClientPortManager_unregisterSendDataHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 24))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    int v5 = -536870185;
LABEL_8:
    *(_DWORD *)(v4 + 24) = v5;
    return;
  }
  if (!*(void *)(v2 + 32))
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    int v5 = -536870209;
    goto LABEL_8;
  }
  [*(id *)(v2 + 8) removeObjectForKey:*(void *)(a1 + 40)];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "requestType", "IAPClientPortUnregisterStr");
  xpc_dictionary_set_string(v3, "IAPClientPortUUIDStr", (const char *)[*(id *)(a1 + 40) UTF8String]);
  xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 32), v3);
  xpc_release(v3);
}

- (int)forwardAccessoryDataToIAP:(id)a3 data:(const char *)a4 length:(unsigned __int16)a5
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  int v13 = 0;
  portListQueue = self->_portListQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__IAPClientPortManager_forwardAccessoryDataToIAP_data_length___block_invoke;
  block[3] = &unk_1E6227BF8;
  void block[4] = self;
  block[5] = a3;
  unsigned __int16 v9 = a5;
  block[6] = &v10;
  void block[7] = a4;
  dispatch_sync(portListQueue, block);
  int v6 = *((_DWORD *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void __62__IAPClientPortManager_forwardAccessoryDataToIAP_data_length___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t v3 = [*(id *)(v2 + 8) objectForKey:*(void *)(a1 + 40)];
    if (v3)
    {
      if (*(void *)(*(void *)(a1 + 32) + 32))
      {
        uint64_t v4 = (void *)v3;
        int v5 = (void *)[MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)(a1 + 56) length:*(unsigned __int16 *)(a1 + 64)];
        id v6 = v5;
        id v7 = *(id *)(a1 + 40);
        uint64_t v8 = [v4 clientPortEventQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __62__IAPClientPortManager_forwardAccessoryDataToIAP_data_length___block_invoke_2;
        block[3] = &unk_1E6227B58;
        uint64_t v9 = *(void *)(a1 + 32);
        void block[4] = *(void *)(a1 + 40);
        block[5] = v5;
        block[6] = v9;
        dispatch_async(v8, block);
        return;
      }
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      int v11 = -536870209;
    }
    else
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      int v11 = -536870206;
    }
  }
  else
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    int v11 = -536870185;
  }
  *(_DWORD *)(v10 + 24) = v11;
}

void __62__IAPClientPortManager_forwardAccessoryDataToIAP_data_length___block_invoke_2(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "requestType", "dataArrived");
  xpc_dictionary_set_string(v2, "IAPClientPortUUIDStr", (const char *)[*(id *)(a1 + 32) UTF8String]);
  xpc_dictionary_set_data(v2, "data", (const void *)[*(id *)(a1 + 40) bytes], objc_msgSend(*(id *)(a1 + 40), "length"));
  xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 48) + 32), v2);
  xpc_release(v2);

  uint64_t v3 = *(void **)(a1 + 32);
}

- (void)reRegisterHandlers
{
  portListQueue = self->_portListQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__IAPClientPortManager_reRegisterHandlers__block_invoke;
  block[3] = &unk_1E6227868;
  void block[4] = self;
  dispatch_sync(portListQueue, block);
}

uint64_t __42__IAPClientPortManager_reRegisterHandlers__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  xpc_object_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) allValues];
  uint64_t result = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * v6);
        uint64_t v8 = [v7 clientPortEventQueue];
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __42__IAPClientPortManager_reRegisterHandlers__block_invoke_2;
        v9[3] = &unk_1E6227890;
        v9[4] = *(void *)(a1 + 32);
        v9[5] = v7;
        dispatch_async(v8, v9);
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

void __42__IAPClientPortManager_reRegisterHandlers__block_invoke_2(uint64_t a1)
{
  xpc_object_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    xpc_release(v2);
    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
  *(void *)(*(void *)(a1 + 32) + 32) = RetainConnectionToIAPTransportDaemon();
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v3, "requestType", "IAPClientPortRegisterStr");
    xpc_dictionary_set_string(v3, "IAPClientPortUUIDStr", (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "uuid"), "UTF8String"));
    xpc_connection_send_message(*(xpc_connection_t *)(*(void *)(a1 + 32) + 32), v3);
    xpc_release(v3);
  }
}

@end