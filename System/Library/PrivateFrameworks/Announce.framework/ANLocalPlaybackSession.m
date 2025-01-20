@interface ANLocalPlaybackSession
+ (id)stringForPlaybackState:(unint64_t)a3;
- (ANLocalPlaybackSession)init;
- (ANLocalPlaybackSession)initWithEndpointIdentifier:(id)a3;
- (ANLocalPlaybackSessionDelegate)delegate;
- (ANLocalPlaybackSessionInterfaceDelegateProxy)delegateProxy;
- (ANXPCManager)xpcManager;
- (NSDictionary)lastPlayedAnnouncementInfo;
- (NSUUID)endpointIdentifier;
- (unint64_t)playbackState;
- (void)announcementsStateUpdate:(unint64_t)a3;
- (void)announcementsWillStartPlaying:(unint64_t)a3;
- (void)checkInWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)didReceiveAnnouncement:(id)a3 forGroupID:(id)a4;
- (void)invalidate;
- (void)lastPlayedAnnouncementInfoWithCompletion:(id)a3;
- (void)managerDidInterruptConnection:(id)a3;
- (void)managerDidInvalidateConnection:(id)a3;
- (void)nextAnnouncementWithCompletionHandler:(id)a3;
- (void)playAnnouncements;
- (void)playAnnouncementsWithIDs:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5;
- (void)playAnnouncementsWithOptions:(unint64_t)a3 completionHandler:(id)a4;
- (void)playAnnouncementsWithOptions:(unint64_t)a3 startingAt:(id)a4 completionHandler:(id)a5;
- (void)previousAnnouncementWithCompletionHandler:(id)a3;
- (void)sendPlaybackCommand:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)stopPlayingAnnouncements;
- (void)stopPlayingAnnouncementsWithCompletionHandler:(id)a3;
@end

@implementation ANLocalPlaybackSession

- (ANLocalPlaybackSession)init
{
  return [(ANLocalPlaybackSession *)self initWithEndpointIdentifier:0];
}

- (ANLocalPlaybackSession)initWithEndpointIdentifier:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)ANLocalPlaybackSession;
  v6 = [(ANLocalPlaybackSession *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointIdentifier, a3);
    v8 = ANLogHandleLocalPlaybackSession();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v24 = &stru_26D2D46B0;
      __int16 v25 = 2112;
      v26 = @"com.apple.announced.localplaybacksession";
      _os_log_impl(&dword_220FAA000, v8, OS_LOG_TYPE_DEFAULT, "%@Creating Connection to Service: %@", buf, 0x16u);
    }

    v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D2E30C0];
    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    v15 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, objc_opt_class(), 0);
    [v9 setClasses:v15 forSelector:sel_lastPlayedAnnouncementInfoForEndpointID_completionHandler_ argumentIndex:0 ofReply:1];
    v16 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D2DD628];
    [v16 setClass:objc_opt_class() forSelector:sel_didReceiveAnnouncement_forGroupID_ argumentIndex:0 ofReply:0];
    uint64_t v17 = objc_opt_new();
    delegateProxy = v7->_delegateProxy;
    v7->_delegateProxy = (ANLocalPlaybackSessionInterfaceDelegateProxy *)v17;

    [(ANLocalPlaybackSessionInterfaceDelegateProxy *)v7->_delegateProxy setDelegate:v7];
    v19 = [[ANXPCManager alloc] initWithMachServiceName:@"com.apple.announced.localplaybacksession" remoteObjectInterface:v9 exportedInterface:v16 exportedObject:v7->_delegateProxy];
    xpcManager = v7->_xpcManager;
    v7->_xpcManager = v19;

    [(ANXPCManager *)v7->_xpcManager setDelegate:v7];
    [(ANXPCManager *)v7->_xpcManager setCheckInProvider:v7];
  }
  return v7;
}

