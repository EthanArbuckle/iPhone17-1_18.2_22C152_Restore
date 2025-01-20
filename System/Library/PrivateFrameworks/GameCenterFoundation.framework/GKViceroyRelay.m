@interface GKViceroyRelay
- (BOOL)shouldStartRelayForPlayerID:(id)a3;
- (GKConnection)connection;
- (GKMultiplayerDaemonProxy)daemonProxy;
- (GKTransportClientDelegate)clientDelegate;
- (GKTransportMatchDataDelegate)matchDataDelegate;
- (GKViceroyRelay)initWithClientDelegate:(id)a3 connection:(id)a4 matchDataDelegate:(id)a5 daemonProxy:(id)a6;
- (id)dataFromBase64String:(id)a3;
- (id)initiateRelayInfoFromPush:(id)a3 forPlayerID:(id)a4;
- (id)initiateRelayInfoFromServerResponse:(id)a3 forPlayerID:(id)a4;
- (id)updateRelayInfoFromPush:(id)a3 forPlayerID:(id)a4;
- (void)acceptRelayResponse:(id)a3 playerID:(id)a4;
- (void)didReceiveRelayPushData:(id)a3;
- (void)didReceiveRelayPushNotification:(id)a3;
- (void)disconnect;
- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4;
- (void)initiateRelayConnectionForPlayerID:(id)a3 connectionContext:(id)a4;
- (void)initiateRelayResponse:(id)a3 playerID:(id)a4;
- (void)preemptRelay:(id)a3;
- (void)relayDidInitiateConnection:(id)a3 forPlayerID:(id)a4;
- (void)relayDidUpdateConnection:(id)a3 forPlayerID:(id)a4;
- (void)requestRelayInitiateForPlayerID:(id)a3 connectionContext:(id)a4;
- (void)requestRelayUpdateForPlayerID:(id)a3 connectionContext:(id)a4;
- (void)sessionDidInitiateOrUpdateRelay:(id)a3 playerID:(id)a4;
- (void)setClientDelegate:(id)a3;
- (void)setConnection:(id)a3;
- (void)setDaemonProxy:(id)a3;
- (void)setMatchDataDelegate:(id)a3;
- (void)updateRelayConnectionForPlayerID:(id)a3 connectionContext:(id)a4;
@end

@implementation GKViceroyRelay

- (GKViceroyRelay)initWithClientDelegate:(id)a3 connection:(id)a4 matchDataDelegate:(id)a5 daemonProxy:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GKViceroyRelay;
  v14 = [(GKViceroyRelay *)&v18 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_weakClientDelegate, v10);
    objc_storeStrong((id *)&v15->_connection, a4);
    objc_storeWeak((id *)&v15->_matchDataDelegateWeak, v12);
    objc_storeStrong((id *)&v15->_daemonProxy, a6);
    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v15 selector:sel_didReceiveRelayPushNotification_ name:@"GKRelayPushNotification" object:0];
  }
  return v15;
}

- (void)disconnect
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];
}

- (void)acceptRelayResponse:(id)a3 playerID:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = GKOSLoggers();
    v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Accept relay response for playerID: %@ - response: %@", (uint8_t *)&v11, 0x16u);
  }
  if ([(GKViceroyRelay *)self shouldStartRelayForPlayerID:v7])
  {
    id v10 = [(GKViceroyRelay *)self initiateRelayInfoFromServerResponse:v6 forPlayerID:v7];
    [(GKViceroyRelay *)self initiateRelayConnectionForPlayerID:v7 connectionContext:v10];
  }
}

- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4
{
  id v9 = a3;
  if (a4)
  {
    id v6 = +[GKPreferences shared];
    if (([v6 preemptiveRelay] & 1) == 0)
    {

      goto LABEL_6;
    }
    id v7 = [v9 objectForKeyedSubscript:@"t"];

    v8 = v9;
    if (!v7) {
      goto LABEL_7;
    }
  }
  [(GKViceroyRelay *)self didReceiveRelayPushData:v9];
LABEL_6:
  v8 = v9;
LABEL_7:
}

- (void)preemptRelay:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v6 = GKOSLoggers();
    v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_1C2D22000, v5, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Preempt relay for playerID:%@", (uint8_t *)&v9, 0xCu);
  }
  if ([(GKViceroyRelay *)self shouldStartRelayForPlayerID:v4])
  {
    id v7 = [(GKViceroyRelay *)self matchDataDelegate];
    v8 = [v7 getConnectionContextForPlayerID:v4];

    [(GKViceroyRelay *)self requestRelayInitiateForPlayerID:v4 connectionContext:v8];
  }
}

