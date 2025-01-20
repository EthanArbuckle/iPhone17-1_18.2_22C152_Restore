@interface AAAudioSessionControl
+ (BOOL)supportsSecureCoding;
- (AAAudioSessionControl)init;
- (AAAudioSessionControl)initWithCoder:(id)a3;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)description;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (int)conversationDetectSignal;
- (unsigned)clientID;
- (void)_activate:(BOOL)a3;
- (void)_activateDirect:(id)a3;
- (void)_activateXPC:(id)a3 reactivate:(BOOL)a4;
- (void)_interrupted;
- (void)_invalidateDirect;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)invalidate;
- (void)setClientID:(unsigned int)a3;
- (void)setConversationDetectSignal:(int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMuteAction:(int)a3 auditToken:(id *)a4;
- (void)setMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5;
- (void)setTestListenerEndpoint:(id)a3;
@end

@implementation AAAudioSessionControl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAAudioSessionControl)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AAAudioSessionControl *)self init];
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_clientID = 0;
    }
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_conversationDetectSignal = 0;
    }
    v6 = v5;
  }

  return v5;
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
  uint64_t conversationDetectSignal = self->_conversationDetectSignal;
  if (conversationDetectSignal)
  {
    [v7 encodeInteger:conversationDetectSignal forKey:@"cds"];
    id v4 = v7;
  }
}

- (id)description
{
  NSAppendPrintF();
  id v3 = 0;
  id v4 = v3;
  if (self->_direct)
  {
    id v7 = v3;
    NSAppendPrintF_safe();
    id v5 = v7;

    id v4 = v5;
  }

  return v4;
}

- (AAAudioSessionControl)init
{
  v5.receiver = self;
  v5.super_class = (Class)AAAudioSessionControl;
  v2 = [(AAAudioSessionControl *)&v5 init];
  if (v2)
  {
    v2->_uint64_t clientID = AAXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    id v3 = v2;
  }

  return v2;
}

- (void)setConversationDetectSignal:(int)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__AAAudioSessionControl_setConversationDetectSignal___block_invoke;
    v6[3] = &unk_26523F790;
    v6[4] = v4;
    int v7 = a3;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_uint64_t conversationDetectSignal = a3;
  }
  objc_sync_exit(v4);
}

void __53__AAAudioSessionControl_setConversationDetectSignal___block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 24) = *(_DWORD *)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 28))
  {
    v2 = (void *)gAAServicesDaemon;
    objc_msgSend(v2, "updateAudioSessionControl:");
  }
  else
  {
    id v4 = [*(id *)(v1 + 32) remoteObjectProxy];
    [v4 audioSessionControlUpdate:*(void *)(a1 + 32)];
  }
}

- (void)setMuteAction:(int)a3 auditToken:(id *)a4
{
  long long v4 = *(_OWORD *)&a4->var0[4];
  v5[0] = *(_OWORD *)a4->var0;
  v5[1] = v4;
  [(AAAudioSessionControl *)self setMuteAction:*(void *)&a3 auditToken:v5 bundleIdentifier:0];
}

