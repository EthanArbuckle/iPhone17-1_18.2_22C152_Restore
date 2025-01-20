@interface MCNearbyServiceAdvertiser
- (BOOL)isAWDLDisabled;
- (BOOL)isAdvertising;
- (BOOL)wasAdvertising;
- (MCNearbyServiceAdvertiser)init;
- (MCNearbyServiceAdvertiser)initWithPeer:(MCPeerID *)myPeerID discoveryInfo:(NSDictionary *)info serviceType:(NSString *)serviceType;
- (MCPeerID)myPeerID;
- (NSData)TXTRecordData;
- (NSDictionary)discoveryInfo;
- (NSMutableDictionary)invites;
- (NSMutableDictionary)peers;
- (NSNetService)networkServer;
- (NSString)description;
- (NSString)formattedServiceType;
- (NSString)serviceType;
- (OS_dispatch_queue)syncQueue;
- (id)delegate;
- (id)makeTXTRecordDataWithDiscoveryInfo:(id)a3;
- (id)txtRecordDataWithDiscoveryInfo:(id)a3;
- (int64_t)outgoingInviteID;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)applicationWillEnterForegroundNotification:(id)a3;
- (void)dealloc;
- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5;
- (void)netService:(id)a3 didNotPublish:(id)a4;
- (void)netServiceDidPublish:(id)a3;
- (void)netServiceDidStop:(id)a3;
- (void)parseIDString:(id *)a3 displayName:(id *)a4 fromIdentifier:(id)a5;
- (void)setAWDLDisabled:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setDiscoveryInfo:(id)a3;
- (void)setFormattedServiceType:(id)a3;
- (void)setInvites:(id)a3;
- (void)setIsAdvertising:(BOOL)a3;
- (void)setNetworkServer:(id)a3;
- (void)setOutgoingInviteID:(int64_t)a3;
- (void)setPeers:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setTXTRecordData:(id)a3;
- (void)setWasAdvertising:(BOOL)a3;
- (void)startAdvertisingPeer;
- (void)stopAdvertisingPeer;
- (void)syncAttachConnection:(id)a3 toPeer:(id)a4;
- (void)syncCloseConnectionForPeer:(id)a3;
- (void)syncHandleIncomingInputStream:(id)a3 outputStream:(id)a4;
- (void)syncHandleInvite:(id)a3 fromPeer:(id)a4;
- (void)syncHandleInviteConnect:(id)a3 fromPeer:(id)a4;
- (void)syncReceivedData:(id)a3 fromPeer:(id)a4;
- (void)syncSendData:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5;
- (void)syncSendDictionary:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5;
- (void)syncStartAdvertisingPeer;
- (void)syncStopAdvertisingPeer;
@end

@implementation MCNearbyServiceAdvertiser

- (MCNearbyServiceAdvertiser)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCNearbyServiceAdvertiser;
  [(MCNearbyServiceAdvertiser *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (MCNearbyServiceAdvertiser)initWithPeer:(MCPeerID *)myPeerID discoveryInfo:(NSDictionary *)info serviceType:(NSString *)serviceType
{
  v23.receiver = self;
  v23.super_class = (Class)MCNearbyServiceAdvertiser;
  v8 = [(MCNearbyServiceAdvertiser *)&v23 init];
  if (v8)
  {
    v8->_peers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8->_invites = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (!myPeerID)
    {
      v9 = (void *)MEMORY[0x263EFF940];
      uint64_t v10 = *MEMORY[0x263EFF4A0];
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      v13 = (objc_class *)objc_opt_class();
      [v9 raise:v10, @"A nil %@ object passed to %@", v12, NSStringFromClass(v13) format];
    }
    v8->_myPeerID = (MCPeerID *)[(MCPeerID *)myPeerID copy];
    if (!+[MCNearbyServiceUtils isServiceTypeValid:serviceType])
    {
      v14 = (void *)MEMORY[0x263EFF940];
      uint64_t v15 = *MEMORY[0x263EFF4A0];
      v16 = (objc_class *)objc_opt_class();
      [v14 raise:v15, @"Invalid serviceType passed to %@", NSStringFromClass(v16) format];
    }
    v8->_serviceType = (NSString *)[(NSString *)serviceType copy];
    v8->_formattedServiceType = (NSString *)objc_msgSend(+[MCNearbyServiceUtils formattedServiceType:](MCNearbyServiceUtils, "formattedServiceType:", serviceType), "copy");
    v8->_discoveryInfo = (NSDictionary *)[(NSDictionary *)info copy];
    v17 = (NSData *)[(MCNearbyServiceAdvertiser *)v8 txtRecordDataWithDiscoveryInfo:info];
    v8->_TXTRecordData = v17;
    if (!v17)
    {
      v18 = (void *)MEMORY[0x263EFF940];
      uint64_t v19 = *MEMORY[0x263EFF4A0];
      v20 = (objc_class *)objc_opt_class();
      [v18 raise:v19, @"Invalid discoveryInfo passed to %@", NSStringFromClass(v20) format];
    }
    v8->_syncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MCNearbyServiceAdvertiser.syncQueue", 0);
    v21 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v8 selector:sel_applicationDidEnterBackgroundNotification_ name:*MEMORY[0x263F1D050] object:0];
    [v21 addObserver:v8 selector:sel_applicationWillEnterForegroundNotification_ name:*MEMORY[0x263F1D0D0] object:0];
    [v21 addObserver:v8 selector:sel_applicationWillTerminateNotification_ name:*MEMORY[0x263F1D0E0] object:0];
  }
  return v8;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [(NSNetService *)self->_networkServer setDelegate:0];
  [(NSNetService *)self->_networkServer stop];

  objc_storeWeak((id *)&self->_delegate, 0);
  dispatch_release((dispatch_object_t)self->_syncQueue);
  v3.receiver = self;
  v3.super_class = (Class)MCNearbyServiceAdvertiser;
  [(MCNearbyServiceAdvertiser *)&v3 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MCNearbyServiceAdvertiser *)self myPeerID];
  v7 = [(MCNearbyServiceAdvertiser *)self discoveryInfo];
  v8 = [(MCNearbyServiceAdvertiser *)self serviceType];
  [(MCNearbyServiceAdvertiser *)self delegate];
  v9 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p MyPeerID = %@ DiscoveryInfo = %@ ServiceType = %@ Delegate = <%@: %p>>", v5, self, v6, v7, v8, NSStringFromClass(v9), -[MCNearbyServiceAdvertiser delegate](self, "delegate")];
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (id)makeTXTRecordDataWithDiscoveryInfo:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObject:forKey:", -[MCPeerID displayName](-[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID"), "displayName"), @"_d");
  if (a3)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = (void *)[a3 allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          uint64_t v11 = [a3 objectForKey:v10];
          if ([v10 hasPrefix:@"_"]) {
            uint64_t v10 = (void *)[NSString stringWithFormat:@"%@%@", @"_", v10];
          }
          [v4 setObject:v11 forKey:v10];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }
  }
  return (id)[MEMORY[0x263EFC5F0] dataFromTXTRecordDictionary:v4];
}

