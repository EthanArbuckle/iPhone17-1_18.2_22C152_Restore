@interface BTAudioRoutingRequest
+ (BOOL)supportsSecureCoding;
- (BTAudioRoutingRequest)init;
- (BTAudioRoutingRequest)initWithCoder:(id)a3;
- (NSDictionary)options;
- (NSString)appBundleID;
- (NSString)deviceAddress;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)_activateSync;
- (id)_ensureXPCStarted;
- (id)activateSync;
- (id)description;
- (id)responseHandler;
- (int)audioScore;
- (unsigned)clientID;
- (unsigned)flags;
- (void)_activate;
- (void)_handleServerDied;
- (void)_interrupted;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)activate;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setAppBundleID:(id)a3;
- (void)setAudioScore:(int)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setDeviceAddress:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setOptions:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)updateAudioState:(id)a3 withState:(unsigned int)a4;
@end

@implementation BTAudioRoutingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BTAudioRoutingRequest)init
{
  v5.receiver = self;
  v5.super_class = (Class)BTAudioRoutingRequest;
  v2 = [(BTAudioRoutingRequest *)&v5 init];
  if (v2)
  {
    v2->_clientID = BTXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v3 = v2;
  }

  return v2;
}

- (BTAudioRoutingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BTAudioRoutingRequest *)self init];
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_audioScore = 0;
    }
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_clientID = 0;
    }
    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_flags = 0;
    }
    id v8 = v7;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t audioScore = self->_audioScore;
  id v11 = v4;
  if (audioScore)
  {
    [v4 encodeInteger:audioScore forKey:@"auSc"];
    id v4 = v11;
  }
  appBundleID = self->_appBundleID;
  if (appBundleID)
  {
    [v11 encodeObject:appBundleID forKey:@"aid"];
    id v4 = v11;
  }
  uint64_t clientID = self->_clientID;
  if (clientID)
  {
    [v11 encodeInt64:clientID forKey:@"cid"];
    id v4 = v11;
  }
  deviceAddress = self->_deviceAddress;
  if (deviceAddress)
  {
    [v11 encodeObject:deviceAddress forKey:@"dAdr"];
    id v4 = v11;
  }
  uint64_t flags = self->_flags;
  if (flags)
  {
    [v11 encodeInt64:flags forKey:@"flgs"];
    id v4 = v11;
  }
  options = self->_options;
  if (options)
  {
    [v11 encodeObject:options forKey:@"opts"];
    id v4 = v11;
  }
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;

  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__BTAudioRoutingRequest_activate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__BTAudioRoutingRequest_activate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activate];
}

- (void)_activate
{
  if (gLogCategory_BTAudioRoutingRequest <= 30
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    uint64_t clientID = self->_clientID;
    LogPrintF();
  }
  v3 = [(BTAudioRoutingRequest *)self _ensureXPCStarted];
  if (v3)
  {
    [(BTAudioRoutingRequest *)self _reportError:v3];
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __34__BTAudioRoutingRequest__activate__block_invoke;
    v8[3] = &unk_26523F8F8;
    v8[4] = self;
    objc_super v5 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v8];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __34__BTAudioRoutingRequest__activate__block_invoke_2;
    v7[3] = &unk_26523FF08;
    v7[4] = self;
    [v5 audioRoutingRequest:self responseHandler:v7];
  }
}

void __34__BTAudioRoutingRequest__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_BTAudioRoutingRequest <= 90)
  {
    if (gLogCategory_BTAudioRoutingRequest != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      id v5 = v3;
      LogPrintF();
      id v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v5);
}

void __34__BTAudioRoutingRequest__activate__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id v3 = [v8 error];
  if (v3)
  {
    if (gLogCategory_BTAudioRoutingRequest <= 90
      && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
    {
      id v7 = v3;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v7);
  }
  else
  {
    if (gLogCategory_BTAudioRoutingRequest <= 30
      && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    int v4 = (void (**)(void, void))MEMORY[0x24C581450](*(void *)(*(void *)(a1 + 32) + 72));
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 72);
      *(void *)(v5 + 72) = 0;

      ((void (**)(void, id))v4)[2](v4, v8);
    }
  }
}

- (id)activateSync
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__BTAudioRoutingRequest_activateSync__block_invoke;
  v5[3] = &unk_26523FF30;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __37__BTAudioRoutingRequest_activateSync__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _activateSync];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x270F9A758](v2, v4);
}

- (id)_activateSync
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  id v16 = 0;
  if (gLogCategory_BTAudioRoutingRequest <= 30
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    uint64_t clientID = self->_clientID;
    LogPrintF();
  }
  uint64_t v3 = [(BTAudioRoutingRequest *)self _ensureXPCStarted];
  if (v3)
  {
    [(BTAudioRoutingRequest *)self _reportError:v3];
    id v4 = 0;
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __38__BTAudioRoutingRequest__activateSync__block_invoke;
    v10[3] = &unk_26523F8F8;
    v10[4] = self;
    uint64_t v6 = [(NSXPCConnection *)xpcCnx synchronousRemoteObjectProxyWithErrorHandler:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__BTAudioRoutingRequest__activateSync__block_invoke_2;
    v9[3] = &unk_26523FF58;
    v9[4] = self;
    v9[5] = &v11;
    [v6 audioRoutingRequest:self responseHandler:v9];

    id v4 = (id)v12[5];
  }

  _Block_object_dispose(&v11, 8);

  return v4;
}

