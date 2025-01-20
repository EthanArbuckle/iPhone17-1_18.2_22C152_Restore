@interface HDSDeviceOperationHomeKitSetup
- (ACAccount)iTunesAccount;
- (BOOL)_isOwnerOfHome:(id)a3;
- (BOOL)_runHomeKitConfigureStereoPairAndReturnError:(id *)a3;
- (BOOL)hasHomePod;
- (BOOL)hasMultipleUsers;
- (BOOL)homeKitAddedAccessory;
- (BOOL)homeKitHomeManagerReady;
- (BOOL)isCLIMode;
- (BOOL)keyExchangeOnly;
- (BOOL)pauseAfterUserInput;
- (BOOL)personalRequestsEnabled;
- (BOOL)userInteractive;
- (CUPairedPeer)pairedPeer;
- (HDSDeviceOperationHomeKitSetup)init;
- (HMAccessory)stereoCounterpart;
- (HMAccessory)tvAudioInput;
- (HMHome)homeKitSelectedHome;
- (HMHomeManager)homeKitHomeManager;
- (HMMediaGroup)existingMediaGroup;
- (NSArray)psgHomePods;
- (NSArray)psgStereoPairs;
- (NSDictionary)appDataSelf;
- (NSString)homeKitSelectedRoomName;
- (NSString)iTunesAccountID;
- (NSUUID)sessionID;
- (OS_dispatch_queue)dispatchQueue;
- (TRSession)trSession;
- (double)accessorySyncSeconds;
- (double)addDeviceNonUserSeconds;
- (double)assignRoomNonUserSeconds;
- (double)homekitDataSyncSeconds;
- (double)metricNonUserSeconds;
- (double)metricUserSeconds;
- (double)odeonSeconds;
- (double)personalRequestsNonUserSeconds;
- (double)setupDeviceNonUserSeconds;
- (double)stereoPairSeconds;
- (double)timeoutInSeconds;
- (double)ulhNonUserSeconds;
- (id)_homeKitFindSettingsWithKeyPath:(id)a3 group:(id)a4;
- (id)_mediaSystemForAccessory:(id)a3;
- (id)_normalizedString:(id)a3;
- (id)_runHomeKitAutoSelectHome:(BOOL)a3;
- (id)completionHandler;
- (id)findStereoCounterpartsWithSupportedVersions:(unint64_t)a3;
- (id)findTVs;
- (id)homeKitAccessory;
- (id)homePodsInHomeRoom:(id)a3 roomName:(id)a4;
- (id)pauseHandler;
- (id)promptForHomeHandler;
- (id)promptForRoomHandler;
- (id)promptForRoomHandlerDetailed;
- (id)promptToInstallHomeAppHandler;
- (int)stereoRole;
- (void)_cleanup;
- (void)_completeWithError:(id)a3 errorLabel:(id)a4;
- (void)_removeAccessoryIfNeeded;
- (void)_removeSimilarRoomNames:(id)a3 home:(id)a4;
- (void)_restoreHomeApp;
- (void)_run;
- (void)_runHomeKitAddAccessory;
- (void)_runHomeKitAddAppData;
- (void)_runHomeKitAddHome;
- (void)_runHomeKitAssignRoom;
- (void)_runHomeKitDeviceSetup;
- (void)_runHomeKitSelectRoom;
- (void)_runHomeKitSetupRoom:(BOOL)a3;
- (void)_runHomeKitUpdateAppleTVAudioDestination;
- (void)_runInit;
- (void)_runPersonalRequestsStart;
- (void)_runUpdateUserListeningHistoryStart;
- (void)_startTimeout:(double)a3;
- (void)_syncAccessoriesInSelectedRoom;
- (void)_timeoutForAccessorySync;
- (void)_updateAccount;
- (void)_updateHomeStats;
- (void)accessory:(id)a3 didUpdateLoggedInAccount:(id)a4;
- (void)activate;
- (void)addHomePodsToAccessorySync:(id)a3;
- (void)homeAppInstallChoice:(BOOL)a3;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidUpdateDataSyncState:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)invalidate;
- (void)performReadinessCheck:(id)a3;
- (void)reselectHome;
- (void)resume;
- (void)selectHome:(id)a3;
- (void)selectRoom:(id)a3;
- (void)setAppDataSelf:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setExistingMediaGroup:(id)a3;
- (void)setITunesAccount:(id)a3;
- (void)setITunesAccountID:(id)a3;
- (void)setIsCLIMode:(BOOL)a3;
- (void)setKeyExchangeOnly:(BOOL)a3;
- (void)setOdeonSeconds:(double)a3;
- (void)setPairedPeer:(id)a3;
- (void)setPauseAfterUserInput:(BOOL)a3;
- (void)setPauseHandler:(id)a3;
- (void)setPersonalRequestsEnabled:(BOOL)a3;
- (void)setPromptForHomeHandler:(id)a3;
- (void)setPromptForRoomHandler:(id)a3;
- (void)setPromptForRoomHandlerDetailed:(id)a3;
- (void)setPromptToInstallHomeAppHandler:(id)a3;
- (void)setPsgHomePods:(id)a3;
- (void)setPsgStereoPairs:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setStereoCounterpart:(id)a3;
- (void)setStereoRole:(int)a3;
- (void)setTimeoutInSeconds:(double)a3;
- (void)setTrSession:(id)a3;
- (void)setTvAudioInput:(id)a3;
- (void)setUserInteractive:(BOOL)a3;
@end

@implementation HDSDeviceOperationHomeKitSetup

- (HDSDeviceOperationHomeKitSetup)init
{
  v6.receiver = self;
  v6.super_class = (Class)HDSDeviceOperationHomeKitSetup;
  v2 = [(HDSDeviceOperationHomeKitSetup *)&v6 init];
  if (v2)
  {
    uint64_t v3 = CUMainQueue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_timeoutInSeconds = 300.0;
  }
  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__HDSDeviceOperationHomeKitSetup_activate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __42__HDSDeviceOperationHomeKitSetup_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  v2 = *(void **)(a1 + 32);
  return [v2 _run];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__HDSDeviceOperationHomeKitSetup_invalidate__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __44__HDSDeviceOperationHomeKitSetup_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 240);
  if (v2)
  {
    if (!*(unsigned char *)(v1 + 201) || !*(void *)(v1 + 168)) {
      goto LABEL_9;
    }
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 240) _endActiveAssertion:*(void *)(*(void *)(a1 + 32) + 168)];
    uint64_t v1 = *(void *)(a1 + 32);
    v2 = *(void **)(v1 + 240);
    if (v2)
    {
LABEL_9:
      *(void *)(v1 + 240) = 0;

      uint64_t v1 = *(void *)(a1 + 32);
    }
  }
  NSErrorWithOSStatusF();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(id)v1 _completeWithError:v4 errorLabel:0];
}

- (void)_cleanup
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  id pauseHandler = self->_pauseHandler;
  self->_id pauseHandler = 0;

  id promptForHomeHandler = self->_promptForHomeHandler;
  self->_id promptForHomeHandler = 0;

  id promptForRoomHandler = self->_promptForRoomHandler;
  self->_id promptForRoomHandler = 0;

  id promptToInstallHomeAppHandler = self->_promptToInstallHomeAppHandler;
  self->_id promptToInstallHomeAppHandler = 0;

  trSession = self->_trSession;
  self->_trSession = 0;

  self->_active = 0;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v10 = timeoutTimer;
    dispatch_source_cancel(v10);
    v11 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  [(TROperationQueue *)self->_trOperationQueue invalidate];
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  [(HMAccessoryBrowser *)self->_homeKitBrowser stopSearchingForNewAccessories];
  homeKitBrowser = self->_homeKitBrowser;
  self->_homeKitBrowser = 0;

  [(HMDeviceSetupOperation *)self->_homeKitDeviceSetupOperation cancel];
  [(HMDeviceSetupOperation *)self->_homeKitDeviceSetupOperation setCompletionBlock:0];
  homeKitAccessory = self->_homeKitAccessory;
  self->_homeKitAccessory = 0;

  homeKitSelectedHome = self->_homeKitSelectedHome;
  self->_homeKitSelectedHome = 0;

  homeKitSelectedRoom = self->_homeKitSelectedRoom;
  self->_homeKitSelectedRoom = 0;
}

- (void)_removeAccessoryIfNeeded
{
  if (self->_homeKitAddedAccessory)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitSelectedHome = self->_homeKitSelectedHome;
    homeKitAccessory = self->_homeKitAccessory;
    [(HMHome *)homeKitSelectedHome removeAccessory:homeKitAccessory completionHandler:&__block_literal_global_0];
  }
}

uint64_t __58__HDSDeviceOperationHomeKitSetup__removeAccessoryIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 90)
    {
      id v5 = v2;
      if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1
        || (v2 = (id)_LogCategory_Initialize(), id v3 = v5, v2))
      {
LABEL_7:
        id v2 = (id)LogPrintF();
        id v3 = v5;
      }
    }
  }
  else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
  {
    id v5 = 0;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1) {
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

- (void)_completeWithError:(id)a3 errorLabel:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (!self->_active) {
    goto LABEL_19;
  }
  if (!v14)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    double v8 = v7;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup >= 31)
    {
      self->_double metricNonUserSeconds = v7 + self->_metricNonUserSeconds;
      self->_state = 4;
      goto LABEL_19;
    }
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize())
    {
      double v12 = v8;
      LogPrintF();
    }
    int v9 = gLogCategory_HDSDeviceOperationHomeKitSetup;
    double metricNonUserSeconds = v8 + self->_metricNonUserSeconds;
    self->_double metricNonUserSeconds = metricNonUserSeconds;
    self->_state = 4;
    if (v9 > 30) {
      goto LABEL_19;
    }
    if (v9 == -1)
    {
      if (!_LogCategory_Initialize()) {
        goto LABEL_19;
      }
      double metricNonUserSeconds = self->_metricNonUserSeconds;
    }
    double v12 = metricNonUserSeconds;
    double metricUserSeconds = self->_metricUserSeconds;
LABEL_18:
    LogPrintF();
    goto LABEL_19;
  }
  self->_state = 3;
  [(HDSDeviceOperationHomeKitSetup *)self _removeAccessoryIfNeeded];
  if ([v14 code] != -6723)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup > 60
      || gLogCategory_HDSDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_19;
    }
    double v12 = *(double *)&v14;
    goto LABEL_18;
  }
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_18;
  }
LABEL_19:
  id completionHandler = (void (**)(id, id, id))self->_completionHandler;
  if (completionHandler) {
    completionHandler[2](completionHandler, v14, v6);
  }
  [(HDSDeviceOperationHomeKitSetup *)self _cleanup];
}

- (void)homeAppInstallChoice:(BOOL)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__HDSDeviceOperationHomeKitSetup_homeAppInstallChoice___block_invoke;
  v4[3] = &unk_26503F8C8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __55__HDSDeviceOperationHomeKitSetup_homeAppInstallChoice___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 88) = 1;
    if (*(unsigned char *)(v1 + 40)) {
      [*(id *)(v1 + 32) _restoreHomeApp];
    }
    id v2 = *(void **)(v1 + 32);
    return [v2 _run];
  }
  return result;
}

- (id)homeKitAccessory
{
  return self->_homeKitAccessory;
}

- (void)resume
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__HDSDeviceOperationHomeKitSetup_resume__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __40__HDSDeviceOperationHomeKitSetup_resume__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    uint64_t v2 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup >= 31)
    {
      *(unsigned char *)(v1 + 9) = 0;
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()) {
        LogPrintF();
      }
      int v3 = gLogCategory_HDSDeviceOperationHomeKitSetup;
      *(unsigned char *)(*(void *)(v2 + 32) + 9) = 0;
      if (v3 <= 30 && (v3 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    *(void *)(*(void *)(v2 + 32) + 16) = mach_absolute_time();
    [*(id *)(v2 + 32) _startTimeout:*(double *)(*(void *)(v2 + 32) + 448)];
    id v4 = *(void **)(v2 + 32);
    return [v4 _run];
  }
  return result;
}

