@interface HDSSetupService
+ (OS_os_log)signpostLog;
- (BOOL)_handleFinishDone2Ready;
- (BOOL)canSendPeerUpdates;
- (BOOL)homePodNeedsSUNoSetup;
- (BOOL)isHomePodSUNoSetup;
- (HDSSetupService)init;
- (OS_dispatch_queue)dispatchQueue;
- (SUControllerManager)suControllerManager;
- (SysDropService)sysDropService;
- (id)installProfileData:(id)a3;
- (id)progressHandler;
- (int)_handleBasicConfigRequest:(id)a3;
- (int)hdsSUStateForSUState;
- (unint64_t)signpostID;
- (void)_activate;
- (void)_boostiTunesCloudDaemon;
- (void)_cleanup;
- (void)_handleAuthActionAudioPasscodeInit:(id)a3 response:(id)a4;
- (void)_handleAuthActionAudioPasscodeStartWithResponse:(id)a3;
- (void)_handleAuthActionRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleAuthActionSiriInit:(id)a3;
- (void)_handleAuthActionSiriStart:(id)a3 response:(id)a4 responseHandler:(id)a5;
- (void)_handleBasicConfigResponse:(id)a3;
- (void)_handleCheckHomePodForJS:(id)a3 responseHandler:(id)a4;
- (void)_handleDeviceActivationRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleFinishApply:(id)a3 responseHandler:(id)a4;
- (void)_handleFinishDone2:(unsigned int)a3 responseHandler:(id)a4;
- (void)_handleFinishDone:(unsigned int)a3 responseHandler:(id)a4;
- (void)_handleFinishRequest:(id)a3 responseHandler:(id)a4;
- (void)_handlePreAuthRequest:(id)a3 responseHandler:(id)a4;
- (void)_handlePurgeSUNoSetup:(id)a3 responseHandler:(id)a4;
- (void)_handleRawRequest:(id)a3 flags:(unsigned int)a4 responseHandler:(id)a5;
- (void)_handleSUNoSetupScanRequest:(id)a3 responseHandler:(id)a4;
- (void)_handleSessionEnded:(id)a3;
- (void)_handleSessionStarted:(id)a3;
- (void)_handleSiriDialogIdentifier:(id)a3;
- (void)_handleStartSysDrop:(id)a3 responseHandler:(id)a4;
- (void)_handleStartSysDropEnablementProfileTransfer:(id)a3 responseHandler:(id)a4;
- (void)_handleVoicePreviewRequest:(id)a3 responseHandler:(id)a4;
- (void)_invalidate;
- (void)_playReadyToSetupSound;
- (void)_printBitMask:(int64_t)a3;
- (void)_runHomeKitSetupMode:(id)a3 responseHandler:(id)a4;
- (void)_setSiriInfo;
- (void)_sfServiceStart;
- (void)activate;
- (void)configureSUControllerManagerToFinish;
- (void)connectionRegained:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)manager:(id)a3 connectionError:(id)a4;
- (void)manager:(id)a3 didChangeProgressOnApply:(id)a4 progress:(id)a5;
- (void)manager:(id)a3 didChangeProgressOnDownload:(id)a4;
- (void)manager:(id)a3 didFailDownload:(id)a4 withError:(id)a5;
- (void)manager:(id)a3 didFailInstallation:(id)a4 withError:(id)a5;
- (void)manager:(id)a3 didFinishDownload:(id)a4;
- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6;
- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6 denialReasons:(id)a7;
- (void)manager:(id)a3 didFinishInstallation:(id)a4;
- (void)manager:(id)a3 scanRequestDidLocateUpdate:(id)a4 error:(id)a5;
- (void)manager:(id)a3 scanRequestPostponed:(id)a4 error:(id)a5;
- (void)removeSysDropProfile;
- (void)sendSUNoSetupErrorPeerEvent:(int64_t)a3;
- (void)sendSUNoSetupSUInstallDonePeerEvent;
- (void)sendSUNoSetupSUStatusPeerEvent;
- (void)setDispatchQueue:(id)a3;
- (void)setProgressHandler:(id)a3;
- (void)setSuControllerManager:(id)a3;
- (void)setSysDropService:(id)a3;
- (void)wipeWifiConfig;
@end

@implementation HDSSetupService

+ (OS_os_log)signpostLog
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __30__HDSSetupService_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1) {
    dispatch_once(&signpostLog_onceToken_0, block);
  }
  v2 = (void *)signpostLog_log_0;
  return (OS_os_log *)v2;
}

void __30__HDSSetupService_signpostLog__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.HomeDeviceSetup.signposts", (const char *)[v3 UTF8String]);
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;
}

- (unint64_t)signpostID
{
  id v3 = [(id)objc_opt_class() signpostLog];
  os_signpost_id_t v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (HDSSetupService)init
{
  v10.receiver = self;
  v10.super_class = (Class)HDSSetupService;
  v2 = [(HDSSetupService *)&v10 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("WiFiSetup", 0);
    wifiDispatchQueue = v2->_wifiDispatchQueue;
    v2->_wifiDispatchQueue = (OS_dispatch_queue *)v5;

    v2->_iTunesCloudCompleteToken = -1;
    v2->_timeAuto = -1;
    v2->_timeZoneAuto = -1;
    uint64_t v7 = [objc_alloc(MEMORY[0x263F77B08]) initWithDelegate:v2];
    suControllerManager = v2->_suControllerManager;
    v2->_suControllerManager = (SUControllerManager *)v7;
  }
  return v2;
}

- (void)dealloc
{
  if (self->_activateCalled && !self->_invalidateCalled)
  {
    uint64_t v3 = (HDSSetupService *)FatalErrorF();
    [(HDSSetupService *)v3 _cleanup];
  }
  else
  {
    [(HDSSetupService *)self _cleanup];
    v5.receiver = self;
    v5.super_class = (Class)HDSSetupService;
    [(HDSSetupService *)&v5 dealloc];
  }
}

- (void)_cleanup
{
  self->_progressHandler = 0;
  MEMORY[0x270F9A758]();
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__HDSSetupService_activate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __27__HDSSetupService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  v2 = *(void **)(a1 + 32);
  return [v2 _activate];
}

- (void)_activate
{
  int v26 = 0;
  self->_advertiseFast = CFPrefs_GetInt64() != 0;
  uint64_t Int64 = CFPrefs_GetInt64();
  if (v26) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = Int64 == 0;
  }
  BOOL v5 = !v4;
  self->_prefCDPEnabled = v5;
  uint64_t v6 = CFPrefs_GetInt64();
  if (v26) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v6 == 0;
  }
  BOOL v8 = !v7;
  self->_wifiSetupEnabled = v8;
  uint64_t v9 = CFPrefs_GetInt64();
  if (v26) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 == 0;
  }
  BOOL v11 = !v10;
  self->_identifyB238AsB520 = v11;
  uint64_t v12 = CFPrefs_GetInt64();
  if (v26) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = v12 == 0;
  }
  BOOL v14 = !v13;
  self->_shouldSetupAgentPlayBootTone = v14;
  if (!self->_sfClient)
  {
    v15 = (SFClient *)objc_alloc_init(MEMORY[0x263F6C1F0]);
    sfClient = self->_sfClient;
    self->_sfClient = v15;

    [(SFClient *)self->_sfClient activateAssertionWithIdentifier:@"com.apple.sharing.PreventRepair"];
    [(SFClient *)self->_sfClient preventExitForLocaleReason:@"HomePod Setup"];
    objc_initWeak(&location, self->_sfClient);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __28__HDSSetupService__activate__block_invoke;
    v23[3] = &unk_26503FD88;
    objc_copyWeak(&v24, &location);
    [(SFClient *)self->_sfClient setInterruptionHandler:v23];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  if (self->_wifiSetupEnabled)
  {
    v17 = (__WiFiManagerClient *)WiFiManagerClientCreate();
    self->_wifiManager = v17;
    if (v17)
    {
      WiFiManagerClientDisable();
    }
    else if (gLogCategory_HDSSetupService <= 60 {
           && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  if (!self->_siriClient)
  {
    v18 = (SFSiriClient *)objc_alloc_init(MEMORY[0x263F6C2D0]);
    siriClient = self->_siriClient;
    self->_siriClient = v18;

    [(SFSiriClient *)self->_siriClient setDispatchQueue:self->_dispatchQueue];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __28__HDSSetupService__activate__block_invoke_2;
    v22[3] = &unk_26503FDB0;
    v22[4] = self;
    [(SFSiriClient *)self->_siriClient setSiriDialogHandler:v22];
    [(SFSiriClient *)self->_siriClient activate];
  }
  v20 = (HMHomeManager *)[objc_alloc(getHMHomeManagerClass_0()) initWithOptions:0];
  homeManager = self->_homeManager;
  self->_homeManager = v20;

  [(HDSSetupService *)self _sfServiceStart];
}

void __28__HDSSetupService__activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained preventExitForLocaleReason:@"HomePod Setup"];
}

uint64_t __28__HDSSetupService__activate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleSiriDialogIdentifier:a2];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__HDSSetupService_invalidate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__HDSSetupService_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_invalidate
{
  if (!self->_invalidateCalled
    && gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  finishApplyTimer = self->_finishApplyTimer;
  if (finishApplyTimer)
  {
    BOOL v4 = finishApplyTimer;
    dispatch_source_cancel(v4);
    BOOL v5 = self->_finishApplyTimer;
    self->_finishApplyTimer = 0;
  }
  if (self->_sfSession) {
    -[HDSSetupService _handleSessionEnded:](self, "_handleSessionEnded:");
  }
  [(RPCompanionLinkClient *)self->_companionLinkClient invalidate];
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  [(SFService *)self->_sfService invalidate];
  sfService = self->_sfService;
  self->_sfService = 0;

  [(SFSiriClient *)self->_siriClient invalidateWithFlags:32];
  siriClient = self->_siriClient;
  self->_siriClient = 0;

  if (self->_wifiManager)
  {
    WiFiManagerClientEnable();
    CFRelease(self->_wifiManager);
    self->_wifiManager = 0;
  }
  [(CUAudioPlayer *)self->_audioPlayer invalidateWithFlags:1];
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = 0;

  [(SFClient *)self->_sfClient invalidate];
  sfClient = self->_sfClient;
  self->_sfClient = 0;

  icClient = self->_icClient;
  self->_icClient = 0;

  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 20, 0);
  }
  [(HDSSetupService *)self _cleanup];
}

- (void)_sfServiceStart
{
  if (!self->_sfService)
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = [(id)objc_opt_class() signpostLog];
    unint64_t v4 = [(HDSSetupService *)self signpostID];
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v5 = v4;
      if (os_signpost_enabled(v3))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_23EB5C000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v5, "SFServiceStart", "", buf, 2u);
      }
    }

    uint64_t v6 = (SFService *)objc_alloc_init(MEMORY[0x263F6C2B0]);
    sfService = self->_sfService;
    self->_sfService = v6;

    if (self->_advertiseFast) {
      [(SFService *)self->_sfService setAdvertiseRate:50];
    }
    [(SFService *)self->_sfService setDispatchQueue:self->_dispatchQueue];
    [(SFService *)self->_sfService setIdentifier:*MEMORY[0x263F6C390]];
    [(SFService *)self->_sfService setLabel:@"HomePodSetup"];
    [(SFService *)self->_sfService setNeedsSetup:1];
    if (+[HDSDefaults disableNeedsSetup]
      && isInternalBuild())
    {
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(SFService *)self->_sfService setNeedsSetup:0];
    }
    if (SFDeviceModelCodeGet()) {
      uint64_t v8 = 33;
    }
    else {
      uint64_t v8 = 11;
    }
    [(SFService *)self->_sfService setDeviceActionType:v8];
    if (self->_identifyB238AsB520) {
      [(SFService *)self->_sfService setDeviceActionType:33];
    }
    [(SFService *)self->_sfService setPairSetupACL:&unk_26F260B68];
    [(SFService *)self->_sfService setSessionFlags:1];
    [(SFService *)self->_sfService setTouchRemoteEnabled:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __34__HDSSetupService__sfServiceStart__block_invoke;
    v14[3] = &unk_26503FDD8;
    v14[4] = self;
    [(SFService *)self->_sfService setSessionStartedHandler:v14];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __34__HDSSetupService__sfServiceStart__block_invoke_325;
    v13[3] = &unk_26503FE00;
    v13[4] = self;
    [(SFService *)self->_sfService setSessionEndedHandler:v13];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __34__HDSSetupService__sfServiceStart__block_invoke_327;
    v12[3] = &unk_26503FDD8;
    v12[4] = self;
    [(SFService *)self->_sfService setSessionSecuredHandler:v12];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __34__HDSSetupService__sfServiceStart__block_invoke_2;
    v11[3] = &unk_26503FE28;
    v11[4] = self;
    [(SFService *)self->_sfService setReceivedRequestHandler:v11];
    uint64_t v9 = self->_sfService;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __34__HDSSetupService__sfServiceStart__block_invoke_3;
    v10[3] = &unk_26503F7B8;
    v10[4] = self;
    [(SFService *)v9 activateWithCompletion:v10];
  }
}

void __34__HDSSetupService__sfServiceStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [(id)objc_opt_class() signpostLog];
  uint64_t v5 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "SetupSession", "", v7, 2u);
    }
  }

  [*(id *)(a1 + 32) _handleSessionStarted:v3];
}

void __34__HDSSetupService__sfServiceStart__block_invoke_325(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = [(id)objc_opt_class() signpostLog];
  uint64_t v5 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SetupSession", "", v7, 2u);
    }
  }

  [*(id *)(a1 + 32) _handleSessionEnded:v3];
}

void __34__HDSSetupService__sfServiceStart__block_invoke_327(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = [v6 identifier];
    LogPrintF();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 432);
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t, void))(v3 + 16))(v3, 70, 0);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 432);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))(v4, 33, 0);
    }
  }
}

uint64_t __34__HDSSetupService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRawRequest:flags:responseHandler:", a4, a3);
}

