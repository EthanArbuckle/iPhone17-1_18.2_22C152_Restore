@interface ANPlaybackSessionServiceListener
- (ANPlaybackSessionServiceListener)init;
- (BOOL)_endSessionForConnection:(id)a3;
- (BOOL)isExternalPlaybackActiveForEndpointID:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)remoteSessionsActive;
- (NSMutableSet)localPlaybackClients;
- (NSMutableSet)remotePlaybackClients;
- (NSXPCListener)localPlaybackSessionListener;
- (NSXPCListener)remotePlaybackSessionListener;
- (OS_dispatch_queue)playbackClientsSerialQueue;
- (id)_clientForConnection:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)_setTimersActive:(BOOL)a3 forEndPointID:(id)a4;
- (void)_updateConnectionForReceivedAnnouncement:(id)a3 groupID:(id)a4 endpointID:(id)a5;
- (void)cleanForExit;
- (void)coordinator:(id)a3 didFinishPlayingAnnouncementsForEndpointID:(id)a4;
- (void)coordinator:(id)a3 didReceiveAnnouncement:(id)a4 forGroupID:(id)a5 forEndpointID:(id)a6;
- (void)coordinator:(id)a3 didStartPlayingAnnouncementsAtMachAbsoluteTime:(unint64_t)a4 forEndpointID:(id)a5;
- (void)coordinator:(id)a3 didUpdateAnnouncements:(id)a4 forGroupID:(id)a5 forEndpointID:(id)a6;
- (void)coordinator:(id)a3 didUpdatePlaybackState:(unint64_t)a4 forEndpointID:(id)a5;
- (void)endSessionWithReply:(id)a3;
- (void)lastPlayedAnnouncementInfoForEndpointID:(id)a3 completionHandler:(id)a4;
- (void)playbackStateForEndpointID:(id)a3 completionHandler:(id)a4;
- (void)resumeWithEndpointID:(id)a3 completionHandler:(id)a4;
- (void)sendPlaybackCommand:(id)a3 forEndpointID:(id)a4 completionHandler:(id)a5;
- (void)setLocalPlaybackClients:(id)a3;
- (void)setPlaybackStartedForAnnouncement:(id)a3;
- (void)setPlaybackStoppedForAnnouncement:(id)a3;
- (void)setRemotePlaybackClients:(id)a3;
- (void)startSessionForGroupID:(id)a3 reply:(id)a4;
@end

@implementation ANPlaybackSessionServiceListener

- (ANPlaybackSessionServiceListener)init
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)ANPlaybackSessionServiceListener;
  v2 = [(ANPlaybackSessionServiceListener *)&v19 init];
  if (v2)
  {
    if ([MEMORY[0x1E4F4A898] isAnnounceEnabled])
    {
      uint64_t v3 = objc_opt_new();
      remotePlaybackClients = v2->_remotePlaybackClients;
      v2->_remotePlaybackClients = (NSMutableSet *)v3;

      uint64_t v5 = objc_opt_new();
      localPlaybackClients = v2->_localPlaybackClients;
      v2->_localPlaybackClients = (NSMutableSet *)v5;

      dispatch_queue_t v7 = dispatch_queue_create("com.apple.Announce.playbackClientsSerialQueue", 0);
      playbackClientsSerialQueue = v2->_playbackClientsSerialQueue;
      v2->_playbackClientsSerialQueue = (OS_dispatch_queue *)v7;

      v9 = +[ANAnnouncementCoordinator sharedCoordinator];
      [v9 addDelegate:v2 queue:0];

      v10 = +[ANAnnouncementCoordinator sharedCoordinator];
      [v10 setRemotePlaybackStatusProvider:v2];
    }
    id v11 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v12 = [v11 initWithMachServiceName:*MEMORY[0x1E4F4A7B8]];
    localPlaybackSessionListener = v2->_localPlaybackSessionListener;
    v2->_localPlaybackSessionListener = (NSXPCListener *)v12;

    [(NSXPCListener *)v2->_localPlaybackSessionListener setDelegate:v2];
    [(NSXPCListener *)v2->_localPlaybackSessionListener resume];
    id v14 = objc_alloc(MEMORY[0x1E4F29290]);
    uint64_t v15 = [v14 initWithMachServiceName:*MEMORY[0x1E4F4A7C0]];
    remotePlaybackSessionListener = v2->_remotePlaybackSessionListener;
    v2->_remotePlaybackSessionListener = (NSXPCListener *)v15;

    [(NSXPCListener *)v2->_remotePlaybackSessionListener setDelegate:v2];
    [(NSXPCListener *)v2->_remotePlaybackSessionListener resume];
    v17 = ANLogHandlePlaybackSessionServiceListener();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v17, OS_LOG_TYPE_DEFAULT, "%@Playback Session Service Listeners Up!", buf, 0xCu);
    }
  }
  return v2;
}

