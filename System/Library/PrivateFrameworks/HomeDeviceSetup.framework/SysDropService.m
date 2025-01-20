@interface SysDropService
+ (OS_os_log)signpostLog;
- (BOOL)serviceStartedFromSetup;
- (OS_dispatch_queue)dispatchQueue;
- (SFService)sfService;
- (SFSession)sfSession;
- (SysDropService)init;
- (id)peerEventHandler;
- (unint64_t)signpostID;
- (void)_activate;
- (void)_cleanup;
- (void)_handleAirDropRequest:(id)a3 responseHandler:(id)a4;
- (void)_handlePreCheckRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleRawRequest:(id)a3 flags:(unsigned int)a4 responseHandler:(id)a5;
- (void)_handleSessionEnded:(id)a3;
- (void)_handleSessionStarted:(id)a3;
- (void)_invalidate;
- (void)_sendSysdiagnosePeerUpdate:(unsigned int)a3 inError:(id)a4;
- (void)_sfServiceStart;
- (void)activate;
- (void)dealloc;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setPeerEventHandler:(id)a3;
- (void)setServiceStartedFromSetup:(BOOL)a3;
- (void)setSfService:(id)a3;
- (void)setSfSession:(id)a3;
@end

@implementation SysDropService

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__SysDropService_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_3[0] != -1) {
    dispatch_once(signpostLog_onceToken_3, block);
  }
  v2 = (void *)signpostLog_log_3;
  return (OS_os_log *)v2;
}

void __29__SysDropService_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.HomeDeviceSetup.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_3;
  signpostLog_log_3 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (SysDropService)init
{
  v6.receiver = self;
  v6.super_class = (Class)SysDropService;
  v2 = [(SysDropService *)&v6 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    if (gLogCategory_SysDropService <= 30
      && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return v2;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    uint64_t v3 = (SysDropService *)FatalErrorF();
    [(SysDropService *)v3 _cleanup];
  }
  else
  {
    [(SysDropService *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SysDropService;
    [(SysDropService *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  sfService = self->_sfService;
  self->_sfService = 0;

  sysdropInterface = self->_sysdropInterface;
  self->_sysdropInterface = 0;

  id peerEventHandler = self->_peerEventHandler;
  self->_id peerEventHandler = 0;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__SysDropService_activate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SysDropService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SysDropService <= 30
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  v2 = *(void **)(a1 + 32);
  return [v2 _activate];
}

- (void)_activate
{
  self->_advertiseFast = CFPrefs_GetInt64() != 0;
  [(SysDropService *)self _sfServiceStart];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__SysDropService_invalidate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SysDropService_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_SysDropService <= 30
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  sysdropInterface = self->_sysdropInterface;
  if (sysdropInterface)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __29__SysDropService__invalidate__block_invoke;
    v6[3] = &unk_26503F7B8;
    v6[4] = self;
    [(SBSSysdiagnoseInterface *)sysdropInterface cancelSysdiagnose:v6];
  }
  if (!self->_serviceStartedFromSetup)
  {
    if (self->_sfSession) {
      -[SysDropService _handleSessionEnded:](self, "_handleSessionEnded:");
    }
    [(SFService *)self->_sfService invalidate];
  }
  [(SFSession *)self->_sfSession deregisterRequestID:@"sysdrop_check"];
  [(SFSession *)self->_sfSession deregisterRequestID:@"sysdrop_ad"];
  fileTransferSession = self->_fileTransferSession;
  if (fileTransferSession)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __29__SysDropService__invalidate__block_invoke_2;
    v5[3] = &unk_26503F6A8;
    v5[4] = self;
    [(HDSFileTransfer *)fileTransferSession invalidate:v5];
  }
  [(SysDropService *)self _cleanup];
}

void __29__SysDropService__invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (v5
    && gLogCategory_SysDropService <= 60
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  SEL v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = 0;

  *(_DWORD *)(*(void *)(a1 + 32) + 12) = 0;
}

void __29__SysDropService__invalidate__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  *(void *)(v1 + 48) = 0;
}

- (void)_sendSysdiagnosePeerUpdate:(unsigned int)a3 inError:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v17[3] = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = [(SFSession *)self->_sfSession peer];
  if (v7 && (id v8 = self->_peerEventHandler, v7, v8))
  {
    id peerEventHandler = (void (**)(id, void *))self->_peerEventHandler;
    v16[0] = @"sysdrop_sys_update";
    v10 = [NSNumber numberWithUnsignedInt:v4];
    v17[0] = v10;
    v16[1] = @"sd_sys_ec";
    v11 = NSNumber;
    if (v6) {
      uint64_t v12 = [v6 code];
    }
    else {
      uint64_t v12 = 0;
    }
    v13 = [v11 numberWithInteger:v12];
    v17[1] = v13;
    v16[2] = @"sd_sys_ed";
    if (v6)
    {
      v14 = [v6 domain];
    }
    else
    {
      v14 = @"NoDomain";
    }
    v17[2] = v14;
    v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
    peerEventHandler[2](peerEventHandler, v15);

    if (v6) {
  }
    }
  else if (gLogCategory_SysDropService <= 30 {
         && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (void)_sfServiceStart
{
  if (gLogCategory_SysDropService <= 30
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_sfService && self->_sfSession)
  {
    -[SysDropService _handleSessionStarted:](self, "_handleSessionStarted:");
  }
  else
  {
    uint64_t v3 = (SFService *)objc_alloc_init(MEMORY[0x263F6C2B0]);
    sfService = self->_sfService;
    self->_sfService = v3;

    if (self->_advertiseFast) {
      [(SFService *)self->_sfService setAdvertiseRate:50];
    }
    [(SFService *)self->_sfService setDispatchQueue:self->_dispatchQueue];
    [(SFService *)self->_sfService setIdentifier:*MEMORY[0x263F6C390]];
    [(SFService *)self->_sfService setLabel:@"SysDrop"];
    if (SFDeviceModelCodeGet()) {
      uint64_t v5 = 33;
    }
    else {
      uint64_t v5 = 11;
    }
    [(SFService *)self->_sfService setDeviceActionType:v5];
    [(SFService *)self->_sfService setSessionFlags:1];
    [(SFService *)self->_sfService setTouchRemoteEnabled:1];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __33__SysDropService__sfServiceStart__block_invoke;
    v10[3] = &unk_26503FDD8;
    v10[4] = self;
    [(SFService *)self->_sfService setSessionStartedHandler:v10];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __33__SysDropService__sfServiceStart__block_invoke_42;
    v9[3] = &unk_26503FE00;
    v9[4] = self;
    [(SFService *)self->_sfService setSessionEndedHandler:v9];
    [(SFService *)self->_sfService setSessionSecuredHandler:&__block_literal_global_8];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __33__SysDropService__sfServiceStart__block_invoke_2;
    v8[3] = &unk_26503FE28;
    v8[4] = self;
    [(SFService *)self->_sfService setReceivedRequestHandler:v8];
    id v6 = self->_sfService;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __33__SysDropService__sfServiceStart__block_invoke_3;
    v7[3] = &unk_26503F7B8;
    v7[4] = self;
    [(SFService *)v6 activateWithCompletion:v7];
  }
}

void __33__SysDropService__sfServiceStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() signpostLog];
  uint64_t v5 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SetupSession", "", v7, 2u);
    }
  }

  [*(id *)(a1 + 32) _handleSessionStarted:v3];
}

void __33__SysDropService__sfServiceStart__block_invoke_42(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() signpostLog];
  uint64_t v5 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SetupSession", "", v7, 2u);
    }
  }

  [*(id *)(a1 + 32) _handleSessionEnded:v3];
}

