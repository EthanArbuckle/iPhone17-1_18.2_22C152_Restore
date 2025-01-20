@interface DSDaemonProxy
+ (void)initialize;
- (DSDaemonProxy)init;
- (NSArray)signalsToReport;
- (NSMutableSet)unreportedSignals;
- (SCSharingReminderPeerService)daemonConnection;
- (void)addSignalWithIdentifier:(id)a3 sharingType:(id)a4 signalType:(id)a5;
- (void)removeSignalWithIdentifier:(id)a3 sharingType:(id)a4 signalType:(id)a5;
- (void)sendAggregatedSignals;
- (void)setDaemonConnection:(id)a3;
- (void)setUnreportedSignals:(id)a3;
@end

@implementation DSDaemonProxy

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLog_6 = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSDaemonProxy");
    MEMORY[0x270F9A758]();
  }
}

- (DSDaemonProxy)init
{
  v5.receiver = self;
  v5.super_class = (Class)DSDaemonProxy;
  v2 = [(DSDaemonProxy *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9C0] set];
    [(DSDaemonProxy *)v2 setUnreportedSignals:v3];
  }
  return v2;
}

- (void)addSignalWithIdentifier:(id)a3 sharingType:(id)a4 signalType:(id)a5
{
  if (a3 && a4 && a5)
  {
    v8 = (objc_class *)MEMORY[0x263F65F78];
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    id v13 = objc_alloc_init(v8);
    [v13 setSharingIdentifier:v11];

    [v13 setSharingType:v10];
    [v13 setSignalType:v9];

    v12 = [(DSDaemonProxy *)self unreportedSignals];
    [v12 addObject:v13];
  }
}

- (void)removeSignalWithIdentifier:(id)a3 sharingType:(id)a4 signalType:(id)a5
{
  if (a3 && a4 && a5)
  {
    v8 = (objc_class *)MEMORY[0x263F65F78];
    id v9 = a5;
    id v10 = a4;
    id v11 = a3;
    id v13 = objc_alloc_init(v8);
    [v13 setSharingIdentifier:v11];

    [v13 setSharingType:v10];
    [v13 setSignalType:v9];

    v12 = [(DSDaemonProxy *)self unreportedSignals];
    [v12 removeObject:v13];
  }
}

- (void)sendAggregatedSignals
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v3 = [(DSDaemonProxy *)self unreportedSignals];
  v4 = [v3 allObjects];
  objc_super v5 = (void *)[v4 copy];

  if ([v5 count])
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F65F70]) initConnection];
    [(DSDaemonProxy *)self setDaemonConnection:v6];

    v7 = DSLog_6;
    if (os_log_type_enabled((os_log_t)DSLog_6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      id v13 = v5;
      _os_log_impl(&dword_236090000, v7, OS_LOG_TYPE_INFO, "Reporting signals to daemon: %{private}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v8 = [(DSDaemonProxy *)self daemonConnection];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__DSDaemonProxy_sendAggregatedSignals__block_invoke;
    v9[3] = &unk_264C9ECC0;
    objc_copyWeak(&v11, (id *)buf);
    id v10 = v5;
    [v8 handleSignals:v10 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __38__DSDaemonProxy_sendAggregatedSignals__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5 || (a2 & 1) == 0)
  {
    v7 = DSLog_6;
    if (os_log_type_enabled((os_log_t)DSLog_6, OS_LOG_TYPE_ERROR))
    {
      id v10 = @"Unknown";
      uint64_t v11 = *(void *)(a1 + 32);
      if (v5) {
        id v10 = v5;
      }
      int v12 = 138412547;
      id v13 = v10;
      __int16 v14 = 2113;
      uint64_t v15 = v11;
      _os_log_error_impl(&dword_236090000, v7, OS_LOG_TYPE_ERROR, "Error: %@ Proxy failed to handle %{private}@", (uint8_t *)&v12, 0x16u);
    }
  }
  v8 = [WeakRetained daemonConnection];
  [v8 disconnect];

  id v9 = [WeakRetained unreportedSignals];
  [v9 removeAllObjects];
}

- (NSArray)signalsToReport
{
  v2 = [(DSDaemonProxy *)self unreportedSignals];
  v3 = [v2 allObjects];

  return (NSArray *)v3;
}

- (SCSharingReminderPeerService)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
}

- (NSMutableSet)unreportedSignals
{
  return self->_unreportedSignals;
}

- (void)setUnreportedSignals:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unreportedSignals, 0);
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

@end