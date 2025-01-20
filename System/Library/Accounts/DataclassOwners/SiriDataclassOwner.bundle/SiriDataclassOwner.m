void sub_3518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_3540(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}
;
  v27 = &v28;
  v13 = v11;
  v26 = v13;
  [(AFSettingsConnection *)settings fetchMultiUserVoiceIdentificationSetting:&v22];
  v14 = dispatch_time(0, 50000000);
  v15 = dispatch_semaphore_wait(v13, v14);
  v16 = AFSiriLogContextConnection;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *((unsigned __int8 *)v29 + 24), v22, v23, v24, v25);
    *(_DWORD *)buf = 136315650;
    v34 = "-[SiriDataclassOwner actionsForDisablingDataclassOnAccount:forDataclass:]";
    v35 = 2048;
    v36 = v15;
    v37 = 2112;
    v38 = v17;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%s #SiriDataclassOwner multiUserfetchCompleted:%lu multUserEnabled:%@", buf, 0x20u);
  }
  if (*((unsigned char *)v29 + 24))
  {
    v18 = +[ACDataclassAction actionWithType:3];
    v32[0] = v18;
    v19 = +[ACDataclassAction actionWithType:0];
    v32[1] = v19;
    v20 = +[NSArray arrayWithObjects:v32 count:2];
  }
  else
  {
    v20 = 0;
  }

  _Block_object_dispose(&v28, 8);
LABEL_11:

  return v20;
}

- (void).cxx_destruct
{
}

@end