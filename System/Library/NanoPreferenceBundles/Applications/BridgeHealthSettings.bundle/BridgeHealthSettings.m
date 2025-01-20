void sub_3FC4(void *a1)
{
  id v1;
  double v2;
  double v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  unsigned char v15[128];

  v1 = a1;
  [v1 frame];
  if (v3 < 1.0 && v2 > 1.0)
  {
    v5 = +[UIColor colorWithRed:0.149019608 green:0.149019608 blue:0.149019608 alpha:1.0];
    [v1 setBackgroundColor:v5];
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = objc_msgSend(v1, "subviews", 0);
  v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    v8 = v7;
    v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        sub_3FC4(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

id sub_4600(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) lastPullDate];

  v3 = *(void **)(a1 + 40);
  if (v2)
  {
    return objc_msgSend(v3, "_mainQueue_stopActivityIndicator");
  }
  else
  {
    return objc_msgSend(v3, "_mainQueue_startActivityIndicator");
  }
}

void sub_4BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_4BC8(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  v6 = [v4 firstName];
  v7 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = [WeakRetained dataSource];
  [v9 setFirstName:v6];

  v10 = [*(id *)(a1 + 32) activeTinkerDevice];
  id v11 = objc_loadWeakRetained(v7);
  v12 = [v11 dataSource];
  [v12 setActiveTinkerDevice:v10];

  id v13 = objc_loadWeakRetained(v7);
  v14 = [v13 getCellForIndexPath:v5];

  return v14;
}

id sub_4FB0(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_502C;
  v2[3] = &unk_184F0;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView performWithoutAnimation:v2];
}

void sub_502C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  [v2 beginUpdates];

  [*(id *)(*(void *)(a1 + 32) + 224) setNeedsLayout];
  id v3 = [*(id *)(a1 + 32) tableView];
  [v3 endUpdates];
}

void sub_63B8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6480;
  block[3] = &unk_18518;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_6480(uint64_t a1)
{
  CFStringRef v2 = *(const __CFString **)(a1 + 32);
  if (!v2)
  {
    _HKInitializeLogging();
    id v3 = HKLogDatabase;
    if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_ERROR)) {
      sub_E2D0(a1, v3);
    }
    CFStringRef v2 = *(const __CFString **)(a1 + 32);
  }
  if (v2) {
    CFStringRef v4 = v2;
  }
  else {
    CFStringRef v4 = &stru_18860;
  }
  [*(id *)(a1 + 40) setFirstName:v4];
  return [*(id *)(a1 + 40) setLoadingDisplayNameForTinker:0];
}

void sub_6868(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)HKLogMedicalID;
    if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
      sub_E3C0(a1, v6, (uint64_t)v5);
    }
  }
}

void sub_72F8(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  CFStringRef v2 = (void *)qword_1F068;
  qword_1F068 = (uint64_t)v1;

  [(id)qword_1F068 setTimeStyle:0];
  id v3 = (void *)qword_1F068;

  [v3 setDateStyle:2];
}

void sub_82AC(id a1, UIAlertAction *a2)
{
  id v2 = +[MCProfileConnection sharedConnection];
  [v2 setWheelchairDataSubmissionAllowed:1];
}

void sub_82F8(uint64_t a1)
{
  id v2 = objc_opt_new();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_840C;
  v8[3] = &unk_184F0;
  v8[4] = *(void *)(a1 + 32);
  [v2 setOnDismiss:v8];
  id v3 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v2];
  CFStringRef v4 = +[UIApplication sharedApplication];
  id v5 = [v4 windows];
  id v6 = [v5 firstObject];
  id v7 = [v6 rootViewController];
  [v7 presentViewController:v3 animated:1 completion:0];
}

id sub_840C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestWheelchairDiagnosticsSubmissionIfNecessary];
}

void sub_8414(id a1, UIAlertAction *a2)
{
  id v2 = +[MCProfileConnection sharedConnection];
  [v2 setWheelchairDataSubmissionAllowed:0];
}

void sub_9110(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  uint64_t v2 = qword_1F078;
  qword_1F078 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_9630(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_9670(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_99D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_99F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _medicalIDDidChangeNotificationReceived];
}

void sub_AACC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) healthStore];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_AB5C;
  v3[3] = &unk_18568;
  v3[4] = *(void *)(a1 + 32);
  [v2 forceCloudSyncDataUploadForProfileWithCompletion:v3];
}

