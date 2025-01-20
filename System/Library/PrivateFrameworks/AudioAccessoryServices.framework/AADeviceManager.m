@interface AADeviceManager
+ (BOOL)supportsSecureCoding;
- (AADeviceManager)init;
- (AADeviceManager)initWithCoder:(id)a3;
- (NSArray)discoveredDevices;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)description;
- (id)deviceFoundHandler;
- (id)deviceLostHandler;
- (id)headGestureUpdatedHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unsigned)clientID;
- (unsigned)headGestureUpdateFlags;
- (void)_activate:(BOOL)a3;
- (void)_interrupted;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)_reset;
- (void)aaServicesRequireReset;
- (void)activateWithCompletion:(id)a3;
- (void)deviceHeadGestureDetected:(id)a3;
- (void)deviceManagerFoundDevice:(id)a3;
- (void)deviceManagerLostDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)sendDeviceConfig:(id)a3 device:(id)a4 completion:(id)a5;
- (void)sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5;
- (void)setClientID:(unsigned int)a3;
- (void)setDeviceFoundHandler:(id)a3;
- (void)setDeviceLostHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHeadGestureUpdateFlags:(unsigned int)a3;
- (void)setHeadGestureUpdatedHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
@end

@implementation AADeviceManager

- (unsigned)headGestureUpdateFlags
{
  return self->_headGestureUpdateFlags;
}

- (NSArray)discoveredDevices
{
  v2 = self;
  objc_sync_enter(v2);
  deviceDictionary = v2->_deviceDictionary;
  if (deviceDictionary)
  {
    v4 = [(NSMutableDictionary *)deviceDictionary allValues];
  }
  else
  {
    v4 = (void *)MEMORY[0x263EFFA68];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void)setInterruptionHandler:(id)a3
{
}

- (void)setDeviceLostHandler:(id)a3
{
}

- (void)setDeviceFoundHandler:(id)a3
{
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;

  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__AADeviceManager_activateWithCompletion___block_invoke;
  v7[3] = &unk_26523F7E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (AADeviceManager)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AADeviceManager *)self init];
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_clientID = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_headGestureUpdateFlags = 0;
    }
    id v6 = v5;
  }

  return v5;
}

- (AADeviceManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)AADeviceManager;
  id v2 = [(AADeviceManager *)&v5 init];
  if (v2)
  {
    v2->_clientID = AAXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v3 = v2;
  }

  return v2;
}

- (void)_activate:(BOOL)a3
{
  if (!self->_invalidateCalled)
  {
    if (a3)
    {
      if (gLogCategory_AADeviceManager <= 30
        && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
      {
LABEL_11:
        uint64_t clientID = self->_clientID;
        LogPrintF();
      }
    }
    else if (gLogCategory_AADeviceManager <= 30 {
           && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    }
    {
      goto LABEL_11;
    }
    v7 = [(AADeviceManager *)self _ensureXPCStarted];
    if (v7)
    {
      [(AADeviceManager *)self _reportError:v7];
    }
    else
    {
      xpcCnx = self->_xpcCnx;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __29__AADeviceManager__activate___block_invoke;
      v14[3] = &unk_26523F808;
      BOOL v15 = a3;
      v14[4] = self;
      v9 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v14];
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __29__AADeviceManager__activate___block_invoke_2;
      v12[3] = &unk_26523F808;
      v12[4] = self;
      BOOL v13 = a3;
      [v9 deviceManagerActivate:self completion:v12];
    }
    return;
  }
  NSErrorF();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_AADeviceManager <= 90
    && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_super v5 = (void (**)(void, void))MEMORY[0x24C581450](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v5) {
    ((void (**)(void, id))v5)[2](v5, v11);
  }
}

- (id)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    v3 = self->_testListenerEndpoint;
    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    if (v3) {
      objc_super v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:v3];
    }
    else {
      objc_super v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.AudioAccessoryServices" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC937B0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __36__AADeviceManager__ensureXPCStarted__block_invoke;
    v11[3] = &unk_26523F8D0;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __36__AADeviceManager__ensureXPCStarted__block_invoke_2;
    v10[3] = &unk_26523F8D0;
    v10[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v10];
    id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC93810];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t clientID = self->_clientID;
  id v7 = v4;
  if (clientID)
  {
    [v4 encodeInt64:clientID forKey:@"cid"];
    id v4 = v7;
  }
  uint64_t headGestureUpdateFlags = self->_headGestureUpdateFlags;
  if (headGestureUpdateFlags)
  {
    [v7 encodeInt64:headGestureUpdateFlags forKey:@"cmcf"];
    id v4 = v7;
  }
}

