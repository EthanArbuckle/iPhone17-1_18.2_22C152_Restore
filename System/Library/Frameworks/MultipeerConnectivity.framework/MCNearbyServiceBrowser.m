@interface MCNearbyServiceBrowser
- (BOOL)isAWDLDisabled;
- (BOOL)isBrowsing;
- (BOOL)wasBrowsing;
- (MCNearbyServiceBrowser)init;
- (MCNearbyServiceBrowser)initWithPeer:(MCPeerID *)myPeerID serviceType:(NSString *)serviceType;
- (MCPeerID)myPeerID;
- (NSMutableDictionary)invites;
- (NSMutableDictionary)netServices;
- (NSMutableDictionary)peers;
- (NSNetServiceBrowser)networkBrowser;
- (NSString)description;
- (NSString)formattedServiceType;
- (NSString)serviceType;
- (OS_dispatch_queue)syncQueue;
- (id)delegate;
- (id)rebuildUserDiscoveryInfoFromTXTRecordDictionary:(id)a3;
- (int64_t)outgoingInviteID;
- (int64_t)syncNextOutgoingInviteID;
- (void)applicationDidEnterBackgroundNotification:(id)a3;
- (void)applicationWillEnterForegroundNotification:(id)a3;
- (void)dealloc;
- (void)invitePeer:(MCPeerID *)peerID toSession:(MCSession *)session withContext:(NSData *)context timeout:(NSTimeInterval)timeout;
- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4;
- (void)netServiceBrowser:(id)a3 didFindDomain:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4;
- (void)netServiceBrowser:(id)a3 didRemoveDomain:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5;
- (void)netServiceBrowserDidStopSearch:(id)a3;
- (void)netServiceBrowserWillSearch:(id)a3;
- (void)parseIDString:(id *)a3 displayName:(id *)a4 fromIdentifier:(id)a5;
- (void)setAWDLDisabled:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setFormattedServiceType:(id)a3;
- (void)setInvites:(id)a3;
- (void)setIsBrowsing:(BOOL)a3;
- (void)setNetServices:(id)a3;
- (void)setNetworkBrowser:(id)a3;
- (void)setOutgoingInviteID:(int64_t)a3;
- (void)setPeers:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setSyncQueue:(id)a3;
- (void)setWasBrowsing:(BOOL)a3;
- (void)startBrowsingForPeers;
- (void)stopBrowsingForPeers;
- (void)syncAttachConnection:(id)a3 toPeer:(id)a4;
- (void)syncCloseConnectionForPeer:(id)a3;
- (void)syncHandleDeclinedInviteWithInfo:(id)a3;
- (void)syncHandleInviteResponse:(id)a3 fromPeer:(id)a4;
- (void)syncHandleInviteTimeout:(id)a3 forPeer:(id)a4;
- (void)syncInitiateConnectionToPeer:(id)a3;
- (void)syncInvitePeer:(id)a3 toSession:(id)a4 withContext:(id)a5 timeout:(double)a6;
- (void)syncReceivedData:(id)a3 fromPeer:(id)a4;
- (void)syncSendData:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5;
- (void)syncSendDictionary:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5;
- (void)syncStartBrowsingForPeers;
- (void)syncStopBrowsingForPeers;
@end

@implementation MCNearbyServiceBrowser

- (MCNearbyServiceBrowser)init
{
  v3.receiver = self;
  v3.super_class = (Class)MCNearbyServiceBrowser;
  [(MCNearbyServiceBrowser *)&v3 doesNotRecognizeSelector:a2];
  return 0;
}

- (MCNearbyServiceBrowser)initWithPeer:(MCPeerID *)myPeerID serviceType:(NSString *)serviceType
{
  v17.receiver = self;
  v17.super_class = (Class)MCNearbyServiceBrowser;
  v6 = [(MCNearbyServiceBrowser *)&v17 init];
  if (v6)
  {
    v6->_peers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6->_invites = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6->_netServices = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    if (!myPeerID)
    {
      v7 = (void *)MEMORY[0x263EFF940];
      uint64_t v8 = *MEMORY[0x263EFF4A0];
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      v11 = (objc_class *)objc_opt_class();
      [v7 raise:v8, @"A nil %@ object passed to %@", v10, NSStringFromClass(v11) format];
    }
    v6->_myPeerID = (MCPeerID *)[(MCPeerID *)myPeerID copy];
    if (!+[MCNearbyServiceUtils isServiceTypeValid:serviceType])
    {
      v12 = (void *)MEMORY[0x263EFF940];
      uint64_t v13 = *MEMORY[0x263EFF4A0];
      v14 = (objc_class *)objc_opt_class();
      [v12 raise:v13, @"Invalid serviceType passed to %@", NSStringFromClass(v14) format];
    }
    v6->_serviceType = (NSString *)[(NSString *)serviceType copy];
    v6->_formattedServiceType = (NSString *)objc_msgSend(+[MCNearbyServiceUtils formattedServiceType:](MCNearbyServiceUtils, "formattedServiceType:", serviceType), "copy");
    v6->_syncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.MCNearbyServiceBrowser.syncQueue", 0);
    v15 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v6 selector:sel_applicationDidEnterBackgroundNotification_ name:*MEMORY[0x263F1D050] object:0];
    [v15 addObserver:v6 selector:sel_applicationWillEnterForegroundNotification_ name:*MEMORY[0x263F1D0D0] object:0];
    [v15 addObserver:v6 selector:sel_applicationWillTerminateNotification_ name:*MEMORY[0x263F1D0E0] object:0];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v3 = (void *)[(NSMutableDictionary *)[(MCNearbyServiceBrowser *)self netServices] allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138412290;
    long long v14 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        v10 = mcbrowser_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = [v9 name];
          *(_DWORD *)buf = v14;
          uint64_t v21 = v11;
          _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Removing netservice [%@] from net services dictionary.", buf, 0xCu);
        }
        objc_msgSend(v9, "stopMonitoring", v14);
        [v9 setDelegate:0];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v6);
  }

  [(NSNetServiceBrowser *)self->_networkBrowser setDelegate:0];
  [(NSNetServiceBrowser *)self->_networkBrowser stop];
  networkBrowser = self->_networkBrowser;
  uint64_t v13 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [(NSNetServiceBrowser *)networkBrowser removeFromRunLoop:v13 forMode:*MEMORY[0x263EFF588]];

  objc_storeWeak((id *)&self->_delegate, 0);
  dispatch_release((dispatch_object_t)self->_syncQueue);
  v15.receiver = self;
  v15.super_class = (Class)MCNearbyServiceBrowser;
  [(MCNearbyServiceBrowser *)&v15 dealloc];
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MCNearbyServiceBrowser *)self myPeerID];
  uint64_t v7 = [(MCNearbyServiceBrowser *)self serviceType];
  [(MCNearbyServiceBrowser *)self delegate];
  uint64_t v8 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p MyPeerID = %@ ServiceType = %@ Delegate = <%@: %p>>", v5, self, v6, v7, NSStringFromClass(v8), -[MCNearbyServiceBrowser delegate](self, "delegate")];
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (int64_t)syncNextOutgoingInviteID
{
  int64_t outgoingInviteID = self->_outgoingInviteID;
  self->_int64_t outgoingInviteID = outgoingInviteID + 1;
  return outgoingInviteID;
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
  v10 = mcbrowser_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = a5;
    __int16 v13 = 1024;
    int v14 = v9;
    _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Identifier [%@] failed to parse @%d.", (uint8_t *)&v11, 0x12u);
  }
}

