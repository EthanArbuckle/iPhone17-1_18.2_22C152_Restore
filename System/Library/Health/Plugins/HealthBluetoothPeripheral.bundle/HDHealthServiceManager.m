@interface HDHealthServiceManager
- (BOOL)healthUpdatesEnabledFromDevice:(id)a3 error:(id *)a4;
- (BOOL)setHealthUpdatesEnabled:(BOOL)a3 fromDevice:(id)a4 error:(id *)a5;
- (HDHealthServiceManager)initWithProfile:(id)a3;
- (HDHealthServiceManager)initWithProfile:(id)a3 centralManager:(id)a4 queue:(id)a5;
- (id)_healthServiceForPeriperalID:(id)a3 serviceType:(int64_t)a4;
- (id)allServicesWithError:(id *)a3;
- (id)retrieveOOBData:(id *)a3;
- (id)reviewSavedHealthServiceSessionsWithError:(id *)a3;
- (unint64_t)connectHealthService:(id)a3 connectionOptions:(unint64_t)a4 sessionHandler:(id)a5 dataHandler:(id)a6 mfaSuccessHandler:(id)a7 autoPairData:(id)a8 error:(id *)a9;
- (unint64_t)connectHealthService:(id)a3 sessionHandler:(id)a4 dataHandler:(id)a5 characteristicsHandler:(id)a6 error:(id *)a7;
- (unint64_t)connectHealthService:(id)a3 sessionHandler:(id)a4 dataHandler:(id)a5 error:(id *)a6;
- (unint64_t)discoverHealthServicesWithType:(int64_t)a3 timeout:(unint64_t)a4 alwaysNotify:(BOOL)a5 handler:(id)a6 error:(id *)a7;
- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4;
- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5;
- (void)centralManager:(id)a3 willRestoreState:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)characteristicReceived:(id)a3 device:(id)a4;
- (void)dealloc;
- (void)disconnectHealthService:(unint64_t)a3;
- (void)discoveredCharacteristics:(id)a3 forDevice:(id)a4 service:(id)a5;
- (void)discoveredServices:(id)a3 forPeripheral:(id)a4;
- (void)enablePrivateModeForSessionWithIdentifier:(id)a3;
- (void)getProperty:(id)a3 forSession:(unint64_t)a4 withHandler:(id)a5;
- (void)getSupportedPropertyNamesWithHandler:(id)a3;
- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4;
- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5;
- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6;
- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4;
- (void)performOperation:(id)a3 onSession:(unint64_t)a4 withParameters:(id)a5 completion:(id)a6;
- (void)releasePrivateMode;
- (void)resetOOBState;
- (void)sendBluetoothStatusUpdatesForServer:(id)a3 updateHandler:(id)a4 completion:(id)a5;
- (void)servicesInvalidatedForDevice:(id)a3 withError:(id)a4;
- (void)stopDiscoveryWithIdentifier:(unint64_t)a3;
- (void)unpairHealthServiceIfNecessary:(id)a3;
- (void)writeCharacteristic:(id)a3 onSession:(unint64_t)a4 expectResponse:(BOOL)a5 completion:(id)a6;
@end

@implementation HDHealthServiceManager

- (HDHealthServiceManager)initWithProfile:(id)a3
{
  return [(HDHealthServiceManager *)self initWithProfile:a3 centralManager:0 queue:0];
}

