@interface GKCompositeTransport
- (BOOL)connectToGuestPlayer:(id)a3 withHostPlayer:(id)a4;
- (BOOL)hasPromptedTTR;
- (BOOL)sendScopedData:(id)a3 toPlayers:(id)a4 dataMode:(int64_t)a5 dataScope:(int64_t)a6 transportContext:(id)a7 error:(id *)a8;
- (BOOL)sendScopedDataToAll:(id)a3 dataMode:(int64_t)a4 dataScope:(int64_t)a5 transportContext:(id)a6 error:(id *)a7;
- (GKCompositeTransport)initWithClientDelegate:(id)a3 matchDataDelegate:(id)a4 reporter:(id)a5 transportContext:(id)a6;
- (GKMultiplayerActivityReporter)reporter;
- (GKMultiplayerDaemonProxy)daemonProxy;
- (GKTransportClientDelegate)instrumentedClientDelegate;
- (GKTransportProtocol)fastSyncTransport;
- (GKTransportProtocol)viceroyTransport;
- (NSData)nearbyConnectionData;
- (id)enrichPeerDictionariesForPlayersConnection:(id)a3;
- (id)transportForContext:(id)a3;
- (id)voiceChatWithName:(id)a3 players:(id)a4 transportContext:(id)a5;
- (void)acceptRelayResponse:(id)a3 playerID:(id)a4;
- (void)chooseBestHostingPlayerWithTransportContext:(id)a3 completionHandler:(id)a4;
- (void)connectToNearbyPlayer:(id)a3 withConnectionData:(id)a4;
- (void)connectToPlayersWithTransportContext:(id)a3 completionHandler:(id)a4;
- (void)disconnectAllWithTransportContext:(id)a3 completionHandler:(id)a4;
- (void)fileMultiplayerTTRWith:(id)a3;
- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4;
- (void)localConnectionDataWithCompletionHandler:(id)a3;
- (void)preemptRelay:(id)a3;
- (void)setDaemonProxy:(id)a3;
- (void)setFastSyncTransport:(id)a3;
- (void)setHasPromptedTTR:(BOOL)a3;
- (void)setInstrumentedClientDelegate:(id)a3;
- (void)setReporter:(id)a3;
- (void)setViceroyTransport:(id)a3;
@end

@implementation GKCompositeTransport

- (GKCompositeTransport)initWithClientDelegate:(id)a3 matchDataDelegate:(id)a4 reporter:(id)a5 transportContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)GKCompositeTransport;
  v14 = [(GKCompositeTransport *)&v28 init];
  if (v14)
  {
    uint64_t v15 = [v12 instrumentClientDelegate:v10 transportContext:v13];
    instrumentedClientDelegate = v14->_instrumentedClientDelegate;
    v14->_instrumentedClientDelegate = (GKTransportClientDelegate *)v15;

    uint64_t v17 = [v13 daemonProxy];
    daemonProxy = v14->_daemonProxy;
    v14->_daemonProxy = (GKMultiplayerDaemonProxy *)v17;

    v19 = [GKViceroyTransport alloc];
    v20 = [(GKCompositeTransport *)v14 instrumentedClientDelegate];
    uint64_t v21 = [(GKViceroyTransport *)v19 initWithClientDelegate:v20 matchDataDelegate:v11 daemonProxy:v14->_daemonProxy];
    viceroyTransport = v14->_viceroyTransport;
    v14->_viceroyTransport = (GKTransportProtocol *)v21;

    v23 = [GKFastSyncTransport alloc];
    v24 = [(GKCompositeTransport *)v14 instrumentedClientDelegate];
    uint64_t v25 = [(GKFastSyncTransport *)v23 initWithClientDelegate:v24 reporter:v12 daemonProxy:v14->_daemonProxy];
    fastSyncTransport = v14->_fastSyncTransport;
    v14->_fastSyncTransport = (GKTransportProtocol *)v25;

    objc_storeStrong((id *)&v14->_reporter, a5);
  }

  return v14;
}

