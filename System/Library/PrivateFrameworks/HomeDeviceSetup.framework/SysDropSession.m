@interface SysDropSession
+ (OS_os_log)signpostLog;
- (BOOL)startedFromSetup;
- (BOOL)sysDropActivated;
- (BOOL)sysDropFailed;
- (NSError)setupError;
- (OS_dispatch_queue)dispatchQueue;
- (SFDevice)peerDevice;
- (SFSession)sfSession;
- (SysDropSession)init;
- (id)_getAirDropDiscoverableMode;
- (id)_getAirDropID;
- (id)createSysDropAirDropEvent:(unsigned int)a3 error:(id)a4;
- (id)createSysDropRPFileTransferEvent:(unsigned int)a3 error:(id)a4 fileTransferProgress:(id)a5;
- (id)createSysDropSysDiagnoseEvent:(id)a3;
- (id)fileTransferredSysDiagnosePath;
- (id)progressHandler;
- (id)sysdropFinishedHandler;
- (int)_runAirDrop;
- (int)_runFileTransferComplete;
- (int)_runPreCheck;
- (int)_runReceiveRPFileTransferSysdiagnose;
- (int)_runSFSessionStart;
- (int)_runSysdiagnose;
- (int)_setupHandlers;
- (unint64_t)signpostID;
- (void)_activate;
- (void)_cleanup;
- (void)_cleanupSession;
- (void)_invalidate;
- (void)_reportError:(id)a3 label:(id)a4;
- (void)_run;
- (void)_runPreCheckRequest;
- (void)_runPreCheckResponse:(id)a3 error:(id)a4;
- (void)activate;
- (void)dealloc;
- (void)disconnect;
- (void)discoveryControllerLegacyModePropertiesDidChange:(id)a3;
- (void)discoveryControllerSettingsDidChange:(id)a3;
- (void)discoveryControllerVisibilityDidChange:(id)a3;
- (void)enableAirDropForEveryone;
- (void)fileTransferCompleted:(id)a3;
- (void)handlePeerEvent:(id)a3 flags:(unsigned int)a4;
- (void)invalidate;
- (void)setDispatchQueue:(id)a3;
- (void)setPeerDevice:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setSetupError:(id)a3;
- (void)setSfSession:(id)a3;
- (void)setStartedFromSetup:(BOOL)a3;
- (void)setSysDropFailed:(BOOL)a3;
- (void)setSysdropFinishedHandler:(id)a3;
- (void)startAirDropSysdiagnose;
- (void)sysdiagnoseCompleted;
@end

@implementation SysDropSession

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__SysDropSession_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken != -1) {
    dispatch_once(&signpostLog_onceToken, block);
  }
  v2 = (void *)signpostLog_log;
  return (OS_os_log *)v2;
}

