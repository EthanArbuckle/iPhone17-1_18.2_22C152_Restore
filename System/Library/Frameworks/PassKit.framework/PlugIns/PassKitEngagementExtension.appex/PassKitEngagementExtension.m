void sub_10000174C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id obj;
  id v22;
  id v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  unsigned char v28[128];

  v20 = a2;
  v22 = a3;
  v23 = objc_alloc_init((Class)NSMutableDictionary);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = *(id *)(a1 + 32);
  v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v5)
  {
    v6 = v5;
    v7 = *(void *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        v10 = objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9, v20);
        v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v9];

        v12 = *(void **)(a1 + 56);
        if (v11)
        {
          v13 = [*(id *)(a1 + 56) wrapError:v22];
          v14 = [v13 objectForKeyedSubscript:@"json-payload"];
          [v23 setObject:v14 forKeyedSubscript:v9];
        }
        else
        {
          v13 = [v20 objectForKeyedSubscript:v10];
          v14 = [v12 wrapValue:v13 forProperty:v10];
          v15 = [v14 objectForKeyedSubscript:@"json-payload"];
          [v23 setObject:v15 forKeyedSubscript:v9];
        }
      }
      v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  v16 = *(void *)(a1 + 48);
  v17 = *(void **)(a1 + 56);
  v18 = [v23 copy];
  v19 = [v17 wrapBatchResponse:v18];
  (*(void (**)(uint64_t, void *, id))(v16 + 16))(v16, v19, v22);
}

void sub_100001B74(void *a1, void *a2, void *a3)
{
  uint64_t v6 = a1[5];
  v5 = (void *)a1[6];
  uint64_t v7 = a1[4];
  id v8 = a3;
  id v10 = [a2 objectForKeyedSubscript:v7];
  v9 = [v5 wrapValue:v10 forProperty:a1[4]];
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v9, v8);
}

void sub_100001DF8(void *a1, void *a2, void *a3)
{
  uint64_t v6 = a1[5];
  v5 = (void *)a1[6];
  uint64_t v7 = a1[4];
  id v8 = a3;
  id v10 = [a2 objectForKeyedSubscript:v7];
  v9 = [v5 wrapValue:v10 forProperty:a1[4]];
  (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v9, v8);
}

void sub_1000024CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
}

uint64_t sub_100002520(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002530(uint64_t a1)
{
}

void sub_100002538(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addEntriesFromDictionary:a2];
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000025C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addEntriesFromDictionary:a2];
  if (v6) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100002650(uint64_t a1)
{
  PKLogFacilityTypeGetObject();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 56));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)id v6 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, v4, "engagement:fetchProperties", (const char *)&unk_10000391B, v6, 2u);
    }
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  return result;
}

Class sub_100002D64()
{
  if (qword_1000086F8 != -1) {
    dispatch_once(&qword_1000086F8, &stru_1000042E8);
  }
  Class result = objc_getClass("FHSearchSuggestionController");
  qword_1000086E8 = (uint64_t)result;
  off_1000085C0 = (uint64_t (*)())sub_100002DC8;
  return result;
}

id sub_100002DC8()
{
  return (id)qword_1000086E8;
}

void sub_100002DD4(id a1)
{
  qword_1000086F0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/FinHealth.framework/FinHealth", 2);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t PKEqualObjects()
{
  return _PKEqualObjects();
}

uint64_t PKLogFacilityTypeGetObject()
{
  return _PKLogFacilityTypeGetObject();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return _os_signpost_id_make_with_pointer(log, ptr);
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_malformedRequest(void *a1, const char *a2, ...)
{
  return [a1 malformedRequest];
}

id objc_msgSend_noCommandError(void *a1, const char *a2, ...)
{
  return [a1 noCommandError];
}

id objc_msgSend_noPropertyError(void *a1, const char *a2, ...)
{
  return [a1 noPropertyError];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_unknownError(void *a1, const char *a2, ...)
{
  return [a1 unknownError];
}

id objc_msgSend_unrecognizedCommandError(void *a1, const char *a2, ...)
{
  return [a1 unrecognizedCommandError];
}

id objc_msgSend_unrecognizedPropertyError(void *a1, const char *a2, ...)
{
  return [a1 unrecognizedPropertyError];
}

id objc_msgSend_wrapValue_forProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wrapValue:forProperty:");
}