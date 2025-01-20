@interface ANAnnounce
- (ANAnnounce)init;
- (ANAnnounce)initWithEndpointIdentifier:(id)a3;
- (ANAnnounceDelegate)delegate;
- (BOOL)isAnnounceEnabledForAnyAccessoryInHome:(id)a3;
- (BOOL)isAnnounceEnabledForAnyAccessoryOrUserInHome:(id)a3;
- (BOOL)isEndpointWithUUID:(id)a3 inRoomWithName:(id)a4;
- (BOOL)isLocalDeviceInRoom:(id)a3;
- (NSArray)receivedAnnouncements;
- (NSArray)unplayedAnnouncements;
- (NSUUID)endpointIdentifier;
- (NSXPCConnection)connection;
- (id)announcementForID:(id)a3;
- (id)contextFromAnnouncement:(id)a3;
- (id)homeNamesForContext:(id)a3;
- (id)receivedAnnouncementIDs;
- (void)_sendRequestLegacy:(id)a3 completion:(id)a4;
- (void)announcementForID:(id)a3 reply:(id)a4;
- (void)broadcastReply:(id)a3 completion:(id)a4;
- (void)broadcastReply:(id)a3 forAnnouncement:(id)a4 completion:(id)a5;
- (void)broadcastReply:(id)a3 forAnnouncementID:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)getReceivedAnnouncementsWithCompletionHandler:(id)a3;
- (void)getScanningDeviceCandidates:(id)a3;
- (void)invalidate;
- (void)lastPlayedAnnouncementInfo:(id)a3;
- (void)localParticipant:(id)a3;
- (void)mockAnnouncement:(id)a3 forHomeWithName:(id)a4 playbackDeadline:(id)a5 completion:(id)a6;
- (void)prewarmWithHandler:(id)a3;
- (void)receivedAnnouncementIDs:(id)a3;
- (void)sendAnnouncement:(id)a3 toHomeWithID:(id)a4 completion:(id)a5;
- (void)sendAnnouncement:(id)a3 toHomeWithName:(id)a4 completion:(id)a5;
- (void)sendAnnouncement:(id)a3 toRoomsWithIDs:(id)a4 andZonesWithIDs:(id)a5 inHomeWithID:(id)a6 completion:(id)a7;
- (void)sendAnnouncement:(id)a3 toRoomsWithIDs:(id)a4 inHomeWithID:(id)a5 completion:(id)a6;
- (void)sendAnnouncement:(id)a3 toRoomsWithNames:(id)a4 andZonesWithNames:(id)a5 inHomeWithName:(id)a6 completion:(id)a7;
- (void)sendAnnouncement:(id)a3 toRoomsWithNames:(id)a4 inHomeWithName:(id)a5 completion:(id)a6;
- (void)sendAnnouncement:(id)a3 toZonesWithIDs:(id)a4 inHomeWithID:(id)a5 completion:(id)a6;
- (void)sendAnnouncement:(id)a3 toZonesWithNames:(id)a4 inHomeWithName:(id)a5 completion:(id)a6;
- (void)sendReply:(id)a3 forAnnouncement:(id)a4 completion:(id)a5;
- (void)sendRequest:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ANAnnounce

- (ANAnnounce)init
{
  return [(ANAnnounce *)self initWithEndpointIdentifier:0];
}

