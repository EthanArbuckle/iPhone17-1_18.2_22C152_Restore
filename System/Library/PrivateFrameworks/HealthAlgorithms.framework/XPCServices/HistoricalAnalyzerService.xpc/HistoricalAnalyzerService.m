id ha_get_log()
{
  void *v0;
  uint64_t vars8;

  if (qword_100008958 != -1) {
    dispatch_once(&qword_100008958, &stru_100004190);
  }
  v0 = (void *)qword_100008960;
  return v0;
}

void sub_100002294(id a1)
{
  qword_100008960 = (uint64_t)os_log_create("com.apple.HealthAlgorithms", "framework");
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

void sub_1000029A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100002CC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_100002CE8()
{
  sub_100002CDC();
  sub_100002CC0((void *)&_mh_execute_header, v0, v1, "failed to instantiate an MAIHistoricalAnalyzer", v2, v3, v4, v5, v6);
}

void sub_100002D1C()
{
  sub_100002CDC();
  sub_100002CC0((void *)&_mh_execute_header, v0, v1, "there's already a session in progress", v2, v3, v4, v5, v6);
}

void sub_100002D50()
{
  sub_100002CDC();
  sub_100002CC0((void *)&_mh_execute_header, v0, v1, "analyzer is nil", v2, v3, v4, v5, v6);
}

void sub_100002D84(uint8_t *a1, void *a2, unsigned int *a3, NSObject *a4)
{
  unsigned int v7 = [a2 predictionPrimarySource];
  *(_DWORD *)a1 = 67109120;
  *a3 = v7;
  _os_log_fault_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_FAULT, "HAMenstrualAlgorithmsPredictionPrimarySource has the unexpected index: %hhu", a1, 8u);
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

id objc_msgSend_analyze(void *a1, const char *a2, ...)
{
  return [a1 analyze];
}

id objc_msgSend_analyzer(void *a1, const char *a2, ...)
{
  return [a1 analyzer];
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

id objc_msgSend_finalizeHistoricalAnalyzerInput(void *a1, const char *a2, ...)
{
  return [a1 finalizeHistoricalAnalyzerInput];
}

id objc_msgSend_isHealthDataSubmissionAllowed(void *a1, const char *a2, ...)
{
  return [a1 isHealthDataSubmissionAllowed];
}

id objc_msgSend_predictionPrimarySource(void *a1, const char *a2, ...)
{
  return [a1 predictionPrimarySource];
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