- (void)didReceiveRelayPushNotification:(id)a3
{
  id v4 = [a3 userInfo];
  [(GKViceroyRelay *)self didReceiveRelayPushData:v4];
}

- (void)didReceiveRelayPushData:(id)a3
{
  id v4 = a3;
  v5 = [(GKViceroyRelay *)self clientDelegate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__GKViceroyRelay_didReceiveRelayPushData___block_invoke;
  v7[3] = &unk_1E646D650;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  [v5 relayDidReceivePushData:v6 completionHandler:v7];
}

uint64_t __42__GKViceroyRelay_didReceiveRelayPushData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v8 = v3;
    id v4 = [*(id *)(a1 + 32) objectForKey:@"c"];
    __int16 v5 = [v4 integerValue];

    if (v5 != 2)
    {
      if (v5 == 6)
      {
        id v6 = [*(id *)(a1 + 40) updateRelayInfoFromPush:*(void *)(a1 + 32) forPlayerID:v8];
        if ([v6 hasInitRelayInfo]) {
          [*(id *)(a1 + 40) updateRelayConnectionForPlayerID:v8 connectionContext:v6];
        }
LABEL_9:

        goto LABEL_10;
      }
      if (v5 != 5) {
        goto LABEL_10;
      }
    }
    if (![*(id *)(a1 + 40) shouldStartRelayForPlayerID:v8]) {
      goto LABEL_10;
    }
    id v6 = [*(id *)(a1 + 40) initiateRelayInfoFromPush:*(void *)(a1 + 32) forPlayerID:v8];
    [*(id *)(a1 + 40) initiateRelayConnectionForPlayerID:v8 connectionContext:v6];
    goto LABEL_9;
  }
LABEL_10:

  return MEMORY[0x1F41817F8]();
}

- (void)sessionDidInitiateOrUpdateRelay:(id)a3 playerID:(id)a4
{
  id v27 = a3;
  id v6 = a4;
  id v7 = [v27 objectForKey:@"GKSRelayInitiateInfo"];
  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CA60] dictionary];
    int v9 = [v7 objectForKey:*MEMORY[0x1E4F63AC8]];
    [v8 setObject:v9 forKey:@"self-blob"];

    id v10 = [v7 objectForKey:*MEMORY[0x1E4F63AD0]];
    [v8 setObject:v10 forKey:@"self-nat-ip"];

    uint64_t v11 = [v7 objectForKey:*MEMORY[0x1E4F63AD8]];
    [v8 setObject:v11 forKey:@"self-nat-type"];

    id v12 = [v7 objectForKey:*MEMORY[0x1E4F63A90]];
    [v8 setObject:v12 forKey:@"peer-blob"];

    __int16 v13 = [v7 objectForKey:*MEMORY[0x1E4F63A98]];
    [v8 setObject:v13 forKey:@"peer-nat-ip"];

    id v14 = [v7 objectForKey:*MEMORY[0x1E4F63AA0]];
    [v8 setObject:v14 forKey:@"peer-nat-type"];

    [(GKViceroyRelay *)self relayDidInitiateConnection:v8 forPlayerID:v6];
  }
  else
  {
    id v8 = [v27 objectForKey:@"GKSRelayUpdateInfo"];
    if (v8)
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
      v16 = [v8 objectForKey:*MEMORY[0x1E4F63B10]];
      [v15 setObject:v16 forKey:@"relay-type"];

      v17 = [v8 objectForKey:*MEMORY[0x1E4F63A88]];
      [v15 setObject:v17 forKey:@"relay-connection-id"];

      objc_super v18 = [v8 objectForKey:*MEMORY[0x1E4F63B08]];
      [v15 setObject:v18 forKey:@"relay-transaction-id-alloc"];

      v19 = [v8 objectForKey:*MEMORY[0x1E4F63B00]];
      [v15 setObject:v19 forKey:@"relay-token-alloc-res"];

      v20 = [v8 objectForKey:*MEMORY[0x1E4F63AA8]];
      [v15 setObject:v20 forKey:@"peer-relay-ip"];

      v21 = [v8 objectForKey:*MEMORY[0x1E4F63AC0]];
      [v15 setObject:v21 forKey:@"peer-relay-port"];

      v22 = [v8 objectForKey:*MEMORY[0x1E4F63AE0]];
      [v15 setObject:v22 forKey:@"self-relay-ip"];

      v23 = [v8 objectForKey:*MEMORY[0x1E4F63AF8]];
      [v15 setObject:v23 forKey:@"self-relay-port"];

      v24 = [v8 objectForKey:*MEMORY[0x1E4F63AE8]];
      [v15 setObject:v24 forKey:@"self-relay-nat-ip"];

      v25 = [v8 objectForKey:*MEMORY[0x1E4F63AF0]];
      [v15 setObject:v25 forKey:@"self-relay-nat-port"];

      v26 = [v8 objectForKey:*MEMORY[0x1E4F63A80]];
      [v15 setObject:v26 forKey:@"client-data"];

      [(GKViceroyRelay *)self relayDidUpdateConnection:v15 forPlayerID:v6];
    }
  }
}