- (ANAnnounce)initWithEndpointIdentifier:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ANAnnounce;
  v6 = [(ANAnnounce *)&v21 init];
  if (v6)
  {
    v7 = ANLogHandleAnnounce();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v23 = &stru_26D2D46B0;
      __int16 v24 = 2112;
      v25 = @"com.apple.announced.server";
      _os_log_impl(&dword_220FAA000, v7, OS_LOG_TYPE_DEFAULT, "%@Creating Connection to %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_endpointIdentifier, a3);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.announced.server" options:4096];
    connection = v6->_connection;
    v6->_connection = (NSXPCConnection *)v8;

    v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D2E3318];
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    [v10 setClasses:v13 forSelector:sel_getReceivedAnnouncementsForEndpointID_completionHandler_ argumentIndex:0 ofReply:1];
    [v10 setClasses:v13 forSelector:sel_getUnplayedAnnouncementsForEndpointID_completionHandler_ argumentIndex:0 ofReply:1];
    [v10 setClass:objc_opt_class() forSelector:sel_sendRequest_completion_ argumentIndex:0 ofReply:1];
    [v10 setClass:objc_opt_class() forSelector:sel_sendRequestLegacy_completion_ argumentIndex:0 ofReply:1];
    [(NSXPCConnection *)v6->_connection setRemoteObjectInterface:v10];
    objc_initWeak((id *)buf, v6);
    v14 = v6->_connection;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __41__ANAnnounce_initWithEndpointIdentifier___block_invoke;
    v19[3] = &unk_264587168;
    objc_copyWeak(&v20, (id *)buf);
    [(NSXPCConnection *)v14 setInterruptionHandler:v19];
    v15 = v6->_connection;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __41__ANAnnounce_initWithEndpointIdentifier___block_invoke_2;
    v17[3] = &unk_264587168;
    objc_copyWeak(&v18, (id *)buf);
    [(NSXPCConnection *)v15 setInvalidationHandler:v17];
    [(NSXPCConnection *)v6->_connection resume];
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  return v6;
}

void __41__ANAnnounce_initWithEndpointIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = &stru_26D2D46B0;
    _os_log_impl(&dword_220FAA000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection to Announced was interrupted", buf, 0xCu);
  }

  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__ANAnnounce_initWithEndpointIdentifier___block_invoke_87;
  v3[3] = &unk_264587168;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  +[ANUtils asyncDispatchOnGlobalQueue:v3];
  objc_destroyWeak(&v4);
}

void __41__ANAnnounce_initWithEndpointIdentifier___block_invoke_87(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 connectionInterrupted];
}

void __41__ANAnnounce_initWithEndpointIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = &stru_26D2D46B0;
    _os_log_impl(&dword_220FAA000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection to Announced was invalidated", buf, 0xCu);
  }

  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__ANAnnounce_initWithEndpointIdentifier___block_invoke_89;
  v3[3] = &unk_264587168;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  +[ANUtils asyncDispatchOnGlobalQueue:v3];
  objc_destroyWeak(&v4);
}

void __41__ANAnnounce_initWithEndpointIdentifier___block_invoke_89(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 connectionInvalidated];
}

- (void)dealloc
{
  [(ANAnnounce *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ANAnnounce;
  [(ANAnnounce *)&v3 dealloc];
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_delegate, 0);
  id v3 = [(ANAnnounce *)self connection];
  [v3 invalidate];
}

- (void)localParticipant:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __31__ANAnnounce_localParticipant___block_invoke;
  v8[3] = &unk_264587078;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v8];
  [v7 localParticipant:v6];
}

void __31__ANAnnounce_localParticipant___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412802;
    uint64_t v8 = &stru_26D2D46B0;
    __int16 v9 = 2080;
    v10 = "-[ANAnnounce localParticipant:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = objc_opt_new();
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

- (void)sendRequest:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = &stru_26D2D46B0;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_220FAA000, v8, OS_LOG_TYPE_DEFAULT, "%@Sending Request: %@", buf, 0x16u);
  }

  connection = self->_connection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __37__ANAnnounce_sendRequest_completion___block_invoke;
  v15[3] = &unk_264587078;
  id v10 = v7;
  id v16 = v10;
  __int16 v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __37__ANAnnounce_sendRequest_completion___block_invoke_94;
  v13[3] = &unk_2645871D0;
  id v14 = v10;
  id v12 = v10;
  [v11 sendRequest:v6 completion:v13];
}