- (id)txtRecordDataWithDiscoveryInfo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = objc_msgSend(a3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [a3 objectForKeyedSubscript:*(void *)(*((void *)&v11 + 1) + 8 * v9)];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return 0;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return [(MCNearbyServiceAdvertiser *)self makeTXTRecordDataWithDiscoveryInfo:a3];
}

- (void)parseIDString:(id *)a3 displayName:(id *)a4 fromIdentifier:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v8 = (void *)[MEMORY[0x263F08B08] scannerWithString:a5];
  if ([v8 scanUpToString:@"+" intoString:a3])
  {
    if ([v8 scanString:@"+" intoString:0])
    {
      if ([v8 scanUpToString:@"+" intoString:a4]) {
        return;
      }
      int v9 = 3;
    }
    else
    {
      int v9 = 2;
    }
  }
  else
  {
    int v9 = 1;
  }
  uint64_t v10 = mcadvertiser_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = a5;
    __int16 v13 = 1024;
    int v14 = v9;
    _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Identifier [%@] failed to parse at %d.", (uint8_t *)&v11, 0x12u);
  }
}

- (void)syncStartAdvertisingPeer
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (![(MCNearbyServiceAdvertiser *)self isAdvertising])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    objc_super v3 = (void *)[(NSMutableDictionary *)self->_peers allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(v3);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v7++) invalidate];
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v21 count:16];
      }
      while (v5);
    }
    [(NSMutableDictionary *)self->_peers removeAllObjects];
    if (![(MCNearbyServiceAdvertiser *)self networkServer])
    {
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFC5F0]), "initWithDomain:type:name:port:", @"local.", -[MCNearbyServiceAdvertiser formattedServiceType](self, "formattedServiceType"), -[MCPeerID idString](-[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID"), "idString"), 0);
      [v8 setDelegate:self];
      if (![(MCNearbyServiceAdvertiser *)self isAWDLDisabled]) {
        [v8 setIncludesPeerToPeer:1];
      }
      [(MCNearbyServiceAdvertiser *)self setNetworkServer:v8];
      [(NSNetService *)[(MCNearbyServiceAdvertiser *)self networkServer] setTXTRecordData:[(MCNearbyServiceAdvertiser *)self TXTRecordData]];
      uint64_t v9 = [MEMORY[0x263EFF9F0] mainRunLoop];
      [v8 scheduleInRunLoop:v9 forMode:*MEMORY[0x263EFF588]];
    }
    [(NSNetService *)[(MCNearbyServiceAdvertiser *)self networkServer] publishWithOptions:2];
    [(MCNearbyServiceAdvertiser *)self setIsAdvertising:1];
    uint64_t v10 = mcadvertiser_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(MCPeerID *)[(MCNearbyServiceAdvertiser *)self myPeerID] displayNameAndPID];
      id v12 = [(MCNearbyServiceAdvertiser *)self formattedServiceType];
      *(_DWORD *)buf = 138412546;
      id v18 = v11;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Start advertising peer [%@] type [%@].", buf, 0x16u);
    }
  }
}

