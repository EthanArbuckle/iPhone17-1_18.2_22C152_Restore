uint64_t sub_100003980(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = NSStringFromSelector((SEL)[*(id *)(a1 + 32) selector]);
  v3 = [v2 componentsSeparatedByString:@":"];
  [v3 objectAtIndexedSubscript:0];
  objc_claimAutoreleasedReturnValue();

  mach_absolute_time();
  [*(id *)(a1 + 32) invokeWithTarget:*(void *)(*(void *)(a1 + 40) + 8)];
  SGRecordMeasurementState();
  return SGRecordMeasurementState();
}

void sub_100003A30(_Unwind_Exception *a1)
{
}

void sub_100003F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SGM2PerfSuggestdLaunchedReadFrom(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadString();
      v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

int main(int argc, const char **argv, const char **envp)
{
  char v4 = ii_default_log_handle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Starting suggestd", buf, 2u);
  }

  unsigned int v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  dispatch_source_set_event_handler(v5, &stru_10000C4A8);
  dispatch_resume(v5);
  v25.rlim_cur = 0;
  v25.rlim_max = 0;
  if (getrlimit(8, &v25))
  {
    unint64_t v6 = ii_default_log_handle();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:

      goto LABEL_12;
    }
    int v7 = *__error();
    char v8 = __error();
    v9 = strerror(*v8);
    *(_DWORD *)buf = 67109378;
    int v28 = v7;
    __int16 v29 = 2080;
    v30 = v9;
    int v10 = "Unable to getrlimit: [%i] %s";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v10, buf, 0x12u);
    goto LABEL_7;
  }
  if (v25.rlim_cur <= 0x4FF)
  {
    v25.rlim_cur = 1280;
    if (setrlimit(8, &v25))
    {
      unint64_t v6 = ii_default_log_handle();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      int v11 = *__error();
      uint64_t v12 = __error();
      v13 = strerror(*v12);
      *(_DWORD *)buf = 67109378;
      int v28 = v11;
      __int16 v29 = 2080;
      v30 = v13;
      int v10 = "Unable to setrlimit: [%i] %s";
      goto LABEL_6;
    }
  }
LABEL_12:
  zone = malloc_create_zone(0, 0);
  malloc_set_zone_name(zone, "ICU");
  int v26 = 0;
  u_setMemoryFunctions();
  if (v26)
  {
    v15 = ii_default_log_handle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v28 = v26;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not set up ICU malloc zone; err = %i",
        buf,
        8u);
    }
  }
  v16 = objc_opt_new();
  +[_PASCrashHelper optInCurrentProcessForLogFaultProbabalisticCrashesWithConfig:v16];

  +[CLLocationManager sg_swizzle];
  +[SGSuggestionsSystem start];
  SGDServerRun();
  v17 = objc_opt_new();
  v18 = +[PETEventTracker2 sharedInstance];
  [v18 trackScalarForMessage:v17];

  id v19 = objc_alloc((Class)NSString);
  v20 = [v17 key];
  id v21 = [v19 initWithFormat:@"%@.%@", @"com.apple.Proactive.suggestd", v20];

  v22 = [v17 dictionaryRepresentation];
  AnalyticsSendEvent();

  v23 = +[NSRunLoop currentRunLoop];
  [v23 run];

  return 0;
}

void sub_100004980(id a1)
{
  v1 = ii_default_log_handle();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Received SIGTERM; exiting", v2, 2u);
  }

  IIExit();
}

void sub_100004D14(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = ii_default_log_handle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    Name = protocol_getName(*(Protocol **)(a1 + 32));
    int v6 = 136315394;
    int v7 = Name;
    __int16 v8 = 1024;
    unsigned int v9 = [WeakRetained processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "XPC Connection %s from %d invalidated", (uint8_t *)&v6, 0x12u);
  }

  if (WeakRetained)
  {
    id v5 = *(id *)(a1 + 40);
    objc_sync_enter(v5);
    [*(id *)(*(void *)(a1 + 40) + 16) removeObject:WeakRetained];
    objc_sync_exit(v5);
  }
}

