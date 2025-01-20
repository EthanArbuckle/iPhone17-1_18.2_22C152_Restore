uint64_t sub_390C()
{
  return sub_515C("GamepadHIDServiceFilter");
}

void sub_3C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3C70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_519C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Connection to com.apple.GameController.gamecontrollerd.driver invalidated", v3, 2u);
  }

  [WeakRetained setInterruptionHandler:0];
  [WeakRetained setInvalidationHandler:0];
  [WeakRetained invalidate];
}

void sub_3D08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_519C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Connection to com.apple.GameController.gamecontrollerd.driver interrupted.  Attempting to re-establish.", v4, 2u);
  }

  v3 = [WeakRetained remoteObjectProxy];
  [v3 driverCheckIn];
}

void *sub_4434(void *result)
{
  if (*(void *)(result[4] + 56) == result[5])
  {
    v1 = result;
    v2 = sub_519C();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Game intent gesture (long) recognized", v3, 2u);
    }

    return [*(id *)(v1[4] + 40) triggerGameIntentWithEvent:1];
  }
  return result;
}

void sub_4700(uint64_t a1)
{
  v2 = sub_519C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "cancel calling cancel handler", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = 0;
}

uint64_t sub_4DF8()
{
  if (qword_D6E0 != -1) {
    dispatch_once(&qword_D6E0, &stru_82B0);
  }
  return byte_D6D8;
}

void sub_4E3C(id a1)
{
  byte_D6D8 = os_variant_has_internal_diagnostics();
}

id sub_4E64()
{
  if (qword_D6F0 != -1) {
    dispatch_once(&qword_D6F0, &stru_82D0);
  }
  v0 = (void *)qword_D6E8;

  return v0;
}

void sub_4EB8(id a1)
{
  qword_D6E8 = (uint64_t)os_log_create("com.apple.GameController", "default");

  _objc_release_x1();
}

id sub_4EFC()
{
  if (qword_D700 != -1) {
    dispatch_once(&qword_D700, &stru_82F0);
  }
  v0 = (void *)qword_D6F8;

  return v0;
}

void sub_4F50(id a1)
{
  qword_D6F8 = (uint64_t)os_log_create("com.apple.GameController", "monitor");

  _objc_release_x1();
}

id sub_4F94()
{
  if (qword_D710 != -1) {
    dispatch_once(&qword_D710, &stru_8310);
  }
  v0 = (void *)qword_D708;

  return v0;
}

void sub_4FE8(id a1)
{
  qword_D708 = (uint64_t)os_log_create("com.apple.GameController", "init");

  _objc_release_x1();
}

id sub_502C()
{
  if (qword_D720 != -1) {
    dispatch_once(&qword_D720, &stru_8330);
  }
  v0 = (void *)qword_D718;

  return v0;
}

void sub_5080(id a1)
{
  qword_D718 = (uint64_t)os_log_create("com.apple.GameController", "analytics");

  _objc_release_x1();
}

id sub_50C4()
{
  if (qword_D730 != -1) {
    dispatch_once(&qword_D730, &stru_8350);
  }
  v0 = (void *)qword_D728;

  return v0;
}

void sub_5118(id a1)
{
  qword_D728 = (uint64_t)os_log_create("com.apple.GameController.Daemon", "default");

  _objc_release_x1();
}

uint64_t sub_515C(char *category)
{
  qword_D738 = (uint64_t)os_log_create("com.apple.GameController.HID", category);

  return _objc_release_x1();
}

id sub_519C()
{
  if (qword_D740 != -1) {
    dispatch_once(&qword_D740, &stru_8370);
  }
  v0 = (void *)qword_D738;

  return v0;
}

void sub_51F0(id a1)
{
  if (!qword_D738) {
    objc_storeStrong((id *)&qword_D738, &_os_log_default);
  }
}

id sub_5214()
{
  if (qword_D750 != -1) {
    dispatch_once(&qword_D750, &stru_8390);
  }
  v0 = (void *)qword_D748;

  return v0;
}

void sub_5268(id a1)
{
  qword_D748 = (uint64_t)os_log_create("com.apple.GameController.Settings", "default");

  _objc_release_x1();
}

id sub_52AC()
{
  if (qword_D760 != -1) {
    dispatch_once(&qword_D760, &stru_83B0);
  }
  v0 = (void *)qword_D758;

  return v0;
}