void __37__ANAnnounce_sendRequest_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412802;
    id v7 = &stru_26D2D46B0;
    __int16 v8 = 2080;
    __int16 v9 = "-[ANAnnounce sendRequest:completion:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __37__ANAnnounce_sendRequest_completion___block_invoke_94(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ANLogHandleAnnounce();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412802;
      __int16 v10 = &stru_26D2D46B0;
      __int16 v11 = 2080;
      uint64_t v12 = "-[ANAnnounce sendRequest:completion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_220FAA000, v7, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)sendAnnouncement:(id)a3 toHomeWithName:(id)a4 completion:(id)a5
{
}

- (void)sendAnnouncement:(id)a3 toRoomsWithNames:(id)a4 andZonesWithNames:(id)a5 inHomeWithName:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v18 = +[ANAnnouncementContent contentWithAudioFileURL:a3];
  id v16 = +[ANAnnouncementDestination destinationWithHomeName:v13 zoneNames:v14 roomNames:v15];

  v17 = +[ANAnnouncementRequest requestWithContent:v18 destination:v16];
  [(ANAnnounce *)self _sendRequestLegacy:v17 completion:v12];
}

- (void)sendAnnouncement:(id)a3 toHomeWithID:(id)a4 completion:(id)a5
{
}

- (void)sendAnnouncement:(id)a3 toRoomsWithIDs:(id)a4 andZonesWithIDs:(id)a5 inHomeWithID:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v18 = +[ANAnnouncementContent contentWithAudioFileURL:a3];
  id v16 = +[ANAnnouncementDestination destinationWithHomeIdentifier:v13 zoneIdentifiers:v14 roomIdentifiers:v15];

  v17 = +[ANAnnouncementRequest requestWithContent:v18 destination:v16];
  [(ANAnnounce *)self _sendRequestLegacy:v17 completion:v12];
}

- (void)sendReply:(id)a3 forAnnouncement:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v13 = +[ANAnnouncementContent contentWithAudioFileURL:a3];
  __int16 v10 = [v9 identifier];

  __int16 v11 = +[ANAnnouncementDestination destinationWithReplyToAnnouncementIdentifier:v10];

  [v11 setReplyToSender:1];
  id v12 = +[ANAnnouncementRequest requestWithContent:v13 destination:v11];
  [(ANAnnounce *)self _sendRequestLegacy:v12 completion:v8];
}

- (void)broadcastReply:(id)a3 forAnnouncement:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 identifier];
  [(ANAnnounce *)self broadcastReply:v9 forAnnouncementID:v10 completion:v8];
}

- (void)broadcastReply:(id)a3 forAnnouncementID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v12 = +[ANAnnouncementContent contentWithAudioFileURL:a3];
  id v10 = +[ANAnnouncementDestination destinationWithReplyToAnnouncementIdentifier:v9];

  __int16 v11 = +[ANAnnouncementRequest requestWithContent:v12 destination:v10];
  [(ANAnnounce *)self _sendRequestLegacy:v11 completion:v8];
}

- (void)broadcastReply:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v9 = +[ANAnnouncementContent contentWithAudioFileURL:a3];
  id v7 = +[ANAnnouncementDestination destinationWithReplyToAnnouncementIdentifier:0];
  id v8 = +[ANAnnouncementRequest requestWithContent:v9 destination:v7];
  [(ANAnnounce *)self _sendRequestLegacy:v8 completion:v6];
}

- (void)receivedAnnouncementIDs:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__ANAnnounce_receivedAnnouncementIDs___block_invoke;
  v9[3] = &unk_264587078;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  id v8 = [(ANAnnounce *)self endpointIdentifier];
  [v7 receivedAnnouncementIdentifiersForEndpointID:v8 reply:v6];
}

