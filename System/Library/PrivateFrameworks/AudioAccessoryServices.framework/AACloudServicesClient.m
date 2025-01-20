@interface AACloudServicesClient
+ (BOOL)supportsSecureCoding;
- (AACloudServicesClient)init;
- (AACloudServicesClient)initWithCoder:(id)a3;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)hmDeviceCloudRecordUpdateHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (unsigned)clientID;
- (unsigned)internalFlags;
- (void)_activate;
- (void)_interrupted;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)fetchAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)fetchHMDeviceCloudRecordInfoWithAddress:(id)a3 completion:(id)a4;
- (void)hmDeviceCloudRecordInfosUpdated:(id)a3;
- (void)invalidate;
- (void)modifyAAProxCardsInfo:(id)a3 completion:(id)a4;
- (void)modifyHMDeviceCloudRecordInfo:(id)a3 completion:(id)a4;
- (void)removeAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)removeHMDeviceCloudRecordInfoForDeviceWithAddress:(id)a3 completion:(id)a4;
- (void)setClientID:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setHmDeviceCloudRecordUpdateHandler:(id)a3;
- (void)setInternalFlags:(unsigned int)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
@end

@implementation AACloudServicesClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t internalFlags = self->_internalFlags;
  if (internalFlags) {
    [a3 encodeInt64:internalFlags forKey:@"inf"];
  }
}

- (AACloudServicesClient)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AACloudServicesClient *)self init];
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_uint64_t internalFlags = 0;
    }
    v6 = v5;
  }

  return v5;
}

- (AACloudServicesClient)init
{
  v8.receiver = self;
  v8.super_class = (Class)AACloudServicesClient;
  v2 = [(AACloudServicesClient *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("AACloudServicesClient", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__AACloudServicesClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_26523F7E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __48__AACloudServicesClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    NSErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AACloudServicesClient <= 90
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
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
    v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v6 = *(void **)(a1 + 32);
    [v6 _activate];
  }
}

- (void)_activate
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __34__AACloudServicesClient__activate__block_invoke;
  v13[3] = &unk_26523FF30;
  v13[4] = self;
  v13[5] = &v14;
  uint64_t v3 = (void (**)(void))MEMORY[0x24C581450](v13, a2);
  if (self->_invalidateCalled)
  {
    uint64_t v7 = BTErrorF();
    uint64_t v4 = (void *)v15[5];
    v15[5] = v7;
  }
  else
  {
    if (self->_hmDeviceCloudRecordUpdateHandler) {
      self->_internalFlags |= 1u;
    }
    if (gLogCategory_AACloudServicesClient <= 30
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      uint64_t clientID = self->_clientID;
      LogPrintF();
    }
    uint64_t v4 = [(AACloudServicesClient *)self _ensureXPCStarted];
    if (v4)
    {
      uint64_t v8 = BTErrorF();
      v9 = (void *)v15[5];
      v15[5] = v8;
    }
    else
    {
      xpcCnx = self->_xpcCnx;
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __34__AACloudServicesClient__activate__block_invoke_2;
      v12[3] = &unk_26523F8F8;
      v12[4] = self;
      id v6 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v12];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __34__AACloudServicesClient__activate__block_invoke_3;
      v11[3] = &unk_26523F8F8;
      v11[4] = self;
      [v6 cloudServicesClientActivate:self completion:v11];
    }
  }

  v3[2](v3);
  _Block_object_dispose(&v14, 8);
}

uint64_t __34__AACloudServicesClient__activate__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40)) {
    return objc_msgSend(*(id *)(result + 32), "_reportError:");
  }
  return result;
}

void __34__AACloudServicesClient__activate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_AACloudServicesClient <= 90)
  {
    if (gLogCategory_AACloudServicesClient != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      id v5 = v3;
      LogPrintF();
      id v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v5);
}

void __34__AACloudServicesClient__activate__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    id v4 = v3;
    if (gLogCategory_AACloudServicesClient <= 90)
    {
      if (gLogCategory_AACloudServicesClient != -1 || (v5 = _LogCategory_Initialize(), id v4 = v10, v5))
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
    if (gLogCategory_AACloudServicesClient <= 30
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v6 = (void (**)(void, void))MEMORY[0x24C581450](*(void *)(*(void *)(a1 + 32) + 16));
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = 0;

    if (v6) {
      v6[2](v6, 0);
    }
  }
}

