uint64_t sub_311C()
{
  if (qword_2B428 != -1) {
    dispatch_once(&qword_2B428, &stru_24498);
  }
  return byte_2B420;
}

void sub_3160(id a1)
{
  byte_2B420 = os_variant_has_internal_diagnostics();
}

id sub_3188()
{
  if (qword_2B438 != -1) {
    dispatch_once(&qword_2B438, &stru_244B8);
  }
  v0 = (void *)qword_2B430;

  return v0;
}

void sub_31DC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  v2 = (void *)qword_2B430;
  qword_2B430 = (uint64_t)v1;
}

id sub_3220()
{
  if (qword_2B448 != -1) {
    dispatch_once(&qword_2B448, &stru_244D8);
  }
  v0 = (void *)qword_2B440;

  return v0;
}

void sub_3274(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "monitor");
  v2 = (void *)qword_2B440;
  qword_2B440 = (uint64_t)v1;
}

id sub_32B8()
{
  if (qword_2B458 != -1) {
    dispatch_once(&qword_2B458, &stru_244F8);
  }
  v0 = (void *)qword_2B450;

  return v0;
}

void sub_330C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "init");
  v2 = (void *)qword_2B450;
  qword_2B450 = (uint64_t)v1;
}

id sub_3350()
{
  if (qword_2B468 != -1) {
    dispatch_once(&qword_2B468, &stru_24518);
  }
  v0 = (void *)qword_2B460;

  return v0;
}

void sub_33A4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "analytics");
  v2 = (void *)qword_2B460;
  qword_2B460 = (uint64_t)v1;
}

id sub_33E8()
{
  if (qword_2B478 != -1) {
    dispatch_once(&qword_2B478, &stru_24538);
  }
  v0 = (void *)qword_2B470;

  return v0;
}

void sub_343C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Daemon", "default");
  v2 = (void *)qword_2B470;
  qword_2B470 = (uint64_t)v1;
}

void sub_3480(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)qword_2B480;
  qword_2B480 = (uint64_t)v1;
}

id sub_34C0()
{
  if (qword_2B488 != -1) {
    dispatch_once(&qword_2B488, &stru_24558);
  }
  v0 = (void *)qword_2B480;

  return v0;
}

void sub_3514(id a1)
{
  if (!qword_2B480) {
    objc_storeStrong((id *)&qword_2B480, &_os_log_default);
  }
}

id sub_3538()
{
  if (qword_2B498 != -1) {
    dispatch_once(&qword_2B498, &stru_24578);
  }
  v0 = (void *)qword_2B490;

  return v0;
}

void sub_358C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  v2 = (void *)qword_2B490;
  qword_2B490 = (uint64_t)v1;
}

id sub_35D0()
{
  if (qword_2B4A8 != -1) {
    dispatch_once(&qword_2B4A8, &stru_24598);
  }
  v0 = (void *)qword_2B4A0;

  return v0;
}

void sub_3624(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Haptics", "default");
  v2 = (void *)qword_2B4A0;
  qword_2B4A0 = (uint64_t)v1;
}

id sub_3668()
{
  if (qword_2B4B8 != -1) {
    dispatch_once(&qword_2B4B8, &stru_245B8);
  }
  v0 = (void *)qword_2B4B0;

  return v0;
}

void sub_36BC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  v2 = (void *)qword_2B4B0;
  qword_2B4B0 = (uint64_t)v1;
}

id sub_3700()
{
  if (qword_2B4C8 != -1) {
    dispatch_once(&qword_2B4C8, &stru_245D8);
  }
  v0 = (void *)qword_2B4C0;

  return v0;
}

void sub_3754(id a1)
{
  os_log_t v1 = os_log_create("com.apple.runtime-issues", "GameController");
  v2 = (void *)qword_2B4C0;
  qword_2B4C0 = (uint64_t)v1;
}

NSXPCInterface *sub_3798()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCGameIntentServiceClientInterface];
}

NSXPCInterface *sub_37AC()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCGameIntentServiceServerInterface];
}

NSObject *sub_37C0(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
{
  id v7 = a4;
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, a3);
  if (v8)
  {
    dispatch_time_t v9 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v8, v9, a1, a2);
    dispatch_source_set_event_handler(v8, v7);
    dispatch_resume(v8);
  }

  return v8;
}

void sub_3A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3A78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_34C0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Connection to com.apple.GameController.gamecontrollerd.driver invalidated", v3, 2u);
  }

  [WeakRetained setInterruptionHandler:0];
  [WeakRetained setInvalidationHandler:0];
  [WeakRetained invalidate];
}

void sub_3B10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_34C0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Connection to com.apple.GameController.gamecontrollerd.driver interrupted.  Attempting to re-establish.", v4, 2u);
  }

  v3 = [WeakRetained remoteObjectProxy];
  [v3 driverCheckIn];
}

void sub_3F9C(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a3 | a2)
  {
    switch(a2)
    {
      case 3:
        v5 = sub_34C0();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          uint64_t v10 = a1;
          v6 = "BTSessionEventCallback: failed session = %p";
LABEL_15:
          _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0xCu);
        }
        break;
      case 2:
        v5 = sub_34C0();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          uint64_t v10 = a1;
          v6 = "BTSessionEventCallback: terminated session = %p";
          goto LABEL_15;
        }
        break;
      case 1:
        v5 = sub_34C0();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        int v9 = 134217984;
        uint64_t v10 = a1;
        v6 = "BTSessionEventCallback: detached session = %p";
        goto LABEL_15;
      default:
        return;
    }

    return;
  }
  v8 = sub_34C0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = a1;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "BTSessionEventCallback: attached session = %p", (uint8_t *)&v9, 0xCu);
  }

  if (!*(void *)(a4 + 40)) {
    *(void *)(a4 + 40) = a1;
  }
}

void sub_42E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_42F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4308(uint64_t a1)
{
}

void sub_4310(uint64_t a1)
{
  v2 = +[NSString stringWithCString:dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)) encoding:4];
  v3 = sub_34C0();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Freeing HIDDevice on %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

BOOL sub_4708(id a1, NSDictionary *a2, NSDictionary *a3)
{
  v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(NSDictionary *)v3 objectForKeyedSubscript:@"DeviceUsagePage"];
    v5 = [(NSDictionary *)v3 objectForKeyedSubscript:@"DeviceUsage"];
    char v6 = (![v4 isEqual:&off_25F30]
       || ([v5 isEqual:&off_25F48] & 1) == 0)
      && (![v4 isEqual:&off_25F30]
       || ([v5 isEqual:&off_25F60] & 1) == 0)
      && (![v4 isEqual:&off_25F30]
       || ([v5 isEqual:&off_25F30] & 1) == 0);
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

void sub_4C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4CA4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_34C0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "calling cancel handler", v4, 2u);
    }

    (*(void (**)(void))(WeakRetained[1] + 16))();
    v3 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

void sub_4E98(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  char v6 = *(NSObject **)(v2 + 536);
  if (v6)
  {
    dispatch_source_cancel(v6);
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 536);
    *(void *)(v7 + 536) = 0;
  }
}

void sub_5884(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 560);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_592C;
  v7[3] = &unk_24690;
  v7[4] = v2;
  uint64_t v4 = sub_37C0(0x6FC23AC00uLL, 0x3B9ACA00uLL, v3, v7);
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v4;
}

id sub_592C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateIdleState];
}

void sub_5B10(id a1)
{
}

void sub_5B80(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a1)
  {
    id v7 = v5;
    if (a3) {
      *(void *)(a1 + 664) = [v5 timestamp];
    }
    [v7 timestamp];
    [v7 type];
    kdebug_trace();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 624));
    [WeakRetained dispatchEvent:v7];

    id v5 = v7;
  }
}

uint64_t sub_5C30(uint64_t result)
{
  if (result) {
    return *(void *)(result + 656);
  }
  return result;
}

id sub_5D84(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchEvent:*(void *)(a1 + 40)];
}

id sub_5EC0(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchIdleEvent:*(void *)(a1 + 40)];
}

void sub_7018(uint64_t a1)
{
  os_log_t v1 = (id *)(a1 + 32);
  id WeakRetained = (timespec *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!LOBYTE(WeakRetained[30].tv_nsec))
    {
      LOBYTE(WeakRetained[30].tv_nsec) = 1;
      if (!WeakRetained[33].tv_nsec)
      {
        clock_gettime(_CLOCK_MONOTONIC_RAW, WeakRetained + 32);
        tv_sec = v3[35].tv_sec;
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_710C;
        v7[3] = &unk_24600;
        objc_copyWeak(&v8, v1);
        uint64_t v5 = sub_37C0(0xF4240uLL, 0x186A0uLL, tv_sec, v7);
        tv_nsec = (void *)v3[33].tv_nsec;
        v3[33].tv_nsec = v5;

        objc_destroyWeak(&v8);
      }
    }
  }
}

void sub_710C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unsigned long long v5 = 0uLL;
    clock_gettime(_CLOCK_MONOTONIC_RAW, (timespec *)&v5);
    if ((double)(uint64_t)((double)*((uint64_t *)&v5 + 1)
                         + (double)(uint64_t)v5 * 1000000000.0
                         - ((double)*((uint64_t *)WeakRetained + 65)
                          + (double)*((uint64_t *)WeakRetained + 64) * 1000000000.0))
       * 0.000000001 >= *((float *)WeakRetained + 124))
    {
      WeakRetained[32] = v5;
      unsigned __int8 v2 = [WeakRetained isAnyHapticMotorEnabled];
      v3 = sub_34C0();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
      if (v2)
      {
        if (v4) {
          sub_17428(v3);
        }

        *((_DWORD *)WeakRetained + 123) = 0;
        [WeakRetained dispatchHapticEvent];
      }
      else
      {
        if (v4) {
          sub_1746C(v3);
        }

        [WeakRetained stopHaptics];
      }
    }
  }
}

void sub_7E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_80B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_81B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8330(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_83FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_8410(uint64_t a1, int a2)
{
  BOOL v4 = +[NSMutableString stringWithCapacity:2 * a2];
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1;
    do
    {
      if (v5 == 2) {
        CFStringRef v6 = &stru_24F38;
      }
      else {
        CFStringRef v6 = @":";
      }
      id v7 = +[NSString stringWithFormat:@"%02x%@", *(unsigned __int8 *)(a1 + (v5 - 2)), v6];
      [v4 appendString:v7];

      --v5;
    }
    while (v5 > 1);
  }
  id v8 = +[NSString stringWithString:v4];
  int v9 = [v8 uppercaseString];

  return v9;
}

uint64_t sub_8518()
{
  if (qword_2B4E0 != -1) {
    dispatch_once(&qword_2B4E0, &stru_246F8);
  }
  return byte_2B4E8;
}

void sub_855C(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.GameController"];
  byte_2B4E8 = [v1 BOOLForKey:@"GCPartnersEnable"];
  unsigned __int8 v2 = sub_34C0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = byte_2B4E8;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v3, 8u);
  }
}

NSData *sub_863C()
{
  return +[NSData dataWithBytes:&unk_20200 length:37];
}

NSXPCInterface *sub_8654()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceClientInterface];
}

NSXPCInterface *sub_8668()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceServerInterface];
}

NSXPCInterface *sub_867C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCAdaptiveTriggersServiceClientInterface];
}

NSXPCInterface *sub_8690()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCAdaptiveTriggersServiceServerInterface];
}

void sub_86A4()
{
}

void sub_880C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8C5C(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v2 - 48));

  _Unwind_Resume(a1);
}

uint64_t sub_8C74(uint64_t a1)
{
  uint64_t result = _os_feature_enabled_impl();
  uint64_t v3 = *(void *)(a1 + 32);
  if ((result & 1) == 0
    || (uint64_t result = (uint64_t)[*(id *)(a1 + 32) isBluetoothClassic],
        uint64_t v3 = *(void *)(a1 + 32),
        (result & 1) != 0)
    || (uint64_t result = (uint64_t)[*(id *)(a1 + 32) isBluetoothLE], v3 = *(void *)(a1 + 32), (result & 1) != 0))
  {
    if (!v3) {
      return result;
    }
  }
  else if (*(_WORD *)(v3 + 708) != 5)
  {
    *(unsigned char *)(v3 + 704) = 1;
    BOOL v4 = *(void **)(a1 + 32);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_8DEC;
    v5[3] = &unk_24720;
    v5[4] = v4;
    return (uint64_t)[v4 setupUSBWithCompletion:v5];
  }
  [(id)v3 setLowPower:0];
  [(id)v3 refreshDeviceInfo];
  [(id)v3 refreshCalibrationData];

  return (uint64_t)[(id)v3 refreshLowPowerSetting];
}

id sub_8D98(id result)
{
  if (result)
  {
    id v1 = result;
    [result setLowPower:0];
    [v1 refreshDeviceInfo];
    [v1 refreshCalibrationData];
    return [v1 refreshLowPowerSetting];
  }
  return result;
}

id sub_8DEC(id result)
{
  id v1 = (void *)*((void *)result + 4);
  if (v1)
  {
    [*((id *)result + 4) setLowPower:0];
    [v1 refreshDeviceInfo];
    [v1 refreshCalibrationData];
    return [v1 refreshLowPowerSetting];
  }
  return result;
}

void sub_9024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);

  _Unwind_Resume(a1);
}

void sub_9180(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v2 - 48));

  _Unwind_Resume(a1);
}

void sub_919C(uint64_t a1)
{
}

void sub_91A4(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = *(id **)(a1 + 1048);
    if (v2)
    {
      uint64_t v3 = *(id *)(a1 + 1056);
      BOOL v4 = *(void **)(a1 + 1056);
      *(void *)(a1 + 1056) = 0;
      *(void *)(a1 + 1064) = 0;

      *(void *)(a1 + 1048) = 0;
      dispatch_source_cancel(v3);
      sub_14B70((uint64_t)v2);

      free(v2);
    }
    unint64_t v5 = *(id **)(a1 + 1024);
    if (v5)
    {
      do
      {
        CFStringRef v6 = (id *)*v5;
        sub_14B70((uint64_t)v5);

        free(v5);
        unint64_t v5 = v6;
      }
      while (v6);
    }
    *(void *)(a1 + 1024) = 0;
    *(void *)(a1 + 1032) = a1 + 1024;
  }
}

