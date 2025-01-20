uint64_t sub_4D20()
{
  if (qword_1F608 != -1) {
    dispatch_once(&qword_1F608, &stru_183F8);
  }
  return byte_1F600;
}

void sub_4D64(id a1)
{
  byte_1F600 = os_variant_has_internal_diagnostics();
}

id sub_4D8C()
{
  if (qword_1F618 != -1) {
    dispatch_once(&qword_1F618, &stru_18418);
  }
  v0 = (void *)qword_1F610;

  return v0;
}

void sub_4DE0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  v2 = (void *)qword_1F610;
  qword_1F610 = (uint64_t)v1;
}

id sub_4E24()
{
  if (qword_1F628 != -1) {
    dispatch_once(&qword_1F628, &stru_18438);
  }
  v0 = (void *)qword_1F620;

  return v0;
}

void sub_4E78(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "monitor");
  v2 = (void *)qword_1F620;
  qword_1F620 = (uint64_t)v1;
}

id sub_4EBC()
{
  if (qword_1F638 != -1) {
    dispatch_once(&qword_1F638, &stru_18458);
  }
  v0 = (void *)qword_1F630;

  return v0;
}

void sub_4F10(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "init");
  v2 = (void *)qword_1F630;
  qword_1F630 = (uint64_t)v1;
}

id sub_4F54()
{
  if (qword_1F648 != -1) {
    dispatch_once(&qword_1F648, &stru_18478);
  }
  v0 = (void *)qword_1F640;

  return v0;
}

void sub_4FA8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "analytics");
  v2 = (void *)qword_1F640;
  qword_1F640 = (uint64_t)v1;
}

id sub_4FEC()
{
  if (qword_1F658 != -1) {
    dispatch_once(&qword_1F658, &stru_18498);
  }
  v0 = (void *)qword_1F650;

  return v0;
}

void sub_5040(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Daemon", "default");
  v2 = (void *)qword_1F650;
  qword_1F650 = (uint64_t)v1;
}

void sub_5084(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)qword_1F660;
  qword_1F660 = (uint64_t)v1;
}

id sub_50C4()
{
  if (qword_1F668 != -1) {
    dispatch_once(&qword_1F668, &stru_184B8);
  }
  v0 = (void *)qword_1F660;

  return v0;
}

void sub_5118(id a1)
{
  if (!qword_1F660) {
    objc_storeStrong((id *)&qword_1F660, &_os_log_default);
  }
}

id sub_513C()
{
  if (qword_1F678 != -1) {
    dispatch_once(&qword_1F678, &stru_184D8);
  }
  v0 = (void *)qword_1F670;

  return v0;
}

void sub_5190(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  v2 = (void *)qword_1F670;
  qword_1F670 = (uint64_t)v1;
}

id sub_51D4()
{
  if (qword_1F688 != -1) {
    dispatch_once(&qword_1F688, &stru_184F8);
  }
  v0 = (void *)qword_1F680;

  return v0;
}

void sub_5228(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Haptics", "default");
  v2 = (void *)qword_1F680;
  qword_1F680 = (uint64_t)v1;
}

id sub_526C()
{
  if (qword_1F698 != -1) {
    dispatch_once(&qword_1F698, &stru_18518);
  }
  v0 = (void *)qword_1F690;

  return v0;
}

void sub_52C0(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  v2 = (void *)qword_1F690;
  qword_1F690 = (uint64_t)v1;
}

id sub_5304()
{
  if (qword_1F6A8 != -1) {
    dispatch_once(&qword_1F6A8, &stru_18538);
  }
  v0 = (void *)qword_1F6A0;

  return v0;
}

void sub_5358(id a1)
{
  os_log_t v1 = os_log_create("com.apple.runtime-issues", "GameController");
  v2 = (void *)qword_1F6A0;
  qword_1F6A0 = (uint64_t)v1;
}

NSXPCInterface *sub_539C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCGameIntentServiceClientInterface];
}

NSXPCInterface *sub_53B0()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCGameIntentServiceServerInterface];
}

id sub_53C4()
{
  return +[NSData dataWithBytes:&unk_16820 length:37];
}

void sub_5538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_55E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_5754(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_59D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

NSXPCInterface *sub_5AB4()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceClientInterface];
}

NSXPCInterface *sub_5AC8()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceServerInterface];
}

id sub_5FB0(uint64_t a1, int a2)
{
  v4 = +[NSMutableString stringWithCapacity:2 * a2];
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1;
    do
    {
      if (v5 == 2) {
        CFStringRef v6 = &stru_18A00;
      }
      else {
        CFStringRef v6 = @":";
      }
      v7 = +[NSString stringWithFormat:@"%02x%@", *(unsigned __int8 *)(a1 + (v5 - 2)), v6];
      [v4 appendString:v7];

      --v5;
    }
    while (v5 > 1);
  }
  v8 = +[NSString stringWithString:v4];
  v9 = [v8 uppercaseString];

  return v9;
}

uint64_t sub_60B8()
{
  if (qword_1F6B0 != -1) {
    dispatch_once(&qword_1F6B0, &stru_18558);
  }
  return byte_1F6B8;
}

void sub_60FC(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.GameController"];
  byte_1F6B8 = [v1 BOOLForKey:@"GCPartnersEnable"];
  v2 = sub_50C4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = byte_1F6B8;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v3, 8u);
  }
}

