id sub_100004AD0(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v17;
  uint64_t vars8;

  v6 = a1;
  v7 = a2;
  v8 = a4;
  v9 = GEODecodeModernXPCMessage();
  v10 = 0;
  v11 = v10;
  if (!v9 || v10)
  {
    v12 = GEOGetGEODaemonLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Unable to decode request: %@", buf, 0xCu);
    }
    v14 = 0;
  }
  else
  {
    [v9 setService:@"offlineserver"];
    [v9 setMethod:v6];
    [v9 setPeer:v8];
    v12 = xpc_dictionary_get_value(v7, "progress_observer_endpoint");
    if (v12)
    {
      v13 = +[NSProgress _geo_mirroredProgressFromReportingXPCEndpoint:v12 totalUnitCount:1];
      [v9 setProgress:v13];
    }
    v14 = v9;
  }

  return v14;
}

void start()
{
  v1 = sub_100006008((void **)[GEOOfflineServiceDaemon alloc]);
  v2 = (void *)qword_10000CAB8;
  qword_10000CAB8 = (uint64_t)v1;

  [(id)qword_10000CAB8 start];
  dispatch_main();
}

id sub_100004E24(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a4;
  id v9 = a3;
  [v7 setResponse:a2];
  [*(id *)(a1 + 32) setResponseMetadata:v9];

  [*(id *)(a1 + 32) setError:v8];
  v10 = *(void **)(a1 + 32);

  return [v10 send];
}

void sub_100004F38(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

void sub_1000050A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = v5;
  if (!a2 || v5)
  {
    v10 = [v5 domain];
    v11 = GEOErrorDomain();
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    if ([v10 isEqual:v11])
    {
      if ([v6 code] == (id)-8) {
        os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      }
      else {
        os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      }
    }

    v13 = sub_1000052A8();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138478083;
      uint64_t v19 = v14;
      __int16 v20 = 2114;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, v12, "Failed to fetch key %{private}@: %{public}@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v17 = 0;
    v7 = [a2 readDataWithOptions:1 error:&v17];
    id v8 = v17;
    if (![v7 length] || v8)
    {
      v15 = sub_1000052A8();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138478083;
        uint64_t v19 = v16;
        __int16 v20 = 2114;
        v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to read data for key %{private}@: %{public}@", buf, 0x16u);
      }

      id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v9();
  }
}

id sub_1000052A8()
{
  if (qword_10000CAD0 != -1) {
    dispatch_once(&qword_10000CAD0, &stru_100008370);
  }
  v0 = (void *)qword_10000CAC8;

  return v0;
}

uint64_t sub_1000055D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000055F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v10 = [v6 domain];
    v11 = GEOErrorDomain();
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    if ([v10 isEqual:v11])
    {
      if ([v7 code] == (id)-8) {
        os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
      }
      else {
        os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      }
    }

    v13 = sub_1000052A8();
    if (os_log_type_enabled(v13, v12))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v17 = 138478083;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      __int16 v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, v12, "Failed to fetch key %{private}@: %{public}@", (uint8_t *)&v17, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v8 = [v5 fileURL];
    if (v8)
    {
      id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      v15 = sub_1000052A8();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        int v17 = 138477827;
        uint64_t v18 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Expected filesystem-backed data for key %{private}@", (uint8_t *)&v17, 0xCu);
      }

      id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v9();
  }
}

uint64_t sub_100005BB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005D44(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v7 = sub_1000052A8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = *(_DWORD *)(a1 + 40);
      v9[0] = 67109378;
      v9[1] = v8;
      __int16 v10 = 2114;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to fetch available keys for layer: %u: %{public}@", (uint8_t *)v9, 0x12u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005F00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v7 = sub_1000052A8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to fetch available regions: %{public}@", (uint8_t *)&v9, 0xCu);
    }
  }
  int v8 = objc_msgSend(v5, "_geo_map:", &stru_1000082C8);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100006000(id a1, GEOMapRegion *a2)
{
  return [(GEOMapRegion *)a2 data];
}