void __34__HDSSetupService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [(id)objc_opt_class() signpostLog];
  uint64_t v5 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)BOOL v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SFServiceStart", "", v13, 2u);
    }
  }

  id v7 = v3;
  uint64_t v8 = *(void *)(a1 + 32);
  if (v7)
  {
    uint64_t v9 = *(void *)(v8 + 432);
    if (v9)
    {
      BOOL v14 = @"eo";
      id v15 = v7;
      BOOL v10 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      (*(void (**)(uint64_t, uint64_t, void *))(v9 + 16))(v9, 30, v10);
LABEL_11:
    }
  }
  else
  {
    if (*(unsigned char *)(v8 + 208))
    {
      [(id)v8 _playReadyToSetupSound];
      uint64_t v8 = *(void *)(a1 + 32);
    }
    uint64_t v11 = *(void *)(v8 + 432);
    if (v11)
    {
      v16 = @"PlayBootTone";
      BOOL v10 = [NSNumber numberWithInt:*(unsigned char *)(v8 + 208) == 0];
      v17[0] = v10;
      uint64_t v12 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
      (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, 10, v12);

      goto LABEL_11;
    }
  }
}

- (void)_handleSessionStarted:(id)a3
{
  id v5 = a3;
  p_sfSession = &self->_sfSession;
  if (self->_sfSession)
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      id v7 = [v5 peer];
      v36 = [(SFSession *)*p_sfSession peer];
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      v35 = [v5 peer];
      LogPrintF();
    }
    self->_peerFeatureFlags = 0;
    objc_storeStrong((id *)&self->_sfSession, a3);
    uint64_t v8 = (void *)GestaltCopyAnswer();
    if ((unint64_t)[v8 length] < 4)
    {
      if (gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        v35 = v8;
        LogPrintF();
      }
    }
    else
    {
      uint64_t v9 = objc_msgSend(v8, "substringFromIndex:", objc_msgSend(v8, "length") - 4);
      [(SFService *)self->_sfService setFixedPIN:v9];
    }
    int v48 = 1;
    uint64_t v10 = softLinkAudioServicesSetProperty(1633907828, 0, 0, 4, (uint64_t)&v48);
    if (v10)
    {
      if (gLogCategory_HDSSetupService <= 60)
      {
        uint64_t v11 = (void *)v10;
        if (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize())
        {
          v35 = v11;
          LogPrintF();
        }
      }
    }
    sfSession = self->_sfSession;
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __41__HDSSetupService__handleSessionStarted___block_invoke;
    v47[3] = &unk_26503FC98;
    v47[4] = self;
    [(SFSession *)sfSession registerRequestID:@"_hds_hh2", &unk_26F260B90, v47, v35 options handler];
    BOOL v13 = self->_sfSession;
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_2;
    v46[3] = &unk_26503FC98;
    v46[4] = self;
    [(SFSession *)v13 registerRequestID:@"unsetup_hp_sunosetup_cancel_su" options:&unk_26F260B90 handler:v46];
    BOOL v14 = self->_sfSession;
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_3;
    v45[3] = &unk_26503FC98;
    v45[4] = self;
    [(SFSession *)v14 registerRequestID:@"_hds_ams_token" options:&unk_26F260B90 handler:v45];
    id v15 = self->_sfSession;
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_4;
    v44[3] = &unk_26503FC98;
    v44[4] = self;
    [(SFSession *)v15 registerRequestID:@"_pa" options:&unk_26F260B90 handler:v44];
    v16 = self->_sfSession;
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_5;
    v43[3] = &unk_26503FC98;
    v43[4] = self;
    [(SFSession *)v16 registerRequestID:@"_dA" options:&unk_26F260B90 handler:v43];
    v17 = self->_sfSession;
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 3221225472;
    v42[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_6;
    v42[3] = &unk_26503FC98;
    v42[4] = self;
    [(SFSession *)v17 registerRequestID:@"_aa" options:&unk_26F260B90 handler:v42];
    v18 = self->_sfSession;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_7;
    v41[3] = &unk_26503FC98;
    v41[4] = self;
    [(SFSession *)v18 registerRequestID:@"_pvoice" options:&unk_26F260B90 handler:v41];
    v19 = self->_sfSession;
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 3221225472;
    v40[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_8;
    v40[3] = &unk_26503FC98;
    v40[4] = self;
    [(SFSession *)v19 registerRequestID:@"_hds_fu" options:&unk_26F260B90 handler:v40];
    v20 = self->_sfSession;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_9;
    v39[3] = &unk_26503FC98;
    v39[4] = self;
    [(SFSession *)v20 registerRequestID:@"_hds_hp_js" options:&unk_26F260B90 handler:v39];
    v21 = self->_sfSession;
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_10;
    v38[3] = &unk_26503FC98;
    v38[4] = self;
    [(SFSession *)v21 registerRequestID:@"sysdrop_sys_start" options:&unk_26F260B90 handler:v38];
    v22 = self->_sfSession;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __41__HDSSetupService__handleSessionStarted___block_invoke_11;
    v37[3] = &unk_26503FC98;
    v37[4] = self;
    [(SFSession *)v22 registerRequestID:@"_hds_rpft_sysdrop_enablement" options:&unk_26F260B90 handler:v37];
    if (self->_prefCDPEnabled)
    {
      v23 = (SFDeviceOperationHandlerCDPSetup *)objc_alloc_init(MEMORY[0x263F6C248]);
      cdpSetupHandler = self->_cdpSetupHandler;
      self->_cdpSetupHandler = v23;

      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setDispatchQueue:self->_dispatchQueue];
      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler setSfSession:v5];
      [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler activate];
    }
    v25 = (SFDeviceOperationHandlerWiFiSetup *)objc_alloc_init(MEMORY[0x263F6C258]);
    wifiSetupHandler = self->_wifiSetupHandler;
    self->_wifiSetupHandler = v25;

    [(SFDeviceOperationHandlerWiFiSetup *)self->_wifiSetupHandler setDispatchQueue:self->_wifiDispatchQueue];
    [(SFDeviceOperationHandlerWiFiSetup *)self->_wifiSetupHandler setSfSession:v5];
    [(SFDeviceOperationHandlerWiFiSetup *)self->_wifiSetupHandler activate];
    v27 = (SFDeviceOperationHandlerCNJSetup *)objc_alloc_init(MEMORY[0x263F6C250]);
    captiveNetworkHandler = self->_captiveNetworkHandler;
    self->_captiveNetworkHandler = v27;

    [(SFDeviceOperationHandlerCNJSetup *)self->_captiveNetworkHandler setDispatchQueue:self->_dispatchQueue];
    [(SFDeviceOperationHandlerCNJSetup *)self->_captiveNetworkHandler setSfSession:v5];
    [(SFDeviceOperationHandlerCNJSetup *)self->_captiveNetworkHandler activate];
    id v29 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v30 = [(SFSession *)self->_sfSession trSession];
    if (v30) {
      [v29 setObject:v30 forKeyedSubscript:@"trSession"];
    }
    v31 = [v5 messageSessionTemplate];
    if (v31)
    {
      [v29 setObject:v31 forKeyedSubscript:@"mst"];
    }
    else if (gLogCategory_HDSSetupService <= 60 {
           && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
    progressHandler = (void (**)(id, uint64_t, id))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 31, v29);
    }
    [(SFService *)self->_sfService setNeedsSetup:0];
    if (self->_homeManager)
    {
      v33 = [MEMORY[0x263EFB210] defaultStore];
      v34 = objc_msgSend(v33, "aa_primaryAppleAccount");

      if (!v34)
      {
        [(HMHomeManager *)self->_homeManager removeAllHomeKitPairingIdentities];
        if (gLogCategory_HDSSetupService <= 30
          && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }
  }
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runHomeKitSetupMode:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePurgeSUNoSetup:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAMSTokenImportActionRequest:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePreAuthRequest:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDeviceActivationRequest:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAuthActionRequest:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleVoicePreviewRequest:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSUNoSetupScanRequest:responseHandler:");
}

uint64_t __41__HDSSetupService__handleSessionStarted___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCheckHomePodForJS:responseHandler:");
}

void __41__HDSSetupService__handleSessionStarted___block_invoke_10(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [*(id *)(a1 + 32) _handleStartSysDrop:v7 responseHandler:v8];
}

void __41__HDSSetupService__handleSessionStarted___block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [*(id *)(a1 + 32) _handleStartSysDropEnablementProfileTransfer:v7 responseHandler:v8];
}

- (void)_runHomeKitSetupMode:(id)a3 responseHandler:(id)a4
{
  id v7 = a3;
  id v5 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  os_signpost_id_t v6 = NSErrorWithOSStatusF();
  (*((void (**)(id, void *, void, void))v5 + 2))(v5, v6, 0, 0);
}

- (void)_handlePurgeSUNoSetup:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = [(HDSSetupService *)self suControllerManager];

  if (v8)
  {
    id v9 = [(HDSSetupService *)self suControllerManager];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__HDSSetupService__handlePurgeSUNoSetup_responseHandler___block_invoke;
    v11[3] = &unk_26503FE78;
    v11[4] = self;
    id v12 = v7;
    [v9 managerStatus:v11];
  }
  else
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v10 = NSErrorWithOSStatusF();
    (*((void (**)(id, void *, void, void))v7 + 2))(v7, v10, 0, 0);
  }
}

void __57__HDSSetupService__handlePurgeSUNoSetup_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    if (gLogCategory_HDSSetupService > 90
      || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  if ([v7 updateState] == 9 || objc_msgSend(v7, "updateState") == 10)
  {
    if (gLogCategory_HDSSetupService > 30
      || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_18;
    }
    goto LABEL_9;
  }
  if ([v7 updateState] != 1 && objc_msgSend(v7, "updateState") != 17)
  {
    uint64_t v10 = [*(id *)(a1 + 32) suControllerManager];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__HDSSetupService__handlePurgeSUNoSetup_responseHandler___block_invoke_2;
    v11[3] = &unk_26503FE50;
    id v12 = *(id *)(a1 + 40);
    [v10 purgeUpdate:v8 completion:v11];

    goto LABEL_19;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
LABEL_9:
    LogPrintF();
  }
LABEL_18:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
LABEL_19:
}

void __57__HDSSetupService__handlePurgeSUNoSetup_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (gLogCategory_HDSSetupService > 90
      || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_11;
    }
LABEL_7:
    LogPrintF();
    goto LABEL_11;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

- (void)_handleSessionEnded:(id)a3
{
  sfSession = (SFSession *)a3;
  id v5 = sfSession;
  if (self->_sfSession != sfSession) {
    goto LABEL_2;
  }
  if (sfSession && gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_8;
      }
      sfSession = self->_sfSession;
    }
    v21 = [(SFSession *)sfSession peer];
    LogPrintF();
  }
LABEL_8:
  sysDropService = self->_sysDropService;
  if (sysDropService)
  {
    [(SysDropService *)sysDropService invalidate];
    id v7 = self->_sysDropService;
  }
  else
  {
    id v7 = 0;
  }
  self->_sysDropService = 0;

  apcPlayer = self->_apcPlayer;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __39__HDSSetupService__handleSessionEnded___block_invoke;
  v22[3] = &unk_26503F6A8;
  v22[4] = self;
  [(APCPlayer *)apcPlayer stopSend:0 withCompletion:v22];
  id v9 = self->_apcPlayer;
  self->_apcPlayer = 0;

  if (self->_siriClient)
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFSiriClient *)self->_siriClient stopSpeaking];
  }
  [(RPCompanionLinkClient *)self->_companionLinkClient invalidate];
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  if (self->_siriDidDeviceSetup)
  {
    [(SFSiriClient *)self->_siriClient deviceSetupEnd];
    self->_siriDidDeviceSetup = 0;
  }
  [(SFDeviceOperationHandlerWiFiSetup *)self->_wifiSetupHandler invalidate];
  wifiSetupHandler = self->_wifiSetupHandler;
  self->_wifiSetupHandler = 0;

  [(SFDeviceOperationHandlerCNJSetup *)self->_captiveNetworkHandler invalidate];
  captiveNetworkHandler = self->_captiveNetworkHandler;
  self->_captiveNetworkHandler = 0;

  homeKitSetupHandler = self->_homeKitSetupHandler;
  self->_homeKitSetupHandler = 0;

  [(SFDeviceOperationHandlerCDPSetup *)self->_cdpSetupHandler invalidate];
  cdpSetupHandler = self->_cdpSetupHandler;
  self->_cdpSetupHandler = 0;

  semaForScanFoundSU = self->_semaForScanFoundSU;
  self->_semaForScanFoundSU = 0;

  errorForScanSUNoSetup = self->_errorForScanSUNoSetup;
  self->_errorForScanSUNoSetup = 0;

  self->_canCompanionShowHomePodSU = 0;
  v17 = self->_sfSession;
  self->_sfSession = 0;

  [(SFService *)self->_sfService setNeedsSetup:!self->_finished];
  if (+[HDSDefaults disableNeedsSetup]
    && isInternalBuild())
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(SFService *)self->_sfService setNeedsSetup:0];
  }
  [(HDSSetupService *)self removeSysDropProfile];
  if (self->_finished && !self->_finishedEventSent)
  {
    self->_finishedEventSent = 1;
    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 96, 0);
    }
  }
  v19 = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (v19) {
    v19[2](v19, 32, 0);
  }
  if (self->_finished) {
    self->_finishSessionEnded = 1;
  }
  if (self->_finished2)
  {
    v20 = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (v20) {
      v20[2](v20, 100, 0);
    }
  }
LABEL_2:
}

uint64_t __39__HDSSetupService__handleSessionEnded___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 432);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 710, 0);
  }
  return result;
}

- (void)_handleAuthActionRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v13 = v6;
    LogPrintF();
  }
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 6) {
      uint64_t v10 = "?";
    }
    else {
      uint64_t v10 = off_2650400E8[(int)Int64Ranged];
    }
    id v13 = (id)v10;
    LogPrintF();
  }
  switch((int)Int64Ranged)
  {
    case 1:
      [(HDSSetupService *)self _handleAuthActionAudioPasscodeInit:v6 response:v8];
      goto LABEL_29;
    case 2:
      [(HDSSetupService *)self _handleAuthActionAudioPasscodeStartWithResponse:v8];
      goto LABEL_29;
    case 3:
      apcPlayer = self->_apcPlayer;
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __60__HDSSetupService__handleAuthActionRequest_responseHandler___block_invoke;
      v14[3] = &unk_26503F6A8;
      v14[4] = self;
      [(APCPlayer *)apcPlayer stopSend:0 withCompletion:v14];
      id v12 = self->_apcPlayer;
      self->_apcPlayer = 0;

      goto LABEL_29;
    case 4:
      [(HDSSetupService *)self _handleAuthActionSiriInit:v6];
      goto LABEL_29;
    case 5:
      [(HDSSetupService *)self _handleAuthActionSiriStart:v6 response:v8 responseHandler:v7];
      goto LABEL_34;
    case 6:
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(SFSiriClient *)self->_siriClient stopSpeaking];
      goto LABEL_29;
    default:
      if (gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        id v13 = (id)Int64Ranged;
        LogPrintF();
      }
      objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_26F260EB0, @"er", v13);