void __38__BTAudioRoutingRequest__activateSync__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_BTAudioRoutingRequest <= 90)
  {
    if (gLogCategory_BTAudioRoutingRequest != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      id v5 = v3;
      LogPrintF();
      id v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v5);
}

void __38__BTAudioRoutingRequest__activateSync__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 72);
  *(void *)(v4 + 72) = 0;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v6 = [v8 error];
  if (v6)
  {
    if (gLogCategory_BTAudioRoutingRequest <= 90
      && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v6, v6);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v6, v7);
    }
  }
  else if (gLogCategory_BTAudioRoutingRequest <= 30 {
         && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_handleServerDied
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__BTAudioRoutingRequest__handleServerDied__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __42__BTAudioRoutingRequest__handleServerDied__block_invoke(uint64_t a1)
{
  if (gLogCategory_BTAudioRoutingRequest <= 50
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:AudioAccessorydDiedNotification object:*(void *)(a1 + 32)];
}

- (id)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = self->_testListenerEndpoint;
    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    if (v3) {
      id v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:v3];
    }
    else {
      id v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.BluetoothServices" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    uint64_t v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC93EF8];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__BTAudioRoutingRequest__ensureXPCStarted__block_invoke;
    v11[3] = &unk_26523F8D0;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__BTAudioRoutingRequest__ensureXPCStarted__block_invoke_2;
    v10[3] = &unk_26523F8D0;
    v10[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v10];
    id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC94048];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
  return 0;
}

uint64_t __42__BTAudioRoutingRequest__ensureXPCStarted__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _interrupted];
  id v2 = *(void **)(a1 + 32);

  return [v2 _handleServerDied];
}

unsigned char *__42__BTAudioRoutingRequest__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  [*(id *)(a1 + 32) _invalidated];
  result = *(unsigned char **)(a1 + 32);
  if (!result[8])
  {
    return (unsigned char *)[result _handleServerDied];
  }
  return result;
}

- (void)_interrupted
{
  if (gLogCategory_BTAudioRoutingRequest <= 50
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BTErrorF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(BTAudioRoutingRequest *)self _reportError:v3];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__BTAudioRoutingRequest_invalidate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__BTAudioRoutingRequest_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 8) = 1;
    if (!*(unsigned char *)(*(void *)(result + 32) + 9)
      && gLogCategory_BTAudioRoutingRequest <= 30
      && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = *(id **)(v2 + 32);
    if (v3[2])
    {
      [v3[2] invalidate];
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
      && gLogCategory_BTAudioRoutingRequest <= 50
      && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      uint64_t v7 = (void (**)(id, BTAudioRoutingResponse *))MEMORY[0x24C581450](self->_responseHandler, a2);
      id responseHandler = self->_responseHandler;
      self->_id responseHandler = 0;

      if (v7)
      {
        id v4 = objc_alloc_init(BTAudioRoutingResponse);
        id v5 = BTErrorF();
        [(BTAudioRoutingResponse *)v4 setError:v5];

        v7[2](v7, v4);
      }
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_BTAudioRoutingRequest <= 10
        && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)updateAudioState:(id)a3 withState:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (gLogCategory_BTAudioRoutingRequest <= 50
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    if (v4 > 2) {
      uint64_t v7 = "?";
    }
    else {
      uint64_t v7 = off_26523FF78[(int)v4];
    }
    v12 = v7;
    id v13 = v6;
    uint64_t clientID = self->_clientID;
    LogPrintF();
  }
  id v8 = [(BTAudioRoutingRequest *)self _ensureXPCStarted];
  if (v8)
  {
    if (gLogCategory_BTAudioRoutingRequest > 90
      || gLogCategory_BTAudioRoutingRequest == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_19;
    }
LABEL_12:
    LogPrintF();
    goto LABEL_19;
  }
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __52__BTAudioRoutingRequest_updateAudioState_withState___block_invoke;
    v14[3] = &unk_26523F8F8;
    v14[4] = self;
    v10 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v14];
    [v10 audioStateUpdate:v4 withApps:v6];

    goto LABEL_19;
  }
  if (gLogCategory_BTAudioRoutingRequest <= 90
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_12;
  }
LABEL_19:
}

void __52__BTAudioRoutingRequest_updateAudioState_withState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = v3;
  if (gLogCategory_BTAudioRoutingRequest <= 90)
  {
    if (gLogCategory_BTAudioRoutingRequest != -1 || (int v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      id v5 = v3;
      LogPrintF();
      id v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v5);
}

- (void)_reportError:(id)a3
{
  id v7 = a3;
  if (gLogCategory_BTAudioRoutingRequest <= 90
    && (gLogCategory_BTAudioRoutingRequest != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v4 = (void (**)(void, void))MEMORY[0x24C581450](self->_responseHandler);
  if (v4)
  {
    id responseHandler = self->_responseHandler;
    self->_id responseHandler = 0;

    id v6 = objc_alloc_init(BTAudioRoutingResponse);
    [(BTAudioRoutingResponse *)v6 setError:v7];
    ((void (**)(void, BTAudioRoutingResponse *))v4)[2](v4, v6);
  }
}

- (int)audioScore
{
  return self->_audioScore;
}

- (void)setAudioScore:(int)a3
{
  self->_uint64_t audioScore = a3;
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
}

- (NSString)deviceAddress
{
  return self->_deviceAddress;
}

- (void)setDeviceAddress:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_uint64_t flags = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);

  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end