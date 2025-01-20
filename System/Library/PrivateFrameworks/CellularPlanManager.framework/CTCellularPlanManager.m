@interface CTCellularPlanManager
+ (id)sharedManager;
+ (int64_t)calculateInstallConsentTextTypeFor:(id)a3;
- (CTCellularPlanManager)init;
- (id)cancelPlanActivation:(id)a3;
- (id)danglingPlanItemsShouldUpdate:(BOOL)a3;
- (id)didEnablePlanItems:(id)a3;
- (id)didSelectPlanForData:(id)a3;
- (id)didSelectPlanForDefaultVoice:(id)a3;
- (id)didSelectPlanItem:(id)a3 isEnable:(BOOL)a4;
- (id)getPlansPendingTransfer:(id *)a3;
- (id)getPlansPendingTransferForTestability:(id *)a3;
- (id)getPredefinedLabels;
- (id)getShortLabelsForLabels:(id)a3;
- (id)getSubscriptionContextUUIDforPlan:(id)a3;
- (id)planItemsShouldUpdate:(BOOL)a3;
- (id)remapSimLabel:(id)a3 to:(id)a4;
- (id)resolveSimLabel:(id)a3;
- (id)setLabelForPlan:(id)a3 label:(id)a4;
- (id)synchronousProxyWithErrorHandler:(id)a3;
- (unint64_t)getSupportedFlowTypes;
- (void)_connect_sync;
- (void)_ensureConnected_sync;
- (void)_reconnect;
- (void)activatePlanPendingTransfer:(id)a3 completion:(id)a4;
- (void)addNewPlanWithAddress:(id)a3 matchingId:(id)a4 oid:(id)a5 confirmationCode:(id)a6 triggerType:(int64_t)a7 userConsent:(int64_t)a8 completion:(id)a9;
- (void)addNewPlanWithCardData:(id)a3 confirmationCode:(id)a4 triggerType:(int64_t)a5 userConsent:(int64_t)a6 completion:(id)a7;
- (void)addNewPlanWithFlowType:(unint64_t)a3 completion:(id)a4;
- (void)addNewRemotePlan:(BOOL)a3 withCSN:(id)a4 withContext:(id)a5 userConsent:(int64_t)a6 completion:(id)a7;
- (void)addNewRemotePlanWithAddress:(id)a3 matchingId:(id)a4 oid:(id)a5 confirmationCode:(id)a6 isPairing:(BOOL)a7 withCSN:(id)a8 withContext:(id)a9 userConsent:(int64_t)a10 completion:(id)a11;
- (void)addNewRemotePlanWithCardData:(id)a3 confirmationCode:(id)a4 isPairing:(BOOL)a5 withCSN:(id)a6 withContext:(id)a7 userConsent:(int64_t)a8 completion:(id)a9;
- (void)carrierItemsShouldUpdate:(BOOL)a3 completion:(id)a4;
- (void)danglingPlanItemsShouldUpdate:(BOOL)a3 completion:(id)a4;
- (void)dealloc;
- (void)deleteAllRemoteProfiles;
- (void)deletePlanPendingTransfer:(id)a3 completion:(id)a4;
- (void)deleteRemoteProfile:(id)a3;
- (void)didCancelRemotePlan;
- (void)didDeletePlanItem:(id)a3 completion:(id)a4;
- (void)didDeleteRemotePlanItem:(id)a3 completion:(id)a4;
- (void)didPurchasePlanForCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7;
- (void)didPurchasePlanForCsn:(id)a3 iccid:(id)a4 profileServer:(id)a5 state:(id)a6;
- (void)didPurchasePlanWithIccid:(id)a3 downloadProfile:(BOOL)a4;
- (void)didPurchaseRemotePlanForEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSmdpFqdn:(id)a7 completion:(id)a8;
- (void)didSelectPlanForData:(id)a3 completion:(id)a4;
- (void)didSelectPlanForDefaultVoice:(id)a3 completion:(id)a4;
- (void)didSelectPlanItem:(id)a3 isEnable:(BOOL)a4 completion:(id)a5;
- (void)didSelectPlansForIMessage:(id)a3 completion:(id)a4;
- (void)didSelectRemotePlanItem:(id)a3 completion:(id)a4;
- (void)didTransferPlanForCsn:(id)a3 iccid:(id)a4 srcIccid:(id)a5 profileServer:(id)a6 state:(id)a7;
- (void)enterSimSetupWithCompletion:(id)a3;
- (void)eraseAllPlans:(id)a3;
- (void)eraseAllRemotePlansWithCSN:(id)a3 completion:(id)a4;
- (void)eraseAllRemotePlansWithCompletion:(id)a3;
- (void)exitSimSetupWithCompletion:(id)a3;
- (void)expirePlan;
- (void)fetchRemoteProfiles:(id)a3;
- (void)finishProvisioningWithCompletion:(id)a3;
- (void)finishRemoteProvisioningForCSN:(id)a3 completion:(id)a4;
- (void)getAutoPlanSelectionWithCompletion:(id)a3;
- (void)getIMEIPrefix:(id)a3;
- (void)getPhoneAuthTokenWithMessage:(id)a3 completion:(id)a4;
- (void)getRemoteInfo:(id)a3;
- (void)getRoamingSignupOverrideWithCompletion:(id)a3;
- (void)getSelectedEnv:(id)a3;
- (void)getSelectedProxy:(id)a3;
- (void)getSkipEligibilityCheck:(id)a3;
- (void)getSupportedFlowTypes:(id)a3;
- (void)installPendingRemotePlan:(id)a3 completion:(id)a4;
- (void)isRemotePlanCapableWithContext:(id)a3 completion:(id)a4;
- (void)latitudeLongitudeOverride:(id)a3;
- (void)manageAccountForRemotePlan:(id)a3 completion:(id)a4;
- (void)mccMncOverride:(id)a3;
- (void)pendingReleaseRemotePlan;
- (void)ping;
- (void)planItemsShouldUpdate:(BOOL)a3 completion:(id)a4;
- (void)planItemsWithCompletion:(id)a3;
- (void)remapSimLabel:(id)a3 to:(id)a4 completion:(id)a5;
- (void)remotePlanItemsWithCompletion:(id)a3;
- (void)remotePlanItemsWithUpdateFetch:(BOOL)a3 withCSN:(id)a4 completion:(id)a5;
- (void)resolveSimLabel:(id)a3 completion:(id)a4;
- (void)resumePlanProvisioning:(BOOL)a3 userConsent:(int64_t)a4 completion:(id)a5;
- (void)selectRemoteProfile:(id)a3;
- (void)setAutoPlanSelection:(BOOL)a3;
- (void)setIMEIPrefix:(id)a3;
- (void)setRoamingSignupOverride:(BOOL)a3;
- (void)setSelectedEnv:(int64_t)a3;
- (void)setSelectedProxy:(int64_t)a3;
- (void)setSkipEligibilityCheck:(BOOL)a3;
- (void)setUserInPurchaseFlow:(BOOL)a3;
- (void)shouldShowAddNewRemotePlanWithContext:(id)a3 completion:(id)a4;
- (void)shouldShowPlanSetup:(id)a3;
- (void)startProvisioningWithCompletion:(id)a3;
- (void)startRemoteProvisioningForCSN:(id)a3 completion:(id)a4;
- (void)userDidProvideConsentResponse:(int64_t)a3 forPlan:(id)a4 isRemote:(BOOL)a5 completion:(id)a6;
- (void)userDidProvideResponse:(int64_t)a3 confirmationCode:(id)a4 forPlan:(id)a5 isRemote:(BOOL)a6 completion:(id)a7;
- (void)userSignupInitiatedOrFailed;
@end

@implementation CTCellularPlanManager

uint64_t __58__CTCellularPlanManager_synchronousProxyWithErrorHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__CTCellularPlanManager_synchronousProxyWithErrorHandler___block_invoke_2;
  v4[3] = &unk_1E6C1EE00;
  v4[4] = *(void *)(a1 + 40);
  uint64_t result = [v2 synchronousRemoteObjectProxyWithErrorHandler:v4];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (void)_ensureConnected_sync
{
  if (!self->_connection) {
    [(CTCellularPlanManager *)self _connect_sync];
  }
}

uint64_t __29__CTCellularPlanManager_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
}