- (HDHealthServiceManager)initWithProfile:(id)a3 centralManager:(id)a4 queue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34.receiver = self;
  v34.super_class = (Class)HDHealthServiceManager;
  v11 = [(HDHealthServiceManager *)&v34 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_profile, v8);
    if (v10)
    {
      v13 = (OS_dispatch_queue *)v10;
    }
    else
    {
      HKCreateSerialDispatchQueue();
      v13 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    queue = v12->_queue;
    v12->_queue = v13;

    uint64_t v15 = [v8 dataCollectionManager];
    dataCollectionManager = v12->_dataCollectionManager;
    v12->_dataCollectionManager = (HDDataCollectionManager *)v15;

    uint64_t v17 = +[NSMutableDictionary dictionary];
    connectedPeripheralsByPeripheralUUID = v12->_connectedPeripheralsByPeripheralUUID;
    v12->_connectedPeripheralsByPeripheralUUID = (NSMutableDictionary *)v17;

    v19 = (NSLock *)objc_alloc_init((Class)NSLock);
    discoveryLock = v12->_discoveryLock;
    v12->_discoveryLock = v19;

    v21 = (NSLock *)objc_alloc_init((Class)NSLock);
    connectionLock = v12->_connectionLock;
    v12->_connectionLock = v21;

    uint64_t v23 = +[CBUUID UUIDWithString:@"0000"];
    allServicesUUID = v12->_allServicesUUID;
    v12->_allServicesUUID = (CBUUID *)v23;

    if (v9) {
      v25 = (CBCentralManager *)v9;
    }
    else {
      v25 = (CBCentralManager *)[objc_alloc((Class)CBCentralManager) initWithDelegate:0 queue:v12->_queue];
    }
    central = v12->_central;
    v12->_central = v25;

    [(CBCentralManager *)v12->_central setDelegate:v12];
    v12->_privacyNotificationToken = -1;
    objc_initWeak(&location, v12);
    v27 = v12->_queue;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_2F64C;
    v31[3] = &unk_60D60;
    objc_copyWeak(&v32, &location);
    uint32_t v28 = notify_register_dispatch("com.apple.bluetooth.accessory-authentication.success", &v12->_privacyNotificationToken, v27, v31);
    if (v28)
    {
      _HKInitializeLogging();
      v29 = HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
        sub_41860(v28, v29);
      }
    }
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)dealloc
{
  int privacyNotificationToken = self->_privacyNotificationToken;
  if (privacyNotificationToken != -1) {
    notify_cancel(privacyNotificationToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)HDHealthServiceManager;
  [(HDHealthServiceManager *)&v4 dealloc];
}

- (id)reviewSavedHealthServiceSessionsWithError:(id *)a3
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_2F9EC;
  v22 = sub_2F9FC;
  id v23 = +[NSMutableArray array];
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_2F9EC;
  v16 = sub_2F9FC;
  id v17 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2FA04;
  block[3] = &unk_61688;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v18;
  dispatch_sync(queue, block);
  v6 = (void *)v19[5];
  if (!v6)
  {
    id v7 = (id)v13[5];
    id v8 = v7;
    if (v7)
    {
      if (a3) {
        *a3 = v7;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v6 = (void *)v19[5];
  }
  id v9 = v6;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);

  return v9;
}

- (BOOL)healthUpdatesEnabledFromDevice:(id)a3 error:(id *)a4
{
  id v7 = a3;
  _HKInitializeLogging();
  id v8 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    v38 = self;
    __int16 v39 = 2114;
    uint64_t v40 = (uint64_t)v10;
    __int16 v41 = 2114;
    id v42 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: deviceIdentifier: %{public}@", buf, 0x20u);
  }
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  objc_super v34 = sub_2F9EC;
  v35 = sub_2F9FC;
  id v36 = 0;
  uint64_t v27 = 0;
  uint32_t v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  queue = self->_queue;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_30104;
  v22[3] = &unk_616B0;
  v25 = &v27;
  id v12 = v7;
  id v23 = v12;
  v24 = self;
  v26 = &v31;
  dispatch_sync(queue, v22);
  if (!*((unsigned char *)v28 + 24))
  {
    id v13 = (id)v32[5];
    uint64_t v14 = v13;
    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  _HKInitializeLogging();
  uint64_t v15 = HKLogServices;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = NSStringFromSelector(a2);
    id v17 = (void *)v16;
    CFStringRef v18 = @"YES";
    if (!*((unsigned char *)v28 + 24)) {
      CFStringRef v18 = @"NO";
    }
    uint64_t v19 = v32[5];
    *(_DWORD *)buf = 138544386;
    v38 = self;
    __int16 v39 = 2114;
    uint64_t v40 = v16;
    __int16 v41 = 2114;
    id v42 = v12;
    __int16 v43 = 2114;
    CFStringRef v44 = v18;
    __int16 v45 = 2114;
    uint64_t v46 = v19;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: deviceIdentifier: %{public}@ -> enabled: %{public}@, error: %{public}@", buf, 0x34u);
  }
  BOOL v20 = *((unsigned char *)v28 + 24) != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);

  return v20;
}

- (BOOL)setHealthUpdatesEnabled:(BOOL)a3 fromDevice:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v9 = a4;
  _HKInitializeLogging();
  id v10 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    __int16 v43 = self;
    __int16 v44 = 2114;
    uint64_t v45 = (uint64_t)v12;
    __int16 v46 = 2114;
    id v47 = v9;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: deviceIdentifier: %{public}@", buf, 0x20u);
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  __int16 v39 = sub_2F9EC;
  uint64_t v40 = sub_2F9FC;
  id v41 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_305F8;
  block[3] = &unk_616D8;
  uint64_t v29 = &v32;
  BOOL v31 = v6;
  id v14 = v9;
  id v27 = v14;
  uint32_t v28 = self;
  char v30 = &v36;
  dispatch_sync(queue, block);
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v16 = [WeakRetained serviceConnectionManager];
    [v16 reconnectToServices];
  }
  else
  {
    sub_30774(self, v14, 0);
  }
  if (!*((unsigned char *)v33 + 24))
  {
    id v17 = (id)v37[5];
    CFStringRef v18 = v17;
    if (v17)
    {
      if (a5) {
        *a5 = v17;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  _HKInitializeLogging();
  uint64_t v19 = HKLogServices;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = NSStringFromSelector(a2);
    v21 = (void *)v20;
    CFStringRef v22 = @"YES";
    if (!*((unsigned char *)v33 + 24)) {
      CFStringRef v22 = @"NO";
    }
    uint64_t v23 = v37[5];
    *(_DWORD *)buf = 138544386;
    __int16 v43 = self;
    __int16 v44 = 2114;
    uint64_t v45 = v20;
    __int16 v46 = 2114;
    id v47 = v14;
    __int16 v48 = 2114;
    CFStringRef v49 = v22;
    __int16 v50 = 2114;
    uint64_t v51 = v23;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: deviceIdentifier: %{public}@ -> success: %{public}@, error: %{public}@", buf, 0x34u);
  }
  BOOL v24 = *((unsigned char *)v33 + 24) != 0;

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v24;
}

- (void)sendBluetoothStatusUpdatesForServer:(id)a3 updateHandler:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  _HKInitializeLogging();
  id v12 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    CFStringRef v22 = self;
    __int16 v23 = 2114;
    BOOL v24 = v14;
    __int16 v25 = 2114;
    id v26 = v9;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: serverKey: %{public}@", buf, 0x20u);
  }
  if (v9)
  {
    queue = self->_queue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_30B58;
    v17[3] = &unk_61700;
    id v19 = v10;
    v17[4] = self;
    id v18 = v9;
    id v20 = v11;
    dispatch_async(queue, v17);

    uint64_t v16 = v19;
LABEL_7:

    goto LABEL_8;
  }
  if (v11)
  {
    uint64_t v16 = +[NSError hk_errorForInvalidArgument:@"@\"\" class:objc_opt_class() selector:a2 format:@"nil serverKey""];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v16);
    goto LABEL_7;
  }
LABEL_8:
}

