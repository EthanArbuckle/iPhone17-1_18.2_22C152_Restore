@interface FMDBluetoothSessionInterface
- (BOOL)setUpAccessoryManager;
- (BOOL)setUpLocalDevice;
- (BTAccessoryManagerImpl)accessoryManager;
- (BTDeviceImpl)deviceWithAddress:(id)a3;
- (BTLocalDeviceImpl)localDevice;
- (BTSessionImpl)session;
- (FMDBluetoothSessionInterface)init;
- (FMFuture)futureSession;
- (OS_dispatch_queue)bluetoothSessionQueue;
- (OS_dispatch_queue)serialQueue;
- (int)listeningModeForAccessory:(id)a3 timeout:(double)a4;
- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6;
- (void)attachToSession;
- (void)dealloc;
- (void)detachFromSession;
- (void)performWithActiveSession:(id)a3;
- (void)sessionAttached:(BTSessionImpl *)a3 result:(int)a4;
- (void)sessionDetached:(BTSessionImpl *)a3;
- (void)sessionTerminated:(BTSessionImpl *)a3;
- (void)setAccessoryManager:(BTAccessoryManagerImpl *)a3;
- (void)setBluetoothSessionQueue:(id)a3;
- (void)setFutureSession:(id)a3;
- (void)setLocalDevice:(BTLocalDeviceImpl *)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSession:(BTSessionImpl *)a3;
- (void)startSession;
- (void)tearDownAccessoryManager;
- (void)tearDownLocalDevice;
- (void)updateListeningMode:(int)a3 accessory:(id)a4;
@end

@implementation FMDBluetoothSessionInterface

- (FMDBluetoothSessionInterface)init
{
  v8.receiver = self;
  v8.super_class = (Class)FMDBluetoothSessionInterface;
  v2 = [(FMDBluetoothSessionInterface *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.icloud.findmydeviced.FMDBluetoothSessionInterface", 0);
    [(FMDBluetoothSessionInterface *)v2 setSerialQueue:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.findmydeviced.FMDBluetoothSessionInterface.BTSession", 0);
    [(FMDBluetoothSessionInterface *)v2 setBluetoothSessionQueue:v4];

    v5 = sub_100006960();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initialized FMDBluetoothSessionInterface", v7, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  [(FMDBluetoothSessionInterface *)self detachFromSession];
  v3.receiver = self;
  v3.super_class = (Class)FMDBluetoothSessionInterface;
  [(FMDBluetoothSessionInterface *)&v3 dealloc];
}

- (void)startSession
{
}

- (int)listeningModeForAccessory:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  v7 = sub_100006960();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = [v6 audioRoutingIdentifier];
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Retrieving listening mode for accessory address: %@ | timeout: %f", buf, 0x16u);
  }
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  int v25 = 0;
  v9 = +[NSNumber numberWithDouble:a4];
  dispatch_time_t v10 = dispatch_time(0, 1000000000 * [v9 unsignedIntValue]);

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v28 = sub_10000748C;
  v29 = sub_10000749C;
  dispatch_semaphore_t v30 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000074A4;
  v16[3] = &unk_100021358;
  objc_copyWeak(&v20, &location);
  id v11 = v6;
  id v17 = v11;
  v18 = &v22;
  v19 = buf;
  [(FMDBluetoothSessionInterface *)self performWithActiveSession:v16];
  if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&buf[8] + 40), v10))
  {
    v12 = sub_100006960();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [v11 audioRoutingIdentifier];
      sub_100012334(v13, (uint64_t)v26, v12);
    }

    int v14 = 0;
  }
  else
  {
    int v14 = *((_DWORD *)v23 + 6);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (void)updateListeningMode:(int)a3 accessory:(id)a4
{
  id v6 = a4;
  v7 = sub_100006960();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v8 = [v6 audioRoutingIdentifier];
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Attempting to set listening mode for accessory address: %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000077D8;
  v10[3] = &unk_100021380;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = v6;
  id v11 = v9;
  int v13 = a3;
  [(FMDBluetoothSessionInterface *)self performWithActiveSession:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)performWithActiveSession:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(FMDBluetoothSessionInterface *)self serialQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007A54;
  v8[3] = &unk_1000213F8;
  objc_copyWeak(&v11, &location);
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  v7 = v5;
  dispatch_async(v7, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (BTDeviceImpl)deviceWithAddress:(id)a3
{
  id v4 = a3;
  v5 = [(FMDBluetoothSessionInterface *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(FMDBluetoothSessionInterface *)self session];
  if (!v4 || (v7 = v6, [v4 isEqualToString:&stru_100023EB8]))
  {
    objc_super v8 = sub_100006960();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100012628();
    }
LABEL_5:

    goto LABEL_6;
  }
  if (!v7)
  {
    objc_super v8 = sub_100006960();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001265C();
    }
    goto LABEL_5;
  }
  WORD2(v14) = 0;
  LODWORD(v14) = 0;
  id v10 = v4;
  [v10 UTF8String];
  if (BTDeviceAddressFromString())
  {
    id v11 = sub_100006960();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100012730();
    }
  }
  else
  {
    int v12 = BTDeviceFromAddress();
    int v13 = sub_100006960();
    id v11 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000126C8();
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Found BTDevice at address %@", buf, 0xCu);
    }
  }

LABEL_6:
  return 0;
}