void __38__ANAnnounce_receivedAnnouncementIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    id v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    id v8 = "-[ANAnnounce receivedAnnouncementIDs:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)receivedAnnouncementIDs
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__0;
  id v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __37__ANAnnounce_receivedAnnouncementIDs__block_invoke;
  v9[3] = &unk_2645870A0;
  void v9[4] = &v10;
  id v4 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  int v5 = [(ANAnnounce *)self endpointIdentifier];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__ANAnnounce_receivedAnnouncementIDs__block_invoke_99;
  v8[3] = &unk_2645871F8;
  void v8[4] = &v10;
  [v4 receivedAnnouncementIdentifiersForEndpointID:v5 reply:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __37__ANAnnounce_receivedAnnouncementIDs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412802;
    id v8 = &stru_26D2D46B0;
    __int16 v9 = 2080;
    uint64_t v10 = "-[ANAnnounce receivedAnnouncementIDs]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = MEMORY[0x263EFFA68];
}

void __37__ANAnnounce_receivedAnnouncementIDs__block_invoke_99(uint64_t a1, void *a2)
{
}

- (void)announcementForID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  connection = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __38__ANAnnounce_announcementForID_reply___block_invoke;
  v12[3] = &unk_264587078;
  id v13 = v6;
  id v8 = v6;
  id v9 = a3;
  uint64_t v10 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v12];
  __int16 v11 = [(ANAnnounce *)self endpointIdentifier];
  [v10 announcementForID:v9 endpointID:v11 reply:v8];
}

void __38__ANAnnounce_announcementForID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    id v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    id v8 = "-[ANAnnounce announcementForID:reply:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)announcementForID:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__0;
  id v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  int v5 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_2];
  id v6 = [(ANAnnounce *)self endpointIdentifier];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __32__ANAnnounce_announcementForID___block_invoke_101;
  v9[3] = &unk_264587240;
  void v9[4] = &v10;
  [v5 announcementForID:v4 endpointID:v6 reply:v9];

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __32__ANAnnounce_announcementForID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412802;
    int v5 = &stru_26D2D46B0;
    __int16 v6 = 2080;
    id v7 = "-[ANAnnounce announcementForID:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_220FAA000, v3, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v4, 0x20u);
  }
}

void __32__ANAnnounce_announcementForID___block_invoke_101(uint64_t a1, void *a2)
{
}

- (void)getReceivedAnnouncementsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__ANAnnounce_getReceivedAnnouncementsWithCompletionHandler___block_invoke;
  v9[3] = &unk_264587078;
  id v10 = v4;
  id v6 = v4;
  id v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v9];
  __int16 v8 = [(ANAnnounce *)self endpointIdentifier];
  [v7 getReceivedAnnouncementsForEndpointID:v8 completionHandler:v6];
}

void __60__ANAnnounce_getReceivedAnnouncementsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    id v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    __int16 v8 = "-[ANAnnounce getReceivedAnnouncementsWithCompletionHandler:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)receivedAnnouncements
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__0;
  id v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__ANAnnounce_receivedAnnouncements__block_invoke;
  v9[3] = &unk_2645870A0;
  void v9[4] = &v10;
  id v4 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  int v5 = [(ANAnnounce *)self endpointIdentifier];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__ANAnnounce_receivedAnnouncements__block_invoke_103;
  v8[3] = &unk_2645871F8;
  void v8[4] = &v10;
  [v4 getReceivedAnnouncementsForEndpointID:v5 completionHandler:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSArray *)v6;
}

void __35__ANAnnounce_receivedAnnouncements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412802;
    __int16 v8 = &stru_26D2D46B0;
    __int16 v9 = 2080;
    uint64_t v10 = "-[ANAnnounce receivedAnnouncements]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = MEMORY[0x263EFFA68];
}

void __35__ANAnnounce_receivedAnnouncements__block_invoke_103(uint64_t a1, void *a2)
{
}