- (void)startAdvertisingPeer
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__MCNearbyServiceAdvertiser_startAdvertisingPeer__block_invoke;
  block[3] = &unk_264337EE8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __49__MCNearbyServiceAdvertiser_startAdvertisingPeer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncStartAdvertisingPeer];
}

- (void)syncStopAdvertisingPeer
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(MCNearbyServiceAdvertiser *)self isAdvertising])
  {
    if ([(MCNearbyServiceAdvertiser *)self networkServer])
    {
      [(NSNetService *)[(MCNearbyServiceAdvertiser *)self networkServer] setDelegate:0];
      [(NSNetService *)[(MCNearbyServiceAdvertiser *)self networkServer] stop];
      [(MCNearbyServiceAdvertiser *)self setNetworkServer:0];
    }
    [(MCNearbyServiceAdvertiser *)self setIsAdvertising:0];
    objc_super v3 = mcadvertiser_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412546;
      id v5 = [(MCPeerID *)[(MCNearbyServiceAdvertiser *)self myPeerID] displayNameAndPID];
      __int16 v6 = 2112;
      uint64_t v7 = [(MCNearbyServiceAdvertiser *)self formattedServiceType];
      _os_log_impl(&dword_218756000, v3, OS_LOG_TYPE_DEFAULT, "Stop advertising peer [%@] type [%@].", (uint8_t *)&v4, 0x16u);
    }
  }
}

- (void)stopAdvertisingPeer
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__MCNearbyServiceAdvertiser_stopAdvertisingPeer__block_invoke;
  block[3] = &unk_264337EE8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __48__MCNearbyServiceAdvertiser_stopAdvertisingPeer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncStopAdvertisingPeer];
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__MCNearbyServiceAdvertiser_applicationDidEnterBackgroundNotification___block_invoke;
  block[3] = &unk_264337EE8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __71__MCNearbyServiceAdvertiser_applicationDidEnterBackgroundNotification___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isAdvertising];
  if (result)
  {
    [*(id *)(a1 + 32) setWasAdvertising:1];
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 syncStopAdvertisingPeer];
  }
  return result;
}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__MCNearbyServiceAdvertiser_applicationWillEnterForegroundNotification___block_invoke;
  block[3] = &unk_264337EE8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __72__MCNearbyServiceAdvertiser_applicationWillEnterForegroundNotification___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wasAdvertising];
  if (result)
  {
    [*(id *)(a1 + 32) setWasAdvertising:0];
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 syncStartAdvertisingPeer];
  }
  return result;
}

- (void)syncAttachConnection:(id)a3 toPeer:(id)a4
{
  [a4 attachConnection:a3];
  [a4 setState:2];

  [a4 flushDataBuffer];
}

- (void)syncCloseConnectionForPeer:(id)a3
{
  [a3 closeConnection];

  [a3 setState:0];
}

- (void)syncSendDictionary:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v12 = 0;
  uint64_t v8 = (void (**)(id, void))(id)[a5 copy];
  uint64_t v9 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:&v12];
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = mcadvertiser_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = a3;
      __int16 v15 = 2112;
      id v16 = a4;
      _os_log_impl(&dword_218756000, v11, OS_LOG_TYPE_DEFAULT, "Sending dictionary %@ to peer %@.", buf, 0x16u);
    }
    [(MCNearbyServiceAdvertiser *)self syncSendData:v10 toPeer:a4 withCompletionHandler:v8];
  }
  else if (v8)
  {
    v8[2](v8, v12);
  }
}

- (void)syncHandleInvite:(id)a3 fromPeer:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v7 = [a3 objectForKey:@"MCNearbyServiceSenderPeerIDKey"];
  uint64_t v8 = [[MCPeerID alloc] initWithSerializedRepresentation:v7];
  uint64_t v9 = [a3 objectForKey:@"MCNearbyServiceRecipientPeerIDKey"];
  uint64_t v10 = [[MCPeerID alloc] initWithSerializedRepresentation:v9];
  id v11 = mcadvertiser_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = a4;
    __int16 v18 = 2112;
    uint64_t v19 = objc_msgSend((id)objc_msgSend(a4, "peerID"), "displayName");
    _os_log_impl(&dword_218756000, v11, OS_LOG_TYPE_DEFAULT, "Got invite from peer[%@] for peer[%@].", buf, 0x16u);
  }
  if ([(MCPeerID *)[(MCNearbyServiceAdvertiser *)self myPeerID] isEqual:v10])
  {
    if (objc_msgSend((id)objc_msgSend(a4, "peerID"), "isEqual:", v8))
    {
      uint64_t v12 = [a3 objectForKey:@"MCNearbyServiceInviteContextKey"];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke;
      v15[3] = &unk_264338790;
      v15[4] = a4;
      v15[5] = a3;
      v15[6] = v9;
      v15[7] = v7;
      v15[8] = self;
      v15[9] = v12;
      dispatch_async(MEMORY[0x263EF83A0], v15);
    }
    else
    {
      id v14 = mcadvertiser_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[MCNearbyServiceAdvertiser syncHandleInvite:fromPeer:]();
      }
    }
  }
  else
  {
    long long v13 = mcadvertiser_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MCNearbyServiceAdvertiser syncHandleInvite:fromPeer:]();
    }
  }
}