- (void)sessionAttached:(BTSessionImpl *)a3 result:(int)a4
{
  v7 = [(FMDBluetoothSessionInterface *)self serialQueue];
  dispatch_assert_queue_V2(v7);

  if (a4)
  {
    objc_super v8 = sub_100006960();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100012798(a4, v8);
    }

    id v9 = [(FMDBluetoothSessionInterface *)self futureSession];
    uint64_t v10 = 0;
    goto LABEL_16;
  }
  [(FMDBluetoothSessionInterface *)self detachFromSession];
  id v11 = sub_100006960();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134218240;
    id v17 = a3;
    __int16 v18 = 1024;
    int v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Session attached %p, result: %d.", (uint8_t *)&v16, 0x12u);
  }

  [(FMDBluetoothSessionInterface *)self setSession:a3];
  if (a3)
  {
    BTServiceAddCallbacks();
    int v12 = sub_100006960();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 134217984;
      id v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Registered session callbacks %p", (uint8_t *)&v16, 0xCu);
    }
  }
  if (![(FMDBluetoothSessionInterface *)self setUpLocalDevice])
  {
    id v9 = [(FMDBluetoothSessionInterface *)self futureSession];
    uint64_t v10 = 1;
LABEL_16:
    v15 = +[NSError errorWithDomain:@"FMDBluetoothSessionInterfaceErrorDomain" code:v10 userInfo:0];
    [v9 finishWithError:v15];

    goto LABEL_17;
  }
  unsigned __int8 v13 = [(FMDBluetoothSessionInterface *)self setUpAccessoryManager];
  uint64_t v14 = [(FMDBluetoothSessionInterface *)self futureSession];
  id v9 = v14;
  if ((v13 & 1) == 0)
  {
    uint64_t v10 = 2;
    goto LABEL_16;
  }
  [v14 finishWithNoResult];
LABEL_17:
}

- (void)sessionDetached:(BTSessionImpl *)a3
{
  v5 = [(FMDBluetoothSessionInterface *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100006960();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Session detached %p", (uint8_t *)&v8, 0xCu);
  }

  if ([(FMDBluetoothSessionInterface *)self session] == a3)
  {
    [(FMDBluetoothSessionInterface *)self detachFromSession];
  }
  else
  {
    v7 = sub_100006960();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100012810();
    }
  }
}

- (void)sessionTerminated:(BTSessionImpl *)a3
{
  v5 = [(FMDBluetoothSessionInterface *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = sub_100006960();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    id v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Session terminated %p", (uint8_t *)&v8, 0xCu);
  }

  if ([(FMDBluetoothSessionInterface *)self session] == a3)
  {
    [(FMDBluetoothSessionInterface *)self detachFromSession];
    [(FMDBluetoothSessionInterface *)self attachToSession];
  }
  else
  {
    v7 = sub_100006960();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100012844();
    }
  }
}

- (void)attachToSession
{
  objc_super v3 = [(FMDBluetoothSessionInterface *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(FMDBluetoothSessionInterface *)self futureSession];

  if (v4)
  {
    v5 = sub_100006960();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "Already attaching to session. Ignoring new request.";
      v7 = buf;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else
  {
    [(FMDBluetoothSessionInterface *)self detachFromSession];
    int v8 = objc_opt_new();
    [(FMDBluetoothSessionInterface *)self setFutureSession:v8];

    id v9 = [(FMDBluetoothSessionInterface *)self bluetoothSessionQueue];
    int v10 = BTSessionAttachWithQueue();

    id v11 = sub_100006960();
    v5 = v11;
    if (!v10)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_10;
      }
      __int16 v12 = 0;
      id v6 = "Attaching to session...";
      v7 = (uint8_t *)&v12;
      goto LABEL_4;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100012878(v10, v5);
    }
  }
LABEL_10:
}

- (void)detachFromSession
{
  [(FMDBluetoothSessionInterface *)self tearDownAccessoryManager];
  [(FMDBluetoothSessionInterface *)self tearDownLocalDevice];
  objc_super v3 = [(FMDBluetoothSessionInterface *)self session];
  if (v3)
  {
    id v4 = v3;
    BTServiceRemoveCallbacks();
    v5 = sub_100006960();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Detaching from session %p", buf, 0xCu);
    }

    BTSessionDetachWithQueue();
    [(FMDBluetoothSessionInterface *)self setSession:0];
    [(FMDBluetoothSessionInterface *)self setFutureSession:0];
  }
  else
  {
    id v6 = sub_100006960();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Session requested detach, but we had no session. Nothing to do.", buf, 2u);
    }
  }
}