void __29__SysDropSession_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.HomeDeviceSetup.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log;
  signpostLog_log = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (SysDropSession)init
{
  v9.receiver = self;
  v9.super_class = (Class)SysDropSession;
  v2 = [(SysDropSession *)&v9 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_proxSetupActiveToken = -1;
    v5 = (SFAirDropDiscoveryController *)objc_alloc_init(getSFAirDropDiscoveryControllerClass());
    airDropController = v2->_airDropController;
    v2->_airDropController = v5;

    [(SFAirDropDiscoveryController *)v2->_airDropController setDelegate:v2];
    v7 = v2;
  }

  return v2;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    uint64_t v3 = (SysDropSession *)FatalErrorF();
    [(SysDropSession *)v3 _cleanup];
  }
  else
  {
    [(SysDropSession *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)SysDropSession;
    [(SysDropSession *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  [(SysDropSession *)self _cleanupSession];
  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  }
  self->_progressHandler = 0;
}

- (void)_cleanupSession
{
  if (!self->_startedFromSetup)
  {
    [(SFSession *)self->_sfSession invalidate];
    sfSession = self->_sfSession;
    self->_sfSession = 0;
  }
}

- (BOOL)sysDropActivated
{
  return self->_activateCalled;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__SysDropSession_activate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SysDropSession_activate__block_invoke(uint64_t a1)
{
  os_log_t v1 = *(unsigned char **)(a1 + 32);
  if (v1[8]) {
    return [v1 _run];
  }
  else {
    return [v1 _activate];
  }
}

- (void)_activate
{
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_activateCalled = 1;
  self->_startTicks = mach_absolute_time();
  notify_register_check("com.apple.sharing.wha-prox-setup", &self->_proxSetupActiveToken);
  notify_set_state(self->_proxSetupActiveToken, 1uLL);
  notify_post("com.apple.sharing.wha-prox-setup");
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SysDropSession *)self _run];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__SysDropSession_invalidate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SysDropSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  [(SysDropSession *)self _cleanup];
}

- (void)disconnect
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__SysDropSession_disconnect__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __28__SysDropSession_disconnect__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 160) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 160);
  *(void *)(v2 + 160) = 0;
}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    int v3 = [(SysDropSession *)self _runSFSessionStart];
    if (v3 == 4 || v3 == 2)
    {
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        v10 = [(SFSession *)self->_sfSession identifier];
        LogPrintF();
      }
      SEL v4 = [(SFSession *)self->_sfSession identifier];

      if (v4)
      {
        int v5 = [(SysDropSession *)self _setupHandlers];
        if (v5 == 4 || v5 == 2)
        {
          int v6 = [(SysDropSession *)self _runPreCheck];
          if (v6 == 4 || v6 == 2)
          {
            if (self->_sysdiagnoseDone
              || (int v9 = [(SysDropSession *)self _runSysdiagnose], v9 == 4)
              || v9 == 2)
            {
              if (_os_feature_enabled_impl() && self->_homePodCanRPFileTransfer)
              {
                int v7 = [(SysDropSession *)self _runReceiveRPFileTransferSysdiagnose];
                if (v7 != 2 && v7 != 4) {
                  return;
                }
              }
              else
              {
                int v8 = [(SysDropSession *)self _runAirDrop];
                if (v8 != 4 && v8 != 2) {
                  return;
                }
              }
              [(SysDropSession *)self _runFileTransferComplete];
            }
          }
        }
      }
    }
  }
}

- (int)_runSFSessionStart
{
  int sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4 && sfSessionState != 2)
  {
    if (sfSessionState)
    {
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SysDropSession > 30) {
        goto LABEL_14;
      }
      if (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (!self->_sfSessionState)
      {
LABEL_14:
        int v5 = [(id)objc_opt_class() signpostLog];
        unint64_t v6 = [(SysDropSession *)self signpostID];
        if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v7 = v6;
          if (os_signpost_enabled(v5))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SFSessionStart", "", buf, 2u);
          }
        }
      }
      self->_int sfSessionState = 1;
      if (self->_sfSession)
      {
        if (gLogCategory_SysDropSession <= 30
          && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_int sfSessionState = 4;
      }
      else
      {
        [0 invalidate];
        int v8 = (SFSession *)objc_alloc_init(MEMORY[0x263F6C2B8]);
        sfSession = self->_sfSession;
        self->_sfSession = v8;

        [(SFSession *)self->_sfSession setDispatchQueue:self->_dispatchQueue];
        [(SFSession *)self->_sfSession setLabel:@"SysDrop"];
        [(SFSession *)self->_sfSession setPeerDevice:self->_peerDevice];
        [(SFSession *)self->_sfSession setServiceIdentifier:*MEMORY[0x263F6C390]];
        [(SFSession *)self->_sfSession setSessionFlags:1];
        v15[0] = MEMORY[0x263EF8330];
        v15[1] = 3221225472;
        v15[2] = __36__SysDropSession__runSFSessionStart__block_invoke;
        v15[3] = &unk_26503F7B8;
        v15[4] = self;
        [(SFSession *)self->_sfSession setErrorHandler:v15];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __36__SysDropSession__runSFSessionStart__block_invoke_2;
        v14[3] = &unk_26503F6A8;
        v14[4] = self;
        [(SFSession *)self->_sfSession setInterruptionHandler:v14];
        v10 = self->_sfSession;
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __36__SysDropSession__runSFSessionStart__block_invoke_3;
        v13[3] = &unk_26503F7B8;
        v13[4] = self;
        [(SFSession *)v10 activateWithCompletion:v13];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __36__SysDropSession__runSFSessionStart__block_invoke_42;
        v12[3] = &unk_26503F608;
        v12[4] = self;
        [(SFSession *)self->_sfSession setReceivedObjectHandler:v12];
      }
    }
  }
  return self->_sfSessionState;
}

