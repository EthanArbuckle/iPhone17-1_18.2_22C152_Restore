@interface ANRemotePlaybackSession
- (ANRemotePlaybackSession)init;
- (ANRemotePlaybackSessionDelegate)delegate;
- (ANRemotePlaybackSessionServiceClientInterfaceProxy)delegateProxy;
- (ANXPCManager)xpcManager;
- (BOOL)endSession;
- (BOOL)startSessionForGroupID:(id)a3 announcementsHandler:(id)a4;
- (OS_dispatch_queue)handlerQueue;
- (id)handler;
- (void)_callHandler:(id)a3;
- (void)checkInWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)didReceiveAnnouncement:(id)a3 forGroupID:(id)a4;
- (void)invalidate;
- (void)lastPlayedAnnouncementInfoWithCompletion:(id)a3;
- (void)managerDidInterruptConnection:(id)a3;
- (void)managerDidInvalidateConnection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHandler:(id)a3;
- (void)setHandlerQueue:(id)a3;
- (void)setPlaybackStartedForAnnouncement:(id)a3;
- (void)setPlaybackStoppedForAnnouncement:(id)a3;
@end

@implementation ANRemotePlaybackSession

- (ANRemotePlaybackSession)init
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v20.receiver = self;
  v20.super_class = (Class)ANRemotePlaybackSession;
  v2 = [(ANRemotePlaybackSession *)&v20 init];
  if (v2)
  {
    v3 = ANLogHandleRemotePlaybackSession();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = &stru_26D2D46B0;
      __int16 v23 = 2112;
      v24 = @"com.apple.announced.remoteplaybacksession";
      _os_log_impl(&dword_220FAA000, v3, OS_LOG_TYPE_DEFAULT, "%@Creating Connection to Service: %@", buf, 0x16u);
    }

    v4 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D2E3428];
    v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
    [v4 setClasses:v10 forSelector:sel_lastPlayedAnnouncementInfoForEndpointID_completionHandler_ argumentIndex:0 ofReply:1];
    v11 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D2DF0D8];
    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    [v11 setClasses:v14 forSelector:sel_didUpdateAnnouncements_forGroupID_ argumentIndex:0 ofReply:0];
    [v11 setClass:objc_opt_class() forSelector:sel_didReceiveAnnouncement_forGroupID_ argumentIndex:0 ofReply:0];
    uint64_t v15 = objc_opt_new();
    delegateProxy = v2->_delegateProxy;
    v2->_delegateProxy = (ANRemotePlaybackSessionServiceClientInterfaceProxy *)v15;

    [(ANRemotePlaybackSessionServiceClientInterfaceProxy *)v2->_delegateProxy setDelegate:v2];
    v17 = [[ANXPCManager alloc] initWithMachServiceName:@"com.apple.announced.remoteplaybacksession" remoteObjectInterface:v4 exportedInterface:v11 exportedObject:v2->_delegateProxy];
    xpcManager = v2->_xpcManager;
    v2->_xpcManager = v17;

    [(ANXPCManager *)v2->_xpcManager setDelegate:v2];
    [(ANXPCManager *)v2->_xpcManager setCheckInProvider:v2];
  }
  return v2;
}

- (void)dealloc
{
  [(ANRemotePlaybackSession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ANRemotePlaybackSession;
  [(ANRemotePlaybackSession *)&v3 dealloc];
}

- (void)invalidate
{
  [(ANRemotePlaybackSession *)self setDelegate:0];
  [(ANRemotePlaybackSession *)self setHandler:0];
  [(ANRemotePlaybackSession *)self setHandlerQueue:0];
  id v4 = [(ANRemotePlaybackSession *)self xpcManager];
  objc_super v3 = [v4 connection];
  [v3 invalidate];
}

- (void)setPlaybackStartedForAnnouncement:(id)a3
{
  id v4 = a3;
  id v7 = [(ANRemotePlaybackSession *)self xpcManager];
  v5 = [v7 connection];
  uint64_t v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_9];
  [v6 setPlaybackStartedForAnnouncement:v4];
}

void __61__ANRemotePlaybackSession_setPlaybackStartedForAnnouncement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  objc_super v3 = ANLogHandleRemotePlaybackSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412802;
    v5 = &stru_26D2D46B0;
    __int16 v6 = 2080;
    id v7 = "-[ANRemotePlaybackSession setPlaybackStartedForAnnouncement:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_220FAA000, v3, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v4, 0x20u);
  }
}