uint64_t __46__CTCellularPlanManager_getSupportedFlowTypes__block_invoke_2(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)_connect_sync
{
  self->_connection = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.CellularPlanDaemon.xpc" options:4096];
  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F35F75E0]);
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F35F5C18]);
  [(NSXPCConnection *)self->_connection setExportedObject:self->_delegate];
  [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:CTCellularPlanXpcWhitelistSet() forSelector:sel_planItemsWithCompletion_ argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:CTCellularPlanXpcWhitelistSet() forSelector:sel_danglingPlanItemsShouldUpdate_completion_ argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:CTCellularPlanXpcWhitelistSet() forSelector:sel_getPlansPendingTransferWithCompletion_ argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:CTCellularPlanXpcWhitelistSet() forSelector:sel_getPlansPendingTransferForTestabilityWithCompletion_ argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:CTCellularPlanXpcWhitelistSet() forSelector:sel_activatePlanPendingTransfer_completion_ argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:CTCellularPlanXpcWhitelistSet() forSelector:sel_cancelPlanActivation_completion_ argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:CTCellularPlanXpcWhitelistSet() forSelector:sel_deletePlanPendingTransfer_completion_ argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:CTCellularPlanCarrierItemXpcWhitelistSet() forSelector:sel_carrierItemsShouldUpdate_completion_ argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:CTCellularPlanXpcWhitelistSet() forSelector:sel_remotePlanItemsWithUpdateFetch_completion_ argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:CTCellularPlanXpcWhitelistSet() forSelector:sel_getPredefinedLabels_ argumentIndex:0 ofReply:1];
  v3 = [(NSXPCConnection *)self->_connection remoteObjectInterface];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  -[NSXPCInterface setClasses:forSelector:argumentIndex:ofReply:](v3, "setClasses:forSelector:argumentIndex:ofReply:", (id)objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0), sel_getShortLabelsForLabels_completion_, 0, 0);
  [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:CTCellularPlanXpcWhitelistSet() forSelector:sel_didSelectPlansForIMessage_completion_ argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)[(NSXPCConnection *)self->_connection remoteObjectInterface] setClasses:CTCellularPlanXpcWhitelistSet() forSelector:sel_didEnablePlanItems_completion_ argumentIndex:0 ofReply:0];
  id location = 0;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__CTCellularPlanManager__connect_sync__block_invoke;
  v8[3] = &unk_1E6C1EDD8;
  objc_copyWeak(&v9, &location);
  [(NSXPCConnection *)self->_connection setInvalidationHandler:v8];
  [(NSXPCConnection *)self->_connection _setQueue:self->_queue];
  [(NSXPCConnection *)self->_connection resume];
  v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "Connected to Xpc Service", buf, 2u);
  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)danglingPlanItemsShouldUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CTCellularPlanManager danglingPlanItemsShouldUpdate:]";
    _os_log_impl(&dword_1DB90D000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  id v6 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:&__block_literal_global_261];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  uint64_t v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__CTCellularPlanManager_danglingPlanItemsShouldUpdate___block_invoke_2;
  v9[3] = &unk_1E6C1F168;
  v9[4] = &buf;
  [v6 danglingPlanItemsShouldUpdate:v3 completion:v9];
  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v7;
}

- (unint64_t)getSupportedFlowTypes
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CTCellularPlanManager getSupportedFlowTypes]";
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  id v4 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:&__block_literal_global_224];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__CTCellularPlanManager_getSupportedFlowTypes__block_invoke_2;
  v7[3] = &unk_1E6C1EF88;
  v7[4] = &buf;
  [v4 getSupportedFlowTypes:v7];
  unint64_t v5 = *(void *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v5;
}

- (id)planItemsShouldUpdate:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CTCellularPlanManager planItemsShouldUpdate:]";
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  id v5 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:&__block_literal_global_257];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  uint64_t v13 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__CTCellularPlanManager_planItemsShouldUpdate___block_invoke_2;
  v8[3] = &unk_1E6C1F168;
  void v8[4] = &buf;
  [v5 planItemsWithCompletion:v8];
  id v6 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v6;
}

- (id)getPlansPendingTransfer:(id *)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3052000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  uint64_t v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __49__CTCellularPlanManager_getPlansPendingTransfer___block_invoke;
  v14[3] = &unk_1E6C1F1B8;
  v14[4] = &v15;
  id v4 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:v14];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CTCellularPlanManager_getPlansPendingTransfer___block_invoke_262;
  v7[3] = &unk_1E6C1F1E0;
  v7[4] = &v15;
  void v7[5] = &v8;
  [v4 getPlansPendingTransferWithCompletion:v7];
  if (a3) {
    *a3 = (id)v16[5];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v15, 8);
  return v5;
}

CTCellularPlanManager *__38__CTCellularPlanManager_sharedManager__block_invoke()
{
  uint64_t result = objc_alloc_init(CTCellularPlanManager);
  sharedManager_sharedManager = (uint64_t)result;
  return result;
}

- (CTCellularPlanManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)CTCellularPlanManager;
  v2 = [(CTCellularPlanManager *)&v9 init];
  if (v2)
  {
    v2->_queue = (dispatch_queue_s *)dispatch_queue_create("com.apple.CoreTelephony.CellularPlan", 0);
    v2->_delegate = objc_alloc_init(CTCellularPlanManagerDelegate);
    queue = v2->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__CTCellularPlanManager_init__block_invoke;
    block[3] = &unk_1E6C1ED88;
    block[4] = v2;
    dispatch_async(queue, block);
    id v7 = 0;
    objc_initWeak(&v7, v2);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    id v5 = objc_loadWeak(&v7);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_CTDaemonReady, (CFStringRef)*MEMORY[0x1E4F23D50], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_destroyWeak(&v7);
  }
  return v2;
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  }
  return (id)sharedManager_sharedManager;
}

- (id)synchronousProxyWithErrorHandler:(id)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  uint64_t v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CTCellularPlanManager_synchronousProxyWithErrorHandler___block_invoke;
  block[3] = &unk_1E6C1EE28;
  void block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __55__CTCellularPlanManager_danglingPlanItemsShouldUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __47__CTCellularPlanManager_planItemsShouldUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)_reconnect
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CTCellularPlanManager__reconnect__block_invoke;
  block[3] = &unk_1E6C1ED88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__CTCellularPlanManager__reconnect__block_invoke(uint64_t a1)
{
  v2 = *(id **)(a1 + 32);
  if (v2[2])
  {
    [v2[2] setInvalidationHandler:0];
    [*(id *)(*(void *)(a1 + 32) + 16) invalidate];

    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    v2 = *(id **)(a1 + 32);
  }
  return [v2 ping];
}

void __38__CTCellularPlanManager__connect_sync__block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "Xpc Connection invalidated", v5, 2u);
  }
  Weak = (id *)objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    id v4 = Weak;

    v4[2] = 0;
  }
}

uint64_t __58__CTCellularPlanManager_synchronousProxyWithErrorHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __58__CTCellularPlanManager_synchronousProxyWithErrorHandler___block_invoke_2_cold_1();
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  }
  return result;
}

- (void)ping
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CTCellularPlanManager_ping__block_invoke;
  block[3] = &unk_1E6C1ED88;
  block[4] = self;
  dispatch_async(queue, block);
}

void __29__CTCellularPlanManager_ping__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxy];
  if (v2)
  {
    [v2 ping];
  }
  else
  {
    BOOL v3 = CellularPlanLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __29__CTCellularPlanManager_ping__block_invoke_cold_1(v3);
    }
  }
}

- (void)shouldShowPlanSetup:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2;
  v6[3] = &unk_1E6C1EE00;
  v6[4] = *(void *)(a1 + 40);
  BOOL v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_218;
  v5[3] = &unk_1E6C1EEA0;
  v5[4] = *(void *)(a1 + 40);
  return [v3 shouldShowPlanSetup:v5];
}

void __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_217;
  block[3] = &unk_1E6C1EE50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_217(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_218(uint64_t a1, char a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_3;
  v5[3] = &unk_1E6C1EE78;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)getSupportedFlowTypes:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_2;
  v6[3] = &unk_1E6C1EE00;
  v6[4] = *(void *)(a1 + 40);
  BOOL v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_2_221;
  v5[3] = &unk_1E6C1EF40;
  v5[4] = *(void *)(a1 + 40);
  return [v3 getSupportedFlowTypes:v5];
}

void __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_220;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_220(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_2_221(uint64_t a1, uint64_t a2, uint64_t a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_3;
  block[3] = &unk_1E6C1EF18;
  void block[5] = *(void *)(a1 + 32);
  block[6] = a2;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

uint64_t __47__CTCellularPlanManager_getSupportedFlowTypes___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (void)startProvisioningWithCompletion:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_2;
  v6[3] = &unk_1E6C1EE00;
  v6[4] = *(void *)(a1 + 40);
  BOOL v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_2_226;
  v5[3] = &unk_1E6C1EEA0;
  v5[4] = *(void *)(a1 + 40);
  return [v3 startProvisioningWithCompletion:v5];
}

void __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_225;
  block[3] = &unk_1E6C1EE50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_225(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_2_226(uint64_t a1, char a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_3;
  v5[3] = &unk_1E6C1EE78;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __57__CTCellularPlanManager_startProvisioningWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)finishProvisioningWithCompletion:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_2;
  v6[3] = &unk_1E6C1EE00;
  v6[4] = *(void *)(a1 + 40);
  BOOL v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_2_228;
  v5[3] = &unk_1E6C1EEA0;
  v5[4] = *(void *)(a1 + 40);
  return [v3 finishProvisioningWithCompletion:v5];
}

void __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_2(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_227;
  block[3] = &unk_1E6C1EE50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_227(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_2_228(uint64_t a1, char a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_3;
  v5[3] = &unk_1E6C1EE78;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __58__CTCellularPlanManager_finishProvisioningWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)enterSimSetupWithCompletion:(id)a3
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CTCellularPlanManager_enterSimSetupWithCompletion___block_invoke;
  block[3] = &unk_1E6C1EE50;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

uint64_t __53__CTCellularPlanManager_enterSimSetupWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)exitSimSetupWithCompletion:(id)a3
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CTCellularPlanManager_exitSimSetupWithCompletion___block_invoke;
  block[3] = &unk_1E6C1EE50;
  block[4] = a3;
  dispatch_async(global_queue, block);
}

uint64_t __52__CTCellularPlanManager_exitSimSetupWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addNewPlanWithCardData:(id)a3 confirmationCode:(id)a4 triggerType:(int64_t)a5 userConsent:(int64_t)a6 completion:(id)a7
{
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke;
  v8[3] = &unk_1E6C1EFB0;
  void v8[4] = self;
  void v8[5] = a3;
  v8[6] = a4;
  v8[7] = a7;
  v8[8] = a5;
  v8[9] = a6;
  dispatch_async(queue, v8);
}

uint64_t __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_2;
  v10[3] = &unk_1E6C1EE00;
  v10[4] = *(void *)(a1 + 56);
  BOOL v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v10];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_2_230;
  v9[3] = &unk_1E6C1EE00;
  v9[4] = *(void *)(a1 + 56);
  return [v3 addNewPlanWithCardData:v4 confirmationCode:v5 triggerType:v6 userConsent:v7 completion:v9];
}