- (void)selectHome:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__HDSDeviceOperationHomeKitSetup_selectHome___block_invoke;
  v7[3] = &unk_26503F8F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __45__HDSDeviceOperationHomeKitSetup_selectHome___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    *(double *)(*(void *)(a1 + 32) + 288) = v2 + *(double *)(*(void *)(a1 + 32) + 288);
    if ([*(id *)(a1 + 32) _isOwnerOfHome:*(void *)(a1 + 40)])
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), *(id *)(a1 + 40));
      *(void *)(*(void *)(a1 + 32) + 16) = mach_absolute_time();
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [*(id *)(a1 + 32) _startTimeout:*(double *)(*(void *)(a1 + 32) + 448)];
      id v14 = *(void **)(a1 + 32);
      [v14 _run];
    }
    else
    {
      NSErrorWithOSStatusF();
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      int v3 = [v15 userInfo];
      id v4 = (void *)[v3 mutableCopy];
      BOOL v5 = v4;
      if (v4) {
        id v6 = v4;
      }
      else {
        id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      }
      double v7 = v6;

      id v8 = [*(id *)(a1 + 40) name];
      [v7 setObject:v8 forKeyedSubscript:@"SFErrorKeyHomeName"];

      int v9 = [*(id *)(a1 + 40) owner];
      v10 = [v9 name];
      [v7 setObject:v10 forKeyedSubscript:@"SFErrorKeyHomeOwnerAccount"];

      id v11 = objc_alloc(MEMORY[0x263F087E8]);
      double v12 = [v15 domain];
      v13 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, objc_msgSend(v15, "code"), v7);

      [*(id *)(a1 + 32) _completeWithError:v13 errorLabel:@"HDS-HK-NotHomeOwner"];
    }
  }
}

- (void)reselectHome
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__HDSDeviceOperationHomeKitSetup_reselectHome__block_invoke;
  block[3] = &unk_26503F6A8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __46__HDSDeviceOperationHomeKitSetup_reselectHome__block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 112) = 1;
    double v2 = *(void **)(v1 + 32);
    return [v2 _run];
  }
  return result;
}

- (void)selectRoom:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__HDSDeviceOperationHomeKitSetup_selectRoom___block_invoke;
  v7[3] = &unk_26503F8F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __45__HDSDeviceOperationHomeKitSetup_selectRoom___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    *(double *)(*(void *)(v1 + 32) + 288) = v2 + *(double *)(*(void *)(v1 + 32) + 288);
    *(void *)(*(void *)(v1 + 32) + 16) = mach_absolute_time();
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)(*(void *)(v1 + 32) + 256), *(id *)(v1 + 40));
    [*(id *)(v1 + 32) _startTimeout:*(double *)(*(void *)(v1 + 32) + 448)];
    int v3 = *(void **)(v1 + 32);
    return [v3 _run];
  }
  return result;
}

- (void)_startTimeout:(double)a3
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    id v6 = timeoutTimer;
    dispatch_source_cancel(v6);
    double v7 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
  id v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  int v9 = self->_timeoutTimer;
  self->_timeoutTimer = v8;

  v10 = self->_timeoutTimer;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__HDSDeviceOperationHomeKitSetup__startTimeout___block_invoke;
  v11[3] = &unk_26503F918;
  v11[4] = self;
  *(double *)&v11[5] = a3;
  dispatch_source_set_event_handler(v10, v11);
  HDSDispatchTimerSet(self->_timeoutTimer, a3, -1.0, -4.0);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
}

void __48__HDSDeviceOperationHomeKitSetup__startTimeout___block_invoke(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(*(void *)(a1 + 32) + 48) - 10;
  if (v2 > 0x26) {
    int v3 = "HomeKitSetupUnknownState?";
  }
  else {
    int v3 = off_26503FAC0[v2];
  }
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 60
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v4 = *(void **)(*(void *)(a1 + 32) + 56);
  if (v4)
  {
    BOOL v5 = v4;
    dispatch_source_cancel(v5);
    uint64_t v6 = *(void *)(a1 + 32);
    double v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = 0;
  }
  id v8 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_completeWithError:errorLabel:", v9, @"HDS-HK-TimeOut", v3);
}

- (void)_run
{
  v40[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F08410];
  uint64_t v4 = *MEMORY[0x263F08320];
  int state = self->_state;
  while (2)
  {
    switch(state)
    {
      case 0:
        self->_int state = 10;
        [(HDSDeviceOperationHomeKitSetup *)self _runInit];
        goto LABEL_140;
      case 10:
        if (self->_homeKitHomeManagerReady)
        {
          int v6 = 11;
          goto LABEL_139;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 11:
        int v6 = 12;
        goto LABEL_139;
      case 12:
        if ([(HMHomeManager *)self->_homeKitHomeManager dataSyncState] == 5)
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v21 = (void *)MEMORY[0x263F087E8];
          uint64_t v39 = v4;
          uint64_t v22 = [NSString stringWithUTF8String:DebugGetErrorString()];
          v23 = (void *)v22;
          v24 = @"?";
          if (v22) {
            v24 = (__CFString *)v22;
          }
          v40[0] = v24;
          v25 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, &v39, 1, v35);
          v26 = [v21 errorWithDomain:v3 code:301024 userInfo:v25];
          v27 = @"HDS-HK-RequiresConfigurationReset";
LABEL_171:
          [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v26 errorLabel:v27];

          goto LABEL_140;
        }
        if ([(HMHomeManager *)self->_homeKitHomeManager dataSyncState] == 2)
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v31 = (void *)MEMORY[0x263F087E8];
          uint64_t v37 = v4;
          uint64_t v32 = [NSString stringWithUTF8String:DebugGetErrorString()];
          v23 = (void *)v32;
          v33 = @"?";
          if (v32) {
            v33 = (__CFString *)v32;
          }
          v38 = v33;
          v25 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1, v35);
          v26 = [v31 errorWithDomain:v3 code:301011 userInfo:v25];
          v27 = @"HDS-HK-KeychainNotEnabled";
          goto LABEL_171;
        }
        if ([(HMHomeManager *)self->_homeKitHomeManager isDataSyncInProgress])
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            uint64_t v35 = [(HMHomeManager *)self->_homeKitHomeManager dataSyncState];
            goto LABEL_175;
          }
        }
        else if ([(HMHomeManager *)self->_homeKitHomeManager status])
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            uint64_t v35 = [(HMHomeManager *)self->_homeKitHomeManager status];
            goto LABEL_175;
          }
        }
        else
        {
          self->_int state = 13;
          mach_absolute_time();
          UpTicksToSecondsF();
          self->_double homekitDataSyncSeconds = homekitDataSyncSeconds;
          if (gLogCategory_HDSDeviceOperationHomeKitSetup > 30) {
            goto LABEL_140;
          }
          if (gLogCategory_HDSDeviceOperationHomeKitSetup == -1)
          {
            if (!_LogCategory_Initialize()) {
              goto LABEL_140;
            }
            double homekitDataSyncSeconds = self->_homekitDataSyncSeconds;
          }
          uint64_t v35 = *(void *)&homekitDataSyncSeconds;
LABEL_175:
          LogPrintF();
        }
LABEL_140:
        BOOL v20 = self->_state == state;
        int state = self->_state;
        if (!v20) {
          continue;
        }
        return;
      case 13:
        if (self->_keyExchangeOnly) {
          goto LABEL_45;
        }
        int v6 = 14;
        goto LABEL_139;
      case 14:
        if (!self->_promptToInstallHomeAppHandler) {
          goto LABEL_17;
        }
        double v7 = [MEMORY[0x263F01868] applicationProxyForIdentifier:@"com.apple.Home"];
        id v8 = [v7 appState];
        char v9 = [v8 isInstalled];

        if (v9) {
          goto LABEL_17;
        }
        self->_int state = 15;
        id promptToInstallHomeAppHandler = (void (**)(id))self->_promptToInstallHomeAppHandler;
        goto LABEL_153;
      case 15:
        if (self->_homeAppInstallUserDidChoose)
        {
LABEL_17:
          int v6 = 16;
          goto LABEL_139;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 16:
        id v11 = [(HDSDeviceOperationHomeKitSetup *)self _runHomeKitAutoSelectHome:0];
        homeKitSelectedHome = self->_homeKitSelectedHome;
        self->_homeKitSelectedHome = v11;

        if (!self->_homeKitSelectedHome) {
          goto LABEL_140;
        }
        goto LABEL_25;
      case 17:
        if (self->_homeKitSelectedHome) {
          goto LABEL_25;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 18:
        if (self->_homeKitSelectedHome)
        {
LABEL_25:
          int v6 = 19;
          goto LABEL_139;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 19:
        [(HDSDeviceOperationHomeKitSetup *)self _updateHomeStats];
        self->_int state = 20;
        [(HDSDeviceOperationHomeKitSetup *)self _runHomeKitSelectRoom];
        goto LABEL_140;
      case 20:
        if (self->_reselectHome)
        {
          self->_reselectHome = 0;
          v13 = self->_homeKitSelectedHome;
          self->_homeKitSelectedHome = 0;

          self->_int state = 17;
          id v14 = [(HDSDeviceOperationHomeKitSetup *)self _runHomeKitAutoSelectHome:1];
          goto LABEL_140;
        }
        if (self->_homeKitSelectedRoom || self->_homeKitSelectedRoomName)
        {
          int v18 = 21;
          if (self->_isCLIMode)
          {
            if (+[HDSDefaults waitForAccessorySync]) {
              int v18 = 22;
            }
            else {
              int v18 = 21;
            }
          }
          self->_int state = v18;
          goto LABEL_140;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup > 30
          || gLogCategory_HDSDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_140;
        }
        goto LABEL_175;
      case 21:
        if (!self->_pauseAfterUserInput || !self->_pauseHandler) {
          goto LABEL_45;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        timeoutTimer = self->_timeoutTimer;
        if (timeoutTimer)
        {
          v29 = timeoutTimer;
          dispatch_source_cancel(v29);
          v30 = self->_timeoutTimer;
          self->_timeoutTimer = 0;
        }
        self->_paused = 1;
        self->_int state = 24;
        id promptToInstallHomeAppHandler = (void (**)(id))self->_pauseHandler;
LABEL_153:
        promptToInstallHomeAppHandler[2](promptToInstallHomeAppHandler);
        goto LABEL_140;
      case 22:
        if (!self->_isCLIMode
          || !+[HDSDefaults waitForAccessorySync])
        {
          goto LABEL_138;
        }
        self->_accessorySyncStartTicks = mach_absolute_time();
        self->_int state = 23;
        [(HDSDeviceOperationHomeKitSetup *)self _syncAccessoriesInSelectedRoom];
        goto LABEL_140;
      case 23:
        if (!self->_accessorySyncDone) {
          goto LABEL_140;
        }
        mach_absolute_time();
        UpTicksToSecondsF();
        self->_double accessorySyncSeconds = accessorySyncSeconds;
        if (gLogCategory_HDSDeviceOperationHomeKitSetup > 30) {
          goto LABEL_138;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1) {
          goto LABEL_40;
        }
        if (_LogCategory_Initialize())
        {
          double accessorySyncSeconds = self->_accessorySyncSeconds;
LABEL_40:
          uint64_t v35 = *(void *)&accessorySyncSeconds;
          LogPrintF();
        }
LABEL_138:
        int v6 = 21;
        goto LABEL_139;
      case 24:
        if (!self->_paused)
        {
LABEL_45:
          int v6 = 25;
          goto LABEL_139;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 25:
        self->_int state = 26;
        [(HDSDeviceOperationHomeKitSetup *)self _runHomeKitDeviceSetup];
        goto LABEL_140;
      case 26:
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 27:
        if (self->_keyExchangeOnly) {
          goto LABEL_130;
        }
        [(HDSDeviceOperationHomeKitSetup *)self _runHomeKitAddAccessory];
        goto LABEL_140;
      case 28:
        if (self->_homeKitAddedAccessory)
        {
          int v6 = 29;
LABEL_139:
          self->_int state = v6;
          goto LABEL_140;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup > 30
          || gLogCategory_HDSDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_140;
        }
        goto LABEL_175;
      case 29:
        [(HDSDeviceOperationHomeKitSetup *)self _runHomeKitSetupRoom:0];
        goto LABEL_140;
      case 30:
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 31:
        [(HDSDeviceOperationHomeKitSetup *)self _runHomeKitAssignRoom];
        goto LABEL_140;
      case 32:
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_175;
        }
        goto LABEL_140;
      case 33:
        if (self->_stereoRole)
        {
          int v6 = 36;
        }
        else if (self->_tvAudioInput)
        {
LABEL_113:
          int v6 = 39;
        }
        else if (self->_appDataSelf)
        {
          int v6 = 34;
        }
        else
        {
LABEL_66:
          int v6 = 42;
        }
        goto LABEL_139;
      case 34:
        self->_int state = 35;
        [(HDSDeviceOperationHomeKitSetup *)self _runHomeKitAddAppData];
        goto LABEL_140;
      case 35:
        if (self->_homeKitAddedAppData) {
          goto LABEL_66;
        }
        goto LABEL_140;
      case 36:
        id v36 = 0;
        BOOL v16 = [(HDSDeviceOperationHomeKitSetup *)self _runHomeKitConfigureStereoPairAndReturnError:&v36];
        id v17 = v36;
        if (v17)
        {
          [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v17 errorLabel:@"HDS-HK-StereoPair-Preflights"];
        }
        else
        {
          if (v16) {
            int v19 = 37;
          }
          else {
            int v19 = 38;
          }
          self->_int state = v19;
        }

        goto LABEL_140;
      case 37:
        if (!self->_configuredStereoPair) {
          goto LABEL_140;
        }
        int v6 = 38;
        goto LABEL_139;
      case 38:
        goto LABEL_113;
      case 39:
        if (!self->_tvAudioInput) {
          goto LABEL_74;
        }
        [(HDSDeviceOperationHomeKitSetup *)self _runHomeKitUpdateAppleTVAudioDestination];
        int v6 = 40;
        goto LABEL_139;
      case 40:
        if (!self->_configuredTVAudio) {
          goto LABEL_140;
        }
LABEL_74:
        int v6 = 41;
        goto LABEL_139;
      case 41:
        goto LABEL_66;
      case 42:
        self->_int state = 43;
        [(HDSDeviceOperationHomeKitSetup *)self _runPersonalRequestsStart];
        goto LABEL_140;
      case 43:
        if (!self->_personalRequestsDone) {
          goto LABEL_140;
        }
        int v6 = 44;
        goto LABEL_139;
      case 44:
        self->_int state = 45;
        [(HDSDeviceOperationHomeKitSetup *)self _runUpdateUserListeningHistoryStart];
        goto LABEL_140;
      case 45:
        if (!self->_userListeningHistoryDone) {
          goto LABEL_140;
        }
        if (self->_psgHomePods && self->_psgStereoPairs) {
          int v6 = 46;
        }
        else {
LABEL_130:
        }
          int v6 = 48;
        goto LABEL_139;
      case 46:
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_130;
      case 47:
        if (!self->_createUpdatePSGDone) {
          goto LABEL_140;
        }
        goto LABEL_130;
      case 48:
        [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:0 errorLabel:0];
        goto LABEL_140;
      default:
        goto LABEL_140;
    }
  }
}

- (void)_runInit
{
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_startTicks = mach_absolute_time();
  self->_homeKitDataSyncStartTicks = mach_absolute_time();
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(HDSDeviceOperationHomeKitSetup *)self _startTimeout:self->_timeoutInSeconds];
  uint64_t v3 = (TROperationQueue *)objc_alloc_init(getTROperationQueueClass());
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = v3;

  if (self->_isCLIMode)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    BOOL v5 = [(objc_class *)getHMMutableHomeManagerConfigurationClass() defaultConfiguration];
    int v6 = (void *)[v5 mutableCopy];
    [v6 setAdaptive:1];
    double v7 = (HMHomeManager *)[objc_alloc(getHMHomeManagerClass()) initWithHomeMangerConfiguration:v6];
    homeKitHomeManager = self->_homeKitHomeManager;
    self->_homeKitHomeManager = v7;

    char v9 = [(HMHomeManager *)self->_homeKitHomeManager _beginActiveAssertionWithReason:@"hdsutil Started"];
    hdsutilHKToken = self->_hdsutilHKToken;
    self->_hdsutilHKToken = v9;
  }
  else
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v11 = (HMHomeManager *)objc_alloc_init(getHMHomeManagerClass());
    BOOL v5 = self->_homeKitHomeManager;
    self->_homeKitHomeManager = v11;
  }

  double v12 = self->_homeKitHomeManager;
  [(HMHomeManager *)v12 setDelegate:self];
}

