@interface ANAnnounceReachabilityServiceListener
- (ANAnnounceReachabilityManager)reachabilityManager;
- (ANAnnounceReachabilityServiceListener)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableSet)connections;
- (NSXPCListener)listener;
- (void)_addConnection:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)_sendCurrentReachabilityToConnection:(id)a3;
- (void)announceReachabilityForHomeName:(id)a3 reply:(id)a4;
- (void)announceReachabilityForHomeUUID:(id)a3 reply:(id)a4;
- (void)announceReachabilityForRoomName:(id)a3 inHomeName:(id)a4 reply:(id)a5;
- (void)announceReachabilityForRoomUUID:(id)a3 inHomeUUID:(id)a4 reply:(id)a5;
- (void)cleanForExit;
- (void)reachabilityLevel:(unint64_t)a3 didChangeForHome:(id)a4;
- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoom:(id)a4 inHome:(id)a5;
- (void)resumeWithCompletionHandler:(id)a3;
- (void)setConnections:(id)a3;
- (void)setReachabilityManager:(id)a3;
@end

@implementation ANAnnounceReachabilityServiceListener

- (ANAnnounceReachabilityServiceListener)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)ANAnnounceReachabilityServiceListener;
  v2 = [(ANAnnounceReachabilityServiceListener *)&v10 init];
  if (v2)
  {
    if ([MEMORY[0x1E4F4A898] isAnnounceEnabled])
    {
      uint64_t v3 = objc_opt_new();
      connections = v2->_connections;
      v2->_connections = (NSMutableSet *)v3;
    }
    id v5 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v6 = [v5 initWithMachServiceName:*MEMORY[0x1E4F4A7B0]];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v6;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
    v8 = ANLogHandleAnnounceReachabilityServiceListener();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@Announce Reachability Service Listener Up!", buf, 0xCu);
    }
  }
  return v2;
}

- (void)cleanForExit
{
  id v2 = [(ANAnnounceReachabilityServiceListener *)self listener];
  [v2 invalidate];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = ANLogHandleAnnounceReachabilityServiceListener();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
    objc_super v10 = [v7 serviceName];
    *(_DWORD *)buf = 138412802;
    v32 = &stru_1F34A0E10;
    __int16 v33 = 2112;
    id v34 = v9;
    __int16 v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@New Connection Request From (PID = %@) For Service: (%@)", buf, 0x20u);
  }
  if (([MEMORY[0x1E4F4A898] isAnnounceEnabled] & 1) == 0)
  {
    v11 = ANLogHandleAnnounceReachabilityServiceListener();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v32 = &stru_1F34A0E10;
      v15 = "%@Rejecting connection. Announce not enabled.";
      v16 = v11;
      uint32_t v17 = 12;
LABEL_12:
      _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    }
LABEL_13:
    BOOL v14 = 0;
    goto LABEL_14;
  }
  if (([v7 hasAnnounceEntitlement] & 1) == 0)
  {
    v11 = ANLogHandleAnnounceReachabilityServiceListener();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)*MEMORY[0x1E4F4A968];
      *(_DWORD *)buf = 138412546;
      v32 = &stru_1F34A0E10;
      __int16 v33 = 2112;
      id v34 = v18;
      v15 = "%@Missing Announce Entitlement: %@";
      v16 = v11;
      uint32_t v17 = 22;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v11 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34AD808];
  [v7 setExportedInterface:v11];
  [v7 setExportedObject:self];
  v12 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34C5F70];
  [v7 setRemoteObjectInterface:v12];

  [(ANAnnounceReachabilityServiceListener *)self _addConnection:v7];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __76__ANAnnounceReachabilityServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  v26[3] = &unk_1E6BCDF18;
  objc_copyWeak(&v27, &from);
  objc_copyWeak(&v28, &location);
  [v7 setInterruptionHandler:v26];
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __76__ANAnnounceReachabilityServiceListener_listener_shouldAcceptNewConnection___block_invoke_71;
  v23 = &unk_1E6BCDF18;
  objc_copyWeak(&v24, &from);
  objc_copyWeak(&v25, &location);
  [v7 setInvalidationHandler:&v20];
  objc_msgSend(v7, "resume", v20, v21, v22, v23);
  uint64_t v13 = ANLogHandleAnnounceReachabilityServiceListener();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v32 = &stru_1F34A0E10;
    __int16 v33 = 2112;
    id v34 = v7;
    _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@Connection Accepted: (%@)", buf, 0x16u);
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  BOOL v14 = 1;
LABEL_14:

  return v14;
}

void __76__ANAnnounceReachabilityServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = ANLogHandleAnnounceReachabilityServiceListener();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v6 = 138412546;
    id v7 = &stru_1F34A0E10;
    __int16 v8 = 2112;
    id v9 = WeakRetained;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection Interrupted: (%@)", (uint8_t *)&v6, 0x16u);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 _removeConnection:v5];
}

void __76__ANAnnounceReachabilityServiceListener_listener_shouldAcceptNewConnection___block_invoke_71(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = ANLogHandleAnnounceReachabilityServiceListener();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v6 = 138412546;
    id v7 = &stru_1F34A0E10;
    __int16 v8 = 2112;
    id v9 = WeakRetained;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection Invalidated: (%@)", (uint8_t *)&v6, 0x16u);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 _removeConnection:v5];
}

- (void)resumeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [MEMORY[0x1E4F29268] currentConnection];
  int v6 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__ANAnnounceReachabilityServiceListener_resumeWithCompletionHandler___block_invoke;
  v9[3] = &unk_1E6BCE2B0;
  id v7 = v4;
  id v11 = v7;
  objc_copyWeak(&v12, &location);
  id v8 = v5;
  id v10 = v8;
  [v6 startWithCompletionHandler:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __69__ANAnnounceReachabilityServiceListener_resumeWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _sendCurrentReachabilityToConnection:*(void *)(a1 + 32)];
}

- (void)announceReachabilityForHomeName:(id)a3 reply:(id)a4
{
  id v10 = (void (**)(id, uint64_t))a4;
  id v6 = a3;
  id v7 = +[ANHomeManager shared];
  id v8 = [v7 homeWithName:v6];

  if (v8)
  {
    id v9 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];
    v10[2](v10, [v9 reachabilityForHome:v8]);
  }
  else
  {
    v10[2](v10, 0);
  }
}

- (void)announceReachabilityForRoomName:(id)a3 inHomeName:(id)a4 reply:(id)a5
{
  v15 = (void (**)(id, void))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[ANHomeManager shared];
  id v11 = [v10 homeWithName:v8];

  id v12 = objc_msgSend(v11, "hmu_roomWithName:", v9);

  if (v11) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    v15[2](v15, 0);
  }
  else
  {
    BOOL v14 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];
    v15[2](v15, [v14 reachabilityForRoom:v12 inHome:v11]);
  }
}

- (void)announceReachabilityForHomeUUID:(id)a3 reply:(id)a4
{
  id v10 = (void (**)(id, uint64_t))a4;
  id v6 = a3;
  id v7 = +[ANHomeManager shared];
  id v8 = [v7 homeForID:v6];

  if (v8)
  {
    id v9 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];
    v10[2](v10, [v9 reachabilityForHome:v8]);
  }
  else
  {
    v10[2](v10, 0);
  }
}

- (void)announceReachabilityForRoomUUID:(id)a3 inHomeUUID:(id)a4 reply:(id)a5
{
  v15 = (void (**)(id, void))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[ANHomeManager shared];
  id v11 = [v10 homeForID:v8];

  id v12 = objc_msgSend(v11, "hmu_roomWithUniqueIdentifier:", v9);

  if (v11) {
    BOOL v13 = v12 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    v15[2](v15, 0);
  }
  else
  {
    BOOL v14 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];
    v15[2](v15, [v14 reachabilityForRoom:v12 inHome:v11]);
  }
}

- (void)_addConnection:(id)a3
{
  id v9 = a3;
  id v4 = [(ANAnnounceReachabilityServiceListener *)self connections];
  objc_sync_enter(v4);
  id v5 = [(ANAnnounceReachabilityServiceListener *)self connections];
  [v5 addObject:v9];

  id v6 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];

  if (!v6)
  {
    id v7 = objc_opt_new();
    [(ANAnnounceReachabilityServiceListener *)self setReachabilityManager:v7];

    id v8 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];
    [v8 setDelegate:self];
  }
  objc_sync_exit(v4);
}

