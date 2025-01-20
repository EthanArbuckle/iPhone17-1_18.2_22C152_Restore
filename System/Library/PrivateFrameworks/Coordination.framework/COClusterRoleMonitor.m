@interface COClusterRoleMonitor
- (COClusterRoleMonitor)initWithCluster:(id)a3;
- (COClusterRoleMonitor)initWithConnectionProvider:(id)a3 cluster:(id)a4;
- (COClusterRoleMonitorConnectionProvider)provider;
- (NSArray)memberObservers;
- (NSArray)roleObservers;
- (NSArray)snapshotObservers;
- (NSXPCConnection)lastConnection;
- (id)_remoteInterfaceWithErrorHandler:(id)a3;
- (id)_serviceConnection;
- (id)addObserverForMember:(id)a3 toDispatchQueue:(id)a4 block:(id)a5;
- (id)addObserverForRole:(id)a3 toDispatchQueue:(id)a4 block:(id)a5;
- (id)addObserverForSnapshotsToDispatchQueue:(id)a3 block:(id)a4;
- (id)cluster;
- (void)_lostConnectionToService;
- (void)_registerMemberObserver:(id)a3;
- (void)_registerRoleObserver:(id)a3;
- (void)_registerSnapshotObserver;
- (void)_unregisterMemberObserver:(id)a3;
- (void)_unregisterRoleObserver:(id)a3;
- (void)_unregisterSnapshotObserver;
- (void)_withLock:(id)a3;
- (void)dealloc;
- (void)membersWithRole:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5;
- (void)removeObserverForMember:(id)a3;
- (void)removeObserverForRole:(id)a3;
- (void)removeObserverForSnapshots:(id)a3;
- (void)roleOfMember:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5;
- (void)setLastConnection:(id)a3;
- (void)setMemberObservers:(id)a3;
- (void)setRoleObservers:(id)a3;
- (void)setSnapshotObservers:(id)a3;
- (void)snapshotOfCluster:(id)a3 didChangeTo:(id)a4;
@end

@implementation COClusterRoleMonitor

- (COClusterRoleMonitor)initWithConnectionProvider:(id)a3 cluster:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)COClusterRoleMonitor;
  v9 = [(COClusterRoleMonitor *)&v24 init];
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_provider, a3);
    uint64_t v11 = [v8 copy];
    id cluster = v10->_cluster;
    v10->_id cluster = (id)v11;

    uint64_t v13 = [MEMORY[0x263EFF8C0] array];
    memberObservers = v10->_memberObservers;
    v10->_memberObservers = (NSArray *)v13;

    uint64_t v15 = [MEMORY[0x263EFF8C0] array];
    roleObservers = v10->_roleObservers;
    v10->_roleObservers = (NSArray *)v15;

    uint64_t v17 = [MEMORY[0x263EFF8C0] array];
    snapshotObservers = v10->_snapshotObservers;
    v10->_snapshotObservers = (NSArray *)v17;

    v19 = COLogForCategory(2);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      id v21 = v10->_cluster;
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 134218498;
      v26 = v10;
      __int16 v27 = 2112;
      id v28 = v21;
      __int16 v29 = 2112;
      v30 = v23;
      _os_log_debug_impl(&dword_21D3E0000, v19, OS_LOG_TYPE_DEBUG, "%p role monitor created for Cluster(%@) with %@ provider", buf, 0x20u);
    }
  }

  return v10;
}

- (COClusterRoleMonitor)initWithCluster:(id)a3
{
  v4 = +[COCluster _clusterForCluster:a3];
  v5 = objc_alloc_init(_COClusterRoleMonitorConnectionProvider);
  v6 = [(COClusterRoleMonitor *)self initWithConnectionProvider:v5 cluster:v4];

  return v6;
}

- (void)dealloc
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __31__COClusterRoleMonitor_dealloc__block_invoke;
  v4[3] = &unk_2644445A8;
  v4[4] = self;
  [(COClusterRoleMonitor *)self _withLock:v4];
  v3.receiver = self;
  v3.super_class = (Class)COClusterRoleMonitor;
  [(COClusterRoleMonitor *)&v3 dealloc];
}

