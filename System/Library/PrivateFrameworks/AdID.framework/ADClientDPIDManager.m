@interface ADClientDPIDManager
+ (id)DPIDOperationTypeToString:(unint64_t)a3;
+ (id)sharedInstance;
- (ADClientDPIDManager)init;
- (BOOL)canContinueProcessing:(id)a3;
- (BOOL)canGenerateDPID;
- (BOOL)devicePersonalizedAdsEnabled;
- (BOOL)iCloudAccountSubscribed;
- (BOOL)isLoggedIntoiTunes;
- (BOOL)isPrivateContainerSecure;
- (BOOL)isRestrictedByApple;
- (BOOL)isTest;
- (BOOL)sandboxEnvironment;
- (BOOL)shouldSyncDPID;
- (BOOL)supportsDeviceToDeviceEncryption;
- (BOOL)updateInProgress;
- (CKContainer)privateContainer;
- (CKRecordID)recordID;
- (CKRecordID)recordIDLegacy;
- (CKRecordZoneID)zoneID;
- (NSDate)dpidReconcileStartDate;
- (NSMutableArray)operationsInProgress;
- (NSString)DPID;
- (id)conformDPIDToUseWithRecord:(id)a3 legacyRecord:(id)a4;
- (id)containerWithIDString:(id)a3;
- (id)generateDPID;
- (id)insecureContainer;
- (id)operationQueueLog;
- (id)primaryiCloudAccountAltDSID;
- (id)secureContainer;
- (id)subscriptionIdentifier;
- (int64_t)qualityOfService;
- (unint64_t)dpidReconcileState;
- (unint64_t)primaryiCloudAccountSecurityLevel;
- (void)backupFlowForCloudKitWorkAtTime:(id)a3 with:(id)a4;
- (void)continueReconcileWithAccountStatus:(int64_t)a3 andError:(id)a4 with:(id)a5;
- (void)createErrorForPrivateDB:(id)a3 completionHandler:(id)a4;
- (void)fetchDPIDfromiCloud:(id)a3;
- (void)finishOperation:(unint64_t)a3;
- (void)handleCloudKitError:(id)a3;
- (void)handlePushNotification:(id)a3 completionHandler:(id)a4;
- (void)reconcileDPID:(id)a3;
- (void)removeDPIDfromiCloud:(id)a3;
- (void)resetDPID:(id)a3;
- (void)resetEncryptedZone:(id)a3;
- (void)resolveAccountVsStoredManateeState:(int64_t)a3 andError:(id)a4 with:(id)a5;
- (void)retryIfNeeded:(id)a3;
- (void)saveDPIDtoiCloud:(id)a3 completionHandler:(id)a4;
- (void)setDPID:(id)a3;
- (void)setDpidReconcileStartDate:(id)a3;
- (void)setDpidReconcileState:(unint64_t)a3;
- (void)setIsDPIDLocalTo:(BOOL)a3;
- (void)setIsPrivateContainerSecure:(BOOL)a3;
- (void)setOperationsInProgress:(id)a3;
- (void)setPrivateContainer:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRecordID:(id)a3;
- (void)setRecordIDLegacy:(id)a3;
- (void)setSandboxEnvironment:(BOOL)a3;
- (void)setSupportsDeviceToDeviceEncryption:(BOOL)a3;
- (void)setUpdateInProgress:(BOOL)a3;
- (void)setZoneID:(id)a3;
- (void)setiCloudAccountSubscribed:(BOOL)a3;
- (void)setupLocalDPID;
- (void)setupiCloudSubscription:(id)a3;
- (void)startOperation:(unint64_t)a3;
- (void)syncDPIDWithiCloud:(id)a3;
- (void)teardowniCloudSubscription:(id)a3;
- (void)updateActiveRecordICloudDSID;
- (void)writeDPIDtoKeychain;
@end

@implementation ADClientDPIDManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __37__ADClientDPIDManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(ADClientDPIDManager);

  return MEMORY[0x270F9A758]();
}

+ (id)DPIDOperationTypeToString:(unint64_t)a3
{
  if (a3 < 0xA) {
    return off_264669B38[a3];
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF488] format:@"Unexpected DPIDOperationType."];
  return 0;
}

- (ADClientDPIDManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)ADClientDPIDManager;
  v2 = [(ADClientDPIDManager *)&v22 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *MEMORY[0x263EFD478];
    v5 = [MEMORY[0x263F08A48] mainQueue];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __27__ADClientDPIDManager_init__block_invoke;
    v20[3] = &unk_2646696E8;
    v6 = v2;
    v21 = v6;
    id v7 = (id)[v3 addObserverForName:v4 object:0 queue:v5 usingBlock:v20];

    [(ADClientDPIDManager *)v6 setSandboxEnvironment:0];
    id v8 = objc_alloc(MEMORY[0x263EFD808]);
    v9 = (void *)[v8 initWithZoneName:@"DPIDZone" ownerName:*MEMORY[0x263EFD488]];
    [(ADClientDPIDManager *)v6 setZoneID:v9];

    id v10 = objc_alloc(MEMORY[0x263EFD7E8]);
    v11 = [(ADClientDPIDManager *)v6 zoneID];
    v12 = (void *)[v10 initWithRecordName:@"DPIDRecordID" zoneID:v11];
    [(ADClientDPIDManager *)v6 setRecordIDLegacy:v12];

    id v13 = objc_alloc(MEMORY[0x263EFD7E8]);
    v14 = [(ADClientDPIDManager *)v6 zoneID];
    v15 = (void *)[v13 initWithRecordName:@"DPIDRecordIDForATP" zoneID:v14];
    [(ADClientDPIDManager *)v6 setRecordID:v15];

    id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(ADClientDPIDManager *)v6 setOperationsInProgress:v16];

    [(ADClientDPIDManager *)v6 setQualityOfService:17];
    [(ADClientDPIDManager *)v6 setDpidReconcileState:0];
    [(ADClientDPIDManager *)v6 setDpidReconcileStartDate:0];
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.ap.adprivacyd.DPIDBackupFlow", 0);
    backupFlowQueue = v6->_backupFlowQueue;
    v6->_backupFlowQueue = (OS_dispatch_queue *)v17;
  }
  return v2;
}

void __27__ADClientDPIDManager_init__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F24230] workQueue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __27__ADClientDPIDManager_init__block_invoke_2;
  v3[3] = &unk_2646696C0;
  id v4 = *(id *)(a1 + 32);
  [v2 addOperationWithBlock:v3];
}

void __27__ADClientDPIDManager_init__block_invoke_2(uint64_t a1)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = [*(id *)(a1 + 32) secureContainer];
  v2 = (void *)v7[5];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __27__ADClientDPIDManager_init__block_invoke_36;
  v3[3] = &unk_264669698;
  id v4 = *(id *)(a1 + 32);
  v5 = &v6;
  [v2 accountInfoWithCompletionHandler:v3];

  _Block_object_dispose(&v6, 8);
}

void __27__ADClientDPIDManager_init__block_invoke_36(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263F24230] workQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __27__ADClientDPIDManager_init__block_invoke_2_37;
  v12[3] = &unk_264669670;
  id v13 = v6;
  id v14 = *(id *)(a1 + 32);
  id v15 = v5;
  id v8 = v5;
  id v9 = v6;
  [v7 addOperationWithBlock:v12];

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

uint64_t __27__ADClientDPIDManager_init__block_invoke_2_37(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [NSString stringWithFormat:@"[%@] ERROR: There was an error getting the account info of the user: %@", objc_opt_class(), *(void *)(a1 + 32)];
    _ADLog();
  }
  int v3 = [*(id *)(a1 + 48) supportsDeviceToDeviceEncryption];
  uint64_t result = [*(id *)(a1 + 40) supportsDeviceToDeviceEncryption];
  if (v3 != result)
  {
    id v5 = NSString;
    uint64_t v6 = objc_opt_class();
    int v7 = [*(id *)(a1 + 40) supportsDeviceToDeviceEncryption];
    id v8 = @"No";
    if (v7) {
      id v9 = @"Yes";
    }
    else {
      id v9 = @"No";
    }
    if (v3) {
      id v8 = @"Yes";
    }
    uint64_t v10 = [v5 stringWithFormat:@"[%@] Resetting the local container due to Manatee state change from %@ to %@", v6, v9, v8];
    _ADLog();

    id v11 = *(void **)(a1 + 40);
    return [v11 setPrivateContainer:0];
  }
  return result;
}

- (void)updateActiveRecordICloudDSID
{
  v2 = [MEMORY[0x263F241D8] sharedInstance];
  int v3 = [v2 activeDSIDRecord];
  id v11 = [v3 iCloudDSID];

  id v4 = [MEMORY[0x263F241C0] sharedInstance];
  id v5 = [v4 iCloudDSID];

  if (([v11 isEqualToString:v5] & 1) == 0)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Changing the record's iCloud Identifier: %@ => %@", v11, v5];
    _ADLog();

    int v7 = [MEMORY[0x263F241C0] sharedInstance];
    id v8 = [v7 iCloudDSID];
    id v9 = [MEMORY[0x263F241D8] sharedInstance];
    uint64_t v10 = [v9 activeDSIDRecord];
    [v10 setICloudDSID:v8];
  }
}

- (BOOL)canContinueProcessing:(id)a3
{
  id v4 = a3;
  if ([(ADClientDPIDManager *)self dpidReconcileState] == 1)
  {
    id v5 = [(ADClientDPIDManager *)self dpidReconcileStartDate];
    BOOL v6 = v5 == v4;
  }
  else
  {
    BOOL v6 = 0;
  }
  int v7 = NSString;
  unint64_t v8 = [(ADClientDPIDManager *)self dpidReconcileState];
  id v9 = objc_msgSend(v4, "AD_doubleDateTimeAsString");
  uint64_t v10 = [(ADClientDPIDManager *)self dpidReconcileStartDate];
  uint64_t v11 = objc_msgSend(v10, "AD_doubleDateTimeAsString");
  v12 = (void *)v11;
  id v13 = @"Wont";
  if (v6) {
    id v13 = @"Will";
  }
  id v14 = [v7 stringWithFormat:@"DPID Reconcile state is %lu. Caller started at %@. Current flow started at %@. %@ continue.", v8, v9, v11, v13];
  _ADLog();

  return v6;
}

