id scl_setup_log()
{
  void *v0;
  uint64_t vars8;

  if (qword_D070 != -1) {
    dispatch_once(&qword_D070, &stru_8290);
  }
  v0 = (void *)qword_D068;

  return v0;
}

void sub_3778(id a1)
{
  qword_D068 = (uint64_t)os_log_create("com.apple.SchoolTime", "Setup");

  _objc_release_x1();
}

void sub_3C2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _os_activity_create(&dword_0, "Commit View Model", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v4, &v9);
  v5 = [v3 userInfo];
  v6 = [v5 objectForKey:NRPairedDeviceRegistryDevice];

  v7 = scl_setup_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 pairingID];
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Paired device %@", buf, 0xCu);
  }
  [*(id *)(a1 + 32) _commitViewModel:*(void *)(a1 + 40) toDevice:v6 retryIfNeeded:1];

  os_activity_scope_leave(&v9);
}

void sub_3D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_3DA0(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  v4 = [v3 objectForKey:NRPairedDeviceRegistryDevice];

  v5 = scl_framework_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_55D0(v4, v5);
  }

  [*(id *)(a1 + 32) _pairingFailedToDevice:v4];
}

void sub_4078(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = scl_setup_log();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      os_activity_scope_state_s v9 = [*(id *)(a1 + 40) pairingID];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Configured settings %@ to device %@", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_56A0(a1, (uint64_t)v5, v7);
    }

    v10 = [v5 domain];
    if ([v10 isEqualToString:NSCocoaErrorDomain]
      && [v5 code] == &unk_1003)
    {
      BOOL v11 = *(unsigned char *)(a1 + 64) == 0;

      if (!v11)
      {
        v12 = _os_activity_create(&dword_0, "Retry SchoolTime commit", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        os_activity_scope_enter(v12, (os_activity_scope_state_t)buf);
        v13 = scl_setup_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_5668(v13, v14, v15, v16, v17, v18, v19, v20);
        }

        dispatch_time_t v21 = dispatch_time(0, 10000000000);
        v25 = _NSConcreteStackBlock;
        uint64_t v26 = 3221225472;
        v27 = sub_431C;
        v28 = &unk_8308;
        uint64_t v22 = *(void *)(a1 + 48);
        v23 = *(void **)(a1 + 56);
        v29 = v12;
        uint64_t v30 = v22;
        id v31 = v23;
        id v32 = *(id *)(a1 + 40);
        v24 = v12;
        dispatch_after(v21, (dispatch_queue_t)&_dispatch_main_q, &v25);

        os_activity_scope_leave((os_activity_scope_state_t)buf);
      }
    }
    else
    {
    }
  }
  objc_msgSend(*(id *)(a1 + 48), "setSchoolMode:", 0, v25, v26, v27, v28);
  [*(id *)(a1 + 48) _unregisterPairingTokens];
}

void sub_4300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_431C(uint64_t a1)
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  v2 = scl_setup_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Retrying commit", v3, 2u);
  }

  [*(id *)(a1 + 40) _commitViewModel:*(void *)(a1 + 48) toDevice:*(void *)(a1 + 56) retryIfNeeded:0];
  os_activity_scope_leave(&state);
}

void sub_43B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_4850(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_55D0(void *a1, NSObject *a2)
{
  id v3 = [a1 pairingID];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to pair device %@", (uint8_t *)&v4, 0xCu);
}

void sub_5668(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_56A0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5 = [*(id *)(a1 + 40) pairingID];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Failed to send settings to device %@; %@", (uint8_t *)&v6, 0x16u);
}

void sub_5758(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_5790(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_57C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "SCLSetupPrincipleClass No family member in setupFlowUserInfo %@", (uint8_t *)&v2, 0xCu);
}

void sub_5840(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Flow controller does not have a BPSBuddyControllerDelegate", v1, 2u);
}

void sub_5884(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "setupFlowUserInfo is nil", v1, 2u);
}

void sub_58C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "No family member in setupFlowUserInfo %@", (uint8_t *)&v2, 0xCu);
}

uint64_t SCLLogViewModelCommit()
{
  return _SCLLogViewModelCommit();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_destroyWeak(id *location)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

uint64_t scl_framework_log()
{
  return _scl_framework_log();
}

uint64_t scl_pairing_log()
{
  return _scl_pairing_log();
}

id objc_msgSend__unregisterPairingTokens(void *a1, const char *a2, ...)
{
  return [a1 _unregisterPairingTokens];
}

id objc_msgSend_age(void *a1, const char *a2, ...)
{
  return [a1 age];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_daySettingsDataSource(void *a1, const char *a2, ...)
{
  return [a1 daySettingsDataSource];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultSetupViewModel(void *a1, const char *a2, ...)
{
  return [a1 defaultSetupViewModel];
}

id objc_msgSend_defaultTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeInterval];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceDidPairToken(void *a1, const char *a2, ...)
{
  return [a1 deviceDidPairToken];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_familyMember(void *a1, const char *a2, ...)
{
  return [a1 familyMember];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_flowController(void *a1, const char *a2, ...)
{
  return [a1 flowController];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_pairingDidFailToken(void *a1, const char *a2, ...)
{
  return [a1 pairingDidFailToken];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_setupFlowUserInfo(void *a1, const char *a2, ...)
{
  return [a1 setupFlowUserInfo];
}

id objc_msgSend_showSettingsConfiguration(void *a1, const char *a2, ...)
{
  return [a1 showSettingsConfiguration];
}

id objc_msgSend_skipSettingsConfiguration(void *a1, const char *a2, ...)
{
  return [a1 skipSettingsConfiguration];
}

id objc_msgSend_stringsBundle(void *a1, const char *a2, ...)
{
  return [a1 stringsBundle];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_viewModel(void *a1, const char *a2, ...)
{
  return [a1 viewModel];
}

id objc_msgSend_wantsSetupFlowForFamilyMember_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wantsSetupFlowForFamilyMember:");
}