void __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_229;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_229(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_2_230(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_3;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __100__CTCellularPlanManager_addNewPlanWithCardData_confirmationCode_triggerType_userConsent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addNewPlanWithFlowType:(unint64_t)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke;
  block[3] = &unk_1E6C1EFD8;
  block[4] = self;
  void block[5] = a4;
  block[6] = a3;
  dispatch_async(queue, block);
}

uint64_t __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_2;
  v7[3] = &unk_1E6C1EE00;
  v7[4] = *(void *)(a1 + 40);
  BOOL v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_2_232;
  v6[3] = &unk_1E6C1EE00;
  uint64_t v4 = *(void *)(a1 + 48);
  v6[4] = *(void *)(a1 + 40);
  return [v3 addNewPlanWithFlowType:v4 completion:v6];
}

void __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_231;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_231(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_2_232(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_3;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __59__CTCellularPlanManager_addNewPlanWithFlowType_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addNewPlanWithAddress:(id)a3 matchingId:(id)a4 oid:(id)a5 confirmationCode:(id)a6 triggerType:(int64_t)a7 userConsent:(int64_t)a8 completion:(id)a9
{
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke;
  v10[3] = &unk_1E6C1F000;
  v10[4] = self;
  void v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  v10[8] = a6;
  v10[9] = a9;
  v10[10] = a7;
  v10[11] = a8;
  dispatch_async(queue, v10);
}

uint64_t __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_2;
  v12[3] = &unk_1E6C1EE00;
  v12[4] = *(void *)(a1 + 72);
  BOOL v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v12];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 88);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_2_234;
  v11[3] = &unk_1E6C1EE00;
  v11[4] = *(void *)(a1 + 72);
  return [v3 addNewPlanWithAddress:v4 matchingId:v5 oid:v6 confirmationCode:v7 triggerType:v8 userConsent:v9 completion:v11];
}

void __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_233;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_233(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_2_234(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_3;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __114__CTCellularPlanManager_addNewPlanWithAddress_matchingId_oid_confirmationCode_triggerType_userConsent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)installPendingRemotePlan:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_2;
  v7[3] = &unk_1E6C1EE00;
  v7[4] = *(void *)(a1 + 48);
  BOOL v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_2_236;
  v6[3] = &unk_1E6C1EE00;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 48);
  return [v3 installPendingRemotePlan:v4 completion:v6];
}

void __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_235;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_235(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_2_236(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_3;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __61__CTCellularPlanManager_installPendingRemotePlan_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)resumePlanProvisioning:(BOOL)a3 userConsent:(int64_t)a4 completion:(id)a5
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke;
  v6[3] = &unk_1E6C1F050;
  v6[4] = self;
  void v6[5] = a5;
  BOOL v7 = a3;
  void v6[6] = a4;
  dispatch_async(queue, v6);
}

uint64_t __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_2;
  v8[3] = &unk_1E6C1EE00;
  void v8[4] = *(void *)(a1 + 40);
  BOOL v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 56);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_2_238;
  v7[3] = &unk_1E6C1EE00;
  uint64_t v5 = *(void *)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  return [v3 resumePlanProvisioning:v4 userConsent:v5 completion:v7];
}

void __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_237;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_237(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_2_238(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_3;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __71__CTCellularPlanManager_resumePlanProvisioning_userConsent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)getIMEIPrefix:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__CTCellularPlanManager_getIMEIPrefix___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __39__CTCellularPlanManager_getIMEIPrefix___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_2;
  v6[3] = &unk_1E6C1EE00;
  v6[4] = *(void *)(a1 + 40);
  BOOL v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_2_240;
  v5[3] = &unk_1E6C1F078;
  v5[4] = *(void *)(a1 + 40);
  return [v3 getIMEIPrefix:v5];
}

void __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "unable to get IMEI prefix %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_239;
  block[3] = &unk_1E6C1EE50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_239(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_2_240(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_3;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __39__CTCellularPlanManager_getIMEIPrefix___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setIMEIPrefix:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__CTCellularPlanManager_setIMEIPrefix___block_invoke;
  v4[3] = &unk_1E6C1EDB0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __39__CTCellularPlanManager_setIMEIPrefix___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_243];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setIMEIPrefix:v3];
}

void __39__CTCellularPlanManager_setIMEIPrefix___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "unable to set IMEI prefix %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getSelectedEnv:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__CTCellularPlanManager_getSelectedEnv___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __40__CTCellularPlanManager_getSelectedEnv___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__CTCellularPlanManager_getSelectedEnv___block_invoke_2;
  v6[3] = &unk_1E6C1EE00;
  v6[4] = *(void *)(a1 + 40);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__CTCellularPlanManager_getSelectedEnv___block_invoke_2_245;
  v5[3] = &unk_1E6C1F0C8;
  v5[4] = *(void *)(a1 + 40);
  return [v3 getSelectedEnv:v5];
}

void __40__CTCellularPlanManager_getSelectedEnv___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "unable to get Env index %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CTCellularPlanManager_getSelectedEnv___block_invoke_244;
  block[3] = &unk_1E6C1EE50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __40__CTCellularPlanManager_getSelectedEnv___block_invoke_244(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __40__CTCellularPlanManager_getSelectedEnv___block_invoke_2_245(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__CTCellularPlanManager_getSelectedEnv___block_invoke_3;
  v5[3] = &unk_1E6C1F0A0;
  v5[4] = *(void *)(a1 + 32);
  void v5[5] = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __40__CTCellularPlanManager_getSelectedEnv___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setSelectedEnv:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__CTCellularPlanManager_setSelectedEnv___block_invoke;
  v4[3] = &unk_1E6C1F0F0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __40__CTCellularPlanManager_setSelectedEnv___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_248];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setSelectedEnv:v3];
}

void __40__CTCellularPlanManager_setSelectedEnv___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "unable to set Env index %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getSelectedProxy:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__CTCellularPlanManager_getSelectedProxy___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __42__CTCellularPlanManager_getSelectedProxy___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__CTCellularPlanManager_getSelectedProxy___block_invoke_2;
  v6[3] = &unk_1E6C1EE00;
  v6[4] = *(void *)(a1 + 40);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CTCellularPlanManager_getSelectedProxy___block_invoke_2_250;
  v5[3] = &unk_1E6C1F0C8;
  v5[4] = *(void *)(a1 + 40);
  return [v3 getSelectedProxy:v5];
}

void __42__CTCellularPlanManager_getSelectedProxy___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "unable to get Proxy index %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__CTCellularPlanManager_getSelectedProxy___block_invoke_249;
  block[3] = &unk_1E6C1EE50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __42__CTCellularPlanManager_getSelectedProxy___block_invoke_249(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__CTCellularPlanManager_getSelectedProxy___block_invoke_2_250(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CTCellularPlanManager_getSelectedProxy___block_invoke_3;
  v5[3] = &unk_1E6C1F0A0;
  v5[4] = *(void *)(a1 + 32);
  void v5[5] = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __42__CTCellularPlanManager_getSelectedProxy___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)setSelectedProxy:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __42__CTCellularPlanManager_setSelectedProxy___block_invoke;
  v4[3] = &unk_1E6C1F0F0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __42__CTCellularPlanManager_setSelectedProxy___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_252];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 setSelectedProxy:v3];
}

void __42__CTCellularPlanManager_setSelectedProxy___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "unable to set Proxy index %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)mccMncOverride:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CTCellularPlanManager_mccMncOverride___block_invoke;
  block[3] = &unk_1E6C1EE50;
  block[4] = a3;
  dispatch_async(queue, block);
}

void __40__CTCellularPlanManager_mccMncOverride___block_invoke(uint64_t a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__CTCellularPlanManager_mccMncOverride___block_invoke_2;
  block[3] = &unk_1E6C1EE50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __40__CTCellularPlanManager_mccMncOverride___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)latitudeLongitudeOverride:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CTCellularPlanManager_latitudeLongitudeOverride___block_invoke;
  block[3] = &unk_1E6C1EE50;
  block[4] = a3;
  dispatch_async(queue, block);
}

void __51__CTCellularPlanManager_latitudeLongitudeOverride___block_invoke(uint64_t a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CTCellularPlanManager_latitudeLongitudeOverride___block_invoke_2;
  block[3] = &unk_1E6C1EE50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __51__CTCellularPlanManager_latitudeLongitudeOverride___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(double, double))(*(void *)(a1 + 32) + 16))(0.0, 0.0);
}

- (void)planItemsWithCompletion:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "planItemsWithCompletion", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_253;
  v7[3] = &unk_1E6C1EE00;
  v7[4] = *(void *)(a1 + 40);
  int v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E6C1F140;
  v6[4] = *(void *)(a1 + 40);
  return [v4 planItemsWithCompletion:v6];
}

void __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_253(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "Error getting plan items %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_254;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_254(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_3;
  block[3] = &unk_1E6C1F118;
  uint64_t v7 = *(void *)(a1 + 32);
  void block[5] = a3;
  block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

uint64_t __49__CTCellularPlanManager_planItemsWithCompletion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)planItemsShouldUpdate:(BOOL)a3 completion:(id)a4
{
}

- (void)danglingPlanItemsShouldUpdate:(BOOL)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke;
  block[3] = &unk_1E6C1F190;
  block[4] = self;
  void block[5] = a4;
  BOOL v6 = a3;
  dispatch_async(queue, block);
}

