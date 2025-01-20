@interface GKViceroyTransport
- (BOOL)connectToGuestPlayer:(id)a3 withHostPlayer:(id)a4;
- (BOOL)sendScopedData:(id)a3 toPlayers:(id)a4 dataMode:(int64_t)a5 dataScope:(int64_t)a6 transportContext:(id)a7 error:(id *)a8;
- (BOOL)sendScopedDataToAll:(id)a3 dataMode:(int64_t)a4 dataScope:(int64_t)a5 transportContext:(id)a6 error:(id *)a7;
- (GKConnection)connection;
- (GKTransportClientDelegate)clientDelegate;
- (GKViceroyLeaderElector)leaderElector;
- (GKViceroyRelay)relay;
- (GKViceroySession)session;
- (GKViceroyTransport)initWithClientDelegate:(id)a3 matchDataDelegate:(id)a4 daemonProxy:(id)a5;
- (NSData)nearbyConnectionData;
- (NSData)selfBlob;
- (NSMutableDictionary)guestConnections;
- (NSMutableDictionary)guestSessions;
- (id)enrichPeerDictionariesForPlayersConnection:(id)a3;
- (id)peerIdFromPlayer:(id)a3;
- (id)playerIDFromPeerID:(id)a3;
- (id)playerIDFromSession:(id)a3;
- (id)voiceChatWithName:(id)a3 players:(id)a4 transportContext:(id)a5;
- (void)acceptRelayResponse:(id)a3 playerID:(id)a4;
- (void)chooseBestHostingPlayerWithTransportContext:(id)a3 completionHandler:(id)a4;
- (void)connectToNearbyPlayer:(id)a3 withConnectionData:(id)a4;
- (void)connectToPlayersWithTransportContext:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)disconnectAllWithTransportContext:(id)a3 completionHandler:(id)a4;
- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4;
- (void)initSessionIfNeeded;
- (void)localConnectionDataWithCompletionHandler:(id)a3;
- (void)preemptRelay:(id)a3;
- (void)receiveData:(id)a3 fromPeer:(id)a4 inSession:(id)a5 context:(void *)a6;
- (void)session:(id)a3 connectionWithPeerFailed:(id)a4 withError:(id)a5;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 initiateRelay:(id)a4 forPeer:(id)a5;
- (void)session:(id)a3 networkStatisticsChanged:(id)a4;
- (void)session:(id)a3 peer:(id)a4 didChangeState:(int)a5;
- (void)session:(id)a3 updateRelay:(id)a4 forPeer:(id)a5;
- (void)setClientDelegate:(id)a3;
- (void)setConnection:(id)a3;
- (void)setGuestConnections:(id)a3;
- (void)setGuestSessions:(id)a3;
- (void)setLeaderElector:(id)a3;
- (void)setRelay:(id)a3;
- (void)setSelfBlob:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation GKViceroyTransport

- (GKViceroyTransport)initWithClientDelegate:(id)a3 matchDataDelegate:(id)a4 daemonProxy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)GKViceroyTransport;
  v11 = [(GKViceroyTransport *)&v30 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_weakClientDelegate, v8);
    id v13 = objc_alloc(MEMORY[0x1E4F63B30]);
    v14 = +[GKLocalPlayer local];
    v15 = [v14 internal];
    v16 = [v15 playerID];
    uint64_t v17 = [v13 initWithParticipantID:v16];
    connection = v12->_connection;
    v12->_connection = (GKConnection *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
    guestConnections = v12->_guestConnections;
    v12->_guestConnections = (NSMutableDictionary *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    guestSessions = v12->_guestSessions;
    v12->_guestSessions = (NSMutableDictionary *)v21;

    v23 = [[GKViceroyLeaderElector alloc] initWithMatchDataDelegate:v9];
    leaderElector = v12->_leaderElector;
    v12->_leaderElector = v23;

    v25 = [GKViceroyRelay alloc];
    v26 = [(GKViceroyTransport *)v12 connection];
    uint64_t v27 = [(GKViceroyRelay *)v25 initWithClientDelegate:v8 connection:v26 matchDataDelegate:v9 daemonProxy:v10];
    relay = v12->_relay;
    v12->_relay = (GKViceroyRelay *)v27;
  }
  return v12;
}

- (void)initSessionIfNeeded
{
  id v3 = a1;
  v4 = [a2 session];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2D22000, v5, v6, "[GKViceroyTransport] A new session (%p) has been created", v7, v8, v9, v10, v11);
}