- (void)_runHomeKitDeviceSetup
{
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_keyExchangeOnly)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = (HMAccessoryBrowser *)objc_alloc_init(getHMAccessoryBrowserClass());
    homeKitBrowser = self->_homeKitBrowser;
    self->_homeKitBrowser = v3;

    [(HMAccessoryBrowser *)self->_homeKitBrowser setDelegate:self];
    [(HMAccessoryBrowser *)self->_homeKitBrowser startSearchingForNewAccessories];
  }
  BOOL v5 = self->_trSession;
  if (!v5)
  {
    v10 = NSErrorWithOSStatusF();
    [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v10 errorLabel:@"HDS-HK-NoTR"];

    goto LABEL_30;
  }
  sessionID = self->_sessionID;
  id v7 = objc_alloc(getHMDeviceSetupOperationClass());
  if (sessionID)
  {
    id v8 = (HMDeviceSetupOperation *)[v7 initWithSession:v5 sessionIdentifier:self->_sessionID];
    homeKitDeviceSetupOperation = self->_homeKitDeviceSetupOperation;
    self->_homeKitDeviceSetupOperation = v8;

    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      id v14 = self->_sessionID;
LABEL_19:
      LogPrintF();
    }
  }
  else
  {
    id v11 = (HMDeviceSetupOperation *)[v7 initWithSession:v5];
    double v12 = self->_homeKitDeviceSetupOperation;
    self->_homeKitDeviceSetupOperation = v11;

    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_19;
    }
  }
  if (self->_userInteractive) {
    uint64_t v13 = 33;
  }
  else {
    uint64_t v13 = 9;
  }
  -[HMDeviceSetupOperation setQualityOfService:](self->_homeKitDeviceSetupOperation, "setQualityOfService:", v13, v14);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __56__HDSDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke;
  v15[3] = &unk_26503F6A8;
  v15[4] = self;
  [(HMDeviceSetupOperation *)self->_homeKitDeviceSetupOperation setCompletionBlock:v15];
  [(TROperationQueue *)self->_trOperationQueue addOperation:self->_homeKitDeviceSetupOperation];
  self->_startTicksForHomeKitSteps = mach_absolute_time();
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_30:
}

void __56__HDSDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned int v2 = *(NSObject **)(v1 + 232);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HDSDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke_2;
  block[3] = &unk_26503F6A8;
  block[4] = v1;
  dispatch_async(v2, block);
}

void __56__HDSDeviceOperationHomeKitSetup__runHomeKitDeviceSetup__block_invoke_2(uint64_t a1)
{
  mach_absolute_time();
  UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 296) = v2;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 296);
    LogPrintF();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 8))
  {
    uint64_t v4 = [*(id *)(v3 + 96) error];

    if (v4)
    {
      BOOL v5 = [*(id *)(*(void *)(a1 + 32) + 96) error];
      NSErrorNestedF();
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      int v6 = *(void **)(a1 + 32);
      id v7 = @"HDS-HK-DeviceSetup-DeviceSetupOperationFailed";
      uint64_t v8 = (uint64_t)v14;
LABEL_8:
      objc_msgSend(v6, "_completeWithError:errorLabel:", v8, v7, v13);

      return;
    }
    uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 96) accessory];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 104);
    *(void *)(v10 + 104) = v9;

    if (!*(void *)(*(void *)(a1 + 32) + 104))
    {
      uint64_t v8 = NSErrorF();
      id v14 = (id)v8;
      int v6 = *(void **)(a1 + 32);
      id v7 = @"HDS-HK-DeviceSetup-DeviceSetupOperationFailed";
      goto LABEL_8;
    }
    if (+[HDSDefaults sysDropForceErrorLateEnabled])
    {
      uint64_t v8 = NSErrorWithOSStatusF();
      id v14 = (id)v8;
      int v6 = *(void **)(a1 + 32);
      id v7 = @"Force-Failure";
      goto LABEL_8;
    }
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 48) = 27;
    double v12 = *(void **)(a1 + 32);
    [v12 _run];
  }
}

- (id)_runHomeKitAutoSelectHome:(BOOL)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  BOOL v5 = [(HMHomeManager *)self->_homeKitHomeManager homes];
  int v6 = v5;
  if (!a3)
  {
    if (![v5 count])
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      [(HDSDeviceOperationHomeKitSetup *)self _runHomeKitAddHome];
LABEL_52:
      id v7 = 0;
      goto LABEL_53;
    }
    if ([v6 count] == 1)
    {
      id v7 = [v6 firstObject];
      if (v7 && [(HDSDeviceOperationHomeKitSetup *)self _isOwnerOfHome:v7])
      {
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        goto LABEL_53;
      }
    }
  }
  uint64_t v8 = &gLogCategory_CLISetupInteractor;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    uint64_t v27 = [v6 count];
    LogPrintF();
  }
  if (self->_promptForHomeHandler)
  {
    uint64_t v9 = [(HMHomeManager *)self->_homeKitHomeManager currentHome];
    uint64_t v10 = [v9 uniqueIdentifier];

    if (v10)
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v11 = v6;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v12)
      {
        uint64_t v13 = 0;
        uint64_t v14 = *(void *)v30;
LABEL_21:
        uint64_t v15 = 0;
        uint64_t v28 = v13 + v12;
        while (1)
        {
          if (*(void *)v30 != v14) {
            objc_enumerationMutation(v11);
          }
          BOOL v16 = objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * v15), "uniqueIdentifier", v27);
          char v17 = [v16 isEqual:v10];

          if (v17) {
            break;
          }
          if (v12 == ++v15)
          {
            uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
            uint64_t v13 = v28;
            if (v12) {
              goto LABEL_21;
            }
            break;
          }
        }
        uint64_t v8 = &gLogCategory_CLISetupInteractor;
      }
    }
    int v18 = v8[106];
    if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      BOOL v20 = timeoutTimer;
      dispatch_source_cancel(v20);
      v21 = self->_timeoutTimer;
      self->_timeoutTimer = 0;
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    double v23 = v22;
    int v24 = v8[106];
    if (v24 <= 30 && (v24 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_double metricNonUserSeconds = v23 + self->_metricNonUserSeconds;
    self->_startTicks = mach_absolute_time();
    int v25 = v8[106];
    if (v25 <= 30 && (v25 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_int state = 17;
    (*((void (**)(void))self->_promptForHomeHandler + 2))();

    goto LABEL_52;
  }
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v7 = objc_msgSend(v6, "firstObject", v27);
LABEL_53:

  return v7;
}

- (void)_runHomeKitAddHome
{
  self->_int state = 18;
  homeKitHomeManager = self->_homeKitHomeManager;
  uint64_t v4 = initSFLocalizedStringForKey(@"MY_HOME");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__HDSDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke;
  v5[3] = &unk_26503F968;
  v5[4] = self;
  [(HMHomeManager *)homeKitHomeManager addHomeWithName:v4 completionHandler:v5];
}

void __52__HDSDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 232);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__HDSDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke_2;
  block[3] = &unk_26503F940;
  block[4] = v7;
  id v12 = v6;
  id v13 = v5;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __52__HDSDeviceOperationHomeKitSetup__runHomeKitAddHome__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (v1[8])
  {
    if (*(void *)(a1 + 40))
    {
      uint64_t v3 = *(void **)(a1 + 32);
      objc_msgSend(v3, "_completeWithError:errorLabel:");
    }
    else if (*(void *)(a1 + 48))
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 248), *(id *)(a1 + 48));
      uint64_t v4 = *(void **)(a1 + 32);
      [v4 _run];
    }
    else
    {
      NSErrorWithOSStatusF();
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      [v1 _completeWithError:v5 errorLabel:@"HDS-HK-AddHome"];
    }
  }
}