uint64_t __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2;
  v3[3] = &unk_264338768;
  long long v1 = *(_OWORD *)(a1 + 48);
  long long v4 = *(_OWORD *)(a1 + 32);
  long long v5 = v1;
  id v6 = *(id *)(a1 + 64);
  return objc_msgSend((id)objc_msgSend(v6, "delegate"), "advertiser:didReceiveInvitationFromPeer:withContext:invitationHandler:", *(void *)(a1 + 64), objc_msgSend(*(id *)(a1 + 32), "peerID"), *(void *)(a1 + 72), v3);
}

uint64_t __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = mcadvertiser_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218756000, v6, OS_LOG_TYPE_DEFAULT, "Invitation handler called.", buf, 2u);
  }
  uint64_t v7 = mcadvertiser_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a3 && a2)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Invitation accepted.", buf, 2u);
    }
    uint64_t v9 = [*(id *)(a1 + 32) peerID];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_46;
    v20[3] = &unk_264338740;
    long long v10 = *(_OWORD *)(a1 + 48);
    int8x16_t v21 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    long long v22 = v10;
    uint64_t v23 = *(void *)(a1 + 64);
    v24 = a3;
    return [a3 nearbyConnectionDataForPeer:v9 withCompletionHandler:v20];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 67109378;
      int v28 = a2;
      __int16 v29 = 2112;
      v30 = a3;
      _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Invitation declined (accept=%d, session=%@).", buf, 0x12u);
    }
    uint64_t v12 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "myPeerID"), "serializedRepresentation");
    uint64_t v13 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peerID"), "serializedRepresentation");
    v25[0] = @"MCNearbyServiceMessageIDKey";
    v26[0] = [NSNumber numberWithUnsignedInteger:2];
    v26[1] = v12;
    v25[1] = @"MCNearbyServiceSenderPeerIDKey";
    v25[2] = @"MCNearbyServiceRecipientPeerIDKey";
    v26[2] = v13;
    v25[3] = @"MCNearbyServiceAcceptInviteKey";
    v26[3] = [NSNumber numberWithBool:0];
    v25[4] = @"MCNearbyServiceInviteIDKey";
    v26[4] = [*(id *)(a1 + 40) objectForKey:@"MCNearbyServiceInviteIDKey"];
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];
    uint64_t v15 = *(void *)(a1 + 64);
    id v16 = *(NSObject **)(v15 + 88);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_56;
    block[3] = &unk_264337EC0;
    block[4] = v15;
    void block[5] = v14;
    long long v19 = *(_OWORD *)(a1 + 32);
    dispatch_async(v16, block);
    uint64_t v17 = [*(id *)(a1 + 40) objectForKey:@"MCNearbyServiceInviteIDKey"];
    return [*(id *)(*(void *)(a1 + 64) + 96) removeObjectForKey:objc_msgSend(NSString, "stringWithFormat:", @"from:%@=%@", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peerID"), "displayName"), v17)];
  }
}

void __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_46(uint64_t a1, uint64_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) objectForKey:@"MCNearbyServiceInviteIDKey"];
    uint64_t v5 = [NSString stringWithFormat:@"from:%@=%@", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "peerID"), "displayName"), v4];
    v22[0] = @"MCNearbyServiceMessageIDKey";
    uint64_t v23 = [NSNumber numberWithUnsignedInteger:2];
    v22[1] = @"MCNearbyServiceSenderPeerIDKey";
    v22[2] = @"MCNearbyServiceRecipientPeerIDKey";
    long long v24 = *(_OWORD *)(a1 + 48);
    v22[3] = @"MCNearbyServiceAcceptInviteKey";
    uint64_t v25 = [NSNumber numberWithBool:1];
    uint64_t v26 = a2;
    v22[4] = @"MCNearbyServiceConnectionDataKey";
    v22[5] = @"MCNearbyServiceInviteIDKey";
    uint64_t v27 = v4;
    uint64_t v6 = [NSDictionary dictionaryWithObjects:&v23 forKeys:v22 count:6];
    uint64_t v7 = *(void *)(a1 + 64);
    BOOL v8 = *(NSObject **)(v7 + 88);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_52;
    block[3] = &unk_264337EC0;
    block[4] = v7;
    void block[5] = v6;
    int8x16_t v19 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    dispatch_async(v8, block);
    v20[0] = @"MCNearbyServiceRecipientPeerIDKey";
    uint64_t v9 = [*(id *)(a1 + 40) peerID];
    v20[1] = @"MCNearbyServiceSessionKey";
    v21[0] = v9;
    v21[1] = *(void *)(a1 + 72);
    objc_msgSend(*(id *)(*(void *)(a1 + 64) + 96), "setObject:forKey:", objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2), v5);
  }
  else
  {
    long long v10 = mcadvertiser_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_46_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

uint64_t __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_52(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  uint64_t v1 = a1[2].i64[1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_53;
  v5[3] = &unk_264338718;
  int8x16_t v3 = a1[3];
  int8x16_t v6 = vextq_s8(v3, v3, 8uLL);
  return [v2 syncSendDictionary:v1 toPeer:v3.i64[0] withCompletionHandler:v5];
}

void __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_53(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = mcadvertiser_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_53_cold_1();
    }
  }
}