uint64_t __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "danglingPlanItemsShouldUpdate", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_258;
  v8[3] = &unk_1E6C1EE00;
  void v8[4] = *(void *)(a1 + 40);
  int v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_2;
  v7[3] = &unk_1E6C1F140;
  v7[4] = *(void *)(a1 + 40);
  return [v4 danglingPlanItemsShouldUpdate:v5 completion:v7];
}

void __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_258(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "Error getting plan items %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_259;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_259(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_3;
  block[3] = &unk_1E6C1F118;
  uint64_t v7 = *(void *)(a1 + 32);
  void block[5] = a3;
  void block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

uint64_t __66__CTCellularPlanManager_danglingPlanItemsShouldUpdate_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

id __49__CTCellularPlanManager_getPlansPendingTransfer___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    uint64_t v7 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "Error getting synchronous proxy: %@", (uint8_t *)&v6, 0xCu);
  }
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __49__CTCellularPlanManager_getPlansPendingTransfer___block_invoke_262(uint64_t a1, void *a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a3;
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)getPlansPendingTransferForTestability:(id *)a3
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3052000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  uint64_t v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__CTCellularPlanManager_getPlansPendingTransferForTestability___block_invoke;
  v14[3] = &unk_1E6C1F1B8;
  v14[4] = &v15;
  id v4 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:v14];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CTCellularPlanManager_getPlansPendingTransferForTestability___block_invoke_263;
  v7[3] = &unk_1E6C1F1E0;
  v7[4] = &v15;
  void v7[5] = &v8;
  [v4 getPlansPendingTransferForTestabilityWithCompletion:v7];
  if (a3) {
    *a3 = (id)v16[5];
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v15, 8);
  return v5;
}

id __63__CTCellularPlanManager_getPlansPendingTransferForTestability___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    uint64_t v7 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "Error getting synchronous proxy: %@", (uint8_t *)&v6, 0xCu);
  }
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __63__CTCellularPlanManager_getPlansPendingTransferForTestability___block_invoke_263(uint64_t a1, void *a2, void *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a3;
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)activatePlanPendingTransfer:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_2;
  v7[3] = &unk_1E6C1EE00;
  v7[4] = *(void *)(a1 + 48);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_2_265;
  v6[3] = &unk_1E6C1F230;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 48);
  return [v3 activatePlanPendingTransfer:v4 completion:v6];
}

void __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "Error getting remote proxy %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_264;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_264(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

void __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_2_265(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_3;
  block[3] = &unk_1E6C1F208;
  uint64_t v11 = *(void *)(a1 + 32);
  char v13 = a2;
  block[4] = a3;
  void block[5] = a4;
  void block[6] = a5;
  void block[7] = v11;
  dispatch_async(global_queue, block);
}

uint64_t __64__CTCellularPlanManager_activatePlanPendingTransfer_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (id)cancelPlanActivation:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy_;
  char v13 = __Block_byref_object_dispose_;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__CTCellularPlanManager_cancelPlanActivation___block_invoke;
  v8[3] = &unk_1E6C1F1B8;
  void v8[4] = &v9;
  id v4 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__CTCellularPlanManager_cancelPlanActivation___block_invoke_2;
  v7[3] = &unk_1E6C1F1B8;
  v7[4] = &v9;
  [v4 cancelPlanActivation:a3 completion:v7];
  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);
  return v5;
}

id __46__CTCellularPlanManager_cancelPlanActivation___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __46__CTCellularPlanManager_cancelPlanActivation___block_invoke_2(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)deletePlanPendingTransfer:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_2;
  v7[3] = &unk_1E6C1EE00;
  v7[4] = *(void *)(a1 + 48);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_2_268;
  v6[3] = &unk_1E6C1EE00;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 48);
  return [v3 deletePlanPendingTransfer:v4 completion:v6];
}

void __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "Error getting remote proxy %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_267;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_267(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_2_268(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_3;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __62__CTCellularPlanManager_deletePlanPendingTransfer_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)resolveSimLabel:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "resolveSimLabel", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_269;
  v8[3] = &unk_1E6C1EE00;
  void v8[4] = *(void *)(a1 + 48);
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_3;
  v7[3] = &unk_1E6C1EE00;
  uint64_t v5 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 48);
  return [v4 resolveSimLabel:v5 completion:v7];
}

void __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_269(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_2;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_4;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __52__CTCellularPlanManager_resolveSimLabel_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)resolveSimLabel:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CTCellularPlanManager resolveSimLabel:]";
    _os_log_impl(&dword_1DB90D000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x3052000000;
  char v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  uint64_t v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__CTCellularPlanManager_resolveSimLabel___block_invoke;
  v10[3] = &unk_1E6C1F1B8;
  v10[4] = &buf;
  id v6 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__CTCellularPlanManager_resolveSimLabel___block_invoke_2;
  v9[3] = &unk_1E6C1F1B8;
  v9[4] = &buf;
  [v6 resolveSimLabel:a3 completion:v9];
  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v7;
}

id __41__CTCellularPlanManager_resolveSimLabel___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __41__CTCellularPlanManager_resolveSimLabel___block_invoke_2(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)remapSimLabel:(id)a3 to:(id)a4 completion:(id)a5
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke;
  v6[3] = &unk_1E6C1F258;
  v6[4] = self;
  void v6[5] = a3;
  void v6[6] = a4;
  void v6[7] = a5;
  dispatch_async(queue, v6);
}

uint64_t __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "remapSimLabel", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_270;
  v9[3] = &unk_1E6C1EE00;
  v9[4] = *(void *)(a1 + 56);
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v9];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_3;
  v8[3] = &unk_1E6C1EE00;
  void v8[4] = *(void *)(a1 + 56);
  return [v4 remapSimLabel:v5 to:v6 completion:v8];
}

void __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_270(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_2;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_4;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __53__CTCellularPlanManager_remapSimLabel_to_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)remapSimLabel:(id)a3 to:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = CellularPlanLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CTCellularPlanManager remapSimLabel:to:]";
    _os_log_impl(&dword_1DB90D000, v7, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  uint64_t v17 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__CTCellularPlanManager_remapSimLabel_to___block_invoke;
  v12[3] = &unk_1E6C1F1B8;
  v12[4] = &buf;
  id v8 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__CTCellularPlanManager_remapSimLabel_to___block_invoke_2;
  v11[3] = &unk_1E6C1F1B8;
  v11[4] = &buf;
  [v8 remapSimLabel:a3 to:a4 completion:v11];
  id v9 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v9;
}

id __42__CTCellularPlanManager_remapSimLabel_to___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __42__CTCellularPlanManager_remapSimLabel_to___block_invoke_2(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)carrierItemsShouldUpdate:(BOOL)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke;
  block[3] = &unk_1E6C1F190;
  block[4] = self;
  void block[5] = a4;
  BOOL v6 = a3;
  dispatch_async(queue, block);
}

uint64_t __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "carrierItemsShouldUpdate", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_271;
  v8[3] = &unk_1E6C1EE00;
  void v8[4] = *(void *)(a1 + 40);
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_2;
  v7[3] = &unk_1E6C1F140;
  v7[4] = *(void *)(a1 + 40);
  return [v4 carrierItemsShouldUpdate:v5 completion:v7];
}

void __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_271(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "Error getting carrier items %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_272;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_272(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_3;
  block[3] = &unk_1E6C1F118;
  uint64_t v7 = *(void *)(a1 + 32);
  void block[5] = a3;
  void block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

uint64_t __61__CTCellularPlanManager_carrierItemsShouldUpdate_completion___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)didSelectPlanItem:(id)a3 isEnable:(BOOL)a4 completion:(id)a5
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke;
  v6[3] = &unk_1E6C1F2D0;
  BOOL v7 = a4;
  void v6[5] = a3;
  void v6[6] = a5;
  v6[4] = self;
  dispatch_async(queue, v6);
}

uint64_t __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 56);
    *(_DWORD *)long long buf = 67109120;
    int v12 = v3;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "didSelectPlanItem enable: %d", buf, 8u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_273;
  v10[3] = &unk_1E6C1EE00;
  v10[4] = *(void *)(a1 + 48);
  uint64_t v5 = (void *)[v4 remoteObjectProxyWithErrorHandler:v10];
  uint64_t v6 = *(unsigned __int8 *)(a1 + 56);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_3;
  v9[3] = &unk_1E6C1F2A8;
  uint64_t v7 = *(void *)(a1 + 40);
  v9[4] = *(void *)(a1 + 48);
  return [v5 didSelectPlanItem:v7 enable:v6 completion:v9];
}

void __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_273(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_2;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "didselect completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_274;
  block[3] = &unk_1E6C1F280;
  uint64_t v8 = *(void *)(a1 + 32);
  char v10 = a2;
  block[4] = a3;
  void block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __63__CTCellularPlanManager_didSelectPlanItem_isEnable_completion___block_invoke_274(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)didSelectPlanItem:(id)a3 isEnable:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = CellularPlanLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CTCellularPlanManager didSelectPlanItem:isEnable:]";
    _os_log_impl(&dword_1DB90D000, v7, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  uint64_t v17 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__CTCellularPlanManager_didSelectPlanItem_isEnable___block_invoke;
  v12[3] = &unk_1E6C1F1B8;
  v12[4] = &buf;
  id v8 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __52__CTCellularPlanManager_didSelectPlanItem_isEnable___block_invoke_2;
  v11[3] = &unk_1E6C1F2F8;
  v11[4] = &buf;
  [v8 didSelectPlanItem:a3 enable:v4 completion:v11];
  id v9 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v9;
}

