id sub_1774(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_180C(uint64_t a1)
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_19D8;
  v22 = sub_19E8;
  id v23 = 0;
  if ([*(id *)(a1 + 32) count] == (char *)&dword_0 + 1)
  {
    v2 = [*(id *)(a1 + 32) firstObject];
    v3 = [v2 application];
    v4 = [v3 bundleIdentifier];
    v5 = [v3 localizedName];
    v6 = *(void **)(*(void *)(a1 + 40) + OBJC_IVAR___PSListController__specifiers);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_19F0;
    v12[3] = &unk_41E0;
    id v7 = v4;
    id v13 = v7;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 40);
    id v14 = v8;
    uint64_t v15 = v9;
    id v10 = v2;
    id v16 = v10;
    v17 = &v18;
    [v6 enumerateObjectsUsingBlock:v12];
  }
  v11 = *(void **)(a1 + 40);
  if (v19[5]) {
    objc_msgSend(v11, "reloadSpecifier:");
  }
  else {
    [v11 reloadSpecifiers];
  }
  _Block_object_dispose(&v18, 8);
}

void sub_19B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_19D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_19E8(uint64_t a1)
{
}

void sub_19F0(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = (void *)a1[4];
  uint64_t v9 = [v7 identifier];
  if ([v8 isEqualToString:v9])
  {
    id v10 = (void *)a1[5];
    v11 = [v7 name];
    LODWORD(v10) = [v10 isEqualToString:v11];

    if (v10)
    {
      v12 = cslprf_settings_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = a1[4];
        uint64_t v13 = a1[5];
        int v15 = 138412802;
        uint64_t v16 = v13;
        __int16 v17 = 2112;
        uint64_t v18 = v14;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "%@:%@ changed reloading specifier %@", (uint8_t *)&v15, 0x20u);
      }

      [*(id *)(a1[6] + 192) updateSpecifier:v7 withSettings:a1[7]];
      objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {
  }
}

id sub_1BD0(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_1C44(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

int64_t sub_1F54(id a1, CSLPRFAppBacklightPrivacySettings *a2, CSLPRFAppBacklightPrivacySettings *a3)
{
  v4 = a3;
  v5 = [(CSLPRFAppBacklightPrivacySettings *)a2 application];
  v6 = [(CSLPRFAppBacklightPrivacySettings *)v4 application];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_28D0(uint64_t a1, NSObject *a2)
{
  v3 = [*(id *)(a1 + OBJC_IVAR___PSViewController__specifier) propertyForKey:@"CSLPRFAppBacklightPrivacyType"];
  int v4 = 138543362;
  v5 = v3;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Got unexpected privacy type \"%{public}@\"", (uint8_t *)&v4, 0xCu);
}

uint64_t BSDispatchMain()
{
  return _BSDispatchMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t cslprf_settings_log()
{
  return _cslprf_settings_log();
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

id objc_msgSend__cachePrivacyType(void *a1, const char *a2, ...)
{
  return [a1 _cachePrivacyType];
}

id objc_msgSend__loadSettings(void *a1, const char *a2, ...)
{
  return [a1 _loadSettings];
}

id objc_msgSend__phoneAppSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _phoneAppSpecifiers];
}

id objc_msgSend__watchAppSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _watchAppSpecifiers];
}

id objc_msgSend_allApplicationSettings(void *a1, const char *a2, ...)
{
  return [a1 allApplicationSettings];
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return [a1 application];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_globalSettings(void *a1, const char *a2, ...)
{
  return [a1 globalSettings];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_privacyDuringAlwaysOnForApp(void *a1, const char *a2, ...)
{
  return [a1 privacyDuringAlwaysOnForApp];
}

id objc_msgSend_privacyDuringAlwaysOnForNotification(void *a1, const char *a2, ...)
{
  return [a1 privacyDuringAlwaysOnForNotification];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_supportsAlwaysOnDisplay(void *a1, const char *a2, ...)
{
  return [a1 supportsAlwaysOnDisplay];
}

id objc_msgSend_updateSpecifier_withSettings_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSpecifier:withSettings:");
}