- (void)_removeConnection:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ANAnnounceReachabilityServiceListener *)self connections];
  objc_sync_enter(v5);
  id v6 = [(ANAnnounceReachabilityServiceListener *)self connections];
  [v6 removeObject:v4];

  id v7 = ANLogHandleAnnounceReachabilityServiceListener();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    BOOL v14 = &stru_1F34A0E10;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "%@Removed Connection: (%@)", (uint8_t *)&v13, 0x16u);
  }

  id v8 = [(ANAnnounceReachabilityServiceListener *)self connections];
  BOOL v9 = [v8 count] == 0;

  if (v9)
  {
    id v10 = ANLogHandleAnnounceReachabilityServiceListener();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      BOOL v14 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%@All Reachability Connections Removed. Stopping Reachability Manager.", (uint8_t *)&v13, 0xCu);
    }

    id v11 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];
    [v11 stop];

    id v12 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];
    [v12 setDelegate:0];

    [(ANAnnounceReachabilityServiceListener *)self setReachabilityManager:0];
  }
  objc_sync_exit(v5);
}

- (void)_sendCurrentReachabilityToConnection:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v4 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];
  id v5 = [v4 monitoredHomes];

  v41 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = v5;
  uint64_t v42 = [obj countByEnumeratingWithState:&v51 objects:v66 count:16];
  if (v42)
  {
    uint64_t v40 = *(void *)v52;
    *(void *)&long long v6 = 138413058;
    long long v38 = v6;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v52 != v40) {
          objc_enumerationMutation(obj);
        }
        uint64_t v43 = v7;
        id v8 = *(void **)(*((void *)&v51 + 1) + 8 * v7);
        BOOL v9 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];
        uint64_t v10 = [v9 reachabilityForHome:v8];

        id v11 = ANLogHandleAnnounceReachabilityServiceListener();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [v8 name];
          int v13 = [MEMORY[0x1E4F4A8A0] stringForAnnounceReachabilityLevel:v10];
          *(_DWORD *)buf = v38;
          v56 = &stru_1F34A0E10;
          __int16 v57 = 2112;
          v58 = v12;
          __int16 v59 = 2112;
          v60 = v13;
          __int16 v61 = 2112;
          id v62 = v46;
          _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "%@Sending Current Home Reachability: Home = %@, Reachability = %@, Connection = %@", buf, 0x2Au);
        }
        BOOL v14 = [v46 remoteObjectProxy];
        __int16 v15 = [v8 name];
        [v14 reachabilityLevel:v10 didChangeForHomeName:v15];

        id v16 = [v46 remoteObjectProxy];
        uint64_t v17 = [v8 uniqueIdentifier];
        [v16 reachabilityLevel:v10 didChangeForHomeUUID:v17];

        v18 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];
        v19 = [v18 monitoredRoomsForHome:v8];

        objc_msgSend(v41, "append:", objc_msgSend(v19, "count"));
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v44 = v19;
        uint64_t v20 = [v44 countByEnumeratingWithState:&v47 objects:v65 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v45 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v48 != v45) {
                objc_enumerationMutation(v44);
              }
              v23 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              id v24 = [(ANAnnounceReachabilityServiceListener *)self reachabilityManager];
              uint64_t v25 = [v24 reachabilityForRoom:v23 inHome:v8];

              v26 = ANLogHandleAnnounceReachabilityServiceListener();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                id v27 = [v8 name];
                [v23 name];
                v29 = id v28 = self;
                v30 = [MEMORY[0x1E4F4A8A0] stringForAnnounceReachabilityLevel:v25];
                *(_DWORD *)buf = 138413314;
                v56 = &stru_1F34A0E10;
                __int16 v57 = 2112;
                v58 = v27;
                __int16 v59 = 2112;
                v60 = v29;
                __int16 v61 = 2112;
                id v62 = v30;
                __int16 v63 = 2112;
                id v64 = v46;
                _os_log_impl(&dword_1DA5ED000, v26, OS_LOG_TYPE_DEFAULT, "%@Sending Current Room Reachability: Home = %@, Room = %@, Reachability = %@, Connection = %@", buf, 0x34u);

                self = v28;
              }

              v31 = [v46 remoteObjectProxy];
              v32 = [v23 name];
              __int16 v33 = [v8 name];
              [v31 reachabilityLevel:v25 didChangeForRoomName:v32 inHomeName:v33];

              id v34 = [v46 remoteObjectProxy];
              __int16 v35 = [v23 uniqueIdentifier];
              v36 = [v8 uniqueIdentifier];
              [v34 reachabilityLevel:v25 didChangeForRoomUUID:v35 inHomeUUID:v36];
            }
            uint64_t v21 = [v44 countByEnumeratingWithState:&v47 objects:v65 count:16];
          }
          while (v21);
        }

        uint64_t v7 = v43 + 1;
      }
      while (v43 + 1 != v42);
      uint64_t v42 = [obj countByEnumeratingWithState:&v51 objects:v66 count:16];
    }
    while (v42);
  }

  uint64_t v37 = +[ANAnalytics shared];
  [v37 recordReachableHomes:v41];
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForHome:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = ANLogHandleAnnounceReachabilityServiceListener();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v6 name];
    BOOL v9 = [MEMORY[0x1E4F4A8A0] stringForAnnounceReachabilityLevel:a3];
    *(_DWORD *)buf = 138412802;
    v26 = &stru_1F34A0E10;
    __int16 v27 = 2112;
    id v28 = v8;
    __int16 v29 = 2112;
    v30 = v9;
    _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "%@Reachability Changed For [Home = %@]: %@", buf, 0x20u);
  }
  uint64_t v10 = [(ANAnnounceReachabilityServiceListener *)self connections];
  objc_sync_enter(v10);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = [(ANAnnounceReachabilityServiceListener *)self connections];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v11);
        }
        __int16 v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v16 = [v15 remoteObjectProxy];
        uint64_t v17 = [v6 name];
        [v16 reachabilityLevel:a3 didChangeForHomeName:v17];

        v18 = [v15 remoteObjectProxy];
        v19 = [v6 uniqueIdentifier];
        [v18 reachabilityLevel:a3 didChangeForHomeUUID:v19];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v12);
  }

  objc_sync_exit(v10);
}