LABEL_29:
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v8);
LABEL_34:

      return;
  }
}

uint64_t __60__HDSSetupService__handleAuthActionRequest_responseHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 432);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 710, 0);
  }
  return result;
}

- (void)_handleAuthActionAudioPasscodeInit:(id)a3 response:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  id v8 = (NSData *)objc_claimAutoreleasedReturnValue();
  p_apcCapData = &self->_apcCapData;
  if (v8)
  {
    objc_storeStrong((id *)p_apcCapData, v8);
  }
  else
  {
    id v8 = *p_apcCapData;
    if (!v8)
    {
      if (gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v8 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v27 = 0;
      uint64_t v30 = 4294960591;
      goto LABEL_54;
    }
  }
  apcPlayer = self->_apcPlayer;
  if (apcPlayer)
  {
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __63__HDSSetupService__handleAuthActionAudioPasscodeInit_response___block_invoke;
    v36[3] = &unk_26503F6A8;
    v36[4] = self;
    [(APCPlayer *)apcPlayer stopSend:1 withCompletion:v36];
  }
  uint64_t v11 = (APCPlayer *)[objc_alloc(getAPCPlayerClass()) initWithListenerCapabilityData:v8 payloadLength:3];
  id v12 = self->_apcPlayer;
  self->_apcPlayer = v11;

  id v13 = self->_apcPlayer;
  if (!v13)
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v27 = 0;
    uint64_t v30 = 4294960564;
    goto LABEL_54;
  }
  [(APCPlayer *)v13 setDispatchQueue:self->_dispatchQueue];
  __str[0] = 0;
  int v14 = 298;
  do
    RandomString();
  while (__str[0] == 48 && v14-- != 0);
  v16 = [NSString stringWithUTF8String:__str];
  [(SFService *)self->_sfService setFixedPIN:v16];

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    int v17 = IsAppleInternalBuild();
    v18 = "*";
    if (v17) {
      v18 = __str;
    }
    v31 = v18;
    LogPrintF();
  }
  unint64_t v19 = strtoul(__str, 0, 10);
  __int16 v34 = v19;
  char v35 = BYTE2(v19);
  v20 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v34 length:3];
  v21 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HomeDeviceSetup"];
  v22 = [v21 URLForResource:@"HomePodPasscode-b238.m4a" withExtension:0];
  if (v22)
  {
    v23 = self->_apcPlayer;
    id v33 = 0;
    [(APCPlayer *)v23 preparePayload:v20 usingCarrierAtURL:v22 error:&v33];
    id v24 = (char *)v33;
  }
  else
  {
    NSErrorWithOSStatusF();
    id v24 = (char *)objc_claimAutoreleasedReturnValue();
  }
  v25 = v24;
  if (v24)
  {
    if (gLogCategory_HDSSetupService <= 90
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      v31 = v25;
      LogPrintF();
    }
    int v26 = self->_apcPlayer;
    v32 = v25;
    -[APCPlayer preparePayload:usingCarrierAsset:error:](v26, "preparePayload:usingCarrierAsset:error:", v20, 3, &v32, v31);
    v27 = v32;

    if (v27)
    {
      if (gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        v31 = v27;
        LogPrintF();
      }
      goto LABEL_51;
    }
  }
  uint64_t v28 = [(APCPlayer *)self->_apcPlayer configurationData];
  if (!v28)
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v27 = 0;
LABEL_51:
    uint64_t v30 = 4294960596;
LABEL_54:
    id v29 = objc_msgSend(NSNumber, "numberWithInt:", v30, v31);
    [v7 setObject:v29 forKeyedSubscript:@"er"];
    goto LABEL_34;
  }
  id v29 = (void *)v28;
  [v7 setObject:v28 forKeyedSubscript:@"apcPC"];
  v27 = 0;
LABEL_34:
}

uint64_t __63__HDSSetupService__handleAuthActionAudioPasscodeInit_response___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 432);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 710, 0);
  }
  return result;
}

- (void)_handleAuthActionAudioPasscodeStartWithResponse:(id)a3
{
  id v4 = a3;
  apcPlayer = self->_apcPlayer;
  if (apcPlayer)
  {
LABEL_2:
    [(APCPlayer *)apcPlayer startSend];
    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 60, 0);
    }
    goto LABEL_23;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v7 = self->_apcCapData;
  if (v7)
  {
    id v8 = (APCPlayer *)[objc_alloc(getAPCPlayerClass()) initWithListenerCapabilityData:v7 payloadLength:3];
    id v9 = self->_apcPlayer;
    self->_apcPlayer = v8;

    uint64_t v10 = self->_apcPlayer;
    if (v10)
    {
      [(APCPlayer *)v10 setDispatchQueue:self->_dispatchQueue];
      id v11 = [(SFService *)self->_sfService fixedPIN];
      id v12 = (const char *)[v11 UTF8String];

      if (v12)
      {
        unint64_t v13 = strtoul(v12, 0, 10);
        __int16 v27 = v13;
        char v28 = BYTE2(v13);
        int v14 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v27 length:3];
        id v15 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HomeDeviceSetup"];
        v16 = [v15 URLForResource:@"HomePodPasscode-b238.m4a" withExtension:0];
        if (v16)
        {
          int v17 = self->_apcPlayer;
          id v26 = 0;
          [(APCPlayer *)v17 preparePayload:v14 usingCarrierAtURL:v16 error:&v26];
          id v18 = v26;
        }
        else
        {
          NSErrorWithOSStatusF();
          id v18 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v19 = (uint64_t)v18;
        if (v18)
        {
          v20 = self->_apcPlayer;
          id v25 = (id)v19;
          [(APCPlayer *)v20 preparePayload:v14 usingCarrierAsset:3 error:&v25];
          id v21 = v25;

          if (v21)
          {
            if (gLogCategory_HDSSetupService <= 60
              && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
            {
              id v24 = v21;
              LogPrintF();
            }
            int v22 = 8;
            uint64_t v19 = 4294960596;
            goto LABEL_19;
          }
          uint64_t v19 = 0;
        }
        else
        {
          id v21 = 0;
        }
        int v22 = 0;
LABEL_19:

        goto LABEL_20;
      }
      if (gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v21 = 0;
      int v14 = 0;
      int v22 = 8;
      uint64_t v19 = 4294960551;
    }
    else
    {
      if (gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v21 = 0;
      int v14 = 0;
      int v22 = 8;
      uint64_t v19 = 4294960564;
    }
  }
  else
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v21 = 0;
    int v14 = 0;
    int v22 = 8;
    uint64_t v19 = 4294960591;
  }
LABEL_20:

  if (!v22)
  {
    apcPlayer = self->_apcPlayer;
    goto LABEL_2;
  }
  if (v19)
  {
    v23 = [NSNumber numberWithInt:v19];
    [v4 setObject:v23 forKeyedSubscript:@"er"];
  }
LABEL_23:
}

- (void)_handleAuthActionSiriInit:(id)a3
{
  id v4 = a3;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8[0] = 0;
  RandomString();
  id v5 = [NSString stringWithUTF8String:v8];
  [(SFService *)self->_sfService setFixedPIN:v5];

  if (IsAppleInternalBuild())
  {
    CFStringGetTypeID();
    id v6 = CFDictionaryGetTypedValue();
    if (![v6 length])
    {
      CFStringGetTypeID();
      uint64_t v7 = CFPrefs_CopyTypedValue();

      id v6 = (void *)v7;
    }
    if ([v6 length])
    {
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(SFService *)self->_sfService setFixedPIN:v6];
    }
  }
}

- (void)_handleAuthActionSiriStart:(id)a3 response:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v20 = v8;
    LogPrintF();
  }
  id v11 = [(SFService *)self->_sfService fixedPIN];
  if ((unint64_t)[v11 length] <= 3)
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      id v21 = v11;
      LogPrintF();
    }
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithInt:", 4294960551, v21);
    [v9 setObject:v19 forKeyedSubscript:@"er"];

    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v9);
  }
  else
  {
    CFStringGetTypeID();
    id v12 = CFDictionaryGetTypedValue();
    CFStringGetTypeID();
    unint64_t v13 = CFDictionaryGetTypedValue();
    uint64_t v14 = CFDictionaryGetInt64Ranged() << 32;
    CFStringGetTypeID();
    id v15 = CFDictionaryGetTypedValue();
    if (v14 == 0x200000000) {
      unsigned int v16 = 64;
    }
    else {
      unsigned int v16 = 192;
    }
    if (v14 == 0x100000000) {
      uint64_t v17 = 128;
    }
    else {
      uint64_t v17 = v16;
    }
    if (v12
      && gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v13
      && gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v15
      && gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    siriClient = self->_siriClient;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __71__HDSSetupService__handleAuthActionSiriStart_response_responseHandler___block_invoke;
    v22[3] = &unk_26503FC70;
    id v23 = v9;
    id v24 = v10;
    [(SFSiriClient *)siriClient speakPasscode:v11 instructions:v12 languageCode:v13 voiceName:v15 flags:v17 completion:v22];
  }
}

uint64_t __71__HDSSetupService__handleAuthActionSiriStart_response_responseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [NSNumber numberWithInt:NSErrorToOSStatus()];
    [*(id *)(a1 + 32) setObject:v3 forKeyedSubscript:@"er"];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (int)_handleBasicConfigRequest:(id)a3
{
  id v4 = a3;
  unsigned int v85 = 0;
  id v5 = [(id)objc_opt_class() signpostLog];
  unint64_t v6 = [(HDSSetupService *)self signpostID];
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "BasicConfig", "", buf, 2u);
    }
  }

  apcPlayer = self->_apcPlayer;
  v83[0] = MEMORY[0x263EF8330];
  v83[1] = 3221225472;
  v83[2] = __45__HDSSetupService__handleBasicConfigRequest___block_invoke;
  v83[3] = &unk_26503F6A8;
  v83[4] = self;
  [(APCPlayer *)apcPlayer stopSend:0 withCompletion:v83];
  id v9 = self->_apcPlayer;
  self->_apcPlayer = 0;

  uint64_t Int64 = CFDictionaryGetInt64();
  uint64_t v11 = Int64;
  if (!v85) {
    softLink_AXSVoiceOverTouchSetEnabled(Int64 != 0);
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v12 = "no";
    if (v11) {
      id v12 = "yes";
    }
    v78 = v12;
    uint64_t v79 = v85;
    v77 = @"voe";
    LogPrintF();
  }
  CFDictionaryGetDouble();
  double v14 = v13;
  if (!v85)
  {
    float v15 = v13;
    softLink_AXSVoiceOverTouchSetSpeakingRate(v15);
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    uint64_t v79 = v85;
    v78 = *(const char **)&v14;
    v77 = @"vosr";
    LogPrintF();
  }
  unsigned int v16 = [(objc_class *)getAXSettingsClass() sharedInstance];
  uint64_t v17 = CFDictionaryGetInt64();
  uint64_t v18 = v17;
  if (!v85) {
    objc_msgSend(v16, "setTouchAccommodationsEnabled:", v17 != 0, v77, v78, v79);
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    uint64_t v19 = "no";
    if (v18) {
      uint64_t v19 = "yes";
    }
    v78 = v19;
    uint64_t v79 = v85;
    v77 = @"taE";
    LogPrintF();
  }
  uint64_t v20 = CFDictionaryGetInt64();
  uint64_t v21 = v20;
  if (!v85) {
    objc_msgSend(v16, "setTouchAccommodationsHoldDurationEnabled:", v20 != 0, v77, v78, v79);
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    int v22 = "no";
    if (v21) {
      int v22 = "yes";
    }
    v78 = v22;
    uint64_t v79 = v85;
    v77 = @"taHE";
    LogPrintF();
  }
  CFDictionaryGetDouble();
  double v24 = v23;
  if (!v85) {
    [v16 setTouchAccommodationsHoldDuration:v23];
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    uint64_t v79 = v85;
    v78 = *(const char **)&v24;
    v77 = @"taHD";
    LogPrintF();
  }
  uint64_t v25 = CFDictionaryGetInt64();
  if (!v85) {
    objc_msgSend(v16, "setTouchAccommodationsIgnoreRepeatEnabled:", v25 != 0, v77, v78, v79);
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionaryGetDouble();
  if (!v85) {
    [v16 setTouchAccommodationsIgnoreRepeatDuration:v26];
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (!v85) {
    [v16 setTouchAccommodationsTapActivationMethod:Int64Ranged];
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionaryGetDouble();
  if (!v85) {
    [v16 setTouchAccommodationsTapActivationTimeout:v28];
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionaryGetDouble();
  if (!v85) {
    [v16 setVoiceOverDoubleTapInterval:v29];
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v30 = CFDictionaryGetInt64();
  v31 = (CFStringRef *)MEMORY[0x263EFFE48];
  if (v30)
  {
    CFPrefs_SetValue();
    CFPrefs_SetInt64();
    CFPreferencesSetValue(@"AcceptProfileServicePayloadOnHomePod", (CFPropertyListRef)*MEMORY[0x263EFFB40], *v31, (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (CFDictionaryGetInt64Ranged()) {
    CFPrefs_SetInt64();
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v32 = CFDictionaryGetInt64();
  if (!v85) {
    [(objc_class *)getCLLocationManagerClass() setLocationServicesEnabled:v32 != 0];
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  id v33 = (NSString *)objc_claimAutoreleasedReturnValue();
  languageCode = self->_languageCode;
  self->_languageCode = v33;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v85)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    char v35 = (NSString *)objc_claimAutoreleasedReturnValue();
    v36 = self->_languageCode;
    self->_languageCode = v35;

    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  v37 = self->_languageCode;
  if (v37) {
    CFPreferencesSetAppValue(@"AppleLanguageCodeSetup", v37, *v31);
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v38 = (NSString *)objc_claimAutoreleasedReturnValue();
  localeIdentifier = self->_localeIdentifier;
  self->_localeIdentifier = v38;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v40 = self->_localeIdentifier;
  if (v40) {
    CFPreferencesSetAppValue(@"AppleLocaleSetup", v40, *v31);
  }

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v41 = (NSString *)objc_claimAutoreleasedReturnValue();
  temperatureUnit = self->_temperatureUnit;
  self->_temperatureUnit = v41;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFPreferencesAppSynchronize(*v31);
  if ([(SFSession *)self->_sfSession sharingSourceVersion] - 16300101 > 0x13D5BA)
  {
    self->_siriDataSharingDeviceIsValid = 1;
    uint64_t v43 = CFDictionaryGetInt64();
    if (!v85)
    {
      if (v43) {
        int v44 = 6;
      }
      else {
        int v44 = 5;
      }
      self->_siriDataSharingState = v44;
    }
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    self->_siriDataSharingDeviceIsValid = 0;
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_siriDataSharingState = 5;
  }
  self->_siriDisabled = CFDictionaryGetInt64() != 0;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v45 = (NSString *)objc_claimAutoreleasedReturnValue();
  siriListenLanguage = self->_siriListenLanguage;
  self->_siriListenLanguage = v45;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_siriVoiceGender = (int)CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v47 = (NSString *)objc_claimAutoreleasedReturnValue();
  siriVoiceLanguage = self->_siriVoiceLanguage;
  self->_siriVoiceLanguage = v47;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v49 = (NSString *)objc_claimAutoreleasedReturnValue();
  siriVoiceName = self->_siriVoiceName;
  self->_siriVoiceName = v49;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDateGetTypeID();
  CFDictionaryGetTypedValue();
  v51 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timeObj = self->_timeObj;
  self->_timeObj = v51;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_timeObj)
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      getTMSourceProxBuddy();
      LogPrintF();
    }
    uint64_t TMSourceProxBuddy = getTMSourceProxBuddy();
    [(NSDate *)self->_timeObj timeIntervalSinceReferenceDate];
    softLinkTMSetSourceTime(TMSourceProxBuddy, v54, 10.0);
  }
  int v55 = CFDictionaryGetInt64() != 0;
  if (v85) {
    int v55 = -1;
  }
  self->_timeAuto = v55;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_timeCycle = (int)CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v56 = (NSString *)objc_claimAutoreleasedReturnValue();
  timeZone = self->_timeZone;
  self->_timeZone = v56;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  BOOL v58 = CFDictionaryGetInt64() != 0;
  if (v85) {
    int v59 = -1;
  }
  else {
    int v59 = v58;
  }
  self->_timeZoneAuto = v59;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v60 = (HMDeviceSetupOperationHandler *)objc_alloc_init(getHMDeviceSetupOperationHandlerClass());
  homeKitSetupHandler = self->_homeKitSetupHandler;
  self->_homeKitSetupHandler = v60;

  v62 = self->_homeKitSetupHandler;
  v63 = [(SFSession *)self->_sfSession trSession];
  [(HMDeviceSetupOperationHandler *)v62 registerMessageHandlersForSession:v63];

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v64 = CFDictionaryGetInt64();
  if (self->_languageCode)
  {
    uint64_t v65 = v64;
    v66 = [(objc_class *)getVTPreferencesClass() sharedPreferences];
    int v67 = [v66 isCompactVoiceTriggerAvailableForLanguageCode:self->_languageCode];

    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v67)
    {
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v68 = [(objc_class *)getVTPreferencesClass() sharedPreferences];
      v69 = [v68 setUserPreferredVoiceTriggerPhraseType:v65 != 0 sender:self deviceType:0 endpointId:0];

      if (v69
        && gLogCategory_HDSSetupService <= 60
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  v70 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__HDSSetupService__handleBasicConfigRequest___block_invoke_2;
  block[3] = &unk_26503F8C8;
  id v71 = v4;
  id v81 = v71;
  BOOL v82 = v58;
  dispatch_async(v70, block);

  v72 = [(id)objc_opt_class() signpostLog];
  unint64_t v73 = [(HDSSetupService *)self signpostID];
  if (v73 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v74 = v73;
    if (os_signpost_enabled(v72))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v72, OS_SIGNPOST_INTERVAL_END, v74, "BasicConfig", "", buf, 2u);
    }
  }

  progressHandler = (void (**)(id, uint64_t, id))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 80, v71);
  }

  return 0;
}

uint64_t __45__HDSSetupService__handleBasicConfigRequest___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 432);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 710, 0);
  }
  return result;
}

