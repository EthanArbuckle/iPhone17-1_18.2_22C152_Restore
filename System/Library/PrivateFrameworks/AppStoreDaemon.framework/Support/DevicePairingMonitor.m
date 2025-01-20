@interface DevicePairingMonitor
- (DevicePairingMonitor)init;
- (void)_deviceDidBecomeActiveNotification:(id)a3;
- (void)_deviceDidBecomeInactiveNotification:(id)a3;
- (void)_deviceDidPairNotification:(id)a3;
- (void)_deviceDidUnpairNotification:(id)a3;
- (void)applicationDatabaseResyncedForDeviceWithPairingID:(id)a3;
- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4;
- (void)dealloc;
- (void)updateInstallProgressForApplication:(id)a3 progress:(double)a4 installPhase:(int64_t)a5;
- (void)updateInstallStateForApplication:(id)a3 installState:(int64_t)a4;
@end

@implementation DevicePairingMonitor

- (DevicePairingMonitor)init
{
  v38.receiver = self;
  v38.super_class = (Class)DevicePairingMonitor;
  v2 = [(DevicePairingMonitor *)&v38 init];
  if (!v2) {
    return 0;
  }
  v3 = v2;
  v4 = +[NRPairedDeviceRegistry sharedInstance];
  unsigned __int8 v5 = [v4 supportsPairedDevice];

  if (v5)
  {
    uint64_t v6 = +[NSHashTable weakObjectsHashTable];
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v6;

    v8 = (NSRecursiveLock *)objc_alloc_init((Class)NSRecursiveLock);
    observersLock = v3->_observersLock;
    v3->_observersLock = v8;

    v10 = [DispatchQueue alloc];
    v17 = sub_1003070C8((id *)&v10->super.isa, @"com.apple.appstored.DevicePairingMonitor.observer", v11, v12, v13, v14, v15, v16, v33);
    observerQueue = v3->_observerQueue;
    v3->_observerQueue = (DispatchQueue *)v17;

    v19 = [DispatchQueue alloc];
    v26 = sub_1003070C8((id *)&v19->super.isa, @"com.apple.appstored.DevicePairingMonitor.notification", v20, v21, v22, v23, v24, v25, v34);
    notificationQueue = v3->_notificationQueue;
    v3->_notificationQueue = (DispatchQueue *)v26;

    v28 = v3->_notificationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003B3CA4;
    block[3] = &unk_100521388;
    v29 = v3;
    v30 = v29;
    v36 = v29;
    if (v28)
    {
      dispatch_async((dispatch_queue_t)v28->_queue, block);
      v3 = v36;
    }
    else
    {
      v3 = v29;
    }
  }
  else
  {
    v31 = ASDLogHandleForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "(DeviceConnectionMonitor) This device does not support pairing to other devices.", buf, 2u);
    }

    v30 = 0;
  }

  return v30;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NRPairedDeviceRegistryDeviceDidBecomeActive object:0];
  [v3 removeObserver:self name:NRPairedDeviceRegistryDeviceDidBecomeInactive object:0];
  [v3 removeObserver:self name:NRPairedDeviceRegistryDeviceDidPairNotification object:0];
  [v3 removeObserver:self name:NRPairedDeviceRegistryDeviceDidUnpairNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)DevicePairingMonitor;
  [(DevicePairingMonitor *)&v4 dealloc];
}

- (void)_deviceDidBecomeActiveNotification:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003B4428;
  v7[3] = &unk_1005218C0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  if (notificationQueue) {
    dispatch_async((dispatch_queue_t)notificationQueue->_queue, v7);
  }
}

- (void)_deviceDidBecomeInactiveNotification:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003B45C0;
  v7[3] = &unk_1005218C0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  if (notificationQueue) {
    dispatch_async((dispatch_queue_t)notificationQueue->_queue, v7);
  }
}

- (void)_deviceDidPairNotification:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003B4758;
  v7[3] = &unk_1005218C0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  if (notificationQueue) {
    dispatch_async((dispatch_queue_t)notificationQueue->_queue, v7);
  }
}

- (void)_deviceDidUnpairNotification:(id)a3
{
  id v4 = a3;
  notificationQueue = self->_notificationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003B48F0;
  v7[3] = &unk_1005218C0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  if (notificationQueue) {
    dispatch_async((dispatch_queue_t)notificationQueue->_queue, v7);
  }
}

- (void)applicationDatabaseResyncedForDeviceWithPairingID:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003B4D18;
  v5[3] = &unk_10052BB78;
  id v6 = a3;
  id v4 = v6;
  sub_1003B4228((uint64_t)self, (uint64_t)"applicationDatabaseResyncedForDeviceWithPairingID:", v5);
}

- (void)applicationsInstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003B4DEC;
  v8[3] = &unk_10052BB50;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  sub_1003B4228((uint64_t)self, (uint64_t)"applicationsInstalled:onDeviceWithPairingID:", v8);
}

- (void)applicationsUninstalled:(id)a3 onDeviceWithPairingID:(id)a4
{
}

- (void)applicationsUpdated:(id)a3 onDeviceWithPairingID:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1003B4ECC;
  v8[3] = &unk_10052BB50;
  id v9 = a3;
  id v10 = a4;
  id v6 = v10;
  id v7 = v9;
  sub_1003B4228((uint64_t)self, (uint64_t)"applicationsUpdated:onDeviceWithPairingID:", v8);
}

- (void)updateInstallProgressForApplication:(id)a3 progress:(double)a4 installPhase:(int64_t)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1003B4F98;
  v9[3] = &unk_10052BBA0;
  id v10 = a3;
  double v11 = a4;
  int64_t v12 = a5;
  id v8 = v10;
  sub_1003B4228((uint64_t)self, (uint64_t)"updateInstallProgressForApplication:progress:installPhase:", v9);
}

- (void)updateInstallStateForApplication:(id)a3 installState:(int64_t)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1003B5058;
  v7[3] = &unk_10052BBC8;
  id v8 = a3;
  int64_t v9 = a4;
  id v6 = v8;
  sub_1003B4228((uint64_t)self, (uint64_t)"updateInstallStateForApplication:installState:", v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersLock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

@end