- (void)setMuteAction:(int)a3 auditToken:(id *)a4 bundleIdentifier:(id)a5
{
  id v8 = a5;
  if (gLogCategory_AAAudioSessionControl <= 30
    && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v9 = self;
  objc_sync_enter(v9);
  if (v9->_activateCalled)
  {
    dispatchQueue = v9->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    long long v11 = *(_OWORD *)&a4->var0[4];
    long long v15 = *(_OWORD *)a4->var0;
    block[2] = __67__AAAudioSessionControl_setMuteAction_auditToken_bundleIdentifier___block_invoke;
    block[3] = &unk_26523F7B8;
    block[4] = v9;
    int v14 = a3;
    long long v16 = v11;
    id v13 = v8;
    dispatch_async(dispatchQueue, block);
  }
  else if (gLogCategory_AAAudioSessionControl <= 90 {
         && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  objc_sync_exit(v9);
}

void __67__AAAudioSessionControl_setMuteAction_auditToken_bundleIdentifier___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 28))
  {
    if (gLogCategory_AAAudioSessionControl <= 90
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_AAAudioSessionControl <= 30
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = [*(id *)(*(void *)(a1 + 32) + 32) remoteObjectProxy];
    uint64_t v3 = *(unsigned int *)(a1 + 48);
    uint64_t v4 = *(void *)(a1 + 40);
    long long v5 = *(_OWORD *)(a1 + 68);
    v6[0] = *(_OWORD *)(a1 + 52);
    v6[1] = v5;
    [v2 setMuteAction:v3 auditToken:v6 bundleIdentifier:v4];
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__AAAudioSessionControl_activateWithCompletion___block_invoke;
  v7[3] = &unk_26523F7E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __48__AAAudioSessionControl_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    NSErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAAudioSessionControl <= 90
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
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
    long long v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v6 = *(void **)(a1 + 32);
    [v6 _activate:0];
  }
}

- (void)_activate:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_AAAudioSessionControl <= 30
    && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_testListenerEndpoint) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = gAAServicesDaemon == 0;
  }
  BOOL v6 = !v5;
  self->_direct = v6;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAAudioSessionControl <= 90
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v8 = (void (**)(void, void))MEMORY[0x24C581450](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v8) {
      ((void (**)(void, id))v8)[2](v8, v10);
    }
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __35__AAAudioSessionControl__activate___block_invoke;
    v11[3] = &unk_26523F808;
    v11[4] = self;
    BOOL v12 = v3;
    id v7 = (void *)MEMORY[0x24C581450](v11);
    if (self->_direct) {
      [(AAAudioSessionControl *)self _activateDirect:v7];
    }
    else {
      [(AAAudioSessionControl *)self _activateXPC:v7 reactivate:v3];
    }
  }
}

void __35__AAAudioSessionControl__activate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v10 = v3;
  if (v3)
  {
    id v4 = v3;
    if (gLogCategory_AAAudioSessionControl <= 90)
    {
      if (gLogCategory_AAAudioSessionControl != -1 || (v5 = _LogCategory_Initialize(), id v4 = v10, v5))
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
    if (gLogCategory_AAAudioSessionControl > 30
      || gLogCategory_AAAudioSessionControl == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_17;
    }
  }
  else if (gLogCategory_AAAudioSessionControl > 30 {
         || gLogCategory_AAAudioSessionControl == -1 && !_LogCategory_Initialize())
  }
  {
    goto LABEL_17;
  }
  LogPrintF();
LABEL_17:
  BOOL v6 = (void (**)(void, void))MEMORY[0x24C581450](*(void *)(*(void *)(a1 + 32) + 16));
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0;

  if (v6) {
    v6[2](v6, 0);
  }

LABEL_20:
}

- (void)_activateDirect:(id)a3
{
  id v4 = a3;
  if (gLogCategory_AAAudioSessionControl <= 30
    && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int v5 = (void *)gAAServicesDaemon;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__AAAudioSessionControl__activateDirect___block_invoke;
  v7[3] = &unk_26523F858;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 activateAudioSessionControl:self completion:v7];
}

void __41__AAAudioSessionControl__activateDirect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__AAAudioSessionControl__activateDirect___block_invoke_2;
  v7[3] = &unk_26523F830;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __41__AAAudioSessionControl__activateDirect___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_activateXPC:(id)a3 reactivate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (gLogCategory_AAAudioSessionControl > 30) {
      goto LABEL_15;
    }
    if (gLogCategory_AAAudioSessionControl == -1 && !_LogCategory_Initialize()) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if (gLogCategory_AAAudioSessionControl > 30) {
    goto LABEL_15;
  }
  if (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()) {
LABEL_7:
  }
    LogPrintF();
LABEL_11:
  if (gLogCategory_AAAudioSessionControl <= 30
    && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    uint64_t clientID = self->_clientID;
    LogPrintF();
  }
