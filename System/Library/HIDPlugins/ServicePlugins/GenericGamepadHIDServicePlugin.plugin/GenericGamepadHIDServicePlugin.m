uint64_t sub_3174()
{
  if (qword_1F2B8 != -1) {
    dispatch_once(&qword_1F2B8, &stru_18558);
  }
  return byte_1F2B0;
}

void sub_31B8(id a1)
{
  byte_1F2B0 = os_variant_has_internal_diagnostics();
}

id sub_31E0()
{
  if (qword_1F2C8 != -1) {
    dispatch_once(&qword_1F2C8, &stru_18578);
  }
  v0 = (void *)qword_1F2C0;

  return v0;
}

void sub_3234(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  v2 = (void *)qword_1F2C0;
  qword_1F2C0 = (uint64_t)v1;
}

id sub_3278()
{
  if (qword_1F2D8 != -1) {
    dispatch_once(&qword_1F2D8, &stru_18598);
  }
  v0 = (void *)qword_1F2D0;

  return v0;
}

void sub_32CC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "monitor");
  v2 = (void *)qword_1F2D0;
  qword_1F2D0 = (uint64_t)v1;
}

id sub_3310()
{
  if (qword_1F2E8 != -1) {
    dispatch_once(&qword_1F2E8, &stru_185B8);
  }
  v0 = (void *)qword_1F2E0;

  return v0;
}

void sub_3364(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "init");
  v2 = (void *)qword_1F2E0;
  qword_1F2E0 = (uint64_t)v1;
}

id sub_33A8()
{
  if (qword_1F2F8 != -1) {
    dispatch_once(&qword_1F2F8, &stru_185D8);
  }
  v0 = (void *)qword_1F2F0;

  return v0;
}

void sub_33FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "analytics");
  v2 = (void *)qword_1F2F0;
  qword_1F2F0 = (uint64_t)v1;
}

id sub_3440()
{
  if (qword_1F308 != -1) {
    dispatch_once(&qword_1F308, &stru_185F8);
  }
  v0 = (void *)qword_1F300;

  return v0;
}

void sub_3494(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Daemon", "default");
  v2 = (void *)qword_1F300;
  qword_1F300 = (uint64_t)v1;
}

void sub_34D8(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)qword_1F310;
  qword_1F310 = (uint64_t)v1;
}

id sub_3518()
{
  if (qword_1F318 != -1) {
    dispatch_once(&qword_1F318, &stru_18618);
  }
  v0 = (void *)qword_1F310;

  return v0;
}

void sub_356C(id a1)
{
  if (!qword_1F310) {
    objc_storeStrong((id *)&qword_1F310, &_os_log_default);
  }
}

id sub_3590()
{
  if (qword_1F328 != -1) {
    dispatch_once(&qword_1F328, &stru_18638);
  }
  v0 = (void *)qword_1F320;

  return v0;
}

void sub_35E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  v2 = (void *)qword_1F320;
  qword_1F320 = (uint64_t)v1;
}

id sub_3628()
{
  if (qword_1F338 != -1) {
    dispatch_once(&qword_1F338, &stru_18658);
  }
  v0 = (void *)qword_1F330;

  return v0;
}

void sub_367C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Haptics", "default");
  v2 = (void *)qword_1F330;
  qword_1F330 = (uint64_t)v1;
}

id sub_36C0()
{
  if (qword_1F348 != -1) {
    dispatch_once(&qword_1F348, &stru_18678);
  }
  v0 = (void *)qword_1F340;

  return v0;
}

void sub_3714(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  v2 = (void *)qword_1F340;
  qword_1F340 = (uint64_t)v1;
}

id sub_3758()
{
  if (qword_1F358 != -1) {
    dispatch_once(&qword_1F358, &stru_18698);
  }
  v0 = (void *)qword_1F350;

  return v0;
}

void sub_37AC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.runtime-issues", "GameController");
  v2 = (void *)qword_1F350;
  qword_1F350 = (uint64_t)v1;
}

NSXPCInterface *sub_37F0()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCGameIntentServiceClientInterface];
}

NSXPCInterface *sub_3804()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCGameIntentServiceServerInterface];
}

NSObject *sub_3818(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
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

void sub_3AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3AD0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_3518();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Connection to com.apple.GameController.gamecontrollerd.driver invalidated", v3, 2u);
  }

  [WeakRetained setInterruptionHandler:0];
  [WeakRetained setInvalidationHandler:0];
  [WeakRetained invalidate];
}

void sub_3B68(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_3518();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Connection to com.apple.GameController.gamecontrollerd.driver interrupted.  Attempting to re-establish.", v4, 2u);
  }

  v3 = [WeakRetained remoteObjectProxy];
  [v3 driverCheckIn];
}

void sub_3FF4(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a3 | a2)
  {
    switch(a2)
    {
      case 3:
        v5 = sub_3518();
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
        v5 = sub_3518();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          uint64_t v10 = a1;
          v6 = "BTSessionEventCallback: terminated session = %p";
          goto LABEL_15;
        }
        break;
      case 1:
        v5 = sub_3518();
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
  v8 = sub_3518();
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

void sub_4338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_4350(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4360(uint64_t a1)
{
}

void sub_4368(uint64_t a1)
{
  v2 = +[NSString stringWithCString:dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)) encoding:4];
  v3 = sub_3518();
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

BOOL sub_4760(id a1, NSDictionary *a2, NSDictionary *a3)
{
  v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(NSDictionary *)v3 objectForKeyedSubscript:@"DeviceUsagePage"];
    v5 = [(NSDictionary *)v3 objectForKeyedSubscript:@"DeviceUsage"];
    char v6 = (![v4 isEqual:&off_19998]
       || ([v5 isEqual:&off_199B0] & 1) == 0)
      && (![v4 isEqual:&off_19998]
       || ([v5 isEqual:&off_199C8] & 1) == 0)
      && (![v4 isEqual:&off_19998]
       || ([v5 isEqual:&off_19998] & 1) == 0);
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

void sub_4CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4CFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_3518();
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

void sub_4EF0(uint64_t a1)
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

void sub_594C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 560);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_59F4;
  v7[3] = &unk_18750;
  v7[4] = v2;
  uint64_t v4 = sub_3818(0x6FC23AC00uLL, 0x3B9ACA00uLL, v3, v7);
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v4;
}

id sub_59F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateIdleState];
}

void sub_5BD8(id a1)
{
}

void sub_5C48(uint64_t a1, void *a2, int a3)
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

uint64_t sub_5CF8(uint64_t result)
{
  if (result) {
    return *(void *)(result + 656);
  }
  return result;
}

id sub_5E4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchEvent:*(void *)(a1 + 40)];
}

id sub_5F88(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchIdleEvent:*(void *)(a1 + 40)];
}

void sub_70E0(uint64_t a1)
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
        v7[2] = sub_71D4;
        v7[3] = &unk_186C0;
        objc_copyWeak(&v8, v1);
        uint64_t v5 = sub_3818(0xF4240uLL, 0x186A0uLL, tv_sec, v7);
        tv_nsec = (void *)v3[33].tv_nsec;
        v3[33].tv_nsec = v5;

        objc_destroyWeak(&v8);
      }
    }
  }
}

void sub_71D4(uint64_t a1)
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
      v3 = sub_3518();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
      if (v2)
      {
        if (v4) {
          sub_FDB0(v3);
        }

        *((_DWORD *)WeakRetained + 123) = 0;
        [WeakRetained dispatchHapticEvent];
      }
      else
      {
        if (v4) {
          sub_FDF4(v3);
        }

        [WeakRetained stopHaptics];
      }
    }
  }
}

NSXPCInterface *sub_7E00()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCMotionServiceClientInterface];
}

NSXPCInterface *sub_7E14()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCMotionServiceServerInterface];
}

NSXPCInterface *sub_7E28()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceClientInterface];
}

NSXPCInterface *sub_7E3C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceServerInterface];
}