- (void)setPlaybackStoppedForAnnouncement:(id)a3
{
  id v4 = a3;
  id v7 = [(ANRemotePlaybackSession *)self xpcManager];
  v5 = [v7 connection];
  __int16 v6 = [v5 remoteObjectProxyWithErrorHandler:&__block_literal_global_93];
  [v6 setPlaybackStoppedForAnnouncement:v4];
}

void __61__ANRemotePlaybackSession_setPlaybackStoppedForAnnouncement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  objc_super v3 = ANLogHandleRemotePlaybackSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412802;
    v5 = &stru_26D2D46B0;
    __int16 v6 = 2080;
    id v7 = "-[ANRemotePlaybackSession setPlaybackStoppedForAnnouncement:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_220FAA000, v3, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v4, 0x20u);
  }
}

- (void)lastPlayedAnnouncementInfoWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(ANRemotePlaybackSession *)self xpcManager];
  __int16 v6 = [v5 connection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __68__ANRemotePlaybackSession_lastPlayedAnnouncementInfoWithCompletion___block_invoke;
  v9[3] = &unk_264587078;
  id v10 = v4;
  id v7 = v4;
  __int16 v8 = [v6 remoteObjectProxyWithErrorHandler:v9];
  [v8 lastPlayedAnnouncementInfoForEndpointID:0 completionHandler:v7];
}

void __68__ANRemotePlaybackSession_lastPlayedAnnouncementInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleRemotePlaybackSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    __int16 v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    __int16 v8 = "-[ANRemotePlaybackSession lastPlayedAnnouncementInfoWithCompletion:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)startSessionForGroupID:(id)a3 announcementsHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(ANRemotePlaybackSession *)self setHandler:v7];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  __int16 v8 = dispatch_group_create();
  dispatch_group_enter(v8);
  __int16 v9 = [(ANRemotePlaybackSession *)self xpcManager];
  id v10 = [v9 connection];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __71__ANRemotePlaybackSession_startSessionForGroupID_announcementsHandler___block_invoke;
  v19[3] = &unk_264587490;
  uint64_t v11 = v8;
  objc_super v20 = v11;
  v12 = [v10 remoteObjectProxyWithErrorHandler:v19];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __71__ANRemotePlaybackSession_startSessionForGroupID_announcementsHandler___block_invoke_94;
  v16[3] = &unk_2645874B8;
  v18 = &v21;
  uint64_t v13 = v11;
  v17 = v13;
  [v12 startSessionForGroupID:v6 reply:v16];

  dispatch_time_t v14 = dispatch_time(0, 2000000000);
  dispatch_group_wait(v13, v14);
  LOBYTE(v9) = *((unsigned char *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)v9;
}

void __71__ANRemotePlaybackSession_startSessionForGroupID_announcementsHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleRemotePlaybackSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    id v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    __int16 v8 = "-[ANRemotePlaybackSession startSessionForGroupID:announcementsHandler:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __71__ANRemotePlaybackSession_startSessionForGroupID_announcementsHandler___block_invoke_94(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)endSession
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = [(ANRemotePlaybackSession *)self xpcManager];
  int v5 = [v4 connection];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __37__ANRemotePlaybackSession_endSession__block_invoke;
  v14[3] = &unk_264587490;
  id v6 = v3;
  uint64_t v15 = v6;
  __int16 v7 = [v5 remoteObjectProxyWithErrorHandler:v14];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__ANRemotePlaybackSession_endSession__block_invoke_96;
  v11[3] = &unk_2645874B8;
  uint64_t v13 = &v16;
  __int16 v8 = v6;
  v12 = v8;
  [v7 endSessionWithReply:v11];

  dispatch_time_t v9 = dispatch_time(0, 2000000000);
  dispatch_group_wait(v8, v9);
  LOBYTE(v4) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v4;
}

void __37__ANRemotePlaybackSession_endSession__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleRemotePlaybackSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    id v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    __int16 v8 = "-[ANRemotePlaybackSession endSession]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __37__ANRemotePlaybackSession_endSession__block_invoke_96(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_callHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(ANRemotePlaybackSession *)self handlerQueue];

  if (v5)
  {
    id v6 = [(ANRemotePlaybackSession *)self handlerQueue];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __40__ANRemotePlaybackSession__callHandler___block_invoke;
    v8[3] = &unk_2645874E0;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v6, v8);
  }
  else
  {
    __int16 v7 = [(ANRemotePlaybackSession *)self handler];
    ((void (**)(void, id))v7)[2](v7, v4);
  }
}