- (void)syncStartBrowsingForPeers
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  if (![(MCNearbyServiceBrowser *)self isBrowsing])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    objc_super v3 = (void *)[(NSMutableDictionary *)[(MCNearbyServiceBrowser *)self invites] allValues];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v37 objects:v45 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v38 != v6) {
            objc_enumerationMutation(v3);
          }
          [(MCNearbyServiceBrowser *)self syncHandleDeclinedInviteWithInfo:*(void *)(*((void *)&v37 + 1) + 8 * i)];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v37 objects:v45 count:16];
      }
      while (v5);
    }
    [(NSMutableDictionary *)self->_invites removeAllObjects];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v8 = (void *)[(NSMutableDictionary *)self->_peers allValues];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v44 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v10; ++j)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          objc_msgSend((id)objc_msgSend(v13, "netService"), "stopMonitoring");
          objc_msgSend((id)objc_msgSend(v13, "netService"), "setDelegate:", 0);
          [v13 setNetService:0];
          [v13 invalidate];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v44 count:16];
      }
      while (v10);
    }
    [(NSMutableDictionary *)self->_peers removeAllObjects];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    int v14 = (void *)[(NSMutableDictionary *)[(MCNearbyServiceBrowser *)self netServices] allValues];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v43 count:16];
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = *(void *)v30;
      *(void *)&long long v16 = 138412290;
      long long v28 = v16;
      do
      {
        for (uint64_t k = 0; k != v17; ++k)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v14);
          }
          v20 = *(void **)(*((void *)&v29 + 1) + 8 * k);
          uint64_t v21 = mcbrowser_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v22 = [v20 name];
            *(_DWORD *)buf = v28;
            uint64_t v42 = v22;
            _os_log_impl(&dword_218756000, v21, OS_LOG_TYPE_DEFAULT, "Removing netservice [%@] from net services dictionary.", buf, 0xCu);
          }
          objc_msgSend(v20, "stopMonitoring", v28);
          [v20 setDelegate:0];
        }
        uint64_t v17 = [v14 countByEnumeratingWithState:&v29 objects:v43 count:16];
      }
      while (v17);
    }
    [(NSMutableDictionary *)[(MCNearbyServiceBrowser *)self netServices] removeAllObjects];
    if (![(MCNearbyServiceBrowser *)self networkBrowser])
    {
      id v23 = objc_alloc_init(MEMORY[0x263EFC5F8]);
      if (![(MCNearbyServiceBrowser *)self isAWDLDisabled]) {
        [v23 setIncludesPeerToPeer:1];
      }
      [(MCNearbyServiceBrowser *)self setNetworkBrowser:v23];
    }
    [(NSNetServiceBrowser *)[(MCNearbyServiceBrowser *)self networkBrowser] setDelegate:self];
    v24 = [(MCNearbyServiceBrowser *)self networkBrowser];
    uint64_t v25 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [(NSNetServiceBrowser *)v24 scheduleInRunLoop:v25 forMode:*MEMORY[0x263EFF588]];
    [(NSNetServiceBrowser *)[(MCNearbyServiceBrowser *)self networkBrowser] searchForServicesOfType:[(MCNearbyServiceBrowser *)self formattedServiceType] inDomain:@"local."];
    [(MCNearbyServiceBrowser *)self setIsBrowsing:1];
    v26 = mcbrowser_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = [(MCNearbyServiceBrowser *)self formattedServiceType];
      *(_DWORD *)buf = 138412290;
      uint64_t v42 = (uint64_t)v27;
      _os_log_impl(&dword_218756000, v26, OS_LOG_TYPE_DEFAULT, "Start discovering services of type [%@].", buf, 0xCu);
    }
  }
}

- (void)startBrowsingForPeers
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__MCNearbyServiceBrowser_startBrowsingForPeers__block_invoke;
  block[3] = &unk_264337EE8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __47__MCNearbyServiceBrowser_startBrowsingForPeers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncStartBrowsingForPeers];
}

- (void)syncStopBrowsingForPeers
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if ([(MCNearbyServiceBrowser *)self isBrowsing])
  {
    [(NSNetServiceBrowser *)[(MCNearbyServiceBrowser *)self networkBrowser] setDelegate:0];
    [(NSNetServiceBrowser *)[(MCNearbyServiceBrowser *)self networkBrowser] stop];
    objc_super v3 = [(MCNearbyServiceBrowser *)self networkBrowser];
    uint64_t v4 = [MEMORY[0x263EFF9F0] mainRunLoop];
    [(NSNetServiceBrowser *)v3 removeFromRunLoop:v4 forMode:*MEMORY[0x263EFF588]];
    [(MCNearbyServiceBrowser *)self setIsBrowsing:0];
    uint64_t v5 = mcbrowser_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      uint64_t v7 = [(MCNearbyServiceBrowser *)self formattedServiceType];
      _os_log_impl(&dword_218756000, v5, OS_LOG_TYPE_DEFAULT, "Stop discovering services of type [%@].", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)stopBrowsingForPeers
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__MCNearbyServiceBrowser_stopBrowsingForPeers__block_invoke;
  block[3] = &unk_264337EE8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __46__MCNearbyServiceBrowser_stopBrowsingForPeers__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncStopBrowsingForPeers];
}