- (void)reachabilityLevel:(unint64_t)a3 didChangeForRoom:(id)a4 inHome:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = ANLogHandleAnnounceReachabilityServiceListener();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v9 name];
    uint64_t v12 = [v8 name];
    uint64_t v13 = [MEMORY[0x1E4F4A8A0] stringForAnnounceReachabilityLevel:a3];
    *(_DWORD *)buf = 138413058;
    __int16 v33 = &stru_1F34A0E10;
    __int16 v34 = 2112;
    __int16 v35 = v11;
    __int16 v36 = 2112;
    uint64_t v37 = v12;
    __int16 v38 = 2112;
    v39 = v13;
    _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%@Reachability Changed For [Home = %@, Room = %@]: %@", buf, 0x2Au);
  }
  id obj = [(ANAnnounceReachabilityServiceListener *)self connections];
  objc_sync_enter(obj);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  BOOL v14 = [(ANAnnounceReachabilityServiceListener *)self connections];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v28;
    id v26 = v14;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v26);
        }
        v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v19 = objc_msgSend(v18, "remoteObjectProxy", obj);
        long long v20 = [v8 name];
        long long v21 = [v9 name];
        [v19 reachabilityLevel:a3 didChangeForRoomName:v20 inHomeName:v21];

        long long v22 = [v18 remoteObjectProxy];
        long long v23 = [v8 uniqueIdentifier];
        id v24 = [v9 uniqueIdentifier];
        [v22 reachabilityLevel:a3 didChangeForRoomUUID:v23 inHomeUUID:v24];
      }
      BOOL v14 = v26;
      uint64_t v15 = [v26 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v15);
  }

  objc_sync_exit(obj);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (ANAnnounceReachabilityManager)reachabilityManager
{
  return self->_reachabilityManager;
}

- (void)setReachabilityManager:(id)a3
{
}

- (NSMutableSet)connections
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_reachabilityManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end