uint64_t __36__SysDropSession__runSFSessionStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _reportError:a2 label:@"SFSessionError"];
}

void __36__SysDropSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  os_log_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F08410];
  uint64_t v9 = *MEMORY[0x263F08320];
  uint64_t v4 = [NSString stringWithUTF8String:DebugGetErrorString()];
  int v5 = (void *)v4;
  unint64_t v6 = @"?";
  if (v4) {
    unint64_t v6 = (__CFString *)v4;
  }
  v10[0] = v6;
  os_signpost_id_t v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
  int v8 = [v2 errorWithDomain:v3 code:-6762 userInfo:v7];
  [v1 _reportError:v8 label:@"SFSessionInterruption"];
}

void __36__SysDropSession__runSFSessionStart__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(_DWORD *)(*(void *)(a1 + 32) + 20);
  if (v3)
  {
    if (!v4)
    {
      int v5 = [(id)objc_opt_class() signpostLog];
      uint64_t v6 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v7 = v6;
        if (os_signpost_enabled(v5))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SFSessionStart", "", buf, 2u);
        }
      }
    }
    int v8 = [(id)objc_opt_class() signpostLog];
    uint64_t v9 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)v19 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_END, v10, "SFSessionStart", "", v19, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 20) = 3;
    [*(id *)(a1 + 32) _reportError:v3 label:@"SFSessionActivate"];
  }
  else
  {
    if (!v4)
    {
      v11 = [(id)objc_opt_class() signpostLog];
      uint64_t v12 = [*(id *)(a1 + 32) signpostID];
      if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v13 = v12;
        if (os_signpost_enabled(v11))
        {
          *(_WORD *)v22 = 0;
          _os_signpost_emit_with_name_impl(&dword_23EB5C000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "SFSessionStart", "", v22, 2u);
        }
      }
    }
    v14 = [(id)objc_opt_class() signpostLog];
    uint64_t v15 = [*(id *)(a1 + 32) signpostID];
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v16 = v15;
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)v21 = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v14, OS_SIGNPOST_INTERVAL_END, v16, "SFSessionStart", "", v21, 2u);
      }
    }

    *(_DWORD *)(*(void *)(a1 + 32) + 20) = 4;
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      v18 = [*(id *)(*(void *)(a1 + 32) + 160) identifier];
      LogPrintF();

      objc_msgSend(*(id *)(a1 + 32), "_run", v18);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_run", v17);
    }
  }
}

void __36__SysDropSession__runSFSessionStart__block_invoke_42(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v8 = v5;
  if (gLogCategory_SysDropSession <= 30)
  {
    if (gLogCategory_SysDropSession != -1 || (v6 = _LogCategory_Initialize(), id v5 = v8, v6))
    {
      id v7 = v5;
      LogPrintF();
      id v5 = v8;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "handlePeerEvent:flags:", v5, a2, v7);
}

- (int)_runPreCheck
{
  switch(self->_preCheckState)
  {
    case 0:
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(SysDropSession *)self _runPreCheckRequest];
      break;
    case 1:
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_10;
      }
      break;
    case 2:
    case 4:
      return self->_preCheckState;
    default:
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
LABEL_10:
        LogPrintF();
      }
      break;
  }
  return self->_preCheckState;
}

- (void)_runPreCheckRequest
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  self->_preCheckState = 1;
  [v3 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"sd_rpft_cap"];
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    id v5 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__SysDropSession__runPreCheckRequest__block_invoke;
  v6[3] = &unk_26503FC20;
  v6[4] = self;
  [(SFSession *)sfSession sendRequestID:@"sysdrop_check", &unk_26F260AF0, v3, v6, v5 options request responseHandler];
}

uint64_t __37__SysDropSession__runPreCheckRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _runPreCheckResponse:a4 error:a2];
}

