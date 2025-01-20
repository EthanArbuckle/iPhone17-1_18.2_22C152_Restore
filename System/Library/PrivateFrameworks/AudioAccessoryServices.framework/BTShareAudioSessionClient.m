@interface BTShareAudioSessionClient
+ (BOOL)supportsSecureCoding;
- (BTShareAudioSessionClient)init;
- (BTShareAudioSessionClient)initWithCoder:(id)a3;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)progressHandler;
- (int)mode;
- (void)_activate:(BOOL)a3;
- (void)_interrupted;
- (void)_invalidated;
- (void)activate;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setMode:(int)a3;
- (void)setProgressHandler:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)shareAudioProgressEvent:(int)a3 info:(id)a4;
- (void)userConfirmed:(BOOL)a3;
@end

@implementation BTShareAudioSessionClient

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BTShareAudioSessionClient)init
{
  v6.receiver = self;
  v6.super_class = (Class)BTShareAudioSessionClient;
  v2 = [(BTShareAudioSessionClient *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v4 = v3;
  }

  return v3;
}

- (BTShareAudioSessionClient)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(BTShareAudioSessionClient *)self init];
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_mode = 0;
    }
    objc_super v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t mode = self->_mode;
  if (mode) {
    [a3 encodeInteger:mode forKey:@"mode"];
  }
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__BTShareAudioSessionClient_activate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__BTShareAudioSessionClient_activate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 1;
    return [*(id *)(result + 32) _activate:0];
  }
  return result;
}

- (void)_activate:(BOOL)a3
{
  if (a3)
  {
    if (gLogCategory_BTShareAudioSessionClient <= 30
      && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_BTShareAudioSessionClient <= 30 {
         && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  v5 = [(BTShareAudioSessionClient *)self _ensureXPCStarted];
  if (v5)
  {
    if (gLogCategory_BTShareAudioSessionClient <= 90
      && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __39__BTShareAudioSessionClient__activate___block_invoke;
    v10[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
    BOOL v11 = a3;
    v7 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __39__BTShareAudioSessionClient__activate___block_invoke_2;
    v8[3] = &__block_descriptor_33_e17_v16__0__NSError_8l;
    BOOL v9 = a3;
    [v7 shareAudioSessionActivate:self completion:v8];
  }
}

uint64_t __39__BTShareAudioSessionClient__activate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 32))
  {
    if (gLogCategory_BTShareAudioSessionClient <= 90)
    {
      if (gLogCategory_BTShareAudioSessionClient != -1
        || (v7 = v3, v3 = (id)_LogCategory_Initialize(), id v4 = v7, v3))
      {
LABEL_7:
        id v6 = v4;
        id v3 = (id)LogPrintF();
        id v4 = v6;
      }
    }
  }
  else if (gLogCategory_BTShareAudioSessionClient <= 90)
  {
    if (gLogCategory_BTShareAudioSessionClient != -1) {
      goto LABEL_7;
    }
    id v8 = v3;
    id v3 = (id)_LogCategory_Initialize();
    id v4 = v8;
    if (v3) {
      goto LABEL_7;
    }
  }

  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t __39__BTShareAudioSessionClient__activate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (*(unsigned char *)(a1 + 32))
    {
      if (gLogCategory_BTShareAudioSessionClient <= 90)
      {
        id v6 = v3;
        if (gLogCategory_BTShareAudioSessionClient != -1 || (v3 = (id)_LogCategory_Initialize(), id v4 = v6, v3))
        {
LABEL_15:
          id v3 = (id)LogPrintF();
          id v4 = v6;
        }
      }
    }
    else if (gLogCategory_BTShareAudioSessionClient <= 90)
    {
      id v6 = v3;
      if (gLogCategory_BTShareAudioSessionClient != -1) {
        goto LABEL_15;
      }
      id v3 = (id)_LogCategory_Initialize();
      id v4 = v6;
      if (v3) {
        goto LABEL_15;
      }
    }
  }
  else if (*(unsigned char *)(a1 + 32))
  {
    if (gLogCategory_BTShareAudioSessionClient <= 30)
    {
      id v6 = 0;
      if (gLogCategory_BTShareAudioSessionClient != -1) {
        goto LABEL_15;
      }
      id v3 = (id)_LogCategory_Initialize();
      id v4 = 0;
      if (v3) {
        goto LABEL_15;
      }
    }
  }
  else if (gLogCategory_BTShareAudioSessionClient <= 30)
  {
    id v6 = 0;
    if (gLogCategory_BTShareAudioSessionClient != -1) {
      goto LABEL_15;
    }
    id v3 = (id)_LogCategory_Initialize();
    id v4 = 0;
    if (v3) {
      goto LABEL_15;
    }
  }

  return MEMORY[0x270F9A758](v3, v4);
}

- (id)_ensureXPCStarted
{
  if (!self->_xpcCnx)
  {
    id v3 = self->_testListenerEndpoint;
    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    v20 = v3;
    if (v3) {
      v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:v3];
    }
    else {
      v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.BluetoothServices" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    v19 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC93EF8];
    id v7 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    v15 = objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, v12, v13, v14, v18, objc_opt_class(), 0);
    [v19 setClasses:v15 forSelector:sel_shareAudioProgressEvent_info_ argumentIndex:1 ofReply:0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v19];
    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __46__BTShareAudioSessionClient__ensureXPCStarted__block_invoke;
    v22[3] = &unk_26523F8D0;
    v22[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v22];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __46__BTShareAudioSessionClient__ensureXPCStarted__block_invoke_2;
    v21[3] = &unk_26523F8D0;
    v21[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v21];
    v16 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC94048];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v16];

    [(NSXPCConnection *)self->_xpcCnx resume];
    if (gLogCategory_BTShareAudioSessionClient <= 30
      && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return 0;
}

