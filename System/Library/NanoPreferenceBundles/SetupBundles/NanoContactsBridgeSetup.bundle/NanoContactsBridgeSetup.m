void sub_34C8(id a1)
{
  uint64_t vars8;

  qword_23E00 = (uint64_t)os_log_create("com.apple.NanoContacts.ContactsSync", "contacts-dataclass-action-handler");

  _objc_release_x1();
}

id NCABISH_Accounts_log()
{
  if (qword_23E10 != -1) {
    dispatch_once(&qword_23E10, &stru_1C470);
  }
  v0 = (void *)qword_23E08;

  return v0;
}

void sub_3C1C(id a1)
{
  qword_23E08 = (uint64_t)os_log_create("com.apple.NanoContacts.ContactsSync", "Accounts");

  _objc_release_x1();
}

void sub_4128(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = NCABISH_Accounts_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = *(unsigned __int8 *)(a1 + 32);
    int v8 = 136446978;
    v9 = "-[NCContactsiCloudSyncHelper setPrimaryiCloudAccountCardDAVEnabled]_block_invoke";
    __int16 v10 = 1024;
    int v11 = v7;
    __int16 v12 = 1024;
    int v13 = a2;
    __int16 v14 = 2114;
    id v15 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s:%d Completed save -- success: %d, error: %{public}@", (uint8_t *)&v8, 0x22u);
  }
}

id NCABCSH_ContactCounts_log()
{
  if (qword_23E20 != -1) {
    dispatch_once(&qword_23E20, &stru_1C4B0);
  }
  v0 = (void *)qword_23E18;

  return v0;
}

void sub_460C(id a1)
{
  qword_23E18 = (uint64_t)os_log_create("com.apple.NanoContacts.ContactsSync", "ContactCounts");

  _objc_release_x1();
}

id NCABCSH_Sync_log()
{
  if (qword_23E30 != -1) {
    dispatch_once(&qword_23E30, &stru_1C4D0);
  }
  v0 = (void *)qword_23E28;

  return v0;
}

void sub_46A4(id a1)
{
  qword_23E28 = (uint64_t)os_log_create("com.apple.NanoContacts.ContactsSync", "Sync");

  _objc_release_x1();
}

void sub_4D00(id a1)
{
  qword_23E40 = (uint64_t)os_log_create("com.apple.NanoContacts.ContactsSync", "contacts-dataclass-owner");

  _objc_release_x1();
}

id sub_4EEC(uint64_t a1, void *a2)
{
  return [a2 updateContainer:*(void *)(a1 + 32)];
}

void sub_4EF8(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_F930();
  }
}

void sub_522C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 addContainer:v2 toAccountWithIdentifier:v5];
}

void sub_529C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_FA7C();
  }
}

void sub_52FC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = [v3 identifier];
  [v4 setContainer:v2 asDefaultContainerOfAccountWithIdentifier:v5];
}

void sub_536C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_FAE4();
  }
}

id sub_56D0(uint64_t a1, void *a2)
{
  return [a2 addAccount:*(void *)(a1 + 32)];
}

void sub_56DC(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_FB4C();
  }
}

void sub_5DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_5DF4(uint64_t result, uint64_t a2, unsigned char *a3)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a3 = 1;
  return result;
}

