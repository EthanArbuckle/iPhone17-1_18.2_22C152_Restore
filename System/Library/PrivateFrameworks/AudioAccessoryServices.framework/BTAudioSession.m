@interface BTAudioSession
+ (BOOL)supportsSecureCoding;
- (BOOL)inAppRouting;
- (BTAudioSession)init;
- (BTAudioSession)initWithCoder:(id)a3;
- (NSString)label;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (double)timeoutSeconds;
- (id)_ensureXPCStarted;
- (id)description;
- (id)invalidationHandler;
- (int)audioArbitrationResult;
- (int)category;
- (int)mode;
- (unsigned)clientID;
- (unsigned)flags;
- (void)_activate;
- (void)_interrupted;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setAudioArbitrationResult:(int)a3;
- (void)setCategory:(int)a3;
- (void)setClientID:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setInAppRouting:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMode:(int)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)setTimeoutSeconds:(double)a3;
@end

@implementation BTAudioSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BTAudioSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)BTAudioSession;
  v2 = [(BTAudioSession *)&v5 init];
  if (v2)
  {
    v2->_clientID = BTXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v2->_ucat = (LogCategory *)&gLogCategory_BTAudioSession;
    v3 = v2;
  }

  return v2;
}

- (BTAudioSession)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(BTAudioSession *)self init];
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_category = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_clientID = 0;
    }
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t category = self->_category;
  id v8 = v4;
  if (category)
  {
    [v4 encodeInteger:category forKey:@"cat"];
    id v4 = v8;
  }
  uint64_t clientID = self->_clientID;
  if (clientID)
  {
    [v8 encodeInt64:clientID forKey:@"cid"];
    id v4 = v8;
  }
  label = self->_label;
  if (label)
  {
    [v8 encodeObject:label forKey:@"label"];
    id v4 = v8;
  }
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BTAudioSession;
  [(BTAudioSession *)&v4 dealloc];
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;

  return v2;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];
  LogCategoryReplaceF();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__BTAudioSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_26523F7E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __41__BTAudioSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    NSErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_BTAudioSession <= 90
      && (gLogCategory_BTAudioSession != -1 || _LogCategory_Initialize()))
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
    [v6 _activate];
  }
}

- (void)_activate
{
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  p_timeoutTimer = &self->_timeoutTimer;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    id v6 = timeoutTimer;
    dispatch_source_cancel(v6);
    id v7 = *p_timeoutTimer;
    *p_timeoutTimer = 0;
  }
  dispatch_source_t v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong((id *)&self->_timeoutTimer, v8);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __27__BTAudioSession__activate__block_invoke;
  handler[3] = &unk_26523FFC8;
  handler[4] = v8;
  handler[5] = self;
  dispatch_source_set_event_handler(v8, handler);
  CUDispatchTimerSet();
  dispatch_activate(v8);
  v9 = [(BTAudioSession *)self _ensureXPCStarted];
  if (v9)
  {
    [(BTAudioSession *)self _reportError:v9];
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __27__BTAudioSession__activate__block_invoke_2;
    v13[3] = &unk_26523F8F8;
    v13[4] = self;
    v11 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v13];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __27__BTAudioSession__activate__block_invoke_3;
    v12[3] = &unk_26523F8F8;
    v12[4] = self;
    [v11 audioSessionActivate:self completion:v12];
  }
}

void __27__BTAudioSession__activate__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1 == *(void **)(*(void *)(a1 + 40) + 32))
  {
    if (v1)
    {
      uint64_t v3 = v1;
      dispatch_source_cancel(v3);
      uint64_t v4 = *(void *)(a1 + 40);
      objc_super v5 = *(void **)(v4 + 32);
      *(void *)(v4 + 32) = 0;
    }
    id v6 = *(void **)(a1 + 40);
    BTErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v6 _reportError:v7];
  }
}

void __27__BTAudioSession__activate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(_DWORD ***)(a1 + 32);
  int v5 = *v4[5];
  id v8 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1)
    {
LABEL_3:
      id v7 = v3;
      LogPrintF();
      id v3 = v8;
      uint64_t v4 = *(_DWORD ***)(a1 + 32);
      goto LABEL_6;
    }
    int v6 = _LogCategory_Initialize();
    uint64_t v4 = *(_DWORD ***)(a1 + 32);
    if (v6)
    {
      id v3 = v8;
      goto LABEL_3;
    }
    id v3 = v8;
  }
LABEL_6:
  objc_msgSend(v4, "_reportError:", v3, v7);
}