void sub_AB5C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v6 = (void *)HKLogMedicalID;
    if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
      sub_E6E0(a1, v6);
    }
  }
}

void sub_B4B8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B55C;
  block[3] = &unk_186E0;
  uint64_t v6 = *(void *)(a1 + 32);
  char v10 = a2;
  void block[4] = v6;
  id v9 = v5;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_B55C(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  *(unsigned char *)(*(void *)(a1 + 32) + 200) = 0;
  if (*(unsigned char *)(a1 + 48))
  {
    _HKInitializeLogging();
    uint64_t v2 = HKLogSync;
    if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Successfully tore down sharing.", v6, 2u);
    }
    id WeakRetained = objc_loadWeakRetained((id *)*v1 + 28);
    [WeakRetained didSuccessfullyTearDownSharing];
  }
  else
  {
    CFStringRef v4 = [*v1 table];
    [v4 reloadData];

    _HKInitializeLogging();
    id v5 = (void *)HKLogSync;
    if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_ERROR)) {
      sub_E7F4(v1, v5);
    }
  }
}

id sub_B868(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_B960(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v6 = a2;
  id v7 = a4;
  CFStringRef v8 = v6;
  if (!v6)
  {
    _HKInitializeLogging();
    id v9 = HKLogDatabase;
    if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_ERROR)) {
      sub_E8E8(a1, (uint64_t)v7, v9);
    }
    CFStringRef v8 = &stru_18860;
  }
  [*(id *)(a1 + 32) setFirstName:v8];
  char v10 = [*(id *)(a1 + 32) medicalIDStore];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_BA60;
  v11[3] = &unk_18708;
  v11[4] = *(void *)(a1 + 32);
  [v10 fetchMedicalIDDataWithCompletion:v11];
}

void sub_BA60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BB2C;
  block[3] = &unk_18518;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_BB2C(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    _HKInitializeLogging();
    uint64_t v2 = (void *)HKLogMedicalID;
    if (os_log_type_enabled(HKLogMedicalID, OS_LOG_TYPE_ERROR)) {
      sub_E974(a1, v2);
    }
  }
  [*(id *)(a1 + 40) setShouldShowSetupMedicalID:*(void *)(a1 + 48) == 0];
  [*(id *)(a1 + 40) setLoadingProfileData:0];
  [*(id *)(a1 + 40) setMedicalIDData:*(void *)(a1 + 48)];
  return [*(id *)(a1 + 40) reloadSpecifiers];
}

void sub_BF6C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_C40C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v1 = [WeakRetained navigationController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

void sub_C4E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v3 = [WeakRetained view];
  [v3 removeFromSuperview];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v5 = [v4 parentViewController];
  [v5 viewDidLoad];

  id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  id v6 = [v7 navigationController];
  [v6 dismissViewControllerAnimated:1 completion:0];
}

