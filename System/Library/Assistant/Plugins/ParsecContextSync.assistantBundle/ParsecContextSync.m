void sub_2FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 176), 8);
  _Block_object_dispose((const void *)(v31 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_303C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_304C(uint64_t a1)
{
}

void sub_3054(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = [a3 reply];
  id v20 = [v4 httpRequest];

  uint64_t v5 = [v20 allHTTPHeaderFields];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = [v20 HTTPBody];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = [v20 HTTPMethod];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  uint64_t v14 = [v20 URL];
  uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
  v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = [v20 synchAnchorRepresentation];
  uint64_t v18 = *(void *)(*(void *)(a1 + 72) + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void objc_release(id a1)
{
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return [a1 HTTPBody];
}

id objc_msgSend_HTTPMethod(void *a1, const char *a2, ...)
{
  return [a1 HTTPMethod];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHTTPHeaderFields];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_httpRequest(void *a1, const char *a2, ...)
{
  return [a1 httpRequest];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_reply(void *a1, const char *a2, ...)
{
  return [a1 reply];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_synchAnchorRepresentation(void *a1, const char *a2, ...)
{
  return [a1 synchAnchorRepresentation];
}

id objc_msgSend_taskWithRequest_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskWithRequest:completion:");
}