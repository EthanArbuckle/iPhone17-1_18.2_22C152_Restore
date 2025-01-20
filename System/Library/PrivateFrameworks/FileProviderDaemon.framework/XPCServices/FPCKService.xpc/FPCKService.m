uint64_t start()
{
  NSObject *v0;
  int v1;
  void *v2;
  void *v3;
  NSObject *v5;
  _DWORD v6[2];

  fpfs_enable_fts_thread_fchdir();
  if ((fpfs_enable_vnode_rapid_aging() & 0x80000000) != 0)
  {
    v0 = fp_current_or_default_log();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
    {
      v1 = *__error();
      v6[0] = 67109120;
      v6[1] = v1;
      _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to activate VNODE rapid aging: %{errno}d", (uint8_t *)v6, 8u);
    }
  }
  fpfs_allow_operation();
  if ((fpfs_set_vfs_ignore_permissions_iopolicy() & 0x80000000) != 0)
  {
    v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000066A4(v5);
    }

    exit(1);
  }
  v2 = objc_opt_new();
  v3 = +[NSXPCListener serviceListener];
  [v3 setDelegate:v2];
  [v3 resume];

  return 0;
}

void sub_10000565C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005678(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = WeakRetained;
    objc_sync_enter(v2);
    v2[24] = 1;
    objc_sync_exit(v2);

    id WeakRetained = v3;
  }
}

void sub_100005988(uint64_t a1)
{
  v2 = fp_current_or_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[INFO] 🧹 FPCKService, starting FPCK", buf, 2u);
  }

  id v3 = *(unsigned char **)(a1 + 32);
  if (v3[8])
  {
    v4 = v3;
    objc_sync_enter(v4);
    if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      objc_sync_exit(v4);
    }
    else
    {
      objc_sync_exit(v4);

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 16));
      id v40 = [objc_alloc((Class)FPXPCAutomaticErrorProxy) initWithConnection:*(void *)(a1 + 40) protocol:&OBJC_PROTOCOL___FPCKUpdateReceiving orError:0 name:@"UpdateReceiverProxy" requestPid:getpid()];
      v41 = [v40 synchronousRemoteObjectProxy];
      v42 = &stru_100008298;
      v43 = &stru_1000082D8;
      if (*(void *)(a1 + 40) && v41)
      {
        *(void *)buf = 0;
        v69 = buf;
        uint64_t v70 = 0x3032000000;
        v71 = sub_10000615C;
        v72 = sub_10000616C;
        id v73 = 0;
        id v73 = +[FPCKTask buildPauseResult:0 semaphore:0];
        v64[0] = 0;
        v64[1] = v64;
        v64[2] = 0x3032000000;
        v64[3] = sub_10000615C;
        v64[4] = sub_10000616C;
        id v65 = 0;
        id v65 = +[NSDate now];
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472;
        v59[2] = sub_100006174;
        v59[3] = &unk_100008328;
        v62 = v64;
        v63 = buf;
        id v7 = v41;
        uint64_t v8 = *(void *)(a1 + 32);
        id v60 = v7;
        uint64_t v61 = v8;
        v42 = objc_retainBlock(v59);
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_100006350;
        v57[3] = &unk_100008350;
        id v58 = v7;
        v43 = objc_retainBlock(v57);

        _Block_object_dispose(v64, 8);
        _Block_object_dispose(buf, 8);
      }
      id v9 = objc_alloc_init((Class)NSMutableArray);
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v10 = *(id *)(*(void *)(a1 + 32) + 80);
      id v11 = [v10 countByEnumeratingWithState:&v53 objects:v67 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v54;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v54 != v12) {
              objc_enumerationMutation(v10);
            }
            v14 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            v15 = [v14 url];
            unsigned int v16 = [v15 startAccessingSecurityScopedResource];

            if (v16)
            {
              v17 = [v14 url];
              [v9 addObject:v17];
            }
          }
          id v11 = [v10 countByEnumeratingWithState:&v53 objects:v67 count:16];
        }
        while (v11);
      }

      v18 = [*(id *)(*(void *)(a1 + 32) + 64) url];
      [v18 startAccessingSecurityScopedResource];

      v19 = [*(id *)(*(void *)(a1 + 32) + 72) url];
      [v19 startAccessingSecurityScopedResource];

      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v20 = *(id *)(*(void *)(a1 + 32) + 88);
      id v21 = [v20 countByEnumeratingWithState:&v49 objects:v66 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v50;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v50 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
            v25 = [v24 url];
            unsigned __int8 v26 = [v25 startAccessingSecurityScopedResource];

            if ((v26 & 1) == 0)
            {
              v27 = fp_current_or_default_log();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
                sub_100006778(buf, v24, &buf[4], v27);
              }
            }
          }
          id v21 = [v20 countByEnumeratingWithState:&v49 objects:v66 count:16];
        }
        while (v21);
      }

      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_10000635C;
      v48[3] = &unk_100008378;
      v48[4] = *(void *)(a1 + 32);
      v38 = objc_retainBlock(v48);
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100006364;
      v46[3] = &unk_1000083A0;
      id v47 = *(id *)(a1 + 40);
      v39 = objc_retainBlock(v46);
      uint64_t v28 = *(void *)(*(void *)(a1 + 32) + 56);
      uint64_t v37 = *(void *)(*(void *)(a1 + 32) + 48);
      v29 = [*(id *)(*(void *)(a1 + 32) + 64) url];
      v30 = [*(id *)(*(void *)(a1 + 32) + 72) url];
      uint64_t v31 = *(void *)(a1 + 32);
      uint64_t v32 = *(unsigned int *)(v31 + 44);
      uint64_t v34 = *(void *)(v31 + 96);
      uint64_t v33 = *(void *)(v31 + 104);
      __int16 v35 = *(_WORD *)(v31 + 40);
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100006370;
      v44[3] = &unk_1000083C8;
      v44[4] = v31;
      id v45 = *(id *)(a1 + 48);
      LOWORD(v36) = v35;
      +[FPCKTask runFPCKForDomain:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:shouldPause:sendDiagnostics:saveCheckpoint:isInvalidated:completionHandler:](FPCKTask, "runFPCKForDomain:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:shouldPause:sendDiagnostics:saveCheckpoint:isInvalidated:completionHandler:", v37, v28, v29, v30, v9, v32, v34, v33, v36, v42, v39, v43, v38, v44);

      v4 = v40;
    }
  }
  else
  {
    v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100006734(v5);
    }

    uint64_t v6 = *(void *)(a1 + 48);
    v4 = +[NSError fp_invalidArgumentError:@"Prepare!"];
    (*(void (**)(uint64_t, void, void, void, unsigned char *))(v6 + 16))(v6, 0, 0, 0, v4);
  }
}

