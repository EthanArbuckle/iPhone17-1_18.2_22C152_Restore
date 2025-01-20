void sub_100002638(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  void *v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  uint64_t v25;
  CFStringRef v26;
  void *v27;
  unsigned char v28[128];

  v25 = 0;
  v20 = objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = [*(id *)(a1 + 32) cameras];
  v2 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v2)
  {
    v3 = v2;
    v4 = *(void *)v22;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(void *)v22 != v4) {
        objc_enumerationMutation(obj);
      }
      v6 = *(void **)(*((void *)&v21 + 1) + 8 * v5);
      if ([*(id *)(a1 + 32) isCancelled]) {
        break;
      }
      v7 = *(void **)(a1 + 32);
      v8 = [v6 objectForKeyedSubscript:@"type"];
      v9 = [v6 objectForKeyedSubscript:@"position"];
      v10 = [v7 calibrateCameraType:v8 position:[v9 integerValue] statusCode:&v25];

      if (v10) {
        [v20 addObject:v10];
      }
      v11 = v25;

      if (v11) {
        break;
      }
      if (v3 == (id)++v5)
      {
        v3 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v12 = [*(id *)(a1 + 32) result];
  v13 = [v12 statusCode];
  v14 = [v13 integerValue];

  if (v14 != (id)-900)
  {
    v15 = +[NSNumber numberWithInteger:v25];
    v16 = [*(id *)(a1 + 32) result];
    [v16 setStatusCode:v15];

    v26 = @"results";
    v27 = v20;
    v17 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v18 = [*(id *)(a1 + 32) result];
    [v18 setData:v17];
  }
  [*(id *)(a1 + 32) setFinished:1];
}

void sub_100002D04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

BOOL sub_100002DF0(id a1, id a2)
{
  id v2 = a2;
  v3 = [v2 objectForKeyedSubscript:@"type"];
  v4 = [v2 objectForKeyedSubscript:@"position"];

  if (!v3) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  BOOL v5 = 0;
  if ((unint64_t)[v3 length] <= 0x50 && v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)[v4 integerValue] <= 2)
    {
      BOOL v5 = (uint64_t)[v4 integerValue] >= 0;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v5 = 0;
  }
LABEL_9:

  return v5;
}

void sub_100002F68()
{
  sub_100002D20();
  sub_100002D04((void *)&_mh_execute_header, v0, v1, "%@ not found on this device.", v2, v3, v4, v5, v6);
}

void sub_100002FD0()
{
  sub_100002D20();
  sub_100002D04((void *)&_mh_execute_header, v0, v1, "%@ results were nil on a supported APS diagnostic device.", v2, v3, v4, v5, v6);
}

void sub_100003038()
{
  sub_100002D20();
  sub_100002D04((void *)&_mh_execute_header, v0, v1, "%@ results did not have a result value.", v2, v3, v4, v5, v6);
}

void sub_1000030A0()
{
  sub_100002D20();
  sub_100002D04((void *)&_mh_execute_header, v0, v1, "%@ results did not have a status code value.", v2, v3, v4, v5, v6);
}

void sub_100003108()
{
  sub_100002D20();
  sub_100002D04((void *)&_mh_execute_header, v0, v1, "%@ calibration failed with unknown error.", v2, v3, v4, v5, v6);
}

void sub_100003170()
{
  sub_100002D20();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%@ calibration failed with %ld.", v2, 0x16u);
}

void sub_1000031F4()
{
  sub_100002D20();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Results: %@", v1, 0xCu);
}

void sub_100003268()
{
  sub_100002D20();
  sub_100002D04((void *)&_mh_execute_header, v0, v1, "%@ APS not supported on this device.", v2, v3, v4, v5, v6);
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_cameras(void *a1, const char *a2, ...)
{
  return [a1 cameras];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
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

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}