- (void)applicationDidEnterBackgroundNotification:(id)a3
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__MCNearbyServiceBrowser_applicationDidEnterBackgroundNotification___block_invoke;
  block[3] = &unk_264337EE8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __68__MCNearbyServiceBrowser_applicationDidEnterBackgroundNotification___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isBrowsing];
  if (result)
  {
    [*(id *)(a1 + 32) setWasBrowsing:1];
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 syncStopBrowsingForPeers];
  }
  return result;
}

- (void)applicationWillEnterForegroundNotification:(id)a3
{
  syncQueue = self->_syncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__MCNearbyServiceBrowser_applicationWillEnterForegroundNotification___block_invoke;
  block[3] = &unk_264337EE8;
  block[4] = self;
  dispatch_async(syncQueue, block);
}

uint64_t __69__MCNearbyServiceBrowser_applicationWillEnterForegroundNotification___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) wasBrowsing];
  if (result)
  {
    [*(id *)(a1 + 32) setWasBrowsing:0];
    objc_super v3 = *(void **)(a1 + 32);
    return [v3 syncStartBrowsingForPeers];
  }
  return result;
}

- (void)syncInitiateConnectionToPeer:(id)a3
{
  uint64_t v5 = [NSString stringWithFormat:@"%@+%@", -[MCPeerID idString](-[MCNearbyServiceBrowser myPeerID](self, "myPeerID"), "idString"), -[MCPeerID displayName](-[MCNearbyServiceBrowser myPeerID](self, "myPeerID"), "displayName")];
  int v6 = [[MCNearbyDiscoveryPeerConnection alloc] initWithLocalServiceName:v5];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke;
  v7[3] = &unk_264338830;
  v7[4] = a3;
  v7[5] = self;
  v7[6] = v5;
  v7[7] = v6;
  [(MCNearbyDiscoveryPeerConnection *)v6 setConnectedHandler:v7];
  -[MCNearbyDiscoveryPeerConnection connectToNetService:](v6, "connectToNetService:", [a3 netService]);
  [a3 setTrialConnection:v6];
}

void __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke(id *a1, void *a2, int a3, void *a4, void *a5)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v10 = mcbrowser_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v43 = a2;
    _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "PeerConnection connectedHandler (browser side), remote identifier [%@].", buf, 0xCu);
  }
  uint64_t v11 = (void (**)(id, void))(id)[a4 copy];
  if (a5)
  {
    id v12 = mcbrowser_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_cold_3((uint64_t)a1, a5);
    }
    __int16 v13 = *((void *)a1[5] + 10);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_37;
    block[3] = &unk_264337EE8;
    block[4] = a1[4];
    dispatch_async(v13, block);
LABEL_7:
    if (v11) {
      v11[2](v11, 0);
    }
    return;
  }
  uint64_t v39 = 0;
  uint64_t v40 = 0;
  [a1[5] parseIDString:&v40 displayName:&v39 fromIdentifier:a2];
  if (v40 && v39)
  {
    int v14 = [MCPeerID alloc];
    if (!-[MCPeerID isEqual:](-[MCPeerID initWithIDString:displayName:](v14, "initWithIDString:displayName:", v40, v39), "isEqual:", [a1[4] peerID]))
    {
      long long v31 = mcbrowser_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_cold_1();
      }
      goto LABEL_7;
    }
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_38;
    v37[3] = &unk_2643387B8;
    int8x16_t v38 = vextq_s8(*((int8x16_t *)a1 + 2), *((int8x16_t *)a1 + 2), 8uLL);
    uint64_t v15 = mcbrowser_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = a1[4];
      if (a3) {
        uint64_t v17 = "yes";
      }
      else {
        uint64_t v17 = "no";
      }
      id v18 = a1[7];
      uint64_t v19 = objc_msgSend(v16, "stringForState:", objc_msgSend(a1[4], "state"));
      *(_DWORD *)buf = 138413058;
      id v43 = v16;
      __int16 v44 = 2080;
      v45 = v17;
      __int16 v46 = 2048;
      id v47 = v18;
      __int16 v48 = 2112;
      uint64_t v49 = v19;
      _os_log_impl(&dword_218756000, v15, OS_LOG_TYPE_DEFAULT, "ConnectionHandler [%@] (browser side) shouldForceConnect [%s]; peer.connection [%p] state [%@].",
        buf,
        0x2Au);
    }
    if (a3)
    {
      [a1[7] setReceiveDataHandler:v37];
      id v20 = a1[5];
      uint64_t v21 = *((void *)v20 + 10);
      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      v36[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_44;
      v36[3] = &unk_264337D80;
      id v22 = a1[7];
      v36[4] = v20;
      v36[5] = v22;
      v36[6] = a1[4];
      dispatch_async(v21, v36);
      if (v11) {
        v11[2](v11, 1);
      }
    }
    else
    {
      id v32 = a1[5];
      long long v33 = *((void *)v32 + 10);
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_2_45;
      v35[3] = &unk_264338808;
      id v34 = a1[7];
      v35[4] = a1[4];
      v35[5] = v34;
      v35[6] = v32;
      v35[7] = v37;
      v35[8] = v11;
      dispatch_async(v33, v35);
    }
  }
  else
  {
    id v23 = mcbrowser_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      __72__MCNearbyServiceAdvertiser_syncHandleIncomingInputStream_outputStream___block_invoke_63_cold_2(v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
}

uint64_t __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_37(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "trialConnection"), "invalidate");
  v2 = *(void **)(a1 + 32);

  return [v2 setTrialConnection:0];
}

void __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_38(int8x16_t *a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v4 = a1[2].i64[0];
    uint64_t v5 = *(NSObject **)(v4 + 80);
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_2;
    v18[3] = &unk_264337D80;
    v18[4] = a1[2].i64[1];
    v18[5] = a3;
    v18[6] = v4;
    int v6 = v18;
  }
  else
  {
    if (!a2)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      int8x16_t v8 = vextq_s8(a1[2], a1[2], 8uLL);
      uint64_t v9 = a1[2].i64[0];
      block[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_39;
      block[3] = &unk_264337D58;
      uint64_t v10 = *(NSObject **)(v9 + 80);
      int8x16_t v17 = v8;
      dispatch_async(v10, block);
    }
    uint64_t v11 = mcbrowser_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = a1[2].i64[1];
      int v13 = [a2 length];
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v12;
      __int16 v21 = 1024;
      int v22 = v13;
      _os_log_impl(&dword_218756000, v11, OS_LOG_TYPE_DEFAULT, "Peer [%@] passing data (length=%u) to the app.", buf, 0x12u);
    }
    uint64_t v14 = a1[2].i64[0];
    uint64_t v5 = *(NSObject **)(v14 + 80);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_40;
    v15[3] = &unk_264337D80;
    v15[4] = v14;
    v15[5] = a2;
    v15[6] = a1[2].i64[1];
    int v6 = v15;
  }
  dispatch_async(v5, v6);
}