- (void)cleanForExit
{
  uint64_t v3 = [(ANPlaybackSessionServiceListener *)self localPlaybackSessionListener];
  [v3 invalidate];

  id v4 = [(ANPlaybackSessionServiceListener *)self remotePlaybackSessionListener];
  [v4 invalidate];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = ANLogHandlePlaybackSessionServiceListener();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
    v10 = [v7 serviceName];
    *(_DWORD *)buf = 138412802;
    v47 = &stru_1F34A0E10;
    __int16 v48 = 2112;
    id v49 = v9;
    __int16 v50 = 2112;
    v51 = v10;
    _os_log_impl(&dword_1DA5ED000, v8, OS_LOG_TYPE_DEFAULT, "%@New Playback Session Connection Request From (PID = %@) For Service: (%@)", buf, 0x20u);
  }
  if (([MEMORY[0x1E4F4A898] isAnnounceEnabled] & 1) == 0)
  {
    v13 = ANLogHandlePlaybackSessionServiceListener();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v47 = &stru_1F34A0E10;
      v16 = "%@Rejecting connection. Announce not enabled.";
      v17 = v13;
      uint32_t v18 = 12;
LABEL_11:
      _os_log_impl(&dword_1DA5ED000, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    }
LABEL_12:
    BOOL v20 = 0;
    goto LABEL_21;
  }
  if (([v7 hasAnnounceEntitlement] & 1) == 0)
  {
    v13 = ANLogHandlePlaybackSessionServiceListener();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_super v19 = (void *)*MEMORY[0x1E4F4A968];
      *(_DWORD *)buf = 138412546;
      v47 = &stru_1F34A0E10;
      __int16 v48 = 2112;
      id v49 = v19;
      v16 = "%@Missing Announce Entitlement: %@";
      v17 = v13;
      uint32_t v18 = 22;
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v33 = +[ANPlaybackSessionClient clientWithXPCConnection:v7];
  id v11 = [v6 serviceName];
  int v12 = [v11 isEqualToString:*MEMORY[0x1E4F4A7C0]];

  if (v12)
  {
    v13 = objc_msgSend(MEMORY[0x1E4F29280], "an_remotePlaybackSessionServiceInterface");
    id v14 = objc_msgSend(MEMORY[0x1E4F29280], "an_remotePlaybackSessionServiceDelegateInterface");
    uint64_t v15 = [(ANPlaybackSessionServiceListener *)self playbackClientsSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke;
    block[3] = &unk_1E6BCDC78;
    block[4] = self;
    id v45 = v33;
    dispatch_sync(v15, block);
  }
  else
  {
    v21 = [v6 serviceName];
    int v22 = [v21 isEqualToString:*MEMORY[0x1E4F4A7B8]];

    if (v22)
    {
      v13 = objc_msgSend(MEMORY[0x1E4F29280], "an_localPlaybackSessionServiceInterface");
      id v14 = objc_msgSend(MEMORY[0x1E4F29280], "an_localPlaybackSessionServiceDelegateInterface");
      v23 = ANLogHandlePlaybackSessionServiceListener();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v47 = &stru_1F34A0E10;
        __int16 v48 = 2112;
        id v49 = v7;
        _os_log_impl(&dword_1DA5ED000, v23, OS_LOG_TYPE_DEFAULT, "%@adding connection: (%@)", buf, 0x16u);
      }

      [v13 setClass:objc_opt_class() forSelector:sel_sendPlaybackCommand_forEndpointID_completionHandler_ argumentIndex:0 ofReply:0];
      v24 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v25 = objc_opt_class();
      uint64_t v26 = objc_opt_class();
      uint64_t v27 = objc_opt_class();
      uint64_t v28 = objc_opt_class();
      v29 = objc_msgSend(v24, "setWithObjects:", v25, v26, v27, v28, objc_opt_class(), 0);
      [v13 setClasses:v29 forSelector:sel_lastPlayedAnnouncementInfoForEndpointID_completionHandler_ argumentIndex:0 ofReply:1];
      v30 = [(ANPlaybackSessionServiceListener *)self playbackClientsSerialQueue];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke_19;
      v42[3] = &unk_1E6BCDC78;
      v42[4] = self;
      id v43 = v33;
      dispatch_sync(v30, v42);
    }
    else
    {
      v13 = 0;
      id v14 = 0;
    }
  }
  [v14 setClass:objc_opt_class() forSelector:sel_didReceiveAnnouncement_forGroupID_ argumentIndex:0 ofReply:0];
  [v7 setExportedInterface:v13];
  [v7 setExportedObject:self];
  [v7 setRemoteObjectInterface:v14];
  objc_initWeak(&location, self);
  objc_initWeak(&from, v7);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke_2;
  v37[3] = &unk_1E6BCDF18;
  objc_copyWeak(&v38, &from);
  objc_copyWeak(&v39, &location);
  [v7 setInterruptionHandler:v37];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke_23;
  v34[3] = &unk_1E6BCDF18;
  objc_copyWeak(&v35, &from);
  objc_copyWeak(&v36, &location);
  [v7 setInvalidationHandler:v34];
  [v7 resume];
  v31 = ANLogHandlePlaybackSessionServiceListener();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v47 = &stru_1F34A0E10;
    __int16 v48 = 2112;
    id v49 = v7;
    _os_log_impl(&dword_1DA5ED000, v31, OS_LOG_TYPE_DEFAULT, "%@Connection Accepted: (%@)", buf, 0x16u);
  }

  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  BOOL v20 = 1;
