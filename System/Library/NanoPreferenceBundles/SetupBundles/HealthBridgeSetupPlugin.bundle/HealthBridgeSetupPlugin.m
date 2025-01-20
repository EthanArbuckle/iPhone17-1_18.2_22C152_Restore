void sub_2BB4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  id v6;
  uint64_t v7;
  void *v8;
  HKBridgeSetupEmergencyContactsController *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  char v16;
  int v17;
  uint64_t v18;

  v3 = a2;
  if (v3)
  {
    v4 = [*(id *)(a1 + 32) delegate];
    v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
      v6 = [v3 copy];
      v7 = *(void *)(a1 + 32);
      v8 = *(void **)(v7 + 8);
      *(void *)(v7 + 8) = v6;

      v9 = [[HKBridgeSetupEmergencyContactsController alloc] initWithConfiguration:*(void *)(*(void *)(a1 + 32) + 8)];
      v10 = *(void *)(a1 + 32);
      v11 = *(void **)(v10 + 24);
      *(void *)(v10 + 24) = v9;

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "setMiniFlowDelegate:");
      v12 = [*(id *)(a1 + 32) delegate];
      [v12 buddyControllerReleaseHold:*(void *)(a1 + 32)];
LABEL_8:
    }
  }
  else
  {
    _HKInitializeLogging();
    v13 = HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(void *)(a1 + 32);
      v17 = 138543362;
      v18 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping Emergency Contacts and Medical ID setup in Tinker buddy as there is no health profile on device", (uint8_t *)&v17, 0xCu);
    }
    v15 = [*(id *)(a1 + 32) delegate];
    v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v12 = [*(id *)(a1 + 32) delegate];
      [v12 buddyControllerReleaseHoldAndSkip:*(void *)(a1 + 32)];
      goto LABEL_8;
    }
  }
}

void sub_2E18(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2F14;
  block[3] = &unk_C310;
  id v13 = a3;
  id v14 = a4;
  v8 = *(void **)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v7;
  id v17 = v8;
  id v9 = v7;
  id v10 = v14;
  id v11 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_2F14(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v7 = objc_alloc_init((Class)HKHealthStore);
    [v7 setProfileIdentifier:*(void *)(a1 + 32)];
    [v7 resume];
    v2 = [*(id *)(a1 + 48) delegate];
    v3 = [v2 setupFlowUserInfo];
    v4 = [v3 objectForKeyedSubscript:BPSPairingFlowFamilyMember];

    v5 = [[_HKBridgeSetupConfiguration alloc] initWithFamilyMember:v4 device:*(void *)(a1 + 56) healthStore:v7];
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    if (*(void *)(a1 + 40))
    {
      _HKInitializeLogging();
      v6 = (void *)HKLogMedicalID;
      if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
        sub_6688(a1, v6, (uint64_t *)(a1 + 40));
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

uint64_t sub_31DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, a3);
}

void sub_359C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_36AC;
    v10[3] = &unk_C3B0;
    v10[4] = *(void *)(a1 + 32);
    id v11 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
  else
  {
    _HKInitializeLogging();
    v8 = HKLogMedicalID;
    if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
      sub_6754((uint64_t)v7, v8);
    }
    id v9 = [*(id *)(a1 + 32) delegate];
    [v9 buddyControllerReleaseHold:*(void *)(a1 + 32)];
  }
}

void sub_36AC(uint64_t a1)
{
  v1 = (uint64_t *)(a1 + 32);
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 0;
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = *v1;
    id v4 = v2;
    id v5 = *(void **)(v3 + 16);
    *(void *)(v3 + 16) = v4;
  }
  else
  {
    id v6 = objc_alloc_init((Class)_HKMedicalIDData);
    id v5 = *(void **)(*v1 + 16);
    *(void *)(*v1 + 16) = v6;
  }

  id v7 = objc_alloc_init((Class)NSPersonNameComponents);
  v8 = [*(id *)(*v1 + 48) familyMember];
  id v9 = [v8 firstName];
  [v7 setGivenName:v9];

  id v10 = [*(id *)(*v1 + 48) familyMember];
  id v11 = [v10 lastName];
  [v7 setFamilyName:v11];

  v12 = +[NSPersonNameComponentsFormatter localizedStringFromPersonNameComponents:v7 style:2 options:0];
  [*(id *)(*v1 + 16) setName:v12];

  id v13 = *(void **)(*v1 + 8);
  id v19 = 0;
  id v14 = [v13 dateOfBirthComponentsWithError:&v19];
  id v15 = v19;
  if (v14)
  {
    [*(id *)(*v1 + 16) setGregorianBirthday:v14];
  }
  else
  {
    _HKInitializeLogging();
    id v16 = HKLogDatabase;
    if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_ERROR)) {
      sub_67CC(v1, (uint64_t)v15, v16);
    }
  }
  id v17 = [*(id *)(*v1 + 48) familyMember];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_38EC;
  v18[3] = &unk_C388;
  v18[4] = *v1;
  [v17 fetchFamilyPhotoWithRequestedSize:1 fallbackToLocalAddressBook:1 completionHandler:v18];
}