- (void)dealloc
{
  [(ANLocalPlaybackSession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ANLocalPlaybackSession;
  [(ANLocalPlaybackSession *)&v3 dealloc];
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_delegate, 0);
  id v4 = [(ANLocalPlaybackSession *)self xpcManager];
  objc_super v3 = [v4 connection];
  [v3 invalidate];
}

- (void)setDelegate:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  id v5 = ANLogHandleLocalPlaybackSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    v7 = &stru_26D2D46B0;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl(&dword_220FAA000, v5, OS_LOG_TYPE_DEFAULT, "%@Delegate set to %@", (uint8_t *)&v6, 0x16u);
  }
}

- (void)sendPlaybackCommand:(id)a3 completionHandler:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = ANLogHandleLocalPlaybackSession();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = &stru_26D2D46B0;
    __int16 v21 = 2114;
    id v22 = v6;
    _os_log_impl(&dword_220FAA000, v8, OS_LOG_TYPE_DEFAULT, "%@Sending Playback Command: %{public}@", buf, 0x16u);
  }

  id v9 = [(ANLocalPlaybackSession *)self xpcManager];
  uint64_t v10 = [v9 connection];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __64__ANLocalPlaybackSession_sendPlaybackCommand_completionHandler___block_invoke;
  v17[3] = &unk_264587078;
  id v11 = v7;
  id v18 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v17];
  uint64_t v13 = [(ANLocalPlaybackSession *)self endpointIdentifier];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __64__ANLocalPlaybackSession_sendPlaybackCommand_completionHandler___block_invoke_86;
  v15[3] = &unk_264587078;
  id v16 = v11;
  id v14 = v11;
  [v12 sendPlaybackCommand:v6 forEndpointID:v13 completionHandler:v15];
}

void __64__ANLocalPlaybackSession_sendPlaybackCommand_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleLocalPlaybackSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412802;
    id v7 = &stru_26D2D46B0;
    __int16 v8 = 2080;
    id v9 = "-[ANLocalPlaybackSession sendPlaybackCommand:completionHandler:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __64__ANLocalPlaybackSession_sendPlaybackCommand_completionHandler___block_invoke_86(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = ANLogHandleLocalPlaybackSession();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412802;
      id v7 = &stru_26D2D46B0;
      __int16 v8 = 2080;
      id v9 = "-[ANLocalPlaybackSession sendPlaybackCommand:completionHandler:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)playAnnouncements
{
}

- (void)playAnnouncementsWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = +[ANPlaybackCommand playCommandWithOptions:a3 announcementIdentifiers:MEMORY[0x263EFFA68]];
  [(ANLocalPlaybackSession *)self sendPlaybackCommand:v7 completionHandler:v6];
}

- (void)playAnnouncementsWithIDs:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = +[ANPlaybackCommand playCommandWithOptions:a4 announcementIdentifiers:a3];
  [(ANLocalPlaybackSession *)self sendPlaybackCommand:v9 completionHandler:v8];
}

- (void)playAnnouncementsWithOptions:(unint64_t)a3 startingAt:(id)a4 completionHandler:(id)a5
{
  v19[1] = *MEMORY[0x263EF8340];
  if (a4)
  {
    v19[0] = a4;
    id v9 = (void *)MEMORY[0x263EFF8C0];
    id v10 = a5;
    id v11 = a4;
    uint64_t v12 = [v9 arrayWithObjects:v19 count:1];
  }
  else
  {
    id v13 = a5;
    id v14 = 0;
    v15 = ANLogHandleLocalPlaybackSession();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      id v18 = &stru_26D2D46B0;
      _os_log_impl(&dword_220FAA000, v15, OS_LOG_TYPE_ERROR, "%@Client did not supply a Start Announcement ID", (uint8_t *)&v17, 0xCu);
    }

    uint64_t v12 = (void *)MEMORY[0x263EFFA68];
  }
  id v16 = +[ANPlaybackCommand playCommandWithOptions:a3 announcementIdentifiers:v12];

  [(ANLocalPlaybackSession *)self sendPlaybackCommand:v16 completionHandler:a5];
}