id sub_6514(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

CNMutableContact *__cdecl sub_65F8(id a1, CNMutableContact *a2)
{
  id v2 = [(CNMutableContact *)a2 mutableCopy];

  return (CNMutableContact *)v2;
}

void sub_6690(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_66B0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_66E4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

void sub_6704(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_6724(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_67E8(id a1)
{
  qword_23E50 = (uint64_t)os_log_create("com.apple.NanoContacts.ContactsSync", "DataAccess");

  _objc_release_x1();
}

void sub_68BC(id a1)
{
  CFStringRef v1 = (const __CFString *)MGGetStringAnswer();
  if (v1)
  {
    CFStringRef v2 = v1;
    byte_23E58 = CFEqual(v1, @"CH");
    CFRelease(v2);
  }
  else
  {
    byte_23E58 = 0;
  }
}

void sub_6D90(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x18u);
}

id NCABCMS_Tinker_log()
{
  if (qword_23E70 != -1) {
    dispatch_once(&qword_23E70, &stru_1C680);
  }
  v0 = (void *)qword_23E68;

  return v0;
}

void sub_6E04(id a1)
{
  qword_23E68 = (uint64_t)os_log_create("com.apple.NanoContacts.ContactsManagement", "Tinker");

  _objc_release_x1();
}

id NCABCMS_Accounts_log()
{
  if (qword_23E80 != -1) {
    dispatch_once(&qword_23E80, &stru_1C6A0);
  }
  v0 = (void *)qword_23E78;

  return v0;
}

void sub_6E9C(id a1)
{
  qword_23E78 = (uint64_t)os_log_create("com.apple.NanoContacts.ContactsManagement", "Accounts");

  _objc_release_x1();
}

void sub_7D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7DA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = NCABCMS_Tinker_log();
  v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10748((uint64_t)v3, a1, v6);
    }

    [WeakRetained _updateContactsManagementState:*(unsigned int *)(a1 + 40) error:v3];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136446210;
      int v8 = "-[NCABTinkerContactsManagementStateManager _updateContactsManagementState:error:]_block_invoke";
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}s - _enableContactsManagementForFamilyMember completed, restarting state fetch", (uint8_t *)&v7, 0xCu);
    }

    [WeakRetained _startFetchingContactsManagementState];
  }
}

id sub_8264(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _setContactsManagementStateFromContactsCountStatus:a2];
}

id sub_8270(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:100 error:0];
}

id sub_8280(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:1 error:0];
}

id sub_8290(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:4 error:0];
}

id sub_82A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:101 error:0];
}

id sub_82B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:1 error:0];
}

id sub_82C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:5 error:0];
}

id sub_82D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:102 error:0];
}

id sub_82E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateContactsManagementState:1 error:0];
}

void sub_8B08(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeContactsCountRetryAndTimeoutHandlers_SYNC");
  CFStringRef v2 = NCABCMS_Tinker_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) contactsCountSyncStatusRetryTimeoutDate];
    int v14 = 136446466;
    id v15 = "-[NCABTinkerContactsManagementStateManager _installContactsCountRetryAndTimeoutHandlers]_block_invoke";
    __int16 v16 = 2114;
    v17 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%{public}s - contactsCountSyncStatusRetryTimeoutDate:%{public}@", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v4 = [*(id *)(a1 + 32) contactsCountSyncStatusRetryTimeoutDate];
  [v4 timeIntervalSinceNow];
  double v6 = v5;

  if (v6 <= 0.0)
  {
    uint64_t v10 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = [*(id *)(a1 + 32) contactsCountSyncStatusRetryTimeoutDate];
      int v14 = 136446722;
      id v15 = "-[NCABTinkerContactsManagementStateManager _installContactsCountRetryAndTimeoutHandlers]_block_invoke";
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

    int v8 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"__contactsSyncRetryTimer:" selector:0 userInfo:1 repeats:3.0];
    [*(id *)(a1 + 32) setContactsCountSyncStatusRetryTimer:v8];

    uint64_t v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:*(void *)(a1 + 32) selector:"__contactStoreDidChange:" name:CNContactStoreDidChangeNotification object:0];

    uint64_t v10 = NCABCMS_Tinker_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = [*(id *)(a1 + 32) contactsCountSyncStatusRetryTimeoutDate];
      __int16 v12 = [*(id *)(a1 + 32) contactsCountSyncStatusRetryTimeoutTimer];
      int v14 = 136446978;
      id v15 = "-[NCABTinkerContactsManagementStateManager _installContactsCountRetryAndTimeoutHandlers]_block_invoke";
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

id sub_8FF0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeContactsCountRetryAndTimeoutHandlers_SYNC");
}

void sub_972C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_9758(uint64_t a1, uint64_t a2, void *a3)
{
  double v5 = (id *)(a1 + 40);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _processSTContactManagementState:a2 familyMember:*(void *)(a1 + 32) error:v6];
}