void __31__COClusterRoleMonitor_dealloc__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) lastConnection];
  v1 = objc_msgSend(v3, "co_originalInterruptionHandler");
  [v3 setInterruptionHandler:v1];

  v2 = objc_msgSend(v3, "co_originalInvalidationHandler");
  [v3 setInvalidationHandler:v2];

  [v3 invalidate];
}

- (id)addObserverForMember:(id)a3 toDispatchQueue:(id)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [_COClusterRoleMonitorMemberObserver alloc];
  v12 = [(COClusterRoleMonitor *)self cluster];
  uint64_t v13 = [(_COClusterRoleMonitorMemberObserver *)v11 initWithMember:v10 inCluster:v12 queue:v9 block:v8];

  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __67__COClusterRoleMonitor_addObserverForMember_toDispatchQueue_block___block_invoke;
  id v21 = &unk_2644444E0;
  v22 = self;
  v14 = v13;
  v23 = v14;
  [(COClusterRoleMonitor *)self _withLock:&v18];
  -[COClusterRoleMonitor _registerMemberObserver:](self, "_registerMemberObserver:", v10, v18, v19, v20, v21, v22);

  uint64_t v15 = v23;
  v16 = v14;

  return v16;
}

void __67__COClusterRoleMonitor_addObserverForMember_toDispatchQueue_block___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) memberObservers];
  id v3 = [v2 arrayByAddingObject:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setMemberObservers:v3];
}

- (void)removeObserverForMember:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__COClusterRoleMonitor_removeObserverForMember___block_invoke;
  v7[3] = &unk_264445750;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  id v9 = &v10;
  [(COClusterRoleMonitor *)self _withLock:v7];
  if (!v11[3])
  {
    v6 = [v5 member];
    [(COClusterRoleMonitor *)self _unregisterMemberObserver:v6];
  }
  _Block_object_dispose(&v10, 8);
}

void __48__COClusterRoleMonitor_removeObserverForMember___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) memberObservers];
  uint64_t v3 = [v2 indexOfObject:*(void *)(a1 + 40)];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = v3;
    id v5 = (void *)[v2 mutableCopy];
    [v5 removeObjectAtIndex:v4];
    [*(id *)(a1 + 32) setMemberObservers:v5];

    v2 = v5;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v2;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "member", (void)v15);
        uint64_t v13 = [v11 member];
        int v14 = [v12 isEqual:v13];

        if (v14) {
          ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (id)addObserverForRole:(id)a3 toDispatchQueue:(id)a4 block:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [_COClusterRoleMonitorRoleObserver alloc];
  uint64_t v12 = [(COClusterRoleMonitor *)self cluster];
  uint64_t v13 = [(_COClusterRoleMonitorRoleObserver *)v11 initWithRole:v10 inCluster:v12 queue:v9 block:v8];

  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __65__COClusterRoleMonitor_addObserverForRole_toDispatchQueue_block___block_invoke;
  id v21 = &unk_2644444E0;
  v22 = self;
  int v14 = v13;
  v23 = v14;
  [(COClusterRoleMonitor *)self _withLock:&v18];
  -[COClusterRoleMonitor _registerRoleObserver:](self, "_registerRoleObserver:", v10, v18, v19, v20, v21, v22);

  long long v15 = v23;
  long long v16 = v14;

  return v16;
}

void __65__COClusterRoleMonitor_addObserverForRole_toDispatchQueue_block___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) roleObservers];
  id v3 = [v2 arrayByAddingObject:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setRoleObservers:v3];
}