- (void)disconnectAllWithTransportContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(GKCompositeTransport *)self reporter];
  [v8 onDisconnectWithTransportContext:v6];

  if ([v6 validTransportSelected])
  {
    v9 = [(GKCompositeTransport *)self transportForContext:v6];
    [v9 disconnectAllWithTransportContext:v6 completionHandler:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (!os_log_GKGeneral) {
    id v10 = GKOSLoggers();
  }
  id v11 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v12 = (void *)MEMORY[0x1E4F29060];
    v9 = v11;
    id v13 = [v12 callStackSymbols];
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    _os_log_impl(&dword_1C2D22000, v9, OS_LOG_TYPE_INFO, "Undefined transport or no transport has been selected when disconnecting. Context: %@.\nCall stack: %@", (uint8_t *)&v14, 0x16u);

    goto LABEL_7;
  }
LABEL_8:
}

- (id)transportForContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 selectedTransport];
  uint64_t v6 = [v5 version];

  if (v6 == 1)
  {
    uint64_t v7 = [(GKCompositeTransport *)self viceroyTransport];
    goto LABEL_5;
  }
  if (v6 == 2)
  {
    uint64_t v7 = [(GKCompositeTransport *)self fastSyncTransport];
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_11;
  }
  if (!os_log_GKGeneral) {
    id v9 = GKOSLoggers();
  }
  id v10 = (void *)os_log_GKMatch;
  if (os_log_type_enabled((os_log_t)os_log_GKMatch, OS_LOG_TYPE_INFO))
  {
    id v11 = (void *)MEMORY[0x1E4F29060];
    id v12 = v10;
    id v13 = [v11 callStackSymbols];
    *(_DWORD *)buf = 138412290;
    uint64_t v21 = v13;
    _os_log_impl(&dword_1C2D22000, v12, OS_LOG_TYPE_INFO, "Undefined transport used from call stack: %@", buf, 0xCu);
  }
  int v14 = NSString;
  id v15 = [NSString stringWithFormat:@"Something went wrong. We got an undefined transport version from: %@", v4];
  __int16 v16 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/Transport/GKCompositeTransport.m"];
  id v17 = [v16 lastPathComponent];
  uint64_t v18 = [v14 stringWithFormat:@"%@ (NO)\n[%s (%s:%d)]", v15, "-[GKCompositeTransport transportForContext:]", objc_msgSend(v17, "UTF8String"), 82];

  [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v18 format];
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)chooseBestHostingPlayerWithTransportContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(GKCompositeTransport *)self transportForContext:v7];
  v8 = [(GKCompositeTransport *)self reporter];
  id v9 = [v8 instrumentBestHostElectedHandler:v6 transportContext:v7];

  [v10 chooseBestHostingPlayerWithTransportContext:v7 completionHandler:v9];
}

- (void)connectToPlayersWithTransportContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v10 = [(GKCompositeTransport *)self transportForContext:v7];
  v8 = [(GKCompositeTransport *)self reporter];
  id v9 = [v8 instrumentErrorHandler:v6 transportContext:v7];

  [v10 connectToPlayersWithTransportContext:v7 completionHandler:v9];
}

- (BOOL)sendScopedData:(id)a3 toPlayers:(id)a4 dataMode:(int64_t)a5 dataScope:(int64_t)a6 transportContext:(id)a7 error:(id *)a8
{
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  id v17 = [(GKCompositeTransport *)self transportForContext:v14];
  char v18 = [v17 sendScopedData:v16 toPlayers:v15 dataMode:a5 dataScope:a6 transportContext:v14 error:a8];

  if (a8 && *a8)
  {
    v19 = [(GKCompositeTransport *)self reporter];
    [v19 onTransportError:*a8 transportContext:v14];

    [(GKCompositeTransport *)self fileMultiplayerTTRWith:*a8];
  }

  return v18;
}

- (BOOL)sendScopedDataToAll:(id)a3 dataMode:(int64_t)a4 dataScope:(int64_t)a5 transportContext:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a3;
  id v14 = [(GKCompositeTransport *)self transportForContext:v12];
  char v15 = [v14 sendScopedDataToAll:v13 dataMode:a4 dataScope:a5 transportContext:v12 error:a7];

  if (a7 && *a7)
  {
    id v16 = [(GKCompositeTransport *)self reporter];
    [v16 onTransportError:*a7 transportContext:v12];

    [(GKCompositeTransport *)self fileMultiplayerTTRWith:*a7];
  }

  return v15;
}