- (BOOL)shouldStartRelayForPlayerID:(id)a3
{
  id v4 = a3;
  __int16 v5 = [(GKViceroyRelay *)self matchDataDelegate];
  id v6 = [v5 getConnectionContextForPlayerID:v4];

  if ([v6 relayInitiated] & 1) != 0 || (objc_msgSend(v6, "connected"))
  {
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
    [v6 setRelayInitiated:1];
  }

  return v7;
}

- (void)relayDidInitiateConnection:(id)a3 forPlayerID:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([(GKViceroyRelay *)self shouldStartRelayForPlayerID:v7])
  {
    id v8 = [(GKViceroyRelay *)self matchDataDelegate];
    int v9 = [v8 updateConnectionInfo:v6 forPlayerID:v7];

    [(GKViceroyRelay *)self requestRelayInitiateForPlayerID:v7 connectionContext:v9];
  }
  else
  {
    id v10 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v11 = GKOSLoggers();
      id v10 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Not starting relay for playerID: %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)requestRelayInitiateForPlayerID:(id)a3 connectionContext:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 info];
  int v9 = [v8 objectForKey:@"missing-client-data"];
  int v10 = [v9 BOOLValue];

  id v11 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v12 = GKOSLoggers();
    id v11 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v11;
    *(_DWORD *)buf = 138412802;
    id v37 = v6;
    __int16 v38 = 1024;
    int v39 = [v7 connected];
    __int16 v40 = 1024;
    int v41 = v10;
    _os_log_impl(&dword_1C2D22000, v13, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Request relayInit for playerID: %@ connected: %d missingClientData: %d", buf, 0x18u);
  }
  if ((([v7 connected] ^ 1 | v10) & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v15 = [v7 info];
    v16 = [v15 objectForKey:@"session-token"];
    [v14 setObject:v16 forKey:@"session-token"];

    v17 = [v7 info];
    objc_super v18 = [v17 objectForKey:@"self-nat-ip"];
    [v14 setObject:v18 forKey:@"self-nat-ip"];

    v19 = [v7 info];
    v20 = [v19 objectForKey:@"self-blob"];
    [v14 setObject:v20 forKey:@"self-blob"];

    v21 = [v7 info];
    v22 = [v21 objectForKey:@"peer-id"];
    [v14 setObject:v22 forKey:@"peer-id"];

    v23 = [v7 info];
    v24 = [v23 objectForKey:@"peer-push-token"];
    [v14 setObject:v24 forKey:@"peer-push-token"];

    v25 = [v7 info];
    v26 = [v25 objectForKey:@"peer-nat-type"];
    [v14 setObject:v26 forKey:@"peer-nat-type"];

    id v27 = [v7 info];
    v28 = [v27 objectForKey:@"peer-nat-ip"];
    [v14 setObject:v28 forKey:@"peer-nat-ip"];

    v29 = [v7 info];
    v30 = [v29 objectForKey:@"peer-blob"];
    [v14 setObject:v30 forKey:@"peer-blob"];

    v31 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v32 = GKOSLoggers();
      v31 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2D22000, v31, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Client process calling method initiateRelayRequest in multiplayerService", buf, 2u);
    }
    v33 = [(GKViceroyRelay *)self daemonProxy];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __68__GKViceroyRelay_requestRelayInitiateForPlayerID_connectionContext___block_invoke;
    v34[3] = &unk_1E646D678;
    v34[4] = self;
    id v35 = v6;
    [v33 initiateRelayRequest:v14 completionHandler:v34];
  }
}