- (void)_runHomeKitSelectRoom
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  uint64_t v3 = self->_homeKitSelectedHome;
  if (*(_OWORD *)&self->_promptForRoomHandler != 0)
  {
    v45 = self;
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    v43 = v3;
    id v5 = [(HMHome *)v3 rooms];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v54 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = [*(id *)(*((void *)&v53 + 1) + 8 * i) name];
          if (v10 && ([v4 containsObject:v10] & 1) == 0) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v7);
    }

    objc_msgSend(v4, "sortUsingSelector:");
    id v47 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v11 = [&unk_26F260AC0 countByEnumeratingWithState:&v49 objects:v57 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      v46 = 0;
      uint64_t v14 = *(void *)v50;
      uint64_t v15 = self;
      do
      {
        uint64_t v16 = 0;
        uint64_t v44 = v13;
        uint64_t v17 = 10 - v13;
        do
        {
          if (*(void *)v50 != v14) {
            objc_enumerationMutation(&unk_26F260AC0);
          }
          int v18 = initSFLocalizedStringForKey(*(void **)(*((void *)&v49 + 1) + 8 * v16));
          if (v18)
          {
            int v19 = [(HDSDeviceOperationHomeKitSetup *)v15 _normalizedString:v18];
            v48[0] = MEMORY[0x263EF8330];
            v48[1] = 3221225472;
            v48[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitSelectRoom__block_invoke;
            v48[3] = &unk_26503F990;
            v48[4] = v19;
            if ([v4 indexOfObjectPassingTest:v48] == 0x7FFFFFFFFFFFFFFFLL)
            {
              [v47 addObject:v18];
              if (v17 == v16)
              {
                id v20 = v18;

                v46 = v20;
                uint64_t v15 = v45;
              }
            }
          }
          ++v16;
        }
        while (v12 != v16);
        uint64_t v13 = v44 + v12;
        uint64_t v12 = [&unk_26F260AC0 countByEnumeratingWithState:&v49 objects:v57 count:16];
      }
      while (v12);
    }
    else
    {
      v46 = 0;
      uint64_t v15 = self;
    }
    uint64_t v3 = v43;
    [(HDSDeviceOperationHomeKitSetup *)v15 _removeSimilarRoomNames:v47 home:v43];
    [v47 sortUsingSelector:sel_localizedStandardCompare_];
    v21 = [v4 arrayByAddingObjectsFromArray:v47];
    timeoutTimer = v15->_timeoutTimer;
    if (timeoutTimer)
    {
      double v23 = timeoutTimer;
      dispatch_source_cancel(v23);
      int v24 = v45->_timeoutTimer;
      v45->_timeoutTimer = 0;

      uint64_t v15 = v45;
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    double v26 = v25;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      double v39 = v26;
      LogPrintF();
    }
    v15->_double metricNonUserSeconds = v26 + v15->_metricNonUserSeconds;
    v15->_startTicks = mach_absolute_time();
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v15->_promptForRoomHandler
      && v15->_promptForRoomHandlerDetailed
      && gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v27 = objc_msgSend(v4, "count", *(void *)&v39);
    uint64_t v28 = v27;
    if (v15->_promptForRoomHandlerDetailed)
    {
      long long v29 = [MEMORY[0x263F088C8] indexPathForRow:0 inSection:0];
      if (v28)
      {
        long long v30 = v46;
      }
      else
      {
        long long v30 = v46;
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          id v40 = v46;
          LogPrintF();
        }
        if (v46) {
          uint64_t v32 = [v47 indexOfObject:v46];
        }
        else {
          uint64_t v32 = 0;
        }
        uint64_t v33 = objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", v32, 1, v40);

        long long v29 = (void *)v33;
        uint64_t v15 = v45;
      }
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        id v41 = v47;
        v42 = v29;
        id v40 = v4;
        LogPrintF();
      }
      promptForRoomHandlerDetailed = (void (**)(id, void *, id, id, void *))v15->_promptForRoomHandlerDetailed;
      uint64_t v35 = [(HMHome *)v43 name];
      promptForRoomHandlerDetailed[2](promptForRoomHandlerDetailed, v35, v4, v47, v29);
    }
    else
    {
      if (v27)
      {
        uint64_t v31 = 0;
        long long v30 = v46;
      }
      else
      {
        long long v30 = v46;
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        if (v46) {
          uint64_t v31 = [v21 indexOfObject:v46];
        }
        else {
          uint64_t v31 = 0;
        }
      }
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id promptForRoomHandler = (void (**)(id, void *, uint64_t))v15->_promptForRoomHandler;
      if (promptForRoomHandler) {
        promptForRoomHandler[2](promptForRoomHandler, v21, v31);
      }
    }

    goto LABEL_80;
  }
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v36 = [(HMHome *)v3 roomForEntireHome];
  homeKitSelectedRoom = self->_homeKitSelectedRoom;
  self->_homeKitSelectedRoom = v36;

  if (!self->_homeKitSelectedRoom)
  {
    NSErrorWithOSStatusF();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v4 errorLabel:@"HDS-HK-RoomSelection"];
LABEL_80:
  }
}

BOOL __55__HDSDeviceOperationHomeKitSetup__runHomeKitSelectRoom__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = [a2 caseInsensitiveCompare:*(void *)(a1 + 32)];
  if (!v5) {
    *a4 = 1;
  }
  return v5 == 0;
}

- (void)_runHomeKitAddAccessory
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  self->_int state = 28;
  uint64_t v3 = [(HMAccessory *)self->_homeKitAccessory uniqueIdentifier];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = [(HMHome *)self->_homeKitSelectedHome accessories];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v21 != v7) {
        objc_enumerationMutation(v4);
      }
      id v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
      id v10 = [v9 uniqueIdentifier];
      char v11 = [v10 isEqual:v3];

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v12 = v9;

    if (!v12) {
      goto LABEL_14;
    }
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitAccessory = self->_homeKitAccessory;
    self->_homeKitAccessory = v12;
    uint64_t v14 = v12;

    self->_homeKitAddedAccessory = 1;
  }
  else
  {
LABEL_9:

LABEL_14:
    self->_startTicksForHomeKitSteps = mach_absolute_time();
    uint64_t v13 = [(HDSDeviceOperationHomeKitSetup *)self pairedPeer];
    uint64_t v14 = [v13 identifier];

    if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[HMAccessory setPeerIdentifier:](self->_homeKitAccessory, "setPeerIdentifier:", v14, v14);
      }
      else
      {
        -[HMAccessory setPeerIdentifier:](self->_homeKitAccessory, "setPeerIdentifier:", v14, v18);
      }
    }
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitSelectedHome = self->_homeKitSelectedHome;
    uint64_t v17 = self->_homeKitAccessory;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __57__HDSDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke;
    v19[3] = &unk_26503F7B8;
    v19[4] = self;
    [(HMHome *)homeKitSelectedHome addAccessory:v17 completionHandler:v19];
  }
}

void __57__HDSDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 232);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__HDSDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke_2;
  v7[3] = &unk_26503F8F0;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __57__HDSDeviceOperationHomeKitSetup__runHomeKitAddAccessory__block_invoke_2(uint64_t a1)
{
  mach_absolute_time();
  uint64_t result = UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 304) = v3;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || (uint64_t result = _LogCategory_Initialize(), result))
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 304);
      uint64_t result = LogPrintF();
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "stopSearchingForNewAccessories", v8);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = 0;

    if (*(void *)(a1 + 40))
    {
      id v6 = *(void **)(a1 + 32);
      return objc_msgSend(v6, "_completeWithError:errorLabel:");
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 196) = 1;
      [*(id *)(a1 + 32) _updateAccount];
      uint64_t v7 = *(void **)(a1 + 32);
      return [v7 _run];
    }
  }
  return result;
}

- (void)_runHomeKitSetupRoom:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = self->_homeKitSelectedRoom;
  if (v5)
  {
LABEL_2:
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    homeKitSelectedRoom = self->_homeKitSelectedRoom;
    self->_homeKitSelectedRoom = v5;
    uint64_t v14 = v5;

    self->_int state = 31;
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v6 = [(HMHome *)self->_homeKitSelectedHome rooms];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
LABEL_7:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v21 + 1) + 8 * v10);
        uint64_t v12 = [v11 name];
        char v13 = [v12 isEqual:self->_homeKitSelectedRoomName];

        if (v13) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v8) {
            goto LABEL_7;
          }
          goto LABEL_13;
        }
      }
      uint64_t v5 = v11;

      if (v5) {
        goto LABEL_2;
      }
    }
    else
    {
LABEL_13:
    }
    uint64_t v14 = self->_homeKitSelectedRoomName;
    if (v14)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        homeKitSelectedRoomName = self->_homeKitSelectedRoomName;
        LogPrintF();
      }
      self->_int state = 30;
      homeKitSelectedHome = self->_homeKitSelectedHome;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke;
      v19[3] = &unk_26503F9E0;
      v19[4] = self;
      BOOL v20 = a3;
      -[HMHome addRoomWithName:completionHandler:](homeKitSelectedHome, "addRoomWithName:completionHandler:", v14, v19, homeKitSelectedRoomName);
    }
    else
    {
      uint64_t v16 = NSErrorWithOSStatusF();
      [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v16 errorLabel:@"HDS-HK-NoRoomName"];
    }
  }
}

void __55__HDSDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 232);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_2;
  v11[3] = &unk_26503F9B8;
  v11[4] = v7;
  id v12 = v6;
  id v13 = v5;
  char v14 = *(unsigned char *)(a1 + 40);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __55__HDSDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 8))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3 || (id v6 = *(void **)(a1 + 48)) == 0)
    {
      if ([v3 code] == 1 && !*(unsigned char *)(a1 + 56))
      {
        dispatch_time_t v7 = dispatch_time(0, 2000000000);
        uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 232);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_3;
        block[3] = &unk_26503F8F0;
        id v9 = *(id *)(a1 + 40);
        uint64_t v10 = *(void *)(a1 + 32);
        id v14 = v9;
        uint64_t v15 = v10;
        dispatch_after(v7, v8, block);
      }
      else
      {
        uint64_t v4 = *(void **)(a1 + 32);
        if (*(void *)(a1 + 40))
        {
          id v5 = *(void **)(a1 + 32);
          objc_msgSend(v5, "_completeWithError:errorLabel:");
        }
        else
        {
          NSErrorWithOSStatusF();
          id v12 = (id)objc_claimAutoreleasedReturnValue();
          [v4 _completeWithError:v12 errorLabel:@"HDS-HK-AddRoomWithName"];
        }
      }
    }
    else
    {
      objc_storeStrong((id *)(v1 + 120), v6);
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 48) = 31;
      char v11 = *(void **)(a1 + 32);
      [v11 _run];
    }
  }
}

uint64_t __55__HDSDeviceOperationHomeKitSetup__runHomeKitSetupRoom___block_invoke_3(uint64_t a1)
{
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "_runHomeKitSetupRoom:", 1, v4);
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 _run];
}

- (void)_runHomeKitAssignRoom
{
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    id v6 = [(HMRoom *)self->_homeKitSelectedRoom name];
    LogPrintF();
  }
  self->_int state = 32;
  self->_startTicksForHomeKitSteps = mach_absolute_time();
  homeKitSelectedHome = self->_homeKitSelectedHome;
  homeKitAccessory = self->_homeKitAccessory;
  homeKitSelectedRoom = self->_homeKitSelectedRoom;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke;
  v7[3] = &unk_26503F7B8;
  v7[4] = self;
  [(HMHome *)homeKitSelectedHome assignAccessory:homeKitAccessory toRoom:homeKitSelectedRoom completionHandler:v7];
}

void __55__HDSDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 232);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke_2;
  v7[3] = &unk_26503F8F0;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

unsigned char *__55__HDSDeviceOperationHomeKitSetup__runHomeKitAssignRoom__block_invoke_2(uint64_t a1)
{
  mach_absolute_time();
  UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 312) = v2;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[8])
  {
    if (*(void *)(a1 + 40))
    {
      return (unsigned char *)objc_msgSend(result, "_completeWithError:errorLabel:");
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(void *)(a1 + 32) + 48) = 33;
      uint64_t v4 = *(void **)(a1 + 32);
      return (unsigned char *)[v4 _run];
    }
  }
  return result;
}