- (void)_runPreCheckResponse:(id)a3 error:(id)a4
{
  uint64_t v15 = (char *)a3;
  id v6 = a4;
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    v14 = v15;
    LogPrintF();
  }
  unsigned int Int64Ranged = CFDictionaryGetInt64Ranged();
  uint64_t Int64 = CFDictionaryGetInt64();
  BOOL v9 = Int64 != 0;
  if (gLogCategory_SysDropSession <= 30)
  {
    uint64_t v10 = Int64;
    if (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize())
    {
      v11 = "no";
      if (v10) {
        v11 = "yes";
      }
      v14 = v11;
      LogPrintF();
    }
  }
  self->_sysdiagnoseStatus = Int64Ranged;
  self->_homePodCanRPFileTransfer = v9;
  self->_preCheckState = 4;
  self->_sysdiagnoseDone = Int64Ranged == 2;
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    os_signpost_id_t v13 = [(SysDropSession *)self createSysDropAirDropEvent:5 error:0];
    progressHandler[2](progressHandler, 906, v13);
  }
  [(SysDropSession *)self _run];
}

- (int)_runSysdiagnose
{
  int sysdiagnoseState = self->_sysdiagnoseState;
  if (sysdiagnoseState == 1)
  {
    if (self->_sysdiagnoseStatus == 2)
    {
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int sysdiagnoseState = 4;
    }
    else if (gLogCategory_SysDropSession <= 30 {
           && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else if (!sysdiagnoseState)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int sysdiagnoseState = 1;
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      id v5 = [(SysDropSession *)self createSysDropSysDiagnoseEvent:self->_setupError];
      progressHandler[2](progressHandler, 907, v5);
    }
  }
  return self->_sysdiagnoseState;
}

- (int)_runAirDrop
{
  int airDropState = self->_airDropState;
  if (airDropState == 1)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (!airDropState)
  {
    [(SysDropSession *)self enableAirDropForEveryone];
    self->_int airDropState = 1;
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      id v5 = [(SysDropSession *)self createSysDropAirDropEvent:0 error:0];
      progressHandler[2](progressHandler, 906, v5);
    }
  }
  return self->_airDropState;
}

- (int)_runReceiveRPFileTransferSysdiagnose
{
  int rpFileTransferState = self->_rpFileTransferState;
  if (rpFileTransferState == 1)
  {
    if (self->_transferCompleted)
    {
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_int rpFileTransferState = 4;
    }
    else if (gLogCategory_SysDropSession <= 30 {
           && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else if (!rpFileTransferState)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int rpFileTransferState = 1;
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      id v5 = [(SysDropSession *)self createSysDropRPFileTransferEvent:0 error:0 fileTransferProgress:0];
      progressHandler[2](progressHandler, 909, v5);
    }
  }
  return self->_rpFileTransferState;
}

- (int)_runFileTransferComplete
{
  int rpFileCompleteState = self->_rpFileCompleteState;
  if (rpFileCompleteState == 1)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (!rpFileCompleteState)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_int rpFileCompleteState = 1;
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      id v5 = [(SysDropSession *)self createSysDropRPFileTransferEvent:2 error:0 fileTransferProgress:0];
      progressHandler[2](progressHandler, 910, v5);
    }
  }
  return self->_rpFileCompleteState;
}

- (void)fileTransferCompleted:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __40__SysDropSession_fileTransferCompleted___block_invoke;
  v7[3] = &unk_26503F8F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __40__SysDropSession_fileTransferCompleted___block_invoke(uint64_t a1)
{
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 96) = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[18];
  if (v3)
  {
    id v4 = [v2 fileTransferredSysDiagnosePath];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    uint64_t v2 = *(void **)(a1 + 32);
  }
  return [v2 _run];
}

- (id)fileTransferredSysDiagnosePath
{
  uint64_t v3 = [(RPFileTransferItem *)self->_transferItem itemURL];
  id v4 = [v3 path];

  if (v4)
  {
    id v5 = [(RPFileTransferItem *)self->_transferItem itemURL];
    id v6 = [v5 path];

    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SysDropSession <= 60
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v6 = &stru_26F254F18;
  }
  return v6;
}