id sub_7E50()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GCDriverClientInterface];
  os_log_t v1 = sub_7E28();
  [v0 setInterface:v1 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  unsigned __int8 v2 = sub_7E3C();
  [v0 setInterface:v2 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v3 = sub_F5E8();
  [v0 setInterface:v3 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  BOOL v4 = sub_F5FC();
  [v0 setInterface:v4 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  unsigned long long v5 = sub_F5C0();
  [v0 setInterface:v5 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  char v6 = sub_F5D4();
  [v0 setInterface:v6 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  id v7 = sub_7E00();
  [v0 setInterface:v7 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  id v8 = sub_7E14();
  [v0 setInterface:v8 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  int v9 = sub_FCE8();
  [v0 setInterface:v9 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  uint64_t v10 = sub_FCFC();
  [v0 setInterface:v10 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v11 = sub_37F0();
  [v0 setInterface:v11 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v12 = sub_3804();
  [v0 setInterface:v12 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v13 = GCGenericDeviceDriverConfigurationServiceClientInterface();
  [v0 setInterface:v13 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v14 = GCGenericDeviceDriverConfigurationServiceServerInterface();
  [v0 setInterface:v14 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *sub_810C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GCDriverServerInterface];
}

void sub_8120()
{
}

uint64_t sub_812C(uint64_t a1, uint64_t a2)
{
  kern_return_t ParentEntry;
  NSObject *v4;
  io_registry_entry_t parent;
  char className[136];

  self;
  IOObjectRetain(a2);
  if (a2)
  {
    while (!IOObjectConformsTo(a2, "IOHIDDevice"))
    {
      memset(className, 0, 128);
      IOObjectGetClass(a2, className);
      parent = 0;
      ParentEntry = IORegistryEntryGetParentEntry(a2, "IOService", &parent);
      IOObjectRelease(a2);
      if (ParentEntry)
      {
        BOOL v4 = sub_3518();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_FE38();
        }

        return 0;
      }
      a2 = parent;
      if (!parent) {
        return a2;
      }
    }
  }
  return a2;
}

void sub_851C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_87D4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) device];
  unsigned __int8 v2 = objc_msgSend(v3, "gc_snapshot");
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void sub_8910(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    unsigned __int8 v2 = [*(id *)(a1 + 40) dispatchQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_8AA0;
    block[3] = &unk_187E8;
    int8x16_t v8 = *(int8x16_t *)(a1 + 32);
    id v3 = (id)v8.i64[0];
    int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
    id v11 = *(id *)(a1 + 48);
    dispatch_async(v2, block);
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = GCGenericDeviceErrorDomain;
    NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v13 = @"'model' can not be nil.";
    char v6 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v7 = +[NSError errorWithDomain:v5 code:1 userInfo:v6];
    (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v7);
  }
}

void sub_8AA0(void *a1)
{
  unsigned __int8 v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  v5[0] = 0;
  objc_msgSend(v2, "_onqueue_configureWithModel:error:", v3, v5);
  id v4 = v5[0];
  (*(void (**)(void))(a1[6] + 16))();
}

void sub_9718(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_9734(id a1, NSString *a2, HIDElement *a3, BOOL *a4)
{
  uint64_t v5 = a2;
  char v6 = a3;
  id v7 = sub_3518();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1004C();
  }
}

BOOL sub_97A4(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = sub_A8E4;
    v33 = sub_A910;
    id v34 = 0;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_A968;
    v28[3] = &unk_188E0;
    v28[4] = a1;
    v28[5] = &v29;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_AC50;
    v25[3] = &unk_18908;
    v26 = &stru_18890;
    char v6 = objc_retainBlock(v28);
    id v27 = v6;
    id v7 = objc_retainBlock(v25);
    int8x16_t v8 = objc_retainBlock(v7);
    int v9 = (void *)v30[5];
    v30[5] = (uint64_t)v8;

    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = sub_AE18;
    v23 = sub_AE28;
    id v24 = 0;
    int8x16_t v10 = [v5 properties];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_AE30;
    v15[3] = &unk_18958;
    v17 = &v19;
    id v11 = v7;
    id v16 = v11;
    objc_copyWeak(&v18, &location);
    [v10 enumerateObjectsUsingBlock:v15];

    NSErrorUserInfoKey v12 = (void *)v20[5];
    BOOL v13 = v12 == 0;
    if (a3 && v12) {
      *a3 = v12;
    }
    objc_destroyWeak(&v18);

    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v29, 8);

    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void sub_9A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose((const void *)(v17 - 136), 8);
  objc_destroyWeak((id *)(v17 - 88));
  _Unwind_Resume(a1);
}

BOOL sub_9A7C(uint64_t a1, void *a2, void *a3)
{
  id v33 = a2;
  if (a1)
  {
    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x3032000000;
    v67 = sub_A8E4;
    v68 = sub_A910;
    id v69 = 0;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_B2C0;
    v63[3] = &unk_189A8;
    v63[4] = a1;
    id v4 = objc_retainBlock(v63);
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    v62[2] = sub_B5A8;
    v62[3] = &unk_189D0;
    v62[4] = a1;
    id v5 = objc_retainBlock(v62);
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_B908;
    v61[3] = &unk_18A68;
    v61[4] = &v64;
    char v6 = objc_retainBlock(v61);
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_BE94;
    v60[3] = &unk_18AB8;
    v60[4] = &v64;
    id v7 = objc_retainBlock(v60);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_C130;
    v59[3] = &unk_18AE0;
    v59[4] = &v64;
    int8x16_t v8 = objc_retainBlock(v59);
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_C3CC;
    v58[3] = &unk_18B30;
    v58[4] = &v64;
    int v9 = objc_retainBlock(v58);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_C858;
    v57[3] = &unk_18B80;
    v57[4] = &v64;
    int8x16_t v10 = objc_retainBlock(v57);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_CF88;
    v56[3] = &unk_18BD0;
    v56[4] = &v64;
    id v11 = objc_retainBlock(v56);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_DA84;
    v55[3] = &unk_188E0;
    v55[4] = a1;
    v55[5] = &v64;
    NSErrorUserInfoKey v12 = objc_retainBlock(v55);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_DD6C;
    v44[3] = &unk_18BF8;
    v32 = v4;
    id v45 = v32;
    uint64_t v31 = v5;
    id v46 = v31;
    v30 = v6;
    id v47 = v30;
    v48 = &stru_189F0;
    uint64_t v29 = v7;
    id v49 = v29;
    BOOL v13 = v8;
    id v50 = v13;
    v14 = v9;
    id v51 = v14;
    v15 = v10;
    id v52 = v15;
    id v16 = v11;
    id v53 = v16;
    uint64_t v17 = v12;
    id v54 = v17;
    id v18 = objc_retainBlock(v44);
    uint64_t v19 = objc_retainBlock(v18);
    v20 = (void *)v65[5];
    v65[5] = (uint64_t)v19;

    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = sub_AE18;
    v42 = sub_AE28;
    id v43 = 0;
    uint64_t v21 = v33;
    v22 = [v33 gamepadEventFields];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_E074;
    v35[3] = &unk_18C48;
    v37 = &v38;
    v23 = v18;
    v35[4] = a1;
    id v36 = v23;
    [v22 enumerateObjectsUsingBlock:v35];

    id v24 = (void *)v39[5];
    BOOL v25 = v24 == 0;
    if (v24)
    {
      if (a3) {
        *a3 = v24;
      }
    }
    else
    {
      v26 = *(void **)(a1 + 712);
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_E360;
      v34[3] = &unk_18C68;
      v34[4] = a1;
      [v26 setBatchInputElementHandler:v34];
    }

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(&v64, 8);
  }
  else
  {
    BOOL v25 = 0;
    uint64_t v21 = v33;
  }

  return v25;
}

void sub_A090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_A0B8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = v4;
  if (a1)
  {
    [v4 dispatchFrequency];
    objc_msgSend((id)a1, "setHapticDispatchFrequency:");
    char v6 = [v5 actuators];
    id v7 = objc_msgSend(v6, "gc_arrayByTransformingElementsUsingBlock:", &stru_18CA8);
    [(id)a1 setHapticMotors:v7];

    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472;
    v90[2] = sub_E664;
    v90[3] = &unk_18CF8;
    v90[4] = a1;
    int8x16_t v8 = objc_retainBlock(v90);
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_E904;
    v89[3] = &unk_18D40;
    v89[4] = a1;
    int v9 = objc_retainBlock(v89);
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_EC58;
    v86[3] = &unk_18D68;
    int8x16_t v10 = v8;
    id v87 = v10;
    id v11 = v9;
    id v88 = v11;
    NSErrorUserInfoKey v12 = objc_retainBlock(v86);
    BOOL v13 = +[NSMapTable strongToStrongObjectsMapTable];
    id v14 = objc_alloc_init((Class)NSMutableArray);
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v15 = [v5 outputs];
    id v16 = [v15 countByEnumeratingWithState:&v82 objects:v98 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v83;
      v65 = v14;
      id v61 = v15;
      uint64_t v53 = *(void *)v83;
      uint64_t v54 = a1;
LABEL_4:
      uint64_t v18 = 0;
      id v55 = v16;
      while (1)
      {
        if (*(void *)v83 != v17)
        {
          uint64_t v19 = v18;
          objc_enumerationMutation(v15);
          uint64_t v18 = v19;
        }
        uint64_t v60 = v18;
        v20 = *(void **)(*((void *)&v82 + 1) + 8 * v18);
        uint64_t v21 = sub_3518();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v97 = v20;
          _os_log_debug_impl(&dword_0, v21, OS_LOG_TYPE_DEBUG, "Processing rumble output model %@", buf, 0xCu);
        }

        v63 = [v20 elementIdentifier];
        uint64_t v22 = objc_msgSend(*(id *)(a1 + 736), "objectForKeyedSubscript:");
        if (!v22) {
          break;
        }
        v23 = (void *)v22;
        uint64_t Length = _IOHIDElementGetLength();
        if (Length >= 65)
        {
          if (a3)
          {
            uint64_t v52 = GCGenericDeviceErrorDomain;
            v93[0] = @"Invalid Element.";
            v92[0] = NSLocalizedDescriptionKey;
            v92[1] = NSLocalizedFailureReasonErrorKey;
            v48 = +[NSString stringWithFormat:@"Element with identifier %@ has too large length: %zi.", v63, Length];
            v93[1] = v48;
            id v49 = +[NSDictionary dictionaryWithObjects:v93 forKeys:v92 count:2];
            uint64_t v50 = v52;
            uint64_t v51 = 0;
LABEL_34:
            *a3 = +[NSError errorWithDomain:v50 code:v51 userInfo:v49];

            id v14 = v65;
            id v15 = v61;
          }
          goto LABEL_35;
        }
        id v67 = [objc_alloc((Class)NSMutableData) initWithLength:Length];
        v62 = v23;
        objc_msgSend(v13, "setObject:forKey:");
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id obj = [v20 fields];
        id v25 = [obj countByEnumeratingWithState:&v78 objects:v91 count:16];
        if (v25)
        {
          id v26 = v25;
          uint64_t v27 = *(void *)v79;
          v58 = v10;
          v59 = v5;
          v56 = v13;
          v57 = v11;
          while (2)
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v79 != v27) {
                objc_enumerationMutation(obj);
              }
              uint64_t v29 = *(void **)(*((void *)&v78 + 1) + 8 * i);
              v30 = [v29 valueExpression];
              uint64_t v31 = [v30 buildPullExpressionWithOverrideBuilder:v12 error:a3];

              if (!v31) {
                goto LABEL_26;
              }
              v32 = [v29 offsetExpression];
              id v33 = [v32 buildPullExpressionWithOverrideBuilder:v12 error:a3];

              if (!v33) {
                goto LABEL_25;
              }
              id v34 = [v29 sizeExpression];
              v35 = [v34 buildPullExpressionWithOverrideBuilder:v12 error:a3];

              if (!v35)
              {

LABEL_25:
LABEL_26:

                uint64_t v44 = 0;
                int8x16_t v10 = v58;
                id v5 = v59;
                BOOL v13 = v56;
                id v11 = v57;
                id v14 = v65;
                id v15 = v61;
                goto LABEL_27;
              }
              v73[0] = _NSConcreteStackBlock;
              v73[1] = 3221225472;
              v73[2] = sub_ED14;
              v73[3] = &unk_18D90;
              id v76 = v33;
              id v77 = v35;
              id v75 = v31;
              v73[4] = v29;
              id v74 = v67;
              id v36 = v35;
              id v37 = v33;
              id v38 = v31;
              v39 = objc_retainBlock(v73);
              [v65 addObject:v39];
            }
            id v26 = [obj countByEnumeratingWithState:&v78 objects:v91 count:16];
            int8x16_t v10 = v58;
            id v5 = v59;
            BOOL v13 = v56;
            id v11 = v57;
            id v14 = v65;
            id v15 = v61;
            if (v26) {
              continue;
            }
            break;
          }
        }

        uint64_t v18 = v60 + 1;
        a1 = v54;
        uint64_t v17 = v53;
        if ((id)(v60 + 1) == v55)
        {
          id v16 = [v15 countByEnumeratingWithState:&v82 objects:v98 count:16];
          if (v16) {
            goto LABEL_4;
          }
          goto LABEL_23;
        }
      }
      v23 = 0;
      if (a3)
      {
        uint64_t v47 = GCGenericDeviceErrorDomain;
        v95[0] = @"Invalid Rumble Output.";
        v94[0] = NSLocalizedDescriptionKey;
        v94[1] = NSLocalizedFailureReasonErrorKey;
        v48 = +[NSString stringWithFormat:@"Not tracking any output element with identifier %@", v63];
        v95[1] = v48;
        id v49 = +[NSDictionary dictionaryWithObjects:v95 forKeys:v94 count:2];
        uint64_t v50 = v47;
        uint64_t v51 = 2;
        goto LABEL_34;
      }
LABEL_35:

      uint64_t v44 = 0;
LABEL_27:
      id v45 = v63;
      goto LABEL_28;
    }
LABEL_23:

    uint64_t v40 = [(id)a1 device];
    uint64_t v41 = sub_5CF8(a1);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_EECC;
    v68[3] = &unk_18DB8;
    id v69 = v13;
    id v71 = v40;
    uint64_t v72 = v41;
    id v70 = v14;
    id v15 = v40;
    v42 = objc_retainBlock(v68);
    id v43 = *(void **)(a1 + 744);
    *(void *)(a1 + 744) = v42;

    uint64_t v44 = 1;
    id v45 = v69;
LABEL_28:
  }
  else
  {
    uint64_t v44 = 0;
  }

  return v44;
}

id sub_A8E4(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_A910(uint64_t a1)
{
}

NSError *__cdecl sub_A918(id a1, GCGenericDeviceDataConstantExpressionModel *a2, id a3)
{
  id v5 = a3;
  [(GCGenericDeviceDataConstantExpressionModel *)a2 value];
  (*((void (**)(id))a3 + 2))(v5);

  return 0;
}

id sub_A968(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 elementIdentifier];
  int8x16_t v8 = [*(id *)(*(void *)(a1 + 32) + 696) objectForKeyedSubscript:v7];
  BOOL v9 = v8 != 0;

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v11 = [v5 trueExpression];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_ABD8;
  v24[3] = &unk_188B8;
  id v26 = v30;
  id v12 = v6;
  BOOL v28 = v9;
  id v25 = v12;
  uint64_t v27 = v29;
  BOOL v13 = (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v11, v24);
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v17 = [v5 falseExpression];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_AC14;
    v19[3] = &unk_188B8;
    uint64_t v21 = v29;
    BOOL v23 = v9;
    id v20 = v12;
    uint64_t v22 = v30;
    (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v19);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);

  return v15;
}

void sub_ABB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_ABD8(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 48);
  }
  return (*(uint64_t (**)(double))(v3 + 16))(*(double *)(*(void *)(v4 + 8) + 24));
}