- (void)_runHomeKitAddAppData
{
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  homeKitAccessory = self->_homeKitAccessory;
  if (homeKitAccessory)
  {
    uint64_t v4 = [(HMAccessory *)homeKitAccessory applicationData];
    appDataSelf = self->_appDataSelf;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke;
    v10[3] = &unk_26503FA08;
    id v11 = v4;
    id v6 = v4;
    [(NSDictionary *)appDataSelf enumerateKeysAndObjectsUsingBlock:v10];
    dispatch_time_t v7 = self->_homeKitAccessory;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_2;
    v9[3] = &unk_26503F7B8;
    v9[4] = self;
    [(HMAccessory *)v7 updateApplicationData:v6 completionHandler:v9];
  }
  else
  {
    NSErrorWithOSStatusF();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v8 errorLabel:@"HDS-HK-AppData-NoHKAccessory"];
  }
}

uint64_t __55__HDSDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void __55__HDSDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 232);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__HDSDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_3;
  v7[3] = &unk_26503F8F0;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __55__HDSDeviceOperationHomeKitSetup__runHomeKitAddAppData__block_invoke_3(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 40);
    if (v2)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 60)
      {
        if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1
          || (int v3 = _LogCategory_Initialize(), v2 = *(void *)(v1 + 40), v3))
        {
          LogPrintF();
          uint64_t v2 = *(void *)(v1 + 40);
        }
      }
      uint64_t v4 = *(void **)(v1 + 32);
      return [v4 _completeWithError:v2 errorLabel:@"HDS-HK-AddAppData"];
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(v1 + 32) + 128) = 1;
      id v5 = *(void **)(v1 + 32);
      return [v5 _run];
    }
  }
  return result;
}

- (BOOL)_runHomeKitConfigureStereoPairAndReturnError:(id *)a3
{
  v32[2] = *MEMORY[0x263EF8340];
  id v5 = self->_stereoCounterpart;
  if (!v5 || (self->_stereoRole & 0xFFFFFFFE) != 2) {
    goto LABEL_19;
  }
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!self->_homeKitAccessory)
  {
    if (a3) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  Class HMMediaSystemBuilderClass = getHMMediaSystemBuilderClass();
  homeKitAccessory = self->_homeKitAccessory;
  v32[0] = v5;
  v32[1] = homeKitAccessory;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
  LOBYTE(HMMediaSystemBuilderClass) = [(objc_class *)HMMediaSystemBuilderClass isStereoPairingSupportedForAccessories:v8];

  if ((HMMediaSystemBuilderClass & 1) == 0)
  {
    if (a3)
    {
LABEL_18:
      NSErrorWithOSStatusF();
      BOOL v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    }
LABEL_19:
    BOOL v16 = 0;
    goto LABEL_20;
  }
  id v9 = self->_homeKitSelectedHome;
  if (v9)
  {
    uint64_t v10 = self->_homeKitSelectedRoomName;
    if (v10)
    {
      id v11 = (void *)[objc_alloc(getHMMediaSystemBuilderClass()) initWithHome:v9];
      id v12 = v11;
      if (v11)
      {
        [v11 setName:v10];
        id v13 = [(HMAccessory *)self->_homeKitAccessory mediaProfile];
        if (v13)
        {
          int stereoRole = self->_stereoRole;
          Class HMMediaSystemRoleClass = getHMMediaSystemRoleClass();
          if (stereoRole == 2) {
            [(objc_class *)HMMediaSystemRoleClass leftRole];
          }
          else {
          uint64_t v18 = [(objc_class *)HMMediaSystemRoleClass rightRole];
          }
          uint64_t v27 = [objc_alloc(getHMMediaSystemComponentClass()) initWithMediaProfile:v13 role:v18];
          uint64_t v28 = (void *)v18;
          if (v27)
          {
            uint64_t v26 = [(HMAccessory *)v5 mediaProfile];
            if (v26)
            {
              int v19 = self->_stereoRole;
              Class v20 = getHMMediaSystemRoleClass();
              if (v19 == 2) {
                [(objc_class *)v20 rightRole];
              }
              else {
              long long v24 = [(objc_class *)v20 leftRole];
              }
              uint64_t v21 = [objc_alloc(getHMMediaSystemComponentClass()) initWithMediaProfile:v26 role:v24];
              BOOL v16 = v21 != 0;
              uint64_t v25 = (void *)v21;
              if (v21)
              {
                self->_stereoPairStartTicks = mach_absolute_time();
                if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }
                long long v22 = (void *)v27;
                v31[0] = v27;
                v31[1] = v25;
                long long v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:2];
                [v12 setComponents:v23];

                v29[0] = MEMORY[0x263EF8330];
                v29[1] = 3221225472;
                v29[2] = __79__HDSDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke;
                v29[3] = &unk_26503FA58;
                v29[4] = self;
                id v30 = v12;
                [v30 commitWithCompletionHandler:v29];
              }
              else
              {
                long long v22 = (void *)v27;
                if (a3)
                {
                  NSErrorWithOSStatusF();
                  *a3 = (id)objc_claimAutoreleasedReturnValue();
                }
              }
            }
            else
            {
              if (a3)
              {
                NSErrorWithOSStatusF();
                BOOL v16 = 0;
                *a3 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                BOOL v16 = 0;
              }
              long long v22 = (void *)v27;
            }
          }
          else
          {
            if (a3)
            {
              NSErrorWithOSStatusF();
              BOOL v16 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              BOOL v16 = 0;
            }
            long long v22 = 0;
          }
        }
        else if (a3)
        {
          NSErrorWithOSStatusF();
          BOOL v16 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else if (a3)
      {
        NSErrorWithOSStatusF();
        BOOL v16 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else if (a3)
    {
      NSErrorWithOSStatusF();
      BOOL v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else if (a3)
  {
    NSErrorWithOSStatusF();
    BOOL v16 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v16 = 0;
  }

LABEL_20:
  return v16;
}

void __79__HDSDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(void *)(*(void *)(a1 + 32) + 344) = v7;
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 232);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __79__HDSDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke_2;
    v11[3] = &unk_26503FA30;
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v12 = v9;
    uint64_t v13 = v10;
    id v14 = v6;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(v8, v11);
  }
}

void __79__HDSDeviceOperationHomeKitSetup__runHomeKitConfigureStereoPairAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 90)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1
        || (v5 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v5))
      {
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    id v6 = *(void **)(a1 + 40);
    [v6 _completeWithError:v2 errorLabel:@"HDS-HK-StereoPair"];
    return;
  }
  int v3 = *(void **)(a1 + 48);
  if (v3)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_17;
        }
        int v3 = *(void **)(a1 + 48);
      }
      uint64_t v4 = [v3 uniqueIdentifier];
      id v9 = [*(id *)(a1 + 56) name];
      LogPrintF();
    }
LABEL_17:
    *(unsigned char *)(*(void *)(a1 + 40) + 129) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 40) + 136), *(id *)(a1 + 48));
    uint64_t v7 = *(void **)(a1 + 40);
    [v7 _run];
    return;
  }
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 90
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v8 = *(void **)(a1 + 40);
  NSErrorWithOSStatusF();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v8 _completeWithError:v10 errorLabel:@"HDS-HK-StereoPair-NoMediaSystem"];
}

- (void)_runHomeKitUpdateAppleTVAudioDestination
{
  self->_odeonStartTicks = mach_absolute_time();
  int v3 = [(HMAccessory *)self->_tvAudioInput audioDestinationController];
  if (v3)
  {
    uint64_t v4 = 136;
    if (!self->_configuredStereoPair) {
      uint64_t v4 = 104;
    }
    id v5 = *(id *)((char *)&self->super.isa + v4);
    if (v5)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 3221225472;
      v7[2] = __74__HDSDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke;
      v7[3] = &unk_26503F7E0;
      v7[4] = self;
      id v8 = v3;
      [v8 updateDestination:v5 options:2 completionHandler:v7];
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 115
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      id v6 = NSErrorWithOSStatusF();
      [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v6 errorLabel:@"HDS-HK-NoAudioDestination"];
    }
  }
  else
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 115
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorWithOSStatusF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v5 errorLabel:@"HDS-HK-Odeon-NoAudioDestinationController"];
  }
}

void __74__HDSDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  mach_absolute_time();
  UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 456) = v4;
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 8))
  {
    id v6 = *(NSObject **)(v5 + 232);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __74__HDSDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke_2;
    block[3] = &unk_26503F940;
    void block[4] = v5;
    id v8 = v3;
    id v9 = *(id *)(a1 + 40);
    dispatch_async(v6, block);
  }
}

uint64_t __74__HDSDeviceOperationHomeKitSetup__runHomeKitUpdateAppleTVAudioDestination__block_invoke_2(uint64_t a1)
{
  mach_absolute_time();
  UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 456) = v2;
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 60)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1
        || (v4 = _LogCategory_Initialize(), uint64_t v3 = *(void *)(a1 + 40), v4))
      {
        LogPrintF();
        uint64_t v3 = *(void *)(a1 + 40);
      }
    }
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 _completeWithError:v3 errorLabel:@"HDS-HK-Odeon"];
  }
  else
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      id v8 = [*(id *)(*(void *)(a1 + 32) + 216) name];
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 _run];
  }
}

- (id)_homeKitFindSettingsWithKeyPath:(id)a3 group:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = [v7 settings];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v14 = [v13 keyPath];
        char v15 = [v14 isEqual:v6];

        if (v15)
        {
          id v20 = v13;
          goto LABEL_19;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = objc_msgSend(v7, "groups", 0);
  uint64_t v16 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v24;
LABEL_11:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v24 != v18) {
        objc_enumerationMutation(v8);
      }
      id v20 = [(HDSDeviceOperationHomeKitSetup *)self _homeKitFindSettingsWithKeyPath:v6 group:*(void *)(*((void *)&v23 + 1) + 8 * v19)];
      if (v20) {
        break;
      }
      if (v17 == ++v19)
      {
        uint64_t v17 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v17) {
          goto LABEL_11;
        }
        goto LABEL_17;
      }
    }
LABEL_19:
    uint64_t v21 = v20;
  }
  else
  {
LABEL_17:
    uint64_t v21 = 0;
  }

  return v21;
}

- (void)_runUpdateUserListeningHistoryStart
{
  uint64_t v3 = self->_homeKitAccessory;
  if (v3)
  {
    int v4 = self->_homeKitSelectedHome;
    uint64_t v5 = [(HMHome *)self->_homeKitSelectedHome owner];
    if (v5)
    {
      id v6 = [(HMHome *)v4 owner];
      id v7 = [v6 userSettingsForHome:v4];
      id v8 = [v7 settings];

      uint64_t v9 = [v8 rootGroup];
      uint64_t v10 = [(HDSDeviceOperationHomeKitSetup *)self _homeKitFindSettingsWithKeyPath:@"root.siri.identifyVoice" group:v9];

      if (v10
        && ([v10 value],
            uint64_t v11 = objc_claimAutoreleasedReturnValue(),
            char v12 = [v11 BOOLValue],
            v11,
            (v12 & 1) != 0))
      {
        uint64_t v13 = [v5 userListeningHistoryUpdateControlForHome:v4];
        id v14 = (void *)[v13 mutableCopy];
        if (v14)
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          [v14 addAccessory:v3];
          self->_startTicksForHomeKitSteps = mach_absolute_time();
          v16[0] = MEMORY[0x263EF8330];
          v16[1] = 3221225472;
          v16[2] = __69__HDSDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke;
          v16[3] = &unk_26503F7B8;
          v16[4] = self;
          [v5 updateUserListeningHistoryUpdateControl:v14 forHome:v4 completionHandler:v16];
        }
        else
        {
          char v15 = NSErrorWithOSStatusF();
          [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v15 errorLabel:@"HDS-HK-ULH-CreateAccessFail"];
        }
      }
      else
      {
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 50
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_userListeningHistoryDone = 1;
      }
    }
    else
    {
      id v8 = NSErrorWithOSStatusF();
      [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v8 errorLabel:@"HDS-HK-NotOwner"];
    }
  }
  else
  {
    NSErrorWithOSStatusF();
    int v4 = (HMHome *)objc_claimAutoreleasedReturnValue();
    [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v4 errorLabel:@"NoAccessory"];
  }
}

void __69__HDSDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 232);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__HDSDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke_2;
  v7[3] = &unk_26503F8F0;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __69__HDSDeviceOperationHomeKitSetup__runUpdateUserListeningHistoryStart__block_invoke_2(uint64_t a1)
{
  mach_absolute_time();
  uint64_t result = UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 328) = v3;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 60)
      {
        if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1
          || (v5 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 40), v5))
        {
          LogPrintF();
          uint64_t v4 = *(void *)(a1 + 40);
        }
      }
      id v6 = *(void **)(a1 + 32);
      return [v6 _completeWithError:v4 errorLabel:@"HDS-HK-ULH-UpdateAccessControlFailed"];
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 145) = 1;
      id v7 = *(void **)(a1 + 32);
      return [v7 _run];
    }
  }
  return result;
}