id __52__CTCellularPlanManager_didSelectPlanItem_isEnable___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __52__CTCellularPlanManager_didSelectPlanItem_isEnable___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "didselect completion, was successful: %d", (uint8_t *)v8, 8u);
  }
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)didSelectPlanForData:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "didselectplanfordata", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  int v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_276;
  v8[3] = &unk_1E6C1EE00;
  void v8[4] = *(void *)(a1 + 48);
  BOOL v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_3;
  v7[3] = &unk_1E6C1F2A8;
  uint64_t v5 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 48);
  return [v4 didSelectPlanForData:v5 completion:v7];
}

void __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_276(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_2;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "didselectplanfordata completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_277;
  block[3] = &unk_1E6C1F280;
  uint64_t v8 = *(void *)(a1 + 32);
  char v10 = a2;
  block[4] = a3;
  void block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __57__CTCellularPlanManager_didSelectPlanForData_completion___block_invoke_277(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)didSelectPlanForData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CTCellularPlanManager didSelectPlanForData:]";
    _os_log_impl(&dword_1DB90D000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  uint64_t v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__CTCellularPlanManager_didSelectPlanForData___block_invoke;
  v10[3] = &unk_1E6C1F1B8;
  v10[4] = &buf;
  id v6 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__CTCellularPlanManager_didSelectPlanForData___block_invoke_2;
  v9[3] = &unk_1E6C1F2F8;
  v9[4] = &buf;
  [v6 didSelectPlanForData:a3 completion:v9];
  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v7;
}

id __46__CTCellularPlanManager_didSelectPlanForData___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __46__CTCellularPlanManager_didSelectPlanForData___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "didselectplanfordata completion, was successful: %d", (uint8_t *)v8, 8u);
  }
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (id)didEnablePlanItems:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CTCellularPlanManager didEnablePlanItems:]";
    _os_log_impl(&dword_1DB90D000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  uint64_t v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__CTCellularPlanManager_didEnablePlanItems___block_invoke;
  v10[3] = &unk_1E6C1F1B8;
  v10[4] = &buf;
  id v6 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__CTCellularPlanManager_didEnablePlanItems___block_invoke_2;
  v9[3] = &unk_1E6C1F1B8;
  v9[4] = &buf;
  [v6 didEnablePlanItems:a3 completion:v9];
  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v7;
}

id __44__CTCellularPlanManager_didEnablePlanItems___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

void *__44__CTCellularPlanManager_didEnablePlanItems___block_invoke_2(void *result, void *a2)
{
  if (a2)
  {
    v2 = result;
    id result = a2;
    *(void *)(*(void *)(v2[4] + 8) + 40) = result;
  }
  return result;
}

- (id)setLabelForPlan:(id)a3 label:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = CellularPlanLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CTCellularPlanManager setLabelForPlan:label:]";
    _os_log_impl(&dword_1DB90D000, v7, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  uint64_t v17 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__CTCellularPlanManager_setLabelForPlan_label___block_invoke;
  v12[3] = &unk_1E6C1F1B8;
  v12[4] = &buf;
  id v8 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__CTCellularPlanManager_setLabelForPlan_label___block_invoke_2;
  v11[3] = &unk_1E6C1F2F8;
  v11[4] = &buf;
  [v8 setLabelForPlan:a3 label:a4 completion:v11];
  id v9 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v9;
}

id __47__CTCellularPlanManager_setLabelForPlan_label___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __47__CTCellularPlanManager_setLabelForPlan_label___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)didSelectPlanForDefaultVoice:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "didSelectPlanForDefaultVoice", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  int v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_278;
  v8[3] = &unk_1E6C1EE00;
  void v8[4] = *(void *)(a1 + 48);
  BOOL v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_3;
  v7[3] = &unk_1E6C1F2A8;
  uint64_t v5 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 48);
  return [v4 didSelectPlanForDefaultVoice:v5 completion:v7];
}

void __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_278(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_2;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  id v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "didSelectPlanForDefaultVoice completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_279;
  block[3] = &unk_1E6C1F280;
  uint64_t v8 = *(void *)(a1 + 32);
  char v10 = a2;
  block[4] = a3;
  void block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __65__CTCellularPlanManager_didSelectPlanForDefaultVoice_completion___block_invoke_279(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)didSelectPlanForDefaultVoice:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CTCellularPlanManager didSelectPlanForDefaultVoice:]";
    _os_log_impl(&dword_1DB90D000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  uint64_t v15 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__CTCellularPlanManager_didSelectPlanForDefaultVoice___block_invoke;
  v10[3] = &unk_1E6C1F1B8;
  v10[4] = &buf;
  id v6 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__CTCellularPlanManager_didSelectPlanForDefaultVoice___block_invoke_2;
  v9[3] = &unk_1E6C1F2F8;
  v9[4] = &buf;
  [v6 didSelectPlanForDefaultVoice:a3 completion:v9];
  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v7;
}

id __54__CTCellularPlanManager_didSelectPlanForDefaultVoice___block_invoke(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

id __54__CTCellularPlanManager_didSelectPlanForDefaultVoice___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "didSelectPlanForDefaultVoice completion, was successful: %d", (uint8_t *)v8, 8u);
  }
  id result = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)didSelectPlansForIMessage:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    char v10 = "-[CTCellularPlanManager didSelectPlansForIMessage:completion:]_block_invoke";
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  int v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_280;
  v8[3] = &unk_1E6C1EE00;
  void v8[4] = *(void *)(a1 + 48);
  BOOL v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_3;
  v7[3] = &unk_1E6C1F2A8;
  uint64_t v5 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 48);
  return [v4 didSelectPlansForIMessage:v5 completion:v7];
}

void __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_280(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_2;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  id v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "didSelectPlansForIMessage completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_281;
  block[3] = &unk_1E6C1F280;
  uint64_t v8 = *(void *)(a1 + 32);
  char v10 = a2;
  block[4] = a3;
  void block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __62__CTCellularPlanManager_didSelectPlansForIMessage_completion___block_invoke_281(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)didPurchasePlanWithIccid:(id)a3 downloadProfile:(BOOL)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CTCellularPlanManager_didPurchasePlanWithIccid_downloadProfile___block_invoke;
  block[3] = &unk_1E6C1F320;
  block[4] = self;
  void block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(queue, block);
}

uint64_t __66__CTCellularPlanManager_didPurchasePlanWithIccid_downloadProfile___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_283];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  return [v2 didPurchasePlanWithIccid:v3 downloadProfile:v4];
}

- (void)didDeletePlanItem:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "Delete plan", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_284;
  v8[3] = &unk_1E6C1EE00;
  void v8[4] = *(void *)(a1 + 48);
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_3;
  v7[3] = &unk_1E6C1F2A8;
  uint64_t v5 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 48);
  return [v4 didDeletePlanItem:v5 completion:v7];
}

void __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_284(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_2;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  BOOL v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "Delete Plan completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_285;
  block[3] = &unk_1E6C1F280;
  uint64_t v8 = *(void *)(a1 + 32);
  char v10 = a2;
  block[4] = a3;
  void block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __54__CTCellularPlanManager_didDeletePlanItem_completion___block_invoke_285(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)eraseAllPlans:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__CTCellularPlanManager_eraseAllPlans___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __39__CTCellularPlanManager_eraseAllPlans___block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "Erase All Plans", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__CTCellularPlanManager_eraseAllPlans___block_invoke_286;
  v7[3] = &unk_1E6C1EE00;
  v7[4] = *(void *)(a1 + 40);
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CTCellularPlanManager_eraseAllPlans___block_invoke_3;
  v6[3] = &unk_1E6C1F2A8;
  v6[4] = *(void *)(a1 + 40);
  return [v4 eraseAllPlansWithCompletion:v6];
}

void __39__CTCellularPlanManager_eraseAllPlans___block_invoke_286(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CTCellularPlanManager_eraseAllPlans___block_invoke_2;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __39__CTCellularPlanManager_eraseAllPlans___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __39__CTCellularPlanManager_eraseAllPlans___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  BOOL v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "Erase All Plans completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CTCellularPlanManager_eraseAllPlans___block_invoke_287;
  block[3] = &unk_1E6C1F280;
  uint64_t v8 = *(void *)(a1 + 32);
  char v10 = a2;
  block[4] = a3;
  void block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __39__CTCellularPlanManager_eraseAllPlans___block_invoke_287(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)eraseAllRemotePlansWithCSN:(id)a3 completion:(id)a4
{
}

- (void)didPurchasePlanForCsn:(id)a3 iccid:(id)a4 profileServer:(id)a5 state:(id)a6
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = CellularPlanLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v15 = "-[CTCellularPlanManager didPurchasePlanForCsn:iccid:profileServer:state:]";
    _os_log_impl(&dword_1DB90D000, v11, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__CTCellularPlanManager_didPurchasePlanForCsn_iccid_profileServer_state___block_invoke;
  block[3] = &unk_1E6C1F348;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  void block[8] = a6;
  dispatch_async(queue, block);
}

uint64_t __73__CTCellularPlanManager_didPurchasePlanForCsn_iccid_profileServer_state___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_289];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  return [v2 didPurchasePlanForCsn:v3 iccid:v4 profileServer:v5 state:v6];
}

void __73__CTCellularPlanManager_didPurchasePlanForCsn_iccid_profileServer_state___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting proxy %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didPurchasePlanForCarrier:(id)a3 mnc:(id)a4 gid1:(id)a5 gid2:(id)a6 state:(id)a7
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = CellularPlanLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v17 = "-[CTCellularPlanManager didPurchasePlanForCarrier:mnc:gid1:gid2:state:]";
    _os_log_impl(&dword_1DB90D000, v13, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__CTCellularPlanManager_didPurchasePlanForCarrier_mnc_gid1_gid2_state___block_invoke;
  v15[3] = &unk_1E6C1F370;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = a5;
  v15[8] = a6;
  v15[9] = a7;
  dispatch_async(queue, v15);
}

