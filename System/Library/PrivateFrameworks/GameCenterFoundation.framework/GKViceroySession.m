@interface GKViceroySession
- (BOOL)acceptConnectionFromPeer:(id)a3 error:(id *)a4;
- (BOOL)isAvailable;
- (BOOL)isBusy;
- (BOOL)isPeerBusy:(id)a3;
- (BOOL)isWrappingGKSession:(id)a3;
- (BOOL)sendData:(id)a3 toPeers:(id)a4 withDataMode:(int)a5 error:(id *)a6;
- (BOOL)sendDataToAllPeers:(id)a3 withDataMode:(int)a4 error:(id *)a5;
- (GKSession)gkSession;
- (GKSessionInternal)session;
- (GKViceroySession)initWithConnection:(id)a3 delegate:(id)a4;
- (GKViceroySession)initWithGKSession:(id)a3 sessionID:(id)a4 displayName:(id)a5 sessionMode:(int)a6;
- (double)disconnectTimeout;
- (id)delegate;
- (id)description;
- (id)displayName;
- (id)displayNameForPeer:(id)a3;
- (id)peerID;
- (id)peersWithConnectionState:(int)a3;
- (id)privateDelegate;
- (id)sessionID;
- (id)voiceChatWithName:(id)a3 players:(id)a4;
- (int)sessionMode;
- (void)cancelConnectToPeer:(id)a3;
- (void)connectToPeer:(id)a3 withTimeout:(double)a4;
- (void)dealloc;
- (void)denyConnectionFromPeer:(id)a3;
- (void)disableWifi;
- (void)disconnectFromAllPeers;
- (void)disconnectPeerFromAllPeers:(id)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setBusy:(BOOL)a3;
- (void)setDataReceiveHandler:(id)a3 withContext:(void *)a4;
- (void)setDelegate:(id)a3;
- (void)setDisconnectTimeout:(double)a3;
- (void)setGkSession:(id)a3;
- (void)setPrivateDelegate:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation GKViceroySession

- (GKViceroySession)initWithConnection:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GKViceroySession;
  v8 = [(GKViceroySession *)&v16 init];
  if (v8)
  {
    v9 = [[GKSession alloc] initWithViceroySession:v8];
    gkSession = v8->_gkSession;
    v8->_gkSession = v9;

    id v11 = objc_alloc(MEMORY[0x1E4F63B50]);
    v12 = [(GKViceroySession *)v8 gkSession];
    uint64_t v13 = [v11 initWithConnection:v6 session:v12 delegate:v7];
    session = v8->_session;
    v8->_session = (GKSessionInternal *)v13;

    [(GKSessionInternal *)v8->_session setPrivateDelegate:v7];
    [(GKSessionInternal *)v8->_session setDataReceiveHandler:v7 withContext:0];
  }

  return v8;
}

- (GKViceroySession)initWithGKSession:(id)a3 sessionID:(id)a4 displayName:(id)a5 sessionMode:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GKViceroySession;
  v14 = [(GKViceroySession *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_gkSession, a3);
    uint64_t v16 = [objc_alloc(MEMORY[0x1E4F63B50]) initWithSessionID:v12 displayName:v13 session:v11 sessionMode:v6];
    session = v15->_session;
    v15->_session = (GKSessionInternal *)v16;
  }
  return v15;
}

- (void)dealloc
{
  v3 = [(GKViceroySession *)self session];
  [v3 setDataReceiveHandler:0 withContext:0];

  v4 = [(GKViceroySession *)self session];
  [v4 setDelegate:0];

  v5 = [(GKViceroySession *)self session];
  [v5 setPrivateDelegate:0];

  uint64_t v6 = [(GKViceroySession *)self session];
  [v6 reset];

  v7.receiver = self;
  v7.super_class = (Class)GKViceroySession;
  [(GKSession *)&v7 dealloc];
}

- (BOOL)isAvailable
{
  v2 = [(GKViceroySession *)self session];
  char v3 = [v2 isAvailable];

  return v3;
}

- (void)setAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GKViceroySession *)self session];
  [v4 setAvailable:v3];
}

- (BOOL)isBusy
{
  v2 = [(GKViceroySession *)self session];
  char v3 = [v2 isBusy];

  return v3;
}

- (void)setBusy:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GKViceroySession *)self session];
  [v4 setBusy:v3];
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroySession *)self session];
  [v5 setDelegate:v4];
}