void sub_9280(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_9AB4(uint64_t a1)
{
  char v1 = a1 - 1;
  if (a1 - 1) < 0xC && ((0xF07u >> v1))
  {
    uint64_t v3 = *(&off_24B38 + v1);
  }
  else
  {
    uint64_t v2 = +[NSNumber numberWithUnsignedChar:a1];
    uint64_t v3 = [v2 description];
  }

  return v3;
}

void sub_9B38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_9B48(int a1)
{
  v7[0] = @"red";
  uint64_t v2 = +[NSNumber numberWithUnsignedChar:a1];
  v8[0] = v2;
  v7[1] = @"green";
  uint64_t v3 = +[NSNumber numberWithUnsignedChar:BYTE1(a1)];
  v8[1] = v3;
  v7[2] = @"blue";
  BOOL v4 = +[NSNumber numberWithUnsignedChar:BYTE2(a1)];
  v8[2] = v4;
  unint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

void sub_9C58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_9C88(uint64_t a1, unint64_t a2, int a3)
{
  v13[0] = @"x.last";
  unint64_t v5 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)a2];
  v14[0] = v5;
  v13[1] = @"y.last";
  CFStringRef v6 = +[NSNumber numberWithUnsignedShort:WORD1(a2)];
  v14[1] = v6;
  v13[2] = @"x.min";
  id v7 = +[NSNumber numberWithUnsignedShort:WORD2(a2)];
  v14[2] = v7;
  v13[3] = @"x.max";
  id v8 = +[NSNumber numberWithUnsignedShort:HIWORD(a2)];
  v14[3] = v8;
  v13[4] = @"y.min";
  int v9 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)a3];
  v14[4] = v9;
  v13[5] = @"y.max";
  uint64_t v10 = +[NSNumber numberWithUnsignedShort:HIWORD(a3)];
  v14[5] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];

  return v11;
}

void sub_9E28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_9E7C(uint64_t a1)
{
  if (a1 == 63)
  {
    char v1 = @"HID";
  }
  else if (a1 == 48)
  {
    char v1 = @"STANDARD-FULL";
  }
  else
  {
    uint64_t v2 = +[NSNumber numberWithUnsignedChar:a1];
    char v1 = [v2 description];
  }

  return v1;
}

void sub_9EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_A524(unint64_t a1, int a2)
{
  v21[0] = @"center";
  v19[0] = @"x";
  v14 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)a1];
  v19[1] = @"y";
  v20[0] = v14;
  BOOL v4 = +[NSNumber numberWithUnsignedShort:WORD1(a1)];
  v20[1] = v4;
  unint64_t v5 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
  v22[0] = v5;
  v21[1] = @"min";
  v17[0] = @"x";
  CFStringRef v6 = +[NSNumber numberWithUnsignedShort:WORD2(a1)];
  v17[1] = @"y";
  v18[0] = v6;
  id v7 = +[NSNumber numberWithUnsignedShort:HIWORD(a1)];
  v18[1] = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
  v22[1] = v8;
  v21[2] = @"max";
  v15[0] = @"x";
  int v9 = +[NSNumber numberWithUnsignedShort:(unsigned __int16)a2];
  v15[1] = @"y";
  v16[0] = v9;
  uint64_t v10 = +[NSNumber numberWithUnsignedShort:HIWORD(a2)];
  v16[1] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
  v22[2] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:3];

  return v12;
}

void sub_A738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

id sub_A7B4(unsigned __int16 *a1)
{
  v16[0] = @"unknown1";
  v15 = +[NSNumber numberWithUnsignedShort:a1[2]];
  v17[0] = v15;
  v16[1] = @"unknown2";
  v14 = +[NSNumber numberWithUnsignedShort:a1[3]];
  v17[1] = v14;
  void v16[2] = @"inner_dead_zone";
  v13 = +[NSNumber numberWithUnsignedShort:a1[4]];
  void v17[2] = v13;
  v16[3] = @"unknown4";
  uint64_t v2 = +[NSNumber numberWithUnsignedShort:a1[5]];
  v17[3] = v2;
  v16[4] = @"unknown5";
  uint64_t v3 = +[NSNumber numberWithUnsignedShort:a1[6]];
  v17[4] = v3;
  v16[5] = @"unknown6";
  BOOL v4 = +[NSNumber numberWithUnsignedShort:a1[7]];
  v17[5] = v4;
  v16[6] = @"unknown7";
  unint64_t v5 = +[NSNumber numberWithUnsignedShort:a1[8]];
  v17[6] = v5;
  v16[7] = @"unknown8";
  CFStringRef v6 = +[NSNumber numberWithUnsignedShort:a1[9]];
  v17[7] = v6;
  v16[8] = @"unknown9";
  id v7 = +[NSNumber numberWithUnsignedShort:a1[10]];
  v17[8] = v7;
  v16[9] = @"unknown10";
  id v8 = +[NSNumber numberWithUnsignedShort:a1[11]];
  v17[9] = v8;
  v16[10] = @"unknown11";
  int v9 = +[NSNumber numberWithUnsignedShort:a1[12]];
  v17[10] = v9;
  v16[11] = @"unknown12";
  uint64_t v10 = +[NSNumber numberWithUnsignedShort:a1[13]];
  v17[11] = v10;
  v11 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:12];

  return v11;
}

void sub_AA50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_AC74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B054(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B230(uint64_t a1)
{
}

void sub_B248(id a1, BOOL a2, NSError *a3)
{
  BOOL v4 = a3;
  if (!a2)
  {
    unint64_t v5 = sub_34C0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_174B0();
    }
  }
}

void sub_B2A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B2B4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    int v6 = HIBYTE(a2);
    int v7 = a2;
    int v8 = BYTE1(a2);
    int v9 = BYTE2(a2);
    char v10 = ((HIBYTE(a2) == 2) << 7) | (16 * (a2 == 2)) | (a2 == 1) | (8 * (HIBYTE(a2) == 1)) | ((BYTE2(a2) == 2) << 6) | (32 * (BYTE1(a2) == 2)) | (2 * (BYTE1(a2) == 1)) | (4 * (BYTE2(a2) == 1));
    char v19 = v10;
    v11 = sub_34C0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if (v7 == 1) {
        int v12 = 111;
      }
      else {
        int v12 = 45;
      }
      if (v7 == 2) {
        int v12 = 42;
      }
      if (v8 == 1) {
        int v13 = 111;
      }
      else {
        int v13 = 45;
      }
      if (v8 == 2) {
        int v13 = 42;
      }
      if (v9 == 1) {
        int v14 = 111;
      }
      else {
        int v14 = 45;
      }
      if (v9 == 2) {
        int v14 = 42;
      }
      *(_DWORD *)buf = 67109888;
      int v21 = v12;
      if (v6 == 1) {
        int v15 = 111;
      }
      else {
        int v15 = 45;
      }
      __int16 v22 = 1024;
      int v23 = v13;
      __int16 v24 = 1024;
      int v25 = v14;
      if (v10 < 0) {
        int v16 = 42;
      }
      else {
        int v16 = v15;
      }
      __int16 v26 = 1024;
      int v27 = v16;
      _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "Set Player Lights Request: %c%c%c%c", buf, 0x1Au);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    void v17[2] = sub_15C88;
    v17[3] = &unk_24AD8;
    id v18 = v5;
    sub_14CDC(a1, 0x30u, &v19, 1uLL, v17);
  }
}

void sub_B4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_B66C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B688(uint64_t a1)
{
}

void sub_B6A0(id a1, BOOL a2, NSError *a3)
{
  BOOL v4 = a3;
  if (!a2)
  {
    id v5 = sub_34C0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1751C();
    }
  }
}

void sub_B6FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B70C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    char v9 = a2;
    int v6 = sub_34C0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_17588();
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_15630;
    void v7[3] = &unk_24AD8;
    id v8 = v5;
    sub_14CDC(a1, 3u, &v9, 1uLL, v7);
  }
}

void sub_B7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_B9A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_B9C0(uint64_t a1)
{
}

void sub_B9D8(id a1, BOOL a2, NSError *a3)
{
  BOOL v4 = a3;
  if (!a2)
  {
    id v5 = sub_34C0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_175F0();
    }
  }
}

void sub_BA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BA44(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    char v9 = a2;
    int v6 = sub_34C0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1765C();
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_15774;
    void v7[3] = &unk_24AD8;
    id v8 = v5;
    sub_14CDC(a1, 8u, &v9, 1uLL, v7);
  }
}

void sub_BB24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_BCD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BCF0(uint64_t a1)
{
}

void sub_BD08(id a1, BOOL a2, NSError *a3)
{
  BOOL v4 = a3;
  if (!a2)
  {
    id v5 = sub_34C0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_176C4();
    }
  }
}

void sub_BD64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_BD74(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    char v9 = a2;
    int v6 = sub_34C0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_17730();
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_15DCC;
    void v7[3] = &unk_24AD8;
    id v8 = v5;
    sub_14CDC(a1, 0x40u, &v9, 1uLL, v7);
  }
}

void sub_BE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_BFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C008(uint64_t a1)
{
}

void sub_C020(id a1, BOOL a2, NSError *a3)
{
  BOOL v4 = a3;
  if (!a2)
  {
    id v5 = sub_34C0();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_17798();
    }
  }
}

void sub_C07C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C08C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    char v9 = a2;
    int v6 = sub_34C0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_17804();
    }

    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_15F10;
    void v7[3] = &unk_24AD8;
    id v8 = v5;
    sub_14CDC(a1, 0x48u, &v9, 1uLL, v7);
  }
}

void sub_C16C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_C32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  id v19 = va_arg(va1, id);

  objc_destroyWeak(v9);
  _Block_object_dispose(va, 8);

  _Block_object_dispose(va1, 8);
  objc_destroyWeak((id *)(v11 - 72));

  _Unwind_Resume(a1);
}

id sub_C370(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_C39C(uint64_t a1)
{
}

void sub_C3A4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_C478;
  v4[3] = &unk_24858;
  objc_copyWeak(&v6, v2);
  long long v5 = *(_OWORD *)(a1 + 32);
  sub_C644((uint64_t)WeakRetained, 20480, 1uLL, v4);

  objc_destroyWeak(&v6);
}

void sub_C460(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);

  _Unwind_Resume(a1);
}

void sub_C478(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
      if (*(unsigned char *)(v10 + 24))
      {
        *(unsigned char *)(v10 + 24) = 0;
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) + 16))();
      }
      else
      {
        id v19 = sub_34C0();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          [v6 localizedDescription];
          objc_claimAutoreleasedReturnValue();
          sub_1786C();
        }

        if ([v6 code] == (char *)&dword_C + 2 || objc_msgSend(v6, "code") == (char *)&dword_C + 1) {
          WeakRetained[175] |= 2u;
        }
      }
    }
    else
    {
      id v8 = v5;
      char v9 = [v8 bytes];
      if ([v8 length])
      {
        *((unsigned char *)WeakRetained + 963) = *v9;
      }
      else
      {
        uint64_t v11 = sub_34C0();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_178B0(v11, v12, v13, v14, v15, v16, v17, v18);
        }
      }
    }
  }
}

void sub_C608(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_C644(uint64_t a1, uint64_t a2, unint64_t a3, void *a4)
{
  id v7 = a4;
  if (a1)
  {
    if (a3 < 0x1E)
    {
      int v16 = a2;
      char v17 = a3;
      uint64_t v12 = sub_34C0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_17930(a3, a2, v12);
      }

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_158B8;
      v13[3] = &unk_24B00;
      id v14 = v7;
      int v15 = a2;
      sub_14CDC(a1, 0x10u, &v16, 5uLL, v13);
    }
    else
    {
      id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Requesting SPI flash read with length [%zd bytes] > MAX_READ_SIZE [%zd bytes].", a3, 29);
      id v9 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
      id v19 = v8;
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v11 = [v9 initWithDomain:@"JoyConErrorDomain" code:18 userInfo:v10];

      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v11);
    }
  }
}

void sub_C818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_CC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37)
{
  objc_destroyWeak(v45);
  _Block_object_dispose(&a15, 8);

  objc_destroyWeak(v42);
  _Block_object_dispose(&a27, 8);

  objc_destroyWeak(v40);
  _Block_object_dispose((const void *)(v46 - 216), 8);

  objc_destroyWeak(v38);
  objc_destroyWeak((id *)(v46 - 128));
  os_activity_scope_leave((os_activity_scope_state_t)(v46 - 120));

  _Unwind_Resume(a1);
}

void sub_CCB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[749])
  {
    WeakRetained[696] |= 2u;
    [WeakRetained ready];
  }
}

void sub_CD2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_CD40(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_CE2C;
  v6[3] = &unk_248D0;
  objc_copyWeak(&v8, v2);
  long long v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  long long v7 = v5;
  sub_D07C((uint64_t)WeakRetained, v6);

  objc_destroyWeak(&v8);
}

void sub_CE0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  objc_destroyWeak(v17);
  _Unwind_Resume(a1);
}

void sub_CE2C(uint64_t a1, unsigned __int16 *a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  long long v7 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[748] = 1;
    if (a2 && !v5)
    {
      *((_WORD *)WeakRetained + 368) = *a2;
      WeakRetained[738] = *((unsigned char *)a2 + 2);
      int v8 = *((_DWORD *)a2 + 1);
      *(_WORD *)(WeakRetained + 743) = a2[4];
      *(_DWORD *)(WeakRetained + 739) = v8;
      WeakRetained[745] = *((unsigned char *)a2 + 3);
      *((_WORD *)WeakRetained + 373) = a2[5];
      WeakRetained[749] = 1;
      id v9 = sub_34C0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v10 = *((unsigned __int8 *)a2 + 2) - 1;
        if (v10 < 0xC && ((0xF07u >> v10) & 1) != 0)
        {
          uint64_t v12 = *(&off_24B38 + (char)v10);
        }
        else
        {
          id v11 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:");
          uint64_t v12 = [v11 description];
        }
        int v13 = *a2;
        int v18 = 138543618;
        id v19 = v12;
        __int16 v20 = 1024;
        int v21 = v13;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Device is a '%{public}@' with f/w version %#x.", (uint8_t *)&v18, 0x12u);
      }
      uint64_t v14 = a1 + 32;
      goto LABEL_11;
    }
    int v15 = sub_34C0();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      [v5 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_179A8();
    }

    int v16 = [v5 localizedRecoverySuggestion];
    BOOL v17 = v16 == 0;

    if (!v17)
    {
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8) + 40;
LABEL_11:
      (*(void (**)(void))(*(void *)v14 + 16))();
    }
  }
}

void sub_D03C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D07C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = sub_34C0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_179EC();
    }

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1538C;
    v5[3] = &unk_24AD8;
    id v6 = v3;
    sub_14CDC(a1, 2u, 0, 0, v5);
  }
}