void sub_B234(uint64_t a1)
{
  CFStringRef v2 = NCBS_Tinker_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136446210;
    int v14 = "-[NCBSBridgeSetupController _promptForiCloudSyncFollowingController:]_block_invoke";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}s - user chose Enable iCloud Contacts network data access and/or sync", (uint8_t *)&v13, 0xCu);
  }

  if (*(unsigned char *)(a1 + 48)) {
    [*(id *)(*(void *)(a1 + 32) + 24) setNetworkAccessEnabledForContacts:1];
  }
  if (*(unsigned char *)(a1 + 49)) {
    [*(id *)(*(void *)(a1 + 32) + 16) setPrimaryiCloudAccountCardDAVEnabled];
  }
  sleep(2u);
  id v3 = [*(id *)(a1 + 32) familyMember];
  +[NCABContactsSyncHelper triggerContactsSyncForFamilyMember:v3];

  uint64_t v4 = [*(id *)(a1 + 32) contactsManagementStateManager];
  objc_msgSend(v4, "setContactsSyncAndNetworkAccessEnabled:", objc_msgSend(*(id *)(a1 + 32), "_contactsSyncEnabledWithNetworkAccess"));
  [v4 setExtendedFamilyMemberContactsSyncTimeout:1];
  if ([v4 contactsSyncAndNetworkAccessEnabled])
  {
    [*(id *)(a1 + 32) _updateContactsManagementStateWithHoldWaitUIThenStepCompleteController:*(void *)(a1 + 40)];
  }
  else
  {
    double v5 = NCBS_Tinker_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10928(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    [*(id *)(a1 + 32) miniFlowStepComplete:*(void *)(a1 + 40)];
  }
}

id sub_B3D0(uint64_t a1)
{
  CFStringRef v2 = NCBS_Tinker_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446210;
    double v5 = "-[NCBSBridgeSetupController _promptForiCloudSyncFollowingController:]_block_invoke";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}s - user chose Setup Later", (uint8_t *)&v4, 0xCu);
  }

  return [*(id *)(a1 + 32) miniFlowStepComplete:*(void *)(a1 + 40)];
}

void sub_B5E4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B6B8;
  block[3] = &unk_1C7B8;
  uint64_t v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  int v12 = a2;
  id v9 = v6;
  id v10 = v5;
  id v11 = *(id *)(a1 + 48);
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_B6B8(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowingHoldWait:0];
  CFStringRef v2 = NCBS_Tinker_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = objc_retainBlock(*(id *)(a1 + 56));
    int v8 = 136447234;
    id v9 = "-[NCBSBridgeSetupController _fetchContactsManagementStateWithHoldWaitUIAndCompletionHandler:]_block_invoke_2";
    __int16 v10 = 2114;
    uint64_t v11 = v4;
    __int16 v12 = 1024;
    int v13 = v3;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    __int16 v16 = 2048;
    id v17 = v6;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}s => completionHandler(%{public}@, %d, %{public}@):%p", (uint8_t *)&v8, 0x30u);
  }
  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(a1 + 40), *(unsigned int *)(a1 + 64), *(void *)(a1 + 48));
  }
  return result;
}

void sub_B910(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    int v8 = NCBS_Tinker_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_109A0();
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateForContactsManagementState:contactsCountStatus:", objc_msgSend(v6, "lastKnownContactsManagementState"), objc_msgSend(v6, "contactsCountStatus"));
    int v8 = NCBS_Tinker_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v9 = [*(id *)(a1 + 32) cmsForRunningFlow];
      int v10 = 136446722;
      uint64_t v11 = "-[NCBSBridgeSetupController _updateContactsManagementStateWithHoldWaitUIThenStepCompleteController:]_block_invoke";
      __int16 v12 = 1024;
      unsigned int v13 = v9;
      __int16 v14 = 1024;
      unsigned int v15 = [v6 contactsSyncAndNetworkAccessEnabled];
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "%{public}s - updated cmsForRunningFlow: %d contactsSyncAndNetworkAccessEnabled: %d", (uint8_t *)&v10, 0x18u);
    }
  }

  [*(id *)(a1 + 32) miniFlowStepComplete:*(void *)(a1 + 40)];
}