LABEL_21:

  return v20;
}

void __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) remotePlaybackClients];
  [v2 addObject:*(void *)(a1 + 40)];
}

void __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke_19(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localPlaybackClients];
  [v2 addObject:*(void *)(a1 + 40)];
}

void __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = ANLogHandlePlaybackSessionServiceListener();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v6 = 138412546;
    id v7 = &stru_1F34A0E10;
    __int16 v8 = 2112;
    id v9 = WeakRetained;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_ERROR, "%@Connection Interrupted: (%@)", (uint8_t *)&v6, 0x16u);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 _removeConnection:v5];
}

void __71__ANPlaybackSessionServiceListener_listener_shouldAcceptNewConnection___block_invoke_23(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = ANLogHandlePlaybackSessionServiceListener();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v6 = 138412546;
    id v7 = &stru_1F34A0E10;
    __int16 v8 = 2112;
    id v9 = WeakRetained;
    _os_log_impl(&dword_1DA5ED000, v2, OS_LOG_TYPE_ERROR, "%@Connection Invalidated: (%@)", (uint8_t *)&v6, 0x16u);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  [v4 _removeConnection:v5];
}

- (BOOL)remoteSessionsActive
{
  id v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(ANPlaybackSessionServiceListener *)self playbackClientsSerialQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__ANPlaybackSessionServiceListener_remoteSessionsActive__block_invoke;
  v5[3] = &unk_1E6BCDF40;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __56__ANPlaybackSessionServiceListener_remoteSessionsActive__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) remotePlaybackClients];
  uint64_t v3 = [v2 count];

  if (v3)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = objc_msgSend(*(id *)(a1 + 32), "remotePlaybackClients", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          char v9 = [*(id *)(*((void *)&v10 + 1) + 8 * i) groupID];

          if (v9)
          {
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)_removeConnection:(id)a3
{
  id v4 = a3;
  [(ANPlaybackSessionServiceListener *)self _endSessionForConnection:v4];
  uint64_t v5 = [(ANPlaybackSessionServiceListener *)self playbackClientsSerialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__ANPlaybackSessionServiceListener__removeConnection___block_invoke;
  v7[3] = &unk_1E6BCDC78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

void __54__ANPlaybackSessionServiceListener__removeConnection___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v2 = [*(id *)(a1 + 32) remotePlaybackClients];
  uint64_t v3 = (void *)[v2 copy];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v43 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v35;
    *(void *)&long long v5 = 138412546;
    long long v28 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v3);
        }
        char v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v10 = *(void **)(a1 + 40);
        long long v11 = objc_msgSend(v9, "connection", v28);

        if (v10 == v11)
        {
          long long v12 = [*(id *)(a1 + 32) remotePlaybackClients];
          [v12 removeObject:v9];

          long long v13 = ANLogHandlePlaybackSessionServiceListener();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v14 = *(void *)(a1 + 40);
            *(_DWORD *)buf = v28;
            v40 = &stru_1F34A0E10;
            __int16 v41 = 2112;
            uint64_t v42 = v14;
            _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@Removed Playback Info for Connection: (%@)", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v34 objects:v43 count:16];
    }
    while (v6);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v15 = [*(id *)(a1 + 32) localPlaybackClients];
  v16 = (void *)[v15 copy];

  uint64_t v17 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v31;
    *(void *)&long long v18 = 138412546;
    long long v29 = v18;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v16);
        }
        int v22 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        v23 = *(void **)(a1 + 40);
        v24 = objc_msgSend(v22, "connection", v29);

        if (v23 == v24)
        {
          uint64_t v25 = [*(id *)(a1 + 32) localPlaybackClients];
          [v25 removeObject:v22];

          uint64_t v26 = ANLogHandlePlaybackSessionServiceListener();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = *(void *)(a1 + 40);
            *(_DWORD *)buf = v29;
            v40 = &stru_1F34A0E10;
            __int16 v41 = 2112;
            uint64_t v42 = v27;
            _os_log_impl(&dword_1DA5ED000, v26, OS_LOG_TYPE_DEFAULT, "%@Removed Other Playback for Connection: (%@)", buf, 0x16u);
          }
        }
      }
      uint64_t v19 = [v16 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v19);
  }
}