uint64_t sub_AC14(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v4 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  return (*(uint64_t (**)(double))(v3 + 16))(*(double *)(*(void *)(v4 + 8) + 24));
}

id sub_AC50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    uint64_t v15 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    if (v8 != objc_opt_class())
    {
      uint64_t v9 = GCGenericDeviceErrorDomain;
      uint64_t v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      id v12 = +[NSString stringWithFormat:@"Unsupported expression class: %@.", v11, NSLocalizedDescriptionKey, NSLocalizedFailureReasonErrorKey, @"Invalid expression."];
      v18[1] = v12;
      BOOL v13 = +[NSDictionary dictionaryWithObjects:v18 forKeys:&v17 count:2];
      id v14 = +[NSError errorWithDomain:v9 code:2 userInfo:v13];

      goto LABEL_7;
    }
    uint64_t v15 = *(void *)(a1 + 40);
  }
  id v14 = (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v5, v6);
LABEL_7:

  return v14;
}

uint64_t sub_AE18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_AE28(uint64_t a1)
{
}

void sub_AE30(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = sub_3518();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100D0();
  }

  uint64_t v7 = [v5 name];
  if (v7)
  {
    if (([&off_199E8 containsObject:v7] & 1) == 0)
    {
      v32[0] = NSLocalizedDescriptionKey;
      v32[1] = NSLocalizedFailureReasonErrorKey;
      v33[0] = @"Invalid property";
      uint64_t v22 = +[NSString stringWithFormat:@"Property '%@' is not supported.", v7];
      v33[1] = v22;
      BOOL v23 = +[NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
      uint64_t v24 = +[NSError errorWithDomain:GCGenericDeviceErrorDomain code:2 userInfo:v23];
      uint64_t v25 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v26 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v24;
    }
    uint64_t v8 = [v5 valueExpression];
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_B1F4;
      v27[3] = &unk_18930;
      objc_copyWeak(&v29, (id *)(a1 + 48));
      id v28 = v7;
      uint64_t v10 = (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v8, v27);
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (v13)
      {
        v30[0] = NSLocalizedDescriptionKey;
        v30[1] = NSLocalizedFailureReasonErrorKey;
        v31[0] = @"Invalid property";
        v31[1] = @"Invalid value expression.";
        v30[2] = NSUnderlyingErrorKey;
        v31[2] = v13;
        id v14 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];
        uint64_t v15 = +[NSError errorWithDomain:GCGenericDeviceErrorDomain code:2 userInfo:v14];
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        *a3 = 1;
      }

      objc_destroyWeak(&v29);
    }
  }
  else
  {
    v34[0] = NSLocalizedDescriptionKey;
    v34[1] = NSLocalizedFailureReasonErrorKey;
    v35[0] = @"Invalid property";
    v35[1] = @"Property has no name.";
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    uint64_t v19 = +[NSError errorWithDomain:GCGenericDeviceErrorDomain code:2 userInfo:v18];
    uint64_t v20 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    *a3 = 1;
  }
}

void sub_B1D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_B1F4(uint64_t a1, double a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v7 = WeakRetained;
    id v5 = WeakRetained[88];
    objc_sync_enter(v5);
    id v6 = +[NSNumber numberWithDouble:a2];
    [v7[88] setObject:v6 forKeyedSubscript:*(void *)(a1 + 32)];

    objc_sync_exit(v5);
    id WeakRetained = v7;
  }
}

void sub_B2AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_B2C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 elementIdentifier];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 720) objectForKeyedSubscript:v7];
  if (v8)
  {
    if ((unint64_t)[v5 scaleType] + 3 <= 5)
    {
      id v9 = [v5 scaleType];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      void v18[2] = sub_B598;
      v18[3] = &unk_18980;
      uint64_t v10 = (void (**)(void))v6;
      id v19 = v10;
      uint64_t v11 = [v8 registerScaled:v9 valueChangedHandler:v18];
      [*(id *)(*(void *)(a1 + 32) + 728) addObject:v11];

      objc_msgSend(v8, "scaledValue:", objc_msgSend(v5, "scaleType"));
      v10[2](v10);
      id v12 = 0;
      goto LABEL_6;
    }
    uint64_t v17 = GCGenericDeviceErrorDomain;
    v20[0] = NSLocalizedDescriptionKey;
    v20[1] = NSLocalizedFailureReasonErrorKey;
    v21[0] = @"Invalid 'Input Element Value' expression.";
    v21[1] = @"Unsupported valueType.";
    id v14 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
    id v12 = +[NSError errorWithDomain:v17 code:2 userInfo:v14];
  }
  else
  {
    uint64_t v13 = GCGenericDeviceErrorDomain;
    v23[0] = @"Invalid 'Input Element Value' expression.";
    v22[0] = NSLocalizedDescriptionKey;
    v22[1] = NSLocalizedFailureReasonErrorKey;
    id v14 = +[NSString stringWithFormat:@"Not tracking any element with identifier %@", v7];
    v23[1] = v14;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];
    id v12 = +[NSError errorWithDomain:v13 code:2 userInfo:v15];
  }
LABEL_6:

  return v12;
}

uint64_t sub_B598(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_B5A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = [v6 elementIdentifier];
  uint64_t v8 = [v6 attribute];

  id v9 = [*(id *)(*(void *)(a1 + 32) + 720) objectForKeyedSubscript:v7];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 element];
    id v12 = [v11 valueForElementKey:v8];

    if (v12)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v12 doubleValue];
        v5[2](v5);
        uint64_t v13 = 0;
        goto LABEL_10;
      }
      uint64_t v16 = GCGenericDeviceErrorDomain;
      v21[0] = NSLocalizedDescriptionKey;
      v21[1] = NSLocalizedFailureReasonErrorKey;
      v22[0] = @"Invalid 'Input Element Attribute' expression.";
      uint64_t v15 = +[NSString stringWithFormat:@"Element with identifier '%@' has an '%@' attribute, but it's not a number.", v7, v8];
      v22[1] = v15;
      uint64_t v17 = v22;
      uint64_t v18 = v21;
    }
    else
    {
      uint64_t v16 = GCGenericDeviceErrorDomain;
      v23[0] = NSLocalizedDescriptionKey;
      v23[1] = NSLocalizedFailureReasonErrorKey;
      v24[0] = @"Invalid 'Input Element Attribute' expression.";
      uint64_t v15 = +[NSString stringWithFormat:@"Element with identifier '%@' does not have a '%@' attribute.", v7, v8];
      v24[1] = v15;
      uint64_t v17 = v24;
      uint64_t v18 = v23;
    }
    id v19 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v18 count:2];
    uint64_t v13 = +[NSError errorWithDomain:v16 code:2 userInfo:v19];
  }
  else
  {
    uint64_t v14 = GCGenericDeviceErrorDomain;
    v25[0] = NSLocalizedDescriptionKey;
    v25[1] = NSLocalizedFailureReasonErrorKey;
    v26[0] = @"Invalid 'Input Element Attribute' expression.";
    id v12 = +[NSString stringWithFormat:@"Not tracking any element with identifier %@", v7];
    v26[1] = v12;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:2];
    uint64_t v13 = +[NSError errorWithDomain:v14 code:2 userInfo:v15];
  }