uint64_t __46__BTShareAudioSessionClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __46__BTShareAudioSessionClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_BTShareAudioSessionClient <= 50
    && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = MEMORY[0x24C581450](self->_progressHandler);
  id v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, 30, 0);
  }

  if (self->_activateCalled)
  {
    [(BTShareAudioSessionClient *)self _activate:1];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__BTShareAudioSessionClient_invalidate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__BTShareAudioSessionClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 9))
  {
    uint64_t v2 = result;
    *(unsigned char *)(v1 + 9) = 1;
    if (gLogCategory_BTShareAudioSessionClient <= 30
      && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(id **)(v2 + 32);
    if (v3[2])
    {
      [v3[2] invalidate];
      uint64_t v3 = *(id **)(v2 + 32);
    }
    return [v3 _invalidated];
  }
  return result;
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_BTShareAudioSessionClient <= 50
      && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      uint64_t v3 = MEMORY[0x24C581450](self->_progressHandler);
      id v4 = (void *)v3;
      if (v3) {
        (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, 20, 0);
      }

      id progressHandler = self->_progressHandler;
      self->_id progressHandler = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_BTShareAudioSessionClient <= 10
        && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)userConfirmed:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__BTShareAudioSessionClient_userConfirmed___block_invoke;
  v4[3] = &unk_265240048;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

void __43__BTShareAudioSessionClient_userConfirmed___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    if (gLogCategory_BTShareAudioSessionClient <= 30
      && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
    {
      if (*(unsigned char *)(a1 + 40)) {
        uint64_t v2 = "yes";
      }
      else {
        uint64_t v2 = "no";
      }
      uint64_t v3 = v2;
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "remoteObjectProxy", v3);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [v4 shareAudioUserConfirmed:*(unsigned __int8 *)(a1 + 40)];
  }
  else if (gLogCategory_BTShareAudioSessionClient <= 90 {
         && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)shareAudioProgressEvent:(int)a3 info:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_BTShareAudioSessionClient <= 30
    && (gLogCategory_BTShareAudioSessionClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v6 = MEMORY[0x24C581450](self->_progressHandler);
  id v7 = (void *)v6;
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v4, v8);
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_uint64_t mode = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
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
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end