- (void)reconcileDPID:(id)a3
{
  v47[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [NSString stringWithFormat:@"Starting DPID Reconcile."];
  _ADLog();

  if ([(ADClientDPIDManager *)self dpidReconcileState]) {
    -[ADClientDPIDManager reconcileDPID:](self);
  }
  [(ADClientDPIDManager *)self startOperation:0];
  BOOL v6 = [MEMORY[0x263F241D8] sharedInstance];
  int v7 = [v6 idForClientType:5];
  DPID = self->_DPID;
  self->_DPID = v7;

  if ([(ADClientDPIDManager *)self isRestrictedByApple])
  {
    id v9 = [MEMORY[0x263F24230] workQueue];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke;
    v44[3] = &unk_264669710;
    v44[4] = self;
    id v45 = v4;
    [v9 addOperationWithBlock:v44];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263F241D8] sharedInstance];
    uint64_t v11 = [(id)v10 activeDSIDRecord];

    LODWORD(v10) = [v11 isDPIDLocal];
    v12 = objc_msgSend(NSString, "stringWithFormat:", @"isDPIDLocal flag is %d", v10);
    _ADLog();

    if ((v10 & 1) == 0)
    {
      [(ADClientDPIDManager *)self setDPID:0];
      [(ADClientDPIDManager *)self setupLocalDPID];
    }
    id v13 = [MEMORY[0x263F241B8] sharedInstance];
    [v13 setInteger:1 forKey:@"CKDPIDSyncState"];

    id v14 = [NSString stringWithFormat:@"We need to sync with iCloud"];
    _ADLog();

    if ([(ADClientDPIDManager *)self shouldSyncDPID])
    {
      id v15 = [(ADClientDPIDManager *)self secureContainer];
      objc_storeStrong((id *)&self->_privateContainer, v15);
      if (v15)
      {
        id v16 = [NSString stringWithFormat:@"DPID reconcile with iCloud"];
        _ADLog();

        dispatch_queue_t v17 = [MEMORY[0x263EFF910] date];
        self->_dpidReconcileState = 1;
        objc_storeStrong((id *)&self->_dpidReconcileStartDate, v17);
        v18 = [NSString stringWithFormat:@"Creating the backup DPID flow."];
        _ADLog();

        dispatch_time_t v19 = dispatch_time(0, 120000000000);
        backupFlowQueue = self->_backupFlowQueue;
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_4;
        block[3] = &unk_264669760;
        block[4] = self;
        id v21 = v17;
        id v37 = v21;
        id v22 = v4;
        id v38 = v22;
        dispatch_after(v19, backupFlowQueue, block);
        v23 = [NSString stringWithFormat:@"Starting to wait for the account status."];
        _ADLog();

        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_5;
        v32[3] = &unk_264669800;
        id v33 = v21;
        v34 = self;
        id v35 = v22;
        id v24 = v21;
        [v15 accountInfoWithCompletionHandler:v32];

        v25 = v37;
      }
      else
      {
        v27 = (void *)MEMORY[0x263F087E8];
        uint64_t v28 = *MEMORY[0x263F24138];
        uint64_t v46 = *MEMORY[0x263F08320];
        v47[0] = @"DPID reconcile: Couldn't create CKContainer";
        v29 = [NSDictionary dictionaryWithObjects:v47 forKeys:&v46 count:1];
        v30 = [v27 errorWithDomain:v28 code:9 userInfo:v29];

        [(ADClientDPIDManager *)self finishOperation:0];
        v31 = [MEMORY[0x263F24230] workQueue];
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_3;
        v39[3] = &unk_264669738;
        id v40 = v30;
        id v41 = v4;
        id v24 = v30;
        [v31 addOperationWithBlock:v39];

        v25 = v41;
      }
    }
    else
    {
      v26 = [MEMORY[0x263F24230] workQueue];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_2;
      v42[3] = &unk_264669710;
      v42[4] = self;
      id v43 = v4;
      [v26 addOperationWithBlock:v42];
    }
  }
}

uint64_t __37__ADClientDPIDManager_reconcileDPID___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) finishOperation:0];
  [*(id *)(a1 + 32) updateActiveRecordICloudDSID];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __37__ADClientDPIDManager_reconcileDPID___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) finishOperation:0];
  [*(id *)(a1 + 32) updateActiveRecordICloudDSID];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __37__ADClientDPIDManager_reconcileDPID___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

uint64_t __37__ADClientDPIDManager_reconcileDPID___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) backupFlowForCloudKitWorkAtTime:*(void *)(a1 + 40) with:*(void *)(a1 + 48)];
}

void __37__ADClientDPIDManager_reconcileDPID___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [MEMORY[0x263F24230] workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_6;
  v11[3] = &unk_2646697D8;
  id v12 = v5;
  id v13 = *(id *)(a1 + 32);
  id v14 = v6;
  unint64_t v8 = *(void **)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = v8;
  id v9 = v6;
  id v10 = v5;
  [v7 addOperationWithBlock:v11];
}

void __37__ADClientDPIDManager_reconcileDPID___block_invoke_6(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountStatus];
  int v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSinceDate:*(void *)(a1 + 40)];
  uint64_t v5 = v4;
  id v6 = NSString;
  int v7 = objc_msgSend(*(id *)(a1 + 40), "AD_doubleDateTimeAsString");
  unint64_t v8 = [v6 stringWithFormat:@"DPID reconcile (started at %@): accountStatusWithCompletionHandler called after %f seconds: accountStatus %ld, error %@", v7, v5, v2, *(void *)(a1 + 48)];
  _ADLog();

  int v9 = [*(id *)(a1 + 56) canContinueProcessing:*(void *)(a1 + 40)];
  id v10 = *(void **)(a1 + 56);
  if (v9)
  {
    [v10 setDpidReconcileState:2];
    objc_msgSend(*(id *)(a1 + 56), "setSupportsDeviceToDeviceEncryption:", objc_msgSend(*(id *)(a1 + 32), "supportsDeviceToDeviceEncryption"));
    if (([*(id *)(a1 + 56) supportsDeviceToDeviceEncryption] & 1) != 0 && !*(void *)(a1 + 48))
    {
      id v21 = objc_msgSend(NSString, "stringWithFormat:", @"privateContainer matched what we needed. isPrivateContainerSecure is %d", *(unsigned __int8 *)(*(void *)(a1 + 56) + 17));
      _ADLog();

      [*(id *)(a1 + 56) resolveAccountVsStoredManateeState:v2 andError:*(void *)(a1 + 48) with:*(void *)(a1 + 64)];
    }
    else
    {
      uint64_t v11 = NSString;
      int v12 = [*(id *)(a1 + 56) supportsDeviceToDeviceEncryption];
      id v13 = @"No";
      if (v12) {
        id v13 = @"Yes";
      }
      id v14 = [v11 stringWithFormat:@"Falling back to insecure container due to manatee available (%@) or error: %@", v13, *(void *)(a1 + 48)];
      _ADLog();

      uint64_t v15 = [*(id *)(a1 + 56) insecureContainer];
      uint64_t v16 = *(void *)(a1 + 56);
      dispatch_queue_t v17 = *(void **)(v16 + 64);
      *(void *)(v16 + 64) = v15;

      uint64_t v18 = *(void *)(a1 + 56);
      dispatch_time_t v19 = *(void **)(v18 + 64);
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_7;
      v22[3] = &unk_2646697B0;
      v22[4] = v18;
      id v23 = *(id *)(a1 + 64);
      [v19 accountInfoWithCompletionHandler:v22];
    }
  }
  else
  {
    if ([v10 dpidReconcileState] == 2) {
      [NSString stringWithFormat:@"The fallback flow is actively being run right now. Maybe we should extend the delay?"];
    }
    else {
    v20 = [NSString stringWithFormat:@"The DPID manager was not able to find the CloudKit Account Status in time. An error has already been propagated."];
    }
    _ADLog();
  }
}

void __37__ADClientDPIDManager_reconcileDPID___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = [MEMORY[0x263F24230] workQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37__ADClientDPIDManager_reconcileDPID___block_invoke_8;
  v12[3] = &unk_264669788;
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  [v7 addOperationWithBlock:v12];
}

uint64_t __37__ADClientDPIDManager_reconcileDPID___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountStatus];
  int v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);

  return [v3 resolveAccountVsStoredManateeState:v2 andError:v4 with:v5];
}

- (void)resolveAccountVsStoredManateeState:(int64_t)a3 andError:(id)a4 with:(id)a5
{
  id v25 = a4;
  id v8 = a5;
  if (self->_isPrivateContainerSecure) {
    int v9 = @"Container is secure.";
  }
  else {
    int v9 = @"Container is NOT secure.";
  }
  id v10 = [NSString stringWithFormat:v9];
  _ADLog();

  id v11 = [MEMORY[0x263F241D8] sharedInstance];
  int v12 = [v11 activeDSIDRecord];

  int v13 = [v12 isDPIDManatee];
  if (v13) {
    uint64_t v14 = @"DPID was previously stored as Manatee.";
  }
  else {
    uint64_t v14 = @"DPID was not previously stored as Manatee.";
  }
  id v15 = [NSString stringWithFormat:v14];
  _ADLog();

  if (self->_isPrivateContainerSecure == v13)
  {
    id v16 = [NSString stringWithFormat:@"Container type matches DPID type."];
    _ADLog();

    dispatch_queue_t v17 = [MEMORY[0x263F241D8] sharedInstance];
    uint64_t v18 = [v17 idForClientType:5];
    DPID = self->_DPID;
    self->_DPID = v18;
  }
  else
  {
    [(ADClientDPIDManager *)self setDPID:0];
    v20 = [NSString stringWithFormat:@"Container type does not match DPID type. Creating a new DPID locally"];
    _ADLog();

    [(ADClientDPIDManager *)self setupLocalDPID];
  }
  id v21 = NSString;
  BOOL v22 = [(ADClientDPIDManager *)self supportsDeviceToDeviceEncryption];
  id v23 = @"NO";
  if (v22) {
    id v23 = @"YES";
  }
  id v24 = [v21 stringWithFormat:@"iCloud container supportsDeviceToDeviceEncryption: %@", v23];
  _ADLog();

  [(ADClientDPIDManager *)self continueReconcileWithAccountStatus:a3 andError:v25 with:v8];
}

- (void)backupFlowForCloudKitWorkAtTime:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263F24230] workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__ADClientDPIDManager_backupFlowForCloudKitWorkAtTime_with___block_invoke;
  v11[3] = &unk_264669760;
  id v12 = v6;
  int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

