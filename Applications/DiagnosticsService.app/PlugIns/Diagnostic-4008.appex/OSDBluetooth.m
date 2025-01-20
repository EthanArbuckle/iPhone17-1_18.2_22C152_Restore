@interface OSDBluetooth
- (BOOL)_setBluetoothPower:(BTLocalDeviceImpl *)a3 enabled:(BOOL)a4 timeout:(double)a5;
- (BOOL)_setupBluetoothSessionAndDevice:(id *)a3;
- (BOOL)setBluetoothPowerOn:(BOOL)a3;
- (BOOL)started;
- (BOOL)stopped;
- (BTSessionImpl)session;
- (NSMutableArray)devices;
- (OSDBluetooth)init;
- (OS_dispatch_semaphore)statusSema;
- (id)performBluetoothScanWithTimeout:(double)a3 foundDevices:(id)a4;
- (int)_bluetoothPower:(BTLocalDeviceImpl *)a3 isEnabled:(BOOL *)a4;
- (void)_teardownBluetoothSessionAndDevice;
- (void)performScanOnQueue:(id)a3 timeout:(double)a4 gracePeriod:(double)a5 completionBlock:(id)a6;
- (void)setDevices:(id)a3;
- (void)setSession:(BTSessionImpl *)a3;
- (void)setStarted:(BOOL)a3;
- (void)setStatusSema:(id)a3;
- (void)setStopped:(BOOL)a3;
@end

@implementation OSDBluetooth

- (OSDBluetooth)init
{
  v8.receiver = self;
  v8.super_class = (Class)OSDBluetooth;
  v2 = [(OSDBluetooth *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create((const char *)[@"com.apple.Diagnostics.DABluetooth" UTF8String], 0);
    btQueue = v2->_btQueue;
    v2->_btQueue = (OS_dispatch_queue *)v3;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    statusSema = v2->_statusSema;
    v2->_statusSema = (OS_dispatch_semaphore *)v5;

    v2->_attachDetachCallback.sessionEvent = sub_100003368;
    v2->_discoveryCallbacks.statusEvent = sub_100003560;
    v2->_discoveryCallbacks.discoveryEvent = sub_1000036D0;
    v2->_localDeviceCallbacks.leTestStopped = 0;
    v2->_localDeviceCallbacks.afhMapChanged = 0;
    v2->_localDeviceCallbacks.statusEvent = sub_100003964;
    objc_storeStrong((id *)&qword_10000C820, v2);
  }
  return v2;
}

- (int)_bluetoothPower:(BTLocalDeviceImpl *)a3 isEnabled:(BOOL *)a4
{
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  int v22 = 0;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  int v7 = -5;
  do
  {
    objc_initWeak(&location, self);
    btQueue = self->_btQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003E70;
    block[3] = &unk_100008298;
    objc_copyWeak(v13, &location);
    block[4] = &v15;
    block[5] = &v19;
    v13[1] = a3;
    v13[2] = a4;
    dispatch_sync(btQueue, block);
    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
    int v9 = *((_DWORD *)v16 + 6);
    if (v9) {
      break;
    }
  }
  while (*((_DWORD *)v20 + 6) == -889275714 && v7++ != 0);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v9;
}

- (BOOL)_setBluetoothPower:(BTLocalDeviceImpl *)a3 enabled:(BOOL)a4 timeout:(double)a5
{
  BOOL v5 = a4;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 1;
  char v22 = 0;
  if (![(OSDBluetooth *)self _bluetoothPower:a3 isEnabled:&v22])
  {
    BOOL v11 = v22 != 0;
    if (!v5) {
      BOOL v11 = v22 == 0;
    }
    if (v11)
    {
      int v9 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v12 = "BT module was already in the correct power state; doing nothing.";
        v13 = v9;
        uint32_t v14 = 2;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }
    else
    {
      btQueue = self->_btQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100004364;
      block[3] = &unk_1000082C0;
      block[4] = &v23;
      block[5] = a3;
      BOOL v21 = v5;
      dispatch_sync(btQueue, block);
      statusSema = self->_statusSema;
      dispatch_time_t v17 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      dispatch_semaphore_wait(statusSema, v17);
      if (*((_DWORD *)v24 + 6))
      {
        int v9 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100005E48(v5, v9);
        }
        goto LABEL_4;
      }
      int v9 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v18 = @"OFF";
        if (v5) {
          CFStringRef v18 = @"ON";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v28 = v18;
        v12 = "Set BT module power: %@";
        v13 = v9;
        uint32_t v14 = 12;
        goto LABEL_17;
      }
    }
    BOOL v10 = 1;
    goto LABEL_19;
  }
  int v9 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100005ED8();
  }
LABEL_4:
  BOOL v10 = 0;
LABEL_19:

  _Block_object_dispose(&v23, 8);
  return v10;
}

