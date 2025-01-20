@interface MSPSharedTripCapabilityFetchingServer
- (BOOL)_connectionCanControlSharing:(id)a3;
- (BOOL)_shouldPermitFetchingHandle:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MSPSharedTripCapabilityFetchingServer)init;
- (id)_resolvedStatusForHandle:(id)a3;
- (void)_checkBlockList;
- (void)_notifyPeersForIDSHandlesIfNeeded:(id)a3;
- (void)_performBlockOnAllCachedStatus:(id)a3;
- (void)_performBlockOnAllQueues:(id)a3;
- (void)_purgeExpiredStatuses;
- (void)_removePeerForConnection:(id)a3;
- (void)_scheduleCoalescedBlockListCheckIfNeeded;
- (void)_startMonitoringSystemBlockListIfNeeded;
- (void)_stopMonitoringSystemBlockList;
- (void)_systemBlockListDidUpdate;
- (void)_verifyCurrentlyBlockedStatuses;
- (void)_verifyCurrentlyUnblockedStatuses;
- (void)cancelFetchCapabilitiesForContacts:(id)a3;
- (void)capabilityFetchingQueue:(id)a3 didFetchStatusForHandles:(id)a4;
- (void)cleanConnections;
- (void)createXPCListener;
- (void)dealloc;
- (void)fetchCapabilitiesForContacts:(id)a3;
@end

@implementation MSPSharedTripCapabilityFetchingServer

- (MSPSharedTripCapabilityFetchingServer)init
{
  v32.receiver = self;
  v32.super_class = (Class)MSPSharedTripCapabilityFetchingServer;
  v2 = [(MSPSharedTripCapabilityFetchingServer *)&v32 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    peersByConnection = v2->_peersByConnection;
    v2->_peersByConnection = (NSMapTable *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.Maps.SharedTrip.Capabilities", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

    v8 = [[MSPSharedTripIDSCapabilityFetchingQueue alloc] initWithIDSService:@"com.apple.private.alloy.maps.eta" capabilityType:4 delegate:v2 queue:v2->_workQueue label:@"Maps"];
    mapsStatusFetchQueue = v2->_mapsStatusFetchQueue;
    v2->_mapsStatusFetchQueue = v8;

    v10 = [[MSPSharedTripIDSCapabilityFetchingQueue alloc] initWithIDSService:@"com.apple.madrid" capabilityType:3 delegate:v2 queue:v2->_workQueue label:@"iMessage"];
    messagesStatusFetchQueue = v2->_messagesStatusFetchQueue;
    v2->_messagesStatusFetchQueue = v10;

    v12 = [[MSPSharedTripMessagesCapabilityFetchingQueue alloc] initWithDelegate:v2 queue:v2->_workQueue label:@"Text Message"];
    textMessageStatusFetchQueue = v2->_textMessageStatusFetchQueue;
    v2->_textMessageStatusFetchQueue = v12;

    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identifierToMapsStatus = v2->_identifierToMapsStatus;
    v2->_identifierToMapsStatus = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identifierToMessagesStatus = v2->_identifierToMessagesStatus;
    v2->_identifierToMessagesStatus = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identifierToTextMessageStatus = v2->_identifierToTextMessageStatus;
    v2->_identifierToTextMessageStatus = v18;

    GEOConfigGetDouble();
    double v21 = v20;
    objc_initWeak(&location, v2);
    v22 = v2->_workQueue;
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    v28 = __45__MSPSharedTripCapabilityFetchingServer_init__block_invoke;
    v29 = &unk_1E617C748;
    objc_copyWeak(&v30, &location);
    uint64_t v23 = +[GCDTimer scheduledTimerWithTimeInterval:v22 queue:1 repeating:&v26 block:v21];
    purgeTimer = v2->_purgeTimer;
    v2->_purgeTimer = (GCDTimer *)v23;

    [(MSPSharedTripCapabilityFetchingServer *)v2 createXPCListener];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __45__MSPSharedTripCapabilityFetchingServer_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _purgeExpiredStatuses];
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_blockListMonitoringObserver];

  [(GCDTimer *)self->_purgeTimer invalidate];
  [(MSPSharedTripCapabilityFetchingServer *)self cleanConnections];
  v4 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136380675;
    v7 = "-[MSPSharedTripCapabilityFetchingServer dealloc]";
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_INFO, "[Server] %{private}s", buf, 0xCu);
  }

  v5.receiver = self;
  v5.super_class = (Class)MSPSharedTripCapabilityFetchingServer;
  [(MSPSharedTripCapabilityFetchingServer *)&v5 dealloc];
}

