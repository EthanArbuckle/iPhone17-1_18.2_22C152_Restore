uint64_t sub_4444(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4454(uint64_t a1)
{
}

void sub_445C(uint64_t a1, void *a2)
{
}

void sub_446C(id a1, NSURL *a2, NSError *a3)
{
  v3 = a3;
  v4 = brc_bread_crumbs();
  v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_62E4((uint64_t)v3);
  }
}

void sub_57C8(id a1)
{
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("account_queue", v1);

  v3 = (void *)qword_C720;
  qword_C720 = (uint64_t)v2;
}

uint64_t sub_5850(uint64_t a1)
{
  return _BRSetMigrationStatusForDSIDAndUpdateAccount(*(void *)(a1 + 32), 2, 0);
}

void sub_5860(id a1, NSError *a2)
{
  dispatch_queue_t v2 = a2;
  v3 = brc_bread_crumbs();
  v4 = brc_default_log();
  if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
    sub_6730((uint64_t)v2);
  }
}

void sub_58E0(id a1, NSError *a2)
{
  dispatch_queue_t v2 = a2;
  if (v2)
  {
    v3 = brc_bread_crumbs();
    v4 = brc_default_log();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u)) {
      sub_6730((uint64_t)v2);
    }
  }
  else
  {
    v3 = brc_bread_crumbs();
    v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_67A0((uint64_t)v3, v4);
    }
  }
}

void sub_59A8(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_5B2C;
  v10[3] = &unk_82C0;
  id v11 = v2;
  [v11 createAccountWithACAccountID:v3 dsid:v4 reply:v10];
  v5 = [*(id *)(a1 + 32) result];
  LOBYTE(v4) = [v5 BOOLValue];

  if ((v4 & 1) == 0)
  {
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      v9 = [*(id *)(a1 + 32) error];
      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_0, v7, (os_log_type_t)0x90u, "[ERROR] log in error for %@: %@%@", buf, 0x20u);
    }
  }
}

id sub_5B2C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 == 0 error:a2];
}

void sub_5B40(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_5CBC;
  v10[3] = &unk_82C0;
  id v11 = v2;
  [v11 logoutAccountWithACAccountID:v3 reply:v10];
  uint64_t v4 = [*(id *)(a1 + 32) result];
  unsigned __int8 v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    v6 = brc_bread_crumbs();
    v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      v9 = [*(id *)(a1 + 32) error];
      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_0, v7, (os_log_type_t)0x90u, "[ERROR] log out error for %@: %@%@", buf, 0x20u);
    }
  }
}

id sub_5CBC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 == 0 error:a2];
}

void sub_5CD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = brc_bread_crumbs();
    unsigned __int8 v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Got error %@ when verified account loaded%@", (uint8_t *)&v6, 0x16u);
    }

    [*(id *)(a1 + 32) isCloudDocsUnsupported:*(void *)(a1 + 40) inStore:*(void *)(a1 + 48) showUserNotification:0];
  }
}

id sub_5DC8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 == 0 error:a2];
}

void sub_5DDC(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_5F58;
  v10[3] = &unk_82C0;
  id v11 = v2;
  [v11 updateAccountDisplayName:v3 reply:v10];
  uint64_t v4 = [*(id *)(a1 + 32) result];
  unsigned __int8 v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0)
  {
    int v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      v9 = [*(id *)(a1 + 32) error];
      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      v15 = v9;
      __int16 v16 = 2112;
      v17 = v6;
      _os_log_error_impl(&dword_0, v7, (os_log_type_t)0x90u, "[ERROR] log in error for %@: %@%@", buf, 0x20u);
    }
  }
}

id sub_5F58(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 == 0 error:a2];
}

id sub_5F6C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setBoolResult:a2 == 0 error:a2];
}

void sub_5F90(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_5FC8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, (os_log_type_t)0x90u, a4, (uint8_t *)va, 0x16u);
}

void sub_5FE8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x16u);
}

void sub_6008(char a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  if (qword_C740 != -1) {
    dispatch_once(&qword_C740, &stru_8358);
  }
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_6188;
  v8[3] = &unk_8380;
  v8[4] = &v10;
  char v9 = a1;
  dispatch_sync((dispatch_queue_t)qword_C738, v8);
  a4[1] = a2;
  a4[2] = 0;
  *a4 = v11[3];
  *((_DWORD *)a4 + 4) = a3;
  _Block_object_dispose(&v10, 8);
}