void __45__HDSSetupService__handleBasicConfigRequest___block_invoke_2(uint64_t a1)
{
  uint64_t Int64 = CFDictionaryGetInt64();
  id v3 = [MEMORY[0x263F53C50] sharedConnection];
  [v3 setBoolValue:Int64 != 0 forSetting:*MEMORY[0x263F538B8]];

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v4 = "no";
    if (Int64) {
      id v4 = "yes";
    }
    id v9 = v4;
    uint64_t v10 = 0;
    id v8 = @"eca";
    LogPrintF();
  }
  uint64_t v5 = CFDictionaryGetInt64();
  unint64_t v6 = objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", v8, v9, v10);
  [v6 setBoolValue:v5 != 0 forSetting:*MEMORY[0x263F53878]];

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionaryGetInt64();
  os_signpost_id_t v7 = [MEMORY[0x263F53C50] sharedConnection];
  [v7 setBoolValue:*(unsigned __int8 *)(a1 + 40) forSetting:*MEMORY[0x263F539C0]];

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_handleBasicConfigResponse:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (gLogCategory_HDSSetupService <= 30)
  {
    id v5 = v3;
    if (gLogCategory_HDSSetupService != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v5, v3))
    {
      [v4 count];
      id v3 = (id)LogPrintF();
      id v4 = v5;
    }
  }
  MEMORY[0x270F9A758](v3, v4);
}

- (void)_handleFinishRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = [(id)objc_opt_class() signpostLog];
  unint64_t v9 = [(HDSSetupService *)self signpostID];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Finish", "", buf, 2u);
    }
  }

  self->_finishSessionEnded = 0;
  [(HDSSetupService *)self _handleFinishApply:v6 responseHandler:v7];
}

- (void)_handleFinishApply:(id)a3 responseHandler:(id)a4
{
  v47[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v43 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  id v7 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  uint64_t v8 = CFDictionaryGetTypedValue();
  if (v7) {
    CUSetSystemName();
  }
  [(HDSSetupService *)self _setSiriInfo];
  timeZone = self->_timeZone;
  os_signpost_id_t v10 = (CFPropertyListRef *)MEMORY[0x263EFFB40];
  if (timeZone)
  {
    if (gLogCategory_HDSSetupService <= 30)
    {
      if (gLogCategory_HDSSetupService != -1 || (int v11 = _LogCategory_Initialize(), timeZone = self->_timeZone, v11))
      {
        int64_t timeCycle = (int64_t)timeZone;
        LogPrintF();
        timeZone = self->_timeZone;
      }
    }
    [(NSString *)timeZone UTF8String];
    uint64_t v12 = tzlink();
    if (v12)
    {
      if (gLogCategory_HDSSetupService <= 60)
      {
        uint64_t v13 = v12;
        if (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize())
        {
          int64_t timeCycle = (int64_t)self->_timeZone;
          uint64_t v41 = v13;
          LogPrintF();
        }
      }
    }
    CFPreferencesSetAppValue(@"timezone", self->_timeZone, @"com.apple.preferences.datetime");
    CFPreferencesSetAppValue(@"timezoneset", *v10, @"com.apple.preferences.datetime");
    CFPreferencesAppSynchronize(@"com.apple.preferences.datetime");
    [MEMORY[0x263EFFA18] resetSystemTimeZone];
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    if (self->_timeZoneAuto) {
      double v14 = "on";
    }
    else {
      double v14 = "off";
    }
    int64_t timeCycle = (int64_t)v14;
    LogPrintF();
  }
  softLinkTMSetAutomaticTimeZoneEnabled(1);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    if (self->_timeAuto) {
      float v15 = "on";
    }
    else {
      float v15 = "off";
    }
    int64_t timeCycle = (int64_t)v15;
    LogPrintF();
  }
  softLinkTMSetAutomaticTimeEnabled(1);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    int64_t timeCycle = self->_timeCycle;
    LogPrintF();
  }
  v42 = (void *)v8;
  int64_t v16 = self->_timeCycle;
  if (v16 == 12) {
    CFPropertyListRef v17 = *v10;
  }
  else {
    CFPropertyListRef v17 = 0;
  }
  if (v16 == 24) {
    CFPropertyListRef v18 = *v10;
  }
  else {
    CFPropertyListRef v18 = 0;
  }
  CFStringRef v19 = (const __CFString *)*MEMORY[0x263EFFE48];
  CFPreferencesSetAppValue(@"AppleICUForce12HourTime", v17, (CFStringRef)*MEMORY[0x263EFFE48]);
  CFPreferencesSetAppValue(@"AppleICUForce24HourTime", v18, v19);
  CFPreferencesAppSynchronize(v19);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  softLinkTMSetupTime(self->_dispatchQueue, &__block_literal_global_4, 30.0);
  languageCode = self->_languageCode;
  if (languageCode)
  {
    uint64_t v21 = self->_languageCode;
    if (gLogCategory_HDSSetupService <= 30)
    {
      uint64_t v21 = self->_languageCode;
      if (gLogCategory_HDSSetupService != -1 || (v22 = _LogCategory_Initialize(), uint64_t v21 = self->_languageCode, v22))
      {
        int64_t timeCycle = (int64_t)v21;
        LogPrintF();
        uint64_t v21 = self->_languageCode;
      }
    }
    double v23 = (void *)MEMORY[0x263EFF960];
    v47[0] = v21;
    double v24 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v47, 1, timeCycle, v41);
    [v23 setPreferredLanguages:v24];
  }
  CFPreferencesSetAppValue(@"AppleLanguageCodeSetup", 0, v19);
  localeIdentifier = self->_localeIdentifier;
  BOOL v26 = localeIdentifier != 0;
  if (localeIdentifier)
  {
    __int16 v27 = self->_localeIdentifier;
    if (gLogCategory_HDSSetupService <= 30)
    {
      if (gLogCategory_HDSSetupService != -1 || (int v28 = _LogCategory_Initialize(), v27 = self->_localeIdentifier, v28))
      {
        int64_t timeCycle = (int64_t)v27;
        LogPrintF();
        __int16 v27 = self->_localeIdentifier;
      }
    }
    CFPreferencesSetAppValue(@"AppleLocale", v27, v19);
    CFPreferencesAppSynchronize(v19);
  }
  CFPreferencesSetAppValue(@"AppleLocaleSetup", 0, v19);
  temperatureUnit = self->_temperatureUnit;
  if (temperatureUnit)
  {
    if (gLogCategory_HDSSetupService <= 30)
    {
      if (gLogCategory_HDSSetupService != -1
        || (int v30 = _LogCategory_Initialize(), temperatureUnit = self->_temperatureUnit, v30))
      {
        int64_t timeCycle = (int64_t)temperatureUnit;
        LogPrintF();
        temperatureUnit = self->_temperatureUnit;
      }
    }
    objc_msgSend(MEMORY[0x263EFF960], "_setPreferredTemperatureUnit:", temperatureUnit, timeCycle);
    BOOL v26 = 1;
  }
  else if (!((unint64_t)languageCode | (unint64_t)localeIdentifier))
  {
    goto LABEL_81;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (lockdown_connect())
  {
    if (languageCode) {
      lockdown_set_value();
    }
    if (v26) {
      lockdown_set_value();
    }
    lockdown_disconnect();
  }
  else if (gLogCategory_HDSSetupService <= 60 {
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  notify_post("AppleDatePreferencesChangedNotification");
  notify_post("AppleTimePreferencesChangedNotification");
  notify_post("AppleNumberPreferencesChangedNotification");
  notify_post("AppleLanguagePreferencesChangedNotification");
  notify_post("com.apple.language.changed");
LABEL_81:
  CFAbsoluteTimeGetCurrent();
  CFPrefs_SetDouble();
  self->_finished = 1;
  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 95, 0);
  }
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  finishApplyTimer = self->_finishApplyTimer;
  if (finishApplyTimer)
  {
    __int16 v34 = finishApplyTimer;
    dispatch_source_cancel(v34);
    char v35 = self->_finishApplyTimer;
    self->_finishApplyTimer = 0;
  }
  v36 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v37 = self->_finishApplyTimer;
  self->_finishApplyTimer = v36;

  uint64_t v38 = self->_finishApplyTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __54__HDSSetupService__handleFinishApply_responseHandler___block_invoke_2;
  handler[3] = &unk_26503FEC0;
  int v46 = Int64Ranged;
  handler[4] = self;
  id v45 = v43;
  id v39 = v43;
  dispatch_source_set_event_handler(v38, handler);
  HDSDispatchTimerSet(self->_finishApplyTimer, 4.0, -1.0, -4.0);
  dispatch_resume((dispatch_object_t)self->_finishApplyTimer);
}

void __54__HDSSetupService__handleFinishApply_responseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
LABEL_9:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupService <= 30 {
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_9;
  }
}

uint64_t __54__HDSSetupService__handleFinishApply_responseHandler___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 40);
  if (v2)
  {
    id v3 = v2;
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 48);
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  return [v7 _handleFinishDone:v6 responseHandler:v8];
}