- (id)_clientForConnection:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  long long v5 = [(ANPlaybackSessionServiceListener *)self playbackClientsSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__ANPlaybackSessionServiceListener__clientForConnection___block_invoke;
  block[3] = &unk_1E6BCDF68;
  block[4] = self;
  id v10 = v4;
  long long v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __57__ANPlaybackSessionServiceListener__clientForConnection___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = [*(id *)(a1 + 32) remotePlaybackClients];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v8 = *(void **)(a1 + 40);
        char v9 = [v7 connection];

        if (v8 == v9)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = objc_msgSend(*(id *)(a1 + 32), "localPlaybackClients", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v18 + 1) + 8 * j);
          v16 = *(void **)(a1 + 40);
          id v17 = [v15 connection];

          if (v16 == v17)
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v15);
            goto LABEL_22;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

- (BOOL)_endSessionForConnection:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ANPlaybackSessionServiceListener *)self _clientForConnection:v4];
  if (v5)
  {
    id v6 = ANLogHandlePlaybackSessionServiceListener();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412546;
      id v10 = &stru_1F34A0E10;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1DA5ED000, v6, OS_LOG_TYPE_DEFAULT, "%@Ended Session For Connection: %@", (uint8_t *)&v9, 0x16u);
    }

    [v5 setGroupID:0];
  }
  id v7 = +[ANAnnouncementCoordinator localDeviceIdentifier];
  [(ANPlaybackSessionServiceListener *)self _setTimersActive:1 forEndPointID:v7];

  return v5 != 0;
}

- (void)_setTimersActive:(BOOL)a3 forEndPointID:(id)a4
{
  BOOL v4 = a3;
  *(void *)&v17[5] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = ANLogHandlePlaybackSessionServiceListener();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"IN";
    if (v4) {
      id v8 = &stru_1F34A0E10;
    }
    int v14 = 138412546;
    uint64_t v15 = &stru_1F34A0E10;
    __int16 v16 = 2112;
    *(void *)id v17 = v8;
    _os_log_impl(&dword_1DA5ED000, v7, OS_LOG_TYPE_DEFAULT, "%@Request to set timers %@ACTIVE", (uint8_t *)&v14, 0x16u);
  }

  if (v4)
  {
    if (objc_msgSend(v6, "an_isLocalDevice")) {
      BOOL v9 = [(ANPlaybackSessionServiceListener *)self remoteSessionsActive];
    }
    else {
      BOOL v9 = 0;
    }
    __int16 v11 = +[ANAnnouncementCoordinator sharedCoordinator];
    uint64_t v12 = [v11 playbackStateForEndpointID:v6];

    id v10 = ANLogHandlePlaybackSessionServiceListener();
    BOOL v13 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9 || v12 == 1)
    {
      if (v13)
      {
        int v14 = 138412802;
        uint64_t v15 = &stru_1F34A0E10;
        __int16 v16 = 1024;
        *(_DWORD *)id v17 = v9;
        v17[2] = 1024;
        *(_DWORD *)&v17[3] = v12 == 1;
        _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%@Unable to activate timers. Remote Session Active = %d, Local Session Active = %d", (uint8_t *)&v14, 0x18u);
      }
    }
    else
    {
      if (v13)
      {
        int v14 = 138412290;
        uint64_t v15 = &stru_1F34A0E10;
        _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%@No Active Sessions. Resuming All Timers.", (uint8_t *)&v14, 0xCu);
      }

      id v10 = +[ANAnnouncementCoordinator sharedCoordinator];
      [v10 resumeAllTimersForEndpointID:v6];
    }
  }
  else
  {
    id v10 = +[ANAnnouncementCoordinator sharedCoordinator];
    [v10 pauseAllTimersForEndpointID:v6];
  }
}

