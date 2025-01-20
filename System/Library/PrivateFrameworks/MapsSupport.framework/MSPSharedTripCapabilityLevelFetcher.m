@interface MSPSharedTripCapabilityLevelFetcher
+ (id)sharedFetcher;
- (MSPSharedTripCapabilityLevelFetcher)init;
- (id)_processResults:(id)a3;
- (id)serviceNameForContact:(id)a3;
- (unint64_t)capabilityLevelForContact:(id)a3;
- (void)_connectionInterrupted:(id)a3;
- (void)_connectionInvalidated:(id)a3;
- (void)_fetchQueuesDidUpdate;
- (void)_openConnectionIfNeeded;
- (void)cancelCapabilityLevelRequestForContact:(id)a3;
- (void)cancelCapabilityLevelRequestForContacts:(id)a3;
- (void)capabilityLevelsDidUpdate:(id)a3;
- (void)fetchCapabilityLevelForContact:(id)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6;
- (void)notifyObservers:(id)a3;
- (void)registerObserver:(id)a3;
- (void)requestCapabilityLevelsForContacts:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)verifyBlockedStatuses;
@end

@implementation MSPSharedTripCapabilityLevelFetcher

+ (id)sharedFetcher
{
  if (MSPSharedTripSharingAvailable())
  {
    if (qword_1EB7F4628 != -1) {
      dispatch_once(&qword_1EB7F4628, &__block_literal_global_14);
    }
    id v2 = (id)_MergedGlobals_46;
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

uint64_t __52__MSPSharedTripCapabilityLevelFetcher_sharedFetcher__block_invoke()
{
  _MergedGlobals_46 = objc_alloc_init(MSPSharedTripCapabilityLevelFetcher);

  return MEMORY[0x1F41817F8]();
}

- (MSPSharedTripCapabilityLevelFetcher)init
{
  v14.receiver = self;
  v14.super_class = (Class)MSPSharedTripCapabilityLevelFetcher;
  id v2 = [(MSPSharedTripCapabilityLevelFetcher *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F647B0]);
    uint64_t v4 = [v3 initWithProtocol:&unk_1F1212DE8 queue:MEMORY[0x1E4F14428]];
    observers = v2->_observers;
    v2->_observers = (GEOObserverHashTable *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    statusesByIdentifier = v2->_statusesByIdentifier;
    v2->_statusesByIdentifier = v6;

    v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    fetchQueue = v2->_fetchQueue;
    v2->_fetchQueue = v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.Maps.MSPSharedTripCapabilityLevelFetcher", v10);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v11;
  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "MSPSharedTripCapabilityLevelFetcher registerObserver %@", (uint8_t *)&v6, 0xCu);
  }

  [(GEOObserverHashTable *)self->_observers registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "MSPSharedTripCapabilityLevelFetcher unregisterObserver %@", (uint8_t *)&v6, 0xCu);
  }

  [(GEOObserverHashTable *)self->_observers unregisterObserver:v4];
}

- (void)notifyObservers:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134218243;
    uint64_t v7 = [v4 count];
    __int16 v8 = 2113;
    id v9 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_DEBUG, "MSPSharedTripCapabilityLevelFetcher notifyObservers for %lu updated handles: %{private}@", (uint8_t *)&v6, 0x16u);
  }

  [(GEOObserverHashTable *)self->_observers capabilityLevelFetcher:self didUpdateCapabilityLevelsForHandles:v4];
  [(GEOObserverHashTable *)self->_observers capabilityLevelsDidUpdate];
}

