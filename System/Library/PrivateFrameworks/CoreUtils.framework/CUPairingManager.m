@interface CUPairingManager
+ (id)copySystemPairingIdentifierAndReturnError:(id *)a3;
- (BOOL)targetUserSession;
- (CUPairingManager)init;
- (NSXPCListenerEndpoint)testListenerEndpoint;
- (OS_dispatch_queue)dispatchQueue;
- (id)identityCreatedHandler;
- (id)identityDeletedHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)pairedPeerAddedHandler;
- (id)pairedPeerChangedHandler;
- (id)pairedPeerRemovedHandler;
- (int)_ensureXPCStarted;
- (unsigned)targetUserID;
- (void)_deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)_getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)_getPairingIdentityWithOptions:(unint64_t)a3 tryCount:(unsigned int)a4 completion:(id)a5;
- (void)_interrupted;
- (void)_invalidate;
- (void)_invalidated;
- (void)_removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)_savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)_showWithCompletion:(id)a3;
- (void)_startMonitoringWithOptions:(unint64_t)a3;
- (void)dealloc;
- (void)deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)getPairedPeersWithGroupID:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4;
- (void)invalidate;
- (void)pairedPeerAdded:(id)a3 options:(unint64_t)a4;
- (void)pairedPeerChanged:(id)a3 options:(unint64_t)a4;
- (void)pairedPeerRemoved:(id)a3 options:(unint64_t)a4;
- (void)pairingIdentityCreated:(id)a3 options:(unint64_t)a4;
- (void)pairingIdentityDeletedWithOptions:(unint64_t)a3;
- (void)removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setIdentityCreatedHandler:(id)a3;
- (void)setIdentityDeletedHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPairedPeerAddedHandler:(id)a3;
- (void)setPairedPeerChangedHandler:(id)a3;
- (void)setPairedPeerRemovedHandler:(id)a3;
- (void)setTargetUserID:(unsigned int)a3;
- (void)setTargetUserSession:(BOOL)a3;
- (void)setTestListenerEndpoint:(id)a3;
- (void)showWithCompletion:(id)a3;
- (void)startMonitoringWithOptions:(unint64_t)a3;
- (void)updatePairedPeersWithGroupID:(id)a3 groupInfo:(id)a4 options:(unint64_t)a5 completion:(id)a6;
@end

@implementation CUPairingManager