- (void)_handleFinishDone:(unsigned int)a3 responseHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    uint64_t v23 = v4;
    double v24 = &unk_23EBBE694;
    LogPrintF();
  }
  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 0, v23, v24);
  [(SFService *)self->_sfService setDeviceActionType:0];
  id v7 = (void *)[objc_alloc(getFLFollowUpControllerClass()) initWithClientIdentifier:0];
  [v7 clearPendingFollowUpItems:0];
  [(HDSSetupService *)self _boostiTunesCloudDaemon];
  if (!self->_finishedEventSent)
  {
    self->_finishedEventSent = 1;
    progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
    if (progressHandler) {
      progressHandler[2](progressHandler, 96, 0);
    }
  }
  uint64_t v9 = mach_absolute_time();
  int iTunesCloudCompleteToken = self->_iTunesCloudCompleteToken;
  if (iTunesCloudCompleteToken != -1)
  {
    notify_cancel(iTunesCloudCompleteToken);
    self->_int iTunesCloudCompleteToken = -1;
  }
  dispatchQueue = self->_dispatchQueue;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke;
  handler[3] = &unk_26503FEE8;
  handler[4] = self;
  uint64_t v40 = v9;
  int v41 = v4;
  id v12 = v6;
  id v39 = v12;
  notify_register_dispatch("com.apple.itunescloud.setupcompleted", &self->_iTunesCloudCompleteToken, dispatchQueue, handler);
  uint64_t state64 = 0;
  notify_get_state(self->_iTunesCloudCompleteToken, &state64);
  if (state64)
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_iTunesCloudCompleted = 1;
    if (self->_iTunesCloudWaitSeconds == 0.0)
    {
      mach_absolute_time();
      UpTicksToSecondsF();
      self->_iTunesCloudWaitSeconds = v13;
    }
    if ([(HDSSetupService *)self _handleFinishDone2Ready]) {
      goto LABEL_24;
    }
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if ((v4 & 2) != 0)
  {
    uint64_t v14 = mach_absolute_time();
    [(RPCompanionLinkClient *)self->_companionLinkClient invalidate];
    float v15 = (RPCompanionLinkClient *)objc_alloc_init(MEMORY[0x263F62B70]);
    companionLinkClient = self->_companionLinkClient;
    self->_companionLinkClient = v15;

    [(RPCompanionLinkClient *)self->_companionLinkClient setDispatchQueue:self->_dispatchQueue];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke_2;
    v33[3] = &unk_26503FF10;
    v33[4] = self;
    uint64_t v35 = v14;
    int v36 = v4;
    id v17 = v12;
    id v34 = v17;
    [(RPCompanionLinkClient *)self->_companionLinkClient setLocalDeviceUpdatedHandler:v33];
    CFPropertyListRef v18 = self->_companionLinkClient;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke_3;
    v29[3] = &unk_26503FF38;
    v29[4] = self;
    uint64_t v31 = v14;
    int v32 = v4;
    id v30 = v17;
    [(RPCompanionLinkClient *)v18 activateWithCompletion:v29];
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    goto LABEL_30;
  }
  self->_mediaSystemReady = 1;
  if (![(HDSSetupService *)self _handleFinishDone2Ready])
  {
LABEL_30:
    uint64_t v19 = mach_absolute_time();
    uint64_t v20 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    finishTimeoutTimer = self->_finishTimeoutTimer;
    self->_finishTimeoutTimer = v20;

    int v22 = self->_finishTimeoutTimer;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke_4;
    v25[3] = &unk_26503FF60;
    v25[4] = self;
    uint64_t v27 = v19;
    int v28 = v4;
    id v26 = v12;
    dispatch_source_set_event_handler(v22, v25);
    HDSDispatchTimerSet(self->_finishTimeoutTimer, 300.0, -1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_finishTimeoutTimer);

    goto LABEL_31;
  }
LABEL_24:
  [(HDSSetupService *)self _handleFinishDone2:v4 responseHandler:v12];
LABEL_31:
}

uint64_t __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  uint64_t v2 = *(void *)(v1 + 32);
  if (*(_DWORD *)(v2 + 64) != -1)
  {
    *(unsigned char *)(v2 + 61) = 1;
    id v3 = *(double **)(v1 + 32);
    if (v3[9] == 0.0)
    {
      mach_absolute_time();
      UpTicksToSecondsF();
      *(void *)(*(void *)(v1 + 32) + 72) = v4;
      id v3 = *(double **)(v1 + 32);
    }
    uint64_t result = [v3 _handleFinishDone2Ready];
    if (result)
    {
      uint64_t v5 = *(unsigned int *)(v1 + 56);
      id v6 = *(void **)(v1 + 32);
      uint64_t v7 = *(void *)(v1 + 40);
      return [v6 _handleFinishDone2:v5 responseHandler:v7];
    }
  }
  return result;
}

void __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    int v3 = [v7 mediaSystemState];
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      id v6 = v7;
      LogPrintF();
    }
    if (v3 == 4 || v3 == 1)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 80) = 1;
      uint64_t v4 = *(double **)(a1 + 32);
      if (v4[11] == 0.0)
      {
        mach_absolute_time();
        UpTicksToSecondsF();
        *(void *)(*(void *)(a1 + 32) + 88) = v5;
        uint64_t v4 = *(double **)(a1 + 32);
      }
      if (objc_msgSend(v4, "_handleFinishDone2Ready", v6)) {
        [*(id *)(a1 + 32) _handleFinishDone2:*(unsigned int *)(a1 + 56) responseHandler:*(void *)(a1 + 40)];
      }
    }
  }
}

uint64_t __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    id v9 = v3;
    if (gLogCategory_HDSSetupService <= 30)
    {
      if (gLogCategory_HDSSetupService != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v9, v3))
      {
        id v8 = v4;
        id v3 = (id)LogPrintF();
        id v4 = v9;
      }
    }
    if (v4)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 80) = 1;
      uint64_t v5 = *(double **)(a1 + 32);
      if (v5[11] == 0.0)
      {
        mach_absolute_time();
        UpTicksToSecondsF();
        *(void *)(*(void *)(a1 + 32) + 88) = v6;
        uint64_t v5 = *(double **)(a1 + 32);
      }
      id v3 = (id)objc_msgSend(v5, "_handleFinishDone2Ready", v8);
      id v4 = v9;
      if (v3)
      {
        id v3 = (id)[*(id *)(a1 + 32) _handleFinishDone2:*(unsigned int *)(a1 + 56) responseHandler:*(void *)(a1 + 40)];
        id v4 = v9;
      }
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

uint64_t __53__HDSSetupService__handleFinishDone_responseHandler___block_invoke_4(uint64_t a1)
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v2 = *(double **)(a1 + 32);
  if (v2[11] == 0.0)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 88) = v3;
    uint64_t v2 = *(double **)(a1 + 32);
  }
  uint64_t v4 = *(_DWORD *)(a1 + 56) | 4u;
  uint64_t v5 = *(void *)(a1 + 40);
  return [v2 _handleFinishDone2:v4 responseHandler:v5];
}

- (void)_handleFinishDone2:(unsigned int)a3 responseHandler:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v24[3] = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, uint64_t, void, void *))a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(RPCompanionLinkClient *)self->_companionLinkClient invalidate];
  companionLinkClient = self->_companionLinkClient;
  self->_companionLinkClient = 0;

  [(HDSSetupService *)self removeSysDropProfile];
  int iTunesCloudCompleteToken = self->_iTunesCloudCompleteToken;
  if (iTunesCloudCompleteToken != -1)
  {
    notify_cancel(iTunesCloudCompleteToken);
    self->_int iTunesCloudCompleteToken = -1;
  }
  finishTimeoutTimer = self->_finishTimeoutTimer;
  if (finishTimeoutTimer)
  {
    os_signpost_id_t v10 = finishTimeoutTimer;
    dispatch_source_cancel(v10);
    int v11 = self->_finishTimeoutTimer;
    self->_finishTimeoutTimer = 0;
  }
  progressHandler = (void (**)(id, uint64_t, void))self->_progressHandler;
  if (progressHandler) {
    progressHandler[2](progressHandler, 700, 0);
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  siriClient = self->_siriClient;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __54__HDSSetupService__handleFinishDone2_responseHandler___block_invoke;
  v22[3] = &unk_26503F7B8;
  void v22[4] = self;
  [(SFSiriClient *)siriClient deviceSetupPlayGreetingID:5 completion:v22];
  uint64_t v14 = [(id)objc_opt_class() signpostLog];
  unint64_t v15 = [(HDSSetupService *)self signpostID];
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v16 = v15;
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v14, OS_SIGNPOST_INTERVAL_END, v16, "Finish", "", v21, 2u);
    }
  }

  v23[0] = @"finF";
  id v17 = [NSNumber numberWithUnsignedInt:v4];
  v24[0] = v17;
  v23[1] = @"itWS";
  CFPropertyListRef v18 = [NSNumber numberWithDouble:self->_iTunesCloudWaitSeconds];
  v24[1] = v18;
  v23[2] = @"msWS";
  uint64_t v19 = [NSNumber numberWithDouble:self->_mediaSystemWaitSeconds];
  v24[2] = v19;
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
  v6[2](v6, 1, 0, v20);

  [(SFSession *)self->_sfSession sendWithFlags:1 object:&unk_26F260BE0];
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __54__HDSSetupService__handleFinishDone2_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = v3;
  if (gLogCategory_HDSSetupService <= 30)
  {
    id v7 = v3;
    if (gLogCategory_HDSSetupService != -1
      || (uint64_t v3 = (uint64_t (**)(id, uint64_t, void))_LogCategory_Initialize(), v4 = v7, v3))
    {
      uint64_t v3 = (uint64_t (**)(id, uint64_t, void))LogPrintF();
      uint64_t v4 = v7;
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 57) = 1;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 59))
  {
    uint64_t v3 = *(uint64_t (***)(id, uint64_t, void))(v5 + 432);
    if (v3)
    {
      id v8 = v4;
      uint64_t v3 = (uint64_t (**)(id, uint64_t, void))v3[2](v3, 100, 0);
      uint64_t v4 = v8;
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (BOOL)_handleFinishDone2Ready
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_iTunesCloudCompleted && self->_mediaSystemReady;
}

- (void)_handleVoicePreviewRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_voicePreviewer)
  {
    id v8 = (SUICDefaultVoicePreviewer *)objc_alloc_init(getSUICDefaultVoicePreviewerClass());
    voicePreviewer = self->_voicePreviewer;
    self->_voicePreviewer = v8;
  }
  CFStringGetTypeID();
  os_signpost_id_t v10 = CFDictionaryGetTypedValue();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  int v11 = CFDictionaryGetTypedValue();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t Int64Ranged = (int)CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  double v13 = (void *)[objc_alloc(getAFVoiceInfoClass()) initWithLanguageCode:v10 gender:Int64Ranged isCustom:1 name:v11 footprint:0 contentVersion:0 masteredVersion:0];
  uint64_t v14 = self->_voicePreviewer;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __62__HDSSetupService__handleVoicePreviewRequest_responseHandler___block_invoke;
  v16[3] = &unk_26503FF88;
  id v17 = v7;
  id v15 = v7;
  [(SUICDefaultVoicePreviewer *)v14 previewVoice:v13 completion:v16];
}

void __62__HDSSetupService__handleVoicePreviewRequest_responseHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v10[1] = *MEMORY[0x263EF8340];
  id v9 = @"siriVPSuccess";
  uint64_t v5 = NSNumber;
  id v6 = a3;
  id v7 = [v5 numberWithBool:a2];
  v10[0] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_handleCheckHomePodForJS:(id)a3 responseHandler:(id)a4
{
  id v11 = a4;
  id v5 = a3;
  id v6 = objc_opt_new();
  CFStringGetTypeID();
  id v7 = CFDictionaryGetTypedValue();

  if (v7)
  {
    id v8 = [(objc_class *)getVTPreferencesClass() sharedPreferences];
    uint64_t v9 = [v8 isCompactVoiceTriggerAvailableForLanguageCode:v7];

    os_signpost_id_t v10 = [NSNumber numberWithBool:v9];
    [v6 setObject:v10 forKeyedSubscript:@"homepod_js_locale"];
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0, 0, v6);
}

- (void)_handleStartSysDropEnablementProfileTransfer:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(HDSFileTransferService);
  [(HDSFileTransferService *)v8 setFileTransferProgressHandler:&__block_literal_global_751];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __80__HDSSetupService__handleStartSysDropEnablementProfileTransfer_responseHandler___block_invoke_2;
  v12[3] = &unk_26503FFB0;
  v12[4] = self;
  [(HDSFileTransferService *)v8 setFileTransferCompletionHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __80__HDSSetupService__handleStartSysDropEnablementProfileTransfer_responseHandler___block_invoke_3;
  v10[3] = &unk_26503FE50;
  id v11 = v6;
  id v9 = v6;
  [(HDSFileTransferService *)v8 handleSysDropStartFileTransferRequest:v7 responseHandler:v10];
}

uint64_t __80__HDSSetupService__handleStartSysDropEnablementProfileTransfer_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_HDSSetupService <= 30)
  {
    id v5 = v2;
    if (gLogCategory_HDSSetupService != -1 || (v2 = (id)_LogCategory_Initialize(), id v3 = v5, v2))
    {
      id v2 = (id)LogPrintF();
      id v3 = v5;
    }
  }
  return MEMORY[0x270F9A758](v2, v3);
}

void __80__HDSSetupService__handleStartSysDropEnablementProfileTransfer_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v11)
  {
    if (gLogCategory_HDSSetupService <= 90
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    id v6 = [MEMORY[0x263F08850] defaultManager];
    id v7 = [v5 itemURL];
    id v8 = [v7 path];
    id v9 = [v6 contentsAtPath:v8];

    id v10 = (id)[*(id *)(a1 + 32) installProfileData:v9];
  }
}

uint64_t __80__HDSSetupService__handleStartSysDropEnablementProfileTransfer_responseHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
    id v6 = 0;
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_12;
  }
  if (gLogCategory_HDSSetupService <= 30)
  {
    id v6 = v3;
    if (gLogCategory_HDSSetupService != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v6, v3))
    {
      id v3 = (id)LogPrintF();
LABEL_12:
      id v4 = v6;
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (void)_handleStartSysDrop:(id)a3 responseHandler:(id)a4
{
  id v5 = a4;
  id v6 = objc_opt_new();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v7 = objc_alloc_init(SysDropService);
  sysDropService = self->_sysDropService;
  self->_sysDropService = v7;

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__HDSSetupService__handleStartSysDrop_responseHandler___block_invoke;
  v9[3] = &unk_26503FFD8;
  v9[4] = self;
  [(SysDropService *)self->_sysDropService setPeerEventHandler:v9];
  [(SysDropService *)self->_sysDropService setSfService:self->_sfService];
  [(SysDropService *)self->_sysDropService setSfSession:self->_sfSession];
  [(SysDropService *)self->_sysDropService setServiceStartedFromSetup:1];
  [(SysDropService *)self->_sysDropService activate];
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v6);
}

uint64_t __55__HDSSetupService__handleStartSysDrop_responseHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 120) sendWithFlags:0 object:a2];
}

