uint64_t CallDirectoryLog()
{
  if (qword_88A0 != -1) {
    dispatch_once(&qword_88A0, &stru_41A0);
  }
  return qword_8898;
}

void sub_1F48(id a1)
{
  qword_8898 = (uint64_t)os_log_create("com.apple.TelephonySettings", "CallDirectory");
}

void sub_2424(uint64_t a1, void *a2, void *a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_24EC;
  block[3] = &unk_41D0;
  id v8 = a2;
  id v9 = a3;
  uint64_t v10 = *(void *)(a1 + 32);
  id v5 = v9;
  id v6 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_24EC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = CallDirectoryLog();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Received call directory extensions %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_2AF4(a1, v4);
  }

  id v6 = *(void **)(a1 + 32);
  if (!v6
    || ([*(id *)(a1 + 48) extensions],
        v7 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v8 = [v6 isEqualToArray:v7],
        v7,
        (v8 & 1) == 0))
  {
    id v9 = +[NSMutableArray array];
    [*(id *)(a1 + 48) setExtensions:v9];

    uint64_t v10 = +[NSMutableArray array];
    [*(id *)(a1 + 48) setLlextensions:v10];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v11 = *(id *)(a1 + 32);
    id v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v21;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v21 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if ((char *)objc_msgSend(v16, "state", (void)v20) - 1 <= (unsigned char *)&dword_0 + 3)
          {
            v17 = [*(id *)(a1 + 48) extensions];
            [v17 addObject:v16];

            v18 = [*(id *)(a1 + 48) llextensions];
            [v18 addObject:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v13);
    }
  }
  return objc_msgSend(*(id *)(a1 + 48), "updateParentListController", (void)v20);
}

void sub_2AF4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error retrieving extensions: %@", (uint8_t *)&v3, 0xCu);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__updateExtensions(void *a1, const char *a2, ...)
{
  return [a1 _updateExtensions];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_beginObservingExtensions(void *a1, const char *a2, ...)
{
  return [a1 beginObservingExtensions];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
}

id objc_msgSend_businessCallingController(void *a1, const char *a2, ...)
{
  return [a1 businessCallingController];
}

id objc_msgSend_callDirectorySpecifier(void *a1, const char *a2, ...)
{
  return [a1 callDirectorySpecifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
}

id objc_msgSend_extensionManager(void *a1, const char *a2, ...)
{
  return [a1 extensionManager];
}

id objc_msgSend_extensions(void *a1, const char *a2, ...)
{
  return [a1 extensions];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_llextensions(void *a1, const char *a2, ...)
{
  return [a1 llextensions];
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return [a1 parentListController];
}

id objc_msgSend_serviceProviderController(void *a1, const char *a2, ...)
{
  return [a1 serviceProviderController];
}

id objc_msgSend_serviceProvidersSupportingSpamBlocking(void *a1, const char *a2, ...)
{
  return [a1 serviceProvidersSupportingSpamBlocking];
}

id objc_msgSend_shouldInsert(void *a1, const char *a2, ...)
{
  return [a1 shouldInsert];
}

id objc_msgSend_specifierID(void *a1, const char *a2, ...)
{
  return [a1 specifierID];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_supportsPrimaryCalling(void *a1, const char *a2, ...)
{
  return [a1 supportsPrimaryCalling];
}

id objc_msgSend_updateParentListController(void *a1, const char *a2, ...)
{
  return [a1 updateParentListController];
}