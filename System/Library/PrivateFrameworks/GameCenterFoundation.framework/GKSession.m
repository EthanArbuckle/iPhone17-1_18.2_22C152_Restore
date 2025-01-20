@interface GKSession
- (BOOL)acceptConnectionFromPeer:(NSString *)peerID error:(NSError *)error;
- (BOOL)isAvailable;
- (BOOL)isBusy;
- (BOOL)isPeerBusy:(id)a3;
- (BOOL)sendData:(NSData *)data toPeers:(NSArray *)peers withDataMode:(GKSendDataMode)mode error:(NSError *)error;
- (BOOL)sendDataToAllPeers:(NSData *)data withDataMode:(GKSendDataMode)mode error:(NSError *)error;
- (GKSession)initWithViceroySession:(id)a3;
- (GKSessionMode)sessionMode;
- (GKViceroySession)session;
- (NSArray)peersWithConnectionState:(GKPeerConnectionState)state;
- (NSString)displayName;
- (NSString)displayNameForPeer:(NSString *)peerID;
- (NSString)peerID;
- (NSString)sessionID;
- (NSTimeInterval)disconnectTimeout;
- (id)delegate;
- (id)description;
- (id)initWithSessionID:(NSString *)sessionID displayName:(NSString *)name sessionMode:(GKSessionMode)mode;
- (id)privateDelegate;
- (id)privateImpl;
- (void)cancelConnectToPeer:(NSString *)peerID;
- (void)connectToPeer:(NSString *)peerID withTimeout:(NSTimeInterval)timeout;
- (void)dealloc;
- (void)denyConnectionFromPeer:(NSString *)peerID;
- (void)disableWifi;
- (void)disconnectFromAllPeers;
- (void)disconnectPeerFromAllPeers:(NSString *)peerID;
- (void)setAvailable:(BOOL)available;
- (void)setBusy:(BOOL)a3;
- (void)setDataReceiveHandler:(id)handler withContext:(void *)context;
- (void)setDelegate:(id)delegate;
- (void)setDisconnectTimeout:(NSTimeInterval)disconnectTimeout;
- (void)setPrivateDelegate:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation GKSession

- (id)initWithSessionID:(NSString *)sessionID displayName:(NSString *)name sessionMode:(GKSessionMode)mode
{
  uint64_t v5 = *(void *)&mode;
  v8 = sessionID;
  v9 = name;
  v14.receiver = self;
  v14.super_class = (Class)GKSession;
  v10 = [(GKSession *)&v14 init];
  if (v10)
  {
    v11 = [[GKViceroySession alloc] initWithGKSession:v10 sessionID:v8 displayName:v9 sessionMode:v5];
    session = v10->_session;
    v10->_session = v11;
  }
  return v10;
}

- (GKSession)initWithViceroySession:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GKSession;
  v6 = [(GKSession *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_session, a3);
  }

  return v7;
}

- (id)description
{
  v2 = [(GKSession *)self session];
  v3 = [v2 description];

  return v3;
}

- (void)dealloc
{
  [(GKSession *)self setSession:0];
  v3.receiver = self;
  v3.super_class = (Class)GKSession;
  [(GKSession *)&v3 dealloc];
}

- (void)setDelegate:(id)delegate
{
  id v4 = delegate;
  id v5 = [(GKSession *)self session];
  [v5 setDelegate:v4];
}

- (id)delegate
{
  v2 = [(GKSession *)self session];
  objc_super v3 = [v2 delegate];

  return v3;
}

- (NSString)sessionID
{
  v2 = [(GKSession *)self session];
  objc_super v3 = [v2 sessionID];

  return (NSString *)v3;
}

- (NSString)displayName
{
  v2 = [(GKSession *)self session];
  objc_super v3 = [v2 displayName];

  return (NSString *)v3;
}

- (void)setDisconnectTimeout:(NSTimeInterval)disconnectTimeout
{
  id v4 = [(GKSession *)self session];
  [v4 setDisconnectTimeout:disconnectTimeout];
}

- (NSTimeInterval)disconnectTimeout
{
  v2 = [(GKSession *)self session];
  [v2 disconnectTimeout];
  double v4 = v3;

  return v4;
}

- (NSString)displayNameForPeer:(NSString *)peerID
{
  double v4 = peerID;
  id v5 = [(GKSession *)self session];
  v6 = [v5 displayNameForPeer:v4];

  return (NSString *)v6;
}