- (BOOL)_setupBluetoothSessionAndDevice:(id *)a3
{
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  if (!self->_session)
  {
    objc_initWeak(&location, self);
    btQueue = self->_btQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004784;
    block[3] = &unk_1000082E8;
    objc_copyWeak(&v23, &location);
    block[4] = &v25;
    dispatch_sync(btQueue, block);
    statusSema = self->_statusSema;
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(statusSema, v8);
    if (*((_DWORD *)v26 + 6))
    {
      +[OSDError setError:a3 withDomain:@"com.apple.Diagnostics.DABluetooth" withCode:2101 format:@"Error attaching to BTSession."];
      BOOL v3 = 0;
LABEL_18:
      objc_destroyWeak(&v23);
      objc_destroyWeak(&location);
      goto LABEL_19;
    }
    int v9 = self->_btQueue;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100004824;
    v20[3] = &unk_1000082E8;
    objc_copyWeak(&v21, &location);
    v20[4] = &v25;
    dispatch_sync(v9, v20);
    if (*((_DWORD *)v26 + 6))
    {
      +[OSDError setError:a3 withDomain:@"com.apple.Diagnostics.DABluetooth" withCode:2102 format:@"Error getting default bluetooth device"];
      BOOL v3 = 0;
LABEL_17:
      objc_destroyWeak(&v21);
      goto LABEL_18;
    }
    BOOL v10 = self->_btQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000488C;
    v18[3] = &unk_1000082E8;
    objc_copyWeak(&v19, &location);
    v18[4] = &v25;
    dispatch_sync(v10, v18);
    if (*((_DWORD *)v26 + 6))
    {
      +[OSDError setError:a3 withDomain:@"com.apple.Diagnostics.DABluetooth" withCode:2103 format:@"Error adding bluetooth device callbacks"];
      BOOL v3 = 0;
LABEL_16:
      objc_destroyWeak(&v19);
      goto LABEL_17;
    }
    BOOL v11 = self->_btQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000048F4;
    v16[3] = &unk_1000082E8;
    objc_copyWeak(&v17, &location);
    v16[4] = &v25;
    dispatch_sync(v11, v16);
    if (*((_DWORD *)v26 + 6))
    {
      CFStringRef v12 = @"Error creating bluetooth discovery agent";
      uint64_t v13 = 2104;
    }
    else
    {
      session = self->_session;
      BOOL v3 = session != 0;
      if (!session) {
        +[OSDError setError:a3 withDomain:@"com.apple.Diagnostics.DABluetooth" withCode:2105 format:@"Error creating a Bluetooth session"];
      }
      if (self->_localDevice) {
        goto LABEL_15;
      }
      CFStringRef v12 = @"Error creating a Bluetooth local device object";
      uint64_t v13 = 2106;
    }
    +[OSDError setError:a3 withDomain:@"com.apple.Diagnostics.DABluetooth" withCode:v13 format:v12];
    BOOL v3 = 0;
LABEL_15:
    objc_destroyWeak(&v17);
    goto LABEL_16;
  }
  BOOL v3 = 1;
LABEL_19:
  _Block_object_dispose(&v25, 8);
  return v3;
}

- (void)_teardownBluetoothSessionAndDevice
{
  objc_initWeak(&location, self);
  btQueue = self->_btQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004A08;
  v4[3] = &unk_100008310;
  objc_copyWeak(&v5, &location);
  dispatch_sync(btQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)performBluetoothScanWithTimeout:(double)a3 foundDevices:(id)a4
{
  id v6 = a4;
  uint64_t v17 = 0;
  CFStringRef v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100004C44;
  id v21 = sub_100004C54;
  char v22 = &off_100008560;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  dispatch_queue_t v8 = dispatch_queue_create((const char *)[@"com.apple.Diagnostics.DABluetooth" UTF8String], 0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004C5C;
  id v13[3] = &unk_100008270;
  id v9 = v6;
  id v14 = v9;
  v16 = &v17;
  BOOL v10 = v7;
  uint64_t v15 = v10;
  [(OSDBluetooth *)self performScanOnQueue:v8 timeout:v13 gracePeriod:a3 completionBlock:2.0];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)performScanOnQueue:(id)a3 timeout:(double)a4 gracePeriod:(double)a5 completionBlock:(id)a6
{
  id v10 = a6;
  if (a4 <= 0.0) {
    a4 = 8.0;
  }
  if (a5 <= 0.0) {
    a5 = 2.0;
  }
  id v11 = a3;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100004FC4;
  id v13[3] = &unk_100008338;
  void v13[4] = self;
  objc_copyWeak(v15, &location);
  v15[1] = *(id *)&a4;
  v15[2] = *(id *)&a5;
  id v14 = v10;
  id v12 = v10;
  dispatch_async(v11, v13);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (BOOL)setBluetoothPowerOn:(BOOL)a3
{
  BOOL v3 = a3;
  [(OSDBluetooth *)self _setupBluetoothSessionAndDevice:0];
  LOBYTE(v3) = [(OSDBluetooth *)self _setBluetoothPower:self->_localDevice enabled:v3 timeout:5.0];
  [(OSDBluetooth *)self _teardownBluetoothSessionAndDevice];
  return v3;
}

- (OS_dispatch_semaphore)statusSema
{
  return self->_statusSema;
}

- (void)setStatusSema:(id)a3
{
}

- (NSMutableArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (BOOL)started
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)stopped
{
  return self->_stopped;
}

- (void)setStopped:(BOOL)a3
{
  self->_stopped = a3;
}

- (BTSessionImpl)session
{
  return self->_session;
}

- (void)setSession:(BTSessionImpl *)a3
{
  self->_session = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_statusSema, 0);

  objc_storeStrong((id *)&self->_btQueue, 0);
}

@end