void __60__ADClientDPIDManager_backupFlowForCloudKitWorkAtTime_with___block_invoke(uint64_t a1)
{
  uint64_t v2 = NSString;
  int v3 = objc_msgSend(*(id *)(a1 + 32), "AD_doubleDateTimeAsString");
  uint64_t v4 = [v2 stringWithFormat:@"The backup flow started at %@ has been fired. Checking to see if we need to run.", v3];
  _ADLog();

  if ([*(id *)(a1 + 40) canContinueProcessing:*(void *)(a1 + 32)])
  {
    uint64_t v5 = [NSString stringWithFormat:@"We are still waiting for the iCloud Account Status. Continue with backup flow and provide an error so the DPID can be resolved later."];
    _ADLog();

    [*(id *)(a1 + 40) setDpidReconcileState:2];
    id v6 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithAdCode:9 andDescription:@"Something went wrong while attempting to get the iCloud Account Status."];
    objc_msgSend(*(id *)(a1 + 40), "continueReconcileWithAccountStatus:andError:with:", 0);
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"We are no longer waiting for the account status (%lu).", objc_msgSend(*(id *)(a1 + 40), "dpidReconcileState"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    _ADLog();
  }
}

- (void)continueReconcileWithAccountStatus:(int64_t)a3 andError:(id)a4 with:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  if (a3 != 1 || v8)
  {
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"DPID reconcile - iCloud account not available accountStatus %ld", a3);
    _ADLog();

    [(ADClientDPIDManager *)self setupLocalDPID];
    [(ADClientDPIDManager *)self setDpidReconcileState:0];
    if (!v8) {
      [(ADClientDPIDManager *)self updateActiveRecordICloudDSID];
    }
    [(ADClientDPIDManager *)self finishOperation:0];
    int v13 = [NSString stringWithFormat:@"Done reconciling the DPID."];
    _ADLog();

    if (v9) {
      v9[2](v9, v8);
    }
  }
  else
  {
    if ([(ADClientDPIDManager *)self iCloudAccountSubscribed])
    {
      id v10 = [NSString stringWithFormat:@"DPID reconcile - iCloud account already subscribed for push notifications. "];
      _ADLog();

      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __72__ADClientDPIDManager_continueReconcileWithAccountStatus_andError_with___block_invoke_3;
      v16[3] = &unk_264669828;
      v16[4] = self;
      id v11 = (id *)&v17;
      dispatch_queue_t v17 = v9;
      [(ADClientDPIDManager *)self retryIfNeeded:v16];
    }
    else
    {
      id v14 = [NSString stringWithFormat:@"DPID reconcile - iCloud account not subscribed for push notifications. "];
      _ADLog();

      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __72__ADClientDPIDManager_continueReconcileWithAccountStatus_andError_with___block_invoke;
      v18[3] = &unk_264669828;
      v18[4] = self;
      id v11 = (id *)&v19;
      dispatch_time_t v19 = v9;
      [(ADClientDPIDManager *)self setupiCloudSubscription:v18];
    }

    [(ADClientDPIDManager *)self finishOperation:0];
    id v15 = [NSString stringWithFormat:@"Done reconciling the DPID."];
    _ADLog();
  }
}

void __72__ADClientDPIDManager_continueReconcileWithAccountStatus_andError_with___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    [*(id *)(a1 + 32) setDpidReconcileState:0];
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __72__ADClientDPIDManager_continueReconcileWithAccountStatus_andError_with___block_invoke_2;
    v6[3] = &unk_264669828;
    v6[4] = v4;
    id v7 = *(id *)(a1 + 40);
    [v4 syncDPIDWithiCloud:v6];
  }
}

uint64_t __72__ADClientDPIDManager_continueReconcileWithAccountStatus_andError_with___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    uint64_t v4 = [NSString stringWithFormat:@"DPID sync failed with error: %@", v3];
    _ADLog();
  }
  else
  {
    [*(id *)(a1 + 32) updateActiveRecordICloudDSID];
  }
  [*(id *)(a1 + 32) setDpidReconcileState:0];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __72__ADClientDPIDManager_continueReconcileWithAccountStatus_andError_with___block_invoke_3(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setDpidReconcileState:0];
  if (!v5) {
    [*(id *)(a1 + 32) updateActiveRecordICloudDSID];
  }
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }

  return MEMORY[0x270F9A758]();
}

- (void)handlePushNotification:(id)a3 completionHandler:(id)a4
{
  id v4 = a4;
  id v5 = [MEMORY[0x263F24230] workQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__ADClientDPIDManager_handlePushNotification_completionHandler___block_invoke;
  v7[3] = &unk_264669878;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

void __64__ADClientDPIDManager_handlePushNotification_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [NSString stringWithFormat:@"DPID handlePushNotification"];
  _ADLog();

  uint64_t v3 = [MEMORY[0x263F241D8] sharedInstance];
  [v3 prepareForPushNotification];

  id v4 = [MEMORY[0x263F241B8] sharedInstance];
  [v4 setInteger:2 forKey:@"CKDPIDSyncState"];

  id v5 = [MEMORY[0x263F241D8] sharedInstance];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__ADClientDPIDManager_handlePushNotification_completionHandler___block_invoke_2;
  v6[3] = &unk_264669850;
  id v7 = *(id *)(a1 + 32);
  [v5 reconcile:v6];
}

uint64_t __64__ADClientDPIDManager_handlePushNotification_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)resetDPID:(id)a3
{
  id v4 = a3;
  id v5 = [NSString stringWithFormat:@"DPID reset"];
  _ADLog();

  if ([(ADClientDPIDManager *)self canGenerateDPID])
  {
    id v6 = [NSString stringWithFormat:@"Resetting DPID Locally"];
    _ADLog();

    id v7 = [(ADClientDPIDManager *)self generateDPID];
    [(ADClientDPIDManager *)self setDPID:v7];

    [(ADClientDPIDManager *)self setIsDPIDLocalTo:1];
    if ([(ADClientDPIDManager *)self shouldSyncDPID])
    {
      id v8 = [(ADClientDPIDManager *)self DPID];
      [(ADClientDPIDManager *)self saveDPIDtoiCloud:v8 completionHandler:0];

      id v9 = [MEMORY[0x263F241B8] sharedInstance];
      [v9 setInteger:0 forKey:@"CKDPIDSyncState"];
      goto LABEL_9;
    }
    id v11 = NSString;
    id v12 = @"Not resetting DPID in iCloud";
  }
  else
  {
    id v10 = [NSString stringWithFormat:@"Removing DPID Locally"];
    _ADLog();

    [(ADClientDPIDManager *)self setDPID:0];
    [(ADClientDPIDManager *)self setIsDPIDLocalTo:0];
    if ([(ADClientDPIDManager *)self shouldSyncDPID])
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __33__ADClientDPIDManager_resetDPID___block_invoke;
      v13[3] = &unk_264669850;
      id v14 = v4;
      [(ADClientDPIDManager *)self removeDPIDfromiCloud:v13];

      goto LABEL_11;
    }
    id v11 = NSString;
    id v12 = @"Not removing DPID from iCloud";
  }
  id v9 = [v11 stringWithFormat:v12];
  _ADLog();
LABEL_9:

  if (v4) {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
LABEL_11:
}

uint64_t __33__ADClientDPIDManager_resetDPID___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setIsDPIDLocalTo:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [MEMORY[0x263F241D8] sharedInstance];
  id v5 = [v4 activeDSIDRecord];

  [v5 setIsDPIDLocal:v3];
}

- (BOOL)isLoggedIntoiTunes
{
  uint64_t v2 = [MEMORY[0x263F241D8] sharedInstance];
  BOOL v3 = [v2 activeDSIDRecord];

  id v4 = [v3 DSID];
  if (v4)
  {
    id v5 = [v3 DSID];
    int v6 = [v5 isEqualToString:@"0"] ^ 1;
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"isLoggedIntoiTunes: DSID is NULL"];
    _ADLog();
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)primaryiCloudAccountAltDSID
{
  uint64_t v2 = [MEMORY[0x263F241C0] sharedInstance];
  BOOL v3 = [v2 iCloudAccount];

  id v4 = [MEMORY[0x263F290F0] sharedInstance];
  id v5 = [v4 altDSIDForAccount:v3];
  int v6 = [NSString stringWithFormat:@"Primary account AltDSID %@", v5];
  _ADLog();

  return v5;
}

