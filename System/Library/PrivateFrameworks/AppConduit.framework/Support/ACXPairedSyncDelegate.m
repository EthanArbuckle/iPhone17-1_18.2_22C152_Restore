@interface ACXPairedSyncDelegate
+ (id)sharedSyncDelegate;
- (ACXPairedSyncAppInstaller)appInstaller;
- (ACXPairedSyncDelegate)init;
- (BOOL)syncingIsRestrictedForPairingID:(id)a3;
- (PSYInitialSyncStateObserver)stateObserver;
- (PSYSyncCoordinator)coordinator;
- (void)_startSystemAppInstallerWithSyncSession:(id)a3 forConnection:(id)a4;
- (void)_syncDidCompleteForPairingIdentifier:(id)a3 withDescription:(id)a4;
- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4;
- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4;
- (void)installCompleteForSyncSession:(id)a3;
- (void)reportSystemAppInstallFailureForBundleID:(id)a3;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
@end

@implementation ACXPairedSyncDelegate

+ (id)sharedSyncDelegate
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006174;
  block[3] = &unk_10008CBD8;
  block[4] = a1;
  if (qword_1000A54D8 != -1) {
    dispatch_once(&qword_1000A54D8, block);
  }
  v2 = (void *)qword_1000A54D0;

  return v2;
}

- (ACXPairedSyncDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)ACXPairedSyncDelegate;
  v2 = [(ACXPairedSyncDelegate *)&v8 init];
  if (v2)
  {
    uint64_t v3 = +[PSYSyncCoordinator syncCoordinatorWithServiceName:@"com.apple.pairedsync.appconduitd"];
    coordinator = v2->_coordinator;
    v2->_coordinator = (PSYSyncCoordinator *)v3;

    [(PSYSyncCoordinator *)v2->_coordinator setDelegate:v2];
    v5 = (PSYInitialSyncStateObserver *)[objc_alloc((Class)PSYInitialSyncStateObserver) initWithDelegate:v2];
    stateObserver = v2->_stateObserver;
    v2->_stateObserver = v5;
  }
  return v2;
}

- (void)_startSystemAppInstallerWithSyncSession:(id)a3 forConnection:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [[ACXPairedSyncAppInstaller alloc] initWithSyncSession:v7 forConnection:v6 delegate:self];

  appInstaller = self->_appInstaller;
  self->_appInstaller = v8;

  v10 = self->_appInstaller;

  [(ACXPairedSyncAppInstaller *)v10 start];
}

- (BOOL)syncingIsRestrictedForPairingID:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [(ACXPairedSyncDelegate *)self stateObserver];
  if (!v6) {
    __assert_rtn("-[ACXPairedSyncDelegate syncingIsRestrictedForPairingID:]", "ACXPairedSyncDelegate.m", 66, "self.stateObserver");
  }

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000064A4;
  v14[3] = &unk_10008CC00;
  id v7 = v4;
  id v15 = v7;
  v17 = &v18;
  objc_super v8 = v5;
  v16 = v8;
  v9 = objc_retainBlock(v14);
  v10 = [(ACXPairedSyncDelegate *)self stateObserver];
  [v10 requestInitialSyncStateForPairingIdentifier:v7 completion:v9];

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v19 + 24))
  {
    BOOL v11 = 1;
  }
  else
  {
    v12 = [(ACXPairedSyncDelegate *)self stateObserver];
    [v12 requestSyncStateForPairingIdentifier:v7 completion:v9];

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v11 = *((unsigned char *)v19 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  return v11;
}

- (void)_syncDidCompleteForPairingIdentifier:(id)a3 withDescription:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = dispatch_get_global_queue(21, 0);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006648;
  v10[3] = &unk_10008CC28;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  sub_100006BB8(v7, v10);
}

- (void)initialSyncStateObserver:(id)a3 syncDidCompleteForPairingIdentifier:(id)a4
{
}

- (void)initialSyncStateObserver:(id)a3 initialSyncDidCompleteForPairingIdentifier:(id)a4
{
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  id v7 = v6;
  if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
  {
    [v6 syncSessionType];
    id v15 = NSStringfromPSYSyncSessionType();
    MOLogWrite();
  }
  id v8 = +[ACXDeviceManager sharedManager];
  id v9 = [v7 pairedDevice];
  v10 = [v8 deviceForNRDevice:v9];

  id v11 = +[ACXCompanionSyncConnectionManager sharedConnectionManager];
  id v12 = [v11 connectionForDevice:v10];

  id v13 = [v7 syncSessionType];
  if (v13 && v13 != (id)2)
  {
    if (!qword_1000A5608 || *(int *)(qword_1000A5608 + 44) >= 5)
    {
      id v14 = [v7 syncSessionType];
      [v7 syncSessionType];
      NSStringfromPSYSyncSessionType();
      v17 = id v16 = v14;
      MOLogWrite();
    }
    objc_msgSend(v7, "syncDidComplete", v16, v17);
  }
  else
  {
    [(ACXPairedSyncDelegate *)self _startSystemAppInstallerWithSyncSession:v7 forConnection:v12];
  }
}

- (void)reportSystemAppInstallFailureForBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(ACXPairedSyncDelegate *)self appInstaller];
  [v5 reportAppInstallFailureForBundleID:v4];
}

- (void)installCompleteForSyncSession:(id)a3
{
  appInstaller = self->_appInstaller;
  self->_appInstaller = 0;
  id v4 = a3;

  [v4 syncDidComplete];
}

- (PSYSyncCoordinator)coordinator
{
  return self->_coordinator;
}

- (PSYInitialSyncStateObserver)stateObserver
{
  return self->_stateObserver;
}

- (ACXPairedSyncAppInstaller)appInstaller
{
  return self->_appInstaller;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appInstaller, 0);
  objc_storeStrong((id *)&self->_stateObserver, 0);

  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end