void __42__AADeviceManager_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    NSErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AADeviceManager <= 90
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  }
  else
  {
    *(unsigned char *)(v2 + 8) = 1;
    uint64_t v3 = MEMORY[0x24C581450](*(void *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    objc_super v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v6 = *(void **)(a1 + 32);
    [v6 _activate:0];
  }
}

void __29__AADeviceManager__activate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    id v4 = v3;
    if (gLogCategory_AADeviceManager <= 90)
    {
      if (gLogCategory_AADeviceManager != -1 || (v5 = _LogCategory_Initialize(), id v4 = v10, v5))
      {
        id v9 = v4;
        LogPrintF();
        id v4 = v10;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v4, v9);
    goto LABEL_20;
  }
  if (*(unsigned char *)(a1 + 40))
  {
    if (gLogCategory_AADeviceManager > 30
      || gLogCategory_AADeviceManager == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
  }
  else if (gLogCategory_AADeviceManager > 30 {
         || gLogCategory_AADeviceManager == -1 && !_LogCategory_Initialize())
  }
  {
    goto LABEL_17;
  }
  LogPrintF();
LABEL_17:
  id v6 = (void (**)(void, void))MEMORY[0x24C581450](*(void *)(*(void *)(a1 + 32) + 16));
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0;

  if (v6) {
    v6[2](v6, 0);
  }

LABEL_20:
}

- (void)setHeadGestureUpdateFlags:(unsigned int)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __45__AADeviceManager_setHeadGestureUpdateFlags___block_invoke;
    v6[3] = &unk_26523F790;
    v6[4] = v4;
    unsigned int v7 = a3;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_uint64_t headGestureUpdateFlags = a3;
  }
  objc_sync_exit(v4);
}

void __45__AADeviceManager_setHeadGestureUpdateFlags___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 48) = *(_DWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__AADeviceManager_setHeadGestureUpdateFlags___block_invoke_2;
  v5[3] = &unk_26523F8F8;
  v5[4] = v2;
  id v4 = [v3 remoteObjectProxyWithErrorHandler:v5];
  objc_msgSend(v4, "deviceManagerUpdate:completion:", MEMORY[0x263EF8330], 3221225472, __45__AADeviceManager_setHeadGestureUpdateFlags___block_invoke_3, &unk_26523F8F8, *(void *)(a1 + 32));
}

uint64_t __45__AADeviceManager_setHeadGestureUpdateFlags___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reportError:a2];
}

void __45__AADeviceManager_setHeadGestureUpdateFlags___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    id v4 = v3;
    if (gLogCategory_AADeviceManager <= 90)
    {
      if (gLogCategory_AADeviceManager != -1 || (v5 = _LogCategory_Initialize(), id v4 = v10, v5))
      {
        id v9 = v4;
        LogPrintF();
        id v4 = v10;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v4, v9);
  }
  else
  {
    if (gLogCategory_AADeviceManager <= 30
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v6 = (void (**)(void, void))MEMORY[0x24C581450](*(void *)(*(void *)(a1 + 32) + 16));
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = 0;

    if (v6) {
      v6[2](v6, 0);
    }
  }
}