- (void)removeObserverForRole:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x2020000000;
    uint64_t v18 = 0;
    id v5 = [v4 role];
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    id v9 = __46__COClusterRoleMonitor_removeObserverForRole___block_invoke;
    id v10 = &unk_264444388;
    uint64_t v11 = self;
    id v12 = v4;
    id v6 = v5;
    id v13 = v6;
    int v14 = &v15;
    [(COClusterRoleMonitor *)self _withLock:&v7];
    if (!v16[3]) {
      -[COClusterRoleMonitor _unregisterRoleObserver:](self, "_unregisterRoleObserver:", v6, v7, v8, v9, v10, v11, v12);
    }

    _Block_object_dispose(&v15, 8);
  }
}

void __46__COClusterRoleMonitor_removeObserverForRole___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) roleObservers];
  uint64_t v3 = [v2 indexOfObject:*(void *)(a1 + 40)];
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v4 = v3;
    id v5 = (void *)[v2 mutableCopy];
    [v5 removeObjectAtIndex:v4];
    [*(id *)(a1 + 32) setRoleObservers:v5];

    v2 = v5;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v2;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(a1 + 48);
        id v12 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "role", (void)v13);
        LODWORD(v11) = [v11 isEqual:v12];

        if (v11) {
          ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (id)addObserverForSnapshotsToDispatchQueue:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [_COClusterRoleMonitorSnapshotObserver alloc];
  uint64_t v9 = [(COClusterRoleMonitor *)self cluster];
  id v10 = [(_COClusterRoleMonitorSnapshotObserver *)v8 initInCluster:v9 queue:v6 block:v7];

  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __69__COClusterRoleMonitor_addObserverForSnapshotsToDispatchQueue_block___block_invoke;
  v15[3] = &unk_264445750;
  v15[4] = self;
  id v11 = v10;
  id v16 = v11;
  uint64_t v17 = &v18;
  [(COClusterRoleMonitor *)self _withLock:v15];
  if (v19[3] == 1) {
    [(COClusterRoleMonitor *)self _registerSnapshotObserver];
  }
  id v12 = v16;
  id v13 = v11;

  _Block_object_dispose(&v18, 8);

  return v13;
}

void __69__COClusterRoleMonitor_addObserverForSnapshotsToDispatchQueue_block___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) snapshotObservers];
  id v3 = [v2 arrayByAddingObject:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) setSnapshotObservers:v3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 count];
}

- (void)removeObserverForSnapshots:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__COClusterRoleMonitor_removeObserverForSnapshots___block_invoke;
  v6[3] = &unk_264445750;
  v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  uint64_t v8 = &v9;
  [(COClusterRoleMonitor *)self _withLock:v6];
  if (!v10[3]) {
    [(COClusterRoleMonitor *)self _unregisterSnapshotObserver];
  }

  _Block_object_dispose(&v9, 8);
}

void __51__COClusterRoleMonitor_removeObserverForSnapshots___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) snapshotObservers];
  uint64_t v2 = [v6 indexOfObject:*(void *)(a1 + 40)];
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v3 = v6;
  }
  else
  {
    uint64_t v4 = v2;
    id v5 = (void *)[v6 mutableCopy];
    [v5 removeObjectAtIndex:v4];
    [*(id *)(a1 + 32) setSnapshotObservers:v5];

    id v3 = v5;
  }
  id v7 = v3;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 count];
}

- (void)roleOfMember:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = COLogForCategory(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    __int16 v27 = self;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_DEFAULT, "%p notified of Role(%@) change for Member(%@)", buf, 0x20u);
  }

  id v10 = [MEMORY[0x263EFF980] array];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __59__COClusterRoleMonitor_roleOfMember_inCluster_didChangeTo___block_invoke;
  v22[3] = &unk_2644448B0;
  v22[4] = self;
  id v11 = v7;
  id v23 = v11;
  id v12 = v10;
  id v24 = v12;
  [(COClusterRoleMonitor *)self _withLock:v22];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "notify:", v8, (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v15);
  }
}