void sub_5300(id a1)
{
  qword_D758 = (uint64_t)os_log_create("com.apple.GameController.Haptics", "default");

  _objc_release_x1();
}

id sub_5344()
{
  if (qword_D770 != -1) {
    dispatch_once(&qword_D770, &stru_83D0);
  }
  v0 = (void *)qword_D768;

  return v0;
}

void sub_5398(id a1)
{
  qword_D768 = (uint64_t)os_log_create("com.apple.gamecontroller", "Signposts");

  _objc_release_x1();
}

id sub_53DC()
{
  if (qword_D780 != -1) {
    dispatch_once(&qword_D780, &stru_83F0);
  }
  v0 = (void *)qword_D778;

  return v0;
}

void sub_5430(id a1)
{
  qword_D778 = (uint64_t)os_log_create("com.apple.runtime-issues", "GameController");

  _objc_release_x1();
}

NSXPCInterface *sub_5474()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCMotionServiceClientInterface];
}

NSXPCInterface *sub_5488()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCMotionServiceServerInterface];
}

NSXPCInterface *sub_549C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCBatteryServiceClientInterface];
}

NSXPCInterface *sub_54B0()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCBatteryServiceServerInterface];
}

id sub_54C4(uint64_t a1, int a2)
{
  v4 = +[NSMutableString stringWithCapacity:2 * a2];
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1;
    do
    {
      if (v5 == 2) {
        CFStringRef v6 = &stru_85F0;
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

uint64_t sub_55CC()
{
  if (qword_D788 != -1) {
    dispatch_once(&qword_D788, &stru_8410);
  }
  return byte_D790;
}

void sub_5610(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.GameController"];
  byte_D790 = [v1 BOOLForKey:@"GCPartnersEnable"];
  v2 = sub_519C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = byte_D790;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v3, 8u);
  }
}

NSXPCInterface *sub_56F0()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCLightServiceClientInterface];
}

NSXPCInterface *sub_5704()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCLightServiceServerInterface];
}

NSXPCInterface *sub_5718()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCGameIntentServiceClientInterface];
}

NSXPCInterface *sub_572C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCGameIntentServiceServerInterface];
}

NSXPCInterface *sub_5740()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCAdaptiveTriggersServiceClientInterface];
}

NSXPCInterface *sub_5754()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCAdaptiveTriggersServiceServerInterface];
}

NSXPCInterface *sub_5768()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceClientInterface];
}

NSXPCInterface *sub_577C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceServerInterface];
}

id sub_5790()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GCDriverClientInterface];
  id v1 = sub_5768();
  [v0 setInterface:v1 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v2 = sub_577C();
  [v0 setInterface:v2 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  uint64_t v3 = sub_56F0();
  [v0 setInterface:v3 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v4 = sub_5704();
  [v0 setInterface:v4 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  unint64_t v5 = sub_5740();
  [v0 setInterface:v5 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  CFStringRef v6 = sub_5754();
  [v0 setInterface:v6 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v7 = sub_5474();
  [v0 setInterface:v7 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v8 = sub_5488();
  [v0 setInterface:v8 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v9 = sub_549C();
  [v0 setInterface:v9 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v10 = sub_54B0();
  [v0 setInterface:v10 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v11 = sub_5718();
  [v0 setInterface:v11 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v12 = sub_572C();
  [v0 setInterface:v12 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v13 = GCGenericDeviceDriverConfigurationServiceClientInterface();
  [v0 setInterface:v13 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v14 = GCGenericDeviceDriverConfigurationServiceServerInterface();
  [v0 setInterface:v14 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *sub_5A4C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GCDriverServerInterface];
}

uint64_t GCGenericDeviceDriverConfigurationServiceClientInterface()
{
  return _GCGenericDeviceDriverConfigurationServiceClientInterface();
}

uint64_t GCGenericDeviceDriverConfigurationServiceServerInterface()
{
  return _GCGenericDeviceDriverConfigurationServiceServerInterface();
}

uint64_t IOHIDServiceGetService()
{
  return _IOHIDServiceGetService();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
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

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_driverCheckIn(void *a1, const char *a2, ...)
{
  return [a1 driverCheckIn];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_initGameControllerDaemonXPC(void *a1, const char *a2, ...)
{
  return [a1 initGameControllerDaemonXPC];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}