id sub_61DC()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GCDriverClientInterface];
  id v1 = sub_5AB4();
  [v0 setInterface:v1 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v2 = sub_5AC8();
  [v0 setInterface:v2 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v3 = sub_FBB8();
  [v0 setInterface:v3 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v4 = sub_FBCC();
  [v0 setInterface:v4 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  unint64_t v5 = sub_64AC();
  [v0 setInterface:v5 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  CFStringRef v6 = sub_64C0();
  [v0 setInterface:v6 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v7 = sub_FB90();
  [v0 setInterface:v7 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v8 = sub_FBA4();
  [v0 setInterface:v8 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v9 = sub_FBE0();
  [v0 setInterface:v9 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v10 = sub_FBF4();
  [v0 setInterface:v10 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v11 = sub_539C();
  [v0 setInterface:v11 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v12 = sub_53B0();
  [v0 setInterface:v12 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v13 = GCGenericDeviceDriverConfigurationServiceClientInterface();
  [v0 setInterface:v13 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v14 = GCGenericDeviceDriverConfigurationServiceServerInterface();
  [v0 setInterface:v14 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *sub_6498()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GCDriverServerInterface];
}

NSXPCInterface *sub_64AC()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCAdaptiveTriggersServiceClientInterface];
}

NSXPCInterface *sub_64C0()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCAdaptiveTriggersServiceServerInterface];
}

NSObject *sub_64D4(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
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

void sub_675C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_678C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_50C4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Connection to com.apple.GameController.gamecontrollerd.driver invalidated", v3, 2u);
  }

  [WeakRetained setInterruptionHandler:0];
  [WeakRetained setInvalidationHandler:0];
  [WeakRetained invalidate];
}

void sub_6824(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_50C4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Connection to com.apple.GameController.gamecontrollerd.driver interrupted.  Attempting to re-establish.", v4, 2u);
  }

  v3 = [WeakRetained remoteObjectProxy];
  [v3 driverCheckIn];
}

void sub_6CB0(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a3 | a2)
  {
    switch(a2)
    {
      case 3:
        unint64_t v5 = sub_50C4();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          uint64_t v10 = a1;
          CFStringRef v6 = "BTSessionEventCallback: failed session = %p";
LABEL_15:
          _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0xCu);
        }
        break;
      case 2:
        unint64_t v5 = sub_50C4();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          uint64_t v10 = a1;
          CFStringRef v6 = "BTSessionEventCallback: terminated session = %p";
          goto LABEL_15;
        }
        break;
      case 1:
        unint64_t v5 = sub_50C4();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        int v9 = 134217984;
        uint64_t v10 = a1;
        CFStringRef v6 = "BTSessionEventCallback: detached session = %p";
        goto LABEL_15;
      default:
        return;
    }

    return;
  }
  v8 = sub_50C4();
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

void sub_6FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_700C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_701C(uint64_t a1)
{
}

void sub_7024(uint64_t a1)
{
  v2 = +[NSString stringWithCString:dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)) encoding:4];
  v3 = sub_50C4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Freeing HIDDevice on %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

BOOL sub_741C(id a1, NSDictionary *a2, NSDictionary *a3)
{
  v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(NSDictionary *)v3 objectForKeyedSubscript:@"DeviceUsagePage"];
    unint64_t v5 = [(NSDictionary *)v3 objectForKeyedSubscript:@"DeviceUsage"];
    char v6 = (![v4 isEqual:&off_19618]
       || ([v5 isEqual:&off_19630] & 1) == 0)
      && (![v4 isEqual:&off_19618]
       || ([v5 isEqual:&off_19648] & 1) == 0)
      && (![v4 isEqual:&off_19618]
       || ([v5 isEqual:&off_19618] & 1) == 0);
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

void sub_7994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_79B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = sub_50C4();
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

void sub_7BAC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = *(void **)(v4 + 32);
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

void sub_8598(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 560);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_8640;
  v7[3] = &unk_18610;
  v7[4] = v2;
  uint64_t v4 = sub_64D4(0x6FC23AC00uLL, 0x3B9ACA00uLL, v3, v7);
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v4;
}

id sub_8640(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateIdleState];
}

void sub_8824(id a1)
{
}

void sub_8894(uint64_t a1, void *a2, int a3)
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

uint64_t sub_8944(uint64_t result)
{
  if (result) {
    return *(void *)(result + 656);
  }
  return result;
}

id sub_8A98(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchEvent:*(void *)(a1 + 40)];
}

id sub_8BD4(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchIdleEvent:*(void *)(a1 + 40)];
}

void sub_9D2C(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
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
        v7[2] = sub_9E20;
        v7[3] = &unk_18580;
        objc_copyWeak(&v8, v1);
        uint64_t v5 = sub_64D4(0xF4240uLL, 0x186A0uLL, tv_sec, v7);
        tv_nsec = (void *)v3[33].tv_nsec;
        v3[33].tv_nsec = v5;

        objc_destroyWeak(&v8);
      }
    }
  }
}

void sub_9E20(uint64_t a1)
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
      v3 = sub_50C4();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
      if (v2)
      {
        if (v4) {
          sub_FC90(v3);
        }

        *((_DWORD *)WeakRetained + 123) = 0;
        [WeakRetained dispatchHapticEvent];
      }
      else
      {
        if (v4) {
          sub_FCD4(v3);
        }

        [WeakRetained stopHaptics];
      }
    }
  }
}

void sub_A578()
{
}

void sub_ACCC(uint64_t a1, int a2, const void *a3, unint64_t a4)
{
  kdebug_trace();
  if (a2)
  {
    id v8 = sub_50C4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_FD84();
    }
  }
  else
  {
    if (a4 >= 0x40) {
      size_t v9 = 64;
    }
    else {
      size_t v9 = a4;
    }
    memcpy((void *)(*(void *)(a1 + 32) + 904), a3, v9);
    id v8 = sub_50C4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = sub_AE18((const char *)(*(void *)(a1 + 32) + 904));
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "(Async) Firmware Info = %@", (uint8_t *)&v11, 0xCu);
    }
  }

  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
}