void sub_D150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_D170(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_D244;
  v4[3] = &unk_24920;
  objc_copyWeak(&v5, v2);
  void v4[4] = *(void *)(a1 + 32);
  sub_C644((uint64_t)WeakRetained, 24576, 0x10uLL, v4);

  objc_destroyWeak(&v5);
}

void sub_D22C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);

  _Unwind_Resume(a1);
}

void sub_D244(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 40));
  int v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained + 90;
    *((unsigned char *)WeakRetained + 728) = 1;
    if (!v5 || v6)
    {
      BOOL v17 = sub_34C0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        [v6 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_17A20();
      }

      int v18 = [v6 localizedRecoverySuggestion];
      BOOL v19 = v18 == 0;

      if (!v19) {
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
      }
    }
    else
    {
      id v10 = v5;
      id v11 = (char *)[v10 bytes];
      if ((unint64_t)[v10 length] <= 0xF)
      {
        __int16 v20 = sub_34C0();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_17A64();
        }
      }
      else if ((*v11 & 0x80000000) == 0)
      {
        uint64_t v12 = 0;
        unsigned int v13 = 0;
        v21[0] = 0;
        v21[1] = 0;
        char v22 = 0;
        do
        {
          int v14 = v11[v12];
          if (v14 >= 1) {
            *((unsigned char *)v21 + v13++) = v14;
          }
          ++v12;
        }
        while (v12 != 16);
        id v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v21, strnlen((const char *)v21, 0xFuLL), 1);
        int v16 = *v9;
        *id v9 = v15;
      }
    }
  }
}

void sub_D42C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_D46C(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_D540;
  v4[3] = &unk_24920;
  objc_copyWeak(&v5, v2);
  void v4[4] = *(void *)(a1 + 32);
  sub_C644((uint64_t)WeakRetained, 24656, 6uLL, v4);

  objc_destroyWeak(&v5);
}

void sub_D528(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);

  _Unwind_Resume(a1);
}

void sub_D540(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      id v10 = sub_34C0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        [v6 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_17AD4();
      }

      id v11 = [v6 localizedRecoverySuggestion];
      BOOL v12 = v11 == 0;

      if (!v12) {
        (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
      }
    }
    else
    {
      id v8 = v5;
      id v9 = (char *)[v8 bytes];
      if ((unint64_t)[v8 length] <= 5)
      {
        unsigned int v13 = sub_34C0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_17B18();
        }
      }
      else
      {
        WeakRetained[750] = *v9;
        *(_WORD *)(WeakRetained + 751) = *(_WORD *)(v9 + 1);
        WeakRetained[753] = v9[6];
        *((_WORD *)WeakRetained + 377) = *(_WORD *)(v9 + 7);
        WeakRetained[757] = 1;
      }
    }
  }
}

void sub_D6D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_DD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  objc_destroyWeak(v72);
  objc_destroyWeak(v71);

  objc_destroyWeak(v70);
  objc_destroyWeak(v68);
  _Block_object_dispose(&a60, 8);

  _Block_object_dispose((const void *)(v73 - 216), 8);
  objc_destroyWeak(v66);
  objc_destroyWeak((id *)(v73 - 144));

  _Unwind_Resume(a1);
}

void sub_DE7C(uint64_t a1)
{
  id WeakRetained = (float32x2_t *)objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (!WeakRetained
    || (~WeakRetained[98].u8[0] & 3) != 0
    || (~WeakRetained[108].u8[4] & 3) != 0
    || (~WeakRetained[112].u8[6] & 3) != 0
    || (WeakRetained[116].i8[6] & 1) == 0)
  {
    goto LABEL_6;
  }
  int v4 = WeakRetained[92].u8[2];
  if ((v4 - 1) >= 2)
  {
    if (v4 == 3)
    {
      WeakRetained[101].i32[1] = 81002511;
      WeakRetained[105].i32[0] = 81002511;
      unsigned int v5 = 15;
      int v6 = 1236;
    }
    else
    {
      unsigned int v5 = WeakRetained[101].u16[2];
      int v6 = WeakRetained[101].u16[3];
    }
  }
  else
  {
    WeakRetained[101].i32[1] = 55705615;
    WeakRetained[105].i32[0] = 55705615;
    unsigned int v5 = 15;
    int v6 = 850;
  }
  *(float *)&double v2 = (float)v5 / (float)(v6 - WeakRetained[102].u16[2]);
  [(float32x2_t *)WeakRetained setLeftThumbstickNoiseBuffer:v2];
  long long v7 = (_WORD *)&v3[105] + 1;
  LOWORD(v8) = v3[105].i16[0];
  *(float *)&double v9 = (float)v8 / (float)(v3[105].u16[1] - v3[106].u16[0]);
  [(float32x2_t *)v3 setRightThumbstickNoiseBuffer:v9];
  float32_t v10 = (float)(1.0 / (float)(v3[110].i16[1] - v3[109].i16[2])) * 4.0;
  v11.i32[0] = v3[109].i16[3];
  v11.i32[1] = v3[110].i16[0];
  v12.i32[0] = v3[109].i16[0];
  v12.i32[1] = v3[109].i16[1];
  float32x2_t v13 = vcvt_f32_s32(vsub_s32(v11, v12));
  __asm { FMOV            V2.2S, #1.0 }
  float32x2_t v19 = vdiv_f32(_D2, v13);
  __asm { FMOV            V2.2S, #4.0 }
  v3[117] = vmul_f32(v19, _D2);
  v19.f32[0] = 816.0 / (float)(v3[112].i16[0] - v3[111].i16[1]);
  float32_t v21 = 816.0 / (float)(v3[112].i16[1] - v3[111].i16[2]);
  _D2.f32[0] = 816.0 / (float)(v3[112].i16[2] - v3[111].i16[3]);
  v3[118].f32[0] = v10;
  v3[118].i32[1] = v19.i32[0];
  v3[119].f32[0] = v21;
  v3[119].f32[1] = _D2.f32[0];
  int v22 = v3[92].u8[2];
  switch(v22)
  {
    case 1:
      int v40 = v3[96].u16[0] - v3[95].u16[2];
      if (v40 < 0) {
        int v40 = v3[95].u16[2] - v3[96].u16[0];
      }
      if (v40 <= 1)
      {
        int v41 = v3[96].u16[1] - v3[95].u16[3];
        if (v41 < 0) {
          int v41 = v3[95].u16[3] - v3[96].u16[1];
        }
        if (v41 <= 1)
        {
          v3[87].i32[1] |= 4u;
          v42 = sub_34C0();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v50 = 0;
            _os_log_impl(&dword_0, v42, OS_LOG_TYPE_DEFAULT, "#Quirks: Suspiciously good left stick factory calibration data.", v50, 2u);
          }

          unsigned int v43 = v3[96].u16[0];
          if (v43 >= v3[96].u16[1]) {
            LOWORD(v43) = v3[96].i16[1];
          }
          v3[101].i16[3] = v43;
        }
      }
      if ((v3[101].i8[2] & 4) != 0)
      {
        int v27 = (unsigned __int16 *)&v3[99] + 1;
        int v44 = v3[99].u16[1] - v3[98].u16[3];
        if (v44 < 0) {
          int v44 = v3[98].u16[3] - v3[99].u16[1];
        }
        if (v44 <= 1)
        {
          int v45 = v3[99].u16[2] - v3[99].u16[0];
          if (v45 < 0) {
            int v45 = v3[99].u16[0] - v3[99].u16[2];
          }
          if (v45 <= 1)
          {
            v3[87].i32[1] |= 8u;
            v31 = sub_34C0();
            long long v7 = (_WORD *)&v3[101] + 3;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v49 = 0;
              _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "#Quirks: Suspiciously good left stick user calibration data.", v49, 2u);
            }
            v29 = (float32x2_t *)((char *)v3 + 796);
            goto LABEL_76;
          }
        }
      }
      break;
    case 2:
      int v34 = v3[97].u16[2] - v3[97].u16[0];
      if (v34 < 0) {
        int v34 = v3[97].u16[0] - v3[97].u16[2];
      }
      if (v34 <= 1)
      {
        int v35 = v3[97].u16[3] - v3[97].u16[1];
        if (v35 < 0) {
          int v35 = v3[97].u16[1] - v3[97].u16[3];
        }
        if (v35 <= 1)
        {
          v3[87].i32[1] |= 4u;
          v36 = sub_34C0();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v48 = 0;
            _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "#Quirks: Suspiciously good right stick factory calibration data.", v48, 2u);
          }

          unsigned int v37 = v3[97].u16[2];
          if (v37 >= v3[97].u16[3]) {
            LOWORD(v37) = v3[97].i16[3];
          }
          v3[105].i16[1] = v37;
        }
      }
      if ((v3[101].i8[2] & 8) != 0)
      {
        int v27 = (unsigned __int16 *)&v3[100] + 3;
        int v38 = v3[100].u16[3] - v3[100].u16[1];
        if (v38 < 0) {
          int v38 = v3[100].u16[1] - v3[100].u16[3];
        }
        if (v38 <= 1)
        {
          v29 = v3 + 101;
          int v39 = v3[101].u16[0] - v3[100].u16[2];
          if (v39 < 0) {
            int v39 = v3[100].u16[2] - v3[101].u16[0];
          }
          if (v39 <= 1)
          {
            v3[87].i32[1] |= 8u;
            v31 = sub_34C0();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v47 = 0;
              v32 = "#Quirks: Suspiciously good right stick user calibration data.";
              v33 = (uint8_t *)&v47;
              goto LABEL_54;
            }
LABEL_76:

            unsigned int v46 = *v27;
            if (v46 >= v29->u16[0]) {
              LOWORD(v46) = v29->i16[0];
            }
            *long long v7 = v46;
          }
        }
      }
      break;
    case 3:
      int v23 = v3[96].u16[0] - v3[95].u16[2];
      if (v23 < 0) {
        int v23 = v3[95].u16[2] - v3[96].u16[0];
      }
      if (v23 <= 1)
      {
        int v24 = v3[96].u16[1] - v3[95].u16[3];
        if (v24 < 0) {
          int v24 = v3[95].u16[3] - v3[96].u16[1];
        }
        if (v24 <= 1)
        {
          v3[87].i32[1] |= 4u;
          int v25 = sub_34C0();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "#Quirks: Suspiciously good left stick factory calibration data.", buf, 2u);
          }

          unsigned int v26 = v3[96].u16[0];
          if (v26 >= v3[96].u16[1]) {
            LOWORD(v26) = v3[96].i16[1];
          }
          v3[101].i16[3] = v26;
        }
      }
      int v27 = (unsigned __int16 *)&v3[97] + 2;
      int v28 = v3[97].u16[2] - v3[97].u16[0];
      if (v28 < 0) {
        int v28 = v3[97].u16[0] - v3[97].u16[2];
      }
      if (v28 <= 1)
      {
        v29 = (float32x2_t *)((char *)v3 + 782);
        int v30 = v3[97].u16[3] - v3[97].u16[1];
        if (v30 < 0) {
          int v30 = v3[97].u16[1] - v3[97].u16[3];
        }
        if (v30 <= 1)
        {
          v3[87].i32[1] |= 4u;
          v31 = sub_34C0();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v51 = 0;
            v32 = "#Quirks: Suspiciously good right stick factory calibration data.";
            v33 = (uint8_t *)&v51;
LABEL_54:
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, v32, v33, 2u);
            goto LABEL_76;
          }
          goto LABEL_76;
        }
      }
      break;
  }
LABEL_6:
}

void sub_E40C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E434(uint64_t a1)
{
  double v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_E530;
  v6[3] = &unk_24970;
  objc_copyWeak(&v9, v2);
  uint64_t v8 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  long long v7 = v5;
  sub_C644((uint64_t)WeakRetained, 24637, 0x12uLL, v6);

  objc_destroyWeak(&v9);
}

void sub_E510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_E530(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      int v22 = sub_34C0();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        [v6 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_17B80();
      }

      int v23 = [v6 localizedRecoverySuggestion];
      if (v23)
      {
        BOOL v24 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0;

        if (v24)
        {
          --*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
        }
      }
    }
    else
    {
      id v8 = v5;
      id v9 = (unsigned __int16 *)[v8 bytes];
      if ((unint64_t)[v8 length] <= 0x11)
      {
        int v25 = sub_34C0();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_17BC4();
        }
      }
      else
      {
        int v10 = *v9;
        unsigned int v11 = v10 | (*((unsigned __int8 *)v9 + 2) << 16);
        int v12 = *(unsigned __int16 *)((char *)v9 + 3);
        unsigned int v13 = v12 | (*((unsigned __int8 *)v9 + 5) << 16);
        int v14 = v9[3];
        unsigned int v15 = v14 | (*((unsigned __int8 *)v9 + 8) << 16);
        WeakRetained[380] = v12 & 0xFFF;
        WeakRetained[381] = v13 >> 12;
        WeakRetained[382] = v14 & 0xFFF;
        WeakRetained[383] = v15 >> 12;
        WeakRetained[384] = v10 & 0xFFF;
        WeakRetained[385] = v11 >> 12;
        LOBYTE(v11) = *((unsigned char *)WeakRetained + 784);
        *((unsigned char *)WeakRetained + 784) = v11 | 1;
        int v16 = *(unsigned __int16 *)((char *)v9 + 9);
        unsigned int v17 = v16 | (*((unsigned __int8 *)v9 + 11) << 16);
        int v18 = v9[6];
        unsigned int v19 = v18 | (*((unsigned __int8 *)v9 + 14) << 16);
        int v20 = *(unsigned __int16 *)((char *)v9 + 15);
        unsigned int v21 = v20 | (*((unsigned __int8 *)v9 + 17) << 16);
        WeakRetained[386] = v16 & 0xFFF;
        WeakRetained[387] = v17 >> 12;
        WeakRetained[388] = v18 & 0xFFF;
        WeakRetained[389] = v19 >> 12;
        WeakRetained[390] = v20 & 0xFFF;
        WeakRetained[391] = v21 >> 12;
        *((unsigned char *)WeakRetained + 784) = v11 | 3;
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
}

void sub_E788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_E7C8(uint64_t a1)
{
  double v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_E8C4;
  v6[3] = &unk_24970;
  objc_copyWeak(&v9, v2);
  uint64_t v8 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  long long v7 = v5;
  sub_C644((uint64_t)WeakRetained, 32784, 0x16uLL, v6);

  objc_destroyWeak(&v9);
}