- (id)_ensureXPCStarted
{
  id v3 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC93B00];
  id v4 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v5 = objc_opt_class();
  id v6 = objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
  [v3 setClasses:v6 forSelector:sel_hmDeviceCloudRecordInfosUpdated_ argumentIndex:0 ofReply:0];
  if (!self->_xpcCnx)
  {
    uint64_t v7 = self->_testListenerEndpoint;
    id v8 = objc_alloc(MEMORY[0x263F08D68]);
    if (v7) {
      id v9 = (NSXPCConnection *)[v8 initWithListenerEndpoint:v7];
    }
    else {
      id v9 = (NSXPCConnection *)[v8 initWithMachServiceName:@"com.apple.BluetoothCloudServices" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v9;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v3];
    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __42__AACloudServicesClient__ensureXPCStarted__block_invoke;
    v14[3] = &unk_26523F8D0;
    v14[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v14];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __42__AACloudServicesClient__ensureXPCStarted__block_invoke_2;
    v13[3] = &unk_26523F8D0;
    v13[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v13];
    v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC93E48];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v11];
    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_AACloudServicesClient <= 30
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return 0;
}

uint64_t __42__AACloudServicesClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __42__AACloudServicesClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_AACloudServicesClient <= 50
    && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = (void (**)(void))MEMORY[0x24C581450](self->_interruptionHandler);
  if (v3)
  {
    id v4 = v3;
    v3[2]();
    id v3 = v4;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__AACloudServicesClient_invalidate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__AACloudServicesClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 24) = 1;
    if (!*(unsigned char *)(*(void *)(result + 32) + 25)
      && gLogCategory_AACloudServicesClient <= 30
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = *(id **)(v2 + 32);
    if (v3[4])
    {
      [v3[4] invalidate];
      id v3 = *(id **)(v2 + 32);
    }
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_AACloudServicesClient <= 50
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      uint64_t v3 = MEMORY[0x24C581450](self->_invalidationHandler, a2);
      id v4 = (void *)v3;
      if (v3) {
        (*(void (**)(uint64_t))(v3 + 16))(v3);
      }

      id interruptionHandler = self->_interruptionHandler;
      self->_id interruptionHandler = 0;

      id invalidationHandler = self->_invalidationHandler;
      self->_id invalidationHandler = 0;

      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_AACloudServicesClient <= 10
        && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)fetchAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__AACloudServicesClient_fetchAAProxCardsInfoForDeviceWithAddress_completion___block_invoke;
  block[3] = &unk_265240200;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __77__AACloudServicesClient_fetchAAProxCardsInfoForDeviceWithAddress_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __77__AACloudServicesClient_fetchAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_2;
  v12[3] = &unk_26523FEB8;
  id v14 = &v15;
  id v13 = a1[6];
  uint64_t v2 = (void (**)(void))MEMORY[0x24C581450](v12);
  if (gLogCategory_AACloudServicesClient <= 30
    && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a1[4])
  {
    uint64_t v3 = [a1[5] _ensureXPCStarted];
    if (v3)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      id v4 = (void *)*((void *)a1[5] + 4);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __77__AACloudServicesClient_fetchAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_3;
      v10[3] = &unk_26523F8A8;
      id v11 = a1[6];
      uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v10];
      id v6 = [a1[4] uppercaseString];
      [v5 fetchAAProxCardsInfoForDeviceWithAddress:v6 completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    uint64_t v3 = (void *)v16[5];
    v16[5] = v8;
  }

  v2[2](v2);
  _Block_object_dispose(&v15, 8);
}

uint64_t __77__AACloudServicesClient_fetchAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_AACloudServicesClient <= 90
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

uint64_t __77__AACloudServicesClient_fetchAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)modifyAAProxCardsInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__AACloudServicesClient_modifyAAProxCardsInfo_completion___block_invoke;
  block[3] = &unk_26523FE90;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __58__AACloudServicesClient_modifyAAProxCardsInfo_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __58__AACloudServicesClient_modifyAAProxCardsInfo_completion___block_invoke_2;
  v12[3] = &unk_26523FE68;
  id v14 = &v15;
  void v12[4] = v2;
  id v13 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x24C581450](v12);
  if (v2)
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      if (gLogCategory_AACloudServicesClient <= 30
        && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v5 = (void *)*((void *)a1[5] + 4);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __58__AACloudServicesClient_modifyAAProxCardsInfo_completion___block_invoke_3;
      v10[3] = &unk_26523F8A8;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 modifyAAProxCardsInfo:v2 completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v16[5];
    v16[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);
}