LABEL_10:

  return v13;
}

NSError *__cdecl sub_B8B8(id a1, GCGenericDeviceDataConstantExpressionModel *a2, id a3)
{
  id v5 = a3;
  [(GCGenericDeviceDataConstantExpressionModel *)a2 value];
  (*((void (**)(id))a3 + 2))(v5);

  return 0;
}

id sub_B908(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v53[3] = 0;
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v52[3] = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v8 = [v5 inputExpression];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_BD14;
  v44[3] = &unk_18A18;
  id v46 = v53;
  uint64_t v47 = v52;
  id v9 = v6;
  id v45 = v9;
  v48 = v51;
  id v49 = v50;
  uint64_t v10 = (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v44);
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v14 = [v5 maskExpression];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_BD74;
    v38[3] = &unk_18A18;
    uint64_t v40 = v52;
    uint64_t v41 = v53;
    id v15 = v9;
    id v39 = v15;
    v42 = v51;
    id v43 = v50;
    uint64_t v16 = (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v14, v38);
    uint64_t v17 = v16;
    if (v16)
    {
      id v12 = v16;
    }
    else
    {
      uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v25 = [v5 trueExpression];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      void v32[2] = sub_BDD4;
      v32[3] = &unk_18A40;
      id v34 = v51;
      v35 = v53;
      id v36 = v52;
      id v19 = v15;
      id v33 = v19;
      id v37 = v50;
      uint64_t v20 = (*(void (**)(uint64_t, void *, void *))(v18 + 16))(v18, v25, v32);
      uint64_t v21 = v20;
      if (v20)
      {
        id v12 = v20;
      }
      else
      {
        uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        BOOL v23 = [v5 falseExpression];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        void v26[2] = sub_BE34;
        v26[3] = &unk_18A40;
        id v28 = v50;
        id v29 = v53;
        v30 = v52;
        id v27 = v19;
        uint64_t v31 = v51;
        (*(void (**)(uint64_t, void *, void *))(v22 + 16))(v22, v23, v26);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v52, 8);
  _Block_object_dispose(v53, 8);

  return v12;
}

void sub_BCD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 232), 8);
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_BD14(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  if (((uint64_t)rint(*(double *)(*(void *)(a1[6] + 8) + 24)) & (uint64_t)rint(*(double *)(*(void *)(a1[5] + 8)
                                                                                              + 24))) != 0)
    uint64_t v2 = a1[7];
  else {
    uint64_t v2 = a1[8];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], *(double *)(*(void *)(v2 + 8) + 24));
}

uint64_t sub_BD74(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v3 = a1[5];
  uint64_t v4 = (uint64_t)rint(*(double *)(*(void *)(a1[6] + 8) + 24));
  uint64_t v5 = a1[4];
  if (((uint64_t)rint(*(double *)(*(void *)(v3 + 8) + 24)) & v4) != 0) {
    uint64_t v6 = a1[7];
  }
  else {
    uint64_t v6 = a1[8];
  }
  return (*(uint64_t (**)(double))(v5 + 16))(*(double *)(*(void *)(v6 + 8) + 24));
}

uint64_t sub_BDD4(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v3 = (uint64_t)rint(*(double *)(*(void *)(a1[6] + 8) + 24));
  uint64_t v4 = (uint64_t)rint(*(double *)(*(void *)(a1[7] + 8) + 24));
  uint64_t v5 = a1[4];
  if ((v4 & v3) != 0) {
    uint64_t v6 = a1[5];
  }
  else {
    uint64_t v6 = a1[8];
  }
  return (*(uint64_t (**)(double))(v5 + 16))(*(double *)(*(void *)(v6 + 8) + 24));
}

uint64_t sub_BE34(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v3 = (uint64_t)rint(*(double *)(*(void *)(a1[6] + 8) + 24));
  uint64_t v4 = (uint64_t)rint(*(double *)(*(void *)(a1[7] + 8) + 24));
  uint64_t v5 = a1[4];
  if ((v4 & v3) != 0) {
    uint64_t v6 = a1[8];
  }
  else {
    uint64_t v6 = a1[5];
  }
  return (*(uint64_t (**)(double))(v5 + 16))(*(double *)(*(void *)(v6 + 8) + 24));
}

id sub_BE94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v25[0] = 0;
  v25[1] = v25;
  void v25[2] = 0x2020000000;
  v25[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  void v24[2] = 0x2020000000;
  v24[3] = 0;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v8 = [v5 leftExpression];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_C0C0;
  v20[3] = &unk_18A90;
  uint64_t v22 = v25;
  id v9 = v6;
  id v21 = v9;
  BOOL v23 = v24;
  uint64_t v10 = (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v20);
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v14 = [v5 rightExpression];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_C0F8;
    v16[3] = &unk_18A90;
    uint64_t v18 = v24;
    id v17 = v9;
    id v19 = v25;
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v14, v16);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);

  return v12;
}

void sub_C09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_C0C0(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], *(double *)(*(void *)(a1[5] + 8) + 24) * *(double *)(*(void *)(a1[6] + 8) + 24));
}

uint64_t sub_C0F8(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], *(double *)(*(void *)(a1[6] + 8) + 24) * *(double *)(*(void *)(a1[5] + 8) + 24));
}

id sub_C130(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v25[0] = 0;
  v25[1] = v25;
  void v25[2] = 0x2020000000;
  v25[3] = 0;
  v24[0] = 0;
  v24[1] = v24;
  void v24[2] = 0x2020000000;
  v24[3] = 0;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v8 = [v5 leftExpression];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_C35C;
  v20[3] = &unk_18A90;
  uint64_t v22 = v25;
  id v9 = v6;
  id v21 = v9;
  BOOL v23 = v24;
  uint64_t v10 = (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v20);
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v14 = [v5 rightExpression];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_C394;
    v16[3] = &unk_18A90;
    uint64_t v18 = v24;
    id v17 = v9;
    id v19 = v25;
    (*(void (**)(uint64_t, void *, void *))(v13 + 16))(v13, v14, v16);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v25, 8);

  return v12;
}

void sub_C338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_C35C(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], *(double *)(*(void *)(a1[5] + 8) + 24) + *(double *)(*(void *)(a1[6] + 8) + 24));
}

uint64_t sub_C394(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], *(double *)(*(void *)(a1[6] + 8) + 24) + *(double *)(*(void *)(a1[5] + 8) + 24));
}

id sub_C3CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  uint64_t v7 = [v5 minExpression];
  uint64_t v8 = [v5 maxExpression];
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v10 = [v5 inputExpression];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_C738;
  void v31[3] = &unk_18B08;
  BOOL v36 = v8 != 0;
  id v33 = v40;
  id v34 = v38;
  BOOL v37 = v7 != 0;
  v35 = v39;
  id v11 = v6;
  id v32 = v11;
  id v12 = (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v31);
  uint64_t v14 = v12;
  if (v12)
  {
    id v15 = v12;
    goto LABEL_10;
  }
  if (v7)
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_C798;
    v27[3] = &unk_18B08;
    v28[1] = v39;
    v28[2] = v40;
    BOOL v29 = v8 != 0;
    v28[3] = v38;
    BOOL v30 = v7 != 0;
    v28[0] = v11;
    (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v7, v27);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (id *)v28;
    if (v15 || !v8)
    {
LABEL_9:

      goto LABEL_10;
    }
LABEL_8:
    id v19 = v13;
    uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_C7F8;
    v20[3] = &unk_18B08;
    uint64_t v22 = v38;
    BOOL v23 = v40;
    BOOL v25 = v8 != 0;
    BOOL v26 = v7 != 0;
    uint64_t v24 = v39;
    id v21 = v11;
    (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v8, v20);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v13 = v19;
    if (!v7) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (v8) {
    goto LABEL_8;
  }
  id v15 = 0;
LABEL_10:

  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v40, 8);

  return v15;
}

void sub_C700(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_C738(uint64_t a1, __n128 a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2.n128_u64[0];
  a2.n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(double *)(v2 + 24) < a2.n128_f64[0]) {
      a2.n128_u64[0] = *(void *)(v2 + 24);
    }
  }
  if (*(unsigned char *)(a1 + 65))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(double *)(v3 + 24) >= a2.n128_f64[0]) {
      a2.n128_u64[0] = *(void *)(v3 + 24);
    }
  }
  return (*(uint64_t (**)(__n128))(*(void *)(a1 + 32) + 16))(a2);
}

uint64_t sub_C798(uint64_t a1, __n128 a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2.n128_u64[0];
  a2.n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(double *)(v2 + 24) < a2.n128_f64[0]) {
      a2.n128_u64[0] = *(void *)(v2 + 24);
    }
  }
  if (*(unsigned char *)(a1 + 65))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(double *)(v3 + 24) >= a2.n128_f64[0]) {
      a2.n128_u64[0] = *(void *)(v3 + 24);
    }
  }
  return (*(uint64_t (**)(__n128))(*(void *)(a1 + 32) + 16))(a2);
}

uint64_t sub_C7F8(uint64_t a1, __n128 a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2.n128_u64[0];
  a2.n128_u64[0] = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
    if (*(double *)(v2 + 24) < a2.n128_f64[0]) {
      a2.n128_u64[0] = *(void *)(v2 + 24);
    }
  }
  if (*(unsigned char *)(a1 + 65))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(double *)(v3 + 24) >= a2.n128_f64[0]) {
      a2.n128_u64[0] = *(void *)(v3 + 24);
    }
  }
  return (*(uint64_t (**)(__n128))(*(void *)(a1 + 32) + 16))(a2);
}