void sub_6100(id a1)
{
  uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("create-log-section", v1);

  uint64_t v3 = (void *)qword_C738;
  qword_C738 = (uint64_t)v2;
}

uint64_t sub_6188(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = qword_C730 + 1;
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v2 = *(void *)(v1 + 24);
  if (*(unsigned char *)(result + 40) != ((v2 & 1) == 0))
  {
    *(void *)(v1 + 24) = v2 + 1;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  qword_C730 = v2;
  return result;
}

void sub_61DC(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v1 = *a1;
    if (*a1)
    {
      uint64_t v2 = brc_bread_crumbs();
      uint64_t v3 = brc_default_log();
      uint64_t v4 = v3;
      if (v1)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          sub_6818((uint64_t)v2, v1, v4);
        }
      }
      else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v5 = 134218242;
        uint64_t v6 = v1;
        __int16 v7 = 2112;
        uint64_t v8 = v2;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "[INFO] ┗%llx %@", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

void sub_62E4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  sub_5F80();
  sub_5F90(&dword_0, v1, v2, "[DEBUG] Saved account with error: %@%@", (void)v3, DWORD2(v3));
}

void sub_6354(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  sub_5F80();
  sub_5F90(&dword_0, v1, v2, "[DEBUG] ┏%llx deleting migration default%@", (void)v3, DWORD2(v3));
}

void sub_63C8(void *a1)
{
  uint64_t v1 = [a1 error];
  sub_5FB0();
  sub_5FE8(&dword_0, v2, v3, "[ERROR] userVerifiedTermsWithReply error: %@%@", v4, v5, v6, v7, v8);
}

void sub_6458(void *a1)
{
  uint64_t v1 = [a1 error];
  sub_5FB0();
  sub_5FE8(&dword_0, v2, v3, "[ERROR] Failed to invalidate account cache: %@%@", v4, v5, v6, v7, v8);
}

void sub_64E8(char a1)
{
  CFStringRef v1 = @"enabled";
  if ((a1 & 1) == 0) {
    CFStringRef v1 = @"disabled";
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  sub_5F80();
  sub_5F90(&dword_0, v2, v3, "[DEBUG] cellular is now %@ for D&D%@", (void)v4, DWORD2(v4));
}

void sub_6570(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  sub_5F80();
  sub_5F90(&dword_0, v1, v2, "[DEBUG] ┏%llx jetsaming apps%@", (void)v3, DWORD2(v3));
}

void sub_65E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] account save failed: ignoring%@", (uint8_t *)&v2, 0xCu);
}

void sub_665C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = [a1 accountType];
  uint64_t v7 = [v6 identifier];
  int v8 = 138412802;
  char v9 = a1;
  __int16 v10 = 2112;
  id v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring notification for non-iCloud account (%@, identifier: %@)%@", (uint8_t *)&v8, 0x20u);
}

void sub_6730(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  sub_5F80();
  sub_5FC8(&dword_0, v1, v2, "[ERROR] can't jetsam apps: %@%@", (void)v3, DWORD2(v3));
}

void sub_67A0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] jetsam completed%@", (uint8_t *)&v2, 0xCu);
}

void sub_6818(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┗%llx %@", (uint8_t *)&v3, 0x16u);
}

uint64_t BRNotifyNameForAccountDidStartUsingUbiquityNotification()
{
  return _BRNotifyNameForAccountDidStartUsingUbiquityNotification();
}

uint64_t BRPostAccountTokenChangedNotification()
{
  return _BRPostAccountTokenChangedNotification();
}

uint64_t BRUnsetMigrationStatusForDSIDInPref()
{
  return _BRUnsetMigrationStatusForDSIDInPref();
}

void _Block_object_dispose(const void *a1, const int a2)
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

uint64_t brc_bread_crumbs()
{
  return _brc_bread_crumbs();
}

uint64_t brc_default_log()
{
  return _brc_default_log();
}

uint64_t brc_notify_post()
{
  return _brc_notify_post();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return [a1 accountDescription];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_defaultConnection(void *a1, const char *a2, ...)
{
  return [a1 defaultConnection];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isDataSeparatedAccount(void *a1, const char *a2, ...)
{
  return [a1 isDataSeparatedAccount];
}

id objc_msgSend_newSyncProxy(void *a1, const char *a2, ...)
{
  return [a1 newSyncProxy];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_secondaryConnection(void *a1, const char *a2, ...)
{
  return [a1 secondaryConnection];
}

id objc_msgSend_verifyAccountLoaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "verifyAccountLoaded:");
}