uint64_t __58__AACloudServicesClient_modifyAAProxCardsInfo_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_AACloudServicesClient <= 90
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __58__AACloudServicesClient_modifyAAProxCardsInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAAProxCardsInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__AACloudServicesClient_removeAAProxCardsInfoForDeviceWithAddress_completion___block_invoke;
  block[3] = &unk_265240200;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __78__AACloudServicesClient_removeAAProxCardsInfoForDeviceWithAddress_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__AACloudServicesClient_removeAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_2;
  v12[3] = &unk_26523FEB8;
  id v14 = &v15;
  id v13 = a1[6];
  id v2 = (void (**)(void))MEMORY[0x24C581450](v12);
  if (gLogCategory_AACloudServicesClient <= 30
    && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a1[4])
  {
    uint64_t v3 = [a1[5] _ensureXPCStarted];
    if (v3)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      id v4 = (void *)*((void *)a1[5] + 4);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __78__AACloudServicesClient_removeAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_3;
      v10[3] = &unk_26523F8A8;
      id v11 = a1[6];
      uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v10];
      id v6 = [a1[4] uppercaseString];
      [v5 removeAAProxCardsInfoForDeviceWithAddress:v6 completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    uint64_t v3 = (void *)v16[5];
    v16[5] = v8;
  }

  v2[2](v2);
  _Block_object_dispose(&v15, 8);
}

uint64_t __78__AACloudServicesClient_removeAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_AACloudServicesClient <= 90
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

uint64_t __78__AACloudServicesClient_removeAAProxCardsInfoForDeviceWithAddress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchHMDeviceCloudRecordInfoWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__AACloudServicesClient_fetchHMDeviceCloudRecordInfoWithAddress_completion___block_invoke;
  block[3] = &unk_265240200;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __76__AACloudServicesClient_fetchHMDeviceCloudRecordInfoWithAddress_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__AACloudServicesClient_fetchHMDeviceCloudRecordInfoWithAddress_completion___block_invoke_2;
  v12[3] = &unk_26523FEB8;
  id v14 = &v15;
  id v13 = a1[6];
  id v2 = (void (**)(void))MEMORY[0x24C581450](v12);
  if (gLogCategory_AACloudServicesClient <= 30
    && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a1[4])
  {
    uint64_t v3 = [a1[5] _ensureXPCStarted];
    if (v3)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      id v4 = (void *)*((void *)a1[5] + 4);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __76__AACloudServicesClient_fetchHMDeviceCloudRecordInfoWithAddress_completion___block_invoke_3;
      v10[3] = &unk_26523F8A8;
      id v11 = a1[6];
      uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v10];
      id v6 = [a1[4] uppercaseString];
      [v5 fetchHMDeviceCloudRecordInfoWithAddress:v6 completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    uint64_t v3 = (void *)v16[5];
    v16[5] = v8;
  }

  v2[2](v2);
  _Block_object_dispose(&v15, 8);
}

uint64_t __76__AACloudServicesClient_fetchHMDeviceCloudRecordInfoWithAddress_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_AACloudServicesClient <= 90
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

uint64_t __76__AACloudServicesClient_fetchHMDeviceCloudRecordInfoWithAddress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)modifyHMDeviceCloudRecordInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__AACloudServicesClient_modifyHMDeviceCloudRecordInfo_completion___block_invoke;
  block[3] = &unk_26523FE90;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void __66__AACloudServicesClient_modifyHMDeviceCloudRecordInfo_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  id v2 = a1[4];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __66__AACloudServicesClient_modifyHMDeviceCloudRecordInfo_completion___block_invoke_2;
  v12[3] = &unk_26523FE68;
  id v14 = &v15;
  void v12[4] = v2;
  id v13 = a1[6];
  uint64_t v3 = (void (**)(void))MEMORY[0x24C581450](v12);
  if (v2)
  {
    id v4 = [a1[5] _ensureXPCStarted];
    if (v4)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      if (gLogCategory_AACloudServicesClient <= 30
        && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v5 = (void *)*((void *)a1[5] + 4);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __66__AACloudServicesClient_modifyHMDeviceCloudRecordInfo_completion___block_invoke_3;
      v10[3] = &unk_26523F8A8;
      id v11 = a1[6];
      id v6 = [v5 remoteObjectProxyWithErrorHandler:v10];
      [v6 modifyHMDeviceCloudRecordInfo:v2 completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    id v4 = (void *)v16[5];
    v16[5] = v8;
  }

  v3[2](v3);
  _Block_object_dispose(&v15, 8);
}

uint64_t __66__AACloudServicesClient_modifyHMDeviceCloudRecordInfo_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 48) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_AACloudServicesClient <= 90
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