uint64_t __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_56(int8x16_t *a1)
{
  v2 = (void *)a1[2].i64[0];
  uint64_t v1 = a1[2].i64[1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_57;
  v5[3] = &unk_264338718;
  int8x16_t v3 = a1[3];
  int8x16_t v6 = vextq_s8(v3, v3, 8uLL);
  return [v2 syncSendDictionary:v1 toPeer:v3.i64[0] withCompletionHandler:v5];
}

void __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_57(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = mcadvertiser_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_53_cold_1();
    }
  }
}

- (void)syncHandleInviteConnect:(id)a3 fromPeer:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v7 = -[MCPeerID initWithSerializedRepresentation:]([MCPeerID alloc], "initWithSerializedRepresentation:", [a3 objectForKey:@"MCNearbyServiceSenderPeerIDKey"]);
  BOOL v8 = -[MCPeerID initWithSerializedRepresentation:]([MCPeerID alloc], "initWithSerializedRepresentation:", [a3 objectForKey:@"MCNearbyServiceRecipientPeerIDKey"]);
  uint64_t v9 = mcadvertiser_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = a3;
    __int16 v22 = 2112;
    id v23 = a4;
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Got invite connect [%@] from peer [%@].", buf, 0x16u);
  }
  if ([(MCPeerID *)[(MCNearbyServiceAdvertiser *)self myPeerID] isEqual:v8])
  {
    if (objc_msgSend((id)objc_msgSend(a4, "peerID"), "isEqual:", v7))
    {
      uint64_t v10 = [a3 objectForKey:@"MCNearbyServiceConnectionDataKey"];
      uint64_t v11 = [a3 objectForKey:@"MCNearbyServiceInviteIDKey"];
      uint64_t v12 = [NSString stringWithFormat:@"from:%@=%@", objc_msgSend((id)objc_msgSend(a4, "peerID"), "displayName"), v11];
      uint64_t v13 = (void *)[(NSMutableDictionary *)self->_invites objectForKey:v12];
      uint64_t v14 = [v13 objectForKey:@"MCNearbyServiceRecipientPeerIDKey"];
      uint64_t v15 = (void *)[v13 objectForKey:@"MCNearbyServiceSessionKey"];
      if ([(MCPeerID *)v7 isEqual:v14])
      {
        if (v15)
        {
          objc_msgSend(v15, "connectPeer:withNearbyConnectionData:", objc_msgSend(a4, "peerID"), v10);
          [(NSMutableDictionary *)self->_invites removeObjectForKey:v12];
          [(MCNearbyServiceAdvertiser *)self syncCloseConnectionForPeer:a4];
        }
        else
        {
          int8x16_t v19 = mcadvertiser_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[MCNearbyServiceAdvertiser syncHandleInviteConnect:fromPeer:]();
          }
        }
      }
      else
      {
        __int16 v18 = mcadvertiser_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          -[MCNearbyServiceAdvertiser syncHandleInviteConnect:fromPeer:](v7);
        }
      }
    }
    else
    {
      uint64_t v17 = mcadvertiser_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MCNearbyServiceAdvertiser syncHandleInviteConnect:fromPeer:]();
      }
    }
  }
  else
  {
    uint64_t v16 = mcadvertiser_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MCNearbyServiceAdvertiser syncHandleInviteConnect:fromPeer:].cold.4();
    }
  }
}

- (void)syncSendData:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5
{
  if (![a4 state])
  {
    BOOL v8 = mcadvertiser_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MCNearbyServiceAdvertiser syncSendData:toPeer:withCompletionHandler:](a4);
    }
  }
  [a4 sendData:a3 withCompletionHandler:a5];
}

- (void)syncReceivedData:(id)a3 fromPeer:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int8x16_t v6 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  uint64_t v7 = mcadvertiser_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = a4;
    _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Received dict [%@] from peer [%@].", (uint8_t *)&v11, 0x16u);
  }
  if (v6)
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"MCNearbyServiceMessageIDKey"), "unsignedIntegerValue");
    if (v8 == 3)
    {
      [(MCNearbyServiceAdvertiser *)self syncHandleInviteConnect:v6 fromPeer:a4];
    }
    else
    {
      int v9 = v8;
      if (v8 == 1)
      {
        [(MCNearbyServiceAdvertiser *)self syncHandleInvite:v6 fromPeer:a4];
      }
      else
      {
        uint64_t v10 = mcadvertiser_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = 67109120;
          LODWORD(v12) = v9;
          _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Unknown or invalid nearby message type for the advertiser: %d.", (uint8_t *)&v11, 8u);
        }
      }
    }
  }
}