void __59__COClusterRoleMonitor_roleOfMember_inCluster_didChangeTo___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "memberObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        uint64_t v9 = [v7 member];
        LODWORD(v8) = [v8 isEqual:v9];

        if (v8) {
          [*(id *)(a1 + 48) addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)membersWithRole:(id)a3 inCluster:(id)a4 didChangeTo:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = COLogForCategory(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    __int16 v27 = self;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl(&dword_21D3E0000, v9, OS_LOG_TYPE_DEFAULT, "%p notified of Member(%@) change for Role(%@)", buf, 0x20u);
  }

  long long v10 = [MEMORY[0x263EFF980] array];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __62__COClusterRoleMonitor_membersWithRole_inCluster_didChangeTo___block_invoke;
  v22[3] = &unk_2644448B0;
  v22[4] = self;
  id v11 = v7;
  id v23 = v11;
  id v12 = v10;
  id v24 = v12;
  [(COClusterRoleMonitor *)self _withLock:v22];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v12;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v17++), "notify:", v8, (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v15);
  }
}

void __62__COClusterRoleMonitor_membersWithRole_inCluster_didChangeTo___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "roleObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        uint64_t v9 = [v7 role];
        LODWORD(v8) = [v8 isEqual:v9];

        if (v8) {
          [*(id *)(a1 + 48) addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)snapshotOfCluster:(id)a3 didChangeTo:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v7 = a4;
  id v8 = COLogForCategory(2);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    *(_WORD *)&buf[22] = 2112;
    long long v20 = v6;
    _os_log_impl(&dword_21D3E0000, v8, OS_LOG_TYPE_DEFAULT, "%p notified of Snapshot(%@) change in Cluster(%@)", buf, 0x20u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v20 = __Block_byref_object_copy__10;
  long long v21 = __Block_byref_object_dispose__10;
  id v22 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__COClusterRoleMonitor_snapshotOfCluster_didChangeTo___block_invoke;
  v17[3] = &unk_264444468;
  v17[4] = self;
  v17[5] = buf;
  [(COClusterRoleMonitor *)self _withLock:v17];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = *(id *)(*(void *)&buf[8] + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "notify:", v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(buf, 8);
}

void __54__COClusterRoleMonitor_snapshotOfCluster_didChangeTo___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) snapshotObservers];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_serviceConnection
{
  uint64_t v3 = [(COClusterRoleMonitor *)self provider];
  uint64_t v4 = [v3 clusterRoleMonitorServiceConnection];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__COClusterRoleMonitor__serviceConnection__block_invoke;
  v8[3] = &unk_2644444E0;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = self;
  [(COClusterRoleMonitor *)self _withLock:v8];
  id v6 = v5;

  return v6;
}

