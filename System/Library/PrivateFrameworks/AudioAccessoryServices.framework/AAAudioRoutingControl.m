@interface AAAudioRoutingControl
+ (BOOL)supportsSecureCoding;
- (AAAudioRoutingControl)init;
- (AAAudioRoutingControl)initWithCoder:(id)a3;
- (NSString)appBundleID;
- (NSString)deviceAddress;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)description;
- (unsigned)clientID;
- (void)_activate;
- (void)_activateDirect:(id)a3;
- (void)_activateXPC:(id)a3;
- (void)_handleServerDied;
- (void)_interrupted;
- (void)_invalidateDirect;
- (void)_invalidated;
- (void)_reportError:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)hrmSessionStateChanged:(BOOL)a3 completion:(id)a4;
- (void)invalidate;
- (void)setAppBundleID:(id)a3;
- (void)setArbitrationBlockingModeWithCompletion:(BOOL)a3 completion:(id)a4;
- (void)setClientID:(unsigned int)a3;
- (void)setDeviceAddress:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setTestListenerEndpoint:(id)a3;
@end

@implementation AAAudioRoutingControl

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AAAudioRoutingControl)init
{
  v5.receiver = self;
  v5.super_class = (Class)AAAudioRoutingControl;
  v2 = [(AAAudioRoutingControl *)&v5 init];
  if (v2)
  {
    v2->_clientID = AAXPCGetNextClientID();
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    v3 = v2;
  }

  return v2;
}

- (AAAudioRoutingControl)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(AAAudioRoutingControl *)self init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_clientID = 0;
    }
    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  appBundleID = self->_appBundleID;
  id v8 = v4;
  if (appBundleID)
  {
    [v4 encodeObject:appBundleID forKey:@"aid"];
    id v4 = v8;
  }
  uint64_t clientID = self->_clientID;
  if (clientID)
  {
    [v8 encodeInt64:clientID forKey:@"cid"];
    id v4 = v8;
  }
  deviceAddress = self->_deviceAddress;
  if (deviceAddress)
  {
    [v8 encodeObject:deviceAddress forKey:@"dAdr"];
    id v4 = v8;
  }
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;

  return v2;
}

- (void)hrmSessionStateChanged:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (self->_activateCalled)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __59__AAAudioRoutingControl_hrmSessionStateChanged_completion___block_invoke;
    block[3] = &unk_265240070;
    block[4] = self;
    id v10 = v6;
    BOOL v11 = a3;
    dispatch_async(dispatchQueue, block);
  }
}

void __59__AAAudioRoutingControl_hrmSessionStateChanged_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    if (gLogCategory_AAAudioRoutingControl <= 90
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_AAAudioRoutingControl <= 30
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v2 = *(void **)(*(void *)(a1 + 32) + 32);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __59__AAAudioRoutingControl_hrmSessionStateChanged_completion___block_invoke_2;
    v4[3] = &unk_26523F8A8;
    id v5 = *(id *)(a1 + 40);
    v3 = [v2 remoteObjectProxyWithErrorHandler:v4];
    [v3 activeHRMSessionChanged:*(void *)(a1 + 32) hrmState:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 40)];
  }
}

uint64_t __59__AAAudioRoutingControl_hrmSessionStateChanged_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__AAAudioRoutingControl_activateWithCompletion___block_invoke;
  v7[3] = &unk_26523F7E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __48__AAAudioRoutingControl_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 8))
  {
    NSErrorF();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAAudioRoutingControl <= 90
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
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
    id v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    id v6 = *(void **)(a1 + 32);
    [v6 _activate];
  }
}

- (void)_activate
{
  if (gLogCategory_AAAudioRoutingControl <= 30
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_testListenerEndpoint) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = gAAServicesDaemon == 0;
  }
  BOOL v4 = !v3;
  self->_direct = v4;
  if (gLogCategory_AAAudioRoutingControl <= 30
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_AAAudioRoutingControl <= 90
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v6 = (void (**)(void, void))MEMORY[0x24C581450](self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v6) {
      ((void (**)(void, id))v6)[2](v6, v8);
    }
  }
  else
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __34__AAAudioRoutingControl__activate__block_invoke;
    v9[3] = &unk_26523F8F8;
    v9[4] = self;
    id v5 = (void *)MEMORY[0x24C581450](v9);
    if (self->_direct) {
      [(AAAudioRoutingControl *)self _activateDirect:v5];
    }
    else {
      [(AAAudioRoutingControl *)self _activateXPC:v5];
    }
  }
}

void __34__AAAudioRoutingControl__activate__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = v3;
  if (v3)
  {
    if (gLogCategory_AAAudioRoutingControl <= 90
      && ((id v4 = v3, gLogCategory_AAAudioRoutingControl != -1) || (v8 = _LogCategory_Initialize(), id v4 = v11, v8)))
    {
      id v10 = v4;
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v11, v10);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v11, v9);
    }
  }
  else
  {
    id v5 = (void (**)(void, void))MEMORY[0x24C581450](*(void *)(*(void *)(a1 + 32) + 16));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 16);
    *(void *)(v6 + 16) = 0;

    if (v5) {
      v5[2](v5, 0);
    }
  }
}

- (void)_activateDirect:(id)a3
{
  id v4 = a3;
  if (gLogCategory_AAAudioRoutingControl <= 30
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v5 = (void *)gAAServicesDaemon;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__AAAudioRoutingControl__activateDirect___block_invoke;
  v7[3] = &unk_26523F858;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 activateAudioRoutingControl:self completion:v7];
}