- (void)cleanConnections
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136380675;
    v17 = "-[MSPSharedTripCapabilityFetchingServer cleanConnections]";
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_INFO, "[Server] %{private}s", buf, 0xCu);
  }

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v4 = [(NSMapTable *)self->_peersByConnection keyEnumerator];
  objc_super v5 = [v4 allObjects];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 invalidate];
        [v10 setExportedObject:0];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  [(NSXPCListener *)self->_listener invalidate];
}

- (void)createXPCListener
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_listener)
  {
    uint64_t v3 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v8 = 136380675;
      v9 = "-[MSPSharedTripCapabilityFetchingServer createXPCListener]";
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_INFO, "[Server] %{private}s", (uint8_t *)&v8, 0xCu);
    }

    v4 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    peersByConnection = self->_peersByConnection;
    self->_peersByConnection = v4;

    uint64_t v6 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.Maps.xpc.SharedTrip.Capabilities"];
    listener = self->_listener;
    self->_listener = v6;

    [(NSXPCListener *)self->_listener setDelegate:self];
    [(NSXPCListener *)self->_listener _setQueue:self->_workQueue];
    [(NSXPCListener *)self->_listener resume];
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(MSPSharedTripXPCPeer *)[MSPSharedTripCapabilityFetchingPeer alloc] initWithConnection:v7];
  BOOL v9 = [(MSPSharedTripXPCPeer *)v8 canControlSharing];
  if (v9)
  {
    [(NSMapTable *)self->_peersByConnection setObject:v8 forKey:v7];
    uint64_t v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1222CF0];
    [v7 setExportedInterface:v10];

    [v7 setExportedObject:self];
    long long v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1212AD8];
    long long v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    [v11 setClasses:v15 forSelector:sel_capabilityLevelsDidUpdate_ argumentIndex:0 ofReply:0];

    [v7 setRemoteObjectInterface:v11];
    [v7 _setQueue:self->_workQueue];
    v16 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v7;
      _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "[Server] Accepting new connection: %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, v7);
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __76__MSPSharedTripCapabilityFetchingServer_listener_shouldAcceptNewConnection___block_invoke;
    v21[3] = &unk_1E617C4C0;
    objc_copyWeak(&v22, (id *)buf);
    objc_copyWeak(&v23, &location);
    [v7 setInvalidationHandler:v21];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __76__MSPSharedTripCapabilityFetchingServer_listener_shouldAcceptNewConnection___block_invoke_90;
    v18[3] = &unk_1E617C4C0;
    objc_copyWeak(&v19, (id *)buf);
    objc_copyWeak(&v20, &location);
    [v7 setInterruptionHandler:v18];
    [v7 resume];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    long long v11 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v7;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_ERROR, "[Server] will not accept connection due to missing sharing entitlement: %@", buf, 0xCu);
    }
  }

  return v9;
}

void __76__MSPSharedTripCapabilityFetchingServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_ERROR, "[Server] Connection invalidated: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 _removePeerForConnection:WeakRetained];
}

void __76__MSPSharedTripCapabilityFetchingServer_listener_shouldAcceptNewConnection___block_invoke_90(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412290;
    id v6 = WeakRetained;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_ERROR, "[Server] Connection interrupted: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 _removePeerForConnection:WeakRetained];
}

- (BOOL)_connectionCanControlSharing:(id)a3
{
  uint64_t v3 = [(NSMapTable *)self->_peersByConnection objectForKey:a3];
  char v4 = [v3 canControlSharing];

  return v4;
}