id sub_AE18(const char *a1)
{
  uint64_t v1 = *(unsigned __int8 *)a1;
  if (*a1)
  {
    __dst[11] = 0;
    strncpy(__dst, a1 + 1, 0xBuLL);
    v27[8] = 0;
    strncpy(v27, a1 + 12, 8uLL);
    v25[0] = @"ReportID";
    v24 = +[NSNumber numberWithUnsignedChar:v1];
    v26[0] = v24;
    v25[1] = @"Build Date";
    uint64_t v3 = +[NSString stringWithUTF8String:__dst];
    v23 = (void *)v3;
    if (v3) {
      CFStringRef v4 = (const __CFString *)v3;
    }
    else {
      CFStringRef v4 = @"<invalid>";
    }
    v26[1] = v4;
    v25[2] = @"Build Time";
    uint64_t v5 = +[NSString stringWithUTF8String:v27];
    v22 = (void *)v5;
    if (v5) {
      CFStringRef v6 = (const __CFString *)v5;
    }
    else {
      CFStringRef v6 = @"<invalid>";
    }
    v26[2] = v6;
    v25[3] = @"Firmware Type";
    v21 = +[NSNumber numberWithUnsignedShort:*((unsigned __int16 *)a1 + 10)];
    v26[3] = v21;
    v25[4] = @"Software Series";
    v20 = +[NSNumber numberWithUnsignedShort:*((unsigned __int16 *)a1 + 11)];
    v26[4] = v20;
    v25[5] = @"Hardware Info";
    v19 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)a1 + 6)];
    v26[5] = v19;
    v25[6] = @"Main Firmware Version";
    v18 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)a1 + 7)];
    v26[6] = v18;
    v25[7] = @"Device Info [0]";
    id v7 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)a1 + 8)];
    v26[7] = v7;
    v25[8] = @"Device Info [1]";
    id v8 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)a1 + 9)];
    v26[8] = v8;
    v25[9] = @"Device Info [2]";
    size_t v9 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)a1 + 10)];
    v26[9] = v9;
    v25[10] = @"Device Info [3]";
    uint64_t v10 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)a1 + 11)];
    v26[10] = v10;
    v25[11] = @"Update Version";
    int v11 = +[NSNumber numberWithUnsignedShort:*((unsigned __int16 *)a1 + 22)];
    v26[11] = v11;
    v25[12] = @"Update Capability Info";
    v12 = +[NSNumber numberWithUnsignedChar:*((unsigned __int8 *)a1 + 46)];
    v26[12] = v12;
    v25[13] = @"Audio Sig Proc FW Version";
    v13 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)a1 + 13)];
    v26[13] = v13;
    v25[14] = @"Audio Codec FW Version";
    v14 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)a1 + 14)];
    v26[14] = v14;
    v25[15] = @"CRC 32";
    v15 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)a1 + 15)];
    v26[15] = v15;
    v16 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:16];
  }
  else
  {
    v16 = +[NSDictionary dictionary];
  }

  return v16;
}

void sub_B3FC(uint64_t a1, int a2, const void *a3, unint64_t a4)
{
  kdebug_trace();
  if (a2)
  {
    id v8 = sub_50C4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_FE58();
    }
LABEL_4:

    goto LABEL_18;
  }
  if (a4 >= 0x29) {
    size_t v9 = 41;
  }
  else {
    size_t v9 = a4;
  }
  memcpy((void *)(*(void *)(a1 + 32) + 727), a3, v9);
  if (sub_4D20())
  {
    v14 = sub_50C4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (_OWORD *)(*(void *)(a1 + 32) + 727);
      *(_OWORD *)buf = *v15;
      v35[0] = v15[1];
      *(_OWORD *)((char *)v35 + 9) = *(_OWORD *)((char *)v15 + 25);
      v16 = sub_BB2C((uint64_t)buf);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v16;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "(Async) Sensor Calibration Info = %@", buf, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  double v11 = (double)(*(__int16 *)(v10 + 748) + *(__int16 *)(v10 + 746)) * 0.5;
  *(double *)(v10 + 768) = v11
                         / ((fabs((double)(*(__int16 *)(v10 + 734) - *(__int16 *)(v10 + 728)))
                           + fabs((double)(*(__int16 *)(v10 + 736) - *(__int16 *)(v10 + 728))))
                          * 0.5);
  *(double *)(*(void *)(a1 + 32) + 768) = *(double *)(*(void *)(a1 + 32) + 768) * 0.0174532925;
  uint64_t v12 = *(void *)(a1 + 32);
  *(double *)(v12 + 776) = v11
                         / ((fabs((double)(*(__int16 *)(v12 + 738) - *(__int16 *)(v12 + 730)))
                           + fabs((double)(*(__int16 *)(v12 + 740) - *(__int16 *)(v12 + 730))))
                          * 0.5);
  *(double *)(*(void *)(a1 + 32) + 776) = *(double *)(*(void *)(a1 + 32) + 776) * 0.0174532925;
  uint64_t v13 = *(void *)(a1 + 32);
  *(double *)(v13 + 784) = v11
                         / ((fabs((double)(*(__int16 *)(v13 + 742) - *(__int16 *)(v13 + 732)))
                           + fabs((double)(*(__int16 *)(v13 + 744) - *(__int16 *)(v13 + 732))))
                          * 0.5);
  *(double *)(*(void *)(a1 + 32) + 784) = *(double *)(*(void *)(a1 + 32) + 784) * 0.0174532925;
  *(double *)(*(void *)(a1 + 32) + 792) = (double)(*(__int16 *)(*(void *)(a1 + 32) + 752)
                                                     + *(__int16 *)(*(void *)(a1 + 32) + 750))
                                            * 0.5;
  *(double *)(*(void *)(a1 + 32) + 800) = (double)(*(__int16 *)(*(void *)(a1 + 32) + 756)
                                                     + *(__int16 *)(*(void *)(a1 + 32) + 754))
                                            * 0.5;
  *(double *)(*(void *)(a1 + 32) + 808) = (double)(*(__int16 *)(*(void *)(a1 + 32) + 760)
                                                     + *(__int16 *)(*(void *)(a1 + 32) + 758))
                                            * 0.5;
  *(double *)(*(void *)(a1 + 32) + 816) = 2.0
                                            / (double)(*(__int16 *)(*(void *)(a1 + 32) + 750)
                                                     - *(__int16 *)(*(void *)(a1 + 32) + 752));
  *(double *)(*(void *)(a1 + 32) + 824) = 2.0
                                            / (double)(*(__int16 *)(*(void *)(a1 + 32) + 754)
                                                     - *(__int16 *)(*(void *)(a1 + 32) + 756));
  *(double *)(*(void *)(a1 + 32) + 832) = 2.0
                                            / (double)(*(__int16 *)(*(void *)(a1 + 32) + 758)
                                                     - *(__int16 *)(*(void *)(a1 + 32) + 760));
  if (sub_4D20())
  {
    log = sub_50C4();
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 768);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v17;
      _os_log_impl(&dword_0, log, OS_LOG_TYPE_INFO, "(Async) Gyro Pitch Sensitivity = %f", buf, 0xCu);
    }
  }
  if (sub_4D20())
  {
    v18 = sub_50C4();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 776);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "(Async) Gyro Yaw Sensitivity = %f", buf, 0xCu);
    }
  }
  if (sub_4D20())
  {
    v20 = sub_50C4();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 784);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v21;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "(Async) Gyro Roll Sensitivity = %f", buf, 0xCu);
    }
  }
  if (sub_4D20())
  {
    v22 = sub_50C4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 792);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v23;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "(Async) Accelerometer X Bias = %f", buf, 0xCu);
    }
  }
  if (sub_4D20())
  {
    v24 = sub_50C4();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 800);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v25;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "(Async) Accelerometer Y Bias = %f", buf, 0xCu);
    }
  }
  if (sub_4D20())
  {
    v26 = sub_50C4();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 808);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v27;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "(Async) Accelerometer Z Bias = %f", buf, 0xCu);
    }
  }
  if (sub_4D20())
  {
    v28 = sub_50C4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 816);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v29;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "(Async) Accelerometer X Sensitivity = %f", buf, 0xCu);
    }
  }
  if (sub_4D20())
  {
    v30 = sub_50C4();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 824);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v31;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "(Async) Accelerometer Y Sensitivity = %f", buf, 0xCu);
    }
  }
  if (sub_4D20())
  {
    id v8 = sub_50C4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 832);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v32;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "(Async) Accelerometer Z Sensitivity = %f", buf, 0xCu);
    }
    goto LABEL_4;
  }