- (void)_handleSUNoSetupScanRequest:(id)a3 responseHandler:(id)a4
{
  id v17 = (void (**)(void))a4;
  id v5 = objc_opt_new();
  id v6 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semaForScanFoundSU = self->_semaForScanFoundSU;
  self->_semaForScanFoundSU = v6;

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = objc_alloc_init(MEMORY[0x263F77B10]);
  [v8 setUserInitiated:1];
  [v8 setDownloadWhenFound:1];
  id v9 = [(HDSSetupService *)self suControllerManager];
  [v9 scanForUpdates:v8];

  id v10 = self->_semaForScanFoundSU;
  dispatch_time_t v11 = dispatch_time(0, 300000000000);
  dispatch_semaphore_wait(v10, v11);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v12 = self->_semaForScanFoundSU;
  self->_semaForScanFoundSU = 0;

  if (self->_scanFoundSUForSUNoSetup)
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_homePodSUNoSetupState = 3;
    double v13 = [NSNumber numberWithInt:3];
    [v5 setObject:v13 forKeyedSubscript:@"unsetup_hp_su_phase"];

    uint64_t v14 = [NSNumber numberWithBool:self->_scanFoundSUForSUNoSetup];
    [v5 setObject:v14 forKeyedSubscript:@"unsetup_hp_su_scan_success"];
  }
  else if (gLogCategory_HDSSetupService <= 30 {
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  }
  {
    errorForScanSUNoSetup = self->_errorForScanSUNoSetup;
    LogPrintF();
    [(HDSSetupService *)self wipeWifiConfig];
  }
  else
  {
    [(HDSSetupService *)self wipeWifiConfig];
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v17[2](v17);
}

- (void)_handleDeviceActivationRequest:(id)a3 responseHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gLogCategory_HDSSetupService <= 40
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v7 = objc_alloc_init(HDSDeviceActivation);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__HDSSetupService__handleDeviceActivationRequest_responseHandler___block_invoke;
  v9[3] = &unk_265040000;
  id v10 = v6;
  id v8 = v6;
  [(HDSDeviceActivation *)v7 performActivationStep:v5 completion:v9];
}

void __66__HDSSetupService__handleDeviceActivationRequest_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (gLogCategory_HDSSetupService <= 40
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v6);
}

- (void)_handlePreAuthRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v51 = v6;
    LogPrintF();
  }
  unsigned int v68 = 0;
  id v8 = [(id)objc_opt_class() signpostLog];
  unint64_t v9 = [(HDSSetupService *)self signpostID];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v10 = v9;
    if (os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PreAuth", "", buf, 2u);
    }
  }

  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t Int64 = CFDictionaryGetInt64();
  self->_peerFeatureFlags = Int64;
  if (!self->_siriDidDeviceSetup)
  {
    [(SFSiriClient *)self->_siriClient deviceSetupBegin:Int64];
    self->_siriDidDeviceSetup = 1;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x263EFFA88], @"cbCapableHP", v51);
  double v13 = (void *)GestaltCopyAnswer();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 setObject:v13 forKeyedSubscript:@"mdN"];
  }
  else if (gLogCategory_HDSSetupService <= 90 {
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  uint64_t v14 = (void *)GestaltCopyAnswer();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 setObject:v14 forKeyedSubscript:@"model"];
  }
  else if (gLogCategory_HDSSetupService <= 90 {
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  uint64_t v15 = (void *)GestaltCopyAnswer();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 setObject:v15 forKeyedSubscript:@"dguid"];
  }
  else if (gLogCategory_HDSSetupService <= 90 {
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  os_signpost_id_t v16 = (void *)GestaltCopyAnswer();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 setObject:v16 forKeyedSubscript:@"dsn"];
  }
  else if (gLogCategory_HDSSetupService <= 90 {
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  CFDictionaryGetTypeID();
  id v17 = CFDictionaryGetTypedValue();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    v52 = v17;
    uint64_t v55 = v68;
    LogPrintF();
  }
  if (objc_msgSend(v17, "count", v52, v55)) {
    softLinkAFPreferencesSetHorsemanSupplementalLanguageDictionary(v17);
  }
  CFPropertyListRef v18 = (void *)GestaltCopyAnswer();

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 setObject:v18 forKeyedSubscript:@"wifiMA"];
  }
  else if (gLogCategory_HDSSetupService <= 90 {
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
  v61 = v17;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  uint64_t v19 = (char *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    id v66 = 0;
    char v20 = [(objc_class *)getAFConnectionClass() assistantIsSupportedForLanguageCode:v19 error:&v66];
    id v21 = v66;
    if ((v20 & 1) == 0)
    {
      id v60 = v7;
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        v53 = v19;
        unint64_t v56 = (unint64_t)v21;
        LogPrintF();
      }
      goto LABEL_67;
    }
  }
  else
  {
    id v21 = 0;
  }
  CFStringGetTypeID();
  uint64_t v22 = CFDictionaryGetTypedValue();
  if (!v22) {
    goto LABEL_84;
  }
  uint64_t v23 = (char *)v22;
  id v60 = v7;
  uint64_t Int64Ranged = (int)CFDictionaryGetInt64Ranged();
  CFStringGetTypeID();
  uint64_t v25 = CFDictionaryGetTypedValue();
  if (![v25 length])
  {
    id v26 = [(objc_class *)getAFLocalizationClass() sharedInstance];
    [v26 voiceNamesForOutputLanguageCode:v23 gender:Int64Ranged];
    int v59 = self;
    uint64_t v27 = v19;
    id v28 = v6;
    v30 = id v29 = v21;
    uint64_t v31 = [v30 firstObject];

    id v21 = v29;
    id v6 = v28;
    uint64_t v19 = v27;
    self = v59;

    uint64_t v25 = (void *)v31;
  }
  int v32 = (__CFString *)[objc_alloc(getAFVoiceInfoClass()) initWithLanguageCode:v23 gender:Int64Ranged isCustom:0 name:v25 footprint:2 contentVersion:0 masteredVersion:0];
  if (([(__CFString *)v32 isValidForSiriSessionLanguage:v19] & 1) == 0)
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      unint64_t v56 = (unint64_t)v19;
      id v58 = v21;
      v53 = v23;
      LogPrintF();
    }

LABEL_67:
    objc_msgSend(v11, "setObject:forKeyedSubscript:", &unk_26F260EE0, @"siriFl", v53, v56, v58);
    id v33 = softLinkAFPreferencesSupportedLanguages();
    uint64_t v23 = (char *)[v33 mutableCopy];

    uint64_t v25 = [(objc_class *)getAFPreferencesClass() sharedPreferences];
    int v32 = [v25 bestSupportedLanguageCodeForLanguageCode:v19];
    uint64_t v34 = [v23 indexOfObject:v32];
    if (!v32 || v34 == 0x7FFFFFFFFFFFFFFFLL)
    {

      int v32 = @"en-US";
      if (gLogCategory_HDSSetupService > 30
        || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_79;
      }
      double v54 = v19;
      v57 = @"en-US";
    }
    else
    {
      if (gLogCategory_HDSSetupService > 30
        || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_79;
      }
      double v54 = v19;
      v57 = v32;
    }
    LogPrintF();
LABEL_79:
    uint64_t v35 = objc_msgSend(v23, "indexOfObject:", v32, v54, v57);
    if (v35 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [v23 removeObjectAtIndex:v35];
      [v23 insertObject:v32 atIndex:0];
    }
    if (v23) {
      [v11 setObject:v23 forKeyedSubscript:@"siriLangs"];
    }
  }

  id v7 = v60;
LABEL_84:
  if (_os_feature_enabled_impl()) {
    uint64_t v36 = 4495;
  }
  else {
    uint64_t v36 = 399;
  }
  int v37 = SFDeviceSupportsTVAudio();
  uint64_t v38 = v36 | 0x400;
  if (!v37) {
    uint64_t v38 = v36;
  }
  uint64_t v39 = 10256;
  if (!self->_prefCDPEnabled) {
    uint64_t v39 = 10240;
  }
  uint64_t v40 = [NSNumber numberWithUnsignedLongLong:v39 | v38];
  [v11 setObject:v40 forKeyedSubscript:@"ff"];

  int v41 = (void *)MGCopyAnswer();
  [v11 setObject:v41 forKeyedSubscript:@"hpBuildVersion"];
  v42 = objc_msgSend(NSNumber, "numberWithBool:", -[HMHomeManager needsOSUpdateToRunHH2](self->_homeManager, "needsOSUpdateToRunHH2"));
  [v11 setObject:v42 forKeyedSubscript:@"hh2SU"];

  id v43 = (void *)MGCopyAnswer();
  [v11 setObject:v43 forKeyedSubscript:@"hp_bv"];

  uint64_t v44 = MEMORY[0x263EFFA88];
  [v11 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"sd_capa"];
  [v11 setObject:v44 forKeyedSubscript:@"sd_capa_v2"];
  [v11 setObject:v44 forKeyedSubscript:@"hds_tc_v2_"];
  [v11 setObject:v44 forKeyedSubscript:@"wr_v2"];
  BOOL canCompanionShowHomePodSU = CFDictionaryGetInt64() != 0;
  self->_BOOL canCompanionShowHomePodSU = canCompanionShowHomePodSU;
  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_98;
      }
      BOOL canCompanionShowHomePodSU = self->_canCompanionShowHomePodSU;
    }
    if (canCompanionShowHomePodSU) {
      int v46 = "yes";
    }
    else {
      int v46 = "no";
    }
    v53 = v46;
    unint64_t v56 = v68;
    LogPrintF();
  }
LABEL_98:
  v47 = [(HDSSetupService *)self suControllerManager];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __57__HDSSetupService__handlePreAuthRequest_responseHandler___block_invoke;
  v62[3] = &unk_265040028;
  v62[4] = self;
  id v48 = v11;
  id v63 = v48;
  id v49 = v21;
  id v64 = v49;
  id v50 = v7;
  id v65 = v50;
  [v47 managerStatus:v62];
}

void __57__HDSSetupService__handlePreAuthRequest_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  *(void *)(*(void *)(a1 + 32) + 368) = [v7 updateState];
  *(_DWORD *)(*(void *)(a1 + 32) + 364) = [*(id *)(a1 + 32) hdsSUStateForSUState];
  uint64_t v10 = [*(id *)(a1 + 32) isHomePodSUNoSetup];
  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize())
    {
      char v20 = (const char *)v7;
      LogPrintF();
    }
    if (gLogCategory_HDSSetupService <= 30)
    {
      if (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize())
      {
        char v20 = v8;
        LogPrintF();
      }
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        id v11 = "no";
        if (v10) {
          id v11 = "yes";
        }
        char v20 = v11;
        LogPrintF();
      }
    }
  }
  id v12 = objc_msgSend(NSNumber, "numberWithBool:", v10, v20);
  [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:@"unsetup_hp_su_start"];

  double v13 = [NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 32) + 364)];
  [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:@"unsetup_hp_su_phase"];

  if (v9)
  {
    if (gLogCategory_HDSSetupService <= 90
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      id v21 = v9;
      LogPrintF();
    }
    id v14 = v9;
LABEL_28:
    uint64_t v15 = v14;
    goto LABEL_41;
  }
  if ((v10 & 1) == 0)
  {
    if (gLogCategory_HDSSetupService > 30
      || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_40;
    }
    goto LABEL_33;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 408))
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorWithOSStatusF();
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
LABEL_33:
    LogPrintF();
  }
LABEL_40:
  uint64_t v15 = 0;
LABEL_41:
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x263EFFA88], @"unsetup_hp_su_capable", v21);
  os_signpost_id_t v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "homePodNeedsSUNoSetup"));
  [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:@"unsetup_hp_needs_su"];

  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  id v17 = [(id)objc_opt_class() signpostLog];
  uint64_t v18 = [*(id *)(a1 + 32) signpostID];
  if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v19 = v18;
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23EB5C000, v17, OS_SIGNPOST_INTERVAL_END, v19, "PreAuth", "", buf, 2u);
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
}

- (void)_handleRawRequest:(id)a3 flags:(unsigned int)a4 responseHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  v24[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, void, id))a5;
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    unint64_t v21 = (unint64_t)v8;
    LogPrintF();
  }
  if (Int64Ranged == 9)
  {
    if (v6)
    {
      [(HDSSetupService *)self _handleFinishRequest:v8 responseHandler:v9];
      goto LABEL_24;
    }
    int v11 = -6768;
    if (gLogCategory_HDSSetupService <= 60)
    {
      if (gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize()) {
        goto LABEL_34;
      }
LABEL_30:
      LogPrintF();
LABEL_34:
      int v11 = -6768;
    }
  }
  else
  {
    if (Int64Ranged != 8)
    {
      if (gLogCategory_HDSSetupService <= 50
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        unint64_t v21 = Int64Ranged;
        uint64_t v22 = 0;
        LogPrintF();
      }
      int v11 = -6732;
      goto LABEL_18;
    }
    if (v6)
    {
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        unint64_t v21 = (unint64_t)v8;
        LogPrintF();
      }
      int v11 = -[HDSSetupService _handleBasicConfigRequest:](self, "_handleBasicConfigRequest:", v8, v21);
      if (!v11)
      {
        id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
        [(HDSSetupService *)self _handleBasicConfigResponse:v20];
        v9[2](v9, v6, 0, v20);

        goto LABEL_24;
      }
      goto LABEL_18;
    }
    int v11 = -6768;
    if (gLogCategory_HDSSetupService <= 60)
    {
      if (gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize()) {
        goto LABEL_34;
      }
      goto LABEL_30;
    }
  }
LABEL_18:
  id v12 = (void *)MEMORY[0x263F087E8];
  uint64_t v13 = *MEMORY[0x263F08410];
  uint64_t v14 = v11;
  uint64_t v23 = *MEMORY[0x263F08320];
  uint64_t v15 = [NSString stringWithUTF8String:DebugGetErrorString()];
  os_signpost_id_t v16 = (void *)v15;
  id v17 = @"?";
  if (v15) {
    id v17 = (__CFString *)v15;
  }
  v24[0] = v17;
  uint64_t v18 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, &v23, 1, v21, v22);
  os_signpost_id_t v19 = [v12 errorWithDomain:v13 code:v14 userInfo:v18];
  ((void (**)(id, uint64_t, void *, id))v9)[2](v9, v6, v19, 0);