- (void)_removePeerForConnection:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = [(NSMapTable *)self->_peersByConnection objectForKey:v4];
    if (v5)
    {
      id v6 = MSPGetSharedTripCapabilityFetchingLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v14 = v5;
        _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "[Server] Removing peer %{public}@", buf, 0xCu);
      }

      uint64_t v7 = [v5 requestedHandles];
      int v8 = [v7 array];
      BOOL v9 = [v5 removeRequestedHandles:v8];

      [(NSMapTable *)self->_peersByConnection removeObjectForKey:v4];
      if ([v9 count])
      {
        uint64_t v10 = MSPGetSharedTripCapabilityFetchingLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138477827;
          uint64_t v14 = v9;
          _os_log_impl(&dword_1B87E5000, v10, OS_LOG_TYPE_INFO, "[Server] Clearing peer's requested handles from queue: %{private}@", buf, 0xCu);
        }

        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __66__MSPSharedTripCapabilityFetchingServer__removePeerForConnection___block_invoke;
        v11[3] = &unk_1E617DC60;
        id v12 = v9;
        [(MSPSharedTripCapabilityFetchingServer *)self _performBlockOnAllQueues:v11];
      }
    }
  }
}

uint64_t __66__MSPSharedTripCapabilityFetchingServer__removePeerForConnection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateRequestedHandlesWithAdditions:0 subtractions:*(void *)(a1 + 32)];
}

- (void)fetchCapabilitiesForContacts:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  if (v5
    && [(MSPSharedTripCapabilityFetchingServer *)self _connectionCanControlSharing:v5])
  {

    id v40 = v5;
    [(NSMapTable *)self->_peersByConnection objectForKey:v5];
    id v56 = 0;
    v39 = id v57 = 0;
    [v39 updateRequestedHandles:v4 added:&v57 removed:&v56];
    id v37 = v57;
    id v42 = v56;
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v52 = __70__MSPSharedTripCapabilityFetchingServer_fetchCapabilitiesForContacts___block_invoke;
    v53 = &unk_1E617DC88;
    v54 = self;
    id v43 = v6;
    id v55 = v43;
    id v41 = v4;
    id v7 = v4;
    int v8 = v51;
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v10 = v7;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:buf count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = 0;
      uint64_t v14 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v59 != v14) {
            objc_enumerationMutation(v10);
          }
          v16 = ((void (*)(void *, void, uint64_t))v52)(v8, *(void *)(*((void *)&v58 + 1) + 8 * i), v13 + i);
          if (v16) {
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v58 objects:buf count:16];
        v13 += i;
      }
      while (v12);
    }

    uint64_t v17 = [v9 copy];
    if ([v43 count])
    {
      uint64_t v18 = MSPGetSharedTripCapabilityFetchingLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        uint64_t v19 = [v43 count];
        *(_DWORD *)buf = 134218243;
        v64 = (const char *)v19;
        __int16 v65 = 2113;
        id v66 = v43;
        _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_INFO, "Filtered out %lu contacts: %{private}@", buf, 0x16u);
      }
    }
    id v20 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478339;
      v64 = (const char *)v17;
      __int16 v65 = 2113;
      id v66 = v37;
      __int16 v67 = 2113;
      id v68 = v42;
      _os_log_impl(&dword_1B87E5000, v20, OS_LOG_TYPE_INFO, "Fetch contacts: %{private}@\n\tAdded: %{private}@,\n\tRemoved: %{private}@", buf, 0x20u);
    }
    v38 = (void *)v17;

    double v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v37, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v22 = v37;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v62 count:16];
    v24 = v39;
    if (v23)
    {
      uint64_t v25 = v23;
      uint64_t v26 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v48 != v26) {
            objc_enumerationMutation(v22);
          }
          uint64_t v28 = *(void *)(*((void *)&v47 + 1) + 8 * j);
          v29 = [(MSPSharedTripCapabilityFetchingServer *)self _resolvedStatusForHandle:v28];
          id v30 = v29;
          if (v29 && ([v29 isExpired] & 1) == 0) {
            [v21 addObject:v28];
          }
        }
        uint64_t v25 = [v22 countByEnumeratingWithState:&v47 objects:v62 count:16];
      }
      while (v25);
    }

    if ([v21 count])
    {
      v31 = MSPGetSharedTripCapabilityFetchingLog();
      id v5 = v40;
      id v4 = v41;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = [v21 count];
        *(_DWORD *)buf = 134217984;
        v64 = (const char *)v32;
        _os_log_impl(&dword_1B87E5000, v31, OS_LOG_TYPE_INFO, "%lu handles have cached statuses, removing from handles to fetch", buf, 0xCu);
      }

      v33 = (void *)[v22 mutableCopy];
      [v33 minusSet:v21];
      uint64_t v34 = [v33 copy];

      [(MSPSharedTripCapabilityFetchingServer *)self _notifyPeersForIDSHandlesIfNeeded:v21];
      id v22 = (id)v34;
    }
    else
    {
      id v5 = v40;
      id v4 = v41;
    }
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __70__MSPSharedTripCapabilityFetchingServer_fetchCapabilitiesForContacts___block_invoke_95;
    v44[3] = &unk_1E617DCB0;
    id v45 = v22;
    id v46 = v42;
    id v36 = v42;
    v35 = v22;
    [(MSPSharedTripCapabilityFetchingServer *)self _performBlockOnAllQueues:v44];
  }
  else
  {
    v35 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v64 = "-[MSPSharedTripCapabilityFetchingServer fetchCapabilitiesForContacts:]";
      __int16 v65 = 2112;
      id v66 = v5;
      _os_log_impl(&dword_1B87E5000, v35, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }
    v24 = v5;
  }
}