LABEL_18:
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
}

id sub_BB2C(uint64_t a1)
{
  if (*(unsigned char *)a1)
  {
    v24[0] = @"ReportID";
    uint64_t v23 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:");
    v25[0] = v23;
    v24[1] = @"gyroPitchBias";
    v22 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 1)];
    v25[1] = v22;
    v24[2] = @"gyroYawBias";
    uint64_t v21 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 3)];
    v25[2] = v21;
    v24[3] = @"gyroRollBias";
    v20 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 5)];
    v25[3] = v20;
    v24[4] = @"gyroRefPitchPlus";
    uint64_t v19 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 7)];
    v25[4] = v19;
    v24[5] = @"gyroRefPitchMinus";
    v18 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 9)];
    v25[5] = v18;
    v24[6] = @"gyroRefYawPlus";
    uint64_t v17 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 11)];
    v25[6] = v17;
    v24[7] = @"gyroRefYawMinus";
    v16 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 13)];
    v25[7] = v16;
    v24[8] = @"gyroRefRollPlus";
    v15 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 15)];
    v25[8] = v15;
    v24[9] = @"gyroRefRollMinus";
    v14 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 17)];
    v25[9] = v14;
    v24[10] = @"gyroRefSpeedPlus";
    uint64_t v13 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 19)];
    v25[10] = v13;
    v24[11] = @"gyroRefSpeedMinus";
    unsigned __int8 v2 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 21)];
    v25[11] = v2;
    v24[12] = @"accelRefXPlus";
    uint64_t v3 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 23)];
    v25[12] = v3;
    v24[13] = @"accelRefXMinus";
    CFStringRef v4 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 25)];
    v25[13] = v4;
    v24[14] = @"accelRefYPlus";
    uint64_t v5 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 27)];
    v25[14] = v5;
    v24[15] = @"accelRefYMinus";
    CFStringRef v6 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 29)];
    v25[15] = v6;
    v24[16] = @"accelRefZPlus";
    id v7 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 31)];
    void v25[16] = v7;
    v24[17] = @"accelRefZMinus";
    id v8 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 33)];
    v25[17] = v8;
    v24[18] = @"calibrationTemp";
    size_t v9 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 35)];
    v25[18] = v9;
    v24[19] = @"CRC 32";
    uint64_t v10 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 37)];
    v25[19] = v10;
    double v11 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:20];
  }
  else
  {
    double v11 = +[NSDictionary dictionary];
  }

  return v11;
}