- (unint64_t)primaryiCloudAccountSecurityLevel
{
  uint64_t v2 = [(ADClientDPIDManager *)self primaryiCloudAccountAltDSID];
  if ([v2 length])
  {
    BOOL v3 = [MEMORY[0x263F290F0] sharedInstance];
    id v4 = [v3 authKitAccountWithAltDSID:v2];
    if (v4)
    {
      unint64_t v5 = [v3 securityLevelForAccount:v4];
    }
    else
    {
      int v6 = [NSString stringWithFormat:@"Could not get account for altDSID %@", v2];
      _ADLog();

      unint64_t v5 = 0;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isRestrictedByApple
{
  uint64_t v2 = [MEMORY[0x263F241D8] sharedInstance];
  BOOL v3 = [v2 activeDSIDRecord];

  LOBYTE(v2) = [v3 isRestrictedByApple];
  return (char)v2;
}

- (BOOL)devicePersonalizedAdsEnabled
{
  uint64_t v2 = [MEMORY[0x263F241C0] sharedInstance];
  char v3 = [v2 isPersonalizedAdsEnabled];

  return v3;
}

- (void)writeDPIDtoKeychain
{
  char v3 = [MEMORY[0x263F241D8] sharedInstance];
  id v4 = [v3 activeDSIDRecord];
  unint64_t v5 = [v4 DSID];

  if (v5)
  {
    int v23 = 0;
    int v6 = GetKeychainPropertyListForKey();
    if (!v6)
    {
      id v7 = [NSString stringWithFormat:@"No DPID record found in keychain, creating new entry"];
      _ADLog();

      int v6 = (void *)MEMORY[0x263EFFA78];
    }
    id v8 = (void *)[v6 mutableCopy];
    id v9 = [(ADClientDPIDManager *)self DPID];

    if (v9)
    {
      id v10 = [MEMORY[0x263F241D8] sharedInstance];
      id v11 = [MEMORY[0x263F241C8] initWithFlags:4];
      [v10 setReconcileOperations:v11];

      id v12 = [MEMORY[0x263EFF9A0] dictionary];
      int v13 = [(ADClientDPIDManager *)self DPID];
      [v12 setObject:v13 forKeyedSubscript:@"ADClientDPIDRecordKey"];

      [v8 setObject:v12 forKeyedSubscript:v5];
    }
    else
    {
      [v8 removeObjectForKey:v5];
    }
    id v22 = 0;
    id v14 = [MEMORY[0x263F08AC0] dataWithPropertyList:v8 format:200 options:0 error:&v22];
    id v15 = v22;
    id v16 = v15;
    if (v15)
    {
      dispatch_queue_t v17 = NSString;
      uint64_t v18 = [v15 code];
      dispatch_time_t v19 = [v16 userInfo];
      v20 = [v17 stringWithFormat:@"Error serializing property list. Error %lu.\n%@", v18, v19];
      _ADLog();
    }
    else
    {
      uint64_t v21 = ADWriteDataToKeychain();
      if (!v21)
      {
LABEL_12:

        goto LABEL_13;
      }
      dispatch_time_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"Error writing DPID to keychain: %d", v21);
      _ADLog();
    }

    goto LABEL_12;
  }
LABEL_13:
}

- (id)subscriptionIdentifier
{
  char v3 = [MEMORY[0x263F241C0] sharedInstance];
  id v4 = [v3 iCloudAccountIdentifier];

  if ([(ADClientDPIDManager *)self supportsDeviceToDeviceEncryption])
  {
    uint64_t v5 = [v4 stringByAppendingString:@"-secure"];

    id v4 = (void *)v5;
  }
  if ([(ADClientDPIDManager *)self sandboxEnvironment])
  {
    uint64_t v6 = [v4 stringByAppendingString:@"-sandbox"];

    id v4 = (void *)v6;
  }

  return v4;
}

- (BOOL)iCloudAccountSubscribed
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  char v3 = [(ADClientDPIDManager *)v2 subscriptionIdentifier];
  if (v3)
  {
    int v12 = 0;
    uint64_t v4 = ADCopyDataFromKeychain();
    uint64_t v5 = (void *)v4;
    if (!v4)
    {
      id v7 = [NSString stringWithFormat:@"No data to read from keychain for key %@.", @"ADClientiCloudSubscribedAccountsKey"];
      _ADLog();
      char v9 = 0;
LABEL_12:

      goto LABEL_13;
    }
    id v11 = 0;
    uint64_t v6 = [MEMORY[0x263F08AC0] propertyListWithData:v4 options:0 format:0 error:&v11];
    id v7 = v11;
    if (v7)
    {
      id v8 = [NSString stringWithFormat:@"Could not read from keychain for %@. Error %ld", @"ADClientiCloudSubscribedAccountsKey", v12];
      _ADLog();
    }
    else if (v6)
    {
      char v9 = [v6 containsObject:v3];
      goto LABEL_11;
    }
    char v9 = 0;
LABEL_11:

    goto LABEL_12;
  }
  char v9 = 0;
LABEL_13:

  objc_sync_exit(v2);
  return v9;
}

- (void)setiCloudAccountSubscribed:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [(ADClientDPIDManager *)v4 subscriptionIdentifier];
  if (v5)
  {
    int v23 = 0;
    uint64_t v6 = ADCopyDataFromKeychain();
    id v7 = (void *)v6;
    if (v6)
    {
      id v22 = 0;
      id v8 = [MEMORY[0x263F08AC0] propertyListWithData:v6 options:0 format:0 error:&v22];
      id v9 = v22;
      if (v9 || !v8) {
        id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      else {
        id v10 = (id)[v8 mutableCopy];
      }
      id v12 = v10;
      if (v3)
      {
        if (([v10 containsObject:v5] & 1) == 0) {
          [v12 addObject:v5];
        }
      }
      else
      {
        [v10 removeObject:v5];
      }
    }
    else
    {
      id v11 = [NSString stringWithFormat:@"Nothing previously stored in keychain for key %@", @"ADClientiCloudSubscribedAccountsKey"];
      _ADLog();

      id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    id v21 = 0;
    int v13 = [MEMORY[0x263F08AC0] dataWithPropertyList:v12 format:200 options:0 error:&v21];
    id v14 = v21;
    id v15 = v14;
    if (v14)
    {
      id v16 = NSString;
      uint64_t v17 = [v14 code];
      uint64_t v18 = [v15 userInfo];
      dispatch_time_t v19 = [v16 stringWithFormat:@"Error serializing property list. Error %lu.\n%@", v17, v18];
      _ADLog();
    }
    else
    {
      uint64_t v20 = ADWriteDataToKeychain();
      if (v20) {
        objc_msgSend(NSString, "stringWithFormat:", @"Error writing ADClientiCloudSubscribedAccountsKey to keychain: %d", v20);
      }
      else {
      uint64_t v18 = [NSString stringWithFormat:@"Added subscribed iCloud account to keychain"];
      }
      _ADLog();
    }
  }
  objc_sync_exit(v4);
}

- (id)operationQueueLog
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(ADClientDPIDManager *)self operationsInProgress];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = +[ADClientDPIDManager DPIDOperationTypeToString:](ADClientDPIDManager, "DPIDOperationTypeToString:", [*(id *)(*((void *)&v12 + 1) + 8 * i) integerValue]);
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = [v3 componentsJoinedByString:@", "];

  return v10;
}

- (void)startOperation:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v4 = [(ADClientDPIDManager *)obj operationsInProgress];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  [v4 addObject:v5];

  uint64_t v6 = NSString;
  uint64_t v7 = +[ADClientDPIDManager DPIDOperationTypeToString:a3];
  id v8 = [v6 stringWithFormat:@"startOperation: %@", v7];
  _ADLog();

  id v9 = NSString;
  id v10 = [(ADClientDPIDManager *)obj operationQueueLog];
  id v11 = [v9 stringWithFormat:@"    operationsInProgress: %@", v10];
  _ADLog();

  objc_sync_exit(obj);
}

- (void)finishOperation:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  uint64_t v4 = [(ADClientDPIDManager *)obj operationsInProgress];
  uint64_t v5 = [NSNumber numberWithUnsignedInteger:a3];
  char v6 = [v4 containsObject:v5];

  if (v6)
  {
    uint64_t v7 = [(ADClientDPIDManager *)obj operationsInProgress];
    id v8 = [NSNumber numberWithUnsignedInteger:a3];
    uint64_t v9 = [v7 indexOfObject:v8];

    id v10 = [(ADClientDPIDManager *)obj operationsInProgress];
    [v10 removeObjectAtIndex:v9];

    id v11 = NSString;
    long long v12 = +[ADClientDPIDManager DPIDOperationTypeToString:a3];
    long long v13 = [v11 stringWithFormat:@"finishOperation: %@", v12];
    _ADLog();

    long long v14 = NSString;
    long long v15 = [(ADClientDPIDManager *)obj operationQueueLog];
    [v14 stringWithFormat:@"    operationsInProgress: %@", v15];
  }
  else
  {
    uint64_t v17 = NSString;
    long long v15 = +[ADClientDPIDManager DPIDOperationTypeToString:a3];
    [v17 stringWithFormat:@"******** Attempt to remove operation that wasn't present %@", v15];
  id v16 = };
  _ADLog();

  objc_sync_exit(obj);
}

- (id)containerWithIDString:(id)a3
{
  if (self->_sandboxEnvironment) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  uint64_t v4 = (objc_class *)MEMORY[0x263EFD620];
  id v5 = a3;
  char v6 = (void *)[[v4 alloc] initWithContainerIdentifier:v5 environment:v3];

  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263EFD610]) initWithContainerID:v6];

  return v7;
}

- (id)secureContainer
{
  uint64_t v3 = [(ADClientDPIDManager *)self containerWithIDString:@"com.apple.iad-cloudkit-secure"];
  [v3 setSourceApplicationBundleIdentifier:*MEMORY[0x263F24160]];
  self->_isPrivateContainerSecure = 1;
  uint64_t v4 = [NSString stringWithFormat:@"Created secure privateContainer %@ %@. isPrivateContainerSecure is %d.", @"com.apple.iad-cloudkit-secure", v3, 1];
  _ADLog();

  return v3;
}

- (id)insecureContainer
{
  uint64_t v3 = [(ADClientDPIDManager *)self containerWithIDString:@"com.apple.iad-cloudkit"];
  [v3 setSourceApplicationBundleIdentifier:*MEMORY[0x263F24160]];
  self->_isPrivateContainerSecure = 0;
  objc_msgSend(NSString, "stringWithFormat:", @"Created insecure privateContainer %@ %@. isPrivateContainerSecure is %d;",
    @"com.apple.iad-cloudkit",
    v3,
  uint64_t v4 = 0);
  _ADLog();

  return v3;
}

- (void)setDPID:(id)a3
{
  id v10 = a3;
  if ((-[NSString isEqual:](self->_DPID, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_DPID, a3);
    id v5 = [NSString stringWithFormat:@"Setting DPID to %@.", self->_DPID];
    _ADLog();

    [(ADClientDPIDManager *)self writeDPIDtoKeychain];
    char v6 = [MEMORY[0x263F241D8] sharedInstance];
    uint64_t v7 = [v6 activeDSIDRecord];

    if (v10)
    {
      [v7 setID:v10 forClientType:5];
      if ([(ADClientDPIDManager *)self supportsDeviceToDeviceEncryption])
      {
        id v8 = v7;
        uint64_t v9 = 1;
      }
      else
      {
        id v8 = v7;
        uint64_t v9 = 0;
      }
      [v8 setIsDPIDManatee:v9];
    }
    else
    {
      [v7 removeIDForClientType:5];
    }
  }
}

- (void)setupLocalDPID
{
  uint64_t v3 = [NSString stringWithFormat:@"setupLocalDPID:"];
  _ADLog();

  BOOL v4 = [(ADClientDPIDManager *)self canGenerateDPID];
  id v5 = [(ADClientDPIDManager *)self DPID];
  char v6 = v5;
  if (!v4)
  {

    if (!v6)
    {
      id v16 = [NSString stringWithFormat:@"Keeping NULL DPID %@", self->_DPID];
      _ADLog();
      goto LABEL_10;
    }
    [(ADClientDPIDManager *)self setDPID:0];
    id v11 = [NSString stringWithFormat:@"Removing DPID locally."];
    _ADLog();

    [(ADClientDPIDManager *)self setIsDPIDLocalTo:0];
LABEL_8:
    id v16 = [MEMORY[0x263F241B8] sharedInstance];
    [v16 setInteger:1 forKey:@"CKDPIDSyncState"];
    goto LABEL_10;
  }

  if (!v6)
  {
    [(ADClientDPIDManager *)self setIsDPIDLocalTo:1];
    long long v12 = [(ADClientDPIDManager *)self generateDPID];
    [(ADClientDPIDManager *)self setDPID:v12];

    long long v13 = NSString;
    long long v14 = [(ADClientDPIDManager *)self DPID];
    long long v15 = [v13 stringWithFormat:@"Storing NEW DPID locally. %@.", v14];
    _ADLog();

    goto LABEL_8;
  }
  uint64_t v7 = [NSString stringWithFormat:@"DPID %@ Already exists, checking for isDPIDLocal flag", self->_DPID];
  _ADLog();

  uint64_t v8 = [MEMORY[0x263F241D8] sharedInstance];
  id v16 = [(id)v8 activeDSIDRecord];

  LODWORD(v8) = [v16 isDPIDLocal];
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"isDPIDLocal flag is %d", v8);
  _ADLog();

  if ((v8 & 1) == 0)
  {
    id v10 = [(ADClientDPIDManager *)self generateDPID];
    [(ADClientDPIDManager *)self setDPID:v10];

    [(ADClientDPIDManager *)self setIsDPIDLocalTo:1];
  }
LABEL_10:
}