- (void)startSessionForGroupID:(id)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  id v8 = +[ANAnnouncementCoordinator localDeviceIdentifier];
  [(ANPlaybackSessionServiceListener *)self _setTimersActive:0 forEndPointID:v8];

  BOOL v9 = [MEMORY[0x1E4F29268] currentConnection];
  id v10 = [(ANPlaybackSessionServiceListener *)self _clientForConnection:v9];

  if (v10)
  {
    [v10 setGroupID:v6];
    __int16 v11 = +[ANAnnouncementCoordinator sharedCoordinator];
    uint64_t v12 = +[ANAnnouncementCoordinator localDeviceIdentifier];
    BOOL v13 = [v11 announcementsForGroupID:v6 endpointID:v12];

    int v14 = [MEMORY[0x1E4F4A8A8] contextsFrom:v13];
    uint64_t v15 = [v10 connection];
    __int16 v16 = [v15 remoteObjectProxy];
    [v16 didUpdateAnnouncements:v14 forGroupID:v6];

    id v17 = ANLogHandlePlaybackSessionServiceListener();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      long long v18 = [MEMORY[0x1E4F29268] currentConnection];
      int v21 = 138412802;
      long long v22 = &stru_1F34A0E10;
      __int16 v23 = 2112;
      id v24 = v6;
      __int16 v25 = 2112;
      uint64_t v26 = v18;
      _os_log_impl(&dword_1DA5ED000, v17, OS_LOG_TYPE_DEFAULT, "%@Started remote playback session. GroupID = %@, connection = %@)", (uint8_t *)&v21, 0x20u);
    }
    v7[2](v7, 1);
  }
  else
  {
    long long v19 = ANLogHandlePlaybackSessionServiceListener();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = [MEMORY[0x1E4F29268] currentConnection];
      int v21 = 138412546;
      long long v22 = &stru_1F34A0E10;
      __int16 v23 = 2112;
      id v24 = v20;
      _os_log_impl(&dword_1DA5ED000, v19, OS_LOG_TYPE_DEFAULT, "%@Failed to start remote playback session. Connection = %@", (uint8_t *)&v21, 0x16u);
    }
    v7[2](v7, 0);

    BOOL v13 = +[ANAnalytics shared];
    [v13 error:5001];
  }
}

- (void)endSessionWithReply:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F29268];
  id v7 = (void (**)(id, BOOL))a3;
  uint64_t v5 = [v4 currentConnection];
  BOOL v6 = [(ANPlaybackSessionServiceListener *)self _endSessionForConnection:v5];

  v7[2](v7, v6);
}

- (void)setPlaybackStartedForAnnouncement:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = ANLogHandlePlaybackSessionServiceListener();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%@Set Remote Playback Started", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = +[ANAnnouncementCoordinator sharedCoordinator];
  BOOL v6 = +[ANAnnouncementCoordinator localDeviceIdentifier];
  [v5 setPlaybackStartedForAnnouncement:v3 endpointID:v6];
}

- (void)setPlaybackStoppedForAnnouncement:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = ANLogHandlePlaybackSessionServiceListener();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = &stru_1F34A0E10;
    _os_log_impl(&dword_1DA5ED000, v4, OS_LOG_TYPE_DEFAULT, "%@Set Remote Playback Stopped", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = +[ANAnnouncementCoordinator sharedCoordinator];
  BOOL v6 = +[ANAnnouncementCoordinator localDeviceIdentifier];
  [v5 setPlaybackStoppedForAnnouncement:v3 endpointID:v6];
}