- (CUPairingManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)CUPairingManager;
  v2 = [(CUPairingManager *)&v4 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong(&self->_pairedPeerChangedHandler, 0);
  objc_storeStrong(&self->_pairedPeerRemovedHandler, 0);
  objc_storeStrong(&self->_pairedPeerAddedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_identityDeletedHandler, 0);
  objc_storeStrong(&self->_identityCreatedHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

- (void)dealloc
{
  if (self->_xpcCnx) {
    FatalErrorF((uint64_t)"XPC connection still active during dealloc", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)v16.receiver);
  }
  id identityCreatedHandler = self->_identityCreatedHandler;
  self->_id identityCreatedHandler = 0;

  id identityDeletedHandler = self->_identityDeletedHandler;
  self->_id identityDeletedHandler = 0;

  id interruptionHandler = self->_interruptionHandler;
  self->_id interruptionHandler = 0;

  id invalidationHandler = self->_invalidationHandler;
  self->_id invalidationHandler = 0;

  id pairedPeerAddedHandler = self->_pairedPeerAddedHandler;
  self->_id pairedPeerAddedHandler = 0;

  id pairedPeerRemovedHandler = self->_pairedPeerRemovedHandler;
  self->_id pairedPeerRemovedHandler = 0;

  id pairedPeerChangedHandler = self->_pairedPeerChangedHandler;
  self->_id pairedPeerChangedHandler = 0;

  v16.receiver = self;
  v16.super_class = (Class)CUPairingManager;
  [(CUPairingManager *)&v16 dealloc];
}

- (void)setTestListenerEndpoint:(id)a3
{
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTargetUserID:(unsigned int)a3
{
  self->_targetUserID = a3;
}

- (unsigned)targetUserID
{
  return self->_targetUserID;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setPairedPeerChangedHandler:(id)a3
{
}

- (id)pairedPeerChangedHandler
{
  return self->_pairedPeerChangedHandler;
}

- (void)setPairedPeerRemovedHandler:(id)a3
{
}

- (id)pairedPeerRemovedHandler
{
  return self->_pairedPeerRemovedHandler;
}

- (void)setPairedPeerAddedHandler:(id)a3
{
}

- (id)pairedPeerAddedHandler
{
  return self->_pairedPeerAddedHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setIdentityDeletedHandler:(id)a3
{
}

- (id)identityDeletedHandler
{
  return self->_identityDeletedHandler;
}

- (void)setIdentityCreatedHandler:(id)a3
{
}

- (id)identityCreatedHandler
{
  return self->_identityCreatedHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)pairedPeerChanged:(id)a3 options:(unint64_t)a4
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    uint64_t v6 = [v13 identifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager pairedPeerChanged:options:]", 0x1Eu, (uint64_t)"PairedPeerChanged %@, %#{flags}\n", v7, v8, v9, v10, (uint64_t)v6);
  }
  id pairedPeerChangedHandler = (uint64_t (**)(id, id, unint64_t))self->_pairedPeerChangedHandler;
  id v12 = v13;
  if (pairedPeerChangedHandler)
  {
    id pairedPeerChangedHandler = (uint64_t (**)(id, id, unint64_t))pairedPeerChangedHandler[2](pairedPeerChangedHandler, v13, a4);
    id v12 = v13;
  }
  MEMORY[0x1F41817F8](pairedPeerChangedHandler, v12);
}

- (void)pairedPeerRemoved:(id)a3 options:(unint64_t)a4
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    uint64_t v6 = [v13 identifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager pairedPeerRemoved:options:]", 0x1Eu, (uint64_t)"PairedPeerRemoved %@, %#{flags}\n", v7, v8, v9, v10, (uint64_t)v6);
  }
  id pairedPeerRemovedHandler = (uint64_t (**)(id, id, unint64_t))self->_pairedPeerRemovedHandler;
  id v12 = v13;
  if (pairedPeerRemovedHandler)
  {
    id pairedPeerRemovedHandler = (uint64_t (**)(id, id, unint64_t))pairedPeerRemovedHandler[2](pairedPeerRemovedHandler, v13, a4);
    id v12 = v13;
  }
  MEMORY[0x1F41817F8](pairedPeerRemovedHandler, v12);
}

- (void)pairedPeerAdded:(id)a3 options:(unint64_t)a4
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    uint64_t v6 = [v13 identifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager pairedPeerAdded:options:]", 0x1Eu, (uint64_t)"PairedPeerAdded %@, %#{flags}\n", v7, v8, v9, v10, (uint64_t)v6);
  }
  id pairedPeerAddedHandler = (uint64_t (**)(id, id, unint64_t))self->_pairedPeerAddedHandler;
  id v12 = v13;
  if (pairedPeerAddedHandler)
  {
    id pairedPeerAddedHandler = (uint64_t (**)(id, id, unint64_t))pairedPeerAddedHandler[2](pairedPeerAddedHandler, v13, a4);
    id v12 = v13;
  }
  MEMORY[0x1F41817F8](pairedPeerAddedHandler, v12);
}

- (void)pairingIdentityDeletedWithOptions:(unint64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager pairingIdentityDeletedWithOptions:]", 0x1Eu, (uint64_t)"PairingIdentityDeleted %#{flags}\n", v5, v6, v7, v8, a3);
  }
  id identityDeletedHandler = self->_identityDeletedHandler;
  if (identityDeletedHandler)
  {
    uint64_t v10 = (void (*)(void))*((void *)identityDeletedHandler + 2);
    v10();
  }
}

- (void)pairingIdentityCreated:(id)a3 options:(unint64_t)a4
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    uint64_t v6 = [v13 identifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager pairingIdentityCreated:options:]", 0x1Eu, (uint64_t)"PairingIdentityCreated %@, %#{flags}\n", v7, v8, v9, v10, (uint64_t)v6);
  }
  id identityCreatedHandler = (uint64_t (**)(id, id, unint64_t))self->_identityCreatedHandler;
  id v12 = v13;
  if (identityCreatedHandler)
  {
    id identityCreatedHandler = (uint64_t (**)(id, id, unint64_t))identityCreatedHandler[2](identityCreatedHandler, v13, a4);
    id v12 = v13;
  }
  MEMORY[0x1F41817F8](identityCreatedHandler, v12);
}