id sub_C858(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  v77[3] = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x2020000000;
  v76[3] = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x2020000000;
  v75[3] = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x2020000000;
  v74[3] = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x2020000000;
  v73[3] = 0;
  uint64_t v7 = [v5 inputMinExpression];
  uint64_t v8 = [v5 inputMaxExpression];
  BOOL v37 = [v5 outputMinExpression];
  BOOL v36 = [v5 outputMaxExpression];
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v10 = [v5 inputExpression];
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472;
  v66[2] = sub_CD88;
  v66[3] = &unk_18B58;
  v68 = v77;
  id v69 = v76;
  id v70 = v75;
  id v71 = v74;
  uint64_t v72 = v73;
  id v11 = v6;
  id v67 = v11;
  id v12 = (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v10, v66);
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_CDF0;
    v59[3] = &unk_18B58;
    id v61 = v76;
    v62 = v77;
    v63 = v75;
    uint64_t v64 = v74;
    v65 = v73;
    id v16 = v11;
    id v60 = v16;
    uint64_t v17 = (*(void (**)(uint64_t, void *, void *))(v15 + 16))(v15, v7, v59);
    uint64_t v18 = v17;
    if (v17)
    {
      id v14 = v17;
    }
    else
    {
      v35 = v8;
      uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_CE58;
      v52[3] = &unk_18B58;
      uint64_t v54 = v75;
      id v55 = v77;
      v56 = v76;
      v57 = v74;
      v58 = v73;
      id v20 = v16;
      id v53 = v20;
      id v21 = *(void (**)(uint64_t, void *, void *))(v19 + 16);
      uint64_t v22 = v19;
      uint64_t v8 = v35;
      BOOL v23 = v21(v22, v35, v52);
      if (v23)
      {
        uint64_t v24 = v23;
        id v14 = v23;
      }
      else
      {
        uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472;
        v45[2] = sub_CEC0;
        v45[3] = &unk_18B58;
        uint64_t v47 = v74;
        v48 = v77;
        id v49 = v76;
        uint64_t v50 = v75;
        uint64_t v51 = v73;
        id v26 = v20;
        id v46 = v26;
        id v27 = *(void (**)(uint64_t, void *, void *))(v25 + 16);
        uint64_t v28 = v25;
        uint64_t v8 = v35;
        BOOL v29 = v27(v28, v37, v45);
        if (v29)
        {
          BOOL v30 = v29;
          id v14 = v29;
        }
        else
        {
          uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_CF24;
          v38[3] = &unk_18B58;
          uint64_t v40 = v73;
          uint64_t v41 = v77;
          v42 = v76;
          id v43 = v75;
          uint64_t v44 = v74;
          id v39 = v26;
          id v32 = *(void (**)(uint64_t, void *, void *))(v31 + 16);
          uint64_t v33 = v31;
          uint64_t v8 = v35;
          v32(v33, v36, v38);
          id v14 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v30 = 0;
        }
        uint64_t v24 = 0;
      }
    }
  }

  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v74, 8);
  _Block_object_dispose(v75, 8);
  _Block_object_dispose(v76, 8);
  _Block_object_dispose(v77, 8);

  return v14;
}

void sub_CD34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose((const void *)(v64 - 232), 8);
  _Block_object_dispose((const void *)(v64 - 200), 8);
  _Block_object_dispose((const void *)(v64 - 168), 8);
  _Block_object_dispose((const void *)(v64 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_CD88(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  double v2 = *(double *)(*(void *)(a1[6] + 8) + 24);
  double v3 = (*(double *)(*(void *)(a1[5] + 8) + 24) - v2) / (*(double *)(*(void *)(a1[7] + 8) + 24) - v2);
  double v4 = *(double *)(*(void *)(a1[8] + 8) + 24);
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], v4 + fabs(v3) * (*(double *)(*(void *)(a1[9] + 8) + 24) - v4));
}

uint64_t sub_CDF0(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  double v2 = *(double *)(*(void *)(a1[5] + 8) + 24);
  double v3 = (*(double *)(*(void *)(a1[6] + 8) + 24) - v2) / (*(double *)(*(void *)(a1[7] + 8) + 24) - v2);
  double v4 = *(double *)(*(void *)(a1[8] + 8) + 24);
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], v4 + fabs(v3) * (*(double *)(*(void *)(a1[9] + 8) + 24) - v4));
}

uint64_t sub_CE58(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  double v2 = *(double *)(*(void *)(a1[7] + 8) + 24);
  double v3 = (*(double *)(*(void *)(a1[6] + 8) + 24) - v2) / (*(double *)(*(void *)(a1[5] + 8) + 24) - v2);
  double v4 = *(double *)(*(void *)(a1[8] + 8) + 24);
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], v4 + fabs(v3) * (*(double *)(*(void *)(a1[9] + 8) + 24) - v4));
}

uint64_t sub_CEC0(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  double v2 = *(double *)(*(void *)(a1[7] + 8) + 24);
  double v3 = (*(double *)(*(void *)(a1[6] + 8) + 24) - v2) / (*(double *)(*(void *)(a1[8] + 8) + 24) - v2);
  double v4 = *(double *)(*(void *)(a1[5] + 8) + 24);
  return (*(uint64_t (**)(double))(a1[4] + 16))(v4 + fabs(v3)
                                                               * (*(double *)(*(void *)(a1[9] + 8) + 24) - v4));
}

uint64_t sub_CF24(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  double v2 = *(double *)(*(void *)(a1[7] + 8) + 24);
  double v3 = (*(double *)(*(void *)(a1[6] + 8) + 24) - v2) / (*(double *)(*(void *)(a1[8] + 8) + 24) - v2);
  double v4 = *(double *)(*(void *)(a1[9] + 8) + 24);
  return (*(uint64_t (**)(double))(a1[4] + 16))(v4 + fabs(v3)
                                                               * (*(double *)(*(void *)(a1[5] + 8) + 24) - v4));
}

id sub_CF88(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x2020000000;
  v89[3] = 0;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  v88[3] = 0;
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x2020000000;
  v87[3] = 0;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x2020000000;
  v86[3] = 0;
  v85[0] = 0;
  v85[1] = v85;
  v85[2] = 0x2020000000;
  v85[3] = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  v84[3] = 0;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v35 = [v5 inputExpression];
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_D5D4;
  v76[3] = &unk_18BA8;
  long long v78 = v89;
  id v8 = v6;
  id v77 = v8;
  long long v79 = v87;
  long long v80 = v88;
  long long v81 = v86;
  long long v82 = v85;
  long long v83 = v84;
  uint64_t v9 = (*(void (**)(uint64_t, void *, void *))(v7 + 16))(v7, v35, v76);
  uint64_t v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v13 = [v5 inputMinExpression];
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472;
    v68[2] = sub_D69C;
    v68[3] = &unk_18BA8;
    id v70 = v88;
    id v14 = v8;
    id v69 = v14;
    id v71 = v89;
    uint64_t v72 = v87;
    v73 = v86;
    id v74 = v85;
    id v75 = v84;
    uint64_t v15 = (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v68);
    id v16 = v15;
    if (v15)
    {
      id v11 = v15;
    }
    else
    {
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      uint64_t v18 = [v5 inputMaxExpression];
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472;
      v60[2] = sub_D764;
      v60[3] = &unk_18BA8;
      v62 = v87;
      id v19 = v14;
      id v61 = v19;
      v63 = v89;
      uint64_t v64 = v88;
      v65 = v86;
      uint64_t v66 = v85;
      id v67 = v84;
      id v20 = (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v18, v60);
      id v21 = v20;
      if (v20)
      {
        id v11 = v20;
      }
      else
      {
        uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        id v34 = [v5 maskExpression];
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_D82C;
        v52[3] = &unk_18BA8;
        uint64_t v54 = v86;
        id v23 = v19;
        id v53 = v23;
        id v55 = v89;
        v56 = v87;
        v57 = v88;
        v58 = v85;
        v59 = v84;
        uint64_t v24 = (*(void (**)(uint64_t, void *, void *))(v22 + 16))(v22, v34, v52);
        uint64_t v25 = v24;
        if (v24)
        {
          id v11 = v24;
        }
        else
        {
          uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          uint64_t v33 = [v5 trueExpression];
          v44[0] = _NSConcreteStackBlock;
          v44[1] = 3221225472;
          v44[2] = sub_D8F4;
          v44[3] = &unk_18BA8;
          id v46 = v85;
          id v27 = v23;
          id v45 = v27;
          uint64_t v47 = v89;
          v48 = v87;
          id v49 = v88;
          uint64_t v50 = v86;
          uint64_t v51 = v84;
          uint64_t v28 = (*(void (**)(uint64_t, void *, void *))(v26 + 16))(v26, v33, v44);
          BOOL v29 = v28;
          if (v28)
          {
            id v11 = v28;
          }
          else
          {
            uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
            id v32 = [v5 falseExpression];
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_D9BC;
            v36[3] = &unk_18BA8;
            id v38 = v84;
            id v37 = v27;
            id v39 = v89;
            uint64_t v40 = v87;
            uint64_t v41 = v88;
            v42 = v86;
            id v43 = v85;
            (*(void (**)(uint64_t, void *, void *))(v30 + 16))(v30, v32, v36);
            id v11 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v25 = 0;
        }
      }
    }
  }
  _Block_object_dispose(v84, 8);
  _Block_object_dispose(v85, 8);
  _Block_object_dispose(v86, 8);
  _Block_object_dispose(v87, 8);
  _Block_object_dispose(v88, 8);
  _Block_object_dispose(v89, 8);

  return v11;
}

void sub_D580(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x258], 8);
  _Block_object_dispose((const void *)(v1 - 232), 8);
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_D5D4(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  double v2 = *(double *)(*(void *)(a1[7] + 8) + 24);
  double v3 = *(double *)(*(void *)(a1[6] + 8) + 24) - v2 + 1.0;
  double v4 = *(double *)(*(void *)(a1[5] + 8) + 24) - v2;
  if (v3 == 4.0)
  {
    double v4 = v4 + v4;
  }
  else if (v3 != 8.0)
  {
    double v4 = -1.0;
  }
  double v5 = rint(v4);
  if ((unint64_t)(uint64_t)v5 > 7) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_16EA8[(uint64_t)v5];
  }
  if (((uint64_t)rint(*(double *)(*(void *)(a1[8] + 8) + 24)) & v6) != 0) {
    uint64_t v7 = a1[9];
  }
  else {
    uint64_t v7 = a1[10];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], *(double *)(*(void *)(v7 + 8) + 24));
}

