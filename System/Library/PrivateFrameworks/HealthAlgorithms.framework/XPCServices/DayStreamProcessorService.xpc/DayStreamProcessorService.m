id ha_get_log()
{
  void *v0;
  uint64_t vars8;

  if (qword_100008970 != -1) {
    dispatch_once(&qword_100008970, &stru_1000041A0);
  }
  v0 = (void *)qword_100008978;
  return v0;
}

void sub_100001FFC(id a1)
{
  qword_100008978 = (uint64_t)os_log_create("com.apple.HealthAlgorithms", "framework");
  _objc_release_x1();
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_10000268C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  sub_1000026AC((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1000026AC(uint64_t a1)
{
  v2 = *(void **)(a1 + 16);
}

void sub_100002AC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_100002AE8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_fault_impl(a1, v4, OS_LOG_TYPE_FAULT, a4, v5, 8u);
}

id sub_100002B08(uint64_t a1, void *a2)
{
  return [a2 predictionPrimarySource];
}

void sub_100002B28()
{
  sub_100002ADC();
  sub_100002AC0((void *)&_mh_execute_header, v0, v1, "failed to instantiate an MAIDayStreamProcessor", v2, v3, v4, v5, v6);
}

void sub_100002B5C()
{
  sub_100002ADC();
  sub_100002AC0((void *)&_mh_execute_header, v0, v1, "there's already a session in progress", v2, v3, v4, v5, v6);
}

void sub_100002B90()
{
  sub_100002ADC();
  sub_100002AC0((void *)&_mh_execute_header, v0, v1, "processor is nil", v2, v3, v4, v5, v6);
}

void sub_100002BC4(uint64_t a1, void *a2)
{
  unsigned int v4 = sub_100002B08(a1, a2);
  _DWORD *v3 = 67109120;
  unsigned int *v2 = v4;
  sub_100002AE8((void *)&_mh_execute_header, v5, v6, "HAMenstrualAlgorithmsPredictionPrimarySource has the unexpected index: %hhu");
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void objc_enumerationMutation(id obj)
{
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

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_diagnosticLogger(void *a1, const char *a2, ...)
{
  return [a1 diagnosticLogger];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedInterface];
}

id objc_msgSend_fertilityPredictions(void *a1, const char *a2, ...)
{
  return [a1 fertilityPredictions];
}

id objc_msgSend_isHealthDataSubmissionAllowed(void *a1, const char *a2, ...)
{
  return [a1 isHealthDataSubmissionAllowed];
}

id objc_msgSend_menstruationPredictions(void *a1, const char *a2, ...)
{
  return [a1 menstruationPredictions];
}

id objc_msgSend_predictionPrimarySource(void *a1, const char *a2, ...)
{
  return [a1 predictionPrimarySource];
}

id objc_msgSend_processor(void *a1, const char *a2, ...)
{
  return [a1 processor];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_shouldSendCoreAnalytics(void *a1, const char *a2, ...)
{
  return [a1 shouldSendCoreAnalytics];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKeyPath:");
}