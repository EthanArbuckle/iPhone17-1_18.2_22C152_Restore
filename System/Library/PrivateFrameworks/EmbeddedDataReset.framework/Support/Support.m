void sub_1000010B0(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t vars8;

  if (objc_opt_class())
  {
    v2 = [*(id *)(a1 + 32) resetProgressWindow];

    if (!v2)
    {
      +[CATransaction begin];
      v3 = [objc_alloc((Class)PUIProgressWindow) initWithProgressBarVisibility:*(unsigned __int8 *)(a1 + 40)];
      [*(id *)(a1 + 32) setResetProgressWindow:v3];

      +[CATransaction commit];
    }
  }
}

id sub_10000121C(uint64_t a1)
{
  +[CATransaction begin];
  v2 = [*(id *)(a1 + 32) resetProgressWindow];
  [*(id *)(a1 + 32) progress];
  *(float *)&double v3 = v3;
  [v2 setProgressValue:v3];

  v4 = [*(id *)(a1 + 32) resetProgressWindow];
  [v4 setVisible:1];

  return +[CATransaction commit];
}

id sub_100001364(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  if (v2 >= 0.0 && v2 <= 1.0) {
    *(double *)(*(void *)(a1 + 32) + 16) = v2;
  }
  v4 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained progress];
    int v14 = 134218240;
    uint64_t v15 = v5;
    __int16 v16 = 2048;
    uint64_t v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "got progress here: %lf, self.progress: %lf", (uint8_t *)&v14, 0x16u);
  }
  +[CATransaction begin];
  v8 = (id *)(a1 + 40);
  id v9 = objc_loadWeakRetained(v8);
  v10 = [v9 resetProgressWindow];
  id v11 = objc_loadWeakRetained(v8);
  [v11 progress];
  *(float *)&double v12 = v12;
  [v10 setProgressValue:v12];

  return +[CATransaction commit];
}

void sub_100001B24(uint64_t a1)
{
  double v2 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Invalidating connection in daemon", v4, 2u);
  }

  double v3 = [*(id *)(a1 + 32) clients];
  [v3 removeObject:*(void *)(a1 + 40)];
}

void sub_100001BB0(uint64_t a1)
{
  double v2 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Interrupting connection in daemon", v4, 2u);
  }

  double v3 = [*(id *)(a1 + 32) clients];
  [v3 removeObject:*(void *)(a1 + 40)];
}

void sub_100001FF8(id a1, NSError *a2)
{
  double v2 = a2;
  double v3 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reset finished in daemon with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100002190(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Broadcast resetWithModeWillBegin to client connection: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = [v3 remoteObjectProxy];
  [v5 willBeginDataResetWithMode:*(void *)(a1 + 32)];
}

void sub_100002354(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Broad cast resetWithModeDidBegin to client connection: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = [v3 remoteObjectProxy];
  [v5 didBeginDataResetWithMode:*(void *)(a1 + 32)];
}

void sub_10000282C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100002860(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    *(void *)(*(void *)(a1 + 32) + 48) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    v1 = sub_100002D9C(2uLL);
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "No error, reboot", v4, 2u);
    }

    id v2 = [objc_alloc((Class)FBSShutdownOptions) initWithReason:@"ResetOrRestoreComplete"];
    [v2 setRebootType:1];
    [v2 setSource:1];
    id v3 = +[FBSSystemService sharedService];
    [v3 shutdownWithOptions:v2];
  }
}

void sub_100002948(uint64_t a1, void *a2)
{
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v3 = a2;
  int v4 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(_DWORD *)buf = 67109120;
    int v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "increament observer to: %d", buf, 8u);
  }

  int v6 = [v3 remoteObjectProxy];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002AC0;
  v9[3] = &unk_1000083F0;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  [v6 didCompleteDataResetMode:v7 withError:v8 completion:v9];
}

void sub_100002AC0(void *a1)
{
  --*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  id v2 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(*(void *)(a1[6] + 8) + 24);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "decrement observer to: %d", (uint8_t *)v5, 8u);
  }

  if (!*(_DWORD *)(*(void *)(a1[6] + 8) + 24) && !a1[4])
  {
    int v4 = sub_100002D9C(2uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Observer count is zero reboot!", (uint8_t *)v5, 2u);
    }

    (*(void (**)(void))(a1[5] + 16))();
  }
}

uint64_t sub_100002BF8(uint64_t a1)
{
  id v2 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "5s elapsed to reboot.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100002D9C(unint64_t a1)
{
  if (a1 >= 4) {
    sub_10000483C();
  }
  if (qword_10000DAE0 != -1) {
    dispatch_once(&qword_10000DAE0, &stru_1000084A0);
  }
  id v2 = (void *)qword_10000DAC0[a1];
  return v2;
}

void sub_100002E0C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.devicedatareset.xpcserviceworker", "DeviceDataResetDefault");
  id v2 = (void *)qword_10000DAC0[0];
  qword_10000DAC0[0] = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.devicedatareset.xpcserviceworker", "DeviceDataResetProgress");
  int v4 = (void *)qword_10000DAC8;
  qword_10000DAC8 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.devicedatareset.daemon", "DeviceDataResetDaemon");
  int v6 = (void *)qword_10000DAD0;
  qword_10000DAD0 = (uint64_t)v5;

  qword_10000DAD8 = (uint64_t)os_log_create("com.apple.devicedatareset.framework", "DeviceDataResetFramework");
  _objc_release_x1();
}

