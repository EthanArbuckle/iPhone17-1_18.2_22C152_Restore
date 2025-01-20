void sub_4638(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t vars8;

  v4 = objc_alloc_init((Class)HKHealthStore);
  [v4 setSourceBundleIdentifier:@"com.apple.Health"];
  [v4 resume];
  v2 = [objc_alloc(*(Class *)(a1 + 32)) initWithHealthStore:v4];
  v3 = (void *)qword_165D8;
  qword_165D8 = (uint64_t)v2;
}

void sub_4854(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5 && [v5 count])
  {
    v7 = +[NSPredicate predicateWithFormat:@"type = %d", *(void *)(a1 + 48)];
    uint64_t v8 = *(void *)(a1 + 40);
    v9 = [v5 filteredArrayUsingPredicate:v7];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogQuery, OS_LOG_TYPE_ERROR)) {
      sub_A138();
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_4AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_4AD8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4AE8(uint64_t a1)
{
}

void sub_4AF0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogQuery, OS_LOG_TYPE_ERROR)) {
      sub_A1A4();
    }
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setGivenName:a2];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setFamilyName:v7];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_4D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_4DA0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_4EC4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id sub_56C8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 48);
  v4.receiver = *(id *)(a1 + 40);
  v4.super_class = (Class)HKHealthSettingsController;
  return objc_msgSendSuper2(&v4, "handleURL:withCompletion:", v1, v2);
}

int64_t sub_5F38(id a1, PSSpecifier *a2, PSSpecifier *a3)
{
  objc_super v4 = a3;
  id v5 = [(PSSpecifier *)a2 name];
  id v6 = [(PSSpecifier *)v4 name];

  id v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return (int64_t)v7;
}

void sub_6064(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_6088(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_6134;
    v5[3] = &unk_104C0;
    id v6 = v3;
    id v7 = WeakRetained;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
}

void sub_6134(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "setSharedHealthDataIdentifiers:");
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + OBJC_IVAR___PSListController__specifiers);
  if (v2)
  {
    id v3 = [v2 specifierForID:@"HealthSettingsTinkerProfileSpecifierID"];

    if (!v3)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      objc_super v4 = *(void **)(a1 + 40);
      [v4 addSharedDataSpecifiersWithIdentifiers:v5];
    }
  }
}

void sub_62CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_62F0(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_63A8;
    block[3] = &unk_10510;
    block[4] = WeakRetained;
    char v8 = a2;
    id v7 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t sub_63A8(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 184))
  {
    uint64_t v4 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 184);
    *(void *)(v5 + 184) = v4;

    id v7 = *(void **)(*(void *)(a1 + 32) + OBJC_IVAR___PSListController__specifiers);
    if (v7)
    {
      char v8 = [v7 specifierForID:@"HEALTH_RECORDS_ITEM"];

      if (!v8) {
        [*(id *)(a1 + 32) addHealthRecordsSpecifier:*(unsigned __int8 *)(a1 + 48)];
      }
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void sub_6AC8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_6B94;
    block[3] = &unk_10560;
    id v6 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v9 = v6;
    char v10 = *(unsigned char *)(a1 + 56);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
}

void sub_6B94(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  [v2 pushViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

void sub_7148(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_7164(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_7AC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7AE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _fetchMedicalIDData];
    id WeakRetained = v2;
  }
}

void sub_7DA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7DBC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (a2)
    {
      uint64_t v7 = [*(id *)(a1 + 32) parentViewController];
      [v7 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
    }
    else
    {
      _HKInitializeLogging();
      char v8 = HKLogDefault;
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
        sub_A3E8(a1, (uint64_t)v5, v8);
      }
    }
  }
}

void sub_7F18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_7F34(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_7FF0;
  v5[3] = &unk_10600;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_7FF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleFetchedMedicalIDData:*(void *)(a1 + 32)];
}

void sub_8FDC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9098;
  block[3] = &unk_10650;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_9098(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void sub_9290(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_92AC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      [WeakRetained showViewController:*(void *)(a1 + 32) sender:0];
    }
    else
    {
      _HKInitializeLogging();
      char v8 = HKLogDefault;
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR)) {
        sub_A474(a1, (uint64_t)v5, v8);
      }
    }
  }
}

id HKHealthSettingsLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:v1 value:&stru_10A60 table:0];

  return v3;
}

id HKHealthSettingsSpecifiersLocalizedString(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:v1 value:&stru_10A60 table:@"HealthSettingsSpecifiers"];

  return v3;
}

uint64_t static ProfileCharacteristicsViewController.makeWithSharedDiskHealthExperienceStore(healthStore:)(void *a1)
{
  sub_A510();
  id v2 = a1;
  sub_A500();
  id v3 = objc_allocWithZone((Class)sub_A530());
  return sub_A520();
}

void sub_A138()
{
  sub_4EAC();
  sub_4EC4(&dword_0, v0, v1, "%{public}@ Failed to fetch profiles from HKProfileStore, Error: %{public}@");
}

void sub_A1A4()
{
  sub_4EAC();
  sub_4EC4(&dword_0, v0, v1, "%{public}@ Failed to fetch name for profile, Error: %{public}@");
}

