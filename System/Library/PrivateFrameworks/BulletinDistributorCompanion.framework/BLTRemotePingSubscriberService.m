@interface BLTRemotePingSubscriberService
- (BLTPingSubscribing)delegate;
- (BLTRemotePingSubscriberService)init;
- (BLTRemotePingSubscriberService)initWithMachServiceName:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)machServiceName;
- (NSXPCConnection)connectionFromServer;
- (NSXPCConnection)connectionToServer;
- (NSXPCListener)listener;
- (void)_connect;
- (void)_createXPCService;
- (void)dealloc;
- (void)getWillNanoPresentNotificationForSectionID:(id)a3 completion:(id)a4;
- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5;
- (void)pingWithBulletin:(id)a3;
- (void)pingWithBulletin:(id)a3 ack:(id)a4;
- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4;
- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4 ack:(id)a5;
- (void)sendBulletinSummary:(id)a3;
- (void)setConnectionFromServer:(id)a3;
- (void)setConnectionToServer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListener:(id)a3;
- (void)setMachServiceName:(id)a3;
- (void)subscribeToSectionID:(id)a3 forFullBulletins:(BOOL)a4 withAck:(BOOL)a5 ackAllowedOnLocalConnection:(BOOL)a6;
- (void)subscribeWithMachServiceName:(id)a3;
- (void)unsubscribeFromSectionID:(id)a3;
@end

@implementation BLTRemotePingSubscriberService

- (BLTRemotePingSubscriberService)initWithMachServiceName:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLTRemotePingSubscriberService;
  v5 = [(BLTRemotePingSubscriberService *)&v10 init];
  if (v5)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)BLTDaemonRestarted, @"BLTDaemonRestartedNotification", 0, (CFNotificationSuspensionBehavior)0);
    uint64_t v7 = [v4 copy];
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v7;

    [(BLTRemotePingSubscriberService *)v5 _createXPCService];
    [(BLTRemotePingSubscriberService *)v5 _connect];
  }

  return v5;
}

- (void)_createXPCService
{
  if (self->_machServiceName)
  {
    [(NSXPCListener *)self->_listener invalidate];
    v3 = (NSXPCListener *)[objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:self->_machServiceName];
    listener = self->_listener;
    self->_listener = v3;

    [(NSXPCListener *)self->_listener setDelegate:self];
    v5 = self->_listener;
    [(NSXPCListener *)v5 resume];
  }
}

- (void)_connect
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  [(NSXPCConnection *)self->_connectionToServer invalidate];
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.bulletindistributord.server" options:4096];
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v3;

  v5 = self->_connectionToServer;
  v6 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D611EB0];
  [(NSXPCConnection *)v5 setExportedInterface:v6];

  uint64_t v7 = self->_connectionToServer;
  v8 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D60B888];
  [(NSXPCConnection *)v7 setRemoteObjectInterface:v8];

  [(NSXPCConnection *)self->_connectionToServer setExportedObject:self];
  [(NSXPCConnection *)self->_connectionToServer resume];
  if (self->_machServiceName)
  {
    v9 = [(NSXPCConnection *)self->_connectionToServer exportedObject];
    [v9 subscribeWithMachServiceName:self->_machServiceName];
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = [WeakRetained subscriptionInfos];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v17 = [(NSXPCConnection *)self->_connectionToServer remoteObjectProxy];
        v18 = [v16 sectionID];
        objc_msgSend(v17, "subscribeToSectionID:forFullBulletins:withAck:ackAllowedOnLocalConnection:", v18, objc_msgSend(v16, "forBulletin"), objc_msgSend(v16, "canAck"), objc_msgSend(v16, "canAckOnLocalConnection"));
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  id v19 = objc_loadWeakRetained((id *)&self->_delegate);
  [v19 pingSubscriberDidLoad];
}

- (void)setDelegate:(id)a3
{
}

- (void)subscribeToSectionID:(id)a3 forFullBulletins:(BOOL)a4 withAck:(BOOL)a5 ackAllowedOnLocalConnection:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  connectionToServer = self->_connectionToServer;
  id v10 = a3;
  id v11 = [(NSXPCConnection *)connectionToServer remoteObjectProxy];
  [v11 subscribeToSectionID:v10 forFullBulletins:v8 withAck:v7 ackAllowedOnLocalConnection:v6];
}