void sub_C31C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_C344(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v105 = a2;
  id v106 = a6;
  v14 = (id *)(a1 + 32);
  id WeakRetained = (dispatch_once_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v16 = WeakRetained;
  if (WeakRetained)
  {
    sub_8944((uint64_t)WeakRetained);
    kdebug_trace();
    long long v134 = 0u;
    memset(v135, 0, 28);
    memset(v133, 0, sizeof(v133));
    if (a5 == 49)
    {
      id v18 = v106;
      [v18 bytes];
      if (!*((unsigned char *)v16 + 1029)) {
        [(dispatch_once_t *)v16 setExtendedSupportEnabled:1];
      }
      [v18 length];
      __memcpy_chk();
LABEL_10:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_CF4C;
      block[3] = &unk_186A8;
      uint64_t v19 = v16;
      v108 = v19;
      objc_copyWeak(&v109, v14);
      if (v16[87] != -1) {
        dispatch_once(v16 + 87, block);
      }
      [v19 updateBatteryLevel:v135[2] & 0xF chargeStatus:LOBYTE(v135[2]) >> 4];
      if (*((unsigned char *)v19 + 721))
      {
        double v21 = *((double *)v19 + 96) * (double)(*(__int16 *)((char *)v133 + 15) - *((__int16 *)v19 + 364));
        double v22 = *((double *)v19 + 98) * (double)(*((__int16 *)v19 + 366) - *(__int16 *)((char *)&v133[1] + 3));
        double v23 = *((double *)v19 + 97) * (double)(*(__int16 *)((char *)&v133[1] + 1) - *((__int16 *)v19 + 365));
        double v24 = -(((double)*(__int16 *)((char *)&v133[1] + 5) - *((double *)v19 + 99)) * *((double *)v19 + 102));
        double v25 = ((double)*(__int16 *)((char *)&v133[1] + 9) - *((double *)v19 + 101)) * *((double *)v19 + 104);
        double v20 = (double)*(__int16 *)((char *)&v133[1] + 7) - *((double *)v19 + 100);
        double v26 = -(v20 * *((double *)v19 + 103));
        uint8_t v27 = 1;
      }
      else
      {
        uint8_t v27 = 0;
        double v25 = 0.0;
        double v26 = 0.0;
        double v24 = 0.0;
        double v23 = 0.0;
        double v22 = 0.0;
        double v21 = 0.0;
      }
      LOBYTE(v20) = BYTE1(v133[0]);
      *(double *)&unint64_t v28 = (double)*(unint64_t *)&v20;
      double v29 = *(double *)&v28 + -127.5;
      LOBYTE(v28) = BYTE3(v133[0]);
      double v30 = (double)v28 + -127.5;
      int8x8_t v31 = 0;
      float v32 = 0.0;
      float v33 = 0.0;
      float v34 = 0.0;
      int8x8_t v35 = 0;
      if (((char)v134 & 0x80000000) == 0)
      {
        unsigned int v36 = (*(unsigned __int16 *)((char *)&v134 + 1) | (BYTE3(v134) << 16)) >> 12;
        float v37 = (float)((float)((float)v36 / 1079.0) + (float)((float)v36 / 1079.0)) + -1.0;
        float v33 = fmaxf(-v37, 0.0);
        float v34 = fmaxf(v37, 0.0);
        *(float *)v38.i32 = -(float)((float)((float)((float)(*(_WORD *)((unsigned char *)&v134 + 1) & 0xFFF) / 1919.0)
                                           + (float)((float)(*(_WORD *)((unsigned char *)&v134 + 1) & 0xFFF) / 1919.0))
                                   + -1.0);
        v39.i32[0] = 0;
        v39.f32[1] = (float)((float)((float)(*(_WORD *)((unsigned char *)&v134 + 1) & 0xFFF) / 1919.0)
                           + (float)((float)(*(_WORD *)((unsigned char *)&v134 + 1) & 0xFFF) / 1919.0))
                   + -1.0;
        *(float *)&v38.i32[1] = v39.f32[1];
        int8x8_t v35 = vand_s8(v38, (int8x8_t)vcgt_f32(v39, (float32x2_t)v39.u32[1]));
      }
      double v40 = v29 / -127.5;
      float v41 = 0.0;
      double v42 = v30 / -127.5;
      if ((SBYTE4(v134) & 0x80000000) == 0)
      {
        *(float *)&unsigned int v43 = (float)((float)((float)(*(_WORD *)((unsigned char *)&v134 + 5) & 0xFFF) / 1919.0)
                               + (float)((float)(*(_WORD *)((unsigned char *)&v134 + 5) & 0xFFF) / 1919.0))
                       + -1.0;
        unsigned int v44 = (*(unsigned __int16 *)((char *)&v134 + 5) | (BYTE7(v134) << 16)) >> 12;
        float v45 = (float)((float)((float)v44 / 1079.0) + (float)((float)v44 / 1079.0)) + -1.0;
        float v32 = fmaxf(-v45, 0.0);
        float v41 = fmaxf(v45, 0.0);
        *(float *)v46.i32 = -*(float *)&v43;
        v47.i32[0] = 0;
        v47.f32[1] = *(float *)&v43;
        v46.i32[1] = v43;
        int8x8_t v31 = vand_s8(v46, (int8x8_t)vcgt_f32(v47, (float32x2_t)v43));
      }
      float v48 = v40;
      float v49 = v42;
      unsigned int v50 = BYTE9(v133[0]);
      unsigned int v51 = *(unsigned __int16 *)((char *)v133 + 7) | (BYTE9(v133[0]) << 16);
      unsigned int v52 = BYTE7(v133[0]) & 0xF;
      double v94 = v23;
      double v95 = v21;
      double v92 = v24;
      double v93 = v22;
      double v90 = v26;
      double v91 = v25;
      float v103 = v33;
      float v104 = v32;
      float v102 = v34;
      int8x8_t v100 = v35;
      int8x8_t v101 = v31;
      float v99 = v41;
      if (v52)
      {
        BOOL v54 = v52 == 1 || v52 == 7;
        float v98 = (float)v54;
        if (v52 == 4)
        {
          BOOL v55 = 1;
          goto LABEL_41;
        }
      }
      else
      {
        float v98 = 1.0;
      }
      BOOL v55 = v52 == 5 || v52 == 3;
LABEL_41:
      LOBYTE(v9) = v133[0];
      LOBYTE(v6) = BYTE2(v133[0]);
      if (v48 >= 0.0) {
        float v57 = 0.0;
      }
      else {
        float v57 = -v48;
      }
      float v58 = -v49;
      if (v49 >= 0.0) {
        float v58 = 0.0;
      }
      float v96 = v58;
      float v97 = v57;
      LOBYTE(v7) = BYTE5(v133[0]);
      LOBYTE(v8) = BYTE4(v133[0]);
      [v19 dispatchHomeButtonEventWithValue:HIWORD(v51) & 1 timestamp:a3];
      [v19 dispatchMenuButtonEventWithValue:(*(unsigned __int16 *)((char *)v133 + 7) >> 13) & 1 timestamp:a3];
      [v19 dispatchOptionsButtonEventWithValue:(*(unsigned __int16 *)((char *)v133 + 7) >> 12) & 1 timestamp:a3];
      int8x8_t v59 = (int8x8_t)vdup_n_s32(v51);
      *(float *)&unsigned int v60 = ((double)v9 + -127.5) / 127.5;
      *(float *)&unsigned int v61 = ((double)v6 + -127.5) / 127.5;
      v62.i32[0] = 0;
      v62.i32[1] = v60;
      v63.i32[0] = 0;
      int8x8_t v64 = (int8x8_t)vcgt_f32(v62, (float32x2_t)v60);
      v62.f32[0] = -*(float *)&v60;
      v62.i32[1] = v60;
      int8x8_t v65 = vand_s8((int8x8_t)v62, v64);
      v63.i32[1] = v61;
      int8x8_t v66 = (int8x8_t)vcgt_f32(v63, (float32x2_t)v61);
      v63.f32[0] = -*(float *)&v61;
      v63.i32[1] = v61;
      *(void *)buf = 0;
      *(float *)&double v111 = v98;
      *((float *)&v111 + 1) = (float)v55;
      float32x2_t v112 = vcvt_f32_u32((uint32x2_t)vand_s8(vorr_s8((int8x8_t)vceq_s32(vdup_n_s32(v52), (int32x2_t)0x200000006), (int8x8_t)vceq_s32(vdup_n_s32(v51 & 0xD), (int32x2_t)0x100000005)), (int8x8_t)0x100000001));
      float32x2_t v113 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32((uint32x2_t)vand_s8(v59, (int8x8_t)0xFF000000FFLL), (uint32x2_t)0xFFFFFFFAFFFFFFFBLL) & 0xFFFFFFF1FFFFFFF1));
      *(float *)&uint64_t v114 = (float)((v51 >> 4) & 1);
      *((float *)&v114 + 1) = (float)((v51 >> 7) & 1);
      float32x2_t v115 = vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)v59, (uint32x2_t)0xFFFFFFF7FFFFFFF8), (int8x8_t)0x100000001));
      unint64_t v116 = __PAIR64__(LODWORD(v97), COERCE_UNSIGNED_INT(fmaxf(v48, 0.0)));
      int8x8_t v117 = v65;
      *(void *)&long long v118 = __PAIR64__(LODWORD(v96), COERCE_UNSIGNED_INT(fmaxf(v49, 0.0)));
      *((int8x8_t *)&v118 + 1) = vand_s8((int8x8_t)v63, v66);
      *(float *)&long long v119 = (float)v8 / 255.0;
      *((float *)&v119 + 1) = (float)v7 / 255.0;
      *((float32x2_t *)&v119 + 1) = vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)v59, (uint32x2_t)0xFFFFFFF1FFFFFFF2), (int8x8_t)0x100000001));
      uint64_t v120 = 0;
      int v121 = 0;
      float v122 = v103;
      float v123 = v102;
      int8x8_t v124 = v100;
      float v125 = v104;
      float v126 = v99;
      int8x8_t v127 = v101;
      float v128 = (float)((v50 >> 1) & 1);
      long long v129 = 0u;
      long long v130 = 0u;
      long long v131 = 0u;
      uint64_t v132 = 0;
      [v19 dispatchGameControllerExtendedEventWithState:buf timestamp:a3];
      if (*((unsigned char *)v19 + 721))
      {
        buf[0] = v27;
        *(_DWORD *)&buf[1] = 0;
        *(_DWORD *)&buf[4] = 0;
        double v111 = v95;
        float32x2_t v112 = *(float32x2_t *)&v93;
        float32x2_t v113 = *(float32x2_t *)&v94;
        LOBYTE(v114) = v27;
        *(_DWORD *)((char *)&v114 + 1) = 0;
        HIDWORD(v114) = 0;
        float32x2_t v115 = *(float32x2_t *)&v92;
        unint64_t v116 = *(void *)&v91;
        int8x8_t v117 = *(int8x8_t *)&v90;
        long long v118 = 0u;
        long long v119 = 0u;
        uint64_t v120 = 0;
        [v19 dispatchMotionEventWithState:buf timestamp:a3];
      }
      unsigned int v67 = HIBYTE(v134);
      int v68 = HIBYTE(v134) & 0xF;
      unsigned int v69 = BYTE9(v134);
      unsigned int v70 = BYTE10(v134);
      int v71 = *((unsigned __int8 *)v19 + 901);
      BOOL v72 = v68 != v71;
      if (v68 != v71)
      {
        v73 = sub_50C4();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v68;
          _os_log_impl(&dword_0, v73, OS_LOG_TYPE_INFO, "(Right Trigger) Working Mode = %d", buf, 8u);
        }

        *((unsigned char *)v19 + 901) = v68;
      }
      if ((v69 & 0xF) != *((unsigned char *)v19 + 902))
      {
        v74 = sub_50C4();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v69 & 0xF;
          _os_log_impl(&dword_0, v74, OS_LOG_TYPE_INFO, "(Right Trigger) Arm Position = %d", buf, 8u);
        }

        *((unsigned char *)v19 + 902) = v69 & 0xF;
        BOOL v72 = 1;
      }
      unsigned int v75 = v69 >> 4;
      BOOL v77 = v68 == 1 || v68 == 4;
      int v78 = *((unsigned __int8 *)v19 + 903);
      if (v75 != v78 || v68 == 4 || v68 == 1)
      {
        if (v75 != 1) {
          BOOL v77 = 0;
        }
        if (v77 && BYTE5(v133[0]) == 0) {
          unsigned int v79 = 0;
        }
        else {
          unsigned int v79 = v69 >> 4;
        }
        if (v78 != v79)
        {
          v80 = sub_50C4();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v79;
            _os_log_impl(&dword_0, v80, OS_LOG_TYPE_INFO, "(Right Trigger) AD-T Control Status = %d", buf, 8u);
          }

          BOOL v72 = 1;
        }
        *((unsigned char *)v19 + 903) = v79;
      }
      unsigned int v81 = v67 >> 4;
      if (v67 >> 4 != *((unsigned __int8 *)v19 + 869))
      {
        v82 = sub_50C4();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v67 >> 4;
          _os_log_impl(&dword_0, v82, OS_LOG_TYPE_INFO, "(Left Trigger) Working Mode = %d", buf, 8u);
        }

        *((unsigned char *)v19 + 869) = v81;
        BOOL v72 = 1;
      }
      uint64_t v83 = v70 & 0xF;
      if (v83 != *((unsigned __int8 *)v19 + 870))
      {
        v84 = sub_50C4();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v70 & 0xF;
          _os_log_impl(&dword_0, v84, OS_LOG_TYPE_INFO, "(Left Trigger) Arm Position = %d", buf, 8u);
        }

        *((unsigned char *)v19 + 870) = v70 & 0xF;
        BOOL v72 = 1;
      }
      uint64_t v85 = v70 >> 4;
      BOOL v87 = v81 == 1 || v81 == 4;
      int v88 = *((unsigned __int8 *)v19 + 871);
      if (v85 != v88 || v81 == 4 || v81 == 1)
      {
        if (v85 != 1) {
          BOOL v87 = 0;
        }
        if (v87 && BYTE4(v133[0]) == 0) {
          uint64_t v85 = 0;
        }
        else {
          uint64_t v85 = v85;
        }
        if (v88 == v85)
        {
          if (!v72)
          {
LABEL_104:
            objc_destroyWeak(&v109);

            goto LABEL_105;
          }
          uint64_t v85 = *((unsigned __int8 *)v19 + 871);
        }
        else
        {
          v89 = sub_50C4();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v85;
            _os_log_impl(&dword_0, v89, OS_LOG_TYPE_INFO, "(Left Trigger) AD-T Control Status = %d", buf, 8u);
          }

          *((unsigned char *)v19 + 871) = v85;
          uint64_t v83 = *((unsigned __int8 *)v19 + 870);
        }
      }
      else if (!v72)
      {
        goto LABEL_104;
      }
      [v19[126] updateAdaptiveTriggerStatusWithLeftMode:*((unsigned __int8 *)v19 + 848) leftStatus:v85 leftArmPosition:v83 rightMode:*((unsigned __int8 *)v19 + 880) rightStatus:*((unsigned __int8 *)v19 + 903) rightArmPosition:*((unsigned __int8 *)v19 + 902)];
      goto LABEL_104;
    }
    if (a5 == 1)
    {
      id v17 = v106;
      [v17 bytes];
      if ([(dispatch_once_t *)v16 isBluetoothClassic]
        && [v17 length] == (char *)&dword_8 + 2)
      {
        LOBYTE(v111) = 0;
        *(void *)buf = 0;
        [v17 length];
        __memcpy_chk();
        LODWORD(v133[0]) = 0;
        BYTE9(v133[0]) = 0;
        *(_WORD *)((char *)v133 + 7) = 0;
        WORD2(v133[0]) = 0;
LABEL_17:
        if ([(dispatch_once_t *)v16 isBluetoothClassic]
          && [v17 length] == (char *)&dword_8 + 2)
        {
          v135[2] = v135[2] & 0xFFF0 | 0xA;
        }
        goto LABEL_10;
      }
      if (([(dispatch_once_t *)v16 isBluetoothClassic] & 1) == 0
        && [v17 length] == &stru_20.vmsize)
      {
        [v17 length];
        __memcpy_chk();
        goto LABEL_17;
      }
    }
  }