void sub_E8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_E8C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      int v22 = sub_34C0();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        [v6 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_17C2C();
      }

      int v23 = [v6 localizedRecoverySuggestion];
      if (v23)
      {
        BOOL v24 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0;

        if (v24)
        {
          --*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
        }
      }
    }
    else
    {
      id v8 = v5;
      id v9 = (unsigned __int16 *)[v8 bytes];
      if ((unint64_t)[v8 length] <= 0x15)
      {
        int v25 = sub_34C0();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          sub_17C70();
        }
      }
      else
      {
        int v10 = v9[1];
        unsigned int v11 = v10 | (*((unsigned __int8 *)v9 + 4) << 16);
        int v12 = *(unsigned __int16 *)((char *)v9 + 5);
        unsigned int v13 = v12 | (*((unsigned __int8 *)v9 + 7) << 16);
        int v14 = v9[4];
        unsigned int v15 = v14 | (*((unsigned __int8 *)v9 + 10) << 16);
        WeakRetained[393] = v12 & 0xFFF;
        WeakRetained[394] = v13 >> 12;
        WeakRetained[395] = v14 & 0xFFF;
        WeakRetained[396] = v15 >> 12;
        WeakRetained[397] = v10 & 0xFFF;
        WeakRetained[398] = v11 >> 12;
        LOBYTE(v11) = *((unsigned char *)WeakRetained + 810) | 1;
        *((unsigned char *)WeakRetained + 810) = v11;
        LOBYTE(v11) = v11 & 0xFB | (4 * (*v9 == 41394));
        *((unsigned char *)WeakRetained + 810) = v11;
        int v16 = *(unsigned __int16 *)((char *)v9 + 13);
        unsigned int v17 = v16 | (*((unsigned __int8 *)v9 + 15) << 16);
        int v18 = v9[8];
        unsigned int v19 = v18 | (*((unsigned __int8 *)v9 + 18) << 16);
        int v20 = *(unsigned __int16 *)((char *)v9 + 19);
        unsigned int v21 = v20 | (*((unsigned __int8 *)v9 + 21) << 16);
        WeakRetained[399] = v16 & 0xFFF;
        WeakRetained[400] = v17 >> 12;
        WeakRetained[401] = v18 & 0xFFF;
        WeakRetained[402] = v19 >> 12;
        WeakRetained[403] = v20 & 0xFFF;
        WeakRetained[404] = v21 >> 12;
        LOBYTE(v11) = v11 | 2;
        *((unsigned char *)WeakRetained + 810) = v11;
        *((unsigned char *)WeakRetained + 810) = v11 & 0xF7 | (8 * (*(unsigned __int16 *)((char *)v9 + 11) == 41394));
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
}

void sub_EB4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EB8C(uint64_t a1)
{
  double v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_EC88;
  v6[3] = &unk_24970;
  objc_copyWeak(&v9, v2);
  uint64_t v8 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  long long v7 = v5;
  sub_C644((uint64_t)WeakRetained, 24710, 0x12uLL, v6);

  objc_destroyWeak(&v9);
}

void sub_EC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_EC88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      int v10 = sub_34C0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        [v6 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_17CE0();
      }

      unsigned int v11 = [v6 localizedRecoverySuggestion];
      if (v11)
      {
        BOOL v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0;

        if (v12)
        {
          --*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
        }
      }
    }
    else
    {
      id v8 = v5;
      id v9 = [v8 bytes];
      if ((unint64_t)[v8 length] <= 0x11)
      {
        unsigned int v13 = sub_34C0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_17D24();
        }
      }
      else
      {
        WeakRetained[408] = *v9 & 0xFFF;
        WeakRetained[409] = (*(_DWORD *)v9 >> 12) & 0xFFF;
        WeakRetained[410] = *(_WORD *)((char *)v9 + 3) & 0xFFF;
        WeakRetained[411] = (*(void *)v9 >> 36) & 0xFFF;
        WeakRetained[412] = v9[3] & 0xFFF;
        WeakRetained[413] = ((*(void *)v9 >> 60) | (16 * v9[4])) & 0xFFF;
        WeakRetained[414] = *(_WORD *)((char *)v9 + 9) & 0xFFF;
        WeakRetained[415] = *((_DWORD *)v9 + 2) >> 20;
        WeakRetained[416] = v9[6] & 0xFFF;
        WeakRetained[417] = (*((void *)v9 + 1) >> 44) & 0xFFF;
        WeakRetained[418] = *(_WORD *)((char *)v9 + 15) & 0xFFF;
        WeakRetained[419] = v9[8] >> 4;
        *((unsigned char *)WeakRetained + 868) |= 1u;
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
}

void sub_EECC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_EF0C(uint64_t a1)
{
  double v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_F008;
  v6[3] = &unk_24970;
  objc_copyWeak(&v9, v2);
  uint64_t v8 = *(void *)(a1 + 48);
  long long v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  long long v7 = v5;
  sub_C644((uint64_t)WeakRetained, 24728, 0x12uLL, v6);

  objc_destroyWeak(&v9);
}

void sub_EFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  objc_destroyWeak(v16);
  _Unwind_Resume(a1);
}

void sub_F008(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (!v5 || v6)
    {
      int v10 = sub_34C0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        [v6 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_17D8C();
      }

      unsigned int v11 = [v6 localizedRecoverySuggestion];
      if (v11)
      {
        BOOL v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) > 0;

        if (v12)
        {
          --*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
        }
      }
    }
    else
    {
      id v8 = v5;
      id v9 = [v8 bytes];
      if ((unint64_t)[v8 length] <= 0x11)
      {
        unsigned int v13 = sub_34C0();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_17DD0();
        }
      }
      else
      {
        WeakRetained[422] = *v9 & 0xFFF;
        WeakRetained[423] = (*(_DWORD *)v9 >> 12) & 0xFFF;
        WeakRetained[424] = *(_WORD *)((char *)v9 + 3) & 0xFFF;
        WeakRetained[425] = (*(void *)v9 >> 36) & 0xFFF;
        WeakRetained[426] = v9[3] & 0xFFF;
        WeakRetained[427] = ((*(void *)v9 >> 60) | (16 * v9[4])) & 0xFFF;
        WeakRetained[428] = *(_WORD *)((char *)v9 + 9) & 0xFFF;
        WeakRetained[429] = *((_DWORD *)v9 + 2) >> 20;
        WeakRetained[430] = v9[6] & 0xFFF;
        WeakRetained[431] = (*((void *)v9 + 1) >> 44) & 0xFFF;
        WeakRetained[432] = *(_WORD *)((char *)v9 + 15) & 0xFFF;
        WeakRetained[433] = v9[8] >> 4;
        *((unsigned char *)WeakRetained + 868) |= 2u;
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
  }
}

void sub_F24C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F28C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      id v8 = v5;
      id v9 = (char *)[v8 bytes];
      if ((unint64_t)[v8 length] > 0x17)
      {
        *((void *)WeakRetained + 109) = *(void *)v9;
        *((_DWORD *)WeakRetained + 220) = *((_DWORD *)v9 + 2);
        *(void *)(WeakRetained + 890) = *(void *)(v9 + 12);
        *(_DWORD *)(WeakRetained + 898) = *((_DWORD *)v9 + 5);
        WeakRetained[902] |= 1u;
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        goto LABEL_8;
      }
      int v10 = sub_34C0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_17EA4();
      }
    }
    else
    {
      int v10 = sub_34C0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_17E38();
      }
    }
  }
LABEL_8:
}

void sub_F3B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F3E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      id v8 = v5;
      id v9 = (unsigned __int16 *)[v8 bytes];
      if ((unint64_t)[v8 length] > 0x19)
      {
        *((void *)WeakRetained + 113) = *(void *)(v9 + 1);
        *((_DWORD *)WeakRetained + 228) = *(_DWORD *)(v9 + 5);
        *(void *)(WeakRetained + 922) = *(void *)(v9 + 7);
        *(_DWORD *)(WeakRetained + 930) = *(_DWORD *)(v9 + 11);
        char v10 = WeakRetained[934] | 1;
        WeakRetained[934] = v10;
        WeakRetained[934] = v10 & 0xFD | (2 * (*v9 == 41394));
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        goto LABEL_8;
      }
      unsigned int v11 = sub_34C0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_17F14();
      }
    }
    else
    {
      unsigned int v11 = sub_34C0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_17E38();
      }
    }
  }
LABEL_8:
}

void sub_F528(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F550(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      id v8 = v5;
      id v9 = (char *)[v8 bytes];
      if ((unint64_t)[v8 length] > 5)
      {
        *((_WORD *)WeakRetained + 442) = *(_WORD *)v9;
        *(_DWORD *)(WeakRetained + 886) = *(_DWORD *)(v9 + 2);
        WeakRetained[902] |= 2u;
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        goto LABEL_8;
      }
      char v10 = sub_34C0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_17F84();
      }
    }
    else
    {
      char v10 = sub_34C0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_17E38();
      }
    }
  }
LABEL_8:
}

void sub_F66C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F91C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  int v34 = v32;

  objc_destroyWeak(v31);
  _Block_object_dispose(&a17, 8);

  objc_destroyWeak(v28);
  _Block_object_dispose((const void *)(v33 - 152), 8);

  objc_destroyWeak((id *)(v33 - 104));
  os_activity_scope_leave((os_activity_scope_state_t)(v33 - 96));

  _Unwind_Resume(a1);
}

void sub_F99C(uint64_t a1)
{
  double v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_FA88;
  v6[3] = &unk_249E8;
  objc_copyWeak(&v8, v2);
  long long v5 = *(_OWORD *)(a1 + 32);
  id v4 = (id)v5;
  long long v7 = v5;
  sub_FBB0(WeakRetained, v6);

  objc_destroyWeak(&v8);
}

void sub_FA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  objc_destroyWeak(v17);
  _Unwind_Resume(a1);
}

void sub_FA88(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (!v5 && (a2 & 1) != 0) {
      goto LABEL_4;
    }
    id v8 = sub_34C0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      [v5 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_17FEC();
    }

    id v9 = [v5 localizedRecoverySuggestion];
    BOOL v10 = v9 == 0;

    if (v10) {
LABEL_4:
    }
      uint64_t v7 = a1 + 32;
    else {
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8) + 40;
    }
    (*(void (**)(void))(*(void *)v7 + 16))();
  }
}

void sub_FB84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FBB0(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = sub_34C0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_18030();
    }

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_144CC;
    v5[3] = &unk_24AD8;
    id v6 = v3;
    [a1 enqueueProprietaryCommand:4 expectsResponse:0 data:0 length:0 replyHandler:v5];
  }
}

void sub_FC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_FCA8(uint64_t a1)
{
  double v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_FDAC;
  v4[3] = &unk_24A10;
  objc_copyWeak(&v8, v2);
  uint64_t v7 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  sub_FEDC(WeakRetained, v4);

  objc_destroyWeak(&v8);
}

void sub_FD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  objc_destroyWeak(v15);
  _Unwind_Resume(a1);
}

void sub_FDAC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    if (v5 || (a2 & 1) == 0)
    {
      id v8 = sub_34C0();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        [v5 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_18064();
      }

      id v9 = [v5 localizedRecoverySuggestion];
      BOOL v10 = v9 == 0;

      if (v10) {
        uint64_t v7 = a1 + 32;
      }
      else {
        uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8) + 40;
      }
    }
    else
    {
      uint64_t v7 = a1 + 40;
    }
    (*(void (**)(void))(*(void *)v7 + 16))();
  }
}

void sub_FEB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FEDC(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = sub_34C0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_180A8();
    }

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1414C;
    v5[3] = &unk_24AD8;
    id v6 = v3;
    [a1 enqueueProprietaryCommand:2 expectsResponse:1 data:0 length:0 replyHandler:v5];
  }
}

void sub_FFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v15);

  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v12 = WeakRetained;
  if (WeakRetained)
  {
    sub_5C30((uint64_t)WeakRetained);
    kdebug_trace();
    v12[136] = a3;
    if (a5 > 62)
    {
      if (a5 == 63)
      {
        [v12 handleHIDControllerPayload:63 withData:v10 timestamp:a3];
        goto LABEL_14;
      }
      if (a5 == 129)
      {
        sub_10664((uint64_t)v12, 129, v10);
        goto LABEL_14;
      }
    }
    else
    {
      if (a5 == 33)
      {
        sub_102BC((uint64_t)v12, 33, v10);
        goto LABEL_14;
      }
      if (a5 == 48)
      {
        [v12 handleStandardFullPayload:48 withData:v10 timestamp:a3];
        goto LABEL_14;
      }
    }
    unsigned int v13 = sub_34C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134218755;
      uint64_t v15 = a4;
      __int16 v16 = 2048;
      uint64_t v17 = a5;
      __int16 v18 = 1040;
      unsigned int v19 = [v10 length];
      __int16 v20 = 2097;
      id v21 = [v10 bytes];
      _os_log_debug_impl(&dword_0, v13, OS_LOG_TYPE_DEBUG, "Received unknown report: type = %li, reportID = %#lx, bytes = %{private}.*P", (uint8_t *)&v14, 0x26u);
    }
  }
LABEL_14:
}

void sub_10290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_102BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = _os_activity_create(&dword_0, "Sub-command Reply", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &state);
    id v7 = v5;
    id v8 = (unsigned __int8 *)[v7 bytes];
    id v9 = (char *)[v7 length];
    if ((unint64_t)v9 <= 0xE)
    {
      BOOL v12 = sub_34C0();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 134218496;
      *(void *)int v28 = a2;
      *(_WORD *)&v28[8] = 2048;
      v29 = v9;
      __int16 v30 = 2048;
      uint64_t v31 = 8;
      uint64_t v17 = "Payload for input report [%#zx] has length [%{bytes}zu], which is less than the minimum expected length [%{b"
            "ytes}zu]. Ignoring.";
      __int16 v18 = v12;
      uint32_t v19 = 32;
    }
    else
    {
      sub_12224((void *)a1, (uint64_t)(v8 + 1));
      id v10 = sub_34C0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_180DC();
      }

      uint64_t v11 = *(void *)(a1 + 1048);
      if (v11)
      {
        BOOL v12 = *(id *)(a1 + 1056);
        unsigned int v13 = *(void **)(a1 + 1056);
        *(void *)(a1 + 1056) = 0;
        *(void *)(a1 + 1064) = 0;

        *(void *)(a1 + 1048) = 0;
        dispatch_source_cancel(v12);
        int v14 = objc_msgSend(v7, "subdataWithRange:", 15, v9 - 15);
        if (sub_1237C(v11, v15, (uint64_t)v8, v14))
        {
          sub_12674(a1);
        }
        else
        {
          __int16 v20 = sub_34C0();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = v8[14];
            int v22 = *(unsigned __int8 *)(v11 + 42);
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)int v28 = v21;
            *(_WORD *)&v28[4] = 1024;
            *(_DWORD *)&v28[6] = v22;
            _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Received a reply for sub-command [%#x].  Expected reply for [%#x].", buf, 0xEu);
          }

          dispatch_time_t v23 = dispatch_time(0, 1000000000);
          BOOL v24 = [(id)a1 dispatchQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_128C4;
          block[3] = &unk_24720;
          block[4] = a1;
          dispatch_after(v23, v24, block);
        }
        free((void *)v11);

        goto LABEL_12;
      }
      BOOL v12 = sub_34C0();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        os_activity_scope_leave(&state);
        goto LABEL_13;
      }
      int v16 = v8[14];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)int v28 = v16;
      uint64_t v17 = "Received an unexpected reply for sub-command [%#x].";
      __int16 v18 = v12;
      uint32_t v19 = 8;
    }
    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    goto LABEL_12;
  }