- (int)_setupHandlers
{
  int result = self->_setupHandlersState;
  if (!result)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_setupHandlersState = 4;
    sfSession = self->_sfSession;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __32__SysDropSession__setupHandlers__block_invoke;
    v5[3] = &unk_26503FC98;
    v5[4] = self;
    [(SFSession *)sfSession registerRequestID:@"_hds_rpft_sysdrop" options:&unk_26F260B18 handler:v5];
    return self->_setupHandlersState;
  }
  return result;
}

void __32__SysDropSession__setupHandlers__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v10 = objc_alloc_init(HDSFileTransferService);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __32__SysDropSession__setupHandlers__block_invoke_2;
  v17[3] = &unk_26503F858;
  v17[4] = *(void *)(a1 + 32);
  [(HDSFileTransferService *)v10 setFileTransferProgressHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __32__SysDropSession__setupHandlers__block_invoke_3;
  v15[3] = &unk_26503FC48;
  v15[4] = *(void *)(a1 + 32);
  os_signpost_id_t v16 = v10;
  v11 = v10;
  [(HDSFileTransferService *)v11 setFileTransferCompletionHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __32__SysDropSession__setupHandlers__block_invoke_4;
  v13[3] = &unk_26503FC70;
  v13[4] = *(void *)(a1 + 32);
  id v14 = v9;
  id v12 = v9;
  [(HDSFileTransferService *)v11 handleSysDropStartFileTransferRequest:v8 responseHandler:v13];
}

uint64_t __32__SysDropSession__setupHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 136);
  if (v5 && !*(unsigned char *)(v4 + 122))
  {
    id v8 = v3;
    id v6 = [(id)v4 createSysDropRPFileTransferEvent:1 error:0 fileTransferProgress:v3];
    (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, 909, v6);

    id v3 = v8;
  }
  return MEMORY[0x270F9A758](v4, v3);
}

void __32__SysDropSession__setupHandlers__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    id v9 = v11;
    id v10 = v5;
    LogPrintF();
  }
  if (v11)
  {
    [*(id *)(a1 + 32) _reportError:v11 label:@"File Transfer Disconnected"];
  }
  else if (v5)
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      id v9 = 0;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "fileTransferCompleted:", v5, v9, v10);
    id v6 = *(void **)(a1 + 40);
    if (v6) {
      [v6 invalidate];
    }
  }
  else
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v7 = *(void **)(a1 + 32);
    id v8 = NSErrorF();
    [v7 _reportError:v8 label:@"File Transfer Did not complete"];
  }
}

void __32__SysDropSession__setupHandlers__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    id v4 = v3;
    if (gLogCategory_SysDropSession <= 30)
    {
      if (gLogCategory_SysDropSession != -1 || (v5 = _LogCategory_Initialize(), id v4 = v7, v5))
      {
        id v6 = v4;
        LogPrintF();
        id v4 = v7;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v4, @"Failed To Setup File Transfer receiver", v6);
  }
  else
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(a1 + 32) sysdiagnoseCompleted];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)enableAirDropForEveryone
{
  [(SFAirDropDiscoveryController *)self->_airDropController setDiscoverableMode:2];
  uint64_t v2 = [NSURL fileURLWithPath:@"/private/var/mobile/Library/Preferences/com.apple.sharingd.plist"];
  uint64_t v7 = 0;
  id v3 = [NSDictionary dictionaryWithContentsOfURL:v2 error:&v7];
  id v4 = v3;
  if (v7) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    id v6 = @"Not set";
  }
  else
  {
    id v6 = [v3 objectForKey:@"DiscoverableMode"];
  }
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (id)_getAirDropID
{
  uint64_t v2 = [NSURL fileURLWithPath:@"/private/var/mobile/Library/Preferences/com.apple.sharingd.plist"];
  id v8 = 0;
  id v3 = [NSDictionary dictionaryWithContentsOfURL:v2 error:&v8];
  id v4 = v8;
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    id v6 = &stru_26F254F18;
  }
  else
  {
    id v6 = [v3 objectForKey:@"AirDropID"];
  }
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v6;
}

