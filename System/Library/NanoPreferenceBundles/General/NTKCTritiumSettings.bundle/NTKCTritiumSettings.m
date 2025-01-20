uint64_t sub_39A4(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  NTKTritiumAppInfo *v10;
  id v11;
  void *v12;
  unsigned int v13;
  BOOL v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void v21[4];
  id v22;
  NTKTritiumAppInfo *v23;
  void block[4];
  id v25;
  NTKTritiumAppInfo *v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (!v5)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_3D64;
      v21[3] = &unk_8308;
      v23 = (NTKTritiumAppInfo *)a1[5];
      v22 = a1[4];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);

      v9 = 0;
      v10 = v23;
      goto LABEL_14;
    }
    v11 = a1[6];
    v12 = [v5 bundleIdentifier];
    v13 = [v11 _isApplicationWithBundleIDHiddenByPolicy:v12];

    _NTKLoggingObjectForDomain();
    v10 = (NTKTritiumAppInfo *)objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(&v10->super, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v14)
      {
        v15 = a1[6];
        *(_DWORD *)buf = 138412546;
        v28 = v15;
        v29 = 2112;
        v30 = v5;
        v9 = 1;
        _os_log_impl(&dword_0, &v10->super, OS_LOG_TYPE_INFO, "%@ enumerateInstalledApplicationsOnPairedDevice:withBlock: app: %@ is hidden by policy", buf, 0x16u);
        goto LABEL_14;
      }
    }
    else
    {
      if (v14)
      {
        v16 = a1[6];
        *(_DWORD *)buf = 138412546;
        v28 = v16;
        v29 = 2112;
        v30 = v5;
        _os_log_impl(&dword_0, &v10->super, OS_LOG_TYPE_INFO, "%@ enumerateInstalledApplicationsOnPairedDevice:withBlock: app: %@", buf, 0x16u);
      }

      v10 = objc_alloc_init(NTKTritiumAppInfo);
      v17 = [v5 bundleIdentifier];
      [(NTKTritiumAppInfo *)v10 setAppBundleID:v17];

      v18 = [a1[6] displayNameForWatchApp:v5];
      [(NTKTritiumAppInfo *)v10 setLocalizedName:v18];

      v19 = [v5 watchKitAppExtensionBundleID];
      [(NTKTritiumAppInfo *)v10 setWatchkitExtensionID:v19];

      [a1[4] addObject:v10];
    }
    v9 = 1;
    goto LABEL_14;
  }
  v7 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = a1[6];
    *(_DWORD *)buf = 138412546;
    v28 = v8;
    v29 = 2112;
    v30 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "%@ enumerateInstalledApplicationsOnPairedDevice:withBlock: error: %@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3D0C;
  block[3] = &unk_8308;
  v26 = (NTKTritiumAppInfo *)a1[5];
  v25 = a1[4];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  v9 = 0;
  v10 = v26;
LABEL_14:

  return v9;
}

void sub_3D0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_3D64(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

id sub_41F0(uint64_t a1, void *a2)
{
  v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "NTKTritiumComplicationSpecifierProvider: Received NTKTritiumSettingsDidChangeNotification", v5, 2u);
  }

  return [a2 updateSpecifiers];
}

void sub_433C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appInfosForAppsWithComplications];
  id v3 = [v2 mutableCopy];
  [v3 sortUsingComparator:&stru_8370];
  v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  if ([v3 count])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = +[NSNull null];
      [v4 addObject:v6];

      ++v5;
    }
    while ((unint64_t)[v3 count] > v5);
  }
  id v7 = [v3 count];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_45B0;
  block[3] = &unk_8398;
  id v8 = v4;
  uint64_t v9 = *(void *)(a1 + 32);
  id v15 = v8;
  uint64_t v16 = v9;
  id v17 = v3;
  id v10 = v3;
  dispatch_apply((size_t)v7, 0, block);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_4634;
  v12[3] = &unk_83C0;
  v12[4] = *(void *)(a1 + 32);
  id v13 = v8;
  id v11 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