- (BLTRemotePingSubscriberService)init
{
  return [(BLTRemotePingSubscriberService *)self initWithMachServiceName:0];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"BLTDaemonRestartedNotification", 0);
  [(NSXPCConnection *)self->_connectionToServer invalidate];
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = 0;

  [(NSXPCConnection *)self->_connectionFromServer invalidate];
  connectionFromServer = self->_connectionFromServer;
  self->_connectionFromServer = 0;

  v6.receiver = self;
  v6.super_class = (Class)BLTRemotePingSubscriberService;
  [(BLTRemotePingSubscriberService *)&v6 dealloc];
}

- (void)unsubscribeFromSectionID:(id)a3
{
  connectionToServer = self->_connectionToServer;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connectionToServer remoteObjectProxy];
  [v5 unsubscribeFromSectionID:v4];
}

- (void)pingWithBulletin:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained pingWithBulletin:v4];
}

- (void)pingWithBulletin:(id)a3 ack:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained pingWithBulletin:v7 ack:v6];
}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained pingWithRecordID:v7 forSectionID:v6];
}

- (void)pingWithRecordID:(id)a3 forSectionID:(id)a4 ack:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained pingWithRecordID:v10 forSectionID:v9 ack:v8];
}

- (void)sendBulletinSummary:(id)a3
{
  connectionToServer = self->_connectionToServer;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connectionToServer remoteObjectProxy];
  [v5 sendBulletinSummary:v4];
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 completion:(id)a4
{
  connectionToServer = self->_connectionToServer;
  id v6 = a4;
  id v7 = a3;
  id v8 = [(NSXPCConnection *)connectionToServer remoteObjectProxy];
  [v8 getWillNanoPresentNotificationForSectionID:v7 completion:v6];
}

- (void)getWillNanoPresentNotificationForSectionID:(id)a3 subsectionIDs:(id)a4 completion:(id)a5
{
  connectionToServer = self->_connectionToServer;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(NSXPCConnection *)connectionToServer remoteObjectProxy];
  [v11 getWillNanoPresentNotificationForSectionID:v10 subsectionIDs:v9 completion:v8];
}

- (void)subscribeWithMachServiceName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  machServiceName = self->_machServiceName;
  self->_machServiceName = v4;

  [(BLTRemotePingSubscriberService *)self _createXPCService];
  id v6 = [(NSXPCConnection *)self->_connectionToServer remoteObjectProxy];
  [v6 subscribeWithMachServiceName:self->_machServiceName];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 valueForEntitlement:@"com.apple.bulletindistributor.remotepingsubscriber"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v8 BOOLValue])
  {
    objc_storeStrong((id *)&self->_connectionFromServer, a4);
    [(NSXPCConnection *)self->_connectionFromServer setExportedObject:self];
    connectionFromServer = self->_connectionFromServer;
    id v10 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D611EB0];
    [(NSXPCConnection *)connectionFromServer setExportedInterface:v10];

    id v11 = self->_connectionFromServer;
    uint64_t v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D60B888];
    [(NSXPCConnection *)v11 setRemoteObjectInterface:v12];

    objc_initWeak(&location, self);
    uint64_t v13 = self->_connectionFromServer;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __69__BLTRemotePingSubscriberService_listener_shouldAcceptNewConnection___block_invoke;
    v20[3] = &unk_264683EC8;
    objc_copyWeak(&v21, &location);
    [(NSXPCConnection *)v13 setInvalidationHandler:v20];
    uint64_t v14 = self->_connectionFromServer;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __69__BLTRemotePingSubscriberService_listener_shouldAcceptNewConnection___block_invoke_2;
    v18[3] = &unk_264683EC8;
    objc_copyWeak(&v19, &location);
    [(NSXPCConnection *)v14 setInterruptionHandler:v18];
    [(NSXPCConnection *)self->_connectionFromServer resume];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    BOOL v15 = 1;
  }
  else
  {
    v16 = blt_general_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[BLTPingSubscriberManager listener:shouldAcceptNewConnection:](@"com.apple.bulletindistributor.remotepingsubscriber", v16);
    }

    BOOL v15 = 0;
  }

  return v15;
}

void __69__BLTRemotePingSubscriberService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnectionFromServer:0];
}

void __69__BLTRemotePingSubscriberService_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setConnectionFromServer:0];
}

- (BLTPingSubscribing)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTPingSubscribing *)WeakRetained;
}

- (NSXPCConnection)connectionToServer
{
  return self->_connectionToServer;
}

- (void)setConnectionToServer:(id)a3
{
}

- (NSXPCConnection)connectionFromServer
{
  return self->_connectionFromServer;
}

- (void)setConnectionFromServer:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connectionFromServer, 0);
  objc_storeStrong((id *)&self->_connectionToServer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end