- (id)_getAirDropDiscoverableMode
{
  uint64_t v2 = [NSURL fileURLWithPath:@"/private/var/mobile/Library/Preferences/com.apple.sharingd.plist"];
  id v8 = 0;
  id v3 = [NSDictionary dictionaryWithContentsOfURL:v2 error:&v8];
  id v4 = v8;
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v3 == 0;
  }
  if (v5)
  {
    id v6 = &stru_26F254F18;
  }
  else
  {
    id v6 = [v3 objectForKey:@"DiscoverableMode"];
  }
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return v6;
}

- (id)createSysDropSysDiagnoseEvent:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  BOOL v5 = v4;
  if (v3)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "code"));
    [v5 setObject:v6 forKeyedSubscript:@"sd_er"];
  }
  else
  {
    [v4 setObject:0 forKeyedSubscript:@"sd_er"];
  }
  uint64_t v7 = [v3 domain];
  [v5 setObject:v7 forKeyedSubscript:@"sd_ed"];

  id v8 = [v3 description];
  [v5 setObject:v8 forKeyedSubscript:@"sd_de"];

  return v5;
}

- (id)createSysDropAirDropEvent:(unsigned int)a3 error:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  id v8 = [NSNumber numberWithUnsignedInt:v4];
  [v7 setObject:v8 forKeyedSubscript:@"sd_ad_e"];

  if (v6)
  {
    id v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
    [v7 setObject:v9 forKeyedSubscript:@"sd_ad_er"];
  }
  else
  {
    [v7 setObject:0 forKeyedSubscript:@"sd_ad_er"];
  }
  id v10 = [v6 domain];

  [v7 setObject:v10 forKeyedSubscript:@"sd_ad_ed"];
  setupError = self->_setupError;
  if (setupError)
  {
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSError code](setupError, "code"));
    [v7 setObject:v12 forKeyedSubscript:@"sd_er"];
  }
  else
  {
    [v7 setObject:0 forKeyedSubscript:@"sd_er"];
  }
  os_signpost_id_t v13 = [(NSError *)self->_setupError domain];
  [v7 setObject:v13 forKeyedSubscript:@"sd_ed"];

  id v14 = [(NSError *)self->_setupError description];
  [v7 setObject:v14 forKeyedSubscript:@"sd_de"];

  return v7;
}

- (id)createSysDropRPFileTransferEvent:(unsigned int)a3 error:(id)a4 fileTransferProgress:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_opt_new();
  id v11 = [NSNumber numberWithUnsignedInt:v6];
  [v10 setObject:v11 forKeyedSubscript:@"sd_rp_e"];

  if (v9)
  {
    id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "code"));
    [v10 setObject:v12 forKeyedSubscript:@"sd_rp_er"];
  }
  else
  {
    [v10 setObject:0 forKeyedSubscript:@"sd_rp_er"];
  }
  os_signpost_id_t v13 = [v9 domain];

  [v10 setObject:v13 forKeyedSubscript:@"sd_rp_ed"];
  setupError = self->_setupError;
  if (setupError)
  {
    uint64_t v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSError code](setupError, "code"));
    [v10 setObject:v15 forKeyedSubscript:@"sd_er"];
  }
  else
  {
    [v10 setObject:0 forKeyedSubscript:@"sd_er"];
  }
  os_signpost_id_t v16 = [(NSError *)self->_setupError domain];
  [v10 setObject:v16 forKeyedSubscript:@"sd_ed"];

  uint64_t v17 = [(NSError *)self->_setupError description];
  [v10 setObject:v17 forKeyedSubscript:@"sd_de"];

  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    uint64_t v26 = [v8 transferredByteCount];
    uint64_t v28 = [v8 totalByteCount];
    LogPrintF();
  }
  if (v8)
  {
    float v19 = (float)[v8 transferredByteCount];
    float v20 = v19 / (float)[v8 totalByteCount];
  }
  else
  {
    float v20 = -1.0;
  }
  *(float *)&double v18 = v20;
  v21 = objc_msgSend(NSNumber, "numberWithFloat:", v18, v26, v28);
  [v10 setObject:v21 forKeyedSubscript:@"sd_rp_pr"];

  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    double v27 = v20;
    LogPrintF();
  }
  if (v8) {
    [v8 remainingSeconds];
  }
  else {
    double v22 = -1.0;
  }
  v23 = objc_msgSend(NSNumber, "numberWithDouble:", v22, *(void *)&v27);
  [v10 setObject:v23 forKeyedSubscript:@"sd_rp_rs"];

  if ([v8 type])
  {
    v24 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "type"));
    [v10 setObject:v24 forKeyedSubscript:@"sd_pt"];
  }
  else
  {
    [v10 setObject:0 forKeyedSubscript:@"sd_pt"];
  }

  return v10;
}