- (void)_startMonitoringWithOptions:(unint64_t)a3
{
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _startMonitoringWithOptions:]", 0x1Eu, (uint64_t)"StartMonitoring %#{flags}\n", v3, v4, v5, v6, a3);
  }
  if ([(CUPairingManager *)self _ensureXPCStarted])
  {
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _startMonitoringWithOptions:]", 0x3Cu, (uint64_t)"### StartMonitoring %#{flags} failed: %#m\n", v9, v10, v11, v12, a3);
    }
  }
  else
  {
    id v13 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v13 startMonitoringWithOptions:a3];

    self->_monitoring = 1;
    self->_monitorOptions = a3;
  }
}

- (void)startMonitoringWithOptions:(unint64_t)a3
{
  uint64_t v5 = _os_activity_create(&dword_18E2F5000, "CoreUtils/CUPairingManager/startMonitoringWithOptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CUPairingManager_startMonitoringWithOptions___block_invoke;
  v7[3] = &unk_1E55BE748;
  v7[4] = self;
  v7[5] = a3;
  dispatch_async(dispatchQueue, v7);
  os_activity_scope_leave(&state);
}

uint64_t __47__CUPairingManager_startMonitoringWithOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startMonitoringWithOptions:*(void *)(a1 + 40)];
}

- (void)updatePairedPeersWithGroupID:(id)a3 groupInfo:(id)a4 options:(unint64_t)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke;
  v14[3] = &unk_1E55BE720;
  id v15 = v10;
  objc_super v16 = self;
  id v17 = v11;
  unint64_t v18 = a5;
  id v12 = v10;
  id v13 = v11;
  [(CUPairingManager *)self getPairedPeersWithGroupID:a3 options:a5 completion:v14];
}

void __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v20 = v5;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x3032000000;
    v32[3] = __Block_byref_object_copy__6114;
    v32[4] = __Block_byref_object_dispose__6115;
    id v33 = 0;
    uint64_t v7 = dispatch_group_create();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v12 = [v11 info];
          id v13 = (void *)[v12 mutableCopy];
          v14 = v13;
          if (v13) {
            id v15 = v13;
          }
          else {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          objc_super v16 = v15;

          [v16 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"groupInfo"];
          [v11 setInfo:v16];
          dispatch_group_enter(v7);
          id v17 = *(void **)(a1 + 40);
          uint64_t v18 = *(void *)(a1 + 56);
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke_80;
          v25[3] = &unk_1E55BF918;
          v27 = v32;
          v26 = v7;
          [v17 savePairedPeer:v11 options:v18 completion:v25];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v8);
    }

    v19 = *(NSObject **)(*(void *)(a1 + 40) + 40);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke_2;
    block[3] = &unk_1E55BE6F8;
    id v23 = *(id *)(a1 + 48);
    v24 = v32;
    dispatch_group_notify(v7, v19, block);

    _Block_object_dispose(v32, 8);
    id v6 = 0;
  }
}

void __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke_80(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void *)(v4 + 40);
  id v5 = (id *)(v4 + 40);
  if (!v6) {
    objc_storeStrong(v5, a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __78__CUPairingManager_updatePairedPeersWithGroupID_groupInfo_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void)_showWithCompletion:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void (**)(id, void, void *))a3;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _showWithCompletion:]", 0x1Eu, (uint64_t)"Show\n", v4, v5, v6, v7, v26);
  }
  uint64_t v9 = [(CUPairingManager *)self _ensureXPCStarted];
  if (v9)
  {
    uint64_t v18 = v9;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _showWithCompletion:]", 0x3Cu, (uint64_t)"### Show failed: %#m\n", v10, v11, v12, v13, v18);
    }
    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28760];
    uint64_t v21 = (int)v18;
    uint64_t v29 = *MEMORY[0x1E4F28568];
    uint64_t v22 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v18, 0, 0));
    id v17 = (void *)v22;
    id v23 = @"?";
    if (v22) {
      id v23 = (__CFString *)v22;
    }
    v30[0] = v23;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    v25 = [v19 errorWithDomain:v20 code:v21 userInfo:v24];
    v8[2](v8, 0, v25);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __40__CUPairingManager__showWithCompletion___block_invoke;
    v27[3] = &unk_1E55BE680;
    id v15 = v8;
    id v28 = v15;
    objc_super v16 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v27];
    [v16 showWithCompletion:v15];

    id v17 = v28;
  }
}