- (unint64_t)discoverHealthServicesWithType:(int64_t)a3 timeout:(unint64_t)a4 alwaysNotify:(BOOL)a5 handler:(id)a6 error:(id *)a7
{
  BOOL v8 = a5;
  id v13 = a6;
  _HKInitializeLogging();
  id v14 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = v14;
    uint64_t v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544386;
    uint64_t v51 = self;
    __int16 v52 = 2114;
    v53 = v16;
    __int16 v54 = 2048;
    int64_t v55 = a3;
    __int16 v56 = 2048;
    unint64_t v57 = a4;
    __int16 v58 = 1024;
    BOOL v59 = v8;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: type: %ld, timeout: %lu, alwaysNotify: %{BOOL}d", buf, 0x30u);
  }
  if (!v13)
  {
    _HKInitializeLogging();
    id v27 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
      sub_418D8(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    +[NSError hk_assignError:a7 code:303 description:@"An internal device discovery error has occurred."];
    goto LABEL_15;
  }
  id v17 = self->_allServicesUUID;
  if (a3 != -2)
  {
    uint64_t v18 = [HDServiceClassForProfile(a3) serviceUUID];

    id v17 = (CBUUID *)v18;
    if (!v18)
    {
      _HKInitializeLogging();
      char v35 = HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
        sub_41910(a3, v35);
      }
      +[NSError hk_assignError:a7, 305, @"The data type %d is not supported for health devices.", a3 code format];
LABEL_15:
      unint64_t v26 = 0;
      goto LABEL_16;
    }
  }
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  discoveryLock = self->_discoveryLock;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_3135C;
  v39[3] = &unk_61728;
  v39[4] = self;
  id v41 = v13;
  id v20 = v17;
  BOOL v45 = v8;
  uint64_t v40 = v20;
  id v42 = &v46;
  int64_t v43 = a3;
  unint64_t v44 = a4;
  [(NSLock *)discoveryLock hk_withLock:v39];
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_316BC;
  block[3] = &unk_608E8;
  void block[4] = self;
  CFStringRef v22 = v20;
  uint64_t v38 = v22;
  dispatch_async(queue, block);
  _HKInitializeLogging();
  __int16 v23 = HKLogServices;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v24 = NSStringFromSelector(a2);
    uint64_t v25 = v47[3];
    *(_DWORD *)buf = 138544642;
    uint64_t v51 = self;
    __int16 v52 = 2114;
    v53 = v24;
    __int16 v54 = 2048;
    int64_t v55 = a3;
    __int16 v56 = 2048;
    unint64_t v57 = a4;
    __int16 v58 = 1024;
    BOOL v59 = v8;
    __int16 v60 = 2048;
    uint64_t v61 = v25;
    _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: type: %ld, timeout: %lu, alwaysNotify: %{BOOL}d -> discoveryIdentifier: %lu", buf, 0x3Au);
  }
  unint64_t v26 = v47[3];

  _Block_object_dispose(&v46, 8);
LABEL_16:

  return v26;
}

- (void)stopDiscoveryWithIdentifier:(unint64_t)a3
{
  _HKInitializeLogging();
  BOOL v6 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    BOOL v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2048;
    unint64_t v21 = a3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: discoveryIdentifier: %lu", buf, 0x20u);
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  unint64_t v21 = (unint64_t)sub_321D8;
  CFStringRef v22 = sub_32204;
  id v23 = 0;
  discoveryLock = self->_discoveryLock;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_3220C;
  v15[3] = &unk_61750;
  v15[4] = self;
  v15[5] = buf;
  v15[6] = &v16;
  v15[7] = a3;
  [(NSLock *)discoveryLock hk_withLock:v15];
  _HKInitializeLogging();
  id v10 = HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Calling discovery handler with cleanup", v14, 2u);
  }
  uint64_t v11 = *(void *)(*(void *)&buf[8] + 40);
  if (v11) {
    (*(void (**)(uint64_t, unint64_t, void, uint64_t, void))(v11 + 16))(v11, a3, 0, 1, 0);
  }
  if (*((unsigned char *)v17 + 24))
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_32464;
    block[3] = &unk_60820;
    void block[4] = self;
    dispatch_async(queue, block);
  }
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v16, 8);
}

- (void)discoveredServices:(id)a3 forPeripheral:(id)a4
{
  id v7 = a3;
  id v31 = a4;
  _HKInitializeLogging();
  BOOL v8 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544130;
    unint64_t v44 = self;
    __int16 v45 = 2114;
    uint64_t v46 = v10;
    __int16 v47 = 2114;
    id v48 = v31;
    __int16 v49 = 2114;
    id v50 = v7;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: peripheral: %{public}@, services: %{public}@", buf, 0x2Au);
  }
  uint64_t v11 = sub_32AFC(self, self->_allServicesUUID);
  id v12 = v11;
  if (v11 && [v11 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v28 = v7;
    id obj = v7;
    id v32 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v32)
    {
      uint64_t v30 = *(void *)v38;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(obj);
          }
          id v14 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)v13) UUID];
          uint64_t v15 = self;
          uint64_t v16 = sub_32588(self, v14, v31, 0, 0);

          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id v17 = v12;
          id v18 = v12;
          id v19 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v34;
            do
            {
              CFStringRef v22 = 0;
              do
              {
                if (*(void *)v34 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v33 + 1) + 8 * (void)v22);
                if (v23)
                {
                  BOOL v24 = (char *)*(id *)(v23 + 32);
                  uint64_t v25 = (void (**)(char *, uint64_t, void *, void, void))(v24 + 16);
                  uint64_t v26 = *(void *)(v23 + 24);
                }
                else
                {
                  BOOL v24 = 0;
                  uint64_t v26 = 0;
                  uint64_t v25 = (void (**)(char *, uint64_t, void *, void, void))&dword_10;
                }
                (*v25)(v24, v26, v16, 0, 0);

                CFStringRef v22 = (char *)v22 + 1;
              }
              while (v20 != v22);
              id v27 = [v18 countByEnumeratingWithState:&v33 objects:v41 count:16];
              id v20 = v27;
            }
            while (v27);
          }

          id v13 = (char *)v13 + 1;
          self = v15;
          id v12 = v17;
        }
        while (v13 != v32);
        id v32 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v32);
    }

    id v7 = v28;
  }
}