id __70__MSPSharedTripCapabilityFetchingServer_fetchCapabilitiesForContacts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) _shouldPermitFetchingHandle:v3])
  {
    id v4 = v3;
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v3];
    id v4 = 0;
  }

  return v4;
}

uint64_t __70__MSPSharedTripCapabilityFetchingServer_fetchCapabilitiesForContacts___block_invoke_95(uint64_t a1, void *a2)
{
  return [a2 updateRequestedHandlesWithAdditions:*(void *)(a1 + 32) subtractions:*(void *)(a1 + 40)];
}

- (void)cancelFetchCapabilitiesForContacts:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  if (v5
    && [(MSPSharedTripCapabilityFetchingServer *)self _connectionCanControlSharing:v5])
  {

    id v6 = [(NSMapTable *)self->_peersByConnection objectForKey:v5];
    id v7 = [v6 removeRequestedHandles:v4];
    int v8 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138478083;
      uint64_t v13 = v4;
      __int16 v14 = 2113;
      id v15 = v7;
      _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_INFO, "Cancel fetch contacts: %{private}@\n\tRemoved: %{private}@", buf, 0x16u);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __76__MSPSharedTripCapabilityFetchingServer_cancelFetchCapabilitiesForContacts___block_invoke;
    v10[3] = &unk_1E617DC60;
    id v11 = v7;
    id v9 = v7;
    [(MSPSharedTripCapabilityFetchingServer *)self _performBlockOnAllQueues:v10];
  }
  else
  {
    id v9 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v13 = "-[MSPSharedTripCapabilityFetchingServer cancelFetchCapabilitiesForContacts:]";
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl(&dword_1B87E5000, v9, OS_LOG_TYPE_ERROR, "[Server] Will not %s, connection lacks entitlement: %@", buf, 0x16u);
    }
    id v6 = v5;
  }
}

uint64_t __76__MSPSharedTripCapabilityFetchingServer_cancelFetchCapabilitiesForContacts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateRequestedHandlesWithAdditions:0 subtractions:*(void *)(a1 + 32)];
}