- (void)dealloc
{
  [(GKViceroyTransport *)self setLeaderElector:0];
  [(GKViceroyTransport *)self setSession:0];
  [(GKViceroyTransport *)self setClientDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)GKViceroyTransport;
  [(GKViceroyTransport *)&v3 dealloc];
}

- (void)connectToNearbyPlayer:(id)a3 withConnectionData:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 referenceKey];
  uint64_t v10 = v7;
  v11[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  uint64_t v9 = [(GKViceroyTransport *)self connection];
  [v9 connectParticipantsWithConnectionData:v8 withSessionInfo:0];

  [(GKViceroyTransport *)self initSessionIfNeeded];
}

- (void)connectToPlayersWithTransportContext:(id)a3 completionHandler:(id)a4
{
  v23 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v25 = (void (**)(id, void))a4;
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v7 = [v5 peerDictionaries];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "objectForKey:", @"peer-id", v23);
        v14 = [v12 objectForKey:@"peer-blob"];
        [v6 setObject:v14 forKey:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v9);
  }

  if (!os_log_GKGeneral) {
    id v15 = GKOSLoggers();
  }
  v16 = os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    _os_log_impl(&dword_1C2D22000, v16, OS_LOG_TYPE_INFO, "[GKViceroyTransport] Connecting to participants with connectionData %@", buf, 0xCu);
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", v23);
  v18 = [v5 sessionToken];

  if (v18)
  {
    uint64_t v19 = [v5 sessionToken];
    [v17 setObject:v19 forKey:*MEMORY[0x1E4F63B20]];
  }
  v20 = [v5 cdxTicket];

  if (v20)
  {
    uint64_t v21 = [v5 cdxTicket];
    [v17 setObject:v21 forKey:*MEMORY[0x1E4F63B18]];
  }
  v22 = [v24 connection];
  [v22 connectParticipantsWithConnectionData:v6 withSessionInfo:v17];

  [v24 initSessionIfNeeded];
  v25[2](v25, 0);
}

- (BOOL)connectToGuestPlayer:(id)a3 withHostPlayer:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a3 internal];
  uint64_t v8 = [v7 playerID];

  uint64_t v9 = [(GKViceroyTransport *)self guestConnections];
  uint64_t v10 = [v9 objectForKeyedSubscript:v8];

  if (!v10)
  {
    uint8_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F63B30]) initWithParticipantID:v8];
    v12 = [(GKViceroyTransport *)self connection];
    id v13 = [v12 getLocalConnectionDataForLocalGaming];

    v14 = [v11 getLocalConnectionDataForLocalGaming];
    id v15 = [(GKViceroyTransport *)self connection];
    long long v26 = v8;
    v27[0] = v14;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
    [v15 connectParticipantsWithConnectionData:v16 withSessionInfo:0];

    uint64_t v17 = [v6 internal];
    v18 = [v17 playerID];
    v24 = v18;
    v25 = v13;
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [v11 connectParticipantsWithConnectionData:v19 withSessionInfo:0];

    v20 = [(GKViceroyTransport *)self guestConnections];
    [v20 setObject:v11 forKeyedSubscript:v8];

    [(GKViceroyTransport *)self initSessionIfNeeded];
    uint64_t v21 = [[GKViceroySession alloc] initWithConnection:v11 delegate:self];
    v22 = [(GKViceroyTransport *)self guestSessions];
    [v22 setObject:v21 forKeyedSubscript:v8];
  }
  return v10 == 0;
}

- (void)disconnectAllWithTransportContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  uint64_t v9 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "[GKViceroyTransport] disconnectAll", buf, 2u);
  }
  uint64_t v10 = [(GKViceroyTransport *)self relay];
  [v10 disconnect];

  uint8_t v11 = [(GKViceroyTransport *)self session];
  [v11 disconnectFromAllPeers];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = [(GKViceroyTransport *)self guestSessions];
  id v13 = [v12 allValues];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v18 disconnectFromAllPeers];
        [v18 setDataReceiveHandler:0 withContext:0];
        [v18 disconnectFromAllPeers];
        [v18 setDelegate:0];
        [v18 setPrivateDelegate:0];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [(GKViceroyTransport *)self guestSessions];
  [v19 removeAllObjects];

  v20 = [(GKViceroyTransport *)self guestConnections];
  [v20 removeAllObjects];

  v7[2](v7, 0);
}