- (unint64_t)capabilityLevelForContact:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 handleForIDS];
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__3;
  v45 = __Block_byref_object_dispose__3;
  id v46 = 0;
  workQueue = self->_workQueue;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v36 = __65__MSPSharedTripCapabilityLevelFetcher_capabilityLevelForContact___block_invoke;
  v37 = &unk_1E617C798;
  v40 = &v41;
  v38 = self;
  uint64_t v7 = v5;
  v39 = v7;
  __int16 v8 = workQueue;
  id v9 = v35;
  label = dispatch_queue_get_label(v8);
  dispatch_queue_t v11 = dispatch_queue_get_label(0);
  if (label == v11 || label && v11 && !strcmp(label, v11))
  {
    v12 = (void *)MEMORY[0x1BA9C28D0]();
    v36(v9);
  }
  else
  {
    dispatch_sync(v8, v9);
  }

  v13 = [MEMORY[0x1E4F64860] sharedPlatform];
  if ([v13 isInternalInstall])
  {
    int IsValid = MSPSharedTripVirtualReceiverIsValid(v7);

    if (IsValid)
    {
      unint64_t CapabilityType = MSPSharedTripVirtualReceiverHandleGetCapabilityType(v7);
      v16 = MSPGetSharedTripCapabilityFetchingLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        if (CapabilityType > 4) {
          v17 = @"Unknown";
        }
        else {
          v17 = *(&off_1E617E098 + CapabilityType);
        }
        *(_DWORD *)buf = 138543618;
        v48 = v7;
        __int16 v49 = 2114;
        v50 = v17;
        _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "capabilityLevelForContact virtual receiver %{public}@ supports %{public}@", buf, 0x16u);
      }
      goto LABEL_30;
    }
  }
  else
  {
  }
  v18 = (void *)v42[5];
  if (!v18 || [v18 isExpired])
  {
    v16 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v19 = [v4 stringValue];
      v20 = (__CFString *)v42[5];
      *(_DWORD *)buf = 138412546;
      v48 = v19;
      __int16 v49 = 2114;
      v50 = v20;
      _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "capabilityLevelForContact cache miss for handle %@ (%{public}@)", buf, 0x16u);
    }
    unint64_t CapabilityType = 0;
    goto LABEL_30;
  }
  int v21 = [(id)v42[5] isBlocked];
  v16 = MSPGetSharedTripCapabilityFetchingLog();
  BOOL v22 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
  if (v21)
  {
    if (v22)
    {
      v23 = [v4 stringValue];
      *(_DWORD *)buf = 138412290;
      v48 = v23;
      _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "capabilityLevelForContact returning invalid for blocked handle %@", buf, 0xCu);
    }
LABEL_21:
    unint64_t CapabilityType = 1;
LABEL_30:

    goto LABEL_31;
  }
  if (v22)
  {
    v24 = [v4 stringValue];
    v25 = (__CFString *)v42[5];
    *(_DWORD *)buf = 138412546;
    v48 = v24;
    __int16 v49 = 2114;
    v50 = v25;
    _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "capabilityLevelForContact cache hit for handle %@ (%{public}@)", buf, 0x16u);
  }
  if ([(id)v42[5] status] != 1)
  {
    int v30 = [v4 isPhoneNumber];
    v16 = MSPGetSharedTripCapabilityFetchingLog();
    BOOL v31 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (v30)
    {
      if (v31)
      {
        v32 = [v4 stringValue];
        *(_DWORD *)buf = 138412290;
        v48 = v32;
        _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "capabilityLevelForContact returning cached SMS capability type for %@", buf, 0xCu);
      }
      unint64_t CapabilityType = 2;
      goto LABEL_30;
    }
    if (v31)
    {
      v33 = [v4 stringValue];
      *(_DWORD *)buf = 138412290;
      v48 = v33;
      _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "capabilityLevelForContact returning cached invalid capability type for %@", buf, 0xCu);
    }
    goto LABEL_21;
  }
  v26 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    unint64_t v27 = [(id)v42[5] capabilityType];
    if (v27 > 4) {
      v28 = @"Unknown";
    }
    else {
      v28 = *(&off_1E617E098 + v27);
    }
    v34 = [v4 stringValue];
    *(_DWORD *)buf = 138543618;
    v48 = v28;
    __int16 v49 = 2112;
    v50 = v34;
    _os_log_impl(&dword_1B87E5000, v26, OS_LOG_TYPE_INFO, "capabilityLevelForContact returning cached %{public}@ capability type for %@", buf, 0x16u);
  }
  unint64_t CapabilityType = [(id)v42[5] capabilityType];