- (void)_notifyPeersForIDSHandlesIfNeeded:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v46 = v4;
      _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_INFO, "Will notify for update of %{private}@", buf, 0xCu);
    }

    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v41 objects:v52 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v13 = [(MSPSharedTripCapabilityFetchingServer *)self _resolvedStatusForHandle:v12];
          if (v13) {
            [v6 setObject:v13 forKeyedSubscript:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v41 objects:v52 count:16];
      }
      while (v9);
    }

    if ([v6 count])
    {
      id v33 = v4;
      id v14 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      id v15 = [v6 allKeys];
      uint64_t v16 = [v14 initWithArray:v15];

      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      obuint64_t j = [(NSMapTable *)self->_peersByConnection keyEnumerator];
      uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
      if (v36)
      {
        uint64_t v35 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v38 != v35) {
              objc_enumerationMutation(obj);
            }
            uint64_t v18 = *(void **)(*((void *)&v37 + 1) + 8 * j);
            uint64_t v19 = [(NSMapTable *)self->_peersByConnection objectForKey:v18];
            id v20 = MSPGetSharedTripCapabilityFetchingLog();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138543362;
              id v46 = v19;
              _os_log_impl(&dword_1B87E5000, v20, OS_LOG_TYPE_INFO, "\tChecking peer %{public}@", buf, 0xCu);
            }

            double v21 = [v19 requestedHandles];
            id v22 = (void *)[v21 mutableCopy];

            if ([v22 count])
            {
              uint64_t v23 = v16;
              [v22 intersectSet:v16];
              v24 = [v22 array];
              uint64_t v25 = [v6 dictionaryWithValuesForKeys:v24];

              uint64_t v26 = [v25 count];
              uint64_t v27 = MSPGetSharedTripCapabilityFetchingLog();
              BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_INFO);
              if (v26)
              {
                if (v28)
                {
                  uint64_t v29 = [v6 count];
                  *(_DWORD *)buf = 138543875;
                  id v46 = v19;
                  __int16 v47 = 2048;
                  uint64_t v48 = v29;
                  __int16 v49 = 2113;
                  long long v50 = v6;
                  _os_log_impl(&dword_1B87E5000, v27, OS_LOG_TYPE_INFO, "\t- notifying peer %{public}@ of %lu resolved statuses: %{private}@", buf, 0x20u);
                }

                id v30 = [v25 allKeys];
                id v31 = (id)[v19 removeRequestedHandles:v30];

                uint64_t v27 = [v18 remoteObjectProxyWithErrorHandler:&__block_literal_global_10];
                id v32 = [v25 copy];
                [v27 capabilityLevelsDidUpdate:v32];
              }
              else if (v28)
              {
                *(_DWORD *)buf = 138477827;
                id v46 = v19;
                _os_log_impl(&dword_1B87E5000, v27, OS_LOG_TYPE_INFO, "\t- Skipping %{private}@, none of the peer-requested handles have both statues yet", buf, 0xCu);
              }
              uint64_t v16 = v23;
            }
            else
            {
              uint64_t v25 = MSPGetSharedTripCapabilityFetchingLog();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138477827;
                id v46 = v19;
                _os_log_impl(&dword_1B87E5000, v25, OS_LOG_TYPE_INFO, "\t- Skipping %{private}@, no requested handles", buf, 0xCu);
              }
            }
          }
          uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v51 count:16];
        }
        while (v36);
      }

      id v4 = v33;
    }
    else
    {
      uint64_t v16 = MSPGetSharedTripCapabilityFetchingLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "\tSkipping all peer notifications, no handles have all services checked", buf, 2u);
      }
    }
  }
}