uint64_t __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = mcbrowser_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) localizedDescription];
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Peer [%@] data received with error %@.", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 48) syncCloseConnectionForPeer:*(void *)(a1 + 32)];
}

uint64_t __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_39(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = mcbrowser_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Peer [%@] connection closed.", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 40) syncCloseConnectionForPeer:*(void *)(a1 + 32)];
}

uint64_t __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_40(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncReceivedData:*(void *)(a1 + 40) fromPeer:*(void *)(a1 + 48)];
}

uint64_t __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_44(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncAttachConnection:*(void *)(a1 + 40) toPeer:*(void *)(a1 + 48)];
}

uint64_t __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_2_45(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) state];
  if (v2 == 2)
  {
    uint64_t v3 = mcbrowser_log();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v6;
    int v5 = "Peer [%@] (browser side) decision == NO.";
  }
  else
  {
    [*(id *)(a1 + 40) setReceiveDataHandler:*(void *)(a1 + 56)];
    [*(id *)(a1 + 48) syncAttachConnection:*(void *)(a1 + 40) toPeer:*(void *)(a1 + 32)];
    uint64_t v3 = mcbrowser_log();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v4 = *(void *)(a1 + 32);
    int v10 = 138412290;
    uint64_t v11 = v4;
    int v5 = "Peer [%@] (browser side) connected successfully.";
  }
  _os_log_impl(&dword_218756000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v10, 0xCu);
LABEL_7:
  uint64_t v7 = mcbrowser_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 1024;
    BOOL v13 = v2 != 2;
    _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Peer [%@] (browser side) about to return decision == %d.", (uint8_t *)&v10, 0x12u);
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, v2 != 2);
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
  uint64_t v7 = *MEMORY[0x263EF8340];
  [a3 closeConnection];
  uint64_t v4 = mcbrowser_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "peerID"), "displayNameAndPID");
    _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Setting peer [%@] state to Not Connected.", (uint8_t *)&v5, 0xCu);
  }
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
    uint64_t v11 = mcbrowser_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = a3;
      __int16 v15 = 2112;
      id v16 = a4;
      _os_log_impl(&dword_218756000, v11, OS_LOG_TYPE_DEFAULT, "Sending dictionary %@ to peer %@.", buf, 0x16u);
    }
    [(MCNearbyServiceBrowser *)self syncSendData:v10 toPeer:a4 withCompletionHandler:v8];
  }
  else if (v8)
  {
    v8[2](v8, v12);
  }
}

- (void)syncInvitePeer:(id)a3 toSession:(id)a4 withContext:(id)a5 timeout:(double)a6
{
  v29[5] = *MEMORY[0x263EF8340];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[MCNearbyServiceBrowser syncNextOutgoingInviteID](self, "syncNextOutgoingInviteID"));
  uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "peerID"), "serializedRepresentation");
  id v13 = [(MCPeerID *)[(MCNearbyServiceBrowser *)self myPeerID] serializedRepresentation];
  if (a5)
  {
    v28[0] = @"MCNearbyServiceMessageIDKey";
    v29[0] = [NSNumber numberWithUnsignedInteger:1];
    v29[1] = v13;
    v28[1] = @"MCNearbyServiceSenderPeerIDKey";
    v28[2] = @"MCNearbyServiceRecipientPeerIDKey";
    v29[2] = v12;
    v29[3] = v11;
    v28[3] = @"MCNearbyServiceInviteIDKey";
    v28[4] = @"MCNearbyServiceInviteContextKey";
    v29[4] = a5;
    id v14 = NSDictionary;
    __int16 v15 = v29;
    id v16 = v28;
    uint64_t v17 = 5;
  }
  else
  {
    v26[0] = @"MCNearbyServiceMessageIDKey";
    v27[0] = [NSNumber numberWithUnsignedInteger:1];
    v27[1] = v13;
    v26[1] = @"MCNearbyServiceSenderPeerIDKey";
    v26[2] = @"MCNearbyServiceRecipientPeerIDKey";
    v26[3] = @"MCNearbyServiceInviteIDKey";
    v27[2] = v12;
    v27[3] = v11;
    id v14 = NSDictionary;
    __int16 v15 = v27;
    id v16 = v26;
    uint64_t v17 = 4;
  }
  uint64_t v18 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:v17];
  v24[0] = @"MCNearbyServiceRecipientPeerIDKey";
  v24[1] = @"MCNearbyServiceSessionKey";
  v25[0] = [a3 peerID];
  v25[1] = a4;
  -[NSMutableDictionary setObject:forKey:](self->_invites, "setObject:forKey:", [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2], v11);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __71__MCNearbyServiceBrowser_syncInvitePeer_toSession_withContext_timeout___block_invoke;
  v23[3] = &unk_264338718;
  v23[4] = v18;
  v23[5] = a3;
  [(MCNearbyServiceBrowser *)self syncSendDictionary:v18 toPeer:a3 withCompletionHandler:v23];
  double v19 = a6 * 1000000000.0;
  if (a6 <= 0.0) {
    double v19 = 3.0e10;
  }
  dispatch_time_t v20 = dispatch_time(0, (uint64_t)v19);
  syncQueue = self->_syncQueue;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __71__MCNearbyServiceBrowser_syncInvitePeer_toSession_withContext_timeout___block_invoke_51;
  v22[3] = &unk_264337D80;
  v22[4] = self;
  v22[5] = v18;
  v22[6] = a3;
  dispatch_after(v20, syncQueue, v22);
}

void __71__MCNearbyServiceBrowser_syncInvitePeer_toSession_withContext_timeout___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int v2 = mcbrowser_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __55__MCNearbyServiceAdvertiser_syncHandleInvite_fromPeer___block_invoke_2_53_cold_1();
    }
  }
}