- (id)generateDPID
{
  uint64_t v2 = [MEMORY[0x263F08C38] UUID];
  uint64_t v3 = [v2 UUIDString];
  BOOL v4 = [@"DPID-" stringByAppendingString:v3];

  return v4;
}

- (BOOL)shouldSyncDPID
{
  uint64_t v2 = [MEMORY[0x263F241C0] sharedInstance];
  uint64_t v3 = [v2 iCloudAccount];

  if (v3)
  {
    BOOL v4 = [MEMORY[0x263F241D8] sharedInstance];
    id v5 = [v4 activeDSIDRecord];

    char v6 = [v5 DSID];
    uint64_t v7 = [MEMORY[0x263F241C0] sharedInstance];
    uint64_t v8 = [v7 iCloudDSID];

    uint64_t v9 = NSString;
    int v10 = [v8 isEqualToString:v6];
    id v11 = @"NO";
    if (v10) {
      id v11 = @"YES";
    }
    long long v12 = [v9 stringWithFormat:@"\nshouldSyncDPID:\t%@\niCloudDSID:\t%@\niTunesDSID:\t%@\n", v11, v8, v6];
    _ADLog();

    char v13 = [v8 isEqualToString:v6];
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"shouldSyncDPID: No iCloud Account, not syncing"];
    _ADLog();
    char v13 = 0;
  }

  return v13;
}

- (BOOL)canGenerateDPID
{
  BOOL v3 = [(ADClientDPIDManager *)self isLoggedIntoiTunes];
  BOOL v4 = [(ADClientDPIDManager *)self isRestrictedByApple];
  BOOL v5 = [(ADClientDPIDManager *)self devicePersonalizedAdsEnabled];
  int v6 = v5 && !v4;
  uint64_t v7 = @"NO";
  if (v3) {
    uint64_t v8 = @"YES";
  }
  else {
    uint64_t v8 = @"NO";
  }
  BOOL v9 = v3 & v6;
  if ((v3 & v6) != 0) {
    int v10 = @"YES";
  }
  else {
    int v10 = @"NO";
  }
  if (v4) {
    id v11 = @"NO";
  }
  else {
    id v11 = @"YES";
  }
  if (v5) {
    uint64_t v7 = @"YES";
  }
  long long v12 = [NSString stringWithFormat:@"\nCan Generate DPID:\t\t%@\niTunes Logged In:\t\t%@\nNot Restricted By Apple:\t%@\nPersonalized Ads Enabled:\t\t\t%@", v10, v8, v11, v7];
  _ADLog();

  return v9;
}

- (void)retryIfNeeded:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263F241B8] sharedInstance];
  uint64_t v6 = [v5 integerForKey:@"CKDPIDSyncState"];

  switch(v6)
  {
    case 1:
      uint64_t v7 = [NSString stringWithFormat:@"[%@] Retrying DPID Sync", objc_opt_class()];
      _ADLog();

      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __37__ADClientDPIDManager_retryIfNeeded___block_invoke;
      v17[3] = &unk_264669850;
      id v18 = v4;
      [(ADClientDPIDManager *)self syncDPIDWithiCloud:v17];
      uint64_t v8 = v18;
      goto LABEL_8;
    case 2:
      BOOL v9 = [NSString stringWithFormat:@"[%@] Retrying DPID Fetch", objc_opt_class()];
      _ADLog();

      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __37__ADClientDPIDManager_retryIfNeeded___block_invoke_3;
      v13[3] = &unk_2646698A0;
      void v13[4] = self;
      id v14 = v4;
      [(ADClientDPIDManager *)self fetchDPIDfromiCloud:v13];
      uint64_t v8 = v14;
      goto LABEL_8;
    case 3:
      int v10 = [NSString stringWithFormat:@"[%@] Retrying DPID Save", objc_opt_class()];
      _ADLog();

      id v11 = [(ADClientDPIDManager *)self DPID];
      [(ADClientDPIDManager *)self saveDPIDtoiCloud:v11 completionHandler:0];

      goto LABEL_5;
    case 4:
      long long v12 = [NSString stringWithFormat:@"[%@] Retrying DPID Remove", objc_opt_class()];
      _ADLog();

      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __37__ADClientDPIDManager_retryIfNeeded___block_invoke_2;
      v15[3] = &unk_264669850;
      id v16 = v4;
      [(ADClientDPIDManager *)self removeDPIDfromiCloud:v15];
      uint64_t v8 = v16;
LABEL_8:

      break;
    default:
LABEL_5:
      if (v4) {
        (*((void (**)(id, void))v4 + 2))(v4, 0);
      }
      break;
  }
}

uint64_t __37__ADClientDPIDManager_retryIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    id v4 = [NSString stringWithFormat:@"Retry: Failed to sync DPID in iCloud with error: %@", v3];
    _ADLog();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }

  return MEMORY[0x270F9A758]();
}

uint64_t __37__ADClientDPIDManager_retryIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = v3;
  if (v3)
  {
    id v4 = [NSString stringWithFormat:@"Retry: Failed to remove DPID record from iCloud with error: %@", v3];
    _ADLog();
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
  }

  return MEMORY[0x270F9A758]();
}

void __37__ADClientDPIDManager_retryIfNeeded___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = [NSString stringWithFormat:@"Retry: Failed to fetch DPID from iCloud with error: %@", v5];
    _ADLog();
  }
  else
  {
    [*(id *)(a1 + 32) setDPID:v8];
    [*(id *)(a1 + 32) setIsDPIDLocalTo:0];
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
  }
}

- (void)resetEncryptedZone:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = [(ADClientDPIDManager *)self dpidReconcileStartDate];
  id v5 = [NSString stringWithFormat:@"Deleting inaccessible encrypted container"];
  _ADLog();

  uint64_t v6 = [(ADClientDPIDManager *)self privateContainer];
  uint64_t v7 = [v6 privateCloudDatabase];

  [(ADClientDPIDManager *)self startOperation:9];
  id v8 = objc_alloc(MEMORY[0x263EFD740]);
  BOOL v9 = [(ADClientDPIDManager *)self zoneID];
  v19[0] = v9;
  int v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  id v11 = (void *)[v8 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v10];

  objc_msgSend(v11, "setQualityOfService:", -[ADClientDPIDManager qualityOfService](self, "qualityOfService"));
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  long long v15 = __42__ADClientDPIDManager_resetEncryptedZone___block_invoke;
  id v16 = &unk_2646698F0;
  uint64_t v17 = self;
  id v18 = v4;
  id v12 = v4;
  [v11 setModifyRecordZonesCompletionBlock:&v13];
  -[ADClientDPIDManager setDpidReconcileState:](self, "setDpidReconcileState:", 1, v13, v14, v15, v16, v17);
  [v7 addOperation:v11];
}

void __42__ADClientDPIDManager_resetEncryptedZone___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = [MEMORY[0x263F24230] workQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __42__ADClientDPIDManager_resetEncryptedZone___block_invoke_2;
  v12[3] = &unk_2646698C8;
  BOOL v9 = *(void **)(a1 + 40);
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v9;
  id v14 = v6;
  id v15 = v7;
  id v10 = v7;
  id v11 = v6;
  [v8 addOperationWithBlock:v12];
}

uint64_t __42__ADClientDPIDManager_resetEncryptedZone___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canContinueProcessing:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 32) setiCloudAccountSubscribed:0];
    [*(id *)(a1 + 32) setDpidReconcileState:2];
    uint64_t v2 = NSString;
    id v3 = [*(id *)(a1 + 48) firstObject];
    [v2 stringWithFormat:@"Deleted DPID zone %@ with error %@.", v3, *(void *)(a1 + 56)];
  }
  else
  {
    id v4 = NSString;
    id v3 = objc_msgSend(*(id *)(a1 + 40), "AD_doubleDateTimeAsString");
    [v4 stringWithFormat:@"We were unable to delete the encrypted zone in enough time. (Started at %@)", v3, v8];
  id v5 = };
  _ADLog();

  id v6 = *(void **)(a1 + 32);

  return [v6 finishOperation:9];
}

- (void)setupiCloudSubscription:(id)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ADClientDPIDManager *)self dpidReconcileStartDate];
  id v6 = [NSString stringWithFormat:@"Beginning DPID Subscription Installation"];
  _ADLog();

  id v7 = [(ADClientDPIDManager *)self privateContainer];
  uint64_t v8 = [v7 privateCloudDatabase];

  if (v8)
  {
    [(ADClientDPIDManager *)self startOperation:1];
    id v9 = objc_alloc(MEMORY[0x263EFD7F8]);
    id v10 = [(ADClientDPIDManager *)self zoneID];
    id v11 = (void *)[v9 initWithZoneID:v10];

    id v12 = objc_alloc(MEMORY[0x263EFD740]);
    v24[0] = v11;
    id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    id v14 = (void *)[v12 initWithRecordZonesToSave:v13 recordZoneIDsToDelete:0];

    objc_msgSend(v14, "setQualityOfService:", -[ADClientDPIDManager qualityOfService](self, "qualityOfService"));
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    id v18 = __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke;
    dispatch_time_t v19 = &unk_264669968;
    uint64_t v20 = self;
    id v21 = v5;
    id v15 = v8;
    id v22 = v15;
    id v23 = v4;
    [v14 setModifyRecordZonesCompletionBlock:&v16];
    -[ADClientDPIDManager setDpidReconcileState:](self, "setDpidReconcileState:", 1, v16, v17, v18, v19, v20);
    [v15 addOperation:v14];
  }
  else
  {
    [(ADClientDPIDManager *)self createErrorForPrivateDB:@"Unable to set up iCloud subscription due to missing iCloud container" completionHandler:v4];
  }
}

void __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x263F24230] workQueue];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_2;
  v12[3] = &unk_264669940;
  id v9 = *(void **)(a1 + 40);
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v9;
  id v14 = v6;
  id v15 = v7;
  id v16 = *(id *)(a1 + 48);
  id v17 = *(id *)(a1 + 56);
  id v10 = v7;
  id v11 = v6;
  [v8 addOperationWithBlock:v12];
}