void sub_100003254(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_100003284(uint64_t a1)
{
  id v2 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DeviceDataResetWorker connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetConnection];
}

void sub_100003308(uint64_t a1)
{
  id v2 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "DeviceDataResetWorker connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetConnection];
}

void sub_1000034F4(id *a1)
{
  id v2 = [a1[4] delegate];
  objc_msgSend(v2, "resetWithModeWillBegin:", objc_msgSend(a1[5], "mode"));

  if ((uint64_t)[a1[5] mode] >= 4)
  {
    id v3 = objc_alloc_init((Class)NSMutableDictionary);
    [v3 setObject:kObliterationTypeMarkStart forKeyedSubscript:kObliterationTypeKey];
    int v4 = [a1[5] options];
    os_log_t v5 = [v4 exclusionPaths];
    [v3 setObject:v5 forKeyedSubscript:kObliterationExclusionPathsKey];

    Mobile_Obliterate();
  }
  int v6 = [a1[5] reason];
  [a1[4] setReason:v6];

  uint64_t v7 = [a1[5] options];
  objc_msgSend(a1[4], "setDisallowProximitySetup:", objc_msgSend(v7, "disallowProximitySetup"));

  uint64_t v8 = [a1[5] options];
  id v9 = [v8 exclusionPaths];
  [a1[4] setExclusionPaths:v9];

  id v10 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "calling data reset in daemon", buf, 2u);
  }

  id v11 = [a1[4] layoutManager];
  [v11 startLayout];

  uint64_t v12 = [a1[5] options];
  unsigned __int8 v13 = [v12 hideProgress];

  if ((v13 & 1) == 0)
  {
    int v14 = [a1[4] uiPresenter];
    [v14 setProgressBarVisible:1];
  }
  uint64_t v15 = [a1[4] uiPresenter];
  [v15 show];

  __int16 v16 = [a1[4] dataResetWorkerConnection];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100003800;
  v26[3] = &unk_1000084F8;
  id v17 = a1[5];
  v26[4] = a1[4];
  id v27 = v17;
  v18 = [v16 remoteObjectProxyWithErrorHandler:v26];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000038E8;
  v23[3] = &unk_100008520;
  id v19 = a1[5];
  id v20 = a1[6];
  id v21 = a1[4];
  id v22 = a1[5];
  id v25 = v20;
  v23[4] = v21;
  id v24 = v22;
  [v18 resetDataWithRequest:v19 completion:v23];
}

void sub_100003800(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Data reset failed with error: %@", (uint8_t *)&v6, 0xCu);
  }

  os_log_t v5 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v5, "resetWithModeDidFinish:error:", objc_msgSend(*(id *)(a1 + 40), "mode"), v3);
}

void sub_1000038E8(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishResetOfMode:withError:", objc_msgSend(*(id *)(a1 + 40), "mode"), v4);
}

uint64_t start()
{
  v0 = objc_alloc_init(DDRServer);
  [(DDRServer *)v0 start];

  return 0;
}

void sub_1000044E0(uint64_t a1)
{
  id v2 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Invalidating connection in DDRObserverServer", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) clients];
  [v3 removeObject:*(void *)(a1 + 40)];
}

void sub_10000456C(uint64_t a1)
{
  id v2 = sub_100002D9C(2uLL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Interrupting connection in DDRObserverServer", v4, 2u);
  }

  uint64_t v3 = [*(id *)(a1 + 32) clients];
  [v3 removeObject:*(void *)(a1 + 40)];
}

void sub_10000483C()
{
}

void sub_100004868(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Data reset failed with error: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return _BSDispatchQueueCreateWithQualityOfService();
}

uint64_t Mobile_Obliterate()
{
  return _Mobile_Obliterate();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t xpc_connection_set_non_launching()
{
  return _xpc_connection_set_non_launching();
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnection];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return [a1 clients];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_dataResetWorkerConnection(void *a1, const char *a2, ...)
{
  return [a1 dataResetWorkerConnection];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_disallowProximitySetup(void *a1, const char *a2, ...)
{
  return [a1 disallowProximitySetup];
}

id objc_msgSend_exclusionPaths(void *a1, const char *a2, ...)
{
  return [a1 exclusionPaths];
}

id objc_msgSend_hideProgress(void *a1, const char *a2, ...)
{
  return [a1 hideProgress];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_layoutManager(void *a1, const char *a2, ...)
{
  return [a1 layoutManager];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_observerServer(void *a1, const char *a2, ...)
{
  return [a1 observerServer];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resetConnection(void *a1, const char *a2, ...)
{
  return [a1 resetConnection];
}

id objc_msgSend_resetProgressWindow(void *a1, const char *a2, ...)
{
  return [a1 resetProgressWindow];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serverQueue(void *a1, const char *a2, ...)
{
  return [a1 serverQueue];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return [a1 show];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startLayout(void *a1, const char *a2, ...)
{
  return [a1 startLayout];
}

id objc_msgSend_stopLayout(void *a1, const char *a2, ...)
{
  return [a1 stopLayout];
}

id objc_msgSend_sync(void *a1, const char *a2, ...)
{
  return [a1 sync];
}

id objc_msgSend_uiPresenter(void *a1, const char *a2, ...)
{
  return [a1 uiPresenter];
}

id objc_msgSend_willBeginDataResetWithMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willBeginDataResetWithMode:");
}