uint64_t __71__MCNearbyServiceBrowser_syncInvitePeer_toSession_withContext_timeout___block_invoke_51(uint64_t a1)
{
  return [*(id *)(a1 + 32) syncHandleInviteTimeout:*(void *)(a1 + 40) forPeer:*(void *)(a1 + 48)];
}

- (void)syncHandleInviteResponse:(id)a3 fromPeer:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  int v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"MCNearbyServiceAcceptInviteKey"), "BOOLValue");
  uint64_t v8 = mcbrowser_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = a3;
    __int16 v28 = 2112;
    id v29 = a4;
    _os_log_impl(&dword_218756000, v8, OS_LOG_TYPE_DEFAULT, "Got invite response [%@] from peer [%@].", buf, 0x16u);
  }
  uint64_t v9 = [a3 objectForKey:@"MCNearbyServiceRecipientPeerIDKey"];
  uint64_t v10 = [[MCPeerID alloc] initWithSerializedRepresentation:v9];
  if ([(MCPeerID *)[(MCNearbyServiceBrowser *)self myPeerID] isEqual:v10])
  {
    uint64_t v11 = [a3 objectForKey:@"MCNearbyServiceSenderPeerIDKey"];
    uint64_t v12 = [[MCPeerID alloc] initWithSerializedRepresentation:v11];
    if (objc_msgSend((id)objc_msgSend(a4, "peerID"), "isEqual:", v12))
    {
      int v24 = v7;
      p_invites = &self->_invites;
      uint64_t v23 = [a3 objectForKey:@"MCNearbyServiceInviteIDKey"];
      id v14 = (void *)-[NSMutableDictionary objectForKey:](self->_invites, "objectForKey:");
      uint64_t v15 = [v14 objectForKey:@"MCNearbyServiceRecipientPeerIDKey"];
      id v16 = (void *)[v14 objectForKey:@"MCNearbyServiceSessionKey"];
      if ([(MCPeerID *)v12 isEqual:v15])
      {
        if (v16)
        {
          uint64_t v17 = [a4 peerID];
          if (v24)
          {
            v25[0] = MEMORY[0x263EF8330];
            v25[1] = 3221225472;
            void v25[2] = __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke;
            v25[3] = &unk_264338880;
            v25[4] = v9;
            v25[5] = v11;
            uint64_t v18 = v23;
            v25[6] = v23;
            v25[7] = self;
            v25[8] = a4;
            v25[9] = a3;
            v25[10] = v12;
            v25[11] = v16;
            [v16 nearbyConnectionDataForPeer:v17 withCompletionHandler:v25];
          }
          else
          {
            [v16 peerDidDeclineInvitation:v17];
            [(MCNearbyServiceBrowser *)self syncCloseConnectionForPeer:a4];
            uint64_t v18 = v23;
          }
          [(NSMutableDictionary *)*p_invites removeObjectForKey:v18];
        }
        else
        {
          int v22 = mcbrowser_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            -[MCNearbyServiceBrowser syncHandleInviteResponse:fromPeer:]((uint64_t)a4, p_invites, v22);
          }
        }
      }
      else
      {
        __int16 v21 = mcbrowser_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          -[MCNearbyServiceBrowser syncHandleInviteResponse:fromPeer:](v12, v21);
        }
      }
    }
    else
    {
      dispatch_time_t v20 = mcbrowser_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[MCNearbyServiceBrowser syncHandleInviteResponse:fromPeer:](a4, v12);
      }
    }
  }
  else
  {
    double v19 = mcbrowser_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MCNearbyServiceBrowser syncHandleInviteResponse:fromPeer:].cold.4(self, v10);
    }
  }
}

void __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  if (a2)
  {
    v19[0] = @"MCNearbyServiceMessageIDKey";
    uint64_t v20 = [NSNumber numberWithUnsignedInteger:3];
    v19[1] = @"MCNearbyServiceSenderPeerIDKey";
    v19[2] = @"MCNearbyServiceRecipientPeerIDKey";
    long long v21 = *(_OWORD *)(a1 + 32);
    v19[3] = @"MCNearbyServiceInviteIDKey";
    v19[4] = @"MCNearbyServiceConnectionDataKey";
    uint64_t v22 = *(void *)(a1 + 48);
    uint64_t v23 = a2;
    uint64_t v4 = [NSDictionary dictionaryWithObjects:&v20 forKeys:v19 count:5];
    uint64_t v5 = *(void *)(a1 + 56);
    uint64_t v6 = *(NSObject **)(v5 + 80);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_52;
    block[3] = &unk_264338790;
    void block[4] = v5;
    void block[5] = v4;
    long long v7 = *(_OWORD *)(a1 + 80);
    long long v17 = *(_OWORD *)(a1 + 64);
    long long v18 = v7;
    dispatch_async(v6, block);
  }
  else
  {
    uint64_t v8 = mcbrowser_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

uint64_t __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_52(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  long long v7 = __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_2;
  uint64_t v8 = &unk_264338858;
  long long v9 = *(_OWORD *)(a1 + 56);
  return objc_msgSend(v2, "syncSendDictionary:toPeer:withCompletionHandler:", v1, MEMORY[0x263EF8330], 3221225472, __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_2, &unk_264338858, v9, *(void *)(a1 + 72), v3);
}

void __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = mcbrowser_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_2_cold_1(a1);
    }
  }
  else
  {
    uint64_t v4 = [*(id *)(a1 + 32) objectForKey:@"MCNearbyServiceConnectionDataKey"];
    uint64_t v5 = *(void **)(a1 + 48);
    uint64_t v6 = [*(id *)(a1 + 56) peerID];
    [v5 connectPeer:v6 withNearbyConnectionData:v4];
  }
}

- (void)syncHandleDeclinedInviteWithInfo:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v5 = (void *)[a3 objectForKey:@"MCNearbyServiceSessionKey"];
    uint64_t v6 = [a3 objectForKey:@"MCNearbyServiceRecipientPeerIDKey"];
    long long v7 = mcbrowser_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v6;
      _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Handle declined invitation from peer with peerID [%@].", buf, 0xCu);
    }
    [v5 peerDidDeclineInvitation:v6];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = (void *)[(NSMutableDictionary *)[(MCNearbyServiceBrowser *)self peers] allValues];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