- (void)discoveredCharacteristics:(id)a3 forDevice:(id)a4 service:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  _HKInitializeLogging();
  id v12 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544386;
    long long v35 = self;
    __int16 v36 = 2114;
    long long v37 = v14;
    __int16 v38 = 2114;
    id v39 = v10;
    __int16 v40 = 2114;
    id v41 = v11;
    __int16 v42 = 2114;
    id v43 = v9;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: peripheralId: %{public}@, serviceId: %{public}@, characteristics: %{public}@", buf, 0x34u);
  }
  uint64_t v15 = +[NSMutableDictionary dictionary];
  connectionLock = self->_connectionLock;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_32EC0;
  v30[3] = &unk_607A8;
  v30[4] = self;
  id v17 = v10;
  id v31 = v17;
  id v18 = v15;
  id v32 = v18;
  [(NSLock *)connectionLock hk_withLock:v30];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v19 = v18;
  id v20 = [v19 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v27;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v27 != v22) {
          objc_enumerationMutation(v19);
        }
        BOOL v24 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        objc_msgSend(v19, "objectForKeyedSubscript:", v24, (void)v26);
        uint64_t v25 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, id, id, id, void))v25)[2](v25, [v24 integerValue], v9, v11, 0);
      }
      id v21 = [v19 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v21);
  }
}

- (unint64_t)connectHealthService:(id)a3 sessionHandler:(id)a4 dataHandler:(id)a5 characteristicsHandler:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  _HKInitializeLogging();
  id v17 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = v17;
    id v19 = NSStringFromSelector(a2);
    int v25 = 138543874;
    long long v26 = self;
    __int16 v27 = 2114;
    long long v28 = v19;
    __int16 v29 = 2114;
    id v30 = v13;
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: hkService: %{public}@", (uint8_t *)&v25, 0x20u);
  }
  id v20 = [_HDHealthServiceConnectionInfo alloc];
  id v21 = [v13 identifier];
  uint64_t v22 = sub_331C0((id *)&v20->super.isa, v16, v15, v14, 0, 0, &dword_4, v21, 30.0);

  unint64_t v23 = sub_33324((uint64_t)self, v13, v22, (uint64_t)a7);
  return v23;
}

- (void)disconnectHealthService:(unint64_t)a3
{
  _HKInitializeLogging();
  BOOL v6 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    BOOL v8 = NSStringFromSelector(a2);
    int v9 = 138543874;
    id v10 = self;
    __int16 v11 = 2114;
    id v12 = v8;
    __int16 v13 = 2048;
    unint64_t v14 = a3;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: sessionIdentifier: %lu", (uint8_t *)&v9, 0x20u);
  }
  sub_3437C((uint64_t)self, (uint64_t (*)(uint64_t, uint64_t))a3, 0);
}

- (void)unpairHealthServiceIfNecessary:(id)a3
{
  id v5 = a3;
  _HKInitializeLogging();
  BOOL v6 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v6;
    BOOL v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    long long v28 = self;
    __int16 v29 = 2114;
    id v30 = v8;
    __int16 v31 = 2114;
    id v32 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: healthService: %{public}@", buf, 0x20u);
  }
  if (v5)
  {
    int v9 = [v5 peripheral];
    if (v9) {
      goto LABEL_8;
    }
    _HKInitializeLogging();
    id v10 = (void *)HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = v10;
      id v12 = [v5 identifier];
      *(_DWORD *)buf = 138543618;
      long long v28 = self;
      __int16 v29 = 2114;
      id v30 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: retrievePeripheralsWithIdentifier: %{public}@", buf, 0x16u);
    }
    central = self->_central;
    unint64_t v14 = [v5 identifier];
    long long v26 = v14;
    id v15 = +[NSArray arrayWithObjects:&v26 count:1];
    id v16 = [(CBCentralManager *)central retrievePeripheralsWithIdentifiers:v15];
    int v9 = [v16 firstObject];

    if (v9)
    {
LABEL_8:
      id v17 = [(CBCentralManager *)self->_central sharedPairingAgent];
      unsigned __int8 v18 = [v17 isPeerPaired:v9];

      _HKInitializeLogging();
      id v19 = HKLogServices;
      BOOL v20 = os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v20)
        {
          *(_DWORD *)buf = 138412290;
          long long v28 = v9;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Unpairing peer %@", buf, 0xCu);
        }
        id v21 = self->_central;
        uint64_t v22 = [(CBCentralManager *)v21 sharedPairingAgent];
        [v22 unpairPeer:v9];
      }
      else if (v20)
      {
        *(_DWORD *)buf = 138412290;
        long long v28 = v9;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Peripheral %@ isn't paired. Unpairing isn't necessary.", buf, 0xCu);
      }
    }
    else
    {
      _HKInitializeLogging();
      unint64_t v23 = (void *)HKLogServices;
      if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v24 = v23;
        int v25 = [v5 identifier];
        *(_DWORD *)buf = 138412290;
        long long v28 = v25;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "No peripheral found for identifier %@. Unpairing isn't necessary.", buf, 0xCu);
      }
    }
  }
}

- (void)servicesInvalidatedForDevice:(id)a3 withError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  int v9 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    __int16 v11 = NSStringFromSelector(a2);
    int v12 = 138544130;
    __int16 v13 = self;
    __int16 v14 = 2114;
    id v15 = v11;
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: deviceIdentifier: %{public}@, error: %{public}@", (uint8_t *)&v12, 0x2Au);
  }
}