LABEL_31:

  _Block_object_dispose(&v41, 8);
  return CapabilityType;
}

uint64_t __65__MSPSharedTripCapabilityLevelFetcher_capabilityLevelForContact___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (id)serviceNameForContact:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 handleForIDS];
  uint64_t v30 = 0;
  BOOL v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__3;
  v34 = __Block_byref_object_dispose__3;
  id v35 = 0;
  workQueue = self->_workQueue;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v25 = __61__MSPSharedTripCapabilityLevelFetcher_serviceNameForContact___block_invoke;
  v26 = &unk_1E617C798;
  v29 = &v30;
  unint64_t v27 = self;
  id v7 = v5;
  id v28 = v7;
  __int16 v8 = workQueue;
  id v9 = v24;
  label = dispatch_queue_get_label(v8);
  dispatch_queue_t v11 = dispatch_queue_get_label(0);
  if (label == v11 || label && v11 && !strcmp(label, v11))
  {
    v12 = (void *)MEMORY[0x1BA9C28D0]();
    v25(v9);
  }
  else
  {
    dispatch_sync(v8, v9);
  }

  v13 = [MEMORY[0x1E4F64860] sharedPlatform];
  if ([v13 isInternalInstall])
  {
    int IsValid = MSPSharedTripVirtualReceiverIsValid(v7);

    if (IsValid)
    {
      v15 = MSPSharedTripVirtualReceiverHandleGetServiceName(v7);
      v16 = MSPGetSharedTripCapabilityFetchingLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
        goto LABEL_23;
      }
      *(_DWORD *)buf = 138543618;
      id v37 = v7;
      __int16 v38 = 2114;
      v39 = v15;
      v17 = "serviceNameForContact virtual receiver %{public}@ is %{public}@";
      v18 = v16;
      uint32_t v19 = 22;
      goto LABEL_22;
    }
  }
  else
  {
  }
  v20 = (void *)v31[5];
  if (!v20 || [v20 isExpired])
  {
    v16 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v21 = [v4 stringValue];
      BOOL v22 = (void *)v31[5];
      *(_DWORD *)buf = 138412546;
      id v37 = v21;
      __int16 v38 = 2114;
      v39 = v22;
      _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "capabilityLevelForContact cache miss for handle %@ (%{public}@)", buf, 0x16u);
    }
LABEL_16:
    v15 = 0;
    goto LABEL_23;
  }
  if ([(id)v31[5] isBlocked])
  {
    v16 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v37 = v7;
      _os_log_impl(&dword_1B87E5000, v16, OS_LOG_TYPE_INFO, "capabilityLevelForContact nil service name for blocked %{private}@", buf, 0xCu);
    }
    goto LABEL_16;
  }
  v15 = [(id)v31[5] serviceName];
  v16 = MSPGetSharedTripCapabilityFetchingLog();
  if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
    goto LABEL_23;
  }
  *(_DWORD *)buf = 138543362;
  id v37 = v15;
  v17 = "capabilityLevelForContact returning cached service name %{public}@";
  v18 = v16;
  uint32_t v19 = 12;
LABEL_22:
  _os_log_impl(&dword_1B87E5000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
LABEL_23:

  _Block_object_dispose(&v30, 8);

  return v15;
}

uint64_t __61__MSPSharedTripCapabilityLevelFetcher_serviceNameForContact___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (id)_processResults:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(workQueue);
  int v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __55__MSPSharedTripCapabilityLevelFetcher__processResults___block_invoke;
  v13 = &unk_1E617DD18;
  objc_super v14 = self;
  id v15 = v6;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];

  __int16 v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13, v14);

  return v8;
}