void __75__MSPSharedTripCapabilityFetchingServer__notifyPeersForIDSHandlesIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138543362;
    id v5 = v2;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_ERROR, "error calling to remote object: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)_resolvedStatusForHandle:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MSPSharedTripCapabilityFetchingQueue *)self->_mapsStatusFetchQueue inflightHandles];
  if ([v5 containsObject:v4])
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = [(NSMutableDictionary *)self->_identifierToMapsStatus objectForKeyedSubscript:v4];
  }

  id v7 = [(MSPSharedTripCapabilityFetchingQueue *)self->_messagesStatusFetchQueue inflightHandles];
  if ([v7 containsObject:v4])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_identifierToMessagesStatus objectForKeyedSubscript:v4];
  }

  uint64_t v9 = [(MSPSharedTripCapabilityFetchingQueue *)self->_textMessageStatusFetchQueue inflightHandles];
  if ([v9 containsObject:v4])
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = [(NSMutableDictionary *)self->_identifierToTextMessageStatus objectForKeyedSubscript:v4];
  }

  if (v6 && v8 && v10)
  {
    if ([v6 status] == 1 || objc_msgSend(v6, "isBlocked"))
    {
      id v11 = v6;
    }
    else if ([v8 status] == 1)
    {
      id v11 = v8;
    }
    else if ([v10 status] == 1)
    {
      id v11 = v10;
    }
    else
    {
      id v11 = [[MSPSharedTripFetchedCapabilityStatus alloc] initWithCapabilityType:1 serviceName:0 status:2];
    }
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v13 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 138477827;
      id v16 = v4;
      _os_log_impl(&dword_1B87E5000, v13, OS_LOG_TYPE_INFO, "\tSkipping %{private}@, we haven't fetched both services yet", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v12 = 0;
  }

  return v12;
}

- (void)_purgeExpiredStatuses
{
}

void __62__MSPSharedTripCapabilityFetchingServer__purgeExpiredStatuses__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)[v4 copy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__MSPSharedTripCapabilityFetchingServer__purgeExpiredStatuses__block_invoke_2;
  v9[3] = &unk_1E617DD18;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 enumerateKeysAndObjectsUsingBlock:v9];
}

void __62__MSPSharedTripCapabilityFetchingServer__purgeExpiredStatuses__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 isExpired])
  {
    uint64_t v6 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543619;
      uint64_t v9 = v7;
      __int16 v10 = 2113;
      id v11 = v5;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "%{public}@: purging expired status for handle %{private}@", (uint8_t *)&v8, 0x16u);
    }

    [*(id *)(a1 + 40) removeObjectForKey:v5];
  }
}

- (void)_performBlockOnAllQueues:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = *(_OWORD *)&self->_mapsStatusFetchQueue;
  textMessageStatusFetchQueue = self->_textMessageStatusFetchQueue;
  id v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v14, 3, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)_performBlockOnAllCachedStatus:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = *(_OWORD *)&self->_identifierToMapsStatus;
  v10[0] = @"Maps";
  v10[1] = @"iMessage";
  long long v11 = v5;
  v10[2] = @"Text Message";
  identifierToTextMessageStatus = self->_identifierToTextMessageStatus;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:v10 count:3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__MSPSharedTripCapabilityFetchingServer__performBlockOnAllCachedStatus___block_invoke;
  v8[3] = &unk_1E617DD40;
  id v9 = v4;
  id v7 = v4;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];
}

uint64_t __72__MSPSharedTripCapabilityFetchingServer__performBlockOnAllCachedStatus___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)capabilityFetchingQueue:(id)a3 didFetchStatusForHandles:(id)a4
{
  long long v11 = (MSPSharedTripMessagesCapabilityFetchingQueue *)a3;
  id v6 = a4;
  if ((MSPSharedTripMessagesCapabilityFetchingQueue *)self->_mapsStatusFetchQueue == v11)
  {
    uint64_t v7 = 32;
  }
  else if ((MSPSharedTripMessagesCapabilityFetchingQueue *)self->_messagesStatusFetchQueue == v11)
  {
    uint64_t v7 = 40;
  }
  else
  {
    if (self->_textMessageStatusFetchQueue != v11) {
      goto LABEL_8;
    }
    uint64_t v7 = 48;
  }
  [*(id *)((char *)&self->super.isa + v7) addEntriesFromDictionary:v6];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = [v6 allKeys];
  long long v10 = [v8 setWithArray:v9];
  [(MSPSharedTripCapabilityFetchingServer *)self _notifyPeersForIDSHandlesIfNeeded:v10];

LABEL_8:
}