int64_t sub_4510(id a1, NTKTritiumSettingsListControllerAppInfo *a2, NTKTritiumSettingsListControllerAppInfo *a3)
{
  v4 = a3;
  unint64_t v5 = [(NTKTritiumSettingsListControllerAppInfo *)a2 info];
  v6 = [v5 localizedName];
  id v7 = [(NTKTritiumSettingsListControllerAppInfo *)v4 info];

  id v8 = [v7 localizedName];
  id v9 = [v6 compare:v8 options:1];

  return (int64_t)v9;
}

void sub_45B0(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 40);
  id v6 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a2];
  unint64_t v5 = [v4 _createSpecifierForApp:v6];
  [*(id *)(a1 + 32) setObject:v5 atIndexedSubscript:a2];
}

void sub_4634(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 specifiersUpdated:*(void *)(a1 + 40)];
}

void sub_4820(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v9 = [v8 appBundleID];
        uint64_t v10 = [v8 watchkitExtensionID];
        id v11 = (void *)v10;
        if (v10) {
          v12 = (void *)v10;
        }
        else {
          v12 = v9;
        }
        id v13 = v12;

        if (([*(id *)(a1 + 32) vendorExistsWithClientIdentifier:v13 appBundleIdentifier:v9] & 1) != 0|| (objc_msgSend(*(id *)(a1 + 40), "vendorExistsWithContainerBundleIdentifier:", v9) & 1) != 0|| (objc_msgSend(*(id *)(a1 + 48), "bundleComplicationExistsForAppBundleIdentifier:", v9) & 1) != 0|| objc_msgSend(*(id *)(a1 + 56), "containsObject:", v9))
        {
          v14 = objc_alloc_init(NTKTritiumSettingsListControllerAppInfo);
          [(NTKTritiumSettingsListControllerAppInfo *)v14 setInfo:v8];
          [*(id *)(a1 + 64) addObject:v14];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void sub_4CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_4E68(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_CA58)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_4FAC;
    v3[4] = &unk_8470;
    v3[5] = v3;
    long long v4 = off_8458;
    uint64_t v5 = 0;
    qword_CA58 = _sl_dlopen();
    if (!qword_CA58)
    {
      abort_report_np();
LABEL_8:
      sub_5BE8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("CSLPRFAppSwitchCell");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_CA50 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_4FAC()
{
  uint64_t result = _sl_dlopen();
  qword_CA58 = result;
  return result;
}

id sub_5150(uint64_t a1, void *a2)
{
  id v3 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "NTKTritiumSettingsListController: Received NTKTritiumSettingsDidChangeNotification", v5, 2u);
  }

  return [a2 reloadSpecifiers];
}

void sub_5BE8()
{
}

uint64_t BPSIsNewsAllowed()
{
  return _BPSIsNewsAllowed();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t NTKComplicationTypesToBundleIDMappingForDevice()
{
  return _NTKComplicationTypesToBundleIDMappingForDevice();
}

uint64_t NTKSharedRemoteComplicationProvider()
{
  return _NTKSharedRemoteComplicationProvider();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
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

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void free(void *a1)
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_allBundleIDsPrivateInTritium(void *a1, const char *a2, ...)
{
  return [a1 allBundleIDsPrivateInTritium];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_appBundleID(void *a1, const char *a2, ...)
{
  return [a1 appBundleID];
}

id objc_msgSend_appInfosForAppsWithComplications(void *a1, const char *a2, ...)
{
  return [a1 appInfosForAppsWithComplications];
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return [a1 applicationName];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIDsForLegacyComplications(void *a1, const char *a2, ...)
{
  return [a1 bundleIDsForLegacyComplications];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createAppGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 createAppGroupSpecifier];
}

id objc_msgSend_createSiriGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 createSiriGroupSpecifier];
}

id objc_msgSend_createSiriToggleSpecifier(void *a1, const char *a2, ...)
{
  return [a1 createSiriToggleSpecifier];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return [a1 reload];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedDeviceConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_specifierGetter(void *a1, const char *a2, ...)
{
  return [a1 specifierGetter];
}

id objc_msgSend_specifierSetter(void *a1, const char *a2, ...)
{
  return [a1 specifierSetter];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_updateSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 updateSpecifiers];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_watchKitAppExtensionBundleID(void *a1, const char *a2, ...)
{
  return [a1 watchKitAppExtensionBundleID];
}

id objc_msgSend_watchkitExtensionID(void *a1, const char *a2, ...)
{
  return [a1 watchkitExtensionID];
}