void __41__AAAudioRoutingControl__activateDirect___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__AAAudioRoutingControl__activateDirect___block_invoke_2;
  v7[3] = &unk_26523F830;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __41__AAAudioRoutingControl__activateDirect___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_activateXPC:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if (gLogCategory_AAAudioRoutingControl <= 30
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    uint64_t clientID = self->_clientID;
    LogPrintF();
  }
  id v5 = [(AAAudioRoutingControl *)self _ensureXPCStarted];
  if (v5)
  {
    v4[2](v4, v5);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __38__AAAudioRoutingControl__activateXPC___block_invoke;
    v12[3] = &unk_26523F8A8;
    id v7 = v4;
    v13 = v7;
    id v8 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v12];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __38__AAAudioRoutingControl__activateXPC___block_invoke_2;
    v10[3] = &unk_26523F8A8;
    id v11 = v7;
    [v8 audioRoutingControlActivate:self completion:v10];
  }
}

void __38__AAAudioRoutingControl__activateXPC___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_AAAudioRoutingControl <= 90
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

uint64_t __38__AAAudioRoutingControl__activateXPC___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setArbitrationBlockingModeWithCompletion:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  if (gLogCategory_AAAudioRoutingControl <= 30
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    id v7 = "no";
    if (v4) {
      id v7 = "yes";
    }
    uint64_t clientID = self->_clientID;
    appBundleID = self->_appBundleID;
    v12 = v7;
    LogPrintF();
  }
  id v8 = [(AAAudioRoutingControl *)self _ensureXPCStarted];
  if (v8)
  {
    if (gLogCategory_AAAudioRoutingControl <= 90
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v6[2](v6, v8);
  }
  else
  {
    if (!self->_xpcCnx
      && gLogCategory_AAAudioRoutingControl <= 90
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __77__AAAudioRoutingControl_setArbitrationBlockingModeWithCompletion_completion___block_invoke;
    v17[3] = &unk_26523F8A8;
    id v10 = v6;
    v18 = v10;
    id v11 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v17];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __77__AAAudioRoutingControl_setArbitrationBlockingModeWithCompletion_completion___block_invoke_2;
    v15[3] = &unk_26523F8A8;
    v16 = v10;
    [v11 setHijackBlockingMode:self mode:v4 completion:v15];
  }
}

void __77__AAAudioRoutingControl_setArbitrationBlockingModeWithCompletion_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogCategory_AAAudioRoutingControl <= 90
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

uint64_t __77__AAAudioRoutingControl_setArbitrationBlockingModeWithCompletion_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleServerDied
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__AAAudioRoutingControl__handleServerDied__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __42__AAAudioRoutingControl__handleServerDied__block_invoke(uint64_t a1)
{
  if (gLogCategory_AAAudioRoutingControl <= 50
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:AAAudioRoutingControlAudioAccessorydDiedNotification object:*(void *)(a1 + 32)];
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
    id v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC937B0];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__AAAudioRoutingControl__ensureXPCStarted__block_invoke;
    v11[3] = &unk_26523F8D0;
    v11[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v11];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __42__AAAudioRoutingControl__ensureXPCStarted__block_invoke_2;
    v10[3] = &unk_26523F8D0;
    void v10[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v10];
    id v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26FC93810];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v8];

    [(NSXPCConnection *)self->_xpcCnx resume];
  }
  return 0;
}

uint64_t __42__AAAudioRoutingControl__ensureXPCStarted__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _interrupted];
  id v2 = *(void **)(a1 + 32);

  return [v2 _handleServerDied];
}

unsigned char *__42__AAAudioRoutingControl__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  [*(id *)(a1 + 32) _invalidated];
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (!result[25])
  {
    return (unsigned char *)[result _handleServerDied];
  }
  return result;
}

- (void)_interrupted
{
  if (gLogCategory_AAAudioRoutingControl <= 50
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BTErrorF();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(AAAudioRoutingControl *)self _reportError:v3];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__AAAudioRoutingControl_invalidate__block_invoke;
  block[3] = &unk_26523F8D0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __35__AAAudioRoutingControl_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 25))
  {
    *(unsigned char *)(v1 + 25) = 1;
    if (!*(unsigned char *)(*(void *)(a1 + 32) + 26)
      && gLogCategory_AAAudioRoutingControl <= 30
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v3 + 24))
    {
      [(id)v3 _invalidateDirect];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    if (*(void *)(v3 + 32))
    {
      [*(id *)(v3 + 32) invalidate];
      uint64_t v3 = *(void *)(a1 + 32);
    }
    id v7 = (void (**)(id, void *))MEMORY[0x24C581450](*(void *)(v3 + 16));
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

void __42__AAAudioRoutingControl__invalidateDirect__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__AAAudioRoutingControl__invalidateDirect__block_invoke_2;
  block[3] = &unk_26523F8D0;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __42__AAAudioRoutingControl__invalidateDirect__block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  return [*(id *)(a1 + 32) _invalidated];
}

- (void)_invalidated
{
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_AAAudioRoutingControl <= 50
      && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_direct && !self->_xpcCnx)
    {
      id v6 = (void (**)(id, void *))MEMORY[0x24C581450](self->_activateCompletion, a2);
      id activateCompletion = self->_activateCompletion;
      self->_id activateCompletion = 0;

      if (v6)
      {
        uint64_t v4 = BTErrorF();
        v6[2](v6, v4);
      }
      xpcCnx = self->_xpcCnx;
      self->_xpcCnx = 0;

      self->_invalidateDone = 1;
      if (gLogCategory_AAAudioRoutingControl <= 10
        && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

- (void)_reportError:(id)a3
{
  id v6 = a3;
  if (gLogCategory_AAAudioRoutingControl <= 90
    && (gLogCategory_AAAudioRoutingControl != -1 || _LogCategory_Initialize()))
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
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_deviceAddress, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end