LABEL_6:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v14 + 1) + 8 * v12);
        if (objc_msgSend((id)objc_msgSend(v13, "peerID"), "isEqual:", v6)) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v10) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      uint64_t v13 = 0;
    }
    if (v6) {
      [(MCNearbyServiceBrowser *)self syncCloseConnectionForPeer:v13];
    }
  }
}

- (void)syncHandleInviteTimeout:(id)a3 forPeer:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v6 = [a3 objectForKey:@"MCNearbyServiceInviteIDKey"];
  long long v7 = mcbrowser_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = a4;
    _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Invite timeout for peer [%@] fired.", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = [(NSMutableDictionary *)self->_invites objectForKey:v6];
  if (v8)
  {
    [(MCNearbyServiceBrowser *)self syncHandleDeclinedInviteWithInfo:v8];
    [(NSMutableDictionary *)self->_invites removeObjectForKey:v6];
  }
}

- (void)syncSendData:(id)a3 toPeer:(id)a4 withCompletionHandler:(id)a5
{
  if (![a4 state]) {
    [(MCNearbyServiceBrowser *)self syncInitiateConnectionToPeer:a4];
  }

  [a4 sendData:a3 withCompletionHandler:a5];
}

- (void)syncReceivedData:(id)a3 fromPeer:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:a3 options:0 format:0 error:0];
  long long v7 = mcbrowser_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = a4;
    _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Received dictionary [%@] from peer [%@].", (uint8_t *)&v11, 0x16u);
  }
  if (v6)
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", @"MCNearbyServiceMessageIDKey"), "unsignedIntegerValue");
    if (v8 == 2)
    {
      [(MCNearbyServiceBrowser *)self syncHandleInviteResponse:v6 fromPeer:a4];
    }
    else
    {
      int v9 = v8;
      id v10 = mcbrowser_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 67109120;
        LODWORD(v12) = v9;
        _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Unknown or invalid nearby message type for the browser: %d.", (uint8_t *)&v11, 8u);
      }
    }
  }
}

- (void)invitePeer:(MCPeerID *)peerID toSession:(MCSession *)session withContext:(NSData *)context timeout:(NSTimeInterval)timeout
{
  if (!peerID)
  {
    __int16 v13 = mcbrowser_log();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v14 = "Bad argument peerID=nil";
    goto LABEL_8;
  }
  if (session)
  {
    id v10 = (void *)[(MCPeerID *)peerID copy];
    int v11 = (void *)[(NSData *)context copy];
    syncQueue = self->_syncQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67__MCNearbyServiceBrowser_invitePeer_toSession_withContext_timeout___block_invoke;
    block[3] = &unk_2643388A8;
    void block[4] = self;
    void block[5] = v10;
    void block[6] = session;
    block[7] = v11;
    *(NSTimeInterval *)&block[8] = timeout;
    dispatch_async(syncQueue, block);

    return;
  }
  __int16 v13 = mcbrowser_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v14 = "Bad argument session=nil";
LABEL_8:
    _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
  }
}

void __67__MCNearbyServiceBrowser_invitePeer_toSession_withContext_timeout___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    double v7 = *(double *)(a1 + 64);
    [v4 syncInvitePeer:v3 toSession:v5 withContext:v6 timeout:v7];
  }
  else
  {
    uint64_t v8 = mcbrowser_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [*(id *)(a1 + 40) displayNameAndPID];
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v9;
      _os_log_impl(&dword_218756000, v8, OS_LOG_TYPE_DEFAULT, "Peer [%@] not in peers dictionary anymore.", buf, 0xCu);
    }
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__MCNearbyServiceBrowser_invitePeer_toSession_withContext_timeout___block_invoke_53;
    v10[3] = &unk_264337D58;
    long long v11 = *(_OWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

uint64_t __67__MCNearbyServiceBrowser_invitePeer_toSession_withContext_timeout___block_invoke_53(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 browser:v3 lostPeer:v4];
}

- (void)netServiceBrowser:(id)a3 didFindService:(id)a4 moreComing:(BOOL)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!a4)
  {
    uint64_t v14 = mcbrowser_log();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    LOWORD(v19) = 0;
    uint64_t v15 = "An invalid NSNetService object found - skipping.";
    long long v16 = v14;
LABEL_14:
    _os_log_impl(&dword_218756000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v19, 2u);
    return;
  }
  BOOL v5 = a5;
  id v8 = (id)objc_msgSend((id)objc_msgSend(a4, "name", a3), "copy");
  uint64_t v9 = mcbrowser_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (!v10) {
      return;
    }
    LOWORD(v19) = 0;
    uint64_t v15 = "NetService with an invalid name found - skipping.";
    long long v16 = v9;
    goto LABEL_14;
  }
  if (v10)
  {
    int v19 = 138412546;
    id v20 = v8;
    __int16 v21 = 1024;
    BOOL v22 = v5;
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "NetService found [%@] moreComing [%d].", (uint8_t *)&v19, 0x12u);
  }
  uint64_t v11 = [(NSMutableDictionary *)[(MCNearbyServiceBrowser *)self netServices] objectForKey:v8];
  if (!v11)
  {
    long long v17 = mcbrowser_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_218756000, v17, OS_LOG_TYPE_DEFAULT, "NetService adding [%@] to net services dictionary.", (uint8_t *)&v19, 0xCu);
    }
    goto LABEL_17;
  }
  uint64_t v12 = (void *)v11;
  if (([a4 isEqual:v11] & 1) == 0)
  {
    uint64_t v13 = mcbrowser_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      id v20 = v8;
      _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, "NetService replacing [%@] in net services dictionary.", (uint8_t *)&v19, 0xCu);
    }
    [v12 stopMonitoring];
LABEL_17:
    [(NSMutableDictionary *)[(MCNearbyServiceBrowser *)self netServices] setObject:a4 forKey:v8];
  }
  [a4 setDelegate:self];
  uint64_t v18 = [MEMORY[0x263EFF9F0] mainRunLoop];
  [a4 scheduleInRunLoop:v18 forMode:*MEMORY[0x263EFF588]];
  [a4 startMonitoring];
}

- (void)netServiceBrowser:(id)a3 didFindDomain:(id)a4 moreComing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v7 = mcbrowser_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = a4;
    __int16 v10 = 1024;
    BOOL v11 = v5;
    _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Did find domain [%@] moreComing [%d].", (uint8_t *)&v8, 0x12u);
  }
}