void __68__GKViceroyRelay_requestRelayInitiateForPlayerID_connectionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_GKGeneral;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    int v9 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __68__GKViceroyRelay_requestRelayInitiateForPlayerID_connectionContext___block_invoke_cold_1((uint64_t)v6, v9);
    }
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      id v10 = GKOSLoggers();
      id v7 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] initiateRelayRequest successfully returned result", v11, 2u);
    }
    [*(id *)(a1 + 32) initiateRelayResponse:v5 playerID:*(void *)(a1 + 40)];
  }
}

- (id)initiateRelayInfoFromPush:(id)a3 forPlayerID:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = GKOSLoggers();
    id v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v27 = 138412546;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v6;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Got initRelay info from push for playerID: %@ - userInfo: %@", (uint8_t *)&v27, 0x16u);
  }
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  id v11 = [v6 objectForKey:@"t"];
  [v10 setObject:v11 forKey:@"relay-type"];

  id v12 = [v6 objectForKey:@"k"];
  id v13 = [(GKViceroyRelay *)self dataFromBase64String:v12];
  [v10 setObject:v13 forKey:@"relay-connection-id"];

  uint64_t v14 = [v6 objectForKey:@"q"];
  uint64_t v15 = [(GKViceroyRelay *)self dataFromBase64String:v14];
  [v10 setObject:v15 forKey:@"relay-transaction-id-alloc"];

  v16 = [v6 objectForKey:@"h"];
  v17 = [(GKViceroyRelay *)self dataFromBase64String:v16];
  [v10 setObject:v17 forKey:@"self-relay-ip"];

  objc_super v18 = [v6 objectForKey:@"o"];
  [v10 setObject:v18 forKey:@"self-relay-port"];

  v19 = [v6 objectForKey:@"H"];
  v20 = [(GKViceroyRelay *)self dataFromBase64String:v19];
  [v10 setObject:v20 forKey:@"peer-relay-ip"];

  v21 = [v6 objectForKey:@"O"];
  [v10 setObject:v21 forKey:@"peer-relay-port"];

  v22 = [v6 objectForKey:@"r"];
  v23 = [(GKViceroyRelay *)self dataFromBase64String:v22];
  [v10 setObject:v23 forKey:@"relay-token-alloc-req"];

  v24 = [(GKViceroyRelay *)self matchDataDelegate];
  v25 = [v24 updateConnectionInfo:v10 forPlayerID:v7];

  return v25;
}

- (void)initiateRelayResponse:(id)a3 playerID:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = GKOSLoggers();
    id v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Initiate relay response for playerID: %@ - response: %@", (uint8_t *)&v11, 0x16u);
  }
  id v10 = [(GKViceroyRelay *)self initiateRelayInfoFromServerResponse:v6 forPlayerID:v7];
  [(GKViceroyRelay *)self initiateRelayConnectionForPlayerID:v7 connectionContext:v10];
}

- (id)initiateRelayInfoFromServerResponse:(id)a3 forPlayerID:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = GKOSLoggers();
    id v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 138412546;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v6;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Got initiateRelay info for playerID: %@ - from response: %@", (uint8_t *)&v22, 0x16u);
  }
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  int v11 = [v6 objectForKey:@"relay-type"];
  [v10 setObject:v11 forKey:@"relay-type"];

  id v12 = [v6 objectForKey:@"relay-connection-id"];
  [v10 setObject:v12 forKey:@"relay-connection-id"];

  __int16 v13 = [v6 objectForKey:@"relay-transaction-id-alloc"];
  [v10 setObject:v13 forKey:@"relay-transaction-id-alloc"];

  id v14 = [v6 objectForKey:@"self-relay-ip"];
  [v10 setObject:v14 forKey:@"self-relay-ip"];

  uint64_t v15 = [v6 objectForKey:@"self-relay-port"];
  [v10 setObject:v15 forKey:@"self-relay-port"];

  v16 = [v6 objectForKey:@"peer-relay-ip"];
  [v10 setObject:v16 forKey:@"peer-relay-ip"];

  v17 = [v6 objectForKey:@"peer-relay-port"];
  [v10 setObject:v17 forKey:@"peer-relay-port"];

  objc_super v18 = [v6 objectForKey:@"relay-token-alloc-req"];
  [v10 setObject:v18 forKey:@"relay-token-alloc-req"];

  v19 = [(GKViceroyRelay *)self matchDataDelegate];
  v20 = [v19 updateConnectionInfo:v10 forPlayerID:v7];

  return v20;
}