void sub_C660(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = NCBS_Tinker_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10BBC();
    }

    uint64_t v7 = 1;
  }
  else
  {
    unsigned int v8 = [(id)objc_opt_class() controllerNeedsToRunForContactsManagementState:a2];
    unsigned int v9 = NCBS_Tinker_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136446722;
      uint64_t v11 = "-[NCBSBridgeSetupController _checkContactsManagementAndEnqueueReleaseHold]_block_invoke";
      __int16 v12 = 1024;
      int v13 = a2;
      __int16 v14 = 1024;
      unsigned int v15 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}s - controllerNeedsToRunForContactsManagementState: %d -> %d", (uint8_t *)&v10, 0x18u);
    }

    uint64_t v7 = v8 ^ 1;
  }
  [*(id *)(a1 + 32) _enqueueReleaseHoldWithSkip:v7];
}

void sub_C8B8(uint64_t a1)
{
  CFStringRef v2 = NCBS_Tinker_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    int v8 = 136446466;
    unsigned int v9 = "-[NCBSBridgeSetupController _enqueueReleaseHoldWithSkip:]_block_invoke";
    __int16 v10 = 1024;
    int v11 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: %d [execute]", (uint8_t *)&v8, 0x12u);
  }

  int v4 = *(unsigned __int8 *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) delegate];
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v4) {
    [v5 buddyControllerReleaseHoldAndSkip:v7];
  }
  else {
    [v5 buddyControllerReleaseHold:v7];
  }
}

id NCBS_Tinker_log()
{
  if (qword_23E90 != -1) {
    dispatch_once(&qword_23E90, &stru_1C878);
  }
  v0 = (void *)qword_23E88;

  return v0;
}

void sub_D6E4(id a1)
{
  qword_23E88 = (uint64_t)os_log_create("com.apple.NanoContacts.BridgeSetup", "Tinker");

  _objc_release_x1();
}

id NanoContactsBridgeSetupBundle()
{
  if (qword_23EA0 != -1) {
    dispatch_once(&qword_23EA0, &stru_1C898);
  }
  v0 = (void *)qword_23E98;

  return v0;
}

void sub_D77C(id a1)
{
  qword_23E98 = +[NSBundle bundleWithIdentifier:NanoContactsBridgeSetupBundleIdentifier];

  _objc_release_x1();
}

void sub_DBD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = NCBS_Tinker_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    uint64_t v7 = "-[NCBSTinkerRequestManagementViewController _requestToManageContacts]_block_invoke";
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}s - request completed with error: %{public}@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DCFC;
  block[3] = &unk_1C718;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_DCFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyUserRequestWasSentThenProceed];
}

void sub_DEE0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) miniFlowDelegate];
  [v2 miniFlowStepComplete:*(void *)(a1 + 32)];
}

void sub_F690(void *a1, NSObject *a2)
{
  int v4 = [a1 account];
  id v5 = [v4 accountType];
  id v6 = [v5 identifier];
  uint64_t v7 = [a1 account];
  __int16 v8 = [v7 username];
  int v9 = 138412546;
  __int16 v10 = v6;
  __int16 v11 = 2112;
  __int16 v12 = v8;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to create an AB account for iCloud account %@ (%@)", (uint8_t *)&v9, 0x16u);
}

void sub_F78C(os_log_t log)
{
  int v1 = 136446210;
  id v2 = "-[NCContactsiCloudSyncHelper primaryiCloudAccountCardDAVEnabled]";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}s - No Apple Account exists for user", (uint8_t *)&v1, 0xCu);
}

void sub_F810(os_log_t log)
{
  int v1 = 136446210;
  id v2 = "-[NCContactsiCloudSyncHelper setPrimaryiCloudAccountCardDAVEnabled]";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}s - No Apple Account exists for user", (uint8_t *)&v1, 0xCu);
}

void sub_F894(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136446722;
  int v4 = "+[NCABContactsSyncHelper _contactsCountStatusForFamilyMember:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}s - contactCountForFetchRequest: %@ unexpected error: %{public}@", (uint8_t *)&v3, 0x20u);
}