- (void)netServiceBrowser:(id)a3 didNotSearch:(id)a4
{
  uint64_t v6 = mcbrowser_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[MCNearbyServiceBrowser netServiceBrowser:didNotSearch:]((uint64_t)a4, v6);
  }
  uint64_t Int64 = CFDictionaryGetInt64();
  if (Int64) {
    uint64_t v8 = Int64;
  }
  else {
    uint64_t v8 = -72000;
  }
  uint64_t v9 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263EFC560] code:v8 userInfo:0];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__MCNearbyServiceBrowser_netServiceBrowser_didNotSearch___block_invoke;
  v10[3] = &unk_264337D58;
  void v10[4] = self;
  v10[5] = v9;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __57__MCNearbyServiceBrowser_netServiceBrowser_didNotSearch___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    return [v3 browser:v4 didNotStartBrowsingForPeers:v5];
  }
  return result;
}

- (void)netServiceBrowser:(id)a3 didRemoveDomain:(id)a4 moreComing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v12 = *MEMORY[0x263EF8340];
  double v7 = mcbrowser_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = a4;
    __int16 v10 = 1024;
    BOOL v11 = v5;
    _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Did remove domain [%@] moreComing [%d].", (uint8_t *)&v8, 0x12u);
  }
}

- (void)netServiceBrowser:(id)a3 didRemoveService:(id)a4 moreComing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v7 = objc_msgSend(a4, "name", a3);
  int v8 = mcbrowser_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v7;
    __int16 v13 = 1024;
    BOOL v14 = v5;
    _os_log_impl(&dword_218756000, v8, OS_LOG_TYPE_DEFAULT, "Peer lost: idString [%@] moreComing [%d].", buf, 0x12u);
  }
  syncQueue = self->_syncQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __72__MCNearbyServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke;
  v10[3] = &unk_264337D58;
  void v10[4] = self;
  v10[5] = v7;
  dispatch_async(syncQueue, v10);
}

void __72__MCNearbyServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peers"), "allValues");
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (!v3) {
    goto LABEL_14;
  }
  uint64_t v4 = v3;
  BOOL v5 = 0;
  uint64_t v6 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v15 != v6) {
        objc_enumerationMutation(v2);
      }
      int v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "netService"), "name"), "isEqualToString:", *(void *)(a1 + 40)))BOOL v5 = v8; {
    }
      }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  }
  while (v4);
  if (v5)
  {
    id v9 = (void *)[v5 peerID];
    __int16 v10 = mcbrowser_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v9 displayNameAndPID];
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v11;
      _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Removing a peer [%@] from peers dictionary.", buf, 0xCu);
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peers"), "removeObjectForKey:", v9);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __72__MCNearbyServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke_57;
    v13[3] = &unk_264337D58;
    v13[4] = *(void *)(a1 + 32);
    v13[5] = v9;
    dispatch_async(MEMORY[0x263EF83A0], v13);
  }
  else
  {
LABEL_14:
    uint64_t v12 = mcbrowser_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __72__MCNearbyServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke_cold_1(a1, v12);
    }
  }
}

uint64_t __72__MCNearbyServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke_57(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v2 browser:v3 lostPeer:v4];
}

- (void)netServiceBrowserDidStopSearch:(id)a3
{
  uint64_t v3 = mcbrowser_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_218756000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_2187945AD, v4, 2u);
  }
}

- (void)netServiceBrowserWillSearch:(id)a3
{
  uint64_t v3 = mcbrowser_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_218756000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_2187945AD, v4, 2u);
  }
}

- (id)rebuildUserDiscoveryInfoFromTXTRecordDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "allValues"), "count");
  if (v4 < 2)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v4 - 1];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = (void *)[v3 allKeys];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      long long v16 = v5;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (([v11 isEqualToString:@"_d"] & 1) == 0)
          {
            id v12 = v3;
            uint64_t v13 = [v3 objectForKey:v11];
            id v14 = (id)[[NSString alloc] initWithData:v13 encoding:4];
            if ([v11 hasPrefix:objc_msgSend(NSString, "stringWithFormat:", @"%@%@", @"_", @"_"])uint64_t v11 = objc_msgSend(v11, "substringFromIndex:", 1);
            [v16 setObject:v14 forKey:v11];
            id v3 = v12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
      BOOL v5 = v16;
    }
  }
  return v5;
}

- (void)netService:(id)a3 didUpdateTXTRecordData:(id)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v7 = [a3 name];
  uint64_t v8 = (void *)[MEMORY[0x263EFC5F0] dictionaryFromTXTRecordData:a4];
  uint64_t v9 = [v8 objectForKey:@"_d"];
  if (!v9
    || ((id v10 = (id)[[NSString alloc] initWithData:v9 encoding:4],
         id v11 = [(MCNearbyServiceBrowser *)self rebuildUserDiscoveryInfoFromTXTRecordDictionary:v8], v10)? (v12 = v7 == 0): (v12 = 1), v12))
  {
    uint64_t v13 = mcbrowser_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MCNearbyServiceBrowser netService:didUpdateTXTRecordData:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
  }
  else
  {
    id v21 = v11;
    uint64_t v22 = [[MCPeerID alloc] initWithIDString:v7 displayName:v10];
    uint64_t v23 = mcbrowser_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v33 = v7;
      __int16 v34 = 2112;
      uint64_t v35 = [(MCPeerID *)v22 displayNameAndPID];
      __int16 v36 = 2112;
      id v37 = v21;
      _os_log_impl(&dword_218756000, v23, OS_LOG_TYPE_DEFAULT, "Peer found: idString [%@], displayNameAndPID [%@], discoveryInfo [%@].", buf, 0x20u);
    }
    if ([(MCPeerID *)v22 isEqual:[(MCNearbyServiceBrowser *)self myPeerID]])
    {
      uint64_t v25 = mcbrowser_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_218756000, v25, OS_LOG_TYPE_DEFAULT, "Ignoring self for now.", buf, 2u);
      }
    }
    else
    {
      syncQueue = self->_syncQueue;
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      v31[2] = __60__MCNearbyServiceBrowser_netService_didUpdateTXTRecordData___block_invoke;
      v31[3] = &unk_264337EC0;
      v31[4] = self;
      v31[5] = v22;
      v31[6] = a3;
      v31[7] = v21;
      dispatch_async(syncQueue, v31);
      id v27 = (void *)-[NSMutableDictionary objectForKey:](-[MCNearbyServiceBrowser netServices](self, "netServices"), "objectForKey:", [a3 name]);
      if (v27)
      {
        __int16 v28 = v27;
        [v27 stopMonitoring];
        [v28 setDelegate:0];
        -[NSMutableDictionary removeObjectForKey:](-[MCNearbyServiceBrowser netServices](self, "netServices"), "removeObjectForKey:", [a3 name]);
      }
      else
      {
        id v29 = mcbrowser_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = [a3 name];
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = v30;
          _os_log_impl(&dword_218756000, v29, OS_LOG_TYPE_DEFAULT, "NetService not found [%@] in net services dictionary.", buf, 0xCu);
        }
        [a3 stopMonitoring];
      }
    }
  }
}