- (BOOL)_shouldPermitFetchingHandle:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [(NSMutableDictionary *)self->_identifierToMapsStatus objectForKeyedSubscript:v4];
  id v6 = v5;
  if (!v5)
  {
    if (+[MSPSharedTripContact isHandleBlocked:v4]) {
      goto LABEL_9;
    }
LABEL_14:
    BOOL v12 = 1;
    goto LABEL_15;
  }
  if ([v5 isBlocked] && (objc_msgSend(v6, "isExpired") & 1) == 0)
  {
    long long v11 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v17 = v4;
      _os_log_impl(&dword_1B87E5000, v11, OS_LOG_TYPE_INFO, "- %{private}@ already recorded as blocked, not expired", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (!+[MSPSharedTripContact isHandleBlocked:v4]) {
    goto LABEL_14;
  }
  if ([v6 isBlocked])
  {
    uint64_t v7 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v17 = v4;
      uint64_t v8 = "- %{private}@ was recorded blocked, record expired, but handle still blocked, will update record";
LABEL_11:
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, v8, buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v7 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    id v17 = v4;
    uint64_t v8 = "- %{private}@ is blocked, will record";
    goto LABEL_11;
  }
LABEL_12:

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__MSPSharedTripCapabilityFetchingServer__shouldPermitFetchingHandle___block_invoke;
  v14[3] = &unk_1E617DD68;
  id v9 = v4;
  int v15 = v9;
  [(MSPSharedTripCapabilityFetchingServer *)self _performBlockOnAllCachedStatus:v14];
  long long v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];
  [(MSPSharedTripCapabilityFetchingServer *)self _notifyPeersForIDSHandlesIfNeeded:v10];

  [(MSPSharedTripCapabilityFetchingServer *)self _startMonitoringSystemBlockListIfNeeded];
  long long v11 = v15;
LABEL_13:

  BOOL v12 = 0;
LABEL_15:

  return v12;
}

void __69__MSPSharedTripCapabilityFetchingServer__shouldPermitFetchingHandle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[MSPSharedTripFetchedCapabilityStatus alloc] initWithCapabilityType:1 serviceName:0 status:-2];
  [v3 setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)_startMonitoringSystemBlockListIfNeeded
{
  if (!self->_blockListMonitoringObserver)
  {
    id v3 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[Server] Will start monitoring system block list updates", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v5 = *MEMORY[0x1E4F59E40];
    id v6 = [MEMORY[0x1E4F28F08] mainQueue];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__MSPSharedTripCapabilityFetchingServer__startMonitoringSystemBlockListIfNeeded__block_invoke;
    v9[3] = &unk_1E617DD90;
    objc_copyWeak(&v10, buf);
    uint64_t v7 = [v4 addObserverForName:v5 object:0 queue:v6 usingBlock:v9];
    id blockListMonitoringObserver = self->_blockListMonitoringObserver;
    self->_id blockListMonitoringObserver = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
}

void __80__MSPSharedTripCapabilityFetchingServer__startMonitoringSystemBlockListIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _systemBlockListDidUpdate];
}

- (void)_stopMonitoringSystemBlockList
{
  if (self->_blockListMonitoringObserver)
  {
    id v3 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[Server] Will stop monitoring system block list updates", v7, 2u);
    }

    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self->_blockListMonitoringObserver];

    id blockListMonitoringObserver = self->_blockListMonitoringObserver;
    self->_id blockListMonitoringObserver = 0;

    [(GCDTimer *)self->_blockListCoalescingTimer invalidate];
    blockListCoalescingTimer = self->_blockListCoalescingTimer;
    self->_blockListCoalescingTimer = 0;
  }
}

- (void)_systemBlockListDidUpdate
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__MSPSharedTripCapabilityFetchingServer__systemBlockListDidUpdate__block_invoke;
  block[3] = &unk_1E617C770;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __66__MSPSharedTripCapabilityFetchingServer__systemBlockListDidUpdate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleCoalescedBlockListCheckIfNeeded];
}