void sub_C6EC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 192);
  *(void *)(v7 + 192) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 200);
  *(void *)(v9 + 200) = v6;
  id v11 = v6;

  [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_CEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_CF14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_CF24(uint64_t a1)
{
}

void sub_CF2C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_CF8C(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_CFEC(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

void sub_D0F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)HKLogSync;
    if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_ERROR)) {
      sub_EA38(a1, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_D288(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    _HKInitializeLogging();
    uint64_t v7 = (void *)HKLogSync;
    if (os_log_type_enabled(HKLogSync, OS_LOG_TYPE_ERROR)) {
      sub_EAD4(a1, v7);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_D394(id a1)
{
  return a1;
}

void sub_D768(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 appleID];

  if (v6 || !v7)
  {
    _HKInitializeLogging();
    id v8 = (void *)HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      v17 = v8;
      v18 = [v5 appleID];
      v19 = [*(id *)(a1 + 32) activeTinkerDevice];
      v20 = [v19 pairingID];
      *(_DWORD *)buf = 138544130;
      uint64_t v24 = v16;
      __int16 v25 = 2114;
      v26 = v18;
      __int16 v27 = 2114;
      v28 = v20;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_error_impl(&dword_0, v17, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch family member %{public}@ for pairingID %{public}@, %{public}@", buf, 0x2Au);
    }
  }
  id v9 = objc_alloc((Class)HKProfileStore);
  id v10 = objc_alloc_init((Class)HKHealthStore);
  id v11 = [v9 initWithHealthStore:v10];

  id v12 = [*(id *)(a1 + 32) activeTinkerDevice];
  id v13 = [v12 pairingID];
  id v14 = [v5 appleID];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_D9A8;
  v21[3] = &unk_187F8;
  v21[4] = *(void *)(a1 + 32);
  id v22 = v5;
  id v15 = v5;
  [v11 fetchProfileIdentifierForNRDeviceUUID:v13 ownerAppleID:v14 completion:v21];
}

void sub_D9A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_DA80;
  v10[3] = &unk_187D0;
  uint64_t v7 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v7;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

id sub_DA80(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "_mainQueue_stopActivityIndicator");
  if (*(void *)(v2 + 8))
  {
    id v3 = objc_alloc_init((Class)HKHealthStore);
    [*(id *)(a1 + 32) setHealthStore:v3];

    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [*(id *)(a1 + 32) healthStore];
    [v5 setProfileIdentifier:v4];

    id v6 = [*(id *)(a1 + 32) healthStore];
    [v6 resume];
  }
  else
  {
    [*(id *)v2 setHealthStore:0];
    _HKInitializeLogging();
    uint64_t v7 = (void *)HKLogDatabase;
    if (os_log_type_enabled(HKLogDatabase, OS_LOG_TYPE_ERROR)) {
      sub_EB70((void **)v2, v7, a1);
    }
  }
  [*(id *)v2 setLoadingHealthStore:0];
  return [*(id *)v2 _addExpectedHealthSettingsViewAsChildViewController];
}

void sub_E268()
{
  sub_964C();
  sub_9630(&dword_0, v0, v1, "Failed to get Cardio Fitness Medications Use status: %@", v2, v3, v4, v5, v6);
}

void sub_E2D0(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 138543618;
  uint64_t v5 = v2;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get profile display name, error : %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_E358()
{
  sub_964C();
  sub_9630(&dword_0, v0, v1, "Error setting birthdate: %@", v2, v3, v4, v5, v6);
}

void sub_E3C0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  uint8_t v6 = [v4 healthStore];
  uint64_t v7 = [v6 profileIdentifier];
  int v8 = 138543874;
  id v9 = v4;
  __int16 v10 = 2114;
  id v11 = v7;
  __int16 v12 = 2114;
  uint64_t v13 = a3;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to force cloud sync data upload for profile identifier %{public}@, Error: %{public}@", (uint8_t *)&v8, 0x20u);
}

void sub_E4A0()
{
  sub_964C();
  sub_9630(&dword_0, v0, v1, "[HPRF] Failed to get Wheelchair Condition: %@", v2, v3, v4, v5, v6);
}

void sub_E508()
{
  sub_964C();
  sub_9630(&dword_0, v0, v1, "[HPRF] Failed to get date of birth: %@", v2, v3, v4, v5, v6);
}

void sub_E570()
{
  sub_964C();
  sub_9630(&dword_0, v0, v1, "[HPRF] Failed to get biological sex: %@", v2, v3, v4, v5, v6);
}

void sub_E5D8(void *a1, const char *a2)
{
  id v3 = a1;
  uint64_t v4 = NSStringFromSelector(a2);
  sub_9658();
  sub_9670(&dword_0, v5, v6, "%@ error: %@", v7, v8, v9, v10, v11);
}

void sub_E678()
{
  sub_964C();
  sub_9630(&dword_0, v0, v1, "Failed to get height characteristic: %@", v2, v3, v4, v5, v6);
}

void sub_E6E0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 healthStore];
  uint8_t v11 = [v4 profileIdentifier];
  sub_BF6C(&dword_0, v5, v6, "%{public}@ Failed to force cloud sync data upload for profile identifier %{public}@, Error: %{public}@", v7, v8, v9, v10, 2u);
}

void sub_E7B0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to create profile URL", v1, 2u);
}

void sub_E7F4(void **a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = *a1;
  id v6 = v4;
  uint64_t v7 = [v5 activeTinkerDevice];
  uint64_t v8 = [v7 pairingID];
  int v9 = 138543874;
  uint64_t v10 = v4;
  sub_BF54();
  _os_log_error_impl(&dword_0, v3, OS_LOG_TYPE_ERROR, "[sharing-setup] %{public}@ Failed to tear down Health Sharing With Tinker Device NRUUID %{public}@, Error: %{public}@", (uint8_t *)&v9, 0x20u);
}

