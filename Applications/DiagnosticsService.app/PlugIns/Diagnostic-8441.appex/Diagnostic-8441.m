void sub_10000377C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  void *v16;
  CFStringRef v17;
  id v18;
  uint8_t buf[4];
  void *v20;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [v6 description];
      *(_DWORD *)buf = 138412290;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Diagnostic-8441 CoreODI session getAssesment failed with error %@.", buf, 0xCu);
    }
    v9 = [*(id *)(a1 + 32) result];
    v10 = v9;
    v11 = &off_100004120;
LABEL_5:
    [v9 setStatusCode:v11];
    v12 = 1;
    goto LABEL_10;
  }
  v13 = DiagnosticLogHandleForCategory();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Diagnostic-8441 CoreODI session returns no assesment.", buf, 2u);
    }

    v9 = [*(id *)(a1 + 32) result];
    v10 = v9;
    v11 = &off_100004138;
    goto LABEL_5;
  }
  if (v14)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Diagnostic-8441 CoreODI session getAssesment successful.", buf, 2u);
  }

  v17 = @"ArmandValidationObject";
  v18 = v5;
  v15 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  v16 = [*(id *)(a1 + 32) result];
  [v16 setData:v15];

  v10 = [*(id *)(a1 + 32) result];
  [v10 setStatusCode:&off_100004150];
  v12 = 0;
LABEL_10:

  [*(id *)(a1 + 40) provideFeedbackOnPayloadOutcome:v12];
  [*(id *)(a1 + 32) setFinished:1];
}

void sub_100003A08(uint64_t a1, NSObject *a2)
{
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Cancelling [%@]", (uint8_t *)&v4, 0xCu);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return [a1 setStatusCode:];
}