uint64_t __71__CTCellularPlanManager_didPurchasePlanForCarrier_mnc_gid1_gid2_state___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_291];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  return [v2 didPurchasePlanForCarrier:v3 mnc:v4 gid1:v5 gid2:v6 state:v7];
}

void __71__CTCellularPlanManager_didPurchasePlanForCarrier_mnc_gid1_gid2_state___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting proxy %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)didTransferPlanForCsn:(id)a3 iccid:(id)a4 srcIccid:(id)a5 profileServer:(id)a6 state:(id)a7
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = CellularPlanLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v17 = "-[CTCellularPlanManager didTransferPlanForCsn:iccid:srcIccid:profileServer:state:]";
    _os_log_impl(&dword_1DB90D000, v13, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__CTCellularPlanManager_didTransferPlanForCsn_iccid_srcIccid_profileServer_state___block_invoke;
  v15[3] = &unk_1E6C1F370;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a4;
  v15[7] = a5;
  v15[8] = a6;
  v15[9] = a7;
  dispatch_async(queue, v15);
}

uint64_t __82__CTCellularPlanManager_didTransferPlanForCsn_iccid_srcIccid_profileServer_state___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_293];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = *(void *)(a1 + 72);
  return [v2 didTransferPlanForCsn:v3 iccid:v4 srcIccid:v5 profileServer:v6 state:v7];
}

void __82__CTCellularPlanManager_didTransferPlanForCsn_iccid_srcIccid_profileServer_state___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting proxy %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setUserInPurchaseFlow:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__CTCellularPlanManager_setUserInPurchaseFlow___block_invoke;
  v4[3] = &unk_1E6C1F398;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __47__CTCellularPlanManager_setUserInPurchaseFlow___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_295];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return [v2 setUserInPurchaseFlow:v3];
}

- (void)expirePlan
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CTCellularPlanManager_expirePlan__block_invoke;
  block[3] = &unk_1E6C1ED88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__CTCellularPlanManager_expirePlan__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_297];
  return [v2 expirePlan];
}

void __35__CTCellularPlanManager_expirePlan__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)isRemotePlanCapableWithContext:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_2;
  v7[3] = &unk_1E6C1EE00;
  v7[4] = *(void *)(a1 + 48);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_2_299;
  v6[3] = &unk_1E6C1EEA0;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 48);
  return [v3 isRemotePlanCapableWithContext:v4 completion:v6];
}

void __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_2(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_298;
  block[3] = &unk_1E6C1EE50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_298(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_2_299(uint64_t a1, char a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_3;
  v5[3] = &unk_1E6C1EE78;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __67__CTCellularPlanManager_isRemotePlanCapableWithContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)shouldShowAddNewRemotePlanWithContext:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_2;
  v7[3] = &unk_1E6C1EE00;
  v7[4] = *(void *)(a1 + 48);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_2_301;
  v6[3] = &unk_1E6C1F3E8;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 48);
  return [v3 shouldShowAddNewRemotePlanWithContext:v4 completion:v6];
}

void __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_300;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_300(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, 0, *(void *)(a1 + 32));
}

void __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_2_301(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_3;
  block[3] = &unk_1E6C1F3C0;
  uint64_t v11 = *(void *)(a1 + 32);
  char v13 = a2;
  void block[6] = v11;
  void block[7] = a3;
  block[4] = a4;
  void block[5] = a5;
  dispatch_async(global_queue, block);
}

uint64_t __74__CTCellularPlanManager_shouldShowAddNewRemotePlanWithContext_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(void *)(a1 + 56), *(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (void)startRemoteProvisioningForCSN:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke;
  v5[3] = &unk_1E6C1EEC8;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(queue, v5);
}

uint64_t __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_2;
  v6[3] = &unk_1E6C1EE00;
  v6[4] = *(void *)(a1 + 40);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_2_304;
  v5[3] = &unk_1E6C1EEA0;
  v5[4] = *(void *)(a1 + 40);
  return [v3 startRemoteProvisioningWithCompletion:v5];
}

void __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_2(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_303;
  block[3] = &unk_1E6C1EE50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_303(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_2_304(uint64_t a1, char a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_3;
  v5[3] = &unk_1E6C1EE78;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __66__CTCellularPlanManager_startRemoteProvisioningForCSN_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)finishRemoteProvisioningForCSN:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke;
  v5[3] = &unk_1E6C1EEC8;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(queue, v5);
}

uint64_t __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_2;
  v6[3] = &unk_1E6C1EE00;
  v6[4] = *(void *)(a1 + 40);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_2_306;
  v5[3] = &unk_1E6C1EEA0;
  v5[4] = *(void *)(a1 + 40);
  return [v3 finishRemoteProvisioningWithCompletion:v5];
}

void __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_2(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_305;
  block[3] = &unk_1E6C1EE50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_305(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_2_306(uint64_t a1, char a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_3;
  v5[3] = &unk_1E6C1EE78;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __67__CTCellularPlanManager_finishRemoteProvisioningForCSN_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)manageAccountForRemotePlan:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_2;
  v7[3] = &unk_1E6C1EE00;
  v7[4] = *(void *)(a1 + 48);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_2_308;
  v6[3] = &unk_1E6C1F2A8;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 48);
  return [v3 manageAccountForRemotePlan:v4 completion:v6];
}

void __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_307;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_307(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_2_308(uint64_t a1, char a2, uint64_t a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_3;
  block[3] = &unk_1E6C1F280;
  uint64_t v7 = *(void *)(a1 + 32);
  char v9 = a2;
  block[4] = a3;
  void block[5] = v7;
  dispatch_async(global_queue, block);
}

uint64_t __63__CTCellularPlanManager_manageAccountForRemotePlan_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)addNewRemotePlan:(BOOL)a3 withCSN:(id)a4 withContext:(id)a5 userConsent:(int64_t)a6 completion:(id)a7
{
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke;
  v8[3] = &unk_1E6C1F410;
  BOOL v9 = a3;
  void v8[4] = self;
  void v8[5] = a4;
  v8[6] = a5;
  v8[7] = a7;
  v8[8] = a6;
  dispatch_async(queue, v8);
}

uint64_t __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_2;
  v10[3] = &unk_1E6C1EE00;
  v10[4] = *(void *)(a1 + 56);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v10];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_2_310;
  v9[3] = &unk_1E6C1EE00;
  uint64_t v7 = *(void *)(a1 + 64);
  v9[4] = *(void *)(a1 + 56);
  return [v3 addNewRemotePlan:v4 withCSN:v5 withContext:v6 userConsent:v7 completion:v9];
}

void __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_309;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_309(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_2_310(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_3;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __85__CTCellularPlanManager_addNewRemotePlan_withCSN_withContext_userConsent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addNewRemotePlanWithCardData:(id)a3 confirmationCode:(id)a4 isPairing:(BOOL)a5 withCSN:(id)a6 withContext:(id)a7 userConsent:(int64_t)a8 completion:(id)a9
{
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke;
  v10[3] = &unk_1E6C1F438;
  v10[4] = self;
  void v10[5] = a3;
  BOOL v11 = a5;
  v10[6] = a4;
  v10[7] = a6;
  v10[8] = a7;
  v10[9] = a9;
  v10[10] = a8;
  dispatch_async(queue, v10);
}

uint64_t __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2;
  v12[3] = &unk_1E6C1EE00;
  v12[4] = *(void *)(a1 + 72);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v12];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2_312;
  v11[3] = &unk_1E6C1EE00;
  uint64_t v9 = *(void *)(a1 + 80);
  v11[4] = *(void *)(a1 + 72);
  return [v3 addNewRemotePlanWithCardData:v4 confirmationCode:v5 isPairing:v6 withCSN:v7 withContext:v8 userConsent:v9 completion:v11];
}

void __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_311;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_311(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2_312(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_3;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __124__CTCellularPlanManager_addNewRemotePlanWithCardData_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)addNewRemotePlanWithAddress:(id)a3 matchingId:(id)a4 oid:(id)a5 confirmationCode:(id)a6 isPairing:(BOOL)a7 withCSN:(id)a8 withContext:(id)a9 userConsent:(int64_t)a10 completion:(id)a11
{
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke;
  v12[3] = &unk_1E6C1F460;
  v12[4] = self;
  void v12[5] = a3;
  v12[6] = a4;
  v12[7] = a5;
  BOOL v13 = a7;
  v12[8] = a6;
  v12[9] = a8;
  v12[10] = a9;
  v12[11] = a11;
  v12[12] = a10;
  dispatch_async(queue, v12);
}

uint64_t __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2;
  v14[3] = &unk_1E6C1EE00;
  v14[4] = *(void *)(a1 + 88);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v14];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 104);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2_314;
  v13[3] = &unk_1E6C1EE00;
  uint64_t v11 = *(void *)(a1 + 96);
  v13[4] = *(void *)(a1 + 88);
  return [v3 addNewRemotePlanWithAddress:v4 matchingId:v5 oid:v6 confirmationCode:v7 isPairing:v8 withCSN:v9 withContext:v10 userConsent:v11 completion:v13];
}

void __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1();
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_313;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_313(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_2_314(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_3;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __138__CTCellularPlanManager_addNewRemotePlanWithAddress_matchingId_oid_confirmationCode_isPairing_withCSN_withContext_userConsent_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)remotePlanItemsWithCompletion:(id)a3
{
}

- (void)remotePlanItemsWithUpdateFetch:(BOOL)a3 withCSN:(id)a4 completion:(id)a5
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke;
  block[3] = &unk_1E6C1F190;
  block[4] = self;
  void block[5] = a5;
  BOOL v7 = a3;
  dispatch_async(queue, block);
}

