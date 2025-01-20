id ab_get_framework_log()
{
  void *v0;
  uint64_t vars8;

  if (qword_10000C780 != -1) {
    dispatch_once(&qword_10000C780, &stru_1000082B8);
  }
  v0 = (void *)qword_10000C788;
  return v0;
}

void sub_1000044D8(id a1)
{
  qword_10000C788 = (uint64_t)os_log_create("com.apple.Health.AFibBurden", "hid-framework");
  _objc_release_x1();
}

void sub_100004A90(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000053A4(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateIntervalFormatter);
  v2 = (void *)qword_10000C798;
  qword_10000C798 = (uint64_t)v1;

  [(id)qword_10000C798 setTimeStyle:0];
  v3 = (void *)qword_10000C798;
  [v3 setDateStyle:2];
}

void sub_1000056D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000056F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005708(uint64_t a1)
{
}

void sub_100005710(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v8 = ab_get_framework_log();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100006110(a1, (uint64_t)v7, v9);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v14 = 138543362;
    uint64_t v15 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Query for samples called back", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v6;
  id v13 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100005DC4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = ab_get_framework_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "failed to delete previous classifications", buf, 2u);
    }
  }
  id v7 = +[NSDate now];
  v8 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
  [v8 setFirstWeekday:2];
  v9 = (char *)objc_msgSend(v7, "hk_dayIndexWithCalendar:", v8);
  for (uint64_t i = 0; i != -70; i -= 7)
  {
    uint64_t v11 = ab_get_framework_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v17 = &v9[i];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "running force analysis for the week containing dayIndex %{public}llu", buf, 0xCu);
    }

    notify_set_state(*(_DWORD *)(a1 + 48), (uint64_t)&v9[i]);
    v12 = *(void **)(a1 + 32);
    id v15 = v5;
    id v13 = [v12 performAnalysisForWeekContainingDayIndex:&v9[i] error:&v15];
    id v14 = v15;

    notify_set_state(*(_DWORD *)(a1 + 48), 0);
    id v5 = v14;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100005FA8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 138543874;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[%{public}@:%{public}@]: Failed to create logging directory: %@", (uint8_t *)&v4, 0x20u);
}

void sub_100006040()
{
  sub_100004A78();
  sub_100004A90((void *)&_mh_execute_header, v0, v1, "[%{public}@]: Error while retrieving feature status: %{public}@");
}

void sub_1000060A8()
{
  sub_100004A78();
  sub_100004A90((void *)&_mh_execute_header, v0, v1, "[%{public}@]: Error while retrieving region availability: %{public}@");
}

void sub_100006110(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[%{public}@]: Query for samples failed: %@", (uint8_t *)&v4, 0x16u);
}

void sub_10000619C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "token == NOTIFY_TOKEN_INVALID", v1, 2u);
}

uint64_t HKHRPrettyPrintedAFibBurdenSevenDayAnalysisBreadcrumbs()
{
  return _HKHRPrettyPrintedAFibBurdenSevenDayAnalysisBreadcrumbs();
}

uint64_t HKPrettyPrintedFeatureStatus()
{
  return _HKPrettyPrintedFeatureStatus();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__determineQueryInterval(void *a1, const char *a2, ...)
{
  return [a1 _determineQueryInterval];
}

id objc_msgSend__retrievePrettyPrintedFeatureStatusDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 _retrievePrettyPrintedFeatureStatusDiagnostics];
}

id objc_msgSend__retrievePrettyPrintedRegionAvailabilityDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 _retrievePrettyPrintedRegionAvailabilityDiagnostics];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_extractDiagnosticContent(void *a1, const char *a2, ...)
{
  return [a1 extractDiagnosticContent];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_percentUnit(void *a1, const char *a2, ...)
{
  return [a1 percentUnit];
}

id objc_msgSend_performDiagnosticsAndWriteToFile(void *a1, const char *a2, ...)
{
  return [a1 performDiagnosticsAndWriteToFile];
}

id objc_msgSend_prettyPrintedDescription(void *a1, const char *a2, ...)
{
  return [a1 prettyPrintedDescription];
}

id objc_msgSend_quantity(void *a1, const char *a2, ...)
{
  return [a1 quantity];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:encoding:error:");
}