- (id)allServicesWithError:(id *)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = +[HDServiceEntity allServicesWithProfile:WeakRetained error:a3];

  return v5;
}

- (id)retrieveOOBData:(id *)a3
{
  if (self) {
    central = self->_central;
  }
  else {
    central = 0;
  }
  if (sub_30C64((uint64_t)HDHealthServiceManager, central, (uint64_t)a3) == 2)
  {
    if (self) {
      BOOL v6 = self->_central;
    }
    else {
      BOOL v6 = 0;
    }
    id v7 = [(CBCentralManager *)v6 advertisingAddress];
    if (self) {
      id v8 = self->_central;
    }
    else {
      id v8 = 0;
    }
    int v9 = [(CBCentralManager *)v8 sharedPairingAgent];
    [v9 setDelegate:self];
    id v10 = [v9 retrieveOOBDataForPeer:0];
    __int16 v11 = [[HDHealthServiceOOBInfo alloc] initWithOOBData:v10 btAddress:v7];
    if (!v11)
    {
      id v12 = +[NSError hk_error:202 description:@"OOB Data could not be read"];
      if (v12)
      {
        if (a3) {
          *a3 = v12;
        }
        else {
          _HKLogDroppedError();
        }
      }
    }
  }
  else
  {
    __int16 v11 = 0;
  }

  return v11;
}

- (void)resetOOBState
{
  if (self) {
    self = (HDHealthServiceManager *)self->_central;
  }
  id v2 = [(HDHealthServiceManager *)self sharedPairingAgent];
  [v2 setDelegate:0];
}

- (void)enablePrivateModeForSessionWithIdentifier:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_35ED8;
  v7[3] = &unk_608E8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)releasePrivateMode
{
  queue = self->_queue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_361A0;
  v3[3] = &unk_609D0;
  v3[4] = self;
  v3[5] = a2;
  dispatch_async(queue, v3);
}

- (id)_healthServiceForPeriperalID:(id)a3 serviceType:(int64_t)a4
{
  id v6 = a3;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_2F9EC;
  __int16 v18 = sub_2F9FC;
  id v19 = 0;
  connectionLock = self->_connectionLock;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_379EC;
  v11[3] = &unk_607D0;
  __int16 v13 = &v14;
  v11[4] = self;
  id v8 = v6;
  id v12 = v8;
  [(NSLock *)connectionLock hk_withLock:v11];
  int v9 = [(id)v15[5] healthServiceForType:a4];

  _Block_object_dispose(&v14, 8);

  return v9;
}

- (void)characteristicReceived:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSMutableDictionary dictionary];
  connectionLock = self->_connectionLock;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_37C40;
  v24[3] = &unk_608C0;
  id v10 = v7;
  id v25 = v10;
  long long v26 = self;
  id v11 = v8;
  id v27 = v11;
  id v12 = v6;
  id v28 = v12;
  [(NSLock *)connectionLock hk_withLock:v24];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  __int16 v13 = objc_msgSend(v11, "allKeys", 0);
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v29 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        __int16 v18 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v19 = [v11 objectForKeyedSubscript:v18];
        ((void (**)(void, id, id, id, void))v19)[2](v19, [v18 integerValue], v12, v10, 0);
      }
      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v29 count:16];
    }
    while (v15);
  }
}

- (void)getSupportedPropertyNamesWithHandler:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    HDHealthPeripheralAllPropertyNames();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, void))a3 + 2))(v4, v5, 0);
  }
}

- (void)getProperty:(id)a3 forSession:(unint64_t)a4 withHandler:(id)a5
{
  id v8 = a3;
  int v9 = (void (**)(id, void, void *))a5;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = sub_2F9EC;
  __int16 v18 = sub_2F9FC;
  id v19 = 0;
  connectionLock = self->_connectionLock;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_38204;
  v13[3] = &unk_607F8;
  v13[5] = &v14;
  v13[6] = a4;
  v13[4] = self;
  [(NSLock *)connectionLock hk_withLock:v13];
  id v11 = (void *)v15[5];
  if (v11)
  {
    [v11 getProperty:v8 withHandler:v9];
  }
  else
  {
    id v12 = +[NSError hk_error:304 description:@"Session not found"];
    v9[2](v9, 0, v12);
  }
  _Block_object_dispose(&v14, 8);
}

- (void)performOperation:(id)a3 onSession:(unint64_t)a4 withParameters:(id)a5 completion:(id)a6
{
  id v11 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v12 = a5;
  id v13 = a6;
  _HKInitializeLogging();
  uint64_t v14 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    uint64_t v16 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v16;
    *(_WORD *)&buf[22] = 2114;
    id v25 = v11;
    *(_WORD *)long long v26 = 2048;
    *(void *)&v26[2] = a4;
    *(_WORD *)&v26[10] = 2114;
    *(void *)&v26[12] = v12;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: op: %{public}@, sessionId: %lu, params: %{public}@", buf, 0x34u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v25 = sub_2F9EC;
  *(void *)long long v26 = sub_2F9FC;
  *(void *)&v26[8] = 0;
  connectionLock = self->_connectionLock;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_38588;
  v23[3] = &unk_607F8;
  v23[5] = buf;
  v23[6] = a4;
  v23[4] = self;
  [(NSLock *)connectionLock hk_withLock:v23];
  __int16 v18 = *(void **)(*(void *)&buf[8] + 40);
  if (v18)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_38624;
    v21[3] = &unk_61878;
    id v22 = v13;
    [v18 performOperation:v11 withParameters:v12 completion:v21];
    id v19 = v22;
  }
  else
  {
    long long v20 = +[NSNumber numberWithUnsignedInteger:a4];
    id v19 = +[NSError hk_error:304, @"Cannot find peripheral for session %@", v20 format];

    (*((void (**)(id, uint64_t (*)(uint64_t, uint64_t), void, void *))v13 + 2))(v13, v11, 0, v19);
  }

  _Block_object_dispose(buf, 8);
}

