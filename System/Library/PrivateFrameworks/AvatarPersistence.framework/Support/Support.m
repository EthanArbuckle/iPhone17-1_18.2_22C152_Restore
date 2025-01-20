id sub_100002134(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  id v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  unsigned char v34[128];
  unsigned char v35[128];

  v3 = a2;
  v4 = +[NSMutableArray array];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v3;
  v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    v7 = v6;
    v8 = *(void *)v31;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v30 + 1) + 8 * i) recordIdentifier];
        [v4 addObject:v10];
      }
      v7 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v7);
  }

  v11 = *(void **)(a1 + 32);
  v29 = 0;
  v12 = [v11 deleteThumbnailsForAvatarRecordsWithIdentifiers:v4 error:&v29];
  v13 = v29;
  if (v12)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v14 = v5;
    v15 = [v14 countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v15)
    {
      v16 = v15;
      v24 = v13;
      v17 = *(void *)v26;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
          if (![v19 changeType])
          {
            v20 = *(void **)(a1 + 40);
            v21 = [v19 recordIdentifier];
            [v20 addObject:v21];
          }
        }
        v16 = [v14 countByEnumeratingWithState:&v25 objects:v34 count:16];
      }
      while (v16);
      v13 = v24;
    }
  }
  else
  {
    v14 = [*(id *)(a1 + 32) logger];
    v22 = [v13 description];
    [v14 logErrorDeletingSomeThumbnail:v22];
  }
  return v12;
}

void sub_10000238C(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  id v9 = 0;
  unsigned __int8 v5 = [v2 processChangeTransactionsWithChangeTokenLocation:v3 handler:v4 error:&v9];
  id v6 = v9;
  if ((v5 & 1) == 0)
  {
    v7 = [*(id *)(a1 + 48) logger];
    v8 = [v6 description];
    [v7 logErrorProcessingChangeTransactionsToUpdateThumbnails:v8];
  }
}

uint64_t start()
{
  v0 = +[AVTCoreEnvironment defaultEnvironment];
  v1 = [v0 logger];

  if ((_set_user_dir_suffix() & 1) == 0) {
    [v1 logErrorSettingUserDirSuffixForSandbox:*__error()];
  }
  uint64_t v3 = [[AVTDaemonImageOperationHandler alloc] initWithLogger:v1];
  uint64_t v4 = +[AVTAvatarStoreServer defaultServerWithImageHandlingDelegate:v3];
  [v4 startListening];
  unsigned __int8 v5 = [[AVTUsageAnalysisService alloc] initWithLogger:v1];
  [(AVTUsageAnalysisService *)v5 startListening];

  id v6 = +[NSRunLoop mainRunLoop];
  [v6 run];

  return 0;
}

void sub_10000265C(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    id v9 = [*(id *)(a1 + 32) logger];
    [v9 logAnalysisServiceWillRun];

    [*(id *)(a1 + 32) performUsageAnalysis];
    id v6 = [*(id *)(a1 + 32) logger];
    [v6 logAnalysisServiceDidRun];
  }
  else
  {
    xpc_activity_state_t v4 = state;
    if (state)
    {
      id v6 = [*(id *)(a1 + 32) logger];
      v10 = [(id)objc_opt_class() _stringFromXPCActivityState:v4];
      [v6 logAnalysisServiceDidNotProcessState:v10];
    }
    else
    {
      xpc_object_t v5 = xpc_activity_copy_criteria(activity);
      id v6 = v5;
      if (v5)
      {
        v7 = +[NSString stringWithCString:xpc_copy_description(v5) encoding:1];
        v8 = [*(id *)(a1 + 32) logger];
        [v8 logAnalysisServiceCheckingIn:v7];
      }
    }
  }
}

int *__error(void)
{
  return ___error();
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
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

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return [a1 changeType];
}

id objc_msgSend_defaultEnvironment(void *a1, const char *a2, ...)
{
  return [a1 defaultEnvironment];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_imageStoreLocation(void *a1, const char *a2, ...)
{
  return [a1 imageStoreLocation];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_logAnalysisServiceDidRun(void *a1, const char *a2, ...)
{
  return [a1 logAnalysisServiceDidRun];
}

id objc_msgSend_logAnalysisServiceWillRun(void *a1, const char *a2, ...)
{
  return [a1 logAnalysisServiceWillRun];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_performUsageAnalysis(void *a1, const char *a2, ...)
{
  return [a1 performUsageAnalysis];
}

id objc_msgSend_recordIdentifier(void *a1, const char *a2, ...)
{
  return [a1 recordIdentifier];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return [a1 startListening];
}

id objc_msgSend_stickerImageStoreLocation(void *a1, const char *a2, ...)
{
  return [a1 stickerImageStoreLocation];
}

id objc_msgSend_updatingThumbnailsForRemoteChanges_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatingThumbnailsForRemoteChanges:");
}