void **sub_100006008(void **a1)
{
  v1 = a1;
  if (!a1) {
    goto LABEL_19;
  }
  self;
  if (qword_10000CAC0) {
    goto LABEL_3;
  }
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: gsFramework != ((void *)0)", buf, 2u);
    }
    goto LABEL_19;
  }
  int v8 = v7;
  int v9 = [v7 bundleURL];
  id v10 = [v9 URLByAppendingPathComponent:@"MapsOfflineService.bundle"];

  id v11 = +[NSBundle bundleWithURL:v10];
  os_log_type_t v12 = v11;
  if (!v11)
  {
    uint64_t v14 = sub_1000052A8();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to find MapsOfflineService.bundle", buf, 2u);
    }
    goto LABEL_18;
  }
  id v21 = 0;
  unsigned __int8 v13 = [v11 loadAndReturnError:&v21];
  uint64_t v14 = v21;
  if ((v13 & 1) == 0)
  {
    int v17 = sub_1000052A8();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unable to load MapsOfflineService.bundle: %@", buf, 0xCu);
    }

    goto LABEL_18;
  }
  id v15 = [v12 principalClass];
  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      __int16 v19 = "Assertion failed: serviceClass != ((void *)0)";
LABEL_32:
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, v19, buf, 2u);
    }
LABEL_18:

LABEL_19:
    id v6 = 0;
    goto LABEL_20;
  }
  uint64_t v16 = (uint64_t)v15;
  if (([v15 conformsToProtocol:&OBJC_PROTOCOL___MapsOfflineServiceV1] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      __int16 v19 = "Assertion failed: [serviceClass conformsToProtocol:@protocol(MapsOfflineServiceV1)]";
      goto LABEL_32;
    }
    goto LABEL_18;
  }
  qword_10000CAC0 = v16;

LABEL_3:
  v2 = objc_alloc_init(_GEOOfflineDataWrapper);
  id v3 = [objc_alloc((Class)qword_10000CAC0) initWithDataProvider:v2];
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Unable to initialize MapsOfflineService, it probably threw an exception during startup.", buf, 2u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: offlineService != nil", buf, 2u);
    }
    goto LABEL_25;
  }
  v20.receiver = v1;
  v20.super_class = (Class)GEOOfflineServiceDaemon;
  v4 = (void **)objc_msgSendSuper2(&v20, "initWithPort:createXPCListenerBlock:", "com.apple.GeoServices.MapsOfflineServices", &stru_100008330);
  v1 = v4;
  if (!v4)
  {
LABEL_25:
    id v6 = 0;
    goto LABEL_6;
  }
  objc_storeStrong(v4 + 1, v3);
  [v1 installSignalHandlers];
  id v5 = [[GEOOfflineServiceServer alloc] initWithDaemon:v1];
  sub_100004F38((uint64_t)v5, v1[1]);
  [v1 addServer:v5];
  v1 = v1;

  id v6 = v1;
LABEL_6:

LABEL_20:
  return v6;
}

OS_xpc_object *__cdecl sub_100006414(id a1, OS_dispatch_queue *a2, const char *a3)
{
  listener = (void *)xpc_connection_create_listener();

  return (OS_xpc_object *)listener;
}

void sub_10000657C(id a1)
{
  qword_10000CAC8 = (uint64_t)os_log_create("com.apple.GeoServices", "OfflineDaemon");

  _objc_release_x1();
}

uint64_t GEODecodeModernXPCMessage()
{
  return _GEODecodeModernXPCMessage();
}

uint64_t GEOErrorDomain()
{
  return _GEOErrorDomain();
}

uint64_t GEOGetGEODaemonLog()
{
  return _GEOGetGEODaemonLog();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t geo_get_global_queue()
{
  return _geo_get_global_queue();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t self
{
  return _self;
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

uint64_t xpc_connection_create_listener()
{
  return _xpc_connection_create_listener();
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_installSignalHandlers(void *a1, const char *a2, ...)
{
  return [a1 installSignalHandlers];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestMetadata(void *a1, const char *a2, ...)
{
  return [a1 requestMetadata];
}

id objc_msgSend_serviceKey(void *a1, const char *a2, ...)
{
  return [a1 serviceKey];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}