- (void)startAirDropSysdiagnose
{
  id v3 = [(SysDropSession *)self _getAirDropID];
  if ([v3 length])
  {
    uint64_t v4 = [(SysDropSession *)self _getAirDropDiscoverableMode];
    BOOL v5 = v4;
    if (v4 && ([v4 isEqualToString:@"Everyone"] & 1) != 0)
    {
      uint64_t v6 = objc_opt_new();
      [v6 setObject:v3 forKeyedSubscript:@"sd_ad_id"];
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        id v14 = v6;
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
      if (progressHandler)
      {
        id v12 = [(SysDropSession *)self createSysDropAirDropEvent:5 error:0];
        progressHandler[2](progressHandler, 906, v12);
      }
      sfSession = self->_sfSession;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __41__SysDropSession_startAirDropSysdiagnose__block_invoke;
      v15[3] = &unk_26503FC20;
      v15[4] = self;
      [(SFSession *)sfSession sendRequestID:@"sysdrop_ad", &unk_26F260B40, v6, v15, v14 options request responseHandler];
    }
    else
    {
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      uint64_t v7 = (void (**)(id, uint64_t, void *))self->_progressHandler;
      id v8 = [(SysDropSession *)self createSysDropAirDropEvent:2 error:0];
      v7[2](v7, 906, v8);
    }
  }
  else
  {
    if (gLogCategory_SysDropSession <= 30
      && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v9 = (void (**)(id, uint64_t, void *))self->_progressHandler;
    id v10 = [(SysDropSession *)self createSysDropAirDropEvent:1 error:0];
    v9[2](v9, 906, v10);
  }
}

void __41__SysDropSession_startAirDropSysdiagnose__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(NSObject **)(v8 + 128);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SysDropSession_startAirDropSysdiagnose__block_invoke_2;
  block[3] = &unk_26503F940;
  id v13 = v7;
  id v14 = v6;
  uint64_t v15 = v8;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(v9, block);
}

void __41__SysDropSession_startAirDropSysdiagnose__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = v2[17];
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(v2, "createSysDropAirDropEvent:error:", 3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, 906, v6);
  }
  else
  {
    uint64_t v4 = objc_msgSend(v2, "createSysDropAirDropEvent:error:", 4);
    (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, 906, v4);

    BOOL v5 = *(void **)(a1 + 48);
    [v5 _run];
  }
}