- (id)enrichPeerDictionariesForPlayersConnection:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(GKViceroyTransport *)self selfBlob];
  *((void *)&v17 + 1) = v5;
  if (v5)
  {
    *(void *)&long long v17 = [MEMORY[0x1E4F63B30] externalAddressForSelfConnectionData:v5];
  }
  else
  {
    *(void *)&long long v17 = 0;
  }
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(obj);
        }
        uint8_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v12 = [v11 objectForKey:@"peer-id"];
        id v13 = [(GKViceroyTransport *)self playerIDFromPeerID:v12];
        if (v13) {
          BOOL v14 = 1;
        }
        else {
          BOOL v14 = v17 != 0;
        }
        if (v14)
        {
          uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v11];
          [v15 setValue:*((void *)&v17 + 1) forKey:@"self-blob"];
          [v15 setValue:(void)v17 forKey:@"self-nat-ip"];
          [v15 setValue:v13 forKey:@"player-id"];
          [v6 addObject:v15];
        }
        else
        {
          [v6 addObject:v11];
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v6;
}

- (void)localConnectionDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(GKViceroyTransport *)self connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__GKViceroyTransport_localConnectionDataWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E646D900;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 getLocalConnectionDataWithCompletionHandler:v7];
}

void __63__GKViceroyTransport_localConnectionDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5) {
    [*(id *)(a1 + 32) setSelfBlob:v5];
  }
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __63__GKViceroyTransport_localConnectionDataWithCompletionHandler___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSData)nearbyConnectionData
{
  v2 = [(GKViceroyTransport *)self connection];
  objc_super v3 = [v2 getLocalConnectionDataForLocalGaming];

  return (NSData *)v3;
}

- (id)peerIdFromPlayer:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroyTransport *)self connection];
  id v6 = [v4 internal];
  id v7 = [v6 playerID];
  id v16 = 0;
  int v8 = [v5 convertParticipantID:v7 toPeerID:&v16];
  id v9 = v16;

  uint64_t v10 = os_log_GKGeneral;
  if (v8)
  {
    if (!os_log_GKGeneral)
    {
      id v11 = GKOSLoggers();
      uint64_t v10 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      [(GKViceroyTransport *)(uint64_t)v9 peerIdFromPlayer:v4];
    }
    id v12 = v9;
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      id v13 = GKOSLoggers();
      uint64_t v10 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[GKViceroyTransport peerIdFromPlayer:](v10, v4);
    }
    BOOL v14 = [v4 internal];
    id v12 = [v14 playerID];
  }

  return v12;
}

- (id)playerIDFromPeerID:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroyTransport *)self connection];
  id v16 = 0;
  int v6 = [v5 convertPeerID:v4 toParticipantID:&v16];
  id v7 = v16;

  int v8 = os_log_GKGeneral;
  if (v6)
  {
    if (!os_log_GKGeneral)
    {
      id v9 = GKOSLoggers();
      int v8 = os_log_GKGeneral;
    }
    BOOL v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    id v11 = v7;
    if (v10)
    {
      -[GKViceroyTransport playerIDFromPeerID:]();
      id v11 = v7;
    }
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      id v12 = GKOSLoggers();
      int v8 = os_log_GKGeneral;
    }
    BOOL v13 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    id v11 = v4;
    if (v13)
    {
      -[GKViceroyTransport playerIDFromPeerID:]();
      id v11 = v4;
    }
  }
  id v14 = v11;

  return v14;
}

- (id)playerIDFromSession:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(GKViceroyTransport *)self guestSessions];
  int v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [(GKViceroyTransport *)self guestSessions];
        BOOL v13 = [v12 objectForKeyedSubscript:v11];

        if ([v13 isWrappingGKSession:v4])
        {
          id v14 = v11;

          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)sendScopedData:(id)a3 toPlayers:(id)a4 dataMode:(int64_t)a5 dataScope:(int64_t)a6 transportContext:(id)a7 error:(id *)a8
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = [(GKViceroyTransport *)self peerIdFromPlayer:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        if (v20) {
          [v14 addObject:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v17);
  }

  if ([v14 count])
  {
    uint64_t v21 = [(GKViceroyTransport *)self session];
    char v22 = [v21 sendData:v12 toPeers:v14 withDataMode:a5 error:a8];
  }
  else
  {
    long long v23 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v24 = GKOSLoggers();
      long long v23 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v26 = 0;
      _os_log_impl(&dword_1C2D22000, v23, OS_LOG_TYPE_DEFAULT, "[GKViceroyTransport] sendData toPlayers: not sending to any peers", v26, 2u);
    }
    char v22 = 1;
  }

  return v22;
}

