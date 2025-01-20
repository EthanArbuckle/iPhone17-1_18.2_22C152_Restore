id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend__remoteObjectRegistry(void *a1, const char *a2, ...)
{
  return [a1 _remoteObjectRegistry];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_contextControllersToLoadDelegates(void *a1, const char *a2, ...)
{
  return [a1 contextControllersToLoadDelegates];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentJSContext(void *a1, const char *a2, ...)
{
  return [a1 currentJSContext];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_getState(void *a1, const char *a2, ...)
{
  return [a1 getState];
}

id objc_msgSend_globalObject(void *a1, const char *a2, ...)
{
  return [a1 globalObject];
}

id objc_msgSend_hasFiredReadyEvent(void *a1, const char *a2, ...)
{
  return [a1 hasFiredReadyEvent];
}

id objc_msgSend_listenersDictionary(void *a1, const char *a2, ...)
{
  return [a1 listenersDictionary];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_webProcessDelegate(void *a1, const char *a2, ...)
{
  return [a1 webProcessDelegate];
}

id objc_msgSend_webProcessJSO(void *a1, const char *a2, ...)
{
  return [a1 webProcessJSO];
}

id objc_msgSend_webProcessJSODidCallClose(void *a1, const char *a2, ...)
{
  return [a1 webProcessJSODidCallClose];
}

id objc_msgSend_webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame(void *a1, const char *a2, ...)
{
  return [a1 webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame];
}

id objc_msgSend_webProcessPlugInDidCreateBrowserContextController(void *a1, const char *a2, ...)
{
  return [a1 webProcessPlugInDidCreateBrowserContextController];
}

id objc_msgSend_webProcessPlugInWillDestroyBrowserContextController(void *a1, const char *a2, ...)
{
  return [a1 webProcessPlugInWillDestroyBrowserContextController];
}