void sub_38EC(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (!v6)
  {
    _HKInitializeLogging();
    v8 = HKLogMedicalID;
    if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR))
    {
      sub_6858((uint64_t)v7, v8);
      if (v7) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  if (!v7) {
LABEL_4:
  }
    [*(id *)(*(void *)(a1 + 32) + 16) setPictureData:v6];
LABEL_5:
  id v9 = [*(id *)(a1 + 32) delegate];
  [v9 buddyControllerReleaseHold:*(void *)(a1 + 32)];
}

void sub_4330(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_4350(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t sub_4368()
{
  return v0;
}

void sub_5360(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) tableView];
  [v1 reloadData];
}

void sub_5624(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    if (v5)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      id v10 = v5;
      id v11 = *(void **)(v9 + 24);
      *(void *)(v9 + 24) = v10;
    }
    else
    {
      id v12 = objc_alloc_init((Class)_HKMedicalIDData);
      uint64_t v13 = *(void *)(a1 + 32);
      id v11 = *(void **)(v13 + 24);
      *(void *)(v13 + 24) = v12;
    }

    v8 = [*(id *)(a1 + 32) delegate];
    [v8 buddyControllerReleaseHold:*(void *)(a1 + 32)];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
      sub_6B14();
    }
    v8 = [*(id *)(a1 + 32) delegate];
    [v8 buddyControllerReleaseHoldAndSkip:*(void *)(a1 + 32)];
  }
}

id sub_5F48(uint64_t a1, char a2, uint64_t a3)
{
  _HKInitializeLogging();
  id v6 = HKLogMedicalID;
  if (a3 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
      sub_6B80(v6);
    }
  }
  else if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Successfully updated Medical ID Emergency Call", v8, 2u);
  }
  return [*(id *)(a1 + 32) completeMiniFlowStep];
}

void sub_6074(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    id v11 = objc_alloc_init((Class)HKHealthStore);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 8);
    *(void *)(v12 + 8) = v11;

    [*(id *)(*(void *)(a1 + 32) + 8) setProfileIdentifier:v8];
    [*(id *)(*(void *)(a1 + 32) + 8) resume];
    id v14 = [objc_alloc((Class)HKMedicalIDStore) initWithHealthStore:*(void *)(*(void *)(a1 + 32) + 8)];
    uint64_t v15 = *(void *)(a1 + 32);
    id v16 = *(void **)(v15 + 16);
    *(void *)(v15 + 16) = v14;

    uint64_t v17 = *(void *)(a1 + 32);
    v18 = *(void **)(v17 + 16);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_6280;
    v23[3] = &unk_C460;
    v23[4] = v17;
    char v24 = *(unsigned char *)(a1 + 40);
    [v18 fetchMedicalIDDataWithCompletion:v23];
  }
  else
  {
    if (v9)
    {
      _HKInitializeLogging();
      id v19 = (void *)HKLogMedicalID;
      if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        v21 = v19;
        v22 = [v7 pairingID];
        *(_DWORD *)buf = 138543874;
        uint64_t v26 = v20;
        __int16 v27 = 2114;
        v28 = v22;
        __int16 v29 = 2114;
        v30 = v10;
        _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get profile identifier for NRDevice UUID %{public}@, Error: %{public}@", buf, 0x20u);
      }
    }
    [*(id *)(a1 + 32) completeMiniFlowStep];
  }
}

void sub_6280(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    id v8 = v5;
    if (!v5) {
      id v8 = objc_alloc_init((Class)_HKMedicalIDData);
    }
    id v9 = v8;
    [v8 setShareDuringEmergency:*(unsigned __int8 *)(a1 + 40)];
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 16);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_639C;
    v12[3] = &unk_C438;
    v12[4] = v10;
    [v11 updateMedicalIDData:v9 completion:v12];
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
      sub_6B14();
    }
    [*(id *)(a1 + 32) completeMiniFlowStep];
  }
}

void sub_639C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
      sub_6BC4();
    }
  }
  [*(id *)(a1 + 32) completeMiniFlowStep];
}

void sub_6504(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) miniFlowDelegate];
  [v2 miniFlowStepComplete:*(void *)(a1 + 32)];
}

void sub_6668(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_6688(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 56);
  id v6 = a2;
  id v7 = [v4 pairingID];
  uint64_t v8 = *a3;
  int v9 = 138543874;
  uint64_t v10 = v5;
  __int16 v11 = 2114;
  uint64_t v12 = v7;
  __int16 v13 = 2114;
  uint64_t v14 = v8;
  _os_log_error_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get profile identifier for NRDevice UUID %{public}@, Error: %{public}@", (uint8_t *)&v9, 0x20u);
}