void __42__COClusterRoleMonitor__serviceConnection__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) lastConnection];
  LOBYTE(v2) = [v2 isEqual:v3];

  if ((v2 & 1) == 0)
  {
    uint64_t v4 = (void *)MEMORY[0x263F08D80];
    id v5 = &unk_26CDD6B38;
    id v6 = [v4 interfaceWithProtocol:v5];
    id v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    __int16 v30 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:");
    id v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    id v29 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:");
    uint64_t v11 = +[COCluster _allowedClusterClasses];
    [v6 setClasses:v11 forSelector:sel_roleOfMember_inCluster_didChangeTo_ argumentIndex:1 ofReply:0];

    uint64_t v12 = +[COCluster _allowedClusterClasses];
    [v6 setClasses:v12 forSelector:sel_membersWithRole_inCluster_didChangeTo_ argumentIndex:1 ofReply:0];

    long long v13 = +[COCluster _allowedClusterClasses];
    [v6 setClasses:v13 forSelector:sel_snapshotOfCluster_didChangeTo_ argumentIndex:0 ofReply:0];

    long long v14 = [[COClusterRoleMonitorClientInterfaceMediator alloc] initWithClusterRoleMonitor:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setExportedInterface:v6];
    [*(id *)(a1 + 32) setExportedObject:v14];
    long long v15 = &unk_26CDD9BB8;

    long long v16 = [MEMORY[0x263F08D80] interfaceWithProtocol:v15];

    uint64_t v17 = +[COCluster _allowedClusterClasses];
    [v16 setClasses:v17 forSelector:sel_registerForRoleChangesOfMember_inCluster_ argumentIndex:1 ofReply:0];

    long long v18 = +[COCluster _allowedClusterClasses];
    [v16 setClasses:v18 forSelector:sel_unregisterForRoleChangesOfMember_inCluster_ argumentIndex:1 ofReply:0];

    long long v19 = +[COCluster _allowedClusterClasses];
    [v16 setClasses:v19 forSelector:sel_registerForMemberChangesWithRole_inCluster_ argumentIndex:1 ofReply:0];

    long long v20 = +[COCluster _allowedClusterClasses];
    [v16 setClasses:v20 forSelector:sel_unregisterForMemberChangesWithRole_inCluster_ argumentIndex:1 ofReply:0];

    long long v21 = +[COCluster _allowedClusterClasses];
    [v16 setClasses:v21 forSelector:sel_registerForSnapshotChangesInCluster_ argumentIndex:0 ofReply:0];

    id v22 = +[COCluster _allowedClusterClasses];
    [v16 setClasses:v22 forSelector:sel_unregisterForSnapshotChangesInCluster_ argumentIndex:0 ofReply:0];

    [*(id *)(a1 + 32) setRemoteObjectInterface:v16];
    objc_initWeak(location, *(id *)(a1 + 40));
    uint64_t v23 = [*(id *)(a1 + 32) interruptionHandler];
    id v24 = [*(id *)(a1 + 32) invalidationHandler];
    objc_msgSend(*(id *)(a1 + 32), "co_setOriginalInterruptionHandler:", v23);
    objc_msgSend(*(id *)(a1 + 32), "co_setOriginalInvalidationHandler:", v24);
    v25 = *(void **)(a1 + 32);
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __42__COClusterRoleMonitor__serviceConnection__block_invoke_2;
    v34[3] = &unk_264444A18;
    id v26 = v23;
    id v35 = v26;
    objc_copyWeak(&v36, location);
    [v25 setInterruptionHandler:v34];
    __int16 v27 = *(void **)(a1 + 32);
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __42__COClusterRoleMonitor__serviceConnection__block_invoke_93;
    v31[3] = &unk_264444A18;
    id v28 = v24;
    id v32 = v28;
    objc_copyWeak(&v33, location);
    [v27 setInvalidationHandler:v31];
    [*(id *)(a1 + 40) setLastConnection:*(void *)(a1 + 32)];
    [*(id *)(a1 + 32) resume];
    objc_destroyWeak(&v33);

    objc_destroyWeak(&v36);
    objc_destroyWeak(location);
  }
}

void __42__COClusterRoleMonitor__serviceConnection__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = COLogForCategory(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__COClusterRoleMonitor__serviceConnection__block_invoke_2_cold_1((uint64_t)WeakRetained, v4);
    }

    [WeakRetained _lostConnectionToService];
  }
}

void __42__COClusterRoleMonitor__serviceConnection__block_invoke_93(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = COLogForCategory(2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      id v6 = WeakRetained;
      _os_log_impl(&dword_21D3E0000, v4, OS_LOG_TYPE_DEFAULT, "%p connection to Role service invalidated", (uint8_t *)&v5, 0xCu);
    }

    [WeakRetained _lostConnectionToService];
  }
}

- (id)_remoteInterfaceWithErrorHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(COClusterRoleMonitor *)self _serviceConnection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:v4];

  return v6;
}