- (BOOL)sendScopedDataToAll:(id)a3 dataMode:(int64_t)a4 dataScope:(int64_t)a5 transportContext:(id)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = [(GKViceroyTransport *)self session];
  LOBYTE(a7) = [v11 sendDataToAllPeers:v10 withDataMode:a4 error:a7];

  return (char)a7;
}

- (void)receiveData:(id)a3 fromPeer:(id)a4 inSession:(id)a5 context:(void *)a6
{
  id v16 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[GKMatchPacket alloc] initWithMessage:v10];

  id v12 = [(GKViceroyTransport *)self playerIDFromPeerID:v9];

  if ([(GKMatchPacket *)v11 valid] && [(GKMatchPacket *)v11 packetType] == 4)
  {
    id v13 = [(GKViceroyTransport *)self leaderElector];
    id v14 = [(GKMatchPacket *)v11 data];
    [v13 receivedChooseHostData:v14 fromPlayerID:v12];
  }
  else
  {
    id v15 = [(GKViceroyTransport *)self session];
    if ([v15 isWrappingGKSession:v16])
    {
      id v13 = 0;
    }
    else
    {
      id v13 = [(GKViceroyTransport *)self playerIDFromSession:v16];
    }

    id v14 = [(GKViceroyTransport *)self clientDelegate];
    [v14 transportDidReceivePacket:v11 fromPlayerID:v12 remoteRecipientID:v13];
  }
}

- (void)acceptRelayResponse:(id)a3 playerID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKViceroyTransport *)self relay];
  [v8 acceptRelayResponse:v7 playerID:v6];
}

- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(GKViceroyTransport *)self relay];
  [v7 handleRelayPushData:v6 onlyIfPreemptive:v4];
}

- (void)preemptRelay:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroyTransport *)self relay];
  [v5 preemptRelay:v4];
}

- (void)session:(id)a3 peer:(id)a4 didChangeState:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v11 = GKOSLoggers();
    id v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v10;
    id v13 = [(GKViceroyTransport *)self playerIDFromSession:v8];
    int v16 = 138413058;
    id v17 = v8;
    __int16 v18 = 1024;
    int v19 = v5;
    __int16 v20 = 2112;
    id v21 = v9;
    __int16 v22 = 2112;
    long long v23 = v13;
    _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_DEFAULT, "[GKViceroyTransport] peer state changed - session (%@) - new state: %d - peerID: %@. Session belongs to playerID: %@", (uint8_t *)&v16, 0x26u);
  }
  id v14 = [(GKViceroyTransport *)self clientDelegate];
  id v15 = [(GKViceroyTransport *)self playerIDFromPeerID:v9];
  [v14 connectionDidChangeWithState:v5 playerID:v15];
}

- (void)session:(id)a3 connectionWithPeerFailed:(id)a4 withError:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!os_log_GKGeneral) {
    id v11 = GKOSLoggers();
  }
  id v12 = (void *)os_log_GKError;
  if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
  {
    id v14 = v12;
    id v15 = [v8 sessionID];
    int v16 = [(GKViceroyTransport *)self playerIDFromPeerID:v9];
    int v17 = 138413058;
    __int16 v18 = v15;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    __int16 v22 = v16;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_error_impl(&dword_1C2D22000, v14, OS_LOG_TYPE_ERROR, "[GKViceroyTransport] session (%@) connection with peerID: %@ playerID: %@ failed %@", (uint8_t *)&v17, 0x2Au);
  }
  id v13 = [(GKViceroyTransport *)self clientDelegate];
  [v13 connectionDidFailWithError:v10];

  [(GKViceroyTransport *)self session:v8 peer:v9 didChangeState:3];
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!os_log_GKGeneral) {
    id v8 = GKOSLoggers();
  }
  id v9 = (void *)os_log_GKError;
  if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
  {
    id v11 = v9;
    id v12 = [v6 sessionID];
    id v13 = [(GKViceroyTransport *)self playerIDFromSession:v6];
    int v14 = 138412802;
    id v15 = v12;
    __int16 v16 = 2112;
    int v17 = v13;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_error_impl(&dword_1C2D22000, v11, OS_LOG_TYPE_ERROR, "[GKViceroyTransport] session (%@) did fail for playerID: %@ with error %@", (uint8_t *)&v14, 0x20u);
  }
  id v10 = [(GKViceroyTransport *)self clientDelegate];
  [v10 transportDidFailWithError:v7];
}