- (NSArray)unplayedAnnouncements
{
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = __Block_byref_object_copy__0;
  id v14 = __Block_byref_object_dispose__0;
  id v15 = 0;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __35__ANAnnounce_unplayedAnnouncements__block_invoke;
  v9[3] = &unk_2645870A0;
  void v9[4] = &v10;
  id v4 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  uint64_t v5 = [(ANAnnounce *)self endpointIdentifier];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__ANAnnounce_unplayedAnnouncements__block_invoke_104;
  v8[3] = &unk_2645871F8;
  void v8[4] = &v10;
  [v4 getUnplayedAnnouncementsForEndpointID:v5 completionHandler:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return (NSArray *)v6;
}

void __35__ANAnnounce_unplayedAnnouncements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412802;
    __int16 v8 = &stru_26D2D46B0;
    __int16 v9 = 2080;
    uint64_t v10 = "-[ANAnnounce unplayedAnnouncements]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = MEMORY[0x263EFFA68];
}

void __35__ANAnnounce_unplayedAnnouncements__block_invoke_104(uint64_t a1, void *a2)
{
}

- (void)mockAnnouncement:(id)a3 forHomeWithName:(id)a4 playbackDeadline:(id)a5 completion:(id)a6
{
  id v10 = a6;
  connection = self->_connection;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __75__ANAnnounce_mockAnnouncement_forHomeWithName_playbackDeadline_completion___block_invoke;
  v20[3] = &unk_264587078;
  id v12 = v10;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __75__ANAnnounce_mockAnnouncement_forHomeWithName_playbackDeadline_completion___block_invoke_105;
  v18[3] = &unk_264587268;
  id v19 = v12;
  id v17 = v12;
  [v16 mockAnnouncement:v15 forHomeWithName:v14 playbackDeadline:v13 completion:v18];
}

void __75__ANAnnounce_mockAnnouncement_forHomeWithName_playbackDeadline_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412802;
    int v7 = &stru_26D2D46B0;
    __int16 v8 = 2080;
    __int16 v9 = "-[ANAnnounce mockAnnouncement:forHomeWithName:playbackDeadline:completion:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __75__ANAnnounce_mockAnnouncement_forHomeWithName_playbackDeadline_completion___block_invoke_105(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = ANLogHandleAnnounce();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412802;
      __int16 v10 = &stru_26D2D46B0;
      __int16 v11 = 2080;
      uint64_t v12 = "-[ANAnnounce mockAnnouncement:forHomeWithName:playbackDeadline:completion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_220FAA000, v7, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)getScanningDeviceCandidates:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __42__ANAnnounce_getScanningDeviceCandidates___block_invoke;
  v8[3] = &unk_264587078;
  id v9 = v4;
  id v6 = v4;
  int v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v8];
  [v7 getScanningDeviceCandidates:v6];
}

void __42__ANAnnounce_getScanningDeviceCandidates___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412802;
    uint64_t v8 = &stru_26D2D46B0;
    __int16 v9 = 2080;
    __int16 v10 = "-[ANAnnounce getScanningDeviceCandidates:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [MEMORY[0x263EFFA08] set];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

- (id)contextFromAnnouncement:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  __int16 v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__0;
  uint64_t v13 = __Block_byref_object_dispose__0;
  id v14 = 0;
  uint64_t v5 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_108];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __38__ANAnnounce_contextFromAnnouncement___block_invoke_109;
  v8[3] = &unk_264587290;
  void v8[4] = &v9;
  [v5 contextFromAnnouncement:v4 reply:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __38__ANAnnounce_contextFromAnnouncement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412802;
    uint64_t v5 = &stru_26D2D46B0;
    __int16 v6 = 2080;
    int v7 = "-[ANAnnounce contextFromAnnouncement:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_impl(&dword_220FAA000, v3, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v4, 0x20u);
  }
}

void __38__ANAnnounce_contextFromAnnouncement___block_invoke_109(uint64_t a1, void *a2)
{
}