- (void)writeCharacteristic:(id)a3 onSession:(unint64_t)a4 expectResponse:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v11 = (uint64_t (*)(uint64_t, uint64_t))a3;
  id v12 = a6;
  _HKInitializeLogging();
  id v13 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = v13;
    id v15 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2114;
    BOOL v24 = v11;
    LOWORD(v25) = 2048;
    *(void *)((char *)&v25 + 2) = a4;
    WORD5(v25) = 1024;
    HIDWORD(v25) = v7;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: characteristic: %{public}@, sessionId: %lu, expectResponse: %{BOOL}d", buf, 0x30u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  BOOL v24 = sub_2F9EC;
  *(void *)&long long v25 = sub_2F9FC;
  *((void *)&v25 + 1) = 0;
  connectionLock = self->_connectionLock;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_38908;
  v22[3] = &unk_607F8;
  v22[5] = buf;
  v22[6] = a4;
  void v22[4] = self;
  [(NSLock *)connectionLock hk_withLock:v22];
  id v17 = *(void **)(*(void *)&buf[8] + 40);
  if (v17)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_389A4;
    v20[3] = &unk_612F0;
    id v21 = v12;
    [v17 writeCharacteristic:v11 expectResponse:v7 completion:v20];
    __int16 v18 = v21;
  }
  else
  {
    id v19 = +[NSNumber numberWithUnsignedInteger:a4];
    __int16 v18 = +[NSError hk_error:304, @"Cannot find peripheral for session %@", v19 format];

    (*((void (**)(id, void, void *))v12 + 2))(v12, 0, v18);
  }

  _Block_object_dispose(buf, 8);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = v6;
    id v8 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543874;
    long long v20 = self;
    __int16 v21 = 2114;
    id v22 = v8;
    __int16 v23 = 2114;
    id v24 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@", buf, 0x20u);
  }
  id v18 = 0;
  uint64_t v9 = sub_30C64((uint64_t)HDHealthServiceManager, v5, (uint64_t)&v18);
  id v10 = (HDHealthServiceManager *)v18;
  _HKInitializeLogging();
  id v11 = HKLogServices;
  BOOL v12 = os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT);
  if (v9 == 2)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "BTLE became available", buf, 2u);
    }
    sub_35168((uint64_t)self);
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138543362;
      long long v20 = v10;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "BTLE became unavailable: %{public}@", buf, 0xCu);
    }
    sub_356D0((uint64_t)self, v10);
  }
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_38BEC;
  v15[3] = &unk_60C98;
  uint64_t v16 = v10;
  uint64_t v17 = v9;
  v15[4] = self;
  uint64_t v14 = v10;
  dispatch_async(queue, v15);
}

- (void)centralManager:(id)a3 willRestoreState:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  uint64_t v9 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_INFO))
  {
    id v10 = v9;
    id v11 = NSStringFromSelector(a2);
    int v12 = 138544130;
    id v13 = self;
    __int16 v14 = 2114;
    id v15 = v11;
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2114;
    id v19 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "%{public}@: %{public}@: %{public}@: state: %{public}@", (uint8_t *)&v12, 0x2Au);
  }
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  uint64_t v9 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2114;
    id v21 = v7;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@: peripheral: %{public}@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v21) = 0;
  connectionLock = self->_connectionLock;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_38F68;
  v16[3] = &unk_618A0;
  v16[4] = self;
  id v13 = v8;
  id v17 = v13;
  id v14 = v7;
  id v18 = v14;
  id v19 = buf;
  [(NSLock *)connectionLock hk_withLock:v16];
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    id v15 = +[NSError hk_error:100, @"Peripheral requires MFA, but is already paired. peripheral=%@", v13 format];
    [(HDHealthServiceManager *)self centralManager:v14 didFailToConnectPeripheral:v13 error:v15];
  }
  _Block_object_dispose(buf, 8);
}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  _HKInitializeLogging();
  int v12 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544386;
    __int16 v31 = self;
    __int16 v32 = 2114;
    long long v33 = v14;
    __int16 v34 = 2114;
    id v35 = v9;
    __int16 v36 = 2114;
    id v37 = v10;
    __int16 v38 = 2114;
    id v39 = v11;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@: peripheral: %{public}@, error: %{public}@", buf, 0x34u);
  }
  id v15 = [v10 identifier];
  __int16 v16 = sub_35040(self, v15);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      id v21 = 0;
      do
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v21);
        if (v22) {
          id v23 = *(uint64_t (**)(uint64_t, uint64_t))(v22 + 16);
        }
        else {
          id v23 = 0;
        }
        sub_3437C((uint64_t)self, v23, v11);
        id v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v24 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      id v19 = v24;
    }
    while (v24);
  }
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  _HKInitializeLogging();
  int v12 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544386;
    __int16 v31 = self;
    __int16 v32 = 2114;
    long long v33 = v14;
    __int16 v34 = 2114;
    id v35 = v9;
    __int16 v36 = 2114;
    id v37 = v10;
    __int16 v38 = 2114;
    id v39 = v11;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: (#w0) %{public}@: %{public}@: peripheral: %{public}@, error: %{public}@", buf, 0x34u);
  }
  id v15 = [v10 identifier];
  __int16 v16 = sub_35040(self, v15);

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      id v21 = 0;
      do
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * (void)v21);
        if (v22) {
          id v23 = *(uint64_t (**)(uint64_t, uint64_t))(v22 + 16);
        }
        else {
          id v23 = 0;
        }
        sub_3437C((uint64_t)self, v23, v11);
        id v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v24 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      id v19 = v24;
    }
    while (v24);
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v30 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [v12 objectForKeyedSubscript:CBAdvertisementDataServiceUUIDsKey];
  __int16 v31 = v12;
  id v15 = [v12 objectForKeyedSubscript:CBAdvertisementDataServiceDataKey];
  _HKInitializeLogging();
  __int16 v16 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = v16;
    id v18 = NSStringFromSelector(a2);
    id v19 = [v14 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138544642;
    __int16 v38 = self;
    __int16 v39 = 2114;
    __int16 v40 = v18;
    __int16 v41 = 2114;
    id v42 = v30;
    __int16 v43 = 2114;
    id v44 = v11;
    __int16 v45 = 2114;
    id v46 = v13;
    __int16 v47 = 2114;
    id v48 = v19;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: %{public}@: peripheral: %{public}@ (RSSI: %{public}@) with services %{public}@", buf, 0x3Eu);
  }
  __int16 v29 = v13;
  uint64_t v20 = sub_32AFC(self, self->_allServicesUUID);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v21 = v14;
  id v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v27 = [v15 objectForKeyedSubscript:v26];
        long long v28 = sub_39B3C(self, v11, v26, v27, v31);

        sub_39D80((uint64_t)self, v20, v11, v28, 1);
      }
      id v23 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v23);
  }
}