uint64_t sub_D69C(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  double v2 = *(double *)(*(void *)(a1[5] + 8) + 24);
  double v3 = *(double *)(*(void *)(a1[7] + 8) + 24) - v2 + 1.0;
  double v4 = *(double *)(*(void *)(a1[6] + 8) + 24) - v2;
  if (v3 == 4.0)
  {
    double v4 = v4 + v4;
  }
  else if (v3 != 8.0)
  {
    double v4 = -1.0;
  }
  double v5 = rint(v4);
  if ((unint64_t)(uint64_t)v5 > 7) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_16EA8[(uint64_t)v5];
  }
  if (((uint64_t)rint(*(double *)(*(void *)(a1[8] + 8) + 24)) & v6) != 0) {
    uint64_t v7 = a1[9];
  }
  else {
    uint64_t v7 = a1[10];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], *(double *)(*(void *)(v7 + 8) + 24));
}

uint64_t sub_D764(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  double v2 = *(double *)(*(void *)(a1[7] + 8) + 24);
  double v3 = *(double *)(*(void *)(a1[5] + 8) + 24) - v2 + 1.0;
  double v4 = *(double *)(*(void *)(a1[6] + 8) + 24) - v2;
  if (v3 == 4.0)
  {
    double v4 = v4 + v4;
  }
  else if (v3 != 8.0)
  {
    double v4 = -1.0;
  }
  double v5 = rint(v4);
  if ((unint64_t)(uint64_t)v5 > 7) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_16EA8[(uint64_t)v5];
  }
  if (((uint64_t)rint(*(double *)(*(void *)(a1[8] + 8) + 24)) & v6) != 0) {
    uint64_t v7 = a1[9];
  }
  else {
    uint64_t v7 = a1[10];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], *(double *)(*(void *)(v7 + 8) + 24));
}

uint64_t sub_D82C(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  double v2 = *(double *)(*(void *)(a1[8] + 8) + 24);
  double v3 = *(double *)(*(void *)(a1[7] + 8) + 24) - v2 + 1.0;
  double v4 = *(double *)(*(void *)(a1[6] + 8) + 24) - v2;
  if (v3 == 4.0)
  {
    double v4 = v4 + v4;
  }
  else if (v3 != 8.0)
  {
    double v4 = -1.0;
  }
  double v5 = rint(v4);
  if ((unint64_t)(uint64_t)v5 > 7) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_16EA8[(uint64_t)v5];
  }
  if (((uint64_t)rint(*(double *)(*(void *)(a1[5] + 8) + 24)) & v6) != 0) {
    uint64_t v7 = a1[9];
  }
  else {
    uint64_t v7 = a1[10];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], *(double *)(*(void *)(v7 + 8) + 24));
}

uint64_t sub_D8F4(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  double v2 = *(double *)(*(void *)(a1[8] + 8) + 24);
  double v3 = *(double *)(*(void *)(a1[7] + 8) + 24) - v2 + 1.0;
  double v4 = *(double *)(*(void *)(a1[6] + 8) + 24) - v2;
  if (v3 == 4.0)
  {
    double v4 = v4 + v4;
  }
  else if (v3 != 8.0)
  {
    double v4 = -1.0;
  }
  double v5 = rint(v4);
  if ((unint64_t)(uint64_t)v5 > 7) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_16EA8[(uint64_t)v5];
  }
  if (((uint64_t)rint(*(double *)(*(void *)(a1[9] + 8) + 24)) & v6) != 0) {
    uint64_t v7 = a1[5];
  }
  else {
    uint64_t v7 = a1[10];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], *(double *)(*(void *)(v7 + 8) + 24));
}

uint64_t sub_D9BC(void *a1, double a2)
{
  *(double *)(*(void *)(a1[5] + 8) + 24) = a2;
  double v2 = *(double *)(*(void *)(a1[8] + 8) + 24);
  double v3 = *(double *)(*(void *)(a1[7] + 8) + 24) - v2 + 1.0;
  double v4 = *(double *)(*(void *)(a1[6] + 8) + 24) - v2;
  if (v3 == 4.0)
  {
    double v4 = v4 + v4;
  }
  else if (v3 != 8.0)
  {
    double v4 = -1.0;
  }
  double v5 = rint(v4);
  if ((unint64_t)(uint64_t)v5 > 7) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_16EA8[(uint64_t)v5];
  }
  if (((uint64_t)rint(*(double *)(*(void *)(a1[9] + 8) + 24)) & v6) != 0) {
    uint64_t v7 = a1[10];
  }
  else {
    uint64_t v7 = a1[5];
  }
  return (*(uint64_t (**)(void, double))(a1[4] + 16))(a1[4], *(double *)(*(void *)(v7 + 8) + 24));
}

id sub_DA84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 elementIdentifier];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 720) objectForKeyedSubscript:v7];
  BOOL v9 = v8 != 0;

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  void v30[3] = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v11 = [v5 trueExpression];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  void v24[2] = sub_DCF4;
  v24[3] = &unk_188B8;
  uint64_t v26 = v30;
  id v12 = v6;
  BOOL v28 = v9;
  id v25 = v12;
  id v27 = v29;
  uint64_t v13 = (*(void (**)(uint64_t, void *, void *))(v10 + 16))(v10, v11, v24);
  id v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v17 = [v5 falseExpression];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_DD30;
    v19[3] = &unk_188B8;
    id v21 = v29;
    BOOL v23 = v9;
    id v20 = v12;
    uint64_t v22 = v30;
    (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v17, v19);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v30, 8);

  return v15;
}

void sub_DCD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_DCF4(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 48);
  }
  return (*(uint64_t (**)(double))(v3 + 16))(*(double *)(*(void *)(v4 + 8) + 24));
}

uint64_t sub_DD30(uint64_t a1, double a2)
{
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v4 = *(void *)(a1 + 48);
  }
  else {
    uint64_t v4 = *(void *)(a1 + 40);
  }
  return (*(uint64_t (**)(double))(v3 + 16))(*(double *)(*(void *)(v4 + 8) + 24));
}