uint64_t __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canContinueProcessing:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 32) setDpidReconcileState:2];
    uint64_t v2 = NSString;
    id v3 = [*(id *)(a1 + 48) firstObject];
    id v4 = [v2 stringWithFormat:@"Created DPID zone %@ with error code %ld %@ ", v3, objc_msgSend(*(id *)(a1 + 56), "code"), *(void *)(a1 + 56)];
    _ADLog();

    if (*(void *)(a1 + 56))
    {
      id v5 = [NSString stringWithFormat:@"Failed To create DPID zone with error %@. Handling CloudKit error.", *(void *)(a1 + 56)];
      _ADLog();

      [*(id *)(a1 + 32) handleCloudKitError:*(void *)(a1 + 56)];
      uint64_t v6 = *(void *)(a1 + 72);
      if (v6) {
        (*(void (**)(uint64_t, void))(v6 + 16))(v6, *(void *)(a1 + 56));
      }
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x263EFD818]);
      id v13 = [*(id *)(a1 + 32) zoneID];
      id v14 = (void *)[v12 initWithZoneID:v13 subscriptionID:@"com.apple.AdSheetPhone.DPID.push.subscription"];

      if (!v14) {
        __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_2_cold_1();
      }
      id v15 = objc_opt_new();
      [v15 setShouldSendContentAvailable:1];
      [v14 setNotificationInfo:v15];
      [*(id *)(a1 + 32) setDpidReconcileState:1];
      id v16 = *(void **)(a1 + 64);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_3;
      v18[3] = &unk_264669918;
      id v17 = *(void **)(a1 + 40);
      v18[4] = *(void *)(a1 + 32);
      id v19 = v17;
      id v20 = *(id *)(a1 + 72);
      [v16 saveSubscription:v14 completionHandler:v18];
    }
    return [*(id *)(a1 + 32) finishOperation:1];
  }
  else
  {
    id v7 = NSString;
    uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "AD_doubleDateTimeAsString");
    id v9 = [v7 stringWithFormat:@"We were unable to Create a CloudKit zone to create a subscription in enough time. (Started at %@)", v8];
    _ADLog();

    id v10 = *(void **)(a1 + 32);
    return [v10 finishOperation:1];
  }
}

void __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263F24230] workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_4;
  v11[3] = &unk_2646697D8;
  uint64_t v8 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v8;
  id v13 = v6;
  id v14 = v5;
  id v15 = *(id *)(a1 + 48);
  id v9 = v5;
  id v10 = v6;
  [v7 addOperationWithBlock:v11];
}

uint64_t __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canContinueProcessing:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 32) setDpidReconcileState:2];
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2)
    {
      id v3 = [NSString stringWithFormat:@"Failed To create DPID subscription %@ with error %@.", *(void *)(a1 + 56), v2];
      _ADLog();
    }
    else
    {
      id v9 = [NSString stringWithFormat:@"Created DPID subscription %@ ", *(void *)(a1 + 56)];
      _ADLog();

      [*(id *)(a1 + 32) setiCloudAccountSubscribed:1];
    }
    uint64_t result = *(void *)(a1 + 64);
    if (result)
    {
      id v10 = *(uint64_t (**)(void))(result + 16);
      return v10();
    }
  }
  else
  {
    id v4 = NSString;
    id v5 = objc_msgSend(*(id *)(a1 + 40), "AD_doubleDateTimeAsString");
    id v6 = [v4 stringWithFormat:@"We were unable to finish the CloudKit subscription process on time. (Started at %@)", v5];
    _ADLog();

    id v7 = *(void **)(a1 + 32);
    return [v7 finishOperation:1];
  }
  return result;
}

- (void)teardowniCloudSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [NSString stringWithFormat:@"Beginning DPID Teardown action"];
  _ADLog();

  id v6 = [(ADClientDPIDManager *)self privateContainer];
  id v7 = [v6 privateCloudDatabase];

  if (v7)
  {
    [(ADClientDPIDManager *)self startOperation:2];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke;
    v8[3] = &unk_264669A58;
    v8[4] = self;
    id v10 = v4;
    id v9 = v7;
    [v9 fetchAllSubscriptionsWithCompletionHandler:v8];
  }
  else
  {
    [(ADClientDPIDManager *)self createErrorForPrivateDB:@"Unable to tear down iCloud subscription due to missing iCloud container" completionHandler:v4];
  }
}

void __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263F24230] workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_2;
  v10[3] = &unk_264669A30;
  id v11 = v6;
  id v12 = v5;
  uint64_t v13 = *(void *)(a1 + 32);
  id v15 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 40);
  id v8 = v5;
  id v9 = v6;
  [v7 addOperationWithBlock:v10];
}

uint64_t __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_2(uint64_t a1)
{
  v19[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    if ([*(id *)(a1 + 40) count])
    {
      id v5 = objc_alloc(MEMORY[0x263EFD7F8]);
      id v6 = [*(id *)(a1 + 48) zoneID];
      id v7 = (void *)[v5 initWithZoneID:v6];

      id v8 = objc_alloc(MEMORY[0x263EFD740]);
      v19[0] = v7;
      id v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
      id v10 = (void *)[v8 initWithRecordZonesToSave:v9 recordZoneIDsToDelete:0];

      objc_msgSend(v10, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 48), "qualityOfService"));
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_3;
      v14[3] = &unk_264669968;
      id v15 = *(id *)(a1 + 40);
      id v11 = *(id *)(a1 + 56);
      uint64_t v12 = *(void *)(a1 + 48);
      id v16 = v11;
      uint64_t v17 = v12;
      id v18 = *(id *)(a1 + 64);
      [v10 setModifyRecordZonesCompletionBlock:v14];
      [*(id *)(a1 + 56) addOperation:v10];

      return [*(id *)(a1 + 48) finishOperation:2];
    }
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v3 = [NSString stringWithFormat:@"fetchAllSubscriptionsWithCompletionHandler subscriptions %@ error %@.", *(void *)(a1 + 40), v2];
  _ADLog();

  [*(id *)(a1 + 48) setiCloudAccountSubscribed:0];
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, *(void *)(a1 + 32));
  }
  return [*(id *)(a1 + 48) finishOperation:2];
}

void __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x263F24230] workQueue];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_4;
  v17[3] = &unk_264669A08;
  id v18 = v7;
  id v19 = v8;
  id v20 = v9;
  id v21 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 48);
  uint64_t v13 = *(void **)(a1 + 56);
  id v22 = v11;
  uint64_t v23 = v12;
  id v24 = v13;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  [v10 addOperationWithBlock:v17];
}

void __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_4(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v2 = [NSString stringWithFormat:@"Saved DPID zone: savedRecordZones %@ deletedRecordZoneIDs %@ with error %@.", *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48)];
  _ADLog();

  if (*(void *)(a1 + 48))
  {
    uint64_t v3 = *(void *)(a1 + 80);
    if (v3)
    {
      uint64_t v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = *(id *)(a1 + 56);
    uint64_t v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v10 = *(void **)(a1 + 64);
          id v11 = [v9 subscriptionID];
          v15[0] = MEMORY[0x263EF8330];
          v15[1] = 3221225472;
          v15[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_5;
          v15[3] = &unk_2646699E0;
          uint64_t v12 = *(void *)(a1 + 72);
          uint64_t v13 = *(void **)(a1 + 80);
          void v15[4] = v9;
          v15[5] = v12;
          id v18 = v13;
          id v16 = *(id *)(a1 + 64);
          id v17 = *(id *)(a1 + 48);
          [v10 deleteSubscriptionWithID:v11 completionHandler:v15];
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v6);
    }
  }
}

void __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F24230] workQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_6;
  v8[3] = &unk_2646699B8;
  uint64_t v6 = *(void *)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v6;
  id v13 = *(id *)(a1 + 64);
  id v11 = *(id *)(a1 + 48);
  id v12 = *(id *)(a1 + 56);
  id v7 = v4;
  [v5 addOperationWithBlock:v8];
}

void __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_6(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = [NSString stringWithFormat:@"Deleted DPID subscription %@ with error %@.", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  _ADLog();

  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = *(void *)(a1 + 72);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    [*(id *)(a1 + 48) setiCloudAccountSubscribed:0];
    id v5 = objc_alloc(MEMORY[0x263EFD740]);
    uint64_t v6 = [*(id *)(a1 + 48) zoneID];
    v11[0] = v6;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
    id v8 = (void *)[v5 initWithRecordZonesToSave:0 recordZoneIDsToDelete:v7];

    objc_msgSend(v8, "setQualityOfService:", objc_msgSend(*(id *)(a1 + 48), "qualityOfService"));
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_7;
    v9[3] = &unk_264669990;
    id v10 = *(id *)(a1 + 72);
    [v8 setModifyRecordZonesCompletionBlock:v9];
    [*(id *)(a1 + 56) addOperation:v8];
  }
}

void __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [MEMORY[0x263F24230] workQueue];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_8;
  v14[3] = &unk_264669788;
  id v15 = v7;
  id v16 = v8;
  id v17 = v9;
  id v18 = *(id *)(a1 + 32);
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  [v10 addOperationWithBlock:v14];
}

uint64_t __50__ADClientDPIDManager_teardowniCloudSubscription___block_invoke_8(void *a1)
{
  uint64_t v2 = [NSString stringWithFormat:@"Deleted DPID zone: savedRecordZones %@ deletedRecordZoneIDs %@ with error %@.", a1[4], a1[5], a1[6]];
  _ADLog();

  uint64_t result = a1[7];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)createErrorForPrivateDB:(id)a3 completionHandler:(id)a4
{
  id v8 = (void (**)(id, void *))a4;
  id v5 = (objc_class *)MEMORY[0x263F087E8];
  id v6 = a3;
  id v7 = (void *)[[v5 alloc] initWithAdCode:9 andDescription:v6];

  objc_msgSend(v7, "AD_Log:", @"DPIDLogging");
  if (v8) {
    v8[2](v8, v7);
  }
}

- (id)conformDPIDToUseWithRecord:(id)a3 legacyRecord:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    id v9 = NSString;
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    id v12 = [v9 stringWithFormat:@"[%@] Found a migrated DPID record!", v11];
    id v13 = v6;
LABEL_5:
    _ADLog();

    id v16 = v13;
    if ([(ADClientDPIDManager *)self supportsDeviceToDeviceEncryption])
    {
      id v17 = [v16 encryptedValuesByKey];
      id v18 = [v17 objectForKeyedSubscript:@"DPID"];

      [NSString stringWithFormat:@"Reading encrypted DPID %@", v18];
    }
    else
    {
      id v18 = [v16 objectForKeyedSubscript:@"DPID"];
      [NSString stringWithFormat:@"Reading unencrypted DPID %@", v18];
    long long v19 = };
    goto LABEL_9;
  }
  id v14 = NSString;
  if (v7)
  {
    id v15 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v15);
    id v12 = [v14 stringWithFormat:@"[%@] Found a legacy DPID record!", v11];
    id v13 = v8;
    goto LABEL_5;
  }
  long long v19 = [NSString stringWithFormat:@"The error is real. No DPID found in iCloud. Returning nil DPID."];
  id v16 = 0;
  id v18 = 0;