- (id)homeNamesForContext:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  connection = self->_connection;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __34__ANAnnounce_homeNamesForContext___block_invoke;
  v10[3] = &unk_2645870A0;
  v10[4] = &v11;
  __int16 v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__ANAnnounce_homeNamesForContext___block_invoke_111;
  v9[3] = &unk_2645871F8;
  void v9[4] = &v11;
  [v6 homeNamesForContext:v4 reply:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __34__ANAnnounce_homeNamesForContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412802;
    __int16 v8 = &stru_26D2D46B0;
    __int16 v9 = 2080;
    uint64_t v10 = "-[ANAnnounce homeNamesForContext:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v7, 0x20u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = MEMORY[0x263EFFA68];
}

void __34__ANAnnounce_homeNamesForContext___block_invoke_111(uint64_t a1, void *a2)
{
}

- (BOOL)isLocalDeviceInRoom:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __34__ANAnnounce_isLocalDeviceInRoom___block_invoke;
  v9[3] = &unk_2645870A0;
  void v9[4] = &v10;
  __int16 v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__ANAnnounce_isLocalDeviceInRoom___block_invoke_112;
  v8[3] = &unk_2645872B8;
  void v8[4] = &v10;
  [v6 isLocalDeviceInRoom:v4 reply:v8];

  LOBYTE(v6) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v6;
}

void __34__ANAnnounce_isLocalDeviceInRoom___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    __int16 v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    __int16 v8 = "-[ANAnnounce isLocalDeviceInRoom:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __34__ANAnnounce_isLocalDeviceInRoom___block_invoke_112(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isEndpointWithUUID:(id)a3 inRoomWithName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  connection = self->_connection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __48__ANAnnounce_isEndpointWithUUID_inRoomWithName___block_invoke;
  v12[3] = &unk_2645870A0;
  void v12[4] = &v13;
  __int16 v9 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v12];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __48__ANAnnounce_isEndpointWithUUID_inRoomWithName___block_invoke_114;
  v11[3] = &unk_2645872B8;
  v11[4] = &v13;
  [v9 isEndpointWithUUID:v6 inRoomWithName:v7 reply:v11];

  LOBYTE(v9) = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)v9;
}

void __48__ANAnnounce_isEndpointWithUUID_inRoomWithName___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    id v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    __int16 v8 = "-[ANAnnounce isEndpointWithUUID:inRoomWithName:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __48__ANAnnounce_isEndpointWithUUID_inRoomWithName___block_invoke_114(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isAnnounceEnabledForAnyAccessoryInHome:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__ANAnnounce_isAnnounceEnabledForAnyAccessoryInHome___block_invoke;
  v9[3] = &unk_2645870A0;
  void v9[4] = &v10;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__ANAnnounce_isAnnounceEnabledForAnyAccessoryInHome___block_invoke_115;
  v8[3] = &unk_2645872B8;
  void v8[4] = &v10;
  [v6 isAnnounceEnabledForAnyAccessoryInHome:v4 reply:v8];

  LOBYTE(v6) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v6;
}

void __53__ANAnnounce_isAnnounceEnabledForAnyAccessoryInHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    id v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    __int16 v8 = "-[ANAnnounce isAnnounceEnabledForAnyAccessoryInHome:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __53__ANAnnounce_isAnnounceEnabledForAnyAccessoryInHome___block_invoke_115(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)isAnnounceEnabledForAnyAccessoryOrUserInHome:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  connection = self->_connection;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __59__ANAnnounce_isAnnounceEnabledForAnyAccessoryOrUserInHome___block_invoke;
  v9[3] = &unk_2645870A0;
  void v9[4] = &v10;
  id v6 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__ANAnnounce_isAnnounceEnabledForAnyAccessoryOrUserInHome___block_invoke_116;
  v8[3] = &unk_2645872B8;
  void v8[4] = &v10;
  [v6 isAnnounceEnabledForAnyAccessoryOrUserInHome:v4 reply:v8];

  LOBYTE(v6) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v6;
}

void __59__ANAnnounce_isAnnounceEnabledForAnyAccessoryOrUserInHome___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    id v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    __int16 v8 = "-[ANAnnounce isAnnounceEnabledForAnyAccessoryOrUserInHome:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