- (void)sendPlaybackCommand:(id)a3 forEndpointID:(id)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = ANLogHandlePlaybackSessionServiceListener();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412802;
    long long v19 = &stru_1F34A0E10;
    __int16 v20 = 2112;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v7;
    _os_log_impl(&dword_1DA5ED000, v10, OS_LOG_TYPE_DEFAULT, "%@Received Playback Command. Endpoint ID = %@, Command = %@", (uint8_t *)&v18, 0x20u);
  }

  __int16 v11 = [MEMORY[0x1E4F29268] currentConnection];
  uint64_t v12 = [v11 clientID];

  [v7 setClientIdentifier:v12];
  BOOL v13 = +[ANAnnouncementCoordinator sharedCoordinator];
  [v13 performPlaybackCommand:v7 endpointID:v8 completionHandler:v9];

  int v14 = +[ANAnalytics shared];
  uint64_t v15 = [v7 operation];
  uint64_t v16 = [MEMORY[0x1E4F4A8A8] sourceFromString:v12];
  id v17 = +[ANAnalyticsContext contextWithEndpointID:v8];
  [v14 playbackAction:v15 fromSource:v16 context:v17];
}

- (void)resumeWithEndpointID:(id)a3 completionHandler:(id)a4
{
  BOOL v6 = (void *)MEMORY[0x1E4F29268];
  id v7 = (void (**)(void))a4;
  id v8 = a3;
  id v9 = [v6 currentConnection];
  id v10 = [(ANPlaybackSessionServiceListener *)self _clientForConnection:v9];

  [v10 setEndpointID:v8];
  v7[2](v7);
}

- (void)lastPlayedAnnouncementInfoForEndpointID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[ANAnnouncementCoordinator sharedCoordinator];
  id v8 = [v9 lastPlayedAnnouncementInfoForEndpointID:v7];

  (*((void (**)(id, void *))a4 + 2))(v6, v8);
}

- (void)playbackStateForEndpointID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = +[ANAnnouncementCoordinator sharedCoordinator];
  uint64_t v8 = [v9 playbackStateForEndpointID:v7];

  (*((void (**)(id, uint64_t))a4 + 2))(v6, v8);
}

- (BOOL)isExternalPlaybackActiveForEndpointID:(id)a3
{
  int v4 = objc_msgSend(a3, "an_isLocalDevice");
  if (v4)
  {
    LOBYTE(v4) = [(ANPlaybackSessionServiceListener *)self remoteSessionsActive];
  }
  return v4;
}

- (void)coordinator:(id)a3 didUpdateAnnouncements:(id)a4 forGroupID:(id)a5 forEndpointID:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = ANLogHandlePlaybackSessionServiceListener();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = &stru_1F34A0E10;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl(&dword_1DA5ED000, v12, OS_LOG_TYPE_DEFAULT, "%@Did Update Announcements for Group ID: %@", buf, 0x16u);
  }

  char v13 = objc_msgSend(v11, "an_isLocalDevice");
  if (v13)
  {
    int v14 = [MEMORY[0x1E4F4A8A8] contextsFrom:v9];
    uint64_t v15 = [(ANPlaybackSessionServiceListener *)self playbackClientsSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__ANPlaybackSessionServiceListener_coordinator_didUpdateAnnouncements_forGroupID_forEndpointID___block_invoke;
    block[3] = &unk_1E6BCDF90;
    block[4] = self;
    id v18 = v10;
    id v19 = v14;
    uint64_t v16 = v14;
    dispatch_async(v15, block);
  }
  else
  {
    uint64_t v16 = ANLogHandlePlaybackSessionServiceListener();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = &stru_1F34A0E10;
      _os_log_impl(&dword_1DA5ED000, v16, OS_LOG_TYPE_DEFAULT, "%@Skipping updates not for local device", buf, 0xCu);
    }
  }
}

void __96__ANPlaybackSessionServiceListener_coordinator_didUpdateAnnouncements_forGroupID_forEndpointID___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [*(id *)(a1 + 32) remotePlaybackClients];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v4 = 138412546;
    long long v14 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "groupID", v14);
        int v10 = [v9 isEqualToString:*(void *)(a1 + 40)];

        if (v10)
        {
          id v11 = ANLogHandlePlaybackSessionServiceListener();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            __int16 v20 = &stru_1F34A0E10;
            __int16 v21 = 2112;
            __int16 v22 = v8;
            _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "%@Notifying Connection Announcements Changed: %@", buf, 0x16u);
          }

          uint64_t v12 = [v8 connection];
          char v13 = [v12 remoteObjectProxy];
          [v13 didUpdateAnnouncements:*(void *)(a1 + 48) forGroupID:*(void *)(a1 + 40)];
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v5);
  }
}