void __60__MCNearbyServiceBrowser_netService_didUpdateTXTRecordData___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peers"), "objectForKey:", *(void *)(a1 + 40));
  if (!v2)
  {
LABEL_6:
    BOOL v5 = [[MCNearbyDiscoveryPeer alloc] initWithPeerID:*(void *)(a1 + 40)];
    [(MCNearbyDiscoveryPeer *)v5 setNetService:*(void *)(a1 + 48)];
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "peers"), "setObject:forKey:", v5, *(void *)(a1 + 40));

    goto LABEL_7;
  }
  id v3 = v2;
  if ((objc_msgSend(*(id *)(a1 + 48), "isEqual:", objc_msgSend(v2, "netService")) & 1) == 0)
  {
    unint64_t v4 = mcbrowser_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Peer already in the dictionary, but has a different NSNetService object. will replace it with the newly found peer.", buf, 2u);
    }
    [v3 invalidate];
    goto LABEL_6;
  }
LABEL_7:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__MCNearbyServiceBrowser_netService_didUpdateTXTRecordData___block_invoke_63;
  block[3] = &unk_264337D80;
  long long v7 = *(_OWORD *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 56);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __60__MCNearbyServiceBrowser_netService_didUpdateTXTRecordData___block_invoke_63(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);

  return [v2 browser:v3 foundPeer:v4 withDiscoveryInfo:v5];
}

- (MCPeerID)myPeerID
{
  return self->_myPeerID;
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

- (NSMutableDictionary)netServices
{
  return self->_netServices;
}

- (void)setNetServices:(id)a3
{
}

- (NSMutableDictionary)peers
{
  return self->_peers;
}

- (void)setPeers:(id)a3
{
}

- (NSNetServiceBrowser)networkBrowser
{
  return self->_networkBrowser;
}

- (void)setNetworkBrowser:(id)a3
{
}

- (int64_t)outgoingInviteID
{
  return self->_outgoingInviteID;
}

- (void)setOutgoingInviteID:(int64_t)a3
{
  self->_int64_t outgoingInviteID = a3;
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

- (BOOL)isBrowsing
{
  return self->_isBrowsing;
}

- (void)setIsBrowsing:(BOOL)a3
{
  self->_isBrowsing = a3;
}

- (BOOL)wasBrowsing
{
  return self->_wasBrowsing;
}

- (void)setWasBrowsing:(BOOL)a3
{
  self->_wasBrowsing = a3;
}

- (BOOL)isAWDLDisabled
{
  return self->_AWDLDisabled;
}

- (void)setAWDLDisabled:(BOOL)a3
{
  self->_AWDLDisabled = a3;
}

void __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_2(&dword_218756000, v0, v1, "Unexpected (possibly stale) identifier [%@] advertised (expected peer [%@]).Closing connection.");
}

void __55__MCNearbyServiceBrowser_syncInitiateConnectionToPeer___block_invoke_cold_3(uint64_t a1, void *a2)
{
  [a2 localizedDescription];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_218756000, v2, v3, "Peer [%@] error in connectedHandler [%@].", v4, v5, v6, v7, 2u);
}

- (void)syncHandleInviteResponse:(NSObject *)a3 fromPeer:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *a2;
  OUTLINED_FUNCTION_4_2(&dword_218756000, (uint64_t)a2, a3, "No session for peer [%@]. invites=[%@].", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)syncHandleInviteResponse:(void *)a1 fromPeer:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v3 = 138412290;
  uint64_t v4 = [a1 displayNameAndPID];
  _os_log_error_impl(&dword_218756000, a2, OS_LOG_TYPE_ERROR, "Received an invitation response from [%@], but we never sent it an invitation. Aborting!", (uint8_t *)&v3, 0xCu);
}

- (void)syncHandleInviteResponse:(void *)a1 fromPeer:(void *)a2 .cold.3(void *a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(a1, "peerID"), "displayNameAndPID");
  [a2 displayNameAndPID];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_218756000, v3, v4, "Peer is [%@], invite response is from [%@].", v5, v6, v7, v8, 2u);
}

- (void)syncHandleInviteResponse:(void *)a1 fromPeer:(void *)a2 .cold.4(void *a1, void *a2)
{
  objc_msgSend((id)objc_msgSend(a1, "myPeerID"), "displayNameAndPID");
  [a2 displayNameAndPID];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_218756000, v3, v4, "I am [%@], invite response is for [%@].", v5, v6, v7, v8, 2u);
}

void __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __60__MCNearbyServiceBrowser_syncHandleInviteResponse_fromPeer___block_invoke_2_cold_1(uint64_t a1)
{
  [*(id *)(a1 + 40) displayNameAndPID];
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1(&dword_218756000, v1, v2, "Failed to send dictionary [%@] to peer [%@].", v3, v4, v5, v6, 2u);
}

- (void)netServiceBrowser:(uint64_t)a1 didNotSearch:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218756000, a2, OS_LOG_TYPE_ERROR, "NSNetServiceBrowser did not search with error dict [%@].", (uint8_t *)&v2, 0xCu);
}

void __72__MCNearbyServiceBrowser_netServiceBrowser_didRemoveService_moreComing___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_218756000, a2, OS_LOG_TYPE_ERROR, "Cannot find peer with idString [%@] in the peers dictionary.", (uint8_t *)&v3, 0xCu);
}

- (void)netService:(uint64_t)a3 didUpdateTXTRecordData:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
}

@end