- (void)_lostConnectionToService
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  id v4 = [MEMORY[0x263EFF9C0] set];
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __48__COClusterRoleMonitor__lostConnectionToService__block_invoke;
  v24[3] = &unk_264444388;
  v24[4] = self;
  id v5 = v3;
  id v25 = v5;
  id v6 = v4;
  id v26 = v6;
  __int16 v27 = &v28;
  [(COClusterRoleMonitor *)self _withLock:v24];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v35 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v7);
        }
        [(COClusterRoleMonitor *)self _registerMemberObserver:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v35 count:16];
    }
    while (v8);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        -[COClusterRoleMonitor _registerRoleObserver:](self, "_registerRoleObserver:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v34 count:16];
    }
    while (v12);
  }

  if (*((unsigned char *)v29 + 24)) {
    [(COClusterRoleMonitor *)self _registerSnapshotObserver];
  }
  long long v15 = COLogForCategory(2);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v33 = self;
    _os_log_impl(&dword_21D3E0000, v15, OS_LOG_TYPE_DEFAULT, "%p done restoring state after lost connection to service", buf, 0xCu);
  }

  _Block_object_dispose(&v28, 8);
}

void __48__COClusterRoleMonitor__lostConnectionToService__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) memberObservers];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(a1 + 40);
        uint64_t v8 = [*(id *)(*((void *)&v21 + 1) + 8 * v6) member];
        [v7 addObject:v8];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "roleObservers", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(a1 + 48);
        long long v15 = [*(id *)(*((void *)&v17 + 1) + 8 * v13) role];
        [v14 addObject:v15];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v11);
  }

  long long v16 = [*(id *)(a1 + 32) snapshotObservers];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v16 count] != 0;
}

- (void)_registerMemberObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__COClusterRoleMonitor__registerMemberObserver___block_invoke;
  v9[3] = &unk_264445350;
  objc_copyWeak(&v11, &location);
  id v5 = v4;
  id v10 = v5;
  uint64_t v6 = [(COClusterRoleMonitor *)self _remoteInterfaceWithErrorHandler:v9];
  id v7 = COLogForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    long long v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%p registering observer for Member(%@)", buf, 0x16u);
  }

  uint64_t v8 = [(COClusterRoleMonitor *)self cluster];
  [v6 registerForRoleChangesOfMember:v5 inCluster:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __48__COClusterRoleMonitor__registerMemberObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134218498;
      id v8 = WeakRetained;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_ERROR, "%p failed to register observer for Member(%@): %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)_unregisterMemberObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __50__COClusterRoleMonitor__unregisterMemberObserver___block_invoke;
  v9[3] = &unk_264445350;
  objc_copyWeak(&v11, &location);
  id v5 = v4;
  id v10 = v5;
  uint64_t v6 = [(COClusterRoleMonitor *)self _remoteInterfaceWithErrorHandler:v9];
  int v7 = COLogForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    long long v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%p unregistering observer for Member(%@)", buf, 0x16u);
  }

  id v8 = [(COClusterRoleMonitor *)self cluster];
  [v6 unregisterForRoleChangesOfMember:v5 inCluster:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__COClusterRoleMonitor__unregisterMemberObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134218498;
      id v8 = WeakRetained;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_ERROR, "%p failed to unregister observer for Member(%@): %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)_registerRoleObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__COClusterRoleMonitor__registerRoleObserver___block_invoke;
  v9[3] = &unk_264445350;
  objc_copyWeak(&v11, &location);
  id v5 = v4;
  id v10 = v5;
  uint64_t v6 = [(COClusterRoleMonitor *)self _remoteInterfaceWithErrorHandler:v9];
  int v7 = COLogForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    long long v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%p registering observer for Role(%@)", buf, 0x16u);
  }

  id v8 = [(COClusterRoleMonitor *)self cluster];
  [v6 registerForMemberChangesWithRole:v5 inCluster:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __46__COClusterRoleMonitor__registerRoleObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134218498;
      id v8 = WeakRetained;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_ERROR, "%p failed to register observer for Role(%@): %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)_unregisterRoleObserver:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __48__COClusterRoleMonitor__unregisterRoleObserver___block_invoke;
  v9[3] = &unk_264445350;
  objc_copyWeak(&v11, &location);
  id v5 = v4;
  id v10 = v5;
  uint64_t v6 = [(COClusterRoleMonitor *)self _remoteInterfaceWithErrorHandler:v9];
  int v7 = COLogForCategory(2);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    long long v14 = self;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_21D3E0000, v7, OS_LOG_TYPE_DEFAULT, "%p unregistering observer for Role(%@)", buf, 0x16u);
  }

  id v8 = [(COClusterRoleMonitor *)self cluster];
  [v6 unregisterForMemberChangesWithRole:v5 inCluster:v8];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __48__COClusterRoleMonitor__unregisterRoleObserver___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = COLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134218498;
      id v8 = WeakRetained;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_error_impl(&dword_21D3E0000, v5, OS_LOG_TYPE_ERROR, "%p failed to unregister observer for Role(%@): %@", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)_registerSnapshotObserver
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __49__COClusterRoleMonitor__registerSnapshotObserver__block_invoke;
  __int16 v9 = &unk_264444888;
  objc_copyWeak(&v10, &location);
  id v3 = [(COClusterRoleMonitor *)self _remoteInterfaceWithErrorHandler:&v6];
  id v4 = COLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = self;
    _os_log_impl(&dword_21D3E0000, v4, OS_LOG_TYPE_DEFAULT, "%p registering Snapshot observer", buf, 0xCu);
  }

  id v5 = [(COClusterRoleMonitor *)self cluster];
  [v3 registerForSnapshotChangesInCluster:v5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __49__COClusterRoleMonitor__registerSnapshotObserver__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = COLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __49__COClusterRoleMonitor__registerSnapshotObserver__block_invoke_cold_1();
    }
  }
}