void sub_100004E20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005000(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005114(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100005388(void *a1)
{
  id v1 = a1;
  id v11 = 0;
  v2 = +[LSApplicationRecord bundleRecordWithApplicationIdentifier:v1 error:&v11];
  id v3 = v11;
  if (v2)
  {
    char v4 = [v2 bundleIdentifier];
    if (v4)
    {
      id v10 = v3;
      id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v10];
      id v6 = v10;

      int v7 = [v5 applicationState];
      id v8 = 0;
      if ([v7 isValid]) {
        id v8 = [v7 isInstalled];
      }

      id v3 = v6;
    }
    else
    {
      id v5 = ii_default_log_handle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v1;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SGDServer: no bundle identifier found for application %@", buf, 0xCu);
      }
      id v8 = 0;
    }
  }
  else
  {
    char v4 = ii_default_log_handle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "SGDServer: no such application found: %@", buf, 0xCu);
    }
    id v8 = 0;
  }

  return v8;
}

void sub_1000055B0(id a1)
{
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)qword_1000126B8;
  qword_1000126B8 = v2;
}

void SGDServerRun()
{
  +[IIStartupManager start];
  if (qword_1000126B0 != -1)
  {
    dispatch_once(&qword_1000126B0, &stru_10000C4E8);
  }
}

void sub_10000565C(id a1)
{
  id v1 = ii_default_log_handle();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    LOWORD(v30[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Starting suggestd...", (uint8_t *)v30, 2u);
  }

  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_10000C528);
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_10000C548);

  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2050000000;
  uint64_t v2 = (void *)qword_1000126C8;
  uint64_t v34 = qword_1000126C8;
  if (!qword_1000126C8)
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100005C14;
    v30[3] = &unk_10000C5B8;
    v30[4] = &v31;
    sub_100005C14((uint64_t)v30);
    uint64_t v2 = (void *)v32[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v31, 8);
  [v3 start];
  char v4 = +[SGDServer sharedServer];
  id v5 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.suggestd.mail"];
  [v4 setupWithConnectionListener:v5 protocol:&OBJC_PROTOCOL___SGDSuggestManagerMailProtocol entitlement:@"com.apple.private.suggestions.mail"];

  id v6 = +[SGDServer sharedServer];
  id v7 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.suggestd.messages"];
  [v6 setupWithConnectionListener:v7 protocol:&OBJC_PROTOCOL___SGDSuggestManagerMessagesProtocol entitlement:@"com.apple.private.suggestions.messages"];

  id v8 = +[SGDServer sharedServer];
  id v9 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.suggestd.contacts"];
  [v8 setupWithConnectionListener:v9 protocol:&OBJC_PROTOCOL___SGDSuggestManagerContactsProtocol entitlement:@"com.apple.private.suggestions.contacts"];

  id v10 = +[SGDServer sharedServer];
  id v11 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.suggestd.urls"];
  [v10 setupWithConnectionListener:v11 protocol:&OBJC_PROTOCOL___SGDSuggestManagerURLsProtocol entitlement:@"com.apple.private.suggestions.urls"];

  uint64_t v12 = +[SGDServer sharedServer];
  id v13 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.suggestd.events"];
  [v12 setupWithConnectionListener:v13 protocol:&OBJC_PROTOCOL___SGDSuggestManagerEventsProtocol entitlement:@"com.apple.private.suggestions.events"];

  v14 = +[SGDServer sharedServer];
  id v15 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.suggestd.internal"];
  [v14 setupWithConnectionListener:v15 protocol:&OBJC_PROTOCOL___SGDSuggestManagerInternalProtocol entitlement:@"com.apple.private.suggestions.internal"];

  v16 = +[SGDServer sharedServer];
  id v17 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.suggestd.ipsos"];
  [v16 setupWithConnectionListener:v17 protocol:&OBJC_PROTOCOL___SGDSuggestManagerIpsosProtocol entitlement:@"com.apple.private.suggestions.ipsos"];

  v18 = +[SGDServer sharedServer];
  id v19 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.suggestd.reminders"];
  [v18 setupWithConnectionListener:v19 protocol:&OBJC_PROTOCOL___SGDSuggestManagerRemindersProtocol entitlement:@"com.apple.private.suggestions.reminders"];

  v20 = +[SGDServer sharedServer];
  id v21 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.suggestd.deliveries"];
  [v20 setupWithConnectionListener:v21 protocol:&OBJC_PROTOCOL___SGDSuggestManagerDeliveriesProtocol entitlement:@"com.apple.private.suggestions.deliveries"];

  v22 = +[SGDServer sharedServer];
  id v23 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.suggestd.spotlightknowledged"];
  [v22 setupWithConnectionListener:v23 protocol:&OBJC_PROTOCOL___SGDSuggestManagerSpotlightKnowledgeProtocol entitlement:@"com.apple.private.suggestions.spotlightknowledged"];

  v24 = +[SGDServer sharedServer];
  id v25 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.suggestd.fides"];
  [v24 setupWithConnectionListener:v25 protocol:&OBJC_PROTOCOL___SGDSuggestManagerFidesProtocol entitlement:@"com.apple.private.des-service"];

  +[PPXPCServer registerXPCListeners];
  +[PREXPCServer registerPREXPCListeners];
  +[PSGXPCServer registerXPCListeners];
  if (_os_feature_enabled_impl())
  {
    int v26 = ii_default_log_handle();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "ProactiveHarvesting enabled, starting system.", (uint8_t *)v30, 2u);
    }

    v27 = +[SGAsset asset];
    +[HVProactiveHarvestingSystem startWithConfigurationAsset:v27];

    int v28 = +[NSFileManager defaultManager];
    __int16 v29 = +[SGPaths suggestionsSubdirectory:@"pending"];
    [v28 removeItemAtPath:v29 error:0];

    +[PSGProactiveInputPredictionsSystem start];
  }
  +[PPPortraitSystem start];
}