- (unint64_t)connectHealthService:(id)a3 sessionHandler:(id)a4 dataHandler:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a4;
  _HKInitializeLogging();
  id v14 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    __int16 v16 = NSStringFromSelector(a2);
    int v22 = 138543874;
    id v23 = self;
    __int16 v24 = 2114;
    long long v25 = v16;
    __int16 v26 = 2114;
    id v27 = v11;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: hkService: %{public}@", (uint8_t *)&v22, 0x20u);
  }
  id v17 = [_HDHealthServiceConnectionInfo alloc];
  id v18 = [v11 identifier];
  id v19 = sub_331C0((id *)&v17->super.isa, v13, v12, &stru_618E0, 0, 0, &dword_4, v18, 30.0);

  unint64_t v20 = sub_33324((uint64_t)self, v11, v19, (uint64_t)a6);
  return v20;
}

- (unint64_t)connectHealthService:(id)a3 connectionOptions:(unint64_t)a4 sessionHandler:(id)a5 dataHandler:(id)a6 mfaSuccessHandler:(id)a7 autoPairData:(id)a8 error:(id *)a9
{
  id v16 = a3;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  _HKInitializeLogging();
  id v21 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = v21;
    id v23 = NSStringFromSelector(a2);
    int v29 = 138544130;
    id v30 = self;
    __int16 v31 = 2114;
    long long v32 = v23;
    __int16 v33 = 2114;
    id v34 = v16;
    __int16 v35 = 2048;
    unint64_t v36 = a4;
    _os_log_impl(&dword_0, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: hkService: %{public}@, connectionOptions: %lu", (uint8_t *)&v29, 0x2Au);
  }
  __int16 v24 = [_HDHealthServiceConnectionInfo alloc];
  long long v25 = [v16 identifier];
  __int16 v26 = sub_331C0((id *)&v24->super.isa, v20, v19, &stru_61900, v18, v17, (void *)a4, v25, 30.0);

  unint64_t v27 = sub_33324((uint64_t)self, v16, v26, (uint64_t)a9);
  return v27;
}

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  HKSessionTrackerAriadneTrigger();
  _HKInitializeLogging();
  id v9 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2114;
    id v23 = v7;
    __int16 v24 = 2114;
    id v25 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: agent: %{public}@, peer: %{public}@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v23) = 0;
  id v12 = [v8 identifier];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_3AA00;
  v19[3] = &unk_61928;
  v19[4] = buf;
  sub_37204((uint64_t)self, v12, v19);

  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    _HKInitializeLogging();
    id v13 = HKLogServices;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v8 identifier];
      *(_DWORD *)id v20 = 138412290;
      id v21 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Successfully paired: %@", v20, 0xCu);
    }
    if (self) {
      central = self->_central;
    }
    else {
      central = 0;
    }
    id v16 = central;
    id v17 = [v16 sharedPairingAgent];
    [v17 setDelegate:0];
  }
  else
  {
    _HKInitializeLogging();
    id v16 = HKLogServices;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [v8 identifier];
      *(_DWORD *)id v20 = 138412290;
      id v21 = v18;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Ignoring peerDidCompletePairing for %@", v20, 0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  HKSessionTrackerAriadneTrigger();
  _HKInitializeLogging();
  id v12 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2114;
    id v42 = v9;
    __int16 v43 = 2114;
    id v44 = v10;
    __int16 v45 = 2114;
    id v46 = v11;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: agent: %{public}@, peer: %{public}@, error: %{public}@", buf, 0x34u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v42) = 0;
  id v15 = [v10 identifier];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_3AE58;
  v35[3] = &unk_61928;
  v35[4] = buf;
  sub_37204((uint64_t)self, v15, v35);

  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    _HKInitializeLogging();
    id v16 = HKLogServices;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v10 identifier];
      *(_DWORD *)id v37 = 138412546;
      __int16 v38 = v17;
      __int16 v39 = 2114;
      id v40 = v11;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "peerDidFailToCompletePairing: %@ %{public}@", v37, 0x16u);
    }
    if (self) {
      central = self->_central;
    }
    else {
      central = 0;
    }
    id v19 = central;
    id v20 = [(CBCentralManager *)v19 sharedPairingAgent];
    [v20 setDelegate:0];

    id v21 = [v10 identifier];
    int v22 = sub_35040(self, v21);

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = v22;
    id v24 = [v23 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v32;
      do
      {
        __int16 v26 = 0;
        do
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v23);
          }
          uint64_t v27 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v26);
          if (v27)
          {
            long long v28 = (void (**)(id, uint64_t, uint64_t, void, id))*(id *)(v27 + 24);
            uint64_t v27 = *(void *)(v27 + 16);
          }
          else
          {
            long long v28 = 0;
          }
          v28[2](v28, v27, 8, 0, v11);
          -[HDHealthServiceManager disconnectHealthService:](self, "disconnectHealthService:", v27, (void)v31);

          __int16 v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        id v29 = [v23 countByEnumeratingWithState:&v31 objects:v36 count:16];
        id v24 = v29;
      }
      while (v29);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v23 = HKLogServices;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [v10 identifier];
      *(_DWORD *)id v37 = 138412546;
      __int16 v38 = v30;
      __int16 v39 = 2114;
      id v40 = v11;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Ignoring peerDidFailToCompletePairing for %@ %{public}@", v37, 0x16u);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  _HKInitializeLogging();
  id v9 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    id v11 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2114;
    id v26 = v7;
    __int16 v27 = 2114;
    id v28 = v8;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: agent: %{public}@, peer: %{public}@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  LOBYTE(v26) = 0;
  id v12 = [v8 identifier];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_3B1DC;
  v22[3] = &unk_61928;
  void v22[4] = buf;
  sub_37204((uint64_t)self, v12, v22);

  if (!*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    _HKInitializeLogging();
    id v20 = HKLogServices;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v8 identifier];
      *(_DWORD *)id v23 = 138412290;
      id v24 = v21;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Ignoring peerDidUnpairCallback for %@", v23, 0xCu);
    }
    goto LABEL_16;
  }
  _HKInitializeLogging();
  id v13 = HKLogServices;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [v8 identifier];
    *(_DWORD *)id v23 = 138412290;
    id v24 = v14;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Peripheral did unpair: %@", v23, 0xCu);
  }
  if (self) {
    central = self->_central;
  }
  else {
    central = 0;
  }
  id v16 = central;
  id v17 = [(CBCentralManager *)v16 sharedPairingAgent];
  [v17 setDelegate:0];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    _HKInitializeLogging();
    id v18 = HKLogServices;
    if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v23 = 138412290;
      id v24 = v8;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Canceling peripheral connection for peripheral %@", v23, 0xCu);
    }
    if (self) {
      id v19 = self->_central;
    }
    else {
      id v19 = 0;
    }
    id v20 = v19;
    [v20 cancelPeripheralConnection:v8];