- (void)_unregisterSnapshotObserver
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __51__COClusterRoleMonitor__unregisterSnapshotObserver__block_invoke;
  __int16 v9 = &unk_264444888;
  objc_copyWeak(&v10, &location);
  id v3 = [(COClusterRoleMonitor *)self _remoteInterfaceWithErrorHandler:&v6];
  id v4 = COLogForCategory(2);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = self;
    _os_log_impl(&dword_21D3E0000, v4, OS_LOG_TYPE_DEFAULT, "%p unregistering Snapshot observer", buf, 0xCu);
  }

  id v5 = [(COClusterRoleMonitor *)self cluster];
  [v3 unregisterForSnapshotChangesInCluster:v5];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __51__COClusterRoleMonitor__unregisterSnapshotObserver__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = COLogForCategory(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __51__COClusterRoleMonitor__unregisterSnapshotObserver__block_invoke_cold_1();
    }
  }
}

- (void)_withLock:(id)a3
{
  p_lock = &self->_lock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_lock);
  v4[2](v4);

  os_unfair_lock_unlock(p_lock);
}

- (id)cluster
{
  return self->_cluster;
}

- (NSXPCConnection)lastConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setLastConnection:(id)a3
{
}

- (COClusterRoleMonitorConnectionProvider)provider
{
  return self->_provider;
}

- (NSArray)memberObservers
{
  return self->_memberObservers;
}

- (void)setMemberObservers:(id)a3
{
}

- (NSArray)roleObservers
{
  return self->_roleObservers;
}

- (void)setRoleObservers:(id)a3
{
}

- (NSArray)snapshotObservers
{
  return self->_snapshotObservers;
}

- (void)setSnapshotObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotObservers, 0);
  objc_storeStrong((id *)&self->_roleObservers, 0);
  objc_storeStrong((id *)&self->_memberObservers, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_destroyWeak((id *)&self->_lastConnection);

  objc_storeStrong(&self->_cluster, 0);
}

void __42__COClusterRoleMonitor__serviceConnection__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21D3E0000, a2, OS_LOG_TYPE_ERROR, "%p connection to Role service interrupted", (uint8_t *)&v2, 0xCu);
}

void __49__COClusterRoleMonitor__registerSnapshotObserver__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p failed to register Snapshot observer: %@");
}

void __51__COClusterRoleMonitor__unregisterSnapshotObserver__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_21D3E0000, v0, v1, "%p failed to unregister Snapshot observer: %@");
}

@end