void __55__MSPSharedTripCapabilityLevelFetcher__processResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  int v6 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v9];
  if (([v5 isEffectivelyEqualToStatus:v6] & 1) == 0)
  {
    id v7 = *(void **)(a1 + 40);
    __int16 v8 = (void *)IDSCopyRawAddressForDestination();
    [v7 addObject:v8];
  }
  if ([*(id *)(*(void *)(a1 + 32) + 24) containsObject:v9]) {
    [*(id *)(*(void *)(a1 + 32) + 24) removeObject:v9];
  }
  [*(id *)(*(void *)(a1 + 32) + 16) setObject:v5 forKeyedSubscript:v9];
}

- (void)_fetchQueuesDidUpdate
{
  [(MSPSharedTripCapabilityLevelFetcher *)self _openConnectionIfNeeded];
  id v4 = [(NSXPCConnection *)self->_connection remoteObjectProxy];
  id v3 = [(NSMutableOrderedSet *)self->_fetchQueue array];
  [v4 fetchCapabilitiesForContacts:v3];
}

- (void)capabilityLevelsDidUpdate:(id)a3
{
  id v4 = [(MSPSharedTripCapabilityLevelFetcher *)self _processResults:a3];
  if ([v4 count]) {
    [(MSPSharedTripCapabilityLevelFetcher *)self notifyObservers:v4];
  }
}

- (void)_openConnectionIfNeeded
{
  if (!self->_connection)
  {
    id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.Maps.xpc.SharedTrip.Capabilities" options:0];
    connection = self->_connection;
    self->_connection = v3;

    id v5 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1222CF0];
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v5];

    int v6 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1212AD8];
    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
    [v6 setClasses:v10 forSelector:sel_capabilityLevelsDidUpdate_ argumentIndex:0 ofReply:0];

    [(NSXPCConnection *)self->_connection setExportedInterface:v6];
    [(NSXPCConnection *)self->_connection setExportedObject:self];
    [(NSXPCConnection *)self->_connection _setQueue:self->_workQueue];
    objc_initWeak(&location, self);
    objc_initWeak(&from, self->_connection);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__MSPSharedTripCapabilityLevelFetcher__openConnectionIfNeeded__block_invoke;
    v14[3] = &unk_1E617C4C0;
    objc_copyWeak(&v15, &location);
    objc_copyWeak(&v16, &from);
    [(NSXPCConnection *)self->_connection setInvalidationHandler:v14];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__MSPSharedTripCapabilityLevelFetcher__openConnectionIfNeeded__block_invoke_2;
    v11[3] = &unk_1E617C4C0;
    objc_copyWeak(&v12, &location);
    objc_copyWeak(&v13, &from);
    [(NSXPCConnection *)self->_connection setInterruptionHandler:v11];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __62__MSPSharedTripCapabilityLevelFetcher__openConnectionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _connectionInvalidated:v2];
}

void __62__MSPSharedTripCapabilityLevelFetcher__openConnectionIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _connectionInterrupted:v2];
}

- (void)_connectionInvalidated:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = NSString;
  int v6 = [v4 _xpcConnection];
  id v7 = [v5 stringWithUTF8String:xpc_connection_copy_invalidation_reason()];

  uint64_t v8 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2114;
    id v13 = v7;
    _os_log_impl(&dword_1B87E5000, v8, OS_LOG_TYPE_INFO, "[Service] Connection invalidated: %@, reason: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  connection = self->_connection;
  self->_connection = 0;
}

- (void)_connectionInterrupted:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1B87E5000, v5, OS_LOG_TYPE_ERROR, "[Service] Connection invalidated: %@", (uint8_t *)&v7, 0xCu);
  }

  connection = self->_connection;
  self->_connection = 0;
}

