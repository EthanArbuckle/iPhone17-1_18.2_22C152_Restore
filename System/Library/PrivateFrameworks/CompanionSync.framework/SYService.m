@interface SYService
- (BOOL)_handleEndSessionResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleResetResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleRestartSessionResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleStartSessionResponse:(id)a3 error:(id *)a4;
- (BOOL)_handleSyncBatchResponse:(id)a3 error:(id *)a4;
- (BOOL)_initializeMessaging:(id *)a3;
- (BOOL)_initializeServiceDB:(id *)a3;
- (BOOL)_protocolVersion:(int)a3 supportsEngineType:(unsigned int)a4;
- (BOOL)_request:(id)a3 hasValidSessionIDForSession:(id)a4 response:(id)a5 completion:(id)a6;
- (BOOL)_shouldSession:(id)a3 fromPeer:(id)a4 supercedeSession:(id)a5 ofAge:(double)a6 collisionDetected:(BOOL *)a7;
- (BOOL)_v1_handleBatchChunkAck:(id)a3 error:(id *)a4;
- (BOOL)_v1_handleBatchEndResponse:(id)a3 error:(id *)a4;
- (BOOL)_v1_handleFullSyncRequestAck:(id)a3 error:(id *)a4;
- (BOOL)hasPairingStore;
- (BOOL)isMasterStore;
- (BOOL)resume:(id *)a3;
- (BOOL)sendData:(id)a3 options:(id)a4 identifier:(id *)a5 error:(id *)a6;
- (BOOL)targetIsConnected;
- (BOOL)targetIsInProximity;
- (BOOL)willAcceptMessageWithHeader:(id)a3 messageID:(id)a4;
- (NSDictionary)customIDSOptions;
- (NSDictionary)extraTransportOptions;
- (NSDictionary)options;
- (NSString)generationID;
- (NSString)name;
- (NSString)peerID;
- (OS_dispatch_queue)queue;
- (OS_os_activity)serviceActivity;
- (PBCodable)stateForLogging;
- (SYPersistentStore)persistentStore;
- (SYService)init;
- (SYService)initWithService:(id)a3 priority:(int64_t)a4 asMasterStore:(BOOL)a5 options:(id)a6;
- (SYService)initWithService:(id)a3 priority:(int64_t)a4 qos:(unsigned int)a5 asMasterStore:(BOOL)a6 options:(id)a7;
- (SYSession)currentSession;
- (SYSyncEngine)syncEngine;
- (_SYMultiSuspendableQueue)sessionQueue;
- (double)defaultMessageTimeout;
- (double)sessionStalenessInterval;
- (id)_chooseBetweenCollidingSessions:(id)a3 :(id)a4;
- (id)_claimOwnershipOfFileAtURL:(id)a3 error:(id *)a4;
- (id)_makeSessionForDeltaSync:(BOOL)a3;
- (id)_makeSyncEngineOfType:(unsigned int)a3;
- (id)_newMessageHeader;
- (id)_pathForDataStore;
- (id)_sessionFromIncomingStartRequest:(id)a3;
- (id)dataStreamWithMetadata:(id)a3 options:(id)a4 identifier:(id *)a5 error:(id *)a6;
- (int64_t)priority;
- (int64_t)sendingBufferCap;
- (unsigned)engineType;
- (void)_copyPeerClockFromMessageHeaderIfNecessary:(id)a3;
- (void)_dealWithPotentiallyStallingCurrentSession;
- (void)_deviceOSInfoChanged:(id)a3;
- (void)_deviceRemoved:(id)a3;
- (void)_deviceTargetabilityChanged:(id)a3;
- (void)_downgradeEngineForVersion:(int)a3;
- (void)_enqueueIncomingStartSessionRequest:(id)a3 withCompletion:(id)a4;
- (void)_handleEndSession:(id)a3 completion:(id)a4;
- (void)_handleError:(id)a3;
- (void)_handleResetRequest:(id)a3 completion:(id)a4;
- (void)_handleRestartSession:(id)a3 completion:(id)a4;
- (void)_handleStartSession:(id)a3 completion:(id)a4;
- (void)_handleSyncBatch:(id)a3 completion:(id)a4;
- (void)_ifDelegateImplements:(SEL)a3 do:(id)a4 then:(id)a5;
- (void)_peerRejectedVersion:(id)a3 completion:(id)a4;
- (void)_postVersionRejectionMessageForMessageWithID:(id)a3;
- (void)_processPendingChanges;
- (void)_removePairingStoreDevice;
- (void)_sendResetRequest;
- (void)_setProtocolVersionForRemoteOSVersion:(id)a3 build:(id)a4 remoteIsWatch:(BOOL)a5 switchingEngines:(BOOL)a6;
- (void)_setupPairingNotifications;
- (void)_setupPairingStoreWithDevice:(id)a3;
- (void)_signalPairingStoreAvailable;
- (void)_signalPairingStoreUnavailable;
- (void)_suspend;
- (void)_swapEngineTo:(unsigned int)a3;
- (void)_swapSessionForVersionChange;
- (void)_switchToNewTargetedDevice:(id)a3;
- (void)_updateMetaProtocolInfoForDevice:(id)a3;
- (void)_upgradeEngineTo:(unsigned int)a3;
- (void)_v1_handleBatchSyncChunk:(id)a3 completion:(id)a4;
- (void)_v1_handleBatchSyncEnd:(id)a3 completion:(id)a4;
- (void)_v1_handleBatchSyncStart:(id)a3 completion:(id)a4;
- (void)_v1_handleChangeMessage:(id)a3 completion:(id)a4;
- (void)_v1_handleFullSyncRequest:(id)a3 completion:(id)a4;
- (void)_v1_handleSyncAllObjects:(id)a3 completion:(id)a4;
- (void)_vectorClockUpdated;
- (void)_whenSessionEnds:(id)a3;
- (void)_wrapUpCurrentSession:(id)a3;
- (void)currentDeviceConnectionChanged:(BOOL)a3;
- (void)currentDeviceProximityChanged:(BOOL)a3;
- (void)dataStreamWithMetadata:(id)a3 options:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)deliveredMessageWithID:(id)a3 context:(id)a4;
- (void)enqueuedMessageWithID:(id)a3 context:(id)a4;
- (void)handleFileTransfer:(id)a3 metadata:(id)a4 completion:(id)a5;
- (void)handleOutOfBandData:(id)a3 completion:(id)a4;
- (void)handleSyncError:(id)a3 forMessageWithIdentifier:(id)a4;
- (void)handleSyncRequest:(id)a3 ofType:(unsigned __int16)a4 response:(id)a5;
- (void)handleSyncResponse:(id)a3 ofType:(unsigned __int16)a4 completion:(id)a5;
- (void)peerID;
- (void)sendData:(id)a3 options:(id)a4 completion:(id)a5;
- (void)sentMessageWithID:(id)a3 context:(id)a4;
- (void)serializeForIncomingSession:(id)a3;
- (void)sessionDidEnd:(id)a3 withError:(id)a4;
- (void)sessionFailedToCancelMessageUUIDs:(id)a3;
- (void)setCustomIDSOptions:(id)a3;
- (void)setDefaultMessageTimeout:(double)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setEngineType:(unsigned int)a3;
- (void)setHasChangesAvailable;
- (void)setNeedsResetSync;
- (void)setOptions:(id)a3;
- (void)setPriority:(int64_t)a3;
- (void)setSendingBufferCap:(int64_t)a3;
- (void)setSessionStalenessInterval:(double)a3;
- (void)suspend;
@end

@implementation SYService

char *__64__SYService_initWithService_priority_qos_asMasterStore_options___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D4B1560]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained stateForLogging];
    v6 = [v5 data];
  }
  else
  {
    v6 = 0;
  }
  v7 = (char *)malloc_type_malloc([v6 length] + 200, 0x56405FE4uLL);
  *(_DWORD *)v7 = 2;
  __strlcpy_chk();
  __strlcpy_chk();
  snprintf(v7 + 136, 0x40uLL, "Service '%s'", (const char *)[*(id *)(a1 + 32) UTF8String]);
  *((_DWORD *)v7 + 1) = [v6 length];
  objc_msgSend(v6, "getBytes:length:", v7 + 200, objc_msgSend(v6, "length"));

  return v7;
}

- (PBCodable)stateForLogging
{
  v3 = objc_opt_new();
  v4 = [(SYService *)self name];
  [v3 setName:v4];

  v5 = [(SYService *)self syncEngine];
  v6 = [v5 stateForLogging];
  [v3 setEngine:v6];

  v7 = [(SYService *)self currentSession];
  v8 = [v7 stateForLogging];
  [v3 setSession:v8];

  objc_msgSend(v3, "setSessionQueueRunning:", -[_SYMultiSuspendableQueue isSuspended](self->_sessionQueue, "isSuspended") ^ 1);
  v9 = [(SYDevice *)self->_targetedDevice stateForLogging];
  [v3 setTargetedDevice:v9];

  v10 = [(SYService *)self options];
  [v3 setCocoaTransportOptions:v10];

  v11 = [(SYService *)self peerID];
  [v3 setPeerID:v11];

  [v3 setPeerGenerationID:self->_generationID];
  if ([(SYService *)self isMasterStore]) {
    uint64_t v12 = 1;
  }
  else {
    uint64_t v12 = 2;
  }
  [v3 setServiceType:v12];
  os_unfair_lock_lock(&self->_flagLock);
  $FC3B5D260D4F8D1F83CF9B539A238CFB flags = self->_flags;
  if ((*(unsigned char *)&flags & 4) != 0) {
    uint64_t v14 = 2;
  }
  else {
    uint64_t v14 = (*(unsigned int *)&flags >> 1) & 1;
  }
  [v3 setEnqueuedSyncType:v14];
  os_unfair_lock_unlock(&self->_flagLock);
  return (PBCodable *)v3;
}

- (SYSyncEngine)syncEngine
{
  return self->_syncEngine;
}

- (NSString)peerID
{
  peerID = self->_peerID;
  if (peerID) {
    goto LABEL_3;
  }
  v4 = [(SYService *)self persistentStore];
  v5 = [v4 peerID];
  v6 = self->_peerID;
  self->_peerID = v5;

  peerID = self->_peerID;
  if (peerID)
  {
LABEL_3:
    v7 = peerID;
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04790, OS_LOG_TYPE_ERROR)) {
      -[SYService peerID]();
    }
    v7 = @"0BADF00D-DEAD-0000-9999-1234567890AB";
  }
  return (NSString *)v7;
}

- (SYPersistentStore)persistentStore
{
  p_persistentStoreLock = &self->_persistentStoreLock;
  os_unfair_lock_lock(&self->_persistentStoreLock);
  v4 = self->_persistentStore;
  if (!v4)
  {
    v5 = +[SYPersistentStore sharedPersistentStoreForService:self->_serviceName];
    persistentStore = self->_persistentStore;
    self->_persistentStore = v5;

    v4 = self->_persistentStore;
  }
  os_unfair_lock_unlock(p_persistentStoreLock);
  return v4;
}

- (void)peerID
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "LYING about peerID, because it's nil!", v2, v3, v4, v5, v6);
}

- (NSDictionary)options
{
  return self->_defaultOptions;
}

- (NSString)name
{
  return self->_serviceName;
}

- (BOOL)isMasterStore
{
  return *(_DWORD *)&self->_flags & 1;
}

- (SYSession)currentSession
{
  return self->_currentSession;
}

- (SYService)init
{
  uint64_t v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint8_t v6 = NSStringFromClass(v5);
  [v3 raise:v4, @"-[%@ init] is not supported.", v6 format];

  return 0;
}

- (SYService)initWithService:(id)a3 priority:(int64_t)a4 asMasterStore:(BOOL)a5 options:(id)a6
{
  BOOL v7 = a5;
  int64_t defaultPriority = self->_defaultPriority;
  if (defaultPriority) {
    unsigned int v9 = 17;
  }
  else {
    unsigned int v9 = 21;
  }
  if (defaultPriority == 20) {
    uint64_t v10 = 25;
  }
  else {
    uint64_t v10 = v9;
  }
  return [(SYService *)self initWithService:a3 priority:a4 qos:v10 asMasterStore:v7 options:a6];
}

- (SYService)initWithService:(id)a3 priority:(int64_t)a4 qos:(unsigned int)a5 asMasterStore:(BOOL)a6 options:(id)a7
{
  BOOL v73 = a6;
  uint64_t v8 = *(void *)&a5;
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v75 = a3;
  id v74 = a7;
  v81.receiver = self;
  v81.super_class = (Class)SYService;
  v11 = [(SYService *)&v81 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_flagLock._os_unfair_lock_opaque = 0;
    id v13 = v75;
    if ([v13 hasSuffix:@"addressbooksync"])
    {
      uint64_t v14 = "addressbooksync";
    }
    else if ([v13 hasSuffix:@"appregistrysync"])
    {
      uint64_t v14 = "appregistrysync";
    }
    else if ([v13 hasSuffix:@"eventkitsync"])
    {
      uint64_t v14 = "eventkitsync";
    }
    else if ([v13 hasSuffix:@"location.auth"])
    {
      uint64_t v14 = "location.auth";
    }
    else if ([v13 hasSuffix:@"location.wifitilesync"])
    {
      uint64_t v14 = "location.wifitilesync";
    }
    else if ([v13 hasSuffix:@"maps.sync"])
    {
      uint64_t v14 = "maps.sync";
    }
    else if ([v13 hasSuffix:@"tccd.sync"])
    {
      uint64_t v14 = "tccd.sync";
    }
    else if ([v13 hasSuffix:@"voicemailsync"])
    {
      uint64_t v14 = "voicemailsync";
    }
    else
    {
      uint64_t v14 = "SYService";
    }
    os_activity_t v15 = _os_activity_create(&dword_21C7C9000, v14, MEMORY[0x263EF8428], OS_ACTIVITY_FLAG_DEFAULT);

    serviceActivity = v12->_serviceActivity;
    v12->_serviceActivity = (OS_os_activity *)v15;

    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter((os_activity_t)v12->_serviceActivity, &state);
    v17 = objc_opt_new();
    uint64_t v18 = [v17 UUIDString];
    generationID = v12->_generationID;
    v12->_generationID = (NSString *)v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = v20;
    if (v8)
    {
      uint64_t v22 = dispatch_queue_attr_make_with_qos_class(v20, (dispatch_qos_class_t)v8, 0);

      v21 = v22;
    }
    id v23 = [NSString alloc];
    v24 = [v13 pathExtension];
    v25 = (void *)[v23 initWithFormat:@"CompanionSync.SYService.%@.%p", v24, v12];

    id v26 = v25;
    dispatch_queue_t v27 = dispatch_queue_create((const char *)[v26 UTF8String], v21);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v27;

    dispatch_queue_set_specific((dispatch_queue_t)v12->_queue, (const void *)__SYService_Queue_Tag_Key, v12, 0);
    +[SYQueueDumper registerQueue:v12->_queue];
    id v29 = [NSString alloc];
    v30 = [v13 pathExtension];
    v31 = (void *)[v29 initWithFormat:@"CompanionSync.SYService.%@.incoming-io", v30];

    id v32 = v31;
    dispatch_queue_t v33 = dispatch_queue_create_with_target_V2((const char *)[v32 UTF8String], v21, (dispatch_queue_t)v12->_queue);
    incomingIOQueue = v12->_incomingIOQueue;
    v12->_incomingIOQueue = (OS_dispatch_queue *)v33;

    +[SYQueueDumper registerQueue:v12->_incomingIOQueue];
    id v35 = [NSString alloc];
    v36 = [v13 pathExtension];
    v37 = (void *)[v35 initWithFormat:@"CompanionSync.SYService.%@.delegate", v36];

    id v38 = v37;
    dispatch_queue_t v39 = dispatch_queue_create((const char *)[v38 UTF8String], v21);
    delegateQueue = v12->_delegateQueue;
    v12->_delegateQueue = (OS_dispatch_queue *)v39;

    +[SYQueueDumper registerQueue:v12->_delegateQueue];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    v41 = (void *)_sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = v8;
      id v43 = v38;
      if (v73) {
        v44 = "as Master";
      }
      else {
        v44 = "as Slave";
      }
      v45 = @"low";
      if (!a4) {
        v45 = @"high";
      }
      if (a4 == 20) {
        v45 = @"urgent";
      }
      v46 = v45;
      v47 = v12->_generationID;
      *(_DWORD *)buf = 138544130;
      id v83 = v13;
      __int16 v84 = 2080;
      v85 = v44;
      id v38 = v43;
      uint64_t v8 = v42;
      __int16 v86 = 2114;
      v87 = v46;
      __int16 v88 = 2114;
      v89 = v47;
      v48 = v41;
      _os_log_impl(&dword_21C7C9000, v48, OS_LOG_TYPE_DEFAULT, "CompanionSync initializing new SYService %{public}@ %s, %{public}@ priority, generation %{public}@", buf, 0x2Au);
    }
    uint64_t v49 = [v13 copy];
    serviceName = v12->_serviceName;
    v12->_serviceName = (NSString *)v49;

    v12->_$FC3B5D260D4F8D1F83CF9B539A238CFB flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&v12->_flags & 0xFFFFFFFE | v73);
    v12->_int64_t defaultPriority = a4;
    uint64_t v51 = [v74 copy];
    defaultOptions = v12->_defaultOptions;
    v12->_defaultOptions = (NSDictionary *)v51;

    unsigned int v53 = *(_DWORD *)&v12->_flags & 0xFFFFFE3F | 0x80;
    *(_OWORD *)&v12->_defaultMessageTimeout = xmmword_21C87B470;
    v12->_$FC3B5D260D4F8D1F83CF9B539A238CFB flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)v53;
    v12->_engineType = 1;
    v12->_sendingBufferCap = 0x200000;
    id v54 = [NSString alloc];
    v55 = [v13 pathExtension];
    v56 = (void *)[v54 initWithFormat:@"CompanionSync.SYService.%@.SessionStartQueue", v55];

    v57 = [[_SYMultiSuspendableQueue alloc] initWithName:v56 qosClass:v8 serial:1 target:v12->_queue];
    sessionQueue = v12->_sessionQueue;
    v12->_sessionQueue = v57;

    [(_SYMultiSuspendableQueue *)v12->_sessionQueue suspend];
    if (![(_SYMultiSuspendableQueue *)v12->_sessionQueue isSuspended])
    {
      _os_assumes_log();
      -[SYService initWithService:priority:qos:asMasterStore:options:]();
    }
    [(SYService *)v12 _setupPairingNotifications];
    uint64_t v59 = +[SYDevice targetableDevice];
    targetedDevice = v12->_targetedDevice;
    v12->_targetedDevice = (SYDevice *)v59;

    v61 = [(SYDevice *)v12->_targetedDevice pairingStorePath];
    BOOL v62 = v61 == 0;

    if (!v62)
    {
      *(_DWORD *)&v12->_flags |= 8u;
      [(SYService *)v12 _updateMetaProtocolInfoForDevice:v12->_targetedDevice];
    }
    objc_initWeak((id *)buf, v12);
    v63 = [(_SYMultiSuspendableQueue *)v12->_sessionQueue dispatchQueue];
    dispatch_source_t v64 = dispatch_source_create(MEMORY[0x263EF83B8], 0, 0, v63);
    processSignalSource = v12->_processSignalSource;
    v12->_processSignalSource = (OS_dispatch_source *)v64;

    v66 = v12->_processSignalSource;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __64__SYService_initWithService_priority_qos_asMasterStore_options___block_invoke;
    handler[3] = &unk_264422C90;
    objc_copyWeak(&v79, (id *)buf);
    dispatch_source_set_event_handler(v66, handler);
    dispatch_resume((dispatch_object_t)v12->_processSignalSource);
    uint64_t v67 = objc_opt_new();
    onSessionEnd = v12->_onSessionEnd;
    v12->_onSessionEnd = (NSMutableArray *)v67;

    v69 = (void *)[v13 copy];
    objc_copyWeak(&v77, (id *)buf);
    v76 = v69;
    id v70 = v69;
    v12->_stateHandle = os_state_add_handler();
    v71 = v12;

    objc_destroyWeak(&v77);
    objc_destroyWeak(&v79);
    objc_destroyWeak((id *)buf);

    os_activity_scope_leave(&state);
  }

  return v12;
}

void __64__SYService_initWithService_priority_qos_asMasterStore_options___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _processPendingChanges];
    id WeakRetained = v2;
  }
}

- (void)dealloc
{
  os_state_remove_handler();
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SYService;
  [(SYService *)&v4 dealloc];
}

- (void)_setupPairingNotifications
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SYService__setupPairingNotifications__block_invoke;
  block[3] = &unk_264422AB0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __39__SYService__setupPairingNotifications__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(_DWORD *)(v1 + 188);
  if ((v2 & 0x20) == 0)
  {
    *(_DWORD *)(v1 + 188) = v2 | 0x20;
    objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:*(void *)(a1 + 32) selector:sel__deviceTargetabilityChanged_ name:@"SYDeviceTargetabilityChangedNotification" object:0];

    id v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:*(void *)(a1 + 32) selector:sel__deviceRemoved_ name:@"SYDeviceRemovedNotification" object:0];
  }
}