uint64_t __40__CUPairingManager__showWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)showWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _os_activity_create(&dword_18E2F5000, "CoreUtils/CUPairingManager/showWithCompletion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__CUPairingManager_showWithCompletion___block_invoke;
  v8[3] = &unk_1E55BF148;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

uint64_t __39__CUPairingManager_showWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showWithCompletion:*(void *)(a1 + 40)];
}

- (void)_removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    uint64_t v10 = [v8 identifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _removePairedPeer:options:completion:]", 0x1Eu, (uint64_t)"RemovePairedPeer %@, %#{flags}\n", v11, v12, v13, v14, (uint64_t)v10);
  }
  int v15 = [(CUPairingManager *)self _ensureXPCStarted];
  if (v15)
  {
    int v20 = v15;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      uint64_t v21 = [v8 identifier];
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _removePairedPeer:options:completion:]", 0x3Cu, (uint64_t)"### RemovePairedPeer %@, %#{flags} failed: %#m\n", v22, v23, v24, v25, (uint64_t)v21);
    }
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28760];
    uint64_t v28 = v20;
    uint64_t v35 = *MEMORY[0x1E4F28568];
    uint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v20, 0, 0));
    v19 = (void *)v29;
    long long v30 = @"?";
    if (v29) {
      long long v30 = (__CFString *)v29;
    }
    v36[0] = v30;
    long long v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v32 = [v26 errorWithDomain:v27 code:v28 userInfo:v31];
    v9[2](v9, v32);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __57__CUPairingManager__removePairedPeer_options_completion___block_invoke;
    v33[3] = &unk_1E55BE680;
    id v17 = v9;
    v34 = v17;
    uint64_t v18 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v33];
    [v18 removePairedPeer:v8 options:a4 completion:v17];

    v19 = v34;
  }
}

uint64_t __57__CUPairingManager__removePairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _os_activity_create(&dword_18E2F5000, "CoreUtils/CUPairingManager/removePairedPeer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__CUPairingManager_removePairedPeer_options_completion___block_invoke;
  v14[3] = &unk_1E55BE6D0;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

uint64_t __56__CUPairingManager_removePairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removePairedPeer:*(void *)(a1 + 40) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)_savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *))a5;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    uint64_t v10 = [v8 identifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _savePairedPeer:options:completion:]", 0x1Eu, (uint64_t)"SavePairedPeer %@, %#{flags}\n", v11, v12, v13, v14, (uint64_t)v10);
  }
  int v15 = [(CUPairingManager *)self _ensureXPCStarted];
  if (v15)
  {
    int v20 = v15;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      uint64_t v21 = [v8 identifier];
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _savePairedPeer:options:completion:]", 0x3Cu, (uint64_t)"### SavePairedPeer %@, %#{flags} failed: %#m\n", v22, v23, v24, v25, (uint64_t)v21);
    }
    uint64_t v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28760];
    uint64_t v28 = v20;
    uint64_t v35 = *MEMORY[0x1E4F28568];
    uint64_t v29 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v20, 0, 0));
    v19 = (void *)v29;
    long long v30 = @"?";
    if (v29) {
      long long v30 = (__CFString *)v29;
    }
    v36[0] = v30;
    long long v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:&v35 count:1];
    v32 = [v26 errorWithDomain:v27 code:v28 userInfo:v31];
    v9[2](v9, v32);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __55__CUPairingManager__savePairedPeer_options_completion___block_invoke;
    v33[3] = &unk_1E55BE680;
    unint64_t v17 = v9;
    v34 = v17;
    uint64_t v18 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v33];
    [v18 savePairedPeer:v8 options:a4 completion:v17];

    v19 = v34;
  }
}