- (id)delegate
{
  v2 = [(GKViceroySession *)self session];
  BOOL v3 = [v2 delegate];

  return v3;
}

- (void)setDisconnectTimeout:(double)a3
{
  id v4 = [(GKViceroySession *)self session];
  [v4 setDisconnectTimeout:a3];
}

- (double)disconnectTimeout
{
  v2 = [(GKViceroySession *)self session];
  [v2 disconnectTimeout];
  double v4 = v3;

  return v4;
}

- (id)displayName
{
  v2 = [(GKViceroySession *)self session];
  double v3 = [v2 displayName];

  return v3;
}

- (id)description
{
  v2 = [(GKViceroySession *)self session];
  double v3 = [v2 description];

  return v3;
}

- (id)peerID
{
  v2 = [(GKViceroySession *)self session];
  double v3 = [v2 peerID];

  return v3;
}

- (void)setPrivateDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroySession *)self session];
  [v5 setPrivateDelegate:v4];
}

- (id)privateDelegate
{
  v2 = [(GKViceroySession *)self session];
  double v3 = [v2 privateDelegate];

  return v3;
}

- (id)sessionID
{
  v2 = [(GKViceroySession *)self session];
  double v3 = [v2 sessionID];

  return v3;
}

- (int)sessionMode
{
  v2 = [(GKViceroySession *)self session];
  int v3 = [v2 sessionMode];

  return v3;
}

- (BOOL)acceptConnectionFromPeer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_super v7 = [(GKViceroySession *)self session];
  LOBYTE(a4) = [v7 acceptConnectionFromPeer:v6 error:a4];

  return (char)a4;
}

- (void)cancelConnectToPeer:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroySession *)self session];
  [v5 cancelConnectToPeer:v4];
}

- (void)connectToPeer:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  id v7 = [(GKViceroySession *)self session];
  [v7 connectToPeer:v6 withTimeout:a4];
}

- (void)denyConnectionFromPeer:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroySession *)self session];
  [v5 denyConnectionFromPeer:v4];
}

- (void)disableWifi
{
  id v2 = [(GKViceroySession *)self session];
  [v2 setWifiEnabled:0];
}

- (void)disconnectFromAllPeers
{
  id v2 = [(GKViceroySession *)self session];
  [v2 disconnectFromAllPeers];
}

- (void)disconnectPeerFromAllPeers:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroySession *)self session];
  [v5 disconnectPeerFromAllPeers:v4];
}

- (id)displayNameForPeer:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroySession *)self session];
  id v6 = [v5 displayNameForPeer:v4];

  return v6;
}

- (BOOL)isPeerBusy:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroySession *)self session];
  char v6 = [v5 isPeerBusy:v4];

  return v6;
}

- (BOOL)isWrappingGKSession:(id)a3
{
  id v4 = a3;
  id v5 = [(GKViceroySession *)self gkSession];

  return v5 == v4;
}

- (id)peersWithConnectionState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(GKViceroySession *)self session];
  id v5 = [v4 peersWithConnectionState:v3];

  return v5;
}

- (BOOL)sendData:(id)a3 toPeers:(id)a4 withDataMode:(int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(GKViceroySession *)self session];
  LOBYTE(a6) = [v12 sendData:v11 toPeers:v10 withDataMode:v7 error:a6];

  return (char)a6;
}

- (BOOL)sendDataToAllPeers:(id)a3 withDataMode:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = [(GKViceroySession *)self session];
  LOBYTE(a5) = [v9 sendDataToAllPeers:v8 withDataMode:v6 error:a5];

  return (char)a5;
}

- (void)setDataReceiveHandler:(id)a3 withContext:(void *)a4
{
  id v6 = a3;
  id v7 = [(GKViceroySession *)self session];
  [v7 setDataReceiveHandler:v6 withContext:a4];
}

- (id)voiceChatWithName:(id)a3 players:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [GKViceroyVoiceChat alloc];
  v9 = [(GKViceroySession *)self session];
  id v10 = [v9 connection];
  id v11 = [(GKViceroySession *)self gkSession];
  id v12 = [(GKViceroyVoiceChat *)v8 initWithName:v7 connection:v10 gkSession:v11];

  id v13 = [[GKVoiceChat alloc] initWithViceroyVoiceChat:v12 players:v6];

  return v13;
}

- (GKSession)gkSession
{
  return self->_gkSession;
}

- (void)setGkSession:(id)a3
{
}

- (GKSessionInternal)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_gkSession, 0);
}

@end