uint64_t __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_2;
  v7[3] = &unk_1E6C1EE00;
  v7[4] = *(void *)(a1 + 40);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v7];
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_4;
  v6[3] = &unk_1E6C1F140;
  v6[4] = *(void *)(a1 + 40);
  return [v3 remotePlanItemsWithUpdateFetch:v4 completion:v6];
}

void __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_3;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_5;
  block[3] = &unk_1E6C1F118;
  uint64_t v7 = *(void *)(a1 + 32);
  void block[5] = a3;
  void block[6] = v7;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

uint64_t __75__CTCellularPlanManager_remotePlanItemsWithUpdateFetch_withCSN_completion___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)didSelectRemotePlanItem:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "proxy_select", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_315;
  v8[3] = &unk_1E6C1EE00;
  void v8[4] = *(void *)(a1 + 48);
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_3;
  v7[3] = &unk_1E6C1F2A8;
  uint64_t v5 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 48);
  return [v4 didSelectRemotePlanItem:v5 completion:v7];
}

void __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_315(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_2;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "proxy_select completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_316;
  block[3] = &unk_1E6C1F280;
  uint64_t v8 = *(void *)(a1 + 32);
  char v10 = a2;
  block[4] = a3;
  void block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __60__CTCellularPlanManager_didSelectRemotePlanItem_completion___block_invoke_316(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)didDeleteRemotePlanItem:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "proxy_delete", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_317;
  v8[3] = &unk_1E6C1EE00;
  void v8[4] = *(void *)(a1 + 48);
  uint64_t v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v8];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_3;
  v7[3] = &unk_1E6C1F2A8;
  uint64_t v5 = *(void *)(a1 + 40);
  v7[4] = *(void *)(a1 + 48);
  return [v4 didDeleteRemotePlanItem:v5 completion:v7];
}

void __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_317(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_2;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "proxy_delete completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_318;
  block[3] = &unk_1E6C1F280;
  uint64_t v8 = *(void *)(a1 + 32);
  char v10 = a2;
  block[4] = a3;
  void block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __60__CTCellularPlanManager_didDeleteRemotePlanItem_completion___block_invoke_318(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)fetchRemoteProfiles:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__CTCellularPlanManager_fetchRemoteProfiles___block_invoke;
  v4[3] = &unk_1E6C1EDB0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __45__CTCellularPlanManager_fetchRemoteProfiles___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_320];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 fetchRemoteProfiles:v3];
}

void __45__CTCellularPlanManager_fetchRemoteProfiles___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getAutoPlanSelectionWithCompletion:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __60__CTCellularPlanManager_getAutoPlanSelectionWithCompletion___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __60__CTCellularPlanManager_getAutoPlanSelectionWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_322];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 getAutoPlanSelectionWithCompletion:v3];
}

void __60__CTCellularPlanManager_getAutoPlanSelectionWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setAutoPlanSelection:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__CTCellularPlanManager_setAutoPlanSelection___block_invoke;
  v4[3] = &unk_1E6C1F398;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __46__CTCellularPlanManager_setAutoPlanSelection___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_324];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return [v2 setAutoPlanSelection:v3];
}

void __46__CTCellularPlanManager_setAutoPlanSelection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getRoamingSignupOverrideWithCompletion:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64__CTCellularPlanManager_getRoamingSignupOverrideWithCompletion___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __64__CTCellularPlanManager_getRoamingSignupOverrideWithCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_326];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 getRoamingSignupOverrideWithCompletion:v3];
}

void __64__CTCellularPlanManager_getRoamingSignupOverrideWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setRoamingSignupOverride:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__CTCellularPlanManager_setRoamingSignupOverride___block_invoke;
  v4[3] = &unk_1E6C1F398;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __50__CTCellularPlanManager_setRoamingSignupOverride___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_328];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return [v2 setRoamingSignupOverride:v3];
}

void __50__CTCellularPlanManager_setRoamingSignupOverride___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getSkipEligibilityCheck:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__CTCellularPlanManager_getSkipEligibilityCheck___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __49__CTCellularPlanManager_getSkipEligibilityCheck___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_330];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 getSkipEligibilityCheck:v3];
}

void __49__CTCellularPlanManager_getSkipEligibilityCheck___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)setSkipEligibilityCheck:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__CTCellularPlanManager_setSkipEligibilityCheck___block_invoke;
  v4[3] = &unk_1E6C1F398;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __49__CTCellularPlanManager_setSkipEligibilityCheck___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_332];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  return [v2 setSkipEligibilityCheck:v3];
}

void __49__CTCellularPlanManager_setSkipEligibilityCheck___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)selectRemoteProfile:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__CTCellularPlanManager_selectRemoteProfile___block_invoke;
  v4[3] = &unk_1E6C1EDB0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __45__CTCellularPlanManager_selectRemoteProfile___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_334];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 selectRemoteProfile:v3];
}

void __45__CTCellularPlanManager_selectRemoteProfile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)deleteRemoteProfile:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__CTCellularPlanManager_deleteRemoteProfile___block_invoke;
  v4[3] = &unk_1E6C1EDB0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __45__CTCellularPlanManager_deleteRemoteProfile___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_336];
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 deleteRemoteProfile:v3];
}

void __45__CTCellularPlanManager_deleteRemoteProfile___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)deleteAllRemoteProfiles
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__CTCellularPlanManager_deleteAllRemoteProfiles__block_invoke;
  block[3] = &unk_1E6C1ED88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __48__CTCellularPlanManager_deleteAllRemoteProfiles__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_338];
  return [v2 deleteAllRemoteProfiles];
}

void __48__CTCellularPlanManager_deleteAllRemoteProfiles__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting device info %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)getRemoteInfo:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__CTCellularPlanManager_getRemoteInfo___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __39__CTCellularPlanManager_getRemoteInfo___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CTCellularPlanManager_getRemoteInfo___block_invoke_2;
  v6[3] = &unk_1E6C1EE00;
  v6[4] = *(void *)(a1 + 40);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__CTCellularPlanManager_getRemoteInfo___block_invoke_2_340;
  v5[3] = &unk_1E6C1F488;
  v5[4] = *(void *)(a1 + 40);
  return [v3 getRemoteInfo:v5];
}

void __39__CTCellularPlanManager_getRemoteInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "Error getting device info %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__CTCellularPlanManager_getRemoteInfo___block_invoke_339;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __39__CTCellularPlanManager_getRemoteInfo___block_invoke_339(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __39__CTCellularPlanManager_getRemoteInfo___block_invoke_2_340(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "getRemoteInfo completed", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CTCellularPlanManager_getRemoteInfo___block_invoke_341;
  block[3] = &unk_1E6C1F118;
  uint64_t v8 = *(void *)(a1 + 32);
  void block[5] = a3;
  void block[6] = v8;
  block[4] = a2;
  dispatch_async(global_queue, block);
}

uint64_t __39__CTCellularPlanManager_getRemoteInfo___block_invoke_341(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getPhoneAuthTokenWithMessage:(id)a3 completion:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke;
  block[3] = &unk_1E6C1F028;
  void block[5] = a3;
  void block[6] = a4;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_2;
  v7[3] = &unk_1E6C1EE00;
  v7[4] = *(void *)(a1 + 48);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_2_344;
  v6[3] = &unk_1E6C1F4B0;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 48);
  return [v3 getPhoneAuthTokenWithMessage:v4 completion:v6];
}

void __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v9 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "Error getting device info %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_343;
  v7[3] = &unk_1E6C1EEF0;
  uint64_t v6 = *(void *)(a1 + 32);
  v7[4] = a2;
  void v7[5] = v6;
  dispatch_async(global_queue, v7);
}

uint64_t __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_343(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32) != 0);
}

void __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_2_344(uint64_t a1, uint64_t a2, char a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_3;
  block[3] = &unk_1E6C1F280;
  uint64_t v7 = *(void *)(a1 + 32);
  block[4] = a2;
  void block[5] = v7;
  char v9 = a3;
  dispatch_async(global_queue, block);
}

uint64_t __65__CTCellularPlanManager_getPhoneAuthTokenWithMessage_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (void)didPurchaseRemotePlanForEid:(id)a3 imei:(id)a4 meid:(id)a5 iccid:(id)a6 alternateSmdpFqdn:(id)a7 completion:(id)a8
{
  uint64_t v15 = CellularPlanLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v15, OS_LOG_TYPE_INFO, "didPurchaseRemotePlanForEid", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke;
  block[3] = &unk_1E6C1F4D8;
  void block[9] = a7;
  block[10] = a8;
  block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  void block[7] = a5;
  void block[8] = a6;
  dispatch_async(queue, block);
}

uint64_t __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_2;
  v11[3] = &unk_1E6C1EE00;
  v11[4] = *(void *)(a1 + 80);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v11];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_2_347;
  v10[3] = &unk_1E6C1EEA0;
  uint64_t v8 = *(void *)(a1 + 72);
  v10[4] = *(void *)(a1 + 80);
  return [v3 didPurchaseRemotePlanForEid:v4 imei:v5 meid:v6 iccid:v7 alternateSmdpFqdn:v8 completion:v10];
}

void __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = CellularPlanLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v8 = a2;
    _os_log_impl(&dword_1DB90D000, v4, OS_LOG_TYPE_INFO, "Error getting proxy %@", buf, 0xCu);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_346;
  block[3] = &unk_1E6C1EE50;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_346(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_2_347(uint64_t a1, char a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_3;
  v5[3] = &unk_1E6C1EE78;
  v5[4] = *(void *)(a1 + 32);
  char v6 = a2;
  dispatch_async(global_queue, v5);
}

uint64_t __98__CTCellularPlanManager_didPurchaseRemotePlanForEid_imei_meid_iccid_alternateSmdpFqdn_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)didCancelRemotePlan
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v7 = "-[CTCellularPlanManager didCancelRemotePlan]";
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__CTCellularPlanManager_didCancelRemotePlan__block_invoke;
  block[3] = &unk_1E6C1ED88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __44__CTCellularPlanManager_didCancelRemotePlan__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_349];
  return [v2 didCancelRemotePlan];
}