- (void)_setProtocolVersionForRemoteOSVersion:(id)a3 build:(id)a4 remoteIsWatch:(BOOL)a5 switchingEngines:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  os_unfair_lock_lock(&self->_flagLock);
  $FC3B5D260D4F8D1F83CF9B539A238CFB flags = self->_flags;
  os_unfair_lock_unlock(&self->_flagLock);
  if (!v7)
  {
    if ([v11 compare:@"13E" options:64] == -1)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v13 = _sync_log_facilities;
      if (!os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      int v19 = 138543618;
      id v20 = v10;
      __int16 v21 = 2114;
      id v22 = v11;
      uint64_t v14 = "Remote device is an iDevice running OS %{public}@ (%{public}@). Will use protocol v1 when communicating with this device.";
      goto LABEL_13;
    }
LABEL_8:
    uint64_t v15 = 2;
    goto LABEL_15;
  }
  if (objc_msgSend(v11, "compare:options:range:", @"13V", 64, 0, 3) != -1) {
    goto LABEL_8;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v13 = _sync_log_facilities;
  if (!os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_14;
  }
  int v19 = 138543618;
  id v20 = v10;
  __int16 v21 = 2114;
  id v22 = v11;
  uint64_t v14 = "Remote device is an WATCH running OS %{public}@ (%{public}@). Will use protocol v1 when communicating with this device.";
LABEL_13:
  _os_log_impl(&dword_21C7C9000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v19, 0x16u);
LABEL_14:
  uint64_t v15 = 1;
LABEL_15:
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  v16 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 67109120;
    LODWORD(v20) = v15;
    _os_log_impl(&dword_21C7C9000, v16, OS_LOG_TYPE_DEFAULT, "Updating protocol version for device OSInfo change: will use protocol v%d", (uint8_t *)&v19, 8u);
  }
  os_unfair_lock_lock(&self->_flagLock);
  self->_$FC3B5D260D4F8D1F83CF9B539A238CFB flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFFFE3F | (v15 << 6));
  os_unfair_lock_unlock(&self->_flagLock);
  if (v6)
  {
    unsigned int v17 = (*(unsigned int *)&flags >> 6) & 7;
    if (v15 != v17)
    {
      os_unfair_lock_lock(&self->_flagLock);
      $FC3B5D260D4F8D1F83CF9B539A238CFB v18 = self->_flags;
      os_unfair_lock_unlock(&self->_flagLock);
      if (v15 <= v17
        || ((*(unsigned int *)&v18 >> 11) & 7) == ((*(unsigned int *)&v18 >> 14) & 7)
        || ![(SYService *)self _protocolVersion:v15 supportsEngineType:(*(unsigned int *)&v18 >> 11) & 7])
      {
        if (v15 < v17
          && ![(SYService *)self _protocolVersion:v15 supportsEngineType:(*(unsigned int *)&v18 >> 14) & 7])
        {
          [(SYService *)self _downgradeEngineForVersion:v15];
        }
      }
      else
      {
        [(SYService *)self _upgradeEngineTo:(*(unsigned int *)&v18 >> 11) & 7];
      }
    }
  }
}

- (BOOL)_protocolVersion:(int)a3 supportsEngineType:(unsigned int)a4
{
  return a3 == 2 || a4 == 1;
}

- (void)_updateMetaProtocolInfoForDevice:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = [v4 deviceClass];
    BOOL v7 = [v5 systemVersion];
    uint64_t v8 = [v5 systemBuildVersion];
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    unsigned int v9 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
    {
      int v12 = 138543874;
      id v13 = v6;
      __int16 v14 = 2114;
      uint64_t v15 = v7;
      __int16 v16 = 2114;
      unsigned int v17 = v8;
      _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_INFO, "Remote device is a %{public}@ with system version %{public}@, build %{public}@", (uint8_t *)&v12, 0x20u);
    }
    uint64_t v10 = [v6 hasPrefix:@"Watch"];
    if (v10)
    {
      os_unfair_lock_lock(&self->_flagLock);
      *(_DWORD *)&self->_flags |= 0x200u;
      os_unfair_lock_unlock(&self->_flagLock);
    }
    [(SYService *)self _setProtocolVersionForRemoteOSVersion:v7 build:v8 remoteIsWatch:v10 switchingEngines:0];
    if ((*((unsigned char *)&self->_flags + 1) & 4) == 0)
    {
      os_unfair_lock_lock(&self->_flagLock);
      *(_DWORD *)&self->_flags |= 0x400u;
      os_unfair_lock_unlock(&self->_flagLock);
      id v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 addObserver:self selector:sel__deviceOSInfoChanged_ name:@"SYDeviceOSInfoChangedNotification" object:v5];
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, (os_log_type_t)0x90u)) {
      -[SYService _updateMetaProtocolInfoForDevice:]();
    }
    os_unfair_lock_lock(&self->_flagLock);
    self->_$FC3B5D260D4F8D1F83CF9B539A238CFB flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFFFE3F | 0x80);
    os_unfair_lock_unlock(&self->_flagLock);
  }
}

- (void)_deviceOSInfoChanged:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  id v5 = [v4 object];
  BOOL v6 = [v5 deviceClass];
  BOOL v7 = [v5 systemVersion];
  uint64_t v8 = [v5 systemBuildVersion];
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __34__SYService__deviceOSInfoChanged___block_invoke;
  v13[3] = &unk_264423228;
  v13[4] = self;
  id v14 = v7;
  id v15 = v8;
  id v16 = v6;
  id v10 = v6;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(queue, v13);

  os_activity_scope_leave(&state);
}

uint64_t __34__SYService__deviceOSInfoChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = [*(id *)(a1 + 56) hasPrefix:@"Watch"];
  return [v1 _setProtocolVersionForRemoteOSVersion:v2 build:v3 remoteIsWatch:v4 switchingEngines:1];
}

- (void)_ifDelegateImplements:(SEL)a3 do:(id)a4 then:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    delegateQueue = self->_delegateQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __43__SYService__ifDelegateImplements_do_then___block_invoke;
    v15[3] = &unk_264423250;
    id v16 = v7;
    unsigned int v17 = v8;
    v15[4] = self;
    id v12 = delegateQueue;
    id v13 = (void *)[v15 copy];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___dispatch_async_autoreleased_block_invoke;
    block[3] = &unk_264423590;
    id v19 = v13;
    id v14 = v13;
    dispatch_async(v12, block);
  }
  else if (v8)
  {
    v8[2](v8);
  }
}

void __43__SYService__ifDelegateImplements_do_then___block_invoke(void *a1)
{
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v2 = (void *)a1[6];
  if (v2)
  {
    uint64_t v3 = *(NSObject **)(a1[4] + 56);
    dispatch_async(v3, v2);
  }
}

- (void)_switchToNewTargetedDevice:(id)a3
{
  id v4 = a3;
  id v5 = [(SYDevice *)self->_targetedDevice pairingID];
  BOOL v6 = [v4 pairingID];
  [(_SYMultiSuspendableQueue *)self->_sessionQueue suspend];
  id v7 = [(SYService *)self currentSession];
  uint64_t v8 = v7;
  if (v7) {
    [v7 _pause];
  }
  dispatch_suspend((dispatch_object_t)self->_incomingIOQueue);
  os_unfair_lock_lock(&self->_flagLock);
  char flags = (char)self->_flags;
  os_unfair_lock_unlock(&self->_flagLock);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __40__SYService__switchToNewTargetedDevice___block_invoke;
  v20[3] = &unk_264422BF8;
  id v21 = v5;
  id v22 = v6;
  uint64_t v23 = self;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __40__SYService__switchToNewTargetedDevice___block_invoke_89;
  v14[3] = &unk_264423278;
  v14[4] = self;
  id v15 = v4;
  BOOL v19 = (flags & 0x10) != 0;
  id v16 = v22;
  id v17 = v21;
  id v18 = v8;
  id v10 = v8;
  id v11 = v21;
  id v12 = v22;
  id v13 = v4;
  [(SYService *)self _ifDelegateImplements:sel_service_willSwitchFromPairingID_toPairingID_ do:v20 then:v14];
}

void __40__SYService__switchToNewTargetedDevice___block_invoke(void *a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v2 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEFAULT, "Calling delegate willSwitchFromPairingID:%{public}@ toPairingID:%{public}@", (uint8_t *)&v6, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1[6] + 48));
  [WeakRetained service:a1[6] willSwitchFromPairingID:a1[4] toPairingID:a1[5]];
}

void __40__SYService__switchToNewTargetedDevice___block_invoke_89(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 184));
  uint64_t v2 = *(os_unfair_lock_s **)(a1 + 32);
  uint32_t os_unfair_lock_opaque = v2[47]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2 + 46);
  if ((os_unfair_lock_opaque & 0x10) != 0)
  {
    [*(id *)(a1 + 32) _suspend];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 184));
    *(_DWORD *)(*(void *)(a1 + 32) + 188) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 184));
  }
  [*(id *)(a1 + 32) _removePairingStoreDevice];
  [*(id *)(a1 + 32) _updateMetaProtocolInfoForDevice:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setupPairingStoreWithDevice:*(void *)(a1 + 40)];
  if ((os_unfair_lock_opaque & 0x10) != 0 && *(unsigned char *)(a1 + 72) && *(void *)(a1 + 40)
    || (os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 184)),
        uint64_t v4 = *(os_unfair_lock_s **)(a1 + 32),
        uint32_t v5 = v4[47]._os_unfair_lock_opaque,
        os_unfair_lock_unlock(v4 + 46),
        (v5 & 0x20000) != 0))
  {
    int v6 = *(void **)(a1 + 32);
    id v23 = 0;
    char v7 = [v6 resume:&v23];
    id v8 = v23;
    if (v7)
    {
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 184));
      *(_DWORD *)(*(void *)(a1 + 32) + 188) &= ~0x20000u;
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 184));
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v9 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_DEFAULT, "Failed to resume store after switching devices!", buf, 2u);
      }
    }
  }
  [*(id *)(a1 + 32) _dealWithPotentiallyStallingCurrentSession];
  if (*(void *)(a1 + 48))
  {
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = [v10 UUIDString];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 232);
    *(void *)(v12 + 232) = v11;

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v14 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(v15 + 232);
      *(_DWORD *)buf = 134218242;
      uint64_t v25 = v15;
      __int16 v26 = 2114;
      uint64_t v27 = v16;
      _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "SYService %p has new generation %{public}@", buf, 0x16u);
    }
  }
  id v17 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __40__SYService__switchToNewTargetedDevice___block_invoke_92;
  v20[3] = &unk_264422BF8;
  void v20[4] = v17;
  id v21 = *(id *)(a1 + 56);
  id v22 = *(id *)(a1 + 48);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __40__SYService__switchToNewTargetedDevice___block_invoke_2;
  v18[3] = &unk_264422990;
  v18[4] = *(void *)(a1 + 32);
  id v19 = *(id *)(a1 + 64);
  [v17 _ifDelegateImplements:sel_service_didSwitchFromPairingID_toPairingID_ do:v20 then:v18];
}

void __40__SYService__switchToNewTargetedDevice___block_invoke_92(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  [WeakRetained service:a1[4] didSwitchFromPairingID:a1[5] toPairingID:a1[6]];
}

void __40__SYService__switchToNewTargetedDevice___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasPairingStore]) {
    [*(id *)(a1 + 32) _signalPairingStoreAvailable];
  }
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2) {
    [v2 _continue];
  }
  [*(id *)(*(void *)(a1 + 32) + 80) resume];
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 64);
  dispatch_resume(v3);
}

- (void)_deviceTargetabilityChanged:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SYService__deviceTargetabilityChanged___block_invoke;
  block[3] = &unk_2644232A0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
}

void __41__SYService__deviceTargetabilityChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEBUG)) {
      __41__SYService__deviceTargetabilityChanged___block_invoke_cold_3();
    }
    uint64_t v3 = [*(id *)(a1 + 32) object];
    int v4 = [v3 isTargetable];
    uint64_t v5 = WeakRetained[19];
    if (v4)
    {
      if (v5 && objc_msgSend(v3, "isEqual:"))
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        id v6 = _sync_log_facilities;
        if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEFAULT, "Newly-targetable device is our existing targeted device. No switch actually occurring.", buf, 2u);
        }
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        char v7 = (void *)_sync_log_facilities;
        if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEBUG)) {
          __41__SYService__deviceTargetabilityChanged___block_invoke_cold_1((uint64_t)(WeakRetained + 19), v7);
        }
      }
      else
      {
        [WeakRetained _switchToNewTargetedDevice:v3];
      }
    }
    else if ([v3 isEqual:v5])
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v8 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_DEFAULT, "Targeted device became untargetable. We should get a new targetable-device notification soon.", v10, 2u);
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v9 = (void *)_sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEBUG)) {
        __41__SYService__deviceTargetabilityChanged___block_invoke_cold_2((uint64_t)(WeakRetained + 19), v9);
      }
    }
  }
}

- (void)_deviceRemoved:(id)a3
{
  id v4 = a3;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __28__SYService__deviceRemoved___block_invoke;
  block[3] = &unk_2644232A0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  os_activity_scope_leave(&state);
}

void __28__SYService__deviceRemoved___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = [*(id *)(a1 + 32) object];
    int v4 = [v3 isEqual:WeakRetained[19]];

    if (v4)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v5 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = WeakRetained[19];
        int v10 = 138412290;
        uint64_t v11 = v6;
        _os_log_impl(&dword_21C7C9000, v5, OS_LOG_TYPE_DEFAULT, "Current targeted device (%@) was removed from known devices list.", (uint8_t *)&v10, 0xCu);
      }
    }
    char v7 = +[SYDevice knownDevices];
    uint64_t v8 = [v7 count];

    if (!v8)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v9 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_DEFAULT, "Last known paired device has unpaired. SYService can no longer function.", (uint8_t *)&v10, 2u);
      }
      [WeakRetained _signalPairingStoreUnavailable];
      [WeakRetained _switchToNewTargetedDevice:0];
    }
  }
}

- (void)_removePairingStoreDevice
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"SYDeviceOSInfoChangedNotification" object:self->_targetedDevice];

  *(_DWORD *)&self->_flags &= ~0x400u;
  targetedDevice = self->_targetedDevice;
  self->_targetedDevice = 0;

  *(_DWORD *)&self->_flags &= ~8u;
}

- (void)_setupPairingStoreWithDevice:(id)a3
{
  id v5 = a3;
  id v9 = v5;
  if (v5)
  {
    uint64_t v6 = [v5 pairingStorePath];
    os_unfair_lock_lock(&self->_flagLock);
    objc_storeStrong((id *)&self->_targetedDevice, a3);
    *(_DWORD *)&self->_flags |= 8u;
    os_unfair_lock_unlock(&self->_flagLock);
  }
  else
  {
    os_unfair_lock_lock(&self->_flagLock);
    targetedDevice = self->_targetedDevice;
    self->_targetedDevice = 0;

    *(_DWORD *)&self->_flags &= ~8u;
    os_unfair_lock_lock(&self->_persistentStoreLock);
    persistentStore = self->_persistentStore;
    self->_persistentStore = 0;

    os_unfair_lock_unlock(&self->_persistentStoreLock);
    os_unfair_lock_unlock(&self->_flagLock);
  }
}

- (void)_signalPairingStoreAvailable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __41__SYService__signalPairingStoreAvailable__block_invoke;
    v8[3] = &unk_264422990;
    id v9 = WeakRetained;
    int v10 = self;
    id v5 = delegateQueue;
    uint64_t v6 = (void *)[v8 copy];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___dispatch_async_autoreleased_block_invoke;
    block[3] = &unk_264423590;
    id v12 = v6;
    id v7 = v6;
    dispatch_async(v5, block);
  }
}

uint64_t __41__SYService__signalPairingStoreAvailable__block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v2 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -serviceDidPairDevice", v4, 2u);
  }
  return [*(id *)(a1 + 32) serviceDidPairDevice:*(void *)(a1 + 40)];
}

- (void)_signalPairingStoreUnavailable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegateQueue = self->_delegateQueue;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __43__SYService__signalPairingStoreUnavailable__block_invoke;
    v8[3] = &unk_264422990;
    id v9 = WeakRetained;
    int v10 = self;
    id v5 = delegateQueue;
    uint64_t v6 = (void *)[v8 copy];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___dispatch_async_autoreleased_block_invoke;
    block[3] = &unk_264423590;
    id v12 = v6;
    id v7 = v6;
    dispatch_async(v5, block);
  }
}

uint64_t __43__SYService__signalPairingStoreUnavailable__block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v2 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -serviceDidUnpairDevice", v4, 2u);
  }
  return [*(id *)(a1 + 32) serviceDidUnpairDevice:*(void *)(a1 + 40)];
}

- (void)_dealWithPotentiallyStallingCurrentSession
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v2 = [(SYService *)self currentSession];
  uint64_t v3 = v2;
  if (v2)
  {
    int v4 = [v2 isSending];
    unsigned int v5 = [v3 state];
    if (v4)
    {
      if ((v5 & 0xFFFFFFFE) == 6)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v6 = (void *)qword_26AB04788;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
        {
          id v7 = v6;
          uint64_t v8 = _SYObfuscate(v3);
          int v21 = 138543362;
          id v22 = v8;
          _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_DEFAULT, "Canceling current sending session %{public}@ due to QWS", (uint8_t *)&v21, 0xCu);
        }
        id v9 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2021 userInfo:0];
        [v3 _handleError:v9];
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      int v10 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = v10;
        id v12 = _SYObfuscate(v3);
        unsigned int v13 = [v3 state];
        int v21 = 138543618;
        id v22 = v12;
        __int16 v23 = 2048;
        uint64_t v24 = v13;
        id v14 = "Sending session (%{public}@}) still active at time of QWS. State is %{companionsync:SYSessionState}ld, so "
              "I'm letting it continue so that IDS can give it a not-the-active-device error next time it sends";
LABEL_23:
        _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v21, 0x16u);
      }
    }
    else
    {
      if (v5 <= 1)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v15 = (void *)qword_26AB04788;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = v15;
          id v17 = _SYObfuscate(v3);
          int v21 = 138543362;
          id v22 = v17;
          _os_log_impl(&dword_21C7C9000, v16, OS_LOG_TYPE_DEFAULT, "Canceling current receiving session %{public}@ due to QWS", (uint8_t *)&v21, 0xCu);
        }
        id v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2021 userInfo:0];
        [v3 _handleError:v18];
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v19 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = v19;
        id v12 = _SYObfuscate(v3);
        unsigned int v20 = [v3 state];
        int v21 = 138543618;
        id v22 = v12;
        __int16 v23 = 2048;
        uint64_t v24 = v20;
        id v14 = "Receiving session (%{public}@}) still active at time of QWS. State is %{companionsync:SYSessionState}ld, s"
              "o I'm letting it continue so that IDS can give it a not-the-active-device error next time it sends";
        goto LABEL_23;
      }
    }
  }
}

- (void)_whenSessionEnds:(id)a3
{
  id v7 = (id)[a3 copy];
  p_flagLock = &self->_flagLock;
  os_unfair_lock_lock(&self->_flagLock);
  onSessionEnd = self->_onSessionEnd;
  uint64_t v6 = (void *)MEMORY[0x21D4B17C0](v7);
  [(NSMutableArray *)onSessionEnd addObject:v6];

  os_unfair_lock_unlock(p_flagLock);
}

- (BOOL)targetIsInProximity
{
  return [(SYSyncEngine *)self->_syncEngine targetIsNearby];
}

- (BOOL)targetIsConnected
{
  return [(SYSyncEngine *)self->_syncEngine targetConnected];
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  if (v7)
  {
    objc_storeStrong((id *)&self->_delegateQueue, a4);
  }
  else
  {
    id v8 = [(NSString *)self->_serviceName lastPathComponent];
    __snprintf_chk(label, 0x80uLL, 0, 0x80uLL, "CompanionSync.SYService.%s.delegate", (const char *)[v8 UTF8String]);

    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v10 = (OS_dispatch_queue *)dispatch_queue_create(label, v9);
    delegateQueue = self->_delegateQueue;
    self->_delegateQueue = v10;
  }
  objc_storeWeak((id *)&self->_delegate, v6);
  os_activity_scope_leave(&state);
}