- (void)coordinator:(id)a3 didReceiveAnnouncement:(id)a4 forGroupID:(id)a5 forEndpointID:(id)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = ANLogHandlePlaybackSessionServiceListener();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    char v13 = [v9 identifier];
    int v14 = 138412802;
    long long v15 = &stru_1F34A0E10;
    __int16 v16 = 2112;
    long long v17 = v13;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_1DA5ED000, v12, OS_LOG_TYPE_DEFAULT, "%@Did Receive Announcement ID: %@, for Group ID: %@", (uint8_t *)&v14, 0x20u);
  }
  [(ANPlaybackSessionServiceListener *)self _updateConnectionForReceivedAnnouncement:v9 groupID:v10 endpointID:v11];
}

- (void)_updateConnectionForReceivedAnnouncement:(id)a3 groupID:(id)a4 endpointID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x1E4F4A8B8];
  id v11 = [a3 remoteSessionDictionary];
  uint64_t v12 = [v10 contextFromDictionary:v11];

  if (objc_msgSend(v9, "an_isLocalDevice"))
  {
    char v13 = [(ANPlaybackSessionServiceListener *)self playbackClientsSerialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __96__ANPlaybackSessionServiceListener__updateConnectionForReceivedAnnouncement_groupID_endpointID___block_invoke;
    block[3] = &unk_1E6BCDF90;
    block[4] = self;
    id v23 = v8;
    id v24 = v12;
    dispatch_async(v13, block);
  }
  int v14 = [(ANPlaybackSessionServiceListener *)self playbackClientsSerialQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__ANPlaybackSessionServiceListener__updateConnectionForReceivedAnnouncement_groupID_endpointID___block_invoke_31;
  v18[3] = &unk_1E6BCDFB8;
  v18[4] = self;
  id v19 = v9;
  id v20 = v12;
  id v21 = v8;
  id v15 = v8;
  id v16 = v12;
  id v17 = v9;
  dispatch_async(v14, v18);
}

void __96__ANPlaybackSessionServiceListener__updateConnectionForReceivedAnnouncement_groupID_endpointID___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = [*(id *)(a1 + 32) remotePlaybackClients];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v4 = 138412546;
    long long v14 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "groupID", v14);
        int v10 = [v9 isEqualToString:*(void *)(a1 + 40)];

        if (v10)
        {
          id v11 = ANLogHandlePlaybackSessionServiceListener();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v14;
            id v20 = &stru_1F34A0E10;
            __int16 v21 = 2112;
            __int16 v22 = v8;
            _os_log_impl(&dword_1DA5ED000, v11, OS_LOG_TYPE_DEFAULT, "%@Notifying Remote Playback Client Announcement Received: %@", buf, 0x16u);
          }

          uint64_t v12 = [v8 connection];
          char v13 = [v12 remoteObjectProxy];
          [v13 didReceiveAnnouncement:*(void *)(a1 + 48) forGroupID:*(void *)(a1 + 40)];
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v5);
  }
}

void __96__ANPlaybackSessionServiceListener__updateConnectionForReceivedAnnouncement_groupID_endpointID___block_invoke_31(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = [*(id *)(a1 + 32) localPlaybackClients];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v18;
    *(void *)&long long v4 = 138412546;
    long long v16 = v4;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v9 = objc_msgSend(v8, "endpointID", v16);
        int v10 = v9;
        if (v9)
        {
          id v11 = v9;
        }
        else
        {
          id v11 = +[ANAnnouncementCoordinator localDeviceIdentifier];
        }
        uint64_t v12 = v11;

        if ([v12 isEqual:*(void *)(a1 + 40)])
        {
          char v13 = ANLogHandlePlaybackSessionServiceListener();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            __int16 v22 = &stru_1F34A0E10;
            __int16 v23 = 2112;
            uint64_t v24 = v8;
            _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@Notifying Local Playback Client Announcement Received: %@", buf, 0x16u);
          }

          long long v14 = [v8 connection];
          long long v15 = [v14 remoteObjectProxy];
          [v15 didReceiveAnnouncement:*(void *)(a1 + 48) forGroupID:*(void *)(a1 + 56)];
        }
      }
      uint64_t v5 = [v2 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v5);
  }
}