void __44__CTCellularPlanManager_didCancelRemotePlan__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting proxy %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)pendingReleaseRemotePlan
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v7 = "-[CTCellularPlanManager pendingReleaseRemotePlan]";
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__CTCellularPlanManager_pendingReleaseRemotePlan__block_invoke;
  block[3] = &unk_1E6C1ED88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__CTCellularPlanManager_pendingReleaseRemotePlan__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_351];
  return [v2 pendingReleaseRemotePlan];
}

void __49__CTCellularPlanManager_pendingReleaseRemotePlan__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting proxy %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)userSignupInitiatedOrFailed
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v7 = "-[CTCellularPlanManager userSignupInitiatedOrFailed]";
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__CTCellularPlanManager_userSignupInitiatedOrFailed__block_invoke;
  block[3] = &unk_1E6C1ED88;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__CTCellularPlanManager_userSignupInitiatedOrFailed__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 16) remoteObjectProxyWithErrorHandler:&__block_literal_global_353];
  return [v2 userSignupInitiatedOrFailed];
}

void __52__CTCellularPlanManager_userSignupInitiatedOrFailed__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "Error getting proxy %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)eraseAllRemotePlansWithCompletion:(id)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke;
  v4[3] = &unk_1E6C1EEC8;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke(uint64_t a1)
{
  v2 = CellularPlanLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v2, OS_LOG_TYPE_INFO, "prxoy_erase_remote_plans", buf, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_354;
  v7[3] = &unk_1E6C1EE00;
  v7[4] = *(void *)(a1 + 40);
  int v4 = (void *)[v3 remoteObjectProxyWithErrorHandler:v7];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_3;
  v6[3] = &unk_1E6C1F2A8;
  v6[4] = *(void *)(a1 + 40);
  return [v4 eraseAllRemotePlansWithCompletion:v6];
}

void __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_354(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_2;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6 = CellularPlanLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1DB90D000, v6, OS_LOG_TYPE_INFO, "proxy_erase_remote_plans completion", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_355;
  block[3] = &unk_1E6C1F280;
  uint64_t v8 = *(void *)(a1 + 32);
  char v10 = a2;
  block[4] = a3;
  void block[5] = v8;
  dispatch_async(global_queue, block);
}

uint64_t __59__CTCellularPlanManager_eraseAllRemotePlansWithCompletion___block_invoke_355(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (id)getPredefinedLabels
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = CellularPlanLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[CTCellularPlanManager getPredefinedLabels]";
    _os_log_impl(&dword_1DB90D000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&buf, 0xCu);
  }
  id v4 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:&__block_literal_global_357];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v9 = 0x3052000000;
  char v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  uint64_t v12 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CTCellularPlanManager_getPredefinedLabels__block_invoke_2;
  v7[3] = &unk_1E6C1F168;
  v7[4] = &buf;
  [v4 getPredefinedLabels:v7];
  id v5 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v5;
}

id __44__CTCellularPlanManager_getPredefinedLabels__block_invoke_2(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (void)userDidProvideResponse:(int64_t)a3 confirmationCode:(id)a4 forPlan:(id)a5 isRemote:(BOOL)a6 completion:(id)a7
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = CellularPlanLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134218242;
    int64_t v18 = a3;
    __int16 v19 = 2112;
    id v20 = a4;
    _os_log_impl(&dword_1DB90D000, v13, OS_LOG_TYPE_INFO, "userDidProvideResponse: consent response: %ld, confirmation code: %@", buf, 0x16u);
  }
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke;
  v15[3] = &unk_1E6C1F410;
  BOOL v16 = a6;
  v15[7] = a7;
  v15[8] = a3;
  v15[4] = self;
  v15[5] = a4;
  v15[6] = a5;
  dispatch_async(queue, v15);
}

uint64_t __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_ensureConnected_sync");
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_2;
  v10[3] = &unk_1E6C1EE00;
  v10[4] = *(void *)(a1 + 56);
  uint64_t v3 = (void *)[v2 remoteObjectProxyWithErrorHandler:v10];
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  if (*(unsigned char *)(a1 + 72))
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_4;
    v9[3] = &unk_1E6C1F2A8;
    v9[4] = *(void *)(a1 + 56);
    return [v3 remoteUserDidProvideResponse:v4 == 0 confirmationCode:v5 plan:v6 completion:v9];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    _DWORD v8[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_6;
    v8[3] = &unk_1E6C1F2A8;
    void v8[4] = *(void *)(a1 + 56);
    return [v3 userDidProvideResponse:v4 confirmationCode:v5 plan:v6 completion:v8];
  }
}

void __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  global_queue = dispatch_get_global_queue(0, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_3;
  v6[3] = &unk_1E6C1EEF0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  void v6[5] = v5;
  dispatch_async(global_queue, v6);
}

uint64_t __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_4(uint64_t a1, char a2, uint64_t a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_5;
  block[3] = &unk_1E6C1F280;
  uint64_t v7 = *(void *)(a1 + 32);
  char v9 = a2;
  block[4] = a3;
  void block[5] = v7;
  dispatch_async(global_queue, block);
}

uint64_t __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_6(uint64_t a1, char a2, uint64_t a3)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_7;
  block[3] = &unk_1E6C1F280;
  uint64_t v7 = *(void *)(a1 + 32);
  char v9 = a2;
  block[4] = a3;
  void block[5] = v7;
  dispatch_async(global_queue, block);
}

uint64_t __93__CTCellularPlanManager_userDidProvideResponse_confirmationCode_forPlan_isRemote_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)userDidProvideConsentResponse:(int64_t)a3 forPlan:(id)a4 isRemote:(BOOL)a5 completion:(id)a6
{
}

- (id)getSubscriptionContextUUIDforPlan:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_1DB90D000, v5, OS_LOG_TYPE_INFO, "getSubscriptionContextUUIDforPlan: %@", (uint8_t *)&buf, 0xCu);
  }
  id v6 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:&__block_literal_global_359];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  uint64_t v15 = 0;
  uint64_t v7 = [a3 iccid];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__CTCellularPlanManager_getSubscriptionContextUUIDforPlan___block_invoke_2;
  v10[3] = &unk_1E6C1F500;
  v10[4] = &buf;
  [v6 getSubscriptionContextUUIDforPlan:v7 completion:v10];
  id v8 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v8;
}

id __59__CTCellularPlanManager_getSubscriptionContextUUIDforPlan___block_invoke_2(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (id)getShortLabelsForLabels:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = CellularPlanLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = a3;
    _os_log_impl(&dword_1DB90D000, v5, OS_LOG_TYPE_INFO, "getShortLabelsForLabels: %@", (uint8_t *)&buf, 0xCu);
  }
  id v6 = [(CTCellularPlanManager *)self synchronousProxyWithErrorHandler:&__block_literal_global_362];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v11 = 0x3052000000;
  uint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  uint64_t v14 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__CTCellularPlanManager_getShortLabelsForLabels___block_invoke_2;
  v9[3] = &unk_1E6C1F168;
  v9[4] = &buf;
  [v6 getShortLabelsForLabels:a3 completion:v9];
  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);
  return v7;
}

id __49__CTCellularPlanManager_getShortLabelsForLabels___block_invoke_2(uint64_t a1, void *a2)
{
  id result = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  return result;
}

+ (int64_t)calculateInstallConsentTextTypeFor:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  int64_t v6 = 0;
  uint64_t v7 = *(void *)v12;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(a3);
      }
      char v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
      if ([v9 type] == 2)
      {
        if ([v9 isSelected]
          && objc_msgSend((id)objc_msgSend(v9, "plan"), "status") == 7)
        {
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "plan"), "profile"), "isDisableNotAllowed")) {
            return 1;
          }
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "plan"), "profile"), "isDeleteNotAllowed")) {
            return 2;
          }
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "plan"), "profile"), "requiresUserConsent"))
          {
            if ([v9 shouldDisplayExtendedConsentInfo]) {
              return 7;
            }
            else {
              return 3;
            }
          }
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "plan"), "profile"), "isDisableNotAllowed"))
        {
          int64_t v6 = 4;
        }
        else if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "plan"), "profile"), "isDeleteNotAllowed") & (v6 == 0)) != 0)
        {
          int64_t v6 = 5;
        }
      }
    }
    uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5) {
      continue;
    }
    break;
  }
  return v6;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);

  queue = self->_queue;
  if (queue) {
    dispatch_release(queue);
  }
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection invalidate];
    int64_t v6 = self->_connection;
  }
  else
  {
    int64_t v6 = 0;
  }

  v7.receiver = self;
  v7.super_class = (Class)CTCellularPlanManager;
  [(CTCellularPlanManager *)&v7 dealloc];
}

void __58__CTCellularPlanManager_synchronousProxyWithErrorHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB90D000, v0, v1, "Failed to create synchronous remote object proxy: %@", v2, v3, v4, v5, v6);
}

void __29__CTCellularPlanManager_ping__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1DB90D000, log, OS_LOG_TYPE_ERROR, "no proxy", v1, 2u);
}

void __45__CTCellularPlanManager_shouldShowPlanSetup___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB90D000, v0, v1, "proxy error, error: %@", v2, v3, v4, v5, v6);
}

@end