LABEL_9:
  _ADLog();

  return v18;
}

- (void)fetchDPIDfromiCloud:(id)a3
{
  v26[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ADClientDPIDManager *)self dpidReconcileStartDate];
  if ([(ADClientDPIDManager *)self devicePersonalizedAdsEnabled])
  {
    id v6 = [NSString stringWithFormat:@"Attempting to fetch the DPID from iCloud."];
    _ADLog();

    id v7 = [MEMORY[0x263F241B8] sharedInstance];
    [v7 setInteger:2 forKey:@"CKDPIDSyncState"];

    [(ADClientDPIDManager *)self startOperation:5];
    id v8 = [(ADClientDPIDManager *)self privateContainer];
    id v9 = [v8 privateCloudDatabase];

    if (v9)
    {
      [(ADClientDPIDManager *)self setDpidReconcileState:1];
      id v10 = objc_alloc(MEMORY[0x263EFD6D8]);
      id v11 = [(ADClientDPIDManager *)self recordID];
      v26[0] = v11;
      id v12 = [(ADClientDPIDManager *)self recordIDLegacy];
      v26[1] = v12;
      id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:2];
      id v14 = (void *)[v10 initWithRecordIDs:v13];

      objc_msgSend(v14, "setQualityOfService:", -[ADClientDPIDManager qualityOfService](self, "qualityOfService"));
      uint64_t v17 = MEMORY[0x263EF8330];
      uint64_t v18 = 3221225472;
      long long v19 = __43__ADClientDPIDManager_fetchDPIDfromiCloud___block_invoke_2;
      long long v20 = &unk_264669A80;
      long long v21 = self;
      id v22 = v5;
      id v23 = v4;
      [v14 setFetchRecordsCompletionBlock:&v17];
      objc_msgSend(v9, "addOperation:", v14, v17, v18, v19, v20, v21);
    }
    else
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      void v24[2] = __43__ADClientDPIDManager_fetchDPIDfromiCloud___block_invoke;
      v24[3] = &unk_264669828;
      v24[4] = self;
      id v25 = v4;
      [(ADClientDPIDManager *)self createErrorForPrivateDB:@"Unable to fetch iCloud DPID due to missing iCloud container" completionHandler:v24];
    }
  }
  else
  {
    id v15 = [NSString stringWithFormat:@"fetchDPIDfromiCloud: Personalized Ads is disabled, not fetching"];
    _ADLog();

    id v16 = [MEMORY[0x263F241B8] sharedInstance];
    [v16 setInteger:0 forKey:@"CKDPIDSyncState"];

    if (v4) {
      (*((void (**)(id, void, void, void))v4 + 2))(v4, 0, 0, 0);
    }
  }
}

void __43__ADClientDPIDManager_fetchDPIDfromiCloud___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) finishOperation:5];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, id, void))(v3 + 16))(v3, 0, v4, 0);
  }
}

void __43__ADClientDPIDManager_fetchDPIDfromiCloud___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263F24230] workQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __43__ADClientDPIDManager_fetchDPIDfromiCloud___block_invoke_3;
  v11[3] = &unk_2646697D8;
  id v8 = *(void **)(a1 + 40);
  void v11[4] = *(void *)(a1 + 32);
  id v12 = v8;
  id v13 = v5;
  id v14 = v6;
  id v15 = *(id *)(a1 + 48);
  id v9 = v6;
  id v10 = v5;
  [v7 addOperationWithBlock:v11];
}

void __43__ADClientDPIDManager_fetchDPIDfromiCloud___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canContinueProcessing:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 32) setDpidReconcileState:2];
    uint64_t v2 = *(void **)(a1 + 48);
    uint64_t v3 = [*(id *)(a1 + 32) recordID];
    id v26 = [v2 objectForKeyedSubscript:v3];

    id v4 = *(void **)(a1 + 48);
    id v5 = [*(id *)(a1 + 32) recordIDLegacy];
    id v6 = [v4 objectForKeyedSubscript:v5];

    id v7 = *(id *)(a1 + 56);
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = [v7 code];
      id v10 = [NSString stringWithFormat:@"iCloud returned an error fetching records: %@ code %ld. Checking if there is an actual error.", v8, v9];
      _ADLog();

      if (v9 == 11 || v9 == 2)
      {

        uint64_t v11 = [*(id *)(a1 + 32) conformDPIDToUseWithRecord:v26 legacyRecord:v6];
        id v12 = (void *)v11;
        if (v6) {
          BOOL v13 = v11 == 0;
        }
        else {
          BOOL v13 = 1;
        }
        uint64_t v15 = !v13 && v26 == 0;
        id v16 = [MEMORY[0x263F241B8] sharedInstance];
        [v16 setInteger:0 forKey:@"CKDPIDSyncState"];

        id v8 = 0;
        goto LABEL_26;
      }
      [*(id *)(a1 + 32) handleCloudKitError:*(void *)(a1 + 56)];
    }
    else
    {
      if (v26)
      {
        if ([*(id *)(a1 + 32) supportsDeviceToDeviceEncryption])
        {
          long long v21 = [v26 encryptedValuesByKey];
          id v12 = [v21 objectForKeyedSubscript:@"DPID"];

          [NSString stringWithFormat:@"Reading encrypted DPID %@", v12];
        }
        else
        {
          id v12 = [v26 objectForKeyedSubscript:@"DPID"];
          [NSString stringWithFormat:@"Reading unencrypted DPID %@", v12];
        id v23 = };
        _ADLog();

        uint64_t v24 = [MEMORY[0x263F241B8] sharedInstance];
        [v24 setInteger:0 forKey:@"CKDPIDSyncState"];

        id v8 = 0;
        uint64_t v15 = 0;
        goto LABEL_26;
      }
      id v22 = [NSString stringWithFormat:@"iCloud Returned no error but failed to fetch record, please file a radar."];
      _ADLog();

      id v8 = 0;
    }
    uint64_t v15 = 0;
    id v12 = 0;
LABEL_26:
    [*(id *)(a1 + 32) finishOperation:5];
    uint64_t v25 = *(void *)(a1 + 64);
    if (v25) {
      (*(void (**)(uint64_t, void *, void *, uint64_t))(v25 + 16))(v25, v12, v8, v15);
    }

    return;
  }
  uint64_t v17 = NSString;
  uint64_t v18 = objc_msgSend(*(id *)(a1 + 40), "AD_doubleDateTimeAsString");
  long long v19 = [v17 stringWithFormat:@"We were unable to fetch the record in time. (Started at %@)", v18];
  _ADLog();

  long long v20 = *(void **)(a1 + 32);

  [v20 finishOperation:5];
}

- (void)removeDPIDfromiCloud:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  id v5 = [NSString stringWithFormat:@"Beginning DPID Remove action"];
  _ADLog();

  id v6 = [(ADClientDPIDManager *)self privateContainer];
  id v7 = [v6 privateCloudDatabase];

  if (v7)
  {
    id v8 = [MEMORY[0x263F241B8] sharedInstance];
    [v8 setInteger:4 forKey:@"CKDPIDSyncState"];

    [(ADClientDPIDManager *)self startOperation:8];
    if (v4) {
      v4[2](v4, 0);
    }
    id v9 = objc_alloc(MEMORY[0x263EFD748]);
    id v10 = [(ADClientDPIDManager *)self recordID];
    v14[0] = v10;
    uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
    id v12 = (void *)[v9 initWithRecordsToSave:MEMORY[0x263EFFA68] recordIDsToDelete:v11];

    objc_msgSend(v12, "setQualityOfService:", -[ADClientDPIDManager qualityOfService](self, "qualityOfService"));
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __44__ADClientDPIDManager_removeDPIDfromiCloud___block_invoke;
    v13[3] = &unk_264669AD0;
    void v13[4] = self;
    [v12 setModifyRecordsCompletionBlock:v13];
    [v7 addOperation:v12];
  }
  else
  {
    [(ADClientDPIDManager *)self createErrorForPrivateDB:@"Unable to remove iCloud DPID due to missing iCloud container" completionHandler:v4];
  }
}

void __44__ADClientDPIDManager_removeDPIDfromiCloud___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [MEMORY[0x263F24230] workQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__ADClientDPIDManager_removeDPIDfromiCloud___block_invoke_2;
  v9[3] = &unk_264669AA8;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v7;
  id v8 = v5;
  [v6 addOperationWithBlock:v9];
}

uint64_t __44__ADClientDPIDManager_removeDPIDfromiCloud___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [NSString stringWithFormat:@"Failed to remove DPID record in iCloud with error: %@", v2];
    _ADLog();
  }
  else
  {
    id v4 = [NSString stringWithFormat:@"Removed DPID record in iCloud for current user."];
    _ADLog();

    uint64_t v3 = [MEMORY[0x263F241B8] sharedInstance];
    [v3 setInteger:0 forKey:@"CKDPIDSyncState"];
  }

  id v5 = *(void **)(a1 + 40);

  return [v5 finishOperation:8];
}

- (void)handleCloudKitError:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 code];
  id v6 = [NSString stringWithFormat:@"[%@] handleCloudKitError. error code %ld", objc_opt_class(), v5];
  _ADLog();

  if (v5 == 5006)
  {
    uint64_t v7 = [NSString stringWithFormat:@"We have attempted to use an encrypted container on a non HSA2 account CKErrorInternaliCDPRequired, please file a radar."];
  }
  else
  {
    if (v5 != 5008) {
      goto LABEL_6;
    }
    uint64_t v7 = [NSString stringWithFormat:@"We need to wait and try again later because of CKErrorInternalUnsyncedKeychain"];
  }
  _ADLog();