void sub_F930()
{
  sub_66CC();
  sub_66B0(&dword_0, v0, v1, "failed to enable local container: %@", v2, v3, v4, v5, v6);
}

void sub_F998(void *a1)
{
  uint64_t v2 = [0 identifier];
  uint64_t v3 = [a1 valueForKey:@"identifier"];
  sub_6704(&dword_0, v4, v5, "defaultContainerForParentACAccountWithIdentifier could not find a CN account associated with external identifier %{public}@ and child account external idententfiers %{public}@ (createIfNecessary = %{public}@)", v6, v7, v8, v9, 2u);
}

void sub_FA7C()
{
  sub_66CC();
  sub_66B0(&dword_0, v0, v1, "error creating container: %@", v2, v3, v4, v5, v6);
}

void sub_FAE4()
{
  sub_66CC();
  sub_66B0(&dword_0, v0, v1, "error setting container as default container: %@", v2, v3, v4, v5, v6);
}

void sub_FB4C()
{
  sub_66CC();
  sub_6724(&dword_0, v0, v1, "error creating account %@: %@");
}

void sub_FBC4(void *a1)
{
  uint64_t v2 = [a1 identifier];
  [a1 iOSLegacyIdentifier];
  sub_6678();
  sub_6690(&dword_0, v3, v4, "contactsInContainer returned a nil result for local container, not merging contacts from container (identifier = %{public}@ legacy id: %d)", v5, v6, v7, v8, v9);
}

void sub_FC5C(void *a1)
{
  uint64_t v2 = [a1 identifier];
  [a1 iOSLegacyIdentifier];
  sub_6678();
  sub_6690(&dword_0, v3, v4, "contactsInContainer returned 0 contacts for local container, no need to merge contacts from container (identifier = %{public}@ legacy id: %d)", v5, v6, v7, v8, v9);
}

void sub_FCF4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 identifier];
  sub_66CC();
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "no account syncing Contacts found on parent account %@", v4, 0xCu);
}

void sub_FD88()
{
  sub_66CC();
  sub_66B0(&dword_0, v0, v1, "did not find local container %@", v2, v3, v4, v5, v6);
}

void sub_FDF0(void *a1)
{
  uint64_t v2 = [a1 identifier];
  [a1 iOSLegacyIdentifier];
  sub_6678();
  sub_6690(&dword_0, v3, v4, "Found local container, identifier: %{public}@ legacy id = %d", v5, v6, v7, v8, v9);
}

void sub_FE88(void *a1)
{
  uint64_t v2 = [a1 identifier];
  uint64_t v3 = [a1 externalIdentifierString];
  sub_66D8();
  sub_6704(&dword_0, v4, v5, "did not find a default container for account with CN identifier: %{public}@ external identifier: %{public}@ error: %{public}@", v6, v7, v8, v9, 2u);
}

void sub_FF44(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = a1;
  uint64_t v6 = [a1 identifier];
  LODWORD(v5) = [v5 iOSLegacyIdentifier];
  uint64_t v7 = [a2 identifier];
  uint64_t v8 = [a2 externalIdentifierString];
  int v9 = 138544386;
  __int16 v10 = v6;
  __int16 v11 = 1024;
  int v12 = (int)v5;
  __int16 v13 = 2114;
  __int16 v14 = v7;
  __int16 v15 = 2114;
  __int16 v16 = v8;
  __int16 v17 = 1024;
  unsigned int v18 = [a2 iOSLegacyIdentifier];
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "Found default container (identifier: %{public}@  legacy id = %d) for account (identifier: %{public}@  external identifier: %{public}@ legacy id = %d)", (uint8_t *)&v9, 0x2Cu);
}

void sub_10058(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  sub_66D8();
  *(void *)uint64_t v4 = v1;
  sub_6724(&dword_0, v1, v2, "error fetching account with external identifier %{public}@ error: %{public}@", (void)v3, DWORD2(v3), *(void *)&v4[2]);
}

void sub_100CC(void *a1)
{
  os_log_t v2 = [a1 identifier];
  long long v3 = [a1 externalIdentifierString];
  [a1 iOSLegacyIdentifier];
  sub_66D8();
  sub_66E4(&dword_0, v4, v5, "Matched CNAccount (identifier: %{public}@ external identifier: %{public}@ legacy id = %d) to account with external identifier %{public}@", v6, v7, v8, v9, 2u);
}