LABEL_13:
}

void sub_10610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_10664(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = _os_activity_create(&dword_0, "Proprietary Ack", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &state);
    id v7 = v5;
    id v8 = [v7 bytes];
    id v9 = (char *)[v7 length];
    if ((unint64_t)v9 <= 1)
    {
      BOOL v12 = sub_34C0();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      *(_DWORD *)buf = 134218496;
      *(void *)uint64_t v31 = a2;
      *(_WORD *)&v31[8] = 2048;
      v32 = v9;
      __int16 v33 = 2048;
      uint64_t v34 = 8;
      __int16 v18 = "Payload for input report [%#zx] has length [%{bytes}zu], which is less than the minimum expected length [%{b"
            "ytes}zu]. Ignoring.";
      uint32_t v19 = v12;
      uint32_t v20 = 32;
    }
    else
    {
      id v10 = sub_34C0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_18168();
      }

      uint64_t v11 = *(void *)(a1 + 1000);
      if (v11)
      {
        BOOL v12 = *(id *)(a1 + 1008);
        unsigned int v13 = *(void **)(a1 + 1008);
        *(void *)(a1 + 1008) = 0;
        *(void *)(a1 + 1016) = 0;

        *(void *)(a1 + 1000) = 0;
        dispatch_source_cancel(v12);
        int v14 = objc_msgSend(v7, "subdataWithRange:", 2, v9 - 2);
        uint64_t v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = +[NSData data];
        }
        int v21 = v16;

        if (sub_128CC(v11, v22, (uint64_t)v8, v21))
        {
          sub_12AD8(a1);
        }
        else
        {
          dispatch_time_t v23 = sub_34C0();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            int v24 = v8[1];
            int v25 = *(unsigned __int8 *)(v11 + 41);
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)uint64_t v31 = v24;
            *(_WORD *)&v31[4] = 1024;
            *(_DWORD *)&v31[6] = v25;
            _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "Received an ack for proprietary command [%#x].  Expected reply for [%#x].", buf, 0xEu);
          }

          dispatch_time_t v26 = dispatch_time(0, 1000000000);
          int v27 = [(id)a1 dispatchQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_12D2C;
          block[3] = &unk_24720;
          block[4] = a1;
          dispatch_after(v26, v27, block);
        }
        free((void *)v11);

        goto LABEL_16;
      }
      if (v8[1] == 1)
      {
LABEL_17:
        os_activity_scope_leave(&state);

        goto LABEL_18;
      }
      BOOL v12 = sub_34C0();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        goto LABEL_17;
      }
      int v17 = v8[1];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)uint64_t v31 = v17;
      __int16 v18 = "Received an unexpected ack for proprietary command [%#x].";
      uint32_t v19 = v12;
      uint32_t v20 = 8;
    }
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    goto LABEL_16;
  }
LABEL_18:
}

void sub_109DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_11148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_111D0(void *a1, unsigned __int16 *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = v5;
  int32x2_t v7 = vdup_n_s32(a2[1] & 0xF);
  __asm { FMOV            V10.2S, #1.0 }
  int8x8_t v13 = vand_s8((int8x8_t)vceq_s32(v7, (int32x2_t)0x300000007), _D10);
  if ((a2[1] & 0xE) != 0) {
    float v14 = *(float *)v13.i32;
  }
  else {
    float v14 = 1.0;
  }
  if ((a2[1] & 0xE) == 4) {
    float v15 = 1.0;
  }
  else {
    float v15 = *(float *)&v13.i32[1];
  }
  unsigned int v16 = *a2;
  int v17 = v5[738];
  float v18 = 0.0;
  if (v17 == 1)
  {
    int8x8_t v22 = v13;
    [v5 dispatchMenuButtonEventWithValue:(v16 >> 8) & 1 timestamp:a3];
    [v6 homeButtonPressed:(*a2 >> 13) & 1];
    float v21 = (float)((v16 >> 10) & 1);
    float v20 = (float)(v16 >> 15);
    float v19 = (float)((v16 >> 14) & 1);
  }
  else
  {
    if (v17 != 2)
    {
      float v19 = 0.0;
      float v20 = 0.0;
      float v21 = 0.0;
      goto LABEL_13;
    }
    int8x8_t v22 = v13;
    [v5 dispatchMenuButtonEventWithValue:(v16 >> 9) & 1 timestamp:a3];
    [v6 homeButtonPressed:(*a2 >> 12) & 1];
    float v18 = (float)((v16 >> 10) & 1);
    float v19 = (float)(v16 >> 15);
    float v20 = (float)((v16 >> 14) & 1);
    float v21 = 0.0;
  }
  int8x8_t v13 = v22;
LABEL_13:
  uint64_t v23 = 0;
  float v24 = v14;
  float v25 = v15;
  int8x8_t v26 = vbsl_s8((int8x8_t)vcgt_u32((uint32x2_t)0x200000002, (uint32x2_t)(*(void *)&vadd_s32(v7, (int32x2_t)0xFF000000FBLL) & 0xFFFFFEFFFFFFFEFFLL)), _D10, v13);
  float v27 = (float)(v16 & 1);
  float32x4_t v28 = vcvtq_f32_u32(vmovl_u16((uint16x4_t)(*(void *)&vshl_u16((uint16x4_t)(*(void *)&vdup_n_s16(v16) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFFFFFELL) & 0xFF01FF01FF01FF01)));
  float v29 = (float)((v16 >> 5) & 1);
  long long v30 = 0u;
  long long v31 = 0u;
  float v32 = v19;
  float v33 = v20;
  float v34 = v21;
  float v35 = v18;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v42 = 0;
  [v6 dispatchGameControllerExtendedEventWithState:&v23 timestamp:a3];
}

void sub_113C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12224(void *a1, uint64_t a2)
{
  id v3 = a1;
  id v9 = v3;
  if (v3[960])
  {
    unsigned int v4 = *(unsigned __int8 *)(a2 + 1);
    if (v3[961] == ((v4 >> 4) & 1) && v3[962] == v4 >> 5) {
      goto LABEL_13;
    }
  }
  else
  {
    unsigned int v4 = *(unsigned __int8 *)(a2 + 1);
  }
  v3[962] = v4 >> 5;
  v3[961] = (*(unsigned char *)(a2 + 1) & 0x10) != 0;
  v3[960] = 1;
  char v5 = v3[961];
  *((unsigned char *)[v3 batteryReport] + 2) = v5;
  id v6 = v9;
  switch(v9[962])
  {
    case 1:
      int32x2_t v7 = (char *)[v9 batteryReport];
      char v8 = 10;
      goto LABEL_11;
    case 2:
      int32x2_t v7 = (char *)[v9 batteryReport];
      char v8 = 30;
      goto LABEL_11;
    case 3:
      int32x2_t v7 = (char *)[v9 batteryReport];
      char v8 = 60;
      goto LABEL_11;
    case 4:
      int32x2_t v7 = (char *)[v9 batteryReport];
      char v8 = 100;
LABEL_11:
      *int32x2_t v7 = v8;
      id v6 = v9;
      break;
    default:
      break;
  }
  [v6 sendBatteryReport];
LABEL_13:
}

void sub_12358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

BOOL sub_1237C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = *(id *)(a1 + 16);
  voucher_adopt();
  int v8 = *(unsigned __int8 *)(a3 + 14);
  int v9 = *(unsigned __int8 *)(a1 + 42);
  if (v8 != v9)
  {
    id v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Received reply for a different sub-command [%#x].", *(unsigned __int8 *)(a3 + 14));
    id v17 = objc_alloc((Class)NSError);
    v27[0] = NSLocalizedDescriptionKey;
    v27[1] = NSLocalizedRecoverySuggestionErrorKey;
    v28[0] = v16;
    v28[1] = @"Try again.";
    float v18 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    id v11 = [v17 initWithDomain:@"JoyConErrorDomain" code:15 userInfo:v18];

    uint64_t v20 = *(void *)(a1 + 8);
    int8x8_t v13 = (void **)(a1 + 8);
    uint64_t v19 = v20;
    if (v20)
    {
      (*(void (**)(uint64_t, void, id))(v19 + 16))(v19, 0, v11);
      goto LABEL_8;
    }
LABEL_11:
    float v15 = 0;
    goto LABEL_12;
  }
  if (*(char *)(a3 + 13) < 0)
  {
    id v10 = sub_34C0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_18328();
    }
    id v11 = 0;
  }
  else
  {
    int8x8_t v22 = sub_34C0();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_182BC();
    }

    id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Device rejected sub-command."];
    id v23 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
    int8x8_t v26 = v10;
    float v24 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    id v11 = [v23 initWithDomain:@"JoyConErrorDomain" code:14 userInfo:v24];
  }
  uint64_t v14 = *(void *)(a1 + 8);
  int8x8_t v13 = (void **)(a1 + 8);
  uint64_t v12 = v14;
  if (!v14) {
    goto LABEL_11;
  }
  (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v6, v11);
LABEL_8:
  float v15 = *v13;
LABEL_12:
  void *v13 = 0;

  return v8 == v9;
}

void sub_12604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12674(uint64_t a1)
{
  if (a1)
  {
    if (!*(void *)(a1 + 1048))
    {
      double v2 = *(id **)(a1 + 1024);
      if (v2)
      {
        id v3 = *v2;
        *(void *)(a1 + 1024) = *v2;
        if (!v3) {
          *(void *)(a1 + 1032) = a1 + 1024;
        }
        --*(_DWORD *)(a1 + 1040);
        uint64_t v4 = mach_absolute_time();
        if (sub_146E4((uint64_t)v2, (void *)a1))
        {
          objc_initWeak(&location, (id)a1);
          dispatch_time_t v5 = dispatch_time(0, 2000000000);
          id v6 = [(id)a1 dispatchQueue];
          id v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);

          dispatch_source_set_timer(v7, v5, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_152A4;
          block[3] = &unk_24AB0;
          objc_copyWeak(v13, &location);
          v13[1] = v2;
          dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
          dispatch_source_set_event_handler(v7, v8);

          dispatch_resume(v7);
          int v9 = *(void **)(a1 + 1056);
          *(void *)(a1 + 1048) = v2;
          *(void *)(a1 + 1056) = v7;

          *(void *)(a1 + 1064) = v4;
          objc_destroyWeak(v13);
          objc_destroyWeak(&location);
        }
        else
        {

          free(v2);
          id v10 = [(id)a1 dispatchQueue];
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_15384;
          v11[3] = &unk_24720;
          v11[4] = a1;
          dispatch_async(v10, v11);
        }
      }
    }
  }
}

void sub_128B0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_128C4(uint64_t a1)
{
}

BOOL sub_128CC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = *(id *)(a1 + 16);
  voucher_adopt();
  int v8 = *(unsigned __int8 *)(a3 + 1);
  int v9 = *(unsigned __int8 *)(a1 + 41);
  if (v8 == v9)
  {
    uint64_t v10 = *(void *)(a1 + 8);
    if (v10)
    {
      (*(void (**)(uint64_t, id, void))(v10 + 16))(v10, v6, 0);
      id v11 = *(void **)(a1 + 8);
    }
    else
    {
      id v11 = 0;
    }
    *(void *)(a1 + 8) = 0;
  }
  else
  {
    id v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Received reply for a different proprietary command [%#x].", *(unsigned __int8 *)(a3 + 1));
    id v14 = objc_alloc((Class)NSError);
    v19[0] = NSLocalizedDescriptionKey;
    v19[1] = NSLocalizedRecoverySuggestionErrorKey;
    v20[0] = v13;
    v20[1] = @"Try again.";
    float v15 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v16 = [v14 initWithDomain:@"JoyConErrorDomain" code:34 userInfo:v15];

    uint64_t v17 = *(void *)(a1 + 8);
    if (v17)
    {
      (*(void (**)(uint64_t, void, id))(v17 + 16))(v17, 0, v16);
      float v18 = *(void **)(a1 + 8);
    }
    else
    {
      float v18 = 0;
    }
    *(void *)(a1 + 8) = 0;
  }
  return v8 == v9;
}

void sub_12A94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_12AD8(uint64_t a1)
{
  if (a1)
  {
    if (!*(void *)(a1 + 1000))
    {
      double v2 = *(uint64_t **)(a1 + 976);
      if (v2)
      {
        uint64_t v3 = *v2;
        *(void *)(a1 + 976) = *v2;
        if (!v3) {
          *(void *)(a1 + 984) = a1 + 976;
        }
        --*(_DWORD *)(a1 + 992);
        uint64_t v4 = mach_absolute_time();
        if (sub_133D8((uint64_t)v2, (void *)a1) && *((unsigned char *)v2 + 24))
        {
          objc_initWeak(&location, (id)a1);
          dispatch_time_t v5 = dispatch_time(0, 1000000000);
          id v6 = [(id)a1 dispatchQueue];
          id v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v6);

          dispatch_source_set_timer(v7, v5, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_14034;
          block[3] = &unk_24AB0;
          objc_copyWeak(v13, &location);
          v13[1] = v2;
          dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
          dispatch_source_set_event_handler(v7, v8);

          dispatch_resume(v7);
          int v9 = *(void **)(a1 + 1008);
          *(void *)(a1 + 1000) = v2;
          *(void *)(a1 + 1008) = v7;

          *(void *)(a1 + 1016) = v4;
          objc_destroyWeak(v13);
          objc_destroyWeak(&location);
        }
        else
        {

          free(v2);
          uint64_t v10 = [(id)a1 dispatchQueue];
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_14144;
          v11[3] = &unk_24720;
          v11[4] = a1;
          dispatch_async(v10, v11);
        }
      }
    }
  }
}