- (id)voiceChatWithName:(id)a3 players:(id)a4 transportContext:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(GKCompositeTransport *)self transportForContext:v8];
  id v12 = [v11 voiceChatWithName:v10 players:v9 transportContext:v8];

  return v12;
}

- (NSData)nearbyConnectionData
{
  v2 = [(GKCompositeTransport *)self viceroyTransport];
  v3 = [v2 nearbyConnectionData];

  return (NSData *)v3;
}

- (void)connectToNearbyPlayer:(id)a3 withConnectionData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKCompositeTransport *)self viceroyTransport];
  [v8 connectToNearbyPlayer:v7 withConnectionData:v6];
}

- (BOOL)connectToGuestPlayer:(id)a3 withHostPlayer:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKCompositeTransport *)self viceroyTransport];
  char v9 = [v8 connectToGuestPlayer:v7 withHostPlayer:v6];

  return v9;
}

- (id)enrichPeerDictionariesForPlayersConnection:(id)a3
{
  id v4 = a3;
  v5 = [(GKCompositeTransport *)self viceroyTransport];
  id v6 = [v5 enrichPeerDictionariesForPlayersConnection:v4];

  return v6;
}

- (void)localConnectionDataWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(GKCompositeTransport *)self viceroyTransport];
  [v5 localConnectionDataWithCompletionHandler:v4];
}

- (void)acceptRelayResponse:(id)a3 playerID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(GKCompositeTransport *)self viceroyTransport];
  [v8 acceptRelayResponse:v7 playerID:v6];
}

- (void)handleRelayPushData:(id)a3 onlyIfPreemptive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(GKCompositeTransport *)self viceroyTransport];
  [v7 handleRelayPushData:v6 onlyIfPreemptive:v4];
}

- (void)preemptRelay:(id)a3
{
  id v4 = a3;
  id v5 = [(GKCompositeTransport *)self viceroyTransport];
  [v5 preemptRelay:v4];
}

- (void)fileMultiplayerTTRWith:(id)a3
{
  id v4 = a3;
  if (![(GKCompositeTransport *)self hasPromptedTTR])
  {
    objc_initWeak(&location, self);
    id v5 = [(GKCompositeTransport *)self daemonProxy];
    id v6 = [NSString stringWithFormat:@"Tap here to report an issue helpful for multiplayer instrumentation. Error: %@", v4];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __47__GKCompositeTransport_fileMultiplayerTTRWith___block_invoke;
    v7[3] = &unk_1E646EF00;
    objc_copyWeak(&v8, &location);
    [v5 fileMultiplayerTTRWithCallBackIdentifier:0 descriptionAddition:v6 handler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __47__GKCompositeTransport_fileMultiplayerTTRWith___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHasPromptedTTR:1];
}

- (GKMultiplayerActivityReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (GKTransportClientDelegate)instrumentedClientDelegate
{
  return self->_instrumentedClientDelegate;
}

- (void)setInstrumentedClientDelegate:(id)a3
{
}

- (GKTransportProtocol)viceroyTransport
{
  return self->_viceroyTransport;
}

- (void)setViceroyTransport:(id)a3
{
}

- (GKTransportProtocol)fastSyncTransport
{
  return self->_fastSyncTransport;
}

- (void)setFastSyncTransport:(id)a3
{
}

- (GKMultiplayerDaemonProxy)daemonProxy
{
  return self->_daemonProxy;
}

- (void)setDaemonProxy:(id)a3
{
}

- (BOOL)hasPromptedTTR
{
  return self->_hasPromptedTTR;
}

- (void)setHasPromptedTTR:(BOOL)a3
{
  self->_hasPromptedTTR = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonProxy, 0);
  objc_storeStrong((id *)&self->_fastSyncTransport, 0);
  objc_storeStrong((id *)&self->_viceroyTransport, 0);
  objc_storeStrong((id *)&self->_instrumentedClientDelegate, 0);

  objc_storeStrong((id *)&self->_reporter, 0);
}

@end