void sub_E8E8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to get profile display name, error : %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_E974(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 40);
  id v3 = a2;
  int v4 = [v2 healthStore];
  uint64_t v5 = [v4 profileIdentifier];
  sub_BF54();
  sub_BF6C(&dword_0, v6, v7, "%{public}@ Error fetching medical id data for profile identifier %{public}@, Error: %{public}@", v8, v9, v10, v11, 2u);
}

void sub_EA38(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = sub_D394(v3);
  sub_9670(&dword_0, v5, v6, "[sharing-setup] %{public}@ Failed to fetch tinker family member with error: %{public}@", v7, v8, v9, v10, v11);
}

void sub_EAD4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_opt_class();
  id v4 = sub_D394(v3);
  sub_9670(&dword_0, v5, v6, "[sharing-setup] %{public}@ Failed to fetch active tinker family member with error : %{public}@", v7, v8, v9, v10, v11);
}

void sub_EB70(void **a1, void *a2, uint64_t a3)
{
  id v4 = *a1;
  uint64_t v5 = a2;
  uint64_t v6 = [v4 activeTinkerDevice];
  uint64_t v7 = [v6 pairingID];
  uint64_t v8 = [*(id *)(a3 + 48) appleID];
  uint64_t v9 = *(void *)(a3 + 56);
  int v10 = 138544130;
  uint8_t v11 = v4;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  __int16 v14 = 2114;
  id v15 = v8;
  __int16 v16 = 2114;
  uint64_t v17 = v9;
  _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "%{public}@ Profile identifier is Nil for NRDeviceUUID %{public}@, appleID %{public}@, %{public}@", (uint8_t *)&v10, 0x2Au);
}

uint64_t BPSBridgeTintColor()
{
  return _BPSBridgeTintColor();
}

uint64_t HKErrorTableViewCell()
{
  return _HKErrorTableViewCell();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__addExpectedHealthSettingsViewAsChildViewController(void *a1, const char *a2, ...)
{
  return [a1 _addExpectedHealthSettingsViewAsChildViewController];
}

id objc_msgSend__backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 _backgroundColor];
}

id objc_msgSend__birthdayDescription(void *a1, const char *a2, ...)
{
  return [a1 _birthdayDescription];
}

id objc_msgSend__checkmarkedCircleImageView(void *a1, const char *a2, ...)
{
  return [a1 _checkmarkedCircleImageView];
}

id objc_msgSend__circleImageView(void *a1, const char *a2, ...)
{
  return [a1 _circleImageView];
}

id objc_msgSend__createBetaBlockerCheckMarkCell(void *a1, const char *a2, ...)
{
  return [a1 _createBetaBlockerCheckMarkCell];
}

id objc_msgSend__createCalciumChannelBlockerCheckMarkCell(void *a1, const char *a2, ...)
{
  return [a1 _createCalciumChannelBlockerCheckMarkCell];
}

id objc_msgSend__createCells(void *a1, const char *a2, ...)
{
  return [a1 _createCells];
}

id objc_msgSend__createDismissButton(void *a1, const char *a2, ...)
{
  return [a1 _createDismissButton];
}

id objc_msgSend__createPickers(void *a1, const char *a2, ...)
{
  return [a1 _createPickers];
}

id objc_msgSend__createTextView(void *a1, const char *a2, ...)
{
  return [a1 _createTextView];
}

id objc_msgSend__fetchFamilyCircle(void *a1, const char *a2, ...)
{
  return [a1 _fetchFamilyCircle];
}

id objc_msgSend__healthDataGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _healthDataGroupSpecifier];
}

id objc_msgSend__healthDataTinkerGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _healthDataTinkerGroupSpecifier];
}

id objc_msgSend__healthProfileSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _healthProfileSpecifier];
}

id objc_msgSend__heightPickerUpdated(void *a1, const char *a2, ...)
{
  return [a1 _heightPickerUpdated];
}

id objc_msgSend__isTinkerDevice(void *a1, const char *a2, ...)
{
  return [a1 _isTinkerDevice];
}

id objc_msgSend__loadDisplayNameForTinker(void *a1, const char *a2, ...)
{
  return [a1 _loadDisplayNameForTinker];
}

id objc_msgSend__loadHealthStoreForActiveDevice(void *a1, const char *a2, ...)
{
  return [a1 _loadHealthStoreForActiveDevice];
}

id objc_msgSend__loadProfileData(void *a1, const char *a2, ...)
{
  return [a1 _loadProfileData];
}

id objc_msgSend__loadingMedicalIDSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _loadingMedicalIDSpecifier];
}