LABEL_16:
  }
  _Block_object_dispose(buf, 8);
}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  _HKInitializeLogging();
  id v12 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v12;
    id v14 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138544130;
    id v40 = self;
    __int16 v41 = 2114;
    int64_t v42 = (int64_t)v14;
    __int16 v43 = 2114;
    *(void *)id v44 = v10;
    *(_WORD *)&v44[8] = 2114;
    *(void *)&v44[10] = v11;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@: agent: %{public}@, peer: %{public}@", buf, 0x2Au);
  }
  id v15 = [v11 identifier];
  id v16 = sub_35040(self, v15);

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v17 = v16;
  id v18 = [v17 countByEnumeratingWithState:&v32 objects:v38 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v33;
    while (2)
    {
      id v21 = 0;
      do
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * (void)v21);
        if (v22 && (*(unsigned char *)(v22 + 56) & 1) != 0)
        {
          id v26 = *(id *)(v22 + 72);

          if (a5 != 5)
          {
            _HKInitializeLogging();
            __int16 v27 = HKLogServices;
            if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_ERROR)) {
              sub_41F3C(a5, v27);
            }
          }
          uint64_t v36 = CBPairingAgentPairingDataOOBTKKey;
          id v37 = v26;
          id v28 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1, (void)v32);
          _HKInitializeLogging();
          id v29 = (void *)HKLogServices;
          if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = v29;
            long long v31 = [v11 identifier];
            *(_DWORD *)buf = 138544130;
            id v40 = v31;
            __int16 v41 = 2048;
            int64_t v42 = a5;
            __int16 v43 = 1024;
            *(_DWORD *)id v44 = a5 == 5;
            *(_WORD *)&v44[4] = 2114;
            *(void *)&v44[6] = v28;
            _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Responding to pairing for peer: %{public}@, with type: %ld, accept: %{BOOL}d, data: %{public}@", buf, 0x26u);
          }
          [v10 respondToPairingRequest:v11 type:a5 accept:a5 == 5 data:v28];

          goto LABEL_21;
        }
        id v21 = (char *)v21 + 1;
      }
      while (v19 != v21);
      id v19 = [v17 countByEnumeratingWithState:&v32 objects:v38 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }

  _HKInitializeLogging();
  id v23 = (void *)HKLogServices;
  if (os_log_type_enabled(HKLogServices, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = v23;
    objc_msgSend(v11, "identifier", (void)v32);
    uint64_t v25 = (HDHealthServiceManager *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    id v40 = v25;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Allowing pairing: %@", buf, 0xCu);
  }
  objc_msgSend(v10, "respondToPairingRequest:type:accept:data:", v11, a5, 1, 0, (void)v32);
LABEL_21:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateModeTimer, 0);
  objc_storeStrong((id *)&self->_bluetoothUpdateHandlers, 0);
  objc_storeStrong((id *)&self->_connectedPeripheralsByPeripheralUUID, 0);
  objc_storeStrong((id *)&self->_connectionInfosByPeripheralUUID, 0);
  objc_storeStrong((id *)&self->_connectionInfosTable, 0);
  objc_storeStrong((id *)&self->_connectionLock, 0);
  objc_storeStrong((id *)&self->_allServicesUUID, 0);
  objc_storeStrong((id *)&self->_scanServiceUUIDs, 0);
  objc_storeStrong((id *)&self->_discoveryInfosByServiceUUID, 0);
  objc_storeStrong((id *)&self->_discoveryInfosTable, 0);
  objc_storeStrong((id *)&self->_discoveryLock, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_dataCollectionManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_central, 0);
}

@end