void sub_101A4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 externalIdentifierString];
  int v6 = 138543618;
  uint64_t v7 = v5;
  sub_66D8();
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "error fetching containers for account with external identifier %{public}@ error: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_10250(void *a1, void *a2)
{
  [a1 count];
  long long v3 = [a2 identifier];
  uint64_t v4 = [a2 externalIdentifierString];
  [a2 iOSLegacyIdentifier];
  sub_66D8();
  sub_66E4(&dword_0, v5, v6, "Found %ld containers associated with account (identifier: %{public}@ external identifier: %{public}@ legacy id = %d)", v7, v8, v9, v10, 2u);
}

void sub_10330()
{
  int v2 = 136446722;
  sub_6D74();
  sub_6D90(&dword_0, v0, v1, "%{public}s - ctError error: %d domain: (%d)", v2);
}

void sub_103A4()
{
  int v2 = 136446722;
  sub_6D74();
  sub_6D90(&dword_0, v0, v1, "%{public}s - ctError error: %d domain: (%d)", v2);
}

void sub_10418(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 familyMember];
  int v6 = 136446722;
  uint64_t v7 = "+[NCABTinkerContactsManagementStateManager managerForBuddyControllerDelegate:]";
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "%{public}s - familyMember mismatch; prior: %@, latest: %@",
    (uint8_t *)&v6,
    0x20u);
}

void sub_104D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10550(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_105C8()
{
  v1[0] = 136446466;
  sub_9C6C();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%{public}s - returning contactsCountStatus:%d", (uint8_t *)v1, 0x12u);
}

void sub_1064C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_106C4()
{
  v1[0] = 136446466;
  sub_9C6C();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%{public}s - unexpected _contactsManagementRequestState: %d; bailing.",
    (uint8_t *)v1,
    0x12u);
}

void sub_10748(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a2 + 40);
  int v4 = 136446722;
  uint64_t v5 = "-[NCABTinkerContactsManagementStateManager _updateContactsManagementState:error:]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  int v9 = v3;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}s - _enableContactsManagementForFamilyMember produced error: %{public}@; re-updating to state: %d",
    (uint8_t *)&v4,
    0x1Cu);
}

void sub_107E8(int *a1, uint64_t a2, os_log_t log)
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

void sub_10888(void *a1, NSObject *a2)
{
  int v3 = 136446466;
  int v4 = "-[NCABTinkerContactsManagementStateManager _enableContactsManagementForFamilyMember:request:completionHandler:]";
  __int16 v5 = 1024;
  unsigned int v6 = [a1 lastKnownContactsManagementState];
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}s - WARNING - attemping to enable contacts management from bad state: %d", (uint8_t *)&v3, 0x12u);
}

void sub_10928(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_109A0()
{
  v1[0] = 136446466;
  sub_D67C();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%{public}s - _fetchContactsManagementStateWithHoldWaitUIAndCompletionHandler error: %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_10A20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10A98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10B10(void *a1, NSObject *a2)
{
  int v3 = [a1 familyMember];
  int v4 = 136446466;
  __int16 v5 = "-[NCBSBridgeSetupController _checkContactsManagementAndEnqueueReleaseHold]";
  __int16 v6 = 2112;
  __int16 v7 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}s - !contactsManagementStateManager with self.familyMember: %@", (uint8_t *)&v4, 0x16u);
}

void sub_10BBC()
{
  v1[0] = 136446466;
  sub_D67C();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%{public}s - fetchContactsManagementStateWithCompletionHandler error: %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_10C3C(os_log_t log)
{
  int v1 = 136446466;
  int v2 = "+[NCBSBridgeSetupController _controllerClassFlowForContactsManagementState:priorFlow:]";
  __int16 v3 = 1024;
  int v4 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}s: %d; unexpected managementState; skipping",
    (uint8_t *)&v1,
    0x12u);
}

