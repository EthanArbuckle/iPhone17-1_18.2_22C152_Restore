void sub_100003F14()
{
  NSObject *v0;

  v0 = +[_CDLogging knowledgeChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_100005A48();
  }
}

void sub_100003F78(uint64_t a1)
{
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    v7 = (id *)(a1 + 32);
    v8 = [v4 _extractInteractionsFromEvents:v5 onStream:v6];
    v9 = objc_release_x19;
    if ([*v7 count])
    {
      v10 = +[_CDLogging instrumentationChannel];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_100005970(v7);
      }

      id v11 = [*v7 count];
      v12 = [*v7 firstObject];
      v13 = [v12 stream];
      v14 = [v13 name];
      v15 = +[NSString stringWithFormat:@"com.apple.coreduet.monitors.HistoricalEventRecorded.%@", v14];
      +[_CDDiagnosticDataReporter addValue:v11 forScalarKey:v15];

      v16 = (void *)v4[5];
      id v17 = *v7;
      v21[0] = _NSConcreteStackBlock;
      v9 = objc_release_x19;
      v21[1] = 3221225472;
      v21[2] = sub_100003F14;
      v21[3] = &unk_100008378;
      id v22 = v17;
      [v16 saveObjects:v22 tracker:&stru_100008350 responseQueue:0 withCompletion:v21];
    }
    if ([v8 count])
    {
      v18 = +[_CDLogging instrumentationChannel];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_1000058F8(v8);
      }

      v19[0] = _NSConcreteStackBlock;
      v19[1] = *((void *)v9 + 336);
      v19[2] = sub_100004D6C;
      v19[3] = &unk_1000083A0;
      id v20 = v8;
      [v4 _recordInteractions:v20 enforceDataLimits:1 enforcePrivacy:1 reply:v19];
    }
  }
}

void sub_100004450(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100003F78;
    v12[3] = &unk_1000083C8;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    id v13 = v6;
    id v14 = v5;
    v8 = v12;
    v9 = v7;
    v10 = (void *)os_transaction_create();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000045CC;
    block[3] = &unk_1000084E0;
    id v17 = v10;
    id v18 = v8;
    id v11 = v10;
    dispatch_async(v9, block);

    objc_destroyWeak(&v15);
  }
}

void sub_1000045B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000045CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000045DC(id a1, id a2)
{
}

void sub_100004654(id a1)
{
  qword_10000CBE8 = objc_alloc_init(_CDContextServiceManager);
  _objc_release_x1();
}

void sub_100004B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004D3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100004D6C()
{
  v0 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_100005AC0();
  }
}

void sub_100004DD0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100004F4C;
    v12[3] = &unk_1000083C8;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    id v13 = v5;
    id v14 = v6;
    v8 = v12;
    v9 = v7;
    v10 = (void *)os_transaction_create();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000045CC;
    block[3] = &unk_1000084E0;
    id v17 = v10;
    id v18 = v8;
    id v11 = v10;
    dispatch_async(v9, block);

    objc_destroyWeak(&v15);
  }
}

void sub_100004F38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100004F4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100005C54(a1);
    }

    v4 = (void *)WeakRetained[5];
    uint64_t v5 = *(void *)(a1 + 40);
    id v10 = 0;
    id v6 = [v4 deleteAllEventsMatchingPredicate:v5 error:&v10];
    id v7 = v10;
    v8 = +[_CDLogging instrumentationChannel];
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100005BC8(a1, (uint64_t)v7, v9);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      sub_100005B38((uint64_t)v6);
    }
  }
}

void sub_100005048(id a1, _CDEventStream *a2, _DKMonitoring *a3)
{
  uint64_t v3 = a3;
  if ([(_DKMonitoring *)v3 conformsToProtocol:&OBJC_PROTOCOL____DKInstantMonitor]
    && [(_DKMonitoring *)v3 conformsToProtocol:&OBJC_PROTOCOL____DKHistoricalMonitor])
  {
    v4 = v3;
    uint64_t v5 = +[_CDLogging contextChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138412290;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Running general shutdown handler for monitor %@", buf, 0xCu);
    }
    v8 = [(_DKMonitoring *)v4 currentEvent];

    if (v8)
    {
      v9 = +[NSDate date];
      id v10 = [(_DKMonitoring *)v4 currentEvent];
      [v10 setEndDate:v9];

      id v11 = [(_DKMonitoring *)v4 historicalHandler];

      if (v11)
      {
        v12 = [(_DKMonitoring *)v4 historicalHandler];
        id v13 = [(_DKMonitoring *)v4 currentEvent];
        id v15 = v13;
        id v14 = +[NSArray arrayWithObjects:&v15 count:1];
        ((void (**)(void, void *))v12)[2](v12, v14);
      }
    }
  }
}