id objc_msgSend__medicalIDDidChangeNotificationReceived(void *a1, const char *a2, ...)
{
  return [a1 _medicalIDDidChangeNotificationReceived];
}

id objc_msgSend__medicalIDSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _medicalIDSpecifier];
}

id objc_msgSend__minDate(void *a1, const char *a2, ...)
{
  return [a1 _minDate];
}

id objc_msgSend__requestWheelchairDiagnosticsSubmissionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _requestWheelchairDiagnosticsSubmissionIfNecessary];
}

id objc_msgSend__resetSelectedCell(void *a1, const char *a2, ...)
{
  return [a1 _resetSelectedCell];
}

id objc_msgSend__setDefaultValuesOnBirthdayPickerIfRequired(void *a1, const char *a2, ...)
{
  return [a1 _setDefaultValuesOnBirthdayPickerIfRequired];
}

id objc_msgSend__setDefaultValuesOnHeightPickerIfRequired(void *a1, const char *a2, ...)
{
  return [a1 _setDefaultValuesOnHeightPickerIfRequired];
}

id objc_msgSend__setDefaultValuesOnWeightPickerIfRequired(void *a1, const char *a2, ...)
{
  return [a1 _setDefaultValuesOnWeightPickerIfRequired];
}

id objc_msgSend__setHeightAndWeightProperties(void *a1, const char *a2, ...)
{
  return [a1 _setHeightAndWeightProperties];
}

id objc_msgSend__setNavigationButtonsOnEditCompletion(void *a1, const char *a2, ...)
{
  return [a1 _setNavigationButtonsOnEditCompletion];
}

id objc_msgSend__setNavigationButtonsToEnableEditing(void *a1, const char *a2, ...)
{
  return [a1 _setNavigationButtonsToEnableEditing];
}

id objc_msgSend__setUpMedicalIDSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _setUpMedicalIDSpecifier];
}

id objc_msgSend__setupCloudSyncObserverForTinkerProfile(void *a1, const char *a2, ...)
{
  return [a1 _setupCloudSyncObserverForTinkerProfile];
}

id objc_msgSend__startSharingTinkerDataGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _startSharingTinkerDataGroupSpecifier];
}

id objc_msgSend__startSharingTinkerDataSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _startSharingTinkerDataSpecifier];
}

id objc_msgSend__stopReceivingSharedHealthDataGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _stopReceivingSharedHealthDataGroupSpecifier];
}

id objc_msgSend__stoppedReceivingSharedHealthDataSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _stoppedReceivingSharedHealthDataSpecifier];
}

id objc_msgSend__textColor(void *a1, const char *a2, ...)
{
  return [a1 _textColor];
}

id objc_msgSend__updateHeight(void *a1, const char *a2, ...)
{
  return [a1 _updateHeight];
}

id objc_msgSend__updateUserCharacteristics(void *a1, const char *a2, ...)
{
  return [a1 _updateUserCharacteristics];
}

id objc_msgSend__updateWeight(void *a1, const char *a2, ...)
{
  return [a1 _updateWeight];
}

id objc_msgSend__viewMedicalIDSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _viewMedicalIDSpecifier];
}

id objc_msgSend__viewPrimaryDataGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _viewPrimaryDataGroupSpecifier];
}

id objc_msgSend__viewPrimaryDataSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _viewPrimaryDataSpecifier];
}

id objc_msgSend__viewTinkerDataGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _viewTinkerDataGroupSpecifier];
}

id objc_msgSend__viewTinkerDataSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _viewTinkerDataSpecifier];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_activeTinkerDevice(void *a1, const char *a2, ...)
{
  return [a1 activeTinkerDevice];
}

id objc_msgSend_allowsSelection(void *a1, const char *a2, ...)
{
  return [a1 allowsSelection];
}

id objc_msgSend_appleID(void *a1, const char *a2, ...)
{
  return [a1 appleID];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return [a1 beginUpdates];
}

