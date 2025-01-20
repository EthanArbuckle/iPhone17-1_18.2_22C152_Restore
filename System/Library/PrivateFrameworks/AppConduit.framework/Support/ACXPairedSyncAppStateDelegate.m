@interface ACXPairedSyncAppStateDelegate
+ (id)sharedAppStateSyncDelegate;
- (ACXPairedSyncAppStateDelegate)init;
- (ACXRemoteAppList)remoteAppList;
- (OS_dispatch_queue)queue;
- (PSYServiceSyncSession)syncSession;
- (PSYSyncCoordinator)coordinator;
- (void)_onQueue_triggerSyncSessionCompleteAndRemoveObserver;
- (void)resyncCompleted;
- (void)setRemoteAppList:(id)a3;
- (void)setSyncSession:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
@end

@implementation ACXPairedSyncAppStateDelegate

+ (id)sharedAppStateSyncDelegate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100050058;
  block[3] = &unk_10008CBD8;
  block[4] = a1;
  if (qword_1000A55E0 != -1) {
    dispatch_once(&qword_1000A55E0, block);
  }
  v2 = (void *)qword_1000A55D8;

  return v2;
}

- (ACXPairedSyncAppStateDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)ACXPairedSyncAppStateDelegate;
  v2 = [(ACXPairedSyncAppStateDelegate *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.appconduitd.appstate"];
    coordinator = v2->_coordinator;
    v2->_coordinator = (PSYSyncCoordinator *)v3;

    [(PSYSyncCoordinator *)v2->_coordinator setDelegate:v2];
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.pairedsync.appstate.delegate", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    [v5 syncSessionType];
    v18 = NSStringfromPSYSyncSessionType();
    MOLogWrite();
  }
  -[ACXPairedSyncAppStateDelegate setSyncSession:](self, "setSyncSession:", v6, v18);
  v7 = +[ACXDeviceManager sharedManager];
  objc_super v8 = [v6 pairedDevice];
  v9 = [v7 deviceForNRDevice:v8];

  v10 = +[ACXGizmoStateManager sharedStateManager];
  v11 = [v10 stateForDevice:v9];

  v12 = +[ACXCompanionSyncConnectionManager sharedConnectionManager];
  v13 = [v12 connectionForDevice:v9];

  v14 = [(ACXPairedSyncAppStateDelegate *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005030C;
  block[3] = &unk_10008CC78;
  id v20 = v6;
  id v21 = v11;
  id v22 = v13;
  v23 = self;
  id v15 = v13;
  id v16 = v11;
  id v17 = v6;
  dispatch_async(v14, block);
}

- (void)_onQueue_triggerSyncSessionCompleteAndRemoveObserver
{
  uint64_t v3 = [(ACXPairedSyncAppStateDelegate *)self queue];
  dispatch_assert_queue_V2(v3);

  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5) {
    MOLogWrite();
  }
  v4 = [(ACXPairedSyncAppStateDelegate *)self remoteAppList];

  if (v4)
  {
    id v5 = [(ACXPairedSyncAppStateDelegate *)self remoteAppList];
    v6 = [(ACXPairedSyncAppStateDelegate *)self queue];
    [v5 removeObserver:self queue:v6];

    [(ACXPairedSyncAppStateDelegate *)self setRemoteAppList:0];
  }
  v7 = [(ACXPairedSyncAppStateDelegate *)self syncSession];
  [v7 syncDidComplete];

  [(ACXPairedSyncAppStateDelegate *)self setSyncSession:0];
}

- (void)resyncCompleted
{
  uint64_t v3 = [(ACXPairedSyncAppStateDelegate *)self queue];
  dispatch_assert_queue_V2(v3);

  [(ACXPairedSyncAppStateDelegate *)self _onQueue_triggerSyncSessionCompleteAndRemoveObserver];
}

- (PSYSyncCoordinator)coordinator
{
  return self->_coordinator;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PSYServiceSyncSession)syncSession
{
  return self->_syncSession;
}

- (void)setSyncSession:(id)a3
{
}

- (ACXRemoteAppList)remoteAppList
{
  return self->_remoteAppList;
}

- (void)setRemoteAppList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAppList, 0);
  objc_storeStrong((id *)&self->_syncSession, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end