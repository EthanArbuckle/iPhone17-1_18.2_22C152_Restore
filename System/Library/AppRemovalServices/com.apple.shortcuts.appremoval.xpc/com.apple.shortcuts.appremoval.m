void sub_1000030BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1000030EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_100003400();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315394;
    v4 = "-[WFShortcutsRemovalServiceDelegate listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v5 = 2114;
    id v6 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s Connection %{public}@ was interrupted", (uint8_t *)&v3, 0x16u);
  }
}

void sub_1000031B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = sub_100003400();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v3 = 136315394;
    v4 = "-[WFShortcutsRemovalServiceDelegate listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v5 = 2114;
    id v6 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "%s Connection %{public}@ was invalidated", (uint8_t *)&v3, 0x16u);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  int v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id sub_100003400()
{
  if (qword_100008760 != -1) {
    dispatch_once(&qword_100008760, &stru_100004158);
  }
  v0 = (void *)qword_100008768;
  return v0;
}

void sub_100003454(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_100003400();
  __int16 v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFShortcutsRemovalService removeAppWithReply:]_block_invoke";
      __int16 v18 = 2114;
      id v19 = v3;
      id v6 = "%s Removal finished with error: %{public}@";
      v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, buf, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[WFShortcutsRemovalService removeAppWithReply:]_block_invoke";
    id v6 = "%s Removal finished";
    v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_INFO;
    uint32_t v9 = 12;
    goto LABEL_6;
  }

  char v10 = WFTerminateDaemon();
  id v11 = 0;
  id v12 = 0;
  v13 = v12;
  if ((v10 & 1) == 0 && v12)
  {
    v14 = sub_100003400();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[WFShortcutsRemovalService removeAppWithReply:]_block_invoke";
      __int16 v18 = 2114;
      id v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s Terminating siriactionsd failed with error: %{public}@", buf, 0x16u);
    }
  }
  if (v11) {
    [v11 invalidate];
  }
  if (v3) {
    id v15 = v3;
  }
  else {
    id v15 = v13;
  }
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v15);
}

void sub_100003638(id a1)
{
  qword_100008768 = (uint64_t)os_log_create(WFLogSubsystem, "RemovalService");
  _objc_release_x1();
}

uint64_t WFTerminateDaemon()
{
  return _WFTerminateDaemon();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_standardClient(void *a1, const char *a2, ...)
{
  return [a1 standardClient];
}