uint64_t __55__CUPairingManager__savePairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)savePairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _os_activity_create(&dword_18E2F5000, "CoreUtils/CUPairingManager/savePairedPeer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__CUPairingManager_savePairedPeer_options_completion___block_invoke;
  v14[3] = &unk_1E55BE6D0;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

uint64_t __54__CUPairingManager_savePairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _savePairedPeer:*(void *)(a1 + 40) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)_findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    uint64_t v10 = [v8 identifier];
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _findPairedPeer:options:completion:]", 0x1Eu, (uint64_t)"FindPairedPeer %@, %#{flags}\n", v11, v12, v13, v14, (uint64_t)v10);
  }
  int v15 = [(CUPairingManager *)self _ensureXPCStarted];
  if (v15)
  {
    int v24 = v15;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _findPairedPeer:options:completion:]", 0x3Cu, (uint64_t)"### FindPairedPeer %#{flags} failed: %#m\n", v16, v17, v18, v19, a4);
    }
    uint64_t v25 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v26 = *MEMORY[0x1E4F28760];
    uint64_t v27 = v24;
    uint64_t v34 = *MEMORY[0x1E4F28568];
    uint64_t v28 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v24, 0, 0));
    uint64_t v23 = (void *)v28;
    uint64_t v29 = @"?";
    if (v28) {
      uint64_t v29 = (__CFString *)v28;
    }
    v35[0] = v29;
    long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    long long v31 = [v25 errorWithDomain:v26 code:v27 userInfo:v30];
    v9[2](v9, 0, v31);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __55__CUPairingManager__findPairedPeer_options_completion___block_invoke;
    v32[3] = &unk_1E55BE680;
    uint64_t v21 = v9;
    id v33 = v21;
    uint64_t v22 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v32];
    [v22 findPairedPeer:v8 options:a4 completion:v21];

    uint64_t v23 = v33;
  }
}

uint64_t __55__CUPairingManager__findPairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)findPairedPeer:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _os_activity_create(&dword_18E2F5000, "CoreUtils/CUPairingManager/findPairedPeer", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __54__CUPairingManager_findPairedPeer_options_completion___block_invoke;
  v14[3] = &unk_1E55BE6D0;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a4;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

uint64_t __54__CUPairingManager_findPairedPeer_options_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _findPairedPeer:*(void *)(a1 + 40) options:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)_getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void (**)(id, void, void *))a4;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _getPairedPeersWithOptions:completion:]", 0x1Eu, (uint64_t)"GetPairedPeers %#{flags}\n", v6, v7, v8, v9, a3);
  }
  int v11 = [(CUPairingManager *)self _ensureXPCStarted];
  if (v11)
  {
    int v20 = v11;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _getPairedPeersWithOptions:completion:]", 0x3Cu, (uint64_t)"### GetPairedPeers %#{flags} failed: %#m\n", v12, v13, v14, v15, a3);
    }
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28760];
    uint64_t v23 = v20;
    uint64_t v30 = *MEMORY[0x1E4F28568];
    uint64_t v24 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v20, 0, 0));
    uint64_t v19 = (void *)v24;
    uint64_t v25 = @"?";
    if (v24) {
      uint64_t v25 = (__CFString *)v24;
    }
    v31[0] = v25;
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    uint64_t v27 = [v21 errorWithDomain:v22 code:v23 userInfo:v26];
    v10[2](v10, 0, v27);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __58__CUPairingManager__getPairedPeersWithOptions_completion___block_invoke;
    v28[3] = &unk_1E55BE680;
    unint64_t v17 = v10;
    id v29 = v17;
    uint64_t v18 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v28];
    [v18 getPairedPeersWithOptions:a3 completion:v17];

    uint64_t v19 = v29;
  }
}

uint64_t __58__CUPairingManager__getPairedPeersWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPairedPeersWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_18E2F5000, "CoreUtils/CUPairingManager/getPairedPeersWithOptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__CUPairingManager_getPairedPeersWithOptions_completion___block_invoke;
  block[3] = &unk_1E55BE630;
  id v11 = v6;
  unint64_t v12 = a3;
  void block[4] = self;
  id v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

uint64_t __57__CUPairingManager_getPairedPeersWithOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getPairedPeersWithOptions:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)getPairedPeersWithGroupID:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __65__CUPairingManager_getPairedPeersWithGroupID_options_completion___block_invoke;
  v12[3] = &unk_1E55BE6A8;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(CUPairingManager *)self getPairedPeersWithOptions:a4 completion:v12];
}

void __65__CUPairingManager_getPairedPeersWithGroupID_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5)
  {
    uint64_t v22 = 0;
    goto LABEL_18;
  }
  id v23 = v6;
  id v24 = v5;
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      CFDictionaryRef v14 = [v13 groupInfo];
      CFTypeID TypeID = CFStringGetTypeID();
      id v16 = CFDictionaryGetTypedValue(v14, @"groupID", TypeID, 0);

      unint64_t v17 = *(void **)(a1 + 32);
      id v18 = v16;
      id v19 = v17;
      if (v18 == v19)
      {

LABEL_12:
        [v25 addObject:v13];
        goto LABEL_14;
      }
      int v20 = v19;
      if ((v18 == 0) != (v19 != 0))
      {
        int v21 = [v18 isEqual:v19];

        if (v21) {
          goto LABEL_12;
        }
      }
      else
      {
      }