id sub_DD6C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    uint64_t v23 = a1[4];
  }
  else
  {
    uint64_t v8 = objc_opt_class();
    if (v8 == objc_opt_class())
    {
      uint64_t v23 = a1[5];
    }
    else
    {
      uint64_t v9 = objc_opt_class();
      if (v9 == objc_opt_class())
      {
        uint64_t v23 = a1[6];
      }
      else
      {
        uint64_t v10 = objc_opt_class();
        if (v10 == objc_opt_class())
        {
          uint64_t v23 = a1[7];
        }
        else
        {
          uint64_t v11 = objc_opt_class();
          if (v11 == objc_opt_class())
          {
            uint64_t v23 = a1[8];
          }
          else
          {
            uint64_t v12 = objc_opt_class();
            if (v12 == objc_opt_class())
            {
              uint64_t v23 = a1[9];
            }
            else
            {
              uint64_t v13 = objc_opt_class();
              if (v13 == objc_opt_class())
              {
                uint64_t v23 = a1[10];
              }
              else
              {
                uint64_t v14 = objc_opt_class();
                if (v14 == objc_opt_class())
                {
                  uint64_t v23 = a1[11];
                }
                else
                {
                  uint64_t v15 = objc_opt_class();
                  if (v15 == objc_opt_class())
                  {
                    uint64_t v23 = a1[12];
                  }
                  else
                  {
                    uint64_t v16 = objc_opt_class();
                    if (v16 != objc_opt_class())
                    {
                      uint64_t v17 = GCGenericDeviceErrorDomain;
                      uint64_t v18 = (objc_class *)objc_opt_class();
                      id v19 = NSStringFromClass(v18);
                      id v20 = +[NSString stringWithFormat:@"Unsupported expression class: %@.", v19, NSLocalizedDescriptionKey, NSLocalizedFailureReasonErrorKey, @"Invalid expression."];
                      v26[1] = v20;
                      id v21 = +[NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:2];
                      uint64_t v22 = +[NSError errorWithDomain:v17 code:2 userInfo:v21];

                      goto LABEL_23;
                    }
                    uint64_t v23 = a1[13];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  uint64_t v22 = (*(void (**)(uint64_t, id, id))(v23 + 16))(v23, v5, v6);
LABEL_23:

  return v22;
}

void sub_E074(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = sub_3518();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10144();
  }

  id v7 = [v5 extendedIndex];
  if ((unint64_t)v7 < 0x2F)
  {
    uint64_t v14 = [v5 sourceExpression];
    if (v14)
    {
      uint64_t v25 = _NSConcreteStackBlock;
      uint64_t v26 = 3221225472;
      id v27 = sub_E340;
      BOOL v28 = &unk_18C20;
      uint64_t v15 = a1[5];
      uint64_t v29 = a1[4];
      id v30 = v7;
      uint64_t v16 = (*(void (**)(void))(v15 + 16))();
      uint64_t v17 = *(void *)(a1[6] + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      uint64_t v19 = *(void *)(*(void *)(a1[6] + 8) + 40);
      if (v19)
      {
        v31[0] = NSLocalizedDescriptionKey;
        v31[1] = NSLocalizedFailureReasonErrorKey;
        v32[0] = @"Invalid field";
        v32[1] = @"Invalid source expression.";
        uint64_t v20 = GCGenericDeviceErrorDomain;
        v31[2] = NSUnderlyingErrorKey;
        void v32[2] = v19;
        id v21 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
        uint64_t v22 = +[NSError errorWithDomain:v20 code:2 userInfo:v21];
        uint64_t v23 = *(void *)(a1[6] + 8);
        uint64_t v24 = *(void **)(v23 + 40);
        *(void *)(v23 + 40) = v22;

        *a3 = 1;
      }
    }
  }
  else
  {
    uint64_t v8 = GCGenericDeviceErrorDomain;
    v34[0] = @"Invalid field";
    v33[0] = NSLocalizedDescriptionKey;
    v33[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v9 = +[NSString stringWithFormat:@"Invalid extendedIndex '%zi'.", v7];
    v34[1] = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    uint64_t v11 = +[NSError errorWithDomain:v8 code:2 userInfo:v10];
    uint64_t v12 = *(void *)(a1[6] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a3 = 1;
  }
}

float sub_E340(uint64_t a1, double a2)
{
  float result = a2;
  *(float *)(*(void *)(a1 + 32) + 752 + 4 * *(void *)(a1 + 40) + 8) = result;
  return result;
}

void sub_E360(uint64_t a1, void *a2, uint64_t a3)
{
  if ([a2 count])
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v5 = _os_activity_create(&dword_0, "Post Event", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);
    sub_5CF8(*(void *)(a1 + 32));
    kdebug_trace();
    uint64_t v6 = *(void *)(a1 + 32);
    v22[0] = *(_OWORD *)(v6 + 752);
    long long v7 = *(_OWORD *)(v6 + 768);
    long long v8 = *(_OWORD *)(v6 + 784);
    long long v9 = *(_OWORD *)(v6 + 816);
    v22[3] = *(_OWORD *)(v6 + 800);
    v22[4] = v9;
    v22[1] = v7;
    void v22[2] = v8;
    long long v10 = *(_OWORD *)(v6 + 832);
    long long v11 = *(_OWORD *)(v6 + 848);
    long long v12 = *(_OWORD *)(v6 + 880);
    v22[7] = *(_OWORD *)(v6 + 864);
    v22[8] = v12;
    v22[5] = v10;
    v22[6] = v11;
    long long v13 = *(_OWORD *)(v6 + 896);
    long long v14 = *(_OWORD *)(v6 + 912);
    long long v15 = *(_OWORD *)(v6 + 928);
    uint64_t v23 = *(void *)(v6 + 944);
    v22[10] = v14;
    v22[11] = v15;
    v22[9] = v13;
    [(id)v6 dispatchGameControllerExtendedEventWithState:v22 timestamp:a3];
    uint64_t v16 = *(float **)(a1 + 32);
    float v17 = v16[212];
    if (v17 != v16[238])
    {
      [v16 dispatchHomeButtonEventWithValue:v17 != 0.0 timestamp:a3];
      *(_DWORD *)(*(void *)(a1 + 32) + 952) = *(_DWORD *)(*(void *)(a1 + 32) + 848);
      uint64_t v16 = *(float **)(a1 + 32);
    }
    float v18 = v16[213];
    if (v18 != v16[239])
    {
      [v16 dispatchMenuButtonEventWithValue:v18 != 0.0 timestamp:a3];
      *(_DWORD *)(*(void *)(a1 + 32) + 956) = *(_DWORD *)(*(void *)(a1 + 32) + 852);
      uint64_t v16 = *(float **)(a1 + 32);
    }
    float v19 = v16[214];
    if (v19 != v16[240])
    {
      [v16 dispatchOptionsButtonEventWithValue:v19 != 0.0 timestamp:a3];
      *(_DWORD *)(*(void *)(a1 + 32) + 960) = *(_DWORD *)(*(void *)(a1 + 32) + 856);
      uint64_t v16 = *(float **)(a1 + 32);
    }
    float v20 = v16[229];
    if (v20 != v16[241])
    {
      [v16 dispatchSearchButtonEventWithValue:v20 != 0.0 timestamp:a3];
      *(_DWORD *)(*(void *)(a1 + 32) + 964) = *(_DWORD *)(*(void *)(a1 + 32) + 916);
      uint64_t v16 = *(float **)(a1 + 32);
    }
    float v21 = v16[230];
    if (v21 != v16[242])
    {
      [v16 dispatchShareButtonEventWithValue:v21 != 0.0 timestamp:a3];
      *(_DWORD *)(*(void *)(a1 + 32) + 968) = *(_DWORD *)(*(void *)(a1 + 32) + 920);
    }
    os_activity_scope_leave(&state);
  }
}

GCHapticMotor *__cdecl sub_E5E0(id a1, GCGenericDeviceRumbleActuatorModel *a2, unint64_t a3)
{
  uint64_t v4 = a2;
  id v5 = [GCHapticMotor alloc];
  uint64_t v6 = [(GCGenericDeviceRumbleActuatorModel *)v4 name];

  long long v7 = [(GCHapticMotor *)v5 initWithIndex:a3 name:v6];

  return v7;
}

void *sub_E664(uint64_t a1, void *a2, void *a3)
{
  id v5 = [a2 motorName];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v6 = [*(id *)(a1 + 32) hapticMotors];
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v23 != v9) {
        objc_enumerationMutation(v6);
      }
      long long v11 = *(void **)(*((void *)&v22 + 1) + 8 * v10);
      long long v12 = [v11 name];
      unsigned __int8 v13 = [v12 isEqualToString:v5];

      if (v13) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v14 = v11;

    if (!v14) {
      goto LABEL_12;
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_E8E4;
    v20[3] = &unk_18CD0;
    id v21 = v14;
    id v15 = v14;
    uint64_t v16 = objc_retainBlock(v20);
    float v17 = v21;
    goto LABEL_14;
  }
LABEL_9:

LABEL_12:
  if (a3)
  {
    uint64_t v18 = GCGenericDeviceErrorDomain;
    v26[0] = NSLocalizedDescriptionKey;
    v26[1] = NSLocalizedFailureReasonErrorKey;
    v27[0] = @"Invalid 'Rumble Motor Value' expression.";
    id v15 = +[NSString stringWithFormat:@"No motor with name %@", v5];
    v27[1] = v15;
    float v17 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
    +[NSError errorWithDomain:v18 code:2 userInfo:v17];
    uint64_t v16 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

    goto LABEL_16;
  }
  uint64_t v16 = 0;
LABEL_16:

  return v16;
}

double sub_E8E4(uint64_t a1)
{
  [*(id *)(a1 + 32) frequency];
  return v1;
}

void *sub_E904(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 elementIdentifier];
  id v7 = [v5 attribute];

  id v8 = [*(id *)(*(void *)(a1 + 32) + 736) objectForKeyedSubscript:v6];
  uint64_t v9 = v8;
  if (!v8)
  {
    if (!a3) {
      goto LABEL_14;
    }
    uint64_t v12 = GCGenericDeviceErrorDomain;
    v25[0] = @"Invalid 'Input Element Attribute' expression.";
    v24[0] = NSLocalizedDescriptionKey;
    v24[1] = NSLocalizedFailureReasonErrorKey;
    uint64_t v10 = +[NSString stringWithFormat:@"Not tracking any element with identifier %@", v6];
    v25[1] = v10;
    unsigned __int8 v13 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    *a3 = +[NSError errorWithDomain:v12 code:2 userInfo:v13];
    goto LABEL_12;
  }
  uint64_t v10 = [v8 valueForElementKey:v7];
  if (!v10)
  {
    if (!a3) {
      goto LABEL_13;
    }
    uint64_t v14 = GCGenericDeviceErrorDomain;
    v22[0] = NSLocalizedDescriptionKey;
    v22[1] = NSLocalizedFailureReasonErrorKey;
    v23[0] = @"Invalid 'Input Element Attribute' expression.";
    unsigned __int8 v13 = +[NSString stringWithFormat:@"Element with identifier '%@' does not have a '%@' attribute.", v6, v7];
    v23[1] = v13;
    id v15 = v23;
    uint64_t v16 = v22;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a3) {
      goto LABEL_13;
    }
    uint64_t v14 = GCGenericDeviceErrorDomain;
    v20[0] = NSLocalizedDescriptionKey;
    v20[1] = NSLocalizedFailureReasonErrorKey;
    v21[0] = @"Invalid 'Input Element Attribute' expression.";
    unsigned __int8 v13 = +[NSString stringWithFormat:@"Element with identifier '%@' has an '%@' attribute, but it's not a number.", v6, v7];
    v21[1] = v13;
    id v15 = v21;
    uint64_t v16 = v20;
LABEL_11:
    float v17 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:2];
    *a3 = +[NSError errorWithDomain:v14 code:2 userInfo:v17];

LABEL_12:
    a3 = 0;
    goto LABEL_13;
  }
  [v10 doubleValue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_EC50;
  v19[3] = &unk_18D18;
  void v19[4] = v11;
  a3 = objc_retainBlock(v19);
LABEL_13:

LABEL_14:

  return a3;
}

double sub_EC50(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

id sub_EC58(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    uint64_t v7 = a1 + 32;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 != objc_opt_class())
    {
      uint64_t v6 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = a1 + 40;
  }
  uint64_t v6 = (*(void (**)(void))(*(void *)v7 + 16))();
LABEL_7:

  return v6;
}

unint64_t sub_ED14(uint64_t a1)
{
  uint64_t v2 = (uint64_t)rint((*(double (**)(void))(*(void *)(a1 + 48) + 16))());
  unint64_t v3 = (uint64_t)rint((*(double (**)(void))(*(void *)(a1 + 56) + 16))());
  unint64_t v4 = (uint64_t)rint((*(double (**)(void))(*(void *)(a1 + 64) + 16))());
  uint64_t v5 = sub_3518();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    int v18 = 138413058;
    uint64_t v19 = v17;
    __int16 v20 = 2048;
    uint64_t v21 = v2;
    __int16 v22 = 2048;
    unint64_t v23 = v3;
    __int16 v24 = 2048;
    unint64_t v25 = v4;
    _os_log_debug_impl(&dword_0, v5, OS_LOG_TYPE_DEBUG, "%@ value: %lu, offset: %lu, size: %lu", (uint8_t *)&v18, 0x2Au);
  }

  uint64_t v6 = [*(id *)(a1 + 40) bytes];
  unint64_t result = (unint64_t)[*(id *)(a1 + 40) length];
  if (v4 >= 0x40) {
    unint64_t v8 = 64;
  }
  else {
    unint64_t v8 = v4;
  }
  if (v3 >= 8 * result - v8) {
    unint64_t v9 = 8 * result - v8;
  }
  else {
    unint64_t v9 = v3;
  }
  if (v8)
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    unint64_t v12 = v9 >> 3;
    unint64_t v13 = v8 >> 3;
    char v14 = v9 & 7;
    uint64_t v15 = ~(-1 << v8);
    if (v4 >= 0x40) {
      uint64_t v15 = -1;
    }
    unint64_t v16 = (v15 & v2) << v14;
    do
    {
      if (v12 + v11 >= result) {
        break;
      }
      v6[v12 + v11++] |= v16 >> v10;
      v10 += 8;
    }
    while (v13 >= v11);
  }
  return result;
}

void sub_EECC(uint64_t a1)
{
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  float v1 = [*(id *)(a1 + 32) objectEnumerator];
  id v2 = [v1 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v40;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v40 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(id *)(*((void *)&v39 + 1) + 8 * i);
        bzero([v6 mutableBytes], (size_t)objc_msgSend(v6, "length"));
      }
      id v3 = [v1 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v3);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v7 = *(id *)(a1 + 40);
  id v8 = [v7 countByEnumeratingWithState:&v35 objects:v50 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v36;
    do
    {
      for (j = 0; j != v9; j = (char *)j + 1)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v35 + 1) + 8 * (void)j) + 16))();
      }
      id v9 = [v7 countByEnumeratingWithState:&v35 objects:v50 count:16];
    }
    while (v9);
  }

  uint64_t v12 = mach_absolute_time();
  Mutable = CFDictionaryCreateMutable(0, (CFIndex)[*(id *)(a1 + 32) count], &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v14 = *(id *)(a1 + 32);
  id v15 = [v14 countByEnumeratingWithState:&v31 objects:v49 count:16];
  if (v15)
  {
    id v17 = v15;
    uint64_t v18 = *(void *)v32;
    *(void *)&long long v16 = 138412802;
    long long v29 = v16;
    do
    {
      for (k = 0; k != v17; k = (char *)k + 1)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v14);
        }
        __int16 v20 = *(__IOHIDElement **)(*((void *)&v31 + 1) + 8 * (void)k);
        uint64_t v21 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v20, v29);
        __int16 v22 = sub_3518();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v25 = [v21 length];
          id v26 = [v21 bytes];
          *(_DWORD *)buf = v29;
          uint64_t v44 = v20;
          __int16 v45 = 1040;
          unsigned int v46 = v25;
          __int16 v47 = 2098;
          id v48 = v26;
          _os_log_debug_impl(&dword_0, v22, OS_LOG_TYPE_DEBUG, "%@ -> %{public}.*P", buf, 0x1Cu);
        }

        id v23 = v21;
        IOHIDValueRef v24 = IOHIDValueCreateWithBytes(0, v20, v12, (const uint8_t *)[v23 bytes], (CFIndex)objc_msgSend(v23, "length"));
        CFDictionarySetValue(Mutable, v20, v24);
        CFRelease(v24);
      }
      id v17 = [v14 countByEnumeratingWithState:&v31 objects:v49 count:16];
    }
    while (v17);
  }

  kdebug_trace();
  IOReturn v27 = IOHIDDeviceSetValueMultiple(*(IOHIDDeviceRef *)(a1 + 48), Mutable);
  if (v27)
  {
    BOOL v28 = sub_3518();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      sub_101B8(v27, v28);
    }
  }
  kdebug_trace();
  CFRelease(Mutable);
}