Class sub_10000537C(uint64_t a1)
{
  sub_1000053CC();
  Class result = objc_getClass("CUObjCEvidenceSystem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10000CBF8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000053CC()
{
  if (!qword_10000CC00) {
    qword_10000CC00 = _sl_dlopen();
  }
}

uint64_t sub_10000549C()
{
  uint64_t result = _sl_dlopen();
  qword_10000CC00 = result;
  return result;
}

Class sub_100005510(uint64_t a1)
{
  sub_1000053CC();
  Class result = objc_getClass("CUObjCInferenceEngine");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10000CC08 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100005584(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000055A4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_1000055C4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1000057A4(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v3 = +[_CDContextServiceManager sharedInstance];
    uint64_t v4 = [v3 monitorManager];
    uint64_t v5 = +[CDNotifydMonitor xpcDictionaryToFoundation:v2];
    [v4 deliverNotificationEvent:v5];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100005DC8();
  }
}

uint64_t start()
{
  getpid();
  int v0 = memorystatus_control();
  if (v0) {
    syslog(3, "Error setting jetsam priority: %d", v0);
  }
  v2 = (void *)os_transaction_create();
  uint64_t v3 = +[_CDContextServiceManager sharedInstance];
  uint64_t v4 = (void *)qword_10000CC10;
  qword_10000CC10 = v3;

  CFRunLoopRun();
  return 1;
}

void sub_1000058F8(void *a1)
{
  [a1 count];
  sub_1000055E4();
  sub_100005584((void *)&_mh_execute_header, v1, v2, "Historical handler called with %lu interactions", v3, v4, v5, v6, v7);
}

void sub_100005970(id *a1)
{
  [*a1 count];
  uint64_t v2 = [*a1 firstObject];
  uint64_t v3 = [v2 stream];
  uint64_t v10 = [v3 name];
  sub_1000055C4((void *)&_mh_execute_header, v4, v5, "Historical handler called with %lu events for stream %@", v6, v7, v8, v9, 2u);
}

void sub_100005A48()
{
  sub_100005560();
  sub_1000055A4((void *)&_mh_execute_header, v0, v1, "%s save events %@");
}

void sub_100005AC0()
{
  sub_100005560();
  sub_1000055A4((void *)&_mh_execute_header, v0, v1, "%s save interactions %@");
}

void sub_100005B38(uint64_t a1)
{
  os_log_t v1 = +[NSNumber numberWithUnsignedInteger:a1];
  sub_1000055E4();
  sub_100005584((void *)&_mh_execute_header, v2, v3, "Deleted %@ historical events", v4, v5, v6, v7, v8);
}

void sub_100005BC8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error deleting historical events from the %@ monitor: %@", (uint8_t *)&v4, 0x16u);
}

void sub_100005C54(uint64_t a1)
{
  os_log_t v1 = [*(id *)(a1 + 32) eventStreamProperties];
  uint64_t v2 = [v1 name];
  sub_1000055E4();
  sub_1000055C4((void *)&_mh_execute_header, v3, v4, "Historical deleting handler called from the %@ monitor with predicate %@", v5, v6, v7, v8, v9);
}

void sub_100005D08(void *a1)
{
  [a1 count];
  sub_1000055E4();
  sub_100005584((void *)&_mh_execute_header, v1, v2, "Saving %lu interactions", v3, v4, v5, v6, v7);
}

void sub_100005D80()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Registering xpc_set_event_stream_handler(\"com.apple.notifyd.matching\"", v0, 2u);
}

void sub_100005DC8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "CDNotifydMonitor: Unexpected event", v0, 2u);
}

void CFRunLoopRun(void)
{
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t memorystatus_control()
{
  return _memorystatus_control();
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void syslog(int a1, const char *a2, ...)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__setUpServices(void *a1, const char *a2, ...)
{
  return [a1 _setUpServices];
}

id objc_msgSend_contextChannel(void *a1, const char *a2, ...)
{
  return [a1 contextChannel];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentEvent(void *a1, const char *a2, ...)
{
  return [a1 currentEvent];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultDatabaseDirectory(void *a1, const char *a2, ...)
{
  return [a1 defaultDatabaseDirectory];
}

id objc_msgSend_eventStreamProperties(void *a1, const char *a2, ...)
{
  return [a1 eventStreamProperties];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_historicalHandler(void *a1, const char *a2, ...)
{
  return [a1 historicalHandler];
}

id objc_msgSend_instrumentationChannel(void *a1, const char *a2, ...)
{
  return [a1 instrumentationChannel];
}

id objc_msgSend_interaction(void *a1, const char *a2, ...)
{
  return [a1 interaction];
}

id objc_msgSend_interactionChannel(void *a1, const char *a2, ...)
{
  return [a1 interactionChannel];
}

id objc_msgSend_interactionPolicies(void *a1, const char *a2, ...)
{
  return [a1 interactionPolicies];
}

id objc_msgSend_knowledgeChannel(void *a1, const char *a2, ...)
{
  return [a1 knowledgeChannel];
}

id objc_msgSend_knowledgeDirectory(void *a1, const char *a2, ...)
{
  return [a1 knowledgeDirectory];
}

id objc_msgSend_knowledgeSignpost(void *a1, const char *a2, ...)
{
  return [a1 knowledgeSignpost];
}

id objc_msgSend_knowledgeStoreWithDirectReadWriteAccess(void *a1, const char *a2, ...)
{
  return [a1 knowledgeStoreWithDirectReadWriteAccess];
}

id objc_msgSend_loadAllEventStreams(void *a1, const char *a2, ...)
{
  return [a1 loadAllEventStreams];
}

id objc_msgSend_mechanism(void *a1, const char *a2, ...)
{
  return [a1 mechanism];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_monitorManager(void *a1, const char *a2, ...)
{
  return [a1 monitorManager];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return [a1 stream];
}

id objc_msgSend_xpcDictionaryToFoundation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcDictionaryToFoundation:");
}