- (BOOL)resume:(id *)a3
{
  v32[1] = *MEMORY[0x263EF8340];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  os_unfair_lock_lock(&self->_flagLock);
  $FC3B5D260D4F8D1F83CF9B539A238CFB flags = self->_flags;
  os_unfair_lock_unlock(&self->_flagLock);
  if ((*(unsigned char *)&flags & 0x10) != 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR)) {
      -[SYService resume:]();
    }
    if (a3)
    {
      int v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v31 = *MEMORY[0x263F08320];
      v32[0] = @"SYService has already been resumed.";
      uint64_t v11 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
      *a3 = [v10 errorWithSYError:2002 userInfo:v11];
    }
    goto LABEL_22;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v7 = WeakRetained == 0;

  if (v7)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR)) {
      -[SYService resume:]();
    }
    if (a3)
    {
      id v12 = (void *)MEMORY[0x263F087E8];
      uint64_t v29 = *MEMORY[0x263F08320];
      v30 = @"SYService cannot be resumed until a delegate has been set.";
      unsigned int v13 = [NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      *a3 = [v12 errorWithSYError:2001 userInfo:v13];
    }
    goto LABEL_22;
  }
  os_unfair_lock_lock(&self->_flagLock);
  $FC3B5D260D4F8D1F83CF9B539A238CFB v8 = self->_flags;
  os_unfair_lock_unlock(&self->_flagLock);
  if ((*(unsigned char *)&v8 & 8) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR)) {
      -[SYService resume:]();
    }
    if (a3)
    {
      [MEMORY[0x263F087E8] errorWithSYError:2003 userInfo:0];
      BOOL v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
LABEL_22:
    BOOL v9 = 0;
    goto LABEL_23;
  }
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = __Block_byref_object_copy__5;
  id v22 = __Block_byref_object_dispose__5;
  id v23 = 0;
  queue = self->_queue;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __20__SYService_resume___block_invoke;
  v17[3] = &unk_2644232C8;
  v17[4] = self;
  v17[5] = &v18;
  v17[6] = &v24;
  _dispatch_sync_safe_tagged(queue, self, v17);
  int v16 = *((unsigned __int8 *)v25 + 24);
  if (a3 && !*((unsigned char *)v25 + 24))
  {
    *a3 = (id) v19[5];
    int v16 = *((unsigned __int8 *)v25 + 24);
  }
  BOOL v9 = v16 != 0;
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
LABEL_23:
  os_activity_scope_leave(&state);
  return v9;
}

void __20__SYService_resume___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(v2 + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = [v3 _initializeServiceDB:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if ((v5 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR)) {
      __20__SYService_resume___block_invoke_cold_3();
    }
    goto LABEL_14;
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v13 = *(id *)(v7 + 40);
  char v8 = [v6 _initializeMessaging:&v13];
  objc_storeStrong((id *)(v7 + 40), v13);
  if ((v8 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR)) {
      __20__SYService_resume___block_invoke_cold_2();
    }
LABEL_14:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    return;
  }
  BOOL v9 = [*(id *)(a1 + 32) persistentStore];
  uint64_t v10 = [v9 peerID];
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 200);
  *(void *)(v11 + 200) = v10;

  [*(id *)(*(void *)(a1 + 32) + 80) resume];
  if ([*(id *)(*(void *)(a1 + 32) + 80) isSuspended]) {
    __20__SYService_resume___block_invoke_cold_1();
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 188) |= 0x10u;
}

- (void)suspend
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __20__SYService_suspend__block_invoke;
  v4[3] = &unk_264422AB0;
  v4[4] = self;
  _dispatch_sync_safe_tagged(queue, self, v4);
  os_activity_scope_leave(&state);
}

uint64_t __20__SYService_suspend__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 184));
  *(_DWORD *)(*(void *)(a1 + 32) + 188) &= ~0x20000u;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 184));
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _suspend];
}

- (id)_makeSessionForDeltaSync:(BOOL)a3
{
  if ((*(_DWORD *)&self->_flags & 0x1C0) == 0x40)
  {
    if (a3)
    {
      uint64_t v4 = SYOutgoingDeltaTransactionSession;
    }
    else
    {
      id v6 = [(SYService *)self name];
      int v7 = [v6 isEqualToString:@"com.apple.private.alloy.maps.sync"];

      if (v7) {
        uint64_t v4 = SYOutgoingSyncAllObjectsSession;
      }
      else {
        uint64_t v4 = SYOutgoingBatchSyncSession;
      }
    }
    char v5 = (SYSendingSession *)[[v4 alloc] initWithService:self];
  }
  else
  {
    char v5 = [[SYSendingSession alloc] initWithService:self isReset:!a3];
  }
  return v5;
}

- (void)_processPendingChanges
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7_0(v1, v2, 5.8381e-34);
  _os_log_error_impl(&dword_21C7C9000, v3, (os_log_type_t)0x90u, "About to build a new session, but there's already one running! Currently-running session is %{public}@", v4, 0xCu);
}

void __35__SYService__processPendingChanges__block_invoke(void *a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:startSession:error:", buf, 2u);
  }
  os_log_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v9 = 0;
  char v6 = [v3 service:v4 startSession:v5 error:&v9];
  id v7 = v9;
  id v8 = v9;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v7);
  }
}

void __35__SYService__processPendingChanges__block_invoke_117(uint64_t a1, char a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2)
    {
      unint64_t pseudo_signpost_id = _next_pseudo_signpost_id();
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v8 = (id)qword_26AB047B8;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (id *)(a1 + 40);
        if (*(unsigned char *)(a1 + 56)) {
          uint64_t v10 = "delta";
        }
        else {
          uint64_t v10 = "reset";
        }
        uint64_t v20 = v10;
        uint64_t v11 = (objc_class *)objc_opt_class();
        id v12 = NSStringFromClass(v11);
        id v13 = [*v9 identifier];
        uint64_t v14 = [WeakRetained name];
        uint64_t v15 = [*v9 reason];
        if (v15)
        {
          int v16 = [*(id *)(a1 + 40) reason];
        }
        else
        {
          int v16 = @"-";
        }
        *(_DWORD *)buf = 134219266;
        unint64_t v23 = pseudo_signpost_id;
        __int16 v24 = 2082;
        uint64_t v25 = v20;
        __int16 v26 = 2114;
        char v27 = v12;
        __int16 v28 = 2114;
        uint64_t v29 = v13;
        __int16 v30 = 2114;
        uint64_t v31 = v14;
        __int16 v32 = 2114;
        dispatch_queue_t v33 = v16;
        _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_DEFAULT, "Start signpost %llu: Started outgoing %{public}s %{public}@ with identifier %{public}@ for service %{public}@. Reason = '%{public}@'", buf, 0x3Eu);
        if (v15) {
      }
        }
      [*(id *)(a1 + 40) setSessionSignpost:pseudo_signpost_id];
    }
    else
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 168), &state);
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v17 = (id)qword_26AB04788;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = (objc_class *)objc_opt_class();
        id v19 = NSStringFromClass(v18);
        *(_DWORD *)buf = 138543618;
        unint64_t v23 = (unint64_t)v19;
        __int16 v24 = 2112;
        uint64_t v25 = v5;
        _os_log_impl(&dword_21C7C9000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ failed to start: %@", buf, 0x16u);
      }
      os_activity_scope_leave(&state);
    }
  }
}

- (void)_sendResetRequest
{
  if ((*(_DWORD *)&self->_flags & 0x1C0) == 0x40)
  {
    os_log_t v3 = objc_opt_new();
    id v4 = [(SYService *)self _newMessageHeader];
    [v3 setHeader:v4];

    uint64_t v5 = objc_opt_new();
    char v6 = [v5 UUIDString];
    [v3 setSyncID:v6];

    syncEngine = self->_syncEngine;
    int64_t v8 = [(SYService *)self priority];
    customIDSOptions = self->_customIDSOptions;
    uint64_t v21 = MEMORY[0x263EF8330];
    uint64_t v22 = 3221225472;
    unint64_t v23 = __30__SYService__sendResetRequest__block_invoke;
    __int16 v24 = &unk_264422E20;
    uint64_t v25 = self;
    uint64_t v10 = &v21;
    uint64_t v11 = syncEngine;
    id v12 = v3;
    uint64_t v13 = 1;
  }
  else
  {
    os_log_t v3 = objc_opt_new();
    id v14 = [(SYService *)self _newMessageHeader];
    [v3 setHeader:v14];

    uint64_t v15 = self->_syncEngine;
    int64_t v8 = [(SYService *)self priority];
    customIDSOptions = self->_customIDSOptions;
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __30__SYService__sendResetRequest__block_invoke_127;
    id v19 = &unk_264422E20;
    uint64_t v20 = self;
    uint64_t v10 = &v16;
    uint64_t v11 = v15;
    id v12 = v3;
    uint64_t v13 = 101;
  }
  -[SYSyncEngine enqueueSyncRequest:withMessageID:priority:options:userContext:callback:](v11, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v12, v13, v8, customIDSOptions, 0, v10, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25);
}

void __30__SYService__sendResetRequest__block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 168), &v12);
  if (a2)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v10 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Enqueued full-sync request with ID %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), a3);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v11 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "Failed to enqueue full-sync request: %@", buf, 0xCu);
    }
  }
  os_activity_scope_leave(&v12);
}

void __30__SYService__sendResetRequest__block_invoke_127(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(*(void *)(a1 + 32) + 168), &v12);
  if (a2)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v10 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v14 = v8;
      _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Enqueued reset request with ID %{public}@", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 136), a3);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v11 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "Failed to enqueue reset request: %@", buf, 0xCu);
    }
  }
  os_activity_scope_leave(&v12);
}

- (void)setHasChangesAvailable
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  os_log_t v3 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Delta requested", v4, 2u);
  }
  os_unfair_lock_lock(&self->_flagLock);
  *(_DWORD *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_flagLock);
  dispatch_source_merge_data((dispatch_source_t)self->_processSignalSource, 1uLL);
  os_activity_scope_leave(&state);
}

- (void)setNeedsResetSync
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  os_log_t v3 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEFAULT, "Reset requested", v4, 2u);
  }
  os_unfair_lock_lock(&self->_flagLock);
  *(_DWORD *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_flagLock);
  dispatch_source_merge_data((dispatch_source_t)self->_processSignalSource, 1uLL);
  os_activity_scope_leave(&state);
}

- (id)_pathForDataStore
{
  return [(SYDevice *)self->_targetedDevice pairingStorePath];
}

- (BOOL)_initializeServiceDB:(id *)a3
{
  v39[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = _os_activity_create(&dword_21C7C9000, "SYService DB Setup", (os_activity_t)self->_serviceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  v29.opaque[0] = 0;
  v29.opaque[1] = 0;
  os_activity_scope_enter(v5, &v29);
  char v6 = [(SYService *)self _pathForDataStore];
  if ([v6 length])
  {
    uint64_t v7 = *MEMORY[0x263F08028];
    v36[0] = *MEMORY[0x263F08060];
    v36[1] = v7;
    v37[0] = @"mobile";
    v37[1] = @"mobile";
    v36[2] = *MEMORY[0x263F08078];
    v37[2] = &unk_26CD338B0;
    id v8 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
    id v9 = [MEMORY[0x263F08850] defaultManager];
    char v10 = [v9 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v8 error:a3];

    if (v10)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v11 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "Setting up change-list database", buf, 2u);
      }
      self->_persistentStoreLock._uint32_t os_unfair_lock_opaque = 0;
      os_activity_scope_state_s v12 = [(SYService *)self persistentStore];
      BOOL v13 = v12 != 0;

      if (v13)
      {
        id v14 = [SYVectorClock alloc];
        uint64_t v15 = [(SYService *)self persistentStore];
        uint64_t v16 = [v15 vectorClockJSON];
        uint64_t v17 = [(SYVectorClock *)v14 initWithJSONRepresentation:v16];
        vectorClock = self->_vectorClock;
        self->_vectorClock = v17;

        if (![(SYVectorClock *)self->_vectorClock clocksCount])
        {
          id v19 = self->_vectorClock;
          uint64_t v20 = [(SYService *)self peerID];
          [(SYVectorClock *)v19 incrementClockForPeerID:v20];

          [(SYService *)self _vectorClockUpdated];
        }
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v21 = (id)_sync_log_facilities;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v22 = [(SYService *)self peerID];
          unint64_t v23 = [(SYService *)self persistentStore];
          __int16 v24 = [v23 vectorClockJSON];
          *(_DWORD *)buf = 138543618;
          uint64_t v31 = v22;
          __int16 v32 = 2114;
          dispatch_queue_t v33 = v24;
          _os_log_impl(&dword_21C7C9000, v21, OS_LOG_TYPE_DEFAULT, "SYService persistent store initialized. PeerID = %{public}@, vector clock = %{public}@.", buf, 0x16u);
        }
        goto LABEL_27;
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR)) {
        -[SYService _initializeServiceDB:]();
      }
      if (a3)
      {
        id v27 = objc_alloc(MEMORY[0x263F087E8]);
        uint64_t v34 = *MEMORY[0x263F08320];
        id v35 = @"Failed to create persistent store";
        uint64_t v21 = [NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        *a3 = (id)[v27 initWithSYError:2001 userInfo:v21];
LABEL_27:

        goto LABEL_29;
      }
    }
    BOOL v13 = 0;
    goto LABEL_29;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR)) {
    -[SYService _initializeServiceDB:]();
  }
  if (a3)
  {
    id v25 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v38 = *MEMORY[0x263F08320];
    v39[0] = @"No pairing store path is available, which usually indicates we are not paired.";
    id v8 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
    id v26 = (id)[v25 initWithSYError:2003 userInfo:v8];
    BOOL v13 = 0;
    *a3 = v26;
LABEL_29:

    goto LABEL_30;
  }
  BOOL v13 = 0;
LABEL_30:

  os_activity_scope_leave(&v29);
  return v13;
}

- (void)_vectorClockUpdated
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = [(SYVectorClock *)self->_vectorClock jsonRepresentation];
  os_log_t v3 = [(SYService *)self persistentStore];
  [v3 setVectorClockJSON:v4];
}

- (id)_makeSyncEngineOfType:(unsigned int)a3
{
  os_log_t v3 = off_264422548;
  if (a3 != 2) {
    os_log_t v3 = off_264422580;
  }
  id v4 = (void *)[objc_alloc(*v3) initWithService:self queue:self->_queue];
  return v4;
}

- (BOOL)_initializeMessaging:(id *)a3
{
  uint64_t v5 = _os_activity_create(&dword_21C7C9000, "SYService Sync Engine Setup", (os_activity_t)self->_serviceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v5, &v15);
  os_unfair_lock_lock(&self->_flagLock);
  self->_$FC3B5D260D4F8D1F83CF9B539A238CFB flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFFC7FF | ((self->_engineType & 7) << 11));
  os_unfair_lock_unlock(&self->_flagLock);
  syncEngine = self->_syncEngine;
  if (!syncEngine)
  {
    os_unfair_lock_lock(&self->_flagLock);
    $FC3B5D260D4F8D1F83CF9B539A238CFB flags = self->_flags;
    os_unfair_lock_unlock(&self->_flagLock);
    if ((*(_WORD *)&flags & 0x1C0) == 0x40)
    {
      id v8 = [(SYService *)self _makeSyncEngineOfType:1];
      id v9 = self->_syncEngine;
      self->_syncEngine = v8;

      os_unfair_lock_lock(&self->_flagLock);
      unsigned int v10 = 0x4000;
    }
    else
    {
      uint64_t v11 = [(SYService *)self _makeSyncEngineOfType:self->_engineType];
      os_activity_scope_state_s v12 = self->_syncEngine;
      self->_syncEngine = v11;

      os_unfair_lock_lock(&self->_flagLock);
      unsigned int v10 = (self->_engineType & 7) << 14;
    }
    self->_$FC3B5D260D4F8D1F83CF9B539A238CFB flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFE3FFF | v10);
    os_unfair_lock_unlock(&self->_flagLock);
    [(SYSyncEngine *)self->_syncEngine setResponder:self];
    syncEngine = self->_syncEngine;
  }
  BOOL v13 = [(SYSyncEngine *)syncEngine resume:a3];

  os_activity_scope_leave(&v15);
  return v13;
}

- (void)_swapEngineTo:(unsigned int)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v5 = _os_activity_create(&dword_21C7C9000, "SYService Sync Engine Swap", (os_activity_t)self->_serviceActivity, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  p_syncEngine = &self->_syncEngine;
  syncEngine = self->_syncEngine;
  id v8 = syncEngine;
  [(SYSyncEngine *)v8 suspend];
  id v9 = self->_syncEngine;
  self->_syncEngine = 0;

  unsigned int v10 = off_264422548;
  if (a3 != 2) {
    unsigned int v10 = off_264422580;
  }
  uint64_t v11 = (SYSyncEngine *)[objc_alloc(*v10) initWithService:self queue:self->_queue];
  os_activity_scope_state_s v12 = self->_syncEngine;
  self->_syncEngine = v11;

  [(SYSyncEngine *)self->_syncEngine setResponder:self];
  BOOL v13 = *p_syncEngine;
  id v34 = 0;
  BOOL v14 = [(SYSyncEngine *)v13 resume:&v34];
  id v15 = v34;
  if (v14)
  {
    os_unfair_lock_lock(&self->_flagLock);
    self->_$FC3B5D260D4F8D1F83CF9B539A238CFB flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFE3FFF | ((a3 & 7) << 14));
    os_unfair_lock_unlock(&self->_flagLock);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v16 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v16, OS_LOG_TYPE_DEFAULT, "Returning to original engine after swap error", buf, 2u);
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v17 = (id)_sync_log_facilities;
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    {
      _SYObfuscate(v15);
      objc_claimAutoreleasedReturnValue();
      -[SYService _swapEngineTo:]();
    }

    objc_storeStrong((id *)&self->_syncEngine, syncEngine);
    uint64_t v18 = *p_syncEngine;
    id v33 = 0;
    BOOL v19 = [(SYSyncEngine *)v18 resume:&v33];
    id v15 = v33;
    if (!v19)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v20 = (id)_sync_log_facilities;
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        _SYObfuscate(v15);
        objc_claimAutoreleasedReturnValue();
        -[SYService _swapEngineTo:]();
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v22 = objc_opt_respondsToSelector();

      if (v22)
      {
        delegateQueue = self->_delegateQueue;
        uint64_t v27 = MEMORY[0x263EF8330];
        uint64_t v28 = 3221225472;
        os_activity_scope_state_s v29 = __27__SYService__swapEngineTo___block_invoke;
        __int16 v30 = &unk_264422990;
        uint64_t v31 = self;
        id v32 = v15;
        __int16 v24 = delegateQueue;
        id v25 = (void *)[&v27 copy];
        *(void *)buf = MEMORY[0x263EF8330];
        uint64_t v37 = 3221225472;
        uint64_t v38 = ___dispatch_async_autoreleased_block_invoke;
        dispatch_queue_t v39 = &unk_264423590;
        id v40 = v25;
        id v26 = v25;
        dispatch_async(v24, buf);
      }
      [(SYService *)self suspend];
    }
  }

  os_activity_scope_leave(&state);
}

void __27__SYService__swapEngineTo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained service:*(void *)(a1 + 32) encounteredError:*(void *)(a1 + 40) context:0];
}