void __40__ANRemotePlaybackSession__callHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handler];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)didReceiveAnnouncement:(id)a3 forGroupID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = ANLogHandleRemotePlaybackSession();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = &stru_26D2D46B0;
    __int16 v17 = 2080;
    uint64_t v18 = "-[ANRemotePlaybackSession didReceiveAnnouncement:forGroupID:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_220FAA000, v8, OS_LOG_TYPE_DEFAULT, "%@%s, did receive announcement: %@", buf, 0x20u);
  }

  id v9 = [(ANRemotePlaybackSession *)self delegate];
  if ([v9 conformsToProtocol:&unk_26D2E3488])
  {
    id v10 = [(ANRemotePlaybackSession *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      objc_initWeak((id *)buf, self);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __61__ANRemotePlaybackSession_didReceiveAnnouncement_forGroupID___block_invoke;
      v12[3] = &unk_264587140;
      objc_copyWeak(&v14, (id *)buf);
      id v13 = v6;
      +[ANUtils asyncDispatchOnGlobalQueue:v12];

      objc_destroyWeak(&v14);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
  }
}

void __61__ANRemotePlaybackSession_didReceiveAnnouncement_forGroupID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained delegate];
  [v2 session:WeakRetained didReceiveAnnouncement:*(void *)(a1 + 32)];
}

- (void)managerDidInterruptConnection:(id)a3
{
  id v4 = a3;
  int v5 = [(ANRemotePlaybackSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__ANRemotePlaybackSession_managerDidInterruptConnection___block_invoke;
    v11[3] = &unk_264587168;
    objc_copyWeak(&v12, &location);
    +[ANUtils asyncDispatchOnGlobalQueue:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  id v7 = [(ANRemotePlaybackSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__ANRemotePlaybackSession_managerDidInterruptConnection___block_invoke_2;
    v9[3] = &unk_264587168;
    objc_copyWeak(&v10, &location);
    +[ANUtils asyncDispatchOnGlobalQueue:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __57__ANRemotePlaybackSession_managerDidInterruptConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 connectionInterrupted];
}

void __57__ANRemotePlaybackSession_managerDidInterruptConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 sessionInterrupted:WeakRetained];
}

- (void)managerDidInvalidateConnection:(id)a3
{
  id v4 = a3;
  int v5 = [(ANRemotePlaybackSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__ANRemotePlaybackSession_managerDidInvalidateConnection___block_invoke;
    v11[3] = &unk_264587168;
    objc_copyWeak(&v12, &location);
    +[ANUtils asyncDispatchOnGlobalQueue:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  id v7 = [(ANRemotePlaybackSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __58__ANRemotePlaybackSession_managerDidInvalidateConnection___block_invoke_2;
    v9[3] = &unk_264587168;
    objc_copyWeak(&v10, &location);
    +[ANUtils asyncDispatchOnGlobalQueue:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __58__ANRemotePlaybackSession_managerDidInvalidateConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 connectionInvalidated];
}

void __58__ANRemotePlaybackSession_managerDidInvalidateConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 sessionInvalidated:WeakRetained];
}

- (void)checkInWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(ANRemotePlaybackSession *)self xpcManager];
  char v6 = [v5 connection];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__ANRemotePlaybackSession_checkInWithCompletionHandler___block_invoke;
  v12[3] = &unk_264587078;
  id v7 = v4;
  id v13 = v7;
  char v8 = [v6 remoteObjectProxyWithErrorHandler:v12];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__ANRemotePlaybackSession_checkInWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_264587190;
  id v11 = v7;
  id v9 = v7;
  [v8 resumeWithEndpointID:0 completionHandler:v10];
}

uint64_t __56__ANRemotePlaybackSession_checkInWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__ANRemotePlaybackSession_checkInWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (OS_dispatch_queue)handlerQueue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handlerQueue);

  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setHandlerQueue:(id)a3
{
}

- (ANRemotePlaybackSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ANRemotePlaybackSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (ANRemotePlaybackSessionServiceClientInterfaceProxy)delegateProxy
{
  return self->_delegateProxy;
}

- (ANXPCManager)xpcManager
{
  return self->_xpcManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcManager, 0);
  objc_storeStrong((id *)&self->_delegateProxy, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_handlerQueue);
}

@end