LABEL_15:
  uint64_t v7 = [(AAAudioSessionControl *)self _ensureXPCStarted];
  if (v7)
  {
    v6[2](v6, v7);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __49__AAAudioSessionControl__activateXPC_reactivate___block_invoke;
    v14[3] = &unk_26523F880;
    BOOL v16 = v4;
    id v9 = v6;
    long long v15 = v9;
    id v10 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v14];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __49__AAAudioSessionControl__activateXPC_reactivate___block_invoke_2;
    v12[3] = &unk_26523F8A8;
    id v13 = v9;
    [v10 audioSessionControlActivate:self completion:v12];
  }
}

void __49__AAAudioSessionControl__activateXPC_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    if (gLogCategory_AAAudioSessionControl <= 30
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_AAAudioSessionControl <= 90 {
         && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

uint64_t __49__AAAudioSessionControl__activateXPC_reactivate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
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
      id v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.AudioAccessoryServices" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    uint64_t v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC937B0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__AAAudioSessionControl__ensureXPCStarted__block_invoke;
    v11[3] = &unk_26523F8D0;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__AAAudioSessionControl__ensureXPCStarted__block_invoke_2;
    v10[3] = &unk_26523F8D0;
    v10[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v10];
    id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC93810];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
  return 0;
}

uint64_t __42__AAAudioSessionControl__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __42__AAAudioSessionControl__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  id v4 = *(void **)(a1 + 32);

  return [v4 _invalidated];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_AAAudioSessionControl <= 50
    && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = BTErrorF();
  [(AAAudioSessionControl *)self _reportError:v3];

  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (self->_activateCalled) {
    [(AAAudioSessionControl *)self _activate:1];
  }
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
  block[2] = __35__AAAudioSessionControl_invalidate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __35__AAAudioSessionControl_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 29))
  {
    *(unsigned char *)(v1 + 29) = 1;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 30)
      && gLogCategory_AAAudioSessionControl <= 30
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v3 + 28))
    {
      [(id)v3 _invalidateDirect];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    if (*(void *)(v3 + 32))
    {
      [*(id *)(v3 + 32) invalidate];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    uint64_t v7 = (void (**)(id, void *))MEMORY[0x24C581450](*(void *)(v3 + 16));
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = 0;

    if (v7)
    {
      id v6 = BTErrorF();
      v7[2](v7, v6);
    }
    [*(id *)(a1 + 32) _invalidated];
  }
}

- (void)_invalidateDirect
{
}

void __42__AAAudioSessionControl__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__AAAudioSessionControl__invalidateDirect__block_invoke_2;
  block[3] = &unk_26523F8D0;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __42__AAAudioSessionControl__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 28) = 0;
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_AAAudioSessionControl <= 50
      && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_direct && !self->_xpcCnx)
    {
      id v8 = (void (**)(id, void *))MEMORY[0x24C581450](self->_activateCompletion, a2);
      id activateCompletion = self->_activateCompletion;
      self->_id activateCompletion = 0;

      if (v8)
      {
        uint64_t v4 = BTErrorF();
        v8[2](v8, v4);
      }
      id v5 = (void (**)(void))MEMORY[0x24C581450](self->_invalidationHandler);
      id invalidationHandler = self->_invalidationHandler;
      self->_id invalidationHandler = 0;

      if (v5) {
        v5[2](v5);
      }
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_AAAudioSessionControl <= 10
        && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)_reportError:(id)a3
{
  id v6 = a3;
  if (gLogCategory_AAAudioSessionControl <= 90
    && (gLogCategory_AAAudioSessionControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v4 = (void (**)(void, void))MEMORY[0x24C581450](self->_activateCompletion);
  id activateCompletion = self->_activateCompletion;
  self->_id activateCompletion = 0;

  if (v4) {
    ((void (**)(void, id))v4)[2](v4, v6);
  }
}

- (int)conversationDetectSignal
{
  return self->_conversationDetectSignal;
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
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end