void sub_6754(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to fetch Medical ID, Error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_67CC(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get date of birth for Medical ID: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_6858(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to fetch FAFamilyMember Photo from Family framework, Error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_68D0(uint64_t a1, void *a2)
{
  sub_4350(a1, a2);
  [(id)sub_4368() bloodType];
  sub_4318();
  sub_4330(&dword_0, v3, v4, "Failed to persist Medical ID bloodType %ld to Health profile, Error: %{public}@", v5, v6, v7, v8, v9);
}

void sub_6958(uint64_t a1, void *a2)
{
  sub_4350(a1, a2);
  uint64_t v3 = [(id)sub_4368() height];
  sub_4318();
  sub_4330(&dword_0, v4, v5, "Failed to persist Medical ID height %@ to Health profile, Error: %{public}@", v6, v7, v8, v9, v10);
}

void sub_69EC(uint64_t a1, void *a2)
{
  sub_4350(a1, a2);
  uint64_t v3 = [(id)sub_4368() weight];
  sub_4318();
  sub_4330(&dword_0, v4, v5, "Failed to persist Medical ID weight %@ to Health profile, Error: %{public}@", v6, v7, v8, v9, v10);
}

void sub_6A80(uint64_t a1, void *a2)
{
  sub_4350(a1, a2);
  uint64_t v3 = [(id)sub_4368() gregorianBirthday];
  sub_4318();
  sub_4330(&dword_0, v4, v5, "Failed to persist Medical ID birthday %@ to Health profile, Error: %{public}@", v6, v7, v8, v9, v10);
}

void sub_6B14()
{
  sub_6650();
  sub_6668(&dword_0, v0, v1, "%{public}@ Failed to fetch Medical ID, Error: %{public}@");
}

void sub_6B80(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Did not successfully update Medical ID Emergency Call", v1, 2u);
}

void sub_6BC4()
{
  sub_6650();
  sub_6668(&dword_0, v0, v1, "%{public}@ Failed to update Medical ID, Error: %{public}@");
}

uint64_t BPSBridgeTintColor()
{
  return _BPSBridgeTintColor();
}

uint64_t BPSDetailTextColor()
{
  return _BPSDetailTextColor();
}

uint64_t BPSForegroundColor()
{
  return _BPSForegroundColor();
}

uint64_t BPSPillSelectedColor()
{
  return _BPSPillSelectedColor();
}

uint64_t BPSTextColor()
{
  return _BPSTextColor();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
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

id objc_msgSend__loadMedicalIDDataFromHealthStore(void *a1, const char *a2, ...)
{
  return [a1 _loadMedicalIDDataFromHealthStore];
}

id objc_msgSend__title(void *a1, const char *a2, ...)
{
  return [a1 _title];
}

id objc_msgSend__updateHealthProfileInformationFromMedicalIDData(void *a1, const char *a2, ...)
{
  return [a1 _updateHealthProfileInformationFromMedicalIDData];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
}

id objc_msgSend_bloodType(void *a1, const char *a2, ...)
{
  return [a1 bloodType];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return [a1 boldButton];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return [a1 buttonTray];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_completeMiniFlowStep(void *a1, const char *a2, ...)
{
  return [a1 completeMiniFlowStep];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_emergencyContacts(void *a1, const char *a2, ...)
{
  return [a1 emergencyContacts];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
}

id objc_msgSend_familyMember(void *a1, const char *a2, ...)
{
  return [a1 familyMember];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_gregorianBirthday(void *a1, const char *a2, ...)
{
  return [a1 gregorianBirthday];
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return [a1 healthStore];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_makeViewController(void *a1, const char *a2, ...)
{
  return [a1 makeViewController];
}

id objc_msgSend_medicalID(void *a1, const char *a2, ...)
{
  return [a1 medicalID];
}

id objc_msgSend_medicalIDStore(void *a1, const char *a2, ...)
{
  return [a1 medicalIDStore];
}

id objc_msgSend_medicalIDV2(void *a1, const char *a2, ...)
{
  return [a1 medicalIDV2];
}

id objc_msgSend_miniFlowDelegate(void *a1, const char *a2, ...)
{
  return [a1 miniFlowDelegate];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_phoneNumber(void *a1, const char *a2, ...)
{
  return [a1 phoneNumber];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_setupFlowUserInfo(void *a1, const char *a2, ...)
{
  return [a1 setupFlowUserInfo];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardConfiguration(void *a1, const char *a2, ...)
{
  return [a1 standardConfiguration];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_termsOfAddress(void *a1, const char *a2, ...)
{
  return [a1 termsOfAddress];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_updateTableViewHeight(void *a1, const char *a2, ...)
{
  return [a1 updateTableViewHeight];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_weight(void *a1, const char *a2, ...)
{
  return [a1 weight];
}