void sub_A210(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 specifiers];
  sub_7164(&dword_0, v5, v6, "HKHealthSettingsController is expecting to insert SHARED_DATA_GROUP_TITLE after SOURCES_ITEM, however the latter is not currently present in self.specifiers. Have: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_A2A8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 specifiers];
  sub_7164(&dword_0, v5, v6, "HKHealthSettingsController is expecting to insert HEALTH_RECORDS_ITEM after SOURCES_ITEM, however the latter is not currently present in self.specifiers. Have: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_A340(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A378(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A3B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A3E8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@: Authentication failed: %{public}@.", (uint8_t *)&v4, 0x16u);
}

void sub_A474(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@: Authentication failed: %{public}@.", (uint8_t *)&v4, 0x16u);
}

uint64_t sub_A500()
{
  return static DiskHealthExperienceStore.shared.getter();
}

uint64_t sub_A510()
{
  return type metadata accessor for DiskHealthExperienceStore();
}

uint64_t sub_A520()
{
  return ProfileCharacteristicsWithAutoAvatarImageViewController.init(healthStore:healthExperienceStore:)();
}

uint64_t sub_A530()
{
  return type metadata accessor for ProfileCharacteristicsWithAutoAvatarImageViewController();
}

uint64_t GSSystemRootDirectory()
{
  return _GSSystemRootDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_msgSend__currentChildViewController(void *a1, const char *a2, ...)
{
  return [a1 _currentChildViewController];
}

id objc_msgSend__fetchMedicalIDData(void *a1, const char *a2, ...)
{
  return [a1 _fetchMedicalIDData];
}

id objc_msgSend__medicalIDData(void *a1, const char *a2, ...)
{
  return [a1 _medicalIDData];
}

id objc_msgSend__medicalIDLoaded(void *a1, const char *a2, ...)
{
  return [a1 _medicalIDLoaded];
}

id objc_msgSend__submitScribeAnalyticEvent(void *a1, const char *a2, ...)
{
  return [a1 _submitScribeAnalyticEvent];
}

id objc_msgSend__updateChildViewController(void *a1, const char *a2, ...)
{
  return [a1 _updateChildViewController];
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return [a1 actionButton];
}

id objc_msgSend_appPolicy(void *a1, const char *a2, ...)
{
  return [a1 appPolicy];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_callToActionLabel(void *a1, const char *a2, ...)
{
  return [a1 callToActionLabel];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultReuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 defaultReuseIdentifier];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_externalSourceAssistantService(void *a1, const char *a2, ...)
{
  return [a1 externalSourceAssistantService];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_fetchMedicalIDDataSynchronously(void *a1, const char *a2, ...)
{
  return [a1 fetchMedicalIDDataSynchronously];
}

id objc_msgSend_fetchSharedHealthData(void *a1, const char *a2, ...)
{
  return [a1 fetchSharedHealthData];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getNameComponents(void *a1, const char *a2, ...)
{
  return [a1 getNameComponents];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return [a1 givenName];
}

id objc_msgSend_hasPairedWatch(void *a1, const char *a2, ...)
{
  return [a1 hasPairedWatch];
}

id objc_msgSend_hasStoredRegistrant(void *a1, const char *a2, ...)
{
  return [a1 hasStoredRegistrant];
}

id objc_msgSend_healthAppHiddenOrNotInstalled(void *a1, const char *a2, ...)
{
  return [a1 healthAppHiddenOrNotInstalled];
}

id objc_msgSend_healthSettingsProfile(void *a1, const char *a2, ...)
{
  return [a1 healthSettingsProfile];
}

id objc_msgSend_healthSettingsSourcesHostName(void *a1, const char *a2, ...)
{
  return [a1 healthSettingsSourcesHostName];
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return [a1 healthStore];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isEditEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEditEnabled];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return [a1 isEmpty];
}

id objc_msgSend_isHealthChecklistAvailable(void *a1, const char *a2, ...)
{
  return [a1 isHealthChecklistAvailable];
}

id objc_msgSend_isMedicalIDAvailable(void *a1, const char *a2, ...)
{
  return [a1 isMedicalIDAvailable];
}

id objc_msgSend_isOrganDonationRegistrationAvailable(void *a1, const char *a2, ...)
{
  return [a1 isOrganDonationRegistrationAvailable];
}

id objc_msgSend_isPrimaryProfile(void *a1, const char *a2, ...)
{
  return [a1 isPrimaryProfile];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_medicalIDV2(void *a1, const char *a2, ...)
{
  return [a1 medicalIDV2];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nameComponents(void *a1, const char *a2, ...)
{
  return [a1 nameComponents];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return [a1 principalClass];
}

id objc_msgSend_profileIdentifier(void *a1, const char *a2, ...)
{
  return [a1 profileIdentifier];
}

id objc_msgSend_profileStore(void *a1, const char *a2, ...)
{
  return [a1 profileStore];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_settingsNavigationDonatingDelegate(void *a1, const char *a2, ...)
{
  return [a1 settingsNavigationDonatingDelegate];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedGuard(void *a1, const char *a2, ...)
{
  return [a1 sharedGuard];
}

id objc_msgSend_sharedProfile(void *a1, const char *a2, ...)
{
  return [a1 sharedProfile];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_standardConfiguration(void *a1, const char *a2, ...)
{
  return [a1 standardConfiguration];
}

id objc_msgSend_systemGroupedBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemGroupedBackgroundColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}