- (void)_upgradeEngineTo:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [(SYService *)self currentSession];

  if (v5)
  {
    char v6 = [(SYService *)self currentSession];
    [v6 cancel];

    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __30__SYService__upgradeEngineTo___block_invoke;
    v7[3] = &unk_264423340;
    objc_copyWeak(&v8, &location);
    int v9 = v3;
    [(SYService *)self _whenSessionEnds:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  [(SYService *)self _swapEngineTo:v3];
}

void __30__SYService__upgradeEngineTo___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _upgradeEngineTo:*(unsigned int *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_downgradeEngineForVersion:(int)a3
{
  uint64_t v5 = [(SYService *)self currentSession];

  if (v5)
  {
    char v6 = [(SYService *)self currentSession];
    [v6 cancel];

    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40__SYService__downgradeEngineForVersion___block_invoke;
    v8[3] = &unk_264423340;
    objc_copyWeak(&v9, &location);
    int v10 = a3;
    [(SYService *)self _whenSessionEnds:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  if (a3 == 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  [(SYService *)self _swapEngineTo:v7];
}

void __40__SYService__downgradeEngineForVersion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _downgradeEngineForVersion:*(unsigned int *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_suspend
{
  _os_assumes_log();
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (OUTLINED_FUNCTION_3_0()) {
    OUTLINED_FUNCTION_0_5(&dword_21C7C9000, v0, v1, "Queue state assumption failed: _sessionQueue.suspended == YES", v2, v3, v4, v5, 0);
  }
}

- (void)_copyPeerClockFromMessageHeaderIfNecessary:(id)a3
{
  id v4 = a3;
  vectorClock = self->_vectorClock;
  id v11 = v4;
  char v6 = [v4 sender];
  LOBYTE(vectorClock) = [(SYVectorClock *)vectorClock hasClockForPeer:v6];

  if ((vectorClock & 1) == 0)
  {
    uint64_t v7 = self->_vectorClock;
    id v8 = [v11 state];
    id v9 = [v11 sender];
    int v10 = [v8 clockForPeer:v9];
    [(SYVectorClock *)v7 addClocks:v10];

    [(SYService *)self _vectorClockUpdated];
  }
}

- (id)_newMessageHeader
{
  uint64_t v3 = objc_opt_new();
  [v3 setTimestamp:CFAbsoluteTimeGetCurrent()];
  id v4 = [SYPeer alloc];
  uint64_t v5 = [(SYService *)self peerID];
  char v6 = [(SYPeer *)v4 initWithPeerID:v5 generation:self->_generationID];
  [v3 setSender:v6];

  uint64_t v7 = (void *)[(SYVectorClock *)self->_vectorClock copy];
  [v3 setState:v7];

  [v3 setVersion:(*(_DWORD *)&self->_flags >> 6) & 7];
  id v8 = [(SYService *)self persistentStore];
  objc_msgSend(v3, "setSequenceNumber:", objc_msgSend(v8, "nextSequenceNumber"));

  return v3;
}

- (void)sessionDidEnd:(id)a3 withError:(id)a4
{
  char v6 = (SYSession *)a3;
  id v7 = a4;
  if (self->_currentSession == v6)
  {
LABEL_11:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      delegateQueue = self->_delegateQueue;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __37__SYService_sessionDidEnd_withError___block_invoke;
      v20[3] = &unk_264422BF8;
      void v20[4] = self;
      BOOL v13 = (id *)&v21;
      uint64_t v21 = v6;
      id v22 = v7;
      BOOL v14 = delegateQueue;
      id v15 = (void *)[v20 copy];
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v24 = 3221225472;
      id v25 = ___dispatch_async_autoreleased_block_invoke;
      id v26 = &unk_264423590;
      id v27 = v15;
      id v16 = v15;
      dispatch_async(v14, buf);
    }
    else
    {
      queue = self->_queue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__SYService_sessionDidEnd_withError___block_invoke_2;
      block[3] = &unk_264422990;
      void block[4] = self;
      BOOL v13 = (id *)&v19;
      BOOL v19 = v6;
      dispatch_async(queue, block);
    }

    goto LABEL_15;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v8 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
    -[SYService sessionDidEnd:withError:](v8);
  }
  if (!self->_currentSession)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v9 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_DEFAULT, "The current session is nil, so I'll inform the delegate anyway", buf, 2u);
    }
    goto LABEL_11;
  }
LABEL_15:
}

void __37__SYService_sessionDidEnd_withError___block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:sessionEnded:error:", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  [WeakRetained service:*(void *)(a1 + 32) sessionEnded:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(v4 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__SYService_sessionDidEnd_withError___block_invoke_149;
  v6[3] = &unk_264422990;
  v6[4] = v4;
  id v7 = *(id *)(a1 + 40);
  dispatch_async(v5, v6);
}

uint64_t __37__SYService_sessionDidEnd_withError___block_invoke_149(uint64_t a1)
{
  return [*(id *)(a1 + 32) _wrapUpCurrentSession:*(void *)(a1 + 40)];
}

uint64_t __37__SYService_sessionDidEnd_withError___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _wrapUpCurrentSession:*(void *)(a1 + 40)];
}

- (void)_wrapUpCurrentSession:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v4 = (SYSession *)a3;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v5 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    char v6 = v5;
    if ([(SYSession *)v4 isResetSync]) {
      id v7 = "reset";
    }
    else {
      id v7 = "delta";
    }
    id v8 = [(SYService *)self name];
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_INFO, "Wrapping up %s session for service %{public}@", buf, 0x16u);
  }
  if (self->_currentSession == v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(SYSession *)v4 birthDate];
    double v15 = Current - v14;
    if (v15 < 0.0)
    {
      id v16 = (void *)MEMORY[0x263EFF910];
      [(SYSession *)v4 birthDate];
      uint64_t v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v18 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
        -[SYService _wrapUpCurrentSession:]((uint64_t)v17, v18);
      }
    }
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    BOOL v19 = (id)qword_26AB047B8;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [(SYSession *)v4 sessionSignpost];
      if ([(SYSession *)v4 isResetSync]) {
        uint64_t v21 = "Reset";
      }
      else {
        uint64_t v21 = "Delta";
      }
      id v22 = [(SYSession *)v4 identifier];
      unint64_t v23 = [(SYService *)self name];
      uint64_t v24 = [(SYSession *)v4 reason];
      if (v24)
      {
        id v25 = [(SYSession *)v4 reason];
      }
      else
      {
        id v25 = @"-";
      }
      *(_DWORD *)buf = 134219266;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v21;
      __int16 v47 = 2114;
      v48 = v22;
      __int16 v49 = 2114;
      v50 = v23;
      __int16 v51 = 2114;
      v52 = v25;
      __int16 v53 = 2048;
      double v54 = v15;
      _os_log_impl(&dword_21C7C9000, v19, OS_LOG_TYPE_DEFAULT, "End signpost %llu: %s session with identifier %{public}@ for service %{public}@ (reason '%{public}@') completed in %.04f seconds.", buf, 0x3Eu);
      if (v24) {
    }
      }
    [(SYSession *)v4 isSending];
    [(SYSyncEngine *)self->_syncEngine endSession];
    currentSession = self->_currentSession;
    self->_currentSession = 0;

    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = 0;
    os_activity_scope_enter((os_activity_t)self->_serviceActivity, (os_activity_scope_state_t)buf);
    os_unfair_lock_lock(&self->_flagLock);
    if ([(NSMutableArray *)self->_onSessionEnd count])
    {
      id v27 = (void *)[(NSMutableArray *)self->_onSessionEnd copy];
      [(NSMutableArray *)self->_onSessionEnd removeAllObjects];
    }
    else
    {
      id v27 = 0;
    }
    os_unfair_lock_unlock(&self->_flagLock);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v28 = v27;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v28);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v41 + 1) + 8 * i) + 16))();
        }
        uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v45 count:16];
      }
      while (v29);
    }

    queuedStartSession = self->_queuedStartSession;
    if (queuedStartSession)
    {
      id v33 = queuedStartSession;
      id v34 = self->_queuedStartSession;
      self->_queuedStartSession = 0;

      objc_initWeak(&location, self);
      queue = self->_queue;
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __35__SYService__wrapUpCurrentSession___block_invoke;
      void v37[3] = &unk_264423368;
      objc_copyWeak(&v39, &location);
      v37[4] = self;
      uint64_t v38 = v33;
      v36 = v33;
      dispatch_async(queue, v37);

      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    else
    {
      [(_SYMultiSuspendableQueue *)self->_sessionQueue resume];
    }

    os_activity_scope_leave((os_activity_scope_state_t)buf);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v9 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = v9;
      char v11 = [(SYSession *)v4 identifier];
      os_activity_scope_state_s v12 = [(SYSession *)self->_currentSession identifier];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v12;
      _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Wrapping up session %{public}@ is not the current session (%{public}@)", buf, 0x16u);
    }
    [(_SYMultiSuspendableQueue *)self->_sessionQueue resume];
  }
}

void __35__SYService__wrapUpCurrentSession___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __35__SYService__wrapUpCurrentSession___block_invoke_2;
    v5[3] = &unk_264422990;
    v5[4] = WeakRetained;
    id v6 = *(id *)(a1 + 40);
    dispatch_async(v4, v5);
  }
}

void __35__SYService__wrapUpCurrentSession___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) request];
  uint64_t v4 = [*(id *)(a1 + 40) completion];
  [v2 _handleStartSession:v3 completion:v4];

  if (([*(id *)(*(void *)(a1 + 32) + 80) isSuspended] & 1) == 0) {
    __35__SYService__wrapUpCurrentSession___block_invoke_2_cold_1();
  }
  [*(id *)(*(void *)(a1 + 32) + 80) resume];
  if (([*(id *)(*(void *)(a1 + 32) + 80) isSuspended] & 1) == 0) {
    __35__SYService__wrapUpCurrentSession___block_invoke_2_cold_1();
  }
}

- (void)sessionFailedToCancelMessageUUIDs:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    uint64_t v4 = [(SYService *)self persistentStore];
    [v4 addMessageIDsToIgnore:v5];
  }
}

- (id)_chooseBetweenCollidingSessions:(id)a3 :(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 isResetSync];
  if (v8 != [v7 isResetSync])
  {
    id v9 = [v6 isResetSync] ? v7 : v6;
    id v10 = v9;
    if (v10) {
      goto LABEL_28;
    }
  }
  unsigned int v11 = (*(_DWORD *)&self->_flags >> 6) & 7;
  if (v11 < 2)
  {
    if (v11 != 1)
    {
LABEL_17:
      id v10 = 0;
      goto LABEL_18;
    }
    [v7 birthDate];
    double v21 = v20;
    [v6 birthDate];
    double v19 = v21 - v22;
  }
  else
  {
    os_activity_scope_state_s v12 = _SessionIdentifierDateFormatter();
    BOOL v13 = [v6 identifier];
    double v14 = [v12 dateFromString:v13];

    double v15 = _SessionIdentifierDateFormatter();
    id v16 = [v7 identifier];
    uint64_t v17 = [v15 dateFromString:v16];

    [v14 timeIntervalSinceDate:v17];
    double v19 = v18;
  }
  unint64_t v23 = v7;
  if (v19 <= 1.0)
  {
    unint64_t v23 = v6;
    if (v19 >= -1.0) {
      goto LABEL_17;
    }
  }
  id v24 = v23;
  id v10 = v24;
  if (v24 && [v24 hasRejectedPeerSession])
  {
    if (v10 == v6)
    {
      id v10 = v7;

      if (v10) {
        goto LABEL_28;
      }
    }
    else
    {
      id v25 = v6;

      id v10 = v25;
      if (v25) {
        goto LABEL_28;
      }
    }
    goto LABEL_19;
  }
LABEL_18:
  [v10 setHasRejectedPeerSession:1];
  if (v10) {
    goto LABEL_28;
  }
LABEL_19:
  BOOL v26 = [(SYService *)self isMasterStore];
  int v27 = [v6 isSending];
  if (v27) {
    id v28 = v7;
  }
  else {
    id v28 = v6;
  }
  if (v27) {
    id v29 = v6;
  }
  else {
    id v29 = v7;
  }
  if (!v26) {
    id v28 = v29;
  }
  id v10 = v28;
LABEL_28:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v31 = objc_opt_respondsToSelector();

  if (v31)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v32 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
      -[SYService _chooseBetweenCollidingSessions::](v32, v10);
    }
    if (v10 == v6) {
      id v33 = v7;
    }
    else {
      id v33 = v6;
    }
    id v34 = v33;
    uint64_t v50 = 0;
    __int16 v51 = &v50;
    uint64_t v52 = 0x3032000000;
    __int16 v53 = __Block_byref_object_copy__5;
    double v54 = __Block_byref_object_dispose__5;
    id v55 = 0;
    delegateQueue = self->_delegateQueue;
    uint64_t v42 = MEMORY[0x263EF8330];
    uint64_t v43 = 3221225472;
    long long v44 = __46__SYService__chooseBetweenCollidingSessions::__block_invoke;
    v45 = &unk_264423390;
    __int16 v49 = &v50;
    v46 = self;
    id v10 = v10;
    id v47 = v10;
    id v36 = v34;
    id v48 = v36;
    uint64_t v37 = &v42;
    *(void *)&long long block = MEMORY[0x263EF8330];
    *((void *)&block + 1) = 3221225472;
    v57 = ___dispatch_sync_autoreleased_block_invoke;
    v58 = &unk_264423590;
    uint64_t v59 = v37;
    dispatch_sync(delegateQueue, &block);

    if ((id)v51[5] == v36)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v38 = (id)qword_26AB04788;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        id v39 = objc_msgSend((id)v51[5], "identifier", v42, v43, v44, v45, v46, v47);
        LODWORD(block) = 138543362;
        *(void *)((char *)&block + 4) = v39;
        _os_log_impl(&dword_21C7C9000, v38, OS_LOG_TYPE_DEFAULT, "Delegate vetoed our decision. Session %{public}@ is now the winner", (uint8_t *)&block, 0xCu);
      }
      id v40 = (id)v51[5];

      id v10 = v40;
    }

    _Block_object_dispose(&v50, 8);
  }

  return v10;
}

void __46__SYService__chooseBetweenCollidingSessions::__block_invoke(void *a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:willPreferSession:overSession:", v7, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  uint64_t v4 = [WeakRetained service:a1[4] willPreferSession:a1[5] overSession:a1[6]];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (BOOL)_shouldSession:(id)a3 fromPeer:(id)a4 supercedeSession:(id)a5 ofAge:(double)a6 collisionDetected:(BOOL *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  int v15 = [v14 state];
  switch(v15)
  {
    case 0:
      goto LABEL_4;
    case 7:
      BOOL v16 = [(SYSyncEngine *)self->_syncEngine buffersSessions];
      if (v16) {
        BOOL v16 = [(SYSyncEngine *)self->_syncEngine buffersHandshake];
      }
      break;
    case 6:
LABEL_4:
      BOOL v16 = 1;
      break;
    default:
      BOOL v16 = 0;
      break;
  }
  if (a7) {
    *a7 = v16;
  }
  if (v16 && self->_sessionStalenessInterval > a6)
  {
    id v17 = [(SYService *)self _chooseBetweenCollidingSessions:v12 :v14];
    if (v17 == v12) {
      char v18 = 1;
    }
    else {
      char v18 = [v14 _willAcquiesceToNewSessionFromPeer:v13];
    }
    goto LABEL_21;
  }
  if ([v14 _willAcquiesceToNewSessionFromPeer:v13])
  {
    char v18 = 1;
  }
  else if (self->_sessionStalenessInterval <= a6)
  {
    unsigned int v19 = (*(_DWORD *)&self->_flags >> 6) & 7;
    if (v19 >= 2)
    {
      id v17 = [v12 identifier];
      double v20 = [v14 identifier];
      char v18 = [v17 compare:v20] == 1;

LABEL_21:
      goto LABEL_28;
    }
    char v18 = a6 > 1800.0 && v19 == 1;
  }
  else
  {
    char v18 = 0;
  }
LABEL_28:

  return v18;
}

- (void)_postVersionRejectionMessageForMessageWithID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SYService *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__SYService__postVersionRejectionMessageForMessageWithID___block_invoke;
  v7[3] = &unk_264422990;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __58__SYService__postVersionRejectionMessageForMessageWithID___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _newMessageHeader];
  [v3 setHeader:v2];

  [v3 setInReplyTo:*(void *)(a1 + 40)];
  [v3 setSupportedVersions:&_postVersionRejectionMessageForMessageWithID__supportedVersions count:2];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v3, 0x7FFFLL, objc_msgSend(*(id *)(a1 + 32), "priority"), 0, 0, &__block_literal_global_157);
}

void __58__SYService__postVersionRejectionMessageForMessageWithID___block_invoke_2(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (a2)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v8 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      id v13 = v6;
      _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_DEFAULT, "Enqueued version rejection message with ID %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v9 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      unsigned int v11 = _SYObfuscate(v7);
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Failed to enqueue version rejection message: %{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (NSDictionary)extraTransportOptions
{
  id v3 = [(SYService *)self currentSession];
  id v4 = [(SYService *)self options];
  if (v3)
  {
    uint64_t v5 = [v3 options];
    uint64_t v6 = CoalesceOptionDictionaries(v4, v5);

    id v4 = (void *)v6;
  }

  return (NSDictionary *)v4;
}

- (BOOL)willAcceptMessageWithHeader:(id)a3 messageID:(id)a4
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 sequenceNumber];
  if ([v6 version] <= 2 && objc_msgSend(v6, "version"))
  {
    id v9 = [(SYService *)self persistentStore];
    int v10 = [v9 shouldIgnoreMessageID:v7];

    if (v10)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      unsigned int v11 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        int v45 = 138543362;
        uint64_t v46 = (uint64_t)v7;
        _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring message ID %{public}@, it's in the 'cancellation failed' list", (uint8_t *)&v45, 0xCu);
      }
      int v12 = [(SYService *)self persistentStore];
      [v12 removeMessageIDFromIgnoreList:v7];

      goto LABEL_10;
    }
    int v15 = (*(_DWORD *)&self->_flags >> 6) & 7;
    if (v15 != [v6 version]) {
      self->_$FC3B5D260D4F8D1F83CF9B539A238CFB flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFFFE3F | (([v6 version] & 7) << 6));
    }
    BOOL v16 = (void *)MEMORY[0x263EFF910];
    [v6 timestamp];
    id v17 = objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    char v18 = [(SYService *)self persistentStore];
    unsigned int v19 = [v18 lastMessageReceived];

    double v20 = [(SYService *)self persistentStore];
    double v21 = [v6 sender];
    double v22 = [v21 peerID];
    int v23 = [v20 sequenceNumberIsDuplicate:v8 forPeer:v22];

    if (v23)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v24 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        int v45 = 138543618;
        uint64_t v46 = (uint64_t)v7;
        __int16 v47 = 2048;
        uint64_t v48 = v8;
        _os_log_impl(&dword_21C7C9000, v24, OS_LOG_TYPE_DEFAULT, "Possible duplicate message %{public}@ received with seqno %llu. Comparing timestamps.", (uint8_t *)&v45, 0x16u);
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v25 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v26 = (void *)MEMORY[0x263EFF910];
        int v27 = v25;
        [v6 timestamp];
        id v28 = objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:");
        int v45 = 138543618;
        uint64_t v46 = (uint64_t)v28;
        __int16 v47 = 2114;
        uint64_t v48 = (uint64_t)v19;
        _os_log_impl(&dword_21C7C9000, v27, OS_LOG_TYPE_DEFAULT, "This message timestamp = %{public}@ vs. last message timestamp = %{public}@", (uint8_t *)&v45, 0x16u);
      }
      if ([v17 compare:v19] != 1)
      {
        long long v44 = +[SYTransportLog sharedInstance];
        uint64_t v42 = [v44 oslog];

        if (os_log_type_enabled(v42, (os_log_type_t)0x90u)) {
          -[SYService willAcceptMessageWithHeader:messageID:]((uint64_t)v7, v8, v42);
        }
        BOOL v13 = 0;
        goto LABEL_46;
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v29 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v45) = 0;
        _os_log_impl(&dword_21C7C9000, v29, OS_LOG_TYPE_DEFAULT, "Sequence numbers were reset; clearing our received seqno set.",
          (uint8_t *)&v45,
          2u);
      }
      uint64_t v30 = [(SYService *)self persistentStore];
      char v31 = [v6 sender];
      id v32 = [v31 peerID];
      [v30 resetSequenceNumbersForPeer:v32];
    }
    id v33 = [(SYService *)self persistentStore];
    id v34 = [v6 sender];
    id v35 = [v34 peerID];
    uint64_t v36 = [v33 lastSequenceNumberForPeerID:v35];

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v37 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
    {
      int v45 = 134218240;
      uint64_t v46 = v8;
      __int16 v47 = 2048;
      uint64_t v48 = v36;
      _os_log_impl(&dword_21C7C9000, v37, OS_LOG_TYPE_INFO, "Received seqno=%llu, last seen=%llu", (uint8_t *)&v45, 0x16u);
    }
    if (v8 != v36 + 1)
    {
      uint64_t v38 = +[SYTransportLog sharedInstance];
      id v39 = [v38 oslog];

      if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
      {
        int v45 = 138543874;
        uint64_t v46 = (uint64_t)v7;
        __int16 v47 = 2048;
        uint64_t v48 = v8;
        __int16 v49 = 2048;
        uint64_t v50 = v36;
        _os_log_error_impl(&dword_21C7C9000, v39, (os_log_type_t)0x90u, "Out of order delivery or dropped message detected on receipt of message with ID %{public}@. Message sequence number = %llu, last received sequence number = %llu", (uint8_t *)&v45, 0x20u);
      }
    }
    if ([v6 version] >= 3)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v40 = (void *)qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
        -[SYLegacyStore _checkMessageHeader:messageID:](v40);
      }
    }
    long long v41 = (void *)MEMORY[0x263EFF910];
    [v6 timestamp];
    uint64_t v42 = objc_msgSend(v41, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v43 = [(SYService *)self persistentStore];
    [v43 setLastMessageReceived:v42];

    BOOL v13 = 1;
LABEL_46:

    goto LABEL_11;
  }
  [(SYService *)self _postVersionRejectionMessageForMessageWithID:v7];
LABEL_10:
  BOOL v13 = 0;
LABEL_11:

  return v13;
}

- (void)handleSyncRequest:(id)a3 ofType:(unsigned __int16)a4 response:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  incomingIOQueue = self->_incomingIOQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__SYService_handleSyncRequest_ofType_response___block_invoke;
  v13[3] = &unk_2644233D8;
  unsigned __int16 v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(incomingIOQueue, v13);
}