- (void)initiateRelayConnectionForPlayerID:(id)a3 connectionContext:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = GKOSLoggers();
    id v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    int v33 = 138412546;
    id v34 = v6;
    __int16 v35 = 1024;
    LODWORD(v36) = [v7 connected];
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Initiate relay connection for player: %@ connected: %d", (uint8_t *)&v33, 0x12u);
  }
  if ([v7 connected])
  {
    int v11 = [MEMORY[0x1E4F1CA60] dictionary];
    id v12 = [v7 info];
    __int16 v13 = [v12 objectForKeyedSubscript:@"relay-type"];
    [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F63B10]];

    id v14 = [v7 info];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"relay-connection-id"];
    [v11 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F63A88]];

    v16 = [v7 info];
    v17 = [v16 objectForKeyedSubscript:@"relay-transaction-id-alloc"];
    [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F63B08]];

    objc_super v18 = [v7 info];
    v19 = [v18 objectForKeyedSubscript:@"relay-token-alloc-req"];
    [v11 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F63B00]];

    v20 = [v7 info];
    v21 = [v20 objectForKeyedSubscript:@"peer-relay-ip"];
    [v11 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F63AA8]];

    int v22 = [v7 info];
    id v23 = [v22 objectForKeyedSubscript:@"peer-relay-port"];
    [v11 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F63AC0]];

    __int16 v24 = [v7 info];
    id v25 = [v24 objectForKeyedSubscript:@"self-relay-ip"];
    [v11 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F63AE0]];

    uint64_t v26 = [v7 info];
    int v27 = [v26 objectForKeyedSubscript:@"self-relay-port"];
    [v11 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F63AF8]];

    id v28 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v29 = GKOSLoggers();
      id v28 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 138412546;
      id v34 = v6;
      __int16 v35 = 2112;
      v36 = v11;
      _os_log_impl(&dword_1C2D22000, v28, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] initiateRelayWithParticipant for playerID: %@ - with relayInfo: %@", (uint8_t *)&v33, 0x16u);
    }
    id v30 = [(GKViceroyRelay *)self connection];
    uint64_t v31 = [v7 info];
    id v32 = [v31 objectForKeyedSubscript:@"peer-blob"];
    [v30 initiateRelayWithParticipant:v6 withConnectionData:v32 withRelayInfo:v11 didInitiate:0];

    [v7 setHasInitRelayInfo:1];
    if ([v7 hasUpdateRelayInfo]) {
      [(GKViceroyRelay *)self updateRelayConnectionForPlayerID:v6 connectionContext:v7];
    }
  }
}

- (void)relayDidUpdateConnection:(id)a3 forPlayerID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKViceroyRelay *)self matchDataDelegate];
  id v9 = [v8 updateConnectionInfo:v7 forPlayerID:v6];

  [(GKViceroyRelay *)self requestRelayUpdateForPlayerID:v6 connectionContext:v9];
}

- (id)updateRelayInfoFromPush:(id)a3 forPlayerID:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = GKOSLoggers();
    id v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138412546;
    id v27 = v7;
    __int16 v28 = 2112;
    id v29 = v6;
    _os_log_impl(&dword_1C2D22000, v8, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Got updateRelay info for playerID: %@ - userInfo: %@", (uint8_t *)&v26, 0x16u);
  }
  id v10 = [MEMORY[0x1E4F1CA60] dictionary];
  int v11 = [v6 objectForKey:@"t"];
  [v10 setObject:v11 forKey:@"relay-type"];

  id v12 = [v6 objectForKey:@"k"];
  __int16 v13 = [(GKViceroyRelay *)self dataFromBase64String:v12];
  [v10 setObject:v13 forKey:@"relay-connection-id"];

  id v14 = [v6 objectForKey:@"q"];
  uint64_t v15 = [(GKViceroyRelay *)self dataFromBase64String:v14];
  [v10 setObject:v15 forKey:@"relay-transaction-id-chan-bind"];

  v16 = [v6 objectForKey:@"r"];
  v17 = [(GKViceroyRelay *)self dataFromBase64String:v16];
  [v10 setObject:v17 forKey:@"relay-token-chan-bind"];

  objc_super v18 = [v6 objectForKey:@"U"];
  v19 = [(GKViceroyRelay *)self dataFromBase64String:v18];
  [v10 setObject:v19 forKey:@"peer-relay-nat-ip"];

  v20 = [v6 objectForKey:@"V"];
  [v10 setObject:v20 forKey:@"peer-relay-nat-port"];

  v21 = [v6 objectForKey:@"L"];
  int v22 = [(GKViceroyRelay *)self dataFromBase64String:v21];
  [v10 setObject:v22 forKey:@"client-data"];

  id v23 = [(GKViceroyRelay *)self matchDataDelegate];
  __int16 v24 = [v23 updateConnectionInfo:v10 forPlayerID:v7];

  [v24 setHasUpdateRelayInfo:1];

  return v24;
}

