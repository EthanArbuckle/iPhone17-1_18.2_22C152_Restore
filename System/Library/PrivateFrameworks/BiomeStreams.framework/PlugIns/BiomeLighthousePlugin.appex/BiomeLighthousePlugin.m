id sub_1000050C8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1000053DC(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_100005660(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100005814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

NSObject *__cdecl sub_10000582C(id a1, BMStoreEvent *a2)
{
  v2 = [(BMStoreEvent *)a2 eventBody];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 jsonDict];
  }
  else
  {
    v3 = 0;
  }
  if (![v3 count] && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = [v2 json];
    uint64_t v9 = 0;
    uint64_t v5 = +[NSJSONSerialization JSONObjectWithData:v4 options:16 error:&v9];
    uint64_t v6 = v9;

    if (v6)
    {
      v7 = __biome_log_for_category();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10000659C(v7);
      }
    }
    v3 = (void *)v5;
  }

  return v3;
}

void sub_100005948(uint64_t a1, void *a2)
{
  id v23 = a2;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v3 = (void *)qword_10000C810;
  uint64_t v31 = qword_10000C810;
  if (!qword_10000C810)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100006234;
    v34 = &unk_1000082D0;
    v35 = &v28;
    sub_100006234((uint64_t)buf);
    v3 = (void *)v29[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v28, 8);
  v22 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = *(id *)(a1 + 32);
  id v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v25;
    *(void *)&long long v6 = 138412290;
    long long v20 = v6;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v10 = objc_msgSend(*(id *)(a1 + 40), "testTypeFromTestString:", v9, v20);
        v11 = __biome_log_for_category();
        v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            v19 = +[BMPublicStreamUtilities streamIdentifierForStream:*(void *)(a1 + 48)];
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v9;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v19;
            _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Running test %@ for stream %@", buf, 0x16u);
          }
          v12 = [*(id *)(a1 + 32) objectForKey:v9];
          v13 = [*(id *)(a1 + 40) lastRunDateForStream:*(void *)(a1 + 48) test:v10];
          v14 = [v22 runChangeDetectionWithEvents:v23 test:v12 lastRun:v13];
          if (v10 == (id)3)
          {
            [*(id *)(a1 + 40) processKSTestResults:v14 fromStream:*(void *)(a1 + 48)];
          }
          else if (v10 == (id)2)
          {
            [*(id *)(a1 + 40) processZTestResults:v14 fromStream:*(void *)(a1 + 48)];
          }
          else if (v10 == (id)1)
          {
            [*(id *)(a1 + 40) processBinomialTestResults:v14 fromStream:*(void *)(a1 + 48)];
          }
          v15 = [v14 objectForKeyedSubscript:@"testRan"];
          unsigned int v16 = [v15 BOOLValue];

          if (v16)
          {
            v17 = [v14 objectForKeyedSubscript:@"nextLastRun"];
            [v17 doubleValue];
            v18 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

            [*(id *)(a1 + 40) setNewLastRunDate:v18 forStream:*(void *)(a1 + 48) test:v10];
          }
        }
        else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          *(void *)&buf[4] = v9;
          _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "No support for test type %@.", buf, 0xCu);
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v5);
  }
}

void sub_100005D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10000607C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_10000C808)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_1000061C0;
    v3[4] = &unk_100008308;
    v3[5] = v3;
    long long v4 = off_1000082F0;
    uint64_t v5 = 0;
    qword_10000C808 = _sl_dlopen();
    if (!qword_10000C808)
    {
      abort_report_np();
LABEL_8:
      sub_1000065E0();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("BMStoreStream");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_10000C800 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000061C0()
{
  uint64_t result = _sl_dlopen();
  qword_10000C808 = result;
  return result;
}

Class sub_100006234(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_10000C818)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100006378;
    v3[4] = &unk_100008308;
    v3[5] = v3;
    long long v4 = off_100008328;
    uint64_t v5 = 0;
    qword_10000C818 = _sl_dlopen();
    if (!qword_10000C818)
    {
      abort_report_np();
LABEL_8:
      sub_100006608();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("Timeseries");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_10000C810 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100006378()
{
  uint64_t result = _sl_dlopen();
  qword_10000C818 = result;
  return result;
}

void sub_1000063EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100006414()
{
  sub_100006408();
  sub_1000063EC((void *)&_mh_execute_header, v0, v1, "Loaded JSON recipe: %@", v2, v3, v4, v5, v6);
}

void sub_10000647C()
{
  sub_100006408();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Can't load or convert JSON data to dictionary with error: %@", v1, 0xCu);
}

void sub_1000064F0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not load Trial Recipe.", v1, 2u);
}

void sub_100006534()
{
  sub_100006408();
  sub_1000063EC((void *)&_mh_execute_header, v0, v1, "About to log CA event: %@", v2, v3, v4, v5, v6);
}

void sub_10000659C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to deserialize json object for event.", v1, 2u);
}

void sub_1000065E0()
{
}

void sub_100006608()
{
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
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

uint64_t __biome_log_for_category()
{
  return ___biome_log_for_category();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void free(void *a1)
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_collect(void *a1, const char *a2, ...)
{
  return [a1 collect];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return [a1 deploymentId];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_fileValue(void *a1, const char *a2, ...)
{
  return [a1 fileValue];
}

id objc_msgSend_json(void *a1, const char *a2, ...)
{
  return [a1 json];
}

id objc_msgSend_jsonDict(void *a1, const char *a2, ...)
{
  return [a1 jsonDict];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_rolloutId(void *a1, const char *a2, ...)
{
  return [a1 rolloutId];
}

id objc_msgSend_shouldStop(void *a1, const char *a2, ...)
{
  return [a1 shouldStop];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_triClient(void *a1, const char *a2, ...)
{
  return [a1 triClient];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
  [(BiomeLighthousePlugin *)self setShouldStop:1];
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialId, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end