uint64_t __47__SYService_handleSyncRequest_ofType_response___block_invoke(uint64_t a1)
{
  id v4 = (unsigned __int16 *)(a1 + 56);
  if (!v2 & v1)
  {
    switch(*(_WORD *)(a1 + 56))
    {
      case 'e':
        uint64_t v5 = *(void **)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 40);
        uint64_t v7 = *(void *)(a1 + 48);
        uint64_t result = [v5 _handleResetRequest:v6 completion:v7];
        break;
      case 'f':
        id v15 = *(void **)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 40);
        uint64_t v17 = *(void *)(a1 + 48);
        uint64_t result = [v15 _handleStartSession:v16 completion:v17];
        break;
      case 'g':
        char v18 = *(void **)(a1 + 32);
        uint64_t v19 = *(void *)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 48);
        uint64_t result = [v18 _handleSyncBatch:v19 completion:v20];
        break;
      case 'h':
        double v21 = *(void **)(a1 + 32);
        uint64_t v22 = *(void *)(a1 + 40);
        uint64_t v23 = *(void *)(a1 + 48);
        uint64_t result = [v21 _handleRestartSession:v22 completion:v23];
        break;
      case 'i':
        id v24 = *(void **)(a1 + 32);
        uint64_t v25 = *(void *)(a1 + 40);
        uint64_t v26 = *(void *)(a1 + 48);
        uint64_t result = [v24 _handleEndSession:v25 completion:v26];
        break;
      default:
        if (*(_WORD *)(a1 + 56) == 0x7FFF)
        {
          id v12 = *(void **)(a1 + 32);
          uint64_t v13 = *(void *)(a1 + 40);
          uint64_t v14 = *(void *)(a1 + 48);
          uint64_t result = [v12 _peerRejectedVersion:v13 completion:v14];
        }
        else
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          uint64_t v42 = (void *)qword_26AB04788;
          if (os_log_type_enabled((os_log_t)qword_26AB04788, (os_log_type_t)0x90u)) {
            __47__SYService_handleSyncRequest_ofType_response___block_invoke_cold_1(v4, a1, v42);
          }
          uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
        }
        break;
    }
  }
  else
  {
    switch(*(_WORD *)(a1 + 56))
    {
      case 1:
        id v9 = *(void **)(a1 + 32);
        uint64_t v10 = *(void *)(a1 + 40);
        uint64_t v11 = *(void *)(a1 + 48);
        uint64_t result = objc_msgSend(v9, "_v1_handleFullSyncRequest:completion:", v10, v11);
        break;
      case 2:
        int v27 = *(void **)(a1 + 32);
        uint64_t v28 = *(void *)(a1 + 40);
        uint64_t v29 = *(void *)(a1 + 48);
        uint64_t result = objc_msgSend(v27, "_v1_handleSyncAllObjects:completion:", v28, v29);
        break;
      case 3:
        uint64_t v30 = *(void **)(a1 + 32);
        uint64_t v31 = *(void *)(a1 + 40);
        uint64_t v32 = *(void *)(a1 + 48);
        uint64_t result = objc_msgSend(v30, "_v1_handleBatchSyncStart:completion:", v31, v32);
        break;
      case 4:
        id v33 = *(void **)(a1 + 32);
        uint64_t v34 = *(void *)(a1 + 40);
        uint64_t v35 = *(void *)(a1 + 48);
        uint64_t result = objc_msgSend(v33, "_v1_handleBatchSyncChunk:completion:", v34, v35);
        break;
      case 5:
        uint64_t v36 = *(void **)(a1 + 32);
        uint64_t v37 = *(void *)(a1 + 40);
        uint64_t v38 = *(void *)(a1 + 48);
        uint64_t result = objc_msgSend(v36, "_v1_handleBatchSyncEnd:completion:", v37, v38);
        break;
      case 6:
        id v39 = *(void **)(a1 + 32);
        uint64_t v40 = *(void *)(a1 + 40);
        uint64_t v41 = *(void *)(a1 + 48);
        uint64_t result = objc_msgSend(v39, "_v1_handleChangeMessage:completion:", v40, v41);
        break;
      default:
        JUMPOUT(0);
    }
  }
  return result;
}

- (void)handleSyncResponse:(id)a3 ofType:(unsigned __int16)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  incomingIOQueue = self->_incomingIOQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __50__SYService_handleSyncResponse_ofType_completion___block_invoke;
  v13[3] = &unk_2644233D8;
  unsigned __int16 v16 = a4;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(incomingIOQueue, v13);
}

void __50__SYService_handleSyncResponse_ofType_completion___block_invoke(uint64_t a1)
{
  switch(*(_WORD *)(a1 + 56))
  {
    case 'e':
      char v2 = *(void **)(a1 + 32);
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v35 = 0;
      char v4 = [v2 _handleResetResponse:v3 error:&v35];
      uint64_t v5 = v35;
      break;
    case 'f':
      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      uint64_t v34 = 0;
      char v4 = [v13 _handleStartSessionResponse:v14 error:&v34];
      uint64_t v5 = v34;
      break;
    case 'g':
      id v15 = *(void **)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      id v33 = 0;
      char v4 = [v15 _handleSyncBatchResponse:v16 error:&v33];
      uint64_t v5 = v33;
      break;
    case 'h':
      uint64_t v17 = *(void **)(a1 + 32);
      uint64_t v18 = *(void *)(a1 + 40);
      uint64_t v32 = 0;
      char v4 = [v17 _handleRestartSessionResponse:v18 error:&v32];
      uint64_t v5 = v32;
      break;
    case 'i':
      uint64_t v19 = *(void **)(a1 + 32);
      uint64_t v20 = *(void *)(a1 + 40);
      uint64_t v31 = 0;
      char v4 = [v19 _handleEndSessionResponse:v20 error:&v31];
      uint64_t v5 = v31;
      break;
    default:
      id v6 = 0;
      switch(*(_WORD *)(a1 + 56))
      {
        case 1:
          id v9 = *(void **)(a1 + 32);
          uint64_t v10 = *(void *)(a1 + 40);
          uint64_t v38 = 0;
          char v4 = objc_msgSend(v9, "_v1_handleFullSyncRequestAck:error:", v10, &v38);
          uint64_t v5 = v38;
          goto LABEL_11;
        case 2:
        case 5:
          uint64_t v7 = *(void **)(a1 + 32);
          uint64_t v8 = *(void *)(a1 + 40);
          uint64_t v36 = 0;
          char v4 = objc_msgSend(v7, "_v1_handleBatchEndResponse:error:", v8, &v36);
          uint64_t v5 = v36;
          goto LABEL_11;
        case 4:
          id v11 = *(void **)(a1 + 32);
          uint64_t v12 = *(void *)(a1 + 40);
          uint64_t v37 = 0;
          char v4 = objc_msgSend(v11, "_v1_handleBatchChunkAck:error:", v12, &v37);
          uint64_t v5 = v37;
          goto LABEL_11;
        default:
          goto LABEL_12;
      }
  }
LABEL_11:
  id v6 = v5;
  if ((v4 & 1) == 0)
  {
LABEL_12:
    if (*(unsigned __int16 *)(a1 + 56) - 102 <= 2
      && ([*(id *)(a1 + 40) hasError] & 1) == 0)
    {
      double v21 = objc_opt_new();
      uint64_t v22 = (void *)[*(id *)(a1 + 32) _newMessageHeader];
      [v21 setHeader:v22];

      uint64_t v23 = [*(id *)(a1 + 40) sessionID];
      [v21 setSessionID:v23];

      id v24 = [SYErrorInfo alloc];
      uint64_t v25 = v24;
      if (v6)
      {
        uint64_t v26 = [(SYErrorInfo *)v24 initWithError:v6];
        [v21 setError:v26];
      }
      else
      {
        uint64_t v26 = (SYErrorInfo *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2006 userInfo:0];
        int v27 = [(SYErrorInfo *)v25 initWithError:v26];
        [v21 setError:v27];
      }
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v28 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
      {
        v30[0] = 0;
        _os_log_impl(&dword_21C7C9000, v28, OS_LOG_TYPE_INFO, "Enqueueing end-session message to cancel an orphaned receiving session on peer.", (uint8_t *)v30, 2u);
      }
      uint64_t v29 = [*(id *)(a1 + 32) syncEngine];
      objc_msgSend(v29, "enqueueSyncRequest:withMessageID:priority:options:userContext:callback:", v21, 105, objc_msgSend(*(id *)(a1 + 32), "priority"), 0, 0, &__block_literal_global_163);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __50__SYService_handleSyncResponse_ofType_completion___block_invoke_161(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v7 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_INFO, "Enqueued end-session message to orphaned session on peer.", v8, 2u);
  }
}

- (void)handleOutOfBandData:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __44__SYService_handleOutOfBandData_completion___block_invoke;
    v15[3] = &unk_264422CB8;
    id v16 = WeakRetained;
    uint64_t v17 = self;
    id v18 = v6;
    id v19 = v7;
    uint64_t v10 = delegateQueue;
    id v11 = (void *)[v15 copy];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___dispatch_async_autoreleased_block_invoke;
    block[3] = &unk_264423590;
    id v21 = v11;
    id v12 = v11;
    dispatch_async(v10, block);

    uint64_t v13 = v16;
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v14 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(block[0]) = 0;
      _os_log_impl(&dword_21C7C9000, v14, OS_LOG_TYPE_DEFAULT, "SYService received OOB data, but delegate doesn't support it", (uint8_t *)block, 2u);
    }
    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2008 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

uint64_t __44__SYService_handleOutOfBandData_completion___block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  char v2 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:incomingData:completion:", v4, 2u);
  }
  return [*(id *)(a1 + 32) service:*(void *)(a1 + 40) incomingData:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (id)_claimOwnershipOfFileAtURL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 URLByDeletingLastPathComponent];
  id v7 = [v6 path];
  uint64_t v8 = [v7 stringByAppendingPathComponent:@"SYFileTransfer-XXXXX"];

  id v9 = v8;
  uint64_t v10 = strdup((const char *)[v9 UTF8String]);
  id v11 = mkdtemp(v10);
  if (v11)
  {
    id v12 = (void *)[objc_alloc(NSURL) initFileURLWithFileSystemRepresentation:v11 isDirectory:1 relativeToURL:0];
    free(v10);
    uint64_t v13 = [v5 lastPathComponent];
    uint64_t v14 = [v12 URLByAppendingPathComponent:v13];

    id v15 = (const char *)[v5 fileSystemRepresentation];
    id v16 = v14;
    if (link(v15, (const char *)[v16 fileSystemRepresentation]))
    {
      uint64_t v17 = __error();
      if (a4)
      {
        uint64_t v18 = *v17;
        id v19 = objc_alloc(MEMORY[0x263F087E8]);
        id v20 = (id)[v19 initWithDomain:*MEMORY[0x263F08438] code:v18 userInfo:0];
        id v21 = 0;
        *a4 = v20;
      }
      else
      {
        id v21 = 0;
      }
    }
    else
    {
      id v21 = v16;
    }
  }
  else
  {
    uint64_t v22 = __error();
    if (a4)
    {
      uint64_t v23 = *v22;
      id v24 = objc_alloc(MEMORY[0x263F087E8]);
      id v21 = 0;
      *a4 = (id)[v24 initWithDomain:*MEMORY[0x263F08438] code:v23 userInfo:0];
    }
    else
    {
      id v21 = 0;
    }
  }

  return v21;
}

- (void)handleFileTransfer:(id)a3 metadata:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    id v25 = 0;
    id v12 = [(SYService *)self _claimOwnershipOfFileAtURL:v8 error:&v25];
    id v13 = v25;
    if (v12)
    {
      delegateQueue = self->_delegateQueue;
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __52__SYService_handleFileTransfer_metadata_completion___block_invoke;
      v19[3] = &unk_264423428;
      id v20 = v12;
      id v21 = WeakRetained;
      uint64_t v22 = self;
      id v23 = v9;
      id v24 = v10;
      id v15 = delegateQueue;
      id v16 = (void *)[v19 copy];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = ___dispatch_async_autoreleased_block_invoke;
      block[3] = &unk_264423590;
      id v27 = v16;
      id v17 = v16;
      dispatch_async(v15, block);
    }
    else
    {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    uint64_t v18 = _sync_log_facilities;
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(block[0]) = 0;
      _os_log_impl(&dword_21C7C9000, v18, OS_LOG_TYPE_DEFAULT, "SYService received OOB file transfer, but delegate doesn't support it", (uint8_t *)block, 2u);
    }
    id v13 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2008 userInfo:0];
    (*((void (**)(id, void, id))v10 + 2))(v10, 0, v13);
  }
}

void __52__SYService_handleFileTransfer_metadata_completion___block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  char v2 = _sync_log_facilities;
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:incomingStream:metadata:completion:", buf, 2u);
  }
  uint64_t v3 = [[SYCompressedFileInputStream alloc] initWithCompressedFileAtURL:*(void *)(a1 + 32)];
  char v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__SYService_handleFileTransfer_metadata_completion___block_invoke_173;
  v7[3] = &unk_264423400;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 64);
  [v4 service:v5 incomingStream:v3 metadata:v6 completion:v7];
}

void __52__SYService_handleFileTransfer_metadata_completion___block_invoke_173(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v6 = [*(id *)(a1 + 32) URLByDeletingLastPathComponent];
  id v9 = 0;
  char v7 = [v5 removeItemAtURL:v6 error:&v9];
  id v8 = v9;

  if ((v7 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_ERROR)) {
      __52__SYService_handleFileTransfer_metadata_completion___block_invoke_173_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)handleSyncError:(id)a3 forMessageWithIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7
    && ([(SYService *)self persistentStore],
        id v8 = objc_claimAutoreleasedReturnValue(),
        int v9 = [v8 shouldIgnoreMessageID:v7],
        v8,
        v9))
  {
    id v10 = [(SYService *)self persistentStore];
    [v10 removeMessageIDFromIgnoreList:v7];

    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v11 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v24 = v7;
      __int16 v25 = 2114;
      id v26 = v6;
      _os_log_impl(&dword_21C7C9000, v11, OS_LOG_TYPE_DEFAULT, "Received expected error for message ID %{public}@, will ignore it. Error is %{public}@", buf, 0x16u);
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v12 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_impl(&dword_21C7C9000, v12, OS_LOG_TYPE_DEFAULT, "Sync error occurred: %@", buf, 0xCu);
    }
    id v13 = [v6 persistentUserInfo];
    uint64_t v14 = v13;
    if (v13)
    {
      id v15 = [v13 objectForKeyedSubscript:0x26CD1D180];
    }
    else
    {
      id v16 = [v6 userInfo];
      id v15 = [v16 objectForKeyedSubscript:0x26CD1D180];
    }
    queue = self->_queue;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __54__SYService_handleSyncError_forMessageWithIdentifier___block_invoke;
    v19[3] = &unk_264423228;
    void v19[4] = self;
    id v20 = v15;
    id v21 = v7;
    id v22 = v6;
    id v18 = v15;
    dispatch_async(queue, v19);
  }
}

void __54__SYService_handleSyncError_forMessageWithIdentifier___block_invoke(void *a1)
{
  id v6 = *(id *)(a1[4] + 40);
  if (v6
    && a1[5]
    && ([v6 identifier],
        char v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 isEqualToString:a1[5]],
        v2,
        v3))
  {
    if (a1[6]) {
      objc_msgSend(v6, "_clearOutgoingMessageUUID:");
    }
    uint64_t v4 = a1[7];
    uint64_t v5 = v6;
  }
  else
  {
    uint64_t v5 = (void *)a1[4];
    uint64_t v4 = a1[7];
  }
  [v5 _handleError:v4];
}

- (void)enqueuedMessageWithID:(id)a3 context:(id)a4
{
  id v5 = a3;
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__SYService_enqueuedMessageWithID_context___block_invoke;
  v8[3] = &unk_264422990;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

void __43__SYService_enqueuedMessageWithID_context___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) currentSession];
  if (v2)
  {
    id v3 = v2;
    [v2 _recordOutgoingMessageUUID:*(void *)(a1 + 40)];
    char v2 = v3;
  }
}

- (void)sentMessageWithID:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SYService_sentMessageWithID_context___block_invoke;
  block[3] = &unk_264422BF8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __39__SYService_sentMessageWithID_context___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) persistentStore];
  [v2 removeMessageIDFromIgnoreList:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) currentSession];
  if (v3)
  {
    id v4 = v3;
    [v3 _sentMessageWithIdentifier:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48)];
    id v3 = v4;
  }
}

- (void)deliveredMessageWithID:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__SYService_deliveredMessageWithID_context___block_invoke;
  block[3] = &unk_264422BF8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __44__SYService_deliveredMessageWithID_context___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) persistentStore];
  [v2 removeMessageIDFromIgnoreList:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) currentSession];
  if (v3)
  {
    id v4 = v3;
    [v3 _clearOutgoingMessageUUID:*(void *)(a1 + 40)];
    [v4 _peerProcessedMessageWithIdentifier:*(void *)(a1 + 40) userInfo:*(void *)(a1 + 48)];
    id v3 = v4;
  }
}

- (void)serializeForIncomingSession:(id)a3
{
  dispatch_block_t block = a3;
  id v4 = [(SYService *)self syncEngine];
  if ([v4 buffersSessions])
  {
    BOOL v5 = [(SYSession *)self->_currentSession _readyToProcessIncomingMessages];

    if (v5)
    {
      id v6 = [(SYService *)self queue];
      dispatch_async(v6, block);

      goto LABEL_6;
    }
  }
  else
  {
  }
  [(_SYMultiSuspendableQueue *)self->_sessionQueue barrierAsync:block];
LABEL_6:
}

- (void)currentDeviceProximityChanged:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__SYService_currentDeviceProximityChanged___block_invoke;
    block[3] = &unk_264422940;
    id v8 = WeakRetained;
    id v9 = self;
    BOOL v10 = a3;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __43__SYService_currentDeviceProximityChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) service:*(void *)(a1 + 40) targetDeviceProximityChanged:*(unsigned __int8 *)(a1 + 48)];
}

- (void)currentDeviceConnectionChanged:(BOOL)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__SYService_currentDeviceConnectionChanged___block_invoke;
    block[3] = &unk_264422940;
    id v8 = WeakRetained;
    id v9 = self;
    BOOL v10 = a3;
    dispatch_async(delegateQueue, block);
  }
}

uint64_t __44__SYService_currentDeviceConnectionChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) service:*(void *)(a1 + 40) targetDeviceConnectionChanged:*(unsigned __int8 *)(a1 + 48)];
}

- (id)_sessionFromIncomingStartRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 header];
  uint64_t v6 = [v5 sender];

  id v7 = [v4 header];
  id v8 = [v7 state];
  id v9 = [v8 clockForPeer:v6];

  __int16 v25 = v9;
  id v26 = (void *)v6;
  -[SYVectorClock setClockValue:forPeer:](self->_vectorClock, "setClockValue:forPeer:", [v9 version], v6);
  [(SYService *)self _vectorClockUpdated];
  if ([v4 hasMetadata])
  {
    BOOL v10 = [v4 metadata];
    id v11 = +[SYSession unarchiveMetadata:v10];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = -[SYReceivingSession initWithService:isReset:metadata:]([SYReceivingSession alloc], "initWithService:isReset:metadata:", self, [v4 isResetSync], v11);
  id v13 = [v4 sessionID];
  [(SYSession *)v12 setIdentifier:v13];

  uint64_t v14 = [v4 header];
  [v14 timestamp];
  -[SYSession setBirthDate:](v12, "setBirthDate:");

  id v15 = [v4 header];
  id v16 = [v15 sender];
  id v17 = [v16 generationID];
  id v18 = [(SYSession *)v12 peerGenerationIDs];
  id v19 = [v4 header];
  id v20 = [v19 sender];
  id v21 = [v20 peerID];
  [v18 setObject:v17 forKeyedSubscript:v21];

  id v22 = [v4 reason];
  [(SYSession *)v12 setReason:v22];

  [v4 sessionTimeout];
  [(SYSession *)v12 setFullSessionTimeout:v23 - CFAbsoluteTimeGetCurrent()];

  return v12;
}

- (void)_enqueueIncomingStartSessionRequest:(id)a3 withCompletion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (self->_queuedStartSession) {
    -[SYService _enqueueIncomingStartSessionRequest:withCompletion:]();
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v8 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    BOOL v10 = [v6 sessionID];
    id v11 = _SYObfuscate(self->_currentSession);
    int v14 = 138543618;
    id v15 = v10;
    __int16 v16 = 2114;
    id v17 = v11;
    _os_log_impl(&dword_21C7C9000, v9, OS_LOG_TYPE_DEFAULT, "Deferring incoming start-session (%{public}@) to allow current session (%{public}@) to finish closing.", (uint8_t *)&v14, 0x16u);
  }
  id v12 = [[_SYQueuedStartSession alloc] initWithRequest:v6 completion:v7];
  queuedStartSession = self->_queuedStartSession;
  self->_queuedStartSession = v12;
}

- (BOOL)_request:(id)a3 hasValidSessionIDForSession:(id)a4 response:(id)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(id, id, void))a6;
  id v12 = a4;
  id v13 = [v9 sessionID];
  int v14 = [v12 identifier];

  char v15 = [v13 isEqualToString:v14];
  if ((v15 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    __int16 v16 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v16;
      uint64_t v18 = (objc_class *)objc_opt_class();
      id v19 = NSStringFromClass(v18);
      int v24 = 138543362;
      __int16 v25 = v19;
      _os_log_impl(&dword_21C7C9000, v17, OS_LOG_TYPE_DEFAULT, "Received %{public}@ message for another session ID", (uint8_t *)&v24, 0xCu);
    }
    id v20 = [SYErrorInfo alloc];
    id v21 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2006 userInfo:0];
    id v22 = [(SYErrorInfo *)v20 initWithError:v21];
    [v10 setError:v22];

    v11[2](v11, v10, 0);
  }

  return v15;
}