- (void)coordinator:(id)a3 didStartPlayingAnnouncementsAtMachAbsoluteTime:(unint64_t)a4 forEndpointID:(id)a5
{
  id v7 = a5;
  [(ANPlaybackSessionServiceListener *)self _setTimersActive:0 forEndPointID:v7];
  id v8 = [(ANPlaybackSessionServiceListener *)self playbackClientsSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __109__ANPlaybackSessionServiceListener_coordinator_didStartPlayingAnnouncementsAtMachAbsoluteTime_forEndpointID___block_invoke;
  block[3] = &unk_1E6BCDFE0;
  block[4] = self;
  id v11 = v7;
  unint64_t v12 = a4;
  id v9 = v7;
  dispatch_async(v8, block);
}

void __109__ANPlaybackSessionServiceListener_coordinator_didStartPlayingAnnouncementsAtMachAbsoluteTime_forEndpointID___block_invoke(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v2 = [*(id *)(a1 + 32) localPlaybackClients];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v27;
    *(void *)&long long v4 = 138413058;
    long long v23 = v4;
    uint64_t v24 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      uint64_t v25 = v5;
      do
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
        id v9 = objc_msgSend(v8, "endpointID", v23);
        int v10 = v9;
        if (v9)
        {
          id v11 = v9;
        }
        else
        {
          id v11 = +[ANAnnouncementCoordinator localDeviceIdentifier];
        }
        unint64_t v12 = v11;

        if ([v12 isEqual:*(void *)(a1 + 40)])
        {
          char v13 = ANLogHandlePlaybackSessionServiceListener();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            long long v14 = NSNumber;
            [v8 connection];
            v16 = long long v15 = v2;
            long long v17 = objc_msgSend(v14, "numberWithInt:", objc_msgSend(v16, "processIdentifier"));
            long long v18 = [v8 connection];
            long long v19 = [v18 clientID];
            uint64_t v20 = *(void *)(a1 + 48);
            *(_DWORD *)buf = v23;
            long long v31 = &stru_1F34A0E10;
            __int16 v32 = 2112;
            long long v33 = v17;
            __int16 v34 = 2112;
            long long v35 = v19;
            __int16 v36 = 2048;
            uint64_t v37 = v20;
            _os_log_impl(&dword_1DA5ED000, v13, OS_LOG_TYPE_DEFAULT, "%@Notifying Local Playback Client (%@, %@) Announcement playback starting at time: %lld", buf, 0x2Au);

            uint64_t v5 = v25;
            id v2 = v15;
            uint64_t v6 = v24;
          }

          __int16 v21 = [v8 connection];
          __int16 v22 = [v21 remoteObjectProxy];
          [v22 announcementsWillStartPlaying:*(void *)(a1 + 48)];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v5);
  }
}

- (void)coordinator:(id)a3 didFinishPlayingAnnouncementsForEndpointID:(id)a4
{
}

- (void)coordinator:(id)a3 didUpdatePlaybackState:(unint64_t)a4 forEndpointID:(id)a5
{
  id v7 = a5;
  id v8 = [(ANPlaybackSessionServiceListener *)self playbackClientsSerialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__ANPlaybackSessionServiceListener_coordinator_didUpdatePlaybackState_forEndpointID___block_invoke;
  block[3] = &unk_1E6BCDFE0;
  block[4] = self;
  id v11 = v7;
  unint64_t v12 = a4;
  id v9 = v7;
  dispatch_async(v8, block);
}

void __85__ANPlaybackSessionServiceListener_coordinator_didUpdatePlaybackState_forEndpointID___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "localPlaybackClients", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v8 = [v7 endpointID];
        id v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          id v10 = +[ANAnnouncementCoordinator localDeviceIdentifier];
        }
        id v11 = v10;

        if ([v11 isEqual:*(void *)(a1 + 40)])
        {
          unint64_t v12 = [v7 connection];
          char v13 = [v12 remoteObjectProxy];
          [v13 announcementsStateUpdate:*(void *)(a1 + 48)];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }
}

- (NSXPCListener)localPlaybackSessionListener
{
  return self->_localPlaybackSessionListener;
}

- (NSXPCListener)remotePlaybackSessionListener
{
  return self->_remotePlaybackSessionListener;
}

- (NSMutableSet)remotePlaybackClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRemotePlaybackClients:(id)a3
{
}

- (NSMutableSet)localPlaybackClients
{
  return (NSMutableSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLocalPlaybackClients:(id)a3
{
}

- (OS_dispatch_queue)playbackClientsSerialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playbackClientsSerialQueue, 0);
  objc_storeStrong((id *)&self->_localPlaybackClients, 0);
  objc_storeStrong((id *)&self->_remotePlaybackClients, 0);
  objc_storeStrong((id *)&self->_remotePlaybackSessionListener, 0);
  objc_storeStrong((id *)&self->_localPlaybackSessionListener, 0);
}

@end