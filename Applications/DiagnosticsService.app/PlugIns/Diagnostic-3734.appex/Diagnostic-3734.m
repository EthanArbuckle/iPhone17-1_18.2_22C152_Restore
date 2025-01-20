BOOL sub_100001DC0(id a1, id a2)
{
  id v2;
  BOOL v3;

  v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = (unint64_t)[v2 length] < 0x33;
  }
  else
  {
    objc_opt_class();
    v3 = (objc_opt_isKindOfClass() & 1) == 0 || (uint64_t)[v2 integerValue] > 0;
  }

  return v3;
}

BOOL sub_100001F2C(id a1, id a2)
{
  return (unint64_t)[a2 length] < 0x65;
}

void sub_100002404(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000243C(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v5 = [WeakRetained isCancelled];

  if ((v5 & 1) == 0)
  {
    v6 = [v3 type];
    unsigned int v7 = [v6 isEqualToString:@"109"];

    if (v7) {
      unsigned __int8 v8 = [v3 BOOLFromFieldAtIndex:7];
    }
    else {
      unsigned __int8 v8 = 0;
    }
    id v9 = objc_loadWeakRetained(a1 + 7);
    v10 = [v3 bundleID];
    v11 = [v9 userFriendlyAppNameForBundleID:v10];

    if (v11 && (v8 & 1) == 0)
    {
      v12 = [a1[4] objectForKeyedSubscript:v11];
      v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 intValue] + 1);
      [a1[4] setObject:v13 forKeyedSubscript:v11];
    }
    v14 = [v3 fields];
    v15 = [v14 componentsJoinedByString:@" "];

    v16 = [v3 type];
    if ([v16 isEqualToString:@"210"])
    {
      unsigned __int8 v17 = [a1[5] containsObject:v15];

      if ((v17 & 1) == 0)
      {
        v18 = [v3 bundleID];

        if (v18)
        {
          if (!v11) {
            goto LABEL_16;
          }
        }
        else
        {

          v11 = @"System Process";
        }
        v19 = [a1[6] objectForKeyedSubscript:v11];
        v20 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v19 intValue] + 1);
        [a1[6] setObject:v20 forKeyedSubscript:v11];

        [a1[5] addObject:v15];
      }
    }
    else
    {
    }
LABEL_16:
  }
  return v5;
}

void sub_100002664(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = a3;
  v6 = v5;
  if (*(double *)(a1 + 48) == 0.0)
  {
    int v7 = 0;
  }
  else
  {
    [v5 doubleValue];
    int v7 = (int)(v8 / *(double *)(a1 + 48));
  }
  int v9 = [v6 intValue];
  v10 = [*(id *)(a1 + 32) inputs];
  if (v9 <= (int)[v10 minCrashesToConsider])
  {
  }
  else
  {
    v11 = [*(id *)(a1 + 32) inputs];
    signed int v12 = [v11 avgCrashesToConsider];

    if (v7 > v12) {
      [*(id *)(a1 + 40) addObject:v13];
    }
  }
}

void sub_1000029A8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Bundle record not found for ID %@: %@", (uint8_t *)&v3, 0x16u);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
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

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_avgCrashesToConsider(void *a1, const char *a2, ...)
{
  return [a1 avgCrashesToConsider];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return [a1 fields];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_latestUserLog(void *a1, const char *a2, ...)
{
  return [a1 latestUserLog];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_logIds(void *a1, const char *a2, ...)
{
  return [a1 logIds];
}

id objc_msgSend_minCrashesToConsider(void *a1, const char *a2, ...)
{
  return [a1 minCrashesToConsider];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_restoreDate(void *a1, const char *a2, ...)
{
  return [a1 restoreDate];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_whitelist(void *a1, const char *a2, ...)
{
  return [a1 whitelist];
}