LABEL_105:
}

void sub_CF10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id *location)
{
}

void sub_CF4C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dispatchQueue];
  if (v2)
  {
    dispatch_time_t v3 = dispatch_time(0, 2500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_D02C;
    block[3] = &unk_18580;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    dispatch_after(v3, v2, block);
    objc_destroyWeak(&v5);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 708) = 1;
  }
}

void sub_D02C(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    dispatch_time_t v3 = objc_loadWeakRetained(v1);
    v3[708] = 1;
    [v3 sendBatteryReport];
  }
}

void sub_D864(uint64_t a1, int a2)
{
  kdebug_trace();
  if (a2)
  {
    dispatch_time_t v3 = sub_50C4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_FF70();
    }
  }
}

void sub_D8D0(uint64_t a1, int a2)
{
  kdebug_trace();
  if (a2)
  {
    dispatch_time_t v3 = sub_50C4();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_FFD8();
    }
  }
}

id sub_E214(uint64_t a1)
{
  uint64_t v2 = sub_50C4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    int v4 = *(unsigned __int8 *)(a1 + 41);
    int v5 = *(unsigned __int8 *)(a1 + 42);
    int v6 = *(unsigned __int8 *)(a1 + 43);
    int v7 = *(unsigned __int8 *)(a1 + 44);
    v11[0] = 67110144;
    v11[1] = v3;
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 1024;
    int v15 = v5;
    __int16 v16 = 1024;
    int v17 = v6;
    __int16 v18 = 1024;
    int v19 = v7;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "setPlayerLights: %d%d%d%d%d", (uint8_t *)v11, 0x20u);
  }

  uint64_t v8 = *(void *)(a1 + 32) + 1024;
  char v9 = *(unsigned char *)(a1 + 44);
  *(_DWORD *)uint64_t v8 = *(_DWORD *)(a1 + 40);
  *(unsigned char *)(v8 + 4) = v9;
  id result = [*(id *)(a1 + 32) isHapticsActive];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) dispatchOutputReport];
  }
  return result;
}