uint64_t __33__SysDropService__sfServiceStart__block_invoke_44(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_SysDropService <= 30)
  {
    id v6 = v2;
    if (gLogCategory_SysDropService != -1 || (v2 = (id)_LogCategory_Initialize(), id v3 = v6, v2))
    {
      uint64_t v5 = [v3 identifier];
      LogPrintF();

      id v3 = v6;
    }
  }
  return MEMORY[0x270F9A758](v2, v3);
}

uint64_t __33__SysDropService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRawRequest:flags:responseHandler:", a4, a3);
}

void __33__SysDropService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() signpostLog];
  uint64_t v5 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SFServiceStart", "", buf, 2u);
    }
  }

  id v7 = v3;
  if (v7
    && gLogCategory_SysDropService <= 90
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    id v8 = [v7 localizedDescription];
    LogPrintF();
  }
}

- (void)_handleSessionStarted:(id)a3
{
  id v5 = a3;
  p_sfSession = &self->_sfSession;
  if (self->_sfSession && !self->_serviceStartedFromSetup)
  {
    if (gLogCategory_SysDropService <= 60
      && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
    {
      id v7 = [v5 peer];
      v11 = [(SFSession *)*p_sfSession peer];
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SysDropService <= 30
      && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
    {
      v10 = [v5 peer];
      LogPrintF();
    }
    objc_storeStrong((id *)&self->_sfSession, a3);
    sfSession = self->_sfSession;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __40__SysDropService__handleSessionStarted___block_invoke;
    v13[3] = &unk_26503FC98;
    v13[4] = self;
    [(SFSession *)sfSession registerRequestID:@"sysdrop_check" options:&unk_26F260E88 handler:v13];
    v9 = self->_sfSession;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __40__SysDropService__handleSessionStarted___block_invoke_2;
    v12[3] = &unk_26503FC98;
    v12[4] = self;
    [(SFSession *)v9 registerRequestID:@"sysdrop_ad" options:&unk_26F260E88 handler:v12];
  }
}

uint64_t __40__SysDropService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePreCheckRequest:responseHandler:");
}

uint64_t __40__SysDropService__handleSessionStarted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAirDropRequest:responseHandler:");
}