- (BOOL)setUpAccessoryManager
{
  objc_super v3 = [(FMDBluetoothSessionInterface *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  [(FMDBluetoothSessionInterface *)self tearDownAccessoryManager];
  id v4 = [(FMDBluetoothSessionInterface *)self session];
  if (!v4)
  {
    id v6 = sub_100006960();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000128F0();
    }
    goto LABEL_10;
  }
  v5 = v4;
  if (BTAccessoryManagerGetDefault())
  {
    id v6 = sub_100006960();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100012924();
    }
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  [(FMDBluetoothSessionInterface *)self accessoryManager];
  int v7 = BTAccessoryManagerAddCallbacks();
  int v8 = sub_100006960();
  id v6 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134218496;
      __int16 v12 = [(FMDBluetoothSessionInterface *)self accessoryManager];
      __int16 v13 = 2048;
      uint64_t v14 = v5;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed adding callbacks to accessory manager %p from session: %p, result: %d", (uint8_t *)&v11, 0x1Cu);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134217984;
    __int16 v12 = [(FMDBluetoothSessionInterface *)self accessoryManager];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished setup of accessory manager %p", (uint8_t *)&v11, 0xCu);
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)tearDownAccessoryManager
{
  objc_super v3 = [(FMDBluetoothSessionInterface *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(FMDBluetoothSessionInterface *)self accessoryManager];
  if (v4)
  {
    v5 = v4;
    BTAccessoryManagerRemoveCallbacks();
    [(FMDBluetoothSessionInterface *)self setAccessoryManager:0];
    id v6 = sub_100006960();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      int v11 = v5;
      int v7 = "Tear-down finished for accessory manager: %p";
      int v8 = v6;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else
  {
    id v6 = sub_100006960();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      int v7 = "No accessory manager to tear-down.";
      int v8 = v6;
      uint32_t v9 = 2;
      goto LABEL_6;
    }
  }
}

- (void)accessoryManager:(BTAccessoryManagerImpl *)a3 event:(int)a4 device:(BTDeviceImpl *)a5 state:(int)a6
{
  int v10 = [(FMDBluetoothSessionInterface *)self serialQueue];
  dispatch_assert_queue_V2(v10);

  int v11 = sub_100006960();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 134218752;
    __int16 v13 = a3;
    __int16 v14 = 1024;
    int v15 = a4;
    __int16 v16 = 2048;
    id v17 = a5;
    __int16 v18 = 1024;
    int v19 = a6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "accessoryManager = %p, accessoryEvent = %d, device = %p, state = %d", (uint8_t *)&v12, 0x22u);
  }
}

- (BOOL)setUpLocalDevice
{
  objc_super v3 = [(FMDBluetoothSessionInterface *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  [(FMDBluetoothSessionInterface *)self tearDownLocalDevice];
  id v4 = [(FMDBluetoothSessionInterface *)self session];
  if (!v4)
  {
    id v6 = sub_100006960();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001298C();
    }
    goto LABEL_10;
  }
  v5 = v4;
  if (BTLocalDeviceGetDefault())
  {
    id v6 = sub_100006960();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000129C0();
    }
LABEL_10:
    BOOL v9 = 0;
    goto LABEL_11;
  }
  [(FMDBluetoothSessionInterface *)self localDevice];
  int v7 = BTLocalDeviceAddCallbacks();
  int v8 = sub_100006960();
  id v6 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 134218496;
      int v12 = [(FMDBluetoothSessionInterface *)self localDevice];
      __int16 v13 = 2048;
      __int16 v14 = v5;
      __int16 v15 = 1024;
      int v16 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed adding callbacks to local device %p from session %p. Result: %d.", (uint8_t *)&v11, 0x1Cu);
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Local device set up.", (uint8_t *)&v11, 2u);
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)tearDownLocalDevice
{
  objc_super v3 = [(FMDBluetoothSessionInterface *)self serialQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(FMDBluetoothSessionInterface *)self localDevice];
  if (v4)
  {
    v5 = v4;
    BTLocalDeviceRemoveCallbacks();
    [(FMDBluetoothSessionInterface *)self setLocalDevice:0];
    id v6 = sub_100006960();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 134217984;
      int v11 = v5;
      int v7 = "Tear-down finished for local device: %p";
      int v8 = v6;
      uint32_t v9 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else
  {
    id v6 = sub_100006960();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      int v7 = "No local device to tear-down.";
      int v8 = v6;
      uint32_t v9 = 2;
      goto LABEL_6;
    }
  }
}

- (BTSessionImpl)session
{
  return self->_session;
}

- (void)setSession:(BTSessionImpl *)a3
{
  self->_session = a3;
}

- (BTLocalDeviceImpl)localDevice
{
  return self->_localDevice;
}

- (void)setLocalDevice:(BTLocalDeviceImpl *)a3
{
  self->_localDevice = a3;
}

- (BTAccessoryManagerImpl)accessoryManager
{
  return self->_accessoryManager;
}

- (void)setAccessoryManager:(BTAccessoryManagerImpl *)a3
{
  self->_accessoryManager = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)bluetoothSessionQueue
{
  return self->_bluetoothSessionQueue;
}

- (void)setBluetoothSessionQueue:(id)a3
{
}

- (FMFuture)futureSession
{
  return self->_futureSession;
}

- (void)setFutureSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_futureSession, 0);
  objc_storeStrong((id *)&self->_bluetoothSessionQueue, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end