- (void)_scheduleCoalescedBlockListCheckIfNeeded
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_blockListCoalescingTimer)
  {
    id v3 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = 0x3FF0000000000000;
      _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_DEFAULT, "[Server] System block list did update, scheduling coalescing check in %#.1lfs", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    workQueue = self->_workQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__MSPSharedTripCapabilityFetchingServer__scheduleCoalescedBlockListCheckIfNeeded__block_invoke;
    v7[3] = &unk_1E617C748;
    objc_copyWeak(&v8, (id *)buf);
    uint64_t v5 = +[GCDTimer scheduledTimerWithTimeInterval:workQueue queue:v7 block:1.0];
    blockListCoalescingTimer = self->_blockListCoalescingTimer;
    self->_blockListCoalescingTimer = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __81__MSPSharedTripCapabilityFetchingServer__scheduleCoalescedBlockListCheckIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkBlockList];
}

- (void)_checkBlockList
{
  blockListCoalescingTimer = self->_blockListCoalescingTimer;
  self->_blockListCoalescingTimer = 0;

  id v4 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEFAULT, "[Server] Checking existing blocked statuses for now-unblocked handles...", buf, 2u);
  }

  [(MSPSharedTripCapabilityFetchingServer *)self _verifyCurrentlyBlockedStatuses];
  uint64_t v5 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEFAULT, "[Server] Checking blocklist to see if any cached statuses are now blocked...", v6, 2u);
  }

  [(MSPSharedTripCapabilityFetchingServer *)self _verifyCurrentlyUnblockedStatuses];
}

- (void)_verifyCurrentlyBlockedStatuses
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  id v3 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_INFO, "Will verify existing blocked handles are still blocked", v4, 2u);
  }

  [(MSPSharedTripCapabilityFetchingServer *)self _performBlockOnAllCachedStatus:&__block_literal_global_107];
}

void __72__MSPSharedTripCapabilityFetchingServer__verifyCurrentlyBlockedStatuses__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)[v2 copy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72__MSPSharedTripCapabilityFetchingServer__verifyCurrentlyBlockedStatuses__block_invoke_2;
  v5[3] = &unk_1E617DDB8;
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __72__MSPSharedTripCapabilityFetchingServer__verifyCurrentlyBlockedStatuses__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if ([a3 isBlocked]
    && !+[MSPSharedTripContact isHandleBlocked:v5])
  {
    id v6 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138477827;
      id v8 = v5;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "- %{private}@ is no longer blocked", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) removeObjectForKey:v5];
  }
}

- (void)_verifyCurrentlyUnblockedStatuses
{
}

void __74__MSPSharedTripCapabilityFetchingServer__verifyCurrentlyUnblockedStatuses__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)[v2 copy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__MSPSharedTripCapabilityFetchingServer__verifyCurrentlyUnblockedStatuses__block_invoke_2;
  v5[3] = &unk_1E617DDB8;
  id v6 = v2;
  id v4 = v2;
  [v3 enumerateKeysAndObjectsUsingBlock:v5];
}

void __74__MSPSharedTripCapabilityFetchingServer__verifyCurrentlyUnblockedStatuses__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (([a3 isBlocked] & 1) == 0
    && +[MSPSharedTripContact isHandleBlocked:v5])
  {
    id v6 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138477827;
      id v9 = v5;
      _os_log_impl(&dword_1B87E5000, v6, OS_LOG_TYPE_INFO, "- %{private}@ is now blocked", (uint8_t *)&v8, 0xCu);
    }

    int v7 = [[MSPSharedTripFetchedCapabilityStatus alloc] initWithCapabilityType:1 serviceName:0 status:-2];
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purgeTimer, 0);
  objc_storeStrong((id *)&self->_blockListCoalescingTimer, 0);
  objc_storeStrong(&self->_blockListMonitoringObserver, 0);
  objc_storeStrong((id *)&self->_textMessageStatusFetchQueue, 0);
  objc_storeStrong((id *)&self->_messagesStatusFetchQueue, 0);
  objc_storeStrong((id *)&self->_mapsStatusFetchQueue, 0);
  objc_storeStrong((id *)&self->_messagesBatchController, 0);
  objc_storeStrong((id *)&self->_identifierToTextMessageStatus, 0);
  objc_storeStrong((id *)&self->_identifierToMessagesStatus, 0);
  objc_storeStrong((id *)&self->_identifierToMapsStatus, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_peersByConnection, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

@end