- (void)stopPlayingAnnouncements
{
}

- (void)stopPlayingAnnouncementsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[ANPlaybackCommand stopCommand];
  [(ANLocalPlaybackSession *)self sendPlaybackCommand:v5 completionHandler:v4];
}

- (void)nextAnnouncementWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[ANPlaybackCommand nextCommand];
  [(ANLocalPlaybackSession *)self sendPlaybackCommand:v5 completionHandler:v4];
}

- (void)previousAnnouncementWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[ANPlaybackCommand previousCommand];
  [(ANLocalPlaybackSession *)self sendPlaybackCommand:v5 completionHandler:v4];
}

- (void)lastPlayedAnnouncementInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(ANLocalPlaybackSession *)self xpcManager];
  id v6 = [v5 connection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __67__ANLocalPlaybackSession_lastPlayedAnnouncementInfoWithCompletion___block_invoke;
  v10[3] = &unk_264587078;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v6 remoteObjectProxyWithErrorHandler:v10];
  id v9 = [(ANLocalPlaybackSession *)self endpointIdentifier];
  [v8 lastPlayedAnnouncementInfoForEndpointID:v9 completionHandler:v7];
}

void __67__ANLocalPlaybackSession_lastPlayedAnnouncementInfoWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleLocalPlaybackSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    id v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    id v8 = "-[ANLocalPlaybackSession lastPlayedAnnouncementInfoWithCompletion:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSDictionary)lastPlayedAnnouncementInfo
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  id v3 = [(ANLocalPlaybackSession *)self xpcManager];
  id v4 = [v3 connection];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__ANLocalPlaybackSession_lastPlayedAnnouncementInfo__block_invoke;
  v10[3] = &unk_2645870A0;
  void v10[4] = &v11;
  int v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:v10];
  id v6 = [(ANLocalPlaybackSession *)self endpointIdentifier];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__ANLocalPlaybackSession_lastPlayedAnnouncementInfo__block_invoke_89;
  v9[3] = &unk_2645870C8;
  v9[4] = &v11;
  [v5 lastPlayedAnnouncementInfoForEndpointID:v6 completionHandler:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSDictionary *)v7;
}

void __52__ANLocalPlaybackSession_lastPlayedAnnouncementInfo__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleLocalPlaybackSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412802;
    id v8 = &stru_26D2D46B0;
    __int16 v9 = 2080;
    id v10 = "-[ANLocalPlaybackSession lastPlayedAnnouncementInfo]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = MEMORY[0x263EFFA78];
}

void __52__ANLocalPlaybackSession_lastPlayedAnnouncementInfo__block_invoke_89(uint64_t a1, void *a2)
{
}

+ (id)stringForPlaybackState:(unint64_t)a3
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_2645871B0[a3];
  }
}