- (void)_handleSessionEnded:(id)a3
{
  sfSession = (SFSession *)a3;
  id v5 = sfSession;
  if (self->_sfSession == sfSession)
  {
    id v8 = sfSession;
    if (sfSession)
    {
      if (gLogCategory_SysDropService <= 30)
      {
        if (gLogCategory_SysDropService != -1 || (int v6 = _LogCategory_Initialize(), sfSession = self->_sfSession, v6))
        {
          id v7 = [(SFSession *)sfSession peer];
          LogPrintF();

          sfSession = self->_sfSession;
        }
      }
    }
    else
    {
      sfSession = 0;
    }
    self->_sfSession = 0;

    id v5 = v8;
  }
  MEMORY[0x270F9A758](sfSession, v5);
}

- (void)_handleAirDropRequest:(id)a3 responseHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gLogCategory_SysDropService <= 30
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  id v7 = CFDictionaryGetTypedValue();
  if (gLogCategory_SysDropService <= 30
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v8);
}

- (void)_handlePreCheckRequest:(id)a3 responseHandler:(id)a4
{
  v14 = (char *)a3;
  id v6 = (void (**)(id, NSError *, void, id))a4;
  if (gLogCategory_SysDropService <= 30
    && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
  {
    v13 = v14;
    LogPrintF();
  }
  BOOL companionCanRPFileTransfer = CFDictionaryGetInt64() != 0;
  self->_BOOL companionCanRPFileTransfer = companionCanRPFileTransfer;
  if (gLogCategory_SysDropService <= 30)
  {
    if (gLogCategory_SysDropService == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_12;
      }
      BOOL companionCanRPFileTransfer = self->_companionCanRPFileTransfer;
    }
    if (companionCanRPFileTransfer) {
      id v8 = "yes";
    }
    else {
      id v8 = "no";
    }
    v13 = v8;
    LogPrintF();
  }
LABEL_12:
  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t sysdiagnoseStatus = self->_sysdiagnoseStatus;
  if (!sysdiagnoseStatus)
  {
    [(SysDropService *)self _sysdiagnoseStart];
    uint64_t sysdiagnoseStatus = self->_sysdiagnoseStatus;
  }
  v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", sysdiagnoseStatus, v13);
  [v9 setObject:v11 forKeyedSubscript:@"sd_status"];

  [v9 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"sd_rpft_cap"];
  if (gLogCategory_SysDropService <= 30)
  {
    if (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (gLogCategory_SysDropService <= 30
      && (gLogCategory_SysDropService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (self->_sysdiagnoseStatus == 3) {
    preCheckError = self->_preCheckError;
  }
  else {
    preCheckError = 0;
  }
  v6[2](v6, preCheckError, 0, v9);
}

- (void)_handleRawRequest:(id)a3 flags:(unsigned int)a4 responseHandler:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v19[1] = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, uint64_t, void *, void))a5;
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SysDropService <= 50)
  {
    unsigned __int8 v8 = Int64Ranged;
    if (gLogCategory_SysDropService != -1 || _LogCategory_Initialize())
    {
      uint64_t v16 = v8;
      uint64_t v17 = 0;
      LogPrintF();
    }
  }
  id v9 = (void *)MEMORY[0x263F087E8];
  uint64_t v10 = *MEMORY[0x263F08410];
  uint64_t v18 = *MEMORY[0x263F08320];
  uint64_t v11 = [NSString stringWithUTF8String:DebugGetErrorString()];
  uint64_t v12 = (void *)v11;
  v13 = @"?";
  if (v11) {
    v13 = (__CFString *)v11;
  }
  v19[0] = v13;
  v14 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, &v18, 1, v16, v17);
  v15 = [v9 errorWithDomain:v10 code:-6732 userInfo:v14];
  v6[2](v6, v5, v15, 0);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)peerEventHandler
{
  return self->_peerEventHandler;
}

- (void)setPeerEventHandler:(id)a3
{
}

- (SFService)sfService
{
  return self->_sfService;
}

- (void)setSfService:(id)a3
{
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
}

- (BOOL)serviceStartedFromSetup
{
  return self->_serviceStartedFromSetup;
}

- (void)setServiceStartedFromSetup:(BOOL)a3
{
  self->_serviceStartedFromSetup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong(&self->_peerEventHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
  objc_storeStrong((id *)&self->_targetID, 0);
  objc_storeStrong((id *)&self->_preCheckError, 0);
  objc_storeStrong((id *)&self->_sysdropInterface, 0);
  objc_storeStrong((id *)&self->_sysdiagnosePathURL, 0);
}

@end