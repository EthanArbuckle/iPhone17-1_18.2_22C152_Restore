void sub_5CC0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  void v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  const char *v19;

  if (([*(id *)(a1 + 32) isEqualToString:@"IntentsInfoNano"] & 1) == 0) {
    [*(id *)(a1 + 40) resetWithValidity:@"IntentsInfoNano"];
  }
  if (*(void *)(*(void *)(a1 + 48) + 8))
  {
    v14 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(a1 + 56), *(void *)(a1 + 48), *(void *)(a1 + 40));
  }
  v2 = [*(id *)(a1 + 40) appMetadata];
  v3 = [v2 appIdentifyingInfo];
  v4 = [v3 bundleId];
  v5 = *(void *)(a1 + 48);
  v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;

  v7 = *(void **)(*(void *)(a1 + 48) + 8);
  if (v7)
  {
    v8 = [v7 copy];
    v9 = +[ACXDeviceConnection sharedDeviceConnection];
    v10 = *(void *)(a1 + 48);
    v11 = *(void *)(v10 + 8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_5EE0;
    v15[3] = &unk_8310;
    v15[4] = v10;
    v16 = v8;
    v17 = *(id *)(a1 + 40);
    v12 = v8;
    [v9 fetchInfoForApplicationWithBundleID:v11 forPairedDevice:0 completion:v15];
  }
  else
  {
    v13 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[NASAppIntentsInfoSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:]_block_invoke";
      _os_log_error_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "%s ERROR: no app id?!", buf, 0xCu);
    }
  }
}

void sub_5EE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5FD4;
  block[3] = &unk_82E8;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v13 = v8;
  uint64_t v14 = v9;
  id v15 = v6;
  id v16 = *(id *)(a1 + 48);
  id v17 = v5;
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v7, block);
}

void sub_5FD4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:*(void *)(*(void *)(a1 + 40) + 8)])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if (v2)
    {
      v3 = AFSiriLogContextPlugin;
      if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
        int v8 = 136315650;
        uint64_t v9 = "-[NASAppIntentsInfoSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:]_block_invoke";
        __int16 v10 = 2114;
        uint64_t v11 = v7;
        __int16 v12 = 2114;
        uint64_t v13 = v2;
        _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "%s Failed to get application info for %{public}@: %{public}@. It may have been uninstalled.", (uint8_t *)&v8, 0x20u);
      }
      [*(id *)(a1 + 56) resetWithValidity:0];
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(a1 + 40) + 16), *(id *)(a1 + 64));
    }
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 32));
  }
  else
  {
    v4 = AFSiriLogContextPlugin;
    if (os_log_type_enabled(AFSiriLogContextPlugin, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      int v8 = 136315650;
      uint64_t v9 = "-[NASAppIntentsInfoSyncHandler beginSyncWithAnchor:validity:count:forKey:beginInfo:]_block_invoke_2";
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s Application info arrived too late for %@, ignoring. Now syncing %@", (uint8_t *)&v8, 0x20u);
    }
  }
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
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

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_appIdentifyingInfo(void *a1, const char *a2, ...)
{
  return [a1 appIdentifyingInfo];
}

id objc_msgSend_appMetadata(void *a1, const char *a2, ...)
{
  return [a1 appMetadata];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedDeviceConnection];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}