void sub_12D18(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_12D2C(uint64_t a1)
{
}

void sub_1313C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1320C(uint64_t result, float a2)
{
  if (result)
  {
    double v2 = a2;
    if (a2 >= 0.035863824)
    {
      if (v2 >= 0.047502641)
      {
        if (v2 >= 0.065562582)
        {
          if (v2 >= 0.096642284)
          {
            if (v2 >= 0.128740086)
            {
              if (v2 >= 0.187285343)
              {
                if (v2 >= 0.263212876)
                {
                  if (v2 >= 0.364076932)
                  {
                    if (v2 >= 0.510491764)
                    {
                      if (v2 >= 0.713429339)
                      {
                        if (a2 >= 1.0) {
                          return 1;
                        }
                        else {
                          return 2;
                        }
                      }
                      else
                      {
                        return 3;
                      }
                    }
                    else
                    {
                      return 4;
                    }
                  }
                  else
                  {
                    return 5;
                  }
                }
                else
                {
                  return 6;
                }
              }
              else
              {
                return 7;
              }
            }
            else
            {
              return 8;
            }
          }
          else
          {
            return 9;
          }
        }
        else
        {
          return 10;
        }
      }
      else
      {
        return 11;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void *sub_13318(char a1, char a2, const void *a3, size_t a4, void *a5)
{
  id v9 = a5;
  uint64_t v10 = malloc_type_calloc(1uLL, a4 + 48, 0x8825E644uLL);
  id v11 = [v9 copy];
  uint64_t v12 = (void *)v10[1];
  v10[1] = v11;

  uint64_t v13 = voucher_copy();
  id v14 = (void *)v10[2];
  v10[2] = v13;

  *((unsigned char *)v10 + 24) = a2;
  v10[4] = a4;
  *((unsigned char *)v10 + 40) = 0x80;
  *((unsigned char *)v10 + 41) = a1;
  if (a4) {
    memmove((char *)v10 + 42, a3, a4);
  }

  return v10;
}

void sub_133C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_133D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 16);
  voucher_adopt();
  dispatch_time_t v5 = sub_34C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_18428();
  }

  id v6 = sub_34C0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_18394();
  }

  id v7 = [v3 device];
  id v8 = objc_msgSend(v7, "setReport:reportLength:withIdentifier:forType:error:");
  id v9 = 0;

  if ((v8 & 1) == 0)
  {
    id v14 = *(void **)(a1 + 8);
    uint64_t v11 = a1 + 8;
    uint64_t v13 = v14;
    if (!v14)
    {
LABEL_12:
      *(void *)uint64_t v11 = 0;

      goto LABEL_13;
    }
    id v15 = objc_alloc((Class)NSError);
    v21[0] = NSLocalizedDescriptionKey;
    v21[1] = NSLocalizedFailureReasonErrorKey;
    v22[0] = @"Error sending report.";
    id v16 = [v9 localizedDescription];
    uint64_t v17 = +[NSString stringWithFormat:@"%@", v16];
    v22[1] = v17;
    float v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v19 = [v15 initWithDomain:@"JoyConErrorDomain" code:32 userInfo:v18];

    (*(void (**)(void))(*(void *)v11 + 16))();
LABEL_11:
    uint64_t v13 = *(void **)v11;
    goto LABEL_12;
  }
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v12 = *(void *)(a1 + 8);
    uint64_t v11 = a1 + 8;
    uint64_t v10 = v12;
    if (!v12)
    {
      uint64_t v13 = 0;
      goto LABEL_12;
    }
    (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, 0, 0);
    goto LABEL_11;
  }
LABEL_13:

  return v8;
}

void sub_13630(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1369C(uint64_t a1)
{
  id v2 = *(id *)(a1 + 16);
  voucher_adopt();
  id v3 = *(void **)(a1 + 8);
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Device did not respond to proprietary command."];
    id v5 = objc_alloc((Class)NSError);
    v8[0] = NSLocalizedDescriptionKey;
    v8[1] = NSLocalizedRecoverySuggestionErrorKey;
    v9[0] = v4;
    v9[1] = @"Try again.";
    id v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    id v7 = [v5 initWithDomain:@"JoyConErrorDomain" code:33 userInfo:v6];

    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    id v3 = *(void **)(a1 + 8);
  }
  *(void *)(a1 + 8) = 0;
}

void sub_137E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13820(uint64_t a1)
{
  id v2 = *(id *)(a1 + 16);
  voucher_adopt();
  id v3 = *(void **)(a1 + 8);
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Device not active."];
    id v5 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    id v9 = v4;
    id v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v7 = [v5 initWithDomain:@"JoyConErrorDomain" code:31 userInfo:v6];

    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    id v3 = *(void **)(a1 + 8);
  }
  *(void *)(a1 + 8) = 0;
}

void sub_13950(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_13E5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_13F00(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t sub_13F18(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t sub_13F30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_13F48(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(id **)(a1 + 1000);
    if (v2)
    {
      id v3 = *(id *)(a1 + 1008);
      id v4 = *(void **)(a1 + 1008);
      *(void *)(a1 + 1008) = 0;
      *(void *)(a1 + 1016) = 0;

      *(void *)(a1 + 1000) = 0;
      dispatch_source_cancel(v3);
      sub_13820((uint64_t)v2);

      free(v2);
    }
    id v5 = *(id **)(a1 + 976);
    if (v5)
    {
      do
      {
        id v6 = (id *)*v5;
        sub_13820((uint64_t)v5);

        free(v5);
        id v5 = v6;
      }
      while (v6);
    }
    *(void *)(a1 + 976) = 0;
    *(void *)(a1 + 984) = a1 + 976;
  }
}

void sub_14024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14034(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = _os_activity_create(&dword_0, "Proprietary Command Timeout", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &v7);
    id v4 = (id *)*((void *)WeakRetained + 125);
    id v5 = *((id *)WeakRetained + 126);
    if (v4 == *(id **)(a1 + 40))
    {
      id v6 = (void *)*((void *)WeakRetained + 126);
      *((void *)WeakRetained + 126) = 0;
      *((void *)WeakRetained + 127) = 0;

      *((void *)WeakRetained + 125) = 0;
      dispatch_source_cancel(v5);
      sub_1369C((uint64_t)v4);

      free(v4);
    }

    os_activity_scope_leave(&v7);
  }
}

void sub_14124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_14144(uint64_t a1)
{
  return sub_12AD8(*(void *)(a1 + 32));
}

void sub_1414C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_activity_scope_state_s v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v13 = sub_34C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_18530();
    }

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = v7;
    if (!v11) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, v9, v12);
    goto LABEL_14;
  }
  uint64_t v10 = sub_34C0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_184FC();
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    uint64_t v12 = 0;
    goto LABEL_13;
  }
LABEL_14:
}

void sub_14260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14290(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v4 = sub_34C0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_18574();
    }

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_14388;
    v5[3] = &unk_24AD8;
    id v6 = v3;
    [a1 enqueueProprietaryCommand:3 expectsResponse:1 data:0 length:0 replyHandler:v5];
  }
}

void sub_14368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_14388(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_activity_scope_state_s v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v13 = sub_34C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_185DC();
    }

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = v7;
    if (!v11) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, v9, v12);
    goto LABEL_14;
  }
  uint64_t v10 = sub_34C0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_185A8();
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    uint64_t v12 = 0;
    goto LABEL_13;
  }
LABEL_14:
}

void sub_1449C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_144CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v9 = sub_34C0();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      [v6 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_18654();
    }

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v6);
    }
  }
  else
  {
    os_activity_scope_state_s v7 = sub_34C0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_18620();
    }

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      (*(void (**)(uint64_t, uint64_t, void))(v8 + 16))(v8, 1, 0);
    }
  }
}

void sub_145DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void *sub_1460C(char a1, const void *a2, size_t a3, void *a4, int a5)
{
  id v9 = a4;
  if (a3 <= 0x26) {
    uint64_t v10 = 38;
  }
  else {
    uint64_t v10 = a3;
  }
  uint64_t v11 = malloc_type_calloc(1uLL, v10 + 48, 0x96677E92uLL);
  id v12 = [v9 copy];
  uint64_t v13 = (void *)v11[1];
  v11[1] = v12;

  uint64_t v14 = voucher_copy();
  id v15 = (void *)v11[2];
  v11[2] = v14;

  v11[3] = a3;
  *((unsigned char *)v11 + 32) = 1;
  *((unsigned char *)v11 + 42) = a1;
  if (a3) {
    memmove((char *)v11 + 43, a2, a3);
  }
  if (a5) {
    v11[3] = v10;
  }

  return v11;
}

void sub_146D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_146E4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 16);
  voucher_adopt();
  id v5 = sub_34C0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1873C();
  }

  *(void *)(a1 + 33) = [v3 currentRumbleData];
  *(unsigned char *)(a1 + 41) = v6;
  os_activity_scope_state_s v7 = sub_34C0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_18698();
  }

  sub_5C30((uint64_t)v3);
  kdebug_trace();
  uint64_t v8 = [v3 device];
  uint64_t v9 = *(void *)(a1 + 24) + 11;
  uint64_t v10 = *(unsigned __int8 *)(a1 + 32);
  id v20 = 0;
  id v11 = [v8 setReport:a1 + 32 reportLength:v9 withIdentifier:v10 forType:1 error:&v20];
  id v12 = v20;

  sub_5C30((uint64_t)v3);
  [v12 code];
  kdebug_trace();
  if ((v11 & 1) == 0)
  {
    uint64_t v13 = *(void **)(a1 + 8);
    if (v13)
    {
      id v14 = objc_alloc((Class)NSError);
      v21[0] = NSLocalizedDescriptionKey;
      v21[1] = NSLocalizedFailureReasonErrorKey;
      v22[0] = @"Error sending report.";
      id v15 = [v12 localizedDescription];
      id v16 = +[NSString stringWithFormat:@"%@", v15];
      v22[1] = v16;
      uint64_t v17 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];
      id v18 = [v14 initWithDomain:@"JoyConErrorDomain" code:12 userInfo:v17];

      (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
      uint64_t v13 = *(void **)(a1 + 8);
    }
    *(void *)(a1 + 8) = 0;
  }
  return v11;
}

void sub_14978(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_149EC(uint64_t a1)
{
  id v2 = *(id *)(a1 + 16);
  voucher_adopt();
  id v3 = *(void **)(a1 + 8);
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Device did not respond to sub-command."];
    id v5 = objc_alloc((Class)NSError);
    v8[0] = NSLocalizedDescriptionKey;
    v8[1] = NSLocalizedRecoverySuggestionErrorKey;
    v9[0] = v4;
    v9[1] = @"Try again.";
    char v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
    id v7 = [v5 initWithDomain:@"JoyConErrorDomain" code:13 userInfo:v6];

    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    id v3 = *(void **)(a1 + 8);
  }
  *(void *)(a1 + 8) = 0;
}

void sub_14B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14B70(uint64_t a1)
{
  id v2 = *(id *)(a1 + 16);
  voucher_adopt();
  id v3 = *(void **)(a1 + 8);
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSString) initWithFormat:@"Device not active."];
    id v5 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    id v9 = v4;
    char v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    id v7 = [v5 initWithDomain:@"JoyConErrorDomain" code:11 userInfo:v6];

    (*(void (**)(void))(*(void *)(a1 + 8) + 16))();
    id v3 = *(void **)(a1 + 8);
  }
  *(void *)(a1 + 8) = 0;
}

void sub_14CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_14CDC(uint64_t a1, unsigned int a2, const void *a3, size_t a4, void *a5)
{
  id v9 = a5;
  if (!a1) {
    goto LABEL_13;
  }
  if (a4 >= 0x27)
  {
    id v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"Sub-command [%#x] with length [%zd bytes] > maxSubcommandLength [%zd bytes].", a2, a4, 38);
    id v11 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v43 = NSLocalizedDescriptionKey;
    id v44 = v10;
    id v12 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
    id v13 = [v11 initWithDomain:@"JoyConErrorDomain" code:17 userInfo:v12];

    if (!v9)
    {
LABEL_7:

      goto LABEL_13;
    }
    id v14 = [(id)a1 dispatchQueue];
    id v15 = block;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1525C;
    block[3] = &unk_24A88;
    id v36 = v9;
    id v13 = v13;
    id v35 = v13;
    dispatch_async(v14, block);

    goto LABEL_5;
  }
  if ((*(unsigned char *)(a1 + 696) & 1) == 0)
  {
    id v19 = [objc_alloc((Class)NSString) initWithFormat:@"Device not active."];
    id v20 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    id v42 = v19;
    float v21 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    id v13 = [v20 initWithDomain:@"JoyConErrorDomain" code:11 userInfo:v21];

    if (!v9) {
      goto LABEL_7;
    }
    int8x8_t v22 = [(id)a1 dispatchQueue];
    id v15 = v31;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_15274;
    v31[3] = &unk_24A88;
    id v33 = v9;
    id v13 = v13;
    id v32 = v13;
    dispatch_async(v22, v31);

    goto LABEL_5;
  }
  if (*(_DWORD *)(a1 + 1040) >= 0x65u)
  {
    id v23 = [objc_alloc((Class)NSString) initWithFormat:@"Too many pending sub-commands."];
    id v24 = objc_alloc((Class)NSError);
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    id v40 = v23;
    NSErrorUserInfoKey v25 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    id v13 = [v24 initWithDomain:@"JoyConErrorDomain" code:19 userInfo:v25];

    if (!v9)
    {
      id v16 = sub_34C0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        float v27 = [v13 localizedDescription];
        *(_DWORD *)buf = 138543362;
        long long v38 = v27;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
      }
      goto LABEL_6;
    }
    int8x8_t v26 = [(id)a1 dispatchQueue];
    id v15 = v28;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    void v28[2] = sub_1528C;
    v28[3] = &unk_24A88;
    id v30 = v9;
    id v13 = v13;
    id v29 = v13;
    dispatch_async(v26, v28);

LABEL_5:
    id v16 = v15[5];
LABEL_6:

    goto LABEL_7;
  }
  uint64_t v17 = sub_1460C(a2, a3, a4, v9, *(unsigned __int8 *)(a1 + 704));
  id v18 = sub_34C0();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_187A8();
  }

  void *v17 = 0;
  **(void **)(a1 + 1032) = v17;
  *(void *)(a1 + 1032) = v17;
  ++*(_DWORD *)(a1 + 1040);
  sub_12674(a1);