LABEL_14:
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v10);
LABEL_16:

  uint64_t v7 = v23;
  id v5 = v24;
  uint64_t v22 = v25;
LABEL_18:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (void (**)(id, void *))a4;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _deletePairingIdentityWithOptions:completion:]", 0x1Eu, (uint64_t)"DeletePairingIdentity %#{flags}\n", v6, v7, v8, v9, a3);
  }
  int v11 = [(CUPairingManager *)self _ensureXPCStarted];
  if (v11)
  {
    int v20 = v11;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _deletePairingIdentityWithOptions:completion:]", 0x3Cu, (uint64_t)"### DeletePairingIdentity %#{flags} failed: %#m\n", v12, v13, v14, v15, a3);
    }
    int v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28760];
    uint64_t v23 = v20;
    uint64_t v30 = *MEMORY[0x1E4F28568];
    uint64_t v24 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v20, 0, 0));
    id v19 = (void *)v24;
    id v25 = @"?";
    if (v24) {
      id v25 = (__CFString *)v24;
    }
    v31[0] = v25;
    long long v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    long long v27 = [v21 errorWithDomain:v22 code:v23 userInfo:v26];
    v10[2](v10, v27);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __65__CUPairingManager__deletePairingIdentityWithOptions_completion___block_invoke;
    v28[3] = &unk_1E55BE680;
    unint64_t v17 = v10;
    long long v29 = v17;
    id v18 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v28];
    [v18 deletePairingIdentityWithOptions:a3 completion:v17];

    id v19 = v29;
  }
}

uint64_t __65__CUPairingManager__deletePairingIdentityWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deletePairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_18E2F5000, "CoreUtils/CUPairingManager/deletePairingIdentityWithOptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CUPairingManager_deletePairingIdentityWithOptions_completion___block_invoke;
  block[3] = &unk_1E55BE630;
  id v11 = v6;
  unint64_t v12 = a3;
  void block[4] = self;
  id v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

uint64_t __64__CUPairingManager_deletePairingIdentityWithOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deletePairingIdentityWithOptions:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)_getPairingIdentityWithOptions:(unint64_t)a3 tryCount:(unsigned int)a4 completion:(id)a5
{
  v35[1] = *MEMORY[0x1E4F143B8];
  unint64_t v12 = (void (**)(id, void, void *))a5;
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _getPairingIdentityWithOptions:tryCount:completion:]", 0x1Eu, (uint64_t)"GetPairingIdentity %#{flags}\n", v8, v9, v10, v11, a3);
  }
  int v13 = [(CUPairingManager *)self _ensureXPCStarted];
  if (v13)
  {
    int v21 = v13;
    if (gLogCategory_CUPairingManager <= 60
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _getPairingIdentityWithOptions:tryCount:completion:]", 0x3Cu, (uint64_t)"### GetPairingIdentity %#{flags} failed: %#m\n", v14, v15, v16, v17, a3);
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28760];
    uint64_t v24 = v21;
    uint64_t v34 = *MEMORY[0x1E4F28568];
    uint64_t v25 = objc_msgSend(NSString, "stringWithUTF8String:", DebugGetErrorStringEx(0, v21, 0, 0));
    long long v26 = (void *)v25;
    long long v27 = @"?";
    if (v25) {
      long long v27 = (__CFString *)v25;
    }
    v35[0] = v27;
    long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    long long v29 = [v22 errorWithDomain:v23 code:v24 userInfo:v28];
    v12[2](v12, 0, v29);
  }
  else
  {
    xpcCnx = self->_xpcCnx;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    void v30[2] = __71__CUPairingManager__getPairingIdentityWithOptions_tryCount_completion___block_invoke;
    v30[3] = &unk_1E55BE658;
    unsigned int v33 = a4;
    v30[4] = self;
    unint64_t v32 = a3;
    id v19 = v12;
    id v31 = v19;
    int v20 = [(NSXPCConnection *)xpcCnx remoteObjectProxyWithErrorHandler:v30];
    [v20 getPairingIdentityWithOptions:a3 completion:v19];
  }
}

