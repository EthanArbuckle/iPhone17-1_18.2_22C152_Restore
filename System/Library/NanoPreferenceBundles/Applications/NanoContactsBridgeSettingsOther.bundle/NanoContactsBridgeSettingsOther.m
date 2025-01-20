id NCBST_Tinker_log()
{
  void *v0;
  uint64_t vars8;

  if (qword_11020 != -1) {
    dispatch_once(&qword_11020, &stru_C2C0);
  }
  v0 = (void *)qword_11018;

  return v0;
}

void sub_2154(id a1)
{
  qword_11018 = (uint64_t)os_log_create("com.apple.NanoContactsBridgeSettingsTinker", "Tinker");

  _objc_release_x1();
}

id NanoContactsSettingsTinkerBundle()
{
  if (qword_11030 != -1) {
    dispatch_once(&qword_11030, &stru_C2E0);
  }
  v0 = (void *)qword_11028;

  return v0;
}

void sub_21EC(id a1)
{
  qword_11028 = +[NSBundle bundleWithIdentifier:@"com.apple.NanoContactsBridgeSettingsTinker"];

  _objc_release_x1();
}

id NCABCMS_Tinker_log()
{
  if (qword_11040 != -1) {
    dispatch_once(&qword_11040, &stru_C300);
  }
  v0 = (void *)qword_11038;

  return v0;
}

void sub_2288(id a1)
{
  qword_11038 = (uint64_t)os_log_create("com.apple.NanoContacts.ContactsManagement", "Tinker");

  _objc_release_x1();
}

id NCABCMS_Accounts_log()
{
  if (qword_11050 != -1) {
    dispatch_once(&qword_11050, &stru_C320);
  }
  v0 = (void *)qword_11048;

  return v0;
}

void sub_2320(id a1)
{
  qword_11048 = (uint64_t)os_log_create("com.apple.NanoContacts.ContactsManagement", "Accounts");

  _objc_release_x1();
}

void sub_3200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_322C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = NCABCMS_Tinker_log();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_6EEC((uint64_t)v3, a1, v6);
    }

    [WeakRetained _updateContactsManagementState:*(unsigned int *)(a1 + 40) error:v3];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446210;
      v8 = "-[NCABTinkerContactsManagementStateManager _updateContactsManagementState:error:]_block_invoke";
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s - _enableContactsManagementForFamilyMember completed, restarting state fetch", (uint8_t *)&v7, 0xCu);
    }

    [WeakRetained _startFetchingContactsManagementState];
  }
}

id sub_36E8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setContactsManagementStateFromContactsCountStatus:a2];
}

id sub_36F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:100 error:0];
}

id sub_3704(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:1 error:0];
}

id sub_3714(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:4 error:0];
}

id sub_3724(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:101 error:0];
}

id sub_3734(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:1 error:0];
}

id sub_3744(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:5 error:0];
}

id sub_3754(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:102 error:0];
}

id sub_3764(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:1 error:0];
}

void sub_3F8C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeContactsCountRetryAndTimeoutHandlers_SYNC");
  v2 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) contactsCountSyncStatusRetryTimeoutDate];
    int v14 = 136446466;
    v15 = "-[NCABTinkerContactsManagementStateManager _installContactsCountRetryAndTimeoutHandlers]_block_invoke";
    __int16 v16 = 2114;
    v17 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%{public}s - contactsCountSyncStatusRetryTimeoutDate:%{public}@", (uint8_t *)&v14, 0x16u);
  }
  v4 = [*(id *)(a1 + 32) contactsCountSyncStatusRetryTimeoutDate];
  [v4 timeIntervalSinceNow];
  double v6 = v5;

  if (v6 <= 0.0)
  {
    v10 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [*(id *)(a1 + 32) contactsCountSyncStatusRetryTimeoutDate];
      int v14 = 136446722;
      v15 = "-[NCABTinkerContactsManagementStateManager _installContactsCountRetryAndTimeoutHandlers]_block_invoke";
      __int16 v16 = 2114;
      v17 = v13;
      __int16 v18 = 2048;
      double v19 = v6;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s - NO TIMER - contactsCountSyncStatusRetryTimeoutDate:%{public}@, remainingTimeoutSeconds:%0.2f", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) contactsCountSyncStatusRetryTimeoutInterval];
    int v7 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(void *)(a1 + 32), "__contactsSyncTimeoutTimer:", 0, 0);
    [*(id *)(a1 + 32) setContactsCountSyncStatusRetryTimeoutTimer:v7];

    v8 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"__contactsSyncRetryTimer:" selector:0 userInfo:1 repeats:3.0];
    [*(id *)(a1 + 32) setContactsCountSyncStatusRetryTimer:v8];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:*(void *)(a1 + 32) selector:"__contactStoreDidChange:" name:CNContactStoreDidChangeNotification object:0];

    v10 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [*(id *)(a1 + 32) contactsCountSyncStatusRetryTimeoutDate];
      v12 = [*(id *)(a1 + 32) contactsCountSyncStatusRetryTimeoutTimer];
      int v14 = 136446978;
      v15 = "-[NCABTinkerContactsManagementStateManager _installContactsCountRetryAndTimeoutHandlers]_block_invoke";
      __int16 v16 = 2114;
      v17 = v11;
      __int16 v18 = 2048;
      double v19 = v6;
      __int16 v20 = 2114;
      v21 = v12;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s - SET TIMER - contactsCountSyncStatusRetryTimeoutDate:%{public}@, remainingTimeoutSeconds:%0.2f, contactsCountSyncStatusRetryTimeoutTimer:%{public}@", (uint8_t *)&v14, 0x2Au);
    }
  }
}