void __29__AADeviceManager__activate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    if (gLogCategory_AADeviceManager <= 30)
    {
      if (gLogCategory_AADeviceManager != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
        id v6 = v3;
LABEL_8:
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  else if (gLogCategory_AADeviceManager <= 90)
  {
    if (gLogCategory_AADeviceManager != -1 || (int v5 = _LogCategory_Initialize(), v3 = v7, v5))
    {
      id v6 = v3;
      goto LABEL_8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v6);
}

uint64_t __36__AADeviceManager__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __36__AADeviceManager__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  int v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_AADeviceManager <= 50
    && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = BTErrorF();
  [(AADeviceManager *)self _reportError:v3];

  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    id v6 = (void (*)(void))*((void *)interruptionHandler + 2);
    v6();
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__AADeviceManager_invalidate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __29__AADeviceManager_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 32))
  {
    *(unsigned char *)(v1 + 32) = 1;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 33)
      && gLogCategory_AADeviceManager <= 30
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 40);
    if (v4)
    {
      [v4 invalidate];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    id v8 = (void (**)(id, void *))MEMORY[0x24C581450](*(void *)(v3 + 16));
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = 0;

    if (v8)
    {
      id v7 = BTErrorF();
      v8[2](v8, v7);
    }
    [*(id *)(a1 + 32) _invalidated];
  }
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_AADeviceManager <= 50
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      v12 = (void (**)(id, void *))MEMORY[0x24C581450](self->_activateCompletion, a2);
      id activateCompletion = self->_activateCompletion;
      self->_id activateCompletion = 0;

      if (v12)
      {
        int v4 = BTErrorF();
        v12[2](v12, v4);
      }
      uint64_t v5 = (void (**)(void))MEMORY[0x24C581450](self->_invalidationHandler);
      id invalidationHandler = self->_invalidationHandler;
      self->_id invalidationHandler = 0;

      if (v5) {
        v5[2](v5);
      }
      [(NSMutableDictionary *)self->_deviceDictionary removeAllObjects];
      deviceDictionary = self->_deviceDictionary;
      self->_deviceDictionary = 0;

      id deviceFoundHandler = self->_deviceFoundHandler;
      self->_id deviceFoundHandler = 0;

      id deviceLostHandler = self->_deviceLostHandler;
      self->_id deviceLostHandler = 0;

      id interruptionHandler = self->_interruptionHandler;
      self->_id interruptionHandler = 0;

      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_AADeviceManager <= 10
        && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)_reset
{
  if (!self->_resetOngoing)
  {
    self->_resetOngoing = 1;
    if (gLogCategory_AADeviceManager <= 50
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __25__AADeviceManager__reset__block_invoke;
    v6[3] = &unk_26523F8D0;
    v6[4] = self;
    uint64_t v3 = (void (**)(void))MEMORY[0x24C581450](v6);
    int v4 = self->_deviceDictionary;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __25__AADeviceManager__reset__block_invoke_2;
    v5[3] = &unk_26523FCC8;
    v5[4] = self;
    [(NSMutableDictionary *)v4 enumerateKeysAndObjectsUsingBlock:v5];
    [(AADeviceManager *)self _activate:1];
    if (gLogCategory_AADeviceManager <= 10
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    v3[2](v3);
  }
}

uint64_t __25__AADeviceManager__reset__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 34) = 0;
  return result;
}

void __25__AADeviceManager__reset__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (gLogCategory_AADeviceManager <= 30
    && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
  {
    id v6 = v5;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "deviceManagerLostDevice:", v5, v6);
}

- (void)sendDeviceConfig:(id)a3 device:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = [a4 identifier];
  if (v9)
  {
    [(AADeviceManager *)self sendDeviceConfig:v11 identifier:v9 completion:v8];
  }
  else
  {
    id v10 = NSErrorF();
    v8[2](v8, v10);
  }
}

- (void)sendDeviceConfig:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __58__AADeviceManager_sendDeviceConfig_identifier_completion___block_invoke;
  v15[3] = &unk_26523FCF0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(dispatchQueue, v15);
}