- (void)_handleStartSession:(id)a3 completion:(id)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_delegateQueue);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  id v8 = objc_opt_new();
  id v9 = [(SYService *)self _newMessageHeader];
  [v8 setHeader:v9];

  [v8 setAccepted:0];
  id v10 = [v6 sessionID];
  [v8 setSessionID:v10];

  id v11 = [(SYService *)self _sessionFromIncomingStartRequest:v6];
  p_currentSession = &self->_currentSession;
  currentSession = self->_currentSession;
  if (!currentSession)
  {
    if ([v6 isResetSync] && -[SYService isMasterStore](self, "isMasterStore"))
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
        -[SYService _handleStartSession:completion:]();
      }
      uint64_t v28 = [SYErrorInfo alloc];
      uint64_t v29 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2014 userInfo:0];
      uint64_t v30 = [(SYErrorInfo *)v28 initWithError:v29];
      [v8 setError:v30];

      id v14 = [v6 sessionID];
      uint64_t v31 = UserInfoDictionaryWithAssociatedSessionID(v14);
      v7[2](v7, v8, v31);
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      uint64_t v71 = 0;
      v72 = &v71;
      uint64_t v73 = 0x2020000000;
      char v74 = 0;
      *(void *)buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      objc_super v81 = __Block_byref_object_copy__5;
      v82 = __Block_byref_object_dispose__5;
      id v83 = 0;
      queue = self->_delegateQueue;
      v65[0] = MEMORY[0x263EF8330];
      v65[1] = 3221225472;
      v65[2] = __44__SYService__handleStartSession_completion___block_invoke_182;
      v65[3] = &unk_2644232F0;
      v69 = &v71;
      id v14 = WeakRetained;
      id v66 = v14;
      uint64_t v67 = self;
      id v33 = v11;
      id v68 = v33;
      id v70 = buf;
      uint64_t v34 = v65;
      uint64_t v35 = (void **)&self->_currentSession;
      *(void *)dispatch_block_t block = MEMORY[0x263EF8330];
      *(void *)&block[8] = 3221225472;
      *(void *)&block[16] = ___dispatch_sync_autoreleased_block_invoke;
      v85 = &unk_264423590;
      id v86 = v34;
      dispatch_sync(queue, block);

      if (*((unsigned char *)v72 + 24))
      {
        if (self->_currentSession)
        {
          if (_sync_log_facilities_pred != -1) {
            _os_once();
          }
          uint64_t v36 = (id)qword_26AB04788;
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            _SYObfuscate(*v35);
            objc_claimAutoreleasedReturnValue();
            -[SYService _handleStartSession:completion:].cold.5();
          }
        }
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEBUG)) {
          -[SYService _handleStartSession:completion:].cold.4();
        }
        [(SYSyncEngine *)self->_syncEngine beginSession];
        if ([(_SYMultiSuspendableQueue *)self->_sessionQueue isSuspended])
        {
          _os_assumes_log();
          -[SYService _processPendingChanges]();
        }
        [(_SYMultiSuspendableQueue *)self->_sessionQueue suspend];
        if (![(_SYMultiSuspendableQueue *)self->_sessionQueue isSuspended])
        {
          _os_assumes_log();
          -[SYService _processPendingChanges]();
        }
        objc_storeStrong(v35, v11);
        objc_initWeak(&location, self);
        v58[0] = MEMORY[0x263EF8330];
        v58[1] = 3221225472;
        v58[2] = __44__SYService__handleStartSession_completion___block_invoke_183;
        v58[3] = &unk_264423478;
        objc_copyWeak(&v63, &location);
        id v59 = v33;
        id v60 = v8;
        id v61 = v6;
        BOOL v62 = v7;
        [v59 start:v58];

        objc_destroyWeak(&v63);
        objc_destroyWeak(&location);
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        __int16 v49 = (id)qword_26AB04788;
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          _SYObfuscate(v33);
          id v50 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v51 = _SYObfuscate(*(void **)(*(void *)&buf[8] + 40));
          *(_DWORD *)dispatch_block_t block = 138543618;
          *(void *)&void block[4] = v50;
          *(_WORD *)&block[12] = 2114;
          *(void *)&block[14] = v51;
          _os_log_impl(&dword_21C7C9000, v49, OS_LOG_TYPE_DEFAULT, "Delegate rejected incoming sync session (%{public}@) with error %{public}@", block, 0x16u);
        }
        uint64_t v52 = [SYErrorInfo alloc];
        __int16 v53 = [(SYErrorInfo *)v52 initWithError:*(void *)(*(void *)&buf[8] + 40)];
        [v8 setError:v53];

        double v54 = [v33 wrappedUserContext];
        v7[2](v7, v8, v54);
      }
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v71, 8);
    }
    goto LABEL_67;
  }
  if (self->_queuedStartSession
    || (unsigned int v37 = [(SYSession *)currentSession state], v37 > 9)
    || ((1 << v37) & 0x228) == 0)
  {
    id v14 = [v6 sessionID];
    double Current = CFAbsoluteTimeGetCurrent();
    [(SYSession *)*p_currentSession birthDate];
    double v17 = v16;
    block[0] = 0;
    uint64_t v18 = [v6 header];
    id v19 = [v18 sender];
    double v20 = Current - v17;
    BOOL v21 = [(SYService *)self _shouldSession:v11 fromPeer:v19 supercedeSession:self->_currentSession ofAge:block collisionDetected:v20];

    if (v21)
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v22 = (id)qword_26AB04788;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        double v23 = _SYObfuscate(*p_currentSession);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_21C7C9000, v22, OS_LOG_TYPE_DEFAULT, "Cancelling current session (%{public}@) to make way for a new one (%{public}@).", buf, 0x16u);
      }
      int v24 = *p_currentSession;
      id v25 = objc_alloc(MEMORY[0x263F087E8]);
      if (block[0]) {
        uint64_t v26 = 2023;
      }
      else {
        uint64_t v26 = 2005;
      }
      uint64_t v27 = (void *)[v25 initWithSYError:v26 userInfo:0];
      [(SYSession *)v24 cancelWithError:v27];

      [(SYService *)self _enqueueIncomingStartSessionRequest:v6 withCompletion:v7];
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v39 = (id)qword_26AB04788;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = _SYObfuscate(*p_currentSession);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v40;
        *(_WORD *)&unsigned char buf[22] = 2048;
        objc_super v81 = *(uint64_t (**)(uint64_t, uint64_t))&v20;
        _os_log_impl(&dword_21C7C9000, v39, OS_LOG_TYPE_DEFAULT, "A new StartSyncSession (%{public}@) arrived, but there is a current session (%{public}@) with an age of %.02f, so we are rejecting the new session.", buf, 0x20u);
      }
      uint64_t v41 = [SYErrorInfo alloc];
      id v42 = objc_alloc(MEMORY[0x263F087E8]);
      if (block[0]) {
        uint64_t v43 = 2023;
      }
      else {
        uint64_t v43 = 2005;
      }
      long long v44 = (void *)[v42 initWithSYError:v43 userInfo:0];
      int v45 = [(SYErrorInfo *)v41 initWithError:v44];
      [v8 setError:v45];

      uint64_t v46 = [v6 sessionID];
      __int16 v47 = UserInfoDictionaryWithAssociatedSessionID(v46);

      if ([(SYSession *)*p_currentSession state])
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v48 = qword_26AB04788;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C7C9000, v48, OS_LOG_TYPE_DEFAULT, "Issuing immediate rejection of incoming session request", buf, 2u);
        }
        v7[2](v7, v8, v47);
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        id v55 = qword_26AB04788;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C7C9000, v55, OS_LOG_TYPE_DEFAULT, "Terrifying deferred session rejection path (enqueue).", buf, 2u);
        }
        v56 = *p_currentSession;
        v75[0] = MEMORY[0x263EF8330];
        v75[1] = 3221225472;
        v75[2] = __44__SYService__handleStartSession_completion___block_invoke;
        v75[3] = &unk_264423450;
        v78 = v7;
        id v76 = v8;
        id v77 = v47;
        [(SYSession *)v56 _onSessionStateChangedTo:6 do:v75];
      }
    }
LABEL_67:

    goto LABEL_68;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v38 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v38, OS_LOG_TYPE_DEFAULT, "Deferring incoming session requst for a short while", buf, 2u);
  }
  [(SYService *)self _enqueueIncomingStartSessionRequest:v6 withCompletion:v7];
LABEL_68:

  os_activity_scope_leave(&state);
}

uint64_t __44__SYService__handleStartSession_completion___block_invoke(uint64_t a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  char v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_DEFAULT, "Terrifying deferred session rejection path (dequeue).", v4, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __44__SYService__handleStartSession_completion___block_invoke_182(void *a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  char v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:startSession:error: (receiving)", buf, 2u);
  }
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v9 = 0;
  char v6 = [v3 service:v4 startSession:v5 error:&v9];
  id v7 = v9;
  id v8 = v9;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v7);
  }
}

void __44__SYService__handleStartSession_completion___block_invoke_183(uint64_t a1, int a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) metadataModified])
    {
      id v7 = [*(id *)(a1 + 32) sessionMetadata];

      if (v7)
      {
        id v8 = (void *)MEMORY[0x263F08910];
        id v9 = [*(id *)(a1 + 32) sessionMetadata];
        id v10 = [v8 archivedDataWithRootObject:v9 requiringSecureCoding:1 error:0];
        [*(id *)(a1 + 40) setMetadata:v10];
      }
    }
    if (a2)
    {
      [*(id *)(a1 + 40) setAccepted:1];
      unint64_t pseudo_signpost_id = _next_pseudo_signpost_id();
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v12 = (id)qword_26AB047B8;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if ([*(id *)(a1 + 48) isResetSync]) {
          id v13 = "reset";
        }
        else {
          id v13 = "delta";
        }
        id v14 = (objc_class *)objc_opt_class();
        char v15 = NSStringFromClass(v14);
        double v16 = [*(id *)(a1 + 32) identifier];
        double v17 = [*(id *)(a1 + 32) reason];
        if (v17)
        {
          uint64_t v18 = [*(id *)(a1 + 32) reason];
        }
        else
        {
          uint64_t v18 = @"-";
        }
        int v25 = 134219010;
        unint64_t v26 = pseudo_signpost_id;
        __int16 v27 = 2082;
        uint64_t v28 = v13;
        __int16 v29 = 2114;
        uint64_t v30 = v15;
        __int16 v31 = 2114;
        uint64_t v32 = v16;
        __int16 v33 = 2114;
        uint64_t v34 = v18;
        _os_log_impl(&dword_21C7C9000, v12, OS_LOG_TYPE_DEFAULT, "Start signpost %llu: Started incoming %{public}s %{public}@ with identifier %{public}@. Reason = '%{public}@'", (uint8_t *)&v25, 0x34u);
        if (v17) {
      }
        }
      [*(id *)(a1 + 32) setSessionSignpost:pseudo_signpost_id];
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      id v19 = qword_26AB04788;
      if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v20 = *(void *)(a1 + 32);
        int v25 = 138543362;
        unint64_t v26 = v20;
        _os_log_impl(&dword_21C7C9000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ decided not to come out and play.", (uint8_t *)&v25, 0xCu);
      }
      BOOL v21 = [[SYErrorInfo alloc] initWithError:v5];
      [*(id *)(a1 + 40) setError:v21];
    }
    uint64_t v22 = *(void *)(a1 + 56);
    uint64_t v23 = *(void *)(a1 + 40);
    int v24 = [*(id *)(a1 + 32) wrappedUserContext];
    (*(void (**)(uint64_t, uint64_t, void *))(v22 + 16))(v22, v23, v24);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      __44__SYService__handleStartSession_completion___block_invoke_183_cold_1();
    }
  }
}

- (void)_handleResetRequest:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &v23);
  id v8 = objc_opt_new();
  id v9 = [(SYService *)self _newMessageHeader];
  [v8 setHeader:v9];

  [v8 setAccepted:0];
  if ([(SYService *)self isMasterStore])
  {
    id v10 = [(SYService *)self currentSession];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 identifier];
      id v13 = [v6 cancelSessionID];
      BOOL v14 = [v12 compare:v13] == 1;

      if (v14)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        char v15 = (id)qword_26AB04788;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = [v11 isResetSync];
          double v17 = @"delta";
          if (v16) {
            double v17 = @"reset";
          }
          *(_DWORD *)buf = 138543362;
          int v25 = v17;
          _os_log_impl(&dword_21C7C9000, v15, OS_LOG_TYPE_DEFAULT, "Accepting reset request: %{public}@ sync in progress, which will be canceled to make way for the requested reset.", buf, 0xCu);
        }

        [v11 cancel];
        uint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2022 userInfo:0];
        [v11 setError:v18];
      }
      else
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v22 = qword_26AB04788;
        if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C7C9000, v22, OS_LOG_TYPE_DEFAULT, "Canceling current session-- cancelation was explicitly requested by a reset request.", buf, 2u);
        }
        [v11 cancel];
      }
    }
    [v8 setAccepted:1];
    [(SYService *)self setNeedsResetSync];
    v7[2](v7, v8, 0);
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)_sync_log_facilities, (os_log_type_t)0x90u)) {
      -[SYService _handleResetRequest:completion:]();
    }
    id v19 = [SYErrorInfo alloc];
    unint64_t v20 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2024 userInfo:0];
    BOOL v21 = [(SYErrorInfo *)v19 initWithError:v20];
    [v8 setError:v21];

    v7[2](v7, v8, 0);
  }

  os_activity_scope_leave(&v23);
}

- (void)_handleSyncBatch:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  id v8 = objc_opt_new();
  id v9 = [(SYService *)self _newMessageHeader];
  [v8 setHeader:v9];

  id v10 = [v6 sessionID];
  [v8 setSessionID:v10];

  objc_msgSend(v8, "setIndex:", objc_msgSend(v6, "index"));
  id v11 = [(SYService *)self currentSession];
  if (v11)
  {
    if ([(SYService *)self _request:v6 hasValidSessionIDForSession:v11 response:v8 completion:v7])
    {
      [v11 _handleSyncBatch:v6 response:v8 completion:v7];
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      -[SYService _handleSyncBatch:completion:]();
    }
    id v12 = [SYErrorInfo alloc];
    id v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2004 userInfo:0];
    BOOL v14 = [(SYErrorInfo *)v12 initWithError:v13];
    [v8 setError:v14];

    char v15 = [v6 sessionID];
    int v16 = UserInfoDictionaryWithAssociatedSessionID(v15);
    v7[2](v7, v8, v16);
  }
}

- (void)_handleRestartSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  id v8 = objc_opt_new();
  id v9 = [(SYService *)self _newMessageHeader];
  [v8 setHeader:v9];

  id v10 = [v6 sessionID];
  [v8 setSessionID:v10];

  [v8 setAccepted:0];
  id v11 = [(SYService *)self currentSession];
  if (v11)
  {
    if ([(SYService *)self _request:v6 hasValidSessionIDForSession:v11 response:v8 completion:v7])
    {
      [v11 _handleRestartSession:v6 response:v8 completion:v7];
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      -[SYService _handleRestartSession:completion:]();
    }
    id v12 = [SYErrorInfo alloc];
    id v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2004 userInfo:0];
    BOOL v14 = [(SYErrorInfo *)v12 initWithError:v13];
    [v8 setError:v14];

    char v15 = [v6 sessionID];
    int v16 = UserInfoDictionaryWithAssociatedSessionID(v15);
    v7[2](v7, v8, v16);
  }
}

- (void)_handleEndSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  id v8 = objc_opt_new();
  id v9 = [(SYService *)self _newMessageHeader];
  [v8 setHeader:v9];

  id v10 = [v6 sessionID];
  [v8 setSessionID:v10];

  id v11 = [(SYService *)self currentSession];
  if (v11)
  {
    if ([(SYService *)self _request:v6 hasValidSessionIDForSession:v11 response:v8 completion:v7])
    {
      [v11 _handleEndSession:v6 response:v8 completion:v7];
    }
  }
  else
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      -[SYService _handleEndSession:completion:]();
    }
    id v12 = [SYErrorInfo alloc];
    id v13 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2004 userInfo:0];
    BOOL v14 = [(SYErrorInfo *)v12 initWithError:v13];
    [v8 setError:v14];

    char v15 = [v6 sessionID];
    int v16 = UserInfoDictionaryWithAssociatedSessionID(v15);
    v7[2](v7, v8, v16);
  }
}

- (BOOL)_handleResetResponse:(id)a3 error:(id *)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &v12);
  inFlightSyncRequestIdentifier = self->_inFlightSyncRequestIdentifier;
  self->_inFlightSyncRequestIdentifier = 0;

  if (([v5 accepted] & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v7 = (id)_sync_log_facilities;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v5 error];
      id v9 = (void *)v8;
      id v10 = @"(no error)";
      if (v8) {
        id v10 = (__CFString *)v8;
      }
      *(_DWORD *)buf = 138412290;
      BOOL v14 = v10;
      _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_DEFAULT, "Reset Sync request was denied: %@", buf, 0xCu);
    }
  }
  os_activity_scope_leave(&v12);

  return 1;
}

- (BOOL)_handleStartSessionResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SYService *)self currentSession];
  if (!v7)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR))
    {
      -[SYService _handleStartSessionResponse:error:]();
      if (!a4) {
        goto LABEL_13;
      }
    }
    else if (!a4)
    {
      goto LABEL_13;
    }
    id v19 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v20 = 2004;
LABEL_11:
    char v18 = 0;
    *a4 = (id)[v19 initWithSYError:v20 userInfo:0];
    goto LABEL_14;
  }
  uint64_t v8 = [v6 sessionID];
  id v9 = [v7 identifier];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      id v19 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v20 = 2006;
      goto LABEL_11;
    }
LABEL_13:
    char v18 = 0;
    goto LABEL_14;
  }
  id v11 = [v6 header];
  os_activity_scope_state_s v12 = [v11 sender];
  id v13 = [v12 generationID];
  BOOL v14 = [v7 peerGenerationIDs];
  uint64_t v15 = [v6 header];
  int v16 = [v15 sender];
  double v17 = [v16 peerID];
  [v14 setObject:v13 forKeyedSubscript:v17];

  char v18 = [v7 _handleStartSessionResponse:v6 error:a4];
LABEL_14:

  return v18;
}

- (BOOL)_handleSyncBatchResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SYService *)self currentSession];
  if (!v7)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR))
    {
      -[SYService _handleStartSessionResponse:error:]();
      if (!a4) {
        goto LABEL_13;
      }
    }
    else if (!a4)
    {
      goto LABEL_13;
    }
    id v12 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v13 = 2004;
LABEL_11:
    char v11 = 0;
    *a4 = (id)[v12 initWithSYError:v13 userInfo:0];
    goto LABEL_14;
  }
  uint64_t v8 = [v6 sessionID];
  id v9 = [v7 identifier];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      id v12 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v13 = 2006;
      goto LABEL_11;
    }
LABEL_13:
    char v11 = 0;
    goto LABEL_14;
  }
  char v11 = [v7 _handleSyncBatchResponse:v6 error:a4];
LABEL_14:

  return v11;
}

- (BOOL)_handleRestartSessionResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SYService *)self currentSession];
  if (!v7)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR))
    {
      -[SYService _handleStartSessionResponse:error:]();
      if (!a4) {
        goto LABEL_13;
      }
    }
    else if (!a4)
    {
      goto LABEL_13;
    }
    id v12 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v13 = 2004;
LABEL_11:
    char v11 = 0;
    *a4 = (id)[v12 initWithSYError:v13 userInfo:0];
    goto LABEL_14;
  }
  uint64_t v8 = [v6 sessionID];
  id v9 = [v7 identifier];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      id v12 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v13 = 2006;
      goto LABEL_11;
    }
LABEL_13:
    char v11 = 0;
    goto LABEL_14;
  }
  char v11 = [v7 _handleRestartSessionResponse:v6 error:a4];
LABEL_14:

  return v11;
}

- (BOOL)_handleEndSessionResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(SYService *)self currentSession];
  if (!v7)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR))
    {
      -[SYService _handleStartSessionResponse:error:]();
      if (!a4) {
        goto LABEL_13;
      }
    }
    else if (!a4)
    {
      goto LABEL_13;
    }
    id v12 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v13 = 2004;
LABEL_11:
    char v11 = 0;
    *a4 = (id)[v12 initWithSYError:v13 userInfo:0];
    goto LABEL_14;
  }
  uint64_t v8 = [v6 sessionID];
  id v9 = [v7 identifier];
  char v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    if (a4)
    {
      id v12 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v13 = 2006;
      goto LABEL_11;
    }
LABEL_13:
    char v11 = 0;
    goto LABEL_14;
  }
  char v11 = [v7 _handleEndSessionResponse:v6 error:a4];
LABEL_14:

  return v11;
}

- (void)_handleError:(id)a3
{
  id v4 = a3;
  id v5 = [v4 persistentUserInfo];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    delegateQueue = self->_delegateQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __26__SYService__handleError___block_invoke;
    v10[3] = &unk_264422BF8;
    v10[4] = self;
    id v11 = v4;
    id v12 = v5;
    id v9 = v10;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___dispatch_sync_autoreleased_block_invoke;
    block[3] = &unk_264423590;
    id v14 = v9;
    dispatch_sync(delegateQueue, block);
  }
}