- (void)requestRelayUpdateForPlayerID:(id)a3 connectionContext:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = GKOSLoggers();
    id v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    *(_DWORD *)buf = 138412546;
    id v46 = v6;
    __int16 v47 = 1024;
    int v48 = [v7 connected];
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Request relayUpdate for playerID: %@ connected: %d", buf, 0x12u);
  }
  if ([v7 connected])
  {
    int v11 = [MEMORY[0x1E4F1CA60] dictionary];
    id v12 = [v7 info];
    __int16 v13 = [v12 objectForKey:@"session-token"];
    [v11 setObject:v13 forKey:@"session-token"];

    id v14 = [v7 info];
    uint64_t v15 = [v14 objectForKey:@"peer-id"];
    [v11 setObject:v15 forKey:@"peer-id"];

    v16 = [v7 info];
    v17 = [v16 objectForKey:@"peer-push-token"];
    [v11 setObject:v17 forKey:@"peer-push-token"];

    objc_super v18 = [v7 info];
    v19 = [v18 objectForKey:@"relay-type"];
    [v11 setObject:v19 forKey:@"relay-type"];

    v20 = [v7 info];
    v21 = [v20 objectForKey:@"relay-connection-id"];
    [v11 setObject:v21 forKey:@"relay-connection-id"];

    int v22 = [v7 info];
    id v23 = [v22 objectForKey:@"relay-transaction-id-alloc"];
    [v11 setObject:v23 forKey:@"relay-transaction-id-alloc"];

    __int16 v24 = [v7 info];
    id v25 = [v24 objectForKey:@"self-relay-ip"];
    [v11 setObject:v25 forKey:@"self-relay-ip"];

    int v26 = [v7 info];
    id v27 = [v26 objectForKey:@"self-relay-port"];
    [v11 setObject:v27 forKey:@"self-relay-port"];

    __int16 v28 = [v7 info];
    id v29 = [v28 objectForKey:@"peer-relay-ip"];
    [v11 setObject:v29 forKey:@"peer-relay-ip"];

    uint64_t v30 = [v7 info];
    uint64_t v31 = [v30 objectForKey:@"peer-relay-port"];
    [v11 setObject:v31 forKey:@"peer-relay-port"];

    id v32 = [v7 info];
    int v33 = [v32 objectForKey:@"self-relay-nat-ip"];
    [v11 setObject:v33 forKey:@"self-relay-nat-ip"];

    id v34 = [v7 info];
    __int16 v35 = [v34 objectForKey:@"self-relay-nat-port"];
    [v11 setObject:v35 forKey:@"self-relay-nat-port"];

    v36 = [v7 info];
    uint64_t v37 = [v36 objectForKey:@"relay-token-alloc-res"];
    [v11 setObject:v37 forKey:@"relay-token-alloc-res"];

    __int16 v38 = [v7 info];
    int v39 = [v38 objectForKey:@"client-data"];
    [v11 setObject:v39 forKey:@"self-relay-blob"];

    __int16 v40 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v41 = GKOSLoggers();
      __int16 v40 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v6;
      _os_log_impl(&dword_1C2D22000, v40, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Calling update relay request for playerID: %@", buf, 0xCu);
    }
    uint64_t v42 = [(GKViceroyRelay *)self daemonProxy];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __66__GKViceroyRelay_requestRelayUpdateForPlayerID_connectionContext___block_invoke;
    v43[3] = &unk_1E646D6A0;
    id v44 = v6;
    [v42 updateRelayRequest:v11 completionHandler:v43];
  }
}