void __71__CUPairingManager__getPairingIdentityWithOptions_tryCount_completion___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 code] == 4097 && (uint64_t v7 = *(unsigned int *)(a1 + 56), v7 <= 9))
  {
    if (gLogCategory_CUPairingManager <= 60)
    {
      if (gLogCategory_CUPairingManager != -1
        || (BOOL v8 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x3Cu),
            uint64_t v7 = *(unsigned int *)(a1 + 56),
            v8))
      {
        LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _getPairingIdentityWithOptions:tryCount:completion:]_block_invoke", 0x3Cu, (uint64_t)"### GetPairingIdentity daemon restart...retrying %u of 10\n", v3, v4, v5, v6, v7);
        LODWORD(v7) = *(_DWORD *)(a1 + 56);
      }
    }
    [*(id *)(a1 + 32) _getPairingIdentityWithOptions:*(void *)(a1 + 48) tryCount:(v7 + 1) completion:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)getPairingIdentityWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _os_activity_create(&dword_18E2F5000, "CoreUtils/CUPairingManager/getPairingIdentityWithOptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CUPairingManager_getPairingIdentityWithOptions_completion___block_invoke;
  block[3] = &unk_1E55BE630;
  id v11 = v6;
  unint64_t v12 = a3;
  void block[4] = self;
  id v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

uint64_t __61__CUPairingManager_getPairingIdentityWithOptions_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getPairingIdentityWithOptions:*(void *)(a1 + 48) tryCount:1 completion:*(void *)(a1 + 40)];
}

- (void)_invalidated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_CUPairingManager <= 50
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x32u)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _invalidated]", 0x32u, (uint64_t)"### Unexpectedly invalidated\n", v3, v4, v5, v6, v20);
    }
    id invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id identityCreatedHandler = self->_identityCreatedHandler;
    self->_id identityCreatedHandler = 0;

    id identityDeletedHandler = self->_identityDeletedHandler;
    self->_id identityDeletedHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v11 = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id pairedPeerAddedHandler = self->_pairedPeerAddedHandler;
    self->_id pairedPeerAddedHandler = 0;

    id pairedPeerRemovedHandler = self->_pairedPeerRemovedHandler;
    self->_id pairedPeerRemovedHandler = 0;

    id pairedPeerChangedHandler = self->_pairedPeerChangedHandler;
    self->_id pairedPeerChangedHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_CUPairingManager <= 30
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v16, v17, v18, v19, v22);
    }
  }
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_CUPairingManager <= 30
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _invalidate]", 0x1Eu, (uint64_t)"Invalidating\n", v3, v4, v5, v6, v9);
    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      [(NSXPCConnection *)xpcCnx invalidate];
      BOOL v8 = self->_xpcCnx;
      self->_xpcCnx = 0;
    }
    else
    {
      [(CUPairingManager *)self _invalidated];
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CUPairingManager_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__CUPairingManager_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_interrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_CUPairingManager <= 50
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x32u)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _interrupted]", 0x32u, (uint64_t)"### Interrupted\n", v3, v4, v5, v6, v14);
  }
  if (self->_monitoring && ![(CUPairingManager *)self _ensureXPCStarted])
  {
    if (gLogCategory_CUPairingManager <= 50
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x32u)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"-[CUPairingManager _interrupted]", 0x32u, (uint64_t)"Restarting monitor after interruption\n", v7, v8, v9, v10, v14);
    }
    id v11 = [(NSXPCConnection *)self->_xpcCnx remoteObjectProxy];
    [v11 startMonitoringWithOptions:self->_monitorOptions];
  }
  id interruptionHandler = self->_interruptionHandler;
  if (interruptionHandler)
  {
    int v13 = (void (*)(void))*((void *)interruptionHandler + 2);
    v13();
  }
}