void __26__SYService__handleError___block_invoke(void *a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  char v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:encounteredError:context:", v4, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  [WeakRetained service:a1[4] encounteredError:a1[5] context:a1[6]];
}

- (void)_peerRejectedVersion:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 supportedVersionsCount];
  if (v8)
  {
    uint64_t v9 = 0;
    while (1)
    {
      int v10 = [v6 supportedVersionsAtIndex:v9];
      if ((v10 - 3) >= 0xFFFFFFFE) {
        break;
      }
      if (v8 == ++v9) {
        goto LABEL_5;
      }
    }
    char v11 = v10;
    os_unfair_lock_lock(&self->_flagLock);
    self->_$FC3B5D260D4F8D1F83CF9B539A238CFB flags = ($FC3B5D260D4F8D1F83CF9B539A238CFB)(*(_DWORD *)&self->_flags & 0xFFFFFE3F | ((v11 & 7) << 6));
    os_unfair_lock_unlock(&self->_flagLock);
    inFlightSyncRequestIdentifier = self->_inFlightSyncRequestIdentifier;
    uint64_t v13 = [v6 inReplyTo];
    LODWORD(inFlightSyncRequestIdentifier) = [(NSString *)inFlightSyncRequestIdentifier isEqualToString:v13];

    if (inFlightSyncRequestIdentifier)
    {
      id v14 = self->_inFlightSyncRequestIdentifier;
      self->_inFlightSyncRequestIdentifier = 0;

      [(SYService *)self _sendResetRequest];
    }
    else
    {
      [(SYService *)self _swapSessionForVersionChange];
    }
  }
  else
  {
LABEL_5:
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_ERROR)) {
      -[SYService _peerRejectedVersion:completion:]();
    }
  }
  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
}

- (void)_swapSessionForVersionChange
{
  id v3 = self->_currentSession;
  id v4 = v3;
  if (v3)
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41__SYService__swapSessionForVersionChange__block_invoke;
    v6[3] = &unk_264422990;
    v6[4] = self;
    id v7 = v3;
    dispatch_async(queue, v6);
  }
}

void __41__SYService__swapSessionForVersionChange__block_invoke(uint64_t a1)
{
  char v2 = objc_msgSend(*(id *)(a1 + 32), "_makeSessionForDeltaSync:", objc_msgSend(*(id *)(a1 + 40), "isResetSync") ^ 1);
  [*(id *)(a1 + 40) _supercededWithSession:v2];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  id v5 = v2;

  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __41__SYService__swapSessionForVersionChange__block_invoke_2;
  v6[3] = &unk_264422968;
  v6[4] = *(void *)(a1 + 32);
  [v5 start:v6];
}

void __41__SYService__swapSessionForVersionChange__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v6 = qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl(&dword_21C7C9000, v6, OS_LOG_TYPE_DEFAULT, "Swapped-out session (version rejection) failed to start: %@", buf, 0xCu);
    }
    id v7 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v10 = *MEMORY[0x263F08608];
    id v11 = v5;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    uint64_t v9 = (void *)[v7 initWithSYError:2018 userInfo:v8];

    [*(id *)(a1 + 32) _handleError:v9];
  }
}

- (int64_t)priority
{
  return self->_defaultPriority;
}

- (void)setPriority:(int64_t)a3
{
  self->_int64_t defaultPriority = a3;
}

- (void)setOptions:(id)a3
{
}

- (OS_os_activity)serviceActivity
{
  return self->_serviceActivity;
}

- (_SYMultiSuspendableQueue)sessionQueue
{
  return self->_sessionQueue;
}

- (double)defaultMessageTimeout
{
  return self->_defaultMessageTimeout;
}

- (void)setDefaultMessageTimeout:(double)a3
{
  self->_defaultMessageTimeout = a3;
}

- (double)sessionStalenessInterval
{
  return self->_sessionStalenessInterval;
}

- (void)setSessionStalenessInterval:(double)a3
{
  self->_sessionStalenessInterval = a3;
}

- (int64_t)sendingBufferCap
{
  return self->_sendingBufferCap;
}

- (void)setSendingBufferCap:(int64_t)a3
{
  self->_sendingBufferCap = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (unsigned)engineType
{
  return self->_engineType;
}

- (void)setEngineType:(unsigned int)a3
{
  self->_engineType = a3;
}

- (NSString)generationID
{
  return self->_generationID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationID, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_serviceActivity, 0);
  objc_storeStrong((id *)&self->_onSessionEnd, 0);
  objc_storeStrong((id *)&self->_targetedDevice, 0);
  objc_storeStrong((id *)&self->_queuedStartSession, 0);
  objc_storeStrong((id *)&self->_inFlightSyncRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_rejectingV1SyncSessions, 0);
  objc_storeStrong((id *)&self->_vectorClock, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
  objc_storeStrong((id *)&self->_processSignalSource, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_incomingIOQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_customIDSOptions, 0);
  objc_storeStrong((id *)&self->_defaultOptions, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

- (void)sendData:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  id v11 = (void *)[v10 copy];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __61__SYService_AtomicTransactions__sendData_options_completion___block_invoke;
  v15[3] = &unk_264422CB8;
  id v16 = v8;
  double v17 = self;
  id v18 = v9;
  id v19 = v11;
  id v12 = v11;
  id v13 = v9;
  id v14 = v8;
  _os_activity_initiate(&dword_21C7C9000, "Send OOB Data", OS_ACTIVITY_FLAG_DEFAULT, v15);

  os_activity_scope_leave(&state);
}

void __61__SYService_AtomicTransactions__sendData_options_completion___block_invoke(uint64_t a1)
{
  char v2 = objc_opt_new();
  [v2 setPayload:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(NSObject **)(v3 + 56);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__SYService_AtomicTransactions__sendData_options_completion___block_invoke_2;
  v6[3] = &unk_264422CB8;
  v6[4] = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 56);
  id v5 = v2;
  dispatch_async(v4, v6);
}

void __61__SYService_AtomicTransactions__sendData_options_completion___block_invoke_2(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = (void *)v2[14];
  uint64_t v5 = [v2 priority];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__SYService_AtomicTransactions__sendData_options_completion___block_invoke_3;
  v7[3] = &unk_2644234A0;
  uint64_t v6 = *(void *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  [v4 enqueueSyncRequest:v3 withMessageID:106 priority:v5 options:v6 userContext:0 callback:v7];
}

uint64_t __61__SYService_AtomicTransactions__sendData_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)sendData:(id)a3 options:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  id v12 = dispatch_group_create();
  uint64_t v42 = 0;
  uint64_t v43 = &v42;
  uint64_t v44 = 0x2020000000;
  char v45 = 0;
  uint64_t v36 = 0;
  unsigned int v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__5;
  uint64_t v40 = __Block_byref_object_dispose__5;
  id v41 = 0;
  uint64_t v30 = 0;
  __int16 v31 = &v30;
  uint64_t v32 = 0x3032000000;
  __int16 v33 = __Block_byref_object_copy__5;
  uint64_t v34 = __Block_byref_object_dispose__5;
  id v35 = 0;
  dispatch_group_enter(v12);
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  int v24 = __67__SYService_AtomicTransactions__sendData_options_identifier_error___block_invoke;
  int v25 = &unk_2644234C8;
  __int16 v27 = &v42;
  uint64_t v28 = &v36;
  __int16 v29 = &v30;
  id v13 = v12;
  uint64_t v26 = v13;
  [(SYService *)self sendData:v10 options:v11 completion:&v22];
  [(SYService *)self defaultMessageTimeout];
  double v15 = v14;
  id v16 = [v11 objectForKeyedSubscript:@"SYServiceOptionMessageTimeout"];

  if (v16)
  {
    double v17 = [v11 objectForKeyedSubscript:@"SYServiceOptionMessageTimeout"];
    [v17 doubleValue];
    double v15 = v18;
  }
  dispatch_time_t v19 = dispatch_walltime(0, (uint64_t)(v15 * 1000000000.0));
  if (dispatch_group_wait(v13, v19))
  {
    BOOL v20 = 0;
    if (a6) {
      *a6 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2007 userInfo:0];
    }
  }
  else
  {
    if (a5) {
      *a5 = (id) v37[5];
    }
    if (a6) {
      *a6 = (id) v31[5];
    }
    BOOL v20 = *((unsigned char *)v43 + 24) != 0;
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  os_activity_scope_leave(&state);

  return v20;
}

void __67__SYService_AtomicTransactions__sendData_options_identifier_error___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)dataStreamWithMetadata:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  uint64_t v11 = (void *)[v10 copy];

  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __75__SYService_AtomicTransactions__dataStreamWithMetadata_options_completion___block_invoke;
  v15[3] = &unk_264422CB8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v11;
  id v12 = v11;
  id v13 = v9;
  id v14 = v8;
  _os_activity_initiate(&dword_21C7C9000, "OOB Data Stream", OS_ACTIVITY_FLAG_DEFAULT, v15);

  os_activity_scope_leave(&state);
}

void __75__SYService_AtomicTransactions__dataStreamWithMetadata_options_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 56);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __75__SYService_AtomicTransactions__dataStreamWithMetadata_options_completion___block_invoke_2;
  v4[3] = &unk_264422CB8;
  v4[4] = v2;
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  dispatch_async(v3, v4);
}

void __75__SYService_AtomicTransactions__dataStreamWithMetadata_options_completion___block_invoke_2(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v4 = (void *)v2[14];
  uint64_t v5 = [v2 priority];
  uint64_t v6 = a1[6];
  id v9 = 0;
  id v7 = [v4 outputStreamWithMetadata:v3 priority:v5 options:v6 context:0 error:&v9];
  id v8 = v9;
  (*(void (**)(void))(a1[7] + 16))();
}

- (id)dataStreamWithMetadata:(id)a3 options:(id)a4 identifier:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &state);
  uint64_t v20 = 0;
  BOOL v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = __Block_byref_object_copy__5;
  int v24 = __Block_byref_object_dispose__5;
  id v25 = 0;
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __81__SYService_AtomicTransactions__dataStreamWithMetadata_options_identifier_error___block_invoke;
  activity_block[3] = &unk_264423518;
  activity_void block[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = &v20;
  dispatch_time_t v19 = a6;
  id v11 = v10;
  id v12 = v9;
  _os_activity_initiate(&dword_21C7C9000, "OOB Data Stream", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  id v13 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  os_activity_scope_leave(&state);
  return v13;
}

void __81__SYService_AtomicTransactions__dataStreamWithMetadata_options_identifier_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__SYService_AtomicTransactions__dataStreamWithMetadata_options_identifier_error___block_invoke_2;
  v6[3] = &unk_2644234F0;
  uint64_t v9 = *(void *)(a1 + 56);
  v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  id v8 = v4;
  uint64_t v10 = v5;
  _dispatch_sync_safe_tagged(v3, v2, v6);
}

uint64_t __81__SYService_AtomicTransactions__dataStreamWithMetadata_options_identifier_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 112), "outputStreamWithMetadata:priority:options:context:error:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "priority"), *(void *)(a1 + 48), 0, *(void *)(a1 + 64));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;
  return MEMORY[0x270F9A758](v2, v4);
}

- (NSDictionary)customIDSOptions
{
  return self->_customIDSOptions;
}

- (void)setCustomIDSOptions:(id)a3
{
  uint64_t v4 = (NSDictionary *)[a3 copy];
  customIDSOptions = self->_customIDSOptions;
  self->_customIDSOptions = v4;
  MEMORY[0x270F9A758](v4, customIDSOptions);
}

- (BOOL)hasPairingStore
{
  uint64_t v2 = self;
  p_flagLock = &self->_flagLock;
  os_unfair_lock_lock(&self->_flagLock);
  LODWORD(v2) = (*(_DWORD *)&v2->_flags >> 3) & 1;
  os_unfair_lock_unlock(p_flagLock);
  return (char)v2;
}

- (void)_v1_handleFullSyncRequest:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  v24.opaque[0] = 0;
  v24.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &v24);
  id v8 = objc_opt_new();
  id v9 = [(SYService *)self _newMessageHeader];
  [v8 setHeader:v9];

  uint64_t v10 = [v6 syncID];
  [v8 setRequestSyncID:v10];

  [v8 setAccepted:0];
  if ([(SYService *)self isMasterStore])
  {
    id v11 = [(SYService *)self currentSession];
    if (v11)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [v11 birthDate];
      if (Current - v13 <= 1800.0)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        dispatch_time_t v19 = (id)qword_26AB04788;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [v11 identifier];
          *(_DWORD *)buf = 138543362;
          uint64_t v26 = v20;
          _os_log_impl(&dword_21C7C9000, v19, OS_LOG_TYPE_DEFAULT, "Rejecting full-sync request: session (%{public}@) in progress", buf, 0xCu);
        }
        BOOL v21 = [SYErrorInfo alloc];
        uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2005 userInfo:0];
        uint64_t v23 = [(SYErrorInfo *)v21 initWithError:v22];
        [v8 setError:v23];

        id v14 = [v6 syncID];
        double v15 = UserInfoDictionaryWithAssociatedSessionID(v14);
        v7[2](v7, v8, v15);
        goto LABEL_16;
      }
      [v11 cancel];
    }
    [v8 setAccepted:1];
    [(SYService *)self setNeedsResetSync];
    id v14 = [v6 syncID];
    double v15 = UserInfoDictionaryWithAssociatedSessionID(v14);
    v7[2](v7, v8, v15);
LABEL_16:

    goto LABEL_17;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (os_log_type_enabled((os_log_t)_sync_log_facilities, (os_log_type_t)0x90u)) {
    -[SYService _handleResetRequest:completion:]();
  }
  id v16 = [SYErrorInfo alloc];
  id v17 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2024 userInfo:0];
  id v18 = [(SYErrorInfo *)v16 initWithError:v17];
  [v8 setError:v18];

  id v11 = [v6 syncID];
  id v14 = UserInfoDictionaryWithAssociatedSessionID(v11);
  v7[2](v7, v8, v14);
LABEL_17:

  os_activity_scope_leave(&v24);
}

- (void)_v1_handleSyncAllObjects:(id)a3 completion:(id)a4
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *))a4;
  id v8 = objc_opt_new();
  id v9 = [v6 syncID];
  [v8 setSyncID:v9];

  uint64_t v10 = [(SYService *)self currentSession];
  if (!v10) {
    goto LABEL_4;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [(SYSession *)v10 birthDate];
  if (Current - v12 > 1800.0)
  {
    [(SYSession *)v10 cancel];
LABEL_4:
    double v13 = [[SYIncomingSyncAllObjectsSession alloc] initWithService:self message:v6 completion:v7];
    id v14 = v10;
    double v15 = v13;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v47 = 0;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x2020000000;
    char v50 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v52 = 0x3032000000;
    __int16 v53 = __Block_byref_object_copy__5;
    double v54 = __Block_byref_object_dispose__5;
    id v55 = 0;
    delegateQueue = self->_delegateQueue;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __71__SYService_CompanionSyncProtoV1___v1_handleSyncAllObjects_completion___block_invoke;
    v41[3] = &unk_2644232F0;
    char v45 = &v47;
    id v18 = WeakRetained;
    id v42 = v18;
    uint64_t v43 = self;
    id obj = v15;
    uint64_t v10 = v15;
    uint64_t v44 = v10;
    p_long long buf = &buf;
    dispatch_time_t v19 = v41;
    *(void *)dispatch_block_t block = MEMORY[0x263EF8330];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = ___dispatch_sync_autoreleased_block_invoke;
    v57 = &unk_264423590;
    id v58 = v19;
    dispatch_sync(delegateQueue, block);

    if (*((unsigned char *)v48 + 24))
    {
      if (self->_currentSession)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v20 = (id)qword_26AB04788;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          _SYObfuscate(self->_currentSession);
          objc_claimAutoreleasedReturnValue();
          -[SYService _handleStartSession:completion:].cold.5();
        }
      }
      [(SYSyncEngine *)self->_syncEngine beginSession];
      if ([(_SYMultiSuspendableQueue *)self->_sessionQueue isSuspended])
      {
        _os_assumes_log();
        -[SYService _processPendingChanges]();
      }
      [(_SYMultiSuspendableQueue *)self->_sessionQueue suspend];
      if (![(_SYMultiSuspendableQueue *)self->_sessionQueue isSuspended])
      {
        _os_assumes_log();
        -[SYService _processPendingChanges]();
      }
      objc_storeStrong((id *)&self->_currentSession, obja);
      objc_initWeak(&location, self);
      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      v38[2] = __71__SYService_CompanionSyncProtoV1___v1_handleSyncAllObjects_completion___block_invoke_488;
      v38[3] = &unk_264423540;
      objc_copyWeak(&v39, &location);
      [(SYIncomingFullSyncSession *)v10 start:v38];
      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      __int16 v29 = (id)qword_26AB04788;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        _SYObfuscate(v10);
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v31 = _SYObfuscate(*(void **)(*((void *)&buf + 1) + 40));
        *(_DWORD *)dispatch_block_t block = 138543618;
        *(void *)&void block[4] = v30;
        *(_WORD *)&block[12] = 2114;
        *(void *)&block[14] = v31;
        _os_log_impl(&dword_21C7C9000, v29, OS_LOG_TYPE_DEFAULT, "Delegate rejected incoming sync session (%{public}@) with error %{public}@", block, 0x16u);
      }
      id v32 = [(SYService *)self _newMessageHeader];
      [v8 setHeader:v32];

      __int16 v33 = [SYErrorInfo alloc];
      uint64_t v34 = [(SYErrorInfo *)v33 initWithError:*(void *)(*((void *)&buf + 1) + 40)];
      [v8 setError:v34];

      id v35 = [(SYSession *)v10 wrappedUserContext];
      v7[2](v7, v8, v35);
    }
    _Block_object_dispose(&buf, 8);

    _Block_object_dispose(&v47, 8);
    goto LABEL_27;
  }
  id v21 = [(SYService *)self _newMessageHeader];
  [v8 setHeader:v21];

  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v22 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = v22;
    os_activity_scope_state_s v24 = [(SYSession *)v10 identifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v24;
    _os_log_impl(&dword_21C7C9000, v23, OS_LOG_TYPE_DEFAULT, "Rejecting sync-all-objects: session (%{public}@) in progress", (uint8_t *)&buf, 0xCu);
  }
  id v25 = [SYErrorInfo alloc];
  uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:2005 userInfo:0];
  uint64_t v27 = [(SYErrorInfo *)v25 initWithError:v26];
  [v8 setError:v27];

  id v18 = [v6 syncID];
  uint64_t v28 = UserInfoDictionaryWithAssociatedSessionID(v18);
  v7[2](v7, v8, v28);

LABEL_27:
}

void __71__SYService_CompanionSyncProtoV1___v1_handleSyncAllObjects_completion___block_invoke(void *a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:startSession:error:", buf, 2u);
  }
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v9 = 0;
  char v6 = [v3 service:v4 startSession:v5 error:&v9];
  id v7 = v9;
  id v8 = v9;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v7);
  }
}