id sub_4474(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeContactsCountRetryAndTimeoutHandlers_SYNC");
}

void sub_4BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4BDC(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _processSTContactManagementState:a2 familyMember:*(void *)(a1 + 32) error:v6];
}

void sub_50F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_526C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5298(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = NCBST_Tinker_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446722;
    v15 = "-[NCABSettingsTinkerController init]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2114;
    id v19 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "%{public}s - found familyMember: %@, error: %{public}@", buf, 0x20u);
  }

  uint64_t v9 = NCBST_Tinker_log();
  v10 = v9;
  if (!v5 || v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_70CC((uint64_t)v6, v10);
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v15 = "-[NCABSettingsTinkerController init]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "%{public}s - got familyMember: %@", buf, 0x16u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_5498;
    v11[3] = &unk_C3F0;
    v12 = WeakRetained;
    id v13 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

    v10 = v12;
  }
}

id sub_5498(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTinkerFamilyMember:*(void *)(a1 + 40)];
}

void sub_56DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5708(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = NCBST_Tinker_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [*(id *)(a1 + 32) familyMember];
    *(_DWORD *)buf = 136446722;
    uint64_t v9 = "-[NCABSettingsTinkerController setTinkerFamilyMember:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = a2;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - received contacts management state: %d for familyMember: %@; reloading",
      buf,
      0x1Cu);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5854;
  block[3] = &unk_C398;
  block[4] = WeakRetained;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_5854(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id NCABCSH_ContactCounts_log()
{
  if (qword_11060 != -1) {
    dispatch_once(&qword_11060, &stru_C460);
  }
  v0 = (void *)qword_11058;

  return v0;
}

void sub_651C(id a1)
{
  qword_11058 = (uint64_t)os_log_create("com.apple.NanoContacts.ContactsSync", "ContactCounts");

  _objc_release_x1();
}

id NCABCSH_Sync_log()
{
  if (qword_11070 != -1) {
    dispatch_once(&qword_11070, &stru_C480);
  }
  v0 = (void *)qword_11068;

  return v0;
}

void sub_65B4(id a1)
{
  qword_11068 = (uint64_t)os_log_create("com.apple.NanoContacts.ContactsSync", "Sync");

  _objc_release_x1();
}

void sub_6BBC(void *a1, uint64_t a2, NSObject *a3)
{
  id v5 = [a1 familyMember];
  int v6 = 136446722;
  int v7 = "+[NCABTinkerContactsManagementStateManager managerForBuddyControllerDelegate:]";
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "%{public}s - familyMember mismatch; prior: %@, latest: %@",
    (uint8_t *)&v6,
    0x20u);
}

void sub_6C7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6CF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6D6C()
{
  v1[0] = 136446466;
  sub_510C();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%{public}s - returning contactsCountStatus:%d", (uint8_t *)v1, 0x12u);
}

void sub_6DF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_6E68()
{
  v1[0] = 136446466;
  sub_510C();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%{public}s - unexpected _contactsManagementRequestState: %d; bailing.",
    (uint8_t *)v1,
    0x12u);
}

void sub_6EEC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a2 + 40);
  int v4 = 136446722;
  id v5 = "-[NCABTinkerContactsManagementStateManager _updateContactsManagementState:error:]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}s - _enableContactsManagementForFamilyMember produced error: %{public}@; re-updating to state: %d",
    (uint8_t *)&v4,
    0x1Cu);
}

void sub_6F8C(int *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = *(_DWORD *)(a2 + 24);
  int v5 = 136446722;
  __int16 v6 = "-[NCABTinkerContactsManagementStateManager __contactsSyncRetryNow]";
  __int16 v7 = 1024;
  int v8 = v3;
  __int16 v9 = 1024;
  int v10 = v4;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}s - unexpected _contactsManagementRequestState: %d, _contactsManagementState: %d", (uint8_t *)&v5, 0x18u);
}