void sub_10CCC(os_log_t log)
{
  int v1 = 136446466;
  int v2 = "+[NCBSBridgeSetupController _controllerClassFlowForContactsManagementState:priorFlow:]";
  __int16 v3 = 1024;
  int v4 = 2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}s: %d; unexpected managementState; converting to prompt",
    (uint8_t *)&v1,
    0x12u);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

uint64_t CNAbstractMethodException()
{
  return _CNAbstractMethodException();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t NSStringFromBOOL()
{
  return _NSStringFromBOOL();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CTServerConnectionCopyCellularUsagePolicy()
{
  return __CTServerConnectionCopyCellularUsagePolicy();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return __CTServerConnectionCreateOnTargetQueue();
}

uint64_t _CTServerConnectionSetCellularUsagePolicy()
{
  return __CTServerConnectionSetCellularUsagePolicy();
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_exception_throw(id exception)
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

id objc_msgSend_MCIsManaged(void *a1, const char *a2, ...)
{
  return [a1 MCIsManaged];
}

id objc_msgSend__activeSatellitePhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 _activeSatellitePhoneNumber];
}

id objc_msgSend__checkContactsCountStatusNotYetSyncedTimedOut(void *a1, const char *a2, ...)
{
  return [a1 _checkContactsCountStatusNotYetSyncedTimedOut];
}

id objc_msgSend__checkContactsManagementAndEnqueueReleaseHold(void *a1, const char *a2, ...)
{
  return [a1 _checkContactsManagementAndEnqueueReleaseHold];
}

id objc_msgSend__contactsSyncEnabledWithNetworkAccess(void *a1, const char *a2, ...)
{
  return [a1 _contactsSyncEnabledWithNetworkAccess];
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

id objc_msgSend__setupGuardianHasContacts(void *a1, const char *a2, ...)
{
  return [a1 _setupGuardianHasContacts];
}

id objc_msgSend__shouldPromptForiCloudSync(void *a1, const char *a2, ...)
{
  return [a1 _shouldPromptForiCloudSync];
}

id objc_msgSend__startFetchingContactsManagementState(void *a1, const char *a2, ...)
{
  return [a1 _startFetchingContactsManagementState];
}

id objc_msgSend__waitOnContactsSyncWithRetries(void *a1, const char *a2, ...)
{
  return [a1 _waitOnContactsSyncWithRetries];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountProvider(void *a1, const char *a2, ...)
{
  return [a1 accountProvider];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_activePairingDevice(void *a1, const char *a2, ...)
{
  return [a1 activePairingDevice];
}

id objc_msgSend_activePairingDeviceSupportsContactsApp(void *a1, const char *a2, ...)
{
  return [a1 activePairingDeviceSupportsContactsApp];
}

id objc_msgSend_alloc(void *a1, const char *a2, ...)
{
  return [a1 alloc];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_autoEnableContactsManagement(void *a1, const char *a2, ...)
{
  return [a1 autoEnableContactsManagement];
}

id objc_msgSend_childAccounts(void *a1, const char *a2, ...)
{
  return [a1 childAccounts];
}

id objc_msgSend_cmsForRunningFlow(void *a1, const char *a2, ...)
{
  return [a1 cmsForRunningFlow];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return [a1 contactStore];
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

id objc_msgSend_copyWithDistinctIdentifier(void *a1, const char *a2, ...)
{
  return [a1 copyWithDistinctIdentifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_ctServerConnection(void *a1, const char *a2, ...)
{
  return [a1 ctServerConnection];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeys];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dsid(void *a1, const char *a2, ...)
{
  return [a1 dsid];
}

id objc_msgSend_enablingPrimaryiCloudAccountRequiresMergeFromLocal(void *a1, const char *a2, ...)
{
  return [a1 enablingPrimaryiCloudAccountRequiresMergeFromLocal];
}

id objc_msgSend_externalIdentifierString(void *a1, const char *a2, ...)
{
  return [a1 externalIdentifierString];
}

id objc_msgSend_familyMember(void *a1, const char *a2, ...)
{
  return [a1 familyMember];
}

id objc_msgSend_familyMemberContactsController(void *a1, const char *a2, ...)
{
  return [a1 familyMemberContactsController];
}

id objc_msgSend_familyMemberContactsStatusAtStartOfFlow(void *a1, const char *a2, ...)
{
  return [a1 familyMemberContactsStatusAtStartOfFlow];
}

id objc_msgSend_familyMemberFirstName(void *a1, const char *a2, ...)
{
  return [a1 familyMemberFirstName];
}

id objc_msgSend_familyMemberScopedContactStore(void *a1, const char *a2, ...)
{
  return [a1 familyMemberScopedContactStore];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstViewControllerForCurrentFlow(void *a1, const char *a2, ...)
{
  return [a1 firstViewControllerForCurrentFlow];
}

id objc_msgSend_guardianContactStore(void *a1, const char *a2, ...)
{
  return [a1 guardianContactStore];
}

id objc_msgSend_hasMeCard(void *a1, const char *a2, ...)
{
  return [a1 hasMeCard];
}

id objc_msgSend_iOSLegacyIdentifier(void *a1, const char *a2, ...)
{
  return [a1 iOSLegacyIdentifier];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_implementation(void *a1, const char *a2, ...)
{
  return [a1 implementation];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isLocalContainerEmpty(void *a1, const char *a2, ...)
{
  return [a1 isLocalContainerEmpty];
}

id objc_msgSend_isLocalSourceEmpty(void *a1, const char *a2, ...)
{
  return [a1 isLocalSourceEmpty];
}

id objc_msgSend_lastKnownContactsManagementState(void *a1, const char *a2, ...)
{
  return [a1 lastKnownContactsManagementState];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localContainer(void *a1, const char *a2, ...)
{
  return [a1 localContainer];
}

id objc_msgSend_localDeviceContactsCount(void *a1, const char *a2, ...)
{
  return [a1 localDeviceContactsCount];
}

id objc_msgSend_memberType(void *a1, const char *a2, ...)
{
  return [a1 memberType];
}

id objc_msgSend_miniFlowDelegate(void *a1, const char *a2, ...)
{
  return [a1 miniFlowDelegate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_networkAccessEnabledForContacts(void *a1, const char *a2, ...)
{
  return [a1 networkAccessEnabledForContacts];
}

id objc_msgSend_perform(void *a1, const char *a2, ...)
{
  return [a1 perform];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return [a1 phoneNumbers];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_primaryiCloudAccountCardDAVEnabled(void *a1, const char *a2, ...)
{
  return [a1 primaryiCloudAccountCardDAVEnabled];
}

id objc_msgSend_prohibitedPropertyKeys(void *a1, const char *a2, ...)
{
  return [a1 prohibitedPropertyKeys];
}

id objc_msgSend_promptedForiCloudSync(void *a1, const char *a2, ...)
{
  return [a1 promptedForiCloudSync];
}

id objc_msgSend_propertyKeysContainingSenstiveData(void *a1, const char *a2, ...)
{
  return [a1 propertyKeysContainingSenstiveData];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_runningFlow(void *a1, const char *a2, ...)
{
  return [a1 runningFlow];
}

id objc_msgSend_selectedCellularPlan(void *a1, const char *a2, ...)
{
  return [a1 selectedCellularPlan];
}

id objc_msgSend_setPrimaryiCloudAccountCardDAVEnabled(void *a1, const char *a2, ...)
{
  return [a1 setPrimaryiCloudAccountCardDAVEnabled];
}

id objc_msgSend_setupFlowUserInfo(void *a1, const char *a2, ...)
{
  return [a1 setupFlowUserInfo];
}

id objc_msgSend_setupGuardian(void *a1, const char *a2, ...)
{
  return [a1 setupGuardian];
}

id objc_msgSend_setupGuardianHasContactsToDonate(void *a1, const char *a2, ...)
{
  return [a1 setupGuardianHasContactsToDonate];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stManagementState(void *a1, const char *a2, ...)
{
  return [a1 stManagementState];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_topItem(void *a1, const char *a2, ...)
{
  return [a1 topItem];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}

id objc_msgSend_viewControllerForUpdatingContact_withPropertiesFromContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForUpdatingContact:withPropertiesFromContact:");
}