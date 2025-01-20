@interface MCNearbyDiscoveryPeer
- (MCNearbyDiscoveryPeer)init;
- (MCNearbyDiscoveryPeer)initWithPeerID:(id)a3;
- (MCNearbyDiscoveryPeerConnection)connection;
- (MCNearbyDiscoveryPeerConnection)trialConnection;
- (MCPeerID)peerID;
- (NSMutableArray)sendDataBuffer;
- (NSNetService)netService;
- (id)description;
- (id)stringForState:(int)a3;
- (int)state;
- (void)attachConnection:(id)a3;
- (void)closeConnection;
- (void)dealloc;
- (void)flushDataBuffer;
- (void)invalidate;
- (void)sendData:(id)a3 withCompletionHandler:(id)a4;
- (void)setConnection:(id)a3;
- (void)setNetService:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setSendDataBuffer:(id)a3;
- (void)setState:(int)a3;
- (void)setTrialConnection:(id)a3;
@end

@implementation MCNearbyDiscoveryPeer

- (MCNearbyDiscoveryPeer)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCNearbyDiscoveryPeer;
  [(MCNearbyDiscoveryPeer *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (MCNearbyDiscoveryPeer)initWithPeerID:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MCNearbyDiscoveryPeer;
  v4 = [(MCNearbyDiscoveryPeer *)&v6 init];
  if (v4)
  {
    v4->_peerID = (MCPeerID *)[a3 copy];
    v4->_sendDataBuffer = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  objc_super v3 = mcdp_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v6 = self;
    _os_log_impl(&dword_218756000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating peer [%@].", buf, 0xCu);
  }
  [(MCNearbyDiscoveryPeer *)self flushDataBuffer];

  [(MCNearbyDiscoveryPeerConnection *)self->_connection invalidate];
  self->_connection = 0;
  [(MCNearbyDiscoveryPeerConnection *)self->_trialConnection invalidate];

  self->_trialConnection = 0;
  v4.receiver = self;
  v4.super_class = (Class)MCNearbyDiscoveryPeer;
  [(MCNearbyDiscoveryPeer *)&v4 dealloc];
}

- (id)description
{
  v2 = [(MCNearbyDiscoveryPeer *)self peerID];

  return [(MCPeerID *)v2 displayNameAndPID];
}

- (void)attachConnection:(id)a3
{
  -[MCNearbyDiscoveryPeer setConnection:](self, "setConnection:");
  if ([(MCNearbyDiscoveryPeer *)self trialConnection] != a3) {
    [(MCNearbyDiscoveryPeerConnection *)[(MCNearbyDiscoveryPeer *)self trialConnection] invalidate];
  }

  [(MCNearbyDiscoveryPeer *)self setTrialConnection:0];
}

- (void)closeConnection
{
  [(MCNearbyDiscoveryPeerConnection *)[(MCNearbyDiscoveryPeer *)self connection] invalidate];

  [(MCNearbyDiscoveryPeer *)self setConnection:0];
}

- (void)invalidate
{
  [(MCNearbyDiscoveryPeerConnection *)self->_connection invalidate];
  trialConnection = self->_trialConnection;

  [(MCNearbyDiscoveryPeerConnection *)trialConnection invalidate];
}

- (id)stringForState:(int)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a3 < 3) {
    return off_2643388F0[a3];
  }
  objc_super v6 = mcdp_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    v8 = self;
    __int16 v9 = 1024;
    int v10 = a3;
    _os_log_impl(&dword_218756000, v6, OS_LOG_TYPE_DEFAULT, "Peer [%@] unrecognized state [%d].", (uint8_t *)&v7, 0x12u);
  }
  return @"unknown";
}

- (void)sendData:(id)a3 withCompletionHandler:(id)a4
{
  if (self->_state == 2)
  {
    connection = self->_connection;
    [(MCNearbyDiscoveryPeerConnection *)connection sendData:a3 withCompletionHandler:a4];
  }
  else
  {
    uint64_t v6 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", a3, @"NSNearbyDiscoveryPeerSendDataKey", a4, @"NSNearbyDiscoveryPeerSendCompletionHandlerKey", 0);
    sendDataBuffer = self->_sendDataBuffer;
    [(NSMutableArray *)sendDataBuffer addObject:v6];
  }
}

- (void)flushDataBuffer
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (self->_state == 2)
  {
    objc_super v3 = mcdp_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = [(NSMutableArray *)self->_sendDataBuffer count];
      *(_DWORD *)buf = 138412546;
      v30 = self;
      __int16 v31 = 1024;
      int v32 = v4;
      _os_log_impl(&dword_218756000, v3, OS_LOG_TYPE_DEFAULT, "Peer [%@] relaying buffered data (%d sendData calls) to the peer connection object).", buf, 0x12u);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    sendDataBuffer = self->_sendDataBuffer;
    uint64_t v6 = [(NSMutableArray *)sendDataBuffer countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(sendDataBuffer);
          }
          -[MCNearbyDiscoveryPeerConnection sendData:withCompletionHandler:](self->_connection, "sendData:withCompletionHandler:", [*(id *)(*((void *)&v23 + 1) + 8 * i) objectForKey:@"NSNearbyDiscoveryPeerSendDataKey"], objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "objectForKey:", @"NSNearbyDiscoveryPeerSendCompletionHandlerKey"));
        }
        uint64_t v7 = [(NSMutableArray *)sendDataBuffer countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v7);
    }
  }
  else if ([(NSMutableArray *)self->_sendDataBuffer count])
  {
    int v10 = mcdp_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [(NSMutableArray *)self->_sendDataBuffer count];
      *(_DWORD *)buf = 138412546;
      v30 = self;
      __int16 v31 = 1024;
      int v32 = v11;
      _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Peer [%@] failed to send [%d] messages.", buf, 0x12u);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v12 = self->_sendDataBuffer;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      uint64_t v16 = *MEMORY[0x263F08320];
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v18 = [*(id *)(*((void *)&v19 + 1) + 8 * j) objectForKey:@"NSNearbyDiscoveryPeerSendCompletionHandlerKey"];
          if (v18) {
            (*(void (**)(uint64_t, uint64_t))(v18 + 16))(v18, objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"NSNearbyDiscoveryPeer", -1, objc_msgSend(NSDictionary, "dictionaryWithObject:forKey:", @"Peer doesn't have a connection object", v16)));
          }
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
  }
  [(NSMutableArray *)self->_sendDataBuffer removeAllObjects];
}

- (NSNetService)netService
{
  return self->_netService;
}

- (void)setNetService:(id)a3
{
}

- (MCPeerID)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (MCNearbyDiscoveryPeerConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (MCNearbyDiscoveryPeerConnection)trialConnection
{
  return self->_trialConnection;
}

- (void)setTrialConnection:(id)a3
{
}

- (NSMutableArray)sendDataBuffer
{
  return self->_sendDataBuffer;
}

- (void)setSendDataBuffer:(id)a3
{
}

@end