- (void)syncHandleIncomingInputStream:(id)a3 outputStream:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v7 = -[MCNearbyDiscoveryPeerConnection initWithLocalServiceName:]([MCNearbyDiscoveryPeerConnection alloc], "initWithLocalServiceName:", [NSString stringWithFormat:@"%@+%@", -[MCPeerID idString](-[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID"), "idString"), -[MCPeerID displayName](-[MCNearbyServiceAdvertiser myPeerID](self, "myPeerID"), "displayName")]);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke;
  v9[3] = &unk_2643387E0;
  v9[4] = v7;
  v9[5] = self;
  [(MCNearbyDiscoveryPeerConnection *)v7 setConnectedHandler:v9];
  [(MCNearbyDiscoveryPeerConnection *)v7 attachInputStream:a3 outputStream:a4];
  uint64_t v8 = mcadvertiser_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    int v11 = v7;
    _os_log_impl(&dword_218756000, v8, OS_LOG_TYPE_DEFAULT, "PeerConnection (advertiser side) created (%p).", buf, 0xCu);
  }
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  int v9 = mcadvertiser_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218242;
    uint64_t v25 = v10;
    __int16 v26 = 2112;
    uint64_t v27 = a2;
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "PeerConnection [%p] connectedHandler (advertiser side), remote identifier [%@].", buf, 0x16u);
  }
  int v11 = (void (**)(id, void))(id)[a4 copy];
  if (a2 && !a5)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    __int16 v13 = *(NSObject **)(v12 + 88);
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_63;
    v23[3] = &unk_264338000;
    v23[4] = v12;
    v23[5] = a2;
    v23[6] = *(void *)(a1 + 32);
    v23[7] = v11;
    dispatch_async(v13, v23);
    return;
  }
  id v14 = mcadvertiser_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_cold_2(a5);
    if (!a2)
    {
LABEL_8:
      uint64_t v15 = mcadvertiser_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
  else if (!a2)
  {
    goto LABEL_8;
  }
  if (v11) {
    v11[2](v11, 0);
  }
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_63(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  [*(id *)(a1 + 32) parseIDString:&v33 displayName:&v32 fromIdentifier:*(void *)(a1 + 40)];
  if (v33) {
    BOOL v2 = v32 == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    int v11 = [MCPeerID alloc];
    uint64_t v12 = [(MCPeerID *)v11 initWithIDString:v33 displayName:v32];
    __int16 v13 = (MCNearbyDiscoveryPeer *)(id)[*(id *)(*(void *)(a1 + 32) + 72) objectForKey:v12];
    if (v13)
    {
      id v14 = v13;
      int v15 = [(MCNearbyDiscoveryPeer *)v13 state];
      uint64_t v16 = mcadvertiser_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = [(MCNearbyDiscoveryPeer *)v14 state];
        *(_DWORD *)buf = 138412802;
        v35 = v14;
        __int16 v36 = 1024;
        int v37 = v17;
        __int16 v38 = 1024;
        BOOL v39 = v15 != 2;
        _os_log_impl(&dword_218756000, v16, OS_LOG_TYPE_DEFAULT, "Peer [%@] (advertiser side) already in dictionary [state = %d], decision = %d.", buf, 0x18u);
      }
      if (v15 != 2)
      {
        [*(id *)(a1 + 32) syncCloseConnectionForPeer:v14];
LABEL_17:
        uint64_t v21 = 1;
        goto LABEL_22;
      }
      uint64_t v21 = 0;
    }
    else
    {
      uint64_t v18 = mcadvertiser_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [(MCPeerID *)v12 displayNameAndPID];
        *(_DWORD *)buf = 138412290;
        v35 = (MCNearbyDiscoveryPeer *)v19;
        _os_log_impl(&dword_218756000, v18, OS_LOG_TYPE_DEFAULT, "Peer [%@] (advertiser side) not in dictionary, creating one, decision = YES.", buf, 0xCu);
      }
      uint64_t v20 = [[MCNearbyDiscoveryPeer alloc] initWithPeerID:v12];
      if (v20)
      {
        id v14 = v20;
        [*(id *)(*(void *)(a1 + 32) + 72) setObject:v20 forKey:v12];
        goto LABEL_17;
      }
      uint64_t v22 = mcadvertiser_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_63_cold_1(v12);
      }
      uint64_t v21 = 0;
      id v14 = 0;
    }