- (int)_ensureXPCStarted
{
  if (self->_xpcCnx) {
    return 0;
  }
  if (!self->_invalidateCalled && !self->_invalidateDone)
  {
    testListenerEndpoint = self->_testListenerEndpoint;
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    if (testListenerEndpoint) {
      uint64_t v5 = (NSXPCConnection *)[v4 initWithListenerEndpoint:self->_testListenerEndpoint];
    }
    else {
      uint64_t v5 = (NSXPCConnection *)[v4 initWithMachServiceName:@"com.apple.PairingManager" options:0];
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    [(NSXPCConnection *)self->_xpcCnx _setQueue:self->_dispatchQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __37__CUPairingManager__ensureXPCStarted__block_invoke;
    v14[3] = &unk_1E55BFC18;
    void v14[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInterruptionHandler:v14];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __37__CUPairingManager__ensureXPCStarted__block_invoke_2;
    v13[3] = &unk_1E55BFC18;
    v13[4] = self;
    [(NSXPCConnection *)self->_xpcCnx setInvalidationHandler:v13];
    uint64_t v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD4FB10];
    [(NSXPCConnection *)self->_xpcCnx setExportedInterface:v7];

    [(NSXPCConnection *)self->_xpcCnx setExportedObject:self];
    uint64_t v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EDD4F980];
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    [v8 setClasses:v11 forSelector:sel_getPairedPeersWithOptions_completion_ argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)self->_xpcCnx setRemoteObjectInterface:v8];
    [(NSXPCConnection *)self->_xpcCnx resume];

    return 0;
  }
  return -6724;
}

uint64_t __37__CUPairingManager__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _interrupted];
}

uint64_t __37__CUPairingManager__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidated];
}

+ (id)copySystemPairingIdentifierAndReturnError:(id *)a3
{
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"+[CUPairingManager copySystemPairingIdentifierAndReturnError:]", 0x1Eu, (uint64_t)"CopySystemPairingIdentifier: trying direct", v3, v4, v5, v6, v41);
  }
  id v8 = [[CUPairingDaemon alloc] initStandalone];
  unsigned int v44 = -6700;
  uint64_t v9 = (void *)[v8 copyIdentityWithOptions:4 error:&v44];
  uint64_t v10 = [v9 identifier];
  id v11 = [v10 UUIDString];

  if (v11)
  {
    if (gLogCategory_CUPairingManager <= 30
      && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"+[CUPairingManager copySystemPairingIdentifierAndReturnError:]", 0x1Eu, (uint64_t)"CopySystemPairingIdentifier: direct: %@", v15, v16, v17, v18, (uint64_t)v11);
    }
LABEL_33:
    id v39 = v11;
    goto LABEL_34;
  }
  if (gLogCategory_CUPairingManager <= 30
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
  {
    uint64_t v19 = NSPrintF((uint64_t)"%#m", v12, v13, v14, v15, v16, v17, v18, v44);
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"+[CUPairingManager copySystemPairingIdentifierAndReturnError:]", 0x1Eu, (uint64_t)"CopySystemPairingIdentifier: direct failed (error=%@), trying XPC", v20, v21, v22, v23, (uint64_t)v19);
  }
  v43 = 0;
  PairingSessionCreate((uint64_t *)&v43, 0, 0);
  id v31 = v43;
  if (v43)
  {
    v43[25] = 12;
    v42 = 0;
    unsigned int v44 = PairingSessionCopyIdentity((uint64_t)v31, 1, (char **)&v42, 0, 0);
    if (v42)
    {
      id v32 = [NSString alloc];
      id v11 = (void *)[v32 initWithUTF8String:v42];
      free(v42);
      CFRelease(v31);
      if (v11)
      {
        if (gLogCategory_CUPairingManager <= 30
          && (gLogCategory_CUPairingManager != -1
           || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x1Eu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"+[CUPairingManager copySystemPairingIdentifierAndReturnError:]", 0x1Eu, (uint64_t)"CopySystemPairingIdentifier: XPC: %@", v27, v28, v29, v30, (uint64_t)v11);
        }
        goto LABEL_33;
      }
    }
    else
    {
      CFRelease(v31);
    }
  }
  if (gLogCategory_CUPairingManager <= 90
    && (gLogCategory_CUPairingManager != -1 || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPairingManager, 0x5Au)))
  {
    unsigned int v33 = NSPrintF((uint64_t)"%#m", v24, v25, v26, v27, v28, v29, v30, v44);
    LogPrintF((uint64_t)&gLogCategory_CUPairingManager, (uint64_t)"+[CUPairingManager copySystemPairingIdentifierAndReturnError:]", 0x5Au, (uint64_t)"### CopySystemPairingIdentifier failed: error=%@", v34, v35, v36, v37, (uint64_t)v33);
  }
  if (a3)
  {
    if (v44) {
      uint64_t v38 = v44;
    }
    else {
      uint64_t v38 = 4294960596;
    }
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], v38, (uint64_t)"CopySystemPairingIdentifier failed", v26, v27, v28, v29, v30, v41);
    id v39 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v39 = 0;
  }
LABEL_34:

  return v39;
}

@end