void sub_1000027C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t buf[4];
  id v10;

  v4 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v5 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v10 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "CellularThroughput: Error count in startMetadataCollectionWithCompletion: %{public}lu", buf, 0xCu);
  }

  if ([v4 count])
  {
    v6 = 0;
    do
    {
      v7 = DiagnosticsKitLogHandleForCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = [v4 objectAtIndexedSubscript:v6];
        *(_DWORD *)buf = 138543362;
        v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CellularThroughput: Error in startMetadataCollectionWithCompletion: %{public}@", buf, 0xCu);
      }
      ++v6;
    }
    while ((unint64_t)[v4 count] > v6);
  }
}

void sub_100002938(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "CellularThroughput: Download task starting", buf, 2u);
  }

  v8 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "CellularThroughput: Metadata collection arrived at semaphore", buf, 2u);
  }

  v9 = *(NSObject **)(a1 + 32);
  dispatch_time_t v10 = dispatch_walltime(0, 10000000000);
  dispatch_semaphore_wait(v9, v10);
  v11 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "CellularThroughput: Metadata collection after semaphore wait", buf, 2u);
  }

  [*(id *)(*(void *)(a1 + 40) + 16) stopMetadataCollection];
  [*(id *)(*(void *)(a1 + 40) + 16) saveToAWD];
  v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  v24 = sub_100002BBC;
  v25 = &unk_100004160;
  uint64_t v26 = *(void *)(a1 + 40);
  AnalyticsSendEventLazy();
  v12 = dispatch_queue_create("com.apple.wirelessdataanalytics.CellularDataDiagnosticsSuite", 0);
  dispatch_time_t v13 = dispatch_time(0, 10000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002BC8;
  block[3] = &unk_100004188;
  id v18 = v6;
  id v19 = v5;
  id v14 = *(id *)(a1 + 48);
  uint64_t v20 = *(void *)(a1 + 40);
  id v21 = v14;
  id v15 = v5;
  id v16 = v6;
  dispatch_after(v13, v12, block);
}

id sub_100002BBC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) getTransformedDataForCoreAnalytics];
}

uint64_t sub_100002BC8(uint64_t a1)
{
  v2 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "CellularThroughput: save results to AWD", (uint8_t *)&v10, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  v4 = DiagnosticsKitLogHandleForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) localizedDescription];
      int v10 = 138543362;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CellularThroughput: Download task errored out: %{public}@", (uint8_t *)&v10, 0xCu);
    }
    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      v8 = *(uint64_t (**)(void))(result + 16);
LABEL_12:
      uint64_t result = v8();
    }
  }
  else
  {
    if (v5)
    {
      [*(id *)(a1 + 40) speed];
      int v10 = 134217984;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CellularThroughput: Download task completed, throughput %f Mbps", (uint8_t *)&v10, 0xCu);
    }

    uint64_t result = *(void *)(a1 + 56);
    if (result)
    {
      v8 = *(uint64_t (**)(void))(result + 16);
      goto LABEL_12;
    }
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 8) = 0;
  return result;
}

id sub_100002EA8(uint64_t a1)
{
  v2 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "CellularThroughput: speed test passed", (uint8_t *)&v8, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) result];
  [v3 setStatusCode:&off_1000042F0];

  v4 = DiagnosticsKitLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    BOOL v5 = [*(id *)(a1 + 32) result];
    id v6 = [v5 statusCode];
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "CellularThroughput: status code: %@", (uint8_t *)&v8, 0xCu);
  }
  id result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) setFinished:1];
  }
  return result;
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t DiagnosticsKitLogHandleForCategory()
{
  return _DiagnosticsKitLogHandleForCategory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_cancelAllNetworking(void *a1, const char *a2, ...)
{
  return [a1 cancelAllNetworking];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultConfigurationCellular(void *a1, const char *a2, ...)
{
  return [a1 defaultConfigurationCellular];
}

id objc_msgSend_downloadSize(void *a1, const char *a2, ...)
{
  return [a1 downloadSize];
}

id objc_msgSend_interfaceType(void *a1, const char *a2, ...)
{
  return [a1 interfaceType];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_saveToAWD(void *a1, const char *a2, ...)
{
  return [a1 saveToAWD];
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return [a1 speed];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopMetadataCollection(void *a1, const char *a2, ...)
{
  return [a1 stopMetadataCollection];
}

id objc_msgSend_testDuration(void *a1, const char *a2, ...)
{
  return [a1 testDuration];
}