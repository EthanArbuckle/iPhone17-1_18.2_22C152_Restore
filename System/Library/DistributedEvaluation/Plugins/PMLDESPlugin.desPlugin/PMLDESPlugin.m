void sub_5610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a69;

  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_56CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_56DC(uint64_t a1)
{
}

id sub_56E4()
{
  if (qword_C7C0 != -1) {
    dispatch_once(&qword_C7C0, &stru_82D0);
  }
  v0 = (void *)qword_C7B8;

  return v0;
}

void sub_5738(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v14 && !v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v6 = [v14 objectForKeyedSubscript:@"plan"];
    v7 = [v6 objectForKeyedSubscript:@"name"];

    v8 = [v14 objectForKeyedSubscript:@"gradient"];
    if (v8
      || ([v14 objectForKeyedSubscript:@"weights"],
          (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (unint64_t)[v8 length] >> 2;
    }
    else
    {
      v8 = +[NSNull null];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v8 forKeyedSubscript:v7];

    id v9 = [v14 mutableCopy];
    [v9 removeObjectForKey:@"gradient"];
    [v9 removeObjectForKey:@"weights"];
    if ([v9 count] != (char *)&dword_0 + 1
      || ([v9 objectForKeyedSubscript:@"plan"],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v9 forKeyedSubscript:v7];
    }
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
  id v13 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_5908(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (v14 && !v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v6 = [v14 objectForKeyedSubscript:@"plan"];
    v7 = [v6 objectForKeyedSubscript:@"name"];

    v8 = [v14 objectForKeyedSubscript:@"gradient"];
    if (v8
      || ([v14 objectForKeyedSubscript:@"weights"],
          (v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = (unint64_t)[v8 length] >> 2;
    }
    else
    {
      v8 = +[NSNull null];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v8 forKeyedSubscript:v7];

    id v9 = [v14 mutableCopy];
    [v9 removeObjectForKey:@"gradient"];
    [v9 removeObjectForKey:@"weights"];
    if ([v9 count] != (char *)&dword_0 + 1
      || ([v9 objectForKeyedSubscript:@"plan"],
          v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          !v10))
    {
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v9 forKeyedSubscript:v7];
    }
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v5;
  id v13 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_5AD8(id a1)
{
  os_log_t v2 = os_log_create("com.apple.proactive", "pmldes");
  v3 = (void *)qword_C7B8;
  qword_C7B8 = (uint64_t)v2;
}

void sub_5DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_5DC0(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_C7A0)
  {
    v6[1] = _NSConcreteStackBlock;
    v6[2] = (void *)3221225472;
    v6[3] = sub_620C;
    v6[4] = &unk_8278;
    v6[5] = v6;
    long long v7 = off_8260;
    uint64_t v8 = 0;
    qword_C7A0 = _sl_dlopen();
  }
  if (!qword_C7A0)
  {
    v3 = +[NSAssertionHandler currentHandler];
    v4 = +[NSString stringWithUTF8String:"void *CoreSuggestionsLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PMLDESPlugin.m", 29, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("SGSuggestionsService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v3 = +[NSAssertionHandler currentHandler];
    id v5 = +[NSString stringWithUTF8String:"Class getSGSuggestionsServiceClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PMLDESPlugin.m", 30, @"Unable to find class %s", "SGSuggestionsService");

LABEL_10:
    __break(1u);
  }
  qword_C798 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_5FAC(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_C7B0)
  {
    v6[1] = _NSConcreteStackBlock;
    v6[2] = (void *)3221225472;
    v6[3] = sub_6198;
    v6[4] = &unk_8278;
    v6[5] = v6;
    long long v7 = off_8298;
    uint64_t v8 = 0;
    qword_C7B0 = _sl_dlopen();
  }
  if (!qword_C7B0)
  {
    v3 = +[NSAssertionHandler currentHandler];
    v4 = +[NSString stringWithUTF8String:"void *DistributedEvaluationLibrary(void)"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"PMLDESPlugin.m", 34, @"%s", v6[0]);

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("DESPFLEncryptor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    v3 = +[NSAssertionHandler currentHandler];
    id v5 = +[NSString stringWithUTF8String:"Class getDESPFLEncryptorClass(void)_block_invoke"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, @"PMLDESPlugin.m", 35, @"Unable to find class %s", "DESPFLEncryptor");

LABEL_10:
    __break(1u);
  }
  qword_C7A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_6198()
{
  uint64_t result = _sl_dlopen();
  qword_C7B0 = result;
  return result;
}

uint64_t sub_620C()
{
  uint64_t result = _sl_dlopen();
  qword_C7A0 = result;
  return result;
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
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

void free(void *a1)
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

{
}

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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_pluginShouldAddNoiseAndEncryptResult(void *a1, const char *a2, ...)
{
  return [a1 pluginShouldAddNoiseAndEncryptResult];
}

id objc_msgSend_recipeUserInfo(void *a1, const char *a2, ...)
{
  return [a1 recipeUserInfo];
}

id objc_msgSend_serviceForFides(void *a1, const char *a2, ...)
{
  return [a1 serviceForFides];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}