uint64_t __66__AACloudServicesClient_modifyHMDeviceCloudRecordInfo_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeHMDeviceCloudRecordInfoForDeviceWithAddress:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __86__AACloudServicesClient_removeHMDeviceCloudRecordInfoForDeviceWithAddress_completion___block_invoke;
  block[3] = &unk_265240200;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(dispatchQueue, block);
}

void __86__AACloudServicesClient_removeHMDeviceCloudRecordInfoForDeviceWithAddress_completion___block_invoke(id *a1)
{
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  id v19 = __Block_byref_object_dispose__2;
  id v20 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __86__AACloudServicesClient_removeHMDeviceCloudRecordInfoForDeviceWithAddress_completion___block_invoke_2;
  v12[3] = &unk_26523FEB8;
  id v14 = &v15;
  id v13 = a1[6];
  id v2 = (void (**)(void))MEMORY[0x24C581450](v12);
  if (gLogCategory_AACloudServicesClient <= 30
    && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (a1[4])
  {
    uint64_t v3 = [a1[5] _ensureXPCStarted];
    if (v3)
    {
      uint64_t v9 = BTErrorF();
      id v7 = (void *)v16[5];
      v16[5] = v9;
    }
    else
    {
      id v4 = (void *)*((void *)a1[5] + 4);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __86__AACloudServicesClient_removeHMDeviceCloudRecordInfoForDeviceWithAddress_completion___block_invoke_3;
      v10[3] = &unk_26523F8A8;
      id v11 = a1[6];
      uint64_t v5 = [v4 remoteObjectProxyWithErrorHandler:v10];
      id v6 = [a1[4] uppercaseString];
      [v5 removeHMDeviceCloudRecordInfoForDeviceWithAddress:v6 completion:a1[6]];

      id v7 = v11;
    }
  }
  else
  {
    uint64_t v8 = BTErrorF();
    uint64_t v3 = (void *)v16[5];
    v16[5] = v8;
  }

  v2[2](v2);
  _Block_object_dispose(&v15, 8);
}

uint64_t __86__AACloudServicesClient_removeHMDeviceCloudRecordInfoForDeviceWithAddress_completion___block_invoke_2(uint64_t result)
{
  if (*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40))
  {
    uint64_t v1 = result;
    if (gLogCategory_AACloudServicesClient <= 90
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 32) + 16);
    return v2();
  }
  return result;
}

uint64_t __86__AACloudServicesClient_removeHMDeviceCloudRecordInfoForDeviceWithAddress_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)hmDeviceCloudRecordInfosUpdated:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_hmDeviceCloudRecordUpdateHandler)
  {
    if (gLogCategory_AACloudServicesClient <= 30
      && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
    {
      [v4 count];
      LogPrintF();
    }
    (*((void (**)(id, id))self->_hmDeviceCloudRecordUpdateHandler + 2))(self->_hmDeviceCloudRecordUpdateHandler, v4);
  }
  else if (gLogCategory_AACloudServicesClient <= 10 {
         && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_reportError:(id)a3
{
  id v6 = a3;
  if (gLogCategory_AACloudServicesClient <= 90
    && (gLogCategory_AACloudServicesClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v4 = (void (**)(void, void))MEMORY[0x24C581450](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v4) {
    ((void (**)(void, id))v4)[2](v4, v6);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)hmDeviceCloudRecordUpdateHandler
{
  return self->_hmDeviceCloudRecordUpdateHandler;
}

- (void)setHmDeviceCloudRecordUpdateHandler:(id)a3
{
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

- (unsigned)internalFlags
{
  return self->_internalFlags;
}

- (void)setInternalFlags:(unsigned int)a3
{
  self->_uint64_t internalFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_hmDeviceCloudRecordUpdateHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end