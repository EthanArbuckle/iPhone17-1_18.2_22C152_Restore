uint64_t fileSuffixForLogType(unint64_t a1)
{
  if (a1 > 3) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_100008288 + a1);
  }
}

void sub_100003110(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_10000D5B8 != -1) {
    dispatch_once(&qword_10000D5B8, &stru_100008268);
  }
  v4 = qword_10000D5C0;
  if (os_log_type_enabled((os_log_t)qword_10000D5C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289026;
    int v12 = 0;
    __int16 v13 = 2082;
    v14 = &unk_1000055C7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian TTR extension fetched all beacons\"}", buf, 0x12u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(NSObject **)(v5 + 8);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003274;
  v8[3] = &unk_100008200;
  id v9 = v3;
  uint64_t v10 = v5;
  id v7 = v3;
  dispatch_async(v6, v8);
}

void sub_100003274(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        v8 = *(void **)(*(void *)(a1 + 40) + 40);
        id v9 = objc_msgSend(v7, "identifier", (void)v10);
        [v8 setObject:v7 forKey:v9];

        [*(id *)(a1 + 40) fetchFirmwareVersionForBeacon:v7];
        [*(id *)(a1 + 40) dumpLogsForBeacon:v7];
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void sub_100004A7C(id a1)
{
  qword_10000D5C0 = (uint64_t)os_log_create("com.apple.locationd.Position", "Proximity");
  _objc_release_x1();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_calibrationDataVersion(void *a1, const char *a2, ...)
{
  return [a1 calibrationDataVersion];
}

id objc_msgSend_checkForCompletion(void *a1, const char *a2, ...)
{
  return [a1 checkForCompletion];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultDateFormatter(void *a1, const char *a2, ...)
{
  return [a1 defaultDateFormatter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_fetchAllBeacons(void *a1, const char *a2, ...)
{
  return [a1 fetchAllBeacons];
}

id objc_msgSend_hardwareVersion(void *a1, const char *a2, ...)
{
  return [a1 hardwareVersion];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_logDirectory(void *a1, const char *a2, ...)
{
  return [a1 logDirectory];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_roseAPVersion(void *a1, const char *a2, ...)
{
  return [a1 roseAPVersion];
}

id objc_msgSend_roseDSPVersion(void *a1, const char *a2, ...)
{
  return [a1 roseDSPVersion];
}

id objc_msgSend_rtKitVersion(void *a1, const char *a2, ...)
{
  return [a1 rtKitVersion];
}

id objc_msgSend_specificationVersion(void *a1, const char *a2, ...)
{
  return [a1 specificationVersion];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}

id objc_msgSend_vanBurenVersion(void *a1, const char *a2, ...)
{
  return [a1 vanBurenVersion];
}

id objc_msgSend_writeToURL_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:encoding:error:");
}