void __27__BTAudioSession__activate__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v19 = v3;
  if (v3)
  {
    id v5 = v3;
    int v6 = **(_DWORD **)(v4 + 40);
    if (v6 <= 90)
    {
      if (v6 == -1)
      {
        int v13 = _LogCategory_Initialize();
        uint64_t v4 = *(void *)(a1 + 32);
        if (!v13)
        {
          id v5 = v19;
          goto LABEL_12;
        }
        id v5 = v19;
      }
      id v18 = v5;
      LogPrintF();
      id v5 = v19;
      uint64_t v4 = *(void *)(a1 + 32);
    }
LABEL_12:
    objc_msgSend((id)v4, "_reportError:", v5, v18);
    goto LABEL_17;
  }
  id v7 = *(void **)(v4 + 32);
  if (v7)
  {
    id v8 = v7;
    dispatch_source_cancel(v8);
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    *(void *)(v9 + 32) = 0;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  int v12 = **(_DWORD **)(v11 + 40);
  if (v12 <= 30)
  {
    if (v12 != -1 || (v14 = _LogCategory_Initialize(), uint64_t v11 = *(void *)(a1 + 32), v14))
    {
      LogPrintF();
      uint64_t v11 = *(void *)(a1 + 32);
    }
  }
  v15 = (void (**)(void, void))MEMORY[0x24C581450](*(void *)(v11 + 16));
  uint64_t v16 = *(void *)(a1 + 32);
  v17 = *(void **)(v16 + 16);
  *(void *)(v16 + 16) = 0;

  if (v15) {
    v15[2](v15, 0);
  }

LABEL_17:
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
    id v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC93EF8];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __35__BTAudioSession__ensureXPCStarted__block_invoke;
    v11[3] = &unk_26523F8D0;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __35__BTAudioSession__ensureXPCStarted__block_invoke_2;
    v10[3] = &unk_26523F8D0;
    v10[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v10];
    id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC94048];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
  return 0;
}

uint64_t __35__BTAudioSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __35__BTAudioSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

- (void)_interrupted
{
  if (gLogCategory_BTAudioSession <= 50
    && (gLogCategory_BTAudioSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BTErrorF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(BTAudioSession *)self _reportError:v3];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__BTAudioSession_invalidate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __28__BTAudioSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 25)
      && gLogCategory_BTAudioSession <= 30
      && (gLogCategory_BTAudioSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = *(void **)(*(void *)(a1 + 32) + 32);
    if (v3)
    {
      id v4 = v3;
      dispatch_source_cancel(v4);
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = *(void **)(v5 + 32);
      *(void *)(v5 + 32) = 0;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 48);
    if (v8)
    {
      [v8 invalidate];
      uint64_t v7 = *(void *)(a1 + 32);
    }
    int v12 = (void (**)(id, void *))MEMORY[0x24C581450](*(void *)(v7 + 16));
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 16);
    *(void *)(v9 + 16) = 0;

    if (v12)
    {
      uint64_t v11 = BTErrorF();
      v12[2](v12, v11);
    }
    [*(id *)(a1 + 32) _invalidated];
  }
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_BTAudioSession <= 50
      && (gLogCategory_BTAudioSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_xpcCnx)
    {
      uint64_t v11 = (void (**)(id, void *))MEMORY[0x24C581450](self->_activateCompletion, a2);
      id activateCompletion = self->_activateCompletion;
      self->_id activateCompletion = 0;

      if (v11)
      {
        id v4 = BTErrorF();
        v11[2](v11, v4);
      }
      uint64_t v5 = (void (**)(void))MEMORY[0x24C581450](self->_invalidationHandler);
      id invalidationHandler = self->_invalidationHandler;
      self->_id invalidationHandler = 0;

      if (v5) {
        v5[2](v5);
      }
      timeoutTimer = self->_timeoutTimer;
      if (timeoutTimer)
      {
        id v8 = timeoutTimer;
        dispatch_source_cancel(v8);
        uint64_t v9 = self->_timeoutTimer;
        self->_timeoutTimer = 0;
      }
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_BTAudioSession <= 10
        && (gLogCategory_BTAudioSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)_reportError:(id)a3
{
  id v9 = a3;
  if (gLogCategory_BTAudioSession <= 90
    && (gLogCategory_BTAudioSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    uint64_t v5 = timeoutTimer;
    dispatch_source_cancel(v5);
    int v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  uint64_t v7 = (void (**)(void, void))MEMORY[0x24C581450](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v7) {
    ((void (**)(void, id))v7)[2](v7, v9);
  }
}

- (int)audioArbitrationResult
{
  return self->_audioArbitrationResult;
}

- (void)setAudioArbitrationResult:(int)a3
{
  self->_audioArbitrationResult = a3;
}

- (int)category
{
  return self->_category;
}

- (void)setCategory:(int)a3
{
  self->_uint64_t category = a3;
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
  self->_flags = a3;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (BOOL)inAppRouting
{
  return self->_inAppRouting;
}

- (void)setInAppRouting:(BOOL)a3
{
  self->_inAppRouting = a3;
}

- (NSString)label
{
  return self->_label;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_mode = a3;
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
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end