- (BOOL)sendData:(NSData *)data toPeers:(NSArray *)peers withDataMode:(GKSendDataMode)mode error:(NSError *)error
{
  uint64_t v7 = *(void *)&mode;
  v10 = peers;
  v11 = data;
  v12 = [(GKSession *)self session];
  LOBYTE(error) = [v12 sendData:v11 toPeers:v10 withDataMode:v7 error:error];

  return (char)error;
}

- (BOOL)sendDataToAllPeers:(NSData *)data withDataMode:(GKSendDataMode)mode error:(NSError *)error
{
  uint64_t v6 = *(void *)&mode;
  v8 = data;
  if (!os_log_GKGeneral) {
    id v9 = GKOSLoggers();
  }
  v10 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)objc_super v14 = 0;
    _os_log_impl(&dword_1C2D22000, v10, OS_LOG_TYPE_INFO, "GKSession: sendDataToAllPeers: withDataMode:", v14, 2u);
  }
  v11 = [(GKSession *)self session];
  char v12 = [v11 sendDataToAllPeers:v8 withDataMode:v6 error:error];

  return v12;
}

- (void)setDataReceiveHandler:(id)handler withContext:(void *)context
{
  id v6 = handler;
  id v7 = [(GKSession *)self session];
  [v7 setDataReceiveHandler:v6 withContext:context];
}

- (void)connectToPeer:(NSString *)peerID withTimeout:(NSTimeInterval)timeout
{
  id v6 = peerID;
  id v7 = [(GKSession *)self session];
  [v7 connectToPeer:v6 withTimeout:timeout];
}

- (void)cancelConnectToPeer:(NSString *)peerID
{
  double v4 = peerID;
  id v5 = [(GKSession *)self session];
  [v5 cancelConnectToPeer:v4];
}

- (BOOL)acceptConnectionFromPeer:(NSString *)peerID error:(NSError *)error
{
  id v6 = peerID;
  id v7 = [(GKSession *)self session];
  LOBYTE(error) = [v7 acceptConnectionFromPeer:v6 error:error];

  return (char)error;
}

- (void)denyConnectionFromPeer:(NSString *)peerID
{
  double v4 = peerID;
  id v5 = [(GKSession *)self session];
  [v5 denyConnectionFromPeer:v4];
}

- (void)disconnectPeerFromAllPeers:(NSString *)peerID
{
  double v4 = peerID;
  id v5 = [(GKSession *)self session];
  [v5 disconnectPeerFromAllPeers:v4];
}

- (void)disconnectFromAllPeers
{
  id v2 = [(GKSession *)self session];
  [v2 disconnectFromAllPeers];
}

- (NSArray)peersWithConnectionState:(GKPeerConnectionState)state
{
  uint64_t v3 = *(void *)&state;
  double v4 = [(GKSession *)self session];
  id v5 = [v4 peersWithConnectionState:v3];

  return (NSArray *)v5;
}

- (GKSessionMode)sessionMode
{
  id v2 = [(GKSession *)self session];
  GKSessionMode v3 = [v2 sessionMode];

  return v3;
}

- (BOOL)isAvailable
{
  id v2 = [(GKSession *)self session];
  char v3 = [v2 isAvailable];

  return v3;
}

- (void)setAvailable:(BOOL)available
{
  BOOL v3 = available;
  id v4 = [(GKSession *)self session];
  [v4 setAvailable:v3];
}

- (NSString)peerID
{
  id v2 = [(GKSession *)self session];
  BOOL v3 = [v2 peerID];

  return (NSString *)v3;
}

- (BOOL)isBusy
{
  id v2 = [(GKSession *)self session];
  char v3 = [v2 isBusy];

  return v3;
}

- (void)setBusy:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GKSession *)self session];
  [v4 setBusy:v3];
}

- (BOOL)isPeerBusy:(id)a3
{
  id v4 = a3;
  id v5 = [(GKSession *)self session];
  char v6 = [v5 isPeerBusy:v4];

  return v6;
}

- (void)disableWifi
{
  id v2 = [(GKSession *)self session];
  [v2 disableWifi];
}

- (void)setPrivateDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(GKSession *)self session];
  [v5 setPrivateDelegate:v4];
}

- (id)privateDelegate
{
  id v2 = [(GKSession *)self session];
  BOOL v3 = [v2 privateDelegate];

  return v3;
}

- (id)privateImpl
{
  id v2 = [(GKSession *)self session];
  BOOL v3 = [v2 viceroyInternalSession];

  return v3;
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
}

@end