- (void)_runPersonalRequestsStart
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  if (self->_personalRequestsEnabled)
  {
    long long v27 = self->_homeKitAccessory;
    if (v27)
    {
      uint64_t v3 = self->_homeKitSelectedHome;
      uint64_t v4 = [(HMHome *)self->_homeKitSelectedHome owner];
      int v5 = v4;
      if (v4)
      {
        id v6 = [v4 assistantAccessControlForHome:v3];
        id v7 = (void *)[v6 mutableCopy];
        if (v7)
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          [v7 setEnabled:1];
          if (_os_feature_enabled_impl())
          {
            long long v22 = v7;
            long long v23 = v6;
            long long v24 = v5;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            long long v25 = v3;
            id obj = [(HMHome *)v3 accessories];
            uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v30;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v30 != v13) {
                    objc_enumerationMutation(obj);
                  }
                  char v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
                  uint64_t v16 = [v15 category];
                  uint64_t v17 = [v16 categoryType];
                  uint64_t v18 = getHMAccessoryCategoryTypeHomePod();
                  if ([v17 isEqualToString:v18])
                  {
                    uint64_t v19 = [v15 uniqueIdentifier];
                    id v20 = [(HMAccessory *)v27 uniqueIdentifier];
                    int v21 = [v19 isEqual:v20];

                    if (!v21)
                    {

                      int v5 = v24;
                      uint64_t v3 = v25;
                      id v7 = v22;
                      id v6 = v23;
                      goto LABEL_34;
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v12 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
              }
              while (v12);
            }

            if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
              && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            id v7 = v22;
            [v22 setAllowUnauthenticatedRequests:1];
            int v5 = v24;
            uint64_t v3 = v25;
            id v6 = v23;
          }
LABEL_34:
          self->_startTicksForHomeKitSteps = mach_absolute_time();
          [v7 addAccessory:v27];
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __59__HDSDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke;
          v28[3] = &unk_26503F7B8;
          v28[4] = self;
          [v5 updateAssistantAccessControl:v7 forHome:v3 completionHandler:v28];
        }
        else
        {
          uint64_t v10 = NSErrorWithOSStatusF();
          [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v10 errorLabel:@"HDS-HK-PR-CreateAccessFail"];
        }
      }
      else
      {
        uint64_t v9 = NSErrorWithOSStatusF();
        [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v9 errorLabel:@"HDS-HK-NotOwner"];
      }
    }
    else
    {
      id v8 = NSErrorWithOSStatusF();
      [(HDSDeviceOperationHomeKitSetup *)self _completeWithError:v8 errorLabel:@"HDS-HK-NoAccessory"];
    }
  }
  else
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_personalRequestsDone = 1;
  }
}

void __59__HDSDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(NSObject **)(v4 + 232);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __59__HDSDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke_2;
  v7[3] = &unk_26503F8F0;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

uint64_t __59__HDSDeviceOperationHomeKitSetup__runPersonalRequestsStart__block_invoke_2(uint64_t a1)
{
  mach_absolute_time();
  uint64_t result = UpTicksToSecondsF();
  *(void *)(*(void *)(a1 + 32) + 320) = v3;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || (uint64_t result = _LogCategory_Initialize(), result)) {
      uint64_t result = LogPrintF();
    }
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 60)
      {
        if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1
          || (v5 = _LogCategory_Initialize(), uint64_t v4 = *(void *)(a1 + 40), v5))
        {
          LogPrintF();
          uint64_t v4 = *(void *)(a1 + 40);
        }
      }
      id v6 = *(void **)(a1 + 32);
      return [v6 _completeWithError:v4 errorLabel:@"HDS-HK-PR-UpdateAccessControlFailed"];
    }
    else
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(a1 + 32) + 144) = 1;
      id v7 = *(void **)(a1 + 32);
      return [v7 _run];
    }
  }
  return result;
}

- (void)homeManagerDidUpdateDataSyncState:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__HDSDeviceOperationHomeKitSetup_homeManagerDidUpdateDataSyncState___block_invoke;
  v7[3] = &unk_26503F8F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __68__HDSDeviceOperationHomeKitSetup_homeManagerDidUpdateDataSyncState___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      [*(id *)(v1 + 40) dataSyncState];
      LogPrintF();
    }
    uint64_t v2 = *(void **)(v1 + 32);
    return [v2 _run];
  }
  return result;
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__HDSDeviceOperationHomeKitSetup_homeManagerDidUpdateHomes___block_invoke;
  block[3] = &unk_26503F6A8;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __60__HDSDeviceOperationHomeKitSetup_homeManagerDidUpdateHomes___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 197) = 1;
    uint64_t v2 = *(void **)(v1 + 32);
    return [v2 _run];
  }
  return result;
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__HDSDeviceOperationHomeKitSetup_homeManager_didUpdateStatus___block_invoke;
  v5[3] = &unk_26503F918;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

uint64_t __62__HDSDeviceOperationHomeKitSetup_homeManager_didUpdateStatus___block_invoke(uint64_t result)
{
  if (*(unsigned char *)(*(void *)(result + 32) + 8))
  {
    uint64_t v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v2 = *(void **)(v1 + 32);
    return [v2 _run];
  }
  return result;
}

- (void)addHomePodsToAccessorySync:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  homePodsAccessorySyncing = self->_homePodsAccessorySyncing;
  self->_homePodsAccessorySyncing = v5;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "remoteLoginHandler", v19);
        id v14 = [v13 loggedInAccount];

        if (!v14)
        {
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            uint64_t v19 = v12;
            LogPrintF();
          }
          objc_msgSend(v12, "setDelegate:", self, v19);
          uint64_t v17 = self->_homePodsAccessorySyncing;
          char v15 = [v12 uniqueIdentifier];
          uint64_t v16 = [v15 UUIDString];
          [(NSMutableDictionary *)v17 setValue:v12 forKey:v16];
          goto LABEL_17;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          char v15 = [v12 remoteLoginHandler];
          uint64_t v16 = [v15 loggedInAccount];
          uint64_t v19 = v16;
          LogPrintF();
LABEL_17:

          continue;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  if ([(NSMutableDictionary *)self->_homePodsAccessorySyncing count])
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    [(HDSDeviceOperationHomeKitSetup *)self _timeoutForAccessorySync];
  }
  else
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v18 = self->_homePodsAccessorySyncing;
    self->_homePodsAccessorySyncing = 0;

    self->_accessorySyncDone = 1;
    self->_int state = 23;
    [(HDSDeviceOperationHomeKitSetup *)self _run];
  }
}

- (void)performReadinessCheck:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id obj = a3;
  if (self->_homeKitHomeManager)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v4 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
            && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          {
            uint64_t v11 = [v8 uniqueIdentifier];
            LogPrintF();
          }
          homeKitSelectedHome = self->_homeKitSelectedHome;
          sessionID = self->_sessionID;
          v13[0] = MEMORY[0x263EF8330];
          v13[1] = 3221225472;
          v13[2] = __56__HDSDeviceOperationHomeKitSetup_performReadinessCheck___block_invoke;
          v13[3] = &unk_26503FA80;
          v13[4] = v8;
          -[HMHome performMediaGroupReadinessCheckForAccessory:timeout:setupSessionIdentifier:completion:](homeKitSelectedHome, "performMediaGroupReadinessCheckForAccessory:timeout:setupSessionIdentifier:completion:", v8, sessionID, v13, 10.0, v11);
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }
  }
}

uint64_t __56__HDSDeviceOperationHomeKitSetup_performReadinessCheck___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
  {
    id v8 = v4;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || (id v4 = (id)_LogCategory_Initialize(), v5 = v8, v4))
    {
      uint64_t v6 = [*(id *)(a1 + 32) uniqueIdentifier];
      LogPrintF();

      id v5 = v8;
    }
  }
  return MEMORY[0x270F9A758](v4, v5);
}

- (id)findStereoCounterpartsWithSupportedVersions:(unint64_t)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v5 = self->_homeKitSelectedRoom;
  if (v5) {
    goto LABEL_2;
  }
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v8 = [(HMHome *)self->_homeKitSelectedHome rooms];
  uint64_t v9 = (HMRoom *)[v8 countByEnumeratingWithState:&v56 objects:v61 count:16];
  if (!v9) {
    goto LABEL_87;
  }
  uint64_t v10 = *(void *)v57;
LABEL_6:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v57 != v10) {
      objc_enumerationMutation(v8);
    }
    uint64_t v12 = *(void **)(*((void *)&v56 + 1) + 8 * v11);
    uint64_t v13 = [v12 name];
    char v14 = [v13 isEqual:self->_homeKitSelectedRoomName];

    if (v14) {
      break;
    }
    if (v9 == (HMRoom *)++v11)
    {
      uint64_t v9 = (HMRoom *)[v8 countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (!v9)
      {
LABEL_87:

        goto LABEL_88;
      }
      goto LABEL_6;
    }
  }
  uint64_t v9 = v12;

  id v5 = v9;
  if (v9)
  {
LABEL_2:
    uint64_t v6 = self->_iTunesAccountID;
    if (v6)
    {
      id v7 = v6;
      long long v50 = SFNormalizeEmailAddress(v6, 1);
    }
    else
    {
      long long v50 = 0;
    }
    long long v51 = self;
    id v47 = v5;
    id v48 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v15 = [(HMRoom *)v5 accessories];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (!v16)
    {
LABEL_86:

      uint64_t v9 = (HMRoom *)[v48 copy];
      id v8 = v47;
      goto LABEL_87;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v53;
    unint64_t v49 = a3;
LABEL_16:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v53 != v18) {
        objc_enumerationMutation(v15);
      }
      long long v20 = *(void **)(*((void *)&v52 + 1) + 8 * v19);
      long long v21 = objc_msgSend(v20, "category", v44, v46);
      long long v22 = [v21 categoryType];
      long long v23 = getHMAccessoryCategoryTypeHomePod();
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_84;
      }
      uint64_t v25 = [(HDSDeviceOperationHomeKitSetup *)v51 _mediaSystemForAccessory:v20];
      if (v25)
      {
        if (gLogCategory_HDSDeviceOperationHomeKitSetup > 30
          || gLogCategory_HDSDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_83;
        }
      }
      else if (([v20 supportedStereoPairVersions] & a3) != 0)
      {
        if ([(objc_class *)getHMMediaSystemBuilderClass() supportsMediaSystem:v20])
        {
          long long v26 = [v20 remoteLoginHandler];
          long long v27 = [v26 loggedInAccount];
          long long v28 = [v27 username];

          long long v29 = [v20 remoteLoginHandler];

          if (v29)
          {
            if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
              && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            {
              uint64_t v44 = [v20 remoteLoginHandler];
              LogPrintF();
            }
          }
          else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30 {
                 && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF();
          }
          long long v30 = objc_msgSend(v20, "remoteLoginHandler", v44);
          long long v31 = [v30 loggedInAccount];

          if (v31)
          {
            if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
              && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            {
              long long v32 = [v20 remoteLoginHandler];
              v45 = [v32 loggedInAccount];
              LogPrintF();
            }
          }
          else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30 {
                 && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF();
          }
          uint64_t v33 = objc_msgSend(v20, "remoteLoginHandler", v45);
          uint64_t v34 = [v33 loggedInAccount];
          uint64_t v35 = [v34 username];

          if (v35)
          {
            if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
              && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            {
              id v36 = [v20 remoteLoginHandler];
              uint64_t v37 = [v36 loggedInAccount];
              uint64_t v44 = [v37 username];
              LogPrintF();
            }
          }
          else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30 {
                 && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
          }
          {
            LogPrintF();
          }
          if (v28)
          {
            v38 = SFNormalizeEmailAddress(v28, 1);
          }
          else
          {
            v38 = 0;
          }
          id v39 = v38;
          id v40 = v50;
          id v41 = v40;
          if (v39 == v40)
          {
          }
          else
          {
            if ((v50 != 0) == (v39 == 0))
            {

              goto LABEL_78;
            }
            char v42 = [v39 isEqual:v40];

            if ((v42 & 1) == 0)
            {
LABEL_78:
              if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
              {
                uint64_t v44 = v41;
                uint64_t v46 = (uint64_t)v39;
                LogPrintF();
              }
              goto LABEL_82;
            }
          }
          objc_msgSend(v48, "addObject:", v20, v44);
LABEL_82:

          a3 = v49;
          goto LABEL_83;
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup > 30
          || gLogCategory_HDSDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_83;
        }
      }
      else
      {
        if (gLogCategory_HDSDeviceOperationHomeKitSetup > 30
          || gLogCategory_HDSDeviceOperationHomeKitSetup == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_83;
        }
        uint64_t v44 = (void *)a3;
        uint64_t v46 = [v20 supportedStereoPairVersions];
      }
      LogPrintF();