uint64_t __59__ANAnnounce_isAnnounceEnabledForAnyAccessoryOrUserInHome___block_invoke_116(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)prewarmWithHandler:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __33__ANAnnounce_prewarmWithHandler___block_invoke;
  v11[3] = &unk_264587078;
  id v6 = v4;
  id v12 = v6;
  __int16 v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v11];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __33__ANAnnounce_prewarmWithHandler___block_invoke_117;
  v9[3] = &unk_264587078;
  id v10 = v6;
  id v8 = v6;
  [v7 prewarm:v9];
}

void __33__ANAnnounce_prewarmWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412802;
    __int16 v7 = &stru_26D2D46B0;
    __int16 v8 = 2080;
    __int16 v9 = "-[ANAnnounce prewarmWithHandler:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

void __33__ANAnnounce_prewarmWithHandler___block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    id v4 = ANLogHandleAnnounce();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412802;
      __int16 v7 = &stru_26D2D46B0;
      __int16 v8 = 2080;
      __int16 v9 = "-[ANAnnounce prewarmWithHandler:]_block_invoke";
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

- (void)_sendRequestLegacy:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v18 = &stru_26D2D46B0;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_220FAA000, v8, OS_LOG_TYPE_DEFAULT, "%@Sending Request (Legacy): %@", buf, 0x16u);
  }

  connection = self->_connection;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __44__ANAnnounce__sendRequestLegacy_completion___block_invoke;
  v15[3] = &unk_264587078;
  id v10 = v7;
  id v16 = v10;
  id v11 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v15];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __44__ANAnnounce__sendRequestLegacy_completion___block_invoke_118;
  v13[3] = &unk_264587268;
  id v14 = v10;
  id v12 = v10;
  [v11 sendRequestLegacy:v6 completion:v13];
}

void __44__ANAnnounce__sendRequestLegacy_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412802;
    id v7 = &stru_26D2D46B0;
    __int16 v8 = 2080;
    __int16 v9 = "-[ANAnnounce _sendRequestLegacy:completion:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v6, 0x20u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __44__ANAnnounce__sendRequestLegacy_completion___block_invoke_118(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = ANLogHandleAnnounce();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412802;
      __int16 v10 = &stru_26D2D46B0;
      __int16 v11 = 2080;
      uint64_t v12 = "-[ANAnnounce _sendRequestLegacy:completion:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_220FAA000, v7, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)sendAnnouncement:(id)a3 toRoomsWithNames:(id)a4 inHomeWithName:(id)a5 completion:(id)a6
{
}

- (void)sendAnnouncement:(id)a3 toZonesWithNames:(id)a4 inHomeWithName:(id)a5 completion:(id)a6
{
}

- (void)sendAnnouncement:(id)a3 toRoomsWithIDs:(id)a4 inHomeWithID:(id)a5 completion:(id)a6
{
}

- (void)sendAnnouncement:(id)a3 toZonesWithIDs:(id)a4 inHomeWithID:(id)a5 completion:(id)a6
{
}

- (void)lastPlayedAnnouncementInfo:(id)a3
{
  id v4 = a3;
  connection = self->_connection;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__ANAnnounce_lastPlayedAnnouncementInfo___block_invoke;
  v8[3] = &unk_264587078;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(NSXPCConnection *)connection remoteObjectProxyWithErrorHandler:v8];
  [v7 lastPlayedAnnouncementInfo:v6];
}

void __41__ANAnnounce_lastPlayedAnnouncementInfo___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = ANLogHandleAnnounce();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 138412802;
    id v6 = &stru_26D2D46B0;
    __int16 v7 = 2080;
    uint64_t v8 = "-[ANAnnounce lastPlayedAnnouncementInfo:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_220FAA000, v4, OS_LOG_TYPE_ERROR, "%@%s: %@", (uint8_t *)&v5, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (ANAnnounceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ANAnnounceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSUUID)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end