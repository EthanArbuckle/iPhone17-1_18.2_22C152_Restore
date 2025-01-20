void sub_1354(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_13EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1484(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_154C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_182C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1C1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      sub_2CC8(v9, (uint64_t)v6, (uint64_t)&v10);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
  else
  {
    [*(id *)(a1 + 32) addObjectsFromArray:v5];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_1CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_26FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_2748(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = a2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (v5)
  {
    v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = [*(id *)(a1 + 40) identifier];
      v13 = objc_msgSend(v6, "ef_publicDescription");
      int v14 = 138412802;
      id v15 = v11;
      __int16 v16 = 2112;
      v17 = v12;
      __int16 v18 = 2114;
      v19 = v13;
      _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "%@: failed to save account %@: %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_2894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_2B10(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  if (*(unsigned char *)(v7 + 24)) {
    char v8 = a2;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)(v7 + 24) = v8;
  if (v5)
  {
    v9 = MFLogGeneral();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = [*(id *)(a1 + 40) identifier];
      v13 = objc_msgSend(v6, "ef_publicDescription");
      int v14 = 138412802;
      id v15 = v11;
      __int16 v16 = 2112;
      v17 = v12;
      __int16 v18 = 2114;
      v19 = v13;
      _os_log_error_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "%@: failed to remove account %@: %{public}@", (uint8_t *)&v14, 0x20u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_2C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_2CB0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_2CC8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_2CB0((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%@: failed to get accounts (%@)", v4, 0x16u);
}

uint64_t MFLogGeneral()
{
  return _MFLogGeneral();
}

uint64_t MFMobileMailContainerPath()
{
  return _MFMobileMailContainerPath();
}

uint64_t MFMobileMailPreferenceDomain()
{
  return _MFMobileMailPreferenceDomain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return __CFPreferencesCopyValueWithContainer();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return __CFPreferencesSetValueWithContainer();
}

uint64_t _CFPreferencesSynchronizeWithContainer()
{
  return __CFPreferencesSynchronizeWithContainer();
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_accountTypeString(void *a1, const char *a2, ...)
{
  return [a1 accountTypeString];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentVersion(void *a1, const char *a2, ...)
{
  return [a1 currentVersion];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_didMigrateBackupFromDifferentDevice(void *a1, const char *a2, ...)
{
  return [a1 didMigrateBackupFromDifferentDevice];
}

id objc_msgSend_didRestoreFromCloudBackup(void *a1, const char *a2, ...)
{
  return [a1 didRestoreFromCloudBackup];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_removeCertificateIsTrustedFlag(void *a1, const char *a2, ...)
{
  return [a1 removeCertificateIsTrustedFlag];
}

id objc_msgSend_removeSMTPAccountsThatShouldBeDynamic(void *a1, const char *a2, ...)
{
  return [a1 removeSMTPAccountsThatShouldBeDynamic];
}

id objc_msgSend_setAOLAccountProperties(void *a1, const char *a2, ...)
{
  return [a1 setAOLAccountProperties];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  unsigned char v26[128];

  v4 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 1;
  os_log_t v5 = dispatch_semaphore_create(0);
  __int16 v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        accountStore = self->_accountStore;
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_2B10;
        v15[3] = &unk_4278;
        v17 = &v22;
        v15[4] = self;
        v15[5] = v9;
        id v11 = v5;
        __int16 v16 = v11;
        [(ACAccountStore *)accountStore removeAccount:v9 withCompletionHandler:v15];
        dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      }
      id v6 = [obj countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v6);
  }

  v12 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v22, 8);

  return v12;
}

- (void).cxx_destruct
{
}

@end