LABEL_24:
}

- (void)_handleSiriDialogIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (gLogCategory_HDSSetupService <= 30)
  {
    id v5 = v3;
    if (gLogCategory_HDSSetupService != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v5, v3))
    {
      id v3 = (id)LogPrintF();
      id v4 = v5;
    }
  }
  MEMORY[0x270F9A758](v3, v4);
}

- (void)_playReadyToSetupSound
{
  id v3 = (CUAudioPlayer *)objc_alloc_init(MEMORY[0x263F38518]);
  audioPlayer = self->_audioPlayer;
  self->_audioPlayer = v3;

  [(CUAudioPlayer *)self->_audioPlayer setDispatchQueue:self->_dispatchQueue];
  [(CUAudioPlayer *)self->_audioPlayer setLabel:@"HomePod Setup"];
  [(CUAudioPlayer *)self->_audioPlayer activate];
  id v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.HomeDeviceSetup"];
  uint64_t v6 = [v5 URLForResource:@"HomePodReadyToSetUp-b238.m4a" withExtension:0];
  if (v6)
  {
    id v7 = [MEMORY[0x263F544E0] sharedAVSystemController];
    int v14 = 1056964608;
    if (([v7 getVolume:&v14 forCategory:@"MediaPlayback"] & 1) == 0
      && gLogCategory_HDSSetupService <= 90
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LODWORD(v8) = 1059145646;
    if (([v7 setVolumeTo:@"MediaPlayback" forCategory:v8] & 1) == 0
      && gLogCategory_HDSSetupService <= 90
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v9 = self->_audioPlayer;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __41__HDSSetupService__playReadyToSetupSound__block_invoke;
    v11[3] = &unk_265040050;
    id v12 = v7;
    int v13 = v14;
    id v10 = v7;
    [(CUAudioPlayer *)v9 playURL:v6 completion:v11];
  }
  else if (gLogCategory_HDSSetupService <= 90 {
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t __41__HDSSetupService__playReadyToSetupSound__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  uint64_t result = [*(id *)(a1 + 32) setVolumeTo:@"MediaPlayback" forCategory:a2];
  if ((result & 1) == 0 && gLogCategory_HDSSetupService <= 90)
  {
    if (gLogCategory_HDSSetupService != -1 || (uint64_t result = _LogCategory_Initialize(), result))
    {
      return LogPrintF();
    }
  }
  return result;
}

- (void)_setSiriInfo
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    if (self->_siriDisabled) {
      id v3 = "yes";
    }
    else {
      id v3 = "no";
    }
    uint64_t siriDataSharingState = self->_siriDataSharingState;
    if (siriDataSharingState >= 8)
    {
      if ((int)siriDataSharingState <= 9) {
        id v5 = "?";
      }
      else {
        id v5 = "User";
      }
    }
    else
    {
      id v5 = off_265040120[siriDataSharingState];
    }
    siriVoiceLanguage = self->_siriVoiceLanguage;
    long long v25 = *(_OWORD *)&self->_siriListenLanguage;
    os_signpost_id_t v19 = v3;
    uint64_t v23 = v5;
    LogPrintF();
  }
  uint64_t v6 = [(objc_class *)getAFPreferencesClass() sharedPreferences];
  objc_msgSend(v6, "setAssistantIsEnabled:", !self->_siriDisabled, v19, v23, v25, siriVoiceLanguage);
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    if (self->_siriDisabled) {
      id v7 = "yes";
    }
    else {
      id v7 = "no";
    }
    id v20 = v7;
    LogPrintF();
  }
  if ((self->_siriDataSharingState - 5) <= 1)
  {
    id v8 = objc_alloc_init(getAFSettingsConnectionClass());
    id v9 = v8;
    if (self->_siriDataSharingState == 6) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    objc_msgSend(v8, "setSiriDataSharingHomePodSetupDeviceIsValid:completion:", self->_siriDataSharingDeviceIsValid, 0, v20);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __31__HDSSetupService__setSiriInfo__block_invoke;
    v31[3] = &unk_265040078;
    id v32 = v9;
    uint64_t v33 = v10;
    id v11 = v9;
    [v11 setSiriDataSharingOptInStatus:v10 propagateToHomeAccessories:0 source:5 reason:0 completion:v31];
  }
  if ([(NSString *)self->_siriListenLanguage length])
  {
    [v6 setLanguageCode:self->_siriListenLanguage];
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      siriListenLanguage = self->_siriListenLanguage;
      LogPrintF();
    }
  }
  if ([(NSString *)self->_siriVoiceName length]) {
    id v12 = self->_siriVoiceName;
  }
  else {
    id v12 = 0;
  }
  if (self->_siriVoiceGender && [(NSString *)self->_siriVoiceLanguage length])
  {
    int v13 = (void *)[objc_alloc(getAFVoiceInfoClass()) initWithLanguageCode:self->_siriVoiceLanguage gender:self->_siriVoiceGender isCustom:0 name:v12 footprint:2 contentVersion:0 masteredVersion:0];
    if (v13)
    {
      dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
      id v15 = objc_alloc_init(getAFSettingsConnectionClass());
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __31__HDSSetupService__setSiriInfo__block_invoke_2;
      v29[3] = &unk_26503F6A8;
      os_signpost_id_t v16 = v14;
      id v30 = v16;
      [v15 setOutputVoice:v13 withCompletion:v29];
      dispatch_time_t v17 = dispatch_time(0, 5000000000);
      intptr_t v18 = dispatch_semaphore_wait(v16, v17);
      [v6 setOutputVoice:v13];
      if (gLogCategory_HDSSetupService <= 30
        && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
      {
        id v26 = v12;
        intptr_t v27 = v18;
        int64_t siriVoiceGender = self->_siriVoiceGender;
        double v24 = self->_siriVoiceLanguage;
        LogPrintF();
      }
    }
    else if (gLogCategory_HDSSetupService <= 60 {
           && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  objc_msgSend(v6, "synchronize", siriVoiceGender, v24, v26, v27);
}

uint64_t __31__HDSSetupService__setSiriInfo__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (gLogCategory_HDSSetupService <= 30)
  {
    id v5 = v2;
    if (gLogCategory_HDSSetupService != -1 || (v2 = (id)_LogCategory_Initialize(), id v3 = v5, v2))
    {
      id v2 = (id)LogPrintF();
      id v3 = v5;
    }
  }
  return MEMORY[0x270F9A758](v2, v3);
}

intptr_t __31__HDSSetupService__setSiriInfo__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v2 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v2);
}

- (void)_boostiTunesCloudDaemon
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  getICCloudClientClass();
  id v3 = (ICCloudClient *)objc_opt_new();
  icClient = self->_icClient;
  self->_icClient = v3;

  id v5 = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HDSSetupService__boostiTunesCloudDaemon__block_invoke;
  block[3] = &unk_26503F6A8;
  void block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __42__HDSSetupService__boostiTunesCloudDaemon__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 328) notifyDeviceSetupFinishedWithCompletion:&__block_literal_global_925];
}

uint64_t __42__HDSSetupService__boostiTunesCloudDaemon__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    if (gLogCategory_HDSSetupService <= 90)
    {
      id v5 = v2;
      if (gLogCategory_HDSSetupService != -1 || (v2 = (id)_LogCategory_Initialize(), id v3 = v5, v2))
      {
LABEL_7:
        id v2 = (id)LogPrintF();
        id v3 = v5;
      }
    }
  }
  else if (gLogCategory_HDSSetupService <= 30)
  {
    id v5 = 0;
    if (gLogCategory_HDSSetupService != -1) {
      goto LABEL_7;
    }
    id v2 = (id)_LogCategory_Initialize();
    id v3 = 0;
    if (v2) {
      goto LABEL_7;
    }
  }
  return MEMORY[0x270F9A758](v2, v3);
}

- (void)_printBitMask:(int64_t)a3
{
  id v4 = [MEMORY[0x263F089D8] string];
  uint64_t v5 = 32;
  id v8 = v4;
  do
  {
    if (a3) {
      uint64_t v6 = @"1";
    }
    else {
      uint64_t v6 = @"0";
    }
    uint64_t v7 = [v4 insertString:v6 atIndex:0];
    id v4 = v8;
    a3 >>= 1;
    --v5;
  }
  while (v5);
  if (gLogCategory_HDSSetupService < 31)
  {
    if (gLogCategory_HDSSetupService != -1 || (v7 = _LogCategory_Initialize(), id v4 = v8, v7))
    {
      uint64_t v7 = LogPrintF();
      id v4 = v8;
    }
  }
  MEMORY[0x270F9A758](v7, v4);
}

- (int)hdsSUStateForSUState
{
  unint64_t v2 = self->_suUpdateState - 1;
  if (v2 > 0x11) {
    return 0;
  }
  else {
    return dword_23EBBE6C8[v2];
  }
}

- (BOOL)homePodNeedsSUNoSetup
{
  return 0;
}

- (BOOL)isHomePodSUNoSetup
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v4 = SUControllerStringForManagerState();
    LogPrintF();
  }
  return ((self->_suUpdateState - 1) & 0xFFFFFFFFFFFFFFEFLL) != 0;
}

- (void)configureSUControllerManagerToFinish
{
  id v3 = objc_alloc_init(MEMORY[0x263F77B00]);
  [v3 setPerformAutoDownloadAndPrepare:1];
  [v3 setPerformAutoInstall:1];
  [v3 setAutoAcceptTermsAndConditions:1];
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v6 = v3;
    LogPrintF();
  }
  id v4 = [(HDSSetupService *)self suControllerManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HDSSetupService_configureSUControllerManagerToFinish__block_invoke;
  v7[3] = &unk_2650400A0;
  id v8 = v3;
  id v5 = v3;
  [v4 modifyConfig:v5 modifying:14 completion:v7];
}

void __55__HDSSetupService_configureSUControllerManagerToFinish__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)sendSUNoSetupSUInstallDonePeerEvent
{
  void v9[5] = *MEMORY[0x263EF8340];
  sfSession = self->_sfSession;
  v9[0] = &unk_26F260EF8;
  v8[0] = @"spe";
  v8[1] = @"hp_su_est_time";
  id v4 = [NSNumber numberWithDouble:self->_estTimeRemainingSUNoSetup];
  uint64_t v5 = MEMORY[0x263EFFA88];
  v9[1] = v4;
  v9[2] = MEMORY[0x263EFFA88];
  v8[2] = @"unsetup_hp_su_start";
  v8[3] = @"unsetup_hp_su_phase";
  id v6 = [NSNumber numberWithInt:self->_homePodSUNoSetupState];
  v8[4] = @"unsetup_hp_su_install_done";
  v9[3] = v6;
  void v9[4] = v5;
  uint64_t v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:5];
  [(SFSession *)sfSession sendWithFlags:0 object:v7];
}

- (void)sendSUNoSetupSUStatusPeerEvent
{
  v8[4] = *MEMORY[0x263EF8340];
  sfSession = self->_sfSession;
  v8[0] = &unk_26F260EF8;
  v7[0] = @"spe";
  v7[1] = @"hp_su_est_time";
  id v4 = [NSNumber numberWithDouble:self->_estTimeRemainingSUNoSetup];
  v8[1] = v4;
  v8[2] = MEMORY[0x263EFFA88];
  v7[2] = @"unsetup_hp_su_start";
  v7[3] = @"unsetup_hp_su_phase";
  uint64_t v5 = [NSNumber numberWithInt:self->_homePodSUNoSetupState];
  v8[3] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];
  [(SFSession *)sfSession sendWithFlags:0 object:v6];
}

- (void)sendSUNoSetupErrorPeerEvent:(int64_t)a3
{
  v8[3] = *MEMORY[0x263EF8340];
  sfSession = self->_sfSession;
  v8[0] = &unk_26F260EF8;
  v7[0] = @"spe";
  v7[1] = @"unsetup_hp_sunosetup_error";
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  v7[2] = @"unsetup_hp_su_start";
  v8[1] = v5;
  v8[2] = MEMORY[0x263EFFA80];
  id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  [(SFSession *)sfSession sendWithFlags:0 object:v6];

  self->_BOOL canCompanionShowHomePodSU = 0;
}

- (void)wipeWifiConfig
{
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = (void (*)(void))*((void *)self->_progressHandler + 2);
  v3();
}

- (BOOL)canSendPeerUpdates
{
  return self->_canCompanionShowHomePodSU
      && self->_sfSession
      && ![(SFService *)self->_sfService needsSetup];
}

- (id)installProfileData:(id)a3
{
  id v3 = (void *)MEMORY[0x263F53C50];
  id v4 = a3;
  uint64_t v5 = [v3 sharedConnection];
  id v9 = 0;
  id v6 = [v5 installProfileData:v4 options:0 outError:&v9];

  id v7 = v9;
  if (v7)
  {
    if (gLogCategory_HDSSetupService <= 60
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSSetupService <= 30 {
         && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }

  return v6;
}

- (void)removeSysDropProfile
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    dispatch_semaphore_t v14 = "-[HDSSetupService removeSysDropProfile]";
    LogPrintF();
  }
  unint64_t v2 = objc_msgSend(MEMORY[0x263F53C50], "sharedConnection", v14);
  id v3 = [v2 installedProfilesWithFilterFlags:3];

  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v15 = v3;
    LogPrintF();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "identifier", v15);
        int v11 = [v10 isEqualToString:@"com.apple.defaults.managed.homedevicesetup.logging"];

        if (v11)
        {
          if (gLogCategory_HDSSetupService <= 30
            && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          id v12 = [MEMORY[0x263F53C50] sharedConnection];
          int v13 = [v9 identifier];
          [v12 removeProfileWithIdentifier:v13];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
}

- (void)manager:(id)a3 scanRequestDidLocateUpdate:(id)a4 error:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v12 = v8;
    id v13 = v9;
    LogPrintF();
  }
  if (v9)
  {
    objc_storeStrong((id *)&self->_errorForScanSUNoSetup, a5);
    int64_t v10 = 1;
  }
  else
  {
    self->_scanFoundSUForSUNoSetup = 1;
    int64_t v10 = 3;
  }
  self->_suUpdateState = v10;
  self->_homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  semaForScanFoundSU = self->_semaForScanFoundSU;
  if (semaForScanFoundSU) {
    dispatch_semaphore_signal(semaForScanFoundSU);
  }
  if (self->_scanFoundSUForSUNoSetup) {
    [(HDSSetupService *)self configureSUControllerManagerToFinish];
  }
}