id sub_EAD0(uint64_t a1)
{
  uint64_t v2 = sub_50C4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    double v3 = *(float *)(a1 + 40);
    double v4 = *(float *)(a1 + 44);
    double v5 = *(float *)(a1 + 48);
    int v8 = 134218496;
    double v9 = v3;
    __int16 v10 = 2048;
    double v11 = v4;
    __int16 v12 = 2048;
    double v13 = v5;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "updateLightWithRed:%f green:%f blue:%f", (uint8_t *)&v8, 0x20u);
  }

  int v6 = *(unsigned char **)(a1 + 32);
  if (!v6[1029])
  {
    [v6 setExtendedSupportEnabled:1];
    int v6 = *(unsigned char **)(a1 + 32);
  }
  v6[722] = (int)(float)(*(float *)(a1 + 40) * 255.0);
  *(unsigned char *)(*(void *)(a1 + 32) + 723) = (int)(float)(*(float *)(a1 + 44) * 255.0);
  *(unsigned char *)(*(void *)(a1 + 32) + 724) = (int)(float)(*(float *)(a1 + 48) * 255.0);
  id result = [*(id *)(a1 + 32) isHapticsActive];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) dispatchOutputReport];
  }
  return result;
}

void sub_EEBC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = *(unsigned char **)(a1 + 32);
    if (!v2[1029]) {
      [v2 setExtendedSupportEnabled:1];
    }
  }
  double v3 = sub_50C4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "updateSensorsEnabled %d", (uint8_t *)v5, 8u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 721) = *(unsigned char *)(a1 + 40);
}

