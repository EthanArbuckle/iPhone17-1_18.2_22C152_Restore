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

id sub_1000025DC()
{
  if (qword_100008878 != -1) {
    dispatch_once(&qword_100008878, &stru_100004288);
  }
  v0 = (void *)qword_100008870;
  return v0;
}

void sub_100002630(uint64_t a1)
{
  v2 = sub_1000025DC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Completed Maps app removal", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

void sub_1000027B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_1000025DC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Completed Maps Push Daemon processing for Maps app removal", buf, 2u);
  }

  if (v3)
  {
    v5 = sub_1000025DC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to process Maps app removal with maps push daemon: %@", buf, 0xCu);
    }
  }
  v6 = [*(id *)(a1 + 32) isolation];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100002930;
  v8[3] = &unk_100004190;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v3;
  id v7 = v3;
  dispatch_async(v6, v8);
}

void sub_100002930(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) error];
  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) error];
    [*(id *)(a1 + 32) setError:v3];
  }
  else
  {
    [*(id *)(a1 + 32) setError:*(void *)(a1 + 40)];
  }

  v4 = [*(id *)(a1 + 32) completionGroup];
  dispatch_group_leave(v4);
}

void sub_100002ACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_1000025DC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Completed Analytics processing for Maps app removal", (uint8_t *)&v10, 2u);
  }

  if (v3)
  {
    v5 = sub_1000025DC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to process Maps app removal for analytics: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  v6 = [*(id *)(a1 + 32) error];
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    v8 = [v7 error];
    [*(id *)(a1 + 32) setError:v8];
  }
  else
  {
    [v7 setError:v3];
  }

  id v9 = [*(id *)(a1 + 32) completionGroup];
  dispatch_group_leave(v9);
}

void sub_100002CFC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    v6 = objc_msgSend(a2, "_geo_filtered:", &stru_1000041F8);
    if ([v6 count])
    {
      id v7 = sub_1000025DC();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        id v31 = [v6 count];
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Removing %llu offline subscriptions", buf, 0xCu);
      }

      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      v22 = v6;
      id obj = v6;
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v26;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v26 != v10) {
              objc_enumerationMutation(obj);
            }
            v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
            v13 = objc_msgSend(*(id *)(a1 + 32), "completionGroup", v22);
            dispatch_group_enter(v13);

            v14 = *(void **)(a1 + 40);
            v15 = [v12 identifier];
            v16 = [*(id *)(a1 + 32) isolation];
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v24[2] = sub_100002FD8;
            v24[3] = &unk_100004220;
            v24[4] = *(void *)(a1 + 32);
            [v14 removeSubscriptionWithIdentifier:v15 callbackQueue:v16 completionHandler:v24];
          }
          id v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v9);
      }

      v6 = v22;
    }
    v17 = objc_msgSend(*(id *)(a1 + 32), "completionGroup", v22);
    dispatch_group_leave(v17);
  }
  else
  {
    v18 = [*(id *)(a1 + 32) error];
    v19 = *(void **)(a1 + 32);
    if (v18)
    {
      v20 = [v19 error];
      [*(id *)(a1 + 32) setError:v20];
    }
    else
    {
      [v19 setError:v5];
    }

    v21 = [*(id *)(a1 + 32) completionGroup];
    dispatch_group_leave(v21);
  }
}

BOOL sub_100002FB8(id a1, GEOMapDataSubscription *a2)
{
  return ((unint64_t)[(GEOMapDataSubscription *)a2 dataTypes] >> 10) & 1;
}

void sub_100002FD8(uint64_t a1, char a2, void *a3)
{
  id v9 = a3;
  if ((a2 & 1) == 0)
  {
    id v5 = [*(id *)(a1 + 32) error];
    v6 = *(void **)(a1 + 32);
    if (v5)
    {
      id v7 = [v6 error];
      [*(id *)(a1 + 32) setError:v7];
    }
    else
    {
      [v6 setError:v9];
    }
  }
  id v8 = [*(id *)(a1 + 32) completionGroup];
  dispatch_group_leave(v8);
}

void sub_1000030FC(id a1)
{
  qword_100008870 = (uint64_t)os_log_create("com.apple.Maps", "MapsAppRemovalService");
  _objc_release_x1();
}

uint64_t _LSAppRemovalServiceXPCInterface()
{
  return __LSAppRemovalServiceXPCInterface();
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
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

id objc_msgSend__processAppRemovalForAnalytics(void *a1, const char *a2, ...)
{
  return [a1 _processAppRemovalForAnalytics];
}

id objc_msgSend__processAppRemovalForMapsPushDaemon(void *a1, const char *a2, ...)
{
  return [a1 _processAppRemovalForMapsPushDaemon];
}

id objc_msgSend__processAppRemovalForOfflineData(void *a1, const char *a2, ...)
{
  return [a1 _processAppRemovalForOfflineData];
}

id objc_msgSend_completionGroup(void *a1, const char *a2, ...)
{
  return [a1 completionGroup];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dataTypes(void *a1, const char *a2, ...)
{
  return [a1 dataTypes];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isolation(void *a1, const char *a2, ...)
{
  return [a1 isolation];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}