void __71__SYService_CompanionSyncProtoV1___v1_handleSyncAllObjects_completion___block_invoke_488(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (a2 & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v7 = (void *)qword_26AB04788;
    if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = v7;
      id v9 = _SYObfuscate(v5);
      int v10 = 138543362;
      id v11 = v9;
      _os_log_impl(&dword_21C7C9000, v8, OS_LOG_TYPE_DEFAULT, "Incoming v1 SyncAllObjects session failed to start: %{public}@. Error response message will be delivered by the session when it's completed.", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_v1_handleBatchSyncStart:(id)a3 completion:(id)a4
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!self->_rejectingV1SyncSessions)
  {
    id v8 = (NSMutableSet *)objc_opt_new();
    rejectingV1SyncSessions = self->_rejectingV1SyncSessions;
    self->_rejectingV1SyncSessions = v8;
  }
  int v10 = [(SYService *)self currentSession];
  if (!v10) {
    goto LABEL_6;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [(SYSession *)v10 birthDate];
  if (Current - v12 > 1800.0)
  {
    [(SYSession *)v10 cancel];
LABEL_6:
    double v13 = [[SYIncomingBatchSyncSession alloc] initWithService:self];

    id v14 = [v6 syncID];
    [(SYSession *)v13 setIdentifier:v14];

    double v15 = [v6 header];
    [v15 timestamp];
    -[SYSession setBirthDate:](v13, "setBirthDate:");

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v43 = 0;
    uint64_t v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v48 = 0x3032000000;
    uint64_t v49 = __Block_byref_object_copy__5;
    char v50 = __Block_byref_object_dispose__5;
    id v51 = 0;
    delegateQueue = self->_delegateQueue;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __71__SYService_CompanionSyncProtoV1___v1_handleBatchSyncStart_completion___block_invoke;
    void v37[3] = &unk_2644232F0;
    id v41 = &v43;
    id v18 = WeakRetained;
    id v38 = v18;
    id v39 = self;
    int v10 = v13;
    uint64_t v40 = v10;
    p_long long buf = &buf;
    dispatch_time_t v19 = v37;
    *(void *)dispatch_block_t block = MEMORY[0x263EF8330];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = ___dispatch_sync_autoreleased_block_invoke;
    __int16 v53 = &unk_264423590;
    id v54 = v19;
    dispatch_sync(delegateQueue, block);

    if (*((unsigned char *)v44 + 24))
    {
      if (self->_currentSession)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        uint64_t v20 = (id)qword_26AB04788;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          _SYObfuscate(self->_currentSession);
          objc_claimAutoreleasedReturnValue();
          -[SYService _handleStartSession:completion:].cold.5();
        }
      }
      [(SYSyncEngine *)self->_syncEngine beginSession];
      if ([(_SYMultiSuspendableQueue *)self->_sessionQueue isSuspended])
      {
        _os_assumes_log();
        -[SYService _processPendingChanges]();
      }
      [(_SYMultiSuspendableQueue *)self->_sessionQueue suspend];
      if (![(_SYMultiSuspendableQueue *)self->_sessionQueue isSuspended])
      {
        _os_assumes_log();
        -[SYService _processPendingChanges]();
      }
      objc_storeStrong((id *)&self->_currentSession, v13);
      objc_initWeak(&location, self);
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __71__SYService_CompanionSyncProtoV1___v1_handleBatchSyncStart_completion___block_invoke_491;
      v31[3] = &unk_264423568;
      objc_copyWeak(&v35, &location);
      id v32 = v6;
      id v34 = v7;
      __int16 v33 = v10;
      [(SYIncomingFullSyncSession *)v33 start:v31];

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v26 = (id)qword_26AB04788;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = _SYObfuscate(v10);
        uint64_t v28 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)dispatch_block_t block = 138543618;
        *(void *)&void block[4] = v27;
        *(_WORD *)&block[12] = 2112;
        *(void *)&block[14] = v28;
        _os_log_impl(&dword_21C7C9000, v26, OS_LOG_TYPE_DEFAULT, "Delegate rejected incoming sync session (%{public}@) with error %@", block, 0x16u);
      }
      __int16 v29 = self->_rejectingV1SyncSessions;
      id v30 = [v6 syncID];
      [(NSMutableSet *)v29 addObject:v30];

      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v43, 8);

    goto LABEL_29;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  id v21 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = v21;
    uint64_t v23 = [(SYSession *)v10 identifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v23;
    _os_log_impl(&dword_21C7C9000, v22, OS_LOG_TYPE_DEFAULT, "Rejecting full-sync start: session (%{public}@) in progress", (uint8_t *)&buf, 0xCu);
  }
  os_activity_scope_state_s v24 = self->_rejectingV1SyncSessions;
  id v25 = [v6 syncID];
  [(NSMutableSet *)v24 addObject:v25];

  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
LABEL_29:
}

void __71__SYService_CompanionSyncProtoV1___v1_handleBatchSyncStart_completion___block_invoke(void *a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:startSession:error", buf, 2u);
  }
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v9 = 0;
  char v6 = [v3 service:v4 startSession:v5 error:&v9];
  id v7 = v9;
  id v8 = v9;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v7);
  }
}

void __71__SYService_CompanionSyncProtoV1___v1_handleBatchSyncStart_completion___block_invoke_491(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ((a2 & 1) == 0 && WeakRetained)
  {
    uint64_t v4 = (void *)*((void *)WeakRetained + 16);
    uint64_t v5 = [*(id *)(a1 + 32) syncID];
    [v4 addObject:v5];

    char v6 = (void *)*((void *)WeakRetained + 5);
    *((void *)WeakRetained + 5) = 0;

    [*((id *)WeakRetained + 10) resume];
  }
  uint64_t v7 = *(void *)(a1 + 48);
  id v8 = [*(id *)(a1 + 40) wrappedUserContext];
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
}

- (void)_v1_handleBatchSyncChunk:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *))a4;
  id v8 = self->_currentSession;
  rejectingV1SyncSessions = self->_rejectingV1SyncSessions;
  int v10 = [v6 syncID];
  if ([(NSMutableSet *)rejectingV1SyncSessions containsObject:v10])
  {
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [(SYSession *)v8 _handleBatchChunk:v6 completion:v7];
      goto LABEL_10;
    }
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  double v12 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = v12;
    id v14 = [(SYSession *)v8 identifier];
    int v23 = 138543362;
    os_activity_scope_state_s v24 = v14;
    _os_log_impl(&dword_21C7C9000, v13, OS_LOG_TYPE_DEFAULT, "Rejecting full-sync batch: session (%{public}@) in progress", (uint8_t *)&v23, 0xCu);
  }
  double v15 = objc_opt_new();
  id v16 = [(SYService *)self _newMessageHeader];
  [v15 setHeader:v16];

  id v17 = [v6 syncID];
  [v15 setSyncID:v17];

  objc_msgSend(v15, "setChunkIndex:", objc_msgSend(v6, "chunkIndex"));
  id v18 = [SYErrorInfo alloc];
  dispatch_time_t v19 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:1002 userInfo:0];
  uint64_t v20 = [(SYErrorInfo *)v18 initWithError:v19];
  [v15 setError:v20];

  id v21 = [v6 syncID];
  uint64_t v22 = UserInfoDictionaryWithAssociatedSessionID(v21);
  v7[2](v7, v15, v22);

LABEL_10:
}

- (void)_v1_handleBatchSyncEnd:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void *))a4;
  id v8 = self->_currentSession;
  rejectingV1SyncSessions = self->_rejectingV1SyncSessions;
  int v10 = [v6 syncID];
  if ([(NSMutableSet *)rejectingV1SyncSessions containsObject:v10])
  {
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      [(SYSession *)v8 _handleEndSync:v6 completion:v7];
      goto LABEL_10;
    }
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  double v12 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    double v13 = v12;
    id v14 = [(SYSession *)v8 identifier];
    int v23 = 138543362;
    os_activity_scope_state_s v24 = v14;
    _os_log_impl(&dword_21C7C9000, v13, OS_LOG_TYPE_DEFAULT, "Rejecting full-sync end: session (%{public}@) in progress", (uint8_t *)&v23, 0xCu);
  }
  double v15 = objc_opt_new();
  id v16 = [(SYService *)self _newMessageHeader];
  [v15 setHeader:v16];

  id v17 = [v6 syncID];
  [v15 setSyncID:v17];

  id v18 = [SYErrorInfo alloc];
  dispatch_time_t v19 = (void *)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:1002 userInfo:0];
  uint64_t v20 = [(SYErrorInfo *)v18 initWithError:v19];
  [v15 setError:v20];

  [v15 setErrorResolution:0];
  id v21 = [v6 syncID];
  uint64_t v22 = UserInfoDictionaryWithAssociatedSessionID(v21);
  v7[2](v7, v15, v22);

LABEL_10:
}

- (void)_v1_handleChangeMessage:(id)a3 completion:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SYService *)self currentSession];
  if (!v8) {
    goto LABEL_4;
  }
  double Current = CFAbsoluteTimeGetCurrent();
  [(SYSession *)v8 birthDate];
  if (Current - v10 > 1800.0)
  {
    [(SYSession *)v8 cancel];
LABEL_4:
    id v11 = [[SYIncomingTransactionSession alloc] initWithService:self transaction:v6 completion:v7];

    double v12 = objc_opt_new();
    double v13 = [v12 UUIDString];
    [(SYSession *)v11 setIdentifier:v13];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x2020000000;
    char v37 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v39 = 0x3032000000;
    uint64_t v40 = __Block_byref_object_copy__5;
    id v41 = __Block_byref_object_dispose__5;
    id v42 = 0;
    delegateQueue = self->_delegateQueue;
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __70__SYService_CompanionSyncProtoV1___v1_handleChangeMessage_completion___block_invoke;
    v28[3] = &unk_2644232F0;
    id v32 = &v34;
    id v16 = WeakRetained;
    id v29 = v16;
    id v30 = self;
    id v8 = v11;
    __int16 v31 = v8;
    p_long long buf = &buf;
    id v17 = v28;
    *(void *)dispatch_block_t block = MEMORY[0x263EF8330];
    *(void *)&block[8] = 3221225472;
    *(void *)&block[16] = ___dispatch_sync_autoreleased_block_invoke;
    uint64_t v44 = &unk_264423590;
    id v45 = v17;
    dispatch_sync(delegateQueue, block);

    if (*((unsigned char *)v35 + 24))
    {
      if (self->_currentSession)
      {
        if (_sync_log_facilities_pred != -1) {
          _os_once();
        }
        id v18 = (id)qword_26AB04788;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          _SYObfuscate(self->_currentSession);
          objc_claimAutoreleasedReturnValue();
          -[SYService _handleStartSession:completion:].cold.5();
        }
      }
      [(SYSyncEngine *)self->_syncEngine beginSession];
      if ([(_SYMultiSuspendableQueue *)self->_sessionQueue isSuspended])
      {
        _os_assumes_log();
        -[SYService _processPendingChanges]();
      }
      [(_SYMultiSuspendableQueue *)self->_sessionQueue suspend];
      if (![(_SYMultiSuspendableQueue *)self->_sessionQueue isSuspended])
      {
        _os_assumes_log();
        -[SYService _processPendingChanges]();
      }
      objc_storeStrong((id *)&self->_currentSession, v11);
      objc_initWeak(&location, self);
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __70__SYService_CompanionSyncProtoV1___v1_handleChangeMessage_completion___block_invoke_494;
      v25[3] = &unk_264423540;
      objc_copyWeak(&v26, &location);
      [(SYIncomingTransactionSession *)v8 start:v25];
      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }
    else
    {
      if (_sync_log_facilities_pred != -1) {
        _os_once();
      }
      uint64_t v22 = (id)qword_26AB04788;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = _SYObfuscate(v8);
        uint64_t v24 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)dispatch_block_t block = 138543618;
        *(void *)&void block[4] = v23;
        *(_WORD *)&block[12] = 2112;
        *(void *)&block[14] = v24;
        _os_log_impl(&dword_21C7C9000, v22, OS_LOG_TYPE_DEFAULT, "Delegate rejected incoming v1 transaction (%{public}@) with error %@", block, 0x16u);
      }
      (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
    }

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v34, 8);

    goto LABEL_27;
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  dispatch_time_t v19 = (void *)qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = v19;
    id v21 = [(SYSession *)v8 identifier];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v21;
    _os_log_impl(&dword_21C7C9000, v20, OS_LOG_TYPE_DEFAULT, "Rejecting delta change: session (%{public}@) in progress", (uint8_t *)&buf, 0xCu);
  }
  (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
LABEL_27:
}

void __70__SYService_CompanionSyncProtoV1___v1_handleChangeMessage_completion___block_invoke(void *a1)
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  uint64_t v2 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21C7C9000, v2, OS_LOG_TYPE_INFO, "Delegate: -service:startSession:error:", buf, 2u);
  }
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = a1[6];
  id v9 = 0;
  char v6 = [v3 service:v4 startSession:v5 error:&v9];
  id v7 = v9;
  id v8 = v9;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v7);
  }
}

void __70__SYService_CompanionSyncProtoV1___v1_handleChangeMessage_completion___block_invoke_494(uint64_t a1, char a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if ((a2 & 1) == 0 && WeakRetained)
  {
    id v4 = WeakRetained[5];
    WeakRetained[5] = 0;
    uint64_t v5 = WeakRetained;

    [v5[10] resume];
    id WeakRetained = v5;
  }
}

- (BOOL)_v1_handleFullSyncRequestAck:(id)a3 error:(id *)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter((os_activity_t)self->_serviceActivity, &v11);
  inFlightSyncRequestIdentifier = self->_inFlightSyncRequestIdentifier;
  self->_inFlightSyncRequestIdentifier = 0;

  if (([v5 accepted] & 1) == 0)
  {
    if (_sync_log_facilities_pred != -1) {
      _os_once();
    }
    id v7 = (id)qword_26AB04788;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 error];
      id v9 = _SYObfuscate(v8);
      *(_DWORD *)long long buf = 138543362;
      double v13 = v9;
      _os_log_impl(&dword_21C7C9000, v7, OS_LOG_TYPE_DEFAULT, "Protocol v1 full-sync-request was DENIED with error %{public}@", buf, 0xCu);
    }
  }
  os_activity_scope_leave(&v11);

  return 1;
}

- (BOOL)_v1_handleBatchChunkAck:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self->_currentSession;
  rejectingV1SyncSessions = self->_rejectingV1SyncSessions;
  id v9 = [v6 syncID];
  if ([(NSMutableSet *)rejectingV1SyncSessions containsObject:v9])
  {
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      char v11 = [(SYSession *)v7 _handleBatchAck:v6 error:a4];
      goto LABEL_11;
    }
  }
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  double v12 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_21C7C9000, v12, OS_LOG_TYPE_DEFAULT, "Response received for rejected v1 session", v14, 2u);
  }
  char v11 = 0;
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:1002 userInfo:0];
  }
LABEL_11:

  return v11;
}

- (BOOL)_v1_handleBatchEndResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self->_currentSession;
  rejectingV1SyncSessions = self->_rejectingV1SyncSessions;
  id v9 = [v6 syncID];
  if (([(NSMutableSet *)rejectingV1SyncSessions containsObject:v9] & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        goto LABEL_3;
      }
    }
    char v11 = [(SYSession *)v7 _handleBatchSyncEndResponse:v6 error:a4];
    goto LABEL_13;
  }

LABEL_3:
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  double v10 = qword_26AB04788;
  if (os_log_type_enabled((os_log_t)qword_26AB04788, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl(&dword_21C7C9000, v10, OS_LOG_TYPE_DEFAULT, "Response received for rejected v1 session", v14, 2u);
  }
  char v11 = 0;
  if (a4) {
    *a4 = (id)[objc_alloc(MEMORY[0x263F087E8]) initWithSYError:1002 userInfo:0];
  }
LABEL_13:

  return v11;
}

- (void)initWithService:priority:qos:asMasterStore:options:.cold.1()
{
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (OUTLINED_FUNCTION_3_0()) {
    OUTLINED_FUNCTION_0_5(&dword_21C7C9000, v0, v1, "Queue state assumption failed: _sessionQueue.suspended", v2, v3, v4, v5, 0);
  }
}

- (void)_updateMetaProtocolInfoForDevice:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_8_0(&dword_21C7C9000, v0, v1, "For some reason I have a pairing store path but no SYDevice??", v2, v3, v4, v5, v6);
}

void __41__SYService__deviceTargetabilityChanged___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_5() debugDescription];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12(&dword_21C7C9000, v5, v6, "Device info: %{public}@", v7, v8, v9, v10, v11);
}

void __41__SYService__deviceTargetabilityChanged___block_invoke_cold_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)OUTLINED_FUNCTION_5() debugDescription];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_12(&dword_21C7C9000, v5, v6, "Current device info: %{public}@", v7, v8, v9, v10, v11);
}

void __41__SYService__deviceTargetabilityChanged___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "_deviceTargetabilityChanged:", v2, v3, v4, v5, v6);
}

- (void)resume:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "SYService resumed with no delegate", v2, v3, v4, v5, v6);
}

- (void)resume:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "SYService resumed with no pairing store", v2, v3, v4, v5, v6);
}

- (void)resume:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "SYService resumed while already running", v2, v3, v4, v5, v6);
}

void __20__SYService_resume___block_invoke_cold_1()
{
  _os_assumes_log();
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (OUTLINED_FUNCTION_3_0()) {
    OUTLINED_FUNCTION_0_5(&dword_21C7C9000, v0, v1, "Queue state assumption failed: _sessionQueue.suspended == NO", v2, v3, v4, v5, 0);
  }
}

void __20__SYService_resume___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  int v3 = 138543362;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_4(&dword_21C7C9000, v1, v2, "Error initializing SYService messaging: %{public}@", (uint8_t *)&v3);
}

void __20__SYService_resume___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  int v3 = 138543362;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_4(&dword_21C7C9000, v1, v2, "Error initializing SYService DB: %{public}@", (uint8_t *)&v3);
}

- (void)_initializeServiceDB:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_21C7C9000, v0, v1, "Nil data store path for SYService %p", v2);
}

- (void)_initializeServiceDB:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "SYService has a nil persistent store!", v2, v3, v4, v5, v6);
}

- (void)_swapEngineTo:.cold.1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7_0(v1, v2, 5.8381e-34);
  _os_log_error_impl(&dword_21C7C9000, v3, (os_log_type_t)0x90u, "Failed to restore original engine! I can only suspend the entire service now... %{public}@", v4, 0xCu);
}

- (void)_swapEngineTo:.cold.2()
{
  OUTLINED_FUNCTION_5_0();
  *(_DWORD *)uint64_t v1 = 67109378;
  *(_DWORD *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 8) = 2114;
  *(void *)(v1 + 10) = v3;
  _os_log_error_impl(&dword_21C7C9000, v5, (os_log_type_t)0x90u, "Failed to swap to engine type %{companionsync:SYServiceEngineType}d: %{public}@", v4, 0x12u);
}

- (void)sessionDidEnd:(void *)a1 withError:.cold.1(void *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() identifier];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_21C7C9000, v1, v4, "The ended session (%{public}@) is not the current session. Why is that?", v5);
}

- (void)_wrapUpCurrentSession:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = a2;
  uint64_t v4 = objc_opt_new();
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_ERROR, "Concluding session has birthDate in the future! birthDate = %{public}@, now = %{public}@", (uint8_t *)&v5, 0x16u);
}

void __35__SYService__wrapUpCurrentSession___block_invoke_2_cold_1()
{
  _os_assumes_log();
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (OUTLINED_FUNCTION_3_0()) {
    OUTLINED_FUNCTION_0_5(&dword_21C7C9000, v0, v1, "Queue state assumption failed: service->_sessionQueue.isSuspended == YES", v2, v3, v4, v5, 0);
  }
}

- (void)_chooseBetweenCollidingSessions:(void *)a1 :(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_4_0();
  _os_log_debug_impl(&dword_21C7C9000, v3, OS_LOG_TYPE_DEBUG, "Asking delegate about session collision preference. We have chosen %{public}@ as the winner", v5, 0xCu);
}

- (void)willAcceptMessageWithHeader:(os_log_t)log messageID:.cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_21C7C9000, log, (os_log_type_t)0x90u, "Message repeated (bubble): seqno = %llu, GUID = %{public}@", (uint8_t *)&v3, 0x16u);
}

void __47__SYService_handleSyncRequest_ofType_response___block_invoke_cold_1(unsigned __int16 *a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v4 = *a1;
  id v5 = a3;
  OUTLINED_FUNCTION_5();
  uint64_t v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  v8[0] = 67109378;
  v8[1] = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v7;
  _os_log_error_impl(&dword_21C7C9000, v3, (os_log_type_t)0x90u, "Unknown message arrived with SYMessageID %d (PB class '%{public}@')", (uint8_t *)v8, 0x12u);
}

void __52__SYService_handleFileTransfer_metadata_completion___block_invoke_173_cold_1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_4(&dword_21C7C9000, v0, v1, "Failed to remove file used by file-transfer after read completion: %{public}@", v2);
}

- (void)_enqueueIncomingStartSessionRequest:withCompletion:.cold.1()
{
  _os_assumes_log();
  if (_sync_log_facilities_pred != -1) {
    _os_once();
  }
  if (OUTLINED_FUNCTION_3_0()) {
    OUTLINED_FUNCTION_0_5(&dword_21C7C9000, v0, v1, "Queue state assumption failed: _queuedStartSession == nil", v2, v3, v4, v5, 0);
  }
}

- (void)_handleStartSession:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "Reset sync session sent to master peer", v2, v3, v4, v5, v6);
}

- (void)_handleStartSession:completion:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "Notifying engine of incoming session", v2, v3, v4, v5, v6);
}

- (void)_handleStartSession:completion:.cold.5()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_7_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_4(&dword_21C7C9000, v3, (uint64_t)v3, "About to build a new session, but there's already one running! Currently-running session is %{public}@", v4);
}

void __44__SYService__handleStartSession_completion___block_invoke_183_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "Critical failure. Session start callback gave us a nil self.", v2, v3, v4, v5, v6);
}

- (void)_handleResetRequest:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_8_0(&dword_21C7C9000, v0, v1, "A SYResetRequest was received by a slave peer, which is invalid.", v2, v3, v4, v5, v6);
}

- (void)_handleSyncBatch:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "Rejecting sync batch: no session in progress", v2, v3, v4, v5, v6);
}

- (void)_handleRestartSession:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "Rejecting sync restart: no session in progress", v2, v3, v4, v5, v6);
}

- (void)_handleEndSession:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "Rejecting sync end: no session in progress", v2, v3, v4, v5, v6);
}

- (void)_handleStartSessionResponse:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "No session in progress for incoming response", v2, v3, v4, v5, v6);
}

- (void)_peerRejectedVersion:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "Unable to switch protocols -- peer doesn't support anything I know!", v2, v3, v4, v5, v6);
}

@end