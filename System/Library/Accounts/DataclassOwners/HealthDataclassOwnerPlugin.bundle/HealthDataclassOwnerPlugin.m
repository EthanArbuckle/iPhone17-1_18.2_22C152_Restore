void sub_5458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_5490(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_54A0(uint64_t a1)
{
}

void sub_54A8(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), obj);
  id v5 = obj;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id HKHealthDataclassOwnerBundle()
{
  if (qword_CB88 != -1) {
    dispatch_once(&qword_CB88, &stru_82B8);
  }
  v0 = (void *)qword_CB80;
  return v0;
}

void sub_556C(id a1)
{
  qword_CB80 = +[NSBundle bundleForClass:objc_opt_class()];
  _objc_release_x1();
}

id sub_5AD8(uint64_t a1)
{
  [*(id *)(a1 + 32) _persistHealthDataclassEnablementState:*(unsigned __int8 *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 _presentHealthDatabaseObliterationAlert];
}

id sub_5B18(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadDataclassSpecifier];
}

void sub_5CEC(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(a1 + 56)) {
      CFStringRef v4 = @"Enabling";
    }
    else {
      CFStringRef v4 = @"Disabling";
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ iCloud Sync for account %@", buf, 0x16u);
  }
  id v5 = (void **)(a1 + 32);
  [*(id *)(a1 + 32) setEnabled:*(unsigned __int8 *)(a1 + 56) forDataclass:kAccountDataclassHealth];
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v6 = *(void **)(a1 + 48);
  v7 = *v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_5EA4;
  v8[3] = &unk_8358;
  id v9 = v7;
  objc_copyWeak(&v10, (id *)buf);
  [v6 saveAccount:v9 withCompletionHandler:v8];
  objc_destroyWeak(&v10);

  objc_destroyWeak((id *)buf);
}

void sub_5E80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5EA4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  _HKInitializeLogging();
  v6 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    CFStringRef v8 = @"no";
    *(_DWORD *)buf = 138543874;
    if (a2) {
      CFStringRef v8 = @"YES";
    }
    uint64_t v12 = v7;
    __int16 v13 = 2114;
    CFStringRef v14 = v8;
    __int16 v15 = 2114;
    id v16 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Saved %{public}@ with success=%{public}@, error=%{public}@", buf, 0x20u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6000;
  block[3] = &unk_8330;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v10);
}

void sub_6000(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadAccount];
}

void sub_6344(id a1, UIAlertAction *a2)
{
  _HKInitializeLogging();
  v2 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "User chose to keep data after disabling iCloud Sync", v3, 2u);
  }
}

void sub_63B0(id a1, UIAlertAction *a2)
{
  id v3 = objc_alloc_init((Class)HKHealthStore);
  id v2 = [objc_alloc((Class)HKDatabaseControl) initWithHealthStore:v3];
  [v2 obliterateHealthDataWithOptions:1 completion:&stru_8420];
}

void sub_6424(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  CFStringRef v4 = a3;
  _HKInitializeLogging();
  id v5 = HKLogSync;
  if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"no";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138543618;
    CFStringRef v8 = v6;
    __int16 v9 = 2114;
    id v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "User chose to obliterate data after disabling iCloud Sync (success=%{public}@, error=%{public}@)", (uint8_t *)&v7, 0x16u);
  }
}

id sub_6504(uint64_t a1)
{
  return [*(id *)(a1 + 32) _persistHealthDataclassEnablementState:1];
}

void sub_65A8(uint64_t a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ %{public}@", buf, 0x16u);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

uint64_t _HKLogDroppedError()
{
  return __HKLogDroppedError();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__account(void *a1, const char *a2, ...)
{
  return [a1 _account];
}

id objc_msgSend__reloadAccount(void *a1, const char *a2, ...)
{
  return [a1 _reloadAccount];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_isDeviceSupported(void *a1, const char *a2, ...)
{
  return [a1 isDeviceSupported];
}

id objc_msgSend_isTobleroneEnabled(void *a1, const char *a2, ...)
{
  return [a1 isTobleroneEnabled];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}