LABEL_22:
    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    uint64_t v28 = __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_65;
    __int16 v29 = &unk_2643387B8;
    uint64_t v30 = *(void *)(a1 + 32);
    uint64_t v31 = v14;
    if (v21)
    {
      [*(id *)(a1 + 48) setReceiveDataHandler:&v26];
      objc_msgSend(*(id *)(a1 + 32), "syncAttachConnection:toPeer:", *(void *)(a1 + 48), v14, v26, v27, v28, v29, v30, v31);
      id v23 = mcadvertiser_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v14;
        uint64_t v24 = "Peer [%@] connected (advertiser side) successfully.";
LABEL_27:
        _os_log_impl(&dword_218756000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
      }
    }
    else
    {
      id v23 = mcadvertiser_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v14;
        uint64_t v24 = "Peer [%@] (advertiser side) decision == NO.";
        goto LABEL_27;
      }
    }
    uint64_t v25 = *(void *)(a1 + 56);
    if (v25) {
      (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v25, v21);
    }

    return;
  }
  int8x16_t v3 = mcadvertiser_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_63_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_65(int8x16_t *a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = a1[2].i64[0];
    uint64_t v5 = *(NSObject **)(v4 + 88);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_2;
    v18[3] = &unk_264337D80;
    v18[4] = a1[2].i64[1];
    v18[5] = a3;
    v18[6] = v4;
    uint64_t v6 = v18;
  }
  else
  {
    if (!a2)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      int8x16_t v8 = vextq_s8(a1[2], a1[2], 8uLL);
      uint64_t v9 = a1[2].i64[0];
      block[2] = __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_66;
      block[3] = &unk_264337D58;
      uint64_t v10 = *(NSObject **)(v9 + 88);
      int8x16_t v17 = v8;
      dispatch_async(v10, block);
    }
    int v11 = mcadvertiser_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[2].i64[1];
      int v13 = [a2 length];
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v12;
      __int16 v21 = 1024;
      int v22 = v13;
      _os_log_impl(&dword_218756000, v11, OS_LOG_TYPE_DEFAULT, "Peer [%@] passing received data (length=%u) to the app.", buf, 0x12u);
    }
    uint64_t v14 = a1[2].i64[0];
    uint64_t v5 = *(NSObject **)(v14 + 88);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_67;
    v15[3] = &unk_264337D80;
    v15[4] = v14;
    v15[5] = a2;
    v15[6] = a1[2].i64[1];
    uint64_t v6 = v15;
  }
  dispatch_async(v5, v6);
}

uint64_t __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_2(uint64_t a1)
{
  BOOL v2 = mcadvertiser_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_2_cold_1(a1);
  }
  return [*(id *)(a1 + 48) syncCloseConnectionForPeer:*(void *)(a1 + 32)];
}

uint64_t __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_66(uint64_t a1)
{
  BOOL v2 = mcadvertiser_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_66_cold_1(a1, v2);
  }
  return [*(id *)(a1 + 40) syncCloseConnectionForPeer:*(void *)(a1 + 32)];
}

uint64_t __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_67(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncReceivedData:*(void *)(a1 + 40) fromPeer:*(void *)(a1 + 48)];
}

- (void)netService:(id)a3 didAcceptConnectionWithInputStream:(id)a4 outputStream:(id)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int8x16_t v8 = mcadvertiser_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v12 = a4;
    __int16 v13 = 2048;
    id v14 = a5;
    _os_log_impl(&dword_218756000, v8, OS_LOG_TYPE_DEFAULT, "Accepted connection with inputStream [%p] outputStream [%p].", buf, 0x16u);
  }
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__MCNearbyServiceAdvertiser_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke;
  block[3] = &unk_264337D80;
  void block[4] = self;
  void block[5] = a4;
  void block[6] = a5;
  dispatch_async(syncQueue, block);
}

uint64_t __88__MCNearbyServiceAdvertiser_netService_didAcceptConnectionWithInputStream_outputStream___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncHandleIncomingInputStream:*(void *)(a1 + 40) outputStream:*(void *)(a1 + 48)];
}

- (void)netServiceDidStop:(id)a3
{
  int8x16_t v3 = mcadvertiser_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_218756000, v3, OS_LOG_TYPE_DEFAULT, "Server stopped.", v4, 2u);
  }
}

- (void)netServiceDidPublish:(id)a3
{
  int8x16_t v3 = mcadvertiser_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_218756000, v3, OS_LOG_TYPE_DEFAULT, "Server did publish.", v4, 2u);
  }
}

- (void)netService:(id)a3 didNotPublish:(id)a4
{
  uint64_t v5 = mcadvertiser_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MCNearbyServiceAdvertiser netService:didNotPublish:]();
  }
  uint64_t Int64 = CFDictionaryGetInt64();
  if (Int64) {
    uint64_t v7 = Int64;
  }
  else {
    uint64_t v7 = -72000;
  }
  uint64_t v8 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFC560] code:v7 userInfo:0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __54__MCNearbyServiceAdvertiser_netService_didNotPublish___block_invoke;
  v9[3] = &unk_264337D58;
  v9[4] = self;
  v9[5] = v8;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __54__MCNearbyServiceAdvertiser_netService_didNotPublish___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int8x16_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 advertiser:v4 didNotStartAdvertisingPeer:v5];
  }
  return result;
}