id sub_F394(uint64_t a1, int a2)
{
  uint64_t v4 = +[NSMutableString stringWithCapacity:2 * a2];
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1;
    do
    {
      if (v5 == 2) {
        CFStringRef v6 = &stru_191D8;
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
  id v9 = [v8 uppercaseString];

  return v9;
}

uint64_t sub_F49C()
{
  if (qword_1F370 != -1) {
    dispatch_once(&qword_1F370, &stru_18DD8);
  }
  return byte_1F378;
}

void sub_F4E0(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.GameController"];
  byte_1F378 = [v1 BOOLForKey:@"GCPartnersEnable"];
  id v2 = sub_3518();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = byte_1F378;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v3, 8u);
  }
}

NSXPCInterface *sub_F5C0()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCAdaptiveTriggersServiceClientInterface];
}

NSXPCInterface *sub_F5D4()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCAdaptiveTriggersServiceServerInterface];
}

NSXPCInterface *sub_F5E8()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCLightServiceClientInterface];
}

NSXPCInterface *sub_F5FC()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCLightServiceServerInterface];
}

void sub_F76C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_F818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_F988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FA88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FC08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_FCD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

NSXPCInterface *sub_FCE8()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCBatteryServiceClientInterface];
}

NSXPCInterface *sub_FCFC()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCBatteryServiceServerInterface];
}

id sub_FD10()
{
  return +[NSData dataWithBytes:&unk_16F20 length:37];
}

void sub_FD28(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "setProperty: %@ forKey: %@", (uint8_t *)&v3, 0x16u);
}

void sub_FDB0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Dispatching event...", v1, 2u);
}

void sub_FDF4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Stopping timer...", v1, 2u);
}

void sub_FE38()
{
  sub_F388();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Could not get parent of service <%s>: %{mach.errno}d", v2, 0x12u);
}

void sub_FEBC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to create device input.", v1, 2u);
}

void sub_FF00(void *a1, void *a2, NSObject *a3)
{
  int v5 = 134218240;
  id v6 = [a1 count];
  __int16 v7 = 2048;
  id v8 = [a2 count];
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "Now tracking '%zd' elements; '%zd' input elements:",
    (uint8_t *)&v5,
    0x16u);
}

void sub_FFB4(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 debugDescription];
  sub_F388();
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Applying model: %@", v4, 0xCu);
}

void sub_1004C()
{
  sub_F388();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_0, v1, OS_LOG_TYPE_DEBUG, "\t %@ => %{public}@", v2, 0x16u);
}

void sub_100D0()
{
  sub_F388();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "Processing property model %@", v1, 0xCu);
}

void sub_10144()
{
  sub_F388();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "Processing field model %@", v1, 0xCu);
}

void sub_101B8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Set rumble value(s) failed:  %{mach.errno}d", (uint8_t *)v2, 8u);
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

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

IOReturn IOHIDDeviceSetValueMultiple(IOHIDDeviceRef device, CFDictionaryRef multiple)
{
  return _IOHIDDeviceSetValueMultiple(device, multiple);
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

IOHIDValueRef IOHIDValueCreateWithBytes(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, const uint8_t *bytes, CFIndex length)
{
  return _IOHIDValueCreateWithBytes(allocator, element, timeStamp, bytes, length);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return _IOObjectGetClass(object, className);
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

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
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

uint64_t _IOHIDElementGetLength()
{
  return __IOHIDElementGetLength();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
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

void bzero(void *a1, size_t a2)
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
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

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
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

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_actuators(void *a1, const char *a2, ...)
{
  return [a1 actuators];
}

id objc_msgSend_amplitude(void *a1, const char *a2, ...)
{
  return [a1 amplitude];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attribute(void *a1, const char *a2, ...)
{
  return [a1 attribute];
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

id objc_msgSend_calibrationMax(void *a1, const char *a2, ...)
{
  return [a1 calibrationMax];
}

id objc_msgSend_calibrationMin(void *a1, const char *a2, ...)
{
  return [a1 calibrationMin];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
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

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
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

id objc_msgSend_dispatchFrequency(void *a1, const char *a2, ...)
{
  return [a1 dispatchFrequency];
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

id objc_msgSend_driverCheckIn(void *a1, const char *a2, ...)
{
  return [a1 driverCheckIn];
}

id objc_msgSend_element(void *a1, const char *a2, ...)
{
  return [a1 element];
}

id objc_msgSend_elementCookie(void *a1, const char *a2, ...)
{
  return [a1 elementCookie];
}

id objc_msgSend_elementIdentifier(void *a1, const char *a2, ...)
{
  return [a1 elementIdentifier];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_eventID(void *a1, const char *a2, ...)
{
  return [a1 eventID];
}

id objc_msgSend_extendedIndex(void *a1, const char *a2, ...)
{
  return [a1 extendedIndex];
}

id objc_msgSend_falseExpression(void *a1, const char *a2, ...)
{
  return [a1 falseExpression];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return [a1 fields];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_gamepadEventFields(void *a1, const char *a2, ...)
{
  return [a1 gamepadEventFields];
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

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return [a1 input];
}

id objc_msgSend_inputExpression(void *a1, const char *a2, ...)
{
  return [a1 inputExpression];
}

id objc_msgSend_inputMaxExpression(void *a1, const char *a2, ...)
{
  return [a1 inputMaxExpression];
}

id objc_msgSend_inputMinExpression(void *a1, const char *a2, ...)
{
  return [a1 inputMinExpression];
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

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return [a1 isIdle];
}

id objc_msgSend_lastEventTime(void *a1, const char *a2, ...)
{
  return [a1 lastEventTime];
}

id objc_msgSend_leftExpression(void *a1, const char *a2, ...)
{
  return [a1 leftExpression];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_maskExpression(void *a1, const char *a2, ...)
{
  return [a1 maskExpression];
}

id objc_msgSend_maxExpression(void *a1, const char *a2, ...)
{
  return [a1 maxExpression];
}

id objc_msgSend_minExpression(void *a1, const char *a2, ...)
{
  return [a1 minExpression];
}

id objc_msgSend_motorName(void *a1, const char *a2, ...)
{
  return [a1 motorName];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_numberOfTimesToSendZeroHapticReport(void *a1, const char *a2, ...)
{
  return [a1 numberOfTimesToSendZeroHapticReport];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_offsetExpression(void *a1, const char *a2, ...)
{
  return [a1 offsetExpression];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_optional(void *a1, const char *a2, ...)
{
  return [a1 optional];
}

id objc_msgSend_outputMaxExpression(void *a1, const char *a2, ...)
{
  return [a1 outputMaxExpression];
}

id objc_msgSend_outputMinExpression(void *a1, const char *a2, ...)
{
  return [a1 outputMinExpression];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return [a1 outputs];
}

id objc_msgSend_params(void *a1, const char *a2, ...)
{
  return [a1 params];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_queuedTransients(void *a1, const char *a2, ...)
{
  return [a1 queuedTransients];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rightExpression(void *a1, const char *a2, ...)
{
  return [a1 rightExpression];
}

id objc_msgSend_rumble(void *a1, const char *a2, ...)
{
  return [a1 rumble];
}

id objc_msgSend_scaleType(void *a1, const char *a2, ...)
{
  return [a1 scaleType];
}

id objc_msgSend_scheduleIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 scheduleIdleTimer];
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

id objc_msgSend_sizeExpression(void *a1, const char *a2, ...)
{
  return [a1 sizeExpression];
}

id objc_msgSend_sourceExpression(void *a1, const char *a2, ...)
{
  return [a1 sourceExpression];
}

id objc_msgSend_stopHaptics(void *a1, const char *a2, ...)
{
  return [a1 stopHaptics];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
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

id objc_msgSend_trueExpression(void *a1, const char *a2, ...)
{
  return [a1 trueExpression];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeOverride(void *a1, const char *a2, ...)
{
  return [a1 typeOverride];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
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

id objc_msgSend_valueExpression(void *a1, const char *a2, ...)
{
  return [a1 valueExpression];
}

id objc_msgSend_valueForNoteParam_inParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForNoteParam:inParameters:");
}