- (unint64_t)playbackState
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = ANLogHandleLocalPlaybackSession();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = &stru_26D2D46B0;
    _os_log_impl(&dword_220FAA000, v3, OS_LOG_TYPE_DEFAULT, "%@Fetching playback state", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v4 = [(ANLocalPlaybackSession *)self xpcManager];
  uint64_t v5 = [v4 connection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__ANLocalPlaybackSession_playbackState__block_invoke;
  v11[3] = &unk_2645870A0;
  v11[4] = &buf;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v11];
  int v7 = [(ANLocalPlaybackSession *)self endpointIdentifier];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __39__ANLocalPlaybackSession_playbackState__block_invoke_103;
  v10[3] = &unk_2645870F0;
  void v10[4] = &buf;
  [v6 playbackStateForEndpointID:v7 completionHandler:v10];

  unint64_t v8 = *(void *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  return v8;
}

void __39__ANLocalPlaybackSession_playbackState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleLocalPlaybackSession();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    id v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    unint64_t v8 = "-[ANLocalPlaybackSession playbackState]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __39__ANLocalPlaybackSession_playbackState__block_invoke_103(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)announcementsWillStartPlaying:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v5 = ANLogHandleLocalPlaybackSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    int v17 = &stru_26D2D46B0;
    __int16 v18 = 2080;
    v19 = "-[ANLocalPlaybackSession announcementsWillStartPlaying:]";
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    _os_log_impl(&dword_220FAA000, v5, OS_LOG_TYPE_DEFAULT, "%@%s, time is %lld", buf, 0x20u);
  }

  id v6 = [(ANLocalPlaybackSession *)self delegate];
  if ([v6 conformsToProtocol:&unk_26D2E0958])
  {
    __int16 v7 = [(ANLocalPlaybackSession *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      objc_initWeak((id *)buf, self);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __56__ANLocalPlaybackSession_announcementsWillStartPlaying___block_invoke;
      v14[3] = &unk_264587118;
      objc_copyWeak(v15, (id *)buf);
      v15[1] = (id)a3;
      +[ANUtils asyncDispatchOnGlobalQueue:v14];
      objc_destroyWeak(v15);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
  }
  __int16 v9 = [(ANLocalPlaybackSession *)self delegate];
  if ([v9 conformsToProtocol:&unk_26D2E0958])
  {
    id v10 = [(ANLocalPlaybackSession *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      objc_initWeak((id *)buf, self);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __56__ANLocalPlaybackSession_announcementsWillStartPlaying___block_invoke_2;
      v12[3] = &unk_264587118;
      objc_copyWeak(v13, (id *)buf);
      v13[1] = (id)a3;
      +[ANUtils asyncDispatchOnGlobalQueue:v12];
      objc_destroyWeak(v13);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
  }
}

void __56__ANLocalPlaybackSession_announcementsWillStartPlaying___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  [v2 announcementsWillStartPlaying:*(void *)(a1 + 40)];
}

void __56__ANLocalPlaybackSession_announcementsWillStartPlaying___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  [v2 session:WeakRetained willStartPlayingAtMachTime:*(void *)(a1 + 40)];
}

- (void)announcementsStateUpdate:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v5 = ANLogHandleLocalPlaybackSession();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    int v17 = &stru_26D2D46B0;
    __int16 v18 = 2080;
    v19 = "-[ANLocalPlaybackSession announcementsStateUpdate:]";
    __int16 v20 = 2048;
    unint64_t v21 = a3;
    _os_log_impl(&dword_220FAA000, v5, OS_LOG_TYPE_DEFAULT, "%@%s, state is %lu", buf, 0x20u);
  }

  id v6 = [(ANLocalPlaybackSession *)self delegate];
  if ([v6 conformsToProtocol:&unk_26D2E0958])
  {
    __int16 v7 = [(ANLocalPlaybackSession *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      objc_initWeak((id *)buf, self);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __51__ANLocalPlaybackSession_announcementsStateUpdate___block_invoke;
      v14[3] = &unk_264587118;
      objc_copyWeak(v15, (id *)buf);
      v15[1] = (id)a3;
      +[ANUtils asyncDispatchOnGlobalQueue:v14];
      objc_destroyWeak(v15);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
  }
  __int16 v9 = [(ANLocalPlaybackSession *)self delegate];
  if ([v9 conformsToProtocol:&unk_26D2E0958])
  {
    id v10 = [(ANLocalPlaybackSession *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      objc_initWeak((id *)buf, self);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __51__ANLocalPlaybackSession_announcementsStateUpdate___block_invoke_2;
      v12[3] = &unk_264587118;
      objc_copyWeak(v13, (id *)buf);
      v13[1] = (id)a3;
      +[ANUtils asyncDispatchOnGlobalQueue:v12];
      objc_destroyWeak(v13);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
  }
}

void __51__ANLocalPlaybackSession_announcementsStateUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  [v2 announcementsStateUpdate:*(void *)(a1 + 40)];
}

void __51__ANLocalPlaybackSession_announcementsStateUpdate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  [v2 session:WeakRetained didUpdatePlaybackState:*(void *)(a1 + 40)];
}

- (void)didReceiveAnnouncement:(id)a3 forGroupID:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  char v8 = ANLogHandleLocalPlaybackSession();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v16 = &stru_26D2D46B0;
    __int16 v17 = 2080;
    __int16 v18 = "-[ANLocalPlaybackSession didReceiveAnnouncement:forGroupID:]";
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_220FAA000, v8, OS_LOG_TYPE_DEFAULT, "%@%s, did receive announcement: %@", buf, 0x20u);
  }

  __int16 v9 = [(ANLocalPlaybackSession *)self delegate];
  if ([v9 conformsToProtocol:&unk_26D2E0958])
  {
    id v10 = [(ANLocalPlaybackSession *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      objc_initWeak((id *)buf, self);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __60__ANLocalPlaybackSession_didReceiveAnnouncement_forGroupID___block_invoke;
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

void __60__ANLocalPlaybackSession_didReceiveAnnouncement_forGroupID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained delegate];
  [v2 session:WeakRetained didReceiveAnnouncement:*(void *)(a1 + 32)];
}

- (void)managerDidInterruptConnection:(id)a3
{
  id v4 = a3;
  int v5 = [(ANLocalPlaybackSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__ANLocalPlaybackSession_managerDidInterruptConnection___block_invoke;
    v11[3] = &unk_264587168;
    objc_copyWeak(&v12, &location);
    +[ANUtils asyncDispatchOnGlobalQueue:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  id v7 = [(ANLocalPlaybackSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__ANLocalPlaybackSession_managerDidInterruptConnection___block_invoke_2;
    v9[3] = &unk_264587168;
    objc_copyWeak(&v10, &location);
    +[ANUtils asyncDispatchOnGlobalQueue:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __56__ANLocalPlaybackSession_managerDidInterruptConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 connectionInterrupted];
}

void __56__ANLocalPlaybackSession_managerDidInterruptConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 sessionInterrupted:WeakRetained];
}

- (void)managerDidInvalidateConnection:(id)a3
{
  id v4 = a3;
  int v5 = [(ANLocalPlaybackSession *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __57__ANLocalPlaybackSession_managerDidInvalidateConnection___block_invoke;
    v11[3] = &unk_264587168;
    objc_copyWeak(&v12, &location);
    +[ANUtils asyncDispatchOnGlobalQueue:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  id v7 = [(ANLocalPlaybackSession *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__ANLocalPlaybackSession_managerDidInvalidateConnection___block_invoke_2;
    v9[3] = &unk_264587168;
    objc_copyWeak(&v10, &location);
    +[ANUtils asyncDispatchOnGlobalQueue:v9];
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __57__ANLocalPlaybackSession_managerDidInvalidateConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 connectionInvalidated];
}

void __57__ANLocalPlaybackSession_managerDidInvalidateConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 sessionInvalidated:WeakRetained];
}

- (void)checkInWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(ANLocalPlaybackSession *)self xpcManager];
  char v6 = [v5 connection];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  id v13[2] = __55__ANLocalPlaybackSession_checkInWithCompletionHandler___block_invoke;
  v13[3] = &unk_264587078;
  id v7 = v4;
  id v14 = v7;
  char v8 = [v6 remoteObjectProxyWithErrorHandler:v13];
  __int16 v9 = [(ANLocalPlaybackSession *)self endpointIdentifier];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__ANLocalPlaybackSession_checkInWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_264587190;
  id v12 = v7;
  id v10 = v7;
  [v8 resumeWithEndpointID:v9 completionHandler:v11];
}

uint64_t __55__ANLocalPlaybackSession_checkInWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__ANLocalPlaybackSession_checkInWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSUUID)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (ANLocalPlaybackSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ANLocalPlaybackSessionDelegate *)WeakRetained;
}

- (ANLocalPlaybackSessionInterfaceDelegateProxy)delegateProxy
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
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
}

@end