void __66__GKViceroyRelay_requestRelayUpdateForPlayerID_connectionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = os_log_GKGeneral;
  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v8 = GKOSLoggers();
    }
    id v9 = os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR)) {
      __66__GKViceroyRelay_requestRelayUpdateForPlayerID_connectionContext___block_invoke_cold_1((uint64_t)v6, v9);
    }
  }
  else
  {
    if (!os_log_GKGeneral)
    {
      id v10 = GKOSLoggers();
      id v7 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1C2D22000, v7, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] updateRelayRequest succeeded for playerID: %@", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)updateRelayConnectionForPlayerID:(id)a3 connectionContext:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    id v9 = GKOSLoggers();
    id v8 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v8;
    int v35 = 138412546;
    id v36 = v6;
    __int16 v37 = 1024;
    LODWORD(v38) = [v7 connected];
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] Update relay connection for playerID: %@ connected: %d", (uint8_t *)&v35, 0x12u);
  }
  if ([v7 connected])
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    int v12 = [v7 info];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"relay-type"];
    [v11 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F63B10]];

    uint64_t v14 = [v7 info];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"relay-connection-id"];
    [v11 setObject:v15 forKeyedSubscript:*MEMORY[0x1E4F63A88]];

    v16 = [v7 info];
    v17 = [v16 objectForKeyedSubscript:@"relay-transaction-id-chan-bind"];
    [v11 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F63B08]];

    objc_super v18 = [v7 info];
    v19 = [v18 objectForKeyedSubscript:@"relay-token-chan-bind"];
    [v11 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F63B00]];

    v20 = [v7 info];
    v21 = [v20 objectForKeyedSubscript:@"peer-relay-nat-ip"];
    [v11 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F63AB0]];

    int v22 = [v7 info];
    id v23 = [v22 objectForKeyedSubscript:@"peer-relay-nat-port"];
    [v11 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F63AB8]];

    __int16 v24 = [v7 info];
    id v25 = [v24 objectForKeyedSubscript:@"client-data"];
    [v11 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F63A80]];

    int v26 = [v7 info];
    id v27 = [v26 objectForKeyedSubscript:@"peer-relay-ip"];
    [v11 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F63AA8]];

    __int16 v28 = [v7 info];
    id v29 = [v28 objectForKeyedSubscript:@"peer-relay-port"];
    [v11 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F63AC0]];

    uint64_t v30 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v31 = GKOSLoggers();
      uint64_t v30 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 138412546;
      id v36 = v6;
      __int16 v37 = 2112;
      __int16 v38 = v11;
      _os_log_impl(&dword_1C2D22000, v30, OS_LOG_TYPE_DEFAULT, "[GKViceroyRelay] updateRelayConnectionForPlayer for playerID: %@ - with relayInfo: %@", (uint8_t *)&v35, 0x16u);
    }
    id v32 = [(GKViceroyRelay *)self connection];
    int v33 = [v7 info];
    id v34 = [v33 objectForKeyedSubscript:@"peer-blob"];
    [v32 updateRelayWithParticipant:v6 withConnectionData:v34 withRelayInfo:v11 didInitiate:0];
  }
}

- (id)dataFromBase64String:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v4 = a3;
  id v5 = (void *)[[v3 alloc] initWithBase64EncodedString:v4 options:0];

  return v5;
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

- (GKTransportMatchDataDelegate)matchDataDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_matchDataDelegateWeak);

  return (GKTransportMatchDataDelegate *)WeakRetained;
}

- (void)setMatchDataDelegate:(id)a3
{
}

- (GKMultiplayerDaemonProxy)daemonProxy
{
  return self->_daemonProxy;
}

- (void)setDaemonProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonProxy, 0);
  objc_destroyWeak((id *)&self->_matchDataDelegateWeak);
  objc_storeStrong((id *)&self->_connection, 0);

  objc_destroyWeak((id *)&self->_weakClientDelegate);
}

void __68__GKViceroyRelay_requestRelayInitiateForPlayerID_connectionContext___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "[GKViceroyRelay] initiateRelayRequest returned an error: %@", (uint8_t *)&v2, 0xCu);
}

void __66__GKViceroyRelay_requestRelayUpdateForPlayerID_connectionContext___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C2D22000, a2, OS_LOG_TYPE_ERROR, "[GKViceroyRelay] updateRelayRequest error: %@", (uint8_t *)&v2, 0xCu);
}

@end