id sub_F208(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAdaptiveTriggerWithMode:enabledPositions:resistiveStrengths:frequency:forIndex:", *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 52), *(void *)(a1 + 54), *(unsigned __int16 *)(a1 + 62), 0, *(unsigned int *)(a1 + 48));
}

id sub_F45C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAdaptiveTriggerWithMode:enabledPositions:resistiveStrengths:frequency:forIndex:", *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 56), *(void *)(a1 + 58), *(unsigned __int16 *)(a1 + 66), (int)*(float *)(a1 + 48), *(unsigned int *)(a1 + 52));
}

id sub_F6A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAdaptiveTriggerWithMode:enabledPositions:resistiveStrengths:frequency:forIndex:", *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 56), *(void *)(a1 + 58), *(unsigned __int16 *)(a1 + 66), (int)*(float *)(a1 + 48), *(unsigned int *)(a1 + 52));
}

id sub_F880(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAdaptiveTriggerWithMode:enabledPositions:resistiveStrengths:frequency:forIndex:", *(void *)(a1 + 40), *(unsigned __int16 *)(a1 + 52), *(void *)(a1 + 54), *(unsigned __int16 *)(a1 + 62), 0, *(unsigned int *)(a1 + 48));
}

void sub_F938(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 40);
  if (v2)
  {
    if (v2 != 1)
    {
      double v3 = *(char **)(a1 + 32);
      goto LABEL_10;
    }
    double v3 = *(char **)(a1 + 32);
    uint64_t v4 = 872;
  }
  else
  {
    double v3 = *(char **)(a1 + 32);
    uint64_t v4 = 840;
  }
  if (!*(void *)&v3[v4 + 8])
  {
    double v5 = sub_50C4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = *(_DWORD *)(a1 + 40);
      v7[0] = 67109120;
      v7[1] = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Received request to turn off adaptive trigger at index %d, but it is already off. Ignoring.", (uint8_t *)v7, 8u);
    }

    return;
  }
LABEL_10:

  [v3 setAdaptiveTriggerWithMode:0 enabledPositions:0 resistiveStrengths:0 frequency:0 forIndex:0];
}

void sub_FB4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_FB68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

NSXPCInterface *sub_FB90()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCMotionServiceClientInterface];
}

NSXPCInterface *sub_FBA4()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCMotionServiceServerInterface];
}

NSXPCInterface *sub_FBB8()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCLightServiceClientInterface];
}

NSXPCInterface *sub_FBCC()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCLightServiceServerInterface];
}

NSXPCInterface *sub_FBE0()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCBatteryServiceClientInterface];
}

NSXPCInterface *sub_FBF4()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCBatteryServiceServerInterface];
}

void sub_FC08(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "setProperty: %@ forKey: %@", (uint8_t *)&v3, 0x16u);
}

void sub_FC90(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Dispatching event...", v1, 2u);
}

void sub_FCD4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Stopping timer...", v1, 2u);
}

void sub_FD18(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_FD84()
{
  sub_FB84();
  sub_FB4C(&dword_0, v0, v1, "(Async) Unable to retrieve firmware info from DualSense - error %d", v2, v3, v4, v5, v6);
}

void sub_FDEC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_FE58()
{
  sub_FB84();
  sub_FB4C(&dword_0, v0, v1, "(Async) Unable to retrieve sensor calibration info from DualSense - error %d", v2, v3, v4, v5, v6);
}

void sub_FEC0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to retreive pairing info from DualSense.", v1, 2u);
}

void sub_FF04(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_FF70()
{
  sub_FB84();
  sub_FB4C(&dword_0, v0, v1, "(Async) Unable to send BT output report to DualSense - error %d", v2, v3, v4, v5, v6);
}

void sub_FFD8()
{
  sub_FB84();
  sub_FB4C(&dword_0, v0, v1, "(Async) Unable to send USB output report to DualSense - error %d", v2, v3, v4, v5, v6);
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

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
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

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createVirtualHIDDeviceForBattery(void *a1, const char *a2, ...)
{
  return [a1 createVirtualHIDDeviceForBattery];
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

id objc_msgSend_determineSupportMode(void *a1, const char *a2, ...)
{
  return [a1 determineSupportMode];
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

id objc_msgSend_dispatchOutputReport(void *a1, const char *a2, ...)
{
  return [a1 dispatchOutputReport];
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

id objc_msgSend_eventID(void *a1, const char *a2, ...)
{
  return [a1 eventID];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
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

id objc_msgSend_isHapticsActive(void *a1, const char *a2, ...)
{
  return [a1 isHapticsActive];
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return [a1 isIdle];
}

id objc_msgSend_isVirtualDevice(void *a1, const char *a2, ...)
{
  return [a1 isVirtualDevice];
}

id objc_msgSend_lastEventTime(void *a1, const char *a2, ...)
{
  return [a1 lastEventTime];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
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

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_requestFirmwareInfo(void *a1, const char *a2, ...)
{
  return [a1 requestFirmwareInfo];
}

id objc_msgSend_requestPairingInfo(void *a1, const char *a2, ...)
{
  return [a1 requestPairingInfo];
}

id objc_msgSend_requestSensorCalibrationInfo(void *a1, const char *a2, ...)
{
  return [a1 requestSensorCalibrationInfo];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheduleIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 scheduleIdleTimer];
}

id objc_msgSend_sendBatteryReport(void *a1, const char *a2, ...)
{
  return [a1 sendBatteryReport];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
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