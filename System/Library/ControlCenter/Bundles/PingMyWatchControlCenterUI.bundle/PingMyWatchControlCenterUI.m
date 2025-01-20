id pmw_log()
{
  void *v0;
  uint64_t vars8;

  if (qword_81F8 != -1) {
    dispatch_once(&qword_81F8, &stru_4178);
  }
  v0 = (void *)qword_81F0;

  return v0;
}

void sub_29FC(id a1)
{
  qword_81F0 = (uint64_t)os_log_create("com.apple.NanoPingMy", "NanoPingMy");

  _objc_release_x1();
}

void sub_2B0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2B28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setPingInProgress:0];
    [v2 refreshStateAnimated:1];
    id WeakRetained = v2;
  }
}

void sub_2CD0()
{
  if ([(id)objc_opt_class() isPingMyWatchSupported])
  {
    uint64_t v4 = 0;
    v5 = &v4;
    uint64_t v6 = 0x2050000000;
    v0 = (void *)qword_8200;
    uint64_t v7 = qword_8200;
    if (!qword_8200)
    {
      v3[0] = _NSConcreteStackBlock;
      v3[1] = 3221225472;
      v3[2] = sub_3140;
      v3[3] = &unk_4258;
      v3[4] = &v4;
      sub_3140((uint64_t)v3);
      v0 = (void *)v5[3];
    }
    id v1 = v0;
    _Block_object_dispose(&v4, 8);
    id v2 = [v1 sharedDeviceConnection];
    [v2 playSoundOnCompanionWithCompletion:&stru_41E0];
  }
  else
  {
    id v2 = pmw_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v3[0]) = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "PMWControlCenterModule: ping my watch is not supported for the active device", (uint8_t *)v3, 2u);
    }
  }
}

void sub_2DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2E14(id a1, BOOL a2)
{
  BOOL v2 = a2;
  v3 = pmw_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = +[NSNumber numberWithBool:v2];
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "PMWControlCenterModule: Completed ping my watch, played: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_2FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3108(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

Class sub_3140(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_8208)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_3284;
    v3[4] = &unk_4290;
    v3[5] = v3;
    long long v4 = off_4278;
    uint64_t v5 = 0;
    qword_8208 = _sl_dlopen();
    if (!qword_8208)
    {
      abort_report_np();
LABEL_8:
      sub_34B0();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NFMWhereIsMyCompanionConnection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_8200 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_3284()
{
  uint64_t result = _sl_dlopen();
  qword_8208 = result;
  return result;
}

Class sub_32F8(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_8218)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_343C;
    v3[4] = &unk_4290;
    v3[5] = v3;
    long long v4 = off_42B0;
    uint64_t v5 = 0;
    qword_8218 = _sl_dlopen();
    if (!qword_8218)
    {
      abort_report_np();
LABEL_8:
      sub_34D8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NRPairedDeviceRegistry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_8210 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_343C()
{
  uint64_t result = _sl_dlopen();
  qword_8218 = result;
  return result;
}

void sub_34B0()
{
  uint64_t v0 = abort_report_np();
  sub_34D8(v0);
}

void sub_34D8()
{
  uint64_t v0 = (const void *)abort_report_np();
  _Block_object_dispose(v0, v1);
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
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

id objc_msgSend__pingDevice(void *a1, const char *a2, ...)
{
  return [a1 _pingDevice];
}

id objc_msgSend_effect(void *a1, const char *a2, ...)
{
  return [a1 effect];
}

id objc_msgSend_effectWithCumulative(void *a1, const char *a2, ...)
{
  return [a1 effectWithCumulative];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_glyphImageView(void *a1, const char *a2, ...)
{
  return [a1 glyphImageView];
}

id objc_msgSend_isPingMyWatchSupported(void *a1, const char *a2, ...)
{
  return [a1 isPingMyWatchSupported];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedDeviceConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}