void sub_702C(void *a1, NSObject *a2)
{
  int v3 = 136446466;
  int v4 = "-[NCABTinkerContactsManagementStateManager _enableContactsManagementForFamilyMember:request:completionHandler:]";
  __int16 v5 = 1024;
  unsigned int v6 = [a1 lastKnownContactsManagementState];
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}s - WARNING - attemping to enable contacts management from bad state: %d", (uint8_t *)&v3, 0x12u);
}

void sub_70CC(uint64_t a1, NSObject *a2)
{
  int v2 = 136446466;
  int v3 = "-[NCABSettingsTinkerController init]_block_invoke";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}s - error: %{public}@", (uint8_t *)&v2, 0x16u);
}

void sub_7158(uint64_t a1, NSObject *a2)
{
  int v2 = 136446466;
  int v3 = "-[NCABSettingsTinkerController specifiers]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}s - no tinkerUserName for tinkerFamilyMember: %@", (uint8_t *)&v2, 0x16u);
}

void sub_71E4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136446722;
  __int16 v4 = "+[NCABContactsSyncHelper _contactsCountStatusForFamilyMember:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}s - contactCountForFetchRequest: %@ unexpected error: %{public}@", (uint8_t *)&v3, 0x20u);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend__checkContactsCountStatusNotYetSyncedTimedOut(void *a1, const char *a2, ...)
{
  return [a1 _checkContactsCountStatusNotYetSyncedTimedOut];
}

id objc_msgSend__fetchContactsManagementState(void *a1, const char *a2, ...)
{
  return [a1 _fetchContactsManagementState];
}

id objc_msgSend__installContactsCountRetryAndTimeoutHandlers(void *a1, const char *a2, ...)
{
  return [a1 _installContactsCountRetryAndTimeoutHandlers];
}

id objc_msgSend__removeContactsCountRetryAndTimeoutHandlers(void *a1, const char *a2, ...)
{
  return [a1 _removeContactsCountRetryAndTimeoutHandlers];
}

id objc_msgSend__startFetchingContactsManagementState(void *a1, const char *a2, ...)
{
  return [a1 _startFetchingContactsManagementState];
}

id objc_msgSend__waitOnContactsSyncWithRetries(void *a1, const char *a2, ...)
{
  return [a1 _waitOnContactsSyncWithRetries];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_autoEnableContactsManagement(void *a1, const char *a2, ...)
{
  return [a1 autoEnableContactsManagement];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cachedTinkerFamilyMemeber(void *a1, const char *a2, ...)
{
  return [a1 cachedTinkerFamilyMemeber];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_contactsCountStatus(void *a1, const char *a2, ...)
{
  return [a1 contactsCountStatus];
}

id objc_msgSend_contactsCountSyncStatusRetryTimeoutDate(void *a1, const char *a2, ...)
{
  return [a1 contactsCountSyncStatusRetryTimeoutDate];
}

id objc_msgSend_contactsCountSyncStatusRetryTimeoutInterval(void *a1, const char *a2, ...)
{
  return [a1 contactsCountSyncStatusRetryTimeoutInterval];
}

id objc_msgSend_contactsCountSyncStatusRetryTimeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 contactsCountSyncStatusRetryTimeoutTimer];
}

id objc_msgSend_contactsManagementStateManager(void *a1, const char *a2, ...)
{
  return [a1 contactsManagementStateManager];
}

id objc_msgSend_contactsSyncAndNetworkAccessEnabled(void *a1, const char *a2, ...)
{
  return [a1 contactsSyncAndNetworkAccessEnabled];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_countOfFamilyMemberContacts(void *a1, const char *a2, ...)
{
  return [a1 countOfFamilyMemberContacts];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return [a1 dsid];
}

id objc_msgSend_familyMember(void *a1, const char *a2, ...)
{
  return [a1 familyMember];
}

id objc_msgSend_familyMemberContactsController(void *a1, const char *a2, ...)
{
  return [a1 familyMemberContactsController];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_lastKnownContactsManagementState(void *a1, const char *a2, ...)
{
  return [a1 lastKnownContactsManagementState];
}

id objc_msgSend_localDeviceContactsCount(void *a1, const char *a2, ...)
{
  return [a1 localDeviceContactsCount];
}

id objc_msgSend_memberType(void *a1, const char *a2, ...)
{
  return [a1 memberType];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_setupFlowUserInfo(void *a1, const char *a2, ...)
{
  return [a1 setupFlowUserInfo];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stManagementState(void *a1, const char *a2, ...)
{
  return [a1 stManagementState];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_tinkerFamilyMember(void *a1, const char *a2, ...)
{
  return [a1 tinkerFamilyMember];
}

id objc_msgSend_tinkerSupportHelper(void *a1, const char *a2, ...)
{
  return [a1 tinkerSupportHelper];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}