void __58__AADeviceManager_sendDeviceConfig_identifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[8])
  {
    uint64_t v3 = [v2 _ensureXPCStarted];
    if (v3)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    else
    {
      int v4 = *(void **)(*(void *)(a1 + 32) + 40);
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __58__AADeviceManager_sendDeviceConfig_identifier_completion___block_invoke_2;
      v11[3] = &unk_26523F8A8;
      id v12 = *(id *)(a1 + 56);
      id v5 = [v4 remoteObjectProxyWithErrorHandler:v11];
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = *(void *)(a1 + 48);
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __58__AADeviceManager_sendDeviceConfig_identifier_completion___block_invoke_3;
      v9[3] = &unk_26523F8A8;
      id v10 = *(id *)(a1 + 56);
      [v5 deviceManagerSendDeviceConfig:v6 identifier:v7 completion:v9];
    }
  }
  else
  {
    NSErrorF();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __58__AADeviceManager_sendDeviceConfig_identifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (gLogCategory_AADeviceManager <= 90)
  {
    if (gLogCategory_AADeviceManager != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
    {
      LogPrintF();
      id v3 = v7;
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v7);
    id v3 = v7;
  }

  return MEMORY[0x270F9A758](v5, v3);
}

uint64_t __58__AADeviceManager_sendDeviceConfig_identifier_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    if (gLogCategory_AADeviceManager <= 90)
    {
      if (gLogCategory_AADeviceManager != -1 || (int v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
        LogPrintF();
        id v3 = v7;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t, id))(v5 + 16))(v5, v7);
    id v3 = v7;
  }

  return MEMORY[0x270F9A758](v5, v3);
}

- (void)_reportError:(id)a3
{
  id v6 = a3;
  if (gLogCategory_AADeviceManager <= 90
    && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v4 = (void (**)(void, void))MEMORY[0x24C581450](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v4) {
    ((void (**)(void, id))v4)[2](v4, v6);
  }
}

- (void)deviceManagerFoundDevice:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v10 identifier];
  if (v5)
  {
    deviceDictionary = v4->_deviceDictionary;
    if (!deviceDictionary)
    {
      id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v8 = v4->_deviceDictionary;
      v4->_deviceDictionary = v7;

      deviceDictionary = v4->_deviceDictionary;
    }
    [(NSMutableDictionary *)deviceDictionary setObject:v10 forKeyedSubscript:v5];

    objc_sync_exit(v4);
    id deviceFoundHandler = (void (**)(id, id))v4->_deviceFoundHandler;
    if (deviceFoundHandler)
    {
      deviceFoundHandler[2](deviceFoundHandler, v10);
    }
    else if (gLogCategory_AADeviceManager <= 10 {
           && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (void)deviceManagerLostDevice:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  int v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 identifier];
  if (v5)
  {
    [(NSMutableDictionary *)v4->_deviceDictionary setObject:0 forKeyedSubscript:v5];

    objc_sync_exit(v4);
    if (gLogCategory_AADeviceManager <= 30
      && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id deviceLostHandler = (void (**)(id, id))v4->_deviceLostHandler;
    if (deviceLostHandler) {
      deviceLostHandler[2](deviceLostHandler, v7);
    }
  }
  else
  {
    objc_sync_exit(v4);
  }
}

- (void)aaServicesRequireReset
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_AADeviceManager <= 30
    && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  [(AADeviceManager *)self _reset];
}

- (void)deviceHeadGestureDetected:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  headGestureUpdatedHandler = (void (**)(id, id))self->_headGestureUpdatedHandler;
  if (headGestureUpdatedHandler)
  {
    headGestureUpdatedHandler[2](headGestureUpdatedHandler, v5);
  }
  else if (gLogCategory_AADeviceManager <= 10 {
         && (gLogCategory_AADeviceManager != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)headGestureUpdatedHandler
{
  return self->_headGestureUpdatedHandler;
}

- (void)setHeadGestureUpdatedHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_uint64_t clientID = a3;
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_headGestureUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_deviceDictionary, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end