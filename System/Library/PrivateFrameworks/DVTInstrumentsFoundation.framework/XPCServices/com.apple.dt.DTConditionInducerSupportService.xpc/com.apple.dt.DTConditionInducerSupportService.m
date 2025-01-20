int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_100005A44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005A98(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005AA8(uint64_t a1)
{
}

void sub_100005AB0(uint64_t a1, void *a2)
{
}

void sub_100005AC0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _userTearingDownActiveConditions];
}

void sub_100005B00(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _userStoppedActiveConditions];
}

void sub_1000060C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000060E4(uint64_t a1, void *a2)
{
}

id sub_1000061D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endTransaction:*(void *)(a1 + 40)];
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

[super a2];
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

[objc_msgSend__activeConditionEnded];
{
  return [a1 _activeConditionEnded];
}

[objc_msgSend__userStoppedActiveConditions];
{
  return [a1 _userStoppedActiveConditions];
}

[objc_msgSend__userTearingDownActiveConditions];
{
  return [a1 _userTearingDownActiveConditions];
}

id _activeConditionSession(void *a1, const char *a2, ...)
{
  return [a1 activeConditionSession];
}

[objc_msgSend_activeConditionsDidStop];
{
  return [a1 activeConditionsDidStop];
}

[objc_msgSend_activeConditionsWillStop];
{
  return [a1 activeConditionsWillStop];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

BOOL objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

[objc_msgSend_connection(a1, a2, ...)]
{
  return [a1 connection];
}

id objc_msgSend(void *a1, const char *a2, ...)
{
  return [a1 count];
}

[objc_msgSend_debugDescription description];
{
  return [a1 debugDescription];
}

[objc_msgSend_getActiveConditions];
{
  return [a1 getActiveConditions];
}

id objc_msgSend_hasActiveCondition(id a1, SEL a2, ...)
{
  return [a1 hasActiveCondition];
}

id __keepAliveTransaction(void *a1, const char *a2, ...)
{
  return [a1 keepAliveTransaction];
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return [a1 length];
}

[objc_msgSend_listAvailableConditions(a1, a2, ...)]
{
  return [a1 listAvailableConditions];
}

[objc_msgSend_localizedDescription localizedDescription];
{
  return [a1 localizedDescription];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

[objc_msgSend_resume(a1, a2, ...);
{
  return [a1 resume];
}

id objc_msgSend_selectedCondition(void *a1, const char *a2, ...)
{
  return [a1 selectedCondition];
}

[objc_msgSend_serviceListener(a1, a2, ...)]
{
  return [a1 serviceListener];
}

[NSString stringWithFormat:a2, ...];
{
  return [a1 stringWithFormat:];
}