- (MCPeerID)myPeerID
{
  return self->_myPeerID;
}

- (NSDictionary)discoveryInfo
{
  return self->_discoveryInfo;
}

- (void)setDiscoveryInfo:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)formattedServiceType
{
  return self->_formattedServiceType;
}

- (void)setFormattedServiceType:(id)a3
{
}

- (NSNetService)networkServer
{
  return self->_networkServer;
}

- (void)setNetworkServer:(id)a3
{
}

- (NSData)TXTRecordData
{
  return self->_TXTRecordData;
}

- (void)setTXTRecordData:(id)a3
{
}

- (NSMutableDictionary)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
}

- (int64_t)outgoingInviteID
{
  return self->_outgoingInviteID;
}

- (void)setOutgoingInviteID:(int64_t)a3
{
  self->_outgoingInviteID = a3;
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
}

- (NSMutableDictionary)invites
{
  return self->_invites;
}

- (void)setInvites:(id)a3
{
}

- (BOOL)isAdvertising
{
  return self->_isAdvertising;
}

- (void)setIsAdvertising:(BOOL)a3
{
  self->_isAdvertising = a3;
}

- (BOOL)wasAdvertising
{
  return self->_wasAdvertising;
}

- (void)setWasAdvertising:(BOOL)a3
{
  self->_wasAdvertising = a3;
}

- (BOOL)isAWDLDisabled
{
  return self->_AWDLDisabled;
}

- (void)setAWDLDisabled:(BOOL)a3
{
  self->_AWDLDisabled = a3;
}

- (void)syncHandleInvite:fromPeer:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)objc_msgSend(v0, "peerID"), "displayNameAndPID");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_218756000, v1, v2, "Peer is [%@], invite is from [%@].", v3, v4, v5, v6, v7);
}

- (void)syncHandleInvite:fromPeer:.cold.2()
{
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)objc_msgSend(v0, "myPeerID"), "displayNameAndPID");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_218756000, v1, v2, "I am [%@], invite is for [%@].", v3, v4, v5, v6, v7);
}

void __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_46_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_53_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5_0();
  _os_log_error_impl(&dword_218756000, v0, OS_LOG_TYPE_ERROR, "Failed to send dictionary [%@] to peer [%@].", v1, 0x16u);
}

- (void)syncHandleInviteConnect:fromPeer:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_218756000, v1, OS_LOG_TYPE_ERROR, "No session for peer [%@]. invites=[%@].", v2, 0x16u);
}

- (void)syncHandleInviteConnect:(void *)a1 fromPeer:.cold.2(void *a1)
{
  [a1 displayNameAndPID];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_17(&dword_218756000, v1, v2, "Received a connect from [%@], but we never accepted an invitation from it - aborting!", v3, v4, v5, v6, v7);
}

- (void)syncHandleInviteConnect:fromPeer:.cold.3()
{
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)objc_msgSend(v0, "peerID"), "displayNameAndPID");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_218756000, v1, v2, "Peer is [%@], invite response is from [%@].", v3, v4, v5, v6, v7);
}

- (void)syncHandleInviteConnect:fromPeer:.cold.4()
{
  OUTLINED_FUNCTION_6_0();
  objc_msgSend((id)objc_msgSend(v0, "myPeerID"), "displayNameAndPID");
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_218756000, v1, v2, "I am [%@], invite response is for [%@].", v3, v4, v5, v6, v7);
}

- (void)syncSendData:(void *)a1 toPeer:withCompletionHandler:.cold.1(void *a1)
{
  objc_msgSend((id)objc_msgSend(a1, "peerID"), "displayNameAndPID");
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_17(&dword_218756000, v1, v2, "We are trying to send data to peer [%@] and we are not connected.", v3, v4, v5, v6, v7);
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_cold_2(void *a1)
{
  [a1 localizedDescription];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_17(&dword_218756000, v1, v2, "PeerConnection connectedHandler (advertiser side) - error [%@].", v3, v4, v5, v6, v7);
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_63_cold_1(void *a1)
{
  [a1 displayNameAndPID];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_17(&dword_218756000, v1, v2, "Failed to initalize peer [%@].", v3, v4, v5, v6, v7);
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_63_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_2_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 40) localizedDescription];
  OUTLINED_FUNCTION_0_1(&dword_218756000, v1, v2, "Data from peer [%@] received with error %@.", v3, v4, v5, v6, 2u);
}

void __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_66_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_218756000, a2, OS_LOG_TYPE_ERROR, "Nil data from peer [%@] received -- should not happen.", (uint8_t *)&v3, 0xCu);
}

- (void)netService:didNotPublish:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_218756000, v0, OS_LOG_TYPE_ERROR, "Server did not publish: errorDict [%@].", v1, 0xCu);
}

@end