LABEL_6:
  id v8 = [v4 domain];
  uint64_t v9 = *MEMORY[0x263EFD498];
  int v10 = [v8 isEqualToString:*MEMORY[0x263EFD498]];

  uint64_t v11 = NSString;
  if (v10)
  {
    id v12 = [NSString stringWithFormat:@"Correctly identified as cloudkit domain"];
    _ADLog();

    if (v5 == 2)
    {
      id v16 = [NSString stringWithFormat:@"Got error code as CKErrorPartialFailure. Need to get the exact reason for partial failure."];
      _ADLog();

      uint64_t v17 = [v4 userInfo];
      uint64_t v18 = [v17 objectForKey:*MEMORY[0x263EFD4C8]];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      v29 = v18;
      long long v19 = [v18 allValues];
      uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v20)
      {
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v31 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v25 = [v24 domain];
            if ([v25 isEqualToString:v9])
            {
              uint64_t v26 = [v24 code];

              if (v26 == 112)
              {
                v27 = [NSString stringWithFormat:@"Found error code as CKErrorPrivateMissingManateeIdentity"];
                _ADLog();

                goto LABEL_23;
              }
            }
            else
            {
            }
          }
          uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v21);
      }
    }
    else if (v5 == 112)
    {
      BOOL v13 = [NSString stringWithFormat:@"Got error code as CKErrorPrivateMissingManateeIdentity"];
      _ADLog();

LABEL_23:
      uint64_t v28 = [NSString stringWithFormat:@"We need to delete and re-create the zone due to CKErrorPrivateMissingManateeIdentity"];
      _ADLog();

      [(ADClientDPIDManager *)self resetEncryptedZone:&__block_literal_global_488];
    }
  }
  else
  {
    id v14 = [v4 domain];
    uint64_t v15 = [v11 stringWithFormat:@"Incorrectly identified domain. Domain is %@", v14];
    _ADLog();
  }
}

void __43__ADClientDPIDManager_handleCloudKitError___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = [NSString stringWithFormat:@"Error resetting Encrypted zone %@, please file a radar.", a2];
    _ADLog();
  }
}

- (void)saveDPIDtoiCloud:(id)a3 completionHandler:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [NSString stringWithFormat:@"Beginning DPID Save action"];
  _ADLog();

  uint64_t v9 = [MEMORY[0x263F241B8] sharedInstance];
  [v9 setInteger:3 forKey:@"CKDPIDSyncState"];

  int v10 = [(ADClientDPIDManager *)self privateContainer];
  uint64_t v11 = [v10 privateCloudDatabase];

  if (v11)
  {
    id v12 = objc_alloc(MEMORY[0x263EFD7C8]);
    BOOL v13 = [(ADClientDPIDManager *)self recordID];
    id v14 = (void *)[v12 initWithRecordType:@"DPIDRecord" recordID:v13];

    if ([(ADClientDPIDManager *)self supportsDeviceToDeviceEncryption])
    {
      uint64_t v15 = [NSString stringWithFormat:@"Writing encrypted DPID %@", v6];
      _ADLog();

      id v16 = [v14 encryptedValuesByKey];
      [v16 setObject:v6 forKeyedSubscript:@"DPID"];
    }
    else
    {
      uint64_t v17 = [NSString stringWithFormat:@"Writing unencrypted DPID %@", v6];
      _ADLog();

      [v14 setObject:v6 forKeyedSubscript:@"DPID"];
    }
    [(ADClientDPIDManager *)self startOperation:7];
    id v18 = objc_alloc(MEMORY[0x263EFD748]);
    v23[0] = v14;
    long long v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
    uint64_t v20 = (void *)[v18 initWithRecordsToSave:v19 recordIDsToDelete:0];

    [v20 setSavePolicy:1];
    objc_msgSend(v20, "setQualityOfService:", -[ADClientDPIDManager qualityOfService](self, "qualityOfService"));
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __58__ADClientDPIDManager_saveDPIDtoiCloud_completionHandler___block_invoke;
    v21[3] = &unk_264669B18;
    v21[4] = self;
    id v22 = v7;
    [v20 setModifyRecordsCompletionBlock:v21];
    [v11 addOperation:v20];
  }
  else
  {
    [(ADClientDPIDManager *)self createErrorForPrivateDB:@"Unable to save iCloud DPID due to missing iCloud container" completionHandler:v7];
  }
}

void __58__ADClientDPIDManager_saveDPIDtoiCloud_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id v6 = [MEMORY[0x263F24230] workQueue];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__ADClientDPIDManager_saveDPIDtoiCloud_completionHandler___block_invoke_2;
  v10[3] = &unk_264669760;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v7;
  id v13 = v8;
  id v9 = v5;
  [v6 addOperationWithBlock:v10];
}

uint64_t __58__ADClientDPIDManager_saveDPIDtoiCloud_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = [NSString stringWithFormat:@"Failed to save DPID record to iCloud with error: %@", v2];
    _ADLog();

    [*(id *)(a1 + 40) handleCloudKitError:*(void *)(a1 + 32)];
  }
  else
  {
    id v4 = [NSString stringWithFormat:@"Updated DPID record in iCloud"];
    _ADLog();

    id v5 = [MEMORY[0x263F241B8] sharedInstance];
    [v5 setInteger:0 forKey:@"CKDPIDSyncState"];

    [*(id *)(a1 + 40) setIsDPIDLocalTo:0];
  }
  [*(id *)(a1 + 40) finishOperation:7];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)syncDPIDWithiCloud:(id)a3
{
  id v4 = a3;
  [(ADClientDPIDManager *)self startOperation:4];
  id v5 = [MEMORY[0x263F241B8] sharedInstance];
  [v5 setInteger:1 forKey:@"CKDPIDSyncState"];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__ADClientDPIDManager_syncDPIDWithiCloud___block_invoke;
  v7[3] = &unk_2646698A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(ADClientDPIDManager *)self fetchDPIDfromiCloud:v7];
}

void __42__ADClientDPIDManager_syncDPIDWithiCloud___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  if (v8)
  {
    [*(id *)(a1 + 32) finishOperation:4];
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      int v10 = *(void (**)(void))(v9 + 16);
LABEL_15:
      v10();
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v7) {
    goto LABEL_7;
  }
  id v11 = [NSString stringWithFormat:@"syncDPIDWithiCloud: Downloaded DPID %@", v7];
  _ADLog();

  [*(id *)(a1 + 32) setDPID:v7];
  [*(id *)(a1 + 32) setIsDPIDLocalTo:0];
  uint64_t v12 = NSString;
  uint64_t v13 = objc_opt_class();
  if (a4)
  {
    id v14 = [v12 stringWithFormat:@"[%@] The DPID requires migration to the new iCloud container", v13];
    _ADLog();

LABEL_7:
    if ([*(id *)(a1 + 32) canGenerateDPID])
    {
      if (!v7 || (a4 & 1) == 0)
      {
        uint64_t v15 = [*(id *)(a1 + 32) generateDPID];
        [*(id *)(a1 + 32) setDPID:v15];

        [*(id *)(a1 + 32) setIsDPIDLocalTo:1];
      }
      id v16 = *(void **)(a1 + 32);
      uint64_t v17 = [v16 DPID];
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __42__ADClientDPIDManager_syncDPIDWithiCloud___block_invoke_2;
      v22[3] = &unk_264669828;
      id v18 = *(void **)(a1 + 40);
      v22[4] = *(void *)(a1 + 32);
      id v23 = v18;
      [v16 saveDPIDtoiCloud:v17 completionHandler:v22];

      goto LABEL_16;
    }
    goto LABEL_13;
  }
  long long v19 = [v12 stringWithFormat:@"[%@] No migration required. Done syncing with iCloud.", v13];
  _ADLog();

  uint64_t v20 = [MEMORY[0x263F241B8] sharedInstance];
  [v20 setInteger:0 forKey:@"CKDPIDSyncState"];

LABEL_13:
  [*(id *)(a1 + 32) finishOperation:4];
  uint64_t v21 = *(void *)(a1 + 40);
  if (v21)
  {
    int v10 = *(void (**)(void))(v21 + 16);
    goto LABEL_15;
  }
LABEL_16:
}

void __42__ADClientDPIDManager_syncDPIDWithiCloud___block_invoke_2(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [MEMORY[0x263F241B8] sharedInstance];
  if (v7)
  {
    [v3 setInteger:3 forKey:@"CKDPIDSyncState"];
  }
  else
  {
    [v3 setInteger:0 forKey:@"CKDPIDSyncState"];

    id v4 = NSString;
    uint64_t v3 = [*(id *)(a1 + 32) DPID];
    id v5 = [v4 stringWithFormat:@"syncDPIDWithiCloud: Uploaded new DPID %@", v3];
    _ADLog();
  }
  [*(id *)(a1 + 32) finishOperation:4];
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
  }
}

- (BOOL)isTest
{
  return self->_isTest;
}

- (unint64_t)dpidReconcileState
{
  return self->_dpidReconcileState;
}

- (void)setDpidReconcileState:(unint64_t)a3
{
  self->_dpidReconcileState = a3;
}

- (NSDate)dpidReconcileStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDpidReconcileStartDate:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (CKRecordID)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
}

- (CKRecordID)recordIDLegacy
{
  return self->_recordIDLegacy;
}

- (void)setRecordIDLegacy:(id)a3
{
}

- (CKContainer)privateContainer
{
  return self->_privateContainer;
}

- (void)setPrivateContainer:(id)a3
{
}

- (BOOL)isPrivateContainerSecure
{
  return self->_isPrivateContainerSecure;
}

- (void)setIsPrivateContainerSecure:(BOOL)a3
{
  self->_isPrivateContainerSecure = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (NSString)DPID
{
  return self->_DPID;
}

- (BOOL)updateInProgress
{
  return self->_updateInProgress;
}

- (void)setUpdateInProgress:(BOOL)a3
{
  self->_updateInProgress = a3;
}

- (NSMutableArray)operationsInProgress
{
  return self->_operationsInProgress;
}

- (void)setOperationsInProgress:(id)a3
{
}

- (BOOL)sandboxEnvironment
{
  return self->_sandboxEnvironment;
}

- (void)setSandboxEnvironment:(BOOL)a3
{
  self->_sandboxEnvironment = a3;
}

- (BOOL)supportsDeviceToDeviceEncryption
{
  return self->_supportsDeviceToDeviceEncryption;
}

- (void)setSupportsDeviceToDeviceEncryption:(BOOL)a3
{
  self->_supportsDeviceToDeviceEncryption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationsInProgress, 0);
  objc_storeStrong((id *)&self->_DPID, 0);
  objc_storeStrong((id *)&self->_privateContainer, 0);
  objc_storeStrong((id *)&self->_recordIDLegacy, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_zoneID, 0);
  objc_storeStrong((id *)&self->_dpidReconcileStartDate, 0);

  objc_storeStrong((id *)&self->_backupFlowQueue, 0);
}

- (void)reconcileDPID:(void *)a1 .cold.1(void *a1)
{
  v1 = [NSString stringWithFormat:@"[%@] We have gotten into an impossible state (%lu). We are going to crash now. Goodbye.", objc_opt_class(), objc_msgSend(a1, "dpidReconcileState")];
  _ADLog();

  __assert_rtn("-[ADClientDPIDManager reconcileDPID:]", "ADClientDPIDManager.m", 257, "false");
}

void __47__ADClientDPIDManager_setupiCloudSubscription___block_invoke_2_cold_1()
{
}

@end