- (void)sysdiagnoseCompleted
{
  if (gLogCategory_SysDropSession <= 30
    && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__SysDropSession_sysdiagnoseCompleted__block_invoke;
  block[3] = &unk_26503F6A8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__SysDropSession_sysdiagnoseCompleted__block_invoke(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 56) = 2;
  return [*(id *)(a1 + 32) _run];
}

- (void)handlePeerEvent:(id)a3 flags:(unsigned int)a4
{
  if ((a4 & 1) == 0)
  {
    id v5 = a3;
    self->_unsigned int sysdiagnoseStatus = CFDictionaryGetInt64Ranged();
    CFDictionaryGetInt64Ranged();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (gLogCategory_SysDropSession <= 30)
    {
      if (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      if (gLogCategory_SysDropSession <= 30
        && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    unsigned int sysdiagnoseStatus = self->_sysdiagnoseStatus;
    if (sysdiagnoseStatus == 3)
    {
      id v7 = NSErrorF();
      [(SysDropSession *)self _reportError:v7 label:@"SysDrop Sysdiagnose Error"];
    }
    else if (sysdiagnoseStatus == 2)
    {
      [(SysDropSession *)self sysdiagnoseCompleted];
    }
    else if (gLogCategory_SysDropSession <= 30 {
           && (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
}

- (void)_reportError:(id)a3 label:(id)a4
{
  v30[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = gLogCategory_SysDropSession;
  if (gLogCategory_SysDropSession <= 30)
  {
    if (gLogCategory_SysDropSession != -1 || _LogCategory_Initialize())
    {
      v24 = [(SFSession *)self->_sfSession identifier];
      LogPrintF();
    }
    int v8 = gLogCategory_SysDropSession;
  }
  if (v8 <= 60 && (v8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  FPrintF();
  [(SysDropSession *)self _cleanupSession];
  if (self->_totalSecs == 0.0)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_totalSecs = v9;
  }
  if ([v6 code] != -6723)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v30[0] = v7;
    v29[0] = @"label";
    v29[1] = @"errDomain";
    uint64_t v11 = [v6 domain];
    id v12 = (void *)v11;
    id v13 = @"?";
    if (v11) {
      id v13 = (__CFString *)v11;
    }
    v30[1] = v13;
    v29[2] = @"errCode";
    id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "code"));
    v30[2] = v14;
    v29[3] = @"totalMs";
    uint64_t v15 = [NSNumber numberWithUnsignedInt:(self->_totalSecs * 1000.0)];
    v30[3] = v15;
    os_signpost_id_t v16 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];
    [v10 addEntriesFromDictionary:v16];

    HDSMetricsLog(@"com.apple.sharing.ASSetupError", v10);
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      double v27 = @"eo";
      double v18 = v6;
      if (!v6)
      {
        float v19 = (void *)MEMORY[0x263F087E8];
        uint64_t v20 = *MEMORY[0x263F08410];
        uint64_t v25 = *MEMORY[0x263F08320];
        uint64_t v21 = [NSString stringWithUTF8String:DebugGetErrorString()];
        id v12 = (void *)v21;
        double v22 = @"?";
        if (v21) {
          double v22 = (__CFString *)v21;
        }
        uint64_t v26 = v22;
        id v14 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
        double v18 = [v19 errorWithDomain:v20 code:-6700 userInfo:v14];
      }
      uint64_t v28 = v18;
      v23 = [NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      progressHandler[2](progressHandler, 30, v23);

      if (!v6)
      {
      }
    }
  }
}

- (void)discoveryControllerSettingsDidChange:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (gLogCategory_SysDropSession <= 30)
  {
    id v5 = v3;
    if (gLogCategory_SysDropSession != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v5, v3))
    {
      id v3 = (id)LogPrintF();
      id v4 = v5;
    }
  }
  MEMORY[0x270F9A758](v3, v4);
}

- (void)discoveryControllerVisibilityDidChange:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (gLogCategory_SysDropSession <= 30)
  {
    id v5 = v3;
    if (gLogCategory_SysDropSession != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v5, v3))
    {
      id v3 = (id)LogPrintF();
      id v4 = v5;
    }
  }
  MEMORY[0x270F9A758](v3, v4);
}

- (void)discoveryControllerLegacyModePropertiesDidChange:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (gLogCategory_SysDropSession <= 30)
  {
    id v5 = v3;
    if (gLogCategory_SysDropSession != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v5, v3))
    {
      id v3 = (id)LogPrintF();
      id v4 = v5;
    }
  }
  MEMORY[0x270F9A758](v3, v4);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (id)sysdropFinishedHandler
{
  return self->_sysdropFinishedHandler;
}

- (void)setSysdropFinishedHandler:(id)a3
{
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
}

- (SFSession)sfSession
{
  return self->_sfSession;
}

- (void)setSfSession:(id)a3
{
}

- (NSError)setupError
{
  return self->_setupError;
}

- (void)setSetupError:(id)a3
{
}

- (BOOL)startedFromSetup
{
  return self->_startedFromSetup;
}

- (void)setStartedFromSetup:(BOOL)a3
{
  self->_startedFromSetup = a3;
}

- (BOOL)sysDropFailed
{
  return self->_sysDropFailed;
}

- (void)setSysDropFailed:(BOOL)a3
{
  self->_sysDropFailed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupError, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong(&self->_sysdropFinishedHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_rpFileTransferError, 0);
  objc_storeStrong((id *)&self->_transferItem, 0);
  objc_storeStrong((id *)&self->_fileTransferSession, 0);
  objc_storeStrong((id *)&self->_airDropController, 0);
}

@end