LABEL_13:
}

void sub_151B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1525C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t sub_15274(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t sub_1528C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_152A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v6 = WeakRetained;
    id v3 = (id *)*((void *)WeakRetained + 131);
    id v4 = *((id *)WeakRetained + 132);
    if (v3 == *(id **)(a1 + 40))
    {
      id v5 = (void *)v6[132];
      v6[132] = 0;
      v6[133] = 0;

      v6[131] = 0;
      dispatch_source_cancel(v4);
      sub_149EC((uint64_t)v3);

      free(v3);
    }

    id WeakRetained = v6;
  }
}

void sub_1536C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_15384(uint64_t a1)
{
  return sub_12674(*(void *)(a1 + 32));
}

void sub_1538C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v13 = sub_34C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_18810();
    }

    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v7);
    }
  }
  else
  {
    id v8 = v5;
    id v9 = [v8 bytes];
    id v10 = [v8 length];
    if ((unint64_t)v10 <= 0xB)
    {
      id v15 = [objc_alloc((Class)NSString) initWithFormat:@"Payload for sub-command [%#x] response has length [%zu bytes], which is less than the expected length [%zu bytes].", 2, v10, 8];
      id v16 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
      id v22 = v15;
      uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v18 = [v16 initWithDomain:@"JoyConErrorDomain" code:16 userInfo:v17];

      id v19 = sub_34C0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        [v18 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_18810();
      }

      uint64_t v20 = *(void *)(a1 + 32);
      if (v20) {
        (*(void (**)(uint64_t, void, id))(v20 + 16))(v20, 0, v18);
      }
    }
    else
    {
      id v11 = sub_34C0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_18854();
      }

      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        (*(void (**)(uint64_t, id, void))(v12 + 16))(v12, v9, 0);
      }
    }
  }
}

void sub_155BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15630(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    id v13 = sub_34C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_1890C();
    }

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = v7;
    if (!v11) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, v9, v12);
    goto LABEL_14;
  }
  id v10 = sub_34C0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_188D8();
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    uint64_t v12 = 0;
    goto LABEL_13;
  }
LABEL_14:
}

void sub_15744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15774(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    id v13 = sub_34C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_18984();
    }

    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = v7;
    if (!v11) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, v9, v12);
    goto LABEL_14;
  }
  id v10 = sub_34C0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_18950();
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    uint64_t v12 = 0;
    goto LABEL_13;
  }
LABEL_14:
}

void sub_15888(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_158B8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    id v13 = sub_34C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_189C8();
    }

    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v7);
    }
  }
  else
  {
    id v8 = v5;
    uint64_t v9 = (unsigned int *)[v8 bytes];
    id v10 = (char *)[v8 length];
    if ((unint64_t)v10 <= 4)
    {
      id v15 = [objc_alloc((Class)NSString) initWithFormat:@"Payload for sub-command [%#x] response has length [%zu bytes], which is less than the expected length [%zu bytes].", 16, v10, 8];
      id v16 = objc_alloc((Class)NSError);
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      id v27 = v15;
      uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      id v12 = [v16 initWithDomain:@"JoyConErrorDomain" code:16 userInfo:v17];

      id v18 = sub_34C0();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        [v12 localizedDescription];
        objc_claimAutoreleasedReturnValue();
        sub_189C8();
      }

      uint64_t v19 = *(void *)(a1 + 32);
      if (v19) {
        (*(void (**)(uint64_t, void, id))(v19 + 16))(v19, 0, v12);
      }
      goto LABEL_9;
    }
    if (*v9 != *(_DWORD *)(a1 + 40))
    {
      id v20 = [objc_alloc((Class)NSString) initWithFormat:@"Received reply for a different read SPI flash request: address = %#.4x, length = %u.", *v9, *((unsigned __int8 *)v9 + 4)];
      id v21 = objc_alloc((Class)NSError);
      v24[0] = NSLocalizedDescriptionKey;
      v24[1] = NSLocalizedRecoverySuggestionErrorKey;
      v25[0] = v20;
      v25[1] = @"Try again.";
      id v22 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
      id v12 = [v21 initWithDomain:@"JoyConErrorDomain" code:15 userInfo:v22];

      uint64_t v23 = *(void *)(a1 + 32);
      if (v23) {
        (*(void (**)(uint64_t, void, id))(v23 + 16))(v23, 0, v12);
      }
      goto LABEL_9;
    }
    uint64_t v11 = sub_34C0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_18A0C();
    }

    if (*(void *)(a1 + 32))
    {
      objc_msgSend(v8, "subdataWithRange:", 5, v10 - 5);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:
    }
  }
}

void sub_15BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15C88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    id v13 = sub_34C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_18AD8();
    }

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v7;
    if (!v11) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, v9, v12);
    goto LABEL_14;
  }
  id v10 = sub_34C0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_18AA4();
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    id v12 = 0;
    goto LABEL_13;
  }
LABEL_14:
}

void sub_15D9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15DCC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    id v13 = sub_34C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_18B50();
    }

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v7;
    if (!v11) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, v9, v12);
    goto LABEL_14;
  }
  id v10 = sub_34C0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_18B1C();
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    id v12 = 0;
    goto LABEL_13;
  }
LABEL_14:
}

void sub_15EE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_15F10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = v8;
  if (!v8)
  {
    id v13 = sub_34C0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      [v7 localizedDescription];
      objc_claimAutoreleasedReturnValue();
      sub_18BC8();
    }

    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v7;
    if (!v11) {
      goto LABEL_14;
    }
LABEL_13:
    (*(void (**)(uint64_t, uint64_t, void *))(v11 + 16))(v11, v9, v12);
    goto LABEL_14;
  }
  id v10 = sub_34C0();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_18B94();
  }

  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    id v12 = 0;
    goto LABEL_13;
  }
LABEL_14:
}

void sub_16024(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1611C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_161CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIMUEnabled:*(unsigned __int8 *)(a1 + 40)];
}

void sub_1633C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1652C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_16598(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    id result = *(unsigned __int8 *)(result + 971);
    *(unsigned char *)(v1 + 971) = result + 1;
    if ((result + 1) >= 0x10u) {
      *(unsigned char *)(v1 + 971) = 0;
    }
  }
  return result;
}

uint64_t sub_165CC(float a1, float a2, float a3, float a4)
{
  if (a2 == 0.0 && a4 == 0.0) {
    return 1077936384;
  }
  float v7 = (float)(a3 * 1170.8) + 81.752;
  int v8 = (int)(float)(roundf(log2f((float)((float)(a1 * 585.41) + 40.876) / 10.0) * 32.0) + -64.0);
  signed int v9 = vcvts_n_s32_f32(roundf(log2f(v7 / 10.0) * 32.0) + -96.0, 2uLL) & 0xFFFFFFFC;
  if (v8 <= 1) {
    unsigned int v10 = 1;
  }
  else {
    unsigned int v10 = v8;
  }
  if (v10 >= 0x7F) {
    unsigned int v10 = 127;
  }
  if (v9 <= 4) {
    signed int v9 = 4;
  }
  if (v9 >= 0x1FC) {
    LOWORD(v9) = 508;
  }
  unsigned int v11 = (int)(float)(a4 * 200.0) & 0xFFFE;
  if (v11 >= 0xC8) {
    LOWORD(v11) = 200;
  }
  return (v10 << 16) | ((int)(float)((float)(a2 * 100.0) + 128.0) >> 1 << 24) | v9 & 0x100 | ((unsigned __int16)v11 >> 1 << 9) | v9 & 0xFC;
}

void sub_167E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_168D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16980(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_16BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

float32x2_t sub_16D60(int a1, int a2)
{
  v2.i32[0] = a1 - 0x7FFF;
  v2.i32[1] = a2 ^ 0x7FFF;
  float32x2_t v3 = vdiv_f32(vcvt_f32_s32(vshr_n_s32(vshl_n_s32(v2, 0x10uLL), 0x10uLL)), (float32x2_t)vdup_n_s32(0x46FFFE00u));
  float v4 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v3, v3).i32[1]), v3.f32[0], v3.f32[0]));
  float32x2_t result = 0;
  if (v4 >= 0.2)
  {
    float32x2_t v6 = vmul_n_f32(v3, (float)((float)(v4 + -0.2) / 0.3) / v4);
    __asm { FMOV            V1.2S, #-1.0 }
    float32x2_t v12 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(_D1, v6), (int8x8_t)_D1, (int8x8_t)v6);
    __asm { FMOV            V1.2S, #1.0 }
    return vminnm_f32(v12, _D1);
  }
  return result;
}

float32x2_t sub_16DEC(__int16 a1, __int16 a2, _WORD *a3, uint64_t a4)
{
  int v4 = (__int16)(a1 - *a3);
  if (v4 <= (__int16)-a3[2]) {
    int v4 = (__int16)-a3[2];
  }
  if (v4 >= (__int16)a3[4]) {
    int v5 = (__int16)a3[4];
  }
  else {
    int v5 = v4;
  }
  if ((__int16)(a2 - a3[1]) <= (__int16)-a3[3]) {
    int v6 = (__int16)-a3[3];
  }
  else {
    int v6 = (__int16)(a2 - a3[1]);
  }
  if (v6 >= (__int16)a3[5]) {
    int v6 = (__int16)a3[5];
  }
  float v7 = (float)v5;
  float v8 = (float)v6;
  float v9 = sqrtf((float)(v8 * v8) + (float)(v7 * v7));
  unsigned int v10 = *(unsigned __int16 *)(a4 + 8);
  if (v10 <= 1) {
    unsigned int v10 = 1;
  }
  float v11 = (float)v10;
  float32x2_t v12 = 0;
  if (v9 >= (float)v10)
  {
    float v13 = fabsf(v8 / v9);
    unsigned int v14 = (unsigned __int16)(*(_WORD *)(a4 + 2) - v10);
    float v15 = fabsf(v7 / v9);
    if ((v5 & 0x8000u) == 0) {
      float v16 = -v11;
    }
    else {
      float v16 = v11;
    }
    v12.f32[0] = (float)(v7 + (float)(v16 * v15)) / (float)v14;
    if ((v6 & 0x8000) != 0) {
      float v17 = v8 + (float)(v11 * v13);
    }
    else {
      float v17 = v8 + (float)((float)-v11 * v13);
    }
    v12.f32[1] = v17 / (float)v14;
  }
  __asm { FMOV            V0.2S, #-1.0 }
  float32x2_t v23 = (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(_D0, v12), (int8x8_t)_D0, (int8x8_t)v12);
  __asm { FMOV            V1.2S, #1.0 }
  return vminnm_f32(v23, _D1);
}

void sub_16EDC(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_16EF8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_16F14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_16F2C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

uint64_t sub_16F48(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void sub_16F60(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_17024(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xEu);
}

NSXPCInterface *sub_17058()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCMotionServiceClientInterface];
}

NSXPCInterface *sub_1706C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCMotionServiceServerInterface];
}

NSXPCInterface *sub_17080()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCLightServiceClientInterface];
}

NSXPCInterface *sub_17094()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCLightServiceServerInterface];
}

id sub_170A8()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GCDriverClientInterface];
  uint64_t v1 = sub_8654();
  [v0 setInterface:v1 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  int32x2_t v2 = sub_8668();
  [v0 setInterface:v2 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  float32x2_t v3 = sub_17080();
  [v0 setInterface:v3 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  uint64_t v4 = sub_17094();
  [v0 setInterface:v4 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  uint64_t v5 = sub_867C();
  [v0 setInterface:v5 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  int v6 = sub_8690();
  [v0 setInterface:v6 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  float v7 = sub_17058();
  [v0 setInterface:v7 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  float v8 = sub_1706C();
  [v0 setInterface:v8 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  uint64_t v9 = sub_17378();
  [v0 setInterface:v9 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  unsigned int v10 = sub_1738C();
  [v0 setInterface:v10 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  float v11 = sub_3798();
  [v0 setInterface:v11 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  float32x2_t v12 = sub_37AC();
  [v0 setInterface:v12 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  float v13 = GCGenericDeviceDriverConfigurationServiceClientInterface();
  [v0 setInterface:v13 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  unsigned int v14 = GCGenericDeviceDriverConfigurationServiceServerInterface();
  [v0 setInterface:v14 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *sub_17364()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GCDriverServerInterface];
}

NSXPCInterface *sub_17378()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCBatteryServiceClientInterface];
}

NSXPCInterface *sub_1738C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCBatteryServiceServerInterface];
}

void sub_173A0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "setProperty: %@ forKey: %@", (uint8_t *)&v3, 0x16u);
}

void sub_17428(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Dispatching event...", v1, 2u);
}

void sub_1746C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Stopping timer...", v1, 2u);
}

void sub_174B0()
{
  sub_16FD4();
  sub_16F14(&dword_0, v0, v1, "Failed to set player inidcator lights. %{public}@", v2);
}

void sub_1751C()
{
  sub_16FD4();
  sub_16F14(&dword_0, v0, v1, "Failed to switch input mode. %{public}@", v2);
}

void sub_17588()
{
  sub_16F88();
  sub_16F2C(&dword_0, v0, v1, "Set Input Report Mode Request: mode = %hhx", v2, v3, v4, v5, v6);
}

void sub_175F0()
{
  sub_16FD4();
  sub_16F14(&dword_0, v0, v1, "Failed to modify low-power setting. %{public}@", v2);
}

void sub_1765C()
{
  sub_16F88();
  sub_16F2C(&dword_0, v0, v1, "Set Low Power State Request: change = %hhx", v2, v3, v4, v5, v6);
}

void sub_176C4()
{
  sub_16FD4();
  sub_16F14(&dword_0, v0, v1, "Failed to modify IMU enabled setting. %{public}@", v2);
}

void sub_17730()
{
  sub_16F88();
  sub_16F2C(&dword_0, v0, v1, "Set IMU Enabled Request: change = %hhx", v2, v3, v4, v5, v6);
}

void sub_17798()
{
  sub_16FD4();
  sub_16F14(&dword_0, v0, v1, "Failed to modify vibration enabled setting. %{public}@", v2);
}

void sub_17804()
{
  sub_16F88();
  sub_16F2C(&dword_0, v0, v1, "Set Vibration Enabled Request: change = %hhx", v2, v3, v4, v5, v6);
}

void sub_1786C()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Failed to read low-power setting. %{public}@", v5);
}

void sub_178B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_17930(int a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109376;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 1024;
  *(_DWORD *)((char *)&v4 + 2) = a1;
  sub_17024(&dword_0, a2, a3, "Read SPI Flash Request: address = %#.4x, length = %{bytes}u", v3, v4);
}

void sub_179A8()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Failed to retrieve device info. %{public}@", v5);
}

void sub_179EC()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "Device Info Request", v2, v3, v4, v5, v6);
}

void sub_17A20()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Failed to read device serial number. %{public}@", v5);
}