- (void)session:(id)a3 initiateRelay:(id)a4 forPeer:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = [(GKViceroyTransport *)self playerIDFromPeerID:a5];
  id v9 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v10 = GKOSLoggers();
    id v9 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_DEFAULT, "[GKViceroyTransport] session initiateRelay for playerID: %@ - sessionInfo: %@", (uint8_t *)&v12, 0x16u);
  }
  id v11 = [(GKViceroyTransport *)self relay];
  [v11 sessionDidInitiateOrUpdateRelay:v7 playerID:v8];
}

- (void)session:(id)a3 updateRelay:(id)a4 forPeer:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v11 = GKOSLoggers();
    id v10 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_DEFAULT, "[GKViceroyTransport] session: %@ updateRelay: %@ forPeer: %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)session:(id)a3 networkStatisticsChanged:(id)a4
{
  id v5 = a4;
  id v8 = [(GKViceroyTransport *)self leaderElector];
  id v6 = +[GKLocalPlayer local];
  id v7 = [(GKViceroyTransport *)self peerIdFromPlayer:v6];
  [v8 networkStatisticsDidChange:v5 localPlayerPeerID:v7];
}

- (void)chooseBestHostingPlayerWithTransportContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = [(GKViceroyTransport *)self leaderElector];
  [v6 chooseBestHostingPlayerWithCompletionHandler:v5];
}

- (id)voiceChatWithName:(id)a3 players:(id)a4 transportContext:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(GKViceroyTransport *)self session];
  id v10 = [v9 voiceChatWithName:v8 players:v7];

  return v10;
}

- (GKTransportClientDelegate)clientDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakClientDelegate);

  return (GKTransportClientDelegate *)WeakRetained;
}

- (void)setClientDelegate:(id)a3
{
}

- (GKConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSMutableDictionary)guestConnections
{
  return self->_guestConnections;
}

- (void)setGuestConnections:(id)a3
{
}

- (NSMutableDictionary)guestSessions
{
  return self->_guestSessions;
}

- (void)setGuestSessions:(id)a3
{
}

- (GKViceroyLeaderElector)leaderElector
{
  return self->_leaderElector;
}

- (void)setLeaderElector:(id)a3
{
}

- (GKViceroyRelay)relay
{
  return self->_relay;
}

- (void)setRelay:(id)a3
{
}

- (NSData)selfBlob
{
  return self->_selfBlob;
}

- (void)setSelfBlob:(id)a3
{
}

- (GKViceroySession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_selfBlob, 0);
  objc_storeStrong((id *)&self->_relay, 0);
  objc_storeStrong((id *)&self->_leaderElector, 0);
  objc_storeStrong((id *)&self->_guestSessions, 0);
  objc_storeStrong((id *)&self->_guestConnections, 0);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_weakClientDelegate);
}

void __63__GKViceroyTransport_localConnectionDataWithCompletionHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_ERROR, "[GKViceroyTransport] Getting local connection data encountered cdxError: %@", v1, 0xCu);
}

- (void)peerIdFromPlayer:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [a3 internal];
  id v7 = [v6 debugDescription];
  int v8 = 138412546;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_debug_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_DEBUG, "[GKViceroyTransport] Return peerID: %@, converted from player: %@", (uint8_t *)&v8, 0x16u);
}

- (void)peerIdFromPlayer:(void *)a1 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 internal];
  id v5 = [v4 debugDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2D22000, v6, v7, "[GKViceroyTransport] PeerID for player: %@ not found and therefore, return playerID instead.", v8, v9, v10, v11, v12);
}

- (void)playerIDFromPeerID:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1C2D22000, v1, OS_LOG_TYPE_DEBUG, "[GKViceroyTransport] Return playerID: %@, converted from peerID: %@", v2, 0x16u);
}

- (void)playerIDFromPeerID:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1C2D22000, v0, OS_LOG_TYPE_DEBUG, "[GKViceroyTransport] Converted peerID: %@ not found and therefore, return it as playerID", v1, 0xCu);
}

@end