LABEL_83:

LABEL_84:
      if (v17 == ++v19)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (!v17) {
          goto LABEL_86;
        }
        goto LABEL_16;
      }
    }
  }
LABEL_88:
  return v9;
}

- (id)findTVs
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v3 = self->_homeKitSelectedRoom;
  if (v3)
  {
LABEL_2:
    long long v28 = v3;
    id v29 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v4 = [(HMRoom *)v3 accessories];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v31;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
          uint64_t v10 = objc_msgSend(v9, "category", v27);
          uint64_t v11 = [v10 categoryType];
          uint64_t v12 = getHMAccessoryCategoryTypeAppleTV();
          int v13 = [v11 isEqual:v12];

          if (v13)
          {
            char v14 = [v9 audioDestinationController];

            if (v14)
            {
              long long v15 = [v9 audioDestinationController];
              uint64_t v16 = [v15 destination];

              if (v16)
              {
                if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
                  && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
                {
                  long long v27 = v9;
                  LogPrintF();
                }
              }
              else
              {
                [v29 addObject:v9];
              }
            }
            else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30 {
                   && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
            }
            {
              long long v27 = v9;
              LogPrintF();
            }
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v17 = [v4 countByEnumeratingWithState:&v30 objects:v38 count:16];
        uint64_t v6 = v17;
      }
      while (v17);
    }

    uint64_t v18 = (void *)[v29 copy];
    uint64_t v19 = v28;
    goto LABEL_25;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v19 = [(HMHome *)self->_homeKitSelectedHome rooms];
  uint64_t v18 = (void *)[v19 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (!v18)
  {
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v21 = *(void *)v35;
LABEL_31:
  uint64_t v22 = 0;
  while (1)
  {
    if (*(void *)v35 != v21) {
      objc_enumerationMutation(v19);
    }
    long long v23 = *(void **)(*((void *)&v34 + 1) + 8 * v22);
    int v24 = [v23 name];
    char v25 = [v24 isEqual:self->_homeKitSelectedRoomName];

    if (v25) {
      break;
    }
    if (v18 == (void *)++v22)
    {
      uint64_t v18 = (void *)[v19 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v18) {
        goto LABEL_31;
      }
      goto LABEL_25;
    }
  }
  long long v26 = v23;

  uint64_t v3 = v26;
  if (v26) {
    goto LABEL_2;
  }
  uint64_t v18 = 0;
LABEL_26:
  return v18;
}

- (id)homePodsInHomeRoom:(id)a3 roomName:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v21 = (id)objc_opt_new();
  if (v5 && v6)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v20 = v5;
    uint64_t v7 = [v5 accessories];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          int v13 = [v12 room];
          char v14 = [v13 name];

          long long v15 = [v12 category];
          uint64_t v16 = [v15 categoryType];

          if ([v14 isEqualToString:v6])
          {
            uint64_t v17 = getHMAccessoryCategoryTypeHomePod();
            int v18 = [v16 isEqualToString:v17];

            if (v18) {
              [v21 addObject:v12];
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }

    id v5 = v20;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }

  return v21;
}

- (BOOL)_isOwnerOfHome:(id)a3
{
  id v3 = a3;
  id v4 = [v3 currentUser];
  if (v4)
  {
    id v5 = [v3 homeAccessControlForUser:v4];
    char v6 = [v5 isOwner];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_mediaSystemForAccessory:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 uniqueIdentifier];
  id v5 = [v3 home];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  char v6 = [v5 mediaSystems];
  uint64_t v23 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v23)
  {
    uint64_t v7 = *(void *)v30;
    id v21 = v5;
    id v22 = v3;
    long long v24 = v6;
    uint64_t v20 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v6);
        }
        uint64_t v9 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        uint64_t v10 = [v9 components];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v26;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v26 != v13) {
                objc_enumerationMutation(v10);
              }
              long long v15 = [*(id *)(*((void *)&v25 + 1) + 8 * j) mediaProfile];
              uint64_t v16 = [v15 accessory];
              uint64_t v17 = [v16 uniqueIdentifier];

              if ([v17 isEqual:v4])
              {
                id v18 = v9;

                id v5 = v21;
                id v3 = v22;
                char v6 = v24;
                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }

        char v6 = v24;
        uint64_t v7 = v20;
      }
      id v18 = 0;
      id v5 = v21;
      id v3 = v22;
      uint64_t v23 = [v24 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v23);
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

- (id)_normalizedString:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", @"[ ]+", @" ", 1024, 0, objc_msgSend(v3, "length"));

  id v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  char v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

- (void)_removeSimilarRoomNames:(id)a3 home:(id)a4
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v54 = a4;
  uint64_t v7 = [v54 name];
  uint64_t v8 = [(HDSDeviceOperationHomeKitSetup *)self _normalizedString:v7];

  if (v8)
  {
    uint64_t v9 = [v6 count];
    if (v9)
    {
      unint64_t v10 = v9;
      unint64_t v11 = 0;
      long long v51 = v8;
      id v52 = v6;
      do
      {
        uint64_t v12 = [v6 objectAtIndexedSubscript:v11];
        uint64_t v13 = [(HDSDeviceOperationHomeKitSetup *)self _normalizedString:v12];

        if ([v13 caseInsensitiveCompare:v8])
        {
          unint64_t v53 = v10;
          long long v69 = 0u;
          long long v70 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          char v14 = [v54 actionSets];
          uint64_t v15 = [v14 countByEnumeratingWithState:&v67 objects:v74 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v68;
LABEL_7:
            uint64_t v18 = 0;
            while (1)
            {
              if (*(void *)v68 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v67 + 1) + 8 * v18);
              uint64_t v20 = [v19 name];
              id v21 = [(HDSDeviceOperationHomeKitSetup *)self _normalizedString:v20];

              if (v21)
              {
                if (![v13 caseInsensitiveCompare:v21]) {
                  break;
                }
              }

              if (v16 == ++v18)
              {
                uint64_t v16 = [v14 countByEnumeratingWithState:&v67 objects:v74 count:16];
                if (v16) {
                  goto LABEL_7;
                }
                goto LABEL_14;
              }
            }
            id v22 = [v19 name];

            if (!v22) {
              goto LABEL_18;
            }
            uint64_t v23 = "ActionSet";
          }
          else
          {
LABEL_14:

LABEL_18:
            long long v65 = 0u;
            long long v66 = 0u;
            long long v63 = 0u;
            long long v64 = 0u;
            long long v24 = [v54 serviceGroups];
            uint64_t v25 = [v24 countByEnumeratingWithState:&v63 objects:v73 count:16];
            if (v25)
            {
              uint64_t v26 = v25;
              uint64_t v27 = *(void *)v64;
LABEL_20:
              uint64_t v28 = 0;
              while (1)
              {
                if (*(void *)v64 != v27) {
                  objc_enumerationMutation(v24);
                }
                long long v29 = *(void **)(*((void *)&v63 + 1) + 8 * v28);
                long long v30 = [v29 name];
                long long v31 = [(HDSDeviceOperationHomeKitSetup *)self _normalizedString:v30];

                if (v31)
                {
                  if (![v13 caseInsensitiveCompare:v31]) {
                    break;
                  }
                }

                if (v26 == ++v28)
                {
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v63 objects:v73 count:16];
                  if (v26) {
                    goto LABEL_20;
                  }
                  goto LABEL_27;
                }
              }
              id v22 = [v29 name];

              if (!v22) {
                goto LABEL_30;
              }
              uint64_t v23 = "ServiceGroup";
            }
            else
            {
LABEL_27:

LABEL_30:
              long long v61 = 0u;
              long long v62 = 0u;
              long long v59 = 0u;
              long long v60 = 0u;
              long long v32 = [v54 triggers];
              uint64_t v33 = [v32 countByEnumeratingWithState:&v59 objects:v72 count:16];
              if (v33)
              {
                uint64_t v34 = v33;
                uint64_t v35 = *(void *)v60;
LABEL_32:
                uint64_t v36 = 0;
                while (1)
                {
                  if (*(void *)v60 != v35) {
                    objc_enumerationMutation(v32);
                  }
                  long long v37 = *(void **)(*((void *)&v59 + 1) + 8 * v36);
                  v38 = [v37 name];
                  id v39 = [(HDSDeviceOperationHomeKitSetup *)self _normalizedString:v38];

                  if (v39)
                  {
                    if (![v13 caseInsensitiveCompare:v39]) {
                      break;
                    }
                  }

                  if (v34 == ++v36)
                  {
                    uint64_t v34 = [v32 countByEnumeratingWithState:&v59 objects:v72 count:16];
                    if (v34) {
                      goto LABEL_32;
                    }
                    goto LABEL_39;
                  }
                }
                id v22 = [v37 name];

                if (!v22) {
                  goto LABEL_42;
                }
                uint64_t v23 = "Trigger";
              }
              else
              {
LABEL_39:

LABEL_42:
                long long v57 = 0u;
                long long v58 = 0u;
                long long v55 = 0u;
                long long v56 = 0u;
                uint64_t v40 = [v54 zones];
                uint64_t v41 = [v40 countByEnumeratingWithState:&v55 objects:v71 count:16];
                if (!v41)
                {
LABEL_51:

LABEL_62:
                  ++v11;
                  uint64_t v8 = v51;
                  id v6 = v52;
                  unint64_t v10 = v53;
                  goto LABEL_60;
                }
                uint64_t v42 = v41;
                uint64_t v43 = *(void *)v56;
LABEL_44:
                uint64_t v44 = 0;
                while (1)
                {
                  if (*(void *)v56 != v43) {
                    objc_enumerationMutation(v40);
                  }
                  v45 = *(void **)(*((void *)&v55 + 1) + 8 * v44);
                  uint64_t v46 = [v45 name];
                  id v47 = [(HDSDeviceOperationHomeKitSetup *)self _normalizedString:v46];

                  if (v47)
                  {
                    if (![v13 caseInsensitiveCompare:v47]) {
                      break;
                    }
                  }

                  if (v42 == ++v44)
                  {
                    uint64_t v42 = [v40 countByEnumeratingWithState:&v55 objects:v71 count:16];
                    if (v42) {
                      goto LABEL_44;
                    }
                    goto LABEL_51;
                  }
                }
                id v22 = [v45 name];

                if (!v22) {
                  goto LABEL_62;
                }
                uint64_t v23 = "Zone";
              }
            }
          }
          uint64_t v8 = v51;
          id v6 = v52;
          unint64_t v10 = v53;
        }
        else
        {
          id v22 = v8;
          uint64_t v23 = "Home";
        }
        if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
          && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
        {
          id v49 = v22;
          long long v50 = v23;
          id v48 = v13;
          LogPrintF();
        }
        objc_msgSend(v6, "removeObjectAtIndex:", v11, v48, v49, v50);
        --v10;

LABEL_60:
      }
      while (v11 < v10);
    }
  }
}

- (void)_syncAccessoriesInSelectedRoom
{
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    id v3 = [(HDSDeviceOperationHomeKitSetup *)self homeKitSelectedHome];
    id v4 = [v3 name];
    [(HDSDeviceOperationHomeKitSetup *)self homeKitSelectedRoomName];
    v8 = uint64_t v7 = v4;
    LogPrintF();
  }
  id v5 = [(HDSDeviceOperationHomeKitSetup *)self homeKitSelectedHome];
  id v6 = [(HDSDeviceOperationHomeKitSetup *)self homeKitSelectedRoomName];
  id v9 = [(HDSDeviceOperationHomeKitSetup *)self homePodsInHomeRoom:v5 roomName:v6];

  [(HDSDeviceOperationHomeKitSetup *)self addHomePodsToAccessorySync:v9];
}