void sub_17A64()
{
  sub_16FC0();
  sub_16F60(&dword_0, v0, v1, "Read serial number has length [%{bytes}zu], which is less than the expected length [%{bytes}zu]. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_17AD4()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Failed to read color data. %{public}@", v5);
}

void sub_17B18()
{
  sub_16FFC();
  sub_16F60(&dword_0, v0, v1, "Read body color data has length [%{bytes}zu], which is less than the expected length [%{bytes}zu]. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_17B80()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Failed to read stick factory calibration data. %{public}@", v5);
}

void sub_17BC4()
{
  sub_16FA4();
  sub_16F60(&dword_0, v0, v1, "Read stick factory calibration data has length [%{bytes}zu], which is less than the expected length [%{bytes}zu]. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_17C2C()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Failed to read stick user calibration data. %{public}@", v5);
}

void sub_17C70()
{
  sub_16FC0();
  sub_16F60(&dword_0, v0, v1, "Read stick user calibration data has length [%{bytes}zu], which is less than the expected length [%{bytes}zu]. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_17CE0()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Failed to read left stick parameters data. %{public}@", v5);
}

void sub_17D24()
{
  sub_16FA4();
  sub_16F60(&dword_0, v0, v1, "Read left stick parameters data has length [%{bytes}zu], which is less than the expected length [%{bytes}zu]. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_17D8C()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Failed to read right stick parameters data. %{public}@", v5);
}

void sub_17DD0()
{
  sub_16FA4();
  sub_16F60(&dword_0, v0, v1, "Read right stick parameters data has length [%{bytes}zu], which is less than the expected length [%{bytes}zu]. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_17E38()
{
  sub_16FD4();
  sub_16F14(&dword_0, v0, v1, "Failed to read motion calibration data. %{public}@", v2);
}

void sub_17EA4()
{
  sub_16FC0();
  sub_16F60(&dword_0, v0, v1, "Read motion calibration data has length [%{bytes}zu], which is less than the expected length [%{bytes}zu]. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_17F14()
{
  sub_16FC0();
  sub_16F60(&dword_0, v0, v1, "Read motion calibration data has length [%{bytes}zu], which is less than the expected length [%{bytes}zu]. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_17F84()
{
  sub_16FFC();
  sub_16F60(&dword_0, v0, v1, "Read motion horizontal offset data has length [%{bytes}zu], which is less than the expected length [%{bytes}zu]. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_17FEC()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Failed to force USB. %{public}@", v5);
}

void sub_18030()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "Force USB", v2, v3, v4, v5, v6);
}

void sub_18064()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Failed to handshake. %{public}@", v5);
}

void sub_180A8()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "Handshake", v2, v3, v4, v5, v6);
}

void sub_180DC()
{
  sub_17044();
  sub_17018();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x14u);
}

void sub_18168()
{
  sub_16F98();
  sub_16F2C(&dword_0, v0, v1, "Proprietary command ack: identifier = %#x", v2, v3, v4, v5, v6);
}

void sub_181D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_18248(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_182BC()
{
  sub_16F98();
  sub_16F2C(&dword_0, v0, v1, "NACK sub-command [%#x].", v2, v3, v4, v5, v6);
}

void sub_18328()
{
  sub_16F98();
  sub_16F2C(&dword_0, v0, v1, "ACK sub-command [%#x].", v2, v3, v4, v5, v6);
}

void sub_18394()
{
  sub_16FE0();
  sub_17018();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x26u);
}

void sub_18428()
{
  sub_16F98();
  sub_16F2C(&dword_0, v0, v1, "Dispatch proprietary command [%#x].", v2, v3, v4, v5, v6);
}

void sub_18494()
{
  sub_16F88();
  sub_16F2C(&dword_0, v0, v1, "Enqueue proprietary command [%#x].", v2, v3, v4, v5, v6);
}

void sub_184FC()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "Handshake Response", v2, v3, v4, v5, v6);
}

void sub_18530()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Handshake Error: %{public}@", v5);
}

void sub_18574()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "Set High Speed", v2, v3, v4, v5, v6);
}

void sub_185A8()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "Set High Speed Response", v2, v3, v4, v5, v6);
}

void sub_185DC()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Set High Speed Error: %{public}@", v5);
}

void sub_18620()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "Force USB Sent", v2, v3, v4, v5, v6);
}

void sub_18654()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Force USB Error: %{public}@", v5);
}

void sub_18698()
{
  sub_16FE0();
  __int16 v5 = v0;
  uint64_t v6 = v1;
  __int16 v7 = 1040;
  int v8 = v1;
  __int16 v9 = 2097;
  uint64_t v10 = v2;
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "Send report: type = %li, reportID = %#lx, bytes[%zu] = %{private}.*P", v4, 0x30u);
}

void sub_1873C()
{
  sub_16F98();
  sub_16F2C(&dword_0, v0, v1, "Dispatch sub-command [%#x].", v2, v3, v4, v5, v6);
}

void sub_187A8()
{
  sub_16F88();
  sub_16F2C(&dword_0, v0, v1, "Enqueue sub-command [%#x].", v2, v3, v4, v5, v6);
}

void sub_18810()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Device Info Error: %{public}@", v5);
}

void sub_18854()
{
  sub_17018();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
}

void sub_188D8()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "Set Input Report Mode Response", v2, v3, v4, v5, v6);
}

void sub_1890C()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Set Input Report Mode Error: %{public}@", v5);
}

void sub_18950()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "Set Low Power State Response", v2, v3, v4, v5, v6);
}

void sub_18984()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Set Low Power State Error: %{public}@", v5);
}

void sub_189C8()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Read SPI Flash Error: %{public}@", v5);
}

void sub_18A0C()
{
  sub_17044();
  sub_17018();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x1Eu);
}

void sub_18AA4()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "Set Player Lights Response", v2, v3, v4, v5, v6);
}

void sub_18AD8()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Set Player Lights Error: %{public}@", v5);
}

void sub_18B1C()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "Set IMU Enabled Response", v2, v3, v4, v5, v6);
}

void sub_18B50()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Set IMU Enabled Error: %{public}@", v5);
}

void sub_18B94()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "Set Vibration Enabled Response", v2, v3, v4, v5, v6);
}

void sub_18BC8()
{
  sub_16F54();
  sub_16F48(v1, v2, 5.8381e-34);
  sub_16EDC(&dword_0, v3, v4, "Set Vibration Enabled Error: %{public}@", v5);
}

void sub_18C0C()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "#GESTURE Home button gesture -> began.", v2, v3, v4, v5, v6);
}

void sub_18C40()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "#GESTURE #BUG Home button gesture (bad state).", v2, v3, v4, v5, v6);
}

void sub_18C74()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "#GESTURE Home button gesture -> ended.", v2, v3, v4, v5, v6);
}

void sub_18CA8()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "#GESTURE Home button gesture -> possible.", v2, v3, v4, v5, v6);
}

void sub_18CDC()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "#GESTURE Home button gesture -> cancel.", v2, v3, v4, v5, v6);
}

void sub_18D10()
{
  sub_16F7C();
  sub_16EF8(&dword_0, v0, v1, "#GESTURE Home button gesture -> failed.", v2, v3, v4, v5, v6);
}

void sub_18D44(unsigned __int8 *a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109376;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 1024;
  *(_DWORD *)((char *)&v4 + 2) = *a1;
  sub_17024(&dword_0, a2, a3, "#GESTURE Home button: pressed=%{BOOL}d, wasPressed=%{BOOL}d", v3, v4);
}

uint64_t BTDeviceAddressFromString()
{
  return _BTDeviceAddressFromString();
}

uint64_t BTDeviceDisconnect()
{
  return _BTDeviceDisconnect();
}

uint64_t BTDeviceFromAddress()
{
  return _BTDeviceFromAddress();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

uint64_t BTSessionDetachWithQueue()
{
  return _BTSessionDetachWithQueue();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t GCGenericDeviceDriverConfigurationServiceClientInterface()
{
  return _GCGenericDeviceDriverConfigurationServiceClientInterface();
}

uint64_t GCGenericDeviceDriverConfigurationServiceServerInterface()
{
  return _GCGenericDeviceDriverConfigurationServiceServerInterface();
}

uint64_t IOHIDEventAppendEvent()
{
  return _IOHIDEventAppendEvent();
}

uint64_t IOHIDEventCreateQuaternionOrientationEvent()
{
  return _IOHIDEventCreateQuaternionOrientationEvent();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return _IOHIDEventCreateVendorDefinedEvent();
}

uint64_t IOHIDEventSetEventFlags()
{
  return _IOHIDEventSetEventFlags();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return _IOHIDEventSetIntegerValue();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

float log2f(float a1)
{
  return _log2f(a1);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

uint64_t voucher_adopt()
{
  return _voucher_adopt();
}

uint64_t voucher_copy()
{
  return _voucher_copy();
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_amplitude(void *a1, const char *a2, ...)
{
  return [a1 amplitude];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_batteryReport(void *a1, const char *a2, ...)
{
  return [a1 batteryReport];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createVirtualHIDDeviceForBattery(void *a1, const char *a2, ...)
{
  return [a1 createVirtualHIDDeviceForBattery];
}

id objc_msgSend_currentRumbleData(void *a1, const char *a2, ...)
{
  return [a1 currentRumbleData];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultHapticDispatchFrequency(void *a1, const char *a2, ...)
{
  return [a1 defaultHapticDispatchFrequency];
}

id objc_msgSend_defaultHapticMotors(void *a1, const char *a2, ...)
{
  return [a1 defaultHapticMotors];
}

id objc_msgSend_defaultIdleTimeoutDuration(void *a1, const char *a2, ...)
{
  return [a1 defaultIdleTimeoutDuration];
}

id objc_msgSend_defaultLeftAxisSnapRadius(void *a1, const char *a2, ...)
{
  return [a1 defaultLeftAxisSnapRadius];
}

id objc_msgSend_defaultLeftThumbstickDeadzoneRadius(void *a1, const char *a2, ...)
{
  return [a1 defaultLeftThumbstickDeadzoneRadius];
}

id objc_msgSend_defaultLeftThumbstickNoiseBuffer(void *a1, const char *a2, ...)
{
  return [a1 defaultLeftThumbstickNoiseBuffer];
}

id objc_msgSend_defaultRightAxisSnapRadius(void *a1, const char *a2, ...)
{
  return [a1 defaultRightAxisSnapRadius];
}

id objc_msgSend_defaultRightThumbstickDeadzoneRadius(void *a1, const char *a2, ...)
{
  return [a1 defaultRightThumbstickDeadzoneRadius];
}

id objc_msgSend_defaultRightThumbstickNoiseBuffer(void *a1, const char *a2, ...)
{
  return [a1 defaultRightThumbstickNoiseBuffer];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return [a1 disconnect];
}

id objc_msgSend_dispatchHapticEvent(void *a1, const char *a2, ...)
{
  return [a1 dispatchHapticEvent];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchQueue];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drainQueuedTransients(void *a1, const char *a2, ...)
{
  return [a1 drainQueuedTransients];
}

id objc_msgSend_driverCheckIn(void *a1, const char *a2, ...)
{
  return [a1 driverCheckIn];
}

id objc_msgSend_eventID(void *a1, const char *a2, ...)
{
  return [a1 eventID];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_hapticMotors(void *a1, const char *a2, ...)
{
  return [a1 hapticMotors];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initGameControllerDaemonXPC(void *a1, const char *a2, ...)
{
  return [a1 initGameControllerDaemonXPC];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_intensity(void *a1, const char *a2, ...)
{
  return [a1 intensity];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAnyHapticMotorEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAnyHapticMotorEnabled];
}

id objc_msgSend_isBluetoothClassic(void *a1, const char *a2, ...)
{
  return [a1 isBluetoothClassic];
}

id objc_msgSend_isBluetoothLE(void *a1, const char *a2, ...)
{
  return [a1 isBluetoothLE];
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return [a1 isIdle];
}

id objc_msgSend_lastEventTime(void *a1, const char *a2, ...)
{
  return [a1 lastEventTime];
}

id objc_msgSend_leftThumbstickNoiseBuffer(void *a1, const char *a2, ...)
{
  return [a1 leftThumbstickNoiseBuffer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedRecoverySuggestion(void *a1, const char *a2, ...)
{
  return [a1 localizedRecoverySuggestion];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_numberOfTimesToSendZeroHapticReport(void *a1, const char *a2, ...)
{
  return [a1 numberOfTimesToSendZeroHapticReport];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_params(void *a1, const char *a2, ...)
{
  return [a1 params];
}

id objc_msgSend_queuedTransients(void *a1, const char *a2, ...)
{
  return [a1 queuedTransients];
}

id objc_msgSend_ready(void *a1, const char *a2, ...)
{
  return [a1 ready];
}

id objc_msgSend_refreshCalibrationData(void *a1, const char *a2, ...)
{
  return [a1 refreshCalibrationData];
}

id objc_msgSend_refreshDeviceInfo(void *a1, const char *a2, ...)
{
  return [a1 refreshDeviceInfo];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rightThumbstickNoiseBuffer(void *a1, const char *a2, ...)
{
  return [a1 rightThumbstickNoiseBuffer];
}

id objc_msgSend_scheduleIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 scheduleIdleTimer];
}

id objc_msgSend_sendBatteryReport(void *a1, const char *a2, ...)
{
  return [a1 sendBatteryReport];
}

id objc_msgSend_setupRawReportHandling(void *a1, const char *a2, ...)
{
  return [a1 setupRawReportHandling];
}

id objc_msgSend_shouldCreateBatteryDevice(void *a1, const char *a2, ...)
{
  return [a1 shouldCreateBatteryDevice];
}

id objc_msgSend_shouldDisconnectWhenIdle(void *a1, const char *a2, ...)
{
  return [a1 shouldDisconnectWhenIdle];
}

id objc_msgSend_stopHaptics(void *a1, const char *a2, ...)
{
  return [a1 stopHaptics];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_tokenAndParams(void *a1, const char *a2, ...)
{
  return [a1 tokenAndParams];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_updateClientBattery(void *a1, const char *a2, ...)
{
  return [a1 updateClientBattery];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueForNoteParam_inParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForNoteParam:inParameters:");
}