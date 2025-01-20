id sub_3F74(uint64_t a1, void *a2)
{
  NSObject *v3;
  int v5;
  const char *v6;

  v3 = BBTIME_FACILITY;
  if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_INFO))
  {
    v5 = 136315138;
    v6 = "rtcResetCallback";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s: reset fetch time", (uint8_t *)&v5, 0xCu);
  }
  return [a2 setFetchTime:0];
}

void sub_40A8(uint64_t a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 56) airplaneMode];
  int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 48);
  if (v2 != v3)
  {
    unsigned int v4 = v2;
    v5 = BBTIME_FACILITY;
    if (os_log_type_enabled((os_log_t)BBTIME_FACILITY, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v38 = v3;
      __int16 v39 = 1024;
      unsigned int v40 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Airplane mode changed %d->%d", buf, 0xEu);
    }
    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v7 = *(void **)(*(void *)(a1 + 32) + 24);
    id v8 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v31;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v31 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 addObject:*(void *)(*((void *)&v30 + 1) + 8 * i)];
        }
        id v9 = [v7 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v9);
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v12 = *(void **)(*(void *)(a1 + 32) + 40);
    id v13 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v27;
      do
      {
        for (j = 0; j != v14; j = (char *)j + 1)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v12);
          }
          [v6 addObject:*(void *)(*((void *)&v26 + 1) + 8 * (void)j)];
        }
        id v14 = [v12 countByEnumeratingWithState:&v26 objects:v35 count:16];
      }
      while (v14);
    }
    [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];

    *(void *)(*(void *)(a1 + 32) + 32) = 0;
    if (v4)
    {
      id v17 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v18 = [v6 countByEnumeratingWithState:&v22 objects:v34 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v23;
        do
        {
          for (k = 0; k != v19; k = (char *)k + 1)
          {
            if (*(void *)v23 != v20) {
              objc_enumerationMutation(v6);
            }
            [v17 setObject:*(void *)(*((void *)&v22 + 1) + 8 * (void)k) forKeyedSubscript:@"TMSource"];
            [*(id *)(*(void *)(a1 + 32) + 8) setSourceUnavailable:v17];
          }
          id v19 = [v6 countByEnumeratingWithState:&v22 objects:v34 count:16];
        }
        while (v19);
      }
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 16) coarseMonotonicTime];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "resetTimeZone:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", @"TMResetTimeZone", @"TMCommand", @"AirplaneMode", @"TMResetTimeZoneReason", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"TMRtcTime", 0));
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 48) = v4;
  }
}

NSDictionary *sub_4A2C(uint64_t a1)
{
  v3[0] = @"utc";
  v4[0] = +[NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v3[1] = @"mcc";
  v4[1] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v3[2] = @"offset";
  v4[2] = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 44)];
  v3[3] = @"dst";
  v4[3] = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  return +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
}

NSDictionary *sub_561C(uint64_t a1)
{
  v4[0] = @"delay";
  unsigned int v2 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 32)];
  v4[1] = @"result";
  v5[0] = v2;
  v5[1] = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
  return +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
}

void sub_5720(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_5D5C()
{
  sub_573C();
  sub_5720(&dword_0, v0, v1, "Unable to establish CT connection.", v2, v3, v4, v5, v6);
}

void sub_5D90(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Time from source '%@' is invalid!", (uint8_t *)&v2, 0xCu);
}

void sub_5E08()
{
  sub_573C();
  _os_log_fault_impl(&dword_0, v0, OS_LOG_TYPE_FAULT, "Invalid MCC", v1, 2u);
}

void sub_5E48()
{
  sub_573C();
  sub_5720(&dword_0, v0, v1, "Unable to establish CT connection to fetch time.", v2, v3, v4, v5, v6);
}

void sub_5E7C()
{
  sub_573C();
  sub_5720(&dword_0, v0, v1, "Unable to retrieve time for fetch delay calculation", v2, v3, v4, v5, v6);
}

void sub_5EB0()
{
  sub_573C();
  sub_5720(&dword_0, v0, v1, "Unable to establish CT connection to fetch mcc.", v2, v3, v4, v5, v6);
}

void sub_5EE4(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "MCC is now %d", (uint8_t *)v2, 8u);
}

void sub_5F5C()
{
  sub_573C();
  sub_5720(&dword_0, v0, v1, "_CTServerConnectionCopyMobileCountryCode failed unexpectedly.", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t _CTServerConnectionCopyMobileCountryCode()
{
  return __CTServerConnectionCopyMobileCountryCode();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return __CTServerConnectionCreateWithIdentifier();
}

uint64_t _CTServerConnectionFetchTimeFromNetwork()
{
  return __CTServerConnectionFetchTimeFromNetwork();
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

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return [a1 airplaneMode];
}

id objc_msgSend_airplaneModeChanged(void *a1, const char *a2, ...)
{
  return [a1 airplaneModeChanged];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_coarseMonotonicTime(void *a1, const char *a2, ...)
{
  return [a1 coarseMonotonicTime];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_fetchTime(void *a1, const char *a2, ...)
{
  return [a1 fetchTime];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_networkMap(void *a1, const char *a2, ...)
{
  return [a1 networkMap];
}

id objc_msgSend_networkTimeMap(void *a1, const char *a2, ...)
{
  return [a1 networkTimeMap];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_workloop(void *a1, const char *a2, ...)
{
  return [a1 workloop];
}