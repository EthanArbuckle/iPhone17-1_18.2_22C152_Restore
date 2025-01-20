@interface _HFAlarmConnectionProvider
- (NSXPCConnection)alarmManagerServiceConnection;
@end

@implementation _HFAlarmConnectionProvider

- (NSXPCConnection)alarmManagerServiceConnection
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_alarmManagerServiceConnection;
  if (!v3)
  {
    if (!v2->_alarmManagerServiceConnection)
    {
      id v4 = objc_alloc(MEMORY[0x263F08D68]);
      uint64_t v5 = [v4 initWithMachServiceName:*MEMORY[0x263F33D70] options:4096];
      alarmManagerServiceConnection = v2->_alarmManagerServiceConnection;
      v2->_alarmManagerServiceConnection = (NSXPCConnection *)v5;
    }
    objc_initWeak(&location, v2);
    uint64_t v9 = MEMORY[0x263EF8330];
    uint64_t v10 = 3221225472;
    v11 = __59___HFAlarmConnectionProvider_alarmManagerServiceConnection__block_invoke;
    v12 = &unk_26408E550;
    objc_copyWeak(&v13, &location);
    v7 = _Block_copy(&v9);
    -[NSXPCConnection setInterruptionHandler:](v2->_alarmManagerServiceConnection, "setInterruptionHandler:", v7, v9, v10, v11, v12);
    [(NSXPCConnection *)v2->_alarmManagerServiceConnection setInvalidationHandler:v7];
    v3 = v2->_alarmManagerServiceConnection;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
}

@end