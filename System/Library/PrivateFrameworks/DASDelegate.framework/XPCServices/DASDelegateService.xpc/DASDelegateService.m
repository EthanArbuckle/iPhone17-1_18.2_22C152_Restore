int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;
  os_log_t v5;
  void *v6;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  v5 = os_log_create("com.apple.DASDelegateService", "DASDelegateService");
  v6 = (void *)qword_100008878;
  qword_100008878 = (uint64_t)v5;

  [v4 resume];
  return 0;
}

uint64_t sub_100001FC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = [v3 endEvent];
  v6 = [v5 processName];
  [v4 setObject:v6 forKeyedSubscript:@"ProcessName"];

  v7 = [v3 beginEvent];
  v8 = [v7 string2Value];
  if ([v8 isEqualToString:@"YES"])
  {
    v9 = [v3 beginEvent];
    v10 = [v9 name];
    unsigned int v11 = [v10 isEqualToString:@"AppLaunch"];

    if (v11)
    {
      CFStringRef v12 = @"AppLaunch";
      goto LABEL_7;
    }
  }
  else
  {
  }
  v13 = [v3 beginEvent];
  v14 = [v13 name];
  unsigned int v15 = [v14 isEqualToString:@"AppResume"];

  if (!v15)
  {
    v16 = v4;
    CFStringRef v12 = 0;
    goto LABEL_9;
  }
  CFStringRef v12 = @"AppResume";
LABEL_7:
  v16 = v4;
LABEL_9:
  [v16 setObject:v12 forKeyedSubscript:@"BeginEvent"];
  [v3 durationSeconds];
  v17 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v4 setObject:v17 forKeyedSubscript:@"DurationSeconds"];

  uint64_t v18 = [v4 objectForKeyedSubscript:@"ProcessName"];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [v4 objectForKeyedSubscript:@"BeginEvent"];

    if (v20) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }

  return 1;
}

void sub_1000026B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

void sub_1000026EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 name];
  if (v4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v8 = 0;
    [v3 cpuTimeNs:&v10 cpuInstructions:&v9 cpuCycles:&v8 betweenStartTime:0 endTime:0];
    if ((v10 & 0x8000000000000000) == 0)
    {
      v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
      v6 = (char *)[v5 unsignedLongLongValue];
      v7 = +[NSNumber numberWithUnsignedLongLong:&v6[v10]];
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v4];

      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v10;
    }
  }
}

id sub_1000027D8(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  v7 = [v5 objectForKeyedSubscript:a3];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  id v9 = [v7 compare:v8];
  return v9;
}

void sub_100002858(void *a1, void *a2)
{
  id v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 processIdentifier];
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Listener rejected new connection from PID %d (no entitlement)\n", (uint8_t *)v4, 8u);
}

void sub_1000028F4(void *a1, void *a2)
{
  id v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 processIdentifier];
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Listener accepted new connection from PID %d\n", (uint8_t *)v4, 8u);
}

void sub_100002990(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "No app resumes/launches found", v1, 2u);
}

void sub_1000029D4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SignpostSupportObjectExtractor failed", v1, 2u);
}

void sub_100002A18(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid object type received for date", v1, 2u);
}

void sub_100002A5C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Evaluation of %{public}@ complete, exemption = %@", (uint8_t *)&v2, 0x16u);
}

void sub_100002AE0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "SASampleStore failed to parse %{public}@: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_100002B68(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Evaluating %{public}@", (uint8_t *)&v2, 0xCu);
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

{
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_beginEvent(void *a1, const char *a2, ...)
{
  return [a1 beginEvent];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dataGatheringOptions(void *a1, const char *a2, ...)
{
  return [a1 dataGatheringOptions];
}

id objc_msgSend_durationSeconds(void *a1, const char *a2, ...)
{
  return [a1 durationSeconds];
}

id objc_msgSend_endEvent(void *a1, const char *a2, ...)
{
  return [a1 endEvent];
}

id objc_msgSend_initForFileParsing(void *a1, const char *a2, ...)
{
  return [a1 initForFileParsing];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_string2Value(void *a1, const char *a2, ...)
{
  return [a1 string2Value];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}