id objc_msgSend_biologicalSex(void *a1, const char *a2, ...)
{
  return [a1 biologicalSex];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cachedPairingParentFamilyMember(void *a1, const char *a2, ...)
{
  return [a1 cachedPairingParentFamilyMember];
}

id objc_msgSend_cachedTinkerFamilyMemeber(void *a1, const char *a2, ...)
{
  return [a1 cachedTinkerFamilyMemeber];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentSnapshot(void *a1, const char *a2, ...)
{
  return [a1 currentSnapshot];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return [a1 detailTextLabel];
}

id objc_msgSend_didSuccessfullyTearDownSharing(void *a1, const char *a2, ...)
{
  return [a1 didSuccessfullyTearDownSharing];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return [a1 endUpdates];
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

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return [a1 grayColor];
}

id objc_msgSend_hasWheelchairDataSubmissionAllowedBeenSet(void *a1, const char *a2, ...)
{
  return [a1 hasWheelchairDataSubmissionAllowedBeenSet];
}

id objc_msgSend_healthAppHiddenOrNotInstalled(void *a1, const char *a2, ...)
{
  return [a1 healthAppHiddenOrNotInstalled];
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return [a1 healthStore];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inchUnit(void *a1, const char *a2, ...)
{
  return [a1 inchUnit];
}

id objc_msgSend_initializeView(void *a1, const char *a2, ...)
{
  return [a1 initializeView];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interactivePopGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 interactivePopGestureRecognizer];
}

id objc_msgSend_isDiagnosticSubmissionAllowed(void *a1, const char *a2, ...)
{
  return [a1 isDiagnosticSubmissionAllowed];
}

id objc_msgSend_isHealthChecklistAvailable(void *a1, const char *a2, ...)
{
  return [a1 isHealthChecklistAvailable];
}

id objc_msgSend_lastPullDate(void *a1, const char *a2, ...)
{
  return [a1 lastPullDate];
}

id objc_msgSend_lengthFormatter(void *a1, const char *a2, ...)
{
  return [a1 lengthFormatter];
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return [a1 lineHeight];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return [a1 locale];
}

id objc_msgSend_localizedPaneTitle(void *a1, const char *a2, ...)
{
  return [a1 localizedPaneTitle];
}

id objc_msgSend_massFormatter(void *a1, const char *a2, ...)
{
  return [a1 massFormatter];
}

id objc_msgSend_medicalIDStore(void *a1, const char *a2, ...)
{
  return [a1 medicalIDStore];
}

id objc_msgSend_medicalIDV2(void *a1, const char *a2, ...)
{
  return [a1 medicalIDV2];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_newAge(void *a1, const char *a2, ...)
{
  return [a1 newAge];
}

id objc_msgSend_numberFormatter(void *a1, const char *a2, ...)
{
  return [a1 numberFormatter];
}

id objc_msgSend_onDismiss(void *a1, const char *a2, ...)
{
  return [a1 onDismiss];
}

id objc_msgSend_pairingID(void *a1, const char *a2, ...)
{
  return [a1 pairingID];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_poundUnit(void *a1, const char *a2, ...)
{
  return [a1 poundUnit];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_profileIdentifier(void *a1, const char *a2, ...)
{
  return [a1 profileIdentifier];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
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

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_sectionIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 sectionIdentifiers];
}

id objc_msgSend_setCardioFitnessMedicationCheckmarks(void *a1, const char *a2, ...)
{
  return [a1 setCardioFitnessMedicationCheckmarks];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setupDataSource(void *a1, const char *a2, ...)
{
  return [a1 setupDataSource];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return [a1 sharedBehavior];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedFormatter(void *a1, const char *a2, ...)
{
  return [a1 sharedFormatter];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldShowWarning(void *a1, const char *a2, ...)
{
  return [a1 shouldShowWarning];
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return [a1 snapshot];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_standardConfiguration(void *a1, const char *a2, ...)
{
  return [a1 standardConfiguration];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startObservingSyncStatus(void *a1, const char *a2, ...)
{
  return [a1 startObservingSyncStatus];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return [a1 success];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_takingBetaBlockers(void *a1, const char *a2, ...)
{
  return [a1 takingBetaBlockers];
}

id objc_msgSend_takingCalciumChannelBlockers(void *a1, const char *a2, ...)
{
  return [a1 takingCalciumChannelBlockers];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_updateEmergencyContacts(void *a1, const char *a2, ...)
{
  return [a1 updateEmergencyContacts];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewDidLoad(void *a1, const char *a2, ...)
{
  return [a1 viewDidLoad];
}

id objc_msgSend_wheelchairUse(void *a1, const char *a2, ...)
{
  return [a1 wheelchairUse];
}

id objc_msgSend_wheelchairUseChanged(void *a1, const char *a2, ...)
{
  return [a1 wheelchairUseChanged];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return [a1 windows];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}