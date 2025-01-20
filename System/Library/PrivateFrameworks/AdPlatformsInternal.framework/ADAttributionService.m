@interface ADAttributionService
+ (id)sharedInstance;
- (ADAttributionService)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)clients;
- (NSNumber)transactionID;
- (NSXPCListener)listener;
- (void)removeClientForToken:(id)a3;
- (void)setClients:(id)a3;
- (void)setListener:(id)a3;
- (void)setTransactionID:(id)a3;
@end

@implementation ADAttributionService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  long long v22 = 0u;
  long long v23 = 0u;
  if (v7) {
    [v7 auditToken];
  }
  if (!ba_is_process_extension())
  {
    v11 = (void *)MEMORY[0x263F64570];
    v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v8, "processIdentifier"));
    id v21 = 0;
    v13 = [v11 handleForIdentifier:v12 error:&v21];
    id v9 = v21;
    v14 = [v13 bundle];
    v15 = [v14 bundleInfoValueForKey:*MEMORY[0x263EFFB58]];

    if (v9)
    {
      [NSString stringWithFormat:@"[%@] Error %@ getting bundleID from RunningBoardServices.", objc_opt_class(), v9];
    }
    else
    {
      if ([v15 length])
      {
        v16 = self;
        objc_sync_enter(v16);
        ++_requestTokenCount;
        v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:");
        v18 = [[ADAttributionRequester alloc] initWithConnection:v8 bundleID:v15 transactionID:v17];
        [(NSMutableDictionary *)v16->_clients setObject:v18 forKeyedSubscript:v17];

        objc_sync_exit(v16);
        BOOL v10 = 1;
        goto LABEL_10;
      }
      [NSString stringWithFormat:@"ERROR: Received a connection from an app with no bundleID: %@", v15, v20];
    }
    v16 = (ADAttributionService *)objc_claimAutoreleasedReturnValue();
    _ADLog();
    BOOL v10 = 0;
LABEL_10:

    goto LABEL_11;
  }
  id v9 = [NSString stringWithFormat:@"Calls from background extensions are not supported"];
  _ADLog();
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__ADAttributionService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__onceToken != -1) {
    dispatch_once(&sharedInstance__onceToken, block);
  }
  v2 = (void *)sharedInstance__instance;
  return v2;
}

uint64_t __38__ADAttributionService_sharedInstance__block_invoke()
{
  sharedInstance__instance = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

- (ADAttributionService)init
{
  v8.receiver = self;
  v8.super_class = (Class)ADAttributionService;
  v2 = [(ADAttributionService *)&v8 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.ap.adprivacyd.attribution"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)removeClientForToken:(id)a3
{
  id v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v6)
  {
    -[NSMutableDictionary removeObjectForKey:](v4->_clients, "removeObjectForKey:");
  }
  else
  {
    uint64_t v5 = [NSString stringWithFormat:@"ERROR: We tried to remove a nil Attribution token from the list of clients."];
    _ADLog();
  }
  objc_sync_exit(v4);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8, 1);
}

- (void)setListener:(id)a3
{
}

- (NSMutableDictionary)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSNumber)transactionID
{
  return self->_transactionID;
}

- (void)setTransactionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionID, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

@end