- (void)_restoreHomeApp
{
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v3 = (void *)[objc_alloc(getASDSystemAppRequestClass()) initWithBundleID:@"com.apple.Home"];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __49__HDSDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke;
  v5[3] = &unk_26503F7E0;
  v5[4] = self;
  id v6 = v3;
  id v4 = v3;
  [v4 startWithErrorHandler:v5];
}

void __49__HDSDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 232);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__HDSDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke_2;
  v6[3] = &unk_26503F8F0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void __49__HDSDeviceOperationHomeKitSetup__restoreHomeApp__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 90
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30 {
         && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  }
  {
    id v2 = [*(id *)(a1 + 40) bundleID];
    LogPrintF();
  }
}

- (void)_timeoutForAccessorySync
{
  dispatch_time_t v3 = dispatch_time(0, 30000000000);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__HDSDeviceOperationHomeKitSetup__timeoutForAccessorySync__block_invoke;
  block[3] = &unk_26503F6A8;
  void block[4] = self;
  dispatch_after(v3, dispatchQueue, block);
}

uint64_t __58__HDSDeviceOperationHomeKitSetup__timeoutForAccessorySync__block_invoke(uint64_t result)
{
  if (*(void *)(*(void *)(result + 32) + 184))
  {
    uint64_t v1 = result;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(unsigned char *)(*(void *)(v1 + 32) + 192) = 1;
    uint64_t v2 = *(void *)(v1 + 32);
    dispatch_time_t v3 = *(void **)(v2 + 184);
    *(void *)(v2 + 184) = 0;

    *(_DWORD *)(*(void *)(v1 + 32) + 48) = 23;
    id v4 = *(void **)(v1 + 32);
    return [v4 _run];
  }
  return result;
}

- (void)_updateHomeStats
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  dispatch_time_t v3 = [(HMHome *)self->_homeKitSelectedHome accessories];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v16 + 1) + 8 * i) category];
        id v9 = [v8 categoryType];
        unint64_t v10 = getHMAccessoryCategoryTypeHomePod();
        int v11 = [v9 isEqual:v10];

        if (v11)
        {
          self->_hasHomePod = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    if (self->_hasHomePod) {
      uint64_t v12 = "yes";
    }
    else {
      uint64_t v12 = "no";
    }
    uint64_t v15 = v12;
    LogPrintF();
  }
  uint64_t v13 = [(HMHome *)self->_homeKitSelectedHome users];
  uint64_t v14 = [v13 count];

  self->_hasMultipleUsers = v14 != 0;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_updateAccount
{
  dispatch_time_t v3 = [(HMAccessory *)self->_homeKitAccessory remoteLoginHandler];
  if (v3)
  {
    uint64_t v4 = self->_iTunesAccount;
    if (v4)
    {
      if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
        && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
      {
        uint64_t v5 = [(ACAccount *)v4 username];
        LogPrintF();
      }
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __48__HDSDeviceOperationHomeKitSetup__updateAccount__block_invoke;
      v6[3] = &unk_26503F7E0;
      id v7 = v4;
      id v8 = v3;
      [v8 updateLoggedInAccount:v7 completionHandler:v6];
    }
    else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30 {
           && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    }
    {
      LogPrintF();
    }
  }
  else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 90 {
         && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

uint64_t __48__HDSDeviceOperationHomeKitSetup__updateAccount__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 90)
    {
      id v9 = v3;
      if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1
        || (id v3 = (id)_LogCategory_Initialize(), v4 = v9, v3))
      {
        uint64_t v5 = [*(id *)(a1 + 32) username];
        LogPrintF();
LABEL_8:

        id v4 = v9;
      }
    }
  }
  else if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30)
  {
    id v9 = 0;
    if (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || (id v3 = (id)_LogCategory_Initialize(), v4 = 0, v3))
    {
      uint64_t v5 = [*(id *)(a1 + 32) username];
      uint64_t v6 = [*(id *)(a1 + 40) loggedInAccount];
      id v8 = [v6 username];
      LogPrintF();

      goto LABEL_8;
    }
  }
  return MEMORY[0x270F9A758](v3, v4);
}

- (void)accessory:(id)a3 didUpdateLoggedInAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
    && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_homePodsAccessorySyncing)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__HDSDeviceOperationHomeKitSetup_accessory_didUpdateLoggedInAccount___block_invoke;
    block[3] = &unk_26503F8F0;
    void block[4] = self;
    id v10 = v6;
    dispatch_async(dispatchQueue, block);
  }
}

void __69__HDSDeviceOperationHomeKitSetup_accessory_didUpdateLoggedInAccount___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 184);
  id v3 = [*(id *)(a1 + 40) uniqueIdentifier];
  id v4 = [v3 UUIDString];
  id v11 = [v2 objectForKeyedSubscript:v4];

  if (v11)
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      id v10 = v11;
      LogPrintF();
    }
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 184);
    id v6 = objc_msgSend(v11, "uniqueIdentifier", v10);
    id v7 = [v6 UUIDString];
    [v5 removeObjectForKey:v7];
  }
  if (![*(id *)(*(void *)(a1 + 32) + 184) count])
  {
    if (gLogCategory_HDSDeviceOperationHomeKitSetup <= 30
      && (gLogCategory_HDSDeviceOperationHomeKitSetup != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 184);
    *(void *)(v8 + 184) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 192) = 1;
    *(_DWORD *)(*(void *)(a1 + 32) + 48) = 23;
    [*(id *)(a1 + 32) _run];
  }
}

- (NSDictionary)appDataSelf
{
  return self->_appDataSelf;
}

- (void)setAppDataSelf:(id)a3
{
}

- (HMAccessory)tvAudioInput
{
  return self->_tvAudioInput;
}

- (void)setTvAudioInput:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)userInteractive
{
  return self->_userInteractive;
}

- (void)setUserInteractive:(BOOL)a3
{
  self->_userInteractive = a3;
}

- (BOOL)hasHomePod
{
  return self->_hasHomePod;
}

- (BOOL)hasMultipleUsers
{
  return self->_hasMultipleUsers;
}

- (BOOL)homeKitAddedAccessory
{
  return self->_homeKitAddedAccessory;
}

- (HMHomeManager)homeKitHomeManager
{
  return self->_homeKitHomeManager;
}

- (BOOL)homeKitHomeManagerReady
{
  return self->_homeKitHomeManagerReady;
}

- (HMHome)homeKitSelectedHome
{
  return self->_homeKitSelectedHome;
}

- (NSString)homeKitSelectedRoomName
{
  return self->_homeKitSelectedRoomName;
}

- (NSString)iTunesAccountID
{
  return self->_iTunesAccountID;
}

- (void)setITunesAccountID:(id)a3
{
}

- (ACAccount)iTunesAccount
{
  return self->_iTunesAccount;
}

- (void)setITunesAccount:(id)a3
{
}

- (BOOL)keyExchangeOnly
{
  return self->_keyExchangeOnly;
}

- (void)setKeyExchangeOnly:(BOOL)a3
{
  self->_keyExchangeOnly = a3;
}

- (double)metricNonUserSeconds
{
  return self->_metricNonUserSeconds;
}

- (double)metricUserSeconds
{
  return self->_metricUserSeconds;
}

- (double)setupDeviceNonUserSeconds
{
  return self->_setupDeviceNonUserSeconds;
}

- (double)addDeviceNonUserSeconds
{
  return self->_addDeviceNonUserSeconds;
}

- (double)assignRoomNonUserSeconds
{
  return self->_assignRoomNonUserSeconds;
}

- (double)personalRequestsNonUserSeconds
{
  return self->_personalRequestsNonUserSeconds;
}

- (double)ulhNonUserSeconds
{
  return self->_ulhNonUserSeconds;
}

- (double)homekitDataSyncSeconds
{
  return self->_homekitDataSyncSeconds;
}

- (double)stereoPairSeconds
{
  return self->_stereoPairSeconds;
}

- (double)accessorySyncSeconds
{
  return self->_accessorySyncSeconds;
}

- (CUPairedPeer)pairedPeer
{
  return self->_pairedPeer;
}

- (void)setPairedPeer:(id)a3
{
}

- (BOOL)pauseAfterUserInput
{
  return self->_pauseAfterUserInput;
}

- (void)setPauseAfterUserInput:(BOOL)a3
{
  self->_pauseAfterUserInput = a3;
}

- (id)pauseHandler
{
  return self->_pauseHandler;
}

- (void)setPauseHandler:(id)a3
{
}

- (BOOL)personalRequestsEnabled
{
  return self->_personalRequestsEnabled;
}

- (void)setPersonalRequestsEnabled:(BOOL)a3
{
  self->_personalRequestsEnabled = a3;
}

- (id)promptForHomeHandler
{
  return self->_promptForHomeHandler;
}

- (void)setPromptForHomeHandler:(id)a3
{
}

- (id)promptForRoomHandler
{
  return self->_promptForRoomHandler;
}

- (void)setPromptForRoomHandler:(id)a3
{
}

- (id)promptForRoomHandlerDetailed
{
  return self->_promptForRoomHandlerDetailed;
}

- (void)setPromptForRoomHandlerDetailed:(id)a3
{
}

- (id)promptToInstallHomeAppHandler
{
  return self->_promptToInstallHomeAppHandler;
}

- (void)setPromptToInstallHomeAppHandler:(id)a3
{
}

- (HMAccessory)stereoCounterpart
{
  return self->_stereoCounterpart;
}

- (void)setStereoCounterpart:(id)a3
{
}

- (NSArray)psgHomePods
{
  return self->_psgHomePods;
}

- (void)setPsgHomePods:(id)a3
{
}

- (NSArray)psgStereoPairs
{
  return self->_psgStereoPairs;
}

- (void)setPsgStereoPairs:(id)a3
{
}

- (HMMediaGroup)existingMediaGroup
{
  return self->_existingMediaGroup;
}

- (void)setExistingMediaGroup:(id)a3
{
}

- (int)stereoRole
{
  return self->_stereoRole;
}

- (void)setStereoRole:(int)a3
{
  self->_int stereoRole = a3;
}

- (TRSession)trSession
{
  return self->_trSession;
}

- (void)setTrSession:(id)a3
{
}

- (double)timeoutInSeconds
{
  return self->_timeoutInSeconds;
}

- (void)setTimeoutInSeconds:(double)a3
{
  self->_timeoutInSeconds = a3;
}

- (double)odeonSeconds
{
  return self->_odeonSeconds;
}

- (void)setOdeonSeconds:(double)a3
{
  self->_odeonSeconds = a3;
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSUUID)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_existingMediaGroup, 0);
  objc_storeStrong((id *)&self->_psgStereoPairs, 0);
  objc_storeStrong((id *)&self->_psgHomePods, 0);
  objc_storeStrong((id *)&self->_stereoCounterpart, 0);
  objc_storeStrong(&self->_promptToInstallHomeAppHandler, 0);
  objc_storeStrong(&self->_promptForRoomHandlerDetailed, 0);
  objc_storeStrong(&self->_promptForRoomHandler, 0);
  objc_storeStrong(&self->_promptForHomeHandler, 0);
  objc_storeStrong(&self->_pauseHandler, 0);
  objc_storeStrong((id *)&self->_pairedPeer, 0);
  objc_storeStrong((id *)&self->_iTunesAccount, 0);
  objc_storeStrong((id *)&self->_iTunesAccountID, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedRoomName, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedHome, 0);
  objc_storeStrong((id *)&self->_homeKitHomeManager, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_tvAudioInput, 0);
  objc_storeStrong((id *)&self->_appDataSelf, 0);
  objc_storeStrong((id *)&self->_homePodsAccessorySyncing, 0);
  objc_storeStrong((id *)&self->_hdsutilHKToken, 0);
  objc_storeStrong((id *)&self->_homeKitMediaSystem, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedRoom, 0);
  objc_storeStrong((id *)&self->_homeKitAccessory, 0);
  objc_storeStrong((id *)&self->_homeKitDeviceSetupOperation, 0);
  objc_storeStrong((id *)&self->_homeKitBrowser, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end