- (void)manager:(id)a3 scanRequestPostponed:(id)a4 error:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v10 = v8;
    id v11 = v9;
    LogPrintF();
  }
  self->_suUpdateState = 2;
  self->_homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)manager:(id)a3 didChangeProgressOnDownload:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    int64_t suUpdateState = (int64_t)v6;
    LogPrintF();
  }
  if (v6)
  {
    self->_int64_t suUpdateState = 4;
    uint64_t homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
    self->_uint64_t homePodSUNoSetupState = homePodSUNoSetupState;
    if (gLogCategory_HDSSetupService > 30) {
      goto LABEL_14;
    }
    if (gLogCategory_HDSSetupService == -1)
    {
      if (!_LogCategory_Initialize())
      {
LABEL_14:
        id v8 = objc_alloc(MEMORY[0x263EFF910]);
        id v9 = [v6 progress];
        [v9 estimatedTimeRemaining];
        id v10 = (NSDate *)objc_msgSend(v8, "initWithTimeIntervalSinceNow:");

        if (v10 == self->_estFinishTimeSUNoSetup)
        {
          if (gLogCategory_HDSSetupService > 30
            || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_38;
          }
        }
        else
        {
          objc_storeStrong((id *)&self->_estFinishTimeSUNoSetup, v10);
          id v11 = [v6 progress];
          [v11 estimatedTimeRemaining];
          self->_estTimeRemainingSUNoSetup = v12;

          if ([(HDSSetupService *)self canSendPeerUpdates])
          {
            if (gLogCategory_HDSSetupService <= 30
              && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            [(HDSSetupService *)self sendSUNoSetupSUStatusPeerEvent];
            goto LABEL_38;
          }
          if (!self->_canCompanionShowHomePodSU
            && gLogCategory_HDSSetupService <= 30
            && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          if (self->_sfSession && ![(SFService *)self->_sfService needsSetup]
            || gLogCategory_HDSSetupService > 30
            || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_38;
          }
        }
        LogPrintF();
LABEL_38:

        goto LABEL_39;
      }
      uint64_t homePodSUNoSetupState = self->_homePodSUNoSetupState;
    }
    int64_t suUpdateState = self->_suUpdateState;
    uint64_t v14 = homePodSUNoSetupState;
    LogPrintF();
    goto LABEL_14;
  }
  if ([(HDSSetupService *)self canSendPeerUpdates])
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[HDSSetupService sendSUNoSetupErrorPeerEvent:](self, "sendSUNoSetupErrorPeerEvent:", 903, suUpdateState);
    [(HDSSetupService *)self wipeWifiConfig];
    self->_int64_t suUpdateState = 1;
    self->_uint64_t homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
  }
LABEL_39:
}

- (void)manager:(id)a3 didFailDownload:(id)a4 withError:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v10 = v8;
    id v11 = v9;
    LogPrintF();
  }
  if (v9)
  {
    self->_int64_t suUpdateState = 1;
    self->_uint64_t homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
    if ([(HDSSetupService *)self canSendPeerUpdates]) {
      -[HDSSetupService sendSUNoSetupErrorPeerEvent:](self, "sendSUNoSetupErrorPeerEvent:", [v9 code]);
    }
    [(HDSSetupService *)self wipeWifiConfig];
  }
  else
  {
    self->_int64_t suUpdateState = 4;
    self->_uint64_t homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)manager:(id)a3 didFinishDownload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v12 = v7;
    LogPrintF();
  }
  self->_int64_t suUpdateState = 8;
  uint64_t homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
  self->_uint64_t homePodSUNoSetupState = homePodSUNoSetupState;
  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService != -1)
    {
LABEL_7:
      int64_t suUpdateState = self->_suUpdateState;
      uint64_t v14 = homePodSUNoSetupState;
      LogPrintF();
      goto LABEL_9;
    }
    if (_LogCategory_Initialize())
    {
      uint64_t homePodSUNoSetupState = self->_homePodSUNoSetupState;
      goto LABEL_7;
    }
  }
LABEL_9:
  [(HDSSetupService *)self configureSUControllerManagerToFinish];
  id v9 = [v7 progress];
  int v10 = [v9 isDone];

  if (v10)
  {
    suControllerManager = self->_suControllerManager;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __45__HDSSetupService_manager_didFinishDownload___block_invoke;
    v15[3] = &unk_2650400C8;
    v15[4] = self;
    [(SUControllerManager *)suControllerManager managerState:v15];
  }
}

void __45__HDSSetupService_manager_didFinishDownload___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v6 = a4;
  if (v6 && [*(id *)(a1 + 32) canSendPeerUpdates])
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      id v7 = v6;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "sendSUNoSetupErrorPeerEvent:", objc_msgSend(v6, "code", v7));
  }
  else
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 448) installUpdate:v8];
  }
}

- (void)manager:(id)a3 didChangeProgressOnApply:(id)a4 progress:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v14 = v8;
    id v16 = v9;
    LogPrintF();
  }
  self->_int64_t suUpdateState = 9;
  uint64_t homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
  self->_uint64_t homePodSUNoSetupState = homePodSUNoSetupState;
  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService != -1)
    {
LABEL_7:
      int64_t suUpdateState = self->_suUpdateState;
      uint64_t v17 = homePodSUNoSetupState;
      LogPrintF();
      goto LABEL_9;
    }
    if (_LogCategory_Initialize())
    {
      uint64_t homePodSUNoSetupState = self->_homePodSUNoSetupState;
      goto LABEL_7;
    }
  }
LABEL_9:
  id v11 = objc_alloc(MEMORY[0x263EFF910]);
  [v9 estimatedTimeRemaining];
  id v12 = (NSDate *)objc_msgSend(v11, "initWithTimeIntervalSinceNow:");
  if (v12 == self->_estFinishTimeSUNoSetup)
  {
    if (gLogCategory_HDSSetupService > 30
      || gLogCategory_HDSSetupService == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  objc_storeStrong((id *)&self->_estFinishTimeSUNoSetup, v12);
  [v9 estimatedTimeRemaining];
  self->_estTimeRemainingSUNoSetup = v13;
  if ([(HDSSetupService *)self canSendPeerUpdates])
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(HDSSetupService *)self sendSUNoSetupSUStatusPeerEvent];
    goto LABEL_31;
  }
  if (!self->_canCompanionShowHomePodSU
    && gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if ((!self->_sfSession || [(SFService *)self->_sfService needsSetup])
    && gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
LABEL_30:
    LogPrintF();
  }
LABEL_31:
}

- (void)manager:(id)a3 didFailInstallation:(id)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v12 = v9;
    id v13 = v10;
    LogPrintF();
  }
  if (v10)
  {
    self->_int64_t suUpdateState = 1;
    self->_uint64_t homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
    if ([(HDSSetupService *)self canSendPeerUpdates]) {
      -[HDSSetupService sendSUNoSetupErrorPeerEvent:](self, "sendSUNoSetupErrorPeerEvent:", [v10 code]);
    }
    suControllerManager = self->_suControllerManager;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __57__HDSSetupService_manager_didFailInstallation_withError___block_invoke;
    v14[3] = &unk_26503F7B8;
    v14[4] = self;
    -[SUControllerManager purgeUpdate:completion:](suControllerManager, "purgeUpdate:completion:", v9, v14, v12, v13);
  }
  else
  {
    self->_int64_t suUpdateState = 9;
    self->_uint64_t homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __57__HDSSetupService_manager_didFailInstallation_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
    id v6 = 0;
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v3 = (id)[*(id *)(a1 + 32) wipeWifiConfig];
    goto LABEL_12;
  }
  if (gLogCategory_HDSSetupService <= 90)
  {
    id v6 = v3;
    if (gLogCategory_HDSSetupService != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v6, v3))
    {
      id v3 = (id)LogPrintF();
LABEL_12:
      id v4 = v6;
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (void)manager:(id)a3 didFinishInstallation:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v8 = v6;
    LogPrintF();
  }
  self->_int64_t suUpdateState = 10;
  uint64_t homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
  self->_uint64_t homePodSUNoSetupState = homePodSUNoSetupState;
  if (gLogCategory_HDSSetupService <= 30)
  {
    if (gLogCategory_HDSSetupService != -1)
    {
LABEL_7:
      int64_t suUpdateState = self->_suUpdateState;
      uint64_t v10 = homePodSUNoSetupState;
      LogPrintF();
      goto LABEL_9;
    }
    if (_LogCategory_Initialize())
    {
      uint64_t homePodSUNoSetupState = self->_homePodSUNoSetupState;
      goto LABEL_7;
    }
  }
LABEL_9:
  [(HDSSetupService *)self configureSUControllerManagerToFinish];
  [(HDSSetupService *)self sendSUNoSetupSUInstallDonePeerEvent];
}

- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    id v12 = "no";
    if (v7) {
      id v13 = "yes";
    }
    else {
      id v13 = "no";
    }
    if (v6) {
      id v12 = "yes";
    }
    long long v19 = v13;
    uint64_t v21 = v12;
    id v17 = v11;
    LogPrintF();
  }
  id v14 = objc_msgSend(v11, "progress", v17, v19, v21);
  int v15 = [v14 isDone];

  if (v15)
  {
    suControllerManager = self->_suControllerManager;
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __100__HDSSetupService_manager_didFinishDownload_willProceedWithInstallation_waitingForAdmissionControl___block_invoke;
    v22[3] = &unk_2650400C8;
    void v22[4] = self;
    [(SUControllerManager *)suControllerManager managerState:v22];
  }
  else
  {
    self->_int64_t suUpdateState = 4;
    self->_uint64_t homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    int64_t suUpdateState = self->_suUpdateState;
    uint64_t homePodSUNoSetupState = self->_homePodSUNoSetupState;
    LogPrintF();
  }
  [(HDSSetupService *)self configureSUControllerManagerToFinish];
}

void __100__HDSSetupService_manager_didFinishDownload_willProceedWithInstallation_waitingForAdmissionControl___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v6 = a4;
  if (v6 && [*(id *)(a1 + 32) canSendPeerUpdates])
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      id v7 = v6;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "sendSUNoSetupErrorPeerEvent:", objc_msgSend(v6, "code", v7));
  }
  else
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 448) installUpdate:v8];
  }
}

- (void)manager:(id)a3 didFinishDownload:(id)a4 willProceedWithInstallation:(BOOL)a5 waitingForAdmissionControl:(BOOL)a6 denialReasons:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    int v15 = "no";
    if (v9) {
      id v16 = "yes";
    }
    else {
      id v16 = "no";
    }
    if (v8) {
      int v15 = "yes";
    }
    double v24 = v15;
    id v25 = v14;
    id v20 = v13;
    uint64_t v22 = v16;
    LogPrintF();
  }
  id v17 = objc_msgSend(v13, "progress", v20, v22, v24, v25);
  int v18 = [v17 isDone];

  if (v18)
  {
    suControllerManager = self->_suControllerManager;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __114__HDSSetupService_manager_didFinishDownload_willProceedWithInstallation_waitingForAdmissionControl_denialReasons___block_invoke;
    v26[3] = &unk_2650400C8;
    v26[4] = self;
    [(SUControllerManager *)suControllerManager managerState:v26];
  }
  else
  {
    self->_int64_t suUpdateState = 4;
    self->_uint64_t homePodSUNoSetupState = [(HDSSetupService *)self hdsSUStateForSUState];
  }
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    int64_t suUpdateState = self->_suUpdateState;
    uint64_t homePodSUNoSetupState = self->_homePodSUNoSetupState;
    LogPrintF();
  }
  [(HDSSetupService *)self configureSUControllerManagerToFinish];
}

void __114__HDSSetupService_manager_didFinishDownload_willProceedWithInstallation_waitingForAdmissionControl_denialReasons___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v6 = a4;
  if (v6 && [*(id *)(a1 + 32) canSendPeerUpdates])
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      id v7 = v6;
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "sendSUNoSetupErrorPeerEvent:", objc_msgSend(v6, "code", v7));
  }
  else
  {
    if (gLogCategory_HDSSetupService <= 30
      && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 448) installUpdate:v8];
  }
}

- (void)manager:(id)a3 connectionError:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (gLogCategory_HDSSetupService <= 30
    && (gLogCategory_HDSSetupService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)connectionRegained:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (gLogCategory_HDSSetupService <= 30)
  {
    id v5 = v3;
    if (gLogCategory_HDSSetupService != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = v5, v3))
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

- (SysDropService)sysDropService
{
  return self->_sysDropService;
}

- (void)setSysDropService:(id)a3
{
}

- (SUControllerManager)suControllerManager
{
  return self->_suControllerManager;
}

- (void)setSuControllerManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suControllerManager, 0);
  objc_storeStrong((id *)&self->_sysDropService, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wifiDispatchQueue, 0);
  objc_storeStrong((id *)&self->_errorForScanSUNoSetup, 0);
  objc_storeStrong((id *)&self->_semaForScanFoundSU, 0);
  objc_storeStrong((id *)&self->_estFinishTimeSUNoSetup, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_icClient, 0);
  objc_storeStrong((id *)&self->_voicePreviewer, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_timeObj, 0);
  objc_storeStrong((id *)&self->_siriVoiceName, 0);
  objc_storeStrong((id *)&self->_siriVoiceLanguage, 0);
  objc_storeStrong((id *)&self->_siriListenLanguage, 0);
  objc_storeStrong((id *)&self->_temperatureUnit, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_captiveNetworkHandler, 0);
  objc_storeStrong((id *)&self->_wifiSetupHandler, 0);
  objc_storeStrong((id *)&self->_homeKitSetupHandler, 0);
  objc_storeStrong((id *)&self->_cdpSetupHandler, 0);
  objc_storeStrong((id *)&self->_siriGreetingDetails, 0);
  objc_storeStrong((id *)&self->_siriClient, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong((id *)&self->_sfClient, 0);
  objc_storeStrong((id *)&self->_finishTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_finishApplyTimer, 0);
  objc_storeStrong((id *)&self->_companionLinkClient, 0);
  objc_storeStrong((id *)&self->_apcPlayer, 0);
  objc_storeStrong((id *)&self->_apcCapData, 0);
}

@end