void sub_100006114(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

FPShouldPauseResult *__cdecl sub_100006144(id a1)
{
  return (FPShouldPauseResult *)+[FPCKTask buildPauseResult:0 semaphore:0];
}

uint64_t sub_10000615C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000616C(uint64_t a1)
{
}

id sub_100006174(void *a1)
{
  [*(id *)(*(void *)(a1[6] + 8) + 40) timeIntervalSinceNow];
  if (v2 < -5.0)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100006254;
    v10[3] = &unk_100008300;
    uint64_t v3 = a1[7];
    v4 = (void *)a1[4];
    v10[4] = a1[5];
    v10[5] = v3;
    [v4 shouldPauseWithCompletion:v10];
    uint64_t v5 = +[NSDate now];
    uint64_t v6 = *(void *)(a1[6] + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  id v8 = *(id *)(*(void *)(a1[7] + 8) + 40);
  return v8;
}

void sub_100006254(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = fp_current_or_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100006808(v5, v6);
    }
  }
  if (a2)
  {
    id v7 = fp_current_or_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[INFO] 🧹 FPCKService will pause because pause checker indicated", v13, 2u);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 16);
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0;
  }
  uint64_t v10 = +[FPCKTask buildPauseResult:v9 semaphore:v8];
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

id sub_100006350(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) saveCheckpointWithReport:a2];
}

id sub_10000635C(uint64_t a1)
{
  return [*(id *)(a1 + 32) isInvalidated];
}

id sub_100006364(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendDiagnosticsForItemIDs:a2];
}

void sub_100006370(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [*(id *)(*(void *)(a1 + 32) + 64) url];
  [v13 stopAccessingSecurityScopedResource];

  v14 = [*(id *)(*(void *)(a1 + 32) + 72) url];
  [v14 stopAccessingSecurityScopedResource];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v15 = *(id *)(*(void *)(a1 + 32) + 80);
  id v16 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v31 + 1) + 8 * (void)v19) url];
        [v20 stopAccessingSecurityScopedResource];

        v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [v15 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v17);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v21 = *(id *)(*(void *)(a1 + 32) + 88);
  id v22 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v28;
    do
    {
      v25 = 0;
      do
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v21);
        }
        unsigned __int8 v26 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)v25), "url", (void)v27);
        [v26 stopAccessingSecurityScopedResource];

        v25 = (char *)v25 + 1;
      }
      while (v23 != v25);
      id v23 = [v21 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v23);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000066A4(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "[ERROR] failed to set ignore permissions iopolicy %d\n", (uint8_t *)v3, 8u);
}

void sub_100006734(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] FPCKService, starting FPCK failed, must call prepareFPCKForDomain first", v1, 2u);
}

void sub_100006778(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 url];
  uint64_t v8 = objc_msgSend(v7, "fp_shortDescription");
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "[ERROR] Failed accessing url: %@", a1, 0xCu);
}

void sub_100006808(void *a1, NSObject *a2)
{
  uint64_t v3 = objc_msgSend(a1, "fp_prettyDescription");
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "[ERROR] Pause checker error: %@", (uint8_t *)&v4, 0xCu);
}

uint64_t FPDFPCKServiceXPCInterface()
{
  return _FPDFPCKServiceXPCInterface();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
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

void exit(int a1)
{
}

uint64_t fp_current_or_default_log()
{
  return _fp_current_or_default_log();
}

uint64_t fpfs_allow_operation()
{
  return _fpfs_allow_operation();
}

uint64_t fpfs_enable_fts_thread_fchdir()
{
  return _fpfs_enable_fts_thread_fchdir();
}

uint64_t fpfs_enable_vnode_rapid_aging()
{
  return _fpfs_enable_vnode_rapid_aging();
}

uint64_t fpfs_set_vfs_ignore_permissions_iopolicy()
{
  return _fpfs_set_vfs_ignore_permissions_iopolicy();
}

pid_t getpid(void)
{
  return _getpid();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_synchronousRemoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 synchronousRemoteObjectProxy];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}