void sub_100005BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100005C14(uint64_t a1)
{
  if (!qword_1000126D0) {
    qword_1000126D0 = _sl_dlopen();
  }
  Class result = objc_getClass("PSUSummarizationXPCServer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000126C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100005D14()
{
  uint64_t result = _sl_dlopen();
  qword_1000126D0 = result;
  return result;
}

void sub_100005D88(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    char v4 = string;
    id v6 = +[NSString stringWithUTF8String:v4];
    id v7 = ii_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      uint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "launch event: distnoted: %@", (uint8_t *)&v11, 0xCu);
    }

    if (v6)
    {
      +[PPEventStreamHandler prepareToHandleNotificationWithName:v6];
      id v8 = xpc_dictionary_get_value(v2, "UserInfo");
      id v9 = (void *)_CFXPCCreateCFObjectFromXPCObject();
      id v10 = +[NSNotificationCenter defaultCenter];
      [v10 postNotificationName:v6 object:0 userInfo:v9];
    }
  }
}

void sub_100005EEC(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    char v4 = string;
    id v6 = +[NSString stringWithUTF8String:v4];
    id v7 = ii_default_log_handle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "launch event: notifyd: %@", (uint8_t *)&v9, 0xCu);
    }

    if (v6)
    {
      +[PPEventStreamHandler prepareToHandleNotificationWithName:v6];
      id v8 = +[NSNotificationCenter defaultCenter];
      [v8 postNotificationName:v6 object:0 userInfo:0];
    }
  }
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t IIExit()
{
  return _IIExit();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

uint64_t SGRecordMeasurementState()
{
  return _SGRecordMeasurementState();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _PASEvaluateLogFaultAndProbCrashCriteria()
{
  return __PASEvaluateLogFaultAndProbCrashCriteria();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void abort(void)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_addMethod(cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_replaceMethod(cls, name, imp, types);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

int getrlimit(int a1, rlimit *a2)
{
  return _getrlimit(a1, a2);
}

uint64_t ii_default_log_handle()
{
  return _ii_default_log_handle();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return _malloc_create_zone(start_size, flags);
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
}

void method_exchangeImplementations(Method m1, Method m2)
{
}

IMP method_getImplementation(Method m)
{
  return _method_getImplementation(m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return _method_getTypeEncoding(m);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
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

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return _protocol_getName(p);
}

int setrlimit(int a1, const rlimit *a2)
{
  return _setrlimit(a1, a2);
}

uint64_t sgLogHandle()
{
  return _sgLogHandle();
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t u_setMemoryFunctions()
{
  return _u_setMemoryFunctions();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_asset(void *a1, const char *a2, ...)
{
  return [a1 asset];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultHarvestStore(void *a1, const char *a2, ...)
{
  return [a1 defaultHarvestStore];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_entitlement(void *a1, const char *a2, ...)
{
  return [a1 entitlement];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return [a1 protocol];
}

id objc_msgSend_registerPREXPCListeners(void *a1, const char *a2, ...)
{
  return [a1 registerPREXPCListeners];
}

id objc_msgSend_registerXPCListeners(void *a1, const char *a2, ...)
{
  return [a1 registerXPCListeners];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return [a1 selector];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedServer(void *a1, const char *a2, ...)
{
  return [a1 sharedServer];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_xpcInterfaceForProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcInterfaceForProtocol:");
}