- (void)requestCapabilityLevelsForContacts:(id)a3
{
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_not_V2(workQueue);
  int v6 = MapsMap(v5, &__block_literal_global_75);

  int v7 = self->_workQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__MSPSharedTripCapabilityLevelFetcher_requestCapabilityLevelsForContacts___block_invoke_2;
  v9[3] = &unk_1E617C510;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async(v7, v9);
}

uint64_t __74__MSPSharedTripCapabilityLevelFetcher_requestCapabilityLevelsForContacts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 handleForIDS];
}

uint64_t __74__MSPSharedTripCapabilityLevelFetcher_requestCapabilityLevelsForContacts___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1B87E5000, v2, OS_LOG_TYPE_DEBUG, "fetchCapabilityLevelForContacts enqueing destinations %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 40) + 24) addObjectsFromArray:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) _fetchQueuesDidUpdate];
}

- (void)cancelCapabilityLevelRequestForContacts:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__MSPSharedTripCapabilityLevelFetcher_cancelCapabilityLevelRequestForContacts___block_invoke;
  v7[3] = &unk_1E617C510;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __79__MSPSharedTripCapabilityLevelFetcher_cancelCapabilityLevelRequestForContacts___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = MapsMap(*(void **)(a1 + 32), &__block_literal_global_77_0);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v2];
  if ([*(id *)(*(void *)(a1 + 40) + 24) intersectsSet:v3])
  {
    [*(id *)(*(void *)(a1 + 40) + 24) minusSet:v3];
    id v4 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1B87E5000, v4, OS_LOG_TYPE_DEBUG, "capabilityLevelNoLongerNeededForContact did remove %@ across Maps/Messages queues", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 40) _fetchQueuesDidUpdate];
  }
}

uint64_t __79__MSPSharedTripCapabilityLevelFetcher_cancelCapabilityLevelRequestForContacts___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 handleForIDS];
}

- (void)cancelCapabilityLevelRequestForContact:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  workQueue = self->_workQueue;
  id v5 = a3;
  dispatch_assert_queue_not_V2(workQueue);
  v7[0] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  [(MSPSharedTripCapabilityLevelFetcher *)self cancelCapabilityLevelRequestForContacts:v6];
}

- (void)fetchCapabilityLevelForContact:(id)a3 timeout:(double)a4 queue:(id)a5 completion:(id)a6
{
  workQueue = self->_workQueue;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  dispatch_assert_queue_not_V2(workQueue);
  id v13 = [[_MSPSharedTripSingleCapabilityLevelFetcher alloc] initWithContact:v12 timeout:v11 queue:v10 completion:a4];

  [(_MSPSharedTripSingleCapabilityLevelFetcher *)v13 start];
}

- (void)verifyBlockedStatuses
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workQueue);
  uint64_t v3 = MSPGetSharedTripCapabilityFetchingLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B87E5000, v3, OS_LOG_TYPE_INFO, "Will verify existing blocked handles are still blocked", buf, 2u);
  }

  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  statusesByIdentifier = self->_statusesByIdentifier;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__MSPSharedTripCapabilityLevelFetcher_verifyBlockedStatuses__block_invoke;
  v9[3] = &unk_1E617DDB8;
  id v6 = v4;
  id v10 = v6;
  [(NSMutableDictionary *)statusesByIdentifier enumerateKeysAndObjectsUsingBlock:v9];
  if (v6)
  {
    uint64_t v7 = MSPGetSharedTripCapabilityFetchingLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v6 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v12 = v8;
      _os_log_impl(&dword_1B87E5000, v7, OS_LOG_TYPE_INFO, "- removing %lu blocked handles from statuses", buf, 0xCu);
    }
  }
  [(NSMutableDictionary *)self->_statusesByIdentifier removeObjectsForKeys:v6];
}

void __60__MSPSharedTripCapabilityLevelFetcher_verifyBlockedStatuses__block_invoke(uint64_t a1, void *a2, void *a3)
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

    [*(id *)(a1 + 32) addObject:v5];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_statusesByIdentifier, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end